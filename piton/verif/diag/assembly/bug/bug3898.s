// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: bug3898.s
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
   random seed:	866058349
   Jal flush.j:	
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
        setx  0x0000000000000330, %g1, %r17
        setx  0xbc239a9e3a2dc598, %g1, %r0
        setx  0xf5717c850cfd9216, %g1, %r1
        setx  0x97b009949c789a35, %g1, %r2
        setx  0x833de4418da26503, %g1, %r3
        setx  0x729f180931a0be35, %g1, %r4
        setx  0x4ab3b13a339b1658, %g1, %r5
        setx  0xea1f141c3fbeb011, %g1, %r6
        setx  0xb7406313a5a49eed, %g1, %r7
        setx  0x7bc6dc45edcf63a6, %g1, %r8
        setx  0x4d4cf5d78a5a20b6, %g1, %r9
        setx  0x797fd093334f476a, %g1, %r10
        setx  0x46e6a16665cf9fb4, %g1, %r11
        setx  0xb241da842d880e7b, %g1, %r12
        setx  0x50a1952330869d01, %g1, %r13
        setx  0x877b5e98c22ea67d, %g1, %r14
        setx  0xa8ce215d074903a1, %g1, %r15
        setx  0x98c4cf4f7190d547, %g1, %r18
        setx  0x79c3b2787e27dbd6, %g1, %r19
        setx  0xe379c3dc9dfbdbc1, %g1, %r20
        setx  0x59bdf7a3e6da0278, %g1, %r21
        setx  0x69fdc80602f9a285, %g1, %r22
        setx  0x678ae6210f69941f, %g1, %r23
        setx  0x958dad62d348be6e, %g1, %r24
        setx  0x91f8cb5be3b4652e, %g1, %r25
        setx  0x4df216a56e9b0533, %g1, %r26
        setx  0xfe8454f7ff4712b5, %g1, %r27
        setx  0x417d5f5cc53a6d98, %g1, %r28
        setx  0x4929ab42761f3ada, %g1, %r29
        setx  0x3b4b2649d8f938a5, %g1, %r30
        setx  0xbb5e901ae09edf8d, %g1, %r31
	save %r0, %r0, %r31
        setx  MAIN_BASE_DATA_VA, %r1, %r16
        setx  0x0000000000000410, %g1, %r17
        setx  0x0fc0e6fcf248a505, %g1, %r0
        setx  0xe7cc6cf245cdf027, %g1, %r1
        setx  0xd55cc94f5d9e31dc, %g1, %r2
        setx  0x25d6bbdac381bd7e, %g1, %r3
        setx  0x3e47f51a9e71beff, %g1, %r4
        setx  0xb4b0cbdf5a082874, %g1, %r5
        setx  0x82a95af6483a7b67, %g1, %r6
        setx  0xfe3faf6686e2a42c, %g1, %r7
        setx  0x2d6a385e1683d006, %g1, %r8
        setx  0xe36b1b83a0d84c53, %g1, %r9
        setx  0x22bf01d714c3c5bc, %g1, %r10
        setx  0x72962ce3ef2020a3, %g1, %r11
        setx  0x6a1c68e2dd92b5bc, %g1, %r12
        setx  0xe932599d18891b10, %g1, %r13
        setx  0xbd8497a0e90b406a, %g1, %r14
        setx  0xa47e47ad18e99fc9, %g1, %r15
        setx  0xd6f626b7894adad2, %g1, %r18
        setx  0xbd5af955cf481d58, %g1, %r19
        setx  0x17f403e7c120b3df, %g1, %r20
        setx  0xe2d90583b961f90e, %g1, %r21
        setx  0xb66dcbaa202ba6d6, %g1, %r22
        setx  0x2238f59c33bf1797, %g1, %r23
        setx  0x3024840fb5734a63, %g1, %r24
        setx  0xa7115728348b546c, %g1, %r25
        setx  0x9abac23e3ca274f6, %g1, %r26
        setx  0xe0fa4f548331aab3, %g1, %r27
        setx  0xadf61d57ccd4dd77, %g1, %r28
        setx  0x3c6eee79c32d5d33, %g1, %r29
        setx  0xcdd363b7741648a8, %g1, %r30
        setx  0x8c972e48436c6a44, %g1, %r31
	save %r0, %r0, %r31
        setx  MAIN_BASE_DATA_VA, %r1, %r16
        setx  0x0000000000000790, %g1, %r17
        setx  0x57a9cbb8d8db011c, %g1, %r0
        setx  0x2e9965658eacf786, %g1, %r1
        setx  0xa70af952cd489882, %g1, %r2
        setx  0xaa78d7c452e08550, %g1, %r3
        setx  0x1117dd543e7f5139, %g1, %r4
        setx  0x73eff591734cc137, %g1, %r5
        setx  0x2d4c5c23f4b32d0d, %g1, %r6
        setx  0xa6d536a4fe12e6a1, %g1, %r7
        setx  0xc0aadac4ae2ca3a4, %g1, %r8
        setx  0x8050096152a7ef70, %g1, %r9
        setx  0x27e001eea0572849, %g1, %r10
        setx  0x8b7a13941103399e, %g1, %r11
        setx  0x04b24fad7efa9c69, %g1, %r12
        setx  0x25f2eb2e7385b53b, %g1, %r13
        setx  0xebbe164927a9567c, %g1, %r14
        setx  0xa7ccee7770f98324, %g1, %r15
        setx  0xbed0058a535b4ed4, %g1, %r18
        setx  0xfc1e582ba8f8f0da, %g1, %r19
        setx  0x88a86f781a31a270, %g1, %r20
        setx  0x08dde636a5cc5ff3, %g1, %r21
        setx  0xa903db70d35bbe32, %g1, %r22
        setx  0x26526f3802e4d790, %g1, %r23
        setx  0x51e35702ee1defad, %g1, %r24
        setx  0xfe8cd721aef0c247, %g1, %r25
        setx  0x5a404fa280d625fd, %g1, %r26
        setx  0xfef8f7a467654df3, %g1, %r27
        setx  0x755988d9c4f7dd4e, %g1, %r28
        setx  0xaea5077751f8479f, %g1, %r29
        setx  0xcc657f9bf60f605c, %g1, %r30
        setx  0xd596df62c21214f3, %g1, %r31
	save %r0, %r0, %r31
        setx  MAIN_BASE_DATA_VA, %r1, %r16
        setx  0x0000000000000cb0, %g1, %r17
        setx  0x10443f7acf39aae6, %g1, %r0
        setx  0x913b6dabccbf2a3b, %g1, %r1
        setx  0x2c37fb2a7d4ed131, %g1, %r2
        setx  0x73940c3fa709e041, %g1, %r3
        setx  0x1ff103f96033ffa6, %g1, %r4
        setx  0xde26ed995fd0f5d3, %g1, %r5
        setx  0xa5bfe362c14ef985, %g1, %r6
        setx  0xe8585ae055068e96, %g1, %r7
        setx  0xfd08a658de432fcd, %g1, %r8
        setx  0x150f07093c578918, %g1, %r9
        setx  0x2741bed80df31770, %g1, %r10
        setx  0x34bd3a9125197611, %g1, %r11
        setx  0x6d5853dfce85e58f, %g1, %r12
        setx  0x0b04dfd99f3a1423, %g1, %r13
        setx  0x971d1fc952b31a4f, %g1, %r14
        setx  0xfaefc3995339e84c, %g1, %r15
        setx  0xa45efc33f571eb2c, %g1, %r18
        setx  0xdf73b95cd525beb6, %g1, %r19
        setx  0x8da1989915773c0b, %g1, %r20
        setx  0x6ece67ea8dc88a39, %g1, %r21
        setx  0x40546ee025ec4421, %g1, %r22
        setx  0xccce2d3c8776fc8d, %g1, %r23
        setx  0xa22e5b81d7fd7ef0, %g1, %r24
        setx  0x3c337d7fd18baf9b, %g1, %r25
        setx  0xb7c5518f0867bfa4, %g1, %r26
        setx  0xb8e685aac16bf6da, %g1, %r27
        setx  0xa6bc6d046d0d8c77, %g1, %r28
        setx  0xc1d8fdcd86e00db4, %g1, %r29
        setx  0x31c19e0e07814ef3, %g1, %r30
        setx  0xf12a2843b9cb8687, %g1, %r31
	save %r0, %r0, %r31
        setx  MAIN_BASE_DATA_VA, %r1, %r16
        setx  0x0000000000000a00, %g1, %r17
        setx  0x72225c36bb32ee43, %g1, %r0
        setx  0xfd6df2003e437b1f, %g1, %r1
        setx  0xfbfc68f617e58132, %g1, %r2
        setx  0xe7e524e1faf4e95a, %g1, %r3
        setx  0x46a2e145af664c6d, %g1, %r4
        setx  0x421fd250f5a8bdac, %g1, %r5
        setx  0xfa7e22af33432b4f, %g1, %r6
        setx  0xdd5ada4532be0fb8, %g1, %r7
        setx  0x6efe0520e510f8ff, %g1, %r8
        setx  0xd7fda578a12f7260, %g1, %r9
        setx  0x04630fd8fe5d6bb4, %g1, %r10
        setx  0x6b4d078d45fb962a, %g1, %r11
        setx  0x6e24dac2d35c87e7, %g1, %r12
        setx  0x52dd39b41e22d87d, %g1, %r13
        setx  0x83eb1d37a056fe93, %g1, %r14
        setx  0x302784dca670ca61, %g1, %r15
        setx  0xf02464f1d0e5a332, %g1, %r18
        setx  0x23aeacb7a43f01c4, %g1, %r19
        setx  0xb3ee2e49903a4843, %g1, %r20
        setx  0xf1a89bec8ad9f7c5, %g1, %r21
        setx  0xc911a1d8979933c1, %g1, %r22
        setx  0x601ca76d7aa53baf, %g1, %r23
        setx  0xf5be107e2bf80bf5, %g1, %r24
        setx  0x625d6ab5b05307b6, %g1, %r25
        setx  0xe8c585618a238371, %g1, %r26
        setx  0x1bd523ef175dbd4f, %g1, %r27
        setx  0x2a405ef98bdcec37, %g1, %r28
        setx  0xb169c10a34b0aea5, %g1, %r29
        setx  0xda42d4e9cdb37325, %g1, %r30
        setx  0xc26c68f018fbcb57, %g1, %r31
	save %r0, %r0, %r31
        setx  MAIN_BASE_DATA_VA, %r1, %r16
        setx  0x0000000000000c00, %g1, %r17
        setx  0xd44fedd7a56209f4, %g1, %r0
        setx  0x59251febb2eb9338, %g1, %r1
        setx  0xe176b3a8aef18c21, %g1, %r2
        setx  0x4023ca4507f295db, %g1, %r3
        setx  0x3d7e84e4b9c1eba3, %g1, %r4
        setx  0x35e75d82e02b4d1e, %g1, %r5
        setx  0xcb820dfd27845eb1, %g1, %r6
        setx  0x88e555aa2d4a1307, %g1, %r7
        setx  0x78407506d9189c6d, %g1, %r8
        setx  0x404274914e1c2213, %g1, %r9
        setx  0xf3e4792669eaed63, %g1, %r10
        setx  0x93019ad98dd62ddd, %g1, %r11
        setx  0x65cb21a0463feed0, %g1, %r12
        setx  0xef184906bfaad3bc, %g1, %r13
        setx  0x45ee9c86c56b7886, %g1, %r14
        setx  0xd463970570fd3859, %g1, %r15
        setx  0x0cc619a127de6d6f, %g1, %r18
        setx  0x8647173d00cb9392, %g1, %r19
        setx  0x3ed2c351d3151cce, %g1, %r20
        setx  0x7c36e8e132b76d66, %g1, %r21
        setx  0xdc58258d4abef6b9, %g1, %r22
        setx  0x42a5d30f1d0acf0d, %g1, %r23
        setx  0xe608a8efec668200, %g1, %r24
        setx  0xafc0fb29bd16c4b6, %g1, %r25
        setx  0x85664701c43cddf8, %g1, %r26
        setx  0xd6b1b652ef952a83, %g1, %r27
        setx  0x90a1f53f3643e5ec, %g1, %r28
        setx  0x8dc2dd0f6fe27d10, %g1, %r29
        setx  0xcf497f01f3e8f452, %g1, %r30
        setx  0x420fd24476b79bd9, %g1, %r31
	save %r0, %r0, %r31
        setx  MAIN_BASE_DATA_VA, %r1, %r16
        setx  0x00000000000001b0, %g1, %r17
        setx  0xf0438f96d5275650, %g1, %r0
        setx  0x5e75dcd48592f61d, %g1, %r1
        setx  0x6fd882e30c43aeef, %g1, %r2
        setx  0x2cfb35805c592f00, %g1, %r3
        setx  0x1d3c2d76b606c51f, %g1, %r4
        setx  0x0258ac62f317907f, %g1, %r5
        setx  0x13a55587aeb0e9d3, %g1, %r6
        setx  0xf75c6992edafa3d5, %g1, %r7
        setx  0x7aa2830b83d9864c, %g1, %r8
        setx  0xba7789df744e00b7, %g1, %r9
        setx  0xcd099ae9beb9942d, %g1, %r10
        setx  0x4ae31b068bccd940, %g1, %r11
        setx  0x7ca6636610a635af, %g1, %r12
        setx  0x9fed5401c7911f0a, %g1, %r13
        setx  0xcfd4f4c0a2ea74b2, %g1, %r14
        setx  0x9961acac01a10a05, %g1, %r15
        setx  0x400e5083ee6cf9fe, %g1, %r18
        setx  0x3709de7f14abc647, %g1, %r19
        setx  0xfb42c7f96635ca01, %g1, %r20
        setx  0x541f28af412fb812, %g1, %r21
        setx  0xe9f4e43248b29fbc, %g1, %r22
        setx  0x967940ba26340ef4, %g1, %r23
        setx  0x2ba783937bae81e8, %g1, %r24
        setx  0xbf5facf558237795, %g1, %r25
        setx  0xd637753e750e122d, %g1, %r26
        setx  0xd234356968bd384e, %g1, %r27
        setx  0x6908dd45ace8301b, %g1, %r28
        setx  0xf30e59ecd1568b84, %g1, %r29
        setx  0x52d38bfdc424b70a, %g1, %r30
        setx  0xcd204d12ec02d496, %g1, %r31
	save %r0, %r0, %r31
        setx  MAIN_BASE_DATA_VA, %r1, %r16
        setx  0x0000000000000000, %g1, %r17
        setx  0xf80b91a426717a19, %g1, %r0
        setx  0xb432e5796e2afa6b, %g1, %r1
        setx  0x03b5a6d615512405, %g1, %r2
        setx  0xdfcecd9adee0d222, %g1, %r3
        setx  0x958341c5c96c440a, %g1, %r4
        setx  0x9ad5127105d16e17, %g1, %r5
        setx  0xfe04e437cbd7c51e, %g1, %r6
        setx  0x488fd0a058cab5b2, %g1, %r7
        setx  0xd0022392ff9b79ef, %g1, %r8
        setx  0x10e054d2fcb0f934, %g1, %r9
        setx  0x8e72aa64a085820c, %g1, %r10
        setx  0xb950b5717ad15431, %g1, %r11
        setx  0x70d13b0dd4926670, %g1, %r12
        setx  0xb98f74bf1e8ed7c8, %g1, %r13
        setx  0x7a961ecb172b990b, %g1, %r14
        setx  0xcb8237c2430c8872, %g1, %r15
        setx  0x22ee55f6e782d5b8, %g1, %r18
        setx  0x51674847874d05d7, %g1, %r19
        setx  0xcc9989aa9af403e5, %g1, %r20
        setx  0xd4aff8c31c6dc269, %g1, %r21
        setx  0xaacab42579bd8fda, %g1, %r22
        setx  0xf2b5122c3ce109f2, %g1, %r23
        setx  0x8fa41d34a93cc41c, %g1, %r24
        setx  0xe49444358d3910d1, %g1, %r25
        setx  0x1e34770e6c435bd7, %g1, %r26
        setx  0x98a5004c9a7aec3e, %g1, %r27
        setx  0x426016ef5fd8231e, %g1, %r28
        setx  0x05f6aa9b8268d23c, %g1, %r29
        setx  0x04597f6d11b8044f, %g1, %r30
        setx  0xd5277ea68e36d68c, %g1, %r31
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
	.word 0xce342d5d  ! 1: STH_I	sth	%r7, [%r16 + 0x0d5d]
	.word 0x8c840011  ! 3: ADDcc_R	addcc 	%r16, %r17, %r6
	.word 0x87643801  ! 3: MOVcc_I	<illegal instruction>
	.word 0xa8842e24  ! 3: ADDcc_I	addcc 	%r16, 0x0e24, %r20
	.word 0x9c5c22c7  ! 3: SMUL_I	smul 	%r16, 0x02c7, %r14
	.word 0xf2242a95  ! 5: STW_I	stw	%r25, [%r16 + 0x0a95]
	.word 0x40000001  ! 7: CALL	call	disp30_1
	.word 0x90040011  ! 8: ADD_R	add 	%r16, %r17, %r8
	.word 0x9c1c0011  ! 10: XOR_R	xor 	%r16, %r17, %r14
	.word 0xc36c0011  ! 10: PREFETCH_R	prefetch	[%r16 + %r17], #one_read
	.word 0xe43423ef  ! 12: STH_I	sth	%r18, [%r16 + 0x03ef]
	.word 0xbab42bd0  ! 14: ORNcc_I	orncc 	%r16, 0x0bd0, %r29
	.word 0x98b40011  ! 14: ORNcc_R	orncc 	%r16, %r17, %r12
	.word 0xd47c29bb  ! 14: SWAP_I	swap	%r10, [%r16 + 0x09bb]
thr3_irf_ce_0:
!$EV error(3,expr(@VA(.MAIN.thr3_irf_ce_0), 16, 16),1,IRF,ce,13,x, x,x,x, x,x,x)
	.word 0xf62c2707  ! 17: STB_I	stb	%r27, [%r16 + 0x0707]
	.word 0xbf3c0011  ! 19: SRA_R	sra 	%r16, %r17, %r31
	.word 0x9a842bec  ! 19: ADDcc_I	addcc 	%r16, 0x0bec, %r13
	.word 0x8f7c0411  ! 19: MOVR_R	move	%r16, %r17, %r7
	.word 0xd89c282b  ! 19: LDDA_I	ldda	[%r16, + 0x082b] %asi, %r12
	.word 0xca2c0011  ! 20: STB_R	stb	%r5, [%r16 + %r17]
	.word 0x9a940011  ! 22: ORcc_R	orcc 	%r16, %r17, %r13
	.word 0x81580000  ! 22: FLUSHW	flushw
	.word 0xd6342e05  ! 24: STH_I	sth	%r11, [%r16 + 0x0e05]
	.word 0x8f340011  ! 26: SRL_R	srl 	%r16, %r17, %r7
        wr %g0, 0x4, %fprs
	.word 0xc6340011  ! 27: STH_R	sth	%r3, [%r16 + %r17]
	.word 0x9ab422fa  ! 29: ORNcc_I	orncc 	%r16, 0x02fa, %r13
	.word 0x8a3c0011  ! 29: XNOR_R	xnor 	%r16, %r17, %r5
	.word 0x8e5c28ad  ! 29: SMUL_I	smul 	%r16, 0x08ad, %r7
	.word 0xc2740011  ! 30: STX_R	stx	%r1, [%r16 + %r17]
	.word 0x02800001  ! 32: BE	be  	<label_0x1>
	.word 0xc2240011  ! 33: STW_R	stw	%r1, [%r16 + %r17]
	.word 0x93643801  ! 35: MOVcc_I	<illegal instruction>
	.word 0x81880000  ! 35: RESTORED	saved
	.word 0x952c0011  ! 36: SLL_R	sll 	%r16, %r17, %r10
	.word 0xf60420ac  ! 38: LDUW_I	lduw	[%r16 + 0x00ac], %r27
thr3_irf_ce_1:
!$EV error(3,expr(@VA(.MAIN.thr3_irf_ce_1), 16, 16),1,IRF,ce,70,x, x,x,x, x,x,x)
	.word 0xc22423fd  ! 41: STW_I	stw	%r1, [%r16 + 0x03fd]
	.word 0xaeac2894  ! 43: ANDNcc_I	andncc 	%r16, 0x0894, %r23
	.word 0x86042f82  ! 43: ADD_I	add 	%r16, 0x0f82, %r3
	.word 0xaa9c0011  ! 43: XORcc_R	xorcc 	%r16, %r17, %r21
	.word 0xafa00551  ! 43: FSQRTd	fsqrt	
	.word 0xf42c23b3  ! 45: STB_I	stb	%r26, [%r16 + 0x03b3]
	.word 0x1c800001  ! 47: BPOS	bpos  	<label_0x1>
thr3_irf_ce_2:
!$EV error(3,expr(@VA(.MAIN.thr3_irf_ce_2), 16, 16),1,IRF,ce,46,x, x,x,x, x,x,x)
	.word 0xf43429b7  ! 50: STH_I	sth	%r26, [%r16 + 0x09b7]
	.word 0xbc140011  ! 52: OR_R	or 	%r16, %r17, %r30
	.word 0xf8fc2fc2  ! 52: SWAPA_I	swapa	%r28, [%r16 + 0x0fc2] %asi
	.word 0xc42c2597  ! 54: STB_I	stb	%r2, [%r16 + 0x0597]
	.word 0x868c0011  ! 56: ANDcc_R	andcc 	%r16, %r17, %r3
	.word 0x8a840011  ! 56: ADDcc_R	addcc 	%r16, %r17, %r5
	.word 0x992c0011  ! 56: SLL_R	sll 	%r16, %r17, %r12
	.word 0x9e740011  ! 56: UDIV_R	udiv 	%r16, %r17, %r15
	.word 0x9b2c1011  ! 57: SLLX_R	sllx	%r16, %r17, %r13
	.word 0x897c2401  ! 59: MOVR_I	move	%r16, 0xfffffff8, %r4
	.word 0xad2c2001  ! 59: SLL_I	sll 	%r16, 0x0001, %r22
	.word 0xee9c1011  ! 59: LDDA_R	ldda	[%r16, %r17] 0x80, %r23
	.word 0xab342001  ! 60: SRL_I	srl 	%r16, 0x0001, %r21
	.word 0x88142616  ! 62: OR_I	or 	%r16, 0x0616, %r4
	.word 0x888c0011  ! 62: ANDcc_R	andcc 	%r16, %r17, %r4
	.word 0xade40011  ! 62: SAVE_R	save	%r16, %r17, %r22
	.word 0xe6242f97  ! 64: STW_I	stw	%r19, [%r16 + 0x0f97]
	.word 0xbf643801  ! 66: MOVcc_I	<illegal instruction>
	.word 0xa9343001  ! 66: SRLX_I	srlx	%r16, 0x0001, %r20
	.word 0x8f484000  ! 66: RDHPR_HTSTATE	rdhpr	%htstate, %r7
	.word 0x86a40011  ! 67: SUBcc_R	subcc 	%r16, %r17, %r3
	.word 0xbc040011  ! 69: ADD_R	add 	%r16, %r17, %r30
	.word 0xb01c0011  ! 69: XOR_R	xor 	%r16, %r17, %r24
	.word 0xbc9c0011  ! 69: XORcc_R	xorcc 	%r16, %r17, %r30
	.word 0x81880000  ! 69: SAVED	saved
	.word 0xd6242535  ! 71: STW_I	stw	%r11, [%r16 + 0x0535]
	.word 0xae2c20a7  ! 73: ANDN_I	andn 	%r16, 0x00a7, %r23
	.word 0xb23428e6  ! 73: ORN_I	orn 	%r16, 0x08e6, %r25
	.word 0xb92c2001  ! 73: SLL_I	sll 	%r16, 0x0001, %r28
	.word 0xc36c0011  ! 73: PREFETCH_R	prefetch	[%r16 + %r17], #one_read
	.word 0xfc240011  ! 74: STW_R	stw	%r30, [%r16 + %r17]
	.word 0xb0b40011  ! 76: ORNcc_R	orncc 	%r16, %r17, %r24
	.word 0xea9c1011  ! 76: LDDA_R	ldda	[%r16, %r17] 0x80, %r21
	.word 0xd6742aff  ! 78: STX_I	stx	%r11, [%r16 + 0x0aff]
	.word 0x2e800001  ! 80: BVS	bvs,a	<label_0x1>
thr3_irf_ce_3:
!$EV error(3,expr(@VA(.MAIN.thr3_irf_ce_3), 16, 16),1,IRF,ce,64,x, x,x,x, x,x,x)
	.word 0xd6742395  ! 83: STX_I	stx	%r11, [%r16 + 0x0395]
	.word 0xa9641811  ! 85: MOVcc_R	<illegal instruction>
	.word 0x96c42370  ! 85: ADDCcc_I	addccc 	%r16, 0x0370, %r11
	.word 0x8143c000  ! 85: STBAR	stbar
	.word 0xca2c0011  ! 86: STB_R	stb	%r5, [%r16 + %r17]
	.word 0xb9341011  ! 88: SRLX_R	srlx	%r16, %r17, %r28
	.word 0x8143c000  ! 88: STBAR	stbar
	.word 0xc6240011  ! 89: STW_R	stw	%r3, [%r16 + %r17]
	.word 0x92b40011  ! 91: ORNcc_R	orncc 	%r16, %r17, %r9
	.word 0xc3ec1011  ! 91: PREFETCHA_R	prefetcha	[%r16, %r17] 0x80, #one_read
	.word 0xc82c2bc5  ! 93: STB_I	stb	%r4, [%r16 + 0x0bc5]
	.word 0x9a740011  ! 95: UDIV_R	udiv 	%r16, %r17, %r13
	.word 0xcc2c0011  ! 96: STB_R	stb	%r6, [%r16 + %r17]
	.word 0xc89427b2  ! 98: LDUHA_I	lduha	[%r16, + 0x07b2] %asi, %r4
	.word 0x83641811  ! 99: MOVcc_R	<illegal instruction>
	.word 0x9e8c0011  ! 101: ANDcc_R	andcc 	%r16, %r17, %r15
	.word 0x90bc270a  ! 101: XNORcc_I	xnorcc 	%r16, 0x070a, %r8
	.word 0x9f500000  ! 101: RDPR_TPC	rdpr	%tpc, %r15
thr3_irf_ce_4:
!$EV error(3,expr(@VA(.MAIN.thr3_irf_ce_4), 16, 16),1,IRF,ce,55,x, x,x,x, x,x,x)
	.word 0xca2c2a71  ! 104: STB_I	stb	%r5, [%r16 + 0x0a71]
	.word 0x9e9c2458  ! 106: XORcc_I	xorcc 	%r16, 0x0458, %r15
	.word 0xaa840011  ! 106: ADDcc_R	addcc 	%r16, %r17, %r21
	.word 0xaeac214f  ! 106: ANDNcc_I	andncc 	%r16, 0x014f, %r23
	.word 0x32800001  ! 106: BNE	bne,a	<label_0x1>
	.word 0x973c0011  ! 107: SRA_R	sra 	%r16, %r17, %r11
thr3_resum_intr_0:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_0), 16, 16)) -> intp(3, 3, 1)
	wr      %r0, 0x5, %asr26
thr3_irf_ce_5:
!$EV error(3,expr(@VA(.MAIN.thr3_irf_ce_5), 16, 16),1,IRF,ce,8,x, x,x,x, x,x,x)
	.word 0xcc342a2d  ! 112: STH_I	sth	%r6, [%r16 + 0x0a2d]
	.word 0x92140011  ! 114: OR_R	or 	%r16, %r17, %r9
	.word 0x8a340011  ! 114: ORN_R	orn 	%r16, %r17, %r5
	.word 0x82342380  ! 114: ORN_I	orn 	%r16, 0x0380, %r1
        wr %g0, 0x4, %fprs
	.word 0xd8242849  ! 116: STW_I	stw	%r12, [%r16 + 0x0849]
	.word 0xaa0c2f4f  ! 118: AND_I	and 	%r16, 0x0f4f, %r21
	.word 0x89242901  ! 118: MULScc_I	mulscc 	%r16, 0x0901, %r4
thr3_irf_ce_6:
!$EV error(3,expr(@VA(.MAIN.thr3_irf_ce_6), 16, 16),1,IRF,ce,70,x, x,x,x, x,x,x)
	.word 0xe62c2445  ! 121: STB_I	stb	%r19, [%r16 + 0x0445]
	.word 0x04cc0003  ! 123: BRLEZ	brlez  ,pt	%16,<label_0xc0003>
	.word 0xd0240011  ! 124: STW_R	stw	%r8, [%r16 + %r17]
	.word 0x9a3c0011  ! 126: XNOR_R	xnor 	%r16, %r17, %r13
	.word 0xb8840011  ! 126: ADDcc_R	addcc 	%r16, %r17, %r28
	.word 0xcfe42011  ! 126: CASA_R	casa	[%r16] %asi, %r17, %r7
	.word 0xd0340011  ! 127: STH_R	sth	%r8, [%r16 + %r17]
	.word 0x84c40011  ! 129: ADDCcc_R	addccc 	%r16, %r17, %r2
	.word 0x1e800003  ! 129: BVC	bvc  	<label_0x3>
	.word 0x82240011  ! 130: SUB_R	sub 	%r16, %r17, %r1
	.word 0x83340011  ! 132: SRL_R	srl 	%r16, %r17, %r1
	.word 0xb57c2401  ! 132: MOVR_I	move	%r16, 0xfffffff8, %r26
	.word 0xd0cc1011  ! 132: LDSBA_R	ldsba	[%r16, %r17] 0x80, %r8
	.word 0x95340011  ! 133: SRL_R	srl 	%r16, %r17, %r10
	.word 0x96340011  ! 135: ORN_R	orn 	%r16, %r17, %r11
	.word 0x968c0011  ! 135: ANDcc_R	andcc 	%r16, %r17, %r11
	.word 0xb21c27a4  ! 135: XOR_I	xor 	%r16, 0x07a4, %r25
	.word 0x90dc2431  ! 135: SMULcc_I	smulcc 	%r16, 0x0431, %r8
	.word 0x9ec423ab  ! 136: ADDCcc_I	addccc 	%r16, 0x03ab, %r15
	.word 0xb8840011  ! 138: ADDcc_R	addcc 	%r16, %r17, %r28
	.word 0x8a04245d  ! 138: ADD_I	add 	%r16, 0x045d, %r5
	.word 0x8a0c0011  ! 138: AND_R	and 	%r16, %r17, %r5
	.word 0xf4b42fac  ! 138: STHA_I	stha	%r26, [%r16 + 0x0fac] %asi
	.word 0xaa0c2fee  ! 139: AND_I	and 	%r16, 0x0fee, %r21
	.word 0x9cb42a7a  ! 141: ORNcc_I	orncc 	%r16, 0x0a7a, %r14
	.word 0x81580000  ! 141: FLUSHW	flushw
thr3_irf_ce_7:
!$EV error(3,expr(@VA(.MAIN.thr3_irf_ce_7), 16, 16),1,IRF,ce,52,x, x,x,x, x,x,x)
	.word 0xce242425  ! 144: STW_I	stw	%r7, [%r16 + 0x0425]
	.word 0xc4ec276c  ! 146: LDSTUBA_I	ldstuba	%r2, [%r16 + 0x076c] %asi
	.word 0x92042a07  ! 147: ADD_I	add 	%r16, 0x0a07, %r9
	.word 0x9a1c0011  ! 149: XOR_R	xor 	%r16, %r17, %r13
	.word 0xb7524000  ! 149: RDPR_CWP	rdpr	%cwp, %r27
thr3_irf_ce_8:
!$EV error(3,expr(@VA(.MAIN.thr3_irf_ce_8), 16, 16),1,IRF,ce,27,x, x,x,x, x,x,x)
	.word 0xc62c25c9  ! 152: STB_I	stb	%r3, [%r16 + 0x05c9]
	.word 0x9f2c1011  ! 154: SLLX_R	sllx	%r16, %r17, %r15
	.word 0x81dc0011  ! 154: FLUSH_R	dis not found

thr3_irf_ce_9:
!$EV error(3,expr(@VA(.MAIN.thr3_irf_ce_9), 16, 16),1,IRF,ce,52,x, x,x,x, x,x,x)
	.word 0xdc2426db  ! 157: STW_I	stw	%r14, [%r16 + 0x06db]
	ta	T_CHANGE_HPRIV	! macro
	.word 0xee2c0011  ! 160: STB_R	stb	%r23, [%r16 + %r17]
	.word 0x92940011  ! 162: ORcc_R	orcc 	%r16, %r17, %r9
	.word 0x93342001  ! 162: SRL_I	srl 	%r16, 0x0001, %r9
	.word 0x8f343001  ! 162: SRLX_I	srlx	%r16, 0x0001, %r7
	.word 0xc3ec1011  ! 162: PREFETCHA_R	prefetcha	[%r16, %r17] 0x80, #one_read
	.word 0x91342001  ! 163: SRL_I	srl 	%r16, 0x0001, %r8
	ta	T_CHANGE_HPRIV	! macro
	.word 0xd8740011  ! 166: STX_R	stx	%r12, [%r16 + %r17]
	.word 0x81dc204a  ! 168: FLUSH_I	dis not found

thr3_irf_ce_10:
!$EV error(3,expr(@VA(.MAIN.thr3_irf_ce_10), 16, 16),1,IRF,ce,50,x, x,x,x, x,x,x)
	.word 0xc2342ac3  ! 171: STH_I	sth	%r1, [%r16 + 0x0ac3]
	.word 0xb1641811  ! 173: MOVcc_R	<illegal instruction>
	.word 0x8b2c0011  ! 173: SLL_R	sll 	%r16, %r17, %r5
	.word 0xac0c0011  ! 173: AND_R	and 	%r16, %r17, %r22
	.word 0xc4fc1011  ! 173: SWAPA_R	swapa	%r2, [%r16 + %r17] 0x80
thr3_irf_ce_11:
!$EV error(3,expr(@VA(.MAIN.thr3_irf_ce_11), 16, 16),1,IRF,ce,55,x, x,x,x, x,x,x)
	.word 0xee742d87  ! 176: STX_I	stx	%r23, [%r16 + 0x0d87]
	.word 0x92040011  ! 178: ADD_R	add 	%r16, %r17, %r9
	.word 0xacbc2a05  ! 178: XNORcc_I	xnorcc 	%r16, 0x0a05, %r22
	.word 0x8c8c0011  ! 178: ANDcc_R	andcc 	%r16, %r17, %r6
	.word 0xd4ec26d6  ! 178: LDSTUBA_I	ldstuba	%r10, [%r16 + 0x06d6] %asi
	.word 0xfe74265f  ! 180: STX_I	stx	%r31, [%r16 + 0x065f]
	.word 0xc3ec1011  ! 182: PREFETCHA_R	prefetcha	[%r16, %r17] 0x80, #one_read
	.word 0xbc0426f1  ! 183: ADD_I	add 	%r16, 0x06f1, %r30
	.word 0xc3ec1011  ! 185: PREFETCHA_R	prefetcha	[%r16, %r17] 0x80, #one_read
	.word 0xce2c21b9  ! 187: STB_I	stb	%r7, [%r16 + 0x01b9]
	.word 0x8f3c2001  ! 189: SRA_I	sra 	%r16, 0x0001, %r7
	.word 0x8eb427ae  ! 189: ORNcc_I	orncc 	%r16, 0x07ae, %r7
	.word 0x9b341011  ! 189: SRLX_R	srlx	%r16, %r17, %r13
	.word 0x81580000  ! 189: FLUSHW	flushw
	.word 0xfe242dd5  ! 191: STW_I	stw	%r31, [%r16 + 0x0dd5]
	.word 0x9cb42129  ! 193: ORNcc_I	orncc 	%r16, 0x0129, %r14
	.word 0x948c23c3  ! 193: ANDcc_I	andcc 	%r16, 0x03c3, %r10
	.word 0x95342001  ! 193: SRL_I	srl 	%r16, 0x0001, %r10
	.word 0x8143c000  ! 193: STBAR	stbar
	.word 0xdc24269b  ! 195: STW_I	stw	%r14, [%r16 + 0x069b]
	.word 0x81880000  ! 197: SAVED	saved
	.word 0xdc342847  ! 199: STH_I	sth	%r14, [%r16 + 0x0847]
	.word 0x952c1011  ! 201: SLLX_R	sllx	%r16, %r17, %r10
	.word 0x9a2c25d7  ! 201: ANDN_I	andn 	%r16, 0x05d7, %r13
	.word 0xac8c0011  ! 201: ANDcc_R	andcc 	%r16, %r17, %r22
thr3_resum_intr_1:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1), 16, 16)) -> intp(3, 3, 1)
	wr      %r0, 0x5, %asr26
	.word 0xd6742025  ! 203: STX_I	stx	%r11, [%r16 + 0x0025]
	.word 0x8a3c252c  ! 205: XNOR_I	xnor 	%r16, 0x052c, %r5
	.word 0xafec0011  ! 205: RESTORE_R	restore	%r16, %r17, %r23
	.word 0xc8740011  ! 206: STX_R	stx	%r4, [%r16 + %r17]
	.word 0x848c0011  ! 208: ANDcc_R	andcc 	%r16, %r17, %r2
	.word 0x928423a4  ! 208: ADDcc_I	addcc 	%r16, 0x03a4, %r9
	.word 0x97343001  ! 208: SRLX_I	srlx	%r16, 0x0001, %r11
thr3_resum_intr_2:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_2), 16, 16)) -> intp(3, 3, 1)
	wr      %r0, 0x5, %asr26
	.word 0x943c0011  ! 209: XNOR_R	xnor 	%r16, %r17, %r10
	ta	T_CHANGE_HPRIV	! macro
	.word 0x91341011  ! 212: SRLX_R	srlx	%r16, %r17, %r8
	.word 0x98840011  ! 214: ADDcc_R	addcc 	%r16, %r17, %r12
	.word 0x9ebc0011  ! 214: XNORcc_R	xnorcc 	%r16, %r17, %r15
        wr %g0, 0x4, %fprs
	.word 0x901c213a  ! 215: XOR_I	xor 	%r16, 0x013a, %r8
	.word 0xdf3c291a  ! 217: STDF_I	std	%f15, [0x091a, %r16]
	.word 0xa8bc0011  ! 218: XNORcc_R	xnorcc 	%r16, %r17, %r20
	.word 0x973c2001  ! 220: SRA_I	sra 	%r16, 0x0001, %r11
	.word 0x8143e030  ! 220: MEMBAR	membar	#Lookaside | #MemIssue 
	.word 0xf8342053  ! 222: STH_I	sth	%r28, [%r16 + 0x0053]
	.word 0x8143e07c  ! 224: MEMBAR	membar	#LoadStore | #StoreStore | #Lookaside | #MemIssue | #Sync 
	.word 0xf82c2e19  ! 226: STB_I	stb	%r28, [%r16 + 0x0e19]
	.word 0x8ac4227c  ! 228: ADDCcc_I	addccc 	%r16, 0x027c, %r5
	.word 0x9d3c1011  ! 228: SRAX_R	srax	%r16, %r17, %r14
	.word 0xb1e40011  ! 228: SAVE_R	save	%r16, %r17, %r24
	.word 0xde242f05  ! 230: STW_I	stw	%r15, [%r16 + 0x0f05]
	.word 0x40000001  ! 232: CALL	call	disp30_1
	.word 0xd62c0011  ! 233: STB_R	stb	%r11, [%r16 + %r17]
	.word 0x8ec40011  ! 235: ADDCcc_R	addccc 	%r16, %r17, %r7
	.word 0x8143c000  ! 235: STBAR	stbar
	.word 0xec2420ab  ! 237: STW_I	stw	%r22, [%r16 + 0x00ab]
	.word 0x903c2d64  ! 239: XNOR_I	xnor 	%r16, 0x0d64, %r8
	.word 0x81840011  ! 239: WRY_R	wr	%r16, %r17, %y
thr3_irf_ce_12:
!$EV error(3,expr(@VA(.MAIN.thr3_irf_ce_12), 16, 16),1,IRF,ce,44,x, x,x,x, x,x,x)
	.word 0xf2342395  ! 242: STH_I	sth	%r25, [%r16 + 0x0395]
	.word 0xb0bc2c61  ! 244: XNORcc_I	xnorcc 	%r16, 0x0c61, %r24
	.word 0x81580000  ! 244: FLUSHW	flushw
thr3_irf_ce_13:
!$EV error(3,expr(@VA(.MAIN.thr3_irf_ce_13), 16, 16),1,IRF,ce,9,x, x,x,x, x,x,x)
	.word 0xe82c2897  ! 247: STB_I	stb	%r20, [%r16 + 0x0897]
	.word 0x9e5c0011  ! 249: SMUL_R	smul 	%r16, %r17, %r15
thr3_irf_ce_14:
!$EV error(3,expr(@VA(.MAIN.thr3_irf_ce_14), 16, 16),1,IRF,ce,58,x, x,x,x, x,x,x)
	.word 0xd02423f7  ! 252: STW_I	stw	%r8, [%r16 + 0x03f7]
	.word 0x92940011  ! 254: ORcc_R	orcc 	%r16, %r17, %r9
	.word 0x8143c000  ! 254: STBAR	stbar
	.word 0x92842546  ! 255: ADDcc_I	addcc 	%r16, 0x0546, %r9
	.word 0xbcbc0011  ! 257: XNORcc_R	xnorcc 	%r16, %r17, %r30
	.word 0xcbe42011  ! 257: CASA_R	casa	[%r16] %asi, %r17, %r5
thr3_irf_ce_15:
!$EV error(3,expr(@VA(.MAIN.thr3_irf_ce_15), 16, 16),1,IRF,ce,48,x, x,x,x, x,x,x)
	.word 0xc8242677  ! 260: STW_I	stw	%r4, [%r16 + 0x0677]
	.word 0x983c2837  ! 262: XNOR_I	xnor 	%r16, 0x0837, %r12
	.word 0xacb42697  ! 262: ORNcc_I	orncc 	%r16, 0x0697, %r22
	.word 0x94ac0011  ! 262: ANDNcc_R	andncc 	%r16, %r17, %r10
        wr %g0, 0x4, %fprs
thr3_irf_ce_16:
!$EV error(3,expr(@VA(.MAIN.thr3_irf_ce_16), 16, 16),1,IRF,ce,47,x, x,x,x, x,x,x)
	.word 0xec2429bd  ! 265: STW_I	stw	%r22, [%r16 + 0x09bd]
	.word 0x9b2c3001  ! 267: SLLX_I	sllx	%r16, 0x0001, %r13
	.word 0xbe2c0011  ! 267: ANDN_R	andn 	%r16, %r17, %r31
	.word 0x8d643801  ! 267: MOVcc_I	<illegal instruction>
        wr %g0, 0x4, %fprs
thr3_irf_ce_17:
!$EV error(3,expr(@VA(.MAIN.thr3_irf_ce_17), 16, 16),1,IRF,ce,29,x, x,x,x, x,x,x)
	.word 0xda242a07  ! 270: STW_I	stw	%r13, [%r16 + 0x0a07]
	.word 0x949c0011  ! 272: XORcc_R	xorcc 	%r16, %r17, %r10
	.word 0xa740c000  ! 272: RDASI	rd	%asi, %r19
	.word 0xd434216f  ! 274: STH_I	sth	%r10, [%r16 + 0x016f]
	.word 0x857c0411  ! 276: MOVR_R	move	%r16, %r17, %r2
	.word 0x94fc2c68  ! 276: SDIVcc_I	sdivcc 	%r16, 0x0c68, %r10
	.word 0xac940011  ! 277: ORcc_R	orcc 	%r16, %r17, %r22
	.word 0xb17c0411  ! 279: MOVR_R	move	%r16, %r17, %r24
	.word 0xaf2c0011  ! 279: SLL_R	sll 	%r16, %r17, %r23
	.word 0x83494000  ! 279: RDHPR_HTBA	rdhpr	%htba, %r1
	.word 0xea240011  ! 280: STW_R	stw	%r21, [%r16 + %r17]
	.word 0x9abc0011  ! 282: XNORcc_R	xnorcc 	%r16, %r17, %r13
	.word 0x81dc202f  ! 282: FLUSH_I	dis not found

	.word 0xf8240011  ! 283: STW_R	stw	%r28, [%r16 + %r17]
	.word 0x912c2001  ! 285: SLL_I	sll 	%r16, 0x0001, %r8
	.word 0x94c423eb  ! 285: ADDCcc_I	addccc 	%r16, 0x03eb, %r10
thr3_resum_intr_3:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_3), 16, 16)) -> intp(3, 3, 1)
	wr      %r0, 0x5, %asr26
	.word 0xfa342c8b  ! 287: STH_I	sth	%r29, [%r16 + 0x0c8b]
	.word 0xa60c2aa7  ! 289: AND_I	and 	%r16, 0x0aa7, %r19
	.word 0xbb504000  ! 289: RDPR_TNPC	rdpr	%tnpc, %r29
	.word 0xcc742749  ! 291: STX_I	stx	%r6, [%r16 + 0x0749]
	.word 0x90042fce  ! 293: ADD_I	add 	%r16, 0x0fce, %r8
	.word 0x94440011  ! 293: ADDC_R	addc 	%r16, %r17, %r10
	.word 0xaa8c0011  ! 293: ANDcc_R	andcc 	%r16, %r17, %r21
	.word 0xceac2381  ! 293: STBA_I	stba	%r7, [%r16 + 0x0381] %asi
	.word 0xe87421d1  ! 295: STX_I	stx	%r20, [%r16 + 0x01d1]
	.word 0xa93c0011  ! 297: SRA_R	sra 	%r16, %r17, %r20
	.word 0xbf3c1011  ! 297: SRAX_R	srax	%r16, %r17, %r31
	.word 0xc3ec2a56  ! 297: PREFETCHA_I	prefetcha	[%r16, + 0x0a56] %asi, #one_read
thr3_irf_ce_18:
!$EV error(3,expr(@VA(.MAIN.thr3_irf_ce_18), 16, 16),1,IRF,ce,18,x, x,x,x, x,x,x)
	.word 0xea342d51  ! 300: STH_I	sth	%r21, [%r16 + 0x0d51]
	.word 0x98b40011  ! 302: ORNcc_R	orncc 	%r16, %r17, %r12
	.word 0xdf3c0011  ! 302: STDF_R	std	%f15, [%r17, %r16]
	.word 0xe62c0011  ! 303: STB_R	stb	%r19, [%r16 + %r17]
	.word 0x96f40011  ! 305: UDIVcc_R	udivcc 	%r16, %r17, %r11
	.word 0xd8242cc7  ! 307: STW_I	stw	%r12, [%r16 + 0x0cc7]
	.word 0x85641811  ! 309: MOVcc_R	<illegal instruction>
	.word 0xb62c0011  ! 309: ANDN_R	andn 	%r16, %r17, %r27
	.word 0x8a0c2699  ! 309: AND_I	and 	%r16, 0x0699, %r5
	.word 0xb66c0011  ! 309: UDIVX_R	udivx 	%r16, %r17, %r27
	.word 0xde24273b  ! 311: STW_I	stw	%r15, [%r16 + 0x073b]
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x853c0011  ! 314: SRA_R	sra 	%r16, %r17, %r2
	.word 0xb6bc29aa  ! 316: XNORcc_I	xnorcc 	%r16, 0x09aa, %r27
	.word 0x99641811  ! 316: MOVcc_R	<illegal instruction>
        wr %g0, 0x4, %fprs
	.word 0xb0942141  ! 317: ORcc_I	orcc 	%r16, 0x0141, %r24
	.word 0xae4c0011  ! 319: MULX_R	mulx 	%r16, %r17, %r23
thr3_irf_ce_19:
!$EV error(3,expr(@VA(.MAIN.thr3_irf_ce_19), 16, 16),1,IRF,ce,69,x, x,x,x, x,x,x)
	.word 0xc4742cff  ! 322: STX_I	stx	%r2, [%r16 + 0x0cff]
	.word 0x980c0011  ! 324: AND_R	and 	%r16, %r17, %r12
	.word 0xb0c40011  ! 324: ADDCcc_R	addccc 	%r16, %r17, %r24
thr3_resum_intr_4:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_4), 16, 16)) -> intp(3, 3, 1)
	wr      %r0, 0x5, %asr26
thr3_irf_ce_20:
!$EV error(3,expr(@VA(.MAIN.thr3_irf_ce_20), 16, 16),1,IRF,ce,68,x, x,x,x, x,x,x)
	.word 0xd22c2047  ! 327: STB_I	stb	%r9, [%r16 + 0x0047]
	.word 0x952c0011  ! 329: SLL_R	sll 	%r16, %r17, %r10
	.word 0xf6841011  ! 329: LDUWA_R	lduwa	[%r16, %r17] 0x80, %r27
	.word 0xe82c0011  ! 330: STB_R	stb	%r20, [%r16 + %r17]
	.word 0x98942379  ! 332: ORcc_I	orcc 	%r16, 0x0379, %r12
	.word 0xb7341011  ! 332: SRLX_R	srlx	%r16, %r17, %r27
	.word 0x92c426b8  ! 332: ADDCcc_I	addccc 	%r16, 0x06b8, %r9
	.word 0xfc1c2f4e  ! 332: LDD_I	ldd	[%r16 + 0x0f4e], %r30
	.word 0xc62c2e3d  ! 334: STB_I	stb	%r3, [%r16 + 0x0e3d]
	.word 0x921c29af  ! 336: XOR_I	xor 	%r16, 0x09af, %r9
	.word 0x8ef40011  ! 336: UDIVcc_R	udivcc 	%r16, %r17, %r7
thr3_irf_ce_21:
!$EV error(3,expr(@VA(.MAIN.thr3_irf_ce_21), 16, 16),1,IRF,ce,58,x, x,x,x, x,x,x)
	.word 0xf2342b09  ! 339: STH_I	sth	%r25, [%r16 + 0x0b09]
	.word 0x9d7c2401  ! 341: MOVR_I	move	%r16, 0xfffffff8, %r14
	.word 0xefe42011  ! 341: CASA_R	casa	[%r16] %asi, %r17, %r23
thr3_irf_ce_22:
!$EV error(3,expr(@VA(.MAIN.thr3_irf_ce_22), 16, 16),1,IRF,ce,16,x, x,x,x, x,x,x)
	.word 0xf62c225d  ! 344: STB_I	stb	%r27, [%r16 + 0x025d]
	.word 0x85840011  ! 346: WRCCR_R	wr	%r16, %r17, %ccr
thr3_irf_ce_23:
!$EV error(3,expr(@VA(.MAIN.thr3_irf_ce_23), 16, 16),1,IRF,ce,62,x, x,x,x, x,x,x)
	.word 0xf6242795  ! 349: STW_I	stw	%r27, [%r16 + 0x0795]
	.word 0x95341011  ! 351: SRLX_R	srlx	%r16, %r17, %r10
	.word 0x81580000  ! 351: FLUSHW	flushw
	.word 0xf2740011  ! 352: STX_R	stx	%r25, [%r16 + %r17]
	.word 0x821c0011  ! 354: XOR_R	xor 	%r16, %r17, %r1
	.word 0xd6f41011  ! 354: STXA_R	stxa	%r11, [%r16 + %r17] 0x80
thr3_irf_ce_24:
!$EV error(3,expr(@VA(.MAIN.thr3_irf_ce_24), 16, 16),1,IRF,ce,43,x, x,x,x, x,x,x)
	.word 0xfa74292b  ! 357: STX_I	stx	%r29, [%r16 + 0x092b]
	.word 0xb4040011  ! 359: ADD_R	add 	%r16, %r17, %r26
	.word 0xa6440011  ! 359: ADDC_R	addc 	%r16, %r17, %r19
	.word 0x8143c000  ! 359: STBAR	stbar
thr3_irf_ce_25:
!$EV error(3,expr(@VA(.MAIN.thr3_irf_ce_25), 16, 16),1,IRF,ce,35,x, x,x,x, x,x,x)
	.word 0xd834255b  ! 362: STH_I	sth	%r12, [%r16 + 0x055b]
	.word 0x8cfc0011  ! 364: SDIVcc_R	sdivcc 	%r16, %r17, %r6
	.word 0x9a9c0011  ! 365: XORcc_R	xorcc 	%r16, %r17, %r13
	.word 0x903c2a24  ! 367: XNOR_I	xnor 	%r16, 0x0a24, %r8
	.word 0x8e440011  ! 367: ADDC_R	addc 	%r16, %r17, %r7
	.word 0xd67c2148  ! 367: SWAP_I	swap	%r11, [%r16 + 0x0148]
thr3_irf_ce_26:
!$EV error(3,expr(@VA(.MAIN.thr3_irf_ce_26), 16, 16),1,IRF,ce,10,x, x,x,x, x,x,x)
	.word 0xde2c22af  ! 370: STB_I	stb	%r15, [%r16 + 0x02af]
	.word 0x82f40011  ! 372: UDIVcc_R	udivcc 	%r16, %r17, %r1
	.word 0x903c266b  ! 373: XNOR_I	xnor 	%r16, 0x066b, %r8
	.word 0x903c2647  ! 375: XNOR_I	xnor 	%r16, 0x0647, %r8
	.word 0x9cac0011  ! 375: ANDNcc_R	andncc 	%r16, %r17, %r14
	.word 0x81dc27ce  ! 375: FLUSH_I	dis not found

	.word 0xfa240011  ! 376: STW_R	stw	%r29, [%r16 + %r17]
	.word 0x8d7c2401  ! 378: MOVR_I	move	%r16, 0xfffffff8, %r6
	.word 0x94bc2073  ! 378: XNORcc_I	xnorcc 	%r16, 0x0073, %r10
	.word 0x9e042943  ! 378: ADD_I	add 	%r16, 0x0943, %r15
	.word 0x8c6c2bdc  ! 378: UDIVX_I	udivx 	%r16, 0x0bdc, %r6
thr3_irf_ce_27:
!$EV error(3,expr(@VA(.MAIN.thr3_irf_ce_27), 16, 16),1,IRF,ce,44,x, x,x,x, x,x,x)
	.word 0xf42427d5  ! 381: STW_I	stw	%r26, [%r16 + 0x07d5]
	.word 0x81dc2696  ! 383: FLUSH_I	dis not found

	.word 0xf4342531  ! 385: STH_I	sth	%r26, [%r16 + 0x0531]
	.word 0xab342001  ! 387: SRL_I	srl 	%r16, 0x0001, %r21
	.word 0x8b342001  ! 387: SRL_I	srl 	%r16, 0x0001, %r5
	.word 0x81dc2df7  ! 387: FLUSH_I	dis not found

	.word 0xe42c0011  ! 388: STB_R	stb	%r18, [%r16 + %r17]
	.word 0xb13c0011  ! 390: SRA_R	sra 	%r16, %r17, %r24
	.word 0x8143e036  ! 390: MEMBAR	membar	#StoreLoad | #LoadStore | #Lookaside | #MemIssue 
	.word 0xda242fd3  ! 392: STW_I	stw	%r13, [%r16 + 0x0fd3]
	.word 0x833c2001  ! 394: SRA_I	sra 	%r16, 0x0001, %r1
	.word 0x941c0011  ! 394: XOR_R	xor 	%r16, %r17, %r10
	.word 0x9fe40011  ! 394: SAVE_R	save	%r16, %r17, %r15
	.word 0xf474214d  ! 396: STX_I	stx	%r26, [%r16 + 0x014d]
	.word 0x9b342001  ! 398: SRL_I	srl 	%r16, 0x0001, %r13
	.word 0xab643801  ! 398: MOVcc_I	<illegal instruction>
	.word 0xb32c3001  ! 398: SLLX_I	sllx	%r16, 0x0001, %r25
	.word 0x81580000  ! 398: FLUSHW	flushw
	.word 0xd4342953  ! 400: STH_I	sth	%r10, [%r16 + 0x0953]
	.word 0x8d7c2401  ! 402: MOVR_I	move	%r16, 0xfffffff8, %r6
	.word 0x8f3c1011  ! 402: SRAX_R	srax	%r16, %r17, %r7
	.word 0x81dc23c5  ! 402: FLUSH_I	dis not found

thr3_irf_ce_28:
!$EV error(3,expr(@VA(.MAIN.thr3_irf_ce_28), 16, 16),1,IRF,ce,58,x, x,x,x, x,x,x)
	.word 0xd22c2b15  ! 405: STB_I	stb	%r9, [%r16 + 0x0b15]
	.word 0x8f3c0011  ! 407: SRA_R	sra 	%r16, %r17, %r7
	.word 0x8b341011  ! 407: SRLX_R	srlx	%r16, %r17, %r5
	.word 0x92040011  ! 407: ADD_R	add 	%r16, %r17, %r9
	.word 0x967c0011  ! 407: SDIV_R	sdiv 	%r16, %r17, %r11
	.word 0xc8742b45  ! 409: STX_I	stx	%r4, [%r16 + 0x0b45]
	.word 0x8c042469  ! 411: ADD_I	add 	%r16, 0x0469, %r6
	.word 0xd244277c  ! 411: LDSW_I	ldsw	[%r16 + 0x077c], %r9
	.word 0xc6340011  ! 412: STH_R	sth	%r3, [%r16 + %r17]
	.word 0x8e9c0011  ! 414: XORcc_R	xorcc 	%r16, %r17, %r7
	.word 0x8143c000  ! 414: STBAR	stbar
thr3_irf_ce_29:
!$EV error(3,expr(@VA(.MAIN.thr3_irf_ce_29), 16, 16),1,IRF,ce,57,x, x,x,x, x,x,x)
	.word 0xf8342287  ! 417: STH_I	sth	%r28, [%r16 + 0x0287]
	.word 0xac44244d  ! 419: ADDC_I	addc 	%r16, 0x044d, %r22
	.word 0x82ac2600  ! 419: ANDNcc_I	andncc 	%r16, 0x0600, %r1
	.word 0x32800001  ! 419: BNE	bne,a	<label_0x1>
	.word 0xda740011  ! 420: STX_R	stx	%r13, [%r16 + %r17]
	.word 0x06800003  ! 422: BL	bl  	<label_0x3>
	.word 0xf83425e3  ! 424: STH_I	sth	%r28, [%r16 + 0x05e3]
	.word 0x89343001  ! 426: SRLX_I	srlx	%r16, 0x0001, %r4
	.word 0xbc0c2bae  ! 426: AND_I	and 	%r16, 0x0bae, %r30
	.word 0xc8941011  ! 426: LDUHA_R	lduha	[%r16, %r17] 0x80, %r4
	.word 0xe8240011  ! 427: STW_R	stw	%r20, [%r16 + %r17]
thr3_resum_intr_5:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_5), 16, 16)) -> intp(3, 3, 1)
	wr      %r0, 0x5, %asr26
	.word 0xde2c2ae5  ! 431: STB_I	stb	%r15, [%r16 + 0x0ae5]
	.word 0x8ebc2db8  ! 433: XNORcc_I	xnorcc 	%r16, 0x0db8, %r7
	.word 0x9e5c29e2  ! 433: SMUL_I	smul 	%r16, 0x09e2, %r15
	.word 0xd0342015  ! 435: STH_I	sth	%r8, [%r16 + 0x0015]
	.word 0xb20c0011  ! 437: AND_R	and 	%r16, %r17, %r25
	.word 0x86b40011  ! 437: ORNcc_R	orncc 	%r16, %r17, %r3
	.word 0xda4c0011  ! 437: LDSB_R	ldsb	[%r16 + %r17], %r13
	.word 0xea240011  ! 438: STW_R	stw	%r21, [%r16 + %r17]
	.word 0x8a842c5e  ! 440: ADDcc_I	addcc 	%r16, 0x0c5e, %r5
	.word 0xb92c1011  ! 440: SLLX_R	sllx	%r16, %r17, %r28
	.word 0xacac0011  ! 440: ANDNcc_R	andncc 	%r16, %r17, %r22
	.word 0xf4cc2e84  ! 440: LDSBA_I	ldsba	[%r16, + 0x0e84] %asi, %r26
	.word 0xe6740011  ! 441: STX_R	stx	%r19, [%r16 + %r17]
	.word 0x977c0411  ! 443: MOVR_R	move	%r16, %r17, %r11
	.word 0xbd641811  ! 443: MOVcc_R	<illegal instruction>
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x9d340011  ! 444: SRL_R	srl 	%r16, %r17, %r14
	.word 0xc36c22cf  ! 446: PREFETCH_I	prefetch	[%r16 + 0x02cf], #one_read
thr3_irf_ce_30:
!$EV error(3,expr(@VA(.MAIN.thr3_irf_ce_30), 16, 16),1,IRF,ce,41,x, x,x,x, x,x,x)
	.word 0xd4742463  ! 449: STX_I	stx	%r10, [%r16 + 0x0463]
	.word 0xb8c42827  ! 451: ADDCcc_I	addccc 	%r16, 0x0827, %r28
	.word 0xd8a41011  ! 451: STWA_R	stwa	%r12, [%r16 + %r17] 0x80
	.word 0xe62c0011  ! 452: STB_R	stb	%r19, [%r16 + %r17]
	.word 0xb2440011  ! 454: ADDC_R	addc 	%r16, %r17, %r25
	.word 0x93341011  ! 454: SRLX_R	srlx	%r16, %r17, %r9
	.word 0x85340011  ! 454: SRL_R	srl 	%r16, %r17, %r2
        wr %g0, 0x4, %fprs
	.word 0xce740011  ! 455: STX_R	stx	%r7, [%r16 + %r17]
	.word 0x82142c4d  ! 457: OR_I	or 	%r16, 0x0c4d, %r1
	.word 0xa72c2001  ! 457: SLL_I	sll 	%r16, 0x0001, %r19
	.word 0xde440011  ! 457: LDSW_R	ldsw	[%r16 + %r17], %r15
	.word 0xc6742f07  ! 459: STX_I	stx	%r3, [%r16 + 0x0f07]
	.word 0x92bc0011  ! 461: XNORcc_R	xnorcc 	%r16, %r17, %r9
	.word 0x87341011  ! 461: SRLX_R	srlx	%r16, %r17, %r3
	.word 0xf2bc1011  ! 461: STDA_R	stda	%r25, [%r16 + %r17] 0x80
thr3_irf_ce_31:
!$EV error(3,expr(@VA(.MAIN.thr3_irf_ce_31), 16, 16),1,IRF,ce,60,x, x,x,x, x,x,x)
	.word 0xfa342d81  ! 464: STH_I	sth	%r29, [%r16 + 0x0d81]
	.word 0x8ab40011  ! 466: ORNcc_R	orncc 	%r16, %r17, %r5
	.word 0x8ed40011  ! 466: UMULcc_R	umulcc 	%r16, %r17, %r7
	.word 0xc8742bb3  ! 468: STX_I	stx	%r4, [%r16 + 0x0bb3]
	.word 0x8cc40011  ! 470: ADDCcc_R	addccc 	%r16, %r17, %r6
	.word 0x9d3c0011  ! 470: SRA_R	sra 	%r16, %r17, %r14
	.word 0xb4fc0011  ! 470: SDIVcc_R	sdivcc 	%r16, %r17, %r26
thr3_irf_ce_32:
!$EV error(3,expr(@VA(.MAIN.thr3_irf_ce_32), 16, 16),1,IRF,ce,43,x, x,x,x, x,x,x)
	.word 0xf834288b  ! 473: STH_I	sth	%r28, [%r16 + 0x088b]
	.word 0x869c0011  ! 475: XORcc_R	xorcc 	%r16, %r17, %r3
	.word 0x8b514000  ! 475: RDPR_TBA	rdpr	%tba, %r5
	.word 0xd2240011  ! 476: STW_R	stw	%r9, [%r16 + %r17]
	.word 0xca1c0011  ! 478: LDD_R	ldd	[%r16 + %r17], %r5
thr3_irf_ce_33:
!$EV error(3,expr(@VA(.MAIN.thr3_irf_ce_33), 16, 16),1,IRF,ce,29,x, x,x,x, x,x,x)
	.word 0xd2242965  ! 481: STW_I	stw	%r9, [%r16 + 0x0965]
	.word 0xacc42e81  ! 483: ADDCcc_I	addccc 	%r16, 0x0e81, %r22
	.word 0xb6342d81  ! 483: ORN_I	orn 	%r16, 0x0d81, %r27
	.word 0xb4bc2ccd  ! 483: XNORcc_I	xnorcc 	%r16, 0x0ccd, %r26
	ta	T_CHANGE_PRIV	! macro
thr3_irf_ce_34:
!$EV error(3,expr(@VA(.MAIN.thr3_irf_ce_34), 16, 16),1,IRF,ce,12,x, x,x,x, x,x,x)
	.word 0xe42420fd  ! 486: STW_I	stw	%r18, [%r16 + 0x00fd]
	.word 0x8b2c1011  ! 488: SLLX_R	sllx	%r16, %r17, %r5
	.word 0x853c2001  ! 488: SRA_I	sra 	%r16, 0x0001, %r2
	.word 0x840c2a64  ! 488: AND_I	and 	%r16, 0x0a64, %r2
	.word 0xe87c0011  ! 488: SWAP_R	swap	%r20, [%r16 + %r17]
	.word 0x94ac292b  ! 489: ANDNcc_I	andncc 	%r16, 0x092b, %r10
	.word 0x8eac0011  ! 491: ANDNcc_R	andncc 	%r16, %r17, %r7
	.word 0x869c2050  ! 491: XORcc_I	xorcc 	%r16, 0x0050, %r3
	.word 0xaa2c0011  ! 491: ANDN_R	andn 	%r16, %r17, %r21
	.word 0x8d6c0011  ! 491: SDIVX_R	sdivx	%r16, %r17, %r6
	.word 0x9abc24b5  ! 492: XNORcc_I	xnorcc 	%r16, 0x04b5, %r13
	.word 0xa48423a1  ! 494: ADDcc_I	addcc 	%r16, 0x03a1, %r18
	.word 0x8a2c26a1  ! 494: ANDN_I	andn 	%r16, 0x06a1, %r5
	.word 0x04c40003  ! 494: BRLEZ	brlez  ,nt	%16,<label_0x40003>
	.word 0xdc2c2ce9  ! 496: STB_I	stb	%r14, [%r16 + 0x0ce9]
	.word 0xa73c2001  ! 498: SRA_I	sra 	%r16, 0x0001, %r19
	.word 0x81880000  ! 498: SAVED	saved
	.word 0x9e840011  ! 499: ADDcc_R	addcc 	%r16, %r17, %r15
	.word 0x93ec0011  ! 501: RESTORE_R	restore	%r16, %r17, %r9
thr3_irf_ce_35:
!$EV error(3,expr(@VA(.MAIN.thr3_irf_ce_35), 16, 16),1,IRF,ce,66,x, x,x,x, x,x,x)
	.word 0xc22c2cbd  ! 504: STB_I	stb	%r1, [%r16 + 0x0cbd]
	.word 0x9b3c1011  ! 506: SRAX_R	srax	%r16, %r17, %r13
	.word 0x9d3c2001  ! 506: SRA_I	sra 	%r16, 0x0001, %r14
	.word 0x94c42488  ! 506: ADDCcc_I	addccc 	%r16, 0x0488, %r10
	.word 0x81880000  ! 506: RESTORED	saved
	.word 0xea242045  ! 508: STW_I	stw	%r21, [%r16 + 0x0045]
	.word 0x837c2401  ! 510: MOVR_I	move	%r16, 0xfffffff8, %r1
	.word 0xb5e40011  ! 510: SAVE_R	save	%r16, %r17, %r26
thr3_irf_ce_36:
!$EV error(3,expr(@VA(.MAIN.thr3_irf_ce_36), 16, 16),1,IRF,ce,7,x, x,x,x, x,x,x)
	.word 0xc434293d  ! 513: STH_I	sth	%r2, [%r16 + 0x093d]
	.word 0xc3ec2e30  ! 515: PREFETCHA_I	prefetcha	[%r16, + 0x0e30] %asi, #one_read
	.word 0xd4740011  ! 516: STX_R	stx	%r10, [%r16 + %r17]
	.word 0x9ec40011  ! 518: ADDCcc_R	addccc 	%r16, %r17, %r15
	.word 0xfc0c0011  ! 518: LDUB_R	ldub	[%r16 + %r17], %r30
	.word 0x8e2c29d1  ! 519: ANDN_I	andn 	%r16, 0x09d1, %r7
	.word 0xa4140011  ! 521: OR_R	or 	%r16, %r17, %r18
	.word 0x9e8c2936  ! 521: ANDcc_I	andcc 	%r16, 0x0936, %r15
        wr %g0, 0x4, %fprs
	.word 0xdc340011  ! 522: STH_R	sth	%r14, [%r16 + %r17]
	.word 0x861c0011  ! 524: XOR_R	xor 	%r16, %r17, %r3
	.word 0x8e342c06  ! 524: ORN_I	orn 	%r16, 0x0c06, %r7
	.word 0xdccc29fe  ! 524: LDSBA_I	ldsba	[%r16, + 0x09fe] %asi, %r14
	.word 0x99643801  ! 525: MOVcc_I	<illegal instruction>
        wr %g0, 0x4, %fprs
thr3_irf_ce_37:
!$EV error(3,expr(@VA(.MAIN.thr3_irf_ce_37), 16, 16),1,IRF,ce,22,x, x,x,x, x,x,x)
	.word 0xc4242d69  ! 530: STW_I	stw	%r2, [%r16 + 0x0d69]
	.word 0xaf3c1011  ! 532: SRAX_R	srax	%r16, %r17, %r23
	.word 0xb2040011  ! 532: ADD_R	add 	%r16, %r17, %r25
	.word 0xc3ec2d38  ! 532: PREFETCHA_I	prefetcha	[%r16, + 0x0d38] %asi, #one_read
	.word 0xc62c2121  ! 534: STB_I	stb	%r3, [%r16 + 0x0121]
	.word 0xa49c2305  ! 536: XORcc_I	xorcc 	%r16, 0x0305, %r18
	.word 0x88342875  ! 536: ORN_I	orn 	%r16, 0x0875, %r4
	.word 0x868c255d  ! 536: ANDcc_I	andcc 	%r16, 0x055d, %r3
        wr %g0, 0x4, %fprs
thr3_irf_ce_38:
!$EV error(3,expr(@VA(.MAIN.thr3_irf_ce_38), 16, 16),1,IRF,ce,25,x, x,x,x, x,x,x)
	.word 0xd42c215d  ! 539: STB_I	stb	%r10, [%r16 + 0x015d]
	.word 0x9e3c0011  ! 541: XNOR_R	xnor 	%r16, %r17, %r15
	.word 0xb92c3001  ! 541: SLLX_I	sllx	%r16, 0x0001, %r28
	.word 0x9a9c2a3c  ! 541: XORcc_I	xorcc 	%r16, 0x0a3c, %r13
	.word 0x93418000  ! 541: RDFPRS	rd	%fprs, %r9
	.word 0xec240011  ! 542: STW_R	stw	%r22, [%r16 + %r17]
	.word 0x8cb42188  ! 544: ORNcc_I	orncc 	%r16, 0x0188, %r6
	.word 0xb7343001  ! 544: SRLX_I	srlx	%r16, 0x0001, %r27
	.word 0x94842af4  ! 544: ADDcc_I	addcc 	%r16, 0x0af4, %r10
	ta	T_CHANGE_PRIV	! macro
	.word 0xde742caf  ! 546: STX_I	stx	%r15, [%r16 + 0x0caf]
	.word 0xa8840011  ! 548: ADDcc_R	addcc 	%r16, %r17, %r20
	.word 0x89343001  ! 548: SRLX_I	srlx	%r16, 0x0001, %r4
	.word 0x8753c000  ! 548: RDPR_FQ	<illegal instruction>
thr3_irf_ce_39:
!$EV error(3,expr(@VA(.MAIN.thr3_irf_ce_39), 16, 16),1,IRF,ce,44,x, x,x,x, x,x,x)
	.word 0xca342929  ! 551: STH_I	sth	%r5, [%r16 + 0x0929]
	.word 0xaf2c3001  ! 553: SLLX_I	sllx	%r16, 0x0001, %r23
	.word 0x8143e009  ! 553: MEMBAR	membar	#LoadLoad | #StoreStore 
	.word 0xde340011  ! 554: STH_R	sth	%r15, [%r16 + %r17]
	.word 0xa42c215e  ! 556: ANDN_I	andn 	%r16, 0x015e, %r18
	.word 0xa8b42125  ! 556: ORNcc_I	orncc 	%r16, 0x0125, %r20
	.word 0x8143e03a  ! 556: MEMBAR	membar	#StoreLoad | #StoreStore | #Lookaside | #MemIssue 
thr3_irf_ce_40:
!$EV error(3,expr(@VA(.MAIN.thr3_irf_ce_40), 16, 16),1,IRF,ce,29,x, x,x,x, x,x,x)
	.word 0xd2342bcf  ! 559: STH_I	sth	%r9, [%r16 + 0x0bcf]
        wr %g0, 0x4, %fprs
	.word 0xa8942373  ! 562: ORcc_I	orcc 	%r16, 0x0373, %r20
	.word 0x9a3c0011  ! 564: XNOR_R	xnor 	%r16, %r17, %r13
	.word 0x87340011  ! 564: SRL_R	srl 	%r16, %r17, %r3
	.word 0x9e842c13  ! 564: ADDcc_I	addcc 	%r16, 0x0c13, %r15
thr3_resum_intr_6:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_6), 16, 16)) -> intp(3, 3, 1)
	wr      %r0, 0x5, %asr26
	.word 0xca2c22a1  ! 566: STB_I	stb	%r5, [%r16 + 0x02a1]
	.word 0xa92c3001  ! 568: SLLX_I	sllx	%r16, 0x0001, %r20
	.word 0x9044226a  ! 568: ADDC_I	addc 	%r16, 0x026a, %r8
	.word 0x81880000  ! 568: SAVED	saved
thr3_irf_ce_41:
!$EV error(3,expr(@VA(.MAIN.thr3_irf_ce_41), 16, 16),1,IRF,ce,14,x, x,x,x, x,x,x)
	.word 0xd2242321  ! 571: STW_I	stw	%r9, [%r16 + 0x0321]
	.word 0x943c0011  ! 573: XNOR_R	xnor 	%r16, %r17, %r10
	.word 0xb2140011  ! 573: OR_R	or 	%r16, %r17, %r25
	.word 0xb72c3001  ! 573: SLLX_I	sllx	%r16, 0x0001, %r27
	.word 0xc3ec229a  ! 573: PREFETCHA_I	prefetcha	[%r16, + 0x029a] %asi, #one_read
thr3_irf_ce_42:
!$EV error(3,expr(@VA(.MAIN.thr3_irf_ce_42), 16, 16),1,IRF,ce,38,x, x,x,x, x,x,x)
	.word 0xce24250b  ! 576: STW_I	stw	%r7, [%r16 + 0x050b]
	.word 0x820c0011  ! 578: AND_R	and 	%r16, %r17, %r1
	.word 0xa84c0011  ! 578: MULX_R	mulx 	%r16, %r17, %r20
	.word 0xce340011  ! 579: STH_R	sth	%r7, [%r16 + %r17]
	.word 0xc36c2ccc  ! 581: PREFETCH_I	prefetch	[%r16 + 0x0ccc], #one_read
	.word 0xd634298f  ! 583: STH_I	sth	%r11, [%r16 + 0x098f]
	.word 0x820c265f  ! 585: AND_I	and 	%r16, 0x065f, %r1
	.word 0xca841011  ! 585: LDUWA_R	lduwa	[%r16, %r17] 0x80, %r5
	.word 0xca24296d  ! 587: STW_I	stw	%r5, [%r16 + 0x096d]
	.word 0xb29c0011  ! 589: XORcc_R	xorcc 	%r16, %r17, %r25
	.word 0x8c440011  ! 589: ADDC_R	addc 	%r16, %r17, %r6
thr3_resum_intr_7:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_7), 16, 16)) -> intp(3, 3, 1)
	wr      %r0, 0x5, %asr26
	.word 0x82940011  ! 590: ORcc_R	orcc 	%r16, %r17, %r1
thr3_resum_intr_8:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_8), 16, 16)) -> intp(3, 3, 1)
	wr      %r0, 0x5, %asr26
thr3_irf_ce_43:
!$EV error(3,expr(@VA(.MAIN.thr3_irf_ce_43), 16, 16),1,IRF,ce,4,x, x,x,x, x,x,x)
	.word 0xce2c2bf7  ! 595: STB_I	stb	%r7, [%r16 + 0x0bf7]
	.word 0x88442ea8  ! 597: ADDC_I	addc 	%r16, 0x0ea8, %r4
	.word 0x9b341011  ! 597: SRLX_R	srlx	%r16, %r17, %r13
	ta	T_CHANGE_PRIV	! macro
	.word 0xf42c0011  ! 598: STB_R	stb	%r26, [%r16 + %r17]
	.word 0x8c442f14  ! 600: ADDC_I	addc 	%r16, 0x0f14, %r6
	.word 0x89534000  ! 600: RDPR_OTHERWIN	rdpr	%otherwin, %r4
	.word 0xc2242913  ! 602: STW_I	stw	%r1, [%r16 + 0x0913]
	.word 0xc8c41011  ! 604: LDSWA_R	ldswa	[%r16, %r17] 0x80, %r4
	.word 0xc42c2aad  ! 606: STB_I	stb	%r2, [%r16 + 0x0aad]
	.word 0xc36c0011  ! 608: PREFETCH_R	prefetch	[%r16 + %r17], #one_read
	.word 0xf4240011  ! 609: STW_R	stw	%r26, [%r16 + %r17]
	.word 0xc8cc1011  ! 611: LDSBA_R	ldsba	[%r16, %r17] 0x80, %r4
	.word 0x8e8c0011  ! 612: ANDcc_R	andcc 	%r16, %r17, %r7
	.word 0x96042798  ! 614: ADD_I	add 	%r16, 0x0798, %r11
	.word 0x9d641811  ! 614: MOVcc_R	<illegal instruction>
	.word 0x9f7c2401  ! 614: MOVR_I	move	%r16, 0xfffffff8, %r15
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xaf7c2401  ! 615: MOVR_I	move	%r16, 0x7fffbdd8, %r23
	.word 0x881c2fdf  ! 617: XOR_I	xor 	%r16, 0x0fdf, %r4
	.word 0x8f3c0011  ! 617: SRA_R	sra 	%r16, %r17, %r7
	.word 0xb2d40011  ! 617: UMULcc_R	umulcc 	%r16, %r17, %r25
	.word 0x908c2a73  ! 618: ANDcc_I	andcc 	%r16, 0x0a73, %r8
	.word 0x861c0011  ! 620: XOR_R	xor 	%r16, %r17, %r3
	.word 0xd4c426bd  ! 620: LDSWA_I	ldswa	[%r16, + 0x06bd] %asi, %r10
thr3_irf_ce_44:
!$EV error(3,expr(@VA(.MAIN.thr3_irf_ce_44), 16, 16),1,IRF,ce,64,x, x,x,x, x,x,x)
	.word 0xdc2c2d15  ! 623: STB_I	stb	%r14, [%r16 + 0x0d15]
	.word 0xc9f41011  ! 625: CASXA_I	casxa	[%r16] 0x80, %r17, %r4
	.word 0xc6740011  ! 626: STX_R	stx	%r3, [%r16 + %r17]
	.word 0x88bc0011  ! 628: XNORcc_R	xnorcc 	%r16, %r17, %r4
	.word 0xc36c0011  ! 628: PREFETCH_R	prefetch	[%r16 + %r17], #one_read
	.word 0x9c9c0011  ! 629: XORcc_R	xorcc 	%r16, %r17, %r14
	.word 0xd3242182  ! 631: STF_I	st	%f9, [0x0182, %r16]
	.word 0x98140011  ! 632: OR_R	or 	%r16, %r17, %r12
	.word 0xb68c0011  ! 634: ANDcc_R	andcc 	%r16, %r17, %r27
	.word 0x941c2eea  ! 634: XOR_I	xor 	%r16, 0x0eea, %r10
	.word 0xdc842e59  ! 634: LDUWA_I	lduwa	[%r16, + 0x0e59] %asi, %r14
	.word 0xea342e63  ! 636: STH_I	sth	%r21, [%r16 + 0x0e63]
	.word 0x8a8426f5  ! 638: ADDcc_I	addcc 	%r16, 0x06f5, %r5
	.word 0xd884253b  ! 638: LDUWA_I	lduwa	[%r16, + 0x053b] %asi, %r12
	.word 0xdc740011  ! 639: STX_R	stx	%r14, [%r16 + %r17]
	.word 0x982c0011  ! 641: ANDN_R	andn 	%r16, %r17, %r12
	.word 0x81880000  ! 641: RESTORED	saved
	.word 0xea2c0011  ! 642: STB_R	stb	%r21, [%r16 + %r17]
	.word 0xbe8c2642  ! 644: ANDcc_I	andcc 	%r16, 0x0642, %r31
	.word 0xc3ec25f1  ! 644: PREFETCHA_I	prefetcha	[%r16, + 0x05f1] %asi, #one_read
thr3_irf_ce_45:
!$EV error(3,expr(@VA(.MAIN.thr3_irf_ce_45), 16, 16),1,IRF,ce,71,x, x,x,x, x,x,x)
	.word 0xc62c28e7  ! 647: STB_I	stb	%r3, [%r16 + 0x08e7]
	.word 0x0c800001  ! 649: BNEG	bneg  	<label_0x1>
	.word 0xbc2c252c  ! 650: ANDN_I	andn 	%r16, 0x052c, %r30
	.word 0xa72c2001  ! 652: SLL_I	sll 	%r16, 0x0001, %r19
	.word 0x9d342001  ! 652: SRL_I	srl 	%r16, 0x0001, %r14
	.word 0x8143c000  ! 652: STBAR	stbar
	.word 0x829c2c2d  ! 653: XORcc_I	xorcc 	%r16, 0x0c2d, %r1
	.word 0xd0941011  ! 655: LDUHA_R	lduha	[%r16, %r17] 0x80, %r8
	.word 0x82b40011  ! 656: ORNcc_R	orncc 	%r16, %r17, %r1
	.word 0x8c940011  ! 658: ORcc_R	orcc 	%r16, %r17, %r6
	.word 0xa9641811  ! 658: MOVcc_R	<illegal instruction>
	.word 0x94ac0011  ! 658: ANDNcc_R	andncc 	%r16, %r17, %r10
	.word 0x9af40011  ! 658: UDIVcc_R	udivcc 	%r16, %r17, %r13
	.word 0xde2c2ba7  ! 660: STB_I	stb	%r15, [%r16 + 0x0ba7]
	.word 0x94c42acc  ! 662: ADDCcc_I	addccc 	%r16, 0x0acc, %r10
	.word 0xbd340011  ! 662: SRL_R	srl 	%r16, %r17, %r30
	.word 0x04800003  ! 662: BLE	ble  	<label_0x3>
	.word 0x941427e3  ! 663: OR_I	or 	%r16, 0x07e3, %r10
	.word 0xa8440011  ! 665: ADDC_R	addc 	%r16, %r17, %r20
	.word 0x842c20af  ! 665: ANDN_I	andn 	%r16, 0x00af, %r2
	.word 0x90442466  ! 665: ADDC_I	addc 	%r16, 0x0466, %r8
	.word 0x1a800003  ! 665: BCC	bcc  	<label_0x3>
	.word 0xd82c0011  ! 666: STB_R	stb	%r12, [%r16 + %r17]
	.word 0xb4842808  ! 668: ADDcc_I	addcc 	%r16, 0x0808, %r26
	.word 0x8e1c21e3  ! 668: XOR_I	xor 	%r16, 0x01e3, %r7
	.word 0xc36c2836  ! 668: PREFETCH_I	prefetch	[%r16 + 0x0836], #one_read
	.word 0xce240011  ! 669: STW_R	stw	%r7, [%r16 + %r17]
	.word 0x90042599  ! 671: ADD_I	add 	%r16, 0x0599, %r8
	.word 0xaaac2857  ! 671: ANDNcc_I	andncc 	%r16, 0x0857, %r21
	.word 0xa6942cdc  ! 671: ORcc_I	orcc 	%r16, 0x0cdc, %r19
	ta	T_CHANGE_HPRIV	! macro
	.word 0xce2c0011  ! 672: STB_R	stb	%r7, [%r16 + %r17]
	.word 0xad341011  ! 674: SRLX_R	srlx	%r16, %r17, %r22
	.word 0x9b3c0011  ! 674: SRA_R	sra 	%r16, %r17, %r13
	.word 0xcc4c274d  ! 674: LDSB_I	ldsb	[%r16 + 0x074d], %r6
thr3_irf_ce_46:
!$EV error(3,expr(@VA(.MAIN.thr3_irf_ce_46), 16, 16),1,IRF,ce,42,x, x,x,x, x,x,x)
	.word 0xce742fe9  ! 677: STX_I	stx	%r7, [%r16 + 0x0fe9]
	.word 0xa92c0011  ! 679: SLL_R	sll 	%r16, %r17, %r20
	.word 0xfe941011  ! 679: LDUHA_R	lduha	[%r16, %r17] 0x80, %r31
	.word 0x90b40011  ! 680: ORNcc_R	orncc 	%r16, %r17, %r8
	.word 0x81dc0011  ! 682: FLUSH_R	dis not found

	.word 0xfa34234f  ! 684: STH_I	sth	%r29, [%r16 + 0x034f]
	.word 0x8b3c2001  ! 686: SRA_I	sra 	%r16, 0x0001, %r5
	.word 0xd0440011  ! 686: LDSW_R	ldsw	[%r16 + %r17], %r8
	.word 0xfc342f43  ! 688: STH_I	sth	%r30, [%r16 + 0x0f43]
	.word 0xbcc40011  ! 690: ADDCcc_R	addccc 	%r16, %r17, %r30
	.word 0x81dc25eb  ! 690: FLUSH_I	dis not found

	.word 0xdc2c0011  ! 691: STB_R	stb	%r14, [%r16 + %r17]
	.word 0xaf341011  ! 693: SRLX_R	srlx	%r16, %r17, %r23
	.word 0x9c8c2768  ! 693: ANDcc_I	andcc 	%r16, 0x0768, %r14
	.word 0xac2c21f1  ! 693: ANDN_I	andn 	%r16, 0x01f1, %r22
	.word 0xc80428dc  ! 693: LDUW_I	lduw	[%r16 + 0x08dc], %r4
	.word 0x9b342001  ! 694: SRL_I	srl 	%r16, 0x0001, %r13
	.word 0x82c40011  ! 696: ADDCcc_R	addccc 	%r16, %r17, %r1
	.word 0x8a1c0011  ! 696: XOR_R	xor 	%r16, %r17, %r5
	.word 0x983c0011  ! 696: XNOR_R	xnor 	%r16, %r17, %r12
	.word 0x9cd40011  ! 696: UMULcc_R	umulcc 	%r16, %r17, %r14
	.word 0x841c0011  ! 697: XOR_R	xor 	%r16, %r17, %r2
	.word 0xc36c2ebc  ! 699: PREFETCH_I	prefetch	[%r16 + 0x0ebc], #one_read
	.word 0xee74260b  ! 701: STX_I	stx	%r23, [%r16 + 0x060b]
	.word 0x880c0011  ! 703: AND_R	and 	%r16, %r17, %r4
	.word 0x8d343001  ! 703: SRLX_I	srlx	%r16, 0x0001, %r6
	.word 0xcb3c0011  ! 703: STDF_R	std	%f5, [%r17, %r16]
	.word 0xab2c3001  ! 704: SLLX_I	sllx	%r16, 0x0001, %r21
	.word 0x9a8c0011  ! 706: ANDcc_R	andcc 	%r16, %r17, %r13
	.word 0x2acc0003  ! 706: BRNZ	brnz,a,pt	%16,<label_0xc0003>
thr3_irf_ce_47:
!$EV error(3,expr(@VA(.MAIN.thr3_irf_ce_47), 16, 16),1,IRF,ce,61,x, x,x,x, x,x,x)
	.word 0xce3423ed  ! 709: STH_I	sth	%r7, [%r16 + 0x03ed]
	.word 0x9e142ce5  ! 711: OR_I	or 	%r16, 0x0ce5, %r15
	.word 0xdcbc2d3a  ! 711: STDA_I	stda	%r14, [%r16 + 0x0d3a] %asi
	.word 0xd62c26d3  ! 713: STB_I	stb	%r11, [%r16 + 0x06d3]
        wr %g0, 0x4, %fprs
	.word 0xce740011  ! 716: STX_R	stx	%r7, [%r16 + %r17]
	.word 0xa5341011  ! 718: SRLX_R	srlx	%r16, %r17, %r18
	.word 0x8e8c2d1d  ! 718: ANDcc_I	andcc 	%r16, 0x0d1d, %r7
	.word 0x960c2448  ! 718: AND_I	and 	%r16, 0x0448, %r11
	.word 0xccac2807  ! 718: STBA_I	stba	%r6, [%r16 + 0x0807] %asi
	.word 0xc2242461  ! 720: STW_I	stw	%r1, [%r16 + 0x0461]
	.word 0x8e8c0011  ! 722: ANDcc_R	andcc 	%r16, %r17, %r7
	.word 0xae9c0011  ! 722: XORcc_R	xorcc 	%r16, %r17, %r23
	.word 0x92340011  ! 722: ORN_R	orn 	%r16, %r17, %r9
	.word 0x9e7c0011  ! 722: SDIV_R	sdiv 	%r16, %r17, %r15
	.word 0xfe740011  ! 723: STX_R	stx	%r31, [%r16 + %r17]
	.word 0xbd340011  ! 725: SRL_R	srl 	%r16, %r17, %r30
	.word 0x9f3c2001  ! 725: SRA_I	sra 	%r16, 0x0001, %r15
	.word 0xa72c3001  ! 725: SLLX_I	sllx	%r16, 0x0001, %r19
	.word 0x2acc0001  ! 725: BRNZ	brnz,a,pt	%16,<label_0xc0001>
	.word 0x82a40011  ! 726: SUBcc_R	subcc 	%r16, %r17, %r1
	.word 0xbe342eb0  ! 728: ORN_I	orn 	%r16, 0x0eb0, %r31
	.word 0x9f50c000  ! 728: RDPR_TT	rdpr	%tt, %r15
thr3_irf_ce_48:
!$EV error(3,expr(@VA(.MAIN.thr3_irf_ce_48), 16, 16),1,IRF,ce,16,x, x,x,x, x,x,x)
	.word 0xee742b69  ! 731: STX_I	stx	%r23, [%r16 + 0x0b69]
	.word 0xbc1c245d  ! 733: XOR_I	xor 	%r16, 0x045d, %r30
	.word 0xccc41011  ! 733: LDSWA_R	ldswa	[%r16, %r17] 0x80, %r6
	.word 0xd8340011  ! 734: STH_R	sth	%r12, [%r16 + %r17]
	.word 0x848c0011  ! 736: ANDcc_R	andcc 	%r16, %r17, %r2
	.word 0x8a3c0011  ! 736: XNOR_R	xnor 	%r16, %r17, %r5
	.word 0x82bc2006  ! 736: XNORcc_I	xnorcc 	%r16, 0x0006, %r1
	.word 0x2ccc0003  ! 736: BRGZ	brgz,a,pt	%16,<label_0xc0003>
	.word 0x94ac0011  ! 737: ANDNcc_R	andncc 	%r16, %r17, %r10
	.word 0x98d42d46  ! 739: UMULcc_I	umulcc 	%r16, 0x0d46, %r12
	.word 0xa8c40011  ! 740: ADDCcc_R	addccc 	%r16, %r17, %r20
	.word 0x8ac42f0d  ! 742: ADDCcc_I	addccc 	%r16, 0x0f0d, %r5
	.word 0x9d2c0011  ! 742: SLL_R	sll 	%r16, %r17, %r14
	.word 0xb23c0011  ! 742: XNOR_R	xnor 	%r16, %r17, %r25
	.word 0x82740011  ! 742: UDIV_R	udiv 	%r16, %r17, %r1
	.word 0x9c840011  ! 743: ADDcc_R	addcc 	%r16, %r17, %r14
	.word 0xd8042ec5  ! 745: LDUW_I	lduw	[%r16 + 0x0ec5], %r12
	.word 0x9a340011  ! 746: ORN_R	orn 	%r16, %r17, %r13
	.word 0x908c0011  ! 748: ANDcc_R	andcc 	%r16, %r17, %r8
thr3_resum_intr_9:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_9), 16, 16)) -> intp(3, 3, 1)
	wr      %r0, 0x5, %asr26
	.word 0xca340011  ! 749: STH_R	sth	%r5, [%r16 + %r17]
	.word 0xaa0c0011  ! 751: AND_R	and 	%r16, %r17, %r21
        wr %g0, 0x4, %fprs
	.word 0x9eb42c4f  ! 752: ORNcc_I	orncc 	%r16, 0x0c4f, %r15
	.word 0x8c840011  ! 754: ADDcc_R	addcc 	%r16, %r17, %r6
	.word 0x95514000  ! 754: RDPR_TBA	rdpr	%tba, %r10
	.word 0xda2c0011  ! 755: STB_R	stb	%r13, [%r16 + %r17]
	.word 0x92140011  ! 757: OR_R	or 	%r16, %r17, %r9
	.word 0x969c0011  ! 757: XORcc_R	xorcc 	%r16, %r17, %r11
	.word 0xc36c2719  ! 757: PREFETCH_I	prefetch	[%r16 + 0x0719], #one_read
	.word 0xc27424d5  ! 759: STX_I	stx	%r1, [%r16 + 0x04d5]
	.word 0x8c1c0011  ! 761: XOR_R	xor 	%r16, %r17, %r6
	.word 0x9a8c0011  ! 761: ANDcc_R	andcc 	%r16, %r17, %r13
	.word 0xeeac214f  ! 761: STBA_I	stba	%r23, [%r16 + 0x014f] %asi
	.word 0xd2740011  ! 762: STX_R	stx	%r9, [%r16 + %r17]
	.word 0x9f641811  ! 764: MOVcc_R	<illegal instruction>
	.word 0x9c3c2db5  ! 764: XNOR_I	xnor 	%r16, 0x0db5, %r14
        wr %g0, 0x4, %fprs
	.word 0xcc2c2e59  ! 766: STB_I	stb	%r6, [%r16 + 0x0e59]
	.word 0xf2042dbd  ! 768: LDUW_I	lduw	[%r16 + 0x0dbd], %r25
	.word 0x88942783  ! 769: ORcc_I	orcc 	%r16, 0x0783, %r4
	.word 0xb17c0411  ! 771: MOVR_R	move	%r16, %r17, %r24
	.word 0x8143e02a  ! 771: MEMBAR	membar	#StoreLoad | #StoreStore | #MemIssue 
thr3_irf_ce_49:
!$EV error(3,expr(@VA(.MAIN.thr3_irf_ce_49), 16, 16),1,IRF,ce,57,x, x,x,x, x,x,x)
	.word 0xcc34227f  ! 774: STH_I	sth	%r6, [%r16 + 0x027f]
	.word 0x8d3c0011  ! 776: SRA_R	sra 	%r16, %r17, %r6
	.word 0x9e1c297a  ! 776: XOR_I	xor 	%r16, 0x097a, %r15
	.word 0x81dc2bc7  ! 776: FLUSH_I	dis not found

	.word 0xdc240011  ! 777: STW_R	stw	%r14, [%r16 + %r17]
	.word 0x96040011  ! 779: ADD_R	add 	%r16, %r17, %r11
	.word 0x9e8c20c8  ! 779: ANDcc_I	andcc 	%r16, 0x00c8, %r15
	.word 0x9d7c0411  ! 779: MOVR_R	move	%r16, %r17, %r14
	.word 0x8ba40d31  ! 779: FsMULd	fsmuld	%f16, %f48, %f36
	.word 0x852c0011  ! 780: SLL_R	sll 	%r16, %r17, %r2
	.word 0xa73c0011  ! 782: SRA_R	sra 	%r16, %r17, %r19
	.word 0x948c0011  ! 782: ANDcc_R	andcc 	%r16, %r17, %r10
	.word 0xa6140011  ! 782: OR_R	or 	%r16, %r17, %r19
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xfe740011  ! 783: STX_R	stx	%r31, [%r16 + %r17]
	.word 0xaa042e34  ! 785: ADD_I	add 	%r16, 0x0e34, %r21
	.word 0x957c2401  ! 785: MOVR_I	move	%r16, 0xfffffff8, %r10
	.word 0xc85c2016  ! 785: LDX_I	ldx	[%r16 + 0x0016], %r4
	.word 0xf6242e83  ! 787: STW_I	stw	%r27, [%r16 + 0x0e83]
	.word 0x2ecc0003  ! 789: BRGEZ	brgez,a,pt	%16,<label_0xc0003>
	.word 0xf6742d23  ! 791: STX_I	stx	%r27, [%r16 + 0x0d23]
	.word 0x8e8c0011  ! 793: ANDcc_R	andcc 	%r16, %r17, %r7
	.word 0x99341011  ! 793: SRLX_R	srlx	%r16, %r17, %r12
	.word 0x8a040011  ! 793: ADD_R	add 	%r16, %r17, %r5
	.word 0xac7c251c  ! 793: SDIV_I	sdiv 	%r16, 0x051c, %r22
	.word 0x9a242883  ! 794: SUB_I	sub 	%r16, 0x0883, %r13
	.word 0x9a9c0011  ! 796: XORcc_R	xorcc 	%r16, %r17, %r13
	.word 0x909c0011  ! 796: XORcc_R	xorcc 	%r16, %r17, %r8
	.word 0x86bc0011  ! 796: XNORcc_R	xnorcc 	%r16, %r17, %r3
	.word 0x2acc0003  ! 796: BRNZ	brnz,a,pt	%16,<label_0xc0003>
	.word 0xad3c1011  ! 797: SRAX_R	srax	%r16, %r17, %r22
	.word 0xb49c0011  ! 799: XORcc_R	xorcc 	%r16, %r17, %r26
	.word 0x933c1011  ! 799: SRAX_R	srax	%r16, %r17, %r9
	.word 0xa4bc0011  ! 799: XNORcc_R	xnorcc 	%r16, %r17, %r18
	.word 0x9de40011  ! 799: SAVE_R	save	%r16, %r17, %r14
thr3_irf_ce_50:
!$EV error(3,expr(@VA(.MAIN.thr3_irf_ce_50), 16, 16),1,IRF,ce,34,x, x,x,x, x,x,x)
	.word 0xd22c2da7  ! 802: STB_I	stb	%r9, [%r16 + 0x0da7]
	.word 0x92bc2f25  ! 804: XNORcc_I	xnorcc 	%r16, 0x0f25, %r9
	.word 0x94742bd0  ! 804: UDIV_I	udiv 	%r16, 0x0bd0, %r10
thr3_irf_ce_51:
!$EV error(3,expr(@VA(.MAIN.thr3_irf_ce_51), 16, 16),1,IRF,ce,58,x, x,x,x, x,x,x)
	.word 0xf82c2fcb  ! 807: STB_I	stb	%r28, [%r16 + 0x0fcb]
	ta	T_CHANGE_PRIV	! macro
	.word 0xf82c2605  ! 811: STB_I	stb	%r28, [%r16 + 0x0605]
	.word 0x92840011  ! 813: ADDcc_R	addcc 	%r16, %r17, %r9
	.word 0xa97c2401  ! 813: MOVR_I	move	%r16, 0xfffffff8, %r20
thr3_resum_intr_10:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_10), 16, 16)) -> intp(3, 3, 1)
	wr      %r0, 0x5, %asr26
	.word 0xd22422b7  ! 815: STW_I	stw	%r9, [%r16 + 0x02b7]
	.word 0x90342f75  ! 817: ORN_I	orn 	%r16, 0x0f75, %r8
	.word 0xb80c2117  ! 817: AND_I	and 	%r16, 0x0117, %r28
	.word 0x9b24286f  ! 817: MULScc_I	mulscc 	%r16, 0x086f, %r13
thr3_irf_ce_52:
!$EV error(3,expr(@VA(.MAIN.thr3_irf_ce_52), 16, 16),1,IRF,ce,7,x, x,x,x, x,x,x)
	.word 0xfe2c2a25  ! 820: STB_I	stb	%r31, [%r16 + 0x0a25]
	.word 0x9c140011  ! 822: OR_R	or 	%r16, %r17, %r14
	.word 0x96b40011  ! 822: ORNcc_R	orncc 	%r16, %r17, %r11
	.word 0x896c2ecd  ! 822: SDIVX_I	sdivx	%r16, 0x0ecd, %r4
	.word 0xfc2c0011  ! 823: STB_R	stb	%r30, [%r16 + %r17]
	.word 0xaec40011  ! 825: ADDCcc_R	addccc 	%r16, %r17, %r23
	.word 0xbe840011  ! 825: ADDcc_R	addcc 	%r16, %r17, %r31
	.word 0xc25429f6  ! 825: LDSH_I	ldsh	[%r16 + 0x09f6], %r1
	.word 0xea2c2125  ! 827: STB_I	stb	%r21, [%r16 + 0x0125]
	.word 0xc36c2a85  ! 829: PREFETCH_I	prefetch	[%r16 + 0x0a85], #one_read
	.word 0xea2c21fb  ! 831: STB_I	stb	%r21, [%r16 + 0x01fb]
	.word 0xa9343001  ! 833: SRLX_I	srlx	%r16, 0x0001, %r20
	.word 0x908c0011  ! 833: ANDcc_R	andcc 	%r16, %r17, %r8
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xb2c42675  ! 834: ADDCcc_I	addccc 	%r16, 0x0675, %r25
	.word 0x900c2845  ! 836: AND_I	and 	%r16, 0x0845, %r8
	.word 0xa56c2608  ! 836: SDIVX_I	sdivx	%r16, 0x0608, %r18
	.word 0xca2426d3  ! 838: STW_I	stw	%r5, [%r16 + 0x06d3]
	.word 0xe4442d76  ! 840: LDSW_I	ldsw	[%r16 + 0x0d76], %r18
	.word 0xb29c0011  ! 841: XORcc_R	xorcc 	%r16, %r17, %r25
	.word 0xb33c0011  ! 843: SRA_R	sra 	%r16, %r17, %r25
	.word 0x977c2401  ! 843: MOVR_I	move	%r16, 0xfffffff8, %r11
	.word 0xc3ec25bb  ! 843: PREFETCHA_I	prefetcha	[%r16, + 0x05bb] %asi, #one_read
	.word 0xfc2c0011  ! 844: STB_R	stb	%r30, [%r16 + %r17]
	.word 0xb08c0011  ! 846: ANDcc_R	andcc 	%r16, %r17, %r24
	.word 0xb4c42877  ! 846: ADDCcc_I	addccc 	%r16, 0x0877, %r26
	.word 0xada8c831  ! 846: FMOVL	fmovs	%fcc1, %f17, %f22
thr3_irf_ce_53:
!$EV error(3,expr(@VA(.MAIN.thr3_irf_ce_53), 16, 16),1,IRF,ce,53,x, x,x,x, x,x,x)
	.word 0xd2742d49  ! 849: STX_I	stx	%r9, [%r16 + 0x0d49]
	.word 0x8c5c23fa  ! 851: SMUL_I	smul 	%r16, 0x03fa, %r6
thr3_irf_ce_54:
!$EV error(3,expr(@VA(.MAIN.thr3_irf_ce_54), 16, 16),1,IRF,ce,56,x, x,x,x, x,x,x)
	.word 0xd674252b  ! 854: STX_I	stx	%r11, [%r16 + 0x052b]
	.word 0x98b40011  ! 856: ORNcc_R	orncc 	%r16, %r17, %r12
	.word 0xb60c0011  ! 856: AND_R	and 	%r16, %r17, %r27
	.word 0x852c1011  ! 856: SLLX_R	sllx	%r16, %r17, %r2
	.word 0xc36c2709  ! 856: PREFETCH_I	prefetch	[%r16 + 0x0709], #one_read
	.word 0xd07424fb  ! 858: STX_I	stx	%r8, [%r16 + 0x04fb]
	.word 0x840c0011  ! 860: AND_R	and 	%r16, %r17, %r2
	.word 0xdc8c2f0a  ! 860: LDUBA_I	lduba	[%r16, + 0x0f0a] %asi, %r14
	.word 0x86ac2172  ! 861: ANDNcc_I	andncc 	%r16, 0x0172, %r3
	.word 0x917c0411  ! 863: MOVR_R	move	%r16, %r17, %r8
	.word 0xc44c0011  ! 863: LDSB_R	ldsb	[%r16 + %r17], %r2
	.word 0xc2740011  ! 864: STX_R	stx	%r1, [%r16 + %r17]
	.word 0xcafc23cc  ! 866: SWAPA_I	swapa	%r5, [%r16 + 0x03cc] %asi
	.word 0x9f2c1011  ! 867: SLLX_R	sllx	%r16, %r17, %r15
	.word 0xb6bc0011  ! 869: XNORcc_R	xnorcc 	%r16, %r17, %r27
	.word 0x937c0411  ! 869: MOVR_R	move	%r16, %r17, %r9
	.word 0x82b40011  ! 869: ORNcc_R	orncc 	%r16, %r17, %r1
	.word 0xd04c2a8e  ! 869: LDSB_I	ldsb	[%r16 + 0x0a8e], %r8
thr3_irf_ce_55:
!$EV error(3,expr(@VA(.MAIN.thr3_irf_ce_55), 16, 16),1,IRF,ce,13,x, x,x,x, x,x,x)
	.word 0xc2342915  ! 872: STH_I	sth	%r1, [%r16 + 0x0915]
	.word 0x9b7c2401  ! 874: MOVR_I	move	%r16, 0xfffffff8, %r13
	.word 0xae040011  ! 874: ADD_R	add 	%r16, %r17, %r23
	.word 0xb6340011  ! 874: ORN_R	orn 	%r16, %r17, %r27
	.word 0xc36c0011  ! 874: PREFETCH_R	prefetch	[%r16 + %r17], #one_read
thr3_irf_ce_56:
!$EV error(3,expr(@VA(.MAIN.thr3_irf_ce_56), 16, 16),1,IRF,ce,58,x, x,x,x, x,x,x)
	.word 0xdc342ca9  ! 877: STH_I	sth	%r14, [%r16 + 0x0ca9]
thr3_resum_intr_11:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_11), 16, 16)) -> intp(3, 3, 1)
	wr      %r0, 0x5, %asr26
thr3_irf_ce_57:
!$EV error(3,expr(@VA(.MAIN.thr3_irf_ce_57), 16, 16),1,IRF,ce,52,x, x,x,x, x,x,x)
	.word 0xdc3421dd  ! 882: STH_I	sth	%r14, [%r16 + 0x01dd]
	.word 0x8c2c26ca  ! 884: ANDN_I	andn 	%r16, 0x06ca, %r6
        wr %g0, 0x4, %fprs
thr3_irf_ce_58:
!$EV error(3,expr(@VA(.MAIN.thr3_irf_ce_58), 16, 16),1,IRF,ce,8,x, x,x,x, x,x,x)
	.word 0xe82c23a9  ! 887: STB_I	stb	%r20, [%r16 + 0x03a9]
	.word 0x96b40011  ! 889: ORNcc_R	orncc 	%r16, %r17, %r11
	.word 0x9d7c2401  ! 889: MOVR_I	move	%r16, 0xfffffff8, %r14
	.word 0xbd2c3001  ! 889: SLLX_I	sllx	%r16, 0x0001, %r30
	.word 0xd2d429a6  ! 889: LDSHA_I	ldsha	[%r16, + 0x09a6] %asi, %r9
	.word 0xd2342219  ! 891: STH_I	sth	%r9, [%r16 + 0x0219]
	.word 0x941425ed  ! 893: OR_I	or 	%r16, 0x05ed, %r10
	.word 0xbc4426fd  ! 893: ADDC_I	addc 	%r16, 0x06fd, %r30
	.word 0xbcb42b4c  ! 893: ORNcc_I	orncc 	%r16, 0x0b4c, %r30
        wr %g0, 0x4, %fprs
	.word 0xf6742807  ! 895: STX_I	stx	%r27, [%r16 + 0x0807]
	.word 0xb8440011  ! 897: ADDC_R	addc 	%r16, %r17, %r28
	.word 0x98ac21a2  ! 897: ANDNcc_I	andncc 	%r16, 0x01a2, %r12
	.word 0x973c0011  ! 897: SRA_R	sra 	%r16, %r17, %r11
	.word 0xddf42011  ! 897: CASXA_R	casxa	[%r16]%asi, %r17, %r14
	.word 0xf0742cc1  ! 899: STX_I	stx	%r24, [%r16 + 0x0cc1]
	.word 0x82bc0011  ! 901: XNORcc_R	xnorcc 	%r16, %r17, %r1
	.word 0x9a040011  ! 901: ADD_R	add 	%r16, %r17, %r13
	.word 0x92342427  ! 901: ORN_I	orn 	%r16, 0x0427, %r9
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xdc340011  ! 902: STH_R	sth	%r14, [%r16 + %r17]
	.word 0xead41011  ! 904: LDSHA_R	ldsha	[%r16, %r17] 0x80, %r21
thr3_irf_ce_59:
!$EV error(3,expr(@VA(.MAIN.thr3_irf_ce_59), 16, 16),1,IRF,ce,9,x, x,x,x, x,x,x)
	.word 0xce342121  ! 907: STH_I	sth	%r7, [%r16 + 0x0121]
	.word 0x81dc2e4e  ! 909: FLUSH_I	dis not found

	.word 0xce240011  ! 910: STW_R	stw	%r7, [%r16 + %r17]
	.word 0xf93c0011  ! 912: STDF_R	std	%f28, [%r17, %r16]
	.word 0xf2240011  ! 913: STW_R	stw	%r25, [%r16 + %r17]
	.word 0xbe1c0011  ! 915: XOR_R	xor 	%r16, %r17, %r31
	.word 0x909c0011  ! 915: XORcc_R	xorcc 	%r16, %r17, %r8
	.word 0xde0428a7  ! 915: LDUW_I	lduw	[%r16 + 0x08a7], %r15
	.word 0x873c3001  ! 916: SRAX_I	srax	%r16, 0x0001, %r3
	.word 0x889c0011  ! 918: XORcc_R	xorcc 	%r16, %r17, %r4
	.word 0x89240011  ! 918: MULScc_R	mulscc 	%r16, %r17, %r4
	.word 0xc82c2f43  ! 920: STB_I	stb	%r4, [%r16 + 0x0f43]
	.word 0x9c340011  ! 922: ORN_R	orn 	%r16, %r17, %r14
        wr %g0, 0x4, %fprs
	.word 0xec240011  ! 923: STW_R	stw	%r22, [%r16 + %r17]
	.word 0x9eac2c06  ! 925: ANDNcc_I	andncc 	%r16, 0x0c06, %r15
	.word 0x8a140011  ! 925: OR_R	or 	%r16, %r17, %r5
	.word 0x9d641811  ! 925: MOVcc_R	<illegal instruction>
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xf42c0011  ! 926: STB_R	stb	%r26, [%r16 + %r17]
	.word 0x920c20bb  ! 928: AND_I	and 	%r16, 0x00bb, %r9
	.word 0x81880000  ! 928: RESTORED	saved
	.word 0x8ca40011  ! 929: SUBcc_R	subcc 	%r16, %r17, %r6
	.word 0xb8bc26da  ! 931: XNORcc_I	xnorcc 	%r16, 0x06da, %r28
	.word 0xa69c0011  ! 931: XORcc_R	xorcc 	%r16, %r17, %r19
	.word 0x8eb40011  ! 931: ORNcc_R	orncc 	%r16, %r17, %r7
	.word 0x8143c000  ! 931: STBAR	stbar
	.word 0x8cbc284d  ! 932: XNORcc_I	xnorcc 	%r16, 0x084d, %r6
	.word 0x873c0011  ! 934: SRA_R	sra 	%r16, %r17, %r3
	.word 0xd65c0011  ! 934: LDX_R	ldx	[%r16 + %r17], %r11
	.word 0xfc340011  ! 935: STH_R	sth	%r30, [%r16 + %r17]
	.word 0x961c2002  ! 937: XOR_I	xor 	%r16, 0x0002, %r11
	.word 0x953c2001  ! 937: SRA_I	sra 	%r16, 0x0001, %r10
	.word 0xa40c0011  ! 937: AND_R	and 	%r16, %r17, %r18
thr3_resum_intr_12:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_12), 16, 16)) -> intp(3, 3, 1)
	wr      %r0, 0x5, %asr26
	.word 0xe8240011  ! 938: STW_R	stw	%r20, [%r16 + %r17]
	.word 0xa49c20d6  ! 940: XORcc_I	xorcc 	%r16, 0x00d6, %r18
	.word 0x94940011  ! 940: ORcc_R	orcc 	%r16, %r17, %r10
	.word 0x8143e052  ! 940: MEMBAR	membar	#StoreLoad | #Lookaside | #Sync 
	.word 0xca7424e1  ! 942: STX_I	stx	%r5, [%r16 + 0x04e1]
	.word 0x843424d9  ! 944: ORN_I	orn 	%r16, 0x04d9, %r2
	.word 0x8a2c29a0  ! 944: ANDN_I	andn 	%r16, 0x09a0, %r5
	.word 0x93342001  ! 944: SRL_I	srl 	%r16, 0x0001, %r9
	.word 0x8143c000  ! 944: STBAR	stbar
	.word 0xea34290d  ! 946: STH_I	sth	%r21, [%r16 + 0x090d]
	.word 0x89643801  ! 948: MOVcc_I	<illegal instruction>
	.word 0x8b2c0011  ! 948: SLL_R	sll 	%r16, %r17, %r5
	.word 0x82140011  ! 948: OR_R	or 	%r16, %r17, %r1
	.word 0xbda00051  ! 948: FMOVd	fmovd	%f48, %f30
thr3_irf_ce_60:
!$EV error(3,expr(@VA(.MAIN.thr3_irf_ce_60), 16, 16),1,IRF,ce,50,x, x,x,x, x,x,x)
	.word 0xd82c2ec7  ! 951: STB_I	stb	%r12, [%r16 + 0x0ec7]
	.word 0x902c0011  ! 953: ANDN_R	andn 	%r16, %r17, %r8
	.word 0x9a3c0011  ! 953: XNOR_R	xnor 	%r16, %r17, %r13
	.word 0xb6bc2931  ! 953: XNORcc_I	xnorcc 	%r16, 0x0931, %r27
	.word 0xc6a41011  ! 953: STWA_R	stwa	%r3, [%r16 + %r17] 0x80
	.word 0xc6240011  ! 954: STW_R	stw	%r3, [%r16 + %r17]
	.word 0xb4b40011  ! 956: ORNcc_R	orncc 	%r16, %r17, %r26
	.word 0xe7242b59  ! 956: STF_I	st	%f19, [0x0b59, %r16]
	.word 0xda2422ed  ! 958: STW_I	stw	%r13, [%r16 + 0x02ed]
	.word 0x9a1c0011  ! 960: XOR_R	xor 	%r16, %r17, %r13
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xd22c0011  ! 961: STB_R	stb	%r9, [%r16 + %r17]
	.word 0xe4d42d0a  ! 963: LDSHA_I	ldsha	[%r16, + 0x0d0a] %asi, %r18
	.word 0xf02424e1  ! 965: STW_I	stw	%r24, [%r16 + 0x04e1]
	.word 0x9cc40011  ! 967: ADDCcc_R	addccc 	%r16, %r17, %r14
	.word 0x98ac2053  ! 967: ANDNcc_I	andncc 	%r16, 0x0053, %r12
	.word 0x9ebc21a8  ! 967: XNORcc_I	xnorcc 	%r16, 0x01a8, %r15
	.word 0x9ef42cf1  ! 967: UDIVcc_I	udivcc 	%r16, 0x0cf1, %r15
	.word 0x98242b90  ! 968: SUB_I	sub 	%r16, 0x0b90, %r12
	.word 0xae6c0011  ! 970: UDIVX_R	udivx 	%r16, %r17, %r23
thr3_irf_ce_61:
!$EV error(3,expr(@VA(.MAIN.thr3_irf_ce_61), 16, 16),1,IRF,ce,64,x, x,x,x, x,x,x)
	.word 0xe62c29ef  ! 973: STB_I	stb	%r19, [%r16 + 0x09ef]
	.word 0xa7a01031  ! 975: FsTOx	dis not found

thr3_irf_ce_62:
!$EV error(3,expr(@VA(.MAIN.thr3_irf_ce_62), 16, 16),1,IRF,ce,71,x, x,x,x, x,x,x)
	.word 0xc42c2959  ! 978: STB_I	stb	%r2, [%r16 + 0x0959]
	.word 0xaabc22ed  ! 980: XNORcc_I	xnorcc 	%r16, 0x02ed, %r21
	.word 0xc8ec2cf7  ! 980: LDSTUBA_I	ldstuba	%r4, [%r16 + 0x0cf7] %asi
	.word 0x84a423c0  ! 981: SUBcc_I	subcc 	%r16, 0x03c0, %r2
	.word 0x997c2401  ! 983: MOVR_I	move	%r16, 0xfffffff8, %r12
	.word 0xa65c2b7e  ! 983: SMUL_I	smul 	%r16, 0x0b7e, %r19
	.word 0x8e340011  ! 984: SUBC_R	orn 	%r16, %r17, %r7
	.word 0xbeac0011  ! 986: ANDNcc_R	andncc 	%r16, %r17, %r31
	.word 0x981c28ad  ! 986: XOR_I	xor 	%r16, 0x08ad, %r12
	.word 0x897c0411  ! 986: MOVR_R	move	%r16, %r17, %r4
thr3_resum_intr_13:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_13), 16, 16)) -> intp(3, 3, 1)
	wr      %r0, 0x5, %asr26
	.word 0xc42c28b3  ! 988: STB_I	stb	%r2, [%r16 + 0x08b3]
thr3_resum_intr_14:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_14), 16, 16)) -> intp(3, 3, 1)
	wr      %r0, 0x5, %asr26
	.word 0xda340011  ! 991: STH_R	sth	%r13, [%r16 + %r17]
	.word 0x9cac0011  ! 993: ANDNcc_R	andncc 	%r16, %r17, %r14
	.word 0x98bc2880  ! 993: XNORcc_I	xnorcc 	%r16, 0x0880, %r12
	.word 0x989c0011  ! 993: XORcc_R	xorcc 	%r16, %r17, %r12
	.word 0xd01c2e84  ! 993: LDD_I	ldd	[%r16 + 0x0e84], %r8
	.word 0x9b3c1011  ! 994: SRAX_R	srax	%r16, %r17, %r13
	.word 0xacac2162  ! 996: ANDNcc_I	andncc 	%r16, 0x0162, %r22
	.word 0xb8440011  ! 996: ADDC_R	addc 	%r16, %r17, %r28
thr3_resum_intr_15:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_15), 16, 16)) -> intp(3, 3, 1)
	wr      %r0, 0x5, %asr26
	.word 0x9e340011  ! 997: SUBC_R	orn 	%r16, %r17, %r15
	.word 0x84c40011  ! 999: ADDCcc_R	addccc 	%r16, %r17, %r2
	.word 0x8d343001  ! 999: SRLX_I	srlx	%r16, 0x0001, %r6
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
        setx  0x0000000000000490, %g1, %r17
        setx  0x8d9c3241a8e51219, %g1, %r0
        setx  0x49acdc4507a7248b, %g1, %r1
        setx  0x8fcd4c00e1d83f6a, %g1, %r2
        setx  0xfa1a1fd5e920a26f, %g1, %r3
        setx  0xa5b69d6b50976e0d, %g1, %r4
        setx  0xf5ba6c108884146d, %g1, %r5
        setx  0xe9e85d4fd8232d1d, %g1, %r6
        setx  0x663351383311f4d7, %g1, %r7
        setx  0xfcb456c243d1d15d, %g1, %r8
        setx  0x6c4467ecad6c84b5, %g1, %r9
        setx  0xce7c44aa25b0ca1d, %g1, %r10
        setx  0x34dc00f25b0746ef, %g1, %r11
        setx  0x1ffc350c64af4512, %g1, %r12
        setx  0xbc9788bbea48fc10, %g1, %r13
        setx  0x71f867daf4977a4d, %g1, %r14
        setx  0x21027913b4070afa, %g1, %r15
        setx  0x53f3cec05dd72d7d, %g1, %r18
        setx  0xf5160ce65012a199, %g1, %r19
        setx  0xc3ff357dee8bb08e, %g1, %r20
        setx  0x1d1007eaa36a63a8, %g1, %r21
        setx  0xe74d69c611468a02, %g1, %r22
        setx  0x13b44b9d55663122, %g1, %r23
        setx  0x99efee16df49f2df, %g1, %r24
        setx  0xebb32f33fde2db7b, %g1, %r25
        setx  0x961099abb34b4252, %g1, %r26
        setx  0xbd6b0173d8d968ae, %g1, %r27
        setx  0xfbcc8a65b34414b5, %g1, %r28
        setx  0x59757ea0d170e0ac, %g1, %r29
        setx  0x0ffe892e30af0dba, %g1, %r30
        setx  0x31887f949549b5f6, %g1, %r31
	save %r0, %r0, %r31
        setx  MAIN_BASE_DATA_VA, %r1, %r16
        setx  0x0000000000000990, %g1, %r17
        setx  0x364dd12a2277fb13, %g1, %r0
        setx  0xea0940fc69016c8b, %g1, %r1
        setx  0x55d0d44422195505, %g1, %r2
        setx  0xba1c6c42ee1ffe01, %g1, %r3
        setx  0xfd1849d4cd47f9ac, %g1, %r4
        setx  0x8d5e82415518724c, %g1, %r5
        setx  0x4b3d4a5e21f8cbf6, %g1, %r6
        setx  0x311ddda61088647d, %g1, %r7
        setx  0x2e566cedc6283fc4, %g1, %r8
        setx  0x54b4dcf302a50610, %g1, %r9
        setx  0x14cf0fd834e2c859, %g1, %r10
        setx  0x0556e057444fd691, %g1, %r11
        setx  0x516fdf59a37725c1, %g1, %r12
        setx  0xf82b05314d7c986b, %g1, %r13
        setx  0x65dbf7339ffdc2fc, %g1, %r14
        setx  0x5372877d4e34a801, %g1, %r15
        setx  0x7768dff73260bc82, %g1, %r18
        setx  0xb238656ff5770574, %g1, %r19
        setx  0x0decdb5aa3eab717, %g1, %r20
        setx  0x9676ce1839207d6e, %g1, %r21
        setx  0x2116aca167c11793, %g1, %r22
        setx  0xbeda0082fce80d42, %g1, %r23
        setx  0x37b807e8b10864e5, %g1, %r24
        setx  0x98e8247b3a008003, %g1, %r25
        setx  0x2017d84db756acbf, %g1, %r26
        setx  0x3b1d95e710687161, %g1, %r27
        setx  0x715ca0607a2c1b66, %g1, %r28
        setx  0x1e154f9608735502, %g1, %r29
        setx  0x113386d2992ed622, %g1, %r30
        setx  0xbed4fc2c7cf51d5f, %g1, %r31
	save %r0, %r0, %r31
        setx  MAIN_BASE_DATA_VA, %r1, %r16
        setx  0x0000000000000ec0, %g1, %r17
        setx  0x6046addd69cd1eae, %g1, %r0
        setx  0xcad30f130ca1cd72, %g1, %r1
        setx  0xffc5df18c2f0e923, %g1, %r2
        setx  0x8b07301e57a96f77, %g1, %r3
        setx  0x7accc442117223f6, %g1, %r4
        setx  0x73ee1bc62d7d3f4e, %g1, %r5
        setx  0x0672a90107c55510, %g1, %r6
        setx  0x8993c6bcc1ed00f9, %g1, %r7
        setx  0x0b87ecd21f1ef42e, %g1, %r8
        setx  0x9e517ee390b2d15e, %g1, %r9
        setx  0xb39cfb090d198d80, %g1, %r10
        setx  0xded6789d455eabd9, %g1, %r11
        setx  0xeb01b7f5e89faf6d, %g1, %r12
        setx  0x5ac323c27df444fd, %g1, %r13
        setx  0x4f3e7d8547692e74, %g1, %r14
        setx  0xe939458f6885227d, %g1, %r15
        setx  0x021643faf8239ea0, %g1, %r18
        setx  0x559040aed973ec68, %g1, %r19
        setx  0x2fc866e0d4f1d9e3, %g1, %r20
        setx  0x8ce254b8ab1fe32d, %g1, %r21
        setx  0x25d7bcecea01b206, %g1, %r22
        setx  0x4d85212cad67c5a5, %g1, %r23
        setx  0x37c02dc905920b65, %g1, %r24
        setx  0xe09a64757fb9a859, %g1, %r25
        setx  0x2809004b837c1990, %g1, %r26
        setx  0x9707799454d5ff35, %g1, %r27
        setx  0xbb1d62ee779dd003, %g1, %r28
        setx  0x7fa86edd69443f2e, %g1, %r29
        setx  0x58d6fa15afe35a69, %g1, %r30
        setx  0xdc3b850bf9b544ca, %g1, %r31
	save %r0, %r0, %r31
        setx  MAIN_BASE_DATA_VA, %r1, %r16
        setx  0x0000000000000020, %g1, %r17
        setx  0xe59603b14c6da2bc, %g1, %r0
        setx  0x6790806ba7d227e3, %g1, %r1
        setx  0xb297581f00a51ca0, %g1, %r2
        setx  0x5bfb7e6c5f1f8677, %g1, %r3
        setx  0x30b5067365f546c8, %g1, %r4
        setx  0xe05622f5e3a285d1, %g1, %r5
        setx  0x068408725dfdd097, %g1, %r6
        setx  0x73517a5c610bab27, %g1, %r7
        setx  0xe4e19bebee9d1836, %g1, %r8
        setx  0x122e5415517a8ffc, %g1, %r9
        setx  0x9903e8d95d141f4a, %g1, %r10
        setx  0x3153611d6e8ba382, %g1, %r11
        setx  0x9a2214d1a046edd5, %g1, %r12
        setx  0xf9df2bad0424b921, %g1, %r13
        setx  0x060ec1517e5bf265, %g1, %r14
        setx  0x13a5cc787d4b6b79, %g1, %r15
        setx  0x2d2f631f225cbae8, %g1, %r18
        setx  0x2ca5402293c291fb, %g1, %r19
        setx  0x80d9301eab137cf5, %g1, %r20
        setx  0x9ef8689c9aa25c25, %g1, %r21
        setx  0x296dd3e976255356, %g1, %r22
        setx  0xf802d3e4096c546b, %g1, %r23
        setx  0xa721b971df3aa703, %g1, %r24
        setx  0x067480824ba87e53, %g1, %r25
        setx  0x79d3616415044fce, %g1, %r26
        setx  0x50e9d046b335c3f0, %g1, %r27
        setx  0x080bd790b473ff3b, %g1, %r28
        setx  0x0fdb071b5e48a819, %g1, %r29
        setx  0x1f1589ab4f13b4aa, %g1, %r30
        setx  0x1d1408cf2337dc0f, %g1, %r31
	save %r0, %r0, %r31
        setx  MAIN_BASE_DATA_VA, %r1, %r16
        setx  0x0000000000000ee0, %g1, %r17
        setx  0x9d7c4fc370f7dce0, %g1, %r0
        setx  0x68041e4b71501f8f, %g1, %r1
        setx  0x07c9b0022c5d1a0e, %g1, %r2
        setx  0xfa11c789cccc5389, %g1, %r3
        setx  0xa89826ab0e8abe25, %g1, %r4
        setx  0x8e7921a333006df7, %g1, %r5
        setx  0xee09ffab0eaa407f, %g1, %r6
        setx  0xc1d0536d5f1a725e, %g1, %r7
        setx  0xf6ee2948787c0eba, %g1, %r8
        setx  0xfc680e694a77ab3d, %g1, %r9
        setx  0x6a92dbc68a63e207, %g1, %r10
        setx  0x772f8c05cc2450a6, %g1, %r11
        setx  0xa04e286c6fb570d4, %g1, %r12
        setx  0xe78662cb44cb0788, %g1, %r13
        setx  0x4d56783f8691bc6f, %g1, %r14
        setx  0x7876dc1e6d8c30d9, %g1, %r15
        setx  0x1de5a1a9f170210a, %g1, %r18
        setx  0xa000ac53072a879a, %g1, %r19
        setx  0x9750ce87979df7da, %g1, %r20
        setx  0xec4b40771d9badfe, %g1, %r21
        setx  0xd0cc365cc1b8ed80, %g1, %r22
        setx  0xb7f862cf457eee22, %g1, %r23
        setx  0x11f9bb958ab6bbc6, %g1, %r24
        setx  0xb15f030a85c7035d, %g1, %r25
        setx  0xd1c68e4c4c23706f, %g1, %r26
        setx  0xc8c8daffdd85c2b2, %g1, %r27
        setx  0x1da405443cd9825c, %g1, %r28
        setx  0x96db6511ba982643, %g1, %r29
        setx  0x038a537bacff80bd, %g1, %r30
        setx  0xe33f2ee2bd8b16a2, %g1, %r31
	save %r0, %r0, %r31
        setx  MAIN_BASE_DATA_VA, %r1, %r16
        setx  0x0000000000000bc0, %g1, %r17
        setx  0x775cc1f57f2d8e10, %g1, %r0
        setx  0x893a9f1253918bac, %g1, %r1
        setx  0x6ace044b2d7f3883, %g1, %r2
        setx  0x744b485c527f1171, %g1, %r3
        setx  0x7c487c78eba20ebe, %g1, %r4
        setx  0xc266a9bf13630639, %g1, %r5
        setx  0xdbf63aa9c94bc726, %g1, %r6
        setx  0x397b7747cc49563d, %g1, %r7
        setx  0xbc77ffd477bb7137, %g1, %r8
        setx  0xd69e04eb5ee5869d, %g1, %r9
        setx  0xde8a61c8529a1bca, %g1, %r10
        setx  0xf1f9183b3da536b6, %g1, %r11
        setx  0x2d9b8918f2215c8e, %g1, %r12
        setx  0xcd244048a27e5120, %g1, %r13
        setx  0xf4b6a08374256b10, %g1, %r14
        setx  0xf4ff3d34ed470271, %g1, %r15
        setx  0x59c9e057c254f604, %g1, %r18
        setx  0x6488029b643eec39, %g1, %r19
        setx  0xee3b61f75aed32b8, %g1, %r20
        setx  0x77b1ceabd391982c, %g1, %r21
        setx  0xb8af2aace1f9bb55, %g1, %r22
        setx  0x66f35153f16da2f1, %g1, %r23
        setx  0x5b9a85d39b94377a, %g1, %r24
        setx  0x1db2e0ac1f6b9c23, %g1, %r25
        setx  0xb63e46653107d705, %g1, %r26
        setx  0xd80daaf4b24231a1, %g1, %r27
        setx  0x5be5595b7658a920, %g1, %r28
        setx  0xe732d2cbb01106c0, %g1, %r29
        setx  0xa23f2b2fa7df0bb4, %g1, %r30
        setx  0x42a62aac2edc44ce, %g1, %r31
	save %r0, %r0, %r31
        setx  MAIN_BASE_DATA_VA, %r1, %r16
        setx  0x0000000000000a50, %g1, %r17
        setx  0x80ea7356b4573030, %g1, %r0
        setx  0x17a70247c415c684, %g1, %r1
        setx  0xd5883a691b686d91, %g1, %r2
        setx  0x9369541e0e977007, %g1, %r3
        setx  0x95a0a9934aec4a26, %g1, %r4
        setx  0x361fbe03eec6d326, %g1, %r5
        setx  0x91a054168376744a, %g1, %r6
        setx  0x36e7e53c9eeb4c1e, %g1, %r7
        setx  0x1fc8168eb0164534, %g1, %r8
        setx  0x91f314bc59198934, %g1, %r9
        setx  0x99acf24f36f88aba, %g1, %r10
        setx  0xfe75865160c1f0f8, %g1, %r11
        setx  0x04145ce0e4884daa, %g1, %r12
        setx  0x45b1d428ae029c42, %g1, %r13
        setx  0x903b7fa69ae264b8, %g1, %r14
        setx  0x205265fa7581891f, %g1, %r15
        setx  0x70a864e98b28e630, %g1, %r18
        setx  0xf3e963c69eaaff81, %g1, %r19
        setx  0x9f7446c749635916, %g1, %r20
        setx  0x043dae60cb54a27b, %g1, %r21
        setx  0x8ee0042c45209b7f, %g1, %r22
        setx  0x68f4f0bb8676a597, %g1, %r23
        setx  0xcf02c08ae76df84b, %g1, %r24
        setx  0xb069ccd56d7ae9c0, %g1, %r25
        setx  0x75e9b51f45f20350, %g1, %r26
        setx  0xb3828c7667e09b39, %g1, %r27
        setx  0xeb419759521612d5, %g1, %r28
        setx  0xe8a80e6f4e56d35d, %g1, %r29
        setx  0xc5610aa1123cb5f1, %g1, %r30
        setx  0x32397fa928aa90c1, %g1, %r31
	save %r0, %r0, %r31
        setx  MAIN_BASE_DATA_VA, %r1, %r16
        setx  0x0000000000000c50, %g1, %r17
        setx  0xeb6e55a2459df0c0, %g1, %r0
        setx  0xf4b70bd4abd1b3a8, %g1, %r1
        setx  0x4fa745689f02e2e0, %g1, %r2
        setx  0x4a4e2de8319ee1af, %g1, %r3
        setx  0x997e00ba1cd3abb6, %g1, %r4
        setx  0x2d79cd3a88d6c288, %g1, %r5
        setx  0xecd25d680ba987ca, %g1, %r6
        setx  0x50a866064937139d, %g1, %r7
        setx  0x3ca404e370ce3ae5, %g1, %r8
        setx  0x3a5698d69b383dc5, %g1, %r9
        setx  0x359676e5414a1206, %g1, %r10
        setx  0x2b881aef50b1b9fa, %g1, %r11
        setx  0xe41a3cec0ba2e2c3, %g1, %r12
        setx  0x60b82d5df2833bf4, %g1, %r13
        setx  0x228f226ef2b9b3b3, %g1, %r14
        setx  0xfbdb83d1be465d63, %g1, %r15
        setx  0x51bd1035a21280f1, %g1, %r18
        setx  0x33042df97bbe9a15, %g1, %r19
        setx  0xf797e6f2c17b0246, %g1, %r20
        setx  0x1379dda27e7b9397, %g1, %r21
        setx  0x0b8c4ca3af16d1b1, %g1, %r22
        setx  0x078f7fbd0ac942de, %g1, %r23
        setx  0x3e955be438538544, %g1, %r24
        setx  0x2338d5349979914e, %g1, %r25
        setx  0xdc62a6cfe2e1a92a, %g1, %r26
        setx  0xe7e95e702f6dfa4c, %g1, %r27
        setx  0xd7b1f86e72f55707, %g1, %r28
        setx  0xe25383687b7e94d5, %g1, %r29
        setx  0x6b47fbd2348ac345, %g1, %r30
        setx  0xdc124ac44da2e8aa, %g1, %r31
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
	.word 0xce34222f  ! 1: STH_I	sth	%r7, [%r16 + 0x022f]
	.word 0x82840011  ! 3: ADDcc_R	addcc 	%r16, %r17, %r1
	.word 0xb1643801  ! 3: MOVcc_I	<illegal instruction>
	.word 0x908425bc  ! 3: ADDcc_I	addcc 	%r16, 0x05bc, %r8
	.word 0xa45c2e5d  ! 3: SMUL_I	smul 	%r16, 0x0e5d, %r18
	.word 0xf2242599  ! 5: STW_I	stw	%r25, [%r16 + 0x0599]
	.word 0x40000001  ! 7: CALL	call	disp30_1
	.word 0x9c040011  ! 8: ADD_R	add 	%r16, %r17, %r14
	.word 0xb81c0011  ! 10: XOR_R	xor 	%r16, %r17, %r28
	.word 0xc36c0011  ! 10: PREFETCH_R	prefetch	[%r16 + %r17], #one_read
	.word 0xe43423a7  ! 12: STH_I	sth	%r18, [%r16 + 0x03a7]
	.word 0x92b421dc  ! 14: ORNcc_I	orncc 	%r16, 0x01dc, %r9
	.word 0x98b40011  ! 14: ORNcc_R	orncc 	%r16, %r17, %r12
	.word 0xd07c2353  ! 14: SWAP_I	swap	%r8, [%r16 + 0x0353]
thr2_irf_ce_0:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_0), 16, 16),1,IRF,ce,13,x, x,x,x, x,x,x)
	.word 0xf62c2a43  ! 17: STB_I	stb	%r27, [%r16 + 0x0a43]
	.word 0x993c0011  ! 19: SRA_R	sra 	%r16, %r17, %r12
	.word 0xbe84241e  ! 19: ADDcc_I	addcc 	%r16, 0x041e, %r31
	.word 0x9b7c0411  ! 19: MOVR_R	move	%r16, %r17, %r13
	.word 0xcc9c2376  ! 19: LDDA_I	ldda	[%r16, + 0x0376] %asi, %r6
	.word 0xf02c0011  ! 20: STB_R	stb	%r24, [%r16 + %r17]
	.word 0x9c940011  ! 22: ORcc_R	orcc 	%r16, %r17, %r14
	.word 0x81580000  ! 22: FLUSHW	flushw
	.word 0xd6342da9  ! 24: STH_I	sth	%r11, [%r16 + 0x0da9]
	.word 0x85340011  ! 26: SRL_R	srl 	%r16, %r17, %r2
        wr %g0, 0x4, %fprs
	.word 0xd8340011  ! 27: STH_R	sth	%r12, [%r16 + %r17]
	.word 0x90b424b1  ! 29: ORNcc_I	orncc 	%r16, 0x04b1, %r8
	.word 0x8e3c0011  ! 29: XNOR_R	xnor 	%r16, %r17, %r7
	.word 0xb05c2257  ! 29: SMUL_I	smul 	%r16, 0x0257, %r24
	.word 0xd4740011  ! 30: STX_R	stx	%r10, [%r16 + %r17]
	.word 0x22800001  ! 32: BE	be,a	<label_0x1>
	.word 0xd2240011  ! 33: STW_R	stw	%r9, [%r16 + %r17]
	.word 0xb3643801  ! 35: MOVcc_I	<illegal instruction>
	.word 0x81880000  ! 35: RESTORED	saved
	.word 0x892c0011  ! 36: SLL_R	sll 	%r16, %r17, %r4
	.word 0xde042449  ! 38: LDUW_I	lduw	[%r16 + 0x0449], %r15
thr2_irf_ce_1:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_1), 16, 16),1,IRF,ce,70,x, x,x,x, x,x,x)
	.word 0xc2242f15  ! 41: STW_I	stw	%r1, [%r16 + 0x0f15]
	.word 0x90ac2f1f  ! 43: ANDNcc_I	andncc 	%r16, 0x0f1f, %r8
	.word 0x9c042887  ! 43: ADD_I	add 	%r16, 0x0887, %r14
	.word 0xb89c0011  ! 43: XORcc_R	xorcc 	%r16, %r17, %r28
	.word 0x93a00551  ! 43: FSQRTd	fsqrt	
	.word 0xf42c245f  ! 45: STB_I	stb	%r26, [%r16 + 0x045f]
	.word 0x3c800003  ! 47: BPOS	bpos,a	<label_0x3>
thr2_irf_ce_2:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_2), 16, 16),1,IRF,ce,46,x, x,x,x, x,x,x)
	.word 0xf4342f5b  ! 50: STH_I	sth	%r26, [%r16 + 0x0f5b]
	.word 0x92140011  ! 52: OR_R	or 	%r16, %r17, %r9
	.word 0xecfc220e  ! 52: SWAPA_I	swapa	%r22, [%r16 + 0x020e] %asi
	.word 0xc42c26a5  ! 54: STB_I	stb	%r2, [%r16 + 0x06a5]
	.word 0x848c0011  ! 56: ANDcc_R	andcc 	%r16, %r17, %r2
	.word 0x98840011  ! 56: ADDcc_R	addcc 	%r16, %r17, %r12
	.word 0x972c0011  ! 56: SLL_R	sll 	%r16, %r17, %r11
	.word 0x96740011  ! 56: UDIV_R	udiv 	%r16, %r17, %r11
	.word 0xb52c1011  ! 57: SLLX_R	sllx	%r16, %r17, %r26
	.word 0x857c2401  ! 59: MOVR_I	move	%r16, 0xfffffff8, %r2
	.word 0x892c2001  ! 59: SLL_I	sll 	%r16, 0x0001, %r4
	.word 0xca9c1011  ! 59: LDDA_R	ldda	[%r16, %r17] 0x80, %r5
	.word 0x85342001  ! 60: SRL_I	srl 	%r16, 0x0001, %r2
	.word 0x88142ad7  ! 62: OR_I	or 	%r16, 0x0ad7, %r4
	.word 0xa48c0011  ! 62: ANDcc_R	andcc 	%r16, %r17, %r18
	.word 0x93e40011  ! 62: SAVE_R	save	%r16, %r17, %r9
	.word 0xe6242357  ! 64: STW_I	stw	%r19, [%r16 + 0x0357]
	.word 0x85643801  ! 66: MOVcc_I	<illegal instruction>
	.word 0x9d343001  ! 66: SRLX_I	srlx	%r16, 0x0001, %r14
	.word 0x97484000  ! 66: RDHPR_HTSTATE	rdhpr	%htstate, %r11
	.word 0x86a40011  ! 67: SUBcc_R	subcc 	%r16, %r17, %r3
	.word 0xbe040011  ! 69: ADD_R	add 	%r16, %r17, %r31
	.word 0xb81c0011  ! 69: XOR_R	xor 	%r16, %r17, %r28
	.word 0x969c0011  ! 69: XORcc_R	xorcc 	%r16, %r17, %r11
	.word 0x81880000  ! 69: SAVED	saved
	.word 0xd6242ddb  ! 71: STW_I	stw	%r11, [%r16 + 0x0ddb]
	.word 0x902c2101  ! 73: ANDN_I	andn 	%r16, 0x0101, %r8
	.word 0xac342899  ! 73: ORN_I	orn 	%r16, 0x0899, %r22
	.word 0x892c2001  ! 73: SLL_I	sll 	%r16, 0x0001, %r4
	.word 0xc36c0011  ! 73: PREFETCH_R	prefetch	[%r16 + %r17], #one_read
	.word 0xd8240011  ! 74: STW_R	stw	%r12, [%r16 + %r17]
	.word 0x94b40011  ! 76: ORNcc_R	orncc 	%r16, %r17, %r10
	.word 0xdc9c1011  ! 76: LDDA_R	ldda	[%r16, %r17] 0x80, %r14
	.word 0xd6742df7  ! 78: STX_I	stx	%r11, [%r16 + 0x0df7]
	.word 0x0e800001  ! 80: BVS	bvs  	<label_0x1>
thr2_irf_ce_3:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_3), 16, 16),1,IRF,ce,64,x, x,x,x, x,x,x)
	.word 0xd67424c3  ! 83: STX_I	stx	%r11, [%r16 + 0x04c3]
	.word 0xad641811  ! 85: MOVcc_R	<illegal instruction>
	.word 0x9ec42255  ! 85: ADDCcc_I	addccc 	%r16, 0x0255, %r15
	.word 0x8143c000  ! 85: STBAR	stbar
	.word 0xd42c0011  ! 86: STB_R	stb	%r10, [%r16 + %r17]
	.word 0xbb341011  ! 88: SRLX_R	srlx	%r16, %r17, %r29
	.word 0x8143c000  ! 88: STBAR	stbar
	.word 0xd6240011  ! 89: STW_R	stw	%r11, [%r16 + %r17]
	.word 0x96b40011  ! 91: ORNcc_R	orncc 	%r16, %r17, %r11
	.word 0xc3ec1011  ! 91: PREFETCHA_R	prefetcha	[%r16, %r17] 0x80, #one_read
	.word 0xc82c2f95  ! 93: STB_I	stb	%r4, [%r16 + 0x0f95]
	.word 0xb6740011  ! 95: UDIV_R	udiv 	%r16, %r17, %r27
	.word 0xde2c0011  ! 96: STB_R	stb	%r15, [%r16 + %r17]
	.word 0xda9428f1  ! 98: LDUHA_I	lduha	[%r16, + 0x08f1] %asi, %r13
	.word 0x97641811  ! 99: MOVcc_R	<illegal instruction>
	.word 0x9a8c0011  ! 101: ANDcc_R	andcc 	%r16, %r17, %r13
	.word 0xaebc2c2c  ! 101: XNORcc_I	xnorcc 	%r16, 0x0c2c, %r23
	.word 0x8d500000  ! 101: RDPR_TPC	rdpr	%tpc, %r6
thr2_irf_ce_4:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_4), 16, 16),1,IRF,ce,55,x, x,x,x, x,x,x)
	.word 0xca2c20a3  ! 104: STB_I	stb	%r5, [%r16 + 0x00a3]
	.word 0x8c9c27b9  ! 106: XORcc_I	xorcc 	%r16, 0x07b9, %r6
	.word 0xb8840011  ! 106: ADDcc_R	addcc 	%r16, %r17, %r28
	.word 0x86ac2b15  ! 106: ANDNcc_I	andncc 	%r16, 0x0b15, %r3
	.word 0x32800001  ! 106: BNE	bne,a	<label_0x1>
	.word 0xaf3c0011  ! 107: SRA_R	sra 	%r16, %r17, %r23
thr2_resum_intr_0:
!$EV trig_pc_d(2,expr(@VA(.MAIN.thr2_resum_intr_0), 16, 16)) -> intp(2, 3, 1)
	wr      %r0, 0x5, %asr26
thr2_irf_ce_5:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_5), 16, 16),1,IRF,ce,8,x, x,x,x, x,x,x)
	.word 0xcc34212b  ! 112: STH_I	sth	%r6, [%r16 + 0x012b]
	.word 0xba140011  ! 114: OR_R	or 	%r16, %r17, %r29
	.word 0xa8340011  ! 114: ORN_R	orn 	%r16, %r17, %r20
	.word 0x983424d9  ! 114: ORN_I	orn 	%r16, 0x04d9, %r12
        wr %g0, 0x4, %fprs
	.word 0xd82428a1  ! 116: STW_I	stw	%r12, [%r16 + 0x08a1]
	.word 0x8a0c2f54  ! 118: AND_I	and 	%r16, 0x0f54, %r5
	.word 0xbb242e1e  ! 118: MULScc_I	mulscc 	%r16, 0x0e1e, %r29
thr2_irf_ce_6:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_6), 16, 16),1,IRF,ce,70,x, x,x,x, x,x,x)
	.word 0xe62c20ed  ! 121: STB_I	stb	%r19, [%r16 + 0x00ed]
	.word 0x04c40001  ! 123: BRLEZ	brlez  ,nt	%16,<label_0x40001>
	.word 0xca240011  ! 124: STW_R	stw	%r5, [%r16 + %r17]
	.word 0x903c0011  ! 126: XNOR_R	xnor 	%r16, %r17, %r8
	.word 0xac840011  ! 126: ADDcc_R	addcc 	%r16, %r17, %r22
	.word 0xc3e42011  ! 126: CASA_R	casa	[%r16] %asi, %r17, %r1
	.word 0xcc340011  ! 127: STH_R	sth	%r6, [%r16 + %r17]
	.word 0x94c40011  ! 129: ADDCcc_R	addccc 	%r16, %r17, %r10
	.word 0x3e800001  ! 129: BVC	bvc,a	<label_0x1>
	.word 0xa8240011  ! 130: SUB_R	sub 	%r16, %r17, %r20
	.word 0x99340011  ! 132: SRL_R	srl 	%r16, %r17, %r12
	.word 0x8d7c2401  ! 132: MOVR_I	move	%r16, 0xfffffff8, %r6
	.word 0xdacc1011  ! 132: LDSBA_R	ldsba	[%r16, %r17] 0x80, %r13
	.word 0x91340011  ! 133: SRL_R	srl 	%r16, %r17, %r8
	.word 0x9c340011  ! 135: ORN_R	orn 	%r16, %r17, %r14
	.word 0x828c0011  ! 135: ANDcc_R	andcc 	%r16, %r17, %r1
	.word 0x941c2e7f  ! 135: XOR_I	xor 	%r16, 0x0e7f, %r10
	.word 0xa8dc2fc2  ! 135: SMULcc_I	smulcc 	%r16, 0x0fc2, %r20
	.word 0xaac424be  ! 136: ADDCcc_I	addccc 	%r16, 0x04be, %r21
	.word 0xa8840011  ! 138: ADDcc_R	addcc 	%r16, %r17, %r20
	.word 0x8c042b52  ! 138: ADD_I	add 	%r16, 0x0b52, %r6
	.word 0x880c0011  ! 138: AND_R	and 	%r16, %r17, %r4
	.word 0xcab4244d  ! 138: STHA_I	stha	%r5, [%r16 + 0x044d] %asi
	.word 0x9c0c22c5  ! 139: AND_I	and 	%r16, 0x02c5, %r14
	.word 0x9eb427f0  ! 141: ORNcc_I	orncc 	%r16, 0x07f0, %r15
	.word 0x81580000  ! 141: FLUSHW	flushw
thr2_irf_ce_7:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_7), 16, 16),1,IRF,ce,52,x, x,x,x, x,x,x)
	.word 0xce24217f  ! 144: STW_I	stw	%r7, [%r16 + 0x017f]
	.word 0xeeec2792  ! 146: LDSTUBA_I	ldstuba	%r23, [%r16 + 0x0792] %asi
	.word 0xae042505  ! 147: ADD_I	add 	%r16, 0x0505, %r23
	.word 0x821c0011  ! 149: XOR_R	xor 	%r16, %r17, %r1
	.word 0xa7524000  ! 149: RDPR_CWP	<illegal instruction>
thr2_irf_ce_8:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_8), 16, 16),1,IRF,ce,27,x, x,x,x, x,x,x)
	.word 0xc62c2ebf  ! 152: STB_I	stb	%r3, [%r16 + 0x0ebf]
	.word 0x9f2c1011  ! 154: SLLX_R	sllx	%r16, %r17, %r15
	.word 0x81dc0011  ! 154: FLUSH_R	dis not found

thr2_irf_ce_9:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_9), 16, 16),1,IRF,ce,52,x, x,x,x, x,x,x)
	.word 0xdc242c97  ! 157: STW_I	stw	%r14, [%r16 + 0x0c97]
	ta	T_CHANGE_HPRIV	! macro
	.word 0xfe2c0011  ! 160: STB_R	stb	%r31, [%r16 + %r17]
	.word 0xa8940011  ! 162: ORcc_R	orcc 	%r16, %r17, %r20
	.word 0x87342001  ! 162: SRL_I	srl 	%r16, 0x0001, %r3
	.word 0x97343001  ! 162: SRLX_I	srlx	%r16, 0x0001, %r11
	.word 0xc3ec1011  ! 162: PREFETCHA_R	prefetcha	[%r16, %r17] 0x80, #one_read
	.word 0x99342001  ! 163: SRL_I	srl 	%r16, 0x0001, %r12
	ta	T_CHANGE_HPRIV	! macro
	.word 0xd2740011  ! 166: STX_R	stx	%r9, [%r16 + %r17]
	.word 0x81dc2bcf  ! 168: FLUSH_I	dis not found

thr2_irf_ce_10:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_10), 16, 16),1,IRF,ce,50,x, x,x,x, x,x,x)
	.word 0xc23426c7  ! 171: STH_I	sth	%r1, [%r16 + 0x06c7]
	.word 0x87641811  ! 173: MOVcc_R	<illegal instruction>
	.word 0x952c0011  ! 173: SLL_R	sll 	%r16, %r17, %r10
	.word 0xa40c0011  ! 173: AND_R	and 	%r16, %r17, %r18
	.word 0xd0fc1011  ! 173: SWAPA_R	swapa	%r8, [%r16 + %r17] 0x80
thr2_irf_ce_11:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_11), 16, 16),1,IRF,ce,55,x, x,x,x, x,x,x)
	.word 0xee742721  ! 176: STX_I	stx	%r23, [%r16 + 0x0721]
	.word 0xaa040011  ! 178: ADD_R	add 	%r16, %r17, %r21
	.word 0x82bc2d74  ! 178: XNORcc_I	xnorcc 	%r16, 0x0d74, %r1
	.word 0xb48c0011  ! 178: ANDcc_R	andcc 	%r16, %r17, %r26
	.word 0xd0ec2497  ! 178: LDSTUBA_I	ldstuba	%r8, [%r16 + 0x0497] %asi
	.word 0xfe742bd7  ! 180: STX_I	stx	%r31, [%r16 + 0x0bd7]
	.word 0xc3ec1011  ! 182: PREFETCHA_R	prefetcha	[%r16, %r17] 0x80, #one_read
	.word 0xbc0428f8  ! 183: ADD_I	add 	%r16, 0x08f8, %r30
	.word 0xc3ec1011  ! 185: PREFETCHA_R	prefetcha	[%r16, %r17] 0x80, #one_read
	.word 0xce2c241d  ! 187: STB_I	stb	%r7, [%r16 + 0x041d]
	.word 0x933c2001  ! 189: SRA_I	sra 	%r16, 0x0001, %r9
	.word 0x8cb42431  ! 189: ORNcc_I	orncc 	%r16, 0x0431, %r6
	.word 0x91341011  ! 189: SRLX_R	srlx	%r16, %r17, %r8
	.word 0x81580000  ! 189: FLUSHW	flushw
	.word 0xfe2428e5  ! 191: STW_I	stw	%r31, [%r16 + 0x08e5]
	.word 0x9eb42377  ! 193: ORNcc_I	orncc 	%r16, 0x0377, %r15
	.word 0x868c239f  ! 193: ANDcc_I	andcc 	%r16, 0x039f, %r3
	.word 0x8f342001  ! 193: SRL_I	srl 	%r16, 0x0001, %r7
	.word 0x8143c000  ! 193: STBAR	stbar
	.word 0xdc242d43  ! 195: STW_I	stw	%r14, [%r16 + 0x0d43]
	.word 0x81880000  ! 197: SAVED	saved
	.word 0xdc3424f7  ! 199: STH_I	sth	%r14, [%r16 + 0x04f7]
	.word 0x932c1011  ! 201: SLLX_R	sllx	%r16, %r17, %r9
	.word 0xb22c2217  ! 201: ANDN_I	andn 	%r16, 0x0217, %r25
	.word 0xb88c0011  ! 201: ANDcc_R	andcc 	%r16, %r17, %r28
thr2_resum_intr_1:
!$EV trig_pc_d(2,expr(@VA(.MAIN.thr2_resum_intr_1), 16, 16)) -> intp(2, 3, 1)
	wr      %r0, 0x5, %asr26
	.word 0xd6742339  ! 203: STX_I	stx	%r11, [%r16 + 0x0339]
	.word 0xbc3c2501  ! 205: XNOR_I	xnor 	%r16, 0x0501, %r30
	.word 0x8dec0011  ! 205: RESTORE_R	restore	%r16, %r17, %r6
	.word 0xd2740011  ! 206: STX_R	stx	%r9, [%r16 + %r17]
	.word 0x9a8c0011  ! 208: ANDcc_R	andcc 	%r16, %r17, %r13
	.word 0x928429da  ! 208: ADDcc_I	addcc 	%r16, 0x09da, %r9
	.word 0xaf343001  ! 208: SRLX_I	srlx	%r16, 0x0001, %r23
thr2_resum_intr_2:
!$EV trig_pc_d(2,expr(@VA(.MAIN.thr2_resum_intr_2), 16, 16)) -> intp(2, 3, 1)
	wr      %r0, 0x5, %asr26
	.word 0x8e3c0011  ! 209: XNOR_R	xnor 	%r16, %r17, %r7
	ta	T_CHANGE_HPRIV	! macro
	.word 0x87341011  ! 212: SRLX_R	srlx	%r16, %r17, %r3
	.word 0x9a840011  ! 214: ADDcc_R	addcc 	%r16, %r17, %r13
	.word 0xb2bc0011  ! 214: XNORcc_R	xnorcc 	%r16, %r17, %r25
        wr %g0, 0x4, %fprs
	.word 0x901c2db7  ! 215: XOR_I	xor 	%r16, 0x0db7, %r8
	.word 0xcb3c25dd  ! 217: STDF_I	std	%f5, [0x05dd, %r16]
	.word 0x96bc0011  ! 218: XNORcc_R	xnorcc 	%r16, %r17, %r11
	.word 0xaf3c2001  ! 220: SRA_I	sra 	%r16, 0x0001, %r23
	.word 0x8143e010  ! 220: MEMBAR	membar	#Lookaside 
	.word 0xf8342995  ! 222: STH_I	sth	%r28, [%r16 + 0x0995]
	.word 0x8143e053  ! 224: MEMBAR	membar	#LoadLoad | #StoreLoad | #Lookaside | #Sync 
	.word 0xf82c2e4d  ! 226: STB_I	stb	%r28, [%r16 + 0x0e4d]
	.word 0xb6c42f4f  ! 228: ADDCcc_I	addccc 	%r16, 0x0f4f, %r27
	.word 0x873c1011  ! 228: SRAX_R	srax	%r16, %r17, %r3
	.word 0x85e40011  ! 228: SAVE_R	save	%r16, %r17, %r2
	.word 0xde242af1  ! 230: STW_I	stw	%r15, [%r16 + 0x0af1]
	.word 0x40000001  ! 232: CALL	call	disp30_1
	.word 0xc62c0011  ! 233: STB_R	stb	%r3, [%r16 + %r17]
	.word 0x8cc40011  ! 235: ADDCcc_R	addccc 	%r16, %r17, %r6
	.word 0x8143c000  ! 235: STBAR	stbar
	.word 0xec242035  ! 237: STW_I	stw	%r22, [%r16 + 0x0035]
	.word 0xa43c2603  ! 239: XNOR_I	xnor 	%r16, 0x0603, %r18
	.word 0x81840011  ! 239: WRY_R	wr	%r16, %r17, %y
thr2_irf_ce_12:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_12), 16, 16),1,IRF,ce,44,x, x,x,x, x,x,x)
	.word 0xf234293b  ! 242: STH_I	sth	%r25, [%r16 + 0x093b]
	.word 0x84bc2c73  ! 244: XNORcc_I	xnorcc 	%r16, 0x0c73, %r2
	.word 0x81580000  ! 244: FLUSHW	flushw
thr2_irf_ce_13:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_13), 16, 16),1,IRF,ce,9,x, x,x,x, x,x,x)
	.word 0xe82c2e93  ! 247: STB_I	stb	%r20, [%r16 + 0x0e93]
	.word 0x8a5c0011  ! 249: SMUL_R	smul 	%r16, %r17, %r5
thr2_irf_ce_14:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_14), 16, 16),1,IRF,ce,58,x, x,x,x, x,x,x)
	.word 0xd02429bd  ! 252: STW_I	stw	%r8, [%r16 + 0x09bd]
	.word 0x88940011  ! 254: ORcc_R	orcc 	%r16, %r17, %r4
	.word 0x8143c000  ! 254: STBAR	stbar
	.word 0xa884204d  ! 255: ADDcc_I	addcc 	%r16, 0x004d, %r20
	.word 0x92bc0011  ! 257: XNORcc_R	xnorcc 	%r16, %r17, %r9
	.word 0xd9e42011  ! 257: CASA_R	casa	[%r16] %asi, %r17, %r12
thr2_irf_ce_15:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_15), 16, 16),1,IRF,ce,48,x, x,x,x, x,x,x)
	.word 0xc8242099  ! 260: STW_I	stw	%r4, [%r16 + 0x0099]
	.word 0x8e3c2115  ! 262: XNOR_I	xnor 	%r16, 0x0115, %r7
	.word 0x88b427e3  ! 262: ORNcc_I	orncc 	%r16, 0x07e3, %r4
	.word 0xb2ac0011  ! 262: ANDNcc_R	andncc 	%r16, %r17, %r25
        wr %g0, 0x4, %fprs
thr2_irf_ce_16:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_16), 16, 16),1,IRF,ce,47,x, x,x,x, x,x,x)
	.word 0xec24239b  ! 265: STW_I	stw	%r22, [%r16 + 0x039b]
	.word 0xbd2c3001  ! 267: SLLX_I	sllx	%r16, 0x0001, %r30
	.word 0xb22c0011  ! 267: ANDN_R	andn 	%r16, %r17, %r25
	.word 0x8d643801  ! 267: MOVcc_I	<illegal instruction>
        wr %g0, 0x4, %fprs
thr2_irf_ce_17:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_17), 16, 16),1,IRF,ce,29,x, x,x,x, x,x,x)
	.word 0xda24246d  ! 270: STW_I	stw	%r13, [%r16 + 0x046d]
	.word 0x969c0011  ! 272: XORcc_R	xorcc 	%r16, %r17, %r11
	.word 0xb340c000  ! 272: RDASI	rd	%asi, %r25
	.word 0xd4342b41  ! 274: STH_I	sth	%r10, [%r16 + 0x0b41]
	.word 0xa57c0411  ! 276: MOVR_R	move	%r16, %r17, %r18
	.word 0x8efc2b60  ! 276: SDIVcc_I	sdivcc 	%r16, 0x0b60, %r7
	.word 0x9a940011  ! 277: ORcc_R	orcc 	%r16, %r17, %r13
	.word 0xad7c0411  ! 279: MOVR_R	move	%r16, %r17, %r22
	.word 0x8b2c0011  ! 279: SLL_R	sll 	%r16, %r17, %r5
	.word 0xb9494000  ! 279: RDHPR_HTBA	rdhpr	%htba, %r28
	.word 0xfe240011  ! 280: STW_R	stw	%r31, [%r16 + %r17]
	.word 0xa6bc0011  ! 282: XNORcc_R	xnorcc 	%r16, %r17, %r19
	.word 0x81dc286a  ! 282: FLUSH_I	dis not found

	.word 0xfe240011  ! 283: STW_R	stw	%r31, [%r16 + %r17]
	.word 0x932c2001  ! 285: SLL_I	sll 	%r16, 0x0001, %r9
	.word 0xbec42733  ! 285: ADDCcc_I	addccc 	%r16, 0x0733, %r31
thr2_resum_intr_3:
!$EV trig_pc_d(2,expr(@VA(.MAIN.thr2_resum_intr_3), 16, 16)) -> intp(2, 3, 1)
	wr      %r0, 0x5, %asr26
	.word 0xfa34289b  ! 287: STH_I	sth	%r29, [%r16 + 0x089b]
	.word 0x9c0c2ab3  ! 289: AND_I	and 	%r16, 0x0ab3, %r14
	.word 0xb3504000  ! 289: RDPR_TNPC	<illegal instruction>
	.word 0xcc7420db  ! 291: STX_I	stx	%r6, [%r16 + 0x00db]
	.word 0x9c042caf  ! 293: ADD_I	add 	%r16, 0x0caf, %r14
	.word 0xae440011  ! 293: ADDC_R	addc 	%r16, %r17, %r23
	.word 0xac8c0011  ! 293: ANDcc_R	andcc 	%r16, %r17, %r22
	.word 0xc2ac232e  ! 293: STBA_I	stba	%r1, [%r16 + 0x032e] %asi
	.word 0xe8742f7d  ! 295: STX_I	stx	%r20, [%r16 + 0x0f7d]
	.word 0x8f3c0011  ! 297: SRA_R	sra 	%r16, %r17, %r7
	.word 0x913c1011  ! 297: SRAX_R	srax	%r16, %r17, %r8
	.word 0xc3ec2f49  ! 297: PREFETCHA_I	prefetcha	[%r16, + 0x0f49] %asi, #one_read
thr2_irf_ce_18:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_18), 16, 16),1,IRF,ce,18,x, x,x,x, x,x,x)
	.word 0xea34204b  ! 300: STH_I	sth	%r21, [%r16 + 0x004b]
	.word 0x96b40011  ! 302: ORNcc_R	orncc 	%r16, %r17, %r11
	.word 0xfb3c0011  ! 302: STDF_R	std	%f29, [%r17, %r16]
	.word 0xda2c0011  ! 303: STB_R	stb	%r13, [%r16 + %r17]
	.word 0x88f40011  ! 305: UDIVcc_R	udivcc 	%r16, %r17, %r4
	.word 0xd8242677  ! 307: STW_I	stw	%r12, [%r16 + 0x0677]
	.word 0x93641811  ! 309: MOVcc_R	<illegal instruction>
	.word 0xb22c0011  ! 309: ANDN_R	andn 	%r16, %r17, %r25
	.word 0xba0c2a38  ! 309: AND_I	and 	%r16, 0x0a38, %r29
	.word 0x826c0011  ! 309: UDIVX_R	udivx 	%r16, %r17, %r1
	.word 0xde242f4f  ! 311: STW_I	stw	%r15, [%r16 + 0x0f4f]
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x8b3c0011  ! 314: SRA_R	sra 	%r16, %r17, %r5
	.word 0xa6bc2806  ! 316: XNORcc_I	xnorcc 	%r16, 0x0806, %r19
	.word 0xa5641811  ! 316: MOVcc_R	<illegal instruction>
        wr %g0, 0x4, %fprs
	.word 0xa8942f84  ! 317: ORcc_I	orcc 	%r16, 0x0f84, %r20
	.word 0x8a4c0011  ! 319: MULX_R	mulx 	%r16, %r17, %r5
thr2_irf_ce_19:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_19), 16, 16),1,IRF,ce,69,x, x,x,x, x,x,x)
	.word 0xc474258f  ! 322: STX_I	stx	%r2, [%r16 + 0x058f]
	.word 0x9e0c0011  ! 324: AND_R	and 	%r16, %r17, %r15
	.word 0x8ec40011  ! 324: ADDCcc_R	addccc 	%r16, %r17, %r7
thr2_resum_intr_4:
!$EV trig_pc_d(2,expr(@VA(.MAIN.thr2_resum_intr_4), 16, 16)) -> intp(2, 3, 1)
	wr      %r0, 0x5, %asr26
thr2_irf_ce_20:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_20), 16, 16),1,IRF,ce,68,x, x,x,x, x,x,x)
	.word 0xd22c2513  ! 327: STB_I	stb	%r9, [%r16 + 0x0513]
	.word 0xab2c0011  ! 329: SLL_R	sll 	%r16, %r17, %r21
	.word 0xc6841011  ! 329: LDUWA_R	lduwa	[%r16, %r17] 0x80, %r3
	.word 0xfe2c0011  ! 330: STB_R	stb	%r31, [%r16 + %r17]
	.word 0xb0942087  ! 332: ORcc_I	orcc 	%r16, 0x0087, %r24
	.word 0x99341011  ! 332: SRLX_R	srlx	%r16, %r17, %r12
	.word 0x8ec42441  ! 332: ADDCcc_I	addccc 	%r16, 0x0441, %r7
	.word 0xd81c2112  ! 332: LDD_I	ldd	[%r16 + 0x0112], %r12
	.word 0xc62c2bb7  ! 334: STB_I	stb	%r3, [%r16 + 0x0bb7]
	.word 0xaa1c20be  ! 336: XOR_I	xor 	%r16, 0x00be, %r21
	.word 0xaef40011  ! 336: UDIVcc_R	udivcc 	%r16, %r17, %r23
thr2_irf_ce_21:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_21), 16, 16),1,IRF,ce,58,x, x,x,x, x,x,x)
	.word 0xf23422b9  ! 339: STH_I	sth	%r25, [%r16 + 0x02b9]
	.word 0xa77c2401  ! 341: MOVR_I	move	%r16, 0xfffffff8, %r19
	.word 0xc5e42011  ! 341: CASA_R	casa	[%r16] %asi, %r17, %r2
thr2_irf_ce_22:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_22), 16, 16),1,IRF,ce,16,x, x,x,x, x,x,x)
	.word 0xf62c26e5  ! 344: STB_I	stb	%r27, [%r16 + 0x06e5]
	.word 0x85840011  ! 346: WRCCR_R	wr	%r16, %r17, %ccr
thr2_irf_ce_23:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_23), 16, 16),1,IRF,ce,62,x, x,x,x, x,x,x)
	.word 0xf62426c9  ! 349: STW_I	stw	%r27, [%r16 + 0x06c9]
	.word 0x8f341011  ! 351: SRLX_R	srlx	%r16, %r17, %r7
	.word 0x81580000  ! 351: FLUSHW	flushw
	.word 0xde740011  ! 352: STX_R	stx	%r15, [%r16 + %r17]
	.word 0x861c0011  ! 354: XOR_R	xor 	%r16, %r17, %r3
	.word 0xdcf41011  ! 354: STXA_R	stxa	%r14, [%r16 + %r17] 0x80
thr2_irf_ce_24:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_24), 16, 16),1,IRF,ce,43,x, x,x,x, x,x,x)
	.word 0xfa74267b  ! 357: STX_I	stx	%r29, [%r16 + 0x067b]
	.word 0x94040011  ! 359: ADD_R	add 	%r16, %r17, %r10
	.word 0xa8440011  ! 359: ADDC_R	addc 	%r16, %r17, %r20
	.word 0x8143c000  ! 359: STBAR	stbar
thr2_irf_ce_25:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_25), 16, 16),1,IRF,ce,35,x, x,x,x, x,x,x)
	.word 0xd8342fe5  ! 362: STH_I	sth	%r12, [%r16 + 0x0fe5]
	.word 0x82fc0011  ! 364: SDIVcc_R	sdivcc 	%r16, %r17, %r1
	.word 0x8a9c0011  ! 365: XORcc_R	xorcc 	%r16, %r17, %r5
	.word 0x963c2702  ! 367: XNOR_I	xnor 	%r16, 0x0702, %r11
	.word 0x9c440011  ! 367: ADDC_R	addc 	%r16, %r17, %r14
	.word 0xce7c2e55  ! 367: SWAP_I	swap	%r7, [%r16 + 0x0e55]
thr2_irf_ce_26:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_26), 16, 16),1,IRF,ce,10,x, x,x,x, x,x,x)
	.word 0xde2c26ad  ! 370: STB_I	stb	%r15, [%r16 + 0x06ad]
	.word 0xbcf40011  ! 372: UDIVcc_R	udivcc 	%r16, %r17, %r30
	.word 0x943c2e2d  ! 373: XNOR_I	xnor 	%r16, 0x0e2d, %r10
	.word 0xb23c26ba  ! 375: XNOR_I	xnor 	%r16, 0x06ba, %r25
	.word 0xb6ac0011  ! 375: ANDNcc_R	andncc 	%r16, %r17, %r27
	.word 0x81dc2db4  ! 375: FLUSH_I	dis not found

	.word 0xec240011  ! 376: STW_R	stw	%r22, [%r16 + %r17]
	.word 0xb37c2401  ! 378: MOVR_I	move	%r16, 0xfffffff8, %r25
	.word 0x8cbc22cb  ! 378: XNORcc_I	xnorcc 	%r16, 0x02cb, %r6
	.word 0x92042370  ! 378: ADD_I	add 	%r16, 0x0370, %r9
	.word 0x866c2efa  ! 378: UDIVX_I	udivx 	%r16, 0x0efa, %r3
thr2_irf_ce_27:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_27), 16, 16),1,IRF,ce,44,x, x,x,x, x,x,x)
	.word 0xf4242667  ! 381: STW_I	stw	%r26, [%r16 + 0x0667]
	.word 0x81dc2d54  ! 383: FLUSH_I	dis not found

	.word 0xf43420a5  ! 385: STH_I	sth	%r26, [%r16 + 0x00a5]
	.word 0xbf342001  ! 387: SRL_I	srl 	%r16, 0x0001, %r31
	.word 0xbf342001  ! 387: SRL_I	srl 	%r16, 0x0001, %r31
	.word 0x81dc247d  ! 387: FLUSH_I	dis not found

	.word 0xf02c0011  ! 388: STB_R	stb	%r24, [%r16 + %r17]
	.word 0x8f3c0011  ! 390: SRA_R	sra 	%r16, %r17, %r7
	.word 0x8143e019  ! 390: MEMBAR	membar	#LoadLoad | #StoreStore | #Lookaside 
	.word 0xda24229f  ! 392: STW_I	stw	%r13, [%r16 + 0x029f]
	.word 0x8f3c2001  ! 394: SRA_I	sra 	%r16, 0x0001, %r7
	.word 0xbe1c0011  ! 394: XOR_R	xor 	%r16, %r17, %r31
	.word 0x85e40011  ! 394: SAVE_R	save	%r16, %r17, %r2
	.word 0xf4742f1b  ! 396: STX_I	stx	%r26, [%r16 + 0x0f1b]
	.word 0x9b342001  ! 398: SRL_I	srl 	%r16, 0x0001, %r13
	.word 0x99643801  ! 398: MOVcc_I	<illegal instruction>
	.word 0xb72c3001  ! 398: SLLX_I	sllx	%r16, 0x0001, %r27
	.word 0x81580000  ! 398: FLUSHW	flushw
	.word 0xd4342827  ! 400: STH_I	sth	%r10, [%r16 + 0x0827]
	.word 0x8f7c2401  ! 402: MOVR_I	move	%r16, 0xfffffff8, %r7
	.word 0x8b3c1011  ! 402: SRAX_R	srax	%r16, %r17, %r5
	.word 0x81dc2cf4  ! 402: FLUSH_I	dis not found

thr2_irf_ce_28:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_28), 16, 16),1,IRF,ce,58,x, x,x,x, x,x,x)
	.word 0xd22c238f  ! 405: STB_I	stb	%r9, [%r16 + 0x038f]
	.word 0xb13c0011  ! 407: SRA_R	sra 	%r16, %r17, %r24
	.word 0x89341011  ! 407: SRLX_R	srlx	%r16, %r17, %r4
	.word 0xb0040011  ! 407: ADD_R	add 	%r16, %r17, %r24
	.word 0x887c0011  ! 407: SDIV_R	sdiv 	%r16, %r17, %r4
	.word 0xc8742d85  ! 409: STX_I	stx	%r4, [%r16 + 0x0d85]
	.word 0xb8042206  ! 411: ADD_I	add 	%r16, 0x0206, %r28
	.word 0xf0442f42  ! 411: LDSW_I	ldsw	[%r16 + 0x0f42], %r24
	.word 0xc6340011  ! 412: STH_R	sth	%r3, [%r16 + %r17]
	.word 0x909c0011  ! 414: XORcc_R	xorcc 	%r16, %r17, %r8
	.word 0x8143c000  ! 414: STBAR	stbar
thr2_irf_ce_29:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_29), 16, 16),1,IRF,ce,57,x, x,x,x, x,x,x)
	.word 0xf8342e87  ! 417: STH_I	sth	%r28, [%r16 + 0x0e87]
	.word 0x9c442b3b  ! 419: ADDC_I	addc 	%r16, 0x0b3b, %r14
	.word 0x86ac20d2  ! 419: ANDNcc_I	andncc 	%r16, 0x00d2, %r3
	.word 0x32800001  ! 419: BNE	bne,a	<label_0x1>
	.word 0xce740011  ! 420: STX_R	stx	%r7, [%r16 + %r17]
	.word 0x26800001  ! 422: BL	bl,a	<label_0x1>
	.word 0xf8342723  ! 424: STH_I	sth	%r28, [%r16 + 0x0723]
	.word 0x9b343001  ! 426: SRLX_I	srlx	%r16, 0x0001, %r13
	.word 0xb60c2bad  ! 426: AND_I	and 	%r16, 0x0bad, %r27
	.word 0xcc941011  ! 426: LDUHA_R	lduha	[%r16, %r17] 0x80, %r6
	.word 0xd4240011  ! 427: STW_R	stw	%r10, [%r16 + %r17]
thr2_resum_intr_5:
!$EV trig_pc_d(2,expr(@VA(.MAIN.thr2_resum_intr_5), 16, 16)) -> intp(2, 3, 1)
	wr      %r0, 0x5, %asr26
	.word 0xde2c2dab  ! 431: STB_I	stb	%r15, [%r16 + 0x0dab]
	.word 0x92bc2bf7  ! 433: XNORcc_I	xnorcc 	%r16, 0x0bf7, %r9
	.word 0x885c2bc9  ! 433: SMUL_I	smul 	%r16, 0x0bc9, %r4
	.word 0xd0342b59  ! 435: STH_I	sth	%r8, [%r16 + 0x0b59]
	.word 0x9c0c0011  ! 437: AND_R	and 	%r16, %r17, %r14
	.word 0x8eb40011  ! 437: ORNcc_R	orncc 	%r16, %r17, %r7
	.word 0xc84c0011  ! 437: LDSB_R	ldsb	[%r16 + %r17], %r4
	.word 0xc2240011  ! 438: STW_R	stw	%r1, [%r16 + %r17]
	.word 0x8a842dea  ! 440: ADDcc_I	addcc 	%r16, 0x0dea, %r5
	.word 0x8f2c1011  ! 440: SLLX_R	sllx	%r16, %r17, %r7
	.word 0xb0ac0011  ! 440: ANDNcc_R	andncc 	%r16, %r17, %r24
	.word 0xd0cc2b57  ! 440: LDSBA_I	ldsba	[%r16, + 0x0b57] %asi, %r8
	.word 0xec740011  ! 441: STX_R	stx	%r22, [%r16 + %r17]
	.word 0xab7c0411  ! 443: MOVR_R	move	%r16, %r17, %r21
	.word 0x8f641811  ! 443: MOVcc_R	<illegal instruction>
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x99340011  ! 444: SRL_R	srl 	%r16, %r17, %r12
	.word 0xc36c242a  ! 446: PREFETCH_I	prefetch	[%r16 + 0x042a], #one_read
thr2_irf_ce_30:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_30), 16, 16),1,IRF,ce,41,x, x,x,x, x,x,x)
	.word 0xd4742f0b  ! 449: STX_I	stx	%r10, [%r16 + 0x0f0b]
	.word 0xbac42bad  ! 451: ADDCcc_I	addccc 	%r16, 0x0bad, %r29
	.word 0xe6a41011  ! 451: STWA_R	stwa	%r19, [%r16 + %r17] 0x80
	.word 0xc22c0011  ! 452: STB_R	stb	%r1, [%r16 + %r17]
	.word 0x8e440011  ! 454: ADDC_R	addc 	%r16, %r17, %r7
	.word 0x89341011  ! 454: SRLX_R	srlx	%r16, %r17, %r4
	.word 0x9b340011  ! 454: SRL_R	srl 	%r16, %r17, %r13
        wr %g0, 0x4, %fprs
	.word 0xd0740011  ! 455: STX_R	stx	%r8, [%r16 + %r17]
	.word 0xa4142cc7  ! 457: OR_I	or 	%r16, 0x0cc7, %r18
	.word 0xa72c2001  ! 457: SLL_I	sll 	%r16, 0x0001, %r19
	.word 0xf0440011  ! 457: LDSW_R	ldsw	[%r16 + %r17], %r24
	.word 0xc6742dd9  ! 459: STX_I	stx	%r3, [%r16 + 0x0dd9]
	.word 0x8ebc0011  ! 461: XNORcc_R	xnorcc 	%r16, %r17, %r7
	.word 0xb9341011  ! 461: SRLX_R	srlx	%r16, %r17, %r28
	.word 0xd0bc1011  ! 461: STDA_R	stda	%r8, [%r16 + %r17] 0x80
thr2_irf_ce_31:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_31), 16, 16),1,IRF,ce,60,x, x,x,x, x,x,x)
	.word 0xfa34299b  ! 464: STH_I	sth	%r29, [%r16 + 0x099b]
	.word 0xb0b40011  ! 466: ORNcc_R	orncc 	%r16, %r17, %r24
	.word 0x90d40011  ! 466: UMULcc_R	umulcc 	%r16, %r17, %r8
	.word 0xc874200f  ! 468: STX_I	stx	%r4, [%r16 + 0x000f]
	.word 0xaac40011  ! 470: ADDCcc_R	addccc 	%r16, %r17, %r21
	.word 0x973c0011  ! 470: SRA_R	sra 	%r16, %r17, %r11
	.word 0x8cfc0011  ! 470: SDIVcc_R	sdivcc 	%r16, %r17, %r6
thr2_irf_ce_32:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_32), 16, 16),1,IRF,ce,43,x, x,x,x, x,x,x)
	.word 0xf8342e13  ! 473: STH_I	sth	%r28, [%r16 + 0x0e13]
	.word 0x969c0011  ! 475: XORcc_R	xorcc 	%r16, %r17, %r11
	.word 0x9b514000  ! 475: RDPR_TBA	rdpr	%tba, %r13
	.word 0xf6240011  ! 476: STW_R	stw	%r27, [%r16 + %r17]
	.word 0xd81c0011  ! 478: LDD_R	ldd	[%r16 + %r17], %r12
thr2_irf_ce_33:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_33), 16, 16),1,IRF,ce,29,x, x,x,x, x,x,x)
	.word 0xd2242d2d  ! 481: STW_I	stw	%r9, [%r16 + 0x0d2d]
	.word 0x88c42fbc  ! 483: ADDCcc_I	addccc 	%r16, 0x0fbc, %r4
	.word 0xa8342a49  ! 483: ORN_I	orn 	%r16, 0x0a49, %r20
	.word 0x90bc2fa3  ! 483: XNORcc_I	xnorcc 	%r16, 0x0fa3, %r8
	ta	T_CHANGE_PRIV	! macro
thr2_irf_ce_34:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_34), 16, 16),1,IRF,ce,12,x, x,x,x, x,x,x)
	.word 0xe4242229  ! 486: STW_I	stw	%r18, [%r16 + 0x0229]
	.word 0x8b2c1011  ! 488: SLLX_R	sllx	%r16, %r17, %r5
	.word 0x8d3c2001  ! 488: SRA_I	sra 	%r16, 0x0001, %r6
	.word 0x860c2d38  ! 488: AND_I	and 	%r16, 0x0d38, %r3
	.word 0xc27c0011  ! 488: SWAP_R	swap	%r1, [%r16 + %r17]
	.word 0x88ac2d7a  ! 489: ANDNcc_I	andncc 	%r16, 0x0d7a, %r4
	.word 0x8eac0011  ! 491: ANDNcc_R	andncc 	%r16, %r17, %r7
	.word 0x969c28cd  ! 491: XORcc_I	xorcc 	%r16, 0x08cd, %r11
	.word 0x942c0011  ! 491: ANDN_R	andn 	%r16, %r17, %r10
	.word 0x956c0011  ! 491: SDIVX_R	sdivx	%r16, %r17, %r10
	.word 0xbebc2454  ! 492: XNORcc_I	xnorcc 	%r16, 0x0454, %r31
	.word 0x988429b9  ! 494: ADDcc_I	addcc 	%r16, 0x09b9, %r12
	.word 0x8c2c2c8d  ! 494: ANDN_I	andn 	%r16, 0x0c8d, %r6
	.word 0x04cc0003  ! 494: BRLEZ	brlez  ,pt	%16,<label_0xc0003>
	.word 0xdc2c22eb  ! 496: STB_I	stb	%r14, [%r16 + 0x02eb]
	.word 0x8b3c2001  ! 498: SRA_I	sra 	%r16, 0x0001, %r5
	.word 0x81880000  ! 498: SAVED	saved
	.word 0xa8840011  ! 499: ADDcc_R	addcc 	%r16, %r17, %r20
	.word 0xb3ec0011  ! 501: RESTORE_R	restore	%r16, %r17, %r25
thr2_irf_ce_35:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_35), 16, 16),1,IRF,ce,66,x, x,x,x, x,x,x)
	.word 0xc22c2a15  ! 504: STB_I	stb	%r1, [%r16 + 0x0a15]
	.word 0xaf3c1011  ! 506: SRAX_R	srax	%r16, %r17, %r23
	.word 0xaf3c2001  ! 506: SRA_I	sra 	%r16, 0x0001, %r23
	.word 0x8ec4272a  ! 506: ADDCcc_I	addccc 	%r16, 0x072a, %r7
	.word 0x81880000  ! 506: RESTORED	saved
	.word 0xea242055  ! 508: STW_I	stw	%r21, [%r16 + 0x0055]
	.word 0x8d7c2401  ! 510: MOVR_I	move	%r16, 0xfffffff8, %r6
	.word 0x87e40011  ! 510: SAVE_R	save	%r16, %r17, %r3
thr2_irf_ce_36:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_36), 16, 16),1,IRF,ce,7,x, x,x,x, x,x,x)
	.word 0xc434247f  ! 513: STH_I	sth	%r2, [%r16 + 0x047f]
	.word 0xc3ec2af8  ! 515: PREFETCHA_I	prefetcha	[%r16, + 0x0af8] %asi, #one_read
	.word 0xea740011  ! 516: STX_R	stx	%r21, [%r16 + %r17]
	.word 0x94c40011  ! 518: ADDCcc_R	addccc 	%r16, %r17, %r10
	.word 0xf40c0011  ! 518: LDUB_R	ldub	[%r16 + %r17], %r26
	.word 0xba2c2db8  ! 519: ANDN_I	andn 	%r16, 0x0db8, %r29
	.word 0x82140011  ! 521: OR_R	or 	%r16, %r17, %r1
	.word 0xb08c2ac5  ! 521: ANDcc_I	andcc 	%r16, 0x0ac5, %r24
        wr %g0, 0x4, %fprs
	.word 0xd4340011  ! 522: STH_R	sth	%r10, [%r16 + %r17]
	.word 0xa81c0011  ! 524: XOR_R	xor 	%r16, %r17, %r20
	.word 0x90342695  ! 524: ORN_I	orn 	%r16, 0x0695, %r8
	.word 0xeacc2b31  ! 524: LDSBA_I	ldsba	[%r16, + 0x0b31] %asi, %r21
	.word 0xbb643801  ! 525: MOVcc_I	<illegal instruction>
        wr %g0, 0x4, %fprs
thr2_irf_ce_37:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_37), 16, 16),1,IRF,ce,22,x, x,x,x, x,x,x)
	.word 0xc4242701  ! 530: STW_I	stw	%r2, [%r16 + 0x0701]
	.word 0xb53c1011  ! 532: SRAX_R	srax	%r16, %r17, %r26
	.word 0x9a040011  ! 532: ADD_R	add 	%r16, %r17, %r13
	.word 0xc3ec2bd7  ! 532: PREFETCHA_I	prefetcha	[%r16, + 0x0bd7] %asi, #one_read
	.word 0xc62c2bf9  ! 534: STB_I	stb	%r3, [%r16 + 0x0bf9]
	.word 0x9c9c2926  ! 536: XORcc_I	xorcc 	%r16, 0x0926, %r14
	.word 0xb0342327  ! 536: ORN_I	orn 	%r16, 0x0327, %r24
	.word 0x968c216a  ! 536: ANDcc_I	andcc 	%r16, 0x016a, %r11
        wr %g0, 0x4, %fprs
thr2_irf_ce_38:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_38), 16, 16),1,IRF,ce,25,x, x,x,x, x,x,x)
	.word 0xd42c2a67  ! 539: STB_I	stb	%r10, [%r16 + 0x0a67]
	.word 0x903c0011  ! 541: XNOR_R	xnor 	%r16, %r17, %r8
	.word 0x912c3001  ! 541: SLLX_I	sllx	%r16, 0x0001, %r8
	.word 0xb09c2686  ! 541: XORcc_I	xorcc 	%r16, 0x0686, %r24
	.word 0x85418000  ! 541: RDFPRS	rd	%fprs, %r2
	.word 0xd2240011  ! 542: STW_R	stw	%r9, [%r16 + %r17]
	.word 0x98b42ffd  ! 544: ORNcc_I	orncc 	%r16, 0x0ffd, %r12
	.word 0x87343001  ! 544: SRLX_I	srlx	%r16, 0x0001, %r3
	.word 0x8e842802  ! 544: ADDcc_I	addcc 	%r16, 0x0802, %r7
	ta	T_CHANGE_PRIV	! macro
	.word 0xde742d93  ! 546: STX_I	stx	%r15, [%r16 + 0x0d93]
	.word 0x8e840011  ! 548: ADDcc_R	addcc 	%r16, %r17, %r7
	.word 0x99343001  ! 548: SRLX_I	srlx	%r16, 0x0001, %r12
	.word 0xa753c000  ! 548: RDPR_FQ	<illegal instruction>
thr2_irf_ce_39:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_39), 16, 16),1,IRF,ce,44,x, x,x,x, x,x,x)
	.word 0xca342363  ! 551: STH_I	sth	%r5, [%r16 + 0x0363]
	.word 0x912c3001  ! 553: SLLX_I	sllx	%r16, 0x0001, %r8
	.word 0x8143e071  ! 553: MEMBAR	membar	#LoadLoad | #Lookaside | #MemIssue | #Sync 
	.word 0xce340011  ! 554: STH_R	sth	%r7, [%r16 + %r17]
	.word 0x9c2c2be5  ! 556: ANDN_I	andn 	%r16, 0x0be5, %r14
	.word 0xacb42724  ! 556: ORNcc_I	orncc 	%r16, 0x0724, %r22
	.word 0x8143e012  ! 556: MEMBAR	membar	#StoreLoad | #Lookaside 
thr2_irf_ce_40:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_40), 16, 16),1,IRF,ce,29,x, x,x,x, x,x,x)
	.word 0xd2342b7d  ! 559: STH_I	sth	%r9, [%r16 + 0x0b7d]
        wr %g0, 0x4, %fprs
	.word 0xbe9429e3  ! 562: ORcc_I	orcc 	%r16, 0x09e3, %r31
	.word 0xb43c0011  ! 564: XNOR_R	xnor 	%r16, %r17, %r26
	.word 0x8f340011  ! 564: SRL_R	srl 	%r16, %r17, %r7
	.word 0x848421d6  ! 564: ADDcc_I	addcc 	%r16, 0x01d6, %r2
thr2_resum_intr_6:
!$EV trig_pc_d(2,expr(@VA(.MAIN.thr2_resum_intr_6), 16, 16)) -> intp(2, 3, 1)
	wr      %r0, 0x5, %asr26
	.word 0xca2c2069  ! 566: STB_I	stb	%r5, [%r16 + 0x0069]
	.word 0xb12c3001  ! 568: SLLX_I	sllx	%r16, 0x0001, %r24
	.word 0x8c442ab2  ! 568: ADDC_I	addc 	%r16, 0x0ab2, %r6
	.word 0x81880000  ! 568: SAVED	saved
thr2_irf_ce_41:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_41), 16, 16),1,IRF,ce,14,x, x,x,x, x,x,x)
	.word 0xd2242175  ! 571: STW_I	stw	%r9, [%r16 + 0x0175]
	.word 0x943c0011  ! 573: XNOR_R	xnor 	%r16, %r17, %r10
	.word 0xb2140011  ! 573: OR_R	or 	%r16, %r17, %r25
	.word 0xbf2c3001  ! 573: SLLX_I	sllx	%r16, 0x0001, %r31
	.word 0xc3ec2d04  ! 573: PREFETCHA_I	prefetcha	[%r16, + 0x0d04] %asi, #one_read
thr2_irf_ce_42:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_42), 16, 16),1,IRF,ce,38,x, x,x,x, x,x,x)
	.word 0xce242555  ! 576: STW_I	stw	%r7, [%r16 + 0x0555]
	.word 0x880c0011  ! 578: AND_R	and 	%r16, %r17, %r4
	.word 0x924c0011  ! 578: MULX_R	mulx 	%r16, %r17, %r9
	.word 0xda340011  ! 579: STH_R	sth	%r13, [%r16 + %r17]
	.word 0xc36c259b  ! 581: PREFETCH_I	prefetch	[%r16 + 0x059b], #one_read
	.word 0xd6342ce3  ! 583: STH_I	sth	%r11, [%r16 + 0x0ce3]
	.word 0xa60c2440  ! 585: AND_I	and 	%r16, 0x0440, %r19
	.word 0xc8841011  ! 585: LDUWA_R	lduwa	[%r16, %r17] 0x80, %r4
	.word 0xca242fb1  ! 587: STW_I	stw	%r5, [%r16 + 0x0fb1]
	.word 0x849c0011  ! 589: XORcc_R	xorcc 	%r16, %r17, %r2
	.word 0x9a440011  ! 589: ADDC_R	addc 	%r16, %r17, %r13
thr2_resum_intr_7:
!$EV trig_pc_d(2,expr(@VA(.MAIN.thr2_resum_intr_7), 16, 16)) -> intp(2, 3, 1)
	wr      %r0, 0x5, %asr26
	.word 0x9a940011  ! 590: ORcc_R	orcc 	%r16, %r17, %r13
thr2_resum_intr_8:
!$EV trig_pc_d(2,expr(@VA(.MAIN.thr2_resum_intr_8), 16, 16)) -> intp(2, 3, 1)
	wr      %r0, 0x5, %asr26
thr2_irf_ce_43:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_43), 16, 16),1,IRF,ce,4,x, x,x,x, x,x,x)
	.word 0xce2c2f75  ! 595: STB_I	stb	%r7, [%r16 + 0x0f75]
	.word 0x924420e5  ! 597: ADDC_I	addc 	%r16, 0x00e5, %r9
	.word 0x89341011  ! 597: SRLX_R	srlx	%r16, %r17, %r4
	ta	T_CHANGE_PRIV	! macro
	.word 0xc22c0011  ! 598: STB_R	stb	%r1, [%r16 + %r17]
	.word 0x964429db  ! 600: ADDC_I	addc 	%r16, 0x09db, %r11
	.word 0x8f534000  ! 600: RDPR_OTHERWIN	rdpr	%otherwin, %r7
	.word 0xc2242cd9  ! 602: STW_I	stw	%r1, [%r16 + 0x0cd9]
	.word 0xf8c41011  ! 604: LDSWA_R	ldswa	[%r16, %r17] 0x80, %r28
	.word 0xc42c288b  ! 606: STB_I	stb	%r2, [%r16 + 0x088b]
	.word 0xc36c0011  ! 608: PREFETCH_R	prefetch	[%r16 + %r17], #one_read
	.word 0xec240011  ! 609: STW_R	stw	%r22, [%r16 + %r17]
	.word 0xdecc1011  ! 611: LDSBA_R	ldsba	[%r16, %r17] 0x80, %r15
	.word 0x9a8c0011  ! 612: ANDcc_R	andcc 	%r16, %r17, %r13
	.word 0x8a042784  ! 614: ADD_I	add 	%r16, 0x0784, %r5
	.word 0x9d641811  ! 614: MOVcc_R	<illegal instruction>
	.word 0x997c2401  ! 614: MOVR_I	move	%r16, 0xfffffff8, %r12
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x917c2401  ! 615: MOVR_I	move	%r16, 0x7fffbdd8, %r8
	.word 0x9e1c2ac8  ! 617: XOR_I	xor 	%r16, 0x0ac8, %r15
	.word 0x973c0011  ! 617: SRA_R	sra 	%r16, %r17, %r11
	.word 0x96d40011  ! 617: UMULcc_R	umulcc 	%r16, %r17, %r11
	.word 0x9c8c2490  ! 618: ANDcc_I	andcc 	%r16, 0x0490, %r14
	.word 0xbe1c0011  ! 620: XOR_R	xor 	%r16, %r17, %r31
	.word 0xdec42a06  ! 620: LDSWA_I	ldswa	[%r16, + 0x0a06] %asi, %r15
thr2_irf_ce_44:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_44), 16, 16),1,IRF,ce,64,x, x,x,x, x,x,x)
	.word 0xdc2c2f31  ! 623: STB_I	stb	%r14, [%r16 + 0x0f31]
	.word 0xdff41011  ! 625: CASXA_I	casxa	[%r16] 0x80, %r17, %r15
	.word 0xfc740011  ! 626: STX_R	stx	%r30, [%r16 + %r17]
	.word 0xb4bc0011  ! 628: XNORcc_R	xnorcc 	%r16, %r17, %r26
	.word 0xc36c0011  ! 628: PREFETCH_R	prefetch	[%r16 + %r17], #one_read
	.word 0x8a9c0011  ! 629: XORcc_R	xorcc 	%r16, %r17, %r5
	.word 0xc524235f  ! 631: STF_I	st	%f2, [0x035f, %r16]
	.word 0x92140011  ! 632: OR_R	or 	%r16, %r17, %r9
	.word 0xb68c0011  ! 634: ANDcc_R	andcc 	%r16, %r17, %r27
	.word 0x9e1c20ab  ! 634: XOR_I	xor 	%r16, 0x00ab, %r15
	.word 0xf8842eb0  ! 634: LDUWA_I	lduwa	[%r16, + 0x0eb0] %asi, %r28
	.word 0xea342d4d  ! 636: STH_I	sth	%r21, [%r16 + 0x0d4d]
	.word 0x9a842a3f  ! 638: ADDcc_I	addcc 	%r16, 0x0a3f, %r13
	.word 0xd2842e55  ! 638: LDUWA_I	lduwa	[%r16, + 0x0e55] %asi, %r9
	.word 0xdc740011  ! 639: STX_R	stx	%r14, [%r16 + %r17]
	.word 0x902c0011  ! 641: ANDN_R	andn 	%r16, %r17, %r8
	.word 0x81880000  ! 641: RESTORED	saved
	.word 0xc22c0011  ! 642: STB_R	stb	%r1, [%r16 + %r17]
	.word 0x8a8c221e  ! 644: ANDcc_I	andcc 	%r16, 0x021e, %r5
	.word 0xc3ec29ba  ! 644: PREFETCHA_I	prefetcha	[%r16, + 0x09ba] %asi, #one_read
thr2_irf_ce_45:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_45), 16, 16),1,IRF,ce,71,x, x,x,x, x,x,x)
	.word 0xc62c2fe3  ! 647: STB_I	stb	%r3, [%r16 + 0x0fe3]
	.word 0x0c800003  ! 649: BNEG	bneg  	<label_0x3>
	.word 0xa82c22b6  ! 650: ANDN_I	andn 	%r16, 0x02b6, %r20
	.word 0xb52c2001  ! 652: SLL_I	sll 	%r16, 0x0001, %r26
	.word 0xbb342001  ! 652: SRL_I	srl 	%r16, 0x0001, %r29
	.word 0x8143c000  ! 652: STBAR	stbar
	.word 0x909c2ad4  ! 653: XORcc_I	xorcc 	%r16, 0x0ad4, %r8
	.word 0xd0941011  ! 655: LDUHA_R	lduha	[%r16, %r17] 0x80, %r8
	.word 0x9cb40011  ! 656: ORNcc_R	orncc 	%r16, %r17, %r14
	.word 0x92940011  ! 658: ORcc_R	orcc 	%r16, %r17, %r9
	.word 0x95641811  ! 658: MOVcc_R	<illegal instruction>
	.word 0x8eac0011  ! 658: ANDNcc_R	andncc 	%r16, %r17, %r7
	.word 0x9cf40011  ! 658: UDIVcc_R	udivcc 	%r16, %r17, %r14
	.word 0xde2c24ab  ! 660: STB_I	stb	%r15, [%r16 + 0x04ab]
	.word 0x94c42fa3  ! 662: ADDCcc_I	addccc 	%r16, 0x0fa3, %r10
	.word 0x89340011  ! 662: SRL_R	srl 	%r16, %r17, %r4
	.word 0x04800001  ! 662: BLE	ble  	<label_0x1>
	.word 0x921428d3  ! 663: OR_I	or 	%r16, 0x08d3, %r9
	.word 0x90440011  ! 665: ADDC_R	addc 	%r16, %r17, %r8
	.word 0x942c2d2b  ! 665: ANDN_I	andn 	%r16, 0x0d2b, %r10
	.word 0x8a4421c0  ! 665: ADDC_I	addc 	%r16, 0x01c0, %r5
	.word 0x3a800001  ! 665: BCC	bcc,a	<label_0x1>
	.word 0xc62c0011  ! 666: STB_R	stb	%r3, [%r16 + %r17]
	.word 0xa8842f61  ! 668: ADDcc_I	addcc 	%r16, 0x0f61, %r20
	.word 0x9c1c293b  ! 668: XOR_I	xor 	%r16, 0x093b, %r14
	.word 0xc36c2d26  ! 668: PREFETCH_I	prefetch	[%r16 + 0x0d26], #one_read
	.word 0xda240011  ! 669: STW_R	stw	%r13, [%r16 + %r17]
	.word 0x960426ec  ! 671: ADD_I	add 	%r16, 0x06ec, %r11
	.word 0x8aac2021  ! 671: ANDNcc_I	andncc 	%r16, 0x0021, %r5
	.word 0xba942bc4  ! 671: ORcc_I	orcc 	%r16, 0x0bc4, %r29
	ta	T_CHANGE_HPRIV	! macro
	.word 0xf22c0011  ! 672: STB_R	stb	%r25, [%r16 + %r17]
	.word 0x9b341011  ! 674: SRLX_R	srlx	%r16, %r17, %r13
	.word 0xbf3c0011  ! 674: SRA_R	sra 	%r16, %r17, %r31
	.word 0xca4c2bab  ! 674: LDSB_I	ldsb	[%r16 + 0x0bab], %r5
thr2_irf_ce_46:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_46), 16, 16),1,IRF,ce,42,x, x,x,x, x,x,x)
	.word 0xce742717  ! 677: STX_I	stx	%r7, [%r16 + 0x0717]
	.word 0x872c0011  ! 679: SLL_R	sll 	%r16, %r17, %r3
	.word 0xf6941011  ! 679: LDUHA_R	lduha	[%r16, %r17] 0x80, %r27
	.word 0xb0b40011  ! 680: ORNcc_R	orncc 	%r16, %r17, %r24
	.word 0x81dc0011  ! 682: FLUSH_R	dis not found

	.word 0xfa3426a3  ! 684: STH_I	sth	%r29, [%r16 + 0x06a3]
	.word 0xb73c2001  ! 686: SRA_I	sra 	%r16, 0x0001, %r27
	.word 0xd6440011  ! 686: LDSW_R	ldsw	[%r16 + %r17], %r11
	.word 0xfc342d19  ! 688: STH_I	sth	%r30, [%r16 + 0x0d19]
	.word 0x8cc40011  ! 690: ADDCcc_R	addccc 	%r16, %r17, %r6
	.word 0x81dc2ff7  ! 690: FLUSH_I	dis not found

	.word 0xc22c0011  ! 691: STB_R	stb	%r1, [%r16 + %r17]
	.word 0xb5341011  ! 693: SRLX_R	srlx	%r16, %r17, %r26
	.word 0xa48c2ee4  ! 693: ANDcc_I	andcc 	%r16, 0x0ee4, %r18
	.word 0xbe2c2ae4  ! 693: ANDN_I	andn 	%r16, 0x0ae4, %r31
	.word 0xd80422ae  ! 693: LDUW_I	lduw	[%r16 + 0x02ae], %r12
	.word 0xbb342001  ! 694: SRL_I	srl 	%r16, 0x0001, %r29
	.word 0xbec40011  ! 696: ADDCcc_R	addccc 	%r16, %r17, %r31
	.word 0x8c1c0011  ! 696: XOR_R	xor 	%r16, %r17, %r6
	.word 0xba3c0011  ! 696: XNOR_R	xnor 	%r16, %r17, %r29
	.word 0x82d40011  ! 696: UMULcc_R	umulcc 	%r16, %r17, %r1
	.word 0x881c0011  ! 697: XOR_R	xor 	%r16, %r17, %r4
	.word 0xc36c2342  ! 699: PREFETCH_I	prefetch	[%r16 + 0x0342], #one_read
	.word 0xee7428cb  ! 701: STX_I	stx	%r23, [%r16 + 0x08cb]
	.word 0x8a0c0011  ! 703: AND_R	and 	%r16, %r17, %r5
	.word 0x95343001  ! 703: SRLX_I	srlx	%r16, 0x0001, %r10
	.word 0xed3c0011  ! 703: STDF_R	std	%f22, [%r17, %r16]
	.word 0x892c3001  ! 704: SLLX_I	sllx	%r16, 0x0001, %r4
	.word 0xbe8c0011  ! 706: ANDcc_R	andcc 	%r16, %r17, %r31
	.word 0x2acc0001  ! 706: BRNZ	brnz,a,pt	%16,<label_0xc0001>
thr2_irf_ce_47:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_47), 16, 16),1,IRF,ce,61,x, x,x,x, x,x,x)
	.word 0xce342ea9  ! 709: STH_I	sth	%r7, [%r16 + 0x0ea9]
	.word 0x9414253d  ! 711: OR_I	or 	%r16, 0x053d, %r10
	.word 0xf4bc2c16  ! 711: STDA_I	stda	%r26, [%r16 + 0x0c16] %asi
	.word 0xd62c24bf  ! 713: STB_I	stb	%r11, [%r16 + 0x04bf]
        wr %g0, 0x4, %fprs
	.word 0xce740011  ! 716: STX_R	stx	%r7, [%r16 + %r17]
	.word 0x87341011  ! 718: SRLX_R	srlx	%r16, %r17, %r3
	.word 0xa48c2d39  ! 718: ANDcc_I	andcc 	%r16, 0x0d39, %r18
	.word 0xaa0c2b8d  ! 718: AND_I	and 	%r16, 0x0b8d, %r21
	.word 0xfaac2594  ! 718: STBA_I	stba	%r29, [%r16 + 0x0594] %asi
	.word 0xc22426ad  ! 720: STW_I	stw	%r1, [%r16 + 0x06ad]
	.word 0x948c0011  ! 722: ANDcc_R	andcc 	%r16, %r17, %r10
	.word 0x969c0011  ! 722: XORcc_R	xorcc 	%r16, %r17, %r11
	.word 0xb8340011  ! 722: ORN_R	orn 	%r16, %r17, %r28
	.word 0xae7c0011  ! 722: SDIV_R	sdiv 	%r16, %r17, %r23
	.word 0xc2740011  ! 723: STX_R	stx	%r1, [%r16 + %r17]
	.word 0x8b340011  ! 725: SRL_R	srl 	%r16, %r17, %r5
	.word 0x8d3c2001  ! 725: SRA_I	sra 	%r16, 0x0001, %r6
	.word 0xad2c3001  ! 725: SLLX_I	sllx	%r16, 0x0001, %r22
	.word 0x2acc0001  ! 725: BRNZ	brnz,a,pt	%16,<label_0xc0001>
	.word 0xa6a40011  ! 726: SUBcc_R	subcc 	%r16, %r17, %r19
	.word 0xa8342d27  ! 728: ORN_I	orn 	%r16, 0x0d27, %r20
	.word 0x9150c000  ! 728: RDPR_TT	rdpr	%tt, %r8
thr2_irf_ce_48:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_48), 16, 16),1,IRF,ce,16,x, x,x,x, x,x,x)
	.word 0xee742617  ! 731: STX_I	stx	%r23, [%r16 + 0x0617]
	.word 0xbc1c295b  ! 733: XOR_I	xor 	%r16, 0x095b, %r30
	.word 0xcac41011  ! 733: LDSWA_R	ldswa	[%r16, %r17] 0x80, %r5
	.word 0xc8340011  ! 734: STH_R	sth	%r4, [%r16 + %r17]
	.word 0x9e8c0011  ! 736: ANDcc_R	andcc 	%r16, %r17, %r15
	.word 0x903c0011  ! 736: XNOR_R	xnor 	%r16, %r17, %r8
	.word 0x88bc2089  ! 736: XNORcc_I	xnorcc 	%r16, 0x0089, %r4
	.word 0x0ccc0003  ! 736: BRGZ	brgz  ,pt	%16,<label_0xc0003>
	.word 0x82ac0011  ! 737: ANDNcc_R	andncc 	%r16, %r17, %r1
	.word 0x94d42de0  ! 739: UMULcc_I	umulcc 	%r16, 0x0de0, %r10
	.word 0x88c40011  ! 740: ADDCcc_R	addccc 	%r16, %r17, %r4
	.word 0x94c420c2  ! 742: ADDCcc_I	addccc 	%r16, 0x00c2, %r10
	.word 0x972c0011  ! 742: SLL_R	sll 	%r16, %r17, %r11
	.word 0x823c0011  ! 742: XNOR_R	xnor 	%r16, %r17, %r1
	.word 0x98740011  ! 742: UDIV_R	udiv 	%r16, %r17, %r12
	.word 0x9c840011  ! 743: ADDcc_R	addcc 	%r16, %r17, %r14
	.word 0xc8042907  ! 745: LDUW_I	lduw	[%r16 + 0x0907], %r4
	.word 0xbe340011  ! 746: ORN_R	orn 	%r16, %r17, %r31
	.word 0x908c0011  ! 748: ANDcc_R	andcc 	%r16, %r17, %r8
thr2_resum_intr_9:
!$EV trig_pc_d(2,expr(@VA(.MAIN.thr2_resum_intr_9), 16, 16)) -> intp(2, 3, 1)
	wr      %r0, 0x5, %asr26
	.word 0xd4340011  ! 749: STH_R	sth	%r10, [%r16 + %r17]
	.word 0xb00c0011  ! 751: AND_R	and 	%r16, %r17, %r24
        wr %g0, 0x4, %fprs
	.word 0x92b42215  ! 752: ORNcc_I	orncc 	%r16, 0x0215, %r9
	.word 0xba840011  ! 754: ADDcc_R	addcc 	%r16, %r17, %r29
	.word 0x8d514000  ! 754: RDPR_TBA	rdpr	%tba, %r6
	.word 0xc42c0011  ! 755: STB_R	stb	%r2, [%r16 + %r17]
	.word 0x9e140011  ! 757: OR_R	or 	%r16, %r17, %r15
	.word 0xae9c0011  ! 757: XORcc_R	xorcc 	%r16, %r17, %r23
	.word 0xc36c2315  ! 757: PREFETCH_I	prefetch	[%r16 + 0x0315], #one_read
	.word 0xc2742e81  ! 759: STX_I	stx	%r1, [%r16 + 0x0e81]
	.word 0x821c0011  ! 761: XOR_R	xor 	%r16, %r17, %r1
	.word 0x928c0011  ! 761: ANDcc_R	andcc 	%r16, %r17, %r9
	.word 0xd2ac26b5  ! 761: STBA_I	stba	%r9, [%r16 + 0x06b5] %asi
	.word 0xda740011  ! 762: STX_R	stx	%r13, [%r16 + %r17]
	.word 0xb5641811  ! 764: MOVcc_R	<illegal instruction>
	.word 0xbe3c298a  ! 764: XNOR_I	xnor 	%r16, 0x098a, %r31
        wr %g0, 0x4, %fprs
	.word 0xcc2c2d61  ! 766: STB_I	stb	%r6, [%r16 + 0x0d61]
	.word 0xda0427ce  ! 768: LDUW_I	lduw	[%r16 + 0x07ce], %r13
	.word 0x8c94255b  ! 769: ORcc_I	orcc 	%r16, 0x055b, %r6
	.word 0x9d7c0411  ! 771: MOVR_R	move	%r16, %r17, %r14
	.word 0x8143e021  ! 771: MEMBAR	membar	#LoadLoad | #MemIssue 
thr2_irf_ce_49:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_49), 16, 16),1,IRF,ce,57,x, x,x,x, x,x,x)
	.word 0xcc342d0b  ! 774: STH_I	sth	%r6, [%r16 + 0x0d0b]
	.word 0xab3c0011  ! 776: SRA_R	sra 	%r16, %r17, %r21
	.word 0x921c2edc  ! 776: XOR_I	xor 	%r16, 0x0edc, %r9
	.word 0x81dc2407  ! 776: FLUSH_I	dis not found

	.word 0xc2240011  ! 777: STW_R	stw	%r1, [%r16 + %r17]
	.word 0x84040011  ! 779: ADD_R	add 	%r16, %r17, %r2
	.word 0x9a8c261f  ! 779: ANDcc_I	andcc 	%r16, 0x061f, %r13
	.word 0xab7c0411  ! 779: MOVR_R	move	%r16, %r17, %r21
	.word 0x8fa40d31  ! 779: FsMULd	fsmuld	%f16, %f48, %f38
	.word 0x892c0011  ! 780: SLL_R	sll 	%r16, %r17, %r4
	.word 0x913c0011  ! 782: SRA_R	sra 	%r16, %r17, %r8
	.word 0x8c8c0011  ! 782: ANDcc_R	andcc 	%r16, %r17, %r6
	.word 0x8e140011  ! 782: OR_R	or 	%r16, %r17, %r7
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xce740011  ! 783: STX_R	stx	%r7, [%r16 + %r17]
	.word 0xba042250  ! 785: ADD_I	add 	%r16, 0x0250, %r29
	.word 0x837c2401  ! 785: MOVR_I	move	%r16, 0xfffffff8, %r1
	.word 0xde5c2088  ! 785: LDX_I	ldx	[%r16 + 0x0088], %r15
	.word 0xf624277b  ! 787: STW_I	stw	%r27, [%r16 + 0x077b]
	.word 0x0ec40001  ! 789: BRGEZ	brgez  ,nt	%16,<label_0x40001>
	.word 0xf6742173  ! 791: STX_I	stx	%r27, [%r16 + 0x0173]
	.word 0xac8c0011  ! 793: ANDcc_R	andcc 	%r16, %r17, %r22
	.word 0x8f341011  ! 793: SRLX_R	srlx	%r16, %r17, %r7
	.word 0xb6040011  ! 793: ADD_R	add 	%r16, %r17, %r27
	.word 0x9e7c243e  ! 793: SDIV_I	sdiv 	%r16, 0x043e, %r15
	.word 0xa424279d  ! 794: SUB_I	sub 	%r16, 0x079d, %r18
	.word 0x929c0011  ! 796: XORcc_R	xorcc 	%r16, %r17, %r9
	.word 0xac9c0011  ! 796: XORcc_R	xorcc 	%r16, %r17, %r22
	.word 0xb6bc0011  ! 796: XNORcc_R	xnorcc 	%r16, %r17, %r27
	.word 0x0ac40001  ! 796: BRNZ	brnz  ,nt	%16,<label_0x40001>
	.word 0x8b3c1011  ! 797: SRAX_R	srax	%r16, %r17, %r5
	.word 0x989c0011  ! 799: XORcc_R	xorcc 	%r16, %r17, %r12
	.word 0x8d3c1011  ! 799: SRAX_R	srax	%r16, %r17, %r6
	.word 0x94bc0011  ! 799: XNORcc_R	xnorcc 	%r16, %r17, %r10
	.word 0x83e40011  ! 799: SAVE_R	save	%r16, %r17, %r1
thr2_irf_ce_50:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_50), 16, 16),1,IRF,ce,34,x, x,x,x, x,x,x)
	.word 0xd22c2363  ! 802: STB_I	stb	%r9, [%r16 + 0x0363]
	.word 0x86bc2438  ! 804: XNORcc_I	xnorcc 	%r16, 0x0438, %r3
	.word 0x8c742921  ! 804: UDIV_I	udiv 	%r16, 0x0921, %r6
thr2_irf_ce_51:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_51), 16, 16),1,IRF,ce,58,x, x,x,x, x,x,x)
	.word 0xf82c202b  ! 807: STB_I	stb	%r28, [%r16 + 0x002b]
	ta	T_CHANGE_PRIV	! macro
	.word 0xf82c2db9  ! 811: STB_I	stb	%r28, [%r16 + 0x0db9]
	.word 0x84840011  ! 813: ADDcc_R	addcc 	%r16, %r17, %r2
	.word 0x8b7c2401  ! 813: MOVR_I	move	%r16, 0xfffffff8, %r5
thr2_resum_intr_10:
!$EV trig_pc_d(2,expr(@VA(.MAIN.thr2_resum_intr_10), 16, 16)) -> intp(2, 3, 1)
	wr      %r0, 0x5, %asr26
	.word 0xd224291d  ! 815: STW_I	stw	%r9, [%r16 + 0x091d]
	.word 0x8c342c10  ! 817: ORN_I	orn 	%r16, 0x0c10, %r6
	.word 0x880c24bc  ! 817: AND_I	and 	%r16, 0x04bc, %r4
	.word 0x97242b9a  ! 817: MULScc_I	mulscc 	%r16, 0x0b9a, %r11
thr2_irf_ce_52:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_52), 16, 16),1,IRF,ce,7,x, x,x,x, x,x,x)
	.word 0xfe2c2a35  ! 820: STB_I	stb	%r31, [%r16 + 0x0a35]
	.word 0xb4140011  ! 822: OR_R	or 	%r16, %r17, %r26
	.word 0x84b40011  ! 822: ORNcc_R	orncc 	%r16, %r17, %r2
	.word 0xa56c27fa  ! 822: SDIVX_I	sdivx	%r16, 0x07fa, %r18
	.word 0xd42c0011  ! 823: STB_R	stb	%r10, [%r16 + %r17]
	.word 0xb0c40011  ! 825: ADDCcc_R	addccc 	%r16, %r17, %r24
	.word 0x8c840011  ! 825: ADDcc_R	addcc 	%r16, %r17, %r6
	.word 0xc2542f69  ! 825: LDSH_I	ldsh	[%r16 + 0x0f69], %r1
	.word 0xea2c2125  ! 827: STB_I	stb	%r21, [%r16 + 0x0125]
	.word 0xc36c2370  ! 829: PREFETCH_I	prefetch	[%r16 + 0x0370], #one_read
	.word 0xea2c2e6f  ! 831: STB_I	stb	%r21, [%r16 + 0x0e6f]
	.word 0xab343001  ! 833: SRLX_I	srlx	%r16, 0x0001, %r21
	.word 0x8a8c0011  ! 833: ANDcc_R	andcc 	%r16, %r17, %r5
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xbec42208  ! 834: ADDCcc_I	addccc 	%r16, 0x0208, %r31
	.word 0x8c0c295f  ! 836: AND_I	and 	%r16, 0x095f, %r6
	.word 0x896c25a1  ! 836: SDIVX_I	sdivx	%r16, 0x05a1, %r4
	.word 0xca242b2f  ! 838: STW_I	stw	%r5, [%r16 + 0x0b2f]
	.word 0xe644236c  ! 840: LDSW_I	ldsw	[%r16 + 0x036c], %r19
	.word 0xa49c0011  ! 841: XORcc_R	xorcc 	%r16, %r17, %r18
	.word 0xaf3c0011  ! 843: SRA_R	sra 	%r16, %r17, %r23
	.word 0xa57c2401  ! 843: MOVR_I	move	%r16, 0xfffffff8, %r18
	.word 0xc3ec2215  ! 843: PREFETCHA_I	prefetcha	[%r16, + 0x0215] %asi, #one_read
	.word 0xcc2c0011  ! 844: STB_R	stb	%r6, [%r16 + %r17]
	.word 0xaa8c0011  ! 846: ANDcc_R	andcc 	%r16, %r17, %r21
	.word 0x8cc42928  ! 846: ADDCcc_I	addccc 	%r16, 0x0928, %r6
	.word 0x95a8c831  ! 846: FMOVL	fmovs	%fcc1, %f17, %f10
thr2_irf_ce_53:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_53), 16, 16),1,IRF,ce,53,x, x,x,x, x,x,x)
	.word 0xd2742e91  ! 849: STX_I	stx	%r9, [%r16 + 0x0e91]
	.word 0x9c5c23ab  ! 851: SMUL_I	smul 	%r16, 0x03ab, %r14
thr2_irf_ce_54:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_54), 16, 16),1,IRF,ce,56,x, x,x,x, x,x,x)
	.word 0xd6742ae3  ! 854: STX_I	stx	%r11, [%r16 + 0x0ae3]
	.word 0xbab40011  ! 856: ORNcc_R	orncc 	%r16, %r17, %r29
	.word 0x960c0011  ! 856: AND_R	and 	%r16, %r17, %r11
	.word 0x932c1011  ! 856: SLLX_R	sllx	%r16, %r17, %r9
	.word 0xc36c2fb9  ! 856: PREFETCH_I	prefetch	[%r16 + 0x0fb9], #one_read
	.word 0xd074278b  ! 858: STX_I	stx	%r8, [%r16 + 0x078b]
	.word 0xa40c0011  ! 860: AND_R	and 	%r16, %r17, %r18
	.word 0xfe8c2985  ! 860: LDUBA_I	lduba	[%r16, + 0x0985] %asi, %r31
	.word 0x9cac2db0  ! 861: ANDNcc_I	andncc 	%r16, 0x0db0, %r14
	.word 0x877c0411  ! 863: MOVR_R	move	%r16, %r17, %r3
	.word 0xd24c0011  ! 863: LDSB_R	ldsb	[%r16 + %r17], %r9
	.word 0xd4740011  ! 864: STX_R	stx	%r10, [%r16 + %r17]
	.word 0xd0fc213e  ! 866: SWAPA_I	swapa	%r8, [%r16 + 0x013e] %asi
	.word 0x852c1011  ! 867: SLLX_R	sllx	%r16, %r17, %r2
	.word 0x92bc0011  ! 869: XNORcc_R	xnorcc 	%r16, %r17, %r9
	.word 0x877c0411  ! 869: MOVR_R	move	%r16, %r17, %r3
	.word 0xa8b40011  ! 869: ORNcc_R	orncc 	%r16, %r17, %r20
	.word 0xe64c2c88  ! 869: LDSB_I	ldsb	[%r16 + 0x0c88], %r19
thr2_irf_ce_55:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_55), 16, 16),1,IRF,ce,13,x, x,x,x, x,x,x)
	.word 0xc2342a43  ! 872: STH_I	sth	%r1, [%r16 + 0x0a43]
	.word 0x8d7c2401  ! 874: MOVR_I	move	%r16, 0xfffffff8, %r6
	.word 0x9e040011  ! 874: ADD_R	add 	%r16, %r17, %r15
	.word 0xb2340011  ! 874: ORN_R	orn 	%r16, %r17, %r25
	.word 0xc36c0011  ! 874: PREFETCH_R	prefetch	[%r16 + %r17], #one_read
thr2_irf_ce_56:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_56), 16, 16),1,IRF,ce,58,x, x,x,x, x,x,x)
	.word 0xdc342d83  ! 877: STH_I	sth	%r14, [%r16 + 0x0d83]
thr2_resum_intr_11:
!$EV trig_pc_d(2,expr(@VA(.MAIN.thr2_resum_intr_11), 16, 16)) -> intp(2, 3, 1)
	wr      %r0, 0x5, %asr26
thr2_irf_ce_57:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_57), 16, 16),1,IRF,ce,52,x, x,x,x, x,x,x)
	.word 0xdc342fff  ! 882: STH_I	sth	%r14, [%r16 + 0x0fff]
	.word 0x8c2c25cc  ! 884: ANDN_I	andn 	%r16, 0x05cc, %r6
        wr %g0, 0x4, %fprs
thr2_irf_ce_58:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_58), 16, 16),1,IRF,ce,8,x, x,x,x, x,x,x)
	.word 0xe82c2d81  ! 887: STB_I	stb	%r20, [%r16 + 0x0d81]
	.word 0x9eb40011  ! 889: ORNcc_R	orncc 	%r16, %r17, %r15
	.word 0x9b7c2401  ! 889: MOVR_I	move	%r16, 0xfffffff8, %r13
	.word 0x8b2c3001  ! 889: SLLX_I	sllx	%r16, 0x0001, %r5
	.word 0xded42989  ! 889: LDSHA_I	ldsha	[%r16, + 0x0989] %asi, %r15
	.word 0xd2342f31  ! 891: STH_I	sth	%r9, [%r16 + 0x0f31]
	.word 0xb61420ea  ! 893: OR_I	or 	%r16, 0x00ea, %r27
	.word 0x96442f52  ! 893: ADDC_I	addc 	%r16, 0x0f52, %r11
	.word 0x8ab42964  ! 893: ORNcc_I	orncc 	%r16, 0x0964, %r5
        wr %g0, 0x4, %fprs
	.word 0xf6742543  ! 895: STX_I	stx	%r27, [%r16 + 0x0543]
	.word 0xb8440011  ! 897: ADDC_R	addc 	%r16, %r17, %r28
	.word 0xa8ac2c1d  ! 897: ANDNcc_I	andncc 	%r16, 0x0c1d, %r20
	.word 0xbb3c0011  ! 897: SRA_R	sra 	%r16, %r17, %r29
	.word 0xf5f42011  ! 897: CASXA_R	casxa	[%r16]%asi, %r17, %r26
	.word 0xf0742d05  ! 899: STX_I	stx	%r24, [%r16 + 0x0d05]
	.word 0xaabc0011  ! 901: XNORcc_R	xnorcc 	%r16, %r17, %r21
	.word 0xb0040011  ! 901: ADD_R	add 	%r16, %r17, %r24
	.word 0xb6342bcc  ! 901: ORN_I	orn 	%r16, 0x0bcc, %r27
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xc4340011  ! 902: STH_R	sth	%r2, [%r16 + %r17]
	.word 0xccd41011  ! 904: LDSHA_R	ldsha	[%r16, %r17] 0x80, %r6
thr2_irf_ce_59:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_59), 16, 16),1,IRF,ce,9,x, x,x,x, x,x,x)
	.word 0xce3424f1  ! 907: STH_I	sth	%r7, [%r16 + 0x04f1]
	.word 0x81dc2abb  ! 909: FLUSH_I	dis not found

	.word 0xc8240011  ! 910: STW_R	stw	%r4, [%r16 + %r17]
	.word 0xef3c0011  ! 912: STDF_R	std	%f23, [%r17, %r16]
	.word 0xc4240011  ! 913: STW_R	stw	%r2, [%r16 + %r17]
	.word 0xba1c0011  ! 915: XOR_R	xor 	%r16, %r17, %r29
	.word 0x889c0011  ! 915: XORcc_R	xorcc 	%r16, %r17, %r4
	.word 0xd6042d4f  ! 915: LDUW_I	lduw	[%r16 + 0x0d4f], %r11
	.word 0x9f3c3001  ! 916: SRAX_I	srax	%r16, 0x0001, %r15
	.word 0x969c0011  ! 918: XORcc_R	xorcc 	%r16, %r17, %r11
	.word 0x8b240011  ! 918: MULScc_R	mulscc 	%r16, %r17, %r5
	.word 0xc82c2a23  ! 920: STB_I	stb	%r4, [%r16 + 0x0a23]
	.word 0x98340011  ! 922: ORN_R	orn 	%r16, %r17, %r12
        wr %g0, 0x4, %fprs
	.word 0xc2240011  ! 923: STW_R	stw	%r1, [%r16 + %r17]
	.word 0x84ac20f5  ! 925: ANDNcc_I	andncc 	%r16, 0x00f5, %r2
	.word 0x9e140011  ! 925: OR_R	or 	%r16, %r17, %r15
	.word 0xb1641811  ! 925: MOVcc_R	<illegal instruction>
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xea2c0011  ! 926: STB_R	stb	%r21, [%r16 + %r17]
	.word 0x9e0c242b  ! 928: AND_I	and 	%r16, 0x042b, %r15
	.word 0x81880000  ! 928: RESTORED	saved
	.word 0xbea40011  ! 929: SUBcc_R	subcc 	%r16, %r17, %r31
	.word 0x92bc2659  ! 931: XNORcc_I	xnorcc 	%r16, 0x0659, %r9
	.word 0xb49c0011  ! 931: XORcc_R	xorcc 	%r16, %r17, %r26
	.word 0x92b40011  ! 931: ORNcc_R	orncc 	%r16, %r17, %r9
	.word 0x8143c000  ! 931: STBAR	stbar
	.word 0x86bc25cc  ! 932: XNORcc_I	xnorcc 	%r16, 0x05cc, %r3
	.word 0x8f3c0011  ! 934: SRA_R	sra 	%r16, %r17, %r7
	.word 0xcc5c0011  ! 934: LDX_R	ldx	[%r16 + %r17], %r6
	.word 0xca340011  ! 935: STH_R	sth	%r5, [%r16 + %r17]
	.word 0xb81c26c3  ! 937: XOR_I	xor 	%r16, 0x06c3, %r28
	.word 0x8f3c2001  ! 937: SRA_I	sra 	%r16, 0x0001, %r7
	.word 0x900c0011  ! 937: AND_R	and 	%r16, %r17, %r8
thr2_resum_intr_12:
!$EV trig_pc_d(2,expr(@VA(.MAIN.thr2_resum_intr_12), 16, 16)) -> intp(2, 3, 1)
	wr      %r0, 0x5, %asr26
	.word 0xe4240011  ! 938: STW_R	stw	%r18, [%r16 + %r17]
	.word 0xa89c289c  ! 940: XORcc_I	xorcc 	%r16, 0x089c, %r20
	.word 0x9c940011  ! 940: ORcc_R	orcc 	%r16, %r17, %r14
	.word 0x8143e032  ! 940: MEMBAR	membar	#StoreLoad | #Lookaside | #MemIssue 
	.word 0xca742b81  ! 942: STX_I	stx	%r5, [%r16 + 0x0b81]
	.word 0x8e342697  ! 944: ORN_I	orn 	%r16, 0x0697, %r7
	.word 0xb82c2b6a  ! 944: ANDN_I	andn 	%r16, 0x0b6a, %r28
	.word 0x9d342001  ! 944: SRL_I	srl 	%r16, 0x0001, %r14
	.word 0x8143c000  ! 944: STBAR	stbar
	.word 0xea3426d1  ! 946: STH_I	sth	%r21, [%r16 + 0x06d1]
	.word 0x95643801  ! 948: MOVcc_I	<illegal instruction>
	.word 0xbd2c0011  ! 948: SLL_R	sll 	%r16, %r17, %r30
	.word 0x92140011  ! 948: OR_R	or 	%r16, %r17, %r9
	.word 0xb9a00051  ! 948: FMOVd	fmovd	%f48, %f28
thr2_irf_ce_60:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_60), 16, 16),1,IRF,ce,50,x, x,x,x, x,x,x)
	.word 0xd82c297b  ! 951: STB_I	stb	%r12, [%r16 + 0x097b]
	.word 0xb62c0011  ! 953: ANDN_R	andn 	%r16, %r17, %r27
	.word 0x843c0011  ! 953: XNOR_R	xnor 	%r16, %r17, %r2
	.word 0x90bc266e  ! 953: XNORcc_I	xnorcc 	%r16, 0x066e, %r8
	.word 0xf0a41011  ! 953: STWA_R	stwa	%r24, [%r16 + %r17] 0x80
	.word 0xde240011  ! 954: STW_R	stw	%r15, [%r16 + %r17]
	.word 0xb6b40011  ! 956: ORNcc_R	orncc 	%r16, %r17, %r27
	.word 0xc9242578  ! 956: STF_I	st	%f4, [0x0578, %r16]
	.word 0xda2422e3  ! 958: STW_I	stw	%r13, [%r16 + 0x02e3]
	.word 0x941c0011  ! 960: XOR_R	xor 	%r16, %r17, %r10
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xe62c0011  ! 961: STB_R	stb	%r19, [%r16 + %r17]
	.word 0xd2d42cc6  ! 963: LDSHA_I	ldsha	[%r16, + 0x0cc6] %asi, %r9
	.word 0xf024281d  ! 965: STW_I	stw	%r24, [%r16 + 0x081d]
	.word 0xbec40011  ! 967: ADDCcc_R	addccc 	%r16, %r17, %r31
	.word 0x9cac2011  ! 967: ANDNcc_I	andncc 	%r16, 0x0011, %r14
	.word 0x9ebc2969  ! 967: XNORcc_I	xnorcc 	%r16, 0x0969, %r15
	.word 0x82f42bda  ! 967: UDIVcc_I	udivcc 	%r16, 0x0bda, %r1
	.word 0x842429ec  ! 968: SUB_I	sub 	%r16, 0x09ec, %r2
	.word 0x8a6c0011  ! 970: UDIVX_R	udivx 	%r16, %r17, %r5
thr2_irf_ce_61:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_61), 16, 16),1,IRF,ce,64,x, x,x,x, x,x,x)
	.word 0xe62c2e85  ! 973: STB_I	stb	%r19, [%r16 + 0x0e85]
	.word 0xbda01031  ! 975: FsTOx	dis not found

thr2_irf_ce_62:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_62), 16, 16),1,IRF,ce,71,x, x,x,x, x,x,x)
	.word 0xc42c2649  ! 978: STB_I	stb	%r2, [%r16 + 0x0649]
	.word 0x94bc2c9d  ! 980: XNORcc_I	xnorcc 	%r16, 0x0c9d, %r10
	.word 0xd8ec2bd6  ! 980: LDSTUBA_I	ldstuba	%r12, [%r16 + 0x0bd6] %asi
	.word 0x9ea423c4  ! 981: SUBcc_I	subcc 	%r16, 0x03c4, %r15
	.word 0xb77c2401  ! 983: MOVR_I	move	%r16, 0xfffffff8, %r27
	.word 0x905c2414  ! 983: SMUL_I	smul 	%r16, 0x0414, %r8
	.word 0x98340011  ! 984: SUBC_R	orn 	%r16, %r17, %r12
	.word 0xb4ac0011  ! 986: ANDNcc_R	andncc 	%r16, %r17, %r26
	.word 0x981c2489  ! 986: XOR_I	xor 	%r16, 0x0489, %r12
	.word 0xad7c0411  ! 986: MOVR_R	move	%r16, %r17, %r22
thr2_resum_intr_13:
!$EV trig_pc_d(2,expr(@VA(.MAIN.thr2_resum_intr_13), 16, 16)) -> intp(2, 3, 1)
	wr      %r0, 0x5, %asr26
	.word 0xc42c2de9  ! 988: STB_I	stb	%r2, [%r16 + 0x0de9]
thr2_resum_intr_14:
!$EV trig_pc_d(2,expr(@VA(.MAIN.thr2_resum_intr_14), 16, 16)) -> intp(2, 3, 1)
	wr      %r0, 0x5, %asr26
	.word 0xcc340011  ! 991: STH_R	sth	%r6, [%r16 + %r17]
	.word 0xb2ac0011  ! 993: ANDNcc_R	andncc 	%r16, %r17, %r25
	.word 0x98bc20a9  ! 993: XNORcc_I	xnorcc 	%r16, 0x00a9, %r12
	.word 0x889c0011  ! 993: XORcc_R	xorcc 	%r16, %r17, %r4
	.word 0xee1c2385  ! 993: LDD_I	ldd	[%r16 + 0x0385], %r23
	.word 0x893c1011  ! 994: SRAX_R	srax	%r16, %r17, %r4
	.word 0x98ac2356  ! 996: ANDNcc_I	andncc 	%r16, 0x0356, %r12
	.word 0x8c440011  ! 996: ADDC_R	addc 	%r16, %r17, %r6
thr2_resum_intr_15:
!$EV trig_pc_d(2,expr(@VA(.MAIN.thr2_resum_intr_15), 16, 16)) -> intp(2, 3, 1)
	wr      %r0, 0x5, %asr26
	.word 0xb4340011  ! 997: SUBC_R	orn 	%r16, %r17, %r26
	.word 0x92c40011  ! 999: ADDCcc_R	addccc 	%r16, %r17, %r9
	.word 0x9f343001  ! 999: SRLX_I	srlx	%r16, 0x0001, %r15
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
        setx  0x00000000000000d0, %g1, %r17
        setx  0xb01fc829e04b3463, %g1, %r0
        setx  0x36efe216992c9d4e, %g1, %r1
        setx  0x550b3ed4f6c4d38e, %g1, %r2
        setx  0x9a81e9d0e472e22f, %g1, %r3
        setx  0x7f07858a4fefec4e, %g1, %r4
        setx  0xab25c409c9ef5340, %g1, %r5
        setx  0x909dbdcf4a793d36, %g1, %r6
        setx  0xc9fbba84308d579d, %g1, %r7
        setx  0xa258d61e2041a01a, %g1, %r8
        setx  0x731f2d1f1667b8d1, %g1, %r9
        setx  0xdf5685c5c56f7704, %g1, %r10
        setx  0xd1c5113dccc2257d, %g1, %r11
        setx  0x4c1e5a3508a5e816, %g1, %r12
        setx  0x4221cfdc1a6cca27, %g1, %r13
        setx  0x1ebb37aa263481eb, %g1, %r14
        setx  0x3216fa1e7b2c1c09, %g1, %r15
        setx  0xba02b533667e71d6, %g1, %r18
        setx  0xd8cfa5b2af34e1b4, %g1, %r19
        setx  0x91c25600e031878a, %g1, %r20
        setx  0xcf534d4c668b26f5, %g1, %r21
        setx  0x263d08ac261028c5, %g1, %r22
        setx  0x0f8c9b8bb64a920e, %g1, %r23
        setx  0x71b4ca81f04f2afb, %g1, %r24
        setx  0xdac5b8ffe6b51dc9, %g1, %r25
        setx  0xdab92253c2f9ec1a, %g1, %r26
        setx  0x9e82e35fd17f398e, %g1, %r27
        setx  0xfb3b5a2f1cac04a7, %g1, %r28
        setx  0xd1dad61b53f6472f, %g1, %r29
        setx  0x21686a681725e877, %g1, %r30
        setx  0x404293750ee93357, %g1, %r31
	save %r0, %r0, %r31
        setx  MAIN_BASE_DATA_VA, %r1, %r16
        setx  0x0000000000000950, %g1, %r17
        setx  0xfe43c58b13e62906, %g1, %r0
        setx  0xa4087f17e9189e7d, %g1, %r1
        setx  0x98618d9c0bb0397b, %g1, %r2
        setx  0xff8d041c1027c5f5, %g1, %r3
        setx  0x35c0ae798316a09d, %g1, %r4
        setx  0x7c2a698535c9d658, %g1, %r5
        setx  0x5e63fba805bda1e8, %g1, %r6
        setx  0x692d6b6eb3fa0050, %g1, %r7
        setx  0x5bdee2889599d94d, %g1, %r8
        setx  0x9188dc67ae8e9491, %g1, %r9
        setx  0xb4930bd8af59ea6d, %g1, %r10
        setx  0x42af82ba7c55ee1e, %g1, %r11
        setx  0xb4a3477db698bf3b, %g1, %r12
        setx  0x28c45883d4dbeb34, %g1, %r13
        setx  0x3fd0c1529ad0fcbb, %g1, %r14
        setx  0x426570db35383c14, %g1, %r15
        setx  0xaca021d2e5c576a4, %g1, %r18
        setx  0x0183283dfd596033, %g1, %r19
        setx  0xad00a0ee5bc278fc, %g1, %r20
        setx  0x8b0318e5d99a3606, %g1, %r21
        setx  0xd5a78ea9407ab0f6, %g1, %r22
        setx  0xbd4e3f93d1941f9c, %g1, %r23
        setx  0x180c212065142164, %g1, %r24
        setx  0x0fc59cf10e2684ab, %g1, %r25
        setx  0x164f563dbb1de9f9, %g1, %r26
        setx  0x66ddcca418ba8ad0, %g1, %r27
        setx  0x1d5a37cd7a26c886, %g1, %r28
        setx  0x77ae2c9d16eeaad1, %g1, %r29
        setx  0xccc7d1f7793f4a9e, %g1, %r30
        setx  0x8d0b0a1505fe7dbc, %g1, %r31
	save %r0, %r0, %r31
        setx  MAIN_BASE_DATA_VA, %r1, %r16
        setx  0x0000000000000570, %g1, %r17
        setx  0x547b371d7a355539, %g1, %r0
        setx  0x5823f3f566d4ccbc, %g1, %r1
        setx  0xd1170c2e4e6b03ca, %g1, %r2
        setx  0x5ca7f3fd92f85408, %g1, %r3
        setx  0xc415ac5322fb299d, %g1, %r4
        setx  0x9235780c48193f4a, %g1, %r5
        setx  0x87346589a4594c60, %g1, %r6
        setx  0x5e083022fffa7b0a, %g1, %r7
        setx  0xaad4490c233658ee, %g1, %r8
        setx  0x7bf8e2e0ef2b3399, %g1, %r9
        setx  0x9fbd6ef190a9900b, %g1, %r10
        setx  0x17b1490b7b838064, %g1, %r11
        setx  0x45098728a55e11d7, %g1, %r12
        setx  0x5313eaddfa94acd8, %g1, %r13
        setx  0x3373efa4f2eff2a8, %g1, %r14
        setx  0x2d3c2a37090bcda2, %g1, %r15
        setx  0x79979e53845d6ee6, %g1, %r18
        setx  0xd5b94541f982dc64, %g1, %r19
        setx  0xd397162aa75904a0, %g1, %r20
        setx  0xe2101c553b6b03b8, %g1, %r21
        setx  0x84b15fe8cac94e0f, %g1, %r22
        setx  0x8f5b94c294054ed1, %g1, %r23
        setx  0xb359f40db178fdbf, %g1, %r24
        setx  0x824cfff100988c61, %g1, %r25
        setx  0x16f291ddf6134008, %g1, %r26
        setx  0x5285f465c24cd5fd, %g1, %r27
        setx  0x51d8823844925934, %g1, %r28
        setx  0x71f8c8572d5cac71, %g1, %r29
        setx  0xfee2dbfbc59f096c, %g1, %r30
        setx  0xd8c6d6368f3dae9c, %g1, %r31
	save %r0, %r0, %r31
        setx  MAIN_BASE_DATA_VA, %r1, %r16
        setx  0x0000000000000bf0, %g1, %r17
        setx  0xde335b287f0e0246, %g1, %r0
        setx  0x3af2f468d92232ba, %g1, %r1
        setx  0x5e4f1ad9c9462602, %g1, %r2
        setx  0x36a33364d66c1cef, %g1, %r3
        setx  0x139366b67efd1247, %g1, %r4
        setx  0x6e4d66091caa0774, %g1, %r5
        setx  0xff2a1c8f5c41711f, %g1, %r6
        setx  0x4abcbaac20c946c1, %g1, %r7
        setx  0x6c69bd5b4ba8ffd3, %g1, %r8
        setx  0x4589494e789b24a6, %g1, %r9
        setx  0xaf5b388ace60aa43, %g1, %r10
        setx  0x2af57bc1378ce318, %g1, %r11
        setx  0x514daa5abe644af0, %g1, %r12
        setx  0x6bc19a83a037839c, %g1, %r13
        setx  0xcbeb3df652e031dd, %g1, %r14
        setx  0x0af963b200f3d216, %g1, %r15
        setx  0x70c3b0b05479b912, %g1, %r18
        setx  0xe97b8c146fb6a8fa, %g1, %r19
        setx  0xf903a9866ffaee28, %g1, %r20
        setx  0xe7763d43fc41331e, %g1, %r21
        setx  0xc8d6f50303cbfe0f, %g1, %r22
        setx  0xf14001e2d0afa388, %g1, %r23
        setx  0xa1d1ae525cf0c18d, %g1, %r24
        setx  0x9dd7205653112830, %g1, %r25
        setx  0x6fccfba4b04c6f29, %g1, %r26
        setx  0xf89deb00f4318072, %g1, %r27
        setx  0xcfd8c51b2d744aaf, %g1, %r28
        setx  0x57291d3ad640b5c9, %g1, %r29
        setx  0xe93c5921b9a5eb03, %g1, %r30
        setx  0xf2c0dbad17d40b4d, %g1, %r31
	save %r0, %r0, %r31
        setx  MAIN_BASE_DATA_VA, %r1, %r16
        setx  0x0000000000000c00, %g1, %r17
        setx  0x41cd88736fa5771b, %g1, %r0
        setx  0x4818cd4cbff29f31, %g1, %r1
        setx  0xaa060678b2be726d, %g1, %r2
        setx  0xa72a17b37deb470e, %g1, %r3
        setx  0x7b5df9fe262a2fb9, %g1, %r4
        setx  0xea55ef92d098eacc, %g1, %r5
        setx  0x326348e858eb604f, %g1, %r6
        setx  0x9d3b70a23f84d569, %g1, %r7
        setx  0xbb8ee8313ce32a4b, %g1, %r8
        setx  0x579bc3200aee61fe, %g1, %r9
        setx  0x6817328463c6b592, %g1, %r10
        setx  0x736363f1815246fe, %g1, %r11
        setx  0xe185dac90601ff9a, %g1, %r12
        setx  0x6f862151cfad9ab3, %g1, %r13
        setx  0x7b90ef28e1eec7bb, %g1, %r14
        setx  0x7f7bcc54b36c6169, %g1, %r15
        setx  0xeacb084056cff055, %g1, %r18
        setx  0xd7e866af1192bbd1, %g1, %r19
        setx  0xfe05facce0fb40da, %g1, %r20
        setx  0x5fcb80813c0bc952, %g1, %r21
        setx  0x90a8fe43cefe0bb3, %g1, %r22
        setx  0xc8b322a6ed67b69d, %g1, %r23
        setx  0xbef6ebd666d0a1c5, %g1, %r24
        setx  0x56e80c920e2e98d8, %g1, %r25
        setx  0xd5483020b95046a4, %g1, %r26
        setx  0x3245733aa14327e6, %g1, %r27
        setx  0x96df0bce6e5441b5, %g1, %r28
        setx  0x4d495250bbdb23a5, %g1, %r29
        setx  0x3a6cbc3c07e6a89e, %g1, %r30
        setx  0x6adf9342f9c76e39, %g1, %r31
	save %r0, %r0, %r31
        setx  MAIN_BASE_DATA_VA, %r1, %r16
        setx  0x0000000000000340, %g1, %r17
        setx  0xe87b5965c34fa3da, %g1, %r0
        setx  0x178d7bba817f3c1f, %g1, %r1
        setx  0x3203c27094a31172, %g1, %r2
        setx  0x150e67346849285c, %g1, %r3
        setx  0x3ff146e1ddc18360, %g1, %r4
        setx  0x94e77952f2671c38, %g1, %r5
        setx  0x1830d794b779b1ee, %g1, %r6
        setx  0x0d933a85821fabd2, %g1, %r7
        setx  0x7a227260f43d8b32, %g1, %r8
        setx  0x82fc9a4cb7af8a6e, %g1, %r9
        setx  0xfe9429590a196185, %g1, %r10
        setx  0x063dc50f2aedab88, %g1, %r11
        setx  0xfdae662261c1f6e3, %g1, %r12
        setx  0xeed58c9b33f26e74, %g1, %r13
        setx  0x39778c7e80f3d346, %g1, %r14
        setx  0x06a2e1e2a32c63f6, %g1, %r15
        setx  0xe69b4f52e9b47a24, %g1, %r18
        setx  0x7563818dab0448a2, %g1, %r19
        setx  0x45d9f41a3cd92dc1, %g1, %r20
        setx  0x25be9d923f965dc9, %g1, %r21
        setx  0xe161ba12a094896b, %g1, %r22
        setx  0xe9c850c5975bffad, %g1, %r23
        setx  0xdc7dd29deda69843, %g1, %r24
        setx  0x767e9cc109e81988, %g1, %r25
        setx  0x19e5ac6f7c8e4ff6, %g1, %r26
        setx  0x09c45e469c7a16b7, %g1, %r27
        setx  0xc6033753c8b7df71, %g1, %r28
        setx  0x18eb44407e34d003, %g1, %r29
        setx  0x96875758f0fdf947, %g1, %r30
        setx  0x15d1cd2969c70244, %g1, %r31
	save %r0, %r0, %r31
        setx  MAIN_BASE_DATA_VA, %r1, %r16
        setx  0x0000000000000270, %g1, %r17
        setx  0x965f1b0d0c0d2e51, %g1, %r0
        setx  0x23316c0a05a11aed, %g1, %r1
        setx  0x9bc0b844ea708f6c, %g1, %r2
        setx  0x099563d6a577df96, %g1, %r3
        setx  0xa5270e43f73becc1, %g1, %r4
        setx  0xf5dc006386007524, %g1, %r5
        setx  0xb8477648077e0650, %g1, %r6
        setx  0x31190aa10d4ca15b, %g1, %r7
        setx  0xd0b083e27451178a, %g1, %r8
        setx  0x12dd97d2f48d932b, %g1, %r9
        setx  0xf8c65fa1ed42e865, %g1, %r10
        setx  0x2f82678622f2154c, %g1, %r11
        setx  0x604eb43e36405a99, %g1, %r12
        setx  0x12796c1c0d04de3c, %g1, %r13
        setx  0x9cb0f7109a3250c7, %g1, %r14
        setx  0x6a3407387278d6d8, %g1, %r15
        setx  0x56eb726fe9721811, %g1, %r18
        setx  0x3315af897b86cdfd, %g1, %r19
        setx  0x92688e14991b1283, %g1, %r20
        setx  0x4bc2b8d734cff8e5, %g1, %r21
        setx  0xc588d927a696c234, %g1, %r22
        setx  0xbbcb05fcf29db2e2, %g1, %r23
        setx  0xbd8e0c85fe0e39e2, %g1, %r24
        setx  0xd493f8ea1a688f29, %g1, %r25
        setx  0xf694ee3d7e79b009, %g1, %r26
        setx  0xe266ec06a1d6d0b3, %g1, %r27
        setx  0x91c4e18374f30f32, %g1, %r28
        setx  0xc96bebb636e01bf9, %g1, %r29
        setx  0x5e814df7f018f567, %g1, %r30
        setx  0xf20eb970372ad4a8, %g1, %r31
	save %r0, %r0, %r31
        setx  MAIN_BASE_DATA_VA, %r1, %r16
        setx  0x0000000000000620, %g1, %r17
        setx  0x8237f1b61f081d1c, %g1, %r0
        setx  0x17032fed32ac684d, %g1, %r1
        setx  0x484c533d19c62227, %g1, %r2
        setx  0xfd9248c8ed4bc2a6, %g1, %r3
        setx  0xee405e0b58c5881b, %g1, %r4
        setx  0x808f04ee22e16ff8, %g1, %r5
        setx  0xc5b4c6c5cbcc518f, %g1, %r6
        setx  0x27174eafbe692f27, %g1, %r7
        setx  0xcb5d213d23dd6c2f, %g1, %r8
        setx  0xc41febf77b4f8e12, %g1, %r9
        setx  0x6936b1b9b842fe44, %g1, %r10
        setx  0x1d06fceeef96f23d, %g1, %r11
        setx  0x2ee93049d625def3, %g1, %r12
        setx  0x0c9212bd1d03ccb4, %g1, %r13
        setx  0xbc57c8c0350917cd, %g1, %r14
        setx  0xa57bcfbf195362ff, %g1, %r15
        setx  0xe7c021371c2e452d, %g1, %r18
        setx  0x3c45adc9ca3be69f, %g1, %r19
        setx  0x8206bfc767214d54, %g1, %r20
        setx  0x57ed0ad3b963dd76, %g1, %r21
        setx  0x30c438930b526678, %g1, %r22
        setx  0x2fb584bc5b2cf2b7, %g1, %r23
        setx  0x511e29b0cce44d70, %g1, %r24
        setx  0xbfc91d7a9c2b5885, %g1, %r25
        setx  0x5ba2550df792c6ea, %g1, %r26
        setx  0xb23a842a763dca4b, %g1, %r27
        setx  0xcdeefc72e47d929c, %g1, %r28
        setx  0xabed58c10e30947a, %g1, %r29
        setx  0xa75fd20cafa80b53, %g1, %r30
        setx  0x484f78f0d461a04e, %g1, %r31
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
	.word 0xce342619  ! 1: STH_I	sth	%r7, [%r16 + 0x0619]
	.word 0x8a840011  ! 3: ADDcc_R	addcc 	%r16, %r17, %r5
	.word 0x95643801  ! 3: MOVcc_I	<illegal instruction>
	.word 0x9c8429b5  ! 3: ADDcc_I	addcc 	%r16, 0x09b5, %r14
	.word 0xbc5c2776  ! 3: SMUL_I	smul 	%r16, 0x0776, %r30
	.word 0xf22428ed  ! 5: STW_I	stw	%r25, [%r16 + 0x08ed]
	.word 0x40000001  ! 7: CALL	call	disp30_1
	.word 0xaa040011  ! 8: ADD_R	add 	%r16, %r17, %r21
	.word 0x821c0011  ! 10: XOR_R	xor 	%r16, %r17, %r1
	.word 0xc36c0011  ! 10: PREFETCH_R	prefetch	[%r16 + %r17], #one_read
	.word 0xe43424d3  ! 12: STH_I	sth	%r18, [%r16 + 0x04d3]
	.word 0x88b42343  ! 14: ORNcc_I	orncc 	%r16, 0x0343, %r4
	.word 0xb4b40011  ! 14: ORNcc_R	orncc 	%r16, %r17, %r26
	.word 0xe87c29dd  ! 14: SWAP_I	swap	%r20, [%r16 + 0x09dd]
thr1_irf_ce_0:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_0), 16, 16),1,IRF,ce,13,x, x,x,x, x,x,x)
	.word 0xf62c2fed  ! 17: STB_I	stb	%r27, [%r16 + 0x0fed]
	.word 0x8d3c0011  ! 19: SRA_R	sra 	%r16, %r17, %r6
	.word 0x84842439  ! 19: ADDcc_I	addcc 	%r16, 0x0439, %r2
	.word 0x8f7c0411  ! 19: MOVR_R	move	%r16, %r17, %r7
	.word 0xce9c2db2  ! 19: LDDA_I	ldda	[%r16, + 0x0db2] %asi, %r7
	.word 0xca2c0011  ! 20: STB_R	stb	%r5, [%r16 + %r17]
	.word 0x84940011  ! 22: ORcc_R	orcc 	%r16, %r17, %r2
	.word 0x81580000  ! 22: FLUSHW	flushw
	.word 0xd6342a4f  ! 24: STH_I	sth	%r11, [%r16 + 0x0a4f]
	.word 0x89340011  ! 26: SRL_R	srl 	%r16, %r17, %r4
        wr %g0, 0x4, %fprs
	.word 0xf8340011  ! 27: STH_R	sth	%r28, [%r16 + %r17]
	.word 0x8eb429b1  ! 29: ORNcc_I	orncc 	%r16, 0x09b1, %r7
	.word 0x943c0011  ! 29: XNOR_R	xnor 	%r16, %r17, %r10
	.word 0x965c27b9  ! 29: SMUL_I	smul 	%r16, 0x07b9, %r11
	.word 0xf8740011  ! 30: STX_R	stx	%r28, [%r16 + %r17]
	.word 0x22800001  ! 32: BE	be,a	<label_0x1>
	.word 0xc6240011  ! 33: STW_R	stw	%r3, [%r16 + %r17]
	.word 0x89643801  ! 35: MOVcc_I	<illegal instruction>
	.word 0x81880000  ! 35: RESTORED	saved
	.word 0x832c0011  ! 36: SLL_R	sll 	%r16, %r17, %r1
	.word 0xc40428e6  ! 38: LDUW_I	lduw	[%r16 + 0x08e6], %r2
thr1_irf_ce_1:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_1), 16, 16),1,IRF,ce,70,x, x,x,x, x,x,x)
	.word 0xc2242d05  ! 41: STW_I	stw	%r1, [%r16 + 0x0d05]
	.word 0x8cac2431  ! 43: ANDNcc_I	andncc 	%r16, 0x0431, %r6
	.word 0x90042e63  ! 43: ADD_I	add 	%r16, 0x0e63, %r8
	.word 0xb09c0011  ! 43: XORcc_R	xorcc 	%r16, %r17, %r24
	.word 0x9da00551  ! 43: FSQRTd	fsqrt	
	.word 0xf42c2765  ! 45: STB_I	stb	%r26, [%r16 + 0x0765]
	.word 0x3c800001  ! 47: BPOS	bpos,a	<label_0x1>
thr1_irf_ce_2:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_2), 16, 16),1,IRF,ce,46,x, x,x,x, x,x,x)
	.word 0xf43424ff  ! 50: STH_I	sth	%r26, [%r16 + 0x04ff]
	.word 0x90140011  ! 52: OR_R	or 	%r16, %r17, %r8
	.word 0xfefc281b  ! 52: SWAPA_I	swapa	%r31, [%r16 + 0x081b] %asi
	.word 0xc42c2f4d  ! 54: STB_I	stb	%r2, [%r16 + 0x0f4d]
	.word 0x848c0011  ! 56: ANDcc_R	andcc 	%r16, %r17, %r2
	.word 0xbc840011  ! 56: ADDcc_R	addcc 	%r16, %r17, %r30
	.word 0x892c0011  ! 56: SLL_R	sll 	%r16, %r17, %r4
	.word 0xbe740011  ! 56: UDIV_R	udiv 	%r16, %r17, %r31
	.word 0x972c1011  ! 57: SLLX_R	sllx	%r16, %r17, %r11
	.word 0xab7c2401  ! 59: MOVR_I	move	%r16, 0xfffffff8, %r21
	.word 0x9f2c2001  ! 59: SLL_I	sll 	%r16, 0x0001, %r15
	.word 0xd69c1011  ! 59: LDDA_R	ldda	[%r16, %r17] 0x80, %r11
	.word 0x8d342001  ! 60: SRL_I	srl 	%r16, 0x0001, %r6
	.word 0xbe142d8d  ! 62: OR_I	or 	%r16, 0x0d8d, %r31
	.word 0x9c8c0011  ! 62: ANDcc_R	andcc 	%r16, %r17, %r14
	.word 0xafe40011  ! 62: SAVE_R	save	%r16, %r17, %r23
	.word 0xe624264f  ! 64: STW_I	stw	%r19, [%r16 + 0x064f]
	.word 0xbf643801  ! 66: MOVcc_I	<illegal instruction>
	.word 0x91343001  ! 66: SRLX_I	srlx	%r16, 0x0001, %r8
	.word 0xbb484000  ! 66: RDHPR_HTSTATE	rdhpr	%htstate, %r29
	.word 0xb2a40011  ! 67: SUBcc_R	subcc 	%r16, %r17, %r25
	.word 0x96040011  ! 69: ADD_R	add 	%r16, %r17, %r11
	.word 0x8a1c0011  ! 69: XOR_R	xor 	%r16, %r17, %r5
	.word 0x889c0011  ! 69: XORcc_R	xorcc 	%r16, %r17, %r4
	.word 0x81880000  ! 69: SAVED	saved
	.word 0xd624236d  ! 71: STW_I	stw	%r11, [%r16 + 0x036d]
	.word 0xb82c267f  ! 73: ANDN_I	andn 	%r16, 0x067f, %r28
	.word 0x963424e9  ! 73: ORN_I	orn 	%r16, 0x04e9, %r11
	.word 0x992c2001  ! 73: SLL_I	sll 	%r16, 0x0001, %r12
	.word 0xc36c0011  ! 73: PREFETCH_R	prefetch	[%r16 + %r17], #one_read
	.word 0xce240011  ! 74: STW_R	stw	%r7, [%r16 + %r17]
	.word 0xaab40011  ! 76: ORNcc_R	orncc 	%r16, %r17, %r21
	.word 0xe89c1011  ! 76: LDDA_R	ldda	[%r16, %r17] 0x80, %r20
	.word 0xd6742963  ! 78: STX_I	stx	%r11, [%r16 + 0x0963]
	.word 0x2e800001  ! 80: BVS	bvs,a	<label_0x1>
thr1_irf_ce_3:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_3), 16, 16),1,IRF,ce,64,x, x,x,x, x,x,x)
	.word 0xd6742543  ! 83: STX_I	stx	%r11, [%r16 + 0x0543]
	.word 0x8f641811  ! 85: MOVcc_R	<illegal instruction>
	.word 0x92c424a3  ! 85: ADDCcc_I	addccc 	%r16, 0x04a3, %r9
	.word 0x8143c000  ! 85: STBAR	stbar
	.word 0xf62c0011  ! 86: STB_R	stb	%r27, [%r16 + %r17]
	.word 0xa5341011  ! 88: SRLX_R	srlx	%r16, %r17, %r18
	.word 0x8143c000  ! 88: STBAR	stbar
	.word 0xc8240011  ! 89: STW_R	stw	%r4, [%r16 + %r17]
	.word 0xa4b40011  ! 91: ORNcc_R	orncc 	%r16, %r17, %r18
	.word 0xc3ec1011  ! 91: PREFETCHA_R	prefetcha	[%r16, %r17] 0x80, #one_read
	.word 0xc82c2307  ! 93: STB_I	stb	%r4, [%r16 + 0x0307]
	.word 0x86740011  ! 95: UDIV_R	udiv 	%r16, %r17, %r3
	.word 0xca2c0011  ! 96: STB_R	stb	%r5, [%r16 + %r17]
	.word 0xc2942554  ! 98: LDUHA_I	lduha	[%r16, + 0x0554] %asi, %r1
	.word 0x99641811  ! 99: MOVcc_R	<illegal instruction>
	.word 0xa48c0011  ! 101: ANDcc_R	andcc 	%r16, %r17, %r18
	.word 0xaebc2275  ! 101: XNORcc_I	xnorcc 	%r16, 0x0275, %r23
	.word 0x8b500000  ! 101: RDPR_TPC	rdpr	%tpc, %r5
thr1_irf_ce_4:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_4), 16, 16),1,IRF,ce,55,x, x,x,x, x,x,x)
	.word 0xca2c23f1  ! 104: STB_I	stb	%r5, [%r16 + 0x03f1]
	.word 0x929c2c2a  ! 106: XORcc_I	xorcc 	%r16, 0x0c2a, %r9
	.word 0xbe840011  ! 106: ADDcc_R	addcc 	%r16, %r17, %r31
	.word 0x88ac2dd6  ! 106: ANDNcc_I	andncc 	%r16, 0x0dd6, %r4
	.word 0x12800001  ! 106: BNE	bne  	<label_0x1>
	.word 0x8b3c0011  ! 107: SRA_R	sra 	%r16, %r17, %r5
thr1_resum_intr_0:
!$EV trig_pc_d(1,expr(@VA(.MAIN.thr1_resum_intr_0), 16, 16)) -> intp(1, 3, 1)
	wr      %r0, 0x5, %asr26
thr1_irf_ce_5:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_5), 16, 16),1,IRF,ce,8,x, x,x,x, x,x,x)
	.word 0xcc342855  ! 112: STH_I	sth	%r6, [%r16 + 0x0855]
	.word 0x88140011  ! 114: OR_R	or 	%r16, %r17, %r4
	.word 0x92340011  ! 114: ORN_R	orn 	%r16, %r17, %r9
	.word 0x983422ac  ! 114: ORN_I	orn 	%r16, 0x02ac, %r12
        wr %g0, 0x4, %fprs
	.word 0xd82425eb  ! 116: STW_I	stw	%r12, [%r16 + 0x05eb]
	.word 0x860c2125  ! 118: AND_I	and 	%r16, 0x0125, %r3
	.word 0x89242786  ! 118: MULScc_I	mulscc 	%r16, 0x0786, %r4
thr1_irf_ce_6:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_6), 16, 16),1,IRF,ce,70,x, x,x,x, x,x,x)
	.word 0xe62c2ead  ! 121: STB_I	stb	%r19, [%r16 + 0x0ead]
	.word 0x24c40003  ! 123: BRLEZ	brlez,a,nt	%16,<label_0x40003>
	.word 0xd0240011  ! 124: STW_R	stw	%r8, [%r16 + %r17]
	.word 0xb23c0011  ! 126: XNOR_R	xnor 	%r16, %r17, %r25
	.word 0x96840011  ! 126: ADDcc_R	addcc 	%r16, %r17, %r11
	.word 0xd5e42011  ! 126: CASA_R	casa	[%r16] %asi, %r17, %r10
	.word 0xc8340011  ! 127: STH_R	sth	%r4, [%r16 + %r17]
	.word 0x9ec40011  ! 129: ADDCcc_R	addccc 	%r16, %r17, %r15
	.word 0x3e800001  ! 129: BVC	bvc,a	<label_0x1>
	.word 0xa8240011  ! 130: SUB_R	sub 	%r16, %r17, %r20
	.word 0x99340011  ! 132: SRL_R	srl 	%r16, %r17, %r12
	.word 0x9b7c2401  ! 132: MOVR_I	move	%r16, 0xfffffff8, %r13
	.word 0xd4cc1011  ! 132: LDSBA_R	ldsba	[%r16, %r17] 0x80, %r10
	.word 0xad340011  ! 133: SRL_R	srl 	%r16, %r17, %r22
	.word 0x84340011  ! 135: ORN_R	orn 	%r16, %r17, %r2
	.word 0x9c8c0011  ! 135: ANDcc_R	andcc 	%r16, %r17, %r14
	.word 0x861c288a  ! 135: XOR_I	xor 	%r16, 0x088a, %r3
	.word 0x94dc2967  ! 135: SMULcc_I	smulcc 	%r16, 0x0967, %r10
	.word 0xaec422b9  ! 136: ADDCcc_I	addccc 	%r16, 0x02b9, %r23
	.word 0x8e840011  ! 138: ADDcc_R	addcc 	%r16, %r17, %r7
	.word 0x860429d0  ! 138: ADD_I	add 	%r16, 0x09d0, %r3
	.word 0x8a0c0011  ! 138: AND_R	and 	%r16, %r17, %r5
	.word 0xdab42af2  ! 138: STHA_I	stha	%r13, [%r16 + 0x0af2] %asi
	.word 0x940c267c  ! 139: AND_I	and 	%r16, 0x067c, %r10
	.word 0x9eb42f7d  ! 141: ORNcc_I	orncc 	%r16, 0x0f7d, %r15
	.word 0x81580000  ! 141: FLUSHW	flushw
thr1_irf_ce_7:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_7), 16, 16),1,IRF,ce,52,x, x,x,x, x,x,x)
	.word 0xce2424bf  ! 144: STW_I	stw	%r7, [%r16 + 0x04bf]
	.word 0xd2ec2493  ! 146: LDSTUBA_I	ldstuba	%r9, [%r16 + 0x0493] %asi
	.word 0xaa042d7a  ! 147: ADD_I	add 	%r16, 0x0d7a, %r21
	.word 0x861c0011  ! 149: XOR_R	xor 	%r16, %r17, %r3
	.word 0x9b524000  ! 149: RDPR_CWP	<illegal instruction>
thr1_irf_ce_8:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_8), 16, 16),1,IRF,ce,27,x, x,x,x, x,x,x)
	.word 0xc62c2fc9  ! 152: STB_I	stb	%r3, [%r16 + 0x0fc9]
	.word 0xb12c1011  ! 154: SLLX_R	sllx	%r16, %r17, %r24
	.word 0x81dc0011  ! 154: FLUSH_R	dis not found

thr1_irf_ce_9:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_9), 16, 16),1,IRF,ce,52,x, x,x,x, x,x,x)
	.word 0xdc242075  ! 157: STW_I	stw	%r14, [%r16 + 0x0075]
	ta	T_CHANGE_HPRIV	! macro
	.word 0xc62c0011  ! 160: STB_R	stb	%r3, [%r16 + %r17]
	.word 0xb0940011  ! 162: ORcc_R	orcc 	%r16, %r17, %r24
	.word 0x8d342001  ! 162: SRL_I	srl 	%r16, 0x0001, %r6
	.word 0x97343001  ! 162: SRLX_I	srlx	%r16, 0x0001, %r11
	.word 0xc3ec1011  ! 162: PREFETCHA_R	prefetcha	[%r16, %r17] 0x80, #one_read
	.word 0x8d342001  ! 163: SRL_I	srl 	%r16, 0x0001, %r6
	ta	T_CHANGE_HPRIV	! macro
	.word 0xe4740011  ! 166: STX_R	stx	%r18, [%r16 + %r17]
	.word 0x81dc2488  ! 168: FLUSH_I	dis not found

thr1_irf_ce_10:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_10), 16, 16),1,IRF,ce,50,x, x,x,x, x,x,x)
	.word 0xc2342229  ! 171: STH_I	sth	%r1, [%r16 + 0x0229]
	.word 0x87641811  ! 173: MOVcc_R	<illegal instruction>
	.word 0xb72c0011  ! 173: SLL_R	sll 	%r16, %r17, %r27
	.word 0x880c0011  ! 173: AND_R	and 	%r16, %r17, %r4
	.word 0xd2fc1011  ! 173: SWAPA_R	swapa	%r9, [%r16 + %r17] 0x80
thr1_irf_ce_11:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_11), 16, 16),1,IRF,ce,55,x, x,x,x, x,x,x)
	.word 0xee742315  ! 176: STX_I	stx	%r23, [%r16 + 0x0315]
	.word 0xa6040011  ! 178: ADD_R	add 	%r16, %r17, %r19
	.word 0x8cbc2e17  ! 178: XNORcc_I	xnorcc 	%r16, 0x0e17, %r6
	.word 0x828c0011  ! 178: ANDcc_R	andcc 	%r16, %r17, %r1
	.word 0xd4ec28bc  ! 178: LDSTUBA_I	ldstuba	%r10, [%r16 + 0x08bc] %asi
	.word 0xfe742ecd  ! 180: STX_I	stx	%r31, [%r16 + 0x0ecd]
	.word 0xc3ec1011  ! 182: PREFETCHA_R	prefetcha	[%r16, %r17] 0x80, #one_read
	.word 0x94042eeb  ! 183: ADD_I	add 	%r16, 0x0eeb, %r10
	.word 0xc3ec1011  ! 185: PREFETCHA_R	prefetcha	[%r16, %r17] 0x80, #one_read
	.word 0xce2c29e5  ! 187: STB_I	stb	%r7, [%r16 + 0x09e5]
	.word 0x9b3c2001  ! 189: SRA_I	sra 	%r16, 0x0001, %r13
	.word 0x9cb422f2  ! 189: ORNcc_I	orncc 	%r16, 0x02f2, %r14
	.word 0x8d341011  ! 189: SRLX_R	srlx	%r16, %r17, %r6
	.word 0x81580000  ! 189: FLUSHW	flushw
	.word 0xfe242f45  ! 191: STW_I	stw	%r31, [%r16 + 0x0f45]
	.word 0x88b423e8  ! 193: ORNcc_I	orncc 	%r16, 0x03e8, %r4
	.word 0xb68c23e0  ! 193: ANDcc_I	andcc 	%r16, 0x03e0, %r27
	.word 0xaf342001  ! 193: SRL_I	srl 	%r16, 0x0001, %r23
	.word 0x8143c000  ! 193: STBAR	stbar
	.word 0xdc242081  ! 195: STW_I	stw	%r14, [%r16 + 0x0081]
	.word 0x81880000  ! 197: SAVED	saved
	.word 0xdc342cd7  ! 199: STH_I	sth	%r14, [%r16 + 0x0cd7]
	.word 0xaf2c1011  ! 201: SLLX_R	sllx	%r16, %r17, %r23
	.word 0x842c2f49  ! 201: ANDN_I	andn 	%r16, 0x0f49, %r2
	.word 0xb08c0011  ! 201: ANDcc_R	andcc 	%r16, %r17, %r24
thr1_resum_intr_1:
!$EV trig_pc_d(1,expr(@VA(.MAIN.thr1_resum_intr_1), 16, 16)) -> intp(1, 3, 1)
	wr      %r0, 0x5, %asr26
	.word 0xd6742dd7  ! 203: STX_I	stx	%r11, [%r16 + 0x0dd7]
	.word 0x9c3c2144  ! 205: XNOR_I	xnor 	%r16, 0x0144, %r14
	.word 0x99ec0011  ! 205: RESTORE_R	restore	%r16, %r17, %r12
	.word 0xc4740011  ! 206: STX_R	stx	%r2, [%r16 + %r17]
	.word 0xb28c0011  ! 208: ANDcc_R	andcc 	%r16, %r17, %r25
	.word 0x90842cb4  ! 208: ADDcc_I	addcc 	%r16, 0x0cb4, %r8
	.word 0x91343001  ! 208: SRLX_I	srlx	%r16, 0x0001, %r8
thr1_resum_intr_2:
!$EV trig_pc_d(1,expr(@VA(.MAIN.thr1_resum_intr_2), 16, 16)) -> intp(1, 3, 1)
	wr      %r0, 0x5, %asr26
	.word 0x823c0011  ! 209: XNOR_R	xnor 	%r16, %r17, %r1
	ta	T_CHANGE_HPRIV	! macro
	.word 0xab341011  ! 212: SRLX_R	srlx	%r16, %r17, %r21
	.word 0xbe840011  ! 214: ADDcc_R	addcc 	%r16, %r17, %r31
	.word 0x90bc0011  ! 214: XNORcc_R	xnorcc 	%r16, %r17, %r8
        wr %g0, 0x4, %fprs
	.word 0x9e1c23dc  ! 215: XOR_I	xor 	%r16, 0x03dc, %r15
	.word 0xc93c211a  ! 217: STDF_I	std	%f4, [0x011a, %r16]
	.word 0xb4bc0011  ! 218: XNORcc_R	xnorcc 	%r16, %r17, %r26
	.word 0x9f3c2001  ! 220: SRA_I	sra 	%r16, 0x0001, %r15
	.word 0x8143e020  ! 220: MEMBAR	membar	#MemIssue 
	.word 0xf83429dd  ! 222: STH_I	sth	%r28, [%r16 + 0x09dd]
	.word 0x8143e02e  ! 224: MEMBAR	membar	#StoreLoad | #LoadStore | #StoreStore | #MemIssue 
	.word 0xf82c2239  ! 226: STB_I	stb	%r28, [%r16 + 0x0239]
	.word 0x86c42d81  ! 228: ADDCcc_I	addccc 	%r16, 0x0d81, %r3
	.word 0xa93c1011  ! 228: SRAX_R	srax	%r16, %r17, %r20
	.word 0xb7e40011  ! 228: SAVE_R	save	%r16, %r17, %r27
	.word 0xde2423ff  ! 230: STW_I	stw	%r15, [%r16 + 0x03ff]
	.word 0x40000003  ! 232: CALL	call	disp30_3
	.word 0xd22c0011  ! 233: STB_R	stb	%r9, [%r16 + %r17]
	.word 0x84c40011  ! 235: ADDCcc_R	addccc 	%r16, %r17, %r2
	.word 0x8143c000  ! 235: STBAR	stbar
	.word 0xec2421bf  ! 237: STW_I	stw	%r22, [%r16 + 0x01bf]
	.word 0xb23c29c5  ! 239: XNOR_I	xnor 	%r16, 0x09c5, %r25
	.word 0x81840011  ! 239: WRY_R	wr	%r16, %r17, %y
thr1_irf_ce_12:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_12), 16, 16),1,IRF,ce,44,x, x,x,x, x,x,x)
	.word 0xf234279d  ! 242: STH_I	sth	%r25, [%r16 + 0x079d]
	.word 0x9abc2fd1  ! 244: XNORcc_I	xnorcc 	%r16, 0x0fd1, %r13
	.word 0x81580000  ! 244: FLUSHW	flushw
thr1_irf_ce_13:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_13), 16, 16),1,IRF,ce,9,x, x,x,x, x,x,x)
	.word 0xe82c291f  ! 247: STB_I	stb	%r20, [%r16 + 0x091f]
	.word 0x9a5c0011  ! 249: SMUL_R	smul 	%r16, %r17, %r13
thr1_irf_ce_14:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_14), 16, 16),1,IRF,ce,58,x, x,x,x, x,x,x)
	.word 0xd0242f6d  ! 252: STW_I	stw	%r8, [%r16 + 0x0f6d]
	.word 0x8c940011  ! 254: ORcc_R	orcc 	%r16, %r17, %r6
	.word 0x8143c000  ! 254: STBAR	stbar
	.word 0x84842c26  ! 255: ADDcc_I	addcc 	%r16, 0x0c26, %r2
	.word 0x82bc0011  ! 257: XNORcc_R	xnorcc 	%r16, %r17, %r1
	.word 0xe5e42011  ! 257: CASA_R	casa	[%r16] %asi, %r17, %r18
thr1_irf_ce_15:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_15), 16, 16),1,IRF,ce,48,x, x,x,x, x,x,x)
	.word 0xc824228f  ! 260: STW_I	stw	%r4, [%r16 + 0x028f]
	.word 0x943c2d02  ! 262: XNOR_I	xnor 	%r16, 0x0d02, %r10
	.word 0x8ab427ce  ! 262: ORNcc_I	orncc 	%r16, 0x07ce, %r5
	.word 0x86ac0011  ! 262: ANDNcc_R	andncc 	%r16, %r17, %r3
        wr %g0, 0x4, %fprs
thr1_irf_ce_16:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_16), 16, 16),1,IRF,ce,47,x, x,x,x, x,x,x)
	.word 0xec242ac7  ! 265: STW_I	stw	%r22, [%r16 + 0x0ac7]
	.word 0x972c3001  ! 267: SLLX_I	sllx	%r16, 0x0001, %r11
	.word 0x822c0011  ! 267: ANDN_R	andn 	%r16, %r17, %r1
	.word 0xb7643801  ! 267: MOVcc_I	<illegal instruction>
        wr %g0, 0x4, %fprs
thr1_irf_ce_17:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_17), 16, 16),1,IRF,ce,29,x, x,x,x, x,x,x)
	.word 0xda242f55  ! 270: STW_I	stw	%r13, [%r16 + 0x0f55]
	.word 0x9a9c0011  ! 272: XORcc_R	xorcc 	%r16, %r17, %r13
	.word 0x9740c000  ! 272: RDASI	rd	%asi, %r11
	.word 0xd4342bd7  ! 274: STH_I	sth	%r10, [%r16 + 0x0bd7]
	.word 0x897c0411  ! 276: MOVR_R	move	%r16, %r17, %r4
	.word 0xb2fc2557  ! 276: SDIVcc_I	sdivcc 	%r16, 0x0557, %r25
	.word 0x86940011  ! 277: ORcc_R	orcc 	%r16, %r17, %r3
	.word 0x977c0411  ! 279: MOVR_R	move	%r16, %r17, %r11
	.word 0x8f2c0011  ! 279: SLL_R	sll 	%r16, %r17, %r7
	.word 0x8d494000  ! 279: RDHPR_HTBA	rdhpr	%htba, %r6
	.word 0xf4240011  ! 280: STW_R	stw	%r26, [%r16 + %r17]
	.word 0xa4bc0011  ! 282: XNORcc_R	xnorcc 	%r16, %r17, %r18
	.word 0x81dc2baa  ! 282: FLUSH_I	dis not found

	.word 0xee240011  ! 283: STW_R	stw	%r23, [%r16 + %r17]
	.word 0x8f2c2001  ! 285: SLL_I	sll 	%r16, 0x0001, %r7
	.word 0x88c42d14  ! 285: ADDCcc_I	addccc 	%r16, 0x0d14, %r4
thr1_resum_intr_3:
!$EV trig_pc_d(1,expr(@VA(.MAIN.thr1_resum_intr_3), 16, 16)) -> intp(1, 3, 1)
	wr      %r0, 0x5, %asr26
	.word 0xfa342d1f  ! 287: STH_I	sth	%r29, [%r16 + 0x0d1f]
	.word 0x920c2faa  ! 289: AND_I	and 	%r16, 0x0faa, %r9
	.word 0x97504000  ! 289: RDPR_TNPC	<illegal instruction>
	.word 0xcc742b13  ! 291: STX_I	stx	%r6, [%r16 + 0x0b13]
	.word 0x8a042c15  ! 293: ADD_I	add 	%r16, 0x0c15, %r5
	.word 0x82440011  ! 293: ADDC_R	addc 	%r16, %r17, %r1
	.word 0x948c0011  ! 293: ANDcc_R	andcc 	%r16, %r17, %r10
	.word 0xdaac20ea  ! 293: STBA_I	stba	%r13, [%r16 + 0x00ea] %asi
	.word 0xe874250f  ! 295: STX_I	stx	%r20, [%r16 + 0x050f]
	.word 0x893c0011  ! 297: SRA_R	sra 	%r16, %r17, %r4
	.word 0x973c1011  ! 297: SRAX_R	srax	%r16, %r17, %r11
	.word 0xc3ec2f48  ! 297: PREFETCHA_I	prefetcha	[%r16, + 0x0f48] %asi, #one_read
thr1_irf_ce_18:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_18), 16, 16),1,IRF,ce,18,x, x,x,x, x,x,x)
	.word 0xea342865  ! 300: STH_I	sth	%r21, [%r16 + 0x0865]
	.word 0x92b40011  ! 302: ORNcc_R	orncc 	%r16, %r17, %r9
	.word 0xe93c0011  ! 302: STDF_R	std	%f20, [%r17, %r16]
	.word 0xd62c0011  ! 303: STB_R	stb	%r11, [%r16 + %r17]
	.word 0x8ef40011  ! 305: UDIVcc_R	udivcc 	%r16, %r17, %r7
	.word 0xd8242dad  ! 307: STW_I	stw	%r12, [%r16 + 0x0dad]
	.word 0x9f641811  ! 309: MOVcc_R	<illegal instruction>
	.word 0x862c0011  ! 309: ANDN_R	andn 	%r16, %r17, %r3
	.word 0x940c2dd7  ! 309: AND_I	and 	%r16, 0x0dd7, %r10
	.word 0x826c0011  ! 309: UDIVX_R	udivx 	%r16, %r17, %r1
	.word 0xde2425e9  ! 311: STW_I	stw	%r15, [%r16 + 0x05e9]
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x893c0011  ! 314: SRA_R	sra 	%r16, %r17, %r4
	.word 0x84bc24e5  ! 316: XNORcc_I	xnorcc 	%r16, 0x04e5, %r2
	.word 0x8d641811  ! 316: MOVcc_R	<illegal instruction>
        wr %g0, 0x4, %fprs
	.word 0x9e9424af  ! 317: ORcc_I	orcc 	%r16, 0x04af, %r15
	.word 0xa44c0011  ! 319: MULX_R	mulx 	%r16, %r17, %r18
thr1_irf_ce_19:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_19), 16, 16),1,IRF,ce,69,x, x,x,x, x,x,x)
	.word 0xc474205b  ! 322: STX_I	stx	%r2, [%r16 + 0x005b]
	.word 0xa80c0011  ! 324: AND_R	and 	%r16, %r17, %r20
	.word 0x88c40011  ! 324: ADDCcc_R	addccc 	%r16, %r17, %r4
thr1_resum_intr_4:
!$EV trig_pc_d(1,expr(@VA(.MAIN.thr1_resum_intr_4), 16, 16)) -> intp(1, 3, 1)
	wr      %r0, 0x5, %asr26
thr1_irf_ce_20:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_20), 16, 16),1,IRF,ce,68,x, x,x,x, x,x,x)
	.word 0xd22c2d5b  ! 327: STB_I	stb	%r9, [%r16 + 0x0d5b]
	.word 0x992c0011  ! 329: SLL_R	sll 	%r16, %r17, %r12
	.word 0xc8841011  ! 329: LDUWA_R	lduwa	[%r16, %r17] 0x80, %r4
	.word 0xe82c0011  ! 330: STB_R	stb	%r20, [%r16 + %r17]
	.word 0xb6942835  ! 332: ORcc_I	orcc 	%r16, 0x0835, %r27
	.word 0x93341011  ! 332: SRLX_R	srlx	%r16, %r17, %r9
	.word 0x9cc4227f  ! 332: ADDCcc_I	addccc 	%r16, 0x027f, %r14
	.word 0xcc1c2452  ! 332: LDD_I	ldd	[%r16 + 0x0452], %r6
	.word 0xc62c2fad  ! 334: STB_I	stb	%r3, [%r16 + 0x0fad]
	.word 0x961c2d00  ! 336: XOR_I	xor 	%r16, 0x0d00, %r11
	.word 0x9cf40011  ! 336: UDIVcc_R	udivcc 	%r16, %r17, %r14
thr1_irf_ce_21:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_21), 16, 16),1,IRF,ce,58,x, x,x,x, x,x,x)
	.word 0xf2342cd3  ! 339: STH_I	sth	%r25, [%r16 + 0x0cd3]
	.word 0x877c2401  ! 341: MOVR_I	move	%r16, 0xfffffff8, %r3
	.word 0xd3e42011  ! 341: CASA_R	casa	[%r16] %asi, %r17, %r9
thr1_irf_ce_22:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_22), 16, 16),1,IRF,ce,16,x, x,x,x, x,x,x)
	.word 0xf62c2d87  ! 344: STB_I	stb	%r27, [%r16 + 0x0d87]
	.word 0x85840011  ! 346: WRCCR_R	wr	%r16, %r17, %ccr
thr1_irf_ce_23:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_23), 16, 16),1,IRF,ce,62,x, x,x,x, x,x,x)
	.word 0xf6242317  ! 349: STW_I	stw	%r27, [%r16 + 0x0317]
	.word 0xab341011  ! 351: SRLX_R	srlx	%r16, %r17, %r21
	.word 0x81580000  ! 351: FLUSHW	flushw
	.word 0xd2740011  ! 352: STX_R	stx	%r9, [%r16 + %r17]
	.word 0x961c0011  ! 354: XOR_R	xor 	%r16, %r17, %r11
	.word 0xccf41011  ! 354: STXA_R	stxa	%r6, [%r16 + %r17] 0x80
thr1_irf_ce_24:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_24), 16, 16),1,IRF,ce,43,x, x,x,x, x,x,x)
	.word 0xfa7429d5  ! 357: STX_I	stx	%r29, [%r16 + 0x09d5]
	.word 0x8c040011  ! 359: ADD_R	add 	%r16, %r17, %r6
	.word 0x88440011  ! 359: ADDC_R	addc 	%r16, %r17, %r4
	.word 0x8143c000  ! 359: STBAR	stbar
thr1_irf_ce_25:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_25), 16, 16),1,IRF,ce,35,x, x,x,x, x,x,x)
	.word 0xd8342fcb  ! 362: STH_I	sth	%r12, [%r16 + 0x0fcb]
	.word 0x90fc0011  ! 364: SDIVcc_R	sdivcc 	%r16, %r17, %r8
	.word 0xa69c0011  ! 365: XORcc_R	xorcc 	%r16, %r17, %r19
	.word 0x983c2ff3  ! 367: XNOR_I	xnor 	%r16, 0x0ff3, %r12
	.word 0x96440011  ! 367: ADDC_R	addc 	%r16, %r17, %r11
	.word 0xce7c25ad  ! 367: SWAP_I	swap	%r7, [%r16 + 0x05ad]
thr1_irf_ce_26:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_26), 16, 16),1,IRF,ce,10,x, x,x,x, x,x,x)
	.word 0xde2c255d  ! 370: STB_I	stb	%r15, [%r16 + 0x055d]
	.word 0xb2f40011  ! 372: UDIVcc_R	udivcc 	%r16, %r17, %r25
	.word 0x823c2dfd  ! 373: XNOR_I	xnor 	%r16, 0x0dfd, %r1
	.word 0xb63c24dd  ! 375: XNOR_I	xnor 	%r16, 0x04dd, %r27
	.word 0xacac0011  ! 375: ANDNcc_R	andncc 	%r16, %r17, %r22
	.word 0x81dc23b3  ! 375: FLUSH_I	dis not found

	.word 0xfa240011  ! 376: STW_R	stw	%r29, [%r16 + %r17]
	.word 0xb57c2401  ! 378: MOVR_I	move	%r16, 0xfffffff8, %r26
	.word 0x88bc2b90  ! 378: XNORcc_I	xnorcc 	%r16, 0x0b90, %r4
	.word 0x9e042234  ! 378: ADD_I	add 	%r16, 0x0234, %r15
	.word 0xbc6c2f7e  ! 378: UDIVX_I	udivx 	%r16, 0x0f7e, %r30
thr1_irf_ce_27:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_27), 16, 16),1,IRF,ce,44,x, x,x,x, x,x,x)
	.word 0xf42423e1  ! 381: STW_I	stw	%r26, [%r16 + 0x03e1]
	.word 0x81dc219e  ! 383: FLUSH_I	dis not found

	.word 0xf43428e3  ! 385: STH_I	sth	%r26, [%r16 + 0x08e3]
	.word 0x9b342001  ! 387: SRL_I	srl 	%r16, 0x0001, %r13
	.word 0xbf342001  ! 387: SRL_I	srl 	%r16, 0x0001, %r31
	.word 0x81dc291c  ! 387: FLUSH_I	dis not found

	.word 0xc42c0011  ! 388: STB_R	stb	%r2, [%r16 + %r17]
	.word 0xaf3c0011  ! 390: SRA_R	sra 	%r16, %r17, %r23
	.word 0x8143e02b  ! 390: MEMBAR	membar	#LoadLoad | #StoreLoad | #StoreStore | #MemIssue 
	.word 0xda242957  ! 392: STW_I	stw	%r13, [%r16 + 0x0957]
	.word 0xa73c2001  ! 394: SRA_I	sra 	%r16, 0x0001, %r19
	.word 0x9a1c0011  ! 394: XOR_R	xor 	%r16, %r17, %r13
	.word 0xb7e40011  ! 394: SAVE_R	save	%r16, %r17, %r27
	.word 0xf4742977  ! 396: STX_I	stx	%r26, [%r16 + 0x0977]
	.word 0x95342001  ! 398: SRL_I	srl 	%r16, 0x0001, %r10
	.word 0x8d643801  ! 398: MOVcc_I	<illegal instruction>
	.word 0x952c3001  ! 398: SLLX_I	sllx	%r16, 0x0001, %r10
	.word 0x81580000  ! 398: FLUSHW	flushw
	.word 0xd4342d81  ! 400: STH_I	sth	%r10, [%r16 + 0x0d81]
	.word 0xa57c2401  ! 402: MOVR_I	move	%r16, 0xfffffff8, %r18
	.word 0x973c1011  ! 402: SRAX_R	srax	%r16, %r17, %r11
	.word 0x81dc2739  ! 402: FLUSH_I	dis not found

thr1_irf_ce_28:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_28), 16, 16),1,IRF,ce,58,x, x,x,x, x,x,x)
	.word 0xd22c2593  ! 405: STB_I	stb	%r9, [%r16 + 0x0593]
	.word 0x993c0011  ! 407: SRA_R	sra 	%r16, %r17, %r12
	.word 0xa5341011  ! 407: SRLX_R	srlx	%r16, %r17, %r18
	.word 0x9e040011  ! 407: ADD_R	add 	%r16, %r17, %r15
	.word 0x9a7c0011  ! 407: SDIV_R	sdiv 	%r16, %r17, %r13
	.word 0xc8742223  ! 409: STX_I	stx	%r4, [%r16 + 0x0223]
	.word 0x86042d83  ! 411: ADD_I	add 	%r16, 0x0d83, %r3
	.word 0xd844243e  ! 411: LDSW_I	ldsw	[%r16 + 0x043e], %r12
	.word 0xee340011  ! 412: STH_R	sth	%r23, [%r16 + %r17]
	.word 0x929c0011  ! 414: XORcc_R	xorcc 	%r16, %r17, %r9
	.word 0x8143c000  ! 414: STBAR	stbar
thr1_irf_ce_29:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_29), 16, 16),1,IRF,ce,57,x, x,x,x, x,x,x)
	.word 0xf8342e63  ! 417: STH_I	sth	%r28, [%r16 + 0x0e63]
	.word 0x8a4424e6  ! 419: ADDC_I	addc 	%r16, 0x04e6, %r5
	.word 0x88ac2a8b  ! 419: ANDNcc_I	andncc 	%r16, 0x0a8b, %r4
	.word 0x12800001  ! 419: BNE	bne  	<label_0x1>
	.word 0xda740011  ! 420: STX_R	stx	%r13, [%r16 + %r17]
	.word 0x06800001  ! 422: BL	bl  	<label_0x1>
	.word 0xf8342a3b  ! 424: STH_I	sth	%r28, [%r16 + 0x0a3b]
	.word 0xad343001  ! 426: SRLX_I	srlx	%r16, 0x0001, %r22
	.word 0xb40c2086  ! 426: AND_I	and 	%r16, 0x0086, %r26
	.word 0xda941011  ! 426: LDUHA_R	lduha	[%r16, %r17] 0x80, %r13
	.word 0xf8240011  ! 427: STW_R	stw	%r28, [%r16 + %r17]
thr1_resum_intr_5:
!$EV trig_pc_d(1,expr(@VA(.MAIN.thr1_resum_intr_5), 16, 16)) -> intp(1, 3, 1)
	wr      %r0, 0x5, %asr26
	.word 0xde2c2887  ! 431: STB_I	stb	%r15, [%r16 + 0x0887]
	.word 0xbabc2168  ! 433: XNORcc_I	xnorcc 	%r16, 0x0168, %r29
	.word 0x865c217a  ! 433: SMUL_I	smul 	%r16, 0x017a, %r3
	.word 0xd0342647  ! 435: STH_I	sth	%r8, [%r16 + 0x0647]
	.word 0xb20c0011  ! 437: AND_R	and 	%r16, %r17, %r25
	.word 0x84b40011  ! 437: ORNcc_R	orncc 	%r16, %r17, %r2
	.word 0xd04c0011  ! 437: LDSB_R	ldsb	[%r16 + %r17], %r8
	.word 0xfe240011  ! 438: STW_R	stw	%r31, [%r16 + %r17]
	.word 0x86842444  ! 440: ADDcc_I	addcc 	%r16, 0x0444, %r3
	.word 0x9f2c1011  ! 440: SLLX_R	sllx	%r16, %r17, %r15
	.word 0x9eac0011  ! 440: ANDNcc_R	andncc 	%r16, %r17, %r15
	.word 0xcccc2a8d  ! 440: LDSBA_I	ldsba	[%r16, + 0x0a8d] %asi, %r6
	.word 0xec740011  ! 441: STX_R	stx	%r22, [%r16 + %r17]
	.word 0x8d7c0411  ! 443: MOVR_R	move	%r16, %r17, %r6
	.word 0xb5641811  ! 443: MOVcc_R	<illegal instruction>
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x95340011  ! 444: SRL_R	srl 	%r16, %r17, %r10
	.word 0xc36c2c81  ! 446: PREFETCH_I	prefetch	[%r16 + 0x0c81], #one_read
thr1_irf_ce_30:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_30), 16, 16),1,IRF,ce,41,x, x,x,x, x,x,x)
	.word 0xd4742c69  ! 449: STX_I	stx	%r10, [%r16 + 0x0c69]
	.word 0x9ec42fc3  ! 451: ADDCcc_I	addccc 	%r16, 0x0fc3, %r15
	.word 0xdca41011  ! 451: STWA_R	stwa	%r14, [%r16 + %r17] 0x80
	.word 0xf22c0011  ! 452: STB_R	stb	%r25, [%r16 + %r17]
	.word 0xa8440011  ! 454: ADDC_R	addc 	%r16, %r17, %r20
	.word 0x97341011  ! 454: SRLX_R	srlx	%r16, %r17, %r11
	.word 0x9b340011  ! 454: SRL_R	srl 	%r16, %r17, %r13
        wr %g0, 0x4, %fprs
	.word 0xcc740011  ! 455: STX_R	stx	%r6, [%r16 + %r17]
	.word 0xae142c28  ! 457: OR_I	or 	%r16, 0x0c28, %r23
	.word 0x8d2c2001  ! 457: SLL_I	sll 	%r16, 0x0001, %r6
	.word 0xc6440011  ! 457: LDSW_R	ldsw	[%r16 + %r17], %r3
	.word 0xc6742afb  ! 459: STX_I	stx	%r3, [%r16 + 0x0afb]
	.word 0x9cbc0011  ! 461: XNORcc_R	xnorcc 	%r16, %r17, %r14
	.word 0x95341011  ! 461: SRLX_R	srlx	%r16, %r17, %r10
	.word 0xd4bc1011  ! 461: STDA_R	stda	%r10, [%r16 + %r17] 0x80
thr1_irf_ce_31:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_31), 16, 16),1,IRF,ce,60,x, x,x,x, x,x,x)
	.word 0xfa3427e1  ! 464: STH_I	sth	%r29, [%r16 + 0x07e1]
	.word 0xb0b40011  ! 466: ORNcc_R	orncc 	%r16, %r17, %r24
	.word 0x8ed40011  ! 466: UMULcc_R	umulcc 	%r16, %r17, %r7
	.word 0xc8742f49  ! 468: STX_I	stx	%r4, [%r16 + 0x0f49]
	.word 0x88c40011  ! 470: ADDCcc_R	addccc 	%r16, %r17, %r4
	.word 0x853c0011  ! 470: SRA_R	sra 	%r16, %r17, %r2
	.word 0x92fc0011  ! 470: SDIVcc_R	sdivcc 	%r16, %r17, %r9
thr1_irf_ce_32:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_32), 16, 16),1,IRF,ce,43,x, x,x,x, x,x,x)
	.word 0xf834283b  ! 473: STH_I	sth	%r28, [%r16 + 0x083b]
	.word 0x909c0011  ! 475: XORcc_R	xorcc 	%r16, %r17, %r8
	.word 0x95514000  ! 475: RDPR_TBA	rdpr	%tba, %r10
	.word 0xd8240011  ! 476: STW_R	stw	%r12, [%r16 + %r17]
	.word 0xc21c0011  ! 478: LDD_R	ldd	[%r16 + %r17], %r1
thr1_irf_ce_33:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_33), 16, 16),1,IRF,ce,29,x, x,x,x, x,x,x)
	.word 0xd2242d01  ! 481: STW_I	stw	%r9, [%r16 + 0x0d01]
	.word 0x82c4201e  ! 483: ADDCcc_I	addccc 	%r16, 0x001e, %r1
	.word 0x863420df  ! 483: ORN_I	orn 	%r16, 0x00df, %r3
	.word 0xa6bc2c7f  ! 483: XNORcc_I	xnorcc 	%r16, 0x0c7f, %r19
	ta	T_CHANGE_PRIV	! macro
thr1_irf_ce_34:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_34), 16, 16),1,IRF,ce,12,x, x,x,x, x,x,x)
	.word 0xe4242f93  ! 486: STW_I	stw	%r18, [%r16 + 0x0f93]
	.word 0x9f2c1011  ! 488: SLLX_R	sllx	%r16, %r17, %r15
	.word 0xb53c2001  ! 488: SRA_I	sra 	%r16, 0x0001, %r26
	.word 0x880c2063  ! 488: AND_I	and 	%r16, 0x0063, %r4
	.word 0xd47c0011  ! 488: SWAP_R	swap	%r10, [%r16 + %r17]
	.word 0xa4ac2dc8  ! 489: ANDNcc_I	andncc 	%r16, 0x0dc8, %r18
	.word 0x9cac0011  ! 491: ANDNcc_R	andncc 	%r16, %r17, %r14
	.word 0x869c29cb  ! 491: XORcc_I	xorcc 	%r16, 0x09cb, %r3
	.word 0x942c0011  ! 491: ANDN_R	andn 	%r16, %r17, %r10
	.word 0x916c0011  ! 491: SDIVX_R	sdivx	%r16, %r17, %r8
	.word 0x82bc2c7e  ! 492: XNORcc_I	xnorcc 	%r16, 0x0c7e, %r1
	.word 0x98842136  ! 494: ADDcc_I	addcc 	%r16, 0x0136, %r12
	.word 0x902c27f8  ! 494: ANDN_I	andn 	%r16, 0x07f8, %r8
	.word 0x24cc0001  ! 494: BRLEZ	brlez,a,pt	%16,<label_0xc0001>
	.word 0xdc2c28f3  ! 496: STB_I	stb	%r14, [%r16 + 0x08f3]
	.word 0x9d3c2001  ! 498: SRA_I	sra 	%r16, 0x0001, %r14
	.word 0x81880000  ! 498: SAVED	saved
	.word 0x92840011  ! 499: ADDcc_R	addcc 	%r16, %r17, %r9
	.word 0x8dec0011  ! 501: RESTORE_R	restore	%r16, %r17, %r6
thr1_irf_ce_35:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_35), 16, 16),1,IRF,ce,66,x, x,x,x, x,x,x)
	.word 0xc22c20f7  ! 504: STB_I	stb	%r1, [%r16 + 0x00f7]
	.word 0x9f3c1011  ! 506: SRAX_R	srax	%r16, %r17, %r15
	.word 0x9b3c2001  ! 506: SRA_I	sra 	%r16, 0x0001, %r13
	.word 0x88c4272f  ! 506: ADDCcc_I	addccc 	%r16, 0x072f, %r4
	.word 0x81880000  ! 506: RESTORED	saved
	.word 0xea242ee7  ! 508: STW_I	stw	%r21, [%r16 + 0x0ee7]
	.word 0x937c2401  ! 510: MOVR_I	move	%r16, 0xfffffff8, %r9
	.word 0xb5e40011  ! 510: SAVE_R	save	%r16, %r17, %r26
thr1_irf_ce_36:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_36), 16, 16),1,IRF,ce,7,x, x,x,x, x,x,x)
	.word 0xc4342049  ! 513: STH_I	sth	%r2, [%r16 + 0x0049]
	.word 0xc3ec24a7  ! 515: PREFETCHA_I	prefetcha	[%r16, + 0x04a7] %asi, #one_read
	.word 0xc6740011  ! 516: STX_R	stx	%r3, [%r16 + %r17]
	.word 0x8ac40011  ! 518: ADDCcc_R	addccc 	%r16, %r17, %r5
	.word 0xe40c0011  ! 518: LDUB_R	ldub	[%r16 + %r17], %r18
	.word 0x862c21dc  ! 519: ANDN_I	andn 	%r16, 0x01dc, %r3
	.word 0x9e140011  ! 521: OR_R	or 	%r16, %r17, %r15
	.word 0x888c2163  ! 521: ANDcc_I	andcc 	%r16, 0x0163, %r4
        wr %g0, 0x4, %fprs
	.word 0xca340011  ! 522: STH_R	sth	%r5, [%r16 + %r17]
	.word 0x881c0011  ! 524: XOR_R	xor 	%r16, %r17, %r4
	.word 0x84342e26  ! 524: ORN_I	orn 	%r16, 0x0e26, %r2
	.word 0xdccc2664  ! 524: LDSBA_I	ldsba	[%r16, + 0x0664] %asi, %r14
	.word 0x8f643801  ! 525: MOVcc_I	<illegal instruction>
        wr %g0, 0x4, %fprs
thr1_irf_ce_37:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_37), 16, 16),1,IRF,ce,22,x, x,x,x, x,x,x)
	.word 0xc4242557  ! 530: STW_I	stw	%r2, [%r16 + 0x0557]
	.word 0xbd3c1011  ! 532: SRAX_R	srax	%r16, %r17, %r30
	.word 0xba040011  ! 532: ADD_R	add 	%r16, %r17, %r29
	.word 0xc3ec21d3  ! 532: PREFETCHA_I	prefetcha	[%r16, + 0x01d3] %asi, #one_read
	.word 0xc62c222d  ! 534: STB_I	stb	%r3, [%r16 + 0x022d]
	.word 0x8a9c2cc1  ! 536: XORcc_I	xorcc 	%r16, 0x0cc1, %r5
	.word 0x86342620  ! 536: ORN_I	orn 	%r16, 0x0620, %r3
	.word 0xb68c266e  ! 536: ANDcc_I	andcc 	%r16, 0x066e, %r27
        wr %g0, 0x4, %fprs
thr1_irf_ce_38:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_38), 16, 16),1,IRF,ce,25,x, x,x,x, x,x,x)
	.word 0xd42c2733  ! 539: STB_I	stb	%r10, [%r16 + 0x0733]
	.word 0x8a3c0011  ! 541: XNOR_R	xnor 	%r16, %r17, %r5
	.word 0x8b2c3001  ! 541: SLLX_I	sllx	%r16, 0x0001, %r5
	.word 0x929c2b4e  ! 541: XORcc_I	xorcc 	%r16, 0x0b4e, %r9
	.word 0x9f418000  ! 541: RDFPRS	rd	%fprs, %r15
	.word 0xfc240011  ! 542: STW_R	stw	%r30, [%r16 + %r17]
	.word 0xaeb4237a  ! 544: ORNcc_I	orncc 	%r16, 0x037a, %r23
	.word 0x8b343001  ! 544: SRLX_I	srlx	%r16, 0x0001, %r5
	.word 0x94842e42  ! 544: ADDcc_I	addcc 	%r16, 0x0e42, %r10
	ta	T_CHANGE_PRIV	! macro
	.word 0xde742193  ! 546: STX_I	stx	%r15, [%r16 + 0x0193]
	.word 0x88840011  ! 548: ADDcc_R	addcc 	%r16, %r17, %r4
	.word 0xb5343001  ! 548: SRLX_I	srlx	%r16, 0x0001, %r26
	.word 0xb753c000  ! 548: RDPR_FQ	<illegal instruction>
thr1_irf_ce_39:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_39), 16, 16),1,IRF,ce,44,x, x,x,x, x,x,x)
	.word 0xca3428d9  ! 551: STH_I	sth	%r5, [%r16 + 0x08d9]
	.word 0x892c3001  ! 553: SLLX_I	sllx	%r16, 0x0001, %r4
	.word 0x8143e04d  ! 553: MEMBAR	membar	#LoadLoad | #LoadStore | #StoreStore | #Sync 
	.word 0xc6340011  ! 554: STH_R	sth	%r3, [%r16 + %r17]
	.word 0xa62c2050  ! 556: ANDN_I	andn 	%r16, 0x0050, %r19
	.word 0x9cb42462  ! 556: ORNcc_I	orncc 	%r16, 0x0462, %r14
	.word 0x8143e02d  ! 556: MEMBAR	membar	#LoadLoad | #LoadStore | #StoreStore | #MemIssue 
thr1_irf_ce_40:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_40), 16, 16),1,IRF,ce,29,x, x,x,x, x,x,x)
	.word 0xd2342f2f  ! 559: STH_I	sth	%r9, [%r16 + 0x0f2f]
        wr %g0, 0x4, %fprs
	.word 0x9894261c  ! 562: ORcc_I	orcc 	%r16, 0x061c, %r12
	.word 0x9a3c0011  ! 564: XNOR_R	xnor 	%r16, %r17, %r13
	.word 0x9f340011  ! 564: SRL_R	srl 	%r16, %r17, %r15
	.word 0xa6842967  ! 564: ADDcc_I	addcc 	%r16, 0x0967, %r19
thr1_resum_intr_6:
!$EV trig_pc_d(1,expr(@VA(.MAIN.thr1_resum_intr_6), 16, 16)) -> intp(1, 3, 1)
	wr      %r0, 0x5, %asr26
	.word 0xca2c29cf  ! 566: STB_I	stb	%r5, [%r16 + 0x09cf]
	.word 0xbb2c3001  ! 568: SLLX_I	sllx	%r16, 0x0001, %r29
	.word 0xb2442ab4  ! 568: ADDC_I	addc 	%r16, 0x0ab4, %r25
	.word 0x81880000  ! 568: SAVED	saved
thr1_irf_ce_41:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_41), 16, 16),1,IRF,ce,14,x, x,x,x, x,x,x)
	.word 0xd224245b  ! 571: STW_I	stw	%r9, [%r16 + 0x045b]
	.word 0xbc3c0011  ! 573: XNOR_R	xnor 	%r16, %r17, %r30
	.word 0xb4140011  ! 573: OR_R	or 	%r16, %r17, %r26
	.word 0x872c3001  ! 573: SLLX_I	sllx	%r16, 0x0001, %r3
	.word 0xc3ec201c  ! 573: PREFETCHA_I	prefetcha	[%r16, + 0x001c] %asi, #one_read
thr1_irf_ce_42:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_42), 16, 16),1,IRF,ce,38,x, x,x,x, x,x,x)
	.word 0xce2426a9  ! 576: STW_I	stw	%r7, [%r16 + 0x06a9]
	.word 0x960c0011  ! 578: AND_R	and 	%r16, %r17, %r11
	.word 0x9e4c0011  ! 578: MULX_R	mulx 	%r16, %r17, %r15
	.word 0xc2340011  ! 579: STH_R	sth	%r1, [%r16 + %r17]
	.word 0xc36c24b0  ! 581: PREFETCH_I	prefetch	[%r16 + 0x04b0], #one_read
	.word 0xd6342d81  ! 583: STH_I	sth	%r11, [%r16 + 0x0d81]
	.word 0x900c2768  ! 585: AND_I	and 	%r16, 0x0768, %r8
	.word 0xd2841011  ! 585: LDUWA_R	lduwa	[%r16, %r17] 0x80, %r9
	.word 0xca242935  ! 587: STW_I	stw	%r5, [%r16 + 0x0935]
	.word 0x8a9c0011  ! 589: XORcc_R	xorcc 	%r16, %r17, %r5
	.word 0xbe440011  ! 589: ADDC_R	addc 	%r16, %r17, %r31
thr1_resum_intr_7:
!$EV trig_pc_d(1,expr(@VA(.MAIN.thr1_resum_intr_7), 16, 16)) -> intp(1, 3, 1)
	wr      %r0, 0x5, %asr26
	.word 0x9a940011  ! 590: ORcc_R	orcc 	%r16, %r17, %r13
thr1_resum_intr_8:
!$EV trig_pc_d(1,expr(@VA(.MAIN.thr1_resum_intr_8), 16, 16)) -> intp(1, 3, 1)
	wr      %r0, 0x5, %asr26
thr1_irf_ce_43:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_43), 16, 16),1,IRF,ce,4,x, x,x,x, x,x,x)
	.word 0xce2c2819  ! 595: STB_I	stb	%r7, [%r16 + 0x0819]
	.word 0x9444231c  ! 597: ADDC_I	addc 	%r16, 0x031c, %r10
	.word 0x95341011  ! 597: SRLX_R	srlx	%r16, %r17, %r10
	ta	T_CHANGE_PRIV	! macro
	.word 0xe82c0011  ! 598: STB_R	stb	%r20, [%r16 + %r17]
	.word 0x92442eec  ! 600: ADDC_I	addc 	%r16, 0x0eec, %r9
	.word 0x9b534000  ! 600: RDPR_OTHERWIN	rdpr	%otherwin, %r13
	.word 0xc22420b7  ! 602: STW_I	stw	%r1, [%r16 + 0x00b7]
	.word 0xd0c41011  ! 604: LDSWA_R	ldswa	[%r16, %r17] 0x80, %r8
	.word 0xc42c2635  ! 606: STB_I	stb	%r2, [%r16 + 0x0635]
	.word 0xc36c0011  ! 608: PREFETCH_R	prefetch	[%r16 + %r17], #one_read
	.word 0xf2240011  ! 609: STW_R	stw	%r25, [%r16 + %r17]
	.word 0xfecc1011  ! 611: LDSBA_R	ldsba	[%r16, %r17] 0x80, %r31
	.word 0x868c0011  ! 612: ANDcc_R	andcc 	%r16, %r17, %r3
	.word 0x9404274e  ! 614: ADD_I	add 	%r16, 0x074e, %r10
	.word 0xa5641811  ! 614: MOVcc_R	<illegal instruction>
	.word 0x937c2401  ! 614: MOVR_I	move	%r16, 0xfffffff8, %r9
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x8b7c2401  ! 615: MOVR_I	move	%r16, 0x7fffbdd8, %r5
	.word 0x8c1c2402  ! 617: XOR_I	xor 	%r16, 0x0402, %r6
	.word 0x9b3c0011  ! 617: SRA_R	sra 	%r16, %r17, %r13
	.word 0xbcd40011  ! 617: UMULcc_R	umulcc 	%r16, %r17, %r30
	.word 0xae8c2dfc  ! 618: ANDcc_I	andcc 	%r16, 0x0dfc, %r23
	.word 0x961c0011  ! 620: XOR_R	xor 	%r16, %r17, %r11
	.word 0xfec42213  ! 620: LDSWA_I	ldswa	[%r16, + 0x0213] %asi, %r31
thr1_irf_ce_44:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_44), 16, 16),1,IRF,ce,64,x, x,x,x, x,x,x)
	.word 0xdc2c22a7  ! 623: STB_I	stb	%r14, [%r16 + 0x02a7]
	.word 0xc5f41011  ! 625: CASXA_I	casxa	[%r16] 0x80, %r17, %r2
	.word 0xd2740011  ! 626: STX_R	stx	%r9, [%r16 + %r17]
	.word 0x82bc0011  ! 628: XNORcc_R	xnorcc 	%r16, %r17, %r1
	.word 0xc36c0011  ! 628: PREFETCH_R	prefetch	[%r16 + %r17], #one_read
	.word 0x949c0011  ! 629: XORcc_R	xorcc 	%r16, %r17, %r10
	.word 0xef242f22  ! 631: STF_I	st	%f23, [0x0f22, %r16]
	.word 0x92140011  ! 632: OR_R	or 	%r16, %r17, %r9
	.word 0x9a8c0011  ! 634: ANDcc_R	andcc 	%r16, %r17, %r13
	.word 0x921c28c6  ! 634: XOR_I	xor 	%r16, 0x08c6, %r9
	.word 0xfc842eeb  ! 634: LDUWA_I	lduwa	[%r16, + 0x0eeb] %asi, %r30
	.word 0xea342e73  ! 636: STH_I	sth	%r21, [%r16 + 0x0e73]
	.word 0x98842687  ! 638: ADDcc_I	addcc 	%r16, 0x0687, %r12
	.word 0xca8422b7  ! 638: LDUWA_I	lduwa	[%r16, + 0x02b7] %asi, %r5
	.word 0xee740011  ! 639: STX_R	stx	%r23, [%r16 + %r17]
	.word 0xb82c0011  ! 641: ANDN_R	andn 	%r16, %r17, %r28
	.word 0x81880000  ! 641: RESTORED	saved
	.word 0xe62c0011  ! 642: STB_R	stb	%r19, [%r16 + %r17]
	.word 0x9c8c201d  ! 644: ANDcc_I	andcc 	%r16, 0x001d, %r14
	.word 0xc3ec2e09  ! 644: PREFETCHA_I	prefetcha	[%r16, + 0x0e09] %asi, #one_read
thr1_irf_ce_45:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_45), 16, 16),1,IRF,ce,71,x, x,x,x, x,x,x)
	.word 0xc62c2425  ! 647: STB_I	stb	%r3, [%r16 + 0x0425]
	.word 0x2c800001  ! 649: BNEG	bneg,a	<label_0x1>
	.word 0xbe2c23e2  ! 650: ANDN_I	andn 	%r16, 0x03e2, %r31
	.word 0x8d2c2001  ! 652: SLL_I	sll 	%r16, 0x0001, %r6
	.word 0xb9342001  ! 652: SRL_I	srl 	%r16, 0x0001, %r28
	.word 0x8143c000  ! 652: STBAR	stbar
	.word 0x969c2784  ! 653: XORcc_I	xorcc 	%r16, 0x0784, %r11
	.word 0xc2941011  ! 655: LDUHA_R	lduha	[%r16, %r17] 0x80, %r1
	.word 0x9cb40011  ! 656: ORNcc_R	orncc 	%r16, %r17, %r14
	.word 0xb0940011  ! 658: ORcc_R	orcc 	%r16, %r17, %r24
	.word 0x99641811  ! 658: MOVcc_R	<illegal instruction>
	.word 0x8aac0011  ! 658: ANDNcc_R	andncc 	%r16, %r17, %r5
	.word 0x8ef40011  ! 658: UDIVcc_R	udivcc 	%r16, %r17, %r7
	.word 0xde2c2caf  ! 660: STB_I	stb	%r15, [%r16 + 0x0caf]
	.word 0x86c42aa1  ! 662: ADDCcc_I	addccc 	%r16, 0x0aa1, %r3
	.word 0x91340011  ! 662: SRL_R	srl 	%r16, %r17, %r8
	.word 0x04800001  ! 662: BLE	ble  	<label_0x1>
	.word 0xaa142ce8  ! 663: OR_I	or 	%r16, 0x0ce8, %r21
	.word 0xb2440011  ! 665: ADDC_R	addc 	%r16, %r17, %r25
	.word 0xb42c2e0f  ! 665: ANDN_I	andn 	%r16, 0x0e0f, %r26
	.word 0x924425cd  ! 665: ADDC_I	addc 	%r16, 0x05cd, %r9
	.word 0x1a800001  ! 665: BCC	bcc  	<label_0x1>
	.word 0xd42c0011  ! 666: STB_R	stb	%r10, [%r16 + %r17]
	.word 0x9a842608  ! 668: ADDcc_I	addcc 	%r16, 0x0608, %r13
	.word 0x921c242b  ! 668: XOR_I	xor 	%r16, 0x042b, %r9
	.word 0xc36c26ca  ! 668: PREFETCH_I	prefetch	[%r16 + 0x06ca], #one_read
	.word 0xd2240011  ! 669: STW_R	stw	%r9, [%r16 + %r17]
	.word 0xac042c17  ! 671: ADD_I	add 	%r16, 0x0c17, %r22
	.word 0xb6ac2e95  ! 671: ANDNcc_I	andncc 	%r16, 0x0e95, %r27
	.word 0x9294275f  ! 671: ORcc_I	orcc 	%r16, 0x075f, %r9
	ta	T_CHANGE_HPRIV	! macro
	.word 0xca2c0011  ! 672: STB_R	stb	%r5, [%r16 + %r17]
	.word 0xb7341011  ! 674: SRLX_R	srlx	%r16, %r17, %r27
	.word 0x833c0011  ! 674: SRA_R	sra 	%r16, %r17, %r1
	.word 0xc24c25f7  ! 674: LDSB_I	ldsb	[%r16 + 0x05f7], %r1
thr1_irf_ce_46:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_46), 16, 16),1,IRF,ce,42,x, x,x,x, x,x,x)
	.word 0xce74292f  ! 677: STX_I	stx	%r7, [%r16 + 0x092f]
	.word 0xbd2c0011  ! 679: SLL_R	sll 	%r16, %r17, %r30
	.word 0xd4941011  ! 679: LDUHA_R	lduha	[%r16, %r17] 0x80, %r10
	.word 0xb8b40011  ! 680: ORNcc_R	orncc 	%r16, %r17, %r28
	.word 0x81dc0011  ! 682: FLUSH_R	dis not found

	.word 0xfa342be9  ! 684: STH_I	sth	%r29, [%r16 + 0x0be9]
	.word 0x893c2001  ! 686: SRA_I	sra 	%r16, 0x0001, %r4
	.word 0xc2440011  ! 686: LDSW_R	ldsw	[%r16 + %r17], %r1
	.word 0xfc342b6b  ! 688: STH_I	sth	%r30, [%r16 + 0x0b6b]
	.word 0x8cc40011  ! 690: ADDCcc_R	addccc 	%r16, %r17, %r6
	.word 0x81dc22e1  ! 690: FLUSH_I	dis not found

	.word 0xee2c0011  ! 691: STB_R	stb	%r23, [%r16 + %r17]
	.word 0x9b341011  ! 693: SRLX_R	srlx	%r16, %r17, %r13
	.word 0x908c2bab  ! 693: ANDcc_I	andcc 	%r16, 0x0bab, %r8
	.word 0x982c2b19  ! 693: ANDN_I	andn 	%r16, 0x0b19, %r12
	.word 0xcc042ee9  ! 693: LDUW_I	lduw	[%r16 + 0x0ee9], %r6
	.word 0x8f342001  ! 694: SRL_I	srl 	%r16, 0x0001, %r7
	.word 0x98c40011  ! 696: ADDCcc_R	addccc 	%r16, %r17, %r12
	.word 0x981c0011  ! 696: XOR_R	xor 	%r16, %r17, %r12
	.word 0xb63c0011  ! 696: XNOR_R	xnor 	%r16, %r17, %r27
	.word 0xaad40011  ! 696: UMULcc_R	umulcc 	%r16, %r17, %r21
	.word 0x821c0011  ! 697: XOR_R	xor 	%r16, %r17, %r1
	.word 0xc36c284e  ! 699: PREFETCH_I	prefetch	[%r16 + 0x084e], #one_read
	.word 0xee7420db  ! 701: STX_I	stx	%r23, [%r16 + 0x00db]
	.word 0x940c0011  ! 703: AND_R	and 	%r16, %r17, %r10
	.word 0x91343001  ! 703: SRLX_I	srlx	%r16, 0x0001, %r8
	.word 0xdd3c0011  ! 703: STDF_R	std	%f14, [%r17, %r16]
	.word 0x9d2c3001  ! 704: SLLX_I	sllx	%r16, 0x0001, %r14
	.word 0x828c0011  ! 706: ANDcc_R	andcc 	%r16, %r17, %r1
	.word 0x2ac40003  ! 706: BRNZ	brnz,a,nt	%16,<label_0x40003>
thr1_irf_ce_47:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_47), 16, 16),1,IRF,ce,61,x, x,x,x, x,x,x)
	.word 0xce342bf5  ! 709: STH_I	sth	%r7, [%r16 + 0x0bf5]
	.word 0xa814220c  ! 711: OR_I	or 	%r16, 0x020c, %r20
	.word 0xecbc27ed  ! 711: STDA_I	stda	%r22, [%r16 + 0x07ed] %asi
	.word 0xd62c2251  ! 713: STB_I	stb	%r11, [%r16 + 0x0251]
        wr %g0, 0x4, %fprs
	.word 0xd4740011  ! 716: STX_R	stx	%r10, [%r16 + %r17]
	.word 0x9b341011  ! 718: SRLX_R	srlx	%r16, %r17, %r13
	.word 0x9c8c2fac  ! 718: ANDcc_I	andcc 	%r16, 0x0fac, %r14
	.word 0x960c2486  ! 718: AND_I	and 	%r16, 0x0486, %r11
	.word 0xd0ac2713  ! 718: STBA_I	stba	%r8, [%r16 + 0x0713] %asi
	.word 0xc2242271  ! 720: STW_I	stw	%r1, [%r16 + 0x0271]
	.word 0xaa8c0011  ! 722: ANDcc_R	andcc 	%r16, %r17, %r21
	.word 0x989c0011  ! 722: XORcc_R	xorcc 	%r16, %r17, %r12
	.word 0x9a340011  ! 722: ORN_R	orn 	%r16, %r17, %r13
	.word 0x987c0011  ! 722: SDIV_R	sdiv 	%r16, %r17, %r12
	.word 0xce740011  ! 723: STX_R	stx	%r7, [%r16 + %r17]
	.word 0x99340011  ! 725: SRL_R	srl 	%r16, %r17, %r12
	.word 0x9d3c2001  ! 725: SRA_I	sra 	%r16, 0x0001, %r14
	.word 0x8d2c3001  ! 725: SLLX_I	sllx	%r16, 0x0001, %r6
	.word 0x2ac40003  ! 725: BRNZ	brnz,a,nt	%16,<label_0x40003>
	.word 0x9ca40011  ! 726: SUBcc_R	subcc 	%r16, %r17, %r14
	.word 0xb6342235  ! 728: ORN_I	orn 	%r16, 0x0235, %r27
	.word 0xbb50c000  ! 728: RDPR_TT	rdpr	%tt, %r29
thr1_irf_ce_48:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_48), 16, 16),1,IRF,ce,16,x, x,x,x, x,x,x)
	.word 0xee7424f5  ! 731: STX_I	stx	%r23, [%r16 + 0x04f5]
	.word 0xb61c2266  ! 733: XOR_I	xor 	%r16, 0x0266, %r27
	.word 0xd8c41011  ! 733: LDSWA_R	ldswa	[%r16, %r17] 0x80, %r12
	.word 0xc4340011  ! 734: STH_R	sth	%r2, [%r16 + %r17]
	.word 0xbe8c0011  ! 736: ANDcc_R	andcc 	%r16, %r17, %r31
	.word 0x863c0011  ! 736: XNOR_R	xnor 	%r16, %r17, %r3
	.word 0x9cbc283f  ! 736: XNORcc_I	xnorcc 	%r16, 0x083f, %r14
	.word 0x0cc40003  ! 736: BRGZ	brgz  ,nt	%16,<label_0x40003>
	.word 0x9aac0011  ! 737: ANDNcc_R	andncc 	%r16, %r17, %r13
	.word 0xb8d42ff7  ! 739: UMULcc_I	umulcc 	%r16, 0x0ff7, %r28
	.word 0x8cc40011  ! 740: ADDCcc_R	addccc 	%r16, %r17, %r6
	.word 0x9cc42f1a  ! 742: ADDCcc_I	addccc 	%r16, 0x0f1a, %r14
	.word 0x9b2c0011  ! 742: SLL_R	sll 	%r16, %r17, %r13
	.word 0x8a3c0011  ! 742: XNOR_R	xnor 	%r16, %r17, %r5
	.word 0x90740011  ! 742: UDIV_R	udiv 	%r16, %r17, %r8
	.word 0x8c840011  ! 743: ADDcc_R	addcc 	%r16, %r17, %r6
	.word 0xe8042b94  ! 745: LDUW_I	lduw	[%r16 + 0x0b94], %r20
	.word 0x9e340011  ! 746: ORN_R	orn 	%r16, %r17, %r15
	.word 0x928c0011  ! 748: ANDcc_R	andcc 	%r16, %r17, %r9
thr1_resum_intr_9:
!$EV trig_pc_d(1,expr(@VA(.MAIN.thr1_resum_intr_9), 16, 16)) -> intp(1, 3, 1)
	wr      %r0, 0x5, %asr26
	.word 0xfe340011  ! 749: STH_R	sth	%r31, [%r16 + %r17]
	.word 0x8c0c0011  ! 751: AND_R	and 	%r16, %r17, %r6
        wr %g0, 0x4, %fprs
	.word 0x92b42142  ! 752: ORNcc_I	orncc 	%r16, 0x0142, %r9
	.word 0xa8840011  ! 754: ADDcc_R	addcc 	%r16, %r17, %r20
	.word 0x9f514000  ! 754: RDPR_TBA	rdpr	%tba, %r15
	.word 0xdc2c0011  ! 755: STB_R	stb	%r14, [%r16 + %r17]
	.word 0xa4140011  ! 757: OR_R	or 	%r16, %r17, %r18
	.word 0x929c0011  ! 757: XORcc_R	xorcc 	%r16, %r17, %r9
	.word 0xc36c21c2  ! 757: PREFETCH_I	prefetch	[%r16 + 0x01c2], #one_read
	.word 0xc2742fff  ! 759: STX_I	stx	%r1, [%r16 + 0x0fff]
	.word 0xb61c0011  ! 761: XOR_R	xor 	%r16, %r17, %r27
	.word 0xb48c0011  ! 761: ANDcc_R	andcc 	%r16, %r17, %r26
	.word 0xecac2adc  ! 761: STBA_I	stba	%r22, [%r16 + 0x0adc] %asi
	.word 0xd8740011  ! 762: STX_R	stx	%r12, [%r16 + %r17]
	.word 0x99641811  ! 764: MOVcc_R	<illegal instruction>
	.word 0x923c2949  ! 764: XNOR_I	xnor 	%r16, 0x0949, %r9
        wr %g0, 0x4, %fprs
	.word 0xcc2c2c99  ! 766: STB_I	stb	%r6, [%r16 + 0x0c99]
	.word 0xfa042894  ! 768: LDUW_I	lduw	[%r16 + 0x0894], %r29
	.word 0x8a9427ef  ! 769: ORcc_I	orcc 	%r16, 0x07ef, %r5
	.word 0x937c0411  ! 771: MOVR_R	move	%r16, %r17, %r9
	.word 0x8143e03a  ! 771: MEMBAR	membar	#StoreLoad | #StoreStore | #Lookaside | #MemIssue 
thr1_irf_ce_49:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_49), 16, 16),1,IRF,ce,57,x, x,x,x, x,x,x)
	.word 0xcc342185  ! 774: STH_I	sth	%r6, [%r16 + 0x0185]
	.word 0x8f3c0011  ! 776: SRA_R	sra 	%r16, %r17, %r7
	.word 0xa41c2f59  ! 776: XOR_I	xor 	%r16, 0x0f59, %r18
	.word 0x81dc2964  ! 776: FLUSH_I	dis not found

	.word 0xf6240011  ! 777: STW_R	stw	%r27, [%r16 + %r17]
	.word 0xaa040011  ! 779: ADD_R	add 	%r16, %r17, %r21
	.word 0xb28c258f  ! 779: ANDcc_I	andcc 	%r16, 0x058f, %r25
	.word 0x917c0411  ! 779: MOVR_R	move	%r16, %r17, %r8
	.word 0x85a40d31  ! 779: FsMULd	fsmuld	%f16, %f48, %f2
	.word 0xb12c0011  ! 780: SLL_R	sll 	%r16, %r17, %r24
	.word 0xa93c0011  ! 782: SRA_R	sra 	%r16, %r17, %r20
	.word 0x9a8c0011  ! 782: ANDcc_R	andcc 	%r16, %r17, %r13
	.word 0x8a140011  ! 782: OR_R	or 	%r16, %r17, %r5
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xd0740011  ! 783: STX_R	stx	%r8, [%r16 + %r17]
	.word 0xbe0424ca  ! 785: ADD_I	add 	%r16, 0x04ca, %r31
	.word 0xb97c2401  ! 785: MOVR_I	move	%r16, 0xfffffff8, %r28
	.word 0xc25c202b  ! 785: LDX_I	ldx	[%r16 + 0x002b], %r1
	.word 0xf6242123  ! 787: STW_I	stw	%r27, [%r16 + 0x0123]
	.word 0x0ecc0001  ! 789: BRGEZ	brgez  ,pt	%16,<label_0xc0001>
	.word 0xf6742ab3  ! 791: STX_I	stx	%r27, [%r16 + 0x0ab3]
	.word 0x9a8c0011  ! 793: ANDcc_R	andcc 	%r16, %r17, %r13
	.word 0x91341011  ! 793: SRLX_R	srlx	%r16, %r17, %r8
	.word 0x90040011  ! 793: ADD_R	add 	%r16, %r17, %r8
	.word 0x9a7c2055  ! 793: SDIV_I	sdiv 	%r16, 0x0055, %r13
	.word 0x94242ad5  ! 794: SUB_I	sub 	%r16, 0x0ad5, %r10
	.word 0xb89c0011  ! 796: XORcc_R	xorcc 	%r16, %r17, %r28
	.word 0x9e9c0011  ! 796: XORcc_R	xorcc 	%r16, %r17, %r15
	.word 0x86bc0011  ! 796: XNORcc_R	xnorcc 	%r16, %r17, %r3
	.word 0x2ac40001  ! 796: BRNZ	brnz,a,nt	%16,<label_0x40001>
	.word 0x873c1011  ! 797: SRAX_R	srax	%r16, %r17, %r3
	.word 0x909c0011  ! 799: XORcc_R	xorcc 	%r16, %r17, %r8
	.word 0x913c1011  ! 799: SRAX_R	srax	%r16, %r17, %r8
	.word 0x9ebc0011  ! 799: XNORcc_R	xnorcc 	%r16, %r17, %r15
	.word 0x8de40011  ! 799: SAVE_R	save	%r16, %r17, %r6
thr1_irf_ce_50:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_50), 16, 16),1,IRF,ce,34,x, x,x,x, x,x,x)
	.word 0xd22c2535  ! 802: STB_I	stb	%r9, [%r16 + 0x0535]
	.word 0xbebc260e  ! 804: XNORcc_I	xnorcc 	%r16, 0x060e, %r31
	.word 0xba742084  ! 804: UDIV_I	udiv 	%r16, 0x0084, %r29
thr1_irf_ce_51:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_51), 16, 16),1,IRF,ce,58,x, x,x,x, x,x,x)
	.word 0xf82c2233  ! 807: STB_I	stb	%r28, [%r16 + 0x0233]
	ta	T_CHANGE_PRIV	! macro
	.word 0xf82c245b  ! 811: STB_I	stb	%r28, [%r16 + 0x045b]
	.word 0x9e840011  ! 813: ADDcc_R	addcc 	%r16, %r17, %r15
	.word 0x8d7c2401  ! 813: MOVR_I	move	%r16, 0xfffffff8, %r6
thr1_resum_intr_10:
!$EV trig_pc_d(1,expr(@VA(.MAIN.thr1_resum_intr_10), 16, 16)) -> intp(1, 3, 1)
	wr      %r0, 0x5, %asr26
	.word 0xd22423d1  ! 815: STW_I	stw	%r9, [%r16 + 0x03d1]
	.word 0x9a34228f  ! 817: ORN_I	orn 	%r16, 0x028f, %r13
	.word 0xb20c28e2  ! 817: AND_I	and 	%r16, 0x08e2, %r25
	.word 0x89242157  ! 817: MULScc_I	mulscc 	%r16, 0x0157, %r4
thr1_irf_ce_52:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_52), 16, 16),1,IRF,ce,7,x, x,x,x, x,x,x)
	.word 0xfe2c265d  ! 820: STB_I	stb	%r31, [%r16 + 0x065d]
	.word 0xb0140011  ! 822: OR_R	or 	%r16, %r17, %r24
	.word 0xbcb40011  ! 822: ORNcc_R	orncc 	%r16, %r17, %r30
	.word 0x856c2d39  ! 822: SDIVX_I	sdivx	%r16, 0x0d39, %r2
	.word 0xfc2c0011  ! 823: STB_R	stb	%r30, [%r16 + %r17]
	.word 0xbec40011  ! 825: ADDCcc_R	addccc 	%r16, %r17, %r31
	.word 0x9e840011  ! 825: ADDcc_R	addcc 	%r16, %r17, %r15
	.word 0xf45423d8  ! 825: LDSH_I	ldsh	[%r16 + 0x03d8], %r26
	.word 0xea2c2d3f  ! 827: STB_I	stb	%r21, [%r16 + 0x0d3f]
	.word 0xc36c2463  ! 829: PREFETCH_I	prefetch	[%r16 + 0x0463], #one_read
	.word 0xea2c25ab  ! 831: STB_I	stb	%r21, [%r16 + 0x05ab]
	.word 0xa7343001  ! 833: SRLX_I	srlx	%r16, 0x0001, %r19
	.word 0x8a8c0011  ! 833: ANDcc_R	andcc 	%r16, %r17, %r5
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x8ac42451  ! 834: ADDCcc_I	addccc 	%r16, 0x0451, %r5
	.word 0x820c2063  ! 836: AND_I	and 	%r16, 0x0063, %r1
	.word 0x9f6c229f  ! 836: SDIVX_I	sdivx	%r16, 0x029f, %r15
	.word 0xca242567  ! 838: STW_I	stw	%r5, [%r16 + 0x0567]
	.word 0xe8442d8c  ! 840: LDSW_I	ldsw	[%r16 + 0x0d8c], %r20
	.word 0x9c9c0011  ! 841: XORcc_R	xorcc 	%r16, %r17, %r14
	.word 0x9d3c0011  ! 843: SRA_R	sra 	%r16, %r17, %r14
	.word 0x857c2401  ! 843: MOVR_I	move	%r16, 0xfffffff8, %r2
	.word 0xc3ec2d26  ! 843: PREFETCHA_I	prefetcha	[%r16, + 0x0d26] %asi, #one_read
	.word 0xd22c0011  ! 844: STB_R	stb	%r9, [%r16 + %r17]
	.word 0x848c0011  ! 846: ANDcc_R	andcc 	%r16, %r17, %r2
	.word 0x8ac42b13  ! 846: ADDCcc_I	addccc 	%r16, 0x0b13, %r5
	.word 0x99a8c831  ! 846: FMOVL	fmovs	%fcc1, %f17, %f12
thr1_irf_ce_53:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_53), 16, 16),1,IRF,ce,53,x, x,x,x, x,x,x)
	.word 0xd2742ee7  ! 849: STX_I	stx	%r9, [%r16 + 0x0ee7]
	.word 0x9a5c2273  ! 851: SMUL_I	smul 	%r16, 0x0273, %r13
thr1_irf_ce_54:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_54), 16, 16),1,IRF,ce,56,x, x,x,x, x,x,x)
	.word 0xd674297f  ! 854: STX_I	stx	%r11, [%r16 + 0x097f]
	.word 0x92b40011  ! 856: ORNcc_R	orncc 	%r16, %r17, %r9
	.word 0xb00c0011  ! 856: AND_R	and 	%r16, %r17, %r24
	.word 0x832c1011  ! 856: SLLX_R	sllx	%r16, %r17, %r1
	.word 0xc36c20c6  ! 856: PREFETCH_I	prefetch	[%r16 + 0x00c6], #one_read
	.word 0xd074263d  ! 858: STX_I	stx	%r8, [%r16 + 0x063d]
	.word 0xaa0c0011  ! 860: AND_R	and 	%r16, %r17, %r21
	.word 0xfc8c2b3b  ! 860: LDUBA_I	lduba	[%r16, + 0x0b3b] %asi, %r30
	.word 0x9cac26fd  ! 861: ANDNcc_I	andncc 	%r16, 0x06fd, %r14
	.word 0x8d7c0411  ! 863: MOVR_R	move	%r16, %r17, %r6
	.word 0xf64c0011  ! 863: LDSB_R	ldsb	[%r16 + %r17], %r27
	.word 0xe6740011  ! 864: STX_R	stx	%r19, [%r16 + %r17]
	.word 0xf0fc2a4d  ! 866: SWAPA_I	swapa	%r24, [%r16 + 0x0a4d] %asi
	.word 0x8d2c1011  ! 867: SLLX_R	sllx	%r16, %r17, %r6
	.word 0xa8bc0011  ! 869: XNORcc_R	xnorcc 	%r16, %r17, %r20
	.word 0x877c0411  ! 869: MOVR_R	move	%r16, %r17, %r3
	.word 0x8ab40011  ! 869: ORNcc_R	orncc 	%r16, %r17, %r5
	.word 0xf04c282d  ! 869: LDSB_I	ldsb	[%r16 + 0x082d], %r24
thr1_irf_ce_55:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_55), 16, 16),1,IRF,ce,13,x, x,x,x, x,x,x)
	.word 0xc2342f3d  ! 872: STH_I	sth	%r1, [%r16 + 0x0f3d]
	.word 0x997c2401  ! 874: MOVR_I	move	%r16, 0xfffffff8, %r12
	.word 0x96040011  ! 874: ADD_R	add 	%r16, %r17, %r11
	.word 0x92340011  ! 874: ORN_R	orn 	%r16, %r17, %r9
	.word 0xc36c0011  ! 874: PREFETCH_R	prefetch	[%r16 + %r17], #one_read
thr1_irf_ce_56:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_56), 16, 16),1,IRF,ce,58,x, x,x,x, x,x,x)
	.word 0xdc34238b  ! 877: STH_I	sth	%r14, [%r16 + 0x038b]
thr1_resum_intr_11:
!$EV trig_pc_d(1,expr(@VA(.MAIN.thr1_resum_intr_11), 16, 16)) -> intp(1, 3, 1)
	wr      %r0, 0x5, %asr26
thr1_irf_ce_57:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_57), 16, 16),1,IRF,ce,52,x, x,x,x, x,x,x)
	.word 0xdc342663  ! 882: STH_I	sth	%r14, [%r16 + 0x0663]
	.word 0xb42c26ec  ! 884: ANDN_I	andn 	%r16, 0x06ec, %r26
        wr %g0, 0x4, %fprs
thr1_irf_ce_58:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_58), 16, 16),1,IRF,ce,8,x, x,x,x, x,x,x)
	.word 0xe82c268d  ! 887: STB_I	stb	%r20, [%r16 + 0x068d]
	.word 0x8eb40011  ! 889: ORNcc_R	orncc 	%r16, %r17, %r7
	.word 0xbf7c2401  ! 889: MOVR_I	move	%r16, 0xfffffff8, %r31
	.word 0x952c3001  ! 889: SLLX_I	sllx	%r16, 0x0001, %r10
	.word 0xc4d425d0  ! 889: LDSHA_I	ldsha	[%r16, + 0x05d0] %asi, %r2
	.word 0xd2342c8b  ! 891: STH_I	sth	%r9, [%r16 + 0x0c8b]
	.word 0xa8142a44  ! 893: OR_I	or 	%r16, 0x0a44, %r20
	.word 0x8c442e7f  ! 893: ADDC_I	addc 	%r16, 0x0e7f, %r6
	.word 0x86b422d5  ! 893: ORNcc_I	orncc 	%r16, 0x02d5, %r3
        wr %g0, 0x4, %fprs
	.word 0xf6742395  ! 895: STX_I	stx	%r27, [%r16 + 0x0395]
	.word 0x8a440011  ! 897: ADDC_R	addc 	%r16, %r17, %r5
	.word 0xbeac2f53  ! 897: ANDNcc_I	andncc 	%r16, 0x0f53, %r31
	.word 0xbf3c0011  ! 897: SRA_R	sra 	%r16, %r17, %r31
	.word 0xd5f42011  ! 897: CASXA_R	casxa	[%r16]%asi, %r17, %r10
	.word 0xf0742589  ! 899: STX_I	stx	%r24, [%r16 + 0x0589]
	.word 0x9ebc0011  ! 901: XNORcc_R	xnorcc 	%r16, %r17, %r15
	.word 0x92040011  ! 901: ADD_R	add 	%r16, %r17, %r9
	.word 0x88342855  ! 901: ORN_I	orn 	%r16, 0x0855, %r4
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xfc340011  ! 902: STH_R	sth	%r30, [%r16 + %r17]
	.word 0xc2d41011  ! 904: LDSHA_R	ldsha	[%r16, %r17] 0x80, %r1
thr1_irf_ce_59:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_59), 16, 16),1,IRF,ce,9,x, x,x,x, x,x,x)
	.word 0xce342fdf  ! 907: STH_I	sth	%r7, [%r16 + 0x0fdf]
	.word 0x81dc2b5a  ! 909: FLUSH_I	dis not found

	.word 0xc4240011  ! 910: STW_R	stw	%r2, [%r16 + %r17]
	.word 0xcf3c0011  ! 912: STDF_R	std	%f7, [%r17, %r16]
	.word 0xc8240011  ! 913: STW_R	stw	%r4, [%r16 + %r17]
	.word 0x961c0011  ! 915: XOR_R	xor 	%r16, %r17, %r11
	.word 0x849c0011  ! 915: XORcc_R	xorcc 	%r16, %r17, %r2
	.word 0xc60428d2  ! 915: LDUW_I	lduw	[%r16 + 0x08d2], %r3
	.word 0x833c3001  ! 916: SRAX_I	srax	%r16, 0x0001, %r1
	.word 0xa49c0011  ! 918: XORcc_R	xorcc 	%r16, %r17, %r18
	.word 0x89240011  ! 918: MULScc_R	mulscc 	%r16, %r17, %r4
	.word 0xc82c20ab  ! 920: STB_I	stb	%r4, [%r16 + 0x00ab]
	.word 0x88340011  ! 922: ORN_R	orn 	%r16, %r17, %r4
        wr %g0, 0x4, %fprs
	.word 0xe8240011  ! 923: STW_R	stw	%r20, [%r16 + %r17]
	.word 0x86ac2840  ! 925: ANDNcc_I	andncc 	%r16, 0x0840, %r3
	.word 0xa6140011  ! 925: OR_R	or 	%r16, %r17, %r19
	.word 0x97641811  ! 925: MOVcc_R	<illegal instruction>
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xd42c0011  ! 926: STB_R	stb	%r10, [%r16 + %r17]
	.word 0x960c20ce  ! 928: AND_I	and 	%r16, 0x00ce, %r11
	.word 0x81880000  ! 928: RESTORED	saved
	.word 0x96a40011  ! 929: SUBcc_R	subcc 	%r16, %r17, %r11
	.word 0x8cbc2053  ! 931: XNORcc_I	xnorcc 	%r16, 0x0053, %r6
	.word 0x989c0011  ! 931: XORcc_R	xorcc 	%r16, %r17, %r12
	.word 0xa6b40011  ! 931: ORNcc_R	orncc 	%r16, %r17, %r19
	.word 0x8143c000  ! 931: STBAR	stbar
	.word 0xaabc24ce  ! 932: XNORcc_I	xnorcc 	%r16, 0x04ce, %r21
	.word 0xb13c0011  ! 934: SRA_R	sra 	%r16, %r17, %r24
	.word 0xfc5c0011  ! 934: LDX_R	ldx	[%r16 + %r17], %r30
	.word 0xde340011  ! 935: STH_R	sth	%r15, [%r16 + %r17]
	.word 0xaa1c28f6  ! 937: XOR_I	xor 	%r16, 0x08f6, %r21
	.word 0xa93c2001  ! 937: SRA_I	sra 	%r16, 0x0001, %r20
	.word 0xb00c0011  ! 937: AND_R	and 	%r16, %r17, %r24
thr1_resum_intr_12:
!$EV trig_pc_d(1,expr(@VA(.MAIN.thr1_resum_intr_12), 16, 16)) -> intp(1, 3, 1)
	wr      %r0, 0x5, %asr26
	.word 0xe6240011  ! 938: STW_R	stw	%r19, [%r16 + %r17]
	.word 0x9a9c2851  ! 940: XORcc_I	xorcc 	%r16, 0x0851, %r13
	.word 0x96940011  ! 940: ORcc_R	orcc 	%r16, %r17, %r11
	.word 0x8143e020  ! 940: MEMBAR	membar	#MemIssue 
	.word 0xca742875  ! 942: STX_I	stx	%r5, [%r16 + 0x0875]
	.word 0xa6342c3f  ! 944: ORN_I	orn 	%r16, 0x0c3f, %r19
	.word 0x942c2c8d  ! 944: ANDN_I	andn 	%r16, 0x0c8d, %r10
	.word 0x85342001  ! 944: SRL_I	srl 	%r16, 0x0001, %r2
	.word 0x8143c000  ! 944: STBAR	stbar
	.word 0xea342ead  ! 946: STH_I	sth	%r21, [%r16 + 0x0ead]
	.word 0xb3643801  ! 948: MOVcc_I	<illegal instruction>
	.word 0xbf2c0011  ! 948: SLL_R	sll 	%r16, %r17, %r31
	.word 0x92140011  ! 948: OR_R	or 	%r16, %r17, %r9
	.word 0xbba00051  ! 948: FMOVd	fmovd	%f48, %f60
thr1_irf_ce_60:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_60), 16, 16),1,IRF,ce,50,x, x,x,x, x,x,x)
	.word 0xd82c231f  ! 951: STB_I	stb	%r12, [%r16 + 0x031f]
	.word 0x862c0011  ! 953: ANDN_R	andn 	%r16, %r17, %r3
	.word 0x943c0011  ! 953: XNOR_R	xnor 	%r16, %r17, %r10
	.word 0x8cbc2be9  ! 953: XNORcc_I	xnorcc 	%r16, 0x0be9, %r6
	.word 0xf2a41011  ! 953: STWA_R	stwa	%r25, [%r16 + %r17] 0x80
	.word 0xdc240011  ! 954: STW_R	stw	%r14, [%r16 + %r17]
	.word 0xaeb40011  ! 956: ORNcc_R	orncc 	%r16, %r17, %r23
	.word 0xc32429da  ! 956: STF_I	st	%f1, [0x09da, %r16]
	.word 0xda242c15  ! 958: STW_I	stw	%r13, [%r16 + 0x0c15]
	.word 0x901c0011  ! 960: XOR_R	xor 	%r16, %r17, %r8
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xe82c0011  ! 961: STB_R	stb	%r20, [%r16 + %r17]
	.word 0xc4d42285  ! 963: LDSHA_I	ldsha	[%r16, + 0x0285] %asi, %r2
	.word 0xf02426e1  ! 965: STW_I	stw	%r24, [%r16 + 0x06e1]
	.word 0x9ac40011  ! 967: ADDCcc_R	addccc 	%r16, %r17, %r13
	.word 0xb8ac2001  ! 967: ANDNcc_I	andncc 	%r16, 0x0001, %r28
	.word 0x96bc2f4d  ! 967: XNORcc_I	xnorcc 	%r16, 0x0f4d, %r11
	.word 0xbef42f15  ! 967: UDIVcc_I	udivcc 	%r16, 0x0f15, %r31
	.word 0x9424225a  ! 968: SUB_I	sub 	%r16, 0x025a, %r10
	.word 0xa86c0011  ! 970: UDIVX_R	udivx 	%r16, %r17, %r20
thr1_irf_ce_61:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_61), 16, 16),1,IRF,ce,64,x, x,x,x, x,x,x)
	.word 0xe62c2a4d  ! 973: STB_I	stb	%r19, [%r16 + 0x0a4d]
	.word 0xb5a01031  ! 975: FsTOx	dis not found

thr1_irf_ce_62:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_62), 16, 16),1,IRF,ce,71,x, x,x,x, x,x,x)
	.word 0xc42c290d  ! 978: STB_I	stb	%r2, [%r16 + 0x090d]
	.word 0x84bc20e3  ! 980: XNORcc_I	xnorcc 	%r16, 0x00e3, %r2
	.word 0xecec2da2  ! 980: LDSTUBA_I	ldstuba	%r22, [%r16 + 0x0da2] %asi
	.word 0x94a42276  ! 981: SUBcc_I	subcc 	%r16, 0x0276, %r10
	.word 0x8f7c2401  ! 983: MOVR_I	move	%r16, 0xfffffff8, %r7
	.word 0x845c2899  ! 983: SMUL_I	smul 	%r16, 0x0899, %r2
	.word 0x98340011  ! 984: SUBC_R	orn 	%r16, %r17, %r12
	.word 0x94ac0011  ! 986: ANDNcc_R	andncc 	%r16, %r17, %r10
	.word 0xba1c25be  ! 986: XOR_I	xor 	%r16, 0x05be, %r29
	.word 0x9b7c0411  ! 986: MOVR_R	move	%r16, %r17, %r13
thr1_resum_intr_13:
!$EV trig_pc_d(1,expr(@VA(.MAIN.thr1_resum_intr_13), 16, 16)) -> intp(1, 3, 1)
	wr      %r0, 0x5, %asr26
	.word 0xc42c2097  ! 988: STB_I	stb	%r2, [%r16 + 0x0097]
thr1_resum_intr_14:
!$EV trig_pc_d(1,expr(@VA(.MAIN.thr1_resum_intr_14), 16, 16)) -> intp(1, 3, 1)
	wr      %r0, 0x5, %asr26
	.word 0xe6340011  ! 991: STH_R	sth	%r19, [%r16 + %r17]
	.word 0x84ac0011  ! 993: ANDNcc_R	andncc 	%r16, %r17, %r2
	.word 0x86bc2f98  ! 993: XNORcc_I	xnorcc 	%r16, 0x0f98, %r3
	.word 0x989c0011  ! 993: XORcc_R	xorcc 	%r16, %r17, %r12
	.word 0xce1c21f2  ! 993: LDD_I	ldd	[%r16 + 0x01f2], %r7
	.word 0x973c1011  ! 994: SRAX_R	srax	%r16, %r17, %r11
	.word 0x9cac273e  ! 996: ANDNcc_I	andncc 	%r16, 0x073e, %r14
	.word 0x82440011  ! 996: ADDC_R	addc 	%r16, %r17, %r1
thr1_resum_intr_15:
!$EV trig_pc_d(1,expr(@VA(.MAIN.thr1_resum_intr_15), 16, 16)) -> intp(1, 3, 1)
	wr      %r0, 0x5, %asr26
	.word 0x84340011  ! 997: SUBC_R	orn 	%r16, %r17, %r2
	.word 0x94c40011  ! 999: ADDCcc_R	addccc 	%r16, %r17, %r10
	.word 0xbb343001  ! 999: SRLX_I	srlx	%r16, 0x0001, %r29
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
        setx  0x00000000000004c0, %g1, %r17
        setx  0x4ffb2a0c1e404338, %g1, %r0
        setx  0xedaebbfaf7d439d4, %g1, %r1
        setx  0x9e7199955bb13729, %g1, %r2
        setx  0x5faf0c786dbce0df, %g1, %r3
        setx  0xa12197f68e6f31ab, %g1, %r4
        setx  0x8119dbdafdc31003, %g1, %r5
        setx  0x2dfbad53e651e1d7, %g1, %r6
        setx  0xe048a576575274ef, %g1, %r7
        setx  0x183b72fb76672672, %g1, %r8
        setx  0x393cded1a7050de6, %g1, %r9
        setx  0x425a5e85f0e911fd, %g1, %r10
        setx  0xb3cf04603068fd5c, %g1, %r11
        setx  0xb3f0efc76524bdc3, %g1, %r12
        setx  0xa55b9a0a945bbf7e, %g1, %r13
        setx  0xee20bb747414dbbd, %g1, %r14
        setx  0x7928e90e445c3c65, %g1, %r15
        setx  0x5853ee36321319c7, %g1, %r18
        setx  0x162ccbb4e5857f19, %g1, %r19
        setx  0xe67c8df953199fee, %g1, %r20
        setx  0x79d61ad01a2c8ffc, %g1, %r21
        setx  0xcd5e6657199ef698, %g1, %r22
        setx  0x2bf0b4349a11c4ef, %g1, %r23
        setx  0xc4ed036aafc14c4d, %g1, %r24
        setx  0xbb9dce889f7ab100, %g1, %r25
        setx  0xdfe1e6e8b98f994f, %g1, %r26
        setx  0xe99c9ae7ccf1b521, %g1, %r27
        setx  0xc793010eae43e3e0, %g1, %r28
        setx  0x32368e3b5cb66faa, %g1, %r29
        setx  0x3697cbbfe491b72d, %g1, %r30
        setx  0xfe1e89abaa909010, %g1, %r31
	save %r0, %r0, %r31
        setx  MAIN_BASE_DATA_VA, %r1, %r16
        setx  0x0000000000000c70, %g1, %r17
        setx  0xb02d45a19fb1c07e, %g1, %r0
        setx  0xa51a65924e3a3b5e, %g1, %r1
        setx  0xe9c0971555d93546, %g1, %r2
        setx  0x0a5b7b3b4425626f, %g1, %r3
        setx  0x392cd2fd4ac538ad, %g1, %r4
        setx  0x1221004ebd287d02, %g1, %r5
        setx  0x2f3da39a25b01e89, %g1, %r6
        setx  0x4188d327746f5aff, %g1, %r7
        setx  0x27f84ce4eeb6db32, %g1, %r8
        setx  0x975d3f113b1bbb7e, %g1, %r9
        setx  0xc941baddad14d37b, %g1, %r10
        setx  0xf88aacc0f32265c6, %g1, %r11
        setx  0xe68bf665094ff4ba, %g1, %r12
        setx  0x20d97a9e7032406b, %g1, %r13
        setx  0x4df34bd496761741, %g1, %r14
        setx  0x6920277a5d94055c, %g1, %r15
        setx  0x3cb663689098ac00, %g1, %r18
        setx  0xf6f5bdc2d5adf80c, %g1, %r19
        setx  0xdc32b9073792a390, %g1, %r20
        setx  0x579b1553d95451f6, %g1, %r21
        setx  0xd82700b7c5dc4f48, %g1, %r22
        setx  0xb949ecd79e599d32, %g1, %r23
        setx  0xd43ddf800f8ebb64, %g1, %r24
        setx  0xdfa68baee1ab62b6, %g1, %r25
        setx  0x6d735f42716248aa, %g1, %r26
        setx  0x4e84f488fc0e8567, %g1, %r27
        setx  0x47ad1d13bc1b34b5, %g1, %r28
        setx  0x0c82b5d23c516201, %g1, %r29
        setx  0x936cda78deb365e7, %g1, %r30
        setx  0xe4a4c87bb35905c9, %g1, %r31
	save %r0, %r0, %r31
        setx  MAIN_BASE_DATA_VA, %r1, %r16
        setx  0x0000000000000070, %g1, %r17
        setx  0xc3441dc7e5183ad7, %g1, %r0
        setx  0xf369e9561577d6c9, %g1, %r1
        setx  0x7072eba3999094de, %g1, %r2
        setx  0x2a9bb70c72b4330d, %g1, %r3
        setx  0xf861a4a875fdd2d1, %g1, %r4
        setx  0xf4afb1b3aff98f35, %g1, %r5
        setx  0x9aff3901aff3e00a, %g1, %r6
        setx  0x8664c1f098ea9aae, %g1, %r7
        setx  0x6bfaba0ebb5921ba, %g1, %r8
        setx  0xf7469ba34cdca428, %g1, %r9
        setx  0x86607e01ebfe38fa, %g1, %r10
        setx  0xa14388a85ccc3005, %g1, %r11
        setx  0xfd85d38764dc8e3a, %g1, %r12
        setx  0x0dcefa1638ada33f, %g1, %r13
        setx  0xbcc295d156b9fdac, %g1, %r14
        setx  0x4d07771aae5fdde0, %g1, %r15
        setx  0xdffffd20b359a283, %g1, %r18
        setx  0x876dd71072f92814, %g1, %r19
        setx  0x20f692add555357d, %g1, %r20
        setx  0xdf232bf5303b7212, %g1, %r21
        setx  0x18efd62a5a056e68, %g1, %r22
        setx  0xc752e3f68b7b3af0, %g1, %r23
        setx  0xf718196b1f4f6741, %g1, %r24
        setx  0x3d7d8f89f8b59ea2, %g1, %r25
        setx  0xc391960f5d415c41, %g1, %r26
        setx  0x0740ad890ed6a460, %g1, %r27
        setx  0xa6565ffd55c301bb, %g1, %r28
        setx  0xcc61313d0e047548, %g1, %r29
        setx  0x7621964f3f880d4b, %g1, %r30
        setx  0xcca09a95bb124081, %g1, %r31
	save %r0, %r0, %r31
        setx  MAIN_BASE_DATA_VA, %r1, %r16
        setx  0x0000000000000b10, %g1, %r17
        setx  0xe67cf94357873eb2, %g1, %r0
        setx  0xbf4dc2d27f69ce83, %g1, %r1
        setx  0x3e929650e55b964e, %g1, %r2
        setx  0xe17c8918ba0da938, %g1, %r3
        setx  0xe8860b5b50b5cdb7, %g1, %r4
        setx  0xb1718b7c4a6f0f07, %g1, %r5
        setx  0xd5955d3426fff972, %g1, %r6
        setx  0x1e0c152229de4e7c, %g1, %r7
        setx  0xf8aa538330708928, %g1, %r8
        setx  0xb0ee6d37c440ab9c, %g1, %r9
        setx  0xc3fddcf03813d304, %g1, %r10
        setx  0xefa1714eaecd17b7, %g1, %r11
        setx  0xf35f053c8f55457d, %g1, %r12
        setx  0x027c6187c7c17900, %g1, %r13
        setx  0xa977232dec98fa9d, %g1, %r14
        setx  0xb3dda37940fe359b, %g1, %r15
        setx  0xad7ea57c3681f4c3, %g1, %r18
        setx  0x5852a08d6777473e, %g1, %r19
        setx  0x002773704799322d, %g1, %r20
        setx  0x3e0a075d8cd1d896, %g1, %r21
        setx  0x99249024e1599a08, %g1, %r22
        setx  0x14a88ce61f10ff9d, %g1, %r23
        setx  0x1a1b791907fda1db, %g1, %r24
        setx  0x42672802878cad32, %g1, %r25
        setx  0xff9969db4961487a, %g1, %r26
        setx  0xb60aa6b9796e78fe, %g1, %r27
        setx  0xbd7a267ce70676ce, %g1, %r28
        setx  0xf2feea5270ca4cd1, %g1, %r29
        setx  0xa0e74a17c7adf93d, %g1, %r30
        setx  0xab8d08855a98b50b, %g1, %r31
	save %r0, %r0, %r31
        setx  MAIN_BASE_DATA_VA, %r1, %r16
        setx  0x0000000000000c20, %g1, %r17
        setx  0x12a7e591c5317e85, %g1, %r0
        setx  0xe74502f0bdd79eff, %g1, %r1
        setx  0x3e615592bfb0da6c, %g1, %r2
        setx  0xab2f55d5a937d54c, %g1, %r3
        setx  0x65163c73dfabec2c, %g1, %r4
        setx  0xda6a5fdccb017f2c, %g1, %r5
        setx  0xc50d31e133c07e02, %g1, %r6
        setx  0xe43d73fe9125b711, %g1, %r7
        setx  0x28a3038bb05d02dc, %g1, %r8
        setx  0x7c982afe272cdea4, %g1, %r9
        setx  0x329e61cd747f3999, %g1, %r10
        setx  0xa0a41f8d0990518d, %g1, %r11
        setx  0x9704402df6a2df57, %g1, %r12
        setx  0x6df3009860c71416, %g1, %r13
        setx  0xadfcbacf868772bd, %g1, %r14
        setx  0x90fc42c0a033237d, %g1, %r15
        setx  0x61484540c1d9daa5, %g1, %r18
        setx  0xc124fd95c13f39c7, %g1, %r19
        setx  0xa8bfa4bef7f249d1, %g1, %r20
        setx  0x57a074a5c0790bab, %g1, %r21
        setx  0xde7afd462bfef103, %g1, %r22
        setx  0xe9c61bbba2bd4622, %g1, %r23
        setx  0x14a41bdb1314ce9b, %g1, %r24
        setx  0xa5cae41263ff8671, %g1, %r25
        setx  0xceaafbf1171fd1af, %g1, %r26
        setx  0xae97420d5c03ee88, %g1, %r27
        setx  0x0c1a4df2d8387875, %g1, %r28
        setx  0x05005c650c279618, %g1, %r29
        setx  0x442675c3cce39dad, %g1, %r30
        setx  0x4b12e60057c6a6b0, %g1, %r31
	save %r0, %r0, %r31
        setx  MAIN_BASE_DATA_VA, %r1, %r16
        setx  0x00000000000009a0, %g1, %r17
        setx  0x702abca00720aab4, %g1, %r0
        setx  0x6b1608c3ecf60f1e, %g1, %r1
        setx  0xb6112d708fdda27b, %g1, %r2
        setx  0x1bca541ef43e111b, %g1, %r3
        setx  0x2610dedbc2ae509e, %g1, %r4
        setx  0xdf986a6ce591eb8f, %g1, %r5
        setx  0x0fac1ee4d9738712, %g1, %r6
        setx  0xc7e382ab21bcbeb3, %g1, %r7
        setx  0x3b873c8c9bb7364c, %g1, %r8
        setx  0x130c96c999a5be32, %g1, %r9
        setx  0x417bc24ef186734b, %g1, %r10
        setx  0x9fb91a3587bc2910, %g1, %r11
        setx  0x72a4c3d77d6e800c, %g1, %r12
        setx  0x68183aff7da43d72, %g1, %r13
        setx  0x3e5abe8c1331c15c, %g1, %r14
        setx  0xeb5eb46692903188, %g1, %r15
        setx  0x7c53eef45f4f4053, %g1, %r18
        setx  0x01af44cbb10dbe63, %g1, %r19
        setx  0x9c02e5661254ed4e, %g1, %r20
        setx  0x67b1b5afd82aa339, %g1, %r21
        setx  0xdfd323025ad6d921, %g1, %r22
        setx  0x251dc29aaf3f860d, %g1, %r23
        setx  0x5855cf5cee974d1b, %g1, %r24
        setx  0x21c7f7fc614b2480, %g1, %r25
        setx  0x24f874e059d8638b, %g1, %r26
        setx  0x4a99646261084a2f, %g1, %r27
        setx  0x4531c44b60439553, %g1, %r28
        setx  0x797bb0a87d602f41, %g1, %r29
        setx  0xc8e6c039fd8f315a, %g1, %r30
        setx  0x613aaeb456ba7b01, %g1, %r31
	save %r0, %r0, %r31
        setx  MAIN_BASE_DATA_VA, %r1, %r16
        setx  0x0000000000000490, %g1, %r17
        setx  0x7ea248a7101e8766, %g1, %r0
        setx  0x0c5aeb240697ce46, %g1, %r1
        setx  0x0ebca2be663cb008, %g1, %r2
        setx  0x4009b06b3742876a, %g1, %r3
        setx  0x7a1613a79e97db2b, %g1, %r4
        setx  0x7d77c42c086b305c, %g1, %r5
        setx  0x344716d441da435c, %g1, %r6
        setx  0xe76933366a086116, %g1, %r7
        setx  0x805f0a3cb7144324, %g1, %r8
        setx  0x4bf5f612d941bf9e, %g1, %r9
        setx  0xe103919cd343e437, %g1, %r10
        setx  0x703964123b129166, %g1, %r11
        setx  0xe2a17771d39ea03b, %g1, %r12
        setx  0x0962672473a98635, %g1, %r13
        setx  0xb77d081f7a799d57, %g1, %r14
        setx  0xc8a4602dcc8234a9, %g1, %r15
        setx  0x3342704a157d85e1, %g1, %r18
        setx  0xc468182155cc6fc2, %g1, %r19
        setx  0xedecfccf32e9dd70, %g1, %r20
        setx  0x92865d2951afb025, %g1, %r21
        setx  0x3325d283c1f5012f, %g1, %r22
        setx  0xfb9d84993ecdcb80, %g1, %r23
        setx  0xd6b951723b16fe3c, %g1, %r24
        setx  0xc103276b508db298, %g1, %r25
        setx  0x99ad11cdc02f2ea5, %g1, %r26
        setx  0xdbc7c8426f678572, %g1, %r27
        setx  0x342b67e8d0567910, %g1, %r28
        setx  0x61f2e058219f4868, %g1, %r29
        setx  0xbaef851260134d40, %g1, %r30
        setx  0xc7a3dcf36a90ffb6, %g1, %r31
	save %r0, %r0, %r31
        setx  MAIN_BASE_DATA_VA, %r1, %r16
        setx  0x0000000000000eb0, %g1, %r17
        setx  0x6c8cc834e323ccab, %g1, %r0
        setx  0x38d87b4d479ba69f, %g1, %r1
        setx  0xf3f6003346cd68c4, %g1, %r2
        setx  0x849aa0d2403cb872, %g1, %r3
        setx  0xf8aec0802f064522, %g1, %r4
        setx  0x5e2bf1020f16580d, %g1, %r5
        setx  0xddad72f9494642a9, %g1, %r6
        setx  0x1adbb65b02100c22, %g1, %r7
        setx  0x509a9d9393c784cc, %g1, %r8
        setx  0x10b8b4538ea91f4f, %g1, %r9
        setx  0xd190a97a5f222e4d, %g1, %r10
        setx  0x35f0c8b97e41be01, %g1, %r11
        setx  0x340646d6a57d2c7d, %g1, %r12
        setx  0x13793a3a2b6fb666, %g1, %r13
        setx  0x31d038703fca1f77, %g1, %r14
        setx  0xea7a8bc437921538, %g1, %r15
        setx  0x4647347377f68e83, %g1, %r18
        setx  0x4f6e4f2446f495ed, %g1, %r19
        setx  0xf6ff68be66da1529, %g1, %r20
        setx  0x172a5b3ca3eb14f5, %g1, %r21
        setx  0xd96991c51ab3d8a7, %g1, %r22
        setx  0x0433261d10cfe397, %g1, %r23
        setx  0x08ca990f20b76a91, %g1, %r24
        setx  0x1fc6e6afa5ab7399, %g1, %r25
        setx  0xe3554e279e7ad63b, %g1, %r26
        setx  0x4df5544cdaa1cbbc, %g1, %r27
        setx  0x47dca95782d341de, %g1, %r28
        setx  0xd5b940fa65d43a67, %g1, %r29
        setx  0x118b6f6b762f2bb3, %g1, %r30
        setx  0x63116dcabdfd18a6, %g1, %r31
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
	.word 0xce342c4f  ! 1: STH_I	sth	%r7, [%r16 + 0x0c4f]
	.word 0x9a840011  ! 3: ADDcc_R	addcc 	%r16, %r17, %r13
	.word 0x8b643801  ! 3: MOVcc_I	<illegal instruction>
	.word 0x988421cd  ! 3: ADDcc_I	addcc 	%r16, 0x01cd, %r12
	.word 0xb25c212e  ! 3: SMUL_I	smul 	%r16, 0x012e, %r25
	.word 0xf2242e77  ! 5: STW_I	stw	%r25, [%r16 + 0x0e77]
	.word 0x40000001  ! 7: CALL	call	disp30_1
	.word 0x9a040011  ! 8: ADD_R	add 	%r16, %r17, %r13
	.word 0xa41c0011  ! 10: XOR_R	xor 	%r16, %r17, %r18
	.word 0xc36c0011  ! 10: PREFETCH_R	prefetch	[%r16 + %r17], #one_read
	.word 0xe43420f5  ! 12: STH_I	sth	%r18, [%r16 + 0x00f5]
	.word 0x92b4220b  ! 14: ORNcc_I	orncc 	%r16, 0x020b, %r9
	.word 0xacb40011  ! 14: ORNcc_R	orncc 	%r16, %r17, %r22
	.word 0xf67c29a3  ! 14: SWAP_I	swap	%r27, [%r16 + 0x09a3]
thr0_irf_ce_0:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_0), 16, 16),1,IRF,ce,13,x, x,x,x, x,x,x)
	.word 0xf62c2fcb  ! 17: STB_I	stb	%r27, [%r16 + 0x0fcb]
	.word 0xb93c0011  ! 19: SRA_R	sra 	%r16, %r17, %r28
	.word 0x8a842927  ! 19: ADDcc_I	addcc 	%r16, 0x0927, %r5
	.word 0xa57c0411  ! 19: MOVR_R	move	%r16, %r17, %r18
	.word 0xd29c2fcf  ! 19: LDDA_I	ldda	[%r16, + 0x0fcf] %asi, %r9
	.word 0xd42c0011  ! 20: STB_R	stb	%r10, [%r16 + %r17]
	.word 0x96940011  ! 22: ORcc_R	orcc 	%r16, %r17, %r11
	.word 0x81580000  ! 22: FLUSHW	flushw
	.word 0xd63420ef  ! 24: STH_I	sth	%r11, [%r16 + 0x00ef]
	.word 0x9b340011  ! 26: SRL_R	srl 	%r16, %r17, %r13
        wr %g0, 0x4, %fprs
	.word 0xc2340011  ! 27: STH_R	sth	%r1, [%r16 + %r17]
	.word 0x96b42a9b  ! 29: ORNcc_I	orncc 	%r16, 0x0a9b, %r11
	.word 0x8e3c0011  ! 29: XNOR_R	xnor 	%r16, %r17, %r7
	.word 0x845c2c4b  ! 29: SMUL_I	smul 	%r16, 0x0c4b, %r2
	.word 0xe8740011  ! 30: STX_R	stx	%r20, [%r16 + %r17]
	.word 0x02800003  ! 32: BE	be  	<label_0x3>
	.word 0xe6240011  ! 33: STW_R	stw	%r19, [%r16 + %r17]
	.word 0xbf643801  ! 35: MOVcc_I	<illegal instruction>
	.word 0x81880000  ! 35: RESTORED	saved
	.word 0x8f2c0011  ! 36: SLL_R	sll 	%r16, %r17, %r7
	.word 0xc2042698  ! 38: LDUW_I	lduw	[%r16 + 0x0698], %r1
thr0_irf_ce_1:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_1), 16, 16),1,IRF,ce,70,x, x,x,x, x,x,x)
	.word 0xc2242397  ! 41: STW_I	stw	%r1, [%r16 + 0x0397]
	.word 0xaaac26b6  ! 43: ANDNcc_I	andncc 	%r16, 0x06b6, %r21
	.word 0xac042638  ! 43: ADD_I	add 	%r16, 0x0638, %r22
	.word 0xbc9c0011  ! 43: XORcc_R	xorcc 	%r16, %r17, %r30
	.word 0xb5a00551  ! 43: FSQRTd	fsqrt	
	.word 0xf42c2c1f  ! 45: STB_I	stb	%r26, [%r16 + 0x0c1f]
	.word 0x3c800001  ! 47: BPOS	bpos,a	<label_0x1>
thr0_irf_ce_2:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_2), 16, 16),1,IRF,ce,46,x, x,x,x, x,x,x)
	.word 0xf4342acd  ! 50: STH_I	sth	%r26, [%r16 + 0x0acd]
	.word 0xa8140011  ! 52: OR_R	or 	%r16, %r17, %r20
	.word 0xc4fc204f  ! 52: SWAPA_I	swapa	%r2, [%r16 + 0x004f] %asi
	.word 0xc42c2db5  ! 54: STB_I	stb	%r2, [%r16 + 0x0db5]
	.word 0x828c0011  ! 56: ANDcc_R	andcc 	%r16, %r17, %r1
	.word 0xb4840011  ! 56: ADDcc_R	addcc 	%r16, %r17, %r26
	.word 0xa72c0011  ! 56: SLL_R	sll 	%r16, %r17, %r19
	.word 0x86740011  ! 56: UDIV_R	udiv 	%r16, %r17, %r3
	.word 0x912c1011  ! 57: SLLX_R	sllx	%r16, %r17, %r8
	.word 0xb57c2401  ! 59: MOVR_I	move	%r16, 0xfffffff8, %r26
	.word 0x832c2001  ! 59: SLL_I	sll 	%r16, 0x0001, %r1
	.word 0xcc9c1011  ! 59: LDDA_R	ldda	[%r16, %r17] 0x80, %r6
	.word 0xb7342001  ! 60: SRL_I	srl 	%r16, 0x0001, %r27
	.word 0xac142ba1  ! 62: OR_I	or 	%r16, 0x0ba1, %r22
	.word 0x888c0011  ! 62: ANDcc_R	andcc 	%r16, %r17, %r4
	.word 0xa7e40011  ! 62: SAVE_R	save	%r16, %r17, %r19
	.word 0xe6242ebb  ! 64: STW_I	stw	%r19, [%r16 + 0x0ebb]
	.word 0xa7643801  ! 66: MOVcc_I	<illegal instruction>
	.word 0xb9343001  ! 66: SRLX_I	srlx	%r16, 0x0001, %r28
	.word 0x93484000  ! 66: RDHPR_HTSTATE	rdhpr	%htstate, %r9
	.word 0x8ea40011  ! 67: SUBcc_R	subcc 	%r16, %r17, %r7
	.word 0xb4040011  ! 69: ADD_R	add 	%r16, %r17, %r26
	.word 0xb61c0011  ! 69: XOR_R	xor 	%r16, %r17, %r27
	.word 0x969c0011  ! 69: XORcc_R	xorcc 	%r16, %r17, %r11
	.word 0x81880000  ! 69: SAVED	saved
	.word 0xd624256d  ! 71: STW_I	stw	%r11, [%r16 + 0x056d]
	.word 0xbe2c26c4  ! 73: ANDN_I	andn 	%r16, 0x06c4, %r31
	.word 0x9e342a0e  ! 73: ORN_I	orn 	%r16, 0x0a0e, %r15
	.word 0x9f2c2001  ! 73: SLL_I	sll 	%r16, 0x0001, %r15
	.word 0xc36c0011  ! 73: PREFETCH_R	prefetch	[%r16 + %r17], #one_read
	.word 0xec240011  ! 74: STW_R	stw	%r22, [%r16 + %r17]
	.word 0xb8b40011  ! 76: ORNcc_R	orncc 	%r16, %r17, %r28
	.word 0xd69c1011  ! 76: LDDA_R	ldda	[%r16, %r17] 0x80, %r11
	.word 0xd6742c2d  ! 78: STX_I	stx	%r11, [%r16 + 0x0c2d]
	.word 0x0e800001  ! 80: BVS	bvs  	<label_0x1>
thr0_irf_ce_3:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_3), 16, 16),1,IRF,ce,64,x, x,x,x, x,x,x)
	.word 0xd6742c5f  ! 83: STX_I	stx	%r11, [%r16 + 0x0c5f]
	.word 0x91641811  ! 85: MOVcc_R	<illegal instruction>
	.word 0xa6c4219b  ! 85: ADDCcc_I	addccc 	%r16, 0x019b, %r19
	.word 0x8143c000  ! 85: STBAR	stbar
	.word 0xee2c0011  ! 86: STB_R	stb	%r23, [%r16 + %r17]
	.word 0x9b341011  ! 88: SRLX_R	srlx	%r16, %r17, %r13
	.word 0x8143c000  ! 88: STBAR	stbar
	.word 0xca240011  ! 89: STW_R	stw	%r5, [%r16 + %r17]
	.word 0x88b40011  ! 91: ORNcc_R	orncc 	%r16, %r17, %r4
	.word 0xc3ec1011  ! 91: PREFETCHA_R	prefetcha	[%r16, %r17] 0x80, #one_read
	.word 0xc82c239d  ! 93: STB_I	stb	%r4, [%r16 + 0x039d]
	.word 0x9e740011  ! 95: UDIV_R	udiv 	%r16, %r17, %r15
	.word 0xca2c0011  ! 96: STB_R	stb	%r5, [%r16 + %r17]
	.word 0xc2942397  ! 98: LDUHA_I	lduha	[%r16, + 0x0397] %asi, %r1
	.word 0x9f641811  ! 99: MOVcc_R	<illegal instruction>
	.word 0x8e8c0011  ! 101: ANDcc_R	andcc 	%r16, %r17, %r7
	.word 0x88bc27d4  ! 101: XNORcc_I	xnorcc 	%r16, 0x07d4, %r4
	.word 0x8b500000  ! 101: RDPR_TPC	rdpr	%tpc, %r5
thr0_irf_ce_4:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_4), 16, 16),1,IRF,ce,55,x, x,x,x, x,x,x)
	.word 0xca2c20b9  ! 104: STB_I	stb	%r5, [%r16 + 0x00b9]
	.word 0x9e9c20c3  ! 106: XORcc_I	xorcc 	%r16, 0x00c3, %r15
	.word 0xb2840011  ! 106: ADDcc_R	addcc 	%r16, %r17, %r25
	.word 0x9cac2b49  ! 106: ANDNcc_I	andncc 	%r16, 0x0b49, %r14
	.word 0x12800001  ! 106: BNE	bne  	<label_0x1>
	.word 0x8d3c0011  ! 107: SRA_R	sra 	%r16, %r17, %r6
thr0_resum_intr_0:
!$EV trig_pc_d(0,expr(@VA(.MAIN.thr0_resum_intr_0), 16, 16)) -> intp(0, 3, 1)
	wr      %r0, 0x5, %asr26
thr0_irf_ce_5:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_5), 16, 16),1,IRF,ce,8,x, x,x,x, x,x,x)
	.word 0xcc342739  ! 112: STH_I	sth	%r6, [%r16 + 0x0739]
	.word 0x98140011  ! 114: OR_R	or 	%r16, %r17, %r12
	.word 0xb2340011  ! 114: ORN_R	orn 	%r16, %r17, %r25
	.word 0x98342a29  ! 114: ORN_I	orn 	%r16, 0x0a29, %r12
        wr %g0, 0x4, %fprs
	.word 0xd824239b  ! 116: STW_I	stw	%r12, [%r16 + 0x039b]
	.word 0x9e0c270d  ! 118: AND_I	and 	%r16, 0x070d, %r15
	.word 0xa7242a24  ! 118: MULScc_I	mulscc 	%r16, 0x0a24, %r19
thr0_irf_ce_6:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_6), 16, 16),1,IRF,ce,70,x, x,x,x, x,x,x)
	.word 0xe62c2dc9  ! 121: STB_I	stb	%r19, [%r16 + 0x0dc9]
	.word 0x04c40001  ! 123: BRLEZ	brlez  ,nt	%16,<label_0x40001>
	.word 0xde240011  ! 124: STW_R	stw	%r15, [%r16 + %r17]
	.word 0x943c0011  ! 126: XNOR_R	xnor 	%r16, %r17, %r10
	.word 0x84840011  ! 126: ADDcc_R	addcc 	%r16, %r17, %r2
	.word 0xc3e42011  ! 126: CASA_R	casa	[%r16] %asi, %r17, %r1
	.word 0xda340011  ! 127: STH_R	sth	%r13, [%r16 + %r17]
	.word 0x8ec40011  ! 129: ADDCcc_R	addccc 	%r16, %r17, %r7
	.word 0x3e800001  ! 129: BVC	bvc,a	<label_0x1>
	.word 0x96240011  ! 130: SUB_R	sub 	%r16, %r17, %r11
	.word 0xab340011  ! 132: SRL_R	srl 	%r16, %r17, %r21
	.word 0x8f7c2401  ! 132: MOVR_I	move	%r16, 0xfffffff8, %r7
	.word 0xc2cc1011  ! 132: LDSBA_R	ldsba	[%r16, %r17] 0x80, %r1
	.word 0x8d340011  ! 133: SRL_R	srl 	%r16, %r17, %r6
	.word 0xb4340011  ! 135: ORN_R	orn 	%r16, %r17, %r26
	.word 0xbc8c0011  ! 135: ANDcc_R	andcc 	%r16, %r17, %r30
	.word 0x8c1c29c1  ! 135: XOR_I	xor 	%r16, 0x09c1, %r6
	.word 0x82dc2b66  ! 135: SMULcc_I	smulcc 	%r16, 0x0b66, %r1
	.word 0xbac4278f  ! 136: ADDCcc_I	addccc 	%r16, 0x078f, %r29
	.word 0xbc840011  ! 138: ADDcc_R	addcc 	%r16, %r17, %r30
	.word 0x8e04219c  ! 138: ADD_I	add 	%r16, 0x019c, %r7
	.word 0xaa0c0011  ! 138: AND_R	and 	%r16, %r17, %r21
	.word 0xeeb42488  ! 138: STHA_I	stha	%r23, [%r16 + 0x0488] %asi
	.word 0xb00c2329  ! 139: AND_I	and 	%r16, 0x0329, %r24
	.word 0x8eb42dca  ! 141: ORNcc_I	orncc 	%r16, 0x0dca, %r7
	.word 0x81580000  ! 141: FLUSHW	flushw
thr0_irf_ce_7:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_7), 16, 16),1,IRF,ce,52,x, x,x,x, x,x,x)
	.word 0xce242001  ! 144: STW_I	stw	%r7, [%r16 + 0x0001]
	.word 0xecec282e  ! 146: LDSTUBA_I	ldstuba	%r22, [%r16 + 0x082e] %asi
	.word 0x860420c3  ! 147: ADD_I	add 	%r16, 0x00c3, %r3
	.word 0xbc1c0011  ! 149: XOR_R	xor 	%r16, %r17, %r30
	.word 0x87524000  ! 149: RDPR_CWP	<illegal instruction>
thr0_irf_ce_8:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_8), 16, 16),1,IRF,ce,27,x, x,x,x, x,x,x)
	.word 0xc62c2e47  ! 152: STB_I	stb	%r3, [%r16 + 0x0e47]
	.word 0x9d2c1011  ! 154: SLLX_R	sllx	%r16, %r17, %r14
	.word 0x81dc0011  ! 154: FLUSH_R	dis not found

thr0_irf_ce_9:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_9), 16, 16),1,IRF,ce,52,x, x,x,x, x,x,x)
	.word 0xdc242189  ! 157: STW_I	stw	%r14, [%r16 + 0x0189]
	ta	T_CHANGE_HPRIV	! macro
	.word 0xdc2c0011  ! 160: STB_R	stb	%r14, [%r16 + %r17]
	.word 0x9e940011  ! 162: ORcc_R	orcc 	%r16, %r17, %r15
	.word 0x87342001  ! 162: SRL_I	srl 	%r16, 0x0001, %r3
	.word 0x97343001  ! 162: SRLX_I	srlx	%r16, 0x0001, %r11
	.word 0xc3ec1011  ! 162: PREFETCHA_R	prefetcha	[%r16, %r17] 0x80, #one_read
	.word 0xb3342001  ! 163: SRL_I	srl 	%r16, 0x0001, %r25
	ta	T_CHANGE_HPRIV	! macro
	.word 0xc2740011  ! 166: STX_R	stx	%r1, [%r16 + %r17]
	.word 0x81dc2bf1  ! 168: FLUSH_I	dis not found

thr0_irf_ce_10:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_10), 16, 16),1,IRF,ce,50,x, x,x,x, x,x,x)
	.word 0xc2342edb  ! 171: STH_I	sth	%r1, [%r16 + 0x0edb]
	.word 0x8d641811  ! 173: MOVcc_R	<illegal instruction>
	.word 0xab2c0011  ! 173: SLL_R	sll 	%r16, %r17, %r21
	.word 0x9a0c0011  ! 173: AND_R	and 	%r16, %r17, %r13
	.word 0xeefc1011  ! 173: SWAPA_R	swapa	%r23, [%r16 + %r17] 0x80
thr0_irf_ce_11:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_11), 16, 16),1,IRF,ce,55,x, x,x,x, x,x,x)
	.word 0xee742327  ! 176: STX_I	stx	%r23, [%r16 + 0x0327]
	.word 0xbc040011  ! 178: ADD_R	add 	%r16, %r17, %r30
	.word 0x98bc257e  ! 178: XNORcc_I	xnorcc 	%r16, 0x057e, %r12
	.word 0x8a8c0011  ! 178: ANDcc_R	andcc 	%r16, %r17, %r5
	.word 0xfeec24f5  ! 178: LDSTUBA_I	ldstuba	%r31, [%r16 + 0x04f5] %asi
	.word 0xfe742ca9  ! 180: STX_I	stx	%r31, [%r16 + 0x0ca9]
	.word 0xc3ec1011  ! 182: PREFETCHA_R	prefetcha	[%r16, %r17] 0x80, #one_read
	.word 0x8e042973  ! 183: ADD_I	add 	%r16, 0x0973, %r7
	.word 0xc3ec1011  ! 185: PREFETCHA_R	prefetcha	[%r16, %r17] 0x80, #one_read
	.word 0xce2c2439  ! 187: STB_I	stb	%r7, [%r16 + 0x0439]
	.word 0x9f3c2001  ! 189: SRA_I	sra 	%r16, 0x0001, %r15
	.word 0x96b42267  ! 189: ORNcc_I	orncc 	%r16, 0x0267, %r11
	.word 0xbf341011  ! 189: SRLX_R	srlx	%r16, %r17, %r31
	.word 0x81580000  ! 189: FLUSHW	flushw
	.word 0xfe242a95  ! 191: STW_I	stw	%r31, [%r16 + 0x0a95]
	.word 0x9ab429aa  ! 193: ORNcc_I	orncc 	%r16, 0x09aa, %r13
	.word 0x888c2e28  ! 193: ANDcc_I	andcc 	%r16, 0x0e28, %r4
	.word 0x9d342001  ! 193: SRL_I	srl 	%r16, 0x0001, %r14
	.word 0x8143c000  ! 193: STBAR	stbar
	.word 0xdc242f35  ! 195: STW_I	stw	%r14, [%r16 + 0x0f35]
	.word 0x81880000  ! 197: SAVED	saved
	.word 0xdc342011  ! 199: STH_I	sth	%r14, [%r16 + 0x0011]
	.word 0x832c1011  ! 201: SLLX_R	sllx	%r16, %r17, %r1
	.word 0x922c2c64  ! 201: ANDN_I	andn 	%r16, 0x0c64, %r9
	.word 0x968c0011  ! 201: ANDcc_R	andcc 	%r16, %r17, %r11
thr0_resum_intr_1:
!$EV trig_pc_d(0,expr(@VA(.MAIN.thr0_resum_intr_1), 16, 16)) -> intp(0, 3, 1)
	wr      %r0, 0x5, %asr26
	.word 0xd6742717  ! 203: STX_I	stx	%r11, [%r16 + 0x0717]
	.word 0xae3c2088  ! 205: XNOR_I	xnor 	%r16, 0x0088, %r23
	.word 0x89ec0011  ! 205: RESTORE_R	restore	%r16, %r17, %r4
	.word 0xc6740011  ! 206: STX_R	stx	%r3, [%r16 + %r17]
	.word 0x988c0011  ! 208: ANDcc_R	andcc 	%r16, %r17, %r12
	.word 0xb4842c0a  ! 208: ADDcc_I	addcc 	%r16, 0x0c0a, %r26
	.word 0xad343001  ! 208: SRLX_I	srlx	%r16, 0x0001, %r22
thr0_resum_intr_2:
!$EV trig_pc_d(0,expr(@VA(.MAIN.thr0_resum_intr_2), 16, 16)) -> intp(0, 3, 1)
	wr      %r0, 0x5, %asr26
	.word 0x8c3c0011  ! 209: XNOR_R	xnor 	%r16, %r17, %r6
	ta	T_CHANGE_HPRIV	! macro
	.word 0xbf341011  ! 212: SRLX_R	srlx	%r16, %r17, %r31
	.word 0xa6840011  ! 214: ADDcc_R	addcc 	%r16, %r17, %r19
	.word 0x86bc0011  ! 214: XNORcc_R	xnorcc 	%r16, %r17, %r3
        wr %g0, 0x4, %fprs
	.word 0x9e1c242a  ! 215: XOR_I	xor 	%r16, 0x042a, %r15
	.word 0xd53c21d5  ! 217: STDF_I	std	%f10, [0x01d5, %r16]
	.word 0xa4bc0011  ! 218: XNORcc_R	xnorcc 	%r16, %r17, %r18
	.word 0xb93c2001  ! 220: SRA_I	sra 	%r16, 0x0001, %r28
	.word 0x8143e051  ! 220: MEMBAR	membar	#LoadLoad | #Lookaside | #Sync 
	.word 0xf8342f8b  ! 222: STH_I	sth	%r28, [%r16 + 0x0f8b]
	.word 0x8143e023  ! 224: MEMBAR	membar	#LoadLoad | #StoreLoad | #MemIssue 
	.word 0xf82c249b  ! 226: STB_I	stb	%r28, [%r16 + 0x049b]
	.word 0x9cc42c36  ! 228: ADDCcc_I	addccc 	%r16, 0x0c36, %r14
	.word 0xbd3c1011  ! 228: SRAX_R	srax	%r16, %r17, %r30
	.word 0x9fe40011  ! 228: SAVE_R	save	%r16, %r17, %r15
	.word 0xde242cc7  ! 230: STW_I	stw	%r15, [%r16 + 0x0cc7]
	.word 0x40000001  ! 232: CALL	call	disp30_1
	.word 0xce2c0011  ! 233: STB_R	stb	%r7, [%r16 + %r17]
	.word 0xacc40011  ! 235: ADDCcc_R	addccc 	%r16, %r17, %r22
	.word 0x8143c000  ! 235: STBAR	stbar
	.word 0xec24204b  ! 237: STW_I	stw	%r22, [%r16 + 0x004b]
	.word 0xb23c2f48  ! 239: XNOR_I	xnor 	%r16, 0x0f48, %r25
	.word 0x81840011  ! 239: WRY_R	wr	%r16, %r17, %y
thr0_irf_ce_12:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_12), 16, 16),1,IRF,ce,44,x, x,x,x, x,x,x)
	.word 0xf2342a29  ! 242: STH_I	sth	%r25, [%r16 + 0x0a29]
	.word 0xa8bc2fb7  ! 244: XNORcc_I	xnorcc 	%r16, 0x0fb7, %r20
	.word 0x81580000  ! 244: FLUSHW	flushw
thr0_irf_ce_13:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_13), 16, 16),1,IRF,ce,9,x, x,x,x, x,x,x)
	.word 0xe82c2c9d  ! 247: STB_I	stb	%r20, [%r16 + 0x0c9d]
	.word 0x905c0011  ! 249: SMUL_R	smul 	%r16, %r17, %r8
thr0_irf_ce_14:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_14), 16, 16),1,IRF,ce,58,x, x,x,x, x,x,x)
	.word 0xd0242b5f  ! 252: STW_I	stw	%r8, [%r16 + 0x0b5f]
	.word 0x98940011  ! 254: ORcc_R	orcc 	%r16, %r17, %r12
	.word 0x8143c000  ! 254: STBAR	stbar
	.word 0x84842576  ! 255: ADDcc_I	addcc 	%r16, 0x0576, %r2
	.word 0x8cbc0011  ! 257: XNORcc_R	xnorcc 	%r16, %r17, %r6
	.word 0xc9e42011  ! 257: CASA_R	casa	[%r16] %asi, %r17, %r4
thr0_irf_ce_15:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_15), 16, 16),1,IRF,ce,48,x, x,x,x, x,x,x)
	.word 0xc8242609  ! 260: STW_I	stw	%r4, [%r16 + 0x0609]
	.word 0xb83c2517  ! 262: XNOR_I	xnor 	%r16, 0x0517, %r28
	.word 0x8ab42e85  ! 262: ORNcc_I	orncc 	%r16, 0x0e85, %r5
	.word 0xacac0011  ! 262: ANDNcc_R	andncc 	%r16, %r17, %r22
        wr %g0, 0x4, %fprs
thr0_irf_ce_16:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_16), 16, 16),1,IRF,ce,47,x, x,x,x, x,x,x)
	.word 0xec242f1f  ! 265: STW_I	stw	%r22, [%r16 + 0x0f1f]
	.word 0x872c3001  ! 267: SLLX_I	sllx	%r16, 0x0001, %r3
	.word 0x9e2c0011  ! 267: ANDN_R	andn 	%r16, %r17, %r15
	.word 0x9b643801  ! 267: MOVcc_I	<illegal instruction>
        wr %g0, 0x4, %fprs
thr0_irf_ce_17:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_17), 16, 16),1,IRF,ce,29,x, x,x,x, x,x,x)
	.word 0xda242173  ! 270: STW_I	stw	%r13, [%r16 + 0x0173]
	.word 0xbc9c0011  ! 272: XORcc_R	xorcc 	%r16, %r17, %r30
	.word 0x9540c000  ! 272: RDASI	rd	%asi, %r10
	.word 0xd434285f  ! 274: STH_I	sth	%r10, [%r16 + 0x085f]
	.word 0xb37c0411  ! 276: MOVR_R	move	%r16, %r17, %r25
	.word 0xb6fc243d  ! 276: SDIVcc_I	sdivcc 	%r16, 0x043d, %r27
	.word 0xba940011  ! 277: ORcc_R	orcc 	%r16, %r17, %r29
	.word 0x8d7c0411  ! 279: MOVR_R	move	%r16, %r17, %r6
	.word 0x892c0011  ! 279: SLL_R	sll 	%r16, %r17, %r4
	.word 0x8d494000  ! 279: RDHPR_HTBA	rdhpr	%htba, %r6
	.word 0xc2240011  ! 280: STW_R	stw	%r1, [%r16 + %r17]
	.word 0x8cbc0011  ! 282: XNORcc_R	xnorcc 	%r16, %r17, %r6
	.word 0x81dc2dc3  ! 282: FLUSH_I	dis not found

	.word 0xdc240011  ! 283: STW_R	stw	%r14, [%r16 + %r17]
	.word 0xb72c2001  ! 285: SLL_I	sll 	%r16, 0x0001, %r27
	.word 0xbac42fd3  ! 285: ADDCcc_I	addccc 	%r16, 0x0fd3, %r29
thr0_resum_intr_3:
!$EV trig_pc_d(0,expr(@VA(.MAIN.thr0_resum_intr_3), 16, 16)) -> intp(0, 3, 1)
	wr      %r0, 0x5, %asr26
	.word 0xfa342b35  ! 287: STH_I	sth	%r29, [%r16 + 0x0b35]
	.word 0x8a0c2bbf  ! 289: AND_I	and 	%r16, 0x0bbf, %r5
	.word 0x8d504000  ! 289: RDPR_TNPC	<illegal instruction>
	.word 0xcc742047  ! 291: STX_I	stx	%r6, [%r16 + 0x0047]
	.word 0x84042ab1  ! 293: ADD_I	add 	%r16, 0x0ab1, %r2
	.word 0x8c440011  ! 293: ADDC_R	addc 	%r16, %r17, %r6
	.word 0x928c0011  ! 293: ANDcc_R	andcc 	%r16, %r17, %r9
	.word 0xe8ac206b  ! 293: STBA_I	stba	%r20, [%r16 + 0x006b] %asi
	.word 0xe8742451  ! 295: STX_I	stx	%r20, [%r16 + 0x0451]
	.word 0x853c0011  ! 297: SRA_R	sra 	%r16, %r17, %r2
	.word 0xab3c1011  ! 297: SRAX_R	srax	%r16, %r17, %r21
	.word 0xc3ec2159  ! 297: PREFETCHA_I	prefetcha	[%r16, + 0x0159] %asi, #one_read
thr0_irf_ce_18:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_18), 16, 16),1,IRF,ce,18,x, x,x,x, x,x,x)
	.word 0xea342703  ! 300: STH_I	sth	%r21, [%r16 + 0x0703]
	.word 0xb0b40011  ! 302: ORNcc_R	orncc 	%r16, %r17, %r24
	.word 0xfd3c0011  ! 302: STDF_R	std	%f30, [%r17, %r16]
	.word 0xde2c0011  ! 303: STB_R	stb	%r15, [%r16 + %r17]
	.word 0x98f40011  ! 305: UDIVcc_R	udivcc 	%r16, %r17, %r12
	.word 0xd8242913  ! 307: STW_I	stw	%r12, [%r16 + 0x0913]
	.word 0x99641811  ! 309: MOVcc_R	<illegal instruction>
	.word 0x982c0011  ! 309: ANDN_R	andn 	%r16, %r17, %r12
	.word 0x8e0c25ea  ! 309: AND_I	and 	%r16, 0x05ea, %r7
	.word 0x9e6c0011  ! 309: UDIVX_R	udivx 	%r16, %r17, %r15
	.word 0xde242217  ! 311: STW_I	stw	%r15, [%r16 + 0x0217]
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xb33c0011  ! 314: SRA_R	sra 	%r16, %r17, %r25
	.word 0x86bc278d  ! 316: XNORcc_I	xnorcc 	%r16, 0x078d, %r3
	.word 0x93641811  ! 316: MOVcc_R	<illegal instruction>
        wr %g0, 0x4, %fprs
	.word 0xaa942f7f  ! 317: ORcc_I	orcc 	%r16, 0x0f7f, %r21
	.word 0x844c0011  ! 319: MULX_R	mulx 	%r16, %r17, %r2
thr0_irf_ce_19:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_19), 16, 16),1,IRF,ce,69,x, x,x,x, x,x,x)
	.word 0xc4742269  ! 322: STX_I	stx	%r2, [%r16 + 0x0269]
	.word 0x9a0c0011  ! 324: AND_R	and 	%r16, %r17, %r13
	.word 0x92c40011  ! 324: ADDCcc_R	addccc 	%r16, %r17, %r9
thr0_resum_intr_4:
!$EV trig_pc_d(0,expr(@VA(.MAIN.thr0_resum_intr_4), 16, 16)) -> intp(0, 3, 1)
	wr      %r0, 0x5, %asr26
thr0_irf_ce_20:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_20), 16, 16),1,IRF,ce,68,x, x,x,x, x,x,x)
	.word 0xd22c27ad  ! 327: STB_I	stb	%r9, [%r16 + 0x07ad]
	.word 0x872c0011  ! 329: SLL_R	sll 	%r16, %r17, %r3
	.word 0xe8841011  ! 329: LDUWA_R	lduwa	[%r16, %r17] 0x80, %r20
	.word 0xca2c0011  ! 330: STB_R	stb	%r5, [%r16 + %r17]
	.word 0xae94283b  ! 332: ORcc_I	orcc 	%r16, 0x083b, %r23
	.word 0x9b341011  ! 332: SRLX_R	srlx	%r16, %r17, %r13
	.word 0xbac42db6  ! 332: ADDCcc_I	addccc 	%r16, 0x0db6, %r29
	.word 0xc61c241c  ! 332: LDD_I	ldd	[%r16 + 0x041c], %r3
	.word 0xc62c2827  ! 334: STB_I	stb	%r3, [%r16 + 0x0827]
	.word 0xb61c2f7b  ! 336: XOR_I	xor 	%r16, 0x0f7b, %r27
	.word 0xb2f40011  ! 336: UDIVcc_R	udivcc 	%r16, %r17, %r25
thr0_irf_ce_21:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_21), 16, 16),1,IRF,ce,58,x, x,x,x, x,x,x)
	.word 0xf234227d  ! 339: STH_I	sth	%r25, [%r16 + 0x027d]
	.word 0x8f7c2401  ! 341: MOVR_I	move	%r16, 0xfffffff8, %r7
	.word 0xf7e42011  ! 341: CASA_R	casa	[%r16] %asi, %r17, %r27
thr0_irf_ce_22:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_22), 16, 16),1,IRF,ce,16,x, x,x,x, x,x,x)
	.word 0xf62c2141  ! 344: STB_I	stb	%r27, [%r16 + 0x0141]
	.word 0x85840011  ! 346: WRCCR_R	wr	%r16, %r17, %ccr
thr0_irf_ce_23:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_23), 16, 16),1,IRF,ce,62,x, x,x,x, x,x,x)
	.word 0xf6242573  ! 349: STW_I	stw	%r27, [%r16 + 0x0573]
	.word 0x85341011  ! 351: SRLX_R	srlx	%r16, %r17, %r2
	.word 0x81580000  ! 351: FLUSHW	flushw
	.word 0xee740011  ! 352: STX_R	stx	%r23, [%r16 + %r17]
	.word 0xb21c0011  ! 354: XOR_R	xor 	%r16, %r17, %r25
	.word 0xfaf41011  ! 354: STXA_R	stxa	%r29, [%r16 + %r17] 0x80
thr0_irf_ce_24:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_24), 16, 16),1,IRF,ce,43,x, x,x,x, x,x,x)
	.word 0xfa742569  ! 357: STX_I	stx	%r29, [%r16 + 0x0569]
	.word 0x94040011  ! 359: ADD_R	add 	%r16, %r17, %r10
	.word 0x98440011  ! 359: ADDC_R	addc 	%r16, %r17, %r12
	.word 0x8143c000  ! 359: STBAR	stbar
thr0_irf_ce_25:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_25), 16, 16),1,IRF,ce,35,x, x,x,x, x,x,x)
	.word 0xd83425ed  ! 362: STH_I	sth	%r12, [%r16 + 0x05ed]
	.word 0x9efc0011  ! 364: SDIVcc_R	sdivcc 	%r16, %r17, %r15
	.word 0x929c0011  ! 365: XORcc_R	xorcc 	%r16, %r17, %r9
	.word 0x843c2803  ! 367: XNOR_I	xnor 	%r16, 0x0803, %r2
	.word 0xb6440011  ! 367: ADDC_R	addc 	%r16, %r17, %r27
	.word 0xde7c2e5c  ! 367: SWAP_I	swap	%r15, [%r16 + 0x0e5c]
thr0_irf_ce_26:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_26), 16, 16),1,IRF,ce,10,x, x,x,x, x,x,x)
	.word 0xde2c287f  ! 370: STB_I	stb	%r15, [%r16 + 0x087f]
	.word 0x96f40011  ! 372: UDIVcc_R	udivcc 	%r16, %r17, %r11
	.word 0x903c22c8  ! 373: XNOR_I	xnor 	%r16, 0x02c8, %r8
	.word 0x8e3c2437  ! 375: XNOR_I	xnor 	%r16, 0x0437, %r7
	.word 0x82ac0011  ! 375: ANDNcc_R	andncc 	%r16, %r17, %r1
	.word 0x81dc2d6c  ! 375: FLUSH_I	dis not found

	.word 0xd4240011  ! 376: STW_R	stw	%r10, [%r16 + %r17]
	.word 0x857c2401  ! 378: MOVR_I	move	%r16, 0xfffffff8, %r2
	.word 0x88bc2fbb  ! 378: XNORcc_I	xnorcc 	%r16, 0x0fbb, %r4
	.word 0xa6042c67  ! 378: ADD_I	add 	%r16, 0x0c67, %r19
	.word 0xb46c2806  ! 378: UDIVX_I	udivx 	%r16, 0x0806, %r26
thr0_irf_ce_27:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_27), 16, 16),1,IRF,ce,44,x, x,x,x, x,x,x)
	.word 0xf42424df  ! 381: STW_I	stw	%r26, [%r16 + 0x04df]
	.word 0x81dc2eec  ! 383: FLUSH_I	dis not found

	.word 0xf4342611  ! 385: STH_I	sth	%r26, [%r16 + 0x0611]
	.word 0x9f342001  ! 387: SRL_I	srl 	%r16, 0x0001, %r15
	.word 0x8f342001  ! 387: SRL_I	srl 	%r16, 0x0001, %r7
	.word 0x81dc2bb6  ! 387: FLUSH_I	dis not found

	.word 0xea2c0011  ! 388: STB_R	stb	%r21, [%r16 + %r17]
	.word 0x9b3c0011  ! 390: SRA_R	sra 	%r16, %r17, %r13
	.word 0x8143e057  ! 390: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #Lookaside | #Sync 
	.word 0xda24208d  ! 392: STW_I	stw	%r13, [%r16 + 0x008d]
	.word 0x853c2001  ! 394: SRA_I	sra 	%r16, 0x0001, %r2
	.word 0xb81c0011  ! 394: XOR_R	xor 	%r16, %r17, %r28
	.word 0xb5e40011  ! 394: SAVE_R	save	%r16, %r17, %r26
	.word 0xf474270d  ! 396: STX_I	stx	%r26, [%r16 + 0x070d]
	.word 0xaf342001  ! 398: SRL_I	srl 	%r16, 0x0001, %r23
	.word 0x95643801  ! 398: MOVcc_I	<illegal instruction>
	.word 0x952c3001  ! 398: SLLX_I	sllx	%r16, 0x0001, %r10
	.word 0x81580000  ! 398: FLUSHW	flushw
	.word 0xd4342ac9  ! 400: STH_I	sth	%r10, [%r16 + 0x0ac9]
	.word 0xb17c2401  ! 402: MOVR_I	move	%r16, 0xfffffff8, %r24
	.word 0x933c1011  ! 402: SRAX_R	srax	%r16, %r17, %r9
	.word 0x81dc2df0  ! 402: FLUSH_I	dis not found

thr0_irf_ce_28:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_28), 16, 16),1,IRF,ce,58,x, x,x,x, x,x,x)
	.word 0xd22c26db  ! 405: STB_I	stb	%r9, [%r16 + 0x06db]
	.word 0xa93c0011  ! 407: SRA_R	sra 	%r16, %r17, %r20
	.word 0x8f341011  ! 407: SRLX_R	srlx	%r16, %r17, %r7
	.word 0xba040011  ! 407: ADD_R	add 	%r16, %r17, %r29
	.word 0x887c0011  ! 407: SDIV_R	sdiv 	%r16, %r17, %r4
	.word 0xc8742129  ! 409: STX_I	stx	%r4, [%r16 + 0x0129]
	.word 0x90042ac0  ! 411: ADD_I	add 	%r16, 0x0ac0, %r8
	.word 0xd64426dd  ! 411: LDSW_I	ldsw	[%r16 + 0x06dd], %r11
	.word 0xc6340011  ! 412: STH_R	sth	%r3, [%r16 + %r17]
	.word 0xb89c0011  ! 414: XORcc_R	xorcc 	%r16, %r17, %r28
	.word 0x8143c000  ! 414: STBAR	stbar
thr0_irf_ce_29:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_29), 16, 16),1,IRF,ce,57,x, x,x,x, x,x,x)
	.word 0xf8342c19  ! 417: STH_I	sth	%r28, [%r16 + 0x0c19]
	.word 0x9844212f  ! 419: ADDC_I	addc 	%r16, 0x012f, %r12
	.word 0x82ac22d3  ! 419: ANDNcc_I	andncc 	%r16, 0x02d3, %r1
	.word 0x12800003  ! 419: BNE	bne  	<label_0x3>
	.word 0xf8740011  ! 420: STX_R	stx	%r28, [%r16 + %r17]
	.word 0x26800001  ! 422: BL	bl,a	<label_0x1>
	.word 0xf8342d03  ! 424: STH_I	sth	%r28, [%r16 + 0x0d03]
	.word 0xb3343001  ! 426: SRLX_I	srlx	%r16, 0x0001, %r25
	.word 0x8e0c273e  ! 426: AND_I	and 	%r16, 0x073e, %r7
	.word 0xe6941011  ! 426: LDUHA_R	lduha	[%r16, %r17] 0x80, %r19
	.word 0xde240011  ! 427: STW_R	stw	%r15, [%r16 + %r17]
thr0_resum_intr_5:
!$EV trig_pc_d(0,expr(@VA(.MAIN.thr0_resum_intr_5), 16, 16)) -> intp(0, 3, 1)
	wr      %r0, 0x5, %asr26
	.word 0xde2c2b15  ! 431: STB_I	stb	%r15, [%r16 + 0x0b15]
	.word 0xbebc2afe  ! 433: XNORcc_I	xnorcc 	%r16, 0x0afe, %r31
	.word 0x905c29a9  ! 433: SMUL_I	smul 	%r16, 0x09a9, %r8
	.word 0xd03426e5  ! 435: STH_I	sth	%r8, [%r16 + 0x06e5]
	.word 0x860c0011  ! 437: AND_R	and 	%r16, %r17, %r3
	.word 0x8cb40011  ! 437: ORNcc_R	orncc 	%r16, %r17, %r6
	.word 0xfc4c0011  ! 437: LDSB_R	ldsb	[%r16 + %r17], %r30
	.word 0xd0240011  ! 438: STW_R	stw	%r8, [%r16 + %r17]
	.word 0x96842211  ! 440: ADDcc_I	addcc 	%r16, 0x0211, %r11
	.word 0x8d2c1011  ! 440: SLLX_R	sllx	%r16, %r17, %r6
	.word 0x94ac0011  ! 440: ANDNcc_R	andncc 	%r16, %r17, %r10
	.word 0xf0cc2942  ! 440: LDSBA_I	ldsba	[%r16, + 0x0942] %asi, %r24
	.word 0xf0740011  ! 441: STX_R	stx	%r24, [%r16 + %r17]
	.word 0x9f7c0411  ! 443: MOVR_R	move	%r16, %r17, %r15
	.word 0x91641811  ! 443: MOVcc_R	<illegal instruction>
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x95340011  ! 444: SRL_R	srl 	%r16, %r17, %r10
	.word 0xc36c2aec  ! 446: PREFETCH_I	prefetch	[%r16 + 0x0aec], #one_read
thr0_irf_ce_30:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_30), 16, 16),1,IRF,ce,41,x, x,x,x, x,x,x)
	.word 0xd4742f67  ! 449: STX_I	stx	%r10, [%r16 + 0x0f67]
	.word 0x88c42501  ! 451: ADDCcc_I	addccc 	%r16, 0x0501, %r4
	.word 0xfea41011  ! 451: STWA_R	stwa	%r31, [%r16 + %r17] 0x80
	.word 0xd82c0011  ! 452: STB_R	stb	%r12, [%r16 + %r17]
	.word 0x8c440011  ! 454: ADDC_R	addc 	%r16, %r17, %r6
	.word 0xb3341011  ! 454: SRLX_R	srlx	%r16, %r17, %r25
	.word 0x9d340011  ! 454: SRL_R	srl 	%r16, %r17, %r14
        wr %g0, 0x4, %fprs
	.word 0xd4740011  ! 455: STX_R	stx	%r10, [%r16 + %r17]
	.word 0x8414293d  ! 457: OR_I	or 	%r16, 0x093d, %r2
	.word 0x9f2c2001  ! 457: SLL_I	sll 	%r16, 0x0001, %r15
	.word 0xc6440011  ! 457: LDSW_R	ldsw	[%r16 + %r17], %r3
	.word 0xc6742551  ! 459: STX_I	stx	%r3, [%r16 + 0x0551]
	.word 0xaabc0011  ! 461: XNORcc_R	xnorcc 	%r16, %r17, %r21
	.word 0x95341011  ! 461: SRLX_R	srlx	%r16, %r17, %r10
	.word 0xfabc1011  ! 461: STDA_R	stda	%r29, [%r16 + %r17] 0x80
thr0_irf_ce_31:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_31), 16, 16),1,IRF,ce,60,x, x,x,x, x,x,x)
	.word 0xfa34258b  ! 464: STH_I	sth	%r29, [%r16 + 0x058b]
	.word 0xb4b40011  ! 466: ORNcc_R	orncc 	%r16, %r17, %r26
	.word 0x88d40011  ! 466: UMULcc_R	umulcc 	%r16, %r17, %r4
	.word 0xc8742d71  ! 468: STX_I	stx	%r4, [%r16 + 0x0d71]
	.word 0x96c40011  ! 470: ADDCcc_R	addccc 	%r16, %r17, %r11
	.word 0x973c0011  ! 470: SRA_R	sra 	%r16, %r17, %r11
	.word 0xb8fc0011  ! 470: SDIVcc_R	sdivcc 	%r16, %r17, %r28
thr0_irf_ce_32:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_32), 16, 16),1,IRF,ce,43,x, x,x,x, x,x,x)
	.word 0xf834227d  ! 473: STH_I	sth	%r28, [%r16 + 0x027d]
	.word 0xb09c0011  ! 475: XORcc_R	xorcc 	%r16, %r17, %r24
	.word 0xab514000  ! 475: RDPR_TBA	rdpr	%tba, %r21
	.word 0xd4240011  ! 476: STW_R	stw	%r10, [%r16 + %r17]
	.word 0xd21c0011  ! 478: LDD_R	ldd	[%r16 + %r17], %r9
thr0_irf_ce_33:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_33), 16, 16),1,IRF,ce,29,x, x,x,x, x,x,x)
	.word 0xd2242ac1  ! 481: STW_I	stw	%r9, [%r16 + 0x0ac1]
	.word 0xb6c42aa1  ! 483: ADDCcc_I	addccc 	%r16, 0x0aa1, %r27
	.word 0x8834223b  ! 483: ORN_I	orn 	%r16, 0x023b, %r4
	.word 0xa4bc2880  ! 483: XNORcc_I	xnorcc 	%r16, 0x0880, %r18
	ta	T_CHANGE_PRIV	! macro
thr0_irf_ce_34:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_34), 16, 16),1,IRF,ce,12,x, x,x,x, x,x,x)
	.word 0xe4242957  ! 486: STW_I	stw	%r18, [%r16 + 0x0957]
	.word 0xa92c1011  ! 488: SLLX_R	sllx	%r16, %r17, %r20
	.word 0x833c2001  ! 488: SRA_I	sra 	%r16, 0x0001, %r1
	.word 0xaa0c2a54  ! 488: AND_I	and 	%r16, 0x0a54, %r21
	.word 0xdc7c0011  ! 488: SWAP_R	swap	%r14, [%r16 + %r17]
	.word 0x9cac2781  ! 489: ANDNcc_I	andncc 	%r16, 0x0781, %r14
	.word 0x92ac0011  ! 491: ANDNcc_R	andncc 	%r16, %r17, %r9
	.word 0x8c9c2de5  ! 491: XORcc_I	xorcc 	%r16, 0x0de5, %r6
	.word 0x9a2c0011  ! 491: ANDN_R	andn 	%r16, %r17, %r13
	.word 0x976c0011  ! 491: SDIVX_R	sdivx	%r16, %r17, %r11
	.word 0xaabc22e2  ! 492: XNORcc_I	xnorcc 	%r16, 0x02e2, %r21
	.word 0x8a8424a3  ! 494: ADDcc_I	addcc 	%r16, 0x04a3, %r5
	.word 0x9c2c2e5b  ! 494: ANDN_I	andn 	%r16, 0x0e5b, %r14
	.word 0x24c40003  ! 494: BRLEZ	brlez,a,nt	%16,<label_0x40003>
	.word 0xdc2c2283  ! 496: STB_I	stb	%r14, [%r16 + 0x0283]
	.word 0x933c2001  ! 498: SRA_I	sra 	%r16, 0x0001, %r9
	.word 0x81880000  ! 498: SAVED	saved
	.word 0xba840011  ! 499: ADDcc_R	addcc 	%r16, %r17, %r29
	.word 0x83ec0011  ! 501: RESTORE_R	restore	%r16, %r17, %r1
thr0_irf_ce_35:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_35), 16, 16),1,IRF,ce,66,x, x,x,x, x,x,x)
	.word 0xc22c2d9f  ! 504: STB_I	stb	%r1, [%r16 + 0x0d9f]
	.word 0x9f3c1011  ! 506: SRAX_R	srax	%r16, %r17, %r15
	.word 0xad3c2001  ! 506: SRA_I	sra 	%r16, 0x0001, %r22
	.word 0xaac42cb8  ! 506: ADDCcc_I	addccc 	%r16, 0x0cb8, %r21
	.word 0x81880000  ! 506: RESTORED	saved
	.word 0xea242457  ! 508: STW_I	stw	%r21, [%r16 + 0x0457]
	.word 0x8d7c2401  ! 510: MOVR_I	move	%r16, 0xfffffff8, %r6
	.word 0x85e40011  ! 510: SAVE_R	save	%r16, %r17, %r2
thr0_irf_ce_36:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_36), 16, 16),1,IRF,ce,7,x, x,x,x, x,x,x)
	.word 0xc4342ab9  ! 513: STH_I	sth	%r2, [%r16 + 0x0ab9]
	.word 0xc3ec2fec  ! 515: PREFETCHA_I	prefetcha	[%r16, + 0x0fec] %asi, #one_read
	.word 0xda740011  ! 516: STX_R	stx	%r13, [%r16 + %r17]
	.word 0x86c40011  ! 518: ADDCcc_R	addccc 	%r16, %r17, %r3
	.word 0xd60c0011  ! 518: LDUB_R	ldub	[%r16 + %r17], %r11
	.word 0x9c2c2630  ! 519: ANDN_I	andn 	%r16, 0x0630, %r14
	.word 0x9e140011  ! 521: OR_R	or 	%r16, %r17, %r15
	.word 0x888c2dd1  ! 521: ANDcc_I	andcc 	%r16, 0x0dd1, %r4
        wr %g0, 0x4, %fprs
	.word 0xf8340011  ! 522: STH_R	sth	%r28, [%r16 + %r17]
	.word 0xae1c0011  ! 524: XOR_R	xor 	%r16, %r17, %r23
	.word 0x82342fdc  ! 524: ORN_I	orn 	%r16, 0x0fdc, %r1
	.word 0xe8cc2c66  ! 524: LDSBA_I	ldsba	[%r16, + 0x0c66] %asi, %r20
	.word 0x85643801  ! 525: MOVcc_I	<illegal instruction>
        wr %g0, 0x4, %fprs
thr0_irf_ce_37:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_37), 16, 16),1,IRF,ce,22,x, x,x,x, x,x,x)
	.word 0xc424200d  ! 530: STW_I	stw	%r2, [%r16 + 0x000d]
	.word 0x993c1011  ! 532: SRAX_R	srax	%r16, %r17, %r12
	.word 0x86040011  ! 532: ADD_R	add 	%r16, %r17, %r3
	.word 0xc3ec2aef  ! 532: PREFETCHA_I	prefetcha	[%r16, + 0x0aef] %asi, #one_read
	.word 0xc62c25bb  ! 534: STB_I	stb	%r3, [%r16 + 0x05bb]
	.word 0xb89c2591  ! 536: XORcc_I	xorcc 	%r16, 0x0591, %r28
	.word 0x9634243b  ! 536: ORN_I	orn 	%r16, 0x043b, %r11
	.word 0x948c26fd  ! 536: ANDcc_I	andcc 	%r16, 0x06fd, %r10
        wr %g0, 0x4, %fprs
thr0_irf_ce_38:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_38), 16, 16),1,IRF,ce,25,x, x,x,x, x,x,x)
	.word 0xd42c29b1  ! 539: STB_I	stb	%r10, [%r16 + 0x09b1]
	.word 0x823c0011  ! 541: XNOR_R	xnor 	%r16, %r17, %r1
	.word 0x892c3001  ! 541: SLLX_I	sllx	%r16, 0x0001, %r4
	.word 0x969c2120  ! 541: XORcc_I	xorcc 	%r16, 0x0120, %r11
	.word 0xad418000  ! 541: RDFPRS	rd	%fprs, %r22
	.word 0xce240011  ! 542: STW_R	stw	%r7, [%r16 + %r17]
	.word 0x94b42779  ! 544: ORNcc_I	orncc 	%r16, 0x0779, %r10
	.word 0xb5343001  ! 544: SRLX_I	srlx	%r16, 0x0001, %r26
	.word 0x9e842049  ! 544: ADDcc_I	addcc 	%r16, 0x0049, %r15
	ta	T_CHANGE_PRIV	! macro
	.word 0xde742199  ! 546: STX_I	stx	%r15, [%r16 + 0x0199]
	.word 0xb8840011  ! 548: ADDcc_R	addcc 	%r16, %r17, %r28
	.word 0xb5343001  ! 548: SRLX_I	srlx	%r16, 0x0001, %r26
	.word 0x8b53c000  ! 548: RDPR_FQ	<illegal instruction>
thr0_irf_ce_39:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_39), 16, 16),1,IRF,ce,44,x, x,x,x, x,x,x)
	.word 0xca342eb7  ! 551: STH_I	sth	%r5, [%r16 + 0x0eb7]
	.word 0x932c3001  ! 553: SLLX_I	sllx	%r16, 0x0001, %r9
	.word 0x8143e022  ! 553: MEMBAR	membar	#StoreLoad | #MemIssue 
	.word 0xd8340011  ! 554: STH_R	sth	%r12, [%r16 + %r17]
	.word 0x942c20cd  ! 556: ANDN_I	andn 	%r16, 0x00cd, %r10
	.word 0x92b426e6  ! 556: ORNcc_I	orncc 	%r16, 0x06e6, %r9
	.word 0x8143e054  ! 556: MEMBAR	membar	#LoadStore | #Lookaside | #Sync 
thr0_irf_ce_40:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_40), 16, 16),1,IRF,ce,29,x, x,x,x, x,x,x)
	.word 0xd2342cc5  ! 559: STH_I	sth	%r9, [%r16 + 0x0cc5]
        wr %g0, 0x4, %fprs
	.word 0x8894233b  ! 562: ORcc_I	orcc 	%r16, 0x033b, %r4
	.word 0x823c0011  ! 564: XNOR_R	xnor 	%r16, %r17, %r1
	.word 0x93340011  ! 564: SRL_R	srl 	%r16, %r17, %r9
	.word 0x8a842f34  ! 564: ADDcc_I	addcc 	%r16, 0x0f34, %r5
thr0_resum_intr_6:
!$EV trig_pc_d(0,expr(@VA(.MAIN.thr0_resum_intr_6), 16, 16)) -> intp(0, 3, 1)
	wr      %r0, 0x5, %asr26
	.word 0xca2c2db9  ! 566: STB_I	stb	%r5, [%r16 + 0x0db9]
	.word 0xab2c3001  ! 568: SLLX_I	sllx	%r16, 0x0001, %r21
	.word 0x924421d0  ! 568: ADDC_I	addc 	%r16, 0x01d0, %r9
	.word 0x81880000  ! 568: SAVED	saved
thr0_irf_ce_41:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_41), 16, 16),1,IRF,ce,14,x, x,x,x, x,x,x)
	.word 0xd2242597  ! 571: STW_I	stw	%r9, [%r16 + 0x0597]
	.word 0xba3c0011  ! 573: XNOR_R	xnor 	%r16, %r17, %r29
	.word 0x8c140011  ! 573: OR_R	or 	%r16, %r17, %r6
	.word 0x8f2c3001  ! 573: SLLX_I	sllx	%r16, 0x0001, %r7
	.word 0xc3ec2137  ! 573: PREFETCHA_I	prefetcha	[%r16, + 0x0137] %asi, #one_read
thr0_irf_ce_42:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_42), 16, 16),1,IRF,ce,38,x, x,x,x, x,x,x)
	.word 0xce24270d  ! 576: STW_I	stw	%r7, [%r16 + 0x070d]
	.word 0x9a0c0011  ! 578: AND_R	and 	%r16, %r17, %r13
	.word 0x864c0011  ! 578: MULX_R	mulx 	%r16, %r17, %r3
	.word 0xd6340011  ! 579: STH_R	sth	%r11, [%r16 + %r17]
	.word 0xc36c2f60  ! 581: PREFETCH_I	prefetch	[%r16 + 0x0f60], #one_read
	.word 0xd63429d5  ! 583: STH_I	sth	%r11, [%r16 + 0x09d5]
	.word 0xbe0c2694  ! 585: AND_I	and 	%r16, 0x0694, %r31
	.word 0xca841011  ! 585: LDUWA_R	lduwa	[%r16, %r17] 0x80, %r5
	.word 0xca24232d  ! 587: STW_I	stw	%r5, [%r16 + 0x032d]
	.word 0xb29c0011  ! 589: XORcc_R	xorcc 	%r16, %r17, %r25
	.word 0x8a440011  ! 589: ADDC_R	addc 	%r16, %r17, %r5
thr0_resum_intr_7:
!$EV trig_pc_d(0,expr(@VA(.MAIN.thr0_resum_intr_7), 16, 16)) -> intp(0, 3, 1)
	wr      %r0, 0x5, %asr26
	.word 0x8e940011  ! 590: ORcc_R	orcc 	%r16, %r17, %r7
thr0_resum_intr_8:
!$EV trig_pc_d(0,expr(@VA(.MAIN.thr0_resum_intr_8), 16, 16)) -> intp(0, 3, 1)
	wr      %r0, 0x5, %asr26
thr0_irf_ce_43:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_43), 16, 16),1,IRF,ce,4,x, x,x,x, x,x,x)
	.word 0xce2c2a9f  ! 595: STB_I	stb	%r7, [%r16 + 0x0a9f]
	.word 0xae4424c0  ! 597: ADDC_I	addc 	%r16, 0x04c0, %r23
	.word 0xb7341011  ! 597: SRLX_R	srlx	%r16, %r17, %r27
	ta	T_CHANGE_PRIV	! macro
	.word 0xd22c0011  ! 598: STB_R	stb	%r9, [%r16 + %r17]
	.word 0x86442920  ! 600: ADDC_I	addc 	%r16, 0x0920, %r3
	.word 0x83534000  ! 600: RDPR_OTHERWIN	rdpr	%otherwin, %r1
	.word 0xc2242983  ! 602: STW_I	stw	%r1, [%r16 + 0x0983]
	.word 0xc4c41011  ! 604: LDSWA_R	ldswa	[%r16, %r17] 0x80, %r2
	.word 0xc42c2891  ! 606: STB_I	stb	%r2, [%r16 + 0x0891]
	.word 0xc36c0011  ! 608: PREFETCH_R	prefetch	[%r16 + %r17], #one_read
	.word 0xc4240011  ! 609: STW_R	stw	%r2, [%r16 + %r17]
	.word 0xdacc1011  ! 611: LDSBA_R	ldsba	[%r16, %r17] 0x80, %r13
	.word 0x988c0011  ! 612: ANDcc_R	andcc 	%r16, %r17, %r12
	.word 0xaa042086  ! 614: ADD_I	add 	%r16, 0x0086, %r21
	.word 0xb1641811  ! 614: MOVcc_R	<illegal instruction>
	.word 0x917c2401  ! 614: MOVR_I	move	%r16, 0xfffffff8, %r8
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x857c2401  ! 615: MOVR_I	move	%r16, 0x7fffbdd8, %r2
	.word 0xbc1c29ee  ! 617: XOR_I	xor 	%r16, 0x09ee, %r30
	.word 0x873c0011  ! 617: SRA_R	sra 	%r16, %r17, %r3
	.word 0xbad40011  ! 617: UMULcc_R	umulcc 	%r16, %r17, %r29
	.word 0xb48c2c4a  ! 618: ANDcc_I	andcc 	%r16, 0x0c4a, %r26
	.word 0x821c0011  ! 620: XOR_R	xor 	%r16, %r17, %r1
	.word 0xdcc42c54  ! 620: LDSWA_I	ldswa	[%r16, + 0x0c54] %asi, %r14
thr0_irf_ce_44:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_44), 16, 16),1,IRF,ce,64,x, x,x,x, x,x,x)
	.word 0xdc2c2965  ! 623: STB_I	stb	%r14, [%r16 + 0x0965]
	.word 0xf7f41011  ! 625: CASXA_I	casxa	[%r16] 0x80, %r17, %r27
	.word 0xda740011  ! 626: STX_R	stx	%r13, [%r16 + %r17]
	.word 0x98bc0011  ! 628: XNORcc_R	xnorcc 	%r16, %r17, %r12
	.word 0xc36c0011  ! 628: PREFETCH_R	prefetch	[%r16 + %r17], #one_read
	.word 0x909c0011  ! 629: XORcc_R	xorcc 	%r16, %r17, %r8
	.word 0xc3242870  ! 631: STF_I	st	%f1, [0x0870, %r16]
	.word 0x8a140011  ! 632: OR_R	or 	%r16, %r17, %r5
	.word 0xb48c0011  ! 634: ANDcc_R	andcc 	%r16, %r17, %r26
	.word 0xbe1c2861  ! 634: XOR_I	xor 	%r16, 0x0861, %r31
	.word 0xea8429db  ! 634: LDUWA_I	lduwa	[%r16, + 0x09db] %asi, %r21
	.word 0xea34265d  ! 636: STH_I	sth	%r21, [%r16 + 0x065d]
	.word 0xb6842b75  ! 638: ADDcc_I	addcc 	%r16, 0x0b75, %r27
	.word 0xc4842e16  ! 638: LDUWA_I	lduwa	[%r16, + 0x0e16] %asi, %r2
	.word 0xde740011  ! 639: STX_R	stx	%r15, [%r16 + %r17]
	.word 0x962c0011  ! 641: ANDN_R	andn 	%r16, %r17, %r11
	.word 0x81880000  ! 641: RESTORED	saved
	.word 0xe42c0011  ! 642: STB_R	stb	%r18, [%r16 + %r17]
	.word 0x868c20c7  ! 644: ANDcc_I	andcc 	%r16, 0x00c7, %r3
	.word 0xc3ec2a26  ! 644: PREFETCHA_I	prefetcha	[%r16, + 0x0a26] %asi, #one_read
thr0_irf_ce_45:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_45), 16, 16),1,IRF,ce,71,x, x,x,x, x,x,x)
	.word 0xc62c2ca9  ! 647: STB_I	stb	%r3, [%r16 + 0x0ca9]
	.word 0x0c800003  ! 649: BNEG	bneg  	<label_0x3>
	.word 0xaa2c2d68  ! 650: ANDN_I	andn 	%r16, 0x0d68, %r21
	.word 0x8d2c2001  ! 652: SLL_I	sll 	%r16, 0x0001, %r6
	.word 0x97342001  ! 652: SRL_I	srl 	%r16, 0x0001, %r11
	.word 0x8143c000  ! 652: STBAR	stbar
	.word 0x8a9c2d51  ! 653: XORcc_I	xorcc 	%r16, 0x0d51, %r5
	.word 0xcc941011  ! 655: LDUHA_R	lduha	[%r16, %r17] 0x80, %r6
	.word 0x9eb40011  ! 656: ORNcc_R	orncc 	%r16, %r17, %r15
	.word 0x9a940011  ! 658: ORcc_R	orcc 	%r16, %r17, %r13
	.word 0x8b641811  ! 658: MOVcc_R	<illegal instruction>
	.word 0x8eac0011  ! 658: ANDNcc_R	andncc 	%r16, %r17, %r7
	.word 0x9ef40011  ! 658: UDIVcc_R	udivcc 	%r16, %r17, %r15
	.word 0xde2c2af3  ! 660: STB_I	stb	%r15, [%r16 + 0x0af3]
	.word 0x88c42587  ! 662: ADDCcc_I	addccc 	%r16, 0x0587, %r4
	.word 0xaf340011  ! 662: SRL_R	srl 	%r16, %r17, %r23
	.word 0x04800001  ! 662: BLE	ble  	<label_0x1>
	.word 0x84142098  ! 663: OR_I	or 	%r16, 0x0098, %r2
	.word 0x8c440011  ! 665: ADDC_R	addc 	%r16, %r17, %r6
	.word 0xae2c2a7a  ! 665: ANDN_I	andn 	%r16, 0x0a7a, %r23
	.word 0x88442111  ! 665: ADDC_I	addc 	%r16, 0x0111, %r4
	.word 0x1a800003  ! 665: BCC	bcc  	<label_0x3>
	.word 0xc62c0011  ! 666: STB_R	stb	%r3, [%r16 + %r17]
	.word 0x98842226  ! 668: ADDcc_I	addcc 	%r16, 0x0226, %r12
	.word 0x941c29d9  ! 668: XOR_I	xor 	%r16, 0x09d9, %r10
	.word 0xc36c204c  ! 668: PREFETCH_I	prefetch	[%r16 + 0x004c], #one_read
	.word 0xcc240011  ! 669: STW_R	stw	%r6, [%r16 + %r17]
	.word 0xa8042746  ! 671: ADD_I	add 	%r16, 0x0746, %r20
	.word 0x9eac222b  ! 671: ANDNcc_I	andncc 	%r16, 0x022b, %r15
	.word 0xb8942416  ! 671: ORcc_I	orcc 	%r16, 0x0416, %r28
	ta	T_CHANGE_HPRIV	! macro
	.word 0xd02c0011  ! 672: STB_R	stb	%r8, [%r16 + %r17]
	.word 0x93341011  ! 674: SRLX_R	srlx	%r16, %r17, %r9
	.word 0x853c0011  ! 674: SRA_R	sra 	%r16, %r17, %r2
	.word 0xce4c2519  ! 674: LDSB_I	ldsb	[%r16 + 0x0519], %r7
thr0_irf_ce_46:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_46), 16, 16),1,IRF,ce,42,x, x,x,x, x,x,x)
	.word 0xce742059  ! 677: STX_I	stx	%r7, [%r16 + 0x0059]
	.word 0x892c0011  ! 679: SLL_R	sll 	%r16, %r17, %r4
	.word 0xd2941011  ! 679: LDUHA_R	lduha	[%r16, %r17] 0x80, %r9
	.word 0xbab40011  ! 680: ORNcc_R	orncc 	%r16, %r17, %r29
	.word 0x81dc0011  ! 682: FLUSH_R	dis not found

	.word 0xfa342199  ! 684: STH_I	sth	%r29, [%r16 + 0x0199]
	.word 0xa93c2001  ! 686: SRA_I	sra 	%r16, 0x0001, %r20
	.word 0xfc440011  ! 686: LDSW_R	ldsw	[%r16 + %r17], %r30
	.word 0xfc342c79  ! 688: STH_I	sth	%r30, [%r16 + 0x0c79]
	.word 0x8ac40011  ! 690: ADDCcc_R	addccc 	%r16, %r17, %r5
	.word 0x81dc2190  ! 690: FLUSH_I	dis not found

	.word 0xe42c0011  ! 691: STB_R	stb	%r18, [%r16 + %r17]
	.word 0xbf341011  ! 693: SRLX_R	srlx	%r16, %r17, %r31
	.word 0x988c2c19  ! 693: ANDcc_I	andcc 	%r16, 0x0c19, %r12
	.word 0xa42c296b  ! 693: ANDN_I	andn 	%r16, 0x096b, %r18
	.word 0xd20424be  ! 693: LDUW_I	lduw	[%r16 + 0x04be], %r9
	.word 0x95342001  ! 694: SRL_I	srl 	%r16, 0x0001, %r10
	.word 0xb4c40011  ! 696: ADDCcc_R	addccc 	%r16, %r17, %r26
	.word 0x8a1c0011  ! 696: XOR_R	xor 	%r16, %r17, %r5
	.word 0xb83c0011  ! 696: XNOR_R	xnor 	%r16, %r17, %r28
	.word 0x96d40011  ! 696: UMULcc_R	umulcc 	%r16, %r17, %r11
	.word 0xae1c0011  ! 697: XOR_R	xor 	%r16, %r17, %r23
	.word 0xc36c2069  ! 699: PREFETCH_I	prefetch	[%r16 + 0x0069], #one_read
	.word 0xee74246b  ! 701: STX_I	stx	%r23, [%r16 + 0x046b]
	.word 0x960c0011  ! 703: AND_R	and 	%r16, %r17, %r11
	.word 0x87343001  ! 703: SRLX_I	srlx	%r16, 0x0001, %r3
	.word 0xc93c0011  ! 703: STDF_R	std	%f4, [%r17, %r16]
	.word 0xa52c3001  ! 704: SLLX_I	sllx	%r16, 0x0001, %r18
	.word 0x8e8c0011  ! 706: ANDcc_R	andcc 	%r16, %r17, %r7
	.word 0x0acc0001  ! 706: BRNZ	brnz  ,pt	%16,<label_0xc0001>
thr0_irf_ce_47:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_47), 16, 16),1,IRF,ce,61,x, x,x,x, x,x,x)
	.word 0xce342921  ! 709: STH_I	sth	%r7, [%r16 + 0x0921]
	.word 0xb6142bab  ! 711: OR_I	or 	%r16, 0x0bab, %r27
	.word 0xd6bc2dc4  ! 711: STDA_I	stda	%r11, [%r16 + 0x0dc4] %asi
	.word 0xd62c2365  ! 713: STB_I	stb	%r11, [%r16 + 0x0365]
        wr %g0, 0x4, %fprs
	.word 0xd2740011  ! 716: STX_R	stx	%r9, [%r16 + %r17]
	.word 0x89341011  ! 718: SRLX_R	srlx	%r16, %r17, %r4
	.word 0x988c2e37  ! 718: ANDcc_I	andcc 	%r16, 0x0e37, %r12
	.word 0x840c2de1  ! 718: AND_I	and 	%r16, 0x0de1, %r2
	.word 0xc2ac2906  ! 718: STBA_I	stba	%r1, [%r16 + 0x0906] %asi
	.word 0xc2242a27  ! 720: STW_I	stw	%r1, [%r16 + 0x0a27]
	.word 0x828c0011  ! 722: ANDcc_R	andcc 	%r16, %r17, %r1
	.word 0x829c0011  ! 722: XORcc_R	xorcc 	%r16, %r17, %r1
	.word 0xbe340011  ! 722: ORN_R	orn 	%r16, %r17, %r31
	.word 0xb27c0011  ! 722: SDIV_R	sdiv 	%r16, %r17, %r25
	.word 0xc6740011  ! 723: STX_R	stx	%r3, [%r16 + %r17]
	.word 0x99340011  ! 725: SRL_R	srl 	%r16, %r17, %r12
	.word 0xa73c2001  ! 725: SRA_I	sra 	%r16, 0x0001, %r19
	.word 0x972c3001  ! 725: SLLX_I	sllx	%r16, 0x0001, %r11
	.word 0x0ac40001  ! 725: BRNZ	brnz  ,nt	%16,<label_0x40001>
	.word 0x96a40011  ! 726: SUBcc_R	subcc 	%r16, %r17, %r11
	.word 0x8a342472  ! 728: ORN_I	orn 	%r16, 0x0472, %r5
	.word 0xaf50c000  ! 728: RDPR_TT	<illegal instruction>
thr0_irf_ce_48:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_48), 16, 16),1,IRF,ce,16,x, x,x,x, x,x,x)
	.word 0xee74215f  ! 731: STX_I	stx	%r23, [%r16 + 0x015f]
	.word 0xbc1c2bcc  ! 733: XOR_I	xor 	%r16, 0x0bcc, %r30
	.word 0xc2c41011  ! 733: LDSWA_R	ldswa	[%r16, %r17] 0x80, %r1
	.word 0xd0340011  ! 734: STH_R	sth	%r8, [%r16 + %r17]
	.word 0x9c8c0011  ! 736: ANDcc_R	andcc 	%r16, %r17, %r14
	.word 0xb83c0011  ! 736: XNOR_R	xnor 	%r16, %r17, %r28
	.word 0x8cbc25c3  ! 736: XNORcc_I	xnorcc 	%r16, 0x05c3, %r6
	.word 0x2cc40001  ! 736: BRGZ	brgz,a,nt	%16,<label_0x40001>
	.word 0x9eac0011  ! 737: ANDNcc_R	andncc 	%r16, %r17, %r15
	.word 0x9ed428f3  ! 739: UMULcc_I	umulcc 	%r16, 0x08f3, %r15
	.word 0xa8c40011  ! 740: ADDCcc_R	addccc 	%r16, %r17, %r20
	.word 0x8ec4276b  ! 742: ADDCcc_I	addccc 	%r16, 0x076b, %r7
	.word 0xa92c0011  ! 742: SLL_R	sll 	%r16, %r17, %r20
	.word 0x8c3c0011  ! 742: XNOR_R	xnor 	%r16, %r17, %r6
	.word 0x8a740011  ! 742: UDIV_R	udiv 	%r16, %r17, %r5
	.word 0x88840011  ! 743: ADDcc_R	addcc 	%r16, %r17, %r4
	.word 0xd60423a1  ! 745: LDUW_I	lduw	[%r16 + 0x03a1], %r11
	.word 0x94340011  ! 746: ORN_R	orn 	%r16, %r17, %r10
	.word 0x9e8c0011  ! 748: ANDcc_R	andcc 	%r16, %r17, %r15
thr0_resum_intr_9:
!$EV trig_pc_d(0,expr(@VA(.MAIN.thr0_resum_intr_9), 16, 16)) -> intp(0, 3, 1)
	wr      %r0, 0x5, %asr26
	.word 0xec340011  ! 749: STH_R	sth	%r22, [%r16 + %r17]
	.word 0x900c0011  ! 751: AND_R	and 	%r16, %r17, %r8
        wr %g0, 0x4, %fprs
	.word 0x88b42c9a  ! 752: ORNcc_I	orncc 	%r16, 0x0c9a, %r4
	.word 0x9a840011  ! 754: ADDcc_R	addcc 	%r16, %r17, %r13
	.word 0x95514000  ! 754: RDPR_TBA	rdpr	%tba, %r10
	.word 0xc42c0011  ! 755: STB_R	stb	%r2, [%r16 + %r17]
	.word 0x8a140011  ! 757: OR_R	or 	%r16, %r17, %r5
	.word 0x829c0011  ! 757: XORcc_R	xorcc 	%r16, %r17, %r1
	.word 0xc36c21c8  ! 757: PREFETCH_I	prefetch	[%r16 + 0x01c8], #one_read
	.word 0xc27423b1  ! 759: STX_I	stx	%r1, [%r16 + 0x03b1]
	.word 0x8c1c0011  ! 761: XOR_R	xor 	%r16, %r17, %r6
	.word 0xbc8c0011  ! 761: ANDcc_R	andcc 	%r16, %r17, %r30
	.word 0xfaac2adf  ! 761: STBA_I	stba	%r29, [%r16 + 0x0adf] %asi
	.word 0xd8740011  ! 762: STX_R	stx	%r12, [%r16 + %r17]
	.word 0xb1641811  ! 764: MOVcc_R	<illegal instruction>
	.word 0x8c3c25b9  ! 764: XNOR_I	xnor 	%r16, 0x05b9, %r6
        wr %g0, 0x4, %fprs
	.word 0xcc2c2255  ! 766: STB_I	stb	%r6, [%r16 + 0x0255]
	.word 0xec04254c  ! 768: LDUW_I	lduw	[%r16 + 0x054c], %r22
	.word 0x9c9426f0  ! 769: ORcc_I	orcc 	%r16, 0x06f0, %r14
	.word 0x8d7c0411  ! 771: MOVR_R	move	%r16, %r17, %r6
	.word 0x8143e02e  ! 771: MEMBAR	membar	#StoreLoad | #LoadStore | #StoreStore | #MemIssue 
thr0_irf_ce_49:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_49), 16, 16),1,IRF,ce,57,x, x,x,x, x,x,x)
	.word 0xcc342c8f  ! 774: STH_I	sth	%r6, [%r16 + 0x0c8f]
	.word 0x8d3c0011  ! 776: SRA_R	sra 	%r16, %r17, %r6
	.word 0x881c2dbf  ! 776: XOR_I	xor 	%r16, 0x0dbf, %r4
	.word 0x81dc2ccf  ! 776: FLUSH_I	dis not found

	.word 0xd8240011  ! 777: STW_R	stw	%r12, [%r16 + %r17]
	.word 0xb6040011  ! 779: ADD_R	add 	%r16, %r17, %r27
	.word 0xbc8c261b  ! 779: ANDcc_I	andcc 	%r16, 0x061b, %r30
	.word 0x937c0411  ! 779: MOVR_R	move	%r16, %r17, %r9
	.word 0x8fa40d31  ! 779: FsMULd	fsmuld	%f16, %f48, %f38
	.word 0x9b2c0011  ! 780: SLL_R	sll 	%r16, %r17, %r13
	.word 0x913c0011  ! 782: SRA_R	sra 	%r16, %r17, %r8
	.word 0x8c8c0011  ! 782: ANDcc_R	andcc 	%r16, %r17, %r6
	.word 0x84140011  ! 782: OR_R	or 	%r16, %r17, %r2
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xe6740011  ! 783: STX_R	stx	%r19, [%r16 + %r17]
	.word 0x9604273b  ! 785: ADD_I	add 	%r16, 0x073b, %r11
	.word 0x877c2401  ! 785: MOVR_I	move	%r16, 0xfffffff8, %r3
	.word 0xf65c2467  ! 785: LDX_I	ldx	[%r16 + 0x0467], %r27
	.word 0xf6242735  ! 787: STW_I	stw	%r27, [%r16 + 0x0735]
	.word 0x0ec40001  ! 789: BRGEZ	brgez  ,nt	%16,<label_0x40001>
	.word 0xf6742ba3  ! 791: STX_I	stx	%r27, [%r16 + 0x0ba3]
	.word 0x9e8c0011  ! 793: ANDcc_R	andcc 	%r16, %r17, %r15
	.word 0x93341011  ! 793: SRLX_R	srlx	%r16, %r17, %r9
	.word 0x96040011  ! 793: ADD_R	add 	%r16, %r17, %r11
	.word 0xba7c263b  ! 793: SDIV_I	sdiv 	%r16, 0x063b, %r29
	.word 0xac242c41  ! 794: SUB_I	sub 	%r16, 0x0c41, %r22
	.word 0x849c0011  ! 796: XORcc_R	xorcc 	%r16, %r17, %r2
	.word 0xae9c0011  ! 796: XORcc_R	xorcc 	%r16, %r17, %r23
	.word 0xaabc0011  ! 796: XNORcc_R	xnorcc 	%r16, %r17, %r21
	.word 0x2acc0001  ! 796: BRNZ	brnz,a,pt	%16,<label_0xc0001>
	.word 0x9d3c1011  ! 797: SRAX_R	srax	%r16, %r17, %r14
	.word 0x9c9c0011  ! 799: XORcc_R	xorcc 	%r16, %r17, %r14
	.word 0x953c1011  ! 799: SRAX_R	srax	%r16, %r17, %r10
	.word 0x8abc0011  ! 799: XNORcc_R	xnorcc 	%r16, %r17, %r5
	.word 0x93e40011  ! 799: SAVE_R	save	%r16, %r17, %r9
thr0_irf_ce_50:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_50), 16, 16),1,IRF,ce,34,x, x,x,x, x,x,x)
	.word 0xd22c204f  ! 802: STB_I	stb	%r9, [%r16 + 0x004f]
	.word 0x94bc2c62  ! 804: XNORcc_I	xnorcc 	%r16, 0x0c62, %r10
	.word 0xb874266f  ! 804: UDIV_I	udiv 	%r16, 0x066f, %r28
thr0_irf_ce_51:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_51), 16, 16),1,IRF,ce,58,x, x,x,x, x,x,x)
	.word 0xf82c21b9  ! 807: STB_I	stb	%r28, [%r16 + 0x01b9]
	ta	T_CHANGE_PRIV	! macro
	.word 0xf82c22c7  ! 811: STB_I	stb	%r28, [%r16 + 0x02c7]
	.word 0x9c840011  ! 813: ADDcc_R	addcc 	%r16, %r17, %r14
	.word 0x937c2401  ! 813: MOVR_I	move	%r16, 0xfffffff8, %r9
thr0_resum_intr_10:
!$EV trig_pc_d(0,expr(@VA(.MAIN.thr0_resum_intr_10), 16, 16)) -> intp(0, 3, 1)
	wr      %r0, 0x5, %asr26
	.word 0xd22424b3  ! 815: STW_I	stw	%r9, [%r16 + 0x04b3]
	.word 0xa4342d86  ! 817: ORN_I	orn 	%r16, 0x0d86, %r18
	.word 0x8c0c272d  ! 817: AND_I	and 	%r16, 0x072d, %r6
	.word 0xbf242537  ! 817: MULScc_I	mulscc 	%r16, 0x0537, %r31
thr0_irf_ce_52:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_52), 16, 16),1,IRF,ce,7,x, x,x,x, x,x,x)
	.word 0xfe2c24e9  ! 820: STB_I	stb	%r31, [%r16 + 0x04e9]
	.word 0x8c140011  ! 822: OR_R	or 	%r16, %r17, %r6
	.word 0x82b40011  ! 822: ORNcc_R	orncc 	%r16, %r17, %r1
	.word 0x936c295e  ! 822: SDIVX_I	sdivx	%r16, 0x095e, %r9
	.word 0xd22c0011  ! 823: STB_R	stb	%r9, [%r16 + %r17]
	.word 0xb0c40011  ! 825: ADDCcc_R	addccc 	%r16, %r17, %r24
	.word 0x90840011  ! 825: ADDcc_R	addcc 	%r16, %r17, %r8
	.word 0xea542015  ! 825: LDSH_I	ldsh	[%r16 + 0x0015], %r21
	.word 0xea2c244f  ! 827: STB_I	stb	%r21, [%r16 + 0x044f]
	.word 0xc36c2716  ! 829: PREFETCH_I	prefetch	[%r16 + 0x0716], #one_read
	.word 0xea2c2a2f  ! 831: STB_I	stb	%r21, [%r16 + 0x0a2f]
	.word 0x9f343001  ! 833: SRLX_I	srlx	%r16, 0x0001, %r15
	.word 0x9e8c0011  ! 833: ANDcc_R	andcc 	%r16, %r17, %r15
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xbac42273  ! 834: ADDCcc_I	addccc 	%r16, 0x0273, %r29
	.word 0xbe0c21d7  ! 836: AND_I	and 	%r16, 0x01d7, %r31
	.word 0x8b6c2e14  ! 836: SDIVX_I	sdivx	%r16, 0x0e14, %r5
	.word 0xca24259d  ! 838: STW_I	stw	%r5, [%r16 + 0x059d]
	.word 0xd4442478  ! 840: LDSW_I	ldsw	[%r16 + 0x0478], %r10
	.word 0x9a9c0011  ! 841: XORcc_R	xorcc 	%r16, %r17, %r13
	.word 0x9f3c0011  ! 843: SRA_R	sra 	%r16, %r17, %r15
	.word 0x957c2401  ! 843: MOVR_I	move	%r16, 0xfffffff8, %r10
	.word 0xc3ec2540  ! 843: PREFETCHA_I	prefetcha	[%r16, + 0x0540] %asi, #one_read
	.word 0xdc2c0011  ! 844: STB_R	stb	%r14, [%r16 + %r17]
	.word 0xb48c0011  ! 846: ANDcc_R	andcc 	%r16, %r17, %r26
	.word 0x9ac42d32  ! 846: ADDCcc_I	addccc 	%r16, 0x0d32, %r13
	.word 0x93a8c831  ! 846: FMOVL	fmovs	%fcc1, %f17, %f9
thr0_irf_ce_53:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_53), 16, 16),1,IRF,ce,53,x, x,x,x, x,x,x)
	.word 0xd27425df  ! 849: STX_I	stx	%r9, [%r16 + 0x05df]
	.word 0x965c22e7  ! 851: SMUL_I	smul 	%r16, 0x02e7, %r11
thr0_irf_ce_54:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_54), 16, 16),1,IRF,ce,56,x, x,x,x, x,x,x)
	.word 0xd6742c13  ! 854: STX_I	stx	%r11, [%r16 + 0x0c13]
	.word 0x9cb40011  ! 856: ORNcc_R	orncc 	%r16, %r17, %r14
	.word 0x820c0011  ! 856: AND_R	and 	%r16, %r17, %r1
	.word 0x912c1011  ! 856: SLLX_R	sllx	%r16, %r17, %r8
	.word 0xc36c2d1e  ! 856: PREFETCH_I	prefetch	[%r16 + 0x0d1e], #one_read
	.word 0xd074258d  ! 858: STX_I	stx	%r8, [%r16 + 0x058d]
	.word 0x900c0011  ! 860: AND_R	and 	%r16, %r17, %r8
	.word 0xda8c2d63  ! 860: LDUBA_I	lduba	[%r16, + 0x0d63] %asi, %r13
	.word 0x8eac2d0c  ! 861: ANDNcc_I	andncc 	%r16, 0x0d0c, %r7
	.word 0x917c0411  ! 863: MOVR_R	move	%r16, %r17, %r8
	.word 0xf44c0011  ! 863: LDSB_R	ldsb	[%r16 + %r17], %r26
	.word 0xc8740011  ! 864: STX_R	stx	%r4, [%r16 + %r17]
	.word 0xc4fc20f8  ! 866: SWAPA_I	swapa	%r2, [%r16 + 0x00f8] %asi
	.word 0xa92c1011  ! 867: SLLX_R	sllx	%r16, %r17, %r20
	.word 0xa8bc0011  ! 869: XNORcc_R	xnorcc 	%r16, %r17, %r20
	.word 0x937c0411  ! 869: MOVR_R	move	%r16, %r17, %r9
	.word 0x9cb40011  ! 869: ORNcc_R	orncc 	%r16, %r17, %r14
	.word 0xc24c25c6  ! 869: LDSB_I	ldsb	[%r16 + 0x05c6], %r1
thr0_irf_ce_55:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_55), 16, 16),1,IRF,ce,13,x, x,x,x, x,x,x)
	.word 0xc23420ed  ! 872: STH_I	sth	%r1, [%r16 + 0x00ed]
	.word 0x937c2401  ! 874: MOVR_I	move	%r16, 0xfffffff8, %r9
	.word 0x8a040011  ! 874: ADD_R	add 	%r16, %r17, %r5
	.word 0x9c340011  ! 874: ORN_R	orn 	%r16, %r17, %r14
	.word 0xc36c0011  ! 874: PREFETCH_R	prefetch	[%r16 + %r17], #one_read
thr0_irf_ce_56:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_56), 16, 16),1,IRF,ce,58,x, x,x,x, x,x,x)
	.word 0xdc3429ef  ! 877: STH_I	sth	%r14, [%r16 + 0x09ef]
thr0_resum_intr_11:
!$EV trig_pc_d(0,expr(@VA(.MAIN.thr0_resum_intr_11), 16, 16)) -> intp(0, 3, 1)
	wr      %r0, 0x5, %asr26
thr0_irf_ce_57:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_57), 16, 16),1,IRF,ce,52,x, x,x,x, x,x,x)
	.word 0xdc34218d  ! 882: STH_I	sth	%r14, [%r16 + 0x018d]
	.word 0xa82c2c43  ! 884: ANDN_I	andn 	%r16, 0x0c43, %r20
        wr %g0, 0x4, %fprs
thr0_irf_ce_58:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_58), 16, 16),1,IRF,ce,8,x, x,x,x, x,x,x)
	.word 0xe82c2675  ! 887: STB_I	stb	%r20, [%r16 + 0x0675]
	.word 0x92b40011  ! 889: ORNcc_R	orncc 	%r16, %r17, %r9
	.word 0xad7c2401  ! 889: MOVR_I	move	%r16, 0xfffffff8, %r22
	.word 0x952c3001  ! 889: SLLX_I	sllx	%r16, 0x0001, %r10
	.word 0xd2d424e3  ! 889: LDSHA_I	ldsha	[%r16, + 0x04e3] %asi, %r9
	.word 0xd2342a5b  ! 891: STH_I	sth	%r9, [%r16 + 0x0a5b]
	.word 0xa6142daa  ! 893: OR_I	or 	%r16, 0x0daa, %r19
	.word 0xaa442cf8  ! 893: ADDC_I	addc 	%r16, 0x0cf8, %r21
	.word 0xb6b4298b  ! 893: ORNcc_I	orncc 	%r16, 0x098b, %r27
        wr %g0, 0x4, %fprs
	.word 0xf67421a5  ! 895: STX_I	stx	%r27, [%r16 + 0x01a5]
	.word 0x98440011  ! 897: ADDC_R	addc 	%r16, %r17, %r12
	.word 0xa4ac2f39  ! 897: ANDNcc_I	andncc 	%r16, 0x0f39, %r18
	.word 0x833c0011  ! 897: SRA_R	sra 	%r16, %r17, %r1
	.word 0xf1f42011  ! 897: CASXA_R	casxa	[%r16]%asi, %r17, %r24
	.word 0xf0742409  ! 899: STX_I	stx	%r24, [%r16 + 0x0409]
	.word 0xa6bc0011  ! 901: XNORcc_R	xnorcc 	%r16, %r17, %r19
	.word 0xa6040011  ! 901: ADD_R	add 	%r16, %r17, %r19
	.word 0xae342a29  ! 901: ORN_I	orn 	%r16, 0x0a29, %r23
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xec340011  ! 902: STH_R	sth	%r22, [%r16 + %r17]
	.word 0xced41011  ! 904: LDSHA_R	ldsha	[%r16, %r17] 0x80, %r7
thr0_irf_ce_59:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_59), 16, 16),1,IRF,ce,9,x, x,x,x, x,x,x)
	.word 0xce342357  ! 907: STH_I	sth	%r7, [%r16 + 0x0357]
	.word 0x81dc2725  ! 909: FLUSH_I	dis not found

	.word 0xd4240011  ! 910: STW_R	stw	%r10, [%r16 + %r17]
	.word 0xd53c0011  ! 912: STDF_R	std	%f10, [%r17, %r16]
	.word 0xf4240011  ! 913: STW_R	stw	%r26, [%r16 + %r17]
	.word 0xbe1c0011  ! 915: XOR_R	xor 	%r16, %r17, %r31
	.word 0xa69c0011  ! 915: XORcc_R	xorcc 	%r16, %r17, %r19
	.word 0xc4042821  ! 915: LDUW_I	lduw	[%r16 + 0x0821], %r2
	.word 0x8d3c3001  ! 916: SRAX_I	srax	%r16, 0x0001, %r6
	.word 0xaa9c0011  ! 918: XORcc_R	xorcc 	%r16, %r17, %r21
	.word 0x89240011  ! 918: MULScc_R	mulscc 	%r16, %r17, %r4
	.word 0xc82c2959  ! 920: STB_I	stb	%r4, [%r16 + 0x0959]
	.word 0x9a340011  ! 922: ORN_R	orn 	%r16, %r17, %r13
        wr %g0, 0x4, %fprs
	.word 0xee240011  ! 923: STW_R	stw	%r23, [%r16 + %r17]
	.word 0xbeac2357  ! 925: ANDNcc_I	andncc 	%r16, 0x0357, %r31
	.word 0xb8140011  ! 925: OR_R	or 	%r16, %r17, %r28
	.word 0x95641811  ! 925: MOVcc_R	<illegal instruction>
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xf62c0011  ! 926: STB_R	stb	%r27, [%r16 + %r17]
	.word 0x8a0c284b  ! 928: AND_I	and 	%r16, 0x084b, %r5
	.word 0x81880000  ! 928: RESTORED	saved
	.word 0x9ca40011  ! 929: SUBcc_R	subcc 	%r16, %r17, %r14
	.word 0x9cbc2cb4  ! 931: XNORcc_I	xnorcc 	%r16, 0x0cb4, %r14
	.word 0x9c9c0011  ! 931: XORcc_R	xorcc 	%r16, %r17, %r14
	.word 0xaeb40011  ! 931: ORNcc_R	orncc 	%r16, %r17, %r23
	.word 0x8143c000  ! 931: STBAR	stbar
	.word 0xb8bc2ca0  ! 932: XNORcc_I	xnorcc 	%r16, 0x0ca0, %r28
	.word 0xa73c0011  ! 934: SRA_R	sra 	%r16, %r17, %r19
	.word 0xda5c0011  ! 934: LDX_R	ldx	[%r16 + %r17], %r13
	.word 0xce340011  ! 935: STH_R	sth	%r7, [%r16 + %r17]
	.word 0x8c1c239e  ! 937: XOR_I	xor 	%r16, 0x039e, %r6
	.word 0x9b3c2001  ! 937: SRA_I	sra 	%r16, 0x0001, %r13
	.word 0x840c0011  ! 937: AND_R	and 	%r16, %r17, %r2
thr0_resum_intr_12:
!$EV trig_pc_d(0,expr(@VA(.MAIN.thr0_resum_intr_12), 16, 16)) -> intp(0, 3, 1)
	wr      %r0, 0x5, %asr26
	.word 0xda240011  ! 938: STW_R	stw	%r13, [%r16 + %r17]
	.word 0x9a9c2190  ! 940: XORcc_I	xorcc 	%r16, 0x0190, %r13
	.word 0x8a940011  ! 940: ORcc_R	orcc 	%r16, %r17, %r5
	.word 0x8143e01f  ! 940: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #StoreStore | #Lookaside 
	.word 0xca74271d  ! 942: STX_I	stx	%r5, [%r16 + 0x071d]
	.word 0xb6342466  ! 944: ORN_I	orn 	%r16, 0x0466, %r27
	.word 0xa42c2dec  ! 944: ANDN_I	andn 	%r16, 0x0dec, %r18
	.word 0xab342001  ! 944: SRL_I	srl 	%r16, 0x0001, %r21
	.word 0x8143c000  ! 944: STBAR	stbar
	.word 0xea34221f  ! 946: STH_I	sth	%r21, [%r16 + 0x021f]
	.word 0x9b643801  ! 948: MOVcc_I	<illegal instruction>
	.word 0x992c0011  ! 948: SLL_R	sll 	%r16, %r17, %r12
	.word 0x82140011  ! 948: OR_R	or 	%r16, %r17, %r1
	.word 0x99a00051  ! 948: FMOVd	fmovd	%f48, %f12
thr0_irf_ce_60:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_60), 16, 16),1,IRF,ce,50,x, x,x,x, x,x,x)
	.word 0xd82c253d  ! 951: STB_I	stb	%r12, [%r16 + 0x053d]
	.word 0x962c0011  ! 953: ANDN_R	andn 	%r16, %r17, %r11
	.word 0x903c0011  ! 953: XNOR_R	xnor 	%r16, %r17, %r8
	.word 0x82bc2250  ! 953: XNORcc_I	xnorcc 	%r16, 0x0250, %r1
	.word 0xd0a41011  ! 953: STWA_R	stwa	%r8, [%r16 + %r17] 0x80
	.word 0xc4240011  ! 954: STW_R	stw	%r2, [%r16 + %r17]
	.word 0xa4b40011  ! 956: ORNcc_R	orncc 	%r16, %r17, %r18
	.word 0xdb242540  ! 956: STF_I	st	%f13, [0x0540, %r16]
	.word 0xda24208b  ! 958: STW_I	stw	%r13, [%r16 + 0x008b]
	.word 0x981c0011  ! 960: XOR_R	xor 	%r16, %r17, %r12
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xd22c0011  ! 961: STB_R	stb	%r9, [%r16 + %r17]
	.word 0xf0d420e0  ! 963: LDSHA_I	ldsha	[%r16, + 0x00e0] %asi, %r24
	.word 0xf0242445  ! 965: STW_I	stw	%r24, [%r16 + 0x0445]
	.word 0xaec40011  ! 967: ADDCcc_R	addccc 	%r16, %r17, %r23
	.word 0x9aac22c4  ! 967: ANDNcc_I	andncc 	%r16, 0x02c4, %r13
	.word 0xa6bc216e  ! 967: XNORcc_I	xnorcc 	%r16, 0x016e, %r19
	.word 0xb0f422ae  ! 967: UDIVcc_I	udivcc 	%r16, 0x02ae, %r24
	.word 0x9a242ad4  ! 968: SUB_I	sub 	%r16, 0x0ad4, %r13
	.word 0xa66c0011  ! 970: UDIVX_R	udivx 	%r16, %r17, %r19
thr0_irf_ce_61:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_61), 16, 16),1,IRF,ce,64,x, x,x,x, x,x,x)
	.word 0xe62c25b3  ! 973: STB_I	stb	%r19, [%r16 + 0x05b3]
	.word 0x85a01031  ! 975: FsTOx	dis not found

thr0_irf_ce_62:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_62), 16, 16),1,IRF,ce,71,x, x,x,x, x,x,x)
	.word 0xc42c2a23  ! 978: STB_I	stb	%r2, [%r16 + 0x0a23]
	.word 0x8cbc217a  ! 980: XNORcc_I	xnorcc 	%r16, 0x017a, %r6
	.word 0xfeec2e78  ! 980: LDSTUBA_I	ldstuba	%r31, [%r16 + 0x0e78] %asi
	.word 0xb2a42539  ! 981: SUBcc_I	subcc 	%r16, 0x0539, %r25
	.word 0x857c2401  ! 983: MOVR_I	move	%r16, 0xfffffff8, %r2
	.word 0x945c260a  ! 983: SMUL_I	smul 	%r16, 0x060a, %r10
	.word 0x96340011  ! 984: SUBC_R	orn 	%r16, %r17, %r11
	.word 0x84ac0011  ! 986: ANDNcc_R	andncc 	%r16, %r17, %r2
	.word 0x921c21a7  ! 986: XOR_I	xor 	%r16, 0x01a7, %r9
	.word 0x857c0411  ! 986: MOVR_R	move	%r16, %r17, %r2
thr0_resum_intr_13:
!$EV trig_pc_d(0,expr(@VA(.MAIN.thr0_resum_intr_13), 16, 16)) -> intp(0, 3, 1)
	wr      %r0, 0x5, %asr26
	.word 0xc42c2f67  ! 988: STB_I	stb	%r2, [%r16 + 0x0f67]
thr0_resum_intr_14:
!$EV trig_pc_d(0,expr(@VA(.MAIN.thr0_resum_intr_14), 16, 16)) -> intp(0, 3, 1)
	wr      %r0, 0x5, %asr26
	.word 0xc6340011  ! 991: STH_R	sth	%r3, [%r16 + %r17]
	.word 0x92ac0011  ! 993: ANDNcc_R	andncc 	%r16, %r17, %r9
	.word 0x92bc26bf  ! 993: XNORcc_I	xnorcc 	%r16, 0x06bf, %r9
	.word 0x9e9c0011  ! 993: XORcc_R	xorcc 	%r16, %r17, %r15
	.word 0xe81c2499  ! 993: LDD_I	ldd	[%r16 + 0x0499], %r20
	.word 0x873c1011  ! 994: SRAX_R	srax	%r16, %r17, %r3
	.word 0x96ac2f51  ! 996: ANDNcc_I	andncc 	%r16, 0x0f51, %r11
	.word 0x90440011  ! 996: ADDC_R	addc 	%r16, %r17, %r8
thr0_resum_intr_15:
!$EV trig_pc_d(0,expr(@VA(.MAIN.thr0_resum_intr_15), 16, 16)) -> intp(0, 3, 1)
	wr      %r0, 0x5, %asr26
	.word 0xbc340011  ! 997: SUBC_R	orn 	%r16, %r17, %r30
	.word 0x88c40011  ! 999: ADDCcc_R	addccc 	%r16, %r17, %r4
	.word 0xab343001  ! 999: SRLX_I	srlx	%r16, 0x0001, %r21
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
	ta    T_GOOD_TRAP

.data
	.word  0x39fe98bc,0xf2f367c5,0xbc4c6a8c,0xe65601a7
	.word  0x56140bb5,0x6b07a10d,0x084dabbe,0x0e7de39c
	.word  0x824eefa9,0x8fff4fad,0x4f651f0c,0x5d0e6ef0
	.word  0x7a3b80a9,0x7222f8a8,0x2e6eeeb0,0xc2df9945
	.word  0x43fe047e,0x87c2f080,0x2c0941e0,0xe479a9b9
	.word  0x8fa16923,0xb392287e,0x6d6e93e8,0x3aeb8615
	.word  0x9f59e5e8,0xab5af74e,0x95a4c078,0xd7c6bebc
	.word  0xa3c44592,0xe81d985a,0x2e4c63bc,0x6d8f0008
	.word  0x2dc31eb4,0x22c464eb,0x162cf034,0xad846bd6
	.word  0xf99b21da,0xe339b19b,0xc78033de,0x10b0c754
	.word  0x108ca4f3,0xf17f335f,0x082b894d,0xaab89d84
	.word  0x011049b1,0x6d9bf9c9,0x5abbce92,0x86477ed9
	.word  0xf8061fe5,0xd44d77d4,0xec6f4238,0xc10360f1
	.word  0x357291a2,0x47afd936,0x472aae0c,0xa346eba6
	.word  0xf54eaf45,0xd879db4e,0x5ca91945,0xce5da0bf
	.word  0xbab8b268,0xd3e2f937,0x0aafdcb1,0x34bdf612
	.word  0x33e7db9c,0x948bfcdc,0xdf11990b,0x71ceb6de
	.word  0x4d1a0b37,0x7fa4a499,0x4a56c1e3,0x010af649
	.word  0x296cb136,0xc2c2da3a,0xc0509501,0x05f804bc
	.word  0xae37dee5,0xe5a2d7f8,0x7fd9a1f1,0xfd96e70c
	.word  0xdfb34cfc,0x08486daf,0x71267ef5,0x8cc415f7
	.word  0x4c3d63b1,0xf3bae37c,0x4a582c5b,0x04463464
	.word  0xd5104507,0xe0d2b6da,0x098e530d,0xcb52c0cc
	.word  0xd3d5999e,0x5c738b8e,0xefbf1bc4,0x56cf6546
	.word  0x9d52d6ad,0x87158531,0xa4c5e070,0x742ead7f
	.word  0xeac120f1,0x2add1240,0x89575caf,0x8aa9d379
	.word  0x550bc815,0xdf2facb0,0x1bfcc08d,0x7563a74f
	.word  0x055f1b5c,0x68effcc3,0xa5ea26f7,0x24ca6904
	.word  0x242011c1,0x21d59469,0x02a37c40,0x2ab9c73a
	.word  0x15092dd2,0xe5db783d,0xb9e70921,0x84d5f22b
	.word  0x9231dd8f,0x6f5aaab6,0x77fa7183,0xec17ffa2
	.word  0x28362779,0x8804b399,0xf47f4f74,0x7c0f4c39
	.word  0x22ab692e,0x8e3b1b6d,0xa0ad1c23,0x8c549359
	.word  0x7f504fa6,0x9ab8a7e9,0xa1823c42,0x1a5d7b88
	.word  0x3c556925,0xf800af93,0x60d6f7e8,0x6efe0981
	.word  0x5b999cce,0xada404b0,0x74d68029,0xb60dc34b
	.word  0x353c5883,0x7942947a,0xf266b7a6,0xc82e01d3
	.word  0x966260d3,0x2716eb04,0xe169a42f,0xc6db4402
	.word  0xadfee8fb,0x58659454,0xdbc4b846,0x8e62dcf2
	.word  0xd457f3f5,0x318a2da0,0x2d476cf1,0xfe739a6c
	.word  0xf26c83a4,0x63b3b842,0x858222f0,0xc1bb19f7
	.word  0x4c51725d,0x095cddf1,0x1e1f62e2,0xfebd40ed
	.word  0x8b350037,0xf7175f46,0x600f0845,0x06b774bd
	.word  0xf782cf03,0x2a58f79d,0x5d6915ed,0xea65152d
	.word  0x94872034,0x87a26b46,0x12d9e792,0x0db758a9
	.word  0xa6a035d3,0xe22a6209,0xd98a9694,0x9efa0870
	.word  0x21550374,0x29673145,0xb6948067,0x3023eca3
	.word  0x73382d56,0x36702584,0xd33810d6,0xefed4032
	.word  0x8ed5fcb5,0xd4690058,0x056b3209,0x68005f0c
	.word  0x3588a11a,0x509aa8d2,0x6d52543b,0x92a117f1
	.word  0x9b4ef443,0x485807b0,0xedba170d,0xde612266
	.word  0x531a1ce1,0x412ae8a2,0x62a9b526,0x47d03a13
	.word  0x25469a47,0x1b061474,0xf26c9625,0xdb1b1c2d
	.word  0x726af0d1,0x7301cf1f,0xaf87d757,0xa7b63fec
	.word  0x1f7a513d,0x0e81a26e,0xa83fe2b1,0x3d42e741
	.word  0x9f2fc253,0x7a3b187c,0x8d7d6d51,0x3c32dfe1
	.word  0xa417e153,0x73fbb349,0x124e82fd,0xcea5f01d
	.word  0x078b78d5,0x1ac367db,0xf7bbce0f,0xdce207f5
	.word  0x97e85f9a,0x6e1bdb40,0xf02af154,0x58ed222e
	.word  0x6f281582,0xa1369a0f,0x51ed2ca1,0xe3b212d0
	.word  0xb91fe4bc,0xc2f818bb,0x478aa304,0x84b66c52
	.word  0xc3f58739,0x17b47729,0xb931954e,0x030e3aa2
	.word  0x3400d45a,0x812cff44,0x4546d2b9,0xd4a5069a
	.word  0x425147df,0xc29520ca,0x87722716,0x3fd1cd23
	.word  0x84616269,0x94df9653,0xc920ccbe,0x36933743
	.word  0x4e2d6d86,0x8f084b59,0x89fc4571,0xaf1dc803
	.word  0x7e28f5ed,0x593d63cc,0x6eb37a30,0x37a8cbeb
	.word  0x563680b8,0xc79d3570,0xbb1283cf,0x7b48dc66
	.word  0xacf677cb,0x936455f7,0x625c2b27,0xd37e2027
	.word  0x69b7e413,0x8d9de115,0xd1ac52dc,0xce812450
	.word  0x24e7899e,0xbf777e5e,0x9c21e8bb,0x07e896a9
	.word  0x23322d65,0x64cc4b26,0x30317ebe,0x332c2eaa
	.word  0x38498e57,0x49e50ac1,0x21ebdfc3,0x1463a780
	.word  0x433a7b14,0x07b72d8f,0x465c9d64,0x392a0e9e
	.word  0xfbe8ab31,0x705c73b0,0x002aba57,0x9e48ca9f
	.word  0x0d833383,0x017e213d,0xaa53fcde,0xaecd9d71
	.word  0x77d6c3cc,0xe495f5a0,0xa7d0e112,0x5a52f657
	.word  0xda4453dc,0x171b7cdf,0x55bc72a7,0xc62a0a02
	.word  0x5cbbc707,0xd15da5c4,0x35069747,0xe390ae7b
	.word  0x0636503e,0xdb2cacc2,0x0fd798d7,0x75e59ca0
	.word  0x7cea7a5d,0xd522900a,0xb90f46fb,0xc3a81059
	.word  0xe08f01f0,0xd453110b,0x666c4625,0x507834ca
	.word  0xe47898e3,0xc3a780c9,0x5497647d,0xc3c271c9
	.word  0x631f9b87,0x68e19e25,0xa99c92d4,0x51552581
	.word  0xd2f7b67a,0xfad81d6e,0xd7989f9f,0x1bb66f4a
	.word  0x29231526,0x2a4872c2,0xa14ec8a8,0x8f308e84
	.word  0x30aeb349,0xb9ab283f,0x0141d629,0x404f66f7
	.word  0xa477abe3,0xb5c81e11,0x74144e93,0xbfd5c3fc
	.word  0xe710cd20,0x60e2a6fe,0x06c84716,0xa95b1d3c
	.word  0xb7bc6d69,0xf415cabf,0x8b8572d4,0xf7d007f8
	.word  0x5f744106,0xc2266894,0xea39feec,0x826a7e19
	.word  0xa0665a83,0x260f5b41,0xa6217009,0x456b1ca0
	.word  0xab92d720,0x6df4c77b,0x34eb9b41,0xef99d998
	.word  0xaa1c36e9,0xadccbe4c,0x45f51a25,0xff0eba42
	.word  0x7fd8c347,0x8d8effb2,0xd68a5d2e,0x563c9da5
	.word  0xea330405,0x2b07f537,0x541ddfff,0xedf18bc3
	.word  0xaa355028,0x36ed1af4,0x4315adf2,0x4442f667
	.word  0xdbc0547e,0x2786db98,0x4cd23216,0x9ba064c4
	.word  0x7053425a,0x6c4f1697,0xbf819fe1,0xd477cda6
	.word  0xdeb3db87,0xf6665179,0x3693d041,0xe7abe41e
	.word  0x2c6c1e8d,0xbcaec18d,0x4e352e80,0xce82c927
	.word  0x8f16ce9e,0x1923de63,0x361a55c6,0x0174e9ce
	.word  0xd0e72473,0x5fb381c9,0xcd2d993b,0x2585d900
	.word  0x101793a3,0x64aeec15,0x4f6e289e,0x7f8e0b2d
	.word  0xf2b73e1f,0x1f213813,0x3d058195,0xa05368bf
	.word  0xb98fa951,0xd19d8c48,0xd66bf8d5,0xabecf360
	.word  0x4b4b35b1,0x2e523ae4,0x0285a18d,0x94e570f5
	.word  0x195846de,0xd6b8a9d8,0xfaa2e3f4,0xd08c025a
	.word  0x21476946,0xfbe000c8,0x593b8215,0x7305aaf7
	.word  0x48701055,0xd0c80cf1,0xdb6afb09,0x14c70b8c
	.word  0xec90775d,0x0f7de5f1,0x2d798a14,0x736e084a
	.word  0x5e799cc3,0x709680a8,0x70e36f7f,0x29c0bb04
	.word  0x40a0a3f4,0xa54c093c,0x60991f6b,0xe5a11a00
	.word  0x00243f9d,0xec61b736,0x19c8b1e7,0x7a6259c1
	.word  0xec1eb33a,0x41190752,0x3288c8c2,0x309efe91
	.word  0x753f7e46,0x6b175ff2,0x9aeda266,0xcf525071
	.word  0xce34bb12,0xaf49159b,0x227519ab,0x8c5b3289
	.word  0x88563507,0x52932d68,0xc119ac2f,0x12c67e56
	.word  0x5bba9027,0xf9a75345,0xa444cc40,0xac1a3d6a
	.word  0xa5429ed6,0xdbb1cfa0,0xa040ed64,0xadb430b4
	.word  0x4b0aa569,0x821d240d,0x131db9a2,0x91236464
	.word  0xe78f6403,0x4e7a3b96,0xcf25af7a,0x76297dcd
	.word  0xf9eaf6d7,0x198bddd9,0xeb7d98ef,0xc5955f88
	.word  0x8de59dfd,0x47f2d55e,0x191be1e1,0x87de89b9
	.word  0x81d818cb,0x3f89d96c,0x3d2659ce,0x03465cdc
	.word  0xdbdc5735,0x96c943ff,0x5fcd006d,0x3d9f3b04
	.word  0x61d2808d,0x6b020db1,0x9c0d2deb,0x129a0742
	.word  0xf171cdf7,0x8beef7aa,0x6301195a,0x5ec95b8b
	.word  0x585ce330,0xe9724776,0x14d9f89c,0xe42c66e0
	.word  0x829849cb,0x034b05f8,0x56c29e9e,0x67836360
	.word  0x6bc22a71,0x4aab191c,0xdf6818bd,0x4b398f5d
	.word  0x3ec7ff6f,0xb4426ecb,0xa550ad86,0x7b40438a
	.word  0x53c5565b,0x1896c6ad,0x64afdfbd,0x7d0e5925
	.word  0x5264a462,0x9191da2c,0x34d82662,0x79252422
	.word  0xde9ac427,0x809b9986,0x3dc6882a,0x45f22c55
	.word  0x3185dad1,0x514d9847,0xb9651df7,0x19a38ab6
	.word  0xb897c7ea,0xa5f204de,0x7d53b3b9,0xb9d32121
	.word  0x068c1cfc,0x322920c6,0x51ce6657,0xb8fac504
	.word  0xee5e6658,0x3a9f1eff,0xd07ac454,0x10d67192
	.word  0x4656f5c7,0x35dace79,0x2a555e76,0x8a410daf
	.word  0xd238ef16,0x3d6f43fc,0x176440d2,0xfcdd38b3
	.word  0x618d2c17,0x43004f47,0x0672fd93,0x3a42a837
	.word  0x2f62cc3a,0xbacb5662,0x6b4751b9,0x159e805a
	.word  0x851f37b2,0xf792f021,0xe1259be0,0x03a9d461
	.word  0x8e5bd0d7,0xec736b8c,0x15cc0694,0x8fab7ad1
	.word  0xb5495559,0x645c1532,0x66523a35,0x095ac0f6
	.word  0x1fd03e08,0xbe103bfc,0x07d2bd49,0x0cb27e88
	.word  0xf10d681f,0x12713962,0x90d69ac1,0x367e518b
	.word  0x3e56d872,0x4c0cf3af,0xfa203972,0x5d9730dc
	.word  0x258359de,0xa4898874,0xdfdbbb1b,0x82696aa2
	.word  0x639a8b1f,0x93be90d8,0x4f7bd45e,0xe070cf1c
	.word  0x36d0316a,0xe587fcb0,0x6e260c45,0xafb203f6
	.word  0xa0b89652,0x403be93f,0x1393cdd6,0xba70fc29
	.word  0x962c573f,0x32fe8697,0x350ae789,0x2cb53acd
	.word  0x3b7e32fe,0xc4a3afc5,0x2b768595,0x28301742
	.word  0xc5fd34b1,0xaea75d0b,0xed5fa98d,0x37e17f29
	.word  0x76fab2d0,0x0b748b0f,0x89357ab6,0xbd632459
	.word  0xd543996a,0x15ad698a,0x878da3e1,0x44517884
	.word  0xf47f13ec,0xb7b90238,0xa91917fa,0xd8acc2c9
	.word  0x443f745e,0xe9803e49,0x8dfa6faf,0xfb620a7c
	.word  0x7a99ca9c,0x4134377d,0xb70f83a7,0x4fb5accc
	.word  0x37250629,0x002c57d1,0xa043d8f4,0xfba7ea46
	.word  0x3d29f38e,0x29b67470,0x56fea7f5,0x7eb04be5
	.word  0x5b17dc5c,0xe2403730,0x5f956ede,0xb4778a40
	.word  0x0b42fad9,0xbafe39d9,0x358377f9,0x96780209
	.word  0x60fc129a,0x6132f76d,0x13bac976,0x56204520
	.word  0x1d7dc446,0xcad0b36b,0xd6225d41,0x589debbb
	.word  0x48396221,0x08ce9925,0xa420fab2,0x53c267b2
	.word  0xae9e1204,0xdf4597c6,0xf7d8e6c5,0xd3877689
	.word  0x279b4814,0xd9f05893,0x1378d58e,0xaa3271bc
	.word  0xb6b20725,0x87f00557,0x1f27ae5c,0xec7168f5
	.word  0xc65f50c8,0xe5d6049a,0xa4b2ab6e,0x89fbe21d
	.word  0x3c5b7a03,0x33bcebd1,0x0681db15,0x22918988
	.word  0x35904668,0xb46eed6f,0x6b1e7415,0xab419346
	.word  0x2606b0a1,0x2ab76ce4,0xb726b4c0,0x091d0752
	.word  0x5998fee1,0xd117d960,0x2b8b9b1e,0xf31ca99c
	.word  0x0ff99db2,0xd6b8b31d,0x4d8e27e1,0x13c51e0f
	.word  0x9d7a59b3,0x00fc5d76,0xd97f1506,0x445dead1
	.word  0x97a4b049,0xee6c2e51,0xfa98c04f,0x6d76850a
	.word  0x4d9d4923,0x537d0d9e,0x9205263c,0x6010472e
	.word  0x9befbbfa,0xa3c2ed74,0x404c84bd,0x41bdcf7b
	.word  0xcbbe5ddf,0x98803c0e,0x05831d5d,0xfef8d872
	.word  0x35ceace3,0x1dbd5e61,0x79806f0b,0xb82e7dcd
	.word  0x6556f12e,0x2cf770a3,0xc16d9905,0x194bf459
	.word  0xc973c6ad,0x3a9906f1,0xeafb9d5a,0x5a6a142c
	.word  0x798ba9b6,0xdbb9db29,0x1c0841ee,0x6527c7d3
	.word  0xe614a985,0x949f9043,0xf9c4d20e,0x708054cf
	.word  0x5d606355,0xfdfa6729,0x722243a0,0x21839bee
	.word  0x40dfbaa7,0xf792d11f,0xa307c0c2,0xa8e675e4
	.word  0xdb1e6157,0xf626d2d0,0xc050461b,0x84b09276
	.word  0x5b91847a,0xa3854b73,0xdb904b7c,0x61f1af2b
	.word  0x4f2e2cb2,0xdeeee96b,0x1ba482b0,0xb689e6ed
	.word  0x9293c995,0xb5b7a15c,0xdfbbb007,0x4e06e8ef
	.word  0x3e50ddc9,0x66681494,0x265db3fd,0x2b2ee519
	.word  0x150bf57d,0x5f49976c,0xc9232c56,0xea12ffa1
	.word  0x18def3d6,0x67c91103,0x901c01a4,0x53938b4c
	.word  0x56ecbe11,0xe5078a74,0xb120c742,0x28e275d5
	.word  0x2511f6d3,0xbf73f905,0x804eb243,0x21e49ffd
	.word  0x8fc79862,0xeb9634f1,0x3bf543a6,0x0d587b27
	.word  0xf56d4111,0x08c8e265,0xb88570e6,0x2061d458
	.word  0x71a992ed,0x8cfa96cc,0xf7a1cd12,0x98afbe0e
	.word  0xaa800563,0x13755ce9,0x34913ffe,0x44d5c08a
	.word  0xd60fe914,0xdda6d425,0x98f6a931,0x6d822655
	.word  0x4bfeccf6,0x428454ec,0x91aa6cfc,0xe4f2e508
	.word  0x27003955,0x45385efc,0x5924ca9f,0x4f41aa84
	.word  0xaf1579e0,0x7b073f41,0x8ab400f9,0xd14192f8
	.word  0xb6d82ea8,0xfb48d5da,0xda5470d9,0x8bb00d49
	.word  0xee1a488a,0xdcacd328,0xf803e482,0x57650bf2
	.word  0x190b992c,0x63122218,0x6ac57aef,0x00b8e27a
	.word  0x542c2007,0x8b32d593,0x8b339498,0xd56c7c24
	.word  0x26439c97,0x8f8bd763,0xff0f5916,0x9a1a7fc6
	.word  0x60d1fb94,0x24584d6f,0x6bb48910,0x18607333
	.word  0xd3a1dbc7,0xad3cdbd3,0x7911bce9,0x6f6503a3
	.word  0xd57c4566,0xcc7f7b94,0xefff05a6,0x64159f92
	.word  0x966570ba,0xe6e37645,0x016b3647,0x9896b1f3
	.word  0xc7e0b0e1,0x2c35f0cb,0x1609cdd7,0x55180cf1
	.word  0xab0a7279,0x95613077,0x0f12f273,0x41a96e14
	.word  0x3858cded,0xe6bc19e7,0xa444da3a,0xbb5af6b2
	.word  0x7e172270,0x8d7ba510,0x5884bc93,0xd95bef2b
	.word  0x79098e35,0xb3144d50,0x3a3b293f,0x74b8c07b
	.word  0x6bc1fdec,0xac57232f,0xeef5ada6,0x8c922362
	.word  0xfb128850,0x7361bad4,0xc4181ce0,0x91a89a6c
	.word  0xd721e788,0xbe252eb0,0x38d28440,0x9e4fc819
	.word  0x8536ca7b,0xec4e438e,0x54bf6e65,0x3ccf02a9
	.word  0xef6bbbc9,0xbb487cd7,0xc2987863,0x22b8bc29
	.word  0x55382ee5,0x60a9ca86,0x3363f350,0xe6cc9cae
	.word  0xcb43f678,0xe6476a03,0xf37dcbe9,0xd59a0a46
	.word  0xff8207bc,0xa8b69da5,0x8724786e,0xc6444af3
	.word  0x56c46f7c,0x4955e826,0x77185001,0xbb630905
	.word  0x18886f75,0x0f13d674,0x1ee5040f,0x496d40c8
	.word  0x87f49b28,0x2d6a0a87,0x6a5bf8d5,0xd8b4d7b7
	.word  0x85e14627,0x6d5246a5,0xb43af766,0xd1ca6b7f
	.word  0x677f901a,0xe5cf1862,0xd4c829e1,0x71f95a80
	.word  0x231773ff,0xb9361964,0x4417dfbc,0x26c60661
	.word  0x42a7b8e5,0x79991adb,0x6ceba6d3,0xbcb2e9ed
	.word  0x2f3b98b7,0xcc37b5db,0x39296ef8,0xd8b7e3ee
	.word  0x880e2e5e,0x14e0204a,0x71c5ab37,0x494ffd64
	.word  0x2c9fab66,0x08e3862d,0xc656cd4d,0x9e184ec2
	.word  0x5a151058,0x59616250,0x69499d09,0xdabe3ef9
	.word  0x974fe562,0x5c3c1e7c,0x9ea4f255,0x9d1e281b
	.word  0x77ddbcfc,0x396c15a1,0x3033ea83,0xe0a33fc0
	.word  0x2d4ea5b0,0x012e0555,0xd424021f,0x4f4937ae
	.word  0xd43c731c,0xf7e3e608,0xa6e163ec,0x3cfbbb62
	.word  0x9473134f,0x7c4b6c1c,0x3b135f2e,0x373a935d
	.word  0xce284f57,0xbb86a3b8,0x0b74d472,0x0b276556
	.word  0x17ec4314,0xc200ca19,0x73ec135d,0xffb59134
	.word  0xb0652b38,0xdcdef4cb,0x09ff98c7,0x81a756b7
	.word  0x75d43afe,0xa836cca8,0xd7235539,0x8c1eb68f
	.word  0xdc1559ed,0x812ce2a8,0xdb91dba2,0x2ef4fbd1
	.word  0x3f6ab76e,0xc24645da,0x36eaa56c,0xdb83e5ac
	.word  0x24c9ac7d,0xf83efad7,0x94225db2,0xcce6f323
	.word  0x7e9461ca,0x7fb3b3e3,0x66f626cc,0x0ee191c1
	.word  0x67ba415a,0x813ab79f,0xd18add9c,0x4d1f7f75
	.word  0x40f3b244,0x3dd0919b,0x62c17df1,0x1afc3f53
	.word  0x21c4ec39,0x08c6737d,0xc98582e6,0x41923a88
	.word  0x8aecaab2,0xc0b86727,0x25883d3e,0x84a69028



#if 0
!!# /*
!!#  */
!!# 
!!# %%section c_declarations
!!# 
!!# 
!!#   int i, j;
!!#   int irf_err_cnt = 0;
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
!!#   IJ_set_ropr_fld ("diag.j", 50, ijdefault, Ft_Rs1, "{16}");
!!#   IJ_set_ropr_fld ("diag.j", 51, ijdefault, Ft_Rs2, "{17}");
!!#   IJ_set_ropr_fld ("diag.j", 52, ijdefault, Ft_Rd, "{1..15, 18..31}");
!!# //  IJ_set_ropr_fld (ijdefault, Fm_align_Rd, "1'b1");
!!#   IJ_set_ropr_fld ("diag.j", 54, ijdefault, Ft_Simm13, "13'b0rrrrrrrrrrrr");
!!# //  IJ_set_ropr_fld (ijdefault, Fm_align_Simm13, "3'b111");
!!#   IJ_set_ropr_fld ("diag.j", 56, ijdefault, Ft_Imm_Asi, "{0x80}");
!!#   IJ_set_ropr_fld ("diag.j", 57, ijdefault, Ft_Cc1_f2, "1'br");
!!#   IJ_set_ropr_fld ("diag.j", 58, ijdefault, Ft_Cc0_f2, "1'b0");
!!#   IJ_set_ropr_fld ("diag.j", 59, ijdefault, Ft_P, "1'br");
!!#   IJ_set_ropr_fld ("diag.j", 60, ijdefault, Ft_A, "1'br");  
!!#   IJ_set_ropr_fld ("diag.j", 61, ijdefault, Ft_D16, "{0x1, 0x3}");
!!#   IJ_set_ropr_fld ("diag.j", 62, ijdefault, Ft_Disp22, "{0x1, 0x3}");
!!#   IJ_set_ropr_fld ("diag.j", 63, ijdefault, Ft_Disp19, "{0x1, 0x3}");
!!#   IJ_set_ropr_fld ("diag.j", 64, ijdefault, Ft_Disp30, "{0x1, 0x3}");
!!#   IJ_set_ropr_fld ("diag.j", 65, ijdefault, Ft_Cmask, "3'brrr");
!!#   IJ_set_ropr_fld ("diag.j", 66, ijdefault, Ft_Mmask, "4'brrrr");
!!# 
!!#   IJ_set_ropr_fld ("diag.j", 68, Ro_unaligned_addr, Fm_align_Simm13, "3'b000");
!!#   IJ_set_ropr_fld ("diag.j", 69, Ro_unaligned_addr, Ft_Simm13, "13'b0rrrrrrrrrrr1");
!!# 
!!#   IJ_copy_ropr ("diag.j", 71, Ro_rsvd_set, ijdefault);
!!#   IJ_set_ropr_bits ("diag.j", 72, Ro_rsvd_set, 0x1fe0, "13'b1rrr1rr100000");
!!# 
!!# //  IJ_bind_thread_group(th_evnt, 0x7);
!!#   IJ_bind_thread_group("diag.j", 75, th_evnt, 0xf);
!!#   IJ_bind_thread_group("diag.j", 76, th_intr, 0x8);
!!#   IJ_bind_thread_group("diag.j", 77, th_all, 0xf);
!!#   IJ_th_fork_group ("diag.j", 78, th_all);
!!# 
!!#   for (j = 0; j < 8; j++) {
!!# 
!!#      IJ_set_rvar ("diag.j", 82, reg_rand_init, "64'h0000000000000rr0");
!!# 
!!#      IJ_printf ("diag.j", 84, th_all, "        setx  MAIN_BASE_DATA_VA, %%r1, %%r16\n");
!!#      IJ_printf ("diag.j", 85, th_all, "        setx  0x%016llrx, %%g1, %%r17\n", reg_rand_init);
!!# 
!!#      IJ_set_rvar ("diag.j", 87, reg_rand_init, "64'hrrrrrrrr rrrrrrrr");
!!# 
!!#      for (i = 0; i < 16; i++) {
!!#        IJ_printf ("diag.j", 90, th_all, "        setx  0x%016llrx, %%g1, %%r%d\n", reg_rand_init, i);
!!#      }
!!#      for (i = 18; i < 32; i++) {
!!#        IJ_printf ("diag.j", 93, th_all, "        setx  0x%016llrx, %%g1, %%r%d\n", reg_rand_init, i);
!!#      }
!!# 
!!#      IJ_printf ("diag.j", 96, th_all, "	save %%r0, %%r0, %%r31\n");
!!#   }
!!# 
!!#   IJ_printf ("diag.j", 99, th_evnt, "        wr  %%g0, 0x80, %%asi\n");
!!#   IJ_printf ("diag.j", 100, th_evnt, "        wr %%g0, 0x4, %%fprs\n");
!!#   IJ_init_fp_regs ("diag.j", 101, th_evnt, 16);
!!# 
!!# }
!!# 
!!# %%
!!# %%section finish
!!# {
!!# 
!!# 
!!#   IJ_printf ("diag.j", 105, th_all, "	nop\n");
!!#   IJ_printf ("diag.j", 106, th_all, "	nop\n");
!!#   IJ_printf ("diag.j", 107, th_all, "	nop\n");
!!#   IJ_printf ("diag.j", 108, th_all, "	nop\n");
!!#   IJ_printf ("diag.j", 109, th_all, "	nop\n");
!!#   IJ_printf ("diag.j", 110, th_all, "	nop\n");
!!#   IJ_printf ("diag.j", 111, th_all, "	nop\n");
!!#   IJ_printf ("diag.j", 112, th_all, "	nop\n");
!!#   IJ_printf ("diag.j", 113, th_all, "	nop\n");
!!#   IJ_th_join ("diag.j", 114,0xf);
!!#   IJ_th_start ("diag.j", 115,Seq_Start, NULL, 2); 
!!# 
!!#   IJ_printf ("diag.j", 117, th_all, "	nop\n");
!!#   IJ_printf ("diag.j", 118, th_all, "	nop\n");
!!#   IJ_printf ("diag.j", 119, th_all, "	nop\n");
!!#   IJ_printf ("diag.j", 120, th_all, "	nop\n");
!!#   IJ_printf ("diag.j", 121, th_all, "	nop\n");
!!#   IJ_printf ("diag.j", 122, th_all, "	nop\n");
!!#   IJ_printf ("diag.j", 123, th_all, "	nop\n");
!!#   IJ_printf ("diag.j", 124, th_all, "	nop\n");
!!#   IJ_printf ("diag.j", 125, th_all, "	nop\n");
!!#   IJ_printf ("diag.j", 126, th_all, "	ta    T_GOOD_TRAP\n\n");
!!# 
!!#   IJ_set_rvar ("diag.j", 128, data_rand_init, "32'hrrrrrrrr");
!!#   IJ_printf ("diag.j", 129, th_all, ".data\n");
!!#   for (i = 0; i < 128; i++) {
!!#     IJ_printf ("diag.j", 131, th_all, "	.word  0x%08rx,0x%08rx,0x%08rx,0x%08rx\n", data_rand_init, data_rand_init, data_rand_init, data_rand_init);
!!#     IJ_printf ("diag.j", 132, th_all, "	.word  0x%08rx,0x%08rx,0x%08rx,0x%08rx\n", data_rand_init, data_rand_init, data_rand_init, data_rand_init);
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
!!# //diag: intr_block inst_block
!!# //;
!!# 
!!# inst_block: inst_type
!!#             | inst_block inst_type
!!#             ;
!!# 
!!# inst_type: flhw alu_burst inst
!!# {
!!#    IJ_generate ("diag.j", 165, th_evnt, $3);
!!# }
!!# ;
!!# 
!!# flhw: st_irferr_unalgn | rsvd_illinst
!!# ;
!!# 
!!# rsvd_illinst: alu_tokens %ropr  Ro_rsvd_set
!!# 		{IJ_generate ("diag.j", 173, th_evnt, $1);}
!!# 	      | store_r %ropr  Ro_rsvd_set
!!# 		{IJ_generate ("diag.j", 175, th_evnt, $1);}
!!# ;
!!# 
!!# intr_block: mMETA18
!!# {
!!# 
!!#       for (i = 0; i < 500; i++) {
!!#          burst_cnt = random () % 4 + 1;
!!#          thrid = random () % 3;
!!#          if (random () % 2 == 1) {
!!#            IJ_printf ("diag.j", 185, th_intr, "thr%y_nuke_intr_%d:\n", intr_cnt); 
!!#            IJ_printf ("diag.j", 186, th_intr, "!$EV trig_pc_d(%y,expr(@VA(.MAIN.thr%y_nuke_intr_%d), 16, 16)) -> intp(%d, 2, 1)\n", intr_cnt,thrid);
!!#            intr_cnt++;
!!#            IJ_generate_from_token ("diag.j", 188,burst_cnt, th_intr, ijdefault, tADD_R, tADD_I, tADDcc_R, 
!!# 			   tADDcc_I, tADDC_R, tADDC_I, tADDCcc_R, tADDCcc_I, tAND_R, 
!!# 			   tAND_I, tANDcc_R, tANDcc_I, tANDN_R, tANDN_I, tANDNcc_R, 
!!#                            tANDNcc_I, tOR_R, tOR_I, tORcc_R, tORcc_I, tORN_R, tORN_I, 
!!#  			   tORNcc_R, tORNcc_I, tXOR_R, tXOR_I, tXORcc_R, tXORcc_I, 
!!# 			   tXNOR_R, tXNOR_I, tXNORcc_R, tXNORcc_I, tMOVcc_R, tMOVcc_I, 
!!#                            tMOVR_R, tMOVR_I, tSLL_R, tSLL_I, tSRL_R, tSRL_I, tSRA_R, 
!!#                            tSRA_I, tSLLX_R, tSLLX_I, tSRLX_R, tSRLX_I, tSRAX_R, -1);;	
!!#            IJ_printf ("diag.j", 189, th_intr, "thr%y_resum_intr_%d:\n", intr_cnt);
!!#            IJ_printf ("diag.j", 190, th_intr, "!$EV trig_pc_d(%y,expr(@VA(.MAIN.thr%y_resum_intr_%d), 16, 16)) -> intp(%d, 3, 1)\n", intr_cnt,thrid);
!!#            intr_cnt++;	   
!!#            IJ_generate_from_token ("diag.j", 192,burst_cnt, th_intr, ijdefault, tADD_R, tADD_I, tADDcc_R, 
!!# 			   tADDcc_I, tADDC_R, tADDC_I, tADDCcc_R, tADDCcc_I, tAND_R, 
!!# 			   tAND_I, tANDcc_R, tANDcc_I, tANDN_R, tANDN_I, tANDNcc_R, 
!!#                            tANDNcc_I, tOR_R, tOR_I, tORcc_R, tORcc_I, tORN_R, tORN_I, 
!!#  			   tORNcc_R, tORNcc_I, tXOR_R, tXOR_I, tXORcc_R, tXORcc_I, 
!!# 			   tXNOR_R, tXNOR_I, tXNORcc_R, tXNORcc_I, tMOVcc_R, tMOVcc_I, 
!!#                            tMOVR_R, tMOVR_I, tSLL_R, tSLL_I, tSRL_R, tSRL_I, tSRA_R, 
!!#                            tSRA_I, tSLLX_R, tSLLX_I, tSRLX_R, tSRLX_I, tSRAX_R, -1);;	
!!#          } else {
!!#            IJ_printf ("diag.j", 194, th_intr, "thr%y_hw_intr_%d:\n", intr_cnt); 
!!#       	   IJ_printf ("diag.j", 195, th_intr, "!$EV trig_pc_d(%y,expr(@VA(.MAIN.thr%y_hw_intr_%d), 16, 16)) -> intp(%d, 0, 1)\n", intr_cnt,thrid);  
!!#            burst_cnt = random () % 4 + 1;
!!# 	   intr_cnt++;
!!#            IJ_generate_from_token ("diag.j", 198,burst_cnt, th_intr, ijdefault, tADD_R, tADD_I, tADDcc_R, 
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
!!#    burst_cnt = random () % 4; 
!!#    IJ_generate_from_token ("diag.j", 208,burst_cnt, th_evnt, ijdefault, tADD_R, tADD_I, tADDcc_R, 
!!# 			   tADDcc_I, tADDC_R, tADDC_I, tADDCcc_R, tADDCcc_I, tAND_R, 
!!# 			   tAND_I, tANDcc_R, tANDcc_I, tANDN_R, tANDN_I, tANDNcc_R, 
!!#                            tANDNcc_I, tOR_R, tOR_I, tORcc_R, tORcc_I, tORN_R, tORN_I, 
!!#  			   tORNcc_R, tORNcc_I, tXOR_R, tXOR_I, tXORcc_R, tXORcc_I, 
!!# 			   tXNOR_R, tXNOR_I, tXNORcc_R, tXNORcc_I, tMOVcc_R, tMOVcc_I, 
!!#                            tMOVR_R, tMOVR_I, tSLL_R, tSLL_I, tSRL_R, tSRL_I, tSRA_R, 
!!#                            tSRA_I, tSLLX_R, tSLLX_I, tSRLX_R, tSRLX_I, tSRAX_R, -1);;
!!# }
!!# ;
!!# 
!!# st_irferr_unalgn: //irferr store_i 
!!# //		    {
!!# //		       IJ_generate (th_evnt, $2);
!!# //		    }
!!# //                  |
!!# 		 d5 store_i %ropr  Ro_unaligned_addr
!!#                     {
!!# 		      IJ_generate ("diag.j", 219, th_evnt, $2);
!!#                     }
!!# 		  | d6 irferr store_i %ropr  Ro_unaligned_addr
!!#                     {
!!# 		      IJ_generate ("diag.j", 223, th_evnt, $3);
!!#                     }
!!# ;
!!# 
!!# irferr: mMETA100
!!# {
!!#      IJ_printf ("diag.j", 229, th_evnt, "thr%y_irf_ce_%d:\n", irf_err_cnt);
!!#      bitnum = random () % 72;
!!#      IJ_printf ("diag.j", 231, th_evnt, "!$EV error(%y,expr(@VA(.MAIN.thr%y_irf_ce_%d), 16, 16),1,IRF,ce,%d,x, x,x,x, x,x,x)\n", irf_err_cnt, bitnum);
!!#      irf_err_cnt++;
!!# }
!!# ;
!!# 
!!# inst: mul | div | fpop | load | asi_load | asi_st | br | membar | atomic | flush | prefetch | halt | privop | chpriv | win | fpdis
!!# ;
!!# 
!!# fpdis: mMETAfpdis
!!# {
!!#   IJ_printf ("diag.j", 241, th_evnt, "        wr %%g0, 0x4, %%fprs\n");
!!# }
!!# ;
!!# 
!!# privop: tRDPR_TPC | tRDPR_TNPC | tRDPR_TSTATE | tRDPR_TT |  tRDPR_TBA | tRDPR_PSTATE | tRDPR_TL | tRDPR_PIL | tRDPR_CWP | tRDPR_CANSAVE | tRDPR_CANRESTORE | tRDPR_CLEANWIN | tRDPR_OTHERWIN | tRDPR_WSTATE | tRDPR_FQ | tRDPR_VER | tRDY | tRDCCR | tRDASI  | tRDPC | tRDFPRS | tRDHPR_HPSTATE | tRDHPR_HTSTATE | tRDHPR_HINTP | tRDHPR_HTBA | tWRY_R | tWRCCR_R  | tWRFPRS_R
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
!!# br: tBA | tBN | tBNE | tBE | tBG | tBLE | tBGE | tBL | tBGU | 
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
!!# arith_fp: tFADDs | tFXNORS | tFADDd | tFADDq | tFSUBs | tFMOVA | tFSUBd | tFMOVN | tFSUBq | tFMOVNE | tFCMPs | tFMOVE | tFCMPd | tFMOVG | tFCMPq | tFMOVLE | tFCMPEs | tFMOVGE | tFCMPEd | tFMOVL | tFCMPEq | tFMOVGU | tFsTOx | tFMOVLEU | tFdTOx | tFMOVCC | tFqTOx | tFMOVCS | tFsTOi | tFMOVPOS | tFdTOi | tFMOVNEG | tFqTOi | tFMOVVC | tFsTOd | tFMOVVS | tFsTOq | tFMOVRZ | tFdTOs | tFMOVRLEZ | tFdTOq | tFMOVRLZ | tFqTOs | tFMOVRNZ | tFqTOd | tFMOVRGZ | tFxTOs | tFMOVRGEZ | tFxTOd | tFxTOq | tFiTOs | tFiTOd | tFiTOq | tFMOVs | tFMOVd | tFMOVq | tFNEGs | tFNEGd | tFNEGq | tFABSs | tFABSd | tFABSq | tFMULs | tFMULd | tFMULq | tFsMULd | tFdMULq | tFDIVs | tFDIVd | tFDIVq | tFSQRTs | tFSQRTd | tFSQRTq
!!# 
!!# //tFBA | tFBN | tFBU | tFBG | tFBUG | tFBL | tFBUL| tFBLG | tFBNE | tFBE | tFBUE | tFBGE | tFBUG | tFBLE | tFBUL | tFBO | tFBPA | tFBPN | tFBPU | tFBPG | tFBPU | tFBPL | tFBPU | tFBPL | tFBPN | tFBPE | tFBPU | tFBPG | tFBPU | tFBPL | tFBPU | tFBPO |
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
!!#      IJ_printf ("diag.j", 305, th_evnt, "thr%y_resum_intr_%d:\n", intr_cnt);
!!#      IJ_printf ("diag.j", 306, th_evnt, "!$EV trig_pc_d(%y,expr(@VA(.MAIN.thr%y_resum_intr_%d), 16, 16)) -> intp(%y, 3, 1)\n", intr_cnt);
!!#      IJ_printf ("diag.j", 307, th_evnt, "\twr      %%r0, 0x5, %%asr26\n");
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

