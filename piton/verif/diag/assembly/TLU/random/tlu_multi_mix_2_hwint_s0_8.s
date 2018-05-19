// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: tlu_multi_mix_2_hwint_s0_8.s
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
   random seed:	861785888
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

	setx 0xf0ab1927d7d3333a, %g1, %g0
	setx 0x844a2ef0e6ff24da, %g1, %g1
	setx 0x09ccfd058f7362fe, %g1, %g2
	setx 0xb28ff2d4296dee3e, %g1, %g3
	setx 0x43784ea331aede33, %g1, %g4
	setx 0xb1abe5250db91dbd, %g1, %g5
	setx 0x8c02dff1ad17c966, %g1, %g6
	setx 0x2e1eb2c1378be99c, %g1, %g7
	setx 0xca1a77484f96304f, %g1, %r16
	setx 0x59c09727cc5e6118, %g1, %r17
	setx 0x69c798fa8719ee46, %g1, %r18
	setx 0x4c661f7abb35744c, %g1, %r19
	setx 0xd812ec32b7a93ae9, %g1, %r20
	setx 0xa1b094c8d912c090, %g1, %r21
	setx 0x6b73cb84ec445ae3, %g1, %r22
	setx 0xc10df06370ab1fc8, %g1, %r23
	setx 0x4774874a8400c2a1, %g1, %r24
	setx 0xb26b0ac6aa6df587, %g1, %r25
	setx 0x3e71a5121e6e1555, %g1, %r26
	setx 0x5e3d363294efa53f, %g1, %r27
	setx 0x29cd7b6873d7088e, %g1, %r28
	setx 0xc03901ad7c8bea90, %g1, %r29
	setx 0x79ce4322a207e75f, %g1, %r30
	setx 0xf4bf1654dc285695, %g1, %r31
	save
	setx 0x62dc5631dbf38935, %g1, %r16
	setx 0x49449682c657e657, %g1, %r17
	setx 0xf2083d33973429b9, %g1, %r18
	setx 0xcbc511c2d56e6b47, %g1, %r19
	setx 0xff1e242f7e9bea5c, %g1, %r20
	setx 0x28020697b7266f79, %g1, %r21
	setx 0x31a17d81c3a5700a, %g1, %r22
	setx 0x59f6bd8bc9966ef1, %g1, %r23
	setx 0xd4182e49c043dbf4, %g1, %r24
	setx 0x90103ec94bd073b3, %g1, %r25
	setx 0x5f0eff66fe9ba36b, %g1, %r26
	setx 0x9109a1755b807957, %g1, %r27
	setx 0xcbf0c5fe67786e5c, %g1, %r28
	setx 0xac759b90cac805be, %g1, %r29
	setx 0xaf8ef8d6ca3181f6, %g1, %r30
	setx 0xfb911a68fdb5b5bd, %g1, %r31
	save
	setx 0x9a07d2cb7cd75ff8, %g1, %r16
	setx 0xb185fe5a1446c260, %g1, %r17
	setx 0x287b8ffa6f6a13f7, %g1, %r18
	setx 0xe5a5ccf3682d6f11, %g1, %r19
	setx 0x7d41d73f9bed9f24, %g1, %r20
	setx 0x9049ffefdd22ca32, %g1, %r21
	setx 0x8d4ac46df0ea9361, %g1, %r22
	setx 0xd6eded8d1ba9b97d, %g1, %r23
	setx 0x5ee5eff3b487b299, %g1, %r24
	setx 0xa9fd67fc87166877, %g1, %r25
	setx 0x45d36d215f309a7e, %g1, %r26
	setx 0xea2c97076256b760, %g1, %r27
	setx 0x5a43c587bdb81a93, %g1, %r28
	setx 0x784523c4d6b0b0e7, %g1, %r29
	setx 0xe4e22e8aa59c8040, %g1, %r30
	setx 0x1036d447b95e0512, %g1, %r31
	save
	setx 0x774a5780067b569f, %g1, %r16
	setx 0x2043828cfbbc1dd2, %g1, %r17
	setx 0x2b215e3304b6ff2d, %g1, %r18
	setx 0x6886c97e63f54851, %g1, %r19
	setx 0xf0220f49aaa455e4, %g1, %r20
	setx 0x9ccaff8d68522db7, %g1, %r21
	setx 0x510123a6e8324329, %g1, %r22
	setx 0x5424a4a6d1371241, %g1, %r23
	setx 0xd8e3cc95f42a43c3, %g1, %r24
	setx 0x5972ef0911c8ab8c, %g1, %r25
	setx 0x07b97c17eb4ebd18, %g1, %r26
	setx 0xc5455b3a6af7a290, %g1, %r27
	setx 0x955dd64fdd468c89, %g1, %r28
	setx 0x4753f9750e299d78, %g1, %r29
	setx 0xa612c7dcb79884ad, %g1, %r30
	setx 0x27ada3f2aba002b0, %g1, %r31
	save
	setx 0x6ec57a90a0a9c16f, %g1, %r16
	setx 0x8654a99c8935c05d, %g1, %r17
	setx 0x68295ce6b6afcc8e, %g1, %r18
	setx 0xd5e330cdb493f17c, %g1, %r19
	setx 0xf61f55c340f48524, %g1, %r20
	setx 0xf6d0df1707862ffa, %g1, %r21
	setx 0x6dd7f06a59baf311, %g1, %r22
	setx 0xb8d49d92f1489a4c, %g1, %r23
	setx 0xd30bd15984b4d839, %g1, %r24
	setx 0x268b5e63df4aebf7, %g1, %r25
	setx 0xa48b94d168eff5cc, %g1, %r26
	setx 0x450a11795e982270, %g1, %r27
	setx 0x2e1c788e74253601, %g1, %r28
	setx 0xe9cb2c279d202a93, %g1, %r29
	setx 0xc53d44dfe9e1fcbc, %g1, %r30
	setx 0xb8ef8e70fdd3d516, %g1, %r31
	save
	setx 0x702bb17d70b003bf, %g1, %r16
	setx 0xd213199338e95ab2, %g1, %r17
	setx 0x51c54e5faf54f861, %g1, %r18
	setx 0x845d333961ee40a9, %g1, %r19
	setx 0x3dddaa9b2ea1d415, %g1, %r20
	setx 0x8d0edc9f937abfd2, %g1, %r21
	setx 0x13fb6a95f89d9f9d, %g1, %r22
	setx 0x087b867445327ed2, %g1, %r23
	setx 0x90fc0dd26967bebe, %g1, %r24
	setx 0x6455aafac60c9057, %g1, %r25
	setx 0x21db34a679c3eef6, %g1, %r26
	setx 0xf8669061f25c2c00, %g1, %r27
	setx 0x5bf8fc9ab143fe05, %g1, %r28
	setx 0x1f3e114424b10f98, %g1, %r29
	setx 0xa94496dee34eb9bd, %g1, %r30
	setx 0x7e47cad6dcad372f, %g1, %r31
	save
	setx 0x2c345b868d2b6471, %g1, %r16
	setx 0xd75803a208fe096d, %g1, %r17
	setx 0xe50f5439da7ec85b, %g1, %r18
	setx 0x32d991c6af56b08c, %g1, %r19
	setx 0x78568eda6bd08fdb, %g1, %r20
	setx 0x9d9e31defb7df192, %g1, %r21
	setx 0x28956e45a7895390, %g1, %r22
	setx 0x371b69ad024e6da4, %g1, %r23
	setx 0x55d337deb3638971, %g1, %r24
	setx 0x71bf6cbbdced96fd, %g1, %r25
	setx 0xc896b9041f21f2df, %g1, %r26
	setx 0x1a2876daf20d5ae7, %g1, %r27
	setx 0xe1cc2152bbfbcef8, %g1, %r28
	setx 0xa6882f3a65229fcb, %g1, %r29
	setx 0x2003aa60b7ddae06, %g1, %r30
	setx 0x7540076138fd93ec, %g1, %r31
	save
	setx 0xe8986e7261bf0a95, %g1, %r16
	setx 0xca01a41cc0a2d194, %g1, %r17
	setx 0x1727f23238cdfbbe, %g1, %r18
	setx 0xa60f3c1a39d6b687, %g1, %r19
	setx 0x98f3da0a4a07e37b, %g1, %r20
	setx 0x28b6b6b43b2976b9, %g1, %r21
	setx 0xb98e30279681aff7, %g1, %r22
	setx 0xb895f1dd42fe80bf, %g1, %r23
	setx 0x374f8731e08777c9, %g1, %r24
	setx 0x071529685ed025c1, %g1, %r25
	setx 0x4d9502e1e991128c, %g1, %r26
	setx 0x3e3f7efaa696d577, %g1, %r27
	setx 0x11ac05f8491f83d9, %g1, %r28
	setx 0x2ab0e34bd7577353, %g1, %r29
	setx 0xdf7078b1a8f5dc62, %g1, %r30
	setx 0x3124fa59e9acbd8e, %g1, %r31
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
	.word 0xb7e5e129  ! 1: SAVE_I	save	%r23, 0x0001, %r27
	setx	data_start_3, %g1, %r19
	setx	data_start_5, %g1, %r21
	.word 0xbbe52082  ! 9: SAVE_I	save	%r20, 0x0001, %r29
hwintr_0_0:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_0), 16, 16)) -> intp(0, 0, b)
	mov	2, %r12
	.word 0x8f930000  ! 17: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xb9e4e146  ! 21: SAVE_I	save	%r19, 0x0001, %r28
	.word 0xb4a5c000  ! 23: SUBcc_R	subcc 	%r23, %r0, %r26
	.word 0xbfe5e0c3  ! 25: SAVE_I	save	%r23, 0x0001, %r31
	.word 0x8394e0af  ! 28: WRPR_TNPC_I	wrpr	%r19, 0x00af, %tnpc
	.word 0xb5e4618c  ! 29: SAVE_I	save	%r17, 0x0001, %r26
	.word 0xba154000  ! 32: OR_R	or 	%r21, %r0, %r29
	mov	2, %r12
	.word 0x8f930000  ! 35: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xb351c000  ! 37: RDPR_TL	<illegal instruction>
hwintr_0_1:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_1), 16, 16)) -> intp(0, 0, f)
	.word 0xb3e42172  ! 46: SAVE_I	save	%r16, 0x0001, %r25
	.word 0xbfe4e083  ! 47: SAVE_I	save	%r19, 0x0001, %r31
	.word 0xbbe4e17d  ! 48: SAVE_I	save	%r19, 0x0001, %r29
hwintr_0_2:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_2), 16, 16)) -> intp(0, 0, 26)
	.word 0xb7e5a005  ! 51: SAVE_I	save	%r22, 0x0001, %r27
	.word 0xbbe420b7  ! 52: SAVE_I	save	%r16, 0x0001, %r29
	.word 0xb1e56067  ! 53: SAVE_I	save	%r21, 0x0001, %r24
hwintr_0_3:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_3), 16, 16)) -> intp(0, 0, 2d)
	.word 0x8d95608b  ! 57: WRPR_PSTATE_I	wrpr	%r21, 0x008b, %pstate
	.word 0xb5480000  ! 60: RDHPR_HPSTATE	rdhpr	%hpstate, %r26
	setx	data_start_4, %g1, %r22
hwintr_0_4:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_4), 16, 16)) -> intp(0, 0, 30)
	.word 0xb335c000  ! 69: SRL_R	srl 	%r23, %r0, %r25
	.word 0xb1e4a1c5  ! 71: SAVE_I	save	%r18, 0x0001, %r24
	.word 0xbfe460f1  ! 72: SAVE_I	save	%r17, 0x0001, %r31
	.word 0xb1e520f6  ! 73: SAVE_I	save	%r20, 0x0001, %r24
	setx	0x821ba32600001d9d, %g1, %r10
	.word 0x839a8000  ! 74: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	setx	data_start_0, %g1, %r22
	.word 0xb9e52106  ! 76: SAVE_I	save	%r20, 0x0001, %r28
hwintr_0_5:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_5), 16, 16)) -> intp(0, 0, 31)
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0x9194e1a9  ! 82: WRPR_PIL_I	wrpr	%r19, 0x01a9, %pil
	.word 0xbbe52167  ! 84: SAVE_I	save	%r20, 0x0001, %r29
	setx	data_start_1, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xbfe4a09e  ! 89: SAVE_I	save	%r18, 0x0001, %r31
	.word 0x8594e04f  ! 91: WRPR_TSTATE_I	wrpr	%r19, 0x004f, %tstate
	setx	0xecd8d8c000008d89, %g1, %r10
	.word 0x839a8000  ! 93: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb8a5a14c  ! 96: SUBcc_I	subcc 	%r22, 0x014c, %r28
	.word 0xbde42001  ! 97: SAVE_I	save	%r16, 0x0001, %r30
	.word 0xb6c5211a  ! 102: ADDCcc_I	addccc 	%r20, 0x011a, %r27
	.word 0xb9e4e040  ! 103: SAVE_I	save	%r19, 0x0001, %r28
	.word 0xb5508000  ! 105: RDPR_TSTATE	<illegal instruction>
	.word 0xb4bd0000  ! 110: XNORcc_R	xnorcc 	%r20, %r0, %r26
hwintr_0_6:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_6), 16, 16)) -> intp(0, 0, 13)
	.word 0xb52cc000  ! 114: SLL_R	sll 	%r19, %r0, %r26
	.word 0x81952137  ! 116: WRPR_TPC_I	wrpr	%r20, 0x0137, %tpc
	.word 0xb7e4a0f0  ! 122: SAVE_I	save	%r18, 0x0001, %r27
	.word 0x85956055  ! 123: WRPR_TSTATE_I	wrpr	%r21, 0x0055, %tstate
	.word 0xba2561d2  ! 125: SUB_I	sub 	%r21, 0x01d2, %r29
	mov	0, %r12
	.word 0x8f930000  ! 126: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xbbe5a1a7  ! 128: SAVE_I	save	%r22, 0x0001, %r29
	.word 0xb5e461fa  ! 129: SAVE_I	save	%r17, 0x0001, %r26
	.word 0xb6bda13f  ! 131: XNORcc_I	xnorcc 	%r22, 0x013f, %r27
hwintr_0_7:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_7), 16, 16)) -> intp(0, 0, 1b)
hwintr_0_8:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_8), 16, 16)) -> intp(0, 0, 3d)
	.word 0xb294e00e  ! 137: ORcc_I	orcc 	%r19, 0x000e, %r25
	.word 0xb2b46079  ! 138: ORNcc_I	orncc 	%r17, 0x0079, %r25
	.word 0xbd520000  ! 141: RDPR_PIL	<illegal instruction>
	.word 0xb7e4200f  ! 143: SAVE_I	save	%r16, 0x0001, %r27
	.word 0xbd520000  ! 144: RDPR_PIL	<illegal instruction>
	.word 0xbfe5a133  ! 146: SAVE_I	save	%r22, 0x0001, %r31
	.word 0xb3e4a07f  ! 154: SAVE_I	save	%r18, 0x0001, %r25
hwintr_0_9:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_9), 16, 16)) -> intp(0, 0, 1b)
hwintr_0_10:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_10), 16, 16)) -> intp(0, 0, 9)
	.word 0xbbe460e9  ! 161: SAVE_I	save	%r17, 0x0001, %r29
	mov	2, %r12
	.word 0xa1930000  ! 162: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb9e560f1  ! 165: SAVE_I	save	%r21, 0x0001, %r28
	.word 0xbfe5e181  ! 166: SAVE_I	save	%r23, 0x0001, %r31
	.word 0xb9e5a1d6  ! 170: SAVE_I	save	%r22, 0x0001, %r28
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb9e4616a  ! 175: SAVE_I	save	%r17, 0x0001, %r28
	.word 0xbfe52099  ! 177: SAVE_I	save	%r20, 0x0001, %r31
	.word 0xbab5616c  ! 178: SUBCcc_I	orncc 	%r21, 0x016c, %r29
	.word 0xb9e4e105  ! 179: SAVE_I	save	%r19, 0x0001, %r28
	mov	0, %r12
	.word 0x8f930000  ! 182: WRPR_TL_R	wrpr	%r12, %r0, %tl
	setx	0x7a1ea4c40000abdd, %g1, %r10
	.word 0x819a8000  ! 186: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	setx	data_start_3, %g1, %r22
	.word 0xbb504000  ! 193: RDPR_TNPC	<illegal instruction>
	.word 0xb9480000  ! 196: RDHPR_HPSTATE	rdhpr	%hpstate, %r28
	.word 0xbe8c8000  ! 197: ANDcc_R	andcc 	%r18, %r0, %r31
	.word 0xbb518000  ! 198: RDPR_PSTATE	<illegal instruction>
	.word 0xbbe56117  ! 200: SAVE_I	save	%r21, 0x0001, %r29
	.word 0xbe9c0000  ! 201: XORcc_R	xorcc 	%r16, %r0, %r31
	setx	data_start_4, %g1, %r22
hwintr_0_11:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_11), 16, 16)) -> intp(0, 0, 31)
	.word 0xb1e56150  ! 207: SAVE_I	save	%r21, 0x0001, %r24
	.word 0xbb510000  ! 208: RDPR_TICK	<illegal instruction>
	.word 0x8d95a1a0  ! 210: WRPR_PSTATE_I	wrpr	%r22, 0x01a0, %pstate
	.word 0xb5e5619d  ! 211: SAVE_I	save	%r21, 0x0001, %r26
	.word 0xb5e42160  ! 213: SAVE_I	save	%r16, 0x0001, %r26
	.word 0xbf508000  ! 214: RDPR_TSTATE	<illegal instruction>
	.word 0xb5643801  ! 215: MOVcc_I	<illegal instruction>
	.word 0xb5e5e17b  ! 217: SAVE_I	save	%r23, 0x0001, %r26
	.word 0xbe150000  ! 225: OR_R	or 	%r20, %r0, %r31
	.word 0xbd518000  ! 226: RDPR_PSTATE	<illegal instruction>
	.word 0xb7e4e004  ! 227: SAVE_I	save	%r19, 0x0001, %r27
	.word 0x8194e177  ! 228: WRPR_TPC_I	wrpr	%r19, 0x0177, %tpc
	.word 0xb9e420e4  ! 229: SAVE_I	save	%r16, 0x0001, %r28
	.word 0xb1e56170  ! 232: SAVE_I	save	%r21, 0x0001, %r24
	.word 0xb9e56072  ! 235: SAVE_I	save	%r21, 0x0001, %r28
	.word 0xb5e460f0  ! 236: SAVE_I	save	%r17, 0x0001, %r26
	.word 0xbf500000  ! 237: RDPR_TPC	<illegal instruction>
	.word 0xbfe5e02c  ! 241: SAVE_I	save	%r23, 0x0001, %r31
	.word 0xbde5a1d0  ! 242: SAVE_I	save	%r22, 0x0001, %r30
	.word 0xbbe52183  ! 243: SAVE_I	save	%r20, 0x0001, %r29
	.word 0xb23c2143  ! 249: XNOR_I	xnor 	%r16, 0x0143, %r25
	.word 0xb3e4a0f8  ! 250: SAVE_I	save	%r18, 0x0001, %r25
	.word 0x9195a124  ! 253: WRPR_PIL_I	wrpr	%r22, 0x0124, %pil
	.word 0xb5e4a08e  ! 256: SAVE_I	save	%r18, 0x0001, %r26
	setx	data_start_3, %g1, %r22
	.word 0xb735b001  ! 261: SRLX_I	srlx	%r22, 0x0001, %r27
hwintr_0_12:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_12), 16, 16)) -> intp(0, 0, 27)
hwintr_0_13:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_13), 16, 16)) -> intp(0, 0, 29)
	mov	0, %r12
	.word 0xa1930000  ! 266: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb550c000  ! 271: RDPR_TT	<illegal instruction>
	.word 0x8d95e093  ! 275: WRPR_PSTATE_I	wrpr	%r23, 0x0093, %pstate
	.word 0xbfe42083  ! 276: SAVE_I	save	%r16, 0x0001, %r31
	.word 0xb5e4a0ef  ! 277: SAVE_I	save	%r18, 0x0001, %r26
	.word 0xb7355000  ! 278: SRLX_R	srlx	%r21, %r0, %r27
	.word 0xb3e5610f  ! 282: SAVE_I	save	%r21, 0x0001, %r25
	.word 0xbfe4613b  ! 283: SAVE_I	save	%r17, 0x0001, %r31
	.word 0xb9e42189  ! 289: SAVE_I	save	%r16, 0x0001, %r28
hwintr_0_14:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_14), 16, 16)) -> intp(0, 0, 31)
	.word 0xbd518000  ! 299: RDPR_PSTATE	<illegal instruction>
	.word 0xbfe521a7  ! 301: SAVE_I	save	%r20, 0x0001, %r31
hwintr_0_15:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_15), 16, 16)) -> intp(0, 0, 37)
	.word 0xbe0d6153  ! 303: AND_I	and 	%r21, 0x0153, %r31
	.word 0xb5e56054  ! 306: SAVE_I	save	%r21, 0x0001, %r26
	.word 0xb72c8000  ! 307: SLL_R	sll 	%r18, %r0, %r27
hwintr_0_16:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_16), 16, 16)) -> intp(0, 0, 2f)
	.word 0xb3500000  ! 313: RDPR_TPC	<illegal instruction>
	.word 0xbc1d0000  ! 314: XOR_R	xor 	%r20, %r0, %r30
	.word 0xb1e4e1ea  ! 321: SAVE_I	save	%r19, 0x0001, %r24
	.word 0x839561be  ! 322: WRPR_TNPC_I	wrpr	%r21, 0x01be, %tnpc
	.word 0xb5e561e7  ! 325: SAVE_I	save	%r21, 0x0001, %r26
	.word 0xbbe4a0c1  ! 328: SAVE_I	save	%r18, 0x0001, %r29
	.word 0xbde42031  ! 332: SAVE_I	save	%r16, 0x0001, %r30
	.word 0xbf51c000  ! 334: RDPR_TL	<illegal instruction>
	.word 0x839460f6  ! 335: WRPR_TNPC_I	wrpr	%r17, 0x00f6, %tnpc
hwintr_0_17:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_17), 16, 16)) -> intp(0, 0, 2f)
	.word 0xb5e46176  ! 342: SAVE_I	save	%r17, 0x0001, %r26
	.word 0xb7e46005  ! 343: SAVE_I	save	%r17, 0x0001, %r27
hwintr_0_18:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_18), 16, 16)) -> intp(0, 0, 1e)
	.word 0xbbe561fc  ! 349: SAVE_I	save	%r21, 0x0001, %r29
	.word 0xb1e461d1  ! 350: SAVE_I	save	%r17, 0x0001, %r24
	.word 0xbb540000  ! 352: RDPR_GL	<illegal instruction>
	.word 0xbb520000  ! 355: RDPR_PIL	<illegal instruction>
	.word 0xb3e560ee  ! 356: SAVE_I	save	%r21, 0x0001, %r25
	.word 0xb5e5e1dc  ! 357: SAVE_I	save	%r23, 0x0001, %r26
	.word 0xbcc5a139  ! 359: ADDCcc_I	addccc 	%r22, 0x0139, %r30
	.word 0x859460d7  ! 361: WRPR_TSTATE_I	wrpr	%r17, 0x00d7, %tstate
	.word 0xb7518000  ! 362: RDPR_PSTATE	<illegal instruction>
	mov	0, %r12
	.word 0x8f930000  ! 366: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xb1e42194  ! 368: SAVE_I	save	%r16, 0x0001, %r24
	.word 0xbbe4609c  ! 369: SAVE_I	save	%r17, 0x0001, %r29
	.word 0xb1e46145  ! 376: SAVE_I	save	%r17, 0x0001, %r24
	.word 0xbd518000  ! 377: RDPR_PSTATE	<illegal instruction>
	.word 0xb5e5a0a7  ! 378: SAVE_I	save	%r22, 0x0001, %r26
	.word 0xb1e42186  ! 381: SAVE_I	save	%r16, 0x0001, %r24
	.word 0xbd540000  ! 384: RDPR_GL	<illegal instruction>
	.word 0xb5e461f2  ! 388: SAVE_I	save	%r17, 0x0001, %r26
	.word 0x8d94e158  ! 389: WRPR_PSTATE_I	wrpr	%r19, 0x0158, %pstate
	.word 0xb5480000  ! 396: RDHPR_HPSTATE	rdhpr	%hpstate, %r26
hwintr_0_19:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_19), 16, 16)) -> intp(0, 0, e)
	.word 0xb950c000  ! 401: RDPR_TT	<illegal instruction>
hwintr_0_20:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_20), 16, 16)) -> intp(0, 0, 3a)
	.word 0xb9510000  ! 407: RDPR_TICK	<illegal instruction>
	.word 0xbe444000  ! 409: ADDC_R	addc 	%r17, %r0, %r31
	.word 0xb5e460d2  ! 420: SAVE_I	save	%r17, 0x0001, %r26
	.word 0x9194a110  ! 421: WRPR_PIL_I	wrpr	%r18, 0x0110, %pil
	.word 0x8195a1fc  ! 423: WRPR_TPC_I	wrpr	%r22, 0x01fc, %tpc
	.word 0xb5e56043  ! 424: SAVE_I	save	%r21, 0x0001, %r26
	.word 0xbf480000  ! 430: RDHPR_HPSTATE	rdhpr	%hpstate, %r31
	.word 0x899520ec  ! 434: WRPR_TICK_I	wrpr	%r20, 0x00ec, %tick
	.word 0xbbe420eb  ! 438: SAVE_I	save	%r16, 0x0001, %r29
	.word 0xbde4a002  ! 439: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xb5e520f4  ! 440: SAVE_I	save	%r20, 0x0001, %r26
	.word 0xbb51c000  ! 446: RDPR_TL	<illegal instruction>
	.word 0xb9e4a129  ! 447: SAVE_I	save	%r18, 0x0001, %r28
	.word 0xb1e420ad  ! 448: SAVE_I	save	%r16, 0x0001, %r24
	.word 0xb3e4a05c  ! 451: SAVE_I	save	%r18, 0x0001, %r25
	.word 0xb7e52180  ! 452: SAVE_I	save	%r20, 0x0001, %r27
	.word 0xbf508000  ! 454: RDPR_TSTATE	<illegal instruction>
hwintr_0_21:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_21), 16, 16)) -> intp(0, 0, 20)
	.word 0xb1e4a169  ! 461: SAVE_I	save	%r18, 0x0001, %r24
	.word 0xb1510000  ! 462: RDPR_TICK	<illegal instruction>
	.word 0xbde5a134  ! 463: SAVE_I	save	%r22, 0x0001, %r30
	.word 0xbead200d  ! 466: ANDNcc_I	andncc 	%r20, 0x000d, %r31
	.word 0xb950c000  ! 469: RDPR_TT	<illegal instruction>
	.word 0xbbe52164  ! 470: SAVE_I	save	%r20, 0x0001, %r29
	.word 0xbb345000  ! 471: SRLX_R	srlx	%r17, %r0, %r29
	.word 0xbfe5e117  ! 473: SAVE_I	save	%r23, 0x0001, %r31
	.word 0xbe3da0d3  ! 474: XNOR_I	xnor 	%r22, 0x00d3, %r31
	.word 0xb3518000  ! 475: RDPR_PSTATE	<illegal instruction>
	.word 0xbeb4a0f9  ! 479: ORNcc_I	orncc 	%r18, 0x00f9, %r31
	.word 0xb3e5a0e0  ! 480: SAVE_I	save	%r22, 0x0001, %r25
	.word 0xbfe4e1c6  ! 481: SAVE_I	save	%r19, 0x0001, %r31
	setx	0x96cd398600007956, %g1, %r10
	.word 0x839a8000  ! 482: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb7e5e0ca  ! 483: SAVE_I	save	%r23, 0x0001, %r27
	.word 0xb3518000  ! 485: RDPR_PSTATE	<illegal instruction>
	.word 0xbfe5e078  ! 492: SAVE_I	save	%r23, 0x0001, %r31
	.word 0x8d94e07b  ! 493: WRPR_PSTATE_I	wrpr	%r19, 0x007b, %pstate
hwintr_0_22:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_22), 16, 16)) -> intp(0, 0, b)
	.word 0xbfe5a168  ! 497: SAVE_I	save	%r22, 0x0001, %r31
	.word 0xb534c000  ! 499: SRL_R	srl 	%r19, %r0, %r26
	.word 0xbde4a027  ! 500: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xbf508000  ! 501: RDPR_TSTATE	<illegal instruction>
	.word 0xb9500000  ! 502: RDPR_TPC	<illegal instruction>
	.word 0xbbe4a06b  ! 507: SAVE_I	save	%r18, 0x0001, %r29
	.word 0x839520ef  ! 508: WRPR_TNPC_I	wrpr	%r20, 0x00ef, %tnpc
hwintr_0_23:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_23), 16, 16)) -> intp(0, 0, 9)
	.word 0xb9e5e1a3  ! 510: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xbbe460b1  ! 512: SAVE_I	save	%r17, 0x0001, %r29
hwintr_0_24:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_24), 16, 16)) -> intp(0, 0, 35)
	.word 0xb9e56081  ! 519: SAVE_I	save	%r21, 0x0001, %r28
	mov	0, %r12
	.word 0x8f930000  ! 521: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xbbe560e0  ! 523: SAVE_I	save	%r21, 0x0001, %r29
	.word 0xb5e520bb  ! 524: SAVE_I	save	%r20, 0x0001, %r26
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
hwintr_0_25:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_25), 16, 16)) -> intp(0, 0, 3f)
	setx	0x7b77489d00000c8f, %g1, %r10
	.word 0x839a8000  ! 530: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
hwintr_0_26:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_26), 16, 16)) -> intp(0, 0, 17)
	.word 0xb7e4e02f  ! 534: SAVE_I	save	%r19, 0x0001, %r27
	setx	0xea80141a0000ed49, %g1, %r10
	.word 0x839a8000  ! 539: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xbd500000  ! 542: RDPR_TPC	<illegal instruction>
	.word 0x8394e1a9  ! 543: WRPR_TNPC_I	wrpr	%r19, 0x01a9, %tnpc
	.word 0xb351c000  ! 544: RDPR_TL	<illegal instruction>
	.word 0xb7540000  ! 547: RDPR_GL	<illegal instruction>
	.word 0xb3e5601c  ! 549: SAVE_I	save	%r21, 0x0001, %r25
	setx	data_start_7, %g1, %r19
	setx	data_start_4, %g1, %r18
	.word 0xb9518000  ! 557: RDPR_PSTATE	<illegal instruction>
hwintr_0_27:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_27), 16, 16)) -> intp(0, 0, 31)
	.word 0xbf50c000  ! 561: RDPR_TT	<illegal instruction>
	.word 0xb3e5e089  ! 562: SAVE_I	save	%r23, 0x0001, %r25
	.word 0xb3e520c6  ! 565: SAVE_I	save	%r20, 0x0001, %r25
	.word 0xb3354000  ! 568: SRL_R	srl 	%r21, %r0, %r25
	.word 0xb7e461b2  ! 569: SAVE_I	save	%r17, 0x0001, %r27
	.word 0xb7e4613b  ! 573: SAVE_I	save	%r17, 0x0001, %r27
	.word 0xb0b48000  ! 574: ORNcc_R	orncc 	%r18, %r0, %r24
	.word 0xbbe4a12a  ! 575: SAVE_I	save	%r18, 0x0001, %r29
	setx	0x34c100fa0000fa40, %g1, %r10
	.word 0x819a8000  ! 577: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xb9345000  ! 579: SRLX_R	srlx	%r17, %r0, %r28
	.word 0xb84460c8  ! 585: ADDC_I	addc 	%r17, 0x00c8, %r28
	.word 0xb9500000  ! 593: RDPR_TPC	<illegal instruction>
	setx	data_start_2, %g1, %r20
	.word 0xbbe56160  ! 595: SAVE_I	save	%r21, 0x0001, %r29
	.word 0x81942081  ! 596: WRPR_TPC_I	wrpr	%r16, 0x0081, %tpc
	.word 0xb3e460bb  ! 597: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xbbe42011  ! 598: SAVE_I	save	%r16, 0x0001, %r29
	.word 0xb9e5a10a  ! 601: SAVE_I	save	%r22, 0x0001, %r28
	.word 0xb5350000  ! 602: SRL_R	srl 	%r20, %r0, %r26
	.word 0xb7510000  ! 603: RDPR_TICK	<illegal instruction>
	.word 0xbbe52063  ! 604: SAVE_I	save	%r20, 0x0001, %r29
	.word 0x8994a0fd  ! 605: WRPR_TICK_I	wrpr	%r18, 0x00fd, %tick
	mov	2, %r12
	.word 0x8f930000  ! 606: WRPR_TL_R	wrpr	%r12, %r0, %tl
