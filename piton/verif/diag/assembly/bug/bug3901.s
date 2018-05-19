// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: bug3901.s
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
   random seed:	660369873
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
        setx  0x0000000000000990, %g1, %r17
        setx  0x47ab2f666f3d9e4e, %g1, %r0
        setx  0xa2c0c461e7bafbc2, %g1, %r1
        setx  0x9abf79ae19f645ff, %g1, %r2
        setx  0x6431b1f1fc950f13, %g1, %r3
        setx  0xcee0839d1795fd35, %g1, %r4
        setx  0x729a6c0c02d57c24, %g1, %r5
        setx  0x2240912227512501, %g1, %r6
        setx  0x1505e7e3c477b871, %g1, %r7
        setx  0xd57a985dd5800fdc, %g1, %r8
        setx  0x9d5e6b516b0a0a7a, %g1, %r9
        setx  0x9555113d3b1e4858, %g1, %r10
        setx  0x37cceb9cd3aa5a24, %g1, %r11
        setx  0x09339fac96660e57, %g1, %r12
        setx  0xb516fc5bb9ac9bc5, %g1, %r13
        setx  0xe2a67e30d5f20cab, %g1, %r14
        setx  0x9c74122d1995a73b, %g1, %r15
        setx  0xb3e2843b27be401b, %g1, %r18
        setx  0xc589ccc46435f980, %g1, %r19
        setx  0x6e5529027d5e9307, %g1, %r20
        setx  0xdf91fc2b13e385d8, %g1, %r21
        setx  0x7cb86e40b5b593bd, %g1, %r22
        setx  0x04ba4e7d5cc6a43b, %g1, %r23
        setx  0xc941d446073d53fc, %g1, %r24
        setx  0x09f2004fffd8d7d4, %g1, %r25
        setx  0x9dde5a6fb8d423f9, %g1, %r26
        setx  0x569197fb736699cd, %g1, %r27
        setx  0x633d29cec2466646, %g1, %r28
        setx  0x27553d68f8d0e196, %g1, %r29
        setx  0x58eea0836f96cfb1, %g1, %r30
        setx  0x4d94c700821d0c33, %g1, %r31
	save %r0, %r0, %r31
        setx  MAIN_BASE_DATA_VA, %r1, %r16
        setx  0x0000000000000130, %g1, %r17
        setx  0x2b95093af17de025, %g1, %r0
        setx  0x80db039242987ca9, %g1, %r1
        setx  0x8442509f74518764, %g1, %r2
        setx  0x147c0f8c3d1e3afc, %g1, %r3
        setx  0xe0b2afba5d01eacb, %g1, %r4
        setx  0xb28698c11b6a3efc, %g1, %r5
        setx  0x7b4c0bc889741723, %g1, %r6
        setx  0xe5cfc30a3592dd3c, %g1, %r7
        setx  0x397b78001b07836a, %g1, %r8
        setx  0xef3577ebcb43b5d9, %g1, %r9
        setx  0x22b044e3fbb2a050, %g1, %r10
        setx  0x8d2436f7c153e04b, %g1, %r11
        setx  0x821ab0ac475742ee, %g1, %r12
        setx  0x1b4cfca1c29c7a52, %g1, %r13
        setx  0x126372422ea59c42, %g1, %r14
        setx  0x6733711fe1862401, %g1, %r15
        setx  0xc4c3f341c5f296f0, %g1, %r18
        setx  0x071b13f7bd4e5b32, %g1, %r19
        setx  0x951ff8db3c1a016d, %g1, %r20
        setx  0x5b25f857d09d8d4c, %g1, %r21
        setx  0x78af27c287a5b836, %g1, %r22
        setx  0x2250f2fccb38e8ff, %g1, %r23
        setx  0xd331e24f3a31b495, %g1, %r24
        setx  0xbfd608d2b53de27e, %g1, %r25
        setx  0x196fdbdc109a0248, %g1, %r26
        setx  0x2eff42a01f7af41d, %g1, %r27
        setx  0xe1b259894206a46f, %g1, %r28
        setx  0xb2b550273544b645, %g1, %r29
        setx  0xb43c17dd6b5d2836, %g1, %r30
        setx  0x36af0af4f236792e, %g1, %r31
	save %r0, %r0, %r31
        setx  MAIN_BASE_DATA_VA, %r1, %r16
        setx  0x00000000000004b0, %g1, %r17
        setx  0x3d364f067b2a0598, %g1, %r0
        setx  0x4960417f415a7c72, %g1, %r1
        setx  0x26b19a6a23157bc6, %g1, %r2
        setx  0xcbbbccee7710ad0a, %g1, %r3
        setx  0xa3eefd52f85c6b6f, %g1, %r4
        setx  0x49564d6f2c0510a1, %g1, %r5
        setx  0x2f268e13f1421afd, %g1, %r6
        setx  0x88eb9b5efe5445fd, %g1, %r7
        setx  0x413828b6b57c5830, %g1, %r8
        setx  0xcc7c22739a07a668, %g1, %r9
        setx  0xe7c995fc0c0e9919, %g1, %r10
        setx  0x093d137cfeda432a, %g1, %r11
        setx  0xd7d0b79b6efd5e1f, %g1, %r12
        setx  0x111fcfe893c5e60d, %g1, %r13
        setx  0x088fc6d170d60c02, %g1, %r14
        setx  0xa14daec56d4d28c0, %g1, %r15
        setx  0xa0ddb352ec66fe8a, %g1, %r18
        setx  0xfd2732c7eb459e78, %g1, %r19
        setx  0xf38ca5d66a1439f8, %g1, %r20
        setx  0x19113210ebe1981f, %g1, %r21
        setx  0x365973e2ee399bbc, %g1, %r22
        setx  0xd299a83a84c0cc9a, %g1, %r23
        setx  0xc58ec07cf09b38b5, %g1, %r24
        setx  0xf028f2a3f41e4b55, %g1, %r25
        setx  0x5e77411e98fa37c7, %g1, %r26
        setx  0x3ee19046f09dfc1b, %g1, %r27
        setx  0x49af09bb8963cbc0, %g1, %r28
        setx  0x52a2f889b9ec648d, %g1, %r29
        setx  0xeab21eaf751cbc02, %g1, %r30
        setx  0x7cad74f630be9781, %g1, %r31
	save %r0, %r0, %r31
        setx  MAIN_BASE_DATA_VA, %r1, %r16
        setx  0x00000000000002d0, %g1, %r17
        setx  0xee95d9c42a83e65c, %g1, %r0
        setx  0x9d30ef2d844b9f33, %g1, %r1
        setx  0xfac0ddf2274ea983, %g1, %r2
        setx  0xd425a883a1a1c173, %g1, %r3
        setx  0xc17dd1416ca6c334, %g1, %r4
        setx  0x960d53c7abc9c0f7, %g1, %r5
        setx  0x69dc2864a68476e9, %g1, %r6
        setx  0xc15e8464dd8cd54e, %g1, %r7
        setx  0x4e585fcca127334f, %g1, %r8
        setx  0x83511963740826a0, %g1, %r9
        setx  0x79acb1ec6e2607e4, %g1, %r10
        setx  0xe7bc3f81ee1826bf, %g1, %r11
        setx  0xfc251ee5e3e8876b, %g1, %r12
        setx  0x0de55885dcd07a1f, %g1, %r13
        setx  0xa72a0a4dbcfd0ed5, %g1, %r14
        setx  0xddd9ac55c62d9e4c, %g1, %r15
        setx  0x128638797bbb4af2, %g1, %r18
        setx  0x748da026b2e8c76e, %g1, %r19
        setx  0x5e41d199829325a3, %g1, %r20
        setx  0x0d1bf9b099d28019, %g1, %r21
        setx  0x414c9c04a612eb33, %g1, %r22
        setx  0xce0a51065f621d91, %g1, %r23
        setx  0x0f008d1799f56168, %g1, %r24
        setx  0xc5ffa6e348371763, %g1, %r25
        setx  0x5c276c69d7293b30, %g1, %r26
        setx  0x1cf80e16adfa029c, %g1, %r27
        setx  0xaae0f65e9c28a4db, %g1, %r28
        setx  0x2df6ee2bfecc3294, %g1, %r29
        setx  0x37956edae9e7ed69, %g1, %r30
        setx  0x1e90b7d5aa7f6c01, %g1, %r31
	save %r0, %r0, %r31
        setx  MAIN_BASE_DATA_VA, %r1, %r16
        setx  0x0000000000000a40, %g1, %r17
        setx  0x17c00fba3fc1d9a5, %g1, %r0
        setx  0x416248e2d5f8a8f3, %g1, %r1
        setx  0x9a72149a0e31484e, %g1, %r2
        setx  0x1c3eef8d48a9a3f4, %g1, %r3
        setx  0xe3a62f258ada2147, %g1, %r4
        setx  0xcf3c45b2ebbc04f2, %g1, %r5
        setx  0xc553b0c357eafcbb, %g1, %r6
        setx  0x229241e3aa0153e8, %g1, %r7
        setx  0x22a4ce1a4d926131, %g1, %r8
        setx  0xf95b30c0617a5168, %g1, %r9
        setx  0xf233aa64bcded48e, %g1, %r10
        setx  0xa80b468d202cabc6, %g1, %r11
        setx  0x504b7318bd280d43, %g1, %r12
        setx  0x86e8378c72e00e1f, %g1, %r13
        setx  0x8396f8dd83a3dd11, %g1, %r14
        setx  0x79f97f38d00dc4b5, %g1, %r15
        setx  0x0e73be13a5a4c5ec, %g1, %r18
        setx  0x8a651c11ebd718fa, %g1, %r19
        setx  0x05ff0837fb39c0ab, %g1, %r20
        setx  0x9e427b961c55162f, %g1, %r21
        setx  0x3bfd149093a69f31, %g1, %r22
        setx  0x294024f7bb9d9ea3, %g1, %r23
        setx  0x7df31108852bd19d, %g1, %r24
        setx  0x9076fde1aa45e40e, %g1, %r25
        setx  0x0bfe2d2b72a542bb, %g1, %r26
        setx  0x5b643461fe2bab6d, %g1, %r27
        setx  0xd4271d636e8a5c91, %g1, %r28
        setx  0x65f7bcccfffb5c0d, %g1, %r29
        setx  0x7dcd4de1aa3ffe91, %g1, %r30
        setx  0x1541365a3bb0a67b, %g1, %r31
	save %r0, %r0, %r31
        setx  MAIN_BASE_DATA_VA, %r1, %r16
        setx  0x0000000000000900, %g1, %r17
        setx  0x25708aa9ad6458ee, %g1, %r0
        setx  0x53a663abda9ba846, %g1, %r1
        setx  0xad282d922f7bbf19, %g1, %r2
        setx  0xd7b51c9703118fe7, %g1, %r3
        setx  0x0c44ab88a768f845, %g1, %r4
        setx  0x18bb8fb647075fa6, %g1, %r5
        setx  0xb81725a1aa21bef7, %g1, %r6
        setx  0xb346624c725e1be9, %g1, %r7
        setx  0xb84cb85c211ecdf7, %g1, %r8
        setx  0x1b3abe75196be695, %g1, %r9
        setx  0x855eead659a64199, %g1, %r10
        setx  0xce384615f271a083, %g1, %r11
        setx  0x819abbc01389cae8, %g1, %r12
        setx  0xd104f410444f3e8c, %g1, %r13
        setx  0x4a6eac84ee3cecb6, %g1, %r14
        setx  0x702af87bfbbdcb29, %g1, %r15
        setx  0xaeb3b615f187b715, %g1, %r18
        setx  0x5c988e638f3e978e, %g1, %r19
        setx  0x8f70f7f3af90642a, %g1, %r20
        setx  0xdaa92d0f70a816c6, %g1, %r21
        setx  0x33ae2527e2373ed5, %g1, %r22
        setx  0xa3c72b5b4965558b, %g1, %r23
        setx  0x5d45a13b27e79594, %g1, %r24
        setx  0x2a67e0c11200fe68, %g1, %r25
        setx  0xf443c9b5a218299a, %g1, %r26
        setx  0xe2cfbbb6a0bcc681, %g1, %r27
        setx  0x4de655bfbf1333ec, %g1, %r28
        setx  0x74586aede35d0d8a, %g1, %r29
        setx  0x4c286347311e8a22, %g1, %r30
        setx  0x7243b926f887313d, %g1, %r31
	save %r0, %r0, %r31
        setx  MAIN_BASE_DATA_VA, %r1, %r16
        setx  0x00000000000007b0, %g1, %r17
        setx  0xc2b3c4b07eb2b220, %g1, %r0
        setx  0x1475cbe64c46690d, %g1, %r1
        setx  0x3fe5a76584743dcf, %g1, %r2
        setx  0xbc5ff8921049aeca, %g1, %r3
        setx  0xf51df512a1d08841, %g1, %r4
        setx  0x5ac52436481f80cb, %g1, %r5
        setx  0x2f9564cb2042117b, %g1, %r6
        setx  0x9d16ba105bc9ed75, %g1, %r7
        setx  0x41a18de9133c630e, %g1, %r8
        setx  0x8ce6657590d688d9, %g1, %r9
        setx  0x244099397d649a95, %g1, %r10
        setx  0xbb06921c81db3088, %g1, %r11
        setx  0x961c8aaecd7bab1d, %g1, %r12
        setx  0x7ab03b517392acfe, %g1, %r13
        setx  0x46ee7af00c682d6a, %g1, %r14
        setx  0x762f865431780185, %g1, %r15
        setx  0xe483cd59f4991a82, %g1, %r18
        setx  0x3fc47a51181460b9, %g1, %r19
        setx  0x59a73437aa536ea5, %g1, %r20
        setx  0x1b9f280b95892866, %g1, %r21
        setx  0xc945773ad62a35e8, %g1, %r22
        setx  0x20993ab48f785d18, %g1, %r23
        setx  0xa7cd1fdbf07df6b8, %g1, %r24
        setx  0x160c8659794a2c65, %g1, %r25
        setx  0x8e9ec838e25d4869, %g1, %r26
        setx  0x05ab12595f60ccee, %g1, %r27
        setx  0xfa05c8157e045d53, %g1, %r28
        setx  0xa1f49960cdeb2466, %g1, %r29
        setx  0x87bb3f55005cfcd2, %g1, %r30
        setx  0x41e7e8c442d680fe, %g1, %r31
	save %r0, %r0, %r31
        setx  MAIN_BASE_DATA_VA, %r1, %r16
        setx  0x00000000000007e0, %g1, %r17
        setx  0x138da03e2245875d, %g1, %r0
        setx  0x3c9ba5a7ea5ca24f, %g1, %r1
        setx  0x2153be74754e9def, %g1, %r2
        setx  0xcfc29f7a4a4910fa, %g1, %r3
        setx  0xaa97c3b16ac28688, %g1, %r4
        setx  0xbe5867b5fd26c1ef, %g1, %r5
        setx  0xc2e647d7ff43e2a4, %g1, %r6
        setx  0xcdc8e15cb0726464, %g1, %r7
        setx  0x513a3f2000d1c369, %g1, %r8
        setx  0xf6d12b262d5ba48c, %g1, %r9
        setx  0xd6b08fbe74394584, %g1, %r10
        setx  0x127eb49dd6b62459, %g1, %r11
        setx  0xee3fa95d585f3028, %g1, %r12
        setx  0xf31f2cbb90a9fe38, %g1, %r13
        setx  0xea4d6f9101e653d7, %g1, %r14
        setx  0xafe88fac2529109a, %g1, %r15
        setx  0xa50470527050949a, %g1, %r18
        setx  0x29e342ab7fe511e3, %g1, %r19
        setx  0xc6a3af18436f13dd, %g1, %r20
        setx  0x7f2b6adfbf66cdb7, %g1, %r21
        setx  0x0c2484c37aa1607c, %g1, %r22
        setx  0xc47052d095afb854, %g1, %r23
        setx  0x3e9dde84f7e86a66, %g1, %r24
        setx  0x8267db9bc96e1e67, %g1, %r25
        setx  0x25452c7e52026aef, %g1, %r26
        setx  0xa58453e0484996ca, %g1, %r27
        setx  0xe5abe99b03a64af0, %g1, %r28
        setx  0x1185e4fdc5351c02, %g1, %r29
        setx  0x18e81dff5085111f, %g1, %r30
        setx  0x13afb45875e7400e, %g1, %r31
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
	.word 0xbf2c1011  ! 0: SLLX_R	sllx	%r16, %r17, %r31
	.word 0x84b40011  ! 2: ORNcc_R	orncc 	%r16, %r17, %r2
	.word 0xb9414000  ! 2: RDPC	rd	%pc, %r28
	.word 0xce740011  ! 3: STX_R	stx	%r7, [%r16 + %r17]
	.word 0x8d840011  ! 5: WRFPRS_R	wr	%r16, %r17, %fprs
	.word 0xfe740011  ! 6: STX_R	stx	%r31, [%r16 + %r17]
	.word 0x901c27e6  ! 8: XOR_I	xor 	%r16, 0x07e6, %r8
	.word 0xd7e41011  ! 8: CASA_I	casa	[%r16] 0x80, %r17, %r11
	.word 0xcc340011  ! 9: STH_R	sth	%r6, [%r16 + %r17]
	.word 0xd4fc1011  ! 11: SWAPA_R	swapa	%r10, [%r16 + %r17] 0x80
thr3_irf_ce_0:
!$EV error(3,expr(@VA(.MAIN.thr3_irf_ce_0), 16, 16),1,IRF,ce,13,x, x,x,x, x,x,x)
	.word 0xc4342a31  ! 14: STH_I	sth	%r2, [%r16 + 0x0a31]
	.word 0x9c9c2a5f  ! 16: XORcc_I	xorcc 	%r16, 0x0a5f, %r14
	.word 0xa6c4238d  ! 16: ADDCcc_I	addccc 	%r16, 0x038d, %r19
	.word 0xd2fc1011  ! 16: SWAPA_R	swapa	%r9, [%r16 + %r17] 0x80
	.word 0x862c0011  ! 17: ANDN_R	andn 	%r16, %r17, %r3
	.word 0x81dc27b8  ! 19: FLUSH_I	dis not found

	.word 0xd674217d  ! 21: STX_I	stx	%r11, [%r16 + 0x017d]
	.word 0xacac0011  ! 23: ANDNcc_R	andncc 	%r16, %r17, %r22
	.word 0x84042747  ! 23: ADD_I	add 	%r16, 0x0747, %r2
	.word 0xc36c0011  ! 23: PREFETCH_R	prefetch	[%r16 + %r17], #one_read
	.word 0x9c142503  ! 24: OR_I	or 	%r16, 0x0503, %r14
	.word 0x18800003  ! 26: BGU	bgu  	<label_0x3>
	.word 0xc8342f81  ! 28: STH_I	sth	%r4, [%r16 + 0x0f81]
	.word 0x88c40011  ! 30: ADDCcc_R	addccc 	%r16, %r17, %r4
	.word 0xab2c3001  ! 30: SLLX_I	sllx	%r16, 0x0001, %r21
	.word 0x92940011  ! 30: ORcc_R	orcc 	%r16, %r17, %r9
	.word 0xc36c0011  ! 30: PREFETCH_R	prefetch	[%r16 + %r17], #one_read
thr3_irf_ce_1:
!$EV error(3,expr(@VA(.MAIN.thr3_irf_ce_1), 16, 16),1,IRF,ce,15,x, x,x,x, x,x,x)
	.word 0xfe2c240d  ! 33: STB_I	stb	%r31, [%r16 + 0x040d]
	.word 0xd44c2c5c  ! 35: LDSB_I	ldsb	[%r16 + 0x0c5c], %r10
	.word 0xce2c2ebd  ! 37: STB_I	stb	%r7, [%r16 + 0x0ebd]
	.word 0xa72c3001  ! 39: SLLX_I	sllx	%r16, 0x0001, %r19
	.word 0xa6440011  ! 39: ADDC_R	addc 	%r16, %r17, %r19
	.word 0xc4a41011  ! 39: STWA_R	stwa	%r2, [%r16 + %r17] 0x80
	.word 0xab3c1011  ! 40: SRAX_R	srax	%r16, %r17, %r21
	.word 0x9aac29ce  ! 42: ANDNcc_I	andncc 	%r16, 0x09ce, %r13
	.word 0x940c0011  ! 42: AND_R	and 	%r16, %r17, %r10
	.word 0x85840011  ! 42: WRCCR_R	wr	%r16, %r17, %ccr
	.word 0x9ca42a2e  ! 43: SUBcc_I	subcc 	%r16, 0x0a2e, %r14
	.word 0xbc2c22ee  ! 45: ANDN_I	andn 	%r16, 0x02ee, %r30
	.word 0xb4440011  ! 45: ADDC_R	addc 	%r16, %r17, %r26
	.word 0xc3ec1011  ! 45: PREFETCHA_R	prefetcha	[%r16, %r17] 0x80, #one_read
	.word 0xfc34209b  ! 47: STH_I	sth	%r30, [%r16 + 0x009b]
	.word 0x948c283b  ! 49: ANDcc_I	andcc 	%r16, 0x083b, %r10
	.word 0x9a042f7c  ! 49: ADD_I	add 	%r16, 0x0f7c, %r13
	.word 0x8fe40011  ! 49: SAVE_R	save	%r16, %r17, %r7
	.word 0x8d3c1011  ! 50: SRAX_R	srax	%r16, %r17, %r6
	.word 0xdc8421f3  ! 52: LDUWA_I	lduwa	[%r16, + 0x01f3] %asi, %r14
	.word 0x96ac0011  ! 53: ANDNcc_R	andncc 	%r16, %r17, %r11
	.word 0x8c440011  ! 55: ADDC_R	addc 	%r16, %r17, %r6
	.word 0xbb2c3001  ! 55: SLLX_I	sllx	%r16, 0x0001, %r29
	.word 0x913c1011  ! 55: SRAX_R	srax	%r16, %r17, %r8
	.word 0xf0442d34  ! 55: LDSW_I	ldsw	[%r16 + 0x0d34], %r24
	.word 0xec740011  ! 56: STX_R	stx	%r22, [%r16 + %r17]
	.word 0x9b340011  ! 58: SRL_R	srl 	%r16, %r17, %r13
	.word 0xb89c0011  ! 58: XORcc_R	xorcc 	%r16, %r17, %r28
	.word 0xdcac2db1  ! 58: STBA_I	stba	%r14, [%r16 + 0x0db1] %asi
thr3_irf_ce_2:
!$EV error(3,expr(@VA(.MAIN.thr3_irf_ce_2), 16, 16),1,IRF,ce,33,x, x,x,x, x,x,x)
	.word 0xfe742d45  ! 61: STX_I	stx	%r31, [%r16 + 0x0d45]
	.word 0x90ac0011  ! 63: ANDNcc_R	andncc 	%r16, %r17, %r8
	.word 0xc2ac2ad6  ! 63: STBA_I	stba	%r1, [%r16 + 0x0ad6] %asi
	.word 0xf0740011  ! 64: STX_R	stx	%r24, [%r16 + %r17]
	.word 0x917c0411  ! 66: MOVR_R	move	%r16, %r17, %r8
	.word 0xb37c2401  ! 66: MOVR_I	move	%r16, 0xfffffff8, %r25
	.word 0x932c0011  ! 66: SLL_R	sll 	%r16, %r17, %r9
	.word 0x1a800003  ! 66: BCC	bcc  	<label_0x3>
	.word 0xce742889  ! 68: STX_I	stx	%r7, [%r16 + 0x0889]
	.word 0xac2c0011  ! 70: ANDN_R	andn 	%r16, %r17, %r22
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xe8240011  ! 71: STW_R	stw	%r20, [%r16 + %r17]
	.word 0xb23c29f1  ! 73: XNOR_I	xnor 	%r16, 0x09f1, %r25
	.word 0xad641811  ! 73: MOVcc_R	<illegal instruction>
	.word 0x8cbc2f89  ! 73: XNORcc_I	xnorcc 	%r16, 0x0f89, %r6
	.word 0xfeec2ced  ! 73: LDSTUBA_I	ldstuba	%r31, [%r16 + 0x0ced] %asi
	.word 0xd6340011  ! 74: STH_R	sth	%r11, [%r16 + %r17]
	.word 0x913c2001  ! 76: SRA_I	sra 	%r16, 0x0001, %r8
	.word 0x9c1c0011  ! 76: XOR_R	xor 	%r16, %r17, %r14
thr3_resum_intr_0:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_0), 16, 16)) -> intp(3, 3, 1)
	wr      %r0, 0x5, %asr26
	.word 0x95341011  ! 77: SRLX_R	srlx	%r16, %r17, %r10
	.word 0x932c1011  ! 79: SLLX_R	sllx	%r16, %r17, %r9
	ta	T_CHANGE_NONHPRIV	! macro
thr3_irf_ce_3:
!$EV error(3,expr(@VA(.MAIN.thr3_irf_ce_3), 16, 16),1,IRF,ce,68,x, x,x,x, x,x,x)
	.word 0xd82c2779  ! 82: STB_I	stb	%r12, [%r16 + 0x0779]
	.word 0xe414228f  ! 84: LDUH_I	lduh	[%r16 + 0x028f], %r18
	.word 0xde2421eb  ! 86: STW_I	stw	%r15, [%r16 + 0x01eb]
        wr %g0, 0x4, %fprs
	.word 0xd2340011  ! 89: STH_R	sth	%r9, [%r16 + %r17]
	.word 0xbe9c0011  ! 91: XORcc_R	xorcc 	%r16, %r17, %r31
	.word 0x8f504000  ! 91: RDPR_TNPC	rdpr	%tnpc, %r7
	.word 0xc6742d59  ! 93: STX_I	stx	%r3, [%r16 + 0x0d59]
	.word 0xbd3c0011  ! 95: SRA_R	sra 	%r16, %r17, %r30
	.word 0xb82c0011  ! 95: ANDN_R	andn 	%r16, %r17, %r28
	.word 0x8d340011  ! 95: SRL_R	srl 	%r16, %r17, %r6
	.word 0xc36c248a  ! 95: PREFETCH_I	prefetch	[%r16 + 0x048a], #one_read
	.word 0xcc242d83  ! 97: STW_I	stw	%r6, [%r16 + 0x0d83]
        wr %g0, 0x4, %fprs
thr3_irf_ce_4:
!$EV error(3,expr(@VA(.MAIN.thr3_irf_ce_4), 16, 16),1,IRF,ce,32,x, x,x,x, x,x,x)
	.word 0xcc2c20dd  ! 102: STB_I	stb	%r6, [%r16 + 0x00dd]
	.word 0x988c0011  ! 104: ANDcc_R	andcc 	%r16, %r17, %r12
	.word 0x85840011  ! 104: WRCCR_R	wr	%r16, %r17, %ccr
	.word 0xc2340011  ! 105: STH_R	sth	%r1, [%r16 + %r17]
	.word 0xf7240011  ! 107: STF_R	st	%f27, [%r17, %r16]
	.word 0xba3421ed  ! 108: SUBC_I	orn 	%r16, 0x01ed, %r29
        wr %g0, 0x4, %fprs
thr3_irf_ce_5:
!$EV error(3,expr(@VA(.MAIN.thr3_irf_ce_5), 16, 16),1,IRF,ce,30,x, x,x,x, x,x,x)
	.word 0xd4742a67  ! 113: STX_I	stx	%r10, [%r16 + 0x0a67]
thr3_resum_intr_1:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1), 16, 16)) -> intp(3, 3, 1)
	wr      %r0, 0x5, %asr26
thr3_irf_ce_6:
!$EV error(3,expr(@VA(.MAIN.thr3_irf_ce_6), 16, 16),1,IRF,ce,59,x, x,x,x, x,x,x)
	.word 0xd474212f  ! 118: STX_I	stx	%r10, [%r16 + 0x012f]
	.word 0xac040011  ! 120: ADD_R	add 	%r16, %r17, %r22
        wr %g0, 0x4, %fprs
	.word 0xc83429a9  ! 122: STH_I	sth	%r4, [%r16 + 0x09a9]
	.word 0x969c2504  ! 124: XORcc_I	xorcc 	%r16, 0x0504, %r11
	.word 0xad2c0011  ! 124: SLL_R	sll 	%r16, %r17, %r22
	ta	T_CHANGE_PRIV	! macro
	.word 0xee2c2171  ! 126: STB_I	stb	%r23, [%r16 + 0x0171]
	.word 0x837c0411  ! 128: MOVR_R	move	%r16, %r17, %r1
	.word 0x94fc2682  ! 128: SDIVcc_I	sdivcc 	%r16, 0x0682, %r10
thr3_irf_ce_7:
!$EV error(3,expr(@VA(.MAIN.thr3_irf_ce_7), 16, 16),1,IRF,ce,55,x, x,x,x, x,x,x)
	.word 0xc82c2531  ! 131: STB_I	stb	%r4, [%r16 + 0x0531]
	.word 0x969c0011  ! 133: XORcc_R	xorcc 	%r16, %r17, %r11
	.word 0xb33c0011  ! 133: SRA_R	sra 	%r16, %r17, %r25
	.word 0x81dc2429  ! 133: FLUSH_I	dis not found

	.word 0xf02c232d  ! 135: STB_I	stb	%r24, [%r16 + 0x032d]
	.word 0xb1641811  ! 137: MOVcc_R	<illegal instruction>
thr3_resum_intr_2:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_2), 16, 16)) -> intp(3, 3, 1)
	wr      %r0, 0x5, %asr26
	.word 0xea740011  ! 138: STX_R	stx	%r21, [%r16 + %r17]
	.word 0x8a2c0011  ! 140: ANDN_R	andn 	%r16, %r17, %r5
	.word 0xb1e40011  ! 140: SAVE_R	save	%r16, %r17, %r24
	.word 0xd03424d1  ! 142: STH_I	sth	%r8, [%r16 + 0x04d1]
	.word 0xa43c2d67  ! 144: XNOR_I	xnor 	%r16, 0x0d67, %r18
	.word 0x94b42a89  ! 144: ORNcc_I	orncc 	%r16, 0x0a89, %r10
	.word 0x9c1c0011  ! 144: XOR_R	xor 	%r16, %r17, %r14
	.word 0x8f530000  ! 144: RDPR_CLEANWIN	rdpr	%cleanwin, %r7
	.word 0xcc740011  ! 145: STX_R	stx	%r6, [%r16 + %r17]
        wr %g0, 0x4, %fprs
	.word 0xf8240011  ! 148: STW_R	stw	%r28, [%r16 + %r17]
	.word 0x96840011  ! 150: ADDcc_R	addcc 	%r16, %r17, %r11
thr3_resum_intr_3:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_3), 16, 16)) -> intp(3, 3, 1)
	wr      %r0, 0x5, %asr26
thr3_irf_ce_8:
!$EV error(3,expr(@VA(.MAIN.thr3_irf_ce_8), 16, 16),1,IRF,ce,5,x, x,x,x, x,x,x)
	.word 0xc42c2fc9  ! 153: STB_I	stb	%r2, [%r16 + 0x0fc9]
	.word 0x8b50c000  ! 155: RDPR_TT	<illegal instruction>
	.word 0xc4340011  ! 156: STH_R	sth	%r2, [%r16 + %r17]
	.word 0xb03c2d2b  ! 158: XNOR_I	xnor 	%r16, 0x0d2b, %r24
	.word 0xda9c1011  ! 158: LDDA_R	ldda	[%r16, %r17] 0x80, %r13
	.word 0x932c3001  ! 159: SLLX_I	sllx	%r16, 0x0001, %r9
	.word 0x9fe40011  ! 161: SAVE_R	save	%r16, %r17, %r15
	.word 0xf4342bf1  ! 163: STH_I	sth	%r26, [%r16 + 0x0bf1]
	.word 0x923c0011  ! 165: XNOR_R	xnor 	%r16, %r17, %r9
	.word 0x949c2fdf  ! 165: XORcc_I	xorcc 	%r16, 0x0fdf, %r10
	.word 0xdbf42011  ! 165: CASXA_R	casxa	[%r16]%asi, %r17, %r13
	.word 0xda342b61  ! 167: STH_I	sth	%r13, [%r16 + 0x0b61]
	.word 0x9204248d  ! 169: ADD_I	add 	%r16, 0x048d, %r9
	.word 0x86940011  ! 169: ORcc_R	orcc 	%r16, %r17, %r3
	.word 0xb81c0011  ! 169: XOR_R	xor 	%r16, %r17, %r28
	.word 0xc36c2144  ! 169: PREFETCH_I	prefetch	[%r16 + 0x0144], #one_read
thr3_irf_ce_9:
!$EV error(3,expr(@VA(.MAIN.thr3_irf_ce_9), 16, 16),1,IRF,ce,59,x, x,x,x, x,x,x)
	.word 0xc6342bf3  ! 172: STH_I	sth	%r3, [%r16 + 0x0bf3]
	.word 0x9e2c0011  ! 174: ANDN_R	andn 	%r16, %r17, %r15
	.word 0x8d2c3001  ! 174: SLLX_I	sllx	%r16, 0x0001, %r6
	.word 0xe93c0011  ! 174: STDF_R	std	%f20, [%r17, %r16]
	.word 0xf2240011  ! 175: STW_R	stw	%r25, [%r16 + %r17]
	.word 0x8d518000  ! 177: RDPR_PSTATE	<illegal instruction>
thr3_irf_ce_10:
!$EV error(3,expr(@VA(.MAIN.thr3_irf_ce_10), 16, 16),1,IRF,ce,65,x, x,x,x, x,x,x)
	.word 0xf0342439  ! 180: STH_I	sth	%r24, [%r16 + 0x0439]
	.word 0x96fc21ac  ! 182: SDIVcc_I	sdivcc 	%r16, 0x01ac, %r11
	.word 0xc6740011  ! 183: STX_R	stx	%r3, [%r16 + %r17]
	.word 0x82b40011  ! 185: ORNcc_R	orncc 	%r16, %r17, %r1
	.word 0x8a840011  ! 185: ADDcc_R	addcc 	%r16, %r17, %r5
	.word 0xb2140011  ! 185: OR_R	or 	%r16, %r17, %r25
	ta	T_CHANGE_HPRIV	! macro
	.word 0xce742585  ! 187: STX_I	stx	%r7, [%r16 + 0x0585]
	.word 0xb7518000  ! 189: RDPR_PSTATE	<illegal instruction>
thr3_irf_ce_11:
!$EV error(3,expr(@VA(.MAIN.thr3_irf_ce_11), 16, 16),1,IRF,ce,44,x, x,x,x, x,x,x)
	.word 0xfe242ed1  ! 192: STW_I	stw	%r31, [%r16 + 0x0ed1]
	.word 0x8d2c1011  ! 194: SLLX_R	sllx	%r16, %r17, %r6
	ta	T_CHANGE_PRIV	! macro
	.word 0x8e8c24a3  ! 195: ANDcc_I	andcc 	%r16, 0x04a3, %r7
	.word 0xa92c2001  ! 197: SLL_I	sll 	%r16, 0x0001, %r20
	.word 0xb4342466  ! 197: ORN_I	orn 	%r16, 0x0466, %r26
	.word 0x8a1c0011  ! 197: XOR_R	xor 	%r16, %r17, %r5
	.word 0x9a6c0011  ! 197: UDIVX_R	udivx 	%r16, %r17, %r13
thr3_irf_ce_12:
!$EV error(3,expr(@VA(.MAIN.thr3_irf_ce_12), 16, 16),1,IRF,ce,24,x, x,x,x, x,x,x)
	.word 0xea742be9  ! 200: STX_I	stx	%r21, [%r16 + 0x0be9]
	.word 0xbf2c0011  ! 202: SLL_R	sll 	%r16, %r17, %r31
	.word 0xac342ef5  ! 202: ORN_I	orn 	%r16, 0x0ef5, %r22
	.word 0x8557c000  ! 202: RDPR_VER	<illegal instruction>
	.word 0xca2c0011  ! 203: STB_R	stb	%r5, [%r16 + %r17]
	.word 0x83520000  ! 205: RDPR_PIL	<illegal instruction>
	.word 0xec3422df  ! 207: STH_I	sth	%r22, [%r16 + 0x02df]
	.word 0xb88c0011  ! 209: ANDcc_R	andcc 	%r16, %r17, %r28
	.word 0x853c0011  ! 209: SRA_R	sra 	%r16, %r17, %r2
	ta	T_CHANGE_NONHPRIV	! macro
thr3_irf_ce_13:
!$EV error(3,expr(@VA(.MAIN.thr3_irf_ce_13), 16, 16),1,IRF,ce,40,x, x,x,x, x,x,x)
	.word 0xf4742d5d  ! 212: STX_I	stx	%r26, [%r16 + 0x0d5d]
	.word 0x8b2c2001  ! 214: SLL_I	sll 	%r16, 0x0001, %r5
	.word 0x8d840011  ! 214: WRFPRS_R	wr	%r16, %r17, %fprs
	.word 0xa4ac0011  ! 215: ANDNcc_R	andncc 	%r16, %r17, %r18
	.word 0x86842c41  ! 217: ADDcc_I	addcc 	%r16, 0x0c41, %r3
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x98bc21ce  ! 218: XNORcc_I	xnorcc 	%r16, 0x01ce, %r12
	.word 0xb53c0011  ! 220: SRA_R	sra 	%r16, %r17, %r26
	.word 0x9b2c3001  ! 220: SLLX_I	sllx	%r16, 0x0001, %r13
	.word 0xaf3c1011  ! 220: SRAX_R	srax	%r16, %r17, %r23
        wr %g0, 0x4, %fprs
	.word 0xa8940011  ! 221: ORcc_R	orcc 	%r16, %r17, %r20
	ta	T_CHANGE_PRIV	! macro
	.word 0xde2c2841  ! 225: STB_I	stb	%r15, [%r16 + 0x0841]
	.word 0x860c2ed5  ! 227: AND_I	and 	%r16, 0x0ed5, %r3
	.word 0x84442637  ! 227: ADDC_I	addc 	%r16, 0x0637, %r2
	.word 0x2e800003  ! 227: BVS	bvs,a	<label_0x3>
	.word 0x89340011  ! 228: SRL_R	srl 	%r16, %r17, %r4
	.word 0x8a8c0011  ! 230: ANDcc_R	andcc 	%r16, %r17, %r5
	.word 0x9b340011  ! 230: SRL_R	srl 	%r16, %r17, %r13
	.word 0xa6440011  ! 230: ADDC_R	addc 	%r16, %r17, %r19
	.word 0x99518000  ! 230: RDPR_PSTATE	rdpr	%pstate, %r12
thr3_irf_ce_14:
!$EV error(3,expr(@VA(.MAIN.thr3_irf_ce_14), 16, 16),1,IRF,ce,21,x, x,x,x, x,x,x)
	.word 0xc27423ff  ! 233: STX_I	stx	%r1, [%r16 + 0x03ff]
	.word 0xa7341011  ! 235: SRLX_R	srlx	%r16, %r17, %r19
	.word 0x85ab0831  ! 235: FMOVGU	fmovs	%fcc1, %f17, %f2
	.word 0xd6742ff7  ! 237: STX_I	stx	%r11, [%r16 + 0x0ff7]
	.word 0xa80c2f0a  ! 239: AND_I	and 	%r16, 0x0f0a, %r20
	.word 0x26800003  ! 239: BL	bl,a	<label_0x3>
	.word 0xe4742ce3  ! 241: STX_I	stx	%r18, [%r16 + 0x0ce3]
	.word 0x94bc28ea  ! 243: XNORcc_I	xnorcc 	%r16, 0x08ea, %r10
	.word 0x8143e072  ! 243: MEMBAR	membar	#StoreLoad | #Lookaside | #MemIssue | #Sync 
	.word 0xde2c0011  ! 244: STB_R	stb	%r15, [%r16 + %r17]
	.word 0x943c2fe9  ! 246: XNOR_I	xnor 	%r16, 0x0fe9, %r10
	.word 0xc3ec1011  ! 246: PREFETCHA_R	prefetcha	[%r16, %r17] 0x80, #one_read
thr3_irf_ce_15:
!$EV error(3,expr(@VA(.MAIN.thr3_irf_ce_15), 16, 16),1,IRF,ce,48,x, x,x,x, x,x,x)
	.word 0xd8742df1  ! 249: STX_I	stx	%r12, [%r16 + 0x0df1]
	.word 0xde9c1011  ! 251: LDDA_R	ldda	[%r16, %r17] 0x80, %r15
	.word 0x88142dbe  ! 252: OR_I	or 	%r16, 0x0dbe, %r4
	.word 0x988c0011  ! 254: ANDcc_R	andcc 	%r16, %r17, %r12
	.word 0x9c542884  ! 254: UMUL_I	umul 	%r16, 0x0884, %r14
	.word 0xfe24227f  ! 256: STW_I	stw	%r31, [%r16 + 0x027f]
	.word 0x92c40011  ! 258: ADDCcc_R	addccc 	%r16, %r17, %r9
	.word 0x963c0011  ! 258: XNOR_R	xnor 	%r16, %r17, %r11
	.word 0x81580000  ! 258: FLUSHW	flushw
	.word 0x90340011  ! 259: ORN_R	orn 	%r16, %r17, %r8
	.word 0xcc841011  ! 261: LDUWA_R	lduwa	[%r16, %r17] 0x80, %r6
	.word 0xf4740011  ! 262: STX_R	stx	%r26, [%r16 + %r17]
	.word 0x9e5c292c  ! 264: SMUL_I	smul 	%r16, 0x092c, %r15
	.word 0x841422ab  ! 265: OR_I	or 	%r16, 0x02ab, %r2
	.word 0x922c0011  ! 267: ANDN_R	andn 	%r16, %r17, %r9
	.word 0xc3ec1011  ! 267: PREFETCHA_R	prefetcha	[%r16, %r17] 0x80, #one_read
	.word 0xe4740011  ! 268: STX_R	stx	%r18, [%r16 + %r17]
	.word 0xbd3c0011  ! 270: SRA_R	sra 	%r16, %r17, %r30
	.word 0x8a140011  ! 270: OR_R	or 	%r16, %r17, %r5
	.word 0xc2f423e3  ! 270: STXA_I	stxa	%r1, [%r16 + 0x03e3] %asi
	.word 0xe8240011  ! 271: STW_R	stw	%r20, [%r16 + %r17]
	.word 0x83340011  ! 273: SRL_R	srl 	%r16, %r17, %r1
thr3_resum_intr_4:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_4), 16, 16)) -> intp(3, 3, 1)
	wr      %r0, 0x5, %asr26
	.word 0xd02c2f09  ! 275: STB_I	stb	%r8, [%r16 + 0x0f09]
	.word 0xbe440011  ! 277: ADDC_R	addc 	%r16, %r17, %r31
	.word 0xb6bc2064  ! 277: XNORcc_I	xnorcc 	%r16, 0x0064, %r27
	.word 0x886c2225  ! 277: UDIVX_I	udivx 	%r16, 0x0225, %r4
	.word 0xd6740011  ! 278: STX_R	stx	%r11, [%r16 + %r17]
	.word 0x9c2c0011  ! 280: ANDN_R	andn 	%r16, %r17, %r14
	.word 0x821421dc  ! 280: OR_I	or 	%r16, 0x01dc, %r1
	.word 0xaa0c0011  ! 280: AND_R	and 	%r16, %r17, %r21
	.word 0x81840011  ! 280: WRY_R	wr	%r16, %r17, %y
	.word 0xaa8c0011  ! 281: ANDcc_R	andcc 	%r16, %r17, %r21
	.word 0x932c0011  ! 283: SLL_R	sll 	%r16, %r17, %r9
	.word 0x81dc0011  ! 283: FLUSH_R	dis not found

	.word 0xc22c274f  ! 285: STB_I	stb	%r1, [%r16 + 0x074f]
        wr %g0, 0x4, %fprs
	.word 0xc274275b  ! 289: STX_I	stx	%r1, [%r16 + 0x075b]
	.word 0xbb7c0411  ! 291: MOVR_R	move	%r16, %r17, %r29
	.word 0x9a2c0011  ! 291: ANDN_R	andn 	%r16, %r17, %r13
	.word 0x8c040011  ! 291: ADD_R	add 	%r16, %r17, %r6
	.word 0x85a019b1  ! 291: FsTOq	dis not found

	.word 0x9c942db3  ! 292: ORcc_I	orcc 	%r16, 0x0db3, %r14
	.word 0xe46c0011  ! 294: LDSTUB_R	ldstub	%r18, [%r16 + %r17]
	.word 0xe8342151  ! 296: STH_I	sth	%r20, [%r16 + 0x0151]
	.word 0xd8d42e30  ! 298: LDSHA_I	ldsha	[%r16, + 0x0e30] %asi, %r12
	.word 0xf024258d  ! 300: STW_I	stw	%r24, [%r16 + 0x058d]
	.word 0x96940011  ! 302: ORcc_R	orcc 	%r16, %r17, %r11
	.word 0xa7340011  ! 302: SRL_R	srl 	%r16, %r17, %r19
	.word 0x8143c000  ! 302: STBAR	stbar
	.word 0xcc74249f  ! 304: STX_I	stx	%r6, [%r16 + 0x049f]
	.word 0x9e340011  ! 306: ORN_R	orn 	%r16, %r17, %r15
	.word 0xaf340011  ! 306: SRL_R	srl 	%r16, %r17, %r23
	.word 0x820c0011  ! 306: AND_R	and 	%r16, %r17, %r1
	.word 0xe6bc1011  ! 306: STDA_R	stda	%r19, [%r16 + %r17] 0x80
	.word 0xfc242875  ! 308: STW_I	stw	%r30, [%r16 + 0x0875]
	.word 0xbcc40011  ! 310: ADDCcc_R	addccc 	%r16, %r17, %r30
	.word 0xd2ac25a7  ! 310: STBA_I	stba	%r9, [%r16 + 0x05a7] %asi
thr3_irf_ce_16:
!$EV error(3,expr(@VA(.MAIN.thr3_irf_ce_16), 16, 16),1,IRF,ce,34,x, x,x,x, x,x,x)
	.word 0xd274258b  ! 313: STX_I	stx	%r9, [%r16 + 0x058b]
	.word 0x873c0011  ! 315: SRA_R	sra 	%r16, %r17, %r3
	.word 0x980c0011  ! 315: AND_R	and 	%r16, %r17, %r12
	.word 0x81dc0011  ! 315: FLUSH_R	dis not found

	.word 0xc874204d  ! 317: STX_I	stx	%r4, [%r16 + 0x004d]
	.word 0x852c0011  ! 319: SLL_R	sll 	%r16, %r17, %r2
	.word 0xd0fc1011  ! 319: SWAPA_R	swapa	%r8, [%r16 + %r17] 0x80
	.word 0xd6340011  ! 320: STH_R	sth	%r11, [%r16 + %r17]
	.word 0x8cbc2aa4  ! 322: XNORcc_I	xnorcc 	%r16, 0x0aa4, %r6
	.word 0x90c421ab  ! 322: ADDCcc_I	addccc 	%r16, 0x01ab, %r8
	.word 0x902c0011  ! 322: ANDN_R	andn 	%r16, %r17, %r8
	.word 0x81dc0011  ! 322: FLUSH_R	dis not found

	.word 0x96ac0011  ! 323: ANDNcc_R	andncc 	%r16, %r17, %r11
	.word 0xa5a018f1  ! 325: FqTOs	dis not found

	.word 0x8cbc296f  ! 326: XNORcc_I	xnorcc 	%r16, 0x096f, %r6
	.word 0x83643801  ! 328: MOVcc_I	<illegal instruction>
	.word 0x961c0011  ! 328: XOR_R	xor 	%r16, %r17, %r11
	.word 0x8cc40011  ! 328: ADDCcc_R	addccc 	%r16, %r17, %r6
	.word 0xd8440011  ! 328: LDSW_R	ldsw	[%r16 + %r17], %r12
	.word 0xd4742467  ! 330: STX_I	stx	%r10, [%r16 + 0x0467]
	.word 0x9c3c0011  ! 332: XNOR_R	xnor 	%r16, %r17, %r14
	.word 0x82342187  ! 332: ORN_I	orn 	%r16, 0x0187, %r1
	.word 0x96d40011  ! 332: UMULcc_R	umulcc 	%r16, %r17, %r11
	.word 0xca74213d  ! 334: STX_I	stx	%r5, [%r16 + 0x013d]
	.word 0x86342195  ! 336: ORN_I	orn 	%r16, 0x0195, %r3
thr3_resum_intr_5:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_5), 16, 16)) -> intp(3, 3, 1)
	wr      %r0, 0x5, %asr26
	.word 0xc6342d53  ! 338: STH_I	sth	%r3, [%r16 + 0x0d53]
	.word 0x8ac40011  ! 340: ADDCcc_R	addccc 	%r16, %r17, %r5
	.word 0xde7c0011  ! 340: SWAP_R	swap	%r15, [%r16 + %r17]
	.word 0xce2c2297  ! 342: STB_I	stb	%r7, [%r16 + 0x0297]
	.word 0xa950c000  ! 344: RDPR_TT	rdpr	%tt, %r20
	.word 0xae34254c  ! 345: ORN_I	orn 	%r16, 0x054c, %r23
	.word 0xbcb42cb4  ! 347: ORNcc_I	orncc 	%r16, 0x0cb4, %r30
	.word 0x8143e06e  ! 347: MEMBAR	membar	#StoreLoad | #LoadStore | #StoreStore | #MemIssue | #Sync 
	.word 0xaa1c0011  ! 348: XOR_R	xor 	%r16, %r17, %r21
	.word 0xe8fc2500  ! 350: SWAPA_I	swapa	%r20, [%r16 + 0x0500] %asi
thr3_irf_ce_17:
!$EV error(3,expr(@VA(.MAIN.thr3_irf_ce_17), 16, 16),1,IRF,ce,56,x, x,x,x, x,x,x)
	.word 0xee242b97  ! 353: STW_I	stw	%r23, [%r16 + 0x0b97]
	.word 0xe87c2a44  ! 355: SWAP_I	swap	%r20, [%r16 + 0x0a44]
	.word 0xd6740011  ! 356: STX_R	stx	%r11, [%r16 + %r17]
	.word 0x8143c000  ! 358: STBAR	stbar
	.word 0x9aac0011  ! 359: ANDNcc_R	andncc 	%r16, %r17, %r13
	.word 0x92940011  ! 361: ORcc_R	orcc 	%r16, %r17, %r9
	.word 0x997c2401  ! 361: MOVR_I	move	%r16, 0xfffffff8, %r12
	.word 0xc36c2ce4  ! 361: PREFETCH_I	prefetch	[%r16 + 0x0ce4], #one_read
	.word 0x92a42507  ! 362: SUBcc_I	subcc 	%r16, 0x0507, %r9
	.word 0x8604237f  ! 364: ADD_I	add 	%r16, 0x037f, %r3
	.word 0x96c40011  ! 364: ADDCcc_R	addccc 	%r16, %r17, %r11
	.word 0xc3ec1011  ! 364: PREFETCHA_R	prefetcha	[%r16, %r17] 0x80, #one_read
	.word 0xf6740011  ! 365: STX_R	stx	%r27, [%r16 + %r17]
	.word 0xc36c0011  ! 367: PREFETCH_R	prefetch	[%r16 + %r17], #one_read
	.word 0xee340011  ! 368: STH_R	sth	%r23, [%r16 + %r17]
	.word 0xb4940011  ! 370: ORcc_R	orcc 	%r16, %r17, %r26
	.word 0xb0142adf  ! 370: OR_I	or 	%r16, 0x0adf, %r24
thr3_resum_intr_6:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_6), 16, 16)) -> intp(3, 3, 1)
	wr      %r0, 0x5, %asr26
	.word 0x88140011  ! 371: OR_R	or 	%r16, %r17, %r4
	.word 0xaa1c0011  ! 373: XOR_R	xor 	%r16, %r17, %r21
	.word 0xd48c1011  ! 373: LDUBA_R	lduba	[%r16, %r17] 0x80, %r10
	.word 0xce240011  ! 374: STW_R	stw	%r7, [%r16 + %r17]
	.word 0x8f643801  ! 376: MOVcc_I	<illegal instruction>
	.word 0xaaac2de2  ! 376: ANDNcc_I	andncc 	%r16, 0x0de2, %r21
	.word 0x8143e01d  ! 376: MEMBAR	membar	#LoadLoad | #LoadStore | #StoreStore | #Lookaside 
thr3_irf_ce_18:
!$EV error(3,expr(@VA(.MAIN.thr3_irf_ce_18), 16, 16),1,IRF,ce,18,x, x,x,x, x,x,x)
	.word 0xc62c2021  ! 379: STB_I	stb	%r3, [%r16 + 0x0021]
	.word 0x8143c000  ! 381: STBAR	stbar
	.word 0xda240011  ! 382: STW_R	stw	%r13, [%r16 + %r17]
	.word 0x892c3001  ! 384: SLLX_I	sllx	%r16, 0x0001, %r4
	.word 0xad3c1011  ! 384: SRAX_R	srax	%r16, %r17, %r22
	.word 0x93341011  ! 384: SRLX_R	srlx	%r16, %r17, %r9
	ta	T_CHANGE_PRIV	! macro
	.word 0xd8740011  ! 385: STX_R	stx	%r12, [%r16 + %r17]
	.word 0x869c281b  ! 387: XORcc_I	xorcc 	%r16, 0x081b, %r3
	.word 0x95341011  ! 387: SRLX_R	srlx	%r16, %r17, %r10
	.word 0x9c9c2c96  ! 387: XORcc_I	xorcc 	%r16, 0x0c96, %r14
	.word 0x81580000  ! 387: FLUSHW	flushw
	.word 0xde340011  ! 388: STH_R	sth	%r15, [%r16 + %r17]
	.word 0x9c3c0011  ! 390: XNOR_R	xnor 	%r16, %r17, %r14
	.word 0xd01c287e  ! 390: LDD_I	ldd	[%r16 + 0x087e], %r8
	.word 0xdc340011  ! 391: STH_R	sth	%r14, [%r16 + %r17]
	.word 0xd13c276f  ! 393: STDF_I	std	%f8, [0x076f, %r16]
	.word 0xc8742be3  ! 395: STX_I	stx	%r4, [%r16 + 0x0be3]
	.word 0xaab426c8  ! 397: ORNcc_I	orncc 	%r16, 0x06c8, %r21
	.word 0x89518000  ! 397: RDPR_PSTATE	rdpr	%pstate, %r4
	.word 0xd4740011  ! 398: STX_R	stx	%r10, [%r16 + %r17]
	.word 0x8a1c0011  ! 400: XOR_R	xor 	%r16, %r17, %r5
	.word 0x8414259e  ! 400: OR_I	or 	%r16, 0x059e, %r2
	.word 0x22800003  ! 400: BE	be,a	<label_0x3>
	.word 0xbf2c0011  ! 401: SLL_R	sll 	%r16, %r17, %r31
	.word 0xc3ec1011  ! 403: PREFETCHA_R	prefetcha	[%r16, %r17] 0x80, #one_read
thr3_irf_ce_19:
!$EV error(3,expr(@VA(.MAIN.thr3_irf_ce_19), 16, 16),1,IRF,ce,13,x, x,x,x, x,x,x)
	.word 0xd4342cc9  ! 406: STH_I	sth	%r10, [%r16 + 0x0cc9]
	.word 0x853c2001  ! 408: SRA_I	sra 	%r16, 0x0001, %r2
	.word 0x96442801  ! 408: ADDC_I	addc 	%r16, 0x0801, %r11
	.word 0xc80c2f96  ! 408: LDUB_I	ldub	[%r16 + 0x0f96], %r4
	.word 0xfc242cd7  ! 410: STW_I	stw	%r30, [%r16 + 0x0cd7]
	.word 0x8143c000  ! 412: STBAR	stbar
	.word 0x872c0011  ! 413: SLL_R	sll 	%r16, %r17, %r3
	.word 0x9e940011  ! 415: ORcc_R	orcc 	%r16, %r17, %r15
	.word 0xeefc1011  ! 415: SWAPA_R	swapa	%r23, [%r16 + %r17] 0x80
	.word 0xd6340011  ! 416: STH_R	sth	%r11, [%r16 + %r17]
	.word 0x941c2963  ! 418: XOR_I	xor 	%r16, 0x0963, %r10
	.word 0x952c0011  ! 418: SLL_R	sll 	%r16, %r17, %r10
	.word 0x81880000  ! 418: SAVED	saved
	.word 0x897c0411  ! 419: MOVR_R	move	%r16, %r17, %r4
	.word 0xaf343001  ! 421: SRLX_I	srlx	%r16, 0x0001, %r23
	.word 0x81580000  ! 421: FLUSHW	flushw
thr3_irf_ce_20:
!$EV error(3,expr(@VA(.MAIN.thr3_irf_ce_20), 16, 16),1,IRF,ce,24,x, x,x,x, x,x,x)
	.word 0xd4342907  ! 424: STH_I	sth	%r10, [%r16 + 0x0907]
	.word 0xabe40011  ! 426: SAVE_R	save	%r16, %r17, %r21
	.word 0xfe2c2c3d  ! 428: STB_I	stb	%r31, [%r16 + 0x0c3d]
	.word 0x87342001  ! 430: SRL_I	srl 	%r16, 0x0001, %r3
	.word 0x81dc2933  ! 430: FLUSH_I	dis not found

	.word 0xd6240011  ! 431: STW_R	stw	%r11, [%r16 + %r17]
	.word 0x820c27a4  ! 433: AND_I	and 	%r16, 0x07a4, %r1
	.word 0x912c1011  ! 433: SLLX_R	sllx	%r16, %r17, %r8
	.word 0x952c2001  ! 433: SLL_I	sll 	%r16, 0x0001, %r10
	.word 0x9d48c000  ! 433: RDHPR_HINTP	rdhpr	%hintp, %r14
	.word 0xd62c0011  ! 434: STB_R	stb	%r11, [%r16 + %r17]
	.word 0xa41c0011  ! 436: XOR_R	xor 	%r16, %r17, %r18
	.word 0x92840011  ! 436: ADDcc_R	addcc 	%r16, %r17, %r9
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xc8742a07  ! 438: STX_I	stx	%r4, [%r16 + 0x0a07]
	.word 0x8143c000  ! 440: STBAR	stbar
	.word 0xc824225f  ! 442: STW_I	stw	%r4, [%r16 + 0x025f]
	.word 0x928c0011  ! 444: ANDcc_R	andcc 	%r16, %r17, %r9
	.word 0xfa440011  ! 444: LDSW_R	ldsw	[%r16 + %r17], %r29
	.word 0xf6242c3f  ! 446: STW_I	stw	%r27, [%r16 + 0x0c3f]
	.word 0xa8c4207d  ! 448: ADDCcc_I	addccc 	%r16, 0x007d, %r20
	.word 0x908c0011  ! 448: ANDcc_R	andcc 	%r16, %r17, %r8
	.word 0xc3ec1011  ! 448: PREFETCHA_R	prefetcha	[%r16, %r17] 0x80, #one_read
	.word 0xf0342de3  ! 450: STH_I	sth	%r24, [%r16 + 0x0de3]
	.word 0x882c2591  ! 452: ANDN_I	andn 	%r16, 0x0591, %r4
	.word 0xb37c0411  ! 452: MOVR_R	move	%r16, %r17, %r25
        wr %g0, 0x4, %fprs
thr3_irf_ce_21:
!$EV error(3,expr(@VA(.MAIN.thr3_irf_ce_21), 16, 16),1,IRF,ce,8,x, x,x,x, x,x,x)
	.word 0xcc7428ed  ! 455: STX_I	stx	%r6, [%r16 + 0x08ed]
	.word 0x912c2001  ! 457: SLL_I	sll 	%r16, 0x0001, %r8
	.word 0xbe14216b  ! 457: OR_I	or 	%r16, 0x016b, %r31
	.word 0x949c2a6b  ! 457: XORcc_I	xorcc 	%r16, 0x0a6b, %r10
	.word 0xd4f41011  ! 457: STXA_R	stxa	%r10, [%r16 + %r17] 0x80
thr3_irf_ce_22:
!$EV error(3,expr(@VA(.MAIN.thr3_irf_ce_22), 16, 16),1,IRF,ce,18,x, x,x,x, x,x,x)
	.word 0xdc3425bf  ! 460: STH_I	sth	%r14, [%r16 + 0x05bf]
	.word 0xc69c2429  ! 462: LDDA_I	ldda	[%r16, + 0x0429] %asi, %r3
thr3_irf_ce_23:
!$EV error(3,expr(@VA(.MAIN.thr3_irf_ce_23), 16, 16),1,IRF,ce,15,x, x,x,x, x,x,x)
	.word 0xd82c277d  ! 465: STB_I	stb	%r12, [%r16 + 0x077d]
	.word 0xb49c0011  ! 467: XORcc_R	xorcc 	%r16, %r17, %r26
	.word 0x94142c7f  ! 467: OR_I	or 	%r16, 0x0c7f, %r10
	.word 0xf6440011  ! 467: LDSW_R	ldsw	[%r16 + %r17], %r27
thr3_irf_ce_24:
!$EV error(3,expr(@VA(.MAIN.thr3_irf_ce_24), 16, 16),1,IRF,ce,28,x, x,x,x, x,x,x)
	.word 0xe82c24ff  ! 470: STB_I	stb	%r20, [%r16 + 0x04ff]
	.word 0xa43c0011  ! 472: XNOR_R	xnor 	%r16, %r17, %r18
	.word 0x96bc0011  ! 472: XNORcc_R	xnorcc 	%r16, %r17, %r11
	.word 0x903c2679  ! 472: XNOR_I	xnor 	%r16, 0x0679, %r8
	.word 0x8143c000  ! 472: STBAR	stbar
	.word 0xce3422dd  ! 474: STH_I	sth	%r7, [%r16 + 0x02dd]
	.word 0x96b40011  ! 476: ORNcc_R	orncc 	%r16, %r17, %r11
	.word 0x9d534000  ! 476: RDPR_OTHERWIN	<illegal instruction>
thr3_irf_ce_25:
!$EV error(3,expr(@VA(.MAIN.thr3_irf_ce_25), 16, 16),1,IRF,ce,3,x, x,x,x, x,x,x)
	.word 0xe474238d  ! 479: STX_I	stx	%r18, [%r16 + 0x038d]
	ta	T_CHANGE_PRIV	! macro
	.word 0xf4340011  ! 482: STH_R	sth	%r26, [%r16 + %r17]
	.word 0xbedc2d0d  ! 484: SMULcc_I	smulcc 	%r16, 0x0d0d, %r31
	.word 0xb8242d5f  ! 485: SUB_I	sub 	%r16, 0x0d5f, %r28
	.word 0xa4c42201  ! 487: ADDCcc_I	addccc 	%r16, 0x0201, %r18
	.word 0x9da00171  ! 487: FABSq	dis not found

	.word 0xc22c2a73  ! 489: STB_I	stb	%r1, [%r16 + 0x0a73]
	.word 0x957c0411  ! 491: MOVR_R	move	%r16, %r17, %r10
	.word 0x880c273f  ! 491: AND_I	and 	%r16, 0x073f, %r4
	.word 0x99ec0011  ! 491: RESTORE_R	restore	%r16, %r17, %r12
thr3_irf_ce_26:
!$EV error(3,expr(@VA(.MAIN.thr3_irf_ce_26), 16, 16),1,IRF,ce,36,x, x,x,x, x,x,x)
	.word 0xf82429df  ! 494: STW_I	stw	%r28, [%r16 + 0x09df]
	.word 0x9014213a  ! 496: OR_I	or 	%r16, 0x013a, %r8
	.word 0x94ac2b85  ! 496: ANDNcc_I	andncc 	%r16, 0x0b85, %r10
	.word 0x81880000  ! 496: RESTORED	saved
	.word 0xc8742c0f  ! 498: STX_I	stx	%r4, [%r16 + 0x0c0f]
	.word 0x9c440011  ! 500: ADDC_R	addc 	%r16, %r17, %r14
	.word 0x8d2c3001  ! 500: SLLX_I	sllx	%r16, 0x0001, %r6
	.word 0xa53c1011  ! 500: SRAX_R	srax	%r16, %r17, %r18
thr3_resum_intr_7:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_7), 16, 16)) -> intp(3, 3, 1)
	wr      %r0, 0x5, %asr26
thr3_irf_ce_27:
!$EV error(3,expr(@VA(.MAIN.thr3_irf_ce_27), 16, 16),1,IRF,ce,63,x, x,x,x, x,x,x)
	.word 0xce242cd9  ! 503: STW_I	stw	%r7, [%r16 + 0x0cd9]
	.word 0xb23423e5  ! 505: ORN_I	orn 	%r16, 0x03e5, %r25
	.word 0x8ac42fc0  ! 505: ADDCcc_I	addccc 	%r16, 0x0fc0, %r5
	.word 0x8fa9c831  ! 505: FMOVVS	fmovs	%fcc1, %f17, %f7
	.word 0xa4440011  ! 506: ADDC_R	addc 	%r16, %r17, %r18
	.word 0x920c28a6  ! 508: AND_I	and 	%r16, 0x08a6, %r9
	.word 0xaa0c2472  ! 508: AND_I	and 	%r16, 0x0472, %r21
	.word 0xbebc24a4  ! 508: XNORcc_I	xnorcc 	%r16, 0x04a4, %r31
	.word 0xcc9c1011  ! 508: LDDA_R	ldda	[%r16, %r17] 0x80, %r6
	.word 0xaaac23c9  ! 509: ANDNcc_I	andncc 	%r16, 0x03c9, %r21
	.word 0x860c20ad  ! 511: AND_I	and 	%r16, 0x00ad, %r3
	.word 0x8f3c1011  ! 511: SRAX_R	srax	%r16, %r17, %r7
	.word 0x96bc0011  ! 511: XNORcc_R	xnorcc 	%r16, %r17, %r11
	.word 0xb7ec0011  ! 511: RESTORE_R	restore	%r16, %r17, %r27
	.word 0xe6342171  ! 513: STH_I	sth	%r19, [%r16 + 0x0171]
	.word 0x98c422c6  ! 515: ADDCcc_I	addccc 	%r16, 0x02c6, %r12
	.word 0x943c2c2c  ! 515: XNOR_I	xnor 	%r16, 0x0c2c, %r10
thr3_resum_intr_8:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_8), 16, 16)) -> intp(3, 3, 1)
	wr      %r0, 0x5, %asr26
thr3_irf_ce_28:
!$EV error(3,expr(@VA(.MAIN.thr3_irf_ce_28), 16, 16),1,IRF,ce,45,x, x,x,x, x,x,x)
	.word 0xca742dc1  ! 518: STX_I	stx	%r5, [%r16 + 0x0dc1]
	.word 0x95342001  ! 520: SRL_I	srl 	%r16, 0x0001, %r10
	.word 0x88c40011  ! 520: ADDCcc_R	addccc 	%r16, %r17, %r4
	.word 0x8143e022  ! 520: MEMBAR	membar	#StoreLoad | #MemIssue 
	.word 0xa5341011  ! 521: SRLX_R	srlx	%r16, %r17, %r18
	.word 0x9b3c2001  ! 523: SRA_I	sra 	%r16, 0x0001, %r13
	.word 0xb82c0011  ! 523: ANDN_R	andn 	%r16, %r17, %r28
thr3_resum_intr_9:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_9), 16, 16)) -> intp(3, 3, 1)
	wr      %r0, 0x5, %asr26
	.word 0xe4340011  ! 524: STH_R	sth	%r18, [%r16 + %r17]
	.word 0xbe142d05  ! 526: OR_I	or 	%r16, 0x0d05, %r31
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xd8340011  ! 527: STH_R	sth	%r12, [%r16 + %r17]
	.word 0x9cdc0011  ! 529: SMULcc_R	smulcc 	%r16, %r17, %r14
	.word 0xd0240011  ! 530: STW_R	stw	%r8, [%r16 + %r17]
	.word 0x9b528000  ! 532: RDPR_CANSAVE	<illegal instruction>
	.word 0xd62c0011  ! 533: STB_R	stb	%r11, [%r16 + %r17]
	.word 0x863c23d8  ! 535: XNOR_I	xnor 	%r16, 0x03d8, %r3
	.word 0x95641811  ! 535: MOVcc_R	<illegal instruction>
	.word 0xaef42d5b  ! 535: UDIVcc_I	udivcc 	%r16, 0x0d5b, %r23
	.word 0xfe2c268d  ! 537: STB_I	stb	%r31, [%r16 + 0x068d]
	.word 0xbb7c0411  ! 539: MOVR_R	move	%r16, %r17, %r29
	.word 0x848426fa  ! 539: ADDcc_I	addcc 	%r16, 0x06fa, %r2
	.word 0x92b42da4  ! 539: ORNcc_I	orncc 	%r16, 0x0da4, %r9
	.word 0x06cc0001  ! 539: BRLZ	brlz  ,pt	%16,<label_0xc0001>
thr3_irf_ce_29:
!$EV error(3,expr(@VA(.MAIN.thr3_irf_ce_29), 16, 16),1,IRF,ce,14,x, x,x,x, x,x,x)
	.word 0xce742ab1  ! 542: STX_I	stx	%r7, [%r16 + 0x0ab1]
	.word 0x0a800003  ! 544: BCS	bcs  	<label_0x3>
	.word 0x9e842fbc  ! 545: ADDcc_I	addcc 	%r16, 0x0fbc, %r15
	.word 0x9d2c3001  ! 547: SLLX_I	sllx	%r16, 0x0001, %r14
	.word 0x9a840011  ! 547: ADDcc_R	addcc 	%r16, %r17, %r13
	.word 0x93342001  ! 547: SRL_I	srl 	%r16, 0x0001, %r9
thr3_resum_intr_10:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_10), 16, 16)) -> intp(3, 3, 1)
	wr      %r0, 0x5, %asr26
	.word 0x8a440011  ! 548: ADDC_R	addc 	%r16, %r17, %r5
	.word 0x86140011  ! 550: OR_R	or 	%r16, %r17, %r3
	.word 0x8143c000  ! 550: STBAR	stbar
	.word 0xb8342192  ! 551: SUBC_I	orn 	%r16, 0x0192, %r28
	.word 0xa89c2a5b  ! 553: XORcc_I	xorcc 	%r16, 0x0a5b, %r20
	.word 0x922c2a0f  ! 553: ANDN_I	andn 	%r16, 0x0a0f, %r9
	.word 0x9ec40011  ! 553: ADDCcc_R	addccc 	%r16, %r17, %r15
	.word 0x81880000  ! 553: RESTORED	saved
thr3_irf_ce_30:
!$EV error(3,expr(@VA(.MAIN.thr3_irf_ce_30), 16, 16),1,IRF,ce,2,x, x,x,x, x,x,x)
	.word 0xd034216d  ! 556: STH_I	sth	%r8, [%r16 + 0x016d]
	.word 0x901c0011  ! 558: XOR_R	xor 	%r16, %r17, %r8
	.word 0x9f7c2401  ! 558: MOVR_I	move	%r16, 0xfffffff8, %r15
	.word 0x81dc2e05  ! 558: FLUSH_I	dis not found

	.word 0x92b42c62  ! 559: ORNcc_I	orncc 	%r16, 0x0c62, %r9
	.word 0x94fc219c  ! 561: SDIVcc_I	sdivcc 	%r16, 0x019c, %r10
	.word 0xd6242857  ! 563: STW_I	stw	%r11, [%r16 + 0x0857]
	.word 0x2ac40003  ! 565: BRNZ	brnz,a,nt	%16,<label_0x40003>
	.word 0xc6240011  ! 566: STW_R	stw	%r3, [%r16 + %r17]
	.word 0xac3c0011  ! 568: XNOR_R	xnor 	%r16, %r17, %r22
	.word 0x982c2a82  ! 568: ANDN_I	andn 	%r16, 0x0a82, %r12
	.word 0x9b7c2401  ! 568: MOVR_I	move	%r16, 0xfffffff8, %r13
	.word 0x85534000  ! 568: RDPR_OTHERWIN	rdpr	%otherwin, %r2
	.word 0xc6740011  ! 569: STX_R	stx	%r3, [%r16 + %r17]
	.word 0xca142bb9  ! 571: LDUH_I	lduh	[%r16 + 0x0bb9], %r5
thr3_irf_ce_31:
!$EV error(3,expr(@VA(.MAIN.thr3_irf_ce_31), 16, 16),1,IRF,ce,8,x, x,x,x, x,x,x)
	.word 0xd62c2a05  ! 574: STB_I	stb	%r11, [%r16 + 0x0a05]
	.word 0x82940011  ! 576: ORcc_R	orcc 	%r16, %r17, %r1
	.word 0x8e540011  ! 576: UMUL_R	umul 	%r16, %r17, %r7
	.word 0xe634215f  ! 578: STH_I	sth	%r19, [%r16 + 0x015f]
	.word 0x9c042adb  ! 580: ADD_I	add 	%r16, 0x0adb, %r14
	.word 0xd09c2385  ! 580: LDDA_I	ldda	[%r16, + 0x0385] %asi, %r8
	.word 0xc4240011  ! 581: STW_R	stw	%r2, [%r16 + %r17]
	.word 0x9abc0011  ! 583: XNORcc_R	xnorcc 	%r16, %r17, %r13
	.word 0xa4c40011  ! 583: ADDCcc_R	addccc 	%r16, %r17, %r18
	.word 0x852c0011  ! 583: SLL_R	sll 	%r16, %r17, %r2
thr3_resum_intr_11:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_11), 16, 16)) -> intp(3, 3, 1)
	wr      %r0, 0x5, %asr26
	.word 0xd02c0011  ! 584: STB_R	stb	%r8, [%r16 + %r17]
	.word 0xca7c2207  ! 586: SWAP_I	swap	%r5, [%r16 + 0x0207]
	.word 0xd8240011  ! 587: STW_R	stw	%r12, [%r16 + %r17]
	.word 0xac3423d8  ! 589: ORN_I	orn 	%r16, 0x03d8, %r22
	.word 0x9cac2cc5  ! 589: ANDNcc_I	andncc 	%r16, 0x0cc5, %r14
	.word 0x81dc0011  ! 589: FLUSH_R	dis not found

	.word 0xe47427d3  ! 591: STX_I	stx	%r18, [%r16 + 0x07d3]
	.word 0x38800001  ! 593: BGU	bgu,a	<label_0x1>
	.word 0xbc240011  ! 594: SUB_R	sub 	%r16, %r17, %r30
	.word 0x9c340011  ! 596: ORN_R	orn 	%r16, %r17, %r14
	.word 0x90942fe1  ! 596: ORcc_I	orcc 	%r16, 0x0fe1, %r8
	.word 0xf0b42b9a  ! 596: STHA_I	stha	%r24, [%r16 + 0x0b9a] %asi
	.word 0xc2740011  ! 597: STX_R	stx	%r1, [%r16 + %r17]
        wr %g0, 0x4, %fprs
	.word 0xe4342835  ! 601: STH_I	sth	%r18, [%r16 + 0x0835]
	.word 0x889c0011  ! 603: XORcc_R	xorcc 	%r16, %r17, %r4
	.word 0x82942d31  ! 603: ORcc_I	orcc 	%r16, 0x0d31, %r1
thr3_resum_intr_12:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_12), 16, 16)) -> intp(3, 3, 1)
	wr      %r0, 0x5, %asr26
	.word 0xf6240011  ! 604: STW_R	stw	%r27, [%r16 + %r17]
	.word 0xbfa40951  ! 606: FMULd	fmuld	%f16, %f48, %f62
	.word 0xad342001  ! 607: SRL_I	srl 	%r16, 0x0001, %r22
	.word 0xa61c0011  ! 609: XOR_R	xor 	%r16, %r17, %r19
	.word 0x852c0011  ! 609: SLL_R	sll 	%r16, %r17, %r2
	.word 0xa4b40011  ! 609: ORNcc_R	orncc 	%r16, %r17, %r18
thr3_resum_intr_13:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_13), 16, 16)) -> intp(3, 3, 1)
	wr      %r0, 0x5, %asr26
	.word 0xd2242bcd  ! 611: STW_I	stw	%r9, [%r16 + 0x0bcd]
	.word 0xa8bc0011  ! 613: XNORcc_R	xnorcc 	%r16, %r17, %r20
	.word 0x8c042e76  ! 613: ADD_I	add 	%r16, 0x0e76, %r6
	.word 0x92c42fa8  ! 613: ADDCcc_I	addccc 	%r16, 0x0fa8, %r9
	.word 0xc6fc1011  ! 613: SWAPA_R	swapa	%r3, [%r16 + %r17] 0x80
	.word 0xa6240011  ! 614: SUB_R	sub 	%r16, %r17, %r19
	.word 0x8a3c21fc  ! 616: XNOR_I	xnor 	%r16, 0x01fc, %r5
	.word 0xd8d42c1f  ! 616: LDSHA_I	ldsha	[%r16, + 0x0c1f] %asi, %r12
	.word 0xb37c2401  ! 617: MOVR_I	move	%r16, 0x7fffbdd8, %r25
	.word 0x8f343001  ! 619: SRLX_I	srlx	%r16, 0x0001, %r7
thr3_resum_intr_14:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_14), 16, 16)) -> intp(3, 3, 1)
	wr      %r0, 0x5, %asr26
thr3_irf_ce_32:
!$EV error(3,expr(@VA(.MAIN.thr3_irf_ce_32), 16, 16),1,IRF,ce,43,x, x,x,x, x,x,x)
	.word 0xe42c236d  ! 622: STB_I	stb	%r18, [%r16 + 0x036d]
	.word 0x84040011  ! 624: ADD_R	add 	%r16, %r17, %r2
	.word 0xb08427fe  ! 624: ADDcc_I	addcc 	%r16, 0x07fe, %r24
	.word 0x964c0011  ! 624: MULX_R	mulx 	%r16, %r17, %r11
	.word 0xc62c2e3d  ! 626: STB_I	stb	%r3, [%r16 + 0x0e3d]
	.word 0xb3a01051  ! 628: FdTOx	dis not found

	.word 0xa77c0411  ! 629: MOVR_R	move	%r16, %r17, %r19
	.word 0xb4ac0011  ! 631: ANDNcc_R	andncc 	%r16, %r17, %r26
	.word 0x9a140011  ! 631: OR_R	or 	%r16, %r17, %r13
	.word 0xa64429fb  ! 631: ADDC_I	addc 	%r16, 0x09fb, %r19
	.word 0x945c2e1a  ! 631: SMUL_I	smul 	%r16, 0x0e1a, %r10
	.word 0x8634287d  ! 632: ORN_I	orn 	%r16, 0x087d, %r3
	.word 0x8eac28d3  ! 634: ANDNcc_I	andncc 	%r16, 0x08d3, %r7
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xc2740011  ! 635: STX_R	stx	%r1, [%r16 + %r17]
	ta	T_CHANGE_PRIV	! macro
	.word 0xee742801  ! 639: STX_I	stx	%r23, [%r16 + 0x0801]
	.word 0xb43c0011  ! 641: XNOR_R	xnor 	%r16, %r17, %r26
	ta	T_CHANGE_NONPRIV	! macro
thr3_irf_ce_33:
!$EV error(3,expr(@VA(.MAIN.thr3_irf_ce_33), 16, 16),1,IRF,ce,46,x, x,x,x, x,x,x)
	.word 0xe82429bf  ! 644: STW_I	stw	%r20, [%r16 + 0x09bf]
	.word 0x883c2e9f  ! 646: XNOR_I	xnor 	%r16, 0x0e9f, %r4
	.word 0xa49c0011  ! 646: XORcc_R	xorcc 	%r16, %r17, %r18
	.word 0xaf2c1011  ! 646: SLLX_R	sllx	%r16, %r17, %r23
	.word 0x86dc245a  ! 646: SMULcc_I	smulcc 	%r16, 0x045a, %r3
	.word 0xa8040011  ! 647: ADD_R	add 	%r16, %r17, %r20
	.word 0x90b40011  ! 649: ORNcc_R	orncc 	%r16, %r17, %r8
	ta	T_CHANGE_PRIV	! macro
	.word 0x9b340011  ! 650: SRL_R	srl 	%r16, %r17, %r13
	.word 0x89341011  ! 652: SRLX_R	srlx	%r16, %r17, %r4
	.word 0xfcd42575  ! 652: LDSHA_I	ldsha	[%r16, + 0x0575] %asi, %r30
	.word 0xd27422c7  ! 654: STX_I	stx	%r9, [%r16 + 0x02c7]
	.word 0x85641811  ! 656: MOVcc_R	<illegal instruction>
	.word 0xaa8c2258  ! 656: ANDcc_I	andcc 	%r16, 0x0258, %r21
	.word 0xd8bc2806  ! 656: STDA_I	stda	%r12, [%r16 + 0x0806] %asi
	.word 0x9c2c2ec8  ! 657: ANDN_I	andn 	%r16, 0x0ec8, %r14
	.word 0xa83c22f9  ! 659: XNOR_I	xnor 	%r16, 0x02f9, %r20
	.word 0xa57c2401  ! 659: MOVR_I	move	%r16, 0xfffffff8, %r18
thr3_resum_intr_15:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_15), 16, 16)) -> intp(3, 3, 1)
	wr      %r0, 0x5, %asr26
	.word 0xca740011  ! 660: STX_R	stx	%r5, [%r16 + %r17]
	.word 0xd85424f1  ! 662: LDSH_I	ldsh	[%r16 + 0x04f1], %r12
	.word 0x9d7c2401  ! 663: MOVR_I	move	%r16, 0x7fffbdd8, %r14
	.word 0x8b342001  ! 665: SRL_I	srl 	%r16, 0x0001, %r5
	.word 0xa52c0011  ! 665: SLL_R	sll 	%r16, %r17, %r18
	.word 0x81580000  ! 665: FLUSHW	flushw
	.word 0xf82c0011  ! 666: STB_R	stb	%r28, [%r16 + %r17]
	.word 0xb33c0011  ! 668: SRA_R	sra 	%r16, %r17, %r25
thr3_resum_intr_16:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_16), 16, 16)) -> intp(3, 3, 1)
	wr      %r0, 0x5, %asr26
	.word 0xde340011  ! 669: STH_R	sth	%r15, [%r16 + %r17]
thr3_resum_intr_17:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_17), 16, 16)) -> intp(3, 3, 1)
	wr      %r0, 0x5, %asr26
thr3_irf_ce_34:
!$EV error(3,expr(@VA(.MAIN.thr3_irf_ce_34), 16, 16),1,IRF,ce,32,x, x,x,x, x,x,x)
	.word 0xc8742de1  ! 674: STX_I	stx	%r4, [%r16 + 0x0de1]
	.word 0x9e040011  ! 676: ADD_R	add 	%r16, %r17, %r15
	.word 0x83342001  ! 676: SRL_I	srl 	%r16, 0x0001, %r1
	.word 0xb48c0011  ! 676: ANDcc_R	andcc 	%r16, %r17, %r26
	.word 0xa5480000  ! 676: RDHPR_HPSTATE	rdhpr	%hpstate, %r18
	.word 0x9abc2fd6  ! 677: XNORcc_I	xnorcc 	%r16, 0x0fd6, %r13
	.word 0x86440011  ! 679: ADDC_R	addc 	%r16, %r17, %r3
	.word 0x8a9c0011  ! 679: XORcc_R	xorcc 	%r16, %r17, %r5
	.word 0x9a040011  ! 679: ADD_R	add 	%r16, %r17, %r13
	.word 0xc6f420cb  ! 679: STXA_I	stxa	%r3, [%r16 + 0x00cb] %asi
	.word 0xaf340011  ! 680: SRL_R	srl 	%r16, %r17, %r23
	.word 0x8cd40011  ! 682: UMULcc_R	umulcc 	%r16, %r17, %r6
	.word 0xd82421a9  ! 684: STW_I	stw	%r12, [%r16 + 0x01a9]
	.word 0x85641811  ! 686: MOVcc_R	<illegal instruction>
	.word 0xa6bc2c08  ! 686: XNORcc_I	xnorcc 	%r16, 0x0c08, %r19
	.word 0x9d52c000  ! 686: RDPR_CANRESTORE	rdpr	%canrestore, %r14
thr3_irf_ce_35:
!$EV error(3,expr(@VA(.MAIN.thr3_irf_ce_35), 16, 16),1,IRF,ce,51,x, x,x,x, x,x,x)
	.word 0xde7421a9  ! 689: STX_I	stx	%r15, [%r16 + 0x01a9]
	.word 0xb8ac0011  ! 691: ANDNcc_R	andncc 	%r16, %r17, %r28
	.word 0x8c8425bf  ! 691: ADDcc_I	addcc 	%r16, 0x05bf, %r6
	.word 0x87ec0011  ! 691: RESTORE_R	restore	%r16, %r17, %r3
thr3_irf_ce_36:
!$EV error(3,expr(@VA(.MAIN.thr3_irf_ce_36), 16, 16),1,IRF,ce,70,x, x,x,x, x,x,x)
	.word 0xec2c2765  ! 694: STB_I	stb	%r22, [%r16 + 0x0765]
	.word 0xcc7c2484  ! 696: SWAP_I	swap	%r6, [%r16 + 0x0484]
	.word 0xc8742e95  ! 698: STX_I	stx	%r4, [%r16 + 0x0e95]
	.word 0xd27c0011  ! 700: SWAP_R	swap	%r9, [%r16 + %r17]
	.word 0xd23429df  ! 702: STH_I	sth	%r9, [%r16 + 0x09df]
	.word 0x90440011  ! 704: ADDC_R	addc 	%r16, %r17, %r8
	.word 0x9cac0011  ! 704: ANDNcc_R	andncc 	%r16, %r17, %r14
	.word 0xb60c2fc9  ! 704: AND_I	and 	%r16, 0x0fc9, %r27
	.word 0x8ed40011  ! 704: UMULcc_R	umulcc 	%r16, %r17, %r7
	.word 0x8a3c0011  ! 705: XNOR_R	xnor 	%r16, %r17, %r5
	.word 0x922c0011  ! 707: ANDN_R	andn 	%r16, %r17, %r9
	.word 0xb12c3001  ! 707: SLLX_I	sllx	%r16, 0x0001, %r24
	.word 0x8a3c2ec5  ! 707: XNOR_I	xnor 	%r16, 0x0ec5, %r5
	.word 0x8143e04e  ! 707: MEMBAR	membar	#StoreLoad | #LoadStore | #StoreStore | #Sync 
thr3_irf_ce_37:
!$EV error(3,expr(@VA(.MAIN.thr3_irf_ce_37), 16, 16),1,IRF,ce,34,x, x,x,x, x,x,x)
	.word 0xde242163  ! 710: STW_I	stw	%r15, [%r16 + 0x0163]
	.word 0x81880000  ! 712: SAVED	saved
	.word 0x880c21c3  ! 713: AND_I	and 	%r16, 0x01c3, %r4
	.word 0x90bc0011  ! 715: XNORcc_R	xnorcc 	%r16, %r17, %r8
	.word 0xbc7c281e  ! 715: SDIV_I	sdiv 	%r16, 0x081e, %r30
thr3_irf_ce_38:
!$EV error(3,expr(@VA(.MAIN.thr3_irf_ce_38), 16, 16),1,IRF,ce,7,x, x,x,x, x,x,x)
	.word 0xd0342d1d  ! 718: STH_I	sth	%r8, [%r16 + 0x0d1d]
	.word 0x9b343001  ! 720: SRLX_I	srlx	%r16, 0x0001, %r13
	.word 0x8d2c3001  ! 720: SLLX_I	sllx	%r16, 0x0001, %r6
	.word 0x928c244d  ! 720: ANDcc_I	andcc 	%r16, 0x044d, %r9
	.word 0xd3e41011  ! 720: CASA_I	casa	[%r16] 0x80, %r17, %r9
thr3_irf_ce_39:
!$EV error(3,expr(@VA(.MAIN.thr3_irf_ce_39), 16, 16),1,IRF,ce,20,x, x,x,x, x,x,x)
	.word 0xd274297d  ! 723: STX_I	stx	%r9, [%r16 + 0x097d]
	.word 0x8a442bf6  ! 725: ADDC_I	addc 	%r16, 0x0bf6, %r5
	.word 0xac940011  ! 725: ORcc_R	orcc 	%r16, %r17, %r22
	.word 0xaf53c000  ! 725: RDPR_FQ	<illegal instruction>
	.word 0xa6042325  ! 726: ADD_I	add 	%r16, 0x0325, %r19
	.word 0xbebc24b4  ! 728: XNORcc_I	xnorcc 	%r16, 0x04b4, %r31
	.word 0x944c2f26  ! 728: MULX_I	mulx 	%r16, 0x0f26, %r10
	.word 0xf82427c1  ! 730: STW_I	stw	%r28, [%r16 + 0x07c1]
	.word 0x822c0011  ! 732: ANDN_R	andn 	%r16, %r17, %r1
	.word 0xf26c0011  ! 732: LDSTUB_R	ldstub	%r25, [%r16 + %r17]
	.word 0xcc7421b1  ! 734: STX_I	stx	%r6, [%r16 + 0x01b1]
	.word 0x872c3001  ! 736: SLLX_I	sllx	%r16, 0x0001, %r3
	.word 0x8b340011  ! 736: SRL_R	srl 	%r16, %r17, %r5
	.word 0xfa9420ea  ! 736: LDUHA_I	lduha	[%r16, + 0x00ea] %asi, %r29
	.word 0x98340011  ! 737: SUBC_R	orn 	%r16, %r17, %r12
	.word 0x98840011  ! 739: ADDcc_R	addcc 	%r16, %r17, %r12
	.word 0x9d3c0011  ! 739: SRA_R	sra 	%r16, %r17, %r14
	.word 0xcafc1011  ! 739: SWAPA_R	swapa	%r5, [%r16 + %r17] 0x80
	.word 0xe42c26c1  ! 741: STB_I	stb	%r18, [%r16 + 0x06c1]
	.word 0x8e4c0011  ! 743: MULX_R	mulx 	%r16, %r17, %r7
	.word 0xde240011  ! 744: STW_R	stw	%r15, [%r16 + %r17]
	.word 0x8b7c0411  ! 746: MOVR_R	move	%r16, %r17, %r5
	.word 0xdafc1011  ! 746: SWAPA_R	swapa	%r13, [%r16 + %r17] 0x80
	.word 0xaf340011  ! 747: SRL_R	srl 	%r16, %r17, %r23
	.word 0xbe942af4  ! 749: ORcc_I	orcc 	%r16, 0x0af4, %r31
	.word 0x8cac28be  ! 749: ANDNcc_I	andncc 	%r16, 0x08be, %r6
thr3_resum_intr_18:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_18), 16, 16)) -> intp(3, 3, 1)
	wr      %r0, 0x5, %asr26
	.word 0xd8242297  ! 751: STW_I	stw	%r12, [%r16 + 0x0297]
	.word 0x8a2c0011  ! 753: ANDN_R	andn 	%r16, %r17, %r5
	.word 0x97520000  ! 753: RDPR_PIL	rdpr	%pil, %r11
thr3_irf_ce_40:
!$EV error(3,expr(@VA(.MAIN.thr3_irf_ce_40), 16, 16),1,IRF,ce,62,x, x,x,x, x,x,x)
	.word 0xd8742529  ! 756: STX_I	stx	%r12, [%r16 + 0x0529]
	.word 0x9e840011  ! 758: ADDcc_R	addcc 	%r16, %r17, %r15
	.word 0x8c942320  ! 758: ORcc_I	orcc 	%r16, 0x0320, %r6
	.word 0x81dc2b6b  ! 758: FLUSH_I	dis not found

	.word 0xf42420d9  ! 760: STW_I	stw	%r26, [%r16 + 0x00d9]
	.word 0xb92c1011  ! 762: SLLX_R	sllx	%r16, %r17, %r28
	.word 0xb29c0011  ! 762: XORcc_R	xorcc 	%r16, %r17, %r25
	.word 0x9e942fa2  ! 762: ORcc_I	orcc 	%r16, 0x0fa2, %r15
	.word 0x9d418000  ! 762: RDFPRS	rd	%fprs, %r14
thr3_irf_ce_41:
!$EV error(3,expr(@VA(.MAIN.thr3_irf_ce_41), 16, 16),1,IRF,ce,67,x, x,x,x, x,x,x)
	.word 0xe62c2343  ! 765: STB_I	stb	%r19, [%r16 + 0x0343]
	.word 0x8143c000  ! 767: STBAR	stbar
	.word 0x87340011  ! 768: SRL_R	srl 	%r16, %r17, %r3
	.word 0xab2c0011  ! 770: SLL_R	sll 	%r16, %r17, %r21
	.word 0xc40c2e09  ! 770: LDUB_I	ldub	[%r16 + 0x0e09], %r2
	.word 0xc22c0011  ! 771: STB_R	stb	%r1, [%r16 + %r17]
	.word 0xa72c2001  ! 773: SLL_I	sll 	%r16, 0x0001, %r19
	.word 0x8b7c0411  ! 773: MOVR_R	move	%r16, %r17, %r5
	.word 0x04800001  ! 773: BLE	ble  	<label_0x1>
	.word 0xe62c0011  ! 774: STB_R	stb	%r19, [%r16 + %r17]
        wr %g0, 0x4, %fprs
	.word 0xc22429d1  ! 778: STW_I	stw	%r1, [%r16 + 0x09d1]
	.word 0x953c0011  ! 780: SRA_R	sra 	%r16, %r17, %r10
	.word 0xb6b42c50  ! 780: ORNcc_I	orncc 	%r16, 0x0c50, %r27
	.word 0x829c0011  ! 780: XORcc_R	xorcc 	%r16, %r17, %r1
	.word 0x8143c000  ! 780: STBAR	stbar
thr3_irf_ce_42:
!$EV error(3,expr(@VA(.MAIN.thr3_irf_ce_42), 16, 16),1,IRF,ce,3,x, x,x,x, x,x,x)
	.word 0xcc74252b  ! 783: STX_I	stx	%r6, [%r16 + 0x052b]
	.word 0xb0440011  ! 785: ADDC_R	addc 	%r16, %r17, %r24
	.word 0x81580000  ! 785: FLUSHW	flushw
	.word 0xcc240011  ! 786: STW_R	stw	%r6, [%r16 + %r17]
	.word 0x837c0411  ! 788: MOVR_R	move	%r16, %r17, %r1
	.word 0x8cbc0011  ! 788: XNORcc_R	xnorcc 	%r16, %r17, %r6
	.word 0x8b3c1011  ! 788: SRAX_R	srax	%r16, %r17, %r5
	.word 0x887c0011  ! 788: SDIV_R	sdiv 	%r16, %r17, %r4
	.word 0xbd2c1011  ! 789: SLLX_R	sllx	%r16, %r17, %r30
	.word 0x8ac40011  ! 791: ADDCcc_R	addccc 	%r16, %r17, %r5
	.word 0x93342001  ! 791: SRL_I	srl 	%r16, 0x0001, %r9
	.word 0x886c2320  ! 791: UDIVX_I	udivx 	%r16, 0x0320, %r4
thr3_irf_ce_43:
!$EV error(3,expr(@VA(.MAIN.thr3_irf_ce_43), 16, 16),1,IRF,ce,60,x, x,x,x, x,x,x)
	.word 0xce342b99  ! 794: STH_I	sth	%r7, [%r16 + 0x0b99]
	.word 0x86c40011  ! 796: ADDCcc_R	addccc 	%r16, %r17, %r3
	.word 0x81880000  ! 796: RESTORED	saved
	.word 0xde2c23db  ! 798: STB_I	stb	%r15, [%r16 + 0x03db]
	.word 0x92040011  ! 800: ADD_R	add 	%r16, %r17, %r9
	.word 0xa4842864  ! 800: ADDcc_I	addcc 	%r16, 0x0864, %r18
	.word 0xb2542b0c  ! 800: UMUL_I	umul 	%r16, 0x0b0c, %r25
	.word 0x98940011  ! 801: ORcc_R	orcc 	%r16, %r17, %r12
	.word 0x8f2c0011  ! 803: SLL_R	sll 	%r16, %r17, %r7
	.word 0xacbc0011  ! 803: XNORcc_R	xnorcc 	%r16, %r17, %r22
	.word 0xc3ec2e32  ! 803: PREFETCHA_I	prefetcha	[%r16, + 0x0e32] %asi, #one_read
	.word 0xbb340011  ! 804: SRL_R	srl 	%r16, %r17, %r29
	.word 0x91340011  ! 806: SRL_R	srl 	%r16, %r17, %r8
	.word 0xaf7c2401  ! 806: MOVR_I	move	%r16, 0xfffffff8, %r23
	.word 0x863c0011  ! 806: XNOR_R	xnor 	%r16, %r17, %r3
	.word 0x81880000  ! 806: RESTORED	saved
thr3_irf_ce_44:
!$EV error(3,expr(@VA(.MAIN.thr3_irf_ce_44), 16, 16),1,IRF,ce,20,x, x,x,x, x,x,x)
	.word 0xce342407  ! 809: STH_I	sth	%r7, [%r16 + 0x0407]
	.word 0x9f342001  ! 811: SRL_I	srl 	%r16, 0x0001, %r15
	.word 0xaa0c0011  ! 811: AND_R	and 	%r16, %r17, %r21
	.word 0x9e140011  ! 811: OR_R	or 	%r16, %r17, %r15
	.word 0x81580000  ! 811: FLUSHW	flushw
thr3_irf_ce_45:
!$EV error(3,expr(@VA(.MAIN.thr3_irf_ce_45), 16, 16),1,IRF,ce,13,x, x,x,x, x,x,x)
	.word 0xee342161  ! 814: STH_I	sth	%r23, [%r16 + 0x0161]
	.word 0xb92c2001  ! 816: SLL_I	sll 	%r16, 0x0001, %r28
	.word 0x8143c000  ! 816: STBAR	stbar
	.word 0xce2c0011  ! 817: STB_R	stb	%r7, [%r16 + %r17]
	.word 0x932c0011  ! 819: SLL_R	sll 	%r16, %r17, %r9
        wr %g0, 0x4, %fprs
	.word 0xc4240011  ! 820: STW_R	stw	%r2, [%r16 + %r17]
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x902c0011  ! 823: ANDN_R	andn 	%r16, %r17, %r8
	.word 0x85530000  ! 825: RDPR_CLEANWIN	rdpr	%cleanwin, %r2
	.word 0xf0340011  ! 826: STH_R	sth	%r24, [%r16 + %r17]
	.word 0x9b2c3001  ! 828: SLLX_I	sllx	%r16, 0x0001, %r13
	.word 0x9e040011  ! 828: ADD_R	add 	%r16, %r17, %r15
	.word 0xc36c2acd  ! 828: PREFETCH_I	prefetch	[%r16 + 0x0acd], #one_read
	.word 0xf4740011  ! 829: STX_R	stx	%r26, [%r16 + %r17]
	.word 0xa92c2001  ! 831: SLL_I	sll 	%r16, 0x0001, %r20
	.word 0x9a1c2c46  ! 831: XOR_I	xor 	%r16, 0x0c46, %r13
	.word 0x9a542b29  ! 831: UMUL_I	umul 	%r16, 0x0b29, %r13
thr3_irf_ce_46:
!$EV error(3,expr(@VA(.MAIN.thr3_irf_ce_46), 16, 16),1,IRF,ce,49,x, x,x,x, x,x,x)
	.word 0xc2242d97  ! 834: STW_I	stw	%r1, [%r16 + 0x0d97]
	.word 0xe6bc1011  ! 836: STDA_R	stda	%r19, [%r16 + %r17] 0x80
	.word 0xdc240011  ! 837: STW_R	stw	%r14, [%r16 + %r17]
	.word 0x93343001  ! 839: SRLX_I	srlx	%r16, 0x0001, %r9
	.word 0xb1342001  ! 839: SRL_I	srl 	%r16, 0x0001, %r24
	.word 0xd6140011  ! 839: LDUH_R	lduh	[%r16 + %r17], %r11
	.word 0xea2c2c93  ! 841: STB_I	stb	%r21, [%r16 + 0x0c93]
	.word 0xa9342001  ! 843: SRL_I	srl 	%r16, 0x0001, %r20
	.word 0x912c0011  ! 843: SLL_R	sll 	%r16, %r17, %r8
	.word 0x92840011  ! 843: ADDcc_R	addcc 	%r16, %r17, %r9
	.word 0xc36c2942  ! 843: PREFETCH_I	prefetch	[%r16 + 0x0942], #one_read
thr3_irf_ce_47:
!$EV error(3,expr(@VA(.MAIN.thr3_irf_ce_47), 16, 16),1,IRF,ce,71,x, x,x,x, x,x,x)
	.word 0xe6342069  ! 846: STH_I	sth	%r19, [%r16 + 0x0069]
	.word 0xbf3c0011  ! 848: SRA_R	sra 	%r16, %r17, %r31
	.word 0xae3c0011  ! 848: XNOR_R	xnor 	%r16, %r17, %r23
	.word 0x8c2c2194  ! 848: ANDN_I	andn 	%r16, 0x0194, %r6
	.word 0xa5534000  ! 848: RDPR_OTHERWIN	rdpr	%otherwin, %r18
	.word 0xbe240011  ! 849: SUB_R	sub 	%r16, %r17, %r31
	.word 0x901c0011  ! 851: XOR_R	xor 	%r16, %r17, %r8
	.word 0xbe0c0011  ! 851: AND_R	and 	%r16, %r17, %r31
	.word 0xc8bc1011  ! 851: STDA_R	stda	%r4, [%r16 + %r17] 0x80
	.word 0xb8340011  ! 852: ORN_R	orn 	%r16, %r17, %r28
	.word 0x81dc2042  ! 854: FLUSH_I	dis not found

	.word 0xce740011  ! 855: STX_R	stx	%r7, [%r16 + %r17]
	.word 0xbc1c0011  ! 857: XOR_R	xor 	%r16, %r17, %r30
	.word 0x9cbc28b9  ! 857: XNORcc_I	xnorcc 	%r16, 0x08b9, %r14
	.word 0xc36c0011  ! 857: PREFETCH_R	prefetch	[%r16 + %r17], #one_read
thr3_irf_ce_48:
!$EV error(3,expr(@VA(.MAIN.thr3_irf_ce_48), 16, 16),1,IRF,ce,61,x, x,x,x, x,x,x)
	.word 0xf22c2f7d  ! 860: STB_I	stb	%r25, [%r16 + 0x0f7d]
	.word 0xd8042c98  ! 862: LDUW_I	lduw	[%r16 + 0x0c98], %r12
thr3_irf_ce_49:
!$EV error(3,expr(@VA(.MAIN.thr3_irf_ce_49), 16, 16),1,IRF,ce,18,x, x,x,x, x,x,x)
	.word 0xee7423e5  ! 865: STX_I	stx	%r23, [%r16 + 0x03e5]
	.word 0x93341011  ! 867: SRLX_R	srlx	%r16, %r17, %r9
thr3_resum_intr_19:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_19), 16, 16)) -> intp(3, 3, 1)
	wr      %r0, 0x5, %asr26
	.word 0xde242db3  ! 869: STW_I	stw	%r15, [%r16 + 0x0db3]
	.word 0xbc440011  ! 871: ADDC_R	addc 	%r16, %r17, %r30
	.word 0x99342001  ! 871: SRL_I	srl 	%r16, 0x0001, %r12
	.word 0x8cb40011  ! 871: ORNcc_R	orncc 	%r16, %r17, %r6
	.word 0xfe1424df  ! 871: LDUH_I	lduh	[%r16 + 0x04df], %r31
	.word 0xc6742171  ! 873: STX_I	stx	%r3, [%r16 + 0x0171]
	.word 0x8143e014  ! 875: MEMBAR	membar	#LoadStore | #Lookaside 
	.word 0xc6242541  ! 877: STW_I	stw	%r3, [%r16 + 0x0541]
	.word 0x9e842ae4  ! 879: ADDcc_I	addcc 	%r16, 0x0ae4, %r15
	.word 0x8143c000  ! 879: STBAR	stbar
	.word 0xf62420b3  ! 881: STW_I	stw	%r27, [%r16 + 0x00b3]
	.word 0x848c0011  ! 883: ANDcc_R	andcc 	%r16, %r17, %r2
	.word 0xd2bc2eee  ! 883: STDA_I	stda	%r9, [%r16 + 0x0eee] %asi
	.word 0xbc3c2444  ! 884: XNOR_I	xnor 	%r16, 0x0444, %r30
	.word 0x9bec0011  ! 886: RESTORE_R	restore	%r16, %r17, %r13
	.word 0xda240011  ! 887: STW_R	stw	%r13, [%r16 + %r17]
	.word 0x87341011  ! 889: SRLX_R	srlx	%r16, %r17, %r3
	.word 0x8f2c3001  ! 889: SLLX_I	sllx	%r16, 0x0001, %r7
	.word 0x89343001  ! 889: SRLX_I	srlx	%r16, 0x0001, %r4
	.word 0xc3ec2825  ! 889: PREFETCHA_I	prefetcha	[%r16, + 0x0825] %asi, #one_read
	.word 0xfa340011  ! 890: STH_R	sth	%r29, [%r16 + %r17]
thr3_resum_intr_20:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_20), 16, 16)) -> intp(3, 3, 1)
	wr      %r0, 0x5, %asr26
	.word 0x857c2401  ! 893: MOVR_I	move	%r16, 0x7fffbdd8, %r2
	.word 0x992c2001  ! 895: SLL_I	sll 	%r16, 0x0001, %r12
	.word 0x9c6c21d1  ! 895: UDIVX_I	udivx 	%r16, 0x01d1, %r14
	.word 0xc8340011  ! 896: STH_R	sth	%r4, [%r16 + %r17]
	.word 0x92940011  ! 898: ORcc_R	orcc 	%r16, %r17, %r9
	.word 0x969c2bf6  ! 898: XORcc_I	xorcc 	%r16, 0x0bf6, %r11
	.word 0x93342001  ! 898: SRL_I	srl 	%r16, 0x0001, %r9
	ta	T_CHANGE_HPRIV	! macro
thr3_irf_ce_50:
!$EV error(3,expr(@VA(.MAIN.thr3_irf_ce_50), 16, 16),1,IRF,ce,47,x, x,x,x, x,x,x)
	.word 0xe43420b9  ! 901: STH_I	sth	%r18, [%r16 + 0x00b9]
	.word 0x932c2001  ! 903: SLL_I	sll 	%r16, 0x0001, %r9
	.word 0xb03c27c9  ! 903: XNOR_I	xnor 	%r16, 0x07c9, %r24
	.word 0xae0c0011  ! 903: AND_R	and 	%r16, %r17, %r23
	.word 0x81dc2707  ! 903: FLUSH_I	dis not found

	.word 0xc6740011  ! 904: STX_R	stx	%r3, [%r16 + %r17]
	.word 0x8c2c2082  ! 906: ANDN_I	andn 	%r16, 0x0082, %r6
thr3_resum_intr_21:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_21), 16, 16)) -> intp(3, 3, 1)
	wr      %r0, 0x5, %asr26
	.word 0xde2420bf  ! 908: STW_I	stw	%r15, [%r16 + 0x00bf]
	.word 0xba442ebf  ! 910: ADDC_I	addc 	%r16, 0x0ebf, %r29
	.word 0xac940011  ! 910: ORcc_R	orcc 	%r16, %r17, %r22
	.word 0x9e0428e7  ! 910: ADD_I	add 	%r16, 0x08e7, %r15
	ta	T_CHANGE_HPRIV	! macro
	.word 0xca2c0011  ! 911: STB_R	stb	%r5, [%r16 + %r17]
	.word 0x9d2c1011  ! 913: SLLX_R	sllx	%r16, %r17, %r14
	.word 0x8e040011  ! 913: ADD_R	add 	%r16, %r17, %r7
	.word 0x873c0011  ! 913: SRA_R	sra 	%r16, %r17, %r3
	.word 0xd2a41011  ! 913: STWA_R	stwa	%r9, [%r16 + %r17] 0x80
	.word 0x9e340011  ! 914: ORN_R	orn 	%r16, %r17, %r15
	.word 0x952c1011  ! 916: SLLX_R	sllx	%r16, %r17, %r10
	.word 0x81580000  ! 916: FLUSHW	flushw
	.word 0x9e1c0011  ! 917: XOR_R	xor 	%r16, %r17, %r15
	.word 0x8d840011  ! 919: WRFPRS_R	wr	%r16, %r17, %fprs
	.word 0xfa242a7d  ! 921: STW_I	stw	%r29, [%r16 + 0x0a7d]
	.word 0xb43c226c  ! 923: XNOR_I	xnor 	%r16, 0x026c, %r26
	.word 0x86840011  ! 923: ADDcc_R	addcc 	%r16, %r17, %r3
	.word 0x857c2401  ! 923: MOVR_I	move	%r16, 0xfffffff8, %r2
	.word 0x8143e042  ! 923: MEMBAR	membar	#StoreLoad | #Sync 
	.word 0xfe2c273d  ! 925: STB_I	stb	%r31, [%r16 + 0x073d]
	.word 0xa49c0011  ! 927: XORcc_R	xorcc 	%r16, %r17, %r18
	.word 0x981c0011  ! 927: XOR_R	xor 	%r16, %r17, %r12
        wr %g0, 0x4, %fprs
	.word 0xca240011  ! 928: STW_R	stw	%r5, [%r16 + %r17]
	.word 0x81dc2189  ! 930: FLUSH_I	dis not found

thr3_irf_ce_51:
!$EV error(3,expr(@VA(.MAIN.thr3_irf_ce_51), 16, 16),1,IRF,ce,66,x, x,x,x, x,x,x)
	.word 0xd82c2319  ! 933: STB_I	stb	%r12, [%r16 + 0x0319]
	.word 0x81580000  ! 935: FLUSHW	flushw
	.word 0xd8342d41  ! 937: STH_I	sth	%r12, [%r16 + 0x0d41]
	.word 0xa7240011  ! 939: MULScc_R	mulscc 	%r16, %r17, %r19
	.word 0xda2c21c9  ! 941: STB_I	stb	%r13, [%r16 + 0x01c9]
	.word 0xb49c2d54  ! 943: XORcc_I	xorcc 	%r16, 0x0d54, %r26
	.word 0x842c0011  ! 943: ANDN_R	andn 	%r16, %r17, %r2
	.word 0x97340011  ! 943: SRL_R	srl 	%r16, %r17, %r11
	.word 0xd2ec25a0  ! 943: LDSTUBA_I	ldstuba	%r9, [%r16 + 0x05a0] %asi
thr3_irf_ce_52:
!$EV error(3,expr(@VA(.MAIN.thr3_irf_ce_52), 16, 16),1,IRF,ce,37,x, x,x,x, x,x,x)
	.word 0xd8242e93  ! 946: STW_I	stw	%r12, [%r16 + 0x0e93]
	.word 0xea7c2454  ! 948: SWAP_I	swap	%r21, [%r16 + 0x0454]
	.word 0x9b343001  ! 949: SRLX_I	srlx	%r16, 0x0001, %r13
	.word 0xbb2c0011  ! 951: SLL_R	sll 	%r16, %r17, %r29
	.word 0x8ab40011  ! 951: ORNcc_R	orncc 	%r16, %r17, %r5
	.word 0xd6bc1011  ! 951: STDA_R	stda	%r11, [%r16 + %r17] 0x80
thr3_irf_ce_53:
!$EV error(3,expr(@VA(.MAIN.thr3_irf_ce_53), 16, 16),1,IRF,ce,44,x, x,x,x, x,x,x)
	.word 0xf07423f1  ! 954: STX_I	stx	%r24, [%r16 + 0x03f1]
	.word 0xc36c2f76  ! 956: PREFETCH_I	prefetch	[%r16 + 0x0f76], #one_read
	.word 0xce2c0011  ! 957: STB_R	stb	%r7, [%r16 + %r17]
	.word 0x94140011  ! 959: OR_R	or 	%r16, %r17, %r10
	.word 0xb4342c62  ! 959: ORN_I	orn 	%r16, 0x0c62, %r26
	.word 0x8143c000  ! 959: STBAR	stbar
	.word 0xd82c0011  ! 960: STB_R	stb	%r12, [%r16 + %r17]
	.word 0x98842380  ! 962: ADDcc_I	addcc 	%r16, 0x0380, %r12
	ta	T_CHANGE_NONHPRIV	! macro
thr3_irf_ce_54:
!$EV error(3,expr(@VA(.MAIN.thr3_irf_ce_54), 16, 16),1,IRF,ce,39,x, x,x,x, x,x,x)
	.word 0xd62c2d8d  ! 965: STB_I	stb	%r11, [%r16 + 0x0d8d]
	.word 0x81880000  ! 967: SAVED	saved
thr3_irf_ce_55:
!$EV error(3,expr(@VA(.MAIN.thr3_irf_ce_55), 16, 16),1,IRF,ce,29,x, x,x,x, x,x,x)
	.word 0xd6342a13  ! 970: STH_I	sth	%r11, [%r16 + 0x0a13]
	.word 0x8f343001  ! 972: SRLX_I	srlx	%r16, 0x0001, %r7
	.word 0x98ac0011  ! 972: ANDNcc_R	andncc 	%r16, %r17, %r12
	.word 0xa57c0411  ! 972: MOVR_R	move	%r16, %r17, %r18
        wr %g0, 0x4, %fprs
thr3_irf_ce_56:
!$EV error(3,expr(@VA(.MAIN.thr3_irf_ce_56), 16, 16),1,IRF,ce,4,x, x,x,x, x,x,x)
	.word 0xe6242405  ! 975: STW_I	stw	%r19, [%r16 + 0x0405]
	.word 0x820c2cad  ! 977: AND_I	and 	%r16, 0x0cad, %r1
	.word 0xbd2c0011  ! 977: SLL_R	sll 	%r16, %r17, %r30
	.word 0x9e940011  ! 977: ORcc_R	orcc 	%r16, %r17, %r15
	.word 0xfc142203  ! 977: LDUH_I	lduh	[%r16 + 0x0203], %r30
	.word 0xec2c0011  ! 978: STB_R	stb	%r22, [%r16 + %r17]
	.word 0x8143c000  ! 980: STBAR	stbar
	.word 0xd4742d5b  ! 982: STX_I	stx	%r10, [%r16 + 0x0d5b]
	.word 0xbeb42062  ! 984: ORNcc_I	orncc 	%r16, 0x0062, %r31
	.word 0x94040011  ! 984: ADD_R	add 	%r16, %r17, %r10
	.word 0xc45c0011  ! 984: LDX_R	ldx	[%r16 + %r17], %r2
	.word 0xdc340011  ! 985: STH_R	sth	%r14, [%r16 + %r17]
	.word 0x857c0411  ! 987: MOVR_R	move	%r16, %r17, %r2
	.word 0x08800003  ! 987: BLEU	bleu  	<label_0x3>
	.word 0xf0342d51  ! 989: STH_I	sth	%r24, [%r16 + 0x0d51]
	.word 0x9c9c2412  ! 991: XORcc_I	xorcc 	%r16, 0x0412, %r14
	.word 0x90940011  ! 991: ORcc_R	orcc 	%r16, %r17, %r8
	.word 0x90942d19  ! 991: ORcc_I	orcc 	%r16, 0x0d19, %r8
	.word 0x8d840011  ! 991: WRFPRS_R	wr	%r16, %r17, %fprs
thr3_irf_ce_57:
!$EV error(3,expr(@VA(.MAIN.thr3_irf_ce_57), 16, 16),1,IRF,ce,54,x, x,x,x, x,x,x)
	.word 0xc42c2d33  ! 994: STB_I	stb	%r2, [%r16 + 0x0d33]
	.word 0x98140011  ! 996: OR_R	or 	%r16, %r17, %r12
	.word 0x81880000  ! 996: RESTORED	saved
	.word 0xc674283b  ! 998: STX_I	stx	%r3, [%r16 + 0x083b]
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
        setx  0x0000000000000930, %g1, %r17
        setx  0x00a7ad01a0d24e89, %g1, %r0
        setx  0xe23e1c63f9172e11, %g1, %r1
        setx  0x2d36d79213d033e2, %g1, %r2
        setx  0xa5f1f98184a51e25, %g1, %r3
        setx  0x9986d46553d1f831, %g1, %r4
        setx  0xf4fb482a56792101, %g1, %r5
        setx  0x06eea4855f22f493, %g1, %r6
        setx  0xb218efacb4f52187, %g1, %r7
        setx  0x851ffd8a6499d255, %g1, %r8
        setx  0xf2b7c862bd35b483, %g1, %r9
        setx  0x28a1258e2fa04dcb, %g1, %r10
        setx  0x1cab626e1ca47bc1, %g1, %r11
        setx  0x76a776e242dad8ce, %g1, %r12
        setx  0xc342b4b54979c9e0, %g1, %r13
        setx  0x9c31baae5f1a2ffd, %g1, %r14
        setx  0x36206af7dc5ad5c8, %g1, %r15
        setx  0x124503d638acc295, %g1, %r18
        setx  0x48b4666817c78fc9, %g1, %r19
        setx  0xc1a3c699b909a9ce, %g1, %r20
        setx  0xb754bc8a10623dbe, %g1, %r21
        setx  0x8d3fb54c899475b6, %g1, %r22
        setx  0xd24ff419315c2068, %g1, %r23
        setx  0xae2c775caf7c741d, %g1, %r24
        setx  0x3c5c1227b109acd1, %g1, %r25
        setx  0xe7f6321f9e73ac50, %g1, %r26
        setx  0x330f798d044a95b0, %g1, %r27
        setx  0x9955291590fc388b, %g1, %r28
        setx  0x9c498e60b6cfb062, %g1, %r29
        setx  0x6f642f38c3269f22, %g1, %r30
        setx  0x742bf162d9f90f7a, %g1, %r31
	save %r0, %r0, %r31
        setx  MAIN_BASE_DATA_VA, %r1, %r16
        setx  0x0000000000000ff0, %g1, %r17
        setx  0xba0b852a57b4d7cf, %g1, %r0
        setx  0x44ff958aff26170b, %g1, %r1
        setx  0x9681f6bc8965159f, %g1, %r2
        setx  0x53c3da40e7bab0bb, %g1, %r3
        setx  0x3beaf356488dd516, %g1, %r4
        setx  0x22ef3f651040050c, %g1, %r5
        setx  0x974d26a6500a9cb4, %g1, %r6
        setx  0x3399a676754c2861, %g1, %r7
        setx  0x7fc74d8756613ed2, %g1, %r8
        setx  0xbcee1a276855d87a, %g1, %r9
        setx  0x580c79265dae4cf1, %g1, %r10
        setx  0x032761ebad6d4149, %g1, %r11
        setx  0x536a7953bc7ac241, %g1, %r12
        setx  0x603a2c7da23688b9, %g1, %r13
        setx  0xf517b46d21756f8a, %g1, %r14
        setx  0x88db2971656278a9, %g1, %r15
        setx  0x486b9af9e6b94014, %g1, %r18
        setx  0xfbaebfef077d7572, %g1, %r19
        setx  0xc5cadd70c2dbf853, %g1, %r20
        setx  0x525850e8e947b3e2, %g1, %r21
        setx  0xc9447f759a89b4ff, %g1, %r22
        setx  0xeb3feb28871a68fe, %g1, %r23
        setx  0x857e50f46996652b, %g1, %r24
        setx  0xbe5ca9e13fc55c65, %g1, %r25
        setx  0x1da2004fecb56bf7, %g1, %r26
        setx  0xf262d03fea896333, %g1, %r27
        setx  0x680562b45acc4bc2, %g1, %r28
        setx  0x9efeedf0eb36d548, %g1, %r29
        setx  0x21cd0d707c33df84, %g1, %r30
        setx  0x2b28cbc6562f0759, %g1, %r31
	save %r0, %r0, %r31
        setx  MAIN_BASE_DATA_VA, %r1, %r16
        setx  0x0000000000000460, %g1, %r17
        setx  0x989bc0df1b24ce6e, %g1, %r0
        setx  0x36edc701597194aa, %g1, %r1
        setx  0x50f65ce843fa905b, %g1, %r2
        setx  0xd5a58b62cdaa21f1, %g1, %r3
        setx  0x4b801bf6f631c892, %g1, %r4
        setx  0x469af1503311fb98, %g1, %r5
        setx  0x2c08a5fb9cc54600, %g1, %r6
        setx  0xdfcc6f3c93212d73, %g1, %r7
        setx  0x24f8d59e8d2ee55c, %g1, %r8
        setx  0x8a79da552c6fb7ee, %g1, %r9
        setx  0xc3b83f29a7d5686a, %g1, %r10
        setx  0xc193c6319e22c601, %g1, %r11
        setx  0x8b8cafd30229b45d, %g1, %r12
        setx  0xf8a65780bf3a26a3, %g1, %r13
        setx  0xcb252d0550c43998, %g1, %r14
        setx  0x6b86e921a3abb9ff, %g1, %r15
        setx  0xa1a872d0822194ba, %g1, %r18
        setx  0x6acef974614fca74, %g1, %r19
        setx  0x4ffaedb64b72b611, %g1, %r20
        setx  0x9cd6ec06a8bf3e81, %g1, %r21
        setx  0x31898c08387f738c, %g1, %r22
        setx  0x5b506766a1b567eb, %g1, %r23
        setx  0xbce72f1b0332f239, %g1, %r24
        setx  0xd18aeced98873093, %g1, %r25
        setx  0x92f013dd32b162fa, %g1, %r26
        setx  0x4454098c2c86ebcd, %g1, %r27
        setx  0xc7f54168940dc9ff, %g1, %r28
        setx  0x679bd047660533d2, %g1, %r29
        setx  0x1722baf7d2ad1e27, %g1, %r30
        setx  0xf67c73a33b53c85a, %g1, %r31
	save %r0, %r0, %r31
        setx  MAIN_BASE_DATA_VA, %r1, %r16
        setx  0x00000000000004c0, %g1, %r17
        setx  0x4eca50d7c7cfa334, %g1, %r0
        setx  0x0807337f93b44c39, %g1, %r1
        setx  0x33602d490b3d9442, %g1, %r2
        setx  0x659830fccdfa05d7, %g1, %r3
        setx  0xb7424c498265e6b4, %g1, %r4
        setx  0x3e7816a1af9abb75, %g1, %r5
        setx  0x3a0b98f8ce8ddd75, %g1, %r6
        setx  0x3496b1e455d2d619, %g1, %r7
        setx  0xe3177b41325474c6, %g1, %r8
        setx  0xc70db4ef99eb22da, %g1, %r9
        setx  0x0cf4471fb6853112, %g1, %r10
        setx  0x84e7d9bb027ddd68, %g1, %r11
        setx  0xa0f202c55677d0db, %g1, %r12
        setx  0x15e5ad0347ea9b57, %g1, %r13
        setx  0xa7ee0ddd5bf11617, %g1, %r14
        setx  0xfa27403ed76459f5, %g1, %r15
        setx  0xc7268f6fa4651ada, %g1, %r18
        setx  0x9a13587a66023319, %g1, %r19
        setx  0xfc747338a3ed6923, %g1, %r20
        setx  0x5cc751e65f435a09, %g1, %r21
        setx  0x2318e60f08d5abea, %g1, %r22
        setx  0xd70866cc1784fe4b, %g1, %r23
        setx  0xcbbaf28332a6c031, %g1, %r24
        setx  0x59a6aafe0b796059, %g1, %r25
        setx  0x38312d30cc10aae4, %g1, %r26
        setx  0x46e936862c2a8df2, %g1, %r27
        setx  0xc012e2487c0449db, %g1, %r28
        setx  0xf1c792ed40e32907, %g1, %r29
        setx  0xb5007917c3e4dfa0, %g1, %r30
        setx  0x9bff314712b8876f, %g1, %r31
	save %r0, %r0, %r31
        setx  MAIN_BASE_DATA_VA, %r1, %r16
        setx  0x0000000000000be0, %g1, %r17
        setx  0xbfe3e6b7d6749e84, %g1, %r0
        setx  0xba1554bb28a1c195, %g1, %r1
        setx  0x26b9c89291b22d98, %g1, %r2
        setx  0xa527f531d09b4ba5, %g1, %r3
        setx  0x342c97a550dc1227, %g1, %r4
        setx  0xe2e0fb5fa5c23247, %g1, %r5
        setx  0x516da9f16e97f90f, %g1, %r6
        setx  0xa7758af914d15c14, %g1, %r7
        setx  0x6d898a6c000c93de, %g1, %r8
        setx  0x51b1b9b5e637bd71, %g1, %r9
        setx  0xa92f6476cc42c883, %g1, %r10
        setx  0x46b28e31288deb20, %g1, %r11
        setx  0xbd337918ab3b6532, %g1, %r12
        setx  0x9df4f399f2d80082, %g1, %r13
        setx  0x117897c135914379, %g1, %r14
        setx  0x1092b2d4c12b7c71, %g1, %r15
        setx  0xed9a64012fd84672, %g1, %r18
        setx  0xabaa3e71fc5db088, %g1, %r19
        setx  0x43f1418d2c8f0eb6, %g1, %r20
        setx  0xeadd1bb11f40a006, %g1, %r21
        setx  0xb32c1cd240c23344, %g1, %r22
        setx  0x0b30e08f85a9b806, %g1, %r23
        setx  0xf49c6505f38f3ed0, %g1, %r24
        setx  0x460dd0b0898feb0b, %g1, %r25
        setx  0x3b2a098623331f5f, %g1, %r26
        setx  0xc4b5b6b3f0974aa2, %g1, %r27
        setx  0x8e835452d0ae7b2a, %g1, %r28
        setx  0x7ad1268d4adae9f3, %g1, %r29
        setx  0xb1aff835b505051f, %g1, %r30
        setx  0x9ba1108a8c16a496, %g1, %r31
	save %r0, %r0, %r31
        setx  MAIN_BASE_DATA_VA, %r1, %r16
        setx  0x0000000000000c40, %g1, %r17
        setx  0x14f52bb731dcaf06, %g1, %r0
        setx  0x0f969de8bf7b6992, %g1, %r1
        setx  0x6cc350b54cb0e907, %g1, %r2
        setx  0x9ff0c0ca67234249, %g1, %r3
        setx  0x48137c0c9414de02, %g1, %r4
        setx  0xeff37bed81fda0b5, %g1, %r5
        setx  0xa5232019f36580e8, %g1, %r6
        setx  0x6d65ac699b90328f, %g1, %r7
        setx  0x664cd5506e238803, %g1, %r8
        setx  0x695cdd25d32daa59, %g1, %r9
        setx  0xc1078224d7eb1d20, %g1, %r10
        setx  0xb041582774171290, %g1, %r11
        setx  0x58b70770c34c3846, %g1, %r12
        setx  0x375b7df0517a52a2, %g1, %r13
        setx  0x2a2ec545ed0d170e, %g1, %r14
        setx  0x7b6e291a662f942b, %g1, %r15
        setx  0xcfc072ff301f65be, %g1, %r18
        setx  0x98883b0dc41580c5, %g1, %r19
        setx  0xdb69e60d2b25ca72, %g1, %r20
        setx  0xa779b373a8849dd2, %g1, %r21
        setx  0x7a85f7c65a303f9b, %g1, %r22
        setx  0x4496c0afe98c39c3, %g1, %r23
        setx  0xeccf4e2f4d365848, %g1, %r24
        setx  0x9589ec0a7630e1e3, %g1, %r25
        setx  0xd5fc4dc54da5c333, %g1, %r26
        setx  0x1193d604d7815b2d, %g1, %r27
        setx  0x5888dd09cb4a094c, %g1, %r28
        setx  0xa3787009c661bdfa, %g1, %r29
        setx  0xcf5995a7ad6ce650, %g1, %r30
        setx  0x923712665a4d0b2c, %g1, %r31
	save %r0, %r0, %r31
        setx  MAIN_BASE_DATA_VA, %r1, %r16
        setx  0x0000000000000af0, %g1, %r17
        setx  0x7854e89c9a1c4236, %g1, %r0
        setx  0xab7b6ec90b0f32b8, %g1, %r1
        setx  0xc963b3c94e453f3f, %g1, %r2
        setx  0xce6d3a26fd502199, %g1, %r3
        setx  0x0d4b6e5dc93423e6, %g1, %r4
        setx  0x2a1d3f435ef0a978, %g1, %r5
        setx  0x8675231ac001ece6, %g1, %r6
        setx  0x6c924f3a6d984b6e, %g1, %r7
        setx  0xdac4586a32c0dc2a, %g1, %r8
        setx  0x06a3e5863e705cf8, %g1, %r9
        setx  0xc75a81c3dc9a8cb8, %g1, %r10
        setx  0xdccb154d9531a5b4, %g1, %r11
        setx  0xecd2291c958e4128, %g1, %r12
        setx  0xe371239a0f3bb8fa, %g1, %r13
        setx  0xda3201b02dc96b98, %g1, %r14
        setx  0x0ef433969182a98b, %g1, %r15
        setx  0x72bd591d73fb9e44, %g1, %r18
        setx  0xf764b4ee8a7f7217, %g1, %r19
        setx  0xe7b4279d80969b72, %g1, %r20
        setx  0x98fa8424896565c9, %g1, %r21
        setx  0x51cd37cc719511a9, %g1, %r22
        setx  0x1cb2d9575fcee0b7, %g1, %r23
        setx  0x1bc93f4c0bda86eb, %g1, %r24
        setx  0xf5613e2d0bb94478, %g1, %r25
        setx  0xf015d735ae21f4fc, %g1, %r26
        setx  0x9bcce060db356769, %g1, %r27
        setx  0x492da9cfd4cc10b3, %g1, %r28
        setx  0xd4a60265ad93c3b5, %g1, %r29
        setx  0x082c7f6b39460723, %g1, %r30
        setx  0x9cc65a952dc6e97b, %g1, %r31
	save %r0, %r0, %r31
        setx  MAIN_BASE_DATA_VA, %r1, %r16
        setx  0x0000000000000290, %g1, %r17
        setx  0x6f509182217794dc, %g1, %r0
        setx  0x742254384ce28766, %g1, %r1
        setx  0x3f5272f0e71712da, %g1, %r2
        setx  0x2f0a400e65e4c253, %g1, %r3
        setx  0x6df7b45625fecdb8, %g1, %r4
        setx  0xecf2eb32b37dce14, %g1, %r5
        setx  0x49a31f5a8b362448, %g1, %r6
        setx  0xe4d48aee5b5efaaf, %g1, %r7
        setx  0xe86fe74fa463fd55, %g1, %r8
        setx  0x82aecff212b896db, %g1, %r9
        setx  0xc80e43455579779e, %g1, %r10
        setx  0x8e5e601de4841244, %g1, %r11
        setx  0x9139238a846bb03b, %g1, %r12
        setx  0xc49ab3039de7c370, %g1, %r13
        setx  0xfaee0f34dcc60207, %g1, %r14
        setx  0xbf5a0bed25c6d25f, %g1, %r15
        setx  0x8aa65e1b0699bd71, %g1, %r18
        setx  0x97fcc38185ac8a79, %g1, %r19
        setx  0xeb8c1b2038a0b9b4, %g1, %r20
        setx  0xb6274258bea74cb5, %g1, %r21
        setx  0xeba98d81cfa7f979, %g1, %r22
        setx  0x16f3a42536beab7a, %g1, %r23
        setx  0x517cefbe8e0fb2c4, %g1, %r24
        setx  0x65deb00cf0f77822, %g1, %r25
        setx  0xf4baba77c052a844, %g1, %r26
        setx  0x1b83e684f21dc16c, %g1, %r27
        setx  0x2c1b0aea126688c7, %g1, %r28
        setx  0x6af0d1ba75812261, %g1, %r29
        setx  0xf8592d402ea3248f, %g1, %r30
        setx  0x88d2e5c2edd397c0, %g1, %r31
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
	.word 0x8b2c1011  ! 0: SLLX_R	sllx	%r16, %r17, %r5
	.word 0x96b40011  ! 2: ORNcc_R	orncc 	%r16, %r17, %r11
	.word 0x97414000  ! 2: RDPC	rd	%pc, %r11
	.word 0xc4740011  ! 3: STX_R	stx	%r2, [%r16 + %r17]
	.word 0x8d840011  ! 5: WRFPRS_R	wr	%r16, %r17, %fprs
	.word 0xfa740011  ! 6: STX_R	stx	%r29, [%r16 + %r17]
	.word 0xb61c26be  ! 8: XOR_I	xor 	%r16, 0x06be, %r27
	.word 0xd7e41011  ! 8: CASA_I	casa	[%r16] 0x80, %r17, %r11
	.word 0xd2340011  ! 9: STH_R	sth	%r9, [%r16 + %r17]
	.word 0xc6fc1011  ! 11: SWAPA_R	swapa	%r3, [%r16 + %r17] 0x80
thr2_irf_ce_0:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_0), 16, 16),1,IRF,ce,13,x, x,x,x, x,x,x)
	.word 0xc4342769  ! 14: STH_I	sth	%r2, [%r16 + 0x0769]
	.word 0x9c9c2ee8  ! 16: XORcc_I	xorcc 	%r16, 0x0ee8, %r14
	.word 0x8ac42953  ! 16: ADDCcc_I	addccc 	%r16, 0x0953, %r5
	.word 0xcefc1011  ! 16: SWAPA_R	swapa	%r7, [%r16 + %r17] 0x80
	.word 0xbe2c0011  ! 17: ANDN_R	andn 	%r16, %r17, %r31
	.word 0x81dc2d95  ! 19: FLUSH_I	dis not found

	.word 0xd67426a5  ! 21: STX_I	stx	%r11, [%r16 + 0x06a5]
	.word 0x9eac0011  ! 23: ANDNcc_R	andncc 	%r16, %r17, %r15
	.word 0x980428ad  ! 23: ADD_I	add 	%r16, 0x08ad, %r12
	.word 0xc36c0011  ! 23: PREFETCH_R	prefetch	[%r16 + %r17], #one_read
	.word 0xb414205f  ! 24: OR_I	or 	%r16, 0x005f, %r26
	.word 0x38800003  ! 26: BGU	bgu,a	<label_0x3>
	.word 0xc8342c39  ! 28: STH_I	sth	%r4, [%r16 + 0x0c39]
	.word 0x9ec40011  ! 30: ADDCcc_R	addccc 	%r16, %r17, %r15
	.word 0xbf2c3001  ! 30: SLLX_I	sllx	%r16, 0x0001, %r31
	.word 0x90940011  ! 30: ORcc_R	orcc 	%r16, %r17, %r8
	.word 0xc36c0011  ! 30: PREFETCH_R	prefetch	[%r16 + %r17], #one_read
thr2_irf_ce_1:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_1), 16, 16),1,IRF,ce,15,x, x,x,x, x,x,x)
	.word 0xfe2c2125  ! 33: STB_I	stb	%r31, [%r16 + 0x0125]
	.word 0xce4c2cf5  ! 35: LDSB_I	ldsb	[%r16 + 0x0cf5], %r7
	.word 0xce2c2845  ! 37: STB_I	stb	%r7, [%r16 + 0x0845]
	.word 0xb32c3001  ! 39: SLLX_I	sllx	%r16, 0x0001, %r25
	.word 0xa8440011  ! 39: ADDC_R	addc 	%r16, %r17, %r20
	.word 0xfea41011  ! 39: STWA_R	stwa	%r31, [%r16 + %r17] 0x80
	.word 0xab3c1011  ! 40: SRAX_R	srax	%r16, %r17, %r21
	.word 0xb0ac2d9b  ! 42: ANDNcc_I	andncc 	%r16, 0x0d9b, %r24
	.word 0x940c0011  ! 42: AND_R	and 	%r16, %r17, %r10
	.word 0x85840011  ! 42: WRCCR_R	wr	%r16, %r17, %ccr
	.word 0x9ca428c4  ! 43: SUBcc_I	subcc 	%r16, 0x08c4, %r14
	.word 0x8c2c2449  ! 45: ANDN_I	andn 	%r16, 0x0449, %r6
	.word 0x86440011  ! 45: ADDC_R	addc 	%r16, %r17, %r3
	.word 0xc3ec1011  ! 45: PREFETCHA_R	prefetcha	[%r16, %r17] 0x80, #one_read
	.word 0xfc342549  ! 47: STH_I	sth	%r30, [%r16 + 0x0549]
	.word 0x868c2994  ! 49: ANDcc_I	andcc 	%r16, 0x0994, %r3
	.word 0xb00423a4  ! 49: ADD_I	add 	%r16, 0x03a4, %r24
	.word 0x83e40011  ! 49: SAVE_R	save	%r16, %r17, %r1
	.word 0xaf3c1011  ! 50: SRAX_R	srax	%r16, %r17, %r23
	.word 0xce84286d  ! 52: LDUWA_I	lduwa	[%r16, + 0x086d] %asi, %r7
	.word 0x88ac0011  ! 53: ANDNcc_R	andncc 	%r16, %r17, %r4
	.word 0x8a440011  ! 55: ADDC_R	addc 	%r16, %r17, %r5
	.word 0x832c3001  ! 55: SLLX_I	sllx	%r16, 0x0001, %r1
	.word 0x8d3c1011  ! 55: SRAX_R	srax	%r16, %r17, %r6
	.word 0xe8442de1  ! 55: LDSW_I	ldsw	[%r16 + 0x0de1], %r20
	.word 0xe6740011  ! 56: STX_R	stx	%r19, [%r16 + %r17]
	.word 0x91340011  ! 58: SRL_R	srl 	%r16, %r17, %r8
	.word 0xb49c0011  ! 58: XORcc_R	xorcc 	%r16, %r17, %r26
	.word 0xc4ac23b2  ! 58: STBA_I	stba	%r2, [%r16 + 0x03b2] %asi
thr2_irf_ce_2:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_2), 16, 16),1,IRF,ce,33,x, x,x,x, x,x,x)
	.word 0xfe742541  ! 61: STX_I	stx	%r31, [%r16 + 0x0541]
	.word 0x92ac0011  ! 63: ANDNcc_R	andncc 	%r16, %r17, %r9
	.word 0xccac256f  ! 63: STBA_I	stba	%r6, [%r16 + 0x056f] %asi
	.word 0xf0740011  ! 64: STX_R	stx	%r24, [%r16 + %r17]
	.word 0xad7c0411  ! 66: MOVR_R	move	%r16, %r17, %r22
	.word 0x8f7c2401  ! 66: MOVR_I	move	%r16, 0xfffffff8, %r7
	.word 0x872c0011  ! 66: SLL_R	sll 	%r16, %r17, %r3
	.word 0x1a800001  ! 66: BCC	bcc  	<label_0x1>
	.word 0xce742851  ! 68: STX_I	stx	%r7, [%r16 + 0x0851]
	.word 0x8e2c0011  ! 70: ANDN_R	andn 	%r16, %r17, %r7
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xce240011  ! 71: STW_R	stw	%r7, [%r16 + %r17]
	.word 0x823c283c  ! 73: XNOR_I	xnor 	%r16, 0x083c, %r1
	.word 0xab641811  ! 73: MOVcc_R	<illegal instruction>
	.word 0xbebc26ae  ! 73: XNORcc_I	xnorcc 	%r16, 0x06ae, %r31
	.word 0xc6ec2f2a  ! 73: LDSTUBA_I	ldstuba	%r3, [%r16 + 0x0f2a] %asi
	.word 0xda340011  ! 74: STH_R	sth	%r13, [%r16 + %r17]
	.word 0x853c2001  ! 76: SRA_I	sra 	%r16, 0x0001, %r2
	.word 0xb61c0011  ! 76: XOR_R	xor 	%r16, %r17, %r27
thr2_resum_intr_0:
!$EV trig_pc_d(2,expr(@VA(.MAIN.thr2_resum_intr_0), 16, 16)) -> intp(2, 3, 1)
	wr      %r0, 0x5, %asr26
	.word 0x95341011  ! 77: SRLX_R	srlx	%r16, %r17, %r10
	.word 0x9b2c1011  ! 79: SLLX_R	sllx	%r16, %r17, %r13
	ta	T_CHANGE_NONHPRIV	! macro
thr2_irf_ce_3:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_3), 16, 16),1,IRF,ce,68,x, x,x,x, x,x,x)
	.word 0xd82c2001  ! 82: STB_I	stb	%r12, [%r16 + 0x0001]
	.word 0xec1423a8  ! 84: LDUH_I	lduh	[%r16 + 0x03a8], %r22
	.word 0xde242545  ! 86: STW_I	stw	%r15, [%r16 + 0x0545]
        wr %g0, 0x4, %fprs
	.word 0xca340011  ! 89: STH_R	sth	%r5, [%r16 + %r17]
	.word 0xbe9c0011  ! 91: XORcc_R	xorcc 	%r16, %r17, %r31
	.word 0x87504000  ! 91: RDPR_TNPC	rdpr	%tnpc, %r3
	.word 0xc674226f  ! 93: STX_I	stx	%r3, [%r16 + 0x026f]
	.word 0x853c0011  ! 95: SRA_R	sra 	%r16, %r17, %r2
	.word 0x9e2c0011  ! 95: ANDN_R	andn 	%r16, %r17, %r15
	.word 0x9f340011  ! 95: SRL_R	srl 	%r16, %r17, %r15
	.word 0xc36c2732  ! 95: PREFETCH_I	prefetch	[%r16 + 0x0732], #one_read
	.word 0xcc2425b1  ! 97: STW_I	stw	%r6, [%r16 + 0x05b1]
        wr %g0, 0x4, %fprs
thr2_irf_ce_4:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_4), 16, 16),1,IRF,ce,32,x, x,x,x, x,x,x)
	.word 0xcc2c23a3  ! 102: STB_I	stb	%r6, [%r16 + 0x03a3]
	.word 0x9a8c0011  ! 104: ANDcc_R	andcc 	%r16, %r17, %r13
	.word 0x85840011  ! 104: WRCCR_R	wr	%r16, %r17, %ccr
	.word 0xda340011  ! 105: STH_R	sth	%r13, [%r16 + %r17]
	.word 0xc7240011  ! 107: STF_R	st	%f3, [%r17, %r16]
	.word 0x8a3424c4  ! 108: SUBC_I	orn 	%r16, 0x04c4, %r5
        wr %g0, 0x4, %fprs
thr2_irf_ce_5:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_5), 16, 16),1,IRF,ce,30,x, x,x,x, x,x,x)
	.word 0xd47429a3  ! 113: STX_I	stx	%r10, [%r16 + 0x09a3]
thr2_resum_intr_1:
!$EV trig_pc_d(2,expr(@VA(.MAIN.thr2_resum_intr_1), 16, 16)) -> intp(2, 3, 1)
	wr      %r0, 0x5, %asr26
thr2_irf_ce_6:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_6), 16, 16),1,IRF,ce,59,x, x,x,x, x,x,x)
	.word 0xd4742c47  ! 118: STX_I	stx	%r10, [%r16 + 0x0c47]
	.word 0x9c040011  ! 120: ADD_R	add 	%r16, %r17, %r14
        wr %g0, 0x4, %fprs
	.word 0xc83425ef  ! 122: STH_I	sth	%r4, [%r16 + 0x05ef]
	.word 0x9a9c2681  ! 124: XORcc_I	xorcc 	%r16, 0x0681, %r13
	.word 0x852c0011  ! 124: SLL_R	sll 	%r16, %r17, %r2
	ta	T_CHANGE_PRIV	! macro
	.word 0xee2c27d1  ! 126: STB_I	stb	%r23, [%r16 + 0x07d1]
	.word 0xaf7c0411  ! 128: MOVR_R	move	%r16, %r17, %r23
	.word 0xa6fc2490  ! 128: SDIVcc_I	sdivcc 	%r16, 0x0490, %r19
thr2_irf_ce_7:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_7), 16, 16),1,IRF,ce,55,x, x,x,x, x,x,x)
	.word 0xc82c2a3f  ! 131: STB_I	stb	%r4, [%r16 + 0x0a3f]
	.word 0xb49c0011  ! 133: XORcc_R	xorcc 	%r16, %r17, %r26
	.word 0xb93c0011  ! 133: SRA_R	sra 	%r16, %r17, %r28
	.word 0x81dc2694  ! 133: FLUSH_I	dis not found

	.word 0xf02c2f0f  ! 135: STB_I	stb	%r24, [%r16 + 0x0f0f]
	.word 0x9b641811  ! 137: MOVcc_R	<illegal instruction>
thr2_resum_intr_2:
!$EV trig_pc_d(2,expr(@VA(.MAIN.thr2_resum_intr_2), 16, 16)) -> intp(2, 3, 1)
	wr      %r0, 0x5, %asr26
	.word 0xde740011  ! 138: STX_R	stx	%r15, [%r16 + %r17]
	.word 0x9a2c0011  ! 140: ANDN_R	andn 	%r16, %r17, %r13
	.word 0xa7e40011  ! 140: SAVE_R	save	%r16, %r17, %r19
	.word 0xd03427ef  ! 142: STH_I	sth	%r8, [%r16 + 0x07ef]
	.word 0xb23c26c3  ! 144: XNOR_I	xnor 	%r16, 0x06c3, %r25
	.word 0xb4b42447  ! 144: ORNcc_I	orncc 	%r16, 0x0447, %r26
	.word 0xa41c0011  ! 144: XOR_R	xor 	%r16, %r17, %r18
	.word 0x95530000  ! 144: RDPR_CLEANWIN	rdpr	%cleanwin, %r10
	.word 0xf2740011  ! 145: STX_R	stx	%r25, [%r16 + %r17]
        wr %g0, 0x4, %fprs
	.word 0xea240011  ! 148: STW_R	stw	%r21, [%r16 + %r17]
	.word 0x86840011  ! 150: ADDcc_R	addcc 	%r16, %r17, %r3
thr2_resum_intr_3:
!$EV trig_pc_d(2,expr(@VA(.MAIN.thr2_resum_intr_3), 16, 16)) -> intp(2, 3, 1)
	wr      %r0, 0x5, %asr26
thr2_irf_ce_8:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_8), 16, 16),1,IRF,ce,5,x, x,x,x, x,x,x)
	.word 0xc42c206b  ! 153: STB_I	stb	%r2, [%r16 + 0x006b]
	.word 0x8750c000  ! 155: RDPR_TT	<illegal instruction>
	.word 0xd0340011  ! 156: STH_R	sth	%r8, [%r16 + %r17]
	.word 0x963c2e74  ! 158: XNOR_I	xnor 	%r16, 0x0e74, %r11
	.word 0xc89c1011  ! 158: LDDA_R	ldda	[%r16, %r17] 0x80, %r4
	.word 0xa52c3001  ! 159: SLLX_I	sllx	%r16, 0x0001, %r18
	.word 0xb3e40011  ! 161: SAVE_R	save	%r16, %r17, %r25
	.word 0xf4342447  ! 163: STH_I	sth	%r26, [%r16 + 0x0447]
	.word 0x943c0011  ! 165: XNOR_R	xnor 	%r16, %r17, %r10
	.word 0x8e9c2c86  ! 165: XORcc_I	xorcc 	%r16, 0x0c86, %r7
	.word 0xe9f42011  ! 165: CASXA_R	casxa	[%r16]%asi, %r17, %r20
	.word 0xda342875  ! 167: STH_I	sth	%r13, [%r16 + 0x0875]
	.word 0x880426bd  ! 169: ADD_I	add 	%r16, 0x06bd, %r4
	.word 0x98940011  ! 169: ORcc_R	orcc 	%r16, %r17, %r12
	.word 0x9c1c0011  ! 169: XOR_R	xor 	%r16, %r17, %r14
	.word 0xc36c2f79  ! 169: PREFETCH_I	prefetch	[%r16 + 0x0f79], #one_read
thr2_irf_ce_9:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_9), 16, 16),1,IRF,ce,59,x, x,x,x, x,x,x)
	.word 0xc6342ff1  ! 172: STH_I	sth	%r3, [%r16 + 0x0ff1]
	.word 0x842c0011  ! 174: ANDN_R	andn 	%r16, %r17, %r2
	.word 0x932c3001  ! 174: SLLX_I	sllx	%r16, 0x0001, %r9
	.word 0xcf3c0011  ! 174: STDF_R	std	%f7, [%r17, %r16]
	.word 0xf6240011  ! 175: STW_R	stw	%r27, [%r16 + %r17]
	.word 0x95518000  ! 177: RDPR_PSTATE	<illegal instruction>
thr2_irf_ce_10:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_10), 16, 16),1,IRF,ce,65,x, x,x,x, x,x,x)
	.word 0xf03428ab  ! 180: STH_I	sth	%r24, [%r16 + 0x08ab]
	.word 0x82fc25c2  ! 182: SDIVcc_I	sdivcc 	%r16, 0x05c2, %r1
	.word 0xf6740011  ! 183: STX_R	stx	%r27, [%r16 + %r17]
	.word 0xbcb40011  ! 185: ORNcc_R	orncc 	%r16, %r17, %r30
	.word 0x86840011  ! 185: ADDcc_R	addcc 	%r16, %r17, %r3
	.word 0x94140011  ! 185: OR_R	or 	%r16, %r17, %r10
	ta	T_CHANGE_HPRIV	! macro
	.word 0xce742b9d  ! 187: STX_I	stx	%r7, [%r16 + 0x0b9d]
	.word 0xb9518000  ! 189: RDPR_PSTATE	<illegal instruction>
thr2_irf_ce_11:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_11), 16, 16),1,IRF,ce,44,x, x,x,x, x,x,x)
	.word 0xfe242d81  ! 192: STW_I	stw	%r31, [%r16 + 0x0d81]
	.word 0x992c1011  ! 194: SLLX_R	sllx	%r16, %r17, %r12
	ta	T_CHANGE_PRIV	! macro
	.word 0x868c2ef4  ! 195: ANDcc_I	andcc 	%r16, 0x0ef4, %r3
	.word 0x892c2001  ! 197: SLL_I	sll 	%r16, 0x0001, %r4
	.word 0x9434205d  ! 197: ORN_I	orn 	%r16, 0x005d, %r10
	.word 0x841c0011  ! 197: XOR_R	xor 	%r16, %r17, %r2
	.word 0x886c0011  ! 197: UDIVX_R	udivx 	%r16, %r17, %r4
thr2_irf_ce_12:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_12), 16, 16),1,IRF,ce,24,x, x,x,x, x,x,x)
	.word 0xea7428a5  ! 200: STX_I	stx	%r21, [%r16 + 0x08a5]
	.word 0x912c0011  ! 202: SLL_R	sll 	%r16, %r17, %r8
	.word 0x92342df2  ! 202: ORN_I	orn 	%r16, 0x0df2, %r9
	.word 0x8957c000  ! 202: RDPR_VER	<illegal instruction>
	.word 0xc82c0011  ! 203: STB_R	stb	%r4, [%r16 + %r17]
	.word 0xa7520000  ! 205: RDPR_PIL	<illegal instruction>
	.word 0xec3426d9  ! 207: STH_I	sth	%r22, [%r16 + 0x06d9]
	.word 0x868c0011  ! 209: ANDcc_R	andcc 	%r16, %r17, %r3
	.word 0xa73c0011  ! 209: SRA_R	sra 	%r16, %r17, %r19
	ta	T_CHANGE_NONHPRIV	! macro
thr2_irf_ce_13:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_13), 16, 16),1,IRF,ce,40,x, x,x,x, x,x,x)
	.word 0xf47422ff  ! 212: STX_I	stx	%r26, [%r16 + 0x02ff]
	.word 0x9f2c2001  ! 214: SLL_I	sll 	%r16, 0x0001, %r15
	.word 0x8d840011  ! 214: WRFPRS_R	wr	%r16, %r17, %fprs
	.word 0x84ac0011  ! 215: ANDNcc_R	andncc 	%r16, %r17, %r2
	.word 0x8e842ae5  ! 217: ADDcc_I	addcc 	%r16, 0x0ae5, %r7
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x92bc22c1  ! 218: XNORcc_I	xnorcc 	%r16, 0x02c1, %r9
	.word 0xbf3c0011  ! 220: SRA_R	sra 	%r16, %r17, %r31
	.word 0x8f2c3001  ! 220: SLLX_I	sllx	%r16, 0x0001, %r7
	.word 0x9d3c1011  ! 220: SRAX_R	srax	%r16, %r17, %r14
        wr %g0, 0x4, %fprs
	.word 0x92940011  ! 221: ORcc_R	orcc 	%r16, %r17, %r9
	ta	T_CHANGE_PRIV	! macro
	.word 0xde2c2a57  ! 225: STB_I	stb	%r15, [%r16 + 0x0a57]
	.word 0x8c0c2e14  ! 227: AND_I	and 	%r16, 0x0e14, %r6
	.word 0x9c4422e7  ! 227: ADDC_I	addc 	%r16, 0x02e7, %r14
	.word 0x0e800001  ! 227: BVS	bvs  	<label_0x1>
	.word 0xb3340011  ! 228: SRL_R	srl 	%r16, %r17, %r25
	.word 0x928c0011  ! 230: ANDcc_R	andcc 	%r16, %r17, %r9
	.word 0x83340011  ! 230: SRL_R	srl 	%r16, %r17, %r1
	.word 0xac440011  ! 230: ADDC_R	addc 	%r16, %r17, %r22
	.word 0x9b518000  ! 230: RDPR_PSTATE	rdpr	%pstate, %r13
thr2_irf_ce_14:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_14), 16, 16),1,IRF,ce,21,x, x,x,x, x,x,x)
	.word 0xc2742449  ! 233: STX_I	stx	%r1, [%r16 + 0x0449]
	.word 0x95341011  ! 235: SRLX_R	srlx	%r16, %r17, %r10
	.word 0x8fab0831  ! 235: FMOVGU	fmovs	%fcc1, %f17, %f7
	.word 0xd674281b  ! 237: STX_I	stx	%r11, [%r16 + 0x081b]
	.word 0x9a0c2daa  ! 239: AND_I	and 	%r16, 0x0daa, %r13
	.word 0x06800003  ! 239: BL	bl  	<label_0x3>
	.word 0xe474290f  ! 241: STX_I	stx	%r18, [%r16 + 0x090f]
	.word 0x86bc24ce  ! 243: XNORcc_I	xnorcc 	%r16, 0x04ce, %r3
	.word 0x8143e038  ! 243: MEMBAR	membar	#StoreStore | #Lookaside | #MemIssue 
	.word 0xde2c0011  ! 244: STB_R	stb	%r15, [%r16 + %r17]
	.word 0xa43c27fa  ! 246: XNOR_I	xnor 	%r16, 0x07fa, %r18
	.word 0xc3ec1011  ! 246: PREFETCHA_R	prefetcha	[%r16, %r17] 0x80, #one_read
thr2_irf_ce_15:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_15), 16, 16),1,IRF,ce,48,x, x,x,x, x,x,x)
	.word 0xd8742899  ! 249: STX_I	stx	%r12, [%r16 + 0x0899]
	.word 0xc49c1011  ! 251: LDDA_R	ldda	[%r16, %r17] 0x80, %r2
	.word 0x821428c7  ! 252: OR_I	or 	%r16, 0x08c7, %r1
	.word 0xb28c0011  ! 254: ANDcc_R	andcc 	%r16, %r17, %r25
	.word 0x8454276e  ! 254: UMUL_I	umul 	%r16, 0x076e, %r2
	.word 0xfe242791  ! 256: STW_I	stw	%r31, [%r16 + 0x0791]
	.word 0x9ec40011  ! 258: ADDCcc_R	addccc 	%r16, %r17, %r15
	.word 0xb43c0011  ! 258: XNOR_R	xnor 	%r16, %r17, %r26
	.word 0x81580000  ! 258: FLUSHW	flushw
	.word 0x84340011  ! 259: ORN_R	orn 	%r16, %r17, %r2
	.word 0xe4841011  ! 261: LDUWA_R	lduwa	[%r16, %r17] 0x80, %r18
	.word 0xc4740011  ! 262: STX_R	stx	%r2, [%r16 + %r17]
	.word 0x925c2f2a  ! 264: SMUL_I	smul 	%r16, 0x0f2a, %r9
	.word 0x86142228  ! 265: OR_I	or 	%r16, 0x0228, %r3
	.word 0x842c0011  ! 267: ANDN_R	andn 	%r16, %r17, %r2
	.word 0xc3ec1011  ! 267: PREFETCHA_R	prefetcha	[%r16, %r17] 0x80, #one_read
	.word 0xc4740011  ! 268: STX_R	stx	%r2, [%r16 + %r17]
	.word 0xb13c0011  ! 270: SRA_R	sra 	%r16, %r17, %r24
	.word 0xa6140011  ! 270: OR_R	or 	%r16, %r17, %r19
	.word 0xcaf42847  ! 270: STXA_I	stxa	%r5, [%r16 + 0x0847] %asi
	.word 0xee240011  ! 271: STW_R	stw	%r23, [%r16 + %r17]
	.word 0x9b340011  ! 273: SRL_R	srl 	%r16, %r17, %r13
thr2_resum_intr_4:
!$EV trig_pc_d(2,expr(@VA(.MAIN.thr2_resum_intr_4), 16, 16)) -> intp(2, 3, 1)
	wr      %r0, 0x5, %asr26
	.word 0xd02c204b  ! 275: STB_I	stb	%r8, [%r16 + 0x004b]
	.word 0x8a440011  ! 277: ADDC_R	addc 	%r16, %r17, %r5
	.word 0xacbc26a0  ! 277: XNORcc_I	xnorcc 	%r16, 0x06a0, %r22
	.word 0xac6c2e27  ! 277: UDIVX_I	udivx 	%r16, 0x0e27, %r22
	.word 0xd2740011  ! 278: STX_R	stx	%r9, [%r16 + %r17]
	.word 0xb82c0011  ! 280: ANDN_R	andn 	%r16, %r17, %r28
	.word 0x88142bcc  ! 280: OR_I	or 	%r16, 0x0bcc, %r4
	.word 0xba0c0011  ! 280: AND_R	and 	%r16, %r17, %r29
	.word 0x81840011  ! 280: WRY_R	wr	%r16, %r17, %y
	.word 0x988c0011  ! 281: ANDcc_R	andcc 	%r16, %r17, %r12
	.word 0x912c0011  ! 283: SLL_R	sll 	%r16, %r17, %r8
	.word 0x81dc0011  ! 283: FLUSH_R	dis not found

	.word 0xc22c2241  ! 285: STB_I	stb	%r1, [%r16 + 0x0241]
        wr %g0, 0x4, %fprs
	.word 0xc2742aa7  ! 289: STX_I	stx	%r1, [%r16 + 0x0aa7]
	.word 0xbb7c0411  ! 291: MOVR_R	move	%r16, %r17, %r29
	.word 0xa82c0011  ! 291: ANDN_R	andn 	%r16, %r17, %r20
	.word 0x92040011  ! 291: ADD_R	add 	%r16, %r17, %r9
	.word 0xa9a019b1  ! 291: FsTOq	dis not found

	.word 0x969426ae  ! 292: ORcc_I	orcc 	%r16, 0x06ae, %r11
	.word 0xe46c0011  ! 294: LDSTUB_R	ldstub	%r18, [%r16 + %r17]
	.word 0xe8342fff  ! 296: STH_I	sth	%r20, [%r16 + 0x0fff]
	.word 0xced428d4  ! 298: LDSHA_I	ldsha	[%r16, + 0x08d4] %asi, %r7
	.word 0xf02424d9  ! 300: STW_I	stw	%r24, [%r16 + 0x04d9]
	.word 0x82940011  ! 302: ORcc_R	orcc 	%r16, %r17, %r1
	.word 0xbb340011  ! 302: SRL_R	srl 	%r16, %r17, %r29
	.word 0x8143c000  ! 302: STBAR	stbar
	.word 0xcc742e15  ! 304: STX_I	stx	%r6, [%r16 + 0x0e15]
	.word 0xb8340011  ! 306: ORN_R	orn 	%r16, %r17, %r28
	.word 0x8b340011  ! 306: SRL_R	srl 	%r16, %r17, %r5
	.word 0xb20c0011  ! 306: AND_R	and 	%r16, %r17, %r25
	.word 0xc8bc1011  ! 306: STDA_R	stda	%r4, [%r16 + %r17] 0x80
	.word 0xfc242993  ! 308: STW_I	stw	%r30, [%r16 + 0x0993]
	.word 0x8ec40011  ! 310: ADDCcc_R	addccc 	%r16, %r17, %r7
	.word 0xd6ac285b  ! 310: STBA_I	stba	%r11, [%r16 + 0x085b] %asi
thr2_irf_ce_16:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_16), 16, 16),1,IRF,ce,34,x, x,x,x, x,x,x)
	.word 0xd27420d3  ! 313: STX_I	stx	%r9, [%r16 + 0x00d3]
	.word 0x933c0011  ! 315: SRA_R	sra 	%r16, %r17, %r9
	.word 0x840c0011  ! 315: AND_R	and 	%r16, %r17, %r2
	.word 0x81dc0011  ! 315: FLUSH_R	dis not found

	.word 0xc8742d1f  ! 317: STX_I	stx	%r4, [%r16 + 0x0d1f]
	.word 0x8d2c0011  ! 319: SLL_R	sll 	%r16, %r17, %r6
	.word 0xc2fc1011  ! 319: SWAPA_R	swapa	%r1, [%r16 + %r17] 0x80
	.word 0xd4340011  ! 320: STH_R	sth	%r10, [%r16 + %r17]
	.word 0x88bc27a7  ! 322: XNORcc_I	xnorcc 	%r16, 0x07a7, %r4
	.word 0x82c4294c  ! 322: ADDCcc_I	addccc 	%r16, 0x094c, %r1
	.word 0x822c0011  ! 322: ANDN_R	andn 	%r16, %r17, %r1
	.word 0x81dc0011  ! 322: FLUSH_R	dis not found

	.word 0x9eac0011  ! 323: ANDNcc_R	andncc 	%r16, %r17, %r15
	.word 0xb5a018f1  ! 325: FqTOs	dis not found

	.word 0x9cbc203c  ! 326: XNORcc_I	xnorcc 	%r16, 0x003c, %r14
	.word 0xb5643801  ! 328: MOVcc_I	<illegal instruction>
	.word 0x961c0011  ! 328: XOR_R	xor 	%r16, %r17, %r11
	.word 0xa8c40011  ! 328: ADDCcc_R	addccc 	%r16, %r17, %r20
	.word 0xea440011  ! 328: LDSW_R	ldsw	[%r16 + %r17], %r21
	.word 0xd474207d  ! 330: STX_I	stx	%r10, [%r16 + 0x007d]
	.word 0x923c0011  ! 332: XNOR_R	xnor 	%r16, %r17, %r9
	.word 0x9c342bb8  ! 332: ORN_I	orn 	%r16, 0x0bb8, %r14
	.word 0xa8d40011  ! 332: UMULcc_R	umulcc 	%r16, %r17, %r20
	.word 0xca7428ab  ! 334: STX_I	stx	%r5, [%r16 + 0x08ab]
	.word 0x8e342cd3  ! 336: ORN_I	orn 	%r16, 0x0cd3, %r7
thr2_resum_intr_5:
!$EV trig_pc_d(2,expr(@VA(.MAIN.thr2_resum_intr_5), 16, 16)) -> intp(2, 3, 1)
	wr      %r0, 0x5, %asr26
	.word 0xc63424cb  ! 338: STH_I	sth	%r3, [%r16 + 0x04cb]
	.word 0x9cc40011  ! 340: ADDCcc_R	addccc 	%r16, %r17, %r14
	.word 0xd67c0011  ! 340: SWAP_R	swap	%r11, [%r16 + %r17]
	.word 0xce2c226d  ! 342: STB_I	stb	%r7, [%r16 + 0x026d]
	.word 0x9350c000  ! 344: RDPR_TT	<illegal instruction>
	.word 0x84342ab5  ! 345: ORN_I	orn 	%r16, 0x0ab5, %r2
	.word 0xb4b4221c  ! 347: ORNcc_I	orncc 	%r16, 0x021c, %r26
	.word 0x8143e056  ! 347: MEMBAR	membar	#StoreLoad | #LoadStore | #Lookaside | #Sync 
	.word 0x8c1c0011  ! 348: XOR_R	xor 	%r16, %r17, %r6
	.word 0xfafc2a9f  ! 350: SWAPA_I	swapa	%r29, [%r16 + 0x0a9f] %asi
thr2_irf_ce_17:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_17), 16, 16),1,IRF,ce,56,x, x,x,x, x,x,x)
	.word 0xee242621  ! 353: STW_I	stw	%r23, [%r16 + 0x0621]
	.word 0xee7c2ac6  ! 355: SWAP_I	swap	%r23, [%r16 + 0x0ac6]
	.word 0xce740011  ! 356: STX_R	stx	%r7, [%r16 + %r17]
	.word 0x8143c000  ! 358: STBAR	stbar
	.word 0xbeac0011  ! 359: ANDNcc_R	andncc 	%r16, %r17, %r31
	.word 0x82940011  ! 361: ORcc_R	orcc 	%r16, %r17, %r1
	.word 0x997c2401  ! 361: MOVR_I	move	%r16, 0xfffffff8, %r12
	.word 0xc36c2ac3  ! 361: PREFETCH_I	prefetch	[%r16 + 0x0ac3], #one_read
	.word 0xbca42ffc  ! 362: SUBcc_I	subcc 	%r16, 0x0ffc, %r30
	.word 0x9a04281f  ! 364: ADD_I	add 	%r16, 0x081f, %r13
	.word 0x86c40011  ! 364: ADDCcc_R	addccc 	%r16, %r17, %r3
	.word 0xc3ec1011  ! 364: PREFETCHA_R	prefetcha	[%r16, %r17] 0x80, #one_read
	.word 0xd4740011  ! 365: STX_R	stx	%r10, [%r16 + %r17]
	.word 0xc36c0011  ! 367: PREFETCH_R	prefetch	[%r16 + %r17], #one_read
	.word 0xf6340011  ! 368: STH_R	sth	%r27, [%r16 + %r17]
	.word 0x88940011  ! 370: ORcc_R	orcc 	%r16, %r17, %r4
	.word 0xa81424d9  ! 370: OR_I	or 	%r16, 0x04d9, %r20
thr2_resum_intr_6:
!$EV trig_pc_d(2,expr(@VA(.MAIN.thr2_resum_intr_6), 16, 16)) -> intp(2, 3, 1)
	wr      %r0, 0x5, %asr26
	.word 0xaa140011  ! 371: OR_R	or 	%r16, %r17, %r21
	.word 0xb81c0011  ! 373: XOR_R	xor 	%r16, %r17, %r28
	.word 0xc28c1011  ! 373: LDUBA_R	lduba	[%r16, %r17] 0x80, %r1
	.word 0xd6240011  ! 374: STW_R	stw	%r11, [%r16 + %r17]
	.word 0x97643801  ! 376: MOVcc_I	<illegal instruction>
	.word 0x9eac2584  ! 376: ANDNcc_I	andncc 	%r16, 0x0584, %r15
	.word 0x8143e021  ! 376: MEMBAR	membar	#LoadLoad | #MemIssue 
thr2_irf_ce_18:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_18), 16, 16),1,IRF,ce,18,x, x,x,x, x,x,x)
	.word 0xc62c255b  ! 379: STB_I	stb	%r3, [%r16 + 0x055b]
	.word 0x8143c000  ! 381: STBAR	stbar
	.word 0xc6240011  ! 382: STW_R	stw	%r3, [%r16 + %r17]
	.word 0x932c3001  ! 384: SLLX_I	sllx	%r16, 0x0001, %r9
	.word 0x933c1011  ! 384: SRAX_R	srax	%r16, %r17, %r9
	.word 0xb7341011  ! 384: SRLX_R	srlx	%r16, %r17, %r27
	ta	T_CHANGE_PRIV	! macro
	.word 0xce740011  ! 385: STX_R	stx	%r7, [%r16 + %r17]
	.word 0x9a9c227f  ! 387: XORcc_I	xorcc 	%r16, 0x027f, %r13
	.word 0xab341011  ! 387: SRLX_R	srlx	%r16, %r17, %r21
	.word 0xbc9c2130  ! 387: XORcc_I	xorcc 	%r16, 0x0130, %r30
	.word 0x81580000  ! 387: FLUSHW	flushw
	.word 0xca340011  ! 388: STH_R	sth	%r5, [%r16 + %r17]
	.word 0x903c0011  ! 390: XNOR_R	xnor 	%r16, %r17, %r8
	.word 0xcc1c2b0f  ! 390: LDD_I	ldd	[%r16 + 0x0b0f], %r6
	.word 0xde340011  ! 391: STH_R	sth	%r15, [%r16 + %r17]
	.word 0xfd3c2224  ! 393: STDF_I	std	%f30, [0x0224, %r16]
	.word 0xc8742bdd  ! 395: STX_I	stx	%r4, [%r16 + 0x0bdd]
	.word 0x90b4265d  ! 397: ORNcc_I	orncc 	%r16, 0x065d, %r8
	.word 0x9f518000  ! 397: RDPR_PSTATE	rdpr	%pstate, %r15
	.word 0xf0740011  ! 398: STX_R	stx	%r24, [%r16 + %r17]
	.word 0x8e1c0011  ! 400: XOR_R	xor 	%r16, %r17, %r7
	.word 0xb414277d  ! 400: OR_I	or 	%r16, 0x077d, %r26
	.word 0x02800003  ! 400: BE	be  	<label_0x3>
	.word 0x832c0011  ! 401: SLL_R	sll 	%r16, %r17, %r1
	.word 0xc3ec1011  ! 403: PREFETCHA_R	prefetcha	[%r16, %r17] 0x80, #one_read
thr2_irf_ce_19:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_19), 16, 16),1,IRF,ce,13,x, x,x,x, x,x,x)
	.word 0xd4342e6b  ! 406: STH_I	sth	%r10, [%r16 + 0x0e6b]
	.word 0xb33c2001  ! 408: SRA_I	sra 	%r16, 0x0001, %r25
	.word 0x884423b2  ! 408: ADDC_I	addc 	%r16, 0x03b2, %r4
	.word 0xda0c2a50  ! 408: LDUB_I	ldub	[%r16 + 0x0a50], %r13
	.word 0xfc242213  ! 410: STW_I	stw	%r30, [%r16 + 0x0213]
	.word 0x8143c000  ! 412: STBAR	stbar
	.word 0x892c0011  ! 413: SLL_R	sll 	%r16, %r17, %r4
	.word 0x84940011  ! 415: ORcc_R	orcc 	%r16, %r17, %r2
	.word 0xfefc1011  ! 415: SWAPA_R	swapa	%r31, [%r16 + %r17] 0x80
	.word 0xcc340011  ! 416: STH_R	sth	%r6, [%r16 + %r17]
	.word 0x9c1c238e  ! 418: XOR_I	xor 	%r16, 0x038e, %r14
	.word 0x9f2c0011  ! 418: SLL_R	sll 	%r16, %r17, %r15
	.word 0x81880000  ! 418: SAVED	saved
	.word 0x877c0411  ! 419: MOVR_R	move	%r16, %r17, %r3
	.word 0xb7343001  ! 421: SRLX_I	srlx	%r16, 0x0001, %r27
	.word 0x81580000  ! 421: FLUSHW	flushw
thr2_irf_ce_20:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_20), 16, 16),1,IRF,ce,24,x, x,x,x, x,x,x)
	.word 0xd4342ae5  ! 424: STH_I	sth	%r10, [%r16 + 0x0ae5]
	.word 0x97e40011  ! 426: SAVE_R	save	%r16, %r17, %r11
	.word 0xfe2c2499  ! 428: STB_I	stb	%r31, [%r16 + 0x0499]
	.word 0x97342001  ! 430: SRL_I	srl 	%r16, 0x0001, %r11
	.word 0x81dc29a4  ! 430: FLUSH_I	dis not found

	.word 0xd0240011  ! 431: STW_R	stw	%r8, [%r16 + %r17]
	.word 0x9c0c2cfe  ! 433: AND_I	and 	%r16, 0x0cfe, %r14
	.word 0x892c1011  ! 433: SLLX_R	sllx	%r16, %r17, %r4
	.word 0xb32c2001  ! 433: SLL_I	sll 	%r16, 0x0001, %r25
	.word 0x8b48c000  ! 433: RDHPR_HINTP	rdhpr	%hintp, %r5
	.word 0xee2c0011  ! 434: STB_R	stb	%r23, [%r16 + %r17]
	.word 0x881c0011  ! 436: XOR_R	xor 	%r16, %r17, %r4
	.word 0x9e840011  ! 436: ADDcc_R	addcc 	%r16, %r17, %r15
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xc8742a0b  ! 438: STX_I	stx	%r4, [%r16 + 0x0a0b]
	.word 0x8143c000  ! 440: STBAR	stbar
	.word 0xc8242fe9  ! 442: STW_I	stw	%r4, [%r16 + 0x0fe9]
	.word 0xb68c0011  ! 444: ANDcc_R	andcc 	%r16, %r17, %r27
	.word 0xe8440011  ! 444: LDSW_R	ldsw	[%r16 + %r17], %r20
	.word 0xf6242e8d  ! 446: STW_I	stw	%r27, [%r16 + 0x0e8d]
	.word 0x8ec42d8c  ! 448: ADDCcc_I	addccc 	%r16, 0x0d8c, %r7
	.word 0xb48c0011  ! 448: ANDcc_R	andcc 	%r16, %r17, %r26
	.word 0xc3ec1011  ! 448: PREFETCHA_R	prefetcha	[%r16, %r17] 0x80, #one_read
	.word 0xf0342069  ! 450: STH_I	sth	%r24, [%r16 + 0x0069]
	.word 0x8c2c2d36  ! 452: ANDN_I	andn 	%r16, 0x0d36, %r6
	.word 0x9d7c0411  ! 452: MOVR_R	move	%r16, %r17, %r14
        wr %g0, 0x4, %fprs
thr2_irf_ce_21:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_21), 16, 16),1,IRF,ce,8,x, x,x,x, x,x,x)
	.word 0xcc742ba1  ! 455: STX_I	stx	%r6, [%r16 + 0x0ba1]
	.word 0xa92c2001  ! 457: SLL_I	sll 	%r16, 0x0001, %r20
	.word 0x9a1425e1  ! 457: OR_I	or 	%r16, 0x05e1, %r13
	.word 0xbe9c29c7  ! 457: XORcc_I	xorcc 	%r16, 0x09c7, %r31
	.word 0xc4f41011  ! 457: STXA_R	stxa	%r2, [%r16 + %r17] 0x80
thr2_irf_ce_22:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_22), 16, 16),1,IRF,ce,18,x, x,x,x, x,x,x)
	.word 0xdc34234f  ! 460: STH_I	sth	%r14, [%r16 + 0x034f]
	.word 0xc29c2e45  ! 462: LDDA_I	ldda	[%r16, + 0x0e45] %asi, %r1
thr2_irf_ce_23:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_23), 16, 16),1,IRF,ce,15,x, x,x,x, x,x,x)
	.word 0xd82c2019  ! 465: STB_I	stb	%r12, [%r16 + 0x0019]
	.word 0xb89c0011  ! 467: XORcc_R	xorcc 	%r16, %r17, %r28
	.word 0x82142b60  ! 467: OR_I	or 	%r16, 0x0b60, %r1
	.word 0xde440011  ! 467: LDSW_R	ldsw	[%r16 + %r17], %r15
thr2_irf_ce_24:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_24), 16, 16),1,IRF,ce,28,x, x,x,x, x,x,x)
	.word 0xe82c242f  ! 470: STB_I	stb	%r20, [%r16 + 0x042f]
	.word 0xb83c0011  ! 472: XNOR_R	xnor 	%r16, %r17, %r28
	.word 0x84bc0011  ! 472: XNORcc_R	xnorcc 	%r16, %r17, %r2
	.word 0x843c2884  ! 472: XNOR_I	xnor 	%r16, 0x0884, %r2
	.word 0x8143c000  ! 472: STBAR	stbar
	.word 0xce3426dd  ! 474: STH_I	sth	%r7, [%r16 + 0x06dd]
	.word 0x9cb40011  ! 476: ORNcc_R	orncc 	%r16, %r17, %r14
	.word 0xaf534000  ! 476: RDPR_OTHERWIN	<illegal instruction>
thr2_irf_ce_25:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_25), 16, 16),1,IRF,ce,3,x, x,x,x, x,x,x)
	.word 0xe474238d  ! 479: STX_I	stx	%r18, [%r16 + 0x038d]
	ta	T_CHANGE_PRIV	! macro
	.word 0xde340011  ! 482: STH_R	sth	%r15, [%r16 + %r17]
	.word 0xbedc22cb  ! 484: SMULcc_I	smulcc 	%r16, 0x02cb, %r31
	.word 0x90242554  ! 485: SUB_I	sub 	%r16, 0x0554, %r8
	.word 0xbcc42f0e  ! 487: ADDCcc_I	addccc 	%r16, 0x0f0e, %r30
	.word 0xafa00171  ! 487: FABSq	dis not found

	.word 0xc22c2b13  ! 489: STB_I	stb	%r1, [%r16 + 0x0b13]
	.word 0xa97c0411  ! 491: MOVR_R	move	%r16, %r17, %r20
	.word 0x820c2653  ! 491: AND_I	and 	%r16, 0x0653, %r1
	.word 0xb5ec0011  ! 491: RESTORE_R	restore	%r16, %r17, %r26
thr2_irf_ce_26:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_26), 16, 16),1,IRF,ce,36,x, x,x,x, x,x,x)
	.word 0xf8242e73  ! 494: STW_I	stw	%r28, [%r16 + 0x0e73]
	.word 0x92142d55  ! 496: OR_I	or 	%r16, 0x0d55, %r9
	.word 0x96ac215e  ! 496: ANDNcc_I	andncc 	%r16, 0x015e, %r11
	.word 0x81880000  ! 496: RESTORED	saved
	.word 0xc874267b  ! 498: STX_I	stx	%r4, [%r16 + 0x067b]
	.word 0x8e440011  ! 500: ADDC_R	addc 	%r16, %r17, %r7
	.word 0xa92c3001  ! 500: SLLX_I	sllx	%r16, 0x0001, %r20
	.word 0x8d3c1011  ! 500: SRAX_R	srax	%r16, %r17, %r6
thr2_resum_intr_7:
!$EV trig_pc_d(2,expr(@VA(.MAIN.thr2_resum_intr_7), 16, 16)) -> intp(2, 3, 1)
	wr      %r0, 0x5, %asr26
thr2_irf_ce_27:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_27), 16, 16),1,IRF,ce,63,x, x,x,x, x,x,x)
	.word 0xce242085  ! 503: STW_I	stw	%r7, [%r16 + 0x0085]
	.word 0xa4342ec0  ! 505: ORN_I	orn 	%r16, 0x0ec0, %r18
	.word 0xaec42035  ! 505: ADDCcc_I	addccc 	%r16, 0x0035, %r23
	.word 0x8fa9c831  ! 505: FMOVVS	fmovs	%fcc1, %f17, %f7
	.word 0xb2440011  ! 506: ADDC_R	addc 	%r16, %r17, %r25
	.word 0x840c2173  ! 508: AND_I	and 	%r16, 0x0173, %r2
	.word 0x8a0c251d  ! 508: AND_I	and 	%r16, 0x051d, %r5
	.word 0x9ebc2349  ! 508: XNORcc_I	xnorcc 	%r16, 0x0349, %r15
	.word 0xde9c1011  ! 508: LDDA_R	ldda	[%r16, %r17] 0x80, %r15
	.word 0x9eac2d98  ! 509: ANDNcc_I	andncc 	%r16, 0x0d98, %r15
	.word 0x920c287f  ! 511: AND_I	and 	%r16, 0x087f, %r9
	.word 0x9f3c1011  ! 511: SRAX_R	srax	%r16, %r17, %r15
	.word 0x88bc0011  ! 511: XNORcc_R	xnorcc 	%r16, %r17, %r4
	.word 0x95ec0011  ! 511: RESTORE_R	restore	%r16, %r17, %r10
	.word 0xe634221d  ! 513: STH_I	sth	%r19, [%r16 + 0x021d]
	.word 0xb8c422bd  ! 515: ADDCcc_I	addccc 	%r16, 0x02bd, %r28
	.word 0x8c3c2c26  ! 515: XNOR_I	xnor 	%r16, 0x0c26, %r6
thr2_resum_intr_8:
!$EV trig_pc_d(2,expr(@VA(.MAIN.thr2_resum_intr_8), 16, 16)) -> intp(2, 3, 1)
	wr      %r0, 0x5, %asr26
thr2_irf_ce_28:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_28), 16, 16),1,IRF,ce,45,x, x,x,x, x,x,x)
	.word 0xca742805  ! 518: STX_I	stx	%r5, [%r16 + 0x0805]
	.word 0x9d342001  ! 520: SRL_I	srl 	%r16, 0x0001, %r14
	.word 0x96c40011  ! 520: ADDCcc_R	addccc 	%r16, %r17, %r11
	.word 0x8143e021  ! 520: MEMBAR	membar	#LoadLoad | #MemIssue 
	.word 0x99341011  ! 521: SRLX_R	srlx	%r16, %r17, %r12
	.word 0x973c2001  ! 523: SRA_I	sra 	%r16, 0x0001, %r11
	.word 0xb42c0011  ! 523: ANDN_R	andn 	%r16, %r17, %r26
thr2_resum_intr_9:
!$EV trig_pc_d(2,expr(@VA(.MAIN.thr2_resum_intr_9), 16, 16)) -> intp(2, 3, 1)
	wr      %r0, 0x5, %asr26
	.word 0xfe340011  ! 524: STH_R	sth	%r31, [%r16 + %r17]
	.word 0x98142fa4  ! 526: OR_I	or 	%r16, 0x0fa4, %r12
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xe6340011  ! 527: STH_R	sth	%r19, [%r16 + %r17]
	.word 0xb6dc0011  ! 529: SMULcc_R	smulcc 	%r16, %r17, %r27
	.word 0xf6240011  ! 530: STW_R	stw	%r27, [%r16 + %r17]
	.word 0x89528000  ! 532: RDPR_CANSAVE	<illegal instruction>
	.word 0xce2c0011  ! 533: STB_R	stb	%r7, [%r16 + %r17]
	.word 0x8c3c24bf  ! 535: XNOR_I	xnor 	%r16, 0x04bf, %r6
	.word 0x9b641811  ! 535: MOVcc_R	<illegal instruction>
	.word 0x82f42146  ! 535: UDIVcc_I	udivcc 	%r16, 0x0146, %r1
	.word 0xfe2c28c7  ! 537: STB_I	stb	%r31, [%r16 + 0x08c7]
	.word 0x937c0411  ! 539: MOVR_R	move	%r16, %r17, %r9
	.word 0x82842783  ! 539: ADDcc_I	addcc 	%r16, 0x0783, %r1
	.word 0x86b42e2c  ! 539: ORNcc_I	orncc 	%r16, 0x0e2c, %r3
	.word 0x26cc0003  ! 539: BRLZ	brlz,a,pt	%16,<label_0xc0003>
thr2_irf_ce_29:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_29), 16, 16),1,IRF,ce,14,x, x,x,x, x,x,x)
	.word 0xce74268f  ! 542: STX_I	stx	%r7, [%r16 + 0x068f]
	.word 0x0a800001  ! 544: BCS	bcs  	<label_0x1>
	.word 0x8884221b  ! 545: ADDcc_I	addcc 	%r16, 0x021b, %r4
	.word 0xbb2c3001  ! 547: SLLX_I	sllx	%r16, 0x0001, %r29
	.word 0xae840011  ! 547: ADDcc_R	addcc 	%r16, %r17, %r23
	.word 0xbb342001  ! 547: SRL_I	srl 	%r16, 0x0001, %r29
thr2_resum_intr_10:
!$EV trig_pc_d(2,expr(@VA(.MAIN.thr2_resum_intr_10), 16, 16)) -> intp(2, 3, 1)
	wr      %r0, 0x5, %asr26
	.word 0x82440011  ! 548: ADDC_R	addc 	%r16, %r17, %r1
	.word 0x92140011  ! 550: OR_R	or 	%r16, %r17, %r9
	.word 0x8143c000  ! 550: STBAR	stbar
	.word 0xb2342982  ! 551: SUBC_I	orn 	%r16, 0x0982, %r25
	.word 0x869c2dd7  ! 553: XORcc_I	xorcc 	%r16, 0x0dd7, %r3
	.word 0x9a2c2194  ! 553: ANDN_I	andn 	%r16, 0x0194, %r13
	.word 0x82c40011  ! 553: ADDCcc_R	addccc 	%r16, %r17, %r1
	.word 0x81880000  ! 553: RESTORED	saved
thr2_irf_ce_30:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_30), 16, 16),1,IRF,ce,2,x, x,x,x, x,x,x)
	.word 0xd0342f23  ! 556: STH_I	sth	%r8, [%r16 + 0x0f23]
	.word 0xb21c0011  ! 558: XOR_R	xor 	%r16, %r17, %r25
	.word 0xad7c2401  ! 558: MOVR_I	move	%r16, 0xfffffff8, %r22
	.word 0x81dc262d  ! 558: FLUSH_I	dis not found

	.word 0x8cb428d6  ! 559: ORNcc_I	orncc 	%r16, 0x08d6, %r6
	.word 0x88fc24a8  ! 561: SDIVcc_I	sdivcc 	%r16, 0x04a8, %r4
	.word 0xd624285f  ! 563: STW_I	stw	%r11, [%r16 + 0x085f]
	.word 0x0acc0003  ! 565: BRNZ	brnz  ,pt	%16,<label_0xc0003>
	.word 0xd6240011  ! 566: STW_R	stw	%r11, [%r16 + %r17]
	.word 0x923c0011  ! 568: XNOR_R	xnor 	%r16, %r17, %r9
	.word 0x8e2c2b0e  ! 568: ANDN_I	andn 	%r16, 0x0b0e, %r7
	.word 0x9d7c2401  ! 568: MOVR_I	move	%r16, 0xfffffff8, %r14
	.word 0x93534000  ! 568: RDPR_OTHERWIN	rdpr	%otherwin, %r9
	.word 0xd8740011  ! 569: STX_R	stx	%r12, [%r16 + %r17]
	.word 0xce142fd5  ! 571: LDUH_I	lduh	[%r16 + 0x0fd5], %r7
thr2_irf_ce_31:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_31), 16, 16),1,IRF,ce,8,x, x,x,x, x,x,x)
	.word 0xd62c29c1  ! 574: STB_I	stb	%r11, [%r16 + 0x09c1]
	.word 0x90940011  ! 576: ORcc_R	orcc 	%r16, %r17, %r8
	.word 0x82540011  ! 576: UMUL_R	umul 	%r16, %r17, %r1
	.word 0xe6342ed3  ! 578: STH_I	sth	%r19, [%r16 + 0x0ed3]
	.word 0xaa042562  ! 580: ADD_I	add 	%r16, 0x0562, %r21
	.word 0xce9c2591  ! 580: LDDA_I	ldda	[%r16, + 0x0591] %asi, %r7
	.word 0xc6240011  ! 581: STW_R	stw	%r3, [%r16 + %r17]
	.word 0x96bc0011  ! 583: XNORcc_R	xnorcc 	%r16, %r17, %r11
	.word 0x8ac40011  ! 583: ADDCcc_R	addccc 	%r16, %r17, %r5
	.word 0x992c0011  ! 583: SLL_R	sll 	%r16, %r17, %r12
thr2_resum_intr_11:
!$EV trig_pc_d(2,expr(@VA(.MAIN.thr2_resum_intr_11), 16, 16)) -> intp(2, 3, 1)
	wr      %r0, 0x5, %asr26
	.word 0xd62c0011  ! 584: STB_R	stb	%r11, [%r16 + %r17]
	.word 0xc67c2365  ! 586: SWAP_I	swap	%r3, [%r16 + 0x0365]
	.word 0xd0240011  ! 587: STW_R	stw	%r8, [%r16 + %r17]
	.word 0xa8342599  ! 589: ORN_I	orn 	%r16, 0x0599, %r20
	.word 0x9eac280e  ! 589: ANDNcc_I	andncc 	%r16, 0x080e, %r15
	.word 0x81dc0011  ! 589: FLUSH_R	dis not found

	.word 0xe4742173  ! 591: STX_I	stx	%r18, [%r16 + 0x0173]
	.word 0x38800001  ! 593: BGU	bgu,a	<label_0x1>
	.word 0xa8240011  ! 594: SUB_R	sub 	%r16, %r17, %r20
	.word 0x96340011  ! 596: ORN_R	orn 	%r16, %r17, %r11
	.word 0x9894275b  ! 596: ORcc_I	orcc 	%r16, 0x075b, %r12
	.word 0xd0b42ed4  ! 596: STHA_I	stha	%r8, [%r16 + 0x0ed4] %asi
	.word 0xee740011  ! 597: STX_R	stx	%r23, [%r16 + %r17]
        wr %g0, 0x4, %fprs
	.word 0xe4342bf5  ! 601: STH_I	sth	%r18, [%r16 + 0x0bf5]
	.word 0xba9c0011  ! 603: XORcc_R	xorcc 	%r16, %r17, %r29
	.word 0xba942705  ! 603: ORcc_I	orcc 	%r16, 0x0705, %r29
thr2_resum_intr_12:
!$EV trig_pc_d(2,expr(@VA(.MAIN.thr2_resum_intr_12), 16, 16)) -> intp(2, 3, 1)
	wr      %r0, 0x5, %asr26
	.word 0xec240011  ! 604: STW_R	stw	%r22, [%r16 + %r17]
	.word 0x91a40951  ! 606: FMULd	fmuld	%f16, %f48, %f8
	.word 0x99342001  ! 607: SRL_I	srl 	%r16, 0x0001, %r12
	.word 0x8e1c0011  ! 609: XOR_R	xor 	%r16, %r17, %r7
	.word 0xbd2c0011  ! 609: SLL_R	sll 	%r16, %r17, %r30
	.word 0x90b40011  ! 609: ORNcc_R	orncc 	%r16, %r17, %r8
thr2_resum_intr_13:
!$EV trig_pc_d(2,expr(@VA(.MAIN.thr2_resum_intr_13), 16, 16)) -> intp(2, 3, 1)
	wr      %r0, 0x5, %asr26
	.word 0xd2242c3f  ! 611: STW_I	stw	%r9, [%r16 + 0x0c3f]
	.word 0x96bc0011  ! 613: XNORcc_R	xnorcc 	%r16, %r17, %r11
	.word 0x94042507  ! 613: ADD_I	add 	%r16, 0x0507, %r10
	.word 0xb2c42a92  ! 613: ADDCcc_I	addccc 	%r16, 0x0a92, %r25
	.word 0xf2fc1011  ! 613: SWAPA_R	swapa	%r25, [%r16 + %r17] 0x80
	.word 0x82240011  ! 614: SUB_R	sub 	%r16, %r17, %r1
	.word 0x903c29f1  ! 616: XNOR_I	xnor 	%r16, 0x09f1, %r8
	.word 0xeed42cee  ! 616: LDSHA_I	ldsha	[%r16, + 0x0cee] %asi, %r23
	.word 0x8f7c2401  ! 617: MOVR_I	move	%r16, 0x7fffbdd8, %r7
	.word 0x89343001  ! 619: SRLX_I	srlx	%r16, 0x0001, %r4
thr2_resum_intr_14:
!$EV trig_pc_d(2,expr(@VA(.MAIN.thr2_resum_intr_14), 16, 16)) -> intp(2, 3, 1)
	wr      %r0, 0x5, %asr26
thr2_irf_ce_32:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_32), 16, 16),1,IRF,ce,43,x, x,x,x, x,x,x)
	.word 0xe42c28f3  ! 622: STB_I	stb	%r18, [%r16 + 0x08f3]
	.word 0x86040011  ! 624: ADD_R	add 	%r16, %r17, %r3
	.word 0xac842260  ! 624: ADDcc_I	addcc 	%r16, 0x0260, %r22
	.word 0x924c0011  ! 624: MULX_R	mulx 	%r16, %r17, %r9
	.word 0xc62c2359  ! 626: STB_I	stb	%r3, [%r16 + 0x0359]
	.word 0x99a01051  ! 628: FdTOx	dis not found

	.word 0x8f7c0411  ! 629: MOVR_R	move	%r16, %r17, %r7
	.word 0x9aac0011  ! 631: ANDNcc_R	andncc 	%r16, %r17, %r13
	.word 0x8c140011  ! 631: OR_R	or 	%r16, %r17, %r6
	.word 0xba4423ff  ! 631: ADDC_I	addc 	%r16, 0x03ff, %r29
	.word 0xb05c2399  ! 631: SMUL_I	smul 	%r16, 0x0399, %r24
	.word 0x8a342a9d  ! 632: ORN_I	orn 	%r16, 0x0a9d, %r5
	.word 0x8eac20e7  ! 634: ANDNcc_I	andncc 	%r16, 0x00e7, %r7
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xee740011  ! 635: STX_R	stx	%r23, [%r16 + %r17]
	ta	T_CHANGE_PRIV	! macro
	.word 0xee74271b  ! 639: STX_I	stx	%r23, [%r16 + 0x071b]
	.word 0x9c3c0011  ! 641: XNOR_R	xnor 	%r16, %r17, %r14
	ta	T_CHANGE_NONPRIV	! macro
thr2_irf_ce_33:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_33), 16, 16),1,IRF,ce,46,x, x,x,x, x,x,x)
	.word 0xe8242efd  ! 644: STW_I	stw	%r20, [%r16 + 0x0efd]
	.word 0xb83c2388  ! 646: XNOR_I	xnor 	%r16, 0x0388, %r28
	.word 0xba9c0011  ! 646: XORcc_R	xorcc 	%r16, %r17, %r29
	.word 0x912c1011  ! 646: SLLX_R	sllx	%r16, %r17, %r8
	.word 0x84dc2c37  ! 646: SMULcc_I	smulcc 	%r16, 0x0c37, %r2
	.word 0x8a040011  ! 647: ADD_R	add 	%r16, %r17, %r5
	.word 0x98b40011  ! 649: ORNcc_R	orncc 	%r16, %r17, %r12
	ta	T_CHANGE_PRIV	! macro
	.word 0xb3340011  ! 650: SRL_R	srl 	%r16, %r17, %r25
	.word 0x89341011  ! 652: SRLX_R	srlx	%r16, %r17, %r4
	.word 0xdad42313  ! 652: LDSHA_I	ldsha	[%r16, + 0x0313] %asi, %r13
	.word 0xd2742d0b  ! 654: STX_I	stx	%r9, [%r16 + 0x0d0b]
	.word 0xa7641811  ! 656: MOVcc_R	<illegal instruction>
	.word 0x988c2a4b  ! 656: ANDcc_I	andcc 	%r16, 0x0a4b, %r12
	.word 0xcabc2f8b  ! 656: STDA_I	stda	%r5, [%r16 + 0x0f8b] %asi
	.word 0x8a2c2c40  ! 657: ANDN_I	andn 	%r16, 0x0c40, %r5
	.word 0x9c3c279f  ! 659: XNOR_I	xnor 	%r16, 0x079f, %r14
	.word 0x877c2401  ! 659: MOVR_I	move	%r16, 0xfffffff8, %r3
thr2_resum_intr_15:
!$EV trig_pc_d(2,expr(@VA(.MAIN.thr2_resum_intr_15), 16, 16)) -> intp(2, 3, 1)
	wr      %r0, 0x5, %asr26
	.word 0xf2740011  ! 660: STX_R	stx	%r25, [%r16 + %r17]
	.word 0xe4542b8d  ! 662: LDSH_I	ldsh	[%r16 + 0x0b8d], %r18
	.word 0x9b7c2401  ! 663: MOVR_I	move	%r16, 0x7fffbdd8, %r13
	.word 0xab342001  ! 665: SRL_I	srl 	%r16, 0x0001, %r21
	.word 0x8b2c0011  ! 665: SLL_R	sll 	%r16, %r17, %r5
	.word 0x81580000  ! 665: FLUSHW	flushw
	.word 0xca2c0011  ! 666: STB_R	stb	%r5, [%r16 + %r17]
	.word 0x953c0011  ! 668: SRA_R	sra 	%r16, %r17, %r10
thr2_resum_intr_16:
!$EV trig_pc_d(2,expr(@VA(.MAIN.thr2_resum_intr_16), 16, 16)) -> intp(2, 3, 1)
	wr      %r0, 0x5, %asr26
	.word 0xd2340011  ! 669: STH_R	sth	%r9, [%r16 + %r17]
thr2_resum_intr_17:
!$EV trig_pc_d(2,expr(@VA(.MAIN.thr2_resum_intr_17), 16, 16)) -> intp(2, 3, 1)
	wr      %r0, 0x5, %asr26
thr2_irf_ce_34:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_34), 16, 16),1,IRF,ce,32,x, x,x,x, x,x,x)
	.word 0xc8742f39  ! 674: STX_I	stx	%r4, [%r16 + 0x0f39]
	.word 0x94040011  ! 676: ADD_R	add 	%r16, %r17, %r10
	.word 0xa7342001  ! 676: SRL_I	srl 	%r16, 0x0001, %r19
	.word 0x988c0011  ! 676: ANDcc_R	andcc 	%r16, %r17, %r12
	.word 0x8f480000  ! 676: RDHPR_HPSTATE	rdhpr	%hpstate, %r7
	.word 0xb2bc26e1  ! 677: XNORcc_I	xnorcc 	%r16, 0x06e1, %r25
	.word 0x88440011  ! 679: ADDC_R	addc 	%r16, %r17, %r4
	.word 0x9e9c0011  ! 679: XORcc_R	xorcc 	%r16, %r17, %r15
	.word 0x84040011  ! 679: ADD_R	add 	%r16, %r17, %r2
	.word 0xf6f420f0  ! 679: STXA_I	stxa	%r27, [%r16 + 0x00f0] %asi
	.word 0xb3340011  ! 680: SRL_R	srl 	%r16, %r17, %r25
	.word 0x9ad40011  ! 682: UMULcc_R	umulcc 	%r16, %r17, %r13
	.word 0xd8242993  ! 684: STW_I	stw	%r12, [%r16 + 0x0993]
	.word 0x8d641811  ! 686: MOVcc_R	<illegal instruction>
	.word 0xb4bc243e  ! 686: XNORcc_I	xnorcc 	%r16, 0x043e, %r26
	.word 0xb152c000  ! 686: RDPR_CANRESTORE	rdpr	%canrestore, %r24
thr2_irf_ce_35:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_35), 16, 16),1,IRF,ce,51,x, x,x,x, x,x,x)
	.word 0xde742617  ! 689: STX_I	stx	%r15, [%r16 + 0x0617]
	.word 0x92ac0011  ! 691: ANDNcc_R	andncc 	%r16, %r17, %r9
	.word 0xb68421e9  ! 691: ADDcc_I	addcc 	%r16, 0x01e9, %r27
	.word 0x8bec0011  ! 691: RESTORE_R	restore	%r16, %r17, %r5
thr2_irf_ce_36:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_36), 16, 16),1,IRF,ce,70,x, x,x,x, x,x,x)
	.word 0xec2c2257  ! 694: STB_I	stb	%r22, [%r16 + 0x0257]
	.word 0xc47c24c0  ! 696: SWAP_I	swap	%r2, [%r16 + 0x04c0]
	.word 0xc8742f11  ! 698: STX_I	stx	%r4, [%r16 + 0x0f11]
	.word 0xca7c0011  ! 700: SWAP_R	swap	%r5, [%r16 + %r17]
	.word 0xd2342e13  ! 702: STH_I	sth	%r9, [%r16 + 0x0e13]
	.word 0xba440011  ! 704: ADDC_R	addc 	%r16, %r17, %r29
	.word 0x9aac0011  ! 704: ANDNcc_R	andncc 	%r16, %r17, %r13
	.word 0x8e0c27d7  ! 704: AND_I	and 	%r16, 0x07d7, %r7
	.word 0x9cd40011  ! 704: UMULcc_R	umulcc 	%r16, %r17, %r14
	.word 0xb83c0011  ! 705: XNOR_R	xnor 	%r16, %r17, %r28
	.word 0x942c0011  ! 707: ANDN_R	andn 	%r16, %r17, %r10
	.word 0xb12c3001  ! 707: SLLX_I	sllx	%r16, 0x0001, %r24
	.word 0x903c22ef  ! 707: XNOR_I	xnor 	%r16, 0x02ef, %r8
	.word 0x8143e043  ! 707: MEMBAR	membar	#LoadLoad | #StoreLoad | #Sync 
thr2_irf_ce_37:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_37), 16, 16),1,IRF,ce,34,x, x,x,x, x,x,x)
	.word 0xde2427f9  ! 710: STW_I	stw	%r15, [%r16 + 0x07f9]
	.word 0x81880000  ! 712: SAVED	saved
	.word 0x840c2d14  ! 713: AND_I	and 	%r16, 0x0d14, %r2
	.word 0xaabc0011  ! 715: XNORcc_R	xnorcc 	%r16, %r17, %r21
	.word 0xb47c275a  ! 715: SDIV_I	sdiv 	%r16, 0x075a, %r26
thr2_irf_ce_38:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_38), 16, 16),1,IRF,ce,7,x, x,x,x, x,x,x)
	.word 0xd03424eb  ! 718: STH_I	sth	%r8, [%r16 + 0x04eb]
	.word 0x97343001  ! 720: SRLX_I	srlx	%r16, 0x0001, %r11
	.word 0xa92c3001  ! 720: SLLX_I	sllx	%r16, 0x0001, %r20
	.word 0x968c21ff  ! 720: ANDcc_I	andcc 	%r16, 0x01ff, %r11
	.word 0xf3e41011  ! 720: CASA_I	casa	[%r16] 0x80, %r17, %r25
thr2_irf_ce_39:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_39), 16, 16),1,IRF,ce,20,x, x,x,x, x,x,x)
	.word 0xd2742a47  ! 723: STX_I	stx	%r9, [%r16 + 0x0a47]
	.word 0xa4442287  ! 725: ADDC_I	addc 	%r16, 0x0287, %r18
	.word 0xae940011  ! 725: ORcc_R	orcc 	%r16, %r17, %r23
	.word 0xbd53c000  ! 725: RDPR_FQ	<illegal instruction>
	.word 0x9c042095  ! 726: ADD_I	add 	%r16, 0x0095, %r14
	.word 0x94bc2fca  ! 728: XNORcc_I	xnorcc 	%r16, 0x0fca, %r10
	.word 0x8a4c21f7  ! 728: MULX_I	mulx 	%r16, 0x01f7, %r5
	.word 0xf8242f83  ! 730: STW_I	stw	%r28, [%r16 + 0x0f83]
	.word 0x8a2c0011  ! 732: ANDN_R	andn 	%r16, %r17, %r5
	.word 0xd26c0011  ! 732: LDSTUB_R	ldstub	%r9, [%r16 + %r17]
	.word 0xcc742b63  ! 734: STX_I	stx	%r6, [%r16 + 0x0b63]
	.word 0x952c3001  ! 736: SLLX_I	sllx	%r16, 0x0001, %r10
	.word 0x8f340011  ! 736: SRL_R	srl 	%r16, %r17, %r7
	.word 0xcc942581  ! 736: LDUHA_I	lduha	[%r16, + 0x0581] %asi, %r6
	.word 0x86340011  ! 737: SUBC_R	orn 	%r16, %r17, %r3
	.word 0xb4840011  ! 739: ADDcc_R	addcc 	%r16, %r17, %r26
	.word 0x933c0011  ! 739: SRA_R	sra 	%r16, %r17, %r9
	.word 0xd4fc1011  ! 739: SWAPA_R	swapa	%r10, [%r16 + %r17] 0x80
	.word 0xe42c2f83  ! 741: STB_I	stb	%r18, [%r16 + 0x0f83]
	.word 0xb44c0011  ! 743: MULX_R	mulx 	%r16, %r17, %r26
	.word 0xe6240011  ! 744: STW_R	stw	%r19, [%r16 + %r17]
	.word 0xbf7c0411  ! 746: MOVR_R	move	%r16, %r17, %r31
	.word 0xd2fc1011  ! 746: SWAPA_R	swapa	%r9, [%r16 + %r17] 0x80
	.word 0x87340011  ! 747: SRL_R	srl 	%r16, %r17, %r3
	.word 0xa49428d6  ! 749: ORcc_I	orcc 	%r16, 0x08d6, %r18
	.word 0xb6ac2c22  ! 749: ANDNcc_I	andncc 	%r16, 0x0c22, %r27
thr2_resum_intr_18:
!$EV trig_pc_d(2,expr(@VA(.MAIN.thr2_resum_intr_18), 16, 16)) -> intp(2, 3, 1)
	wr      %r0, 0x5, %asr26
	.word 0xd8242261  ! 751: STW_I	stw	%r12, [%r16 + 0x0261]
	.word 0xb22c0011  ! 753: ANDN_R	andn 	%r16, %r17, %r25
	.word 0x99520000  ! 753: RDPR_PIL	rdpr	%pil, %r12
thr2_irf_ce_40:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_40), 16, 16),1,IRF,ce,62,x, x,x,x, x,x,x)
	.word 0xd8742215  ! 756: STX_I	stx	%r12, [%r16 + 0x0215]
	.word 0x98840011  ! 758: ADDcc_R	addcc 	%r16, %r17, %r12
	.word 0x9e942222  ! 758: ORcc_I	orcc 	%r16, 0x0222, %r15
	.word 0x81dc2c33  ! 758: FLUSH_I	dis not found

	.word 0xf4242a69  ! 760: STW_I	stw	%r26, [%r16 + 0x0a69]
	.word 0x972c1011  ! 762: SLLX_R	sllx	%r16, %r17, %r11
	.word 0x9c9c0011  ! 762: XORcc_R	xorcc 	%r16, %r17, %r14
	.word 0xbe94240c  ! 762: ORcc_I	orcc 	%r16, 0x040c, %r31
	.word 0x97418000  ! 762: RDFPRS	rd	%fprs, %r11
thr2_irf_ce_41:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_41), 16, 16),1,IRF,ce,67,x, x,x,x, x,x,x)
	.word 0xe62c2099  ! 765: STB_I	stb	%r19, [%r16 + 0x0099]
	.word 0x8143c000  ! 767: STBAR	stbar
	.word 0x83340011  ! 768: SRL_R	srl 	%r16, %r17, %r1
	.word 0x892c0011  ! 770: SLL_R	sll 	%r16, %r17, %r4
	.word 0xee0c2feb  ! 770: LDUB_I	ldub	[%r16 + 0x0feb], %r23
	.word 0xec2c0011  ! 771: STB_R	stb	%r22, [%r16 + %r17]
	.word 0xaf2c2001  ! 773: SLL_I	sll 	%r16, 0x0001, %r23
	.word 0x857c0411  ! 773: MOVR_R	move	%r16, %r17, %r2
	.word 0x24800003  ! 773: BLE	ble,a	<label_0x3>
	.word 0xc62c0011  ! 774: STB_R	stb	%r3, [%r16 + %r17]
        wr %g0, 0x4, %fprs
	.word 0xc22423c5  ! 778: STW_I	stw	%r1, [%r16 + 0x03c5]
	.word 0x9f3c0011  ! 780: SRA_R	sra 	%r16, %r17, %r15
	.word 0xbcb420e6  ! 780: ORNcc_I	orncc 	%r16, 0x00e6, %r30
	.word 0x949c0011  ! 780: XORcc_R	xorcc 	%r16, %r17, %r10
	.word 0x8143c000  ! 780: STBAR	stbar
thr2_irf_ce_42:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_42), 16, 16),1,IRF,ce,3,x, x,x,x, x,x,x)
	.word 0xcc742ce1  ! 783: STX_I	stx	%r6, [%r16 + 0x0ce1]
	.word 0x9a440011  ! 785: ADDC_R	addc 	%r16, %r17, %r13
	.word 0x81580000  ! 785: FLUSHW	flushw
	.word 0xc2240011  ! 786: STW_R	stw	%r1, [%r16 + %r17]
	.word 0xbb7c0411  ! 788: MOVR_R	move	%r16, %r17, %r29
	.word 0xa8bc0011  ! 788: XNORcc_R	xnorcc 	%r16, %r17, %r20
	.word 0xb33c1011  ! 788: SRAX_R	srax	%r16, %r17, %r25
	.word 0x987c0011  ! 788: SDIV_R	sdiv 	%r16, %r17, %r12
	.word 0x8b2c1011  ! 789: SLLX_R	sllx	%r16, %r17, %r5
	.word 0xa8c40011  ! 791: ADDCcc_R	addccc 	%r16, %r17, %r20
	.word 0xb7342001  ! 791: SRL_I	srl 	%r16, 0x0001, %r27
	.word 0xb86c249b  ! 791: UDIVX_I	udivx 	%r16, 0x049b, %r28
thr2_irf_ce_43:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_43), 16, 16),1,IRF,ce,60,x, x,x,x, x,x,x)
	.word 0xce342623  ! 794: STH_I	sth	%r7, [%r16 + 0x0623]
	.word 0x94c40011  ! 796: ADDCcc_R	addccc 	%r16, %r17, %r10
	.word 0x81880000  ! 796: RESTORED	saved
	.word 0xde2c2fcf  ! 798: STB_I	stb	%r15, [%r16 + 0x0fcf]
	.word 0xb6040011  ! 800: ADD_R	add 	%r16, %r17, %r27
	.word 0x9884247c  ! 800: ADDcc_I	addcc 	%r16, 0x047c, %r12
	.word 0x82542478  ! 800: UMUL_I	umul 	%r16, 0x0478, %r1
	.word 0x9a940011  ! 801: ORcc_R	orcc 	%r16, %r17, %r13
	.word 0xa52c0011  ! 803: SLL_R	sll 	%r16, %r17, %r18
	.word 0x8cbc0011  ! 803: XNORcc_R	xnorcc 	%r16, %r17, %r6
	.word 0xc3ec2961  ! 803: PREFETCHA_I	prefetcha	[%r16, + 0x0961] %asi, #one_read
	.word 0x89340011  ! 804: SRL_R	srl 	%r16, %r17, %r4
	.word 0x83340011  ! 806: SRL_R	srl 	%r16, %r17, %r1
	.word 0x917c2401  ! 806: MOVR_I	move	%r16, 0xfffffff8, %r8
	.word 0xaa3c0011  ! 806: XNOR_R	xnor 	%r16, %r17, %r21
	.word 0x81880000  ! 806: RESTORED	saved
thr2_irf_ce_44:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_44), 16, 16),1,IRF,ce,20,x, x,x,x, x,x,x)
	.word 0xce3425ab  ! 809: STH_I	sth	%r7, [%r16 + 0x05ab]
	.word 0xb7342001  ! 811: SRL_I	srl 	%r16, 0x0001, %r27
	.word 0x960c0011  ! 811: AND_R	and 	%r16, %r17, %r11
	.word 0x9a140011  ! 811: OR_R	or 	%r16, %r17, %r13
	.word 0x81580000  ! 811: FLUSHW	flushw
thr2_irf_ce_45:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_45), 16, 16),1,IRF,ce,13,x, x,x,x, x,x,x)
	.word 0xee342341  ! 814: STH_I	sth	%r23, [%r16 + 0x0341]
	.word 0xb12c2001  ! 816: SLL_I	sll 	%r16, 0x0001, %r24
	.word 0x8143c000  ! 816: STBAR	stbar
	.word 0xda2c0011  ! 817: STB_R	stb	%r13, [%r16 + %r17]
	.word 0xb72c0011  ! 819: SLL_R	sll 	%r16, %r17, %r27
        wr %g0, 0x4, %fprs
	.word 0xee240011  ! 820: STW_R	stw	%r23, [%r16 + %r17]
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa82c0011  ! 823: ANDN_R	andn 	%r16, %r17, %r20
	.word 0x9b530000  ! 825: RDPR_CLEANWIN	rdpr	%cleanwin, %r13
	.word 0xc2340011  ! 826: STH_R	sth	%r1, [%r16 + %r17]
	.word 0xab2c3001  ! 828: SLLX_I	sllx	%r16, 0x0001, %r21
	.word 0xae040011  ! 828: ADD_R	add 	%r16, %r17, %r23
	.word 0xc36c2357  ! 828: PREFETCH_I	prefetch	[%r16 + 0x0357], #one_read
	.word 0xc6740011  ! 829: STX_R	stx	%r3, [%r16 + %r17]
	.word 0x9d2c2001  ! 831: SLL_I	sll 	%r16, 0x0001, %r14
	.word 0xa81c2759  ! 831: XOR_I	xor 	%r16, 0x0759, %r20
	.word 0xa8542f79  ! 831: UMUL_I	umul 	%r16, 0x0f79, %r20
thr2_irf_ce_46:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_46), 16, 16),1,IRF,ce,49,x, x,x,x, x,x,x)
	.word 0xc22423c9  ! 834: STW_I	stw	%r1, [%r16 + 0x03c9]
	.word 0xf2bc1011  ! 836: STDA_R	stda	%r25, [%r16 + %r17] 0x80
	.word 0xca240011  ! 837: STW_R	stw	%r5, [%r16 + %r17]
	.word 0xb1343001  ! 839: SRLX_I	srlx	%r16, 0x0001, %r24
	.word 0xbb342001  ! 839: SRL_I	srl 	%r16, 0x0001, %r29
	.word 0xd2140011  ! 839: LDUH_R	lduh	[%r16 + %r17], %r9
	.word 0xea2c2387  ! 841: STB_I	stb	%r21, [%r16 + 0x0387]
	.word 0xbf342001  ! 843: SRL_I	srl 	%r16, 0x0001, %r31
	.word 0xb92c0011  ! 843: SLL_R	sll 	%r16, %r17, %r28
	.word 0x8e840011  ! 843: ADDcc_R	addcc 	%r16, %r17, %r7
	.word 0xc36c22dc  ! 843: PREFETCH_I	prefetch	[%r16 + 0x02dc], #one_read
thr2_irf_ce_47:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_47), 16, 16),1,IRF,ce,71,x, x,x,x, x,x,x)
	.word 0xe634223b  ! 846: STH_I	sth	%r19, [%r16 + 0x023b]
	.word 0xaf3c0011  ! 848: SRA_R	sra 	%r16, %r17, %r23
	.word 0x963c0011  ! 848: XNOR_R	xnor 	%r16, %r17, %r11
	.word 0xa62c2834  ! 848: ANDN_I	andn 	%r16, 0x0834, %r19
	.word 0xad534000  ! 848: RDPR_OTHERWIN	<illegal instruction>
	.word 0x82240011  ! 849: SUB_R	sub 	%r16, %r17, %r1
	.word 0x981c0011  ! 851: XOR_R	xor 	%r16, %r17, %r12
	.word 0xb00c0011  ! 851: AND_R	and 	%r16, %r17, %r24
	.word 0xd8bc1011  ! 851: STDA_R	stda	%r12, [%r16 + %r17] 0x80
	.word 0x9e340011  ! 852: ORN_R	orn 	%r16, %r17, %r15
	.word 0x81dc2a78  ! 854: FLUSH_I	dis not found

	.word 0xf2740011  ! 855: STX_R	stx	%r25, [%r16 + %r17]
	.word 0x9e1c0011  ! 857: XOR_R	xor 	%r16, %r17, %r15
	.word 0x88bc27cf  ! 857: XNORcc_I	xnorcc 	%r16, 0x07cf, %r4
	.word 0xc36c0011  ! 857: PREFETCH_R	prefetch	[%r16 + %r17], #one_read
thr2_irf_ce_48:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_48), 16, 16),1,IRF,ce,61,x, x,x,x, x,x,x)
	.word 0xf22c2531  ! 860: STB_I	stb	%r25, [%r16 + 0x0531]
	.word 0xf6042bc5  ! 862: LDUW_I	lduw	[%r16 + 0x0bc5], %r27
thr2_irf_ce_49:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_49), 16, 16),1,IRF,ce,18,x, x,x,x, x,x,x)
	.word 0xee742305  ! 865: STX_I	stx	%r23, [%r16 + 0x0305]
	.word 0x85341011  ! 867: SRLX_R	srlx	%r16, %r17, %r2
thr2_resum_intr_19:
!$EV trig_pc_d(2,expr(@VA(.MAIN.thr2_resum_intr_19), 16, 16)) -> intp(2, 3, 1)
	wr      %r0, 0x5, %asr26
	.word 0xde242255  ! 869: STW_I	stw	%r15, [%r16 + 0x0255]
	.word 0xbc440011  ! 871: ADDC_R	addc 	%r16, %r17, %r30
	.word 0xbd342001  ! 871: SRL_I	srl 	%r16, 0x0001, %r30
	.word 0x96b40011  ! 871: ORNcc_R	orncc 	%r16, %r17, %r11
	.word 0xd4142d98  ! 871: LDUH_I	lduh	[%r16 + 0x0d98], %r10
	.word 0xc6742101  ! 873: STX_I	stx	%r3, [%r16 + 0x0101]
	.word 0x8143e053  ! 875: MEMBAR	membar	#LoadLoad | #StoreLoad | #Lookaside | #Sync 
	.word 0xc62420ef  ! 877: STW_I	stw	%r3, [%r16 + 0x00ef]
	.word 0xbe842996  ! 879: ADDcc_I	addcc 	%r16, 0x0996, %r31
	.word 0x8143c000  ! 879: STBAR	stbar
	.word 0xf6242dbb  ! 881: STW_I	stw	%r27, [%r16 + 0x0dbb]
	.word 0x888c0011  ! 883: ANDcc_R	andcc 	%r16, %r17, %r4
	.word 0xd8bc213c  ! 883: STDA_I	stda	%r12, [%r16 + 0x013c] %asi
	.word 0xa43c27b9  ! 884: XNOR_I	xnor 	%r16, 0x07b9, %r18
	.word 0x8bec0011  ! 886: RESTORE_R	restore	%r16, %r17, %r5
	.word 0xda240011  ! 887: STW_R	stw	%r13, [%r16 + %r17]
	.word 0x8d341011  ! 889: SRLX_R	srlx	%r16, %r17, %r6
	.word 0xbd2c3001  ! 889: SLLX_I	sllx	%r16, 0x0001, %r30
	.word 0xaf343001  ! 889: SRLX_I	srlx	%r16, 0x0001, %r23
	.word 0xc3ec2437  ! 889: PREFETCHA_I	prefetcha	[%r16, + 0x0437] %asi, #one_read
	.word 0xe6340011  ! 890: STH_R	sth	%r19, [%r16 + %r17]
thr2_resum_intr_20:
!$EV trig_pc_d(2,expr(@VA(.MAIN.thr2_resum_intr_20), 16, 16)) -> intp(2, 3, 1)
	wr      %r0, 0x5, %asr26
	.word 0xb17c2401  ! 893: MOVR_I	move	%r16, 0x7fffbdd8, %r24
	.word 0x832c2001  ! 895: SLL_I	sll 	%r16, 0x0001, %r1
	.word 0x9e6c275c  ! 895: UDIVX_I	udivx 	%r16, 0x075c, %r15
	.word 0xe6340011  ! 896: STH_R	sth	%r19, [%r16 + %r17]
	.word 0x9e940011  ! 898: ORcc_R	orcc 	%r16, %r17, %r15
	.word 0x889c2746  ! 898: XORcc_I	xorcc 	%r16, 0x0746, %r4
	.word 0x9b342001  ! 898: SRL_I	srl 	%r16, 0x0001, %r13
	ta	T_CHANGE_HPRIV	! macro
thr2_irf_ce_50:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_50), 16, 16),1,IRF,ce,47,x, x,x,x, x,x,x)
	.word 0xe43427e3  ! 901: STH_I	sth	%r18, [%r16 + 0x07e3]
	.word 0x952c2001  ! 903: SLL_I	sll 	%r16, 0x0001, %r10
	.word 0xbc3c2172  ! 903: XNOR_I	xnor 	%r16, 0x0172, %r30
	.word 0x8a0c0011  ! 903: AND_R	and 	%r16, %r17, %r5
	.word 0x81dc24c5  ! 903: FLUSH_I	dis not found

	.word 0xc4740011  ! 904: STX_R	stx	%r2, [%r16 + %r17]
	.word 0x902c2a95  ! 906: ANDN_I	andn 	%r16, 0x0a95, %r8
thr2_resum_intr_21:
!$EV trig_pc_d(2,expr(@VA(.MAIN.thr2_resum_intr_21), 16, 16)) -> intp(2, 3, 1)
	wr      %r0, 0x5, %asr26
	.word 0xde24235f  ! 908: STW_I	stw	%r15, [%r16 + 0x035f]
	.word 0x92442913  ! 910: ADDC_I	addc 	%r16, 0x0913, %r9
	.word 0x9e940011  ! 910: ORcc_R	orcc 	%r16, %r17, %r15
	.word 0x90042fa2  ! 910: ADD_I	add 	%r16, 0x0fa2, %r8
	ta	T_CHANGE_HPRIV	! macro
	.word 0xcc2c0011  ! 911: STB_R	stb	%r6, [%r16 + %r17]
	.word 0x8b2c1011  ! 913: SLLX_R	sllx	%r16, %r17, %r5
	.word 0xa4040011  ! 913: ADD_R	add 	%r16, %r17, %r18
	.word 0xb93c0011  ! 913: SRA_R	sra 	%r16, %r17, %r28
	.word 0xdea41011  ! 913: STWA_R	stwa	%r15, [%r16 + %r17] 0x80
	.word 0x86340011  ! 914: ORN_R	orn 	%r16, %r17, %r3
	.word 0xbb2c1011  ! 916: SLLX_R	sllx	%r16, %r17, %r29
	.word 0x81580000  ! 916: FLUSHW	flushw
	.word 0x8e1c0011  ! 917: XOR_R	xor 	%r16, %r17, %r7
	.word 0x8d840011  ! 919: WRFPRS_R	wr	%r16, %r17, %fprs
	.word 0xfa24251f  ! 921: STW_I	stw	%r29, [%r16 + 0x051f]
	.word 0xbc3c206b  ! 923: XNOR_I	xnor 	%r16, 0x006b, %r30
	.word 0x90840011  ! 923: ADDcc_R	addcc 	%r16, %r17, %r8
	.word 0x977c2401  ! 923: MOVR_I	move	%r16, 0xfffffff8, %r11
	.word 0x8143e009  ! 923: MEMBAR	membar	#LoadLoad | #StoreStore 
	.word 0xfe2c28f7  ! 925: STB_I	stb	%r31, [%r16 + 0x08f7]
	.word 0xb89c0011  ! 927: XORcc_R	xorcc 	%r16, %r17, %r28
	.word 0xb81c0011  ! 927: XOR_R	xor 	%r16, %r17, %r28
        wr %g0, 0x4, %fprs
	.word 0xfa240011  ! 928: STW_R	stw	%r29, [%r16 + %r17]
	.word 0x81dc20cb  ! 930: FLUSH_I	dis not found

thr2_irf_ce_51:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_51), 16, 16),1,IRF,ce,66,x, x,x,x, x,x,x)
	.word 0xd82c24ed  ! 933: STB_I	stb	%r12, [%r16 + 0x04ed]
	.word 0x81580000  ! 935: FLUSHW	flushw
	.word 0xd83426e5  ! 937: STH_I	sth	%r12, [%r16 + 0x06e5]
	.word 0xbb240011  ! 939: MULScc_R	mulscc 	%r16, %r17, %r29
	.word 0xda2c2f35  ! 941: STB_I	stb	%r13, [%r16 + 0x0f35]
	.word 0xb69c2e76  ! 943: XORcc_I	xorcc 	%r16, 0x0e76, %r27
	.word 0xbc2c0011  ! 943: ANDN_R	andn 	%r16, %r17, %r30
	.word 0xa7340011  ! 943: SRL_R	srl 	%r16, %r17, %r19
	.word 0xe4ec22c3  ! 943: LDSTUBA_I	ldstuba	%r18, [%r16 + 0x02c3] %asi
thr2_irf_ce_52:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_52), 16, 16),1,IRF,ce,37,x, x,x,x, x,x,x)
	.word 0xd8242be9  ! 946: STW_I	stw	%r12, [%r16 + 0x0be9]
	.word 0xde7c2e5e  ! 948: SWAP_I	swap	%r15, [%r16 + 0x0e5e]
	.word 0x8d343001  ! 949: SRLX_I	srlx	%r16, 0x0001, %r6
	.word 0x8d2c0011  ! 951: SLL_R	sll 	%r16, %r17, %r6
	.word 0xbcb40011  ! 951: ORNcc_R	orncc 	%r16, %r17, %r30
	.word 0xfabc1011  ! 951: STDA_R	stda	%r29, [%r16 + %r17] 0x80
thr2_irf_ce_53:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_53), 16, 16),1,IRF,ce,44,x, x,x,x, x,x,x)
	.word 0xf0742e33  ! 954: STX_I	stx	%r24, [%r16 + 0x0e33]
	.word 0xc36c2e99  ! 956: PREFETCH_I	prefetch	[%r16 + 0x0e99], #one_read
	.word 0xda2c0011  ! 957: STB_R	stb	%r13, [%r16 + %r17]
	.word 0x9c140011  ! 959: OR_R	or 	%r16, %r17, %r14
	.word 0x8a342dfe  ! 959: ORN_I	orn 	%r16, 0x0dfe, %r5
	.word 0x8143c000  ! 959: STBAR	stbar
	.word 0xdc2c0011  ! 960: STB_R	stb	%r14, [%r16 + %r17]
	.word 0x9c842c12  ! 962: ADDcc_I	addcc 	%r16, 0x0c12, %r14
	ta	T_CHANGE_NONHPRIV	! macro
thr2_irf_ce_54:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_54), 16, 16),1,IRF,ce,39,x, x,x,x, x,x,x)
	.word 0xd62c2093  ! 965: STB_I	stb	%r11, [%r16 + 0x0093]
	.word 0x81880000  ! 967: SAVED	saved
thr2_irf_ce_55:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_55), 16, 16),1,IRF,ce,29,x, x,x,x, x,x,x)
	.word 0xd634218f  ! 970: STH_I	sth	%r11, [%r16 + 0x018f]
	.word 0x95343001  ! 972: SRLX_I	srlx	%r16, 0x0001, %r10
	.word 0xbcac0011  ! 972: ANDNcc_R	andncc 	%r16, %r17, %r30
	.word 0x837c0411  ! 972: MOVR_R	move	%r16, %r17, %r1
        wr %g0, 0x4, %fprs
thr2_irf_ce_56:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_56), 16, 16),1,IRF,ce,4,x, x,x,x, x,x,x)
	.word 0xe624226d  ! 975: STW_I	stw	%r19, [%r16 + 0x026d]
	.word 0x8a0c2f5e  ! 977: AND_I	and 	%r16, 0x0f5e, %r5
	.word 0xbf2c0011  ! 977: SLL_R	sll 	%r16, %r17, %r31
	.word 0x9e940011  ! 977: ORcc_R	orcc 	%r16, %r17, %r15
	.word 0xec1427f0  ! 977: LDUH_I	lduh	[%r16 + 0x07f0], %r22
	.word 0xdc2c0011  ! 978: STB_R	stb	%r14, [%r16 + %r17]
	.word 0x8143c000  ! 980: STBAR	stbar
	.word 0xd47427b7  ! 982: STX_I	stx	%r10, [%r16 + 0x07b7]
	.word 0x96b42a20  ! 984: ORNcc_I	orncc 	%r16, 0x0a20, %r11
	.word 0xae040011  ! 984: ADD_R	add 	%r16, %r17, %r23
	.word 0xdc5c0011  ! 984: LDX_R	ldx	[%r16 + %r17], %r14
	.word 0xd8340011  ! 985: STH_R	sth	%r12, [%r16 + %r17]
	.word 0xbb7c0411  ! 987: MOVR_R	move	%r16, %r17, %r29
	.word 0x08800001  ! 987: BLEU	bleu  	<label_0x1>
	.word 0xf0342049  ! 989: STH_I	sth	%r24, [%r16 + 0x0049]
	.word 0xbc9c23a0  ! 991: XORcc_I	xorcc 	%r16, 0x03a0, %r30
	.word 0x96940011  ! 991: ORcc_R	orcc 	%r16, %r17, %r11
	.word 0x8c94298a  ! 991: ORcc_I	orcc 	%r16, 0x098a, %r6
	.word 0x8d840011  ! 991: WRFPRS_R	wr	%r16, %r17, %fprs
thr2_irf_ce_57:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_57), 16, 16),1,IRF,ce,54,x, x,x,x, x,x,x)
	.word 0xc42c2ca7  ! 994: STB_I	stb	%r2, [%r16 + 0x0ca7]
	.word 0xa8140011  ! 996: OR_R	or 	%r16, %r17, %r20
	.word 0x81880000  ! 996: RESTORED	saved
	.word 0xc6742cfb  ! 998: STX_I	stx	%r3, [%r16 + 0x0cfb]
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
        setx  0x0000000000000f70, %g1, %r17
        setx  0x51c67a152cb8e213, %g1, %r0
        setx  0x6e269b42e68715f2, %g1, %r1
        setx  0x307ee9305b20054a, %g1, %r2
        setx  0xebfdf07086bd1b89, %g1, %r3
        setx  0xefab61ca67cdeccc, %g1, %r4
        setx  0xc954e3ab7febed78, %g1, %r5
        setx  0x570f1e0be2341ac8, %g1, %r6
        setx  0x66958e84849fbd2f, %g1, %r7
        setx  0x98a7ed8c27511c14, %g1, %r8
        setx  0xba5726cdfee48fb3, %g1, %r9
        setx  0x7a13512f0757d7de, %g1, %r10
        setx  0x2a5fac3d577d6421, %g1, %r11
        setx  0xae54ffe950df82c4, %g1, %r12
        setx  0x69210c0087aef245, %g1, %r13
        setx  0x245644903c71b67b, %g1, %r14
        setx  0x63c8e4e4b4287da7, %g1, %r15
        setx  0xaf61620dd3b1a546, %g1, %r18
        setx  0x932e0ace87622bdc, %g1, %r19
        setx  0xdbee4a52cd668b86, %g1, %r20
        setx  0xef4b3ccc2954f71f, %g1, %r21
        setx  0xccc22b34c808221f, %g1, %r22
        setx  0xb7b8cdaf0d3b09b8, %g1, %r23
        setx  0xb72e16d97e343373, %g1, %r24
        setx  0x1586a6232a60fbe7, %g1, %r25
        setx  0xec630e1f76ce346c, %g1, %r26
        setx  0x333eaf5bf6441db8, %g1, %r27
        setx  0x5d7d331b67d2887f, %g1, %r28
        setx  0x2f6573bb919af679, %g1, %r29
        setx  0x74e4ed48f402e131, %g1, %r30
        setx  0x918b33196b1b33b1, %g1, %r31
	save %r0, %r0, %r31
        setx  MAIN_BASE_DATA_VA, %r1, %r16
        setx  0x00000000000008f0, %g1, %r17
        setx  0xa63189c53cc037d4, %g1, %r0
        setx  0x2e88d3e3eb70dbf9, %g1, %r1
        setx  0x0dce9a8eac4f3e77, %g1, %r2
        setx  0xaa8f6fcc663ec377, %g1, %r3
        setx  0x8f85bde16a0414b7, %g1, %r4
        setx  0x739d8e7f5e82769e, %g1, %r5
        setx  0xf2e82d760b17fa12, %g1, %r6
        setx  0x5b355cd40f60d7fe, %g1, %r7
        setx  0xf675557413eb84e5, %g1, %r8
        setx  0x78db4ed90473f777, %g1, %r9
        setx  0x01b669886e03c137, %g1, %r10
        setx  0x346a4d147e35a922, %g1, %r11
        setx  0x77fcd39bdf9ca153, %g1, %r12
        setx  0xee36d68dae176e1e, %g1, %r13
        setx  0xd968bade4ff53e03, %g1, %r14
        setx  0x019c1749553767b8, %g1, %r15
        setx  0x1831340cf041d78c, %g1, %r18
        setx  0x4c16b3bb9c4dc2cf, %g1, %r19
        setx  0x064c2a9c85b1dc26, %g1, %r20
        setx  0xf6f13c27653b4ebc, %g1, %r21
        setx  0x810ce579b2b27926, %g1, %r22
        setx  0xddc8b3b1c85ac688, %g1, %r23
        setx  0xfd18190ef9ec20de, %g1, %r24
        setx  0x7c96de476a9eb061, %g1, %r25
        setx  0x3f6fced71c4908e1, %g1, %r26
        setx  0xc883253cf1eac188, %g1, %r27
        setx  0x37e30d9fe96252e8, %g1, %r28
        setx  0xf3e36ee12795606b, %g1, %r29
        setx  0x5a3106b704317486, %g1, %r30
        setx  0x59462fbdbefc8900, %g1, %r31
	save %r0, %r0, %r31
        setx  MAIN_BASE_DATA_VA, %r1, %r16
        setx  0x00000000000000d0, %g1, %r17
        setx  0x6f4d491fc21d8849, %g1, %r0
        setx  0x7d0f0b515fa69986, %g1, %r1
        setx  0x5c6b152c7f6cf028, %g1, %r2
        setx  0xa2c07c1542dcf3e4, %g1, %r3
        setx  0x23f67221b88ec7e9, %g1, %r4
        setx  0x5148cfb24ad5743e, %g1, %r5
        setx  0x3a3dc545603fe9a6, %g1, %r6
        setx  0x4d3d1a38a22558aa, %g1, %r7
        setx  0xca010e3c0d176484, %g1, %r8
        setx  0xd393f23697713fb3, %g1, %r9
        setx  0x75dd90a5dda62183, %g1, %r10
        setx  0x7609da537df8b3c2, %g1, %r11
        setx  0xcd7ffbd0fac28955, %g1, %r12
        setx  0xb56552d5ccffcb92, %g1, %r13
        setx  0x4626744c564f8876, %g1, %r14
        setx  0xff288fb7d0e0246e, %g1, %r15
        setx  0xefea23177377bf70, %g1, %r18
        setx  0xda97e7192983a97e, %g1, %r19
        setx  0xcb221d6ebcdb1dba, %g1, %r20
        setx  0x6ca1126bcd07f598, %g1, %r21
        setx  0x19389fa8bfbaa063, %g1, %r22
        setx  0x262cc31eaa49e175, %g1, %r23
        setx  0x499fbde346879111, %g1, %r24
        setx  0x3db0b20df2dfda09, %g1, %r25
        setx  0x28ec31c12a60b014, %g1, %r26
        setx  0x368e98b1d3ea779b, %g1, %r27
        setx  0xc558683867c3f3a8, %g1, %r28
        setx  0x1ae8f4adca0ff187, %g1, %r29
        setx  0x423650bd640d8ab8, %g1, %r30
        setx  0x252eaf8cf0e4a5d2, %g1, %r31
	save %r0, %r0, %r31
        setx  MAIN_BASE_DATA_VA, %r1, %r16
        setx  0x0000000000000f30, %g1, %r17
        setx  0xa8af4a646c8e685c, %g1, %r0
        setx  0x09741b20feb64872, %g1, %r1
        setx  0xc41ff8ffc298fd8a, %g1, %r2
        setx  0x3e9e7bf0cfbe2905, %g1, %r3
        setx  0xeff82d424f570d33, %g1, %r4
        setx  0x3a0a5e933c9bb7f0, %g1, %r5
        setx  0xbcab83675f54ee29, %g1, %r6
        setx  0x58d51cda19d12ed9, %g1, %r7
        setx  0x53ea4a4bbda3f3f5, %g1, %r8
        setx  0x4a7446fc73ee3a84, %g1, %r9
        setx  0xbc7a712ec4f7ef6b, %g1, %r10
        setx  0x6ef09aab0aa8f040, %g1, %r11
        setx  0xdf4fa3d6c8b82e6a, %g1, %r12
        setx  0x0e606be30f4ec5f2, %g1, %r13
        setx  0x87d6cf58f50938f1, %g1, %r14
        setx  0xfc09473a99c20b4e, %g1, %r15
        setx  0x6e312888c1770d0c, %g1, %r18
        setx  0x31d6b288bf1f6ad8, %g1, %r19
        setx  0x9f6afe50586c9358, %g1, %r20
        setx  0xb2afdb93ed0f31e8, %g1, %r21
        setx  0x910b99af119c8647, %g1, %r22
        setx  0x5fa85f72c6dc883e, %g1, %r23
        setx  0xdc40fd6614941e33, %g1, %r24
        setx  0x9faeb678fb7b1d38, %g1, %r25
        setx  0x6d0bc81ec6ee14cd, %g1, %r26
        setx  0x7f8b5f18dd639038, %g1, %r27
        setx  0xb93c660936ce8a39, %g1, %r28
        setx  0x022dabf683be60f7, %g1, %r29
        setx  0xd3a15b6b9a7cdb2b, %g1, %r30
        setx  0x34de23e964c4e053, %g1, %r31
	save %r0, %r0, %r31
        setx  MAIN_BASE_DATA_VA, %r1, %r16
        setx  0x0000000000000b00, %g1, %r17
        setx  0x1ecde35742dd1179, %g1, %r0
        setx  0x8da65d5c5b7605e7, %g1, %r1
        setx  0x4a06be483a377763, %g1, %r2
        setx  0xc55e1d5f86860a14, %g1, %r3
        setx  0x1e0d757c86e305ef, %g1, %r4
        setx  0xac5ee2a48846bdc4, %g1, %r5
        setx  0x7acd1e5e12e9190b, %g1, %r6
        setx  0x51a845ae9dc25961, %g1, %r7
        setx  0x6a7dc30b98bea41b, %g1, %r8
        setx  0xaea2c2ca597304a8, %g1, %r9
        setx  0x48ee7f603660eb58, %g1, %r10
        setx  0x7cfee7c9f5ac8490, %g1, %r11
        setx  0xfd4aea31dc6436e0, %g1, %r12
        setx  0xf0acaf299fbcbf79, %g1, %r13
        setx  0xb7099f6a2fc6d8cb, %g1, %r14
        setx  0x50ba13583305c58d, %g1, %r15
        setx  0x713d334077b02273, %g1, %r18
        setx  0x564e71cf549bc2f3, %g1, %r19
        setx  0xe2e6ee8cf53e8cec, %g1, %r20
        setx  0xfb6d29e52cbca638, %g1, %r21
        setx  0x47db2b37bfb7448d, %g1, %r22
        setx  0x260fc0bcf66c55f7, %g1, %r23
        setx  0x454eedd2960f4dbf, %g1, %r24
        setx  0xfceaf8a6e5869724, %g1, %r25
        setx  0x18987f0293e76b9e, %g1, %r26
        setx  0xde56c094f9495416, %g1, %r27
        setx  0xfd8de514c2598201, %g1, %r28
        setx  0x55f08c38b552d71f, %g1, %r29
        setx  0x3c895ae61ee14912, %g1, %r30
        setx  0x296935c84d9582ef, %g1, %r31
	save %r0, %r0, %r31
        setx  MAIN_BASE_DATA_VA, %r1, %r16
        setx  0x00000000000005c0, %g1, %r17
        setx  0x2255ccdd09e6c63a, %g1, %r0
        setx  0xa6705e12f50cd565, %g1, %r1
        setx  0xc37950a4818ce1ac, %g1, %r2
        setx  0xa7fa17f61a363384, %g1, %r3
        setx  0x952466655ad52d3e, %g1, %r4
        setx  0x0c2ef388669e1456, %g1, %r5
        setx  0x5dbd90f6cc2fe5b8, %g1, %r6
        setx  0x46d2ac1307f9173c, %g1, %r7
        setx  0x028ffa72d9649562, %g1, %r8
        setx  0xc368e5d0ba77b5c8, %g1, %r9
        setx  0xc888509575461a51, %g1, %r10
        setx  0x9167f9e5d83e5406, %g1, %r11
        setx  0xd6cc40cce4f0b1df, %g1, %r12
        setx  0x5b6987d5ef3f388e, %g1, %r13
        setx  0xdad0c90064e88d20, %g1, %r14
        setx  0x4d0b8796afd9b23a, %g1, %r15
        setx  0x54593450dc8227a4, %g1, %r18
        setx  0x2110667b25b30314, %g1, %r19
        setx  0xdda95d6e538419cb, %g1, %r20
        setx  0x73d8a94a033799a9, %g1, %r21
        setx  0xb5dcd24eaaced0df, %g1, %r22
        setx  0xf77f1613fbdf6e81, %g1, %r23
        setx  0x6adb6fd58ce2e907, %g1, %r24
        setx  0x7568c11758d80198, %g1, %r25
        setx  0x0dd034112845d444, %g1, %r26
        setx  0x37166a30ba601f73, %g1, %r27
        setx  0xdba4296939c33dc5, %g1, %r28
        setx  0x334968341b13a88d, %g1, %r29
        setx  0xb38a57f2c17c3ffb, %g1, %r30
        setx  0xf58fec21cc250040, %g1, %r31
	save %r0, %r0, %r31
        setx  MAIN_BASE_DATA_VA, %r1, %r16
        setx  0x0000000000000950, %g1, %r17
        setx  0x9d407135ce981611, %g1, %r0
        setx  0xa68fe102c94713e7, %g1, %r1
        setx  0x7148059a4efa03fc, %g1, %r2
        setx  0x583e5d9e09576f46, %g1, %r3
        setx  0x5f0822d984bcaa67, %g1, %r4
        setx  0xafdde7153f85fc7c, %g1, %r5
        setx  0x123d9368b4eb0ca4, %g1, %r6
        setx  0xe0cfc8ad0677d63f, %g1, %r7
        setx  0xcc586acea148d090, %g1, %r8
        setx  0x31b83568d9602bf9, %g1, %r9
        setx  0xaa62102b32e85565, %g1, %r10
        setx  0x00d7dc8c2fd7667e, %g1, %r11
        setx  0xb3aa7bfe1663634b, %g1, %r12
        setx  0x9b7671e618830b72, %g1, %r13
        setx  0x16fb8f98163342b3, %g1, %r14
        setx  0x14912c3e1304769c, %g1, %r15
        setx  0x3b4c5d7575b34a51, %g1, %r18
        setx  0x0dc607b5cade578f, %g1, %r19
        setx  0x4f5dad8af20c72fd, %g1, %r20
        setx  0x3b3e29abbac9de5d, %g1, %r21
        setx  0xaabb8e13556dd6f0, %g1, %r22
        setx  0xa6efd806bb065522, %g1, %r23
        setx  0xf5b756870f376a7e, %g1, %r24
        setx  0xc90013f20dabd06f, %g1, %r25
        setx  0x580e081d250700ad, %g1, %r26
        setx  0xf87683b42b6868a3, %g1, %r27
        setx  0x4f7cbcaf79b1d67e, %g1, %r28
        setx  0x36c2d71656321a11, %g1, %r29
        setx  0xb2971ae3ca288255, %g1, %r30
        setx  0x00abb172acae8386, %g1, %r31
	save %r0, %r0, %r31
        setx  MAIN_BASE_DATA_VA, %r1, %r16
        setx  0x0000000000000e20, %g1, %r17
        setx  0x080ec68a951263ce, %g1, %r0
        setx  0x9e599ee5fb5b10b5, %g1, %r1
        setx  0x9218ac314c9fae1b, %g1, %r2
        setx  0x65ee3bd8ea435ac0, %g1, %r3
        setx  0xeb38f5c3116f1c37, %g1, %r4
        setx  0x0f8cc076c1c4b894, %g1, %r5
        setx  0x8f6422dfe287ae05, %g1, %r6
        setx  0xc9133f9dccb7878d, %g1, %r7
        setx  0x3b735cf3617ee22b, %g1, %r8
        setx  0xb96d264d0b334128, %g1, %r9
        setx  0x2680d57b27752836, %g1, %r10
        setx  0xe4e0b3ecce62f1cf, %g1, %r11
        setx  0x6acd70c7d22b80a1, %g1, %r12
        setx  0x1a6f356d8362bec4, %g1, %r13
        setx  0x8b8aea343bf12129, %g1, %r14
        setx  0x7337e515af9a1493, %g1, %r15
        setx  0xe77d3c41585b7437, %g1, %r18
        setx  0xcd7d592d966c54f5, %g1, %r19
        setx  0x1ba7a6a1e7bd433a, %g1, %r20
        setx  0x2a1348a78bf70d30, %g1, %r21
        setx  0xd2c98995cd62e9da, %g1, %r22
        setx  0x44b6f9b8726b8f07, %g1, %r23
        setx  0xa3dfa228078bdc3a, %g1, %r24
        setx  0xe583255ad75d411d, %g1, %r25
        setx  0xfffdf393a9d9ce10, %g1, %r26
        setx  0xa1f5d17670c4c989, %g1, %r27
        setx  0x2a00361a609e7c70, %g1, %r28
        setx  0x5236e993c76b0bda, %g1, %r29
        setx  0xd8d2ef9225b44819, %g1, %r30
        setx  0x7f6bc514f04dd982, %g1, %r31
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
	.word 0xb12c1011  ! 0: SLLX_R	sllx	%r16, %r17, %r24
	.word 0xbab40011  ! 2: ORNcc_R	orncc 	%r16, %r17, %r29
	.word 0xb3414000  ! 2: RDPC	rd	%pc, %r25
	.word 0xf2740011  ! 3: STX_R	stx	%r25, [%r16 + %r17]
	.word 0x8d840011  ! 5: WRFPRS_R	wr	%r16, %r17, %fprs
	.word 0xf2740011  ! 6: STX_R	stx	%r25, [%r16 + %r17]
	.word 0x841c2cde  ! 8: XOR_I	xor 	%r16, 0x0cde, %r2
	.word 0xe5e41011  ! 8: CASA_I	casa	[%r16] 0x80, %r17, %r18
	.word 0xf6340011  ! 9: STH_R	sth	%r27, [%r16 + %r17]
	.word 0xd2fc1011  ! 11: SWAPA_R	swapa	%r9, [%r16 + %r17] 0x80
thr1_irf_ce_0:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_0), 16, 16),1,IRF,ce,13,x, x,x,x, x,x,x)
	.word 0xc43426d5  ! 14: STH_I	sth	%r2, [%r16 + 0x06d5]
	.word 0xb09c2e32  ! 16: XORcc_I	xorcc 	%r16, 0x0e32, %r24
	.word 0x9ec426a0  ! 16: ADDCcc_I	addccc 	%r16, 0x06a0, %r15
	.word 0xd6fc1011  ! 16: SWAPA_R	swapa	%r11, [%r16 + %r17] 0x80
	.word 0xbe2c0011  ! 17: ANDN_R	andn 	%r16, %r17, %r31
	.word 0x81dc2194  ! 19: FLUSH_I	dis not found

	.word 0xd674263b  ! 21: STX_I	stx	%r11, [%r16 + 0x063b]
	.word 0x8aac0011  ! 23: ANDNcc_R	andncc 	%r16, %r17, %r5
	.word 0x9404292d  ! 23: ADD_I	add 	%r16, 0x092d, %r10
	.word 0xc36c0011  ! 23: PREFETCH_R	prefetch	[%r16 + %r17], #one_read
	.word 0x861429ba  ! 24: OR_I	or 	%r16, 0x09ba, %r3
	.word 0x38800001  ! 26: BGU	bgu,a	<label_0x1>
	.word 0xc83427cb  ! 28: STH_I	sth	%r4, [%r16 + 0x07cb]
	.word 0x8cc40011  ! 30: ADDCcc_R	addccc 	%r16, %r17, %r6
	.word 0x932c3001  ! 30: SLLX_I	sllx	%r16, 0x0001, %r9
	.word 0xac940011  ! 30: ORcc_R	orcc 	%r16, %r17, %r22
	.word 0xc36c0011  ! 30: PREFETCH_R	prefetch	[%r16 + %r17], #one_read
thr1_irf_ce_1:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_1), 16, 16),1,IRF,ce,15,x, x,x,x, x,x,x)
	.word 0xfe2c25ad  ! 33: STB_I	stb	%r31, [%r16 + 0x05ad]
	.word 0xcc4c28ec  ! 35: LDSB_I	ldsb	[%r16 + 0x08ec], %r6
	.word 0xce2c29b1  ! 37: STB_I	stb	%r7, [%r16 + 0x09b1]
	.word 0x9b2c3001  ! 39: SLLX_I	sllx	%r16, 0x0001, %r13
	.word 0x88440011  ! 39: ADDC_R	addc 	%r16, %r17, %r4
	.word 0xf6a41011  ! 39: STWA_R	stwa	%r27, [%r16 + %r17] 0x80
	.word 0xb33c1011  ! 40: SRAX_R	srax	%r16, %r17, %r25
	.word 0x8eac221d  ! 42: ANDNcc_I	andncc 	%r16, 0x021d, %r7
	.word 0xb60c0011  ! 42: AND_R	and 	%r16, %r17, %r27
	.word 0x85840011  ! 42: WRCCR_R	wr	%r16, %r17, %ccr
	.word 0xbea42253  ! 43: SUBcc_I	subcc 	%r16, 0x0253, %r31
	.word 0xa62c24b2  ! 45: ANDN_I	andn 	%r16, 0x04b2, %r19
	.word 0x92440011  ! 45: ADDC_R	addc 	%r16, %r17, %r9
	.word 0xc3ec1011  ! 45: PREFETCHA_R	prefetcha	[%r16, %r17] 0x80, #one_read
	.word 0xfc34267d  ! 47: STH_I	sth	%r30, [%r16 + 0x067d]
	.word 0x888c2e79  ! 49: ANDcc_I	andcc 	%r16, 0x0e79, %r4
	.word 0xb204287d  ! 49: ADD_I	add 	%r16, 0x087d, %r25
	.word 0x9be40011  ! 49: SAVE_R	save	%r16, %r17, %r13
	.word 0x973c1011  ! 50: SRAX_R	srax	%r16, %r17, %r11
	.word 0xd48428e0  ! 52: LDUWA_I	lduwa	[%r16, + 0x08e0] %asi, %r10
	.word 0x84ac0011  ! 53: ANDNcc_R	andncc 	%r16, %r17, %r2
	.word 0x9c440011  ! 55: ADDC_R	addc 	%r16, %r17, %r14
	.word 0x912c3001  ! 55: SLLX_I	sllx	%r16, 0x0001, %r8
	.word 0x893c1011  ! 55: SRAX_R	srax	%r16, %r17, %r4
	.word 0xd244294b  ! 55: LDSW_I	ldsw	[%r16 + 0x094b], %r9
	.word 0xc4740011  ! 56: STX_R	stx	%r2, [%r16 + %r17]
	.word 0x87340011  ! 58: SRL_R	srl 	%r16, %r17, %r3
	.word 0xb49c0011  ! 58: XORcc_R	xorcc 	%r16, %r17, %r26
	.word 0xeeac2a2c  ! 58: STBA_I	stba	%r23, [%r16 + 0x0a2c] %asi
thr1_irf_ce_2:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_2), 16, 16),1,IRF,ce,33,x, x,x,x, x,x,x)
	.word 0xfe742c03  ! 61: STX_I	stx	%r31, [%r16 + 0x0c03]
	.word 0x98ac0011  ! 63: ANDNcc_R	andncc 	%r16, %r17, %r12
	.word 0xe6ac2731  ! 63: STBA_I	stba	%r19, [%r16 + 0x0731] %asi
	.word 0xd8740011  ! 64: STX_R	stx	%r12, [%r16 + %r17]
	.word 0x877c0411  ! 66: MOVR_R	move	%r16, %r17, %r3
	.word 0x9d7c2401  ! 66: MOVR_I	move	%r16, 0xfffffff8, %r14
	.word 0x992c0011  ! 66: SLL_R	sll 	%r16, %r17, %r12
	.word 0x3a800003  ! 66: BCC	bcc,a	<label_0x3>
	.word 0xce742d59  ! 68: STX_I	stx	%r7, [%r16 + 0x0d59]
	.word 0x8e2c0011  ! 70: ANDN_R	andn 	%r16, %r17, %r7
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xd2240011  ! 71: STW_R	stw	%r9, [%r16 + %r17]
	.word 0xae3c27fe  ! 73: XNOR_I	xnor 	%r16, 0x07fe, %r23
	.word 0x9f641811  ! 73: MOVcc_R	<illegal instruction>
	.word 0xbabc2e1b  ! 73: XNORcc_I	xnorcc 	%r16, 0x0e1b, %r29
	.word 0xc2ec2bd0  ! 73: LDSTUBA_I	ldstuba	%r1, [%r16 + 0x0bd0] %asi
	.word 0xc4340011  ! 74: STH_R	sth	%r2, [%r16 + %r17]
	.word 0x993c2001  ! 76: SRA_I	sra 	%r16, 0x0001, %r12
	.word 0x941c0011  ! 76: XOR_R	xor 	%r16, %r17, %r10
thr1_resum_intr_0:
!$EV trig_pc_d(1,expr(@VA(.MAIN.thr1_resum_intr_0), 16, 16)) -> intp(1, 3, 1)
	wr      %r0, 0x5, %asr26
	.word 0x9b341011  ! 77: SRLX_R	srlx	%r16, %r17, %r13
	.word 0x9b2c1011  ! 79: SLLX_R	sllx	%r16, %r17, %r13
	ta	T_CHANGE_NONHPRIV	! macro
thr1_irf_ce_3:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_3), 16, 16),1,IRF,ce,68,x, x,x,x, x,x,x)
	.word 0xd82c2709  ! 82: STB_I	stb	%r12, [%r16 + 0x0709]
	.word 0xdc142156  ! 84: LDUH_I	lduh	[%r16 + 0x0156], %r14
	.word 0xde2427f3  ! 86: STW_I	stw	%r15, [%r16 + 0x07f3]
        wr %g0, 0x4, %fprs
	.word 0xc2340011  ! 89: STH_R	sth	%r1, [%r16 + %r17]
	.word 0xb89c0011  ! 91: XORcc_R	xorcc 	%r16, %r17, %r28
	.word 0xad504000  ! 91: RDPR_TNPC	rdpr	%tnpc, %r22
	.word 0xc674204f  ! 93: STX_I	stx	%r3, [%r16 + 0x004f]
	.word 0x873c0011  ! 95: SRA_R	sra 	%r16, %r17, %r3
	.word 0xbc2c0011  ! 95: ANDN_R	andn 	%r16, %r17, %r30
	.word 0x9f340011  ! 95: SRL_R	srl 	%r16, %r17, %r15
	.word 0xc36c23e0  ! 95: PREFETCH_I	prefetch	[%r16 + 0x03e0], #one_read
	.word 0xcc242c6d  ! 97: STW_I	stw	%r6, [%r16 + 0x0c6d]
        wr %g0, 0x4, %fprs
thr1_irf_ce_4:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_4), 16, 16),1,IRF,ce,32,x, x,x,x, x,x,x)
	.word 0xcc2c2df3  ! 102: STB_I	stb	%r6, [%r16 + 0x0df3]
	.word 0xbc8c0011  ! 104: ANDcc_R	andcc 	%r16, %r17, %r30
	.word 0x85840011  ! 104: WRCCR_R	wr	%r16, %r17, %ccr
	.word 0xd8340011  ! 105: STH_R	sth	%r12, [%r16 + %r17]
	.word 0xc9240011  ! 107: STF_R	st	%f4, [%r17, %r16]
	.word 0x94342a98  ! 108: SUBC_I	orn 	%r16, 0x0a98, %r10
        wr %g0, 0x4, %fprs
thr1_irf_ce_5:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_5), 16, 16),1,IRF,ce,30,x, x,x,x, x,x,x)
	.word 0xd47424c1  ! 113: STX_I	stx	%r10, [%r16 + 0x04c1]
thr1_resum_intr_1:
!$EV trig_pc_d(1,expr(@VA(.MAIN.thr1_resum_intr_1), 16, 16)) -> intp(1, 3, 1)
	wr      %r0, 0x5, %asr26
thr1_irf_ce_6:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_6), 16, 16),1,IRF,ce,59,x, x,x,x, x,x,x)
	.word 0xd47420a5  ! 118: STX_I	stx	%r10, [%r16 + 0x00a5]
	.word 0xb2040011  ! 120: ADD_R	add 	%r16, %r17, %r25
        wr %g0, 0x4, %fprs
	.word 0xc8342a85  ! 122: STH_I	sth	%r4, [%r16 + 0x0a85]
	.word 0x989c2e14  ! 124: XORcc_I	xorcc 	%r16, 0x0e14, %r12
	.word 0xb32c0011  ! 124: SLL_R	sll 	%r16, %r17, %r25
	ta	T_CHANGE_PRIV	! macro
	.word 0xee2c20b5  ! 126: STB_I	stb	%r23, [%r16 + 0x00b5]
	.word 0xa77c0411  ! 128: MOVR_R	move	%r16, %r17, %r19
	.word 0x8efc280d  ! 128: SDIVcc_I	sdivcc 	%r16, 0x080d, %r7
thr1_irf_ce_7:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_7), 16, 16),1,IRF,ce,55,x, x,x,x, x,x,x)
	.word 0xc82c2165  ! 131: STB_I	stb	%r4, [%r16 + 0x0165]
	.word 0x9e9c0011  ! 133: XORcc_R	xorcc 	%r16, %r17, %r15
	.word 0x9b3c0011  ! 133: SRA_R	sra 	%r16, %r17, %r13
	.word 0x81dc2f38  ! 133: FLUSH_I	dis not found

	.word 0xf02c2bb1  ! 135: STB_I	stb	%r24, [%r16 + 0x0bb1]
	.word 0x91641811  ! 137: MOVcc_R	<illegal instruction>
thr1_resum_intr_2:
!$EV trig_pc_d(1,expr(@VA(.MAIN.thr1_resum_intr_2), 16, 16)) -> intp(1, 3, 1)
	wr      %r0, 0x5, %asr26
	.word 0xc2740011  ! 138: STX_R	stx	%r1, [%r16 + %r17]
	.word 0x942c0011  ! 140: ANDN_R	andn 	%r16, %r17, %r10
	.word 0xa9e40011  ! 140: SAVE_R	save	%r16, %r17, %r20
	.word 0xd03427c3  ! 142: STH_I	sth	%r8, [%r16 + 0x07c3]
	.word 0xa63c2a7b  ! 144: XNOR_I	xnor 	%r16, 0x0a7b, %r19
	.word 0xb2b427d4  ! 144: ORNcc_I	orncc 	%r16, 0x07d4, %r25
	.word 0xba1c0011  ! 144: XOR_R	xor 	%r16, %r17, %r29
	.word 0xab530000  ! 144: RDPR_CLEANWIN	rdpr	%cleanwin, %r21
	.word 0xdc740011  ! 145: STX_R	stx	%r14, [%r16 + %r17]
        wr %g0, 0x4, %fprs
	.word 0xda240011  ! 148: STW_R	stw	%r13, [%r16 + %r17]
	.word 0x9e840011  ! 150: ADDcc_R	addcc 	%r16, %r17, %r15
thr1_resum_intr_3:
!$EV trig_pc_d(1,expr(@VA(.MAIN.thr1_resum_intr_3), 16, 16)) -> intp(1, 3, 1)
	wr      %r0, 0x5, %asr26
thr1_irf_ce_8:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_8), 16, 16),1,IRF,ce,5,x, x,x,x, x,x,x)
	.word 0xc42c2103  ! 153: STB_I	stb	%r2, [%r16 + 0x0103]
	.word 0xad50c000  ! 155: RDPR_TT	<illegal instruction>
	.word 0xc8340011  ! 156: STH_R	sth	%r4, [%r16 + %r17]
	.word 0x9e3c2440  ! 158: XNOR_I	xnor 	%r16, 0x0440, %r15
	.word 0xcc9c1011  ! 158: LDDA_R	ldda	[%r16, %r17] 0x80, %r6
	.word 0x932c3001  ! 159: SLLX_I	sllx	%r16, 0x0001, %r9
	.word 0x83e40011  ! 161: SAVE_R	save	%r16, %r17, %r1
	.word 0xf434270f  ! 163: STH_I	sth	%r26, [%r16 + 0x070f]
	.word 0x883c0011  ! 165: XNOR_R	xnor 	%r16, %r17, %r4
	.word 0x8e9c25b3  ! 165: XORcc_I	xorcc 	%r16, 0x05b3, %r7
	.word 0xdbf42011  ! 165: CASXA_R	casxa	[%r16]%asi, %r17, %r13
	.word 0xda3422b3  ! 167: STH_I	sth	%r13, [%r16 + 0x02b3]
	.word 0xb6042080  ! 169: ADD_I	add 	%r16, 0x0080, %r27
	.word 0x84940011  ! 169: ORcc_R	orcc 	%r16, %r17, %r2
	.word 0xac1c0011  ! 169: XOR_R	xor 	%r16, %r17, %r22
	.word 0xc36c2cb3  ! 169: PREFETCH_I	prefetch	[%r16 + 0x0cb3], #one_read
thr1_irf_ce_9:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_9), 16, 16),1,IRF,ce,59,x, x,x,x, x,x,x)
	.word 0xc634225b  ! 172: STH_I	sth	%r3, [%r16 + 0x025b]
	.word 0x9c2c0011  ! 174: ANDN_R	andn 	%r16, %r17, %r14
	.word 0x932c3001  ! 174: SLLX_I	sllx	%r16, 0x0001, %r9
	.word 0xdd3c0011  ! 174: STDF_R	std	%f14, [%r17, %r16]
	.word 0xec240011  ! 175: STW_R	stw	%r22, [%r16 + %r17]
	.word 0x8d518000  ! 177: RDPR_PSTATE	<illegal instruction>
thr1_irf_ce_10:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_10), 16, 16),1,IRF,ce,65,x, x,x,x, x,x,x)
	.word 0xf03423f1  ! 180: STH_I	sth	%r24, [%r16 + 0x03f1]
	.word 0xacfc203f  ! 182: SDIVcc_I	sdivcc 	%r16, 0x003f, %r22
	.word 0xc2740011  ! 183: STX_R	stx	%r1, [%r16 + %r17]
	.word 0x92b40011  ! 185: ORNcc_R	orncc 	%r16, %r17, %r9
	.word 0xbe840011  ! 185: ADDcc_R	addcc 	%r16, %r17, %r31
	.word 0x88140011  ! 185: OR_R	or 	%r16, %r17, %r4
	ta	T_CHANGE_HPRIV	! macro
	.word 0xce742621  ! 187: STX_I	stx	%r7, [%r16 + 0x0621]
	.word 0x89518000  ! 189: RDPR_PSTATE	<illegal instruction>
thr1_irf_ce_11:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_11), 16, 16),1,IRF,ce,44,x, x,x,x, x,x,x)
	.word 0xfe2420df  ! 192: STW_I	stw	%r31, [%r16 + 0x00df]
	.word 0x952c1011  ! 194: SLLX_R	sllx	%r16, %r17, %r10
	ta	T_CHANGE_PRIV	! macro
	.word 0x828c2578  ! 195: ANDcc_I	andcc 	%r16, 0x0578, %r1
	.word 0x972c2001  ! 197: SLL_I	sll 	%r16, 0x0001, %r11
	.word 0x8a342946  ! 197: ORN_I	orn 	%r16, 0x0946, %r5
	.word 0x841c0011  ! 197: XOR_R	xor 	%r16, %r17, %r2
	.word 0x9c6c0011  ! 197: UDIVX_R	udivx 	%r16, %r17, %r14
thr1_irf_ce_12:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_12), 16, 16),1,IRF,ce,24,x, x,x,x, x,x,x)
	.word 0xea74237d  ! 200: STX_I	stx	%r21, [%r16 + 0x037d]
	.word 0xaf2c0011  ! 202: SLL_R	sll 	%r16, %r17, %r23
	.word 0xac342b91  ! 202: ORN_I	orn 	%r16, 0x0b91, %r22
	.word 0xa957c000  ! 202: RDPR_VER	<illegal instruction>
	.word 0xe62c0011  ! 203: STB_R	stb	%r19, [%r16 + %r17]
	.word 0xa7520000  ! 205: RDPR_PIL	<illegal instruction>
	.word 0xec342053  ! 207: STH_I	sth	%r22, [%r16 + 0x0053]
	.word 0xae8c0011  ! 209: ANDcc_R	andcc 	%r16, %r17, %r23
	.word 0xab3c0011  ! 209: SRA_R	sra 	%r16, %r17, %r21
	ta	T_CHANGE_NONHPRIV	! macro
thr1_irf_ce_13:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_13), 16, 16),1,IRF,ce,40,x, x,x,x, x,x,x)
	.word 0xf4742a99  ! 212: STX_I	stx	%r26, [%r16 + 0x0a99]
	.word 0xa72c2001  ! 214: SLL_I	sll 	%r16, 0x0001, %r19
	.word 0x8d840011  ! 214: WRFPRS_R	wr	%r16, %r17, %fprs
	.word 0x92ac0011  ! 215: ANDNcc_R	andncc 	%r16, %r17, %r9
	.word 0xa6842462  ! 217: ADDcc_I	addcc 	%r16, 0x0462, %r19
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x82bc24f3  ! 218: XNORcc_I	xnorcc 	%r16, 0x04f3, %r1
	.word 0x8f3c0011  ! 220: SRA_R	sra 	%r16, %r17, %r7
	.word 0x992c3001  ! 220: SLLX_I	sllx	%r16, 0x0001, %r12
	.word 0xb53c1011  ! 220: SRAX_R	srax	%r16, %r17, %r26
        wr %g0, 0x4, %fprs
	.word 0xb0940011  ! 221: ORcc_R	orcc 	%r16, %r17, %r24
	ta	T_CHANGE_PRIV	! macro
	.word 0xde2c285d  ! 225: STB_I	stb	%r15, [%r16 + 0x085d]
	.word 0xb40c2079  ! 227: AND_I	and 	%r16, 0x0079, %r26
	.word 0x864427d0  ! 227: ADDC_I	addc 	%r16, 0x07d0, %r3
	.word 0x2e800001  ! 227: BVS	bvs,a	<label_0x1>
	.word 0x95340011  ! 228: SRL_R	srl 	%r16, %r17, %r10
	.word 0xbe8c0011  ! 230: ANDcc_R	andcc 	%r16, %r17, %r31
	.word 0x93340011  ! 230: SRL_R	srl 	%r16, %r17, %r9
	.word 0x82440011  ! 230: ADDC_R	addc 	%r16, %r17, %r1
	.word 0x93518000  ! 230: RDPR_PSTATE	rdpr	%pstate, %r9
thr1_irf_ce_14:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_14), 16, 16),1,IRF,ce,21,x, x,x,x, x,x,x)
	.word 0xc2742f29  ! 233: STX_I	stx	%r1, [%r16 + 0x0f29]
	.word 0x99341011  ! 235: SRLX_R	srlx	%r16, %r17, %r12
	.word 0x87ab0831  ! 235: FMOVGU	fmovs	%fcc1, %f17, %f3
	.word 0xd6742c23  ! 237: STX_I	stx	%r11, [%r16 + 0x0c23]
	.word 0x960c25e6  ! 239: AND_I	and 	%r16, 0x05e6, %r11
	.word 0x06800003  ! 239: BL	bl  	<label_0x3>
	.word 0xe474296b  ! 241: STX_I	stx	%r18, [%r16 + 0x096b]
	.word 0x9ebc2495  ! 243: XNORcc_I	xnorcc 	%r16, 0x0495, %r15
	.word 0x8143e076  ! 243: MEMBAR	membar	#StoreLoad | #LoadStore | #Lookaside | #MemIssue | #Sync 
	.word 0xc22c0011  ! 244: STB_R	stb	%r1, [%r16 + %r17]
	.word 0xb23c2f9c  ! 246: XNOR_I	xnor 	%r16, 0x0f9c, %r25
	.word 0xc3ec1011  ! 246: PREFETCHA_R	prefetcha	[%r16, %r17] 0x80, #one_read
thr1_irf_ce_15:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_15), 16, 16),1,IRF,ce,48,x, x,x,x, x,x,x)
	.word 0xd87421ab  ! 249: STX_I	stx	%r12, [%r16 + 0x01ab]
	.word 0xc69c1011  ! 251: LDDA_R	ldda	[%r16, %r17] 0x80, %r3
	.word 0x84142eed  ! 252: OR_I	or 	%r16, 0x0eed, %r2
	.word 0x908c0011  ! 254: ANDcc_R	andcc 	%r16, %r17, %r8
	.word 0xb254221f  ! 254: UMUL_I	umul 	%r16, 0x021f, %r25
	.word 0xfe242247  ! 256: STW_I	stw	%r31, [%r16 + 0x0247]
	.word 0x9cc40011  ! 258: ADDCcc_R	addccc 	%r16, %r17, %r14
	.word 0xba3c0011  ! 258: XNOR_R	xnor 	%r16, %r17, %r29
	.word 0x81580000  ! 258: FLUSHW	flushw
	.word 0x8a340011  ! 259: ORN_R	orn 	%r16, %r17, %r5
	.word 0xd6841011  ! 261: LDUWA_R	lduwa	[%r16, %r17] 0x80, %r11
	.word 0xd4740011  ! 262: STX_R	stx	%r10, [%r16 + %r17]
	.word 0x9c5c24c5  ! 264: SMUL_I	smul 	%r16, 0x04c5, %r14
	.word 0xb0142421  ! 265: OR_I	or 	%r16, 0x0421, %r24
	.word 0x982c0011  ! 267: ANDN_R	andn 	%r16, %r17, %r12
	.word 0xc3ec1011  ! 267: PREFETCHA_R	prefetcha	[%r16, %r17] 0x80, #one_read
	.word 0xd4740011  ! 268: STX_R	stx	%r10, [%r16 + %r17]
	.word 0x953c0011  ! 270: SRA_R	sra 	%r16, %r17, %r10
	.word 0x90140011  ! 270: OR_R	or 	%r16, %r17, %r8
	.word 0xccf429d9  ! 270: STXA_I	stxa	%r6, [%r16 + 0x09d9] %asi
	.word 0xd4240011  ! 271: STW_R	stw	%r10, [%r16 + %r17]
	.word 0xbb340011  ! 273: SRL_R	srl 	%r16, %r17, %r29
thr1_resum_intr_4:
!$EV trig_pc_d(1,expr(@VA(.MAIN.thr1_resum_intr_4), 16, 16)) -> intp(1, 3, 1)
	wr      %r0, 0x5, %asr26
	.word 0xd02c2ff1  ! 275: STB_I	stb	%r8, [%r16 + 0x0ff1]
	.word 0xb6440011  ! 277: ADDC_R	addc 	%r16, %r17, %r27
	.word 0xa6bc2f60  ! 277: XNORcc_I	xnorcc 	%r16, 0x0f60, %r19
	.word 0x966c2621  ! 277: UDIVX_I	udivx 	%r16, 0x0621, %r11
	.word 0xc4740011  ! 278: STX_R	stx	%r2, [%r16 + %r17]
	.word 0x9e2c0011  ! 280: ANDN_R	andn 	%r16, %r17, %r15
	.word 0x88142cba  ! 280: OR_I	or 	%r16, 0x0cba, %r4
	.word 0x960c0011  ! 280: AND_R	and 	%r16, %r17, %r11
	.word 0x81840011  ! 280: WRY_R	wr	%r16, %r17, %y
	.word 0x988c0011  ! 281: ANDcc_R	andcc 	%r16, %r17, %r12
	.word 0x852c0011  ! 283: SLL_R	sll 	%r16, %r17, %r2
	.word 0x81dc0011  ! 283: FLUSH_R	dis not found

	.word 0xc22c29cb  ! 285: STB_I	stb	%r1, [%r16 + 0x09cb]
        wr %g0, 0x4, %fprs
	.word 0xc274252f  ! 289: STX_I	stx	%r1, [%r16 + 0x052f]
	.word 0x9b7c0411  ! 291: MOVR_R	move	%r16, %r17, %r13
	.word 0x9c2c0011  ! 291: ANDN_R	andn 	%r16, %r17, %r14
	.word 0x94040011  ! 291: ADD_R	add 	%r16, %r17, %r10
	.word 0x99a019b1  ! 291: FsTOq	dis not found

	.word 0xb094230e  ! 292: ORcc_I	orcc 	%r16, 0x030e, %r24
	.word 0xc26c0011  ! 294: LDSTUB_R	ldstub	%r1, [%r16 + %r17]
	.word 0xe834278b  ! 296: STH_I	sth	%r20, [%r16 + 0x078b]
	.word 0xd8d424e6  ! 298: LDSHA_I	ldsha	[%r16, + 0x04e6] %asi, %r12
	.word 0xf02428e9  ! 300: STW_I	stw	%r24, [%r16 + 0x08e9]
	.word 0x9a940011  ! 302: ORcc_R	orcc 	%r16, %r17, %r13
	.word 0x8f340011  ! 302: SRL_R	srl 	%r16, %r17, %r7
	.word 0x8143c000  ! 302: STBAR	stbar
	.word 0xcc74271b  ! 304: STX_I	stx	%r6, [%r16 + 0x071b]
	.word 0xbe340011  ! 306: ORN_R	orn 	%r16, %r17, %r31
	.word 0x9d340011  ! 306: SRL_R	srl 	%r16, %r17, %r14
	.word 0x920c0011  ! 306: AND_R	and 	%r16, %r17, %r9
	.word 0xd2bc1011  ! 306: STDA_R	stda	%r9, [%r16 + %r17] 0x80
	.word 0xfc2425f7  ! 308: STW_I	stw	%r30, [%r16 + 0x05f7]
	.word 0x88c40011  ! 310: ADDCcc_R	addccc 	%r16, %r17, %r4
	.word 0xcaac2597  ! 310: STBA_I	stba	%r5, [%r16 + 0x0597] %asi
thr1_irf_ce_16:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_16), 16, 16),1,IRF,ce,34,x, x,x,x, x,x,x)
	.word 0xd2742d8d  ! 313: STX_I	stx	%r9, [%r16 + 0x0d8d]
	.word 0x893c0011  ! 315: SRA_R	sra 	%r16, %r17, %r4
	.word 0xba0c0011  ! 315: AND_R	and 	%r16, %r17, %r29
	.word 0x81dc0011  ! 315: FLUSH_R	dis not found

	.word 0xc8742245  ! 317: STX_I	stx	%r4, [%r16 + 0x0245]
	.word 0xab2c0011  ! 319: SLL_R	sll 	%r16, %r17, %r21
	.word 0xe6fc1011  ! 319: SWAPA_R	swapa	%r19, [%r16 + %r17] 0x80
	.word 0xd6340011  ! 320: STH_R	sth	%r11, [%r16 + %r17]
	.word 0xa8bc2d6b  ! 322: XNORcc_I	xnorcc 	%r16, 0x0d6b, %r20
	.word 0x92c42739  ! 322: ADDCcc_I	addccc 	%r16, 0x0739, %r9
	.word 0xba2c0011  ! 322: ANDN_R	andn 	%r16, %r17, %r29
	.word 0x81dc0011  ! 322: FLUSH_R	dis not found

	.word 0x84ac0011  ! 323: ANDNcc_R	andncc 	%r16, %r17, %r2
	.word 0x91a018f1  ! 325: FqTOs	dis not found

	.word 0x88bc2e09  ! 326: XNORcc_I	xnorcc 	%r16, 0x0e09, %r4
	.word 0x89643801  ! 328: MOVcc_I	<illegal instruction>
	.word 0xac1c0011  ! 328: XOR_R	xor 	%r16, %r17, %r22
	.word 0x8ac40011  ! 328: ADDCcc_R	addccc 	%r16, %r17, %r5
	.word 0xea440011  ! 328: LDSW_R	ldsw	[%r16 + %r17], %r21
	.word 0xd4742453  ! 330: STX_I	stx	%r10, [%r16 + 0x0453]
	.word 0x883c0011  ! 332: XNOR_R	xnor 	%r16, %r17, %r4
	.word 0x9a3427a0  ! 332: ORN_I	orn 	%r16, 0x07a0, %r13
	.word 0x9cd40011  ! 332: UMULcc_R	umulcc 	%r16, %r17, %r14
	.word 0xca7421a9  ! 334: STX_I	stx	%r5, [%r16 + 0x01a9]
	.word 0xb6342df7  ! 336: ORN_I	orn 	%r16, 0x0df7, %r27
thr1_resum_intr_5:
!$EV trig_pc_d(1,expr(@VA(.MAIN.thr1_resum_intr_5), 16, 16)) -> intp(1, 3, 1)
	wr      %r0, 0x5, %asr26
	.word 0xc6342af1  ! 338: STH_I	sth	%r3, [%r16 + 0x0af1]
	.word 0x8cc40011  ! 340: ADDCcc_R	addccc 	%r16, %r17, %r6
	.word 0xf47c0011  ! 340: SWAP_R	swap	%r26, [%r16 + %r17]
	.word 0xce2c248b  ! 342: STB_I	stb	%r7, [%r16 + 0x048b]
	.word 0x8d50c000  ! 344: RDPR_TT	<illegal instruction>
	.word 0x9e342fb8  ! 345: ORN_I	orn 	%r16, 0x0fb8, %r15
	.word 0x94b42f1f  ! 347: ORNcc_I	orncc 	%r16, 0x0f1f, %r10
	.word 0x8143e050  ! 347: MEMBAR	membar	#Lookaside | #Sync 
	.word 0x881c0011  ! 348: XOR_R	xor 	%r16, %r17, %r4
	.word 0xc2fc27ab  ! 350: SWAPA_I	swapa	%r1, [%r16 + 0x07ab] %asi
thr1_irf_ce_17:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_17), 16, 16),1,IRF,ce,56,x, x,x,x, x,x,x)
	.word 0xee242d7d  ! 353: STW_I	stw	%r23, [%r16 + 0x0d7d]
	.word 0xcc7c2974  ! 355: SWAP_I	swap	%r6, [%r16 + 0x0974]
	.word 0xd4740011  ! 356: STX_R	stx	%r10, [%r16 + %r17]
	.word 0x8143c000  ! 358: STBAR	stbar
	.word 0x90ac0011  ! 359: ANDNcc_R	andncc 	%r16, %r17, %r8
	.word 0x82940011  ! 361: ORcc_R	orcc 	%r16, %r17, %r1
	.word 0x8b7c2401  ! 361: MOVR_I	move	%r16, 0xfffffff8, %r5
	.word 0xc36c2646  ! 361: PREFETCH_I	prefetch	[%r16 + 0x0646], #one_read
	.word 0x8ca42d23  ! 362: SUBcc_I	subcc 	%r16, 0x0d23, %r6
	.word 0x90042c18  ! 364: ADD_I	add 	%r16, 0x0c18, %r8
	.word 0xb2c40011  ! 364: ADDCcc_R	addccc 	%r16, %r17, %r25
	.word 0xc3ec1011  ! 364: PREFETCHA_R	prefetcha	[%r16, %r17] 0x80, #one_read
	.word 0xfe740011  ! 365: STX_R	stx	%r31, [%r16 + %r17]
	.word 0xc36c0011  ! 367: PREFETCH_R	prefetch	[%r16 + %r17], #one_read
	.word 0xc6340011  ! 368: STH_R	sth	%r3, [%r16 + %r17]
	.word 0x8c940011  ! 370: ORcc_R	orcc 	%r16, %r17, %r6
	.word 0x881424e2  ! 370: OR_I	or 	%r16, 0x04e2, %r4
thr1_resum_intr_6:
!$EV trig_pc_d(1,expr(@VA(.MAIN.thr1_resum_intr_6), 16, 16)) -> intp(1, 3, 1)
	wr      %r0, 0x5, %asr26
	.word 0x96140011  ! 371: OR_R	or 	%r16, %r17, %r11
	.word 0xb01c0011  ! 373: XOR_R	xor 	%r16, %r17, %r24
	.word 0xde8c1011  ! 373: LDUBA_R	lduba	[%r16, %r17] 0x80, %r15
	.word 0xc8240011  ! 374: STW_R	stw	%r4, [%r16 + %r17]
	.word 0x89643801  ! 376: MOVcc_I	<illegal instruction>
	.word 0xa4ac21ce  ! 376: ANDNcc_I	andncc 	%r16, 0x01ce, %r18
	.word 0x8143e066  ! 376: MEMBAR	membar	#StoreLoad | #LoadStore | #MemIssue | #Sync 
thr1_irf_ce_18:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_18), 16, 16),1,IRF,ce,18,x, x,x,x, x,x,x)
	.word 0xc62c28ab  ! 379: STB_I	stb	%r3, [%r16 + 0x08ab]
	.word 0x8143c000  ! 381: STBAR	stbar
	.word 0xc6240011  ! 382: STW_R	stw	%r3, [%r16 + %r17]
	.word 0xaf2c3001  ! 384: SLLX_I	sllx	%r16, 0x0001, %r23
	.word 0xbd3c1011  ! 384: SRAX_R	srax	%r16, %r17, %r30
	.word 0xb5341011  ! 384: SRLX_R	srlx	%r16, %r17, %r26
	ta	T_CHANGE_PRIV	! macro
	.word 0xc8740011  ! 385: STX_R	stx	%r4, [%r16 + %r17]
	.word 0x889c2ccb  ! 387: XORcc_I	xorcc 	%r16, 0x0ccb, %r4
	.word 0x8b341011  ! 387: SRLX_R	srlx	%r16, %r17, %r5
	.word 0xb29c2152  ! 387: XORcc_I	xorcc 	%r16, 0x0152, %r25
	.word 0x81580000  ! 387: FLUSHW	flushw
	.word 0xca340011  ! 388: STH_R	sth	%r5, [%r16 + %r17]
	.word 0xa83c0011  ! 390: XNOR_R	xnor 	%r16, %r17, %r20
	.word 0xde1c2360  ! 390: LDD_I	ldd	[%r16 + 0x0360], %r15
	.word 0xd8340011  ! 391: STH_R	sth	%r12, [%r16 + %r17]
	.word 0xc73c2327  ! 393: STDF_I	std	%f3, [0x0327, %r16]
	.word 0xc8742773  ! 395: STX_I	stx	%r4, [%r16 + 0x0773]
	.word 0xb4b42ac8  ! 397: ORNcc_I	orncc 	%r16, 0x0ac8, %r26
	.word 0x9f518000  ! 397: RDPR_PSTATE	rdpr	%pstate, %r15
	.word 0xe8740011  ! 398: STX_R	stx	%r20, [%r16 + %r17]
	.word 0x941c0011  ! 400: XOR_R	xor 	%r16, %r17, %r10
	.word 0xba1421b3  ! 400: OR_I	or 	%r16, 0x01b3, %r29
	.word 0x22800001  ! 400: BE	be,a	<label_0x1>
	.word 0x952c0011  ! 401: SLL_R	sll 	%r16, %r17, %r10
	.word 0xc3ec1011  ! 403: PREFETCHA_R	prefetcha	[%r16, %r17] 0x80, #one_read
thr1_irf_ce_19:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_19), 16, 16),1,IRF,ce,13,x, x,x,x, x,x,x)
	.word 0xd4342ef3  ! 406: STH_I	sth	%r10, [%r16 + 0x0ef3]
	.word 0x873c2001  ! 408: SRA_I	sra 	%r16, 0x0001, %r3
	.word 0x84442189  ! 408: ADDC_I	addc 	%r16, 0x0189, %r2
	.word 0xf20c217a  ! 408: LDUB_I	ldub	[%r16 + 0x017a], %r25
	.word 0xfc242e5b  ! 410: STW_I	stw	%r30, [%r16 + 0x0e5b]
	.word 0x8143c000  ! 412: STBAR	stbar
	.word 0x952c0011  ! 413: SLL_R	sll 	%r16, %r17, %r10
	.word 0xa4940011  ! 415: ORcc_R	orcc 	%r16, %r17, %r18
	.word 0xecfc1011  ! 415: SWAPA_R	swapa	%r22, [%r16 + %r17] 0x80
	.word 0xf6340011  ! 416: STH_R	sth	%r27, [%r16 + %r17]
	.word 0x821c2993  ! 418: XOR_I	xor 	%r16, 0x0993, %r1
	.word 0x932c0011  ! 418: SLL_R	sll 	%r16, %r17, %r9
	.word 0x81880000  ! 418: SAVED	saved
	.word 0x8d7c0411  ! 419: MOVR_R	move	%r16, %r17, %r6
	.word 0x9f343001  ! 421: SRLX_I	srlx	%r16, 0x0001, %r15
	.word 0x81580000  ! 421: FLUSHW	flushw
thr1_irf_ce_20:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_20), 16, 16),1,IRF,ce,24,x, x,x,x, x,x,x)
	.word 0xd43426c5  ! 424: STH_I	sth	%r10, [%r16 + 0x06c5]
	.word 0xbfe40011  ! 426: SAVE_R	save	%r16, %r17, %r31
	.word 0xfe2c23d7  ! 428: STB_I	stb	%r31, [%r16 + 0x03d7]
	.word 0x85342001  ! 430: SRL_I	srl 	%r16, 0x0001, %r2
	.word 0x81dc2cc2  ! 430: FLUSH_I	dis not found

	.word 0xec240011  ! 431: STW_R	stw	%r22, [%r16 + %r17]
	.word 0x8e0c2ced  ! 433: AND_I	and 	%r16, 0x0ced, %r7
	.word 0x9b2c1011  ! 433: SLLX_R	sllx	%r16, %r17, %r13
	.word 0xb12c2001  ! 433: SLL_I	sll 	%r16, 0x0001, %r24
	.word 0x8548c000  ! 433: RDHPR_HINTP	rdhpr	%hintp, %r2
	.word 0xd42c0011  ! 434: STB_R	stb	%r10, [%r16 + %r17]
	.word 0x961c0011  ! 436: XOR_R	xor 	%r16, %r17, %r11
	.word 0x96840011  ! 436: ADDcc_R	addcc 	%r16, %r17, %r11
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xc8742e45  ! 438: STX_I	stx	%r4, [%r16 + 0x0e45]
	.word 0x8143c000  ! 440: STBAR	stbar
	.word 0xc824236f  ! 442: STW_I	stw	%r4, [%r16 + 0x036f]
	.word 0x848c0011  ! 444: ANDcc_R	andcc 	%r16, %r17, %r2
	.word 0xc4440011  ! 444: LDSW_R	ldsw	[%r16 + %r17], %r2
	.word 0xf6242e8b  ! 446: STW_I	stw	%r27, [%r16 + 0x0e8b]
	.word 0x96c42f04  ! 448: ADDCcc_I	addccc 	%r16, 0x0f04, %r11
	.word 0x968c0011  ! 448: ANDcc_R	andcc 	%r16, %r17, %r11
	.word 0xc3ec1011  ! 448: PREFETCHA_R	prefetcha	[%r16, %r17] 0x80, #one_read
	.word 0xf034239b  ! 450: STH_I	sth	%r24, [%r16 + 0x039b]
	.word 0x882c22b3  ! 452: ANDN_I	andn 	%r16, 0x02b3, %r4
	.word 0x877c0411  ! 452: MOVR_R	move	%r16, %r17, %r3
        wr %g0, 0x4, %fprs
thr1_irf_ce_21:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_21), 16, 16),1,IRF,ce,8,x, x,x,x, x,x,x)
	.word 0xcc74251f  ! 455: STX_I	stx	%r6, [%r16 + 0x051f]
	.word 0x832c2001  ! 457: SLL_I	sll 	%r16, 0x0001, %r1
	.word 0x86142f73  ! 457: OR_I	or 	%r16, 0x0f73, %r3
	.word 0x889c2c5f  ! 457: XORcc_I	xorcc 	%r16, 0x0c5f, %r4
	.word 0xd2f41011  ! 457: STXA_R	stxa	%r9, [%r16 + %r17] 0x80
thr1_irf_ce_22:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_22), 16, 16),1,IRF,ce,18,x, x,x,x, x,x,x)
	.word 0xdc342b39  ! 460: STH_I	sth	%r14, [%r16 + 0x0b39]
	.word 0xc49c23f1  ! 462: LDDA_I	ldda	[%r16, + 0x03f1] %asi, %r2
thr1_irf_ce_23:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_23), 16, 16),1,IRF,ce,15,x, x,x,x, x,x,x)
	.word 0xd82c2859  ! 465: STB_I	stb	%r12, [%r16 + 0x0859]
	.word 0x9a9c0011  ! 467: XORcc_R	xorcc 	%r16, %r17, %r13
	.word 0xa4142a72  ! 467: OR_I	or 	%r16, 0x0a72, %r18
	.word 0xdc440011  ! 467: LDSW_R	ldsw	[%r16 + %r17], %r14
thr1_irf_ce_24:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_24), 16, 16),1,IRF,ce,28,x, x,x,x, x,x,x)
	.word 0xe82c2b53  ! 470: STB_I	stb	%r20, [%r16 + 0x0b53]
	.word 0x9c3c0011  ! 472: XNOR_R	xnor 	%r16, %r17, %r14
	.word 0x98bc0011  ! 472: XNORcc_R	xnorcc 	%r16, %r17, %r12
	.word 0x943c2bfd  ! 472: XNOR_I	xnor 	%r16, 0x0bfd, %r10
	.word 0x8143c000  ! 472: STBAR	stbar
	.word 0xce342d7b  ! 474: STH_I	sth	%r7, [%r16 + 0x0d7b]
	.word 0xaab40011  ! 476: ORNcc_R	orncc 	%r16, %r17, %r21
	.word 0xb1534000  ! 476: RDPR_OTHERWIN	<illegal instruction>
thr1_irf_ce_25:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_25), 16, 16),1,IRF,ce,3,x, x,x,x, x,x,x)
	.word 0xe47423f3  ! 479: STX_I	stx	%r18, [%r16 + 0x03f3]
	ta	T_CHANGE_PRIV	! macro
	.word 0xda340011  ! 482: STH_R	sth	%r13, [%r16 + %r17]
	.word 0x94dc2649  ! 484: SMULcc_I	smulcc 	%r16, 0x0649, %r10
	.word 0x9024295f  ! 485: SUB_I	sub 	%r16, 0x095f, %r8
	.word 0x92c42ffa  ! 487: ADDCcc_I	addccc 	%r16, 0x0ffa, %r9
	.word 0x8da00171  ! 487: FABSq	dis not found

	.word 0xc22c24e1  ! 489: STB_I	stb	%r1, [%r16 + 0x04e1]
	.word 0x917c0411  ! 491: MOVR_R	move	%r16, %r17, %r8
	.word 0x9e0c26e2  ! 491: AND_I	and 	%r16, 0x06e2, %r15
	.word 0xbbec0011  ! 491: RESTORE_R	restore	%r16, %r17, %r29
thr1_irf_ce_26:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_26), 16, 16),1,IRF,ce,36,x, x,x,x, x,x,x)
	.word 0xf8242737  ! 494: STW_I	stw	%r28, [%r16 + 0x0737]
	.word 0x841421dd  ! 496: OR_I	or 	%r16, 0x01dd, %r2
	.word 0x94ac25b2  ! 496: ANDNcc_I	andncc 	%r16, 0x05b2, %r10
	.word 0x81880000  ! 496: RESTORED	saved
	.word 0xc8742e6d  ! 498: STX_I	stx	%r4, [%r16 + 0x0e6d]
	.word 0xba440011  ! 500: ADDC_R	addc 	%r16, %r17, %r29
	.word 0xab2c3001  ! 500: SLLX_I	sllx	%r16, 0x0001, %r21
	.word 0xa53c1011  ! 500: SRAX_R	srax	%r16, %r17, %r18
thr1_resum_intr_7:
!$EV trig_pc_d(1,expr(@VA(.MAIN.thr1_resum_intr_7), 16, 16)) -> intp(1, 3, 1)
	wr      %r0, 0x5, %asr26
thr1_irf_ce_27:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_27), 16, 16),1,IRF,ce,63,x, x,x,x, x,x,x)
	.word 0xce2420fb  ! 503: STW_I	stw	%r7, [%r16 + 0x00fb]
	.word 0x8e342e43  ! 505: ORN_I	orn 	%r16, 0x0e43, %r7
	.word 0xb2c4233c  ! 505: ADDCcc_I	addccc 	%r16, 0x033c, %r25
	.word 0x8fa9c831  ! 505: FMOVVS	fmovs	%fcc1, %f17, %f7
	.word 0xb2440011  ! 506: ADDC_R	addc 	%r16, %r17, %r25
	.word 0xae0c2ddf  ! 508: AND_I	and 	%r16, 0x0ddf, %r23
	.word 0xbc0c2856  ! 508: AND_I	and 	%r16, 0x0856, %r30
	.word 0x92bc2311  ! 508: XNORcc_I	xnorcc 	%r16, 0x0311, %r9
	.word 0xc69c1011  ! 508: LDDA_R	ldda	[%r16, %r17] 0x80, %r3
	.word 0xa4ac2d79  ! 509: ANDNcc_I	andncc 	%r16, 0x0d79, %r18
	.word 0xaa0c2237  ! 511: AND_I	and 	%r16, 0x0237, %r21
	.word 0x993c1011  ! 511: SRAX_R	srax	%r16, %r17, %r12
	.word 0x94bc0011  ! 511: XNORcc_R	xnorcc 	%r16, %r17, %r10
	.word 0xbfec0011  ! 511: RESTORE_R	restore	%r16, %r17, %r31
	.word 0xe6342127  ! 513: STH_I	sth	%r19, [%r16 + 0x0127]
	.word 0x82c42cd1  ! 515: ADDCcc_I	addccc 	%r16, 0x0cd1, %r1
	.word 0x823c2a48  ! 515: XNOR_I	xnor 	%r16, 0x0a48, %r1
thr1_resum_intr_8:
!$EV trig_pc_d(1,expr(@VA(.MAIN.thr1_resum_intr_8), 16, 16)) -> intp(1, 3, 1)
	wr      %r0, 0x5, %asr26
thr1_irf_ce_28:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_28), 16, 16),1,IRF,ce,45,x, x,x,x, x,x,x)
	.word 0xca742651  ! 518: STX_I	stx	%r5, [%r16 + 0x0651]
	.word 0x9d342001  ! 520: SRL_I	srl 	%r16, 0x0001, %r14
	.word 0xbac40011  ! 520: ADDCcc_R	addccc 	%r16, %r17, %r29
	.word 0x8143e016  ! 520: MEMBAR	membar	#StoreLoad | #LoadStore | #Lookaside 
	.word 0x93341011  ! 521: SRLX_R	srlx	%r16, %r17, %r9
	.word 0x9f3c2001  ! 523: SRA_I	sra 	%r16, 0x0001, %r15
	.word 0x862c0011  ! 523: ANDN_R	andn 	%r16, %r17, %r3
thr1_resum_intr_9:
!$EV trig_pc_d(1,expr(@VA(.MAIN.thr1_resum_intr_9), 16, 16)) -> intp(1, 3, 1)
	wr      %r0, 0x5, %asr26
	.word 0xf2340011  ! 524: STH_R	sth	%r25, [%r16 + %r17]
	.word 0x9c142932  ! 526: OR_I	or 	%r16, 0x0932, %r14
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xc8340011  ! 527: STH_R	sth	%r4, [%r16 + %r17]
	.word 0x82dc0011  ! 529: SMULcc_R	smulcc 	%r16, %r17, %r1
	.word 0xd8240011  ! 530: STW_R	stw	%r12, [%r16 + %r17]
	.word 0xaf528000  ! 532: RDPR_CANSAVE	<illegal instruction>
	.word 0xf42c0011  ! 533: STB_R	stb	%r26, [%r16 + %r17]
	.word 0xbc3c2094  ! 535: XNOR_I	xnor 	%r16, 0x0094, %r30
	.word 0xaf641811  ! 535: MOVcc_R	<illegal instruction>
	.word 0x8af421eb  ! 535: UDIVcc_I	udivcc 	%r16, 0x01eb, %r5
	.word 0xfe2c2c65  ! 537: STB_I	stb	%r31, [%r16 + 0x0c65]
	.word 0x9b7c0411  ! 539: MOVR_R	move	%r16, %r17, %r13
	.word 0x98842f56  ! 539: ADDcc_I	addcc 	%r16, 0x0f56, %r12
	.word 0x9eb42b54  ! 539: ORNcc_I	orncc 	%r16, 0x0b54, %r15
	.word 0x06c40003  ! 539: BRLZ	brlz  ,nt	%16,<label_0x40003>
thr1_irf_ce_29:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_29), 16, 16),1,IRF,ce,14,x, x,x,x, x,x,x)
	.word 0xce742c8d  ! 542: STX_I	stx	%r7, [%r16 + 0x0c8d]
	.word 0x2a800003  ! 544: BCS	bcs,a	<label_0x3>
	.word 0x86842439  ! 545: ADDcc_I	addcc 	%r16, 0x0439, %r3
	.word 0x932c3001  ! 547: SLLX_I	sllx	%r16, 0x0001, %r9
	.word 0xae840011  ! 547: ADDcc_R	addcc 	%r16, %r17, %r23
	.word 0x93342001  ! 547: SRL_I	srl 	%r16, 0x0001, %r9
thr1_resum_intr_10:
!$EV trig_pc_d(1,expr(@VA(.MAIN.thr1_resum_intr_10), 16, 16)) -> intp(1, 3, 1)
	wr      %r0, 0x5, %asr26
	.word 0x94440011  ! 548: ADDC_R	addc 	%r16, %r17, %r10
	.word 0x92140011  ! 550: OR_R	or 	%r16, %r17, %r9
	.word 0x8143c000  ! 550: STBAR	stbar
	.word 0x88342095  ! 551: SUBC_I	orn 	%r16, 0x0095, %r4
	.word 0xb09c26ce  ! 553: XORcc_I	xorcc 	%r16, 0x06ce, %r24
	.word 0x822c28b2  ! 553: ANDN_I	andn 	%r16, 0x08b2, %r1
	.word 0x90c40011  ! 553: ADDCcc_R	addccc 	%r16, %r17, %r8
	.word 0x81880000  ! 553: RESTORED	saved
thr1_irf_ce_30:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_30), 16, 16),1,IRF,ce,2,x, x,x,x, x,x,x)
	.word 0xd0342cd7  ! 556: STH_I	sth	%r8, [%r16 + 0x0cd7]
	.word 0xb81c0011  ! 558: XOR_R	xor 	%r16, %r17, %r28
	.word 0x917c2401  ! 558: MOVR_I	move	%r16, 0xfffffff8, %r8
	.word 0x81dc2d30  ! 558: FLUSH_I	dis not found

	.word 0x98b42e23  ! 559: ORNcc_I	orncc 	%r16, 0x0e23, %r12
	.word 0x96fc2ade  ! 561: SDIVcc_I	sdivcc 	%r16, 0x0ade, %r11
	.word 0xd6242037  ! 563: STW_I	stw	%r11, [%r16 + 0x0037]
	.word 0x0ac40001  ! 565: BRNZ	brnz  ,nt	%16,<label_0x40001>
	.word 0xcc240011  ! 566: STW_R	stw	%r6, [%r16 + %r17]
	.word 0x963c0011  ! 568: XNOR_R	xnor 	%r16, %r17, %r11
	.word 0x882c28af  ! 568: ANDN_I	andn 	%r16, 0x08af, %r4
	.word 0x9d7c2401  ! 568: MOVR_I	move	%r16, 0xfffffff8, %r14
	.word 0x85534000  ! 568: RDPR_OTHERWIN	rdpr	%otherwin, %r2
	.word 0xda740011  ! 569: STX_R	stx	%r13, [%r16 + %r17]
	.word 0xd8142861  ! 571: LDUH_I	lduh	[%r16 + 0x0861], %r12
thr1_irf_ce_31:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_31), 16, 16),1,IRF,ce,8,x, x,x,x, x,x,x)
	.word 0xd62c2905  ! 574: STB_I	stb	%r11, [%r16 + 0x0905]
	.word 0xa4940011  ! 576: ORcc_R	orcc 	%r16, %r17, %r18
	.word 0x98540011  ! 576: UMUL_R	umul 	%r16, %r17, %r12
	.word 0xe6342c51  ! 578: STH_I	sth	%r19, [%r16 + 0x0c51]
	.word 0x8a042a27  ! 580: ADD_I	add 	%r16, 0x0a27, %r5
	.word 0xcc9c26e9  ! 580: LDDA_I	ldda	[%r16, + 0x06e9] %asi, %r6
	.word 0xda240011  ! 581: STW_R	stw	%r13, [%r16 + %r17]
	.word 0xbabc0011  ! 583: XNORcc_R	xnorcc 	%r16, %r17, %r29
	.word 0xaac40011  ! 583: ADDCcc_R	addccc 	%r16, %r17, %r21
	.word 0x872c0011  ! 583: SLL_R	sll 	%r16, %r17, %r3
thr1_resum_intr_11:
!$EV trig_pc_d(1,expr(@VA(.MAIN.thr1_resum_intr_11), 16, 16)) -> intp(1, 3, 1)
	wr      %r0, 0x5, %asr26
	.word 0xd42c0011  ! 584: STB_R	stb	%r10, [%r16 + %r17]
	.word 0xee7c2235  ! 586: SWAP_I	swap	%r23, [%r16 + 0x0235]
	.word 0xc6240011  ! 587: STW_R	stw	%r3, [%r16 + %r17]
	.word 0xbc342e2d  ! 589: ORN_I	orn 	%r16, 0x0e2d, %r30
	.word 0x82ac2235  ! 589: ANDNcc_I	andncc 	%r16, 0x0235, %r1
	.word 0x81dc0011  ! 589: FLUSH_R	dis not found

	.word 0xe474293f  ! 591: STX_I	stx	%r18, [%r16 + 0x093f]
	.word 0x38800001  ! 593: BGU	bgu,a	<label_0x1>
	.word 0xac240011  ! 594: SUB_R	sub 	%r16, %r17, %r22
	.word 0x90340011  ! 596: ORN_R	orn 	%r16, %r17, %r8
	.word 0x90942155  ! 596: ORcc_I	orcc 	%r16, 0x0155, %r8
	.word 0xfeb422c6  ! 596: STHA_I	stha	%r31, [%r16 + 0x02c6] %asi
	.word 0xee740011  ! 597: STX_R	stx	%r23, [%r16 + %r17]
        wr %g0, 0x4, %fprs
	.word 0xe4342469  ! 601: STH_I	sth	%r18, [%r16 + 0x0469]
	.word 0x909c0011  ! 603: XORcc_R	xorcc 	%r16, %r17, %r8
	.word 0xbc942075  ! 603: ORcc_I	orcc 	%r16, 0x0075, %r30
thr1_resum_intr_12:
!$EV trig_pc_d(1,expr(@VA(.MAIN.thr1_resum_intr_12), 16, 16)) -> intp(1, 3, 1)
	wr      %r0, 0x5, %asr26
	.word 0xc2240011  ! 604: STW_R	stw	%r1, [%r16 + %r17]
	.word 0xbfa40951  ! 606: FMULd	fmuld	%f16, %f48, %f62
	.word 0x97342001  ! 607: SRL_I	srl 	%r16, 0x0001, %r11
	.word 0xbc1c0011  ! 609: XOR_R	xor 	%r16, %r17, %r30
	.word 0x912c0011  ! 609: SLL_R	sll 	%r16, %r17, %r8
	.word 0x96b40011  ! 609: ORNcc_R	orncc 	%r16, %r17, %r11
thr1_resum_intr_13:
!$EV trig_pc_d(1,expr(@VA(.MAIN.thr1_resum_intr_13), 16, 16)) -> intp(1, 3, 1)
	wr      %r0, 0x5, %asr26
	.word 0xd2242d63  ! 611: STW_I	stw	%r9, [%r16 + 0x0d63]
	.word 0xbabc0011  ! 613: XNORcc_R	xnorcc 	%r16, %r17, %r29
	.word 0xb404261f  ! 613: ADD_I	add 	%r16, 0x061f, %r26
	.word 0x94c42fbc  ! 613: ADDCcc_I	addccc 	%r16, 0x0fbc, %r10
	.word 0xeefc1011  ! 613: SWAPA_R	swapa	%r23, [%r16 + %r17] 0x80
	.word 0x8c240011  ! 614: SUB_R	sub 	%r16, %r17, %r6
	.word 0xac3c2ca7  ! 616: XNOR_I	xnor 	%r16, 0x0ca7, %r22
	.word 0xdad42485  ! 616: LDSHA_I	ldsha	[%r16, + 0x0485] %asi, %r13
	.word 0xbb7c2401  ! 617: MOVR_I	move	%r16, 0x7fffbdd8, %r29
	.word 0x97343001  ! 619: SRLX_I	srlx	%r16, 0x0001, %r11
thr1_resum_intr_14:
!$EV trig_pc_d(1,expr(@VA(.MAIN.thr1_resum_intr_14), 16, 16)) -> intp(1, 3, 1)
	wr      %r0, 0x5, %asr26
thr1_irf_ce_32:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_32), 16, 16),1,IRF,ce,43,x, x,x,x, x,x,x)
	.word 0xe42c2205  ! 622: STB_I	stb	%r18, [%r16 + 0x0205]
	.word 0x8e040011  ! 624: ADD_R	add 	%r16, %r17, %r7
	.word 0xb2842e65  ! 624: ADDcc_I	addcc 	%r16, 0x0e65, %r25
	.word 0x904c0011  ! 624: MULX_R	mulx 	%r16, %r17, %r8
	.word 0xc62c2085  ! 626: STB_I	stb	%r3, [%r16 + 0x0085]
	.word 0xbba01051  ! 628: FdTOx	dis not found

	.word 0x897c0411  ! 629: MOVR_R	move	%r16, %r17, %r4
	.word 0x9cac0011  ! 631: ANDNcc_R	andncc 	%r16, %r17, %r14
	.word 0x82140011  ! 631: OR_R	or 	%r16, %r17, %r1
	.word 0x90442195  ! 631: ADDC_I	addc 	%r16, 0x0195, %r8
	.word 0x9a5c2d56  ! 631: SMUL_I	smul 	%r16, 0x0d56, %r13
	.word 0xa8342999  ! 632: ORN_I	orn 	%r16, 0x0999, %r20
	.word 0x92ac28a0  ! 634: ANDNcc_I	andncc 	%r16, 0x08a0, %r9
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xfa740011  ! 635: STX_R	stx	%r29, [%r16 + %r17]
	ta	T_CHANGE_PRIV	! macro
	.word 0xee742725  ! 639: STX_I	stx	%r23, [%r16 + 0x0725]
	.word 0x8a3c0011  ! 641: XNOR_R	xnor 	%r16, %r17, %r5
	ta	T_CHANGE_NONPRIV	! macro
thr1_irf_ce_33:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_33), 16, 16),1,IRF,ce,46,x, x,x,x, x,x,x)
	.word 0xe8242591  ! 644: STW_I	stw	%r20, [%r16 + 0x0591]
	.word 0x9a3c2ff9  ! 646: XNOR_I	xnor 	%r16, 0x0ff9, %r13
	.word 0x829c0011  ! 646: XORcc_R	xorcc 	%r16, %r17, %r1
	.word 0x8b2c1011  ! 646: SLLX_R	sllx	%r16, %r17, %r5
	.word 0x96dc251d  ! 646: SMULcc_I	smulcc 	%r16, 0x051d, %r11
	.word 0xac040011  ! 647: ADD_R	add 	%r16, %r17, %r22
	.word 0x9eb40011  ! 649: ORNcc_R	orncc 	%r16, %r17, %r15
	ta	T_CHANGE_PRIV	! macro
	.word 0xb7340011  ! 650: SRL_R	srl 	%r16, %r17, %r27
	.word 0x93341011  ! 652: SRLX_R	srlx	%r16, %r17, %r9
	.word 0xced42029  ! 652: LDSHA_I	ldsha	[%r16, + 0x0029] %asi, %r7
	.word 0xd274247f  ! 654: STX_I	stx	%r9, [%r16 + 0x047f]
	.word 0x95641811  ! 656: MOVcc_R	<illegal instruction>
	.word 0x8a8c2b40  ! 656: ANDcc_I	andcc 	%r16, 0x0b40, %r5
	.word 0xd0bc2024  ! 656: STDA_I	stda	%r8, [%r16 + 0x0024] %asi
	.word 0xb62c2c14  ! 657: ANDN_I	andn 	%r16, 0x0c14, %r27
	.word 0xb23c2a5c  ! 659: XNOR_I	xnor 	%r16, 0x0a5c, %r25
	.word 0x877c2401  ! 659: MOVR_I	move	%r16, 0xfffffff8, %r3
thr1_resum_intr_15:
!$EV trig_pc_d(1,expr(@VA(.MAIN.thr1_resum_intr_15), 16, 16)) -> intp(1, 3, 1)
	wr      %r0, 0x5, %asr26
	.word 0xc4740011  ! 660: STX_R	stx	%r2, [%r16 + %r17]
	.word 0xca542354  ! 662: LDSH_I	ldsh	[%r16 + 0x0354], %r5
	.word 0xb17c2401  ! 663: MOVR_I	move	%r16, 0x7fffbdd8, %r24
	.word 0x9b342001  ! 665: SRL_I	srl 	%r16, 0x0001, %r13
	.word 0x9d2c0011  ! 665: SLL_R	sll 	%r16, %r17, %r14
	.word 0x81580000  ! 665: FLUSHW	flushw
	.word 0xe82c0011  ! 666: STB_R	stb	%r20, [%r16 + %r17]
	.word 0x8b3c0011  ! 668: SRA_R	sra 	%r16, %r17, %r5
thr1_resum_intr_16:
!$EV trig_pc_d(1,expr(@VA(.MAIN.thr1_resum_intr_16), 16, 16)) -> intp(1, 3, 1)
	wr      %r0, 0x5, %asr26
	.word 0xc8340011  ! 669: STH_R	sth	%r4, [%r16 + %r17]
thr1_resum_intr_17:
!$EV trig_pc_d(1,expr(@VA(.MAIN.thr1_resum_intr_17), 16, 16)) -> intp(1, 3, 1)
	wr      %r0, 0x5, %asr26
thr1_irf_ce_34:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_34), 16, 16),1,IRF,ce,32,x, x,x,x, x,x,x)
	.word 0xc8742683  ! 674: STX_I	stx	%r4, [%r16 + 0x0683]
	.word 0x82040011  ! 676: ADD_R	add 	%r16, %r17, %r1
	.word 0x85342001  ! 676: SRL_I	srl 	%r16, 0x0001, %r2
	.word 0x948c0011  ! 676: ANDcc_R	andcc 	%r16, %r17, %r10
	.word 0xbb480000  ! 676: RDHPR_HPSTATE	rdhpr	%hpstate, %r29
	.word 0x88bc23f0  ! 677: XNORcc_I	xnorcc 	%r16, 0x03f0, %r4
	.word 0x84440011  ! 679: ADDC_R	addc 	%r16, %r17, %r2
	.word 0xae9c0011  ! 679: XORcc_R	xorcc 	%r16, %r17, %r23
	.word 0x9a040011  ! 679: ADD_R	add 	%r16, %r17, %r13
	.word 0xc2f4298a  ! 679: STXA_I	stxa	%r1, [%r16 + 0x098a] %asi
	.word 0x97340011  ! 680: SRL_R	srl 	%r16, %r17, %r11
	.word 0x8ad40011  ! 682: UMULcc_R	umulcc 	%r16, %r17, %r5
	.word 0xd82425d5  ! 684: STW_I	stw	%r12, [%r16 + 0x05d5]
	.word 0xb1641811  ! 686: MOVcc_R	<illegal instruction>
	.word 0x8ebc2adf  ! 686: XNORcc_I	xnorcc 	%r16, 0x0adf, %r7
	.word 0xa952c000  ! 686: RDPR_CANRESTORE	<illegal instruction>
thr1_irf_ce_35:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_35), 16, 16),1,IRF,ce,51,x, x,x,x, x,x,x)
	.word 0xde742153  ! 689: STX_I	stx	%r15, [%r16 + 0x0153]
	.word 0x8cac0011  ! 691: ANDNcc_R	andncc 	%r16, %r17, %r6
	.word 0x84842be8  ! 691: ADDcc_I	addcc 	%r16, 0x0be8, %r2
	.word 0x89ec0011  ! 691: RESTORE_R	restore	%r16, %r17, %r4
thr1_irf_ce_36:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_36), 16, 16),1,IRF,ce,70,x, x,x,x, x,x,x)
	.word 0xec2c2afb  ! 694: STB_I	stb	%r22, [%r16 + 0x0afb]
	.word 0xc67c25cb  ! 696: SWAP_I	swap	%r3, [%r16 + 0x05cb]
	.word 0xc87420cd  ! 698: STX_I	stx	%r4, [%r16 + 0x00cd]
	.word 0xc67c0011  ! 700: SWAP_R	swap	%r3, [%r16 + %r17]
	.word 0xd23424c9  ! 702: STH_I	sth	%r9, [%r16 + 0x04c9]
	.word 0x8e440011  ! 704: ADDC_R	addc 	%r16, %r17, %r7
	.word 0xb6ac0011  ! 704: ANDNcc_R	andncc 	%r16, %r17, %r27
	.word 0xba0c2a74  ! 704: AND_I	and 	%r16, 0x0a74, %r29
	.word 0x86d40011  ! 704: UMULcc_R	umulcc 	%r16, %r17, %r3
	.word 0x963c0011  ! 705: XNOR_R	xnor 	%r16, %r17, %r11
	.word 0x922c0011  ! 707: ANDN_R	andn 	%r16, %r17, %r9
	.word 0x852c3001  ! 707: SLLX_I	sllx	%r16, 0x0001, %r2
	.word 0x8a3c2289  ! 707: XNOR_I	xnor 	%r16, 0x0289, %r5
	.word 0x8143e06d  ! 707: MEMBAR	membar	#LoadLoad | #LoadStore | #StoreStore | #MemIssue | #Sync 
thr1_irf_ce_37:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_37), 16, 16),1,IRF,ce,34,x, x,x,x, x,x,x)
	.word 0xde242fa3  ! 710: STW_I	stw	%r15, [%r16 + 0x0fa3]
	.word 0x81880000  ! 712: SAVED	saved
	.word 0xa80c2d96  ! 713: AND_I	and 	%r16, 0x0d96, %r20
	.word 0xaabc0011  ! 715: XNORcc_R	xnorcc 	%r16, %r17, %r21
	.word 0x987c29f5  ! 715: SDIV_I	sdiv 	%r16, 0x09f5, %r12
thr1_irf_ce_38:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_38), 16, 16),1,IRF,ce,7,x, x,x,x, x,x,x)
	.word 0xd0342515  ! 718: STH_I	sth	%r8, [%r16 + 0x0515]
	.word 0x8d343001  ! 720: SRLX_I	srlx	%r16, 0x0001, %r6
	.word 0x992c3001  ! 720: SLLX_I	sllx	%r16, 0x0001, %r12
	.word 0xa48c2c91  ! 720: ANDcc_I	andcc 	%r16, 0x0c91, %r18
	.word 0xdfe41011  ! 720: CASA_I	casa	[%r16] 0x80, %r17, %r15
thr1_irf_ce_39:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_39), 16, 16),1,IRF,ce,20,x, x,x,x, x,x,x)
	.word 0xd2742327  ! 723: STX_I	stx	%r9, [%r16 + 0x0327]
	.word 0x8a442605  ! 725: ADDC_I	addc 	%r16, 0x0605, %r5
	.word 0xb6940011  ! 725: ORcc_R	orcc 	%r16, %r17, %r27
	.word 0x9153c000  ! 725: RDPR_FQ	<illegal instruction>
	.word 0x9a0429f3  ! 726: ADD_I	add 	%r16, 0x09f3, %r13
	.word 0x9abc2739  ! 728: XNORcc_I	xnorcc 	%r16, 0x0739, %r13
	.word 0x984c2434  ! 728: MULX_I	mulx 	%r16, 0x0434, %r12
	.word 0xf8242749  ! 730: STW_I	stw	%r28, [%r16 + 0x0749]
	.word 0x942c0011  ! 732: ANDN_R	andn 	%r16, %r17, %r10
	.word 0xf46c0011  ! 732: LDSTUB_R	ldstub	%r26, [%r16 + %r17]
	.word 0xcc742917  ! 734: STX_I	stx	%r6, [%r16 + 0x0917]
	.word 0x872c3001  ! 736: SLLX_I	sllx	%r16, 0x0001, %r3
	.word 0xab340011  ! 736: SRL_R	srl 	%r16, %r17, %r21
	.word 0xd0942368  ! 736: LDUHA_I	lduha	[%r16, + 0x0368] %asi, %r8
	.word 0x8e340011  ! 737: SUBC_R	orn 	%r16, %r17, %r7
	.word 0x92840011  ! 739: ADDcc_R	addcc 	%r16, %r17, %r9
	.word 0xbf3c0011  ! 739: SRA_R	sra 	%r16, %r17, %r31
	.word 0xcefc1011  ! 739: SWAPA_R	swapa	%r7, [%r16 + %r17] 0x80
	.word 0xe42c2473  ! 741: STB_I	stb	%r18, [%r16 + 0x0473]
	.word 0x8e4c0011  ! 743: MULX_R	mulx 	%r16, %r17, %r7
	.word 0xd0240011  ! 744: STW_R	stw	%r8, [%r16 + %r17]
	.word 0xab7c0411  ! 746: MOVR_R	move	%r16, %r17, %r21
	.word 0xc4fc1011  ! 746: SWAPA_R	swapa	%r2, [%r16 + %r17] 0x80
	.word 0xa5340011  ! 747: SRL_R	srl 	%r16, %r17, %r18
	.word 0xa4942593  ! 749: ORcc_I	orcc 	%r16, 0x0593, %r18
	.word 0x8aac26fb  ! 749: ANDNcc_I	andncc 	%r16, 0x06fb, %r5
thr1_resum_intr_18:
!$EV trig_pc_d(1,expr(@VA(.MAIN.thr1_resum_intr_18), 16, 16)) -> intp(1, 3, 1)
	wr      %r0, 0x5, %asr26
	.word 0xd8242c1b  ! 751: STW_I	stw	%r12, [%r16 + 0x0c1b]
	.word 0xb82c0011  ! 753: ANDN_R	andn 	%r16, %r17, %r28
	.word 0x97520000  ! 753: RDPR_PIL	rdpr	%pil, %r11
thr1_irf_ce_40:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_40), 16, 16),1,IRF,ce,62,x, x,x,x, x,x,x)
	.word 0xd8742ef3  ! 756: STX_I	stx	%r12, [%r16 + 0x0ef3]
	.word 0x9c840011  ! 758: ADDcc_R	addcc 	%r16, %r17, %r14
	.word 0x9094270b  ! 758: ORcc_I	orcc 	%r16, 0x070b, %r8
	.word 0x81dc2533  ! 758: FLUSH_I	dis not found

	.word 0xf4242b8d  ! 760: STW_I	stw	%r26, [%r16 + 0x0b8d]
	.word 0xb72c1011  ! 762: SLLX_R	sllx	%r16, %r17, %r27
	.word 0xb29c0011  ! 762: XORcc_R	xorcc 	%r16, %r17, %r25
	.word 0xb8942b9e  ! 762: ORcc_I	orcc 	%r16, 0x0b9e, %r28
	.word 0x95418000  ! 762: RDFPRS	rd	%fprs, %r10
thr1_irf_ce_41:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_41), 16, 16),1,IRF,ce,67,x, x,x,x, x,x,x)
	.word 0xe62c2b9f  ! 765: STB_I	stb	%r19, [%r16 + 0x0b9f]
	.word 0x8143c000  ! 767: STBAR	stbar
	.word 0xb7340011  ! 768: SRL_R	srl 	%r16, %r17, %r27
	.word 0xb32c0011  ! 770: SLL_R	sll 	%r16, %r17, %r25
	.word 0xee0c24d2  ! 770: LDUB_I	ldub	[%r16 + 0x04d2], %r23
	.word 0xde2c0011  ! 771: STB_R	stb	%r15, [%r16 + %r17]
	.word 0xb92c2001  ! 773: SLL_I	sll 	%r16, 0x0001, %r28
	.word 0x997c0411  ! 773: MOVR_R	move	%r16, %r17, %r12
	.word 0x04800001  ! 773: BLE	ble  	<label_0x1>
	.word 0xca2c0011  ! 774: STB_R	stb	%r5, [%r16 + %r17]
        wr %g0, 0x4, %fprs
	.word 0xc2242a57  ! 778: STW_I	stw	%r1, [%r16 + 0x0a57]
	.word 0x993c0011  ! 780: SRA_R	sra 	%r16, %r17, %r12
	.word 0xbcb420e2  ! 780: ORNcc_I	orncc 	%r16, 0x00e2, %r30
	.word 0xb89c0011  ! 780: XORcc_R	xorcc 	%r16, %r17, %r28
	.word 0x8143c000  ! 780: STBAR	stbar
thr1_irf_ce_42:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_42), 16, 16),1,IRF,ce,3,x, x,x,x, x,x,x)
	.word 0xcc74279b  ! 783: STX_I	stx	%r6, [%r16 + 0x079b]
	.word 0x94440011  ! 785: ADDC_R	addc 	%r16, %r17, %r10
	.word 0x81580000  ! 785: FLUSHW	flushw
	.word 0xea240011  ! 786: STW_R	stw	%r21, [%r16 + %r17]
	.word 0x9d7c0411  ! 788: MOVR_R	move	%r16, %r17, %r14
	.word 0x8abc0011  ! 788: XNORcc_R	xnorcc 	%r16, %r17, %r5
	.word 0x833c1011  ! 788: SRAX_R	srax	%r16, %r17, %r1
	.word 0x9a7c0011  ! 788: SDIV_R	sdiv 	%r16, %r17, %r13
	.word 0xb92c1011  ! 789: SLLX_R	sllx	%r16, %r17, %r28
	.word 0xaac40011  ! 791: ADDCcc_R	addccc 	%r16, %r17, %r21
	.word 0xbb342001  ! 791: SRL_I	srl 	%r16, 0x0001, %r29
	.word 0xba6c2f9e  ! 791: UDIVX_I	udivx 	%r16, 0x0f9e, %r29
thr1_irf_ce_43:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_43), 16, 16),1,IRF,ce,60,x, x,x,x, x,x,x)
	.word 0xce342abb  ! 794: STH_I	sth	%r7, [%r16 + 0x0abb]
	.word 0x84c40011  ! 796: ADDCcc_R	addccc 	%r16, %r17, %r2
	.word 0x81880000  ! 796: RESTORED	saved
	.word 0xde2c204f  ! 798: STB_I	stb	%r15, [%r16 + 0x004f]
	.word 0xba040011  ! 800: ADD_R	add 	%r16, %r17, %r29
	.word 0xa6842df6  ! 800: ADDcc_I	addcc 	%r16, 0x0df6, %r19
	.word 0x9c54252c  ! 800: UMUL_I	umul 	%r16, 0x052c, %r14
	.word 0xa4940011  ! 801: ORcc_R	orcc 	%r16, %r17, %r18
	.word 0xb92c0011  ! 803: SLL_R	sll 	%r16, %r17, %r28
	.word 0x88bc0011  ! 803: XNORcc_R	xnorcc 	%r16, %r17, %r4
	.word 0xc3ec2533  ! 803: PREFETCHA_I	prefetcha	[%r16, + 0x0533] %asi, #one_read
	.word 0x9d340011  ! 804: SRL_R	srl 	%r16, %r17, %r14
	.word 0xb7340011  ! 806: SRL_R	srl 	%r16, %r17, %r27
	.word 0xb77c2401  ! 806: MOVR_I	move	%r16, 0xfffffff8, %r27
	.word 0xa43c0011  ! 806: XNOR_R	xnor 	%r16, %r17, %r18
	.word 0x81880000  ! 806: RESTORED	saved
thr1_irf_ce_44:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_44), 16, 16),1,IRF,ce,20,x, x,x,x, x,x,x)
	.word 0xce342847  ! 809: STH_I	sth	%r7, [%r16 + 0x0847]
	.word 0x97342001  ! 811: SRL_I	srl 	%r16, 0x0001, %r11
	.word 0x960c0011  ! 811: AND_R	and 	%r16, %r17, %r11
	.word 0x9c140011  ! 811: OR_R	or 	%r16, %r17, %r14
	.word 0x81580000  ! 811: FLUSHW	flushw
thr1_irf_ce_45:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_45), 16, 16),1,IRF,ce,13,x, x,x,x, x,x,x)
	.word 0xee342f71  ! 814: STH_I	sth	%r23, [%r16 + 0x0f71]
	.word 0xb12c2001  ! 816: SLL_I	sll 	%r16, 0x0001, %r24
	.word 0x8143c000  ! 816: STBAR	stbar
	.word 0xfe2c0011  ! 817: STB_R	stb	%r31, [%r16 + %r17]
	.word 0xaf2c0011  ! 819: SLL_R	sll 	%r16, %r17, %r23
        wr %g0, 0x4, %fprs
	.word 0xec240011  ! 820: STW_R	stw	%r22, [%r16 + %r17]
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x9c2c0011  ! 823: ANDN_R	andn 	%r16, %r17, %r14
	.word 0xa9530000  ! 825: RDPR_CLEANWIN	rdpr	%cleanwin, %r20
	.word 0xde340011  ! 826: STH_R	sth	%r15, [%r16 + %r17]
	.word 0x992c3001  ! 828: SLLX_I	sllx	%r16, 0x0001, %r12
	.word 0x8c040011  ! 828: ADD_R	add 	%r16, %r17, %r6
	.word 0xc36c227b  ! 828: PREFETCH_I	prefetch	[%r16 + 0x027b], #one_read
	.word 0xfa740011  ! 829: STX_R	stx	%r29, [%r16 + %r17]
	.word 0x872c2001  ! 831: SLL_I	sll 	%r16, 0x0001, %r3
	.word 0xb21c2620  ! 831: XOR_I	xor 	%r16, 0x0620, %r25
	.word 0x92542a48  ! 831: UMUL_I	umul 	%r16, 0x0a48, %r9
thr1_irf_ce_46:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_46), 16, 16),1,IRF,ce,49,x, x,x,x, x,x,x)
	.word 0xc2242627  ! 834: STW_I	stw	%r1, [%r16 + 0x0627]
	.word 0xe8bc1011  ! 836: STDA_R	stda	%r20, [%r16 + %r17] 0x80
	.word 0xee240011  ! 837: STW_R	stw	%r23, [%r16 + %r17]
	.word 0xb9343001  ! 839: SRLX_I	srlx	%r16, 0x0001, %r28
	.word 0x97342001  ! 839: SRL_I	srl 	%r16, 0x0001, %r11
	.word 0xc2140011  ! 839: LDUH_R	lduh	[%r16 + %r17], %r1
	.word 0xea2c28eb  ! 841: STB_I	stb	%r21, [%r16 + 0x08eb]
	.word 0x87342001  ! 843: SRL_I	srl 	%r16, 0x0001, %r3
	.word 0x9b2c0011  ! 843: SLL_R	sll 	%r16, %r17, %r13
	.word 0x92840011  ! 843: ADDcc_R	addcc 	%r16, %r17, %r9
	.word 0xc36c2c2b  ! 843: PREFETCH_I	prefetch	[%r16 + 0x0c2b], #one_read
thr1_irf_ce_47:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_47), 16, 16),1,IRF,ce,71,x, x,x,x, x,x,x)
	.word 0xe6342ddf  ! 846: STH_I	sth	%r19, [%r16 + 0x0ddf]
	.word 0x873c0011  ! 848: SRA_R	sra 	%r16, %r17, %r3
	.word 0x943c0011  ! 848: XNOR_R	xnor 	%r16, %r17, %r10
	.word 0x9c2c27a9  ! 848: ANDN_I	andn 	%r16, 0x07a9, %r14
	.word 0x9d534000  ! 848: RDPR_OTHERWIN	<illegal instruction>
	.word 0x98240011  ! 849: SUB_R	sub 	%r16, %r17, %r12
	.word 0x961c0011  ! 851: XOR_R	xor 	%r16, %r17, %r11
	.word 0x920c0011  ! 851: AND_R	and 	%r16, %r17, %r9
	.word 0xf4bc1011  ! 851: STDA_R	stda	%r26, [%r16 + %r17] 0x80
	.word 0xbc340011  ! 852: ORN_R	orn 	%r16, %r17, %r30
	.word 0x81dc23a2  ! 854: FLUSH_I	dis not found

	.word 0xdc740011  ! 855: STX_R	stx	%r14, [%r16 + %r17]
	.word 0xb21c0011  ! 857: XOR_R	xor 	%r16, %r17, %r25
	.word 0xacbc2c44  ! 857: XNORcc_I	xnorcc 	%r16, 0x0c44, %r22
	.word 0xc36c0011  ! 857: PREFETCH_R	prefetch	[%r16 + %r17], #one_read
thr1_irf_ce_48:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_48), 16, 16),1,IRF,ce,61,x, x,x,x, x,x,x)
	.word 0xf22c29c5  ! 860: STB_I	stb	%r25, [%r16 + 0x09c5]
	.word 0xde0420a0  ! 862: LDUW_I	lduw	[%r16 + 0x00a0], %r15
thr1_irf_ce_49:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_49), 16, 16),1,IRF,ce,18,x, x,x,x, x,x,x)
	.word 0xee742689  ! 865: STX_I	stx	%r23, [%r16 + 0x0689]
	.word 0x9d341011  ! 867: SRLX_R	srlx	%r16, %r17, %r14
thr1_resum_intr_19:
!$EV trig_pc_d(1,expr(@VA(.MAIN.thr1_resum_intr_19), 16, 16)) -> intp(1, 3, 1)
	wr      %r0, 0x5, %asr26
	.word 0xde242f67  ! 869: STW_I	stw	%r15, [%r16 + 0x0f67]
	.word 0x96440011  ! 871: ADDC_R	addc 	%r16, %r17, %r11
	.word 0x83342001  ! 871: SRL_I	srl 	%r16, 0x0001, %r1
	.word 0xbcb40011  ! 871: ORNcc_R	orncc 	%r16, %r17, %r30
	.word 0xe6142b7d  ! 871: LDUH_I	lduh	[%r16 + 0x0b7d], %r19
	.word 0xc67424ad  ! 873: STX_I	stx	%r3, [%r16 + 0x04ad]
	.word 0x8143e022  ! 875: MEMBAR	membar	#StoreLoad | #MemIssue 
	.word 0xc6242901  ! 877: STW_I	stw	%r3, [%r16 + 0x0901]
	.word 0x8c842290  ! 879: ADDcc_I	addcc 	%r16, 0x0290, %r6
	.word 0x8143c000  ! 879: STBAR	stbar
	.word 0xf6242f0f  ! 881: STW_I	stw	%r27, [%r16 + 0x0f0f]
	.word 0x868c0011  ! 883: ANDcc_R	andcc 	%r16, %r17, %r3
	.word 0xc8bc2dc3  ! 883: STDA_I	stda	%r4, [%r16 + 0x0dc3] %asi
	.word 0x983c25b4  ! 884: XNOR_I	xnor 	%r16, 0x05b4, %r12
	.word 0x95ec0011  ! 886: RESTORE_R	restore	%r16, %r17, %r10
	.word 0xf0240011  ! 887: STW_R	stw	%r24, [%r16 + %r17]
	.word 0x87341011  ! 889: SRLX_R	srlx	%r16, %r17, %r3
	.word 0x8b2c3001  ! 889: SLLX_I	sllx	%r16, 0x0001, %r5
	.word 0xb7343001  ! 889: SRLX_I	srlx	%r16, 0x0001, %r27
	.word 0xc3ec27e8  ! 889: PREFETCHA_I	prefetcha	[%r16, + 0x07e8] %asi, #one_read
	.word 0xdc340011  ! 890: STH_R	sth	%r14, [%r16 + %r17]
thr1_resum_intr_20:
!$EV trig_pc_d(1,expr(@VA(.MAIN.thr1_resum_intr_20), 16, 16)) -> intp(1, 3, 1)
	wr      %r0, 0x5, %asr26
	.word 0x9d7c2401  ! 893: MOVR_I	move	%r16, 0x7fffbdd8, %r14
	.word 0xb32c2001  ! 895: SLL_I	sll 	%r16, 0x0001, %r25
	.word 0xaa6c2923  ! 895: UDIVX_I	udivx 	%r16, 0x0923, %r21
	.word 0xd6340011  ! 896: STH_R	sth	%r11, [%r16 + %r17]
	.word 0x84940011  ! 898: ORcc_R	orcc 	%r16, %r17, %r2
	.word 0xb29c201d  ! 898: XORcc_I	xorcc 	%r16, 0x001d, %r25
	.word 0xad342001  ! 898: SRL_I	srl 	%r16, 0x0001, %r22
	ta	T_CHANGE_HPRIV	! macro
thr1_irf_ce_50:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_50), 16, 16),1,IRF,ce,47,x, x,x,x, x,x,x)
	.word 0xe4342b63  ! 901: STH_I	sth	%r18, [%r16 + 0x0b63]
	.word 0x832c2001  ! 903: SLL_I	sll 	%r16, 0x0001, %r1
	.word 0x9a3c20cf  ! 903: XNOR_I	xnor 	%r16, 0x00cf, %r13
	.word 0x880c0011  ! 903: AND_R	and 	%r16, %r17, %r4
	.word 0x81dc25a3  ! 903: FLUSH_I	dis not found

	.word 0xec740011  ! 904: STX_R	stx	%r22, [%r16 + %r17]
	.word 0xbe2c20cc  ! 906: ANDN_I	andn 	%r16, 0x00cc, %r31
thr1_resum_intr_21:
!$EV trig_pc_d(1,expr(@VA(.MAIN.thr1_resum_intr_21), 16, 16)) -> intp(1, 3, 1)
	wr      %r0, 0x5, %asr26
	.word 0xde242d49  ! 908: STW_I	stw	%r15, [%r16 + 0x0d49]
	.word 0x9a442130  ! 910: ADDC_I	addc 	%r16, 0x0130, %r13
	.word 0x94940011  ! 910: ORcc_R	orcc 	%r16, %r17, %r10
	.word 0x9a0427e0  ! 910: ADD_I	add 	%r16, 0x07e0, %r13
	ta	T_CHANGE_HPRIV	! macro
	.word 0xde2c0011  ! 911: STB_R	stb	%r15, [%r16 + %r17]
	.word 0x8b2c1011  ! 913: SLLX_R	sllx	%r16, %r17, %r5
	.word 0x9c040011  ! 913: ADD_R	add 	%r16, %r17, %r14
	.word 0xa73c0011  ! 913: SRA_R	sra 	%r16, %r17, %r19
	.word 0xd8a41011  ! 913: STWA_R	stwa	%r12, [%r16 + %r17] 0x80
	.word 0xbe340011  ! 914: ORN_R	orn 	%r16, %r17, %r31
	.word 0x932c1011  ! 916: SLLX_R	sllx	%r16, %r17, %r9
	.word 0x81580000  ! 916: FLUSHW	flushw
	.word 0xbc1c0011  ! 917: XOR_R	xor 	%r16, %r17, %r30
	.word 0x8d840011  ! 919: WRFPRS_R	wr	%r16, %r17, %fprs
	.word 0xfa2424c7  ! 921: STW_I	stw	%r29, [%r16 + 0x04c7]
	.word 0x9c3c2bdc  ! 923: XNOR_I	xnor 	%r16, 0x0bdc, %r14
	.word 0x84840011  ! 923: ADDcc_R	addcc 	%r16, %r17, %r2
	.word 0xbd7c2401  ! 923: MOVR_I	move	%r16, 0xfffffff8, %r30
	.word 0x8143e071  ! 923: MEMBAR	membar	#LoadLoad | #Lookaside | #MemIssue | #Sync 
	.word 0xfe2c2ab7  ! 925: STB_I	stb	%r31, [%r16 + 0x0ab7]
	.word 0xa89c0011  ! 927: XORcc_R	xorcc 	%r16, %r17, %r20
	.word 0xba1c0011  ! 927: XOR_R	xor 	%r16, %r17, %r29
        wr %g0, 0x4, %fprs
	.word 0xd4240011  ! 928: STW_R	stw	%r10, [%r16 + %r17]
	.word 0x81dc2ee3  ! 930: FLUSH_I	dis not found

thr1_irf_ce_51:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_51), 16, 16),1,IRF,ce,66,x, x,x,x, x,x,x)
	.word 0xd82c2f53  ! 933: STB_I	stb	%r12, [%r16 + 0x0f53]
	.word 0x81580000  ! 935: FLUSHW	flushw
	.word 0xd83423e3  ! 937: STH_I	sth	%r12, [%r16 + 0x03e3]
	.word 0x87240011  ! 939: MULScc_R	mulscc 	%r16, %r17, %r3
	.word 0xda2c29cb  ! 941: STB_I	stb	%r13, [%r16 + 0x09cb]
	.word 0x8a9c23e0  ! 943: XORcc_I	xorcc 	%r16, 0x03e0, %r5
	.word 0x8a2c0011  ! 943: ANDN_R	andn 	%r16, %r17, %r5
	.word 0x91340011  ! 943: SRL_R	srl 	%r16, %r17, %r8
	.word 0xfeec2e87  ! 943: LDSTUBA_I	ldstuba	%r31, [%r16 + 0x0e87] %asi
thr1_irf_ce_52:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_52), 16, 16),1,IRF,ce,37,x, x,x,x, x,x,x)
	.word 0xd8242ef1  ! 946: STW_I	stw	%r12, [%r16 + 0x0ef1]
	.word 0xce7c2bf6  ! 948: SWAP_I	swap	%r7, [%r16 + 0x0bf6]
	.word 0x9d343001  ! 949: SRLX_I	srlx	%r16, 0x0001, %r14
	.word 0x8d2c0011  ! 951: SLL_R	sll 	%r16, %r17, %r6
	.word 0x8eb40011  ! 951: ORNcc_R	orncc 	%r16, %r17, %r7
	.word 0xf4bc1011  ! 951: STDA_R	stda	%r26, [%r16 + %r17] 0x80
thr1_irf_ce_53:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_53), 16, 16),1,IRF,ce,44,x, x,x,x, x,x,x)
	.word 0xf0742f97  ! 954: STX_I	stx	%r24, [%r16 + 0x0f97]
	.word 0xc36c276b  ! 956: PREFETCH_I	prefetch	[%r16 + 0x076b], #one_read
	.word 0xdc2c0011  ! 957: STB_R	stb	%r14, [%r16 + %r17]
	.word 0x8e140011  ! 959: OR_R	or 	%r16, %r17, %r7
	.word 0xa83423d6  ! 959: ORN_I	orn 	%r16, 0x03d6, %r20
	.word 0x8143c000  ! 959: STBAR	stbar
	.word 0xda2c0011  ! 960: STB_R	stb	%r13, [%r16 + %r17]
	.word 0x9c842b6b  ! 962: ADDcc_I	addcc 	%r16, 0x0b6b, %r14
	ta	T_CHANGE_NONHPRIV	! macro
thr1_irf_ce_54:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_54), 16, 16),1,IRF,ce,39,x, x,x,x, x,x,x)
	.word 0xd62c2683  ! 965: STB_I	stb	%r11, [%r16 + 0x0683]
	.word 0x81880000  ! 967: SAVED	saved
thr1_irf_ce_55:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_55), 16, 16),1,IRF,ce,29,x, x,x,x, x,x,x)
	.word 0xd6342237  ! 970: STH_I	sth	%r11, [%r16 + 0x0237]
	.word 0x85343001  ! 972: SRLX_I	srlx	%r16, 0x0001, %r2
	.word 0xbcac0011  ! 972: ANDNcc_R	andncc 	%r16, %r17, %r30
	.word 0xb57c0411  ! 972: MOVR_R	move	%r16, %r17, %r26
        wr %g0, 0x4, %fprs
thr1_irf_ce_56:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_56), 16, 16),1,IRF,ce,4,x, x,x,x, x,x,x)
	.word 0xe6242f95  ! 975: STW_I	stw	%r19, [%r16 + 0x0f95]
	.word 0x860c24cc  ! 977: AND_I	and 	%r16, 0x04cc, %r3
	.word 0x912c0011  ! 977: SLL_R	sll 	%r16, %r17, %r8
	.word 0x8e940011  ! 977: ORcc_R	orcc 	%r16, %r17, %r7
	.word 0xde142e8d  ! 977: LDUH_I	lduh	[%r16 + 0x0e8d], %r15
	.word 0xce2c0011  ! 978: STB_R	stb	%r7, [%r16 + %r17]
	.word 0x8143c000  ! 980: STBAR	stbar
	.word 0xd4742c0b  ! 982: STX_I	stx	%r10, [%r16 + 0x0c0b]
	.word 0x84b42667  ! 984: ORNcc_I	orncc 	%r16, 0x0667, %r2
	.word 0xba040011  ! 984: ADD_R	add 	%r16, %r17, %r29
	.word 0xfa5c0011  ! 984: LDX_R	ldx	[%r16 + %r17], %r29
	.word 0xca340011  ! 985: STH_R	sth	%r5, [%r16 + %r17]
	.word 0xa57c0411  ! 987: MOVR_R	move	%r16, %r17, %r18
	.word 0x08800001  ! 987: BLEU	bleu  	<label_0x1>
	.word 0xf034265d  ! 989: STH_I	sth	%r24, [%r16 + 0x065d]
	.word 0x9e9c2401  ! 991: XORcc_I	xorcc 	%r16, 0x0401, %r15
	.word 0x82940011  ! 991: ORcc_R	orcc 	%r16, %r17, %r1
	.word 0xb494202e  ! 991: ORcc_I	orcc 	%r16, 0x002e, %r26
	.word 0x8d840011  ! 991: WRFPRS_R	wr	%r16, %r17, %fprs
thr1_irf_ce_57:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_57), 16, 16),1,IRF,ce,54,x, x,x,x, x,x,x)
	.word 0xc42c2bcd  ! 994: STB_I	stb	%r2, [%r16 + 0x0bcd]
	.word 0x88140011  ! 996: OR_R	or 	%r16, %r17, %r4
	.word 0x81880000  ! 996: RESTORED	saved
	.word 0xc6742abb  ! 998: STX_I	stx	%r3, [%r16 + 0x0abb]
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
        setx  0x00000000000006c0, %g1, %r17
        setx  0x86d48dc617bad904, %g1, %r0
        setx  0x25eea92e4630597c, %g1, %r1
        setx  0x9cd023e189041c01, %g1, %r2
        setx  0xff604a66c38c6af3, %g1, %r3
        setx  0x81193386a7ba5a1b, %g1, %r4
        setx  0x994f3784aad0736b, %g1, %r5
        setx  0xc91f448185f8accb, %g1, %r6
        setx  0x9200390611bd6bfb, %g1, %r7
        setx  0x29ea9ac13b21df16, %g1, %r8
        setx  0x585442ed8e634450, %g1, %r9
        setx  0x8401475d9ae648bb, %g1, %r10
        setx  0x934aa636daad92ce, %g1, %r11
        setx  0xd2472f3b3ac700cd, %g1, %r12
        setx  0x6e3ae98a5529087c, %g1, %r13
        setx  0xd66faeb67e9acdd7, %g1, %r14
        setx  0x2cf951e08eb57779, %g1, %r15
        setx  0x1f6f6b2818cd8c7f, %g1, %r18
        setx  0xa19bc3c045acaa49, %g1, %r19
        setx  0x633b6fef97685774, %g1, %r20
        setx  0x571932d8ae1ee1e8, %g1, %r21
        setx  0x454c2d4f96a38fb6, %g1, %r22
        setx  0x922c25c093dc7315, %g1, %r23
        setx  0x2779ed9c8ceb979f, %g1, %r24
        setx  0x5faacd688c26e72e, %g1, %r25
        setx  0x2535c3e651d2d7e3, %g1, %r26
        setx  0xbda935c78e3d412f, %g1, %r27
        setx  0xdf67acd8c5c8c690, %g1, %r28
        setx  0xc187f8a357c759ca, %g1, %r29
        setx  0x086d95e322eb9527, %g1, %r30
        setx  0x0fca776fc49a59ce, %g1, %r31
	save %r0, %r0, %r31
        setx  MAIN_BASE_DATA_VA, %r1, %r16
        setx  0x0000000000000cf0, %g1, %r17
        setx  0xc069fa09a2a3710e, %g1, %r0
        setx  0xb8c80cd431591830, %g1, %r1
        setx  0xae39de0113d312c6, %g1, %r2
        setx  0x54f317c1790f4bfb, %g1, %r3
        setx  0x943fd48de4bfe9df, %g1, %r4
        setx  0xbc4869ecf9442086, %g1, %r5
        setx  0xc7bb705226513ec1, %g1, %r6
        setx  0x2f9cee6f398afd99, %g1, %r7
        setx  0x5759906c6dbd7776, %g1, %r8
        setx  0x1a76d12bdaf503e4, %g1, %r9
        setx  0x7d6cc0ed052f5767, %g1, %r10
        setx  0xb137a9a29c7cad36, %g1, %r11
        setx  0x2a10b6c5c7a71be4, %g1, %r12
        setx  0xbb1b620eeeca172d, %g1, %r13
        setx  0x8ba1d3b01ed6b9f3, %g1, %r14
        setx  0xd415633c92b59614, %g1, %r15
        setx  0x892a221e4de56cf2, %g1, %r18
        setx  0x3d5801beb73e1a14, %g1, %r19
        setx  0x98cf1097851d6dec, %g1, %r20
        setx  0x54f5b32fb3e5b5e4, %g1, %r21
        setx  0x0e465d9f0a9ebc72, %g1, %r22
        setx  0xbd4f5e85d564d3ea, %g1, %r23
        setx  0x2110c494366c9786, %g1, %r24
        setx  0xe9023ebe22a46222, %g1, %r25
        setx  0x7da568dab993cd02, %g1, %r26
        setx  0xeb2cf218102a8a39, %g1, %r27
        setx  0x9bee25c7bd6635bd, %g1, %r28
        setx  0x881682a2c707c983, %g1, %r29
        setx  0x0afa59e89f813f8f, %g1, %r30
        setx  0x17c0eaa128f5d71f, %g1, %r31
	save %r0, %r0, %r31
        setx  MAIN_BASE_DATA_VA, %r1, %r16
        setx  0x0000000000000fb0, %g1, %r17
        setx  0x44f8103b046bb209, %g1, %r0
        setx  0x99f160bce066a977, %g1, %r1
        setx  0x154b2c479ca00f9a, %g1, %r2
        setx  0x4569eb40f97e51d7, %g1, %r3
        setx  0x19d6c8ae206e00e9, %g1, %r4
        setx  0x9dd3333db37514b1, %g1, %r5
        setx  0x0d2111d12e58fc2c, %g1, %r6
        setx  0x261fe6826dabfcec, %g1, %r7
        setx  0xd9b8b086aa87a012, %g1, %r8
        setx  0x505d4021cd2c4a12, %g1, %r9
        setx  0xf1a88acd401a8806, %g1, %r10
        setx  0x4c097a82a2e153dd, %g1, %r11
        setx  0x064e0581c8a50200, %g1, %r12
        setx  0xeb4f0d6e5be618ed, %g1, %r13
        setx  0xaafbf53b65a18684, %g1, %r14
        setx  0xeeab37b04a115f32, %g1, %r15
        setx  0x068f3e700607f541, %g1, %r18
        setx  0x65e032705cc9c734, %g1, %r19
        setx  0xae5376c9ea2604a1, %g1, %r20
        setx  0xa670b3992ba635fc, %g1, %r21
        setx  0xf809578a3d5b8156, %g1, %r22
        setx  0x3fc640d64c9390ee, %g1, %r23
        setx  0x00e2676f814762eb, %g1, %r24
        setx  0xab03d12390526c4c, %g1, %r25
        setx  0xdca1a95d5dc3274b, %g1, %r26
        setx  0x5d434c7dfad5187e, %g1, %r27
        setx  0xb7ec940fcb92c641, %g1, %r28
        setx  0x3b81a7395af5ca82, %g1, %r29
        setx  0xaad6c52197cb7e59, %g1, %r30
        setx  0x65ebc38d43f744d9, %g1, %r31
	save %r0, %r0, %r31
        setx  MAIN_BASE_DATA_VA, %r1, %r16
        setx  0x0000000000000730, %g1, %r17
        setx  0x79e4650ddd8209f2, %g1, %r0
        setx  0x139f9f6c4fc3a813, %g1, %r1
        setx  0x3115e67ce2796010, %g1, %r2
        setx  0xf0eb6b1637d14bfa, %g1, %r3
        setx  0x538e99212a1ea645, %g1, %r4
        setx  0xe2f99bcae851d517, %g1, %r5
        setx  0xb48f374eb426f17a, %g1, %r6
        setx  0x018ac08ed35e07b4, %g1, %r7
        setx  0x2bb9d823668ec2e4, %g1, %r8
        setx  0xfb57cbfd97ce140e, %g1, %r9
        setx  0x4edb070edf7439ee, %g1, %r10
        setx  0x0381ca4e9668ecb9, %g1, %r11
        setx  0x55013b28a258e1a5, %g1, %r12
        setx  0x5eb03193767c1348, %g1, %r13
        setx  0x479a3573e5dffacd, %g1, %r14
        setx  0x6c944e83e0edbc8d, %g1, %r15
        setx  0x8497e974dfb7b1ad, %g1, %r18
        setx  0x70a4d7a74ace52e6, %g1, %r19
        setx  0xd8cf47d8cb926fc1, %g1, %r20
        setx  0xd7b5f587774f8da0, %g1, %r21
        setx  0xb955c7a64ab1aaf2, %g1, %r22
        setx  0x410f2770c7481415, %g1, %r23
        setx  0x2b4ff6f570c4a773, %g1, %r24
        setx  0x3ba4c0da3add0ab6, %g1, %r25
        setx  0x338b068d38ea06d4, %g1, %r26
        setx  0x370d9d699ca32800, %g1, %r27
        setx  0x7eff112ea463e14c, %g1, %r28
        setx  0x35c94b062a27882b, %g1, %r29
        setx  0xc1934f470652aab1, %g1, %r30
        setx  0xd0b28689d7d9bc47, %g1, %r31
	save %r0, %r0, %r31
        setx  MAIN_BASE_DATA_VA, %r1, %r16
        setx  0x00000000000009a0, %g1, %r17
        setx  0xdc5a10b3d866e75f, %g1, %r0
        setx  0x6136de547419bb43, %g1, %r1
        setx  0x3f3930d4301dcdf6, %g1, %r2
        setx  0x8dd1f70978f55f1a, %g1, %r3
        setx  0x90e8c24d9f087046, %g1, %r4
        setx  0xefa9bc1a864c4be0, %g1, %r5
        setx  0xab91ec35af608158, %g1, %r6
        setx  0xd77d14d098078ba9, %g1, %r7
        setx  0x336996e1e275130e, %g1, %r8
        setx  0xac0e801cc345ef12, %g1, %r9
        setx  0x2249a4ed7019a1e7, %g1, %r10
        setx  0xb58359554a90628b, %g1, %r11
        setx  0xad83945100c265fd, %g1, %r12
        setx  0xc265654ac0b19ab0, %g1, %r13
        setx  0x85dbf88bf991e2dd, %g1, %r14
        setx  0x5599364080dc3c7f, %g1, %r15
        setx  0xd62f330a9a98ea99, %g1, %r18
        setx  0x25c1c1fd665fcf9b, %g1, %r19
        setx  0x469b01c61bc7a7d7, %g1, %r20
        setx  0x687da90b4b7a995f, %g1, %r21
        setx  0x098aa82cdec8550b, %g1, %r22
        setx  0xafca76fdd428a5d2, %g1, %r23
        setx  0x13f44bd5e386858f, %g1, %r24
        setx  0x5b0f4c36b2f10001, %g1, %r25
        setx  0x807f8759c6cb0411, %g1, %r26
        setx  0x2e998037f73cb042, %g1, %r27
        setx  0x208db642284845df, %g1, %r28
        setx  0xc1716503a7aacbe6, %g1, %r29
        setx  0x0731a1c9852b77c3, %g1, %r30
        setx  0x3482461e2d9f8ede, %g1, %r31
	save %r0, %r0, %r31
        setx  MAIN_BASE_DATA_VA, %r1, %r16
        setx  0x00000000000000e0, %g1, %r17
        setx  0x14396cdc0d07791a, %g1, %r0
        setx  0xed96cabd855119f6, %g1, %r1
        setx  0x5a1dccc00981a11f, %g1, %r2
        setx  0x0168b9daa60c64e9, %g1, %r3
        setx  0xe1893e47f358f12a, %g1, %r4
        setx  0xdb15ee426ec0a5a3, %g1, %r5
        setx  0xb6ee77e6e978b08c, %g1, %r6
        setx  0xd6366dcf7d0e1c1b, %g1, %r7
        setx  0x315192d4913d4b54, %g1, %r8
        setx  0xbc9a88051322235a, %g1, %r9
        setx  0x6fd2f5c04ed41e5f, %g1, %r10
        setx  0x49eafd478f93e0e8, %g1, %r11
        setx  0x27b5efb5c607af88, %g1, %r12
        setx  0x9234a1f3942fc354, %g1, %r13
        setx  0xf7ab7650217019f2, %g1, %r14
        setx  0xd5705db4b026da8c, %g1, %r15
        setx  0xcd7d2d563e2d3dcd, %g1, %r18
        setx  0x220c158182ec2e67, %g1, %r19
        setx  0x758da01add4bc418, %g1, %r20
        setx  0x94bdbce9573cc2bf, %g1, %r21
        setx  0x6efadff490cbb8b3, %g1, %r22
        setx  0xf960115a72f44c3d, %g1, %r23
        setx  0x2fffcc525ea0ea91, %g1, %r24
        setx  0x7baf81bc0410a62c, %g1, %r25
        setx  0x850799e4068406dd, %g1, %r26
        setx  0x66230092b0338121, %g1, %r27
        setx  0xb82548654d867617, %g1, %r28
        setx  0x5ce0ddeed3106b4f, %g1, %r29
        setx  0xc4176ead4ceeb778, %g1, %r30
        setx  0x032247f05934d117, %g1, %r31
	save %r0, %r0, %r31
        setx  MAIN_BASE_DATA_VA, %r1, %r16
        setx  0x00000000000002b0, %g1, %r17
        setx  0xdbd4abffbe440ca4, %g1, %r0
        setx  0x25e4b786d175d7b8, %g1, %r1
        setx  0x46d7d39cd8931286, %g1, %r2
        setx  0x6e5914a33f73de84, %g1, %r3
        setx  0xc985c757d0ae8659, %g1, %r4
        setx  0x70cd43b0b39d277c, %g1, %r5
        setx  0x6214f852a80e39c2, %g1, %r6
        setx  0x54634d980a85c3be, %g1, %r7
        setx  0x01edb388e41f1966, %g1, %r8
        setx  0xcb0f246a0c45418e, %g1, %r9
        setx  0xcfb139b4dfbf0f7b, %g1, %r10
        setx  0x9a78cfe6059c514a, %g1, %r11
        setx  0x208bf3d94bc920c9, %g1, %r12
        setx  0x2e13cfbc0d68ff87, %g1, %r13
        setx  0xe39bf1cb54d6502b, %g1, %r14
        setx  0xc9a50295a6d3850f, %g1, %r15
        setx  0x8518495c25516d83, %g1, %r18
        setx  0x5c39dd533e3bf268, %g1, %r19
        setx  0x70049bbbe0cc8826, %g1, %r20
        setx  0x1f3b4739d74ac3d1, %g1, %r21
        setx  0xe6690e1718da0c31, %g1, %r22
        setx  0x868c6cf19d92a2c4, %g1, %r23
        setx  0x0e49d536c5404938, %g1, %r24
        setx  0xd2999c7d1dbb62ee, %g1, %r25
        setx  0x88890007b0f9f4df, %g1, %r26
        setx  0x32b684e0cfc6702e, %g1, %r27
        setx  0x083b7392557e18c6, %g1, %r28
        setx  0xda74718e94aa2066, %g1, %r29
        setx  0x6da0a826a970ea24, %g1, %r30
        setx  0x38cef65f12879982, %g1, %r31
	save %r0, %r0, %r31
        setx  MAIN_BASE_DATA_VA, %r1, %r16
        setx  0x0000000000000cd0, %g1, %r17
        setx  0x657024282d3ba52f, %g1, %r0
        setx  0xaf5b17690fd291a1, %g1, %r1
        setx  0x42b16ef754d057d8, %g1, %r2
        setx  0x2f610bb653b21208, %g1, %r3
        setx  0x0dac99548e89c682, %g1, %r4
        setx  0x8201d66c67a40b63, %g1, %r5
        setx  0x0c284ff314e7225f, %g1, %r6
        setx  0x6848e17b3f72dacc, %g1, %r7
        setx  0xdb59cb958d57d9c6, %g1, %r8
        setx  0x231469bf5c5b1c6d, %g1, %r9
        setx  0xa316d48a1b26837b, %g1, %r10
        setx  0xc425c5bd4ea6c9e7, %g1, %r11
        setx  0xae38738271af47c3, %g1, %r12
        setx  0x0c2264088292f2b8, %g1, %r13
        setx  0x365ddc20809f5145, %g1, %r14
        setx  0x83d67d7e0479504a, %g1, %r15
        setx  0x3fdd8393d745d61b, %g1, %r18
        setx  0x7c8825ea2bb0b373, %g1, %r19
        setx  0x5ec8080425b99c9d, %g1, %r20
        setx  0xc53ed78af2b92843, %g1, %r21
        setx  0x871c90df2583796b, %g1, %r22
        setx  0xaac1528f3a6066d1, %g1, %r23
        setx  0x37ecd19bf31deb25, %g1, %r24
        setx  0x6238ebe524fb7d45, %g1, %r25
        setx  0xc718d3b5aa6fe6ff, %g1, %r26
        setx  0x627d565a262a8236, %g1, %r27
        setx  0xc8f2697b5e2c0986, %g1, %r28
        setx  0x982255bef7a1e563, %g1, %r29
        setx  0x6cbd0ac9a70e9b3d, %g1, %r30
        setx  0x9b075f6ac8aa5b04, %g1, %r31
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
	.word 0x8f2c1011  ! 0: SLLX_R	sllx	%r16, %r17, %r7
	.word 0xa4b40011  ! 2: ORNcc_R	orncc 	%r16, %r17, %r18
	.word 0x95414000  ! 2: RDPC	rd	%pc, %r10
	.word 0xce740011  ! 3: STX_R	stx	%r7, [%r16 + %r17]
	.word 0x8d840011  ! 5: WRFPRS_R	wr	%r16, %r17, %fprs
	.word 0xde740011  ! 6: STX_R	stx	%r15, [%r16 + %r17]
	.word 0x821c29e7  ! 8: XOR_I	xor 	%r16, 0x09e7, %r1
	.word 0xf9e41011  ! 8: CASA_I	casa	[%r16] 0x80, %r17, %r28
	.word 0xc6340011  ! 9: STH_R	sth	%r3, [%r16 + %r17]
	.word 0xc4fc1011  ! 11: SWAPA_R	swapa	%r2, [%r16 + %r17] 0x80
thr0_irf_ce_0:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_0), 16, 16),1,IRF,ce,13,x, x,x,x, x,x,x)
	.word 0xc4342431  ! 14: STH_I	sth	%r2, [%r16 + 0x0431]
	.word 0x909c296b  ! 16: XORcc_I	xorcc 	%r16, 0x096b, %r8
	.word 0x9cc422aa  ! 16: ADDCcc_I	addccc 	%r16, 0x02aa, %r14
	.word 0xfcfc1011  ! 16: SWAPA_R	swapa	%r30, [%r16 + %r17] 0x80
	.word 0x962c0011  ! 17: ANDN_R	andn 	%r16, %r17, %r11
	.word 0x81dc2deb  ! 19: FLUSH_I	dis not found

	.word 0xd674295f  ! 21: STX_I	stx	%r11, [%r16 + 0x095f]
	.word 0x8cac0011  ! 23: ANDNcc_R	andncc 	%r16, %r17, %r6
	.word 0x82042a05  ! 23: ADD_I	add 	%r16, 0x0a05, %r1
	.word 0xc36c0011  ! 23: PREFETCH_R	prefetch	[%r16 + %r17], #one_read
	.word 0x88142524  ! 24: OR_I	or 	%r16, 0x0524, %r4
	.word 0x18800001  ! 26: BGU	bgu  	<label_0x1>
	.word 0xc834296f  ! 28: STH_I	sth	%r4, [%r16 + 0x096f]
	.word 0xa6c40011  ! 30: ADDCcc_R	addccc 	%r16, %r17, %r19
	.word 0x952c3001  ! 30: SLLX_I	sllx	%r16, 0x0001, %r10
	.word 0xbe940011  ! 30: ORcc_R	orcc 	%r16, %r17, %r31
	.word 0xc36c0011  ! 30: PREFETCH_R	prefetch	[%r16 + %r17], #one_read
thr0_irf_ce_1:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_1), 16, 16),1,IRF,ce,15,x, x,x,x, x,x,x)
	.word 0xfe2c2cbb  ! 33: STB_I	stb	%r31, [%r16 + 0x0cbb]
	.word 0xce4c2ffe  ! 35: LDSB_I	ldsb	[%r16 + 0x0ffe], %r7
	.word 0xce2c2331  ! 37: STB_I	stb	%r7, [%r16 + 0x0331]
	.word 0x932c3001  ! 39: SLLX_I	sllx	%r16, 0x0001, %r9
	.word 0x9e440011  ! 39: ADDC_R	addc 	%r16, %r17, %r15
	.word 0xcea41011  ! 39: STWA_R	stwa	%r7, [%r16 + %r17] 0x80
	.word 0x8d3c1011  ! 40: SRAX_R	srax	%r16, %r17, %r6
	.word 0x8cac2b7f  ! 42: ANDNcc_I	andncc 	%r16, 0x0b7f, %r6
	.word 0x980c0011  ! 42: AND_R	and 	%r16, %r17, %r12
	.word 0x85840011  ! 42: WRCCR_R	wr	%r16, %r17, %ccr
	.word 0x8ca42fa0  ! 43: SUBcc_I	subcc 	%r16, 0x0fa0, %r6
	.word 0x982c2e60  ! 45: ANDN_I	andn 	%r16, 0x0e60, %r12
	.word 0xbc440011  ! 45: ADDC_R	addc 	%r16, %r17, %r30
	.word 0xc3ec1011  ! 45: PREFETCHA_R	prefetcha	[%r16, %r17] 0x80, #one_read
	.word 0xfc342dcd  ! 47: STH_I	sth	%r30, [%r16 + 0x0dcd]
	.word 0x8c8c21b8  ! 49: ANDcc_I	andcc 	%r16, 0x01b8, %r6
	.word 0xb2042734  ! 49: ADD_I	add 	%r16, 0x0734, %r25
	.word 0xbbe40011  ! 49: SAVE_R	save	%r16, %r17, %r29
	.word 0xa93c1011  ! 50: SRAX_R	srax	%r16, %r17, %r20
	.word 0xd684252c  ! 52: LDUWA_I	lduwa	[%r16, + 0x052c] %asi, %r11
	.word 0x9eac0011  ! 53: ANDNcc_R	andncc 	%r16, %r17, %r15
	.word 0x92440011  ! 55: ADDC_R	addc 	%r16, %r17, %r9
	.word 0xbb2c3001  ! 55: SLLX_I	sllx	%r16, 0x0001, %r29
	.word 0xaf3c1011  ! 55: SRAX_R	srax	%r16, %r17, %r23
	.word 0xe8442745  ! 55: LDSW_I	ldsw	[%r16 + 0x0745], %r20
	.word 0xf2740011  ! 56: STX_R	stx	%r25, [%r16 + %r17]
	.word 0xbf340011  ! 58: SRL_R	srl 	%r16, %r17, %r31
	.word 0xbe9c0011  ! 58: XORcc_R	xorcc 	%r16, %r17, %r31
	.word 0xfeac2f12  ! 58: STBA_I	stba	%r31, [%r16 + 0x0f12] %asi
thr0_irf_ce_2:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_2), 16, 16),1,IRF,ce,33,x, x,x,x, x,x,x)
	.word 0xfe7427c3  ! 61: STX_I	stx	%r31, [%r16 + 0x07c3]
	.word 0x98ac0011  ! 63: ANDNcc_R	andncc 	%r16, %r17, %r12
	.word 0xd8ac2f64  ! 63: STBA_I	stba	%r12, [%r16 + 0x0f64] %asi
	.word 0xf6740011  ! 64: STX_R	stx	%r27, [%r16 + %r17]
	.word 0x997c0411  ! 66: MOVR_R	move	%r16, %r17, %r12
	.word 0xb97c2401  ! 66: MOVR_I	move	%r16, 0xfffffff8, %r28
	.word 0x8f2c0011  ! 66: SLL_R	sll 	%r16, %r17, %r7
	.word 0x1a800003  ! 66: BCC	bcc  	<label_0x3>
	.word 0xce74270d  ! 68: STX_I	stx	%r7, [%r16 + 0x070d]
	.word 0x8e2c0011  ! 70: ANDN_R	andn 	%r16, %r17, %r7
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xd8240011  ! 71: STW_R	stw	%r12, [%r16 + %r17]
	.word 0x903c2eff  ! 73: XNOR_I	xnor 	%r16, 0x0eff, %r8
	.word 0xbf641811  ! 73: MOVcc_R	<illegal instruction>
	.word 0xb4bc2512  ! 73: XNORcc_I	xnorcc 	%r16, 0x0512, %r26
	.word 0xd2ec2f0d  ! 73: LDSTUBA_I	ldstuba	%r9, [%r16 + 0x0f0d] %asi
	.word 0xdc340011  ! 74: STH_R	sth	%r14, [%r16 + %r17]
	.word 0x973c2001  ! 76: SRA_I	sra 	%r16, 0x0001, %r11
	.word 0xb21c0011  ! 76: XOR_R	xor 	%r16, %r17, %r25
thr0_resum_intr_0:
!$EV trig_pc_d(0,expr(@VA(.MAIN.thr0_resum_intr_0), 16, 16)) -> intp(0, 3, 1)
	wr      %r0, 0x5, %asr26
	.word 0xab341011  ! 77: SRLX_R	srlx	%r16, %r17, %r21
	.word 0x992c1011  ! 79: SLLX_R	sllx	%r16, %r17, %r12
	ta	T_CHANGE_NONHPRIV	! macro
thr0_irf_ce_3:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_3), 16, 16),1,IRF,ce,68,x, x,x,x, x,x,x)
	.word 0xd82c2c87  ! 82: STB_I	stb	%r12, [%r16 + 0x0c87]
	.word 0xde14205d  ! 84: LDUH_I	lduh	[%r16 + 0x005d], %r15
	.word 0xde242d8b  ! 86: STW_I	stw	%r15, [%r16 + 0x0d8b]
        wr %g0, 0x4, %fprs
	.word 0xca340011  ! 89: STH_R	sth	%r5, [%r16 + %r17]
	.word 0x8a9c0011  ! 91: XORcc_R	xorcc 	%r16, %r17, %r5
	.word 0x87504000  ! 91: RDPR_TNPC	<illegal instruction>
	.word 0xc6742def  ! 93: STX_I	stx	%r3, [%r16 + 0x0def]
	.word 0x9f3c0011  ! 95: SRA_R	sra 	%r16, %r17, %r15
	.word 0xb42c0011  ! 95: ANDN_R	andn 	%r16, %r17, %r26
	.word 0x8d340011  ! 95: SRL_R	srl 	%r16, %r17, %r6
	.word 0xc36c2898  ! 95: PREFETCH_I	prefetch	[%r16 + 0x0898], #one_read
	.word 0xcc2424bd  ! 97: STW_I	stw	%r6, [%r16 + 0x04bd]
        wr %g0, 0x4, %fprs
thr0_irf_ce_4:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_4), 16, 16),1,IRF,ce,32,x, x,x,x, x,x,x)
	.word 0xcc2c2bad  ! 102: STB_I	stb	%r6, [%r16 + 0x0bad]
	.word 0x928c0011  ! 104: ANDcc_R	andcc 	%r16, %r17, %r9
	.word 0x85840011  ! 104: WRCCR_R	wr	%r16, %r17, %ccr
	.word 0xd0340011  ! 105: STH_R	sth	%r8, [%r16 + %r17]
	.word 0xd5240011  ! 107: STF_R	st	%f10, [%r17, %r16]
	.word 0x94342240  ! 108: SUBC_I	orn 	%r16, 0x0240, %r10
        wr %g0, 0x4, %fprs
thr0_irf_ce_5:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_5), 16, 16),1,IRF,ce,30,x, x,x,x, x,x,x)
	.word 0xd47427af  ! 113: STX_I	stx	%r10, [%r16 + 0x07af]
thr0_resum_intr_1:
!$EV trig_pc_d(0,expr(@VA(.MAIN.thr0_resum_intr_1), 16, 16)) -> intp(0, 3, 1)
	wr      %r0, 0x5, %asr26
thr0_irf_ce_6:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_6), 16, 16),1,IRF,ce,59,x, x,x,x, x,x,x)
	.word 0xd4742261  ! 118: STX_I	stx	%r10, [%r16 + 0x0261]
	.word 0x88040011  ! 120: ADD_R	add 	%r16, %r17, %r4
        wr %g0, 0x4, %fprs
	.word 0xc8342875  ! 122: STH_I	sth	%r4, [%r16 + 0x0875]
	.word 0xae9c2453  ! 124: XORcc_I	xorcc 	%r16, 0x0453, %r23
	.word 0xaf2c0011  ! 124: SLL_R	sll 	%r16, %r17, %r23
	ta	T_CHANGE_PRIV	! macro
	.word 0xee2c22d1  ! 126: STB_I	stb	%r23, [%r16 + 0x02d1]
	.word 0x8f7c0411  ! 128: MOVR_R	move	%r16, %r17, %r7
	.word 0x88fc2b67  ! 128: SDIVcc_I	sdivcc 	%r16, 0x0b67, %r4
thr0_irf_ce_7:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_7), 16, 16),1,IRF,ce,55,x, x,x,x, x,x,x)
	.word 0xc82c2419  ! 131: STB_I	stb	%r4, [%r16 + 0x0419]
	.word 0x8c9c0011  ! 133: XORcc_R	xorcc 	%r16, %r17, %r6
	.word 0xb13c0011  ! 133: SRA_R	sra 	%r16, %r17, %r24
	.word 0x81dc2d43  ! 133: FLUSH_I	dis not found

	.word 0xf02c2a5f  ! 135: STB_I	stb	%r24, [%r16 + 0x0a5f]
	.word 0x87641811  ! 137: MOVcc_R	<illegal instruction>
thr0_resum_intr_2:
!$EV trig_pc_d(0,expr(@VA(.MAIN.thr0_resum_intr_2), 16, 16)) -> intp(0, 3, 1)
	wr      %r0, 0x5, %asr26
	.word 0xc8740011  ! 138: STX_R	stx	%r4, [%r16 + %r17]
	.word 0x902c0011  ! 140: ANDN_R	andn 	%r16, %r17, %r8
	.word 0x91e40011  ! 140: SAVE_R	save	%r16, %r17, %r8
	.word 0xd0342c61  ! 142: STH_I	sth	%r8, [%r16 + 0x0c61]
	.word 0xa83c28a2  ! 144: XNOR_I	xnor 	%r16, 0x08a2, %r20
	.word 0xb0b4277d  ! 144: ORNcc_I	orncc 	%r16, 0x077d, %r24
	.word 0x881c0011  ! 144: XOR_R	xor 	%r16, %r17, %r4
	.word 0xb3530000  ! 144: RDPR_CLEANWIN	<illegal instruction>
	.word 0xc8740011  ! 145: STX_R	stx	%r4, [%r16 + %r17]
        wr %g0, 0x4, %fprs
	.word 0xec240011  ! 148: STW_R	stw	%r22, [%r16 + %r17]
	.word 0x84840011  ! 150: ADDcc_R	addcc 	%r16, %r17, %r2
thr0_resum_intr_3:
!$EV trig_pc_d(0,expr(@VA(.MAIN.thr0_resum_intr_3), 16, 16)) -> intp(0, 3, 1)
	wr      %r0, 0x5, %asr26
thr0_irf_ce_8:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_8), 16, 16),1,IRF,ce,5,x, x,x,x, x,x,x)
	.word 0xc42c2123  ! 153: STB_I	stb	%r2, [%r16 + 0x0123]
	.word 0x8750c000  ! 155: RDPR_TT	<illegal instruction>
	.word 0xf4340011  ! 156: STH_R	sth	%r26, [%r16 + %r17]
	.word 0xba3c26f4  ! 158: XNOR_I	xnor 	%r16, 0x06f4, %r29
	.word 0xf29c1011  ! 158: LDDA_R	ldda	[%r16, %r17] 0x80, %r25
	.word 0xb52c3001  ! 159: SLLX_I	sllx	%r16, 0x0001, %r26
	.word 0xb5e40011  ! 161: SAVE_R	save	%r16, %r17, %r26
	.word 0xf4342853  ! 163: STH_I	sth	%r26, [%r16 + 0x0853]
	.word 0x8a3c0011  ! 165: XNOR_R	xnor 	%r16, %r17, %r5
	.word 0xa89c223a  ! 165: XORcc_I	xorcc 	%r16, 0x023a, %r20
	.word 0xdbf42011  ! 165: CASXA_R	casxa	[%r16]%asi, %r17, %r13
	.word 0xda342ee9  ! 167: STH_I	sth	%r13, [%r16 + 0x0ee9]
	.word 0x920425e6  ! 169: ADD_I	add 	%r16, 0x05e6, %r9
	.word 0x8e940011  ! 169: ORcc_R	orcc 	%r16, %r17, %r7
	.word 0x861c0011  ! 169: XOR_R	xor 	%r16, %r17, %r3
	.word 0xc36c2f99  ! 169: PREFETCH_I	prefetch	[%r16 + 0x0f99], #one_read
thr0_irf_ce_9:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_9), 16, 16),1,IRF,ce,59,x, x,x,x, x,x,x)
	.word 0xc6342bf7  ! 172: STH_I	sth	%r3, [%r16 + 0x0bf7]
	.word 0x8c2c0011  ! 174: ANDN_R	andn 	%r16, %r17, %r6
	.word 0xa92c3001  ! 174: SLLX_I	sllx	%r16, 0x0001, %r20
	.word 0xcd3c0011  ! 174: STDF_R	std	%f6, [%r17, %r16]
	.word 0xd0240011  ! 175: STW_R	stw	%r8, [%r16 + %r17]
	.word 0xb1518000  ! 177: RDPR_PSTATE	<illegal instruction>
thr0_irf_ce_10:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_10), 16, 16),1,IRF,ce,65,x, x,x,x, x,x,x)
	.word 0xf0342fbb  ! 180: STH_I	sth	%r24, [%r16 + 0x0fbb]
	.word 0xb4fc2254  ! 182: SDIVcc_I	sdivcc 	%r16, 0x0254, %r26
	.word 0xe4740011  ! 183: STX_R	stx	%r18, [%r16 + %r17]
	.word 0x9ab40011  ! 185: ORNcc_R	orncc 	%r16, %r17, %r13
	.word 0x9a840011  ! 185: ADDcc_R	addcc 	%r16, %r17, %r13
	.word 0x8e140011  ! 185: OR_R	or 	%r16, %r17, %r7
	ta	T_CHANGE_HPRIV	! macro
	.word 0xce7428c5  ! 187: STX_I	stx	%r7, [%r16 + 0x08c5]
	.word 0xbf518000  ! 189: RDPR_PSTATE	<illegal instruction>
thr0_irf_ce_11:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_11), 16, 16),1,IRF,ce,44,x, x,x,x, x,x,x)
	.word 0xfe242aeb  ! 192: STW_I	stw	%r31, [%r16 + 0x0aeb]
	.word 0xb72c1011  ! 194: SLLX_R	sllx	%r16, %r17, %r27
	ta	T_CHANGE_PRIV	! macro
	.word 0xbc8c2a4d  ! 195: ANDcc_I	andcc 	%r16, 0x0a4d, %r30
	.word 0x852c2001  ! 197: SLL_I	sll 	%r16, 0x0001, %r2
	.word 0x8c342d1b  ! 197: ORN_I	orn 	%r16, 0x0d1b, %r6
	.word 0x921c0011  ! 197: XOR_R	xor 	%r16, %r17, %r9
	.word 0xaa6c0011  ! 197: UDIVX_R	udivx 	%r16, %r17, %r21
thr0_irf_ce_12:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_12), 16, 16),1,IRF,ce,24,x, x,x,x, x,x,x)
	.word 0xea742a33  ! 200: STX_I	stx	%r21, [%r16 + 0x0a33]
	.word 0x952c0011  ! 202: SLL_R	sll 	%r16, %r17, %r10
	.word 0xa8342d9b  ! 202: ORN_I	orn 	%r16, 0x0d9b, %r20
	.word 0xb557c000  ! 202: RDPR_VER	<illegal instruction>
	.word 0xde2c0011  ! 203: STB_R	stb	%r15, [%r16 + %r17]
	.word 0xad520000  ! 205: RDPR_PIL	<illegal instruction>
	.word 0xec342da1  ! 207: STH_I	sth	%r22, [%r16 + 0x0da1]
	.word 0x928c0011  ! 209: ANDcc_R	andcc 	%r16, %r17, %r9
	.word 0xb53c0011  ! 209: SRA_R	sra 	%r16, %r17, %r26
	ta	T_CHANGE_NONHPRIV	! macro
thr0_irf_ce_13:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_13), 16, 16),1,IRF,ce,40,x, x,x,x, x,x,x)
	.word 0xf474234b  ! 212: STX_I	stx	%r26, [%r16 + 0x034b]
	.word 0xa72c2001  ! 214: SLL_I	sll 	%r16, 0x0001, %r19
	.word 0x8d840011  ! 214: WRFPRS_R	wr	%r16, %r17, %fprs
	.word 0x94ac0011  ! 215: ANDNcc_R	andncc 	%r16, %r17, %r10
	.word 0x9c8423fd  ! 217: ADDcc_I	addcc 	%r16, 0x03fd, %r14
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xb8bc22de  ! 218: XNORcc_I	xnorcc 	%r16, 0x02de, %r28
	.word 0xaf3c0011  ! 220: SRA_R	sra 	%r16, %r17, %r23
	.word 0xab2c3001  ! 220: SLLX_I	sllx	%r16, 0x0001, %r21
	.word 0x9b3c1011  ! 220: SRAX_R	srax	%r16, %r17, %r13
        wr %g0, 0x4, %fprs
	.word 0x9e940011  ! 221: ORcc_R	orcc 	%r16, %r17, %r15
	ta	T_CHANGE_PRIV	! macro
	.word 0xde2c242f  ! 225: STB_I	stb	%r15, [%r16 + 0x042f]
	.word 0x840c2e0e  ! 227: AND_I	and 	%r16, 0x0e0e, %r2
	.word 0xaa442a2f  ! 227: ADDC_I	addc 	%r16, 0x0a2f, %r21
	.word 0x0e800003  ! 227: BVS	bvs  	<label_0x3>
	.word 0xbf340011  ! 228: SRL_R	srl 	%r16, %r17, %r31
	.word 0xa88c0011  ! 230: ANDcc_R	andcc 	%r16, %r17, %r20
	.word 0x9f340011  ! 230: SRL_R	srl 	%r16, %r17, %r15
	.word 0x8e440011  ! 230: ADDC_R	addc 	%r16, %r17, %r7
	.word 0x83518000  ! 230: RDPR_PSTATE	rdpr	%pstate, %r1
thr0_irf_ce_14:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_14), 16, 16),1,IRF,ce,21,x, x,x,x, x,x,x)
	.word 0xc2742641  ! 233: STX_I	stx	%r1, [%r16 + 0x0641]
	.word 0xb5341011  ! 235: SRLX_R	srlx	%r16, %r17, %r26
	.word 0x97ab0831  ! 235: FMOVGU	fmovs	%fcc1, %f17, %f11
	.word 0xd674232d  ! 237: STX_I	stx	%r11, [%r16 + 0x032d]
	.word 0xa40c25fa  ! 239: AND_I	and 	%r16, 0x05fa, %r18
	.word 0x06800001  ! 239: BL	bl  	<label_0x1>
	.word 0xe474235d  ! 241: STX_I	stx	%r18, [%r16 + 0x035d]
	.word 0x9abc26c6  ! 243: XNORcc_I	xnorcc 	%r16, 0x06c6, %r13
	.word 0x8143e01c  ! 243: MEMBAR	membar	#LoadStore | #StoreStore | #Lookaside 
	.word 0xd82c0011  ! 244: STB_R	stb	%r12, [%r16 + %r17]
	.word 0x983c2117  ! 246: XNOR_I	xnor 	%r16, 0x0117, %r12
	.word 0xc3ec1011  ! 246: PREFETCHA_R	prefetcha	[%r16, %r17] 0x80, #one_read
thr0_irf_ce_15:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_15), 16, 16),1,IRF,ce,48,x, x,x,x, x,x,x)
	.word 0xd87424e3  ! 249: STX_I	stx	%r12, [%r16 + 0x04e3]
	.word 0xca9c1011  ! 251: LDDA_R	ldda	[%r16, %r17] 0x80, %r5
	.word 0x86142c9e  ! 252: OR_I	or 	%r16, 0x0c9e, %r3
	.word 0x8e8c0011  ! 254: ANDcc_R	andcc 	%r16, %r17, %r7
	.word 0xbe542008  ! 254: UMUL_I	umul 	%r16, 0x0008, %r31
	.word 0xfe2428a7  ! 256: STW_I	stw	%r31, [%r16 + 0x08a7]
	.word 0xaec40011  ! 258: ADDCcc_R	addccc 	%r16, %r17, %r23
	.word 0x923c0011  ! 258: XNOR_R	xnor 	%r16, %r17, %r9
	.word 0x81580000  ! 258: FLUSHW	flushw
	.word 0xae340011  ! 259: ORN_R	orn 	%r16, %r17, %r23
	.word 0xc2841011  ! 261: LDUWA_R	lduwa	[%r16, %r17] 0x80, %r1
	.word 0xfa740011  ! 262: STX_R	stx	%r29, [%r16 + %r17]
	.word 0x905c296d  ! 264: SMUL_I	smul 	%r16, 0x096d, %r8
	.word 0x88142a04  ! 265: OR_I	or 	%r16, 0x0a04, %r4
	.word 0xbc2c0011  ! 267: ANDN_R	andn 	%r16, %r17, %r30
	.word 0xc3ec1011  ! 267: PREFETCHA_R	prefetcha	[%r16, %r17] 0x80, #one_read
	.word 0xfc740011  ! 268: STX_R	stx	%r30, [%r16 + %r17]
	.word 0xa53c0011  ! 270: SRA_R	sra 	%r16, %r17, %r18
	.word 0x9c140011  ! 270: OR_R	or 	%r16, %r17, %r14
	.word 0xeef42c1c  ! 270: STXA_I	stxa	%r23, [%r16 + 0x0c1c] %asi
	.word 0xd6240011  ! 271: STW_R	stw	%r11, [%r16 + %r17]
	.word 0x91340011  ! 273: SRL_R	srl 	%r16, %r17, %r8
thr0_resum_intr_4:
!$EV trig_pc_d(0,expr(@VA(.MAIN.thr0_resum_intr_4), 16, 16)) -> intp(0, 3, 1)
	wr      %r0, 0x5, %asr26
	.word 0xd02c20c7  ! 275: STB_I	stb	%r8, [%r16 + 0x00c7]
	.word 0x86440011  ! 277: ADDC_R	addc 	%r16, %r17, %r3
	.word 0xb8bc2d38  ! 277: XNORcc_I	xnorcc 	%r16, 0x0d38, %r28
	.word 0x9e6c2c58  ! 277: UDIVX_I	udivx 	%r16, 0x0c58, %r15
	.word 0xf8740011  ! 278: STX_R	stx	%r28, [%r16 + %r17]
	.word 0x902c0011  ! 280: ANDN_R	andn 	%r16, %r17, %r8
	.word 0x9a142c2b  ! 280: OR_I	or 	%r16, 0x0c2b, %r13
	.word 0xae0c0011  ! 280: AND_R	and 	%r16, %r17, %r23
	.word 0x81840011  ! 280: WRY_R	wr	%r16, %r17, %y
	.word 0x868c0011  ! 281: ANDcc_R	andcc 	%r16, %r17, %r3
	.word 0x832c0011  ! 283: SLL_R	sll 	%r16, %r17, %r1
	.word 0x81dc0011  ! 283: FLUSH_R	dis not found

	.word 0xc22c2e27  ! 285: STB_I	stb	%r1, [%r16 + 0x0e27]
        wr %g0, 0x4, %fprs
	.word 0xc2742c71  ! 289: STX_I	stx	%r1, [%r16 + 0x0c71]
	.word 0x857c0411  ! 291: MOVR_R	move	%r16, %r17, %r2
	.word 0x9c2c0011  ! 291: ANDN_R	andn 	%r16, %r17, %r14
	.word 0xbc040011  ! 291: ADD_R	add 	%r16, %r17, %r30
	.word 0x99a019b1  ! 291: FsTOq	dis not found

	.word 0x8c942f88  ! 292: ORcc_I	orcc 	%r16, 0x0f88, %r6
	.word 0xe86c0011  ! 294: LDSTUB_R	ldstub	%r20, [%r16 + %r17]
	.word 0xe8342fdd  ! 296: STH_I	sth	%r20, [%r16 + 0x0fdd]
	.word 0xf0d42dbc  ! 298: LDSHA_I	ldsha	[%r16, + 0x0dbc] %asi, %r24
	.word 0xf024264d  ! 300: STW_I	stw	%r24, [%r16 + 0x064d]
	.word 0x8c940011  ! 302: ORcc_R	orcc 	%r16, %r17, %r6
	.word 0x8d340011  ! 302: SRL_R	srl 	%r16, %r17, %r6
	.word 0x8143c000  ! 302: STBAR	stbar
	.word 0xcc742985  ! 304: STX_I	stx	%r6, [%r16 + 0x0985]
	.word 0x90340011  ! 306: ORN_R	orn 	%r16, %r17, %r8
	.word 0x89340011  ! 306: SRL_R	srl 	%r16, %r17, %r4
	.word 0x8c0c0011  ! 306: AND_R	and 	%r16, %r17, %r6
	.word 0xfcbc1011  ! 306: STDA_R	stda	%r30, [%r16 + %r17] 0x80
	.word 0xfc2426b9  ! 308: STW_I	stw	%r30, [%r16 + 0x06b9]
	.word 0x98c40011  ! 310: ADDCcc_R	addccc 	%r16, %r17, %r12
	.word 0xd2ac2a33  ! 310: STBA_I	stba	%r9, [%r16 + 0x0a33] %asi
thr0_irf_ce_16:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_16), 16, 16),1,IRF,ce,34,x, x,x,x, x,x,x)
	.word 0xd2742113  ! 313: STX_I	stx	%r9, [%r16 + 0x0113]
	.word 0x853c0011  ! 315: SRA_R	sra 	%r16, %r17, %r2
	.word 0x880c0011  ! 315: AND_R	and 	%r16, %r17, %r4
	.word 0x81dc0011  ! 315: FLUSH_R	dis not found

	.word 0xc87427ad  ! 317: STX_I	stx	%r4, [%r16 + 0x07ad]
	.word 0xa92c0011  ! 319: SLL_R	sll 	%r16, %r17, %r20
	.word 0xcafc1011  ! 319: SWAPA_R	swapa	%r5, [%r16 + %r17] 0x80
	.word 0xca340011  ! 320: STH_R	sth	%r5, [%r16 + %r17]
	.word 0x8ebc2e66  ! 322: XNORcc_I	xnorcc 	%r16, 0x0e66, %r7
	.word 0xb6c426b7  ! 322: ADDCcc_I	addccc 	%r16, 0x06b7, %r27
	.word 0xae2c0011  ! 322: ANDN_R	andn 	%r16, %r17, %r23
	.word 0x81dc0011  ! 322: FLUSH_R	dis not found

	.word 0x88ac0011  ! 323: ANDNcc_R	andncc 	%r16, %r17, %r4
	.word 0x91a018f1  ! 325: FqTOs	dis not found

	.word 0xaabc2286  ! 326: XNORcc_I	xnorcc 	%r16, 0x0286, %r21
	.word 0xb1643801  ! 328: MOVcc_I	<illegal instruction>
	.word 0x8c1c0011  ! 328: XOR_R	xor 	%r16, %r17, %r6
	.word 0x88c40011  ! 328: ADDCcc_R	addccc 	%r16, %r17, %r4
	.word 0xd4440011  ! 328: LDSW_R	ldsw	[%r16 + %r17], %r10
	.word 0xd4742b5b  ! 330: STX_I	stx	%r10, [%r16 + 0x0b5b]
	.word 0x983c0011  ! 332: XNOR_R	xnor 	%r16, %r17, %r12
	.word 0xaa342d21  ! 332: ORN_I	orn 	%r16, 0x0d21, %r21
	.word 0x8ad40011  ! 332: UMULcc_R	umulcc 	%r16, %r17, %r5
	.word 0xca74292d  ! 334: STX_I	stx	%r5, [%r16 + 0x092d]
	.word 0x86342f61  ! 336: ORN_I	orn 	%r16, 0x0f61, %r3
thr0_resum_intr_5:
!$EV trig_pc_d(0,expr(@VA(.MAIN.thr0_resum_intr_5), 16, 16)) -> intp(0, 3, 1)
	wr      %r0, 0x5, %asr26
	.word 0xc634239f  ! 338: STH_I	sth	%r3, [%r16 + 0x039f]
	.word 0x90c40011  ! 340: ADDCcc_R	addccc 	%r16, %r17, %r8
	.word 0xce7c0011  ! 340: SWAP_R	swap	%r7, [%r16 + %r17]
	.word 0xce2c20bf  ! 342: STB_I	stb	%r7, [%r16 + 0x00bf]
	.word 0xab50c000  ! 344: RDPR_TT	<illegal instruction>
	.word 0xaa342d22  ! 345: ORN_I	orn 	%r16, 0x0d22, %r21
	.word 0x94b4275f  ! 347: ORNcc_I	orncc 	%r16, 0x075f, %r10
	.word 0x8143e012  ! 347: MEMBAR	membar	#StoreLoad | #Lookaside 
	.word 0x8a1c0011  ! 348: XOR_R	xor 	%r16, %r17, %r5
	.word 0xeefc236e  ! 350: SWAPA_I	swapa	%r23, [%r16 + 0x036e] %asi
thr0_irf_ce_17:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_17), 16, 16),1,IRF,ce,56,x, x,x,x, x,x,x)
	.word 0xee242d4f  ! 353: STW_I	stw	%r23, [%r16 + 0x0d4f]
	.word 0xec7c2a8c  ! 355: SWAP_I	swap	%r22, [%r16 + 0x0a8c]
	.word 0xd2740011  ! 356: STX_R	stx	%r9, [%r16 + %r17]
	.word 0x8143c000  ! 358: STBAR	stbar
	.word 0x84ac0011  ! 359: ANDNcc_R	andncc 	%r16, %r17, %r2
	.word 0x8a940011  ! 361: ORcc_R	orcc 	%r16, %r17, %r5
	.word 0x997c2401  ! 361: MOVR_I	move	%r16, 0xfffffff8, %r12
	.word 0xc36c2102  ! 361: PREFETCH_I	prefetch	[%r16 + 0x0102], #one_read
	.word 0xb8a42c20  ! 362: SUBcc_I	subcc 	%r16, 0x0c20, %r28
	.word 0xa6042652  ! 364: ADD_I	add 	%r16, 0x0652, %r19
	.word 0xaac40011  ! 364: ADDCcc_R	addccc 	%r16, %r17, %r21
	.word 0xc3ec1011  ! 364: PREFETCHA_R	prefetcha	[%r16, %r17] 0x80, #one_read
	.word 0xfe740011  ! 365: STX_R	stx	%r31, [%r16 + %r17]
	.word 0xc36c0011  ! 367: PREFETCH_R	prefetch	[%r16 + %r17], #one_read
	.word 0xcc340011  ! 368: STH_R	sth	%r6, [%r16 + %r17]
	.word 0x8e940011  ! 370: ORcc_R	orcc 	%r16, %r17, %r7
	.word 0x8e142b1b  ! 370: OR_I	or 	%r16, 0x0b1b, %r7
thr0_resum_intr_6:
!$EV trig_pc_d(0,expr(@VA(.MAIN.thr0_resum_intr_6), 16, 16)) -> intp(0, 3, 1)
	wr      %r0, 0x5, %asr26
	.word 0x9e140011  ! 371: OR_R	or 	%r16, %r17, %r15
	.word 0x8c1c0011  ! 373: XOR_R	xor 	%r16, %r17, %r6
	.word 0xe68c1011  ! 373: LDUBA_R	lduba	[%r16, %r17] 0x80, %r19
	.word 0xd4240011  ! 374: STW_R	stw	%r10, [%r16 + %r17]
	.word 0x87643801  ! 376: MOVcc_I	<illegal instruction>
	.word 0x86ac25ff  ! 376: ANDNcc_I	andncc 	%r16, 0x05ff, %r3
	.word 0x8143e033  ! 376: MEMBAR	membar	#LoadLoad | #StoreLoad | #Lookaside | #MemIssue 
thr0_irf_ce_18:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_18), 16, 16),1,IRF,ce,18,x, x,x,x, x,x,x)
	.word 0xc62c2637  ! 379: STB_I	stb	%r3, [%r16 + 0x0637]
	.word 0x8143c000  ! 381: STBAR	stbar
	.word 0xde240011  ! 382: STW_R	stw	%r15, [%r16 + %r17]
	.word 0xa92c3001  ! 384: SLLX_I	sllx	%r16, 0x0001, %r20
	.word 0xaf3c1011  ! 384: SRAX_R	srax	%r16, %r17, %r23
	.word 0x85341011  ! 384: SRLX_R	srlx	%r16, %r17, %r2
	ta	T_CHANGE_PRIV	! macro
	.word 0xd4740011  ! 385: STX_R	stx	%r10, [%r16 + %r17]
	.word 0xae9c22b5  ! 387: XORcc_I	xorcc 	%r16, 0x02b5, %r23
	.word 0x9d341011  ! 387: SRLX_R	srlx	%r16, %r17, %r14
	.word 0xba9c2af7  ! 387: XORcc_I	xorcc 	%r16, 0x0af7, %r29
	.word 0x81580000  ! 387: FLUSHW	flushw
	.word 0xca340011  ! 388: STH_R	sth	%r5, [%r16 + %r17]
	.word 0x883c0011  ! 390: XNOR_R	xnor 	%r16, %r17, %r4
	.word 0xf01c2f44  ! 390: LDD_I	ldd	[%r16 + 0x0f44], %r24
	.word 0xf4340011  ! 391: STH_R	sth	%r26, [%r16 + %r17]
	.word 0xc93c2e87  ! 393: STDF_I	std	%f4, [0x0e87, %r16]
	.word 0xc874282d  ! 395: STX_I	stx	%r4, [%r16 + 0x082d]
	.word 0x9eb42823  ! 397: ORNcc_I	orncc 	%r16, 0x0823, %r15
	.word 0x9f518000  ! 397: RDPR_PSTATE	rdpr	%pstate, %r15
	.word 0xd4740011  ! 398: STX_R	stx	%r10, [%r16 + %r17]
	.word 0xae1c0011  ! 400: XOR_R	xor 	%r16, %r17, %r23
	.word 0x9c14235c  ! 400: OR_I	or 	%r16, 0x035c, %r14
	.word 0x22800003  ! 400: BE	be,a	<label_0x3>
	.word 0x952c0011  ! 401: SLL_R	sll 	%r16, %r17, %r10
	.word 0xc3ec1011  ! 403: PREFETCHA_R	prefetcha	[%r16, %r17] 0x80, #one_read
thr0_irf_ce_19:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_19), 16, 16),1,IRF,ce,13,x, x,x,x, x,x,x)
	.word 0xd434262f  ! 406: STH_I	sth	%r10, [%r16 + 0x062f]
	.word 0x833c2001  ! 408: SRA_I	sra 	%r16, 0x0001, %r1
	.word 0x9244201f  ! 408: ADDC_I	addc 	%r16, 0x001f, %r9
	.word 0xfc0c2557  ! 408: LDUB_I	ldub	[%r16 + 0x0557], %r30
	.word 0xfc2420ad  ! 410: STW_I	stw	%r30, [%r16 + 0x00ad]
	.word 0x8143c000  ! 412: STBAR	stbar
	.word 0x8b2c0011  ! 413: SLL_R	sll 	%r16, %r17, %r5
	.word 0xb4940011  ! 415: ORcc_R	orcc 	%r16, %r17, %r26
	.word 0xeafc1011  ! 415: SWAPA_R	swapa	%r21, [%r16 + %r17] 0x80
	.word 0xc4340011  ! 416: STH_R	sth	%r2, [%r16 + %r17]
	.word 0x921c209e  ! 418: XOR_I	xor 	%r16, 0x009e, %r9
	.word 0x8b2c0011  ! 418: SLL_R	sll 	%r16, %r17, %r5
	.word 0x81880000  ! 418: SAVED	saved
	.word 0xbd7c0411  ! 419: MOVR_R	move	%r16, %r17, %r30
	.word 0x95343001  ! 421: SRLX_I	srlx	%r16, 0x0001, %r10
	.word 0x81580000  ! 421: FLUSHW	flushw
thr0_irf_ce_20:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_20), 16, 16),1,IRF,ce,24,x, x,x,x, x,x,x)
	.word 0xd43428df  ! 424: STH_I	sth	%r10, [%r16 + 0x08df]
	.word 0xbfe40011  ! 426: SAVE_R	save	%r16, %r17, %r31
	.word 0xfe2c2df5  ! 428: STB_I	stb	%r31, [%r16 + 0x0df5]
	.word 0x9f342001  ! 430: SRL_I	srl 	%r16, 0x0001, %r15
	.word 0x81dc2af8  ! 430: FLUSH_I	dis not found

	.word 0xca240011  ! 431: STW_R	stw	%r5, [%r16 + %r17]
	.word 0xb60c2a6c  ! 433: AND_I	and 	%r16, 0x0a6c, %r27
	.word 0x972c1011  ! 433: SLLX_R	sllx	%r16, %r17, %r11
	.word 0xbd2c2001  ! 433: SLL_I	sll 	%r16, 0x0001, %r30
	.word 0xa948c000  ! 433: RDHPR_HINTP	rdhpr	%hintp, %r20
	.word 0xd42c0011  ! 434: STB_R	stb	%r10, [%r16 + %r17]
	.word 0x981c0011  ! 436: XOR_R	xor 	%r16, %r17, %r12
	.word 0x88840011  ! 436: ADDcc_R	addcc 	%r16, %r17, %r4
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xc87424eb  ! 438: STX_I	stx	%r4, [%r16 + 0x04eb]
	.word 0x8143c000  ! 440: STBAR	stbar
	.word 0xc8242051  ! 442: STW_I	stw	%r4, [%r16 + 0x0051]
	.word 0x828c0011  ! 444: ANDcc_R	andcc 	%r16, %r17, %r1
	.word 0xf6440011  ! 444: LDSW_R	ldsw	[%r16 + %r17], %r27
	.word 0xf62429bf  ! 446: STW_I	stw	%r27, [%r16 + 0x09bf]
	.word 0x98c42152  ! 448: ADDCcc_I	addccc 	%r16, 0x0152, %r12
	.word 0xb08c0011  ! 448: ANDcc_R	andcc 	%r16, %r17, %r24
	.word 0xc3ec1011  ! 448: PREFETCHA_R	prefetcha	[%r16, %r17] 0x80, #one_read
	.word 0xf0342bb9  ! 450: STH_I	sth	%r24, [%r16 + 0x0bb9]
	.word 0x922c2a69  ! 452: ANDN_I	andn 	%r16, 0x0a69, %r9
	.word 0x8d7c0411  ! 452: MOVR_R	move	%r16, %r17, %r6
        wr %g0, 0x4, %fprs
thr0_irf_ce_21:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_21), 16, 16),1,IRF,ce,8,x, x,x,x, x,x,x)
	.word 0xcc742c61  ! 455: STX_I	stx	%r6, [%r16 + 0x0c61]
	.word 0x8b2c2001  ! 457: SLL_I	sll 	%r16, 0x0001, %r5
	.word 0xb61423ab  ! 457: OR_I	or 	%r16, 0x03ab, %r27
	.word 0xaa9c2a0d  ! 457: XORcc_I	xorcc 	%r16, 0x0a0d, %r21
	.word 0xdcf41011  ! 457: STXA_R	stxa	%r14, [%r16 + %r17] 0x80
thr0_irf_ce_22:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_22), 16, 16),1,IRF,ce,18,x, x,x,x, x,x,x)
	.word 0xdc3422f7  ! 460: STH_I	sth	%r14, [%r16 + 0x02f7]
	.word 0xd89c2ef7  ! 462: LDDA_I	ldda	[%r16, + 0x0ef7] %asi, %r12
thr0_irf_ce_23:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_23), 16, 16),1,IRF,ce,15,x, x,x,x, x,x,x)
	.word 0xd82c2957  ! 465: STB_I	stb	%r12, [%r16 + 0x0957]
	.word 0x8e9c0011  ! 467: XORcc_R	xorcc 	%r16, %r17, %r7
	.word 0xae142fd3  ! 467: OR_I	or 	%r16, 0x0fd3, %r23
	.word 0xe8440011  ! 467: LDSW_R	ldsw	[%r16 + %r17], %r20
thr0_irf_ce_24:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_24), 16, 16),1,IRF,ce,28,x, x,x,x, x,x,x)
	.word 0xe82c23a3  ! 470: STB_I	stb	%r20, [%r16 + 0x03a3]
	.word 0x983c0011  ! 472: XNOR_R	xnor 	%r16, %r17, %r12
	.word 0x8cbc0011  ! 472: XNORcc_R	xnorcc 	%r16, %r17, %r6
	.word 0x8e3c24bb  ! 472: XNOR_I	xnor 	%r16, 0x04bb, %r7
	.word 0x8143c000  ! 472: STBAR	stbar
	.word 0xce342533  ! 474: STH_I	sth	%r7, [%r16 + 0x0533]
	.word 0x8cb40011  ! 476: ORNcc_R	orncc 	%r16, %r17, %r6
	.word 0xa5534000  ! 476: RDPR_OTHERWIN	<illegal instruction>
thr0_irf_ce_25:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_25), 16, 16),1,IRF,ce,3,x, x,x,x, x,x,x)
	.word 0xe4742007  ! 479: STX_I	stx	%r18, [%r16 + 0x0007]
	ta	T_CHANGE_PRIV	! macro
	.word 0xda340011  ! 482: STH_R	sth	%r13, [%r16 + %r17]
	.word 0x92dc2803  ! 484: SMULcc_I	smulcc 	%r16, 0x0803, %r9
	.word 0x8e242f01  ! 485: SUB_I	sub 	%r16, 0x0f01, %r7
	.word 0x9cc42ef2  ! 487: ADDCcc_I	addccc 	%r16, 0x0ef2, %r14
	.word 0x83a00171  ! 487: FABSq	dis not found

	.word 0xc22c28d3  ! 489: STB_I	stb	%r1, [%r16 + 0x08d3]
	.word 0xad7c0411  ! 491: MOVR_R	move	%r16, %r17, %r22
	.word 0xaa0c26e3  ! 491: AND_I	and 	%r16, 0x06e3, %r21
	.word 0xb9ec0011  ! 491: RESTORE_R	restore	%r16, %r17, %r28
thr0_irf_ce_26:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_26), 16, 16),1,IRF,ce,36,x, x,x,x, x,x,x)
	.word 0xf8242869  ! 494: STW_I	stw	%r28, [%r16 + 0x0869]
	.word 0xba142d65  ! 496: OR_I	or 	%r16, 0x0d65, %r29
	.word 0x88ac2a62  ! 496: ANDNcc_I	andncc 	%r16, 0x0a62, %r4
	.word 0x81880000  ! 496: RESTORED	saved
	.word 0xc8742d4d  ! 498: STX_I	stx	%r4, [%r16 + 0x0d4d]
	.word 0x90440011  ! 500: ADDC_R	addc 	%r16, %r17, %r8
	.word 0x852c3001  ! 500: SLLX_I	sllx	%r16, 0x0001, %r2
	.word 0x8f3c1011  ! 500: SRAX_R	srax	%r16, %r17, %r7
thr0_resum_intr_7:
!$EV trig_pc_d(0,expr(@VA(.MAIN.thr0_resum_intr_7), 16, 16)) -> intp(0, 3, 1)
	wr      %r0, 0x5, %asr26
thr0_irf_ce_27:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_27), 16, 16),1,IRF,ce,63,x, x,x,x, x,x,x)
	.word 0xce242a15  ! 503: STW_I	stw	%r7, [%r16 + 0x0a15]
	.word 0x8434289f  ! 505: ORN_I	orn 	%r16, 0x089f, %r2
	.word 0xa4c423ff  ! 505: ADDCcc_I	addccc 	%r16, 0x03ff, %r18
	.word 0x95a9c831  ! 505: FMOVVS	fmovs	%fcc1, %f17, %f10
	.word 0x98440011  ! 506: ADDC_R	addc 	%r16, %r17, %r12
	.word 0x9a0c2fe2  ! 508: AND_I	and 	%r16, 0x0fe2, %r13
	.word 0xbc0c27c5  ! 508: AND_I	and 	%r16, 0x07c5, %r30
	.word 0xb4bc2e0a  ! 508: XNORcc_I	xnorcc 	%r16, 0x0e0a, %r26
	.word 0xdc9c1011  ! 508: LDDA_R	ldda	[%r16, %r17] 0x80, %r14
	.word 0x96ac28bc  ! 509: ANDNcc_I	andncc 	%r16, 0x08bc, %r11
	.word 0x880c2682  ! 511: AND_I	and 	%r16, 0x0682, %r4
	.word 0x913c1011  ! 511: SRAX_R	srax	%r16, %r17, %r8
	.word 0x8ebc0011  ! 511: XNORcc_R	xnorcc 	%r16, %r17, %r7
	.word 0xa7ec0011  ! 511: RESTORE_R	restore	%r16, %r17, %r19
	.word 0xe634259f  ! 513: STH_I	sth	%r19, [%r16 + 0x059f]
	.word 0x96c4242d  ! 515: ADDCcc_I	addccc 	%r16, 0x042d, %r11
	.word 0x8a3c235b  ! 515: XNOR_I	xnor 	%r16, 0x035b, %r5
thr0_resum_intr_8:
!$EV trig_pc_d(0,expr(@VA(.MAIN.thr0_resum_intr_8), 16, 16)) -> intp(0, 3, 1)
	wr      %r0, 0x5, %asr26
thr0_irf_ce_28:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_28), 16, 16),1,IRF,ce,45,x, x,x,x, x,x,x)
	.word 0xca742e09  ! 518: STX_I	stx	%r5, [%r16 + 0x0e09]
	.word 0x97342001  ! 520: SRL_I	srl 	%r16, 0x0001, %r11
	.word 0xbcc40011  ! 520: ADDCcc_R	addccc 	%r16, %r17, %r30
	.word 0x8143e03b  ! 520: MEMBAR	membar	#LoadLoad | #StoreLoad | #StoreStore | #Lookaside | #MemIssue 
	.word 0xad341011  ! 521: SRLX_R	srlx	%r16, %r17, %r22
	.word 0x893c2001  ! 523: SRA_I	sra 	%r16, 0x0001, %r4
	.word 0x842c0011  ! 523: ANDN_R	andn 	%r16, %r17, %r2
thr0_resum_intr_9:
!$EV trig_pc_d(0,expr(@VA(.MAIN.thr0_resum_intr_9), 16, 16)) -> intp(0, 3, 1)
	wr      %r0, 0x5, %asr26
	.word 0xcc340011  ! 524: STH_R	sth	%r6, [%r16 + %r17]
	.word 0x9e1428c2  ! 526: OR_I	or 	%r16, 0x08c2, %r15
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xc8340011  ! 527: STH_R	sth	%r4, [%r16 + %r17]
	.word 0xbadc0011  ! 529: SMULcc_R	smulcc 	%r16, %r17, %r29
	.word 0xec240011  ! 530: STW_R	stw	%r22, [%r16 + %r17]
	.word 0x83528000  ! 532: RDPR_CANSAVE	<illegal instruction>
	.word 0xc22c0011  ! 533: STB_R	stb	%r1, [%r16 + %r17]
	.word 0xbc3c237f  ! 535: XNOR_I	xnor 	%r16, 0x037f, %r30
	.word 0x85641811  ! 535: MOVcc_R	<illegal instruction>
	.word 0xbef42950  ! 535: UDIVcc_I	udivcc 	%r16, 0x0950, %r31
	.word 0xfe2c25fd  ! 537: STB_I	stb	%r31, [%r16 + 0x05fd]
	.word 0x937c0411  ! 539: MOVR_R	move	%r16, %r17, %r9
	.word 0xbe842b5b  ! 539: ADDcc_I	addcc 	%r16, 0x0b5b, %r31
	.word 0x8eb42607  ! 539: ORNcc_I	orncc 	%r16, 0x0607, %r7
	.word 0x06c40001  ! 539: BRLZ	brlz  ,nt	%16,<label_0x40001>
thr0_irf_ce_29:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_29), 16, 16),1,IRF,ce,14,x, x,x,x, x,x,x)
	.word 0xce7425d9  ! 542: STX_I	stx	%r7, [%r16 + 0x05d9]
	.word 0x2a800003  ! 544: BCS	bcs,a	<label_0x3>
	.word 0xae842cb0  ! 545: ADDcc_I	addcc 	%r16, 0x0cb0, %r23
	.word 0x8d2c3001  ! 547: SLLX_I	sllx	%r16, 0x0001, %r6
	.word 0xa6840011  ! 547: ADDcc_R	addcc 	%r16, %r17, %r19
	.word 0x85342001  ! 547: SRL_I	srl 	%r16, 0x0001, %r2
thr0_resum_intr_10:
!$EV trig_pc_d(0,expr(@VA(.MAIN.thr0_resum_intr_10), 16, 16)) -> intp(0, 3, 1)
	wr      %r0, 0x5, %asr26
	.word 0xb4440011  ! 548: ADDC_R	addc 	%r16, %r17, %r26
	.word 0x92140011  ! 550: OR_R	or 	%r16, %r17, %r9
	.word 0x8143c000  ! 550: STBAR	stbar
	.word 0x9e342118  ! 551: SUBC_I	orn 	%r16, 0x0118, %r15
	.word 0x889c2990  ! 553: XORcc_I	xorcc 	%r16, 0x0990, %r4
	.word 0x922c2a5e  ! 553: ANDN_I	andn 	%r16, 0x0a5e, %r9
	.word 0x90c40011  ! 553: ADDCcc_R	addccc 	%r16, %r17, %r8
	.word 0x81880000  ! 553: RESTORED	saved
thr0_irf_ce_30:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_30), 16, 16),1,IRF,ce,2,x, x,x,x, x,x,x)
	.word 0xd034223b  ! 556: STH_I	sth	%r8, [%r16 + 0x023b]
	.word 0xb21c0011  ! 558: XOR_R	xor 	%r16, %r17, %r25
	.word 0xbb7c2401  ! 558: MOVR_I	move	%r16, 0xfffffff8, %r29
	.word 0x81dc23ae  ! 558: FLUSH_I	dis not found

	.word 0x94b42060  ! 559: ORNcc_I	orncc 	%r16, 0x0060, %r10
	.word 0x96fc284b  ! 561: SDIVcc_I	sdivcc 	%r16, 0x084b, %r11
	.word 0xd624228d  ! 563: STW_I	stw	%r11, [%r16 + 0x028d]
	.word 0x0ac40003  ! 565: BRNZ	brnz  ,nt	%16,<label_0x40003>
	.word 0xe8240011  ! 566: STW_R	stw	%r20, [%r16 + %r17]
	.word 0x863c0011  ! 568: XNOR_R	xnor 	%r16, %r17, %r3
	.word 0xb02c251c  ! 568: ANDN_I	andn 	%r16, 0x051c, %r24
	.word 0xa77c2401  ! 568: MOVR_I	move	%r16, 0xfffffff8, %r19
	.word 0x9d534000  ! 568: RDPR_OTHERWIN	rdpr	%otherwin, %r14
	.word 0xe6740011  ! 569: STX_R	stx	%r19, [%r16 + %r17]
	.word 0xd6142c08  ! 571: LDUH_I	lduh	[%r16 + 0x0c08], %r11
thr0_irf_ce_31:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_31), 16, 16),1,IRF,ce,8,x, x,x,x, x,x,x)
	.word 0xd62c2669  ! 574: STB_I	stb	%r11, [%r16 + 0x0669]
	.word 0x82940011  ! 576: ORcc_R	orcc 	%r16, %r17, %r1
	.word 0xa6540011  ! 576: UMUL_R	umul 	%r16, %r17, %r19
	.word 0xe63429e7  ! 578: STH_I	sth	%r19, [%r16 + 0x09e7]
	.word 0x84042ed9  ! 580: ADD_I	add 	%r16, 0x0ed9, %r2
	.word 0xf29c29ee  ! 580: LDDA_I	ldda	[%r16, + 0x09ee] %asi, %r25
	.word 0xc4240011  ! 581: STW_R	stw	%r2, [%r16 + %r17]
	.word 0x88bc0011  ! 583: XNORcc_R	xnorcc 	%r16, %r17, %r4
	.word 0x86c40011  ! 583: ADDCcc_R	addccc 	%r16, %r17, %r3
	.word 0x8f2c0011  ! 583: SLL_R	sll 	%r16, %r17, %r7
thr0_resum_intr_11:
!$EV trig_pc_d(0,expr(@VA(.MAIN.thr0_resum_intr_11), 16, 16)) -> intp(0, 3, 1)
	wr      %r0, 0x5, %asr26
	.word 0xc82c0011  ! 584: STB_R	stb	%r4, [%r16 + %r17]
	.word 0xd87c259c  ! 586: SWAP_I	swap	%r12, [%r16 + 0x059c]
	.word 0xc8240011  ! 587: STW_R	stw	%r4, [%r16 + %r17]
	.word 0xaa34242f  ! 589: ORN_I	orn 	%r16, 0x042f, %r21
	.word 0xa4ac2a57  ! 589: ANDNcc_I	andncc 	%r16, 0x0a57, %r18
	.word 0x81dc0011  ! 589: FLUSH_R	dis not found

	.word 0xe47420f7  ! 591: STX_I	stx	%r18, [%r16 + 0x00f7]
	.word 0x18800001  ! 593: BGU	bgu  	<label_0x1>
	.word 0x84240011  ! 594: SUB_R	sub 	%r16, %r17, %r2
	.word 0x84340011  ! 596: ORN_R	orn 	%r16, %r17, %r2
	.word 0x849420aa  ! 596: ORcc_I	orcc 	%r16, 0x00aa, %r2
	.word 0xc8b42dd9  ! 596: STHA_I	stha	%r4, [%r16 + 0x0dd9] %asi
	.word 0xe4740011  ! 597: STX_R	stx	%r18, [%r16 + %r17]
        wr %g0, 0x4, %fprs
	.word 0xe434202f  ! 601: STH_I	sth	%r18, [%r16 + 0x002f]
	.word 0x909c0011  ! 603: XORcc_R	xorcc 	%r16, %r17, %r8
	.word 0x84942e2e  ! 603: ORcc_I	orcc 	%r16, 0x0e2e, %r2
thr0_resum_intr_12:
!$EV trig_pc_d(0,expr(@VA(.MAIN.thr0_resum_intr_12), 16, 16)) -> intp(0, 3, 1)
	wr      %r0, 0x5, %asr26
	.word 0xe4240011  ! 604: STW_R	stw	%r18, [%r16 + %r17]
	.word 0x87a40951  ! 606: FMULd	fmuld	%f16, %f48, %f34
	.word 0x91342001  ! 607: SRL_I	srl 	%r16, 0x0001, %r8
	.word 0x981c0011  ! 609: XOR_R	xor 	%r16, %r17, %r12
	.word 0x9b2c0011  ! 609: SLL_R	sll 	%r16, %r17, %r13
	.word 0x92b40011  ! 609: ORNcc_R	orncc 	%r16, %r17, %r9
thr0_resum_intr_13:
!$EV trig_pc_d(0,expr(@VA(.MAIN.thr0_resum_intr_13), 16, 16)) -> intp(0, 3, 1)
	wr      %r0, 0x5, %asr26
	.word 0xd2242c0f  ! 611: STW_I	stw	%r9, [%r16 + 0x0c0f]
	.word 0x96bc0011  ! 613: XNORcc_R	xnorcc 	%r16, %r17, %r11
	.word 0xa4042ec1  ! 613: ADD_I	add 	%r16, 0x0ec1, %r18
	.word 0x84c424bb  ! 613: ADDCcc_I	addccc 	%r16, 0x04bb, %r2
	.word 0xf4fc1011  ! 613: SWAPA_R	swapa	%r26, [%r16 + %r17] 0x80
	.word 0xa4240011  ! 614: SUB_R	sub 	%r16, %r17, %r18
	.word 0x9c3c219a  ! 616: XNOR_I	xnor 	%r16, 0x019a, %r14
	.word 0xfcd42b96  ! 616: LDSHA_I	ldsha	[%r16, + 0x0b96] %asi, %r30
	.word 0x837c2401  ! 617: MOVR_I	move	%r16, 0x7fffbdd8, %r1
	.word 0xa5343001  ! 619: SRLX_I	srlx	%r16, 0x0001, %r18
thr0_resum_intr_14:
!$EV trig_pc_d(0,expr(@VA(.MAIN.thr0_resum_intr_14), 16, 16)) -> intp(0, 3, 1)
	wr      %r0, 0x5, %asr26
thr0_irf_ce_32:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_32), 16, 16),1,IRF,ce,43,x, x,x,x, x,x,x)
	.word 0xe42c274b  ! 622: STB_I	stb	%r18, [%r16 + 0x074b]
	.word 0x9e040011  ! 624: ADD_R	add 	%r16, %r17, %r15
	.word 0x86842744  ! 624: ADDcc_I	addcc 	%r16, 0x0744, %r3
	.word 0x864c0011  ! 624: MULX_R	mulx 	%r16, %r17, %r3
	.word 0xc62c2d45  ! 626: STB_I	stb	%r3, [%r16 + 0x0d45]
	.word 0x9da01051  ! 628: FdTOx	dis not found

	.word 0x957c0411  ! 629: MOVR_R	move	%r16, %r17, %r10
	.word 0x8eac0011  ! 631: ANDNcc_R	andncc 	%r16, %r17, %r7
	.word 0x82140011  ! 631: OR_R	or 	%r16, %r17, %r1
	.word 0xb6442376  ! 631: ADDC_I	addc 	%r16, 0x0376, %r27
	.word 0x8e5c24aa  ! 631: SMUL_I	smul 	%r16, 0x04aa, %r7
	.word 0x9c3423d6  ! 632: ORN_I	orn 	%r16, 0x03d6, %r14
	.word 0x88ac222b  ! 634: ANDNcc_I	andncc 	%r16, 0x022b, %r4
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xee740011  ! 635: STX_R	stx	%r23, [%r16 + %r17]
	ta	T_CHANGE_PRIV	! macro
	.word 0xee74217b  ! 639: STX_I	stx	%r23, [%r16 + 0x017b]
	.word 0xa83c0011  ! 641: XNOR_R	xnor 	%r16, %r17, %r20
	ta	T_CHANGE_NONPRIV	! macro
thr0_irf_ce_33:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_33), 16, 16),1,IRF,ce,46,x, x,x,x, x,x,x)
	.word 0xe8242c25  ! 644: STW_I	stw	%r20, [%r16 + 0x0c25]
	.word 0xb03c2c8f  ! 646: XNOR_I	xnor 	%r16, 0x0c8f, %r24
	.word 0x989c0011  ! 646: XORcc_R	xorcc 	%r16, %r17, %r12
	.word 0x9f2c1011  ! 646: SLLX_R	sllx	%r16, %r17, %r15
	.word 0xacdc21b9  ! 646: SMULcc_I	smulcc 	%r16, 0x01b9, %r22
	.word 0xa4040011  ! 647: ADD_R	add 	%r16, %r17, %r18
	.word 0x92b40011  ! 649: ORNcc_R	orncc 	%r16, %r17, %r9
	ta	T_CHANGE_PRIV	! macro
	.word 0xb3340011  ! 650: SRL_R	srl 	%r16, %r17, %r25
	.word 0x9f341011  ! 652: SRLX_R	srlx	%r16, %r17, %r15
	.word 0xd2d4244f  ! 652: LDSHA_I	ldsha	[%r16, + 0x044f] %asi, %r9
	.word 0xd2742d9b  ! 654: STX_I	stx	%r9, [%r16 + 0x0d9b]
	.word 0x9d641811  ! 656: MOVcc_R	<illegal instruction>
	.word 0x8e8c2af0  ! 656: ANDcc_I	andcc 	%r16, 0x0af0, %r7
	.word 0xcebc2f1c  ! 656: STDA_I	stda	%r7, [%r16 + 0x0f1c] %asi
	.word 0x9c2c2516  ! 657: ANDN_I	andn 	%r16, 0x0516, %r14
	.word 0xbe3c2050  ! 659: XNOR_I	xnor 	%r16, 0x0050, %r31
	.word 0xaf7c2401  ! 659: MOVR_I	move	%r16, 0xfffffff8, %r23
thr0_resum_intr_15:
!$EV trig_pc_d(0,expr(@VA(.MAIN.thr0_resum_intr_15), 16, 16)) -> intp(0, 3, 1)
	wr      %r0, 0x5, %asr26
	.word 0xf8740011  ! 660: STX_R	stx	%r28, [%r16 + %r17]
	.word 0xd8542d49  ! 662: LDSH_I	ldsh	[%r16 + 0x0d49], %r12
	.word 0x857c2401  ! 663: MOVR_I	move	%r16, 0x7fffbdd8, %r2
	.word 0x85342001  ! 665: SRL_I	srl 	%r16, 0x0001, %r2
	.word 0x8b2c0011  ! 665: SLL_R	sll 	%r16, %r17, %r5
	.word 0x81580000  ! 665: FLUSHW	flushw
	.word 0xd22c0011  ! 666: STB_R	stb	%r9, [%r16 + %r17]
	.word 0xab3c0011  ! 668: SRA_R	sra 	%r16, %r17, %r21
thr0_resum_intr_16:
!$EV trig_pc_d(0,expr(@VA(.MAIN.thr0_resum_intr_16), 16, 16)) -> intp(0, 3, 1)
	wr      %r0, 0x5, %asr26
	.word 0xc8340011  ! 669: STH_R	sth	%r4, [%r16 + %r17]
thr0_resum_intr_17:
!$EV trig_pc_d(0,expr(@VA(.MAIN.thr0_resum_intr_17), 16, 16)) -> intp(0, 3, 1)
	wr      %r0, 0x5, %asr26
thr0_irf_ce_34:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_34), 16, 16),1,IRF,ce,32,x, x,x,x, x,x,x)
	.word 0xc8742619  ! 674: STX_I	stx	%r4, [%r16 + 0x0619]
	.word 0xbc040011  ! 676: ADD_R	add 	%r16, %r17, %r30
	.word 0x8f342001  ! 676: SRL_I	srl 	%r16, 0x0001, %r7
	.word 0x948c0011  ! 676: ANDcc_R	andcc 	%r16, %r17, %r10
	.word 0x9d480000  ! 676: RDHPR_HPSTATE	rdhpr	%hpstate, %r14
	.word 0x92bc212e  ! 677: XNORcc_I	xnorcc 	%r16, 0x012e, %r9
	.word 0xaa440011  ! 679: ADDC_R	addc 	%r16, %r17, %r21
	.word 0x9c9c0011  ! 679: XORcc_R	xorcc 	%r16, %r17, %r14
	.word 0xb8040011  ! 679: ADD_R	add 	%r16, %r17, %r28
	.word 0xcef42ac6  ! 679: STXA_I	stxa	%r7, [%r16 + 0x0ac6] %asi
	.word 0xa9340011  ! 680: SRL_R	srl 	%r16, %r17, %r20
	.word 0x98d40011  ! 682: UMULcc_R	umulcc 	%r16, %r17, %r12
	.word 0xd82429e9  ! 684: STW_I	stw	%r12, [%r16 + 0x09e9]
	.word 0xb3641811  ! 686: MOVcc_R	<illegal instruction>
	.word 0xa8bc2dee  ! 686: XNORcc_I	xnorcc 	%r16, 0x0dee, %r20
	.word 0x9f52c000  ! 686: RDPR_CANRESTORE	<illegal instruction>
thr0_irf_ce_35:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_35), 16, 16),1,IRF,ce,51,x, x,x,x, x,x,x)
	.word 0xde7422f3  ! 689: STX_I	stx	%r15, [%r16 + 0x02f3]
	.word 0x82ac0011  ! 691: ANDNcc_R	andncc 	%r16, %r17, %r1
	.word 0xb6842178  ! 691: ADDcc_I	addcc 	%r16, 0x0178, %r27
	.word 0xadec0011  ! 691: RESTORE_R	restore	%r16, %r17, %r22
thr0_irf_ce_36:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_36), 16, 16),1,IRF,ce,70,x, x,x,x, x,x,x)
	.word 0xec2c2979  ! 694: STB_I	stb	%r22, [%r16 + 0x0979]
	.word 0xc87c2478  ! 696: SWAP_I	swap	%r4, [%r16 + 0x0478]
	.word 0xc8742f0b  ! 698: STX_I	stx	%r4, [%r16 + 0x0f0b]
	.word 0xd27c0011  ! 700: SWAP_R	swap	%r9, [%r16 + %r17]
	.word 0xd2342095  ! 702: STH_I	sth	%r9, [%r16 + 0x0095]
	.word 0xac440011  ! 704: ADDC_R	addc 	%r16, %r17, %r22
	.word 0x8cac0011  ! 704: ANDNcc_R	andncc 	%r16, %r17, %r6
	.word 0xac0c2b6f  ! 704: AND_I	and 	%r16, 0x0b6f, %r22
	.word 0x92d40011  ! 704: UMULcc_R	umulcc 	%r16, %r17, %r9
	.word 0x8a3c0011  ! 705: XNOR_R	xnor 	%r16, %r17, %r5
	.word 0x9e2c0011  ! 707: ANDN_R	andn 	%r16, %r17, %r15
	.word 0xa52c3001  ! 707: SLLX_I	sllx	%r16, 0x0001, %r18
	.word 0x9e3c2ccd  ! 707: XNOR_I	xnor 	%r16, 0x0ccd, %r15
	.word 0x8143e06a  ! 707: MEMBAR	membar	#StoreLoad | #StoreStore | #MemIssue | #Sync 
thr0_irf_ce_37:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_37), 16, 16),1,IRF,ce,34,x, x,x,x, x,x,x)
	.word 0xde242271  ! 710: STW_I	stw	%r15, [%r16 + 0x0271]
	.word 0x81880000  ! 712: SAVED	saved
	.word 0xb80c2094  ! 713: AND_I	and 	%r16, 0x0094, %r28
	.word 0x86bc0011  ! 715: XNORcc_R	xnorcc 	%r16, %r17, %r3
	.word 0x907c24f3  ! 715: SDIV_I	sdiv 	%r16, 0x04f3, %r8
thr0_irf_ce_38:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_38), 16, 16),1,IRF,ce,7,x, x,x,x, x,x,x)
	.word 0xd0342fbf  ! 718: STH_I	sth	%r8, [%r16 + 0x0fbf]
	.word 0xb5343001  ! 720: SRLX_I	srlx	%r16, 0x0001, %r26
	.word 0x852c3001  ! 720: SLLX_I	sllx	%r16, 0x0001, %r2
	.word 0x928c2ed3  ! 720: ANDcc_I	andcc 	%r16, 0x0ed3, %r9
	.word 0xd3e41011  ! 720: CASA_I	casa	[%r16] 0x80, %r17, %r9
thr0_irf_ce_39:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_39), 16, 16),1,IRF,ce,20,x, x,x,x, x,x,x)
	.word 0xd27426ef  ! 723: STX_I	stx	%r9, [%r16 + 0x06ef]
	.word 0x8a442215  ! 725: ADDC_I	addc 	%r16, 0x0215, %r5
	.word 0xb4940011  ! 725: ORcc_R	orcc 	%r16, %r17, %r26
	.word 0xb153c000  ! 725: RDPR_FQ	<illegal instruction>
	.word 0x84042de3  ! 726: ADD_I	add 	%r16, 0x0de3, %r2
	.word 0x88bc2ffb  ! 728: XNORcc_I	xnorcc 	%r16, 0x0ffb, %r4
	.word 0xb84c20e2  ! 728: MULX_I	mulx 	%r16, 0x00e2, %r28
	.word 0xf824226f  ! 730: STW_I	stw	%r28, [%r16 + 0x026f]
	.word 0x8a2c0011  ! 732: ANDN_R	andn 	%r16, %r17, %r5
	.word 0xcc6c0011  ! 732: LDSTUB_R	ldstub	%r6, [%r16 + %r17]
	.word 0xcc742b8b  ! 734: STX_I	stx	%r6, [%r16 + 0x0b8b]
	.word 0x932c3001  ! 736: SLLX_I	sllx	%r16, 0x0001, %r9
	.word 0x93340011  ! 736: SRL_R	srl 	%r16, %r17, %r9
	.word 0xe6942b44  ! 736: LDUHA_I	lduha	[%r16, + 0x0b44] %asi, %r19
	.word 0xbc340011  ! 737: SUBC_R	orn 	%r16, %r17, %r30
	.word 0xb6840011  ! 739: ADDcc_R	addcc 	%r16, %r17, %r27
	.word 0xb33c0011  ! 739: SRA_R	sra 	%r16, %r17, %r25
	.word 0xe4fc1011  ! 739: SWAPA_R	swapa	%r18, [%r16 + %r17] 0x80
	.word 0xe42c248f  ! 741: STB_I	stb	%r18, [%r16 + 0x048f]
	.word 0x984c0011  ! 743: MULX_R	mulx 	%r16, %r17, %r12
	.word 0xd8240011  ! 744: STW_R	stw	%r12, [%r16 + %r17]
	.word 0x977c0411  ! 746: MOVR_R	move	%r16, %r17, %r11
	.word 0xc2fc1011  ! 746: SWAPA_R	swapa	%r1, [%r16 + %r17] 0x80
	.word 0x9b340011  ! 747: SRL_R	srl 	%r16, %r17, %r13
	.word 0x8e942e79  ! 749: ORcc_I	orcc 	%r16, 0x0e79, %r7
	.word 0x98ac2de5  ! 749: ANDNcc_I	andncc 	%r16, 0x0de5, %r12
thr0_resum_intr_18:
!$EV trig_pc_d(0,expr(@VA(.MAIN.thr0_resum_intr_18), 16, 16)) -> intp(0, 3, 1)
	wr      %r0, 0x5, %asr26
	.word 0xd8242dc3  ! 751: STW_I	stw	%r12, [%r16 + 0x0dc3]
	.word 0x9c2c0011  ! 753: ANDN_R	andn 	%r16, %r17, %r14
	.word 0x99520000  ! 753: RDPR_PIL	rdpr	%pil, %r12
thr0_irf_ce_40:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_40), 16, 16),1,IRF,ce,62,x, x,x,x, x,x,x)
	.word 0xd87426ed  ! 756: STX_I	stx	%r12, [%r16 + 0x06ed]
	.word 0x8c840011  ! 758: ADDcc_R	addcc 	%r16, %r17, %r6
	.word 0xb4942968  ! 758: ORcc_I	orcc 	%r16, 0x0968, %r26
	.word 0x81dc2cdf  ! 758: FLUSH_I	dis not found

	.word 0xf4242879  ! 760: STW_I	stw	%r26, [%r16 + 0x0879]
	.word 0xa52c1011  ! 762: SLLX_R	sllx	%r16, %r17, %r18
	.word 0x969c0011  ! 762: XORcc_R	xorcc 	%r16, %r17, %r11
	.word 0x96942ff5  ! 762: ORcc_I	orcc 	%r16, 0x0ff5, %r11
	.word 0xa7418000  ! 762: RDFPRS	rd	%fprs, %r19
thr0_irf_ce_41:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_41), 16, 16),1,IRF,ce,67,x, x,x,x, x,x,x)
	.word 0xe62c2787  ! 765: STB_I	stb	%r19, [%r16 + 0x0787]
	.word 0x8143c000  ! 767: STBAR	stbar
	.word 0xad340011  ! 768: SRL_R	srl 	%r16, %r17, %r22
	.word 0x892c0011  ! 770: SLL_R	sll 	%r16, %r17, %r4
	.word 0xea0c27f1  ! 770: LDUB_I	ldub	[%r16 + 0x07f1], %r21
	.word 0xd22c0011  ! 771: STB_R	stb	%r9, [%r16 + %r17]
	.word 0x872c2001  ! 773: SLL_I	sll 	%r16, 0x0001, %r3
	.word 0xa77c0411  ! 773: MOVR_R	move	%r16, %r17, %r19
	.word 0x04800003  ! 773: BLE	ble  	<label_0x3>
	.word 0xc22c0011  ! 774: STB_R	stb	%r1, [%r16 + %r17]
        wr %g0, 0x4, %fprs
	.word 0xc22427f9  ! 778: STW_I	stw	%r1, [%r16 + 0x07f9]
	.word 0xa93c0011  ! 780: SRA_R	sra 	%r16, %r17, %r20
	.word 0xa8b4260f  ! 780: ORNcc_I	orncc 	%r16, 0x060f, %r20
	.word 0x8c9c0011  ! 780: XORcc_R	xorcc 	%r16, %r17, %r6
	.word 0x8143c000  ! 780: STBAR	stbar
thr0_irf_ce_42:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_42), 16, 16),1,IRF,ce,3,x, x,x,x, x,x,x)
	.word 0xcc742915  ! 783: STX_I	stx	%r6, [%r16 + 0x0915]
	.word 0x8a440011  ! 785: ADDC_R	addc 	%r16, %r17, %r5
	.word 0x81580000  ! 785: FLUSHW	flushw
	.word 0xd8240011  ! 786: STW_R	stw	%r12, [%r16 + %r17]
	.word 0xbf7c0411  ! 788: MOVR_R	move	%r16, %r17, %r31
	.word 0x8cbc0011  ! 788: XNORcc_R	xnorcc 	%r16, %r17, %r6
	.word 0x833c1011  ! 788: SRAX_R	srax	%r16, %r17, %r1
	.word 0x8c7c0011  ! 788: SDIV_R	sdiv 	%r16, %r17, %r6
	.word 0xab2c1011  ! 789: SLLX_R	sllx	%r16, %r17, %r21
	.word 0x8ec40011  ! 791: ADDCcc_R	addccc 	%r16, %r17, %r7
	.word 0xa7342001  ! 791: SRL_I	srl 	%r16, 0x0001, %r19
	.word 0x8e6c24f6  ! 791: UDIVX_I	udivx 	%r16, 0x04f6, %r7
thr0_irf_ce_43:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_43), 16, 16),1,IRF,ce,60,x, x,x,x, x,x,x)
	.word 0xce34264b  ! 794: STH_I	sth	%r7, [%r16 + 0x064b]
	.word 0x9ec40011  ! 796: ADDCcc_R	addccc 	%r16, %r17, %r15
	.word 0x81880000  ! 796: RESTORED	saved
	.word 0xde2c2e3f  ! 798: STB_I	stb	%r15, [%r16 + 0x0e3f]
	.word 0xb0040011  ! 800: ADD_R	add 	%r16, %r17, %r24
	.word 0x9e842f9d  ! 800: ADDcc_I	addcc 	%r16, 0x0f9d, %r15
	.word 0x8e542339  ! 800: UMUL_I	umul 	%r16, 0x0339, %r7
	.word 0xb6940011  ! 801: ORcc_R	orcc 	%r16, %r17, %r27
	.word 0xb32c0011  ! 803: SLL_R	sll 	%r16, %r17, %r25
	.word 0x9abc0011  ! 803: XNORcc_R	xnorcc 	%r16, %r17, %r13
	.word 0xc3ec2c85  ! 803: PREFETCHA_I	prefetcha	[%r16, + 0x0c85] %asi, #one_read
	.word 0x9f340011  ! 804: SRL_R	srl 	%r16, %r17, %r15
	.word 0xbf340011  ! 806: SRL_R	srl 	%r16, %r17, %r31
	.word 0xa97c2401  ! 806: MOVR_I	move	%r16, 0xfffffff8, %r20
	.word 0x8e3c0011  ! 806: XNOR_R	xnor 	%r16, %r17, %r7
	.word 0x81880000  ! 806: RESTORED	saved
thr0_irf_ce_44:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_44), 16, 16),1,IRF,ce,20,x, x,x,x, x,x,x)
	.word 0xce342147  ! 809: STH_I	sth	%r7, [%r16 + 0x0147]
	.word 0xa9342001  ! 811: SRL_I	srl 	%r16, 0x0001, %r20
	.word 0xac0c0011  ! 811: AND_R	and 	%r16, %r17, %r22
	.word 0xae140011  ! 811: OR_R	or 	%r16, %r17, %r23
	.word 0x81580000  ! 811: FLUSHW	flushw
thr0_irf_ce_45:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_45), 16, 16),1,IRF,ce,13,x, x,x,x, x,x,x)
	.word 0xee342215  ! 814: STH_I	sth	%r23, [%r16 + 0x0215]
	.word 0x932c2001  ! 816: SLL_I	sll 	%r16, 0x0001, %r9
	.word 0x8143c000  ! 816: STBAR	stbar
	.word 0xd42c0011  ! 817: STB_R	stb	%r10, [%r16 + %r17]
	.word 0x952c0011  ! 819: SLL_R	sll 	%r16, %r17, %r10
        wr %g0, 0x4, %fprs
	.word 0xd2240011  ! 820: STW_R	stw	%r9, [%r16 + %r17]
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xb02c0011  ! 823: ANDN_R	andn 	%r16, %r17, %r24
	.word 0x8d530000  ! 825: RDPR_CLEANWIN	<illegal instruction>
	.word 0xc4340011  ! 826: STH_R	sth	%r2, [%r16 + %r17]
	.word 0xa52c3001  ! 828: SLLX_I	sllx	%r16, 0x0001, %r18
	.word 0xa6040011  ! 828: ADD_R	add 	%r16, %r17, %r19
	.word 0xc36c2233  ! 828: PREFETCH_I	prefetch	[%r16 + 0x0233], #one_read
	.word 0xd6740011  ! 829: STX_R	stx	%r11, [%r16 + %r17]
	.word 0x992c2001  ! 831: SLL_I	sll 	%r16, 0x0001, %r12
	.word 0x941c210a  ! 831: XOR_I	xor 	%r16, 0x010a, %r10
	.word 0x82542d04  ! 831: UMUL_I	umul 	%r16, 0x0d04, %r1
thr0_irf_ce_46:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_46), 16, 16),1,IRF,ce,49,x, x,x,x, x,x,x)
	.word 0xc2242043  ! 834: STW_I	stw	%r1, [%r16 + 0x0043]
	.word 0xfcbc1011  ! 836: STDA_R	stda	%r30, [%r16 + %r17] 0x80
	.word 0xd4240011  ! 837: STW_R	stw	%r10, [%r16 + %r17]
	.word 0x99343001  ! 839: SRLX_I	srlx	%r16, 0x0001, %r12
	.word 0x93342001  ! 839: SRL_I	srl 	%r16, 0x0001, %r9
	.word 0xea140011  ! 839: LDUH_R	lduh	[%r16 + %r17], %r21
	.word 0xea2c2779  ! 841: STB_I	stb	%r21, [%r16 + 0x0779]
	.word 0x87342001  ! 843: SRL_I	srl 	%r16, 0x0001, %r3
	.word 0xbd2c0011  ! 843: SLL_R	sll 	%r16, %r17, %r30
	.word 0xa6840011  ! 843: ADDcc_R	addcc 	%r16, %r17, %r19
	.word 0xc36c28a0  ! 843: PREFETCH_I	prefetch	[%r16 + 0x08a0], #one_read
thr0_irf_ce_47:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_47), 16, 16),1,IRF,ce,71,x, x,x,x, x,x,x)
	.word 0xe63423c5  ! 846: STH_I	sth	%r19, [%r16 + 0x03c5]
	.word 0x933c0011  ! 848: SRA_R	sra 	%r16, %r17, %r9
	.word 0x923c0011  ! 848: XNOR_R	xnor 	%r16, %r17, %r9
	.word 0x982c21e9  ! 848: ANDN_I	andn 	%r16, 0x01e9, %r12
	.word 0xad534000  ! 848: RDPR_OTHERWIN	<illegal instruction>
	.word 0xbc240011  ! 849: SUB_R	sub 	%r16, %r17, %r30
	.word 0x9a1c0011  ! 851: XOR_R	xor 	%r16, %r17, %r13
	.word 0xb80c0011  ! 851: AND_R	and 	%r16, %r17, %r28
	.word 0xd8bc1011  ! 851: STDA_R	stda	%r12, [%r16 + %r17] 0x80
	.word 0x94340011  ! 852: ORN_R	orn 	%r16, %r17, %r10
	.word 0x81dc214f  ! 854: FLUSH_I	dis not found

	.word 0xca740011  ! 855: STX_R	stx	%r5, [%r16 + %r17]
	.word 0xb41c0011  ! 857: XOR_R	xor 	%r16, %r17, %r26
	.word 0xb2bc2a48  ! 857: XNORcc_I	xnorcc 	%r16, 0x0a48, %r25
	.word 0xc36c0011  ! 857: PREFETCH_R	prefetch	[%r16 + %r17], #one_read
thr0_irf_ce_48:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_48), 16, 16),1,IRF,ce,61,x, x,x,x, x,x,x)
	.word 0xf22c2df3  ! 860: STB_I	stb	%r25, [%r16 + 0x0df3]
	.word 0xee04272c  ! 862: LDUW_I	lduw	[%r16 + 0x072c], %r23
thr0_irf_ce_49:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_49), 16, 16),1,IRF,ce,18,x, x,x,x, x,x,x)
	.word 0xee742dfd  ! 865: STX_I	stx	%r23, [%r16 + 0x0dfd]
	.word 0x9f341011  ! 867: SRLX_R	srlx	%r16, %r17, %r15
thr0_resum_intr_19:
!$EV trig_pc_d(0,expr(@VA(.MAIN.thr0_resum_intr_19), 16, 16)) -> intp(0, 3, 1)
	wr      %r0, 0x5, %asr26
	.word 0xde24263f  ! 869: STW_I	stw	%r15, [%r16 + 0x063f]
	.word 0xbc440011  ! 871: ADDC_R	addc 	%r16, %r17, %r30
	.word 0xbb342001  ! 871: SRL_I	srl 	%r16, 0x0001, %r29
	.word 0x8ab40011  ! 871: ORNcc_R	orncc 	%r16, %r17, %r5
	.word 0xc614215b  ! 871: LDUH_I	lduh	[%r16 + 0x015b], %r3
	.word 0xc674218d  ! 873: STX_I	stx	%r3, [%r16 + 0x018d]
	.word 0x8143e037  ! 875: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #Lookaside | #MemIssue 
	.word 0xc62429eb  ! 877: STW_I	stw	%r3, [%r16 + 0x09eb]
	.word 0xb684249c  ! 879: ADDcc_I	addcc 	%r16, 0x049c, %r27
	.word 0x8143c000  ! 879: STBAR	stbar
	.word 0xf6242a7f  ! 881: STW_I	stw	%r27, [%r16 + 0x0a7f]
	.word 0xb48c0011  ! 883: ANDcc_R	andcc 	%r16, %r17, %r26
	.word 0xe6bc28d5  ! 883: STDA_I	stda	%r19, [%r16 + 0x08d5] %asi
	.word 0x923c24c1  ! 884: XNOR_I	xnor 	%r16, 0x04c1, %r9
	.word 0x99ec0011  ! 886: RESTORE_R	restore	%r16, %r17, %r12
	.word 0xf0240011  ! 887: STW_R	stw	%r24, [%r16 + %r17]
	.word 0x93341011  ! 889: SRLX_R	srlx	%r16, %r17, %r9
	.word 0xb12c3001  ! 889: SLLX_I	sllx	%r16, 0x0001, %r24
	.word 0x83343001  ! 889: SRLX_I	srlx	%r16, 0x0001, %r1
	.word 0xc3ec27d1  ! 889: PREFETCHA_I	prefetcha	[%r16, + 0x07d1] %asi, #one_read
	.word 0xc4340011  ! 890: STH_R	sth	%r2, [%r16 + %r17]
thr0_resum_intr_20:
!$EV trig_pc_d(0,expr(@VA(.MAIN.thr0_resum_intr_20), 16, 16)) -> intp(0, 3, 1)
	wr      %r0, 0x5, %asr26
	.word 0xa77c2401  ! 893: MOVR_I	move	%r16, 0x7fffbdd8, %r19
	.word 0x8f2c2001  ! 895: SLL_I	sll 	%r16, 0x0001, %r7
	.word 0x866c2da7  ! 895: UDIVX_I	udivx 	%r16, 0x0da7, %r3
	.word 0xca340011  ! 896: STH_R	sth	%r5, [%r16 + %r17]
	.word 0x92940011  ! 898: ORcc_R	orcc 	%r16, %r17, %r9
	.word 0x9c9c29a0  ! 898: XORcc_I	xorcc 	%r16, 0x09a0, %r14
	.word 0xa5342001  ! 898: SRL_I	srl 	%r16, 0x0001, %r18
	ta	T_CHANGE_HPRIV	! macro
thr0_irf_ce_50:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_50), 16, 16),1,IRF,ce,47,x, x,x,x, x,x,x)
	.word 0xe43426e5  ! 901: STH_I	sth	%r18, [%r16 + 0x06e5]
	.word 0x992c2001  ! 903: SLL_I	sll 	%r16, 0x0001, %r12
	.word 0x903c23db  ! 903: XNOR_I	xnor 	%r16, 0x03db, %r8
	.word 0xac0c0011  ! 903: AND_R	and 	%r16, %r17, %r22
	.word 0x81dc252f  ! 903: FLUSH_I	dis not found

	.word 0xec740011  ! 904: STX_R	stx	%r22, [%r16 + %r17]
	.word 0x9e2c2cb5  ! 906: ANDN_I	andn 	%r16, 0x0cb5, %r15
thr0_resum_intr_21:
!$EV trig_pc_d(0,expr(@VA(.MAIN.thr0_resum_intr_21), 16, 16)) -> intp(0, 3, 1)
	wr      %r0, 0x5, %asr26
	.word 0xde24236d  ! 908: STW_I	stw	%r15, [%r16 + 0x036d]
	.word 0x824425df  ! 910: ADDC_I	addc 	%r16, 0x05df, %r1
	.word 0x96940011  ! 910: ORcc_R	orcc 	%r16, %r17, %r11
	.word 0x9c0423d6  ! 910: ADD_I	add 	%r16, 0x03d6, %r14
	ta	T_CHANGE_HPRIV	! macro
	.word 0xd82c0011  ! 911: STB_R	stb	%r12, [%r16 + %r17]
	.word 0x972c1011  ! 913: SLLX_R	sllx	%r16, %r17, %r11
	.word 0x9a040011  ! 913: ADD_R	add 	%r16, %r17, %r13
	.word 0x9d3c0011  ! 913: SRA_R	sra 	%r16, %r17, %r14
	.word 0xcaa41011  ! 913: STWA_R	stwa	%r5, [%r16 + %r17] 0x80
	.word 0x90340011  ! 914: ORN_R	orn 	%r16, %r17, %r8
	.word 0xa72c1011  ! 916: SLLX_R	sllx	%r16, %r17, %r19
	.word 0x81580000  ! 916: FLUSHW	flushw
	.word 0xba1c0011  ! 917: XOR_R	xor 	%r16, %r17, %r29
	.word 0x8d840011  ! 919: WRFPRS_R	wr	%r16, %r17, %fprs
	.word 0xfa242619  ! 921: STW_I	stw	%r29, [%r16 + 0x0619]
	.word 0x9e3c225c  ! 923: XNOR_I	xnor 	%r16, 0x025c, %r15
	.word 0x8e840011  ! 923: ADDcc_R	addcc 	%r16, %r17, %r7
	.word 0xbf7c2401  ! 923: MOVR_I	move	%r16, 0xfffffff8, %r31
	.word 0x8143e070  ! 923: MEMBAR	membar	#Lookaside | #MemIssue | #Sync 
	.word 0xfe2c2fe3  ! 925: STB_I	stb	%r31, [%r16 + 0x0fe3]
	.word 0x889c0011  ! 927: XORcc_R	xorcc 	%r16, %r17, %r4
	.word 0x8e1c0011  ! 927: XOR_R	xor 	%r16, %r17, %r7
        wr %g0, 0x4, %fprs
	.word 0xd8240011  ! 928: STW_R	stw	%r12, [%r16 + %r17]
	.word 0x81dc2ddb  ! 930: FLUSH_I	dis not found

thr0_irf_ce_51:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_51), 16, 16),1,IRF,ce,66,x, x,x,x, x,x,x)
	.word 0xd82c237d  ! 933: STB_I	stb	%r12, [%r16 + 0x037d]
	.word 0x81580000  ! 935: FLUSHW	flushw
	.word 0xd8342ccd  ! 937: STH_I	sth	%r12, [%r16 + 0x0ccd]
	.word 0x9b240011  ! 939: MULScc_R	mulscc 	%r16, %r17, %r13
	.word 0xda2c26c9  ! 941: STB_I	stb	%r13, [%r16 + 0x06c9]
	.word 0x909c24af  ! 943: XORcc_I	xorcc 	%r16, 0x04af, %r8
	.word 0xbc2c0011  ! 943: ANDN_R	andn 	%r16, %r17, %r30
	.word 0x9b340011  ! 943: SRL_R	srl 	%r16, %r17, %r13
	.word 0xd8ec23d4  ! 943: LDSTUBA_I	ldstuba	%r12, [%r16 + 0x03d4] %asi
thr0_irf_ce_52:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_52), 16, 16),1,IRF,ce,37,x, x,x,x, x,x,x)
	.word 0xd8242433  ! 946: STW_I	stw	%r12, [%r16 + 0x0433]
	.word 0xf87c20ef  ! 948: SWAP_I	swap	%r28, [%r16 + 0x00ef]
	.word 0x8f343001  ! 949: SRLX_I	srlx	%r16, 0x0001, %r7
	.word 0xb12c0011  ! 951: SLL_R	sll 	%r16, %r17, %r24
	.word 0x90b40011  ! 951: ORNcc_R	orncc 	%r16, %r17, %r8
	.word 0xf0bc1011  ! 951: STDA_R	stda	%r24, [%r16 + %r17] 0x80
thr0_irf_ce_53:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_53), 16, 16),1,IRF,ce,44,x, x,x,x, x,x,x)
	.word 0xf074215f  ! 954: STX_I	stx	%r24, [%r16 + 0x015f]
	.word 0xc36c238b  ! 956: PREFETCH_I	prefetch	[%r16 + 0x038b], #one_read
	.word 0xf62c0011  ! 957: STB_R	stb	%r27, [%r16 + %r17]
	.word 0xb0140011  ! 959: OR_R	or 	%r16, %r17, %r24
	.word 0x92342c57  ! 959: ORN_I	orn 	%r16, 0x0c57, %r9
	.word 0x8143c000  ! 959: STBAR	stbar
	.word 0xc22c0011  ! 960: STB_R	stb	%r1, [%r16 + %r17]
	.word 0x96842b6f  ! 962: ADDcc_I	addcc 	%r16, 0x0b6f, %r11
	ta	T_CHANGE_NONHPRIV	! macro
thr0_irf_ce_54:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_54), 16, 16),1,IRF,ce,39,x, x,x,x, x,x,x)
	.word 0xd62c2951  ! 965: STB_I	stb	%r11, [%r16 + 0x0951]
	.word 0x81880000  ! 967: SAVED	saved
thr0_irf_ce_55:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_55), 16, 16),1,IRF,ce,29,x, x,x,x, x,x,x)
	.word 0xd63425e9  ! 970: STH_I	sth	%r11, [%r16 + 0x05e9]
	.word 0xbf343001  ! 972: SRLX_I	srlx	%r16, 0x0001, %r31
	.word 0x96ac0011  ! 972: ANDNcc_R	andncc 	%r16, %r17, %r11
	.word 0xa77c0411  ! 972: MOVR_R	move	%r16, %r17, %r19
        wr %g0, 0x4, %fprs
thr0_irf_ce_56:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_56), 16, 16),1,IRF,ce,4,x, x,x,x, x,x,x)
	.word 0xe62425d1  ! 975: STW_I	stw	%r19, [%r16 + 0x05d1]
	.word 0x920c2d1f  ! 977: AND_I	and 	%r16, 0x0d1f, %r9
	.word 0x9d2c0011  ! 977: SLL_R	sll 	%r16, %r17, %r14
	.word 0x9e940011  ! 977: ORcc_R	orcc 	%r16, %r17, %r15
	.word 0xd0142305  ! 977: LDUH_I	lduh	[%r16 + 0x0305], %r8
	.word 0xd42c0011  ! 978: STB_R	stb	%r10, [%r16 + %r17]
	.word 0x8143c000  ! 980: STBAR	stbar
	.word 0xd47426fd  ! 982: STX_I	stx	%r10, [%r16 + 0x06fd]
	.word 0x8ab42325  ! 984: ORNcc_I	orncc 	%r16, 0x0325, %r5
	.word 0x94040011  ! 984: ADD_R	add 	%r16, %r17, %r10
	.word 0xd65c0011  ! 984: LDX_R	ldx	[%r16 + %r17], %r11
	.word 0xd8340011  ! 985: STH_R	sth	%r12, [%r16 + %r17]
	.word 0xb17c0411  ! 987: MOVR_R	move	%r16, %r17, %r24
	.word 0x08800001  ! 987: BLEU	bleu  	<label_0x1>
	.word 0xf0342a6d  ! 989: STH_I	sth	%r24, [%r16 + 0x0a6d]
	.word 0x8a9c2851  ! 991: XORcc_I	xorcc 	%r16, 0x0851, %r5
	.word 0xba940011  ! 991: ORcc_R	orcc 	%r16, %r17, %r29
	.word 0x84942f33  ! 991: ORcc_I	orcc 	%r16, 0x0f33, %r2
	.word 0x8d840011  ! 991: WRFPRS_R	wr	%r16, %r17, %fprs
thr0_irf_ce_57:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_57), 16, 16),1,IRF,ce,54,x, x,x,x, x,x,x)
	.word 0xc42c21c7  ! 994: STB_I	stb	%r2, [%r16 + 0x01c7]
	.word 0x86140011  ! 996: OR_R	or 	%r16, %r17, %r3
	.word 0x81880000  ! 996: RESTORED	saved
	.word 0xc6742e55  ! 998: STX_I	stx	%r3, [%r16 + 0x0e55]
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
	.word  0xe4e8f417,0x08a5cce8,0xad783ee1,0x9f1d9a84
	.word  0x0927f08b,0x1133c1ee,0x1fb0a114,0x5e5ecf62
	.word  0x9f9d70ca,0xb6e794c0,0x87d28b91,0xd875d833
	.word  0xedbbed39,0xabed0e5e,0xc340a349,0x546a27c9
	.word  0xf50abc48,0x74edfbbc,0x652b936b,0x10c8dcaa
	.word  0x37e972c8,0x5653caf4,0x8373261f,0x69f86f5e
	.word  0x2b2a9752,0x828f8a26,0x2c849c31,0x1445fe2f
	.word  0x3596203a,0x5c60bfb5,0x122945b4,0xcf1da7d1
	.word  0x7f12b22a,0x4001e910,0x066ad09f,0x13b4644d
	.word  0xe8c149f3,0x5fb10bcc,0x25af5636,0x94e52371
	.word  0x27217aa4,0x4906bede,0x412a7b3e,0xecbce9dd
	.word  0x1a112c97,0xd6a081fb,0x6b337dfd,0x05acdc95
	.word  0x67bd0995,0x264f4703,0x8e2c0ee8,0x2be3dd5f
	.word  0x94a3db0a,0x457a32c3,0x43b68fe8,0xc5be8e98
	.word  0x25a2b5ed,0xb0a9da9a,0xc343c8ae,0xbf76f9f0
	.word  0xebad032c,0x68909870,0x52a2016a,0xa6b31655
	.word  0xdfc02d62,0xae69dd21,0x539a1a02,0xf1e79b55
	.word  0x51b4d013,0x066be706,0x935036de,0x80235fbe
	.word  0xe4f77d22,0x32a9b79b,0x5881f4e5,0xeede7e85
	.word  0x0cda066a,0x133500bf,0x924eadd8,0xe1fe6b06
	.word  0x69a5338e,0x635448a3,0x7a861da3,0x8b25bbd3
	.word  0x5039f97d,0xfb4d9b11,0xa537fea3,0x268ec041
	.word  0x1493fb1d,0x4868a151,0x621f2ad5,0x88b810d9
	.word  0x4f25fb67,0x4df6d6a4,0x07eff7b6,0x4b1e1689
	.word  0x88843675,0x864b69bd,0x3831c109,0x91e5a0d2
	.word  0x9f988196,0xc77a5db7,0x4c2cc845,0x87b2ee69
	.word  0xe73c3b6a,0x75ac566a,0xd505e8b4,0xb9ebc4d5
	.word  0xfea2e7ba,0x892b45e4,0xab503b7c,0xf2c17031
	.word  0x6a0dc8da,0x55cfc677,0xf304e891,0x59df6e1d
	.word  0xcf1af353,0x39ffec7e,0xbaee955f,0x3069bf89
	.word  0x2f5cf68e,0x39c6011d,0x70324b7f,0x1098d496
	.word  0x2b07b3ac,0x3a2fbcc9,0x7de0783d,0x978b157c
	.word  0x3c4757b7,0xb245b813,0xf8dd9e27,0x85aaf61d
	.word  0x208fc693,0xfdf02e0a,0xd081d16f,0xe14beda5
	.word  0x64f7db19,0xdf0d3fe9,0x5987c35b,0x31501062
	.word  0xd2a7f99c,0xb67d077d,0x1ce806a6,0x43caa9a3
	.word  0x5511d295,0x54fdbe7b,0x34f58204,0xb26c4c60
	.word  0xe1ae7913,0x89904487,0x5de1af9e,0xf1defce5
	.word  0x7e3a1c66,0x1d5d7d8b,0xd4dea4a1,0xfb3075d4
	.word  0x2fe54b73,0xf5785d13,0x97581ced,0x63c7755e
	.word  0xacaba644,0x24b7b37a,0x633f6ab3,0x8e2a71eb
	.word  0x87aec1fd,0xb70bebd0,0x88ce9160,0x79c0c604
	.word  0x00cb6481,0x77d524a8,0xbdaba3ff,0xfe015b50
	.word  0x97cf3b0c,0x2165bf42,0x0be1c2c4,0xdf7d11b6
	.word  0xde23d49e,0xa8464da2,0xfde8a7bf,0x7e3607e9
	.word  0x87fab3b7,0x3c6f7fab,0xabe19726,0x18d60f11
	.word  0x058d1e13,0x7ebfcfc1,0xd6ae3dbe,0xdec080e7
	.word  0x19d17efa,0x308475ea,0x5ea1a581,0xba1fba27
	.word  0x9def78b8,0x2fb304a1,0x16e5e478,0x496f215a
	.word  0x087db9e1,0x3f1556ca,0xc0b2532d,0x85510a0a
	.word  0xf20e92e9,0xd3118934,0xf866cf12,0xc5cf6ae4
	.word  0x4487a702,0x9288cf58,0x33b42887,0x4fa86d96
	.word  0x63565147,0xef5fb847,0x56ee1836,0x32521e71
	.word  0x053f277e,0x2687d77f,0x31e3755e,0x66402dcf
	.word  0x6d953c6e,0x3055e365,0x71677232,0x88923d78
	.word  0x76d64087,0xab2a892f,0xe64fe240,0xaf090d74
	.word  0xda5c8b95,0xcb076ab6,0x99fd98f8,0xa92ae2a2
	.word  0x1bc9fbc9,0xb04293ee,0xce8883b5,0xd43c882d
	.word  0x4c9f7790,0xc5eb8ec9,0x1f0f217f,0x1a0267bc
	.word  0x0da4fa5e,0x8905cea9,0xbc84cd4a,0xeff2c6c0
	.word  0xc4ad2639,0xbf88999a,0x107c6a5e,0xb003dd81
	.word  0x2f518f6f,0xe63bf2d1,0x6de65d71,0x49257cf6
	.word  0xc8801b84,0x761aa19d,0xbf759e6f,0x1e9af1d5
	.word  0x0b6be7d2,0xd5eb1032,0xbf941d67,0x57662a1f
	.word  0x1c402f31,0xc82059c8,0x96a42c79,0xab923634
	.word  0x6da93263,0xe36656a7,0xfdaf283b,0x3317bcb6
	.word  0xfdea269a,0xde626016,0x08c1f71f,0x70b5786b
	.word  0xff0a56e3,0x8583faae,0x575768c9,0x24e0d08e
	.word  0x498a9990,0x208697fb,0xf2906618,0x3b605786
	.word  0xeadcbb1d,0x3f47f9a0,0x0f837b51,0x6c21fbac
	.word  0xa0f221db,0xc74fc1c9,0x3b4fcfff,0x0eccedf8
	.word  0x889a715b,0x9e0833be,0xad9ea882,0xd4a3adbd
	.word  0x5c01485b,0xdc7d861a,0xcf8338f0,0x2288d411
	.word  0xdae6ba9d,0x86fb49d7,0x1a50e329,0xafb28d62
	.word  0x266ed152,0xb98d704f,0x699f0803,0xc48e13df
	.word  0x4ad92996,0x6b67d7a5,0x33332e3e,0xebf4b350
	.word  0x1f9ade72,0x5416a789,0x91f91c78,0x6a2bca71
	.word  0xa9fe59dc,0x10769301,0xab3bea17,0x9655d7d9
	.word  0xc84d290f,0x2aa3ca2f,0x825d2c6a,0xe01e247b
	.word  0xe47fbe42,0x7ba54b50,0x3edb580e,0x4a77e4e0
	.word  0x86b681f5,0x2f54794f,0xa352e2b4,0x4dc4d3a1
	.word  0x6572f99c,0x03584b29,0xa78ea18c,0x5ff5e67e
	.word  0xb5e512a0,0xbf459e5f,0x6d7a5c60,0x8291a674
	.word  0x94c5b8ca,0x2b2d0d87,0x42113ec5,0xd6eca129
	.word  0x9601623d,0x78eea8b1,0x84b4fb71,0xefb5208e
	.word  0x8cd88527,0x824853c5,0x91c574af,0xee7a6efc
	.word  0x8160a4d1,0x9276ccde,0x2c92b33a,0xe37775d2
	.word  0xc7278faf,0x171d1ed5,0x1ad364bd,0xec050e00
	.word  0xf13f15bb,0xece77800,0x99278781,0x9eab3689
	.word  0xbb9dc7d4,0xb0ad6ac2,0xa1f0b53a,0xd902861b
	.word  0x36187566,0x71d3add9,0x2cfca447,0x86c2ea5a
	.word  0x279efc81,0x29209cc5,0x5ca4c512,0x2b3db409
	.word  0xadb78657,0x0b9078dd,0x02312a1c,0xdcdef8a3
	.word  0xecdeb905,0x43eaf821,0x3d66b557,0x5efc288b
	.word  0x3f820e89,0x2830319f,0xbcbaa7a6,0x92ee2a1c
	.word  0x9168f100,0x0db0f280,0x61e558ab,0x9119adab
	.word  0x6bba9e41,0x97d9c1ab,0x6cbd1023,0x34092721
	.word  0x5bfcb34d,0x80fdf474,0x572eb260,0x9125b378
	.word  0xc51b7bac,0x8c908a1f,0xdbf0c4b2,0xa74848ea
	.word  0x130ae5e1,0xa76b84d3,0xab39dfa8,0x2cab24fa
	.word  0x199d9239,0x93b3539b,0xe86e3fd9,0x235e1b9f
	.word  0x29bdbf52,0xa0eadd09,0xb25c0e05,0x336d79a7
	.word  0x62203b73,0xcb01c72c,0xf0fbcfdf,0x2f836d56
	.word  0xcc88a783,0x28d9295e,0xcfffc95f,0x7a252d7d
	.word  0xfd6ff950,0x0b6f7bb3,0x8745688a,0x683d73f0
	.word  0xcdea1d53,0x99feca2e,0xc64207ed,0x6bb16bb5
	.word  0xdf72f559,0xac50d5a5,0x2c26a142,0x6e24dc7f
	.word  0xac549500,0xd02f1162,0xa7039914,0x368e6e67
	.word  0xe9b4f90f,0x0b8466c7,0x3df7028a,0x084af75d
	.word  0xcafee687,0x76f0b1eb,0x43443634,0x89616508
	.word  0xc9f341e9,0xd7eab523,0xce43de53,0x9b9a94a6
	.word  0x4231d824,0xe5bbb70e,0x40658503,0x40f26e6f
	.word  0x69ed04f2,0xfb530afd,0x8d55f528,0x8a710e8f
	.word  0x77281af7,0x8f3ae443,0x9eeed5a8,0xffec1c30
	.word  0x11a916b0,0x1323bd7d,0x1ec7e438,0x8c86d8fd
	.word  0xe30c2452,0xf0db65fc,0xf7fa92e8,0x7a65629f
	.word  0x4f33aaf6,0x1dd80aaf,0x2e3c75da,0x2e60df0b
	.word  0x4ff7a8c4,0xed2ae958,0x47a7db8b,0xdb9d8f2e
	.word  0xaeee6c56,0x57cbb3c4,0x98d0cb2c,0x1dbfc434
	.word  0x2712a829,0x6ed545f8,0xcd7ba510,0xb6464bfe
	.word  0x1c4d49e2,0xb54f570b,0xdd8676c2,0x957f8e8e
	.word  0x0bede6bf,0x078599e7,0xa1306457,0xf037e6a5
	.word  0x90a6a794,0x15fefaf9,0x1164499e,0x76a3494d
	.word  0x8b11f458,0xe3b5335b,0x4d9d89cc,0xf9d0e865
	.word  0xb9e3c865,0xbff87779,0x5902a1c8,0xffb223cb
	.word  0xa191f1e9,0xac4a5368,0xc9f8cb45,0xb6b898b2
	.word  0x32910c84,0x9a9f124e,0x8c122eab,0x35f314b5
	.word  0x9c2011b5,0x9bbfd1b5,0xa94bb04a,0x017cf396
	.word  0x9696c388,0x5202ae48,0x7cc31959,0x840d30a5
	.word  0xedf2a330,0x023983f9,0x8c8e4043,0x6839da21
	.word  0x76aa3bea,0x997aa93b,0x607a3962,0xfc735b52
	.word  0x6d199fee,0x6d1c14a7,0x89c8adef,0x10dc224b
	.word  0xf3196c75,0x65240413,0xd4c337bd,0xb556f9d7
	.word  0xc9dd08ec,0x147b34d2,0x0c0c2351,0xf74633dc
	.word  0x386e4192,0x06d5c7e9,0x1f19c0ed,0x2f735549
	.word  0xf73b99e1,0x27b050de,0xe3dfb7dc,0x6c7b02a1
	.word  0x2d273c39,0x2d52facf,0x9643d5ad,0xdeba37d5
	.word  0x843b1c90,0x09f62a2d,0x9d4cba87,0x320cf917
	.word  0xe3de6094,0x5141425a,0xd2c58627,0xee96accb
	.word  0xd237f57e,0xfd55eb4d,0x925e7690,0xf10779e1
	.word  0x943a1f6f,0x6d48ed73,0x6d4caf6b,0x38153a78
	.word  0xb59874a8,0xd5b6d233,0x4f1bd0dd,0x70b747b0
	.word  0x9fa23ccc,0x87109407,0x5d2bd48a,0x618a7b8c
	.word  0xb5c64945,0x3a0b66c0,0xc7f42deb,0xca20aff9
	.word  0x8efecccc,0xc9cb43e1,0x6cd0aa31,0x892f6166
	.word  0x4450a3a0,0xbcfde8e0,0x3f7db945,0x3aa35399
	.word  0xb5361a87,0x15e7b707,0x20412eaa,0x8e249248
	.word  0x80025a23,0x3b1ae84e,0xea7bba12,0x614a9de7
	.word  0xbb77ccee,0x58c0dfc5,0xef6b17ad,0x38c9d4fa
	.word  0x7df93e2b,0xe170f571,0xc5f99c64,0xc7d88a16
	.word  0x6b495418,0x517b817c,0x4b72b729,0xf4712db9
	.word  0x309a6315,0x69f435f1,0x4d14afdd,0xa3f71538
	.word  0x770c951c,0x7806e098,0xa0d57a58,0xa4a9783c
	.word  0xe3a8c796,0xa88ea730,0xc89645fb,0xabca1668
	.word  0x5b54175a,0x173166fd,0x22d6ff0d,0xcd9604bc
	.word  0xc13ea480,0x595110a6,0xd91f4e33,0x4a247228
	.word  0xcc5dd05d,0xde0020ca,0x4dbc6850,0x61e8ac02
	.word  0xc57e5c30,0x01c844cc,0x42661650,0xb26680a9
	.word  0xc9680d67,0xfecbd9a8,0x5391e177,0xa2f56775
	.word  0x33f421f9,0x5615ab00,0x07dca8c2,0xee0eb93b
	.word  0x79a7efc2,0x3be971b2,0x0f36ae55,0x95b52048
	.word  0x967f172e,0x6e777a9f,0x0c95c11b,0x52b95bd8
	.word  0xa2d951f0,0xdbe03659,0x45d051cc,0xff18164e
	.word  0xa5762b04,0xae487ca7,0x8e5130ce,0xba2f0b00
	.word  0x0f0cc78f,0x5ebfa1bc,0x33a1a82f,0x0db24f9a
	.word  0x0fd8653f,0x0f84ac2d,0x22c2c777,0xe38d1ec5
	.word  0x8b11358a,0x925e04eb,0xf9f8d0d7,0x6e103660
	.word  0x731ccec8,0x3d641bc8,0x24f2a6f2,0xa33b7ba9
	.word  0xa2584e3a,0xd250fac1,0x4bd134f8,0x1ba69c4d
	.word  0x7e1fd6cd,0x06d6634e,0xbc162543,0xb45a206a
	.word  0xcc49ff40,0xb16c75e6,0xe21e2db6,0xaf82eb9f
	.word  0xc8aa83af,0x4a318693,0xd33655c1,0xc989db9b
	.word  0x821ed71f,0x5258dd08,0x14bcab9c,0x5327e2dd
	.word  0xa9a6c910,0x64e1e8df,0x71fa538c,0x24e4b471
	.word  0x25410baa,0xc932b779,0x7d6bfa06,0x1231266c
	.word  0x47338f12,0xec34ed0f,0x5c440bd9,0x30c33a8d
	.word  0x26d328e9,0xf431d499,0xf4ab31db,0x3989a320
	.word  0x7a184a5b,0x8f205e21,0xf92dd0e5,0xa58ee711
	.word  0x72747c9d,0x671b20ed,0x28e1d1ba,0x171a72ed
	.word  0xb47d4e2a,0x7719dd96,0xd4126e73,0x1acdba97
	.word  0xcb529c0d,0x229b941d,0xc11b3a9d,0x698dac87
	.word  0x4075f83e,0xc0117d60,0xbb21aa9a,0x48ca5fd7
	.word  0xdcb7c8ef,0x234b7f74,0x56e20265,0x8396b0c4
	.word  0x926b0b76,0x4a0425bc,0x0d598686,0x7d7f69a7
	.word  0xd5a87e5f,0x24a1c213,0xbd4eaa5d,0x7f5f255f
	.word  0xaa7e251d,0x17a12173,0x1fbddcc7,0xb606beb5
	.word  0x70467baa,0x077dd8ae,0x0232aa3d,0x4f12045c
	.word  0x3b6c2b7d,0x26921aa2,0xd94939e9,0x37ca67aa
	.word  0x0661fb13,0xf1d86419,0x2f90ee60,0xcc7e4f7b
	.word  0x34154edf,0x56052b48,0x7611b436,0x67beabad
	.word  0x64f409ef,0xcba96aad,0x936cd9b8,0x3ca732a3
	.word  0x05163cd5,0x213a2b8b,0x7a270d30,0x6e373762
	.word  0xd2d3d39d,0xa3b7333d,0x77f72349,0xe1c28bfe
	.word  0x58c55e0e,0x32f96623,0x0e373a4f,0x74930ba4
	.word  0x3ee7401e,0x2ebf4f97,0x216cb654,0xa5b1eaf2
	.word  0x8545f112,0xb17b9a17,0x4e7cc4b2,0x17b907ca
	.word  0xbb9232f9,0x14058cc7,0xf0e34040,0x8e9a24db
	.word  0x8e3a2dca,0xe5a66552,0x077df9d7,0xfbcffa5a
	.word  0x656bf8d5,0xf44279b2,0xc576b681,0x92696848
	.word  0x4a4e9a46,0xf668b33a,0x0527f28b,0x307c9faa
	.word  0xca6cff29,0xdac1a4ee,0x89f8f6b8,0x3ba193dc
	.word  0x9b469c55,0x3a7f9514,0x0684a8c1,0x4999d6e0
	.word  0x1c89f387,0x47a9b58a,0x6292b4c6,0x0248662a
	.word  0xc0adf7e0,0x39adce9b,0xb916be62,0x2ea6c1c5
	.word  0x436f9b1a,0x9fb05894,0x0a0d384c,0xab83ed24
	.word  0xbe4d24c5,0x41da2ce3,0x732833f7,0xad51176a
	.word  0x5cd7de35,0xfacf2a45,0xc7050cdd,0x22929fe5
	.word  0xefab07c2,0x7abf410d,0x371dded0,0xd9a0c5d9
	.word  0x8a2a6407,0x155c3b99,0xc13fc7fd,0x05d8b2b4
	.word  0xedc7662e,0x5caeeb52,0xa465d5cd,0x16370b5b
	.word  0x7be8e712,0xdb08ab58,0x48caffc3,0xfe6f93fa
	.word  0x3c1306ee,0x8b69b6c2,0x33b03264,0x670050c8
	.word  0xbdd7a056,0x59d55dde,0x3646e835,0xedb41603
	.word  0xfe539da0,0x0f7c5d4e,0xf1f24ad1,0x86059531
	.word  0x25bcd917,0xbab61f35,0xe8326149,0x36c52815
	.word  0xcf034c8d,0x9ffe30c1,0x4366db71,0xa658eed7
	.word  0xefd3302c,0x977a033e,0x5c65440a,0x7721cb49
	.word  0xadf48d00,0x3a0514f7,0xe0d032d1,0x77806040
	.word  0x704cfce8,0xac811db4,0xb5e65891,0xe2b38d53
	.word  0xd5703b70,0x709f08a2,0xeac03759,0xe86898a1
	.word  0x62f489ac,0x51cbdbfe,0xa20f16c0,0xc2356600
	.word  0x46f5fbed,0xcece7c85,0x05ae1772,0xfe36cc61
	.word  0x1351e3e2,0x40e884fc,0x1cad5deb,0xb9785b96
	.word  0x8f76bb95,0x5251170b,0xa4c0a7f3,0x6c3c73ff
	.word  0xb76861fc,0xbd4ed9fe,0x3259f90d,0xe770fcbf
	.word  0xb6e17196,0xde29d00c,0x64830bb8,0x2c4fb9ac
	.word  0xfacaaf15,0xda6235ac,0xa55d11fd,0xb27c05f4
	.word  0x9aa0e33a,0xf53f3aa6,0x8a8ae2e7,0xbcce446e
	.word  0x8acad228,0x5fe224f4,0xbbeb99b5,0xa901b8eb
	.word  0x86b3359b,0xf7ce43a7,0xb2027e8b,0x03e7af64
	.word  0x85d47d7c,0xa323b1d7,0xbfed9658,0x6770baab
	.word  0xed033ed6,0xa3c14467,0x9677cdae,0x5d48853d
	.word  0xd6fd31de,0x0b198600,0xf76effaa,0x1ce6297e
	.word  0x340eaf5c,0xbf92403d,0xa3a78ecb,0x3af1844e
	.word  0xac8440e0,0x5f42c297,0x3ae3daca,0x86ec45fd
	.word  0x9c2e8f78,0x106bed0b,0x98c02e77,0x4f960faf
	.word  0xc46c353b,0x33ad3407,0x1fbeec52,0x5d4ce2dd
	.word  0x8b95b6a5,0x14cd9e29,0x24d42c5c,0xabcff345
	.word  0x54bc237a,0x79c160e8,0x688726d1,0xf019a262
	.word  0x1b988168,0x2973b349,0xc6d6f0d4,0x0ef7076f
	.word  0x8cc5de3b,0xbc06f3b5,0x8dd63699,0xb390b0e9
	.word  0x9ecd1b15,0x144c83da,0x03f1265e,0x56dd5024
	.word  0xadea8852,0x8d262d5f,0xaf45ed76,0x4e7ef20a
	.word  0x833050f3,0x910ec50a,0x26ab3679,0xea21bfaa
	.word  0xebdcad8d,0xba40e72f,0x86063e46,0x8d055ca1
	.word  0xb81fa208,0xacd64300,0x8a7003f5,0x9ab0975b
	.word  0x236ddfe3,0x9ac73883,0xae445511,0xc0438280
	.word  0x95f6b7d8,0xe4c43739,0x3aba1325,0x7654402d
	.word  0x44dc7a3a,0x415bdd54,0x943b1436,0xb5fd865b
	.word  0x3adfb4f9,0x745947ff,0x829eed77,0xafd6e0d8
	.word  0xeb01d138,0x80ce8532,0x0d3a9d2a,0x1327f53a
	.word  0xc7e30b26,0xd932b873,0x91470454,0x4f96e7f9
	.word  0xebb8e59a,0xfcbe8199,0xb67edb1b,0x3c0e004e
	.word  0x52c63aa7,0xf2fa9074,0xa70332ff,0x15bb2754
	.word  0x0d24cf27,0xb7536697,0x8b26ec80,0x4abb779f
	.word  0x5fe778ff,0x8197c0ef,0x12419616,0xc31091e8



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

