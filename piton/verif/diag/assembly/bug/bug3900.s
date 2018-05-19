// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: bug3900.s
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
   random seed:	174377441
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
        setx  0x0000000000000f10, %g1, %r17
        setx  0x15c4c6460cc37166, %g1, %r0
        setx  0x82f051518d865632, %g1, %r1
        setx  0xf892e6d6487d7b67, %g1, %r2
        setx  0x0d2f35b158f29353, %g1, %r3
        setx  0x78d633cd91fb2835, %g1, %r4
        setx  0xfd0f52f4690cdb54, %g1, %r5
        setx  0x28741c7a06793541, %g1, %r6
        setx  0x4db09fa31483d6c1, %g1, %r7
        setx  0xfb51b1fd67af3bf4, %g1, %r8
        setx  0x82e819b9a0c41f8a, %g1, %r9
        setx  0x89e7f925a827e150, %g1, %r10
        setx  0xa4bd647424b4ece4, %g1, %r11
        setx  0xcac185cca7573a47, %g1, %r12
        setx  0x11c407bbac404a55, %g1, %r13
        setx  0xffea9790e258a523, %g1, %r14
        setx  0x4581e1edbe22b2e3, %g1, %r15
        setx  0xf33d866b6ba700cb, %g1, %r18
        setx  0xa085dc9493b92d28, %g1, %r19
        setx  0xf83801dad194803f, %g1, %r20
        setx  0x88bc620b5ede3a58, %g1, %r21
        setx  0x97a545a8d24ab0dd, %g1, %r22
        setx  0xb765be0d8a6a6e2b, %g1, %r23
        setx  0xc460125656153ef4, %g1, %r24
        setx  0x23ca789f0842e48c, %g1, %r25
        setx  0xddbc0dd77e2a6311, %g1, %r26
        setx  0x8ab6cd0bd6a8346d, %g1, %r27
        setx  0x344044766838c85e, %g1, %r28
        setx  0x3606e3c0e833b306, %g1, %r29
        setx  0x3aec65ab55dcb881, %g1, %r30
        setx  0xe40c43384f1980eb, %g1, %r31
	save %r0, %r0, %r31
        setx  MAIN_BASE_DATA_VA, %r1, %r16
        setx  0x00000000000009b0, %g1, %r17
        setx  0xaa462572b62247a5, %g1, %r0
        setx  0x14399a12047283f1, %g1, %r1
        setx  0xbb147b5fda732604, %g1, %r2
        setx  0x35d41c94b08881b4, %g1, %r3
        setx  0x3192d53aa708b77b, %g1, %r4
        setx  0xe4cb70097949b51c, %g1, %r5
        setx  0xfccd0d50b55fbbb3, %g1, %r6
        setx  0x584ab71ac850f17c, %g1, %r7
        setx  0x7a657ac884396a9a, %g1, %r8
        setx  0x691bf70bef6540b1, %g1, %r9
        setx  0x83af8b931b29bf80, %g1, %r10
        setx  0x340098a750a2adab, %g1, %r11
        setx  0x1d6336347ee38ef6, %g1, %r12
        setx  0x4b36cb91d104601a, %g1, %r13
        setx  0xdd2ab98a6b4395e2, %g1, %r14
        setx  0x8569d727d2294be1, %g1, %r15
        setx  0x3d7fbc29b7749f28, %g1, %r18
        setx  0x7723babf979588da, %g1, %r19
        setx  0x954246abf8dddb65, %g1, %r20
        setx  0x642d9a672ec7dd04, %g1, %r21
        setx  0x29d37662d3bab1b6, %g1, %r22
        setx  0x96e3517c7f19235f, %g1, %r23
        setx  0xff89b14f7207581d, %g1, %r24
        setx  0x4237b0baabd5ebc6, %g1, %r25
        setx  0x81251a94a36b1270, %g1, %r26
        setx  0x158e0c5024103705, %g1, %r27
        setx  0xc8349e91ef9e888f, %g1, %r28
        setx  0xfeec903fa0b7d84d, %g1, %r29
        setx  0x172e2875f014b28e, %g1, %r30
        setx  0xddbd9744426e7036, %g1, %r31
	save %r0, %r0, %r31
        setx  MAIN_BASE_DATA_VA, %r1, %r16
        setx  0x0000000000000d30, %g1, %r17
        setx  0x0eec019e519e5c08, %g1, %r0
        setx  0x929efba731d60c22, %g1, %r1
        setx  0x9127b4ca96797b76, %g1, %r2
        setx  0x287e69967ec81632, %g1, %r3
        setx  0x53c87e0a40ef4747, %g1, %r4
        setx  0xee6a48a7b8f1a009, %g1, %r5
        setx  0x9e89db5337924cbd, %g1, %r6
        setx  0xf5390806ecb08eed, %g1, %r7
        setx  0x9fa07d3e0eb11700, %g1, %r8
        setx  0x02360e7b6ff005c8, %g1, %r9
        setx  0xfbbcf4f4b10f60d9, %g1, %r10
        setx  0xf4ffecdc8097f7da, %g1, %r11
        setx  0x2f30e493f3c91037, %g1, %r12
        setx  0x82b5769025371e95, %g1, %r13
        setx  0xef3deab12f412cda, %g1, %r14
        setx  0x332b05fdba0c75d0, %g1, %r15
        setx  0x40d3ef3272504f22, %g1, %r18
        setx  0x403741f7d54c9d30, %g1, %r19
        setx  0xd9c0690e8b121518, %g1, %r20
        setx  0x5d94f5b86ff4694f, %g1, %r21
        setx  0xfc55db6a69fa9b04, %g1, %r22
        setx  0xe6203062b8586c22, %g1, %r23
        setx  0x2facd224d00bd955, %g1, %r24
        setx  0xfe92906b69678d2d, %g1, %r25
        setx  0x4591ca8e8c976f2f, %g1, %r26
        setx  0x8fcb3b0e8edbb8bb, %g1, %r27
        setx  0xd7ce278302fd05c8, %g1, %r28
        setx  0xd4371d11658d4c85, %g1, %r29
        setx  0x0e76657fd9e358da, %g1, %r30
        setx  0xc9591d2608156d19, %g1, %r31
	save %r0, %r0, %r31
        setx  MAIN_BASE_DATA_VA, %r1, %r16
        setx  0x0000000000000d50, %g1, %r17
        setx  0xaadb226c17b7ecb4, %g1, %r0
        setx  0x037fb895d67b0213, %g1, %r1
        setx  0xcaafc91285b81a0b, %g1, %r2
        setx  0xfeebfa733ceaa47b, %g1, %r3
        setx  0xf265b5a1904f988c, %g1, %r4
        setx  0x0d940e7fcaebbbe7, %g1, %r5
        setx  0x6e529eac337f8df9, %g1, %r6
        setx  0x14d6abd4ac01732e, %g1, %r7
        setx  0x9fbb651cb73c7817, %g1, %r8
        setx  0xf6dd19cbe0a26880, %g1, %r9
        setx  0x029c6d3cc1fecdb4, %g1, %r10
        setx  0xd047ebc16ec74137, %g1, %r11
        setx  0xf38fd03de94bed7b, %g1, %r12
        setx  0x00c0ea550887ef8f, %g1, %r13
        setx  0xc08a43fd4335d50d, %g1, %r14
        setx  0x933bd4a55a94184c, %g1, %r15
        setx  0x6767a091c32f02aa, %g1, %r18
        setx  0xf8dac00eff5beece, %g1, %r19
        setx  0x5142ef99083bf8c3, %g1, %r20
        setx  0xa6638de842521c99, %g1, %r21
        setx  0xd6bdb5344c5e833b, %g1, %r22
        setx  0xb3ae97ee577ba021, %g1, %r23
        setx  0xc1ab288f64c39888, %g1, %r24
        setx  0xe1658653f6503a43, %g1, %r25
        setx  0x455373d11086f5c0, %g1, %r26
        setx  0x80e4a6a6ffc83444, %g1, %r27
        setx  0xe4829b66bf7dcceb, %g1, %r28
        setx  0x26390663a9048914, %g1, %r29
        setx  0xd6b5710a65e35bc1, %g1, %r30
        setx  0x695ee2dd6c178ce9, %g1, %r31
	save %r0, %r0, %r31
        setx  MAIN_BASE_DATA_VA, %r1, %r16
        setx  0x0000000000000d40, %g1, %r17
        setx  0x80b0bf0a9a17b56d, %g1, %r0
        setx  0x7bd7aaaa105377c3, %g1, %r1
        setx  0x3d76418a2208267e, %g1, %r2
        setx  0xc2b889dd6b883e5c, %g1, %r3
        setx  0x9e9725a557305fef, %g1, %r4
        setx  0x5c80257a5371e50a, %g1, %r5
        setx  0x3cfdf7135f0f0f6b, %g1, %r6
        setx  0x68e463db81271e28, %g1, %r7
        setx  0x337cfbe24f3b6939, %g1, %r8
        setx  0xcf01eae0ff9f0348, %g1, %r9
        setx  0xa84151b4dd1a4356, %g1, %r10
        setx  0x219cea8d990761d6, %g1, %r11
        setx  0x03306e704a376c33, %g1, %r12
        setx  0xf098042c7a70e247, %g1, %r13
        setx  0x77b5beb583b18649, %g1, %r14
        setx  0xe6cbac28aaed7285, %g1, %r15
        setx  0x53d5d9db35429c94, %g1, %r18
        setx  0xb6d300b910411992, %g1, %r19
        setx  0x38feb54f289b834b, %g1, %r20
        setx  0x9e59083e34a79017, %g1, %r21
        setx  0x7a5a317086179571, %g1, %r22
        setx  0xb6d9d0dfb47dd353, %g1, %r23
        setx  0x42efbf10ee6f333d, %g1, %r24
        setx  0xa9728cb189417fee, %g1, %r25
        setx  0x0191b29303413203, %g1, %r26
        setx  0xf2433a696cd072a5, %g1, %r27
        setx  0x558a178bde325df9, %g1, %r28
        setx  0xf3243cb4359dafed, %g1, %r29
        setx  0xd8f93cc152a68841, %g1, %r30
        setx  0xb8851fa24f9ada4b, %g1, %r31
	save %r0, %r0, %r31
        setx  MAIN_BASE_DATA_VA, %r1, %r16
        setx  0x0000000000000500, %g1, %r17
        setx  0xe017cf311b2281b6, %g1, %r0
        setx  0xc79872abc015b0be, %g1, %r1
        setx  0x9f9be47a985484b9, %g1, %r2
        setx  0x31fb251f29b414b7, %g1, %r3
        setx  0x1c389b984f60cd8d, %g1, %r4
        setx  0xc782c3465d49f5c6, %g1, %r5
        setx  0x8de770b15ca0162f, %g1, %r6
        setx  0x43237814be3ce211, %g1, %r7
        setx  0x201143f4883213df, %g1, %r8
        setx  0xc7b0f065bad65add, %g1, %r9
        setx  0x60fd4f96c8b49c31, %g1, %r10
        setx  0xe9ab6e853380f47b, %g1, %r11
        setx  0xf94a8c4067a2f688, %g1, %r12
        setx  0x0eb670789d7433cc, %g1, %r13
        setx  0xde3e207caa11dff6, %g1, %r14
        setx  0x15660e13d15391e9, %g1, %r15
        setx  0xc49a02a52b7cd3cd, %g1, %r18
        setx  0xfeea945b3eeb1b3e, %g1, %r19
        setx  0x04a60c3bc0265d3a, %g1, %r20
        setx  0x4278ff87fe80c446, %g1, %r21
        setx  0xe35c524f98e628a5, %g1, %r22
        setx  0x0fb0880b142479c3, %g1, %r23
        setx  0x629c980be744e744, %g1, %r24
        setx  0xbc464961869a2010, %g1, %r25
        setx  0xf614b2659a368ac2, %g1, %r26
        setx  0xbb2091a608cecef9, %g1, %r27
        setx  0x8699b1bfb0ecebec, %g1, %r28
        setx  0x2d1f8625449658b2, %g1, %r29
        setx  0x1fa00a1f80187e62, %g1, %r30
        setx  0x7e20456e28f2dd4d, %g1, %r31
	save %r0, %r0, %r31
        setx  MAIN_BASE_DATA_VA, %r1, %r16
        setx  0x0000000000000fb0, %g1, %r17
        setx  0x2e866658131071e0, %g1, %r0
        setx  0x827da8ee827670cd, %g1, %r1
        setx  0xfc83f62d01128c4f, %g1, %r2
        setx  0xe54c4d9a41d05472, %g1, %r3
        setx  0x038185e239479209, %g1, %r4
        setx  0xe58063e60963ea9b, %g1, %r5
        setx  0x7fe4777ba9a2611b, %g1, %r6
        setx  0xa7874d686012cef5, %g1, %r7
        setx  0xfb0a3f21f93fed76, %g1, %r8
        setx  0xb906cc6d674a0301, %g1, %r9
        setx  0xae37fff91c8ae175, %g1, %r10
        setx  0x5bdcf27431baf0e8, %g1, %r11
        setx  0x7b0b968e4fa7cb95, %g1, %r12
        setx  0x2db2d811b34d0b0e, %g1, %r13
        setx  0x62ad2bb0f3cdf04a, %g1, %r14
        setx  0xb23a1674d7e27185, %g1, %r15
        setx  0xd62acef17a017f12, %g1, %r18
        setx  0x6e986bd923560b21, %g1, %r19
        setx  0x851fefef1400a2b5, %g1, %r20
        setx  0xeaefd31bfbf75736, %g1, %r21
        setx  0x2e44211a94600e38, %g1, %r22
        setx  0x6b05ccdcbeb410e8, %g1, %r23
        setx  0xaf46c5fb2eb6a5f8, %g1, %r24
        setx  0xef9f2e493e49f4a5, %g1, %r25
        setx  0x3c2f8660e716e5d9, %g1, %r26
        setx  0x63d8539993a4286e, %g1, %r27
        setx  0xc06277556e5a1d73, %g1, %r28
        setx  0x2b1a17102a88892e, %g1, %r29
        setx  0x1f68c9f57acf3632, %g1, %r30
        setx  0x1cf4e0cc45cc999e, %g1, %r31
	save %r0, %r0, %r31
        setx  MAIN_BASE_DATA_VA, %r1, %r16
        setx  0x0000000000000360, %g1, %r17
        setx  0x2d2c87069952dbed, %g1, %r0
        setx  0xe8fec31fa0c03b5f, %g1, %r1
        setx  0x5b64a64cdf9b51d7, %g1, %r2
        setx  0x208697faf118a0da, %g1, %r3
        setx  0x36e0efc114a3afc0, %g1, %r4
        setx  0xdc65b645f95aadcf, %g1, %r5
        setx  0x82fc9f575f1c515c, %g1, %r6
        setx  0xb6dc61cce5202a6c, %g1, %r7
        setx  0x8c325a18ff88ffb1, %g1, %r8
        setx  0xe4a485966b6ee2ac, %g1, %r9
        setx  0x30348b66ffd0fa64, %g1, %r10
        setx  0xa6ca08adb1d332f9, %g1, %r11
        setx  0x4e809a1d129b9188, %g1, %r12
        setx  0x3126212baab5d578, %g1, %r13
        setx  0xd1982fc97bc6b627, %g1, %r14
        setx  0x063ab9942eae053a, %g1, %r15
        setx  0xa3dc236257fff342, %g1, %r18
        setx  0x366a5c5badf5d653, %g1, %r19
        setx  0x5a4e6110d5c4d93d, %g1, %r20
        setx  0x6289ca2fb9036ccf, %g1, %r21
        setx  0x6174a31b4b9471a4, %g1, %r22
        setx  0x66d2e040ea964b9c, %g1, %r23
        setx  0x885debc419a7924e, %g1, %r24
        setx  0xaa9cd03314770f7f, %g1, %r25
        setx  0xc8cce5be5fef688f, %g1, %r26
        setx  0x2a58c0b0de099d3a, %g1, %r27
        setx  0xfb71f24b1cd86a78, %g1, %r28
        setx  0x392d68a510fc0efa, %g1, %r29
        setx  0xed076d47756efadf, %g1, %r30
        setx  0xbf98256068bde1b6, %g1, %r31
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
	.word 0xaab42dae  ! 0: ORNcc_I	orncc 	%r16, 0x0dae, %r21
	.word 0x8a040011  ! 2: ADD_R	add 	%r16, %r17, %r5
	.word 0x86840011  ! 2: ADDcc_R	addcc 	%r16, %r17, %r3
	.word 0xd84c2be5  ! 2: LDSB_I	ldsb	[%r16 + 0x0be5], %r12
	.word 0xc2240011  ! 3: STW_R	stw	%r1, [%r16 + %r17]
	.word 0xa44421d7  ! 5: ADDC_I	addc 	%r16, 0x01d7, %r18
	.word 0x8751c000  ! 5: RDPR_TL	rdpr	%tl, %r3
	.word 0xca742541  ! 7: STX_I	stx	%r5, [%r16 + 0x0541]
	.word 0x9e042e7b  ! 9: ADD_I	add 	%r16, 0x0e7b, %r15
	.word 0x8e9c0011  ! 9: XORcc_R	xorcc 	%r16, %r17, %r7
	.word 0x973c1011  ! 9: SRAX_R	srax	%r16, %r17, %r11
	.word 0xc36c25ef  ! 9: PREFETCH_I	prefetch	[%r16 + 0x05ef], #one_read
	.word 0x82140011  ! 10: OR_R	or 	%r16, %r17, %r1
	.word 0x9a1c2c2b  ! 12: XOR_I	xor 	%r16, 0x0c2b, %r13
	.word 0x86942727  ! 12: ORcc_I	orcc 	%r16, 0x0727, %r3
	.word 0xaaac0011  ! 12: ANDNcc_R	andncc 	%r16, %r17, %r21
	.word 0xc36c2ddf  ! 12: PREFETCH_I	prefetch	[%r16 + 0x0ddf], #one_read
	.word 0xea2c2fad  ! 14: STB_I	stb	%r21, [%r16 + 0x0fad]
	.word 0xd29c1011  ! 16: LDDA_R	ldda	[%r16, %r17] 0x80, %r9
	.word 0xc6340011  ! 17: STH_R	sth	%r3, [%r16 + %r17]
	.word 0x8dabc831  ! 19: FMOVVC	fmovs	%fcc1, %f17, %f6
	.word 0x8ca423f5  ! 20: SUBcc_I	subcc 	%r16, 0x03f5, %r6
	.word 0x92ac0011  ! 22: ANDNcc_R	andncc 	%r16, %r17, %r9
	.word 0x8c840011  ! 22: ADDcc_R	addcc 	%r16, %r17, %r6
	.word 0x9c3c0011  ! 22: XNOR_R	xnor 	%r16, %r17, %r14
	.word 0x93514000  ! 22: RDPR_TBA	rdpr	%tba, %r9
	.word 0xd22c2607  ! 24: STB_I	stb	%r9, [%r16 + 0x0607]
	.word 0x8ebc0011  ! 26: XNORcc_R	xnorcc 	%r16, %r17, %r7
	.word 0xad641811  ! 26: MOVcc_R	<illegal instruction>
	.word 0x9ebc2853  ! 26: XNORcc_I	xnorcc 	%r16, 0x0853, %r15
	.word 0xe4a4204d  ! 26: STWA_I	stwa	%r18, [%r16 + 0x004d] %asi
	.word 0x9cb40011  ! 27: ORNcc_R	orncc 	%r16, %r17, %r14
	.word 0x852c1011  ! 29: SLLX_R	sllx	%r16, %r17, %r2
thr3_resum_intr_0:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_0), 16, 16)) -> intp(3, 3, 1)
	wr      %r0, 0x5, %asr26
	.word 0xec240011  ! 30: STW_R	stw	%r22, [%r16 + %r17]
	.word 0x8b2c0011  ! 32: SLL_R	sll 	%r16, %r17, %r5
	.word 0xa4040011  ! 32: ADD_R	add 	%r16, %r17, %r18
	.word 0x949c0011  ! 32: XORcc_R	xorcc 	%r16, %r17, %r10
	.word 0x8143c000  ! 32: STBAR	stbar
thr3_irf_ce_0:
!$EV error(3,expr(@VA(.MAIN.thr3_irf_ce_0), 16, 16),1,IRF,ce,68,x, x,x,x, x,x,x)
	.word 0xde7429e5  ! 35: STX_I	stx	%r15, [%r16 + 0x09e5]
	.word 0x9c342ea7  ! 37: ORN_I	orn 	%r16, 0x0ea7, %r14
thr3_resum_intr_1:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1), 16, 16)) -> intp(3, 3, 1)
	wr      %r0, 0x5, %asr26
	.word 0xb894264f  ! 38: ORcc_I	orcc 	%r16, 0x064f, %r28
	.word 0xa45c0011  ! 40: SMUL_R	smul 	%r16, %r17, %r18
	.word 0xc4240011  ! 41: STW_R	stw	%r2, [%r16 + %r17]
	.word 0x8b2c1011  ! 43: SLLX_R	sllx	%r16, %r17, %r5
	.word 0xb63c0011  ! 43: XNOR_R	xnor 	%r16, %r17, %r27
	.word 0x8143c000  ! 43: STBAR	stbar
	.word 0xd2240011  ! 44: STW_R	stw	%r9, [%r16 + %r17]
	.word 0xbf7c2401  ! 46: MOVR_I	move	%r16, 0xfffffff8, %r31
	.word 0xac142157  ! 46: OR_I	or 	%r16, 0x0157, %r22
	.word 0xac442e9f  ! 46: ADDC_I	addc 	%r16, 0x0e9f, %r22
	.word 0x87ac0a51  ! 46: FCMPd	fcmpd	%fcc<n>, %f16, %f48
	.word 0xe6240011  ! 47: STW_R	stw	%r19, [%r16 + %r17]
	.word 0x93641811  ! 49: MOVcc_R	<illegal instruction>
	.word 0xa4bc0011  ! 49: XNORcc_R	xnorcc 	%r16, %r17, %r18
        wr %g0, 0x4, %fprs
	.word 0xb6342f77  ! 50: ORN_I	orn 	%r16, 0x0f77, %r27
	.word 0xb08c21ca  ! 52: ANDcc_I	andcc 	%r16, 0x01ca, %r24
	.word 0x9d3c2001  ! 52: SRA_I	sra 	%r16, 0x0001, %r14
	.word 0xc4442882  ! 52: LDSW_I	ldsw	[%r16 + 0x0882], %r2
	.word 0xf0340011  ! 53: STH_R	sth	%r24, [%r16 + %r17]
	.word 0xb80421c8  ! 55: ADD_I	add 	%r16, 0x01c8, %r28
	.word 0x98b42f91  ! 55: ORNcc_I	orncc 	%r16, 0x0f91, %r12
	.word 0x1a800001  ! 55: BCC	bcc  	<label_0x1>
	.word 0xee242809  ! 57: STW_I	stw	%r23, [%r16 + 0x0809]
	.word 0xaaac2ee2  ! 59: ANDNcc_I	andncc 	%r16, 0x0ee2, %r21
	.word 0x98c40011  ! 59: ADDCcc_R	addccc 	%r16, %r17, %r12
	.word 0x840c2480  ! 59: AND_I	and 	%r16, 0x0480, %r2
	.word 0xe4d41011  ! 59: LDSHA_R	ldsha	[%r16, %r17] 0x80, %r18
	.word 0xcc342fcf  ! 61: STH_I	sth	%r6, [%r16 + 0x0fcf]
	.word 0x83341011  ! 63: SRLX_R	srlx	%r16, %r17, %r1
	.word 0xa7514000  ! 63: RDPR_TBA	rdpr	%tba, %r19
	.word 0xd8740011  ! 64: STX_R	stx	%r12, [%r16 + %r17]
	.word 0x860c238b  ! 66: AND_I	and 	%r16, 0x038b, %r3
	.word 0x82ac290c  ! 66: ANDNcc_I	andncc 	%r16, 0x090c, %r1
	.word 0x81580000  ! 66: FLUSHW	flushw
	.word 0x952c0011  ! 67: SLL_R	sll 	%r16, %r17, %r10
	.word 0xab2c0011  ! 69: SLL_R	sll 	%r16, %r17, %r21
	.word 0x99342001  ! 69: SRL_I	srl 	%r16, 0x0001, %r12
	ta	T_CHANGE_PRIV	! macro
	.word 0xf0240011  ! 70: STW_R	stw	%r24, [%r16 + %r17]
	.word 0x10800003  ! 72: BA	ba  	<label_0x3>
	.word 0xc62c0011  ! 73: STB_R	stb	%r3, [%r16 + %r17]
	.word 0xba8c0011  ! 75: ANDcc_R	andcc 	%r16, %r17, %r29
	.word 0x81dc231f  ! 75: FLUSH_I	dis not found

	.word 0x98bc2b79  ! 76: XNORcc_I	xnorcc 	%r16, 0x0b79, %r12
	.word 0xb33c2001  ! 78: SRA_I	sra 	%r16, 0x0001, %r25
	.word 0xc36c0011  ! 78: PREFETCH_R	prefetch	[%r16 + %r17], #one_read
thr3_irf_ce_1:
!$EV error(3,expr(@VA(.MAIN.thr3_irf_ce_1), 16, 16),1,IRF,ce,57,x, x,x,x, x,x,x)
	.word 0xfa242e71  ! 81: STW_I	stw	%r29, [%r16 + 0x0e71]
	.word 0x2e800001  ! 83: BVS	bvs,a	<label_0x1>
	.word 0xbc142708  ! 84: OR_I	or 	%r16, 0x0708, %r30
	.word 0x84940011  ! 86: ORcc_R	orcc 	%r16, %r17, %r2
	.word 0xfeb41011  ! 86: STHA_R	stha	%r31, [%r16 + %r17] 0x80
	.word 0xee740011  ! 87: STX_R	stx	%r23, [%r16 + %r17]
	.word 0x9e3c2193  ! 89: XNOR_I	xnor 	%r16, 0x0193, %r15
	.word 0xf8f41011  ! 89: STXA_R	stxa	%r28, [%r16 + %r17] 0x80
	.word 0x988c2d10  ! 90: ANDcc_I	andcc 	%r16, 0x0d10, %r12
	.word 0x8143c000  ! 92: STBAR	stbar
	.word 0xd0240011  ! 93: STW_R	stw	%r8, [%r16 + %r17]
	.word 0x8e9425e9  ! 95: ORcc_I	orcc 	%r16, 0x05e9, %r7
	.word 0x9e840011  ! 95: ADDcc_R	addcc 	%r16, %r17, %r15
	.word 0x9f643801  ! 95: MOVcc_I	<illegal instruction>
	.word 0x81880000  ! 95: RESTORED	saved
	.word 0x8c140011  ! 96: OR_R	or 	%r16, %r17, %r6
	.word 0xba5c2e64  ! 98: SMUL_I	smul 	%r16, 0x0e64, %r29
	.word 0xd6342cbf  ! 100: STH_I	sth	%r11, [%r16 + 0x0cbf]
	.word 0xa52c3001  ! 102: SLLX_I	sllx	%r16, 0x0001, %r18
	.word 0xea1c2977  ! 102: LDD_I	ldd	[%r16 + 0x0977], %r21
	.word 0xc634290b  ! 104: STH_I	sth	%r3, [%r16 + 0x090b]
	.word 0xc3ec1011  ! 106: PREFETCHA_R	prefetcha	[%r16, %r17] 0x80, #one_read
thr3_irf_ce_2:
!$EV error(3,expr(@VA(.MAIN.thr3_irf_ce_2), 16, 16),1,IRF,ce,33,x, x,x,x, x,x,x)
	.word 0xc62c2327  ! 109: STB_I	stb	%r3, [%r16 + 0x0327]
	.word 0xa68c289b  ! 111: ANDcc_I	andcc 	%r16, 0x089b, %r19
	.word 0xae042ec0  ! 111: ADD_I	add 	%r16, 0x0ec0, %r23
	.word 0xc6942a1b  ! 111: LDUHA_I	lduha	[%r16, + 0x0a1b] %asi, %r3
	.word 0xfe340011  ! 112: STH_R	sth	%r31, [%r16 + %r17]
	.word 0xa8342e93  ! 114: ORN_I	orn 	%r16, 0x0e93, %r20
	.word 0x900421d3  ! 114: ADD_I	add 	%r16, 0x01d3, %r8
	.word 0xe4cc2416  ! 114: LDSBA_I	ldsba	[%r16, + 0x0416] %asi, %r18
	.word 0xc8240011  ! 115: STW_R	stw	%r4, [%r16 + %r17]
	.word 0x8143e07a  ! 117: MEMBAR	membar	#StoreLoad | #StoreStore | #Lookaside | #MemIssue | #Sync 
	.word 0xd6740011  ! 118: STX_R	stx	%r11, [%r16 + %r17]
	.word 0xa52c0011  ! 120: SLL_R	sll 	%r16, %r17, %r18
	.word 0x8be40011  ! 120: SAVE_R	save	%r16, %r17, %r5
	.word 0xf0240011  ! 121: STW_R	stw	%r24, [%r16 + %r17]
	.word 0x82c40011  ! 123: ADDCcc_R	addccc 	%r16, %r17, %r1
	.word 0x8f3c1011  ! 123: SRAX_R	srax	%r16, %r17, %r7
        wr %g0, 0x4, %fprs
	.word 0xe62c2f57  ! 125: STB_I	stb	%r19, [%r16 + 0x0f57]
	.word 0xa4342839  ! 127: ORN_I	orn 	%r16, 0x0839, %r18
	.word 0x883c0011  ! 127: XNOR_R	xnor 	%r16, %r17, %r4
	.word 0x81dc0011  ! 127: FLUSH_R	dis not found

thr3_irf_ce_3:
!$EV error(3,expr(@VA(.MAIN.thr3_irf_ce_3), 16, 16),1,IRF,ce,4,x, x,x,x, x,x,x)
	.word 0xcc242417  ! 130: STW_I	stw	%r6, [%r16 + 0x0417]
	.word 0xb1341011  ! 132: SRLX_R	srlx	%r16, %r17, %r24
	.word 0xd0dc23c7  ! 132: LDXA_I	ldxa	[%r16, + 0x03c7] %asi, %r8
	.word 0xd22c0011  ! 133: STB_R	stb	%r9, [%r16 + %r17]
	.word 0xc484210c  ! 135: LDUWA_I	lduwa	[%r16, + 0x010c] %asi, %r2
thr3_irf_ce_4:
!$EV error(3,expr(@VA(.MAIN.thr3_irf_ce_4), 16, 16),1,IRF,ce,57,x, x,x,x, x,x,x)
	.word 0xc4742d0b  ! 138: STX_I	stx	%r2, [%r16 + 0x0d0b]
	.word 0x82bc0011  ! 140: XNORcc_R	xnorcc 	%r16, %r17, %r1
	.word 0x8e8c2e64  ! 140: ANDcc_I	andcc 	%r16, 0x0e64, %r7
	.word 0x9f3c0011  ! 140: SRA_R	sra 	%r16, %r17, %r15
	.word 0x8e4c2468  ! 140: MULX_I	mulx 	%r16, 0x0468, %r7
	.word 0xc4740011  ! 141: STX_R	stx	%r2, [%r16 + %r17]
	.word 0x88ac24c1  ! 143: ANDNcc_I	andncc 	%r16, 0x04c1, %r4
	.word 0x873c1011  ! 143: SRAX_R	srax	%r16, %r17, %r3
	.word 0x91a019b1  ! 143: FsTOq	dis not found

	.word 0xd82c0011  ! 144: STB_R	stb	%r12, [%r16 + %r17]
	.word 0xaebc2f20  ! 146: XNORcc_I	xnorcc 	%r16, 0x0f20, %r23
	.word 0x8e3c2982  ! 146: XNOR_I	xnor 	%r16, 0x0982, %r7
	.word 0x91340011  ! 146: SRL_R	srl 	%r16, %r17, %r8
	.word 0x40000001  ! 146: CALL	call	disp30_1
	.word 0xcc242d9d  ! 148: STW_I	stw	%r6, [%r16 + 0x0d9d]
	.word 0xb6842bc9  ! 150: ADDcc_I	addcc 	%r16, 0x0bc9, %r27
	.word 0xdcf41011  ! 150: STXA_R	stxa	%r14, [%r16 + %r17] 0x80
	.word 0xc8240011  ! 151: STW_R	stw	%r4, [%r16 + %r17]
	.word 0xb6bc0011  ! 153: XNORcc_R	xnorcc 	%r16, %r17, %r27
	ta	T_CHANGE_PRIV	! macro
	.word 0xc6740011  ! 154: STX_R	stx	%r3, [%r16 + %r17]
	.word 0x9f3c1011  ! 156: SRAX_R	srax	%r16, %r17, %r15
	.word 0x932c1011  ! 156: SLLX_R	sllx	%r16, %r17, %r9
thr3_resum_intr_2:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_2), 16, 16)) -> intp(3, 3, 1)
	wr      %r0, 0x5, %asr26
	.word 0xd47425f1  ! 158: STX_I	stx	%r10, [%r16 + 0x05f1]
	.word 0x8d3c0011  ! 160: SRA_R	sra 	%r16, %r17, %r6
	.word 0x93340011  ! 160: SRL_R	srl 	%r16, %r17, %r9
	.word 0xca8c2ed1  ! 160: LDUBA_I	lduba	[%r16, + 0x0ed1] %asi, %r5
	.word 0xcc2c0011  ! 161: STB_R	stb	%r6, [%r16 + %r17]
	.word 0xf00c2903  ! 163: LDUB_I	ldub	[%r16 + 0x0903], %r24
	.word 0x932c3001  ! 164: SLLX_I	sllx	%r16, 0x0001, %r9
	.word 0x81dc2a38  ! 166: FLUSH_I	dis not found

	.word 0xcc342e81  ! 168: STH_I	sth	%r6, [%r16 + 0x0e81]
        wr %g0, 0x4, %fprs
	.word 0xcc342de3  ! 172: STH_I	sth	%r6, [%r16 + 0x0de3]
	.word 0xd72425df  ! 174: STF_I	st	%f11, [0x05df, %r16]
	.word 0xda2c0011  ! 175: STB_R	stb	%r13, [%r16 + %r17]
	.word 0x8b3c2001  ! 177: SRA_I	sra 	%r16, 0x0001, %r5
	.word 0xba8c28c3  ! 177: ANDcc_I	andcc 	%r16, 0x08c3, %r29
        wr %g0, 0x4, %fprs
thr3_irf_ce_5:
!$EV error(3,expr(@VA(.MAIN.thr3_irf_ce_5), 16, 16),1,IRF,ce,41,x, x,x,x, x,x,x)
	.word 0xec2c29b3  ! 180: STB_I	stb	%r22, [%r16 + 0x09b3]
	.word 0x98340011  ! 182: ORN_R	orn 	%r16, %r17, %r12
	.word 0x81dc2f99  ! 182: FLUSH_I	dis not found

thr3_irf_ce_6:
!$EV error(3,expr(@VA(.MAIN.thr3_irf_ce_6), 16, 16),1,IRF,ce,1,x, x,x,x, x,x,x)
	.word 0xd22c29fd  ! 185: STB_I	stb	%r9, [%r16 + 0x09fd]
	.word 0x8143c000  ! 187: STBAR	stbar
	.word 0xd2242135  ! 189: STW_I	stw	%r9, [%r16 + 0x0135]
	.word 0x8c040011  ! 191: ADD_R	add 	%r16, %r17, %r6
	.word 0x92bc27ad  ! 191: XNORcc_I	xnorcc 	%r16, 0x07ad, %r9
	.word 0x997c2401  ! 191: MOVR_I	move	%r16, 0xfffffff8, %r12
	.word 0x8143e017  ! 191: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #Lookaside 
	.word 0xc82c0011  ! 192: STB_R	stb	%r4, [%r16 + %r17]
	.word 0x873c1011  ! 194: SRAX_R	srax	%r16, %r17, %r3
	.word 0xb21c0011  ! 194: XOR_R	xor 	%r16, %r17, %r25
	.word 0x8f342001  ! 194: SRL_I	srl 	%r16, 0x0001, %r7
thr3_resum_intr_3:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_3), 16, 16)) -> intp(3, 3, 1)
	wr      %r0, 0x5, %asr26
thr3_irf_ce_7:
!$EV error(3,expr(@VA(.MAIN.thr3_irf_ce_7), 16, 16),1,IRF,ce,4,x, x,x,x, x,x,x)
	.word 0xd6342cab  ! 197: STH_I	sth	%r11, [%r16 + 0x0cab]
	.word 0xa9341011  ! 199: SRLX_R	srlx	%r16, %r17, %r20
	.word 0xb00c2526  ! 199: AND_I	and 	%r16, 0x0526, %r24
	.word 0x9c542f53  ! 199: UMUL_I	umul 	%r16, 0x0f53, %r14
	.word 0xaa842687  ! 200: ADDcc_I	addcc 	%r16, 0x0687, %r21
	.word 0xfb2426ca  ! 202: STF_I	st	%f29, [0x06ca, %r16]
	.word 0xb8340011  ! 203: ORN_R	orn 	%r16, %r17, %r28
	.word 0x8f641811  ! 205: MOVcc_R	<illegal instruction>
	.word 0x8e44210f  ! 205: ADDC_I	addc 	%r16, 0x010f, %r7
	.word 0x9a7c0011  ! 205: SDIV_R	sdiv 	%r16, %r17, %r13
	.word 0xea740011  ! 206: STX_R	stx	%r21, [%r16 + %r17]
	.word 0x9e3c0011  ! 208: XNOR_R	xnor 	%r16, %r17, %r15
	.word 0x9c9c2fce  ! 208: XORcc_I	xorcc 	%r16, 0x0fce, %r14
	.word 0x853c1011  ! 208: SRAX_R	srax	%r16, %r17, %r2
	.word 0xe87c0011  ! 208: SWAP_R	swap	%r20, [%r16 + %r17]
	.word 0xa8240011  ! 209: SUB_R	sub 	%r16, %r17, %r20
	.word 0x8143e07a  ! 211: MEMBAR	membar	#StoreLoad | #StoreStore | #Lookaside | #MemIssue | #Sync 
	.word 0xcc2c23db  ! 213: STB_I	stb	%r6, [%r16 + 0x03db]
	.word 0x940c0011  ! 215: AND_R	and 	%r16, %r17, %r10
	.word 0xaf7c0411  ! 215: MOVR_R	move	%r16, %r17, %r23
	.word 0x8143e028  ! 215: MEMBAR	membar	#StoreStore | #MemIssue 
	.word 0xc2340011  ! 216: STH_R	sth	%r1, [%r16 + %r17]
	.word 0x90140011  ! 218: OR_R	or 	%r16, %r17, %r8
	.word 0xbbec0011  ! 218: RESTORE_R	restore	%r16, %r17, %r29
	.word 0xfc340011  ! 219: STH_R	sth	%r30, [%r16 + %r17]
	.word 0xa84425f1  ! 221: ADDC_I	addc 	%r16, 0x05f1, %r20
	.word 0x96042c29  ! 221: ADD_I	add 	%r16, 0x0c29, %r11
	.word 0xa6840011  ! 221: ADDcc_R	addcc 	%r16, %r17, %r19
	.word 0x81dc2369  ! 221: FLUSH_I	dis not found

	.word 0xca240011  ! 222: STW_R	stw	%r5, [%r16 + %r17]
	.word 0x923c0011  ! 224: XNOR_R	xnor 	%r16, %r17, %r9
	.word 0x972c1011  ! 224: SLLX_R	sllx	%r16, %r17, %r11
	.word 0xd05c0011  ! 224: LDX_R	ldx	[%r16 + %r17], %r8
	.word 0xca740011  ! 225: STX_R	stx	%r5, [%r16 + %r17]
thr3_resum_intr_4:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_4), 16, 16)) -> intp(3, 3, 1)
	wr      %r0, 0x5, %asr26
	.word 0xee342397  ! 229: STH_I	sth	%r23, [%r16 + 0x0397]
	.word 0xaf641811  ! 231: MOVcc_R	<illegal instruction>
	.word 0xac142d36  ! 231: OR_I	or 	%r16, 0x0d36, %r22
	.word 0x8aac0011  ! 231: ANDNcc_R	andncc 	%r16, %r17, %r5
	.word 0xc36c276d  ! 231: PREFETCH_I	prefetch	[%r16 + 0x076d], #one_read
	.word 0xe6742315  ! 233: STX_I	stx	%r19, [%r16 + 0x0315]
	.word 0x92b422e9  ! 235: ORNcc_I	orncc 	%r16, 0x02e9, %r9
	.word 0x9d643801  ! 235: MOVcc_I	<illegal instruction>
	.word 0xb4342e30  ! 235: ORN_I	orn 	%r16, 0x0e30, %r26
	.word 0x81dc25e2  ! 235: FLUSH_I	dis not found

	.word 0xf4340011  ! 236: STH_R	sth	%r26, [%r16 + %r17]
	.word 0x937c0411  ! 238: MOVR_R	move	%r16, %r17, %r9
	.word 0xb20c2141  ! 238: AND_I	and 	%r16, 0x0141, %r25
	.word 0x8c9c25fd  ! 238: XORcc_I	xorcc 	%r16, 0x05fd, %r6
	.word 0x8efc28e7  ! 238: SDIVcc_I	sdivcc 	%r16, 0x08e7, %r7
	.word 0xc2740011  ! 239: STX_R	stx	%r1, [%r16 + %r17]
	.word 0x843c2cb7  ! 241: XNOR_I	xnor 	%r16, 0x0cb7, %r2
	.word 0xd07c2067  ! 241: SWAP_I	swap	%r8, [%r16 + 0x0067]
	.word 0xcc240011  ! 242: STW_R	stw	%r6, [%r16 + %r17]
	.word 0x8b3c0011  ! 244: SRA_R	sra 	%r16, %r17, %r5
thr3_resum_intr_5:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_5), 16, 16)) -> intp(3, 3, 1)
	wr      %r0, 0x5, %asr26
	.word 0xb80c2364  ! 245: AND_I	and 	%r16, 0x0364, %r28
	.word 0xb2ac2965  ! 247: ANDNcc_I	andncc 	%r16, 0x0965, %r25
	.word 0xbe042159  ! 247: ADD_I	add 	%r16, 0x0159, %r31
	.word 0x9ec424a7  ! 247: ADDCcc_I	addccc 	%r16, 0x04a7, %r15
	.word 0xc3ec2f5f  ! 247: PREFETCHA_I	prefetcha	[%r16, + 0x0f5f] %asi, #one_read
	.word 0x841c0011  ! 248: XOR_R	xor 	%r16, %r17, %r2
	.word 0x983423cf  ! 250: ORN_I	orn 	%r16, 0x03cf, %r12
	.word 0x929c2767  ! 250: XORcc_I	xorcc 	%r16, 0x0767, %r9
        wr %g0, 0x4, %fprs
	.word 0xe63423c9  ! 252: STH_I	sth	%r19, [%r16 + 0x03c9]
thr3_resum_intr_6:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_6), 16, 16)) -> intp(3, 3, 1)
	wr      %r0, 0x5, %asr26
	.word 0xe6742b1b  ! 256: STX_I	stx	%r19, [%r16 + 0x0b1b]
thr3_resum_intr_7:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_7), 16, 16)) -> intp(3, 3, 1)
	wr      %r0, 0x5, %asr26
	.word 0xe67424d9  ! 260: STX_I	stx	%r19, [%r16 + 0x04d9]
        wr %g0, 0x4, %fprs
	.word 0xde2c0011  ! 263: STB_R	stb	%r15, [%r16 + %r17]
	.word 0x9a942ad3  ! 265: ORcc_I	orcc 	%r16, 0x0ad3, %r13
	.word 0xad7c0411  ! 265: MOVR_R	move	%r16, %r17, %r22
	.word 0x8143e019  ! 265: MEMBAR	membar	#LoadLoad | #StoreStore | #Lookaside 
	.word 0xf224243d  ! 267: STW_I	stw	%r25, [%r16 + 0x043d]
	.word 0x9aac0011  ! 269: ANDNcc_R	andncc 	%r16, %r17, %r13
	.word 0x8143c000  ! 269: STBAR	stbar
thr3_irf_ce_8:
!$EV error(3,expr(@VA(.MAIN.thr3_irf_ce_8), 16, 16),1,IRF,ce,18,x, x,x,x, x,x,x)
	.word 0xea742741  ! 272: STX_I	stx	%r21, [%r16 + 0x0741]
	.word 0xb8942fdf  ! 274: ORcc_I	orcc 	%r16, 0x0fdf, %r28
	.word 0x9d2c0011  ! 274: SLL_R	sll 	%r16, %r17, %r14
	.word 0xec142474  ! 274: LDUH_I	lduh	[%r16 + 0x0474], %r22
	.word 0xab3c1011  ! 275: SRAX_R	srax	%r16, %r17, %r21
	.word 0x9cc40011  ! 277: ADDCcc_R	addccc 	%r16, %r17, %r14
	.word 0x0ccc0001  ! 277: BRGZ	brgz  ,pt	%16,<label_0xc0001>
	.word 0xdc240011  ! 278: STW_R	stw	%r14, [%r16 + %r17]
	.word 0x90c40011  ! 280: ADDCcc_R	addccc 	%r16, %r17, %r8
	.word 0x900c2faa  ! 280: AND_I	and 	%r16, 0x0faa, %r8
	.word 0x9d643801  ! 280: MOVcc_I	<illegal instruction>
	.word 0xbcf40011  ! 280: UDIVcc_R	udivcc 	%r16, %r17, %r30
	.word 0xd42c0011  ! 281: STB_R	stb	%r10, [%r16 + %r17]
	.word 0x8143e020  ! 283: MEMBAR	membar	#MemIssue 
	.word 0xd6342535  ! 285: STH_I	sth	%r11, [%r16 + 0x0535]
	.word 0x86840011  ! 287: ADDcc_R	addcc 	%r16, %r17, %r3
	.word 0x849426c3  ! 287: ORcc_I	orcc 	%r16, 0x06c3, %r2
	.word 0xfbf41011  ! 287: CASXA_I	casxa	[%r16] 0x80, %r17, %r29
thr3_irf_ce_9:
!$EV error(3,expr(@VA(.MAIN.thr3_irf_ce_9), 16, 16),1,IRF,ce,49,x, x,x,x, x,x,x)
	.word 0xd87426af  ! 290: STX_I	stx	%r12, [%r16 + 0x06af]
	.word 0xb77c0411  ! 292: MOVR_R	move	%r16, %r17, %r27
	.word 0xab340011  ! 292: SRL_R	srl 	%r16, %r17, %r21
	.word 0xb6342014  ! 292: ORN_I	orn 	%r16, 0x0014, %r27
	.word 0xde1c0011  ! 292: LDD_R	ldd	[%r16 + %r17], %r15
	.word 0xe6742d73  ! 294: STX_I	stx	%r19, [%r16 + 0x0d73]
	.word 0x9f240011  ! 296: MULScc_R	mulscc 	%r16, %r17, %r15
thr3_irf_ce_10:
!$EV error(3,expr(@VA(.MAIN.thr3_irf_ce_10), 16, 16),1,IRF,ce,66,x, x,x,x, x,x,x)
	.word 0xd8742fc9  ! 299: STX_I	stx	%r12, [%r16 + 0x0fc9]
	.word 0x83343001  ! 301: SRLX_I	srlx	%r16, 0x0001, %r1
	.word 0xac9c0011  ! 301: XORcc_R	xorcc 	%r16, %r17, %r22
	.word 0x82b40011  ! 301: ORNcc_R	orncc 	%r16, %r17, %r1
	.word 0xd9242b58  ! 301: STF_I	st	%f12, [0x0b58, %r16]
	.word 0x90340011  ! 302: SUBC_R	orn 	%r16, %r17, %r8
	.word 0x8e440011  ! 304: ADDC_R	addc 	%r16, %r17, %r7
	.word 0xd4a42003  ! 304: STWA_I	stwa	%r10, [%r16 + 0x0003] %asi
	.word 0xc8342609  ! 306: STH_I	sth	%r4, [%r16 + 0x0609]
	.word 0xc47c24ef  ! 308: SWAP_I	swap	%r2, [%r16 + 0x04ef]
	.word 0xde340011  ! 309: STH_R	sth	%r15, [%r16 + %r17]
	.word 0x8f342001  ! 311: SRL_I	srl 	%r16, 0x0001, %r7
	.word 0x8143c000  ! 311: STBAR	stbar
	.word 0xc8342951  ! 313: STH_I	sth	%r4, [%r16 + 0x0951]
	.word 0x88b42ddc  ! 315: ORNcc_I	orncc 	%r16, 0x0ddc, %r4
	.word 0x88042c22  ! 315: ADD_I	add 	%r16, 0x0c22, %r4
	.word 0x933c0011  ! 315: SRA_R	sra 	%r16, %r17, %r9
	.word 0xcd3c2576  ! 315: STDF_I	std	%f6, [0x0576, %r16]
thr3_irf_ce_11:
!$EV error(3,expr(@VA(.MAIN.thr3_irf_ce_11), 16, 16),1,IRF,ce,30,x, x,x,x, x,x,x)
	.word 0xda2427a7  ! 318: STW_I	stw	%r13, [%r16 + 0x07a7]
	.word 0x96c40011  ! 320: ADDCcc_R	addccc 	%r16, %r17, %r11
	.word 0xb0940011  ! 320: ORcc_R	orcc 	%r16, %r17, %r24
	.word 0xd2ac2839  ! 320: STBA_I	stba	%r9, [%r16 + 0x0839] %asi
	.word 0xa89c289b  ! 321: XORcc_I	xorcc 	%r16, 0x089b, %r20
	ta	T_CHANGE_PRIV	! macro
	.word 0x9034252a  ! 324: ORN_I	orn 	%r16, 0x052a, %r8
	.word 0x8e8c2923  ! 326: ANDcc_I	andcc 	%r16, 0x0923, %r7
	.word 0x81dc250f  ! 326: FLUSH_I	dis not found

	.word 0xd0240011  ! 327: STW_R	stw	%r8, [%r16 + %r17]
	.word 0x928c25f5  ! 329: ANDcc_I	andcc 	%r16, 0x05f5, %r9
	.word 0x8e8424a7  ! 329: ADDcc_I	addcc 	%r16, 0x04a7, %r7
	.word 0xab2422a7  ! 329: MULScc_I	mulscc 	%r16, 0x02a7, %r21
thr3_irf_ce_12:
!$EV error(3,expr(@VA(.MAIN.thr3_irf_ce_12), 16, 16),1,IRF,ce,38,x, x,x,x, x,x,x)
	.word 0xd434231f  ! 332: STH_I	sth	%r10, [%r16 + 0x031f]
	.word 0x9c842c01  ! 334: ADDcc_I	addcc 	%r16, 0x0c01, %r14
	.word 0x860c27b7  ! 334: AND_I	and 	%r16, 0x07b7, %r3
	.word 0x9edc0011  ! 334: SMULcc_R	smulcc 	%r16, %r17, %r15
	.word 0xbd643801  ! 335: MOVcc_I	<illegal instruction>
	.word 0xccf4296c  ! 337: STXA_I	stxa	%r6, [%r16 + 0x096c] %asi
	.word 0xc47422d3  ! 339: STX_I	stx	%r2, [%r16 + 0x02d3]
thr3_resum_intr_8:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_8), 16, 16)) -> intp(3, 3, 1)
	wr      %r0, 0x5, %asr26
	.word 0xc4242163  ! 343: STW_I	stw	%r2, [%r16 + 0x0163]
	.word 0x85641811  ! 345: MOVcc_R	<illegal instruction>
	.word 0x844c2f97  ! 345: MULX_I	mulx 	%r16, 0x0f97, %r2
thr3_irf_ce_13:
!$EV error(3,expr(@VA(.MAIN.thr3_irf_ce_13), 16, 16),1,IRF,ce,66,x, x,x,x, x,x,x)
	.word 0xde2c29bf  ! 348: STB_I	stb	%r15, [%r16 + 0x09bf]
	.word 0xbd3c2001  ! 350: SRA_I	sra 	%r16, 0x0001, %r30
thr3_resum_intr_9:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_9), 16, 16)) -> intp(3, 3, 1)
	wr      %r0, 0x5, %asr26
	.word 0x849c0011  ! 351: XORcc_R	xorcc 	%r16, %r17, %r2
	.word 0x8f7c0411  ! 353: MOVR_R	move	%r16, %r17, %r7
	.word 0x8e040011  ! 353: ADD_R	add 	%r16, %r17, %r7
	.word 0xd6d41011  ! 353: LDSHA_R	ldsha	[%r16, %r17] 0x80, %r11
	.word 0xdc2c2b61  ! 355: STB_I	stb	%r14, [%r16 + 0x0b61]
	.word 0xacb4231d  ! 357: ORNcc_I	orncc 	%r16, 0x031d, %r22
	.word 0x8c2c2790  ! 357: ANDN_I	andn 	%r16, 0x0790, %r6
	.word 0xaf2c3001  ! 357: SLLX_I	sllx	%r16, 0x0001, %r23
	.word 0xb1ab4831  ! 357: FMOVCC	fmovs	%fcc1, %f17, %f24
	.word 0xde2c0011  ! 358: STB_R	stb	%r15, [%r16 + %r17]
	.word 0x9a442739  ! 360: ADDC_I	addc 	%r16, 0x0739, %r13
	.word 0x917c2401  ! 360: MOVR_I	move	%r16, 0xfffffff8, %r8
	.word 0xc36c29ef  ! 360: PREFETCH_I	prefetch	[%r16 + 0x09ef], #one_read
	.word 0xea742135  ! 362: STX_I	stx	%r21, [%r16 + 0x0135]
        wr %g0, 0x4, %fprs
	.word 0xe6240011  ! 365: STW_R	stw	%r19, [%r16 + %r17]
	.word 0x90bc0011  ! 367: XNORcc_R	xnorcc 	%r16, %r17, %r8
	.word 0x95504000  ! 367: RDPR_TNPC	rdpr	%tnpc, %r10
	.word 0xd6242809  ! 369: STW_I	stw	%r11, [%r16 + 0x0809]
	.word 0x9551c000  ! 371: RDPR_TL	rdpr	%tl, %r10
thr3_irf_ce_14:
!$EV error(3,expr(@VA(.MAIN.thr3_irf_ce_14), 16, 16),1,IRF,ce,20,x, x,x,x, x,x,x)
	.word 0xd22c2b5d  ! 374: STB_I	stb	%r9, [%r16 + 0x0b5d]
	.word 0xbc3c0011  ! 376: XNOR_R	xnor 	%r16, %r17, %r30
	.word 0x868c0011  ! 376: ANDcc_R	andcc 	%r16, %r17, %r3
	.word 0xa5a01a31  ! 376: FsTOi	dis not found

thr3_irf_ce_15:
!$EV error(3,expr(@VA(.MAIN.thr3_irf_ce_15), 16, 16),1,IRF,ce,8,x, x,x,x, x,x,x)
	.word 0xfa24205f  ! 379: STW_I	stw	%r29, [%r16 + 0x005f]
	.word 0x9aac0011  ! 381: ANDNcc_R	andncc 	%r16, %r17, %r13
	.word 0x848c2a3f  ! 381: ANDcc_I	andcc 	%r16, 0x0a3f, %r2
	.word 0xfc6c22ec  ! 381: LDSTUB_I	ldstub	%r30, [%r16 + 0x02ec]
	.word 0xc42c29f3  ! 383: STB_I	stb	%r2, [%r16 + 0x09f3]
	.word 0x90bc0011  ! 385: XNORcc_R	xnorcc 	%r16, %r17, %r8
	ta	T_CHANGE_PRIV	! macro
thr3_irf_ce_16:
!$EV error(3,expr(@VA(.MAIN.thr3_irf_ce_16), 16, 16),1,IRF,ce,34,x, x,x,x, x,x,x)
	.word 0xca7428fd  ! 388: STX_I	stx	%r5, [%r16 + 0x08fd]
	.word 0x989423d6  ! 390: ORcc_I	orcc 	%r16, 0x03d6, %r12
	.word 0xba140011  ! 390: OR_R	or 	%r16, %r17, %r29
	.word 0xceac1011  ! 390: STBA_R	stba	%r7, [%r16 + %r17] 0x80
	.word 0xc22c2c3b  ! 392: STB_I	stb	%r1, [%r16 + 0x0c3b]
	.word 0x94c40011  ! 394: ADDCcc_R	addccc 	%r16, %r17, %r10
	.word 0xc26c0011  ! 394: LDSTUB_R	ldstub	%r1, [%r16 + %r17]
	.word 0xad2c2001  ! 395: SLL_I	sll 	%r16, 0x0001, %r22
	.word 0xb60c276d  ! 397: AND_I	and 	%r16, 0x076d, %r27
	.word 0xdcb41011  ! 397: STHA_R	stha	%r14, [%r16 + %r17] 0x80
	.word 0xe4342483  ! 399: STH_I	sth	%r18, [%r16 + 0x0483]
	.word 0xa81c2c7d  ! 401: XOR_I	xor 	%r16, 0x0c7d, %r20
	.word 0x8bec0011  ! 401: RESTORE_R	restore	%r16, %r17, %r5
thr3_irf_ce_17:
!$EV error(3,expr(@VA(.MAIN.thr3_irf_ce_17), 16, 16),1,IRF,ce,7,x, x,x,x, x,x,x)
	.word 0xee3427fd  ! 404: STH_I	sth	%r23, [%r16 + 0x07fd]
	.word 0x81880000  ! 406: RESTORED	saved
thr3_irf_ce_18:
!$EV error(3,expr(@VA(.MAIN.thr3_irf_ce_18), 16, 16),1,IRF,ce,34,x, x,x,x, x,x,x)
	.word 0xee2c2825  ! 409: STB_I	stb	%r23, [%r16 + 0x0825]
	.word 0x8143c000  ! 411: STBAR	stbar
	.word 0x84bc0011  ! 412: XNORcc_R	xnorcc 	%r16, %r17, %r2
	.word 0x9f7c2401  ! 414: MOVR_I	move	%r16, 0xfffffff8, %r15
	.word 0x97342001  ! 414: SRL_I	srl 	%r16, 0x0001, %r11
	.word 0xc3ec1011  ! 414: PREFETCHA_R	prefetcha	[%r16, %r17] 0x80, #one_read
thr3_irf_ce_19:
!$EV error(3,expr(@VA(.MAIN.thr3_irf_ce_19), 16, 16),1,IRF,ce,70,x, x,x,x, x,x,x)
	.word 0xd4242f37  ! 417: STW_I	stw	%r10, [%r16 + 0x0f37]
	.word 0xa60c0011  ! 419: AND_R	and 	%r16, %r17, %r19
	.word 0xae3c225c  ! 419: XNOR_I	xnor 	%r16, 0x025c, %r23
	.word 0x9a140011  ! 419: OR_R	or 	%r16, %r17, %r13
	.word 0x22cc0001  ! 419: BRZ	brz,a,pt	%16,<label_0xc0001>
	.word 0xb03c0011  ! 420: XNOR_R	xnor 	%r16, %r17, %r24
	.word 0xc41c0011  ! 422: LDD_R	ldd	[%r16 + %r17], %r2
	.word 0xd6240011  ! 423: STW_R	stw	%r11, [%r16 + %r17]
	.word 0x9ab423db  ! 425: ORNcc_I	orncc 	%r16, 0x03db, %r13
	.word 0x84140011  ! 425: OR_R	or 	%r16, %r17, %r2
	.word 0xc85c22f9  ! 425: LDX_I	ldx	[%r16 + 0x02f9], %r4
	.word 0x877c2401  ! 426: MOVR_I	move	%r16, 0x7fffbdd8, %r3
	.word 0x9c7c2f41  ! 428: SDIV_I	sdiv 	%r16, 0x0f41, %r14
thr3_irf_ce_20:
!$EV error(3,expr(@VA(.MAIN.thr3_irf_ce_20), 16, 16),1,IRF,ce,22,x, x,x,x, x,x,x)
	.word 0xea3422e7  ! 431: STH_I	sth	%r21, [%r16 + 0x02e7]
	.word 0xd08c1011  ! 433: LDUBA_R	lduba	[%r16, %r17] 0x80, %r8
	.word 0x98ac0011  ! 434: ANDNcc_R	andncc 	%r16, %r17, %r12
	.word 0xa4b40011  ! 436: ORNcc_R	orncc 	%r16, %r17, %r18
	.word 0x9c1c0011  ! 436: XOR_R	xor 	%r16, %r17, %r14
	.word 0x9f341011  ! 436: SRLX_R	srlx	%r16, %r17, %r15
	ta	T_CHANGE_HPRIV	! macro
thr3_irf_ce_21:
!$EV error(3,expr(@VA(.MAIN.thr3_irf_ce_21), 16, 16),1,IRF,ce,64,x, x,x,x, x,x,x)
	.word 0xc4342593  ! 439: STH_I	sth	%r2, [%r16 + 0x0593]
	.word 0xd07c261a  ! 441: SWAP_I	swap	%r8, [%r16 + 0x061a]
	.word 0x9d643801  ! 442: MOVcc_I	<illegal instruction>
	.word 0x9f340011  ! 444: SRL_R	srl 	%r16, %r17, %r15
thr3_resum_intr_10:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_10), 16, 16)) -> intp(3, 3, 1)
	wr      %r0, 0x5, %asr26
	.word 0xd2240011  ! 445: STW_R	stw	%r9, [%r16 + %r17]
	.word 0x9d641811  ! 447: MOVcc_R	<illegal instruction>
	.word 0xdc6c2bf1  ! 447: LDSTUB_I	ldstub	%r14, [%r16 + 0x0bf1]
thr3_irf_ce_22:
!$EV error(3,expr(@VA(.MAIN.thr3_irf_ce_22), 16, 16),1,IRF,ce,36,x, x,x,x, x,x,x)
	.word 0xfe242787  ! 450: STW_I	stw	%r31, [%r16 + 0x0787]
	.word 0xb8840011  ! 452: ADDcc_R	addcc 	%r16, %r17, %r28
	.word 0x81580000  ! 452: FLUSHW	flushw
thr3_irf_ce_23:
!$EV error(3,expr(@VA(.MAIN.thr3_irf_ce_23), 16, 16),1,IRF,ce,31,x, x,x,x, x,x,x)
	.word 0xd4342803  ! 455: STH_I	sth	%r10, [%r16 + 0x0803]
	.word 0x8d7c0411  ! 457: MOVR_R	move	%r16, %r17, %r6
	.word 0xa6bc0011  ! 457: XNORcc_R	xnorcc 	%r16, %r17, %r19
	.word 0x9cfc228a  ! 457: SDIVcc_I	sdivcc 	%r16, 0x028a, %r14
	.word 0xd434236f  ! 459: STH_I	sth	%r10, [%r16 + 0x036f]
	.word 0xa92c2001  ! 461: SLL_I	sll 	%r16, 0x0001, %r20
	.word 0x24800001  ! 461: BLE	ble,a	<label_0x1>
	.word 0xfe2c2309  ! 463: STB_I	stb	%r31, [%r16 + 0x0309]
	.word 0x8ac40011  ! 465: ADDCcc_R	addccc 	%r16, %r17, %r5
	.word 0x82942f6b  ! 465: ORcc_I	orcc 	%r16, 0x0f6b, %r1
	.word 0xbc8c0011  ! 465: ANDcc_R	andcc 	%r16, %r17, %r30
	.word 0xf1e41011  ! 465: CASA_I	casa	[%r16] 0x80, %r17, %r24
	.word 0xda24229d  ! 467: STW_I	stw	%r13, [%r16 + 0x029d]
	.word 0xf0bc2f64  ! 469: STDA_I	stda	%r24, [%r16 + 0x0f64] %asi
	.word 0xaa242382  ! 470: SUB_I	sub 	%r16, 0x0382, %r21
	.word 0x913c2001  ! 472: SRA_I	sra 	%r16, 0x0001, %r8
	.word 0xa6bc2908  ! 472: XNORcc_I	xnorcc 	%r16, 0x0908, %r19
	.word 0x83641811  ! 472: MOVcc_R	<illegal instruction>
thr3_resum_intr_11:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_11), 16, 16)) -> intp(3, 3, 1)
	wr      %r0, 0x5, %asr26
thr3_irf_ce_24:
!$EV error(3,expr(@VA(.MAIN.thr3_irf_ce_24), 16, 16),1,IRF,ce,34,x, x,x,x, x,x,x)
	.word 0xe4242041  ! 475: STW_I	stw	%r18, [%r16 + 0x0041]
	.word 0xae340011  ! 477: ORN_R	orn 	%r16, %r17, %r23
	.word 0x8ebc0011  ! 477: XNORcc_R	xnorcc 	%r16, %r17, %r7
	.word 0x90ac0011  ! 477: ANDNcc_R	andncc 	%r16, %r17, %r8
thr3_resum_intr_12:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_12), 16, 16)) -> intp(3, 3, 1)
	wr      %r0, 0x5, %asr26
	.word 0xd0242049  ! 479: STW_I	stw	%r8, [%r16 + 0x0049]
	.word 0x9a340011  ! 481: ORN_R	orn 	%r16, %r17, %r13
	.word 0x9cac23df  ! 481: ANDNcc_I	andncc 	%r16, 0x03df, %r14
	.word 0xa9340011  ! 481: SRL_R	srl 	%r16, %r17, %r20
	.word 0xc36c2bde  ! 481: PREFETCH_I	prefetch	[%r16 + 0x0bde], #one_read
	.word 0xaf7c2401  ! 482: MOVR_I	move	%r16, 0x7fffbdd8, %r23
	.word 0x9a9c2e9c  ! 484: XORcc_I	xorcc 	%r16, 0x0e9c, %r13
	.word 0xc36c27ed  ! 484: PREFETCH_I	prefetch	[%r16 + 0x07ed], #one_read
thr3_irf_ce_25:
!$EV error(3,expr(@VA(.MAIN.thr3_irf_ce_25), 16, 16),1,IRF,ce,30,x, x,x,x, x,x,x)
	.word 0xcc2c2319  ! 487: STB_I	stb	%r6, [%r16 + 0x0319]
	.word 0x00800001  ! 489: BN	bn  	<label_0x1>
	.word 0xcc2c2adb  ! 491: STB_I	stb	%r6, [%r16 + 0x0adb]
	.word 0xbe2c0011  ! 493: ANDN_R	andn 	%r16, %r17, %r31
	.word 0x82942b47  ! 493: ORcc_I	orcc 	%r16, 0x0b47, %r1
	.word 0x96bc0011  ! 493: XNORcc_R	xnorcc 	%r16, %r17, %r11
	.word 0x8143e008  ! 493: MEMBAR	membar	#StoreStore 
	.word 0xab7c0411  ! 494: MOVR_R	move	%r16, %r17, %r21
	.word 0xba440011  ! 496: ADDC_R	addc 	%r16, %r17, %r29
	.word 0xaeb424a8  ! 496: ORNcc_I	orncc 	%r16, 0x04a8, %r23
	.word 0x0ac40001  ! 496: BRNZ	brnz  ,nt	%16,<label_0x40001>
thr3_irf_ce_26:
!$EV error(3,expr(@VA(.MAIN.thr3_irf_ce_26), 16, 16),1,IRF,ce,56,x, x,x,x, x,x,x)
	.word 0xe634294d  ! 499: STH_I	sth	%r19, [%r16 + 0x094d]
	ta	T_CHANGE_HPRIV	! macro
	.word 0xe6242e1d  ! 503: STW_I	stw	%r19, [%r16 + 0x0e1d]
	.word 0xac4428d9  ! 505: ADDC_I	addc 	%r16, 0x08d9, %r22
	.word 0xa6040011  ! 505: ADD_R	add 	%r16, %r17, %r19
	.word 0xd53c0011  ! 505: STDF_R	std	%f10, [%r17, %r16]
	.word 0x82a40011  ! 506: SUBcc_R	subcc 	%r16, %r17, %r1
	.word 0xb8842408  ! 508: ADDcc_I	addcc 	%r16, 0x0408, %r28
	.word 0xc36c22a2  ! 508: PREFETCH_I	prefetch	[%r16 + 0x02a2], #one_read
	.word 0xd6340011  ! 509: STH_R	sth	%r11, [%r16 + %r17]
	.word 0xb52c1011  ! 511: SLLX_R	sllx	%r16, %r17, %r26
	.word 0x95340011  ! 511: SRL_R	srl 	%r16, %r17, %r10
	.word 0x84ac2e3d  ! 511: ANDNcc_I	andncc 	%r16, 0x0e3d, %r2
	.word 0x81580000  ! 511: FLUSHW	flushw
	.word 0xce2c0011  ! 512: STB_R	stb	%r7, [%r16 + %r17]
	.word 0xa9340011  ! 514: SRL_R	srl 	%r16, %r17, %r20
	.word 0x8b641811  ! 514: MOVcc_R	<illegal instruction>
	.word 0x8c8420f7  ! 514: ADDcc_I	addcc 	%r16, 0x00f7, %r6
	.word 0x81880000  ! 514: SAVED	saved
	.word 0xea2c2305  ! 516: STB_I	stb	%r21, [%r16 + 0x0305]
	.word 0xa52c0011  ! 518: SLL_R	sll 	%r16, %r17, %r18
        wr %g0, 0x4, %fprs
	.word 0xd22c0011  ! 519: STB_R	stb	%r9, [%r16 + %r17]
	.word 0x82840011  ! 521: ADDcc_R	addcc 	%r16, %r17, %r1
	.word 0x97ec0011  ! 521: RESTORE_R	restore	%r16, %r17, %r11
thr3_irf_ce_27:
!$EV error(3,expr(@VA(.MAIN.thr3_irf_ce_27), 16, 16),1,IRF,ce,28,x, x,x,x, x,x,x)
	.word 0xca242241  ! 524: STW_I	stw	%r5, [%r16 + 0x0241]
	.word 0x828426aa  ! 526: ADDcc_I	addcc 	%r16, 0x06aa, %r1
	.word 0x992c1011  ! 526: SLLX_R	sllx	%r16, %r17, %r12
	.word 0xd64c20fa  ! 526: LDSB_I	ldsb	[%r16 + 0x00fa], %r11
thr3_irf_ce_28:
!$EV error(3,expr(@VA(.MAIN.thr3_irf_ce_28), 16, 16),1,IRF,ce,10,x, x,x,x, x,x,x)
	.word 0xdc34248d  ! 529: STH_I	sth	%r14, [%r16 + 0x048d]
	.word 0xafa40931  ! 531: FMULs	fmuls	%f16, %f17, %f23
	.word 0x829c21f0  ! 532: XORcc_I	xorcc 	%r16, 0x01f0, %r1
	.word 0xb33c1011  ! 534: SRAX_R	srax	%r16, %r17, %r25
	.word 0x84042f0f  ! 534: ADD_I	add 	%r16, 0x0f0f, %r2
	.word 0xae840011  ! 534: ADDcc_R	addcc 	%r16, %r17, %r23
	.word 0x81580000  ! 534: FLUSHW	flushw
	.word 0xa6240011  ! 535: SUB_R	sub 	%r16, %r17, %r19
	.word 0xac0c0011  ! 537: AND_R	and 	%r16, %r17, %r22
	.word 0x8f641811  ! 537: MOVcc_R	<illegal instruction>
	.word 0x92440011  ! 537: ADDC_R	addc 	%r16, %r17, %r9
	.word 0x20800003  ! 537: BN	bn,a	<label_0x3>
	.word 0xca740011  ! 538: STX_R	stx	%r5, [%r16 + %r17]
        wr %g0, 0x4, %fprs
	.word 0xd0740011  ! 541: STX_R	stx	%r8, [%r16 + %r17]
	.word 0x901c0011  ! 543: XOR_R	xor 	%r16, %r17, %r8
thr3_resum_intr_13:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_13), 16, 16)) -> intp(3, 3, 1)
	wr      %r0, 0x5, %asr26
	.word 0xe8340011  ! 544: STH_R	sth	%r20, [%r16 + %r17]
	.word 0x9af40011  ! 546: UDIVcc_R	udivcc 	%r16, %r17, %r13
	.word 0xda2c27a5  ! 548: STB_I	stb	%r13, [%r16 + 0x07a5]
	.word 0x9ac40011  ! 550: ADDCcc_R	addccc 	%r16, %r17, %r13
	.word 0x91ec0011  ! 550: RESTORE_R	restore	%r16, %r17, %r8
	.word 0xec740011  ! 551: STX_R	stx	%r22, [%r16 + %r17]
	.word 0x980c2b48  ! 553: AND_I	and 	%r16, 0x0b48, %r12
	.word 0xa4142758  ! 553: OR_I	or 	%r16, 0x0758, %r18
	.word 0xb8d42c81  ! 553: UMULcc_I	umulcc 	%r16, 0x0c81, %r28
	.word 0xdc2c2969  ! 555: STB_I	stb	%r14, [%r16 + 0x0969]
	.word 0xa8b40011  ! 557: ORNcc_R	orncc 	%r16, %r17, %r20
	.word 0xb4b42335  ! 557: ORNcc_I	orncc 	%r16, 0x0335, %r26
	.word 0x98ac0011  ! 557: ANDNcc_R	andncc 	%r16, %r17, %r12
        wr %g0, 0x4, %fprs
	.word 0xc22c2d3d  ! 559: STB_I	stb	%r1, [%r16 + 0x0d3d]
thr3_resum_intr_14:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_14), 16, 16)) -> intp(3, 3, 1)
	wr      %r0, 0x5, %asr26
	.word 0xc2342325  ! 563: STH_I	sth	%r1, [%r16 + 0x0325]
	.word 0xa82c0011  ! 565: ANDN_R	andn 	%r16, %r17, %r20
	.word 0x981c23b9  ! 565: XOR_I	xor 	%r16, 0x03b9, %r12
	.word 0x9a4c2bf7  ! 565: MULX_I	mulx 	%r16, 0x0bf7, %r13
	.word 0xf4340011  ! 566: STH_R	sth	%r26, [%r16 + %r17]
thr3_resum_intr_15:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_15), 16, 16)) -> intp(3, 3, 1)
	wr      %r0, 0x5, %asr26
	.word 0xf6740011  ! 569: STX_R	stx	%r27, [%r16 + %r17]
        wr %g0, 0x4, %fprs
	.word 0x84a42e45  ! 572: SUBcc_I	subcc 	%r16, 0x0e45, %r2
        wr %g0, 0x4, %fprs
thr3_irf_ce_29:
!$EV error(3,expr(@VA(.MAIN.thr3_irf_ce_29), 16, 16),1,IRF,ce,55,x, x,x,x, x,x,x)
	.word 0xce342d75  ! 577: STH_I	sth	%r7, [%r16 + 0x0d75]
	.word 0x9c542db0  ! 579: UMUL_I	umul 	%r16, 0x0db0, %r14
	.word 0x96040011  ! 580: ADD_R	add 	%r16, %r17, %r11
	.word 0x8ab42bac  ! 582: ORNcc_I	orncc 	%r16, 0x0bac, %r5
	.word 0x9f341011  ! 582: SRLX_R	srlx	%r16, %r17, %r15
	.word 0xec6c0011  ! 582: LDSTUB_R	ldstub	%r22, [%r16 + %r17]
	.word 0xdc340011  ! 583: STH_R	sth	%r14, [%r16 + %r17]
	.word 0xc25c2b9d  ! 585: LDX_I	ldx	[%r16 + 0x0b9d], %r1
	.word 0x8a240011  ! 586: SUB_R	sub 	%r16, %r17, %r5
	.word 0xa68c0011  ! 588: ANDcc_R	andcc 	%r16, %r17, %r19
	.word 0x98442f99  ! 588: ADDC_I	addc 	%r16, 0x0f99, %r12
	.word 0x9eac2dd8  ! 588: ANDNcc_I	andncc 	%r16, 0x0dd8, %r15
	.word 0x8bec0011  ! 588: RESTORE_R	restore	%r16, %r17, %r5
thr3_irf_ce_30:
!$EV error(3,expr(@VA(.MAIN.thr3_irf_ce_30), 16, 16),1,IRF,ce,39,x, x,x,x, x,x,x)
	.word 0xdc7429b9  ! 591: STX_I	stx	%r14, [%r16 + 0x09b9]
	.word 0x972c0011  ! 593: SLL_R	sll 	%r16, %r17, %r11
	.word 0x8f2c1011  ! 593: SLLX_R	sllx	%r16, %r17, %r7
	.word 0x86940011  ! 593: ORcc_R	orcc 	%r16, %r17, %r3
	.word 0x8cdc0011  ! 593: SMULcc_R	smulcc 	%r16, %r17, %r6
	.word 0x832c0011  ! 594: SLL_R	sll 	%r16, %r17, %r1
	.word 0x849c2212  ! 596: XORcc_I	xorcc 	%r16, 0x0212, %r2
	.word 0x99340011  ! 596: SRL_R	srl 	%r16, %r17, %r12
	.word 0x81580000  ! 596: FLUSHW	flushw
	.word 0x908c2f16  ! 597: ANDcc_I	andcc 	%r16, 0x0f16, %r8
	.word 0x92140011  ! 599: OR_R	or 	%r16, %r17, %r9
        wr %g0, 0x4, %fprs
thr3_irf_ce_31:
!$EV error(3,expr(@VA(.MAIN.thr3_irf_ce_31), 16, 16),1,IRF,ce,1,x, x,x,x, x,x,x)
	.word 0xd034201b  ! 602: STH_I	sth	%r8, [%r16 + 0x001b]
	.word 0x853c0011  ! 604: SRA_R	sra 	%r16, %r17, %r2
	.word 0x948c0011  ! 604: ANDcc_R	andcc 	%r16, %r17, %r10
	.word 0x81880000  ! 604: SAVED	saved
	.word 0xdc340011  ! 605: STH_R	sth	%r14, [%r16 + %r17]
	.word 0xa8bc2b36  ! 607: XNORcc_I	xnorcc 	%r16, 0x0b36, %r20
	.word 0xb757c000  ! 607: RDPR_VER	rdpr	%-, %r27
	.word 0xde740011  ! 608: STX_R	stx	%r15, [%r16 + %r17]
	.word 0x84c40011  ! 610: ADDCcc_R	addccc 	%r16, %r17, %r2
	.word 0x909c2f7a  ! 610: XORcc_I	xorcc 	%r16, 0x0f7a, %r8
	.word 0xb4c40011  ! 610: ADDCcc_R	addccc 	%r16, %r17, %r26
	ta	T_CHANGE_PRIV	! macro
	.word 0xec740011  ! 611: STX_R	stx	%r22, [%r16 + %r17]
	.word 0x91643801  ! 613: MOVcc_I	<illegal instruction>
	.word 0x9adc23ce  ! 613: SMULcc_I	smulcc 	%r16, 0x03ce, %r13
	.word 0xaa340011  ! 614: SUBC_R	orn 	%r16, %r17, %r21
	.word 0x9d3c2001  ! 616: SRA_I	sra 	%r16, 0x0001, %r14
	.word 0x8d2c3001  ! 616: SLLX_I	sllx	%r16, 0x0001, %r6
	.word 0x9e3c0011  ! 616: XNOR_R	xnor 	%r16, %r17, %r15
	.word 0xeca41011  ! 616: STWA_R	stwa	%r22, [%r16 + %r17] 0x80
	.word 0xbc2c20c7  ! 617: ANDN_I	andn 	%r16, 0x00c7, %r30
	.word 0x90b40011  ! 619: ORNcc_R	orncc 	%r16, %r17, %r8
	.word 0x927c2611  ! 619: SDIV_I	sdiv 	%r16, 0x0611, %r9
thr3_irf_ce_32:
!$EV error(3,expr(@VA(.MAIN.thr3_irf_ce_32), 16, 16),1,IRF,ce,39,x, x,x,x, x,x,x)
	.word 0xdc2c246f  ! 622: STB_I	stb	%r14, [%r16 + 0x046f]
	.word 0xbb7c2401  ! 624: MOVR_I	move	%r16, 0xfffffff8, %r29
	.word 0x81840011  ! 624: WRY_R	wr	%r16, %r17, %y
	.word 0xd6742321  ! 626: STX_I	stx	%r11, [%r16 + 0x0321]
	.word 0xb8040011  ! 628: ADD_R	add 	%r16, %r17, %r28
	.word 0xa77c0411  ! 628: MOVR_R	move	%r16, %r17, %r19
	.word 0xb22c2ba3  ! 628: ANDN_I	andn 	%r16, 0x0ba3, %r25
	.word 0x8cdc0011  ! 628: SMULcc_R	smulcc 	%r16, %r17, %r6
thr3_irf_ce_33:
!$EV error(3,expr(@VA(.MAIN.thr3_irf_ce_33), 16, 16),1,IRF,ce,31,x, x,x,x, x,x,x)
	.word 0xe6742b8d  ! 631: STX_I	stx	%r19, [%r16 + 0x0b8d]
	.word 0xfc941011  ! 633: LDUHA_R	lduha	[%r16, %r17] 0x80, %r30
thr3_irf_ce_34:
!$EV error(3,expr(@VA(.MAIN.thr3_irf_ce_34), 16, 16),1,IRF,ce,25,x, x,x,x, x,x,x)
	.word 0xd22c2045  ! 636: STB_I	stb	%r9, [%r16 + 0x0045]
	.word 0x82c42bff  ! 638: ADDCcc_I	addccc 	%r16, 0x0bff, %r1
	.word 0x8f3c0011  ! 638: SRA_R	sra 	%r16, %r17, %r7
	.word 0x0ac40001  ! 638: BRNZ	brnz  ,nt	%16,<label_0x40001>
	.word 0xd02c261d  ! 640: STB_I	stb	%r8, [%r16 + 0x061d]
	.word 0xbd2c1011  ! 642: SLLX_R	sllx	%r16, %r17, %r30
	.word 0x9c0c0011  ! 642: AND_R	and 	%r16, %r17, %r14
	.word 0xcbe42011  ! 642: CASA_R	casa	[%r16] %asi, %r17, %r5
	.word 0x98ac0011  ! 643: ANDNcc_R	andncc 	%r16, %r17, %r12
	.word 0xb6342324  ! 645: ORN_I	orn 	%r16, 0x0324, %r27
	.word 0xf25c20eb  ! 645: LDX_I	ldx	[%r16 + 0x00eb], %r25
	.word 0x90340011  ! 646: ORN_R	orn 	%r16, %r17, %r8
	.word 0x833c1011  ! 648: SRAX_R	srax	%r16, %r17, %r1
	.word 0xbe0c25d6  ! 648: AND_I	and 	%r16, 0x05d6, %r31
	.word 0x8b342001  ! 648: SRL_I	srl 	%r16, 0x0001, %r5
	.word 0xf73c2527  ! 648: STDF_I	std	%f27, [0x0527, %r16]
thr3_irf_ce_35:
!$EV error(3,expr(@VA(.MAIN.thr3_irf_ce_35), 16, 16),1,IRF,ce,7,x, x,x,x, x,x,x)
	.word 0xe62427e7  ! 651: STW_I	stw	%r19, [%r16 + 0x07e7]
	.word 0xa8940011  ! 653: ORcc_R	orcc 	%r16, %r17, %r20
	.word 0xaf3c2001  ! 653: SRA_I	sra 	%r16, 0x0001, %r23
thr3_resum_intr_16:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_16), 16, 16)) -> intp(3, 3, 1)
	wr      %r0, 0x5, %asr26
	.word 0xf2740011  ! 654: STX_R	stx	%r25, [%r16 + %r17]
	.word 0x997c0411  ! 656: MOVR_R	move	%r16, %r17, %r12
	.word 0x88340011  ! 656: ORN_R	orn 	%r16, %r17, %r4
	.word 0x96142821  ! 656: OR_I	or 	%r16, 0x0821, %r11
        wr %g0, 0x4, %fprs
	.word 0x88042afd  ! 657: ADD_I	add 	%r16, 0x0afd, %r4
	.word 0xb02c0011  ! 659: ANDN_R	andn 	%r16, %r17, %r24
	.word 0x9c542bdb  ! 659: UMUL_I	umul 	%r16, 0x0bdb, %r14
	.word 0xd6242d13  ! 661: STW_I	stw	%r11, [%r16 + 0x0d13]
	.word 0xde1c0011  ! 663: LDD_R	ldd	[%r16 + %r17], %r15
	.word 0xcc7422a1  ! 665: STX_I	stx	%r6, [%r16 + 0x02a1]
	.word 0xbe2c0011  ! 667: ANDN_R	andn 	%r16, %r17, %r31
	.word 0x884c0011  ! 667: MULX_R	mulx 	%r16, %r17, %r4
	.word 0xee340011  ! 668: STH_R	sth	%r23, [%r16 + %r17]
	.word 0xde1c0011  ! 670: LDD_R	ldd	[%r16 + %r17], %r15
	.word 0xdc240011  ! 671: STW_R	stw	%r14, [%r16 + %r17]
	.word 0xbc1c0011  ! 673: XOR_R	xor 	%r16, %r17, %r30
	.word 0x81dc0011  ! 673: FLUSH_R	dis not found

	.word 0x9d7c0411  ! 674: MOVR_R	move	%r16, %r17, %r14
	.word 0x873c1011  ! 676: SRAX_R	srax	%r16, %r17, %r3
	.word 0x9e8c200c  ! 676: ANDcc_I	andcc 	%r16, 0x000c, %r15
	.word 0x9c4420af  ! 676: ADDC_I	addc 	%r16, 0x00af, %r14
	.word 0xec941011  ! 676: LDUHA_R	lduha	[%r16, %r17] 0x80, %r22
thr3_irf_ce_36:
!$EV error(3,expr(@VA(.MAIN.thr3_irf_ce_36), 16, 16),1,IRF,ce,19,x, x,x,x, x,x,x)
	.word 0xde2422ed  ! 679: STW_I	stw	%r15, [%r16 + 0x02ed]
	.word 0xaebc0011  ! 681: XNORcc_R	xnorcc 	%r16, %r17, %r23
	.word 0x8e1c0011  ! 681: XOR_R	xor 	%r16, %r17, %r7
	.word 0xdde42011  ! 681: CASA_R	casa	[%r16] %asi, %r17, %r14
	.word 0x89641811  ! 682: MOVcc_R	<illegal instruction>
	.word 0xb12c3001  ! 684: SLLX_I	sllx	%r16, 0x0001, %r24
	.word 0x96842ecb  ! 684: ADDcc_I	addcc 	%r16, 0x0ecb, %r11
	.word 0x883c2dbd  ! 684: XNOR_I	xnor 	%r16, 0x0dbd, %r4
	.word 0x9cdc2f90  ! 684: SMULcc_I	smulcc 	%r16, 0x0f90, %r14
thr3_irf_ce_37:
!$EV error(3,expr(@VA(.MAIN.thr3_irf_ce_37), 16, 16),1,IRF,ce,36,x, x,x,x, x,x,x)
	.word 0xf4242ce1  ! 687: STW_I	stw	%r26, [%r16 + 0x0ce1]
	.word 0x872c1011  ! 689: SLLX_R	sllx	%r16, %r17, %r3
	.word 0xacb40011  ! 689: ORNcc_R	orncc 	%r16, %r17, %r22
	.word 0xa83c0011  ! 689: XNOR_R	xnor 	%r16, %r17, %r20
	.word 0xf0a41011  ! 689: STWA_R	stwa	%r24, [%r16 + %r17] 0x80
	.word 0x9e3c0011  ! 690: XNOR_R	xnor 	%r16, %r17, %r15
	.word 0x9b342001  ! 692: SRL_I	srl 	%r16, 0x0001, %r13
        wr %g0, 0x4, %fprs
	.word 0xf4340011  ! 693: STH_R	sth	%r26, [%r16 + %r17]
	.word 0xaa1c2e7b  ! 695: XOR_I	xor 	%r16, 0x0e7b, %r21
	.word 0x862c0011  ! 695: ANDN_R	andn 	%r16, %r17, %r3
	.word 0x9d7c0411  ! 695: MOVR_R	move	%r16, %r17, %r14
	.word 0xd8cc2ece  ! 695: LDSBA_I	ldsba	[%r16, + 0x0ece] %asi, %r12
	.word 0xf22c0011  ! 696: STB_R	stb	%r25, [%r16 + %r17]
	.word 0xb8540011  ! 698: UMUL_R	umul 	%r16, %r17, %r28
	.word 0xca2c0011  ! 699: STB_R	stb	%r5, [%r16 + %r17]
	.word 0xc60c29ea  ! 701: LDUB_I	ldub	[%r16 + 0x09ea], %r3
	.word 0xc6740011  ! 702: STX_R	stx	%r3, [%r16 + %r17]
	.word 0x8a1c0011  ! 704: XOR_R	xor 	%r16, %r17, %r5
	.word 0x8b3c2001  ! 704: SRA_I	sra 	%r16, 0x0001, %r5
	.word 0x81dc0011  ! 704: FLUSH_R	dis not found

	.word 0xd62427a1  ! 706: STW_I	stw	%r11, [%r16 + 0x07a1]
	.word 0x92bc0011  ! 708: XNORcc_R	xnorcc 	%r16, %r17, %r9
	.word 0xb6bc0011  ! 708: XNORcc_R	xnorcc 	%r16, %r17, %r27
	.word 0x0cc40003  ! 708: BRGZ	brgz  ,nt	%16,<label_0x40003>
	.word 0xde240011  ! 709: STW_R	stw	%r15, [%r16 + %r17]
	.word 0x93340011  ! 711: SRL_R	srl 	%r16, %r17, %r9
	.word 0x8c740011  ! 711: UDIV_R	udiv 	%r16, %r17, %r6
	.word 0xda74212d  ! 713: STX_I	stx	%r13, [%r16 + 0x012d]
	.word 0x8d343001  ! 715: SRLX_I	srlx	%r16, 0x0001, %r6
	.word 0x8e1c0011  ! 715: XOR_R	xor 	%r16, %r17, %r7
	.word 0xc3ec27f1  ! 715: PREFETCHA_I	prefetcha	[%r16, + 0x07f1] %asi, #one_read
thr3_irf_ce_38:
!$EV error(3,expr(@VA(.MAIN.thr3_irf_ce_38), 16, 16),1,IRF,ce,20,x, x,x,x, x,x,x)
	.word 0xf2342927  ! 718: STH_I	sth	%r25, [%r16 + 0x0927]
	.word 0x8d3c0011  ! 720: SRA_R	sra 	%r16, %r17, %r6
	.word 0xa88429d9  ! 720: ADDcc_I	addcc 	%r16, 0x09d9, %r20
	.word 0x87a409d1  ! 720: FDIVd	fdivd	%f16, %f48, %f34
	.word 0x90c40011  ! 721: ADDCcc_R	addccc 	%r16, %r17, %r8
	.word 0xb53c0011  ! 723: SRA_R	sra 	%r16, %r17, %r26
	.word 0xbe8c0011  ! 723: ANDcc_R	andcc 	%r16, %r17, %r31
	.word 0x8ac40011  ! 723: ADDCcc_R	addccc 	%r16, %r17, %r5
	.word 0x9124210f  ! 723: MULScc_I	mulscc 	%r16, 0x010f, %r8
	.word 0xf62c2dfb  ! 725: STB_I	stb	%r27, [%r16 + 0x0dfb]
	.word 0xbb643801  ! 727: MOVcc_I	<illegal instruction>
	.word 0xb2b42fca  ! 727: ORNcc_I	orncc 	%r16, 0x0fca, %r25
	.word 0x90bc2eeb  ! 727: XNORcc_I	xnorcc 	%r16, 0x0eeb, %r8
	.word 0x1a800001  ! 727: BCC	bcc  	<label_0x1>
thr3_irf_ce_39:
!$EV error(3,expr(@VA(.MAIN.thr3_irf_ce_39), 16, 16),1,IRF,ce,0,x, x,x,x, x,x,x)
	.word 0xd22c2ec9  ! 730: STB_I	stb	%r9, [%r16 + 0x0ec9]
	.word 0xd41c0011  ! 732: LDD_R	ldd	[%r16 + %r17], %r10
	.word 0xbf2c1011  ! 733: SLLX_R	sllx	%r16, %r17, %r31
	.word 0x88c40011  ! 735: ADDCcc_R	addccc 	%r16, %r17, %r4
	.word 0xa5a00051  ! 735: FMOVd	fmovd	%f48, %f18
	.word 0x94240011  ! 736: SUB_R	sub 	%r16, %r17, %r10
	.word 0x8e840011  ! 738: ADDcc_R	addcc 	%r16, %r17, %r7
	.word 0x94bc2aa1  ! 738: XNORcc_I	xnorcc 	%r16, 0x0aa1, %r10
	.word 0x8aac2907  ! 738: ANDNcc_I	andncc 	%r16, 0x0907, %r5
	.word 0xc36c21fa  ! 738: PREFETCH_I	prefetch	[%r16 + 0x01fa], #one_read
thr3_irf_ce_40:
!$EV error(3,expr(@VA(.MAIN.thr3_irf_ce_40), 16, 16),1,IRF,ce,37,x, x,x,x, x,x,x)
	.word 0xd8342549  ! 741: STH_I	sth	%r12, [%r16 + 0x0549]
	.word 0x83340011  ! 743: SRL_R	srl 	%r16, %r17, %r1
	.word 0xa73c2001  ! 743: SRA_I	sra 	%r16, 0x0001, %r19
	.word 0x3c800001  ! 743: BPOS	bpos,a	<label_0x1>
thr3_irf_ce_41:
!$EV error(3,expr(@VA(.MAIN.thr3_irf_ce_41), 16, 16),1,IRF,ce,45,x, x,x,x, x,x,x)
	.word 0xf6742fad  ! 746: STX_I	stx	%r27, [%r16 + 0x0fad]
	.word 0x94ac0011  ! 748: ANDNcc_R	andncc 	%r16, %r17, %r10
	.word 0xb6040011  ! 748: ADD_R	add 	%r16, %r17, %r27
	.word 0x823c2dfa  ! 748: XNOR_I	xnor 	%r16, 0x0dfa, %r1
	.word 0x93a81831  ! 748: FMOVRGZ	fmovs	%fcc3, %f17, %f9
	.word 0xd6742f19  ! 750: STX_I	stx	%r11, [%r16 + 0x0f19]
	.word 0x9e042504  ! 752: ADD_I	add 	%r16, 0x0504, %r15
	.word 0x81580000  ! 752: FLUSHW	flushw
	.word 0xd4742e35  ! 754: STX_I	stx	%r10, [%r16 + 0x0e35]
	ta	T_CHANGE_HPRIV	! macro
thr3_irf_ce_42:
!$EV error(3,expr(@VA(.MAIN.thr3_irf_ce_42), 16, 16),1,IRF,ce,40,x, x,x,x, x,x,x)
	.word 0xd42c2745  ! 759: STB_I	stb	%r10, [%r16 + 0x0745]
	.word 0xaf343001  ! 761: SRLX_I	srlx	%r16, 0x0001, %r23
	.word 0x8143c000  ! 761: STBAR	stbar
	.word 0xe6740011  ! 762: STX_R	stx	%r19, [%r16 + %r17]
	.word 0x8b524000  ! 764: RDPR_CWP	rdpr	%cwp, %r5
	.word 0xd424282f  ! 766: STW_I	stw	%r10, [%r16 + 0x082f]
	.word 0x84c42299  ! 768: ADDCcc_I	addccc 	%r16, 0x0299, %r2
	.word 0x8a3c0011  ! 768: XNOR_R	xnor 	%r16, %r17, %r5
	.word 0x3e800003  ! 768: BVC	bvc,a	<label_0x3>
	.word 0x9b7c2401  ! 769: MOVR_I	move	%r16, 0x7fffbdd8, %r13
	.word 0x923c0011  ! 771: XNOR_R	xnor 	%r16, %r17, %r9
	.word 0x9a840011  ! 771: ADDcc_R	addcc 	%r16, %r17, %r13
	.word 0x98f42267  ! 771: UDIVcc_I	udivcc 	%r16, 0x0267, %r12
	.word 0x9f3c2001  ! 772: SRA_I	sra 	%r16, 0x0001, %r15
	.word 0x960c2a41  ! 774: AND_I	and 	%r16, 0x0a41, %r11
	.word 0x8c140011  ! 774: OR_R	or 	%r16, %r17, %r6
	.word 0xb8840011  ! 774: ADDcc_R	addcc 	%r16, %r17, %r28
	.word 0xd60c200d  ! 774: LDUB_I	ldub	[%r16 + 0x000d], %r11
	.word 0x86ac2299  ! 775: ANDNcc_I	andncc 	%r16, 0x0299, %r3
	.word 0xb1341011  ! 777: SRLX_R	srlx	%r16, %r17, %r24
	.word 0x86340011  ! 777: ORN_R	orn 	%r16, %r17, %r3
	.word 0xa4d40011  ! 777: UMULcc_R	umulcc 	%r16, %r17, %r18
thr3_irf_ce_43:
!$EV error(3,expr(@VA(.MAIN.thr3_irf_ce_43), 16, 16),1,IRF,ce,23,x, x,x,x, x,x,x)
	.word 0xd4242c79  ! 780: STW_I	stw	%r10, [%r16 + 0x0c79]
	.word 0x81580000  ! 782: FLUSHW	flushw
	.word 0xb33c1011  ! 783: SRAX_R	srax	%r16, %r17, %r25
	.word 0x981c2837  ! 785: XOR_I	xor 	%r16, 0x0837, %r12
	.word 0x96040011  ! 785: ADD_R	add 	%r16, %r17, %r11
thr3_resum_intr_17:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_17), 16, 16)) -> intp(3, 3, 1)
	wr      %r0, 0x5, %asr26
	.word 0x909c0011  ! 786: XORcc_R	xorcc 	%r16, %r17, %r8
	.word 0xcc8c2170  ! 788: LDUBA_I	lduba	[%r16, + 0x0170] %asi, %r6
	.word 0xf02c2677  ! 790: STB_I	stb	%r24, [%r16 + 0x0677]
	.word 0xb49c2b90  ! 792: XORcc_I	xorcc 	%r16, 0x0b90, %r26
	ta	T_CHANGE_NONPRIV	! macro
thr3_irf_ce_44:
!$EV error(3,expr(@VA(.MAIN.thr3_irf_ce_44), 16, 16),1,IRF,ce,33,x, x,x,x, x,x,x)
	.word 0xde2422cb  ! 795: STW_I	stw	%r15, [%r16 + 0x02cb]
	.word 0x88c40011  ! 797: ADDCcc_R	addccc 	%r16, %r17, %r4
	.word 0x98342d76  ! 797: ORN_I	orn 	%r16, 0x0d76, %r12
	.word 0x8f520000  ! 797: RDPR_PIL	rdpr	%pil, %r7
	.word 0xc62c2b4d  ! 799: STB_I	stb	%r3, [%r16 + 0x0b4d]
	.word 0x928c0011  ! 801: ANDcc_R	andcc 	%r16, %r17, %r9
	.word 0xde7c2730  ! 801: SWAP_I	swap	%r15, [%r16 + 0x0730]
	.word 0x8e440011  ! 802: ADDC_R	addc 	%r16, %r17, %r7
	.word 0x96b40011  ! 804: ORNcc_R	orncc 	%r16, %r17, %r11
	.word 0x820c0011  ! 804: AND_R	and 	%r16, %r17, %r1
	.word 0xd444204c  ! 804: LDSW_I	ldsw	[%r16 + 0x004c], %r10
	.word 0x8ca428b9  ! 805: SUBcc_I	subcc 	%r16, 0x08b9, %r6
	.word 0xfc4c217b  ! 807: LDSB_I	ldsb	[%r16 + 0x017b], %r30
	.word 0xc2342263  ! 809: STH_I	sth	%r1, [%r16 + 0x0263]
	.word 0x941c277e  ! 811: XOR_I	xor 	%r16, 0x077e, %r10
	.word 0x92440011  ! 811: ADDC_R	addc 	%r16, %r17, %r9
	.word 0x9cf4236b  ! 811: UDIVcc_I	udivcc 	%r16, 0x036b, %r14
	.word 0xbb2c1011  ! 812: SLLX_R	sllx	%r16, %r17, %r29
	.word 0x853c2001  ! 814: SRA_I	sra 	%r16, 0x0001, %r2
	.word 0x8e0c0011  ! 814: AND_R	and 	%r16, %r17, %r7
	.word 0x92342ad0  ! 814: ORN_I	orn 	%r16, 0x0ad0, %r9
	.word 0x912429f0  ! 814: MULScc_I	mulscc 	%r16, 0x09f0, %r8
thr3_irf_ce_45:
!$EV error(3,expr(@VA(.MAIN.thr3_irf_ce_45), 16, 16),1,IRF,ce,53,x, x,x,x, x,x,x)
	.word 0xca242643  ! 817: STW_I	stw	%r5, [%r16 + 0x0643]
thr3_resum_intr_18:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_18), 16, 16)) -> intp(3, 3, 1)
	wr      %r0, 0x5, %asr26
thr3_irf_ce_46:
!$EV error(3,expr(@VA(.MAIN.thr3_irf_ce_46), 16, 16),1,IRF,ce,29,x, x,x,x, x,x,x)
	.word 0xca24211f  ! 822: STW_I	stw	%r5, [%r16 + 0x011f]
	.word 0x952c2001  ! 824: SLL_I	sll 	%r16, 0x0001, %r10
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xbf342001  ! 825: SRL_I	srl 	%r16, 0x0001, %r31
	.word 0x92ac0011  ! 827: ANDNcc_R	andncc 	%r16, %r17, %r9
	.word 0xc8942bb7  ! 827: LDUHA_I	lduha	[%r16, + 0x0bb7] %asi, %r4
	.word 0x892c3001  ! 828: SLLX_I	sllx	%r16, 0x0001, %r4
	.word 0x848c2c9f  ! 830: ANDcc_I	andcc 	%r16, 0x0c9f, %r2
	.word 0x8f3c1011  ! 830: SRAX_R	srax	%r16, %r17, %r7
	.word 0xb0f42bb0  ! 830: UDIVcc_I	udivcc 	%r16, 0x0bb0, %r24
	.word 0xee340011  ! 831: STH_R	sth	%r23, [%r16 + %r17]
	.word 0x88042c71  ! 833: ADD_I	add 	%r16, 0x0c71, %r4
	.word 0x897c0411  ! 833: MOVR_R	move	%r16, %r17, %r4
	.word 0x8b2c2001  ! 833: SLL_I	sll 	%r16, 0x0001, %r5
        wr %g0, 0x4, %fprs
thr3_irf_ce_47:
!$EV error(3,expr(@VA(.MAIN.thr3_irf_ce_47), 16, 16),1,IRF,ce,3,x, x,x,x, x,x,x)
	.word 0xe6342275  ! 836: STH_I	sth	%r19, [%r16 + 0x0275]
	.word 0x9c042923  ! 838: ADD_I	add 	%r16, 0x0923, %r14
	ta	T_CHANGE_NONHPRIV	! macro
thr3_irf_ce_48:
!$EV error(3,expr(@VA(.MAIN.thr3_irf_ce_48), 16, 16),1,IRF,ce,69,x, x,x,x, x,x,x)
	.word 0xdc242ebb  ! 841: STW_I	stw	%r14, [%r16 + 0x0ebb]
	.word 0x880c0011  ! 843: AND_R	and 	%r16, %r17, %r4
	.word 0xa8942f16  ! 843: ORcc_I	orcc 	%r16, 0x0f16, %r20
	.word 0xbaac0011  ! 843: ANDNcc_R	andncc 	%r16, %r17, %r29
	.word 0xd6fc1011  ! 843: SWAPA_R	swapa	%r11, [%r16 + %r17] 0x80
	.word 0x843c21ac  ! 844: XNOR_I	xnor 	%r16, 0x01ac, %r2
	.word 0xb2842800  ! 846: ADDcc_I	addcc 	%r16, 0x0800, %r25
	.word 0xa6ac0011  ! 846: ANDNcc_R	andncc 	%r16, %r17, %r19
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xd2240011  ! 847: STW_R	stw	%r9, [%r16 + %r17]
	.word 0x9f342001  ! 849: SRL_I	srl 	%r16, 0x0001, %r15
	.word 0xa8c426f6  ! 849: ADDCcc_I	addccc 	%r16, 0x06f6, %r20
	.word 0x81880000  ! 849: RESTORED	saved
thr3_irf_ce_49:
!$EV error(3,expr(@VA(.MAIN.thr3_irf_ce_49), 16, 16),1,IRF,ce,52,x, x,x,x, x,x,x)
	.word 0xf47424fb  ! 852: STX_I	stx	%r26, [%r16 + 0x04fb]
	.word 0x8143e00e  ! 854: MEMBAR	membar	#StoreLoad | #LoadStore | #StoreStore 
	.word 0x8a440011  ! 855: ADDC_R	addc 	%r16, %r17, %r5
	.word 0xba9c2291  ! 857: XORcc_I	xorcc 	%r16, 0x0291, %r29
	.word 0x912c1011  ! 857: SLLX_R	sllx	%r16, %r17, %r8
	.word 0x90f40011  ! 857: UDIVcc_R	udivcc 	%r16, %r17, %r8
thr3_irf_ce_50:
!$EV error(3,expr(@VA(.MAIN.thr3_irf_ce_50), 16, 16),1,IRF,ce,51,x, x,x,x, x,x,x)
	.word 0xc43424eb  ! 860: STH_I	sth	%r2, [%r16 + 0x04eb]
	.word 0xb89c0011  ! 862: XORcc_R	xorcc 	%r16, %r17, %r28
	.word 0x9f508000  ! 862: RDPR_TSTATE	rdpr	%tstate, %r15
	.word 0xee242a8b  ! 864: STW_I	stw	%r23, [%r16 + 0x0a8b]
	.word 0x88942b86  ! 866: ORcc_I	orcc 	%r16, 0x0b86, %r4
	.word 0x8c440011  ! 866: ADDC_R	addc 	%r16, %r17, %r6
	.word 0xd73c2dda  ! 866: STDF_I	std	%f11, [0x0dda, %r16]
	.word 0xab7c0411  ! 867: MOVR_R	move	%r16, %r17, %r21
	.word 0x9014290f  ! 869: OR_I	or 	%r16, 0x090f, %r8
	.word 0xaa340011  ! 869: ORN_R	orn 	%r16, %r17, %r21
	.word 0x95341011  ! 869: SRLX_R	srlx	%r16, %r17, %r10
	ta	T_CHANGE_HPRIV	! macro
	.word 0x9f3c2001  ! 870: SRA_I	sra 	%r16, 0x0001, %r15
	.word 0xae142951  ! 872: OR_I	or 	%r16, 0x0951, %r23
	.word 0x909426cf  ! 872: ORcc_I	orcc 	%r16, 0x06cf, %r8
	.word 0xc36c21d3  ! 872: PREFETCH_I	prefetch	[%r16 + 0x01d3], #one_read
	.word 0xf4342715  ! 874: STH_I	sth	%r26, [%r16 + 0x0715]
	.word 0x868423a0  ! 876: ADDcc_I	addcc 	%r16, 0x03a0, %r3
	.word 0x928c26d3  ! 876: ANDcc_I	andcc 	%r16, 0x06d3, %r9
	.word 0xad2c2001  ! 876: SLL_I	sll 	%r16, 0x0001, %r22
	.word 0x904c0011  ! 876: MULX_R	mulx 	%r16, %r17, %r8
thr3_irf_ce_51:
!$EV error(3,expr(@VA(.MAIN.thr3_irf_ce_51), 16, 16),1,IRF,ce,34,x, x,x,x, x,x,x)
	.word 0xc42c2d43  ! 879: STB_I	stb	%r2, [%r16 + 0x0d43]
	.word 0xb82c2d9f  ! 881: ANDN_I	andn 	%r16, 0x0d9f, %r28
	.word 0xb654245a  ! 881: UMUL_I	umul 	%r16, 0x045a, %r27
	.word 0x82142c54  ! 882: OR_I	or 	%r16, 0x0c54, %r1
	.word 0x883c2d2e  ! 884: XNOR_I	xnor 	%r16, 0x0d2e, %r4
	.word 0x842c0011  ! 884: ANDN_R	andn 	%r16, %r17, %r2
	.word 0x82940011  ! 884: ORcc_R	orcc 	%r16, %r17, %r1
	.word 0x98740011  ! 884: UDIV_R	udiv 	%r16, %r17, %r12
	.word 0xce2c2a59  ! 886: STB_I	stb	%r7, [%r16 + 0x0a59]
	.word 0xb09c0011  ! 888: XORcc_R	xorcc 	%r16, %r17, %r24
	.word 0x868c2e13  ! 888: ANDcc_I	andcc 	%r16, 0x0e13, %r3
	.word 0x30800003  ! 888: BA	ba,a	<label_0x3>
thr3_irf_ce_52:
!$EV error(3,expr(@VA(.MAIN.thr3_irf_ce_52), 16, 16),1,IRF,ce,55,x, x,x,x, x,x,x)
	.word 0xf4342149  ! 891: STH_I	sth	%r26, [%r16 + 0x0149]
	.word 0x981c0011  ! 893: XOR_R	xor 	%r16, %r17, %r12
	.word 0xbc2c24fe  ! 893: ANDN_I	andn 	%r16, 0x04fe, %r30
	.word 0xed240011  ! 893: STF_R	st	%f22, [%r17, %r16]
	.word 0x862c0011  ! 894: ANDN_R	andn 	%r16, %r17, %r3
	.word 0xad480000  ! 896: RDHPR_HPSTATE	rdhpr	%hpstate, %r22
	.word 0xf0240011  ! 897: STW_R	stw	%r24, [%r16 + %r17]
	.word 0x0e800001  ! 899: BVS	bvs  	<label_0x1>
	.word 0xd2242761  ! 901: STW_I	stw	%r9, [%r16 + 0x0761]
	.word 0x843c0011  ! 903: XNOR_R	xnor 	%r16, %r17, %r2
	.word 0x82ac0011  ! 903: ANDNcc_R	andncc 	%r16, %r17, %r1
	.word 0xa83c2e0f  ! 903: XNOR_I	xnor 	%r16, 0x0e0f, %r20
	.word 0x8d840011  ! 903: WRFPRS_R	wr	%r16, %r17, %fprs
thr3_irf_ce_53:
!$EV error(3,expr(@VA(.MAIN.thr3_irf_ce_53), 16, 16),1,IRF,ce,13,x, x,x,x, x,x,x)
	.word 0xd234205d  ! 906: STH_I	sth	%r9, [%r16 + 0x005d]
	.word 0x9d2c1011  ! 908: SLLX_R	sllx	%r16, %r17, %r14
	.word 0x95343001  ! 908: SRLX_I	srlx	%r16, 0x0001, %r10
	.word 0x81880000  ! 908: SAVED	saved
thr3_irf_ce_54:
!$EV error(3,expr(@VA(.MAIN.thr3_irf_ce_54), 16, 16),1,IRF,ce,54,x, x,x,x, x,x,x)
	.word 0xce2c2861  ! 911: STB_I	stb	%r7, [%r16 + 0x0861]
	.word 0x9a942959  ! 913: ORcc_I	orcc 	%r16, 0x0959, %r13
	.word 0x8e9c0011  ! 913: XORcc_R	xorcc 	%r16, %r17, %r7
	.word 0xc3ec2b57  ! 913: PREFETCHA_I	prefetcha	[%r16, + 0x0b57] %asi, #one_read
	.word 0xde740011  ! 914: STX_R	stx	%r15, [%r16 + %r17]
	.word 0xb8b40011  ! 916: ORNcc_R	orncc 	%r16, %r17, %r28
	.word 0xe93c2d74  ! 916: STDF_I	std	%f20, [0x0d74, %r16]
thr3_irf_ce_55:
!$EV error(3,expr(@VA(.MAIN.thr3_irf_ce_55), 16, 16),1,IRF,ce,43,x, x,x,x, x,x,x)
	.word 0xfe24263b  ! 919: STW_I	stw	%r31, [%r16 + 0x063b]
	.word 0x842c2446  ! 921: ANDN_I	andn 	%r16, 0x0446, %r2
	.word 0xccd41011  ! 921: LDSHA_R	ldsha	[%r16, %r17] 0x80, %r6
	.word 0xf6242ce1  ! 923: STW_I	stw	%r27, [%r16 + 0x0ce1]
	.word 0x81880000  ! 925: RESTORED	saved
	.word 0xd8340011  ! 926: STH_R	sth	%r12, [%r16 + %r17]
	.word 0x932c3001  ! 928: SLLX_I	sllx	%r16, 0x0001, %r9
	.word 0xa8b42a15  ! 928: ORNcc_I	orncc 	%r16, 0x0a15, %r20
	.word 0xc36c0011  ! 928: PREFETCH_R	prefetch	[%r16 + %r17], #one_read
	.word 0xee240011  ! 929: STW_R	stw	%r23, [%r16 + %r17]
	.word 0x920427c5  ! 931: ADD_I	add 	%r16, 0x07c5, %r9
	.word 0x85343001  ! 931: SRLX_I	srlx	%r16, 0x0001, %r2
	.word 0x960c0011  ! 931: AND_R	and 	%r16, %r17, %r11
	.word 0x81dc2b8c  ! 931: FLUSH_I	dis not found

	.word 0xde342e9b  ! 933: STH_I	sth	%r15, [%r16 + 0x0e9b]
        wr %g0, 0x4, %fprs
	.word 0xde242949  ! 937: STW_I	stw	%r15, [%r16 + 0x0949]
	.word 0x8d643801  ! 939: MOVcc_I	<illegal instruction>
	.word 0x99340011  ! 939: SRL_R	srl 	%r16, %r17, %r12
	.word 0xbfe40011  ! 939: SAVE_R	save	%r16, %r17, %r31
	.word 0xca3429ff  ! 941: STH_I	sth	%r5, [%r16 + 0x09ff]
	.word 0x8e1c0011  ! 943: XOR_R	xor 	%r16, %r17, %r7
	.word 0xff240011  ! 943: STF_R	st	%f31, [%r17, %r16]
	.word 0xd8340011  ! 944: STH_R	sth	%r12, [%r16 + %r17]
	.word 0xba2c247e  ! 946: ANDN_I	andn 	%r16, 0x047e, %r29
	.word 0xbe8c0011  ! 946: ANDcc_R	andcc 	%r16, %r17, %r31
	.word 0x08800001  ! 946: BLEU	bleu  	<label_0x1>
	.word 0xf6340011  ! 947: STH_R	sth	%r27, [%r16 + %r17]
	.word 0x873c2001  ! 949: SRA_I	sra 	%r16, 0x0001, %r3
	.word 0xb6040011  ! 949: ADD_R	add 	%r16, %r17, %r27
	.word 0xc3ec2242  ! 949: PREFETCHA_I	prefetcha	[%r16, + 0x0242] %asi, #one_read
	.word 0x83641811  ! 950: MOVcc_R	<illegal instruction>
	.word 0x86c40011  ! 952: ADDCcc_R	addccc 	%r16, %r17, %r3
	.word 0x897c2401  ! 952: MOVR_I	move	%r16, 0xfffffff8, %r4
	.word 0x8d414000  ! 952: RDPC	rd	%pc, %r6
	.word 0xe4242891  ! 954: STW_I	stw	%r18, [%r16 + 0x0891]
	.word 0x86442d01  ! 956: ADDC_I	addc 	%r16, 0x0d01, %r3
	.word 0xbb3c0011  ! 956: SRA_R	sra 	%r16, %r17, %r29
thr3_resum_intr_19:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_19), 16, 16)) -> intp(3, 3, 1)
	wr      %r0, 0x5, %asr26
	.word 0xc4740011  ! 957: STX_R	stx	%r2, [%r16 + %r17]
	.word 0xbb3c2001  ! 959: SRA_I	sra 	%r16, 0x0001, %r29
	.word 0x82040011  ! 959: ADD_R	add 	%r16, %r17, %r1
	.word 0xd5240011  ! 959: STF_R	st	%f10, [%r17, %r16]
	.word 0x829c0011  ! 960: XORcc_R	xorcc 	%r16, %r17, %r1
	.word 0xb8040011  ! 962: ADD_R	add 	%r16, %r17, %r28
	.word 0x9f343001  ! 962: SRLX_I	srlx	%r16, 0x0001, %r15
	.word 0x973c1011  ! 962: SRAX_R	srax	%r16, %r17, %r11
        wr %g0, 0x4, %fprs
	.word 0xc2242791  ! 964: STW_I	stw	%r1, [%r16 + 0x0791]
	.word 0x889c0011  ! 966: XORcc_R	xorcc 	%r16, %r17, %r4
	.word 0xaf500000  ! 966: RDPR_TPC	rdpr	%tpc, %r23
	.word 0xd62c2123  ! 968: STB_I	stb	%r11, [%r16 + 0x0123]
	.word 0xba340011  ! 970: ORN_R	orn 	%r16, %r17, %r29
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xcc242ba7  ! 972: STW_I	stw	%r6, [%r16 + 0x0ba7]
	.word 0x96840011  ! 974: ADDcc_R	addcc 	%r16, %r17, %r11
	.word 0x95343001  ! 974: SRLX_I	srlx	%r16, 0x0001, %r10
        wr %g0, 0x4, %fprs
thr3_irf_ce_56:
!$EV error(3,expr(@VA(.MAIN.thr3_irf_ce_56), 16, 16),1,IRF,ce,15,x, x,x,x, x,x,x)
	.word 0xce3427b5  ! 977: STH_I	sth	%r7, [%r16 + 0x07b5]
	.word 0x8f343001  ! 979: SRLX_I	srlx	%r16, 0x0001, %r7
	.word 0x96142875  ! 979: OR_I	or 	%r16, 0x0875, %r11
	.word 0x848c2c1e  ! 979: ANDcc_I	andcc 	%r16, 0x0c1e, %r2
	.word 0x02cc0003  ! 979: BRZ	brz  ,pt	%16,<label_0xc0003>
thr3_irf_ce_57:
!$EV error(3,expr(@VA(.MAIN.thr3_irf_ce_57), 16, 16),1,IRF,ce,54,x, x,x,x, x,x,x)
	.word 0xe6242d43  ! 982: STW_I	stw	%r19, [%r16 + 0x0d43]
	.word 0x8b343001  ! 984: SRLX_I	srlx	%r16, 0x0001, %r5
	.word 0xaa3c21ae  ! 984: XNOR_I	xnor 	%r16, 0x01ae, %r21
	.word 0xa42c2d8b  ! 984: ANDN_I	andn 	%r16, 0x0d8b, %r18
	.word 0x81dc2698  ! 984: FLUSH_I	dis not found

	.word 0xf0740011  ! 985: STX_R	stx	%r24, [%r16 + %r17]
	.word 0x94842ddc  ! 987: ADDcc_I	addcc 	%r16, 0x0ddc, %r10
        wr %g0, 0x4, %fprs
	.word 0xd82c0011  ! 988: STB_R	stb	%r12, [%r16 + %r17]
	.word 0x9a340011  ! 990: ORN_R	orn 	%r16, %r17, %r13
	.word 0xc8a41011  ! 990: STWA_R	stwa	%r4, [%r16 + %r17] 0x80
	.word 0xfe340011  ! 991: STH_R	sth	%r31, [%r16 + %r17]
	.word 0xf4140011  ! 993: LDUH_R	lduh	[%r16 + %r17], %r26
	.word 0x9d3c0011  ! 994: SRA_R	sra 	%r16, %r17, %r14
	.word 0x89341011  ! 996: SRLX_R	srlx	%r16, %r17, %r4
	.word 0x9b342001  ! 996: SRL_I	srl 	%r16, 0x0001, %r13
	.word 0x997c0411  ! 996: MOVR_R	move	%r16, %r17, %r12
	.word 0x95a409d1  ! 996: FDIVd	fdivd	%f16, %f48, %f10
thr3_irf_ce_58:
!$EV error(3,expr(@VA(.MAIN.thr3_irf_ce_58), 16, 16),1,IRF,ce,58,x, x,x,x, x,x,x)
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
        setx  0x00000000000007b0, %g1, %r17
        setx  0xcfd080014e14ba49, %g1, %r0
        setx  0x1fab7d1b30354ec9, %g1, %r1
        setx  0x76ed771a1eaf7882, %g1, %r2
        setx  0xd80e425194b7d2bd, %g1, %r3
        setx  0x17e0ca0da09c14c1, %g1, %r4
        setx  0x0c274292674f0af1, %g1, %r5
        setx  0xfef069fd5f804e6b, %g1, %r6
        setx  0xdd73649c167374c7, %g1, %r7
        setx  0xaf080d6a6023d735, %g1, %r8
        setx  0x605449fa955ca17b, %g1, %r9
        setx  0xaaa7629e6e825543, %g1, %r10
        setx  0x24127b9e1031aa49, %g1, %r11
        setx  0xa4b0c0fa190f193e, %g1, %r12
        setx  0x30d16f5defe01e20, %g1, %r13
        setx  0xa2aadb1ee3290fbd, %g1, %r14
        setx  0xb5a62d877124a7c0, %g1, %r15
        setx  0xbe3bb84e04712df5, %g1, %r18
        setx  0x8eadaad05d10a409, %g1, %r19
        setx  0x55ad03a92296ccce, %g1, %r20
        setx  0x598e1c0ae38f09d6, %g1, %r21
        setx  0x1f66e1245dca7fe6, %g1, %r22
        setx  0xa5d914896d4d8600, %g1, %r23
        setx  0xed8bbe34a45ba4d5, %g1, %r24
        setx  0x0683f1d746abffc9, %g1, %r25
        setx  0x295b704ff8c64d28, %g1, %r26
        setx  0x76e6eb3545b402f8, %g1, %r27
        setx  0x89cb4f553a5b5023, %g1, %r28
        setx  0xe4bc7660b002b9fa, %g1, %r29
        setx  0x34b47ba06f22a102, %g1, %r30
        setx  0x99894efaa7432c0a, %g1, %r31
	save %r0, %r0, %r31
        setx  MAIN_BASE_DATA_VA, %r1, %r16
        setx  0x0000000000000570, %g1, %r17
        setx  0xc864462a2ac58ddf, %g1, %r0
        setx  0x88ec3c024221090b, %g1, %r1
        setx  0x6186645c6332e667, %g1, %r2
        setx  0x992449980a6d61e3, %g1, %r3
        setx  0x465ff21e8f6894be, %g1, %r4
        setx  0xc1aecc756c84580c, %g1, %r5
        setx  0x816a7b062e72db0c, %g1, %r6
        setx  0xfa8535b66b95b171, %g1, %r7
        setx  0xfc890c2f2dbd506a, %g1, %r8
        setx  0x838c55772a3a7502, %g1, %r9
        setx  0x37f7bdbee30a2511, %g1, %r10
        setx  0x747e333b31a26ce9, %g1, %r11
        setx  0x4edf6bbb55a34841, %g1, %r12
        setx  0x6fc73dcdc7f256b1, %g1, %r13
        setx  0xb40283b5a97a5082, %g1, %r14
        setx  0x5ec23d81435968c9, %g1, %r15
        setx  0x5d84f5213dd7879c, %g1, %r18
        setx  0xcef101ef5e1c2c2a, %g1, %r19
        setx  0x278fa048521c22c3, %g1, %r20
        setx  0xf73909289997a252, %g1, %r21
        setx  0xa6490ea5d9f17a0f, %g1, %r22
        setx  0x68e5f440ac73e26e, %g1, %r23
        setx  0xfc943d0447cc1d03, %g1, %r24
        setx  0x11a8e939a1e5f5ad, %g1, %r25
        setx  0x3553753782ee5b97, %g1, %r26
        setx  0x08d37bdf227ed63b, %g1, %r27
        setx  0x71e18be4c143f3f2, %g1, %r28
        setx  0xbfd2919890f1d260, %g1, %r29
        setx  0x92d698886d21bbcc, %g1, %r30
        setx  0x4dd74b6e2136c121, %g1, %r31
	save %r0, %r0, %r31
        setx  MAIN_BASE_DATA_VA, %r1, %r16
        setx  0x0000000000000ee0, %g1, %r17
        setx  0x13e14087f850516e, %g1, %r0
        setx  0xe2ff50b9958f910a, %g1, %r1
        setx  0xf627e728f010ccbb, %g1, %r2
        setx  0xb985cef2cbb01419, %g1, %r3
        setx  0x212522069863ed82, %g1, %r4
        setx  0x5b733f3859d37e00, %g1, %r5
        setx  0x5d5cd7a327ef7840, %g1, %r6
        setx  0x60a4713c7660551b, %g1, %r7
        setx  0xe58eb04e0a77bb54, %g1, %r8
        setx  0x7c103fdd01c5422e, %g1, %r9
        setx  0xedb9c4a96fee6d12, %g1, %r10
        setx  0xc7d8e0c181f861e1, %g1, %r11
        setx  0xb0e9cfeb008bdc9d, %g1, %r12
        setx  0xfc6bd2588265b77b, %g1, %r13
        setx  0x7490c305a54bdea8, %g1, %r14
        setx  0x7771f4a9969a1747, %g1, %r15
        setx  0x97ca10c8c9d07a82, %g1, %r18
        setx  0x14086a4c7c324c04, %g1, %r19
        setx  0x5d3f2e4ebfc2fe29, %g1, %r20
        setx  0x18cb3ffe0502b5b1, %g1, %r21
        setx  0x2961987843f4e5e4, %g1, %r22
        setx  0x3920e54efa0ce6c3, %g1, %r23
        setx  0x0d7558e315284209, %g1, %r24
        setx  0x7005d78dc58196fb, %g1, %r25
        setx  0x7aba35c50e0748c2, %g1, %r26
        setx  0x57049fec779d00ad, %g1, %r27
        setx  0x85a58e50219b1dcf, %g1, %r28
        setx  0x263340afaab5cfa2, %g1, %r29
        setx  0xde62263f76c713df, %g1, %r30
        setx  0x0423c3438de0a09a, %g1, %r31
	save %r0, %r0, %r31
        setx  MAIN_BASE_DATA_VA, %r1, %r16
        setx  0x0000000000000d40, %g1, %r17
        setx  0x0cec228fc4c9fa54, %g1, %r0
        setx  0x3871cfaf7531c111, %g1, %r1
        setx  0x265b0e3190fb398a, %g1, %r2
        setx  0xce6326bc01f57b57, %g1, %r3
        setx  0xa46718217db1ad04, %g1, %r4
        setx  0x0265e8d1a763b145, %g1, %r5
        setx  0xd7bb72d0c76ca04d, %g1, %r6
        setx  0x1cf6994489d05b61, %g1, %r7
        setx  0x317af1791b834e06, %g1, %r8
        setx  0x559f46578f7bea12, %g1, %r9
        setx  0x8d4ec07741fe89b2, %g1, %r10
        setx  0x1454faf3e33ed6c0, %g1, %r11
        setx  0xd3e31995671c7af3, %g1, %r12
        setx  0x57189d1bf7be2e4f, %g1, %r13
        setx  0xfd597f2d1ea6fe9f, %g1, %r14
        setx  0xe63a1d16cb891e85, %g1, %r15
        setx  0x6949482fe0374722, %g1, %r18
        setx  0xc20d679a143d3bd1, %g1, %r19
        setx  0x79ecddc074f2393b, %g1, %r20
        setx  0xd77e300ecfd26079, %g1, %r21
        setx  0x2e9f19a7b0a58cba, %g1, %r22
        setx  0x5a5f8aac22b48ccb, %g1, %r23
        setx  0x70559a8bb552fba9, %g1, %r24
        setx  0xf515398ee55eb431, %g1, %r25
        setx  0x2a1287e0444d4cfc, %g1, %r26
        setx  0xf56cdd86e15310ba, %g1, %r27
        setx  0x10c8ce68361b285b, %g1, %r28
        setx  0x50182bd529ef1fff, %g1, %r29
        setx  0xedc7d747ccf40838, %g1, %r30
        setx  0xbe775427fea171ef, %g1, %r31
	save %r0, %r0, %r31
        setx  MAIN_BASE_DATA_VA, %r1, %r16
        setx  0x0000000000000fe0, %g1, %r17
        setx  0x5e2cd40711da07b4, %g1, %r0
        setx  0x819590fbbb4443ad, %g1, %r1
        setx  0x63da04d2104ddb00, %g1, %r2
        setx  0x3f80271129c17fb5, %g1, %r3
        setx  0x7211c34db02079ef, %g1, %r4
        setx  0xd7e9216f726e9a87, %g1, %r5
        setx  0x8c7bc929187b1a4f, %g1, %r6
        setx  0x0544a7c955a187ac, %g1, %r7
        setx  0xe5e0fe5c50a81ace, %g1, %r8
        setx  0x317d4c659920cd21, %g1, %r9
        setx  0x406796b6c042bbf3, %g1, %r10
        setx  0xa95b2761ee320448, %g1, %r11
        setx  0xa5d8ecc81ae5e66a, %g1, %r12
        setx  0x56bd70916c1131aa, %g1, %r13
        setx  0x47a2e20949e84fe1, %g1, %r14
        setx  0xefdc9bac257f1a11, %g1, %r15
        setx  0x1822b1a1c216d892, %g1, %r18
        setx  0xc36ef929a0ae3e00, %g1, %r19
        setx  0x463d6065f972d0a6, %g1, %r20
        setx  0xfc34a559740b1426, %g1, %r21
        setx  0x9874676a4c258534, %g1, %r22
        setx  0x54665d8fd66334f6, %g1, %r23
        setx  0x235775451cfe3038, %g1, %r24
        setx  0x222bfb48504cbf03, %g1, %r25
        setx  0x7cbf436ee5cb171f, %g1, %r26
        setx  0x365cbd635d94b8e2, %g1, %r27
        setx  0x9e4f234a6c3ff6a2, %g1, %r28
        setx  0x59fffe9da08d0433, %g1, %r29
        setx  0xf1591edd399eb427, %g1, %r30
        setx  0xa35561ea4e10e9c6, %g1, %r31
	save %r0, %r0, %r31
        setx  MAIN_BASE_DATA_VA, %r1, %r16
        setx  0x0000000000000640, %g1, %r17
        setx  0xa5a3577f94824b9e, %g1, %r0
        setx  0x2f68ff80e07bedca, %g1, %r1
        setx  0xe4211add0d97c8f7, %g1, %r2
        setx  0xb6da414263ce0969, %g1, %r3
        setx  0x5b1475fc11547a92, %g1, %r4
        setx  0xc81d8865fbaf5325, %g1, %r5
        setx  0x459580d99f2a4950, %g1, %r6
        setx  0xb710f6311d7d6517, %g1, %r7
        setx  0xb31b14c044c3cfd3, %g1, %r8
        setx  0x56cd7bcd72dda8c9, %g1, %r9
        setx  0x32bab5345fd139d8, %g1, %r10
        setx  0xdd987b57c6dd7038, %g1, %r11
        setx  0xec40f3d0d69d1626, %g1, %r12
        setx  0xe0f517d0f16bd1ea, %g1, %r13
        setx  0x5aef5b0dceea1ec6, %g1, %r14
        setx  0x7c8a05b2d6776773, %g1, %r15
        setx  0x1ade2f9fa4d2e9c6, %g1, %r18
        setx  0x203d1015a2ff2795, %g1, %r19
        setx  0xb91806251e2e2d1a, %g1, %r20
        setx  0xe56c2a130344f28a, %g1, %r21
        setx  0xad9fd72e403524b3, %g1, %r22
        setx  0x8567715fd36a8fcb, %g1, %r23
        setx  0xf66bd8bf54f17540, %g1, %r24
        setx  0x5b125d42ef54f6e3, %g1, %r25
        setx  0x12dc06455329d0cb, %g1, %r26
        setx  0xfc703ec4ff53287d, %g1, %r27
        setx  0xd38f44811c570a7c, %g1, %r28
        setx  0x381c55c192a09b02, %g1, %r29
        setx  0xf933ee877da62d40, %g1, %r30
        setx  0xd8589b4e33ff2464, %g1, %r31
	save %r0, %r0, %r31
        setx  MAIN_BASE_DATA_VA, %r1, %r16
        setx  0x0000000000000370, %g1, %r17
        setx  0x3b633e74c3ec356e, %g1, %r0
        setx  0xa7b314919e075148, %g1, %r1
        setx  0x77d446496199afb7, %g1, %r2
        setx  0xaf102e061cf4e281, %g1, %r3
        setx  0x047489c52af5b0e6, %g1, %r4
        setx  0x6c337443e95a2900, %g1, %r5
        setx  0xeb19348a608d6df6, %g1, %r6
        setx  0x3fc17a72be417d2e, %g1, %r7
        setx  0x3afc995a740ba8c2, %g1, %r8
        setx  0xae68b4ae56369a68, %g1, %r9
        setx  0x7bb67d13460581f0, %g1, %r10
        setx  0x2a5a43fd4fa0ae24, %g1, %r11
        setx  0x24fa438cd45b2ae0, %g1, %r12
        setx  0x164e03e285e85bda, %g1, %r13
        setx  0xc7f1ce58a39f0d18, %g1, %r14
        setx  0x7de4dea66e7888db, %g1, %r15
        setx  0x9c67ec4d982ef994, %g1, %r18
        setx  0xf30ca54e94f8546f, %g1, %r19
        setx  0x7a592235e3d0e762, %g1, %r20
        setx  0x4a9e99d46fbc4a41, %g1, %r21
        setx  0x7f35704c8fa17331, %g1, %r22
        setx  0xf656c247aadd6137, %g1, %r23
        setx  0xa46d1734293de56b, %g1, %r24
        setx  0xa6f1a6cded12f598, %g1, %r25
        setx  0xf73aa40d6d66d00c, %g1, %r26
        setx  0x20c25ec8868b2da9, %g1, %r27
        setx  0x4585d0e74c66d38b, %g1, %r28
        setx  0xd3f58bfd8c9c13d5, %g1, %r29
        setx  0xa229a9f3058eb8ab, %g1, %r30
        setx  0x27de466502d707a3, %g1, %r31
	save %r0, %r0, %r31
        setx  MAIN_BASE_DATA_VA, %r1, %r16
        setx  0x0000000000000390, %g1, %r17
        setx  0xf0e48d022de976ac, %g1, %r0
        setx  0xff658308ff7f8ebe, %g1, %r1
        setx  0x4030abd0f7082d02, %g1, %r2
        setx  0xbb74e7a60c65d7c3, %g1, %r3
        setx  0x6f29b46657c16560, %g1, %r4
        setx  0x999be452bd11c9e4, %g1, %r5
        setx  0xc050d9c2d19fef00, %g1, %r6
        setx  0x8644234e46a30e37, %g1, %r7
        setx  0x979a769f61294e95, %g1, %r8
        setx  0xf65e99e20585f0f3, %g1, %r9
        setx  0x306e96c50576affe, %g1, %r10
        setx  0xc592fd95cc1b68ec, %g1, %r11
        setx  0x82f6cfc262cd951b, %g1, %r12
        setx  0xefe1a23bd3a797e0, %g1, %r13
        setx  0x41ffeb0c7c8760b7, %g1, %r14
        setx  0xccc6da7dd7cadc6f, %g1, %r15
        setx  0x8c0cd873cb032271, %g1, %r18
        setx  0x9e5725617398e809, %g1, %r19
        setx  0x7dd5e158bf3d974c, %g1, %r20
        setx  0xa7d057f06553716d, %g1, %r21
        setx  0xedeb6279c3dda359, %g1, %r22
        setx  0x221f1bc59b3beb6a, %g1, %r23
        setx  0x1e74a1668f0b96c4, %g1, %r24
        setx  0x1429f16c75ccc4f2, %g1, %r25
        setx  0xea43d0d7a517daec, %g1, %r26
        setx  0xc1b9ae74874fe1ec, %g1, %r27
        setx  0xab9d327a4e4933c7, %g1, %r28
        setx  0xaa6ad1a2ee91e4d1, %g1, %r29
        setx  0x437b94f85f2703f7, %g1, %r30
        setx  0xf314419ac70389f8, %g1, %r31
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
	.word 0x8eb42a6c  ! 0: ORNcc_I	orncc 	%r16, 0x0a6c, %r7
	.word 0x86040011  ! 2: ADD_R	add 	%r16, %r17, %r3
	.word 0x9e840011  ! 2: ADDcc_R	addcc 	%r16, %r17, %r15
	.word 0xc84c2d58  ! 2: LDSB_I	ldsb	[%r16 + 0x0d58], %r4
	.word 0xd4240011  ! 3: STW_R	stw	%r10, [%r16 + %r17]
	.word 0x9c4423bf  ! 5: ADDC_I	addc 	%r16, 0x03bf, %r14
	.word 0x9951c000  ! 5: RDPR_TL	rdpr	%tl, %r12
	.word 0xca74230f  ! 7: STX_I	stx	%r5, [%r16 + 0x030f]
	.word 0x8a042a54  ! 9: ADD_I	add 	%r16, 0x0a54, %r5
	.word 0x8e9c0011  ! 9: XORcc_R	xorcc 	%r16, %r17, %r7
	.word 0x853c1011  ! 9: SRAX_R	srax	%r16, %r17, %r2
	.word 0xc36c2294  ! 9: PREFETCH_I	prefetch	[%r16 + 0x0294], #one_read
	.word 0x94140011  ! 10: OR_R	or 	%r16, %r17, %r10
	.word 0xb21c2634  ! 12: XOR_I	xor 	%r16, 0x0634, %r25
	.word 0x94942ce3  ! 12: ORcc_I	orcc 	%r16, 0x0ce3, %r10
	.word 0x88ac0011  ! 12: ANDNcc_R	andncc 	%r16, %r17, %r4
	.word 0xc36c2513  ! 12: PREFETCH_I	prefetch	[%r16 + 0x0513], #one_read
	.word 0xea2c2f87  ! 14: STB_I	stb	%r21, [%r16 + 0x0f87]
	.word 0xda9c1011  ! 16: LDDA_R	ldda	[%r16, %r17] 0x80, %r13
	.word 0xe6340011  ! 17: STH_R	sth	%r19, [%r16 + %r17]
	.word 0x9dabc831  ! 19: FMOVVC	fmovs	%fcc1, %f17, %f14
	.word 0xb6a42344  ! 20: SUBcc_I	subcc 	%r16, 0x0344, %r27
	.word 0x92ac0011  ! 22: ANDNcc_R	andncc 	%r16, %r17, %r9
	.word 0xb4840011  ! 22: ADDcc_R	addcc 	%r16, %r17, %r26
	.word 0x9a3c0011  ! 22: XNOR_R	xnor 	%r16, %r17, %r13
	.word 0x8f514000  ! 22: RDPR_TBA	rdpr	%tba, %r7
	.word 0xd22c25af  ! 24: STB_I	stb	%r9, [%r16 + 0x05af]
	.word 0x9abc0011  ! 26: XNORcc_R	xnorcc 	%r16, %r17, %r13
	.word 0x91641811  ! 26: MOVcc_R	<illegal instruction>
	.word 0x8cbc2317  ! 26: XNORcc_I	xnorcc 	%r16, 0x0317, %r6
	.word 0xfaa423fb  ! 26: STWA_I	stwa	%r29, [%r16 + 0x03fb] %asi
	.word 0x9eb40011  ! 27: ORNcc_R	orncc 	%r16, %r17, %r15
	.word 0x912c1011  ! 29: SLLX_R	sllx	%r16, %r17, %r8
thr2_resum_intr_0:
!$EV trig_pc_d(2,expr(@VA(.MAIN.thr2_resum_intr_0), 16, 16)) -> intp(2, 3, 1)
	wr      %r0, 0x5, %asr26
	.word 0xf6240011  ! 30: STW_R	stw	%r27, [%r16 + %r17]
	.word 0x8d2c0011  ! 32: SLL_R	sll 	%r16, %r17, %r6
	.word 0xac040011  ! 32: ADD_R	add 	%r16, %r17, %r22
	.word 0x969c0011  ! 32: XORcc_R	xorcc 	%r16, %r17, %r11
	.word 0x8143c000  ! 32: STBAR	stbar
thr2_irf_ce_0:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_0), 16, 16),1,IRF,ce,68,x, x,x,x, x,x,x)
	.word 0xde742411  ! 35: STX_I	stx	%r15, [%r16 + 0x0411]
	.word 0x943427ab  ! 37: ORN_I	orn 	%r16, 0x07ab, %r10
thr2_resum_intr_1:
!$EV trig_pc_d(2,expr(@VA(.MAIN.thr2_resum_intr_1), 16, 16)) -> intp(2, 3, 1)
	wr      %r0, 0x5, %asr26
	.word 0xa8942727  ! 38: ORcc_I	orcc 	%r16, 0x0727, %r20
	.word 0xb85c0011  ! 40: SMUL_R	smul 	%r16, %r17, %r28
	.word 0xcc240011  ! 41: STW_R	stw	%r6, [%r16 + %r17]
	.word 0xaf2c1011  ! 43: SLLX_R	sllx	%r16, %r17, %r23
	.word 0x8c3c0011  ! 43: XNOR_R	xnor 	%r16, %r17, %r6
	.word 0x8143c000  ! 43: STBAR	stbar
	.word 0xd4240011  ! 44: STW_R	stw	%r10, [%r16 + %r17]
	.word 0xb37c2401  ! 46: MOVR_I	move	%r16, 0xfffffff8, %r25
	.word 0xaa142994  ! 46: OR_I	or 	%r16, 0x0994, %r21
	.word 0x9a442c81  ! 46: ADDC_I	addc 	%r16, 0x0c81, %r13
	.word 0x87ac0a51  ! 46: FCMPd	fcmpd	%fcc<n>, %f16, %f48
	.word 0xf6240011  ! 47: STW_R	stw	%r27, [%r16 + %r17]
	.word 0x97641811  ! 49: MOVcc_R	<illegal instruction>
	.word 0xa4bc0011  ! 49: XNORcc_R	xnorcc 	%r16, %r17, %r18
        wr %g0, 0x4, %fprs
	.word 0xbe342b39  ! 50: ORN_I	orn 	%r16, 0x0b39, %r31
	.word 0x828c2e40  ! 52: ANDcc_I	andcc 	%r16, 0x0e40, %r1
	.word 0x853c2001  ! 52: SRA_I	sra 	%r16, 0x0001, %r2
	.word 0xd0442535  ! 52: LDSW_I	ldsw	[%r16 + 0x0535], %r8
	.word 0xde340011  ! 53: STH_R	sth	%r15, [%r16 + %r17]
	.word 0x8a04215e  ! 55: ADD_I	add 	%r16, 0x015e, %r5
	.word 0x8cb420a8  ! 55: ORNcc_I	orncc 	%r16, 0x00a8, %r6
	.word 0x1a800001  ! 55: BCC	bcc  	<label_0x1>
	.word 0xee242e93  ! 57: STW_I	stw	%r23, [%r16 + 0x0e93]
	.word 0x90ac2d57  ! 59: ANDNcc_I	andncc 	%r16, 0x0d57, %r8
	.word 0x8ac40011  ! 59: ADDCcc_R	addccc 	%r16, %r17, %r5
	.word 0xb00c2909  ! 59: AND_I	and 	%r16, 0x0909, %r24
	.word 0xd0d41011  ! 59: LDSHA_R	ldsha	[%r16, %r17] 0x80, %r8
	.word 0xcc3421c1  ! 61: STH_I	sth	%r6, [%r16 + 0x01c1]
	.word 0x85341011  ! 63: SRLX_R	srlx	%r16, %r17, %r2
	.word 0x91514000  ! 63: RDPR_TBA	<illegal instruction>
	.word 0xce740011  ! 64: STX_R	stx	%r7, [%r16 + %r17]
	.word 0x900c2f56  ! 66: AND_I	and 	%r16, 0x0f56, %r8
	.word 0xa4ac20f4  ! 66: ANDNcc_I	andncc 	%r16, 0x00f4, %r18
	.word 0x81580000  ! 66: FLUSHW	flushw
	.word 0x8f2c0011  ! 67: SLL_R	sll 	%r16, %r17, %r7
	.word 0xb32c0011  ! 69: SLL_R	sll 	%r16, %r17, %r25
	.word 0x8b342001  ! 69: SRL_I	srl 	%r16, 0x0001, %r5
	ta	T_CHANGE_PRIV	! macro
	.word 0xd4240011  ! 70: STW_R	stw	%r10, [%r16 + %r17]
	.word 0x10800003  ! 72: BA	ba  	<label_0x3>
	.word 0xf22c0011  ! 73: STB_R	stb	%r25, [%r16 + %r17]
	.word 0x888c0011  ! 75: ANDcc_R	andcc 	%r16, %r17, %r4
	.word 0x81dc239d  ! 75: FLUSH_I	dis not found

	.word 0x9cbc2d17  ! 76: XNORcc_I	xnorcc 	%r16, 0x0d17, %r14
	.word 0x9b3c2001  ! 78: SRA_I	sra 	%r16, 0x0001, %r13
	.word 0xc36c0011  ! 78: PREFETCH_R	prefetch	[%r16 + %r17], #one_read
thr2_irf_ce_1:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_1), 16, 16),1,IRF,ce,57,x, x,x,x, x,x,x)
	.word 0xfa242869  ! 81: STW_I	stw	%r29, [%r16 + 0x0869]
	.word 0x2e800001  ! 83: BVS	bvs,a	<label_0x1>
	.word 0x9214204f  ! 84: OR_I	or 	%r16, 0x004f, %r9
	.word 0x9c940011  ! 86: ORcc_R	orcc 	%r16, %r17, %r14
	.word 0xfeb41011  ! 86: STHA_R	stha	%r31, [%r16 + %r17] 0x80
	.word 0xc6740011  ! 87: STX_R	stx	%r3, [%r16 + %r17]
	.word 0xb43c2f2a  ! 89: XNOR_I	xnor 	%r16, 0x0f2a, %r26
	.word 0xecf41011  ! 89: STXA_R	stxa	%r22, [%r16 + %r17] 0x80
	.word 0x988c2a9e  ! 90: ANDcc_I	andcc 	%r16, 0x0a9e, %r12
	.word 0x8143c000  ! 92: STBAR	stbar
	.word 0xe6240011  ! 93: STW_R	stw	%r19, [%r16 + %r17]
	.word 0xb89429c2  ! 95: ORcc_I	orcc 	%r16, 0x09c2, %r28
	.word 0x86840011  ! 95: ADDcc_R	addcc 	%r16, %r17, %r3
	.word 0x99643801  ! 95: MOVcc_I	<illegal instruction>
	.word 0x81880000  ! 95: RESTORED	saved
	.word 0x8e140011  ! 96: OR_R	or 	%r16, %r17, %r7
	.word 0x9a5c227a  ! 98: SMUL_I	smul 	%r16, 0x027a, %r13
	.word 0xd634277f  ! 100: STH_I	sth	%r11, [%r16 + 0x077f]
	.word 0x832c3001  ! 102: SLLX_I	sllx	%r16, 0x0001, %r1
	.word 0xd01c262a  ! 102: LDD_I	ldd	[%r16 + 0x062a], %r8
	.word 0xc634257b  ! 104: STH_I	sth	%r3, [%r16 + 0x057b]
	.word 0xc3ec1011  ! 106: PREFETCHA_R	prefetcha	[%r16, %r17] 0x80, #one_read
thr2_irf_ce_2:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_2), 16, 16),1,IRF,ce,33,x, x,x,x, x,x,x)
	.word 0xc62c2b31  ! 109: STB_I	stb	%r3, [%r16 + 0x0b31]
	.word 0x9a8c2d10  ! 111: ANDcc_I	andcc 	%r16, 0x0d10, %r13
	.word 0x8a042927  ! 111: ADD_I	add 	%r16, 0x0927, %r5
	.word 0xc8942cbe  ! 111: LDUHA_I	lduha	[%r16, + 0x0cbe] %asi, %r4
	.word 0xca340011  ! 112: STH_R	sth	%r5, [%r16 + %r17]
	.word 0xb2342671  ! 114: ORN_I	orn 	%r16, 0x0671, %r25
	.word 0xbc0423ee  ! 114: ADD_I	add 	%r16, 0x03ee, %r30
	.word 0xc4cc254b  ! 114: LDSBA_I	ldsba	[%r16, + 0x054b] %asi, %r2
	.word 0xca240011  ! 115: STW_R	stw	%r5, [%r16 + %r17]
	.word 0x8143e06f  ! 117: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #StoreStore | #MemIssue | #Sync 
	.word 0xd0740011  ! 118: STX_R	stx	%r8, [%r16 + %r17]
	.word 0xb72c0011  ! 120: SLL_R	sll 	%r16, %r17, %r27
	.word 0xbbe40011  ! 120: SAVE_R	save	%r16, %r17, %r29
	.word 0xd4240011  ! 121: STW_R	stw	%r10, [%r16 + %r17]
	.word 0x94c40011  ! 123: ADDCcc_R	addccc 	%r16, %r17, %r10
	.word 0x8b3c1011  ! 123: SRAX_R	srax	%r16, %r17, %r5
        wr %g0, 0x4, %fprs
	.word 0xe62c27c5  ! 125: STB_I	stb	%r19, [%r16 + 0x07c5]
	.word 0x94342aa0  ! 127: ORN_I	orn 	%r16, 0x0aa0, %r10
	.word 0x8a3c0011  ! 127: XNOR_R	xnor 	%r16, %r17, %r5
	.word 0x81dc0011  ! 127: FLUSH_R	dis not found

thr2_irf_ce_3:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_3), 16, 16),1,IRF,ce,4,x, x,x,x, x,x,x)
	.word 0xcc242d6f  ! 130: STW_I	stw	%r6, [%r16 + 0x0d6f]
	.word 0xad341011  ! 132: SRLX_R	srlx	%r16, %r17, %r22
	.word 0xe4dc204b  ! 132: LDXA_I	ldxa	[%r16, + 0x004b] %asi, %r18
	.word 0xc82c0011  ! 133: STB_R	stb	%r4, [%r16 + %r17]
	.word 0xe8842386  ! 135: LDUWA_I	lduwa	[%r16, + 0x0386] %asi, %r20
thr2_irf_ce_4:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_4), 16, 16),1,IRF,ce,57,x, x,x,x, x,x,x)
	.word 0xc4742895  ! 138: STX_I	stx	%r2, [%r16 + 0x0895]
	.word 0x9cbc0011  ! 140: XNORcc_R	xnorcc 	%r16, %r17, %r14
	.word 0xa68c2f02  ! 140: ANDcc_I	andcc 	%r16, 0x0f02, %r19
	.word 0x9f3c0011  ! 140: SRA_R	sra 	%r16, %r17, %r15
	.word 0xa64c25cc  ! 140: MULX_I	mulx 	%r16, 0x05cc, %r19
	.word 0xdc740011  ! 141: STX_R	stx	%r14, [%r16 + %r17]
	.word 0x96ac25fb  ! 143: ANDNcc_I	andncc 	%r16, 0x05fb, %r11
	.word 0xbd3c1011  ! 143: SRAX_R	srax	%r16, %r17, %r30
	.word 0x8ba019b1  ! 143: FsTOq	dis not found

	.word 0xd82c0011  ! 144: STB_R	stb	%r12, [%r16 + %r17]
	.word 0x96bc21f7  ! 146: XNORcc_I	xnorcc 	%r16, 0x01f7, %r11
	.word 0xbc3c2309  ! 146: XNOR_I	xnor 	%r16, 0x0309, %r30
	.word 0x97340011  ! 146: SRL_R	srl 	%r16, %r17, %r11
	.word 0x40000001  ! 146: CALL	call	disp30_1
	.word 0xcc242527  ! 148: STW_I	stw	%r6, [%r16 + 0x0527]
	.word 0x8684224c  ! 150: ADDcc_I	addcc 	%r16, 0x024c, %r3
	.word 0xdef41011  ! 150: STXA_R	stxa	%r15, [%r16 + %r17] 0x80
	.word 0xfa240011  ! 151: STW_R	stw	%r29, [%r16 + %r17]
	.word 0xa4bc0011  ! 153: XNORcc_R	xnorcc 	%r16, %r17, %r18
	ta	T_CHANGE_PRIV	! macro
	.word 0xcc740011  ! 154: STX_R	stx	%r6, [%r16 + %r17]
	.word 0xaf3c1011  ! 156: SRAX_R	srax	%r16, %r17, %r23
	.word 0x832c1011  ! 156: SLLX_R	sllx	%r16, %r17, %r1
thr2_resum_intr_2:
!$EV trig_pc_d(2,expr(@VA(.MAIN.thr2_resum_intr_2), 16, 16)) -> intp(2, 3, 1)
	wr      %r0, 0x5, %asr26
	.word 0xd4742d01  ! 158: STX_I	stx	%r10, [%r16 + 0x0d01]
	.word 0x853c0011  ! 160: SRA_R	sra 	%r16, %r17, %r2
	.word 0x93340011  ! 160: SRL_R	srl 	%r16, %r17, %r9
	.word 0xf48c2b6d  ! 160: LDUBA_I	lduba	[%r16, + 0x0b6d] %asi, %r26
	.word 0xf42c0011  ! 161: STB_R	stb	%r26, [%r16 + %r17]
	.word 0xfc0c2993  ! 163: LDUB_I	ldub	[%r16 + 0x0993], %r30
	.word 0x892c3001  ! 164: SLLX_I	sllx	%r16, 0x0001, %r4
	.word 0x81dc20ef  ! 166: FLUSH_I	dis not found

	.word 0xcc342b61  ! 168: STH_I	sth	%r6, [%r16 + 0x0b61]
        wr %g0, 0x4, %fprs
	.word 0xcc3424cd  ! 172: STH_I	sth	%r6, [%r16 + 0x04cd]
	.word 0xff2421ed  ! 174: STF_I	st	%f31, [0x01ed, %r16]
	.word 0xdc2c0011  ! 175: STB_R	stb	%r14, [%r16 + %r17]
	.word 0xb93c2001  ! 177: SRA_I	sra 	%r16, 0x0001, %r28
	.word 0xb68c2b6a  ! 177: ANDcc_I	andcc 	%r16, 0x0b6a, %r27
        wr %g0, 0x4, %fprs
thr2_irf_ce_5:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_5), 16, 16),1,IRF,ce,41,x, x,x,x, x,x,x)
	.word 0xec2c2d63  ! 180: STB_I	stb	%r22, [%r16 + 0x0d63]
	.word 0xac340011  ! 182: ORN_R	orn 	%r16, %r17, %r22
	.word 0x81dc26fd  ! 182: FLUSH_I	dis not found

thr2_irf_ce_6:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_6), 16, 16),1,IRF,ce,1,x, x,x,x, x,x,x)
	.word 0xd22c24cb  ! 185: STB_I	stb	%r9, [%r16 + 0x04cb]
	.word 0x8143c000  ! 187: STBAR	stbar
	.word 0xd2242daf  ! 189: STW_I	stw	%r9, [%r16 + 0x0daf]
	.word 0x8a040011  ! 191: ADD_R	add 	%r16, %r17, %r5
	.word 0xb8bc24a5  ! 191: XNORcc_I	xnorcc 	%r16, 0x04a5, %r28
	.word 0x917c2401  ! 191: MOVR_I	move	%r16, 0xfffffff8, %r8
	.word 0x8143e030  ! 191: MEMBAR	membar	#Lookaside | #MemIssue 
	.word 0xf02c0011  ! 192: STB_R	stb	%r24, [%r16 + %r17]
	.word 0x893c1011  ! 194: SRAX_R	srax	%r16, %r17, %r4
	.word 0xaa1c0011  ! 194: XOR_R	xor 	%r16, %r17, %r21
	.word 0xa5342001  ! 194: SRL_I	srl 	%r16, 0x0001, %r18
thr2_resum_intr_3:
!$EV trig_pc_d(2,expr(@VA(.MAIN.thr2_resum_intr_3), 16, 16)) -> intp(2, 3, 1)
	wr      %r0, 0x5, %asr26
thr2_irf_ce_7:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_7), 16, 16),1,IRF,ce,4,x, x,x,x, x,x,x)
	.word 0xd63423b7  ! 197: STH_I	sth	%r11, [%r16 + 0x03b7]
	.word 0xb9341011  ! 199: SRLX_R	srlx	%r16, %r17, %r28
	.word 0x8e0c2cdb  ! 199: AND_I	and 	%r16, 0x0cdb, %r7
	.word 0x8e542d07  ! 199: UMUL_I	umul 	%r16, 0x0d07, %r7
	.word 0xbc842ebf  ! 200: ADDcc_I	addcc 	%r16, 0x0ebf, %r30
	.word 0xd5242d9e  ! 202: STF_I	st	%f10, [0x0d9e, %r16]
	.word 0x8e340011  ! 203: ORN_R	orn 	%r16, %r17, %r7
	.word 0x93641811  ! 205: MOVcc_R	<illegal instruction>
	.word 0x96442752  ! 205: ADDC_I	addc 	%r16, 0x0752, %r11
	.word 0xbc7c0011  ! 205: SDIV_R	sdiv 	%r16, %r17, %r30
	.word 0xd8740011  ! 206: STX_R	stx	%r12, [%r16 + %r17]
	.word 0xaa3c0011  ! 208: XNOR_R	xnor 	%r16, %r17, %r21
	.word 0x889c2270  ! 208: XORcc_I	xorcc 	%r16, 0x0270, %r4
	.word 0xab3c1011  ! 208: SRAX_R	srax	%r16, %r17, %r21
	.word 0xe87c0011  ! 208: SWAP_R	swap	%r20, [%r16 + %r17]
	.word 0xa8240011  ! 209: SUB_R	sub 	%r16, %r17, %r20
	.word 0x8143e018  ! 211: MEMBAR	membar	#StoreStore | #Lookaside 
	.word 0xcc2c2cdd  ! 213: STB_I	stb	%r6, [%r16 + 0x0cdd]
	.word 0x9a0c0011  ! 215: AND_R	and 	%r16, %r17, %r13
	.word 0x937c0411  ! 215: MOVR_R	move	%r16, %r17, %r9
	.word 0x8143e002  ! 215: MEMBAR	membar	#StoreLoad 
	.word 0xec340011  ! 216: STH_R	sth	%r22, [%r16 + %r17]
	.word 0x8c140011  ! 218: OR_R	or 	%r16, %r17, %r6
	.word 0x9dec0011  ! 218: RESTORE_R	restore	%r16, %r17, %r14
	.word 0xf0340011  ! 219: STH_R	sth	%r24, [%r16 + %r17]
	.word 0x8a44225e  ! 221: ADDC_I	addc 	%r16, 0x025e, %r5
	.word 0x84042dbe  ! 221: ADD_I	add 	%r16, 0x0dbe, %r2
	.word 0x88840011  ! 221: ADDcc_R	addcc 	%r16, %r17, %r4
	.word 0x81dc296d  ! 221: FLUSH_I	dis not found

	.word 0xd8240011  ! 222: STW_R	stw	%r12, [%r16 + %r17]
	.word 0x9a3c0011  ! 224: XNOR_R	xnor 	%r16, %r17, %r13
	.word 0xb72c1011  ! 224: SLLX_R	sllx	%r16, %r17, %r27
	.word 0xf85c0011  ! 224: LDX_R	ldx	[%r16 + %r17], %r28
	.word 0xdc740011  ! 225: STX_R	stx	%r14, [%r16 + %r17]
thr2_resum_intr_4:
!$EV trig_pc_d(2,expr(@VA(.MAIN.thr2_resum_intr_4), 16, 16)) -> intp(2, 3, 1)
	wr      %r0, 0x5, %asr26
	.word 0xee342269  ! 229: STH_I	sth	%r23, [%r16 + 0x0269]
	.word 0x95641811  ! 231: MOVcc_R	<illegal instruction>
	.word 0xb8142c4f  ! 231: OR_I	or 	%r16, 0x0c4f, %r28
	.word 0x9aac0011  ! 231: ANDNcc_R	andncc 	%r16, %r17, %r13
	.word 0xc36c2b75  ! 231: PREFETCH_I	prefetch	[%r16 + 0x0b75], #one_read
	.word 0xe6742a71  ! 233: STX_I	stx	%r19, [%r16 + 0x0a71]
	.word 0xb8b42fda  ! 235: ORNcc_I	orncc 	%r16, 0x0fda, %r28
	.word 0x95643801  ! 235: MOVcc_I	<illegal instruction>
	.word 0x8834245f  ! 235: ORN_I	orn 	%r16, 0x045f, %r4
	.word 0x81dc2e27  ! 235: FLUSH_I	dis not found

	.word 0xfa340011  ! 236: STH_R	sth	%r29, [%r16 + %r17]
	.word 0x997c0411  ! 238: MOVR_R	move	%r16, %r17, %r12
	.word 0x8a0c2e91  ! 238: AND_I	and 	%r16, 0x0e91, %r5
	.word 0xaa9c2019  ! 238: XORcc_I	xorcc 	%r16, 0x0019, %r21
	.word 0xbafc28e7  ! 238: SDIVcc_I	sdivcc 	%r16, 0x08e7, %r29
	.word 0xe4740011  ! 239: STX_R	stx	%r18, [%r16 + %r17]
	.word 0x963c2287  ! 241: XNOR_I	xnor 	%r16, 0x0287, %r11
	.word 0xd27c2ab9  ! 241: SWAP_I	swap	%r9, [%r16 + 0x0ab9]
	.word 0xd8240011  ! 242: STW_R	stw	%r12, [%r16 + %r17]
	.word 0xb93c0011  ! 244: SRA_R	sra 	%r16, %r17, %r28
thr2_resum_intr_5:
!$EV trig_pc_d(2,expr(@VA(.MAIN.thr2_resum_intr_5), 16, 16)) -> intp(2, 3, 1)
	wr      %r0, 0x5, %asr26
	.word 0x840c240c  ! 245: AND_I	and 	%r16, 0x040c, %r2
	.word 0xbaac2c4a  ! 247: ANDNcc_I	andncc 	%r16, 0x0c4a, %r29
	.word 0x8e042832  ! 247: ADD_I	add 	%r16, 0x0832, %r7
	.word 0xb4c4253e  ! 247: ADDCcc_I	addccc 	%r16, 0x053e, %r26
	.word 0xc3ec222e  ! 247: PREFETCHA_I	prefetcha	[%r16, + 0x022e] %asi, #one_read
	.word 0xb21c0011  ! 248: XOR_R	xor 	%r16, %r17, %r25
	.word 0x9e3424ed  ! 250: ORN_I	orn 	%r16, 0x04ed, %r15
	.word 0xa69c2a5a  ! 250: XORcc_I	xorcc 	%r16, 0x0a5a, %r19
        wr %g0, 0x4, %fprs
	.word 0xe6342df3  ! 252: STH_I	sth	%r19, [%r16 + 0x0df3]
thr2_resum_intr_6:
!$EV trig_pc_d(2,expr(@VA(.MAIN.thr2_resum_intr_6), 16, 16)) -> intp(2, 3, 1)
	wr      %r0, 0x5, %asr26
	.word 0xe6742481  ! 256: STX_I	stx	%r19, [%r16 + 0x0481]
thr2_resum_intr_7:
!$EV trig_pc_d(2,expr(@VA(.MAIN.thr2_resum_intr_7), 16, 16)) -> intp(2, 3, 1)
	wr      %r0, 0x5, %asr26
	.word 0xe67429b1  ! 260: STX_I	stx	%r19, [%r16 + 0x09b1]
        wr %g0, 0x4, %fprs
	.word 0xf42c0011  ! 263: STB_R	stb	%r26, [%r16 + %r17]
	.word 0x8e94265a  ! 265: ORcc_I	orcc 	%r16, 0x065a, %r7
	.word 0xad7c0411  ! 265: MOVR_R	move	%r16, %r17, %r22
	.word 0x8143e030  ! 265: MEMBAR	membar	#Lookaside | #MemIssue 
	.word 0xf22428bf  ! 267: STW_I	stw	%r25, [%r16 + 0x08bf]
	.word 0xa4ac0011  ! 269: ANDNcc_R	andncc 	%r16, %r17, %r18
	.word 0x8143c000  ! 269: STBAR	stbar
thr2_irf_ce_8:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_8), 16, 16),1,IRF,ce,18,x, x,x,x, x,x,x)
	.word 0xea742867  ! 272: STX_I	stx	%r21, [%r16 + 0x0867]
	.word 0x84942876  ! 274: ORcc_I	orcc 	%r16, 0x0876, %r2
	.word 0x872c0011  ! 274: SLL_R	sll 	%r16, %r17, %r3
	.word 0xc214249f  ! 274: LDUH_I	lduh	[%r16 + 0x049f], %r1
	.word 0x9f3c1011  ! 275: SRAX_R	srax	%r16, %r17, %r15
	.word 0xa8c40011  ! 277: ADDCcc_R	addccc 	%r16, %r17, %r20
	.word 0x0ccc0003  ! 277: BRGZ	brgz  ,pt	%16,<label_0xc0003>
	.word 0xd6240011  ! 278: STW_R	stw	%r11, [%r16 + %r17]
	.word 0x84c40011  ! 280: ADDCcc_R	addccc 	%r16, %r17, %r2
	.word 0x840c2421  ! 280: AND_I	and 	%r16, 0x0421, %r2
	.word 0x8d643801  ! 280: MOVcc_I	<illegal instruction>
	.word 0x9ef40011  ! 280: UDIVcc_R	udivcc 	%r16, %r17, %r15
	.word 0xca2c0011  ! 281: STB_R	stb	%r5, [%r16 + %r17]
	.word 0x8143e019  ! 283: MEMBAR	membar	#LoadLoad | #StoreStore | #Lookaside 
	.word 0xd6342c6d  ! 285: STH_I	sth	%r11, [%r16 + 0x0c6d]
	.word 0x9e840011  ! 287: ADDcc_R	addcc 	%r16, %r17, %r15
	.word 0x8e9420de  ! 287: ORcc_I	orcc 	%r16, 0x00de, %r7
	.word 0xc5f41011  ! 287: CASXA_I	casxa	[%r16] 0x80, %r17, %r2
thr2_irf_ce_9:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_9), 16, 16),1,IRF,ce,49,x, x,x,x, x,x,x)
	.word 0xd8742a6d  ! 290: STX_I	stx	%r12, [%r16 + 0x0a6d]
	.word 0xb17c0411  ! 292: MOVR_R	move	%r16, %r17, %r24
	.word 0x9d340011  ! 292: SRL_R	srl 	%r16, %r17, %r14
	.word 0xaa34224e  ! 292: ORN_I	orn 	%r16, 0x024e, %r21
	.word 0xc61c0011  ! 292: LDD_R	ldd	[%r16 + %r17], %r3
	.word 0xe6742a23  ! 294: STX_I	stx	%r19, [%r16 + 0x0a23]
	.word 0xbb240011  ! 296: MULScc_R	mulscc 	%r16, %r17, %r29
thr2_irf_ce_10:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_10), 16, 16),1,IRF,ce,66,x, x,x,x, x,x,x)
	.word 0xd874226f  ! 299: STX_I	stx	%r12, [%r16 + 0x026f]
	.word 0xb5343001  ! 301: SRLX_I	srlx	%r16, 0x0001, %r26
	.word 0x849c0011  ! 301: XORcc_R	xorcc 	%r16, %r17, %r2
	.word 0x98b40011  ! 301: ORNcc_R	orncc 	%r16, %r17, %r12
	.word 0xe5242247  ! 301: STF_I	st	%f18, [0x0247, %r16]
	.word 0x8e340011  ! 302: SUBC_R	orn 	%r16, %r17, %r7
	.word 0xaa440011  ! 304: ADDC_R	addc 	%r16, %r17, %r21
	.word 0xd8a42340  ! 304: STWA_I	stwa	%r12, [%r16 + 0x0340] %asi
	.word 0xc8342c3b  ! 306: STH_I	sth	%r4, [%r16 + 0x0c3b]
	.word 0xc67c2099  ! 308: SWAP_I	swap	%r3, [%r16 + 0x0099]
	.word 0xf4340011  ! 309: STH_R	sth	%r26, [%r16 + %r17]
	.word 0x93342001  ! 311: SRL_I	srl 	%r16, 0x0001, %r9
	.word 0x8143c000  ! 311: STBAR	stbar
	.word 0xc8342ae9  ! 313: STH_I	sth	%r4, [%r16 + 0x0ae9]
	.word 0xbab42753  ! 315: ORNcc_I	orncc 	%r16, 0x0753, %r29
	.word 0xa8042603  ! 315: ADD_I	add 	%r16, 0x0603, %r20
	.word 0x913c0011  ! 315: SRA_R	sra 	%r16, %r17, %r8
	.word 0xf13c2ee7  ! 315: STDF_I	std	%f24, [0x0ee7, %r16]
thr2_irf_ce_11:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_11), 16, 16),1,IRF,ce,30,x, x,x,x, x,x,x)
	.word 0xda242319  ! 318: STW_I	stw	%r13, [%r16 + 0x0319]
	.word 0x94c40011  ! 320: ADDCcc_R	addccc 	%r16, %r17, %r10
	.word 0xac940011  ! 320: ORcc_R	orcc 	%r16, %r17, %r22
	.word 0xd8ac226f  ! 320: STBA_I	stba	%r12, [%r16 + 0x026f] %asi
	.word 0x8e9c28e7  ! 321: XORcc_I	xorcc 	%r16, 0x08e7, %r7
	ta	T_CHANGE_PRIV	! macro
	.word 0x8c34280c  ! 324: ORN_I	orn 	%r16, 0x080c, %r6
	.word 0x868c2b6d  ! 326: ANDcc_I	andcc 	%r16, 0x0b6d, %r3
	.word 0x81dc2176  ! 326: FLUSH_I	dis not found

	.word 0xe6240011  ! 327: STW_R	stw	%r19, [%r16 + %r17]
	.word 0xb48c2d54  ! 329: ANDcc_I	andcc 	%r16, 0x0d54, %r26
	.word 0x8e842bd5  ! 329: ADDcc_I	addcc 	%r16, 0x0bd5, %r7
	.word 0xbf242e7c  ! 329: MULScc_I	mulscc 	%r16, 0x0e7c, %r31
thr2_irf_ce_12:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_12), 16, 16),1,IRF,ce,38,x, x,x,x, x,x,x)
	.word 0xd4342c05  ! 332: STH_I	sth	%r10, [%r16 + 0x0c05]
	.word 0xb2842e9c  ! 334: ADDcc_I	addcc 	%r16, 0x0e9c, %r25
	.word 0x940c20b3  ! 334: AND_I	and 	%r16, 0x00b3, %r10
	.word 0x8cdc0011  ! 334: SMULcc_R	smulcc 	%r16, %r17, %r6
	.word 0x87643801  ! 335: MOVcc_I	<illegal instruction>
	.word 0xcef427f1  ! 337: STXA_I	stxa	%r7, [%r16 + 0x07f1] %asi
	.word 0xc4742ad9  ! 339: STX_I	stx	%r2, [%r16 + 0x0ad9]
thr2_resum_intr_8:
!$EV trig_pc_d(2,expr(@VA(.MAIN.thr2_resum_intr_8), 16, 16)) -> intp(2, 3, 1)
	wr      %r0, 0x5, %asr26
	.word 0xc4242923  ! 343: STW_I	stw	%r2, [%r16 + 0x0923]
	.word 0x83641811  ! 345: MOVcc_R	<illegal instruction>
	.word 0x8e4c2b27  ! 345: MULX_I	mulx 	%r16, 0x0b27, %r7
thr2_irf_ce_13:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_13), 16, 16),1,IRF,ce,66,x, x,x,x, x,x,x)
	.word 0xde2c2f49  ! 348: STB_I	stb	%r15, [%r16 + 0x0f49]
	.word 0xa93c2001  ! 350: SRA_I	sra 	%r16, 0x0001, %r20
thr2_resum_intr_9:
!$EV trig_pc_d(2,expr(@VA(.MAIN.thr2_resum_intr_9), 16, 16)) -> intp(2, 3, 1)
	wr      %r0, 0x5, %asr26
	.word 0x889c0011  ! 351: XORcc_R	xorcc 	%r16, %r17, %r4
	.word 0x857c0411  ! 353: MOVR_R	move	%r16, %r17, %r2
	.word 0x94040011  ! 353: ADD_R	add 	%r16, %r17, %r10
	.word 0xd2d41011  ! 353: LDSHA_R	ldsha	[%r16, %r17] 0x80, %r9
	.word 0xdc2c2969  ! 355: STB_I	stb	%r14, [%r16 + 0x0969]
	.word 0xb4b422a3  ! 357: ORNcc_I	orncc 	%r16, 0x02a3, %r26
	.word 0x8c2c2555  ! 357: ANDN_I	andn 	%r16, 0x0555, %r6
	.word 0xbf2c3001  ! 357: SLLX_I	sllx	%r16, 0x0001, %r31
	.word 0x9bab4831  ! 357: FMOVCC	fmovs	%fcc1, %f17, %f13
	.word 0xc62c0011  ! 358: STB_R	stb	%r3, [%r16 + %r17]
	.word 0x96442f76  ! 360: ADDC_I	addc 	%r16, 0x0f76, %r11
	.word 0xbf7c2401  ! 360: MOVR_I	move	%r16, 0xfffffff8, %r31
	.word 0xc36c2343  ! 360: PREFETCH_I	prefetch	[%r16 + 0x0343], #one_read
	.word 0xea742c9f  ! 362: STX_I	stx	%r21, [%r16 + 0x0c9f]
        wr %g0, 0x4, %fprs
	.word 0xcc240011  ! 365: STW_R	stw	%r6, [%r16 + %r17]
	.word 0xa4bc0011  ! 367: XNORcc_R	xnorcc 	%r16, %r17, %r18
	.word 0x9b504000  ! 367: RDPR_TNPC	rdpr	%tnpc, %r13
	.word 0xd6242351  ! 369: STW_I	stw	%r11, [%r16 + 0x0351]
	.word 0x8f51c000  ! 371: RDPR_TL	rdpr	%tl, %r7
thr2_irf_ce_14:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_14), 16, 16),1,IRF,ce,20,x, x,x,x, x,x,x)
	.word 0xd22c288d  ! 374: STB_I	stb	%r9, [%r16 + 0x088d]
	.word 0xbc3c0011  ! 376: XNOR_R	xnor 	%r16, %r17, %r30
	.word 0x968c0011  ! 376: ANDcc_R	andcc 	%r16, %r17, %r11
	.word 0x85a01a31  ! 376: FsTOi	dis not found

thr2_irf_ce_15:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_15), 16, 16),1,IRF,ce,8,x, x,x,x, x,x,x)
	.word 0xfa242a2d  ! 379: STW_I	stw	%r29, [%r16 + 0x0a2d]
	.word 0x8eac0011  ! 381: ANDNcc_R	andncc 	%r16, %r17, %r7
	.word 0x968c2fce  ! 381: ANDcc_I	andcc 	%r16, 0x0fce, %r11
	.word 0xc26c2660  ! 381: LDSTUB_I	ldstub	%r1, [%r16 + 0x0660]
	.word 0xc42c2f23  ! 383: STB_I	stb	%r2, [%r16 + 0x0f23]
	.word 0xacbc0011  ! 385: XNORcc_R	xnorcc 	%r16, %r17, %r22
	ta	T_CHANGE_PRIV	! macro
thr2_irf_ce_16:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_16), 16, 16),1,IRF,ce,34,x, x,x,x, x,x,x)
	.word 0xca742e47  ! 388: STX_I	stx	%r5, [%r16 + 0x0e47]
	.word 0x8c94242b  ! 390: ORcc_I	orcc 	%r16, 0x042b, %r6
	.word 0x94140011  ! 390: OR_R	or 	%r16, %r17, %r10
	.word 0xd0ac1011  ! 390: STBA_R	stba	%r8, [%r16 + %r17] 0x80
	.word 0xc22c2819  ! 392: STB_I	stb	%r1, [%r16 + 0x0819]
	.word 0x9ac40011  ! 394: ADDCcc_R	addccc 	%r16, %r17, %r13
	.word 0xc46c0011  ! 394: LDSTUB_R	ldstub	%r2, [%r16 + %r17]
	.word 0xaf2c2001  ! 395: SLL_I	sll 	%r16, 0x0001, %r23
	.word 0x920c2e2b  ! 397: AND_I	and 	%r16, 0x0e2b, %r9
	.word 0xc2b41011  ! 397: STHA_R	stha	%r1, [%r16 + %r17] 0x80
	.word 0xe434294d  ! 399: STH_I	sth	%r18, [%r16 + 0x094d]
	.word 0xb61c2d83  ! 401: XOR_I	xor 	%r16, 0x0d83, %r27
	.word 0x93ec0011  ! 401: RESTORE_R	restore	%r16, %r17, %r9
thr2_irf_ce_17:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_17), 16, 16),1,IRF,ce,7,x, x,x,x, x,x,x)
	.word 0xee342225  ! 404: STH_I	sth	%r23, [%r16 + 0x0225]
	.word 0x81880000  ! 406: RESTORED	saved
thr2_irf_ce_18:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_18), 16, 16),1,IRF,ce,34,x, x,x,x, x,x,x)
	.word 0xee2c2ded  ! 409: STB_I	stb	%r23, [%r16 + 0x0ded]
	.word 0x8143c000  ! 411: STBAR	stbar
	.word 0x8cbc0011  ! 412: XNORcc_R	xnorcc 	%r16, %r17, %r6
	.word 0xb97c2401  ! 414: MOVR_I	move	%r16, 0xfffffff8, %r28
	.word 0x9f342001  ! 414: SRL_I	srl 	%r16, 0x0001, %r15
	.word 0xc3ec1011  ! 414: PREFETCHA_R	prefetcha	[%r16, %r17] 0x80, #one_read
thr2_irf_ce_19:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_19), 16, 16),1,IRF,ce,70,x, x,x,x, x,x,x)
	.word 0xd4242561  ! 417: STW_I	stw	%r10, [%r16 + 0x0561]
	.word 0xaa0c0011  ! 419: AND_R	and 	%r16, %r17, %r21
	.word 0x8c3c2866  ! 419: XNOR_I	xnor 	%r16, 0x0866, %r6
	.word 0x92140011  ! 419: OR_R	or 	%r16, %r17, %r9
	.word 0x02c40001  ! 419: BRZ	brz  ,nt	%16,<label_0x40001>
	.word 0x943c0011  ! 420: XNOR_R	xnor 	%r16, %r17, %r10
	.word 0xc41c0011  ! 422: LDD_R	ldd	[%r16 + %r17], %r2
	.word 0xd0240011  ! 423: STW_R	stw	%r8, [%r16 + %r17]
	.word 0x90b42a74  ! 425: ORNcc_I	orncc 	%r16, 0x0a74, %r8
	.word 0xbc140011  ! 425: OR_R	or 	%r16, %r17, %r30
	.word 0xc25c2015  ! 425: LDX_I	ldx	[%r16 + 0x0015], %r1
	.word 0x877c2401  ! 426: MOVR_I	move	%r16, 0x7fffbdd8, %r3
	.word 0xa47c242e  ! 428: SDIV_I	sdiv 	%r16, 0x042e, %r18
thr2_irf_ce_20:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_20), 16, 16),1,IRF,ce,22,x, x,x,x, x,x,x)
	.word 0xea3422f1  ! 431: STH_I	sth	%r21, [%r16 + 0x02f1]
	.word 0xec8c1011  ! 433: LDUBA_R	lduba	[%r16, %r17] 0x80, %r22
	.word 0x9eac0011  ! 434: ANDNcc_R	andncc 	%r16, %r17, %r15
	.word 0xa4b40011  ! 436: ORNcc_R	orncc 	%r16, %r17, %r18
	.word 0xbe1c0011  ! 436: XOR_R	xor 	%r16, %r17, %r31
	.word 0xbd341011  ! 436: SRLX_R	srlx	%r16, %r17, %r30
	ta	T_CHANGE_HPRIV	! macro
thr2_irf_ce_21:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_21), 16, 16),1,IRF,ce,64,x, x,x,x, x,x,x)
	.word 0xc4342bed  ! 439: STH_I	sth	%r2, [%r16 + 0x0bed]
	.word 0xec7c2856  ! 441: SWAP_I	swap	%r22, [%r16 + 0x0856]
	.word 0xad643801  ! 442: MOVcc_I	<illegal instruction>
	.word 0x95340011  ! 444: SRL_R	srl 	%r16, %r17, %r10
thr2_resum_intr_10:
!$EV trig_pc_d(2,expr(@VA(.MAIN.thr2_resum_intr_10), 16, 16)) -> intp(2, 3, 1)
	wr      %r0, 0x5, %asr26
	.word 0xde240011  ! 445: STW_R	stw	%r15, [%r16 + %r17]
	.word 0x9b641811  ! 447: MOVcc_R	<illegal instruction>
	.word 0xc66c2fb3  ! 447: LDSTUB_I	ldstub	%r3, [%r16 + 0x0fb3]
thr2_irf_ce_22:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_22), 16, 16),1,IRF,ce,36,x, x,x,x, x,x,x)
	.word 0xfe2426db  ! 450: STW_I	stw	%r31, [%r16 + 0x06db]
	.word 0xa6840011  ! 452: ADDcc_R	addcc 	%r16, %r17, %r19
	.word 0x81580000  ! 452: FLUSHW	flushw
thr2_irf_ce_23:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_23), 16, 16),1,IRF,ce,31,x, x,x,x, x,x,x)
	.word 0xd4342d5d  ! 455: STH_I	sth	%r10, [%r16 + 0x0d5d]
	.word 0x937c0411  ! 457: MOVR_R	move	%r16, %r17, %r9
	.word 0x96bc0011  ! 457: XNORcc_R	xnorcc 	%r16, %r17, %r11
	.word 0x90fc23ca  ! 457: SDIVcc_I	sdivcc 	%r16, 0x03ca, %r8
	.word 0xd4342f53  ! 459: STH_I	sth	%r10, [%r16 + 0x0f53]
	.word 0x912c2001  ! 461: SLL_I	sll 	%r16, 0x0001, %r8
	.word 0x24800001  ! 461: BLE	ble,a	<label_0x1>
	.word 0xfe2c24e9  ! 463: STB_I	stb	%r31, [%r16 + 0x04e9]
	.word 0xbcc40011  ! 465: ADDCcc_R	addccc 	%r16, %r17, %r30
	.word 0x8e942c4a  ! 465: ORcc_I	orcc 	%r16, 0x0c4a, %r7
	.word 0x9a8c0011  ! 465: ANDcc_R	andcc 	%r16, %r17, %r13
	.word 0xdfe41011  ! 465: CASA_I	casa	[%r16] 0x80, %r17, %r15
	.word 0xda2428f3  ! 467: STW_I	stw	%r13, [%r16 + 0x08f3]
	.word 0xd6bc2d06  ! 469: STDA_I	stda	%r11, [%r16 + 0x0d06] %asi
	.word 0xbe242c7e  ! 470: SUB_I	sub 	%r16, 0x0c7e, %r31
	.word 0x9b3c2001  ! 472: SRA_I	sra 	%r16, 0x0001, %r13
	.word 0x98bc2f33  ! 472: XNORcc_I	xnorcc 	%r16, 0x0f33, %r12
	.word 0x99641811  ! 472: MOVcc_R	<illegal instruction>
thr2_resum_intr_11:
!$EV trig_pc_d(2,expr(@VA(.MAIN.thr2_resum_intr_11), 16, 16)) -> intp(2, 3, 1)
	wr      %r0, 0x5, %asr26
thr2_irf_ce_24:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_24), 16, 16),1,IRF,ce,34,x, x,x,x, x,x,x)
	.word 0xe4242577  ! 475: STW_I	stw	%r18, [%r16 + 0x0577]
	.word 0x92340011  ! 477: ORN_R	orn 	%r16, %r17, %r9
	.word 0xb2bc0011  ! 477: XNORcc_R	xnorcc 	%r16, %r17, %r25
	.word 0xb8ac0011  ! 477: ANDNcc_R	andncc 	%r16, %r17, %r28
thr2_resum_intr_12:
!$EV trig_pc_d(2,expr(@VA(.MAIN.thr2_resum_intr_12), 16, 16)) -> intp(2, 3, 1)
	wr      %r0, 0x5, %asr26
	.word 0xd024289f  ! 479: STW_I	stw	%r8, [%r16 + 0x089f]
	.word 0x82340011  ! 481: ORN_R	orn 	%r16, %r17, %r1
	.word 0x82ac2193  ! 481: ANDNcc_I	andncc 	%r16, 0x0193, %r1
	.word 0x9f340011  ! 481: SRL_R	srl 	%r16, %r17, %r15
	.word 0xc36c2dca  ! 481: PREFETCH_I	prefetch	[%r16 + 0x0dca], #one_read
	.word 0x9d7c2401  ! 482: MOVR_I	move	%r16, 0x7fffbdd8, %r14
	.word 0x8e9c22df  ! 484: XORcc_I	xorcc 	%r16, 0x02df, %r7
	.word 0xc36c2c0a  ! 484: PREFETCH_I	prefetch	[%r16 + 0x0c0a], #one_read
thr2_irf_ce_25:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_25), 16, 16),1,IRF,ce,30,x, x,x,x, x,x,x)
	.word 0xcc2c2327  ! 487: STB_I	stb	%r6, [%r16 + 0x0327]
	.word 0x20800001  ! 489: BN	bn,a	<label_0x1>
	.word 0xcc2c22c3  ! 491: STB_I	stb	%r6, [%r16 + 0x02c3]
	.word 0xb62c0011  ! 493: ANDN_R	andn 	%r16, %r17, %r27
	.word 0xb29427e4  ! 493: ORcc_I	orcc 	%r16, 0x07e4, %r25
	.word 0x94bc0011  ! 493: XNORcc_R	xnorcc 	%r16, %r17, %r10
	.word 0x8143e008  ! 493: MEMBAR	membar	#StoreStore 
	.word 0xa97c0411  ! 494: MOVR_R	move	%r16, %r17, %r20
	.word 0x92440011  ! 496: ADDC_R	addc 	%r16, %r17, %r9
	.word 0x8ab42db5  ! 496: ORNcc_I	orncc 	%r16, 0x0db5, %r5
	.word 0x2acc0001  ! 496: BRNZ	brnz,a,pt	%16,<label_0xc0001>
thr2_irf_ce_26:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_26), 16, 16),1,IRF,ce,56,x, x,x,x, x,x,x)
	.word 0xe6342eab  ! 499: STH_I	sth	%r19, [%r16 + 0x0eab]
	ta	T_CHANGE_HPRIV	! macro
	.word 0xe624270d  ! 503: STW_I	stw	%r19, [%r16 + 0x070d]
	.word 0xb64424c8  ! 505: ADDC_I	addc 	%r16, 0x04c8, %r27
	.word 0xb0040011  ! 505: ADD_R	add 	%r16, %r17, %r24
	.word 0xcb3c0011  ! 505: STDF_R	std	%f5, [%r17, %r16]
	.word 0x84a40011  ! 506: SUBcc_R	subcc 	%r16, %r17, %r2
	.word 0x96842725  ! 508: ADDcc_I	addcc 	%r16, 0x0725, %r11
	.word 0xc36c2d91  ! 508: PREFETCH_I	prefetch	[%r16 + 0x0d91], #one_read
	.word 0xdc340011  ! 509: STH_R	sth	%r14, [%r16 + %r17]
	.word 0x992c1011  ! 511: SLLX_R	sllx	%r16, %r17, %r12
	.word 0x9d340011  ! 511: SRL_R	srl 	%r16, %r17, %r14
	.word 0x8cac245f  ! 511: ANDNcc_I	andncc 	%r16, 0x045f, %r6
	.word 0x81580000  ! 511: FLUSHW	flushw
	.word 0xd02c0011  ! 512: STB_R	stb	%r8, [%r16 + %r17]
	.word 0xa9340011  ! 514: SRL_R	srl 	%r16, %r17, %r20
	.word 0x87641811  ! 514: MOVcc_R	<illegal instruction>
	.word 0x8e842f76  ! 514: ADDcc_I	addcc 	%r16, 0x0f76, %r7
	.word 0x81880000  ! 514: SAVED	saved
	.word 0xea2c21f7  ! 516: STB_I	stb	%r21, [%r16 + 0x01f7]
	.word 0x892c0011  ! 518: SLL_R	sll 	%r16, %r17, %r4
        wr %g0, 0x4, %fprs
	.word 0xd02c0011  ! 519: STB_R	stb	%r8, [%r16 + %r17]
	.word 0x88840011  ! 521: ADDcc_R	addcc 	%r16, %r17, %r4
	.word 0x93ec0011  ! 521: RESTORE_R	restore	%r16, %r17, %r9
thr2_irf_ce_27:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_27), 16, 16),1,IRF,ce,28,x, x,x,x, x,x,x)
	.word 0xca242eb1  ! 524: STW_I	stw	%r5, [%r16 + 0x0eb1]
	.word 0x888420e8  ! 526: ADDcc_I	addcc 	%r16, 0x00e8, %r4
	.word 0x9b2c1011  ! 526: SLLX_R	sllx	%r16, %r17, %r13
	.word 0xfc4c2fc7  ! 526: LDSB_I	ldsb	[%r16 + 0x0fc7], %r30
thr2_irf_ce_28:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_28), 16, 16),1,IRF,ce,10,x, x,x,x, x,x,x)
	.word 0xdc3425a5  ! 529: STH_I	sth	%r14, [%r16 + 0x05a5]
	.word 0xa9a40931  ! 531: FMULs	fmuls	%f16, %f17, %f20
	.word 0x969c2ed7  ! 532: XORcc_I	xorcc 	%r16, 0x0ed7, %r11
	.word 0x8d3c1011  ! 534: SRAX_R	srax	%r16, %r17, %r6
	.word 0x980428a8  ! 534: ADD_I	add 	%r16, 0x08a8, %r12
	.word 0xb2840011  ! 534: ADDcc_R	addcc 	%r16, %r17, %r25
	.word 0x81580000  ! 534: FLUSHW	flushw
	.word 0x86240011  ! 535: SUB_R	sub 	%r16, %r17, %r3
	.word 0x8c0c0011  ! 537: AND_R	and 	%r16, %r17, %r6
	.word 0xa9641811  ! 537: MOVcc_R	<illegal instruction>
	.word 0x82440011  ! 537: ADDC_R	addc 	%r16, %r17, %r1
	.word 0x20800003  ! 537: BN	bn,a	<label_0x3>
	.word 0xdc740011  ! 538: STX_R	stx	%r14, [%r16 + %r17]
        wr %g0, 0x4, %fprs
	.word 0xf2740011  ! 541: STX_R	stx	%r25, [%r16 + %r17]
	.word 0xb21c0011  ! 543: XOR_R	xor 	%r16, %r17, %r25
thr2_resum_intr_13:
!$EV trig_pc_d(2,expr(@VA(.MAIN.thr2_resum_intr_13), 16, 16)) -> intp(2, 3, 1)
	wr      %r0, 0x5, %asr26
	.word 0xdc340011  ! 544: STH_R	sth	%r14, [%r16 + %r17]
	.word 0x9ef40011  ! 546: UDIVcc_R	udivcc 	%r16, %r17, %r15
	.word 0xda2c2047  ! 548: STB_I	stb	%r13, [%r16 + 0x0047]
	.word 0xbcc40011  ! 550: ADDCcc_R	addccc 	%r16, %r17, %r30
	.word 0xbfec0011  ! 550: RESTORE_R	restore	%r16, %r17, %r31
	.word 0xe4740011  ! 551: STX_R	stx	%r18, [%r16 + %r17]
	.word 0x9a0c2eea  ! 553: AND_I	and 	%r16, 0x0eea, %r13
	.word 0xb21429bd  ! 553: OR_I	or 	%r16, 0x09bd, %r25
	.word 0x98d42194  ! 553: UMULcc_I	umulcc 	%r16, 0x0194, %r12
	.word 0xdc2c277d  ! 555: STB_I	stb	%r14, [%r16 + 0x077d]
	.word 0xbab40011  ! 557: ORNcc_R	orncc 	%r16, %r17, %r29
	.word 0x8eb429bb  ! 557: ORNcc_I	orncc 	%r16, 0x09bb, %r7
	.word 0x94ac0011  ! 557: ANDNcc_R	andncc 	%r16, %r17, %r10
        wr %g0, 0x4, %fprs
	.word 0xc22c2ff9  ! 559: STB_I	stb	%r1, [%r16 + 0x0ff9]
thr2_resum_intr_14:
!$EV trig_pc_d(2,expr(@VA(.MAIN.thr2_resum_intr_14), 16, 16)) -> intp(2, 3, 1)
	wr      %r0, 0x5, %asr26
	.word 0xc234209b  ! 563: STH_I	sth	%r1, [%r16 + 0x009b]
	.word 0x8c2c0011  ! 565: ANDN_R	andn 	%r16, %r17, %r6
	.word 0x941c273c  ! 565: XOR_I	xor 	%r16, 0x073c, %r10
	.word 0xba4c20a2  ! 565: MULX_I	mulx 	%r16, 0x00a2, %r29
	.word 0xcc340011  ! 566: STH_R	sth	%r6, [%r16 + %r17]
thr2_resum_intr_15:
!$EV trig_pc_d(2,expr(@VA(.MAIN.thr2_resum_intr_15), 16, 16)) -> intp(2, 3, 1)
	wr      %r0, 0x5, %asr26
	.word 0xc8740011  ! 569: STX_R	stx	%r4, [%r16 + %r17]
        wr %g0, 0x4, %fprs
	.word 0xa4a42d23  ! 572: SUBcc_I	subcc 	%r16, 0x0d23, %r18
        wr %g0, 0x4, %fprs
thr2_irf_ce_29:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_29), 16, 16),1,IRF,ce,55,x, x,x,x, x,x,x)
	.word 0xce342a43  ! 577: STH_I	sth	%r7, [%r16 + 0x0a43]
	.word 0xb6542364  ! 579: UMUL_I	umul 	%r16, 0x0364, %r27
	.word 0x8e040011  ! 580: ADD_R	add 	%r16, %r17, %r7
	.word 0x84b428ec  ! 582: ORNcc_I	orncc 	%r16, 0x08ec, %r2
	.word 0xb9341011  ! 582: SRLX_R	srlx	%r16, %r17, %r28
	.word 0xfc6c0011  ! 582: LDSTUB_R	ldstub	%r30, [%r16 + %r17]
	.word 0xc6340011  ! 583: STH_R	sth	%r3, [%r16 + %r17]
	.word 0xcc5c218d  ! 585: LDX_I	ldx	[%r16 + 0x018d], %r6
	.word 0xa6240011  ! 586: SUB_R	sub 	%r16, %r17, %r19
	.word 0x9a8c0011  ! 588: ANDcc_R	andcc 	%r16, %r17, %r13
	.word 0xa4442252  ! 588: ADDC_I	addc 	%r16, 0x0252, %r18
	.word 0x94ac2dee  ! 588: ANDNcc_I	andncc 	%r16, 0x0dee, %r10
	.word 0xa5ec0011  ! 588: RESTORE_R	restore	%r16, %r17, %r18
thr2_irf_ce_30:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_30), 16, 16),1,IRF,ce,39,x, x,x,x, x,x,x)
	.word 0xdc7421ab  ! 591: STX_I	stx	%r14, [%r16 + 0x01ab]
	.word 0x972c0011  ! 593: SLL_R	sll 	%r16, %r17, %r11
	.word 0xbf2c1011  ! 593: SLLX_R	sllx	%r16, %r17, %r31
	.word 0xb8940011  ! 593: ORcc_R	orcc 	%r16, %r17, %r28
	.word 0xb2dc0011  ! 593: SMULcc_R	smulcc 	%r16, %r17, %r25
	.word 0xb92c0011  ! 594: SLL_R	sll 	%r16, %r17, %r28
	.word 0x889c25e9  ! 596: XORcc_I	xorcc 	%r16, 0x05e9, %r4
	.word 0x8f340011  ! 596: SRL_R	srl 	%r16, %r17, %r7
	.word 0x81580000  ! 596: FLUSHW	flushw
	.word 0x908c2571  ! 597: ANDcc_I	andcc 	%r16, 0x0571, %r8
	.word 0x94140011  ! 599: OR_R	or 	%r16, %r17, %r10
        wr %g0, 0x4, %fprs
thr2_irf_ce_31:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_31), 16, 16),1,IRF,ce,1,x, x,x,x, x,x,x)
	.word 0xd0342ac9  ! 602: STH_I	sth	%r8, [%r16 + 0x0ac9]
	.word 0xbb3c0011  ! 604: SRA_R	sra 	%r16, %r17, %r29
	.word 0x9c8c0011  ! 604: ANDcc_R	andcc 	%r16, %r17, %r14
	.word 0x81880000  ! 604: SAVED	saved
	.word 0xf0340011  ! 605: STH_R	sth	%r24, [%r16 + %r17]
	.word 0xb8bc292e  ! 607: XNORcc_I	xnorcc 	%r16, 0x092e, %r28
	.word 0x9357c000  ! 607: RDPR_VER	<illegal instruction>
	.word 0xce740011  ! 608: STX_R	stx	%r7, [%r16 + %r17]
	.word 0xbec40011  ! 610: ADDCcc_R	addccc 	%r16, %r17, %r31
	.word 0xbc9c2a40  ! 610: XORcc_I	xorcc 	%r16, 0x0a40, %r30
	.word 0x86c40011  ! 610: ADDCcc_R	addccc 	%r16, %r17, %r3
	ta	T_CHANGE_PRIV	! macro
	.word 0xdc740011  ! 611: STX_R	stx	%r14, [%r16 + %r17]
	.word 0x89643801  ! 613: MOVcc_I	<illegal instruction>
	.word 0x9cdc2356  ! 613: SMULcc_I	smulcc 	%r16, 0x0356, %r14
	.word 0x84340011  ! 614: SUBC_R	orn 	%r16, %r17, %r2
	.word 0xa73c2001  ! 616: SRA_I	sra 	%r16, 0x0001, %r19
	.word 0x852c3001  ! 616: SLLX_I	sllx	%r16, 0x0001, %r2
	.word 0xa83c0011  ! 616: XNOR_R	xnor 	%r16, %r17, %r20
	.word 0xcea41011  ! 616: STWA_R	stwa	%r7, [%r16 + %r17] 0x80
	.word 0x9c2c226b  ! 617: ANDN_I	andn 	%r16, 0x026b, %r14
	.word 0x90b40011  ! 619: ORNcc_R	orncc 	%r16, %r17, %r8
	.word 0xa87c2a61  ! 619: SDIV_I	sdiv 	%r16, 0x0a61, %r20
thr2_irf_ce_32:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_32), 16, 16),1,IRF,ce,39,x, x,x,x, x,x,x)
	.word 0xdc2c2bcb  ! 622: STB_I	stb	%r14, [%r16 + 0x0bcb]
	.word 0x9f7c2401  ! 624: MOVR_I	move	%r16, 0xfffffff8, %r15
	.word 0x81840011  ! 624: WRY_R	wr	%r16, %r17, %y
	.word 0xd67429e7  ! 626: STX_I	stx	%r11, [%r16 + 0x09e7]
	.word 0x96040011  ! 628: ADD_R	add 	%r16, %r17, %r11
	.word 0xb97c0411  ! 628: MOVR_R	move	%r16, %r17, %r28
	.word 0x8a2c2fb2  ! 628: ANDN_I	andn 	%r16, 0x0fb2, %r5
	.word 0xb8dc0011  ! 628: SMULcc_R	smulcc 	%r16, %r17, %r28
thr2_irf_ce_33:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_33), 16, 16),1,IRF,ce,31,x, x,x,x, x,x,x)
	.word 0xe67426fd  ! 631: STX_I	stx	%r19, [%r16 + 0x06fd]
	.word 0xd0941011  ! 633: LDUHA_R	lduha	[%r16, %r17] 0x80, %r8
thr2_irf_ce_34:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_34), 16, 16),1,IRF,ce,25,x, x,x,x, x,x,x)
	.word 0xd22c2e09  ! 636: STB_I	stb	%r9, [%r16 + 0x0e09]
	.word 0x88c42dc1  ! 638: ADDCcc_I	addccc 	%r16, 0x0dc1, %r4
	.word 0xa53c0011  ! 638: SRA_R	sra 	%r16, %r17, %r18
	.word 0x0ac40003  ! 638: BRNZ	brnz  ,nt	%16,<label_0x40003>
	.word 0xd02c260d  ! 640: STB_I	stb	%r8, [%r16 + 0x060d]
	.word 0xb32c1011  ! 642: SLLX_R	sllx	%r16, %r17, %r25
	.word 0x820c0011  ! 642: AND_R	and 	%r16, %r17, %r1
	.word 0xfbe42011  ! 642: CASA_R	casa	[%r16] %asi, %r17, %r29
	.word 0x86ac0011  ! 643: ANDNcc_R	andncc 	%r16, %r17, %r3
	.word 0x963423cf  ! 645: ORN_I	orn 	%r16, 0x03cf, %r11
	.word 0xd05c2131  ! 645: LDX_I	ldx	[%r16 + 0x0131], %r8
	.word 0xb6340011  ! 646: ORN_R	orn 	%r16, %r17, %r27
	.word 0x933c1011  ! 648: SRAX_R	srax	%r16, %r17, %r9
	.word 0xa60c2075  ! 648: AND_I	and 	%r16, 0x0075, %r19
	.word 0x89342001  ! 648: SRL_I	srl 	%r16, 0x0001, %r4
	.word 0xd53c21a2  ! 648: STDF_I	std	%f10, [0x01a2, %r16]
thr2_irf_ce_35:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_35), 16, 16),1,IRF,ce,7,x, x,x,x, x,x,x)
	.word 0xe6242881  ! 651: STW_I	stw	%r19, [%r16 + 0x0881]
	.word 0xba940011  ! 653: ORcc_R	orcc 	%r16, %r17, %r29
	.word 0xad3c2001  ! 653: SRA_I	sra 	%r16, 0x0001, %r22
thr2_resum_intr_16:
!$EV trig_pc_d(2,expr(@VA(.MAIN.thr2_resum_intr_16), 16, 16)) -> intp(2, 3, 1)
	wr      %r0, 0x5, %asr26
	.word 0xf2740011  ! 654: STX_R	stx	%r25, [%r16 + %r17]
	.word 0xb37c0411  ! 656: MOVR_R	move	%r16, %r17, %r25
	.word 0xa8340011  ! 656: ORN_R	orn 	%r16, %r17, %r20
	.word 0x96142cc6  ! 656: OR_I	or 	%r16, 0x0cc6, %r11
        wr %g0, 0x4, %fprs
	.word 0x88042312  ! 657: ADD_I	add 	%r16, 0x0312, %r4
	.word 0x882c0011  ! 659: ANDN_R	andn 	%r16, %r17, %r4
	.word 0xba5426a4  ! 659: UMUL_I	umul 	%r16, 0x06a4, %r29
	.word 0xd6242a57  ! 661: STW_I	stw	%r11, [%r16 + 0x0a57]
	.word 0xd21c0011  ! 663: LDD_R	ldd	[%r16 + %r17], %r9
	.word 0xcc74257f  ! 665: STX_I	stx	%r6, [%r16 + 0x057f]
	.word 0x8a2c0011  ! 667: ANDN_R	andn 	%r16, %r17, %r5
	.word 0xaa4c0011  ! 667: MULX_R	mulx 	%r16, %r17, %r21
	.word 0xda340011  ! 668: STH_R	sth	%r13, [%r16 + %r17]
	.word 0xd41c0011  ! 670: LDD_R	ldd	[%r16 + %r17], %r10
	.word 0xec240011  ! 671: STW_R	stw	%r22, [%r16 + %r17]
	.word 0xb41c0011  ! 673: XOR_R	xor 	%r16, %r17, %r26
	.word 0x81dc0011  ! 673: FLUSH_R	dis not found

	.word 0x837c0411  ! 674: MOVR_R	move	%r16, %r17, %r1
	.word 0x993c1011  ! 676: SRAX_R	srax	%r16, %r17, %r12
	.word 0xb88c2f6d  ! 676: ANDcc_I	andcc 	%r16, 0x0f6d, %r28
	.word 0x8e4425a5  ! 676: ADDC_I	addc 	%r16, 0x05a5, %r7
	.word 0xe4941011  ! 676: LDUHA_R	lduha	[%r16, %r17] 0x80, %r18
thr2_irf_ce_36:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_36), 16, 16),1,IRF,ce,19,x, x,x,x, x,x,x)
	.word 0xde242f1f  ! 679: STW_I	stw	%r15, [%r16 + 0x0f1f]
	.word 0x9abc0011  ! 681: XNORcc_R	xnorcc 	%r16, %r17, %r13
	.word 0x8e1c0011  ! 681: XOR_R	xor 	%r16, %r17, %r7
	.word 0xe5e42011  ! 681: CASA_R	casa	[%r16] %asi, %r17, %r18
	.word 0x8d641811  ! 682: MOVcc_R	<illegal instruction>
	.word 0x9f2c3001  ! 684: SLLX_I	sllx	%r16, 0x0001, %r15
	.word 0xae8429b9  ! 684: ADDcc_I	addcc 	%r16, 0x09b9, %r23
	.word 0x843c2b6e  ! 684: XNOR_I	xnor 	%r16, 0x0b6e, %r2
	.word 0x98dc2762  ! 684: SMULcc_I	smulcc 	%r16, 0x0762, %r12
thr2_irf_ce_37:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_37), 16, 16),1,IRF,ce,36,x, x,x,x, x,x,x)
	.word 0xf4242ffb  ! 687: STW_I	stw	%r26, [%r16 + 0x0ffb]
	.word 0x852c1011  ! 689: SLLX_R	sllx	%r16, %r17, %r2
	.word 0x9eb40011  ! 689: ORNcc_R	orncc 	%r16, %r17, %r15
	.word 0xa63c0011  ! 689: XNOR_R	xnor 	%r16, %r17, %r19
	.word 0xc8a41011  ! 689: STWA_R	stwa	%r4, [%r16 + %r17] 0x80
	.word 0x9c3c0011  ! 690: XNOR_R	xnor 	%r16, %r17, %r14
	.word 0x8b342001  ! 692: SRL_I	srl 	%r16, 0x0001, %r5
        wr %g0, 0x4, %fprs
	.word 0xde340011  ! 693: STH_R	sth	%r15, [%r16 + %r17]
	.word 0x841c28d0  ! 695: XOR_I	xor 	%r16, 0x08d0, %r2
	.word 0x962c0011  ! 695: ANDN_R	andn 	%r16, %r17, %r11
	.word 0x977c0411  ! 695: MOVR_R	move	%r16, %r17, %r11
	.word 0xd4cc2bd4  ! 695: LDSBA_I	ldsba	[%r16, + 0x0bd4] %asi, %r10
	.word 0xc82c0011  ! 696: STB_R	stb	%r4, [%r16 + %r17]
	.word 0x8c540011  ! 698: UMUL_R	umul 	%r16, %r17, %r6
	.word 0xfc2c0011  ! 699: STB_R	stb	%r30, [%r16 + %r17]
	.word 0xca0c2cfa  ! 701: LDUB_I	ldub	[%r16 + 0x0cfa], %r5
	.word 0xca740011  ! 702: STX_R	stx	%r5, [%r16 + %r17]
	.word 0xb41c0011  ! 704: XOR_R	xor 	%r16, %r17, %r26
	.word 0x893c2001  ! 704: SRA_I	sra 	%r16, 0x0001, %r4
	.word 0x81dc0011  ! 704: FLUSH_R	dis not found

	.word 0xd6242aab  ! 706: STW_I	stw	%r11, [%r16 + 0x0aab]
	.word 0x86bc0011  ! 708: XNORcc_R	xnorcc 	%r16, %r17, %r3
	.word 0x8ebc0011  ! 708: XNORcc_R	xnorcc 	%r16, %r17, %r7
	.word 0x0cc40001  ! 708: BRGZ	brgz  ,nt	%16,<label_0x40001>
	.word 0xd0240011  ! 709: STW_R	stw	%r8, [%r16 + %r17]
	.word 0x93340011  ! 711: SRL_R	srl 	%r16, %r17, %r9
	.word 0xbe740011  ! 711: UDIV_R	udiv 	%r16, %r17, %r31
	.word 0xda742099  ! 713: STX_I	stx	%r13, [%r16 + 0x0099]
	.word 0x83343001  ! 715: SRLX_I	srlx	%r16, 0x0001, %r1
	.word 0x861c0011  ! 715: XOR_R	xor 	%r16, %r17, %r3
	.word 0xc3ec2ab6  ! 715: PREFETCHA_I	prefetcha	[%r16, + 0x0ab6] %asi, #one_read
thr2_irf_ce_38:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_38), 16, 16),1,IRF,ce,20,x, x,x,x, x,x,x)
	.word 0xf2342b73  ! 718: STH_I	sth	%r25, [%r16 + 0x0b73]
	.word 0x8b3c0011  ! 720: SRA_R	sra 	%r16, %r17, %r5
	.word 0x9e84220c  ! 720: ADDcc_I	addcc 	%r16, 0x020c, %r15
	.word 0x8fa409d1  ! 720: FDIVd	fdivd	%f16, %f48, %f38
	.word 0xa4c40011  ! 721: ADDCcc_R	addccc 	%r16, %r17, %r18
	.word 0x973c0011  ! 723: SRA_R	sra 	%r16, %r17, %r11
	.word 0xb68c0011  ! 723: ANDcc_R	andcc 	%r16, %r17, %r27
	.word 0x9ac40011  ! 723: ADDCcc_R	addccc 	%r16, %r17, %r13
	.word 0xa9242f1b  ! 723: MULScc_I	mulscc 	%r16, 0x0f1b, %r20
	.word 0xf62c2941  ! 725: STB_I	stb	%r27, [%r16 + 0x0941]
	.word 0xad643801  ! 727: MOVcc_I	<illegal instruction>
	.word 0x8eb425c1  ! 727: ORNcc_I	orncc 	%r16, 0x05c1, %r7
	.word 0xa8bc25dd  ! 727: XNORcc_I	xnorcc 	%r16, 0x05dd, %r20
	.word 0x1a800001  ! 727: BCC	bcc  	<label_0x1>
thr2_irf_ce_39:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_39), 16, 16),1,IRF,ce,0,x, x,x,x, x,x,x)
	.word 0xd22c2055  ! 730: STB_I	stb	%r9, [%r16 + 0x0055]
	.word 0xfe1c0011  ! 732: LDD_R	ldd	[%r16 + %r17], %r31
	.word 0x832c1011  ! 733: SLLX_R	sllx	%r16, %r17, %r1
	.word 0x92c40011  ! 735: ADDCcc_R	addccc 	%r16, %r17, %r9
	.word 0xada00051  ! 735: FMOVd	fmovd	%f48, %f22
	.word 0x98240011  ! 736: SUB_R	sub 	%r16, %r17, %r12
	.word 0x98840011  ! 738: ADDcc_R	addcc 	%r16, %r17, %r12
	.word 0xa6bc204e  ! 738: XNORcc_I	xnorcc 	%r16, 0x004e, %r19
	.word 0xb6ac2742  ! 738: ANDNcc_I	andncc 	%r16, 0x0742, %r27
	.word 0xc36c2a63  ! 738: PREFETCH_I	prefetch	[%r16 + 0x0a63], #one_read
thr2_irf_ce_40:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_40), 16, 16),1,IRF,ce,37,x, x,x,x, x,x,x)
	.word 0xd8342851  ! 741: STH_I	sth	%r12, [%r16 + 0x0851]
	.word 0x9d340011  ! 743: SRL_R	srl 	%r16, %r17, %r14
	.word 0x9d3c2001  ! 743: SRA_I	sra 	%r16, 0x0001, %r14
	.word 0x3c800001  ! 743: BPOS	bpos,a	<label_0x1>
thr2_irf_ce_41:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_41), 16, 16),1,IRF,ce,45,x, x,x,x, x,x,x)
	.word 0xf6742dd3  ! 746: STX_I	stx	%r27, [%r16 + 0x0dd3]
	.word 0x9aac0011  ! 748: ANDNcc_R	andncc 	%r16, %r17, %r13
	.word 0x9a040011  ! 748: ADD_R	add 	%r16, %r17, %r13
	.word 0x8c3c2f7c  ! 748: XNOR_I	xnor 	%r16, 0x0f7c, %r6
	.word 0x87a81831  ! 748: FMOVRGZ	fmovs	%fcc3, %f17, %f3
	.word 0xd6742987  ! 750: STX_I	stx	%r11, [%r16 + 0x0987]
	.word 0x860428bf  ! 752: ADD_I	add 	%r16, 0x08bf, %r3
	.word 0x81580000  ! 752: FLUSHW	flushw
	.word 0xd47420bd  ! 754: STX_I	stx	%r10, [%r16 + 0x00bd]
	ta	T_CHANGE_HPRIV	! macro
thr2_irf_ce_42:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_42), 16, 16),1,IRF,ce,40,x, x,x,x, x,x,x)
	.word 0xd42c27af  ! 759: STB_I	stb	%r10, [%r16 + 0x07af]
	.word 0xad343001  ! 761: SRLX_I	srlx	%r16, 0x0001, %r22
	.word 0x8143c000  ! 761: STBAR	stbar
	.word 0xf4740011  ! 762: STX_R	stx	%r26, [%r16 + %r17]
	.word 0xbd524000  ! 764: RDPR_CWP	rdpr	%cwp, %r30
	.word 0xd42422f5  ! 766: STW_I	stw	%r10, [%r16 + 0x02f5]
	.word 0xb8c424dd  ! 768: ADDCcc_I	addccc 	%r16, 0x04dd, %r28
	.word 0x863c0011  ! 768: XNOR_R	xnor 	%r16, %r17, %r3
	.word 0x3e800001  ! 768: BVC	bvc,a	<label_0x1>
	.word 0xbf7c2401  ! 769: MOVR_I	move	%r16, 0x7fffbdd8, %r31
	.word 0x9c3c0011  ! 771: XNOR_R	xnor 	%r16, %r17, %r14
	.word 0x8a840011  ! 771: ADDcc_R	addcc 	%r16, %r17, %r5
	.word 0xb6f426af  ! 771: UDIVcc_I	udivcc 	%r16, 0x06af, %r27
	.word 0x953c2001  ! 772: SRA_I	sra 	%r16, 0x0001, %r10
	.word 0x8a0c2540  ! 774: AND_I	and 	%r16, 0x0540, %r5
	.word 0xac140011  ! 774: OR_R	or 	%r16, %r17, %r22
	.word 0xbe840011  ! 774: ADDcc_R	addcc 	%r16, %r17, %r31
	.word 0xe60c2899  ! 774: LDUB_I	ldub	[%r16 + 0x0899], %r19
	.word 0x92ac2c12  ! 775: ANDNcc_I	andncc 	%r16, 0x0c12, %r9
	.word 0x8f341011  ! 777: SRLX_R	srlx	%r16, %r17, %r7
	.word 0xb0340011  ! 777: ORN_R	orn 	%r16, %r17, %r24
	.word 0x82d40011  ! 777: UMULcc_R	umulcc 	%r16, %r17, %r1
thr2_irf_ce_43:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_43), 16, 16),1,IRF,ce,23,x, x,x,x, x,x,x)
	.word 0xd4242725  ! 780: STW_I	stw	%r10, [%r16 + 0x0725]
	.word 0x81580000  ! 782: FLUSHW	flushw
	.word 0x833c1011  ! 783: SRAX_R	srax	%r16, %r17, %r1
	.word 0x981c2375  ! 785: XOR_I	xor 	%r16, 0x0375, %r12
	.word 0xb8040011  ! 785: ADD_R	add 	%r16, %r17, %r28
thr2_resum_intr_17:
!$EV trig_pc_d(2,expr(@VA(.MAIN.thr2_resum_intr_17), 16, 16)) -> intp(2, 3, 1)
	wr      %r0, 0x5, %asr26
	.word 0xaa9c0011  ! 786: XORcc_R	xorcc 	%r16, %r17, %r21
	.word 0xca8c20f2  ! 788: LDUBA_I	lduba	[%r16, + 0x00f2] %asi, %r5
	.word 0xf02c2a91  ! 790: STB_I	stb	%r24, [%r16 + 0x0a91]
	.word 0x8e9c24dc  ! 792: XORcc_I	xorcc 	%r16, 0x04dc, %r7
	ta	T_CHANGE_NONPRIV	! macro
thr2_irf_ce_44:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_44), 16, 16),1,IRF,ce,33,x, x,x,x, x,x,x)
	.word 0xde242c9b  ! 795: STW_I	stw	%r15, [%r16 + 0x0c9b]
	.word 0x84c40011  ! 797: ADDCcc_R	addccc 	%r16, %r17, %r2
	.word 0x8a3428ab  ! 797: ORN_I	orn 	%r16, 0x08ab, %r5
	.word 0x97520000  ! 797: RDPR_PIL	rdpr	%pil, %r11
	.word 0xc62c2d67  ! 799: STB_I	stb	%r3, [%r16 + 0x0d67]
	.word 0xb48c0011  ! 801: ANDcc_R	andcc 	%r16, %r17, %r26
	.word 0xd47c2bc5  ! 801: SWAP_I	swap	%r10, [%r16 + 0x0bc5]
	.word 0xb6440011  ! 802: ADDC_R	addc 	%r16, %r17, %r27
	.word 0x94b40011  ! 804: ORNcc_R	orncc 	%r16, %r17, %r10
	.word 0xb00c0011  ! 804: AND_R	and 	%r16, %r17, %r24
	.word 0xc2442628  ! 804: LDSW_I	ldsw	[%r16 + 0x0628], %r1
	.word 0x9ea42c70  ! 805: SUBcc_I	subcc 	%r16, 0x0c70, %r15
	.word 0xd64c266c  ! 807: LDSB_I	ldsb	[%r16 + 0x066c], %r11
	.word 0xc234246f  ! 809: STH_I	sth	%r1, [%r16 + 0x046f]
	.word 0x861c2f1a  ! 811: XOR_I	xor 	%r16, 0x0f1a, %r3
	.word 0x88440011  ! 811: ADDC_R	addc 	%r16, %r17, %r4
	.word 0xbaf42972  ! 811: UDIVcc_I	udivcc 	%r16, 0x0972, %r29
	.word 0xa72c1011  ! 812: SLLX_R	sllx	%r16, %r17, %r19
	.word 0xb13c2001  ! 814: SRA_I	sra 	%r16, 0x0001, %r24
	.word 0x900c0011  ! 814: AND_R	and 	%r16, %r17, %r8
	.word 0x9c342524  ! 814: ORN_I	orn 	%r16, 0x0524, %r14
	.word 0x992420dd  ! 814: MULScc_I	mulscc 	%r16, 0x00dd, %r12
thr2_irf_ce_45:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_45), 16, 16),1,IRF,ce,53,x, x,x,x, x,x,x)
	.word 0xca242553  ! 817: STW_I	stw	%r5, [%r16 + 0x0553]
thr2_resum_intr_18:
!$EV trig_pc_d(2,expr(@VA(.MAIN.thr2_resum_intr_18), 16, 16)) -> intp(2, 3, 1)
	wr      %r0, 0x5, %asr26
thr2_irf_ce_46:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_46), 16, 16),1,IRF,ce,29,x, x,x,x, x,x,x)
	.word 0xca2422d7  ! 822: STW_I	stw	%r5, [%r16 + 0x02d7]
	.word 0x8f2c2001  ! 824: SLL_I	sll 	%r16, 0x0001, %r7
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x9d342001  ! 825: SRL_I	srl 	%r16, 0x0001, %r14
	.word 0x98ac0011  ! 827: ANDNcc_R	andncc 	%r16, %r17, %r12
	.word 0xc6942ce9  ! 827: LDUHA_I	lduha	[%r16, + 0x0ce9] %asi, %r3
	.word 0x8d2c3001  ! 828: SLLX_I	sllx	%r16, 0x0001, %r6
	.word 0x968c29cd  ! 830: ANDcc_I	andcc 	%r16, 0x09cd, %r11
	.word 0x8d3c1011  ! 830: SRAX_R	srax	%r16, %r17, %r6
	.word 0xb6f42366  ! 830: UDIVcc_I	udivcc 	%r16, 0x0366, %r27
	.word 0xcc340011  ! 831: STH_R	sth	%r6, [%r16 + %r17]
	.word 0x9a042190  ! 833: ADD_I	add 	%r16, 0x0190, %r13
	.word 0x8f7c0411  ! 833: MOVR_R	move	%r16, %r17, %r7
	.word 0x892c2001  ! 833: SLL_I	sll 	%r16, 0x0001, %r4
        wr %g0, 0x4, %fprs
thr2_irf_ce_47:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_47), 16, 16),1,IRF,ce,3,x, x,x,x, x,x,x)
	.word 0xe6342623  ! 836: STH_I	sth	%r19, [%r16 + 0x0623]
	.word 0x88042a10  ! 838: ADD_I	add 	%r16, 0x0a10, %r4
	ta	T_CHANGE_NONHPRIV	! macro
thr2_irf_ce_48:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_48), 16, 16),1,IRF,ce,69,x, x,x,x, x,x,x)
	.word 0xdc2420b9  ! 841: STW_I	stw	%r14, [%r16 + 0x00b9]
	.word 0xbc0c0011  ! 843: AND_R	and 	%r16, %r17, %r30
	.word 0x9c942983  ! 843: ORcc_I	orcc 	%r16, 0x0983, %r14
	.word 0xaeac0011  ! 843: ANDNcc_R	andncc 	%r16, %r17, %r23
	.word 0xfcfc1011  ! 843: SWAPA_R	swapa	%r30, [%r16 + %r17] 0x80
	.word 0x903c2862  ! 844: XNOR_I	xnor 	%r16, 0x0862, %r8
	.word 0x94842cef  ! 846: ADDcc_I	addcc 	%r16, 0x0cef, %r10
	.word 0x9eac0011  ! 846: ANDNcc_R	andncc 	%r16, %r17, %r15
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xfa240011  ! 847: STW_R	stw	%r29, [%r16 + %r17]
	.word 0x9b342001  ! 849: SRL_I	srl 	%r16, 0x0001, %r13
	.word 0xbac427d3  ! 849: ADDCcc_I	addccc 	%r16, 0x07d3, %r29
	.word 0x81880000  ! 849: RESTORED	saved
thr2_irf_ce_49:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_49), 16, 16),1,IRF,ce,52,x, x,x,x, x,x,x)
	.word 0xf47427e5  ! 852: STX_I	stx	%r26, [%r16 + 0x07e5]
	.word 0x8143e02e  ! 854: MEMBAR	membar	#StoreLoad | #LoadStore | #StoreStore | #MemIssue 
	.word 0xbc440011  ! 855: ADDC_R	addc 	%r16, %r17, %r30
	.word 0xae9c28fd  ! 857: XORcc_I	xorcc 	%r16, 0x08fd, %r23
	.word 0xb92c1011  ! 857: SLLX_R	sllx	%r16, %r17, %r28
	.word 0xb0f40011  ! 857: UDIVcc_R	udivcc 	%r16, %r17, %r24
thr2_irf_ce_50:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_50), 16, 16),1,IRF,ce,51,x, x,x,x, x,x,x)
	.word 0xc4342f9f  ! 860: STH_I	sth	%r2, [%r16 + 0x0f9f]
	.word 0xb09c0011  ! 862: XORcc_R	xorcc 	%r16, %r17, %r24
	.word 0x85508000  ! 862: RDPR_TSTATE	rdpr	%tstate, %r2
	.word 0xee2423df  ! 864: STW_I	stw	%r23, [%r16 + 0x03df]
	.word 0x86942b51  ! 866: ORcc_I	orcc 	%r16, 0x0b51, %r3
	.word 0xac440011  ! 866: ADDC_R	addc 	%r16, %r17, %r22
	.word 0xc33c2c56  ! 866: STDF_I	std	%f1, [0x0c56, %r16]
	.word 0x9b7c0411  ! 867: MOVR_R	move	%r16, %r17, %r13
	.word 0x8c142043  ! 869: OR_I	or 	%r16, 0x0043, %r6
	.word 0x84340011  ! 869: ORN_R	orn 	%r16, %r17, %r2
	.word 0x89341011  ! 869: SRLX_R	srlx	%r16, %r17, %r4
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8b3c2001  ! 870: SRA_I	sra 	%r16, 0x0001, %r5
	.word 0xba142329  ! 872: OR_I	or 	%r16, 0x0329, %r29
	.word 0x9a9424c4  ! 872: ORcc_I	orcc 	%r16, 0x04c4, %r13
	.word 0xc36c2210  ! 872: PREFETCH_I	prefetch	[%r16 + 0x0210], #one_read
	.word 0xf4342dd5  ! 874: STH_I	sth	%r26, [%r16 + 0x0dd5]
	.word 0x968429eb  ! 876: ADDcc_I	addcc 	%r16, 0x09eb, %r11
	.word 0x868c2106  ! 876: ANDcc_I	andcc 	%r16, 0x0106, %r3
	.word 0xbb2c2001  ! 876: SLL_I	sll 	%r16, 0x0001, %r29
	.word 0x884c0011  ! 876: MULX_R	mulx 	%r16, %r17, %r4
thr2_irf_ce_51:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_51), 16, 16),1,IRF,ce,34,x, x,x,x, x,x,x)
	.word 0xc42c25c5  ! 879: STB_I	stb	%r2, [%r16 + 0x05c5]
	.word 0xb02c2111  ! 881: ANDN_I	andn 	%r16, 0x0111, %r24
	.word 0x9e542f10  ! 881: UMUL_I	umul 	%r16, 0x0f10, %r15
	.word 0xa4142d07  ! 882: OR_I	or 	%r16, 0x0d07, %r18
	.word 0x943c2082  ! 884: XNOR_I	xnor 	%r16, 0x0082, %r10
	.word 0xb02c0011  ! 884: ANDN_R	andn 	%r16, %r17, %r24
	.word 0x88940011  ! 884: ORcc_R	orcc 	%r16, %r17, %r4
	.word 0x9e740011  ! 884: UDIV_R	udiv 	%r16, %r17, %r15
	.word 0xce2c25f9  ! 886: STB_I	stb	%r7, [%r16 + 0x05f9]
	.word 0x9a9c0011  ! 888: XORcc_R	xorcc 	%r16, %r17, %r13
	.word 0x848c2049  ! 888: ANDcc_I	andcc 	%r16, 0x0049, %r2
	.word 0x10800001  ! 888: BA	ba  	<label_0x1>
thr2_irf_ce_52:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_52), 16, 16),1,IRF,ce,55,x, x,x,x, x,x,x)
	.word 0xf43426cd  ! 891: STH_I	sth	%r26, [%r16 + 0x06cd]
	.word 0x9a1c0011  ! 893: XOR_R	xor 	%r16, %r17, %r13
	.word 0xac2c2c90  ! 893: ANDN_I	andn 	%r16, 0x0c90, %r22
	.word 0xc7240011  ! 893: STF_R	st	%f3, [%r17, %r16]
	.word 0x862c0011  ! 894: ANDN_R	andn 	%r16, %r17, %r3
	.word 0xaf480000  ! 896: RDHPR_HPSTATE	rdhpr	%hpstate, %r23
	.word 0xcc240011  ! 897: STW_R	stw	%r6, [%r16 + %r17]
	.word 0x2e800001  ! 899: BVS	bvs,a	<label_0x1>
	.word 0xd2242181  ! 901: STW_I	stw	%r9, [%r16 + 0x0181]
	.word 0xba3c0011  ! 903: XNOR_R	xnor 	%r16, %r17, %r29
	.word 0x94ac0011  ! 903: ANDNcc_R	andncc 	%r16, %r17, %r10
	.word 0xbc3c25d7  ! 903: XNOR_I	xnor 	%r16, 0x05d7, %r30
	.word 0x8d840011  ! 903: WRFPRS_R	wr	%r16, %r17, %fprs
thr2_irf_ce_53:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_53), 16, 16),1,IRF,ce,13,x, x,x,x, x,x,x)
	.word 0xd2342d85  ! 906: STH_I	sth	%r9, [%r16 + 0x0d85]
	.word 0xbf2c1011  ! 908: SLLX_R	sllx	%r16, %r17, %r31
	.word 0x91343001  ! 908: SRLX_I	srlx	%r16, 0x0001, %r8
	.word 0x81880000  ! 908: SAVED	saved
thr2_irf_ce_54:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_54), 16, 16),1,IRF,ce,54,x, x,x,x, x,x,x)
	.word 0xce2c2fdf  ! 911: STB_I	stb	%r7, [%r16 + 0x0fdf]
	.word 0x989427c8  ! 913: ORcc_I	orcc 	%r16, 0x07c8, %r12
	.word 0x9e9c0011  ! 913: XORcc_R	xorcc 	%r16, %r17, %r15
	.word 0xc3ec2c80  ! 913: PREFETCHA_I	prefetcha	[%r16, + 0x0c80] %asi, #one_read
	.word 0xca740011  ! 914: STX_R	stx	%r5, [%r16 + %r17]
	.word 0xbeb40011  ! 916: ORNcc_R	orncc 	%r16, %r17, %r31
	.word 0xdb3c2db7  ! 916: STDF_I	std	%f13, [0x0db7, %r16]
thr2_irf_ce_55:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_55), 16, 16),1,IRF,ce,43,x, x,x,x, x,x,x)
	.word 0xfe2422e9  ! 919: STW_I	stw	%r31, [%r16 + 0x02e9]
	.word 0x842c2c92  ! 921: ANDN_I	andn 	%r16, 0x0c92, %r2
	.word 0xc6d41011  ! 921: LDSHA_R	ldsha	[%r16, %r17] 0x80, %r3
	.word 0xf6242463  ! 923: STW_I	stw	%r27, [%r16 + 0x0463]
	.word 0x81880000  ! 925: RESTORED	saved
	.word 0xe6340011  ! 926: STH_R	sth	%r19, [%r16 + %r17]
	.word 0x872c3001  ! 928: SLLX_I	sllx	%r16, 0x0001, %r3
	.word 0x90b42782  ! 928: ORNcc_I	orncc 	%r16, 0x0782, %r8
	.word 0xc36c0011  ! 928: PREFETCH_R	prefetch	[%r16 + %r17], #one_read
	.word 0xd2240011  ! 929: STW_R	stw	%r9, [%r16 + %r17]
	.word 0x8e042000  ! 931: ADD_I	add 	%r16, 0x0000, %r7
	.word 0x93343001  ! 931: SRLX_I	srlx	%r16, 0x0001, %r9
	.word 0x840c0011  ! 931: AND_R	and 	%r16, %r17, %r2
	.word 0x81dc2afb  ! 931: FLUSH_I	dis not found

	.word 0xde342431  ! 933: STH_I	sth	%r15, [%r16 + 0x0431]
        wr %g0, 0x4, %fprs
	.word 0xde24289b  ! 937: STW_I	stw	%r15, [%r16 + 0x089b]
	.word 0xbf643801  ! 939: MOVcc_I	<illegal instruction>
	.word 0xa5340011  ! 939: SRL_R	srl 	%r16, %r17, %r18
	.word 0x89e40011  ! 939: SAVE_R	save	%r16, %r17, %r4
	.word 0xca34277f  ! 941: STH_I	sth	%r5, [%r16 + 0x077f]
	.word 0x841c0011  ! 943: XOR_R	xor 	%r16, %r17, %r2
	.word 0xd3240011  ! 943: STF_R	st	%f9, [%r17, %r16]
	.word 0xc4340011  ! 944: STH_R	sth	%r2, [%r16 + %r17]
	.word 0x8a2c2613  ! 946: ANDN_I	andn 	%r16, 0x0613, %r5
	.word 0x9e8c0011  ! 946: ANDcc_R	andcc 	%r16, %r17, %r15
	.word 0x28800003  ! 946: BLEU	bleu,a	<label_0x3>
	.word 0xc6340011  ! 947: STH_R	sth	%r3, [%r16 + %r17]
	.word 0xb93c2001  ! 949: SRA_I	sra 	%r16, 0x0001, %r28
	.word 0xb2040011  ! 949: ADD_R	add 	%r16, %r17, %r25
	.word 0xc3ec2d91  ! 949: PREFETCHA_I	prefetcha	[%r16, + 0x0d91] %asi, #one_read
	.word 0xb1641811  ! 950: MOVcc_R	<illegal instruction>
	.word 0xb0c40011  ! 952: ADDCcc_R	addccc 	%r16, %r17, %r24
	.word 0x917c2401  ! 952: MOVR_I	move	%r16, 0xfffffff8, %r8
	.word 0x95414000  ! 952: RDPC	rd	%pc, %r10
	.word 0xe4242c77  ! 954: STW_I	stw	%r18, [%r16 + 0x0c77]
	.word 0xbc442419  ! 956: ADDC_I	addc 	%r16, 0x0419, %r30
	.word 0xad3c0011  ! 956: SRA_R	sra 	%r16, %r17, %r22
thr2_resum_intr_19:
!$EV trig_pc_d(2,expr(@VA(.MAIN.thr2_resum_intr_19), 16, 16)) -> intp(2, 3, 1)
	wr      %r0, 0x5, %asr26
	.word 0xec740011  ! 957: STX_R	stx	%r22, [%r16 + %r17]
	.word 0x913c2001  ! 959: SRA_I	sra 	%r16, 0x0001, %r8
	.word 0x8a040011  ! 959: ADD_R	add 	%r16, %r17, %r5
	.word 0xf5240011  ! 959: STF_R	st	%f26, [%r17, %r16]
	.word 0x8e9c0011  ! 960: XORcc_R	xorcc 	%r16, %r17, %r7
	.word 0x8a040011  ! 962: ADD_R	add 	%r16, %r17, %r5
	.word 0x85343001  ! 962: SRLX_I	srlx	%r16, 0x0001, %r2
	.word 0x833c1011  ! 962: SRAX_R	srax	%r16, %r17, %r1
        wr %g0, 0x4, %fprs
	.word 0xc2242c9d  ! 964: STW_I	stw	%r1, [%r16 + 0x0c9d]
	.word 0x9e9c0011  ! 966: XORcc_R	xorcc 	%r16, %r17, %r15
	.word 0x8b500000  ! 966: RDPR_TPC	<illegal instruction>
	.word 0xd62c2059  ! 968: STB_I	stb	%r11, [%r16 + 0x0059]
	.word 0x8c340011  ! 970: ORN_R	orn 	%r16, %r17, %r6
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xcc2427d5  ! 972: STW_I	stw	%r6, [%r16 + 0x07d5]
	.word 0x84840011  ! 974: ADDcc_R	addcc 	%r16, %r17, %r2
	.word 0x8b343001  ! 974: SRLX_I	srlx	%r16, 0x0001, %r5
        wr %g0, 0x4, %fprs
thr2_irf_ce_56:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_56), 16, 16),1,IRF,ce,15,x, x,x,x, x,x,x)
	.word 0xce3427b7  ! 977: STH_I	sth	%r7, [%r16 + 0x07b7]
	.word 0xbf343001  ! 979: SRLX_I	srlx	%r16, 0x0001, %r31
	.word 0xbe142766  ! 979: OR_I	or 	%r16, 0x0766, %r31
	.word 0xba8c201b  ! 979: ANDcc_I	andcc 	%r16, 0x001b, %r29
	.word 0x22c40001  ! 979: BRZ	brz,a,nt	%16,<label_0x40001>
thr2_irf_ce_57:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_57), 16, 16),1,IRF,ce,54,x, x,x,x, x,x,x)
	.word 0xe624259d  ! 982: STW_I	stw	%r19, [%r16 + 0x059d]
	.word 0x87343001  ! 984: SRLX_I	srlx	%r16, 0x0001, %r3
	.word 0x9c3c2954  ! 984: XNOR_I	xnor 	%r16, 0x0954, %r14
	.word 0x9c2c2c11  ! 984: ANDN_I	andn 	%r16, 0x0c11, %r14
	.word 0x81dc278e  ! 984: FLUSH_I	dis not found

	.word 0xc4740011  ! 985: STX_R	stx	%r2, [%r16 + %r17]
	.word 0x8284249d  ! 987: ADDcc_I	addcc 	%r16, 0x049d, %r1
        wr %g0, 0x4, %fprs
	.word 0xf42c0011  ! 988: STB_R	stb	%r26, [%r16 + %r17]
	.word 0xa8340011  ! 990: ORN_R	orn 	%r16, %r17, %r20
	.word 0xc4a41011  ! 990: STWA_R	stwa	%r2, [%r16 + %r17] 0x80
	.word 0xee340011  ! 991: STH_R	sth	%r23, [%r16 + %r17]
	.word 0xe6140011  ! 993: LDUH_R	lduh	[%r16 + %r17], %r19
	.word 0x9d3c0011  ! 994: SRA_R	sra 	%r16, %r17, %r14
	.word 0x8f341011  ! 996: SRLX_R	srlx	%r16, %r17, %r7
	.word 0xab342001  ! 996: SRL_I	srl 	%r16, 0x0001, %r21
	.word 0xa57c0411  ! 996: MOVR_R	move	%r16, %r17, %r18
	.word 0xa7a409d1  ! 996: FDIVd	fdivd	%f16, %f48, %f50
thr2_irf_ce_58:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_58), 16, 16),1,IRF,ce,58,x, x,x,x, x,x,x)
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
        setx  0x00000000000009f0, %g1, %r17
        setx  0x499886452cce7653, %g1, %r0
        setx  0xc1dbc372daacd582, %g1, %r1
        setx  0xbdc4f7c0e2ab41fa, %g1, %r2
        setx  0x9c6f6ef01a2f1531, %g1, %r3
        setx  0x85773eca22589e84, %g1, %r4
        setx  0xbf826ef33f6ff958, %g1, %r5
        setx  0xdd766a9b7fc49e30, %g1, %r6
        setx  0xda9e1e8469544017, %g1, %r7
        setx  0xdee0ed84c97dca3c, %g1, %r8
        setx  0x8a858b45c54ed57b, %g1, %r9
        setx  0xd1782657b675c3a6, %g1, %r10
        setx  0xbb70e73dc6b53691, %g1, %r11
        setx  0x9c3c5b99dff20d7c, %g1, %r12
        setx  0xb791a7b01ed2121d, %g1, %r13
        setx  0xe7f5be28dd75523b, %g1, %r14
        setx  0x64bb9bbc6164ef5f, %g1, %r15
        setx  0xc498a5d576eb7706, %g1, %r18
        setx  0x7514fe3ee6868ebc, %g1, %r19
        setx  0x52a2e65a5286d5f6, %g1, %r20
        setx  0xe24b35ccc9597207, %g1, %r21
        setx  0x8cded814e37e1367, %g1, %r22
        setx  0x2c74119ff5dca6a0, %g1, %r23
        setx  0xd245ae39d3b55753, %g1, %r24
        setx  0x7bd1fe5325edec3f, %g1, %r25
        setx  0x873fc6efcbf6bc54, %g1, %r26
        setx  0x106341cb0e56b1a0, %g1, %r27
        setx  0x79c414ab4e5cbd9f, %g1, %r28
        setx  0x82bff53b64dfb341, %g1, %r29
        setx  0xbd0c5dc805b6bf19, %g1, %r30
        setx  0xe4ff6d69310f6dd9, %g1, %r31
	save %r0, %r0, %r31
        setx  MAIN_BASE_DATA_VA, %r1, %r16
        setx  0x0000000000000d70, %g1, %r17
        setx  0xf188d52df69ef7cc, %g1, %r0
        setx  0xb2349cb32c809c69, %g1, %r1
        setx  0xe774e5964d9b8f07, %g1, %r2
        setx  0x4cb9838c5b5049bf, %g1, %r3
        setx  0x9b7712c19c61f2df, %g1, %r4
        setx  0xbdc058c721e337b6, %g1, %r5
        setx  0x9bc6bb6ebf7ff1fa, %g1, %r6
        setx  0x210c240ce2203c76, %g1, %r7
        setx  0x551d7ac4e3148305, %g1, %r8
        setx  0x2045e641cd38a1cf, %g1, %r9
        setx  0x8746f8c80f388a1f, %g1, %r10
        setx  0xb9deb0bc97149312, %g1, %r11
        setx  0x71ed1ed3fcbf1f33, %g1, %r12
        setx  0xa9f3f3f5fa5a6e06, %g1, %r13
        setx  0xd3f69b8e9698dc23, %g1, %r14
        setx  0x2f5266c14b6a7da8, %g1, %r15
        setx  0x808aa854c186ad6c, %g1, %r18
        setx  0xb7126b7384fa785f, %g1, %r19
        setx  0x139dbf1401ac1b4e, %g1, %r20
        setx  0x43b0bcefa83c1514, %g1, %r21
        setx  0xc3c16db9e104d2e6, %g1, %r22
        setx  0x18f6308947255678, %g1, %r23
        setx  0xc2971b86da55d086, %g1, %r24
        setx  0x7bea26ff09dddaf9, %g1, %r25
        setx  0x7edfdb7faa409601, %g1, %r26
        setx  0x1e38fa9c63cbdfa8, %g1, %r27
        setx  0x2baf3f8787788a90, %g1, %r28
        setx  0x04a6c61161c5ecd3, %g1, %r29
        setx  0x3d821bb7073b8666, %g1, %r30
        setx  0xc3f0ce5d8391e590, %g1, %r31
	save %r0, %r0, %r31
        setx  MAIN_BASE_DATA_VA, %r1, %r16
        setx  0x0000000000000a50, %g1, %r17
        setx  0x618adcc769125409, %g1, %r0
        setx  0x33e39121e76d04ee, %g1, %r1
        setx  0xc0eec464cdc89160, %g1, %r2
        setx  0x5abce1b5dd0865d4, %g1, %r3
        setx  0x01da041909d0e559, %g1, %r4
        setx  0xd054060adf9b4ace, %g1, %r5
        setx  0xdf5160f53d8a1e9e, %g1, %r6
        setx  0x585ba5900543ae2a, %g1, %r7
        setx  0x85a801fc2f261d9c, %g1, %r8
        setx  0x59ae91ae6bc27c5b, %g1, %r9
        setx  0x2d6bc2758be24563, %g1, %r10
        setx  0x15423873b53d2f3a, %g1, %r11
        setx  0x4612f730e60e0b8d, %g1, %r12
        setx  0xff90723576a11aba, %g1, %r13
        setx  0x2519e5ecb4d53f6e, %g1, %r14
        setx  0x02c501b7a79b7e3e, %g1, %r15
        setx  0x84dc36a776e92518, %g1, %r18
        setx  0x49ea73b9ecdfcf46, %g1, %r19
        setx  0x858a539e349cc0e2, %g1, %r20
        setx  0x2b7f9d03a95f1518, %g1, %r21
        setx  0x3936e6a87fd51993, %g1, %r22
        setx  0x91ccc80e8ad3c265, %g1, %r23
        setx  0x18b0c3fb5707e899, %g1, %r24
        setx  0xbb20399d88e107a9, %g1, %r25
        setx  0xc2bc287179a275c4, %g1, %r26
        setx  0x68a5f961dd23dfd3, %g1, %r27
        setx  0xf8f74b38eb1e5d78, %g1, %r28
        setx  0xc47dd0451e219b9f, %g1, %r29
        setx  0x6f03b4c50a931c88, %g1, %r30
        setx  0x94abd9e430eda9aa, %g1, %r31
	save %r0, %r0, %r31
        setx  MAIN_BASE_DATA_VA, %r1, %r16
        setx  0x0000000000000430, %g1, %r17
        setx  0x097145d4f63f68b4, %g1, %r0
        setx  0x9e66bb00461dd492, %g1, %r1
        setx  0x6db9e9572d7cc6ea, %g1, %r2
        setx  0x22a536c0c887a63d, %g1, %r3
        setx  0x4286603290eb94c3, %g1, %r4
        setx  0xaefd647b05162c40, %g1, %r5
        setx  0x2a140e0784bc3dd1, %g1, %r6
        setx  0x45522f52e6b539f9, %g1, %r7
        setx  0xdab7dd8b75339b3d, %g1, %r8
        setx  0x349657f4a2fd65fc, %g1, %r9
        setx  0xbc561c3e42f5648b, %g1, %r10
        setx  0x9c1f4c53fe4d9060, %g1, %r11
        setx  0x72777d46ea389b32, %g1, %r12
        setx  0xafc5ed638c266c0a, %g1, %r13
        setx  0xbd33b200202329a1, %g1, %r14
        setx  0x7e210a1ae0867cee, %g1, %r15
        setx  0x353ea9687ecf4bf4, %g1, %r18
        setx  0x428d4c58f4853090, %g1, %r19
        setx  0xef2663387c6fc898, %g1, %r20
        setx  0x1566afd3aa1b06f0, %g1, %r21
        setx  0xd4eb845f23190067, %g1, %r22
        setx  0xcb9edf32c561e916, %g1, %r23
        setx  0xe7505036797c526b, %g1, %r24
        setx  0xcba11ca0eae2f1d8, %g1, %r25
        setx  0x879df0a640bbba3d, %g1, %r26
        setx  0x01c1e2385d077b10, %g1, %r27
        setx  0x2a31d1010a092901, %g1, %r28
        setx  0xca201a667f28760f, %g1, %r29
        setx  0x6c875bf34f6157cb, %g1, %r30
        setx  0x5b046c796df5dc6b, %g1, %r31
	save %r0, %r0, %r31
        setx  MAIN_BASE_DATA_VA, %r1, %r16
        setx  0x0000000000000700, %g1, %r17
        setx  0xfaf5ec47418ed3b1, %g1, %r0
        setx  0xf95ea71c5a61dc9f, %g1, %r1
        setx  0x8259e50822a48bfb, %g1, %r2
        setx  0x61dae9af69edd06c, %g1, %r3
        setx  0x2907acb4da2b0b47, %g1, %r4
        setx  0xa38a52aca510e7a4, %g1, %r5
        setx  0xf4b70a36b9cd4f9b, %g1, %r6
        setx  0xec31387e3cf2ce01, %g1, %r7
        setx  0x5140d453f0c7ad5b, %g1, %r8
        setx  0xbcb692d2a17d3e30, %g1, %r9
        setx  0x99c7d27065fd4c30, %g1, %r10
        setx  0x1f14012939547418, %g1, %r11
        setx  0x2d1be311fadd6238, %g1, %r12
        setx  0xb712d349786d1151, %g1, %r13
        setx  0xdbef983232e4f20b, %g1, %r14
        setx  0xeef6edc87cc5d9fd, %g1, %r15
        setx  0xeed057407b99082b, %g1, %r18
        setx  0x8355074f8eed363b, %g1, %r19
        setx  0xc1ba6c8ce0e53574, %g1, %r20
        setx  0x63368ff54cd6f8d0, %g1, %r21
        setx  0x37701967f6f07ff5, %g1, %r22
        setx  0xcaa89954eabc999f, %g1, %r23
        setx  0x594c3462f46cde67, %g1, %r24
        setx  0x04368bf6580bdc54, %g1, %r25
        setx  0x1fa668ca3531d646, %g1, %r26
        setx  0xcd3f2d7c4ee3dfd6, %g1, %r27
        setx  0xa06733ecdb46efd1, %g1, %r28
        setx  0x5e1312d85ecc0847, %g1, %r29
        setx  0xa912a78e3c1de9a2, %g1, %r30
        setx  0x0da3e820d9b19807, %g1, %r31
	save %r0, %r0, %r31
        setx  MAIN_BASE_DATA_VA, %r1, %r16
        setx  0x0000000000000bc0, %g1, %r17
        setx  0x7c0a3d3dd6d4f1ba, %g1, %r0
        setx  0xd51b7b72981602dd, %g1, %r1
        setx  0x24a0f89433f6c694, %g1, %r2
        setx  0x6774c13e9046f024, %g1, %r3
        setx  0x0b2904d5febcc8f6, %g1, %r4
        setx  0x3817a3603bce9a8e, %g1, %r5
        setx  0x54dc2b3ef472a420, %g1, %r6
        setx  0xb599e50b9340c304, %g1, %r7
        setx  0xc4f227fa15d4a222, %g1, %r8
        setx  0x684e07a0a56f8d10, %g1, %r9
        setx  0x5845a70532ec37a1, %g1, %r10
        setx  0x9314d41d5aa7fb7e, %g1, %r11
        setx  0x3e93a6d4c8335b4f, %g1, %r12
        setx  0xa9e2befd85cd87d6, %g1, %r13
        setx  0x54a15e48e03187c8, %g1, %r14
        setx  0xc5c2cc269bae34aa, %g1, %r15
        setx  0xd9a2bda844f3cba4, %g1, %r18
        setx  0x56a1cd7340649d1c, %g1, %r19
        setx  0x4fdb39be9f0b4473, %g1, %r20
        setx  0x57bf3aaaef235b29, %g1, %r21
        setx  0x4a44495eee075e2f, %g1, %r22
        setx  0xcc1f8c0b72965351, %g1, %r23
        setx  0xb67f3e35174dc2b7, %g1, %r24
        setx  0x9785142f644c3c58, %g1, %r25
        setx  0x7a632f592cc7aebc, %g1, %r26
        setx  0x851ac1d8392b1383, %g1, %r27
        setx  0xe9f88241a8765a75, %g1, %r28
        setx  0x2d22bc84ffe3b515, %g1, %r29
        setx  0x7d0bcc5a9fc88f4b, %g1, %r30
        setx  0x7b0da641a25ecdf0, %g1, %r31
	save %r0, %r0, %r31
        setx  MAIN_BASE_DATA_VA, %r1, %r16
        setx  0x0000000000000ad0, %g1, %r17
        setx  0x7790309520720b11, %g1, %r0
        setx  0x00cec8225165e5cf, %g1, %r1
        setx  0xffb01632064b1bbc, %g1, %r2
        setx  0x60af13be1ba09c06, %g1, %r3
        setx  0x06db67f1cce4aa9f, %g1, %r4
        setx  0xc04ce69d67c91d5c, %g1, %r5
        setx  0x2ebb2ee8bfc0af14, %g1, %r6
        setx  0x2b030cdd79d0204f, %g1, %r7
        setx  0x3d712c9ec4967b48, %g1, %r8
        setx  0x8b267080af7a0df1, %g1, %r9
        setx  0x9d30e6536879aa65, %g1, %r10
        setx  0xd83d1aa423181886, %g1, %r11
        setx  0x1c4498fea6c14df3, %g1, %r12
        setx  0xbf214c4ef3c0aeca, %g1, %r13
        setx  0x03fa1478cdd6b963, %g1, %r14
        setx  0x4b0466d6a02e380c, %g1, %r15
        setx  0x9c9ca00d2d24b751, %g1, %r18
        setx  0xcccce845a145bef7, %g1, %r19
        setx  0x7236d3e220833185, %g1, %r20
        setx  0x0b707d7b40085bfd, %g1, %r21
        setx  0xcda29ca3b5e8df00, %g1, %r22
        setx  0x09ce592e8dcd4a22, %g1, %r23
        setx  0x8f51e54f96bf0a8e, %g1, %r24
        setx  0xb1de78923a917487, %g1, %r25
        setx  0x6c4e4d9d99f766bd, %g1, %r26
        setx  0x6b1c5f2ce609b2e3, %g1, %r27
        setx  0xf2831b7f0f5a812e, %g1, %r28
        setx  0xaef5f896212a4bb1, %g1, %r29
        setx  0xe65ea2b342709f2d, %g1, %r30
        setx  0xe972a1baf5888fbe, %g1, %r31
	save %r0, %r0, %r31
        setx  MAIN_BASE_DATA_VA, %r1, %r16
        setx  0x0000000000000e20, %g1, %r17
        setx  0xc3907b5a3b3c03b6, %g1, %r0
        setx  0xab901705f14e4a55, %g1, %r1
        setx  0x119f47611111626b, %g1, %r2
        setx  0x4c80a198baf69628, %g1, %r3
        setx  0x47fd62230fdb3b27, %g1, %r4
        setx  0xef8449d6c9648a84, %g1, %r5
        setx  0x04d4f507c8026bbd, %g1, %r6
        setx  0xb9490a95da914c25, %g1, %r7
        setx  0xbea4c70b2f5a1f5b, %g1, %r8
        setx  0x23d7c125b29a7000, %g1, %r9
        setx  0x59439583d5b5c1be, %g1, %r10
        setx  0x6cb0982461c93437, %g1, %r11
        setx  0x97db201f709e3e19, %g1, %r12
        setx  0x96f5a3ad3cc53e84, %g1, %r13
        setx  0x022d69e463b5cc39, %g1, %r14
        setx  0xd5b2960df12a63e3, %g1, %r15
        setx  0x210c7f69deeee71f, %g1, %r18
        setx  0x1eeea95de28cffed, %g1, %r19
        setx  0x8d688e094946e752, %g1, %r20
        setx  0xc131e7171663f258, %g1, %r21
        setx  0x40ac1c5d06c06a82, %g1, %r22
        setx  0x6adde208ab6251c7, %g1, %r23
        setx  0x900dbe48d83f91c2, %g1, %r24
        setx  0x51538edacfee0dbd, %g1, %r25
        setx  0xa21b936ba647cd48, %g1, %r26
        setx  0x50dea1060322e6c1, %g1, %r27
        setx  0xe4eaa5ba3155d1a0, %g1, %r28
        setx  0x5d185f9b77be9e5a, %g1, %r29
        setx  0xa6fa5b4aa849a531, %g1, %r30
        setx  0xa7527164f5c77e32, %g1, %r31
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
	.word 0x9cb42370  ! 0: ORNcc_I	orncc 	%r16, 0x0370, %r14
	.word 0x9e040011  ! 2: ADD_R	add 	%r16, %r17, %r15
	.word 0x86840011  ! 2: ADDcc_R	addcc 	%r16, %r17, %r3
	.word 0xf44c2f5a  ! 2: LDSB_I	ldsb	[%r16 + 0x0f5a], %r26
	.word 0xce240011  ! 3: STW_R	stw	%r7, [%r16 + %r17]
	.word 0x86442a18  ! 5: ADDC_I	addc 	%r16, 0x0a18, %r3
	.word 0x9f51c000  ! 5: RDPR_TL	rdpr	%tl, %r15
	.word 0xca74284d  ! 7: STX_I	stx	%r5, [%r16 + 0x084d]
	.word 0xa8042d2e  ! 9: ADD_I	add 	%r16, 0x0d2e, %r20
	.word 0x889c0011  ! 9: XORcc_R	xorcc 	%r16, %r17, %r4
	.word 0x9b3c1011  ! 9: SRAX_R	srax	%r16, %r17, %r13
	.word 0xc36c2f1f  ! 9: PREFETCH_I	prefetch	[%r16 + 0x0f1f], #one_read
	.word 0x8a140011  ! 10: OR_R	or 	%r16, %r17, %r5
	.word 0x941c24cd  ! 12: XOR_I	xor 	%r16, 0x04cd, %r10
	.word 0xbe942060  ! 12: ORcc_I	orcc 	%r16, 0x0060, %r31
	.word 0x86ac0011  ! 12: ANDNcc_R	andncc 	%r16, %r17, %r3
	.word 0xc36c21f9  ! 12: PREFETCH_I	prefetch	[%r16 + 0x01f9], #one_read
	.word 0xea2c2f6d  ! 14: STB_I	stb	%r21, [%r16 + 0x0f6d]
	.word 0xd09c1011  ! 16: LDDA_R	ldda	[%r16, %r17] 0x80, %r8
	.word 0xf6340011  ! 17: STH_R	sth	%r27, [%r16 + %r17]
	.word 0x93abc831  ! 19: FMOVVC	fmovs	%fcc1, %f17, %f9
	.word 0xb8a42fb7  ! 20: SUBcc_I	subcc 	%r16, 0x0fb7, %r28
	.word 0x92ac0011  ! 22: ANDNcc_R	andncc 	%r16, %r17, %r9
	.word 0xae840011  ! 22: ADDcc_R	addcc 	%r16, %r17, %r23
	.word 0xb23c0011  ! 22: XNOR_R	xnor 	%r16, %r17, %r25
	.word 0x91514000  ! 22: RDPR_TBA	rdpr	%tba, %r8
	.word 0xd22c2bbb  ! 24: STB_I	stb	%r9, [%r16 + 0x0bbb]
	.word 0x8cbc0011  ! 26: XNORcc_R	xnorcc 	%r16, %r17, %r6
	.word 0x91641811  ! 26: MOVcc_R	<illegal instruction>
	.word 0xb0bc2318  ! 26: XNORcc_I	xnorcc 	%r16, 0x0318, %r24
	.word 0xd4a4290e  ! 26: STWA_I	stwa	%r10, [%r16 + 0x090e] %asi
	.word 0x88b40011  ! 27: ORNcc_R	orncc 	%r16, %r17, %r4
	.word 0xb32c1011  ! 29: SLLX_R	sllx	%r16, %r17, %r25
thr1_resum_intr_0:
!$EV trig_pc_d(1,expr(@VA(.MAIN.thr1_resum_intr_0), 16, 16)) -> intp(1, 3, 1)
	wr      %r0, 0x5, %asr26
	.word 0xd0240011  ! 30: STW_R	stw	%r8, [%r16 + %r17]
	.word 0x852c0011  ! 32: SLL_R	sll 	%r16, %r17, %r2
	.word 0x94040011  ! 32: ADD_R	add 	%r16, %r17, %r10
	.word 0x969c0011  ! 32: XORcc_R	xorcc 	%r16, %r17, %r11
	.word 0x8143c000  ! 32: STBAR	stbar
thr1_irf_ce_0:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_0), 16, 16),1,IRF,ce,68,x, x,x,x, x,x,x)
	.word 0xde742383  ! 35: STX_I	stx	%r15, [%r16 + 0x0383]
	.word 0x82342ab4  ! 37: ORN_I	orn 	%r16, 0x0ab4, %r1
thr1_resum_intr_1:
!$EV trig_pc_d(1,expr(@VA(.MAIN.thr1_resum_intr_1), 16, 16)) -> intp(1, 3, 1)
	wr      %r0, 0x5, %asr26
	.word 0xa494270b  ! 38: ORcc_I	orcc 	%r16, 0x070b, %r18
	.word 0xa85c0011  ! 40: SMUL_R	smul 	%r16, %r17, %r20
	.word 0xc6240011  ! 41: STW_R	stw	%r3, [%r16 + %r17]
	.word 0x832c1011  ! 43: SLLX_R	sllx	%r16, %r17, %r1
	.word 0x9e3c0011  ! 43: XNOR_R	xnor 	%r16, %r17, %r15
	.word 0x8143c000  ! 43: STBAR	stbar
	.word 0xd2240011  ! 44: STW_R	stw	%r9, [%r16 + %r17]
	.word 0x8f7c2401  ! 46: MOVR_I	move	%r16, 0xfffffff8, %r7
	.word 0x8c142d46  ! 46: OR_I	or 	%r16, 0x0d46, %r6
	.word 0x9a4429b0  ! 46: ADDC_I	addc 	%r16, 0x09b0, %r13
	.word 0x87ac0a51  ! 46: FCMPd	fcmpd	%fcc<n>, %f16, %f48
	.word 0xd8240011  ! 47: STW_R	stw	%r12, [%r16 + %r17]
	.word 0x83641811  ! 49: MOVcc_R	<illegal instruction>
	.word 0x94bc0011  ! 49: XNORcc_R	xnorcc 	%r16, %r17, %r10
        wr %g0, 0x4, %fprs
	.word 0x9c342218  ! 50: ORN_I	orn 	%r16, 0x0218, %r14
	.word 0xae8c2504  ! 52: ANDcc_I	andcc 	%r16, 0x0504, %r23
	.word 0xab3c2001  ! 52: SRA_I	sra 	%r16, 0x0001, %r21
	.word 0xe844253f  ! 52: LDSW_I	ldsw	[%r16 + 0x053f], %r20
	.word 0xca340011  ! 53: STH_R	sth	%r5, [%r16 + %r17]
	.word 0xbc042e2d  ! 55: ADD_I	add 	%r16, 0x0e2d, %r30
	.word 0x84b42b19  ! 55: ORNcc_I	orncc 	%r16, 0x0b19, %r2
	.word 0x1a800003  ! 55: BCC	bcc  	<label_0x3>
	.word 0xee242173  ! 57: STW_I	stw	%r23, [%r16 + 0x0173]
	.word 0xa8ac2df8  ! 59: ANDNcc_I	andncc 	%r16, 0x0df8, %r20
	.word 0x86c40011  ! 59: ADDCcc_R	addccc 	%r16, %r17, %r3
	.word 0x820c220b  ! 59: AND_I	and 	%r16, 0x020b, %r1
	.word 0xccd41011  ! 59: LDSHA_R	ldsha	[%r16, %r17] 0x80, %r6
	.word 0xcc342763  ! 61: STH_I	sth	%r6, [%r16 + 0x0763]
	.word 0x83341011  ! 63: SRLX_R	srlx	%r16, %r17, %r1
	.word 0x87514000  ! 63: RDPR_TBA	<illegal instruction>
	.word 0xce740011  ! 64: STX_R	stx	%r7, [%r16 + %r17]
	.word 0x8e0c2903  ! 66: AND_I	and 	%r16, 0x0903, %r7
	.word 0x9cac2020  ! 66: ANDNcc_I	andncc 	%r16, 0x0020, %r14
	.word 0x81580000  ! 66: FLUSHW	flushw
	.word 0x9b2c0011  ! 67: SLL_R	sll 	%r16, %r17, %r13
	.word 0xbb2c0011  ! 69: SLL_R	sll 	%r16, %r17, %r29
	.word 0xbb342001  ! 69: SRL_I	srl 	%r16, 0x0001, %r29
	ta	T_CHANGE_PRIV	! macro
	.word 0xea240011  ! 70: STW_R	stw	%r21, [%r16 + %r17]
	.word 0x30800003  ! 72: BA	ba,a	<label_0x3>
	.word 0xc22c0011  ! 73: STB_R	stb	%r1, [%r16 + %r17]
	.word 0xbc8c0011  ! 75: ANDcc_R	andcc 	%r16, %r17, %r30
	.word 0x81dc2449  ! 75: FLUSH_I	dis not found

	.word 0x8ebc2e6e  ! 76: XNORcc_I	xnorcc 	%r16, 0x0e6e, %r7
	.word 0x873c2001  ! 78: SRA_I	sra 	%r16, 0x0001, %r3
	.word 0xc36c0011  ! 78: PREFETCH_R	prefetch	[%r16 + %r17], #one_read
thr1_irf_ce_1:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_1), 16, 16),1,IRF,ce,57,x, x,x,x, x,x,x)
	.word 0xfa24208d  ! 81: STW_I	stw	%r29, [%r16 + 0x008d]
	.word 0x2e800003  ! 83: BVS	bvs,a	<label_0x3>
	.word 0xaa142080  ! 84: OR_I	or 	%r16, 0x0080, %r21
	.word 0x84940011  ! 86: ORcc_R	orcc 	%r16, %r17, %r2
	.word 0xeeb41011  ! 86: STHA_R	stha	%r23, [%r16 + %r17] 0x80
	.word 0xfa740011  ! 87: STX_R	stx	%r29, [%r16 + %r17]
	.word 0x943c2f40  ! 89: XNOR_I	xnor 	%r16, 0x0f40, %r10
	.word 0xfcf41011  ! 89: STXA_R	stxa	%r30, [%r16 + %r17] 0x80
	.word 0x988c2226  ! 90: ANDcc_I	andcc 	%r16, 0x0226, %r12
	.word 0x8143c000  ! 92: STBAR	stbar
	.word 0xde240011  ! 93: STW_R	stw	%r15, [%r16 + %r17]
	.word 0xae942599  ! 95: ORcc_I	orcc 	%r16, 0x0599, %r23
	.word 0x96840011  ! 95: ADDcc_R	addcc 	%r16, %r17, %r11
	.word 0x99643801  ! 95: MOVcc_I	<illegal instruction>
	.word 0x81880000  ! 95: RESTORED	saved
	.word 0x8c140011  ! 96: OR_R	or 	%r16, %r17, %r6
	.word 0xb45c2dc8  ! 98: SMUL_I	smul 	%r16, 0x0dc8, %r26
	.word 0xd6342f47  ! 100: STH_I	sth	%r11, [%r16 + 0x0f47]
	.word 0x8d2c3001  ! 102: SLLX_I	sllx	%r16, 0x0001, %r6
	.word 0xd01c27bd  ! 102: LDD_I	ldd	[%r16 + 0x07bd], %r8
	.word 0xc6342bbb  ! 104: STH_I	sth	%r3, [%r16 + 0x0bbb]
	.word 0xc3ec1011  ! 106: PREFETCHA_R	prefetcha	[%r16, %r17] 0x80, #one_read
thr1_irf_ce_2:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_2), 16, 16),1,IRF,ce,33,x, x,x,x, x,x,x)
	.word 0xc62c23d5  ! 109: STB_I	stb	%r3, [%r16 + 0x03d5]
	.word 0x9c8c2b30  ! 111: ANDcc_I	andcc 	%r16, 0x0b30, %r14
	.word 0x88042844  ! 111: ADD_I	add 	%r16, 0x0844, %r4
	.word 0xea942809  ! 111: LDUHA_I	lduha	[%r16, + 0x0809] %asi, %r21
	.word 0xd6340011  ! 112: STH_R	sth	%r11, [%r16 + %r17]
	.word 0x863422c5  ! 114: ORN_I	orn 	%r16, 0x02c5, %r3
	.word 0x98042033  ! 114: ADD_I	add 	%r16, 0x0033, %r12
	.word 0xcccc227c  ! 114: LDSBA_I	ldsba	[%r16, + 0x027c] %asi, %r6
	.word 0xf2240011  ! 115: STW_R	stw	%r25, [%r16 + %r17]
	.word 0x8143e070  ! 117: MEMBAR	membar	#Lookaside | #MemIssue | #Sync 
	.word 0xf6740011  ! 118: STX_R	stx	%r27, [%r16 + %r17]
	.word 0x832c0011  ! 120: SLL_R	sll 	%r16, %r17, %r1
	.word 0x89e40011  ! 120: SAVE_R	save	%r16, %r17, %r4
	.word 0xc8240011  ! 121: STW_R	stw	%r4, [%r16 + %r17]
	.word 0xb0c40011  ! 123: ADDCcc_R	addccc 	%r16, %r17, %r24
	.word 0xaf3c1011  ! 123: SRAX_R	srax	%r16, %r17, %r23
        wr %g0, 0x4, %fprs
	.word 0xe62c250b  ! 125: STB_I	stb	%r19, [%r16 + 0x050b]
	.word 0x8c3420c1  ! 127: ORN_I	orn 	%r16, 0x00c1, %r6
	.word 0x9e3c0011  ! 127: XNOR_R	xnor 	%r16, %r17, %r15
	.word 0x81dc0011  ! 127: FLUSH_R	dis not found

thr1_irf_ce_3:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_3), 16, 16),1,IRF,ce,4,x, x,x,x, x,x,x)
	.word 0xcc242915  ! 130: STW_I	stw	%r6, [%r16 + 0x0915]
	.word 0xa7341011  ! 132: SRLX_R	srlx	%r16, %r17, %r19
	.word 0xf0dc2cfa  ! 132: LDXA_I	ldxa	[%r16, + 0x0cfa] %asi, %r24
	.word 0xdc2c0011  ! 133: STB_R	stb	%r14, [%r16 + %r17]
	.word 0xfc842c67  ! 135: LDUWA_I	lduwa	[%r16, + 0x0c67] %asi, %r30
thr1_irf_ce_4:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_4), 16, 16),1,IRF,ce,57,x, x,x,x, x,x,x)
	.word 0xc47424f5  ! 138: STX_I	stx	%r2, [%r16 + 0x04f5]
	.word 0xaabc0011  ! 140: XNORcc_R	xnorcc 	%r16, %r17, %r21
	.word 0x8e8c211a  ! 140: ANDcc_I	andcc 	%r16, 0x011a, %r7
	.word 0x933c0011  ! 140: SRA_R	sra 	%r16, %r17, %r9
	.word 0x8a4c2fc8  ! 140: MULX_I	mulx 	%r16, 0x0fc8, %r5
	.word 0xca740011  ! 141: STX_R	stx	%r5, [%r16 + %r17]
	.word 0x92ac2dcf  ! 143: ANDNcc_I	andncc 	%r16, 0x0dcf, %r9
	.word 0xb13c1011  ! 143: SRAX_R	srax	%r16, %r17, %r24
	.word 0x95a019b1  ! 143: FsTOq	dis not found

	.word 0xea2c0011  ! 144: STB_R	stb	%r21, [%r16 + %r17]
	.word 0x9ebc2adc  ! 146: XNORcc_I	xnorcc 	%r16, 0x0adc, %r15
	.word 0x903c2742  ! 146: XNOR_I	xnor 	%r16, 0x0742, %r8
	.word 0x91340011  ! 146: SRL_R	srl 	%r16, %r17, %r8
	.word 0x40000001  ! 146: CALL	call	disp30_1
	.word 0xcc2427c1  ! 148: STW_I	stw	%r6, [%r16 + 0x07c1]
	.word 0x8c8429b5  ! 150: ADDcc_I	addcc 	%r16, 0x09b5, %r6
	.word 0xdef41011  ! 150: STXA_R	stxa	%r15, [%r16 + %r17] 0x80
	.word 0xca240011  ! 151: STW_R	stw	%r5, [%r16 + %r17]
	.word 0x82bc0011  ! 153: XNORcc_R	xnorcc 	%r16, %r17, %r1
	ta	T_CHANGE_PRIV	! macro
	.word 0xc2740011  ! 154: STX_R	stx	%r1, [%r16 + %r17]
	.word 0x8d3c1011  ! 156: SRAX_R	srax	%r16, %r17, %r6
	.word 0x8f2c1011  ! 156: SLLX_R	sllx	%r16, %r17, %r7
thr1_resum_intr_2:
!$EV trig_pc_d(1,expr(@VA(.MAIN.thr1_resum_intr_2), 16, 16)) -> intp(1, 3, 1)
	wr      %r0, 0x5, %asr26
	.word 0xd4742111  ! 158: STX_I	stx	%r10, [%r16 + 0x0111]
	.word 0x913c0011  ! 160: SRA_R	sra 	%r16, %r17, %r8
	.word 0x87340011  ! 160: SRL_R	srl 	%r16, %r17, %r3
	.word 0xd08c2453  ! 160: LDUBA_I	lduba	[%r16, + 0x0453] %asi, %r8
	.word 0xc22c0011  ! 161: STB_R	stb	%r1, [%r16 + %r17]
	.word 0xde0c28b0  ! 163: LDUB_I	ldub	[%r16 + 0x08b0], %r15
	.word 0x932c3001  ! 164: SLLX_I	sllx	%r16, 0x0001, %r9
	.word 0x81dc2cd7  ! 166: FLUSH_I	dis not found

	.word 0xcc34273f  ! 168: STH_I	sth	%r6, [%r16 + 0x073f]
        wr %g0, 0x4, %fprs
	.word 0xcc342677  ! 172: STH_I	sth	%r6, [%r16 + 0x0677]
	.word 0xc3242646  ! 174: STF_I	st	%f1, [0x0646, %r16]
	.word 0xd22c0011  ! 175: STB_R	stb	%r9, [%r16 + %r17]
	.word 0x873c2001  ! 177: SRA_I	sra 	%r16, 0x0001, %r3
	.word 0x948c2b07  ! 177: ANDcc_I	andcc 	%r16, 0x0b07, %r10
        wr %g0, 0x4, %fprs
thr1_irf_ce_5:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_5), 16, 16),1,IRF,ce,41,x, x,x,x, x,x,x)
	.word 0xec2c2653  ! 180: STB_I	stb	%r22, [%r16 + 0x0653]
	.word 0xb6340011  ! 182: ORN_R	orn 	%r16, %r17, %r27
	.word 0x81dc223c  ! 182: FLUSH_I	dis not found

thr1_irf_ce_6:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_6), 16, 16),1,IRF,ce,1,x, x,x,x, x,x,x)
	.word 0xd22c2aef  ! 185: STB_I	stb	%r9, [%r16 + 0x0aef]
	.word 0x8143c000  ! 187: STBAR	stbar
	.word 0xd2242a8b  ! 189: STW_I	stw	%r9, [%r16 + 0x0a8b]
	.word 0x84040011  ! 191: ADD_R	add 	%r16, %r17, %r2
	.word 0xa6bc2f3e  ! 191: XNORcc_I	xnorcc 	%r16, 0x0f3e, %r19
	.word 0xa57c2401  ! 191: MOVR_I	move	%r16, 0xfffffff8, %r18
	.word 0x8143e06c  ! 191: MEMBAR	membar	#LoadStore | #StoreStore | #MemIssue | #Sync 
	.word 0xcc2c0011  ! 192: STB_R	stb	%r6, [%r16 + %r17]
	.word 0x893c1011  ! 194: SRAX_R	srax	%r16, %r17, %r4
	.word 0xac1c0011  ! 194: XOR_R	xor 	%r16, %r17, %r22
	.word 0x9d342001  ! 194: SRL_I	srl 	%r16, 0x0001, %r14
thr1_resum_intr_3:
!$EV trig_pc_d(1,expr(@VA(.MAIN.thr1_resum_intr_3), 16, 16)) -> intp(1, 3, 1)
	wr      %r0, 0x5, %asr26
thr1_irf_ce_7:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_7), 16, 16),1,IRF,ce,4,x, x,x,x, x,x,x)
	.word 0xd63427b3  ! 197: STH_I	sth	%r11, [%r16 + 0x07b3]
	.word 0xbd341011  ! 199: SRLX_R	srlx	%r16, %r17, %r30
	.word 0x940c25f3  ! 199: AND_I	and 	%r16, 0x05f3, %r10
	.word 0x825420a9  ! 199: UMUL_I	umul 	%r16, 0x00a9, %r1
	.word 0x82842825  ! 200: ADDcc_I	addcc 	%r16, 0x0825, %r1
	.word 0xd32420c0  ! 202: STF_I	st	%f9, [0x00c0, %r16]
	.word 0xac340011  ! 203: ORN_R	orn 	%r16, %r17, %r22
	.word 0x97641811  ! 205: MOVcc_R	<illegal instruction>
	.word 0xb8442643  ! 205: ADDC_I	addc 	%r16, 0x0643, %r28
	.word 0x9e7c0011  ! 205: SDIV_R	sdiv 	%r16, %r17, %r15
	.word 0xde740011  ! 206: STX_R	stx	%r15, [%r16 + %r17]
	.word 0x923c0011  ! 208: XNOR_R	xnor 	%r16, %r17, %r9
	.word 0xbc9c244b  ! 208: XORcc_I	xorcc 	%r16, 0x044b, %r30
	.word 0x9f3c1011  ! 208: SRAX_R	srax	%r16, %r17, %r15
	.word 0xc67c0011  ! 208: SWAP_R	swap	%r3, [%r16 + %r17]
	.word 0x96240011  ! 209: SUB_R	sub 	%r16, %r17, %r11
	.word 0x8143e014  ! 211: MEMBAR	membar	#LoadStore | #Lookaside 
	.word 0xcc2c2459  ! 213: STB_I	stb	%r6, [%r16 + 0x0459]
	.word 0xbc0c0011  ! 215: AND_R	and 	%r16, %r17, %r30
	.word 0x857c0411  ! 215: MOVR_R	move	%r16, %r17, %r2
	.word 0x8143e02a  ! 215: MEMBAR	membar	#StoreLoad | #StoreStore | #MemIssue 
	.word 0xe8340011  ! 216: STH_R	sth	%r20, [%r16 + %r17]
	.word 0xaa140011  ! 218: OR_R	or 	%r16, %r17, %r21
	.word 0xb7ec0011  ! 218: RESTORE_R	restore	%r16, %r17, %r27
	.word 0xc8340011  ! 219: STH_R	sth	%r4, [%r16 + %r17]
	.word 0x9e442884  ! 221: ADDC_I	addc 	%r16, 0x0884, %r15
	.word 0x9204204c  ! 221: ADD_I	add 	%r16, 0x004c, %r9
	.word 0x9c840011  ! 221: ADDcc_R	addcc 	%r16, %r17, %r14
	.word 0x81dc2934  ! 221: FLUSH_I	dis not found

	.word 0xd2240011  ! 222: STW_R	stw	%r9, [%r16 + %r17]
	.word 0x9a3c0011  ! 224: XNOR_R	xnor 	%r16, %r17, %r13
	.word 0xbb2c1011  ! 224: SLLX_R	sllx	%r16, %r17, %r29
	.word 0xec5c0011  ! 224: LDX_R	ldx	[%r16 + %r17], %r22
	.word 0xd0740011  ! 225: STX_R	stx	%r8, [%r16 + %r17]
thr1_resum_intr_4:
!$EV trig_pc_d(1,expr(@VA(.MAIN.thr1_resum_intr_4), 16, 16)) -> intp(1, 3, 1)
	wr      %r0, 0x5, %asr26
	.word 0xee342db1  ! 229: STH_I	sth	%r23, [%r16 + 0x0db1]
	.word 0xad641811  ! 231: MOVcc_R	<illegal instruction>
	.word 0x84142968  ! 231: OR_I	or 	%r16, 0x0968, %r2
	.word 0x96ac0011  ! 231: ANDNcc_R	andncc 	%r16, %r17, %r11
	.word 0xc36c250a  ! 231: PREFETCH_I	prefetch	[%r16 + 0x050a], #one_read
	.word 0xe67421d5  ! 233: STX_I	stx	%r19, [%r16 + 0x01d5]
	.word 0x88b427c1  ! 235: ORNcc_I	orncc 	%r16, 0x07c1, %r4
	.word 0x97643801  ! 235: MOVcc_I	<illegal instruction>
	.word 0x94342f3b  ! 235: ORN_I	orn 	%r16, 0x0f3b, %r10
	.word 0x81dc2baf  ! 235: FLUSH_I	dis not found

	.word 0xd8340011  ! 236: STH_R	sth	%r12, [%r16 + %r17]
	.word 0x877c0411  ! 238: MOVR_R	move	%r16, %r17, %r3
	.word 0xb20c202f  ! 238: AND_I	and 	%r16, 0x002f, %r25
	.word 0x929c20b4  ! 238: XORcc_I	xorcc 	%r16, 0x00b4, %r9
	.word 0xa6fc2afd  ! 238: SDIVcc_I	sdivcc 	%r16, 0x0afd, %r19
	.word 0xca740011  ! 239: STX_R	stx	%r5, [%r16 + %r17]
	.word 0x883c2047  ! 241: XNOR_I	xnor 	%r16, 0x0047, %r4
	.word 0xe87c2f74  ! 241: SWAP_I	swap	%r20, [%r16 + 0x0f74]
	.word 0xda240011  ! 242: STW_R	stw	%r13, [%r16 + %r17]
	.word 0xbf3c0011  ! 244: SRA_R	sra 	%r16, %r17, %r31
thr1_resum_intr_5:
!$EV trig_pc_d(1,expr(@VA(.MAIN.thr1_resum_intr_5), 16, 16)) -> intp(1, 3, 1)
	wr      %r0, 0x5, %asr26
	.word 0xba0c2b39  ! 245: AND_I	and 	%r16, 0x0b39, %r29
	.word 0xaaac2606  ! 247: ANDNcc_I	andncc 	%r16, 0x0606, %r21
	.word 0xb004213a  ! 247: ADD_I	add 	%r16, 0x013a, %r24
	.word 0xaec42f8c  ! 247: ADDCcc_I	addccc 	%r16, 0x0f8c, %r23
	.word 0xc3ec2f7e  ! 247: PREFETCHA_I	prefetcha	[%r16, + 0x0f7e] %asi, #one_read
	.word 0x9a1c0011  ! 248: XOR_R	xor 	%r16, %r17, %r13
	.word 0x92342e61  ! 250: ORN_I	orn 	%r16, 0x0e61, %r9
	.word 0x8c9c2385  ! 250: XORcc_I	xorcc 	%r16, 0x0385, %r6
        wr %g0, 0x4, %fprs
	.word 0xe6342c41  ! 252: STH_I	sth	%r19, [%r16 + 0x0c41]
thr1_resum_intr_6:
!$EV trig_pc_d(1,expr(@VA(.MAIN.thr1_resum_intr_6), 16, 16)) -> intp(1, 3, 1)
	wr      %r0, 0x5, %asr26
	.word 0xe6742d95  ! 256: STX_I	stx	%r19, [%r16 + 0x0d95]
thr1_resum_intr_7:
!$EV trig_pc_d(1,expr(@VA(.MAIN.thr1_resum_intr_7), 16, 16)) -> intp(1, 3, 1)
	wr      %r0, 0x5, %asr26
	.word 0xe6742adf  ! 260: STX_I	stx	%r19, [%r16 + 0x0adf]
        wr %g0, 0x4, %fprs
	.word 0xee2c0011  ! 263: STB_R	stb	%r23, [%r16 + %r17]
	.word 0x8a942775  ! 265: ORcc_I	orcc 	%r16, 0x0775, %r5
	.word 0xab7c0411  ! 265: MOVR_R	move	%r16, %r17, %r21
	.word 0x8143e068  ! 265: MEMBAR	membar	#StoreStore | #MemIssue | #Sync 
	.word 0xf22428ff  ! 267: STW_I	stw	%r25, [%r16 + 0x08ff]
	.word 0xa8ac0011  ! 269: ANDNcc_R	andncc 	%r16, %r17, %r20
	.word 0x8143c000  ! 269: STBAR	stbar
thr1_irf_ce_8:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_8), 16, 16),1,IRF,ce,18,x, x,x,x, x,x,x)
	.word 0xea74253d  ! 272: STX_I	stx	%r21, [%r16 + 0x053d]
	.word 0x8c9424c0  ! 274: ORcc_I	orcc 	%r16, 0x04c0, %r6
	.word 0x872c0011  ! 274: SLL_R	sll 	%r16, %r17, %r3
	.word 0xcc142018  ! 274: LDUH_I	lduh	[%r16 + 0x0018], %r6
	.word 0x9f3c1011  ! 275: SRAX_R	srax	%r16, %r17, %r15
	.word 0xb0c40011  ! 277: ADDCcc_R	addccc 	%r16, %r17, %r24
	.word 0x2ccc0001  ! 277: BRGZ	brgz,a,pt	%16,<label_0xc0001>
	.word 0xc6240011  ! 278: STW_R	stw	%r3, [%r16 + %r17]
	.word 0x9ec40011  ! 280: ADDCcc_R	addccc 	%r16, %r17, %r15
	.word 0x9a0c2919  ! 280: AND_I	and 	%r16, 0x0919, %r13
	.word 0xab643801  ! 280: MOVcc_I	<illegal instruction>
	.word 0x82f40011  ! 280: UDIVcc_R	udivcc 	%r16, %r17, %r1
	.word 0xf22c0011  ! 281: STB_R	stb	%r25, [%r16 + %r17]
	.word 0x8143e03c  ! 283: MEMBAR	membar	#LoadStore | #StoreStore | #Lookaside | #MemIssue 
	.word 0xd63428e3  ! 285: STH_I	sth	%r11, [%r16 + 0x08e3]
	.word 0x90840011  ! 287: ADDcc_R	addcc 	%r16, %r17, %r8
	.word 0xae94224d  ! 287: ORcc_I	orcc 	%r16, 0x024d, %r23
	.word 0xd9f41011  ! 287: CASXA_I	casxa	[%r16] 0x80, %r17, %r12
thr1_irf_ce_9:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_9), 16, 16),1,IRF,ce,49,x, x,x,x, x,x,x)
	.word 0xd8742c19  ! 290: STX_I	stx	%r12, [%r16 + 0x0c19]
	.word 0xbf7c0411  ! 292: MOVR_R	move	%r16, %r17, %r31
	.word 0xa5340011  ! 292: SRL_R	srl 	%r16, %r17, %r18
	.word 0xba342b01  ! 292: ORN_I	orn 	%r16, 0x0b01, %r29
	.word 0xd41c0011  ! 292: LDD_R	ldd	[%r16 + %r17], %r10
	.word 0xe674299d  ! 294: STX_I	stx	%r19, [%r16 + 0x099d]
	.word 0x95240011  ! 296: MULScc_R	mulscc 	%r16, %r17, %r10
thr1_irf_ce_10:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_10), 16, 16),1,IRF,ce,66,x, x,x,x, x,x,x)
	.word 0xd8742d7d  ! 299: STX_I	stx	%r12, [%r16 + 0x0d7d]
	.word 0x85343001  ! 301: SRLX_I	srlx	%r16, 0x0001, %r2
	.word 0xb09c0011  ! 301: XORcc_R	xorcc 	%r16, %r17, %r24
	.word 0x9ab40011  ! 301: ORNcc_R	orncc 	%r16, %r17, %r13
	.word 0xcf2422bb  ! 301: STF_I	st	%f7, [0x02bb, %r16]
	.word 0x9e340011  ! 302: SUBC_R	orn 	%r16, %r17, %r15
	.word 0x82440011  ! 304: ADDC_R	addc 	%r16, %r17, %r1
	.word 0xdca42949  ! 304: STWA_I	stwa	%r14, [%r16 + 0x0949] %asi
	.word 0xc83427b5  ! 306: STH_I	sth	%r4, [%r16 + 0x07b5]
	.word 0xd87c260e  ! 308: SWAP_I	swap	%r12, [%r16 + 0x060e]
	.word 0xe8340011  ! 309: STH_R	sth	%r20, [%r16 + %r17]
	.word 0xa9342001  ! 311: SRL_I	srl 	%r16, 0x0001, %r20
	.word 0x8143c000  ! 311: STBAR	stbar
	.word 0xc8342d1b  ! 313: STH_I	sth	%r4, [%r16 + 0x0d1b]
	.word 0x8cb4249b  ! 315: ORNcc_I	orncc 	%r16, 0x049b, %r6
	.word 0x84042d46  ! 315: ADD_I	add 	%r16, 0x0d46, %r2
	.word 0x853c0011  ! 315: SRA_R	sra 	%r16, %r17, %r2
	.word 0xd93c2f8e  ! 315: STDF_I	std	%f12, [0x0f8e, %r16]
thr1_irf_ce_11:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_11), 16, 16),1,IRF,ce,30,x, x,x,x, x,x,x)
	.word 0xda242d3f  ! 318: STW_I	stw	%r13, [%r16 + 0x0d3f]
	.word 0x82c40011  ! 320: ADDCcc_R	addccc 	%r16, %r17, %r1
	.word 0x9a940011  ! 320: ORcc_R	orcc 	%r16, %r17, %r13
	.word 0xe4ac2e63  ! 320: STBA_I	stba	%r18, [%r16 + 0x0e63] %asi
	.word 0xb49c2f70  ! 321: XORcc_I	xorcc 	%r16, 0x0f70, %r26
	ta	T_CHANGE_PRIV	! macro
	.word 0x843426f6  ! 324: ORN_I	orn 	%r16, 0x06f6, %r2
	.word 0x9e8c21b6  ! 326: ANDcc_I	andcc 	%r16, 0x01b6, %r15
	.word 0x81dc2894  ! 326: FLUSH_I	dis not found

	.word 0xd8240011  ! 327: STW_R	stw	%r12, [%r16 + %r17]
	.word 0x8a8c2f15  ! 329: ANDcc_I	andcc 	%r16, 0x0f15, %r5
	.word 0xa8842ad2  ! 329: ADDcc_I	addcc 	%r16, 0x0ad2, %r20
	.word 0x83242bc3  ! 329: MULScc_I	mulscc 	%r16, 0x0bc3, %r1
thr1_irf_ce_12:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_12), 16, 16),1,IRF,ce,38,x, x,x,x, x,x,x)
	.word 0xd4342dd5  ! 332: STH_I	sth	%r10, [%r16 + 0x0dd5]
	.word 0x94842fd9  ! 334: ADDcc_I	addcc 	%r16, 0x0fd9, %r10
	.word 0x920c23f7  ! 334: AND_I	and 	%r16, 0x03f7, %r9
	.word 0xaadc0011  ! 334: SMULcc_R	smulcc 	%r16, %r17, %r21
	.word 0x87643801  ! 335: MOVcc_I	<illegal instruction>
	.word 0xcef4209f  ! 337: STXA_I	stxa	%r7, [%r16 + 0x009f] %asi
	.word 0xc4742dff  ! 339: STX_I	stx	%r2, [%r16 + 0x0dff]
thr1_resum_intr_8:
!$EV trig_pc_d(1,expr(@VA(.MAIN.thr1_resum_intr_8), 16, 16)) -> intp(1, 3, 1)
	wr      %r0, 0x5, %asr26
	.word 0xc42429f3  ! 343: STW_I	stw	%r2, [%r16 + 0x09f3]
	.word 0x9d641811  ! 345: MOVcc_R	<illegal instruction>
	.word 0x924c237f  ! 345: MULX_I	mulx 	%r16, 0x037f, %r9
thr1_irf_ce_13:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_13), 16, 16),1,IRF,ce,66,x, x,x,x, x,x,x)
	.word 0xde2c2e81  ! 348: STB_I	stb	%r15, [%r16 + 0x0e81]
	.word 0x953c2001  ! 350: SRA_I	sra 	%r16, 0x0001, %r10
thr1_resum_intr_9:
!$EV trig_pc_d(1,expr(@VA(.MAIN.thr1_resum_intr_9), 16, 16)) -> intp(1, 3, 1)
	wr      %r0, 0x5, %asr26
	.word 0xac9c0011  ! 351: XORcc_R	xorcc 	%r16, %r17, %r22
	.word 0xb17c0411  ! 353: MOVR_R	move	%r16, %r17, %r24
	.word 0x90040011  ! 353: ADD_R	add 	%r16, %r17, %r8
	.word 0xe6d41011  ! 353: LDSHA_R	ldsha	[%r16, %r17] 0x80, %r19
	.word 0xdc2c2e1d  ! 355: STB_I	stb	%r14, [%r16 + 0x0e1d]
	.word 0xaab42090  ! 357: ORNcc_I	orncc 	%r16, 0x0090, %r21
	.word 0x922c2ee2  ! 357: ANDN_I	andn 	%r16, 0x0ee2, %r9
	.word 0xb92c3001  ! 357: SLLX_I	sllx	%r16, 0x0001, %r28
	.word 0x91ab4831  ! 357: FMOVCC	fmovs	%fcc1, %f17, %f8
	.word 0xdc2c0011  ! 358: STB_R	stb	%r14, [%r16 + %r17]
	.word 0x96442954  ! 360: ADDC_I	addc 	%r16, 0x0954, %r11
	.word 0x897c2401  ! 360: MOVR_I	move	%r16, 0xfffffff8, %r4
	.word 0xc36c2454  ! 360: PREFETCH_I	prefetch	[%r16 + 0x0454], #one_read
	.word 0xea742d9d  ! 362: STX_I	stx	%r21, [%r16 + 0x0d9d]
        wr %g0, 0x4, %fprs
	.word 0xf4240011  ! 365: STW_R	stw	%r26, [%r16 + %r17]
	.word 0x92bc0011  ! 367: XNORcc_R	xnorcc 	%r16, %r17, %r9
	.word 0x89504000  ! 367: RDPR_TNPC	rdpr	%tnpc, %r4
	.word 0xd6242349  ! 369: STW_I	stw	%r11, [%r16 + 0x0349]
	.word 0x9151c000  ! 371: RDPR_TL	rdpr	%tl, %r8
thr1_irf_ce_14:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_14), 16, 16),1,IRF,ce,20,x, x,x,x, x,x,x)
	.word 0xd22c254b  ! 374: STB_I	stb	%r9, [%r16 + 0x054b]
	.word 0xac3c0011  ! 376: XNOR_R	xnor 	%r16, %r17, %r22
	.word 0xbc8c0011  ! 376: ANDcc_R	andcc 	%r16, %r17, %r30
	.word 0x8da01a31  ! 376: FsTOi	dis not found

thr1_irf_ce_15:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_15), 16, 16),1,IRF,ce,8,x, x,x,x, x,x,x)
	.word 0xfa242043  ! 379: STW_I	stw	%r29, [%r16 + 0x0043]
	.word 0xb4ac0011  ! 381: ANDNcc_R	andncc 	%r16, %r17, %r26
	.word 0x9a8c2383  ! 381: ANDcc_I	andcc 	%r16, 0x0383, %r13
	.word 0xca6c2826  ! 381: LDSTUB_I	ldstub	%r5, [%r16 + 0x0826]
	.word 0xc42c2d61  ! 383: STB_I	stb	%r2, [%r16 + 0x0d61]
	.word 0x96bc0011  ! 385: XNORcc_R	xnorcc 	%r16, %r17, %r11
	ta	T_CHANGE_PRIV	! macro
thr1_irf_ce_16:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_16), 16, 16),1,IRF,ce,34,x, x,x,x, x,x,x)
	.word 0xca742bbf  ! 388: STX_I	stx	%r5, [%r16 + 0x0bbf]
	.word 0xae942116  ! 390: ORcc_I	orcc 	%r16, 0x0116, %r23
	.word 0x9c140011  ! 390: OR_R	or 	%r16, %r17, %r14
	.word 0xc6ac1011  ! 390: STBA_R	stba	%r3, [%r16 + %r17] 0x80
	.word 0xc22c252f  ! 392: STB_I	stb	%r1, [%r16 + 0x052f]
	.word 0x92c40011  ! 394: ADDCcc_R	addccc 	%r16, %r17, %r9
	.word 0xf86c0011  ! 394: LDSTUB_R	ldstub	%r28, [%r16 + %r17]
	.word 0xab2c2001  ! 395: SLL_I	sll 	%r16, 0x0001, %r21
	.word 0x940c2f53  ! 397: AND_I	and 	%r16, 0x0f53, %r10
	.word 0xd8b41011  ! 397: STHA_R	stha	%r12, [%r16 + %r17] 0x80
	.word 0xe434286b  ! 399: STH_I	sth	%r18, [%r16 + 0x086b]
	.word 0x981c2715  ! 401: XOR_I	xor 	%r16, 0x0715, %r12
	.word 0x99ec0011  ! 401: RESTORE_R	restore	%r16, %r17, %r12
thr1_irf_ce_17:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_17), 16, 16),1,IRF,ce,7,x, x,x,x, x,x,x)
	.word 0xee34291b  ! 404: STH_I	sth	%r23, [%r16 + 0x091b]
	.word 0x81880000  ! 406: RESTORED	saved
thr1_irf_ce_18:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_18), 16, 16),1,IRF,ce,34,x, x,x,x, x,x,x)
	.word 0xee2c2381  ! 409: STB_I	stb	%r23, [%r16 + 0x0381]
	.word 0x8143c000  ! 411: STBAR	stbar
	.word 0x8cbc0011  ! 412: XNORcc_R	xnorcc 	%r16, %r17, %r6
	.word 0x937c2401  ! 414: MOVR_I	move	%r16, 0xfffffff8, %r9
	.word 0x83342001  ! 414: SRL_I	srl 	%r16, 0x0001, %r1
	.word 0xc3ec1011  ! 414: PREFETCHA_R	prefetcha	[%r16, %r17] 0x80, #one_read
thr1_irf_ce_19:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_19), 16, 16),1,IRF,ce,70,x, x,x,x, x,x,x)
	.word 0xd4242829  ! 417: STW_I	stw	%r10, [%r16 + 0x0829]
	.word 0xb60c0011  ! 419: AND_R	and 	%r16, %r17, %r27
	.word 0xbe3c2547  ! 419: XNOR_I	xnor 	%r16, 0x0547, %r31
	.word 0xa6140011  ! 419: OR_R	or 	%r16, %r17, %r19
	.word 0x02cc0001  ! 419: BRZ	brz  ,pt	%16,<label_0xc0001>
	.word 0x943c0011  ! 420: XNOR_R	xnor 	%r16, %r17, %r10
	.word 0xd61c0011  ! 422: LDD_R	ldd	[%r16 + %r17], %r11
	.word 0xc6240011  ! 423: STW_R	stw	%r3, [%r16 + %r17]
	.word 0x9cb42ac3  ! 425: ORNcc_I	orncc 	%r16, 0x0ac3, %r14
	.word 0xba140011  ! 425: OR_R	or 	%r16, %r17, %r29
	.word 0xe45c22dd  ! 425: LDX_I	ldx	[%r16 + 0x02dd], %r18
	.word 0x977c2401  ! 426: MOVR_I	move	%r16, 0x7fffbdd8, %r11
	.word 0x987c219b  ! 428: SDIV_I	sdiv 	%r16, 0x019b, %r12
thr1_irf_ce_20:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_20), 16, 16),1,IRF,ce,22,x, x,x,x, x,x,x)
	.word 0xea342d8f  ! 431: STH_I	sth	%r21, [%r16 + 0x0d8f]
	.word 0xe88c1011  ! 433: LDUBA_R	lduba	[%r16, %r17] 0x80, %r20
	.word 0x9cac0011  ! 434: ANDNcc_R	andncc 	%r16, %r17, %r14
	.word 0x90b40011  ! 436: ORNcc_R	orncc 	%r16, %r17, %r8
	.word 0x981c0011  ! 436: XOR_R	xor 	%r16, %r17, %r12
	.word 0x9d341011  ! 436: SRLX_R	srlx	%r16, %r17, %r14
	ta	T_CHANGE_HPRIV	! macro
thr1_irf_ce_21:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_21), 16, 16),1,IRF,ce,64,x, x,x,x, x,x,x)
	.word 0xc434235b  ! 439: STH_I	sth	%r2, [%r16 + 0x035b]
	.word 0xc67c2557  ! 441: SWAP_I	swap	%r3, [%r16 + 0x0557]
	.word 0x87643801  ! 442: MOVcc_I	<illegal instruction>
	.word 0xad340011  ! 444: SRL_R	srl 	%r16, %r17, %r22
thr1_resum_intr_10:
!$EV trig_pc_d(1,expr(@VA(.MAIN.thr1_resum_intr_10), 16, 16)) -> intp(1, 3, 1)
	wr      %r0, 0x5, %asr26
	.word 0xd8240011  ! 445: STW_R	stw	%r12, [%r16 + %r17]
	.word 0x8d641811  ! 447: MOVcc_R	<illegal instruction>
	.word 0xfc6c2fdc  ! 447: LDSTUB_I	ldstub	%r30, [%r16 + 0x0fdc]
thr1_irf_ce_22:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_22), 16, 16),1,IRF,ce,36,x, x,x,x, x,x,x)
	.word 0xfe2427af  ! 450: STW_I	stw	%r31, [%r16 + 0x07af]
	.word 0x8e840011  ! 452: ADDcc_R	addcc 	%r16, %r17, %r7
	.word 0x81580000  ! 452: FLUSHW	flushw
thr1_irf_ce_23:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_23), 16, 16),1,IRF,ce,31,x, x,x,x, x,x,x)
	.word 0xd434269d  ! 455: STH_I	sth	%r10, [%r16 + 0x069d]
	.word 0xaf7c0411  ! 457: MOVR_R	move	%r16, %r17, %r23
	.word 0x90bc0011  ! 457: XNORcc_R	xnorcc 	%r16, %r17, %r8
	.word 0xbefc266e  ! 457: SDIVcc_I	sdivcc 	%r16, 0x066e, %r31
	.word 0xd4342747  ! 459: STH_I	sth	%r10, [%r16 + 0x0747]
	.word 0x932c2001  ! 461: SLL_I	sll 	%r16, 0x0001, %r9
	.word 0x24800001  ! 461: BLE	ble,a	<label_0x1>
	.word 0xfe2c2b89  ! 463: STB_I	stb	%r31, [%r16 + 0x0b89]
	.word 0x82c40011  ! 465: ADDCcc_R	addccc 	%r16, %r17, %r1
	.word 0x96942657  ! 465: ORcc_I	orcc 	%r16, 0x0657, %r11
	.word 0x8e8c0011  ! 465: ANDcc_R	andcc 	%r16, %r17, %r7
	.word 0xd9e41011  ! 465: CASA_I	casa	[%r16] 0x80, %r17, %r12
	.word 0xda242ed5  ! 467: STW_I	stw	%r13, [%r16 + 0x0ed5]
	.word 0xc2bc2a3e  ! 469: STDA_I	stda	%r1, [%r16 + 0x0a3e] %asi
	.word 0x88242dc7  ! 470: SUB_I	sub 	%r16, 0x0dc7, %r4
	.word 0x9d3c2001  ! 472: SRA_I	sra 	%r16, 0x0001, %r14
	.word 0x9cbc2031  ! 472: XNORcc_I	xnorcc 	%r16, 0x0031, %r14
	.word 0x97641811  ! 472: MOVcc_R	<illegal instruction>
thr1_resum_intr_11:
!$EV trig_pc_d(1,expr(@VA(.MAIN.thr1_resum_intr_11), 16, 16)) -> intp(1, 3, 1)
	wr      %r0, 0x5, %asr26
thr1_irf_ce_24:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_24), 16, 16),1,IRF,ce,34,x, x,x,x, x,x,x)
	.word 0xe42423f1  ! 475: STW_I	stw	%r18, [%r16 + 0x03f1]
	.word 0x8e340011  ! 477: ORN_R	orn 	%r16, %r17, %r7
	.word 0xb8bc0011  ! 477: XNORcc_R	xnorcc 	%r16, %r17, %r28
	.word 0xbcac0011  ! 477: ANDNcc_R	andncc 	%r16, %r17, %r30
thr1_resum_intr_12:
!$EV trig_pc_d(1,expr(@VA(.MAIN.thr1_resum_intr_12), 16, 16)) -> intp(1, 3, 1)
	wr      %r0, 0x5, %asr26
	.word 0xd0242e81  ! 479: STW_I	stw	%r8, [%r16 + 0x0e81]
	.word 0xb6340011  ! 481: ORN_R	orn 	%r16, %r17, %r27
	.word 0x92ac2db4  ! 481: ANDNcc_I	andncc 	%r16, 0x0db4, %r9
	.word 0xb7340011  ! 481: SRL_R	srl 	%r16, %r17, %r27
	.word 0xc36c20ed  ! 481: PREFETCH_I	prefetch	[%r16 + 0x00ed], #one_read
	.word 0x877c2401  ! 482: MOVR_I	move	%r16, 0x7fffbdd8, %r3
	.word 0x849c23a5  ! 484: XORcc_I	xorcc 	%r16, 0x03a5, %r2
	.word 0xc36c2bfc  ! 484: PREFETCH_I	prefetch	[%r16 + 0x0bfc], #one_read
thr1_irf_ce_25:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_25), 16, 16),1,IRF,ce,30,x, x,x,x, x,x,x)
	.word 0xcc2c2a77  ! 487: STB_I	stb	%r6, [%r16 + 0x0a77]
	.word 0x20800001  ! 489: BN	bn,a	<label_0x1>
	.word 0xcc2c2931  ! 491: STB_I	stb	%r6, [%r16 + 0x0931]
	.word 0xb62c0011  ! 493: ANDN_R	andn 	%r16, %r17, %r27
	.word 0x98942523  ! 493: ORcc_I	orcc 	%r16, 0x0523, %r12
	.word 0xbabc0011  ! 493: XNORcc_R	xnorcc 	%r16, %r17, %r29
	.word 0x8143e068  ! 493: MEMBAR	membar	#StoreStore | #MemIssue | #Sync 
	.word 0x957c0411  ! 494: MOVR_R	move	%r16, %r17, %r10
	.word 0x8e440011  ! 496: ADDC_R	addc 	%r16, %r17, %r7
	.word 0x94b420b3  ! 496: ORNcc_I	orncc 	%r16, 0x00b3, %r10
	.word 0x2ac40003  ! 496: BRNZ	brnz,a,nt	%16,<label_0x40003>
thr1_irf_ce_26:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_26), 16, 16),1,IRF,ce,56,x, x,x,x, x,x,x)
	.word 0xe63421b7  ! 499: STH_I	sth	%r19, [%r16 + 0x01b7]
	ta	T_CHANGE_HPRIV	! macro
	.word 0xe624276b  ! 503: STW_I	stw	%r19, [%r16 + 0x076b]
	.word 0x924424f1  ! 505: ADDC_I	addc 	%r16, 0x04f1, %r9
	.word 0x8c040011  ! 505: ADD_R	add 	%r16, %r17, %r6
	.word 0xd13c0011  ! 505: STDF_R	std	%f8, [%r17, %r16]
	.word 0xb2a40011  ! 506: SUBcc_R	subcc 	%r16, %r17, %r25
	.word 0xa6842237  ! 508: ADDcc_I	addcc 	%r16, 0x0237, %r19
	.word 0xc36c2564  ! 508: PREFETCH_I	prefetch	[%r16 + 0x0564], #one_read
	.word 0xd0340011  ! 509: STH_R	sth	%r8, [%r16 + %r17]
	.word 0x872c1011  ! 511: SLLX_R	sllx	%r16, %r17, %r3
	.word 0x95340011  ! 511: SRL_R	srl 	%r16, %r17, %r10
	.word 0xb0ac2930  ! 511: ANDNcc_I	andncc 	%r16, 0x0930, %r24
	.word 0x81580000  ! 511: FLUSHW	flushw
	.word 0xd22c0011  ! 512: STB_R	stb	%r9, [%r16 + %r17]
	.word 0x8f340011  ! 514: SRL_R	srl 	%r16, %r17, %r7
	.word 0xb5641811  ! 514: MOVcc_R	<illegal instruction>
	.word 0xaa842536  ! 514: ADDcc_I	addcc 	%r16, 0x0536, %r21
	.word 0x81880000  ! 514: SAVED	saved
	.word 0xea2c2a37  ! 516: STB_I	stb	%r21, [%r16 + 0x0a37]
	.word 0x8d2c0011  ! 518: SLL_R	sll 	%r16, %r17, %r6
        wr %g0, 0x4, %fprs
	.word 0xca2c0011  ! 519: STB_R	stb	%r5, [%r16 + %r17]
	.word 0x88840011  ! 521: ADDcc_R	addcc 	%r16, %r17, %r4
	.word 0x8fec0011  ! 521: RESTORE_R	restore	%r16, %r17, %r7
thr1_irf_ce_27:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_27), 16, 16),1,IRF,ce,28,x, x,x,x, x,x,x)
	.word 0xca242b0f  ! 524: STW_I	stw	%r5, [%r16 + 0x0b0f]
	.word 0x8a84204d  ! 526: ADDcc_I	addcc 	%r16, 0x004d, %r5
	.word 0x892c1011  ! 526: SLLX_R	sllx	%r16, %r17, %r4
	.word 0xc84c2ec6  ! 526: LDSB_I	ldsb	[%r16 + 0x0ec6], %r4
thr1_irf_ce_28:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_28), 16, 16),1,IRF,ce,10,x, x,x,x, x,x,x)
	.word 0xdc342a3d  ! 529: STH_I	sth	%r14, [%r16 + 0x0a3d]
	.word 0x91a40931  ! 531: FMULs	fmuls	%f16, %f17, %f8
	.word 0xa49c2dfe  ! 532: XORcc_I	xorcc 	%r16, 0x0dfe, %r18
	.word 0xa53c1011  ! 534: SRAX_R	srax	%r16, %r17, %r18
	.word 0x8c042f44  ! 534: ADD_I	add 	%r16, 0x0f44, %r6
	.word 0x8c840011  ! 534: ADDcc_R	addcc 	%r16, %r17, %r6
	.word 0x81580000  ! 534: FLUSHW	flushw
	.word 0x9c240011  ! 535: SUB_R	sub 	%r16, %r17, %r14
	.word 0x8c0c0011  ! 537: AND_R	and 	%r16, %r17, %r6
	.word 0x8f641811  ! 537: MOVcc_R	<illegal instruction>
	.word 0x9e440011  ! 537: ADDC_R	addc 	%r16, %r17, %r15
	.word 0x00800001  ! 537: BN	bn  	<label_0x1>
	.word 0xc8740011  ! 538: STX_R	stx	%r4, [%r16 + %r17]
        wr %g0, 0x4, %fprs
	.word 0xfa740011  ! 541: STX_R	stx	%r29, [%r16 + %r17]
	.word 0x8e1c0011  ! 543: XOR_R	xor 	%r16, %r17, %r7
thr1_resum_intr_13:
!$EV trig_pc_d(1,expr(@VA(.MAIN.thr1_resum_intr_13), 16, 16)) -> intp(1, 3, 1)
	wr      %r0, 0x5, %asr26
	.word 0xcc340011  ! 544: STH_R	sth	%r6, [%r16 + %r17]
	.word 0xbaf40011  ! 546: UDIVcc_R	udivcc 	%r16, %r17, %r29
	.word 0xda2c2d85  ! 548: STB_I	stb	%r13, [%r16 + 0x0d85]
	.word 0x92c40011  ! 550: ADDCcc_R	addccc 	%r16, %r17, %r9
	.word 0xabec0011  ! 550: RESTORE_R	restore	%r16, %r17, %r21
	.word 0xf4740011  ! 551: STX_R	stx	%r26, [%r16 + %r17]
	.word 0x8a0c20ec  ! 553: AND_I	and 	%r16, 0x00ec, %r5
	.word 0x9a142297  ! 553: OR_I	or 	%r16, 0x0297, %r13
	.word 0x88d42207  ! 553: UMULcc_I	umulcc 	%r16, 0x0207, %r4
	.word 0xdc2c2e25  ! 555: STB_I	stb	%r14, [%r16 + 0x0e25]
	.word 0xbeb40011  ! 557: ORNcc_R	orncc 	%r16, %r17, %r31
	.word 0x92b42b85  ! 557: ORNcc_I	orncc 	%r16, 0x0b85, %r9
	.word 0xa8ac0011  ! 557: ANDNcc_R	andncc 	%r16, %r17, %r20
        wr %g0, 0x4, %fprs
	.word 0xc22c29b3  ! 559: STB_I	stb	%r1, [%r16 + 0x09b3]
thr1_resum_intr_14:
!$EV trig_pc_d(1,expr(@VA(.MAIN.thr1_resum_intr_14), 16, 16)) -> intp(1, 3, 1)
	wr      %r0, 0x5, %asr26
	.word 0xc23425fd  ! 563: STH_I	sth	%r1, [%r16 + 0x05fd]
	.word 0x8c2c0011  ! 565: ANDN_R	andn 	%r16, %r17, %r6
	.word 0x981c28da  ! 565: XOR_I	xor 	%r16, 0x08da, %r12
	.word 0x904c2457  ! 565: MULX_I	mulx 	%r16, 0x0457, %r8
	.word 0xe4340011  ! 566: STH_R	sth	%r18, [%r16 + %r17]
thr1_resum_intr_15:
!$EV trig_pc_d(1,expr(@VA(.MAIN.thr1_resum_intr_15), 16, 16)) -> intp(1, 3, 1)
	wr      %r0, 0x5, %asr26
	.word 0xce740011  ! 569: STX_R	stx	%r7, [%r16 + %r17]
        wr %g0, 0x4, %fprs
	.word 0xaca42477  ! 572: SUBcc_I	subcc 	%r16, 0x0477, %r22
        wr %g0, 0x4, %fprs
thr1_irf_ce_29:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_29), 16, 16),1,IRF,ce,55,x, x,x,x, x,x,x)
	.word 0xce3426cf  ! 577: STH_I	sth	%r7, [%r16 + 0x06cf]
	.word 0xac542a39  ! 579: UMUL_I	umul 	%r16, 0x0a39, %r22
	.word 0x86040011  ! 580: ADD_R	add 	%r16, %r17, %r3
	.word 0x98b42212  ! 582: ORNcc_I	orncc 	%r16, 0x0212, %r12
	.word 0xb3341011  ! 582: SRLX_R	srlx	%r16, %r17, %r25
	.word 0xc46c0011  ! 582: LDSTUB_R	ldstub	%r2, [%r16 + %r17]
	.word 0xdc340011  ! 583: STH_R	sth	%r14, [%r16 + %r17]
	.word 0xca5c2fb0  ! 585: LDX_I	ldx	[%r16 + 0x0fb0], %r5
	.word 0x9c240011  ! 586: SUB_R	sub 	%r16, %r17, %r14
	.word 0xa48c0011  ! 588: ANDcc_R	andcc 	%r16, %r17, %r18
	.word 0xa64421b0  ! 588: ADDC_I	addc 	%r16, 0x01b0, %r19
	.word 0x94ac28e4  ! 588: ANDNcc_I	andncc 	%r16, 0x08e4, %r10
	.word 0x87ec0011  ! 588: RESTORE_R	restore	%r16, %r17, %r3
thr1_irf_ce_30:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_30), 16, 16),1,IRF,ce,39,x, x,x,x, x,x,x)
	.word 0xdc742b33  ! 591: STX_I	stx	%r14, [%r16 + 0x0b33]
	.word 0x892c0011  ! 593: SLL_R	sll 	%r16, %r17, %r4
	.word 0x9b2c1011  ! 593: SLLX_R	sllx	%r16, %r17, %r13
	.word 0x8c940011  ! 593: ORcc_R	orcc 	%r16, %r17, %r6
	.word 0x8cdc0011  ! 593: SMULcc_R	smulcc 	%r16, %r17, %r6
	.word 0x8b2c0011  ! 594: SLL_R	sll 	%r16, %r17, %r5
	.word 0x969c2b55  ! 596: XORcc_I	xorcc 	%r16, 0x0b55, %r11
	.word 0xa5340011  ! 596: SRL_R	srl 	%r16, %r17, %r18
	.word 0x81580000  ! 596: FLUSHW	flushw
	.word 0xa68c28ad  ! 597: ANDcc_I	andcc 	%r16, 0x08ad, %r19
	.word 0xb2140011  ! 599: OR_R	or 	%r16, %r17, %r25
        wr %g0, 0x4, %fprs
thr1_irf_ce_31:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_31), 16, 16),1,IRF,ce,1,x, x,x,x, x,x,x)
	.word 0xd034277b  ! 602: STH_I	sth	%r8, [%r16 + 0x077b]
	.word 0xa53c0011  ! 604: SRA_R	sra 	%r16, %r17, %r18
	.word 0x8e8c0011  ! 604: ANDcc_R	andcc 	%r16, %r17, %r7
	.word 0x81880000  ! 604: SAVED	saved
	.word 0xd0340011  ! 605: STH_R	sth	%r8, [%r16 + %r17]
	.word 0x8cbc25dd  ! 607: XNORcc_I	xnorcc 	%r16, 0x05dd, %r6
	.word 0xb757c000  ! 607: RDPR_VER	<illegal instruction>
	.word 0xd8740011  ! 608: STX_R	stx	%r12, [%r16 + %r17]
	.word 0x96c40011  ! 610: ADDCcc_R	addccc 	%r16, %r17, %r11
	.word 0x9c9c2d8a  ! 610: XORcc_I	xorcc 	%r16, 0x0d8a, %r14
	.word 0xa4c40011  ! 610: ADDCcc_R	addccc 	%r16, %r17, %r18
	ta	T_CHANGE_PRIV	! macro
	.word 0xf4740011  ! 611: STX_R	stx	%r26, [%r16 + %r17]
	.word 0x8f643801  ! 613: MOVcc_I	<illegal instruction>
	.word 0x9cdc2836  ! 613: SMULcc_I	smulcc 	%r16, 0x0836, %r14
	.word 0x86340011  ! 614: SUBC_R	orn 	%r16, %r17, %r3
	.word 0x8b3c2001  ! 616: SRA_I	sra 	%r16, 0x0001, %r5
	.word 0xb32c3001  ! 616: SLLX_I	sllx	%r16, 0x0001, %r25
	.word 0xb03c0011  ! 616: XNOR_R	xnor 	%r16, %r17, %r24
	.word 0xf6a41011  ! 616: STWA_R	stwa	%r27, [%r16 + %r17] 0x80
	.word 0x862c2529  ! 617: ANDN_I	andn 	%r16, 0x0529, %r3
	.word 0x9eb40011  ! 619: ORNcc_R	orncc 	%r16, %r17, %r15
	.word 0x927c2c86  ! 619: SDIV_I	sdiv 	%r16, 0x0c86, %r9
thr1_irf_ce_32:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_32), 16, 16),1,IRF,ce,39,x, x,x,x, x,x,x)
	.word 0xdc2c268b  ! 622: STB_I	stb	%r14, [%r16 + 0x068b]
	.word 0x8d7c2401  ! 624: MOVR_I	move	%r16, 0xfffffff8, %r6
	.word 0x81840011  ! 624: WRY_R	wr	%r16, %r17, %y
	.word 0xd67428bd  ! 626: STX_I	stx	%r11, [%r16 + 0x08bd]
	.word 0x8e040011  ! 628: ADD_R	add 	%r16, %r17, %r7
	.word 0x9d7c0411  ! 628: MOVR_R	move	%r16, %r17, %r14
	.word 0x8e2c298e  ! 628: ANDN_I	andn 	%r16, 0x098e, %r7
	.word 0xaadc0011  ! 628: SMULcc_R	smulcc 	%r16, %r17, %r21
thr1_irf_ce_33:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_33), 16, 16),1,IRF,ce,31,x, x,x,x, x,x,x)
	.word 0xe67420e3  ! 631: STX_I	stx	%r19, [%r16 + 0x00e3]
	.word 0xd6941011  ! 633: LDUHA_R	lduha	[%r16, %r17] 0x80, %r11
thr1_irf_ce_34:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_34), 16, 16),1,IRF,ce,25,x, x,x,x, x,x,x)
	.word 0xd22c2569  ! 636: STB_I	stb	%r9, [%r16 + 0x0569]
	.word 0xa8c424f4  ! 638: ADDCcc_I	addccc 	%r16, 0x04f4, %r20
	.word 0x973c0011  ! 638: SRA_R	sra 	%r16, %r17, %r11
	.word 0x2ac40001  ! 638: BRNZ	brnz,a,nt	%16,<label_0x40001>
	.word 0xd02c2a81  ! 640: STB_I	stb	%r8, [%r16 + 0x0a81]
	.word 0xa52c1011  ! 642: SLLX_R	sllx	%r16, %r17, %r18
	.word 0x9a0c0011  ! 642: AND_R	and 	%r16, %r17, %r13
	.word 0xe9e42011  ! 642: CASA_R	casa	[%r16] %asi, %r17, %r20
	.word 0x84ac0011  ! 643: ANDNcc_R	andncc 	%r16, %r17, %r2
	.word 0xbe3424fc  ! 645: ORN_I	orn 	%r16, 0x04fc, %r31
	.word 0xd05c2c79  ! 645: LDX_I	ldx	[%r16 + 0x0c79], %r8
	.word 0xa8340011  ! 646: ORN_R	orn 	%r16, %r17, %r20
	.word 0x9b3c1011  ! 648: SRAX_R	srax	%r16, %r17, %r13
	.word 0x900c2a8f  ! 648: AND_I	and 	%r16, 0x0a8f, %r8
	.word 0xab342001  ! 648: SRL_I	srl 	%r16, 0x0001, %r21
	.word 0xd93c275b  ! 648: STDF_I	std	%f12, [0x075b, %r16]
thr1_irf_ce_35:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_35), 16, 16),1,IRF,ce,7,x, x,x,x, x,x,x)
	.word 0xe6242d75  ! 651: STW_I	stw	%r19, [%r16 + 0x0d75]
	.word 0x90940011  ! 653: ORcc_R	orcc 	%r16, %r17, %r8
	.word 0xaf3c2001  ! 653: SRA_I	sra 	%r16, 0x0001, %r23
thr1_resum_intr_16:
!$EV trig_pc_d(1,expr(@VA(.MAIN.thr1_resum_intr_16), 16, 16)) -> intp(1, 3, 1)
	wr      %r0, 0x5, %asr26
	.word 0xc2740011  ! 654: STX_R	stx	%r1, [%r16 + %r17]
	.word 0x897c0411  ! 656: MOVR_R	move	%r16, %r17, %r4
	.word 0x8c340011  ! 656: ORN_R	orn 	%r16, %r17, %r6
	.word 0x9c14248e  ! 656: OR_I	or 	%r16, 0x048e, %r14
        wr %g0, 0x4, %fprs
	.word 0xae04276c  ! 657: ADD_I	add 	%r16, 0x076c, %r23
	.word 0xb22c0011  ! 659: ANDN_R	andn 	%r16, %r17, %r25
	.word 0x8c542174  ! 659: UMUL_I	umul 	%r16, 0x0174, %r6
	.word 0xd62420e9  ! 661: STW_I	stw	%r11, [%r16 + 0x00e9]
	.word 0xd21c0011  ! 663: LDD_R	ldd	[%r16 + %r17], %r9
	.word 0xcc742c85  ! 665: STX_I	stx	%r6, [%r16 + 0x0c85]
	.word 0xaa2c0011  ! 667: ANDN_R	andn 	%r16, %r17, %r21
	.word 0x964c0011  ! 667: MULX_R	mulx 	%r16, %r17, %r11
	.word 0xf0340011  ! 668: STH_R	sth	%r24, [%r16 + %r17]
	.word 0xe81c0011  ! 670: LDD_R	ldd	[%r16 + %r17], %r20
	.word 0xc8240011  ! 671: STW_R	stw	%r4, [%r16 + %r17]
	.word 0x901c0011  ! 673: XOR_R	xor 	%r16, %r17, %r8
	.word 0x81dc0011  ! 673: FLUSH_R	dis not found

	.word 0x997c0411  ! 674: MOVR_R	move	%r16, %r17, %r12
	.word 0xbd3c1011  ! 676: SRAX_R	srax	%r16, %r17, %r30
	.word 0xbe8c288f  ! 676: ANDcc_I	andcc 	%r16, 0x088f, %r31
	.word 0x8844214b  ! 676: ADDC_I	addc 	%r16, 0x014b, %r4
	.word 0xe6941011  ! 676: LDUHA_R	lduha	[%r16, %r17] 0x80, %r19
thr1_irf_ce_36:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_36), 16, 16),1,IRF,ce,19,x, x,x,x, x,x,x)
	.word 0xde242321  ! 679: STW_I	stw	%r15, [%r16 + 0x0321]
	.word 0x94bc0011  ! 681: XNORcc_R	xnorcc 	%r16, %r17, %r10
	.word 0x861c0011  ! 681: XOR_R	xor 	%r16, %r17, %r3
	.word 0xffe42011  ! 681: CASA_R	casa	[%r16] %asi, %r17, %r31
	.word 0x97641811  ! 682: MOVcc_R	<illegal instruction>
	.word 0x892c3001  ! 684: SLLX_I	sllx	%r16, 0x0001, %r4
	.word 0x8884250e  ! 684: ADDcc_I	addcc 	%r16, 0x050e, %r4
	.word 0x863c2685  ! 684: XNOR_I	xnor 	%r16, 0x0685, %r3
	.word 0x90dc22e2  ! 684: SMULcc_I	smulcc 	%r16, 0x02e2, %r8
thr1_irf_ce_37:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_37), 16, 16),1,IRF,ce,36,x, x,x,x, x,x,x)
	.word 0xf42427d3  ! 687: STW_I	stw	%r26, [%r16 + 0x07d3]
	.word 0x832c1011  ! 689: SLLX_R	sllx	%r16, %r17, %r1
	.word 0x8eb40011  ! 689: ORNcc_R	orncc 	%r16, %r17, %r7
	.word 0xb83c0011  ! 689: XNOR_R	xnor 	%r16, %r17, %r28
	.word 0xdaa41011  ! 689: STWA_R	stwa	%r13, [%r16 + %r17] 0x80
	.word 0x9a3c0011  ! 690: XNOR_R	xnor 	%r16, %r17, %r13
	.word 0x8f342001  ! 692: SRL_I	srl 	%r16, 0x0001, %r7
        wr %g0, 0x4, %fprs
	.word 0xf2340011  ! 693: STH_R	sth	%r25, [%r16 + %r17]
	.word 0xa81c24a9  ! 695: XOR_I	xor 	%r16, 0x04a9, %r20
	.word 0xac2c0011  ! 695: ANDN_R	andn 	%r16, %r17, %r22
	.word 0x8d7c0411  ! 695: MOVR_R	move	%r16, %r17, %r6
	.word 0xc8cc2586  ! 695: LDSBA_I	ldsba	[%r16, + 0x0586] %asi, %r4
	.word 0xda2c0011  ! 696: STB_R	stb	%r13, [%r16 + %r17]
	.word 0x92540011  ! 698: UMUL_R	umul 	%r16, %r17, %r9
	.word 0xc62c0011  ! 699: STB_R	stb	%r3, [%r16 + %r17]
	.word 0xde0c2ebc  ! 701: LDUB_I	ldub	[%r16 + 0x0ebc], %r15
	.word 0xe8740011  ! 702: STX_R	stx	%r20, [%r16 + %r17]
	.word 0x861c0011  ! 704: XOR_R	xor 	%r16, %r17, %r3
	.word 0x8b3c2001  ! 704: SRA_I	sra 	%r16, 0x0001, %r5
	.word 0x81dc0011  ! 704: FLUSH_R	dis not found

	.word 0xd6242cef  ! 706: STW_I	stw	%r11, [%r16 + 0x0cef]
	.word 0xaabc0011  ! 708: XNORcc_R	xnorcc 	%r16, %r17, %r21
	.word 0xacbc0011  ! 708: XNORcc_R	xnorcc 	%r16, %r17, %r22
	.word 0x0cc40003  ! 708: BRGZ	brgz  ,nt	%16,<label_0x40003>
	.word 0xfa240011  ! 709: STW_R	stw	%r29, [%r16 + %r17]
	.word 0x85340011  ! 711: SRL_R	srl 	%r16, %r17, %r2
	.word 0x9e740011  ! 711: UDIV_R	udiv 	%r16, %r17, %r15
	.word 0xda742ac1  ! 713: STX_I	stx	%r13, [%r16 + 0x0ac1]
	.word 0xbf343001  ! 715: SRLX_I	srlx	%r16, 0x0001, %r31
	.word 0x821c0011  ! 715: XOR_R	xor 	%r16, %r17, %r1
	.word 0xc3ec2ef1  ! 715: PREFETCHA_I	prefetcha	[%r16, + 0x0ef1] %asi, #one_read
thr1_irf_ce_38:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_38), 16, 16),1,IRF,ce,20,x, x,x,x, x,x,x)
	.word 0xf2342e09  ! 718: STH_I	sth	%r25, [%r16 + 0x0e09]
	.word 0x833c0011  ! 720: SRA_R	sra 	%r16, %r17, %r1
	.word 0xb4842148  ! 720: ADDcc_I	addcc 	%r16, 0x0148, %r26
	.word 0x8ba409d1  ! 720: FDIVd	fdivd	%f16, %f48, %f36
	.word 0x96c40011  ! 721: ADDCcc_R	addccc 	%r16, %r17, %r11
	.word 0xb93c0011  ! 723: SRA_R	sra 	%r16, %r17, %r28
	.word 0x9e8c0011  ! 723: ANDcc_R	andcc 	%r16, %r17, %r15
	.word 0x9cc40011  ! 723: ADDCcc_R	addccc 	%r16, %r17, %r14
	.word 0x89242b07  ! 723: MULScc_I	mulscc 	%r16, 0x0b07, %r4
	.word 0xf62c25ad  ! 725: STB_I	stb	%r27, [%r16 + 0x05ad]
	.word 0x99643801  ! 727: MOVcc_I	<illegal instruction>
	.word 0xb6b421cb  ! 727: ORNcc_I	orncc 	%r16, 0x01cb, %r27
	.word 0xa8bc28c2  ! 727: XNORcc_I	xnorcc 	%r16, 0x08c2, %r20
	.word 0x3a800003  ! 727: BCC	bcc,a	<label_0x3>
thr1_irf_ce_39:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_39), 16, 16),1,IRF,ce,0,x, x,x,x, x,x,x)
	.word 0xd22c2c77  ! 730: STB_I	stb	%r9, [%r16 + 0x0c77]
	.word 0xf81c0011  ! 732: LDD_R	ldd	[%r16 + %r17], %r28
	.word 0xb72c1011  ! 733: SLLX_R	sllx	%r16, %r17, %r27
	.word 0x84c40011  ! 735: ADDCcc_R	addccc 	%r16, %r17, %r2
	.word 0xafa00051  ! 735: FMOVd	fmovd	%f48, %f54
	.word 0x94240011  ! 736: SUB_R	sub 	%r16, %r17, %r10
	.word 0x82840011  ! 738: ADDcc_R	addcc 	%r16, %r17, %r1
	.word 0x86bc2f27  ! 738: XNORcc_I	xnorcc 	%r16, 0x0f27, %r3
	.word 0x8cac250f  ! 738: ANDNcc_I	andncc 	%r16, 0x050f, %r6
	.word 0xc36c2e34  ! 738: PREFETCH_I	prefetch	[%r16 + 0x0e34], #one_read
thr1_irf_ce_40:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_40), 16, 16),1,IRF,ce,37,x, x,x,x, x,x,x)
	.word 0xd8342699  ! 741: STH_I	sth	%r12, [%r16 + 0x0699]
	.word 0x8b340011  ! 743: SRL_R	srl 	%r16, %r17, %r5
	.word 0x8f3c2001  ! 743: SRA_I	sra 	%r16, 0x0001, %r7
	.word 0x1c800003  ! 743: BPOS	bpos  	<label_0x3>
thr1_irf_ce_41:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_41), 16, 16),1,IRF,ce,45,x, x,x,x, x,x,x)
	.word 0xf674225f  ! 746: STX_I	stx	%r27, [%r16 + 0x025f]
	.word 0xa4ac0011  ! 748: ANDNcc_R	andncc 	%r16, %r17, %r18
	.word 0x86040011  ! 748: ADD_R	add 	%r16, %r17, %r3
	.word 0xa63c22f0  ! 748: XNOR_I	xnor 	%r16, 0x02f0, %r19
	.word 0x95a81831  ! 748: FMOVRGZ	fmovs	%fcc3, %f17, %f10
	.word 0xd6742889  ! 750: STX_I	stx	%r11, [%r16 + 0x0889]
	.word 0x9a042782  ! 752: ADD_I	add 	%r16, 0x0782, %r13
	.word 0x81580000  ! 752: FLUSHW	flushw
	.word 0xd474258f  ! 754: STX_I	stx	%r10, [%r16 + 0x058f]
	ta	T_CHANGE_HPRIV	! macro
thr1_irf_ce_42:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_42), 16, 16),1,IRF,ce,40,x, x,x,x, x,x,x)
	.word 0xd42c2a61  ! 759: STB_I	stb	%r10, [%r16 + 0x0a61]
	.word 0x99343001  ! 761: SRLX_I	srlx	%r16, 0x0001, %r12
	.word 0x8143c000  ! 761: STBAR	stbar
	.word 0xf0740011  ! 762: STX_R	stx	%r24, [%r16 + %r17]
	.word 0x8d524000  ! 764: RDPR_CWP	<illegal instruction>
	.word 0xd4242c4f  ! 766: STW_I	stw	%r10, [%r16 + 0x0c4f]
	.word 0x96c4266c  ! 768: ADDCcc_I	addccc 	%r16, 0x066c, %r11
	.word 0x943c0011  ! 768: XNOR_R	xnor 	%r16, %r17, %r10
	.word 0x1e800001  ! 768: BVC	bvc  	<label_0x1>
	.word 0x937c2401  ! 769: MOVR_I	move	%r16, 0x7fffbdd8, %r9
	.word 0x8a3c0011  ! 771: XNOR_R	xnor 	%r16, %r17, %r5
	.word 0xbc840011  ! 771: ADDcc_R	addcc 	%r16, %r17, %r30
	.word 0xa8f42c80  ! 771: UDIVcc_I	udivcc 	%r16, 0x0c80, %r20
	.word 0x8d3c2001  ! 772: SRA_I	sra 	%r16, 0x0001, %r6
	.word 0xbe0c2b32  ! 774: AND_I	and 	%r16, 0x0b32, %r31
	.word 0xbc140011  ! 774: OR_R	or 	%r16, %r17, %r30
	.word 0xac840011  ! 774: ADDcc_R	addcc 	%r16, %r17, %r22
	.word 0xf00c2eb5  ! 774: LDUB_I	ldub	[%r16 + 0x0eb5], %r24
	.word 0x92ac2850  ! 775: ANDNcc_I	andncc 	%r16, 0x0850, %r9
	.word 0xbd341011  ! 777: SRLX_R	srlx	%r16, %r17, %r30
	.word 0x92340011  ! 777: ORN_R	orn 	%r16, %r17, %r9
	.word 0xaad40011  ! 777: UMULcc_R	umulcc 	%r16, %r17, %r21
thr1_irf_ce_43:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_43), 16, 16),1,IRF,ce,23,x, x,x,x, x,x,x)
	.word 0xd4242d07  ! 780: STW_I	stw	%r10, [%r16 + 0x0d07]
	.word 0x81580000  ! 782: FLUSHW	flushw
	.word 0x9d3c1011  ! 783: SRAX_R	srax	%r16, %r17, %r14
	.word 0xa81c2100  ! 785: XOR_I	xor 	%r16, 0x0100, %r20
	.word 0x86040011  ! 785: ADD_R	add 	%r16, %r17, %r3
thr1_resum_intr_17:
!$EV trig_pc_d(1,expr(@VA(.MAIN.thr1_resum_intr_17), 16, 16)) -> intp(1, 3, 1)
	wr      %r0, 0x5, %asr26
	.word 0x9c9c0011  ! 786: XORcc_R	xorcc 	%r16, %r17, %r14
	.word 0xd08c224f  ! 788: LDUBA_I	lduba	[%r16, + 0x024f] %asi, %r8
	.word 0xf02c2221  ! 790: STB_I	stb	%r24, [%r16 + 0x0221]
	.word 0x969c2eaf  ! 792: XORcc_I	xorcc 	%r16, 0x0eaf, %r11
	ta	T_CHANGE_NONPRIV	! macro
thr1_irf_ce_44:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_44), 16, 16),1,IRF,ce,33,x, x,x,x, x,x,x)
	.word 0xde242ec7  ! 795: STW_I	stw	%r15, [%r16 + 0x0ec7]
	.word 0xa6c40011  ! 797: ADDCcc_R	addccc 	%r16, %r17, %r19
	.word 0x9c342bf2  ! 797: ORN_I	orn 	%r16, 0x0bf2, %r14
	.word 0x8b520000  ! 797: RDPR_PIL	rdpr	%pil, %r5
	.word 0xc62c2e39  ! 799: STB_I	stb	%r3, [%r16 + 0x0e39]
	.word 0x9c8c0011  ! 801: ANDcc_R	andcc 	%r16, %r17, %r14
	.word 0xf47c2b37  ! 801: SWAP_I	swap	%r26, [%r16 + 0x0b37]
	.word 0xb0440011  ! 802: ADDC_R	addc 	%r16, %r17, %r24
	.word 0x92b40011  ! 804: ORNcc_R	orncc 	%r16, %r17, %r9
	.word 0xae0c0011  ! 804: AND_R	and 	%r16, %r17, %r23
	.word 0xc2442058  ! 804: LDSW_I	ldsw	[%r16 + 0x0058], %r1
	.word 0xb4a4259f  ! 805: SUBcc_I	subcc 	%r16, 0x059f, %r26
	.word 0xde4c2188  ! 807: LDSB_I	ldsb	[%r16 + 0x0188], %r15
	.word 0xc2342899  ! 809: STH_I	sth	%r1, [%r16 + 0x0899]
	.word 0xa61c274d  ! 811: XOR_I	xor 	%r16, 0x074d, %r19
	.word 0x9a440011  ! 811: ADDC_R	addc 	%r16, %r17, %r13
	.word 0xacf42761  ! 811: UDIVcc_I	udivcc 	%r16, 0x0761, %r22
	.word 0xa92c1011  ! 812: SLLX_R	sllx	%r16, %r17, %r20
	.word 0x873c2001  ! 814: SRA_I	sra 	%r16, 0x0001, %r3
	.word 0x880c0011  ! 814: AND_R	and 	%r16, %r17, %r4
	.word 0x8e34227f  ! 814: ORN_I	orn 	%r16, 0x027f, %r7
	.word 0x89242426  ! 814: MULScc_I	mulscc 	%r16, 0x0426, %r4
thr1_irf_ce_45:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_45), 16, 16),1,IRF,ce,53,x, x,x,x, x,x,x)
	.word 0xca242a05  ! 817: STW_I	stw	%r5, [%r16 + 0x0a05]
thr1_resum_intr_18:
!$EV trig_pc_d(1,expr(@VA(.MAIN.thr1_resum_intr_18), 16, 16)) -> intp(1, 3, 1)
	wr      %r0, 0x5, %asr26
thr1_irf_ce_46:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_46), 16, 16),1,IRF,ce,29,x, x,x,x, x,x,x)
	.word 0xca2426c5  ! 822: STW_I	stw	%r5, [%r16 + 0x06c5]
	.word 0x892c2001  ! 824: SLL_I	sll 	%r16, 0x0001, %r4
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x8b342001  ! 825: SRL_I	srl 	%r16, 0x0001, %r5
	.word 0x88ac0011  ! 827: ANDNcc_R	andncc 	%r16, %r17, %r4
	.word 0xde94269b  ! 827: LDUHA_I	lduha	[%r16, + 0x069b] %asi, %r15
	.word 0x932c3001  ! 828: SLLX_I	sllx	%r16, 0x0001, %r9
	.word 0x9a8c228f  ! 830: ANDcc_I	andcc 	%r16, 0x028f, %r13
	.word 0xbf3c1011  ! 830: SRAX_R	srax	%r16, %r17, %r31
	.word 0x94f42958  ! 830: UDIVcc_I	udivcc 	%r16, 0x0958, %r10
	.word 0xd2340011  ! 831: STH_R	sth	%r9, [%r16 + %r17]
	.word 0x940423d8  ! 833: ADD_I	add 	%r16, 0x03d8, %r10
	.word 0x937c0411  ! 833: MOVR_R	move	%r16, %r17, %r9
	.word 0x872c2001  ! 833: SLL_I	sll 	%r16, 0x0001, %r3
        wr %g0, 0x4, %fprs
thr1_irf_ce_47:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_47), 16, 16),1,IRF,ce,3,x, x,x,x, x,x,x)
	.word 0xe634215f  ! 836: STH_I	sth	%r19, [%r16 + 0x015f]
	.word 0xb4042e57  ! 838: ADD_I	add 	%r16, 0x0e57, %r26
	ta	T_CHANGE_NONHPRIV	! macro
thr1_irf_ce_48:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_48), 16, 16),1,IRF,ce,69,x, x,x,x, x,x,x)
	.word 0xdc242f33  ! 841: STW_I	stw	%r14, [%r16 + 0x0f33]
	.word 0x9e0c0011  ! 843: AND_R	and 	%r16, %r17, %r15
	.word 0x90942456  ! 843: ORcc_I	orcc 	%r16, 0x0456, %r8
	.word 0x88ac0011  ! 843: ANDNcc_R	andncc 	%r16, %r17, %r4
	.word 0xe8fc1011  ! 843: SWAPA_R	swapa	%r20, [%r16 + %r17] 0x80
	.word 0xb03c2fd3  ! 844: XNOR_I	xnor 	%r16, 0x0fd3, %r24
	.word 0x9e842b74  ! 846: ADDcc_I	addcc 	%r16, 0x0b74, %r15
	.word 0x96ac0011  ! 846: ANDNcc_R	andncc 	%r16, %r17, %r11
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xc8240011  ! 847: STW_R	stw	%r4, [%r16 + %r17]
	.word 0x85342001  ! 849: SRL_I	srl 	%r16, 0x0001, %r2
	.word 0xa6c4207a  ! 849: ADDCcc_I	addccc 	%r16, 0x007a, %r19
	.word 0x81880000  ! 849: RESTORED	saved
thr1_irf_ce_49:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_49), 16, 16),1,IRF,ce,52,x, x,x,x, x,x,x)
	.word 0xf47426d5  ! 852: STX_I	stx	%r26, [%r16 + 0x06d5]
	.word 0x8143e018  ! 854: MEMBAR	membar	#StoreStore | #Lookaside 
	.word 0x88440011  ! 855: ADDC_R	addc 	%r16, %r17, %r4
	.word 0x829c2eb6  ! 857: XORcc_I	xorcc 	%r16, 0x0eb6, %r1
	.word 0x992c1011  ! 857: SLLX_R	sllx	%r16, %r17, %r12
	.word 0x9cf40011  ! 857: UDIVcc_R	udivcc 	%r16, %r17, %r14
thr1_irf_ce_50:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_50), 16, 16),1,IRF,ce,51,x, x,x,x, x,x,x)
	.word 0xc434295d  ! 860: STH_I	sth	%r2, [%r16 + 0x095d]
	.word 0xa49c0011  ! 862: XORcc_R	xorcc 	%r16, %r17, %r18
	.word 0x95508000  ! 862: RDPR_TSTATE	rdpr	%tstate, %r10
	.word 0xee242daf  ! 864: STW_I	stw	%r23, [%r16 + 0x0daf]
	.word 0x8494210c  ! 866: ORcc_I	orcc 	%r16, 0x010c, %r2
	.word 0x9e440011  ! 866: ADDC_R	addc 	%r16, %r17, %r15
	.word 0xfd3c2d04  ! 866: STDF_I	std	%f30, [0x0d04, %r16]
	.word 0xb17c0411  ! 867: MOVR_R	move	%r16, %r17, %r24
	.word 0x861428a1  ! 869: OR_I	or 	%r16, 0x08a1, %r3
	.word 0xa8340011  ! 869: ORN_R	orn 	%r16, %r17, %r20
	.word 0x9b341011  ! 869: SRLX_R	srlx	%r16, %r17, %r13
	ta	T_CHANGE_HPRIV	! macro
	.word 0xbb3c2001  ! 870: SRA_I	sra 	%r16, 0x0001, %r29
	.word 0x84142974  ! 872: OR_I	or 	%r16, 0x0974, %r2
	.word 0xb694214d  ! 872: ORcc_I	orcc 	%r16, 0x014d, %r27
	.word 0xc36c2e20  ! 872: PREFETCH_I	prefetch	[%r16 + 0x0e20], #one_read
	.word 0xf4342d05  ! 874: STH_I	sth	%r26, [%r16 + 0x0d05]
	.word 0x9e84272a  ! 876: ADDcc_I	addcc 	%r16, 0x072a, %r15
	.word 0x8e8c237e  ! 876: ANDcc_I	andcc 	%r16, 0x037e, %r7
	.word 0xbf2c2001  ! 876: SLL_I	sll 	%r16, 0x0001, %r31
	.word 0xb24c0011  ! 876: MULX_R	mulx 	%r16, %r17, %r25
thr1_irf_ce_51:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_51), 16, 16),1,IRF,ce,34,x, x,x,x, x,x,x)
	.word 0xc42c2ce9  ! 879: STB_I	stb	%r2, [%r16 + 0x0ce9]
	.word 0x862c2811  ! 881: ANDN_I	andn 	%r16, 0x0811, %r3
	.word 0x94542006  ! 881: UMUL_I	umul 	%r16, 0x0006, %r10
	.word 0xae142422  ! 882: OR_I	or 	%r16, 0x0422, %r23
	.word 0x8c3c235f  ! 884: XNOR_I	xnor 	%r16, 0x035f, %r6
	.word 0xbe2c0011  ! 884: ANDN_R	andn 	%r16, %r17, %r31
	.word 0x96940011  ! 884: ORcc_R	orcc 	%r16, %r17, %r11
	.word 0x96740011  ! 884: UDIV_R	udiv 	%r16, %r17, %r11
	.word 0xce2c278b  ! 886: STB_I	stb	%r7, [%r16 + 0x078b]
	.word 0xb69c0011  ! 888: XORcc_R	xorcc 	%r16, %r17, %r27
	.word 0xb68c2329  ! 888: ANDcc_I	andcc 	%r16, 0x0329, %r27
	.word 0x30800003  ! 888: BA	ba,a	<label_0x3>
thr1_irf_ce_52:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_52), 16, 16),1,IRF,ce,55,x, x,x,x, x,x,x)
	.word 0xf4342a6b  ! 891: STH_I	sth	%r26, [%r16 + 0x0a6b]
	.word 0x921c0011  ! 893: XOR_R	xor 	%r16, %r17, %r9
	.word 0xb82c2a4a  ! 893: ANDN_I	andn 	%r16, 0x0a4a, %r28
	.word 0xc9240011  ! 893: STF_R	st	%f4, [%r17, %r16]
	.word 0xb82c0011  ! 894: ANDN_R	andn 	%r16, %r17, %r28
	.word 0x87480000  ! 896: RDHPR_HPSTATE	rdhpr	%hpstate, %r3
	.word 0xd8240011  ! 897: STW_R	stw	%r12, [%r16 + %r17]
	.word 0x2e800001  ! 899: BVS	bvs,a	<label_0x1>
	.word 0xd2242fa7  ! 901: STW_I	stw	%r9, [%r16 + 0x0fa7]
	.word 0xb63c0011  ! 903: XNOR_R	xnor 	%r16, %r17, %r27
	.word 0x88ac0011  ! 903: ANDNcc_R	andncc 	%r16, %r17, %r4
	.word 0x9a3c203f  ! 903: XNOR_I	xnor 	%r16, 0x003f, %r13
	.word 0x8d840011  ! 903: WRFPRS_R	wr	%r16, %r17, %fprs
thr1_irf_ce_53:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_53), 16, 16),1,IRF,ce,13,x, x,x,x, x,x,x)
	.word 0xd2342107  ! 906: STH_I	sth	%r9, [%r16 + 0x0107]
	.word 0xa92c1011  ! 908: SLLX_R	sllx	%r16, %r17, %r20
	.word 0xa9343001  ! 908: SRLX_I	srlx	%r16, 0x0001, %r20
	.word 0x81880000  ! 908: SAVED	saved
thr1_irf_ce_54:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_54), 16, 16),1,IRF,ce,54,x, x,x,x, x,x,x)
	.word 0xce2c2d4f  ! 911: STB_I	stb	%r7, [%r16 + 0x0d4f]
	.word 0xbc942726  ! 913: ORcc_I	orcc 	%r16, 0x0726, %r30
	.word 0x8c9c0011  ! 913: XORcc_R	xorcc 	%r16, %r17, %r6
	.word 0xc3ec2513  ! 913: PREFETCHA_I	prefetcha	[%r16, + 0x0513] %asi, #one_read
	.word 0xe6740011  ! 914: STX_R	stx	%r19, [%r16 + %r17]
	.word 0x8ab40011  ! 916: ORNcc_R	orncc 	%r16, %r17, %r5
	.word 0xcb3c21e5  ! 916: STDF_I	std	%f5, [0x01e5, %r16]
thr1_irf_ce_55:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_55), 16, 16),1,IRF,ce,43,x, x,x,x, x,x,x)
	.word 0xfe2420c5  ! 919: STW_I	stw	%r31, [%r16 + 0x00c5]
	.word 0x842c27f9  ! 921: ANDN_I	andn 	%r16, 0x07f9, %r2
	.word 0xd0d41011  ! 921: LDSHA_R	ldsha	[%r16, %r17] 0x80, %r8
	.word 0xf6242641  ! 923: STW_I	stw	%r27, [%r16 + 0x0641]
	.word 0x81880000  ! 925: RESTORED	saved
	.word 0xce340011  ! 926: STH_R	sth	%r7, [%r16 + %r17]
	.word 0x852c3001  ! 928: SLLX_I	sllx	%r16, 0x0001, %r2
	.word 0xb6b42fbc  ! 928: ORNcc_I	orncc 	%r16, 0x0fbc, %r27
	.word 0xc36c0011  ! 928: PREFETCH_R	prefetch	[%r16 + %r17], #one_read
	.word 0xdc240011  ! 929: STW_R	stw	%r14, [%r16 + %r17]
	.word 0x960421c3  ! 931: ADD_I	add 	%r16, 0x01c3, %r11
	.word 0xa5343001  ! 931: SRLX_I	srlx	%r16, 0x0001, %r18
	.word 0x9c0c0011  ! 931: AND_R	and 	%r16, %r17, %r14
	.word 0x81dc27ce  ! 931: FLUSH_I	dis not found

	.word 0xde342dbd  ! 933: STH_I	sth	%r15, [%r16 + 0x0dbd]
        wr %g0, 0x4, %fprs
	.word 0xde242391  ! 937: STW_I	stw	%r15, [%r16 + 0x0391]
	.word 0x8d643801  ! 939: MOVcc_I	<illegal instruction>
	.word 0x95340011  ! 939: SRL_R	srl 	%r16, %r17, %r10
	.word 0x91e40011  ! 939: SAVE_R	save	%r16, %r17, %r8
	.word 0xca342d4d  ! 941: STH_I	sth	%r5, [%r16 + 0x0d4d]
	.word 0x961c0011  ! 943: XOR_R	xor 	%r16, %r17, %r11
	.word 0xc3240011  ! 943: STF_R	st	%f1, [%r17, %r16]
	.word 0xe6340011  ! 944: STH_R	sth	%r19, [%r16 + %r17]
	.word 0x882c211f  ! 946: ANDN_I	andn 	%r16, 0x011f, %r4
	.word 0x9c8c0011  ! 946: ANDcc_R	andcc 	%r16, %r17, %r14
	.word 0x08800001  ! 946: BLEU	bleu  	<label_0x1>
	.word 0xd6340011  ! 947: STH_R	sth	%r11, [%r16 + %r17]
	.word 0x973c2001  ! 949: SRA_I	sra 	%r16, 0x0001, %r11
	.word 0x9e040011  ! 949: ADD_R	add 	%r16, %r17, %r15
	.word 0xc3ec2802  ! 949: PREFETCHA_I	prefetcha	[%r16, + 0x0802] %asi, #one_read
	.word 0xbd641811  ! 950: MOVcc_R	<illegal instruction>
	.word 0x92c40011  ! 952: ADDCcc_R	addccc 	%r16, %r17, %r9
	.word 0xbd7c2401  ! 952: MOVR_I	move	%r16, 0xfffffff8, %r30
	.word 0x9f414000  ! 952: RDPC	rd	%pc, %r15
	.word 0xe424250f  ! 954: STW_I	stw	%r18, [%r16 + 0x050f]
	.word 0xa4442fbd  ! 956: ADDC_I	addc 	%r16, 0x0fbd, %r18
	.word 0x853c0011  ! 956: SRA_R	sra 	%r16, %r17, %r2
thr1_resum_intr_19:
!$EV trig_pc_d(1,expr(@VA(.MAIN.thr1_resum_intr_19), 16, 16)) -> intp(1, 3, 1)
	wr      %r0, 0x5, %asr26
	.word 0xec740011  ! 957: STX_R	stx	%r22, [%r16 + %r17]
	.word 0x993c2001  ! 959: SRA_I	sra 	%r16, 0x0001, %r12
	.word 0xa8040011  ! 959: ADD_R	add 	%r16, %r17, %r20
	.word 0xcd240011  ! 959: STF_R	st	%f6, [%r17, %r16]
	.word 0x8c9c0011  ! 960: XORcc_R	xorcc 	%r16, %r17, %r6
	.word 0xa8040011  ! 962: ADD_R	add 	%r16, %r17, %r20
	.word 0x89343001  ! 962: SRLX_I	srlx	%r16, 0x0001, %r4
	.word 0x973c1011  ! 962: SRAX_R	srax	%r16, %r17, %r11
        wr %g0, 0x4, %fprs
	.word 0xc22420b7  ! 964: STW_I	stw	%r1, [%r16 + 0x00b7]
	.word 0x8c9c0011  ! 966: XORcc_R	xorcc 	%r16, %r17, %r6
	.word 0xb7500000  ! 966: RDPR_TPC	<illegal instruction>
	.word 0xd62c2f77  ! 968: STB_I	stb	%r11, [%r16 + 0x0f77]
	.word 0x96340011  ! 970: ORN_R	orn 	%r16, %r17, %r11
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xcc242c3d  ! 972: STW_I	stw	%r6, [%r16 + 0x0c3d]
	.word 0x96840011  ! 974: ADDcc_R	addcc 	%r16, %r17, %r11
	.word 0x85343001  ! 974: SRLX_I	srlx	%r16, 0x0001, %r2
        wr %g0, 0x4, %fprs
thr1_irf_ce_56:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_56), 16, 16),1,IRF,ce,15,x, x,x,x, x,x,x)
	.word 0xce3425e9  ! 977: STH_I	sth	%r7, [%r16 + 0x05e9]
	.word 0xb3343001  ! 979: SRLX_I	srlx	%r16, 0x0001, %r25
	.word 0x90142453  ! 979: OR_I	or 	%r16, 0x0453, %r8
	.word 0xb28c2ca8  ! 979: ANDcc_I	andcc 	%r16, 0x0ca8, %r25
	.word 0x22c40001  ! 979: BRZ	brz,a,nt	%16,<label_0x40001>
thr1_irf_ce_57:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_57), 16, 16),1,IRF,ce,54,x, x,x,x, x,x,x)
	.word 0xe6242451  ! 982: STW_I	stw	%r19, [%r16 + 0x0451]
	.word 0x9f343001  ! 984: SRLX_I	srlx	%r16, 0x0001, %r15
	.word 0xba3c274a  ! 984: XNOR_I	xnor 	%r16, 0x074a, %r29
	.word 0x862c2bc1  ! 984: ANDN_I	andn 	%r16, 0x0bc1, %r3
	.word 0x81dc2168  ! 984: FLUSH_I	dis not found

	.word 0xcc740011  ! 985: STX_R	stx	%r6, [%r16 + %r17]
	.word 0xa68420f6  ! 987: ADDcc_I	addcc 	%r16, 0x00f6, %r19
        wr %g0, 0x4, %fprs
	.word 0xec2c0011  ! 988: STB_R	stb	%r22, [%r16 + %r17]
	.word 0x9e340011  ! 990: ORN_R	orn 	%r16, %r17, %r15
	.word 0xf8a41011  ! 990: STWA_R	stwa	%r28, [%r16 + %r17] 0x80
	.word 0xfe340011  ! 991: STH_R	sth	%r31, [%r16 + %r17]
	.word 0xd2140011  ! 993: LDUH_R	lduh	[%r16 + %r17], %r9
	.word 0x9b3c0011  ! 994: SRA_R	sra 	%r16, %r17, %r13
	.word 0xab341011  ! 996: SRLX_R	srlx	%r16, %r17, %r21
	.word 0x87342001  ! 996: SRL_I	srl 	%r16, 0x0001, %r3
	.word 0xb37c0411  ! 996: MOVR_R	move	%r16, %r17, %r25
	.word 0xb9a409d1  ! 996: FDIVd	fdivd	%f16, %f48, %f28
thr1_irf_ce_58:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_58), 16, 16),1,IRF,ce,58,x, x,x,x, x,x,x)
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
        setx  0x0000000000000ec0, %g1, %r17
        setx  0x832a4beee5aa9854, %g1, %r0
        setx  0xaf5c8d1e87ce2e9c, %g1, %r1
        setx  0xc19d53b1bada98a1, %g1, %r2
        setx  0xe7a295ded2d80dc3, %g1, %r3
        setx  0xf27942c6febe2a5b, %g1, %r4
        setx  0x5cd499ec1f6b600b, %g1, %r5
        setx  0x4f0f6d99ab36339b, %g1, %r6
        setx  0x0594d246b64164cb, %g1, %r7
        setx  0x127c4e79f4958fe6, %g1, %r8
        setx  0x261d657de51f6178, %g1, %r9
        setx  0xd50366bd27518173, %g1, %r10
        setx  0xeba1530ee0fca8d6, %g1, %r11
        setx  0x484b1beb0e676075, %g1, %r12
        setx  0xb93f2f8a7b00f8b4, %g1, %r13
        setx  0x0106c6fe5071857f, %g1, %r14
        setx  0x392ee26870067449, %g1, %r15
        setx  0x6243cd900f445adf, %g1, %r18
        setx  0x73205c90c62cde89, %g1, %r19
        setx  0xb2095c47383dd7ac, %g1, %r20
        setx  0x1343cab85348f1b8, %g1, %r21
        setx  0x5fb8186f23a95cce, %g1, %r22
        setx  0x339824b0e73b53ed, %g1, %r23
        setx  0xfb3e2704250cbe87, %g1, %r24
        setx  0xe39d68e8dadd32a6, %g1, %r25
        setx  0xc68fd35e38c4e9d3, %g1, %r26
        setx  0x9ed179473ea00027, %g1, %r27
        setx  0x2169a440a4cac4d0, %g1, %r28
        setx  0xd87b81835b5b704a, %g1, %r29
        setx  0x08ef4b936c595f4f, %g1, %r30
        setx  0x55e2afff577c6886, %g1, %r31
	save %r0, %r0, %r31
        setx  MAIN_BASE_DATA_VA, %r1, %r16
        setx  0x0000000000000ef0, %g1, %r17
        setx  0xbbdb6e6947c01dce, %g1, %r0
        setx  0x830bd91c92d858b8, %g1, %r1
        setx  0x6a360ad1738e2bc6, %g1, %r2
        setx  0x64e670195a26e42b, %g1, %r3
        setx  0xcee7cfcda3e38fe7, %g1, %r4
        setx  0x35da7d24595f8b16, %g1, %r5
        setx  0xb29bb87206fbe5a1, %g1, %r6
        setx  0x88ec7a8f6ce4f6c1, %g1, %r7
        setx  0x993a4a4c1c19a006, %g1, %r8
        setx  0x6ab42193b6fa38bc, %g1, %r9
        setx  0xb46663ad02a26797, %g1, %r10
        setx  0x8a3c076a071a4776, %g1, %r11
        setx  0x270fd3451751be4c, %g1, %r12
        setx  0xc0d96bce2092c8f5, %g1, %r13
        setx  0xea2358801d72e1fb, %g1, %r14
        setx  0x11772d84d99cf234, %g1, %r15
        setx  0x2226a8b6d4dc937a, %g1, %r18
        setx  0x8963408ec1217cf4, %g1, %r19
        setx  0xa302b9d7ad5d521c, %g1, %r20
        setx  0x756a1a1f880990fc, %g1, %r21
        setx  0xb38f6b3f36aae1da, %g1, %r22
        setx  0x1d23df9dcac935ca, %g1, %r23
        setx  0xfd218444550dc5ce, %g1, %r24
        setx  0xa32dcefe4f36a5d2, %g1, %r25
        setx  0xad8b983ad38c65a2, %g1, %r26
        setx  0x87507658f2a13b21, %g1, %r27
        setx  0x99fefbf760412c9d, %g1, %r28
        setx  0x587166e29606ff4b, %g1, %r29
        setx  0x660409a86672a62f, %g1, %r30
        setx  0xb111e1d973db4877, %g1, %r31
	save %r0, %r0, %r31
        setx  MAIN_BASE_DATA_VA, %r1, %r16
        setx  0x00000000000004b0, %g1, %r17
        setx  0x6f22118b2b9e0411, %g1, %r0
        setx  0x98a9aa140efe36ef, %g1, %r1
        setx  0xb3a3c577e4656e0a, %g1, %r2
        setx  0x3b2680306d3e1d7f, %g1, %r3
        setx  0x6351a28662dd4c49, %g1, %r4
        setx  0x913884c5e700dc01, %g1, %r5
        setx  0xc4b5a591395522d4, %g1, %r6
        setx  0xab50b58a03951024, %g1, %r7
        setx  0x65e612a6643d95b2, %g1, %r8
        setx  0xce774c5968535afa, %g1, %r9
        setx  0x50ec3f1d56f20fb6, %g1, %r10
        setx  0x4365e12a845635bd, %g1, %r11
        setx  0x4a42f969f75a3b58, %g1, %r12
        setx  0x67831f8ed99e7365, %g1, %r13
        setx  0xfd0bbac3500bec24, %g1, %r14
        setx  0xa2573dc81b47293a, %g1, %r15
        setx  0x115c9530cb253099, %g1, %r18
        setx  0x2e9094f0a73dfab4, %g1, %r19
        setx  0xb21237f9b967a3b1, %g1, %r20
        setx  0x1f4ae2a914fa51c4, %g1, %r21
        setx  0x18e1d30afa1f872e, %g1, %r22
        setx  0x3cb86d5601602126, %g1, %r23
        setx  0x9647b4ff1712c4d3, %g1, %r24
        setx  0x6339538b78b24b74, %g1, %r25
        setx  0x8b8e0755636d90d3, %g1, %r26
        setx  0xbc39070d89dc16b6, %g1, %r27
        setx  0xa3502197bfc85219, %g1, %r28
        setx  0x616c6fa98c04e3aa, %g1, %r29
        setx  0x252be0a9b4e1dd51, %g1, %r30
        setx  0xfc3823adaf0ceeb9, %g1, %r31
	save %r0, %r0, %r31
        setx  MAIN_BASE_DATA_VA, %r1, %r16
        setx  0x00000000000003b0, %g1, %r17
        setx  0x76346595c5f8d8f2, %g1, %r0
        setx  0xbbcd239480e965d3, %g1, %r1
        setx  0x5806bb8c82236a58, %g1, %r2
        setx  0x25a308ce51d40e42, %g1, %r3
        setx  0x9e2373d919c279dd, %g1, %r4
        setx  0x0835d8c2dfadb1d7, %g1, %r5
        setx  0x4223fb16b698bd5a, %g1, %r6
        setx  0x0e483a7e8abce394, %g1, %r7
        setx  0x1caff3a3cf5fca54, %g1, %r8
        setx  0x1d5b6315951d3f16, %g1, %r9
        setx  0x85fde7c686cc86f6, %g1, %r10
        setx  0x3f32ea4efd9c7801, %g1, %r11
        setx  0x0bfe2d58cfacd1c5, %g1, %r12
        setx  0xbab41e63912108a8, %g1, %r13
        setx  0x6c9bf44b558a7e0d, %g1, %r14
        setx  0x53a1606b348d0d95, %g1, %r15
        setx  0xe8b93f942fa46f95, %g1, %r18
        setx  0xa40d864f72a53486, %g1, %r19
        setx  0xc0afc178d2dac631, %g1, %r20
        setx  0x546c152f33a866c8, %g1, %r21
        setx  0xf36874ee20fdc31a, %g1, %r22
        setx  0x999af998219a4935, %g1, %r23
        setx  0x1facbde521299b13, %g1, %r24
        setx  0x93d633ba970b3e26, %g1, %r25
        setx  0xdb3980f58d747c7c, %g1, %r26
        setx  0xa7926f29057feac8, %g1, %r27
        setx  0xebf272360883e404, %g1, %r28
        setx  0xbe9908d627c9f453, %g1, %r29
        setx  0x4c60aa07ce89e841, %g1, %r30
        setx  0x95fa97f9fda541f7, %g1, %r31
	save %r0, %r0, %r31
        setx  MAIN_BASE_DATA_VA, %r1, %r16
        setx  0x0000000000000fa0, %g1, %r17
        setx  0x3e8407fb14867587, %g1, %r0
        setx  0xc5c8c044450a76d3, %g1, %r1
        setx  0x3709d41c17b5a7de, %g1, %r2
        setx  0xa868f3f92b342712, %g1, %r3
        setx  0x711b4995de0eaeee, %g1, %r4
        setx  0x1314c5d2d7dc72b0, %g1, %r5
        setx  0x276f3ee5a8d2ba30, %g1, %r6
        setx  0xa013a0587d544709, %g1, %r7
        setx  0x749864f98ef68eb6, %g1, %r8
        setx  0x0e484a541f9f216a, %g1, %r9
        setx  0x813d796d7052b87f, %g1, %r10
        setx  0x78d8b73558a32a43, %g1, %r11
        setx  0xe6e4efc1eb1b2e55, %g1, %r12
        setx  0xb943f752cdeef8d8, %g1, %r13
        setx  0x8ec32dfb9f726f5d, %g1, %r14
        setx  0x32f82a40d77abe27, %g1, %r15
        setx  0x537d74b2b4331e69, %g1, %r18
        setx  0x16ea291d200726eb, %g1, %r19
        setx  0x4bf7fa66f9d4148f, %g1, %r20
        setx  0x3aeaf7a36f50cfef, %g1, %r21
        setx  0x6ef4af84f828362b, %g1, %r22
        setx  0x9ca1ef45cb899912, %g1, %r23
        setx  0x328eedbd8798f4bf, %g1, %r24
        setx  0xd84ee626c1ee4e41, %g1, %r25
        setx  0x27976af96a5b79d9, %g1, %r26
        setx  0x4188071f150e436a, %g1, %r27
        setx  0x6cdb628291942ae7, %g1, %r28
        setx  0xbedd7b5bc970901e, %g1, %r29
        setx  0x20059ca1de5309db, %g1, %r30
        setx  0xfcaad1566f4ec056, %g1, %r31
	save %r0, %r0, %r31
        setx  MAIN_BASE_DATA_VA, %r1, %r16
        setx  0x0000000000000de0, %g1, %r17
        setx  0xd05fbdec10d810b2, %g1, %r0
        setx  0x3f33b2459fe4af16, %g1, %r1
        setx  0x927a7600b60f0a0f, %g1, %r2
        setx  0x9f3e2d4afb22e6e1, %g1, %r3
        setx  0x2f56a817cedcd1fa, %g1, %r4
        setx  0x1ab01b3a24cac593, %g1, %r5
        setx  0xd9b230ae9d0584f4, %g1, %r6
        setx  0x10ae7cff8c17b6fb, %g1, %r7
        setx  0x5bb4d2b4c5aa36f4, %g1, %r8
        setx  0xb2201ff5b4a8593a, %g1, %r9
        setx  0x702e23c83fc9372f, %g1, %r10
        setx  0x6779bccff1112d48, %g1, %r11
        setx  0xe8445fed436c9018, %g1, %r12
        setx  0xf225f5a3c7bdd51c, %g1, %r13
        setx  0xfda5b9407414b3ea, %g1, %r14
        setx  0x506e6ecc75f3fd3c, %g1, %r15
        setx  0x482b239ee5534915, %g1, %r18
        setx  0xf39a3619ce386bd7, %g1, %r19
        setx  0x9552b2aabc150680, %g1, %r20
        setx  0x65745fb124a4ff57, %g1, %r21
        setx  0x332fe7fc4036603b, %g1, %r22
        setx  0x5316345aa6062efd, %g1, %r23
        setx  0xce0811cac1250f09, %g1, %r24
        setx  0x5890bebc20f7dfdc, %g1, %r25
        setx  0xa7647a9481f1cbc5, %g1, %r26
        setx  0xa0284d525183ce29, %g1, %r27
        setx  0x3666a88dafca9ae7, %g1, %r28
        setx  0x9748fac616e2ce47, %g1, %r29
        setx  0xb3c9e99d2db101b0, %g1, %r30
        setx  0x759c3b800c3107ef, %g1, %r31
	save %r0, %r0, %r31
        setx  MAIN_BASE_DATA_VA, %r1, %r16
        setx  0x0000000000000130, %g1, %r17
        setx  0x9e2811df0c13c07c, %g1, %r0
        setx  0x09e2d5ce13636b40, %g1, %r1
        setx  0x112946d42d527dde, %g1, %r2
        setx  0x6c129e83226064ec, %g1, %r3
        setx  0xbdbafb97ee2d2bd1, %g1, %r4
        setx  0x22e727a03887fafc, %g1, %r5
        setx  0x5d19ed8a79749c1a, %g1, %r6
        setx  0x74e9b0c09e35d7de, %g1, %r7
        setx  0x1ddaf5f81a8f1dae, %g1, %r8
        setx  0xf5ac2f0aa4e6184e, %g1, %r9
        setx  0xcfdbe9d42ae479cb, %g1, %r10
        setx  0x09fc6b566c04b75a, %g1, %r11
        setx  0x8e68907962422341, %g1, %r12
        setx  0x73aa925cd8344c0f, %g1, %r13
        setx  0x01386d9be011047b, %g1, %r14
        setx  0x5c46e435e35cd3a7, %g1, %r15
        setx  0x87de4b24f35e6dcb, %g1, %r18
        setx  0x012f32db54721f80, %g1, %r19
        setx  0xbd7add0ba77a32be, %g1, %r20
        setx  0xda0b60795b937b01, %g1, %r21
        setx  0x9f333927f175c979, %g1, %r22
        setx  0x41010f51b8fc1654, %g1, %r23
        setx  0x4f40d1a637330288, %g1, %r24
        setx  0xbc07c165ebcc4346, %g1, %r25
        setx  0xcc81c52fe4175187, %g1, %r26
        setx  0xa0f841d8a12234de, %g1, %r27
        setx  0x5484567a8fd85e5e, %g1, %r28
        setx  0x486acf263e11159e, %g1, %r29
        setx  0x4c14d29646d3a434, %g1, %r30
        setx  0xd491ca6ff6301332, %g1, %r31
	save %r0, %r0, %r31
        setx  MAIN_BASE_DATA_VA, %r1, %r16
        setx  0x0000000000000150, %g1, %r17
        setx  0x716fd1f88131ecbf, %g1, %r0
        setx  0xf70f85798a992169, %g1, %r1
        setx  0x8548388781e924e8, %g1, %r2
        setx  0xf07d0ec6e6f08760, %g1, %r3
        setx  0x77354fa4821d0c02, %g1, %r4
        setx  0x1cb71e542429dc7b, %g1, %r5
        setx  0x084fa1dbe4ada077, %g1, %r6
        setx  0xa64f7afb5511faf4, %g1, %r7
        setx  0x82c807dda5926e2e, %g1, %r8
        setx  0x86c0e28f210f7aa5, %g1, %r9
        setx  0xae70434a32eb1973, %g1, %r10
        setx  0x3076fe0dda911e3f, %g1, %r11
        setx  0x80156dd25e88881b, %g1, %r12
        setx  0x5a01e18048763100, %g1, %r13
        setx  0x227173e0f7aef07d, %g1, %r14
        setx  0x7396f586990628d2, %g1, %r15
        setx  0x0df860133222a97b, %g1, %r18
        setx  0x5f0a20c21361e92b, %g1, %r19
        setx  0x40cc9f5ce025664d, %g1, %r20
        setx  0x21846202b0fbe2db, %g1, %r21
        setx  0x06a71387e051e0fb, %g1, %r22
        setx  0xa34a309749802a39, %g1, %r23
        setx  0x1a20166b1b099895, %g1, %r24
        setx  0x139dac7d50e6b415, %g1, %r25
        setx  0x14db3aad39b5a34f, %g1, %r26
        setx  0x787f65d2eeaec51e, %g1, %r27
        setx  0xd9494f8b4223ada6, %g1, %r28
        setx  0x3dd4e9ce060c7af3, %g1, %r29
        setx  0x5e224181760b1745, %g1, %r30
        setx  0x2daa39ea786e3ddc, %g1, %r31
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
	.word 0x8cb42d4b  ! 0: ORNcc_I	orncc 	%r16, 0x0d4b, %r6
	.word 0xa8040011  ! 2: ADD_R	add 	%r16, %r17, %r20
	.word 0x9a840011  ! 2: ADDcc_R	addcc 	%r16, %r17, %r13
	.word 0xe84c2d4e  ! 2: LDSB_I	ldsb	[%r16 + 0x0d4e], %r20
	.word 0xd8240011  ! 3: STW_R	stw	%r12, [%r16 + %r17]
	.word 0x9c442fe2  ! 5: ADDC_I	addc 	%r16, 0x0fe2, %r14
	.word 0x8b51c000  ! 5: RDPR_TL	rdpr	%tl, %r5
	.word 0xca742d19  ! 7: STX_I	stx	%r5, [%r16 + 0x0d19]
	.word 0x98042ac5  ! 9: ADD_I	add 	%r16, 0x0ac5, %r12
	.word 0x9e9c0011  ! 9: XORcc_R	xorcc 	%r16, %r17, %r15
	.word 0xad3c1011  ! 9: SRAX_R	srax	%r16, %r17, %r22
	.word 0xc36c2a1f  ! 9: PREFETCH_I	prefetch	[%r16 + 0x0a1f], #one_read
	.word 0x8c140011  ! 10: OR_R	or 	%r16, %r17, %r6
	.word 0xa61c2e19  ! 12: XOR_I	xor 	%r16, 0x0e19, %r19
	.word 0x94942e62  ! 12: ORcc_I	orcc 	%r16, 0x0e62, %r10
	.word 0xaaac0011  ! 12: ANDNcc_R	andncc 	%r16, %r17, %r21
	.word 0xc36c252d  ! 12: PREFETCH_I	prefetch	[%r16 + 0x052d], #one_read
	.word 0xea2c22f9  ! 14: STB_I	stb	%r21, [%r16 + 0x02f9]
	.word 0xfc9c1011  ! 16: LDDA_R	ldda	[%r16, %r17] 0x80, %r30
	.word 0xda340011  ! 17: STH_R	sth	%r13, [%r16 + %r17]
	.word 0x89abc831  ! 19: FMOVVC	fmovs	%fcc1, %f17, %f4
	.word 0x8ea42fdc  ! 20: SUBcc_I	subcc 	%r16, 0x0fdc, %r7
	.word 0x8aac0011  ! 22: ANDNcc_R	andncc 	%r16, %r17, %r5
	.word 0x96840011  ! 22: ADDcc_R	addcc 	%r16, %r17, %r11
	.word 0x963c0011  ! 22: XNOR_R	xnor 	%r16, %r17, %r11
	.word 0x93514000  ! 22: RDPR_TBA	rdpr	%tba, %r9
	.word 0xd22c248d  ! 24: STB_I	stb	%r9, [%r16 + 0x048d]
	.word 0x82bc0011  ! 26: XNORcc_R	xnorcc 	%r16, %r17, %r1
	.word 0x97641811  ! 26: MOVcc_R	<illegal instruction>
	.word 0x9ebc26bb  ! 26: XNORcc_I	xnorcc 	%r16, 0x06bb, %r15
	.word 0xdea423f1  ! 26: STWA_I	stwa	%r15, [%r16 + 0x03f1] %asi
	.word 0x84b40011  ! 27: ORNcc_R	orncc 	%r16, %r17, %r2
	.word 0x992c1011  ! 29: SLLX_R	sllx	%r16, %r17, %r12
thr0_resum_intr_0:
!$EV trig_pc_d(0,expr(@VA(.MAIN.thr0_resum_intr_0), 16, 16)) -> intp(0, 3, 1)
	wr      %r0, 0x5, %asr26
	.word 0xdc240011  ! 30: STW_R	stw	%r14, [%r16 + %r17]
	.word 0x872c0011  ! 32: SLL_R	sll 	%r16, %r17, %r3
	.word 0x92040011  ! 32: ADD_R	add 	%r16, %r17, %r9
	.word 0x9e9c0011  ! 32: XORcc_R	xorcc 	%r16, %r17, %r15
	.word 0x8143c000  ! 32: STBAR	stbar
thr0_irf_ce_0:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_0), 16, 16),1,IRF,ce,68,x, x,x,x, x,x,x)
	.word 0xde742f83  ! 35: STX_I	stx	%r15, [%r16 + 0x0f83]
	.word 0x9a3427be  ! 37: ORN_I	orn 	%r16, 0x07be, %r13
thr0_resum_intr_1:
!$EV trig_pc_d(0,expr(@VA(.MAIN.thr0_resum_intr_1), 16, 16)) -> intp(0, 3, 1)
	wr      %r0, 0x5, %asr26
	.word 0x92942816  ! 38: ORcc_I	orcc 	%r16, 0x0816, %r9
	.word 0xac5c0011  ! 40: SMUL_R	smul 	%r16, %r17, %r22
	.word 0xd4240011  ! 41: STW_R	stw	%r10, [%r16 + %r17]
	.word 0x912c1011  ! 43: SLLX_R	sllx	%r16, %r17, %r8
	.word 0x8c3c0011  ! 43: XNOR_R	xnor 	%r16, %r17, %r6
	.word 0x8143c000  ! 43: STBAR	stbar
	.word 0xc4240011  ! 44: STW_R	stw	%r2, [%r16 + %r17]
	.word 0xb57c2401  ! 46: MOVR_I	move	%r16, 0xfffffff8, %r26
	.word 0x82142723  ! 46: OR_I	or 	%r16, 0x0723, %r1
	.word 0x90442300  ! 46: ADDC_I	addc 	%r16, 0x0300, %r8
	.word 0x87ac0a51  ! 46: FCMPd	fcmpd	%fcc<n>, %f16, %f48
	.word 0xf8240011  ! 47: STW_R	stw	%r28, [%r16 + %r17]
	.word 0xb5641811  ! 49: MOVcc_R	<illegal instruction>
	.word 0x8cbc0011  ! 49: XNORcc_R	xnorcc 	%r16, %r17, %r6
        wr %g0, 0x4, %fprs
	.word 0x9c34272d  ! 50: ORN_I	orn 	%r16, 0x072d, %r14
	.word 0xba8c2ee2  ! 52: ANDcc_I	andcc 	%r16, 0x0ee2, %r29
	.word 0x8b3c2001  ! 52: SRA_I	sra 	%r16, 0x0001, %r5
	.word 0xee442560  ! 52: LDSW_I	ldsw	[%r16 + 0x0560], %r23
	.word 0xda340011  ! 53: STH_R	sth	%r13, [%r16 + %r17]
	.word 0x8a042677  ! 55: ADD_I	add 	%r16, 0x0677, %r5
	.word 0xaeb424e8  ! 55: ORNcc_I	orncc 	%r16, 0x04e8, %r23
	.word 0x3a800001  ! 55: BCC	bcc,a	<label_0x1>
	.word 0xee242bab  ! 57: STW_I	stw	%r23, [%r16 + 0x0bab]
	.word 0xbaac28e2  ! 59: ANDNcc_I	andncc 	%r16, 0x08e2, %r29
	.word 0x98c40011  ! 59: ADDCcc_R	addccc 	%r16, %r17, %r12
	.word 0x820c22fb  ! 59: AND_I	and 	%r16, 0x02fb, %r1
	.word 0xccd41011  ! 59: LDSHA_R	ldsha	[%r16, %r17] 0x80, %r6
	.word 0xcc342b45  ! 61: STH_I	sth	%r6, [%r16 + 0x0b45]
	.word 0xaf341011  ! 63: SRLX_R	srlx	%r16, %r17, %r23
	.word 0xb3514000  ! 63: RDPR_TBA	<illegal instruction>
	.word 0xce740011  ! 64: STX_R	stx	%r7, [%r16 + %r17]
	.word 0x840c2fe2  ! 66: AND_I	and 	%r16, 0x0fe2, %r2
	.word 0x9eac2687  ! 66: ANDNcc_I	andncc 	%r16, 0x0687, %r15
	.word 0x81580000  ! 66: FLUSHW	flushw
	.word 0xb32c0011  ! 67: SLL_R	sll 	%r16, %r17, %r25
	.word 0x932c0011  ! 69: SLL_R	sll 	%r16, %r17, %r9
	.word 0x91342001  ! 69: SRL_I	srl 	%r16, 0x0001, %r8
	ta	T_CHANGE_PRIV	! macro
	.word 0xc8240011  ! 70: STW_R	stw	%r4, [%r16 + %r17]
	.word 0x10800003  ! 72: BA	ba  	<label_0x3>
	.word 0xda2c0011  ! 73: STB_R	stb	%r13, [%r16 + %r17]
	.word 0xa68c0011  ! 75: ANDcc_R	andcc 	%r16, %r17, %r19
	.word 0x81dc2f33  ! 75: FLUSH_I	dis not found

	.word 0x94bc29d9  ! 76: XNORcc_I	xnorcc 	%r16, 0x09d9, %r10
	.word 0xbb3c2001  ! 78: SRA_I	sra 	%r16, 0x0001, %r29
	.word 0xc36c0011  ! 78: PREFETCH_R	prefetch	[%r16 + %r17], #one_read
thr0_irf_ce_1:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_1), 16, 16),1,IRF,ce,57,x, x,x,x, x,x,x)
	.word 0xfa242907  ! 81: STW_I	stw	%r29, [%r16 + 0x0907]
	.word 0x2e800001  ! 83: BVS	bvs,a	<label_0x1>
	.word 0x8a142a1c  ! 84: OR_I	or 	%r16, 0x0a1c, %r5
	.word 0x88940011  ! 86: ORcc_R	orcc 	%r16, %r17, %r4
	.word 0xd4b41011  ! 86: STHA_R	stha	%r10, [%r16 + %r17] 0x80
	.word 0xd2740011  ! 87: STX_R	stx	%r9, [%r16 + %r17]
	.word 0x923c2166  ! 89: XNOR_I	xnor 	%r16, 0x0166, %r9
	.word 0xd4f41011  ! 89: STXA_R	stxa	%r10, [%r16 + %r17] 0x80
	.word 0x908c2594  ! 90: ANDcc_I	andcc 	%r16, 0x0594, %r8
	.word 0x8143c000  ! 92: STBAR	stbar
	.word 0xe4240011  ! 93: STW_R	stw	%r18, [%r16 + %r17]
	.word 0x9c942f4b  ! 95: ORcc_I	orcc 	%r16, 0x0f4b, %r14
	.word 0xb4840011  ! 95: ADDcc_R	addcc 	%r16, %r17, %r26
	.word 0xab643801  ! 95: MOVcc_I	<illegal instruction>
	.word 0x81880000  ! 95: RESTORED	saved
	.word 0x90140011  ! 96: OR_R	or 	%r16, %r17, %r8
	.word 0x965c2292  ! 98: SMUL_I	smul 	%r16, 0x0292, %r11
	.word 0xd63424df  ! 100: STH_I	sth	%r11, [%r16 + 0x04df]
	.word 0xbd2c3001  ! 102: SLLX_I	sllx	%r16, 0x0001, %r30
	.word 0xc61c2337  ! 102: LDD_I	ldd	[%r16 + 0x0337], %r3
	.word 0xc6342ac7  ! 104: STH_I	sth	%r3, [%r16 + 0x0ac7]
	.word 0xc3ec1011  ! 106: PREFETCHA_R	prefetcha	[%r16, %r17] 0x80, #one_read
thr0_irf_ce_2:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_2), 16, 16),1,IRF,ce,33,x, x,x,x, x,x,x)
	.word 0xc62c2b89  ! 109: STB_I	stb	%r3, [%r16 + 0x0b89]
	.word 0x9c8c2e6f  ! 111: ANDcc_I	andcc 	%r16, 0x0e6f, %r14
	.word 0x98042a94  ! 111: ADD_I	add 	%r16, 0x0a94, %r12
	.word 0xda942526  ! 111: LDUHA_I	lduha	[%r16, + 0x0526] %asi, %r13
	.word 0xc4340011  ! 112: STH_R	sth	%r2, [%r16 + %r17]
	.word 0xa4342bec  ! 114: ORN_I	orn 	%r16, 0x0bec, %r18
	.word 0x96042fed  ! 114: ADD_I	add 	%r16, 0x0fed, %r11
	.word 0xc8cc2a8d  ! 114: LDSBA_I	ldsba	[%r16, + 0x0a8d] %asi, %r4
	.word 0xca240011  ! 115: STW_R	stw	%r5, [%r16 + %r17]
	.word 0x8143e022  ! 117: MEMBAR	membar	#StoreLoad | #MemIssue 
	.word 0xd8740011  ! 118: STX_R	stx	%r12, [%r16 + %r17]
	.word 0xbb2c0011  ! 120: SLL_R	sll 	%r16, %r17, %r29
	.word 0xabe40011  ! 120: SAVE_R	save	%r16, %r17, %r21
	.word 0xd8240011  ! 121: STW_R	stw	%r12, [%r16 + %r17]
	.word 0x84c40011  ! 123: ADDCcc_R	addccc 	%r16, %r17, %r2
	.word 0xa73c1011  ! 123: SRAX_R	srax	%r16, %r17, %r19
        wr %g0, 0x4, %fprs
	.word 0xe62c2cbf  ! 125: STB_I	stb	%r19, [%r16 + 0x0cbf]
	.word 0x9034236e  ! 127: ORN_I	orn 	%r16, 0x036e, %r8
	.word 0x8c3c0011  ! 127: XNOR_R	xnor 	%r16, %r17, %r6
	.word 0x81dc0011  ! 127: FLUSH_R	dis not found

thr0_irf_ce_3:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_3), 16, 16),1,IRF,ce,4,x, x,x,x, x,x,x)
	.word 0xcc24204b  ! 130: STW_I	stw	%r6, [%r16 + 0x004b]
	.word 0x8b341011  ! 132: SRLX_R	srlx	%r16, %r17, %r5
	.word 0xc8dc2b87  ! 132: LDXA_I	ldxa	[%r16, + 0x0b87] %asi, %r4
	.word 0xc42c0011  ! 133: STB_R	stb	%r2, [%r16 + %r17]
	.word 0xc484238b  ! 135: LDUWA_I	lduwa	[%r16, + 0x038b] %asi, %r2
thr0_irf_ce_4:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_4), 16, 16),1,IRF,ce,57,x, x,x,x, x,x,x)
	.word 0xc4742311  ! 138: STX_I	stx	%r2, [%r16 + 0x0311]
	.word 0x88bc0011  ! 140: XNORcc_R	xnorcc 	%r16, %r17, %r4
	.word 0xac8c2f8f  ! 140: ANDcc_I	andcc 	%r16, 0x0f8f, %r22
	.word 0x893c0011  ! 140: SRA_R	sra 	%r16, %r17, %r4
	.word 0xbc4c25e6  ! 140: MULX_I	mulx 	%r16, 0x05e6, %r30
	.word 0xee740011  ! 141: STX_R	stx	%r23, [%r16 + %r17]
	.word 0x96ac253e  ! 143: ANDNcc_I	andncc 	%r16, 0x053e, %r11
	.word 0x8b3c1011  ! 143: SRAX_R	srax	%r16, %r17, %r5
	.word 0xb5a019b1  ! 143: FsTOq	dis not found

	.word 0xc22c0011  ! 144: STB_R	stb	%r1, [%r16 + %r17]
	.word 0xbebc297e  ! 146: XNORcc_I	xnorcc 	%r16, 0x097e, %r31
	.word 0xbc3c2dc8  ! 146: XNOR_I	xnor 	%r16, 0x0dc8, %r30
	.word 0x8d340011  ! 146: SRL_R	srl 	%r16, %r17, %r6
	.word 0x40000003  ! 146: CALL	call	disp30_3
	.word 0xcc242c0d  ! 148: STW_I	stw	%r6, [%r16 + 0x0c0d]
	.word 0x888420a6  ! 150: ADDcc_I	addcc 	%r16, 0x00a6, %r4
	.word 0xd6f41011  ! 150: STXA_R	stxa	%r11, [%r16 + %r17] 0x80
	.word 0xde240011  ! 151: STW_R	stw	%r15, [%r16 + %r17]
	.word 0x8abc0011  ! 153: XNORcc_R	xnorcc 	%r16, %r17, %r5
	ta	T_CHANGE_PRIV	! macro
	.word 0xce740011  ! 154: STX_R	stx	%r7, [%r16 + %r17]
	.word 0x8d3c1011  ! 156: SRAX_R	srax	%r16, %r17, %r6
	.word 0x952c1011  ! 156: SLLX_R	sllx	%r16, %r17, %r10
thr0_resum_intr_2:
!$EV trig_pc_d(0,expr(@VA(.MAIN.thr0_resum_intr_2), 16, 16)) -> intp(0, 3, 1)
	wr      %r0, 0x5, %asr26
	.word 0xd4742d53  ! 158: STX_I	stx	%r10, [%r16 + 0x0d53]
	.word 0x9f3c0011  ! 160: SRA_R	sra 	%r16, %r17, %r15
	.word 0x9f340011  ! 160: SRL_R	srl 	%r16, %r17, %r15
	.word 0xd28c264c  ! 160: LDUBA_I	lduba	[%r16, + 0x064c] %asi, %r9
	.word 0xd42c0011  ! 161: STB_R	stb	%r10, [%r16 + %r17]
	.word 0xc80c26f1  ! 163: LDUB_I	ldub	[%r16 + 0x06f1], %r4
	.word 0x8d2c3001  ! 164: SLLX_I	sllx	%r16, 0x0001, %r6
	.word 0x81dc232a  ! 166: FLUSH_I	dis not found

	.word 0xcc342f69  ! 168: STH_I	sth	%r6, [%r16 + 0x0f69]
        wr %g0, 0x4, %fprs
	.word 0xcc342733  ! 172: STH_I	sth	%r6, [%r16 + 0x0733]
	.word 0xe7242c06  ! 174: STF_I	st	%f19, [0x0c06, %r16]
	.word 0xc42c0011  ! 175: STB_R	stb	%r2, [%r16 + %r17]
	.word 0x9b3c2001  ! 177: SRA_I	sra 	%r16, 0x0001, %r13
	.word 0xac8c2a55  ! 177: ANDcc_I	andcc 	%r16, 0x0a55, %r22
        wr %g0, 0x4, %fprs
thr0_irf_ce_5:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_5), 16, 16),1,IRF,ce,41,x, x,x,x, x,x,x)
	.word 0xec2c2bb9  ! 180: STB_I	stb	%r22, [%r16 + 0x0bb9]
	.word 0x92340011  ! 182: ORN_R	orn 	%r16, %r17, %r9
	.word 0x81dc2281  ! 182: FLUSH_I	dis not found

thr0_irf_ce_6:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_6), 16, 16),1,IRF,ce,1,x, x,x,x, x,x,x)
	.word 0xd22c29af  ! 185: STB_I	stb	%r9, [%r16 + 0x09af]
	.word 0x8143c000  ! 187: STBAR	stbar
	.word 0xd2242c9b  ! 189: STW_I	stw	%r9, [%r16 + 0x0c9b]
	.word 0x86040011  ! 191: ADD_R	add 	%r16, %r17, %r3
	.word 0xb2bc25c4  ! 191: XNORcc_I	xnorcc 	%r16, 0x05c4, %r25
	.word 0xb97c2401  ! 191: MOVR_I	move	%r16, 0xfffffff8, %r28
	.word 0x8143e03f  ! 191: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #StoreStore | #Lookaside | #MemIssue 
	.word 0xd02c0011  ! 192: STB_R	stb	%r8, [%r16 + %r17]
	.word 0x8d3c1011  ! 194: SRAX_R	srax	%r16, %r17, %r6
	.word 0x841c0011  ! 194: XOR_R	xor 	%r16, %r17, %r2
	.word 0x97342001  ! 194: SRL_I	srl 	%r16, 0x0001, %r11
thr0_resum_intr_3:
!$EV trig_pc_d(0,expr(@VA(.MAIN.thr0_resum_intr_3), 16, 16)) -> intp(0, 3, 1)
	wr      %r0, 0x5, %asr26
thr0_irf_ce_7:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_7), 16, 16),1,IRF,ce,4,x, x,x,x, x,x,x)
	.word 0xd6342c65  ! 197: STH_I	sth	%r11, [%r16 + 0x0c65]
	.word 0x9b341011  ! 199: SRLX_R	srlx	%r16, %r17, %r13
	.word 0x9e0c20dc  ! 199: AND_I	and 	%r16, 0x00dc, %r15
	.word 0xbc542c10  ! 199: UMUL_I	umul 	%r16, 0x0c10, %r30
	.word 0xa88424ed  ! 200: ADDcc_I	addcc 	%r16, 0x04ed, %r20
	.word 0xd12427e3  ! 202: STF_I	st	%f8, [0x07e3, %r16]
	.word 0x98340011  ! 203: ORN_R	orn 	%r16, %r17, %r12
	.word 0x85641811  ! 205: MOVcc_R	<illegal instruction>
	.word 0xb6442c7d  ! 205: ADDC_I	addc 	%r16, 0x0c7d, %r27
	.word 0x8a7c0011  ! 205: SDIV_R	sdiv 	%r16, %r17, %r5
	.word 0xce740011  ! 206: STX_R	stx	%r7, [%r16 + %r17]
	.word 0x823c0011  ! 208: XNOR_R	xnor 	%r16, %r17, %r1
	.word 0x849c20b1  ! 208: XORcc_I	xorcc 	%r16, 0x00b1, %r2
	.word 0x8b3c1011  ! 208: SRAX_R	srax	%r16, %r17, %r5
	.word 0xf47c0011  ! 208: SWAP_R	swap	%r26, [%r16 + %r17]
	.word 0x8c240011  ! 209: SUB_R	sub 	%r16, %r17, %r6
	.word 0x8143e06d  ! 211: MEMBAR	membar	#LoadLoad | #LoadStore | #StoreStore | #MemIssue | #Sync 
	.word 0xcc2c274f  ! 213: STB_I	stb	%r6, [%r16 + 0x074f]
	.word 0xa80c0011  ! 215: AND_R	and 	%r16, %r17, %r20
	.word 0x8f7c0411  ! 215: MOVR_R	move	%r16, %r17, %r7
	.word 0x8143e027  ! 215: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #MemIssue 
	.word 0xc8340011  ! 216: STH_R	sth	%r4, [%r16 + %r17]
	.word 0x9e140011  ! 218: OR_R	or 	%r16, %r17, %r15
	.word 0x89ec0011  ! 218: RESTORE_R	restore	%r16, %r17, %r4
	.word 0xd2340011  ! 219: STH_R	sth	%r9, [%r16 + %r17]
	.word 0x8a44223f  ! 221: ADDC_I	addc 	%r16, 0x023f, %r5
	.word 0x980429ff  ! 221: ADD_I	add 	%r16, 0x09ff, %r12
	.word 0x8a840011  ! 221: ADDcc_R	addcc 	%r16, %r17, %r5
	.word 0x81dc203a  ! 221: FLUSH_I	dis not found

	.word 0xfa240011  ! 222: STW_R	stw	%r29, [%r16 + %r17]
	.word 0xb83c0011  ! 224: XNOR_R	xnor 	%r16, %r17, %r28
	.word 0xab2c1011  ! 224: SLLX_R	sllx	%r16, %r17, %r21
	.word 0xf85c0011  ! 224: LDX_R	ldx	[%r16 + %r17], %r28
	.word 0xee740011  ! 225: STX_R	stx	%r23, [%r16 + %r17]
thr0_resum_intr_4:
!$EV trig_pc_d(0,expr(@VA(.MAIN.thr0_resum_intr_4), 16, 16)) -> intp(0, 3, 1)
	wr      %r0, 0x5, %asr26
	.word 0xee3421e7  ! 229: STH_I	sth	%r23, [%r16 + 0x01e7]
	.word 0x89641811  ! 231: MOVcc_R	<illegal instruction>
	.word 0x98142a94  ! 231: OR_I	or 	%r16, 0x0a94, %r12
	.word 0xa6ac0011  ! 231: ANDNcc_R	andncc 	%r16, %r17, %r19
	.word 0xc36c2cbe  ! 231: PREFETCH_I	prefetch	[%r16 + 0x0cbe], #one_read
	.word 0xe6742df7  ! 233: STX_I	stx	%r19, [%r16 + 0x0df7]
	.word 0xaeb42511  ! 235: ORNcc_I	orncc 	%r16, 0x0511, %r23
	.word 0xab643801  ! 235: MOVcc_I	<illegal instruction>
	.word 0x98342a86  ! 235: ORN_I	orn 	%r16, 0x0a86, %r12
	.word 0x81dc2a7c  ! 235: FLUSH_I	dis not found

	.word 0xe6340011  ! 236: STH_R	sth	%r19, [%r16 + %r17]
	.word 0x8b7c0411  ! 238: MOVR_R	move	%r16, %r17, %r5
	.word 0x9a0c2ab6  ! 238: AND_I	and 	%r16, 0x0ab6, %r13
	.word 0x849c23ee  ! 238: XORcc_I	xorcc 	%r16, 0x03ee, %r2
	.word 0xb4fc2c71  ! 238: SDIVcc_I	sdivcc 	%r16, 0x0c71, %r26
	.word 0xc8740011  ! 239: STX_R	stx	%r4, [%r16 + %r17]
	.word 0xb23c2ba8  ! 241: XNOR_I	xnor 	%r16, 0x0ba8, %r25
	.word 0xd07c26f0  ! 241: SWAP_I	swap	%r8, [%r16 + 0x06f0]
	.word 0xc6240011  ! 242: STW_R	stw	%r3, [%r16 + %r17]
	.word 0x9d3c0011  ! 244: SRA_R	sra 	%r16, %r17, %r14
thr0_resum_intr_5:
!$EV trig_pc_d(0,expr(@VA(.MAIN.thr0_resum_intr_5), 16, 16)) -> intp(0, 3, 1)
	wr      %r0, 0x5, %asr26
	.word 0xa40c2551  ! 245: AND_I	and 	%r16, 0x0551, %r18
	.word 0xa6ac2d5e  ! 247: ANDNcc_I	andncc 	%r16, 0x0d5e, %r19
	.word 0xba0427ce  ! 247: ADD_I	add 	%r16, 0x07ce, %r29
	.word 0x84c421de  ! 247: ADDCcc_I	addccc 	%r16, 0x01de, %r2
	.word 0xc3ec2e54  ! 247: PREFETCHA_I	prefetcha	[%r16, + 0x0e54] %asi, #one_read
	.word 0x9a1c0011  ! 248: XOR_R	xor 	%r16, %r17, %r13
	.word 0xb8342c06  ! 250: ORN_I	orn 	%r16, 0x0c06, %r28
	.word 0xa69c2f2f  ! 250: XORcc_I	xorcc 	%r16, 0x0f2f, %r19
        wr %g0, 0x4, %fprs
	.word 0xe6342f77  ! 252: STH_I	sth	%r19, [%r16 + 0x0f77]
thr0_resum_intr_6:
!$EV trig_pc_d(0,expr(@VA(.MAIN.thr0_resum_intr_6), 16, 16)) -> intp(0, 3, 1)
	wr      %r0, 0x5, %asr26
	.word 0xe674273b  ! 256: STX_I	stx	%r19, [%r16 + 0x073b]
thr0_resum_intr_7:
!$EV trig_pc_d(0,expr(@VA(.MAIN.thr0_resum_intr_7), 16, 16)) -> intp(0, 3, 1)
	wr      %r0, 0x5, %asr26
	.word 0xe6742de1  ! 260: STX_I	stx	%r19, [%r16 + 0x0de1]
        wr %g0, 0x4, %fprs
	.word 0xd82c0011  ! 263: STB_R	stb	%r12, [%r16 + %r17]
	.word 0x8a942fd6  ! 265: ORcc_I	orcc 	%r16, 0x0fd6, %r5
	.word 0xb37c0411  ! 265: MOVR_R	move	%r16, %r17, %r25
	.word 0x8143e010  ! 265: MEMBAR	membar	#Lookaside 
	.word 0xf22423ad  ! 267: STW_I	stw	%r25, [%r16 + 0x03ad]
	.word 0xaaac0011  ! 269: ANDNcc_R	andncc 	%r16, %r17, %r21
	.word 0x8143c000  ! 269: STBAR	stbar
thr0_irf_ce_8:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_8), 16, 16),1,IRF,ce,18,x, x,x,x, x,x,x)
	.word 0xea742acb  ! 272: STX_I	stx	%r21, [%r16 + 0x0acb]
	.word 0x94942575  ! 274: ORcc_I	orcc 	%r16, 0x0575, %r10
	.word 0x8b2c0011  ! 274: SLL_R	sll 	%r16, %r17, %r5
	.word 0xca142ab2  ! 274: LDUH_I	lduh	[%r16 + 0x0ab2], %r5
	.word 0x933c1011  ! 275: SRAX_R	srax	%r16, %r17, %r9
	.word 0x94c40011  ! 277: ADDCcc_R	addccc 	%r16, %r17, %r10
	.word 0x0ccc0001  ! 277: BRGZ	brgz  ,pt	%16,<label_0xc0001>
	.word 0xea240011  ! 278: STW_R	stw	%r21, [%r16 + %r17]
	.word 0x8cc40011  ! 280: ADDCcc_R	addccc 	%r16, %r17, %r6
	.word 0xac0c298a  ! 280: AND_I	and 	%r16, 0x098a, %r22
	.word 0x8f643801  ! 280: MOVcc_I	<illegal instruction>
	.word 0x94f40011  ! 280: UDIVcc_R	udivcc 	%r16, %r17, %r10
	.word 0xd62c0011  ! 281: STB_R	stb	%r11, [%r16 + %r17]
	.word 0x8143e03c  ! 283: MEMBAR	membar	#LoadStore | #StoreStore | #Lookaside | #MemIssue 
	.word 0xd6342353  ! 285: STH_I	sth	%r11, [%r16 + 0x0353]
	.word 0xb6840011  ! 287: ADDcc_R	addcc 	%r16, %r17, %r27
	.word 0x9294259c  ! 287: ORcc_I	orcc 	%r16, 0x059c, %r9
	.word 0xd9f41011  ! 287: CASXA_I	casxa	[%r16] 0x80, %r17, %r12
thr0_irf_ce_9:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_9), 16, 16),1,IRF,ce,49,x, x,x,x, x,x,x)
	.word 0xd8742341  ! 290: STX_I	stx	%r12, [%r16 + 0x0341]
	.word 0xbb7c0411  ! 292: MOVR_R	move	%r16, %r17, %r29
	.word 0x89340011  ! 292: SRL_R	srl 	%r16, %r17, %r4
	.word 0x983429a5  ! 292: ORN_I	orn 	%r16, 0x09a5, %r12
	.word 0xe61c0011  ! 292: LDD_R	ldd	[%r16 + %r17], %r19
	.word 0xe67424d9  ! 294: STX_I	stx	%r19, [%r16 + 0x04d9]
	.word 0x99240011  ! 296: MULScc_R	mulscc 	%r16, %r17, %r12
thr0_irf_ce_10:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_10), 16, 16),1,IRF,ce,66,x, x,x,x, x,x,x)
	.word 0xd8742049  ! 299: STX_I	stx	%r12, [%r16 + 0x0049]
	.word 0x8d343001  ! 301: SRLX_I	srlx	%r16, 0x0001, %r6
	.word 0xb49c0011  ! 301: XORcc_R	xorcc 	%r16, %r17, %r26
	.word 0xb4b40011  ! 301: ORNcc_R	orncc 	%r16, %r17, %r26
	.word 0xf7242187  ! 301: STF_I	st	%f27, [0x0187, %r16]
	.word 0x9c340011  ! 302: SUBC_R	orn 	%r16, %r17, %r14
	.word 0x94440011  ! 304: ADDC_R	addc 	%r16, %r17, %r10
	.word 0xc8a42883  ! 304: STWA_I	stwa	%r4, [%r16 + 0x0883] %asi
	.word 0xc8342519  ! 306: STH_I	sth	%r4, [%r16 + 0x0519]
	.word 0xd47c23af  ! 308: SWAP_I	swap	%r10, [%r16 + 0x03af]
	.word 0xd4340011  ! 309: STH_R	sth	%r10, [%r16 + %r17]
	.word 0x89342001  ! 311: SRL_I	srl 	%r16, 0x0001, %r4
	.word 0x8143c000  ! 311: STBAR	stbar
	.word 0xc8342c97  ! 313: STH_I	sth	%r4, [%r16 + 0x0c97]
	.word 0x92b426a8  ! 315: ORNcc_I	orncc 	%r16, 0x06a8, %r9
	.word 0xb6042e1d  ! 315: ADD_I	add 	%r16, 0x0e1d, %r27
	.word 0x8d3c0011  ! 315: SRA_R	sra 	%r16, %r17, %r6
	.word 0xdb3c2437  ! 315: STDF_I	std	%f13, [0x0437, %r16]
thr0_irf_ce_11:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_11), 16, 16),1,IRF,ce,30,x, x,x,x, x,x,x)
	.word 0xda242b8f  ! 318: STW_I	stw	%r13, [%r16 + 0x0b8f]
	.word 0x96c40011  ! 320: ADDCcc_R	addccc 	%r16, %r17, %r11
	.word 0x96940011  ! 320: ORcc_R	orcc 	%r16, %r17, %r11
	.word 0xc4ac2ec5  ! 320: STBA_I	stba	%r2, [%r16 + 0x0ec5] %asi
	.word 0x8a9c24c9  ! 321: XORcc_I	xorcc 	%r16, 0x04c9, %r5
	ta	T_CHANGE_PRIV	! macro
	.word 0x8c342c1e  ! 324: ORN_I	orn 	%r16, 0x0c1e, %r6
	.word 0x968c2bbc  ! 326: ANDcc_I	andcc 	%r16, 0x0bbc, %r11
	.word 0x81dc2f50  ! 326: FLUSH_I	dis not found

	.word 0xe8240011  ! 327: STW_R	stw	%r20, [%r16 + %r17]
	.word 0x9a8c26d7  ! 329: ANDcc_I	andcc 	%r16, 0x06d7, %r13
	.word 0xa8842f76  ! 329: ADDcc_I	addcc 	%r16, 0x0f76, %r20
	.word 0x95242e1f  ! 329: MULScc_I	mulscc 	%r16, 0x0e1f, %r10
thr0_irf_ce_12:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_12), 16, 16),1,IRF,ce,38,x, x,x,x, x,x,x)
	.word 0xd43429ed  ! 332: STH_I	sth	%r10, [%r16 + 0x09ed]
	.word 0xb2842f9e  ! 334: ADDcc_I	addcc 	%r16, 0x0f9e, %r25
	.word 0xb40c2aef  ! 334: AND_I	and 	%r16, 0x0aef, %r26
	.word 0xbcdc0011  ! 334: SMULcc_R	smulcc 	%r16, %r17, %r30
	.word 0x91643801  ! 335: MOVcc_I	<illegal instruction>
	.word 0xc4f422d5  ! 337: STXA_I	stxa	%r2, [%r16 + 0x02d5] %asi
	.word 0xc4742cf3  ! 339: STX_I	stx	%r2, [%r16 + 0x0cf3]
thr0_resum_intr_8:
!$EV trig_pc_d(0,expr(@VA(.MAIN.thr0_resum_intr_8), 16, 16)) -> intp(0, 3, 1)
	wr      %r0, 0x5, %asr26
	.word 0xc4242c09  ! 343: STW_I	stw	%r2, [%r16 + 0x0c09]
	.word 0x97641811  ! 345: MOVcc_R	<illegal instruction>
	.word 0x9e4c2976  ! 345: MULX_I	mulx 	%r16, 0x0976, %r15
thr0_irf_ce_13:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_13), 16, 16),1,IRF,ce,66,x, x,x,x, x,x,x)
	.word 0xde2c2e0f  ! 348: STB_I	stb	%r15, [%r16 + 0x0e0f]
	.word 0x8d3c2001  ! 350: SRA_I	sra 	%r16, 0x0001, %r6
thr0_resum_intr_9:
!$EV trig_pc_d(0,expr(@VA(.MAIN.thr0_resum_intr_9), 16, 16)) -> intp(0, 3, 1)
	wr      %r0, 0x5, %asr26
	.word 0x8c9c0011  ! 351: XORcc_R	xorcc 	%r16, %r17, %r6
	.word 0x937c0411  ! 353: MOVR_R	move	%r16, %r17, %r9
	.word 0x8e040011  ! 353: ADD_R	add 	%r16, %r17, %r7
	.word 0xdcd41011  ! 353: LDSHA_R	ldsha	[%r16, %r17] 0x80, %r14
	.word 0xdc2c2f6d  ! 355: STB_I	stb	%r14, [%r16 + 0x0f6d]
	.word 0x88b423d2  ! 357: ORNcc_I	orncc 	%r16, 0x03d2, %r4
	.word 0xae2c27aa  ! 357: ANDN_I	andn 	%r16, 0x07aa, %r23
	.word 0xbb2c3001  ! 357: SLLX_I	sllx	%r16, 0x0001, %r29
	.word 0xb1ab4831  ! 357: FMOVCC	fmovs	%fcc1, %f17, %f24
	.word 0xf62c0011  ! 358: STB_R	stb	%r27, [%r16 + %r17]
	.word 0x96442729  ! 360: ADDC_I	addc 	%r16, 0x0729, %r11
	.word 0xab7c2401  ! 360: MOVR_I	move	%r16, 0xfffffff8, %r21
	.word 0xc36c2732  ! 360: PREFETCH_I	prefetch	[%r16 + 0x0732], #one_read
	.word 0xea742cbf  ! 362: STX_I	stx	%r21, [%r16 + 0x0cbf]
        wr %g0, 0x4, %fprs
	.word 0xde240011  ! 365: STW_R	stw	%r15, [%r16 + %r17]
	.word 0x98bc0011  ! 367: XNORcc_R	xnorcc 	%r16, %r17, %r12
	.word 0x97504000  ! 367: RDPR_TNPC	rdpr	%tnpc, %r11
	.word 0xd6242593  ! 369: STW_I	stw	%r11, [%r16 + 0x0593]
	.word 0x9351c000  ! 371: RDPR_TL	rdpr	%tl, %r9
thr0_irf_ce_14:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_14), 16, 16),1,IRF,ce,20,x, x,x,x, x,x,x)
	.word 0xd22c27fd  ! 374: STB_I	stb	%r9, [%r16 + 0x07fd]
	.word 0x9a3c0011  ! 376: XNOR_R	xnor 	%r16, %r17, %r13
	.word 0x908c0011  ! 376: ANDcc_R	andcc 	%r16, %r17, %r8
	.word 0xbba01a31  ! 376: FsTOi	dis not found

thr0_irf_ce_15:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_15), 16, 16),1,IRF,ce,8,x, x,x,x, x,x,x)
	.word 0xfa242efb  ! 379: STW_I	stw	%r29, [%r16 + 0x0efb]
	.word 0xb2ac0011  ! 381: ANDNcc_R	andncc 	%r16, %r17, %r25
	.word 0x9c8c23a5  ! 381: ANDcc_I	andcc 	%r16, 0x03a5, %r14
	.word 0xc46c22e3  ! 381: LDSTUB_I	ldstub	%r2, [%r16 + 0x02e3]
	.word 0xc42c24f7  ! 383: STB_I	stb	%r2, [%r16 + 0x04f7]
	.word 0x8abc0011  ! 385: XNORcc_R	xnorcc 	%r16, %r17, %r5
	ta	T_CHANGE_PRIV	! macro
thr0_irf_ce_16:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_16), 16, 16),1,IRF,ce,34,x, x,x,x, x,x,x)
	.word 0xca742d7d  ! 388: STX_I	stx	%r5, [%r16 + 0x0d7d]
	.word 0x84942ca0  ! 390: ORcc_I	orcc 	%r16, 0x0ca0, %r2
	.word 0x90140011  ! 390: OR_R	or 	%r16, %r17, %r8
	.word 0xc2ac1011  ! 390: STBA_R	stba	%r1, [%r16 + %r17] 0x80
	.word 0xc22c2c6b  ! 392: STB_I	stb	%r1, [%r16 + 0x0c6b]
	.word 0x94c40011  ! 394: ADDCcc_R	addccc 	%r16, %r17, %r10
	.word 0xc86c0011  ! 394: LDSTUB_R	ldstub	%r4, [%r16 + %r17]
	.word 0x872c2001  ! 395: SLL_I	sll 	%r16, 0x0001, %r3
	.word 0x860c23aa  ! 397: AND_I	and 	%r16, 0x03aa, %r3
	.word 0xe4b41011  ! 397: STHA_R	stha	%r18, [%r16 + %r17] 0x80
	.word 0xe4342afd  ! 399: STH_I	sth	%r18, [%r16 + 0x0afd]
	.word 0x9e1c21be  ! 401: XOR_I	xor 	%r16, 0x01be, %r15
	.word 0xafec0011  ! 401: RESTORE_R	restore	%r16, %r17, %r23
thr0_irf_ce_17:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_17), 16, 16),1,IRF,ce,7,x, x,x,x, x,x,x)
	.word 0xee342f21  ! 404: STH_I	sth	%r23, [%r16 + 0x0f21]
	.word 0x81880000  ! 406: RESTORED	saved
thr0_irf_ce_18:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_18), 16, 16),1,IRF,ce,34,x, x,x,x, x,x,x)
	.word 0xee2c2f4f  ! 409: STB_I	stb	%r23, [%r16 + 0x0f4f]
	.word 0x8143c000  ! 411: STBAR	stbar
	.word 0x96bc0011  ! 412: XNORcc_R	xnorcc 	%r16, %r17, %r11
	.word 0x9b7c2401  ! 414: MOVR_I	move	%r16, 0xfffffff8, %r13
	.word 0x95342001  ! 414: SRL_I	srl 	%r16, 0x0001, %r10
	.word 0xc3ec1011  ! 414: PREFETCHA_R	prefetcha	[%r16, %r17] 0x80, #one_read
thr0_irf_ce_19:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_19), 16, 16),1,IRF,ce,70,x, x,x,x, x,x,x)
	.word 0xd4242d01  ! 417: STW_I	stw	%r10, [%r16 + 0x0d01]
	.word 0x9e0c0011  ! 419: AND_R	and 	%r16, %r17, %r15
	.word 0x923c26e5  ! 419: XNOR_I	xnor 	%r16, 0x06e5, %r9
	.word 0x90140011  ! 419: OR_R	or 	%r16, %r17, %r8
	.word 0x22cc0001  ! 419: BRZ	brz,a,pt	%16,<label_0xc0001>
	.word 0x883c0011  ! 420: XNOR_R	xnor 	%r16, %r17, %r4
	.word 0xc61c0011  ! 422: LDD_R	ldd	[%r16 + %r17], %r3
	.word 0xc4240011  ! 423: STW_R	stw	%r2, [%r16 + %r17]
	.word 0xa8b429ac  ! 425: ORNcc_I	orncc 	%r16, 0x09ac, %r20
	.word 0x86140011  ! 425: OR_R	or 	%r16, %r17, %r3
	.word 0xfa5c2a6b  ! 425: LDX_I	ldx	[%r16 + 0x0a6b], %r29
	.word 0x8d7c2401  ! 426: MOVR_I	move	%r16, 0x7fffbdd8, %r6
	.word 0xaa7c29aa  ! 428: SDIV_I	sdiv 	%r16, 0x09aa, %r21
thr0_irf_ce_20:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_20), 16, 16),1,IRF,ce,22,x, x,x,x, x,x,x)
	.word 0xea342ddd  ! 431: STH_I	sth	%r21, [%r16 + 0x0ddd]
	.word 0xd08c1011  ! 433: LDUBA_R	lduba	[%r16, %r17] 0x80, %r8
	.word 0x92ac0011  ! 434: ANDNcc_R	andncc 	%r16, %r17, %r9
	.word 0xbab40011  ! 436: ORNcc_R	orncc 	%r16, %r17, %r29
	.word 0x881c0011  ! 436: XOR_R	xor 	%r16, %r17, %r4
	.word 0x85341011  ! 436: SRLX_R	srlx	%r16, %r17, %r2
	ta	T_CHANGE_HPRIV	! macro
thr0_irf_ce_21:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_21), 16, 16),1,IRF,ce,64,x, x,x,x, x,x,x)
	.word 0xc4342fed  ! 439: STH_I	sth	%r2, [%r16 + 0x0fed]
	.word 0xee7c2e3c  ! 441: SWAP_I	swap	%r23, [%r16 + 0x0e3c]
	.word 0x8f643801  ! 442: MOVcc_I	<illegal instruction>
	.word 0x93340011  ! 444: SRL_R	srl 	%r16, %r17, %r9
thr0_resum_intr_10:
!$EV trig_pc_d(0,expr(@VA(.MAIN.thr0_resum_intr_10), 16, 16)) -> intp(0, 3, 1)
	wr      %r0, 0x5, %asr26
	.word 0xc6240011  ! 445: STW_R	stw	%r3, [%r16 + %r17]
	.word 0xb5641811  ! 447: MOVcc_R	<illegal instruction>
	.word 0xfe6c20c6  ! 447: LDSTUB_I	ldstub	%r31, [%r16 + 0x00c6]
thr0_irf_ce_22:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_22), 16, 16),1,IRF,ce,36,x, x,x,x, x,x,x)
	.word 0xfe2427eb  ! 450: STW_I	stw	%r31, [%r16 + 0x07eb]
	.word 0x94840011  ! 452: ADDcc_R	addcc 	%r16, %r17, %r10
	.word 0x81580000  ! 452: FLUSHW	flushw
thr0_irf_ce_23:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_23), 16, 16),1,IRF,ce,31,x, x,x,x, x,x,x)
	.word 0xd4342d93  ! 455: STH_I	sth	%r10, [%r16 + 0x0d93]
	.word 0xa97c0411  ! 457: MOVR_R	move	%r16, %r17, %r20
	.word 0x98bc0011  ! 457: XNORcc_R	xnorcc 	%r16, %r17, %r12
	.word 0x94fc2752  ! 457: SDIVcc_I	sdivcc 	%r16, 0x0752, %r10
	.word 0xd4342e91  ! 459: STH_I	sth	%r10, [%r16 + 0x0e91]
	.word 0xbf2c2001  ! 461: SLL_I	sll 	%r16, 0x0001, %r31
	.word 0x24800003  ! 461: BLE	ble,a	<label_0x3>
	.word 0xfe2c2e0d  ! 463: STB_I	stb	%r31, [%r16 + 0x0e0d]
	.word 0x82c40011  ! 465: ADDCcc_R	addccc 	%r16, %r17, %r1
	.word 0x9c942647  ! 465: ORcc_I	orcc 	%r16, 0x0647, %r14
	.word 0x908c0011  ! 465: ANDcc_R	andcc 	%r16, %r17, %r8
	.word 0xdbe41011  ! 465: CASA_I	casa	[%r16] 0x80, %r17, %r13
	.word 0xda242f2f  ! 467: STW_I	stw	%r13, [%r16 + 0x0f2f]
	.word 0xc4bc2918  ! 469: STDA_I	stda	%r2, [%r16 + 0x0918] %asi
	.word 0xa82422b7  ! 470: SUB_I	sub 	%r16, 0x02b7, %r20
	.word 0x8d3c2001  ! 472: SRA_I	sra 	%r16, 0x0001, %r6
	.word 0xb0bc24f6  ! 472: XNORcc_I	xnorcc 	%r16, 0x04f6, %r24
	.word 0xa5641811  ! 472: MOVcc_R	<illegal instruction>
thr0_resum_intr_11:
!$EV trig_pc_d(0,expr(@VA(.MAIN.thr0_resum_intr_11), 16, 16)) -> intp(0, 3, 1)
	wr      %r0, 0x5, %asr26
thr0_irf_ce_24:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_24), 16, 16),1,IRF,ce,34,x, x,x,x, x,x,x)
	.word 0xe4242661  ! 475: STW_I	stw	%r18, [%r16 + 0x0661]
	.word 0xa4340011  ! 477: ORN_R	orn 	%r16, %r17, %r18
	.word 0x86bc0011  ! 477: XNORcc_R	xnorcc 	%r16, %r17, %r3
	.word 0x90ac0011  ! 477: ANDNcc_R	andncc 	%r16, %r17, %r8
thr0_resum_intr_12:
!$EV trig_pc_d(0,expr(@VA(.MAIN.thr0_resum_intr_12), 16, 16)) -> intp(0, 3, 1)
	wr      %r0, 0x5, %asr26
	.word 0xd024215f  ! 479: STW_I	stw	%r8, [%r16 + 0x015f]
	.word 0x90340011  ! 481: ORN_R	orn 	%r16, %r17, %r8
	.word 0x98ac2baa  ! 481: ANDNcc_I	andncc 	%r16, 0x0baa, %r12
	.word 0x8d340011  ! 481: SRL_R	srl 	%r16, %r17, %r6
	.word 0xc36c2564  ! 481: PREFETCH_I	prefetch	[%r16 + 0x0564], #one_read
	.word 0x8b7c2401  ! 482: MOVR_I	move	%r16, 0x7fffbdd8, %r5
	.word 0x8c9c2ce3  ! 484: XORcc_I	xorcc 	%r16, 0x0ce3, %r6
	.word 0xc36c2b8b  ! 484: PREFETCH_I	prefetch	[%r16 + 0x0b8b], #one_read
thr0_irf_ce_25:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_25), 16, 16),1,IRF,ce,30,x, x,x,x, x,x,x)
	.word 0xcc2c2289  ! 487: STB_I	stb	%r6, [%r16 + 0x0289]
	.word 0x00800001  ! 489: BN	bn  	<label_0x1>
	.word 0xcc2c242f  ! 491: STB_I	stb	%r6, [%r16 + 0x042f]
	.word 0xac2c0011  ! 493: ANDN_R	andn 	%r16, %r17, %r22
	.word 0xa6942d7b  ! 493: ORcc_I	orcc 	%r16, 0x0d7b, %r19
	.word 0xb4bc0011  ! 493: XNORcc_R	xnorcc 	%r16, %r17, %r26
	.word 0x8143e065  ! 493: MEMBAR	membar	#LoadLoad | #LoadStore | #MemIssue | #Sync 
	.word 0x9b7c0411  ! 494: MOVR_R	move	%r16, %r17, %r13
	.word 0x84440011  ! 496: ADDC_R	addc 	%r16, %r17, %r2
	.word 0xa6b42aa9  ! 496: ORNcc_I	orncc 	%r16, 0x0aa9, %r19
	.word 0x0acc0001  ! 496: BRNZ	brnz  ,pt	%16,<label_0xc0001>
thr0_irf_ce_26:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_26), 16, 16),1,IRF,ce,56,x, x,x,x, x,x,x)
	.word 0xe634236f  ! 499: STH_I	sth	%r19, [%r16 + 0x036f]
	ta	T_CHANGE_HPRIV	! macro
	.word 0xe6242827  ! 503: STW_I	stw	%r19, [%r16 + 0x0827]
	.word 0xbc442284  ! 505: ADDC_I	addc 	%r16, 0x0284, %r30
	.word 0xbc040011  ! 505: ADD_R	add 	%r16, %r17, %r30
	.word 0xe53c0011  ! 505: STDF_R	std	%f18, [%r17, %r16]
	.word 0xb6a40011  ! 506: SUBcc_R	subcc 	%r16, %r17, %r27
	.word 0x9484245e  ! 508: ADDcc_I	addcc 	%r16, 0x045e, %r10
	.word 0xc36c2203  ! 508: PREFETCH_I	prefetch	[%r16 + 0x0203], #one_read
	.word 0xd6340011  ! 509: STH_R	sth	%r11, [%r16 + %r17]
	.word 0x8d2c1011  ! 511: SLLX_R	sllx	%r16, %r17, %r6
	.word 0xaf340011  ! 511: SRL_R	srl 	%r16, %r17, %r23
	.word 0x86ac2e37  ! 511: ANDNcc_I	andncc 	%r16, 0x0e37, %r3
	.word 0x81580000  ! 511: FLUSHW	flushw
	.word 0xc82c0011  ! 512: STB_R	stb	%r4, [%r16 + %r17]
	.word 0xad340011  ! 514: SRL_R	srl 	%r16, %r17, %r22
	.word 0x95641811  ! 514: MOVcc_R	<illegal instruction>
	.word 0xaa84296e  ! 514: ADDcc_I	addcc 	%r16, 0x096e, %r21
	.word 0x81880000  ! 514: SAVED	saved
	.word 0xea2c206d  ! 516: STB_I	stb	%r21, [%r16 + 0x006d]
	.word 0x992c0011  ! 518: SLL_R	sll 	%r16, %r17, %r12
        wr %g0, 0x4, %fprs
	.word 0xfa2c0011  ! 519: STB_R	stb	%r29, [%r16 + %r17]
	.word 0x9c840011  ! 521: ADDcc_R	addcc 	%r16, %r17, %r14
	.word 0x8bec0011  ! 521: RESTORE_R	restore	%r16, %r17, %r5
thr0_irf_ce_27:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_27), 16, 16),1,IRF,ce,28,x, x,x,x, x,x,x)
	.word 0xca242549  ! 524: STW_I	stw	%r5, [%r16 + 0x0549]
	.word 0x9e842491  ! 526: ADDcc_I	addcc 	%r16, 0x0491, %r15
	.word 0x832c1011  ! 526: SLLX_R	sllx	%r16, %r17, %r1
	.word 0xdc4c2f0f  ! 526: LDSB_I	ldsb	[%r16 + 0x0f0f], %r14
thr0_irf_ce_28:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_28), 16, 16),1,IRF,ce,10,x, x,x,x, x,x,x)
	.word 0xdc342d33  ! 529: STH_I	sth	%r14, [%r16 + 0x0d33]
	.word 0x8fa40931  ! 531: FMULs	fmuls	%f16, %f17, %f7
	.word 0x909c2d79  ! 532: XORcc_I	xorcc 	%r16, 0x0d79, %r8
	.word 0x993c1011  ! 534: SRAX_R	srax	%r16, %r17, %r12
	.word 0xb2042857  ! 534: ADD_I	add 	%r16, 0x0857, %r25
	.word 0x98840011  ! 534: ADDcc_R	addcc 	%r16, %r17, %r12
	.word 0x81580000  ! 534: FLUSHW	flushw
	.word 0x96240011  ! 535: SUB_R	sub 	%r16, %r17, %r11
	.word 0xb60c0011  ! 537: AND_R	and 	%r16, %r17, %r27
	.word 0xad641811  ! 537: MOVcc_R	<illegal instruction>
	.word 0x9a440011  ! 537: ADDC_R	addc 	%r16, %r17, %r13
	.word 0x00800003  ! 537: BN	bn  	<label_0x3>
	.word 0xce740011  ! 538: STX_R	stx	%r7, [%r16 + %r17]
        wr %g0, 0x4, %fprs
	.word 0xd0740011  ! 541: STX_R	stx	%r8, [%r16 + %r17]
	.word 0xa61c0011  ! 543: XOR_R	xor 	%r16, %r17, %r19
thr0_resum_intr_13:
!$EV trig_pc_d(0,expr(@VA(.MAIN.thr0_resum_intr_13), 16, 16)) -> intp(0, 3, 1)
	wr      %r0, 0x5, %asr26
	.word 0xfc340011  ! 544: STH_R	sth	%r30, [%r16 + %r17]
	.word 0x9af40011  ! 546: UDIVcc_R	udivcc 	%r16, %r17, %r13
	.word 0xda2c2f11  ! 548: STB_I	stb	%r13, [%r16 + 0x0f11]
	.word 0x8cc40011  ! 550: ADDCcc_R	addccc 	%r16, %r17, %r6
	.word 0xb3ec0011  ! 550: RESTORE_R	restore	%r16, %r17, %r25
	.word 0xdc740011  ! 551: STX_R	stx	%r14, [%r16 + %r17]
	.word 0xa40c296c  ! 553: AND_I	and 	%r16, 0x096c, %r18
	.word 0x8c1421c9  ! 553: OR_I	or 	%r16, 0x01c9, %r6
	.word 0x9cd4266f  ! 553: UMULcc_I	umulcc 	%r16, 0x066f, %r14
	.word 0xdc2c2adb  ! 555: STB_I	stb	%r14, [%r16 + 0x0adb]
	.word 0x96b40011  ! 557: ORNcc_R	orncc 	%r16, %r17, %r11
	.word 0xb2b42d04  ! 557: ORNcc_I	orncc 	%r16, 0x0d04, %r25
	.word 0x82ac0011  ! 557: ANDNcc_R	andncc 	%r16, %r17, %r1
        wr %g0, 0x4, %fprs
	.word 0xc22c27fb  ! 559: STB_I	stb	%r1, [%r16 + 0x07fb]
thr0_resum_intr_14:
!$EV trig_pc_d(0,expr(@VA(.MAIN.thr0_resum_intr_14), 16, 16)) -> intp(0, 3, 1)
	wr      %r0, 0x5, %asr26
	.word 0xc2342c3d  ! 563: STH_I	sth	%r1, [%r16 + 0x0c3d]
	.word 0x882c0011  ! 565: ANDN_R	andn 	%r16, %r17, %r4
	.word 0x921c2cee  ! 565: XOR_I	xor 	%r16, 0x0cee, %r9
	.word 0x9a4c24ba  ! 565: MULX_I	mulx 	%r16, 0x04ba, %r13
	.word 0xd2340011  ! 566: STH_R	sth	%r9, [%r16 + %r17]
thr0_resum_intr_15:
!$EV trig_pc_d(0,expr(@VA(.MAIN.thr0_resum_intr_15), 16, 16)) -> intp(0, 3, 1)
	wr      %r0, 0x5, %asr26
	.word 0xc6740011  ! 569: STX_R	stx	%r3, [%r16 + %r17]
        wr %g0, 0x4, %fprs
	.word 0x8ea42b51  ! 572: SUBcc_I	subcc 	%r16, 0x0b51, %r7
        wr %g0, 0x4, %fprs
thr0_irf_ce_29:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_29), 16, 16),1,IRF,ce,55,x, x,x,x, x,x,x)
	.word 0xce34249f  ! 577: STH_I	sth	%r7, [%r16 + 0x049f]
	.word 0x8c542c78  ! 579: UMUL_I	umul 	%r16, 0x0c78, %r6
	.word 0x88040011  ! 580: ADD_R	add 	%r16, %r17, %r4
	.word 0xb0b42958  ! 582: ORNcc_I	orncc 	%r16, 0x0958, %r24
	.word 0x95341011  ! 582: SRLX_R	srlx	%r16, %r17, %r10
	.word 0xde6c0011  ! 582: LDSTUB_R	ldstub	%r15, [%r16 + %r17]
	.word 0xda340011  ! 583: STH_R	sth	%r13, [%r16 + %r17]
	.word 0xca5c2194  ! 585: LDX_I	ldx	[%r16 + 0x0194], %r5
	.word 0x96240011  ! 586: SUB_R	sub 	%r16, %r17, %r11
	.word 0xb68c0011  ! 588: ANDcc_R	andcc 	%r16, %r17, %r27
	.word 0xa6442f71  ! 588: ADDC_I	addc 	%r16, 0x0f71, %r19
	.word 0x8cac238e  ! 588: ANDNcc_I	andncc 	%r16, 0x038e, %r6
	.word 0x9dec0011  ! 588: RESTORE_R	restore	%r16, %r17, %r14
thr0_irf_ce_30:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_30), 16, 16),1,IRF,ce,39,x, x,x,x, x,x,x)
	.word 0xdc742eef  ! 591: STX_I	stx	%r14, [%r16 + 0x0eef]
	.word 0x8b2c0011  ! 593: SLL_R	sll 	%r16, %r17, %r5
	.word 0x9d2c1011  ! 593: SLLX_R	sllx	%r16, %r17, %r14
	.word 0x8e940011  ! 593: ORcc_R	orcc 	%r16, %r17, %r7
	.word 0x9cdc0011  ! 593: SMULcc_R	smulcc 	%r16, %r17, %r14
	.word 0x912c0011  ! 594: SLL_R	sll 	%r16, %r17, %r8
	.word 0x949c29e6  ! 596: XORcc_I	xorcc 	%r16, 0x09e6, %r10
	.word 0xb7340011  ! 596: SRL_R	srl 	%r16, %r17, %r27
	.word 0x81580000  ! 596: FLUSHW	flushw
	.word 0x908c2881  ! 597: ANDcc_I	andcc 	%r16, 0x0881, %r8
	.word 0x90140011  ! 599: OR_R	or 	%r16, %r17, %r8
        wr %g0, 0x4, %fprs
thr0_irf_ce_31:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_31), 16, 16),1,IRF,ce,1,x, x,x,x, x,x,x)
	.word 0xd03422fd  ! 602: STH_I	sth	%r8, [%r16 + 0x02fd]
	.word 0x8d3c0011  ! 604: SRA_R	sra 	%r16, %r17, %r6
	.word 0xaa8c0011  ! 604: ANDcc_R	andcc 	%r16, %r17, %r21
	.word 0x81880000  ! 604: SAVED	saved
	.word 0xcc340011  ! 605: STH_R	sth	%r6, [%r16 + %r17]
	.word 0x86bc2c9d  ! 607: XNORcc_I	xnorcc 	%r16, 0x0c9d, %r3
	.word 0xa757c000  ! 607: RDPR_VER	<illegal instruction>
	.word 0xd4740011  ! 608: STX_R	stx	%r10, [%r16 + %r17]
	.word 0xa4c40011  ! 610: ADDCcc_R	addccc 	%r16, %r17, %r18
	.word 0x9a9c2249  ! 610: XORcc_I	xorcc 	%r16, 0x0249, %r13
	.word 0x92c40011  ! 610: ADDCcc_R	addccc 	%r16, %r17, %r9
	ta	T_CHANGE_PRIV	! macro
	.word 0xc2740011  ! 611: STX_R	stx	%r1, [%r16 + %r17]
	.word 0x9f643801  ! 613: MOVcc_I	<illegal instruction>
	.word 0xacdc29f3  ! 613: SMULcc_I	smulcc 	%r16, 0x09f3, %r22
	.word 0x84340011  ! 614: SUBC_R	orn 	%r16, %r17, %r2
	.word 0x973c2001  ! 616: SRA_I	sra 	%r16, 0x0001, %r11
	.word 0x8f2c3001  ! 616: SLLX_I	sllx	%r16, 0x0001, %r7
	.word 0xb23c0011  ! 616: XNOR_R	xnor 	%r16, %r17, %r25
	.word 0xf6a41011  ! 616: STWA_R	stwa	%r27, [%r16 + %r17] 0x80
	.word 0xb02c25c9  ! 617: ANDN_I	andn 	%r16, 0x05c9, %r24
	.word 0xb4b40011  ! 619: ORNcc_R	orncc 	%r16, %r17, %r26
	.word 0x9c7c2e37  ! 619: SDIV_I	sdiv 	%r16, 0x0e37, %r14
thr0_irf_ce_32:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_32), 16, 16),1,IRF,ce,39,x, x,x,x, x,x,x)
	.word 0xdc2c29b7  ! 622: STB_I	stb	%r14, [%r16 + 0x09b7]
	.word 0x977c2401  ! 624: MOVR_I	move	%r16, 0xfffffff8, %r11
	.word 0x81840011  ! 624: WRY_R	wr	%r16, %r17, %y
	.word 0xd6742e7f  ! 626: STX_I	stx	%r11, [%r16 + 0x0e7f]
	.word 0x9a040011  ! 628: ADD_R	add 	%r16, %r17, %r13
	.word 0xa77c0411  ! 628: MOVR_R	move	%r16, %r17, %r19
	.word 0x8a2c25f7  ! 628: ANDN_I	andn 	%r16, 0x05f7, %r5
	.word 0xa6dc0011  ! 628: SMULcc_R	smulcc 	%r16, %r17, %r19
thr0_irf_ce_33:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_33), 16, 16),1,IRF,ce,31,x, x,x,x, x,x,x)
	.word 0xe6742e6f  ! 631: STX_I	stx	%r19, [%r16 + 0x0e6f]
	.word 0xd2941011  ! 633: LDUHA_R	lduha	[%r16, %r17] 0x80, %r9
thr0_irf_ce_34:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_34), 16, 16),1,IRF,ce,25,x, x,x,x, x,x,x)
	.word 0xd22c2675  ! 636: STB_I	stb	%r9, [%r16 + 0x0675]
	.word 0x98c42231  ! 638: ADDCcc_I	addccc 	%r16, 0x0231, %r12
	.word 0x913c0011  ! 638: SRA_R	sra 	%r16, %r17, %r8
	.word 0x0ac40001  ! 638: BRNZ	brnz  ,nt	%16,<label_0x40001>
	.word 0xd02c257b  ! 640: STB_I	stb	%r8, [%r16 + 0x057b]
	.word 0x992c1011  ! 642: SLLX_R	sllx	%r16, %r17, %r12
	.word 0x8e0c0011  ! 642: AND_R	and 	%r16, %r17, %r7
	.word 0xfde42011  ! 642: CASA_R	casa	[%r16] %asi, %r17, %r30
	.word 0x98ac0011  ! 643: ANDNcc_R	andncc 	%r16, %r17, %r12
	.word 0x82342473  ! 645: ORN_I	orn 	%r16, 0x0473, %r1
	.word 0xda5c26d6  ! 645: LDX_I	ldx	[%r16 + 0x06d6], %r13
	.word 0x92340011  ! 646: ORN_R	orn 	%r16, %r17, %r9
	.word 0x973c1011  ! 648: SRAX_R	srax	%r16, %r17, %r11
	.word 0x840c2576  ! 648: AND_I	and 	%r16, 0x0576, %r2
	.word 0xad342001  ! 648: SRL_I	srl 	%r16, 0x0001, %r22
	.word 0xe73c2d3f  ! 648: STDF_I	std	%f19, [0x0d3f, %r16]
thr0_irf_ce_35:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_35), 16, 16),1,IRF,ce,7,x, x,x,x, x,x,x)
	.word 0xe624234f  ! 651: STW_I	stw	%r19, [%r16 + 0x034f]
	.word 0xba940011  ! 653: ORcc_R	orcc 	%r16, %r17, %r29
	.word 0x9b3c2001  ! 653: SRA_I	sra 	%r16, 0x0001, %r13
thr0_resum_intr_16:
!$EV trig_pc_d(0,expr(@VA(.MAIN.thr0_resum_intr_16), 16, 16)) -> intp(0, 3, 1)
	wr      %r0, 0x5, %asr26
	.word 0xf0740011  ! 654: STX_R	stx	%r24, [%r16 + %r17]
	.word 0xa57c0411  ! 656: MOVR_R	move	%r16, %r17, %r18
	.word 0x84340011  ! 656: ORN_R	orn 	%r16, %r17, %r2
	.word 0x9e142867  ! 656: OR_I	or 	%r16, 0x0867, %r15
        wr %g0, 0x4, %fprs
	.word 0x9204237c  ! 657: ADD_I	add 	%r16, 0x037c, %r9
	.word 0x902c0011  ! 659: ANDN_R	andn 	%r16, %r17, %r8
	.word 0x96542bd0  ! 659: UMUL_I	umul 	%r16, 0x0bd0, %r11
	.word 0xd624266f  ! 661: STW_I	stw	%r11, [%r16 + 0x066f]
	.word 0xcc1c0011  ! 663: LDD_R	ldd	[%r16 + %r17], %r6
	.word 0xcc7422af  ! 665: STX_I	stx	%r6, [%r16 + 0x02af]
	.word 0x982c0011  ! 667: ANDN_R	andn 	%r16, %r17, %r12
	.word 0x9c4c0011  ! 667: MULX_R	mulx 	%r16, %r17, %r14
	.word 0xc8340011  ! 668: STH_R	sth	%r4, [%r16 + %r17]
	.word 0xd41c0011  ! 670: LDD_R	ldd	[%r16 + %r17], %r10
	.word 0xdc240011  ! 671: STW_R	stw	%r14, [%r16 + %r17]
	.word 0x941c0011  ! 673: XOR_R	xor 	%r16, %r17, %r10
	.word 0x81dc0011  ! 673: FLUSH_R	dis not found

	.word 0x837c0411  ! 674: MOVR_R	move	%r16, %r17, %r1
	.word 0x833c1011  ! 676: SRAX_R	srax	%r16, %r17, %r1
	.word 0x988c2a17  ! 676: ANDcc_I	andcc 	%r16, 0x0a17, %r12
	.word 0xbe442168  ! 676: ADDC_I	addc 	%r16, 0x0168, %r31
	.word 0xde941011  ! 676: LDUHA_R	lduha	[%r16, %r17] 0x80, %r15
thr0_irf_ce_36:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_36), 16, 16),1,IRF,ce,19,x, x,x,x, x,x,x)
	.word 0xde242e11  ! 679: STW_I	stw	%r15, [%r16 + 0x0e11]
	.word 0x8ebc0011  ! 681: XNORcc_R	xnorcc 	%r16, %r17, %r7
	.word 0x961c0011  ! 681: XOR_R	xor 	%r16, %r17, %r11
	.word 0xefe42011  ! 681: CASA_R	casa	[%r16] %asi, %r17, %r23
	.word 0x8b641811  ! 682: MOVcc_R	<illegal instruction>
	.word 0x9d2c3001  ! 684: SLLX_I	sllx	%r16, 0x0001, %r14
	.word 0x9284237c  ! 684: ADDcc_I	addcc 	%r16, 0x037c, %r9
	.word 0xa83c2239  ! 684: XNOR_I	xnor 	%r16, 0x0239, %r20
	.word 0xb4dc2f89  ! 684: SMULcc_I	smulcc 	%r16, 0x0f89, %r26
thr0_irf_ce_37:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_37), 16, 16),1,IRF,ce,36,x, x,x,x, x,x,x)
	.word 0xf4242a83  ! 687: STW_I	stw	%r26, [%r16 + 0x0a83]
	.word 0x852c1011  ! 689: SLLX_R	sllx	%r16, %r17, %r2
	.word 0x94b40011  ! 689: ORNcc_R	orncc 	%r16, %r17, %r10
	.word 0x903c0011  ! 689: XNOR_R	xnor 	%r16, %r17, %r8
	.word 0xc2a41011  ! 689: STWA_R	stwa	%r1, [%r16 + %r17] 0x80
	.word 0xbe3c0011  ! 690: XNOR_R	xnor 	%r16, %r17, %r31
	.word 0xbb342001  ! 692: SRL_I	srl 	%r16, 0x0001, %r29
        wr %g0, 0x4, %fprs
	.word 0xee340011  ! 693: STH_R	sth	%r23, [%r16 + %r17]
	.word 0x9a1c2a51  ! 695: XOR_I	xor 	%r16, 0x0a51, %r13
	.word 0x8e2c0011  ! 695: ANDN_R	andn 	%r16, %r17, %r7
	.word 0x9d7c0411  ! 695: MOVR_R	move	%r16, %r17, %r14
	.word 0xdccc2274  ! 695: LDSBA_I	ldsba	[%r16, + 0x0274] %asi, %r14
	.word 0xc82c0011  ! 696: STB_R	stb	%r4, [%r16 + %r17]
	.word 0xb8540011  ! 698: UMUL_R	umul 	%r16, %r17, %r28
	.word 0xc42c0011  ! 699: STB_R	stb	%r2, [%r16 + %r17]
	.word 0xd20c290c  ! 701: LDUB_I	ldub	[%r16 + 0x090c], %r9
	.word 0xfe740011  ! 702: STX_R	stx	%r31, [%r16 + %r17]
	.word 0x9e1c0011  ! 704: XOR_R	xor 	%r16, %r17, %r15
	.word 0x973c2001  ! 704: SRA_I	sra 	%r16, 0x0001, %r11
	.word 0x81dc0011  ! 704: FLUSH_R	dis not found

	.word 0xd6242e4f  ! 706: STW_I	stw	%r11, [%r16 + 0x0e4f]
	.word 0xbcbc0011  ! 708: XNORcc_R	xnorcc 	%r16, %r17, %r30
	.word 0x90bc0011  ! 708: XNORcc_R	xnorcc 	%r16, %r17, %r8
	.word 0x2ccc0001  ! 708: BRGZ	brgz,a,pt	%16,<label_0xc0001>
	.word 0xd2240011  ! 709: STW_R	stw	%r9, [%r16 + %r17]
	.word 0x8d340011  ! 711: SRL_R	srl 	%r16, %r17, %r6
	.word 0x9a740011  ! 711: UDIV_R	udiv 	%r16, %r17, %r13
	.word 0xda742781  ! 713: STX_I	stx	%r13, [%r16 + 0x0781]
	.word 0x8b343001  ! 715: SRLX_I	srlx	%r16, 0x0001, %r5
	.word 0xb21c0011  ! 715: XOR_R	xor 	%r16, %r17, %r25
	.word 0xc3ec216c  ! 715: PREFETCHA_I	prefetcha	[%r16, + 0x016c] %asi, #one_read
thr0_irf_ce_38:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_38), 16, 16),1,IRF,ce,20,x, x,x,x, x,x,x)
	.word 0xf2342a4d  ! 718: STH_I	sth	%r25, [%r16 + 0x0a4d]
	.word 0xbd3c0011  ! 720: SRA_R	sra 	%r16, %r17, %r30
	.word 0xbc842165  ! 720: ADDcc_I	addcc 	%r16, 0x0165, %r30
	.word 0x91a409d1  ! 720: FDIVd	fdivd	%f16, %f48, %f8
	.word 0x84c40011  ! 721: ADDCcc_R	addccc 	%r16, %r17, %r2
	.word 0xb53c0011  ! 723: SRA_R	sra 	%r16, %r17, %r26
	.word 0x8a8c0011  ! 723: ANDcc_R	andcc 	%r16, %r17, %r5
	.word 0x92c40011  ! 723: ADDCcc_R	addccc 	%r16, %r17, %r9
	.word 0xb7242234  ! 723: MULScc_I	mulscc 	%r16, 0x0234, %r27
	.word 0xf62c24ed  ! 725: STB_I	stb	%r27, [%r16 + 0x04ed]
	.word 0xbb643801  ! 727: MOVcc_I	<illegal instruction>
	.word 0x8cb42414  ! 727: ORNcc_I	orncc 	%r16, 0x0414, %r6
	.word 0x92bc2805  ! 727: XNORcc_I	xnorcc 	%r16, 0x0805, %r9
	.word 0x3a800001  ! 727: BCC	bcc,a	<label_0x1>
thr0_irf_ce_39:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_39), 16, 16),1,IRF,ce,0,x, x,x,x, x,x,x)
	.word 0xd22c2e27  ! 730: STB_I	stb	%r9, [%r16 + 0x0e27]
	.word 0xd01c0011  ! 732: LDD_R	ldd	[%r16 + %r17], %r8
	.word 0x932c1011  ! 733: SLLX_R	sllx	%r16, %r17, %r9
	.word 0x92c40011  ! 735: ADDCcc_R	addccc 	%r16, %r17, %r9
	.word 0xb5a00051  ! 735: FMOVd	fmovd	%f48, %f26
	.word 0x94240011  ! 736: SUB_R	sub 	%r16, %r17, %r10
	.word 0x8c840011  ! 738: ADDcc_R	addcc 	%r16, %r17, %r6
	.word 0x92bc2cc6  ! 738: XNORcc_I	xnorcc 	%r16, 0x0cc6, %r9
	.word 0x98ac2796  ! 738: ANDNcc_I	andncc 	%r16, 0x0796, %r12
	.word 0xc36c2532  ! 738: PREFETCH_I	prefetch	[%r16 + 0x0532], #one_read
thr0_irf_ce_40:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_40), 16, 16),1,IRF,ce,37,x, x,x,x, x,x,x)
	.word 0xd8342cb9  ! 741: STH_I	sth	%r12, [%r16 + 0x0cb9]
	.word 0x89340011  ! 743: SRL_R	srl 	%r16, %r17, %r4
	.word 0xb73c2001  ! 743: SRA_I	sra 	%r16, 0x0001, %r27
	.word 0x3c800003  ! 743: BPOS	bpos,a	<label_0x3>
thr0_irf_ce_41:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_41), 16, 16),1,IRF,ce,45,x, x,x,x, x,x,x)
	.word 0xf6742bb9  ! 746: STX_I	stx	%r27, [%r16 + 0x0bb9]
	.word 0x8eac0011  ! 748: ANDNcc_R	andncc 	%r16, %r17, %r7
	.word 0x84040011  ! 748: ADD_R	add 	%r16, %r17, %r2
	.word 0xb03c276d  ! 748: XNOR_I	xnor 	%r16, 0x076d, %r24
	.word 0x97a81831  ! 748: FMOVRGZ	fmovs	%fcc3, %f17, %f11
	.word 0xd67422cb  ! 750: STX_I	stx	%r11, [%r16 + 0x02cb]
	.word 0x940426aa  ! 752: ADD_I	add 	%r16, 0x06aa, %r10
	.word 0x81580000  ! 752: FLUSHW	flushw
	.word 0xd47428bb  ! 754: STX_I	stx	%r10, [%r16 + 0x08bb]
	ta	T_CHANGE_HPRIV	! macro
thr0_irf_ce_42:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_42), 16, 16),1,IRF,ce,40,x, x,x,x, x,x,x)
	.word 0xd42c2c43  ! 759: STB_I	stb	%r10, [%r16 + 0x0c43]
	.word 0x93343001  ! 761: SRLX_I	srlx	%r16, 0x0001, %r9
	.word 0x8143c000  ! 761: STBAR	stbar
	.word 0xfa740011  ! 762: STX_R	stx	%r29, [%r16 + %r17]
	.word 0x95524000  ! 764: RDPR_CWP	<illegal instruction>
	.word 0xd4242a51  ! 766: STW_I	stw	%r10, [%r16 + 0x0a51]
	.word 0xaec428fb  ! 768: ADDCcc_I	addccc 	%r16, 0x08fb, %r23
	.word 0x963c0011  ! 768: XNOR_R	xnor 	%r16, %r17, %r11
	.word 0x3e800001  ! 768: BVC	bvc,a	<label_0x1>
	.word 0x8d7c2401  ! 769: MOVR_I	move	%r16, 0x7fffbdd8, %r6
	.word 0x8c3c0011  ! 771: XNOR_R	xnor 	%r16, %r17, %r6
	.word 0x96840011  ! 771: ADDcc_R	addcc 	%r16, %r17, %r11
	.word 0x96f427b8  ! 771: UDIVcc_I	udivcc 	%r16, 0x07b8, %r11
	.word 0x8f3c2001  ! 772: SRA_I	sra 	%r16, 0x0001, %r7
	.word 0xa60c2c48  ! 774: AND_I	and 	%r16, 0x0c48, %r19
	.word 0x88140011  ! 774: OR_R	or 	%r16, %r17, %r4
	.word 0x90840011  ! 774: ADDcc_R	addcc 	%r16, %r17, %r8
	.word 0xf00c242a  ! 774: LDUB_I	ldub	[%r16 + 0x042a], %r24
	.word 0x8cac2352  ! 775: ANDNcc_I	andncc 	%r16, 0x0352, %r6
	.word 0x8f341011  ! 777: SRLX_R	srlx	%r16, %r17, %r7
	.word 0x8e340011  ! 777: ORN_R	orn 	%r16, %r17, %r7
	.word 0x94d40011  ! 777: UMULcc_R	umulcc 	%r16, %r17, %r10
thr0_irf_ce_43:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_43), 16, 16),1,IRF,ce,23,x, x,x,x, x,x,x)
	.word 0xd4242953  ! 780: STW_I	stw	%r10, [%r16 + 0x0953]
	.word 0x81580000  ! 782: FLUSHW	flushw
	.word 0x8d3c1011  ! 783: SRAX_R	srax	%r16, %r17, %r6
	.word 0xb61c288c  ! 785: XOR_I	xor 	%r16, 0x088c, %r27
	.word 0xb6040011  ! 785: ADD_R	add 	%r16, %r17, %r27
thr0_resum_intr_17:
!$EV trig_pc_d(0,expr(@VA(.MAIN.thr0_resum_intr_17), 16, 16)) -> intp(0, 3, 1)
	wr      %r0, 0x5, %asr26
	.word 0x8a9c0011  ! 786: XORcc_R	xorcc 	%r16, %r17, %r5
	.word 0xf08c22d3  ! 788: LDUBA_I	lduba	[%r16, + 0x02d3] %asi, %r24
	.word 0xf02c25f1  ! 790: STB_I	stb	%r24, [%r16 + 0x05f1]
	.word 0x9e9c251f  ! 792: XORcc_I	xorcc 	%r16, 0x051f, %r15
	ta	T_CHANGE_NONPRIV	! macro
thr0_irf_ce_44:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_44), 16, 16),1,IRF,ce,33,x, x,x,x, x,x,x)
	.word 0xde242b77  ! 795: STW_I	stw	%r15, [%r16 + 0x0b77]
	.word 0xbac40011  ! 797: ADDCcc_R	addccc 	%r16, %r17, %r29
	.word 0xb43427e3  ! 797: ORN_I	orn 	%r16, 0x07e3, %r26
	.word 0x87520000  ! 797: RDPR_PIL	rdpr	%pil, %r3
	.word 0xc62c296b  ! 799: STB_I	stb	%r3, [%r16 + 0x096b]
	.word 0x828c0011  ! 801: ANDcc_R	andcc 	%r16, %r17, %r1
	.word 0xfc7c2a3a  ! 801: SWAP_I	swap	%r30, [%r16 + 0x0a3a]
	.word 0xa8440011  ! 802: ADDC_R	addc 	%r16, %r17, %r20
	.word 0x92b40011  ! 804: ORNcc_R	orncc 	%r16, %r17, %r9
	.word 0x960c0011  ! 804: AND_R	and 	%r16, %r17, %r11
	.word 0xea442139  ! 804: LDSW_I	ldsw	[%r16 + 0x0139], %r21
	.word 0x9aa42e71  ! 805: SUBcc_I	subcc 	%r16, 0x0e71, %r13
	.word 0xc24c2bc9  ! 807: LDSB_I	ldsb	[%r16 + 0x0bc9], %r1
	.word 0xc2342841  ! 809: STH_I	sth	%r1, [%r16 + 0x0841]
	.word 0x8a1c2b92  ! 811: XOR_I	xor 	%r16, 0x0b92, %r5
	.word 0x98440011  ! 811: ADDC_R	addc 	%r16, %r17, %r12
	.word 0x90f42ff7  ! 811: UDIVcc_I	udivcc 	%r16, 0x0ff7, %r8
	.word 0x912c1011  ! 812: SLLX_R	sllx	%r16, %r17, %r8
	.word 0x9d3c2001  ! 814: SRA_I	sra 	%r16, 0x0001, %r14
	.word 0xa60c0011  ! 814: AND_R	and 	%r16, %r17, %r19
	.word 0x8e342d7c  ! 814: ORN_I	orn 	%r16, 0x0d7c, %r7
	.word 0x8b242477  ! 814: MULScc_I	mulscc 	%r16, 0x0477, %r5
thr0_irf_ce_45:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_45), 16, 16),1,IRF,ce,53,x, x,x,x, x,x,x)
	.word 0xca2429e5  ! 817: STW_I	stw	%r5, [%r16 + 0x09e5]
thr0_resum_intr_18:
!$EV trig_pc_d(0,expr(@VA(.MAIN.thr0_resum_intr_18), 16, 16)) -> intp(0, 3, 1)
	wr      %r0, 0x5, %asr26
thr0_irf_ce_46:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_46), 16, 16),1,IRF,ce,29,x, x,x,x, x,x,x)
	.word 0xca242e41  ! 822: STW_I	stw	%r5, [%r16 + 0x0e41]
	.word 0xab2c2001  ! 824: SLL_I	sll 	%r16, 0x0001, %r21
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x83342001  ! 825: SRL_I	srl 	%r16, 0x0001, %r1
	.word 0xbaac0011  ! 827: ANDNcc_R	andncc 	%r16, %r17, %r29
	.word 0xfc94262d  ! 827: LDUHA_I	lduha	[%r16, + 0x062d] %asi, %r30
	.word 0x8f2c3001  ! 828: SLLX_I	sllx	%r16, 0x0001, %r7
	.word 0x8e8c292f  ! 830: ANDcc_I	andcc 	%r16, 0x092f, %r7
	.word 0xb93c1011  ! 830: SRAX_R	srax	%r16, %r17, %r28
	.word 0x8cf42647  ! 830: UDIVcc_I	udivcc 	%r16, 0x0647, %r6
	.word 0xd8340011  ! 831: STH_R	sth	%r12, [%r16 + %r17]
	.word 0x8204207d  ! 833: ADD_I	add 	%r16, 0x007d, %r1
	.word 0x977c0411  ! 833: MOVR_R	move	%r16, %r17, %r11
	.word 0xa72c2001  ! 833: SLL_I	sll 	%r16, 0x0001, %r19
        wr %g0, 0x4, %fprs
thr0_irf_ce_47:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_47), 16, 16),1,IRF,ce,3,x, x,x,x, x,x,x)
	.word 0xe6342987  ! 836: STH_I	sth	%r19, [%r16 + 0x0987]
	.word 0x9c0426fa  ! 838: ADD_I	add 	%r16, 0x06fa, %r14
	ta	T_CHANGE_NONHPRIV	! macro
thr0_irf_ce_48:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_48), 16, 16),1,IRF,ce,69,x, x,x,x, x,x,x)
	.word 0xdc242285  ! 841: STW_I	stw	%r14, [%r16 + 0x0285]
	.word 0x840c0011  ! 843: AND_R	and 	%r16, %r17, %r2
	.word 0x88942ef0  ! 843: ORcc_I	orcc 	%r16, 0x0ef0, %r4
	.word 0xa6ac0011  ! 843: ANDNcc_R	andncc 	%r16, %r17, %r19
	.word 0xcafc1011  ! 843: SWAPA_R	swapa	%r5, [%r16 + %r17] 0x80
	.word 0xb03c2c68  ! 844: XNOR_I	xnor 	%r16, 0x0c68, %r24
	.word 0x8884224a  ! 846: ADDcc_I	addcc 	%r16, 0x024a, %r4
	.word 0x9eac0011  ! 846: ANDNcc_R	andncc 	%r16, %r17, %r15
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xea240011  ! 847: STW_R	stw	%r21, [%r16 + %r17]
	.word 0x8b342001  ! 849: SRL_I	srl 	%r16, 0x0001, %r5
	.word 0xb4c42305  ! 849: ADDCcc_I	addccc 	%r16, 0x0305, %r26
	.word 0x81880000  ! 849: RESTORED	saved
thr0_irf_ce_49:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_49), 16, 16),1,IRF,ce,52,x, x,x,x, x,x,x)
	.word 0xf474216b  ! 852: STX_I	stx	%r26, [%r16 + 0x016b]
	.word 0x8143e054  ! 854: MEMBAR	membar	#LoadStore | #Lookaside | #Sync 
	.word 0x86440011  ! 855: ADDC_R	addc 	%r16, %r17, %r3
	.word 0x949c253c  ! 857: XORcc_I	xorcc 	%r16, 0x053c, %r10
	.word 0x8d2c1011  ! 857: SLLX_R	sllx	%r16, %r17, %r6
	.word 0x84f40011  ! 857: UDIVcc_R	udivcc 	%r16, %r17, %r2
thr0_irf_ce_50:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_50), 16, 16),1,IRF,ce,51,x, x,x,x, x,x,x)
	.word 0xc43421d5  ! 860: STH_I	sth	%r2, [%r16 + 0x01d5]
	.word 0x9a9c0011  ! 862: XORcc_R	xorcc 	%r16, %r17, %r13
	.word 0xaf508000  ! 862: RDPR_TSTATE	rdpr	%tstate, %r23
	.word 0xee242449  ! 864: STW_I	stw	%r23, [%r16 + 0x0449]
	.word 0x98942c61  ! 866: ORcc_I	orcc 	%r16, 0x0c61, %r12
	.word 0xac440011  ! 866: ADDC_R	addc 	%r16, %r17, %r22
	.word 0xdd3c21ee  ! 866: STDF_I	std	%f14, [0x01ee, %r16]
	.word 0xaf7c0411  ! 867: MOVR_R	move	%r16, %r17, %r23
	.word 0xb6142b48  ! 869: OR_I	or 	%r16, 0x0b48, %r27
	.word 0xa8340011  ! 869: ORN_R	orn 	%r16, %r17, %r20
	.word 0x8d341011  ! 869: SRLX_R	srlx	%r16, %r17, %r6
	ta	T_CHANGE_HPRIV	! macro
	.word 0x973c2001  ! 870: SRA_I	sra 	%r16, 0x0001, %r11
	.word 0xa814224d  ! 872: OR_I	or 	%r16, 0x024d, %r20
	.word 0xb49424a3  ! 872: ORcc_I	orcc 	%r16, 0x04a3, %r26
	.word 0xc36c2a21  ! 872: PREFETCH_I	prefetch	[%r16 + 0x0a21], #one_read
	.word 0xf4342aa3  ! 874: STH_I	sth	%r26, [%r16 + 0x0aa3]
	.word 0x9c842739  ! 876: ADDcc_I	addcc 	%r16, 0x0739, %r14
	.word 0xa48c2b6f  ! 876: ANDcc_I	andcc 	%r16, 0x0b6f, %r18
	.word 0x8f2c2001  ! 876: SLL_I	sll 	%r16, 0x0001, %r7
	.word 0x844c0011  ! 876: MULX_R	mulx 	%r16, %r17, %r2
thr0_irf_ce_51:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_51), 16, 16),1,IRF,ce,34,x, x,x,x, x,x,x)
	.word 0xc42c2a13  ! 879: STB_I	stb	%r2, [%r16 + 0x0a13]
	.word 0x862c2eb5  ! 881: ANDN_I	andn 	%r16, 0x0eb5, %r3
	.word 0x9a54269d  ! 881: UMUL_I	umul 	%r16, 0x069d, %r13
	.word 0xbc142e86  ! 882: OR_I	or 	%r16, 0x0e86, %r30
	.word 0x983c2cd1  ! 884: XNOR_I	xnor 	%r16, 0x0cd1, %r12
	.word 0x822c0011  ! 884: ANDN_R	andn 	%r16, %r17, %r1
	.word 0x8a940011  ! 884: ORcc_R	orcc 	%r16, %r17, %r5
	.word 0x8e740011  ! 884: UDIV_R	udiv 	%r16, %r17, %r7
	.word 0xce2c266d  ! 886: STB_I	stb	%r7, [%r16 + 0x066d]
	.word 0x909c0011  ! 888: XORcc_R	xorcc 	%r16, %r17, %r8
	.word 0xb48c2f1b  ! 888: ANDcc_I	andcc 	%r16, 0x0f1b, %r26
	.word 0x30800003  ! 888: BA	ba,a	<label_0x3>
thr0_irf_ce_52:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_52), 16, 16),1,IRF,ce,55,x, x,x,x, x,x,x)
	.word 0xf434248b  ! 891: STH_I	sth	%r26, [%r16 + 0x048b]
	.word 0xa61c0011  ! 893: XOR_R	xor 	%r16, %r17, %r19
	.word 0x962c226c  ! 893: ANDN_I	andn 	%r16, 0x026c, %r11
	.word 0xc3240011  ! 893: STF_R	st	%f1, [%r17, %r16]
	.word 0x882c0011  ! 894: ANDN_R	andn 	%r16, %r17, %r4
	.word 0xab480000  ! 896: RDHPR_HPSTATE	rdhpr	%hpstate, %r21
	.word 0xd2240011  ! 897: STW_R	stw	%r9, [%r16 + %r17]
	.word 0x2e800003  ! 899: BVS	bvs,a	<label_0x3>
	.word 0xd2242da1  ! 901: STW_I	stw	%r9, [%r16 + 0x0da1]
	.word 0xb23c0011  ! 903: XNOR_R	xnor 	%r16, %r17, %r25
	.word 0x96ac0011  ! 903: ANDNcc_R	andncc 	%r16, %r17, %r11
	.word 0x923c2a1c  ! 903: XNOR_I	xnor 	%r16, 0x0a1c, %r9
	.word 0x8d840011  ! 903: WRFPRS_R	wr	%r16, %r17, %fprs
thr0_irf_ce_53:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_53), 16, 16),1,IRF,ce,13,x, x,x,x, x,x,x)
	.word 0xd2342d89  ! 906: STH_I	sth	%r9, [%r16 + 0x0d89]
	.word 0xbb2c1011  ! 908: SLLX_R	sllx	%r16, %r17, %r29
	.word 0x8f343001  ! 908: SRLX_I	srlx	%r16, 0x0001, %r7
	.word 0x81880000  ! 908: SAVED	saved
thr0_irf_ce_54:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_54), 16, 16),1,IRF,ce,54,x, x,x,x, x,x,x)
	.word 0xce2c2a1d  ! 911: STB_I	stb	%r7, [%r16 + 0x0a1d]
	.word 0x84942257  ! 913: ORcc_I	orcc 	%r16, 0x0257, %r2
	.word 0xb29c0011  ! 913: XORcc_R	xorcc 	%r16, %r17, %r25
	.word 0xc3ec2fad  ! 913: PREFETCHA_I	prefetcha	[%r16, + 0x0fad] %asi, #one_read
	.word 0xf2740011  ! 914: STX_R	stx	%r25, [%r16 + %r17]
	.word 0xb4b40011  ! 916: ORNcc_R	orncc 	%r16, %r17, %r26
	.word 0xff3c2cfb  ! 916: STDF_I	std	%f31, [0x0cfb, %r16]
thr0_irf_ce_55:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_55), 16, 16),1,IRF,ce,43,x, x,x,x, x,x,x)
	.word 0xfe242733  ! 919: STW_I	stw	%r31, [%r16 + 0x0733]
	.word 0x942c21ad  ! 921: ANDN_I	andn 	%r16, 0x01ad, %r10
	.word 0xf6d41011  ! 921: LDSHA_R	ldsha	[%r16, %r17] 0x80, %r27
	.word 0xf624238f  ! 923: STW_I	stw	%r27, [%r16 + 0x038f]
	.word 0x81880000  ! 925: RESTORED	saved
	.word 0xd6340011  ! 926: STH_R	sth	%r11, [%r16 + %r17]
	.word 0x9d2c3001  ! 928: SLLX_I	sllx	%r16, 0x0001, %r14
	.word 0x86b42cfe  ! 928: ORNcc_I	orncc 	%r16, 0x0cfe, %r3
	.word 0xc36c0011  ! 928: PREFETCH_R	prefetch	[%r16 + %r17], #one_read
	.word 0xf4240011  ! 929: STW_R	stw	%r26, [%r16 + %r17]
	.word 0x980421fe  ! 931: ADD_I	add 	%r16, 0x01fe, %r12
	.word 0xbb343001  ! 931: SRLX_I	srlx	%r16, 0x0001, %r29
	.word 0x9e0c0011  ! 931: AND_R	and 	%r16, %r17, %r15
	.word 0x81dc2cc7  ! 931: FLUSH_I	dis not found

	.word 0xde342121  ! 933: STH_I	sth	%r15, [%r16 + 0x0121]
        wr %g0, 0x4, %fprs
	.word 0xde2425ad  ! 937: STW_I	stw	%r15, [%r16 + 0x05ad]
	.word 0xbd643801  ! 939: MOVcc_I	<illegal instruction>
	.word 0x99340011  ! 939: SRL_R	srl 	%r16, %r17, %r12
	.word 0x8be40011  ! 939: SAVE_R	save	%r16, %r17, %r5
	.word 0xca342e15  ! 941: STH_I	sth	%r5, [%r16 + 0x0e15]
	.word 0x921c0011  ! 943: XOR_R	xor 	%r16, %r17, %r9
	.word 0xd1240011  ! 943: STF_R	st	%f8, [%r17, %r16]
	.word 0xf6340011  ! 944: STH_R	sth	%r27, [%r16 + %r17]
	.word 0x9e2c2dd0  ! 946: ANDN_I	andn 	%r16, 0x0dd0, %r15
	.word 0x848c0011  ! 946: ANDcc_R	andcc 	%r16, %r17, %r2
	.word 0x08800001  ! 946: BLEU	bleu  	<label_0x1>
	.word 0xc8340011  ! 947: STH_R	sth	%r4, [%r16 + %r17]
	.word 0xab3c2001  ! 949: SRA_I	sra 	%r16, 0x0001, %r21
	.word 0x9e040011  ! 949: ADD_R	add 	%r16, %r17, %r15
	.word 0xc3ec220e  ! 949: PREFETCHA_I	prefetcha	[%r16, + 0x020e] %asi, #one_read
	.word 0x8f641811  ! 950: MOVcc_R	<illegal instruction>
	.word 0x9cc40011  ! 952: ADDCcc_R	addccc 	%r16, %r17, %r14
	.word 0x8f7c2401  ! 952: MOVR_I	move	%r16, 0xfffffff8, %r7
	.word 0xa5414000  ! 952: RDPC	rd	%pc, %r18
	.word 0xe4242d27  ! 954: STW_I	stw	%r18, [%r16 + 0x0d27]
	.word 0xb6442a1e  ! 956: ADDC_I	addc 	%r16, 0x0a1e, %r27
	.word 0x953c0011  ! 956: SRA_R	sra 	%r16, %r17, %r10
thr0_resum_intr_19:
!$EV trig_pc_d(0,expr(@VA(.MAIN.thr0_resum_intr_19), 16, 16)) -> intp(0, 3, 1)
	wr      %r0, 0x5, %asr26
	.word 0xde740011  ! 957: STX_R	stx	%r15, [%r16 + %r17]
	.word 0x9f3c2001  ! 959: SRA_I	sra 	%r16, 0x0001, %r15
	.word 0x92040011  ! 959: ADD_R	add 	%r16, %r17, %r9
	.word 0xd9240011  ! 959: STF_R	st	%f12, [%r17, %r16]
	.word 0xb69c0011  ! 960: XORcc_R	xorcc 	%r16, %r17, %r27
	.word 0x9e040011  ! 962: ADD_R	add 	%r16, %r17, %r15
	.word 0x9d343001  ! 962: SRLX_I	srlx	%r16, 0x0001, %r14
	.word 0x833c1011  ! 962: SRAX_R	srax	%r16, %r17, %r1
        wr %g0, 0x4, %fprs
	.word 0xc224282b  ! 964: STW_I	stw	%r1, [%r16 + 0x082b]
	.word 0x989c0011  ! 966: XORcc_R	xorcc 	%r16, %r17, %r12
	.word 0x97500000  ! 966: RDPR_TPC	<illegal instruction>
	.word 0xd62c2a33  ! 968: STB_I	stb	%r11, [%r16 + 0x0a33]
	.word 0x8c340011  ! 970: ORN_R	orn 	%r16, %r17, %r6
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xcc242827  ! 972: STW_I	stw	%r6, [%r16 + 0x0827]
	.word 0x9c840011  ! 974: ADDcc_R	addcc 	%r16, %r17, %r14
	.word 0x8f343001  ! 974: SRLX_I	srlx	%r16, 0x0001, %r7
        wr %g0, 0x4, %fprs
thr0_irf_ce_56:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_56), 16, 16),1,IRF,ce,15,x, x,x,x, x,x,x)
	.word 0xce3423ff  ! 977: STH_I	sth	%r7, [%r16 + 0x03ff]
	.word 0x9f343001  ! 979: SRLX_I	srlx	%r16, 0x0001, %r15
	.word 0x94142cf8  ! 979: OR_I	or 	%r16, 0x0cf8, %r10
	.word 0xa68c2f24  ! 979: ANDcc_I	andcc 	%r16, 0x0f24, %r19
	.word 0x02c40001  ! 979: BRZ	brz  ,nt	%16,<label_0x40001>
thr0_irf_ce_57:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_57), 16, 16),1,IRF,ce,54,x, x,x,x, x,x,x)
	.word 0xe6242a9b  ! 982: STW_I	stw	%r19, [%r16 + 0x0a9b]
	.word 0x95343001  ! 984: SRLX_I	srlx	%r16, 0x0001, %r10
	.word 0x983c2490  ! 984: XNOR_I	xnor 	%r16, 0x0490, %r12
	.word 0x842c2c4d  ! 984: ANDN_I	andn 	%r16, 0x0c4d, %r2
	.word 0x81dc20e9  ! 984: FLUSH_I	dis not found

	.word 0xda740011  ! 985: STX_R	stx	%r13, [%r16 + %r17]
	.word 0x9e8420ff  ! 987: ADDcc_I	addcc 	%r16, 0x00ff, %r15
        wr %g0, 0x4, %fprs
	.word 0xf22c0011  ! 988: STB_R	stb	%r25, [%r16 + %r17]
	.word 0x90340011  ! 990: ORN_R	orn 	%r16, %r17, %r8
	.word 0xe4a41011  ! 990: STWA_R	stwa	%r18, [%r16 + %r17] 0x80
	.word 0xd6340011  ! 991: STH_R	sth	%r11, [%r16 + %r17]
	.word 0xd0140011  ! 993: LDUH_R	lduh	[%r16 + %r17], %r8
	.word 0x933c0011  ! 994: SRA_R	sra 	%r16, %r17, %r9
	.word 0x85341011  ! 996: SRLX_R	srlx	%r16, %r17, %r2
	.word 0xb7342001  ! 996: SRL_I	srl 	%r16, 0x0001, %r27
	.word 0x917c0411  ! 996: MOVR_R	move	%r16, %r17, %r8
	.word 0x8ba409d1  ! 996: FDIVd	fdivd	%f16, %f48, %f36
thr0_irf_ce_58:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_58), 16, 16),1,IRF,ce,58,x, x,x,x, x,x,x)
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
	.word  0xd00c2def,0x2478ee61,0x66d70eb2,0x3460237a
	.word  0x4c3dcc6e,0xba6eb6c9,0xcafea7a4,0x3d5a170a
	.word  0x17d1bb75,0x740f6f48,0xd5265dce,0x018b90ee
	.word  0xb56ec210,0xbb053c25,0x61db70a3,0x3a9f5add
	.word  0x4c78b117,0xb25a123a,0xe871782a,0xdd2fd3f4
	.word  0x86eab4da,0xd7973d16,0x71065730,0x8b2fd0e4
	.word  0x4b6eb1a3,0x9f79a293,0x405a4d9a,0x4424d853
	.word  0x8cc17a85,0x2f7dfa32,0x11a056c0,0x87a828bb
	.word  0x8f2c0aa7,0x2f518f5f,0x0859e88c,0xdd5664b8
	.word  0xbb3e479e,0xfae49963,0xed3d14cb,0xef8b7f42
	.word  0xa56932b1,0xc7fde5e6,0xb17680b8,0x95921780
	.word  0xbf31e07d,0x2037d056,0x5de82a53,0x6afa8c22
	.word  0x2bbefd00,0xf0a2c43c,0x324c1bd4,0x6fd93d0d
	.word  0x2718e7db,0x32951922,0xcc1a54aa,0xca8d3c68
	.word  0x7a39255b,0x2e7238d6,0x70301775,0x378c75e3
	.word  0xdca0fd93,0xea4c7477,0x2fdb028d,0xaf3a00d1
	.word  0x1b863c45,0xe9f070b6,0xb50b7caf,0xec980735
	.word  0x63451f82,0x58f1e9f2,0xa09db940,0xbe385a59
	.word  0xf6d065c2,0x4b7cb3a1,0x8e263303,0xa9a30d9b
	.word  0xad853aa4,0x18017f49,0x8e8e5f0b,0x4f1c9291
	.word  0xfd72632b,0xa8923dcc,0x9fc69f1e,0xca205d75
	.word  0x2a141b4a,0xf2e35ff0,0xf5d55182,0xe27fa090
	.word  0x4dc2e810,0x52d741ef,0x5116d0f6,0x4f6646a0
	.word  0x167f9abc,0x8845c04a,0x9c73a7e1,0xb87d6a7b
	.word  0x1418f178,0xc46b339a,0x1076be89,0xe63f4afb
	.word  0x8c5d7955,0xa962482a,0x376464a4,0x56afba62
	.word  0x7d1b360e,0x1e463056,0x748fdea4,0x53273217
	.word  0x89bb53dd,0xbc09c138,0x3cc345c2,0x46819ca8
	.word  0x984b44c9,0x31f9dc17,0xe9c450d0,0x5cd75b04
	.word  0x695663fe,0x0465d336,0xb2de42b8,0x7b7a82d7
	.word  0xda012c5c,0xb5bcc990,0xea806895,0xae5b292a
	.word  0xa59b41eb,0xfbd5668c,0xbfe0b1a2,0xa712eed4
	.word  0x194b3a52,0xc2b38bc6,0xf8cdb269,0xb462ddc5
	.word  0x92c90d40,0x4565ef4e,0xa8ccc514,0x97d7a171
	.word  0x8e0295cc,0xc066bf1c,0x9b58fe03,0x9a4b300f
	.word  0x859b78f2,0x5858ae67,0x83b5d901,0x3b9ed5ae
	.word  0x4dfe0a08,0xd4cdb006,0xfc3eb87a,0xe2fbb61b
	.word  0xbb670dd5,0xa05f3cee,0x1e7c53b8,0x5f42a5ea
	.word  0x7a99b2e5,0x0d97e945,0xb3867448,0x05683130
	.word  0x2150d6f3,0xd8087d2c,0xbde44649,0x4d1e966c
	.word  0x37243388,0x2e5c4ae2,0xb92e5037,0x085f0ee6
	.word  0x0c13eb1d,0xd53191fd,0xe60fc741,0xdfcf2eb6
	.word  0x61d8fc10,0xe72cdcad,0x734efc80,0x55c88218
	.word  0x3c10383b,0x6e76a60a,0x066819d7,0x3535fd5b
	.word  0x7ec19172,0x328582a2,0x193dc4e4,0xe51ba05a
	.word  0xf6e48d26,0x96ed2d8f,0xd79389d7,0xb5660999
	.word  0x7b8ad158,0x236fb5f6,0xf53331ce,0x26295360
	.word  0xc03db14b,0xa3cb474a,0x4c9529f4,0xc9e26ed5
	.word  0xf096bc1c,0x2ad67c01,0x4a58120c,0x01aa48de
	.word  0x0b3b5793,0x26323889,0x5cd399fa,0x9137fbb4
	.word  0x476cb8e7,0x37a52a2b,0x8896ba24,0xadba3ca7
	.word  0x5821942f,0xc5d3a157,0x6ed9385b,0x7bbd0bc5
	.word  0xcfbaee53,0xa5774ff2,0x303dd8af,0x04d85542
	.word  0x35f005a8,0xc4d03621,0x5dbd9be3,0x3bc73e20
	.word  0xb4c3fb3d,0xb93b98aa,0x5684a175,0x2e0c0ae7
	.word  0x017c1318,0x6080b6c6,0x6cfa1e82,0xd5a434db
	.word  0x5db6c862,0x6eeed952,0x6482309e,0xb0198974
	.word  0x77411c5c,0x66e3dee6,0x9b84614c,0x6f068ff4
	.word  0x0b07b2f9,0x77cfe604,0xa2a07f0d,0x8a3e2449
	.word  0xc507b3b4,0xe959b80f,0xaa84ae20,0x684c892f
	.word  0xa7a04577,0x691a0bf6,0xdb1cf0c7,0x13f7e447
	.word  0x84e1c165,0xa8a818c1,0x8d1b3e47,0xfaf0f932
	.word  0xd115331f,0x2edd7689,0xf4bc4cbd,0x6fb42130
	.word  0xa09430f5,0x54f8b73e,0xb500d85b,0xca8c22d0
	.word  0x20d8fe8c,0x7de2a4b2,0x0b8b2abd,0xfcea862e
	.word  0xeaa411e8,0x8990a4e6,0x8f621771,0xb2052202
	.word  0xaca7e7a4,0x15443397,0x976d7eb1,0x21abaecc
	.word  0x84188882,0xa318ccdd,0xcbc03e00,0x23ecd88f
	.word  0x12c52529,0x0349040f,0x78599449,0x99cab73b
	.word  0x584cd50c,0x0183928f,0x4dd639a9,0x71d7f0da
	.word  0x52069208,0x6ea63b36,0xddef80de,0x4a636f27
	.word  0xc49f7fd7,0xbc149e9d,0x417408bf,0xeb75e2fd
	.word  0x76183af0,0x560f1166,0xd9b74d2b,0xecfc661c
	.word  0x3f5007f2,0x8701b9bb,0x369f93eb,0x23ccbcee
	.word  0xebc465de,0xd453e13f,0xf89f3856,0xcc548a8c
	.word  0x94f061a7,0x589be332,0xf9111545,0x4183af1e
	.word  0xbf1e577d,0x58c780b2,0x038398e1,0x53364425
	.word  0x216c3791,0x022a1cca,0x7195da5b,0xb8cd5298
	.word  0xae4de5fc,0x075ee2c1,0x1e8c90a9,0x3100ae32
	.word  0x640104e2,0xe05d2ed7,0x493d01fd,0x8f09ee34
	.word  0x01c3a1db,0x93bd2642,0x9b8b9d16,0x92c33c99
	.word  0x6e8e4262,0xaacb495c,0xa3d591d3,0xf896f25d
	.word  0x9b251675,0x412f1ce9,0x31afc762,0xc10a31e5
	.word  0x1bb55a18,0x53194303,0xd03c1f69,0xf365da96
	.word  0x59e89d79,0x362f01e8,0xa0355055,0xfba544de
	.word  0xeb4ff85c,0x64d0ebb3,0xfd6cadf6,0x6b5a74d6
	.word  0x27c36df6,0x179b2582,0x7ac55ead,0xfce2775b
	.word  0x5664afe8,0xe107d2e8,0x3a5b0dad,0x80e3a15d
	.word  0x9f8ce22f,0xe0b5ab47,0x362691c8,0x09ea16ce
	.word  0xcd61d242,0x1d1b6efd,0x76008d66,0xff32a698
	.word  0x343eb5f5,0x2bd34ca3,0x6a688d7c,0x3064ac36
	.word  0x273ba2cd,0xcf6d310e,0x80781ba1,0x6eeceb15
	.word  0x278cafd9,0xa21264bd,0xd82cfaca,0x15efba22
	.word  0x47f22956,0x74660e1a,0x696843a3,0x1bcad7a1
	.word  0xf6bb8071,0x7d5c1ec0,0xddc8f8e5,0xeaf0422d
	.word  0x22143c83,0x5eda5fde,0xcd4dd6c3,0xe8f98eb3
	.word  0x87d6b2e4,0x06f0d813,0xea8da863,0x4228c7c1
	.word  0x3fd678f5,0xb292f3fe,0xc5ea2758,0x27cf266a
	.word  0xd817f4ca,0x743d3f5a,0x294c89fd,0x0b86706b
	.word  0xf3f517bf,0xb6c605c1,0xf55123c7,0xe6203ffa
	.word  0x68859fe4,0xe4006994,0x59104c1f,0x7268575b
	.word  0xc16809bb,0xc5907e68,0x9c82dccb,0xa1cd25fe
	.word  0x282a68f2,0x6b534ee5,0x4bf5a5c5,0xed6e447d
	.word  0xf2999289,0xe1fe69e8,0x0b52f925,0xcad318f2
	.word  0x968f9720,0x9c252893,0x60e4c4bb,0x8832ac63
	.word  0xa9cd9a45,0x710837bf,0xe3ba236f,0x7d59d58f
	.word  0x46a7d4a3,0xf4024a43,0x31014fe7,0x95cf428b
	.word  0xd874d76d,0x8c3df911,0x29ce2aec,0xca11f105
	.word  0xa41d4f47,0x6653346d,0xf15791f6,0x27f4fcf9
	.word  0x479c8929,0xb92caf33,0x3831e0bc,0x4a5a9f92
	.word  0x29a8db94,0x7edf1488,0x5743abee,0xd9b59b2c
	.word  0xe8a3d636,0x2b4cc3c3,0x9822b116,0x9e463789
	.word  0xfbc6a805,0x0997b512,0x097d7e2d,0xaae4ce01
	.word  0x767502d3,0x03e202ab,0x018b1ebc,0x4145c4b1
	.word  0xe0f94390,0xb9280c19,0x427f9e8d,0x7632d57d
	.word  0xc88d6b1f,0xc6d2cfd0,0x01bc6a33,0xc3acffc1
	.word  0x8f475427,0x5fd511bd,0xe34cff90,0x058cc435
	.word  0x4186de87,0x7dc584b3,0xfb6c7f9f,0xd54dd7bb
	.word  0x901dacf1,0x2230263c,0xae02a23f,0x860774b4
	.word  0xd80559be,0x097e3d10,0xccce579d,0x4a52d315
	.word  0x2605a4e6,0x2d88c297,0xc3a198e3,0xa7e0ebcf
	.word  0xa9c09fca,0xff4528df,0x22fe4546,0xa75849b9
	.word  0x9406c55e,0xf2df2af7,0x84b6f256,0x65b35a4c
	.word  0x887af25e,0x898782f7,0x0d864df3,0x1b56912e
	.word  0x2bcb7f03,0xee1f600b,0x407fd2c6,0x4fcb2c4d
	.word  0x92246ead,0x4e201964,0xe8bb7ca0,0xcb9a13f7
	.word  0xbb843e2a,0x1ccbc22c,0x942bdd60,0x409b3269
	.word  0xd6fa6228,0x08babb13,0xe718c589,0x05d51de6
	.word  0x680e691c,0x7fafe729,0xc0b410db,0x303fd78d
	.word  0x99492ee1,0x34be9244,0x933974fd,0x1917567a
	.word  0x79ab776a,0xe0c25cd7,0xddc80008,0x6d873572
	.word  0x2cefe239,0xa452c923,0x2686690b,0x1c2969e3
	.word  0x663f3a92,0x86f97332,0x5fdc7a9f,0xf13f2bb6
	.word  0x92782d47,0x1338b4ab,0x34c31c61,0x1ebf8aa7
	.word  0xcbe48a71,0xd9e6c0cf,0x2dde0eb0,0x9a6c9d77
	.word  0xcf84fdaf,0x61a3835b,0x609ede93,0x40a26ab6
	.word  0xd649d637,0x7a818bc3,0x57d92cd5,0x4d8a1c28
	.word  0x8434d983,0x3dd6446a,0xf6bc43e1,0x0ff88350
	.word  0x97afdce1,0x43be48c2,0xca96d627,0x5a37ba51
	.word  0x25461936,0x79accbaa,0xf4085af9,0x100bfb21
	.word  0x3000b63a,0x36d82c70,0xf3cc58df,0xcb8b9299
	.word  0x6350c293,0xa38d0504,0xc5e86a22,0x08c4625d
	.word  0x8ce96394,0xe50413b8,0x01702de0,0x6bde277d
	.word  0x6fe70a44,0xb18f43a4,0x9b0b9e34,0x0e69d443
	.word  0x20ea8279,0x7dfadc84,0x61db0d07,0xf0009c3e
	.word  0x39d9a8ee,0x9dc2921b,0x4a1325df,0xb20c98bf
	.word  0x7acbd085,0x1634854c,0xbec723c4,0x4cec0fb4
	.word  0xe7a96520,0x38b590a2,0x0099dd6f,0xc96f6835
	.word  0xe95d8cf3,0x6b2c6234,0xb65dc8b1,0x4e6f6677
	.word  0x6bd3f4ff,0x43fece0c,0xa622043b,0xfa7e4053
	.word  0xc7114e93,0xd48d1123,0x91fd4a32,0x1793e56a
	.word  0x81aa18c0,0x28e8c175,0x658d5651,0x67f50404
	.word  0x41e33e5b,0x74db8077,0xfc02246b,0x9024feae
	.word  0x285f2129,0xf435f374,0x9a26bcd3,0xa3019a8c
	.word  0x28d45e74,0x454571fe,0x848bd444,0x3b999b9a
	.word  0x6a021434,0x57ce591c,0xfb0b8de1,0xe110329c
	.word  0xf1ab6bd4,0x0e9b46f3,0x81bccc56,0xdcd52057
	.word  0x90b22da5,0x65986fc8,0x1cd0cb9a,0x68baec9e
	.word  0x9da07577,0x098751e2,0x2b8c507d,0xa096cde8
	.word  0xd279fe04,0x2add7c67,0x21709f18,0xdeb65dab
	.word  0xa8bd7533,0x175c3540,0xb34836de,0x9ba6c775
	.word  0x1a31b217,0x83fb48f4,0x41170e2c,0x8f1bbc8a
	.word  0xf0968dfb,0x3def8aa7,0x7cbb2f1a,0x150a58ad
	.word  0x45e48624,0x157615fc,0x4cd2ae7f,0xb3cdc7f6
	.word  0xeb838b50,0x6a942b0e,0xcb466860,0x939cb619
	.word  0xcccc816e,0xe410102c,0x6e4d2606,0xabfc6c6c
	.word  0xb5b7c8d7,0x8786d63f,0x76309319,0xbe1b1e34
	.word  0x2f7cb9d8,0x1449d445,0xa65f9834,0x0249635f
	.word  0xe9ab42bf,0xc62b2ad0,0xfdb4e37e,0xbe860cee
	.word  0x604b5e55,0x0550b1a3,0x8030c23c,0xae26b983
	.word  0xc6196903,0x9f95f2a9,0xedfb0f7e,0x759bdd66
	.word  0xcda11bd2,0x397aa525,0x47b403ca,0x2e249cc8
	.word  0x95ce6370,0xe23697f4,0x91ccf533,0x5cc455fb
	.word  0xdc8f5a7c,0x773978a9,0x30f2d744,0xd4d46a20
	.word  0xfcff7e65,0x6a15d270,0x43462007,0x2790b729
	.word  0x7cbdd6a0,0x8366a233,0x5979e499,0x7e4db840
	.word  0x8e569831,0x9b9f7f7f,0xd9d3f1f4,0xd4d27bf6
	.word  0x1a78b9de,0x3f62fa03,0x34513219,0x6fbe657a
	.word  0x232f58e3,0xec08203a,0x9dc0fca4,0x1a93107e
	.word  0xf5f8ac1a,0xc90f97db,0x39a906e5,0x55899d0e
	.word  0x89aa4a6e,0x9b657f0a,0x6422e7c3,0x4f51f9b5
	.word  0xfe408929,0x2327bf53,0x93c74a55,0x9a76d785
	.word  0x25db5fdb,0x34dafbfa,0xe3bf91b8,0xff704686
	.word  0x0423acf8,0x18017d40,0xf554c763,0x69a05f71
	.word  0xc803068a,0x9207b68b,0x25d26c73,0x733d766c
	.word  0xa1d24c96,0x475da2d8,0xf2709fb3,0xb7e700f5
	.word  0x7b419c98,0x68fddff9,0x437cf885,0x470d1354
	.word  0x372d17fb,0x415f396e,0x252151b3,0xd122e543
	.word  0xf8e57bfa,0x1e2c7631,0xf8f80c0d,0xe49f7e23
	.word  0xc1a096d7,0xa939cffb,0x24fb26a3,0x32149f14
	.word  0xdc74d6a9,0x41b91af5,0x468cf894,0xcb488699
	.word  0x75dcae5e,0xca5ebdf7,0xabc1034a,0x4437481d
	.word  0x59585603,0x3585696d,0x1b07852b,0x9e5e6a9f
	.word  0xf24e6d35,0xd27af278,0x95673abf,0x0c7881fc
	.word  0x99ef82c9,0x9242e2f6,0xf0798de2,0xb53c152f
	.word  0xd51bf076,0xba40ed18,0x10f17403,0xc31a463c
	.word  0x893399db,0xf3738c6a,0xd8451883,0x90bd6403
	.word  0x33752a34,0xacc07621,0x7b580507,0xbf7e314f
	.word  0xd49f0e5a,0x7658b076,0x03624796,0xb8f17cfa
	.word  0x775b3a99,0x569ea1c2,0x60390fd7,0x54f89196
	.word  0x0d9ecc29,0x0685d4e9,0x77e04c92,0xad4129a4
	.word  0x6736d366,0x32c7d6e6,0x2637f6bc,0xf2346044
	.word  0xce4d1c90,0x11dbbd7c,0x3c1e1a77,0x70c8553c
	.word  0x16dc655d,0xd68381ab,0xa4f3184a,0xd83a76ab
	.word  0x77121784,0x4074d8db,0xb113943e,0xa6bf26ce
	.word  0x4749b0aa,0x76c65bd4,0x18cba396,0x908f1292
	.word  0xf3b9bac0,0xf00be43f,0x7dbebe2c,0x8feae023
	.word  0x6327480e,0x9d5c2db6,0x141afec4,0xea88f166
	.word  0xc896112d,0xb60f7996,0xa250e24c,0x38fc7a0a
	.word  0x82c7f059,0x23e2feee,0x5bdfe4fa,0x67886e65
	.word  0x955527d6,0x39eb8a79,0x10f43bac,0xcb295ef0
	.word  0xd32e8171,0x3b2f4396,0x1a6d6b9f,0x6d7f75ed
	.word  0xf71c2560,0x54be76cd,0x88b5b699,0x303ef2b4
	.word  0x563d1e79,0xf4d5db91,0x15f644ee,0x884d7727
	.word  0xf37eba7e,0xef71aa4b,0x76e0a633,0xd4104c56
	.word  0x5e7cfc3d,0x19bf7227,0x17cd27ce,0x64dd638c
	.word  0x2785101d,0xf590daaf,0x330fc323,0xe52de6cb
	.word  0xb2d0f6f8,0x1ff898f6,0x7f5b90f6,0x59aca2f5
	.word  0xfad1a828,0xb50c5ca0,0x7eb5f2b1,0xce48453b
	.word  0xff5af1fc,0x4cb95fc0,0xd06ea1ae,0x817ad279
	.word  0xff28888a,0x0f9430a7,0x574c32e7,0xd3b7038d
	.word  0x0aae4357,0xba731b80,0x1bb7f5f3,0x3d5b9cff
	.word  0x2c985e68,0x76ff569a,0x3e4d56a9,0x81a1753a
	.word  0xe5db3a81,0x01182ffd,0x5445c381,0x9ef70fea
	.word  0xa620ee62,0x42db0f9c,0x52365b0a,0x1d4e2ac8
	.word  0x24f08e17,0xb9d88dfa,0xe309f4dd,0x3dcbcead
	.word  0x42242792,0xc9d4fe67,0x0cde6968,0x0f6d92bc
	.word  0xe0145a3f,0x886e95c0,0x6db93420,0x82b6b7b6
	.word  0xca504eea,0x319e7ac1,0xaf04963a,0x5d536fb8
	.word  0x52e96e7b,0x3ee9eef0,0xa4723445,0x0f9d89cb
	.word  0x1d514785,0xbf931654,0xfb5c7ce5,0x45410501
	.word  0x22619f62,0x12aa04da,0xa2b4fa7e,0xe60ba15f
	.word  0x67e3b579,0xa4427bb1,0xd4e25098,0x7dad0a01
	.word  0xbae2949e,0xe38dfdaf,0x887f1aac,0xb4ba58e3
	.word  0x302b2dfe,0xfc126c27,0x8b1b8c28,0xb86fcd21
	.word  0xaefc8eef,0x32108c8c,0x0f7b7574,0xa1215c5c
	.word  0x836c161e,0x3a159092,0x7ff19536,0x3f14c330
	.word  0x54d13e04,0x2fa7bfae,0x29f51a6e,0xfafee29f
	.word  0x2ddf93a8,0x50b6b2bb,0xe29c7cd8,0xd9d9741a
	.word  0xba29ffde,0xde3b1c2e,0x182b79f4,0x10fb6773
	.word  0xb11b4239,0x30305bbd,0xbd3986b5,0x2e5401b0
	.word  0x4e181318,0x067c3f75,0x9f641a7f,0xff167057
	.word  0x930eb1f4,0x8a03bda0,0xea8d208d,0x53c35667
	.word  0xda442dd2,0x5d47c3bf,0x1f552896,0x4faaed1f
	.word  0xe3878314,0xba2a5601,0x907ccffd,0xe0fdb3e5
	.word  0x768b5fb0,0xd5a0b204,0x6a6dc1bf,0x8f759f60
	.word  0xda9b8adb,0x948c359f,0x14c877a3,0x593a07b2
	.word  0x3d3c8bae,0xb8db0fde,0x82841412,0x5548c94b
	.word  0x0a02a2b3,0xbf04fb61,0xae298e97,0x28915123
	.word  0xe8d5f32b,0x82abfbbf,0x993e0106,0xf7473b00
	.word  0x40bc9748,0x4f9445c9,0x397b9654,0x1a88a7f9
	.word  0x546bf133,0xd8bc32ce,0x482cdbf6,0x45c78281
	.word  0x7b0eeae8,0x0764da53,0xffcafa0d,0xfb057671
	.word  0x330e9674,0x4eff313a,0x00afb882,0x713aca89
	.word  0x977c54de,0xeb1efb2f,0x8cd9b0c2,0x6cd77e2e
	.word  0x72c11273,0xaf285c98,0x47fc2ce7,0x44602904



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