hwintr_0_28:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_28), 16, 16)) -> intp(0, 0, 2c)
	.word 0xb1e420c9  ! 613: SAVE_I	save	%r16, 0x0001, %r24
	.word 0xb9e5e156  ! 616: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xb7e4a0b0  ! 618: SAVE_I	save	%r18, 0x0001, %r27
	.word 0x8195e182  ! 621: WRPR_TPC_I	wrpr	%r23, 0x0182, %tpc
	.word 0xb1e4e0e9  ! 622: SAVE_I	save	%r19, 0x0001, %r24
	.word 0xba1d8000  ! 623: XOR_R	xor 	%r22, %r0, %r29
	.word 0xb0158000  ! 625: OR_R	or 	%r22, %r0, %r24
	.word 0xb3348000  ! 626: SRL_R	srl 	%r18, %r0, %r25
	.word 0xbfe4a17d  ! 627: SAVE_I	save	%r18, 0x0001, %r31
	.word 0xbfe5a11d  ! 629: SAVE_I	save	%r22, 0x0001, %r31
	.word 0xb7520000  ! 630: RDPR_PIL	<illegal instruction>
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbd480000  ! 634: RDHPR_HPSTATE	rdhpr	%hpstate, %r30
	.word 0xbc254000  ! 635: SUB_R	sub 	%r21, %r0, %r30
	.word 0x83956096  ! 636: WRPR_TNPC_I	wrpr	%r21, 0x0096, %tnpc
	.word 0xbb342001  ! 637: SRL_I	srl 	%r16, 0x0001, %r29
hwintr_0_29:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_29), 16, 16)) -> intp(0, 0, d)
	.word 0x8394e1e9  ! 645: WRPR_TNPC_I	wrpr	%r19, 0x01e9, %tnpc
	setx	data_start_5, %g1, %r17
	.word 0xb9e5e021  ! 652: SAVE_I	save	%r23, 0x0001, %r28
hwintr_0_30:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_30), 16, 16)) -> intp(0, 0, 3d)
hwintr_0_31:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_31), 16, 16)) -> intp(0, 0, 2c)
	setx	data_start_5, %g1, %r20
	.word 0x83946054  ! 659: WRPR_TNPC_I	wrpr	%r17, 0x0054, %tnpc
	.word 0xb551c000  ! 661: RDPR_TL	<illegal instruction>
	.word 0x8194206b  ! 662: WRPR_TPC_I	wrpr	%r16, 0x006b, %tpc
	.word 0xb9e4e187  ! 664: SAVE_I	save	%r19, 0x0001, %r28
	.word 0x8794a1c8  ! 666: WRPR_TT_I	wrpr	%r18, 0x01c8, %tt
	mov	2, %r12
	.word 0xa1930000  ! 667: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xbbe56021  ! 669: SAVE_I	save	%r21, 0x0001, %r29
	.word 0xbfe46069  ! 675: SAVE_I	save	%r17, 0x0001, %r31
	.word 0xb3508000  ! 677: RDPR_TSTATE	<illegal instruction>
	.word 0xb1e52150  ! 678: SAVE_I	save	%r20, 0x0001, %r24
hwintr_0_32:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_32), 16, 16)) -> intp(0, 0, f)
	.word 0xbbe4a140  ! 682: SAVE_I	save	%r18, 0x0001, %r29
	.word 0xb8b4c000  ! 684: ORNcc_R	orncc 	%r19, %r0, %r28
hwintr_0_33:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_33), 16, 16)) -> intp(0, 0, 18)
hwintr_0_34:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_34), 16, 16)) -> intp(0, 0, 6)
	.word 0xb1e560fb  ! 689: SAVE_I	save	%r21, 0x0001, %r24
	.word 0xbfe52021  ! 691: SAVE_I	save	%r20, 0x0001, %r31
	.word 0xb5518000  ! 693: RDPR_PSTATE	<illegal instruction>
	.word 0xb1e52190  ! 694: SAVE_I	save	%r20, 0x0001, %r24
	.word 0xb1e42152  ! 696: SAVE_I	save	%r16, 0x0001, %r24
hwintr_0_35:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_35), 16, 16)) -> intp(0, 0, 36)
	.word 0xb1e5e0cc  ! 703: SAVE_I	save	%r23, 0x0001, %r24
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbde42188  ! 707: SAVE_I	save	%r16, 0x0001, %r30
	.word 0xbe34a077  ! 708: ORN_I	orn 	%r18, 0x0077, %r31
	.word 0xbde4e019  ! 710: SAVE_I	save	%r19, 0x0001, %r30
	.word 0xbcbc61ab  ! 711: XNORcc_I	xnorcc 	%r17, 0x01ab, %r30
	mov	1, %r12
	.word 0xa1930000  ! 712: WRPR_GL_R	wrpr	%r12, %r0, %-
	mov	0, %r12
	.word 0xa1930000  ! 713: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0x8d94a165  ! 716: WRPR_PSTATE_I	wrpr	%r18, 0x0165, %pstate
	.word 0xb150c000  ! 717: RDPR_TT	<illegal instruction>
	.word 0xb9e5e19b  ! 718: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xbfe4e1de  ! 720: SAVE_I	save	%r19, 0x0001, %r31
	.word 0xbb510000  ! 724: RDPR_TICK	<illegal instruction>
	.word 0xb52c2001  ! 728: SLL_I	sll 	%r16, 0x0001, %r26
	.word 0xb9e4215f  ! 732: SAVE_I	save	%r16, 0x0001, %r28
	.word 0xb1e46033  ! 734: SAVE_I	save	%r17, 0x0001, %r24
	.word 0xb3e5a1bb  ! 738: SAVE_I	save	%r22, 0x0001, %r25
	setx	data_start_6, %g1, %r19
	.word 0xbab56124  ! 741: SUBCcc_I	orncc 	%r21, 0x0124, %r29
	.word 0x8194a1cb  ! 742: WRPR_TPC_I	wrpr	%r18, 0x01cb, %tpc
hwintr_0_36:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_36), 16, 16)) -> intp(0, 0, 25)
	setx	data_start_6, %g1, %r18
	.word 0xbfe421e7  ! 754: SAVE_I	save	%r16, 0x0001, %r31
	.word 0xbfe4e179  ! 757: SAVE_I	save	%r19, 0x0001, %r31
	.word 0xb9e5e1cd  ! 762: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xbf518000  ! 763: RDPR_PSTATE	<illegal instruction>
	.word 0x859421d6  ! 770: WRPR_TSTATE_I	wrpr	%r16, 0x01d6, %tstate
	mov	2, %r12
	.word 0xa1930000  ! 772: WRPR_GL_R	wrpr	%r12, %r0, %-
hwintr_0_37:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_37), 16, 16)) -> intp(0, 0, 3d)
	.word 0xbb508000  ! 778: RDPR_TSTATE	<illegal instruction>
hwintr_0_38:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_38), 16, 16)) -> intp(0, 0, 3e)
	.word 0x8d94e09f  ! 783: WRPR_PSTATE_I	wrpr	%r19, 0x009f, %pstate
	.word 0xb9500000  ! 789: RDPR_TPC	<illegal instruction>
	.word 0xb13cd000  ! 793: SRAX_R	srax	%r19, %r0, %r24
	.word 0xb7e52122  ! 796: SAVE_I	save	%r20, 0x0001, %r27
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb3e560f1  ! 801: SAVE_I	save	%r21, 0x0001, %r25
	.word 0xbbe46164  ! 802: SAVE_I	save	%r17, 0x0001, %r29
	.word 0xb8054000  ! 804: ADD_R	add 	%r21, %r0, %r28
	.word 0xb1e4e1d4  ! 807: SAVE_I	save	%r19, 0x0001, %r24
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb9e52015  ! 810: SAVE_I	save	%r20, 0x0001, %r28
	.word 0xb0240000  ! 812: SUB_R	sub 	%r16, %r0, %r24
	mov	1, %r12
	.word 0xa1930000  ! 814: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xbfe4a18b  ! 817: SAVE_I	save	%r18, 0x0001, %r31
hwintr_0_39:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_39), 16, 16)) -> intp(0, 0, 24)
	.word 0xb7e42161  ! 820: SAVE_I	save	%r16, 0x0001, %r27
	.word 0xb7e52034  ! 823: SAVE_I	save	%r20, 0x0001, %r27
	setx	0xdc3477d40000eb1f, %g1, %r10
	.word 0x839a8000  ! 824: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb3e521ad  ! 825: SAVE_I	save	%r20, 0x0001, %r25
	.word 0xbb510000  ! 829: RDPR_TICK	<illegal instruction>
	.word 0xbde4e01e  ! 831: SAVE_I	save	%r19, 0x0001, %r30
	.word 0xb0448000  ! 834: ADDC_R	addc 	%r18, %r0, %r24
	.word 0x819561fe  ! 837: WRPR_TPC_I	wrpr	%r21, 0x01fe, %tpc
	.word 0xb9500000  ! 843: RDPR_TPC	<illegal instruction>
	.word 0xbfe4605c  ! 845: SAVE_I	save	%r17, 0x0001, %r31
	.word 0xbfe561d1  ! 846: SAVE_I	save	%r21, 0x0001, %r31
hwintr_0_40:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_40), 16, 16)) -> intp(0, 0, 2a)
	.word 0x91946185  ! 850: WRPR_PIL_I	wrpr	%r17, 0x0185, %pil
	.word 0xbfe56155  ! 854: SAVE_I	save	%r21, 0x0001, %r31
	.word 0xb9e560e0  ! 855: SAVE_I	save	%r21, 0x0001, %r28
	.word 0xbbe4a16b  ! 856: SAVE_I	save	%r18, 0x0001, %r29
	.word 0x839461d9  ! 857: WRPR_TNPC_I	wrpr	%r17, 0x01d9, %tnpc
	.word 0x8d94a03e  ! 858: WRPR_PSTATE_I	wrpr	%r18, 0x003e, %pstate
	.word 0xbc9c4000  ! 859: XORcc_R	xorcc 	%r17, %r0, %r30
	.word 0xbd480000  ! 862: RDHPR_HPSTATE	rdhpr	%hpstate, %r30
	setx	0x20a55dd600009a81, %g1, %r10
	.word 0x819a8000  ! 867: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0x8995a1c9  ! 868: WRPR_TICK_I	wrpr	%r22, 0x01c9, %tick
	.word 0xb7e5a198  ! 869: SAVE_I	save	%r22, 0x0001, %r27
	mov	2, %r12
	.word 0xa1930000  ! 874: WRPR_GL_R	wrpr	%r12, %r0, %-
	setx	data_start_1, %g1, %r17
	mov	0, %r12
	.word 0xa1930000  ! 877: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0x9195a0a2  ! 878: WRPR_PIL_I	wrpr	%r22, 0x00a2, %pil
hwintr_0_41:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_41), 16, 16)) -> intp(0, 0, 1)
	.word 0xb7e4e1f4  ! 885: SAVE_I	save	%r19, 0x0001, %r27
	.word 0xb9e52168  ! 886: SAVE_I	save	%r20, 0x0001, %r28
	.word 0xbfe4a104  ! 890: SAVE_I	save	%r18, 0x0001, %r31
	.word 0xb7e4614e  ! 893: SAVE_I	save	%r17, 0x0001, %r27
hwintr_0_42:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_42), 16, 16)) -> intp(0, 0, 27)
	.word 0xb9e5a1e3  ! 902: SAVE_I	save	%r22, 0x0001, %r28
	.word 0xb3e421af  ! 903: SAVE_I	save	%r16, 0x0001, %r25
	.word 0xb0056113  ! 904: ADD_I	add 	%r21, 0x0113, %r24
	.word 0xb5e4e009  ! 907: SAVE_I	save	%r19, 0x0001, %r26
hwintr_0_43:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_43), 16, 16)) -> intp(0, 0, 18)
	.word 0xbb540000  ! 909: RDPR_GL	<illegal instruction>
	.word 0xb7e4e13e  ! 911: SAVE_I	save	%r19, 0x0001, %r27
	.word 0xbfe421fc  ! 912: SAVE_I	save	%r16, 0x0001, %r31
	.word 0xb5e460a7  ! 913: SAVE_I	save	%r17, 0x0001, %r26
	.word 0x87946054  ! 914: WRPR_TT_I	wrpr	%r17, 0x0054, %tt
	.word 0xbbe5a0e0  ! 919: SAVE_I	save	%r22, 0x0001, %r29
	.word 0xbfe5a0e7  ! 922: SAVE_I	save	%r22, 0x0001, %r31
	.word 0xbd508000  ! 923: RDPR_TSTATE	<illegal instruction>
	.word 0x87956139  ! 924: WRPR_TT_I	wrpr	%r21, 0x0139, %tt
	.word 0xb1e4a1c0  ! 926: SAVE_I	save	%r18, 0x0001, %r24
hwintr_0_44:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_44), 16, 16)) -> intp(0, 0, 1f)
	.word 0xb1e5a0c0  ! 928: SAVE_I	save	%r22, 0x0001, %r24
	setx	data_start_5, %g1, %r23
	.word 0x9195211c  ! 931: WRPR_PIL_I	wrpr	%r20, 0x011c, %pil
	.word 0x819461eb  ! 935: WRPR_TPC_I	wrpr	%r17, 0x01eb, %tpc
	.word 0xbde560cf  ! 936: SAVE_I	save	%r21, 0x0001, %r30
	.word 0xbd500000  ! 938: RDPR_TPC	<illegal instruction>
	.word 0xb53cc000  ! 940: SRA_R	sra 	%r19, %r0, %r26
	.word 0xbbe5e0b1  ! 941: SAVE_I	save	%r23, 0x0001, %r29
	.word 0xbfe5a0f8  ! 943: SAVE_I	save	%r22, 0x0001, %r31
	.word 0x8794613e  ! 946: WRPR_TT_I	wrpr	%r17, 0x013e, %tt
	.word 0x8d94212e  ! 947: WRPR_PSTATE_I	wrpr	%r16, 0x012e, %pstate
	.word 0xb1e5210d  ! 948: SAVE_I	save	%r20, 0x0001, %r24
	setx	data_start_0, %g1, %r20
	.word 0xb5e460b8  ! 953: SAVE_I	save	%r17, 0x0001, %r26
	.word 0xb7e5a05a  ! 954: SAVE_I	save	%r22, 0x0001, %r27
	.word 0xb2258000  ! 959: SUB_R	sub 	%r22, %r0, %r25
	.word 0xbd518000  ! 961: RDPR_PSTATE	<illegal instruction>
	.word 0xbbe42042  ! 962: SAVE_I	save	%r16, 0x0001, %r29
	.word 0xb0054000  ! 963: ADD_R	add 	%r21, %r0, %r24
	.word 0x9195216f  ! 965: WRPR_PIL_I	wrpr	%r20, 0x016f, %pil
	.word 0xb1520000  ! 966: RDPR_PIL	<illegal instruction>
	.word 0xbde4a151  ! 968: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xbde5a0c5  ! 969: SAVE_I	save	%r22, 0x0001, %r30
	mov	1, %r12
	.word 0xa1930000  ! 971: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb9e4a0aa  ! 973: SAVE_I	save	%r18, 0x0001, %r28
	.word 0xb1e52139  ! 976: SAVE_I	save	%r20, 0x0001, %r24
	.word 0x8d956091  ! 980: WRPR_PSTATE_I	wrpr	%r21, 0x0091, %pstate
	.word 0xb3e561a9  ! 981: SAVE_I	save	%r21, 0x0001, %r25
	.word 0xb5e4a0b2  ! 986: SAVE_I	save	%r18, 0x0001, %r26
	.word 0xb9e561fb  ! 990: SAVE_I	save	%r21, 0x0001, %r28
	.word 0xbfe4e1ef  ! 991: SAVE_I	save	%r19, 0x0001, %r31
	setx	0x506e33f30000cbc8, %g1, %r10
	.word 0x839a8000  ! 992: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb3e46123  ! 993: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xb9520000  ! 995: RDPR_PIL	<illegal instruction>
	.word 0xbfe4a01b  ! 997: SAVE_I	save	%r18, 0x0001, %r31
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
	.word 0xf83c0000  ! 5: STD_R	std	%r28, [%r16 + %r0]
	setx	data_start_3, %g1, %r21
	setx	data_start_2, %g1, %r17
hwintr_3_0:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_0), 16, 16)) -> intp(3, 0, 7)
	.word 0xf424a142  ! 12: STW_I	stw	%r26, [%r18 + 0x0142]
	.word 0xfd3d0000  ! 15: STDF_R	std	%f30, [%r0, %r20]
	mov	2, %r12
	.word 0x8f930000  ! 17: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xf6344000  ! 19: STH_R	sth	%r27, [%r17 + %r0]
	.word 0xfa2da167  ! 20: STB_I	stb	%r29, [%r22 + 0x0167]
	.word 0xbea48000  ! 23: SUBcc_R	subcc 	%r18, %r0, %r31
	.word 0xfc2d4000  ! 24: STB_R	stb	%r30, [%r21 + %r0]
	.word 0xfa254000  ! 26: STW_R	stw	%r29, [%r21 + %r0]
	.word 0x8394e043  ! 28: WRPR_TNPC_I	wrpr	%r19, 0x0043, %tnpc
	.word 0xf074c000  ! 30: STX_R	stx	%r24, [%r19 + %r0]
	.word 0xb4154000  ! 32: OR_R	or 	%r21, %r0, %r26
	mov	1, %r12
	.word 0x8f930000  ! 35: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xf2248000  ! 36: STW_R	stw	%r25, [%r18 + %r0]
	.word 0xb551c000  ! 37: RDPR_TL	rdpr	%tl, %r26
hwintr_3_1:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_1), 16, 16)) -> intp(3, 0, 0)
	.word 0xf2350000  ! 44: STH_R	sth	%r25, [%r20 + %r0]
	.word 0xf63d0000  ! 45: STD_R	std	%r27, [%r20 + %r0]
hwintr_3_2:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_2), 16, 16)) -> intp(3, 0, 1f)
hwintr_3_3:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_3), 16, 16)) -> intp(3, 0, 18)
	.word 0x8d95209d  ! 57: WRPR_PSTATE_I	wrpr	%r20, 0x009d, %pstate
	.word 0xf235e179  ! 59: STH_I	sth	%r25, [%r23 + 0x0179]
	.word 0xb3480000  ! 60: RDHPR_HPSTATE	rdhpr	%hpstate, %r25
	.word 0xf424e0aa  ! 61: STW_I	stw	%r26, [%r19 + 0x00aa]
	setx	data_start_5, %g1, %r17
hwintr_3_4:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_4), 16, 16)) -> intp(3, 0, 21)
	.word 0xbf358000  ! 69: SRL_R	srl 	%r22, %r0, %r31
	setx	0x7611e14e0000ca8d, %g1, %r10
	.word 0x839a8000  ! 74: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	setx	data_start_4, %g1, %r23
hwintr_3_5:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_5), 16, 16)) -> intp(3, 0, 24)
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xf2354000  ! 81: STH_R	sth	%r25, [%r21 + %r0]
	.word 0x9194a1bf  ! 82: WRPR_PIL_I	wrpr	%r18, 0x01bf, %pil
	setx	data_start_1, %g1, %r21
	.word 0xf8744000  ! 86: STX_R	stx	%r28, [%r17 + %r0]
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0x8594a132  ! 91: WRPR_TSTATE_I	wrpr	%r18, 0x0132, %tstate
	setx	0x6b396500000f1c, %g1, %r10
	.word 0x839a8000  ! 93: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xbca56186  ! 96: SUBcc_I	subcc 	%r21, 0x0186, %r30
	.word 0xb8c4e1e5  ! 102: ADDCcc_I	addccc 	%r19, 0x01e5, %r28
	.word 0xb3508000  ! 105: RDPR_TSTATE	rdpr	%tstate, %r25
	.word 0xb4bcc000  ! 110: XNORcc_R	xnorcc 	%r19, %r0, %r26
hwintr_3_6:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_6), 16, 16)) -> intp(3, 0, 22)
	.word 0xb32cc000  ! 114: SLL_R	sll 	%r19, %r0, %r25
	.word 0x81942144  ! 116: WRPR_TPC_I	wrpr	%r16, 0x0144, %tpc
	.word 0xf4740000  ! 118: STX_R	stx	%r26, [%r16 + %r0]
	.word 0xf93cc000  ! 120: STDF_R	std	%f28, [%r0, %r19]
	.word 0x8595a188  ! 123: WRPR_TSTATE_I	wrpr	%r22, 0x0188, %tstate
	.word 0xfc2dc000  ! 124: STB_R	stb	%r30, [%r23 + %r0]
	.word 0xb02460ff  ! 125: SUB_I	sub 	%r17, 0x00ff, %r24
	mov	2, %r12
	.word 0x8f930000  ! 126: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xfc34a194  ! 127: STH_I	sth	%r30, [%r18 + 0x0194]
	.word 0xb4bde197  ! 131: XNORcc_I	xnorcc 	%r23, 0x0197, %r26
	.word 0xfc2561d7  ! 132: STW_I	stw	%r30, [%r21 + 0x01d7]
hwintr_3_7:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_7), 16, 16)) -> intp(3, 0, 6)
hwintr_3_8:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_8), 16, 16)) -> intp(3, 0, 35)
	.word 0xb295e17f  ! 137: ORcc_I	orcc 	%r23, 0x017f, %r25
	.word 0xbab46103  ! 138: ORNcc_I	orncc 	%r17, 0x0103, %r29
	.word 0xfa34c000  ! 139: STH_R	sth	%r29, [%r19 + %r0]
	.word 0xf8744000  ! 140: STX_R	stx	%r28, [%r17 + %r0]
	.word 0xb7520000  ! 141: RDPR_PIL	rdpr	%pil, %r27
	.word 0xb5520000  ! 144: RDPR_PIL	<illegal instruction>
	.word 0xfa754000  ! 145: STX_R	stx	%r29, [%r21 + %r0]
	.word 0xf73dc000  ! 147: STDF_R	std	%f27, [%r0, %r23]
	.word 0xf43ce1b6  ! 148: STD_I	std	%r26, [%r19 + 0x01b6]
	.word 0xf0352056  ! 149: STH_I	sth	%r24, [%r20 + 0x0056]
	.word 0xf2356046  ! 150: STH_I	sth	%r25, [%r21 + 0x0046]
	.word 0xfe25a149  ! 156: STW_I	stw	%r31, [%r22 + 0x0149]
hwintr_3_9:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_9), 16, 16)) -> intp(3, 0, 3f)
hwintr_3_10:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_10), 16, 16)) -> intp(3, 0, 1e)
	mov	1, %r12
	.word 0xa1930000  ! 162: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xf6744000  ! 169: STX_R	stx	%r27, [%r17 + %r0]
	.word 0xf73d0000  ! 171: STDF_R	std	%f27, [%r0, %r20]
	.word 0xf23da0fd  ! 172: STD_I	std	%r25, [%r22 + 0x00fd]
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xfa254000  ! 174: STW_R	stw	%r29, [%r21 + %r0]
	.word 0xfb3d0000  ! 176: STDF_R	std	%f29, [%r0, %r20]
	.word 0xb0b461b7  ! 178: SUBCcc_I	orncc 	%r17, 0x01b7, %r24
	mov	2, %r12
	.word 0x8f930000  ! 182: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xfe2d4000  ! 183: STB_R	stb	%r31, [%r21 + %r0]
	setx	0x3db96d4000001b96, %g1, %r10
	.word 0x819a8000  ! 186: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	setx	data_start_1, %g1, %r16
	.word 0xf6758000  ! 191: STX_R	stx	%r27, [%r22 + %r0]
	.word 0xb5504000  ! 193: RDPR_TNPC	rdpr	%tnpc, %r26
	.word 0xbb480000  ! 196: RDHPR_HPSTATE	rdhpr	%hpstate, %r29
	.word 0xb88c8000  ! 197: ANDcc_R	andcc 	%r18, %r0, %r28
	.word 0xbf518000  ! 198: RDPR_PSTATE	<illegal instruction>
	.word 0xf024c000  ! 199: STW_R	stw	%r24, [%r19 + %r0]
	.word 0xbe9d0000  ! 201: XORcc_R	xorcc 	%r20, %r0, %r31
	setx	data_start_1, %g1, %r21
hwintr_3_11:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_11), 16, 16)) -> intp(3, 0, 11)
	.word 0xb7510000  ! 208: RDPR_TICK	<illegal instruction>
	.word 0xf075e1a5  ! 209: STX_I	stx	%r24, [%r23 + 0x01a5]
	.word 0x8d9521f9  ! 210: WRPR_PSTATE_I	wrpr	%r20, 0x01f9, %pstate
	.word 0xfe2421ef  ! 212: STW_I	stw	%r31, [%r16 + 0x01ef]
	.word 0xb3508000  ! 214: RDPR_TSTATE	rdpr	%tstate, %r25
	.word 0xb3643801  ! 215: MOVcc_I	<illegal instruction>
	.word 0xb215c000  ! 225: OR_R	or 	%r23, %r0, %r25
	.word 0xb9518000  ! 226: RDPR_PSTATE	<illegal instruction>
	.word 0x8194e1fa  ! 228: WRPR_TPC_I	wrpr	%r19, 0x01fa, %tpc
	.word 0xb3500000  ! 237: RDPR_TPC	rdpr	%tpc, %r25
	.word 0xfe2ce073  ! 238: STB_I	stb	%r31, [%r19 + 0x0073]
	.word 0xb23c61af  ! 249: XNOR_I	xnor 	%r17, 0x01af, %r25
	.word 0xf02c21bd  ! 251: STB_I	stb	%r24, [%r16 + 0x01bd]
	.word 0xf0352013  ! 252: STH_I	sth	%r24, [%r20 + 0x0013]
	.word 0x919460a1  ! 253: WRPR_PIL_I	wrpr	%r17, 0x00a1, %pil
	setx	data_start_5, %g1, %r17
	.word 0xf034c000  ! 258: STH_R	sth	%r24, [%r19 + %r0]
	.word 0xfa344000  ! 259: STH_R	sth	%r29, [%r17 + %r0]
	.word 0xbd35b001  ! 261: SRLX_I	srlx	%r22, 0x0001, %r30
hwintr_3_12:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_12), 16, 16)) -> intp(3, 0, 19)
	.word 0xf42da11c  ! 263: STB_I	stb	%r26, [%r22 + 0x011c]
hwintr_3_13:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_13), 16, 16)) -> intp(3, 0, 8)
	mov	1, %r12
	.word 0xa1930000  ! 266: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb750c000  ! 271: RDPR_TT	rdpr	%tt, %r27
	.word 0xf83ce1a9  ! 272: STD_I	std	%r28, [%r19 + 0x01a9]
	.word 0xf6748000  ! 274: STX_R	stx	%r27, [%r18 + %r0]
	.word 0x8d946155  ! 275: WRPR_PSTATE_I	wrpr	%r17, 0x0155, %pstate
	.word 0xb1359000  ! 278: SRLX_R	srlx	%r22, %r0, %r24
	.word 0xf53c6131  ! 286: STDF_I	std	%f26, [0x0131, %r17]
	.word 0xfa3ce0a9  ! 287: STD_I	std	%r29, [%r19 + 0x00a9]
hwintr_3_14:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_14), 16, 16)) -> intp(3, 0, 6)
	.word 0xfc3c8000  ! 296: STD_R	std	%r30, [%r18 + %r0]
	.word 0xb1518000  ! 299: RDPR_PSTATE	rdpr	%pstate, %r24
hwintr_3_15:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_15), 16, 16)) -> intp(3, 0, 2d)
	.word 0xbe0ce0e1  ! 303: AND_I	and 	%r19, 0x00e1, %r31
	.word 0xf22da1e2  ! 305: STB_I	stb	%r25, [%r22 + 0x01e2]
	.word 0xb92dc000  ! 307: SLL_R	sll 	%r23, %r0, %r28
hwintr_3_16:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_16), 16, 16)) -> intp(3, 0, 3d)
	.word 0xf13d4000  ! 311: STDF_R	std	%f24, [%r0, %r21]
	.word 0xbb500000  ! 313: RDPR_TPC	<illegal instruction>
	.word 0xb81c4000  ! 314: XOR_R	xor 	%r17, %r0, %r28
	.word 0x8394a0e3  ! 322: WRPR_TNPC_I	wrpr	%r18, 0x00e3, %tnpc
	.word 0xf874a03a  ! 323: STX_I	stx	%r28, [%r18 + 0x003a]
	.word 0xfb3c8000  ! 324: STDF_R	std	%f29, [%r0, %r18]
	.word 0xfc758000  ! 327: STX_R	stx	%r30, [%r22 + %r0]
	.word 0xfa74615c  ! 333: STX_I	stx	%r29, [%r17 + 0x015c]
	.word 0xb151c000  ! 334: RDPR_TL	rdpr	%tl, %r24
	.word 0x83952156  ! 335: WRPR_TNPC_I	wrpr	%r20, 0x0156, %tnpc
	.word 0xfe2c8000  ! 338: STB_R	stb	%r31, [%r18 + %r0]
	.word 0xf02ca0e2  ! 339: STB_I	stb	%r24, [%r18 + 0x00e2]
hwintr_3_17:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_17), 16, 16)) -> intp(3, 0, 1f)
	.word 0xf4748000  ! 344: STX_R	stx	%r26, [%r18 + %r0]
hwintr_3_18:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_18), 16, 16)) -> intp(3, 0, 3f)
	.word 0xf07561cf  ! 351: STX_I	stx	%r24, [%r21 + 0x01cf]
	.word 0xb3540000  ! 352: RDPR_GL	rdpr	%-, %r25
	.word 0xf83cc000  ! 354: STD_R	std	%r28, [%r19 + %r0]
	.word 0xb7520000  ! 355: RDPR_PIL	<illegal instruction>
	.word 0xbcc46138  ! 359: ADDCcc_I	addccc 	%r17, 0x0138, %r30
	.word 0x8594e122  ! 361: WRPR_TSTATE_I	wrpr	%r19, 0x0122, %tstate
	.word 0xb1518000  ! 362: RDPR_PSTATE	rdpr	%pstate, %r24
	.word 0xfe248000  ! 364: STW_R	stw	%r31, [%r18 + %r0]
	mov	2, %r12
	.word 0x8f930000  ! 366: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xfa3cc000  ! 367: STD_R	std	%r29, [%r19 + %r0]
	.word 0xf8244000  ! 372: STW_R	stw	%r28, [%r17 + %r0]
	.word 0xfc2de108  ! 374: STB_I	stb	%r30, [%r23 + 0x0108]
	.word 0xb1518000  ! 377: RDPR_PSTATE	rdpr	%pstate, %r24
	.word 0xb7540000  ! 384: RDPR_GL	<illegal instruction>
	.word 0xf6248000  ! 386: STW_R	stw	%r27, [%r18 + %r0]
	.word 0x8d95e1b9  ! 389: WRPR_PSTATE_I	wrpr	%r23, 0x01b9, %pstate
	.word 0xf43d619c  ! 390: STD_I	std	%r26, [%r21 + 0x019c]
	.word 0xfe344000  ! 395: STH_R	sth	%r31, [%r17 + %r0]
	.word 0xbd480000  ! 396: RDHPR_HPSTATE	rdhpr	%hpstate, %r30
hwintr_3_19:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_19), 16, 16)) -> intp(3, 0, 24)
	.word 0xf0348000  ! 399: STH_R	sth	%r24, [%r18 + %r0]
	.word 0xb150c000  ! 401: RDPR_TT	<illegal instruction>
hwintr_3_20:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_20), 16, 16)) -> intp(3, 0, 3e)
	.word 0xf53cc000  ! 403: STDF_R	std	%f26, [%r0, %r19]
	.word 0xbd510000  ! 407: RDPR_TICK	<illegal instruction>
	.word 0xb6450000  ! 409: ADDC_R	addc 	%r20, %r0, %r27
	.word 0xf07420d9  ! 413: STX_I	stx	%r24, [%r16 + 0x00d9]
	.word 0xf635a01a  ! 414: STH_I	sth	%r27, [%r22 + 0x001a]
	.word 0x9195a195  ! 421: WRPR_PIL_I	wrpr	%r22, 0x0195, %pil
	.word 0x8194a184  ! 423: WRPR_TPC_I	wrpr	%r18, 0x0184, %tpc
	.word 0xf62c0000  ! 425: STB_R	stb	%r27, [%r16 + %r0]
	.word 0xf83da108  ! 427: STD_I	std	%r28, [%r22 + 0x0108]
	.word 0xfe74e0aa  ! 429: STX_I	stx	%r31, [%r19 + 0x00aa]
	.word 0xbf480000  ! 430: RDHPR_HPSTATE	rdhpr	%hpstate, %r31
	.word 0xfc3c601d  ! 432: STD_I	std	%r30, [%r17 + 0x001d]
	.word 0x8995a009  ! 434: WRPR_TICK_I	wrpr	%r22, 0x0009, %tick
	.word 0xf43d8000  ! 442: STD_R	std	%r26, [%r22 + %r0]
	.word 0xfa2ce1c6  ! 443: STB_I	stb	%r29, [%r19 + 0x01c6]
	.word 0xf6348000  ! 445: STH_R	sth	%r27, [%r18 + %r0]
	.word 0xb951c000  ! 446: RDPR_TL	rdpr	%tl, %r28
	.word 0xf824c000  ! 449: STW_R	stw	%r28, [%r19 + %r0]
	.word 0xfa35a1be  ! 453: STH_I	sth	%r29, [%r22 + 0x01be]
	.word 0xb9508000  ! 454: RDPR_TSTATE	<illegal instruction>
