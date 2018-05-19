// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: bug4534.s
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
   random seed:	926483154
   Jal flush.j:	
********************************************************************************/


#define MAIN_PAGE_HV_ALSO
#define NO_TRAPCHECK
#define ALL_MY_INTR_HANDLERS
#include "my_intr_handlers.s"
#define ALL_MY_TRAP_HANDLERS
#include "my_trap_handlers.s"
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
        setx  0x0000000000000520, %g1, %r17
        setx  0x231908fb90862b62, %g1, %r0
        setx  0xe2547feb2df0135d, %g1, %r1
        setx  0x50faa89af2ad5604, %g1, %r2
        setx  0x6e4b98b217b8e94c, %g1, %r3
        setx  0x13949c4dab402e5d, %g1, %r4
        setx  0x9469125ce78def1f, %g1, %r5
        setx  0xbdcd77c19ce3b3d2, %g1, %r6
        setx  0x1e18dea8f71a67e8, %g1, %r7
        setx  0x08a381abf7f54487, %g1, %r8
        setx  0xe4393e7dbfd6e486, %g1, %r9
        setx  0x5545ba1e7266ce74, %g1, %r10
        setx  0x1bf021609e8f8ea0, %g1, %r11
        setx  0x6ade16db923fbc39, %g1, %r12
        setx  0x4d9ef27e6ba799d2, %g1, %r13
        setx  0x75694570c41098c5, %g1, %r14
        setx  0xaa1710a38ea46725, %g1, %r15
        setx  0x6c7485b440e3c0ba, %g1, %r18
        setx  0x4a6998bcf645ccb5, %g1, %r19
        setx  0x924da14422613091, %g1, %r20
        setx  0xfb8d58b4d23439ea, %g1, %r21
        setx  0x58a9081cfd3b16df, %g1, %r22
        setx  0xb53713c3754b0ba8, %g1, %r23
        setx  0xd062163b9af23edc, %g1, %r24
        setx  0x2bf82c41edf18e2f, %g1, %r25
        setx  0xead1dfdf5d6bd01e, %g1, %r26
        setx  0xce3b1cc4e25f357f, %g1, %r27
        setx  0x7d53a5263d9d9a10, %g1, %r28
        setx  0x589f1584c7e3bfcb, %g1, %r29
        setx  0xfaa256c979f28cb1, %g1, %r30
        setx  0x4e17126c207e0956, %g1, %r31
	save %r0, %r0, %r31
        setx  MAIN_BASE_DATA_VA, %r1, %r16
        setx  0x0000000000000290, %g1, %r17
        setx  0x53123e398ec9d4c1, %g1, %r0
        setx  0xdf285ad023afdd99, %g1, %r1
        setx  0x77b2ccbfe78331cd, %g1, %r2
        setx  0x8206841712648d81, %g1, %r3
        setx  0x8819b62125edfb8e, %g1, %r4
        setx  0x8778d1a1a88dc504, %g1, %r5
        setx  0x28d27a5a4a722468, %g1, %r6
        setx  0x9d3e14a3f340e336, %g1, %r7
        setx  0x6d7d6fcc7cdb4c2d, %g1, %r8
        setx  0x355700fd306ee468, %g1, %r9
        setx  0xa352ae529ae4b39f, %g1, %r10
        setx  0xabf1f1e7bb4ea9ce, %g1, %r11
        setx  0xf79cbf9a2ab3a150, %g1, %r12
        setx  0x4633d9cddde4ef7c, %g1, %r13
        setx  0x49298eb1eb48ffd6, %g1, %r14
        setx  0x4934faf2bf08c207, %g1, %r15
        setx  0x693b03f5da51bb26, %g1, %r18
        setx  0xe57dac0bcf899e1b, %g1, %r19
        setx  0xd244c4412ca566d6, %g1, %r20
        setx  0xd68a6035e9863feb, %g1, %r21
        setx  0x083a50608ccdf8da, %g1, %r22
        setx  0xb3310dbc184e954a, %g1, %r23
        setx  0x9385d1c34b0c8ad8, %g1, %r24
        setx  0x98c26c945dc8a46c, %g1, %r25
        setx  0x6422fca899556ff8, %g1, %r26
        setx  0x0e11a64971646e37, %g1, %r27
        setx  0x98d19e936d049d53, %g1, %r28
        setx  0xf62c82bdbdc33941, %g1, %r29
        setx  0xe60c54853a613eff, %g1, %r30
        setx  0x6f15ba2b4a0b9f8c, %g1, %r31
	save %r0, %r0, %r31
        setx  MAIN_BASE_DATA_VA, %r1, %r16
        setx  0x00000000000004a0, %g1, %r17
        setx  0xcda0e9f4153f6cc3, %g1, %r0
        setx  0x2b265eaaed23c1a3, %g1, %r1
        setx  0xa6bd80798ce34f5b, %g1, %r2
        setx  0x73fe1d8383a058e5, %g1, %r3
        setx  0xd4f93261726156a9, %g1, %r4
        setx  0xe7f287280468678f, %g1, %r5
        setx  0x421518219d904846, %g1, %r6
        setx  0xb6969f53a2dc7174, %g1, %r7
        setx  0x350ab3e429cfd3d9, %g1, %r8
        setx  0xbc16c92f5c7b1836, %g1, %r9
        setx  0xd6f86b315d963b6c, %g1, %r10
        setx  0x1d369f66aa938647, %g1, %r11
        setx  0x3484c849958e69d2, %g1, %r12
        setx  0x22137b9949ffe9c4, %g1, %r13
        setx  0xf47f51b61ef0b04f, %g1, %r14
        setx  0x324cdacd30675f57, %g1, %r15
        setx  0x171ca4399c197efb, %g1, %r18
        setx  0x52ec231bc2e41da9, %g1, %r19
        setx  0xb4ed68060c912969, %g1, %r20
        setx  0x6b9139d354b5f939, %g1, %r21
        setx  0x39c5b7c321f3a9b2, %g1, %r22
        setx  0x0d0d987623e66638, %g1, %r23
        setx  0x8a65ea8af507de0a, %g1, %r24
        setx  0x9773758c63b771a3, %g1, %r25
        setx  0xe21dbf8adc8a291e, %g1, %r26
        setx  0xa6abc3c2bc98d6a4, %g1, %r27
        setx  0x91fba89bee85890b, %g1, %r28
        setx  0xd7f6303e13893c6d, %g1, %r29
        setx  0xbed02c997794a78a, %g1, %r30
        setx  0x697ab36b021c655d, %g1, %r31
	save %r0, %r0, %r31
        setx  MAIN_BASE_DATA_VA, %r1, %r16
        setx  0x0000000000000b90, %g1, %r17
        setx  0x4a84df1a0d9ccedc, %g1, %r0
        setx  0xe64992b6e15c759a, %g1, %r1
        setx  0xe1f7b18476683739, %g1, %r2
        setx  0x92e1e2dd3ef8f9ef, %g1, %r3
        setx  0xb7ae3338570de80c, %g1, %r4
        setx  0x951a98a8cad4bb48, %g1, %r5
        setx  0x96244880e422fa4a, %g1, %r6
        setx  0x190c9d341c2a874a, %g1, %r7
        setx  0x62f40272fcca95cc, %g1, %r8
        setx  0x2cd05b9d597eaea7, %g1, %r9
        setx  0x9809f522de5a5d24, %g1, %r10
        setx  0xb12c3a52f48e13b0, %g1, %r11
        setx  0xecc76c2f6f69061f, %g1, %r12
        setx  0x3886c16b733b7d42, %g1, %r13
        setx  0x6aeb43918313e3bf, %g1, %r14
        setx  0x3016c5ce0b5895a6, %g1, %r15
        setx  0x8d187205e1c15c45, %g1, %r18
        setx  0x3fabf9de0ed788ba, %g1, %r19
        setx  0x018fbbab7c3d6acc, %g1, %r20
        setx  0x56b5a7e799f8b445, %g1, %r21
        setx  0x57d6d1723269c9a0, %g1, %r22
        setx  0x02d6200737b7ff3d, %g1, %r23
        setx  0x85358ccd4b1b312a, %g1, %r24
        setx  0xd701bb1d9fdfdd68, %g1, %r25
        setx  0xa1367a056151c0e0, %g1, %r26
        setx  0x940a674c1166763c, %g1, %r27
        setx  0xf3855c4847c4cd92, %g1, %r28
        setx  0x2890ae575346008f, %g1, %r29
        setx  0x766a8bf0eadec6ec, %g1, %r30
        setx  0x3fe32b311cc7b950, %g1, %r31
	save %r0, %r0, %r31
        setx  MAIN_BASE_DATA_VA, %r1, %r16
        setx  0x0000000000000e00, %g1, %r17
        setx  0x071e76a70a6afcbb, %g1, %r0
        setx  0x0be74aaede329376, %g1, %r1
        setx  0xc9fcfb3af9de92b6, %g1, %r2
        setx  0x27b14e1ac189acc5, %g1, %r3
        setx  0x78b7755d2f227a47, %g1, %r4
        setx  0xf3d4d96cefa9e469, %g1, %r5
        setx  0x767b04681111f3de, %g1, %r6
        setx  0xa729cbaf63f3f721, %g1, %r7
        setx  0x1fc0b39473247d4d, %g1, %r8
        setx  0x0c60bf907ea6f284, %g1, %r9
        setx  0x09b21bb587ff3028, %g1, %r10
        setx  0xeea3a050ff3dfc1d, %g1, %r11
        setx  0x6deccfbd658c6000, %g1, %r12
        setx  0x068c62b76f363b47, %g1, %r13
        setx  0x9dcd95d7c45694df, %g1, %r14
        setx  0x9e273be2f0cd8c22, %g1, %r15
        setx  0xb101e5938dad9aa6, %g1, %r18
        setx  0x06691d86f2862f08, %g1, %r19
        setx  0x97cac30a812d65ce, %g1, %r20
        setx  0x9ae8c62f78d8edbe, %g1, %r21
        setx  0xed0446238c82c2d0, %g1, %r22
        setx  0xb46ec0eb4c0a0d8f, %g1, %r23
        setx  0x3dcdb89c7c7903fe, %g1, %r24
        setx  0xe3a23dedb6dd584b, %g1, %r25
        setx  0x6b88dc0b2f872190, %g1, %r26
        setx  0xf331731cd4e7a379, %g1, %r27
        setx  0x263e806452a1b7db, %g1, %r28
        setx  0xc994ae6a47f1bd8e, %g1, %r29
        setx  0x87155c4733592152, %g1, %r30
        setx  0x98ce65bb57744ce2, %g1, %r31
	save %r0, %r0, %r31
        setx  MAIN_BASE_DATA_VA, %r1, %r16
        setx  0x0000000000000580, %g1, %r17
        setx  0x9cf240d6c49cf90e, %g1, %r0
        setx  0x2b5ae3f8b4b2e9c0, %g1, %r1
        setx  0x0a5c39f17a937082, %g1, %r2
        setx  0x176a0f830ee04ba3, %g1, %r3
        setx  0x2433233c2b782b8b, %g1, %r4
        setx  0xfb6df28eb0b2fcc9, %g1, %r5
        setx  0x15789be29563375f, %g1, %r6
        setx  0x9af725bd474b5d75, %g1, %r7
        setx  0xaf199fb1dc4bdfee, %g1, %r8
        setx  0x5d685c70216d6741, %g1, %r9
        setx  0xe98470c5defd46f7, %g1, %r10
        setx  0x59caf800b4f0b41c, %g1, %r11
        setx  0x495ef228343e7997, %g1, %r12
        setx  0xc966fa2308a921a5, %g1, %r13
        setx  0x8e525d401994179a, %g1, %r14
        setx  0x36fe37ab1828ed1a, %g1, %r15
        setx  0x5bea3673b697fe15, %g1, %r18
        setx  0xcc9d51d04732553c, %g1, %r19
        setx  0xe65916579b4e3131, %g1, %r20
        setx  0x588c21254cf1903d, %g1, %r21
        setx  0xc3ae2d972f40ab46, %g1, %r22
        setx  0x18109320cc24779a, %g1, %r23
        setx  0x8d82cf8bbbd4ff1e, %g1, %r24
        setx  0xb984827ef2ae001f, %g1, %r25
        setx  0x4e3b1ea81cd26790, %g1, %r26
        setx  0x4740a6e37c9a313c, %g1, %r27
        setx  0x1980326971a060c0, %g1, %r28
        setx  0x56d234690354c8f3, %g1, %r29
        setx  0x17b31bad8826f0cd, %g1, %r30
        setx  0x7feaa4f2e626c8c8, %g1, %r31
	save %r0, %r0, %r31
        setx  MAIN_BASE_DATA_VA, %r1, %r16
        setx  0x00000000000009c0, %g1, %r17
        setx  0x6fc181a33be9db72, %g1, %r0
        setx  0x7c5abf91c12a9cab, %g1, %r1
        setx  0xaebc9b4bd558994b, %g1, %r2
        setx  0x0e303cd3b66b6a22, %g1, %r3
        setx  0x9a2934cc80aef5e8, %g1, %r4
        setx  0x5e02b050f4375d67, %g1, %r5
        setx  0x1afccf7068a54782, %g1, %r6
        setx  0x12aba22e3bd28194, %g1, %r7
        setx  0x7e9d01f998696da4, %g1, %r8
        setx  0xad684f81c921a0bf, %g1, %r9
        setx  0x1b40bb09db2bc47c, %g1, %r10
        setx  0xced884e1052b1458, %g1, %r11
        setx  0x137791187e1a9527, %g1, %r12
        setx  0x2da8cba7edff9623, %g1, %r13
        setx  0x837fb1e317eb33d2, %g1, %r14
        setx  0x894f40462367c541, %g1, %r15
        setx  0x173d10177bc76edd, %g1, %r18
        setx  0x8f7c5d1daa3de488, %g1, %r19
        setx  0x365a53470128eb72, %g1, %r20
        setx  0x5d524823defbdc20, %g1, %r21
        setx  0xf94d860c96f45642, %g1, %r22
        setx  0x6089a065228167d4, %g1, %r23
        setx  0xe3141251c6143cfa, %g1, %r24
        setx  0xd5ae13c321344307, %g1, %r25
        setx  0x80b2d7c562da9a7b, %g1, %r26
        setx  0x11095226beefdc7e, %g1, %r27
        setx  0x87e26d597e8caf7c, %g1, %r28
        setx  0x9b5f3ba62f1c0401, %g1, %r29
        setx  0xa3ae34c647068720, %g1, %r30
        setx  0xcbd429d43977b669, %g1, %r31
	save %r0, %r0, %r31
        setx  MAIN_BASE_DATA_VA, %r1, %r16
        setx  0x0000000000000730, %g1, %r17
        setx  0x747ee4596dfe862f, %g1, %r0
        setx  0xfe7c461c063c48ad, %g1, %r1
        setx  0x55ad922cc77fe096, %g1, %r2
        setx  0x0486bdea47a73a2d, %g1, %r3
        setx  0x13a51d090da904d6, %g1, %r4
        setx  0xaac5f547f2afb78f, %g1, %r5
        setx  0xc40866a4ecd32249, %g1, %r6
        setx  0xfc8aa1fe4f2ff925, %g1, %r7
        setx  0xe94065a91ffb36ce, %g1, %r8
        setx  0x0cd9836207f1ae3c, %g1, %r9
        setx  0xe35949847b989e42, %g1, %r10
        setx  0xf33b8cc918b6e0d2, %g1, %r11
        setx  0x5aaa32db2d8bf27b, %g1, %r12
        setx  0x9c62e9792779dc92, %g1, %r13
        setx  0x94128244b5d6f253, %g1, %r14
        setx  0x87314a57a20bfb28, %g1, %r15
        setx  0x3ed52966f47af43d, %g1, %r18
        setx  0xe1765edc8b3caea5, %g1, %r19
        setx  0x207e0bb7b35d2537, %g1, %r20
        setx  0x2677290cb478ab35, %g1, %r21
        setx  0x71f404e6f7cf12b3, %g1, %r22
        setx  0x7f9d6dc134b4d76a, %g1, %r23
        setx  0x53ed39899cea4046, %g1, %r24
        setx  0xcf9e755377d7fa78, %g1, %r25
        setx  0xbc26ba08fe84a92f, %g1, %r26
        setx  0x2a636d7d2adfe772, %g1, %r27
        setx  0xcd996e7bccc24bca, %g1, %r28
        setx  0xb5733f97ea7f90f2, %g1, %r29
        setx  0x3729b39d51a88264, %g1, %r30
        setx  0xa9273a69533fa6ec, %g1, %r31
	save %r0, %r0, %r31
thr3_nuke_intr_0:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_0), 16, 16)) -> intp(0, 2, 1)
	.word 0x84940011  ! 1: ORcc_R	orcc 	%r16, %r17, %r2
	.word 0x872c0011  ! 1: SLL_R	sll 	%r16, %r17, %r3
thr3_resum_intr_1:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1), 16, 16)) -> intp(0, 3, 1)
	.word 0x8e442183  ! 1: ADDC_I	addc 	%r16, 0x0183, %r7
	.word 0x98040011  ! 1: ADD_R	add 	%r16, %r17, %r12
thr3_hw_intr_2:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_2), 16, 16)) -> intp(2, 0, 1)
	.word 0x9d7c0411  ! 1: MOVR_R	movre	%r16, %r17, %r14
	.word 0x88ac2fa5  ! 1: ANDNcc_I	andncc 	%r16, 0x0fa5, %r4
thr3_hw_intr_3:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_3), 16, 16)) -> intp(0, 0, 1)
	.word 0x852c2001  ! 1: SLL_I	sll 	%r16, 0x0001, %r2
thr3_hw_intr_4:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_4), 16, 16)) -> intp(2, 0, 1)
	.word 0xb20c29d6  ! 1: AND_I	and 	%r16, 0x09d6, %r25
	.word 0x892c0011  ! 1: SLL_R	sll 	%r16, %r17, %r4
	.word 0xa72c0011  ! 1: SLL_R	sll 	%r16, %r17, %r19
	.word 0x98b40011  ! 1: ORNcc_R	orncc 	%r16, %r17, %r12
thr3_hw_intr_5:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_5), 16, 16)) -> intp(0, 0, 1)
	.word 0x96140011  ! 1: OR_R	or 	%r16, %r17, %r11
	.word 0x97343001  ! 1: SRLX_I	srlx	%r16, 0x0001, %r11
thr3_nuke_intr_6:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_6), 16, 16)) -> intp(0, 2, 1)
	.word 0x87343001  ! 1: SRLX_I	srlx	%r16, 0x0001, %r3
	.word 0x92b42869  ! 1: ORNcc_I	orncc 	%r16, 0x0869, %r9
	.word 0x863429d6  ! 1: ORN_I	orn 	%r16, 0x09d6, %r3
thr3_resum_intr_7:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_7), 16, 16)) -> intp(0, 3, 1)
	.word 0x852c3001  ! 1: SLLX_I	sllx	%r16, 0x0001, %r2
	.word 0xb2940011  ! 1: ORcc_R	orcc 	%r16, %r17, %r25
	.word 0xb93c1011  ! 1: SRAX_R	srax	%r16, %r17, %r28
thr3_nuke_intr_8:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_8), 16, 16)) -> intp(1, 2, 1)
	.word 0x980c0011  ! 1: AND_R	and 	%r16, %r17, %r12
	.word 0x9b3c1011  ! 1: SRAX_R	srax	%r16, %r17, %r13
	.word 0x8c8425ce  ! 1: ADDcc_I	addcc 	%r16, 0x05ce, %r6
thr3_resum_intr_9:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_9), 16, 16)) -> intp(1, 3, 1)
	.word 0x99341011  ! 1: SRLX_R	srlx	%r16, %r17, %r12
	.word 0x9e0c0011  ! 1: AND_R	and 	%r16, %r17, %r15
	.word 0x889420f9  ! 1: ORcc_I	orcc 	%r16, 0x00f9, %r4
thr3_hw_intr_10:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_10), 16, 16)) -> intp(2, 0, 1)
	.word 0x8e34285a  ! 1: ORN_I	orn 	%r16, 0x085a, %r7
	.word 0x9c140011  ! 1: OR_R	or 	%r16, %r17, %r14
	.word 0x8a2c237e  ! 1: ANDN_I	andn 	%r16, 0x037e, %r5
thr3_nuke_intr_11:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_11), 16, 16)) -> intp(2, 2, 1)
	.word 0x9e2c0011  ! 1: ANDN_R	andn 	%r16, %r17, %r15
	.word 0x992c3001  ! 1: SLLX_I	sllx	%r16, 0x0001, %r12
	.word 0x9e942fa7  ! 1: ORcc_I	orcc 	%r16, 0x0fa7, %r15
	.word 0x853c0011  ! 1: SRA_R	sra 	%r16, %r17, %r2
thr3_resum_intr_12:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_12), 16, 16)) -> intp(2, 3, 1)
	.word 0x9b3c0011  ! 1: SRA_R	sra 	%r16, %r17, %r13
	.word 0xb9340011  ! 1: SRL_R	srl 	%r16, %r17, %r28
	.word 0x9abc0011  ! 1: XNORcc_R	xnorcc 	%r16, %r17, %r13
	.word 0xaf2c1011  ! 1: SLLX_R	sllx	%r16, %r17, %r23
thr3_hw_intr_13:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_13), 16, 16)) -> intp(2, 0, 1)
	.word 0x873c1011  ! 1: SRAX_R	srax	%r16, %r17, %r3
	.word 0xb6142e07  ! 1: OR_I	or 	%r16, 0x0e07, %r27
	.word 0xb40c26e5  ! 1: AND_I	and 	%r16, 0x06e5, %r26
	.word 0xa61c0011  ! 1: XOR_R	xor 	%r16, %r17, %r19
thr3_nuke_intr_14:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_14), 16, 16)) -> intp(1, 2, 1)
	.word 0x952c2001  ! 1: SLL_I	sll 	%r16, 0x0001, %r10
	.word 0xaabc266d  ! 1: XNORcc_I	xnorcc 	%r16, 0x066d, %r21
	.word 0xb3341011  ! 1: SRLX_R	srlx	%r16, %r17, %r25
thr3_resum_intr_15:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_15), 16, 16)) -> intp(1, 3, 1)
	.word 0xba0c0011  ! 1: AND_R	and 	%r16, %r17, %r29
	.word 0xb32c2001  ! 1: SLL_I	sll 	%r16, 0x0001, %r25
	.word 0x96b42004  ! 1: ORNcc_I	orncc 	%r16, 0x0004, %r11
thr3_nuke_intr_16:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_16), 16, 16)) -> intp(1, 2, 1)
	.word 0x844420ea  ! 1: ADDC_I	addc 	%r16, 0x00ea, %r2
	.word 0xbb3c0011  ! 1: SRA_R	sra 	%r16, %r17, %r29
	.word 0x969c241d  ! 1: XORcc_I	xorcc 	%r16, 0x041d, %r11
thr3_resum_intr_17:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_17), 16, 16)) -> intp(1, 3, 1)
	.word 0xb32c0011  ! 1: SLL_R	sll 	%r16, %r17, %r25
	.word 0xab7c2401  ! 1: MOVR_I	movre	%r16, 0x1, %r21
	.word 0x9cac2255  ! 1: ANDNcc_I	andncc 	%r16, 0x0255, %r14
thr3_hw_intr_18:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_18), 16, 16)) -> intp(1, 0, 1)
	.word 0x969c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r11
thr3_nuke_intr_19:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_19), 16, 16)) -> intp(2, 2, 1)
	.word 0x9c0c2f6a  ! 1: AND_I	and 	%r16, 0x0f6a, %r14
	.word 0x921427e6  ! 1: OR_I	or 	%r16, 0x07e6, %r9
	.word 0xb57c2401  ! 1: MOVR_I	movre	%r16, 0x1, %r26
	.word 0xbb2c1011  ! 1: SLLX_R	sllx	%r16, %r17, %r29
thr3_resum_intr_20:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_20), 16, 16)) -> intp(2, 3, 1)
	.word 0x908c242c  ! 1: ANDcc_I	andcc 	%r16, 0x042c, %r8
	.word 0xaeb42bdc  ! 1: ORNcc_I	orncc 	%r16, 0x0bdc, %r23
	.word 0x908c0011  ! 1: ANDcc_R	andcc 	%r16, %r17, %r8
	.word 0x852c0011  ! 1: SLL_R	sll 	%r16, %r17, %r2
thr3_nuke_intr_21:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_21), 16, 16)) -> intp(2, 2, 1)
	.word 0x96340011  ! 1: ORN_R	orn 	%r16, %r17, %r11
	.word 0xb0ac0011  ! 1: ANDNcc_R	andncc 	%r16, %r17, %r24
thr3_resum_intr_22:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_22), 16, 16)) -> intp(2, 3, 1)
	.word 0xbb3c2001  ! 1: SRA_I	sra 	%r16, 0x0001, %r29
	.word 0x829c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r1
thr3_hw_intr_23:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_23), 16, 16)) -> intp(2, 0, 1)
	.word 0xb89c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r28
	.word 0x93641811  ! 1: MOVcc_R	<illegal instruction>
	.word 0xa8ac0011  ! 1: ANDNcc_R	andncc 	%r16, %r17, %r20
	.word 0x84b421a3  ! 1: ORNcc_I	orncc 	%r16, 0x01a3, %r2
thr3_nuke_intr_24:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_24), 16, 16)) -> intp(1, 2, 1)
	.word 0xab2c2001  ! 1: SLL_I	sll 	%r16, 0x0001, %r21
	.word 0x8f341011  ! 1: SRLX_R	srlx	%r16, %r17, %r7
thr3_resum_intr_25:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_25), 16, 16)) -> intp(1, 3, 1)
	.word 0x8e2c0011  ! 1: ANDN_R	andn 	%r16, %r17, %r7
	.word 0x8cc42f42  ! 1: ADDCcc_I	addccc 	%r16, 0x0f42, %r6
thr3_hw_intr_26:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_26), 16, 16)) -> intp(0, 0, 1)
	.word 0x8e1429e2  ! 1: OR_I	or 	%r16, 0x09e2, %r7
	.word 0x9f2c0011  ! 1: SLL_R	sll 	%r16, %r17, %r15
	.word 0x9d340011  ! 1: SRL_R	srl 	%r16, %r17, %r14
	.word 0xb12c0011  ! 1: SLL_R	sll 	%r16, %r17, %r24
thr3_nuke_intr_27:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_27), 16, 16)) -> intp(0, 2, 1)
	.word 0x8c342eed  ! 1: ORN_I	orn 	%r16, 0x0eed, %r6
	.word 0xb6bc2c22  ! 1: XNORcc_I	xnorcc 	%r16, 0x0c22, %r27
	.word 0x833c0011  ! 1: SRA_R	sra 	%r16, %r17, %r1
thr3_resum_intr_28:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_28), 16, 16)) -> intp(0, 3, 1)
	.word 0xa6840011  ! 1: ADDcc_R	addcc 	%r16, %r17, %r19
	.word 0x96142761  ! 1: OR_I	or 	%r16, 0x0761, %r11
	.word 0x8c9c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r6
thr3_nuke_intr_29:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_29), 16, 16)) -> intp(1, 2, 1)
	.word 0x9f3c2001  ! 1: SRA_I	sra 	%r16, 0x0001, %r15
	.word 0x88840011  ! 1: ADDcc_R	addcc 	%r16, %r17, %r4
	.word 0x94840011  ! 1: ADDcc_R	addcc 	%r16, %r17, %r10
thr3_resum_intr_30:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_30), 16, 16)) -> intp(1, 3, 1)
	.word 0xb63c0011  ! 1: XNOR_R	xnor 	%r16, %r17, %r27
	.word 0x9c9c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r14
	.word 0x98ac2122  ! 1: ANDNcc_I	andncc 	%r16, 0x0122, %r12
thr3_nuke_intr_31:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_31), 16, 16)) -> intp(1, 2, 1)
	.word 0x952c1011  ! 1: SLLX_R	sllx	%r16, %r17, %r10
	.word 0x8834276f  ! 1: ORN_I	orn 	%r16, 0x076f, %r4
thr3_resum_intr_32:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_32), 16, 16)) -> intp(1, 3, 1)
	.word 0x9b343001  ! 1: SRLX_I	srlx	%r16, 0x0001, %r13
	.word 0x9a842653  ! 1: ADDcc_I	addcc 	%r16, 0x0653, %r13
thr3_hw_intr_33:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_33), 16, 16)) -> intp(1, 0, 1)
	.word 0x8e0c2b2c  ! 1: AND_I	and 	%r16, 0x0b2c, %r7
thr3_hw_intr_34:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_34), 16, 16)) -> intp(2, 0, 1)
	.word 0x9b641811  ! 1: MOVcc_R	<illegal instruction>
	.word 0xb43c0011  ! 1: XNOR_R	xnor 	%r16, %r17, %r26
thr3_hw_intr_35:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_35), 16, 16)) -> intp(0, 0, 1)
	.word 0xbb2c3001  ! 1: SLLX_I	sllx	%r16, 0x0001, %r29
	.word 0x9ec40011  ! 1: ADDCcc_R	addccc 	%r16, %r17, %r15
	.word 0x9f3c2001  ! 1: SRA_I	sra 	%r16, 0x0001, %r15
	.word 0x98c40011  ! 1: ADDCcc_R	addccc 	%r16, %r17, %r12
thr3_nuke_intr_36:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_36), 16, 16)) -> intp(2, 2, 1)
	.word 0x849c2bcd  ! 1: XORcc_I	xorcc 	%r16, 0x0bcd, %r2
thr3_resum_intr_37:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_37), 16, 16)) -> intp(2, 3, 1)
	.word 0xa8842747  ! 1: ADDcc_I	addcc 	%r16, 0x0747, %r20
thr3_nuke_intr_38:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_38), 16, 16)) -> intp(2, 2, 1)
	.word 0x90140011  ! 1: OR_R	or 	%r16, %r17, %r8
	.word 0xba140011  ! 1: OR_R	or 	%r16, %r17, %r29
	.word 0x8ab40011  ! 1: ORNcc_R	orncc 	%r16, %r17, %r5
thr3_resum_intr_39:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_39), 16, 16)) -> intp(2, 3, 1)
	.word 0x983c0011  ! 1: XNOR_R	xnor 	%r16, %r17, %r12
	.word 0x9a040011  ! 1: ADD_R	add 	%r16, %r17, %r13
	.word 0xb4ac0011  ! 1: ANDNcc_R	andncc 	%r16, %r17, %r26
thr3_hw_intr_40:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_40), 16, 16)) -> intp(1, 0, 1)
	.word 0x989c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r12
	.word 0x88440011  ! 1: ADDC_R	addc 	%r16, %r17, %r4
	.word 0xb09c2a46  ! 1: XORcc_I	xorcc 	%r16, 0x0a46, %r24
thr3_hw_intr_41:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_41), 16, 16)) -> intp(0, 0, 1)
	.word 0xa6b42dbb  ! 1: ORNcc_I	orncc 	%r16, 0x0dbb, %r19
	.word 0x9cbc2a12  ! 1: XNORcc_I	xnorcc 	%r16, 0x0a12, %r14
	.word 0x8a340011  ! 1: ORN_R	orn 	%r16, %r17, %r5
thr3_nuke_intr_42:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_42), 16, 16)) -> intp(2, 2, 1)
	.word 0x869c23d8  ! 1: XORcc_I	xorcc 	%r16, 0x03d8, %r3
	.word 0x8b3c2001  ! 1: SRA_I	sra 	%r16, 0x0001, %r5
thr3_resum_intr_43:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_43), 16, 16)) -> intp(2, 3, 1)
	.word 0x8c3c0011  ! 1: XNOR_R	xnor 	%r16, %r17, %r6
	.word 0xb0942e43  ! 1: ORcc_I	orcc 	%r16, 0x0e43, %r24
thr3_nuke_intr_44:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_44), 16, 16)) -> intp(2, 2, 1)
	.word 0x90840011  ! 1: ADDcc_R	addcc 	%r16, %r17, %r8
	.word 0x8ebc2fad  ! 1: XNORcc_I	xnorcc 	%r16, 0x0fad, %r7
thr3_resum_intr_45:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_45), 16, 16)) -> intp(2, 3, 1)
	.word 0x923c0011  ! 1: XNOR_R	xnor 	%r16, %r17, %r9
	.word 0x8b3c0011  ! 1: SRA_R	sra 	%r16, %r17, %r5
thr3_hw_intr_46:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_46), 16, 16)) -> intp(0, 0, 1)
	.word 0x9f3c0011  ! 1: SRA_R	sra 	%r16, %r17, %r15
	.word 0x932c0011  ! 1: SLL_R	sll 	%r16, %r17, %r9
thr3_hw_intr_47:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_47), 16, 16)) -> intp(1, 0, 1)
	.word 0xb0ac0011  ! 1: ANDNcc_R	andncc 	%r16, %r17, %r24
	.word 0xba1c0011  ! 1: XOR_R	xor 	%r16, %r17, %r29
thr3_nuke_intr_48:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_48), 16, 16)) -> intp(1, 2, 1)
	.word 0x8e942972  ! 1: ORcc_I	orcc 	%r16, 0x0972, %r7
	.word 0x9c0c0011  ! 1: AND_R	and 	%r16, %r17, %r14
thr3_resum_intr_49:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_49), 16, 16)) -> intp(1, 3, 1)
	.word 0x863c208f  ! 1: XNOR_I	xnor 	%r16, 0x008f, %r3
	.word 0x8a9c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r5
thr3_hw_intr_50:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_50), 16, 16)) -> intp(2, 0, 1)
	.word 0x8c8c0011  ! 1: ANDcc_R	andcc 	%r16, %r17, %r6
thr3_hw_intr_51:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_51), 16, 16)) -> intp(1, 0, 1)
	.word 0x96c40011  ! 1: ADDCcc_R	addccc 	%r16, %r17, %r11
	.word 0x9f341011  ! 1: SRLX_R	srlx	%r16, %r17, %r15
	.word 0xaa0c0011  ! 1: AND_R	and 	%r16, %r17, %r21
thr3_hw_intr_52:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_52), 16, 16)) -> intp(2, 0, 1)
	.word 0xaa940011  ! 1: ORcc_R	orcc 	%r16, %r17, %r21
thr3_nuke_intr_53:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_53), 16, 16)) -> intp(1, 2, 1)
	.word 0x82942c6c  ! 1: ORcc_I	orcc 	%r16, 0x0c6c, %r1
	.word 0xbb643801  ! 1: MOVcc_I	<illegal instruction>
	.word 0x8d2c1011  ! 1: SLLX_R	sllx	%r16, %r17, %r6
	.word 0x98842c14  ! 1: ADDcc_I	addcc 	%r16, 0x0c14, %r12
thr3_resum_intr_54:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_54), 16, 16)) -> intp(1, 3, 1)
	.word 0xb6bc2eaf  ! 1: XNORcc_I	xnorcc 	%r16, 0x0eaf, %r27
	.word 0xae340011  ! 1: ORN_R	orn 	%r16, %r17, %r23
	.word 0x90142783  ! 1: OR_I	or 	%r16, 0x0783, %r8
	.word 0x8eb420f6  ! 1: ORNcc_I	orncc 	%r16, 0x00f6, %r7
thr3_hw_intr_55:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_55), 16, 16)) -> intp(0, 0, 1)
	.word 0xb00c0011  ! 1: AND_R	and 	%r16, %r17, %r24
	.word 0x883c2a77  ! 1: XNOR_I	xnor 	%r16, 0x0a77, %r4
thr3_hw_intr_56:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_56), 16, 16)) -> intp(2, 0, 1)
	.word 0x8f2c2001  ! 1: SLL_I	sll 	%r16, 0x0001, %r7
	.word 0x957c2401  ! 1: MOVR_I	movre	%r16, 0x1, %r10
	.word 0x972c2001  ! 1: SLL_I	sll 	%r16, 0x0001, %r11
thr3_nuke_intr_57:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_57), 16, 16)) -> intp(0, 2, 1)
	.word 0x920c0011  ! 1: AND_R	and 	%r16, %r17, %r9
	.word 0x8a340011  ! 1: ORN_R	orn 	%r16, %r17, %r5
thr3_resum_intr_58:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_58), 16, 16)) -> intp(0, 3, 1)
	.word 0x9c3c2e2a  ! 1: XNOR_I	xnor 	%r16, 0x0e2a, %r14
	.word 0x948c0011  ! 1: ANDcc_R	andcc 	%r16, %r17, %r10
thr3_hw_intr_59:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_59), 16, 16)) -> intp(0, 0, 1)
	.word 0x908c0011  ! 1: ANDcc_R	andcc 	%r16, %r17, %r8
	.word 0x94040011  ! 1: ADD_R	add 	%r16, %r17, %r10
	.word 0x9d340011  ! 1: SRL_R	srl 	%r16, %r17, %r14
	.word 0x99641811  ! 1: MOVcc_R	<illegal instruction>
thr3_hw_intr_60:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_60), 16, 16)) -> intp(2, 0, 1)
	.word 0x988c0011  ! 1: ANDcc_R	andcc 	%r16, %r17, %r12
thr3_nuke_intr_61:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_61), 16, 16)) -> intp(2, 2, 1)
	.word 0xb8140011  ! 1: OR_R	or 	%r16, %r17, %r28
	.word 0x964424bc  ! 1: ADDC_I	addc 	%r16, 0x04bc, %r11
	.word 0x85342001  ! 1: SRL_I	srl 	%r16, 0x0001, %r2
	.word 0xb00c234b  ! 1: AND_I	and 	%r16, 0x034b, %r24
thr3_resum_intr_62:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_62), 16, 16)) -> intp(2, 3, 1)
	.word 0x8a2c2c4b  ! 1: ANDN_I	andn 	%r16, 0x0c4b, %r5
	.word 0x843423ba  ! 1: ORN_I	orn 	%r16, 0x03ba, %r2
	.word 0x94142e56  ! 1: OR_I	or 	%r16, 0x0e56, %r10
	.word 0x8c2c2204  ! 1: ANDN_I	andn 	%r16, 0x0204, %r6
thr3_nuke_intr_63:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_63), 16, 16)) -> intp(0, 2, 1)
	.word 0x842c250e  ! 1: ANDN_I	andn 	%r16, 0x050e, %r2
	.word 0x8aac298e  ! 1: ANDNcc_I	andncc 	%r16, 0x098e, %r5
	.word 0x8f2c2001  ! 1: SLL_I	sll 	%r16, 0x0001, %r7
	.word 0x8a440011  ! 1: ADDC_R	addc 	%r16, %r17, %r5
thr3_resum_intr_64:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_64), 16, 16)) -> intp(0, 3, 1)
	.word 0xae2c0011  ! 1: ANDN_R	andn 	%r16, %r17, %r23
	.word 0xae1c23eb  ! 1: XOR_I	xor 	%r16, 0x03eb, %r23
	.word 0x92142d28  ! 1: OR_I	or 	%r16, 0x0d28, %r9
	.word 0x82b40011  ! 1: ORNcc_R	orncc 	%r16, %r17, %r1
thr3_hw_intr_65:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_65), 16, 16)) -> intp(0, 0, 1)
	.word 0xac1c262b  ! 1: XOR_I	xor 	%r16, 0x062b, %r22
thr3_nuke_intr_66:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_66), 16, 16)) -> intp(1, 2, 1)
	.word 0x82bc0011  ! 1: XNORcc_R	xnorcc 	%r16, %r17, %r1
	.word 0xb0c42fbe  ! 1: ADDCcc_I	addccc 	%r16, 0x0fbe, %r24
	.word 0x82bc0011  ! 1: XNORcc_R	xnorcc 	%r16, %r17, %r1
	.word 0x863c2a8c  ! 1: XNOR_I	xnor 	%r16, 0x0a8c, %r3
thr3_resum_intr_67:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_67), 16, 16)) -> intp(1, 3, 1)
	.word 0x913c1011  ! 1: SRAX_R	srax	%r16, %r17, %r8
	.word 0xa92c0011  ! 1: SLL_R	sll 	%r16, %r17, %r20
	.word 0x9a9c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r13
	.word 0xb63c20bb  ! 1: XNOR_I	xnor 	%r16, 0x00bb, %r27
thr3_hw_intr_68:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_68), 16, 16)) -> intp(0, 0, 1)
	.word 0x9f643801  ! 1: MOVcc_I	<illegal instruction>
	.word 0xbaac20ae  ! 1: ANDNcc_I	andncc 	%r16, 0x00ae, %r29
thr3_hw_intr_69:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_69), 16, 16)) -> intp(0, 0, 1)
	.word 0x8cc40011  ! 1: ADDCcc_R	addccc 	%r16, %r17, %r6
thr3_nuke_intr_70:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_70), 16, 16)) -> intp(1, 2, 1)
	.word 0xb53c1011  ! 1: SRAX_R	srax	%r16, %r17, %r26
	.word 0x90840011  ! 1: ADDcc_R	addcc 	%r16, %r17, %r8
	.word 0xb6440011  ! 1: ADDC_R	addc 	%r16, %r17, %r27
	.word 0x928c2dde  ! 1: ANDcc_I	andcc 	%r16, 0x0dde, %r9
thr3_resum_intr_71:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_71), 16, 16)) -> intp(1, 3, 1)
	.word 0x8cc42dba  ! 1: ADDCcc_I	addccc 	%r16, 0x0dba, %r6
	.word 0x8e342ed1  ! 1: ORN_I	orn 	%r16, 0x0ed1, %r7
	.word 0xba0c0011  ! 1: AND_R	and 	%r16, %r17, %r29
	.word 0x820c2e09  ! 1: AND_I	and 	%r16, 0x0e09, %r1
thr3_hw_intr_72:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_72), 16, 16)) -> intp(0, 0, 1)
	.word 0x8c040011  ! 1: ADD_R	add 	%r16, %r17, %r6
	.word 0x9ab40011  ! 1: ORNcc_R	orncc 	%r16, %r17, %r13
	.word 0x972c3001  ! 1: SLLX_I	sllx	%r16, 0x0001, %r11
thr3_hw_intr_73:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_73), 16, 16)) -> intp(2, 0, 1)
	.word 0xaac40011  ! 1: ADDCcc_R	addccc 	%r16, %r17, %r21
thr3_hw_intr_74:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_74), 16, 16)) -> intp(2, 0, 1)
	.word 0x8d343001  ! 1: SRLX_I	srlx	%r16, 0x0001, %r6
	.word 0x96142229  ! 1: OR_I	or 	%r16, 0x0229, %r11
	.word 0xbb7c2401  ! 1: MOVR_I	movre	%r16, 0x1, %r29
	.word 0xb02c268d  ! 1: ANDN_I	andn 	%r16, 0x068d, %r24
thr3_hw_intr_75:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_75), 16, 16)) -> intp(0, 0, 1)
	.word 0x942c2005  ! 1: ANDN_I	andn 	%r16, 0x0005, %r10
thr3_hw_intr_76:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_76), 16, 16)) -> intp(2, 0, 1)
	.word 0x84b40011  ! 1: ORNcc_R	orncc 	%r16, %r17, %r2
thr3_hw_intr_77:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_77), 16, 16)) -> intp(2, 0, 1)
	.word 0x8c440011  ! 1: ADDC_R	addc 	%r16, %r17, %r6
thr3_hw_intr_78:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_78), 16, 16)) -> intp(1, 0, 1)
	.word 0x9e2c2d71  ! 1: ANDN_I	andn 	%r16, 0x0d71, %r15
	.word 0x9b7c0411  ! 1: MOVR_R	movre	%r16, %r17, %r13
	.word 0xba0c0011  ! 1: AND_R	and 	%r16, %r17, %r29
thr3_hw_intr_79:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_79), 16, 16)) -> intp(0, 0, 1)
	.word 0x9e2c0011  ! 1: ANDN_R	andn 	%r16, %r17, %r15
thr3_nuke_intr_80:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_80), 16, 16)) -> intp(1, 2, 1)
	.word 0xb6040011  ! 1: ADD_R	add 	%r16, %r17, %r27
	.word 0xb6bc0011  ! 1: XNORcc_R	xnorcc 	%r16, %r17, %r27
	.word 0xb17c0411  ! 1: MOVR_R	movre	%r16, %r17, %r24
thr3_resum_intr_81:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_81), 16, 16)) -> intp(1, 3, 1)
	.word 0xb0140011  ! 1: OR_R	or 	%r16, %r17, %r24
	.word 0xac1c20a5  ! 1: XOR_I	xor 	%r16, 0x00a5, %r22
	.word 0x89641811  ! 1: MOVcc_R	<illegal instruction>
thr3_nuke_intr_82:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_82), 16, 16)) -> intp(0, 2, 1)
	.word 0x929c25c2  ! 1: XORcc_I	xorcc 	%r16, 0x05c2, %r9
	.word 0x9cbc2874  ! 1: XNORcc_I	xnorcc 	%r16, 0x0874, %r14
thr3_resum_intr_83:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_83), 16, 16)) -> intp(0, 3, 1)
	.word 0xb23425bd  ! 1: ORN_I	orn 	%r16, 0x05bd, %r25
	.word 0x82ac2dfd  ! 1: ANDNcc_I	andncc 	%r16, 0x0dfd, %r1
thr3_nuke_intr_84:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_84), 16, 16)) -> intp(0, 2, 1)
	.word 0xbb3c2001  ! 1: SRA_I	sra 	%r16, 0x0001, %r29
	.word 0xa72c3001  ! 1: SLLX_I	sllx	%r16, 0x0001, %r19
	.word 0x82942a8e  ! 1: ORcc_I	orcc 	%r16, 0x0a8e, %r1
thr3_resum_intr_85:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_85), 16, 16)) -> intp(0, 3, 1)
	.word 0x9b342001  ! 1: SRL_I	srl 	%r16, 0x0001, %r13
	.word 0x85342001  ! 1: SRL_I	srl 	%r16, 0x0001, %r2
	.word 0x824429fa  ! 1: ADDC_I	addc 	%r16, 0x09fa, %r1
thr3_hw_intr_86:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_86), 16, 16)) -> intp(1, 0, 1)
	.word 0x852c0011  ! 1: SLL_R	sll 	%r16, %r17, %r2
thr3_hw_intr_87:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_87), 16, 16)) -> intp(2, 0, 1)
	.word 0x869c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r3
thr3_nuke_intr_88:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_88), 16, 16)) -> intp(0, 2, 1)
	.word 0x9c9c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r14
	.word 0x95342001  ! 1: SRL_I	srl 	%r16, 0x0001, %r10
thr3_resum_intr_89:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_89), 16, 16)) -> intp(0, 3, 1)
	.word 0xb0440011  ! 1: ADDC_R	addc 	%r16, %r17, %r24
	.word 0x8eb40011  ! 1: ORNcc_R	orncc 	%r16, %r17, %r7
thr3_hw_intr_90:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_90), 16, 16)) -> intp(2, 0, 1)
	.word 0xb93c1011  ! 1: SRAX_R	srax	%r16, %r17, %r28
	.word 0x98442e62  ! 1: ADDC_I	addc 	%r16, 0x0e62, %r12
	.word 0xb4840011  ! 1: ADDcc_R	addcc 	%r16, %r17, %r26
thr3_nuke_intr_91:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_91), 16, 16)) -> intp(1, 2, 1)
	.word 0x8a1c27cd  ! 1: XOR_I	xor 	%r16, 0x07cd, %r5
thr3_resum_intr_92:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_92), 16, 16)) -> intp(1, 3, 1)
	.word 0x85641811  ! 1: MOVcc_R	<illegal instruction>
thr3_nuke_intr_93:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_93), 16, 16)) -> intp(0, 2, 1)
	.word 0xb6b42267  ! 1: ORNcc_I	orncc 	%r16, 0x0267, %r27
	.word 0x94442cb4  ! 1: ADDC_I	addc 	%r16, 0x0cb4, %r10
	.word 0x90bc0011  ! 1: XNORcc_R	xnorcc 	%r16, %r17, %r8
	.word 0xad341011  ! 1: SRLX_R	srlx	%r16, %r17, %r22
thr3_resum_intr_94:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_94), 16, 16)) -> intp(0, 3, 1)
	.word 0x88940011  ! 1: ORcc_R	orcc 	%r16, %r17, %r4
	.word 0x84040011  ! 1: ADD_R	add 	%r16, %r17, %r2
	.word 0x85643801  ! 1: MOVcc_I	<illegal instruction>
	.word 0x8b340011  ! 1: SRL_R	srl 	%r16, %r17, %r5
thr3_hw_intr_95:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_95), 16, 16)) -> intp(2, 0, 1)
	.word 0x9d3c0011  ! 1: SRA_R	sra 	%r16, %r17, %r14
	.word 0xaf2c0011  ! 1: SLL_R	sll 	%r16, %r17, %r23
	.word 0x989c2433  ! 1: XORcc_I	xorcc 	%r16, 0x0433, %r12
	.word 0x83340011  ! 1: SRL_R	srl 	%r16, %r17, %r1
thr3_nuke_intr_96:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_96), 16, 16)) -> intp(2, 2, 1)
	.word 0xa89427e2  ! 1: ORcc_I	orcc 	%r16, 0x07e2, %r20
	.word 0xb37c0411  ! 1: MOVR_R	movre	%r16, %r17, %r25
	.word 0xa8ac2a3c  ! 1: ANDNcc_I	andncc 	%r16, 0x0a3c, %r20
	.word 0x989c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r12
thr3_resum_intr_97:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_97), 16, 16)) -> intp(2, 3, 1)
	.word 0x942c2d83  ! 1: ANDN_I	andn 	%r16, 0x0d83, %r10
	.word 0xac0423ba  ! 1: ADD_I	add 	%r16, 0x03ba, %r22
	.word 0x952c1011  ! 1: SLLX_R	sllx	%r16, %r17, %r10
	.word 0x9a1c0011  ! 1: XOR_R	xor 	%r16, %r17, %r13
thr3_hw_intr_98:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_98), 16, 16)) -> intp(0, 0, 1)
	.word 0xb2040011  ! 1: ADD_R	add 	%r16, %r17, %r25
thr3_nuke_intr_99:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_99), 16, 16)) -> intp(2, 2, 1)
	.word 0x933c2001  ! 1: SRA_I	sra 	%r16, 0x0001, %r9
thr3_resum_intr_100:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_100), 16, 16)) -> intp(2, 3, 1)
	.word 0x843c0011  ! 1: XNOR_R	xnor 	%r16, %r17, %r2
thr3_hw_intr_101:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_101), 16, 16)) -> intp(2, 0, 1)
	.word 0x8b7c0411  ! 1: MOVR_R	movre	%r16, %r17, %r5
thr3_hw_intr_102:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_102), 16, 16)) -> intp(2, 0, 1)
	.word 0xb3341011  ! 1: SRLX_R	srlx	%r16, %r17, %r25
	.word 0x90bc27cd  ! 1: XNORcc_I	xnorcc 	%r16, 0x07cd, %r8
	.word 0x989c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r12
thr3_hw_intr_103:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_103), 16, 16)) -> intp(1, 0, 1)
	.word 0x89340011  ! 1: SRL_R	srl 	%r16, %r17, %r4
	.word 0x9c942c31  ! 1: ORcc_I	orcc 	%r16, 0x0c31, %r14
	.word 0xb73c2001  ! 1: SRA_I	sra 	%r16, 0x0001, %r27
thr3_nuke_intr_104:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_104), 16, 16)) -> intp(2, 2, 1)
	.word 0x93643801  ! 1: MOVcc_I	<illegal instruction>
	.word 0xb13c2001  ! 1: SRA_I	sra 	%r16, 0x0001, %r24
	.word 0x87340011  ! 1: SRL_R	srl 	%r16, %r17, %r3
	.word 0xac140011  ! 1: OR_R	or 	%r16, %r17, %r22
thr3_resum_intr_105:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_105), 16, 16)) -> intp(2, 3, 1)
	.word 0x993c1011  ! 1: SRAX_R	srax	%r16, %r17, %r12
	.word 0x902c0011  ! 1: ANDN_R	andn 	%r16, %r17, %r8
	.word 0x88bc23c5  ! 1: XNORcc_I	xnorcc 	%r16, 0x03c5, %r4
	.word 0xaa4425dc  ! 1: ADDC_I	addc 	%r16, 0x05dc, %r21
thr3_hw_intr_106:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_106), 16, 16)) -> intp(1, 0, 1)
	.word 0x932c2001  ! 1: SLL_I	sll 	%r16, 0x0001, %r9
thr3_hw_intr_107:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_107), 16, 16)) -> intp(0, 0, 1)
	.word 0xbac40011  ! 1: ADDCcc_R	addccc 	%r16, %r17, %r29
	.word 0xa6c40011  ! 1: ADDCcc_R	addccc 	%r16, %r17, %r19
	.word 0x9c9c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r14
thr3_hw_intr_108:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_108), 16, 16)) -> intp(2, 0, 1)
	.word 0xb41c0011  ! 1: XOR_R	xor 	%r16, %r17, %r26
	.word 0x960c2047  ! 1: AND_I	and 	%r16, 0x0047, %r11
thr3_hw_intr_109:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_109), 16, 16)) -> intp(2, 0, 1)
	.word 0x96040011  ! 1: ADD_R	add 	%r16, %r17, %r11
	.word 0x83641811  ! 1: MOVcc_R	<illegal instruction>
thr3_nuke_intr_110:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_110), 16, 16)) -> intp(1, 2, 1)
	.word 0x912c1011  ! 1: SLLX_R	sllx	%r16, %r17, %r8
	.word 0x822c0011  ! 1: ANDN_R	andn 	%r16, %r17, %r1
	.word 0x91643801  ! 1: MOVcc_I	<illegal instruction>
thr3_resum_intr_111:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_111), 16, 16)) -> intp(1, 3, 1)
	.word 0x8c2c289a  ! 1: ANDN_I	andn 	%r16, 0x089a, %r6
	.word 0xa8942828  ! 1: ORcc_I	orcc 	%r16, 0x0828, %r20
	.word 0x84342866  ! 1: ORN_I	orn 	%r16, 0x0866, %r2
thr3_nuke_intr_112:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_112), 16, 16)) -> intp(1, 2, 1)
	.word 0x9e042931  ! 1: ADD_I	add 	%r16, 0x0931, %r15
	.word 0xb49c20b8  ! 1: XORcc_I	xorcc 	%r16, 0x00b8, %r26
	.word 0x833c2001  ! 1: SRA_I	sra 	%r16, 0x0001, %r1
	.word 0x84c426b5  ! 1: ADDCcc_I	addccc 	%r16, 0x06b5, %r2
thr3_resum_intr_113:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_113), 16, 16)) -> intp(1, 3, 1)
	.word 0x9b3c2001  ! 1: SRA_I	sra 	%r16, 0x0001, %r13
	.word 0x8c340011  ! 1: ORN_R	orn 	%r16, %r17, %r6
	.word 0x928c0011  ! 1: ANDcc_R	andcc 	%r16, %r17, %r9
	.word 0xb8442b16  ! 1: ADDC_I	addc 	%r16, 0x0b16, %r28
thr3_hw_intr_114:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_114), 16, 16)) -> intp(1, 0, 1)
	.word 0xa8340011  ! 1: ORN_R	orn 	%r16, %r17, %r20
	.word 0x9d342001  ! 1: SRL_I	srl 	%r16, 0x0001, %r14
	.word 0x8c2c0011  ! 1: ANDN_R	andn 	%r16, %r17, %r6
thr3_nuke_intr_115:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_115), 16, 16)) -> intp(0, 2, 1)
	.word 0x961c23f1  ! 1: XOR_I	xor 	%r16, 0x03f1, %r11
	.word 0x868c2ec6  ! 1: ANDcc_I	andcc 	%r16, 0x0ec6, %r3
	.word 0x883423a3  ! 1: ORN_I	orn 	%r16, 0x03a3, %r4
thr3_resum_intr_116:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_116), 16, 16)) -> intp(0, 3, 1)
	.word 0x84b42020  ! 1: ORNcc_I	orncc 	%r16, 0x0020, %r2
	.word 0x8f340011  ! 1: SRL_R	srl 	%r16, %r17, %r7
	.word 0x909c28c5  ! 1: XORcc_I	xorcc 	%r16, 0x08c5, %r8
thr3_hw_intr_117:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_117), 16, 16)) -> intp(0, 0, 1)
	.word 0xb12c0011  ! 1: SLL_R	sll 	%r16, %r17, %r24
thr3_nuke_intr_118:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_118), 16, 16)) -> intp(0, 2, 1)
	.word 0xb0442c28  ! 1: ADDC_I	addc 	%r16, 0x0c28, %r24
	.word 0xb92c1011  ! 1: SLLX_R	sllx	%r16, %r17, %r28
	.word 0x90842f94  ! 1: ADDcc_I	addcc 	%r16, 0x0f94, %r8
	.word 0xae0c0011  ! 1: AND_R	and 	%r16, %r17, %r23
thr3_resum_intr_119:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_119), 16, 16)) -> intp(0, 3, 1)
	.word 0x8c3c0011  ! 1: XNOR_R	xnor 	%r16, %r17, %r6
	.word 0x84140011  ! 1: OR_R	or 	%r16, %r17, %r2
	.word 0x872c1011  ! 1: SLLX_R	sllx	%r16, %r17, %r3
	.word 0xa6440011  ! 1: ADDC_R	addc 	%r16, %r17, %r19
thr3_hw_intr_120:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_120), 16, 16)) -> intp(1, 0, 1)
	.word 0xb2842836  ! 1: ADDcc_I	addcc 	%r16, 0x0836, %r25
	.word 0x961c2560  ! 1: XOR_I	xor 	%r16, 0x0560, %r11
	.word 0x9e8c0011  ! 1: ANDcc_R	andcc 	%r16, %r17, %r15
	.word 0x837c2401  ! 1: MOVR_I	movre	%r16, 0x1, %r1
thr3_hw_intr_121:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_121), 16, 16)) -> intp(0, 0, 1)
	.word 0x988c2f98  ! 1: ANDcc_I	andcc 	%r16, 0x0f98, %r12
thr3_hw_intr_122:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_122), 16, 16)) -> intp(0, 0, 1)
	.word 0xb68426e4  ! 1: ADDcc_I	addcc 	%r16, 0x06e4, %r27
	.word 0xb8b424ac  ! 1: ORNcc_I	orncc 	%r16, 0x04ac, %r28
	.word 0xa97c0411  ! 1: MOVR_R	movre	%r16, %r17, %r20
thr3_hw_intr_123:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_123), 16, 16)) -> intp(1, 0, 1)
	.word 0x8c340011  ! 1: ORN_R	orn 	%r16, %r17, %r6
thr3_nuke_intr_124:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_124), 16, 16)) -> intp(0, 2, 1)
	.word 0xb21c23ef  ! 1: XOR_I	xor 	%r16, 0x03ef, %r25
thr3_resum_intr_125:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_125), 16, 16)) -> intp(0, 3, 1)
	.word 0x97343001  ! 1: SRLX_I	srlx	%r16, 0x0001, %r11
thr3_hw_intr_126:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_126), 16, 16)) -> intp(0, 0, 1)
	.word 0x8d341011  ! 1: SRLX_R	srlx	%r16, %r17, %r6
	.word 0xb6040011  ! 1: ADD_R	add 	%r16, %r17, %r27
thr3_hw_intr_127:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_127), 16, 16)) -> intp(0, 0, 1)
	.word 0x8f2c1011  ! 1: SLLX_R	sllx	%r16, %r17, %r7
thr3_nuke_intr_128:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_128), 16, 16)) -> intp(1, 2, 1)
	.word 0xac0c0011  ! 1: AND_R	and 	%r16, %r17, %r22
	.word 0x8b340011  ! 1: SRL_R	srl 	%r16, %r17, %r5
	.word 0xb03425e4  ! 1: ORN_I	orn 	%r16, 0x05e4, %r24
thr3_resum_intr_129:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_129), 16, 16)) -> intp(1, 3, 1)
	.word 0xb3341011  ! 1: SRLX_R	srlx	%r16, %r17, %r25
	.word 0x953c0011  ! 1: SRA_R	sra 	%r16, %r17, %r10
	.word 0x8eb40011  ! 1: ORNcc_R	orncc 	%r16, %r17, %r7
thr3_nuke_intr_130:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_130), 16, 16)) -> intp(1, 2, 1)
	.word 0x8d340011  ! 1: SRL_R	srl 	%r16, %r17, %r6
	.word 0x868c0011  ! 1: ANDcc_R	andcc 	%r16, %r17, %r3
	.word 0x960c2fc4  ! 1: AND_I	and 	%r16, 0x0fc4, %r11
	.word 0x977c0411  ! 1: MOVR_R	movre	%r16, %r17, %r11
thr3_resum_intr_131:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_131), 16, 16)) -> intp(1, 3, 1)
	.word 0x86bc2460  ! 1: XNORcc_I	xnorcc 	%r16, 0x0460, %r3
	.word 0x849c2401  ! 1: XORcc_I	xorcc 	%r16, 0x0401, %r2
	.word 0x940c2fdc  ! 1: AND_I	and 	%r16, 0x0fdc, %r10
	.word 0x857c2401  ! 1: MOVR_I	movre	%r16, 0x1, %r2
thr3_hw_intr_132:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_132), 16, 16)) -> intp(2, 0, 1)
	.word 0x95643801  ! 1: MOVcc_I	<illegal instruction>
	.word 0xa6340011  ! 1: ORN_R	orn 	%r16, %r17, %r19
	.word 0xa6c4261b  ! 1: ADDCcc_I	addccc 	%r16, 0x061b, %r19
thr3_nuke_intr_133:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_133), 16, 16)) -> intp(2, 2, 1)
	.word 0x8a340011  ! 1: ORN_R	orn 	%r16, %r17, %r5
thr3_resum_intr_134:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_134), 16, 16)) -> intp(2, 3, 1)
	.word 0x8c842af0  ! 1: ADDcc_I	addcc 	%r16, 0x0af0, %r6
thr3_hw_intr_135:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_135), 16, 16)) -> intp(0, 0, 1)
	.word 0x973c0011  ! 1: SRA_R	sra 	%r16, %r17, %r11
thr3_hw_intr_136:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_136), 16, 16)) -> intp(2, 0, 1)
	.word 0x952c2001  ! 1: SLL_I	sll 	%r16, 0x0001, %r10
	.word 0x9aac24f1  ! 1: ANDNcc_I	andncc 	%r16, 0x04f1, %r13
	.word 0x842c2098  ! 1: ANDN_I	andn 	%r16, 0x0098, %r2
	.word 0x909c28b1  ! 1: XORcc_I	xorcc 	%r16, 0x08b1, %r8
thr3_nuke_intr_137:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_137), 16, 16)) -> intp(2, 2, 1)
	.word 0x82ac0011  ! 1: ANDNcc_R	andncc 	%r16, %r17, %r1
	.word 0x82ac2200  ! 1: ANDNcc_I	andncc 	%r16, 0x0200, %r1
	.word 0x837c2401  ! 1: MOVR_I	movre	%r16, 0x1, %r1
thr3_resum_intr_138:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_138), 16, 16)) -> intp(2, 3, 1)
	.word 0x969c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r11
	.word 0x88b4212c  ! 1: ORNcc_I	orncc 	%r16, 0x012c, %r4
	.word 0xb57c0411  ! 1: MOVR_R	movre	%r16, %r17, %r26
thr3_hw_intr_139:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_139), 16, 16)) -> intp(0, 0, 1)
	.word 0xbb2c1011  ! 1: SLLX_R	sllx	%r16, %r17, %r29
	.word 0xb7342001  ! 1: SRL_I	srl 	%r16, 0x0001, %r27
	.word 0xb01429ec  ! 1: OR_I	or 	%r16, 0x09ec, %r24
	.word 0xb6040011  ! 1: ADD_R	add 	%r16, %r17, %r27
thr3_hw_intr_140:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_140), 16, 16)) -> intp(0, 0, 1)
	.word 0xb3343001  ! 1: SRLX_I	srlx	%r16, 0x0001, %r25
	.word 0x98c40011  ! 1: ADDCcc_R	addccc 	%r16, %r17, %r12
	.word 0xae140011  ! 1: OR_R	or 	%r16, %r17, %r23
thr3_nuke_intr_141:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_141), 16, 16)) -> intp(2, 2, 1)
	.word 0x9b7c2401  ! 1: MOVR_I	movre	%r16, 0x1, %r13
	.word 0x94ac0011  ! 1: ANDNcc_R	andncc 	%r16, %r17, %r10
	.word 0x9e2c0011  ! 1: ANDN_R	andn 	%r16, %r17, %r15
	.word 0x8a34223f  ! 1: ORN_I	orn 	%r16, 0x023f, %r5
thr3_resum_intr_142:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_142), 16, 16)) -> intp(2, 3, 1)
	.word 0xb2ac288c  ! 1: ANDNcc_I	andncc 	%r16, 0x088c, %r25
	.word 0xa7641811  ! 1: MOVcc_R	<illegal instruction>
	.word 0x95340011  ! 1: SRL_R	srl 	%r16, %r17, %r10
	.word 0x960c0011  ! 1: AND_R	and 	%r16, %r17, %r11
thr3_hw_intr_143:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_143), 16, 16)) -> intp(2, 0, 1)
	.word 0xaa840011  ! 1: ADDcc_R	addcc 	%r16, %r17, %r21
	.word 0x90ac0011  ! 1: ANDNcc_R	andncc 	%r16, %r17, %r8
thr3_hw_intr_144:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_144), 16, 16)) -> intp(2, 0, 1)
	.word 0xac8c0011  ! 1: ANDcc_R	andcc 	%r16, %r17, %r22
thr3_hw_intr_145:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_145), 16, 16)) -> intp(2, 0, 1)
	.word 0x8b3c0011  ! 1: SRA_R	sra 	%r16, %r17, %r5
thr3_hw_intr_146:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_146), 16, 16)) -> intp(0, 0, 1)
	.word 0x8e9c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r7
	.word 0xa62c0011  ! 1: ANDN_R	andn 	%r16, %r17, %r19
	.word 0x9d643801  ! 1: MOVcc_I	<illegal instruction>
	.word 0xb2140011  ! 1: OR_R	or 	%r16, %r17, %r25
thr3_hw_intr_147:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_147), 16, 16)) -> intp(0, 0, 1)
	.word 0x82840011  ! 1: ADDcc_R	addcc 	%r16, %r17, %r1
	.word 0x8e440011  ! 1: ADDC_R	addc 	%r16, %r17, %r7
thr3_nuke_intr_148:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_148), 16, 16)) -> intp(0, 2, 1)
	.word 0x8e0424f2  ! 1: ADD_I	add 	%r16, 0x04f2, %r7
thr3_resum_intr_149:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_149), 16, 16)) -> intp(0, 3, 1)
	.word 0x8b643801  ! 1: MOVcc_I	<illegal instruction>
thr3_hw_intr_150:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_150), 16, 16)) -> intp(0, 0, 1)
	.word 0x893c0011  ! 1: SRA_R	sra 	%r16, %r17, %r4
	.word 0xa8b40011  ! 1: ORNcc_R	orncc 	%r16, %r17, %r20
thr3_hw_intr_151:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_151), 16, 16)) -> intp(0, 0, 1)
	.word 0x9e84261d  ! 1: ADDcc_I	addcc 	%r16, 0x061d, %r15
	.word 0x969c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r11
thr3_hw_intr_152:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_152), 16, 16)) -> intp(2, 0, 1)
	.word 0x9ab40011  ! 1: ORNcc_R	orncc 	%r16, %r17, %r13
	.word 0x8e142a1b  ! 1: OR_I	or 	%r16, 0x0a1b, %r7
	.word 0xa72c0011  ! 1: SLL_R	sll 	%r16, %r17, %r19
	.word 0x889c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r4
thr3_nuke_intr_153:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_153), 16, 16)) -> intp(2, 2, 1)
	.word 0x86842a18  ! 1: ADDcc_I	addcc 	%r16, 0x0a18, %r3
	.word 0x8d7c0411  ! 1: MOVR_R	movre	%r16, %r17, %r6
thr3_resum_intr_154:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_154), 16, 16)) -> intp(2, 3, 1)
	.word 0x968423df  ! 1: ADDcc_I	addcc 	%r16, 0x03df, %r11
	.word 0x9e942372  ! 1: ORcc_I	orcc 	%r16, 0x0372, %r15
thr3_hw_intr_155:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_155), 16, 16)) -> intp(1, 0, 1)
	.word 0xba0c0011  ! 1: AND_R	and 	%r16, %r17, %r29
	.word 0x92340011  ! 1: ORN_R	orn 	%r16, %r17, %r9
thr3_hw_intr_156:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_156), 16, 16)) -> intp(2, 0, 1)
	.word 0xb09c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r24
	.word 0xb57c0411  ! 1: MOVR_R	movre	%r16, %r17, %r26
thr3_nuke_intr_157:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_157), 16, 16)) -> intp(0, 2, 1)
	.word 0x9d2c2001  ! 1: SLL_I	sll 	%r16, 0x0001, %r14
	.word 0x9a2c0011  ! 1: ANDN_R	andn 	%r16, %r17, %r13
	.word 0x9a1c2909  ! 1: XOR_I	xor 	%r16, 0x0909, %r13
	.word 0x857c0411  ! 1: MOVR_R	movre	%r16, %r17, %r2
thr3_resum_intr_158:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_158), 16, 16)) -> intp(0, 3, 1)
	.word 0x98bc214c  ! 1: XNORcc_I	xnorcc 	%r16, 0x014c, %r12
	.word 0x877c2401  ! 1: MOVR_I	movre	%r16, 0x1, %r3
	.word 0xb97c0411  ! 1: MOVR_R	movre	%r16, %r17, %r28
	.word 0x9d3c2001  ! 1: SRA_I	sra 	%r16, 0x0001, %r14
thr3_nuke_intr_159:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_159), 16, 16)) -> intp(1, 2, 1)
	.word 0xa92c0011  ! 1: SLL_R	sll 	%r16, %r17, %r20
	.word 0xb2c4267f  ! 1: ADDCcc_I	addccc 	%r16, 0x067f, %r25
	.word 0xae142e8e  ! 1: OR_I	or 	%r16, 0x0e8e, %r23
	.word 0x9e842c5a  ! 1: ADDcc_I	addcc 	%r16, 0x0c5a, %r15
thr3_resum_intr_160:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_160), 16, 16)) -> intp(1, 3, 1)
	.word 0x8d3c0011  ! 1: SRA_R	sra 	%r16, %r17, %r6
	.word 0xa8940011  ! 1: ORcc_R	orcc 	%r16, %r17, %r20
	.word 0x8c84225d  ! 1: ADDcc_I	addcc 	%r16, 0x025d, %r6
	.word 0x952c1011  ! 1: SLLX_R	sllx	%r16, %r17, %r10
thr3_hw_intr_161:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_161), 16, 16)) -> intp(2, 0, 1)
	.word 0xab641811  ! 1: MOVcc_R	<illegal instruction>
thr3_nuke_intr_162:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_162), 16, 16)) -> intp(0, 2, 1)
	.word 0x88142e89  ! 1: OR_I	or 	%r16, 0x0e89, %r4
	.word 0x88040011  ! 1: ADD_R	add 	%r16, %r17, %r4
thr3_resum_intr_163:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_163), 16, 16)) -> intp(0, 3, 1)
	.word 0xad641811  ! 1: MOVcc_R	<illegal instruction>
	.word 0x8e2c2bbb  ! 1: ANDN_I	andn 	%r16, 0x0bbb, %r7
thr3_hw_intr_164:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_164), 16, 16)) -> intp(1, 0, 1)
	.word 0x892c1011  ! 1: SLLX_R	sllx	%r16, %r17, %r4
	.word 0xaf340011  ! 1: SRL_R	srl 	%r16, %r17, %r23
thr3_hw_intr_165:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_165), 16, 16)) -> intp(0, 0, 1)
	.word 0xbb7c0411  ! 1: MOVR_R	movre	%r16, %r17, %r29
thr3_hw_intr_166:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_166), 16, 16)) -> intp(0, 0, 1)
	.word 0x9e040011  ! 1: ADD_R	add 	%r16, %r17, %r15
	.word 0x8e442021  ! 1: ADDC_I	addc 	%r16, 0x0021, %r7
thr3_nuke_intr_167:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_167), 16, 16)) -> intp(2, 2, 1)
	.word 0xac3c257b  ! 1: XNOR_I	xnor 	%r16, 0x057b, %r22
	.word 0xb48c2e11  ! 1: ANDcc_I	andcc 	%r16, 0x0e11, %r26
	.word 0x8f2c1011  ! 1: SLLX_R	sllx	%r16, %r17, %r7
thr3_resum_intr_168:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_168), 16, 16)) -> intp(2, 3, 1)
	.word 0x8c8c2852  ! 1: ANDcc_I	andcc 	%r16, 0x0852, %r6
	.word 0x8f2c2001  ! 1: SLL_I	sll 	%r16, 0x0001, %r7
	.word 0x82c40011  ! 1: ADDCcc_R	addccc 	%r16, %r17, %r1
thr3_nuke_intr_169:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_169), 16, 16)) -> intp(0, 2, 1)
	.word 0xa60c2293  ! 1: AND_I	and 	%r16, 0x0293, %r19
	.word 0xa6c40011  ! 1: ADDCcc_R	addccc 	%r16, %r17, %r19
	.word 0x8a942f4f  ! 1: ORcc_I	orcc 	%r16, 0x0f4f, %r5
thr3_resum_intr_170:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_170), 16, 16)) -> intp(0, 3, 1)
	.word 0xb23c2e12  ! 1: XNOR_I	xnor 	%r16, 0x0e12, %r25
	.word 0xb0b42447  ! 1: ORNcc_I	orncc 	%r16, 0x0447, %r24
	.word 0x8d343001  ! 1: SRLX_I	srlx	%r16, 0x0001, %r6
thr3_hw_intr_171:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_171), 16, 16)) -> intp(0, 0, 1)
	.word 0xa6140011  ! 1: OR_R	or 	%r16, %r17, %r19
	.word 0x98c42008  ! 1: ADDCcc_I	addccc 	%r16, 0x0008, %r12
	.word 0xb2440011  ! 1: ADDC_R	addc 	%r16, %r17, %r25
thr3_nuke_intr_172:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_172), 16, 16)) -> intp(2, 2, 1)
	.word 0x8cc40011  ! 1: ADDCcc_R	addccc 	%r16, %r17, %r6
	.word 0xb7340011  ! 1: SRL_R	srl 	%r16, %r17, %r27
thr3_resum_intr_173:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_173), 16, 16)) -> intp(2, 3, 1)
	.word 0xb72c3001  ! 1: SLLX_I	sllx	%r16, 0x0001, %r27
	.word 0xb08c2a00  ! 1: ANDcc_I	andcc 	%r16, 0x0a00, %r24
thr3_nuke_intr_174:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_174), 16, 16)) -> intp(1, 2, 1)
	.word 0x9a340011  ! 1: ORN_R	orn 	%r16, %r17, %r13
	.word 0x8e942ecd  ! 1: ORcc_I	orcc 	%r16, 0x0ecd, %r7
	.word 0x901c2b82  ! 1: XOR_I	xor 	%r16, 0x0b82, %r8
thr3_resum_intr_175:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_175), 16, 16)) -> intp(1, 3, 1)
	.word 0x9d341011  ! 1: SRLX_R	srlx	%r16, %r17, %r14
	.word 0x96440011  ! 1: ADDC_R	addc 	%r16, %r17, %r11
	.word 0x93343001  ! 1: SRLX_I	srlx	%r16, 0x0001, %r9
thr3_hw_intr_176:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_176), 16, 16)) -> intp(0, 0, 1)
	.word 0xb53c1011  ! 1: SRAX_R	srax	%r16, %r17, %r26
thr3_nuke_intr_177:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_177), 16, 16)) -> intp(2, 2, 1)
	.word 0xac940011  ! 1: ORcc_R	orcc 	%r16, %r17, %r22
thr3_resum_intr_178:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_178), 16, 16)) -> intp(2, 3, 1)
	.word 0x8a840011  ! 1: ADDcc_R	addcc 	%r16, %r17, %r5
thr3_hw_intr_179:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_179), 16, 16)) -> intp(2, 0, 1)
	.word 0xb4440011  ! 1: ADDC_R	addc 	%r16, %r17, %r26
	.word 0xb0942d32  ! 1: ORcc_I	orcc 	%r16, 0x0d32, %r24
thr3_hw_intr_180:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_180), 16, 16)) -> intp(1, 0, 1)
	.word 0x98040011  ! 1: ADD_R	add 	%r16, %r17, %r12
	.word 0x9b340011  ! 1: SRL_R	srl 	%r16, %r17, %r13
	.word 0x8ab4236a  ! 1: ORNcc_I	orncc 	%r16, 0x036a, %r5
thr3_nuke_intr_181:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_181), 16, 16)) -> intp(1, 2, 1)
	.word 0x892c2001  ! 1: SLL_I	sll 	%r16, 0x0001, %r4
thr3_resum_intr_182:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_182), 16, 16)) -> intp(1, 3, 1)
	.word 0x84142ffd  ! 1: OR_I	or 	%r16, 0x0ffd, %r2
thr3_nuke_intr_183:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_183), 16, 16)) -> intp(1, 2, 1)
	.word 0x9f2c2001  ! 1: SLL_I	sll 	%r16, 0x0001, %r15
	.word 0x84bc0011  ! 1: XNORcc_R	xnorcc 	%r16, %r17, %r2
thr3_resum_intr_184:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_184), 16, 16)) -> intp(1, 3, 1)
	.word 0x9e940011  ! 1: ORcc_R	orcc 	%r16, %r17, %r15
	.word 0xaa342bcb  ! 1: ORN_I	orn 	%r16, 0x0bcb, %r21
thr3_hw_intr_185:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_185), 16, 16)) -> intp(2, 0, 1)
	.word 0xb17c0411  ! 1: MOVR_R	movre	%r16, %r17, %r24
	.word 0x91341011  ! 1: SRLX_R	srlx	%r16, %r17, %r8
thr3_hw_intr_186:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_186), 16, 16)) -> intp(2, 0, 1)
	.word 0x9a3c2985  ! 1: XNOR_I	xnor 	%r16, 0x0985, %r13
	.word 0xbaac0011  ! 1: ANDNcc_R	andncc 	%r16, %r17, %r29
	.word 0x829c27cb  ! 1: XORcc_I	xorcc 	%r16, 0x07cb, %r1
	.word 0x8cac0011  ! 1: ANDNcc_R	andncc 	%r16, %r17, %r6
thr3_nuke_intr_187:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_187), 16, 16)) -> intp(2, 2, 1)
	.word 0x832c3001  ! 1: SLLX_I	sllx	%r16, 0x0001, %r1
	.word 0xb2c40011  ! 1: ADDCcc_R	addccc 	%r16, %r17, %r25
	.word 0x99343001  ! 1: SRLX_I	srlx	%r16, 0x0001, %r12
thr3_resum_intr_188:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_188), 16, 16)) -> intp(2, 3, 1)
	.word 0xa6bc2942  ! 1: XNORcc_I	xnorcc 	%r16, 0x0942, %r19
	.word 0x9b3c2001  ! 1: SRA_I	sra 	%r16, 0x0001, %r13
	.word 0x9a9424f2  ! 1: ORcc_I	orcc 	%r16, 0x04f2, %r13
thr3_nuke_intr_189:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_189), 16, 16)) -> intp(0, 2, 1)
	.word 0xab341011  ! 1: SRLX_R	srlx	%r16, %r17, %r21
	.word 0xac440011  ! 1: ADDC_R	addc 	%r16, %r17, %r22
thr3_resum_intr_190:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_190), 16, 16)) -> intp(0, 3, 1)
	.word 0x972c0011  ! 1: SLL_R	sll 	%r16, %r17, %r11
	.word 0x849c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r2
thr3_hw_intr_191:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_191), 16, 16)) -> intp(0, 0, 1)
	.word 0x968c0011  ! 1: ANDcc_R	andcc 	%r16, %r17, %r11
	.word 0x9c2c23e1  ! 1: ANDN_I	andn 	%r16, 0x03e1, %r14
	.word 0x8c8c2435  ! 1: ANDcc_I	andcc 	%r16, 0x0435, %r6
thr3_hw_intr_192:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_192), 16, 16)) -> intp(2, 0, 1)
	.word 0x981c0011  ! 1: XOR_R	xor 	%r16, %r17, %r12
thr3_nuke_intr_193:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_193), 16, 16)) -> intp(1, 2, 1)
	.word 0xaec40011  ! 1: ADDCcc_R	addccc 	%r16, %r17, %r23
	.word 0x8f641811  ! 1: MOVcc_R	<illegal instruction>
	.word 0x88b40011  ! 1: ORNcc_R	orncc 	%r16, %r17, %r4
thr3_resum_intr_194:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_194), 16, 16)) -> intp(1, 3, 1)
	.word 0x8ac4241f  ! 1: ADDCcc_I	addccc 	%r16, 0x041f, %r5
	.word 0x9e1c0011  ! 1: XOR_R	xor 	%r16, %r17, %r15
	.word 0x8f3c2001  ! 1: SRA_I	sra 	%r16, 0x0001, %r7
thr3_hw_intr_195:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_195), 16, 16)) -> intp(1, 0, 1)
	.word 0xab2c2001  ! 1: SLL_I	sll 	%r16, 0x0001, %r21
	.word 0x832c0011  ! 1: SLL_R	sll 	%r16, %r17, %r1
thr3_hw_intr_196:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_196), 16, 16)) -> intp(1, 0, 1)
	.word 0xba2c0011  ! 1: ANDN_R	andn 	%r16, %r17, %r29
	.word 0xbb341011  ! 1: SRLX_R	srlx	%r16, %r17, %r29
thr3_nuke_intr_197:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_197), 16, 16)) -> intp(2, 2, 1)
	.word 0xb29421f5  ! 1: ORcc_I	orcc 	%r16, 0x01f5, %r25
	.word 0xa61c2340  ! 1: XOR_I	xor 	%r16, 0x0340, %r19
	.word 0xa81c2206  ! 1: XOR_I	xor 	%r16, 0x0206, %r20
thr3_resum_intr_198:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_198), 16, 16)) -> intp(2, 3, 1)
	.word 0xa97c2401  ! 1: MOVR_I	movre	%r16, 0x1, %r20
	.word 0x98b40011  ! 1: ORNcc_R	orncc 	%r16, %r17, %r12
	.word 0xb8140011  ! 1: OR_R	or 	%r16, %r17, %r28
thr3_nuke_intr_199:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_199), 16, 16)) -> intp(0, 2, 1)
	.word 0x832c2001  ! 1: SLL_I	sll 	%r16, 0x0001, %r1
	.word 0xb53c2001  ! 1: SRA_I	sra 	%r16, 0x0001, %r26
thr3_resum_intr_200:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_200), 16, 16)) -> intp(0, 3, 1)
	.word 0xa8940011  ! 1: ORcc_R	orcc 	%r16, %r17, %r20
	.word 0x88442ea2  ! 1: ADDC_I	addc 	%r16, 0x0ea2, %r4
thr3_hw_intr_201:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_201), 16, 16)) -> intp(1, 0, 1)
	.word 0x840c0011  ! 1: AND_R	and 	%r16, %r17, %r2
	.word 0x9b3c2001  ! 1: SRA_I	sra 	%r16, 0x0001, %r13
thr3_hw_intr_202:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_202), 16, 16)) -> intp(2, 0, 1)
	.word 0x8b342001  ! 1: SRL_I	srl 	%r16, 0x0001, %r5
	.word 0xaaac0011  ! 1: ANDNcc_R	andncc 	%r16, %r17, %r21
	.word 0x8cc42ed6  ! 1: ADDCcc_I	addccc 	%r16, 0x0ed6, %r6
	.word 0x8b2c2001  ! 1: SLL_I	sll 	%r16, 0x0001, %r5
thr3_nuke_intr_203:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_203), 16, 16)) -> intp(1, 2, 1)
	.word 0x860424b3  ! 1: ADD_I	add 	%r16, 0x04b3, %r3
thr3_resum_intr_204:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_204), 16, 16)) -> intp(1, 3, 1)
	.word 0x84140011  ! 1: OR_R	or 	%r16, %r17, %r2
thr3_nuke_intr_205:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_205), 16, 16)) -> intp(1, 2, 1)
	.word 0xb60c0011  ! 1: AND_R	and 	%r16, %r17, %r27
	.word 0x96840011  ! 1: ADDcc_R	addcc 	%r16, %r17, %r11
thr3_resum_intr_206:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_206), 16, 16)) -> intp(1, 3, 1)
	.word 0x963c0011  ! 1: XNOR_R	xnor 	%r16, %r17, %r11
	.word 0x843c21f8  ! 1: XNOR_I	xnor 	%r16, 0x01f8, %r2
thr3_hw_intr_207:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_207), 16, 16)) -> intp(1, 0, 1)
	.word 0x85342001  ! 1: SRL_I	srl 	%r16, 0x0001, %r2
	.word 0x823c2d79  ! 1: XNOR_I	xnor 	%r16, 0x0d79, %r1
	.word 0x9c340011  ! 1: ORN_R	orn 	%r16, %r17, %r14
thr3_hw_intr_208:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_208), 16, 16)) -> intp(1, 0, 1)
	.word 0x9f643801  ! 1: MOVcc_I	<illegal instruction>
thr3_hw_intr_209:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_209), 16, 16)) -> intp(1, 0, 1)
	.word 0xa6440011  ! 1: ADDC_R	addc 	%r16, %r17, %r19
	.word 0xa69c2ff2  ! 1: XORcc_I	xorcc 	%r16, 0x0ff2, %r19
thr3_nuke_intr_210:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_210), 16, 16)) -> intp(2, 2, 1)
	.word 0xad340011  ! 1: SRL_R	srl 	%r16, %r17, %r22
	.word 0x83641811  ! 1: MOVcc_R	<illegal instruction>
	.word 0x9a142211  ! 1: OR_I	or 	%r16, 0x0211, %r13
	.word 0xaab42fff  ! 1: ORNcc_I	orncc 	%r16, 0x0fff, %r21
thr3_resum_intr_211:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_211), 16, 16)) -> intp(2, 3, 1)
	.word 0x8f2c0011  ! 1: SLL_R	sll 	%r16, %r17, %r7
	.word 0x92842fb3  ! 1: ADDcc_I	addcc 	%r16, 0x0fb3, %r9
	.word 0x920c0011  ! 1: AND_R	and 	%r16, %r17, %r9
	.word 0xbac42a0b  ! 1: ADDCcc_I	addccc 	%r16, 0x0a0b, %r29
thr3_nuke_intr_212:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_212), 16, 16)) -> intp(1, 2, 1)
	.word 0xacc42da6  ! 1: ADDCcc_I	addccc 	%r16, 0x0da6, %r22
thr3_resum_intr_213:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_213), 16, 16)) -> intp(1, 3, 1)
	.word 0x941c2473  ! 1: XOR_I	xor 	%r16, 0x0473, %r10
thr3_nuke_intr_214:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_214), 16, 16)) -> intp(1, 2, 1)
	.word 0xb8442a98  ! 1: ADDC_I	addc 	%r16, 0x0a98, %r28
thr3_resum_intr_215:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_215), 16, 16)) -> intp(1, 3, 1)
	.word 0x9c0c0011  ! 1: AND_R	and 	%r16, %r17, %r14
thr3_nuke_intr_216:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_216), 16, 16)) -> intp(0, 2, 1)
	.word 0x84b40011  ! 1: ORNcc_R	orncc 	%r16, %r17, %r2
	.word 0xbab40011  ! 1: ORNcc_R	orncc 	%r16, %r17, %r29
	.word 0x893c1011  ! 1: SRAX_R	srax	%r16, %r17, %r4
	.word 0x963c26b4  ! 1: XNOR_I	xnor 	%r16, 0x06b4, %r11
thr3_resum_intr_217:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_217), 16, 16)) -> intp(0, 3, 1)
	.word 0x821c24df  ! 1: XOR_I	xor 	%r16, 0x04df, %r1
	.word 0xb80c0011  ! 1: AND_R	and 	%r16, %r17, %r28
	.word 0x9e3c2807  ! 1: XNOR_I	xnor 	%r16, 0x0807, %r15
	.word 0xb12c1011  ! 1: SLLX_R	sllx	%r16, %r17, %r24
thr3_hw_intr_218:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_218), 16, 16)) -> intp(0, 0, 1)
	.word 0x88c4296b  ! 1: ADDCcc_I	addccc 	%r16, 0x096b, %r4
thr3_hw_intr_219:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_219), 16, 16)) -> intp(0, 0, 1)
	.word 0x8a040011  ! 1: ADD_R	add 	%r16, %r17, %r5
thr3_nuke_intr_220:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_220), 16, 16)) -> intp(1, 2, 1)
	.word 0x8e3c2aee  ! 1: XNOR_I	xnor 	%r16, 0x0aee, %r7
	.word 0x8e2c0011  ! 1: ANDN_R	andn 	%r16, %r17, %r7
	.word 0xb4340011  ! 1: ORN_R	orn 	%r16, %r17, %r26
	.word 0x969c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r11
thr3_resum_intr_221:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_221), 16, 16)) -> intp(1, 3, 1)
	.word 0xaa8c2f4b  ! 1: ANDcc_I	andcc 	%r16, 0x0f4b, %r21
	.word 0x88bc0011  ! 1: XNORcc_R	xnorcc 	%r16, %r17, %r4
	.word 0x8ec42e60  ! 1: ADDCcc_I	addccc 	%r16, 0x0e60, %r7
	.word 0x98ac0011  ! 1: ANDNcc_R	andncc 	%r16, %r17, %r12
thr3_nuke_intr_222:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_222), 16, 16)) -> intp(0, 2, 1)
	.word 0x82ac25fb  ! 1: ANDNcc_I	andncc 	%r16, 0x05fb, %r1
thr3_resum_intr_223:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_223), 16, 16)) -> intp(0, 3, 1)
	.word 0x9d7c2401  ! 1: MOVR_I	movre	%r16, 0x1, %r14
thr3_hw_intr_224:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_224), 16, 16)) -> intp(0, 0, 1)
	.word 0x8e140011  ! 1: OR_R	or 	%r16, %r17, %r7
	.word 0x837c2401  ! 1: MOVR_I	movre	%r16, 0x1, %r1
	.word 0xaf641811  ! 1: MOVcc_R	<illegal instruction>
thr3_nuke_intr_225:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_225), 16, 16)) -> intp(0, 2, 1)
	.word 0x88140011  ! 1: OR_R	or 	%r16, %r17, %r4
	.word 0xb3341011  ! 1: SRLX_R	srlx	%r16, %r17, %r25
	.word 0xaa342cc1  ! 1: ORN_I	orn 	%r16, 0x0cc1, %r21
	.word 0xaf3c2001  ! 1: SRA_I	sra 	%r16, 0x0001, %r23
thr3_resum_intr_226:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_226), 16, 16)) -> intp(0, 3, 1)
	.word 0xb20c2d68  ! 1: AND_I	and 	%r16, 0x0d68, %r25
	.word 0x94440011  ! 1: ADDC_R	addc 	%r16, %r17, %r10
	.word 0xb0940011  ! 1: ORcc_R	orcc 	%r16, %r17, %r24
	.word 0xa73c1011  ! 1: SRAX_R	srax	%r16, %r17, %r19
thr3_hw_intr_227:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_227), 16, 16)) -> intp(0, 0, 1)
	.word 0x90042d40  ! 1: ADD_I	add 	%r16, 0x0d40, %r8
thr3_nuke_intr_228:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_228), 16, 16)) -> intp(0, 2, 1)
	.word 0x94840011  ! 1: ADDcc_R	addcc 	%r16, %r17, %r10
	.word 0xae9c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r23
	.word 0xb8040011  ! 1: ADD_R	add 	%r16, %r17, %r28
	.word 0xac2c2f5a  ! 1: ANDN_I	andn 	%r16, 0x0f5a, %r22
thr3_resum_intr_229:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_229), 16, 16)) -> intp(0, 3, 1)
	.word 0x96c40011  ! 1: ADDCcc_R	addccc 	%r16, %r17, %r11
	.word 0x8a140011  ! 1: OR_R	or 	%r16, %r17, %r5
	.word 0x9614207b  ! 1: OR_I	or 	%r16, 0x007b, %r11
	.word 0x9c9c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r14
thr3_nuke_intr_230:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_230), 16, 16)) -> intp(2, 2, 1)
	.word 0xa83c0011  ! 1: XNOR_R	xnor 	%r16, %r17, %r20
thr3_resum_intr_231:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_231), 16, 16)) -> intp(2, 3, 1)
	.word 0x8a1c2ad9  ! 1: XOR_I	xor 	%r16, 0x0ad9, %r5
thr3_hw_intr_232:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_232), 16, 16)) -> intp(0, 0, 1)
	.word 0xb4040011  ! 1: ADD_R	add 	%r16, %r17, %r26
	.word 0xaa942777  ! 1: ORcc_I	orcc 	%r16, 0x0777, %r21
	.word 0x89342001  ! 1: SRL_I	srl 	%r16, 0x0001, %r4
thr3_hw_intr_233:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_233), 16, 16)) -> intp(1, 0, 1)
	.word 0x84bc26ee  ! 1: XNORcc_I	xnorcc 	%r16, 0x06ee, %r2
	.word 0xae8c24a8  ! 1: ANDcc_I	andcc 	%r16, 0x04a8, %r23
	.word 0x90042458  ! 1: ADD_I	add 	%r16, 0x0458, %r8
thr3_hw_intr_234:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_234), 16, 16)) -> intp(2, 0, 1)
	.word 0xa6040011  ! 1: ADD_R	add 	%r16, %r17, %r19
	.word 0x98c40011  ! 1: ADDCcc_R	addccc 	%r16, %r17, %r12
	.word 0x862c223e  ! 1: ANDN_I	andn 	%r16, 0x023e, %r3
	.word 0x94c42a5e  ! 1: ADDCcc_I	addccc 	%r16, 0x0a5e, %r10
thr3_nuke_intr_235:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_235), 16, 16)) -> intp(2, 2, 1)
	.word 0x900c0011  ! 1: AND_R	and 	%r16, %r17, %r8
	.word 0xb00c262b  ! 1: AND_I	and 	%r16, 0x062b, %r24
thr3_resum_intr_236:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_236), 16, 16)) -> intp(2, 3, 1)
	.word 0xb9343001  ! 1: SRLX_I	srlx	%r16, 0x0001, %r28
	.word 0x9a0c0011  ! 1: AND_R	and 	%r16, %r17, %r13
thr3_hw_intr_237:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_237), 16, 16)) -> intp(1, 0, 1)
	.word 0x93641811  ! 1: MOVcc_R	<illegal instruction>
	.word 0xb7340011  ! 1: SRL_R	srl 	%r16, %r17, %r27
thr3_nuke_intr_238:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_238), 16, 16)) -> intp(2, 2, 1)
	.word 0xb6b421f4  ! 1: ORNcc_I	orncc 	%r16, 0x01f4, %r27
	.word 0x86942f23  ! 1: ORcc_I	orcc 	%r16, 0x0f23, %r3
	.word 0x840c0011  ! 1: AND_R	and 	%r16, %r17, %r2
thr3_resum_intr_239:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_239), 16, 16)) -> intp(2, 3, 1)
	.word 0x852c2001  ! 1: SLL_I	sll 	%r16, 0x0001, %r2
	.word 0x93343001  ! 1: SRLX_I	srlx	%r16, 0x0001, %r9
	.word 0x972c0011  ! 1: SLL_R	sll 	%r16, %r17, %r11
thr3_hw_intr_240:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_240), 16, 16)) -> intp(2, 0, 1)
	.word 0x852c1011  ! 1: SLLX_R	sllx	%r16, %r17, %r2
thr3_nuke_intr_241:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_241), 16, 16)) -> intp(0, 2, 1)
	.word 0x968c0011  ! 1: ANDcc_R	andcc 	%r16, %r17, %r11
thr3_resum_intr_242:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_242), 16, 16)) -> intp(0, 3, 1)
	.word 0xb93c0011  ! 1: SRA_R	sra 	%r16, %r17, %r28
thr3_nuke_intr_243:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_243), 16, 16)) -> intp(1, 2, 1)
	.word 0x90942b54  ! 1: ORcc_I	orcc 	%r16, 0x0b54, %r8
	.word 0x868c2923  ! 1: ANDcc_I	andcc 	%r16, 0x0923, %r3
	.word 0xaa8c288a  ! 1: ANDcc_I	andcc 	%r16, 0x088a, %r21
	.word 0x90440011  ! 1: ADDC_R	addc 	%r16, %r17, %r8
thr3_resum_intr_244:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_244), 16, 16)) -> intp(1, 3, 1)
	.word 0x94c40011  ! 1: ADDCcc_R	addccc 	%r16, %r17, %r10
	.word 0x940c0011  ! 1: AND_R	and 	%r16, %r17, %r10
	.word 0x9b2c2001  ! 1: SLL_I	sll 	%r16, 0x0001, %r13
	.word 0x98840011  ! 1: ADDcc_R	addcc 	%r16, %r17, %r12
thr3_nuke_intr_245:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_245), 16, 16)) -> intp(2, 2, 1)
	.word 0x9d343001  ! 1: SRLX_I	srlx	%r16, 0x0001, %r14
	.word 0x892c2001  ! 1: SLL_I	sll 	%r16, 0x0001, %r4
	.word 0xa9342001  ! 1: SRL_I	srl 	%r16, 0x0001, %r20
	.word 0xaeac29a5  ! 1: ANDNcc_I	andncc 	%r16, 0x09a5, %r23
thr3_resum_intr_246:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_246), 16, 16)) -> intp(2, 3, 1)
	.word 0x86bc2f1d  ! 1: XNORcc_I	xnorcc 	%r16, 0x0f1d, %r3
	.word 0xb93c0011  ! 1: SRA_R	sra 	%r16, %r17, %r28
	.word 0x9e0c0011  ! 1: AND_R	and 	%r16, %r17, %r15
	.word 0xa92c1011  ! 1: SLLX_R	sllx	%r16, %r17, %r20
thr3_nuke_intr_247:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_247), 16, 16)) -> intp(1, 2, 1)
	.word 0x849c2725  ! 1: XORcc_I	xorcc 	%r16, 0x0725, %r2
	.word 0xa88c2357  ! 1: ANDcc_I	andcc 	%r16, 0x0357, %r20
	.word 0xad3c2001  ! 1: SRA_I	sra 	%r16, 0x0001, %r22
	.word 0xb6b40011  ! 1: ORNcc_R	orncc 	%r16, %r17, %r27
thr3_resum_intr_248:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_248), 16, 16)) -> intp(1, 3, 1)
	.word 0xb6ac27c9  ! 1: ANDNcc_I	andncc 	%r16, 0x07c9, %r27
	.word 0xb8840011  ! 1: ADDcc_R	addcc 	%r16, %r17, %r28
	.word 0x9a3c0011  ! 1: XNOR_R	xnor 	%r16, %r17, %r13
	.word 0x9cb42ada  ! 1: ORNcc_I	orncc 	%r16, 0x0ada, %r14
thr3_nuke_intr_249:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_249), 16, 16)) -> intp(2, 2, 1)
	.word 0x853c2001  ! 1: SRA_I	sra 	%r16, 0x0001, %r2
	.word 0x853c2001  ! 1: SRA_I	sra 	%r16, 0x0001, %r2
	.word 0xa89422eb  ! 1: ORcc_I	orcc 	%r16, 0x02eb, %r20
thr3_resum_intr_250:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_250), 16, 16)) -> intp(2, 3, 1)
	.word 0x9804267a  ! 1: ADD_I	add 	%r16, 0x067a, %r12
	.word 0xb6842683  ! 1: ADDcc_I	addcc 	%r16, 0x0683, %r27
	.word 0x8a040011  ! 1: ADD_R	add 	%r16, %r17, %r5
thr3_nuke_intr_251:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_251), 16, 16)) -> intp(2, 2, 1)
	.word 0x992c3001  ! 1: SLLX_I	sllx	%r16, 0x0001, %r12
	.word 0xb2142ad1  ! 1: OR_I	or 	%r16, 0x0ad1, %r25
	.word 0x957c2401  ! 1: MOVR_I	movre	%r16, 0x1, %r10
	.word 0x868c2ec8  ! 1: ANDcc_I	andcc 	%r16, 0x0ec8, %r3
thr3_resum_intr_252:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_252), 16, 16)) -> intp(2, 3, 1)
	.word 0x822c0011  ! 1: ANDN_R	andn 	%r16, %r17, %r1
	.word 0x82bc2f1a  ! 1: XNORcc_I	xnorcc 	%r16, 0x0f1a, %r1
	.word 0x84ac28fd  ! 1: ANDNcc_I	andncc 	%r16, 0x08fd, %r2
	.word 0xac342f33  ! 1: ORN_I	orn 	%r16, 0x0f33, %r22
thr3_hw_intr_253:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_253), 16, 16)) -> intp(2, 0, 1)
	.word 0xa8840011  ! 1: ADDcc_R	addcc 	%r16, %r17, %r20
thr3_hw_intr_254:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_254), 16, 16)) -> intp(2, 0, 1)
	.word 0xb43c0011  ! 1: XNOR_R	xnor 	%r16, %r17, %r26
	.word 0x8c042509  ! 1: ADD_I	add 	%r16, 0x0509, %r6
thr3_nuke_intr_255:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_255), 16, 16)) -> intp(2, 2, 1)
	.word 0x822c287a  ! 1: ANDN_I	andn 	%r16, 0x087a, %r1
thr3_resum_intr_256:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_256), 16, 16)) -> intp(2, 3, 1)
	.word 0x9e2c0011  ! 1: ANDN_R	andn 	%r16, %r17, %r15
thr3_nuke_intr_257:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_257), 16, 16)) -> intp(2, 2, 1)
	.word 0x93342001  ! 1: SRL_I	srl 	%r16, 0x0001, %r9
	.word 0xae1c22f6  ! 1: XOR_I	xor 	%r16, 0x02f6, %r23
	.word 0x9cbc2f39  ! 1: XNORcc_I	xnorcc 	%r16, 0x0f39, %r14
	.word 0x8c942fb4  ! 1: ORcc_I	orcc 	%r16, 0x0fb4, %r6
thr3_resum_intr_258:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_258), 16, 16)) -> intp(2, 3, 1)
	.word 0xa84427cd  ! 1: ADDC_I	addc 	%r16, 0x07cd, %r20
	.word 0xab3c2001  ! 1: SRA_I	sra 	%r16, 0x0001, %r21
	.word 0xaa1c2ce9  ! 1: XOR_I	xor 	%r16, 0x0ce9, %r21
	.word 0xb81c0011  ! 1: XOR_R	xor 	%r16, %r17, %r28
thr3_nuke_intr_259:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_259), 16, 16)) -> intp(0, 2, 1)
	.word 0x92140011  ! 1: OR_R	or 	%r16, %r17, %r9
	.word 0xb32c3001  ! 1: SLLX_I	sllx	%r16, 0x0001, %r25
	.word 0x9294288b  ! 1: ORcc_I	orcc 	%r16, 0x088b, %r9
	.word 0xba1c0011  ! 1: XOR_R	xor 	%r16, %r17, %r29
thr3_resum_intr_260:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_260), 16, 16)) -> intp(0, 3, 1)
	.word 0xaf2c0011  ! 1: SLL_R	sll 	%r16, %r17, %r23
	.word 0xae842fd6  ! 1: ADDcc_I	addcc 	%r16, 0x0fd6, %r23
	.word 0xa8ac2a56  ! 1: ANDNcc_I	andncc 	%r16, 0x0a56, %r20
	.word 0x9abc2066  ! 1: XNORcc_I	xnorcc 	%r16, 0x0066, %r13
thr3_nuke_intr_261:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_261), 16, 16)) -> intp(2, 2, 1)
	.word 0x8a0c2a30  ! 1: AND_I	and 	%r16, 0x0a30, %r5
	.word 0xbb3c2001  ! 1: SRA_I	sra 	%r16, 0x0001, %r29
	.word 0xac042f07  ! 1: ADD_I	add 	%r16, 0x0f07, %r22
	.word 0xb60421ff  ! 1: ADD_I	add 	%r16, 0x01ff, %r27
thr3_resum_intr_262:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_262), 16, 16)) -> intp(2, 3, 1)
	.word 0x88ac2cc2  ! 1: ANDNcc_I	andncc 	%r16, 0x0cc2, %r4
	.word 0x82b42da4  ! 1: ORNcc_I	orncc 	%r16, 0x0da4, %r1
	.word 0x943c2eaf  ! 1: XNOR_I	xnor 	%r16, 0x0eaf, %r10
	.word 0xb00c0011  ! 1: AND_R	and 	%r16, %r17, %r24
thr3_hw_intr_263:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_263), 16, 16)) -> intp(2, 0, 1)
	.word 0x82bc2b62  ! 1: XNORcc_I	xnorcc 	%r16, 0x0b62, %r1
	.word 0xae442f55  ! 1: ADDC_I	addc 	%r16, 0x0f55, %r23
	.word 0xaa1c0011  ! 1: XOR_R	xor 	%r16, %r17, %r21
	.word 0x889c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r4
thr3_hw_intr_264:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_264), 16, 16)) -> intp(1, 0, 1)
	.word 0xb2b40011  ! 1: ORNcc_R	orncc 	%r16, %r17, %r25
	.word 0xae1c2f4b  ! 1: XOR_I	xor 	%r16, 0x0f4b, %r23
	.word 0xb6bc2bc6  ! 1: XNORcc_I	xnorcc 	%r16, 0x0bc6, %r27
	.word 0xb4342179  ! 1: ORN_I	orn 	%r16, 0x0179, %r26
thr3_hw_intr_265:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_265), 16, 16)) -> intp(1, 0, 1)
	.word 0x9a140011  ! 1: OR_R	or 	%r16, %r17, %r13
	.word 0xaa0c0011  ! 1: AND_R	and 	%r16, %r17, %r21
	.word 0x862c229e  ! 1: ANDN_I	andn 	%r16, 0x029e, %r3
thr3_hw_intr_266:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_266), 16, 16)) -> intp(0, 0, 1)
	.word 0xa6342020  ! 1: ORN_I	orn 	%r16, 0x0020, %r19
	.word 0x992c3001  ! 1: SLLX_I	sllx	%r16, 0x0001, %r12
	.word 0x94ac0011  ! 1: ANDNcc_R	andncc 	%r16, %r17, %r10
thr3_nuke_intr_267:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_267), 16, 16)) -> intp(1, 2, 1)
	.word 0xb52c3001  ! 1: SLLX_I	sllx	%r16, 0x0001, %r26
	.word 0x8a9c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r5
thr3_resum_intr_268:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_268), 16, 16)) -> intp(1, 3, 1)
	.word 0x948c0011  ! 1: ANDcc_R	andcc 	%r16, %r17, %r10
	.word 0xae940011  ! 1: ORcc_R	orcc 	%r16, %r17, %r23
thr3_hw_intr_269:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_269), 16, 16)) -> intp(1, 0, 1)
	.word 0x828424aa  ! 1: ADDcc_I	addcc 	%r16, 0x04aa, %r1
	.word 0xaab42334  ! 1: ORNcc_I	orncc 	%r16, 0x0334, %r21
thr3_nuke_intr_270:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_270), 16, 16)) -> intp(2, 2, 1)
	.word 0x94b42fe2  ! 1: ORNcc_I	orncc 	%r16, 0x0fe2, %r10
	.word 0x92342823  ! 1: ORN_I	orn 	%r16, 0x0823, %r9
	.word 0xb4c42de5  ! 1: ADDCcc_I	addccc 	%r16, 0x0de5, %r26
thr3_resum_intr_271:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_271), 16, 16)) -> intp(2, 3, 1)
	.word 0x9e942678  ! 1: ORcc_I	orcc 	%r16, 0x0678, %r15
	.word 0x82840011  ! 1: ADDcc_R	addcc 	%r16, %r17, %r1
	.word 0xb8042bb7  ! 1: ADD_I	add 	%r16, 0x0bb7, %r28
thr3_nuke_intr_272:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_272), 16, 16)) -> intp(2, 2, 1)
	.word 0xb8840011  ! 1: ADDcc_R	addcc 	%r16, %r17, %r28
	.word 0xb2440011  ! 1: ADDC_R	addc 	%r16, %r17, %r25
thr3_resum_intr_273:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_273), 16, 16)) -> intp(2, 3, 1)
	.word 0x92c40011  ! 1: ADDCcc_R	addccc 	%r16, %r17, %r9
	.word 0x90bc0011  ! 1: XNORcc_R	xnorcc 	%r16, %r17, %r8
thr3_nuke_intr_274:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_274), 16, 16)) -> intp(2, 2, 1)
	.word 0x8a140011  ! 1: OR_R	or 	%r16, %r17, %r5
	.word 0xb684255d  ! 1: ADDcc_I	addcc 	%r16, 0x055d, %r27
	.word 0x97340011  ! 1: SRL_R	srl 	%r16, %r17, %r11
thr3_resum_intr_275:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_275), 16, 16)) -> intp(2, 3, 1)
	.word 0x9c0c2695  ! 1: AND_I	and 	%r16, 0x0695, %r14
	.word 0x84940011  ! 1: ORcc_R	orcc 	%r16, %r17, %r2
	.word 0xba8c27da  ! 1: ANDcc_I	andcc 	%r16, 0x07da, %r29
thr3_nuke_intr_276:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_276), 16, 16)) -> intp(0, 2, 1)
	.word 0x98942467  ! 1: ORcc_I	orcc 	%r16, 0x0467, %r12
	.word 0x9cb422e1  ! 1: ORNcc_I	orncc 	%r16, 0x02e1, %r14
thr3_resum_intr_277:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_277), 16, 16)) -> intp(0, 3, 1)
	.word 0x8a442697  ! 1: ADDC_I	addc 	%r16, 0x0697, %r5
	.word 0x89641811  ! 1: MOVcc_R	<illegal instruction>
thr3_hw_intr_278:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_278), 16, 16)) -> intp(1, 0, 1)
	.word 0xa814271a  ! 1: OR_I	or 	%r16, 0x071a, %r20
	.word 0x9c3c0011  ! 1: XNOR_R	xnor 	%r16, %r17, %r14
	.word 0x8cac2246  ! 1: ANDNcc_I	andncc 	%r16, 0x0246, %r6
	.word 0xa81c0011  ! 1: XOR_R	xor 	%r16, %r17, %r20
thr3_hw_intr_279:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_279), 16, 16)) -> intp(0, 0, 1)
	.word 0x99340011  ! 1: SRL_R	srl 	%r16, %r17, %r12
	.word 0xa80c207b  ! 1: AND_I	and 	%r16, 0x007b, %r20
	.word 0x8c142a07  ! 1: OR_I	or 	%r16, 0x0a07, %r6
thr3_nuke_intr_280:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_280), 16, 16)) -> intp(0, 2, 1)
	.word 0xb08c0011  ! 1: ANDcc_R	andcc 	%r16, %r17, %r24
	.word 0xa6c40011  ! 1: ADDCcc_R	addccc 	%r16, %r17, %r19
thr3_resum_intr_281:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_281), 16, 16)) -> intp(0, 3, 1)
	.word 0x8c142a36  ! 1: OR_I	or 	%r16, 0x0a36, %r6
	.word 0xba44222f  ! 1: ADDC_I	addc 	%r16, 0x022f, %r29
thr3_nuke_intr_282:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_282), 16, 16)) -> intp(2, 2, 1)
	.word 0x84ac0011  ! 1: ANDNcc_R	andncc 	%r16, %r17, %r2
	.word 0x93643801  ! 1: MOVcc_I	<illegal instruction>
	.word 0xa93c1011  ! 1: SRAX_R	srax	%r16, %r17, %r20
	.word 0xb17c2401  ! 1: MOVR_I	movre	%r16, 0x1, %r24
thr3_resum_intr_283:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_283), 16, 16)) -> intp(2, 3, 1)
	.word 0x84c42c05  ! 1: ADDCcc_I	addccc 	%r16, 0x0c05, %r2
	.word 0xaa040011  ! 1: ADD_R	add 	%r16, %r17, %r21
	.word 0xb52c2001  ! 1: SLL_I	sll 	%r16, 0x0001, %r26
	.word 0x87641811  ! 1: MOVcc_R	<illegal instruction>
thr3_nuke_intr_284:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_284), 16, 16)) -> intp(0, 2, 1)
	.word 0x94bc0011  ! 1: XNORcc_R	xnorcc 	%r16, %r17, %r10
	.word 0x8e2c247b  ! 1: ANDN_I	andn 	%r16, 0x047b, %r7
	.word 0x968c0011  ! 1: ANDcc_R	andcc 	%r16, %r17, %r11
thr3_resum_intr_285:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_285), 16, 16)) -> intp(0, 3, 1)
	.word 0xb2c42dc5  ! 1: ADDCcc_I	addccc 	%r16, 0x0dc5, %r25
	.word 0xa8bc0011  ! 1: XNORcc_R	xnorcc 	%r16, %r17, %r20
	.word 0x84c42df0  ! 1: ADDCcc_I	addccc 	%r16, 0x0df0, %r2
thr3_hw_intr_286:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_286), 16, 16)) -> intp(2, 0, 1)
	.word 0x8d643801  ! 1: MOVcc_I	<illegal instruction>
thr3_hw_intr_287:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_287), 16, 16)) -> intp(2, 0, 1)
	.word 0xb92c3001  ! 1: SLLX_I	sllx	%r16, 0x0001, %r28
	.word 0x8f341011  ! 1: SRLX_R	srlx	%r16, %r17, %r7
	.word 0x897c2401  ! 1: MOVR_I	movre	%r16, 0x1, %r4
	.word 0x94c42606  ! 1: ADDCcc_I	addccc 	%r16, 0x0606, %r10
thr3_nuke_intr_288:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_288), 16, 16)) -> intp(2, 2, 1)
	.word 0x8cac0011  ! 1: ANDNcc_R	andncc 	%r16, %r17, %r6
	.word 0x96440011  ! 1: ADDC_R	addc 	%r16, %r17, %r11
thr3_resum_intr_289:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_289), 16, 16)) -> intp(2, 3, 1)
	.word 0x8a840011  ! 1: ADDcc_R	addcc 	%r16, %r17, %r5
	.word 0x928c263a  ! 1: ANDcc_I	andcc 	%r16, 0x063a, %r9
thr3_hw_intr_290:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_290), 16, 16)) -> intp(2, 0, 1)
	.word 0xa8840011  ! 1: ADDcc_R	addcc 	%r16, %r17, %r20
	.word 0x9c34211a  ! 1: ORN_I	orn 	%r16, 0x011a, %r14
thr3_hw_intr_291:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_291), 16, 16)) -> intp(1, 0, 1)
	.word 0x98c42642  ! 1: ADDCcc_I	addccc 	%r16, 0x0642, %r12
	.word 0x9a840011  ! 1: ADDcc_R	addcc 	%r16, %r17, %r13
	.word 0x933c0011  ! 1: SRA_R	sra 	%r16, %r17, %r9
	.word 0xae040011  ! 1: ADD_R	add 	%r16, %r17, %r23
thr3_hw_intr_292:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_292), 16, 16)) -> intp(1, 0, 1)
	.word 0x96842f67  ! 1: ADDcc_I	addcc 	%r16, 0x0f67, %r11
	.word 0x9e040011  ! 1: ADD_R	add 	%r16, %r17, %r15
	.word 0x94140011  ! 1: OR_R	or 	%r16, %r17, %r10
thr3_nuke_intr_293:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_293), 16, 16)) -> intp(1, 2, 1)
	.word 0x989c232c  ! 1: XORcc_I	xorcc 	%r16, 0x032c, %r12
	.word 0x94b42d33  ! 1: ORNcc_I	orncc 	%r16, 0x0d33, %r10
	.word 0x922c0011  ! 1: ANDN_R	andn 	%r16, %r17, %r9
	.word 0x8a8c2cbe  ! 1: ANDcc_I	andcc 	%r16, 0x0cbe, %r5
thr3_resum_intr_294:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_294), 16, 16)) -> intp(1, 3, 1)
	.word 0x84442f0a  ! 1: ADDC_I	addc 	%r16, 0x0f0a, %r2
	.word 0xb4040011  ! 1: ADD_R	add 	%r16, %r17, %r26
	.word 0xb32c2001  ! 1: SLL_I	sll 	%r16, 0x0001, %r25
	.word 0x9d341011  ! 1: SRLX_R	srlx	%r16, %r17, %r14
thr3_hw_intr_295:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_295), 16, 16)) -> intp(2, 0, 1)
	.word 0x873c0011  ! 1: SRA_R	sra 	%r16, %r17, %r3
thr3_hw_intr_296:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_296), 16, 16)) -> intp(1, 0, 1)
	.word 0xab342001  ! 1: SRL_I	srl 	%r16, 0x0001, %r21
thr3_hw_intr_297:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_297), 16, 16)) -> intp(1, 0, 1)
	.word 0xae3c0011  ! 1: XNOR_R	xnor 	%r16, %r17, %r23
	.word 0xb2142dd4  ! 1: OR_I	or 	%r16, 0x0dd4, %r25
thr3_hw_intr_298:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_298), 16, 16)) -> intp(2, 0, 1)
	.word 0x843c0011  ! 1: XNOR_R	xnor 	%r16, %r17, %r2
	.word 0x9a042440  ! 1: ADD_I	add 	%r16, 0x0440, %r13
thr3_nuke_intr_299:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_299), 16, 16)) -> intp(2, 2, 1)
	.word 0xac8421b6  ! 1: ADDcc_I	addcc 	%r16, 0x01b6, %r22
	.word 0xac0c2c8f  ! 1: AND_I	and 	%r16, 0x0c8f, %r22
	.word 0x929c2d93  ! 1: XORcc_I	xorcc 	%r16, 0x0d93, %r9
	.word 0x8e3c0011  ! 1: XNOR_R	xnor 	%r16, %r17, %r7
thr3_resum_intr_300:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_300), 16, 16)) -> intp(2, 3, 1)
	.word 0xb21c0011  ! 1: XOR_R	xor 	%r16, %r17, %r25
	.word 0xa7641811  ! 1: MOVcc_R	<illegal instruction>
	.word 0xb32c0011  ! 1: SLL_R	sll 	%r16, %r17, %r25
	.word 0xb80c0011  ! 1: AND_R	and 	%r16, %r17, %r28
thr3_nuke_intr_301:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_301), 16, 16)) -> intp(1, 2, 1)
	.word 0x832c1011  ! 1: SLLX_R	sllx	%r16, %r17, %r1
	.word 0xb52c1011  ! 1: SLLX_R	sllx	%r16, %r17, %r26
	.word 0xb214206f  ! 1: OR_I	or 	%r16, 0x006f, %r25
thr3_resum_intr_302:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_302), 16, 16)) -> intp(1, 3, 1)
	.word 0xb84420c4  ! 1: ADDC_I	addc 	%r16, 0x00c4, %r28
	.word 0xa88429e6  ! 1: ADDcc_I	addcc 	%r16, 0x09e6, %r20
	.word 0xaac40011  ! 1: ADDCcc_R	addccc 	%r16, %r17, %r21
thr3_nuke_intr_303:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_303), 16, 16)) -> intp(1, 2, 1)
	.word 0x8d3c1011  ! 1: SRAX_R	srax	%r16, %r17, %r6
thr3_resum_intr_304:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_304), 16, 16)) -> intp(1, 3, 1)
	.word 0xb6ac0011  ! 1: ANDNcc_R	andncc 	%r16, %r17, %r27
thr3_hw_intr_305:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_305), 16, 16)) -> intp(2, 0, 1)
	.word 0xb8140011  ! 1: OR_R	or 	%r16, %r17, %r28
	.word 0xb89c2933  ! 1: XORcc_I	xorcc 	%r16, 0x0933, %r28
	.word 0x92ac0011  ! 1: ANDNcc_R	andncc 	%r16, %r17, %r9
thr3_nuke_intr_306:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_306), 16, 16)) -> intp(2, 2, 1)
	.word 0x980c0011  ! 1: AND_R	and 	%r16, %r17, %r12
	.word 0x932c1011  ! 1: SLLX_R	sllx	%r16, %r17, %r9
	.word 0x88140011  ! 1: OR_R	or 	%r16, %r17, %r4
thr3_resum_intr_307:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_307), 16, 16)) -> intp(2, 3, 1)
	.word 0x842c0011  ! 1: ANDN_R	andn 	%r16, %r17, %r2
	.word 0x91641811  ! 1: MOVcc_R	<illegal instruction>
	.word 0xb77c0411  ! 1: MOVR_R	movre	%r16, %r17, %r27
thr3_nuke_intr_308:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_308), 16, 16)) -> intp(1, 2, 1)
	.word 0xb12c2001  ! 1: SLL_I	sll 	%r16, 0x0001, %r24
thr3_resum_intr_309:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_309), 16, 16)) -> intp(1, 3, 1)
	.word 0x833c1011  ! 1: SRAX_R	srax	%r16, %r17, %r1
thr3_hw_intr_310:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_310), 16, 16)) -> intp(1, 0, 1)
	.word 0x98bc253e  ! 1: XNORcc_I	xnorcc 	%r16, 0x053e, %r12
	.word 0x973c2001  ! 1: SRA_I	sra 	%r16, 0x0001, %r11
	.word 0x9c2c20b7  ! 1: ANDN_I	andn 	%r16, 0x00b7, %r14
thr3_hw_intr_311:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_311), 16, 16)) -> intp(1, 0, 1)
	.word 0x96b42d79  ! 1: ORNcc_I	orncc 	%r16, 0x0d79, %r11
	.word 0x8d7c2401  ! 1: MOVR_I	movre	%r16, 0x1, %r6
	.word 0x937c0411  ! 1: MOVR_R	movre	%r16, %r17, %r9
thr3_hw_intr_312:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_312), 16, 16)) -> intp(2, 0, 1)
	.word 0x94442998  ! 1: ADDC_I	addc 	%r16, 0x0998, %r10
	.word 0x9c2c2ea0  ! 1: ANDN_I	andn 	%r16, 0x0ea0, %r14
thr3_nuke_intr_313:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_313), 16, 16)) -> intp(0, 2, 1)
	.word 0xa68c22ca  ! 1: ANDcc_I	andcc 	%r16, 0x02ca, %r19
	.word 0xa92c0011  ! 1: SLL_R	sll 	%r16, %r17, %r20
	.word 0x9a042b91  ! 1: ADD_I	add 	%r16, 0x0b91, %r13
thr3_resum_intr_314:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_314), 16, 16)) -> intp(0, 3, 1)
	.word 0xaa1c21f0  ! 1: XOR_I	xor 	%r16, 0x01f0, %r21
	.word 0xbb3c2001  ! 1: SRA_I	sra 	%r16, 0x0001, %r29
	.word 0x82842a32  ! 1: ADDcc_I	addcc 	%r16, 0x0a32, %r1
thr3_hw_intr_315:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_315), 16, 16)) -> intp(2, 0, 1)
	.word 0xb41c0011  ! 1: XOR_R	xor 	%r16, %r17, %r26
	.word 0x9a3c2013  ! 1: XNOR_I	xnor 	%r16, 0x0013, %r13
	.word 0xa6842591  ! 1: ADDcc_I	addcc 	%r16, 0x0591, %r19
thr3_nuke_intr_316:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_316), 16, 16)) -> intp(2, 2, 1)
	.word 0x881c0011  ! 1: XOR_R	xor 	%r16, %r17, %r4
	.word 0xb93c0011  ! 1: SRA_R	sra 	%r16, %r17, %r28
	.word 0xb28c215d  ! 1: ANDcc_I	andcc 	%r16, 0x015d, %r25
thr3_resum_intr_317:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_317), 16, 16)) -> intp(2, 3, 1)
	.word 0x92440011  ! 1: ADDC_R	addc 	%r16, %r17, %r9
	.word 0x9c442c45  ! 1: ADDC_I	addc 	%r16, 0x0c45, %r14
	.word 0x8ab42588  ! 1: ORNcc_I	orncc 	%r16, 0x0588, %r5
thr3_hw_intr_318:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_318), 16, 16)) -> intp(1, 0, 1)
	.word 0x923c26db  ! 1: XNOR_I	xnor 	%r16, 0x06db, %r9
	.word 0xac9c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r22
	.word 0xa81c0011  ! 1: XOR_R	xor 	%r16, %r17, %r20
thr3_hw_intr_319:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_319), 16, 16)) -> intp(1, 0, 1)
	.word 0x8c440011  ! 1: ADDC_R	addc 	%r16, %r17, %r6
	.word 0x972c2001  ! 1: SLL_I	sll 	%r16, 0x0001, %r11
	.word 0x8d3c2001  ! 1: SRA_I	sra 	%r16, 0x0001, %r6
thr3_nuke_intr_320:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_320), 16, 16)) -> intp(1, 2, 1)
	.word 0x9e8c0011  ! 1: ANDcc_R	andcc 	%r16, %r17, %r15
	.word 0x8c8c207a  ! 1: ANDcc_I	andcc 	%r16, 0x007a, %r6
thr3_resum_intr_321:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_321), 16, 16)) -> intp(1, 3, 1)
	.word 0xb8ac0011  ! 1: ANDNcc_R	andncc 	%r16, %r17, %r28
	.word 0x94b42594  ! 1: ORNcc_I	orncc 	%r16, 0x0594, %r10
thr3_hw_intr_322:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_322), 16, 16)) -> intp(1, 0, 1)
	.word 0xb6c40011  ! 1: ADDCcc_R	addccc 	%r16, %r17, %r27
	.word 0x8abc0011  ! 1: XNORcc_R	xnorcc 	%r16, %r17, %r5
	.word 0x95641811  ! 1: MOVcc_R	<illegal instruction>
thr3_nuke_intr_323:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_323), 16, 16)) -> intp(2, 2, 1)
	.word 0x91643801  ! 1: MOVcc_I	<illegal instruction>
	.word 0x9b7c0411  ! 1: MOVR_R	movre	%r16, %r17, %r13
	.word 0xba842340  ! 1: ADDcc_I	addcc 	%r16, 0x0340, %r29
	.word 0x8eac0011  ! 1: ANDNcc_R	andncc 	%r16, %r17, %r7
thr3_resum_intr_324:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_324), 16, 16)) -> intp(2, 3, 1)
	.word 0x9aac0011  ! 1: ANDNcc_R	andncc 	%r16, %r17, %r13
	.word 0x96ac2c36  ! 1: ANDNcc_I	andncc 	%r16, 0x0c36, %r11
	.word 0xaa342fe8  ! 1: ORN_I	orn 	%r16, 0x0fe8, %r21
	.word 0x86c42255  ! 1: ADDCcc_I	addccc 	%r16, 0x0255, %r3
thr3_nuke_intr_325:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_325), 16, 16)) -> intp(0, 2, 1)
	.word 0x8a2c0011  ! 1: ANDN_R	andn 	%r16, %r17, %r5
	.word 0x9e440011  ! 1: ADDC_R	addc 	%r16, %r17, %r15
	.word 0xb0840011  ! 1: ADDcc_R	addcc 	%r16, %r17, %r24
thr3_resum_intr_326:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_326), 16, 16)) -> intp(0, 3, 1)
	.word 0xb80c286b  ! 1: AND_I	and 	%r16, 0x086b, %r28
	.word 0x9ec42612  ! 1: ADDCcc_I	addccc 	%r16, 0x0612, %r15
	.word 0x86140011  ! 1: OR_R	or 	%r16, %r17, %r3
thr3_hw_intr_327:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_327), 16, 16)) -> intp(1, 0, 1)
	.word 0x89340011  ! 1: SRL_R	srl 	%r16, %r17, %r4
	.word 0xb33c1011  ! 1: SRAX_R	srax	%r16, %r17, %r25
	.word 0xaf2c3001  ! 1: SLLX_I	sllx	%r16, 0x0001, %r23
thr3_hw_intr_328:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_328), 16, 16)) -> intp(2, 0, 1)
	.word 0x893c0011  ! 1: SRA_R	sra 	%r16, %r17, %r4
	.word 0x9cbc0011  ! 1: XNORcc_R	xnorcc 	%r16, %r17, %r14
	.word 0xa97c2401  ! 1: MOVR_I	movre	%r16, 0x1, %r20
	.word 0x9cb40011  ! 1: ORNcc_R	orncc 	%r16, %r17, %r14
thr3_nuke_intr_329:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_329), 16, 16)) -> intp(0, 2, 1)
	.word 0x86142ad1  ! 1: OR_I	or 	%r16, 0x0ad1, %r3
	.word 0xa97c2401  ! 1: MOVR_I	movre	%r16, 0x1, %r20
	.word 0x8e9c2336  ! 1: XORcc_I	xorcc 	%r16, 0x0336, %r7
	.word 0xb0142b65  ! 1: OR_I	or 	%r16, 0x0b65, %r24
thr3_resum_intr_330:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_330), 16, 16)) -> intp(0, 3, 1)
	.word 0x8a340011  ! 1: ORN_R	orn 	%r16, %r17, %r5
	.word 0xa7343001  ! 1: SRLX_I	srlx	%r16, 0x0001, %r19
	.word 0xb244221e  ! 1: ADDC_I	addc 	%r16, 0x021e, %r25
	.word 0xb28c293f  ! 1: ANDcc_I	andcc 	%r16, 0x093f, %r25
thr3_nuke_intr_331:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_331), 16, 16)) -> intp(1, 2, 1)
	.word 0x86c423fe  ! 1: ADDCcc_I	addccc 	%r16, 0x03fe, %r3
	.word 0x98c42a51  ! 1: ADDCcc_I	addccc 	%r16, 0x0a51, %r12
thr3_resum_intr_332:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_332), 16, 16)) -> intp(1, 3, 1)
	.word 0xbb2c1011  ! 1: SLLX_R	sllx	%r16, %r17, %r29
	.word 0x88b427fd  ! 1: ORNcc_I	orncc 	%r16, 0x07fd, %r4
thr3_nuke_intr_333:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_333), 16, 16)) -> intp(1, 2, 1)
	.word 0x9404294f  ! 1: ADD_I	add 	%r16, 0x094f, %r10
	.word 0x992c3001  ! 1: SLLX_I	sllx	%r16, 0x0001, %r12
	.word 0xae9c21e5  ! 1: XORcc_I	xorcc 	%r16, 0x01e5, %r23
thr3_resum_intr_334:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_334), 16, 16)) -> intp(1, 3, 1)
	.word 0x861c0011  ! 1: XOR_R	xor 	%r16, %r17, %r3
	.word 0x9e1c22b0  ! 1: XOR_I	xor 	%r16, 0x02b0, %r15
	.word 0xb80c0011  ! 1: AND_R	and 	%r16, %r17, %r28
thr3_hw_intr_335:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_335), 16, 16)) -> intp(1, 0, 1)
	.word 0x821c24dd  ! 1: XOR_I	xor 	%r16, 0x04dd, %r1
	.word 0x880c2049  ! 1: AND_I	and 	%r16, 0x0049, %r4
thr3_nuke_intr_336:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_336), 16, 16)) -> intp(0, 2, 1)
	.word 0x8c040011  ! 1: ADD_R	add 	%r16, %r17, %r6
	.word 0xb7643801  ! 1: MOVcc_I	<illegal instruction>
	.word 0xa97c2401  ! 1: MOVR_I	movre	%r16, 0x1, %r20
thr3_resum_intr_337:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_337), 16, 16)) -> intp(0, 3, 1)
	.word 0x9a040011  ! 1: ADD_R	add 	%r16, %r17, %r13
	.word 0x8b7c0411  ! 1: MOVR_R	movre	%r16, %r17, %r5
	.word 0x9c9c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r14
thr3_nuke_intr_338:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_338), 16, 16)) -> intp(1, 2, 1)
	.word 0x982c2665  ! 1: ANDN_I	andn 	%r16, 0x0665, %r12
	.word 0x82042d75  ! 1: ADD_I	add 	%r16, 0x0d75, %r1
	.word 0x9b340011  ! 1: SRL_R	srl 	%r16, %r17, %r13
	.word 0xab2c3001  ! 1: SLLX_I	sllx	%r16, 0x0001, %r21
thr3_resum_intr_339:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_339), 16, 16)) -> intp(1, 3, 1)
	.word 0x8cbc0011  ! 1: XNORcc_R	xnorcc 	%r16, %r17, %r6
	.word 0x9c2c2bc0  ! 1: ANDN_I	andn 	%r16, 0x0bc0, %r14
	.word 0x9ebc0011  ! 1: XNORcc_R	xnorcc 	%r16, %r17, %r15
	.word 0x8e8c0011  ! 1: ANDcc_R	andcc 	%r16, %r17, %r7
thr3_hw_intr_340:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_340), 16, 16)) -> intp(0, 0, 1)
	.word 0x820423e0  ! 1: ADD_I	add 	%r16, 0x03e0, %r1
	.word 0xaec42bc6  ! 1: ADDCcc_I	addccc 	%r16, 0x0bc6, %r23
thr3_nuke_intr_341:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_341), 16, 16)) -> intp(0, 2, 1)
	.word 0x869c2672  ! 1: XORcc_I	xorcc 	%r16, 0x0672, %r3
	.word 0x97342001  ! 1: SRL_I	srl 	%r16, 0x0001, %r11
	.word 0x9f641811  ! 1: MOVcc_R	<illegal instruction>
thr3_resum_intr_342:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_342), 16, 16)) -> intp(0, 3, 1)
	.word 0x8f3c2001  ! 1: SRA_I	sra 	%r16, 0x0001, %r7
	.word 0x962c2bbd  ! 1: ANDN_I	andn 	%r16, 0x0bbd, %r11
	.word 0x8e942304  ! 1: ORcc_I	orcc 	%r16, 0x0304, %r7
thr3_nuke_intr_343:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_343), 16, 16)) -> intp(1, 2, 1)
	.word 0x9a442dc0  ! 1: ADDC_I	addc 	%r16, 0x0dc0, %r13
	.word 0x9b3c2001  ! 1: SRA_I	sra 	%r16, 0x0001, %r13
	.word 0x8d340011  ! 1: SRL_R	srl 	%r16, %r17, %r6
thr3_resum_intr_344:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_344), 16, 16)) -> intp(1, 3, 1)
	.word 0x87343001  ! 1: SRLX_I	srlx	%r16, 0x0001, %r3
	.word 0xac1425ff  ! 1: OR_I	or 	%r16, 0x05ff, %r22
	.word 0x84ac0011  ! 1: ANDNcc_R	andncc 	%r16, %r17, %r2
thr3_hw_intr_345:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_345), 16, 16)) -> intp(2, 0, 1)
	.word 0x83340011  ! 1: SRL_R	srl 	%r16, %r17, %r1
	.word 0xb0040011  ! 1: ADD_R	add 	%r16, %r17, %r24
	.word 0xbb7c0411  ! 1: MOVR_R	movre	%r16, %r17, %r29
	.word 0xb32c3001  ! 1: SLLX_I	sllx	%r16, 0x0001, %r25
thr3_hw_intr_346:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_346), 16, 16)) -> intp(1, 0, 1)
	.word 0x92342b76  ! 1: ORN_I	orn 	%r16, 0x0b76, %r9
	.word 0x860c0011  ! 1: AND_R	and 	%r16, %r17, %r3
	.word 0x937c0411  ! 1: MOVR_R	movre	%r16, %r17, %r9
thr3_nuke_intr_347:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_347), 16, 16)) -> intp(0, 2, 1)
	.word 0xb93c1011  ! 1: SRAX_R	srax	%r16, %r17, %r28
	.word 0xb4c4204f  ! 1: ADDCcc_I	addccc 	%r16, 0x004f, %r26
thr3_resum_intr_348:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_348), 16, 16)) -> intp(0, 3, 1)
	.word 0xaf2c2001  ! 1: SLL_I	sll 	%r16, 0x0001, %r23
	.word 0x9e0c0011  ! 1: AND_R	and 	%r16, %r17, %r15
thr3_nuke_intr_349:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_349), 16, 16)) -> intp(1, 2, 1)
	.word 0xb4b40011  ! 1: ORNcc_R	orncc 	%r16, %r17, %r26
thr3_resum_intr_350:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_350), 16, 16)) -> intp(1, 3, 1)
	.word 0x98bc0011  ! 1: XNORcc_R	xnorcc 	%r16, %r17, %r12
thr3_hw_intr_351:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_351), 16, 16)) -> intp(0, 0, 1)
	.word 0xaf341011  ! 1: SRLX_R	srlx	%r16, %r17, %r23
thr3_nuke_intr_352:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_352), 16, 16)) -> intp(0, 2, 1)
	.word 0x9a9c22ee  ! 1: XORcc_I	xorcc 	%r16, 0x02ee, %r13
	.word 0x9f3c0011  ! 1: SRA_R	sra 	%r16, %r17, %r15
thr3_resum_intr_353:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_353), 16, 16)) -> intp(0, 3, 1)
	.word 0x92ac242a  ! 1: ANDNcc_I	andncc 	%r16, 0x042a, %r9
	.word 0xa77c0411  ! 1: MOVR_R	movre	%r16, %r17, %r19
thr3_hw_intr_354:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_354), 16, 16)) -> intp(2, 0, 1)
	.word 0x8cc423e0  ! 1: ADDCcc_I	addccc 	%r16, 0x03e0, %r6
thr3_nuke_intr_355:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_355), 16, 16)) -> intp(1, 2, 1)
	.word 0xae4421db  ! 1: ADDC_I	addc 	%r16, 0x01db, %r23
thr3_resum_intr_356:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_356), 16, 16)) -> intp(1, 3, 1)
	.word 0x88042bdb  ! 1: ADD_I	add 	%r16, 0x0bdb, %r4
thr3_nuke_intr_357:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_357), 16, 16)) -> intp(2, 2, 1)
	.word 0x85643801  ! 1: MOVcc_I	<illegal instruction>
	.word 0xa80c0011  ! 1: AND_R	and 	%r16, %r17, %r20
thr3_resum_intr_358:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_358), 16, 16)) -> intp(2, 3, 1)
	.word 0xaeac22f0  ! 1: ANDNcc_I	andncc 	%r16, 0x02f0, %r23
	.word 0x8d643801  ! 1: MOVcc_I	<illegal instruction>
thr3_hw_intr_359:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_359), 16, 16)) -> intp(1, 0, 1)
	.word 0x9c142d44  ! 1: OR_I	or 	%r16, 0x0d44, %r14
	.word 0x94bc2c51  ! 1: XNORcc_I	xnorcc 	%r16, 0x0c51, %r10
thr3_hw_intr_360:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_360), 16, 16)) -> intp(2, 0, 1)
	.word 0x9b3c2001  ! 1: SRA_I	sra 	%r16, 0x0001, %r13
	.word 0x95643801  ! 1: MOVcc_I	<illegal instruction>
thr3_nuke_intr_361:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_361), 16, 16)) -> intp(2, 2, 1)
	.word 0x9b2c0011  ! 1: SLL_R	sll 	%r16, %r17, %r13
	.word 0x9f343001  ! 1: SRLX_I	srlx	%r16, 0x0001, %r15
thr3_resum_intr_362:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_362), 16, 16)) -> intp(2, 3, 1)
	.word 0x8aac0011  ! 1: ANDNcc_R	andncc 	%r16, %r17, %r5
	.word 0x848c0011  ! 1: ANDcc_R	andcc 	%r16, %r17, %r2
thr3_hw_intr_363:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_363), 16, 16)) -> intp(0, 0, 1)
	.word 0x853c2001  ! 1: SRA_I	sra 	%r16, 0x0001, %r2
	.word 0xb6bc0011  ! 1: XNORcc_R	xnorcc 	%r16, %r17, %r27
	.word 0x99641811  ! 1: MOVcc_R	<illegal instruction>
thr3_nuke_intr_364:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_364), 16, 16)) -> intp(0, 2, 1)
	.word 0x8d2c0011  ! 1: SLL_R	sll 	%r16, %r17, %r6
	.word 0x86c40011  ! 1: ADDCcc_R	addccc 	%r16, %r17, %r3
thr3_resum_intr_365:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_365), 16, 16)) -> intp(0, 3, 1)
	.word 0x917c2401  ! 1: MOVR_I	movre	%r16, 0x1, %r8
	.word 0x8f2c1011  ! 1: SLLX_R	sllx	%r16, %r17, %r7
thr3_hw_intr_366:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_366), 16, 16)) -> intp(1, 0, 1)
	.word 0x8e9c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r7
	.word 0x8a4429ae  ! 1: ADDC_I	addc 	%r16, 0x09ae, %r5
	.word 0xb02c0011  ! 1: ANDN_R	andn 	%r16, %r17, %r24
thr3_hw_intr_367:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_367), 16, 16)) -> intp(2, 0, 1)
	.word 0x84c40011  ! 1: ADDCcc_R	addccc 	%r16, %r17, %r2
thr3_hw_intr_368:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_368), 16, 16)) -> intp(2, 0, 1)
	.word 0x980c0011  ! 1: AND_R	and 	%r16, %r17, %r12
	.word 0x992c2001  ! 1: SLL_I	sll 	%r16, 0x0001, %r12
thr3_nuke_intr_369:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_369), 16, 16)) -> intp(2, 2, 1)
	.word 0x84bc0011  ! 1: XNORcc_R	xnorcc 	%r16, %r17, %r2
thr3_resum_intr_370:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_370), 16, 16)) -> intp(2, 3, 1)
	.word 0xb7343001  ! 1: SRLX_I	srlx	%r16, 0x0001, %r27
thr3_nuke_intr_371:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_371), 16, 16)) -> intp(2, 2, 1)
	.word 0x92ac2880  ! 1: ANDNcc_I	andncc 	%r16, 0x0880, %r9
thr3_resum_intr_372:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_372), 16, 16)) -> intp(2, 3, 1)
	.word 0x848c2f85  ! 1: ANDcc_I	andcc 	%r16, 0x0f85, %r2
thr3_nuke_intr_373:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_373), 16, 16)) -> intp(2, 2, 1)
	.word 0x84842b2c  ! 1: ADDcc_I	addcc 	%r16, 0x0b2c, %r2
	.word 0x90440011  ! 1: ADDC_R	addc 	%r16, %r17, %r8
	.word 0x84840011  ! 1: ADDcc_R	addcc 	%r16, %r17, %r2
thr3_resum_intr_374:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_374), 16, 16)) -> intp(2, 3, 1)
	.word 0xb8c40011  ! 1: ADDCcc_R	addccc 	%r16, %r17, %r28
	.word 0x8b341011  ! 1: SRLX_R	srlx	%r16, %r17, %r5
	.word 0xab641811  ! 1: MOVcc_R	<illegal instruction>
thr3_nuke_intr_375:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_375), 16, 16)) -> intp(2, 2, 1)
	.word 0x8a3c0011  ! 1: XNOR_R	xnor 	%r16, %r17, %r5
	.word 0xba840011  ! 1: ADDcc_R	addcc 	%r16, %r17, %r29
	.word 0x8e0c21ab  ! 1: AND_I	and 	%r16, 0x01ab, %r7
thr3_resum_intr_376:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_376), 16, 16)) -> intp(2, 3, 1)
	.word 0x941c2c9b  ! 1: XOR_I	xor 	%r16, 0x0c9b, %r10
	.word 0x889c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r4
	.word 0x93340011  ! 1: SRL_R	srl 	%r16, %r17, %r9
thr3_hw_intr_377:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_377), 16, 16)) -> intp(1, 0, 1)
	.word 0x86142a94  ! 1: OR_I	or 	%r16, 0x0a94, %r3
	.word 0x8a8c0011  ! 1: ANDcc_R	andcc 	%r16, %r17, %r5
	.word 0x89341011  ! 1: SRLX_R	srlx	%r16, %r17, %r4
thr3_nuke_intr_378:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_378), 16, 16)) -> intp(2, 2, 1)
	.word 0x8c840011  ! 1: ADDcc_R	addcc 	%r16, %r17, %r6
	.word 0x84c42733  ! 1: ADDCcc_I	addccc 	%r16, 0x0733, %r2
	.word 0x8c9c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r6
thr3_resum_intr_379:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_379), 16, 16)) -> intp(2, 3, 1)
	.word 0xaa4421ca  ! 1: ADDC_I	addc 	%r16, 0x01ca, %r21
	.word 0x960420c5  ! 1: ADD_I	add 	%r16, 0x00c5, %r11
	.word 0x84ac0011  ! 1: ANDNcc_R	andncc 	%r16, %r17, %r2
thr3_hw_intr_380:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_380), 16, 16)) -> intp(1, 0, 1)
	.word 0xa8c422bb  ! 1: ADDCcc_I	addccc 	%r16, 0x02bb, %r20
thr3_hw_intr_381:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_381), 16, 16)) -> intp(0, 0, 1)
	.word 0x988c2155  ! 1: ANDcc_I	andcc 	%r16, 0x0155, %r12
	.word 0x8cbc2025  ! 1: XNORcc_I	xnorcc 	%r16, 0x0025, %r6
thr3_nuke_intr_382:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_382), 16, 16)) -> intp(1, 2, 1)
	.word 0x8a2c0011  ! 1: ANDN_R	andn 	%r16, %r17, %r5
	.word 0xbb2c2001  ! 1: SLL_I	sll 	%r16, 0x0001, %r29
	.word 0xab342001  ! 1: SRL_I	srl 	%r16, 0x0001, %r21
thr3_resum_intr_383:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_383), 16, 16)) -> intp(1, 3, 1)
	.word 0xb4140011  ! 1: OR_R	or 	%r16, %r17, %r26
	.word 0x9abc2d8d  ! 1: XNORcc_I	xnorcc 	%r16, 0x0d8d, %r13
	.word 0xb0ac0011  ! 1: ANDNcc_R	andncc 	%r16, %r17, %r24
thr3_nuke_intr_384:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_384), 16, 16)) -> intp(2, 2, 1)
	.word 0x84b40011  ! 1: ORNcc_R	orncc 	%r16, %r17, %r2
	.word 0xb5641811  ! 1: MOVcc_R	<illegal instruction>
thr3_resum_intr_385:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_385), 16, 16)) -> intp(2, 3, 1)
	.word 0x9b342001  ! 1: SRL_I	srl 	%r16, 0x0001, %r13
	.word 0x9c0c2307  ! 1: AND_I	and 	%r16, 0x0307, %r14
thr3_hw_intr_386:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_386), 16, 16)) -> intp(1, 0, 1)
	.word 0x883c0011  ! 1: XNOR_R	xnor 	%r16, %r17, %r4
	.word 0xaf2c1011  ! 1: SLLX_R	sllx	%r16, %r17, %r23
	.word 0x9a2c20d7  ! 1: ANDN_I	andn 	%r16, 0x00d7, %r13
thr3_hw_intr_387:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_387), 16, 16)) -> intp(1, 0, 1)
	.word 0x9b342001  ! 1: SRL_I	srl 	%r16, 0x0001, %r13
thr3_nuke_intr_388:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_388), 16, 16)) -> intp(1, 2, 1)
	.word 0x992c2001  ! 1: SLL_I	sll 	%r16, 0x0001, %r12
	.word 0xb49c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r26
thr3_resum_intr_389:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_389), 16, 16)) -> intp(1, 3, 1)
	.word 0x98bc0011  ! 1: XNORcc_R	xnorcc 	%r16, %r17, %r12
	.word 0x88440011  ! 1: ADDC_R	addc 	%r16, %r17, %r4
thr3_nuke_intr_390:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_390), 16, 16)) -> intp(2, 2, 1)
	.word 0xa7641811  ! 1: MOVcc_R	<illegal instruction>
	.word 0x9f3c2001  ! 1: SRA_I	sra 	%r16, 0x0001, %r15
	.word 0x8c1c0011  ! 1: XOR_R	xor 	%r16, %r17, %r6
	.word 0x853c0011  ! 1: SRA_R	sra 	%r16, %r17, %r2
thr3_resum_intr_391:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_391), 16, 16)) -> intp(2, 3, 1)
	.word 0x9b341011  ! 1: SRLX_R	srlx	%r16, %r17, %r13
	.word 0x85342001  ! 1: SRL_I	srl 	%r16, 0x0001, %r2
	.word 0xb22c242c  ! 1: ANDN_I	andn 	%r16, 0x042c, %r25
	.word 0x832c0011  ! 1: SLL_R	sll 	%r16, %r17, %r1
thr3_hw_intr_392:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_392), 16, 16)) -> intp(0, 0, 1)
	.word 0xb13c2001  ! 1: SRA_I	sra 	%r16, 0x0001, %r24
	.word 0xa69c2909  ! 1: XORcc_I	xorcc 	%r16, 0x0909, %r19
thr3_hw_intr_393:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_393), 16, 16)) -> intp(2, 0, 1)
	.word 0xa81c0011  ! 1: XOR_R	xor 	%r16, %r17, %r20
	.word 0x92ac2aa6  ! 1: ANDNcc_I	andncc 	%r16, 0x0aa6, %r9
thr3_nuke_intr_394:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_394), 16, 16)) -> intp(2, 2, 1)
	.word 0x9a9c281a  ! 1: XORcc_I	xorcc 	%r16, 0x081a, %r13
	.word 0xb4442fff  ! 1: ADDC_I	addc 	%r16, 0x0fff, %r26
	.word 0x861c0011  ! 1: XOR_R	xor 	%r16, %r17, %r3
thr3_resum_intr_395:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_395), 16, 16)) -> intp(2, 3, 1)
	.word 0x892c3001  ! 1: SLLX_I	sllx	%r16, 0x0001, %r4
	.word 0xa63c2431  ! 1: XNOR_I	xnor 	%r16, 0x0431, %r19
	.word 0xb61c2bb2  ! 1: XOR_I	xor 	%r16, 0x0bb2, %r27
thr3_hw_intr_396:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_396), 16, 16)) -> intp(1, 0, 1)
	.word 0x84c40011  ! 1: ADDCcc_R	addccc 	%r16, %r17, %r2
	.word 0x99342001  ! 1: SRL_I	srl 	%r16, 0x0001, %r12
thr3_nuke_intr_397:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_397), 16, 16)) -> intp(0, 2, 1)
	.word 0x8d342001  ! 1: SRL_I	srl 	%r16, 0x0001, %r6
	.word 0x9f7c2401  ! 1: MOVR_I	movre	%r16, 0x1, %r15
	.word 0x92c42a3b  ! 1: ADDCcc_I	addccc 	%r16, 0x0a3b, %r9
thr3_resum_intr_398:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_398), 16, 16)) -> intp(0, 3, 1)
	.word 0xb84422fc  ! 1: ADDC_I	addc 	%r16, 0x02fc, %r28
	.word 0xb2840011  ! 1: ADDcc_R	addcc 	%r16, %r17, %r25
	.word 0x9d7c0411  ! 1: MOVR_R	movre	%r16, %r17, %r14
thr3_nuke_intr_399:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_399), 16, 16)) -> intp(1, 2, 1)
	.word 0x8c940011  ! 1: ORcc_R	orcc 	%r16, %r17, %r6
thr3_resum_intr_400:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_400), 16, 16)) -> intp(1, 3, 1)
	.word 0x982c0011  ! 1: ANDN_R	andn 	%r16, %r17, %r12
thr3_nuke_intr_401:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_401), 16, 16)) -> intp(2, 2, 1)
	.word 0xb0b426dc  ! 1: ORNcc_I	orncc 	%r16, 0x06dc, %r24
	.word 0xb1643801  ! 1: MOVcc_I	<illegal instruction>
thr3_resum_intr_402:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_402), 16, 16)) -> intp(2, 3, 1)
	.word 0x96940011  ! 1: ORcc_R	orcc 	%r16, %r17, %r11
	.word 0xb6b40011  ! 1: ORNcc_R	orncc 	%r16, %r17, %r27
thr3_hw_intr_403:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_403), 16, 16)) -> intp(1, 0, 1)
	.word 0x9a9c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r13
thr3_hw_intr_404:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_404), 16, 16)) -> intp(1, 0, 1)
	.word 0xad7c2401  ! 1: MOVR_I	movre	%r16, 0x1, %r22
	.word 0x9f3c2001  ! 1: SRA_I	sra 	%r16, 0x0001, %r15
thr3_hw_intr_405:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_405), 16, 16)) -> intp(1, 0, 1)
	.word 0x853c1011  ! 1: SRAX_R	srax	%r16, %r17, %r2
	.word 0xb29c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r25
	.word 0x84c40011  ! 1: ADDCcc_R	addccc 	%r16, %r17, %r2
thr3_hw_intr_406:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_406), 16, 16)) -> intp(0, 0, 1)
	.word 0xbb7c0411  ! 1: MOVR_R	movre	%r16, %r17, %r29
thr3_nuke_intr_407:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_407), 16, 16)) -> intp(2, 2, 1)
	.word 0x973c2001  ! 1: SRA_I	sra 	%r16, 0x0001, %r11
thr3_resum_intr_408:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_408), 16, 16)) -> intp(2, 3, 1)
	.word 0xaabc0011  ! 1: XNORcc_R	xnorcc 	%r16, %r17, %r21
thr3_hw_intr_409:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_409), 16, 16)) -> intp(0, 0, 1)
	.word 0xaa3c0011  ! 1: XNOR_R	xnor 	%r16, %r17, %r21
thr3_hw_intr_410:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_410), 16, 16)) -> intp(0, 0, 1)
	.word 0x917c2401  ! 1: MOVR_I	movre	%r16, 0x1, %r8
	.word 0x960c2e9b  ! 1: AND_I	and 	%r16, 0x0e9b, %r11
	.word 0xbaac0011  ! 1: ANDNcc_R	andncc 	%r16, %r17, %r29
thr3_nuke_intr_411:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_411), 16, 16)) -> intp(0, 2, 1)
	.word 0x8e142cf9  ! 1: OR_I	or 	%r16, 0x0cf9, %r7
	.word 0x88ac0011  ! 1: ANDNcc_R	andncc 	%r16, %r17, %r4
	.word 0x977c2401  ! 1: MOVR_I	movre	%r16, 0x1, %r11
thr3_resum_intr_412:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_412), 16, 16)) -> intp(0, 3, 1)
	.word 0x989c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r12
	.word 0xbb7c2401  ! 1: MOVR_I	movre	%r16, 0x1, %r29
	.word 0xa8bc2dc5  ! 1: XNORcc_I	xnorcc 	%r16, 0x0dc5, %r20
thr3_hw_intr_413:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_413), 16, 16)) -> intp(0, 0, 1)
	.word 0xb2940011  ! 1: ORcc_R	orcc 	%r16, %r17, %r25
	.word 0x8c842ef3  ! 1: ADDcc_I	addcc 	%r16, 0x0ef3, %r6
	.word 0xb6940011  ! 1: ORcc_R	orcc 	%r16, %r17, %r27
thr3_hw_intr_414:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_414), 16, 16)) -> intp(0, 0, 1)
	.word 0x992c2001  ! 1: SLL_I	sll 	%r16, 0x0001, %r12
	.word 0x96940011  ! 1: ORcc_R	orcc 	%r16, %r17, %r11
thr3_nuke_intr_415:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_415), 16, 16)) -> intp(0, 2, 1)
	.word 0x92b40011  ! 1: ORNcc_R	orncc 	%r16, %r17, %r9
thr3_resum_intr_416:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_416), 16, 16)) -> intp(0, 3, 1)
	.word 0xad2c1011  ! 1: SLLX_R	sllx	%r16, %r17, %r22
thr3_nuke_intr_417:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_417), 16, 16)) -> intp(0, 2, 1)
	.word 0x88340011  ! 1: ORN_R	orn 	%r16, %r17, %r4
thr3_resum_intr_418:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_418), 16, 16)) -> intp(0, 3, 1)
	.word 0xaf2c1011  ! 1: SLLX_R	sllx	%r16, %r17, %r23
thr3_hw_intr_419:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_419), 16, 16)) -> intp(0, 0, 1)
	.word 0x8e042e56  ! 1: ADD_I	add 	%r16, 0x0e56, %r7
	.word 0x9c9c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r14
	.word 0xb2c42dfd  ! 1: ADDCcc_I	addccc 	%r16, 0x0dfd, %r25
	.word 0x889c2976  ! 1: XORcc_I	xorcc 	%r16, 0x0976, %r4
thr3_nuke_intr_420:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_420), 16, 16)) -> intp(1, 2, 1)
	.word 0x88340011  ! 1: ORN_R	orn 	%r16, %r17, %r4
	.word 0x99342001  ! 1: SRL_I	srl 	%r16, 0x0001, %r12
	.word 0x922c27cb  ! 1: ANDN_I	andn 	%r16, 0x07cb, %r9
	.word 0x8f2c0011  ! 1: SLL_R	sll 	%r16, %r17, %r7
thr3_resum_intr_421:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_421), 16, 16)) -> intp(1, 3, 1)
	.word 0x82bc0011  ! 1: XNORcc_R	xnorcc 	%r16, %r17, %r1
	.word 0xbb341011  ! 1: SRLX_R	srlx	%r16, %r17, %r29
	.word 0x9a9c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r13
	.word 0x96840011  ! 1: ADDcc_R	addcc 	%r16, %r17, %r11
thr3_nuke_intr_422:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_422), 16, 16)) -> intp(2, 2, 1)
	.word 0xb93c2001  ! 1: SRA_I	sra 	%r16, 0x0001, %r28
	.word 0xbaac0011  ! 1: ANDNcc_R	andncc 	%r16, %r17, %r29
thr3_resum_intr_423:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_423), 16, 16)) -> intp(2, 3, 1)
	.word 0x96c40011  ! 1: ADDCcc_R	addccc 	%r16, %r17, %r11
	.word 0xb5643801  ! 1: MOVcc_I	<illegal instruction>
thr3_hw_intr_424:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_424), 16, 16)) -> intp(2, 0, 1)
	.word 0x83641811  ! 1: MOVcc_R	<illegal instruction>
thr3_hw_intr_425:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_425), 16, 16)) -> intp(1, 0, 1)
	.word 0x888c0011  ! 1: ANDcc_R	andcc 	%r16, %r17, %r4
	.word 0x82340011  ! 1: ORN_R	orn 	%r16, %r17, %r1
thr3_nuke_intr_426:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_426), 16, 16)) -> intp(0, 2, 1)
	.word 0x84c4278f  ! 1: ADDCcc_I	addccc 	%r16, 0x078f, %r2
thr3_resum_intr_427:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_427), 16, 16)) -> intp(0, 3, 1)
	.word 0x863c0011  ! 1: XNOR_R	xnor 	%r16, %r17, %r3
thr3_hw_intr_428:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_428), 16, 16)) -> intp(1, 0, 1)
	.word 0x992c2001  ! 1: SLL_I	sll 	%r16, 0x0001, %r12
	.word 0x91643801  ! 1: MOVcc_I	<illegal instruction>
	.word 0x8a440011  ! 1: ADDC_R	addc 	%r16, %r17, %r5
thr3_hw_intr_429:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_429), 16, 16)) -> intp(0, 0, 1)
	.word 0xbaac0011  ! 1: ANDNcc_R	andncc 	%r16, %r17, %r29
	.word 0x9f7c0411  ! 1: MOVR_R	movre	%r16, %r17, %r15
thr3_hw_intr_430:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_430), 16, 16)) -> intp(0, 0, 1)
	.word 0x8a042e03  ! 1: ADD_I	add 	%r16, 0x0e03, %r5
thr3_hw_intr_431:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_431), 16, 16)) -> intp(2, 0, 1)
	.word 0x8b340011  ! 1: SRL_R	srl 	%r16, %r17, %r5
	.word 0xbab42a73  ! 1: ORNcc_I	orncc 	%r16, 0x0a73, %r29
thr3_hw_intr_432:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_432), 16, 16)) -> intp(0, 0, 1)
	.word 0x9b2c1011  ! 1: SLLX_R	sllx	%r16, %r17, %r13
	.word 0xa97c2401  ! 1: MOVR_I	movre	%r16, 0x1, %r20
	.word 0xa89c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r20
thr3_nuke_intr_433:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_433), 16, 16)) -> intp(2, 2, 1)
	.word 0x8c8c2f4c  ! 1: ANDcc_I	andcc 	%r16, 0x0f4c, %r6
thr3_resum_intr_434:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_434), 16, 16)) -> intp(2, 3, 1)
	.word 0x82ac0011  ! 1: ANDNcc_R	andncc 	%r16, %r17, %r1
thr3_nuke_intr_435:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_435), 16, 16)) -> intp(0, 2, 1)
	.word 0x96c40011  ! 1: ADDCcc_R	addccc 	%r16, %r17, %r11
thr3_resum_intr_436:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_436), 16, 16)) -> intp(0, 3, 1)
	.word 0xb22c29d2  ! 1: ANDN_I	andn 	%r16, 0x09d2, %r25
thr3_nuke_intr_437:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_437), 16, 16)) -> intp(0, 2, 1)
	.word 0x940c0011  ! 1: AND_R	and 	%r16, %r17, %r10
	.word 0x8f2c1011  ! 1: SLLX_R	sllx	%r16, %r17, %r7
thr3_resum_intr_438:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_438), 16, 16)) -> intp(0, 3, 1)
	.word 0x992c0011  ! 1: SLL_R	sll 	%r16, %r17, %r12
	.word 0xab3c1011  ! 1: SRAX_R	srax	%r16, %r17, %r21
thr3_nuke_intr_439:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_439), 16, 16)) -> intp(1, 2, 1)
	.word 0xba840011  ! 1: ADDcc_R	addcc 	%r16, %r17, %r29
	.word 0x82ac0011  ! 1: ANDNcc_R	andncc 	%r16, %r17, %r1
thr3_resum_intr_440:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_440), 16, 16)) -> intp(1, 3, 1)
	.word 0xb0c42e3e  ! 1: ADDCcc_I	addccc 	%r16, 0x0e3e, %r24
	.word 0xaa8c0011  ! 1: ANDcc_R	andcc 	%r16, %r17, %r21
thr3_nuke_intr_441:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_441), 16, 16)) -> intp(2, 2, 1)
	.word 0xa89c2450  ! 1: XORcc_I	xorcc 	%r16, 0x0450, %r20
	.word 0xb63c0011  ! 1: XNOR_R	xnor 	%r16, %r17, %r27
thr3_resum_intr_442:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_442), 16, 16)) -> intp(2, 3, 1)
	.word 0x8a2c0011  ! 1: ANDN_R	andn 	%r16, %r17, %r5
	.word 0xb73c0011  ! 1: SRA_R	sra 	%r16, %r17, %r27
thr3_nuke_intr_443:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_443), 16, 16)) -> intp(2, 2, 1)
	.word 0xb5341011  ! 1: SRLX_R	srlx	%r16, %r17, %r26
	.word 0x8e1c0011  ! 1: XOR_R	xor 	%r16, %r17, %r7
	.word 0x9d341011  ! 1: SRLX_R	srlx	%r16, %r17, %r14
thr3_resum_intr_444:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_444), 16, 16)) -> intp(2, 3, 1)
	.word 0x9e1c2a6f  ! 1: XOR_I	xor 	%r16, 0x0a6f, %r15
	.word 0x96ac2991  ! 1: ANDNcc_I	andncc 	%r16, 0x0991, %r11
	.word 0xb2c40011  ! 1: ADDCcc_R	addccc 	%r16, %r17, %r25
thr3_hw_intr_445:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_445), 16, 16)) -> intp(2, 0, 1)
	.word 0x98b40011  ! 1: ORNcc_R	orncc 	%r16, %r17, %r12
	.word 0x85341011  ! 1: SRLX_R	srlx	%r16, %r17, %r2
	.word 0x961c0011  ! 1: XOR_R	xor 	%r16, %r17, %r11
thr3_hw_intr_446:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_446), 16, 16)) -> intp(0, 0, 1)
	.word 0x82ac0011  ! 1: ANDNcc_R	andncc 	%r16, %r17, %r1
thr3_hw_intr_447:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_447), 16, 16)) -> intp(0, 0, 1)
	.word 0x98c40011  ! 1: ADDCcc_R	addccc 	%r16, %r17, %r12
	.word 0x94ac293f  ! 1: ANDNcc_I	andncc 	%r16, 0x093f, %r10
	.word 0x9d3c1011  ! 1: SRAX_R	srax	%r16, %r17, %r14
thr3_nuke_intr_448:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_448), 16, 16)) -> intp(2, 2, 1)
	.word 0x9e842a3b  ! 1: ADDcc_I	addcc 	%r16, 0x0a3b, %r15
	.word 0xb12c3001  ! 1: SLLX_I	sllx	%r16, 0x0001, %r24
	.word 0x9aac0011  ! 1: ANDNcc_R	andncc 	%r16, %r17, %r13
thr3_resum_intr_449:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_449), 16, 16)) -> intp(2, 3, 1)
	.word 0x82840011  ! 1: ADDcc_R	addcc 	%r16, %r17, %r1
	.word 0x909c2aa6  ! 1: XORcc_I	xorcc 	%r16, 0x0aa6, %r8
	.word 0x952c0011  ! 1: SLL_R	sll 	%r16, %r17, %r10
thr3_hw_intr_450:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_450), 16, 16)) -> intp(1, 0, 1)
	.word 0x8a440011  ! 1: ADDC_R	addc 	%r16, %r17, %r5
	.word 0x8b342001  ! 1: SRL_I	srl 	%r16, 0x0001, %r5
thr3_nuke_intr_451:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_451), 16, 16)) -> intp(0, 2, 1)
	.word 0x881c0011  ! 1: XOR_R	xor 	%r16, %r17, %r4
	.word 0x8cbc0011  ! 1: XNORcc_R	xnorcc 	%r16, %r17, %r6
	.word 0x961c0011  ! 1: XOR_R	xor 	%r16, %r17, %r11
thr3_resum_intr_452:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_452), 16, 16)) -> intp(0, 3, 1)
	.word 0x9e3c2750  ! 1: XNOR_I	xnor 	%r16, 0x0750, %r15
	.word 0x82b42f06  ! 1: ORNcc_I	orncc 	%r16, 0x0f06, %r1
	.word 0x962c2722  ! 1: ANDN_I	andn 	%r16, 0x0722, %r11
thr3_hw_intr_453:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_453), 16, 16)) -> intp(1, 0, 1)
	.word 0x8a8c0011  ! 1: ANDcc_R	andcc 	%r16, %r17, %r5
	.word 0x989c2bbd  ! 1: XORcc_I	xorcc 	%r16, 0x0bbd, %r12
thr3_hw_intr_454:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_454), 16, 16)) -> intp(1, 0, 1)
	.word 0x84940011  ! 1: ORcc_R	orcc 	%r16, %r17, %r2
	.word 0xab341011  ! 1: SRLX_R	srlx	%r16, %r17, %r21
thr3_nuke_intr_455:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_455), 16, 16)) -> intp(0, 2, 1)
	.word 0x9eac2748  ! 1: ANDNcc_I	andncc 	%r16, 0x0748, %r15
	.word 0xb21c0011  ! 1: XOR_R	xor 	%r16, %r17, %r25
thr3_resum_intr_456:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_456), 16, 16)) -> intp(0, 3, 1)
	.word 0xb6bc0011  ! 1: XNORcc_R	xnorcc 	%r16, %r17, %r27
	.word 0x961421f7  ! 1: OR_I	or 	%r16, 0x01f7, %r11
thr3_hw_intr_457:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_457), 16, 16)) -> intp(2, 0, 1)
	.word 0xb20c2a01  ! 1: AND_I	and 	%r16, 0x0a01, %r25
thr3_nuke_intr_458:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_458), 16, 16)) -> intp(1, 2, 1)
	.word 0xb09c2189  ! 1: XORcc_I	xorcc 	%r16, 0x0189, %r24
thr3_resum_intr_459:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_459), 16, 16)) -> intp(1, 3, 1)
	.word 0xae140011  ! 1: OR_R	or 	%r16, %r17, %r23
thr3_hw_intr_460:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_460), 16, 16)) -> intp(0, 0, 1)
	.word 0x91341011  ! 1: SRLX_R	srlx	%r16, %r17, %r8
thr3_nuke_intr_461:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_461), 16, 16)) -> intp(0, 2, 1)
	.word 0xba142f31  ! 1: OR_I	or 	%r16, 0x0f31, %r29
	.word 0xb9641811  ! 1: MOVcc_R	<illegal instruction>
	.word 0xaa942030  ! 1: ORcc_I	orcc 	%r16, 0x0030, %r21
thr3_resum_intr_462:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_462), 16, 16)) -> intp(0, 3, 1)
	.word 0xa9643801  ! 1: MOVcc_I	<illegal instruction>
	.word 0x8cb40011  ! 1: ORNcc_R	orncc 	%r16, %r17, %r6
	.word 0xab7c2401  ! 1: MOVR_I	movre	%r16, 0x1, %r21
thr3_nuke_intr_463:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_463), 16, 16)) -> intp(0, 2, 1)
	.word 0x88ac0011  ! 1: ANDNcc_R	andncc 	%r16, %r17, %r4
	.word 0x917c2401  ! 1: MOVR_I	movre	%r16, 0x1, %r8
	.word 0x92842061  ! 1: ADDcc_I	addcc 	%r16, 0x0061, %r9
thr3_resum_intr_464:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_464), 16, 16)) -> intp(0, 3, 1)
	.word 0xb4142d05  ! 1: OR_I	or 	%r16, 0x0d05, %r26
	.word 0xad2c2001  ! 1: SLL_I	sll 	%r16, 0x0001, %r22
	.word 0xae0c2e21  ! 1: AND_I	and 	%r16, 0x0e21, %r23
thr3_nuke_intr_465:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_465), 16, 16)) -> intp(1, 2, 1)
	.word 0x957c2401  ! 1: MOVR_I	movre	%r16, 0x1, %r10
	.word 0x98140011  ! 1: OR_R	or 	%r16, %r17, %r12
thr3_resum_intr_466:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_466), 16, 16)) -> intp(1, 3, 1)
	.word 0xb53c1011  ! 1: SRAX_R	srax	%r16, %r17, %r26
	.word 0x9b643801  ! 1: MOVcc_I	<illegal instruction>
thr3_nuke_intr_467:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_467), 16, 16)) -> intp(0, 2, 1)
	.word 0xa8340011  ! 1: ORN_R	orn 	%r16, %r17, %r20
thr3_resum_intr_468:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_468), 16, 16)) -> intp(0, 3, 1)
	.word 0x822c2c28  ! 1: ANDN_I	andn 	%r16, 0x0c28, %r1
thr3_nuke_intr_469:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_469), 16, 16)) -> intp(2, 2, 1)
	.word 0xbb2c1011  ! 1: SLLX_R	sllx	%r16, %r17, %r29
	.word 0x8a8c0011  ! 1: ANDcc_R	andcc 	%r16, %r17, %r5
	.word 0xa8040011  ! 1: ADD_R	add 	%r16, %r17, %r20
thr3_resum_intr_470:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_470), 16, 16)) -> intp(2, 3, 1)
	.word 0x960420ac  ! 1: ADD_I	add 	%r16, 0x00ac, %r11
	.word 0x92840011  ! 1: ADDcc_R	addcc 	%r16, %r17, %r9
	.word 0xb57c2401  ! 1: MOVR_I	movre	%r16, 0x1, %r26
thr3_nuke_intr_471:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_471), 16, 16)) -> intp(2, 2, 1)
	.word 0xb6342adc  ! 1: ORN_I	orn 	%r16, 0x0adc, %r27
	.word 0xa6ac0011  ! 1: ANDNcc_R	andncc 	%r16, %r17, %r19
thr3_resum_intr_472:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_472), 16, 16)) -> intp(2, 3, 1)
	.word 0x8a1c22f0  ! 1: XOR_I	xor 	%r16, 0x02f0, %r5
	.word 0x87342001  ! 1: SRL_I	srl 	%r16, 0x0001, %r3
thr3_nuke_intr_473:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_473), 16, 16)) -> intp(2, 2, 1)
	.word 0x8ec40011  ! 1: ADDCcc_R	addccc 	%r16, %r17, %r7
	.word 0x94040011  ! 1: ADD_R	add 	%r16, %r17, %r10
thr3_resum_intr_474:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_474), 16, 16)) -> intp(2, 3, 1)
	.word 0xa72c0011  ! 1: SLL_R	sll 	%r16, %r17, %r19
	.word 0x89641811  ! 1: MOVcc_R	<illegal instruction>
thr3_hw_intr_475:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_475), 16, 16)) -> intp(2, 0, 1)
	.word 0x9a2c2653  ! 1: ANDN_I	andn 	%r16, 0x0653, %r13
	.word 0x864422c5  ! 1: ADDC_I	addc 	%r16, 0x02c5, %r3
thr3_nuke_intr_476:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_476), 16, 16)) -> intp(0, 2, 1)
	.word 0x8a9421ce  ! 1: ORcc_I	orcc 	%r16, 0x01ce, %r5
	.word 0x900426f2  ! 1: ADD_I	add 	%r16, 0x06f2, %r8
thr3_resum_intr_477:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_477), 16, 16)) -> intp(0, 3, 1)
	.word 0x8c8c0011  ! 1: ANDcc_R	andcc 	%r16, %r17, %r6
	.word 0x84bc2d90  ! 1: XNORcc_I	xnorcc 	%r16, 0x0d90, %r2
thr3_nuke_intr_478:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_478), 16, 16)) -> intp(2, 2, 1)
	.word 0xba3c0011  ! 1: XNOR_R	xnor 	%r16, %r17, %r29
	.word 0x8cc40011  ! 1: ADDCcc_R	addccc 	%r16, %r17, %r6
	.word 0xb6bc0011  ! 1: XNORcc_R	xnorcc 	%r16, %r17, %r27
	.word 0xbb342001  ! 1: SRL_I	srl 	%r16, 0x0001, %r29
thr3_resum_intr_479:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_479), 16, 16)) -> intp(2, 3, 1)
	.word 0x952c2001  ! 1: SLL_I	sll 	%r16, 0x0001, %r10
	.word 0xacbc0011  ! 1: XNORcc_R	xnorcc 	%r16, %r17, %r22
	.word 0x8f3c2001  ! 1: SRA_I	sra 	%r16, 0x0001, %r7
	.word 0x9c3c2c17  ! 1: XNOR_I	xnor 	%r16, 0x0c17, %r14
thr3_hw_intr_480:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_480), 16, 16)) -> intp(1, 0, 1)
	.word 0x92440011  ! 1: ADDC_R	addc 	%r16, %r17, %r9
thr3_nuke_intr_481:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_481), 16, 16)) -> intp(1, 2, 1)
	.word 0x948c0011  ! 1: ANDcc_R	andcc 	%r16, %r17, %r10
thr3_resum_intr_482:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_482), 16, 16)) -> intp(1, 3, 1)
	.word 0x8f7c0411  ! 1: MOVR_R	movre	%r16, %r17, %r7
thr3_nuke_intr_483:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_483), 16, 16)) -> intp(2, 2, 1)
	.word 0x8cbc2389  ! 1: XNORcc_I	xnorcc 	%r16, 0x0389, %r6
	.word 0x88342ef4  ! 1: ORN_I	orn 	%r16, 0x0ef4, %r4
	.word 0xaf342001  ! 1: SRL_I	srl 	%r16, 0x0001, %r23
thr3_resum_intr_484:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_484), 16, 16)) -> intp(2, 3, 1)
	.word 0xa6340011  ! 1: ORN_R	orn 	%r16, %r17, %r19
	.word 0x933c0011  ! 1: SRA_R	sra 	%r16, %r17, %r9
	.word 0x94142be6  ! 1: OR_I	or 	%r16, 0x0be6, %r10
thr3_hw_intr_485:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_485), 16, 16)) -> intp(2, 0, 1)
	.word 0x8e342e3d  ! 1: ORN_I	orn 	%r16, 0x0e3d, %r7
	.word 0x95340011  ! 1: SRL_R	srl 	%r16, %r17, %r10
	.word 0x98ac0011  ! 1: ANDNcc_R	andncc 	%r16, %r17, %r12
thr3_hw_intr_486:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_486), 16, 16)) -> intp(2, 0, 1)
	.word 0xa62c2227  ! 1: ANDN_I	andn 	%r16, 0x0227, %r19
	.word 0x84ac2810  ! 1: ANDNcc_I	andncc 	%r16, 0x0810, %r2
	.word 0x897c2401  ! 1: MOVR_I	movre	%r16, 0x1, %r4
thr3_hw_intr_487:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_487), 16, 16)) -> intp(1, 0, 1)
	.word 0x82040011  ! 1: ADD_R	add 	%r16, %r17, %r1
	.word 0x969c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r11
	.word 0xad2c0011  ! 1: SLL_R	sll 	%r16, %r17, %r22
	.word 0xaa942d92  ! 1: ORcc_I	orcc 	%r16, 0x0d92, %r21
thr3_hw_intr_488:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_488), 16, 16)) -> intp(1, 0, 1)
	.word 0x82c40011  ! 1: ADDCcc_R	addccc 	%r16, %r17, %r1
	.word 0x86042b45  ! 1: ADD_I	add 	%r16, 0x0b45, %r3
thr3_nuke_intr_489:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_489), 16, 16)) -> intp(1, 2, 1)
	.word 0x917c2401  ! 1: MOVR_I	movre	%r16, 0x1, %r8
	.word 0xaf341011  ! 1: SRLX_R	srlx	%r16, %r17, %r23
	.word 0x9ab40011  ! 1: ORNcc_R	orncc 	%r16, %r17, %r13
thr3_resum_intr_490:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_490), 16, 16)) -> intp(1, 3, 1)
	.word 0xa88c2dfa  ! 1: ANDcc_I	andcc 	%r16, 0x0dfa, %r20
	.word 0x96b42916  ! 1: ORNcc_I	orncc 	%r16, 0x0916, %r11
	.word 0x8c0c0011  ! 1: AND_R	and 	%r16, %r17, %r6
thr3_nuke_intr_491:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_491), 16, 16)) -> intp(0, 2, 1)
	.word 0xb0042229  ! 1: ADD_I	add 	%r16, 0x0229, %r24
	.word 0xb49c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r26
	.word 0xb01c2a6b  ! 1: XOR_I	xor 	%r16, 0x0a6b, %r24
	.word 0xaabc0011  ! 1: XNORcc_R	xnorcc 	%r16, %r17, %r21
thr3_resum_intr_492:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_492), 16, 16)) -> intp(0, 3, 1)
	.word 0xb83c2ec1  ! 1: XNOR_I	xnor 	%r16, 0x0ec1, %r28
	.word 0xb69c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r27
	.word 0xa9343001  ! 1: SRLX_I	srlx	%r16, 0x0001, %r20
	.word 0xbabc2675  ! 1: XNORcc_I	xnorcc 	%r16, 0x0675, %r29
thr3_hw_intr_493:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_493), 16, 16)) -> intp(0, 0, 1)
	.word 0x9a8c0011  ! 1: ANDcc_R	andcc 	%r16, %r17, %r13
	.word 0x8e840011  ! 1: ADDcc_R	addcc 	%r16, %r17, %r7
thr3_nuke_intr_494:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_494), 16, 16)) -> intp(1, 2, 1)
	.word 0x902c0011  ! 1: ANDN_R	andn 	%r16, %r17, %r8
thr3_resum_intr_495:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_495), 16, 16)) -> intp(1, 3, 1)
	.word 0x8e0c0011  ! 1: AND_R	and 	%r16, %r17, %r7
thr3_hw_intr_496:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_496), 16, 16)) -> intp(1, 0, 1)
	.word 0xac040011  ! 1: ADD_R	add 	%r16, %r17, %r22
	.word 0xad3c1011  ! 1: SRAX_R	srax	%r16, %r17, %r22
thr3_nuke_intr_497:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_497), 16, 16)) -> intp(1, 2, 1)
	.word 0x8b2c3001  ! 1: SLLX_I	sllx	%r16, 0x0001, %r5
	.word 0x8c3c0011  ! 1: XNOR_R	xnor 	%r16, %r17, %r6
	.word 0x86340011  ! 1: ORN_R	orn 	%r16, %r17, %r3
	.word 0x84042f17  ! 1: ADD_I	add 	%r16, 0x0f17, %r2
thr3_resum_intr_498:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_498), 16, 16)) -> intp(1, 3, 1)
	.word 0xb49c2fd4  ! 1: XORcc_I	xorcc 	%r16, 0x0fd4, %r26
	.word 0x9cb4200a  ! 1: ORNcc_I	orncc 	%r16, 0x000a, %r14
	.word 0xb13c2001  ! 1: SRA_I	sra 	%r16, 0x0001, %r24
	.word 0xbb2c3001  ! 1: SLLX_I	sllx	%r16, 0x0001, %r29
thr3_hw_intr_499:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_499), 16, 16)) -> intp(0, 0, 1)
	.word 0xb12c3001  ! 1: SLLX_I	sllx	%r16, 0x0001, %r24
	.word 0x883c0011  ! 1: XNOR_R	xnor 	%r16, %r17, %r4
	.word 0x8b3c0011  ! 1: SRA_R	sra 	%r16, %r17, %r5
	.word 0x948c27ed  ! 1: ANDcc_I	andcc 	%r16, 0x07ed, %r10
thr3_nuke_intr_500:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_500), 16, 16)) -> intp(1, 2, 1)
	.word 0xa6042c02  ! 1: ADD_I	add 	%r16, 0x0c02, %r19
thr3_resum_intr_501:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_501), 16, 16)) -> intp(1, 3, 1)
	.word 0xb0840011  ! 1: ADDcc_R	addcc 	%r16, %r17, %r24
thr3_nuke_intr_502:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_502), 16, 16)) -> intp(2, 2, 1)
	.word 0xb2c42bb8  ! 1: ADDCcc_I	addccc 	%r16, 0x0bb8, %r25
	.word 0xba9c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r29
	.word 0x9e3c2bc4  ! 1: XNOR_I	xnor 	%r16, 0x0bc4, %r15
	.word 0x85641811  ! 1: MOVcc_R	<illegal instruction>
thr3_resum_intr_503:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_503), 16, 16)) -> intp(2, 3, 1)
	.word 0x9d2c0011  ! 1: SLL_R	sll 	%r16, %r17, %r14
	.word 0xa68c0011  ! 1: ANDcc_R	andcc 	%r16, %r17, %r19
	.word 0x8ebc0011  ! 1: XNORcc_R	xnorcc 	%r16, %r17, %r7
	.word 0x88b40011  ! 1: ORNcc_R	orncc 	%r16, %r17, %r4
thr3_nuke_intr_504:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_504), 16, 16)) -> intp(0, 2, 1)
	.word 0xb2140011  ! 1: OR_R	or 	%r16, %r17, %r25
	.word 0xac840011  ! 1: ADDcc_R	addcc 	%r16, %r17, %r22
	.word 0xb4c40011  ! 1: ADDCcc_R	addccc 	%r16, %r17, %r26
	.word 0x949423d9  ! 1: ORcc_I	orcc 	%r16, 0x03d9, %r10
thr3_resum_intr_505:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_505), 16, 16)) -> intp(0, 3, 1)
	.word 0x949c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r10
	.word 0x97641811  ! 1: MOVcc_R	<illegal instruction>
	.word 0x983c237e  ! 1: XNOR_I	xnor 	%r16, 0x037e, %r12
	.word 0x9e0c0011  ! 1: AND_R	and 	%r16, %r17, %r15
thr3_nuke_intr_506:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_506), 16, 16)) -> intp(2, 2, 1)
	.word 0x92b40011  ! 1: ORNcc_R	orncc 	%r16, %r17, %r9
	.word 0xbabc0011  ! 1: XNORcc_R	xnorcc 	%r16, %r17, %r29
	.word 0x94040011  ! 1: ADD_R	add 	%r16, %r17, %r10
	.word 0x952c1011  ! 1: SLLX_R	sllx	%r16, %r17, %r10
thr3_resum_intr_507:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_507), 16, 16)) -> intp(2, 3, 1)
	.word 0x9e8c0011  ! 1: ANDcc_R	andcc 	%r16, %r17, %r15
	.word 0xb57c0411  ! 1: MOVR_R	movre	%r16, %r17, %r26
	.word 0x9cac287e  ! 1: ANDNcc_I	andncc 	%r16, 0x087e, %r14
	.word 0x86bc216f  ! 1: XNORcc_I	xnorcc 	%r16, 0x016f, %r3
thr3_nuke_intr_508:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_508), 16, 16)) -> intp(1, 2, 1)
	.word 0xaa0c2dfe  ! 1: AND_I	and 	%r16, 0x0dfe, %r21
	.word 0x997c2401  ! 1: MOVR_I	movre	%r16, 0x1, %r12
	.word 0x94040011  ! 1: ADD_R	add 	%r16, %r17, %r10
thr3_resum_intr_509:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_509), 16, 16)) -> intp(1, 3, 1)
	.word 0x8c040011  ! 1: ADD_R	add 	%r16, %r17, %r6
	.word 0xa6440011  ! 1: ADDC_R	addc 	%r16, %r17, %r19
	.word 0xb6ac0011  ! 1: ANDNcc_R	andncc 	%r16, %r17, %r27
thr3_nuke_intr_510:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_510), 16, 16)) -> intp(2, 2, 1)
	.word 0x8c440011  ! 1: ADDC_R	addc 	%r16, %r17, %r6
	.word 0x9c34295e  ! 1: ORN_I	orn 	%r16, 0x095e, %r14
	.word 0x8cac26b7  ! 1: ANDNcc_I	andncc 	%r16, 0x06b7, %r6
thr3_resum_intr_511:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_511), 16, 16)) -> intp(2, 3, 1)
	.word 0xb17c2401  ! 1: MOVR_I	movre	%r16, 0x1, %r24
	.word 0x8d641811  ! 1: MOVcc_R	<illegal instruction>
	.word 0x9a8c21f5  ! 1: ANDcc_I	andcc 	%r16, 0x01f5, %r13
thr3_hw_intr_512:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_512), 16, 16)) -> intp(1, 0, 1)
	.word 0x84940011  ! 1: ORcc_R	orcc 	%r16, %r17, %r2
	.word 0x8a1c0011  ! 1: XOR_R	xor 	%r16, %r17, %r5
thr3_nuke_intr_513:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_513), 16, 16)) -> intp(0, 2, 1)
	.word 0x94040011  ! 1: ADD_R	add 	%r16, %r17, %r10
	.word 0x912c0011  ! 1: SLL_R	sll 	%r16, %r17, %r8
	.word 0x96440011  ! 1: ADDC_R	addc 	%r16, %r17, %r11
thr3_resum_intr_514:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_514), 16, 16)) -> intp(0, 3, 1)
	.word 0x9e1c0011  ! 1: XOR_R	xor 	%r16, %r17, %r15
	.word 0x8ac40011  ! 1: ADDCcc_R	addccc 	%r16, %r17, %r5
	.word 0x928c2988  ! 1: ANDcc_I	andcc 	%r16, 0x0988, %r9
thr3_hw_intr_515:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_515), 16, 16)) -> intp(2, 0, 1)
	.word 0xb08c0011  ! 1: ANDcc_R	andcc 	%r16, %r17, %r24
thr3_hw_intr_516:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_516), 16, 16)) -> intp(2, 0, 1)
	.word 0xb00c0011  ! 1: AND_R	and 	%r16, %r17, %r24
thr3_hw_intr_517:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_517), 16, 16)) -> intp(1, 0, 1)
	.word 0x9e3c26a8  ! 1: XNOR_I	xnor 	%r16, 0x06a8, %r15
thr3_hw_intr_518:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_518), 16, 16)) -> intp(2, 0, 1)
	.word 0xa72c0011  ! 1: SLL_R	sll 	%r16, %r17, %r19
thr3_hw_intr_519:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_519), 16, 16)) -> intp(0, 0, 1)
	.word 0x8a842638  ! 1: ADDcc_I	addcc 	%r16, 0x0638, %r5
	.word 0x8a440011  ! 1: ADDC_R	addc 	%r16, %r17, %r5
	.word 0x88340011  ! 1: ORN_R	orn 	%r16, %r17, %r4
	.word 0x903c0011  ! 1: XNOR_R	xnor 	%r16, %r17, %r8
thr3_nuke_intr_520:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_520), 16, 16)) -> intp(2, 2, 1)
	.word 0xa97c0411  ! 1: MOVR_R	movre	%r16, %r17, %r20
thr3_resum_intr_521:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_521), 16, 16)) -> intp(2, 3, 1)
	.word 0x9a840011  ! 1: ADDcc_R	addcc 	%r16, %r17, %r13
thr3_hw_intr_522:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_522), 16, 16)) -> intp(1, 0, 1)
	.word 0xa88c2abb  ! 1: ANDcc_I	andcc 	%r16, 0x0abb, %r20
	.word 0x98bc0011  ! 1: XNORcc_R	xnorcc 	%r16, %r17, %r12
thr3_hw_intr_523:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_523), 16, 16)) -> intp(2, 0, 1)
	.word 0x8e3c2b68  ! 1: XNOR_I	xnor 	%r16, 0x0b68, %r7
thr3_hw_intr_524:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_524), 16, 16)) -> intp(0, 0, 1)
	.word 0xa6940011  ! 1: ORcc_R	orcc 	%r16, %r17, %r19
	.word 0x90bc0011  ! 1: XNORcc_R	xnorcc 	%r16, %r17, %r8
	.word 0x8b641811  ! 1: MOVcc_R	<illegal instruction>
	.word 0x9a340011  ! 1: ORN_R	orn 	%r16, %r17, %r13
thr3_nuke_intr_525:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_525), 16, 16)) -> intp(0, 2, 1)
	.word 0x8e3c0011  ! 1: XNOR_R	xnor 	%r16, %r17, %r7
thr3_resum_intr_526:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_526), 16, 16)) -> intp(0, 3, 1)
	.word 0xb23c0011  ! 1: XNOR_R	xnor 	%r16, %r17, %r25
thr3_hw_intr_527:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_527), 16, 16)) -> intp(1, 0, 1)
	.word 0x849c2b15  ! 1: XORcc_I	xorcc 	%r16, 0x0b15, %r2
thr3_nuke_intr_528:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_528), 16, 16)) -> intp(0, 2, 1)
	.word 0xb0b40011  ! 1: ORNcc_R	orncc 	%r16, %r17, %r24
thr3_resum_intr_529:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_529), 16, 16)) -> intp(0, 3, 1)
	.word 0x8f7c2401  ! 1: MOVR_I	movre	%r16, 0x1, %r7
thr3_hw_intr_530:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_530), 16, 16)) -> intp(1, 0, 1)
	.word 0x8cac2b30  ! 1: ANDNcc_I	andncc 	%r16, 0x0b30, %r6
	.word 0x82942eb8  ! 1: ORcc_I	orcc 	%r16, 0x0eb8, %r1
	.word 0xb4bc0011  ! 1: XNORcc_R	xnorcc 	%r16, %r17, %r26
	.word 0x88840011  ! 1: ADDcc_R	addcc 	%r16, %r17, %r4
thr3_hw_intr_531:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_531), 16, 16)) -> intp(0, 0, 1)
	.word 0x8aac2467  ! 1: ANDNcc_I	andncc 	%r16, 0x0467, %r5
thr3_hw_intr_532:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_532), 16, 16)) -> intp(2, 0, 1)
	.word 0x822c2dfc  ! 1: ANDN_I	andn 	%r16, 0x0dfc, %r1
	.word 0xa88c0011  ! 1: ANDcc_R	andcc 	%r16, %r17, %r20
thr3_nuke_intr_533:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_533), 16, 16)) -> intp(0, 2, 1)
	.word 0xb4ac0011  ! 1: ANDNcc_R	andncc 	%r16, %r17, %r26
	.word 0xb37c2401  ! 1: MOVR_I	movre	%r16, 0x1, %r25
	.word 0x8e1c0011  ! 1: XOR_R	xor 	%r16, %r17, %r7
thr3_resum_intr_534:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_534), 16, 16)) -> intp(0, 3, 1)
	.word 0x8cc42666  ! 1: ADDCcc_I	addccc 	%r16, 0x0666, %r6
	.word 0xac8c23a5  ! 1: ANDcc_I	andcc 	%r16, 0x03a5, %r22
	.word 0x9e840011  ! 1: ADDcc_R	addcc 	%r16, %r17, %r15
thr3_hw_intr_535:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_535), 16, 16)) -> intp(2, 0, 1)
	.word 0x8c44294b  ! 1: ADDC_I	addc 	%r16, 0x094b, %r6
thr3_hw_intr_536:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_536), 16, 16)) -> intp(2, 0, 1)
	.word 0xab641811  ! 1: MOVcc_R	<illegal instruction>
	.word 0xae2c2e1c  ! 1: ANDN_I	andn 	%r16, 0x0e1c, %r23
thr3_nuke_intr_537:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_537), 16, 16)) -> intp(1, 2, 1)
	.word 0x929c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r9
	.word 0x9c140011  ! 1: OR_R	or 	%r16, %r17, %r14
	.word 0x8d3c1011  ! 1: SRAX_R	srax	%r16, %r17, %r6
thr3_resum_intr_538:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_538), 16, 16)) -> intp(1, 3, 1)
	.word 0x86c40011  ! 1: ADDCcc_R	addccc 	%r16, %r17, %r3
	.word 0xac8c0011  ! 1: ANDcc_R	andcc 	%r16, %r17, %r22
	.word 0x88842821  ! 1: ADDcc_I	addcc 	%r16, 0x0821, %r4
thr3_hw_intr_539:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_539), 16, 16)) -> intp(2, 0, 1)
	.word 0x960c2efe  ! 1: AND_I	and 	%r16, 0x0efe, %r11
thr3_nuke_intr_540:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_540), 16, 16)) -> intp(1, 2, 1)
	.word 0x9414284f  ! 1: OR_I	or 	%r16, 0x084f, %r10
	.word 0x89643801  ! 1: MOVcc_I	<illegal instruction>
	.word 0x8c142218  ! 1: OR_I	or 	%r16, 0x0218, %r6
thr3_resum_intr_541:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_541), 16, 16)) -> intp(1, 3, 1)
	.word 0x9414276b  ! 1: OR_I	or 	%r16, 0x076b, %r10
	.word 0x98940011  ! 1: ORcc_R	orcc 	%r16, %r17, %r12
	.word 0x9a1c0011  ! 1: XOR_R	xor 	%r16, %r17, %r13
thr3_nuke_intr_542:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_542), 16, 16)) -> intp(2, 2, 1)
	.word 0x9c9c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r14
	.word 0xb0942ced  ! 1: ORcc_I	orcc 	%r16, 0x0ced, %r24
	.word 0xb72c2001  ! 1: SLL_I	sll 	%r16, 0x0001, %r27
thr3_resum_intr_543:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_543), 16, 16)) -> intp(2, 3, 1)
	.word 0xaac42971  ! 1: ADDCcc_I	addccc 	%r16, 0x0971, %r21
	.word 0xba3c0011  ! 1: XNOR_R	xnor 	%r16, %r17, %r29
	.word 0x982c0011  ! 1: ANDN_R	andn 	%r16, %r17, %r12
thr3_hw_intr_544:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_544), 16, 16)) -> intp(2, 0, 1)
	.word 0x8ab42df4  ! 1: ORNcc_I	orncc 	%r16, 0x0df4, %r5
	.word 0xac9c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r22
	.word 0x90140011  ! 1: OR_R	or 	%r16, %r17, %r8
	.word 0x92c420ba  ! 1: ADDCcc_I	addccc 	%r16, 0x00ba, %r9
thr3_nuke_intr_545:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_545), 16, 16)) -> intp(0, 2, 1)
	.word 0x82bc231f  ! 1: XNORcc_I	xnorcc 	%r16, 0x031f, %r1
	.word 0x86b40011  ! 1: ORNcc_R	orncc 	%r16, %r17, %r3
	.word 0x96140011  ! 1: OR_R	or 	%r16, %r17, %r11
	.word 0xab2c3001  ! 1: SLLX_I	sllx	%r16, 0x0001, %r21
thr3_resum_intr_546:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_546), 16, 16)) -> intp(0, 3, 1)
	.word 0x877c2401  ! 1: MOVR_I	movre	%r16, 0x1, %r3
	.word 0xa9641811  ! 1: MOVcc_R	<illegal instruction>
	.word 0x87641811  ! 1: MOVcc_R	<illegal instruction>
	.word 0x9e2c0011  ! 1: ANDN_R	andn 	%r16, %r17, %r15
thr3_nuke_intr_547:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_547), 16, 16)) -> intp(1, 2, 1)
	.word 0x932c3001  ! 1: SLLX_I	sllx	%r16, 0x0001, %r9
	.word 0x8e0c0011  ! 1: AND_R	and 	%r16, %r17, %r7
	.word 0x92c40011  ! 1: ADDCcc_R	addccc 	%r16, %r17, %r9
thr3_resum_intr_548:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_548), 16, 16)) -> intp(1, 3, 1)
	.word 0x922c0011  ! 1: ANDN_R	andn 	%r16, %r17, %r9
	.word 0x84c4269a  ! 1: ADDCcc_I	addccc 	%r16, 0x069a, %r2
	.word 0xb09424ea  ! 1: ORcc_I	orcc 	%r16, 0x04ea, %r24
thr3_nuke_intr_549:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_549), 16, 16)) -> intp(1, 2, 1)
	.word 0xa88427a8  ! 1: ADDcc_I	addcc 	%r16, 0x07a8, %r20
	.word 0x86840011  ! 1: ADDcc_R	addcc 	%r16, %r17, %r3
	.word 0x952c0011  ! 1: SLL_R	sll 	%r16, %r17, %r10
thr3_resum_intr_550:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_550), 16, 16)) -> intp(1, 3, 1)
	.word 0x912c1011  ! 1: SLLX_R	sllx	%r16, %r17, %r8
	.word 0x84140011  ! 1: OR_R	or 	%r16, %r17, %r2
	.word 0x8d2c0011  ! 1: SLL_R	sll 	%r16, %r17, %r6
thr3_hw_intr_551:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_551), 16, 16)) -> intp(1, 0, 1)
	.word 0x881c0011  ! 1: XOR_R	xor 	%r16, %r17, %r4
	.word 0x8f342001  ! 1: SRL_I	srl 	%r16, 0x0001, %r7
	.word 0xb73c2001  ! 1: SRA_I	sra 	%r16, 0x0001, %r27
	.word 0xa61425c6  ! 1: OR_I	or 	%r16, 0x05c6, %r19
thr3_nuke_intr_552:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_552), 16, 16)) -> intp(1, 2, 1)
	.word 0xb02c0011  ! 1: ANDN_R	andn 	%r16, %r17, %r24
thr3_resum_intr_553:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_553), 16, 16)) -> intp(1, 3, 1)
	.word 0x8abc0011  ! 1: XNORcc_R	xnorcc 	%r16, %r17, %r5
thr3_hw_intr_554:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_554), 16, 16)) -> intp(2, 0, 1)
	.word 0x94bc0011  ! 1: XNORcc_R	xnorcc 	%r16, %r17, %r10
	.word 0xa6ac0011  ! 1: ANDNcc_R	andncc 	%r16, %r17, %r19
	.word 0xa69424c7  ! 1: ORcc_I	orcc 	%r16, 0x04c7, %r19
	.word 0x8aac0011  ! 1: ANDNcc_R	andncc 	%r16, %r17, %r5
thr3_hw_intr_555:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_555), 16, 16)) -> intp(1, 0, 1)
	.word 0x9c0c0011  ! 1: AND_R	and 	%r16, %r17, %r14
thr3_hw_intr_556:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_556), 16, 16)) -> intp(2, 0, 1)
	.word 0x96ac0011  ! 1: ANDNcc_R	andncc 	%r16, %r17, %r11
thr3_hw_intr_557:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_557), 16, 16)) -> intp(2, 0, 1)
	.word 0xb49c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r26
	.word 0x902c0011  ! 1: ANDN_R	andn 	%r16, %r17, %r8
	.word 0x8c1c2deb  ! 1: XOR_I	xor 	%r16, 0x0deb, %r6
	.word 0x94ac0011  ! 1: ANDNcc_R	andncc 	%r16, %r17, %r10
thr3_hw_intr_558:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_558), 16, 16)) -> intp(0, 0, 1)
	.word 0x9844219e  ! 1: ADDC_I	addc 	%r16, 0x019e, %r12
	.word 0xb8b42776  ! 1: ORNcc_I	orncc 	%r16, 0x0776, %r28
	.word 0x832c2001  ! 1: SLL_I	sll 	%r16, 0x0001, %r1
thr3_hw_intr_559:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_559), 16, 16)) -> intp(0, 0, 1)
	.word 0x96340011  ! 1: ORN_R	orn 	%r16, %r17, %r11
thr3_nuke_intr_560:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_560), 16, 16)) -> intp(2, 2, 1)
	.word 0x86440011  ! 1: ADDC_R	addc 	%r16, %r17, %r3
	.word 0xaa0c2683  ! 1: AND_I	and 	%r16, 0x0683, %r21
	.word 0x940c0011  ! 1: AND_R	and 	%r16, %r17, %r10
	.word 0x9c3c2fef  ! 1: XNOR_I	xnor 	%r16, 0x0fef, %r14
thr3_resum_intr_561:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_561), 16, 16)) -> intp(2, 3, 1)
	.word 0x841c0011  ! 1: XOR_R	xor 	%r16, %r17, %r2
	.word 0x9a140011  ! 1: OR_R	or 	%r16, %r17, %r13
	.word 0xb00c0011  ! 1: AND_R	and 	%r16, %r17, %r24
	.word 0x82140011  ! 1: OR_R	or 	%r16, %r17, %r1
thr3_hw_intr_562:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_562), 16, 16)) -> intp(1, 0, 1)
	.word 0xb0b42548  ! 1: ORNcc_I	orncc 	%r16, 0x0548, %r24
	.word 0xb3341011  ! 1: SRLX_R	srlx	%r16, %r17, %r25
	.word 0x83341011  ! 1: SRLX_R	srlx	%r16, %r17, %r1
thr3_nuke_intr_563:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_563), 16, 16)) -> intp(1, 2, 1)
	.word 0xb5341011  ! 1: SRLX_R	srlx	%r16, %r17, %r26
	.word 0x82ac0011  ! 1: ANDNcc_R	andncc 	%r16, %r17, %r1
	.word 0x9cbc28bc  ! 1: XNORcc_I	xnorcc 	%r16, 0x08bc, %r14
thr3_resum_intr_564:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_564), 16, 16)) -> intp(1, 3, 1)
	.word 0xb41c2bba  ! 1: XOR_I	xor 	%r16, 0x0bba, %r26
	.word 0x8a8c2c58  ! 1: ANDcc_I	andcc 	%r16, 0x0c58, %r5
	.word 0x8a8c0011  ! 1: ANDcc_R	andcc 	%r16, %r17, %r5
thr3_nuke_intr_565:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_565), 16, 16)) -> intp(1, 2, 1)
	.word 0x9e0429da  ! 1: ADD_I	add 	%r16, 0x09da, %r15
	.word 0x8f2c0011  ! 1: SLL_R	sll 	%r16, %r17, %r7
thr3_resum_intr_566:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_566), 16, 16)) -> intp(1, 3, 1)
	.word 0x9d643801  ! 1: MOVcc_I	<illegal instruction>
	.word 0xb2c4218a  ! 1: ADDCcc_I	addccc 	%r16, 0x018a, %r25
thr3_hw_intr_567:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_567), 16, 16)) -> intp(0, 0, 1)
	.word 0x8244212d  ! 1: ADDC_I	addc 	%r16, 0x012d, %r1
	.word 0x988c28bc  ! 1: ANDcc_I	andcc 	%r16, 0x08bc, %r12
thr3_hw_intr_568:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_568), 16, 16)) -> intp(2, 0, 1)
	.word 0x9e440011  ! 1: ADDC_R	addc 	%r16, %r17, %r15
thr3_nuke_intr_569:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_569), 16, 16)) -> intp(0, 2, 1)
	.word 0x98042e7a  ! 1: ADD_I	add 	%r16, 0x0e7a, %r12
thr3_resum_intr_570:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_570), 16, 16)) -> intp(0, 3, 1)
	.word 0xb1340011  ! 1: SRL_R	srl 	%r16, %r17, %r24
thr3_hw_intr_571:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_571), 16, 16)) -> intp(1, 0, 1)
	.word 0xb9643801  ! 1: MOVcc_I	<illegal instruction>
	.word 0xad2c3001  ! 1: SLLX_I	sllx	%r16, 0x0001, %r22
	.word 0x88ac0011  ! 1: ANDNcc_R	andncc 	%r16, %r17, %r4
thr3_nuke_intr_572:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_572), 16, 16)) -> intp(2, 2, 1)
	.word 0x8a940011  ! 1: ORcc_R	orcc 	%r16, %r17, %r5
thr3_resum_intr_573:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_573), 16, 16)) -> intp(2, 3, 1)
	.word 0x881c2aae  ! 1: XOR_I	xor 	%r16, 0x0aae, %r4
thr3_nuke_intr_574:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_574), 16, 16)) -> intp(0, 2, 1)
	.word 0xb6840011  ! 1: ADDcc_R	addcc 	%r16, %r17, %r27
	.word 0x94ac2ffa  ! 1: ANDNcc_I	andncc 	%r16, 0x0ffa, %r10
thr3_resum_intr_575:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_575), 16, 16)) -> intp(0, 3, 1)
	.word 0x8f643801  ! 1: MOVcc_I	<illegal instruction>
	.word 0x9c840011  ! 1: ADDcc_R	addcc 	%r16, %r17, %r14
thr3_hw_intr_576:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_576), 16, 16)) -> intp(1, 0, 1)
	.word 0x90bc0011  ! 1: XNORcc_R	xnorcc 	%r16, %r17, %r8
	.word 0x948c2fdf  ! 1: ANDcc_I	andcc 	%r16, 0x0fdf, %r10
	.word 0x993c2001  ! 1: SRA_I	sra 	%r16, 0x0001, %r12
	.word 0x9f2c2001  ! 1: SLL_I	sll 	%r16, 0x0001, %r15
thr3_nuke_intr_577:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_577), 16, 16)) -> intp(2, 2, 1)
	.word 0xb4940011  ! 1: ORcc_R	orcc 	%r16, %r17, %r26
thr3_resum_intr_578:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_578), 16, 16)) -> intp(2, 3, 1)
	.word 0xac9c2dc6  ! 1: XORcc_I	xorcc 	%r16, 0x0dc6, %r22
thr3_hw_intr_579:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_579), 16, 16)) -> intp(2, 0, 1)
	.word 0x9aac0011  ! 1: ANDNcc_R	andncc 	%r16, %r17, %r13
thr3_hw_intr_580:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_580), 16, 16)) -> intp(1, 0, 1)
	.word 0xa8b42b9c  ! 1: ORNcc_I	orncc 	%r16, 0x0b9c, %r20
	.word 0xae3c0011  ! 1: XNOR_R	xnor 	%r16, %r17, %r23
thr3_nuke_intr_581:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_581), 16, 16)) -> intp(2, 2, 1)
	.word 0x91340011  ! 1: SRL_R	srl 	%r16, %r17, %r8
	.word 0x9e8425ea  ! 1: ADDcc_I	addcc 	%r16, 0x05ea, %r15
	.word 0xb03c0011  ! 1: XNOR_R	xnor 	%r16, %r17, %r24
	.word 0x9c140011  ! 1: OR_R	or 	%r16, %r17, %r14
thr3_resum_intr_582:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_582), 16, 16)) -> intp(2, 3, 1)
	.word 0x932c1011  ! 1: SLLX_R	sllx	%r16, %r17, %r9
	.word 0xa6840011  ! 1: ADDcc_R	addcc 	%r16, %r17, %r19
	.word 0x969c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r11
	.word 0x953c0011  ! 1: SRA_R	sra 	%r16, %r17, %r10
thr3_hw_intr_583:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_583), 16, 16)) -> intp(2, 0, 1)
	.word 0x9f3c2001  ! 1: SRA_I	sra 	%r16, 0x0001, %r15
	.word 0x8ac40011  ! 1: ADDCcc_R	addccc 	%r16, %r17, %r5
	.word 0xa6040011  ! 1: ADD_R	add 	%r16, %r17, %r19
thr3_hw_intr_584:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_584), 16, 16)) -> intp(1, 0, 1)
	.word 0xa88c2f59  ! 1: ANDcc_I	andcc 	%r16, 0x0f59, %r20
	.word 0xac140011  ! 1: OR_R	or 	%r16, %r17, %r22
	.word 0x8aac0011  ! 1: ANDNcc_R	andncc 	%r16, %r17, %r5
	.word 0x837c0411  ! 1: MOVR_R	movre	%r16, %r17, %r1
thr3_nuke_intr_585:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_585), 16, 16)) -> intp(0, 2, 1)
	.word 0xb4342716  ! 1: ORN_I	orn 	%r16, 0x0716, %r26
	.word 0x82940011  ! 1: ORcc_R	orcc 	%r16, %r17, %r1
thr3_resum_intr_586:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_586), 16, 16)) -> intp(0, 3, 1)
	.word 0x98bc0011  ! 1: XNORcc_R	xnorcc 	%r16, %r17, %r12
	.word 0x87341011  ! 1: SRLX_R	srlx	%r16, %r17, %r3
thr3_hw_intr_587:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_587), 16, 16)) -> intp(1, 0, 1)
	.word 0x9c0c0011  ! 1: AND_R	and 	%r16, %r17, %r14
thr3_hw_intr_588:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_588), 16, 16)) -> intp(1, 0, 1)
	.word 0x852c2001  ! 1: SLL_I	sll 	%r16, 0x0001, %r2
	.word 0x872c1011  ! 1: SLLX_R	sllx	%r16, %r17, %r3
	.word 0x8abc2b59  ! 1: XNORcc_I	xnorcc 	%r16, 0x0b59, %r5
	.word 0x90c40011  ! 1: ADDCcc_R	addccc 	%r16, %r17, %r8
thr3_hw_intr_589:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_589), 16, 16)) -> intp(0, 0, 1)
	.word 0x87641811  ! 1: MOVcc_R	<illegal instruction>
	.word 0x912c0011  ! 1: SLL_R	sll 	%r16, %r17, %r8
	.word 0x893c2001  ! 1: SRA_I	sra 	%r16, 0x0001, %r4
	.word 0x8f641811  ! 1: MOVcc_R	<illegal instruction>
thr3_nuke_intr_590:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_590), 16, 16)) -> intp(1, 2, 1)
	.word 0x86142616  ! 1: OR_I	or 	%r16, 0x0616, %r3
	.word 0xb53c2001  ! 1: SRA_I	sra 	%r16, 0x0001, %r26
	.word 0x9c340011  ! 1: ORN_R	orn 	%r16, %r17, %r14
thr3_resum_intr_591:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_591), 16, 16)) -> intp(1, 3, 1)
	.word 0x963c21b6  ! 1: XNOR_I	xnor 	%r16, 0x01b6, %r11
	.word 0x9c940011  ! 1: ORcc_R	orcc 	%r16, %r17, %r14
	.word 0x8b340011  ! 1: SRL_R	srl 	%r16, %r17, %r5
thr3_nuke_intr_592:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_592), 16, 16)) -> intp(1, 2, 1)
	.word 0x95343001  ! 1: SRLX_I	srlx	%r16, 0x0001, %r10
	.word 0x92340011  ! 1: ORN_R	orn 	%r16, %r17, %r9
thr3_resum_intr_593:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_593), 16, 16)) -> intp(1, 3, 1)
	.word 0x9c8c0011  ! 1: ANDcc_R	andcc 	%r16, %r17, %r14
	.word 0xba9c23cd  ! 1: XORcc_I	xorcc 	%r16, 0x03cd, %r29
thr3_nuke_intr_594:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_594), 16, 16)) -> intp(2, 2, 1)
	.word 0xb0c40011  ! 1: ADDCcc_R	addccc 	%r16, %r17, %r24
	.word 0x8e8c25ab  ! 1: ANDcc_I	andcc 	%r16, 0x05ab, %r7
thr3_resum_intr_595:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_595), 16, 16)) -> intp(2, 3, 1)
	.word 0x82440011  ! 1: ADDC_R	addc 	%r16, %r17, %r1
	.word 0x9e940011  ! 1: ORcc_R	orcc 	%r16, %r17, %r15
thr3_nuke_intr_596:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_596), 16, 16)) -> intp(0, 2, 1)
	.word 0x86ac218c  ! 1: ANDNcc_I	andncc 	%r16, 0x018c, %r3
	.word 0xaf343001  ! 1: SRLX_I	srlx	%r16, 0x0001, %r23
	.word 0x992c1011  ! 1: SLLX_R	sllx	%r16, %r17, %r12
	.word 0x92140011  ! 1: OR_R	or 	%r16, %r17, %r9
thr3_resum_intr_597:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_597), 16, 16)) -> intp(0, 3, 1)
	.word 0x9d641811  ! 1: MOVcc_R	<illegal instruction>
	.word 0x952c0011  ! 1: SLL_R	sll 	%r16, %r17, %r10
	.word 0x9c040011  ! 1: ADD_R	add 	%r16, %r17, %r14
	.word 0x9a9c2858  ! 1: XORcc_I	xorcc 	%r16, 0x0858, %r13
thr3_hw_intr_598:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_598), 16, 16)) -> intp(1, 0, 1)
	.word 0xb37c2401  ! 1: MOVR_I	movre	%r16, 0x1, %r25
	.word 0xac9c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r22
thr3_nuke_intr_599:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_599), 16, 16)) -> intp(0, 2, 1)
	.word 0x9aac223d  ! 1: ANDNcc_I	andncc 	%r16, 0x023d, %r13
	.word 0xae0c0011  ! 1: AND_R	and 	%r16, %r17, %r23
	.word 0x96940011  ! 1: ORcc_R	orcc 	%r16, %r17, %r11
thr3_resum_intr_600:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_600), 16, 16)) -> intp(0, 3, 1)
	.word 0x921c0011  ! 1: XOR_R	xor 	%r16, %r17, %r9
	.word 0xb2140011  ! 1: OR_R	or 	%r16, %r17, %r25
	.word 0x8c840011  ! 1: ADDcc_R	addcc 	%r16, %r17, %r6
thr3_nuke_intr_601:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_601), 16, 16)) -> intp(1, 2, 1)
	.word 0x842c0011  ! 1: ANDN_R	andn 	%r16, %r17, %r2
	.word 0xba44248e  ! 1: ADDC_I	addc 	%r16, 0x048e, %r29
	.word 0x9e9c2278  ! 1: XORcc_I	xorcc 	%r16, 0x0278, %r15
thr3_resum_intr_602:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_602), 16, 16)) -> intp(1, 3, 1)
	.word 0x88040011  ! 1: ADD_R	add 	%r16, %r17, %r4
	.word 0x99343001  ! 1: SRLX_I	srlx	%r16, 0x0001, %r12
	.word 0x8d2c3001  ! 1: SLLX_I	sllx	%r16, 0x0001, %r6
thr3_nuke_intr_603:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_603), 16, 16)) -> intp(1, 2, 1)
	.word 0xae0c2f1e  ! 1: AND_I	and 	%r16, 0x0f1e, %r23
	.word 0x9d342001  ! 1: SRL_I	srl 	%r16, 0x0001, %r14
	.word 0xa7341011  ! 1: SRLX_R	srlx	%r16, %r17, %r19
thr3_resum_intr_604:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_604), 16, 16)) -> intp(1, 3, 1)
	.word 0xa6c429b2  ! 1: ADDCcc_I	addccc 	%r16, 0x09b2, %r19
	.word 0x8ac422e3  ! 1: ADDCcc_I	addccc 	%r16, 0x02e3, %r5
	.word 0x98ac2236  ! 1: ANDNcc_I	andncc 	%r16, 0x0236, %r12
thr3_nuke_intr_605:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_605), 16, 16)) -> intp(1, 2, 1)
	.word 0xa8ac0011  ! 1: ANDNcc_R	andncc 	%r16, %r17, %r20
thr3_resum_intr_606:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_606), 16, 16)) -> intp(1, 3, 1)
	.word 0x8a0c0011  ! 1: AND_R	and 	%r16, %r17, %r5
thr3_nuke_intr_607:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_607), 16, 16)) -> intp(2, 2, 1)
	.word 0xa80c20b6  ! 1: AND_I	and 	%r16, 0x00b6, %r20
	.word 0x992c1011  ! 1: SLLX_R	sllx	%r16, %r17, %r12
	.word 0x90ac24c5  ! 1: ANDNcc_I	andncc 	%r16, 0x04c5, %r8
thr3_resum_intr_608:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_608), 16, 16)) -> intp(2, 3, 1)
	.word 0x88bc2f74  ! 1: XNORcc_I	xnorcc 	%r16, 0x0f74, %r4
	.word 0x873c1011  ! 1: SRAX_R	srax	%r16, %r17, %r3
	.word 0xa7643801  ! 1: MOVcc_I	<illegal instruction>
thr3_hw_intr_609:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_609), 16, 16)) -> intp(1, 0, 1)
	.word 0x893c1011  ! 1: SRAX_R	srax	%r16, %r17, %r4
thr3_nuke_intr_610:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_610), 16, 16)) -> intp(1, 2, 1)
	.word 0xb4940011  ! 1: ORcc_R	orcc 	%r16, %r17, %r26
thr3_resum_intr_611:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_611), 16, 16)) -> intp(1, 3, 1)
	.word 0x8e8c299c  ! 1: ANDcc_I	andcc 	%r16, 0x099c, %r7
thr3_hw_intr_612:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_612), 16, 16)) -> intp(0, 0, 1)
	.word 0x969c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r11
	.word 0x9b2c0011  ! 1: SLL_R	sll 	%r16, %r17, %r13
	.word 0x8e0c0011  ! 1: AND_R	and 	%r16, %r17, %r7
	.word 0xb09428cc  ! 1: ORcc_I	orcc 	%r16, 0x08cc, %r24
thr3_nuke_intr_613:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_613), 16, 16)) -> intp(2, 2, 1)
	.word 0x8c1c2d05  ! 1: XOR_I	xor 	%r16, 0x0d05, %r6
	.word 0x97342001  ! 1: SRL_I	srl 	%r16, 0x0001, %r11
thr3_resum_intr_614:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_614), 16, 16)) -> intp(2, 3, 1)
	.word 0x82940011  ! 1: ORcc_R	orcc 	%r16, %r17, %r1
	.word 0xa63c0011  ! 1: XNOR_R	xnor 	%r16, %r17, %r19
thr3_hw_intr_615:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_615), 16, 16)) -> intp(0, 0, 1)
	.word 0xb9641811  ! 1: MOVcc_R	<illegal instruction>
	.word 0x9a9c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r13
	.word 0xae340011  ! 1: ORN_R	orn 	%r16, %r17, %r23
	.word 0xb4940011  ! 1: ORcc_R	orcc 	%r16, %r17, %r26
thr3_hw_intr_616:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_616), 16, 16)) -> intp(1, 0, 1)
	.word 0x912c3001  ! 1: SLLX_I	sllx	%r16, 0x0001, %r8
	.word 0x8e1c2cf8  ! 1: XOR_I	xor 	%r16, 0x0cf8, %r7
	.word 0x8834251e  ! 1: ORN_I	orn 	%r16, 0x051e, %r4
thr3_hw_intr_617:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_617), 16, 16)) -> intp(2, 0, 1)
	.word 0x98b423e2  ! 1: ORNcc_I	orncc 	%r16, 0x03e2, %r12
thr3_hw_intr_618:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_618), 16, 16)) -> intp(1, 0, 1)
	.word 0x908c2a33  ! 1: ANDcc_I	andcc 	%r16, 0x0a33, %r8
	.word 0xa6040011  ! 1: ADD_R	add 	%r16, %r17, %r19
	.word 0x8a9c2802  ! 1: XORcc_I	xorcc 	%r16, 0x0802, %r5
	.word 0xaa0c0011  ! 1: AND_R	and 	%r16, %r17, %r21
thr3_nuke_intr_619:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_619), 16, 16)) -> intp(1, 2, 1)
	.word 0x8204265e  ! 1: ADD_I	add 	%r16, 0x065e, %r1
thr3_resum_intr_620:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_620), 16, 16)) -> intp(1, 3, 1)
	.word 0x96042936  ! 1: ADD_I	add 	%r16, 0x0936, %r11
thr3_nuke_intr_621:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_621), 16, 16)) -> intp(0, 2, 1)
	.word 0xb72c0011  ! 1: SLL_R	sll 	%r16, %r17, %r27
	.word 0x8abc0011  ! 1: XNORcc_R	xnorcc 	%r16, %r17, %r5
	.word 0x900c211f  ! 1: AND_I	and 	%r16, 0x011f, %r8
thr3_resum_intr_622:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_622), 16, 16)) -> intp(0, 3, 1)
	.word 0x981c0011  ! 1: XOR_R	xor 	%r16, %r17, %r12
	.word 0x88340011  ! 1: ORN_R	orn 	%r16, %r17, %r4
	.word 0xb12c2001  ! 1: SLL_I	sll 	%r16, 0x0001, %r24
thr3_hw_intr_623:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_623), 16, 16)) -> intp(0, 0, 1)
	.word 0x9c840011  ! 1: ADDcc_R	addcc 	%r16, %r17, %r14
	.word 0x852c1011  ! 1: SLLX_R	sllx	%r16, %r17, %r2
thr3_hw_intr_624:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_624), 16, 16)) -> intp(2, 0, 1)
	.word 0x9cbc0011  ! 1: XNORcc_R	xnorcc 	%r16, %r17, %r14
	.word 0x9e840011  ! 1: ADDcc_R	addcc 	%r16, %r17, %r15
	.word 0x852c2001  ! 1: SLL_I	sll 	%r16, 0x0001, %r2
thr3_hw_intr_625:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_625), 16, 16)) -> intp(2, 0, 1)
	.word 0x88ac0011  ! 1: ANDNcc_R	andncc 	%r16, %r17, %r4
	.word 0x960c28aa  ! 1: AND_I	and 	%r16, 0x08aa, %r11
	.word 0xb6340011  ! 1: ORN_R	orn 	%r16, %r17, %r27
thr3_hw_intr_626:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_626), 16, 16)) -> intp(2, 0, 1)
	.word 0x95341011  ! 1: SRLX_R	srlx	%r16, %r17, %r10
	.word 0xb81c25a3  ! 1: XOR_I	xor 	%r16, 0x05a3, %r28
	.word 0xa88c2d71  ! 1: ANDcc_I	andcc 	%r16, 0x0d71, %r20
thr3_hw_intr_627:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_627), 16, 16)) -> intp(0, 0, 1)
	.word 0xa88c0011  ! 1: ANDcc_R	andcc 	%r16, %r17, %r20
thr3_nuke_intr_628:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_628), 16, 16)) -> intp(1, 2, 1)
	.word 0x9eac0011  ! 1: ANDNcc_R	andncc 	%r16, %r17, %r15
	.word 0x94ac22d8  ! 1: ANDNcc_I	andncc 	%r16, 0x02d8, %r10
	.word 0x8a8c0011  ! 1: ANDcc_R	andcc 	%r16, %r17, %r5
thr3_resum_intr_629:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_629), 16, 16)) -> intp(1, 3, 1)
	.word 0xad7c2401  ! 1: MOVR_I	movre	%r16, 0x1, %r22
	.word 0xac940011  ! 1: ORcc_R	orcc 	%r16, %r17, %r22
	.word 0xbb2c1011  ! 1: SLLX_R	sllx	%r16, %r17, %r29
thr3_hw_intr_630:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_630), 16, 16)) -> intp(0, 0, 1)
	.word 0xad340011  ! 1: SRL_R	srl 	%r16, %r17, %r22
	.word 0x949c2e25  ! 1: XORcc_I	xorcc 	%r16, 0x0e25, %r10
	.word 0x963c2bbe  ! 1: XNOR_I	xnor 	%r16, 0x0bbe, %r11
	.word 0x820c2af0  ! 1: AND_I	and 	%r16, 0x0af0, %r1
thr3_hw_intr_631:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_631), 16, 16)) -> intp(0, 0, 1)
	.word 0xb33c0011  ! 1: SRA_R	sra 	%r16, %r17, %r25
	.word 0xb83c0011  ! 1: XNOR_R	xnor 	%r16, %r17, %r28
	.word 0x9a940011  ! 1: ORcc_R	orcc 	%r16, %r17, %r13
thr3_hw_intr_632:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_632), 16, 16)) -> intp(1, 0, 1)
	.word 0xb13c0011  ! 1: SRA_R	sra 	%r16, %r17, %r24
	.word 0xa894289c  ! 1: ORcc_I	orcc 	%r16, 0x089c, %r20
thr3_nuke_intr_633:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_633), 16, 16)) -> intp(1, 2, 1)
	.word 0x9644288a  ! 1: ADDC_I	addc 	%r16, 0x088a, %r11
	.word 0x8e942645  ! 1: ORcc_I	orcc 	%r16, 0x0645, %r7
	.word 0xb0bc0011  ! 1: XNORcc_R	xnorcc 	%r16, %r17, %r24
	.word 0x908c0011  ! 1: ANDcc_R	andcc 	%r16, %r17, %r8
thr3_resum_intr_634:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_634), 16, 16)) -> intp(1, 3, 1)
	.word 0x848c0011  ! 1: ANDcc_R	andcc 	%r16, %r17, %r2
	.word 0x8b2c1011  ! 1: SLLX_R	sllx	%r16, %r17, %r5
	.word 0xb3342001  ! 1: SRL_I	srl 	%r16, 0x0001, %r25
	.word 0x8e8c0011  ! 1: ANDcc_R	andcc 	%r16, %r17, %r7
thr3_hw_intr_635:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_635), 16, 16)) -> intp(2, 0, 1)
	.word 0xbb2c0011  ! 1: SLL_R	sll 	%r16, %r17, %r29
	.word 0x972c0011  ! 1: SLL_R	sll 	%r16, %r17, %r11
	.word 0xb80c0011  ! 1: AND_R	and 	%r16, %r17, %r28
thr3_hw_intr_636:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_636), 16, 16)) -> intp(1, 0, 1)
	.word 0xa6340011  ! 1: ORN_R	orn 	%r16, %r17, %r19
thr3_nuke_intr_637:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_637), 16, 16)) -> intp(0, 2, 1)
	.word 0x8f340011  ! 1: SRL_R	srl 	%r16, %r17, %r7
	.word 0x8f2c2001  ! 1: SLL_I	sll 	%r16, 0x0001, %r7
	.word 0xb6440011  ! 1: ADDC_R	addc 	%r16, %r17, %r27
thr3_resum_intr_638:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_638), 16, 16)) -> intp(0, 3, 1)
	.word 0x8234286c  ! 1: ORN_I	orn 	%r16, 0x086c, %r1
	.word 0xa8c423a7  ! 1: ADDCcc_I	addccc 	%r16, 0x03a7, %r20
	.word 0x8abc24e8  ! 1: XNORcc_I	xnorcc 	%r16, 0x04e8, %r5
thr3_nuke_intr_639:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_639), 16, 16)) -> intp(0, 2, 1)
	.word 0x97341011  ! 1: SRLX_R	srlx	%r16, %r17, %r11
	.word 0xba1c27e9  ! 1: XOR_I	xor 	%r16, 0x07e9, %r29
thr3_resum_intr_640:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_640), 16, 16)) -> intp(0, 3, 1)
	.word 0xb7341011  ! 1: SRLX_R	srlx	%r16, %r17, %r27
	.word 0xb52c3001  ! 1: SLLX_I	sllx	%r16, 0x0001, %r26
thr3_nuke_intr_641:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_641), 16, 16)) -> intp(0, 2, 1)
	.word 0x8e8c0011  ! 1: ANDcc_R	andcc 	%r16, %r17, %r7
	.word 0x9e840011  ! 1: ADDcc_R	addcc 	%r16, %r17, %r15
thr3_resum_intr_642:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_642), 16, 16)) -> intp(0, 3, 1)
	.word 0x9b641811  ! 1: MOVcc_R	<illegal instruction>
	.word 0xa82c2191  ! 1: ANDN_I	andn 	%r16, 0x0191, %r20
thr3_nuke_intr_643:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_643), 16, 16)) -> intp(1, 2, 1)
	.word 0x9f7c2401  ! 1: MOVR_I	movre	%r16, 0x1, %r15
	.word 0xbabc2951  ! 1: XNORcc_I	xnorcc 	%r16, 0x0951, %r29
thr3_resum_intr_644:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_644), 16, 16)) -> intp(1, 3, 1)
	.word 0xb0ac0011  ! 1: ANDNcc_R	andncc 	%r16, %r17, %r24
	.word 0x86142a3c  ! 1: OR_I	or 	%r16, 0x0a3c, %r3
thr3_hw_intr_645:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_645), 16, 16)) -> intp(0, 0, 1)
	.word 0x98c40011  ! 1: ADDCcc_R	addccc 	%r16, %r17, %r12
	.word 0xb73c2001  ! 1: SRA_I	sra 	%r16, 0x0001, %r27
thr3_nuke_intr_646:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_646), 16, 16)) -> intp(0, 2, 1)
	.word 0x9e1427a0  ! 1: OR_I	or 	%r16, 0x07a0, %r15
	.word 0x960c262a  ! 1: AND_I	and 	%r16, 0x062a, %r11
	.word 0xba2c264d  ! 1: ANDN_I	andn 	%r16, 0x064d, %r29
	.word 0xae9c2235  ! 1: XORcc_I	xorcc 	%r16, 0x0235, %r23
thr3_resum_intr_647:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_647), 16, 16)) -> intp(0, 3, 1)
	.word 0x98042366  ! 1: ADD_I	add 	%r16, 0x0366, %r12
	.word 0x912c0011  ! 1: SLL_R	sll 	%r16, %r17, %r8
	.word 0xb72c2001  ! 1: SLL_I	sll 	%r16, 0x0001, %r27
	.word 0xa9343001  ! 1: SRLX_I	srlx	%r16, 0x0001, %r20
thr3_nuke_intr_648:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_648), 16, 16)) -> intp(1, 2, 1)
	.word 0x9d2c0011  ! 1: SLL_R	sll 	%r16, %r17, %r14
thr3_resum_intr_649:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_649), 16, 16)) -> intp(1, 3, 1)
	.word 0xae8c2516  ! 1: ANDcc_I	andcc 	%r16, 0x0516, %r23
thr3_nuke_intr_650:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_650), 16, 16)) -> intp(0, 2, 1)
	.word 0xb13c0011  ! 1: SRA_R	sra 	%r16, %r17, %r24
thr3_resum_intr_651:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_651), 16, 16)) -> intp(0, 3, 1)
	.word 0xbb2c2001  ! 1: SLL_I	sll 	%r16, 0x0001, %r29
thr3_nuke_intr_652:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_652), 16, 16)) -> intp(1, 2, 1)
	.word 0xb6bc0011  ! 1: XNORcc_R	xnorcc 	%r16, %r17, %r27
thr3_resum_intr_653:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_653), 16, 16)) -> intp(1, 3, 1)
	.word 0xab340011  ! 1: SRL_R	srl 	%r16, %r17, %r21
thr3_hw_intr_654:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_654), 16, 16)) -> intp(1, 0, 1)
	.word 0x840c0011  ! 1: AND_R	and 	%r16, %r17, %r2
	.word 0x9e3c0011  ! 1: XNOR_R	xnor 	%r16, %r17, %r15
	.word 0xae9425c9  ! 1: ORcc_I	orcc 	%r16, 0x05c9, %r23
thr3_hw_intr_655:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_655), 16, 16)) -> intp(2, 0, 1)
	.word 0x84040011  ! 1: ADD_R	add 	%r16, %r17, %r2
thr3_nuke_intr_656:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_656), 16, 16)) -> intp(0, 2, 1)
	.word 0x873c0011  ! 1: SRA_R	sra 	%r16, %r17, %r3
thr3_resum_intr_657:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_657), 16, 16)) -> intp(0, 3, 1)
	.word 0x9eb429c4  ! 1: ORNcc_I	orncc 	%r16, 0x09c4, %r15
thr3_nuke_intr_658:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_658), 16, 16)) -> intp(1, 2, 1)
	.word 0x9a442977  ! 1: ADDC_I	addc 	%r16, 0x0977, %r13
	.word 0xac3c2793  ! 1: XNOR_I	xnor 	%r16, 0x0793, %r22
	.word 0x872c3001  ! 1: SLLX_I	sllx	%r16, 0x0001, %r3
	.word 0x9e1c2c2f  ! 1: XOR_I	xor 	%r16, 0x0c2f, %r15
thr3_resum_intr_659:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_659), 16, 16)) -> intp(1, 3, 1)
	.word 0x952c2001  ! 1: SLL_I	sll 	%r16, 0x0001, %r10
	.word 0x8d3c1011  ! 1: SRAX_R	srax	%r16, %r17, %r6
	.word 0x8e8426df  ! 1: ADDcc_I	addcc 	%r16, 0x06df, %r7
	.word 0x9e8c0011  ! 1: ANDcc_R	andcc 	%r16, %r17, %r15
thr3_hw_intr_660:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_660), 16, 16)) -> intp(2, 0, 1)
	.word 0x933c0011  ! 1: SRA_R	sra 	%r16, %r17, %r9
	.word 0x968c0011  ! 1: ANDcc_R	andcc 	%r16, %r17, %r11
	.word 0x82840011  ! 1: ADDcc_R	addcc 	%r16, %r17, %r1
	.word 0x972c3001  ! 1: SLLX_I	sllx	%r16, 0x0001, %r11
thr3_hw_intr_661:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_661), 16, 16)) -> intp(1, 0, 1)
	.word 0x8a040011  ! 1: ADD_R	add 	%r16, %r17, %r5
	.word 0x953c0011  ! 1: SRA_R	sra 	%r16, %r17, %r10
	.word 0x997c0411  ! 1: MOVR_R	movre	%r16, %r17, %r12
	.word 0x973c0011  ! 1: SRA_R	sra 	%r16, %r17, %r11
thr3_hw_intr_662:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_662), 16, 16)) -> intp(2, 0, 1)
	.word 0x90b40011  ! 1: ORNcc_R	orncc 	%r16, %r17, %r8
	.word 0xb3342001  ! 1: SRL_I	srl 	%r16, 0x0001, %r25
	.word 0xae040011  ! 1: ADD_R	add 	%r16, %r17, %r23
	.word 0x880c2e5d  ! 1: AND_I	and 	%r16, 0x0e5d, %r4
thr3_hw_intr_663:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_663), 16, 16)) -> intp(0, 0, 1)
	.word 0x98bc20d7  ! 1: XNORcc_I	xnorcc 	%r16, 0x00d7, %r12
thr3_hw_intr_664:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_664), 16, 16)) -> intp(0, 0, 1)
	.word 0x872c1011  ! 1: SLLX_R	sllx	%r16, %r17, %r3
	.word 0x9e9c2376  ! 1: XORcc_I	xorcc 	%r16, 0x0376, %r15
thr3_nuke_intr_665:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_665), 16, 16)) -> intp(2, 2, 1)
	.word 0xba342836  ! 1: ORN_I	orn 	%r16, 0x0836, %r29
	.word 0x8e4423e5  ! 1: ADDC_I	addc 	%r16, 0x03e5, %r7
	.word 0x9cb40011  ! 1: ORNcc_R	orncc 	%r16, %r17, %r14
thr3_resum_intr_666:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_666), 16, 16)) -> intp(2, 3, 1)
	.word 0x90842727  ! 1: ADDcc_I	addcc 	%r16, 0x0727, %r8
	.word 0x913c2001  ! 1: SRA_I	sra 	%r16, 0x0001, %r8
	.word 0xb89c25ab  ! 1: XORcc_I	xorcc 	%r16, 0x05ab, %r28
thr3_hw_intr_667:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_667), 16, 16)) -> intp(2, 0, 1)
	.word 0x949c28ed  ! 1: XORcc_I	xorcc 	%r16, 0x08ed, %r10
thr3_nuke_intr_668:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_668), 16, 16)) -> intp(1, 2, 1)
	.word 0xb6442ff4  ! 1: ADDC_I	addc 	%r16, 0x0ff4, %r27
	.word 0x872c0011  ! 1: SLL_R	sll 	%r16, %r17, %r3
	.word 0x92942f8a  ! 1: ORcc_I	orcc 	%r16, 0x0f8a, %r9
thr3_resum_intr_669:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_669), 16, 16)) -> intp(1, 3, 1)
	.word 0x90440011  ! 1: ADDC_R	addc 	%r16, %r17, %r8
	.word 0xad3c1011  ! 1: SRAX_R	srax	%r16, %r17, %r22
	.word 0x8a0c2394  ! 1: AND_I	and 	%r16, 0x0394, %r5
thr3_hw_intr_670:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_670), 16, 16)) -> intp(2, 0, 1)
	.word 0x849c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r2
thr3_hw_intr_671:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_671), 16, 16)) -> intp(0, 0, 1)
	.word 0xb1341011  ! 1: SRLX_R	srlx	%r16, %r17, %r24
	.word 0x9f341011  ! 1: SRLX_R	srlx	%r16, %r17, %r15
	.word 0xaa34230a  ! 1: ORN_I	orn 	%r16, 0x030a, %r21
thr3_hw_intr_672:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_672), 16, 16)) -> intp(2, 0, 1)
	.word 0xb23422ba  ! 1: ORN_I	orn 	%r16, 0x02ba, %r25
	.word 0x82b40011  ! 1: ORNcc_R	orncc 	%r16, %r17, %r1
thr3_nuke_intr_673:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_673), 16, 16)) -> intp(1, 2, 1)
	.word 0x920c22f5  ! 1: AND_I	and 	%r16, 0x02f5, %r9
thr3_resum_intr_674:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_674), 16, 16)) -> intp(1, 3, 1)
	.word 0xaeac0011  ! 1: ANDNcc_R	andncc 	%r16, %r17, %r23
thr3_hw_intr_675:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_675), 16, 16)) -> intp(0, 0, 1)
	.word 0x82142f36  ! 1: OR_I	or 	%r16, 0x0f36, %r1
	.word 0x900c2f6e  ! 1: AND_I	and 	%r16, 0x0f6e, %r8
	.word 0x8e0420b2  ! 1: ADD_I	add 	%r16, 0x00b2, %r7
	.word 0x92942a24  ! 1: ORcc_I	orcc 	%r16, 0x0a24, %r9
thr3_nuke_intr_676:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_676), 16, 16)) -> intp(0, 2, 1)
	.word 0x8a8c0011  ! 1: ANDcc_R	andcc 	%r16, %r17, %r5
thr3_resum_intr_677:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_677), 16, 16)) -> intp(0, 3, 1)
	.word 0xad2c1011  ! 1: SLLX_R	sllx	%r16, %r17, %r22
thr3_nuke_intr_678:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_678), 16, 16)) -> intp(2, 2, 1)
	.word 0xbabc2c4e  ! 1: XNORcc_I	xnorcc 	%r16, 0x0c4e, %r29
thr3_resum_intr_679:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_679), 16, 16)) -> intp(2, 3, 1)
	.word 0xa83c2988  ! 1: XNOR_I	xnor 	%r16, 0x0988, %r20
thr3_hw_intr_680:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_680), 16, 16)) -> intp(2, 0, 1)
	.word 0x82ac29ce  ! 1: ANDNcc_I	andncc 	%r16, 0x09ce, %r1
	.word 0x8b3c2001  ! 1: SRA_I	sra 	%r16, 0x0001, %r5
	.word 0x8cac2178  ! 1: ANDNcc_I	andncc 	%r16, 0x0178, %r6
	.word 0x8d343001  ! 1: SRLX_I	srlx	%r16, 0x0001, %r6
thr3_nuke_intr_681:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_681), 16, 16)) -> intp(0, 2, 1)
	.word 0xae9c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r23
	.word 0x8c142d7a  ! 1: OR_I	or 	%r16, 0x0d7a, %r6
	.word 0x8e140011  ! 1: OR_R	or 	%r16, %r17, %r7
thr3_resum_intr_682:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_682), 16, 16)) -> intp(0, 3, 1)
	.word 0x893c0011  ! 1: SRA_R	sra 	%r16, %r17, %r4
	.word 0x9d7c2401  ! 1: MOVR_I	movre	%r16, 0x1, %r14
	.word 0xac2c2594  ! 1: ANDN_I	andn 	%r16, 0x0594, %r22
thr3_nuke_intr_683:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_683), 16, 16)) -> intp(2, 2, 1)
	.word 0x8eac0011  ! 1: ANDNcc_R	andncc 	%r16, %r17, %r7
thr3_resum_intr_684:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_684), 16, 16)) -> intp(2, 3, 1)
	.word 0x98040011  ! 1: ADD_R	add 	%r16, %r17, %r12
thr3_hw_intr_685:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_685), 16, 16)) -> intp(0, 0, 1)
	.word 0x9e9c2e25  ! 1: XORcc_I	xorcc 	%r16, 0x0e25, %r15
thr3_hw_intr_686:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_686), 16, 16)) -> intp(2, 0, 1)
	.word 0x828c242a  ! 1: ANDcc_I	andcc 	%r16, 0x042a, %r1
	.word 0x917c2401  ! 1: MOVR_I	movre	%r16, 0x1, %r8
thr3_hw_intr_687:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_687), 16, 16)) -> intp(2, 0, 1)
	.word 0xba142e4b  ! 1: OR_I	or 	%r16, 0x0e4b, %r29
	.word 0x980420b7  ! 1: ADD_I	add 	%r16, 0x00b7, %r12
	.word 0x952c2001  ! 1: SLL_I	sll 	%r16, 0x0001, %r10
thr3_hw_intr_688:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_688), 16, 16)) -> intp(2, 0, 1)
	.word 0xb7343001  ! 1: SRLX_I	srlx	%r16, 0x0001, %r27
thr3_hw_intr_689:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_689), 16, 16)) -> intp(1, 0, 1)
	.word 0xae0c0011  ! 1: AND_R	and 	%r16, %r17, %r23
thr3_hw_intr_690:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_690), 16, 16)) -> intp(2, 0, 1)
	.word 0xac0c2db8  ! 1: AND_I	and 	%r16, 0x0db8, %r22
	.word 0x843c0011  ! 1: XNOR_R	xnor 	%r16, %r17, %r2
thr3_hw_intr_691:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_691), 16, 16)) -> intp(0, 0, 1)
	.word 0x9c940011  ! 1: ORcc_R	orcc 	%r16, %r17, %r14
	.word 0xb6c40011  ! 1: ADDCcc_R	addccc 	%r16, %r17, %r27
	.word 0xac3c0011  ! 1: XNOR_R	xnor 	%r16, %r17, %r22
	.word 0x997c2401  ! 1: MOVR_I	movre	%r16, 0x1, %r12
thr3_hw_intr_692:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_692), 16, 16)) -> intp(1, 0, 1)
	.word 0x96142769  ! 1: OR_I	or 	%r16, 0x0769, %r11
	.word 0x85342001  ! 1: SRL_I	srl 	%r16, 0x0001, %r2
	.word 0x8b3c2001  ! 1: SRA_I	sra 	%r16, 0x0001, %r5
	.word 0xb37c0411  ! 1: MOVR_R	movre	%r16, %r17, %r25
thr3_nuke_intr_693:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_693), 16, 16)) -> intp(1, 2, 1)
	.word 0x883c0011  ! 1: XNOR_R	xnor 	%r16, %r17, %r4
	.word 0xb80c2b3f  ! 1: AND_I	and 	%r16, 0x0b3f, %r28
	.word 0x997c2401  ! 1: MOVR_I	movre	%r16, 0x1, %r12
thr3_resum_intr_694:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_694), 16, 16)) -> intp(1, 3, 1)
	.word 0xb9341011  ! 1: SRLX_R	srlx	%r16, %r17, %r28
	.word 0x98042965  ! 1: ADD_I	add 	%r16, 0x0965, %r12
	.word 0x9ec42964  ! 1: ADDCcc_I	addccc 	%r16, 0x0964, %r15
thr3_nuke_intr_695:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_695), 16, 16)) -> intp(0, 2, 1)
	.word 0x920c0011  ! 1: AND_R	and 	%r16, %r17, %r9
	.word 0x921c2731  ! 1: XOR_I	xor 	%r16, 0x0731, %r9
	.word 0x957c0411  ! 1: MOVR_R	movre	%r16, %r17, %r10
	.word 0x8f641811  ! 1: MOVcc_R	<illegal instruction>
thr3_resum_intr_696:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_696), 16, 16)) -> intp(0, 3, 1)
	.word 0xb68c0011  ! 1: ANDcc_R	andcc 	%r16, %r17, %r27
	.word 0x9c942505  ! 1: ORcc_I	orcc 	%r16, 0x0505, %r14
	.word 0x96b42a52  ! 1: ORNcc_I	orncc 	%r16, 0x0a52, %r11
	.word 0xb2b42185  ! 1: ORNcc_I	orncc 	%r16, 0x0185, %r25
thr3_nuke_intr_697:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_697), 16, 16)) -> intp(1, 2, 1)
	.word 0x877c0411  ! 1: MOVR_R	movre	%r16, %r17, %r3
	.word 0x932c2001  ! 1: SLL_I	sll 	%r16, 0x0001, %r9
thr3_resum_intr_698:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_698), 16, 16)) -> intp(1, 3, 1)
	.word 0x87341011  ! 1: SRLX_R	srlx	%r16, %r17, %r3
	.word 0x96c40011  ! 1: ADDCcc_R	addccc 	%r16, %r17, %r11
thr3_hw_intr_699:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_699), 16, 16)) -> intp(2, 0, 1)
	.word 0x8b643801  ! 1: MOVcc_I	<illegal instruction>
	.word 0x969c2a1a  ! 1: XORcc_I	xorcc 	%r16, 0x0a1a, %r11
	.word 0xae2c0011  ! 1: ANDN_R	andn 	%r16, %r17, %r23
thr3_nuke_intr_700:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_700), 16, 16)) -> intp(2, 2, 1)
	.word 0xaa942683  ! 1: ORcc_I	orcc 	%r16, 0x0683, %r21
	.word 0xa73c1011  ! 1: SRAX_R	srax	%r16, %r17, %r19
thr3_resum_intr_701:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_701), 16, 16)) -> intp(2, 3, 1)
	.word 0xb5340011  ! 1: SRL_R	srl 	%r16, %r17, %r26
	.word 0x92340011  ! 1: ORN_R	orn 	%r16, %r17, %r9
thr3_nuke_intr_702:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_702), 16, 16)) -> intp(1, 2, 1)
	.word 0xaa9c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r21
	.word 0x821c2477  ! 1: XOR_I	xor 	%r16, 0x0477, %r1
	.word 0x892c2001  ! 1: SLL_I	sll 	%r16, 0x0001, %r4
	.word 0x944428b2  ! 1: ADDC_I	addc 	%r16, 0x08b2, %r10
thr3_resum_intr_703:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_703), 16, 16)) -> intp(1, 3, 1)
	.word 0xb3643801  ! 1: MOVcc_I	<illegal instruction>
	.word 0xab2c3001  ! 1: SLLX_I	sllx	%r16, 0x0001, %r21
	.word 0xb83c0011  ! 1: XNOR_R	xnor 	%r16, %r17, %r28
	.word 0xb43c2434  ! 1: XNOR_I	xnor 	%r16, 0x0434, %r26
thr3_nuke_intr_704:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_704), 16, 16)) -> intp(1, 2, 1)
	.word 0xb28c2d89  ! 1: ANDcc_I	andcc 	%r16, 0x0d89, %r25
	.word 0x913c2001  ! 1: SRA_I	sra 	%r16, 0x0001, %r8
	.word 0xac942259  ! 1: ORcc_I	orcc 	%r16, 0x0259, %r22
thr3_resum_intr_705:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_705), 16, 16)) -> intp(1, 3, 1)
	.word 0x961c2a8b  ! 1: XOR_I	xor 	%r16, 0x0a8b, %r11
	.word 0x90340011  ! 1: ORN_R	orn 	%r16, %r17, %r8
	.word 0x82940011  ! 1: ORcc_R	orcc 	%r16, %r17, %r1
thr3_hw_intr_706:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_706), 16, 16)) -> intp(0, 0, 1)
	.word 0x91643801  ! 1: MOVcc_I	<illegal instruction>
	.word 0x95342001  ! 1: SRL_I	srl 	%r16, 0x0001, %r10
	.word 0x8a340011  ! 1: ORN_R	orn 	%r16, %r17, %r5
thr3_hw_intr_707:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_707), 16, 16)) -> intp(1, 0, 1)
	.word 0x88940011  ! 1: ORcc_R	orcc 	%r16, %r17, %r4
	.word 0xac3423f0  ! 1: ORN_I	orn 	%r16, 0x03f0, %r22
thr3_nuke_intr_708:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_708), 16, 16)) -> intp(1, 2, 1)
	.word 0x85341011  ! 1: SRLX_R	srlx	%r16, %r17, %r2
	.word 0x9b641811  ! 1: MOVcc_R	<illegal instruction>
	.word 0x9e442e5d  ! 1: ADDC_I	addc 	%r16, 0x0e5d, %r15
thr3_resum_intr_709:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_709), 16, 16)) -> intp(1, 3, 1)
	.word 0x94940011  ! 1: ORcc_R	orcc 	%r16, %r17, %r10
	.word 0x9a040011  ! 1: ADD_R	add 	%r16, %r17, %r13
	.word 0x853c0011  ! 1: SRA_R	sra 	%r16, %r17, %r2
thr3_hw_intr_710:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_710), 16, 16)) -> intp(2, 0, 1)
	.word 0x922c0011  ! 1: ANDN_R	andn 	%r16, %r17, %r9
	.word 0x8ab428fc  ! 1: ORNcc_I	orncc 	%r16, 0x08fc, %r5
thr3_nuke_intr_711:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_711), 16, 16)) -> intp(0, 2, 1)
	.word 0x963c0011  ! 1: XNOR_R	xnor 	%r16, %r17, %r11
thr3_resum_intr_712:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_712), 16, 16)) -> intp(0, 3, 1)
	.word 0xae2c2fe9  ! 1: ANDN_I	andn 	%r16, 0x0fe9, %r23
thr3_hw_intr_713:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_713), 16, 16)) -> intp(2, 0, 1)
	.word 0x820c2fad  ! 1: AND_I	and 	%r16, 0x0fad, %r1
	.word 0xb32c0011  ! 1: SLL_R	sll 	%r16, %r17, %r25
	.word 0xaf3c0011  ! 1: SRA_R	sra 	%r16, %r17, %r23
	.word 0xb60c0011  ! 1: AND_R	and 	%r16, %r17, %r27
thr3_nuke_intr_714:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_714), 16, 16)) -> intp(0, 2, 1)
	.word 0x9b3c0011  ! 1: SRA_R	sra 	%r16, %r17, %r13
	.word 0x98142140  ! 1: OR_I	or 	%r16, 0x0140, %r12
	.word 0x848c0011  ! 1: ANDcc_R	andcc 	%r16, %r17, %r2
thr3_resum_intr_715:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_715), 16, 16)) -> intp(0, 3, 1)
	.word 0x932c0011  ! 1: SLL_R	sll 	%r16, %r17, %r9
	.word 0xa7343001  ! 1: SRLX_I	srlx	%r16, 0x0001, %r19
	.word 0xa83c22c2  ! 1: XNOR_I	xnor 	%r16, 0x02c2, %r20
thr3_hw_intr_716:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_716), 16, 16)) -> intp(0, 0, 1)
	.word 0x8814288c  ! 1: OR_I	or 	%r16, 0x088c, %r4
	.word 0x9b3c1011  ! 1: SRAX_R	srax	%r16, %r17, %r13
thr3_hw_intr_717:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_717), 16, 16)) -> intp(2, 0, 1)
	.word 0x96142215  ! 1: OR_I	or 	%r16, 0x0215, %r11
thr3_nuke_intr_718:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_718), 16, 16)) -> intp(1, 2, 1)
	.word 0x9ebc2e4d  ! 1: XNORcc_I	xnorcc 	%r16, 0x0e4d, %r15
	.word 0x9b3c1011  ! 1: SRAX_R	srax	%r16, %r17, %r13
	.word 0x9e9c2f8a  ! 1: XORcc_I	xorcc 	%r16, 0x0f8a, %r15
thr3_resum_intr_719:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_719), 16, 16)) -> intp(1, 3, 1)
	.word 0x89641811  ! 1: MOVcc_R	<illegal instruction>
	.word 0x863c0011  ! 1: XNOR_R	xnor 	%r16, %r17, %r3
	.word 0x8d7c2401  ! 1: MOVR_I	movre	%r16, 0x1, %r6
thr3_nuke_intr_720:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_720), 16, 16)) -> intp(0, 2, 1)
	.word 0x92340011  ! 1: ORN_R	orn 	%r16, %r17, %r9
	.word 0x9ab40011  ! 1: ORNcc_R	orncc 	%r16, %r17, %r13
	.word 0x92bc2ae5  ! 1: XNORcc_I	xnorcc 	%r16, 0x0ae5, %r9
thr3_resum_intr_721:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_721), 16, 16)) -> intp(0, 3, 1)
	.word 0x993c0011  ! 1: SRA_R	sra 	%r16, %r17, %r12
	.word 0x8e9c2c90  ! 1: XORcc_I	xorcc 	%r16, 0x0c90, %r7
	.word 0x94842693  ! 1: ADDcc_I	addcc 	%r16, 0x0693, %r10
thr3_hw_intr_722:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_722), 16, 16)) -> intp(1, 0, 1)
	.word 0x9a340011  ! 1: ORN_R	orn 	%r16, %r17, %r13
	.word 0x91341011  ! 1: SRLX_R	srlx	%r16, %r17, %r8
	.word 0x9ac40011  ! 1: ADDCcc_R	addccc 	%r16, %r17, %r13
thr3_nuke_intr_723:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_723), 16, 16)) -> intp(2, 2, 1)
	.word 0x8ec42f50  ! 1: ADDCcc_I	addccc 	%r16, 0x0f50, %r7
	.word 0x849c29e7  ! 1: XORcc_I	xorcc 	%r16, 0x09e7, %r2
thr3_resum_intr_724:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_724), 16, 16)) -> intp(2, 3, 1)
	.word 0x860c0011  ! 1: AND_R	and 	%r16, %r17, %r3
	.word 0x932c3001  ! 1: SLLX_I	sllx	%r16, 0x0001, %r9
thr3_hw_intr_725:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_725), 16, 16)) -> intp(2, 0, 1)
	.word 0x880c0011  ! 1: AND_R	and 	%r16, %r17, %r4
thr3_nuke_intr_726:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_726), 16, 16)) -> intp(1, 2, 1)
	.word 0x8a942bb0  ! 1: ORcc_I	orcc 	%r16, 0x0bb0, %r5
thr3_resum_intr_727:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_727), 16, 16)) -> intp(1, 3, 1)
	.word 0xb83c2ad4  ! 1: XNOR_I	xnor 	%r16, 0x0ad4, %r28
thr3_nuke_intr_728:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_728), 16, 16)) -> intp(0, 2, 1)
	.word 0xb12c0011  ! 1: SLL_R	sll 	%r16, %r17, %r24
	.word 0x921c0011  ! 1: XOR_R	xor 	%r16, %r17, %r9
	.word 0xab341011  ! 1: SRLX_R	srlx	%r16, %r17, %r21
thr3_resum_intr_729:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_729), 16, 16)) -> intp(0, 3, 1)
	.word 0xa80c23be  ! 1: AND_I	and 	%r16, 0x03be, %r20
	.word 0x8c142255  ! 1: OR_I	or 	%r16, 0x0255, %r6
	.word 0x9e440011  ! 1: ADDC_R	addc 	%r16, %r17, %r15
thr3_nuke_intr_730:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_730), 16, 16)) -> intp(1, 2, 1)
	.word 0x95641811  ! 1: MOVcc_R	<illegal instruction>
	.word 0xb4bc23f7  ! 1: XNORcc_I	xnorcc 	%r16, 0x03f7, %r26
	.word 0x9f2c3001  ! 1: SLLX_I	sllx	%r16, 0x0001, %r15
thr3_resum_intr_731:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_731), 16, 16)) -> intp(1, 3, 1)
	.word 0x9f342001  ! 1: SRL_I	srl 	%r16, 0x0001, %r15
	.word 0x8b643801  ! 1: MOVcc_I	<illegal instruction>
	.word 0x873c1011  ! 1: SRAX_R	srax	%r16, %r17, %r3
thr3_nuke_intr_732:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_732), 16, 16)) -> intp(0, 2, 1)
	.word 0xa8ac27e2  ! 1: ANDNcc_I	andncc 	%r16, 0x07e2, %r20
thr3_resum_intr_733:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_733), 16, 16)) -> intp(0, 3, 1)
	.word 0x9e9c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r15
thr3_hw_intr_734:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_734), 16, 16)) -> intp(2, 0, 1)
	.word 0x86042b33  ! 1: ADD_I	add 	%r16, 0x0b33, %r3
	.word 0x928c252a  ! 1: ANDcc_I	andcc 	%r16, 0x052a, %r9
	.word 0x98ac0011  ! 1: ANDNcc_R	andncc 	%r16, %r17, %r12
	.word 0x94842986  ! 1: ADDcc_I	addcc 	%r16, 0x0986, %r10
thr3_nuke_intr_735:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_735), 16, 16)) -> intp(1, 2, 1)
	.word 0xa8140011  ! 1: OR_R	or 	%r16, %r17, %r20
thr3_resum_intr_736:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_736), 16, 16)) -> intp(1, 3, 1)
	.word 0x832c2001  ! 1: SLL_I	sll 	%r16, 0x0001, %r1
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
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
        setx  0x0000000000000360, %g1, %r17
        setx  0xbbbe7baf896a9b8a, %g1, %r0
        setx  0x88192a08bd59a647, %g1, %r1
        setx  0xd3c1dfa9861bb5a9, %g1, %r2
        setx  0x3e36ba9a3b3fbd8e, %g1, %r3
        setx  0xd2a4389416e6c2bf, %g1, %r4
        setx  0x9c7d9e09b10f4a8f, %g1, %r5
        setx  0x33681c3f73fdcaf0, %g1, %r6
        setx  0x4d026a2275a6c35d, %g1, %r7
        setx  0xf213eb6a9b0b0d4b, %g1, %r8
        setx  0x062e5e867f76b893, %g1, %r9
        setx  0x281f23f549c2283d, %g1, %r10
        setx  0x1711562d4a649bfe, %g1, %r11
        setx  0xb37153ca24316b82, %g1, %r12
        setx  0x396aa7e777de8426, %g1, %r13
        setx  0x558a4db90b787dc0, %g1, %r14
        setx  0x68960a9ada1b5b92, %g1, %r15
        setx  0x1ce56e2d91f950fd, %g1, %r18
        setx  0xe397208eae43b697, %g1, %r19
        setx  0x1b7d617d2587381f, %g1, %r20
        setx  0xba7fd2881c893a90, %g1, %r21
        setx  0x749c51ccc39c7bf5, %g1, %r22
        setx  0xbdd2166ce79b905b, %g1, %r23
        setx  0x85352001be03f5c4, %g1, %r24
        setx  0x4882cac4ab69fcc3, %g1, %r25
        setx  0x4a3a5fade9570471, %g1, %r26
        setx  0xf9adc3a553bc7994, %g1, %r27
        setx  0x751b43f80850f9df, %g1, %r28
        setx  0xae871ec983ccbe51, %g1, %r29
        setx  0x6d2ed9f77c4d7958, %g1, %r30
        setx  0x12b74df7d9210650, %g1, %r31
	save %r0, %r0, %r31
        setx  MAIN_BASE_DATA_VA, %r1, %r16
        setx  0x0000000000000840, %g1, %r17
        setx  0xa5aa79eb024e4ac8, %g1, %r0
        setx  0xe23acad478fd59be, %g1, %r1
        setx  0x1511e465a2df8f59, %g1, %r2
        setx  0x5610de437ef7cf2c, %g1, %r3
        setx  0xbe15e4618f1dcc6c, %g1, %r4
        setx  0x66928625b257c3a6, %g1, %r5
        setx  0x715fbba5697bba2f, %g1, %r6
        setx  0x47facce194d4bbcc, %g1, %r7
        setx  0x4da7fb26f759a642, %g1, %r8
        setx  0x133c67ee93ce9c7a, %g1, %r9
        setx  0x3da7669dc3be4da2, %g1, %r10
        setx  0xfc1b10168b302aee, %g1, %r11
        setx  0x3c3a1692c8648e6d, %g1, %r12
        setx  0x9d203c33653cb597, %g1, %r13
        setx  0x856bf7283d6516a7, %g1, %r14
        setx  0x620a7472faf9c9be, %g1, %r15
        setx  0xd301a093c6167121, %g1, %r18
        setx  0x5d94684605c66e12, %g1, %r19
        setx  0x51747624fdaaeab1, %g1, %r20
        setx  0xff36ccbef29b4872, %g1, %r21
        setx  0x686f3370a5ab08a5, %g1, %r22
        setx  0x23a732c9e0a51440, %g1, %r23
        setx  0x9324d72072c9138f, %g1, %r24
        setx  0x820ec3b88a88eab8, %g1, %r25
        setx  0xbfd8a52c99dbeb32, %g1, %r26
        setx  0x7c247bd15a56e158, %g1, %r27
        setx  0xe883bc8073839575, %g1, %r28
        setx  0x8e594bfa0ae27da3, %g1, %r29
        setx  0xcc288981252716bb, %g1, %r30
        setx  0x849770228b7d30cd, %g1, %r31
	save %r0, %r0, %r31
        setx  MAIN_BASE_DATA_VA, %r1, %r16
        setx  0x0000000000000900, %g1, %r17
        setx  0x3c3b0f565c503ffd, %g1, %r0
        setx  0xaffd8b1d0dc6a88a, %g1, %r1
        setx  0x8ecb68f968088a5b, %g1, %r2
        setx  0xb1f04976f0ef77ef, %g1, %r3
        setx  0x672ff7e1e0059e5a, %g1, %r4
        setx  0xc92055c5c2806431, %g1, %r5
        setx  0x814f530da69f460f, %g1, %r6
        setx  0x0b6b66b1e6eaa0f4, %g1, %r7
        setx  0x37a75e8f80b5086b, %g1, %r8
        setx  0x876ac100d58619d0, %g1, %r9
        setx  0x609a6de52d76e5f4, %g1, %r10
        setx  0x44837a90cabfcbf9, %g1, %r11
        setx  0x70c8ea9047bf7b88, %g1, %r12
        setx  0xa1644fceaa11700d, %g1, %r13
        setx  0xc6f7854254e31193, %g1, %r14
        setx  0xbcddf583c937234f, %g1, %r15
        setx  0x690e954f5cdfa011, %g1, %r18
        setx  0x2b9af557ec9382b2, %g1, %r19
        setx  0x59e428e5768d3d93, %g1, %r20
        setx  0x750352305c8ae86c, %g1, %r21
        setx  0x43e158d37f4bb2f7, %g1, %r22
        setx  0xb84a9d646b1351b4, %g1, %r23
        setx  0x5ec5308f55a5a55c, %g1, %r24
        setx  0x896ad95d85b3b1c3, %g1, %r25
        setx  0xee08f8a62aeac2f7, %g1, %r26
        setx  0x5b6101577f0cb9b7, %g1, %r27
        setx  0x9d333a5b5781f939, %g1, %r28
        setx  0xdee8cd5aa294d386, %g1, %r29
        setx  0xbb6e03f1dd582191, %g1, %r30
        setx  0x6f4159173b9eaff8, %g1, %r31
	save %r0, %r0, %r31
        setx  MAIN_BASE_DATA_VA, %r1, %r16
        setx  0x0000000000000fa0, %g1, %r17
        setx  0x0acc3eba487d9344, %g1, %r0
        setx  0x425e6177168d8675, %g1, %r1
        setx  0x2dd8abfd646d54a0, %g1, %r2
        setx  0x65b00bba65ed07cb, %g1, %r3
        setx  0x08489b544854cdf3, %g1, %r4
        setx  0xd412f9c38e69b2c3, %g1, %r5
        setx  0xe85a2ebe6f2a665f, %g1, %r6
        setx  0xc49d3faca1566379, %g1, %r7
        setx  0x3c545d2e31b2825e, %g1, %r8
        setx  0xc1163644c506bb7a, %g1, %r9
        setx  0x17a2639cfebaba03, %g1, %r10
        setx  0x0953eeff2456bdd9, %g1, %r11
        setx  0xb02809dd912cb77a, %g1, %r12
        setx  0x450bbff020b999b4, %g1, %r13
        setx  0x2f7f5139debb6377, %g1, %r14
        setx  0xdb08c26a933f1b97, %g1, %r15
        setx  0xa5fac9ee0b1f6415, %g1, %r18
        setx  0x824e236540357bee, %g1, %r19
        setx  0x86b36ad0d84c22f3, %g1, %r20
        setx  0xf2f86d9fbc0124ea, %g1, %r21
        setx  0xba788645ca763dc7, %g1, %r22
        setx  0xf6e4c649d4cf1f2f, %g1, %r23
        setx  0x5bf14a98c6f50bd8, %g1, %r24
        setx  0x83ae85e365ee49b8, %g1, %r25
        setx  0x44384b11ae7b1515, %g1, %r26
        setx  0x9f05ef24f95aa7c0, %g1, %r27
        setx  0x9e4f9cbd71f20cfe, %g1, %r28
        setx  0x9a25e323283e726f, %g1, %r29
        setx  0x8ee30a059e8380ed, %g1, %r30
        setx  0x91c1e6b7765327ea, %g1, %r31
	save %r0, %r0, %r31
        setx  MAIN_BASE_DATA_VA, %r1, %r16
        setx  0x0000000000000c70, %g1, %r17
        setx  0x709377af2e7daf13, %g1, %r0
        setx  0x4f2dfc06986b9f9c, %g1, %r1
        setx  0xa170526668c4f939, %g1, %r2
        setx  0xf0b8d25983ff7cfc, %g1, %r3
        setx  0xfc6d966d1d67e259, %g1, %r4
        setx  0xcc7eab5f5e91dbd5, %g1, %r5
        setx  0x77dbbc7fe0ededc2, %g1, %r6
        setx  0x8115ce2ea583674f, %g1, %r7
        setx  0x0c7614b723ff2816, %g1, %r8
        setx  0x211ac48743f50e84, %g1, %r9
        setx  0xe96449cc304ec0d9, %g1, %r10
        setx  0x42c44de6be8ce287, %g1, %r11
        setx  0x60c61e77134534ed, %g1, %r12
        setx  0xc3fd1ab21ab4e465, %g1, %r13
        setx  0xc87017f9971317bb, %g1, %r14
        setx  0xa82e9d6fea42501c, %g1, %r15
        setx  0x8c4c2f5192ab9ea1, %g1, %r18
        setx  0x14f20dd2a26c8cc5, %g1, %r19
        setx  0x3d4d751484bbb597, %g1, %r20
        setx  0xc5f211722aa70bb2, %g1, %r21
        setx  0xb6b290ffb9b27b14, %g1, %r22
        setx  0xb0a0bcc0e6576626, %g1, %r23
        setx  0x1d2460f3c037050b, %g1, %r24
        setx  0xb484b46a981bff6b, %g1, %r25
        setx  0x4935cb2fea580d97, %g1, %r26
        setx  0xc31cc380c8d3e67c, %g1, %r27
        setx  0xc0d1be914f582061, %g1, %r28
        setx  0xb52bd05d6855ab62, %g1, %r29
        setx  0x7520578c5ecca62b, %g1, %r30
        setx  0x21aa9fffd50f2d5a, %g1, %r31
	save %r0, %r0, %r31
        setx  MAIN_BASE_DATA_VA, %r1, %r16
        setx  0x0000000000000fd0, %g1, %r17
        setx  0xaf94e416d48d3ae6, %g1, %r0
        setx  0xf2d8d87a4a794595, %g1, %r1
        setx  0x5f52fd8c3830518f, %g1, %r2
        setx  0x0ee7aa2a26c5388a, %g1, %r3
        setx  0xc7389cee23ea5ee9, %g1, %r4
        setx  0xdd0c83e8e55ee26f, %g1, %r5
        setx  0x2d40151a63d8f863, %g1, %r6
        setx  0x6de21e4b149f3258, %g1, %r7
        setx  0x83750f44155946e7, %g1, %r8
        setx  0x5e4075f4daf88b52, %g1, %r9
        setx  0xc86c215245e86bfe, %g1, %r10
        setx  0xe2bd598960765fd8, %g1, %r11
        setx  0x6397e53cf45058fb, %g1, %r12
        setx  0x06afaf3631f09864, %g1, %r13
        setx  0x28d79040b7c5a5ea, %g1, %r14
        setx  0x6a1b3fbc2cd49386, %g1, %r15
        setx  0xb5e877bbedd71bd9, %g1, %r18
        setx  0xdd8683ba4d00112f, %g1, %r19
        setx  0xbf54dd52d0004340, %g1, %r20
        setx  0x943ad03342f593e4, %g1, %r21
        setx  0xa88b5570db649695, %g1, %r22
        setx  0xe163041f6539878a, %g1, %r23
        setx  0xef302457bb39aaed, %g1, %r24
        setx  0xe3b8faacc75e395d, %g1, %r25
        setx  0xd00006689098941b, %g1, %r26
        setx  0x4d5cd7330e891650, %g1, %r27
        setx  0xc3f567c4f5c297c1, %g1, %r28
        setx  0xa2bcc1101d9c49db, %g1, %r29
        setx  0x4aae7c2537af9771, %g1, %r30
        setx  0x625151f62a2d777e, %g1, %r31
	save %r0, %r0, %r31
        setx  MAIN_BASE_DATA_VA, %r1, %r16
        setx  0x0000000000000f80, %g1, %r17
        setx  0x337313c6b246c962, %g1, %r0
        setx  0x31278d18bc572f8a, %g1, %r1
        setx  0x931c7d3db46f76f8, %g1, %r2
        setx  0xfee4879f2e082458, %g1, %r3
        setx  0x9cf95994147ae71f, %g1, %r4
        setx  0xea2f7974415956b7, %g1, %r5
        setx  0x02403f2e90d34d05, %g1, %r6
        setx  0xf9e7f81dcad1bf6c, %g1, %r7
        setx  0xc630e7a1e7f79afe, %g1, %r8
        setx  0x4f8553209662e478, %g1, %r9
        setx  0xbf480ee050e65cf7, %g1, %r10
        setx  0x66720ffb6af99918, %g1, %r11
        setx  0xb6630dd7cddcf08f, %g1, %r12
        setx  0x733e44d2590bf5ee, %g1, %r13
        setx  0x28b5496d542ccee2, %g1, %r14
        setx  0x0455717dd61e9f7c, %g1, %r15
        setx  0x59bcea06550561f0, %g1, %r18
        setx  0x97c0c27f7c1e8aae, %g1, %r19
        setx  0x9601594951b75ff7, %g1, %r20
        setx  0xda53283f5e05e238, %g1, %r21
        setx  0x2bc6a5cc82437a52, %g1, %r22
        setx  0xe0d5a0d196e7bfda, %g1, %r23
        setx  0xa0b2230975d6272f, %g1, %r24
        setx  0x7f288c87269e386d, %g1, %r25
        setx  0x43ff5a1e67a4b3e8, %g1, %r26
        setx  0xec929fa724a61530, %g1, %r27
        setx  0xb1bcd25691c3f87f, %g1, %r28
        setx  0x03740e0cb75963e9, %g1, %r29
        setx  0x40c8f119a39d80e2, %g1, %r30
        setx  0xe13caef8ee545fd5, %g1, %r31
	save %r0, %r0, %r31
        setx  MAIN_BASE_DATA_VA, %r1, %r16
        setx  0x0000000000000cb0, %g1, %r17
        setx  0x97c1af82647ec782, %g1, %r0
        setx  0xfccf5ef94c1fd3a6, %g1, %r1
        setx  0x8fde54df44da5785, %g1, %r2
        setx  0xa748bfdf245bcf62, %g1, %r3
        setx  0x3b6f14f957156e59, %g1, %r4
        setx  0x8d5e4c8042a42aa6, %g1, %r5
        setx  0x30837050a19fec91, %g1, %r6
        setx  0xdb57f0c87bb59db5, %g1, %r7
        setx  0x8e37d23d1c5e9ce2, %g1, %r8
        setx  0x25d43adff9bec69a, %g1, %r9
        setx  0x903b1c181d1df440, %g1, %r10
        setx  0xf33fd9c2dece6310, %g1, %r11
        setx  0x2fb44987f7a9dad2, %g1, %r12
        setx  0x9da51b4bb0be1d72, %g1, %r13
        setx  0xd736a3c94c53215b, %g1, %r14
        setx  0xcb191ed35aa57a03, %g1, %r15
        setx  0xacb3d2664a601566, %g1, %r18
        setx  0xd091ba5c2ade9627, %g1, %r19
        setx  0x00dadd7db342d320, %g1, %r20
        setx  0x0fbc10a2fa00c105, %g1, %r21
        setx  0xac54662fc96b8468, %g1, %r22
        setx  0xe0491a577a3e60c2, %g1, %r23
        setx  0x055e90f66a954385, %g1, %r24
        setx  0x44284f1a1197a698, %g1, %r25
        setx  0x15c558a0fa32099c, %g1, %r26
        setx  0x9f4b92af2fc8c987, %g1, %r27
        setx  0x170273cf3b96672e, %g1, %r28
        setx  0xf82714b703578638, %g1, %r29
        setx  0x878586aca8f4d40f, %g1, %r30
        setx  0xd4387da6ec161219, %g1, %r31
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
	.word 0xc2242edf  ! 3: STW_I	stw	%r1, [%r16 + 0x0edf]
	.word 0x82440011  ! 5: ADDC_R	addc 	%r16, %r17, %r1
	.word 0xb88c21d7  ! 5: ANDcc_I	andcc 	%r16, 0x01d7, %r28
	.word 0xfb3c2e4a  ! 5: STDF_I	std	%f29, [0x0e4a, %r16]
thr2_irf_ce_0:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_0), 16, 16),1,IRF,ce,21,x, x,x,x, x,x,x)
	.word 0xf2242311  ! 9: STW_I	stw	%r25, [%r16 + 0x0311]
	.word 0x84840011  ! 11: ADDcc_R	addcc 	%r16, %r17, %r2
	.word 0x848c0011  ! 11: ANDcc_R	andcc 	%r16, %r17, %r2
	ta	T_CHANGE_PRIV	! macro
thr2_irf_ce_1:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_1), 16, 16),1,IRF,ce,36,x, x,x,x, x,x,x)
	.word 0xc674251d  ! 15: STX_I	stx	%r3, [%r16 + 0x051d]
	.word 0x961c0011  ! 17: XOR_R	xor 	%r16, %r17, %r11
	.word 0x868423b9  ! 17: ADDcc_I	addcc 	%r16, 0x03b9, %r3
	.word 0xaf7c0411  ! 17: MOVR_R	movre	%r16, %r17, %r23
	rd      %asr26, %r31
	set     0x01f05, %r30
	and     %r31, %r30, %r31
	.word 0xd8242067  ! 20: STW_I	stw	%r12, [%r16 + 0x0067]
	.word 0xaaf42925  ! 22: UDIVcc_I	udivcc 	%r16, 0x0925, %r21
!Illinst store
	.word 0xde241db1  ! 23: STW_R	stw	%r15, [%r16 + %r17]
	.word 0x912c3001  ! 25: SLLX_I	sllx	%r16, 0x0001, %r8
	.word 0x94140011  ! 25: OR_R	or 	%r16, %r17, %r10
thr2_resum_intr_737:
!$EV trig_pc_d(2,expr(@VA(.MAIN.thr2_resum_intr_737), 16, 16)) -> intp(2, 3, 1)
	wr      %r0, 0x4, %asr26
	.word 0xc4242021  ! 28: STW_I	stw	%r2, [%r16 + 0x0021]
	.word 0xd8fc1011  ! 30: SWAPA_R	swapa	%r12, [%r16 + %r17] 0x80
!Illinst alu
	.word 0x88841571  ! 31: ADDcc_R	addcc 	%r16, %r17, %r4
	.word 0x90b40011  ! 33: ORNcc_R	orncc 	%r16, %r17, %r8
thr2_resum_intr_738:
!$EV trig_pc_d(2,expr(@VA(.MAIN.thr2_resum_intr_738), 16, 16)) -> intp(2, 3, 1)
	wr      %r0, 0x4, %asr26
thr2_irf_ce_2:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_2), 16, 16),1,IRF,ce,63,x, x,x,x, x,x,x)
	.word 0xe8342007  ! 37: STH_I	sth	%r20, [%r16 + 0x0007]
	.word 0xa6b40011  ! 39: ORNcc_R	orncc 	%r16, %r17, %r19
	.word 0xccac1011  ! 39: STBA_R	stba	%r6, [%r16 + %r17] 0x80
	.word 0xdc742b05  ! 42: STX_I	stx	%r14, [%r16 + 0x0b05]
	.word 0x843c25b5  ! 44: XNOR_I	xnor 	%r16, 0x05b5, %r2
	.word 0x9c040011  ! 44: ADD_R	add 	%r16, %r17, %r14
	.word 0xc4ec2a20  ! 44: LDSTUBA_I	ldstuba	%r2, [%r16 + 0x0a20] %asi
	.word 0x882c0011  ! 46: ANDN_R	andn 	%r16, %r17, %r4
	.word 0x82bc0011  ! 46: XNORcc_R	xnorcc 	%r16, %r17, %r1
	.word 0xa60c0011  ! 46: AND_R	and 	%r16, %r17, %r19
	.word 0x8a04215f  ! 46: ADD_I	add 	%r16, 0x015f, %r5
	.word 0x8a1c0011  ! 46: XOR_R	xor 	%r16, %r17, %r5
	rd      %pc, %r18
	set     0x20, %r17
thr2_irf_ce_3:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_3), 16, 16),1,IRF,ce,22,x, x,x,x, x,x,x)
	.word 0xcc742f3d  ! 48: STX_I	stx	%r6, [%r16 + 0x0f3d]
	.word 0x99343001  ! 50: SRLX_I	srlx	%r16, 0x0001, %r12
	.word 0x90340011  ! 50: ORN_R	orn 	%r16, %r17, %r8
	.word 0x972c3001  ! 50: SLLX_I	sllx	%r16, 0x0001, %r11
	jmpl     %r18 + %r17, %r31
thr2_irf_ce_4:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_4), 16, 16),1,IRF,ce,26,x, x,x,x, x,x,x)
	.word 0xf63421ff  ! 53: STH_I	sth	%r27, [%r16 + 0x01ff]
	.word 0x81880000  ! 55: SAVED	saved
thr2_irf_ce_5:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_5), 16, 16),1,IRF,ce,70,x, x,x,x, x,x,x)
	.word 0xf67420bf  ! 59: STX_I	stx	%r27, [%r16 + 0x00bf]
	.word 0x937c0411  ! 61: MOVR_R	movre	%r16, %r17, %r9
	.word 0x862c0011  ! 61: ANDN_R	andn 	%r16, %r17, %r3
	.word 0xa7ec0011  ! 61: RESTORE_R	restore	%r16, %r17, %r19
thr2_irf_ce_6:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_6), 16, 16),1,IRF,ce,29,x, x,x,x, x,x,x)
	.word 0xc2242b03  ! 65: STW_I	stw	%r1, [%r16 + 0x0b03]
	.word 0x9f802394  ! 67: SIR	sir	0x0394
!Illinst alu
	.word 0x90441771  ! 68: ADDC_R	addc 	%r16, %r17, %r8
	.word 0x9cc40011  ! 70: ADDCcc_R	addccc 	%r16, %r17, %r14
	.word 0xa6142ced  ! 70: OR_I	or 	%r16, 0x0ced, %r19
	.word 0xd5841011  ! 70: LDFA_R	lda	[%r16, %r17], %f10
!Illinst store
	.word 0xda341731  ! 71: STH_R	sth	%r13, [%r16 + %r17]
	.word 0x973c2001  ! 73: SRA_I	sra 	%r16, 0x0001, %r11
	.word 0xc9242f52  ! 73: STF_I	st	%f4, [0x0f52, %r16]
	.word 0x989c0011  ! 75: XORcc_R	xorcc 	%r16, %r17, %r12
	.word 0x8a3c2733  ! 75: XNOR_I	xnor 	%r16, 0x0733, %r5
	.word 0x9a2c0011  ! 75: ANDN_R	andn 	%r16, %r17, %r13
	.word 0x84bc223e  ! 75: XNORcc_I	xnorcc 	%r16, 0x023e, %r2
	.word 0xa88c22b5  ! 75: ANDcc_I	andcc 	%r16, 0x02b5, %r20
	.word 0x960c0011  ! 75: AND_R	and 	%r16, %r17, %r11
	rd      %pc, %r18
	set     0x20, %r17
	.word 0xd834275d  ! 76: STH_I	sth	%r12, [%r16 + 0x075d]
	.word 0x877c2401  ! 78: MOVR_I	movre	%r16, 0x1, %r3
	.word 0x8abc0011  ! 78: XNORcc_R	xnorcc 	%r16, %r17, %r5
	return     %r18 + %r17
	.word 0xee242b43  ! 80: STW_I	stw	%r23, [%r16 + 0x0b43]
	.word 0xf2f42498  ! 82: STXA_I	stxa	%r25, [%r16 + 0x0498] %asi
thr2_irf_ce_7:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_7), 16, 16),1,IRF,ce,17,x, x,x,x, x,x,x)
	.word 0xf634205d  ! 86: STH_I	sth	%r27, [%r16 + 0x005d]
	.word 0x8e1c2a7b  ! 88: XOR_I	xor 	%r16, 0x0a7b, %r7
	.word 0x8143e03e  ! 88: MEMBAR	membar	#StoreLoad | #LoadStore | #StoreStore | #Lookaside | #MemIssue 
thr2_irf_ce_8:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_8), 16, 16),1,IRF,ce,24,x, x,x,x, x,x,x)
	.word 0xc4242567  ! 92: STW_I	stw	%r2, [%r16 + 0x0567]
	.word 0x821c0011  ! 94: XOR_R	xor 	%r16, %r17, %r1
	.word 0x8ed421be  ! 94: UMULcc_I	umulcc 	%r16, 0x01be, %r7
	.word 0xe8242461  ! 97: STW_I	stw	%r20, [%r16 + 0x0461]
	.word 0x9c1c0011  ! 99: XOR_R	xor 	%r16, %r17, %r14
	.word 0x949c282f  ! 99: XORcc_I	xorcc 	%r16, 0x082f, %r10
	.word 0x85ec0011  ! 99: RESTORE_R	restore	%r16, %r17, %r2
!Illinst store
	.word 0xc2241f31  ! 100: STW_R	stw	%r1, [%r16 + %r17]
	.word 0x8c040011  ! 102: ADD_R	add 	%r16, %r17, %r6
	.word 0x8e040011  ! 102: ADD_R	add 	%r16, %r17, %r7
	.word 0x8d2c0011  ! 102: SLL_R	sll 	%r16, %r17, %r6
	.word 0xc3ec1011  ! 102: PREFETCHA_R	prefetcha	[%r16, %r17] 0x80, #one_read
	.word 0xdc7421f7  ! 105: STX_I	stx	%r14, [%r16 + 0x01f7]
	.word 0x9e940011  ! 107: ORcc_R	orcc 	%r16, %r17, %r15
	.word 0x8a8c2274  ! 107: ANDcc_I	andcc 	%r16, 0x0274, %r5
	.word 0xbac422c0  ! 107: ADDCcc_I	addccc 	%r16, 0x02c0, %r29
        wr %g0, 0x4, %fprs
!Illinst store
	.word 0xc27415b1  ! 108: STX_R	stx	%r1, [%r16 + %r17]
	.word 0x9a840011  ! 110: ADDcc_R	addcc 	%r16, %r17, %r13
	.word 0xb4340011  ! 110: ORN_R	orn 	%r16, %r17, %r26
	.word 0x9e842517  ! 110: ADDcc_I	addcc 	%r16, 0x0517, %r15
        wr  %g0, 0x80, %asi
!Illinst store
	.word 0xf6741f31  ! 111: STX_R	stx	%r27, [%r16 + %r17]
	.word 0x94bc0011  ! 113: XNORcc_R	xnorcc 	%r16, %r17, %r10
	.word 0xaeb4207e  ! 113: ORNcc_I	orncc 	%r16, 0x007e, %r23
	.word 0x9f802ddb  ! 113: SIR	sir	0x0ddb
!Illinst alu
	.word 0x95643f21  ! 114: MOVcc_I	<illegal instruction>
	.word 0xc2d4226d  ! 116: LDSHA_I	ldsha	[%r16, + 0x026d] %asi, %r1
	.word 0xb4842686  ! 118: ADDcc_I	addcc 	%r16, 0x0686, %r26
	.word 0x900c0011  ! 118: AND_R	and 	%r16, %r17, %r8
	.word 0xb92c0011  ! 118: SLL_R	sll 	%r16, %r17, %r28
	.word 0x9d341011  ! 118: SRLX_R	srlx	%r16, %r17, %r14
	.word 0x992c3001  ! 118: SLLX_I	sllx	%r16, 0x0001, %r12
	.word 0x900c2f7f  ! 118: AND_I	and 	%r16, 0x0f7f, %r8
	rd      %pc, %r18
	set     0x20, %r17
thr2_irf_ce_9:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_9), 16, 16),1,IRF,ce,7,x, x,x,x, x,x,x)
	.word 0xee74234b  ! 120: STX_I	stx	%r23, [%r16 + 0x034b]
	.word 0xb03c0011  ! 122: XNOR_R	xnor 	%r16, %r17, %r24
	.word 0x94840011  ! 122: ADDcc_R	addcc 	%r16, %r17, %r10
	.word 0x9d7c2401  ! 122: MOVR_I	movre	%r16, 0x1, %r14
	return     %r18 + %r17
thr2_irf_ce_10:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_10), 16, 16),1,IRF,ce,51,x, x,x,x, x,x,x)
	.word 0xc2342ee3  ! 125: STH_I	sth	%r1, [%r16 + 0x0ee3]
	.word 0x89342001  ! 127: SRL_I	srl 	%r16, 0x0001, %r4
	.word 0x913c1011  ! 127: SRAX_R	srax	%r16, %r17, %r8
	.word 0xdebc2796  ! 127: STDA_I	stda	%r15, [%r16 + 0x0796] %asi
	.word 0xb60c2e55  ! 129: AND_I	and 	%r16, 0x0e55, %r27
	.word 0x8b2c2001  ! 129: SLL_I	sll 	%r16, 0x0001, %r5
	.word 0x9d3c1011  ! 129: SRAX_R	srax	%r16, %r17, %r14
	.word 0x8f7c2401  ! 129: MOVR_I	movre	%r16, 0x1, %r7
	.word 0xb89c2c54  ! 129: XORcc_I	xorcc 	%r16, 0x0c54, %r28
	rd      %pc, %r18
	set     0x20, %r17
	.word 0xd034226d  ! 130: STH_I	sth	%r8, [%r16 + 0x026d]
	.word 0xa92c2001  ! 132: SLL_I	sll 	%r16, 0x0001, %r20
	return     %r18 + %r17
thr2_irf_ce_11:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_11), 16, 16),1,IRF,ce,47,x, x,x,x, x,x,x)
	.word 0xdc2422af  ! 135: STW_I	stw	%r14, [%r16 + 0x02af]
	.word 0x9cd40011  ! 137: UMULcc_R	umulcc 	%r16, %r17, %r14
	.word 0x82c428c5  ! 139: ADDCcc_I	addccc 	%r16, 0x08c5, %r1
	.word 0xb72c2001  ! 139: SLL_I	sll 	%r16, 0x0001, %r27
	.word 0xbb341011  ! 139: SRLX_R	srlx	%r16, %r17, %r29
	.word 0xac0c0011  ! 139: AND_R	and 	%r16, %r17, %r22
	rd      %pc, %r18
	set     0x20, %r17
	.word 0xca342089  ! 140: STH_I	sth	%r5, [%r16 + 0x0089]
	.word 0x8b7c0411  ! 142: MOVR_R	movre	%r16, %r17, %r5
	.word 0x96ac0011  ! 142: ANDNcc_R	andncc 	%r16, %r17, %r11
	.word 0x96142907  ! 142: OR_I	or 	%r16, 0x0907, %r11
	return     %r18 + %r17
	.word 0xea342bed  ! 144: STH_I	sth	%r21, [%r16 + 0x0bed]
	.word 0x86ac0011  ! 146: ANDNcc_R	andncc 	%r16, %r17, %r3
	.word 0x92840011  ! 146: ADDcc_R	addcc 	%r16, %r17, %r9
	rd      %asr26, %r31
	set     0x01f05, %r30
	and     %r31, %r30, %r31
!Illinst store
	.word 0xf4741db1  ! 147: STX_R	stx	%r26, [%r16 + %r17]
	.word 0xae2c0011  ! 149: ANDN_R	andn 	%r16, %r17, %r23
	.word 0x929c0011  ! 149: XORcc_R	xorcc 	%r16, %r17, %r9
	.word 0xb2940011  ! 149: ORcc_R	orcc 	%r16, %r17, %r25
	wr      %r0, 0x1, %asr26
	.word 0xc2342a1f  ! 152: STH_I	sth	%r1, [%r16 + 0x0a1f]
	.word 0x87341011  ! 154: SRLX_R	srlx	%r16, %r17, %r3
	.word 0x9b2c3001  ! 154: SLLX_I	sllx	%r16, 0x0001, %r13
	.word 0x1a800001  ! 154: BCC	bcc  	<label_0x1>
	.word 0x9f7c0411  ! 156: MOVR_R	movre	%r16, %r17, %r15
	.word 0x9a8c0011  ! 156: ANDcc_R	andcc 	%r16, %r17, %r13
	.word 0x98b40011  ! 156: ORNcc_R	orncc 	%r16, %r17, %r12
	.word 0x8a1c23f0  ! 156: XOR_I	xor 	%r16, 0x03f0, %r5
	.word 0x872c1011  ! 156: SLLX_R	sllx	%r16, %r17, %r3
	.word 0xb72c1011  ! 156: SLLX_R	sllx	%r16, %r17, %r27
	rd      %pc, %r18
	set     0x20, %r17
	.word 0xce342061  ! 157: STH_I	sth	%r7, [%r16 + 0x0061]
	.word 0x98bc2606  ! 159: XNORcc_I	xnorcc 	%r16, 0x0606, %r12
	jmpl     %r18 + %r17, %r31
!Illinst store
	.word 0xd4241db1  ! 159: STW_R	stw	%r10, [%r16 + %r17]
	.word 0x9f80284c  ! 161: SIR	sir	0x084c
!Illinst alu
	.word 0x880c3f65  ! 162: AND_I	and 	%r16, 0xffffff65, %r4
	.word 0x88b40011  ! 164: ORNcc_R	orncc 	%r16, %r17, %r4
thr2_resum_intr_739:
!$EV trig_pc_d(2,expr(@VA(.MAIN.thr2_resum_intr_739), 16, 16)) -> intp(2, 3, 1)
	wr      %r0, 0x4, %asr26
!Illinst store
	.word 0xd8341db1  ! 165: STH_R	sth	%r12, [%r16 + %r17]
	.word 0xb6bc0011  ! 167: XNORcc_R	xnorcc 	%r16, %r17, %r27
	.word 0xa73c2001  ! 167: SRA_I	sra 	%r16, 0x0001, %r19
	.word 0xf5e42011  ! 167: CASA_R	casa	[%r16] %asi, %r17, %r26
	.word 0xca7427cb  ! 170: STX_I	stx	%r5, [%r16 + 0x07cb]
	.word 0x90c40011  ! 172: ADDCcc_R	addccc 	%r16, %r17, %r8
	.word 0x8ebc0011  ! 172: XNORcc_R	xnorcc 	%r16, %r17, %r7
	.word 0x8143e04d  ! 172: MEMBAR	membar	#LoadLoad | #LoadStore | #StoreStore | #Sync 
!Illinst alu
	.word 0x837c1771  ! 173: MOVR_R	movrcs	%r16, %r17, %r1
	.word 0x86440011  ! 175: ADDC_R	addc 	%r16, %r17, %r3
	.word 0x8a2c0011  ! 175: ANDN_R	andn 	%r16, %r17, %r5
	.word 0x8e4c0011  ! 175: MULX_R	mulx 	%r16, %r17, %r7
	.word 0xce74259b  ! 178: STX_I	stx	%r7, [%r16 + 0x059b]
	.word 0x9d2c3001  ! 180: SLLX_I	sllx	%r16, 0x0001, %r14
	.word 0xbb3c1011  ! 180: SRAX_R	srax	%r16, %r17, %r29
	.word 0xbb7c0411  ! 180: MOVR_R	movre	%r16, %r17, %r29
	.word 0x2f800001  ! 180: FBU	fbu,a	<label_0x1>
!Illinst store
	.word 0xda241531  ! 181: STW_R	stw	%r13, [%r16 + %r17]
	.word 0x8d840011  ! 183: WRFPRS_R	wr	%r16, %r17, %fprs
thr2_irf_ce_12:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_12), 16, 16),1,IRF,ce,71,x, x,x,x, x,x,x)
	.word 0xe62424d3  ! 187: STW_I	stw	%r19, [%r16 + 0x04d3]
	.word 0xdd140011  ! 189: LDQF_R	-	[%r16, %r17], %f14
!Illinst store
	.word 0xce241531  ! 190: STW_R	stw	%r7, [%r16 + %r17]
	.word 0x92042175  ! 192: ADD_I	add 	%r16, 0x0175, %r9
	wr      %r0, 0x1, %asr26
thr2_irf_ce_13:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_13), 16, 16),1,IRF,ce,24,x, x,x,x, x,x,x)
	.word 0xda342b0d  ! 196: STH_I	sth	%r13, [%r16 + 0x0b0d]
	.word 0x903c249e  ! 198: XNOR_I	xnor 	%r16, 0x049e, %r8
thr2_resum_intr_740:
!$EV trig_pc_d(2,expr(@VA(.MAIN.thr2_resum_intr_740), 16, 16)) -> intp(2, 3, 1)
	wr      %r0, 0x4, %asr26
thr2_irf_ce_14:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_14), 16, 16),1,IRF,ce,41,x, x,x,x, x,x,x)
	.word 0xfa342a8b  ! 202: STH_I	sth	%r29, [%r16 + 0x0a8b]
	.word 0x8a840011  ! 204: ADDcc_R	addcc 	%r16, %r17, %r5
	.word 0x983c0011  ! 204: XNOR_R	xnor 	%r16, %r17, %r12
	.word 0x87341011  ! 204: SRLX_R	srlx	%r16, %r17, %r3
	ta	T_CHANGE_NONHPRIV	! macro
!Illinst store
	.word 0xd6741571  ! 205: STX_R	stx	%r11, [%r16 + %r17]
	.word 0xc3ec1011  ! 207: PREFETCHA_R	prefetcha	[%r16, %r17] 0x80, #one_read
!Illinst alu
	.word 0xa6ac17f1  ! 208: ANDNcc_R	andncc 	%r16, %r17, %r19
	.word 0x9f802ce1  ! 210: SIR	sir	0x0ce1
!Illinst alu
	.word 0xaaa43faa  ! 211: SUBcc_I	subcc 	%r16, 0xffffffaa, %r21
	.word 0x82040011  ! 213: ADD_R	add 	%r16, %r17, %r1
	.word 0xaf2c1011  ! 213: SLLX_R	sllx	%r16, %r17, %r23
	.word 0x85341011  ! 213: SRLX_R	srlx	%r16, %r17, %r2
	.word 0xc4ec1011  ! 213: LDSTUBA_R	ldstuba	%r2, [%r16 + %r17] 0x80
thr2_irf_ce_15:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_15), 16, 16),1,IRF,ce,7,x, x,x,x, x,x,x)
	.word 0xd2242763  ! 217: STW_I	stw	%r9, [%r16 + 0x0763]
	.word 0xb28c2a7a  ! 219: ANDcc_I	andcc 	%r16, 0x0a7a, %r25
	.word 0xb1643801  ! 219: MOVcc_I	<illegal instruction>
	.word 0xc40c0011  ! 219: LDUB_R	ldub	[%r16 + %r17], %r2
!Illinst alu
	.word 0x84241d31  ! 220: SUB_R	sub 	%r16, %r17, %r2
        wr %g0, 0x4, %fprs
thr2_irf_ce_16:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_16), 16, 16),1,IRF,ce,67,x, x,x,x, x,x,x)
	.word 0xcc742d07  ! 226: STX_I	stx	%r6, [%r16 + 0x0d07]
	.word 0xc67c0011  ! 228: SWAP_R	swap	%r3, [%r16 + %r17]
	.word 0x98ac0011  ! 230: ANDNcc_R	andncc 	%r16, %r17, %r12
	.word 0xb97c0411  ! 230: MOVR_R	movre	%r16, %r17, %r28
	.word 0x86842e82  ! 230: ADDcc_I	addcc 	%r16, 0x0e82, %r3
	.word 0xad340011  ! 230: SRL_R	srl 	%r16, %r17, %r22
	.word 0x8a2c0011  ! 230: ANDN_R	andn 	%r16, %r17, %r5
	.word 0x9a8423fa  ! 230: ADDcc_I	addcc 	%r16, 0x03fa, %r13
	rd      %pc, %r18
	set     0x20, %r17
	.word 0xe67422b7  ! 231: STX_I	stx	%r19, [%r16 + 0x02b7]
	.word 0xb2bc0011  ! 233: XNORcc_R	xnorcc 	%r16, %r17, %r25
	.word 0xa93c2001  ! 233: SRA_I	sra 	%r16, 0x0001, %r20
	.word 0x8d3c0011  ! 233: SRA_R	sra 	%r16, %r17, %r6
	return     %r18 + %r17
thr2_irf_ce_17:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_17), 16, 16),1,IRF,ce,23,x, x,x,x, x,x,x)
	.word 0xcc242d87  ! 236: STW_I	stw	%r6, [%r16 + 0x0d87]
	.word 0x9e8c2098  ! 238: ANDcc_I	andcc 	%r16, 0x0098, %r15
	.word 0x893c2001  ! 238: SRA_I	sra 	%r16, 0x0001, %r4
	.word 0x9d7c2401  ! 238: MOVR_I	movre	%r16, 0x1, %r14
	.word 0xec0c29d9  ! 238: LDUB_I	ldub	[%r16 + 0x09d9], %r22
	.word 0x84040011  ! 240: ADD_R	add 	%r16, %r17, %r2
	.word 0xaa940011  ! 240: ORcc_R	orcc 	%r16, %r17, %r21
	.word 0x9d341011  ! 240: SRLX_R	srlx	%r16, %r17, %r14
	.word 0x9a440011  ! 240: ADDC_R	addc 	%r16, %r17, %r13
	.word 0x9eac2a35  ! 240: ANDNcc_I	andncc 	%r16, 0x0a35, %r15
	rd      %pc, %r18
	set     0x20, %r17
thr2_irf_ce_18:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_18), 16, 16),1,IRF,ce,60,x, x,x,x, x,x,x)
	.word 0xda24228d  ! 242: STW_I	stw	%r13, [%r16 + 0x028d]
	.word 0x90342144  ! 244: ORN_I	orn 	%r16, 0x0144, %r8
	.word 0x9d3c2001  ! 244: SRA_I	sra 	%r16, 0x0001, %r14
	return     %r18 + %r17
!Illinst alu
	.word 0xb62c3ff0  ! 244: ANDN_I	andn 	%r16, 0xfffffff0, %r27
	.word 0x9cc425fb  ! 246: ADDCcc_I	addccc 	%r16, 0x05fb, %r14
	.word 0x98c40011  ! 246: ADDCcc_R	addccc 	%r16, %r17, %r12
	.word 0x912c2001  ! 246: SLL_I	sll 	%r16, 0x0001, %r8
	.word 0xfa540011  ! 246: LDSH_R	ldsh	[%r16 + %r17], %r29
thr2_irf_ce_19:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_19), 16, 16),1,IRF,ce,6,x, x,x,x, x,x,x)
	.word 0xf27421c1  ! 250: STX_I	stx	%r25, [%r16 + 0x01c1]
	rd      %asr26, %r31
	set     0x01f05, %r30
	and     %r31, %r30, %r31
!Illinst store
	.word 0xf0741571  ! 253: STX_R	stx	%r24, [%r16 + %r17]
	.word 0x909c2c5c  ! 255: XORcc_I	xorcc 	%r16, 0x0c5c, %r8
	.word 0x9e442f6d  ! 255: ADDC_I	addc 	%r16, 0x0f6d, %r15
	.word 0x912c1011  ! 255: SLLX_R	sllx	%r16, %r17, %r8
	wr      %r0, 0x1, %asr26
!Illinst alu
	.word 0x86c41d71  ! 256: ADDCcc_R	addccc 	%r16, %r17, %r3
	.word 0x9b7c2401  ! 258: MOVR_I	movre	%r16, 0x1, %r13
	.word 0xbb2c0011  ! 258: SLL_R	sll 	%r16, %r17, %r29
	.word 0x887c2874  ! 258: SDIV_I	sdiv 	%r16, 0x0874, %r4
	.word 0xd6242283  ! 261: STW_I	stw	%r11, [%r16 + 0x0283]
	.word 0xba0c2316  ! 263: AND_I	and 	%r16, 0x0316, %r29
	.word 0x984c2c7a  ! 263: MULX_I	mulx 	%r16, 0x0c7a, %r12
	.word 0xd8742325  ! 266: STX_I	stx	%r12, [%r16 + 0x0325]
	.word 0xa8340011  ! 268: ORN_R	orn 	%r16, %r17, %r20
	.word 0x8143c000  ! 268: STBAR	stbar
!Illinst store
	.word 0xd2341f31  ! 269: STH_R	sth	%r9, [%r16 + %r17]
	.word 0xb2142a7a  ! 271: OR_I	or 	%r16, 0x0a7a, %r25
	.word 0xba840011  ! 271: ADDcc_R	addcc 	%r16, %r17, %r29
	.word 0xb4942cfb  ! 271: ORcc_I	orcc 	%r16, 0x0cfb, %r26
	.word 0xc51c0011  ! 271: LDDF_R	ldd	[%r16, %r17], %f2
!Illinst alu
	.word 0x8c043df5  ! 272: ADD_I	add 	%r16, 0xfffffdf5, %r6
	rd      %asr26, %r31
	set     0x01f05, %r30
	and     %r31, %r30, %r31
!Illinst store
	.word 0xd2341771  ! 275: STH_R	sth	%r9, [%r16 + %r17]
	.word 0x8d2c2001  ! 277: SLL_I	sll 	%r16, 0x0001, %r6
	.word 0x98842817  ! 277: ADDcc_I	addcc 	%r16, 0x0817, %r12
        wr %g0, 0x4, %fprs
!Illinst alu
	.word 0xae143ff8  ! 278: OR_I	or 	%r16, 0xfffffff8, %r23
	.word 0x943c0011  ! 280: XNOR_R	xnor 	%r16, %r17, %r10
	.word 0xaec42344  ! 280: ADDCcc_I	addccc 	%r16, 0x0344, %r23
	.word 0xb2040011  ! 280: ADD_R	add 	%r16, %r17, %r25
	.word 0xd04429b3  ! 280: LDSW_I	ldsw	[%r16 + 0x09b3], %r8
!Illinst alu
	.word 0xa6443f7e  ! 281: ADDC_I	addc 	%r16, 0xffffff7e, %r19
	.word 0xbaac21d0  ! 283: ANDNcc_I	andncc 	%r16, 0x01d0, %r29
	.word 0x81518000  ! 283: RDPR_PSTATE	rdpr	%pstate, %r0
thr2_irf_ce_20:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_20), 16, 16),1,IRF,ce,44,x, x,x,x, x,x,x)
	.word 0xd8342127  ! 287: STH_I	sth	%r12, [%r16 + 0x0127]
	.word 0x882c0011  ! 289: ANDN_R	andn 	%r16, %r17, %r4
	.word 0x8a2c2cea  ! 289: ANDN_I	andn 	%r16, 0x0cea, %r5
	wr      %r0, 0x5, %asr26
thr2_irf_ce_21:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_21), 16, 16),1,IRF,ce,54,x, x,x,x, x,x,x)
	.word 0xd8742823  ! 293: STX_I	stx	%r12, [%r16 + 0x0823]
	.word 0x869c21f6  ! 295: XORcc_I	xorcc 	%r16, 0x01f6, %r3
	.word 0x8143e040  ! 295: MEMBAR	membar	#Sync 
	.word 0xcc2423df  ! 298: STW_I	stw	%r6, [%r16 + 0x03df]
	.word 0x88340011  ! 300: ORN_R	orn 	%r16, %r17, %r4
	.word 0x901c0011  ! 300: XOR_R	xor 	%r16, %r17, %r8
	.word 0x9f802d3f  ! 300: SIR	sir	0x0d3f
!Illinst store
	.word 0xf6741ff1  ! 301: STX_R	stx	%r27, [%r16 + %r17]
	.word 0x91341011  ! 303: SRLX_R	srlx	%r16, %r17, %r8
	.word 0x9c1c0011  ! 303: XOR_R	xor 	%r16, %r17, %r14
	.word 0x92340011  ! 303: ORN_R	orn 	%r16, %r17, %r9
	.word 0x8de40011  ! 303: SAVE_R	save	%r16, %r17, %r6
	.word 0xc4342e9b  ! 306: STH_I	sth	%r2, [%r16 + 0x0e9b]
	.word 0xba140011  ! 308: OR_R	or 	%r16, %r17, %r29
	.word 0xaf340011  ! 308: SRL_R	srl 	%r16, %r17, %r23
        wr %g0, 0x4, %fprs
!Illinst store
	.word 0xc8241fb1  ! 309: STW_R	stw	%r4, [%r16 + %r17]
	.word 0x86840011  ! 311: ADDcc_R	addcc 	%r16, %r17, %r3
	.word 0x8143c000  ! 311: STBAR	stbar
thr2_irf_ce_22:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_22), 16, 16),1,IRF,ce,51,x, x,x,x, x,x,x)
	.word 0xde7422e9  ! 315: STX_I	stx	%r15, [%r16 + 0x02e9]
	.word 0x8c842c26  ! 317: ADDcc_I	addcc 	%r16, 0x0c26, %r6
	.word 0x98342a53  ! 317: ORN_I	orn 	%r16, 0x0a53, %r12
	.word 0x99342001  ! 317: SRL_I	srl 	%r16, 0x0001, %r12
	.word 0xc8042cc7  ! 317: LDUW_I	lduw	[%r16 + 0x0cc7], %r4
!Illinst store
	.word 0xda7417f1  ! 318: STX_R	stx	%r13, [%r16 + %r17]
	.word 0x8b643801  ! 320: MOVcc_I	<illegal instruction>
	.word 0x98540011  ! 320: UMUL_R	umul 	%r16, %r17, %r12
	.word 0xda242ad1  ! 323: STW_I	stw	%r13, [%r16 + 0x0ad1]
	.word 0xc3ec1011  ! 325: PREFETCHA_R	prefetcha	[%r16, %r17] 0x80, #one_read
!Illinst alu
	.word 0x860c1f31  ! 326: AND_R	and 	%r16, %r17, %r3
	.word 0x98b40011  ! 328: ORNcc_R	orncc 	%r16, %r17, %r12
	.word 0x8143e065  ! 328: MEMBAR	membar	#LoadLoad | #LoadStore | #MemIssue | #Sync 
!Illinst store
	.word 0xcc341fb1  ! 329: STH_R	sth	%r6, [%r16 + %r17]
	.word 0x8ebc2615  ! 331: XNORcc_I	xnorcc 	%r16, 0x0615, %r7
        wr  %g0, 0x80, %asi
thr2_irf_ce_23:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_23), 16, 16),1,IRF,ce,24,x, x,x,x, x,x,x)
	.word 0xda24247b  ! 335: STW_I	stw	%r13, [%r16 + 0x047b]
	.word 0x90bc0011  ! 337: XNORcc_R	xnorcc 	%r16, %r17, %r8
	.word 0x9e1c2025  ! 337: XOR_I	xor 	%r16, 0x0025, %r15
	.word 0xc36c24f8  ! 337: PREFETCH_I	prefetch	[%r16 + 0x04f8], #one_read
thr2_irf_ce_24:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_24), 16, 16),1,IRF,ce,25,x, x,x,x, x,x,x)
	.word 0xd2242b55  ! 341: STW_I	stw	%r9, [%r16 + 0x0b55]
	.word 0xc4dc1011  ! 343: LDXA_R	ldxa	[%r16, %r17] 0x80, %r2
!Illinst store
	.word 0xd03415f1  ! 344: STH_R	sth	%r8, [%r16 + %r17]
	.word 0xb12c0011  ! 346: SLL_R	sll 	%r16, %r17, %r24
	.word 0x97e40011  ! 346: SAVE_R	save	%r16, %r17, %r11
!Illinst alu
	.word 0x8c841ff1  ! 347: ADDcc_R	addcc 	%r16, %r17, %r6
	.word 0xc41c0011  ! 349: LDD_R	ldd	[%r16 + %r17], %r2
!Illinst alu
	.word 0xa92c3de1  ! 350: SLL_I	sllx	%r16, 0x0021, %r20
	.word 0x842c22ee  ! 352: ANDN_I	andn 	%r16, 0x02ee, %r2
	.word 0x8f342001  ! 352: SRL_I	srl 	%r16, 0x0001, %r7
	.word 0xa83c0011  ! 352: XNOR_R	xnor 	%r16, %r17, %r20
	.word 0xecd41011  ! 352: LDSHA_R	ldsha	[%r16, %r17] 0x80, %r22
thr2_irf_ce_25:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_25), 16, 16),1,IRF,ce,25,x, x,x,x, x,x,x)
	.word 0xde242c5f  ! 356: STW_I	stw	%r15, [%r16 + 0x0c5f]
	.word 0x901c0011  ! 358: XOR_R	xor 	%r16, %r17, %r8
        wr %g0, 0x4, %fprs
!Illinst alu
	.word 0x84bc1531  ! 359: XNORcc_R	xnorcc 	%r16, %r17, %r2
	.word 0x9ab40011  ! 361: ORNcc_R	orncc 	%r16, %r17, %r13
	.word 0x96840011  ! 361: ADDcc_R	addcc 	%r16, %r17, %r11
	.word 0x81880000  ! 361: SAVED	saved
	.word 0xcc242f5b  ! 364: STW_I	stw	%r6, [%r16 + 0x0f5b]
	.word 0xce6c2dab  ! 366: LDSTUB_I	ldstub	%r7, [%r16 + 0x0dab]
	.word 0xc8742c5f  ! 369: STX_I	stx	%r4, [%r16 + 0x0c5f]
        wr %g0, 0x4, %fprs
thr2_irf_ce_26:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_26), 16, 16),1,IRF,ce,50,x, x,x,x, x,x,x)
	.word 0xc8742a6f  ! 375: STX_I	stx	%r4, [%r16 + 0x0a6f]
	.word 0x81dc0011  ! 377: FLUSH_R	flush
	.word 0xc8742cdb  ! 380: STX_I	stx	%r4, [%r16 + 0x0cdb]
	.word 0xf07c0011  ! 382: SWAP_R	swap	%r24, [%r16 + %r17]
!Illinst store
	.word 0xde3417f1  ! 383: STH_R	sth	%r15, [%r16 + %r17]
	.word 0x8cc40011  ! 385: ADDCcc_R	addccc 	%r16, %r17, %r6
	.word 0x852c1011  ! 385: SLLX_R	sllx	%r16, %r17, %r2
	.word 0xae042877  ! 385: ADD_I	add 	%r16, 0x0877, %r23
	rd      %asr26, %r31
	set     0x01f05, %r30
	and     %r31, %r30, %r31
!Illinst store
	.word 0xd8341ff1  ! 386: STH_R	sth	%r12, [%r16 + %r17]
	.word 0x90940011  ! 388: ORcc_R	orcc 	%r16, %r17, %r8
	.word 0x9c9c2215  ! 388: XORcc_I	xorcc 	%r16, 0x0215, %r14
	.word 0xb214243e  ! 388: OR_I	or 	%r16, 0x043e, %r25
	.word 0xdea42225  ! 388: STWA_I	stwa	%r15, [%r16 + 0x0225] %asi
thr2_irf_ce_27:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_27), 16, 16),1,IRF,ce,50,x, x,x,x, x,x,x)
	.word 0xe8242ad3  ! 392: STW_I	stw	%r20, [%r16 + 0x0ad3]
	.word 0x99340011  ! 394: SRL_R	srl 	%r16, %r17, %r12
	.word 0xb8340011  ! 394: ORN_R	orn 	%r16, %r17, %r28
	.word 0xaa0422a4  ! 394: ADD_I	add 	%r16, 0x02a4, %r21
	.word 0x83880000  ! 394: RESTORED	restored
	.word 0xea342177  ! 397: STH_I	sth	%r21, [%r16 + 0x0177]
	.word 0xa69c0011  ! 399: XORcc_R	xorcc 	%r16, %r17, %r19
	.word 0x90442ea1  ! 399: ADDC_I	addc 	%r16, 0x0ea1, %r8
	.word 0xad342001  ! 399: SRL_I	srl 	%r16, 0x0001, %r22
	.word 0x8143e073  ! 399: MEMBAR	membar	#LoadLoad | #StoreLoad | #Lookaside | #MemIssue | #Sync 
!Illinst store
	.word 0xee7415b1  ! 400: STX_R	stx	%r23, [%r16 + %r17]
	.word 0x9c9c207b  ! 402: XORcc_I	xorcc 	%r16, 0x007b, %r14
	.word 0x8c2c0011  ! 402: ANDN_R	andn 	%r16, %r17, %r6
        wr %g0, 0x4, %fprs
thr2_irf_ce_28:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_28), 16, 16),1,IRF,ce,29,x, x,x,x, x,x,x)
	.word 0xf224282f  ! 406: STW_I	stw	%r25, [%r16 + 0x082f]
	.word 0xaa9c0011  ! 408: XORcc_R	xorcc 	%r16, %r17, %r21
	.word 0xc3ec288e  ! 408: PREFETCHA_I	prefetcha	[%r16, + 0x088e] %asi, #one_read
!Illinst store
	.word 0xf8241731  ! 409: STW_R	stw	%r28, [%r16 + %r17]
	.word 0x84342c06  ! 411: ORN_I	orn 	%r16, 0x0c06, %r2
	.word 0x828c0011  ! 411: ANDcc_R	andcc 	%r16, %r17, %r1
	.word 0x9b7c2401  ! 411: MOVR_I	movre	%r16, 0x1, %r13
thr2_resum_intr_741:
!$EV trig_pc_d(2,expr(@VA(.MAIN.thr2_resum_intr_741), 16, 16)) -> intp(2, 3, 1)
	wr      %r0, 0x0, %asr26
!Illinst store
	.word 0xee341771  ! 412: STH_R	sth	%r23, [%r16 + %r17]
	.word 0x81dc254d  ! 414: FLUSH_I	flush
!Illinst alu
	.word 0x901437fa  ! 415: OR_I	or 	%r16, 0xfffff7fa, %r8
	.word 0x86140011  ! 417: OR_R	or 	%r16, %r17, %r3
        wr %g0, 0x4, %fprs
!Illinst alu
	.word 0xac343ffc  ! 418: SUBC_I	orn 	%r16, 0xfffffffc, %r22
	.word 0xb08c0011  ! 420: ANDcc_R	andcc 	%r16, %r17, %r24
	.word 0xdab41011  ! 420: STHA_R	stha	%r13, [%r16 + %r17] 0x80
	.word 0xd8242a5d  ! 423: STW_I	stw	%r12, [%r16 + 0x0a5d]
	.word 0x8a7c2fe2  ! 425: SDIV_I	sdiv 	%r16, 0x0fe2, %r5
!Illinst alu
	.word 0x9ac41571  ! 426: ADDCcc_R	addccc 	%r16, %r17, %r13
	.word 0xa92c2001  ! 428: SLL_I	sll 	%r16, 0x0001, %r20
	.word 0x81880000  ! 428: SAVED	saved
thr2_irf_ce_29:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_29), 16, 16),1,IRF,ce,19,x, x,x,x, x,x,x)
	.word 0xd2242e53  ! 432: STW_I	stw	%r9, [%r16 + 0x0e53]
	.word 0x9cb40011  ! 434: ORNcc_R	orncc 	%r16, %r17, %r14
	.word 0x9b3c0011  ! 434: SRA_R	sra 	%r16, %r17, %r13
	.word 0x8eb40011  ! 434: ORNcc_R	orncc 	%r16, %r17, %r7
	.word 0x81dc0011  ! 434: FLUSH_R	flush
!Illinst alu
	.word 0x8ea41731  ! 435: SUBcc_R	subcc 	%r16, %r17, %r7
	.word 0xc36c2aed  ! 437: PREFETCH_I	prefetch	[%r16 + 0x0aed], #one_read
!Illinst alu
	.word 0xb2441531  ! 438: ADDC_R	addc 	%r16, %r17, %r25
	.word 0xb0040011  ! 440: ADD_R	add 	%r16, %r17, %r24
	.word 0xae1c2258  ! 440: XOR_I	xor 	%r16, 0x0258, %r23
	.word 0xb3343001  ! 440: SRLX_I	srlx	%r16, 0x0001, %r25
	.word 0xdaac2e43  ! 440: STBA_I	stba	%r13, [%r16 + 0x0e43] %asi
!Illinst alu
	.word 0x9c0c37f7  ! 441: AND_I	and 	%r16, 0xfffff7f7, %r14
	.word 0xaec40011  ! 443: ADDCcc_R	addccc 	%r16, %r17, %r23
	.word 0x9f8026f5  ! 443: SIR	sir	0x06f5
	.word 0xce3421b5  ! 446: STH_I	sth	%r7, [%r16 + 0x01b5]
	.word 0x94840011  ! 448: ADDcc_R	addcc 	%r16, %r17, %r10
	.word 0x92342e24  ! 448: ORN_I	orn 	%r16, 0x0e24, %r9
        wr %g0, 0x4, %fprs
!Illinst store
	.word 0xc4341fb1  ! 449: STH_R	sth	%r2, [%r16 + %r17]
	.word 0xbabc2c74  ! 451: XNORcc_I	xnorcc 	%r16, 0x0c74, %r29
	ta	T_CHANGE_PRIV	! macro
thr2_irf_ce_30:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_30), 16, 16),1,IRF,ce,59,x, x,x,x, x,x,x)
	.word 0xec742621  ! 455: STX_I	stx	%r22, [%r16 + 0x0621]
	.word 0xa69c0011  ! 457: XORcc_R	xorcc 	%r16, %r17, %r19
	wr      %r0, 0x5, %asr26
thr2_irf_ce_31:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_31), 16, 16),1,IRF,ce,35,x, x,x,x, x,x,x)
	.word 0xf8242bdf  ! 461: STW_I	stw	%r28, [%r16 + 0x0bdf]
	.word 0x953c0011  ! 463: SRA_R	sra 	%r16, %r17, %r10
	.word 0xf06c0011  ! 463: LDSTUB_R	ldstub	%r24, [%r16 + %r17]
	.word 0xcc74238d  ! 466: STX_I	stx	%r6, [%r16 + 0x038d]
	.word 0xac440011  ! 468: ADDC_R	addc 	%r16, %r17, %r22
	.word 0x9f240011  ! 468: MULScc_R	mulscc 	%r16, %r17, %r15
!Illinst store
	.word 0xde3415b1  ! 469: STH_R	sth	%r15, [%r16 + %r17]
	.word 0x8a8c0011  ! 471: ANDcc_R	andcc 	%r16, %r17, %r5
	.word 0x84bc2a24  ! 471: XNORcc_I	xnorcc 	%r16, 0x0a24, %r2
thr2_resum_intr_742:
!$EV trig_pc_d(2,expr(@VA(.MAIN.thr2_resum_intr_742), 16, 16)) -> intp(2, 3, 1)
	wr      %r0, 0x4, %asr26
	.word 0xd0742507  ! 474: STX_I	stx	%r8, [%r16 + 0x0507]
	.word 0xba940011  ! 476: ORcc_R	orcc 	%r16, %r17, %r29
	.word 0x81dc280d  ! 476: FLUSH_I	flush
!Illinst store
	.word 0xcc341731  ! 477: STH_R	sth	%r6, [%r16 + %r17]
	.word 0x8e842f8b  ! 479: ADDcc_I	addcc 	%r16, 0x0f8b, %r7
	.word 0xd88c1011  ! 479: LDUBA_R	lduba	[%r16, %r17] 0x80, %r12
!Illinst alu
	.word 0x96243f77  ! 480: SUB_I	sub 	%r16, 0xffffff77, %r11
	.word 0x86d40011  ! 482: UMULcc_R	umulcc 	%r16, %r17, %r3
!Illinst alu
	.word 0x821c3f7d  ! 483: XOR_I	xor 	%r16, 0xffffff7d, %r1
        wr  %g0, 0x80, %asi
	.word 0xdc342729  ! 488: STH_I	sth	%r14, [%r16 + 0x0729]
	.word 0x872c2001  ! 490: SLL_I	sll 	%r16, 0x0001, %r3
	.word 0x8143c000  ! 490: STBAR	stbar
thr2_irf_ce_32:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_32), 16, 16),1,IRF,ce,6,x, x,x,x, x,x,x)
	.word 0xc47424b3  ! 494: STX_I	stx	%r2, [%r16 + 0x04b3]
	.word 0x880c0011  ! 496: AND_R	and 	%r16, %r17, %r4
	.word 0xb8ac0011  ! 496: ANDNcc_R	andncc 	%r16, %r17, %r28
	.word 0xb2ac245e  ! 496: ANDNcc_I	andncc 	%r16, 0x045e, %r25
	.word 0xaba94831  ! 496: FMOVCS	fmovs	%fcc1, %f17, %f21
thr2_irf_ce_33:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_33), 16, 16),1,IRF,ce,2,x, x,x,x, x,x,x)
	.word 0xf87424ab  ! 500: STX_I	stx	%r28, [%r16 + 0x04ab]
	.word 0xb0ac2a51  ! 502: ANDNcc_I	andncc 	%r16, 0x0a51, %r24
	.word 0x9cc40011  ! 502: ADDCcc_R	addccc 	%r16, %r17, %r14
	.word 0x868c29e7  ! 502: ANDcc_I	andcc 	%r16, 0x09e7, %r3
	.word 0x81580000  ! 502: FLUSHW	flushw
!Illinst alu
	.word 0xb2ac3fed  ! 503: ANDNcc_I	andncc 	%r16, 0xffffffed, %r25
	.word 0xa60c0011  ! 505: AND_R	and 	%r16, %r17, %r19
	.word 0x82940011  ! 505: ORcc_R	orcc 	%r16, %r17, %r1
	.word 0x9abc0011  ! 505: XNORcc_R	xnorcc 	%r16, %r17, %r13
	.word 0xf13c0011  ! 505: STDF_R	std	%f24, [%r17, %r16]
	.word 0x949c0011  ! 507: XORcc_R	xorcc 	%r16, %r17, %r10
	.word 0x84ac0011  ! 507: ANDNcc_R	andncc 	%r16, %r17, %r2
	.word 0x96c40011  ! 507: ADDCcc_R	addccc 	%r16, %r17, %r11
	.word 0x9c840011  ! 507: ADDcc_R	addcc 	%r16, %r17, %r14
	rd      %pc, %r18
	set     0x20, %r17
	.word 0xcc3429a1  ! 508: STH_I	sth	%r6, [%r16 + 0x09a1]
	.word 0xa77c0411  ! 510: MOVR_R	movre	%r16, %r17, %r19
	jmpl     %r18 + %r17, %r31
!Illinst alu
	.word 0x8a341f31  ! 510: ORN_R	orn 	%r16, %r17, %r5
	.word 0x8e842a20  ! 512: ADDcc_I	addcc 	%r16, 0x0a20, %r7
	.word 0xc3ec1011  ! 512: PREFETCHA_R	prefetcha	[%r16, %r17] 0x80, #one_read
	.word 0xb93c2001  ! 514: SRA_I	sra 	%r16, 0x0001, %r28
	.word 0x8f2c3001  ! 514: SLLX_I	sllx	%r16, 0x0001, %r7
	.word 0xa89c25ba  ! 514: XORcc_I	xorcc 	%r16, 0x05ba, %r20
	.word 0x94442a1e  ! 514: ADDC_I	addc 	%r16, 0x0a1e, %r10
	rd      %pc, %r18
	set     0x20, %r17
	.word 0xee7425a1  ! 515: STX_I	stx	%r23, [%r16 + 0x05a1]
	jmpl     %r18 + %r17, %r31
!Illinst store
	.word 0xc8241fb1  ! 517: STW_R	stw	%r4, [%r16 + %r17]
	.word 0x8f340011  ! 519: SRL_R	srl 	%r16, %r17, %r7
	.word 0xb494282a  ! 519: ORcc_I	orcc 	%r16, 0x082a, %r26
	.word 0x0c800001  ! 519: BNEG	bneg  	<label_0x1>
thr2_irf_ce_34:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_34), 16, 16),1,IRF,ce,12,x, x,x,x, x,x,x)
	.word 0xd8242def  ! 523: STW_I	stw	%r12, [%r16 + 0x0def]
	.word 0xb60c0011  ! 525: AND_R	and 	%r16, %r17, %r27
	.word 0x98d40011  ! 525: UMULcc_R	umulcc 	%r16, %r17, %r12
thr2_irf_ce_35:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_35), 16, 16),1,IRF,ce,14,x, x,x,x, x,x,x)
	.word 0xd8742063  ! 529: STX_I	stx	%r12, [%r16 + 0x0063]
	.word 0x92c42b5f  ! 531: ADDCcc_I	addccc 	%r16, 0x0b5f, %r9
	.word 0x9a3c0011  ! 531: XNOR_R	xnor 	%r16, %r17, %r13
	.word 0x9cac2a82  ! 531: ANDNcc_I	andncc 	%r16, 0x0a82, %r14
	.word 0x9c542dca  ! 531: UMUL_I	umul 	%r16, 0x0dca, %r14
!Illinst alu
	.word 0x90b43f6d  ! 532: ORNcc_I	orncc 	%r16, 0xffffff6d, %r8
	.word 0x912c2001  ! 534: SLL_I	sll 	%r16, 0x0001, %r8
	.word 0xd0f41011  ! 534: STXA_R	stxa	%r8, [%r16 + %r17] 0x80
!Illinst store
	.word 0xdc741f31  ! 535: STX_R	stx	%r14, [%r16 + %r17]
	.word 0x8143e062  ! 537: MEMBAR	membar	#StoreLoad | #MemIssue | #Sync 
!Illinst alu
	.word 0x92bc37ec  ! 538: XNORcc_I	xnorcc 	%r16, 0xfffff7ec, %r9
	.word 0x940c2b72  ! 540: AND_I	and 	%r16, 0x0b72, %r10
	.word 0xb2342c39  ! 540: ORN_I	orn 	%r16, 0x0c39, %r25
	.word 0x83342001  ! 540: SRL_I	srl 	%r16, 0x0001, %r1
	.word 0x81580000  ! 540: FLUSHW	flushw
	.word 0x9f2c3001  ! 542: SLLX_I	sllx	%r16, 0x0001, %r15
	.word 0x86c42ab0  ! 542: ADDCcc_I	addccc 	%r16, 0x0ab0, %r3
	.word 0x9e04228b  ! 542: ADD_I	add 	%r16, 0x028b, %r15
	.word 0x9c940011  ! 542: ORcc_R	orcc 	%r16, %r17, %r14
	.word 0xae8c0011  ! 542: ANDcc_R	andcc 	%r16, %r17, %r23
	.word 0x9c8c0011  ! 542: ANDcc_R	andcc 	%r16, %r17, %r14
	rd      %pc, %r18
	set     0x20, %r17
	.word 0xde7422c3  ! 543: STX_I	stx	%r15, [%r16 + 0x02c3]
	jmpl     %r18 + %r17, %r31
!Illinst store
	.word 0xee741f31  ! 545: STX_R	stx	%r23, [%r16 + %r17]
	.word 0x93643801  ! 547: MOVcc_I	<illegal instruction>
	.word 0x8143c000  ! 547: STBAR	stbar
!Illinst alu
	.word 0x8c9c3ff4  ! 548: XORcc_I	xorcc 	%r16, 0xfffffff4, %r6
	.word 0x9e9c0011  ! 550: XORcc_R	xorcc 	%r16, %r17, %r15
	.word 0x953c1011  ! 550: SRAX_R	srax	%r16, %r17, %r10
	.word 0x83880000  ! 550: RESTORED	restored
!Illinst alu
	.word 0x8f341ff1  ! 551: SRL_R	srlx	%r16, %r17, %r7
	.word 0x8bec0011  ! 553: RESTORE_R	restore	%r16, %r17, %r5
!Illinst alu
	.word 0xbb7c1f31  ! 554: MOVR_R	movrvs	%r16, %r17, %r29
	.word 0x929c2385  ! 556: XORcc_I	xorcc 	%r16, 0x0385, %r9
thr2_resum_intr_743:
!$EV trig_pc_d(2,expr(@VA(.MAIN.thr2_resum_intr_743), 16, 16)) -> intp(2, 3, 1)
	wr      %r0, 0x0, %asr26
thr2_irf_ce_36:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_36), 16, 16),1,IRF,ce,43,x, x,x,x, x,x,x)
	.word 0xda242a83  ! 560: STW_I	stw	%r13, [%r16 + 0x0a83]
	.word 0xdec41011  ! 562: LDSWA_R	ldswa	[%r16, %r17] 0x80, %r15
!Illinst store
	.word 0xee241771  ! 563: STW_R	stw	%r23, [%r16 + %r17]
	.word 0x92842876  ! 565: ADDcc_I	addcc 	%r16, 0x0876, %r9
	.word 0xb0340011  ! 565: ORN_R	orn 	%r16, %r17, %r24
        wr %g0, 0x4, %fprs
	.word 0xc8742cdf  ! 568: STX_I	stx	%r4, [%r16 + 0x0cdf]
	.word 0xa88c0011  ! 570: ANDcc_R	andcc 	%r16, %r17, %r20
	.word 0xbb641811  ! 570: MOVcc_R	<illegal instruction>
	.word 0x81538000  ! 570: RDPR_WSTATE	rdpr	%wstate, %r0
	.word 0xb52c0011  ! 572: SLL_R	sll 	%r16, %r17, %r26
	.word 0xb3342001  ! 572: SRL_I	srl 	%r16, 0x0001, %r25
	.word 0xb8440011  ! 572: ADDC_R	addc 	%r16, %r17, %r28
	.word 0xa69c2f5f  ! 572: XORcc_I	xorcc 	%r16, 0x0f5f, %r19
	.word 0x94b40011  ! 572: ORNcc_R	orncc 	%r16, %r17, %r10
	.word 0xb08c0011  ! 572: ANDcc_R	andcc 	%r16, %r17, %r24
	rd      %pc, %r18
	set     0x20, %r17
thr2_irf_ce_37:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_37), 16, 16),1,IRF,ce,39,x, x,x,x, x,x,x)
	.word 0xcc342339  ! 574: STH_I	sth	%r6, [%r16 + 0x0339]
	jmpl     %r18 + %r17, %r31
!Illinst alu
	.word 0x8b341df1  ! 576: SRLX_R	srlx	%r16, %r17, %r5
	.word 0xac2c0011  ! 578: ANDN_R	andn 	%r16, %r17, %r22
	.word 0x9cb40011  ! 578: ORNcc_R	orncc 	%r16, %r17, %r14
	.word 0xa6342def  ! 578: ORN_I	orn 	%r16, 0x0def, %r19
	.word 0xcb841011  ! 578: LDFA_R	lda	[%r16, %r17], %f5
	.word 0x86942048  ! 580: ORcc_I	orcc 	%r16, 0x0048, %r3
	.word 0xa7641811  ! 580: MOVcc_R	<illegal instruction>
	.word 0x95643801  ! 580: MOVcc_I	<illegal instruction>
	.word 0x837c0411  ! 580: MOVR_R	movre	%r16, %r17, %r1
	.word 0xb29c0011  ! 580: XORcc_R	xorcc 	%r16, %r17, %r25
	.word 0x9c2c0011  ! 580: ANDN_R	andn 	%r16, %r17, %r14
	rd      %pc, %r18
	set     0x20, %r17
	.word 0xca24269b  ! 581: STW_I	stw	%r5, [%r16 + 0x069b]
	.word 0xb8142d2a  ! 583: OR_I	or 	%r16, 0x0d2a, %r28
	return     %r18 + %r17
	.word 0xc8342393  ! 585: STH_I	sth	%r4, [%r16 + 0x0393]
	.word 0x96c40011  ! 587: ADDCcc_R	addccc 	%r16, %r17, %r11
	.word 0xb4340011  ! 587: ORN_R	orn 	%r16, %r17, %r26
	.word 0x940c0011  ! 587: AND_R	and 	%r16, %r17, %r10
	.word 0xc45c2bea  ! 587: LDX_I	ldx	[%r16 + 0x0bea], %r2
thr2_irf_ce_38:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_38), 16, 16),1,IRF,ce,3,x, x,x,x, x,x,x)
	.word 0xcc342a19  ! 591: STH_I	sth	%r6, [%r16 + 0x0a19]
	.word 0xb12c2001  ! 593: SLL_I	sll 	%r16, 0x0001, %r24
	.word 0xb48c22f3  ! 593: ANDcc_I	andcc 	%r16, 0x02f3, %r26
	.word 0xcb240011  ! 593: STF_R	st	%f5, [%r17, %r16]
thr2_irf_ce_39:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_39), 16, 16),1,IRF,ce,15,x, x,x,x, x,x,x)
	.word 0xf2742eaf  ! 597: STX_I	stx	%r25, [%r16 + 0x0eaf]
thr2_resum_intr_744:
!$EV trig_pc_d(2,expr(@VA(.MAIN.thr2_resum_intr_744), 16, 16)) -> intp(2, 3, 1)
	wr      %r0, 0x0, %asr26
!Illinst alu
	.word 0x8c1415b1  ! 600: OR_R	or 	%r16, %r17, %r6
	.word 0x92840011  ! 602: ADDcc_R	addcc 	%r16, %r17, %r9
	.word 0x8e9c0011  ! 602: XORcc_R	xorcc 	%r16, %r17, %r7
	.word 0x95643801  ! 602: MOVcc_I	<illegal instruction>
	.word 0xe9242f47  ! 602: STF_I	st	%f20, [0x0f47, %r16]
thr2_irf_ce_40:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_40), 16, 16),1,IRF,ce,70,x, x,x,x, x,x,x)
	.word 0xd2742413  ! 606: STX_I	stx	%r9, [%r16 + 0x0413]
	.word 0xb0b40011  ! 608: ORNcc_R	orncc 	%r16, %r17, %r24
	.word 0xc3ec1011  ! 608: PREFETCHA_R	prefetcha	[%r16, %r17] 0x80, #one_read
!Illinst store
	.word 0xe8741d31  ! 609: STX_R	stx	%r20, [%r16 + %r17]
	.word 0x9d2c3001  ! 611: SLLX_I	sllx	%r16, 0x0001, %r14
	.word 0x8da000b1  ! 611: FNEGs	fnegs	%f17, %f6
	.word 0x95340011  ! 613: SRL_R	srl 	%r16, %r17, %r10
	.word 0x92042f0a  ! 613: ADD_I	add 	%r16, 0x0f0a, %r9
	.word 0x99340011  ! 613: SRL_R	srl 	%r16, %r17, %r12
	.word 0xa68c2b1f  ! 613: ANDcc_I	andcc 	%r16, 0x0b1f, %r19
	rd      %pc, %r18
	set     0x20, %r17
	.word 0xd0342c1f  ! 614: STH_I	sth	%r8, [%r16 + 0x0c1f]
	.word 0xab641811  ! 616: MOVcc_R	<illegal instruction>
	jmpl     %r18 + %r17, %r31
!Illinst store
	.word 0xee7415f1  ! 616: STX_R	stx	%r23, [%r16 + %r17]
	.word 0x992c2001  ! 618: SLL_I	sll 	%r16, 0x0001, %r12
	.word 0xb23c0011  ! 618: XNOR_R	xnor 	%r16, %r17, %r25
        wr  %g0, 0x80, %asi
!Illinst store
	.word 0xd6241f71  ! 619: STW_R	stw	%r11, [%r16 + %r17]
	.word 0xcd941011  ! 621: LDQFA_R	-	[%r16, %r17], %f6
	.word 0xca742a67  ! 624: STX_I	stx	%r5, [%r16 + 0x0a67]
	.word 0xba2c2c9b  ! 626: ANDN_I	andn 	%r16, 0x0c9b, %r29
	.word 0x8f3c1011  ! 626: SRAX_R	srax	%r16, %r17, %r7
	.word 0x8c1c0011  ! 626: XOR_R	xor 	%r16, %r17, %r6
	wr      %r0, 0x1, %asr26
thr2_irf_ce_41:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_41), 16, 16),1,IRF,ce,19,x, x,x,x, x,x,x)
	.word 0xfa74219f  ! 630: STX_I	stx	%r29, [%r16 + 0x019f]
	.word 0xa83c0011  ! 632: XNOR_R	xnor 	%r16, %r17, %r20
        wr %g0, 0x4, %fprs
thr2_irf_ce_42:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_42), 16, 16),1,IRF,ce,28,x, x,x,x, x,x,x)
	.word 0xf2242b0d  ! 636: STW_I	stw	%r25, [%r16 + 0x0b0d]
	.word 0x8a340011  ! 638: ORN_R	orn 	%r16, %r17, %r5
	.word 0x90840011  ! 638: ADDcc_R	addcc 	%r16, %r17, %r8
	rd      %asr26, %r31
	set     0x01f05, %r30
	and     %r31, %r30, %r31
	.word 0xd4242f37  ! 641: STW_I	stw	%r10, [%r16 + 0x0f37]
	.word 0x8143e02c  ! 643: MEMBAR	membar	#LoadStore | #StoreStore | #MemIssue 
thr2_irf_ce_43:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_43), 16, 16),1,IRF,ce,1,x, x,x,x, x,x,x)
	.word 0xd434226d  ! 647: STH_I	sth	%r10, [%r16 + 0x026d]
	.word 0x869c0011  ! 649: XORcc_R	xorcc 	%r16, %r17, %r3
	.word 0x980c2e29  ! 649: AND_I	and 	%r16, 0x0e29, %r12
        wr %g0, 0x4, %fprs
	.word 0xf0742273  ! 652: STX_I	stx	%r24, [%r16 + 0x0273]
	.word 0x82c426ae  ! 654: ADDCcc_I	addccc 	%r16, 0x06ae, %r1
	.word 0xb0440011  ! 654: ADDC_R	addc 	%r16, %r17, %r24
	.word 0xd0cc2331  ! 654: LDSBA_I	ldsba	[%r16, + 0x0331] %asi, %r8
thr2_irf_ce_44:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_44), 16, 16),1,IRF,ce,61,x, x,x,x, x,x,x)
	.word 0xca242907  ! 658: STW_I	stw	%r5, [%r16 + 0x0907]
	.word 0x9e340011  ! 660: ORN_R	orn 	%r16, %r17, %r15
	.word 0x92bc0011  ! 660: XNORcc_R	xnorcc 	%r16, %r17, %r9
	.word 0xfac41011  ! 660: LDSWA_R	ldswa	[%r16, %r17] 0x80, %r29
thr2_irf_ce_45:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_45), 16, 16),1,IRF,ce,9,x, x,x,x, x,x,x)
	.word 0xc4742a05  ! 664: STX_I	stx	%r2, [%r16 + 0x0a05]
	wr      %r0, 0x5, %asr26
thr2_irf_ce_46:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_46), 16, 16),1,IRF,ce,31,x, x,x,x, x,x,x)
	.word 0xc4742785  ! 670: STX_I	stx	%r2, [%r16 + 0x0785]
	.word 0x8e8421a1  ! 672: ADDcc_I	addcc 	%r16, 0x01a1, %r7
	.word 0xf7e41011  ! 672: CASA_I	casa	[%r16] 0x80, %r17, %r27
thr2_irf_ce_47:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_47), 16, 16),1,IRF,ce,55,x, x,x,x, x,x,x)
	.word 0xd2342a0d  ! 676: STH_I	sth	%r9, [%r16 + 0x0a0d]
	.word 0xbb2c0011  ! 678: SLL_R	sll 	%r16, %r17, %r29
	.word 0x87ac0a51  ! 678: FCMPd	fcmpd	%fcc<n>, %f16, %f48
!Illinst alu
	.word 0xb1643d21  ! 679: MOVcc_I	<illegal instruction>
	.word 0x8d342001  ! 681: SRL_I	srl 	%r16, 0x0001, %r6
	.word 0x9cbc2000  ! 681: XNORcc_I	xnorcc 	%r16, 0x0000, %r14
	.word 0x969c0011  ! 681: XORcc_R	xorcc 	%r16, %r17, %r11
	.word 0x86d40011  ! 681: UMULcc_R	umulcc 	%r16, %r17, %r3
!Illinst store
	.word 0xf0341571  ! 682: STH_R	sth	%r24, [%r16 + %r17]
	.word 0x9a2c0011  ! 684: ANDN_R	andn 	%r16, %r17, %r13
	.word 0x8e8c2ccd  ! 684: ANDcc_I	andcc 	%r16, 0x0ccd, %r7
	.word 0x883c258f  ! 684: XNOR_I	xnor 	%r16, 0x058f, %r4
	.word 0x885c2dcf  ! 684: SMUL_I	smul 	%r16, 0x0dcf, %r4
thr2_irf_ce_48:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_48), 16, 16),1,IRF,ce,55,x, x,x,x, x,x,x)
	.word 0xfa74272d  ! 688: STX_I	stx	%r29, [%r16 + 0x072d]
	wr      %r0, 0x5, %asr26
!Illinst store
	.word 0xd2741f71  ! 691: STX_R	stx	%r9, [%r16 + %r17]
	.word 0x02800003  ! 693: BE	be  	<label_0x3>
!Illinst store
	.word 0xcc2415f1  ! 694: STW_R	stw	%r6, [%r16 + %r17]
	.word 0x8eac2ca4  ! 696: ANDNcc_I	andncc 	%r16, 0x0ca4, %r7
	.word 0x9f341011  ! 696: SRLX_R	srlx	%r16, %r17, %r15
	.word 0xaa342122  ! 696: ORN_I	orn 	%r16, 0x0122, %r21
	ta	T_CHANGE_HPRIV	! macro
	.word 0xca742be3  ! 699: STX_I	stx	%r5, [%r16 + 0x0be3]
	.word 0x83343001  ! 701: SRLX_I	srlx	%r16, 0x0001, %r1
	.word 0xb6140011  ! 701: OR_R	or 	%r16, %r17, %r27
	.word 0x832c0011  ! 701: SLL_R	sll 	%r16, %r17, %r1
	ta	T_CHANGE_NONPRIV	! macro
thr2_irf_ce_49:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_49), 16, 16),1,IRF,ce,10,x, x,x,x, x,x,x)
	.word 0xc8242daf  ! 705: STW_I	stw	%r4, [%r16 + 0x0daf]
	.word 0x881c25ee  ! 707: XOR_I	xor 	%r16, 0x05ee, %r4
	.word 0x8f342001  ! 707: SRL_I	srl 	%r16, 0x0001, %r7
	.word 0x88b42137  ! 707: ORNcc_I	orncc 	%r16, 0x0137, %r4
	.word 0xd3841011  ! 707: LDFA_R	lda	[%r16, %r17], %f9
!Illinst alu
	.word 0x98c437fe  ! 708: ADDCcc_I	addccc 	%r16, 0xfffff7fe, %r12
	.word 0x828c2996  ! 710: ANDcc_I	andcc 	%r16, 0x0996, %r1
	.word 0x9a940011  ! 710: ORcc_R	orcc 	%r16, %r17, %r13
	.word 0x8f3c1011  ! 710: SRAX_R	srax	%r16, %r17, %r7
	.word 0xcc0c2cb7  ! 710: LDUB_I	ldub	[%r16 + 0x0cb7], %r6
!Illinst store
	.word 0xce241fb1  ! 711: STW_R	stw	%r7, [%r16 + %r17]
	.word 0x933c1011  ! 713: SRAX_R	srax	%r16, %r17, %r9
	wr      %r0, 0x1, %asr26
	.word 0xda342099  ! 716: STH_I	sth	%r13, [%r16 + 0x0099]
	.word 0x902c2227  ! 718: ANDN_I	andn 	%r16, 0x0227, %r8
	.word 0xb3343001  ! 718: SRLX_I	srlx	%r16, 0x0001, %r25
	.word 0xaeb42083  ! 718: ORNcc_I	orncc 	%r16, 0x0083, %r23
	ta	T_CHANGE_PRIV	! macro
	.word 0xc4342213  ! 721: STH_I	sth	%r2, [%r16 + 0x0213]
	.word 0xc36c0011  ! 723: PREFETCH_R	prefetch	[%r16 + %r17], #one_read
!Illinst alu
	.word 0x868c1f31  ! 724: ANDcc_R	andcc 	%r16, %r17, %r3
	.word 0xb4c40011  ! 726: ADDCcc_R	addccc 	%r16, %r17, %r26
	.word 0x8148c000  ! 726: RDHPR_HINTP	rdhpr	%hintp, %r0
thr2_irf_ce_50:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_50), 16, 16),1,IRF,ce,13,x, x,x,x, x,x,x)
	.word 0xf4742af1  ! 730: STX_I	stx	%r26, [%r16 + 0x0af1]
	.word 0x973c1011  ! 732: SRAX_R	srax	%r16, %r17, %r11
	.word 0x96940011  ! 732: ORcc_R	orcc 	%r16, %r17, %r11
	.word 0xc36c2b0a  ! 732: PREFETCH_I	prefetch	[%r16 + 0x0b0a], #one_read
!Illinst alu
	.word 0xb61c15b1  ! 733: XOR_R	xor 	%r16, %r17, %r27
	.word 0xb1343001  ! 735: SRLX_I	srlx	%r16, 0x0001, %r24
	.word 0xb01420e9  ! 735: OR_I	or 	%r16, 0x00e9, %r24
	.word 0x972c2001  ! 735: SLL_I	sll 	%r16, 0x0001, %r11
	.word 0x85840011  ! 735: WRCCR_R	wr	%r16, %r17, %ccr
	.word 0xd2242be7  ! 738: STW_I	stw	%r9, [%r16 + 0x0be7]
	.word 0x9c1c0011  ! 740: XOR_R	xor 	%r16, %r17, %r14
	.word 0x962c260c  ! 740: ANDN_I	andn 	%r16, 0x060c, %r11
	.word 0x93341011  ! 740: SRLX_R	srlx	%r16, %r17, %r9
	.word 0x0cc40003  ! 740: BRGZ	brgz  ,nt	%r16,<label_0x40003>
!Illinst store
	.word 0xca741ff1  ! 741: STX_R	stx	%r5, [%r16 + %r17]
	.word 0xae9c0011  ! 743: XORcc_R	xorcc 	%r16, %r17, %r23
	.word 0xac0c21b1  ! 743: AND_I	and 	%r16, 0x01b1, %r22
	.word 0xc3ec1011  ! 743: PREFETCHA_R	prefetcha	[%r16, %r17] 0x80, #one_read
	.word 0xf8242303  ! 746: STW_I	stw	%r28, [%r16 + 0x0303]
	.word 0xaf2c0011  ! 748: SLL_R	sll 	%r16, %r17, %r23
	.word 0x94bc0011  ! 748: XNORcc_R	xnorcc 	%r16, %r17, %r10
	.word 0x9be40011  ! 748: SAVE_R	save	%r16, %r17, %r13
thr2_irf_ce_51:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_51), 16, 16),1,IRF,ce,61,x, x,x,x, x,x,x)
	.word 0xf224262b  ! 752: STW_I	stw	%r25, [%r16 + 0x062b]
	.word 0xb0ac0011  ! 754: ANDNcc_R	andncc 	%r16, %r17, %r24
	.word 0xbabc240a  ! 754: XNORcc_I	xnorcc 	%r16, 0x040a, %r29
	.word 0xcd1421f8  ! 754: LDQF_I	-	[%r16, 0x01f8], %f6
thr2_irf_ce_52:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_52), 16, 16),1,IRF,ce,64,x, x,x,x, x,x,x)
	.word 0xd6242331  ! 758: STW_I	stw	%r11, [%r16 + 0x0331]
	.word 0xeab41011  ! 760: STHA_R	stha	%r21, [%r16 + %r17] 0x80
thr2_irf_ce_53:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_53), 16, 16),1,IRF,ce,47,x, x,x,x, x,x,x)
	.word 0xdc74210d  ! 764: STX_I	stx	%r14, [%r16 + 0x010d]
	.word 0x95643801  ! 766: MOVcc_I	<illegal instruction>
	.word 0xf85c0011  ! 766: LDX_R	ldx	[%r16 + %r17], %r28
!Illinst store
	.word 0xc2741771  ! 767: STX_R	stx	%r1, [%r16 + %r17]
	.word 0x88840011  ! 769: ADDcc_R	addcc 	%r16, %r17, %r4
	.word 0xb63c0011  ! 769: XNOR_R	xnor 	%r16, %r17, %r27
	.word 0x8c940011  ! 769: ORcc_R	orcc 	%r16, %r17, %r6
	.word 0xb8dc283f  ! 769: SMULcc_I	smulcc 	%r16, 0x083f, %r28
!Illinst alu
	.word 0x853c3d21  ! 770: SRA_I	srax	%r16, 0x0021, %r2
	.word 0x889c2e8d  ! 772: XORcc_I	xorcc 	%r16, 0x0e8d, %r4
	.word 0xad240011  ! 772: MULScc_R	mulscc 	%r16, %r17, %r22
!Illinst alu
	.word 0x900c1f31  ! 773: AND_R	and 	%r16, %r17, %r8
	.word 0x993c0011  ! 775: SRA_R	sra 	%r16, %r17, %r12
	.word 0x81dc0011  ! 775: FLUSH_R	flush
	.word 0x8a1c0011  ! 777: XOR_R	xor 	%r16, %r17, %r5
	.word 0x88c40011  ! 777: ADDCcc_R	addccc 	%r16, %r17, %r4
	.word 0xaf2c3001  ! 777: SLLX_I	sllx	%r16, 0x0001, %r23
	.word 0xb81c26b4  ! 777: XOR_I	xor 	%r16, 0x06b4, %r28
	.word 0xb3643801  ! 777: MOVcc_I	<illegal instruction>
	rd      %pc, %r18
	set     0x20, %r17
	.word 0xd4342fdb  ! 778: STH_I	sth	%r10, [%r16 + 0x0fdb]
	.word 0x9a442a1b  ! 780: ADDC_I	addc 	%r16, 0x0a1b, %r13
	.word 0x8a940011  ! 780: ORcc_R	orcc 	%r16, %r17, %r5
	jmpl     %r18 + %r17, %r31
!Illinst store
	.word 0xda241df1  ! 780: STW_R	stw	%r13, [%r16 + %r17]
	.word 0x83342001  ! 782: SRL_I	srl 	%r16, 0x0001, %r1
	.word 0x953c2001  ! 782: SRA_I	sra 	%r16, 0x0001, %r10
	.word 0xaebc2a48  ! 782: XNORcc_I	xnorcc 	%r16, 0x0a48, %r23
	.word 0xc36c0011  ! 782: PREFETCH_R	prefetch	[%r16 + %r17], #one_read
!Illinst alu
	.word 0xb0bc1f31  ! 783: XNORcc_R	xnorcc 	%r16, %r17, %r24
	.word 0x87641811  ! 785: MOVcc_R	<illegal instruction>
	.word 0x83341011  ! 785: SRLX_R	srlx	%r16, %r17, %r1
	.word 0x944c2d0d  ! 785: MULX_I	mulx 	%r16, 0x0d0d, %r10
!Illinst store
	.word 0xf8741531  ! 786: STX_R	stx	%r28, [%r16 + %r17]
	.word 0x9cb421ff  ! 788: ORNcc_I	orncc 	%r16, 0x01ff, %r14
	.word 0x832c2001  ! 788: SLL_I	sll 	%r16, 0x0001, %r1
	ta	T_CHANGE_HPRIV	! macro
!Illinst alu
	.word 0xa8ac1531  ! 789: ANDNcc_R	andncc 	%r16, %r17, %r20
	.word 0xa72c2001  ! 791: SLL_I	sll 	%r16, 0x0001, %r19
	.word 0x8abc0011  ! 791: XNORcc_R	xnorcc 	%r16, %r17, %r5
	.word 0x96840011  ! 791: ADDcc_R	addcc 	%r16, %r17, %r11
	ta	T_CHANGE_NONHPRIV	! macro
!Illinst store
	.word 0xc62415f1  ! 792: STW_R	stw	%r3, [%r16 + %r17]
	.word 0xba040011  ! 794: ADD_R	add 	%r16, %r17, %r29
	.word 0xc3ec264d  ! 794: PREFETCHA_I	prefetcha	[%r16, + 0x064d] %asi, #one_read
thr2_irf_ce_54:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_54), 16, 16),1,IRF,ce,11,x, x,x,x, x,x,x)
	.word 0xd47426db  ! 798: STX_I	stx	%r10, [%r16 + 0x06db]
	.word 0x929c240c  ! 800: XORcc_I	xorcc 	%r16, 0x040c, %r9
	.word 0x9284247b  ! 800: ADDcc_I	addcc 	%r16, 0x047b, %r9
	.word 0x8a840011  ! 800: ADDcc_R	addcc 	%r16, %r17, %r5
	.word 0x06800001  ! 800: BL	bl  	<label_0x1>
thr2_irf_ce_55:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_55), 16, 16),1,IRF,ce,3,x, x,x,x, x,x,x)
	.word 0xce342003  ! 804: STH_I	sth	%r7, [%r16 + 0x0003]
	.word 0x8a942c84  ! 806: ORcc_I	orcc 	%r16, 0x0c84, %r5
	.word 0x8e2c251a  ! 806: ANDN_I	andn 	%r16, 0x051a, %r7
	.word 0xc59c1011  ! 806: LDDFA_R	ldda	[%r16, %r17], %f2
	.word 0x9e8c0011  ! 808: ANDcc_R	andcc 	%r16, %r17, %r15
	.word 0x8e040011  ! 808: ADD_R	add 	%r16, %r17, %r7
	.word 0xb0942b53  ! 808: ORcc_I	orcc 	%r16, 0x0b53, %r24
	.word 0x8f2c0011  ! 808: SLL_R	sll 	%r16, %r17, %r7
	.word 0xa89c0011  ! 808: XORcc_R	xorcc 	%r16, %r17, %r20
	rd      %pc, %r18
	set     0x20, %r17
	.word 0xd63421a3  ! 809: STH_I	sth	%r11, [%r16 + 0x01a3]
	jmpl     %r18 + %r17, %r31
	.word 0xd6742197  ! 813: STX_I	stx	%r11, [%r16 + 0x0197]
	.word 0x8f2c3001  ! 815: SLLX_I	sllx	%r16, 0x0001, %r7
	.word 0x83880000  ! 815: RESTORED	restored
	.word 0x957c0411  ! 817: MOVR_R	movre	%r16, %r17, %r10
	.word 0xb83c27df  ! 817: XNOR_I	xnor 	%r16, 0x07df, %r28
	.word 0xb4940011  ! 817: ORcc_R	orcc 	%r16, %r17, %r26
	.word 0x928c268b  ! 817: ANDcc_I	andcc 	%r16, 0x068b, %r9
	.word 0x9ec40011  ! 817: ADDCcc_R	addccc 	%r16, %r17, %r15
	.word 0x832c1011  ! 817: SLLX_R	sllx	%r16, %r17, %r1
	rd      %pc, %r18
	set     0x20, %r17
thr2_irf_ce_56:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_56), 16, 16),1,IRF,ce,32,x, x,x,x, x,x,x)
	.word 0xd43420ab  ! 819: STH_I	sth	%r10, [%r16 + 0x00ab]
	.word 0x992c2001  ! 821: SLL_I	sll 	%r16, 0x0001, %r12
	.word 0x9a440011  ! 821: ADDC_R	addc 	%r16, %r17, %r13
	jmpl     %r18 + %r17, %r31
!Illinst store
	.word 0xc8241771  ! 821: STW_R	stw	%r4, [%r16 + %r17]
	.word 0x20800001  ! 823: BN	bn,a	<label_0x1>
!Illinst alu
	.word 0x921435eb  ! 824: OR_I	or 	%r16, 0xfffff5eb, %r9
	.word 0x9c8c2c90  ! 826: ANDcc_I	andcc 	%r16, 0x0c90, %r14
	.word 0xa80c0011  ! 826: AND_R	and 	%r16, %r17, %r20
	.word 0xd4d41011  ! 826: LDSHA_R	ldsha	[%r16, %r17] 0x80, %r10
	.word 0x84342c9b  ! 828: ORN_I	orn 	%r16, 0x0c9b, %r2
	.word 0xaa142731  ! 828: OR_I	or 	%r16, 0x0731, %r21
	.word 0x91343001  ! 828: SRLX_I	srlx	%r16, 0x0001, %r8
	.word 0x869c2f69  ! 828: XORcc_I	xorcc 	%r16, 0x0f69, %r3
	.word 0x937c0411  ! 828: MOVR_R	movre	%r16, %r17, %r9
	.word 0x852c2001  ! 828: SLL_I	sll 	%r16, 0x0001, %r2
	rd      %pc, %r18
	set     0x20, %r17
	.word 0xe674294f  ! 829: STX_I	stx	%r19, [%r16 + 0x094f]
	.word 0x9a8c2321  ! 831: ANDcc_I	andcc 	%r16, 0x0321, %r13
	jmpl     %r18 + %r17, %r31
!Illinst alu
	.word 0x9ebc1fb1  ! 831: XNORcc_R	xnorcc 	%r16, %r17, %r15
	.word 0xac1c2334  ! 833: XOR_I	xor 	%r16, 0x0334, %r22
	.word 0xaa040011  ! 833: ADD_R	add 	%r16, %r17, %r21
	.word 0xb0140011  ! 833: OR_R	or 	%r16, %r17, %r24
	.word 0xcf1c0011  ! 833: LDDF_R	ldd	[%r16, %r17], %f7
!Illinst alu
	.word 0x90843ff6  ! 834: ADDcc_I	addcc 	%r16, 0xfffffff6, %r8
	.word 0x8ad40011  ! 836: UMULcc_R	umulcc 	%r16, %r17, %r5
thr2_irf_ce_57:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_57), 16, 16),1,IRF,ce,34,x, x,x,x, x,x,x)
	.word 0xc4742d03  ! 840: STX_I	stx	%r2, [%r16 + 0x0d03]
	.word 0x82bc2a05  ! 842: XNORcc_I	xnorcc 	%r16, 0x0a05, %r1
	.word 0x972c3001  ! 842: SLLX_I	sllx	%r16, 0x0001, %r11
	.word 0x8143e004  ! 842: MEMBAR	membar	#LoadStore 
!Illinst store
	.word 0xe8241d71  ! 843: STW_R	stw	%r20, [%r16 + %r17]
	.word 0x86c42cb0  ! 845: ADDCcc_I	addccc 	%r16, 0x0cb0, %r3
	.word 0x91641811  ! 845: MOVcc_R	<illegal instruction>
	.word 0xa7341011  ! 845: SRLX_R	srlx	%r16, %r17, %r19
	.word 0xed140011  ! 845: LDQF_R	-	[%r16, %r17], %f22
!Illinst store
	.word 0xc22417f1  ! 846: STW_R	stw	%r1, [%r16 + %r17]
	.word 0xd4a4282b  ! 848: STWA_I	stwa	%r10, [%r16 + 0x082b] %asi
thr2_irf_ce_58:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_58), 16, 16),1,IRF,ce,50,x, x,x,x, x,x,x)
	.word 0xc4742239  ! 852: STX_I	stx	%r2, [%r16 + 0x0239]
	.word 0x964427ea  ! 854: ADDC_I	addc 	%r16, 0x07ea, %r11
	.word 0xa92c3001  ! 854: SLLX_I	sllx	%r16, 0x0001, %r20
	.word 0xcd3c0011  ! 854: STDF_R	std	%f6, [%r17, %r16]
thr2_irf_ce_59:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_59), 16, 16),1,IRF,ce,15,x, x,x,x, x,x,x)
	.word 0xd0742c99  ! 858: STX_I	stx	%r8, [%r16 + 0x0c99]
	.word 0xc4b41011  ! 860: STHA_R	stha	%r2, [%r16 + %r17] 0x80
!Illinst store
	.word 0xdc7417f1  ! 861: STX_R	stx	%r14, [%r16 + %r17]
	.word 0x97641811  ! 863: MOVcc_R	<illegal instruction>
	.word 0x98fc0011  ! 863: SDIVcc_R	sdivcc 	%r16, %r17, %r12
!Illinst store
	.word 0xca341ff1  ! 864: STH_R	sth	%r5, [%r16 + %r17]
	.word 0x8a1c2824  ! 866: XOR_I	xor 	%r16, 0x0824, %r5
	.word 0x853c0011  ! 866: SRA_R	sra 	%r16, %r17, %r2
	.word 0x90ac2ac9  ! 866: ANDNcc_I	andncc 	%r16, 0x0ac9, %r8
	.word 0xe8c42eeb  ! 866: LDSWA_I	ldswa	[%r16, + 0x0eeb] %asi, %r20
!Illinst store
	.word 0xd8241531  ! 867: STW_R	stw	%r12, [%r16 + %r17]
	.word 0xc87c0011  ! 869: SWAP_R	swap	%r4, [%r16 + %r17]
	.word 0xc42420f7  ! 872: STW_I	stw	%r2, [%r16 + 0x00f7]
	.word 0xaf7c0411  ! 874: MOVR_R	movre	%r16, %r17, %r23
	.word 0xb5641811  ! 874: MOVcc_R	<illegal instruction>
	.word 0x9d3c0011  ! 874: SRA_R	sra 	%r16, %r17, %r14
	.word 0x81dc2d08  ! 874: FLUSH_I	flush
!Illinst store
	.word 0xd6741db1  ! 875: STX_R	stx	%r11, [%r16 + %r17]
	.word 0x88440011  ! 877: ADDC_R	addc 	%r16, %r17, %r4
	.word 0x9a442607  ! 877: ADDC_I	addc 	%r16, 0x0607, %r13
	.word 0xdd841011  ! 877: LDFA_R	lda	[%r16, %r17], %f14
!Illinst store
	.word 0xda341571  ! 878: STH_R	sth	%r13, [%r16 + %r17]
	.word 0x869c251b  ! 880: XORcc_I	xorcc 	%r16, 0x051b, %r3
	.word 0x87641811  ! 880: MOVcc_R	<illegal instruction>
	.word 0xc36c28f4  ! 880: PREFETCH_I	prefetch	[%r16 + 0x08f4], #one_read
!Illinst alu
	.word 0x90341db1  ! 881: SUBC_R	orn 	%r16, %r17, %r8
	.word 0xacb420dc  ! 883: ORNcc_I	orncc 	%r16, 0x00dc, %r22
	.word 0xc3ec26d1  ! 883: PREFETCHA_I	prefetcha	[%r16, + 0x06d1] %asi, #one_read
thr2_irf_ce_60:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_60), 16, 16),1,IRF,ce,11,x, x,x,x, x,x,x)
	.word 0xd274239b  ! 887: STX_I	stx	%r9, [%r16 + 0x039b]
	.word 0x8e1c24dd  ! 889: XOR_I	xor 	%r16, 0x04dd, %r7
	.word 0xa9343001  ! 889: SRLX_I	srlx	%r16, 0x0001, %r20
	.word 0x889c0011  ! 889: XORcc_R	xorcc 	%r16, %r17, %r4
thr2_resum_intr_745:
!$EV trig_pc_d(2,expr(@VA(.MAIN.thr2_resum_intr_745), 16, 16)) -> intp(2, 3, 1)
	wr      %r0, 0x0, %asr26
!Illinst store
	.word 0xcc341531  ! 890: STH_R	sth	%r6, [%r16 + %r17]
	.word 0x8ec40011  ! 892: ADDCcc_R	addccc 	%r16, %r17, %r7
        wr %g0, 0x4, %fprs
!Illinst alu
	.word 0xa92c3f61  ! 893: SLLX_I	sllx	%r16, 0x0021, %r20
	.word 0xb4942b66  ! 895: ORcc_I	orcc 	%r16, 0x0b66, %r26
	.word 0xb23c0011  ! 895: XNOR_R	xnor 	%r16, %r17, %r25
	.word 0x8d343001  ! 895: SRLX_I	srlx	%r16, 0x0001, %r6
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xca742d13  ! 898: STX_I	stx	%r5, [%r16 + 0x0d13]
	.word 0x9a840011  ! 900: ADDcc_R	addcc 	%r16, %r17, %r13
	.word 0x9e94214d  ! 900: ORcc_I	orcc 	%r16, 0x014d, %r15
	.word 0x90bc2398  ! 900: XNORcc_I	xnorcc 	%r16, 0x0398, %r8
	.word 0xb2dc220e  ! 900: SMULcc_I	smulcc 	%r16, 0x020e, %r25
!Illinst alu
	.word 0x82a43fe6  ! 901: SUBcc_I	subcc 	%r16, 0xffffffe6, %r1
	.word 0xb53c0011  ! 903: SRA_R	sra 	%r16, %r17, %r26
	.word 0xb61c0011  ! 903: XOR_R	xor 	%r16, %r17, %r27
	ta	T_CHANGE_PRIV	! macro
!Illinst alu
	.word 0x962c1d31  ! 904: ANDN_R	andn 	%r16, %r17, %r11
	.word 0xad7c0411  ! 906: MOVR_R	movre	%r16, %r17, %r22
	.word 0x83a408b1  ! 906: FSUBs	fsubs	%f16, %f17, %f1
!Illinst alu
	.word 0x90241fb1  ! 907: SUB_R	sub 	%r16, %r17, %r8
	.word 0x9e840011  ! 909: ADDcc_R	addcc 	%r16, %r17, %r15
	.word 0xa82c0011  ! 909: ANDN_R	andn 	%r16, %r17, %r20
	.word 0xba14290a  ! 909: OR_I	or 	%r16, 0x090a, %r29
	.word 0xfb140011  ! 909: LDQF_R	-	[%r16, %r17], %f29
!Illinst alu
	.word 0x86341f31  ! 910: ORN_R	orn 	%r16, %r17, %r3
	.word 0xd26c0011  ! 912: LDSTUB_R	ldstub	%r9, [%r16 + %r17]
	.word 0x97340011  ! 914: SRL_R	srl 	%r16, %r17, %r11
	.word 0xb2442ce3  ! 914: ADDC_I	addc 	%r16, 0x0ce3, %r25
	.word 0x872c1011  ! 914: SLLX_R	sllx	%r16, %r17, %r3
	.word 0x982c0011  ! 914: ANDN_R	andn 	%r16, %r17, %r12
	rd      %pc, %r18
	set     0x20, %r17
thr2_irf_ce_61:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_61), 16, 16),1,IRF,ce,55,x, x,x,x, x,x,x)
	.word 0xc42420ed  ! 916: STW_I	stw	%r2, [%r16 + 0x00ed]
	.word 0x8a3c21d9  ! 918: XNOR_I	xnor 	%r16, 0x01d9, %r5
	.word 0x9cc40011  ! 918: ADDCcc_R	addccc 	%r16, %r17, %r14
	.word 0xab340011  ! 918: SRL_R	srl 	%r16, %r17, %r21
	return     %r18 + %r17
!Illinst store
	.word 0xf4341d31  ! 918: STH_R	sth	%r26, [%r16 + %r17]
	.word 0xb2340011  ! 920: ORN_R	orn 	%r16, %r17, %r25
	.word 0x827420c1  ! 920: UDIV_I	udiv 	%r16, 0x00c1, %r1
	.word 0xe6742f0b  ! 923: STX_I	stx	%r19, [%r16 + 0x0f0b]
	.word 0x9e2c0011  ! 925: ANDN_R	andn 	%r16, %r17, %r15
        wr  %g0, 0x80, %asi
	.word 0xd2742c47  ! 928: STX_I	stx	%r9, [%r16 + 0x0c47]
	.word 0xb13c2001  ! 930: SRA_I	sra 	%r16, 0x0001, %r24
	.word 0x8c840011  ! 930: ADDcc_R	addcc 	%r16, %r17, %r6
	.word 0x9f802a4f  ! 930: SIR	sir	0x0a4f
!Illinst store
	.word 0xd4341f71  ! 931: STH_R	sth	%r10, [%r16 + %r17]
	.word 0xc3ec1011  ! 933: PREFETCHA_R	prefetcha	[%r16, %r17] 0x80, #one_read
!Illinst alu
	.word 0x84843fa0  ! 934: ADDcc_I	addcc 	%r16, 0xffffffa0, %r2
	.word 0xb4840011  ! 936: ADDcc_R	addcc 	%r16, %r17, %r26
	.word 0xcbf42011  ! 936: CASXA_R	casxa	[%r16]%asi, %r17, %r5
!Illinst store
	.word 0xc6341ff1  ! 937: STH_R	sth	%r3, [%r16 + %r17]
	.word 0xb0940011  ! 939: ORcc_R	orcc 	%r16, %r17, %r24
	.word 0x9e8c0011  ! 939: ANDcc_R	andcc 	%r16, %r17, %r15
	.word 0x9f802bbf  ! 939: SIR	sir	0x0bbf
thr2_irf_ce_62:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_62), 16, 16),1,IRF,ce,21,x, x,x,x, x,x,x)
	.word 0xde7429ff  ! 943: STX_I	stx	%r15, [%r16 + 0x09ff]
	.word 0x88ac280c  ! 945: ANDNcc_I	andncc 	%r16, 0x080c, %r4
	.word 0xbba84831  ! 945: FMOVE	fmovs	%fcc1, %f17, %f29
	.word 0xc4242ffd  ! 948: STW_I	stw	%r2, [%r16 + 0x0ffd]
	.word 0x9cbc0011  ! 950: XNORcc_R	xnorcc 	%r16, %r17, %r14
	.word 0x9ab4217a  ! 950: ORNcc_I	orncc 	%r16, 0x017a, %r13
	.word 0x81538000  ! 950: RDPR_WSTATE	rdpr	%wstate, %r0
thr2_irf_ce_63:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_63), 16, 16),1,IRF,ce,24,x, x,x,x, x,x,x)
	.word 0xce34290d  ! 954: STH_I	sth	%r7, [%r16 + 0x090d]
	.word 0x82ac235f  ! 956: ANDNcc_I	andncc 	%r16, 0x035f, %r1
	.word 0x849c2214  ! 956: XORcc_I	xorcc 	%r16, 0x0214, %r2
	.word 0x96c4239e  ! 956: ADDCcc_I	addccc 	%r16, 0x039e, %r11
	.word 0xc3ec1011  ! 956: PREFETCHA_R	prefetcha	[%r16, %r17] 0x80, #one_read
!Illinst store
	.word 0xf2241ff1  ! 957: STW_R	stw	%r25, [%r16 + %r17]
	.word 0xa69c2401  ! 959: XORcc_I	xorcc 	%r16, 0x0401, %r19
	.word 0x9aac0011  ! 959: ANDNcc_R	andncc 	%r16, %r17, %r13
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xd02425ab  ! 962: STW_I	stw	%r8, [%r16 + 0x05ab]
        wr  %g0, 0x80, %asi
!Illinst store
	.word 0xf47417f1  ! 965: STX_R	stx	%r26, [%r16 + %r17]
	.word 0xc9f42011  ! 967: CASXA_R	casxa	[%r16]%asi, %r17, %r4
!Illinst alu
	.word 0xa93c35e1  ! 968: SRAX_I	srax	%r16, 0x0021, %r20
	.word 0x81580000  ! 970: FLUSHW	flushw
	.word 0xda342ccb  ! 973: STH_I	sth	%r13, [%r16 + 0x0ccb]
	.word 0xb3342001  ! 975: SRL_I	srl 	%r16, 0x0001, %r25
	.word 0xc2ec267d  ! 975: LDSTUBA_I	ldstuba	%r1, [%r16 + 0x067d] %asi
!Illinst store
	.word 0xf6741ff1  ! 976: STX_R	stx	%r27, [%r16 + %r17]
	.word 0xec8c1011  ! 978: LDUBA_R	lduba	[%r16, %r17] 0x80, %r22
thr2_irf_ce_64:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_64), 16, 16),1,IRF,ce,41,x, x,x,x, x,x,x)
	.word 0xda742647  ! 982: STX_I	stx	%r13, [%r16 + 0x0647]
	.word 0xb32c3001  ! 984: SLLX_I	sllx	%r16, 0x0001, %r25
	.word 0x873c1011  ! 984: SRAX_R	srax	%r16, %r17, %r3
        wr %g0, 0x4, %fprs
!Illinst alu
	.word 0xb01c3fee  ! 985: XOR_I	xor 	%r16, 0xffffffee, %r24
	.word 0x84940011  ! 987: ORcc_R	orcc 	%r16, %r17, %r2
	.word 0x9f80249b  ! 987: SIR	sir	0x049b
	.word 0x8eb42cd1  ! 989: ORNcc_I	orncc 	%r16, 0x0cd1, %r7
	.word 0x881c2336  ! 989: XOR_I	xor 	%r16, 0x0336, %r4
	.word 0x882c2886  ! 989: ANDN_I	andn 	%r16, 0x0886, %r4
	.word 0x9d2c0011  ! 989: SLL_R	sll 	%r16, %r17, %r14
	.word 0x84940011  ! 989: ORcc_R	orcc 	%r16, %r17, %r2
	rd      %pc, %r18
	set     0x20, %r17
thr2_irf_ce_65:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_65), 16, 16),1,IRF,ce,57,x, x,x,x, x,x,x)
	.word 0xc67420a1  ! 991: STX_I	stx	%r3, [%r16 + 0x00a1]
	return     %r18 + %r17
thr2_irf_ce_66:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_66), 16, 16),1,IRF,ce,28,x, x,x,x, x,x,x)
	.word 0xc6242a0f  ! 996: STW_I	stw	%r3, [%r16 + 0x0a0f]
	.word 0xa6ac0011  ! 998: ANDNcc_R	andncc 	%r16, %r17, %r19
	.word 0x2a800003  ! 998: BCS	bcs,a	<label_0x3>
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
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
        setx  0x0000000000000ff0, %g1, %r17
        setx  0xe59ee19f713c7d78, %g1, %r0
        setx  0x6e8adf7eba5cc069, %g1, %r1
        setx  0xb1a530f7c81db3ed, %g1, %r2
        setx  0xf5af07e6e4e7c135, %g1, %r3
        setx  0x958e44132bda7a53, %g1, %r4
        setx  0x368c6c100dfd732d, %g1, %r5
        setx  0xf4235b192eed6990, %g1, %r6
        setx  0x8c1fe1a6e50ef206, %g1, %r7
        setx  0x9beadc6dcfec65b0, %g1, %r8
        setx  0xb1428d457ecc314b, %g1, %r9
        setx  0x0e5f67a94b05e582, %g1, %r10
        setx  0x4df90823b6c729c1, %g1, %r11
        setx  0x8ce608aa93286069, %g1, %r12
        setx  0xbe7701e346474d32, %g1, %r13
        setx  0xaf71a35895f23e1d, %g1, %r14
        setx  0x3d20a9bdb347562e, %g1, %r15
        setx  0x34f9d668fa066137, %g1, %r18
        setx  0x243c173e0652d8be, %g1, %r19
        setx  0x7b3df994264ddc68, %g1, %r20
        setx  0x2e5c4b522f2f68fa, %g1, %r21
        setx  0xfa07434922c1dc6f, %g1, %r22
        setx  0xd7804802418665af, %g1, %r23
        setx  0x34fe5599ecdce836, %g1, %r24
        setx  0xe68ec467f2f6f8ea, %g1, %r25
        setx  0xb521c5596a5c98d3, %g1, %r26
        setx  0x120e507780abf025, %g1, %r27
        setx  0x1a3aba2175d123da, %g1, %r28
        setx  0xb5dab4ab4bcaaa8d, %g1, %r29
        setx  0x5d65204c9deab1e1, %g1, %r30
        setx  0xf83a6ea7bb0f4c4b, %g1, %r31
	save %r0, %r0, %r31
        setx  MAIN_BASE_DATA_VA, %r1, %r16
        setx  0x0000000000000d10, %g1, %r17
        setx  0x0e34be879708ffd4, %g1, %r0
        setx  0xf3836eda4f33ed96, %g1, %r1
        setx  0x1d96b68272440616, %g1, %r2
        setx  0x9a303bdaaa579974, %g1, %r3
        setx  0xc00142fac4a07289, %g1, %r4
        setx  0x0dece879fc03f8fb, %g1, %r5
        setx  0x9c1952f46c231427, %g1, %r6
        setx  0x28de192ae00df490, %g1, %r7
        setx  0x0e1190e2fa61a8ee, %g1, %r8
        setx  0x0e0f696e1ccfe3cc, %g1, %r9
        setx  0x9cf7b2ab118ef69b, %g1, %r10
        setx  0x518fe92b8217bfc4, %g1, %r11
        setx  0x153a09e07da4ec16, %g1, %r12
        setx  0xcc6aa94810d477a9, %g1, %r13
        setx  0x4ca7351a454b50fb, %g1, %r14
        setx  0x6f8518f550673047, %g1, %r15
        setx  0xdf9a7410fd1b2214, %g1, %r18
        setx  0x8a061ee1df540a98, %g1, %r19
        setx  0x6a6a72d72bd34b6b, %g1, %r20
        setx  0x86d5395014444bcd, %g1, %r21
        setx  0xffa6512926f7fa9b, %g1, %r22
        setx  0xf2e67f282eda8c33, %g1, %r23
        setx  0x8bb12bb93831afcd, %g1, %r24
        setx  0x7ed227d9b8f7cf32, %g1, %r25
        setx  0xb2f0fd733b832b00, %g1, %r26
        setx  0xd3834f8fac79b425, %g1, %r27
        setx  0xf6700fc7f4804935, %g1, %r28
        setx  0x66f966bb0f3106b2, %g1, %r29
        setx  0x51056b473768a097, %g1, %r30
        setx  0x8f6f9d1af68cee91, %g1, %r31
	save %r0, %r0, %r31
        setx  MAIN_BASE_DATA_VA, %r1, %r16
        setx  0x0000000000000bb0, %g1, %r17
        setx  0xb442c250d5fffcec, %g1, %r0
        setx  0xb19900916f627670, %g1, %r1
        setx  0xc549b5599ed18d5e, %g1, %r2
        setx  0xd945cabb2def773d, %g1, %r3
        setx  0xc8485bcd11ad8a5e, %g1, %r4
        setx  0xe993ae3d94d37498, %g1, %r5
        setx  0x8039f4a20ad47776, %g1, %r6
        setx  0x156ed4d2c6d4ab99, %g1, %r7
        setx  0x5e7be7dcf81eb3fa, %g1, %r8
        setx  0x9a2fd5644eeac6f3, %g1, %r9
        setx  0x0b9aa7b24d969327, %g1, %r10
        setx  0x0991067bcb3f2078, %g1, %r11
        setx  0xa4d437360e25bca2, %g1, %r12
        setx  0xb26e77d9a8382b23, %g1, %r13
        setx  0xa2e23211785c7226, %g1, %r14
        setx  0x4e251fc29e084b62, %g1, %r15
        setx  0x0d9b8371e58ef270, %g1, %r18
        setx  0x62cf8c81ce026ea4, %g1, %r19
        setx  0xfae8d91e72028bd4, %g1, %r20
        setx  0x70dc45b58a6daf87, %g1, %r21
        setx  0x21d64948e1aab29b, %g1, %r22
        setx  0xd32ea4bf9903138b, %g1, %r23
        setx  0x6dc97fe3144c004a, %g1, %r24
        setx  0xc6a14493790336ba, %g1, %r25
        setx  0xf215fb5c7600886c, %g1, %r26
        setx  0xf2419a561cec3fd4, %g1, %r27
        setx  0xc41c046f19c6ba9b, %g1, %r28
        setx  0x93a41b5e73ab7896, %g1, %r29
        setx  0x3eb193eb2dba75d9, %g1, %r30
        setx  0xd3c035b2e0efaf65, %g1, %r31
	save %r0, %r0, %r31
        setx  MAIN_BASE_DATA_VA, %r1, %r16
        setx  0x0000000000000750, %g1, %r17
        setx  0xd363b1ebd5a13f69, %g1, %r0
        setx  0x79593687d73f0e46, %g1, %r1
        setx  0x264239bd190a4421, %g1, %r2
        setx  0x230f676e582ff030, %g1, %r3
        setx  0xf24eb05f265a647b, %g1, %r4
        setx  0x6194e8a2c1cae5ea, %g1, %r5
        setx  0xd48411215edd5bae, %g1, %r6
        setx  0x1f58765e38519b0c, %g1, %r7
        setx  0x24ec9eecc5d90737, %g1, %r8
        setx  0x163892f861ebb55b, %g1, %r9
        setx  0xe29e3ef65ff4c611, %g1, %r10
        setx  0xee36c297dcdce333, %g1, %r11
        setx  0x1f57cc18e51acc4a, %g1, %r12
        setx  0x2c23b3dbdc8086ab, %g1, %r13
        setx  0xa3bb7a3979c43ec2, %g1, %r14
        setx  0x9d26f797d89f0f68, %g1, %r15
        setx  0xbd5d1817ec9d82bf, %g1, %r18
        setx  0x9b908f741d1d208e, %g1, %r19
        setx  0xbdf41ddfec4347d5, %g1, %r20
        setx  0x18bdc5fe78926d6a, %g1, %r21
        setx  0x2790987ee3ffc59c, %g1, %r22
        setx  0xe1582f8e6075ca5a, %g1, %r23
        setx  0x4ed4b296cc7ff0bb, %g1, %r24
        setx  0x0a4185edbc7b6487, %g1, %r25
        setx  0xc9c1a1dbc6d9bd4b, %g1, %r26
        setx  0xd18d0c628a9383d0, %g1, %r27
        setx  0x2fdbfbe9e88d9a2d, %g1, %r28
        setx  0x95e74f6f74f712bf, %g1, %r29
        setx  0xc5d3cc693bbced78, %g1, %r30
        setx  0xdd7ca274fc9c79e7, %g1, %r31
	save %r0, %r0, %r31
        setx  MAIN_BASE_DATA_VA, %r1, %r16
        setx  0x0000000000000b90, %g1, %r17
        setx  0x743967b784ada4d0, %g1, %r0
        setx  0xd25e8632195393c5, %g1, %r1
        setx  0x4ce88eef04204892, %g1, %r2
        setx  0x6d787ad6ffd384ea, %g1, %r3
        setx  0x72ff09ab77bb6d62, %g1, %r4
        setx  0x6c31313233bdee05, %g1, %r5
        setx  0x11266575d82d1d6d, %g1, %r6
        setx  0x0dced4bbcb13e469, %g1, %r7
        setx  0x9ceaa27e1df92020, %g1, %r8
        setx  0x82f3cfb0543a1b34, %g1, %r9
        setx  0xb646331c888edc8c, %g1, %r10
        setx  0x9284a73caca5e67f, %g1, %r11
        setx  0x104b9a258f05d5bf, %g1, %r12
        setx  0x60cb4cc62f30517e, %g1, %r13
        setx  0xba52433ccb811934, %g1, %r14
        setx  0x0cce935d160bba07, %g1, %r15
        setx  0xbfd73736935d28ef, %g1, %r18
        setx  0xaf5ba015d0b9b826, %g1, %r19
        setx  0x24def60d481e5df9, %g1, %r20
        setx  0x6c37b21e5272267c, %g1, %r21
        setx  0x45efefa547f364a3, %g1, %r22
        setx  0x0c51872ddc4f23ee, %g1, %r23
        setx  0x320282d29fbaaf69, %g1, %r24
        setx  0xfdbc812bb95299c3, %g1, %r25
        setx  0x0327275043400d69, %g1, %r26
        setx  0xb7a89881dc7f1e5f, %g1, %r27
        setx  0x5cb0562434f796a9, %g1, %r28
        setx  0x8ca4d2d3aa787dfb, %g1, %r29
        setx  0xd55887780baef732, %g1, %r30
        setx  0xc81689c692b2e9a8, %g1, %r31
	save %r0, %r0, %r31
        setx  MAIN_BASE_DATA_VA, %r1, %r16
        setx  0x00000000000002e0, %g1, %r17
        setx  0x65ab8e86b4f9256f, %g1, %r0
        setx  0x9e5c3d7c279d7392, %g1, %r1
        setx  0x0cbc174476388228, %g1, %r2
        setx  0x16d9276e5707b52a, %g1, %r3
        setx  0x46c686b7dcbea158, %g1, %r4
        setx  0x2337b388f23a2517, %g1, %r5
        setx  0xf4d94c9c99d8741f, %g1, %r6
        setx  0x634bbf9df1b68e11, %g1, %r7
        setx  0xd594e25fc06d7580, %g1, %r8
        setx  0x89512238826f85e7, %g1, %r9
        setx  0xcbcdd5a617e0c155, %g1, %r10
        setx  0x6376233d348c02be, %g1, %r11
        setx  0x94694374b4c33071, %g1, %r12
        setx  0x5d4e52f9af8c3bbe, %g1, %r13
        setx  0x16075073a96a4419, %g1, %r14
        setx  0x5d08fe87e8ec8f9f, %g1, %r15
        setx  0xf70b9d96983523bb, %g1, %r18
        setx  0xd2918491ae3d1e35, %g1, %r19
        setx  0xa45926b8e96a7341, %g1, %r20
        setx  0x60012fa613a8d609, %g1, %r21
        setx  0x3de6ca134f77366e, %g1, %r22
        setx  0xcf00f5f134b5e199, %g1, %r23
        setx  0xf69f920959f2fd93, %g1, %r24
        setx  0x4bb7bb2150adab57, %g1, %r25
        setx  0x2d98524e0a4414b9, %g1, %r26
        setx  0x2e1dbeafa7b5f982, %g1, %r27
        setx  0x25eb435199e00c59, %g1, %r28
        setx  0xf48efe8760cd9be3, %g1, %r29
        setx  0x5a707035dcfb9664, %g1, %r30
        setx  0x5da594381964203c, %g1, %r31
	save %r0, %r0, %r31
        setx  MAIN_BASE_DATA_VA, %r1, %r16
        setx  0x0000000000000170, %g1, %r17
        setx  0x134576e34ab9f698, %g1, %r0
        setx  0x619b9e12e00587bf, %g1, %r1
        setx  0x08dd1d546a03392f, %g1, %r2
        setx  0xf014fb2b9a21a8cd, %g1, %r3
        setx  0x5c447e996f0bba9e, %g1, %r4
        setx  0x487cc6c8c0079ec7, %g1, %r5
        setx  0x048340e831d966aa, %g1, %r6
        setx  0x99131114970c10a0, %g1, %r7
        setx  0xa03289e8daee4e36, %g1, %r8
        setx  0xb3c133f6ca44f55c, %g1, %r9
        setx  0x279ce24808eeb5f0, %g1, %r10
        setx  0x936ed714ff597450, %g1, %r11
        setx  0x14987bded2b12ad9, %g1, %r12
        setx  0x45d37d7d0cbc478c, %g1, %r13
        setx  0xa9aa8b2fddebbc34, %g1, %r14
        setx  0x5ac80a37bf21b5ac, %g1, %r15
        setx  0x8f4fd48997a4da7c, %g1, %r18
        setx  0xcf8c589d2096d8ef, %g1, %r19
        setx  0xe0740d50a186ed26, %g1, %r20
        setx  0x353dbcb2d7ee6cba, %g1, %r21
        setx  0x7295fa051c97d325, %g1, %r22
        setx  0x755b8ab5f823f309, %g1, %r23
        setx  0x9fb12dacb9b5e509, %g1, %r24
        setx  0x1e6d777cda967f87, %g1, %r25
        setx  0xbb73ab633dc6cf98, %g1, %r26
        setx  0x8db73fe8fd8df3f2, %g1, %r27
        setx  0xfc62363d48f60874, %g1, %r28
        setx  0xe4a0a0f928d62226, %g1, %r29
        setx  0x667676e81aeeb497, %g1, %r30
        setx  0xf998d8750140b023, %g1, %r31
	save %r0, %r0, %r31
        setx  MAIN_BASE_DATA_VA, %r1, %r16
        setx  0x0000000000000160, %g1, %r17
        setx  0xbfbf91088de1dbff, %g1, %r0
        setx  0x6ab890018427c4de, %g1, %r1
        setx  0x3eaa62dbe9f9e15c, %g1, %r2
        setx  0x0400fbf540c15b6e, %g1, %r3
        setx  0x85493620093b1985, %g1, %r4
        setx  0xa0eefa20e66be2e6, %g1, %r5
        setx  0x9569e3350327436d, %g1, %r6
        setx  0x8d480ef39d4e6890, %g1, %r7
        setx  0x8211e891eef518c4, %g1, %r8
        setx  0x586251f00d3f4277, %g1, %r9
        setx  0x56e918eabbaadc65, %g1, %r10
        setx  0x925e0bab92c7402b, %g1, %r11
        setx  0x6c73db9c57d35baf, %g1, %r12
        setx  0x603c591c48cb7b1e, %g1, %r13
        setx  0x4a6184da9159b794, %g1, %r14
        setx  0x5b3869509b822c68, %g1, %r15
        setx  0xd875b93859305c20, %g1, %r18
        setx  0x9faed701fd95fe20, %g1, %r19
        setx  0x93799cc89610f178, %g1, %r20
        setx  0xeb3d64dae97aae09, %g1, %r21
        setx  0x27a47e43c39efd46, %g1, %r22
        setx  0x688c15c05dd0b8bf, %g1, %r23
        setx  0x44d2db6bd21e9a45, %g1, %r24
        setx  0x5cff90ac7ea9ed1b, %g1, %r25
        setx  0x21b45f331544a53d, %g1, %r26
        setx  0xabf1d4ea97e6235e, %g1, %r27
        setx  0x2747d0266fa2afb7, %g1, %r28
        setx  0x27833be7208f4aa1, %g1, %r29
        setx  0xc924c8194d448ffd, %g1, %r30
        setx  0xc567ae4d9754d0ad, %g1, %r31
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
	.word 0xc2242b55  ! 3: STW_I	stw	%r1, [%r16 + 0x0b55]
	.word 0x90440011  ! 5: ADDC_R	addc 	%r16, %r17, %r8
	.word 0x868c28d0  ! 5: ANDcc_I	andcc 	%r16, 0x08d0, %r3
	.word 0xf93c28dc  ! 5: STDF_I	std	%f28, [0x08dc, %r16]
thr1_irf_ce_0:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_0), 16, 16),1,IRF,ce,21,x, x,x,x, x,x,x)
	.word 0xf2242fa3  ! 9: STW_I	stw	%r25, [%r16 + 0x0fa3]
	.word 0x92840011  ! 11: ADDcc_R	addcc 	%r16, %r17, %r9
	.word 0xa88c0011  ! 11: ANDcc_R	andcc 	%r16, %r17, %r20
	ta	T_CHANGE_PRIV	! macro
thr1_irf_ce_1:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_1), 16, 16),1,IRF,ce,36,x, x,x,x, x,x,x)
	.word 0xc6742307  ! 15: STX_I	stx	%r3, [%r16 + 0x0307]
	.word 0x961c0011  ! 17: XOR_R	xor 	%r16, %r17, %r11
	.word 0x92842c2c  ! 17: ADDcc_I	addcc 	%r16, 0x0c2c, %r9
	.word 0x837c0411  ! 17: MOVR_R	movre	%r16, %r17, %r1
	rd      %asr26, %r31
	set     0x01f05, %r30
	and     %r31, %r30, %r31
	.word 0xd8242ee3  ! 20: STW_I	stw	%r12, [%r16 + 0x0ee3]
	.word 0x90f42e0e  ! 22: UDIVcc_I	udivcc 	%r16, 0x0e0e, %r8
!Illinst store
	.word 0xcc241f71  ! 23: STW_R	stw	%r6, [%r16 + %r17]
	.word 0xb72c3001  ! 25: SLLX_I	sllx	%r16, 0x0001, %r27
	.word 0x94140011  ! 25: OR_R	or 	%r16, %r17, %r10
thr1_resum_intr_737:
!$EV trig_pc_d(1,expr(@VA(.MAIN.thr1_resum_intr_737), 16, 16)) -> intp(1, 3, 1)
	wr      %r0, 0x4, %asr26
	.word 0xc42421d3  ! 28: STW_I	stw	%r2, [%r16 + 0x01d3]
	.word 0xdcfc1011  ! 30: SWAPA_R	swapa	%r14, [%r16 + %r17] 0x80
!Illinst alu
	.word 0x868417b1  ! 31: ADDcc_R	addcc 	%r16, %r17, %r3
	.word 0xbab40011  ! 33: ORNcc_R	orncc 	%r16, %r17, %r29
thr1_resum_intr_738:
!$EV trig_pc_d(1,expr(@VA(.MAIN.thr1_resum_intr_738), 16, 16)) -> intp(1, 3, 1)
	wr      %r0, 0x4, %asr26
thr1_irf_ce_2:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_2), 16, 16),1,IRF,ce,63,x, x,x,x, x,x,x)
	.word 0xe8342eb5  ! 37: STH_I	sth	%r20, [%r16 + 0x0eb5]
	.word 0x84b40011  ! 39: ORNcc_R	orncc 	%r16, %r17, %r2
	.word 0xd8ac1011  ! 39: STBA_R	stba	%r12, [%r16 + %r17] 0x80
	.word 0xdc7422ef  ! 42: STX_I	stx	%r14, [%r16 + 0x02ef]
	.word 0x9c3c20c3  ! 44: XNOR_I	xnor 	%r16, 0x00c3, %r14
	.word 0x88040011  ! 44: ADD_R	add 	%r16, %r17, %r4
	.word 0xf4ec2cfd  ! 44: LDSTUBA_I	ldstuba	%r26, [%r16 + 0x0cfd] %asi
	.word 0x9e2c0011  ! 46: ANDN_R	andn 	%r16, %r17, %r15
	.word 0x8cbc0011  ! 46: XNORcc_R	xnorcc 	%r16, %r17, %r6
	.word 0x9a0c0011  ! 46: AND_R	and 	%r16, %r17, %r13
	.word 0x860425d2  ! 46: ADD_I	add 	%r16, 0x05d2, %r3
	.word 0xa61c0011  ! 46: XOR_R	xor 	%r16, %r17, %r19
	rd      %pc, %r18
	set     0x20, %r17
thr1_irf_ce_3:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_3), 16, 16),1,IRF,ce,22,x, x,x,x, x,x,x)
	.word 0xcc7423ef  ! 48: STX_I	stx	%r6, [%r16 + 0x03ef]
	.word 0xa7343001  ! 50: SRLX_I	srlx	%r16, 0x0001, %r19
	.word 0x86340011  ! 50: ORN_R	orn 	%r16, %r17, %r3
	.word 0x8f2c3001  ! 50: SLLX_I	sllx	%r16, 0x0001, %r7
	jmpl     %r18 + %r17, %r31
thr1_irf_ce_4:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_4), 16, 16),1,IRF,ce,26,x, x,x,x, x,x,x)
	.word 0xf634242f  ! 53: STH_I	sth	%r27, [%r16 + 0x042f]
	.word 0x81880000  ! 55: SAVED	saved
thr1_irf_ce_5:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_5), 16, 16),1,IRF,ce,70,x, x,x,x, x,x,x)
	.word 0xf6742fa1  ! 59: STX_I	stx	%r27, [%r16 + 0x0fa1]
	.word 0xb37c0411  ! 61: MOVR_R	movre	%r16, %r17, %r25
	.word 0x842c0011  ! 61: ANDN_R	andn 	%r16, %r17, %r2
	.word 0x93ec0011  ! 61: RESTORE_R	restore	%r16, %r17, %r9
thr1_irf_ce_6:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_6), 16, 16),1,IRF,ce,29,x, x,x,x, x,x,x)
	.word 0xc22427ef  ! 65: STW_I	stw	%r1, [%r16 + 0x07ef]
	.word 0x9f802025  ! 67: SIR	sir	0x0025
!Illinst alu
	.word 0xb84417b1  ! 68: ADDC_R	addc 	%r16, %r17, %r28
	.word 0x94c40011  ! 70: ADDCcc_R	addccc 	%r16, %r17, %r10
	.word 0xb614230d  ! 70: OR_I	or 	%r16, 0x030d, %r27
	.word 0xed841011  ! 70: LDFA_R	lda	[%r16, %r17], %f22
!Illinst store
	.word 0xc6341f71  ! 71: STH_R	sth	%r3, [%r16 + %r17]
	.word 0x8f3c2001  ! 73: SRA_I	sra 	%r16, 0x0001, %r7
	.word 0xf7242ab9  ! 73: STF_I	st	%f27, [0x0ab9, %r16]
	.word 0x929c0011  ! 75: XORcc_R	xorcc 	%r16, %r17, %r9
	.word 0x8a3c24fd  ! 75: XNOR_I	xnor 	%r16, 0x04fd, %r5
	.word 0x9a2c0011  ! 75: ANDN_R	andn 	%r16, %r17, %r13
	.word 0xb0bc2151  ! 75: XNORcc_I	xnorcc 	%r16, 0x0151, %r24
	.word 0x9a8c2e77  ! 75: ANDcc_I	andcc 	%r16, 0x0e77, %r13
	.word 0xac0c0011  ! 75: AND_R	and 	%r16, %r17, %r22
	rd      %pc, %r18
	set     0x20, %r17
	.word 0xd83429f7  ! 76: STH_I	sth	%r12, [%r16 + 0x09f7]
	.word 0xb77c2401  ! 78: MOVR_I	movre	%r16, 0x1, %r27
	.word 0x94bc0011  ! 78: XNORcc_R	xnorcc 	%r16, %r17, %r10
	return     %r18 + %r17
	.word 0xee242785  ! 80: STW_I	stw	%r23, [%r16 + 0x0785]
	.word 0xdaf4211a  ! 82: STXA_I	stxa	%r13, [%r16 + 0x011a] %asi
thr1_irf_ce_7:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_7), 16, 16),1,IRF,ce,17,x, x,x,x, x,x,x)
	.word 0xf63421db  ! 86: STH_I	sth	%r27, [%r16 + 0x01db]
	.word 0x881c294e  ! 88: XOR_I	xor 	%r16, 0x094e, %r4
	.word 0x8143e025  ! 88: MEMBAR	membar	#LoadLoad | #LoadStore | #MemIssue 
thr1_irf_ce_8:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_8), 16, 16),1,IRF,ce,24,x, x,x,x, x,x,x)
	.word 0xc4242bbd  ! 92: STW_I	stw	%r2, [%r16 + 0x0bbd]
	.word 0x981c0011  ! 94: XOR_R	xor 	%r16, %r17, %r12
	.word 0x94d42d1c  ! 94: UMULcc_I	umulcc 	%r16, 0x0d1c, %r10
	.word 0xe82429dd  ! 97: STW_I	stw	%r20, [%r16 + 0x09dd]
	.word 0x961c0011  ! 99: XOR_R	xor 	%r16, %r17, %r11
	.word 0xb49c2952  ! 99: XORcc_I	xorcc 	%r16, 0x0952, %r26
	.word 0x93ec0011  ! 99: RESTORE_R	restore	%r16, %r17, %r9
!Illinst store
	.word 0xd6241d71  ! 100: STW_R	stw	%r11, [%r16 + %r17]
	.word 0x86040011  ! 102: ADD_R	add 	%r16, %r17, %r3
	.word 0x9e040011  ! 102: ADD_R	add 	%r16, %r17, %r15
	.word 0x952c0011  ! 102: SLL_R	sll 	%r16, %r17, %r10
	.word 0xc3ec1011  ! 102: PREFETCHA_R	prefetcha	[%r16, %r17] 0x80, #one_read
	.word 0xdc742809  ! 105: STX_I	stx	%r14, [%r16 + 0x0809]
	.word 0xae940011  ! 107: ORcc_R	orcc 	%r16, %r17, %r23
	.word 0xa88c2a4b  ! 107: ANDcc_I	andcc 	%r16, 0x0a4b, %r20
	.word 0xa6c42731  ! 107: ADDCcc_I	addccc 	%r16, 0x0731, %r19
        wr %g0, 0x4, %fprs
!Illinst store
	.word 0xce741db1  ! 108: STX_R	stx	%r7, [%r16 + %r17]
	.word 0x84840011  ! 110: ADDcc_R	addcc 	%r16, %r17, %r2
	.word 0x94340011  ! 110: ORN_R	orn 	%r16, %r17, %r10
	.word 0x98842e0c  ! 110: ADDcc_I	addcc 	%r16, 0x0e0c, %r12
        wr  %g0, 0x80, %asi
!Illinst store
	.word 0xc2741771  ! 111: STX_R	stx	%r1, [%r16 + %r17]
	.word 0xb0bc0011  ! 113: XNORcc_R	xnorcc 	%r16, %r17, %r24
	.word 0x9eb427b7  ! 113: ORNcc_I	orncc 	%r16, 0x07b7, %r15
	.word 0x9f8025d2  ! 113: SIR	sir	0x05d2
!Illinst alu
	.word 0x83643fa1  ! 114: MOVcc_I	<illegal instruction>
	.word 0xd0d42fde  ! 116: LDSHA_I	ldsha	[%r16, + 0x0fde] %asi, %r8
	.word 0x948420ba  ! 118: ADDcc_I	addcc 	%r16, 0x00ba, %r10
	.word 0x9e0c0011  ! 118: AND_R	and 	%r16, %r17, %r15
	.word 0x9b2c0011  ! 118: SLL_R	sll 	%r16, %r17, %r13
	.word 0x95341011  ! 118: SRLX_R	srlx	%r16, %r17, %r10
	.word 0x912c3001  ! 118: SLLX_I	sllx	%r16, 0x0001, %r8
	.word 0x940c212b  ! 118: AND_I	and 	%r16, 0x012b, %r10
	rd      %pc, %r18
	set     0x20, %r17
thr1_irf_ce_9:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_9), 16, 16),1,IRF,ce,7,x, x,x,x, x,x,x)
	.word 0xee742b6f  ! 120: STX_I	stx	%r23, [%r16 + 0x0b6f]
	.word 0xb63c0011  ! 122: XNOR_R	xnor 	%r16, %r17, %r27
	.word 0x8c840011  ! 122: ADDcc_R	addcc 	%r16, %r17, %r6
	.word 0x997c2401  ! 122: MOVR_I	movre	%r16, 0x1, %r12
	return     %r18 + %r17
thr1_irf_ce_10:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_10), 16, 16),1,IRF,ce,51,x, x,x,x, x,x,x)
	.word 0xc2342445  ! 125: STH_I	sth	%r1, [%r16 + 0x0445]
	.word 0x9d342001  ! 127: SRL_I	srl 	%r16, 0x0001, %r14
	.word 0x8d3c1011  ! 127: SRAX_R	srax	%r16, %r17, %r6
	.word 0xe8bc2678  ! 127: STDA_I	stda	%r20, [%r16 + 0x0678] %asi
	.word 0x8a0c2e3b  ! 129: AND_I	and 	%r16, 0x0e3b, %r5
	.word 0x832c2001  ! 129: SLL_I	sll 	%r16, 0x0001, %r1
	.word 0xb13c1011  ! 129: SRAX_R	srax	%r16, %r17, %r24
	.word 0x997c2401  ! 129: MOVR_I	movre	%r16, 0x1, %r12
	.word 0xb29c2732  ! 129: XORcc_I	xorcc 	%r16, 0x0732, %r25
	rd      %pc, %r18
	set     0x20, %r17
	.word 0xd034245f  ! 130: STH_I	sth	%r8, [%r16 + 0x045f]
	.word 0xa92c2001  ! 132: SLL_I	sll 	%r16, 0x0001, %r20
	return     %r18 + %r17
thr1_irf_ce_11:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_11), 16, 16),1,IRF,ce,47,x, x,x,x, x,x,x)
	.word 0xdc2422cd  ! 135: STW_I	stw	%r14, [%r16 + 0x02cd]
	.word 0x9ed40011  ! 137: UMULcc_R	umulcc 	%r16, %r17, %r15
	.word 0x82c42c2a  ! 139: ADDCcc_I	addccc 	%r16, 0x0c2a, %r1
	.word 0xa92c2001  ! 139: SLL_I	sll 	%r16, 0x0001, %r20
	.word 0xb9341011  ! 139: SRLX_R	srlx	%r16, %r17, %r28
	.word 0xb40c0011  ! 139: AND_R	and 	%r16, %r17, %r26
	rd      %pc, %r18
	set     0x20, %r17
	.word 0xca342775  ! 140: STH_I	sth	%r5, [%r16 + 0x0775]
	.word 0x8d7c0411  ! 142: MOVR_R	movre	%r16, %r17, %r6
	.word 0x9aac0011  ! 142: ANDNcc_R	andncc 	%r16, %r17, %r13
	.word 0x94142015  ! 142: OR_I	or 	%r16, 0x0015, %r10
	return     %r18 + %r17
	.word 0xea342ad9  ! 144: STH_I	sth	%r21, [%r16 + 0x0ad9]
	.word 0xb8ac0011  ! 146: ANDNcc_R	andncc 	%r16, %r17, %r28
	.word 0x96840011  ! 146: ADDcc_R	addcc 	%r16, %r17, %r11
	rd      %asr26, %r31
	set     0x01f05, %r30
	and     %r31, %r30, %r31
!Illinst store
	.word 0xce741f71  ! 147: STX_R	stx	%r7, [%r16 + %r17]
	.word 0x9c2c0011  ! 149: ANDN_R	andn 	%r16, %r17, %r14
	.word 0x849c0011  ! 149: XORcc_R	xorcc 	%r16, %r17, %r2
	.word 0xb2940011  ! 149: ORcc_R	orcc 	%r16, %r17, %r25
	wr      %r0, 0x1, %asr26
	.word 0xc2342097  ! 152: STH_I	sth	%r1, [%r16 + 0x0097]
	.word 0xab341011  ! 154: SRLX_R	srlx	%r16, %r17, %r21
	.word 0x952c3001  ! 154: SLLX_I	sllx	%r16, 0x0001, %r10
	.word 0x3a800001  ! 154: BCC	bcc,a	<label_0x1>
	.word 0x997c0411  ! 156: MOVR_R	movre	%r16, %r17, %r12
	.word 0x9c8c0011  ! 156: ANDcc_R	andcc 	%r16, %r17, %r14
	.word 0x8ab40011  ! 156: ORNcc_R	orncc 	%r16, %r17, %r5
	.word 0xae1c20cb  ! 156: XOR_I	xor 	%r16, 0x00cb, %r23
	.word 0x8f2c1011  ! 156: SLLX_R	sllx	%r16, %r17, %r7
	.word 0xab2c1011  ! 156: SLLX_R	sllx	%r16, %r17, %r21
	rd      %pc, %r18
	set     0x20, %r17
	.word 0xce3427af  ! 157: STH_I	sth	%r7, [%r16 + 0x07af]
	.word 0x92bc2cc2  ! 159: XNORcc_I	xnorcc 	%r16, 0x0cc2, %r9
	jmpl     %r18 + %r17, %r31
!Illinst store
	.word 0xda241f31  ! 159: STW_R	stw	%r13, [%r16 + %r17]
	.word 0x9f802a54  ! 161: SIR	sir	0x0a54
!Illinst alu
	.word 0x8e0c3ffe  ! 162: AND_I	and 	%r16, 0xfffffffe, %r7
	.word 0x82b40011  ! 164: ORNcc_R	orncc 	%r16, %r17, %r1
thr1_resum_intr_739:
!$EV trig_pc_d(1,expr(@VA(.MAIN.thr1_resum_intr_739), 16, 16)) -> intp(1, 3, 1)
	wr      %r0, 0x4, %asr26
!Illinst store
	.word 0xfa3417b1  ! 165: STH_R	sth	%r29, [%r16 + %r17]
	.word 0x92bc0011  ! 167: XNORcc_R	xnorcc 	%r16, %r17, %r9
	.word 0xa93c2001  ! 167: SRA_I	sra 	%r16, 0x0001, %r20
	.word 0xc7e42011  ! 167: CASA_R	casa	[%r16] %asi, %r17, %r3
	.word 0xca74283b  ! 170: STX_I	stx	%r5, [%r16 + 0x083b]
	.word 0xaec40011  ! 172: ADDCcc_R	addccc 	%r16, %r17, %r23
	.word 0x98bc0011  ! 172: XNORcc_R	xnorcc 	%r16, %r17, %r12
	.word 0x8143e07b  ! 172: MEMBAR	membar	#LoadLoad | #StoreLoad | #StoreStore | #Lookaside | #MemIssue | #Sync 
!Illinst alu
	.word 0x8b7c1d71  ! 173: MOVR_R	movrvs	%r16, %r17, %r5
	.word 0x82440011  ! 175: ADDC_R	addc 	%r16, %r17, %r1
	.word 0x842c0011  ! 175: ANDN_R	andn 	%r16, %r17, %r2
	.word 0x924c0011  ! 175: MULX_R	mulx 	%r16, %r17, %r9
	.word 0xce74266f  ! 178: STX_I	stx	%r7, [%r16 + 0x066f]
	.word 0x9b2c3001  ! 180: SLLX_I	sllx	%r16, 0x0001, %r13
	.word 0x873c1011  ! 180: SRAX_R	srax	%r16, %r17, %r3
	.word 0x8f7c0411  ! 180: MOVR_R	movre	%r16, %r17, %r7
	.word 0x0f800001  ! 180: FBU	fbu  	<label_0x1>
!Illinst store
	.word 0xda241731  ! 181: STW_R	stw	%r13, [%r16 + %r17]
	.word 0x8d840011  ! 183: WRFPRS_R	wr	%r16, %r17, %fprs
thr1_irf_ce_12:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_12), 16, 16),1,IRF,ce,71,x, x,x,x, x,x,x)
	.word 0xe6242069  ! 187: STW_I	stw	%r19, [%r16 + 0x0069]
	.word 0xf5140011  ! 189: LDQF_R	-	[%r16, %r17], %f26
!Illinst store
	.word 0xca241df1  ! 190: STW_R	stw	%r5, [%r16 + %r17]
	.word 0x9a042dfc  ! 192: ADD_I	add 	%r16, 0x0dfc, %r13
	wr      %r0, 0x1, %asr26
thr1_irf_ce_13:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_13), 16, 16),1,IRF,ce,24,x, x,x,x, x,x,x)
	.word 0xda342cb5  ! 196: STH_I	sth	%r13, [%r16 + 0x0cb5]
	.word 0x8e3c2e26  ! 198: XNOR_I	xnor 	%r16, 0x0e26, %r7
thr1_resum_intr_740:
!$EV trig_pc_d(1,expr(@VA(.MAIN.thr1_resum_intr_740), 16, 16)) -> intp(1, 3, 1)
	wr      %r0, 0x4, %asr26
thr1_irf_ce_14:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_14), 16, 16),1,IRF,ce,41,x, x,x,x, x,x,x)
	.word 0xfa3428c1  ! 202: STH_I	sth	%r29, [%r16 + 0x08c1]
	.word 0x96840011  ! 204: ADDcc_R	addcc 	%r16, %r17, %r11
	.word 0xa63c0011  ! 204: XNOR_R	xnor 	%r16, %r17, %r19
	.word 0x8d341011  ! 204: SRLX_R	srlx	%r16, %r17, %r6
	ta	T_CHANGE_NONHPRIV	! macro
!Illinst store
	.word 0xda741771  ! 205: STX_R	stx	%r13, [%r16 + %r17]
	.word 0xc3ec1011  ! 207: PREFETCHA_R	prefetcha	[%r16, %r17] 0x80, #one_read
!Illinst alu
	.word 0x92ac1771  ! 208: ANDNcc_R	andncc 	%r16, %r17, %r9
	.word 0x9f8025b4  ! 210: SIR	sir	0x05b4
!Illinst alu
	.word 0x8ea43fa0  ! 211: SUBcc_I	subcc 	%r16, 0xffffffa0, %r7
	.word 0x88040011  ! 213: ADD_R	add 	%r16, %r17, %r4
	.word 0x9f2c1011  ! 213: SLLX_R	sllx	%r16, %r17, %r15
	.word 0x87341011  ! 213: SRLX_R	srlx	%r16, %r17, %r3
	.word 0xdeec1011  ! 213: LDSTUBA_R	ldstuba	%r15, [%r16 + %r17] 0x80
thr1_irf_ce_15:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_15), 16, 16),1,IRF,ce,7,x, x,x,x, x,x,x)
	.word 0xd2242fb9  ! 217: STW_I	stw	%r9, [%r16 + 0x0fb9]
	.word 0x928c2071  ! 219: ANDcc_I	andcc 	%r16, 0x0071, %r9
	.word 0x8d643801  ! 219: MOVcc_I	<illegal instruction>
	.word 0xd00c0011  ! 219: LDUB_R	ldub	[%r16 + %r17], %r8
!Illinst alu
	.word 0x8c241571  ! 220: SUB_R	sub 	%r16, %r17, %r6
        wr %g0, 0x4, %fprs
thr1_irf_ce_16:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_16), 16, 16),1,IRF,ce,67,x, x,x,x, x,x,x)
	.word 0xcc742a01  ! 226: STX_I	stx	%r6, [%r16 + 0x0a01]
	.word 0xd67c0011  ! 228: SWAP_R	swap	%r11, [%r16 + %r17]
	.word 0xacac0011  ! 230: ANDNcc_R	andncc 	%r16, %r17, %r22
	.word 0xad7c0411  ! 230: MOVR_R	movre	%r16, %r17, %r22
	.word 0xb0842caf  ! 230: ADDcc_I	addcc 	%r16, 0x0caf, %r24
	.word 0x89340011  ! 230: SRL_R	srl 	%r16, %r17, %r4
	.word 0xba2c0011  ! 230: ANDN_R	andn 	%r16, %r17, %r29
	.word 0xac842739  ! 230: ADDcc_I	addcc 	%r16, 0x0739, %r22
	rd      %pc, %r18
	set     0x20, %r17
	.word 0xe67427e7  ! 231: STX_I	stx	%r19, [%r16 + 0x07e7]
	.word 0x82bc0011  ! 233: XNORcc_R	xnorcc 	%r16, %r17, %r1
	.word 0x993c2001  ! 233: SRA_I	sra 	%r16, 0x0001, %r12
	.word 0x8d3c0011  ! 233: SRA_R	sra 	%r16, %r17, %r6
	return     %r18 + %r17
thr1_irf_ce_17:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_17), 16, 16),1,IRF,ce,23,x, x,x,x, x,x,x)
	.word 0xcc2429a1  ! 236: STW_I	stw	%r6, [%r16 + 0x09a1]
	.word 0x8a8c2a3c  ! 238: ANDcc_I	andcc 	%r16, 0x0a3c, %r5
	.word 0x833c2001  ! 238: SRA_I	sra 	%r16, 0x0001, %r1
	.word 0xbb7c2401  ! 238: MOVR_I	movre	%r16, 0x1, %r29
	.word 0xfa0c225b  ! 238: LDUB_I	ldub	[%r16 + 0x025b], %r29
	.word 0xaa040011  ! 240: ADD_R	add 	%r16, %r17, %r21
	.word 0x9c940011  ! 240: ORcc_R	orcc 	%r16, %r17, %r14
	.word 0xa9341011  ! 240: SRLX_R	srlx	%r16, %r17, %r20
	.word 0x9e440011  ! 240: ADDC_R	addc 	%r16, %r17, %r15
	.word 0x82ac2f52  ! 240: ANDNcc_I	andncc 	%r16, 0x0f52, %r1
	rd      %pc, %r18
	set     0x20, %r17
thr1_irf_ce_18:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_18), 16, 16),1,IRF,ce,60,x, x,x,x, x,x,x)
	.word 0xda2426bf  ! 242: STW_I	stw	%r13, [%r16 + 0x06bf]
	.word 0x943429d1  ! 244: ORN_I	orn 	%r16, 0x09d1, %r10
	.word 0x953c2001  ! 244: SRA_I	sra 	%r16, 0x0001, %r10
	return     %r18 + %r17
!Illinst alu
	.word 0x922c3ff3  ! 244: ANDN_I	andn 	%r16, 0xfffffff3, %r9
	.word 0x9ec42013  ! 246: ADDCcc_I	addccc 	%r16, 0x0013, %r15
	.word 0x82c40011  ! 246: ADDCcc_R	addccc 	%r16, %r17, %r1
	.word 0x952c2001  ! 246: SLL_I	sll 	%r16, 0x0001, %r10
	.word 0xf2540011  ! 246: LDSH_R	ldsh	[%r16 + %r17], %r25
thr1_irf_ce_19:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_19), 16, 16),1,IRF,ce,6,x, x,x,x, x,x,x)
	.word 0xf2742f41  ! 250: STX_I	stx	%r25, [%r16 + 0x0f41]
	rd      %asr26, %r31
	set     0x01f05, %r30
	and     %r31, %r30, %r31
!Illinst store
	.word 0xf0741f31  ! 253: STX_R	stx	%r24, [%r16 + %r17]
	.word 0x969c2e00  ! 255: XORcc_I	xorcc 	%r16, 0x0e00, %r11
	.word 0xa8442169  ! 255: ADDC_I	addc 	%r16, 0x0169, %r20
	.word 0x9f2c1011  ! 255: SLLX_R	sllx	%r16, %r17, %r15
	wr      %r0, 0x1, %asr26
!Illinst alu
	.word 0x88c41531  ! 256: ADDCcc_R	addccc 	%r16, %r17, %r4
	.word 0x8f7c2401  ! 258: MOVR_I	movre	%r16, 0x1, %r7
	.word 0x872c0011  ! 258: SLL_R	sll 	%r16, %r17, %r3
	.word 0x827c263c  ! 258: SDIV_I	sdiv 	%r16, 0x063c, %r1
	.word 0xd6242683  ! 261: STW_I	stw	%r11, [%r16 + 0x0683]
	.word 0x860c2338  ! 263: AND_I	and 	%r16, 0x0338, %r3
	.word 0xb04c2f71  ! 263: MULX_I	mulx 	%r16, 0x0f71, %r24
	.word 0xd8742cc9  ! 266: STX_I	stx	%r12, [%r16 + 0x0cc9]
	.word 0xa8340011  ! 268: ORN_R	orn 	%r16, %r17, %r20
	.word 0x8143c000  ! 268: STBAR	stbar
!Illinst store
	.word 0xd0341f31  ! 269: STH_R	sth	%r8, [%r16 + %r17]
	.word 0xba142d87  ! 271: OR_I	or 	%r16, 0x0d87, %r29
	.word 0x9a840011  ! 271: ADDcc_R	addcc 	%r16, %r17, %r13
	.word 0x9494214d  ! 271: ORcc_I	orcc 	%r16, 0x014d, %r10
	.word 0xd91c0011  ! 271: LDDF_R	ldd	[%r16, %r17], %f12
!Illinst alu
	.word 0x90043de3  ! 272: ADD_I	add 	%r16, 0xfffffde3, %r8
	rd      %asr26, %r31
	set     0x01f05, %r30
	and     %r31, %r30, %r31
!Illinst store
	.word 0xf4341df1  ! 275: STH_R	sth	%r26, [%r16 + %r17]
	.word 0x992c2001  ! 277: SLL_I	sll 	%r16, 0x0001, %r12
	.word 0xb28421e6  ! 277: ADDcc_I	addcc 	%r16, 0x01e6, %r25
        wr %g0, 0x4, %fprs
!Illinst alu
	.word 0x84143f74  ! 278: OR_I	or 	%r16, 0xffffff74, %r2
	.word 0xa83c0011  ! 280: XNOR_R	xnor 	%r16, %r17, %r20
	.word 0x94c42618  ! 280: ADDCcc_I	addccc 	%r16, 0x0618, %r10
	.word 0x9a040011  ! 280: ADD_R	add 	%r16, %r17, %r13
	.word 0xf4442710  ! 280: LDSW_I	ldsw	[%r16 + 0x0710], %r26
!Illinst alu
	.word 0x9a443777  ! 281: ADDC_I	addc 	%r16, 0xfffff777, %r13
	.word 0x94ac2a5f  ! 283: ANDNcc_I	andncc 	%r16, 0x0a5f, %r10
	.word 0x81518000  ! 283: RDPR_PSTATE	rdpr	%pstate, %r0
thr1_irf_ce_20:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_20), 16, 16),1,IRF,ce,44,x, x,x,x, x,x,x)
	.word 0xd83425d3  ! 287: STH_I	sth	%r12, [%r16 + 0x05d3]
	.word 0x9e2c0011  ! 289: ANDN_R	andn 	%r16, %r17, %r15
	.word 0xb62c23a5  ! 289: ANDN_I	andn 	%r16, 0x03a5, %r27
	wr      %r0, 0x5, %asr26
thr1_irf_ce_21:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_21), 16, 16),1,IRF,ce,54,x, x,x,x, x,x,x)
	.word 0xd8742c3b  ! 293: STX_I	stx	%r12, [%r16 + 0x0c3b]
	.word 0x929c25d5  ! 295: XORcc_I	xorcc 	%r16, 0x05d5, %r9
	.word 0x8143e05e  ! 295: MEMBAR	membar	#StoreLoad | #LoadStore | #StoreStore | #Lookaside | #Sync 
	.word 0xcc242c35  ! 298: STW_I	stw	%r6, [%r16 + 0x0c35]
	.word 0xb6340011  ! 300: ORN_R	orn 	%r16, %r17, %r27
	.word 0xa81c0011  ! 300: XOR_R	xor 	%r16, %r17, %r20
	.word 0x9f802e1a  ! 300: SIR	sir	0x0e1a
!Illinst store
	.word 0xc47417f1  ! 301: STX_R	stx	%r2, [%r16 + %r17]
	.word 0x99341011  ! 303: SRLX_R	srlx	%r16, %r17, %r12
	.word 0x881c0011  ! 303: XOR_R	xor 	%r16, %r17, %r4
	.word 0x82340011  ! 303: ORN_R	orn 	%r16, %r17, %r1
	.word 0xb1e40011  ! 303: SAVE_R	save	%r16, %r17, %r24
	.word 0xc4342859  ! 306: STH_I	sth	%r2, [%r16 + 0x0859]
	.word 0xb4140011  ! 308: OR_R	or 	%r16, %r17, %r26
	.word 0x85340011  ! 308: SRL_R	srl 	%r16, %r17, %r2
        wr %g0, 0x4, %fprs
!Illinst store
	.word 0xc6241531  ! 309: STW_R	stw	%r3, [%r16 + %r17]
	.word 0x8e840011  ! 311: ADDcc_R	addcc 	%r16, %r17, %r7
	.word 0x8143c000  ! 311: STBAR	stbar
thr1_irf_ce_22:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_22), 16, 16),1,IRF,ce,51,x, x,x,x, x,x,x)
	.word 0xde742f5d  ! 315: STX_I	stx	%r15, [%r16 + 0x0f5d]
	.word 0xaa842caf  ! 317: ADDcc_I	addcc 	%r16, 0x0caf, %r21
	.word 0x94342203  ! 317: ORN_I	orn 	%r16, 0x0203, %r10
	.word 0x89342001  ! 317: SRL_I	srl 	%r16, 0x0001, %r4
	.word 0xf00427e1  ! 317: LDUW_I	lduw	[%r16 + 0x07e1], %r24
!Illinst store
	.word 0xea741731  ! 318: STX_R	stx	%r21, [%r16 + %r17]
	.word 0x9d643801  ! 320: MOVcc_I	<illegal instruction>
	.word 0x96540011  ! 320: UMUL_R	umul 	%r16, %r17, %r11
	.word 0xda242e5f  ! 323: STW_I	stw	%r13, [%r16 + 0x0e5f]
	.word 0xc3ec1011  ! 325: PREFETCHA_R	prefetcha	[%r16, %r17] 0x80, #one_read
!Illinst alu
	.word 0xae0c1531  ! 326: AND_R	and 	%r16, %r17, %r23
	.word 0xaeb40011  ! 328: ORNcc_R	orncc 	%r16, %r17, %r23
	.word 0x8143e00c  ! 328: MEMBAR	membar	#LoadStore | #StoreStore 
!Illinst store
	.word 0xda341531  ! 329: STH_R	sth	%r13, [%r16 + %r17]
	.word 0x8abc2509  ! 331: XNORcc_I	xnorcc 	%r16, 0x0509, %r5
        wr  %g0, 0x80, %asi
thr1_irf_ce_23:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_23), 16, 16),1,IRF,ce,24,x, x,x,x, x,x,x)
	.word 0xda242da5  ! 335: STW_I	stw	%r13, [%r16 + 0x0da5]
	.word 0x82bc0011  ! 337: XNORcc_R	xnorcc 	%r16, %r17, %r1
	.word 0x881c231c  ! 337: XOR_I	xor 	%r16, 0x031c, %r4
	.word 0xc36c24d6  ! 337: PREFETCH_I	prefetch	[%r16 + 0x04d6], #one_read
thr1_irf_ce_24:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_24), 16, 16),1,IRF,ce,25,x, x,x,x, x,x,x)
	.word 0xd2242a1d  ! 341: STW_I	stw	%r9, [%r16 + 0x0a1d]
	.word 0xc6dc1011  ! 343: LDXA_R	ldxa	[%r16, %r17] 0x80, %r3
!Illinst store
	.word 0xe8341d71  ! 344: STH_R	sth	%r20, [%r16 + %r17]
	.word 0xb52c0011  ! 346: SLL_R	sll 	%r16, %r17, %r26
	.word 0xb3e40011  ! 346: SAVE_R	save	%r16, %r17, %r25
!Illinst alu
	.word 0x8c841f71  ! 347: ADDcc_R	addcc 	%r16, %r17, %r6
	.word 0xcc1c0011  ! 349: LDD_R	ldd	[%r16 + %r17], %r6
!Illinst alu
	.word 0xbb2c3fe1  ! 350: SLL_I	sllx	%r16, 0x0021, %r29
	.word 0x862c2a4e  ! 352: ANDN_I	andn 	%r16, 0x0a4e, %r3
	.word 0x8f342001  ! 352: SRL_I	srl 	%r16, 0x0001, %r7
	.word 0x9e3c0011  ! 352: XNOR_R	xnor 	%r16, %r17, %r15
	.word 0xead41011  ! 352: LDSHA_R	ldsha	[%r16, %r17] 0x80, %r21
thr1_irf_ce_25:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_25), 16, 16),1,IRF,ce,25,x, x,x,x, x,x,x)
	.word 0xde2422cb  ! 356: STW_I	stw	%r15, [%r16 + 0x02cb]
	.word 0x881c0011  ! 358: XOR_R	xor 	%r16, %r17, %r4
        wr %g0, 0x4, %fprs
!Illinst alu
	.word 0x8cbc15f1  ! 359: XNORcc_R	xnorcc 	%r16, %r17, %r6
	.word 0x94b40011  ! 361: ORNcc_R	orncc 	%r16, %r17, %r10
	.word 0x90840011  ! 361: ADDcc_R	addcc 	%r16, %r17, %r8
	.word 0x81880000  ! 361: SAVED	saved
	.word 0xcc242317  ! 364: STW_I	stw	%r6, [%r16 + 0x0317]
	.word 0xde6c221d  ! 366: LDSTUB_I	ldstub	%r15, [%r16 + 0x021d]
	.word 0xc874222d  ! 369: STX_I	stx	%r4, [%r16 + 0x022d]
        wr %g0, 0x4, %fprs
thr1_irf_ce_26:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_26), 16, 16),1,IRF,ce,50,x, x,x,x, x,x,x)
	.word 0xc8742a7b  ! 375: STX_I	stx	%r4, [%r16 + 0x0a7b]
	.word 0x81dc0011  ! 377: FLUSH_R	flush
	.word 0xc87422a1  ! 380: STX_I	stx	%r4, [%r16 + 0x02a1]
	.word 0xc47c0011  ! 382: SWAP_R	swap	%r2, [%r16 + %r17]
!Illinst store
	.word 0xdc341571  ! 383: STH_R	sth	%r14, [%r16 + %r17]
	.word 0x98c40011  ! 385: ADDCcc_R	addccc 	%r16, %r17, %r12
	.word 0x852c1011  ! 385: SLLX_R	sllx	%r16, %r17, %r2
	.word 0x98042a72  ! 385: ADD_I	add 	%r16, 0x0a72, %r12
	rd      %asr26, %r31
	set     0x01f05, %r30
	and     %r31, %r30, %r31
!Illinst store
	.word 0xfa341731  ! 386: STH_R	sth	%r29, [%r16 + %r17]
	.word 0x92940011  ! 388: ORcc_R	orcc 	%r16, %r17, %r9
	.word 0x949c2f8c  ! 388: XORcc_I	xorcc 	%r16, 0x0f8c, %r10
	.word 0x9e142d7e  ! 388: OR_I	or 	%r16, 0x0d7e, %r15
	.word 0xd4a42f9d  ! 388: STWA_I	stwa	%r10, [%r16 + 0x0f9d] %asi
thr1_irf_ce_27:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_27), 16, 16),1,IRF,ce,50,x, x,x,x, x,x,x)
	.word 0xe8242b2d  ! 392: STW_I	stw	%r20, [%r16 + 0x0b2d]
	.word 0x9b340011  ! 394: SRL_R	srl 	%r16, %r17, %r13
	.word 0x8a340011  ! 394: ORN_R	orn 	%r16, %r17, %r5
	.word 0x8e042819  ! 394: ADD_I	add 	%r16, 0x0819, %r7
	.word 0x83880000  ! 394: RESTORED	restored
	.word 0xea342543  ! 397: STH_I	sth	%r21, [%r16 + 0x0543]
	.word 0x989c0011  ! 399: XORcc_R	xorcc 	%r16, %r17, %r12
	.word 0x94442a4b  ! 399: ADDC_I	addc 	%r16, 0x0a4b, %r10
	.word 0x85342001  ! 399: SRL_I	srl 	%r16, 0x0001, %r2
	.word 0x8143e074  ! 399: MEMBAR	membar	#LoadStore | #Lookaside | #MemIssue | #Sync 
!Illinst store
	.word 0xc4741d71  ! 400: STX_R	stx	%r2, [%r16 + %r17]
	.word 0x949c2530  ! 402: XORcc_I	xorcc 	%r16, 0x0530, %r10
	.word 0xba2c0011  ! 402: ANDN_R	andn 	%r16, %r17, %r29
        wr %g0, 0x4, %fprs
thr1_irf_ce_28:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_28), 16, 16),1,IRF,ce,29,x, x,x,x, x,x,x)
	.word 0xf2242d23  ! 406: STW_I	stw	%r25, [%r16 + 0x0d23]
	.word 0xa69c0011  ! 408: XORcc_R	xorcc 	%r16, %r17, %r19
	.word 0xc3ec2a22  ! 408: PREFETCHA_I	prefetcha	[%r16, + 0x0a22] %asi, #one_read
!Illinst store
	.word 0xe6241531  ! 409: STW_R	stw	%r19, [%r16 + %r17]
	.word 0x82342ba4  ! 411: ORN_I	orn 	%r16, 0x0ba4, %r1
	.word 0xae8c0011  ! 411: ANDcc_R	andcc 	%r16, %r17, %r23
	.word 0xad7c2401  ! 411: MOVR_I	movre	%r16, 0x1, %r22
thr1_resum_intr_741:
!$EV trig_pc_d(1,expr(@VA(.MAIN.thr1_resum_intr_741), 16, 16)) -> intp(1, 3, 1)
	wr      %r0, 0x0, %asr26
!Illinst store
	.word 0xfa341ff1  ! 412: STH_R	sth	%r29, [%r16 + %r17]
	.word 0x81dc24ba  ! 414: FLUSH_I	flush
!Illinst alu
	.word 0xa8143f6a  ! 415: OR_I	or 	%r16, 0xffffff6a, %r20
	.word 0x9a140011  ! 417: OR_R	or 	%r16, %r17, %r13
        wr %g0, 0x4, %fprs
!Illinst alu
	.word 0x943437bc  ! 418: SUBC_I	orn 	%r16, 0xfffff7bc, %r10
	.word 0xb68c0011  ! 420: ANDcc_R	andcc 	%r16, %r17, %r27
	.word 0xf4b41011  ! 420: STHA_R	stha	%r26, [%r16 + %r17] 0x80
	.word 0xd8242dfd  ! 423: STW_I	stw	%r12, [%r16 + 0x0dfd]
	.word 0x987c24ed  ! 425: SDIV_I	sdiv 	%r16, 0x04ed, %r12
!Illinst alu
	.word 0xbac41fb1  ! 426: ADDCcc_R	addccc 	%r16, %r17, %r29
	.word 0xab2c2001  ! 428: SLL_I	sll 	%r16, 0x0001, %r21
	.word 0x81880000  ! 428: SAVED	saved
thr1_irf_ce_29:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_29), 16, 16),1,IRF,ce,19,x, x,x,x, x,x,x)
	.word 0xd2242487  ! 432: STW_I	stw	%r9, [%r16 + 0x0487]
	.word 0x84b40011  ! 434: ORNcc_R	orncc 	%r16, %r17, %r2
	.word 0xb93c0011  ! 434: SRA_R	sra 	%r16, %r17, %r28
	.word 0x96b40011  ! 434: ORNcc_R	orncc 	%r16, %r17, %r11
	.word 0x81dc0011  ! 434: FLUSH_R	flush
!Illinst alu
	.word 0xb0a41731  ! 435: SUBcc_R	subcc 	%r16, %r17, %r24
	.word 0xc36c21df  ! 437: PREFETCH_I	prefetch	[%r16 + 0x01df], #one_read
!Illinst alu
	.word 0x9e441db1  ! 438: ADDC_R	addc 	%r16, %r17, %r15
	.word 0x90040011  ! 440: ADD_R	add 	%r16, %r17, %r8
	.word 0xac1c2964  ! 440: XOR_I	xor 	%r16, 0x0964, %r22
	.word 0x97343001  ! 440: SRLX_I	srlx	%r16, 0x0001, %r11
	.word 0xf2ac27d5  ! 440: STBA_I	stba	%r25, [%r16 + 0x07d5] %asi
!Illinst alu
	.word 0x8c0c3ff8  ! 441: AND_I	and 	%r16, 0xfffffff8, %r6
	.word 0x98c40011  ! 443: ADDCcc_R	addccc 	%r16, %r17, %r12
	.word 0x9f802ef8  ! 443: SIR	sir	0x0ef8
	.word 0xce34222f  ! 446: STH_I	sth	%r7, [%r16 + 0x022f]
	.word 0x8c840011  ! 448: ADDcc_R	addcc 	%r16, %r17, %r6
	.word 0xaa342985  ! 448: ORN_I	orn 	%r16, 0x0985, %r21
        wr %g0, 0x4, %fprs
!Illinst store
	.word 0xf0341f31  ! 449: STH_R	sth	%r24, [%r16 + %r17]
	.word 0x94bc2509  ! 451: XNORcc_I	xnorcc 	%r16, 0x0509, %r10
	ta	T_CHANGE_PRIV	! macro
thr1_irf_ce_30:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_30), 16, 16),1,IRF,ce,59,x, x,x,x, x,x,x)
	.word 0xec742759  ! 455: STX_I	stx	%r22, [%r16 + 0x0759]
	.word 0x869c0011  ! 457: XORcc_R	xorcc 	%r16, %r17, %r3
	wr      %r0, 0x5, %asr26
thr1_irf_ce_31:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_31), 16, 16),1,IRF,ce,35,x, x,x,x, x,x,x)
	.word 0xf8242813  ! 461: STW_I	stw	%r28, [%r16 + 0x0813]
	.word 0x933c0011  ! 463: SRA_R	sra 	%r16, %r17, %r9
	.word 0xdc6c0011  ! 463: LDSTUB_R	ldstub	%r14, [%r16 + %r17]
	.word 0xcc742383  ! 466: STX_I	stx	%r6, [%r16 + 0x0383]
	.word 0x9e440011  ! 468: ADDC_R	addc 	%r16, %r17, %r15
	.word 0xb5240011  ! 468: MULScc_R	mulscc 	%r16, %r17, %r26
!Illinst store
	.word 0xf2341ff1  ! 469: STH_R	sth	%r25, [%r16 + %r17]
	.word 0xb08c0011  ! 471: ANDcc_R	andcc 	%r16, %r17, %r24
	.word 0xbabc2941  ! 471: XNORcc_I	xnorcc 	%r16, 0x0941, %r29
thr1_resum_intr_742:
!$EV trig_pc_d(1,expr(@VA(.MAIN.thr1_resum_intr_742), 16, 16)) -> intp(1, 3, 1)
	wr      %r0, 0x4, %asr26
	.word 0xd074216f  ! 474: STX_I	stx	%r8, [%r16 + 0x016f]
	.word 0x8e940011  ! 476: ORcc_R	orcc 	%r16, %r17, %r7
	.word 0x81dc2c1b  ! 476: FLUSH_I	flush
!Illinst store
	.word 0xee3417f1  ! 477: STH_R	sth	%r23, [%r16 + %r17]
	.word 0x94842471  ! 479: ADDcc_I	addcc 	%r16, 0x0471, %r10
	.word 0xdc8c1011  ! 479: LDUBA_R	lduba	[%r16, %r17] 0x80, %r14
!Illinst alu
	.word 0x9e243d79  ! 480: SUB_I	sub 	%r16, 0xfffffd79, %r15
	.word 0x82d40011  ! 482: UMULcc_R	umulcc 	%r16, %r17, %r1
!Illinst alu
	.word 0x941c3fe7  ! 483: XOR_I	xor 	%r16, 0xffffffe7, %r10
        wr  %g0, 0x80, %asi
	.word 0xdc342239  ! 488: STH_I	sth	%r14, [%r16 + 0x0239]
	.word 0xb52c2001  ! 490: SLL_I	sll 	%r16, 0x0001, %r26
	.word 0x8143c000  ! 490: STBAR	stbar
thr1_irf_ce_32:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_32), 16, 16),1,IRF,ce,6,x, x,x,x, x,x,x)
	.word 0xc4742ad5  ! 494: STX_I	stx	%r2, [%r16 + 0x0ad5]
	.word 0x9e0c0011  ! 496: AND_R	and 	%r16, %r17, %r15
	.word 0x96ac0011  ! 496: ANDNcc_R	andncc 	%r16, %r17, %r11
	.word 0x8aac21db  ! 496: ANDNcc_I	andncc 	%r16, 0x01db, %r5
	.word 0xafa94831  ! 496: FMOVCS	fmovs	%fcc1, %f17, %f23
thr1_irf_ce_33:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_33), 16, 16),1,IRF,ce,2,x, x,x,x, x,x,x)
	.word 0xf8742479  ! 500: STX_I	stx	%r28, [%r16 + 0x0479]
	.word 0xbaac2b99  ! 502: ANDNcc_I	andncc 	%r16, 0x0b99, %r29
	.word 0x94c40011  ! 502: ADDCcc_R	addccc 	%r16, %r17, %r10
	.word 0xb48c2280  ! 502: ANDcc_I	andcc 	%r16, 0x0280, %r26
	.word 0x81580000  ! 502: FLUSHW	flushw
!Illinst alu
	.word 0x90ac3f7c  ! 503: ANDNcc_I	andncc 	%r16, 0xffffff7c, %r8
	.word 0xb00c0011  ! 505: AND_R	and 	%r16, %r17, %r24
	.word 0x8a940011  ! 505: ORcc_R	orcc 	%r16, %r17, %r5
	.word 0x96bc0011  ! 505: XNORcc_R	xnorcc 	%r16, %r17, %r11
	.word 0xd33c0011  ! 505: STDF_R	std	%f9, [%r17, %r16]
	.word 0x829c0011  ! 507: XORcc_R	xorcc 	%r16, %r17, %r1
	.word 0x92ac0011  ! 507: ANDNcc_R	andncc 	%r16, %r17, %r9
	.word 0xa6c40011  ! 507: ADDCcc_R	addccc 	%r16, %r17, %r19
	.word 0xaa840011  ! 507: ADDcc_R	addcc 	%r16, %r17, %r21
	rd      %pc, %r18
	set     0x20, %r17
	.word 0xcc3423cb  ! 508: STH_I	sth	%r6, [%r16 + 0x03cb]
	.word 0x8f7c0411  ! 510: MOVR_R	movre	%r16, %r17, %r7
	jmpl     %r18 + %r17, %r31
!Illinst alu
	.word 0x94341771  ! 510: ORN_R	orn 	%r16, %r17, %r10
	.word 0xac842730  ! 512: ADDcc_I	addcc 	%r16, 0x0730, %r22
	.word 0xc3ec1011  ! 512: PREFETCHA_R	prefetcha	[%r16, %r17] 0x80, #one_read
	.word 0x993c2001  ! 514: SRA_I	sra 	%r16, 0x0001, %r12
	.word 0x8b2c3001  ! 514: SLLX_I	sllx	%r16, 0x0001, %r5
	.word 0x929c2c87  ! 514: XORcc_I	xorcc 	%r16, 0x0c87, %r9
	.word 0xb44420b0  ! 514: ADDC_I	addc 	%r16, 0x00b0, %r26
	rd      %pc, %r18
	set     0x20, %r17
	.word 0xee742add  ! 515: STX_I	stx	%r23, [%r16 + 0x0add]
	jmpl     %r18 + %r17, %r31
!Illinst store
	.word 0xf8241731  ! 517: STW_R	stw	%r28, [%r16 + %r17]
	.word 0x9d340011  ! 519: SRL_R	srl 	%r16, %r17, %r14
	.word 0xa894246e  ! 519: ORcc_I	orcc 	%r16, 0x046e, %r20
	.word 0x2c800001  ! 519: BNEG	bneg,a	<label_0x1>
thr1_irf_ce_34:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_34), 16, 16),1,IRF,ce,12,x, x,x,x, x,x,x)
	.word 0xd82421bb  ! 523: STW_I	stw	%r12, [%r16 + 0x01bb]
	.word 0x9e0c0011  ! 525: AND_R	and 	%r16, %r17, %r15
	.word 0xb0d40011  ! 525: UMULcc_R	umulcc 	%r16, %r17, %r24
thr1_irf_ce_35:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_35), 16, 16),1,IRF,ce,14,x, x,x,x, x,x,x)
	.word 0xd8742db3  ! 529: STX_I	stx	%r12, [%r16 + 0x0db3]
	.word 0x9cc42cfd  ! 531: ADDCcc_I	addccc 	%r16, 0x0cfd, %r14
	.word 0x923c0011  ! 531: XNOR_R	xnor 	%r16, %r17, %r9
	.word 0x8cac29ae  ! 531: ANDNcc_I	andncc 	%r16, 0x09ae, %r6
	.word 0xa8542c97  ! 531: UMUL_I	umul 	%r16, 0x0c97, %r20
!Illinst alu
	.word 0x88b435b0  ! 532: ORNcc_I	orncc 	%r16, 0xfffff5b0, %r4
	.word 0x832c2001  ! 534: SLL_I	sll 	%r16, 0x0001, %r1
	.word 0xdcf41011  ! 534: STXA_R	stxa	%r14, [%r16 + %r17] 0x80
!Illinst store
	.word 0xd2741571  ! 535: STX_R	stx	%r9, [%r16 + %r17]
	.word 0x8143e07f  ! 537: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #StoreStore | #Lookaside | #MemIssue | #Sync 
!Illinst alu
	.word 0x98bc3fe4  ! 538: XNORcc_I	xnorcc 	%r16, 0xffffffe4, %r12
	.word 0x820c2993  ! 540: AND_I	and 	%r16, 0x0993, %r1
	.word 0xb63427e3  ! 540: ORN_I	orn 	%r16, 0x07e3, %r27
	.word 0x91342001  ! 540: SRL_I	srl 	%r16, 0x0001, %r8
	.word 0x81580000  ! 540: FLUSHW	flushw
	.word 0xb32c3001  ! 542: SLLX_I	sllx	%r16, 0x0001, %r25
	.word 0xaac42910  ! 542: ADDCcc_I	addccc 	%r16, 0x0910, %r21
	.word 0xac0427f2  ! 542: ADD_I	add 	%r16, 0x07f2, %r22
	.word 0xb6940011  ! 542: ORcc_R	orcc 	%r16, %r17, %r27
	.word 0x988c0011  ! 542: ANDcc_R	andcc 	%r16, %r17, %r12
	.word 0x848c0011  ! 542: ANDcc_R	andcc 	%r16, %r17, %r2
	rd      %pc, %r18
	set     0x20, %r17
	.word 0xde7427e5  ! 543: STX_I	stx	%r15, [%r16 + 0x07e5]
	jmpl     %r18 + %r17, %r31
!Illinst store
	.word 0xf87417f1  ! 545: STX_R	stx	%r28, [%r16 + %r17]
	.word 0xa9643801  ! 547: MOVcc_I	<illegal instruction>
	.word 0x8143c000  ! 547: STBAR	stbar
!Illinst alu
	.word 0x829c373e  ! 548: XORcc_I	xorcc 	%r16, 0xfffff73e, %r1
	.word 0x9a9c0011  ! 550: XORcc_R	xorcc 	%r16, %r17, %r13
	.word 0x9f3c1011  ! 550: SRAX_R	srax	%r16, %r17, %r15
	.word 0x83880000  ! 550: RESTORED	restored
!Illinst alu
	.word 0x953415f1  ! 551: SRL_R	srlx	%r16, %r17, %r10
	.word 0x8dec0011  ! 553: RESTORE_R	restore	%r16, %r17, %r6
!Illinst alu
	.word 0x8f7c1fb1  ! 554: MOVR_R	movrvs	%r16, %r17, %r7
	.word 0x8c9c2438  ! 556: XORcc_I	xorcc 	%r16, 0x0438, %r6
thr1_resum_intr_743:
!$EV trig_pc_d(1,expr(@VA(.MAIN.thr1_resum_intr_743), 16, 16)) -> intp(1, 3, 1)
	wr      %r0, 0x0, %asr26
thr1_irf_ce_36:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_36), 16, 16),1,IRF,ce,43,x, x,x,x, x,x,x)
	.word 0xda242af1  ! 560: STW_I	stw	%r13, [%r16 + 0x0af1]
	.word 0xeac41011  ! 562: LDSWA_R	ldswa	[%r16, %r17] 0x80, %r21
!Illinst store
	.word 0xdc241771  ! 563: STW_R	stw	%r14, [%r16 + %r17]
	.word 0xb684268d  ! 565: ADDcc_I	addcc 	%r16, 0x068d, %r27
	.word 0xae340011  ! 565: ORN_R	orn 	%r16, %r17, %r23
        wr %g0, 0x4, %fprs
	.word 0xc8742c5d  ! 568: STX_I	stx	%r4, [%r16 + 0x0c5d]
	.word 0x848c0011  ! 570: ANDcc_R	andcc 	%r16, %r17, %r2
	.word 0x85641811  ! 570: MOVcc_R	<illegal instruction>
	.word 0x81538000  ! 570: RDPR_WSTATE	rdpr	%wstate, %r0
	.word 0x832c0011  ! 572: SLL_R	sll 	%r16, %r17, %r1
	.word 0xbb342001  ! 572: SRL_I	srl 	%r16, 0x0001, %r29
	.word 0x92440011  ! 572: ADDC_R	addc 	%r16, %r17, %r9
	.word 0x8c9c235f  ! 572: XORcc_I	xorcc 	%r16, 0x035f, %r6
	.word 0xb2b40011  ! 572: ORNcc_R	orncc 	%r16, %r17, %r25
	.word 0xb08c0011  ! 572: ANDcc_R	andcc 	%r16, %r17, %r24
	rd      %pc, %r18
	set     0x20, %r17
thr1_irf_ce_37:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_37), 16, 16),1,IRF,ce,39,x, x,x,x, x,x,x)
	.word 0xcc34264f  ! 574: STH_I	sth	%r6, [%r16 + 0x064f]
	jmpl     %r18 + %r17, %r31
!Illinst alu
	.word 0x9d341d71  ! 576: SRLX_R	srlx	%r16, %r17, %r14
	.word 0x8e2c0011  ! 578: ANDN_R	andn 	%r16, %r17, %r7
	.word 0xaab40011  ! 578: ORNcc_R	orncc 	%r16, %r17, %r21
	.word 0x943420eb  ! 578: ORN_I	orn 	%r16, 0x00eb, %r10
	.word 0xed841011  ! 578: LDFA_R	lda	[%r16, %r17], %f22
	.word 0x9e942982  ! 580: ORcc_I	orcc 	%r16, 0x0982, %r15
	.word 0x95641811  ! 580: MOVcc_R	<illegal instruction>
	.word 0x89643801  ! 580: MOVcc_I	<illegal instruction>
	.word 0xb77c0411  ! 580: MOVR_R	movre	%r16, %r17, %r27
	.word 0xac9c0011  ! 580: XORcc_R	xorcc 	%r16, %r17, %r22
	.word 0x862c0011  ! 580: ANDN_R	andn 	%r16, %r17, %r3
	rd      %pc, %r18
	set     0x20, %r17
	.word 0xca2423df  ! 581: STW_I	stw	%r5, [%r16 + 0x03df]
	.word 0x96142201  ! 583: OR_I	or 	%r16, 0x0201, %r11
	return     %r18 + %r17
	.word 0xc8342385  ! 585: STH_I	sth	%r4, [%r16 + 0x0385]
	.word 0x9cc40011  ! 587: ADDCcc_R	addccc 	%r16, %r17, %r14
	.word 0x8a340011  ! 587: ORN_R	orn 	%r16, %r17, %r5
	.word 0x920c0011  ! 587: AND_R	and 	%r16, %r17, %r9
	.word 0xdc5c258d  ! 587: LDX_I	ldx	[%r16 + 0x058d], %r14
thr1_irf_ce_38:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_38), 16, 16),1,IRF,ce,3,x, x,x,x, x,x,x)
	.word 0xcc34208d  ! 591: STH_I	sth	%r6, [%r16 + 0x008d]
	.word 0x912c2001  ! 593: SLL_I	sll 	%r16, 0x0001, %r8
	.word 0x928c2929  ! 593: ANDcc_I	andcc 	%r16, 0x0929, %r9
	.word 0xf9240011  ! 593: STF_R	st	%f28, [%r17, %r16]
thr1_irf_ce_39:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_39), 16, 16),1,IRF,ce,15,x, x,x,x, x,x,x)
	.word 0xf2742ac9  ! 597: STX_I	stx	%r25, [%r16 + 0x0ac9]
thr1_resum_intr_744:
!$EV trig_pc_d(1,expr(@VA(.MAIN.thr1_resum_intr_744), 16, 16)) -> intp(1, 3, 1)
	wr      %r0, 0x0, %asr26
!Illinst alu
	.word 0x92141f71  ! 600: OR_R	or 	%r16, %r17, %r9
	.word 0x9a840011  ! 602: ADDcc_R	addcc 	%r16, %r17, %r13
	.word 0x9c9c0011  ! 602: XORcc_R	xorcc 	%r16, %r17, %r14
	.word 0x83643801  ! 602: MOVcc_I	<illegal instruction>
	.word 0xdd2424e7  ! 602: STF_I	st	%f14, [0x04e7, %r16]
thr1_irf_ce_40:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_40), 16, 16),1,IRF,ce,70,x, x,x,x, x,x,x)
	.word 0xd27425bb  ! 606: STX_I	stx	%r9, [%r16 + 0x05bb]
	.word 0x8ab40011  ! 608: ORNcc_R	orncc 	%r16, %r17, %r5
	.word 0xc3ec1011  ! 608: PREFETCHA_R	prefetcha	[%r16, %r17] 0x80, #one_read
!Illinst store
	.word 0xdc741f31  ! 609: STX_R	stx	%r14, [%r16 + %r17]
	.word 0xb12c3001  ! 611: SLLX_I	sllx	%r16, 0x0001, %r24
	.word 0x89a000b1  ! 611: FNEGs	fnegs	%f17, %f4
	.word 0x85340011  ! 613: SRL_R	srl 	%r16, %r17, %r2
	.word 0x9c042a20  ! 613: ADD_I	add 	%r16, 0x0a20, %r14
	.word 0x97340011  ! 613: SRL_R	srl 	%r16, %r17, %r11
	.word 0xb48c23d5  ! 613: ANDcc_I	andcc 	%r16, 0x03d5, %r26
	rd      %pc, %r18
	set     0x20, %r17
	.word 0xd0342ced  ! 614: STH_I	sth	%r8, [%r16 + 0x0ced]
	.word 0x9f641811  ! 616: MOVcc_R	<illegal instruction>
	jmpl     %r18 + %r17, %r31
!Illinst store
	.word 0xce7417b1  ! 616: STX_R	stx	%r7, [%r16 + %r17]
	.word 0x9d2c2001  ! 618: SLL_I	sll 	%r16, 0x0001, %r14
	.word 0xaa3c0011  ! 618: XNOR_R	xnor 	%r16, %r17, %r21
        wr  %g0, 0x80, %asi
!Illinst store
	.word 0xd6241ff1  ! 619: STW_R	stw	%r11, [%r16 + %r17]
	.word 0xcf941011  ! 621: LDQFA_R	-	[%r16, %r17], %f7
	.word 0xca7421c7  ! 624: STX_I	stx	%r5, [%r16 + 0x01c7]
	.word 0xa62c25bb  ! 626: ANDN_I	andn 	%r16, 0x05bb, %r19
	.word 0x933c1011  ! 626: SRAX_R	srax	%r16, %r17, %r9
	.word 0x9e1c0011  ! 626: XOR_R	xor 	%r16, %r17, %r15
	wr      %r0, 0x1, %asr26
thr1_irf_ce_41:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_41), 16, 16),1,IRF,ce,19,x, x,x,x, x,x,x)
	.word 0xfa7420f3  ! 630: STX_I	stx	%r29, [%r16 + 0x00f3]
	.word 0x9e3c0011  ! 632: XNOR_R	xnor 	%r16, %r17, %r15
        wr %g0, 0x4, %fprs
thr1_irf_ce_42:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_42), 16, 16),1,IRF,ce,28,x, x,x,x, x,x,x)
	.word 0xf22421fd  ! 636: STW_I	stw	%r25, [%r16 + 0x01fd]
	.word 0x8a340011  ! 638: ORN_R	orn 	%r16, %r17, %r5
	.word 0x94840011  ! 638: ADDcc_R	addcc 	%r16, %r17, %r10
	rd      %asr26, %r31
	set     0x01f05, %r30
	and     %r31, %r30, %r31
	.word 0xd42424c7  ! 641: STW_I	stw	%r10, [%r16 + 0x04c7]
	.word 0x8143e02f  ! 643: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #StoreStore | #MemIssue 
thr1_irf_ce_43:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_43), 16, 16),1,IRF,ce,1,x, x,x,x, x,x,x)
	.word 0xd43421dd  ! 647: STH_I	sth	%r10, [%r16 + 0x01dd]
	.word 0x829c0011  ! 649: XORcc_R	xorcc 	%r16, %r17, %r1
	.word 0x840c240c  ! 649: AND_I	and 	%r16, 0x040c, %r2
        wr %g0, 0x4, %fprs
	.word 0xf0742db5  ! 652: STX_I	stx	%r24, [%r16 + 0x0db5]
	.word 0xa6c422d1  ! 654: ADDCcc_I	addccc 	%r16, 0x02d1, %r19
	.word 0x94440011  ! 654: ADDC_R	addc 	%r16, %r17, %r10
	.word 0xd0cc259f  ! 654: LDSBA_I	ldsba	[%r16, + 0x059f] %asi, %r8
thr1_irf_ce_44:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_44), 16, 16),1,IRF,ce,61,x, x,x,x, x,x,x)
	.word 0xca242761  ! 658: STW_I	stw	%r5, [%r16 + 0x0761]
	.word 0x9c340011  ! 660: ORN_R	orn 	%r16, %r17, %r14
	.word 0x94bc0011  ! 660: XNORcc_R	xnorcc 	%r16, %r17, %r10
	.word 0xd4c41011  ! 660: LDSWA_R	ldswa	[%r16, %r17] 0x80, %r10
thr1_irf_ce_45:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_45), 16, 16),1,IRF,ce,9,x, x,x,x, x,x,x)
	.word 0xc4742b5d  ! 664: STX_I	stx	%r2, [%r16 + 0x0b5d]
	wr      %r0, 0x5, %asr26
thr1_irf_ce_46:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_46), 16, 16),1,IRF,ce,31,x, x,x,x, x,x,x)
	.word 0xc47429d3  ! 670: STX_I	stx	%r2, [%r16 + 0x09d3]
	.word 0x928427f2  ! 672: ADDcc_I	addcc 	%r16, 0x07f2, %r9
	.word 0xd1e41011  ! 672: CASA_I	casa	[%r16] 0x80, %r17, %r8
thr1_irf_ce_47:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_47), 16, 16),1,IRF,ce,55,x, x,x,x, x,x,x)
	.word 0xd2342ea5  ! 676: STH_I	sth	%r9, [%r16 + 0x0ea5]
	.word 0x952c0011  ! 678: SLL_R	sll 	%r16, %r17, %r10
	.word 0x87ac0a51  ! 678: FCMPd	fcmpd	%fcc<n>, %f16, %f48
!Illinst alu
	.word 0x97643d61  ! 679: MOVcc_I	<illegal instruction>
	.word 0x8d342001  ! 681: SRL_I	srl 	%r16, 0x0001, %r6
	.word 0x9ebc2ff2  ! 681: XNORcc_I	xnorcc 	%r16, 0x0ff2, %r15
	.word 0x889c0011  ! 681: XORcc_R	xorcc 	%r16, %r17, %r4
	.word 0x8ad40011  ! 681: UMULcc_R	umulcc 	%r16, %r17, %r5
!Illinst store
	.word 0xfa341531  ! 682: STH_R	sth	%r29, [%r16 + %r17]
	.word 0x8c2c0011  ! 684: ANDN_R	andn 	%r16, %r17, %r6
	.word 0x8a8c21b5  ! 684: ANDcc_I	andcc 	%r16, 0x01b5, %r5
	.word 0x863c2ac0  ! 684: XNOR_I	xnor 	%r16, 0x0ac0, %r3
	.word 0x845c2023  ! 684: SMUL_I	smul 	%r16, 0x0023, %r2
thr1_irf_ce_48:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_48), 16, 16),1,IRF,ce,55,x, x,x,x, x,x,x)
	.word 0xfa742569  ! 688: STX_I	stx	%r29, [%r16 + 0x0569]
	wr      %r0, 0x5, %asr26
!Illinst store
	.word 0xd0741731  ! 691: STX_R	stx	%r8, [%r16 + %r17]
	.word 0x22800001  ! 693: BE	be,a	<label_0x1>
!Illinst store
	.word 0xd4241531  ! 694: STW_R	stw	%r10, [%r16 + %r17]
	.word 0xb2ac2ba2  ! 696: ANDNcc_I	andncc 	%r16, 0x0ba2, %r25
	.word 0x95341011  ! 696: SRLX_R	srlx	%r16, %r17, %r10
	.word 0x983422bd  ! 696: ORN_I	orn 	%r16, 0x02bd, %r12
	ta	T_CHANGE_HPRIV	! macro
	.word 0xca742193  ! 699: STX_I	stx	%r5, [%r16 + 0x0193]
	.word 0x9f343001  ! 701: SRLX_I	srlx	%r16, 0x0001, %r15
	.word 0x88140011  ! 701: OR_R	or 	%r16, %r17, %r4
	.word 0x992c0011  ! 701: SLL_R	sll 	%r16, %r17, %r12
	ta	T_CHANGE_NONPRIV	! macro
thr1_irf_ce_49:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_49), 16, 16),1,IRF,ce,10,x, x,x,x, x,x,x)
	.word 0xc8242449  ! 705: STW_I	stw	%r4, [%r16 + 0x0449]
	.word 0x8a1c2651  ! 707: XOR_I	xor 	%r16, 0x0651, %r5
	.word 0xa7342001  ! 707: SRL_I	srl 	%r16, 0x0001, %r19
	.word 0x88b424c3  ! 707: ORNcc_I	orncc 	%r16, 0x04c3, %r4
	.word 0xcb841011  ! 707: LDFA_R	lda	[%r16, %r17], %f5
!Illinst alu
	.word 0x98c435b1  ! 708: ADDCcc_I	addccc 	%r16, 0xfffff5b1, %r12
	.word 0x888c227e  ! 710: ANDcc_I	andcc 	%r16, 0x027e, %r4
	.word 0xac940011  ! 710: ORcc_R	orcc 	%r16, %r17, %r22
	.word 0x993c1011  ! 710: SRAX_R	srax	%r16, %r17, %r12
	.word 0xcc0c2de1  ! 710: LDUB_I	ldub	[%r16 + 0x0de1], %r6
!Illinst store
	.word 0xf02415f1  ! 711: STW_R	stw	%r24, [%r16 + %r17]
	.word 0x9f3c1011  ! 713: SRAX_R	srax	%r16, %r17, %r15
	wr      %r0, 0x1, %asr26
	.word 0xda342647  ! 716: STH_I	sth	%r13, [%r16 + 0x0647]
	.word 0xac2c2e87  ! 718: ANDN_I	andn 	%r16, 0x0e87, %r22
	.word 0xb9343001  ! 718: SRLX_I	srlx	%r16, 0x0001, %r28
	.word 0x88b429e6  ! 718: ORNcc_I	orncc 	%r16, 0x09e6, %r4
	ta	T_CHANGE_PRIV	! macro
	.word 0xc4342f0b  ! 721: STH_I	sth	%r2, [%r16 + 0x0f0b]
	.word 0xc36c0011  ! 723: PREFETCH_R	prefetch	[%r16 + %r17], #one_read
!Illinst alu
	.word 0x908c1ff1  ! 724: ANDcc_R	andcc 	%r16, %r17, %r8
	.word 0x8ec40011  ! 726: ADDCcc_R	addccc 	%r16, %r17, %r7
	.word 0x8148c000  ! 726: RDHPR_HINTP	rdhpr	%hintp, %r0
thr1_irf_ce_50:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_50), 16, 16),1,IRF,ce,13,x, x,x,x, x,x,x)
	.word 0xf474216d  ! 730: STX_I	stx	%r26, [%r16 + 0x016d]
	.word 0x9d3c1011  ! 732: SRAX_R	srax	%r16, %r17, %r14
	.word 0xac940011  ! 732: ORcc_R	orcc 	%r16, %r17, %r22
	.word 0xc36c20d5  ! 732: PREFETCH_I	prefetch	[%r16 + 0x00d5], #one_read
!Illinst alu
	.word 0xa81c15f1  ! 733: XOR_R	xor 	%r16, %r17, %r20
	.word 0xaf343001  ! 735: SRLX_I	srlx	%r16, 0x0001, %r23
	.word 0xb61424a6  ! 735: OR_I	or 	%r16, 0x04a6, %r27
	.word 0x892c2001  ! 735: SLL_I	sll 	%r16, 0x0001, %r4
	.word 0x85840011  ! 735: WRCCR_R	wr	%r16, %r17, %ccr
	.word 0xd2242d1b  ! 738: STW_I	stw	%r9, [%r16 + 0x0d1b]
	.word 0xba1c0011  ! 740: XOR_R	xor 	%r16, %r17, %r29
	.word 0x982c2b63  ! 740: ANDN_I	andn 	%r16, 0x0b63, %r12
	.word 0x9f341011  ! 740: SRLX_R	srlx	%r16, %r17, %r15
	.word 0x2ccc0001  ! 740: BRGZ	brgz,a,pt	%r16,<label_0xc0001>
!Illinst store
	.word 0xf8741f71  ! 741: STX_R	stx	%r28, [%r16 + %r17]
	.word 0xba9c0011  ! 743: XORcc_R	xorcc 	%r16, %r17, %r29
	.word 0x880c2376  ! 743: AND_I	and 	%r16, 0x0376, %r4
	.word 0xc3ec1011  ! 743: PREFETCHA_R	prefetcha	[%r16, %r17] 0x80, #one_read
	.word 0xf8242745  ! 746: STW_I	stw	%r28, [%r16 + 0x0745]
	.word 0x992c0011  ! 748: SLL_R	sll 	%r16, %r17, %r12
	.word 0x9cbc0011  ! 748: XNORcc_R	xnorcc 	%r16, %r17, %r14
	.word 0xb9e40011  ! 748: SAVE_R	save	%r16, %r17, %r28
thr1_irf_ce_51:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_51), 16, 16),1,IRF,ce,61,x, x,x,x, x,x,x)
	.word 0xf2242c41  ! 752: STW_I	stw	%r25, [%r16 + 0x0c41]
	.word 0xb4ac0011  ! 754: ANDNcc_R	andncc 	%r16, %r17, %r26
	.word 0xaabc24c4  ! 754: XNORcc_I	xnorcc 	%r16, 0x04c4, %r21
	.word 0xd7142e77  ! 754: LDQF_I	-	[%r16, 0x0e77], %f11
thr1_irf_ce_52:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_52), 16, 16),1,IRF,ce,64,x, x,x,x, x,x,x)
	.word 0xd62421b5  ! 758: STW_I	stw	%r11, [%r16 + 0x01b5]
	.word 0xe8b41011  ! 760: STHA_R	stha	%r20, [%r16 + %r17] 0x80
thr1_irf_ce_53:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_53), 16, 16),1,IRF,ce,47,x, x,x,x, x,x,x)
	.word 0xdc7423f9  ! 764: STX_I	stx	%r14, [%r16 + 0x03f9]
	.word 0xb1643801  ! 766: MOVcc_I	<illegal instruction>
	.word 0xde5c0011  ! 766: LDX_R	ldx	[%r16 + %r17], %r15
!Illinst store
	.word 0xce741d31  ! 767: STX_R	stx	%r7, [%r16 + %r17]
	.word 0x9a840011  ! 769: ADDcc_R	addcc 	%r16, %r17, %r13
	.word 0x883c0011  ! 769: XNOR_R	xnor 	%r16, %r17, %r4
	.word 0x9c940011  ! 769: ORcc_R	orcc 	%r16, %r17, %r14
	.word 0x92dc2838  ! 769: SMULcc_I	smulcc 	%r16, 0x0838, %r9
!Illinst alu
	.word 0x973c3d61  ! 770: SRA_I	srax	%r16, 0x0021, %r11
	.word 0x829c2118  ! 772: XORcc_I	xorcc 	%r16, 0x0118, %r1
	.word 0xb9240011  ! 772: MULScc_R	mulscc 	%r16, %r17, %r28
!Illinst alu
	.word 0xa60c1531  ! 773: AND_R	and 	%r16, %r17, %r19
	.word 0xb93c0011  ! 775: SRA_R	sra 	%r16, %r17, %r28
	.word 0x81dc0011  ! 775: FLUSH_R	flush
	.word 0xae1c0011  ! 777: XOR_R	xor 	%r16, %r17, %r23
	.word 0x94c40011  ! 777: ADDCcc_R	addccc 	%r16, %r17, %r10
	.word 0x932c3001  ! 777: SLLX_I	sllx	%r16, 0x0001, %r9
	.word 0x9e1c284b  ! 777: XOR_I	xor 	%r16, 0x084b, %r15
	.word 0x8f643801  ! 777: MOVcc_I	<illegal instruction>
	rd      %pc, %r18
	set     0x20, %r17
	.word 0xd43421c3  ! 778: STH_I	sth	%r10, [%r16 + 0x01c3]
	.word 0xb6442af4  ! 780: ADDC_I	addc 	%r16, 0x0af4, %r27
	.word 0x92940011  ! 780: ORcc_R	orcc 	%r16, %r17, %r9
	jmpl     %r18 + %r17, %r31
!Illinst store
	.word 0xd22417f1  ! 780: STW_R	stw	%r9, [%r16 + %r17]
	.word 0x93342001  ! 782: SRL_I	srl 	%r16, 0x0001, %r9
	.word 0x913c2001  ! 782: SRA_I	sra 	%r16, 0x0001, %r8
	.word 0x9cbc2df8  ! 782: XNORcc_I	xnorcc 	%r16, 0x0df8, %r14
	.word 0xc36c0011  ! 782: PREFETCH_R	prefetch	[%r16 + %r17], #one_read
!Illinst alu
	.word 0x82bc1771  ! 783: XNORcc_R	xnorcc 	%r16, %r17, %r1
	.word 0xab641811  ! 785: MOVcc_R	<illegal instruction>
	.word 0x95341011  ! 785: SRLX_R	srlx	%r16, %r17, %r10
	.word 0x9a4c2150  ! 785: MULX_I	mulx 	%r16, 0x0150, %r13
!Illinst store
	.word 0xe8741731  ! 786: STX_R	stx	%r20, [%r16 + %r17]
	.word 0x9eb42d94  ! 788: ORNcc_I	orncc 	%r16, 0x0d94, %r15
	.word 0x8d2c2001  ! 788: SLL_I	sll 	%r16, 0x0001, %r6
	ta	T_CHANGE_HPRIV	! macro
!Illinst alu
	.word 0x88ac1771  ! 789: ANDNcc_R	andncc 	%r16, %r17, %r4
	.word 0x832c2001  ! 791: SLL_I	sll 	%r16, 0x0001, %r1
	.word 0xbabc0011  ! 791: XNORcc_R	xnorcc 	%r16, %r17, %r29
	.word 0x88840011  ! 791: ADDcc_R	addcc 	%r16, %r17, %r4
	ta	T_CHANGE_NONHPRIV	! macro
!Illinst store
	.word 0xe62415b1  ! 792: STW_R	stw	%r19, [%r16 + %r17]
	.word 0x9a040011  ! 794: ADD_R	add 	%r16, %r17, %r13
	.word 0xc3ec2f8d  ! 794: PREFETCHA_I	prefetcha	[%r16, + 0x0f8d] %asi, #one_read
thr1_irf_ce_54:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_54), 16, 16),1,IRF,ce,11,x, x,x,x, x,x,x)
	.word 0xd4742905  ! 798: STX_I	stx	%r10, [%r16 + 0x0905]
	.word 0xb29c2dbf  ! 800: XORcc_I	xorcc 	%r16, 0x0dbf, %r25
	.word 0x92842780  ! 800: ADDcc_I	addcc 	%r16, 0x0780, %r9
	.word 0xac840011  ! 800: ADDcc_R	addcc 	%r16, %r17, %r22
	.word 0x26800001  ! 800: BL	bl,a	<label_0x1>
thr1_irf_ce_55:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_55), 16, 16),1,IRF,ce,3,x, x,x,x, x,x,x)
	.word 0xce3421ef  ! 804: STH_I	sth	%r7, [%r16 + 0x01ef]
	.word 0xb2942fec  ! 806: ORcc_I	orcc 	%r16, 0x0fec, %r25
	.word 0x882c235d  ! 806: ANDN_I	andn 	%r16, 0x035d, %r4
	.word 0xeb9c1011  ! 806: LDDFA_R	ldda	[%r16, %r17], %f21
	.word 0x888c0011  ! 808: ANDcc_R	andcc 	%r16, %r17, %r4
	.word 0x84040011  ! 808: ADD_R	add 	%r16, %r17, %r2
	.word 0x8494203a  ! 808: ORcc_I	orcc 	%r16, 0x003a, %r2
	.word 0x852c0011  ! 808: SLL_R	sll 	%r16, %r17, %r2
	.word 0x8c9c0011  ! 808: XORcc_R	xorcc 	%r16, %r17, %r6
	rd      %pc, %r18
	set     0x20, %r17
	.word 0xd634298b  ! 809: STH_I	sth	%r11, [%r16 + 0x098b]
	jmpl     %r18 + %r17, %r31
	.word 0xd6742f37  ! 813: STX_I	stx	%r11, [%r16 + 0x0f37]
	.word 0x8d2c3001  ! 815: SLLX_I	sllx	%r16, 0x0001, %r6
	.word 0x83880000  ! 815: RESTORED	restored
	.word 0x8b7c0411  ! 817: MOVR_R	movre	%r16, %r17, %r5
	.word 0x863c2ce7  ! 817: XNOR_I	xnor 	%r16, 0x0ce7, %r3
	.word 0x8e940011  ! 817: ORcc_R	orcc 	%r16, %r17, %r7
	.word 0x908c284e  ! 817: ANDcc_I	andcc 	%r16, 0x084e, %r8
	.word 0x94c40011  ! 817: ADDCcc_R	addccc 	%r16, %r17, %r10
	.word 0xb92c1011  ! 817: SLLX_R	sllx	%r16, %r17, %r28
	rd      %pc, %r18
	set     0x20, %r17
thr1_irf_ce_56:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_56), 16, 16),1,IRF,ce,32,x, x,x,x, x,x,x)
	.word 0xd4342817  ! 819: STH_I	sth	%r10, [%r16 + 0x0817]
	.word 0x852c2001  ! 821: SLL_I	sll 	%r16, 0x0001, %r2
	.word 0x86440011  ! 821: ADDC_R	addc 	%r16, %r17, %r3
	jmpl     %r18 + %r17, %r31
!Illinst store
	.word 0xdc2417b1  ! 821: STW_R	stw	%r14, [%r16 + %r17]
	.word 0x00800001  ! 823: BN	bn  	<label_0x1>
!Illinst alu
	.word 0x88143f28  ! 824: OR_I	or 	%r16, 0xffffff28, %r4
	.word 0x8e8c2266  ! 826: ANDcc_I	andcc 	%r16, 0x0266, %r7
	.word 0xb60c0011  ! 826: AND_R	and 	%r16, %r17, %r27
	.word 0xc2d41011  ! 826: LDSHA_R	ldsha	[%r16, %r17] 0x80, %r1
	.word 0x9a342f84  ! 828: ORN_I	orn 	%r16, 0x0f84, %r13
	.word 0xae14215c  ! 828: OR_I	or 	%r16, 0x015c, %r23
	.word 0x95343001  ! 828: SRLX_I	srlx	%r16, 0x0001, %r10
	.word 0x889c2caf  ! 828: XORcc_I	xorcc 	%r16, 0x0caf, %r4
	.word 0x977c0411  ! 828: MOVR_R	movre	%r16, %r17, %r11
	.word 0x9d2c2001  ! 828: SLL_I	sll 	%r16, 0x0001, %r14
	rd      %pc, %r18
	set     0x20, %r17
	.word 0xe674255b  ! 829: STX_I	stx	%r19, [%r16 + 0x055b]
	.word 0xb68c2bd5  ! 831: ANDcc_I	andcc 	%r16, 0x0bd5, %r27
	jmpl     %r18 + %r17, %r31
!Illinst alu
	.word 0x9abc17f1  ! 831: XNORcc_R	xnorcc 	%r16, %r17, %r13
	.word 0xae1c25ad  ! 833: XOR_I	xor 	%r16, 0x05ad, %r23
	.word 0x94040011  ! 833: ADD_R	add 	%r16, %r17, %r10
	.word 0x82140011  ! 833: OR_R	or 	%r16, %r17, %r1
	.word 0xf31c0011  ! 833: LDDF_R	ldd	[%r16, %r17], %f25
!Illinst alu
	.word 0xb8843ff6  ! 834: ADDcc_I	addcc 	%r16, 0xfffffff6, %r28
	.word 0x86d40011  ! 836: UMULcc_R	umulcc 	%r16, %r17, %r3
thr1_irf_ce_57:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_57), 16, 16),1,IRF,ce,34,x, x,x,x, x,x,x)
	.word 0xc47422f7  ! 840: STX_I	stx	%r2, [%r16 + 0x02f7]
	.word 0xa6bc2501  ! 842: XNORcc_I	xnorcc 	%r16, 0x0501, %r19
	.word 0x832c3001  ! 842: SLLX_I	sllx	%r16, 0x0001, %r1
	.word 0x8143e01f  ! 842: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #StoreStore | #Lookaside 
!Illinst store
	.word 0xca241ff1  ! 843: STW_R	stw	%r5, [%r16 + %r17]
	.word 0x96c4261f  ! 845: ADDCcc_I	addccc 	%r16, 0x061f, %r11
	.word 0x97641811  ! 845: MOVcc_R	<illegal instruction>
	.word 0xb9341011  ! 845: SRLX_R	srlx	%r16, %r17, %r28
	.word 0xd5140011  ! 845: LDQF_R	-	[%r16, %r17], %f10
!Illinst store
	.word 0xd2241d71  ! 846: STW_R	stw	%r9, [%r16 + %r17]
	.word 0xcca427fa  ! 848: STWA_I	stwa	%r6, [%r16 + 0x07fa] %asi
thr1_irf_ce_58:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_58), 16, 16),1,IRF,ce,50,x, x,x,x, x,x,x)
	.word 0xc4742195  ! 852: STX_I	stx	%r2, [%r16 + 0x0195]
	.word 0xb6442f6b  ! 854: ADDC_I	addc 	%r16, 0x0f6b, %r27
	.word 0x912c3001  ! 854: SLLX_I	sllx	%r16, 0x0001, %r8
	.word 0xd53c0011  ! 854: STDF_R	std	%f10, [%r17, %r16]
thr1_irf_ce_59:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_59), 16, 16),1,IRF,ce,15,x, x,x,x, x,x,x)
	.word 0xd07427d3  ! 858: STX_I	stx	%r8, [%r16 + 0x07d3]
	.word 0xf6b41011  ! 860: STHA_R	stha	%r27, [%r16 + %r17] 0x80
!Illinst store
	.word 0xc4741571  ! 861: STX_R	stx	%r2, [%r16 + %r17]
	.word 0xad641811  ! 863: MOVcc_R	<illegal instruction>
	.word 0xb6fc0011  ! 863: SDIVcc_R	sdivcc 	%r16, %r17, %r27
!Illinst store
	.word 0xf0341531  ! 864: STH_R	sth	%r24, [%r16 + %r17]
	.word 0x961c26ea  ! 866: XOR_I	xor 	%r16, 0x06ea, %r11
	.word 0x9b3c0011  ! 866: SRA_R	sra 	%r16, %r17, %r13
	.word 0x8aac2d03  ! 866: ANDNcc_I	andncc 	%r16, 0x0d03, %r5
	.word 0xd6c4218a  ! 866: LDSWA_I	ldswa	[%r16, + 0x018a] %asi, %r11
!Illinst store
	.word 0xc4241ff1  ! 867: STW_R	stw	%r2, [%r16 + %r17]
	.word 0xf07c0011  ! 869: SWAP_R	swap	%r24, [%r16 + %r17]
	.word 0xc42424f1  ! 872: STW_I	stw	%r2, [%r16 + 0x04f1]
	.word 0x8f7c0411  ! 874: MOVR_R	movre	%r16, %r17, %r7
	.word 0xb5641811  ! 874: MOVcc_R	<illegal instruction>
	.word 0x873c0011  ! 874: SRA_R	sra 	%r16, %r17, %r3
	.word 0x81dc28f5  ! 874: FLUSH_I	flush
!Illinst store
	.word 0xc8741d71  ! 875: STX_R	stx	%r4, [%r16 + %r17]
	.word 0x82440011  ! 877: ADDC_R	addc 	%r16, %r17, %r1
	.word 0x82442aba  ! 877: ADDC_I	addc 	%r16, 0x0aba, %r1
	.word 0xdf841011  ! 877: LDFA_R	lda	[%r16, %r17], %f15
!Illinst store
	.word 0xf4341ff1  ! 878: STH_R	sth	%r26, [%r16 + %r17]
	.word 0x889c2974  ! 880: XORcc_I	xorcc 	%r16, 0x0974, %r4
	.word 0xb9641811  ! 880: MOVcc_R	<illegal instruction>
	.word 0xc36c2b93  ! 880: PREFETCH_I	prefetch	[%r16 + 0x0b93], #one_read
!Illinst alu
	.word 0x84341d71  ! 881: SUBC_R	orn 	%r16, %r17, %r2
	.word 0xb8b4236b  ! 883: ORNcc_I	orncc 	%r16, 0x036b, %r28
	.word 0xc3ec2071  ! 883: PREFETCHA_I	prefetcha	[%r16, + 0x0071] %asi, #one_read
thr1_irf_ce_60:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_60), 16, 16),1,IRF,ce,11,x, x,x,x, x,x,x)
	.word 0xd27420d1  ! 887: STX_I	stx	%r9, [%r16 + 0x00d1]
	.word 0x8c1c2401  ! 889: XOR_I	xor 	%r16, 0x0401, %r6
	.word 0x97343001  ! 889: SRLX_I	srlx	%r16, 0x0001, %r11
	.word 0xa69c0011  ! 889: XORcc_R	xorcc 	%r16, %r17, %r19
thr1_resum_intr_745:
!$EV trig_pc_d(1,expr(@VA(.MAIN.thr1_resum_intr_745), 16, 16)) -> intp(1, 3, 1)
	wr      %r0, 0x0, %asr26
!Illinst store
	.word 0xc83417b1  ! 890: STH_R	sth	%r4, [%r16 + %r17]
	.word 0x84c40011  ! 892: ADDCcc_R	addccc 	%r16, %r17, %r2
        wr %g0, 0x4, %fprs
!Illinst alu
	.word 0x972c3761  ! 893: SLLX_I	sllx	%r16, 0x0021, %r11
	.word 0xb69421b5  ! 895: ORcc_I	orcc 	%r16, 0x01b5, %r27
	.word 0xb23c0011  ! 895: XNOR_R	xnor 	%r16, %r17, %r25
	.word 0xb7343001  ! 895: SRLX_I	srlx	%r16, 0x0001, %r27
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xca742d05  ! 898: STX_I	stx	%r5, [%r16 + 0x0d05]
	.word 0x8a840011  ! 900: ADDcc_R	addcc 	%r16, %r17, %r5
	.word 0x88942218  ! 900: ORcc_I	orcc 	%r16, 0x0218, %r4
	.word 0x94bc2fc3  ! 900: XNORcc_I	xnorcc 	%r16, 0x0fc3, %r10
	.word 0x90dc2e4e  ! 900: SMULcc_I	smulcc 	%r16, 0x0e4e, %r8
!Illinst alu
	.word 0xb4a43fe5  ! 901: SUBcc_I	subcc 	%r16, 0xffffffe5, %r26
	.word 0x993c0011  ! 903: SRA_R	sra 	%r16, %r17, %r12
	.word 0x9e1c0011  ! 903: XOR_R	xor 	%r16, %r17, %r15
	ta	T_CHANGE_PRIV	! macro
!Illinst alu
	.word 0x902c17b1  ! 904: ANDN_R	andn 	%r16, %r17, %r8
	.word 0xad7c0411  ! 906: MOVR_R	movre	%r16, %r17, %r22
	.word 0xada408b1  ! 906: FSUBs	fsubs	%f16, %f17, %f22
!Illinst alu
	.word 0x9a241531  ! 907: SUB_R	sub 	%r16, %r17, %r13
	.word 0x88840011  ! 909: ADDcc_R	addcc 	%r16, %r17, %r4
	.word 0xb02c0011  ! 909: ANDN_R	andn 	%r16, %r17, %r24
	.word 0xba1428e4  ! 909: OR_I	or 	%r16, 0x08e4, %r29
	.word 0xd9140011  ! 909: LDQF_R	-	[%r16, %r17], %f12
!Illinst alu
	.word 0x84341db1  ! 910: ORN_R	orn 	%r16, %r17, %r2
	.word 0xe86c0011  ! 912: LDSTUB_R	ldstub	%r20, [%r16 + %r17]
	.word 0x9f340011  ! 914: SRL_R	srl 	%r16, %r17, %r15
	.word 0xb64429c4  ! 914: ADDC_I	addc 	%r16, 0x09c4, %r27
	.word 0xbb2c1011  ! 914: SLLX_R	sllx	%r16, %r17, %r29
	.word 0xaa2c0011  ! 914: ANDN_R	andn 	%r16, %r17, %r21
	rd      %pc, %r18
	set     0x20, %r17
thr1_irf_ce_61:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_61), 16, 16),1,IRF,ce,55,x, x,x,x, x,x,x)
	.word 0xc424207d  ! 916: STW_I	stw	%r2, [%r16 + 0x007d]
	.word 0x943c2b07  ! 918: XNOR_I	xnor 	%r16, 0x0b07, %r10
	.word 0x86c40011  ! 918: ADDCcc_R	addccc 	%r16, %r17, %r3
	.word 0xb9340011  ! 918: SRL_R	srl 	%r16, %r17, %r28
	return     %r18 + %r17
!Illinst store
	.word 0xc4341fb1  ! 918: STH_R	sth	%r2, [%r16 + %r17]
	.word 0xb0340011  ! 920: ORN_R	orn 	%r16, %r17, %r24
	.word 0xac7425db  ! 920: UDIV_I	udiv 	%r16, 0x05db, %r22
	.word 0xe6742b31  ! 923: STX_I	stx	%r19, [%r16 + 0x0b31]
	.word 0xb42c0011  ! 925: ANDN_R	andn 	%r16, %r17, %r26
        wr  %g0, 0x80, %asi
	.word 0xd2742b13  ! 928: STX_I	stx	%r9, [%r16 + 0x0b13]
	.word 0x913c2001  ! 930: SRA_I	sra 	%r16, 0x0001, %r8
	.word 0x8e840011  ! 930: ADDcc_R	addcc 	%r16, %r17, %r7
	.word 0x9f80268b  ! 930: SIR	sir	0x068b
!Illinst store
	.word 0xf0341f71  ! 931: STH_R	sth	%r24, [%r16 + %r17]
	.word 0xc3ec1011  ! 933: PREFETCHA_R	prefetcha	[%r16, %r17] 0x80, #one_read
!Illinst alu
	.word 0x9a843ff4  ! 934: ADDcc_I	addcc 	%r16, 0xfffffff4, %r13
	.word 0xba840011  ! 936: ADDcc_R	addcc 	%r16, %r17, %r29
	.word 0xd3f42011  ! 936: CASXA_R	casxa	[%r16]%asi, %r17, %r9
!Illinst store
	.word 0xcc341db1  ! 937: STH_R	sth	%r6, [%r16 + %r17]
	.word 0x98940011  ! 939: ORcc_R	orcc 	%r16, %r17, %r12
	.word 0xb28c0011  ! 939: ANDcc_R	andcc 	%r16, %r17, %r25
	.word 0x9f8027fc  ! 939: SIR	sir	0x07fc
thr1_irf_ce_62:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_62), 16, 16),1,IRF,ce,21,x, x,x,x, x,x,x)
	.word 0xde742fe5  ! 943: STX_I	stx	%r15, [%r16 + 0x0fe5]
	.word 0x92ac20b1  ! 945: ANDNcc_I	andncc 	%r16, 0x00b1, %r9
	.word 0x87a84831  ! 945: FMOVE	fmovs	%fcc1, %f17, %f3
	.word 0xc42422db  ! 948: STW_I	stw	%r2, [%r16 + 0x02db]
	.word 0x84bc0011  ! 950: XNORcc_R	xnorcc 	%r16, %r17, %r2
	.word 0x98b42ee0  ! 950: ORNcc_I	orncc 	%r16, 0x0ee0, %r12
	.word 0x81538000  ! 950: RDPR_WSTATE	rdpr	%wstate, %r0
thr1_irf_ce_63:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_63), 16, 16),1,IRF,ce,24,x, x,x,x, x,x,x)
	.word 0xce342c17  ! 954: STH_I	sth	%r7, [%r16 + 0x0c17]
	.word 0xacac22da  ! 956: ANDNcc_I	andncc 	%r16, 0x02da, %r22
	.word 0x829c28dd  ! 956: XORcc_I	xorcc 	%r16, 0x08dd, %r1
	.word 0xb8c42df9  ! 956: ADDCcc_I	addccc 	%r16, 0x0df9, %r28
	.word 0xc3ec1011  ! 956: PREFETCHA_R	prefetcha	[%r16, %r17] 0x80, #one_read
!Illinst store
	.word 0xf0241fb1  ! 957: STW_R	stw	%r24, [%r16 + %r17]
	.word 0x989c24a0  ! 959: XORcc_I	xorcc 	%r16, 0x04a0, %r12
	.word 0xb8ac0011  ! 959: ANDNcc_R	andncc 	%r16, %r17, %r28
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xd0242045  ! 962: STW_I	stw	%r8, [%r16 + 0x0045]
        wr  %g0, 0x80, %asi
!Illinst store
	.word 0xf67415f1  ! 965: STX_R	stx	%r27, [%r16 + %r17]
	.word 0xc9f42011  ! 967: CASXA_R	casxa	[%r16]%asi, %r17, %r4
!Illinst alu
	.word 0x993c3fa1  ! 968: SRAX_I	srax	%r16, 0x0021, %r12
	.word 0x81580000  ! 970: FLUSHW	flushw
	.word 0xda342755  ! 973: STH_I	sth	%r13, [%r16 + 0x0755]
	.word 0x9f342001  ! 975: SRL_I	srl 	%r16, 0x0001, %r15
	.word 0xdcec2f78  ! 975: LDSTUBA_I	ldstuba	%r14, [%r16 + 0x0f78] %asi
!Illinst store
	.word 0xec7415b1  ! 976: STX_R	stx	%r22, [%r16 + %r17]
	.word 0xd68c1011  ! 978: LDUBA_R	lduba	[%r16, %r17] 0x80, %r11
thr1_irf_ce_64:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_64), 16, 16),1,IRF,ce,41,x, x,x,x, x,x,x)
	.word 0xda742df7  ! 982: STX_I	stx	%r13, [%r16 + 0x0df7]
	.word 0x8b2c3001  ! 984: SLLX_I	sllx	%r16, 0x0001, %r5
	.word 0xb93c1011  ! 984: SRAX_R	srax	%r16, %r17, %r28
        wr %g0, 0x4, %fprs
!Illinst alu
	.word 0x8e1c3fef  ! 985: XOR_I	xor 	%r16, 0xffffffef, %r7
	.word 0xa6940011  ! 987: ORcc_R	orcc 	%r16, %r17, %r19
	.word 0x9f802d02  ! 987: SIR	sir	0x0d02
	.word 0xb4b42c0b  ! 989: ORNcc_I	orncc 	%r16, 0x0c0b, %r26
	.word 0x941c24f9  ! 989: XOR_I	xor 	%r16, 0x04f9, %r10
	.word 0xae2c2880  ! 989: ANDN_I	andn 	%r16, 0x0880, %r23
	.word 0x992c0011  ! 989: SLL_R	sll 	%r16, %r17, %r12
	.word 0xb2940011  ! 989: ORcc_R	orcc 	%r16, %r17, %r25
	rd      %pc, %r18
	set     0x20, %r17
thr1_irf_ce_65:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_65), 16, 16),1,IRF,ce,57,x, x,x,x, x,x,x)
	.word 0xc6742427  ! 991: STX_I	stx	%r3, [%r16 + 0x0427]
	return     %r18 + %r17
thr1_irf_ce_66:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_66), 16, 16),1,IRF,ce,28,x, x,x,x, x,x,x)
	.word 0xc6242e4d  ! 996: STW_I	stw	%r3, [%r16 + 0x0e4d]
	.word 0x9eac0011  ! 998: ANDNcc_R	andncc 	%r16, %r17, %r15
	.word 0x0a800001  ! 998: BCS	bcs  	<label_0x1>
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
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
        setx  0x0000000000000530, %g1, %r17
        setx  0x5ae548330cbaf4dd, %g1, %r0
        setx  0x193ba7885ea9f686, %g1, %r1
        setx  0x4c0318089bcc8015, %g1, %r2
        setx  0xd373411e27ce7dc3, %g1, %r3
        setx  0x8069ee9ef57608db, %g1, %r4
        setx  0x48c768e349663288, %g1, %r5
        setx  0xbdfdb53d1b0c7ef8, %g1, %r6
        setx  0x657dd57080c9aba4, %g1, %r7
        setx  0x427aa98eadc19ed0, %g1, %r8
        setx  0x57832bf5ab04ec6f, %g1, %r9
        setx  0xffdd5e3050908823, %g1, %r10
        setx  0xa16da6ab1d457c3a, %g1, %r11
        setx  0x4bc9e9fa98ffab83, %g1, %r12
        setx  0xf5f7d76b86f5b169, %g1, %r13
        setx  0x90d35f6ae66668dd, %g1, %r14
        setx  0xe89a762f27cdb0af, %g1, %r15
        setx  0x32d33813712578d1, %g1, %r18
        setx  0x73f2e6e660bcf0ec, %g1, %r19
        setx  0x406273f55a8ef634, %g1, %r20
        setx  0xec330a040f1af075, %g1, %r21
        setx  0xb57499897b9fb1e8, %g1, %r22
        setx  0xd9bf978767dd1e9f, %g1, %r23
        setx  0xd1d7a5ff941a10b2, %g1, %r24
        setx  0xfd775a4b7b33a4a2, %g1, %r25
        setx  0x4d23624a8b1fd2aa, %g1, %r26
        setx  0xf234092cf9350ecb, %g1, %r27
        setx  0x30632ee12fb024a3, %g1, %r28
        setx  0x5e5585d75efee63e, %g1, %r29
        setx  0xe18cc42bbaa259c8, %g1, %r30
        setx  0x8be77aa01becf022, %g1, %r31
	save %r0, %r0, %r31
        setx  MAIN_BASE_DATA_VA, %r1, %r16
        setx  0x0000000000000f50, %g1, %r17
        setx  0x84b78ace246aba08, %g1, %r0
        setx  0xc14ba93d233b672f, %g1, %r1
        setx  0x01b7d1f5a948913d, %g1, %r2
        setx  0x2d43aff61170f76c, %g1, %r3
        setx  0x76d2a0d6bab4d30c, %g1, %r4
        setx  0x0835d258cbbc3eca, %g1, %r5
        setx  0xe050ee670a5c424d, %g1, %r6
        setx  0x08a7d6c41d9ee764, %g1, %r7
        setx  0x0a4b332df7f37b45, %g1, %r8
        setx  0x9da94044cfe2162d, %g1, %r9
        setx  0xae61fde7a7eaf8ec, %g1, %r10
        setx  0xc9c028a65b722359, %g1, %r11
        setx  0x16ef9bd9c4470baf, %g1, %r12
        setx  0xca5919be0e63f272, %g1, %r13
        setx  0x16b2e54ecfb6b4d7, %g1, %r14
        setx  0x4c3a3491ca07b51d, %g1, %r15
        setx  0x19881303273734c2, %g1, %r18
        setx  0x70025a65b97f69ca, %g1, %r19
        setx  0xee47a4ad20607ed7, %g1, %r20
        setx  0x1ff081d5637a6a9b, %g1, %r21
        setx  0xe20c6a1d1414bffd, %g1, %r22
        setx  0x02aabb3e0c318dca, %g1, %r23
        setx  0xe99bc370a37bfbec, %g1, %r24
        setx  0xce3dc92ead1c2c30, %g1, %r25
        setx  0x5b541c8a7940a264, %g1, %r26
        setx  0x126555e95fbf989b, %g1, %r27
        setx  0x7bbeeb247ad93273, %g1, %r28
        setx  0xa9843979d45eb10f, %g1, %r29
        setx  0xaa7b6ec9db69b625, %g1, %r30
        setx  0xcb2f403d32d2a11c, %g1, %r31
	save %r0, %r0, %r31
        setx  MAIN_BASE_DATA_VA, %r1, %r16
        setx  0x0000000000000960, %g1, %r17
        setx  0xdb9c8166e62b1fd5, %g1, %r0
        setx  0x6d784e85631a7843, %g1, %r1
        setx  0x5267aa058934b5de, %g1, %r2
        setx  0xe81778e04745c15b, %g1, %r3
        setx  0x9f381ab5664a0e21, %g1, %r4
        setx  0x974fbfbf309d3375, %g1, %r5
        setx  0xcfbcf76784c4dbff, %g1, %r6
        setx  0x098dd91378e483f2, %g1, %r7
        setx  0x82616b1366a2836c, %g1, %r8
        setx  0x5405642acce0496e, %g1, %r9
        setx  0x44e22e5ab81ef776, %g1, %r10
        setx  0xf5da27825f5f3959, %g1, %r11
        setx  0x61768dc0116e7fdc, %g1, %r12
        setx  0xbd58f9bf4d9bf8b7, %g1, %r13
        setx  0x9a7c897c636c3084, %g1, %r14
        setx  0x26c1bce5254f9c72, %g1, %r15
        setx  0x1ebb114d68910d7d, %g1, %r18
        setx  0x24c40cb8b0bcd1e1, %g1, %r19
        setx  0x62350b4565e051e8, %g1, %r20
        setx  0x90261980d747447e, %g1, %r21
        setx  0x5ad646203d756e50, %g1, %r22
        setx  0x527b35543a9ce5de, %g1, %r23
        setx  0x0d19643da9fd1994, %g1, %r24
        setx  0x9af1e59132d80244, %g1, %r25
        setx  0xcb6f580be4e83e0f, %g1, %r26
        setx  0x82e993890b93a2a0, %g1, %r27
        setx  0x6b52b4be6e75764a, %g1, %r28
        setx  0x78c212eda19617fc, %g1, %r29
        setx  0x07205cf713e3df3d, %g1, %r30
        setx  0x065b293b6d3da746, %g1, %r31
	save %r0, %r0, %r31
        setx  MAIN_BASE_DATA_VA, %r1, %r16
        setx  0x0000000000000f10, %g1, %r17
        setx  0xf8198202c44ae833, %g1, %r0
        setx  0x077a6fe9ab5443c3, %g1, %r1
        setx  0x40da718637fc6811, %g1, %r2
        setx  0x2cb49e6aed48d83b, %g1, %r3
        setx  0xedb1ec7e034b3995, %g1, %r4
        setx  0xb642d34a7eccb35b, %g1, %r5
        setx  0x6a1ccb2cececd49f, %g1, %r6
        setx  0x9b6a4dbf904937c1, %g1, %r7
        setx  0x3e892df45bf97399, %g1, %r8
        setx  0x48174ad1d50193cc, %g1, %r9
        setx  0x29cfbb79e82eca22, %g1, %r10
        setx  0xa233155b781cff1b, %g1, %r11
        setx  0xc18448ba71e969f1, %g1, %r12
        setx  0x02cda9f60a511cef, %g1, %r13
        setx  0xfbfe429d538fbdbc, %g1, %r14
        setx  0x257291aba4c4cde1, %g1, %r15
        setx  0x6b19dbe941232198, %g1, %r18
        setx  0xe258cddcf0a6ddb3, %g1, %r19
        setx  0x15dd8c4c5afd223d, %g1, %r20
        setx  0x6da562e36d140d6d, %g1, %r21
        setx  0x80be73cc97fee0c3, %g1, %r22
        setx  0x2fd31559854f9400, %g1, %r23
        setx  0x6dc3562e560322d4, %g1, %r24
        setx  0xadb5a32db4a2c79f, %g1, %r25
        setx  0xa38dbe57324f5356, %g1, %r26
        setx  0xad335429602c595b, %g1, %r27
        setx  0x298b4fd36d223347, %g1, %r28
        setx  0xee8297e8c651bb06, %g1, %r29
        setx  0xd5fd65214da78ef6, %g1, %r30
        setx  0x677864f0d5d24d54, %g1, %r31
	save %r0, %r0, %r31
        setx  MAIN_BASE_DATA_VA, %r1, %r16
        setx  0x0000000000000640, %g1, %r17
        setx  0x64a49d22014ea6ab, %g1, %r0
        setx  0xcf7a0fb9370b874a, %g1, %r1
        setx  0x1c9e92653cd00170, %g1, %r2
        setx  0xe8b9cb325d97ea3a, %g1, %r3
        setx  0x0ae989436123f0a7, %g1, %r4
        setx  0x58b9645cc49d7d82, %g1, %r5
        setx  0x9d45635229921470, %g1, %r6
        setx  0x3e873a666ac558fc, %g1, %r7
        setx  0x0daceab46131e8af, %g1, %r8
        setx  0x5f0c71951f705eb5, %g1, %r9
        setx  0x6f92bcf63e4968a2, %g1, %r10
        setx  0x8dd3e5ad66fcf1f7, %g1, %r11
        setx  0xc59934e8f9e24e1e, %g1, %r12
        setx  0xc0ab4ebf577a8ce7, %g1, %r13
        setx  0x1dc73d5c54a8d6ff, %g1, %r14
        setx  0x640cf069d5099488, %g1, %r15
        setx  0x685cc72086c42148, %g1, %r18
        setx  0xfbc8565bd6cd1aac, %g1, %r19
        setx  0x68a1bf87ccbab4f5, %g1, %r20
        setx  0x13dfb0f406c7210a, %g1, %r21
        setx  0x908c2bdc42684414, %g1, %r22
        setx  0x3a36003819f8419e, %g1, %r23
        setx  0xd18641026f6ed43b, %g1, %r24
        setx  0x7f5d1fd69331ec22, %g1, %r25
        setx  0x11f32de6b6a239fb, %g1, %r26
        setx  0x8af7a6928a996b12, %g1, %r27
        setx  0xf02b480f97c7cda9, %g1, %r28
        setx  0x062ad9ac3c5d073d, %g1, %r29
        setx  0x73faa4cb3db2780d, %g1, %r30
        setx  0xad1738dfa9351005, %g1, %r31
	save %r0, %r0, %r31
        setx  MAIN_BASE_DATA_VA, %r1, %r16
        setx  0x0000000000000ad0, %g1, %r17
        setx  0xed4cd93134b43d26, %g1, %r0
        setx  0xefd106aa9fb92988, %g1, %r1
        setx  0x1994ab89d7e37a58, %g1, %r2
        setx  0x528a0f3e44191fc7, %g1, %r3
        setx  0xd4c35a60c109e274, %g1, %r4
        setx  0x66474baa069edf73, %g1, %r5
        setx  0xdd67836d2941b78d, %g1, %r6
        setx  0x0c89a26b45f7dfbb, %g1, %r7
        setx  0x45a407ed270a4571, %g1, %r8
        setx  0x73549e79f7d58908, %g1, %r9
        setx  0x6bc5cfeee7a1e75e, %g1, %r10
        setx  0xe062fc54d4c3df72, %g1, %r11
        setx  0x18bf929ffc046fab, %g1, %r12
        setx  0x796d9bb90357d4a1, %g1, %r13
        setx  0x26b0a5598059e459, %g1, %r14
        setx  0x6870d35f8f7d147d, %g1, %r15
        setx  0xaddd22f5e5c69c64, %g1, %r18
        setx  0xb8e1d6646bbf735b, %g1, %r19
        setx  0xd9f08d75ee66bf69, %g1, %r20
        setx  0xbe39b2fe19334203, %g1, %r21
        setx  0x35bc937e13353ff7, %g1, %r22
        setx  0x7d4fe3d4b7335541, %g1, %r23
        setx  0x972b75aa4f4466b1, %g1, %r24
        setx  0xece6e913329289d6, %g1, %r25
        setx  0xe63f68d54f815021, %g1, %r26
        setx  0x96e2827602605170, %g1, %r27
        setx  0x2ece69133ab9f454, %g1, %r28
        setx  0x4d490e791c9a2bf3, %g1, %r29
        setx  0x5ad52475d90cb33b, %g1, %r30
        setx  0xe7aaafe75e7fb785, %g1, %r31
	save %r0, %r0, %r31
        setx  MAIN_BASE_DATA_VA, %r1, %r16
        setx  0x00000000000009c0, %g1, %r17
        setx  0x752ba995a1bec4b2, %g1, %r0
        setx  0x288ca50f769f4ab6, %g1, %r1
        setx  0xd976cd8a8d14c4e5, %g1, %r2
        setx  0x5b74fa6d27e9835b, %g1, %r3
        setx  0x82779c6bf57918a2, %g1, %r4
        setx  0xe745306006c793cd, %g1, %r5
        setx  0x814eb9a558633c32, %g1, %r6
        setx  0x26c4712b9af5e8c0, %g1, %r7
        setx  0x375bb0428a1f0e12, %g1, %r8
        setx  0x68d4e0dee7a6a1a4, %g1, %r9
        setx  0x534aacb322c0bb0a, %g1, %r10
        setx  0x92ff3e131621e8ec, %g1, %r11
        setx  0x1efef4794c64eaa3, %g1, %r12
        setx  0x1b34535cfd07bed0, %g1, %r13
        setx  0x5647a3699b3ba3f9, %g1, %r14
        setx  0x9dbb4978db4d5d9c, %g1, %r15
        setx  0x84864ee6f71ce494, %g1, %r18
        setx  0x0f5a9ed1d7123a3f, %g1, %r19
        setx  0x92ed9bf226140ee3, %g1, %r20
        setx  0x81629004ded2fd2b, %g1, %r21
        setx  0x365be6e8d475f21e, %g1, %r22
        setx  0xc8b8c417a8cac4bf, %g1, %r23
        setx  0x7181f31e066f4a4a, %g1, %r24
        setx  0x0db6bb99df8a2d69, %g1, %r25
        setx  0xa07a3a505db54062, %g1, %r26
        setx  0xe2bca7181522aae4, %g1, %r27
        setx  0x9572cf0dd0c5d1ad, %g1, %r28
        setx  0xe8bfd4875f1d0a60, %g1, %r29
        setx  0xa423b87ebb0bcd32, %g1, %r30
        setx  0x1c360fa0af8f4f08, %g1, %r31
	save %r0, %r0, %r31
        setx  MAIN_BASE_DATA_VA, %r1, %r16
        setx  0x0000000000000570, %g1, %r17
        setx  0xd24d07ea45731f2d, %g1, %r0
        setx  0x945a809a1528dae5, %g1, %r1
        setx  0x2028763b51272253, %g1, %r2
        setx  0x03478926db648bc4, %g1, %r3
        setx  0x363e7d5cd1a37b21, %g1, %r4
        setx  0x453babba9a8ac6b0, %g1, %r5
        setx  0xc611decc3063cca6, %g1, %r6
        setx  0xe04a29369b0923d9, %g1, %r7
        setx  0xc7ba9f8e0851a2a5, %g1, %r8
        setx  0xab76d8a34807a036, %g1, %r9
        setx  0x513bf1b6e8c4dc22, %g1, %r10
        setx  0xf0b3b159f021c28e, %g1, %r11
        setx  0xc8b135c946bbc76b, %g1, %r12
        setx  0x832b7b64565cdc05, %g1, %r13
        setx  0x388232c0e3f979eb, %g1, %r14
        setx  0xca8409d56ca69d10, %g1, %r15
        setx  0xc939dacd5f41ec06, %g1, %r18
        setx  0x3000f230363def3c, %g1, %r19
        setx  0xef5007985c65e041, %g1, %r20
        setx  0x5965be934468fb7e, %g1, %r21
        setx  0x8851ae5a70aa5fc3, %g1, %r22
        setx  0x567cc1a488e69afb, %g1, %r23
        setx  0x8f282560aa6503d9, %g1, %r24
        setx  0xbef5383be8122367, %g1, %r25
        setx  0x822dcd048fd55b06, %g1, %r26
        setx  0x7ae4fa5f6013d850, %g1, %r27
        setx  0x30cf3a665441a62a, %g1, %r28
        setx  0x40da5abdf5dee6af, %g1, %r29
        setx  0x28908258819bb778, %g1, %r30
        setx  0x8d8ef345a8cfeae0, %g1, %r31
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
	.word 0xc2242cf7  ! 3: STW_I	stw	%r1, [%r16 + 0x0cf7]
	.word 0x8c440011  ! 5: ADDC_R	addc 	%r16, %r17, %r6
	.word 0x848c28a7  ! 5: ANDcc_I	andcc 	%r16, 0x08a7, %r2
	.word 0xf33c2ffa  ! 5: STDF_I	std	%f25, [0x0ffa, %r16]
thr0_irf_ce_0:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_0), 16, 16),1,IRF,ce,21,x, x,x,x, x,x,x)
	.word 0xf2242049  ! 9: STW_I	stw	%r25, [%r16 + 0x0049]
	.word 0x8a840011  ! 11: ADDcc_R	addcc 	%r16, %r17, %r5
	.word 0x868c0011  ! 11: ANDcc_R	andcc 	%r16, %r17, %r3
	ta	T_CHANGE_PRIV	! macro
thr0_irf_ce_1:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_1), 16, 16),1,IRF,ce,36,x, x,x,x, x,x,x)
	.word 0xc674294f  ! 15: STX_I	stx	%r3, [%r16 + 0x094f]
	.word 0x981c0011  ! 17: XOR_R	xor 	%r16, %r17, %r12
	.word 0x9e8423fc  ! 17: ADDcc_I	addcc 	%r16, 0x03fc, %r15
	.word 0x997c0411  ! 17: MOVR_R	movre	%r16, %r17, %r12
	rd      %asr26, %r31
	set     0x01f05, %r30
	and     %r31, %r30, %r31
	.word 0xd8242877  ! 20: STW_I	stw	%r12, [%r16 + 0x0877]
	.word 0x9af42454  ! 22: UDIVcc_I	udivcc 	%r16, 0x0454, %r13
!Illinst store
	.word 0xc6241f31  ! 23: STW_R	stw	%r3, [%r16 + %r17]
	.word 0x8d2c3001  ! 25: SLLX_I	sllx	%r16, 0x0001, %r6
	.word 0x84140011  ! 25: OR_R	or 	%r16, %r17, %r2
thr0_resum_intr_737:
!$EV trig_pc_d(0,expr(@VA(.MAIN.thr0_resum_intr_737), 16, 16)) -> intp(0, 3, 1)
	wr      %r0, 0x4, %asr26
	.word 0xc42420e9  ! 28: STW_I	stw	%r2, [%r16 + 0x00e9]
	.word 0xd4fc1011  ! 30: SWAPA_R	swapa	%r10, [%r16 + %r17] 0x80
!Illinst alu
	.word 0x90841ff1  ! 31: ADDcc_R	addcc 	%r16, %r17, %r8
	.word 0xa8b40011  ! 33: ORNcc_R	orncc 	%r16, %r17, %r20
thr0_resum_intr_738:
!$EV trig_pc_d(0,expr(@VA(.MAIN.thr0_resum_intr_738), 16, 16)) -> intp(0, 3, 1)
	wr      %r0, 0x4, %asr26
thr0_irf_ce_2:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_2), 16, 16),1,IRF,ce,63,x, x,x,x, x,x,x)
	.word 0xe8342501  ! 37: STH_I	sth	%r20, [%r16 + 0x0501]
	.word 0x94b40011  ! 39: ORNcc_R	orncc 	%r16, %r17, %r10
	.word 0xdcac1011  ! 39: STBA_R	stba	%r14, [%r16 + %r17] 0x80
	.word 0xdc7420f3  ! 42: STX_I	stx	%r14, [%r16 + 0x00f3]
	.word 0x943c22db  ! 44: XNOR_I	xnor 	%r16, 0x02db, %r10
	.word 0x86040011  ! 44: ADD_R	add 	%r16, %r17, %r3
	.word 0xf6ec2cec  ! 44: LDSTUBA_I	ldstuba	%r27, [%r16 + 0x0cec] %asi
	.word 0x942c0011  ! 46: ANDN_R	andn 	%r16, %r17, %r10
	.word 0x84bc0011  ! 46: XNORcc_R	xnorcc 	%r16, %r17, %r2
	.word 0xba0c0011  ! 46: AND_R	and 	%r16, %r17, %r29
	.word 0xb4042a81  ! 46: ADD_I	add 	%r16, 0x0a81, %r26
	.word 0x8c1c0011  ! 46: XOR_R	xor 	%r16, %r17, %r6
	rd      %pc, %r18
	set     0x20, %r17
thr0_irf_ce_3:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_3), 16, 16),1,IRF,ce,22,x, x,x,x, x,x,x)
	.word 0xcc742ae1  ! 48: STX_I	stx	%r6, [%r16 + 0x0ae1]
	.word 0x9d343001  ! 50: SRLX_I	srlx	%r16, 0x0001, %r14
	.word 0x98340011  ! 50: ORN_R	orn 	%r16, %r17, %r12
	.word 0xb72c3001  ! 50: SLLX_I	sllx	%r16, 0x0001, %r27
	jmpl     %r18 + %r17, %r31
thr0_irf_ce_4:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_4), 16, 16),1,IRF,ce,26,x, x,x,x, x,x,x)
	.word 0xf63420bf  ! 53: STH_I	sth	%r27, [%r16 + 0x00bf]
	.word 0x81880000  ! 55: SAVED	saved
thr0_irf_ce_5:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_5), 16, 16),1,IRF,ce,70,x, x,x,x, x,x,x)
	.word 0xf674249b  ! 59: STX_I	stx	%r27, [%r16 + 0x049b]
	.word 0x8d7c0411  ! 61: MOVR_R	movre	%r16, %r17, %r6
	.word 0x862c0011  ! 61: ANDN_R	andn 	%r16, %r17, %r3
	.word 0x83ec0011  ! 61: RESTORE_R	restore	%r16, %r17, %r1
thr0_irf_ce_6:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_6), 16, 16),1,IRF,ce,29,x, x,x,x, x,x,x)
	.word 0xc224276b  ! 65: STW_I	stw	%r1, [%r16 + 0x076b]
	.word 0x9f8024c8  ! 67: SIR	sir	0x04c8
!Illinst alu
	.word 0xac441d71  ! 68: ADDC_R	addc 	%r16, %r17, %r22
	.word 0x8ac40011  ! 70: ADDCcc_R	addccc 	%r16, %r17, %r5
	.word 0xb6142cf9  ! 70: OR_I	or 	%r16, 0x0cf9, %r27
	.word 0xcd841011  ! 70: LDFA_R	lda	[%r16, %r17], %f6
!Illinst store
	.word 0xda341f31  ! 71: STH_R	sth	%r13, [%r16 + %r17]
	.word 0xb93c2001  ! 73: SRA_I	sra 	%r16, 0x0001, %r28
	.word 0xcf242ed7  ! 73: STF_I	st	%f7, [0x0ed7, %r16]
	.word 0x829c0011  ! 75: XORcc_R	xorcc 	%r16, %r17, %r1
	.word 0x8c3c26e4  ! 75: XNOR_I	xnor 	%r16, 0x06e4, %r6
	.word 0xb02c0011  ! 75: ANDN_R	andn 	%r16, %r17, %r24
	.word 0x8cbc2453  ! 75: XNORcc_I	xnorcc 	%r16, 0x0453, %r6
	.word 0x828c285f  ! 75: ANDcc_I	andcc 	%r16, 0x085f, %r1
	.word 0x980c0011  ! 75: AND_R	and 	%r16, %r17, %r12
	rd      %pc, %r18
	set     0x20, %r17
	.word 0xd83420b9  ! 76: STH_I	sth	%r12, [%r16 + 0x00b9]
	.word 0x957c2401  ! 78: MOVR_I	movre	%r16, 0x1, %r10
	.word 0xaebc0011  ! 78: XNORcc_R	xnorcc 	%r16, %r17, %r23
	return     %r18 + %r17
	.word 0xee242e5b  ! 80: STW_I	stw	%r23, [%r16 + 0x0e5b]
	.word 0xf6f42bc1  ! 82: STXA_I	stxa	%r27, [%r16 + 0x0bc1] %asi
thr0_irf_ce_7:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_7), 16, 16),1,IRF,ce,17,x, x,x,x, x,x,x)
	.word 0xf6342475  ! 86: STH_I	sth	%r27, [%r16 + 0x0475]
	.word 0x841c2c71  ! 88: XOR_I	xor 	%r16, 0x0c71, %r2
	.word 0x8143e06e  ! 88: MEMBAR	membar	#StoreLoad | #LoadStore | #StoreStore | #MemIssue | #Sync 
thr0_irf_ce_8:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_8), 16, 16),1,IRF,ce,24,x, x,x,x, x,x,x)
	.word 0xc4242523  ! 92: STW_I	stw	%r2, [%r16 + 0x0523]
	.word 0x9a1c0011  ! 94: XOR_R	xor 	%r16, %r17, %r13
	.word 0xa8d42faf  ! 94: UMULcc_I	umulcc 	%r16, 0x0faf, %r20
	.word 0xe824294d  ! 97: STW_I	stw	%r20, [%r16 + 0x094d]
	.word 0x941c0011  ! 99: XOR_R	xor 	%r16, %r17, %r10
	.word 0xb69c28cf  ! 99: XORcc_I	xorcc 	%r16, 0x08cf, %r27
	.word 0x83ec0011  ! 99: RESTORE_R	restore	%r16, %r17, %r1
!Illinst store
	.word 0xee241f31  ! 100: STW_R	stw	%r23, [%r16 + %r17]
	.word 0x82040011  ! 102: ADD_R	add 	%r16, %r17, %r1
	.word 0xa8040011  ! 102: ADD_R	add 	%r16, %r17, %r20
	.word 0x9d2c0011  ! 102: SLL_R	sll 	%r16, %r17, %r14
	.word 0xc3ec1011  ! 102: PREFETCHA_R	prefetcha	[%r16, %r17] 0x80, #one_read
	.word 0xdc742105  ! 105: STX_I	stx	%r14, [%r16 + 0x0105]
	.word 0x8a940011  ! 107: ORcc_R	orcc 	%r16, %r17, %r5
	.word 0xa88c279e  ! 107: ANDcc_I	andcc 	%r16, 0x079e, %r20
	.word 0xb6c42c57  ! 107: ADDCcc_I	addccc 	%r16, 0x0c57, %r27
        wr %g0, 0x4, %fprs
!Illinst store
	.word 0xc87417b1  ! 108: STX_R	stx	%r4, [%r16 + %r17]
	.word 0xba840011  ! 110: ADDcc_R	addcc 	%r16, %r17, %r29
	.word 0x8a340011  ! 110: ORN_R	orn 	%r16, %r17, %r5
	.word 0x868429dc  ! 110: ADDcc_I	addcc 	%r16, 0x09dc, %r3
        wr  %g0, 0x80, %asi
!Illinst store
	.word 0xd47417b1  ! 111: STX_R	stx	%r10, [%r16 + %r17]
	.word 0xacbc0011  ! 113: XNORcc_R	xnorcc 	%r16, %r17, %r22
	.word 0xa8b42e4d  ! 113: ORNcc_I	orncc 	%r16, 0x0e4d, %r20
	.word 0x9f80295f  ! 113: SIR	sir	0x095f
!Illinst alu
	.word 0xb3643f61  ! 114: MOVcc_I	<illegal instruction>
	.word 0xe6d42770  ! 116: LDSHA_I	ldsha	[%r16, + 0x0770] %asi, %r19
	.word 0xac8427f0  ! 118: ADDcc_I	addcc 	%r16, 0x07f0, %r22
	.word 0xae0c0011  ! 118: AND_R	and 	%r16, %r17, %r23
	.word 0x9b2c0011  ! 118: SLL_R	sll 	%r16, %r17, %r13
	.word 0x97341011  ! 118: SRLX_R	srlx	%r16, %r17, %r11
	.word 0x8f2c3001  ! 118: SLLX_I	sllx	%r16, 0x0001, %r7
	.word 0xae0c2615  ! 118: AND_I	and 	%r16, 0x0615, %r23
	rd      %pc, %r18
	set     0x20, %r17
thr0_irf_ce_9:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_9), 16, 16),1,IRF,ce,7,x, x,x,x, x,x,x)
	.word 0xee742f07  ! 120: STX_I	stx	%r23, [%r16 + 0x0f07]
	.word 0x9c3c0011  ! 122: XNOR_R	xnor 	%r16, %r17, %r14
	.word 0xa6840011  ! 122: ADDcc_R	addcc 	%r16, %r17, %r19
	.word 0x837c2401  ! 122: MOVR_I	movre	%r16, 0x1, %r1
	return     %r18 + %r17
thr0_irf_ce_10:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_10), 16, 16),1,IRF,ce,51,x, x,x,x, x,x,x)
	.word 0xc2342a6d  ! 125: STH_I	sth	%r1, [%r16 + 0x0a6d]
	.word 0xaf342001  ! 127: SRL_I	srl 	%r16, 0x0001, %r23
	.word 0x873c1011  ! 127: SRAX_R	srax	%r16, %r17, %r3
	.word 0xd0bc227f  ! 127: STDA_I	stda	%r8, [%r16 + 0x027f] %asi
	.word 0x9c0c2aa5  ! 129: AND_I	and 	%r16, 0x0aa5, %r14
	.word 0x8b2c2001  ! 129: SLL_I	sll 	%r16, 0x0001, %r5
	.word 0x853c1011  ! 129: SRAX_R	srax	%r16, %r17, %r2
	.word 0x8b7c2401  ! 129: MOVR_I	movre	%r16, 0x1, %r5
	.word 0x909c263b  ! 129: XORcc_I	xorcc 	%r16, 0x063b, %r8
	rd      %pc, %r18
	set     0x20, %r17
	.word 0xd0342037  ! 130: STH_I	sth	%r8, [%r16 + 0x0037]
	.word 0x9d2c2001  ! 132: SLL_I	sll 	%r16, 0x0001, %r14
	return     %r18 + %r17
thr0_irf_ce_11:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_11), 16, 16),1,IRF,ce,47,x, x,x,x, x,x,x)
	.word 0xdc24289b  ! 135: STW_I	stw	%r14, [%r16 + 0x089b]
	.word 0x90d40011  ! 137: UMULcc_R	umulcc 	%r16, %r17, %r8
	.word 0x8cc42d42  ! 139: ADDCcc_I	addccc 	%r16, 0x0d42, %r6
	.word 0xb32c2001  ! 139: SLL_I	sll 	%r16, 0x0001, %r25
	.word 0xb3341011  ! 139: SRLX_R	srlx	%r16, %r17, %r25
	.word 0x8a0c0011  ! 139: AND_R	and 	%r16, %r17, %r5
	rd      %pc, %r18
	set     0x20, %r17
	.word 0xca3427cb  ! 140: STH_I	sth	%r5, [%r16 + 0x07cb]
	.word 0xad7c0411  ! 142: MOVR_R	movre	%r16, %r17, %r22
	.word 0x9eac0011  ! 142: ANDNcc_R	andncc 	%r16, %r17, %r15
	.word 0xaa142178  ! 142: OR_I	or 	%r16, 0x0178, %r21
	return     %r18 + %r17
	.word 0xea342323  ! 144: STH_I	sth	%r21, [%r16 + 0x0323]
	.word 0x88ac0011  ! 146: ANDNcc_R	andncc 	%r16, %r17, %r4
	.word 0x98840011  ! 146: ADDcc_R	addcc 	%r16, %r17, %r12
	rd      %asr26, %r31
	set     0x01f05, %r30
	and     %r31, %r30, %r31
!Illinst store
	.word 0xec741d31  ! 147: STX_R	stx	%r22, [%r16 + %r17]
	.word 0x822c0011  ! 149: ANDN_R	andn 	%r16, %r17, %r1
	.word 0x9c9c0011  ! 149: XORcc_R	xorcc 	%r16, %r17, %r14
	.word 0x82940011  ! 149: ORcc_R	orcc 	%r16, %r17, %r1
	wr      %r0, 0x1, %asr26
	.word 0xc2342e07  ! 152: STH_I	sth	%r1, [%r16 + 0x0e07]
	.word 0xaf341011  ! 154: SRLX_R	srlx	%r16, %r17, %r23
	.word 0xb92c3001  ! 154: SLLX_I	sllx	%r16, 0x0001, %r28
	.word 0x1a800001  ! 154: BCC	bcc  	<label_0x1>
	.word 0x877c0411  ! 156: MOVR_R	movre	%r16, %r17, %r3
	.word 0x928c0011  ! 156: ANDcc_R	andcc 	%r16, %r17, %r9
	.word 0x98b40011  ! 156: ORNcc_R	orncc 	%r16, %r17, %r12
	.word 0x821c2079  ! 156: XOR_I	xor 	%r16, 0x0079, %r1
	.word 0x992c1011  ! 156: SLLX_R	sllx	%r16, %r17, %r12
	.word 0x8f2c1011  ! 156: SLLX_R	sllx	%r16, %r17, %r7
	rd      %pc, %r18
	set     0x20, %r17
	.word 0xce3420d9  ! 157: STH_I	sth	%r7, [%r16 + 0x00d9]
	.word 0x9cbc239d  ! 159: XNORcc_I	xnorcc 	%r16, 0x039d, %r14
	jmpl     %r18 + %r17, %r31
!Illinst store
	.word 0xd8241771  ! 159: STW_R	stw	%r12, [%r16 + %r17]
	.word 0x9f8021c4  ! 161: SIR	sir	0x01c4
!Illinst alu
	.word 0xb20c3f3f  ! 162: AND_I	and 	%r16, 0xffffff3f, %r25
	.word 0x94b40011  ! 164: ORNcc_R	orncc 	%r16, %r17, %r10
thr0_resum_intr_739:
!$EV trig_pc_d(0,expr(@VA(.MAIN.thr0_resum_intr_739), 16, 16)) -> intp(0, 3, 1)
	wr      %r0, 0x4, %asr26
!Illinst store
	.word 0xc43415b1  ! 165: STH_R	sth	%r2, [%r16 + %r17]
	.word 0xbabc0011  ! 167: XNORcc_R	xnorcc 	%r16, %r17, %r29
	.word 0x833c2001  ! 167: SRA_I	sra 	%r16, 0x0001, %r1
	.word 0xcbe42011  ! 167: CASA_R	casa	[%r16] %asi, %r17, %r5
	.word 0xca7429a3  ! 170: STX_I	stx	%r5, [%r16 + 0x09a3]
	.word 0x88c40011  ! 172: ADDCcc_R	addccc 	%r16, %r17, %r4
	.word 0x8cbc0011  ! 172: XNORcc_R	xnorcc 	%r16, %r17, %r6
	.word 0x8143e01f  ! 172: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #StoreStore | #Lookaside 
!Illinst alu
	.word 0xb57c17f1  ! 173: MOVR_R	movrcs	%r16, %r17, %r26
	.word 0x9a440011  ! 175: ADDC_R	addc 	%r16, %r17, %r13
	.word 0x942c0011  ! 175: ANDN_R	andn 	%r16, %r17, %r10
	.word 0x8e4c0011  ! 175: MULX_R	mulx 	%r16, %r17, %r7
	.word 0xce742917  ! 178: STX_I	stx	%r7, [%r16 + 0x0917]
	.word 0x8b2c3001  ! 180: SLLX_I	sllx	%r16, 0x0001, %r5
	.word 0x973c1011  ! 180: SRAX_R	srax	%r16, %r17, %r11
	.word 0xa77c0411  ! 180: MOVR_R	movre	%r16, %r17, %r19
	.word 0x0f800003  ! 180: FBU	fbu  	<label_0x3>
!Illinst store
	.word 0xd82417b1  ! 181: STW_R	stw	%r12, [%r16 + %r17]
	.word 0x8d840011  ! 183: WRFPRS_R	wr	%r16, %r17, %fprs
thr0_irf_ce_12:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_12), 16, 16),1,IRF,ce,71,x, x,x,x, x,x,x)
	.word 0xe62428c1  ! 187: STW_I	stw	%r19, [%r16 + 0x08c1]
	.word 0xed140011  ! 189: LDQF_R	-	[%r16, %r17], %f22
!Illinst store
	.word 0xe6241531  ! 190: STW_R	stw	%r19, [%r16 + %r17]
	.word 0x9a042134  ! 192: ADD_I	add 	%r16, 0x0134, %r13
	wr      %r0, 0x1, %asr26
thr0_irf_ce_13:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_13), 16, 16),1,IRF,ce,24,x, x,x,x, x,x,x)
	.word 0xda34254d  ! 196: STH_I	sth	%r13, [%r16 + 0x054d]
	.word 0xba3c2487  ! 198: XNOR_I	xnor 	%r16, 0x0487, %r29
thr0_resum_intr_740:
!$EV trig_pc_d(0,expr(@VA(.MAIN.thr0_resum_intr_740), 16, 16)) -> intp(0, 3, 1)
	wr      %r0, 0x4, %asr26
thr0_irf_ce_14:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_14), 16, 16),1,IRF,ce,41,x, x,x,x, x,x,x)
	.word 0xfa342b0f  ! 202: STH_I	sth	%r29, [%r16 + 0x0b0f]
	.word 0xb6840011  ! 204: ADDcc_R	addcc 	%r16, %r17, %r27
	.word 0xac3c0011  ! 204: XNOR_R	xnor 	%r16, %r17, %r22
	.word 0x8d341011  ! 204: SRLX_R	srlx	%r16, %r17, %r6
	ta	T_CHANGE_NONHPRIV	! macro
!Illinst store
	.word 0xd07417f1  ! 205: STX_R	stx	%r8, [%r16 + %r17]
	.word 0xc3ec1011  ! 207: PREFETCHA_R	prefetcha	[%r16, %r17] 0x80, #one_read
!Illinst alu
	.word 0x88ac1ff1  ! 208: ANDNcc_R	andncc 	%r16, %r17, %r4
	.word 0x9f80282d  ! 210: SIR	sir	0x082d
!Illinst alu
	.word 0x9ea43fe9  ! 211: SUBcc_I	subcc 	%r16, 0xffffffe9, %r15
	.word 0x82040011  ! 213: ADD_R	add 	%r16, %r17, %r1
	.word 0x9f2c1011  ! 213: SLLX_R	sllx	%r16, %r17, %r15
	.word 0x99341011  ! 213: SRLX_R	srlx	%r16, %r17, %r12
	.word 0xd2ec1011  ! 213: LDSTUBA_R	ldstuba	%r9, [%r16 + %r17] 0x80
thr0_irf_ce_15:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_15), 16, 16),1,IRF,ce,7,x, x,x,x, x,x,x)
	.word 0xd224265b  ! 217: STW_I	stw	%r9, [%r16 + 0x065b]
	.word 0x888c2143  ! 219: ANDcc_I	andcc 	%r16, 0x0143, %r4
	.word 0x9b643801  ! 219: MOVcc_I	<illegal instruction>
	.word 0xcc0c0011  ! 219: LDUB_R	ldub	[%r16 + %r17], %r6
!Illinst alu
	.word 0x92241df1  ! 220: SUB_R	sub 	%r16, %r17, %r9
        wr %g0, 0x4, %fprs
thr0_irf_ce_16:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_16), 16, 16),1,IRF,ce,67,x, x,x,x, x,x,x)
	.word 0xcc7423db  ! 226: STX_I	stx	%r6, [%r16 + 0x03db]
	.word 0xc27c0011  ! 228: SWAP_R	swap	%r1, [%r16 + %r17]
	.word 0x92ac0011  ! 230: ANDNcc_R	andncc 	%r16, %r17, %r9
	.word 0x8f7c0411  ! 230: MOVR_R	movre	%r16, %r17, %r7
	.word 0xb4842e2c  ! 230: ADDcc_I	addcc 	%r16, 0x0e2c, %r26
	.word 0xb3340011  ! 230: SRL_R	srl 	%r16, %r17, %r25
	.word 0x862c0011  ! 230: ANDN_R	andn 	%r16, %r17, %r3
	.word 0xa68425b8  ! 230: ADDcc_I	addcc 	%r16, 0x05b8, %r19
	rd      %pc, %r18
	set     0x20, %r17
	.word 0xe674265d  ! 231: STX_I	stx	%r19, [%r16 + 0x065d]
	.word 0x82bc0011  ! 233: XNORcc_R	xnorcc 	%r16, %r17, %r1
	.word 0x893c2001  ! 233: SRA_I	sra 	%r16, 0x0001, %r4
	.word 0x8d3c0011  ! 233: SRA_R	sra 	%r16, %r17, %r6
	return     %r18 + %r17
thr0_irf_ce_17:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_17), 16, 16),1,IRF,ce,23,x, x,x,x, x,x,x)
	.word 0xcc24272b  ! 236: STW_I	stw	%r6, [%r16 + 0x072b]
	.word 0xb48c23f7  ! 238: ANDcc_I	andcc 	%r16, 0x03f7, %r26
	.word 0x953c2001  ! 238: SRA_I	sra 	%r16, 0x0001, %r10
	.word 0x977c2401  ! 238: MOVR_I	movre	%r16, 0x1, %r11
	.word 0xce0c21ad  ! 238: LDUB_I	ldub	[%r16 + 0x01ad], %r7
	.word 0x9a040011  ! 240: ADD_R	add 	%r16, %r17, %r13
	.word 0x94940011  ! 240: ORcc_R	orcc 	%r16, %r17, %r10
	.word 0x9d341011  ! 240: SRLX_R	srlx	%r16, %r17, %r14
	.word 0x82440011  ! 240: ADDC_R	addc 	%r16, %r17, %r1
	.word 0x9aac2fee  ! 240: ANDNcc_I	andncc 	%r16, 0x0fee, %r13
	rd      %pc, %r18
	set     0x20, %r17
thr0_irf_ce_18:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_18), 16, 16),1,IRF,ce,60,x, x,x,x, x,x,x)
	.word 0xda242d2d  ! 242: STW_I	stw	%r13, [%r16 + 0x0d2d]
	.word 0xb8342e2f  ! 244: ORN_I	orn 	%r16, 0x0e2f, %r28
	.word 0x953c2001  ! 244: SRA_I	sra 	%r16, 0x0001, %r10
	return     %r18 + %r17
!Illinst alu
	.word 0x8c2c3f77  ! 244: ANDN_I	andn 	%r16, 0xffffff77, %r6
	.word 0xb6c4249a  ! 246: ADDCcc_I	addccc 	%r16, 0x049a, %r27
	.word 0x9ac40011  ! 246: ADDCcc_R	addccc 	%r16, %r17, %r13
	.word 0x9b2c2001  ! 246: SLL_I	sll 	%r16, 0x0001, %r13
	.word 0xf2540011  ! 246: LDSH_R	ldsh	[%r16 + %r17], %r25
thr0_irf_ce_19:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_19), 16, 16),1,IRF,ce,6,x, x,x,x, x,x,x)
	.word 0xf2742fed  ! 250: STX_I	stx	%r25, [%r16 + 0x0fed]
	rd      %asr26, %r31
	set     0x01f05, %r30
	and     %r31, %r30, %r31
!Illinst store
	.word 0xc4741d71  ! 253: STX_R	stx	%r2, [%r16 + %r17]
	.word 0xae9c25e4  ! 255: XORcc_I	xorcc 	%r16, 0x05e4, %r23
	.word 0x9e442042  ! 255: ADDC_I	addc 	%r16, 0x0042, %r15
	.word 0x8d2c1011  ! 255: SLLX_R	sllx	%r16, %r17, %r6
	wr      %r0, 0x1, %asr26
!Illinst alu
	.word 0x90c415b1  ! 256: ADDCcc_R	addccc 	%r16, %r17, %r8
	.word 0x937c2401  ! 258: MOVR_I	movre	%r16, 0x1, %r9
	.word 0x912c0011  ! 258: SLL_R	sll 	%r16, %r17, %r8
	.word 0x967c29d2  ! 258: SDIV_I	sdiv 	%r16, 0x09d2, %r11
	.word 0xd6242edf  ! 261: STW_I	stw	%r11, [%r16 + 0x0edf]
	.word 0xb00c2f8a  ! 263: AND_I	and 	%r16, 0x0f8a, %r24
	.word 0x984c2045  ! 263: MULX_I	mulx 	%r16, 0x0045, %r12
	.word 0xd8742983  ! 266: STX_I	stx	%r12, [%r16 + 0x0983]
	.word 0xaa340011  ! 268: ORN_R	orn 	%r16, %r17, %r21
	.word 0x8143c000  ! 268: STBAR	stbar
!Illinst store
	.word 0xd2341db1  ! 269: STH_R	sth	%r9, [%r16 + %r17]
	.word 0x8214245e  ! 271: OR_I	or 	%r16, 0x045e, %r1
	.word 0x8c840011  ! 271: ADDcc_R	addcc 	%r16, %r17, %r6
	.word 0x96942a15  ! 271: ORcc_I	orcc 	%r16, 0x0a15, %r11
	.word 0xd51c0011  ! 271: LDDF_R	ldd	[%r16, %r17], %f10
!Illinst alu
	.word 0x9e043f77  ! 272: ADD_I	add 	%r16, 0xffffff77, %r15
	rd      %asr26, %r31
	set     0x01f05, %r30
	and     %r31, %r30, %r31
!Illinst store
	.word 0xee341fb1  ! 275: STH_R	sth	%r23, [%r16 + %r17]
	.word 0x9f2c2001  ! 277: SLL_I	sll 	%r16, 0x0001, %r15
	.word 0xb2842f5a  ! 277: ADDcc_I	addcc 	%r16, 0x0f5a, %r25
        wr %g0, 0x4, %fprs
!Illinst alu
	.word 0x90143de5  ! 278: OR_I	or 	%r16, 0xfffffde5, %r8
	.word 0x963c0011  ! 280: XNOR_R	xnor 	%r16, %r17, %r11
	.word 0xaec42be6  ! 280: ADDCcc_I	addccc 	%r16, 0x0be6, %r23
	.word 0xb6040011  ! 280: ADD_R	add 	%r16, %r17, %r27
	.word 0xd0442fbd  ! 280: LDSW_I	ldsw	[%r16 + 0x0fbd], %r8
!Illinst alu
	.word 0x8c4437fc  ! 281: ADDC_I	addc 	%r16, 0xfffff7fc, %r6
	.word 0x98ac2c9b  ! 283: ANDNcc_I	andncc 	%r16, 0x0c9b, %r12
	.word 0x81518000  ! 283: RDPR_PSTATE	rdpr	%pstate, %r0
thr0_irf_ce_20:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_20), 16, 16),1,IRF,ce,44,x, x,x,x, x,x,x)
	.word 0xd8342305  ! 287: STH_I	sth	%r12, [%r16 + 0x0305]
	.word 0x942c0011  ! 289: ANDN_R	andn 	%r16, %r17, %r10
	.word 0x982c2a8b  ! 289: ANDN_I	andn 	%r16, 0x0a8b, %r12
	wr      %r0, 0x5, %asr26
thr0_irf_ce_21:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_21), 16, 16),1,IRF,ce,54,x, x,x,x, x,x,x)
	.word 0xd874299f  ! 293: STX_I	stx	%r12, [%r16 + 0x099f]
	.word 0x8c9c2375  ! 295: XORcc_I	xorcc 	%r16, 0x0375, %r6
	.word 0x8143e03c  ! 295: MEMBAR	membar	#LoadStore | #StoreStore | #Lookaside | #MemIssue 
	.word 0xcc2421bd  ! 298: STW_I	stw	%r6, [%r16 + 0x01bd]
	.word 0x9c340011  ! 300: ORN_R	orn 	%r16, %r17, %r14
	.word 0xb41c0011  ! 300: XOR_R	xor 	%r16, %r17, %r26
	.word 0x9f802401  ! 300: SIR	sir	0x0401
!Illinst store
	.word 0xfa741f71  ! 301: STX_R	stx	%r29, [%r16 + %r17]
	.word 0x91341011  ! 303: SRLX_R	srlx	%r16, %r17, %r8
	.word 0x821c0011  ! 303: XOR_R	xor 	%r16, %r17, %r1
	.word 0x98340011  ! 303: ORN_R	orn 	%r16, %r17, %r12
	.word 0x85e40011  ! 303: SAVE_R	save	%r16, %r17, %r2
	.word 0xc43421e1  ! 306: STH_I	sth	%r2, [%r16 + 0x01e1]
	.word 0xb8140011  ! 308: OR_R	or 	%r16, %r17, %r28
	.word 0x9d340011  ! 308: SRL_R	srl 	%r16, %r17, %r14
        wr %g0, 0x4, %fprs
!Illinst store
	.word 0xc6241731  ! 309: STW_R	stw	%r3, [%r16 + %r17]
	.word 0x9e840011  ! 311: ADDcc_R	addcc 	%r16, %r17, %r15
	.word 0x8143c000  ! 311: STBAR	stbar
thr0_irf_ce_22:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_22), 16, 16),1,IRF,ce,51,x, x,x,x, x,x,x)
	.word 0xde74274f  ! 315: STX_I	stx	%r15, [%r16 + 0x074f]
	.word 0xb4842d7b  ! 317: ADDcc_I	addcc 	%r16, 0x0d7b, %r26
	.word 0x9c342037  ! 317: ORN_I	orn 	%r16, 0x0037, %r14
	.word 0x95342001  ! 317: SRL_I	srl 	%r16, 0x0001, %r10
	.word 0xf4042eff  ! 317: LDUW_I	lduw	[%r16 + 0x0eff], %r26
!Illinst store
	.word 0xdc741f71  ! 318: STX_R	stx	%r14, [%r16 + %r17]
	.word 0x89643801  ! 320: MOVcc_I	<illegal instruction>
	.word 0x9a540011  ! 320: UMUL_R	umul 	%r16, %r17, %r13
	.word 0xda2422d3  ! 323: STW_I	stw	%r13, [%r16 + 0x02d3]
	.word 0xc3ec1011  ! 325: PREFETCHA_R	prefetcha	[%r16, %r17] 0x80, #one_read
!Illinst alu
	.word 0xb00c1df1  ! 326: AND_R	and 	%r16, %r17, %r24
	.word 0xaab40011  ! 328: ORNcc_R	orncc 	%r16, %r17, %r21
	.word 0x8143e016  ! 328: MEMBAR	membar	#StoreLoad | #LoadStore | #Lookaside 
!Illinst store
	.word 0xd0341fb1  ! 329: STH_R	sth	%r8, [%r16 + %r17]
	.word 0x9abc268d  ! 331: XNORcc_I	xnorcc 	%r16, 0x068d, %r13
        wr  %g0, 0x80, %asi
thr0_irf_ce_23:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_23), 16, 16),1,IRF,ce,24,x, x,x,x, x,x,x)
	.word 0xda2424fd  ! 335: STW_I	stw	%r13, [%r16 + 0x04fd]
	.word 0x9cbc0011  ! 337: XNORcc_R	xnorcc 	%r16, %r17, %r14
	.word 0x921c2047  ! 337: XOR_I	xor 	%r16, 0x0047, %r9
	.word 0xc36c23e9  ! 337: PREFETCH_I	prefetch	[%r16 + 0x03e9], #one_read
thr0_irf_ce_24:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_24), 16, 16),1,IRF,ce,25,x, x,x,x, x,x,x)
	.word 0xd2242f89  ! 341: STW_I	stw	%r9, [%r16 + 0x0f89]
	.word 0xf6dc1011  ! 343: LDXA_R	ldxa	[%r16, %r17] 0x80, %r27
!Illinst store
	.word 0xd0341d31  ! 344: STH_R	sth	%r8, [%r16 + %r17]
	.word 0x972c0011  ! 346: SLL_R	sll 	%r16, %r17, %r11
	.word 0x93e40011  ! 346: SAVE_R	save	%r16, %r17, %r9
!Illinst alu
	.word 0x8c8415f1  ! 347: ADDcc_R	addcc 	%r16, %r17, %r6
	.word 0xde1c0011  ! 349: LDD_R	ldd	[%r16 + %r17], %r15
!Illinst alu
	.word 0xbb2c35e1  ! 350: SLL_I	sllx	%r16, 0x0021, %r29
	.word 0xb82c205d  ! 352: ANDN_I	andn 	%r16, 0x005d, %r28
	.word 0x93342001  ! 352: SRL_I	srl 	%r16, 0x0001, %r9
	.word 0x943c0011  ! 352: XNOR_R	xnor 	%r16, %r17, %r10
	.word 0xded41011  ! 352: LDSHA_R	ldsha	[%r16, %r17] 0x80, %r15
thr0_irf_ce_25:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_25), 16, 16),1,IRF,ce,25,x, x,x,x, x,x,x)
	.word 0xde242b13  ! 356: STW_I	stw	%r15, [%r16 + 0x0b13]
	.word 0xac1c0011  ! 358: XOR_R	xor 	%r16, %r17, %r22
        wr %g0, 0x4, %fprs
!Illinst alu
	.word 0x96bc1fb1  ! 359: XNORcc_R	xnorcc 	%r16, %r17, %r11
	.word 0x90b40011  ! 361: ORNcc_R	orncc 	%r16, %r17, %r8
	.word 0x8c840011  ! 361: ADDcc_R	addcc 	%r16, %r17, %r6
	.word 0x81880000  ! 361: SAVED	saved
	.word 0xcc242521  ! 364: STW_I	stw	%r6, [%r16 + 0x0521]
	.word 0xc86c2b2e  ! 366: LDSTUB_I	ldstub	%r4, [%r16 + 0x0b2e]
	.word 0xc8742d91  ! 369: STX_I	stx	%r4, [%r16 + 0x0d91]
        wr %g0, 0x4, %fprs
thr0_irf_ce_26:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_26), 16, 16),1,IRF,ce,50,x, x,x,x, x,x,x)
	.word 0xc8742445  ! 375: STX_I	stx	%r4, [%r16 + 0x0445]
	.word 0x81dc0011  ! 377: FLUSH_R	flush
	.word 0xc8742345  ! 380: STX_I	stx	%r4, [%r16 + 0x0345]
	.word 0xcc7c0011  ! 382: SWAP_R	swap	%r6, [%r16 + %r17]
!Illinst store
	.word 0xc63415f1  ! 383: STH_R	sth	%r3, [%r16 + %r17]
	.word 0x96c40011  ! 385: ADDCcc_R	addccc 	%r16, %r17, %r11
	.word 0x8f2c1011  ! 385: SLLX_R	sllx	%r16, %r17, %r7
	.word 0x90042631  ! 385: ADD_I	add 	%r16, 0x0631, %r8
	rd      %asr26, %r31
	set     0x01f05, %r30
	and     %r31, %r30, %r31
!Illinst store
	.word 0xf8341731  ! 386: STH_R	sth	%r28, [%r16 + %r17]
	.word 0x82940011  ! 388: ORcc_R	orcc 	%r16, %r17, %r1
	.word 0x8c9c21cc  ! 388: XORcc_I	xorcc 	%r16, 0x01cc, %r6
	.word 0x8a142278  ! 388: OR_I	or 	%r16, 0x0278, %r5
	.word 0xe8a42cdb  ! 388: STWA_I	stwa	%r20, [%r16 + 0x0cdb] %asi
thr0_irf_ce_27:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_27), 16, 16),1,IRF,ce,50,x, x,x,x, x,x,x)
	.word 0xe82429dd  ! 392: STW_I	stw	%r20, [%r16 + 0x09dd]
	.word 0x8f340011  ! 394: SRL_R	srl 	%r16, %r17, %r7
	.word 0xb0340011  ! 394: ORN_R	orn 	%r16, %r17, %r24
	.word 0xaa042a07  ! 394: ADD_I	add 	%r16, 0x0a07, %r21
	.word 0x83880000  ! 394: RESTORED	restored
	.word 0xea342c1b  ! 397: STH_I	sth	%r21, [%r16 + 0x0c1b]
	.word 0x989c0011  ! 399: XORcc_R	xorcc 	%r16, %r17, %r12
	.word 0x9a442cef  ! 399: ADDC_I	addc 	%r16, 0x0cef, %r13
	.word 0x9d342001  ! 399: SRL_I	srl 	%r16, 0x0001, %r14
	.word 0x8143e041  ! 399: MEMBAR	membar	#LoadLoad | #Sync 
!Illinst store
	.word 0xec741731  ! 400: STX_R	stx	%r22, [%r16 + %r17]
	.word 0xb09c241b  ! 402: XORcc_I	xorcc 	%r16, 0x041b, %r24
	.word 0xb22c0011  ! 402: ANDN_R	andn 	%r16, %r17, %r25
        wr %g0, 0x4, %fprs
thr0_irf_ce_28:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_28), 16, 16),1,IRF,ce,29,x, x,x,x, x,x,x)
	.word 0xf2242285  ! 406: STW_I	stw	%r25, [%r16 + 0x0285]
	.word 0x969c0011  ! 408: XORcc_R	xorcc 	%r16, %r17, %r11
	.word 0xc3ec28a2  ! 408: PREFETCHA_I	prefetcha	[%r16, + 0x08a2] %asi, #one_read
!Illinst store
	.word 0xd82417b1  ! 409: STW_R	stw	%r12, [%r16 + %r17]
	.word 0x9c34230d  ! 411: ORN_I	orn 	%r16, 0x030d, %r14
	.word 0xb08c0011  ! 411: ANDcc_R	andcc 	%r16, %r17, %r24
	.word 0x837c2401  ! 411: MOVR_I	movre	%r16, 0x1, %r1
thr0_resum_intr_741:
!$EV trig_pc_d(0,expr(@VA(.MAIN.thr0_resum_intr_741), 16, 16)) -> intp(0, 3, 1)
	wr      %r0, 0x0, %asr26
!Illinst store
	.word 0xce341531  ! 412: STH_R	sth	%r7, [%r16 + %r17]
	.word 0x81dc2575  ! 414: FLUSH_I	flush
!Illinst alu
	.word 0x8c143fbd  ! 415: OR_I	or 	%r16, 0xffffffbd, %r6
	.word 0x94140011  ! 417: OR_R	or 	%r16, %r17, %r10
        wr %g0, 0x4, %fprs
!Illinst alu
	.word 0x823437fa  ! 418: SUBC_I	orn 	%r16, 0xfffff7fa, %r1
	.word 0x968c0011  ! 420: ANDcc_R	andcc 	%r16, %r17, %r11
	.word 0xd8b41011  ! 420: STHA_R	stha	%r12, [%r16 + %r17] 0x80
	.word 0xd824230f  ! 423: STW_I	stw	%r12, [%r16 + 0x030f]
	.word 0xb27c24ea  ! 425: SDIV_I	sdiv 	%r16, 0x04ea, %r25
!Illinst alu
	.word 0x8ec415b1  ! 426: ADDCcc_R	addccc 	%r16, %r17, %r7
	.word 0x932c2001  ! 428: SLL_I	sll 	%r16, 0x0001, %r9
	.word 0x81880000  ! 428: SAVED	saved
thr0_irf_ce_29:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_29), 16, 16),1,IRF,ce,19,x, x,x,x, x,x,x)
	.word 0xd2242f25  ! 432: STW_I	stw	%r9, [%r16 + 0x0f25]
	.word 0xa6b40011  ! 434: ORNcc_R	orncc 	%r16, %r17, %r19
	.word 0xb73c0011  ! 434: SRA_R	sra 	%r16, %r17, %r27
	.word 0x8cb40011  ! 434: ORNcc_R	orncc 	%r16, %r17, %r6
	.word 0x81dc0011  ! 434: FLUSH_R	flush
!Illinst alu
	.word 0x98a417b1  ! 435: SUBcc_R	subcc 	%r16, %r17, %r12
	.word 0xc36c20a2  ! 437: PREFETCH_I	prefetch	[%r16 + 0x00a2], #one_read
!Illinst alu
	.word 0xaa441731  ! 438: ADDC_R	addc 	%r16, %r17, %r21
	.word 0x90040011  ! 440: ADD_R	add 	%r16, %r17, %r8
	.word 0xa81c2ede  ! 440: XOR_I	xor 	%r16, 0x0ede, %r20
	.word 0x9d343001  ! 440: SRLX_I	srlx	%r16, 0x0001, %r14
	.word 0xc4ac2726  ! 440: STBA_I	stba	%r2, [%r16 + 0x0726] %asi
!Illinst alu
	.word 0xb40c3fb8  ! 441: AND_I	and 	%r16, 0xffffffb8, %r26
	.word 0x8ec40011  ! 443: ADDCcc_R	addccc 	%r16, %r17, %r7
	.word 0x9f802028  ! 443: SIR	sir	0x0028
	.word 0xce342a0d  ! 446: STH_I	sth	%r7, [%r16 + 0x0a0d]
	.word 0x96840011  ! 448: ADDcc_R	addcc 	%r16, %r17, %r11
	.word 0x9a342a00  ! 448: ORN_I	orn 	%r16, 0x0a00, %r13
        wr %g0, 0x4, %fprs
!Illinst store
	.word 0xc8341531  ! 449: STH_R	sth	%r4, [%r16 + %r17]
	.word 0xacbc2bde  ! 451: XNORcc_I	xnorcc 	%r16, 0x0bde, %r22
	ta	T_CHANGE_PRIV	! macro
thr0_irf_ce_30:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_30), 16, 16),1,IRF,ce,59,x, x,x,x, x,x,x)
	.word 0xec742d0f  ! 455: STX_I	stx	%r22, [%r16 + 0x0d0f]
	.word 0xb89c0011  ! 457: XORcc_R	xorcc 	%r16, %r17, %r28
	wr      %r0, 0x5, %asr26
thr0_irf_ce_31:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_31), 16, 16),1,IRF,ce,35,x, x,x,x, x,x,x)
	.word 0xf8242ec7  ! 461: STW_I	stw	%r28, [%r16 + 0x0ec7]
	.word 0x833c0011  ! 463: SRA_R	sra 	%r16, %r17, %r1
	.word 0xcc6c0011  ! 463: LDSTUB_R	ldstub	%r6, [%r16 + %r17]
	.word 0xcc742365  ! 466: STX_I	stx	%r6, [%r16 + 0x0365]
	.word 0x98440011  ! 468: ADDC_R	addc 	%r16, %r17, %r12
	.word 0xa9240011  ! 468: MULScc_R	mulscc 	%r16, %r17, %r20
!Illinst store
	.word 0xe6341ff1  ! 469: STH_R	sth	%r19, [%r16 + %r17]
	.word 0xac8c0011  ! 471: ANDcc_R	andcc 	%r16, %r17, %r22
	.word 0x90bc2e3f  ! 471: XNORcc_I	xnorcc 	%r16, 0x0e3f, %r8
thr0_resum_intr_742:
!$EV trig_pc_d(0,expr(@VA(.MAIN.thr0_resum_intr_742), 16, 16)) -> intp(0, 3, 1)
	wr      %r0, 0x4, %asr26
	.word 0xd07421a7  ! 474: STX_I	stx	%r8, [%r16 + 0x01a7]
	.word 0x84940011  ! 476: ORcc_R	orcc 	%r16, %r17, %r2
	.word 0x81dc2fe0  ! 476: FLUSH_I	flush
!Illinst store
	.word 0xc23417b1  ! 477: STH_R	sth	%r1, [%r16 + %r17]
	.word 0x8c8428b2  ! 479: ADDcc_I	addcc 	%r16, 0x08b2, %r6
	.word 0xd88c1011  ! 479: LDUBA_R	lduba	[%r16, %r17] 0x80, %r12
!Illinst alu
	.word 0x9a243da6  ! 480: SUB_I	sub 	%r16, 0xfffffda6, %r13
	.word 0x9cd40011  ! 482: UMULcc_R	umulcc 	%r16, %r17, %r14
!Illinst alu
	.word 0xa61c3ff0  ! 483: XOR_I	xor 	%r16, 0xfffffff0, %r19
        wr  %g0, 0x80, %asi
	.word 0xdc342e05  ! 488: STH_I	sth	%r14, [%r16 + 0x0e05]
	.word 0x852c2001  ! 490: SLL_I	sll 	%r16, 0x0001, %r2
	.word 0x8143c000  ! 490: STBAR	stbar
thr0_irf_ce_32:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_32), 16, 16),1,IRF,ce,6,x, x,x,x, x,x,x)
	.word 0xc4742e31  ! 494: STX_I	stx	%r2, [%r16 + 0x0e31]
	.word 0x8c0c0011  ! 496: AND_R	and 	%r16, %r17, %r6
	.word 0x92ac0011  ! 496: ANDNcc_R	andncc 	%r16, %r17, %r9
	.word 0x86ac22f6  ! 496: ANDNcc_I	andncc 	%r16, 0x02f6, %r3
	.word 0xb9a94831  ! 496: FMOVCS	fmovs	%fcc1, %f17, %f28
thr0_irf_ce_33:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_33), 16, 16),1,IRF,ce,2,x, x,x,x, x,x,x)
	.word 0xf8742301  ! 500: STX_I	stx	%r28, [%r16 + 0x0301]
	.word 0x98ac25c8  ! 502: ANDNcc_I	andncc 	%r16, 0x05c8, %r12
	.word 0xa8c40011  ! 502: ADDCcc_R	addccc 	%r16, %r17, %r20
	.word 0x888c2f16  ! 502: ANDcc_I	andcc 	%r16, 0x0f16, %r4
	.word 0x81580000  ! 502: FLUSHW	flushw
!Illinst alu
	.word 0x94ac3fec  ! 503: ANDNcc_I	andncc 	%r16, 0xffffffec, %r10
	.word 0x860c0011  ! 505: AND_R	and 	%r16, %r17, %r3
	.word 0xac940011  ! 505: ORcc_R	orcc 	%r16, %r17, %r22
	.word 0x84bc0011  ! 505: XNORcc_R	xnorcc 	%r16, %r17, %r2
	.word 0xcb3c0011  ! 505: STDF_R	std	%f5, [%r17, %r16]
	.word 0x929c0011  ! 507: XORcc_R	xorcc 	%r16, %r17, %r9
	.word 0xb0ac0011  ! 507: ANDNcc_R	andncc 	%r16, %r17, %r24
	.word 0xb2c40011  ! 507: ADDCcc_R	addccc 	%r16, %r17, %r25
	.word 0x8c840011  ! 507: ADDcc_R	addcc 	%r16, %r17, %r6
	rd      %pc, %r18
	set     0x20, %r17
	.word 0xcc342ac7  ! 508: STH_I	sth	%r6, [%r16 + 0x0ac7]
	.word 0x837c0411  ! 510: MOVR_R	movre	%r16, %r17, %r1
	jmpl     %r18 + %r17, %r31
!Illinst alu
	.word 0xa63415f1  ! 510: ORN_R	orn 	%r16, %r17, %r19
	.word 0xa8842576  ! 512: ADDcc_I	addcc 	%r16, 0x0576, %r20
	.word 0xc3ec1011  ! 512: PREFETCHA_R	prefetcha	[%r16, %r17] 0x80, #one_read
	.word 0x933c2001  ! 514: SRA_I	sra 	%r16, 0x0001, %r9
	.word 0x872c3001  ! 514: SLLX_I	sllx	%r16, 0x0001, %r3
	.word 0xb89c2725  ! 514: XORcc_I	xorcc 	%r16, 0x0725, %r28
	.word 0xae44270a  ! 514: ADDC_I	addc 	%r16, 0x070a, %r23
	rd      %pc, %r18
	set     0x20, %r17
	.word 0xee742853  ! 515: STX_I	stx	%r23, [%r16 + 0x0853]
	jmpl     %r18 + %r17, %r31
!Illinst store
	.word 0xc2241531  ! 517: STW_R	stw	%r1, [%r16 + %r17]
	.word 0x89340011  ! 519: SRL_R	srl 	%r16, %r17, %r4
	.word 0x98942eb7  ! 519: ORcc_I	orcc 	%r16, 0x0eb7, %r12
	.word 0x2c800001  ! 519: BNEG	bneg,a	<label_0x1>
thr0_irf_ce_34:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_34), 16, 16),1,IRF,ce,12,x, x,x,x, x,x,x)
	.word 0xd8242c23  ! 523: STW_I	stw	%r12, [%r16 + 0x0c23]
	.word 0x860c0011  ! 525: AND_R	and 	%r16, %r17, %r3
	.word 0x98d40011  ! 525: UMULcc_R	umulcc 	%r16, %r17, %r12
thr0_irf_ce_35:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_35), 16, 16),1,IRF,ce,14,x, x,x,x, x,x,x)
	.word 0xd87426ed  ! 529: STX_I	stx	%r12, [%r16 + 0x06ed]
	.word 0x82c42212  ! 531: ADDCcc_I	addccc 	%r16, 0x0212, %r1
	.word 0x863c0011  ! 531: XNOR_R	xnor 	%r16, %r17, %r3
	.word 0xb0ac20b2  ! 531: ANDNcc_I	andncc 	%r16, 0x00b2, %r24
	.word 0xb854247e  ! 531: UMUL_I	umul 	%r16, 0x047e, %r28
!Illinst alu
	.word 0x8cb43fe9  ! 532: ORNcc_I	orncc 	%r16, 0xffffffe9, %r6
	.word 0xb72c2001  ! 534: SLL_I	sll 	%r16, 0x0001, %r27
	.word 0xc4f41011  ! 534: STXA_R	stxa	%r2, [%r16 + %r17] 0x80
!Illinst store
	.word 0xde741731  ! 535: STX_R	stx	%r15, [%r16 + %r17]
	.word 0x8143e05d  ! 537: MEMBAR	membar	#LoadLoad | #LoadStore | #StoreStore | #Lookaside | #Sync 
!Illinst alu
	.word 0x8abc3f78  ! 538: XNORcc_I	xnorcc 	%r16, 0xffffff78, %r5
	.word 0x9c0c26c1  ! 540: AND_I	and 	%r16, 0x06c1, %r14
	.word 0x84342cd3  ! 540: ORN_I	orn 	%r16, 0x0cd3, %r2
	.word 0x83342001  ! 540: SRL_I	srl 	%r16, 0x0001, %r1
	.word 0x81580000  ! 540: FLUSHW	flushw
	.word 0x992c3001  ! 542: SLLX_I	sllx	%r16, 0x0001, %r12
	.word 0x8ac4256c  ! 542: ADDCcc_I	addccc 	%r16, 0x056c, %r5
	.word 0x860421e1  ! 542: ADD_I	add 	%r16, 0x01e1, %r3
	.word 0x96940011  ! 542: ORcc_R	orcc 	%r16, %r17, %r11
	.word 0xb88c0011  ! 542: ANDcc_R	andcc 	%r16, %r17, %r28
	.word 0x9e8c0011  ! 542: ANDcc_R	andcc 	%r16, %r17, %r15
	rd      %pc, %r18
	set     0x20, %r17
	.word 0xde742139  ! 543: STX_I	stx	%r15, [%r16 + 0x0139]
	jmpl     %r18 + %r17, %r31
!Illinst store
	.word 0xec741fb1  ! 545: STX_R	stx	%r22, [%r16 + %r17]
	.word 0xb9643801  ! 547: MOVcc_I	<illegal instruction>
	.word 0x8143c000  ! 547: STBAR	stbar
!Illinst alu
	.word 0xaa9c3fe3  ! 548: XORcc_I	xorcc 	%r16, 0xffffffe3, %r21
	.word 0xb29c0011  ! 550: XORcc_R	xorcc 	%r16, %r17, %r25
	.word 0x973c1011  ! 550: SRAX_R	srax	%r16, %r17, %r11
	.word 0x83880000  ! 550: RESTORED	restored
!Illinst alu
	.word 0xab341ff1  ! 551: SRL_R	srlx	%r16, %r17, %r21
	.word 0xa7ec0011  ! 553: RESTORE_R	restore	%r16, %r17, %r19
!Illinst alu
	.word 0x9f7c1f71  ! 554: MOVR_R	movrvs	%r16, %r17, %r15
	.word 0x9a9c215e  ! 556: XORcc_I	xorcc 	%r16, 0x015e, %r13
thr0_resum_intr_743:
!$EV trig_pc_d(0,expr(@VA(.MAIN.thr0_resum_intr_743), 16, 16)) -> intp(0, 3, 1)
	wr      %r0, 0x0, %asr26
thr0_irf_ce_36:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_36), 16, 16),1,IRF,ce,43,x, x,x,x, x,x,x)
	.word 0xda242873  ! 560: STW_I	stw	%r13, [%r16 + 0x0873]
	.word 0xe6c41011  ! 562: LDSWA_R	ldswa	[%r16, %r17] 0x80, %r19
!Illinst store
	.word 0xdc2417b1  ! 563: STW_R	stw	%r14, [%r16 + %r17]
	.word 0xae842ed0  ! 565: ADDcc_I	addcc 	%r16, 0x0ed0, %r23
	.word 0x88340011  ! 565: ORN_R	orn 	%r16, %r17, %r4
        wr %g0, 0x4, %fprs
	.word 0xc874274b  ! 568: STX_I	stx	%r4, [%r16 + 0x074b]
	.word 0x988c0011  ! 570: ANDcc_R	andcc 	%r16, %r17, %r12
	.word 0x99641811  ! 570: MOVcc_R	<illegal instruction>
	.word 0x81538000  ! 570: RDPR_WSTATE	rdpr	%wstate, %r0
	.word 0x912c0011  ! 572: SLL_R	sll 	%r16, %r17, %r8
	.word 0x85342001  ! 572: SRL_I	srl 	%r16, 0x0001, %r2
	.word 0x94440011  ! 572: ADDC_R	addc 	%r16, %r17, %r10
	.word 0x869c27da  ! 572: XORcc_I	xorcc 	%r16, 0x07da, %r3
	.word 0x88b40011  ! 572: ORNcc_R	orncc 	%r16, %r17, %r4
	.word 0x8c8c0011  ! 572: ANDcc_R	andcc 	%r16, %r17, %r6
	rd      %pc, %r18
	set     0x20, %r17
thr0_irf_ce_37:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_37), 16, 16),1,IRF,ce,39,x, x,x,x, x,x,x)
	.word 0xcc342df3  ! 574: STH_I	sth	%r6, [%r16 + 0x0df3]
	jmpl     %r18 + %r17, %r31
!Illinst alu
	.word 0x8f3415f1  ! 576: SRLX_R	srlx	%r16, %r17, %r7
	.word 0x8e2c0011  ! 578: ANDN_R	andn 	%r16, %r17, %r7
	.word 0xb2b40011  ! 578: ORNcc_R	orncc 	%r16, %r17, %r25
	.word 0x84342552  ! 578: ORN_I	orn 	%r16, 0x0552, %r2
	.word 0xf9841011  ! 578: LDFA_R	lda	[%r16, %r17], %f28
	.word 0x98942421  ! 580: ORcc_I	orcc 	%r16, 0x0421, %r12
	.word 0x9d641811  ! 580: MOVcc_R	<illegal instruction>
	.word 0x8b643801  ! 580: MOVcc_I	<illegal instruction>
	.word 0x8b7c0411  ! 580: MOVR_R	movre	%r16, %r17, %r5
	.word 0xb89c0011  ! 580: XORcc_R	xorcc 	%r16, %r17, %r28
	.word 0x8a2c0011  ! 580: ANDN_R	andn 	%r16, %r17, %r5
	rd      %pc, %r18
	set     0x20, %r17
	.word 0xca2426f7  ! 581: STW_I	stw	%r5, [%r16 + 0x06f7]
	.word 0x88142c95  ! 583: OR_I	or 	%r16, 0x0c95, %r4
	return     %r18 + %r17
	.word 0xc8342ac7  ! 585: STH_I	sth	%r4, [%r16 + 0x0ac7]
	.word 0xb4c40011  ! 587: ADDCcc_R	addccc 	%r16, %r17, %r26
	.word 0x9e340011  ! 587: ORN_R	orn 	%r16, %r17, %r15
	.word 0x9a0c0011  ! 587: AND_R	and 	%r16, %r17, %r13
	.word 0xcc5c241c  ! 587: LDX_I	ldx	[%r16 + 0x041c], %r6
thr0_irf_ce_38:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_38), 16, 16),1,IRF,ce,3,x, x,x,x, x,x,x)
	.word 0xcc3424cf  ! 591: STH_I	sth	%r6, [%r16 + 0x04cf]
	.word 0xb52c2001  ! 593: SLL_I	sll 	%r16, 0x0001, %r26
	.word 0xb48c28dd  ! 593: ANDcc_I	andcc 	%r16, 0x08dd, %r26
	.word 0xf3240011  ! 593: STF_R	st	%f25, [%r17, %r16]
thr0_irf_ce_39:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_39), 16, 16),1,IRF,ce,15,x, x,x,x, x,x,x)
	.word 0xf27427d7  ! 597: STX_I	stx	%r25, [%r16 + 0x07d7]
thr0_resum_intr_744:
!$EV trig_pc_d(0,expr(@VA(.MAIN.thr0_resum_intr_744), 16, 16)) -> intp(0, 3, 1)
	wr      %r0, 0x0, %asr26
!Illinst alu
	.word 0xba141d31  ! 600: OR_R	or 	%r16, %r17, %r29
	.word 0xb6840011  ! 602: ADDcc_R	addcc 	%r16, %r17, %r27
	.word 0x889c0011  ! 602: XORcc_R	xorcc 	%r16, %r17, %r4
	.word 0x9f643801  ! 602: MOVcc_I	<illegal instruction>
	.word 0xd324276e  ! 602: STF_I	st	%f9, [0x076e, %r16]
thr0_irf_ce_40:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_40), 16, 16),1,IRF,ce,70,x, x,x,x, x,x,x)
	.word 0xd2742a65  ! 606: STX_I	stx	%r9, [%r16 + 0x0a65]
	.word 0xa6b40011  ! 608: ORNcc_R	orncc 	%r16, %r17, %r19
	.word 0xc3ec1011  ! 608: PREFETCHA_R	prefetcha	[%r16, %r17] 0x80, #one_read
!Illinst store
	.word 0xc6741ff1  ! 609: STX_R	stx	%r3, [%r16 + %r17]
	.word 0x8b2c3001  ! 611: SLLX_I	sllx	%r16, 0x0001, %r5
	.word 0xafa000b1  ! 611: FNEGs	fnegs	%f17, %f23
	.word 0x87340011  ! 613: SRL_R	srl 	%r16, %r17, %r3
	.word 0x960422b0  ! 613: ADD_I	add 	%r16, 0x02b0, %r11
	.word 0xab340011  ! 613: SRL_R	srl 	%r16, %r17, %r21
	.word 0x908c249c  ! 613: ANDcc_I	andcc 	%r16, 0x049c, %r8
	rd      %pc, %r18
	set     0x20, %r17
	.word 0xd034285d  ! 614: STH_I	sth	%r8, [%r16 + 0x085d]
	.word 0x8b641811  ! 616: MOVcc_R	<illegal instruction>
	jmpl     %r18 + %r17, %r31
!Illinst store
	.word 0xc8741db1  ! 616: STX_R	stx	%r4, [%r16 + %r17]
	.word 0x852c2001  ! 618: SLL_I	sll 	%r16, 0x0001, %r2
	.word 0xb03c0011  ! 618: XNOR_R	xnor 	%r16, %r17, %r24
        wr  %g0, 0x80, %asi
!Illinst store
	.word 0xe6241d71  ! 619: STW_R	stw	%r19, [%r16 + %r17]
	.word 0xcb941011  ! 621: LDQFA_R	-	[%r16, %r17], %f5
	.word 0xca742b4b  ! 624: STX_I	stx	%r5, [%r16 + 0x0b4b]
	.word 0xaa2c2ce9  ! 626: ANDN_I	andn 	%r16, 0x0ce9, %r21
	.word 0xb93c1011  ! 626: SRAX_R	srax	%r16, %r17, %r28
	.word 0xba1c0011  ! 626: XOR_R	xor 	%r16, %r17, %r29
	wr      %r0, 0x1, %asr26
thr0_irf_ce_41:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_41), 16, 16),1,IRF,ce,19,x, x,x,x, x,x,x)
	.word 0xfa7424d9  ! 630: STX_I	stx	%r29, [%r16 + 0x04d9]
	.word 0xb23c0011  ! 632: XNOR_R	xnor 	%r16, %r17, %r25
        wr %g0, 0x4, %fprs
thr0_irf_ce_42:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_42), 16, 16),1,IRF,ce,28,x, x,x,x, x,x,x)
	.word 0xf22421e3  ! 636: STW_I	stw	%r25, [%r16 + 0x01e3]
	.word 0x98340011  ! 638: ORN_R	orn 	%r16, %r17, %r12
	.word 0x94840011  ! 638: ADDcc_R	addcc 	%r16, %r17, %r10
	rd      %asr26, %r31
	set     0x01f05, %r30
	and     %r31, %r30, %r31
	.word 0xd42427c1  ! 641: STW_I	stw	%r10, [%r16 + 0x07c1]
	.word 0x8143e023  ! 643: MEMBAR	membar	#LoadLoad | #StoreLoad | #MemIssue 
thr0_irf_ce_43:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_43), 16, 16),1,IRF,ce,1,x, x,x,x, x,x,x)
	.word 0xd4342597  ! 647: STH_I	sth	%r10, [%r16 + 0x0597]
	.word 0x9e9c0011  ! 649: XORcc_R	xorcc 	%r16, %r17, %r15
	.word 0xb00c2459  ! 649: AND_I	and 	%r16, 0x0459, %r24
        wr %g0, 0x4, %fprs
	.word 0xf074268d  ! 652: STX_I	stx	%r24, [%r16 + 0x068d]
	.word 0x84c42e40  ! 654: ADDCcc_I	addccc 	%r16, 0x0e40, %r2
	.word 0x9a440011  ! 654: ADDC_R	addc 	%r16, %r17, %r13
	.word 0xcacc2bfa  ! 654: LDSBA_I	ldsba	[%r16, + 0x0bfa] %asi, %r5
thr0_irf_ce_44:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_44), 16, 16),1,IRF,ce,61,x, x,x,x, x,x,x)
	.word 0xca24281b  ! 658: STW_I	stw	%r5, [%r16 + 0x081b]
	.word 0x92340011  ! 660: ORN_R	orn 	%r16, %r17, %r9
	.word 0x8ebc0011  ! 660: XNORcc_R	xnorcc 	%r16, %r17, %r7
	.word 0xc4c41011  ! 660: LDSWA_R	ldswa	[%r16, %r17] 0x80, %r2
thr0_irf_ce_45:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_45), 16, 16),1,IRF,ce,9,x, x,x,x, x,x,x)
	.word 0xc4742845  ! 664: STX_I	stx	%r2, [%r16 + 0x0845]
	wr      %r0, 0x5, %asr26
thr0_irf_ce_46:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_46), 16, 16),1,IRF,ce,31,x, x,x,x, x,x,x)
	.word 0xc4742145  ! 670: STX_I	stx	%r2, [%r16 + 0x0145]
	.word 0x9a8429de  ! 672: ADDcc_I	addcc 	%r16, 0x09de, %r13
	.word 0xd3e41011  ! 672: CASA_I	casa	[%r16] 0x80, %r17, %r9
thr0_irf_ce_47:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_47), 16, 16),1,IRF,ce,55,x, x,x,x, x,x,x)
	.word 0xd234280d  ! 676: STH_I	sth	%r9, [%r16 + 0x080d]
	.word 0x992c0011  ! 678: SLL_R	sll 	%r16, %r17, %r12
	.word 0x87ac0a51  ! 678: FCMPd	fcmpd	%fcc<n>, %f16, %f48
!Illinst alu
	.word 0x93643da1  ! 679: MOVcc_I	<illegal instruction>
	.word 0xa9342001  ! 681: SRL_I	srl 	%r16, 0x0001, %r20
	.word 0x98bc2f2b  ! 681: XNORcc_I	xnorcc 	%r16, 0x0f2b, %r12
	.word 0x989c0011  ! 681: XORcc_R	xorcc 	%r16, %r17, %r12
	.word 0x84d40011  ! 681: UMULcc_R	umulcc 	%r16, %r17, %r2
!Illinst store
	.word 0xf0341731  ! 682: STH_R	sth	%r24, [%r16 + %r17]
	.word 0xaa2c0011  ! 684: ANDN_R	andn 	%r16, %r17, %r21
	.word 0x928c279e  ! 684: ANDcc_I	andcc 	%r16, 0x079e, %r9
	.word 0x8c3c294a  ! 684: XNOR_I	xnor 	%r16, 0x094a, %r6
	.word 0xba5c2f06  ! 684: SMUL_I	smul 	%r16, 0x0f06, %r29
thr0_irf_ce_48:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_48), 16, 16),1,IRF,ce,55,x, x,x,x, x,x,x)
	.word 0xfa7426e5  ! 688: STX_I	stx	%r29, [%r16 + 0x06e5]
	wr      %r0, 0x5, %asr26
!Illinst store
	.word 0xd0741f31  ! 691: STX_R	stx	%r8, [%r16 + %r17]
	.word 0x02800003  ! 693: BE	be  	<label_0x3>
!Illinst store
	.word 0xf0241571  ! 694: STW_R	stw	%r24, [%r16 + %r17]
	.word 0x90ac2d1f  ! 696: ANDNcc_I	andncc 	%r16, 0x0d1f, %r8
	.word 0x93341011  ! 696: SRLX_R	srlx	%r16, %r17, %r9
	.word 0x8a342b8d  ! 696: ORN_I	orn 	%r16, 0x0b8d, %r5
	ta	T_CHANGE_HPRIV	! macro
	.word 0xca742971  ! 699: STX_I	stx	%r5, [%r16 + 0x0971]
	.word 0xb9343001  ! 701: SRLX_I	srlx	%r16, 0x0001, %r28
	.word 0x9e140011  ! 701: OR_R	or 	%r16, %r17, %r15
	.word 0x892c0011  ! 701: SLL_R	sll 	%r16, %r17, %r4
	ta	T_CHANGE_NONPRIV	! macro
thr0_irf_ce_49:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_49), 16, 16),1,IRF,ce,10,x, x,x,x, x,x,x)
	.word 0xc824222b  ! 705: STW_I	stw	%r4, [%r16 + 0x022b]
	.word 0xa61c23e1  ! 707: XOR_I	xor 	%r16, 0x03e1, %r19
	.word 0x8d342001  ! 707: SRL_I	srl 	%r16, 0x0001, %r6
	.word 0x94b42efe  ! 707: ORNcc_I	orncc 	%r16, 0x0efe, %r10
	.word 0xf7841011  ! 707: LDFA_R	lda	[%r16, %r17], %f27
!Illinst alu
	.word 0x9cc4377f  ! 708: ADDCcc_I	addccc 	%r16, 0xfffff77f, %r14
	.word 0x988c2c4d  ! 710: ANDcc_I	andcc 	%r16, 0x0c4d, %r12
	.word 0xb6940011  ! 710: ORcc_R	orcc 	%r16, %r17, %r27
	.word 0x913c1011  ! 710: SRAX_R	srax	%r16, %r17, %r8
	.word 0xd00c208c  ! 710: LDUB_I	ldub	[%r16 + 0x008c], %r8
!Illinst store
	.word 0xcc241fb1  ! 711: STW_R	stw	%r6, [%r16 + %r17]
	.word 0x9b3c1011  ! 713: SRAX_R	srax	%r16, %r17, %r13
	wr      %r0, 0x1, %asr26
	.word 0xda3426bf  ! 716: STH_I	sth	%r13, [%r16 + 0x06bf]
	.word 0x922c2f6f  ! 718: ANDN_I	andn 	%r16, 0x0f6f, %r9
	.word 0x89343001  ! 718: SRLX_I	srlx	%r16, 0x0001, %r4
	.word 0x84b42359  ! 718: ORNcc_I	orncc 	%r16, 0x0359, %r2
	ta	T_CHANGE_PRIV	! macro
	.word 0xc43423cb  ! 721: STH_I	sth	%r2, [%r16 + 0x03cb]
	.word 0xc36c0011  ! 723: PREFETCH_R	prefetch	[%r16 + %r17], #one_read
!Illinst alu
	.word 0x868c15f1  ! 724: ANDcc_R	andcc 	%r16, %r17, %r3
	.word 0xb4c40011  ! 726: ADDCcc_R	addccc 	%r16, %r17, %r26
	.word 0x8148c000  ! 726: RDHPR_HINTP	rdhpr	%hintp, %r0
thr0_irf_ce_50:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_50), 16, 16),1,IRF,ce,13,x, x,x,x, x,x,x)
	.word 0xf4742b27  ! 730: STX_I	stx	%r26, [%r16 + 0x0b27]
	.word 0x8b3c1011  ! 732: SRAX_R	srax	%r16, %r17, %r5
	.word 0xaa940011  ! 732: ORcc_R	orcc 	%r16, %r17, %r21
	.word 0xc36c2b6f  ! 732: PREFETCH_I	prefetch	[%r16 + 0x0b6f], #one_read
!Illinst alu
	.word 0x981c1df1  ! 733: XOR_R	xor 	%r16, %r17, %r12
	.word 0x8d343001  ! 735: SRLX_I	srlx	%r16, 0x0001, %r6
	.word 0xa61425c9  ! 735: OR_I	or 	%r16, 0x05c9, %r19
	.word 0x932c2001  ! 735: SLL_I	sll 	%r16, 0x0001, %r9
	.word 0x85840011  ! 735: WRCCR_R	wr	%r16, %r17, %ccr
	.word 0xd2242305  ! 738: STW_I	stw	%r9, [%r16 + 0x0305]
	.word 0x9e1c0011  ! 740: XOR_R	xor 	%r16, %r17, %r15
	.word 0xba2c244e  ! 740: ANDN_I	andn 	%r16, 0x044e, %r29
	.word 0x83341011  ! 740: SRLX_R	srlx	%r16, %r17, %r1
	.word 0x0ccc0001  ! 740: BRGZ	brgz  ,pt	%r16,<label_0xc0001>
!Illinst store
	.word 0xee741f31  ! 741: STX_R	stx	%r23, [%r16 + %r17]
	.word 0xa69c0011  ! 743: XORcc_R	xorcc 	%r16, %r17, %r19
	.word 0xb80c24af  ! 743: AND_I	and 	%r16, 0x04af, %r28
	.word 0xc3ec1011  ! 743: PREFETCHA_R	prefetcha	[%r16, %r17] 0x80, #one_read
	.word 0xf82428cb  ! 746: STW_I	stw	%r28, [%r16 + 0x08cb]
	.word 0x8b2c0011  ! 748: SLL_R	sll 	%r16, %r17, %r5
	.word 0xb6bc0011  ! 748: XNORcc_R	xnorcc 	%r16, %r17, %r27
	.word 0xb3e40011  ! 748: SAVE_R	save	%r16, %r17, %r25
thr0_irf_ce_51:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_51), 16, 16),1,IRF,ce,61,x, x,x,x, x,x,x)
	.word 0xf2242f17  ! 752: STW_I	stw	%r25, [%r16 + 0x0f17]
	.word 0x8cac0011  ! 754: ANDNcc_R	andncc 	%r16, %r17, %r6
	.word 0x98bc2f0e  ! 754: XNORcc_I	xnorcc 	%r16, 0x0f0e, %r12
	.word 0xd714219d  ! 754: LDQF_I	-	[%r16, 0x019d], %f11
thr0_irf_ce_52:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_52), 16, 16),1,IRF,ce,64,x, x,x,x, x,x,x)
	.word 0xd6242e89  ! 758: STW_I	stw	%r11, [%r16 + 0x0e89]
	.word 0xdcb41011  ! 760: STHA_R	stha	%r14, [%r16 + %r17] 0x80
thr0_irf_ce_53:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_53), 16, 16),1,IRF,ce,47,x, x,x,x, x,x,x)
	.word 0xdc7423a5  ! 764: STX_I	stx	%r14, [%r16 + 0x03a5]
	.word 0xa9643801  ! 766: MOVcc_I	<illegal instruction>
	.word 0xd05c0011  ! 766: LDX_R	ldx	[%r16 + %r17], %r8
!Illinst store
	.word 0xde741db1  ! 767: STX_R	stx	%r15, [%r16 + %r17]
	.word 0xaa840011  ! 769: ADDcc_R	addcc 	%r16, %r17, %r21
	.word 0x9c3c0011  ! 769: XNOR_R	xnor 	%r16, %r17, %r14
	.word 0x84940011  ! 769: ORcc_R	orcc 	%r16, %r17, %r2
	.word 0x84dc26fe  ! 769: SMULcc_I	smulcc 	%r16, 0x06fe, %r2
!Illinst alu
	.word 0x973c3fa1  ! 770: SRA_I	srax	%r16, 0x0021, %r11
	.word 0x949c2194  ! 772: XORcc_I	xorcc 	%r16, 0x0194, %r10
	.word 0xab240011  ! 772: MULScc_R	mulscc 	%r16, %r17, %r21
!Illinst alu
	.word 0xba0c1ff1  ! 773: AND_R	and 	%r16, %r17, %r29
	.word 0x9d3c0011  ! 775: SRA_R	sra 	%r16, %r17, %r14
	.word 0x81dc0011  ! 775: FLUSH_R	flush
	.word 0xb21c0011  ! 777: XOR_R	xor 	%r16, %r17, %r25
	.word 0xaac40011  ! 777: ADDCcc_R	addccc 	%r16, %r17, %r21
	.word 0xa92c3001  ! 777: SLLX_I	sllx	%r16, 0x0001, %r20
	.word 0xba1c2887  ! 777: XOR_I	xor 	%r16, 0x0887, %r29
	.word 0x95643801  ! 777: MOVcc_I	<illegal instruction>
	rd      %pc, %r18
	set     0x20, %r17
	.word 0xd43426c7  ! 778: STH_I	sth	%r10, [%r16 + 0x06c7]
	.word 0x8e442c6e  ! 780: ADDC_I	addc 	%r16, 0x0c6e, %r7
	.word 0x90940011  ! 780: ORcc_R	orcc 	%r16, %r17, %r8
	jmpl     %r18 + %r17, %r31
!Illinst store
	.word 0xc2241fb1  ! 780: STW_R	stw	%r1, [%r16 + %r17]
	.word 0xa9342001  ! 782: SRL_I	srl 	%r16, 0x0001, %r20
	.word 0x9b3c2001  ! 782: SRA_I	sra 	%r16, 0x0001, %r13
	.word 0x8ebc2940  ! 782: XNORcc_I	xnorcc 	%r16, 0x0940, %r7
	.word 0xc36c0011  ! 782: PREFETCH_R	prefetch	[%r16 + %r17], #one_read
!Illinst alu
	.word 0x96bc1531  ! 783: XNORcc_R	xnorcc 	%r16, %r17, %r11
	.word 0x97641811  ! 785: MOVcc_R	<illegal instruction>
	.word 0x9d341011  ! 785: SRLX_R	srlx	%r16, %r17, %r14
	.word 0x904c299c  ! 785: MULX_I	mulx 	%r16, 0x099c, %r8
!Illinst store
	.word 0xf0741f71  ! 786: STX_R	stx	%r24, [%r16 + %r17]
	.word 0x8cb42e13  ! 788: ORNcc_I	orncc 	%r16, 0x0e13, %r6
	.word 0x952c2001  ! 788: SLL_I	sll 	%r16, 0x0001, %r10
	ta	T_CHANGE_HPRIV	! macro
!Illinst alu
	.word 0xa8ac1f31  ! 789: ANDNcc_R	andncc 	%r16, %r17, %r20
	.word 0xaf2c2001  ! 791: SLL_I	sll 	%r16, 0x0001, %r23
	.word 0xbabc0011  ! 791: XNORcc_R	xnorcc 	%r16, %r17, %r29
	.word 0x90840011  ! 791: ADDcc_R	addcc 	%r16, %r17, %r8
	ta	T_CHANGE_NONHPRIV	! macro
!Illinst store
	.word 0xcc241571  ! 792: STW_R	stw	%r6, [%r16 + %r17]
	.word 0x94040011  ! 794: ADD_R	add 	%r16, %r17, %r10
	.word 0xc3ec2cb8  ! 794: PREFETCHA_I	prefetcha	[%r16, + 0x0cb8] %asi, #one_read
thr0_irf_ce_54:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_54), 16, 16),1,IRF,ce,11,x, x,x,x, x,x,x)
	.word 0xd4742857  ! 798: STX_I	stx	%r10, [%r16 + 0x0857]
	.word 0x889c295f  ! 800: XORcc_I	xorcc 	%r16, 0x095f, %r4
	.word 0x9c842d8e  ! 800: ADDcc_I	addcc 	%r16, 0x0d8e, %r14
	.word 0x8e840011  ! 800: ADDcc_R	addcc 	%r16, %r17, %r7
	.word 0x26800001  ! 800: BL	bl,a	<label_0x1>
thr0_irf_ce_55:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_55), 16, 16),1,IRF,ce,3,x, x,x,x, x,x,x)
	.word 0xce342b3f  ! 804: STH_I	sth	%r7, [%r16 + 0x0b3f]
	.word 0xb2942fc4  ! 806: ORcc_I	orcc 	%r16, 0x0fc4, %r25
	.word 0xb62c2071  ! 806: ANDN_I	andn 	%r16, 0x0071, %r27
	.word 0xe79c1011  ! 806: LDDFA_R	ldda	[%r16, %r17], %f19
	.word 0x8a8c0011  ! 808: ANDcc_R	andcc 	%r16, %r17, %r5
	.word 0xb4040011  ! 808: ADD_R	add 	%r16, %r17, %r26
	.word 0x90942684  ! 808: ORcc_I	orcc 	%r16, 0x0684, %r8
	.word 0x8b2c0011  ! 808: SLL_R	sll 	%r16, %r17, %r5
	.word 0x969c0011  ! 808: XORcc_R	xorcc 	%r16, %r17, %r11
	rd      %pc, %r18
	set     0x20, %r17
	.word 0xd6342dfb  ! 809: STH_I	sth	%r11, [%r16 + 0x0dfb]
	jmpl     %r18 + %r17, %r31
	.word 0xd6742215  ! 813: STX_I	stx	%r11, [%r16 + 0x0215]
	.word 0xa92c3001  ! 815: SLLX_I	sllx	%r16, 0x0001, %r20
	.word 0x83880000  ! 815: RESTORED	restored
	.word 0x977c0411  ! 817: MOVR_R	movre	%r16, %r17, %r11
	.word 0x8a3c21a3  ! 817: XNOR_I	xnor 	%r16, 0x01a3, %r5
	.word 0xa6940011  ! 817: ORcc_R	orcc 	%r16, %r17, %r19
	.word 0x888c2a01  ! 817: ANDcc_I	andcc 	%r16, 0x0a01, %r4
	.word 0xa8c40011  ! 817: ADDCcc_R	addccc 	%r16, %r17, %r20
	.word 0x952c1011  ! 817: SLLX_R	sllx	%r16, %r17, %r10
	rd      %pc, %r18
	set     0x20, %r17
thr0_irf_ce_56:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_56), 16, 16),1,IRF,ce,32,x, x,x,x, x,x,x)
	.word 0xd43428fb  ! 819: STH_I	sth	%r10, [%r16 + 0x08fb]
	.word 0x872c2001  ! 821: SLL_I	sll 	%r16, 0x0001, %r3
	.word 0x88440011  ! 821: ADDC_R	addc 	%r16, %r17, %r4
	jmpl     %r18 + %r17, %r31
!Illinst store
	.word 0xc8241db1  ! 821: STW_R	stw	%r4, [%r16 + %r17]
	.word 0x00800001  ! 823: BN	bn  	<label_0x1>
!Illinst alu
	.word 0x86143d64  ! 824: OR_I	or 	%r16, 0xfffffd64, %r3
	.word 0xa88c203f  ! 826: ANDcc_I	andcc 	%r16, 0x003f, %r20
	.word 0x960c0011  ! 826: AND_R	and 	%r16, %r17, %r11
	.word 0xd2d41011  ! 826: LDSHA_R	ldsha	[%r16, %r17] 0x80, %r9
	.word 0x9e3423d2  ! 828: ORN_I	orn 	%r16, 0x03d2, %r15
	.word 0xaa142243  ! 828: OR_I	or 	%r16, 0x0243, %r21
	.word 0x85343001  ! 828: SRLX_I	srlx	%r16, 0x0001, %r2
	.word 0x909c2ed1  ! 828: XORcc_I	xorcc 	%r16, 0x0ed1, %r8
	.word 0x957c0411  ! 828: MOVR_R	movre	%r16, %r17, %r10
	.word 0xa72c2001  ! 828: SLL_I	sll 	%r16, 0x0001, %r19
	rd      %pc, %r18
	set     0x20, %r17
	.word 0xe674232b  ! 829: STX_I	stx	%r19, [%r16 + 0x032b]
	.word 0x8a8c2e99  ! 831: ANDcc_I	andcc 	%r16, 0x0e99, %r5
	jmpl     %r18 + %r17, %r31
!Illinst alu
	.word 0x98bc1ff1  ! 831: XNORcc_R	xnorcc 	%r16, %r17, %r12
	.word 0xae1c23ab  ! 833: XOR_I	xor 	%r16, 0x03ab, %r23
	.word 0x9e040011  ! 833: ADD_R	add 	%r16, %r17, %r15
	.word 0xa8140011  ! 833: OR_R	or 	%r16, %r17, %r20
	.word 0xdf1c0011  ! 833: LDDF_R	ldd	[%r16, %r17], %f15
!Illinst alu
	.word 0x8e843d70  ! 834: ADDcc_I	addcc 	%r16, 0xfffffd70, %r7
	.word 0x84d40011  ! 836: UMULcc_R	umulcc 	%r16, %r17, %r2
thr0_irf_ce_57:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_57), 16, 16),1,IRF,ce,34,x, x,x,x, x,x,x)
	.word 0xc47422e3  ! 840: STX_I	stx	%r2, [%r16 + 0x02e3]
	.word 0x94bc2dd9  ! 842: XNORcc_I	xnorcc 	%r16, 0x0dd9, %r10
	.word 0xa92c3001  ! 842: SLLX_I	sllx	%r16, 0x0001, %r20
	.word 0x8143e059  ! 842: MEMBAR	membar	#LoadLoad | #StoreStore | #Lookaside | #Sync 
!Illinst store
	.word 0xda241ff1  ! 843: STW_R	stw	%r13, [%r16 + %r17]
	.word 0xb4c422ff  ! 845: ADDCcc_I	addccc 	%r16, 0x02ff, %r26
	.word 0x8b641811  ! 845: MOVcc_R	<illegal instruction>
	.word 0x97341011  ! 845: SRLX_R	srlx	%r16, %r17, %r11
	.word 0xf9140011  ! 845: LDQF_R	-	[%r16, %r17], %f28
!Illinst store
	.word 0xc6241d31  ! 846: STW_R	stw	%r3, [%r16 + %r17]
	.word 0xc4a420cb  ! 848: STWA_I	stwa	%r2, [%r16 + 0x00cb] %asi
thr0_irf_ce_58:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_58), 16, 16),1,IRF,ce,50,x, x,x,x, x,x,x)
	.word 0xc4742791  ! 852: STX_I	stx	%r2, [%r16 + 0x0791]
	.word 0x98442f51  ! 854: ADDC_I	addc 	%r16, 0x0f51, %r12
	.word 0x8b2c3001  ! 854: SLLX_I	sllx	%r16, 0x0001, %r5
	.word 0xd13c0011  ! 854: STDF_R	std	%f8, [%r17, %r16]
thr0_irf_ce_59:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_59), 16, 16),1,IRF,ce,15,x, x,x,x, x,x,x)
	.word 0xd074291b  ! 858: STX_I	stx	%r8, [%r16 + 0x091b]
	.word 0xdab41011  ! 860: STHA_R	stha	%r13, [%r16 + %r17] 0x80
!Illinst store
	.word 0xdc741f71  ! 861: STX_R	stx	%r14, [%r16 + %r17]
	.word 0xb1641811  ! 863: MOVcc_R	<illegal instruction>
	.word 0x8efc0011  ! 863: SDIVcc_R	sdivcc 	%r16, %r17, %r7
!Illinst store
	.word 0xd43417b1  ! 864: STH_R	sth	%r10, [%r16 + %r17]
	.word 0xb21c211a  ! 866: XOR_I	xor 	%r16, 0x011a, %r25
	.word 0xb33c0011  ! 866: SRA_R	sra 	%r16, %r17, %r25
	.word 0x8cac2758  ! 866: ANDNcc_I	andncc 	%r16, 0x0758, %r6
	.word 0xd2c42803  ! 866: LDSWA_I	ldswa	[%r16, + 0x0803] %asi, %r9
!Illinst store
	.word 0xd0241d31  ! 867: STW_R	stw	%r8, [%r16 + %r17]
	.word 0xc47c0011  ! 869: SWAP_R	swap	%r2, [%r16 + %r17]
	.word 0xc42429e1  ! 872: STW_I	stw	%r2, [%r16 + 0x09e1]
	.word 0x9d7c0411  ! 874: MOVR_R	movre	%r16, %r17, %r14
	.word 0x85641811  ! 874: MOVcc_R	<illegal instruction>
	.word 0x9d3c0011  ! 874: SRA_R	sra 	%r16, %r17, %r14
	.word 0x81dc2e94  ! 874: FLUSH_I	flush
!Illinst store
	.word 0xd87415f1  ! 875: STX_R	stx	%r12, [%r16 + %r17]
	.word 0xb6440011  ! 877: ADDC_R	addc 	%r16, %r17, %r27
	.word 0x9a4429ce  ! 877: ADDC_I	addc 	%r16, 0x09ce, %r13
	.word 0xdd841011  ! 877: LDFA_R	lda	[%r16, %r17], %f14
!Illinst store
	.word 0xf83415f1  ! 878: STH_R	sth	%r28, [%r16 + %r17]
	.word 0x829c2702  ! 880: XORcc_I	xorcc 	%r16, 0x0702, %r1
	.word 0x95641811  ! 880: MOVcc_R	<illegal instruction>
	.word 0xc36c2fd4  ! 880: PREFETCH_I	prefetch	[%r16 + 0x0fd4], #one_read
!Illinst alu
	.word 0x90341571  ! 881: SUBC_R	orn 	%r16, %r17, %r8
	.word 0x92b42077  ! 883: ORNcc_I	orncc 	%r16, 0x0077, %r9
	.word 0xc3ec298d  ! 883: PREFETCHA_I	prefetcha	[%r16, + 0x098d] %asi, #one_read
thr0_irf_ce_60:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_60), 16, 16),1,IRF,ce,11,x, x,x,x, x,x,x)
	.word 0xd27429ff  ! 887: STX_I	stx	%r9, [%r16 + 0x09ff]
	.word 0x881c29ad  ! 889: XOR_I	xor 	%r16, 0x09ad, %r4
	.word 0x89343001  ! 889: SRLX_I	srlx	%r16, 0x0001, %r4
	.word 0x989c0011  ! 889: XORcc_R	xorcc 	%r16, %r17, %r12
thr0_resum_intr_745:
!$EV trig_pc_d(0,expr(@VA(.MAIN.thr0_resum_intr_745), 16, 16)) -> intp(0, 3, 1)
	wr      %r0, 0x0, %asr26
!Illinst store
	.word 0xdc341531  ! 890: STH_R	sth	%r14, [%r16 + %r17]
	.word 0x88c40011  ! 892: ADDCcc_R	addccc 	%r16, %r17, %r4
        wr %g0, 0x4, %fprs
!Illinst alu
	.word 0xa92c3f21  ! 893: SLLX_I	sllx	%r16, 0x0021, %r20
	.word 0x84942028  ! 895: ORcc_I	orcc 	%r16, 0x0028, %r2
	.word 0x843c0011  ! 895: XNOR_R	xnor 	%r16, %r17, %r2
	.word 0x8b343001  ! 895: SRLX_I	srlx	%r16, 0x0001, %r5
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xca742173  ! 898: STX_I	stx	%r5, [%r16 + 0x0173]
	.word 0x96840011  ! 900: ADDcc_R	addcc 	%r16, %r17, %r11
	.word 0xb6942a71  ! 900: ORcc_I	orcc 	%r16, 0x0a71, %r27
	.word 0x8abc2a62  ! 900: XNORcc_I	xnorcc 	%r16, 0x0a62, %r5
	.word 0x86dc2e48  ! 900: SMULcc_I	smulcc 	%r16, 0x0e48, %r3
!Illinst alu
	.word 0x90a43fbb  ! 901: SUBcc_I	subcc 	%r16, 0xffffffbb, %r8
	.word 0x993c0011  ! 903: SRA_R	sra 	%r16, %r17, %r12
	.word 0x901c0011  ! 903: XOR_R	xor 	%r16, %r17, %r8
	ta	T_CHANGE_PRIV	! macro
!Illinst alu
	.word 0xb02c1f31  ! 904: ANDN_R	andn 	%r16, %r17, %r24
	.word 0xb77c0411  ! 906: MOVR_R	movre	%r16, %r17, %r27
	.word 0xa9a408b1  ! 906: FSUBs	fsubs	%f16, %f17, %f20
!Illinst alu
	.word 0x8c2415f1  ! 907: SUB_R	sub 	%r16, %r17, %r6
	.word 0xb8840011  ! 909: ADDcc_R	addcc 	%r16, %r17, %r28
	.word 0x962c0011  ! 909: ANDN_R	andn 	%r16, %r17, %r11
	.word 0x8a142487  ! 909: OR_I	or 	%r16, 0x0487, %r5
	.word 0xc3140011  ! 909: LDQF_R	-	[%r16, %r17], %f1
!Illinst alu
	.word 0xb4341ff1  ! 910: ORN_R	orn 	%r16, %r17, %r26
	.word 0xe66c0011  ! 912: LDSTUB_R	ldstub	%r19, [%r16 + %r17]
	.word 0xbb340011  ! 914: SRL_R	srl 	%r16, %r17, %r29
	.word 0xba44291b  ! 914: ADDC_I	addc 	%r16, 0x091b, %r29
	.word 0xab2c1011  ! 914: SLLX_R	sllx	%r16, %r17, %r21
	.word 0x842c0011  ! 914: ANDN_R	andn 	%r16, %r17, %r2
	rd      %pc, %r18
	set     0x20, %r17
thr0_irf_ce_61:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_61), 16, 16),1,IRF,ce,55,x, x,x,x, x,x,x)
	.word 0xc4242fe1  ! 916: STW_I	stw	%r2, [%r16 + 0x0fe1]
	.word 0xb83c2948  ! 918: XNOR_I	xnor 	%r16, 0x0948, %r28
	.word 0x88c40011  ! 918: ADDCcc_R	addccc 	%r16, %r17, %r4
	.word 0x8d340011  ! 918: SRL_R	srl 	%r16, %r17, %r6
	return     %r18 + %r17
!Illinst store
	.word 0xde341571  ! 918: STH_R	sth	%r15, [%r16 + %r17]
	.word 0x8e340011  ! 920: ORN_R	orn 	%r16, %r17, %r7
	.word 0xa6742ea7  ! 920: UDIV_I	udiv 	%r16, 0x0ea7, %r19
	.word 0xe6742f1b  ! 923: STX_I	stx	%r19, [%r16 + 0x0f1b]
	.word 0x922c0011  ! 925: ANDN_R	andn 	%r16, %r17, %r9
        wr  %g0, 0x80, %asi
	.word 0xd2742a4d  ! 928: STX_I	stx	%r9, [%r16 + 0x0a4d]
	.word 0x913c2001  ! 930: SRA_I	sra 	%r16, 0x0001, %r8
	.word 0xae840011  ! 930: ADDcc_R	addcc 	%r16, %r17, %r23
	.word 0x9f802482  ! 930: SIR	sir	0x0482
!Illinst store
	.word 0xd6341d31  ! 931: STH_R	sth	%r11, [%r16 + %r17]
	.word 0xc3ec1011  ! 933: PREFETCHA_R	prefetcha	[%r16, %r17] 0x80, #one_read
!Illinst alu
	.word 0x94843fae  ! 934: ADDcc_I	addcc 	%r16, 0xffffffae, %r10
	.word 0x8e840011  ! 936: ADDcc_R	addcc 	%r16, %r17, %r7
	.word 0xc3f42011  ! 936: CASXA_R	casxa	[%r16]%asi, %r17, %r1
!Illinst store
	.word 0xfa3417b1  ! 937: STH_R	sth	%r29, [%r16 + %r17]
	.word 0xae940011  ! 939: ORcc_R	orcc 	%r16, %r17, %r23
	.word 0x9e8c0011  ! 939: ANDcc_R	andcc 	%r16, %r17, %r15
	.word 0x9f802932  ! 939: SIR	sir	0x0932
thr0_irf_ce_62:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_62), 16, 16),1,IRF,ce,21,x, x,x,x, x,x,x)
	.word 0xde742d8f  ! 943: STX_I	stx	%r15, [%r16 + 0x0d8f]
	.word 0x9aac2c20  ! 945: ANDNcc_I	andncc 	%r16, 0x0c20, %r13
	.word 0x85a84831  ! 945: FMOVE	fmovs	%fcc1, %f17, %f2
	.word 0xc4242439  ! 948: STW_I	stw	%r2, [%r16 + 0x0439]
	.word 0x8ebc0011  ! 950: XNORcc_R	xnorcc 	%r16, %r17, %r7
	.word 0x8eb42edf  ! 950: ORNcc_I	orncc 	%r16, 0x0edf, %r7
	.word 0x81538000  ! 950: RDPR_WSTATE	rdpr	%wstate, %r0
thr0_irf_ce_63:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_63), 16, 16),1,IRF,ce,24,x, x,x,x, x,x,x)
	.word 0xce34288f  ! 954: STH_I	sth	%r7, [%r16 + 0x088f]
	.word 0x9cac2d96  ! 956: ANDNcc_I	andncc 	%r16, 0x0d96, %r14
	.word 0x8c9c25d6  ! 956: XORcc_I	xorcc 	%r16, 0x05d6, %r6
	.word 0x98c422c0  ! 956: ADDCcc_I	addccc 	%r16, 0x02c0, %r12
	.word 0xc3ec1011  ! 956: PREFETCHA_R	prefetcha	[%r16, %r17] 0x80, #one_read
!Illinst store
	.word 0xc62415f1  ! 957: STW_R	stw	%r3, [%r16 + %r17]
	.word 0x929c21ff  ! 959: XORcc_I	xorcc 	%r16, 0x01ff, %r9
	.word 0x90ac0011  ! 959: ANDNcc_R	andncc 	%r16, %r17, %r8
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xd0242ef1  ! 962: STW_I	stw	%r8, [%r16 + 0x0ef1]
        wr  %g0, 0x80, %asi
!Illinst store
	.word 0xd0741ff1  ! 965: STX_R	stx	%r8, [%r16 + %r17]
	.word 0xdbf42011  ! 967: CASXA_R	casxa	[%r16]%asi, %r17, %r13
!Illinst alu
	.word 0x9d3c3761  ! 968: SRAX_I	srax	%r16, 0x0021, %r14
	.word 0x81580000  ! 970: FLUSHW	flushw
	.word 0xda3427e7  ! 973: STH_I	sth	%r13, [%r16 + 0x07e7]
	.word 0x83342001  ! 975: SRL_I	srl 	%r16, 0x0001, %r1
	.word 0xf6ec2cd0  ! 975: LDSTUBA_I	ldstuba	%r27, [%r16 + 0x0cd0] %asi
!Illinst store
	.word 0xd6741731  ! 976: STX_R	stx	%r11, [%r16 + %r17]
	.word 0xda8c1011  ! 978: LDUBA_R	lduba	[%r16, %r17] 0x80, %r13
thr0_irf_ce_64:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_64), 16, 16),1,IRF,ce,41,x, x,x,x, x,x,x)
	.word 0xda742e29  ! 982: STX_I	stx	%r13, [%r16 + 0x0e29]
	.word 0xa92c3001  ! 984: SLLX_I	sllx	%r16, 0x0001, %r20
	.word 0xb93c1011  ! 984: SRAX_R	srax	%r16, %r17, %r28
        wr %g0, 0x4, %fprs
!Illinst alu
	.word 0xb21c3f75  ! 985: XOR_I	xor 	%r16, 0xffffff75, %r25
	.word 0x8e940011  ! 987: ORcc_R	orcc 	%r16, %r17, %r7
	.word 0x9f8029e2  ! 987: SIR	sir	0x09e2
	.word 0x92b424cd  ! 989: ORNcc_I	orncc 	%r16, 0x04cd, %r9
	.word 0x9e1c28a4  ! 989: XOR_I	xor 	%r16, 0x08a4, %r15
	.word 0x982c280a  ! 989: ANDN_I	andn 	%r16, 0x080a, %r12
	.word 0x8b2c0011  ! 989: SLL_R	sll 	%r16, %r17, %r5
	.word 0x86940011  ! 989: ORcc_R	orcc 	%r16, %r17, %r3
	rd      %pc, %r18
	set     0x20, %r17
thr0_irf_ce_65:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_65), 16, 16),1,IRF,ce,57,x, x,x,x, x,x,x)
	.word 0xc6742cdb  ! 991: STX_I	stx	%r3, [%r16 + 0x0cdb]
	return     %r18 + %r17
thr0_irf_ce_66:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_66), 16, 16),1,IRF,ce,28,x, x,x,x, x,x,x)
	.word 0xc6242083  ! 996: STW_I	stw	%r3, [%r16 + 0x0083]
	.word 0x8cac0011  ! 998: ANDNcc_R	andncc 	%r16, %r17, %r6
	.word 0x0a800001  ! 998: BCS	bcs  	<label_0x1>
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
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
	.word  0x546f7327,0xc247e080,0x98e104fa,0xf84b0d9e
	.word  0x0c276218,0xa79839af,0xf546f9f2,0xbbfa68f1
	.word  0xe06a89fe,0xa61685c3,0x1fe1fab8,0xa8bb3a95
	.word  0xa3815482,0x085980c1,0x3306cec4,0xba065b53
	.word  0x7bcb6464,0xf42f718b,0x60bbc7c8,0x2c686c72
	.word  0xd3501f93,0xd976b5bb,0x61f2a61b,0x0549ca8d
	.word  0xf0a92268,0x7b728ea9,0x5268d710,0x2039c9fe
	.word  0x37dc2a6d,0xdac12400,0x7d19e3a6,0x4aaef4ff
	.word  0x775630bd,0xfdc030ca,0x95792976,0xcf0c6aed
	.word  0xd001b2f3,0xaaa6124e,0x01fcb7a9,0xe4cff114
	.word  0xc3ea53ea,0x58da3a0f,0x0a103413,0x3bf1c193
	.word  0x96ecbb3f,0xe482d8ec,0xb68672c0,0xadd71f45
	.word  0xb680956a,0x31bdae7c,0x8a3867a1,0x2a476fca
	.word  0xfd08532d,0x7576cbfa,0xf4542c62,0xf19affdc
	.word  0x8cd8b2e4,0xc6fe78be,0x338af827,0x1dd25f1f
	.word  0xd24c9220,0x129df5fc,0x62cf89c3,0x19f9009c
	.word  0xd1f2dfb7,0x292c8013,0x59926075,0x56ca5d36
	.word  0xa846827a,0x1c98bb5a,0x93eab95e,0xc3e650d6
	.word  0x517b7e68,0x23a36190,0x7ce25662,0xdeb1c57a
	.word  0x255d2c2f,0xd3093d0a,0x71f4c1b9,0x3f110277
	.word  0x4466c0ab,0x7a3c329b,0x1f2981d4,0xe3bb3684
	.word  0x5b30c9e9,0x5b51022d,0xe159b9c8,0x9b53043b
	.word  0x73648367,0xcbb2254c,0xcf5e7c7f,0x58f53b2e
	.word  0x982f5040,0x9cb7cd68,0xf8a51213,0xd4673760
	.word  0xda347188,0x58495c3d,0xb6bb9a82,0xf9aa6b95
	.word  0xeeeb709c,0xa6f56b58,0x0c9b9dd3,0xd8ee5b53
	.word  0x685d4e67,0x90b3f7cf,0xb8ce1197,0x19570c09
	.word  0x24eeaa4c,0x7846dcec,0x7680c755,0xbae868c8
	.word  0x61f79d03,0xad605dc6,0x64c38126,0x6595fd50
	.word  0xcdce36a0,0xfa693f51,0x91bb8939,0x6db91c6d
	.word  0x134143b5,0xa4c5fa5a,0x4c60fd1d,0xd4873b2d
	.word  0x835e8687,0x8fb6720b,0x315bc3d7,0x2894cc92
	.word  0xcd961dcc,0x6bc5f3df,0x2caddb7e,0xa34b631d
	.word  0x829d859d,0x9b95b48c,0xb3519d7d,0x477b75e9
	.word  0x56acace4,0xe751b9c7,0xdc542969,0xa709b3ab
	.word  0xdfe6fa8f,0xc7bcdeb7,0xec74675f,0xbdd0a032
	.word  0x2c60a188,0x5319b71b,0xacf78582,0x3940cd41
	.word  0xe0221930,0x5c859101,0xc6c911ee,0xf34a0d1e
	.word  0x50f62330,0x9083d8ca,0xfc1c5543,0x910d0a62
	.word  0x54ace783,0x504006b8,0x8c8b2077,0x5724eed5
	.word  0x8ddd923f,0xbe022d30,0x2ba850de,0xed7e130e
	.word  0x4b78ca4a,0xcdf09221,0x685d6afa,0xb115e90e
	.word  0xdf512560,0x1ef4296a,0xc5b28a1c,0x241c6e37
	.word  0x1fb3f9a6,0xdb23e80e,0x664ede5d,0x9c315f1b
	.word  0x114c9c36,0x81122d2b,0x44d11cbb,0x7234aa5c
	.word  0x4a7eeade,0xb8b74215,0xa0957dfa,0x30599edc
	.word  0x2923cf03,0xd5df2e4d,0x748cba7f,0xd2ebf823
	.word  0xdf72d2a7,0x3b83c592,0x5b2af520,0x660ab710
	.word  0x32946210,0xd093b31f,0xc04af4de,0xe0a3d75f
	.word  0x69f003f0,0x0f2ea5c3,0xb8c8a6eb,0x50734be4
	.word  0xe0328272,0xb01eaf58,0x6578fac7,0x693d4e72
	.word  0x2e91230a,0x6bbd2a80,0x98a12ce4,0xc9090132
	.word  0xeae674f7,0x80249314,0xa81a1b7f,0x690e8f87
	.word  0x23f2762e,0x1d688f7b,0xdad73ca4,0x57ef8d96
	.word  0xb85d9fc2,0xfe2e61b5,0x83224a40,0xc0bfc701
	.word  0x5032f8e2,0x7e00de0c,0xabb66877,0x7e1ac80b
	.word  0x697a91e1,0x957f198b,0xacd355b8,0xc482479c
	.word  0xb372a0b8,0xf18998be,0xfe69589f,0xdfc83a3d
	.word  0x4e4eb127,0x585acc11,0x40e4ca14,0x73829aa1
	.word  0xfbf20634,0x18068df4,0x54f9142d,0xd6166a5a
	.word  0x94debde2,0x9318b76f,0xaf9751e7,0x74f454af
	.word  0x01d8fe0e,0xe2c6355f,0x7b7ef24a,0x75730a7b
	.word  0xb3955d9d,0x106e09df,0xff362212,0x90299467
	.word  0x1c29f62d,0xbda4dbaa,0x3bbf4893,0xb213234f
	.word  0xa3449b5b,0x8718c9ee,0x892e37cc,0x03859bcf
	.word  0x64d51a03,0xd3eb5b7e,0x17f2b553,0xcef08bbb
	.word  0x5118e31a,0xe7e354cf,0x285fd071,0x82282cc3
	.word  0x6dffeb07,0x40a95e49,0xc137aa12,0x1a5ab352
	.word  0x66018fa2,0x6fcec425,0xe78e915a,0x468aca03
	.word  0x9254d719,0x86385e6f,0x0a03fe8d,0x34811928
	.word  0xd92a0567,0x8f002380,0x9070bae5,0x7e3f731c
	.word  0xb7b6f114,0x7e8c7d0b,0xebb42911,0x535f9fe8
	.word  0xc3163fb3,0x7ea02db9,0x4c083c38,0x02f59422
	.word  0xa79908ae,0xe9485077,0x937c7dd6,0xe069ac6a
	.word  0xf19cb1c6,0x0da31699,0x7a669fd5,0x95639eee
	.word  0x0f04d6f3,0x11205399,0xd0e1393e,0x9e22cb7c
	.word  0x143ad545,0xd5db0827,0x63774764,0xf8f96867
	.word  0x831c174b,0x0cbb2899,0x8edfe5ee,0x9189fdac
	.word  0x9483d98e,0x85105bb0,0xd705bb26,0x5858eb89
	.word  0x2e6544a7,0x8b208ae6,0x52f60cbc,0xf716f10d
	.word  0x07522bde,0xc2a53049,0x504f893a,0xc530335e
	.word  0xfc86a5f4,0xbf9ffe2c,0xad2bdc64,0xa0c6241b
	.word  0x2f91eaf3,0x03996d70,0x3a21e6d4,0xfd775de1
	.word  0x4ca04aa6,0xc9ca2beb,0x91dd562b,0x72c7ef83
	.word  0xa345078b,0x73315093,0x66159cda,0xe7ed2028
	.word  0x42a93ee0,0x23c70fac,0x27debd44,0x9a7c7e2b
	.word  0x04555998,0xe61e9c40,0x510881d9,0x85faedf0
	.word  0x46600d44,0xbec224d9,0x4a2e8716,0x283af787
	.word  0x7a289a33,0xe07ceef0,0x91b10d0c,0x9b2b5c99
	.word  0x2a464668,0x9f0f6e24,0x869e2b40,0x20515805
	.word  0xdbc4e05f,0xfd2efba0,0xd26fd29f,0xca5ff72d
	.word  0xfa436783,0x3c75283e,0x0b221378,0xcb218743
	.word  0x1f2f299e,0x94d727ef,0x8595b68e,0xde55e49e
	.word  0xd032bcc5,0xbc5ae2bd,0xc88fac77,0x846aa343
	.word  0x87123cbe,0x0cba5328,0x7a11a472,0x33373984
	.word  0x81ea5489,0xff673a33,0x97faac73,0xe5b5191a
	.word  0x536c592f,0x62d2c335,0x54539808,0xebd8e782
	.word  0x7675ef23,0x35d993fe,0x054141ed,0x528c0757
	.word  0x94c6bee9,0x34ffb27a,0x234bd06d,0xc4b35fa7
	.word  0xc86c7e96,0xc3b861fa,0x64aa6b56,0xb7a0d43f
	.word  0x96f92f26,0x9ab0822f,0xa44d2a09,0xbc918ec6
	.word  0x1786fe22,0xca1783cb,0x611a2096,0xc9522963
	.word  0x2c918743,0x854e4640,0x0f90fb6d,0x1c83144f
	.word  0x11bc723f,0x759053d7,0xd4f840c6,0xc289ef3b
	.word  0x0191b2e5,0x4da120f8,0xabf18ee9,0xf22589af
	.word  0x6b6cbd19,0xc93fe388,0x9a43514e,0xa1fa20d0
	.word  0x1f7ebe17,0x101d2d58,0x0a2c4004,0x30d6d738
	.word  0x921d7da8,0x17bdd3ff,0xadf0166e,0x99dff432
	.word  0xbcccb386,0x47232dc7,0xd132f36f,0x36c5821a
	.word  0x4128117a,0xfe16f7a9,0x5c13964a,0xe623b17a
	.word  0x989e8126,0x9f1c3e71,0xeef123f5,0x6d0a4ad7
	.word  0x4df12c8d,0x7088ff88,0x2f9bf3ae,0xb4a3098c
	.word  0xf20faea7,0xbb814a83,0xe872a690,0x9fc36113
	.word  0x524d7fde,0xeb762857,0x08d7a0f8,0x4a8d1c2e
	.word  0x169e903d,0x88cb826e,0x138be439,0x2bec3489
	.word  0x5516cc84,0xb2f634a9,0xe9bc12fe,0xff9f4435
	.word  0x119dbae2,0xec528a28,0x348eaafc,0xffc2e7b5
	.word  0x517bf04f,0x2112dca1,0xf3207125,0x6c51492c
	.word  0x1fab18cf,0xe2c087ac,0x815fc914,0xd1af90f2
	.word  0x10c1beb7,0xde94898e,0xc961d512,0x985676e0
	.word  0x2b842f6a,0x9c83edcb,0xd1d00627,0x14a58b09
	.word  0xdfdc7a04,0x6ee6f085,0xc31c5552,0x272ca64d
	.word  0x44f1029e,0x759c7369,0x3c16d1fa,0xfffc481d
	.word  0x2c28b426,0x550c770c,0x36668ceb,0x86b4660a
	.word  0x32bcd6bc,0x54ae94ea,0x5f5cc33b,0x1eea9a01
	.word  0xc1e4108a,0x9f6e3376,0x9a866a4e,0x51745469
	.word  0x68f98d56,0xcaab7f4c,0x49c193ed,0xdd3dd73c
	.word  0x0fae7729,0x4945bead,0x3d37dd0a,0x74827a34
	.word  0x38a3a567,0xcea2b0c3,0x74c9e800,0x279c94e8
	.word  0x7051eb3c,0x9b6120c5,0x229cdaae,0xfb85b43e
	.word  0x939aeacf,0x2d66225a,0x962387d3,0xc1fc0d76
	.word  0x5821bf7d,0xef1dafa3,0x65cd6c5c,0x79185481
	.word  0x000ef8e9,0xfafb0360,0xd37ca408,0xa58299a1
	.word  0x0f2ea73c,0x55caa4e1,0x0c721269,0xb9ea39c5
	.word  0x7411f083,0x67c629e6,0x3969aaf6,0x8330ffd2
	.word  0xb6c2119e,0xde7ef37b,0xfb7c2d42,0xa574974e
	.word  0x0c866f7b,0x5650748a,0x8b6b8481,0xfa58470c
	.word  0xcf8abcc3,0x36a1323e,0x2f5d44fe,0x6b2a892e
	.word  0x6ecf4c99,0x058a1cad,0xd63f9ea6,0xfb311bb6
	.word  0xf88421d5,0x72550231,0x2c434bce,0x5f755f0b
	.word  0xc4c938aa,0x4dcd1878,0xd634c0c4,0x2598397d
	.word  0xf585acd9,0xe3254d09,0xc7ab7824,0xaa02729e
	.word  0xe7c75237,0x0f095bc6,0xecac212c,0x65f0c4a0
	.word  0xc6409ee8,0x916d7919,0x15bdf933,0x34fb3ba3
	.word  0x57e57d7e,0xfffd3d8d,0x5fcdc7b9,0x2f54d510
	.word  0x559cad2f,0xcba8fa45,0xe74f73be,0xca81aa35
	.word  0x0c6bd37c,0x75b0e62f,0xc14117ac,0xed4b0c04
	.word  0xdd71fd5b,0xec21f7e3,0x8ec35903,0x28ada6b6
	.word  0xc24962d7,0x95dbc0da,0xe3a4ba13,0x307516d4
	.word  0x6668870a,0x26152f66,0x58d6dc8c,0xbe24e9a4
	.word  0x47b6fac0,0x425c882e,0x076e5d8e,0x533b84fe
	.word  0x036b16d9,0x520afa4b,0x97afbab8,0x8939edf8
	.word  0x1e4806ff,0x1b2a1417,0x836f3de9,0xe7a6891d
	.word  0xd8e316ac,0xc96d86d9,0x99cc799a,0x886fe2a6
	.word  0xd373332e,0xf1acd833,0xe0c43afb,0x3150f62f
	.word  0x8a5c41c7,0x60794d04,0x84fa0a09,0x6d7a7bd7
	.word  0xa71027eb,0x4f36c1ab,0x045af6bc,0xce339a01
	.word  0xa59fe863,0xcfcd201b,0xb33be56c,0x51263191
	.word  0xacf3c642,0x5e98f79b,0xc288a0f4,0xc5094e71
	.word  0xf52de882,0x37de2451,0x65fd8c35,0x9f90b800
	.word  0x0e9f6ecc,0x67ff6d24,0xe2fad007,0xed899e5b
	.word  0x78a2a5b2,0x74952d07,0x5ffac543,0x81bf9708
	.word  0x7fcc9b86,0x525dc06c,0x6f85ad2e,0x59a8c92e
	.word  0xa59b6980,0xc1e209df,0x434f78f3,0x243a4ab0
	.word  0x4bd37b95,0xfd236dfa,0x51ef0076,0xc72cee59
	.word  0x6b977b6b,0x4325aaca,0x087a404d,0x1e4477a0
	.word  0x10fd84f6,0x08ff4eb8,0xbd7dfa6b,0x87954774
	.word  0x2aa47efd,0x97791ac3,0x4e34eef8,0xcc0b5f55
	.word  0x70c8a1e5,0xea471c90,0x6138fe80,0xbeb72563
	.word  0xda29503b,0xa8b1f6d2,0xe3f822c8,0x1822695e
	.word  0xb6eb7917,0xa0d9735b,0xb0e664ca,0xa4142860
	.word  0xf7c1eb70,0xc0f52b41,0x4c06cf86,0x017ea052
	.word  0x618a0bb6,0x92317927,0xa4944325,0xbb90e192
	.word  0xaafbdb94,0x53639a54,0x4af49ce3,0xd4368406
	.word  0x4aac77d1,0x43c959a2,0xafcd3d6b,0xf67f7417
	.word  0x05bee229,0x21e16ce9,0xfc2414f5,0x3b5e934d
	.word  0xb243d9b0,0x83497575,0xa6b30f08,0xd8ea1fa6
	.word  0xef1a0ec6,0xa0ba515a,0x87213cbb,0xe7d3345d
	.word  0xcd22109d,0x7e4b883b,0x2c547202,0x79058570
	.word  0x45825199,0xa63cc86b,0x4dda431d,0x35414ec4
	.word  0x8b2d95b0,0x60309f20,0x13a9cc27,0x9c8e87b1
	.word  0xc1485ba9,0xfeb027d4,0xc40e3bc0,0xf0291b5c
	.word  0xb0be25d8,0xf39152e0,0xfe87ed3a,0x2b631f6a
	.word  0xe38848b0,0xe321ec44,0xb55379db,0xe1941af2
	.word  0x0f51218a,0x6adc89a3,0xfb402d45,0xfc51f26c
	.word  0x728e6982,0xc3e2a10d,0x1e6fc365,0xb3c61b64
	.word  0x31e48720,0xbcb23f34,0xad590bf8,0x6b0fa0ca
	.word  0xefa407f7,0xee45bde5,0x1839def0,0x674e9d21
	.word  0xae88f928,0xeb4deda3,0x4cc5bca1,0x778f2e2a
	.word  0x6e38ec51,0xc1c72c85,0xa45e0ce0,0x14592646
	.word  0xe05d0b27,0xd7279e6c,0xb275de6e,0x94c9a738
	.word  0xeedd9008,0xd8818423,0x73585185,0x74ef0d6b
	.word  0x3fa4fd3c,0xd709ee83,0x4a49a39c,0xa5b8537e
	.word  0x751d8183,0x1a9f1812,0x44c55f67,0x4bd40573
	.word  0x85cb7930,0xbbf372c9,0xc707ccfe,0xdd74a141
	.word  0xab44a679,0x8047d842,0xd4a506c2,0x0e2733a4
	.word  0x04c90696,0xfd8c788e,0xa270515b,0x9c3b98d9
	.word  0x32c9a6c7,0x29d16582,0x517a83da,0x6d8c9271
	.word  0xe1ad817f,0x8de41039,0x9ac5732c,0xcafd4323
	.word  0xf759175f,0x2037c358,0x2d0edbb4,0x334b3f30
	.word  0xdbb91f20,0xe670c762,0x303575ce,0x7a0c5410
	.word  0xb1be3ea0,0xc8563ac3,0xfc5e8875,0x04666731
	.word  0x3cbb5231,0x53a27ded,0x4384d516,0xaf3c119f
	.word  0xf3dc3b95,0xefe2c7bb,0x5ca77320,0x5897912a
	.word  0xf26aeab0,0xf9e899c6,0xc9d454e5,0x636307eb
	.word  0xdd88b7be,0xfea8ba40,0xece1eb08,0x1df1be8d
	.word  0xe2205b43,0xe8e1ee5f,0xfccf7188,0x30865ce3
	.word  0x97482879,0x3dc12616,0x148015b6,0xd210f0f3
	.word  0x7c94428d,0x9676868f,0x4738cf42,0x4e958827
	.word  0xfd468d5b,0xa93bfcf8,0x86aca673,0x2421ecb1
	.word  0x7efac83d,0xcc4b93d4,0x8d95b436,0xb9666b0c
	.word  0xe3dc9b86,0xd0f8dc5d,0x7442f82c,0x7bc36a41
	.word  0x07740910,0xd6763672,0xe1f3de2c,0x21c797ea
	.word  0x51fecd9b,0xcbbcccb5,0xbe36c5bc,0x045fb682
	.word  0xde93aba0,0xefbcce15,0x510f0d09,0xf8c047b4
	.word  0xb04445d7,0xcb0ccb32,0xc80bb930,0x2ebc9816
	.word  0x40e7adbf,0x0258177e,0xc2a68146,0x17f0c89d
	.word  0xde3bf5f3,0x4df73381,0xe1d7578b,0xbced7288
	.word  0x51c56aa5,0x6ef0dda8,0x1b8e10a3,0x79ac1ca3
	.word  0x50ae3414,0xd1d45265,0xcad2ff60,0xc6a48244
	.word  0x475b908f,0x3337fe5d,0xdd5914aa,0x39bb7783
	.word  0xe76bb1cd,0x00b4e612,0x83e1664e,0x7d0f2fb3
	.word  0xca9a7a15,0x5ebc74bd,0xe7af7380,0xb3bcd7cb
	.word  0x81e8feac,0xf38d731a,0xd575f657,0x7582db76
	.word  0xb1a33a1e,0x1699e4c5,0xdea80116,0xa954efc4
	.word  0xd28af039,0x11f56126,0x935e2e2c,0x2ac4fbbd
	.word  0x70eba449,0xa844b67f,0x2a54a443,0x6979c83f
	.word  0xe0230347,0x3c2fc229,0x1a43caed,0x5531be36
	.word  0x22a34835,0x3f472f05,0xd34aec0e,0xe38abb40
	.word  0x3a04c322,0x2e22d057,0x4715b264,0xd5e82ff1
	.word  0x4095c75e,0x7588916a,0x9fd72ab2,0x5f80a668
	.word  0x17ea9c1c,0x0d95ba72,0xe177be10,0x41ce86c8
	.word  0xe2916ec5,0xbf2e1b34,0x0d895be6,0x7296c4db
	.word  0xdee2df96,0xdecfd065,0x67a04078,0x0ee41f1e
	.word  0xbb412c90,0x1f1fe44a,0xa6eb182a,0x020c1fdb
	.word  0xcdc395c5,0xb401df6a,0xbd60b6fa,0xfd56adf7
	.word  0xc041f90c,0x88a27ca9,0x55d9789f,0xbcaf5ddd
	.word  0xcc0e339c,0x15c6140d,0x4d0eb477,0x942f8bb4
	.word  0xc0eb139a,0xbe4693fc,0x9325c865,0x2aadadb2
	.word  0x79abf145,0x7540afe1,0xe0d5e657,0x22573417
	.word  0x4bf4eda0,0xb7abc3a4,0x4a087858,0x50f314ae
	.word  0xc3e8a3c3,0x39af35ba,0xbfde92ab,0x85150360
	.word  0x88af459d,0x655ffb31,0xccd72184,0xd965da18
	.word  0x87b1c2ca,0x550993fc,0x9046ad5f,0x86236cbb
	.word  0x6d906615,0x8ea2ec93,0xc6a6df3c,0xbcdb7e91
	.word  0x095e3a4c,0x7fec365c,0xf5629cf8,0x80c7c139
	.word  0x07289788,0xc14c790a,0x0c4583ba,0x7866388d
	.word  0xd4abbf49,0x2dde21ee,0xf9d71e1d,0x7c25eb57
	.word  0x55f88f7a,0x789e1220,0x9e3a8d3c,0x0d7de4f0
	.word  0x72ebfe37,0xda1c0ad8,0xc93ef5cc,0x82cf9e2b
	.word  0xef51890b,0xa4a7d44d,0xb03f88fc,0xea01463d
	.word  0x8807213c,0x81aeb554,0x1601007d,0x9de3c787
	.word  0x15c3b374,0x1163588e,0x9e1a0af3,0xb572dd95
	.word  0x91a55360,0x8920e836,0xc1034be6,0xfdfe107e
	.word  0x3ff82921,0xb1041843,0xaa052ebc,0xf0d8320a
	.word  0x295864ec,0xb4ad0b48,0xd047ac1c,0x3f872cba



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
!!#   IJ_set_ropr_fld ("diag.j", 52, ijdefault, Ft_Rd, "{1..15, 19..29}");
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
!!#   IJ_set_ropr_fld ("diag.j", 72, Ro_rsvd_set, Ft_Simm13, "13'b0rrrrrrrrrrrr");
!!#   IJ_set_ropr_bits ("diag.j", 73, Ro_rsvd_set, 0x1fe0, "13'b1r1r1rr100000");
!!# 
!!# //  IJ_copy_ropr (Ro_dev_null, ijdefault);
!!#   IJ_set_ropr_fld ("diag.j", 76, Ro_dev_null, Ft_Rd, "{0}");  
!!# 
!!#   IJ_bind_thread_group("diag.j", 78, th_evnt, 0x7);
!!# //  IJ_bind_thread_group(th_evnt, 0xf);
!!#   IJ_bind_thread_group("diag.j", 80, th_intr, 0x8);
!!#   IJ_bind_thread_group("diag.j", 81, th_all, 0xf);
!!#   IJ_th_fork_group ("diag.j", 82, th_all);
!!# 
!!#   for (j = 0; j < 8; j++) {
!!# 
!!#      IJ_set_rvar ("diag.j", 86, reg_rand_init, "64'h0000000000000rr0");
!!# 
!!#      IJ_printf ("diag.j", 88, th_all, "        setx  MAIN_BASE_DATA_VA, %%r1, %%r16\n");
!!#      IJ_printf ("diag.j", 89, th_all, "        setx  0x%016llrx, %%g1, %%r17\n", reg_rand_init);
!!# 
!!#      IJ_set_rvar ("diag.j", 91, reg_rand_init, "64'hrrrrrrrr rrrrrrrr");
!!# 
!!#      for (i = 0; i < 16; i++) {
!!#        IJ_printf ("diag.j", 94, th_all, "        setx  0x%016llrx, %%g1, %%r%d\n", reg_rand_init, i);
!!#      }
!!#      for (i = 18; i < 32; i++) {
!!#        IJ_printf ("diag.j", 97, th_all, "        setx  0x%016llrx, %%g1, %%r%d\n", reg_rand_init, i);
!!#      }
!!# 
!!#      IJ_printf ("diag.j", 100, th_all, "	save %%r0, %%r0, %%r31\n");
!!#   }
!!# 
!!#   IJ_printf ("diag.j", 103, th_evnt, "        wr  %%g0, 0x80, %%asi\n");
!!#   IJ_printf ("diag.j", 104, th_evnt, "        wr %%g0, 0x4, %%fprs\n");
!!#   IJ_init_fp_regs ("diag.j", 105, th_evnt, 16);
!!#   IJ_set_default_rule_wt_rvar ("diag.j", 106,"{10}");
!!#   IJ_set_rvar ("diag.j", 107, low_wt, "{1}");
!!# 
!!# }
!!# 
!!# %%
!!# %%section finish
!!# {
!!# 
!!#   IJ_printf ("diag.j", 110, th_all, "	nop\n");
!!#   IJ_printf ("diag.j", 111, th_all, "	nop\n");
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
!!#   IJ_th_join ("diag.j", 137,0xf);
!!#   IJ_th_start ("diag.j", 138,Seq_Start, NULL, 2); 
!!#   IJ_printf ("diag.j", 139, th_all, "	nop\n");
!!#   IJ_printf ("diag.j", 140, th_all, "	nop\n");
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
!!#   IJ_printf ("diag.j", 175, th_all, "	ta    T_GOOD_TRAP\n\n");
!!# 
!!#   IJ_set_rvar ("diag.j", 177, data_rand_init, "32'hrrrrrrrr");
!!#   IJ_printf ("diag.j", 178, th_all, ".data\n");
!!#   for (i = 0; i < 128; i++) {
!!#     IJ_printf ("diag.j", 180, th_all, "	.word  0x%08rx,0x%08rx,0x%08rx,0x%08rx\n", data_rand_init, data_rand_init, data_rand_init, data_rand_init);
!!#     IJ_printf ("diag.j", 181, th_all, "	.word  0x%08rx,0x%08rx,0x%08rx,0x%08rx\n", data_rand_init, data_rand_init, data_rand_init, data_rand_init);
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
!!# inst_type: flhw alu_burst inst
!!#            | jmpl %rvar  low_wt
!!# ;	  
!!# 
!!# flhw: d0 st_irferr_unalgn | rsvd_illinst %ropr  Ro_rsvd_set
!!# ;
!!# 
!!# jmpl: d10 st_irferr_unalgn alu_burst
!!#       {
!!#          if (random () % 2 == 0) {
!!#            IJ_printf ("diag.j", 224, th_evnt, "\tjmpl     %%r18 + %%r17, %%r31\n");
!!#          } else {
!!#            IJ_printf ("diag.j", 226, th_evnt, "\treturn     %%r18 + %%r17\n");
!!#          }
!!#       }
!!# ;
!!# 
!!# d10: mMETA10
!!# {
!!#        burst_cnt = random () % 3 + 4;
!!#        IJ_generate_from_token ("diag.j", 234,burst_cnt, th_evnt, ijdefault, tADD_R, tADD_I, tADDcc_R, 
!!# 			   tADDcc_I, tADDC_R, tADDC_I, tADDCcc_R, tADDCcc_I, tAND_R, 
!!# 			   tAND_I, tANDcc_R, tANDcc_I, tANDN_R, tANDN_I, tANDNcc_R, 
!!#                            tANDNcc_I, tOR_R, tOR_I, tORcc_R, tORcc_I, tORN_R, tORN_I, 
!!#  			   tORNcc_R, tORNcc_I, tXOR_R, tXOR_I, tXORcc_R, tXORcc_I, 
!!# 			   tXNOR_R, tXNOR_I, tXNORcc_R, tXNORcc_I, tMOVcc_R, tMOVcc_I, 
!!#                            tMOVR_R, tMOVR_I, tSLL_R, tSLL_I, tSRL_R, tSRL_I, tSRA_R, 
!!#                            tSRA_I, tSLLX_R, tSLLX_I, tSRLX_R, tSRLX_I, tSRAX_R, -1);;
!!#        IJ_printf ("diag.j", 235, th_evnt, "\trd      %%pc, %%r18\n");
!!#        IJ_printf ("diag.j", 236, th_evnt, "\tset     0x20, %%r17\n");  
!!# }
!!# ;
!!# 
!!# rsvd_illinst: alu_tokens %ropr  Ro_rsvd_set
!!# 		{IJ_printf ("diag.j", 241, th_evnt, "!Illinst alu\n");
!!# 		 IJ_generate ("diag.j", 242, th_evnt, $1);}
!!# 	      | store_r %ropr  Ro_rsvd_set
!!# 		{IJ_printf ("diag.j", 244, th_evnt, "!Illinst store\n");
!!# 		 IJ_generate ("diag.j", 245, th_evnt, $1);}
!!# ;
!!# 
!!# intr_block: mMETA18
!!# {
!!# 
!!#       for (i = 0; i < 500; i++) {
!!#          burst_cnt = random () % 4 + 1;
!!#          thrid = random () % 3;
!!#          if (random () % 2 == 1) {
!!#            IJ_printf ("diag.j", 255, th_intr, "thr%y_nuke_intr_%d:\n", intr_cnt); 
!!#            IJ_printf ("diag.j", 256, th_intr, "!$EV trig_pc_d(%y,expr(@VA(.MAIN.thr%y_nuke_intr_%d), 16, 16)) -> intp(%d, 2, 1)\n", intr_cnt,thrid);
!!#            intr_cnt++;
!!#            IJ_generate_from_token ("diag.j", 258,burst_cnt, th_intr, ijdefault, tADD_R, tADD_I, tADDcc_R, 
!!# 			   tADDcc_I, tADDC_R, tADDC_I, tADDCcc_R, tADDCcc_I, tAND_R, 
!!# 			   tAND_I, tANDcc_R, tANDcc_I, tANDN_R, tANDN_I, tANDNcc_R, 
!!#                            tANDNcc_I, tOR_R, tOR_I, tORcc_R, tORcc_I, tORN_R, tORN_I, 
!!#  			   tORNcc_R, tORNcc_I, tXOR_R, tXOR_I, tXORcc_R, tXORcc_I, 
!!# 			   tXNOR_R, tXNOR_I, tXNORcc_R, tXNORcc_I, tMOVcc_R, tMOVcc_I, 
!!#                            tMOVR_R, tMOVR_I, tSLL_R, tSLL_I, tSRL_R, tSRL_I, tSRA_R, 
!!#                            tSRA_I, tSLLX_R, tSLLX_I, tSRLX_R, tSRLX_I, tSRAX_R, -1);;	
!!#            IJ_printf ("diag.j", 259, th_intr, "thr%y_resum_intr_%d:\n", intr_cnt);
!!#            IJ_printf ("diag.j", 260, th_intr, "!$EV trig_pc_d(%y,expr(@VA(.MAIN.thr%y_resum_intr_%d), 16, 16)) -> intp(%d, 3, 1)\n", intr_cnt,thrid);
!!#            intr_cnt++;	   
!!#            IJ_generate_from_token ("diag.j", 262,burst_cnt, th_intr, ijdefault, tADD_R, tADD_I, tADDcc_R, 
!!# 			   tADDcc_I, tADDC_R, tADDC_I, tADDCcc_R, tADDCcc_I, tAND_R, 
!!# 			   tAND_I, tANDcc_R, tANDcc_I, tANDN_R, tANDN_I, tANDNcc_R, 
!!#                            tANDNcc_I, tOR_R, tOR_I, tORcc_R, tORcc_I, tORN_R, tORN_I, 
!!#  			   tORNcc_R, tORNcc_I, tXOR_R, tXOR_I, tXORcc_R, tXORcc_I, 
!!# 			   tXNOR_R, tXNOR_I, tXNORcc_R, tXNORcc_I, tMOVcc_R, tMOVcc_I, 
!!#                            tMOVR_R, tMOVR_I, tSLL_R, tSLL_I, tSRL_R, tSRL_I, tSRA_R, 
!!#                            tSRA_I, tSLLX_R, tSLLX_I, tSRLX_R, tSRLX_I, tSRAX_R, -1);;	
!!#          } else {
!!#            IJ_printf ("diag.j", 264, th_intr, "thr%y_hw_intr_%d:\n", intr_cnt); 
!!#       	   IJ_printf ("diag.j", 265, th_intr, "!$EV trig_pc_d(%y,expr(@VA(.MAIN.thr%y_hw_intr_%d), 16, 16)) -> intp(%d, 0, 1)\n", intr_cnt,thrid);  
!!#            burst_cnt = random () % 4 + 1;
!!# 	   intr_cnt++;
!!#            IJ_generate_from_token ("diag.j", 268,burst_cnt, th_intr, ijdefault, tADD_R, tADD_I, tADDcc_R, 
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
!!#    if (burst_cnt > 0) {
!!#       IJ_generate_from_token ("diag.j", 279,burst_cnt, th_evnt, ijdefault, tADD_R, tADD_I, tADDcc_R, 
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
!!# st_irferr_unalgn: //irferr store_i 
!!# //		    {
!!# //		       IJ_generate (th_evnt, $2);
!!# //		    }
!!# //                  |
!!# 		 d5 store_i %ropr  Ro_unaligned_addr
!!#                     {
!!# 		      IJ_generate ("diag.j", 291, th_evnt, $2);
!!#                     }
!!# 		  | d6 irferr store_i %ropr  Ro_unaligned_addr
!!#                     {
!!# 		      IJ_generate ("diag.j", 295, th_evnt, $3);
!!#                     }
!!# ;
!!# 
!!# irferr: mMETA100
!!# {
!!#      IJ_printf ("diag.j", 301, th_evnt, "thr%y_irf_ce_%d:\n", irf_err_cnt);
!!#      bitnum = random () % 72;
!!#      IJ_printf ("diag.j", 303, th_evnt, "!$EV error(%y,expr(@VA(.MAIN.thr%y_irf_ce_%d), 16, 16),1,IRF,ce,%d,x, x,x,x, x,x,x)\n", irf_err_cnt, bitnum);
!!#      irf_err_cnt++;
!!# }
!!# ;
!!# 
!!# inst: mul 
!!# 	{IJ_generate ("diag.j", 309, th_evnt, $1);}
!!#       | div 
!!# 	{IJ_generate ("diag.j", 311, th_evnt, $1);}
!!#       | fpop 
!!# 	{IJ_generate ("diag.j", 313, th_evnt, $1);}
!!#       | load 
!!# 	{IJ_generate ("diag.j", 315, th_evnt, $1);}
!!#       | asi_load 
!!# 	{IJ_generate ("diag.j", 317, th_evnt, $1);}
!!#       | asi_st 
!!# 	{IJ_generate ("diag.j", 319, th_evnt, $1);}
!!#       | br 
!!# 	{IJ_generate ("diag.j", 321, th_evnt, $1);}
!!#       | membar 
!!# 	{IJ_generate ("diag.j", 323, th_evnt, $1);}
!!#       | atomic 
!!# 	{IJ_generate ("diag.j", 325, th_evnt, $1);}
!!#       | flush 
!!# 	{IJ_generate ("diag.j", 327, th_evnt, $1);}
!!#       | prefetch 
!!# 	{IJ_generate ("diag.j", 329, th_evnt, $1);}
!!#       | privop %ropr  Ro_dev_null 
!!# 	{IJ_generate ("diag.j", 331, th_evnt, $1);}
!!#       | chpriv 
!!# 	{IJ_generate ("diag.j", 333, th_evnt, $1);}
!!#       | win 
!!# 	{IJ_generate ("diag.j", 335, th_evnt, $1);}
!!#       | ldfp 
!!# 	{IJ_generate ("diag.j", 337, th_evnt, $1);}
!!#       | sir
!!# 	{IJ_generate ("diag.j", 339, th_evnt, $1);}
!!#       | fpdis 
!!#       | rdasr 
!!#       | wrasr 
!!#       | wrasi
!!#       | halt 
!!# ;
!!# 
!!# sir: tSIR
!!# ;
!!# 
!!# rdasr: mMETArdasr
!!# {
!!#        IJ_printf ("diag.j", 352, th_evnt, "\trd      %%asr26, %%r31\n");
!!#        IJ_printf ("diag.j", 353, th_evnt, "\tset     0x01f05, %%r30\n");
!!#        IJ_printf ("diag.j", 354, th_evnt, "\tand     %%r31, %%r30, %%r31\n");
!!# }
!!# ;
!!# 
!!# wrasi: mMETAwrasi
!!# {
!!#    IJ_printf ("diag.j", 360, th_evnt, "        wr  %%g0, 0x80, %%asi\n");
!!# }
!!# ;
!!# 
!!# wrasr: mMETAwrasr
!!# {
!!#      if (random () % 2 == 1) {
!!#        IJ_printf ("diag.j", 367, th_evnt, "\twr      %%r0, 0x1, %%asr26\n");
!!#      } else {
!!#        IJ_printf ("diag.j", 369, th_evnt, "\twr      %%r0, 0x5, %%asr26\n");
!!#      }
!!# }
!!# ;
!!# 
!!# fpdis: mMETAfpdis
!!# {
!!#   IJ_printf ("diag.j", 376, th_evnt, "        wr %%g0, 0x4, %%fprs\n");
!!# }
!!# ;
!!# 
!!# privop: tRDPR_TPC | tRDPR_TNPC | tRDPR_TSTATE | tRDPR_TT | tRDPR_TICK %ropr  Ro_dev_null | tRDPR_TBA | tRDPR_PSTATE | tRDPR_TL | tRDPR_PIL | tRDPR_CWP | tRDPR_CANSAVE | tRDPR_CANRESTORE | tRDPR_CLEANWIN | tRDPR_OTHERWIN | tRDPR_WSTATE | tRDPR_FQ | tRDPR_VER | tRDY | tRDCCR | tRDASI | tRDTICK %ropr  Ro_dev_null | tRDPC | tRDFPRS %ropr  Ro_dev_null | tRDHPR_HPSTATE | tRDHPR_HTSTATE | tRDHPR_HINTP | tRDHPR_HTBA | tWRPR_TICK_R | tWRY_R | tWRCCR_R | tWRFPRS_R | tWRPR_TT_R | tWRPR_TT_I
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
!!# store_i:  tSTH_I | tSTW_I | tSTX_I 
!!# ;
!!# 
!!# store_r:  tSTH_R | tSTW_R | tSTX_R 
!!# ;
!!# 
!!# halt: mMETAhalt
!!# {
!!#      IJ_printf ("diag.j", 441, th_evnt, "thr%y_resum_intr_%d:\n", intr_cnt);
!!#      IJ_printf ("diag.j", 442, th_evnt, "!$EV trig_pc_d(%y,expr(@VA(.MAIN.thr%y_resum_intr_%d), 16, 16)) -> intp(%y, 3, 1)\n", intr_cnt);
!!#      if (random () % 2 == 1) {
!!#        IJ_printf ("diag.j", 444, th_evnt, "\twr      %%r0, 0x0, %%asr26\n");
!!#      } else {
!!#        IJ_printf ("diag.j", 446, th_evnt, "\twr      %%r0, 0x4, %%asr26\n");
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

