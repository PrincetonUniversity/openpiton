// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: blkldst_loop.s
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
/***********************************************************************
 *  File name	:	%Z%%M%
 *  Version     :	%I%
 *  Date	:	%G%		
 *
 * Description:
 *
 *	Test back to back blk ld/st
 *      Simple test put it to make sure blk ld amd stores work
 *      as just seems to find bugs in ifu and lsu
 *      and is use in mt diag			
***********************************************************************/

#ifdef MT_TEMPLATE
#include "mt_body.h"
#else
#include "boot.s"
.global main
#endif

.text 
main:
	wr	%g0, 0x4, %fprs
	setx	0x1f, %l0, %l1
	setx	data_0, %l0, %l2
	ldx	[%l2], %o0	
	
lp_add:
	ldda    [%l2]ASI_BLK_P, %d0
	stda    %d0, [%l2]ASI_BLK_P
	subcc	%l1, 1, %l1
	bne	lp_add
	nop

/*
 ********************************
 *      Diag PASSED !           *
 ********************************
 */
diag_pass:
        set     0xaaddcafe,     %l0
        ta 	T_GOOD_TRAP
        nop

/*
 ********************************
 *      Diag FAILED !           *
 ********************************
 */
diag_fail:
        set     0xdeadcafe,     %l0
        ta 	T_BAD_TRAP
        nop
        nop

.data	