hwintr_3_21:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_21), 16, 16)) -> intp(3, 0, e)
	.word 0xfb3d6010  ! 458: STDF_I	std	%f29, [0x0010, %r21]
	.word 0xbf510000  ! 462: RDPR_TICK	<illegal instruction>
	.word 0xb0ada1f7  ! 466: ANDNcc_I	andncc 	%r22, 0x01f7, %r24
	.word 0xfc348000  ! 467: STH_R	sth	%r30, [%r18 + %r0]
	.word 0xf22de04f  ! 468: STB_I	stb	%r25, [%r23 + 0x004f]
	.word 0xb950c000  ! 469: RDPR_TT	<illegal instruction>
	.word 0xbb345000  ! 471: SRLX_R	srlx	%r17, %r0, %r29
	.word 0xb23da086  ! 474: XNOR_I	xnor 	%r22, 0x0086, %r25
	.word 0xb7518000  ! 475: RDPR_PSTATE	<illegal instruction>
	.word 0xb8b4600c  ! 479: ORNcc_I	orncc 	%r17, 0x000c, %r28
	setx	0xbcd974720000a807, %g1, %r10
	.word 0x839a8000  ! 482: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb1518000  ! 485: RDPR_PSTATE	rdpr	%pstate, %r24
	.word 0xf83de066  ! 486: STD_I	std	%r28, [%r23 + 0x0066]
	.word 0xf074c000  ! 490: STX_R	stx	%r24, [%r19 + %r0]
	.word 0x8d94a0e8  ! 493: WRPR_PSTATE_I	wrpr	%r18, 0x00e8, %pstate
hwintr_3_22:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_22), 16, 16)) -> intp(3, 0, 37)
	.word 0xb735c000  ! 499: SRL_R	srl 	%r23, %r0, %r27
	.word 0xbb508000  ! 501: RDPR_TSTATE	rdpr	%tstate, %r29
	.word 0xbd500000  ! 502: RDPR_TPC	<illegal instruction>
	.word 0xf875618a  ! 504: STX_I	stx	%r28, [%r21 + 0x018a]
	.word 0x83956166  ! 508: WRPR_TNPC_I	wrpr	%r21, 0x0166, %tnpc
hwintr_3_23:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_23), 16, 16)) -> intp(3, 0, 13)
	.word 0xf53d8000  ! 511: STDF_R	std	%f26, [%r0, %r22]
hwintr_3_24:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_24), 16, 16)) -> intp(3, 0, 1)
	.word 0xfe3420ad  ! 518: STH_I	sth	%r31, [%r16 + 0x00ad]
	.word 0xf73d8000  ! 520: STDF_R	std	%f27, [%r0, %r22]
	mov	1, %r12
	.word 0x8f930000  ! 521: WRPR_TL_R	wrpr	%r12, %r0, %tl
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
hwintr_3_25:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_25), 16, 16)) -> intp(3, 0, 2b)
	setx	0x8c0cb13a00007adf, %g1, %r10
	.word 0x839a8000  ! 530: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
hwintr_3_26:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_26), 16, 16)) -> intp(3, 0, e)
	.word 0xf8344000  ! 538: STH_R	sth	%r28, [%r17 + %r0]
	setx	0x9cc3ea2f00007d9f, %g1, %r10
	.word 0x839a8000  ! 539: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xbb500000  ! 542: RDPR_TPC	rdpr	%tpc, %r29
	.word 0x83956061  ! 543: WRPR_TNPC_I	wrpr	%r21, 0x0061, %tnpc
	.word 0xb951c000  ! 544: RDPR_TL	rdpr	%tl, %r28
	.word 0xfe74602a  ! 545: STX_I	stx	%r31, [%r17 + 0x002a]
	.word 0xf474a111  ! 546: STX_I	stx	%r26, [%r18 + 0x0111]
	.word 0xbf540000  ! 547: RDPR_GL	<illegal instruction>
	.word 0xf074c000  ! 548: STX_R	stx	%r24, [%r19 + %r0]
	setx	data_start_0, %g1, %r20
	.word 0xf73ca194  ! 554: STDF_I	std	%f27, [0x0194, %r18]
	setx	data_start_5, %g1, %r21
	.word 0xb3518000  ! 557: RDPR_PSTATE	<illegal instruction>
hwintr_3_27:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_27), 16, 16)) -> intp(3, 0, 36)
	.word 0xfb3c4000  ! 560: STDF_R	std	%f29, [%r0, %r17]
	.word 0xbb50c000  ! 561: RDPR_TT	<illegal instruction>
	.word 0xb535c000  ! 568: SRL_R	srl 	%r23, %r0, %r26
	.word 0xf43c8000  ! 572: STD_R	std	%r26, [%r18 + %r0]
	.word 0xb2b5c000  ! 574: ORNcc_R	orncc 	%r23, %r0, %r25
	setx	0xf289c58b0000d856, %g1, %r10
	.word 0x819a8000  ! 577: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xb7341000  ! 579: SRLX_R	srlx	%r16, %r0, %r27
	.word 0xf03461b9  ! 580: STH_I	sth	%r24, [%r17 + 0x01b9]
	.word 0xf02d0000  ! 581: STB_R	stb	%r24, [%r20 + %r0]
	.word 0xf13d8000  ! 584: STDF_R	std	%f24, [%r0, %r22]
	.word 0xb2452045  ! 585: ADDC_I	addc 	%r20, 0x0045, %r25
	.word 0xf03c6046  ! 588: STD_I	std	%r24, [%r17 + 0x0046]
	.word 0xfc34c000  ! 589: STH_R	sth	%r30, [%r19 + %r0]
	.word 0xfa75e1de  ! 592: STX_I	stx	%r29, [%r23 + 0x01de]
	.word 0xb7500000  ! 593: RDPR_TPC	rdpr	%tpc, %r27
	setx	data_start_4, %g1, %r17
	.word 0x81956145  ! 596: WRPR_TPC_I	wrpr	%r21, 0x0145, %tpc
	.word 0xbd340000  ! 602: SRL_R	srl 	%r16, %r0, %r30
	.word 0xbd510000  ! 603: RDPR_TICK	rdpr	%tick, %r30
	.word 0x89946189  ! 605: WRPR_TICK_I	wrpr	%r17, 0x0189, %tick
	mov	0, %r12
	.word 0x8f930000  ! 606: WRPR_TL_R	wrpr	%r12, %r0, %tl
hwintr_3_28:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_28), 16, 16)) -> intp(3, 0, 2e)
	.word 0xf83c0000  ! 609: STD_R	std	%r28, [%r16 + %r0]
	.word 0xf234e1a1  ! 611: STH_I	sth	%r25, [%r19 + 0x01a1]
	.word 0xfa2cc000  ! 614: STB_R	stb	%r29, [%r19 + %r0]
	.word 0xf53dc000  ! 615: STDF_R	std	%f26, [%r0, %r23]
	.word 0xfe2d4000  ! 617: STB_R	stb	%r31, [%r21 + %r0]
	.word 0x8194a1f4  ! 621: WRPR_TPC_I	wrpr	%r18, 0x01f4, %tpc
	.word 0xbe1dc000  ! 623: XOR_R	xor 	%r23, %r0, %r31
	.word 0xb614c000  ! 625: OR_R	or 	%r19, %r0, %r27
	.word 0xbf348000  ! 626: SRL_R	srl 	%r18, %r0, %r31
	.word 0xb1520000  ! 630: RDPR_PIL	rdpr	%pil, %r24
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb9480000  ! 634: RDHPR_HPSTATE	rdhpr	%hpstate, %r28
	.word 0xbe240000  ! 635: SUB_R	sub 	%r16, %r0, %r31
	.word 0x8394e08f  ! 636: WRPR_TNPC_I	wrpr	%r19, 0x008f, %tnpc
	.word 0xbb346001  ! 637: SRL_I	srl 	%r17, 0x0001, %r29
	.word 0xf02ce132  ! 640: STB_I	stb	%r24, [%r19 + 0x0132]
	.word 0xf82521a6  ! 641: STW_I	stw	%r28, [%r20 + 0x01a6]
hwintr_3_29:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_29), 16, 16)) -> intp(3, 0, 1b)
	.word 0x83942146  ! 645: WRPR_TNPC_I	wrpr	%r16, 0x0146, %tnpc
	setx	data_start_2, %g1, %r23
hwintr_3_30:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_30), 16, 16)) -> intp(3, 0, 35)
hwintr_3_31:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_31), 16, 16)) -> intp(3, 0, 39)
	setx	data_start_1, %g1, %r16
	.word 0x839560cb  ! 659: WRPR_TNPC_I	wrpr	%r21, 0x00cb, %tnpc
	.word 0xf034a09a  ! 660: STH_I	sth	%r24, [%r18 + 0x009a]
	.word 0xb951c000  ! 661: RDPR_TL	rdpr	%tl, %r28
	.word 0x8194616e  ! 662: WRPR_TPC_I	wrpr	%r17, 0x016e, %tpc
	.word 0x8795e10d  ! 666: WRPR_TT_I	wrpr	%r23, 0x010d, %tt
	mov	1, %r12
	.word 0xa1930000  ! 667: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xf22de0dc  ! 668: STB_I	stb	%r25, [%r23 + 0x00dc]
	.word 0xf234a02b  ! 671: STH_I	sth	%r25, [%r18 + 0x002b]
	.word 0xfb3d0000  ! 673: STDF_R	std	%f29, [%r0, %r20]
	.word 0xf635605c  ! 674: STH_I	sth	%r27, [%r21 + 0x005c]
	.word 0xbf508000  ! 677: RDPR_TSTATE	rdpr	%tstate, %r31
	.word 0xfe2d8000  ! 680: STB_R	stb	%r31, [%r22 + %r0]
hwintr_3_32:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_32), 16, 16)) -> intp(3, 0, a)
	.word 0xf23d0000  ! 683: STD_R	std	%r25, [%r20 + %r0]
	.word 0xb6b44000  ! 684: ORNcc_R	orncc 	%r17, %r0, %r27
hwintr_3_33:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_33), 16, 16)) -> intp(3, 0, 27)
	.word 0xfc340000  ! 686: STH_R	sth	%r30, [%r16 + %r0]
hwintr_3_34:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_34), 16, 16)) -> intp(3, 0, 35)
	.word 0xf22d605c  ! 688: STB_I	stb	%r25, [%r21 + 0x005c]
	.word 0xb9518000  ! 693: RDPR_PSTATE	<illegal instruction>
	.word 0xf2740000  ! 695: STX_R	stx	%r25, [%r16 + %r0]
	.word 0xf53c0000  ! 698: STDF_R	std	%f26, [%r0, %r16]
hwintr_3_35:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_35), 16, 16)) -> intp(3, 0, 23)
	.word 0xf424c000  ! 704: STW_R	stw	%r26, [%r19 + %r0]
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xfc348000  ! 706: STH_R	sth	%r30, [%r18 + %r0]
	.word 0xbc346026  ! 708: ORN_I	orn 	%r17, 0x0026, %r30
	.word 0xbebca1be  ! 711: XNORcc_I	xnorcc 	%r18, 0x01be, %r31
	mov	1, %r12
	.word 0xa1930000  ! 712: WRPR_GL_R	wrpr	%r12, %r0, %-
	mov	1, %r12
	.word 0xa1930000  ! 713: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0x8d94e023  ! 716: WRPR_PSTATE_I	wrpr	%r19, 0x0023, %pstate
	.word 0xb950c000  ! 717: RDPR_TT	rdpr	%tt, %r28
	.word 0xb9510000  ! 724: RDPR_TICK	<illegal instruction>
	.word 0xb92c2001  ! 728: SLL_I	sll 	%r16, 0x0001, %r28
	.word 0xfb3c61dc  ! 733: STDF_I	std	%f29, [0x01dc, %r17]
	.word 0xff3de1dd  ! 736: STDF_I	std	%f31, [0x01dd, %r23]
	.word 0xfa742121  ! 737: STX_I	stx	%r29, [%r16 + 0x0121]
	.word 0xfc3c8000  ! 739: STD_R	std	%r30, [%r18 + %r0]
	setx	data_start_2, %g1, %r20
	.word 0xbab4e023  ! 741: SUBCcc_I	orncc 	%r19, 0x0023, %r29
	.word 0x8195e164  ! 742: WRPR_TPC_I	wrpr	%r23, 0x0164, %tpc
hwintr_3_36:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_36), 16, 16)) -> intp(3, 0, f)
	.word 0xfa75c000  ! 751: STX_R	stx	%r29, [%r23 + %r0]
	setx	data_start_0, %g1, %r17
	.word 0xb7518000  ! 763: RDPR_PSTATE	rdpr	%pstate, %r27
	.word 0xf075a10e  ! 764: STX_I	stx	%r24, [%r22 + 0x010e]
	.word 0xf424c000  ! 767: STW_R	stw	%r26, [%r19 + %r0]
	.word 0xf02cc000  ! 768: STB_R	stb	%r24, [%r19 + %r0]
	.word 0xf67421e9  ! 769: STX_I	stx	%r27, [%r16 + 0x01e9]
	.word 0x8594a1b6  ! 770: WRPR_TSTATE_I	wrpr	%r18, 0x01b6, %tstate
	mov	2, %r12
	.word 0xa1930000  ! 772: WRPR_GL_R	wrpr	%r12, %r0, %-
hwintr_3_37:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_37), 16, 16)) -> intp(3, 0, 1a)
	.word 0xb5508000  ! 778: RDPR_TSTATE	rdpr	%tstate, %r26
hwintr_3_38:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_38), 16, 16)) -> intp(3, 0, 23)
	.word 0x8d94a0d9  ! 783: WRPR_PSTATE_I	wrpr	%r18, 0x00d9, %pstate
	.word 0xb1500000  ! 789: RDPR_TPC	rdpr	%tpc, %r24
	.word 0xf62d8000  ! 790: STB_R	stb	%r27, [%r22 + %r0]
	.word 0xb93cd000  ! 793: SRAX_R	srax	%r19, %r0, %r28
	.word 0xf2242140  ! 794: STW_I	stw	%r25, [%r16 + 0x0140]
	.word 0xfa3c8000  ! 795: STD_R	std	%r29, [%r18 + %r0]
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xfa254000  ! 803: STW_R	stw	%r29, [%r21 + %r0]
	.word 0xb2044000  ! 804: ADD_R	add 	%r17, %r0, %r25
	.word 0xf82ca0ed  ! 805: STB_I	stb	%r28, [%r18 + 0x00ed]
	.word 0xf03d207c  ! 808: STD_I	std	%r24, [%r20 + 0x007c]
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbe258000  ! 812: SUB_R	sub 	%r22, %r0, %r31
	mov	2, %r12
	.word 0xa1930000  ! 814: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xfc24e159  ! 815: STW_I	stw	%r30, [%r19 + 0x0159]
	.word 0xfc3c0000  ! 818: STD_R	std	%r30, [%r16 + %r0]
hwintr_3_39:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_39), 16, 16)) -> intp(3, 0, f)
	setx	0x81db2ecc0000ead8, %g1, %r10
	.word 0x839a8000  ! 824: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xf224617e  ! 827: STW_I	stw	%r25, [%r17 + 0x017e]
	.word 0xfc3460f1  ! 828: STH_I	sth	%r30, [%r17 + 0x00f1]
	.word 0xb5510000  ! 829: RDPR_TICK	rdpr	%tick, %r26
	.word 0xf83d60a4  ! 833: STD_I	std	%r28, [%r21 + 0x00a4]
	.word 0xba45c000  ! 834: ADDC_R	addc 	%r23, %r0, %r29
	.word 0xf93d8000  ! 836: STDF_R	std	%f28, [%r0, %r22]
	.word 0x8195a03c  ! 837: WRPR_TPC_I	wrpr	%r22, 0x003c, %tpc
	.word 0xf674a1d9  ! 840: STX_I	stx	%r27, [%r18 + 0x01d9]
	.word 0xb3500000  ! 843: RDPR_TPC	rdpr	%tpc, %r25
	.word 0xf23521a3  ! 847: STH_I	sth	%r25, [%r20 + 0x01a3]
hwintr_3_40:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_40), 16, 16)) -> intp(3, 0, 2c)
	.word 0x919461dd  ! 850: WRPR_PIL_I	wrpr	%r17, 0x01dd, %pil
	.word 0x8395e057  ! 857: WRPR_TNPC_I	wrpr	%r23, 0x0057, %tnpc
	.word 0x8d95e0f4  ! 858: WRPR_PSTATE_I	wrpr	%r23, 0x00f4, %pstate
	.word 0xb89dc000  ! 859: XORcc_R	xorcc 	%r23, %r0, %r28
	.word 0xf235a117  ! 860: STH_I	sth	%r25, [%r22 + 0x0117]
	.word 0xbf480000  ! 862: RDHPR_HPSTATE	rdhpr	%hpstate, %r31
	.word 0xf2244000  ! 864: STW_R	stw	%r25, [%r17 + %r0]
	setx	0xd5316b710000bc4d, %g1, %r10
	.word 0x819a8000  ! 867: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0x89946016  ! 868: WRPR_TICK_I	wrpr	%r17, 0x0016, %tick
	.word 0xf6758000  ! 873: STX_R	stx	%r27, [%r22 + %r0]
	mov	0, %r12
	.word 0xa1930000  ! 874: WRPR_GL_R	wrpr	%r12, %r0, %-
	setx	data_start_7, %g1, %r23
	mov	2, %r12
	.word 0xa1930000  ! 877: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0x919420d5  ! 878: WRPR_PIL_I	wrpr	%r16, 0x00d5, %pil
	.word 0xf22cc000  ! 883: STB_R	stb	%r25, [%r19 + %r0]
hwintr_3_41:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_41), 16, 16)) -> intp(3, 0, 1)
	.word 0xf42d604a  ! 892: STB_I	stb	%r26, [%r21 + 0x004a]
hwintr_3_42:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_42), 16, 16)) -> intp(3, 0, 24)
	.word 0xf6340000  ! 895: STH_R	sth	%r27, [%r16 + %r0]
	.word 0xf4244000  ! 897: STW_R	stw	%r26, [%r17 + %r0]
	.word 0xf63c0000  ! 900: STD_R	std	%r27, [%r16 + %r0]
	.word 0xb8042189  ! 904: ADD_I	add 	%r16, 0x0189, %r28
	.word 0xff3d4000  ! 905: STDF_R	std	%f31, [%r0, %r21]
hwintr_3_43:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_43), 16, 16)) -> intp(3, 0, 2)
	.word 0xb1540000  ! 909: RDPR_GL	rdpr	%-, %r24
	.word 0x8794a028  ! 914: WRPR_TT_I	wrpr	%r18, 0x0028, %tt
	.word 0xf33da12c  ! 915: STDF_I	std	%f25, [0x012c, %r22]
	.word 0xf73c2125  ! 918: STDF_I	std	%f27, [0x0125, %r16]
	.word 0xbb508000  ! 923: RDPR_TSTATE	rdpr	%tstate, %r29
	.word 0x8795e0e6  ! 924: WRPR_TT_I	wrpr	%r23, 0x00e6, %tt
hwintr_3_44:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_44), 16, 16)) -> intp(3, 0, 19)
	.word 0xf13da1c5  ! 929: STDF_I	std	%f24, [0x01c5, %r22]
	setx	data_start_2, %g1, %r23
	.word 0x91956094  ! 931: WRPR_PIL_I	wrpr	%r21, 0x0094, %pil
	.word 0x8195a104  ! 935: WRPR_TPC_I	wrpr	%r22, 0x0104, %tpc
	.word 0xf13da195  ! 937: STDF_I	std	%f24, [0x0195, %r22]
	.word 0xbb500000  ! 938: RDPR_TPC	rdpr	%tpc, %r29
	.word 0xb33cc000  ! 940: SRA_R	sra 	%r19, %r0, %r25
	.word 0xf03d0000  ! 944: STD_R	std	%r24, [%r20 + %r0]
	.word 0xf625a0c2  ! 945: STW_I	stw	%r27, [%r22 + 0x00c2]
	.word 0x87946188  ! 946: WRPR_TT_I	wrpr	%r17, 0x0188, %tt
	.word 0x8d95e103  ! 947: WRPR_PSTATE_I	wrpr	%r23, 0x0103, %pstate
	setx	data_start_7, %g1, %r16
	.word 0xfa3ce0a6  ! 951: STD_I	std	%r29, [%r19 + 0x00a6]
	.word 0xbe240000  ! 959: SUB_R	sub 	%r16, %r0, %r31
	.word 0xb9518000  ! 961: RDPR_PSTATE	rdpr	%pstate, %r28
	.word 0xbe040000  ! 963: ADD_R	add 	%r16, %r0, %r31
	.word 0xfe3c0000  ! 964: STD_R	std	%r31, [%r16 + %r0]
	.word 0x919420f5  ! 965: WRPR_PIL_I	wrpr	%r16, 0x00f5, %pil
	.word 0xbb520000  ! 966: RDPR_PIL	rdpr	%pil, %r29
	.word 0xf73c0000  ! 967: STDF_R	std	%f27, [%r0, %r16]
	mov	0, %r12
	.word 0xa1930000  ! 971: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xf42d2043  ! 975: STB_I	stb	%r26, [%r20 + 0x0043]
	.word 0xf275200e  ! 977: STX_I	stx	%r25, [%r20 + 0x000e]
	.word 0xfe2d20df  ! 978: STB_I	stb	%r31, [%r20 + 0x00df]
	.word 0xfc35e055  ! 979: STH_I	sth	%r30, [%r23 + 0x0055]
	.word 0x8d952048  ! 980: WRPR_PSTATE_I	wrpr	%r20, 0x0048, %pstate
	.word 0xfe3de1d1  ! 988: STD_I	std	%r31, [%r23 + 0x01d1]
	setx	0xba8a34f00000ba19, %g1, %r10
	.word 0x839a8000  ! 992: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb9520000  ! 995: RDPR_PIL	rdpr	%pil, %r28
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
	.word 0xf85cc000  ! 3: LDX_R	ldx	[%r19 + %r0], %r28
	.word 0xf05c2132  ! 6: LDX_I	ldx	[%r16 + 0x0132], %r24
	setx	data_start_0, %g1, %r17
	setx	data_start_6, %g1, %r21
hwintr_2_0:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_0), 16, 16)) -> intp(2, 0, a)
	.word 0xf64460b9  ! 13: LDSW_I	ldsw	[%r17 + 0x00b9], %r27
	.word 0xf6050000  ! 16: LDUW_R	lduw	[%r20 + %r0], %r27
	mov	0, %r12
	.word 0x8f930000  ! 17: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xf0540000  ! 22: LDSH_R	ldsh	[%r16 + %r0], %r24
	.word 0xb4a44000  ! 23: SUBcc_R	subcc 	%r17, %r0, %r26
	.word 0x839560b0  ! 28: WRPR_TNPC_I	wrpr	%r21, 0x00b0, %tnpc
	.word 0xb0158000  ! 32: OR_R	or 	%r22, %r0, %r24
	.word 0xf6554000  ! 33: LDSH_R	ldsh	[%r21 + %r0], %r27
	mov	0, %r12
	.word 0x8f930000  ! 35: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xbf51c000  ! 37: RDPR_TL	<illegal instruction>
	.word 0xf40d212d  ! 38: LDUB_I	ldub	[%r20 + 0x012d], %r26
	.word 0xfc0c4000  ! 39: LDUB_R	ldub	[%r17 + %r0], %r30
hwintr_2_1:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_1), 16, 16)) -> intp(2, 0, 22)
	.word 0xf05cc000  ! 41: LDX_R	ldx	[%r19 + %r0], %r24
	.word 0xfb1c212f  ! 43: LDDF_I	ldd	[%r16, 0x012f], %f29
hwintr_2_2:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_2), 16, 16)) -> intp(2, 0, a)
hwintr_2_3:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_3), 16, 16)) -> intp(2, 0, 2f)
	.word 0xfa15a06a  ! 55: LDUH_I	lduh	[%r22 + 0x006a], %r29
	.word 0x8d9460be  ! 57: WRPR_PSTATE_I	wrpr	%r17, 0x00be, %pstate
	.word 0xb3480000  ! 60: RDHPR_HPSTATE	rdhpr	%hpstate, %r25
	.word 0xf31ce015  ! 65: LDDF_I	ldd	[%r19, 0x0015], %f25
	setx	data_start_3, %g1, %r19
hwintr_2_4:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_4), 16, 16)) -> intp(2, 0, 1f)
	.word 0xbb358000  ! 69: SRL_R	srl 	%r22, %r0, %r29
	setx	0xb009de610000ae8a, %g1, %r10
	.word 0x839a8000  ! 74: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	setx	data_start_0, %g1, %r16
hwintr_2_5:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_5), 16, 16)) -> intp(2, 0, d)
	.word 0xfe4d2181  ! 79: LDSB_I	ldsb	[%r20 + 0x0181], %r31
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0x91956149  ! 82: WRPR_PIL_I	wrpr	%r21, 0x0149, %pil
	.word 0xf6058000  ! 83: LDUW_R	lduw	[%r22 + %r0], %r27
	setx	data_start_7, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0x8594e17e  ! 91: WRPR_TSTATE_I	wrpr	%r19, 0x017e, %tstate
	.word 0xf64c8000  ! 92: LDSB_R	ldsb	[%r18 + %r0], %r27
	setx	0xea72549400004bdf, %g1, %r10
	.word 0x839a8000  ! 93: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb4a46151  ! 96: SUBcc_I	subcc 	%r17, 0x0151, %r26
	.word 0xfc5ca0e9  ! 98: LDX_I	ldx	[%r18 + 0x00e9], %r30
	.word 0xf045612c  ! 99: LDSW_I	ldsw	[%r21 + 0x012c], %r24
	.word 0xf80d8000  ! 101: LDUB_R	ldub	[%r22 + %r0], %r28
	.word 0xb2c5e123  ! 102: ADDCcc_I	addccc 	%r23, 0x0123, %r25
	.word 0xbf508000  ! 105: RDPR_TSTATE	<illegal instruction>
	.word 0xfa050000  ! 106: LDUW_R	lduw	[%r20 + %r0], %r29
	.word 0xf01c0000  ! 107: LDD_R	ldd	[%r16 + %r0], %r24
	.word 0xf60de05b  ! 108: LDUB_I	ldub	[%r23 + 0x005b], %r27
	.word 0xbcbc4000  ! 110: XNORcc_R	xnorcc 	%r17, %r0, %r30
hwintr_2_6:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_6), 16, 16)) -> intp(2, 0, b)
	.word 0xf2154000  ! 113: LDUH_R	lduh	[%r21 + %r0], %r25
	.word 0xb72c4000  ! 114: SLL_R	sll 	%r17, %r0, %r27
	.word 0x8194a02d  ! 116: WRPR_TPC_I	wrpr	%r18, 0x002d, %tpc
	.word 0xf41de054  ! 121: LDD_I	ldd	[%r23 + 0x0054], %r26
	.word 0x859520a2  ! 123: WRPR_TSTATE_I	wrpr	%r20, 0x00a2, %tstate
	.word 0xb0252053  ! 125: SUB_I	sub 	%r20, 0x0053, %r24
	mov	2, %r12
	.word 0x8f930000  ! 126: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xb6bc6186  ! 131: XNORcc_I	xnorcc 	%r17, 0x0186, %r27
	.word 0xf45d0000  ! 133: LDX_R	ldx	[%r20 + %r0], %r26
hwintr_2_7:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_7), 16, 16)) -> intp(2, 0, f)
hwintr_2_8:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_8), 16, 16)) -> intp(2, 0, 23)
	.word 0xb8956166  ! 137: ORcc_I	orcc 	%r21, 0x0166, %r28
	.word 0xb4b561fc  ! 138: ORNcc_I	orncc 	%r21, 0x01fc, %r26
	.word 0xb9520000  ! 141: RDPR_PIL	<illegal instruction>
	.word 0xf804e03b  ! 142: LDUW_I	lduw	[%r19 + 0x003b], %r28
	.word 0xbd520000  ! 144: RDPR_PIL	<illegal instruction>
	.word 0xff1cc000  ! 151: LDDF_R	ldd	[%r19, %r0], %f31
	.word 0xf81d4000  ! 152: LDD_R	ldd	[%r21 + %r0], %r28
hwintr_2_9:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_9), 16, 16)) -> intp(2, 0, 27)
hwintr_2_10:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_10), 16, 16)) -> intp(2, 0, 2a)
	mov	1, %r12
	.word 0xa1930000  ! 162: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xf855e169  ! 163: LDSH_I	ldsh	[%r23 + 0x0169], %r28
	.word 0xfe4c0000  ! 167: LDSB_R	ldsb	[%r16 + %r0], %r31
	.word 0xfd1cc000  ! 168: LDDF_R	ldd	[%r19, %r0], %f30
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb6b5208d  ! 178: SUBCcc_I	orncc 	%r20, 0x008d, %r27
	mov	2, %r12
	.word 0x8f930000  ! 182: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xfe0c8000  ! 184: LDUB_R	ldub	[%r18 + %r0], %r31
	setx	0x4226d6350000dc19, %g1, %r10
	.word 0x819a8000  ! 186: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xf01ce1d4  ! 187: LDD_I	ldd	[%r19 + 0x01d4], %r24
	.word 0xf81da19a  ! 188: LDD_I	ldd	[%r22 + 0x019a], %r28
	setx	data_start_4, %g1, %r20
	.word 0xf80c21b8  ! 192: LDUB_I	ldub	[%r16 + 0x01b8], %r28
	.word 0xb9504000  ! 193: RDPR_TNPC	<illegal instruction>
	.word 0xf015e155  ! 195: LDUH_I	lduh	[%r23 + 0x0155], %r24
	.word 0xb9480000  ! 196: RDHPR_HPSTATE	rdhpr	%hpstate, %r28
	.word 0xbe8c8000  ! 197: ANDcc_R	andcc 	%r18, %r0, %r31
	.word 0xb7518000  ! 198: RDPR_PSTATE	<illegal instruction>
	.word 0xb49dc000  ! 201: XORcc_R	xorcc 	%r23, %r0, %r26
	setx	data_start_0, %g1, %r21
	.word 0xf05c4000  ! 205: LDX_R	ldx	[%r17 + %r0], %r24
hwintr_2_11:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_11), 16, 16)) -> intp(2, 0, 38)
	.word 0xb1510000  ! 208: RDPR_TICK	<illegal instruction>
	.word 0x8d95e1f2  ! 210: WRPR_PSTATE_I	wrpr	%r23, 0x01f2, %pstate
	.word 0xbd508000  ! 214: RDPR_TSTATE	<illegal instruction>
	.word 0xb5643801  ! 215: MOVcc_I	<illegal instruction>
	.word 0xf51cc000  ! 218: LDDF_R	ldd	[%r19, %r0], %f26
	.word 0xfc540000  ! 220: LDSH_R	ldsh	[%r16 + %r0], %r30
	.word 0xf604e1ac  ! 222: LDUW_I	lduw	[%r19 + 0x01ac], %r27
	.word 0xb6140000  ! 225: OR_R	or 	%r16, %r0, %r27
	.word 0xb7518000  ! 226: RDPR_PSTATE	<illegal instruction>
	.word 0x8194a155  ! 228: WRPR_TPC_I	wrpr	%r18, 0x0155, %tpc
	.word 0xf41c20e8  ! 231: LDD_I	ldd	[%r16 + 0x00e8], %r26
	.word 0xf6458000  ! 233: LDSW_R	ldsw	[%r22 + %r0], %r27
	.word 0xf20ca17d  ! 234: LDUB_I	ldub	[%r18 + 0x017d], %r25
	.word 0xbb500000  ! 237: RDPR_TPC	<illegal instruction>
	.word 0xfc4ca002  ! 239: LDSB_I	ldsb	[%r18 + 0x0002], %r30
	.word 0xf11c208c  ! 245: LDDF_I	ldd	[%r16, 0x008c], %f24
	.word 0xf4540000  ! 248: LDSH_R	ldsh	[%r16 + %r0], %r26
	.word 0xba3c60c8  ! 249: XNOR_I	xnor 	%r17, 0x00c8, %r29
	.word 0x9194a195  ! 253: WRPR_PIL_I	wrpr	%r18, 0x0195, %pil
	.word 0xf40c4000  ! 254: LDUB_R	ldub	[%r17 + %r0], %r26
	.word 0xfa0da190  ! 255: LDUB_I	ldub	[%r22 + 0x0190], %r29
	setx	data_start_2, %g1, %r20
	.word 0xbd347001  ! 261: SRLX_I	srlx	%r17, 0x0001, %r30