data_0:
	.word 0x6660a38f
	.word 0xf7af1b8
	.word 0xba1a5780
	.word 0x893499b1
	.word 0x1f89e284
	.word 0xd52bce8c
	.word 0x712f55ee
	.word 0xc660fbdc
	.word 0x9913b188
	.word 0x1ee2db7f
	.word 0xef01fa5b
	.word 0xa91edbe6
	.word 0x88e13a5a
	.word 0x3af5a13f
	.word 0x20874b4f
	.word 0x2eabaa2b
	.word 0x77e70c7a
	.word 0x16e834f9
	.word 0xdc8c1bc
	.word 0x7b715079
	.word 0x56acac47
	.word 0x1f931bda
	.word 0x8a1ec02e
	.word 0x66f3ab3a
	.word 0x516f7f48
	.word 0xa9c562d2
	.word 0x433ec940
	.word 0x74b9f0d8
	.word 0x8697a9c9
	.word 0x3d89ee9a
	.word 0x4f522951
	.word 0x3a5cab5c
	.word 0x6424b1aa
	.word 0xeb2347f8
	.word 0xdc610778
	.word 0x7a472858
	.word 0xb4c0fa72
	.word 0x18416841
	.word 0xe7a911b4
	.word 0xea458307
	.word 0x58886eaa
	.word 0x9a294a1f
	.word 0x59363867
	.word 0x92e6acb2
	.word 0x697fea68
	.word 0x1ebe4294
	.word 0xaa872d05
	.word 0x734c1754
	.word 0x15803b29
	.word 0xc6d9663e
	.word 0x756e9808
	.word 0x276e681
	.word 0xd030c8e4
	.word 0xd85b7edc
	.word 0x35fd3a27
	.word 0xcdbcca83
	.word 0x4db3c5b
	.word 0xca2a5510
	.word 0xee506cc6
	.word 0xc20ce9c5
	.word 0x12a2b6b3
	.word 0xd8125266
	.word 0xa8e3b5af
	.word 0x354f7c74
	.word 0xe33e6e47
	.word 0x4491bf94
	.word 0x74bb6202
	.word 0xfcb0fe62
	.word 0xae00c4b8
	.word 0x73232303
	.word 0x1a95c6a
	.word 0x5e541b2e
	.word 0xa3f12a48
	.word 0xdaf0838e
	.word 0x894cb291
	.word 0x76f3b8a2
	.word 0x17506268
	.word 0x40319389
	.word 0xf67f7dd5
	.word 0x60b0c35b
	.word 0xc643fd8e
	.word 0xb6130804
	.word 0xf7ee233b
	.word 0x8ddda1af
	.word 0xeedf1c4c
	.word 0x3425a04f
	.word 0xc6ce1ea3
	.word 0xb5370ca
	.word 0xb78bcf9e
	.word 0x5d37a1c1
	.word 0x4759cd3d
	.word 0xc7fb701a
	.word 0xd339aa83
	.word 0xca63cbb5
	.word 0xd919eb3b
	.word 0x44f93eed
	.word 0x81eb58ce
	.word 0x604d07d5
	.word 0xb85cb8c8
	.word 0xc988d057
	.word 0x9d864f3d
	.word 0x62e5a9a
	.word 0x73c5fa38
	.word 0x196d3959
	.word 0x1564e8ca
	.word 0x6adad812
	.word 0x5fe24780
	.word 0xdafbbd3e
	.word 0x725c8541
	.word 0x4341a0e4
	.word 0x825b5ee7
	.word 0x14a0bc48
	.word 0xedee7d12
	.word 0xc4c62b91
	.word 0x7e126efd
	.word 0x1772688c
	.word 0x9b73fe68
	.word 0xbbfd5dfc
	.word 0x24408bcc
	.word 0x973f651a
	.word 0xb6822779
	.word 0xfa643b2c
	.word 0x740cc34d
	.word 0xc6c5b360
	.word 0x8fc4f21f
	.word 0x63ad294f
	.word 0xb50a851d
	.word 0xe2a092cf
	.word 0xce64c4a7
	.word 0x618d1401
	.word 0xa10a5170
	.word 0x5d4236be
	.word 0xe8f3bbe9
	.word 0x33c1eece
	.word 0x19d1e345
	.word 0xb438768f
	.word 0x431d0298
	.word 0x75a05bf5
	.word 0xfef049db
	.word 0x1949dc0f
	.word 0x4621c9db
	.word 0x530e7b6e
	.word 0x6235a563
	.word 0x6aeab422
	.word 0xe6d4b71c
	.word 0x90ae262e
	.word 0x8d9d7af6
	.word 0x3d60059f
	.word 0x457ddb1f
	.word 0x8e5919a9
	.word 0x36f5d3c9
	.word 0xdae09278
	.word 0xa81e8655
	.word 0x5c35d798
	.word 0x7b7c9b9e
	.word 0x7362471e
	.word 0xcf2d8e71
	.word 0x71d43dfc
	.word 0x234ff27d
	.word 0x26c4bc23
	.word 0x3559d93b
	.word 0x702d1b62
	.word 0x812565a3
	.word 0xfbefae20
	.word 0xe56a40a5
	.word 0xf3504367
	.word 0x818743bb
	.word 0x2f868fd8
	.word 0x432f241b
	.word 0xfb40e77e
	.word 0x1516804b
	.word 0xeb409a9d
	.word 0xeeb3b1f
	.word 0x53837f0
	.word 0xb642da70
	.word 0x6e0700f2
	.word 0x82de7d14
	.word 0xfb829124
	.word 0xf3d23ace
	.word 0xdaf12771
	.word 0x39f73259
	.word 0x9aabb920
	.word 0x71ab7cc1
	.word 0x545107ef
	.word 0x725a8299
	.word 0x82f2f14f
	.word 0xf7e816d7
	.word 0x268022dd
	.word 0xa7b71460
	.word 0x9d47e084
	.word 0xe0735682
	.word 0xa63fa2f1
	.word 0xb56991f2
	.word 0xbf9d993e
	.word 0x64b52309
	.word 0xfe849704
	.word 0x8a42758
	.word 0x1571402d
	.word 0x12317bc0
	.word 0x93b3663d
	.word 0x94474dba
	.word 0x33616f5
	.word 0x95e52578
	.word 0x5cdbe26f
	.word 0x742b77f4
	.word 0x4e30ef31
	.word 0x5dbb3b38
	.word 0xc0b99cbf
	.word 0x91807462
	.word 0xd26949ba
	.word 0x7cfe962c
	.word 0x2a52608a
	.word 0x4ee097fe
	.word 0xdf6a628
	.word 0x376540dd
	.word 0xd246f885
	.word 0xc60306ad
	.word 0x1854c698
	.word 0x758369a2
	.word 0xb488a225
	.word 0x83d9acd5
	.word 0x15d1ebaf
	.word 0xc0568856
	.word 0x8867d340
	.word 0xd79cbe32
	.word 0xf6d64cdf
	.word 0xbf70ab4a
	.word 0xe91735f3
	.word 0xaf0ecdea
	.word 0xf8f450e8
	.word 0x51571f7d
	.word 0xe907fec6
	.word 0xeb61d3de
	.word 0x50a54aa2
	.word 0x5f26e80a
	.word 0xa933010e
	.word 0xf7d6b342
	.word 0x68ebdf8
	.word 0x66c4b8e1
	.word 0x80b42592
	.word 0xeab6166f
	.word 0x16687137
	.word 0x390568b9
	.word 0xef542771
	.word 0x63dab3f7
	.word 0x705bce88
	.word 0x9e970e45
	.word 0x48f6bb42
	.word 0xcef250fa
	.word 0x943959bb
	.word 0xfe423ca5
	.word 0x6ea1847d
	.word 0x5c1c14b7
	.word 0x10693e45
	.word 0xec9e131f
	.word 0x56327d18
.align 8192
data_1:
	.word 0x6ce00165
	.word 0x7948398b
	.word 0xe7c9140e
	.word 0xca22b375
	.word 0xf6e4a643
	.word 0x30f26561
	.word 0xc463f71a
	.word 0x91c827a
	.word 0x66855eed
	.word 0x1791a6cc
	.word 0x4b2aeaa8
	.word 0x7ffaa801
	.word 0x5abcb3f1
	.word 0x815dc50f
	.word 0xbb5cf894
	.word 0x2237dd73
	.word 0x7efbb0a2
	.word 0x65d86ce5
	.word 0xcce8821d
	.word 0x2b2cd6af
	.word 0x37c0422b
	.word 0xf3afa40a
	.word 0x114f0720
	.word 0xbff4cb2f
	.word 0x8949f3e6
	.word 0xa2557100
	.word 0x52a1ac89
	.word 0xccaeed6d
	.word 0xe5ed9cee
	.word 0x9603bb0f
	.word 0xa01b3606
	.word 0x2557483
	.word 0x907dd2f2
	.word 0x10cfa68c
	.word 0xdef366fc
	.word 0x62c91c11
	.word 0x3047364c
	.word 0x9bdff15e
	.word 0xef52febe
	.word 0xc93a3e62
	.word 0xa47ceb51
	.word 0x330e13bd
	.word 0x300ec3fc
	.word 0x3406ecd1
	.word 0x35e2d4ea
	.word 0xb372293d
	.word 0x8b435379
	.word 0xc4b7aa69
	.word 0xec486463
	.word 0x6d5e60b
	.word 0x5152a600
	.word 0xd93aaccb
	.word 0x13401283
	.word 0x730b1c75
	.word 0x4a5f8198
	.word 0xd917c754
	.word 0x3bacd5dc
	.word 0x48e696af
	.word 0x4f7249f6
	.word 0x4055647e
	.word 0x37802a63
	.word 0x236848d3
	.word 0xdf35e432
	.word 0xaa693186
	.word 0x6f987e42
	.word 0x78a61f29
	.word 0xe5f2a1bd
	.word 0x9815604f
	.word 0x625917ec
	.word 0x6b9eeca8
	.word 0xf0586693
	.word 0xfdbda386
	.word 0x4191c972
	.word 0x5c6f3dbd
	.word 0x4c087eac
	.word 0x52cd4906
	.word 0x48de0515
	.word 0x6bba134a
	.word 0xf2e2d6b7
	.word 0x807a167c
	.word 0x1808271b
	.word 0x12b3c9f0
	.word 0x3e218c0a
	.word 0x34c5cc4e
	.word 0xc87708e5
	.word 0xa35db191
	.word 0x2f8907d3
	.word 0x705a72b8
	.word 0x96793141
	.word 0x50651910
	.word 0xa21993
	.word 0xb0fbd538
	.word 0x60a235fd
	.word 0x9a00d25a
	.word 0xad56c4cd
	.word 0x910ad02c
	.word 0x55a422bc
	.word 0x495472aa
	.word 0x5fa1b5fa
	.word 0xad3d54b8
	.word 0x6557f90c
	.word 0x9e90d308
	.word 0x388b92bf
	.word 0xd67846ed
	.word 0x39459db6
	.word 0xe37d9512
	.word 0x9eb09961
	.word 0x24e69a27
	.word 0xfd2cc758
	.word 0x1c8faffe
	.word 0x5f3c4378
	.word 0x2d3b4fb6
	.word 0x4e15c231
	.word 0x426d49de
	.word 0xe2efdfe2
	.word 0x7c23bbf
	.word 0x878a1d3c
	.word 0xf4ff6126
	.word 0x8a457fa
	.word 0xd4bdb464
	.word 0xf802947f
	.word 0x6c360a6b
	.word 0xe106940a
	.word 0x20cd8f22
	.word 0x7898cca4
	.word 0x1ac466d
	.word 0x3f5132fd
	.word 0xd0fe107b
	.word 0x7de0b3c8
	.word 0xc5a4b457
	.word 0x7fbd8958
	.word 0xc6e3b1d4
	.word 0x11b69b92
	.word 0x69a8a444
	.word 0xe1911b6b
	.word 0x1412e19f
	.word 0xad0c6087
	.word 0x67a74e05
	.word 0xaf4c06c3
	.word 0x979121bc
	.word 0x9e91329d
	.word 0xb60b3021
	.word 0x2ed00ee2
	.word 0x21cf281c
	.word 0x64b4d30d
	.word 0xdc17db1c
	.word 0xec9f4131
	.word 0x8291e5a7
	.word 0x8405b6d
	.word 0xa642acfc
	.word 0x93cc6435
	.word 0x1a2a9760
	.word 0x55cbe1fd
	.word 0xa45d4108
	.word 0xc726a601
	.word 0xfabc45c5
	.word 0xa0f98f40
	.word 0x9b9097d2
	.word 0xaacd3deb
	.word 0x494f567b
	.word 0x29d3f8ce
	.word 0x8943b78
	.word 0x46eef582
	.word 0x375a142a
	.word 0x436d568
	.word 0x137ce426
	.word 0x2044ccbf
	.word 0x966f50a6
	.word 0x90065e4d
	.word 0x123260de
	.word 0x40162d79
	.word 0xf32854e
	.word 0xc86af1cb
	.word 0x1154c87b
	.word 0xf88621e
	.word 0x6cc315b9
	.word 0x658bcb18
	.word 0x415536f2
	.word 0x77e2439f
	.word 0x1cc6988e
	.word 0x889ce362
	.word 0x87069adb
	.word 0x768852ac
	.word 0x4544ab2
	.word 0x4ac15023
	.word 0x802f572f
	.word 0xff04b021
	.word 0x898210a9
	.word 0x7d84b2ba
	.word 0xc5ecbd53
	.word 0x92b1a8bf
	.word 0x4275aa35
	.word 0x7cc38d37
	.word 0x1445a355
	.word 0x4bd4c81f
	.word 0x13e2fc43
	.word 0x77039076
	.word 0xc0599a74
	.word 0x5463a6e2
	.word 0xc40a9507
	.word 0xb7ba376e
	.word 0xd16e89e5
	.word 0x6e8ae82d
	.word 0xa2d9ce65
	.word 0x881143ca
	.word 0x6cf6b1d4
	.word 0x99a31a54
	.word 0x6003292
	.word 0x3b9defb9
	.word 0x9ec55aa8
	.word 0x30c66ed4
	.word 0xfee406fb
	.word 0x2078e902
	.word 0xed48b48b
	.word 0x8bf57d87
	.word 0xa9a2165
	.word 0xca72695a
	.word 0x7203ab29
	.word 0x10e88712
	.word 0x17a36b55
	.word 0xa0fefff9
	.word 0x30eab1b7
	.word 0x508deaa1
	.word 0x4c74b7b1
	.word 0x9c2ee06a
	.word 0x41f2cb36
	.word 0xd10dc2d6
	.word 0x92f3cea6
	.word 0xafcacaa2
	.word 0xaf5252f8
	.word 0x3535ddfe
	.word 0x4a5ed3cc
	.word 0xd1cee054
	.word 0x14e74963
	.word 0xc0b08585
	.word 0x40c16a88
	.word 0xb42cfb83
	.word 0x7a2f28f4
	.word 0xa79bc8ab
	.word 0x796d3cb2
	.word 0xe6455a58
	.word 0x3c788786
	.word 0xff3e3e78
	.word 0x7521c777
	.word 0xea1db435
	.word 0x5ab707d4
	.word 0x8ff172ed
	.word 0xf4e9927f
	.word 0xf94c0c09
	.word 0x3e65f3c
	.word 0xb529737b
	.word 0x38713551
	.word 0x6f0bd3e6
	.word 0xe47173c5
	.word 0x1b042eb9
	.word 0xd5fecef6
.align 8192