hwintr_2_12:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_12), 16, 16)) -> intp(2, 0, 7)
hwintr_2_13:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_13), 16, 16)) -> intp(2, 0, 24)
	mov	0, %r12
	.word 0xa1930000  ! 266: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb750c000  ! 271: RDPR_TT	<illegal instruction>
	.word 0xfc5de187  ! 273: LDX_I	ldx	[%r23 + 0x0187], %r30
	.word 0x8d956080  ! 275: WRPR_PSTATE_I	wrpr	%r21, 0x0080, %pstate
	.word 0xbd351000  ! 278: SRLX_R	srlx	%r20, %r0, %r30
	.word 0xf0444000  ! 281: LDSW_R	ldsw	[%r17 + %r0], %r24
	.word 0xf51d0000  ! 285: LDDF_R	ldd	[%r20, %r0], %f26
hwintr_2_14:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_14), 16, 16)) -> intp(2, 0, 1e)
	.word 0xfc5cc000  ! 291: LDX_R	ldx	[%r19 + %r0], %r30
	.word 0xf20c6081  ! 298: LDUB_I	ldub	[%r17 + 0x0081], %r25
	.word 0xb3518000  ! 299: RDPR_PSTATE	<illegal instruction>
	.word 0xf254a01a  ! 300: LDSH_I	ldsh	[%r18 + 0x001a], %r25
hwintr_2_15:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_15), 16, 16)) -> intp(2, 0, 23)
	.word 0xb40da12f  ! 303: AND_I	and 	%r22, 0x012f, %r26
	.word 0xf21ca1fc  ! 304: LDD_I	ldd	[%r18 + 0x01fc], %r25
	.word 0xb12d4000  ! 307: SLL_R	sll 	%r21, %r0, %r24
hwintr_2_16:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_16), 16, 16)) -> intp(2, 0, f)
	.word 0xbd500000  ! 313: RDPR_TPC	<illegal instruction>
	.word 0xb01d4000  ! 314: XOR_R	xor 	%r21, %r0, %r24
	.word 0xfc45609d  ! 316: LDSW_I	ldsw	[%r21 + 0x009d], %r30
	.word 0xf2148000  ! 317: LDUH_R	lduh	[%r18 + %r0], %r25
	.word 0xf84d4000  ! 318: LDSB_R	ldsb	[%r21 + %r0], %r28
	.word 0x8395e1e4  ! 322: WRPR_TNPC_I	wrpr	%r23, 0x01e4, %tnpc
	.word 0xfc55c000  ! 326: LDSH_R	ldsh	[%r23 + %r0], %r30
	.word 0xfe544000  ! 331: LDSH_R	ldsh	[%r17 + %r0], %r31
	.word 0xb551c000  ! 334: RDPR_TL	<illegal instruction>
	.word 0x8395a124  ! 335: WRPR_TNPC_I	wrpr	%r22, 0x0124, %tnpc
hwintr_2_17:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_17), 16, 16)) -> intp(2, 0, 2)
	.word 0xf6140000  ! 341: LDUH_R	lduh	[%r16 + %r0], %r27
hwintr_2_18:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_18), 16, 16)) -> intp(2, 0, 11)
	.word 0xf01d8000  ! 347: LDD_R	ldd	[%r22 + %r0], %r24
	.word 0xb7540000  ! 352: RDPR_GL	<illegal instruction>
	.word 0xb5520000  ! 355: RDPR_PIL	<illegal instruction>
	.word 0xbec5e0c2  ! 359: ADDCcc_I	addccc 	%r23, 0x00c2, %r31
	.word 0xf84d4000  ! 360: LDSB_R	ldsb	[%r21 + %r0], %r28
	.word 0x8595e18a  ! 361: WRPR_TSTATE_I	wrpr	%r23, 0x018a, %tstate
	.word 0xb1518000  ! 362: RDPR_PSTATE	<illegal instruction>
	.word 0xf4558000  ! 365: LDSH_R	ldsh	[%r22 + %r0], %r26
	mov	1, %r12
	.word 0x8f930000  ! 366: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xfe14e0bb  ! 373: LDUH_I	lduh	[%r19 + 0x00bb], %r31
	.word 0xf844c000  ! 375: LDSW_R	ldsw	[%r19 + %r0], %r28
	.word 0xb7518000  ! 377: RDPR_PSTATE	<illegal instruction>
	.word 0xf6054000  ! 380: LDUW_R	lduw	[%r21 + %r0], %r27
	.word 0xbb540000  ! 384: RDPR_GL	<illegal instruction>
	.word 0xfa440000  ! 387: LDSW_R	ldsw	[%r16 + %r0], %r29
	.word 0x8d94e1b4  ! 389: WRPR_PSTATE_I	wrpr	%r19, 0x01b4, %pstate
	.word 0xfa5de09f  ! 393: LDX_I	ldx	[%r23 + 0x009f], %r29
	.word 0xf614c000  ! 394: LDUH_R	lduh	[%r19 + %r0], %r27
	.word 0xb9480000  ! 396: RDHPR_HPSTATE	rdhpr	%hpstate, %r28
hwintr_2_19:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_19), 16, 16)) -> intp(2, 0, 35)
	.word 0xb550c000  ! 401: RDPR_TT	<illegal instruction>
hwintr_2_20:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_20), 16, 16)) -> intp(2, 0, d)
	.word 0xf00421ff  ! 404: LDUW_I	lduw	[%r16 + 0x01ff], %r24
	.word 0xf61dc000  ! 405: LDD_R	ldd	[%r23 + %r0], %r27
	.word 0xb3510000  ! 407: RDPR_TICK	<illegal instruction>
	.word 0xb044c000  ! 409: ADDC_R	addc 	%r19, %r0, %r24
	.word 0xf91dc000  ! 415: LDDF_R	ldd	[%r23, %r0], %f28
	.word 0xfa1d6161  ! 417: LDD_I	ldd	[%r21 + 0x0161], %r29
	.word 0xf45ca080  ! 418: LDX_I	ldx	[%r18 + 0x0080], %r26
	.word 0x91952031  ! 421: WRPR_PIL_I	wrpr	%r20, 0x0031, %pil
	.word 0xf2150000  ! 422: LDUH_R	lduh	[%r20 + %r0], %r25
	.word 0x8194a080  ! 423: WRPR_TPC_I	wrpr	%r18, 0x0080, %tpc
	.word 0xf71d2034  ! 426: LDDF_I	ldd	[%r20, 0x0034], %f27
	.word 0xb3480000  ! 430: RDHPR_HPSTATE	rdhpr	%hpstate, %r25
	.word 0xf61d0000  ! 431: LDD_R	ldd	[%r20 + %r0], %r27
	.word 0xfc14a1b7  ! 433: LDUH_I	lduh	[%r18 + 0x01b7], %r30
	.word 0x89956132  ! 434: WRPR_TICK_I	wrpr	%r21, 0x0132, %tick
	.word 0xfc4d8000  ! 435: LDSB_R	ldsb	[%r22 + %r0], %r30
	.word 0xfe4dc000  ! 436: LDSB_R	ldsb	[%r23 + %r0], %r31
	.word 0xbd51c000  ! 446: RDPR_TL	<illegal instruction>
	.word 0xf6040000  ! 450: LDUW_R	lduw	[%r16 + %r0], %r27
	.word 0xb3508000  ! 454: RDPR_TSTATE	<illegal instruction>
	.word 0xf604c000  ! 455: LDUW_R	lduw	[%r19 + %r0], %r27
hwintr_2_21:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_21), 16, 16)) -> intp(2, 0, 38)
	.word 0xf24cc000  ! 457: LDSB_R	ldsb	[%r19 + %r0], %r25
	.word 0xf71c8000  ! 459: LDDF_R	ldd	[%r18, %r0], %f27
	.word 0xf60d614c  ! 460: LDUB_I	ldub	[%r21 + 0x014c], %r27
	.word 0xb7510000  ! 462: RDPR_TICK	<illegal instruction>
	.word 0xf2148000  ! 465: LDUH_R	lduh	[%r18 + %r0], %r25
	.word 0xb8aca1ef  ! 466: ANDNcc_I	andncc 	%r18, 0x01ef, %r28
	.word 0xb350c000  ! 469: RDPR_TT	<illegal instruction>
	.word 0xbd351000  ! 471: SRLX_R	srlx	%r20, %r0, %r30
	.word 0xfa5da0fd  ! 472: LDX_I	ldx	[%r22 + 0x00fd], %r29
	.word 0xb23da191  ! 474: XNOR_I	xnor 	%r22, 0x0191, %r25
	.word 0xbb518000  ! 475: RDPR_PSTATE	<illegal instruction>
	.word 0xfa55204d  ! 477: LDSH_I	ldsh	[%r20 + 0x004d], %r29
	.word 0xb2b5e13d  ! 479: ORNcc_I	orncc 	%r23, 0x013d, %r25
	setx	0xef6aaf4200009c81, %g1, %r10
	.word 0x839a8000  ! 482: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb3518000  ! 485: RDPR_PSTATE	<illegal instruction>
	.word 0xf2440000  ! 489: LDSW_R	ldsw	[%r16 + %r0], %r25
	.word 0x8d94200a  ! 493: WRPR_PSTATE_I	wrpr	%r16, 0x000a, %pstate
	.word 0xf0056128  ! 494: LDUW_I	lduw	[%r21 + 0x0128], %r24
hwintr_2_22:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_22), 16, 16)) -> intp(2, 0, 2e)
	.word 0xf00d4000  ! 498: LDUB_R	ldub	[%r21 + %r0], %r24
	.word 0xbf354000  ! 499: SRL_R	srl 	%r21, %r0, %r31
	.word 0xbf508000  ! 501: RDPR_TSTATE	<illegal instruction>
	.word 0xb1500000  ! 502: RDPR_TPC	<illegal instruction>
	.word 0xf84560ad  ! 503: LDSW_I	ldsw	[%r21 + 0x00ad], %r28
	.word 0x839521f0  ! 508: WRPR_TNPC_I	wrpr	%r20, 0x01f0, %tnpc
hwintr_2_23:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_23), 16, 16)) -> intp(2, 0, 33)
hwintr_2_24:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_24), 16, 16)) -> intp(2, 0, 3d)
	.word 0xfa5de071  ! 517: LDX_I	ldx	[%r23 + 0x0071], %r29
	mov	0, %r12
	.word 0x8f930000  ! 521: WRPR_TL_R	wrpr	%r12, %r0, %tl
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
hwintr_2_25:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_25), 16, 16)) -> intp(2, 0, e)
	.word 0xfc1c0000  ! 529: LDD_R	ldd	[%r16 + %r0], %r30
	setx	0x7d102e6e0000f813, %g1, %r10
	.word 0x839a8000  ! 530: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xfa1d8000  ! 531: LDD_R	ldd	[%r22 + %r0], %r29
hwintr_2_26:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_26), 16, 16)) -> intp(2, 0, 19)
	.word 0xf01da076  ! 536: LDD_I	ldd	[%r22 + 0x0076], %r24
	setx	0x46109df700000e4f, %g1, %r10
	.word 0x839a8000  ! 539: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xbb500000  ! 542: RDPR_TPC	<illegal instruction>
	.word 0x83952025  ! 543: WRPR_TNPC_I	wrpr	%r20, 0x0025, %tnpc
	.word 0xb151c000  ! 544: RDPR_TL	<illegal instruction>
	.word 0xb1540000  ! 547: RDPR_GL	<illegal instruction>
	.word 0xf854a1d0  ! 550: LDSH_I	ldsh	[%r18 + 0x01d0], %r28
	setx	data_start_1, %g1, %r23
	.word 0xf604e052  ! 553: LDUW_I	lduw	[%r19 + 0x0052], %r27
	.word 0xf05c607a  ! 555: LDX_I	ldx	[%r17 + 0x007a], %r24
	setx	data_start_2, %g1, %r22
	.word 0xb3518000  ! 557: RDPR_PSTATE	<illegal instruction>
hwintr_2_27:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_27), 16, 16)) -> intp(2, 0, 1b)
	.word 0xb350c000  ! 561: RDPR_TT	<illegal instruction>
	.word 0xff1da14a  ! 563: LDDF_I	ldd	[%r22, 0x014a], %f31
	.word 0xfa4d6084  ! 567: LDSB_I	ldsb	[%r21 + 0x0084], %r29
	.word 0xb7350000  ! 568: SRL_R	srl 	%r20, %r0, %r27
	.word 0xbcb5c000  ! 574: ORNcc_R	orncc 	%r23, %r0, %r30
	.word 0xfa1da13e  ! 576: LDD_I	ldd	[%r22 + 0x013e], %r29
	setx	0xe5b0ffc40000ea5a, %g1, %r10
	.word 0x819a8000  ! 577: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xb5341000  ! 579: SRLX_R	srlx	%r16, %r0, %r26
	.word 0xf044601d  ! 582: LDSW_I	ldsw	[%r17 + 0x001d], %r24
	.word 0xb244a13f  ! 585: ADDC_I	addc 	%r18, 0x013f, %r25
	.word 0xf255c000  ! 586: LDSH_R	ldsh	[%r23 + %r0], %r25
	.word 0xb1500000  ! 593: RDPR_TPC	<illegal instruction>
	setx	data_start_3, %g1, %r19
	.word 0x81946178  ! 596: WRPR_TPC_I	wrpr	%r17, 0x0178, %tpc
	.word 0xf91ce051  ! 599: LDDF_I	ldd	[%r19, 0x0051], %f28
	.word 0xf2052185  ! 600: LDUW_I	lduw	[%r20 + 0x0185], %r25
	.word 0xb335c000  ! 602: SRL_R	srl 	%r23, %r0, %r25
	.word 0xbb510000  ! 603: RDPR_TICK	<illegal instruction>
	.word 0x899560c7  ! 605: WRPR_TICK_I	wrpr	%r21, 0x00c7, %tick
	mov	0, %r12
	.word 0x8f930000  ! 606: WRPR_TL_R	wrpr	%r12, %r0, %tl
hwintr_2_28:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_28), 16, 16)) -> intp(2, 0, 1f)
	.word 0xf404609f  ! 608: LDUW_I	lduw	[%r17 + 0x009f], %r26
	.word 0xf60de071  ! 612: LDUB_I	ldub	[%r23 + 0x0071], %r27
	.word 0xfa4d8000  ! 619: LDSB_R	ldsb	[%r22 + %r0], %r29
	.word 0x8194e132  ! 621: WRPR_TPC_I	wrpr	%r19, 0x0132, %tpc
	.word 0xb61dc000  ! 623: XOR_R	xor 	%r23, %r0, %r27
	.word 0xf84c8000  ! 624: LDSB_R	ldsb	[%r18 + %r0], %r28
	.word 0xb6150000  ! 625: OR_R	or 	%r20, %r0, %r27
	.word 0xb9354000  ! 626: SRL_R	srl 	%r21, %r0, %r28
	.word 0xb5520000  ! 630: RDPR_PIL	<illegal instruction>
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb9480000  ! 634: RDHPR_HPSTATE	rdhpr	%hpstate, %r28
	.word 0xb825c000  ! 635: SUB_R	sub 	%r23, %r0, %r28
	.word 0x8395a1ae  ! 636: WRPR_TNPC_I	wrpr	%r22, 0x01ae, %tnpc
	.word 0xb5346001  ! 637: SRL_I	srl 	%r17, 0x0001, %r26
	.word 0xf41ca0a5  ! 642: LDD_I	ldd	[%r18 + 0x00a5], %r26
	.word 0xf615a183  ! 643: LDUH_I	lduh	[%r22 + 0x0183], %r27
hwintr_2_29:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_29), 16, 16)) -> intp(2, 0, 4)
	.word 0x8395e16a  ! 645: WRPR_TNPC_I	wrpr	%r23, 0x016a, %tnpc
	setx	data_start_3, %g1, %r20
	.word 0xfc1da092  ! 649: LDD_I	ldd	[%r22 + 0x0092], %r30
	.word 0xfb1dc000  ! 650: LDDF_R	ldd	[%r23, %r0], %f29
	.word 0xf51ca071  ! 651: LDDF_I	ldd	[%r18, 0x0071], %f26
hwintr_2_30:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_30), 16, 16)) -> intp(2, 0, 13)
hwintr_2_31:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_31), 16, 16)) -> intp(2, 0, 1a)
	setx	data_start_5, %g1, %r22
	.word 0x8395e097  ! 659: WRPR_TNPC_I	wrpr	%r23, 0x0097, %tnpc
	.word 0xb351c000  ! 661: RDPR_TL	<illegal instruction>
	.word 0x8194a1ec  ! 662: WRPR_TPC_I	wrpr	%r18, 0x01ec, %tpc
	.word 0xfc14e162  ! 665: LDUH_I	lduh	[%r19 + 0x0162], %r30
	.word 0x879560af  ! 666: WRPR_TT_I	wrpr	%r21, 0x00af, %tt
	mov	2, %r12
	.word 0xa1930000  ! 667: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xbb508000  ! 677: RDPR_TSTATE	rdpr	%tstate, %r29
	.word 0xf24ce1a5  ! 679: LDSB_I	ldsb	[%r19 + 0x01a5], %r25
hwintr_2_32:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_32), 16, 16)) -> intp(2, 0, 17)
	.word 0xb2b48000  ! 684: ORNcc_R	orncc 	%r18, %r0, %r25
hwintr_2_33:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_33), 16, 16)) -> intp(2, 0, 33)
hwintr_2_34:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_34), 16, 16)) -> intp(2, 0, 28)
	.word 0xf64dc000  ! 692: LDSB_R	ldsb	[%r23 + %r0], %r27
	.word 0xb9518000  ! 693: RDPR_PSTATE	<illegal instruction>
	.word 0xf25cc000  ! 697: LDX_R	ldx	[%r19 + %r0], %r25
hwintr_2_35:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_35), 16, 16)) -> intp(2, 0, 1c)
	.word 0xf80ca000  ! 700: LDUB_I	ldub	[%r18 + 0x0000], %r28
	.word 0xf0548000  ! 701: LDSH_R	ldsh	[%r18 + %r0], %r24
	.word 0xf0058000  ! 702: LDUW_R	lduw	[%r22 + %r0], %r24
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xba34a1da  ! 708: ORN_I	orn 	%r18, 0x01da, %r29
	.word 0xbebda162  ! 711: XNORcc_I	xnorcc 	%r22, 0x0162, %r31
	mov	2, %r12
	.word 0xa1930000  ! 712: WRPR_GL_R	wrpr	%r12, %r0, %-
	mov	2, %r12
	.word 0xa1930000  ! 713: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xf8154000  ! 715: LDUH_R	lduh	[%r21 + %r0], %r28
	.word 0x8d95e1f9  ! 716: WRPR_PSTATE_I	wrpr	%r23, 0x01f9, %pstate
	.word 0xbf50c000  ! 717: RDPR_TT	<illegal instruction>
	.word 0xf255615f  ! 721: LDSH_I	ldsh	[%r21 + 0x015f], %r25
	.word 0xfe0d2126  ! 723: LDUB_I	ldub	[%r20 + 0x0126], %r31
	.word 0xb1510000  ! 724: RDPR_TICK	<illegal instruction>
	.word 0xfa0560c7  ! 727: LDUW_I	lduw	[%r21 + 0x00c7], %r29
	.word 0xb52d6001  ! 728: SLL_I	sll 	%r21, 0x0001, %r26
	.word 0xf64c8000  ! 729: LDSB_R	ldsb	[%r18 + %r0], %r27
	.word 0xf81c205a  ! 730: LDD_I	ldd	[%r16 + 0x005a], %r28
	.word 0xf0142167  ! 731: LDUH_I	lduh	[%r16 + 0x0167], %r24
	.word 0xf61421db  ! 735: LDUH_I	lduh	[%r16 + 0x01db], %r27
	setx	data_start_7, %g1, %r17
	.word 0xb8b4e17a  ! 741: SUBCcc_I	orncc 	%r19, 0x017a, %r28
	.word 0x81942068  ! 742: WRPR_TPC_I	wrpr	%r16, 0x0068, %tpc
hwintr_2_36:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_36), 16, 16)) -> intp(2, 0, 3c)
	.word 0xf6458000  ! 745: LDSW_R	ldsw	[%r22 + %r0], %r27
	.word 0xf40c8000  ! 746: LDUB_R	ldub	[%r18 + %r0], %r26
	setx	data_start_2, %g1, %r20
	.word 0xf254212b  ! 753: LDSH_I	ldsh	[%r16 + 0x012b], %r25
	.word 0xf41d8000  ! 755: LDD_R	ldd	[%r22 + %r0], %r26
	.word 0xfc54a1a2  ! 756: LDSH_I	ldsh	[%r18 + 0x01a2], %r30
	.word 0xfe1d2066  ! 759: LDD_I	ldd	[%r20 + 0x0066], %r31
	.word 0xbf518000  ! 763: RDPR_PSTATE	<illegal instruction>
	.word 0xf24dc000  ! 765: LDSB_R	ldsb	[%r23 + %r0], %r25
	.word 0xfe450000  ! 766: LDSW_R	ldsw	[%r20 + %r0], %r31
	.word 0x85956030  ! 770: WRPR_TSTATE_I	wrpr	%r21, 0x0030, %tstate
	.word 0xf055e1d8  ! 771: LDSH_I	ldsh	[%r23 + 0x01d8], %r24
	mov	2, %r12
	.word 0xa1930000  ! 772: WRPR_GL_R	wrpr	%r12, %r0, %-
hwintr_2_37:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_37), 16, 16)) -> intp(2, 0, 2f)
	.word 0xf20dc000  ! 775: LDUB_R	ldub	[%r23 + %r0], %r25
	.word 0xf65d2165  ! 777: LDX_I	ldx	[%r20 + 0x0165], %r27
	.word 0xb5508000  ! 778: RDPR_TSTATE	<illegal instruction>
	.word 0xf444c000  ! 779: LDSW_R	ldsw	[%r19 + %r0], %r26
hwintr_2_38:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_38), 16, 16)) -> intp(2, 0, 3f)
	.word 0xf01ca089  ! 781: LDD_I	ldd	[%r18 + 0x0089], %r24
	.word 0xfc15a038  ! 782: LDUH_I	lduh	[%r22 + 0x0038], %r30
	.word 0x8d94e0bf  ! 783: WRPR_PSTATE_I	wrpr	%r19, 0x00bf, %pstate
	.word 0xf814e1bf  ! 785: LDUH_I	lduh	[%r19 + 0x01bf], %r28
	.word 0xf31d8000  ! 788: LDDF_R	ldd	[%r22, %r0], %f25
	.word 0xb3500000  ! 789: RDPR_TPC	<illegal instruction>
	.word 0xbf3c9000  ! 793: SRAX_R	srax	%r18, %r0, %r31
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb4040000  ! 804: ADD_R	add 	%r16, %r0, %r26
	.word 0xf85ce03c  ! 806: LDX_I	ldx	[%r19 + 0x003c], %r28
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xfc0d4000  ! 811: LDUB_R	ldub	[%r21 + %r0], %r30
	.word 0xbe258000  ! 812: SUB_R	sub 	%r22, %r0, %r31
	mov	0, %r12
	.word 0xa1930000  ! 814: WRPR_GL_R	wrpr	%r12, %r0, %-
hwintr_2_39:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_39), 16, 16)) -> intp(2, 0, 38)
	.word 0xf64c0000  ! 822: LDSB_R	ldsb	[%r16 + %r0], %r27
	setx	0x6134a0fe0000c953, %g1, %r10
	.word 0x839a8000  ! 824: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xbf510000  ! 829: RDPR_TICK	<illegal instruction>
	.word 0xfe04a14c  ! 830: LDUW_I	lduw	[%r18 + 0x014c], %r31
	.word 0xba450000  ! 834: ADDC_R	addc 	%r20, %r0, %r29
	.word 0xfc4c6157  ! 835: LDSB_I	ldsb	[%r17 + 0x0157], %r30
	.word 0x8195a131  ! 837: WRPR_TPC_I	wrpr	%r22, 0x0131, %tpc
	.word 0xf6052134  ! 838: LDUW_I	lduw	[%r20 + 0x0134], %r27
	.word 0xf004c000  ! 842: LDUW_R	lduw	[%r19 + %r0], %r24
	.word 0xb5500000  ! 843: RDPR_TPC	<illegal instruction>
	.word 0xf60ca175  ! 844: LDUB_I	ldub	[%r18 + 0x0175], %r27
	.word 0xf254c000  ! 848: LDSH_R	ldsh	[%r19 + %r0], %r25
hwintr_2_40:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_40), 16, 16)) -> intp(2, 0, 31)
	.word 0x9194211f  ! 850: WRPR_PIL_I	wrpr	%r16, 0x011f, %pil
	.word 0xfa5dc000  ! 852: LDX_R	ldx	[%r23 + %r0], %r29
	.word 0x8394e026  ! 857: WRPR_TNPC_I	wrpr	%r19, 0x0026, %tnpc
	.word 0x8d95e180  ! 858: WRPR_PSTATE_I	wrpr	%r23, 0x0180, %pstate
	.word 0xb49c0000  ! 859: XORcc_R	xorcc 	%r16, %r0, %r26
	.word 0xbd480000  ! 862: RDHPR_HPSTATE	rdhpr	%hpstate, %r30
	.word 0xf81da05f  ! 863: LDD_I	ldd	[%r22 + 0x005f], %r28
	.word 0xf01d0000  ! 865: LDD_R	ldd	[%r20 + %r0], %r24
	setx	0xeb4a50990000ea98, %g1, %r10
	.word 0x819a8000  ! 867: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0x8994e076  ! 868: WRPR_TICK_I	wrpr	%r19, 0x0076, %tick
	.word 0xf445a125  ! 871: LDSW_I	ldsw	[%r22 + 0x0125], %r26
	mov	0, %r12
	.word 0xa1930000  ! 874: WRPR_GL_R	wrpr	%r12, %r0, %-
	setx	data_start_3, %g1, %r23
	mov	0, %r12
	.word 0xa1930000  ! 877: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0x919461b8  ! 878: WRPR_PIL_I	wrpr	%r17, 0x01b8, %pil
	.word 0xfe0420e3  ! 879: LDUW_I	lduw	[%r16 + 0x00e3], %r31
	.word 0xf205615b  ! 880: LDUW_I	lduw	[%r21 + 0x015b], %r25
	.word 0xf054c000  ! 882: LDSH_R	ldsh	[%r19 + %r0], %r24
hwintr_2_41:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_41), 16, 16)) -> intp(2, 0, 27)
	.word 0xf20d4000  ! 887: LDUB_R	ldub	[%r21 + %r0], %r25
	.word 0xfc4d4000  ! 888: LDSB_R	ldsb	[%r21 + %r0], %r30
	.word 0xf40d0000  ! 891: LDUB_R	ldub	[%r20 + %r0], %r26
hwintr_2_42:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_42), 16, 16)) -> intp(2, 0, d)
	.word 0xfe1c6138  ! 899: LDD_I	ldd	[%r17 + 0x0138], %r31
	.word 0xf60ce067  ! 901: LDUB_I	ldub	[%r19 + 0x0067], %r27
	.word 0xbc05a104  ! 904: ADD_I	add 	%r22, 0x0104, %r30
	.word 0xfa44e12e  ! 906: LDSW_I	ldsw	[%r19 + 0x012e], %r29
hwintr_2_43:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_43), 16, 16)) -> intp(2, 0, 2f)
	.word 0xb9540000  ! 909: RDPR_GL	<illegal instruction>
	.word 0xf4154000  ! 910: LDUH_R	lduh	[%r21 + %r0], %r26
	.word 0x87942053  ! 914: WRPR_TT_I	wrpr	%r16, 0x0053, %tt
	.word 0xf6554000  ! 917: LDSH_R	ldsh	[%r21 + %r0], %r27
	.word 0xfa4c61dc  ! 921: LDSB_I	ldsb	[%r17 + 0x01dc], %r29
	.word 0xb9508000  ! 923: RDPR_TSTATE	<illegal instruction>
	.word 0x8795e0e1  ! 924: WRPR_TT_I	wrpr	%r23, 0x00e1, %tt
hwintr_2_44:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_44), 16, 16)) -> intp(2, 0, 27)
	setx	data_start_2, %g1, %r17
	.word 0x919461cd  ! 931: WRPR_PIL_I	wrpr	%r17, 0x01cd, %pil
	.word 0xfc458000  ! 932: LDSW_R	ldsw	[%r22 + %r0], %r30
	.word 0xfc044000  ! 934: LDUW_R	lduw	[%r17 + %r0], %r30
	.word 0x8195e18b  ! 935: WRPR_TPC_I	wrpr	%r23, 0x018b, %tpc
	.word 0xb1500000  ! 938: RDPR_TPC	<illegal instruction>
	.word 0xf40d8000  ! 939: LDUB_R	ldub	[%r22 + %r0], %r26
	.word 0xb33d0000  ! 940: SRA_R	sra 	%r20, %r0, %r25
	.word 0xf24c4000  ! 942: LDSB_R	ldsb	[%r17 + %r0], %r25
	.word 0x879521a5  ! 946: WRPR_TT_I	wrpr	%r20, 0x01a5, %tt
	.word 0x8d9561f3  ! 947: WRPR_PSTATE_I	wrpr	%r21, 0x01f3, %pstate
	setx	data_start_2, %g1, %r19
	.word 0xf2142097  ! 955: LDUH_I	lduh	[%r16 + 0x0097], %r25
	.word 0xf21dc000  ! 956: LDD_R	ldd	[%r23 + %r0], %r25
	.word 0xfa4dc000  ! 957: LDSB_R	ldsb	[%r23 + %r0], %r29
	.word 0xf445a1a9  ! 958: LDSW_I	ldsw	[%r22 + 0x01a9], %r26
	.word 0xbc254000  ! 959: SUB_R	sub 	%r21, %r0, %r30
	.word 0xbf518000  ! 961: RDPR_PSTATE	<illegal instruction>
	.word 0xb8048000  ! 963: ADD_R	add 	%r18, %r0, %r28
	.word 0x9194e00d  ! 965: WRPR_PIL_I	wrpr	%r19, 0x000d, %pil
	.word 0xb5520000  ! 966: RDPR_PIL	<illegal instruction>
	mov	2, %r12
	.word 0xa1930000  ! 971: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xf21de126  ! 974: LDD_I	ldd	[%r23 + 0x0126], %r25
	.word 0x8d95e1b2  ! 980: WRPR_PSTATE_I	wrpr	%r23, 0x01b2, %pstate
	.word 0xfa1d20f9  ! 983: LDD_I	ldd	[%r20 + 0x00f9], %r29
	.word 0xf45420b5  ! 987: LDSH_I	ldsh	[%r16 + 0x00b5], %r26
	setx	0xe40692f700000986, %g1, %r10
	.word 0x839a8000  ! 992: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xf11c0000  ! 994: LDDF_R	ldd	[%r16, %r0], %f24
	.word 0xb9520000  ! 995: RDPR_PIL	<illegal instruction>
	.word 0xf4544000  ! 996: LDSH_R	ldsh	[%r17 + %r0], %r26
	.word 0xf055e12a  ! 998: LDSH_I	ldsh	[%r23 + 0x012a], %r24
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_1:
	.word 0xbba54920  ! 2: FMULs	fmuls	%f21, %f0, %f29
	.word 0xb9a4c840  ! 4: FADDd	faddd	%f50, %f0, %f28
	setx	data_start_1, %g1, %r23
	setx	data_start_6, %g1, %r17
	.word 0xbfa00020  ! 10: FMOVs	fmovs	%f0, %f31
hwintr_1_0:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_0), 16, 16)) -> intp(1, 0, 2e)
	.word 0xbbaa4820  ! 14: FMOVNE	fmovs	%fcc1, %f0, %f29
	mov	0, %r12
	.word 0x8f930000  ! 17: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xbfa94820  ! 18: FMOVCS	fmovs	%fcc1, %f0, %f31
	.word 0xb8a40000  ! 23: SUBcc_R	subcc 	%r16, %r0, %r28
	.word 0xbfa8c820  ! 27: FMOVL	fmovs	%fcc1, %f0, %f31
	.word 0x839460b4  ! 28: WRPR_TNPC_I	wrpr	%r17, 0x00b4, %tnpc
	.word 0xb3a48920  ! 31: FMULs	fmuls	%f18, %f0, %f25
	.word 0xba148000  ! 32: OR_R	or 	%r18, %r0, %r29
	.word 0xb9a50920  ! 34: FMULs	fmuls	%f20, %f0, %f28
	mov	1, %r12
	.word 0x8f930000  ! 35: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xb551c000  ! 37: RDPR_TL	<illegal instruction>
hwintr_1_1:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_1), 16, 16)) -> intp(1, 0, 22)
	.word 0xb9a84820  ! 42: FMOVE	fmovs	%fcc1, %f0, %f28
hwintr_1_2:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_2), 16, 16)) -> intp(1, 0, 13)
	.word 0xbda50820  ! 50: FADDs	fadds	%f20, %f0, %f30
hwintr_1_3:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_3), 16, 16)) -> intp(1, 0, e)
	.word 0xb1ab4820  ! 56: FMOVCC	fmovs	%fcc1, %f0, %f24
	.word 0x8d94617a  ! 57: WRPR_PSTATE_I	wrpr	%r17, 0x017a, %pstate
	.word 0xbdaac820  ! 58: FMOVGE	fmovs	%fcc1, %f0, %f30
	.word 0xb7480000  ! 60: RDHPR_HPSTATE	rdhpr	%hpstate, %r27
	.word 0xbba509e0  ! 62: FDIVq	dis not found

	.word 0xb5a80820  ! 63: FMOVN	fmovs	%fcc1, %f0, %f26
	.word 0xb3a90820  ! 64: FMOVLEU	fmovs	%fcc1, %f0, %f25
	.word 0xb3a488e0  ! 66: FSUBq	dis not found

	setx	data_start_6, %g1, %r17
hwintr_1_4:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_4), 16, 16)) -> intp(1, 0, 3b)
	.word 0xb5350000  ! 69: SRL_R	srl 	%r20, %r0, %r26
	.word 0xb9a50840  ! 70: FADDd	faddd	%f20, %f0, %f28
	setx	0xe55cae2300007b96, %g1, %r10
	.word 0x839a8000  ! 74: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	setx	data_start_5, %g1, %r16
	.word 0xb1a80c20  ! 77: FMOVRLZ	dis not found

hwintr_1_5:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_5), 16, 16)) -> intp(1, 0, 21)
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0x919521bf  ! 82: WRPR_PIL_I	wrpr	%r20, 0x01bf, %pil
	setx	data_start_6, %g1, %r18
	.word 0xb7a48860  ! 87: FADDq	dis not found

	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb1a4c8c0  ! 90: FSUBd	fsubd	%f50, %f0, %f24
	.word 0x8594e1d7  ! 91: WRPR_TSTATE_I	wrpr	%r19, 0x01d7, %tstate
	setx	0x1b62183b00006989, %g1, %r10
	.word 0x839a8000  ! 93: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb1a5c9e0  ! 94: FDIVq	dis not found

	.word 0xb5a4c820  ! 95: FADDs	fadds	%f19, %f0, %f26
	.word 0xb4a5e0fc  ! 96: SUBcc_I	subcc 	%r23, 0x00fc, %r26
	.word 0xb9a88820  ! 100: FMOVLE	fmovs	%fcc1, %f0, %f28
	.word 0xb0c4a0e2  ! 102: ADDCcc_I	addccc 	%r18, 0x00e2, %r24
	.word 0xbda58960  ! 104: FMULq	dis not found

	.word 0xbf508000  ! 105: RDPR_TSTATE	<illegal instruction>
	.word 0xb9aa8820  ! 109: FMOVG	fmovs	%fcc1, %f0, %f28
	.word 0xbabd8000  ! 110: XNORcc_R	xnorcc 	%r22, %r0, %r29
	.word 0xb9a80420  ! 111: FMOVRZ	dis not found

hwintr_1_6:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_6), 16, 16)) -> intp(1, 0, 16)
	.word 0xb12c4000  ! 114: SLL_R	sll 	%r17, %r0, %r24
	.word 0xb5abc820  ! 115: FMOVVC	fmovs	%fcc1, %f0, %f26
	.word 0x81942015  ! 116: WRPR_TPC_I	wrpr	%r16, 0x0015, %tpc
	.word 0xb7a8c820  ! 117: FMOVL	fmovs	%fcc1, %f0, %f27
	.word 0xb3aa4820  ! 119: FMOVNE	fmovs	%fcc1, %f0, %f25
	.word 0x8595a15a  ! 123: WRPR_TSTATE_I	wrpr	%r22, 0x015a, %tstate
	.word 0xbe2560e4  ! 125: SUB_I	sub 	%r21, 0x00e4, %r31
	mov	1, %r12
	.word 0x8f930000  ! 126: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xbda00540  ! 130: FSQRTd	fsqrt	
	.word 0xbebde1e5  ! 131: XNORcc_I	xnorcc 	%r23, 0x01e5, %r31
hwintr_1_7:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_7), 16, 16)) -> intp(1, 0, 2c)
	.word 0xb7aac820  ! 135: FMOVGE	fmovs	%fcc1, %f0, %f27
hwintr_1_8:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_8), 16, 16)) -> intp(1, 0, 7)
	.word 0xb4942149  ! 137: ORcc_I	orcc 	%r16, 0x0149, %r26
	.word 0xb2b520f3  ! 138: ORNcc_I	orncc 	%r20, 0x00f3, %r25
	.word 0xb7520000  ! 141: RDPR_PIL	<illegal instruction>
	.word 0xb9520000  ! 144: RDPR_PIL	<illegal instruction>
	.word 0xb7ab0820  ! 153: FMOVGU	fmovs	%fcc1, %f0, %f27
	.word 0xb5a588c0  ! 155: FSUBd	fsubd	%f22, %f0, %f26
	.word 0xb9aa4820  ! 157: FMOVNE	fmovs	%fcc1, %f0, %f28
	.word 0xb9a9c820  ! 158: FMOVVS	fmovs	%fcc1, %f0, %f28
hwintr_1_9:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_9), 16, 16)) -> intp(1, 0, 5)
hwintr_1_10:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_10), 16, 16)) -> intp(1, 0, 10)
	mov	1, %r12
	.word 0xa1930000  ! 162: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb7a5c8a0  ! 164: FSUBs	fsubs	%f23, %f0, %f27
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbeb4209b  ! 178: SUBCcc_I	orncc 	%r16, 0x009b, %r31
	.word 0xb1a00040  ! 180: FMOVd	fmovd	%f0, %f24
	.word 0xb5a84820  ! 181: FMOVE	fmovs	%fcc1, %f0, %f26
	mov	0, %r12
	.word 0x8f930000  ! 182: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xbbaa4820  ! 185: FMOVNE	fmovs	%fcc1, %f0, %f29
	setx	0x9d1aa31e00008b1f, %g1, %r10
	.word 0x819a8000  ! 186: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	setx	data_start_2, %g1, %r21
	.word 0xbfaa8820  ! 190: FMOVG	fmovs	%fcc1, %f0, %f31
	.word 0xbb504000  ! 193: RDPR_TNPC	<illegal instruction>
	.word 0xb3ab4820  ! 194: FMOVCC	fmovs	%fcc1, %f0, %f25
	.word 0xb7480000  ! 196: RDHPR_HPSTATE	rdhpr	%hpstate, %r27
	.word 0xba8c4000  ! 197: ANDcc_R	andcc 	%r17, %r0, %r29
	.word 0xb5518000  ! 198: RDPR_PSTATE	<illegal instruction>
	.word 0xb69d0000  ! 201: XORcc_R	xorcc 	%r20, %r0, %r27
	.word 0xb3a98820  ! 202: FMOVNEG	fmovs	%fcc1, %f0, %f25
	.word 0xb9a8c820  ! 203: FMOVL	fmovs	%fcc1, %f0, %f28
	setx	data_start_4, %g1, %r19
hwintr_1_11:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_11), 16, 16)) -> intp(1, 0, 1e)
	.word 0xbb510000  ! 208: RDPR_TICK	<illegal instruction>
	.word 0x8d95a1fc  ! 210: WRPR_PSTATE_I	wrpr	%r22, 0x01fc, %pstate
	.word 0xb7508000  ! 214: RDPR_TSTATE	<illegal instruction>
	.word 0xb3643801  ! 215: MOVcc_I	<illegal instruction>
	.word 0xbfa80820  ! 216: FMOVN	fmovs	%fcc1, %f0, %f31
	.word 0xb3a508e0  ! 219: FSUBq	dis not found

	.word 0xb5a44960  ! 221: FMULq	dis not found

	.word 0xbfa81820  ! 223: FMOVRGZ	fmovs	%fcc3, %f0, %f31
	.word 0xbbaa4820  ! 224: FMOVNE	fmovs	%fcc1, %f0, %f29
	.word 0xb0148000  ! 225: OR_R	or 	%r18, %r0, %r24
	.word 0xbf518000  ! 226: RDPR_PSTATE	<illegal instruction>
	.word 0x819561b3  ! 228: WRPR_TPC_I	wrpr	%r21, 0x01b3, %tpc
	.word 0xb5a84820  ! 230: FMOVE	fmovs	%fcc1, %f0, %f26
	.word 0xbd500000  ! 237: RDPR_TPC	<illegal instruction>
	.word 0xb3ab0820  ! 240: FMOVGU	fmovs	%fcc1, %f0, %f25
	.word 0xbba589a0  ! 244: FDIVs	fdivs	%f22, %f0, %f29
	.word 0xb5a5c960  ! 246: FMULq	dis not found

	.word 0xbfa50860  ! 247: FADDq	dis not found

	.word 0xb23de102  ! 249: XNOR_I	xnor 	%r23, 0x0102, %r25
	.word 0x9194a1de  ! 253: WRPR_PIL_I	wrpr	%r18, 0x01de, %pil
	setx	data_start_6, %g1, %r21
	.word 0xbfa8c820  ! 260: FMOVL	fmovs	%fcc1, %f0, %f31
	.word 0xb335b001  ! 261: SRLX_I	srlx	%r22, 0x0001, %r25
hwintr_1_12:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_12), 16, 16)) -> intp(1, 0, f)
hwintr_1_13:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_13), 16, 16)) -> intp(1, 0, c)
	.word 0xb9a9c820  ! 265: FMOVVS	fmovs	%fcc1, %f0, %f28
	mov	0, %r12
	.word 0xa1930000  ! 266: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb7a40920  ! 267: FMULs	fmuls	%f16, %f0, %f27
	.word 0xbba5c9a0  ! 268: FDIVs	fdivs	%f23, %f0, %f29
	.word 0xbdab8820  ! 269: FMOVPOS	fmovs	%fcc1, %f0, %f30
	.word 0xbfa44820  ! 270: FADDs	fadds	%f17, %f0, %f31
	.word 0xbf50c000  ! 271: RDPR_TT	<illegal instruction>
	.word 0x8d956105  ! 275: WRPR_PSTATE_I	wrpr	%r21, 0x0105, %pstate
	.word 0xbb355000  ! 278: SRLX_R	srlx	%r21, %r0, %r29
	.word 0xb9a00040  ! 279: FMOVd	fmovd	%f0, %f28
	.word 0xb7a44860  ! 280: FADDq	dis not found

	.word 0xb5a00520  ! 284: FSQRTs	fsqrt	
	.word 0xbfa4c960  ! 288: FMULq	dis not found

hwintr_1_14:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_14), 16, 16)) -> intp(1, 0, 26)
	.word 0xb5a50960  ! 292: FMULq	dis not found

	.word 0xb7a4c840  ! 293: FADDd	faddd	%f50, %f0, %f58
	.word 0xb7a00520  ! 294: FSQRTs	fsqrt	
	.word 0xb7a00520  ! 295: FSQRTs	fsqrt	
	.word 0xb5a00540  ! 297: FSQRTd	fsqrt	
	.word 0xb7518000  ! 299: RDPR_PSTATE	<illegal instruction>
hwintr_1_15:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_15), 16, 16)) -> intp(1, 0, 23)
	.word 0xba0d61ee  ! 303: AND_I	and 	%r21, 0x01ee, %r29
	.word 0xbf2c0000  ! 307: SLL_R	sll 	%r16, %r0, %r31
hwintr_1_16:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_16), 16, 16)) -> intp(1, 0, 15)
	.word 0xbdab8820  ! 309: FMOVPOS	fmovs	%fcc1, %f0, %f30
	.word 0xb9a94820  ! 310: FMOVCS	fmovs	%fcc1, %f0, %f28
	.word 0xbba9c820  ! 312: FMOVVS	fmovs	%fcc1, %f0, %f29
	.word 0xbf500000  ! 313: RDPR_TPC	<illegal instruction>
	.word 0xb41c0000  ! 314: XOR_R	xor 	%r16, %r0, %r26
	.word 0xb9a588a0  ! 315: FSUBs	fsubs	%f22, %f0, %f28
	.word 0xbfa54940  ! 319: FMULd	fmuld	%f52, %f0, %f62
	.word 0xb1a50940  ! 320: FMULd	fmuld	%f20, %f0, %f24
	.word 0x839521ed  ! 322: WRPR_TNPC_I	wrpr	%r20, 0x01ed, %tnpc
	.word 0xb3ab4820  ! 329: FMOVCC	fmovs	%fcc1, %f0, %f25
	.word 0xbfa58940  ! 330: FMULd	fmuld	%f22, %f0, %f62
	.word 0xb151c000  ! 334: RDPR_TL	<illegal instruction>
	.word 0x8395a09e  ! 335: WRPR_TNPC_I	wrpr	%r22, 0x009e, %tnpc
	.word 0xbdab8820  ! 336: FMOVPOS	fmovs	%fcc1, %f0, %f30
	.word 0xb7a44860  ! 337: FADDq	dis not found

hwintr_1_17:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_17), 16, 16)) -> intp(1, 0, 3a)
	.word 0xb5a00540  ! 345: FSQRTd	fsqrt	
hwintr_1_18:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_18), 16, 16)) -> intp(1, 0, 21)
	.word 0xb5a00540  ! 348: FSQRTd	fsqrt	
	.word 0xbb540000  ! 352: RDPR_GL	<illegal instruction>
	.word 0xbba98820  ! 353: FMOVNEG	fmovs	%fcc1, %f0, %f29
	.word 0xb1520000  ! 355: RDPR_PIL	<illegal instruction>
	.word 0xbba80c20  ! 358: FMOVRLZ	dis not found

	.word 0xb2c4e004  ! 359: ADDCcc_I	addccc 	%r19, 0x0004, %r25
	.word 0x8594a019  ! 361: WRPR_TSTATE_I	wrpr	%r18, 0x0019, %tstate
	.word 0xbd518000  ! 362: RDPR_PSTATE	<illegal instruction>
	.word 0xbda84820  ! 363: FMOVE	fmovs	%fcc1, %f0, %f30
	mov	1, %r12
	.word 0x8f930000  ! 366: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xb5a00540  ! 370: FSQRTd	fsqrt	
	.word 0xb7aa8820  ! 371: FMOVG	fmovs	%fcc1, %f0, %f27
	.word 0xb1518000  ! 377: RDPR_PSTATE	<illegal instruction>
	.word 0xb9a58820  ! 379: FADDs	fadds	%f22, %f0, %f28
	.word 0xb9a589a0  ! 382: FDIVs	fdivs	%f22, %f0, %f28
	.word 0xb5a408c0  ! 383: FSUBd	fsubd	%f16, %f0, %f26
	.word 0xb5540000  ! 384: RDPR_GL	<illegal instruction>
	.word 0xbda588a0  ! 385: FSUBs	fsubs	%f22, %f0, %f30
	.word 0x8d94604b  ! 389: WRPR_PSTATE_I	wrpr	%r17, 0x004b, %pstate
	.word 0xbba00560  ! 391: FSQRTq	fsqrt	
	.word 0xb3a90820  ! 392: FMOVLEU	fmovs	%fcc1, %f0, %f25
	.word 0xb1480000  ! 396: RDHPR_HPSTATE	rdhpr	%hpstate, %r24
	.word 0xb3a84820  ! 397: FMOVE	fmovs	%fcc1, %f0, %f25
hwintr_1_19:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_19), 16, 16)) -> intp(1, 0, 3)
	.word 0xb3a44940  ! 400: FMULd	fmuld	%f48, %f0, %f56
	.word 0xbb50c000  ! 401: RDPR_TT	<illegal instruction>
hwintr_1_20:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_20), 16, 16)) -> intp(1, 0, 36)
	.word 0xb9a58860  ! 406: FADDq	dis not found

	.word 0xb7510000  ! 407: RDPR_TICK	<illegal instruction>
	.word 0xbba84820  ! 408: FMOVE	fmovs	%fcc1, %f0, %f29
	.word 0xb6440000  ! 409: ADDC_R	addc 	%r16, %r0, %r27
	.word 0xb9a489e0  ! 410: FDIVq	dis not found

	.word 0xbda00540  ! 411: FSQRTd	fsqrt	
	.word 0xb3a00560  ! 412: FSQRTq	fsqrt	
	.word 0xb7a408e0  ! 416: FSUBq	dis not found

	.word 0xbba44860  ! 419: FADDq	dis not found

	.word 0x9194e0fa  ! 421: WRPR_PIL_I	wrpr	%r19, 0x00fa, %pil
	.word 0x819461b8  ! 423: WRPR_TPC_I	wrpr	%r17, 0x01b8, %tpc
	.word 0xb5abc820  ! 428: FMOVVC	fmovs	%fcc1, %f0, %f26
	.word 0xb7480000  ! 430: RDHPR_HPSTATE	rdhpr	%hpstate, %r27
	.word 0x8995616d  ! 434: WRPR_TICK_I	wrpr	%r21, 0x016d, %tick
	.word 0xb5a88820  ! 437: FMOVLE	fmovs	%fcc1, %f0, %f26
	.word 0xb3a81c20  ! 441: FMOVRGEZ	dis not found

	.word 0xbfab0820  ! 444: FMOVGU	fmovs	%fcc1, %f0, %f31
	.word 0xbd51c000  ! 446: RDPR_TL	<illegal instruction>
	.word 0xb1508000  ! 454: RDPR_TSTATE	<illegal instruction>
hwintr_1_21:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_21), 16, 16)) -> intp(1, 0, 6)
	.word 0xb3510000  ! 462: RDPR_TICK	<illegal instruction>
	.word 0xb5a589a0  ! 464: FDIVs	fdivs	%f22, %f0, %f26
	.word 0xbeade0d9  ! 466: ANDNcc_I	andncc 	%r23, 0x00d9, %r31
	.word 0xb550c000  ! 469: RDPR_TT	<illegal instruction>
	.word 0xb9349000  ! 471: SRLX_R	srlx	%r18, %r0, %r28
	.word 0xb63da129  ! 474: XNOR_I	xnor 	%r22, 0x0129, %r27
	.word 0xb5518000  ! 475: RDPR_PSTATE	<illegal instruction>
	.word 0xbfa58920  ! 476: FMULs	fmuls	%f22, %f0, %f31
	.word 0xb9a94820  ! 478: FMOVCS	fmovs	%fcc1, %f0, %f28
	.word 0xb4b5a0ae  ! 479: ORNcc_I	orncc 	%r22, 0x00ae, %r26
	setx	0x69b15bc40000bd98, %g1, %r10
	.word 0x839a8000  ! 482: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb9a54840  ! 484: FADDd	faddd	%f52, %f0, %f28
	.word 0xbb518000  ! 485: RDPR_PSTATE	<illegal instruction>
	.word 0xbba4c860  ! 487: FADDq	dis not found

	.word 0xbfa00560  ! 488: FSQRTq	fsqrt	
	.word 0xb5a00540  ! 491: FSQRTd	fsqrt	
	.word 0x8d9420a9  ! 493: WRPR_PSTATE_I	wrpr	%r16, 0x00a9, %pstate
	.word 0xbda90820  ! 495: FMOVLEU	fmovs	%fcc1, %f0, %f30
hwintr_1_22:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_22), 16, 16)) -> intp(1, 0, 30)
	.word 0xb5348000  ! 499: SRL_R	srl 	%r18, %r0, %r26
	.word 0xbd508000  ! 501: RDPR_TSTATE	<illegal instruction>
	.word 0xbd500000  ! 502: RDPR_TPC	<illegal instruction>
	.word 0xbda94820  ! 505: FMOVCS	fmovs	%fcc1, %f0, %f30
	.word 0xb1a88820  ! 506: FMOVLE	fmovs	%fcc1, %f0, %f24
	.word 0x8395e183  ! 508: WRPR_TNPC_I	wrpr	%r23, 0x0183, %tnpc
hwintr_1_23:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_23), 16, 16)) -> intp(1, 0, 29)
	.word 0xbba80820  ! 513: FMOVN	fmovs	%fcc1, %f0, %f29
	.word 0xbfaa8820  ! 514: FMOVG	fmovs	%fcc1, %f0, %f31
	.word 0xb9a80c20  ! 515: FMOVRLZ	dis not found

hwintr_1_24:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_24), 16, 16)) -> intp(1, 0, a)
	mov	2, %r12
	.word 0x8f930000  ! 521: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xb3a589e0  ! 522: FDIVq	dis not found

	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
hwintr_1_25:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_25), 16, 16)) -> intp(1, 0, 3f)
	.word 0xb3ab0820  ! 527: FMOVGU	fmovs	%fcc1, %f0, %f25
	.word 0xb7aa4820  ! 528: FMOVNE	fmovs	%fcc1, %f0, %f27
	setx	0x21c50670000da4c, %g1, %r10
	.word 0x839a8000  ! 530: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb7a48860  ! 532: FADDq	dis not found

hwintr_1_26:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_26), 16, 16)) -> intp(1, 0, 5)
	.word 0xb7a409a0  ! 535: FDIVs	fdivs	%f16, %f0, %f27
	.word 0xbda00560  ! 537: FSQRTq	fsqrt	
	setx	0xd86a43ea0000cf12, %g1, %r10
	.word 0x839a8000  ! 539: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xbda4c8e0  ! 540: FSUBq	dis not found

	.word 0xb9a48940  ! 541: FMULd	fmuld	%f18, %f0, %f28
	.word 0xbb500000  ! 542: RDPR_TPC	<illegal instruction>
	.word 0x8394e0ba  ! 543: WRPR_TNPC_I	wrpr	%r19, 0x00ba, %tnpc
	.word 0xb151c000  ! 544: RDPR_TL	<illegal instruction>
	.word 0xbf540000  ! 547: RDPR_GL	<illegal instruction>
	.word 0xbda589c0  ! 551: FDIVd	fdivd	%f22, %f0, %f30
	setx	data_start_4, %g1, %r19
	setx	data_start_4, %g1, %r18
	.word 0xb9518000  ! 557: RDPR_PSTATE	<illegal instruction>
	.word 0xbfa8c820  ! 558: FMOVL	fmovs	%fcc1, %f0, %f31
hwintr_1_27:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_27), 16, 16)) -> intp(1, 0, 3c)
	.word 0xb550c000  ! 561: RDPR_TT	<illegal instruction>
	.word 0xbba508c0  ! 564: FSUBd	fsubd	%f20, %f0, %f60
	.word 0xb5aa8820  ! 566: FMOVG	fmovs	%fcc1, %f0, %f26
	.word 0xb5348000  ! 568: SRL_R	srl 	%r18, %r0, %r26
	.word 0xbbab4820  ! 570: FMOVCC	fmovs	%fcc1, %f0, %f29
	.word 0xbbaa0820  ! 571: FMOVA	fmovs	%fcc1, %f0, %f29
	.word 0xb4b44000  ! 574: ORNcc_R	orncc 	%r17, %r0, %r26
	setx	0x4628852f00002b16, %g1, %r10
	.word 0x819a8000  ! 577: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xb9a58860  ! 578: FADDq	dis not found

	.word 0xb7345000  ! 579: SRLX_R	srlx	%r17, %r0, %r27
	.word 0xb3a409a0  ! 583: FDIVs	fdivs	%f16, %f0, %f25
	.word 0xb84521ab  ! 585: ADDC_I	addc 	%r20, 0x01ab, %r28
	.word 0xbba488e0  ! 587: FSUBq	dis not found

	.word 0xb5aac820  ! 590: FMOVGE	fmovs	%fcc1, %f0, %f26
	.word 0xbda9c820  ! 591: FMOVVS	fmovs	%fcc1, %f0, %f30
	.word 0xb3500000  ! 593: RDPR_TPC	<illegal instruction>
	setx	data_start_2, %g1, %r19
	.word 0x81942040  ! 596: WRPR_TPC_I	wrpr	%r16, 0x0040, %tpc
	.word 0xbb358000  ! 602: SRL_R	srl 	%r22, %r0, %r29
	.word 0xbf510000  ! 603: RDPR_TICK	<illegal instruction>
	.word 0x8994600e  ! 605: WRPR_TICK_I	wrpr	%r17, 0x000e, %tick
	mov	0, %r12
	.word 0x8f930000  ! 606: WRPR_TL_R	wrpr	%r12, %r0, %tl
hwintr_1_28:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_28), 16, 16)) -> intp(1, 0, 28)
	.word 0xb1a508c0  ! 610: FSUBd	fsubd	%f20, %f0, %f24
	.word 0xb1a5c8e0  ! 620: FSUBq	dis not found

	.word 0x8195e1fd  ! 621: WRPR_TPC_I	wrpr	%r23, 0x01fd, %tpc
	.word 0xb41d4000  ! 623: XOR_R	xor 	%r21, %r0, %r26
	.word 0xb0150000  ! 625: OR_R	or 	%r20, %r0, %r24
	.word 0xbb34c000  ! 626: SRL_R	srl 	%r19, %r0, %r29
	.word 0xb3a81420  ! 628: FMOVRNZ	dis not found

	.word 0xbd520000  ! 630: RDPR_PIL	<illegal instruction>
	.word 0xbfaac820  ! 631: FMOVGE	fmovs	%fcc1, %f0, %f31
	.word 0xbfab0820  ! 632: FMOVGU	fmovs	%fcc1, %f0, %f31
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb1480000  ! 634: RDHPR_HPSTATE	rdhpr	%hpstate, %r24
	.word 0xb6244000  ! 635: SUB_R	sub 	%r17, %r0, %r27
	.word 0x8395618b  ! 636: WRPR_TNPC_I	wrpr	%r21, 0x018b, %tnpc
	.word 0xbf352001  ! 637: SRL_I	srl 	%r20, 0x0001, %r31
	.word 0xbfa58960  ! 638: FMULq	dis not found

	.word 0xb1a81420  ! 639: FMOVRNZ	dis not found

hwintr_1_29:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_29), 16, 16)) -> intp(1, 0, 15)
	.word 0x8394e080  ! 645: WRPR_TNPC_I	wrpr	%r19, 0x0080, %tnpc
	.word 0xb3aa8820  ! 646: FMOVG	fmovs	%fcc1, %f0, %f25
	setx	data_start_0, %g1, %r22
	.word 0xb3ab0820  ! 648: FMOVGU	fmovs	%fcc1, %f0, %f25
	.word 0xbda90820  ! 653: FMOVLEU	fmovs	%fcc1, %f0, %f30
	.word 0xb3a00040  ! 654: FMOVd	fmovd	%f0, %f56
hwintr_1_30:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_30), 16, 16)) -> intp(1, 0, 9)
	.word 0xbda90820  ! 656: FMOVLEU	fmovs	%fcc1, %f0, %f30
hwintr_1_31:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_31), 16, 16)) -> intp(1, 0, 1c)
	setx	data_start_0, %g1, %r18
	.word 0x8395a137  ! 659: WRPR_TNPC_I	wrpr	%r22, 0x0137, %tnpc
	.word 0xbf51c000  ! 661: RDPR_TL	<illegal instruction>
	.word 0x8195e000  ! 662: WRPR_TPC_I	wrpr	%r23, 0x0000, %tpc
	.word 0xb1a81820  ! 663: FMOVRGZ	fmovs	%fcc3, %f0, %f24
	.word 0x8795a1b2  ! 666: WRPR_TT_I	wrpr	%r22, 0x01b2, %tt
	mov	1, %r12
	.word 0xa1930000  ! 667: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xbda5c860  ! 670: FADDq	dis not found

	.word 0xb9aa8820  ! 672: FMOVG	fmovs	%fcc1, %f0, %f28
	.word 0xb5a00560  ! 676: FSQRTq	fsqrt	
	.word 0xb1508000  ! 677: RDPR_TSTATE	<illegal instruction>
hwintr_1_32:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_32), 16, 16)) -> intp(1, 0, 37)
	.word 0xb6b40000  ! 684: ORNcc_R	orncc 	%r16, %r0, %r27
hwintr_1_33:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_33), 16, 16)) -> intp(1, 0, 38)
hwintr_1_34:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_34), 16, 16)) -> intp(1, 0, 1f)
	.word 0xb3a80420  ! 690: FMOVRZ	dis not found

	.word 0xbd518000  ! 693: RDPR_PSTATE	<illegal instruction>
hwintr_1_35:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_35), 16, 16)) -> intp(1, 0, 16)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb434a039  ! 708: ORN_I	orn 	%r18, 0x0039, %r26
	.word 0xb1ab4820  ! 709: FMOVCC	fmovs	%fcc1, %f0, %f24
	.word 0xbebda083  ! 711: XNORcc_I	xnorcc 	%r22, 0x0083, %r31
	mov	0, %r12
	.word 0xa1930000  ! 712: WRPR_GL_R	wrpr	%r12, %r0, %-
	mov	0, %r12
	.word 0xa1930000  ! 713: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb3a5c8a0  ! 714: FSUBs	fsubs	%f23, %f0, %f25
	.word 0x8d95205a  ! 716: WRPR_PSTATE_I	wrpr	%r20, 0x005a, %pstate
	.word 0xbb50c000  ! 717: RDPR_TT	<illegal instruction>
	.word 0xbda00520  ! 719: FSQRTs	fsqrt	
	.word 0xbda00520  ! 722: FSQRTs	fsqrt	
	.word 0xb1510000  ! 724: RDPR_TICK	<illegal instruction>
	.word 0xbda00040  ! 725: FMOVd	fmovd	%f0, %f30
	.word 0xb9a80820  ! 726: FMOVRLEZ	fmovs	%fcc1, %f0, %f28
	.word 0xbf2d6001  ! 728: SLL_I	sll 	%r21, 0x0001, %r31
	setx	data_start_6, %g1, %r22
	.word 0xbeb5a179  ! 741: SUBCcc_I	orncc 	%r22, 0x0179, %r31
	.word 0x8195e020  ! 742: WRPR_TPC_I	wrpr	%r23, 0x0020, %tpc
	.word 0xb3aac820  ! 743: FMOVGE	fmovs	%fcc1, %f0, %f25
hwintr_1_36:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_36), 16, 16)) -> intp(1, 0, 3b)
	.word 0xbba589a0  ! 747: FDIVs	fdivs	%f22, %f0, %f29
	.word 0xbda449c0  ! 748: FDIVd	fdivd	%f48, %f0, %f30
	.word 0xb3a588e0  ! 749: FSUBq	dis not found

	.word 0xb7a80420  ! 750: FMOVRZ	dis not found

	setx	data_start_5, %g1, %r21
	.word 0xbfaa4820  ! 758: FMOVNE	fmovs	%fcc1, %f0, %f31
	.word 0xb9a00040  ! 760: FMOVd	fmovd	%f0, %f28
	.word 0xbfa80c20  ! 761: FMOVRLZ	dis not found

	.word 0xb1518000  ! 763: RDPR_PSTATE	<illegal instruction>
	.word 0x8594204e  ! 770: WRPR_TSTATE_I	wrpr	%r16, 0x004e, %tstate
	mov	1, %r12
	.word 0xa1930000  ! 772: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xbda94820  ! 773: FMOVCS	fmovs	%fcc1, %f0, %f30
hwintr_1_37:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_37), 16, 16)) -> intp(1, 0, 3)
	.word 0xb3a80820  ! 776: FMOVRLEZ	fmovs	%fcc1, %f0, %f25
	.word 0xb3508000  ! 778: RDPR_TSTATE	<illegal instruction>
hwintr_1_38:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_38), 16, 16)) -> intp(1, 0, 1c)
	.word 0x8d952047  ! 783: WRPR_PSTATE_I	wrpr	%r20, 0x0047, %pstate
	.word 0xb3a8c820  ! 784: FMOVL	fmovs	%fcc1, %f0, %f25
	.word 0xb3abc820  ! 786: FMOVVC	fmovs	%fcc1, %f0, %f25
	.word 0xb9a44820  ! 787: FADDs	fadds	%f17, %f0, %f28
	.word 0xbb500000  ! 789: RDPR_TPC	<illegal instruction>
	.word 0xbba54860  ! 791: FADDq	dis not found

	.word 0xb3a589c0  ! 792: FDIVd	fdivd	%f22, %f0, %f56
	.word 0xb33c9000  ! 793: SRAX_R	srax	%r18, %r0, %r25
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbba44920  ! 798: FMULs	fmuls	%f17, %f0, %f29
	.word 0xbfa488c0  ! 799: FSUBd	fsubd	%f18, %f0, %f62
	.word 0xb9a80820  ! 800: FMOVN	fmovs	%fcc1, %f0, %f28
	.word 0xbc040000  ! 804: ADD_R	add 	%r16, %r0, %r30
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb625c000  ! 812: SUB_R	sub 	%r23, %r0, %r27
	.word 0xb7a4c920  ! 813: FMULs	fmuls	%f19, %f0, %f27
	mov	1, %r12
	.word 0xa1930000  ! 814: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xbba488c0  ! 816: FSUBd	fsubd	%f18, %f0, %f60
hwintr_1_39:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_39), 16, 16)) -> intp(1, 0, 24)
	.word 0xb9a80c20  ! 821: FMOVRLZ	dis not found

	setx	0xdee6190100007b85, %g1, %r10
	.word 0x839a8000  ! 824: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xbfa00020  ! 826: FMOVs	fmovs	%f0, %f31
	.word 0xbd510000  ! 829: RDPR_TICK	<illegal instruction>
	.word 0xb1a40940  ! 832: FMULd	fmuld	%f16, %f0, %f24
	.word 0xb2458000  ! 834: ADDC_R	addc 	%r22, %r0, %r25
	.word 0x81946048  ! 837: WRPR_TPC_I	wrpr	%r17, 0x0048, %tpc
	.word 0xbda80420  ! 839: FMOVRZ	dis not found

	.word 0xb1a508c0  ! 841: FSUBd	fsubd	%f20, %f0, %f24
	.word 0xb9500000  ! 843: RDPR_TPC	<illegal instruction>
hwintr_1_40:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_40), 16, 16)) -> intp(1, 0, 19)
	.word 0x919421c7  ! 850: WRPR_PIL_I	wrpr	%r16, 0x01c7, %pil
	.word 0xbfa44940  ! 851: FMULd	fmuld	%f48, %f0, %f62
	.word 0xb7a00020  ! 853: FMOVs	fmovs	%f0, %f27
	.word 0x8394a076  ! 857: WRPR_TNPC_I	wrpr	%r18, 0x0076, %tnpc
	.word 0x8d95a1c2  ! 858: WRPR_PSTATE_I	wrpr	%r22, 0x01c2, %pstate
	.word 0xba9cc000  ! 859: XORcc_R	xorcc 	%r19, %r0, %r29
	.word 0xbfa81c20  ! 861: FMOVRGEZ	dis not found

	.word 0xb7480000  ! 862: RDHPR_HPSTATE	rdhpr	%hpstate, %r27
	.word 0xb5a409e0  ! 866: FDIVq	dis not found

	setx	0x8a8b6c790000ab0d, %g1, %r10
	.word 0x819a8000  ! 867: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0x8995e0cd  ! 868: WRPR_TICK_I	wrpr	%r23, 0x00cd, %tick
	.word 0xbda81820  ! 870: FMOVRGZ	fmovs	%fcc3, %f0, %f30
	.word 0xb3a4c8c0  ! 872: FSUBd	fsubd	%f50, %f0, %f56
	mov	1, %r12
	.word 0xa1930000  ! 874: WRPR_GL_R	wrpr	%r12, %r0, %-
	setx	data_start_0, %g1, %r22
	.word 0xb7ab0820  ! 876: FMOVGU	fmovs	%fcc1, %f0, %f27
	mov	2, %r12
	.word 0xa1930000  ! 877: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0x919460c4  ! 878: WRPR_PIL_I	wrpr	%r17, 0x00c4, %pil
	.word 0xb7a408c0  ! 881: FSUBd	fsubd	%f16, %f0, %f58
hwintr_1_41:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_41), 16, 16)) -> intp(1, 0, 1c)
	.word 0xb5a84820  ! 889: FMOVE	fmovs	%fcc1, %f0, %f26
hwintr_1_42:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_42), 16, 16)) -> intp(1, 0, 1b)
	.word 0xbfa00540  ! 896: FSQRTd	fsqrt	
	.word 0xbdabc820  ! 898: FMOVVC	fmovs	%fcc1, %f0, %f30
	.word 0xb605a07c  ! 904: ADD_I	add 	%r22, 0x007c, %r27
hwintr_1_43:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_43), 16, 16)) -> intp(1, 0, 37)
	.word 0xb3540000  ! 909: RDPR_GL	<illegal instruction>
	.word 0x87946038  ! 914: WRPR_TT_I	wrpr	%r17, 0x0038, %tt
	.word 0xb3a00520  ! 916: FSQRTs	fsqrt	
	.word 0xbba00520  ! 920: FSQRTs	fsqrt	
	.word 0xbf508000  ! 923: RDPR_TSTATE	<illegal instruction>
	.word 0x8794610e  ! 924: WRPR_TT_I	wrpr	%r17, 0x010e, %tt
	.word 0xb7a00540  ! 925: FSQRTd	fsqrt	
hwintr_1_44:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_44), 16, 16)) -> intp(1, 0, 7)
	setx	data_start_6, %g1, %r16
	.word 0x91942089  ! 931: WRPR_PIL_I	wrpr	%r16, 0x0089, %pil
	.word 0xbda48960  ! 933: FMULq	dis not found

	.word 0x8195a01b  ! 935: WRPR_TPC_I	wrpr	%r22, 0x001b, %tpc
	.word 0xb7500000  ! 938: RDPR_TPC	<illegal instruction>
	.word 0xb33cc000  ! 940: SRA_R	sra 	%r19, %r0, %r25
	.word 0x8795e1dd  ! 946: WRPR_TT_I	wrpr	%r23, 0x01dd, %tt
	.word 0x8d95a165  ! 947: WRPR_PSTATE_I	wrpr	%r22, 0x0165, %pstate
	setx	data_start_5, %g1, %r21
	.word 0xbfa81c20  ! 950: FMOVRGEZ	dis not found

	.word 0xb1a90820  ! 952: FMOVLEU	fmovs	%fcc1, %f0, %f24
	.word 0xbc240000  ! 959: SUB_R	sub 	%r16, %r0, %r30
	.word 0xbba88820  ! 960: FMOVLE	fmovs	%fcc1, %f0, %f29
	.word 0xb7518000  ! 961: RDPR_PSTATE	<illegal instruction>
	.word 0xb0058000  ! 963: ADD_R	add 	%r22, %r0, %r24
	.word 0x91952052  ! 965: WRPR_PIL_I	wrpr	%r20, 0x0052, %pil
	.word 0xb9520000  ! 966: RDPR_PIL	<illegal instruction>
	.word 0xbdab8820  ! 970: FMOVPOS	fmovs	%fcc1, %f0, %f30
	mov	2, %r12
	.word 0xa1930000  ! 971: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb1a80820  ! 972: FMOVN	fmovs	%fcc1, %f0, %f24
	.word 0x8d94602f  ! 980: WRPR_PSTATE_I	wrpr	%r17, 0x002f, %pstate
	.word 0xb9a00020  ! 982: FMOVs	fmovs	%f0, %f28
	.word 0xb7a00540  ! 984: FSQRTd	fsqrt	
	.word 0xb5a80820  ! 985: FMOVRLEZ	fmovs	%fcc1, %f0, %f26
	.word 0xbdabc820  ! 989: FMOVVC	fmovs	%fcc1, %f0, %f30
	setx	0x1c7ed940000dd08, %g1, %r10
	.word 0x839a8000  ! 992: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xbb520000  ! 995: RDPR_PIL	<illegal instruction>

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

	.xword	0x44a3db400f112bcf
	.xword	0xc19491eeae722494
	.xword	0x7709ecbe2a446367
	.xword	0xc5cd71a0473a906d
	.xword	0x5fa3b3a32784ca30
	.xword	0x11d52f4ce47aa3c2
	.xword	0x96c085924666cdc3
	.xword	0x7572970fbe0c9ef7
	.xword	0x31843ad094677384
	.xword	0xc69991a41774e488
	.xword	0x0d845a9dc6d752d5
	.xword	0xccf71eae6ea3bc0b
	.xword	0x25e054515a7ada78
	.xword	0xdf010f332be4d523
	.xword	0xea8b69164b8d5b08
	.xword	0x0135dd35558cebb2
	.xword	0x140c410be52f8cfb
	.xword	0x3ff6aada501be1f2
	.xword	0x7c3d27e89937b225
	.xword	0xa986fb4f61b6c34a
	.xword	0x2fb7eebed657ba9a
	.xword	0xc106f276f210a424
	.xword	0x00fa3e687db3c482
	.xword	0xf7a689fd58886135
	.xword	0x922b370819dff23f
	.xword	0xecb524169e45e250
	.xword	0x577653a0a83fe1e8
	.xword	0xe509d22f953e12c3
	.xword	0x34b62763e09f80b5
	.xword	0x40819ee7dae0dda4
	.xword	0x16823cf34675900e
	.xword	0xb56018426879390d
	.xword	0x7ea8c0728f1128bc
	.xword	0x445d2565e3bc9214
	.xword	0xef662fef58c89259
	.xword	0xc030288da793fd01
	.xword	0xca86a6eed5fd83df
	.xword	0x28cc04f3ab74bf35
	.xword	0x7103c3899d3d20cf
	.xword	0xee2a7f10fe1bc923
	.xword	0x9afe703beb8be71d
	.xword	0xbc530c2ccf070203
	.xword	0x2434bd9d06a252d1
	.xword	0xef686a9be6522363
	.xword	0x41cca197512ba4ee
	.xword	0x9145a03975a6106e
	.xword	0x5ebc8a551d2f7920
	.xword	0x8969f6c957eac579
	.xword	0xfb67a3a203ab610e
	.xword	0x6e6597eee9913537
	.xword	0x0f24ecd42d303a9d
	.xword	0x2d2080223d4f83b2
	.xword	0x639cd25d21a8bfa7
	.xword	0xdb87e26e1be41099
	.xword	0x1150c3ffcd2a1fd1
	.xword	0x64d103ecf12e2fdf
	.xword	0x939a9b7bf218e757
	.xword	0x1d3c2cacaf5ac03d
	.xword	0x6c0a8675c6df3a03
	.xword	0xe77e5e5826f92373
	.xword	0x5568e7cdad808bee
	.xword	0xd310b68e829840f3
	.xword	0xf944aa6b4881d1ab
	.xword	0xcc7936b89e904fdb
	.xword	0xa95cd2a8407fdf12
	.xword	0x03f777032f5705b2
	.xword	0xb160ffa930e5861c
	.xword	0x9e4a826e28cf9dda
	.xword	0x72032bb61e661df0
	.xword	0xb5f2b5d8966c63c0
	.xword	0x99737b6e720c2fb8
	.xword	0xc0daf54a5eeed3f6
	.xword	0x4bb8475438855029
	.xword	0xcf9451f9859d71a1
	.xword	0xb1d6dcad06e4f533
	.xword	0xa0dde882edf754e8
	.xword	0x1f88f1e32f5c441c
	.xword	0x4f0f5d44657b51b2
	.xword	0x43db7e8eef95538f
	.xword	0x3db423ed34be4d7e
	.xword	0x89dbcb043c04ec48
	.xword	0x5a4e574a6b0c449c
	.xword	0xb9a69c8fee6a118b
	.xword	0x2fc2ec1798d85624
	.xword	0xc7a82eb1ad6f1405
	.xword	0xfe5868cbeb737770
	.xword	0x5f56db899ca519f6
	.xword	0x3f56cfe05e8cefe8
	.xword	0xa015a537fced7f56
	.xword	0x609e2dd2e7668b8f
	.xword	0x6dd58fd9e30bdcea
	.xword	0xae2ce3221ae6cf4d
	.xword	0x45941046deaea686
	.xword	0x0a953befad56fc39
	.xword	0x54c13f124d5c98b2
	.xword	0x748f49d31d2e96b8
	.xword	0xd5c8fa8d8cc244fa
	.xword	0xe7cbdcfd61e001e2
	.xword	0xf74cb33f69503988
	.xword	0x4e56761560b9869e
	.xword	0xcb3a560f9c69e48e
	.xword	0x45c594d4e813f5ac
	.xword	0xd300f3ad4a96fb04
	.xword	0x36136b81f7060661
	.xword	0x9816d294d21dd6ab
	.xword	0x80055e7d5d8c7d8c
	.xword	0xcd611367d53c006a
	.xword	0x27de9ec88d2d79b7
	.xword	0x52337740b8639da8
	.xword	0xac5d9116582a7afe
	.xword	0x9a4b54e3e3372e7a
	.xword	0x68c48df46003aab8
	.xword	0xec236599da1109b4
	.xword	0xf492c34972535c0d
	.xword	0x0c5e0711292f2031
	.xword	0x7c51332497a51eac
	.xword	0x4b67cb6572957652
	.xword	0xa524e3952e995d40
	.xword	0x32d68f396c709a70
	.xword	0x954b5e1b7e46aae8
	.xword	0x52c4a4cc5ea81eeb
	.xword	0xdbe23d7c04dbc794
	.xword	0x863692236bb3445a
	.xword	0xfd4b8ebbb3630fe4
	.xword	0xa24d0314e16c0e7a
	.xword	0xb58d52b46980b8c7
	.xword	0x2b0f613d1d580bfa
	.xword	0x42b074fca77ab163
	.xword	0xf6f12a20174b3c8c
	.xword	0x3b1aa4431075ecd7
	.xword	0xbf78e084fd480542
	.xword	0x7e0bfc31ce00ae37
	.xword	0x01050f1820a3e439
	.xword	0x6fea783fc347e300
	.xword	0x22588e073624a1cf
	.xword	0x7e7148ddeaa9696f
	.xword	0x47b190be7fcb3220
	.xword	0x46bf08841512cf3d
	.xword	0x375b93945bd344f3
	.xword	0xfd4288ba1c43dea5
	.xword	0xeb186dfe4c6ae319
	.xword	0xbcc7f85744caee58
	.xword	0xc80711414227ba17
	.xword	0x7c9202e66b10eb24
	.xword	0x7737d3ec0199f8be
	.xword	0xd47484e6b162146a
	.xword	0x357b3c072bf34791
	.xword	0xd35d421258ed2296
	.xword	0xbc2e207fdec39720
	.xword	0x3cd7a47145dcc682
	.xword	0xf047025dc23eeba1
	.xword	0xe1841f4e10131291
	.xword	0xbef7f421f5ad5ffa
	.xword	0x7eb6b2b0144c0ca8
	.xword	0x72a75dcc9ece193b
	.xword	0xdb3557014e3cbbe2
	.xword	0x467a6260da9e1694
	.xword	0x0d2e4fafeaae9e7d
	.xword	0xd28dc07f8a09454c
	.xword	0xdadc7bfbed22e752
	.xword	0xf57553493d923a65
	.xword	0x6e68bd4bc25835f5
	.xword	0xe72ed3b6b7fa15c3
	.xword	0xfaa5ec21d5e61721
	.xword	0x9be5779b2d4424be
	.xword	0x5eb36492292269c6
	.xword	0x4585ae26753f7f95
	.xword	0x19a47056ed11d1b6
	.xword	0x7e5ff6cbd7073a49
	.xword	0x5b2de84e126e1365
	.xword	0x1fea58f678b81d01
	.xword	0xfbf8e942f87a6e39
	.xword	0x4898115ef63d2281
	.xword	0xd13cfcd59b79db08
	.xword	0x9eec6d77d886d435
	.xword	0x481bdb4323e5a56c
	.xword	0xdfefe4cc96c8c11b
	.xword	0xe3b2a9d0cfef6d2c
	.xword	0xee8e1b1d345da333
	.xword	0xe6997f06acd3889d
	.xword	0xbff1c733fd693805
	.xword	0x8561a3878128fabf
	.xword	0xe21e857b96cbc9b9
	.xword	0xdf1ac9e11b7a3551
	.xword	0x9d8e016d7c1b5072
	.xword	0x73ffe609591d4f46
	.xword	0xa4293df85326f472
	.xword	0xb8658a748bd2f287
	.xword	0xf8e74018336fd5fb
	.xword	0xa6000e408716033c
	.xword	0x5dd98ffc2ed9e89d
	.xword	0xb00290586324a6f7
	.xword	0xec5f06d0306b45f8
	.xword	0xbf57ce220e4233d4
	.xword	0x050478cf8665f359
	.xword	0x3fe7225f91c800ba
	.xword	0x5d5b24233df0b09b
	.xword	0x03b84ae4470ff4e6
	.xword	0x6f21f689ce1d1e69
	.xword	0x47ccbd4e573ba4e8
	.xword	0xbb24e03447ba1e37
	.xword	0xecb4e065e03983b1
	.xword	0xf27c41688db92b69
	.xword	0x353b48e247a66b62
	.xword	0xdda8d693cd544169
	.xword	0xba1ab545418bb935
	.xword	0xaebd9ec4c3bbb0cc
	.xword	0x4ef1384a453892ee
	.xword	0x870c9ba80fe79736
	.xword	0x7fa325b9f5c85011
	.xword	0x3b2b9b92a8dbea7c
	.xword	0xfd6d276fc894dc8d
	.xword	0x6a2b8037b9193e2e
	.xword	0x3152a2631d66a7b6
	.xword	0x634a51d61e6e4d1a
	.xword	0xf6ba8b23a8a658dd
	.xword	0x429dae59ee272592
	.xword	0x578089a9301093f2
	.xword	0x1622eb61d81c5a3b
	.xword	0xd62350266843d91a
	.xword	0x1f62a6518f8445c9
	.xword	0xf8e8b8935ebe0efb
	.xword	0x1ca3fb9bad0065bb
	.xword	0x5f05b87f54268883
	.xword	0x6928c91877321c27
	.xword	0xf7aad6ab9c56fae2
	.xword	0x1d0c0c571ba1e16a
	.xword	0x6bebc78139e2f392
	.xword	0x304aa39ade923bf3
	.xword	0x7558866fa225857a
	.xword	0xbae810f923d0a768
	.xword	0x104d889d6213eb26
	.xword	0x4718b7b11f4b43ff
	.xword	0x19a64db5e64c785d
	.xword	0x958ac4a3f2628437
	.xword	0x472a06f694cb71da
	.xword	0x07f903731807e4a8
	.xword	0x99dcca67bc334af3
	.xword	0x418dc0f542b170a3
	.xword	0x922cf5f8071e11c9
	.xword	0x6c96f8cb74f0b064
	.xword	0x674e53442ccb8c6f
	.xword	0x1596c7c122e54d87
	.xword	0xbacd9ea2f042a45b
	.xword	0x324ad6fcf42c8c37
	.xword	0xe371a8f733db4738
	.xword	0x89dd777f7b1f633f
	.xword	0xb4ae9fe0614c8c64
	.xword	0x11bf21c6420b5355
	.xword	0x795a3730248d8498
	.xword	0x4f5ea165df2ec3e0
	.xword	0x52e6becfbf8405f3
	.xword	0xf4adbec4b286fc24
	.xword	0xff712ea39394b303
	.xword	0x8a5bcd1a873a524c
	.xword	0xd5ba24d1096f9055
	.align 0x2000
	.data
data_start_1:

	.xword	0xdb50d5a9358c689c
	.xword	0xca81ef57121fecde
	.xword	0xb6ede55e91602906
	.xword	0xfa1e495ae2afe3f7
	.xword	0xf5bf0aac273e273d
	.xword	0xc59f81925c78d352
	.xword	0xe82e7903ba9d59b9
	.xword	0x96a33491b746dde9
	.xword	0x2231657647062ea6
	.xword	0xaf4f8d54ec5cc166
	.xword	0xaee0d3f181c3fde3
	.xword	0x38a95e970e5c5038
	.xword	0xce857ed808017929
	.xword	0x381aa22335892b44
	.xword	0x5e0493b7d9f55934
	.xword	0x1a0c4d8d53bc28b4
	.xword	0xfa4ad6022fd62d25
	.xword	0xef0d9824b973cd6d
	.xword	0x8d4185369686624b
	.xword	0x6c994271ec4ab39e
	.xword	0xe68bf4c9feef1ec9
	.xword	0x872f7ae1cb97b746
	.xword	0x5b67272062031023
	.xword	0x8a9479e7f59872fd
	.xword	0x19750ccdb4db3df7
	.xword	0xdc66388e7264bb60
	.xword	0xfe5187cbde3922ab
	.xword	0x43a47a9abe3f5281
	.xword	0xecbb2f5b3a4087fb
	.xword	0xbf0f49ff86ad5184
	.xword	0x7bf307cbec902ed3
	.xword	0x1126c0a8f9effbda
	.xword	0x68ae7d374dd31770
	.xword	0x64158fe3273e1bc8
	.xword	0xdd621f660ce681e9
	.xword	0xc2458791a96cdb8b
	.xword	0x49010ca2a5c62ad5
	.xword	0xb53224f90f88b808
	.xword	0x2c2ebcca979ddb0b
	.xword	0x9c74946483d914ca
	.xword	0x2ca5bbd8f8f71a62
	.xword	0x4e0856e533e9ae75
	.xword	0xb6a748b55ca329f0
	.xword	0x36038e71ec942cb6
	.xword	0x54add8f7dea16bb4
	.xword	0x5fd57932dbdf6cfd
	.xword	0xb3dcb2c410558013
	.xword	0xcb0af408bc68a82d
	.xword	0xecb678e29e55872e
	.xword	0x3686a9cbe7a55641
	.xword	0x1733e700ce84dbda
	.xword	0xfefb777cd04d9b97
	.xword	0x221cbf237733ef94
	.xword	0x8b7095e1839cf672
	.xword	0x0d9bfbee114145c3
	.xword	0xa6802271713c3091
	.xword	0x81a3004253b404df
	.xword	0xbf05893c71d48b7d
	.xword	0x62e2bdf2038ec7e6
	.xword	0xdc9a7f24bdf6349d
	.xword	0xe230c08024344ace
	.xword	0x8b76dc90224e2346
	.xword	0x8b835ac9f6a43b5d
	.xword	0x4c35a1efed6a5eba
	.xword	0x9e5a75816b101946
	.xword	0x27777b2b49854bf0
	.xword	0xbc9265253e3d18a6
	.xword	0xfb64d55c944de75c
	.xword	0x11c4fd9594187a21
	.xword	0xfba3de586ab73076
	.xword	0x05881d10085bcb6d
	.xword	0xe62ad6eb2e85f317
	.xword	0x2e790efdff588269
	.xword	0xa4b4ddd7795696e1
	.xword	0x8b2f6df29d7ea273
	.xword	0x4bc5d0012020afbe
	.xword	0x15f12b9020a7539c
	.xword	0xe634bc2331233425
	.xword	0xf970f6aaca5d8263
	.xword	0x5f16e3a6b7f0a02c
	.xword	0xc2ba81c4699b64f9
	.xword	0x3d96243d65eb9595
	.xword	0xf2822c64dfa3c5cd
	.xword	0x38a916f2e28de41f
	.xword	0xf4b4d0d18851f6fb
	.xword	0x56cd7577fa7591ea
	.xword	0x977eae8a3c0d0429
	.xword	0xb8c0eac208de3c3a
	.xword	0x675646d230974b71
	.xword	0xd38cb84577e90791
	.xword	0xe427f89aa5a9908f
	.xword	0xc95c394ea3971483
	.xword	0xeef4d6870a8e3fcb
	.xword	0xbf269951e6213bcb
	.xword	0x0009fd21a0e462fa
	.xword	0x286b38e19006942c
	.xword	0xbd979322be92fd31
	.xword	0xc53802d262a02ab2
	.xword	0x8175d32fda65a4f6
	.xword	0x698efba578608243
	.xword	0xfba1b787c0398dcf
	.xword	0x64980ae562bbb85c
	.xword	0x8785b09707ec90cc
	.xword	0xf14ac7bd139c0bf7
	.xword	0x2ee0c52e5124520a
	.xword	0xa84669de2f9e4996
	.xword	0xe489a045a3349666
	.xword	0x64be02ca0cc945b5
	.xword	0xa3446168da739fc2
	.xword	0x9d18dd4fc1167a89
	.xword	0x74b6909181992c0e
	.xword	0x085e945d6ac88c16
	.xword	0x769469ff471aec17
	.xword	0xdead9f51c0279952
	.xword	0xe23ac2c6646eeec0
	.xword	0x032881cf7ea91270
	.xword	0x0df6617d253b318f
	.xword	0x9dee1f56f133c180
	.xword	0xc1048d033bbf54d2
	.xword	0x445214d73799ead9
	.xword	0x3d793bd90c9dd584
	.xword	0x63dddd46d14746fd
	.xword	0x9636ecd7dba18218
	.xword	0x20c2a24dd8d9debe
	.xword	0xf00cb4ceff2d58c1
	.xword	0x0c9677c6b4a5c529
	.xword	0x9f0e4c7cf85df518
	.xword	0xe5d824c4917fbd20
	.xword	0xab6302b7d864ddcc
	.xword	0xe6971a0b3872952f
	.xword	0x911236fad7eca432
	.xword	0xbb7baae50d6cc226
	.xword	0x0656fb3ea65f28e1
	.xword	0x7273718a6ea82e82
	.xword	0xb5565ae97ee90aae
	.xword	0x4e1824dcdab1c61f
	.xword	0xe54d7d9779e84dc6
	.xword	0x92393e757ddaf0ff
	.xword	0x1b20c719143a716d
	.xword	0x6dee787cbc9f7709
	.xword	0x34f3d87fa7cf2a43
	.xword	0x9e1edb5310169f62
	.xword	0x579d6c4bd9fdf5de
	.xword	0x9e695215b2508e8e
	.xword	0xcf728bc74e1ca160
	.xword	0x5a85a4e95e75bb97
	.xword	0x50fd383ca2a5f06d
	.xword	0x8a6aa20f3c622159
	.xword	0xfaf78856a04325c1
	.xword	0x246914f0cdc03a55
	.xword	0xc31253ee64f89f8b
	.xword	0x69cf7485c7b66991
	.xword	0xf4008e4b7d26d669
	.xword	0xba6665e5365d9896
	.xword	0x3653e6c36841f733
	.xword	0x2696ccd25df4a693
	.xword	0x94cab31a1ae6a981
	.xword	0x126aea2a319510e9
	.xword	0x8a2dcf905af2be91
	.xword	0xc1a7e3a78e7a04ca
	.xword	0x2c0866b133e0e9b3
	.xword	0x90319dc0a907a10b
	.xword	0x63dbd097cfeb8c78
	.xword	0x781c7dfa3dfc1441
	.xword	0x5ae508eadc7f36ff
	.xword	0x5f32c35c76da5355
	.xword	0x18a89b83992f3242
	.xword	0x26eae772c4b6350a
	.xword	0x8fb4e18dd536e8b3
	.xword	0xbfbf49f4b82004f2
	.xword	0x0c19df35768471af
	.xword	0xf9f681f287eb9ae8
	.xword	0xc5211c9dacd9cc7c
	.xword	0x0747fbe6baff0e34
	.xword	0x0b37bc7836dc1c48
	.xword	0x0183bf0ab092953b
	.xword	0x28e41a7dc9a372fb
	.xword	0x866f1e14fb9f023f
	.xword	0x000c33cb3398ced8
	.xword	0x0bf1faf81eb2d88e
	.xword	0x0c8a114cabb7d117
	.xword	0x6498f23031acd21d
	.xword	0x4dfdda287af2673b
	.xword	0x7096a8545051eb0c
	.xword	0x54394b9df4c1656f
	.xword	0x394ccceb07521bf9
	.xword	0xe091e40b95fda680
	.xword	0xd970543e83187723
	.xword	0x9355c2c2c8b7fc06
	.xword	0xc129b01874c1418d
	.xword	0xa25716a6e738e8a9
	.xword	0x653150ee0b2a27ef
	.xword	0xf3d4a1854f941d56
	.xword	0x2f16c6a70d852a77
	.xword	0xd3d169bb3e47e231
	.xword	0xc9f893d512f7db5b
	.xword	0x09cfeb4a0e5cd8b0
	.xword	0x892d1a9916ce66f0
	.xword	0xfd3e059401ef1aa4
	.xword	0xda5133d23637a520
	.xword	0xaf2a7c4c3238bb3b
	.xword	0x17c61f97e002fdea
	.xword	0xba749301d2169e18
	.xword	0xa57a16f22ca99155
	.xword	0x0bdc813c68ce0620
	.xword	0x2d45de1f9e5a534e
	.xword	0x58a5e4ce515a23d8
	.xword	0x29bbc9163f21b74a
	.xword	0x17e831ea48beb389
	.xword	0x084dcd1c82f79226
	.xword	0x7067e0f990da44c8
	.xword	0x08b85385aaa50c7b
	.xword	0x0a9ed78a8fda5ef5
	.xword	0xde83012c893b2c95
	.xword	0xa0fedafc2c002a92
	.xword	0x3516f14b0b7957f4
	.xword	0xb37027614e045549
	.xword	0x5a3f463bcf433963
	.xword	0xb4a0db7cf9a9ab3b
	.xword	0x313b56674a50d9b7
	.xword	0x670182a5946062f1
	.xword	0x831556710d29eab7
	.xword	0xfe84315e7781fc77
	.xword	0x6d17db839fd090d9
	.xword	0x79801521a257aade
	.xword	0x46dcb95f81cb658e
	.xword	0xd5bc26d2ec6381a0
	.xword	0xa1b52b33c3935d56
	.xword	0xca2b52240c84e546
	.xword	0xf94d461bd15dd31d
	.xword	0xbbe97a998bc96f34
	.xword	0x78a92806664251b5
	.xword	0x9609efd33d6e155b
	.xword	0xf35cfebac4008fb4
	.xword	0x63dd1b0e65ea680d
	.xword	0xc061d43264e205b6
	.xword	0x04bdc0c27fd57b12
	.xword	0xb4ba2370a25dd585
	.xword	0x79e1191909d84bf5
	.xword	0x0f71d925a3616d9f
	.xword	0xa961524cc4a89fff
	.xword	0x57acc3868cde0fee
	.xword	0x1de70133f7b39bc3
	.xword	0xca7c9784b944d979
	.xword	0x10bd92d5cbadb3f7
	.xword	0x5fe4f7afe78c44ec
	.xword	0x8e9e32fadcb89342
	.xword	0x95ec34e00f7de1eb
	.xword	0x16fbedbc9ce21a34
	.xword	0x2b04f78e32d5dc68
	.xword	0xa5f09d0546fe4292
	.xword	0xf7b3161f3a6283d6
	.xword	0x2069510046b43455
	.xword	0xd4882ace703fa71e
	.xword	0xebfbdb1689376953
	.xword	0x9e6cbd9d0b8bed65
	.align 0x4000
	.data
data_start_2:

	.xword	0x5e48a4f991fd90dd
	.xword	0xf18d29bb81e5d9f2
	.xword	0x73b9d368504bba99
	.xword	0x584afe65aaad4774
	.xword	0x70ddd314a13ccd4d
	.xword	0x55d2a3e5674bb65d
	.xword	0x54d6621b63b11c52
	.xword	0x5b9a458dd27a4a7c
	.xword	0x58c6557f251f5462
	.xword	0xaab953f9c36481f8
	.xword	0xc264654cab9b81b5
	.xword	0x7d683d0135bb5c94
	.xword	0x679244bbbf963a88
	.xword	0x7aee83bbb8594a27
	.xword	0xca1c27bca4d5eebf
	.xword	0xcb3f7897682ee775
	.xword	0x5f81c8a44dfc54e1
	.xword	0x4a68444a7cdab900
	.xword	0x940860277ea1946a
	.xword	0x1752e25f8282e0e4
	.xword	0x5c1d12861611aba0
	.xword	0xd0644031fa2e4a8c
	.xword	0xec10b0ec06de614a
	.xword	0xfe901aea129cc08d
	.xword	0xf27fee3fc70d3183
	.xword	0xa20320171e8ba725
	.xword	0x0a6f13ed746d1ffb
	.xword	0x14dcbbfe0d6e1351
	.xword	0xc3b8e9cea58ab66d
	.xword	0xf022b18e0a707abe
	.xword	0x7113a2abb488d042
	.xword	0x19ed37af8fb7fae5
	.xword	0xd4ca020b055c3e49
	.xword	0xbcc5f620cfce012d
	.xword	0x77e9486331db3444
	.xword	0x07cfab862ad2840a
	.xword	0x67553964cebc2893
	.xword	0x569dc1cb944b8fb9
	.xword	0x61e3ca33e9787b4e
	.xword	0xffd670312aec3c27
	.xword	0x84609781e409bdde
	.xword	0x3aaf7a3bd1443540
	.xword	0x08c57a3d8ff72242
	.xword	0x58ccc9c39ce1cd38
	.xword	0x73fbcd8c2f79f34c
	.xword	0x27bdb81964ff581e
	.xword	0xdd9ee4f07dae293c
	.xword	0x1af96644451554ff
	.xword	0x37fb9aa3430c7c8a
	.xword	0x946ac03b72d39699
	.xword	0x9e3907228fdfbd75
	.xword	0x4f00802b54ea8113
	.xword	0x35f859bf2751cbd5
	.xword	0xeac482292cc17154
	.xword	0x5fe8d99c2d26d274
	.xword	0x7458db54c4310ef3
	.xword	0x8085898f60bdde8b
	.xword	0x68935150e19b2048
	.xword	0x2b7583d813f946b8
	.xword	0x0c967692abcb7e9c
	.xword	0xc6126e8d362ebfce
	.xword	0x996c589723207e8d
	.xword	0x4c9f93e2c28cae86
	.xword	0xc61c3e8012cc08f4
	.xword	0x67f61f4d93132ff0
	.xword	0x99314996b9df8597
	.xword	0xc2a6efd5d9626413
	.xword	0x966d56f42c454b64
	.xword	0x9f6279230dd38547
	.xword	0xdc24e94b2feda0ec
	.xword	0xacb00f3deaae966e
	.xword	0x8bca954991895de5
	.xword	0xbbe34c315d0cb30b
	.xword	0x3ca818ff071569a8
	.xword	0x2048c1a890e3cb63
	.xword	0x2679d3e3faec2624
	.xword	0x92c063ff449eb5b9
	.xword	0xc5504d54e112a9dc
	.xword	0xa0964391addc279c
	.xword	0x803bee90982d4faa
	.xword	0x99f9350b02506ab7
	.xword	0x600f7763ac928bd2
	.xword	0x6df66c7d657e5f72
	.xword	0x9201db4cb44dd39e
	.xword	0x137a2fe6422a62bf
	.xword	0x6befc5723449c2f4
	.xword	0x840bd0c9baf8be5d
	.xword	0x4ecdfb7e0e5dc1b2
	.xword	0x8da2ac8904a78b3b
	.xword	0xed0012f1ece559e7
	.xword	0x85cb95581d0bac64
	.xword	0x1094689dc2a07bf0
	.xword	0xa7331148e6e3ba45
	.xword	0x8e47d2a07a657eb6
	.xword	0x55533404e10c030d
	.xword	0x7d8b0053bdbc4bed
	.xword	0xaa727868244ae9bd
	.xword	0xaac754c426bbeb9c
	.xword	0x287d0b709f1f60c3
	.xword	0x6d71f0d5224293b2
	.xword	0xe659187e882902ad
	.xword	0x8254add4a98cf786
	.xword	0x3896321fdad75d4a
	.xword	0x873db2e651177dda
	.xword	0x5de43c0beb63b2f4
	.xword	0x5c2a3d71b8df238b
	.xword	0x033c18217f7d186c
	.xword	0xce9f623c03f8d789
	.xword	0x6ff40cc1913622fd
	.xword	0xbebedae18b7493a4
	.xword	0x65d945c493ba0905
	.xword	0x94e8eb0f3da84e50
	.xword	0x9ab22ccd212d27c2
	.xword	0xa61fb5312e34e0df
	.xword	0xe9e38c94901fe62f
	.xword	0x19e57ebee4f46446
	.xword	0xd8645d44a903b57b
	.xword	0x51ae2916c1887a6c
	.xword	0x501681f72968cdd7
	.xword	0x32ee94f00851763b
	.xword	0x6e006642549329df
	.xword	0x3c990ea128215896
	.xword	0xb9f5e013c9aaa5b1
	.xword	0x3d84eee9b98cd4e7
	.xword	0xec4964811fdf7651
	.xword	0xa8dd82f81aa1146f
	.xword	0xd85c682bbc35faa7
	.xword	0x661804a625fa78f3
	.xword	0x9a40d65a5872e18e
	.xword	0xa665d29c5b76f15d
	.xword	0xd59d454e5d8563e0
	.xword	0x100e34dfc219ffa8
	.xword	0x2cc5d458bf6b5adf
	.xword	0xbef7c0a8440ad831
	.xword	0xbf76bfac3c457aef
	.xword	0xa177280f57bf5740
	.xword	0xe261e8c2c7815365
	.xword	0xa85be3257667800d
	.xword	0xa84f9789afa5d084
	.xword	0x22f88e9a3f1ec595
	.xword	0xccebd68484dce01a
	.xword	0x851e1cb29ae11327
	.xword	0x882212a6ca59ca28
	.xword	0x3249f77705a35172
	.xword	0x4fe923a24673c96d
	.xword	0x8c5835275ddf8eb6
	.xword	0x4ab8f54296ecd2be
	.xword	0x04c6f85d14b7c395
	.xword	0x03fb02be94d820d4
	.xword	0xe725e7f230468f2b
	.xword	0xb633c9014c9c7ed2
	.xword	0xb5211060ff222f6b
	.xword	0xbb2d641d4ce9a03c
	.xword	0x1c1c32d2f45e6c24
	.xword	0x4ad34539b9fc54fc
	.xword	0x9a3869b0bb6f579b
	.xword	0xcd70f1c0f22ccf28
	.xword	0xfaded79c7bcd1417
	.xword	0x1cd2c7c5c586174c
	.xword	0x747415003faaf6e3
	.xword	0x28e12a04e9d742cb
	.xword	0x53533dd0b9d73c52
	.xword	0x606257a1c47a58d4
	.xword	0xd97b2a82ca144e5a
	.xword	0xd06bff8eec6f8bd9
	.xword	0x66194288fc28e50a
	.xword	0x3ab1eeabb4044761
	.xword	0x2610772aaa81559c
	.xword	0xbd86192cdb5e6219
	.xword	0xe1f9210461dadc5d
	.xword	0x5b10e317981e4dad
	.xword	0xe3c344ce09278ea0
	.xword	0x293ca1a1e3a90c04
	.xword	0xe8eae93e3511e84c
	.xword	0xb5541d8327223ee2
	.xword	0xff8995ec0334f9a1
	.xword	0x87faab887e8f425c
	.xword	0x5bab0ec30af7a857
	.xword	0x63ae0b5ebe324b94
	.xword	0xd9e2703a998b29de
	.xword	0xe78a81926bf8542e
	.xword	0xef3293458ec35a26
	.xword	0x3b0c7e16b9ef5add
	.xword	0x567d70266405f5fe
	.xword	0xcb3f1a92743f2eef
	.xword	0x787473c3ce0a83c0
	.xword	0x4a1f07fdcd1102a8
	.xword	0x0fc5e0e48c12850e
	.xword	0xab60e8178adf25d5
	.xword	0x627e1c3208286809
	.xword	0x7f233c234c3f8393
	.xword	0xf597326b7efe3b6b
	.xword	0x199cf3a59f36cc22
	.xword	0x7e736766fc0af7b1
	.xword	0xc24fab2d09fd30fd
	.xword	0xbeb73584bc08192f
	.xword	0x2bb0d6251b94e906
	.xword	0x9c778b1c1c05c714
	.xword	0xb968918480fb3470
	.xword	0xaedca01bfaed67b0
	.xword	0x6e0d5c3dc2a08809
	.xword	0x20ad974916fb1b26
	.xword	0x4a5ccb33acc5bd2b
	.xword	0xe8c3551eed3b71e3
	.xword	0x6675c4cdf70a6f07
	.xword	0x8f1b164198fdb08a
	.xword	0xa2bb68ad79a23ff7
	.xword	0x566b7881fb217116
	.xword	0x92e5d958929a08c2
	.xword	0xcd36864255b4cf18
	.xword	0x4f82c84856fe4828
	.xword	0x6f38c34160ddd467
	.xword	0xba80b4999d711eb1
	.xword	0x5a80db1ae41c153b
	.xword	0xd76ce6fb8dbe2e1c
	.xword	0x6bd0abee2dad2926
	.xword	0xebbb94baf21ae183
	.xword	0xc15f960c6b794716
	.xword	0xf9b7cd9d4a275b4b
	.xword	0x26e3447e67b2b804
	.xword	0x0ed3445c863138ca
	.xword	0x3e6e7669419eb0ae
	.xword	0xec3a7720d80a8f9d
	.xword	0x9116deabdbcb7600
	.xword	0x2b0738d56c6f5321
	.xword	0x2265c51c434e4313
	.xword	0x5da795e9df375dfa
	.xword	0x170bb5e87bd4a13a
	.xword	0x49d31c30bf6f29a1
	.xword	0x83c837337ac46445
	.xword	0x27ad2aa7bf857f9a
	.xword	0x88774984ab5171d9
	.xword	0x59270e7a82d272eb
	.xword	0x67d524cbef315265
	.xword	0xecb0f050a2980f9c
	.xword	0xa086d778f65576f6
	.xword	0x8f8c5ce8b36a2d51
	.xword	0x2f5141eb8a06ee4e
	.xword	0xbca3ff1938dd54ff
	.xword	0x0b9b538cd10d0314
	.xword	0xa7e6a06bac95b57e
	.xword	0x9a57c8d00a20a238
	.xword	0xd67026edd43ec0cc
	.xword	0x4e0802315e0e511e
	.xword	0xc5ed63a8bdfc9e06
	.xword	0xba774c7227d660e2
	.xword	0xb9c44371694b8263
	.xword	0x6e911356d0829c6a
	.xword	0x1807888238d469a3
	.xword	0xd8dd3d1a992261bd
	.xword	0x02a037282f7a8b0e
	.xword	0x67ba41399f22836c
	.xword	0x38a9a225aa6871aa
	.xword	0xdffb57e256ca3a0d
	.xword	0x0f28e3688c55aefa
	.xword	0xc582a946231baf5d
	.align 0x8000
	.data
data_start_3:

	.xword	0x6f10b0e2b1cc6184
	.xword	0xbc6eb45b89c901f7
	.xword	0x871ff229dd731dc7
	.xword	0x708bbb0da663fa44
	.xword	0x6c86afe261c1eb16
	.xword	0xf4362aef32e87cee
	.xword	0xe213053610ddbf5c
	.xword	0x95ef7dcbd491f320
	.xword	0xa873c0932f5940e9
	.xword	0xaeb0ac2040d4617b
	.xword	0x497d2cb460b4b62e
	.xword	0x90e9767cda270bdb
	.xword	0x64b039b5673ba0f9
	.xword	0x8242551e3c5d1a3a
	.xword	0x3e2a8ac6102554ba
	.xword	0x711a2eac591cde9c
	.xword	0xc974c859e07257cb
	.xword	0x80151ab34ee5dda8
	.xword	0x4674ecb721f425f8
	.xword	0x6b9f34e24143004a
	.xword	0x8c610920ca49f7fe
	.xword	0x06914b35f6c38b37
	.xword	0x5ad77dbc1d9d73e2
	.xword	0xb0c434ebcd348ddc
	.xword	0x324241b42f5b0268
	.xword	0xfd4e1379dc4b4d49
	.xword	0x8b4d2e6c386a3044
	.xword	0x7d28c5a5fcd63ed6
	.xword	0x60f05fc06b3d895c
	.xword	0x36acc5e41fb3435e
	.xword	0x30307b0774a064ce
	.xword	0x11112b3224fba6bc
	.xword	0x92d68712ba86dfbc
	.xword	0x200eb5c60fe915bd
	.xword	0xbc1e9cbee0373dd3
	.xword	0x9e75704b5842a903
	.xword	0x3b5f158390b6acf7
	.xword	0x01f0c47dad1ceb72
	.xword	0xfb82a789e3a881a1
	.xword	0xa16f52f5bec7384d
	.xword	0x6c0fcf30df7b2e6d
	.xword	0xb302c99bf415ce66
	.xword	0xf03b123d0ed9bae1
	.xword	0xb5c6b5112db463a6
	.xword	0x6f7b48b0791b0666
	.xword	0xa45d1558d40fc5c9
	.xword	0x40d7de9675b6018c
	.xword	0x4809b58f8084a680
	.xword	0x5f44fd892e517c0e
	.xword	0xa958ca964331f62a
	.xword	0x9a5c299e14cd18cd
	.xword	0xea4bf360d02c1472
	.xword	0xcde2da1cda3dbce4
	.xword	0x4577a2078b59fc43
	.xword	0xd6df519fb1a3e81b
	.xword	0x75cc1bac6345b6f7
	.xword	0xc2ebad0329d85eec
	.xword	0xec51b5a250238e72
	.xword	0x31ec3621b5d312f1
	.xword	0xffebf9b31831d03e
	.xword	0x93ce7af3b0616cba
	.xword	0x5f96f659af34dc83
	.xword	0x4fc3d18d4f59dde4
	.xword	0x7875e07c3b0ec191
	.xword	0x9cea5f71109f9b7f
	.xword	0x5de97b05622f244a
	.xword	0x151734c5a45cee89
	.xword	0xbdd67516aab0d388
	.xword	0xa1162db16225e126
	.xword	0xb2ac6913a7e883f1
	.xword	0x92d810c8da1833d1
	.xword	0xf1b67f6b396bd752
	.xword	0x5a0c2653e92a0f14
	.xword	0x20fc053282000edd
	.xword	0xbfe1c9527ca8054d
	.xword	0xd37a0a0b23ce85d4
	.xword	0x66f69541676eae94
	.xword	0x5fccb097f1dd4a61
	.xword	0xf96ad02ee962668c
	.xword	0xe7a54a6f61e85760
	.xword	0xed19fe83ecd65263
	.xword	0x108cdc6923836c50
	.xword	0x6404e7ddda76c4f4
	.xword	0xad43c78c812d4374
	.xword	0xdfcd32e5e8634d48
	.xword	0x419addea12fa6890
	.xword	0x782df4229fb3c82c
	.xword	0xea037df36db70b26
	.xword	0x8fe1feea00ad5dbd
	.xword	0xea52efabba5821f8
	.xword	0x4f9896cad6da9a9f
	.xword	0xed70bc5f72d24a74
	.xword	0x1839ad81da4ad39a
	.xword	0x584e988a0d465676
	.xword	0x00f0370ba48aea75
	.xword	0x7f36e99d04dae57e
	.xword	0x36875519ec9d72cf
	.xword	0xc227132613cc117d
	.xword	0x16e8204a98beb2a7
	.xword	0x04b6c75cf9042f35
	.xword	0xe8a714c6a65de1ff
	.xword	0x30141899e7222af6
	.xword	0xf4e6c045672c14a5
	.xword	0xcc627077911f685f
	.xword	0xd91eae47d9a144fe
	.xword	0x84ea6671c19c63fb
	.xword	0x1dc1e6b387ce4167
	.xword	0x851ff37fb17a863e
	.xword	0x0351f71294ec7f95
	.xword	0x50eb29ea1e20b413
	.xword	0xd682041e0ff16496
	.xword	0x0b78b72573df2bc1
	.xword	0xb072452dc613fc4c
	.xword	0x24ddd9a8f17b933a
	.xword	0x1dc39c0c00154c84
	.xword	0xdf363e0af1db3d61
	.xword	0x4e4dade73042bfd3
	.xword	0x1bdebc0ccb29e0dd
	.xword	0xf1606ef092e21812
	.xword	0x72c51f86bc34c1b5
	.xword	0xb3dcba341652c810
	.xword	0xcba23ebe942a2950
	.xword	0xf1f11c0a0aa0be9d
	.xword	0xf402615d21ab7857
	.xword	0x9da9a8de1fbc45e1
	.xword	0xd2e62fd68ea03522
	.xword	0x2abe28fc4f454ec6
	.xword	0xd44c6f25cd280dde
	.xword	0xe30317c0e0cb9fe6
	.xword	0xe8ffdb350f779719
	.xword	0xab87b69c28f2c0fb
	.xword	0xeaffaf9fc4d1cf1b
	.xword	0x8fc0af69b2877416
	.xword	0xb6c889295f4cba97
	.xword	0x948aa4d448c094f2
	.xword	0xb99f7d85cb386977
	.xword	0x40476395641817ac
	.xword	0xcc90ba44e6b1114b
	.xword	0x7837ca2ba99b8f85
	.xword	0x8cbc508fb1410c73
	.xword	0xaf9fbceba4e6cc01
	.xword	0x8a8f737ea416c7d7
	.xword	0xea1aee049de7faff
	.xword	0x48464530968e9919
	.xword	0x4a327d564e710c1f
	.xword	0x1e23aa46b632dfd8
	.xword	0x2295966de383cb2c
	.xword	0xa530ef33f92c377a
	.xword	0x6c73a1da54978d9e
	.xword	0x0f23af0d8a82c481
	.xword	0x738985ad2baf29f1
	.xword	0xb37ab275871ea07f
	.xword	0x9e7473ea493deb17
	.xword	0x22aba25bda677eb3
	.xword	0x2c3ee5e2501bff0f
	.xword	0x25355e1efc2e00bd
	.xword	0x65f078283629901e
	.xword	0xf5638df9ff467988
	.xword	0x8dfefefdee4f6b37
	.xword	0x9c5b7f0e8a2e3644
	.xword	0x3adc3268dd290106
	.xword	0x17cd55bca716e5e5
	.xword	0xe67c4a447fbe5515
	.xword	0xd684f90712010f33
	.xword	0x2238b84562770e03
	.xword	0xeba834188071f62a
	.xword	0x684e2f112865f396
	.xword	0x3c6f4f1ef5abd144
	.xword	0x92ba201949672a18
	.xword	0x68a767c7276fb727
	.xword	0x1fa7d83ac4858788
	.xword	0x7caf30d81907e518
	.xword	0x9435ac50421ea23e
	.xword	0x3a2f147ce81233c8
	.xword	0x9992759e31291faa
	.xword	0xe3d91ec926a79ccc
	.xword	0xfef67913716c37c3
	.xword	0xd38be8b5e77818e5
	.xword	0x19e22093d07d3495
	.xword	0xf324d06b6b6b106f
	.xword	0xfb7932b5d6361702
	.xword	0x3b90ef09c751cf10
	.xword	0x0e3285921f51bbd5
	.xword	0x0d481f9014f964f0
	.xword	0xd5319fa3c47d39df
	.xword	0xbecc47eeffed2a00
	.xword	0xeaebedfd55e3c78f
	.xword	0x91541f117fe8bd8d
	.xword	0xf456c363cf4bfa4a
	.xword	0x5144213be9c3f1de
	.xword	0xc5b7117585a21b4d
	.xword	0x2e9115fbfecb364d
	.xword	0xe48cd76e1b72c8f1
	.xword	0x6e199755cf9577a6
	.xword	0x9a15ec46455bd639
	.xword	0x6b05f960a0abbcb3
	.xword	0xf822e06fafa7be5b
	.xword	0xc42d57037e3725fd
	.xword	0x3f7788385c94aa60
	.xword	0xdff8582d4ce7cdd7
	.xword	0x2ac7521d1cca25a5
	.xword	0xe92bd4d1b782ae0e
	.xword	0x690e9aef2ceed816
	.xword	0x7bf98919302651c7
	.xword	0xcffb3aef3a96ebe3
	.xword	0xc7fa3a6a59d947af
	.xword	0x102c3d8b3057ec57
	.xword	0x62c076c5e5fef76a
	.xword	0xd60c38e8bbfa7462
	.xword	0x21958ea2d3a2d9bd
	.xword	0x0692ddfe0966d3fe
	.xword	0xf36e5241659fd73e
	.xword	0xef8b1a70c5529596
	.xword	0x48c27a8dcb08dea1
	.xword	0xcabfe900831572e7
	.xword	0xcb63dbcc41ea9356
	.xword	0x9f632b77aed7ff49
	.xword	0x697e7aa0fdc72322
	.xword	0x697c63558d29b4f0
	.xword	0x21dbc413da29dca9
	.xword	0x3ed33394b8e2d74c
	.xword	0x72fcdf6caadabd2a
	.xword	0xcb2c0bc08731186b
	.xword	0x88779a87cad0ea50
	.xword	0xc6a18fc458260720
	.xword	0x3a5e3af902c27146
	.xword	0xfb7f4de0b3658924
	.xword	0x97862dcdc8d5bdb4
	.xword	0x4a53d818d5f29e46
	.xword	0x4f1d41f93f565e7e
	.xword	0x1bec95870f541742
	.xword	0xe1e865875158f94a
	.xword	0x2327be3fc75a8daa
	.xword	0x9ab83fdd580d8786
	.xword	0x7cff419dba136bee
	.xword	0xc9fc794adac727df
	.xword	0xcc1c06bd37d42ba5
	.xword	0x9a394bc11837342e
	.xword	0x36e593d847448e4d
	.xword	0x78a4221766bc9a0e
	.xword	0x0308ec07bb3a0782
	.xword	0x8f6d1ea8d089ee8f
	.xword	0x9ca044312c6ba678
	.xword	0xdd0895b2da525ef4
	.xword	0xb95f7191535b6802
	.xword	0x8fe71174e3b4f9ee
	.xword	0x7c9994e492087f7a
	.xword	0x0ea07090190062b3
	.xword	0x14264a1013ec2a8d
	.xword	0x1b11d9999d9c3423
	.xword	0x774df4e6e2632f63
	.xword	0xccef1f917376ffbf
	.xword	0xe804c81965267402
	.xword	0x34de9321a9127558
	.xword	0x976954f4fad40050
	.xword	0x6d6f4adfe579a8bc
	.align 0x10000
	.data
data_start_4:

	.xword	0x20db8577309a1ea0
	.xword	0x7dc82ffe1be8cbc0
	.xword	0x47b45e3c23b05284
	.xword	0x2ec43f184d1b5efa
	.xword	0xa2f1a264507af925
	.xword	0x1ee438944c3ecaef
	.xword	0xa29929b41399b9cc
	.xword	0x1ef39bef7dceb5bd
	.xword	0xf3f3026526ac6b42
	.xword	0xfcc1b47ccc410df9
	.xword	0x8cde4792843add1a
	.xword	0x8228508b8bb76c1e
	.xword	0x850df8138d3b272d
	.xword	0x222ed47eb249d6ea
	.xword	0x5dfc365fcdd23b13
	.xword	0xa987a70f3dbe5296
	.xword	0x5272c7bf0e81435a
	.xword	0x9ee6b634d063ae8c
	.xword	0x21d7375a1b8b91c9
	.xword	0xf17517f99bd36b96
	.xword	0x468ee41f4e5d9bc3
	.xword	0x6f8e04931f917a02
	.xword	0xc7d61e1a68c49ded
	.xword	0x3916e2567be9cb0b
	.xword	0xc20f9991546aa638
	.xword	0x0f89a442de719147
	.xword	0xdbc5b1e34ad7e258
	.xword	0xb4b24d64d0661906
	.xword	0xfa6fc23f47421217
	.xword	0x39dd34b4aef00f25
	.xword	0xb442efec2ad5cd25
	.xword	0x8123e56bf3085414
	.xword	0x6847e128fd1224fc
	.xword	0x5dfada39b52f2831
	.xword	0x2822d99a833aee2d
	.xword	0x8cbfbcbc9835975b
	.xword	0xf690917564b6761a
	.xword	0x5a03e9ac9d288d6e
	.xword	0xd383f8d3047b6639
	.xword	0xc1ea471c6e16ffbb
	.xword	0x824795547dab6216
	.xword	0x254efde06a5183c1
	.xword	0x5cb5ad05a7dbbf66
	.xword	0x6960e8778d15712b
	.xword	0x6139a658ffa02404
	.xword	0x25fe1f7d9cf231a2
	.xword	0xd360647a955a8b95
	.xword	0x50268b3a5186f1cb
	.xword	0x731304bd26e0e050
	.xword	0x103113f4ea10554f
	.xword	0xab539cf5cf3567a2
	.xword	0x3eca6ac09ff743b8
	.xword	0x281c2f0ff80ae76a
	.xword	0x00ecb3fe9c3bf04e
	.xword	0x371171319d03ab11
	.xword	0xee2482278a90a840
	.xword	0x7a441b46841f68ae
	.xword	0x98d0a78d99fd2126
	.xword	0x01f586f106c05e79
	.xword	0xc0b723e31e4441df
	.xword	0xdea23e478888ac6f
	.xword	0xbe3e4069ba339075
	.xword	0x9847c86cd1d1e0a5
	.xword	0x1767606beebb4d49
	.xword	0x44f79a16d29c57ca
	.xword	0xad58e2dae60a5d34
	.xword	0x32b2119b3383ad7d
	.xword	0xd913deae2d4a25f6
	.xword	0xbc6d402b41c6cb8e
	.xword	0xf90cb09d3db62f7a
	.xword	0x450bdab3b3430fea
	.xword	0xc36ed58ccf72b0a8
	.xword	0x3ddc92bc828c4ca9
	.xword	0x1b7f8115e4ea9e86
	.xword	0x2eeb29becdfe948f
	.xword	0x5f8928667f820963
	.xword	0x8cd1b5ad610bef3f
	.xword	0xf8f8139f24c59a96
	.xword	0xff51aec228e18c5e
	.xword	0xc46cf8c0023009f7
	.xword	0x5186a80bf9ec8550
	.xword	0xf9af3d722bf8d177
	.xword	0x15ff512d0dc51e59
	.xword	0xd2303b78045449e3
	.xword	0x66c537f2f49b47e7
	.xword	0x83690f147027f400
	.xword	0x6bd94b321b676b4d
	.xword	0x25c218339f1cdbb0
	.xword	0x7da66249388c4767
	.xword	0x95ebefbb73548e12
	.xword	0xc2923bfbea2d9219
	.xword	0xba78a2f315a80a2a
	.xword	0xf75dc777c0246bdd
	.xword	0x7125b66ad55ab02f
	.xword	0xa426ce35ae760b68
	.xword	0x4447ee18f230ff8d
	.xword	0x0221ef21545c3262
	.xword	0x08d9d4805a405cf1
	.xword	0x2f7e537847cfe5e6
	.xword	0xa01469c1fa849ab8
	.xword	0x6250cf6ad84c8f15
	.xword	0x217e07b6c8e2e156
	.xword	0xe057c0684af7ea71
	.xword	0xd3820d784530c46c
	.xword	0xf0614258d63684b8
	.xword	0x2e9488b9e80fc712
	.xword	0x5311402a2be775c8
	.xword	0xca13cbc0e1ca4ee6
	.xword	0x501570ea2bd09bf9
	.xword	0xfd3a9d86c150a3d4
	.xword	0xddf678b803686c9e
	.xword	0xa31f7a47e5e54398
	.xword	0xfcad033e638652a2
	.xword	0x3be5790057f6aecf
	.xword	0xef222d782128016a
	.xword	0x2b7be070705d34c6
	.xword	0x08f4c05f7006b371
	.xword	0xe4d6ad10f6344376
	.xword	0xc3c7ba97a25c6138
	.xword	0xe85327cf553e7ea7
	.xword	0x6308fb96686edcd1
	.xword	0x2e1e61cb7af173af
	.xword	0x88137f318d1a7200
	.xword	0x00b08761058b8c98
	.xword	0x3a4bbd76f7354cbd
	.xword	0xb4e6b62d1833bc72
	.xword	0x9d17717a35a68e83
	.xword	0x0f3fad0aec2dab63
	.xword	0x97ffee4ee5267c7f
	.xword	0x4152382d8a29d8fe
	.xword	0xc6155c3b4158cf77
	.xword	0xcdda3d91a179bd4b
	.xword	0xdc290b8f699a74d5
	.xword	0xc3474420cae56560
	.xword	0x4385ac767a548c06
	.xword	0x421e52c42dd31659
	.xword	0x6401b59755fe8560
	.xword	0xbf78d0aa98994f7e
	.xword	0x71d9d6e9bfab1d18
	.xword	0x57f8daba63a0b99a
	.xword	0x824ce9fa4fcc5eeb
	.xword	0x4743f71b374e07f3
	.xword	0x8d49b9fdffdd3ba5
	.xword	0x0875213f0a74d20b
	.xword	0x675eee090c26a475
	.xword	0xe8f142710970cbb2
	.xword	0xabc22cd4a9fd3cf4
	.xword	0x506864bcb230cb8c
	.xword	0x8de8bc69a33f7bf5
	.xword	0xfac85b4170efa704
	.xword	0xcbb46667d30b1558
	.xword	0x7a5227d991e30208
	.xword	0xce463358cd389ba6
	.xword	0x4c8254b0d72dd8d6
	.xword	0x164df8cddaae531c
	.xword	0x68881a02accc2bc6
	.xword	0x0f5fd98c2b34575f
	.xword	0x0e9fde9dbfd20e37
	.xword	0x3224d7e1d2e7fdf6
	.xword	0xc531d81c5bc17307
	.xword	0x5c05c091a4db221c
	.xword	0xb645530725a981f7
	.xword	0x525e0e8b9a0a573e
	.xword	0x5dfe240c14914898
	.xword	0x71ce34f89b2d4a9a
	.xword	0x13f08a0d0a12f5fd
	.xword	0xa57dedafa6bebf42
	.xword	0xf3c7e0bc0f1cc70a
	.xword	0x3dedbe3665059ad7
	.xword	0x410f8bb865bf0d10
	.xword	0x6275c3ed3a121e47
	.xword	0xf6b58143286580b4
	.xword	0x62ba68e65b719e92
	.xword	0x2dc48d68e3df433c
	.xword	0xfb3a05ad9d404991
	.xword	0x1c57f7c857843f2a
	.xword	0xa01eacf9aa17cb54
	.xword	0x6023e5135c0c8036
	.xword	0x057240b627fa69d0
	.xword	0x288cb7bda80a4a64
	.xword	0x92ad78c541425583
	.xword	0xe07dd927935bcba7
	.xword	0xd759b533d62f4130
	.xword	0xad8e7329f919f918
	.xword	0xc62179071798a315
	.xword	0x4eece34958c3b381
	.xword	0x55dec6e0ff9138bc
	.xword	0xb07f4877804097ae
	.xword	0x2ccd511702ab5ff3
	.xword	0xa280c1301167ba90
	.xword	0x76b395bd19b42e7b
	.xword	0x8d17c8c917f4ddc2
	.xword	0xb81792b2fd18bc5b
	.xword	0xaacc2bd6f3373532
	.xword	0x0fa06acd444408eb
	.xword	0x0c6ccd89abfcb73b
	.xword	0xb6dd68e0a58f6cfd
	.xword	0xc70b8147a132da34
	.xword	0xa6d7615c0a7bddda
	.xword	0x23414731b2e9baf7
	.xword	0xf6283b8a715f467f
	.xword	0x4435e379078ed97b
	.xword	0x1dbeabd35975aa5f
	.xword	0x743dfbabf931dc2d
	.xword	0xd9727fd68b065052
	.xword	0x3dca38b2d2b56d8b
	.xword	0x7b0687993b9e4b07
	.xword	0x142791e9a992982e
	.xword	0x75073e94aca8e45c
	.xword	0xbae370da4fc7ca73
	.xword	0x7f428a96d79d442d
	.xword	0x11f5b732fa171f97
	.xword	0x360e88f89b89880a
	.xword	0x0c2bf5f5feabd67d
	.xword	0x223b4e78003e01fc
	.xword	0xa33bb846b03d962e
	.xword	0xf5ad75d9a25de7cd
	.xword	0xe4f5dcafe22b6bba
	.xword	0x00d0a588abe29916
	.xword	0xf112fad6bee3c8a2
	.xword	0xa966bc66810dd0f7
	.xword	0x55c216ad67d23009
	.xword	0xe2f0d072392099c8
	.xword	0x02c153b2f4ca9f33
	.xword	0xed75908fe9a391de
	.xword	0x8562429a902b46c0
	.xword	0x1e0ded4934606869
	.xword	0x22355e6664a052cd
	.xword	0x8d2ce692f2c02cfc
	.xword	0xcadfb939d4b97133
	.xword	0xd151c08c6c9c94cd
	.xword	0xf947d66cbd1a25c3
	.xword	0x88a9ed192714331f
	.xword	0xf891c936feffae47
	.xword	0xfa8d2dffb703ff40
	.xword	0x47e8bf5f8f10e865
	.xword	0x96a3544e54273411
	.xword	0xde9691926b379990
	.xword	0x3b63996c328f1b46
	.xword	0x90c41cd0ed2af992
	.xword	0x5476718665ffcac3
	.xword	0x7fd1edf11a863964
	.xword	0x99763a805c631585
	.xword	0x61312e836cf2a131
	.xword	0x333b2d09f37d2448
	.xword	0xc5046c87ec9b2d33
	.xword	0x6072369012732f84
	.xword	0xa7ac0a2c52908178
	.xword	0x86a286196381ba9d
	.xword	0x75f6f3982ee91035
	.xword	0x3cb3f046814d6a84
	.xword	0x4a259306af97c1c0
	.xword	0xa69dcd770f8184e3
	.xword	0xc0e78d631ee2dfaa
	.xword	0x992f2fe9e4851e90
	.xword	0xeaae0b60c5eaf9ed
	.align 0x20000
	.data
data_start_5:

	.xword	0xf75feb65e91db7f6
	.xword	0xb6684668fbb37d33
	.xword	0x0e6fcaa1818cc327
	.xword	0xce9ef3e46df3dfa1
	.xword	0xa81b7cc8a7bc8bfa
	.xword	0xe49cb166b3148333
	.xword	0x6e035d1b611622cd
	.xword	0xbf387c268f88fa50
	.xword	0xe1cc867d096ea800
	.xword	0xdc301e3193178847
	.xword	0x2a963a77466bc54c
	.xword	0x9764ed803cec750a
	.xword	0xc9a976a21aa2c868
	.xword	0x4a32bdfe9659fac2
	.xword	0x9f6935229f480e33
	.xword	0x70de779904c541bd
	.xword	0x16c12f2489ebb711
	.xword	0x99978b4e80baad72
	.xword	0x5e339651c396ab23
	.xword	0xdb2150d3ddfb5d0f
	.xword	0x6b44bd8380cdd04a
	.xword	0x40887caadd317f33
	.xword	0xcbe645e1a07674da
	.xword	0x7dfb2e4028b641b6
	.xword	0x0437d96b2358c9df
	.xword	0x5507cfbbd8db8a68
	.xword	0x1315860552931668
	.xword	0x2eccbeceeda02d57
	.xword	0x74047729cef133b2
	.xword	0x90892e1815a147ca
	.xword	0x480b9227a4993326
	.xword	0x099dad56c29e9360
	.xword	0xeea86237cf5a7d0b
	.xword	0xa207281a5e2bcb30
	.xword	0xc734b3fa68632b97
	.xword	0x5df4d4e384996c89
	.xword	0x2041245718aa39f8
	.xword	0x462ebdb4b6fd84fb
	.xword	0x484f663d7e6a8b75
	.xword	0x130bbd54be3227ff
	.xword	0xb825e01dd60e62d8
	.xword	0x0723b86d27220a70
	.xword	0x39c54f59c1c32853
	.xword	0x12f86760302c8576
	.xword	0x552265f4a02eb657
	.xword	0x4159a19b8b6ddc9e
	.xword	0x5575accc0a7a2ba1
	.xword	0x758c7d226cf996cd
	.xword	0x370c6d05d1de6b39
	.xword	0x45560d8589a87c43
	.xword	0x275ba605fb922dd5
	.xword	0xaed88e7f05efcb2f
	.xword	0xe0ed1b4d498d2c3c
	.xword	0xbcff43f63ab2cc5c
	.xword	0x7ed12004d4cd56dc
	.xword	0x652cbdc5a6856eb1
	.xword	0x763e28ee6c8ba854
	.xword	0xd74bd9aff1b617e0
	.xword	0x5d62bff7ccf0c69f
	.xword	0x70c61975b0992370
	.xword	0x13c76e0a485180f3
	.xword	0x97f97a58e9b5b1e0
	.xword	0x404d59d5dd99e5c9
	.xword	0x9042da826cdcc2ca
	.xword	0x2595ce2f06d30865
	.xword	0x8bd9989f7a74975b
	.xword	0x1843412de5dcc6a9
	.xword	0x3cc87864b66103bf
	.xword	0x3d7f40e4f897b732
	.xword	0x36c4f27c36daae2a
	.xword	0x66045cc738a91514
	.xword	0x195c5b4da6a14b88
	.xword	0xbfbb822aa60a0e73
	.xword	0x3c30807e03495810
	.xword	0x1a48eb345de150a4
	.xword	0x7e5f23a0103d5736
	.xword	0xb4ae89e7919bc86c
	.xword	0xb6c8a15bc7d949bf
	.xword	0x70f532ee3b4cae78
	.xword	0x7e3787d1a89da65e
	.xword	0x3d0f127b1dd5ebba
	.xword	0xe9d1bb4ceedd478e
	.xword	0xc5f77a439b33b635
	.xword	0xb8b032a44a013879
	.xword	0x99b3cd09c6461941
	.xword	0x694d2df8894f59dc
	.xword	0x8536347781acceb8
	.xword	0xc56667620a33c0d7
	.xword	0x7e9eae6f93c76c0c
	.xword	0x31fbf2538df18a7e
	.xword	0x6b6988cba117e708
	.xword	0x08ba341e556c6adc
	.xword	0xbb9ef6f11684cdb0
	.xword	0x5d55f50b0ff06351
	.xword	0xaab4792be2add5ba
	.xword	0x78919b086b710a33
	.xword	0x7b10ce3557a293df
	.xword	0x89b4c75e6d077520
	.xword	0x30d163e4ff639cb2
	.xword	0xc66c967f31db3517
	.xword	0x09996a3b055a5dd6
	.xword	0x115814d44ec155dd
	.xword	0x1941dc3289449d50
	.xword	0x8cd3acbc2e208bf0
	.xword	0xbbaa9571cd4daff4
	.xword	0xa3a8deda13d21830
	.xword	0x05023be29283ba8a
	.xword	0x3dc520fd3acbaa3a
	.xword	0x1e975b08aa9f6649
	.xword	0xa6b4b2b4ded7e807
	.xword	0xe6d6ce5f9a30fa61
	.xword	0x57ef534b3e081388
	.xword	0x06f65e2117dd61ed
	.xword	0x2113f0f3a5307eb6
	.xword	0xc8aa09ec1e30a66b
	.xword	0xc95e9b5af998a12d
	.xword	0x3d99e0066452ce1b
	.xword	0xe7085588e8479ad9
	.xword	0xd6baa489f1965287
	.xword	0xce8af527e5c222a1
	.xword	0x3d6eadc9ea076522
	.xword	0xe0329f795364fd9d
	.xword	0xbacfc848116424bf
	.xword	0xe88a148d86fed38c
	.xword	0xb0a23dcef5dc2d60
	.xword	0xaadb6542323b78c2
	.xword	0x531f18b62a61ea3c
	.xword	0x3ab6d040ba485412
	.xword	0x9f49c7cb7ff49575
	.xword	0x1849f40fd9b7d1c8
	.xword	0x7650c8ac7c3a2080
	.xword	0xa16b4a93cd491629
	.xword	0x3eea030247c6152d
	.xword	0x85fae55c601c65ab
	.xword	0x1eb10bf47bdae86d
	.xword	0x95a610cc37e667d0
	.xword	0xa0dd2894b9201913
	.xword	0x8ad33bbc4aa76393
	.xword	0x774bc69735c7c4bd
	.xword	0x536f55df02e5f982
	.xword	0xef9aac6bc03387e2
	.xword	0xc0dce68280b51280
	.xword	0xbbdd20a9bc8b1f71
	.xword	0xbcaad5ae3be7e2e9
	.xword	0xce2ac0fcad00fa35
	.xword	0x3ccb9a62dc65980a
	.xword	0xd4786474ec5ac788
	.xword	0xce4b03b5c7a27a03
	.xword	0x0f22323ebaed7c85
	.xword	0x82257e34cb7b11a4
	.xword	0xe578873317a5dbe7
	.xword	0x87e334f4956aa45e
	.xword	0x492ffb9478ed1dbd
	.xword	0xb286446f280f2a6c
	.xword	0x8345642a170d6d4d
	.xword	0xab717b8e4e3ab2a8
	.xword	0xf127a2ce312ef032
	.xword	0x73eff7b639f79830
	.xword	0x2dcbb861829dc74e
	.xword	0xf5710554c483076e
	.xword	0x284659f2334d8628
	.xword	0xd407149dc266cf73
	.xword	0x7c401e77c4d3ca6f
	.xword	0x84d09be84b2f35ec
	.xword	0xa029b1ba3d36628d
	.xword	0x5e26928adef4a8c2
	.xword	0xc37bf25d4aa858fe
	.xword	0x655fcd77cfdd73e8
	.xword	0xfc15115461ed7e43
	.xword	0x45b173512c1e290e
	.xword	0x72f58f773ce7b751
	.xword	0x41a791db64a29c7a
	.xword	0x172fad718b959347
	.xword	0x0bef4ac640215122
	.xword	0xd71eb67032efa0dc
	.xword	0xddb23ed4aec333fc
	.xword	0x390c469d72394398
	.xword	0x1750d9146ebd6029
	.xword	0x2889a5f3aea58fe4
	.xword	0x51c8cd37a46a2f96
	.xword	0x109a4d03cf1c4a6d
	.xword	0x05b1ab4b8d3f0f8b
	.xword	0x321222f8fcd920a7
	.xword	0x72cff9264e946ade
	.xword	0x249cc62f0c4416be
	.xword	0xbfe4780b4306b80e
	.xword	0xc2b594a74eb3b76c
	.xword	0x73e9e7b4b7683789
	.xword	0x776c19c35f9f7c54
	.xword	0x6460a9ef35c89914
	.xword	0xbf9ed57941fefe58
	.xword	0x112441fe799b059a
	.xword	0xf46c11e4a61b1998
	.xword	0xa0489eb2f38e2c28
	.xword	0xccabe07fb0556f33
	.xword	0xc7ecc98867313902
	.xword	0x60f83aeb31a38625
	.xword	0x0a6a0a03dd5a08b9
	.xword	0xb2b146f08232ae8b
	.xword	0x65adf4ff31906ee1
	.xword	0x46b4e418760cdf29
	.xword	0xce47f14276b2e397
	.xword	0x8254588cf7577fce
	.xword	0xef149f0e1a984e57
	.xword	0x753ab5671aee41ae
	.xword	0x31959b19b546ec03
	.xword	0x97ec8d6b76a30bdb
	.xword	0x93eb7d033527152e
	.xword	0x43b8ebdb12d3ebca
	.xword	0x05d92b0db6a63606
	.xword	0x20481c503d98a8de
	.xword	0xf834ba14e4bfb476
	.xword	0xe1cc852b3728e2fb
	.xword	0xa51ed556d38267a6
	.xword	0xaf16d7a22942f6d9
	.xword	0x5f583d5736bfd2dd
	.xword	0x6d92405e3d88ecc9
	.xword	0x5cdaa7afa0900138
	.xword	0x5927bfdc3d30affb
	.xword	0x6086ad07c2dcfb3b
	.xword	0xce1d10f666b10940
	.xword	0xcccc5a69ffb11fb0
	.xword	0xbdf4a2a15131634f
	.xword	0x34c9c6ad6aaf8cb5
	.xword	0xcc9227cddb206f85
	.xword	0x68926176e10f349f
	.xword	0xcd8b7d7dcf590c39
	.xword	0x46852e17644d166a
	.xword	0xd6c6b3859ed018ac
	.xword	0xdc45553635595377
	.xword	0xd15672126d91b55f
	.xword	0x1b30b50e54a0a89e
	.xword	0x785da102eb900ccb
	.xword	0xb0285581a7b9cf6a
	.xword	0x0b9ecbb39ab9c374
	.xword	0xfc84ee5279a552c2
	.xword	0x9949914c9c3151d2
	.xword	0x0957415ffc10e7e0
	.xword	0x6a14872758421cd8
	.xword	0x2f95075102f542c0
	.xword	0x92079935991699c8
	.xword	0x9dbba9b4fb104272
	.xword	0x3e97b18cb11342eb
	.xword	0x1eb7922efec057a1
	.xword	0x65596ccfc1309976
	.xword	0x5539ae0333de6307
	.xword	0x0388b5da5b323e2a
	.xword	0x11d4a8fba8802340
	.xword	0x2251dd7cc523da62
	.xword	0x3bf4e1578dc2a04e
	.xword	0xd8fcc52b459182ed
	.xword	0x298f420423ee44f5
	.xword	0xfaf02b3c3ff9072a
	.xword	0xab38d05abc5061b5
	.xword	0xe0ccc6a397a2e36a
	.xword	0x5d55cb5db3ef7123
	.align 0x40000
	.data
data_start_6:

	.xword	0xd310b381490c28d1
	.xword	0x9b3ad12f261bc69f
	.xword	0x62105942a3486531
	.xword	0x8a0aa26f51cd07b0
	.xword	0xbf440f37e6d4848c
	.xword	0x89aeca5f932fcfbc
	.xword	0xbad5cdab60aa17fa
	.xword	0x7e5f649596f2c458
	.xword	0xd71c502c2efce91c
	.xword	0x06a729e6d16bc954
	.xword	0x615eb1f44b78025e
	.xword	0xd17ca7353e2d28d4
	.xword	0xff1381ac4c852cb1
	.xword	0x18acb2e5fa96631e
	.xword	0x62c6519bad3773c6
	.xword	0xea8adae7e4431bc8
	.xword	0x63b2683fa58e0136
	.xword	0xdaa0a2dda2d50e3a
	.xword	0xcbeec76e02d923df
	.xword	0xd9c7e32325870c30
	.xword	0x709b582a8565a6c0
	.xword	0xfe0afbb42eb6e8dc
	.xword	0x968ad9dfdac4d349
	.xword	0xb7dbd1f08843cf83
	.xword	0xc365d484f08ad0f0
	.xword	0xeab6d9d2f63816cd
	.xword	0x111591e65d0c9ebc
	.xword	0x02d7fa46cf0b284e
	.xword	0x0b5b8e33868c5eb7
	.xword	0x028a671a37aafeeb
	.xword	0xb6888d75ce9ebb70
	.xword	0x6640d688ceab2c38
	.xword	0xec91ee8cac298507
	.xword	0x0fc7053e2ddf058b
	.xword	0x7a7470fd286567a2
	.xword	0x6ba377e1bb5a9c77
	.xword	0x147c00bb5929b279
	.xword	0xe27ae34300e3406b
	.xword	0x422707434c9fb928
	.xword	0xcae43deb48b4b05f
	.xword	0xc308e9a83e6a695c
	.xword	0x15524234aea251ac
	.xword	0x810241ecf9e2c25b
	.xword	0x657866a0016733ba
	.xword	0x219620a65a229150
	.xword	0x9f260c3106074fd6
	.xword	0xa27b260dca7dd5aa
	.xword	0x2322bcd725c95e02
	.xword	0xe2229026259f5026
	.xword	0xcafb44775bf6afc5
	.xword	0x29b90efa69a8b581
	.xword	0xb4b2c85c2d6ae8da
	.xword	0x0e0a2423ed479efe
	.xword	0x793089c8c5acd28f
	.xword	0xa549210649c34c57
	.xword	0x3af9b17a68045852
	.xword	0x8e73ef8fd3816755
	.xword	0xb0d62bf701b4f4df
	.xword	0x2b57887d523df75e
	.xword	0xa7fea5fcc81720ab
	.xword	0x8afd83e72d7022f8
	.xword	0x2dd73356392f029e
	.xword	0x912f79c2feb00931
	.xword	0x7911170d2632feeb
	.xword	0x8f4de63c1dfe6d62
	.xword	0xd6ef0093e1c958f0
	.xword	0xef7fb0918bc62981
	.xword	0xde9166bee2d1f5ab
	.xword	0xb64bb2690b39b326
	.xword	0x8da952d043795134
	.xword	0xf56d4d8613b6152c
	.xword	0x5ef3a2dfcaaa9d26
	.xword	0x5431d663693ccd7f
	.xword	0x51241f59b08fef2a
	.xword	0xf60fb50e75de58e4
	.xword	0x9e2cd96f2e00b9eb
	.xword	0x5d263981d267b480
	.xword	0xeb015fa919036774
	.xword	0xce8d58863f401fdd
	.xword	0xc34b6f91d1496588
	.xword	0x7709c603898b27bd
	.xword	0x52aed933c47c3c54
	.xword	0x9ab36dde5f070faf
	.xword	0xa4b0034e71448ef3
	.xword	0x2ca7221ed730651e
	.xword	0x44c0e3551966d02b
	.xword	0x7fc741e38dc0328f
	.xword	0xa11681f0302e282d
	.xword	0x05617dc58fa82f4a
	.xword	0x343079fa466c9c0e
	.xword	0x9c487f7550f445b0
	.xword	0x6c8e523488a40316
	.xword	0x1c95ab96f6891f94
	.xword	0xdb341e34e0f2d655
	.xword	0xf9843d73caaba549
	.xword	0xabd70adf076de04c
	.xword	0x29240021a218d2be
	.xword	0xc306f4458a28d423
	.xword	0x5f637e7766b4ad6e
	.xword	0x77fe1f3440469ed9
	.xword	0x7453043db0d93a73
	.xword	0xcc0624f5a13bc1c7
	.xword	0x7cc89e4ca004ad1d
	.xword	0xba86f71e1b44c7c4
	.xword	0x3edac97374e1def1
	.xword	0xe8b89a21670ffc14
	.xword	0x45d8bd5740e35407
	.xword	0x3f91ad0db5414671
	.xword	0x0253e8d9d160f55b
	.xword	0x4b9f93379abeff0b
	.xword	0x96a0d6731b0399f7
	.xword	0x9f2e86f4fa73e21b
	.xword	0x3af5170565897f27
	.xword	0x6a7a27f9ca15ac0c
	.xword	0x947919959b5a96eb
	.xword	0x587e7b03305b36d9
	.xword	0x24834e71290febc9
	.xword	0x9f67ae5f12e0f69a
	.xword	0x8860a41067cdb487
	.xword	0x0757c5069db9129f
	.xword	0x12120d6c1c908e83
	.xword	0xbb3c6fb3a040c90d
	.xword	0x3e73eb8f95df691a
	.xword	0x0b80b52640b272c2
	.xword	0x3a32c2fda4d0cb81
	.xword	0x96a7e534611b850a
	.xword	0xf303e6bd457cae8c
	.xword	0x7a91f32ca7a8d586
	.xword	0xf54e718fe97bd21c
	.xword	0xa46bce5016ef0bf1
	.xword	0x82e8b696fc9725ad
	.xword	0x0fa8323ca90b5ee3
	.xword	0x4816f7420343ff43
	.xword	0x58b81b02e09678fb
	.xword	0xa7dc9a4977bcbf92
	.xword	0xa56d9e54ac4697c4
	.xword	0xaca22989764af778
	.xword	0xc18cca2868f09d5b
	.xword	0xf2a3c3a01190a835
	.xword	0x9d399bcc41560f83
	.xword	0x4902b27f57dec40b
	.xword	0xb905b423ff02a648
	.xword	0xbd7f36967f71a3e5
	.xword	0x6a68d1d2b4ed0af8
	.xword	0xf1d81d4325a09f42
	.xword	0xb88044b282588cc1
	.xword	0xaf2529caf73460d1
	.xword	0x62cd353064d848eb
	.xword	0xa3785efad42c8ba7
	.xword	0x54ce416be2b857e7
	.xword	0xd61c71b5db09e26e
	.xword	0xddc91b1215d8990e
	.xword	0x9ffeaab551df33bd
	.xword	0x9064645274489f18
	.xword	0x08b528f282112b18
	.xword	0xfa0abd0cff06742a
	.xword	0x8c0842d6d913d9f5
	.xword	0x4f6c6f5f4e44c47f
	.xword	0x1efa77deba6ee18e
	.xword	0x3b7e1fdd46dba247
	.xword	0x588ae35571161c3b
	.xword	0x8c1bd133f8a54102
	.xword	0x1c45981351a9e659
	.xword	0xe105466cdb408869
	.xword	0xaf80a7af9397a37f
	.xword	0x6fd813fc75b54535
	.xword	0x6dd8fa9d32b73fd1
	.xword	0xa8e3b0c2e61770cc
	.xword	0x836ffa5bbbf8fc4e
	.xword	0x58d3707f599d3f49
	.xword	0xbd0be55a43a48473
	.xword	0xba97f5b7457b5c65
	.xword	0x0ab7ce18f317370e
	.xword	0x4af3df1bc5a3141b
	.xword	0x1e10ae865e89e5d7
	.xword	0x40aa8abb393505ca
	.xword	0xcccfc28809500326
	.xword	0x71d11d257f791581
	.xword	0x4a0a596a7ce3fb20
	.xword	0x0ce8bafe18380284
	.xword	0x169b8ee0d8ded16e
	.xword	0xd34d734cdf24f32a
	.xword	0x4be81d1daf364427
	.xword	0x974bde2127f88b22
	.xword	0x555d0a8487905cf0
	.xword	0x29d1fd1c5e7651be
	.xword	0x1545dfd35f7cb96c
	.xword	0xb13d320296334c42
	.xword	0xc48786b9c6554a2f
	.xword	0xde7d434ac2b89fff
	.xword	0xb201a10ce5a93ae8
	.xword	0xa015cea4f24616b2
	.xword	0x0df49c8cae3a9b6d
	.xword	0xa8d80e5b63675473
	.xword	0x94945d02a510e774
	.xword	0xde93b0ad99af9a46
	.xword	0x7c8a3a54f51f9b8f
	.xword	0x6ea3da4f1d359b38
	.xword	0x72b8b32cec90035f
	.xword	0xfc3629493ec72250
	.xword	0x0d436bc46933a70c
	.xword	0x2207c9cbfa2152ff
	.xword	0xaea837d5b299fef3
	.xword	0x1329d35ce3fcdc9c
	.xword	0x227ac1a55d5db007
	.xword	0x7acbf7256ba197d5
	.xword	0x6a4003168b7f82de
	.xword	0xb88030a00c6ffa28
	.xword	0x582ab4fdc6c94c86
	.xword	0x9130a66293769a78
	.xword	0x0e65a511387e1741
	.xword	0x548c118f20da62be
	.xword	0xf5a47009bb168021
	.xword	0xbf3d6e92bd4b992f
	.xword	0x790382e2a07883a5
	.xword	0x86eef68dc555d1c0
	.xword	0xd76e6778bffb9dab
	.xword	0xb26478c480e34868
	.xword	0xdcf38548de5e2bf9
	.xword	0xef68020fcadfa22d
	.xword	0xec4c73ec9c635ea8
	.xword	0x635dddf7fe42cb61
	.xword	0x727d0d4440bd10ad
	.xword	0x2b21f92e725f74e6
	.xword	0x7bf670d2b4515353
	.xword	0x93cd301a66f43245
	.xword	0xa982094fa322d9e8
	.xword	0x44805d721210e284
	.xword	0x3dc09858ec40b347
	.xword	0xf780524968309b50
	.xword	0xf40cf4232ad1346c
	.xword	0x7522bbab5eac7985
	.xword	0x03c63c68af0f3b3f
	.xword	0x7d2127e7c7763e86
	.xword	0x539454dbf35543fd
	.xword	0x0e823da40fece1a1
	.xword	0xc428b2bd60fe3642
	.xword	0x53a841e253296ea5
	.xword	0x2a45aadd51a33781
	.xword	0x06a0cbbc7f283dea
	.xword	0x09c78f3c81f0bc4a
	.xword	0x374ceb404ef36e1a
	.xword	0xcf504875c0771ca5
	.xword	0xf65d5fc1f4d39baa
	.xword	0xf143df6b994c5f0e
	.xword	0xd3ed18de5ae3d378
	.xword	0x86f1100d209cc035
	.xword	0xc1a2d90b3e1fd2c6
	.xword	0x9acedf65c959a6cc
	.xword	0x0e6b842eb6131752
	.xword	0x32feabf6ca614d53
	.xword	0x39e816b73e2feaab
	.xword	0xa9df37c0ac5c15dd
	.xword	0x0c53d4a10a1dc4a9
	.xword	0x83b7520e6b6cb8d5
	.xword	0xe95d718d115932c5
	.align 0x80000
	.data
data_start_7:

	.xword	0xe3d5622740f60714
	.xword	0x6ddf32134155e1fa
	.xword	0x9e4f53437c393981
	.xword	0xe1f6587db485870a
	.xword	0x4492ca8068d3aea3
	.xword	0x386cba4c7d335547
	.xword	0xee2f32891c277a1a
	.xword	0xf63207ce80fd725e
	.xword	0x9ce469a6287317cc
	.xword	0x1e54a98cc205b8a7
	.xword	0xef0ed998df7aff26
	.xword	0xe92a33f0d4f0dc94
	.xword	0xdb8ecfe69f6dc339
	.xword	0x9dca3cf236338ad6
	.xword	0x2e861eca10147aa7
	.xword	0xaa8bead5d07f1b30
	.xword	0xd78f05d7bc6abd0e
	.xword	0x655a0a8806cfdcfc
	.xword	0xd3d72a0202a2fd4d
	.xword	0xedfc81b7fb731bf1
	.xword	0xd91b7c537da39467
	.xword	0xe622184eb7eb0d15
	.xword	0xd78b0482dac7de6e
	.xword	0x1777be507e602d27
	.xword	0x540b9bb6b5cc27e9
	.xword	0xa6cfaccf234b554d
	.xword	0xb2429f7ddd567bb4
	.xword	0x6b2a1df1df086430
	.xword	0x75a667e2e9e3bb08
	.xword	0x92b7692543847e0a
	.xword	0xb103644743feb2b3
	.xword	0xb28f15421a9a5b54
	.xword	0x13d136ddddae437e
	.xword	0x32589e490ad1ec88
	.xword	0x670cd1904eafd132
	.xword	0xc09e06afb8b6cfff
	.xword	0x1016ac07fce0e475
	.xword	0x156fa69ba30cb02f
	.xword	0x9ac6c3d537ae534c
	.xword	0x6e13a76010cd4663
	.xword	0xa71eb6ec1e4cfb53
	.xword	0x10a44a079f688ca8
	.xword	0x5d27f79e488061ca
	.xword	0x473b80fa66417aa0
	.xword	0x69f557fb94a7ea43
	.xword	0x81eb9d0d677918ca
	.xword	0xb4e7274de31e86ad
	.xword	0x460332c0334a3968
	.xword	0x417c773313803a86
	.xword	0x6117413c5f31f564
	.xword	0x653e6a8665a35ce3
	.xword	0xb243c7419c548edd
	.xword	0xe0ac5134201d2ef6
	.xword	0x12ec5d6264f709d3
	.xword	0x0115453e386c8931
	.xword	0x7520a2c837d8f154
	.xword	0x61af6bc81908d123
	.xword	0xe66aa1c0e83f757b
	.xword	0x676141c6f4dc386b
	.xword	0x7d3871676e72d681
	.xword	0xcee07afcc0813bf8
	.xword	0xe29450d552143b3a
	.xword	0xdafa65d0f4d71e0f
	.xword	0x71401786e9f55b15
	.xword	0x6c688611abc59cfc
	.xword	0x208018d437f7733f
	.xword	0x509f134dd626e58a
	.xword	0xa2193b4957dcb0c9
	.xword	0x3b2a56d27cc4beec
	.xword	0x94d5f1a2cc2581e0
	.xword	0x4ff7dbf079536a08
	.xword	0x9ecc42c7703bc174
	.xword	0x685d53f48070d677
	.xword	0x3e1ea0f58fa9aa79
	.xword	0xf5574b4befde9a06
	.xword	0x8481fa7904a859cd
	.xword	0xb5e03d95c18850ae
	.xword	0x031a31372c63d423
	.xword	0x1c6a61dc83b36137
	.xword	0xb58cbabcc96fbb6f
	.xword	0x0044931aaa96ced6
	.xword	0xd141a6d660bc5f42
	.xword	0xc8c908a87f740aae
	.xword	0x0f2367777d9b122e
	.xword	0x797f0588be3a68b1
	.xword	0x74ee0deacb6abfbf
	.xword	0x59a3ace87a73aac1
	.xword	0x3d01a729a08d8a62
	.xword	0x9d638744120615a3
	.xword	0x772f8b044c4fec67
	.xword	0x0fb19e9129805fc7
	.xword	0x2ac235665c88cbe5
	.xword	0x78f6949db5a87cf9
	.xword	0xe9aaf58bb6b8c064
	.xword	0xa3c6829dd5fbd07b
	.xword	0x07abe02727f62324
	.xword	0x4815a63295ac3330
	.xword	0x9846ad73f44b2d73
	.xword	0xb6899df0e0608ec4
	.xword	0x544eb94739fc7a63
	.xword	0xa7c6753ed05cc492
	.xword	0xbd8016004bcbf5a9
	.xword	0x31ca2ebd85a19ec1
	.xword	0xfff347030dc6d8df
	.xword	0x5faa91710fd86774
	.xword	0xf606ef16d250ca07
	.xword	0x512bde5ac1e508e3
	.xword	0x75bd929a8cf1ccd4
	.xword	0x3d827185eec96ff3
	.xword	0xc0a42ce856923a02
	.xword	0x57ed17d61c63238c
	.xword	0x6f725f010441d9c9
	.xword	0x4b314afeb4cdd046
	.xword	0xb5b667bf0cd0bb65
	.xword	0xd638bfe193ab1437
	.xword	0x9baa411b64cd3fb8
	.xword	0x3869650a45884989
	.xword	0xb1d084b4627c6756
	.xword	0x6d2962a6fb51ee69
	.xword	0xdc8e7e815ab46bc3
	.xword	0xb57e084426e25a53
	.xword	0x2f753f6872a28895
	.xword	0x3bcc56fc121307e1
	.xword	0x089e6b20947d2590
	.xword	0x3feb1513d70182d4
	.xword	0x5e4be24ed4e3b61d
	.xword	0x6fda828c34344aba
	.xword	0x4b5bed06b49208ec
	.xword	0x92b51fd8a915619f
	.xword	0xf589cf49532875b0
	.xword	0x0b9b76c999753776
	.xword	0x5ca4ccfc16a59482
	.xword	0x8c94edb70434d8d6
	.xword	0x986ea8c6e5c983ec
	.xword	0x2ca7e46c10090137
	.xword	0x982d754d227e0f9f
	.xword	0xcf47f0fc4273ee43
	.xword	0xbcc1ba3d0fcd614e
	.xword	0x1094bd74fb26a2a5
	.xword	0xaf06aa0021b8674e
	.xword	0xbd1a9d4b2dd47245
	.xword	0xe5375bf54077631d
	.xword	0x21aa9b1695b2b897
	.xword	0xbdc7ad4b88170236
	.xword	0x8eb41a3d48047074
	.xword	0x53453cb8f487b124
	.xword	0x8bc2d540792cd247
	.xword	0xd16dd0ace34e7771
	.xword	0xc068b9a7186e36a2
	.xword	0x9220bb2c56da3bf7
	.xword	0x55a81e965fa34485
	.xword	0xc45054f23378a647
	.xword	0x6ff2039e02af47c5
	.xword	0xa68e0d0fa5133bcf
	.xword	0xc6388295d58010c3
	.xword	0x5eadbdcd2204faf3
	.xword	0x0ec78fe5581a6328
	.xword	0xe9930d5feb851305
	.xword	0x822eff423255801d
	.xword	0xe6b90764a41ce544
	.xword	0x73e6ab26185573ce
	.xword	0x24bb420fa36fc4f5
	.xword	0xa419162f85e4b7fe
	.xword	0x4764224bc627f9a4
	.xword	0xda84257b80c71081
	.xword	0x4ae62285940cd9e9
	.xword	0x33d071433091ba07
	.xword	0x11c7a1ebd2af0524
	.xword	0x455d6f33c7f8750c
	.xword	0x57862bc84e59771d
	.xword	0x15d204a732efb926
	.xword	0xb9f249a6c1c37bd7
	.xword	0x534065f32e6174f4
	.xword	0x096ab59ea61f0ca6
	.xword	0x6cfff22d1708287f
	.xword	0xe5e2eed8cae1f9b6
	.xword	0x26e5d53540ed9c7c
	.xword	0x9fe5c2cac1023cd1
	.xword	0x6d1fd72f3c6c0f57
	.xword	0x90b4621bef8681c9
	.xword	0x437c3013f08b9e7d
	.xword	0xcd02d32158e218df
	.xword	0x4d8249e68ff46215
	.xword	0x6684fcd92e4293dd
	.xword	0xd008aa7562b5da75
	.xword	0xd96bb1b61f44b4f6
	.xword	0x692b6b06065dc0d3
	.xword	0xfb45661e65069f18
	.xword	0x45efd2fd77208cc5
	.xword	0x46dd3ce5171c87b7
	.xword	0xa5a0e9c3919bb3bc
	.xword	0x6f96afec49458608
	.xword	0x0bd39d2fada53775
	.xword	0xe6d45187d6039370
	.xword	0x1915f81ef657676b
	.xword	0x2449e34e796d9cb1
	.xword	0xed72a3e4b7bb6f7a
	.xword	0x792d13c14172a3c3
	.xword	0x63c9bb247281129f
	.xword	0xbc17ff9797f1e692
	.xword	0xebcf7d76f140c1e1
	.xword	0x4fbd79898f038d04
	.xword	0x0370489cfaac1291
	.xword	0xec9d3bf25329aa54
	.xword	0x15cd4c77689dff57
	.xword	0x63593641dbfab481
	.xword	0xbb221b77d5f47453
	.xword	0x0bdfbb7f91a6f184
	.xword	0xf77e5f17ccaaa007
	.xword	0x3f695d5a6667cbf0
	.xword	0xed21f5977753412c
	.xword	0x4a4ff7013fad5245
	.xword	0x776cc37f7bd2dc9c
	.xword	0x7b7db696a836cb80
	.xword	0x72f65cfea10e3dff
	.xword	0xdf9a84d118f4f758
	.xword	0xdbc28e89c158922f
	.xword	0xac831641e0405e34
	.xword	0x54209223f78e4abf
	.xword	0x1bc3f310f7530b82
	.xword	0x03d2c82bffae34dc
	.xword	0x7027d33c0d86fda0
	.xword	0x3a19f3adf6af95dc
	.xword	0x12438bb7f562c0e3
	.xword	0xf2e81c59b40ab96b
	.xword	0x26db1fcf7fe9f3ae
	.xword	0xd8d00be9a15e9b85
	.xword	0x75a4272fe277f4c4
	.xword	0xc46ce470d9ce53e3
	.xword	0x3b91b83442792b8f
	.xword	0x5b65b234d292be26
	.xword	0x81acb788a444560d
	.xword	0x18feec8165fd6593
	.xword	0xbfe64e1765cab35f
	.xword	0xffca21d45d4d4338
	.xword	0xabcf77a807fbf6e1
	.xword	0x75049a7ad456268a
	.xword	0x618a7d723fdc35de
	.xword	0xbe8e997350515ba8
	.xword	0xc92c5aaa02951ced
	.xword	0x27db4c577080cb19
	.xword	0xe936a8e2f7bba6f6
	.xword	0x7f5efb616c23a2e7
	.xword	0x1c0bced25feef08d
	.xword	0x1d05d58ab8ee92a4
	.xword	0xca9116a03ad9f41d
	.xword	0x1c3b3e557caaa035
	.xword	0x8d3d9af9db4e301a
	.xword	0x5a2076c7034e8bc0
	.xword	0x46387ec254e640b9
	.xword	0x6f89fa63216d7737
	.xword	0xe539a8dc266a807f
	.xword	0x5186dd98cbac77f3
	.xword	0xf343ad861e861778
	.xword	0x8ecc75a69b2598ed
	.xword	0xb82c69d3fe1b02bd



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
