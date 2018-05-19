// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: tlu_multi_mix_2_hwint_s0_20.s
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
   random seed:	640930175
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

	setx 0x1b0326599d49281a, %g1, %g0
	setx 0xc89b3b771d6d34fc, %g1, %g1
	setx 0xe93c458583f4fdbb, %g1, %g2
	setx 0xc81131001ffee413, %g1, %g3
	setx 0x5282fccf2121d36e, %g1, %g4
	setx 0xd4bb12d19f3060ad, %g1, %g5
	setx 0xa57a460ece50726d, %g1, %g6
	setx 0x7030be56ccac421e, %g1, %g7
	setx 0xc0586407f0eb1832, %g1, %r16
	setx 0x08afb1718c7f3add, %g1, %r17
	setx 0x0d98f5dc37174952, %g1, %r18
	setx 0x00013d2083c16da9, %g1, %r19
	setx 0xfaf7f137a4556539, %g1, %r20
	setx 0xfe7932a61f08383a, %g1, %r21
	setx 0x145fb78b1e5eab20, %g1, %r22
	setx 0x694bf62fc1c2eb5a, %g1, %r23
	setx 0x2b1d10d64d0c2a51, %g1, %r24
	setx 0x504a80e6ae7848ab, %g1, %r25
	setx 0x9c0140109d111b25, %g1, %r26
	setx 0x0f09bcb8558814bd, %g1, %r27
	setx 0x97f7561d151cb110, %g1, %r28
	setx 0x2025e73e38fdb402, %g1, %r29
	setx 0x6fe5cdfbf5595d06, %g1, %r30
	setx 0x1df3b2e2aebdbdd3, %g1, %r31
	save
	setx 0x0563a9a15d91d171, %g1, %r16
	setx 0x70166a1f5ae2955b, %g1, %r17
	setx 0x34a3bb39b216c02e, %g1, %r18
	setx 0xa07006130e00ac0c, %g1, %r19
	setx 0x2399052451ce81ce, %g1, %r20
	setx 0x6a82f9cc099a5380, %g1, %r21
	setx 0xa3cc75a49d7fdde8, %g1, %r22
	setx 0xad5ab7918311adca, %g1, %r23
	setx 0x50826b197c97ace6, %g1, %r24
	setx 0xf72e62a2addead4c, %g1, %r25
	setx 0x5fd07b0b63e5a2b5, %g1, %r26
	setx 0x96050b2944e0fa9b, %g1, %r27
	setx 0x4baadcfb0e0a065a, %g1, %r28
	setx 0x24d29d00ad22cdec, %g1, %r29
	setx 0xe0129abf19477609, %g1, %r30
	setx 0xbdb88a23bd9f09b5, %g1, %r31
	save
	setx 0x3af89458da02199f, %g1, %r16
	setx 0x4d805bea8ab134fd, %g1, %r17
	setx 0xbf2a651e37790bd3, %g1, %r18
	setx 0x0cec696304632cbe, %g1, %r19
	setx 0x8c10486d1fcbbdb7, %g1, %r20
	setx 0xddec388ad61aa73c, %g1, %r21
	setx 0x8adf484f1a2887f7, %g1, %r22
	setx 0x7c298a8f714a5009, %g1, %r23
	setx 0x47beec9ab69be6e8, %g1, %r24
	setx 0x17fdb24d8650b49f, %g1, %r25
	setx 0x3ff7d02a0bfd6811, %g1, %r26
	setx 0xed4e402b4ea121ef, %g1, %r27
	setx 0x51998222d8068a3f, %g1, %r28
	setx 0x7dc01604c68d8526, %g1, %r29
	setx 0x7cae9abe5e71f4a5, %g1, %r30
	setx 0x4feae61151382581, %g1, %r31
	save
	setx 0xa2090da65f7fecb9, %g1, %r16
	setx 0x8c356115e1afb907, %g1, %r17
	setx 0x7fc1ea1ef29b1b64, %g1, %r18
	setx 0xa0787824a141c638, %g1, %r19
	setx 0x0c24a737e7813a4c, %g1, %r20
	setx 0x0e494e466f01f5f2, %g1, %r21
	setx 0x69e6de0fd82c2f2b, %g1, %r22
	setx 0xc1efa838b1376fc1, %g1, %r23
	setx 0x02dcb19c073ff644, %g1, %r24
	setx 0x202a8f8a6c6fec91, %g1, %r25
	setx 0x114db531f779920c, %g1, %r26
	setx 0x461f10b1415d27cc, %g1, %r27
	setx 0x4c07ae10aa21d2a8, %g1, %r28
	setx 0x409d4cbdfbb7713f, %g1, %r29
	setx 0x47afd4dbfd2a6205, %g1, %r30
	setx 0x06c10f589e767be9, %g1, %r31
	save
	setx 0x1663ccc79fa57a70, %g1, %r16
	setx 0x8f0b1f7f10ecc9dd, %g1, %r17
	setx 0x4bcf1b113934f4f8, %g1, %r18
	setx 0x80553ecf45c77c03, %g1, %r19
	setx 0xb8edf488adb383e8, %g1, %r20
	setx 0x8ce47f5e6a52dce6, %g1, %r21
	setx 0x1cca64ca94380dad, %g1, %r22
	setx 0x382dc0845f743e24, %g1, %r23
	setx 0xd025bab4fb2fb6b5, %g1, %r24
	setx 0x271e6f8d043ac9b3, %g1, %r25
	setx 0x613c53a5692502fa, %g1, %r26
	setx 0xf5ac44059d139dde, %g1, %r27
	setx 0x325447653c92a7b1, %g1, %r28
	setx 0x3cf237918c7c1c28, %g1, %r29
	setx 0x26394aa7ff70af8f, %g1, %r30
	setx 0x5614f1c5a8441f81, %g1, %r31
	save
	setx 0xd54f040b9b826d89, %g1, %r16
	setx 0x1ca7a7806d4b0e4e, %g1, %r17
	setx 0x0873d86f746a3a53, %g1, %r18
	setx 0x75f7ac6e9778f54b, %g1, %r19
	setx 0x22ee46f754844761, %g1, %r20
	setx 0x43cc5ae00caa74a8, %g1, %r21
	setx 0x3f8d860a67c9fc21, %g1, %r22
	setx 0x46f63eff3a018914, %g1, %r23
	setx 0xdf54170b80e2aa6e, %g1, %r24
	setx 0x2da19c095ac1b768, %g1, %r25
	setx 0x606bf664fadecb91, %g1, %r26
	setx 0x4b63a4878d23e148, %g1, %r27
	setx 0x79c1143a17947893, %g1, %r28
	setx 0x23eff4cc61e2757a, %g1, %r29
	setx 0xe6c2ceb49e1d06c2, %g1, %r30
	setx 0xbd675e339df0eec1, %g1, %r31
	save
	setx 0xbffc7939c51ea96c, %g1, %r16
	setx 0x305d37705d54fd92, %g1, %r17
	setx 0xeee3d03354071c37, %g1, %r18
	setx 0xee7fadff0fe6bc4d, %g1, %r19
	setx 0xf826941b35efbb75, %g1, %r20
	setx 0x78595f7ddb2a5253, %g1, %r21
	setx 0xf1d10fbadcae7352, %g1, %r22
	setx 0x607a18d4012c8c85, %g1, %r23
	setx 0xd7a39e494a859aee, %g1, %r24
	setx 0x08bf5eedd10ed877, %g1, %r25
	setx 0xcb2b05e3fef4eb56, %g1, %r26
	setx 0xe72fbab540768101, %g1, %r27
	setx 0x7547b35d43a247b6, %g1, %r28
	setx 0x314120a1fa4e29a8, %g1, %r29
	setx 0xa961ba984a355a27, %g1, %r30
	setx 0xf89ece3ad607eb26, %g1, %r31
	save
	setx 0xbfc708d5282c95c1, %g1, %r16
	setx 0x2d8f36f9c66c0c03, %g1, %r17
	setx 0x6386f2b7a64635b9, %g1, %r18
	setx 0x7b248f1923c09c21, %g1, %r19
	setx 0x1b385d70e51864df, %g1, %r20
	setx 0x66b4357ddaa59cb3, %g1, %r21
	setx 0x90ee5c9707d934b8, %g1, %r22
	setx 0x3758b015ef5d066f, %g1, %r23
	setx 0xac792f7d2b3b9c60, %g1, %r24
	setx 0x0dd84f95658094c3, %g1, %r25
	setx 0x0bd2bda320ad0a28, %g1, %r26
	setx 0xc7ed6a65a00994b8, %g1, %r27
	setx 0xf12998602df006d7, %g1, %r28
	setx 0xf3d5986ba583f514, %g1, %r29
	setx 0x9248983fe9ab2e3a, %g1, %r30
	setx 0xf3d0c8560d26de1b, %g1, %r31
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
	.word 0xb5e461b5  ! 9: SAVE_I	save	%r17, 0x0001, %r26
	setx	0xa04a13a500005944, %g1, %r10
	.word 0x819a8000  ! 10: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xbde52101  ! 13: SAVE_I	save	%r20, 0x0001, %r30
	.word 0xb7e5617a  ! 14: SAVE_I	save	%r21, 0x0001, %r27
	.word 0x919420a0  ! 20: WRPR_PIL_I	wrpr	%r16, 0x00a0, %pil
	.word 0xb9e4e10a  ! 26: SAVE_I	save	%r19, 0x0001, %r28
	.word 0xbde521ca  ! 27: SAVE_I	save	%r20, 0x0001, %r30
	.word 0x8394202a  ! 30: WRPR_TNPC_I	wrpr	%r16, 0x002a, %tnpc
	.word 0xb1e521a0  ! 32: SAVE_I	save	%r20, 0x0001, %r24
	.word 0xb3508000  ! 35: RDPR_TSTATE	<illegal instruction>
	.word 0xb5e4e1f4  ! 41: SAVE_I	save	%r19, 0x0001, %r26
	.word 0xb1e42151  ! 44: SAVE_I	save	%r16, 0x0001, %r24
	.word 0xbbe42144  ! 45: SAVE_I	save	%r16, 0x0001, %r29
	.word 0xb5e4a0bc  ! 46: SAVE_I	save	%r18, 0x0001, %r26
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb1e4e173  ! 51: SAVE_I	save	%r19, 0x0001, %r24
hwintr_0_0:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_0), 16, 16)) -> intp(0, 0, 9)
	.word 0xbbe4a1f7  ! 53: SAVE_I	save	%r18, 0x0001, %r29
	.word 0xbde421be  ! 54: SAVE_I	save	%r16, 0x0001, %r30
	.word 0x839420c6  ! 55: WRPR_TNPC_I	wrpr	%r16, 0x00c6, %tnpc
	.word 0xb6bc61ec  ! 56: XNORcc_I	xnorcc 	%r17, 0x01ec, %r27
hwintr_0_1:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_1), 16, 16)) -> intp(0, 0, 21)
	.word 0xbd2d1000  ! 61: SLLX_R	sllx	%r20, %r0, %r30
hwintr_0_2:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_2), 16, 16)) -> intp(0, 0, 26)
	setx	0x130cbf00008b9c, %g1, %r10
	.word 0x839a8000  ! 65: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb1e42179  ! 66: SAVE_I	save	%r16, 0x0001, %r24
	setx	0xd612e7630000ce46, %g1, %r10
	.word 0x839a8000  ! 67: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0x8195a07f  ! 71: WRPR_TPC_I	wrpr	%r22, 0x007f, %tpc
	.word 0xb5e4608a  ! 72: SAVE_I	save	%r17, 0x0001, %r26
	.word 0xb2c48000  ! 73: ADDCcc_R	addccc 	%r18, %r0, %r25
hwintr_0_3:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_3), 16, 16)) -> intp(0, 0, 3f)
	.word 0xba44c000  ! 75: ADDC_R	addc 	%r19, %r0, %r29
	.word 0xbde5a1c2  ! 77: SAVE_I	save	%r22, 0x0001, %r30
	.word 0xbbe46077  ! 78: SAVE_I	save	%r17, 0x0001, %r29
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbbe42055  ! 83: SAVE_I	save	%r16, 0x0001, %r29
hwintr_0_4:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_4), 16, 16)) -> intp(0, 0, 23)
	.word 0xbd518000  ! 90: RDPR_PSTATE	<illegal instruction>
	.word 0xb7e4609c  ! 91: SAVE_I	save	%r17, 0x0001, %r27
	mov	2, %r12
	.word 0xa1930000  ! 93: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb9e4e1de  ! 95: SAVE_I	save	%r19, 0x0001, %r28
	.word 0xb7e5611b  ! 105: SAVE_I	save	%r21, 0x0001, %r27
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbf504000  ! 108: RDPR_TNPC	<illegal instruction>
	.word 0xbcb40000  ! 109: ORNcc_R	orncc 	%r16, %r0, %r30
	.word 0x85956070  ! 111: WRPR_TSTATE_I	wrpr	%r21, 0x0070, %tstate
	.word 0xbfe4a128  ! 122: SAVE_I	save	%r18, 0x0001, %r31
	.word 0xbfe4e066  ! 123: SAVE_I	save	%r19, 0x0001, %r31
	.word 0xbbe5a08d  ! 124: SAVE_I	save	%r22, 0x0001, %r29
	.word 0xb1e4e165  ! 125: SAVE_I	save	%r19, 0x0001, %r24
	.word 0x85942080  ! 127: WRPR_TSTATE_I	wrpr	%r16, 0x0080, %tstate
	.word 0xbb510000  ! 131: RDPR_TICK	<illegal instruction>
	.word 0xb0c4e048  ! 132: ADDCcc_I	addccc 	%r19, 0x0048, %r24
	setx	0x64c9771d00001997, %g1, %r10
	.word 0x839a8000  ! 134: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb9540000  ! 138: RDPR_GL	<illegal instruction>
	.word 0xb1e4e148  ! 149: SAVE_I	save	%r19, 0x0001, %r24
	.word 0xb3e521bc  ! 150: SAVE_I	save	%r20, 0x0001, %r25
	.word 0xb9e460ca  ! 152: SAVE_I	save	%r17, 0x0001, %r28
hwintr_0_5:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_5), 16, 16)) -> intp(0, 0, 2a)
	.word 0xb3e5e028  ! 155: SAVE_I	save	%r23, 0x0001, %r25
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb5e4e1f5  ! 164: SAVE_I	save	%r19, 0x0001, %r26
	.word 0xbde5a084  ! 165: SAVE_I	save	%r22, 0x0001, %r30
	.word 0xb9e56052  ! 170: SAVE_I	save	%r21, 0x0001, %r28
hwintr_0_6:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_6), 16, 16)) -> intp(0, 0, 6)
	.word 0xbde56123  ! 174: SAVE_I	save	%r21, 0x0001, %r30
	.word 0xb551c000  ! 177: RDPR_TL	<illegal instruction>
	setx	data_start_4, %g1, %r22
	.word 0xbbe5603a  ! 183: SAVE_I	save	%r21, 0x0001, %r29
	.word 0xbd480000  ! 184: RDHPR_HPSTATE	rdhpr	%hpstate, %r30
	.word 0xb7518000  ! 185: RDPR_PSTATE	<illegal instruction>
	.word 0xb9e460bc  ! 186: SAVE_I	save	%r17, 0x0001, %r28
hwintr_0_7:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_7), 16, 16)) -> intp(0, 0, 1a)
	.word 0xbbe4e14c  ! 191: SAVE_I	save	%r19, 0x0001, %r29
	.word 0xbfe520bd  ! 193: SAVE_I	save	%r20, 0x0001, %r31
	setx	data_start_0, %g1, %r19
hwintr_0_8:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_8), 16, 16)) -> intp(0, 0, 29)
	.word 0xb3e4e156  ! 201: SAVE_I	save	%r19, 0x0001, %r25
	.word 0xbbe4e14d  ! 202: SAVE_I	save	%r19, 0x0001, %r29
	.word 0xb3e4e165  ! 204: SAVE_I	save	%r19, 0x0001, %r25
	.word 0xb5e4e079  ! 205: SAVE_I	save	%r19, 0x0001, %r26
	.word 0xb9e521b7  ! 206: SAVE_I	save	%r20, 0x0001, %r28
	.word 0x81942025  ! 207: WRPR_TPC_I	wrpr	%r16, 0x0025, %tpc
hwintr_0_9:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_9), 16, 16)) -> intp(0, 0, 20)
	.word 0xb7e461c7  ! 214: SAVE_I	save	%r17, 0x0001, %r27
	setx	0x25ec1cc40000fb10, %g1, %r10
	.word 0x819a8000  ! 215: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xb9e4a1ff  ! 221: SAVE_I	save	%r18, 0x0001, %r28
	.word 0xb1e420cc  ! 223: SAVE_I	save	%r16, 0x0001, %r24
	.word 0xbfe5600c  ! 225: SAVE_I	save	%r21, 0x0001, %r31
	.word 0xb5e460b2  ! 226: SAVE_I	save	%r17, 0x0001, %r26
	.word 0xb9e461b5  ! 228: SAVE_I	save	%r17, 0x0001, %r28
	.word 0xb1e42197  ! 229: SAVE_I	save	%r16, 0x0001, %r24
	.word 0xb9e521a1  ! 233: SAVE_I	save	%r20, 0x0001, %r28
	setx	0x1bb5489d000039cc, %g1, %r10
	.word 0x819a8000  ! 236: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xb635e181  ! 237: ORN_I	orn 	%r23, 0x0181, %r27
	.word 0xbbe56064  ! 239: SAVE_I	save	%r21, 0x0001, %r29
	.word 0xbb508000  ! 240: RDPR_TSTATE	<illegal instruction>
hwintr_0_10:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_10), 16, 16)) -> intp(0, 0, a)
	.word 0xb6b5e09e  ! 245: SUBCcc_I	orncc 	%r23, 0x009e, %r27
	.word 0xbb51c000  ! 246: RDPR_TL	<illegal instruction>
	.word 0xbfe4e03e  ! 250: SAVE_I	save	%r19, 0x0001, %r31
	.word 0xbfe42152  ! 251: SAVE_I	save	%r16, 0x0001, %r31
	.word 0xb551c000  ! 255: RDPR_TL	<illegal instruction>
	.word 0xbbe4e13c  ! 256: SAVE_I	save	%r19, 0x0001, %r29
	.word 0xb2c5c000  ! 262: ADDCcc_R	addccc 	%r23, %r0, %r25
hwintr_0_11:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_11), 16, 16)) -> intp(0, 0, 25)
	.word 0xbde5a152  ! 265: SAVE_I	save	%r22, 0x0001, %r30
	.word 0xb61d4000  ! 266: XOR_R	xor 	%r21, %r0, %r27
	.word 0xb21cc000  ! 267: XOR_R	xor 	%r19, %r0, %r25
	.word 0xb1641800  ! 268: MOVcc_R	<illegal instruction>
	.word 0x8595e0dc  ! 269: WRPR_TSTATE_I	wrpr	%r23, 0x00dc, %tstate
	.word 0x8395a1a8  ! 270: WRPR_TNPC_I	wrpr	%r22, 0x01a8, %tnpc
hwintr_0_12:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_12), 16, 16)) -> intp(0, 0, 34)
hwintr_0_13:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_13), 16, 16)) -> intp(0, 0, 38)
	.word 0xb9e4613b  ! 279: SAVE_I	save	%r17, 0x0001, %r28
	.word 0x8395a173  ! 283: WRPR_TNPC_I	wrpr	%r22, 0x0173, %tnpc
	setx	0x8886c17e00009ed0, %g1, %r10
	.word 0x819a8000  ! 285: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xb1e561d0  ! 286: SAVE_I	save	%r21, 0x0001, %r24
	.word 0xb5e56170  ! 288: SAVE_I	save	%r21, 0x0001, %r26
	.word 0xb63dc000  ! 289: XNOR_R	xnor 	%r23, %r0, %r27
	.word 0xb7e4e00c  ! 292: SAVE_I	save	%r19, 0x0001, %r27
	.word 0xbb540000  ! 296: RDPR_GL	<illegal instruction>
	.word 0xb5e4200e  ! 298: SAVE_I	save	%r16, 0x0001, %r26
	.word 0xb5e5a068  ! 301: SAVE_I	save	%r22, 0x0001, %r26
	.word 0xb3540000  ! 302: RDPR_GL	<illegal instruction>
	.word 0xb9e42152  ! 303: SAVE_I	save	%r16, 0x0001, %r28
	.word 0xb3e42042  ! 309: SAVE_I	save	%r16, 0x0001, %r25
	.word 0xb49cc000  ! 312: XORcc_R	xorcc 	%r19, %r0, %r26
	.word 0xb9e52162  ! 313: SAVE_I	save	%r20, 0x0001, %r28
	.word 0xbfe52169  ! 314: SAVE_I	save	%r20, 0x0001, %r31
	.word 0xb6b48000  ! 315: SUBCcc_R	orncc 	%r18, %r0, %r27
	.word 0xb1e521f8  ! 316: SAVE_I	save	%r20, 0x0001, %r24
	.word 0xb9e4e0d8  ! 317: SAVE_I	save	%r19, 0x0001, %r28
	.word 0xb9540000  ! 319: RDPR_GL	<illegal instruction>
	.word 0xbfe4a07a  ! 320: SAVE_I	save	%r18, 0x0001, %r31
	.word 0xb3e4e1e3  ! 323: SAVE_I	save	%r19, 0x0001, %r25
	.word 0xbab5e07f  ! 325: ORNcc_I	orncc 	%r23, 0x007f, %r29
	.word 0x8394e004  ! 328: WRPR_TNPC_I	wrpr	%r19, 0x0004, %tnpc
	.word 0x8394e1b4  ! 330: WRPR_TNPC_I	wrpr	%r19, 0x01b4, %tnpc
	.word 0xbfe461ba  ! 332: SAVE_I	save	%r17, 0x0001, %r31
hwintr_0_14:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_14), 16, 16)) -> intp(0, 0, 11)
	.word 0xb5e420fe  ! 341: SAVE_I	save	%r16, 0x0001, %r26
	.word 0xbbe460f6  ! 343: SAVE_I	save	%r17, 0x0001, %r29
	.word 0x8d95a1c2  ! 344: WRPR_PSTATE_I	wrpr	%r22, 0x01c2, %pstate
hwintr_0_15:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_15), 16, 16)) -> intp(0, 0, 2f)
	.word 0xb5e52011  ! 347: SAVE_I	save	%r20, 0x0001, %r26
	.word 0xb7e4a19e  ! 349: SAVE_I	save	%r18, 0x0001, %r27
hwintr_0_16:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_16), 16, 16)) -> intp(0, 0, 34)
hwintr_0_17:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_17), 16, 16)) -> intp(0, 0, 23)
	.word 0xbde4203d  ! 355: SAVE_I	save	%r16, 0x0001, %r30
	.word 0x8994a17f  ! 356: WRPR_TICK_I	wrpr	%r18, 0x017f, %tick
	.word 0xbd480000  ! 358: RDHPR_HPSTATE	rdhpr	%hpstate, %r30
hwintr_0_18:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_18), 16, 16)) -> intp(0, 0, 2f)
	.word 0xbbe5e0b7  ! 365: SAVE_I	save	%r23, 0x0001, %r29
	setx	0x444cec63000039dc, %g1, %r10
	.word 0x839a8000  ! 367: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	mov	1, %r12
	.word 0x8f930000  ! 368: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0x8194e0e7  ! 372: WRPR_TPC_I	wrpr	%r19, 0x00e7, %tpc
	.word 0xb934e001  ! 373: SRL_I	srl 	%r19, 0x0001, %r28
hwintr_0_19:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_19), 16, 16)) -> intp(0, 0, c)
	.word 0xb9e4e0c1  ! 378: SAVE_I	save	%r19, 0x0001, %r28
	.word 0xb9e56187  ! 380: SAVE_I	save	%r21, 0x0001, %r28
	.word 0xbfe421f2  ! 381: SAVE_I	save	%r16, 0x0001, %r31
	.word 0xb1e461d9  ! 382: SAVE_I	save	%r17, 0x0001, %r24
	.word 0xb3e4e1fb  ! 383: SAVE_I	save	%r19, 0x0001, %r25
	setx	0x81806c560000ad48, %g1, %r10
	.word 0x819a8000  ! 385: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xb1e420ac  ! 388: SAVE_I	save	%r16, 0x0001, %r24
	.word 0xb9e520df  ! 389: SAVE_I	save	%r20, 0x0001, %r28
	.word 0xb3e5a0b0  ! 391: SAVE_I	save	%r22, 0x0001, %r25
hwintr_0_20:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_20), 16, 16)) -> intp(0, 0, a)
	.word 0x8395209e  ! 396: WRPR_TNPC_I	wrpr	%r20, 0x009e, %tnpc
	.word 0x8995e073  ! 398: WRPR_TICK_I	wrpr	%r23, 0x0073, %tick
	.word 0xbb50c000  ! 399: RDPR_TT	<illegal instruction>
	.word 0xb1e5202a  ! 401: SAVE_I	save	%r20, 0x0001, %r24
	.word 0xbc95c000  ! 402: ORcc_R	orcc 	%r23, %r0, %r30
	.word 0xbbe4a173  ! 406: SAVE_I	save	%r18, 0x0001, %r29
	.word 0xb7e42085  ! 407: SAVE_I	save	%r16, 0x0001, %r27
	.word 0xbb643801  ! 410: MOVcc_I	<illegal instruction>
	.word 0x91956014  ! 411: WRPR_PIL_I	wrpr	%r21, 0x0014, %pil
	setx	data_start_1, %g1, %r20
	mov	2, %r12
	.word 0xa1930000  ! 413: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xbde46115  ! 416: SAVE_I	save	%r17, 0x0001, %r30
hwintr_0_21:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_21), 16, 16)) -> intp(0, 0, 1a)
	.word 0xbbe52082  ! 421: SAVE_I	save	%r20, 0x0001, %r29
	.word 0x8d946131  ! 422: WRPR_PSTATE_I	wrpr	%r17, 0x0131, %pstate
	.word 0xb7e4e1d5  ! 423: SAVE_I	save	%r19, 0x0001, %r27
	.word 0xbfe5e035  ! 425: SAVE_I	save	%r23, 0x0001, %r31
	.word 0xb3e560c1  ! 428: SAVE_I	save	%r21, 0x0001, %r25
	.word 0xb3e420b5  ! 432: SAVE_I	save	%r16, 0x0001, %r25
	.word 0xb1e4a05e  ! 433: SAVE_I	save	%r18, 0x0001, %r24
	.word 0xb1e5e127  ! 436: SAVE_I	save	%r23, 0x0001, %r24
	.word 0xbde4217c  ! 440: SAVE_I	save	%r16, 0x0001, %r30
	.word 0xb5e5a15d  ! 441: SAVE_I	save	%r22, 0x0001, %r26
	.word 0xb9e4e163  ! 444: SAVE_I	save	%r19, 0x0001, %r28
	.word 0xbfe421de  ! 445: SAVE_I	save	%r16, 0x0001, %r31
	setx	0x4e48c5cb0000dd84, %g1, %r10
	.word 0x819a8000  ! 449: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xb1e4e1c7  ! 452: SAVE_I	save	%r19, 0x0001, %r24
	.word 0xb5e4e082  ! 457: SAVE_I	save	%r19, 0x0001, %r26
	.word 0xb534d000  ! 460: SRLX_R	srlx	%r19, %r0, %r26
	.word 0x819420b9  ! 461: WRPR_TPC_I	wrpr	%r16, 0x00b9, %tpc
	.word 0xb7e5e106  ! 463: SAVE_I	save	%r23, 0x0001, %r27
	.word 0xb5e5214e  ! 465: SAVE_I	save	%r20, 0x0001, %r26
hwintr_0_22:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_22), 16, 16)) -> intp(0, 0, 33)
	.word 0xb3e5611e  ! 469: SAVE_I	save	%r21, 0x0001, %r25
	.word 0xb7e561d8  ! 473: SAVE_I	save	%r21, 0x0001, %r27
	.word 0xb3e4a001  ! 475: SAVE_I	save	%r18, 0x0001, %r25
	.word 0xb2348000  ! 480: SUBC_R	orn 	%r18, %r0, %r25
	.word 0xb7e521d6  ! 481: SAVE_I	save	%r20, 0x0001, %r27
	.word 0xb9e5a043  ! 482: SAVE_I	save	%r22, 0x0001, %r28
	.word 0xbde5616a  ! 483: SAVE_I	save	%r21, 0x0001, %r30
	.word 0xb5e4e03a  ! 485: SAVE_I	save	%r19, 0x0001, %r26
	.word 0xb6bca00f  ! 486: XNORcc_I	xnorcc 	%r18, 0x000f, %r27
	.word 0xb5e4a10a  ! 487: SAVE_I	save	%r18, 0x0001, %r26
	.word 0xb9e5e0a8  ! 488: SAVE_I	save	%r23, 0x0001, %r28
	.word 0x8d9561b9  ! 494: WRPR_PSTATE_I	wrpr	%r21, 0x01b9, %pstate
	setx	data_start_7, %g1, %r16
	.word 0xb7e4a116  ! 498: SAVE_I	save	%r18, 0x0001, %r27
	.word 0xb7e521ec  ! 501: SAVE_I	save	%r20, 0x0001, %r27
	.word 0xb9e521cb  ! 504: SAVE_I	save	%r20, 0x0001, %r28
	.word 0x8994e102  ! 505: WRPR_TICK_I	wrpr	%r19, 0x0102, %tick
	.word 0xb41d21e4  ! 509: XOR_I	xor 	%r20, 0x01e4, %r26
	.word 0xbde4e0db  ! 514: SAVE_I	save	%r19, 0x0001, %r30
	.word 0xbb51c000  ! 515: RDPR_TL	<illegal instruction>
	.word 0xb93cf001  ! 516: SRAX_I	srax	%r19, 0x0001, %r28
	.word 0x839461a0  ! 523: WRPR_TNPC_I	wrpr	%r17, 0x01a0, %tnpc
	.word 0xb7e4e0fa  ! 525: SAVE_I	save	%r19, 0x0001, %r27
	.word 0xb9500000  ! 531: RDPR_TPC	<illegal instruction>
	.word 0x91952041  ! 532: WRPR_PIL_I	wrpr	%r20, 0x0041, %pil
hwintr_0_23:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_23), 16, 16)) -> intp(0, 0, 32)
	setx	data_start_1, %g1, %r20
	.word 0xb7508000  ! 540: RDPR_TSTATE	<illegal instruction>
	.word 0xb9e56166  ! 545: SAVE_I	save	%r21, 0x0001, %r28
hwintr_0_24:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_24), 16, 16)) -> intp(0, 0, 2f)
	.word 0xb1e46024  ! 549: SAVE_I	save	%r17, 0x0001, %r24
	.word 0xb3e4a186  ! 552: SAVE_I	save	%r18, 0x0001, %r25
	.word 0xbde4e187  ! 553: SAVE_I	save	%r19, 0x0001, %r30
hwintr_0_25:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_25), 16, 16)) -> intp(0, 0, 25)
hwintr_0_26:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_26), 16, 16)) -> intp(0, 0, 39)
	.word 0xb7540000  ! 562: RDPR_GL	<illegal instruction>
	.word 0xbbe5601a  ! 566: SAVE_I	save	%r21, 0x0001, %r29
	.word 0xbbe520d6  ! 573: SAVE_I	save	%r20, 0x0001, %r29
	.word 0xb72cb001  ! 576: SLLX_I	sllx	%r18, 0x0001, %r27
	.word 0xb97c0400  ! 580: MOVR_R	movre	%r16, %r0, %r28
	.word 0x819521ba  ! 582: WRPR_TPC_I	wrpr	%r20, 0x01ba, %tpc
	.word 0xb1540000  ! 584: RDPR_GL	<illegal instruction>
	.word 0xb60c603d  ! 585: AND_I	and 	%r17, 0x003d, %r27
	.word 0xb9e52176  ! 587: SAVE_I	save	%r20, 0x0001, %r28
hwintr_0_27:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_27), 16, 16)) -> intp(0, 0, 33)
	.word 0xbf520000  ! 591: RDPR_PIL	<illegal instruction>
	.word 0xbf3d9000  ! 592: SRAX_R	srax	%r22, %r0, %r31
	.word 0xbca42083  ! 594: SUBcc_I	subcc 	%r16, 0x0083, %r30
	.word 0xb1e4a1c8  ! 595: SAVE_I	save	%r18, 0x0001, %r24
	.word 0xbfe46040  ! 597: SAVE_I	save	%r17, 0x0001, %r31
	setx	data_start_1, %g1, %r21
	.word 0xb43ce1e9  ! 600: XNOR_I	xnor 	%r19, 0x01e9, %r26
	setx	data_start_4, %g1, %r22
	.word 0xbde4e007  ! 605: SAVE_I	save	%r19, 0x0001, %r30
	.word 0xb5e4a1a5  ! 607: SAVE_I	save	%r18, 0x0001, %r26
	.word 0xb3504000  ! 609: RDPR_TNPC	<illegal instruction>
	.word 0xb1e561cc  ! 612: SAVE_I	save	%r21, 0x0001, %r24
	.word 0x8d94e17b  ! 613: WRPR_PSTATE_I	wrpr	%r19, 0x017b, %pstate
	.word 0xbbe4a0bf  ! 617: SAVE_I	save	%r18, 0x0001, %r29
	.word 0x83942171  ! 621: WRPR_TNPC_I	wrpr	%r16, 0x0171, %tnpc
	.word 0xbfe4a153  ! 622: SAVE_I	save	%r18, 0x0001, %r31
	.word 0xb7e421bb  ! 623: SAVE_I	save	%r16, 0x0001, %r27
	.word 0xbde420a2  ! 624: SAVE_I	save	%r16, 0x0001, %r30
	.word 0xb7e460f2  ! 626: SAVE_I	save	%r17, 0x0001, %r27
	.word 0xb3e5a1ea  ! 627: SAVE_I	save	%r22, 0x0001, %r25
	.word 0x879421ff  ! 628: WRPR_TT_I	wrpr	%r16, 0x01ff, %tt
	.word 0xb5e4212b  ! 630: SAVE_I	save	%r16, 0x0001, %r26
	.word 0x81956131  ! 639: WRPR_TPC_I	wrpr	%r21, 0x0131, %tpc
	setx	data_start_7, %g1, %r18
	.word 0xb5e5a1ef  ! 642: SAVE_I	save	%r22, 0x0001, %r26
	.word 0xbbe5e0a3  ! 644: SAVE_I	save	%r23, 0x0001, %r29
	.word 0xb9e4a19c  ! 646: SAVE_I	save	%r18, 0x0001, %r28
	.word 0xb3e5a023  ! 648: SAVE_I	save	%r22, 0x0001, %r25
	.word 0xbf504000  ! 654: RDPR_TNPC	<illegal instruction>
	.word 0xb5e5e0fc  ! 659: SAVE_I	save	%r23, 0x0001, %r26
	setx	0x430093910000df9b, %g1, %r10
	.word 0x819a8000  ! 660: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xb5e5a199  ! 661: SAVE_I	save	%r22, 0x0001, %r26
	.word 0xb7540000  ! 672: RDPR_GL	<illegal instruction>
	.word 0xb53c9000  ! 674: SRAX_R	srax	%r18, %r0, %r26
	.word 0x8d942110  ! 676: WRPR_PSTATE_I	wrpr	%r16, 0x0110, %pstate
	.word 0xbe244000  ! 678: SUB_R	sub 	%r17, %r0, %r31
	.word 0xbbe5a05f  ! 679: SAVE_I	save	%r22, 0x0001, %r29
hwintr_0_28:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_28), 16, 16)) -> intp(0, 0, 34)
	.word 0xb5504000  ! 681: RDPR_TNPC	<illegal instruction>
	.word 0xb550c000  ! 683: RDPR_TT	<illegal instruction>
	.word 0xbd520000  ! 687: RDPR_PIL	<illegal instruction>
	.word 0xb9e4a1db  ! 688: SAVE_I	save	%r18, 0x0001, %r28
	.word 0x8994e023  ! 691: WRPR_TICK_I	wrpr	%r19, 0x0023, %tick
	.word 0xb9e4200f  ! 693: SAVE_I	save	%r16, 0x0001, %r28
	.word 0xb7e46188  ! 694: SAVE_I	save	%r17, 0x0001, %r27
	.word 0x83946177  ! 696: WRPR_TNPC_I	wrpr	%r17, 0x0177, %tnpc
	.word 0xbbe421c8  ! 700: SAVE_I	save	%r16, 0x0001, %r29
	.word 0xbde5a0bf  ! 702: SAVE_I	save	%r22, 0x0001, %r30
	setx	data_start_4, %g1, %r16
	.word 0xb3340000  ! 706: SRL_R	srl 	%r16, %r0, %r25
	mov	0, %r12
	.word 0xa1930000  ! 708: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb9e52118  ! 710: SAVE_I	save	%r20, 0x0001, %r28
	setx	data_start_1, %g1, %r23
	.word 0xbbe4a0e8  ! 715: SAVE_I	save	%r18, 0x0001, %r29
	.word 0xb3e4603f  ! 717: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xb9e5e0e9  ! 718: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xbde5a17f  ! 722: SAVE_I	save	%r22, 0x0001, %r30
	.word 0xb1e5a173  ! 724: SAVE_I	save	%r22, 0x0001, %r24
	.word 0xbde5a04b  ! 725: SAVE_I	save	%r22, 0x0001, %r30
	.word 0xbbe4e012  ! 728: SAVE_I	save	%r19, 0x0001, %r29
	.word 0xb7e5a020  ! 735: SAVE_I	save	%r22, 0x0001, %r27
	setx	data_start_6, %g1, %r20
	setx	0xa1a2c96400001a5f, %g1, %r10
	.word 0x819a8000  ! 741: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xb5e42067  ! 746: SAVE_I	save	%r16, 0x0001, %r26
hwintr_0_29:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_29), 16, 16)) -> intp(0, 0, 1f)
	.word 0xbde561f7  ! 748: SAVE_I	save	%r21, 0x0001, %r30
	.word 0xbbe4a0df  ! 749: SAVE_I	save	%r18, 0x0001, %r29
	setx	0xaa5022a700009e05, %g1, %r10
	.word 0x819a8000  ! 751: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0x8794a1d8  ! 760: WRPR_TT_I	wrpr	%r18, 0x01d8, %tt
	.word 0xbf50c000  ! 762: RDPR_TT	<illegal instruction>
	.word 0xbbe56052  ! 763: SAVE_I	save	%r21, 0x0001, %r29
	.word 0xb7e560cf  ! 765: SAVE_I	save	%r21, 0x0001, %r27
hwintr_0_30:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_30), 16, 16)) -> intp(0, 0, 3a)
	setx	data_start_7, %g1, %r20
	.word 0x85942074  ! 777: WRPR_TSTATE_I	wrpr	%r16, 0x0074, %tstate
	.word 0xb1e5e1ea  ! 780: SAVE_I	save	%r23, 0x0001, %r24
	.word 0xbbe5a08e  ! 781: SAVE_I	save	%r22, 0x0001, %r29
	.word 0xb7e5a077  ! 783: SAVE_I	save	%r22, 0x0001, %r27
	.word 0xbd520000  ! 784: RDPR_PIL	<illegal instruction>
	.word 0xba3ca0fd  ! 786: XNOR_I	xnor 	%r18, 0x00fd, %r29
	setx	data_start_1, %g1, %r22
	setx	data_start_0, %g1, %r17
	.word 0xb1e5e1ca  ! 791: SAVE_I	save	%r23, 0x0001, %r24
	.word 0x8994a1b4  ! 795: WRPR_TICK_I	wrpr	%r18, 0x01b4, %tick
	.word 0xbfe461e1  ! 796: SAVE_I	save	%r17, 0x0001, %r31
	.word 0xbfe4e1ff  ! 797: SAVE_I	save	%r19, 0x0001, %r31
hwintr_0_31:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_31), 16, 16)) -> intp(0, 0, 1f)
	.word 0xbf7c6401  ! 803: MOVR_I	movre	%r17, 0x1, %r31
	.word 0xb1e52064  ! 804: SAVE_I	save	%r20, 0x0001, %r24
	.word 0xb5e5e09e  ! 805: SAVE_I	save	%r23, 0x0001, %r26
	.word 0xb9e4204c  ! 806: SAVE_I	save	%r16, 0x0001, %r28
hwintr_0_32:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_32), 16, 16)) -> intp(0, 0, 30)
	.word 0xb3e460ce  ! 811: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xb5e421e1  ! 812: SAVE_I	save	%r16, 0x0001, %r26
	.word 0xbd3da001  ! 816: SRA_I	sra 	%r22, 0x0001, %r30
hwintr_0_33:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_33), 16, 16)) -> intp(0, 0, 33)
	.word 0xb5508000  ! 833: RDPR_TSTATE	<illegal instruction>
	.word 0xb9e421e5  ! 839: SAVE_I	save	%r16, 0x0001, %r28
	mov	2, %r12
	.word 0xa1930000  ! 845: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xbde5e097  ! 850: SAVE_I	save	%r23, 0x0001, %r30
	.word 0xb3e4e19d  ! 853: SAVE_I	save	%r19, 0x0001, %r25
	.word 0x9195a14d  ! 856: WRPR_PIL_I	wrpr	%r22, 0x014d, %pil
	.word 0xb1e5e0f8  ! 857: SAVE_I	save	%r23, 0x0001, %r24
	mov	2, %r12
	.word 0xa1930000  ! 860: WRPR_GL_R	wrpr	%r12, %r0, %-
hwintr_0_34:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_34), 16, 16)) -> intp(0, 0, 3e)
	.word 0xb20c4000  ! 868: AND_R	and 	%r17, %r0, %r25
	.word 0xbd520000  ! 869: RDPR_PIL	<illegal instruction>
	.word 0xbbe5e154  ! 872: SAVE_I	save	%r23, 0x0001, %r29
	.word 0xbde4a1f6  ! 873: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xb1e521f8  ! 875: SAVE_I	save	%r20, 0x0001, %r24
	.word 0x8d9521f3  ! 878: WRPR_PSTATE_I	wrpr	%r20, 0x01f3, %pstate
	.word 0xb3e4a1e8  ! 879: SAVE_I	save	%r18, 0x0001, %r25
	.word 0xbde4e0f0  ! 881: SAVE_I	save	%r19, 0x0001, %r30
	.word 0x9194a16c  ! 884: WRPR_PIL_I	wrpr	%r18, 0x016c, %pil
	.word 0xb5e52153  ! 886: SAVE_I	save	%r20, 0x0001, %r26
	.word 0xbde5e0d1  ! 887: SAVE_I	save	%r23, 0x0001, %r30
hwintr_0_35:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_35), 16, 16)) -> intp(0, 0, 18)
	.word 0xbde4e00a  ! 894: SAVE_I	save	%r19, 0x0001, %r30
	.word 0xb9e520c0  ! 895: SAVE_I	save	%r20, 0x0001, %r28
	.word 0xb1e5a1b7  ! 897: SAVE_I	save	%r22, 0x0001, %r24
	.word 0xb5e4a08a  ! 898: SAVE_I	save	%r18, 0x0001, %r26
	.word 0xb1e5a062  ! 901: SAVE_I	save	%r22, 0x0001, %r24
	.word 0xbde4216f  ! 903: SAVE_I	save	%r16, 0x0001, %r30
hwintr_0_36:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_36), 16, 16)) -> intp(0, 0, 13)
	.word 0xbbe4a11a  ! 908: SAVE_I	save	%r18, 0x0001, %r29
	.word 0x9194211a  ! 909: WRPR_PIL_I	wrpr	%r16, 0x011a, %pil
	.word 0xb6358000  ! 911: ORN_R	orn 	%r22, %r0, %r27
	.word 0xbbe4a112  ! 915: SAVE_I	save	%r18, 0x0001, %r29
	.word 0xbde5e095  ! 918: SAVE_I	save	%r23, 0x0001, %r30
	.word 0xb53ce001  ! 919: SRA_I	sra 	%r19, 0x0001, %r26
	.word 0xb3356001  ! 921: SRL_I	srl 	%r21, 0x0001, %r25
	.word 0xb5518000  ! 923: RDPR_PSTATE	<illegal instruction>
hwintr_0_37:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_37), 16, 16)) -> intp(0, 0, 18)
	.word 0xbbe5206f  ! 931: SAVE_I	save	%r20, 0x0001, %r29
	.word 0xbfe5a08c  ! 934: SAVE_I	save	%r22, 0x0001, %r31
	.word 0xbd2ca001  ! 936: SLL_I	sll 	%r18, 0x0001, %r30
	.word 0xb77c6401  ! 938: MOVR_I	movre	%r17, 0x1, %r27
	.word 0xbfe52125  ! 943: SAVE_I	save	%r20, 0x0001, %r31
	.word 0x8594a182  ! 946: WRPR_TSTATE_I	wrpr	%r18, 0x0182, %tstate
	.word 0xbb510000  ! 947: RDPR_TICK	<illegal instruction>
hwintr_0_38:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_38), 16, 16)) -> intp(0, 0, 1a)
	.word 0xb1e461ed  ! 953: SAVE_I	save	%r17, 0x0001, %r24
	setx	data_start_6, %g1, %r16
	.word 0xb5e561b8  ! 958: SAVE_I	save	%r21, 0x0001, %r26
	.word 0x8994602d  ! 959: WRPR_TICK_I	wrpr	%r17, 0x002d, %tick
	.word 0xb3e5a088  ! 963: SAVE_I	save	%r22, 0x0001, %r25
	.word 0xbde4a0c9  ! 967: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xb5508000  ! 968: RDPR_TSTATE	<illegal instruction>
	setx	data_start_7, %g1, %r18
	.word 0xb9510000  ! 971: RDPR_TICK	<illegal instruction>
hwintr_0_39:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_39), 16, 16)) -> intp(0, 0, c)
hwintr_0_40:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_40), 16, 16)) -> intp(0, 0, 1a)
hwintr_0_41:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_41), 16, 16)) -> intp(0, 0, 2c)
	.word 0xbfe5e1e4  ! 979: SAVE_I	save	%r23, 0x0001, %r31
	.word 0xb09d0000  ! 980: XORcc_R	xorcc 	%r20, %r0, %r24
	.word 0xbde4a08f  ! 982: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xb7e5e188  ! 983: SAVE_I	save	%r23, 0x0001, %r27
	.word 0xbf540000  ! 988: RDPR_GL	<illegal instruction>
	.word 0xb5e56067  ! 989: SAVE_I	save	%r21, 0x0001, %r26
	.word 0xb1e5a0dd  ! 994: SAVE_I	save	%r22, 0x0001, %r24
	.word 0xb5e5e175  ! 995: SAVE_I	save	%r23, 0x0001, %r26
	.word 0xb1508000  ! 996: RDPR_TSTATE	<illegal instruction>
	.word 0xbde5a10b  ! 998: SAVE_I	save	%r22, 0x0001, %r30
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
	.word 0xf6752192  ! 1: STX_I	stx	%r27, [%r20 + 0x0192]
	.word 0xf0244000  ! 3: STW_R	stw	%r24, [%r17 + %r0]
	setx	0xe4e6f0e900009c9f, %g1, %r10
	.word 0x819a8000  ! 10: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0x919521ac  ! 20: WRPR_PIL_I	wrpr	%r20, 0x01ac, %pil
	.word 0xf234a00d  ! 21: STH_I	sth	%r25, [%r18 + 0x000d]
	.word 0xfe244000  ! 22: STW_R	stw	%r31, [%r17 + %r0]
	.word 0xfe2cc000  ! 29: STB_R	stb	%r31, [%r19 + %r0]
	.word 0x8395e01a  ! 30: WRPR_TNPC_I	wrpr	%r23, 0x001a, %tnpc
	.word 0xbb508000  ! 35: RDPR_TSTATE	rdpr	%tstate, %r29
	.word 0xf6752028  ! 36: STX_I	stx	%r27, [%r20 + 0x0028]
	.word 0xfe2c20bd  ! 37: STB_I	stb	%r31, [%r16 + 0x00bd]
	.word 0xfe2d2174  ! 38: STB_I	stb	%r31, [%r20 + 0x0174]
	.word 0xfe240000  ! 48: STW_R	stw	%r31, [%r16 + %r0]
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xf02ce01d  ! 50: STB_I	stb	%r24, [%r19 + 0x001d]
hwintr_3_0:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_0), 16, 16)) -> intp(3, 0, 37)
	.word 0x83946107  ! 55: WRPR_TNPC_I	wrpr	%r17, 0x0107, %tnpc
	.word 0xb0bde058  ! 56: XNORcc_I	xnorcc 	%r23, 0x0058, %r24
hwintr_3_1:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_1), 16, 16)) -> intp(3, 0, 30)
	.word 0xfa3c8000  ! 58: STD_R	std	%r29, [%r18 + %r0]
	.word 0xf424a099  ! 59: STW_I	stw	%r26, [%r18 + 0x0099]
	.word 0xb92cd000  ! 61: SLLX_R	sllx	%r19, %r0, %r28
hwintr_3_2:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_2), 16, 16)) -> intp(3, 0, 22)
	setx	0x41846eeb0000d95e, %g1, %r10
	.word 0x839a8000  ! 65: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	setx	0xa5793c8200008f9b, %g1, %r10
	.word 0x839a8000  ! 67: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0x81946160  ! 71: WRPR_TPC_I	wrpr	%r17, 0x0160, %tpc
	.word 0xb0c4c000  ! 73: ADDCcc_R	addccc 	%r19, %r0, %r24
hwintr_3_3:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_3), 16, 16)) -> intp(3, 0, 23)
	.word 0xb4444000  ! 75: ADDC_R	addc 	%r17, %r0, %r26
	.word 0xfc340000  ! 76: STH_R	sth	%r30, [%r16 + %r0]
	.word 0xf475207a  ! 80: STX_I	stx	%r26, [%r20 + 0x007a]
	.word 0xf03d616f  ! 81: STD_I	std	%r24, [%r21 + 0x016f]
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf13de1d1  ! 86: STDF_I	std	%f24, [0x01d1, %r23]
hwintr_3_4:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_4), 16, 16)) -> intp(3, 0, 28)
	.word 0xf034a023  ! 89: STH_I	sth	%r24, [%r18 + 0x0023]
	.word 0xb3518000  ! 90: RDPR_PSTATE	rdpr	%pstate, %r25
	mov	2, %r12
	.word 0xa1930000  ! 93: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xf825e144  ! 102: STW_I	stw	%r28, [%r23 + 0x0144]
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb3504000  ! 108: RDPR_TNPC	rdpr	%tnpc, %r25
	.word 0xb8b54000  ! 109: ORNcc_R	orncc 	%r21, %r0, %r28
	.word 0x8595a03d  ! 111: WRPR_TSTATE_I	wrpr	%r22, 0x003d, %tstate
	.word 0xfa754000  ! 114: STX_R	stx	%r29, [%r21 + %r0]
	.word 0xfa3c4000  ! 121: STD_R	std	%r29, [%r17 + %r0]
	.word 0x8595216d  ! 127: WRPR_TSTATE_I	wrpr	%r20, 0x016d, %tstate
	.word 0xf2254000  ! 128: STW_R	stw	%r25, [%r21 + %r0]
	.word 0xf73d4000  ! 129: STDF_R	std	%f27, [%r0, %r21]
	.word 0xb3510000  ! 131: RDPR_TICK	rdpr	%tick, %r25
	.word 0xbcc5a0b3  ! 132: ADDCcc_I	addccc 	%r22, 0x00b3, %r30
	setx	0xe22f147f0000fe45, %g1, %r10
	.word 0x839a8000  ! 134: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xbb540000  ! 138: RDPR_GL	rdpr	%-, %r29
	.word 0xfe2d4000  ! 140: STB_R	stb	%r31, [%r21 + %r0]
	.word 0xfc25c000  ! 148: STW_R	stw	%r30, [%r23 + %r0]
hwintr_3_5:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_5), 16, 16)) -> intp(3, 0, 26)
	.word 0xfc35e05e  ! 156: STH_I	sth	%r30, [%r23 + 0x005e]
	.word 0xf6256081  ! 160: STW_I	stw	%r27, [%r21 + 0x0081]
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf82da0ca  ! 162: STB_I	stb	%r28, [%r22 + 0x00ca]
	.word 0xfe254000  ! 163: STW_R	stw	%r31, [%r21 + %r0]
	.word 0xf93cc000  ! 167: STDF_R	std	%f28, [%r0, %r19]
	.word 0xf4754000  ! 168: STX_R	stx	%r26, [%r21 + %r0]
hwintr_3_6:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_6), 16, 16)) -> intp(3, 0, 15)
	.word 0xb751c000  ! 177: RDPR_TL	<illegal instruction>
	.word 0xf42cc000  ! 180: STB_R	stb	%r26, [%r19 + %r0]
	setx	data_start_2, %g1, %r22
	.word 0xb3480000  ! 184: RDHPR_HPSTATE	rdhpr	%hpstate, %r25
	.word 0xb3518000  ! 185: RDPR_PSTATE	<illegal instruction>
hwintr_3_7:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_7), 16, 16)) -> intp(3, 0, 18)
	.word 0xf274e074  ! 190: STX_I	stx	%r25, [%r19 + 0x0074]
	setx	data_start_0, %g1, %r22
hwintr_3_8:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_8), 16, 16)) -> intp(3, 0, 1b)
	.word 0x8195e0bf  ! 207: WRPR_TPC_I	wrpr	%r23, 0x00bf, %tpc
	.word 0xf0256048  ! 209: STW_I	stw	%r24, [%r21 + 0x0048]
	.word 0xf42c4000  ! 210: STB_R	stb	%r26, [%r17 + %r0]
hwintr_3_9:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_9), 16, 16)) -> intp(3, 0, 2c)
	.word 0xfa25e173  ! 212: STW_I	stw	%r29, [%r23 + 0x0173]
	.word 0xf8348000  ! 213: STH_R	sth	%r28, [%r18 + %r0]
	setx	0xd4c841700004f12, %g1, %r10
	.word 0x819a8000  ! 215: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xf43c4000  ! 217: STD_R	std	%r26, [%r17 + %r0]
	.word 0xf33d60ba  ! 219: STDF_I	std	%f25, [0x00ba, %r21]
	.word 0xfe246036  ! 224: STW_I	stw	%r31, [%r17 + 0x0036]
	.word 0xf224c000  ! 227: STW_R	stw	%r25, [%r19 + %r0]
	.word 0xf23da1aa  ! 231: STD_I	std	%r25, [%r22 + 0x01aa]
	setx	0x8cd57cab00006f0d, %g1, %r10
	.word 0x819a8000  ! 236: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xb834a137  ! 237: ORN_I	orn 	%r18, 0x0137, %r28
	.word 0xb3508000  ! 240: RDPR_TSTATE	rdpr	%tstate, %r25
hwintr_3_10:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_10), 16, 16)) -> intp(3, 0, 5)
	.word 0xbcb4615c  ! 245: SUBCcc_I	orncc 	%r17, 0x015c, %r30
	.word 0xbb51c000  ! 246: RDPR_TL	<illegal instruction>
	.word 0xf83da117  ! 254: STD_I	std	%r28, [%r22 + 0x0117]
	.word 0xb151c000  ! 255: RDPR_TL	<illegal instruction>
	.word 0xf03c6111  ! 258: STD_I	std	%r24, [%r17 + 0x0111]
	.word 0xfe3c4000  ! 260: STD_R	std	%r31, [%r17 + %r0]
	.word 0xbec40000  ! 262: ADDCcc_R	addccc 	%r16, %r0, %r31
hwintr_3_11:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_11), 16, 16)) -> intp(3, 0, 15)
	.word 0xb01d4000  ! 266: XOR_R	xor 	%r21, %r0, %r24
	.word 0xbe1d4000  ! 267: XOR_R	xor 	%r21, %r0, %r31
	.word 0xb5641800  ! 268: MOVcc_R	<illegal instruction>
	.word 0x8594216b  ! 269: WRPR_TSTATE_I	wrpr	%r16, 0x016b, %tstate
	.word 0x8395e09d  ! 270: WRPR_TNPC_I	wrpr	%r23, 0x009d, %tnpc
	.word 0xf82c0000  ! 272: STB_R	stb	%r28, [%r16 + %r0]
hwintr_3_12:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_12), 16, 16)) -> intp(3, 0, 23)
hwintr_3_13:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_13), 16, 16)) -> intp(3, 0, 1d)
	.word 0xf53c60eb  ! 282: STDF_I	std	%f26, [0x00eb, %r17]
	.word 0x839461a8  ! 283: WRPR_TNPC_I	wrpr	%r17, 0x01a8, %tnpc
	.word 0xf02c2044  ! 284: STB_I	stb	%r24, [%r16 + 0x0044]
	setx	0xdc4b964000004e4d, %g1, %r10
	.word 0x819a8000  ! 285: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xb43c8000  ! 289: XNOR_R	xnor 	%r18, %r0, %r26
	.word 0xf33c2180  ! 291: STDF_I	std	%f25, [0x0180, %r16]
	.word 0xf4744000  ! 294: STX_R	stx	%r26, [%r17 + %r0]
	.word 0xb5540000  ! 296: RDPR_GL	rdpr	%-, %r26
	.word 0xfe740000  ! 297: STX_R	stx	%r31, [%r16 + %r0]
	.word 0xbb540000  ! 302: RDPR_GL	<illegal instruction>
	.word 0xfa74e12e  ! 305: STX_I	stx	%r29, [%r19 + 0x012e]
	.word 0xfe3c4000  ! 307: STD_R	std	%r31, [%r17 + %r0]
	.word 0xb89c4000  ! 312: XORcc_R	xorcc 	%r17, %r0, %r28
	.word 0xb0b44000  ! 315: SUBCcc_R	orncc 	%r17, %r0, %r24
	.word 0xbf540000  ! 319: RDPR_GL	<illegal instruction>
	.word 0xb8b42161  ! 325: ORNcc_I	orncc 	%r16, 0x0161, %r28
	.word 0xf2746125  ! 327: STX_I	stx	%r25, [%r17 + 0x0125]
	.word 0x83946038  ! 328: WRPR_TNPC_I	wrpr	%r17, 0x0038, %tnpc
	.word 0x8395a031  ! 330: WRPR_TNPC_I	wrpr	%r22, 0x0031, %tnpc
	.word 0xfe24a0d6  ! 335: STW_I	stw	%r31, [%r18 + 0x00d6]
	.word 0xf42d6174  ! 336: STB_I	stb	%r26, [%r21 + 0x0174]
hwintr_3_14:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_14), 16, 16)) -> intp(3, 0, d)
	.word 0x8d95e17a  ! 344: WRPR_PSTATE_I	wrpr	%r23, 0x017a, %pstate
	.word 0xfe24a172  ! 345: STW_I	stw	%r31, [%r18 + 0x0172]
hwintr_3_15:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_15), 16, 16)) -> intp(3, 0, 1c)
hwintr_3_16:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_16), 16, 16)) -> intp(3, 0, 16)
	.word 0xfe3c4000  ! 351: STD_R	std	%r31, [%r17 + %r0]
	.word 0xf025e0eb  ! 352: STW_I	stw	%r24, [%r23 + 0x00eb]
hwintr_3_17:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_17), 16, 16)) -> intp(3, 0, 5)
	.word 0x899521aa  ! 356: WRPR_TICK_I	wrpr	%r20, 0x01aa, %tick
	.word 0xb3480000  ! 358: RDHPR_HPSTATE	rdhpr	%hpstate, %r25
	.word 0xf93c8000  ! 359: STDF_R	std	%f28, [%r0, %r18]
hwintr_3_18:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_18), 16, 16)) -> intp(3, 0, d)
	.word 0xf4248000  ! 364: STW_R	stw	%r26, [%r18 + %r0]
	setx	0xce47d4200005b9b, %g1, %r10
	.word 0x839a8000  ! 367: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	mov	0, %r12
	.word 0x8f930000  ! 368: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0x8194a0e6  ! 372: WRPR_TPC_I	wrpr	%r18, 0x00e6, %tpc
	.word 0xbd34a001  ! 373: SRL_I	srl 	%r18, 0x0001, %r30
	.word 0xf82c4000  ! 374: STB_R	stb	%r28, [%r17 + %r0]
hwintr_3_19:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_19), 16, 16)) -> intp(3, 0, 32)
	.word 0xfc2c4000  ! 384: STB_R	stb	%r30, [%r17 + %r0]
	setx	0x3e5c4b000000a9db, %g1, %r10
	.word 0x819a8000  ! 385: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xfc358000  ! 390: STH_R	sth	%r30, [%r22 + %r0]
hwintr_3_20:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_20), 16, 16)) -> intp(3, 0, 20)
	.word 0xfd3d2018  ! 395: STDF_I	std	%f30, [0x0018, %r20]
	.word 0x8394e0b3  ! 396: WRPR_TNPC_I	wrpr	%r19, 0x00b3, %tnpc
	.word 0x899420c9  ! 398: WRPR_TICK_I	wrpr	%r16, 0x00c9, %tick
	.word 0xbf50c000  ! 399: RDPR_TT	rdpr	%tt, %r31
	.word 0xf4244000  ! 400: STW_R	stw	%r26, [%r17 + %r0]
	.word 0xb8950000  ! 402: ORcc_R	orcc 	%r20, %r0, %r28
	.word 0xf8252005  ! 403: STW_I	stw	%r28, [%r20 + 0x0005]
	.word 0xfa24c000  ! 405: STW_R	stw	%r29, [%r19 + %r0]
	.word 0xfb3d8000  ! 409: STDF_R	std	%f29, [%r0, %r22]
	.word 0xb3643801  ! 410: MOVcc_I	<illegal instruction>
	.word 0x91952042  ! 411: WRPR_PIL_I	wrpr	%r20, 0x0042, %pil
	setx	data_start_1, %g1, %r16
	mov	2, %r12
	.word 0xa1930000  ! 413: WRPR_GL_R	wrpr	%r12, %r0, %-
hwintr_3_21:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_21), 16, 16)) -> intp(3, 0, a)
	.word 0xff3c20bc  ! 419: STDF_I	std	%f31, [0x00bc, %r16]
	.word 0x8d9521fc  ! 422: WRPR_PSTATE_I	wrpr	%r20, 0x01fc, %pstate
	.word 0xf8348000  ! 426: STH_R	sth	%r28, [%r18 + %r0]
	.word 0xf2756190  ! 430: STX_I	stx	%r25, [%r21 + 0x0190]
	.word 0xfc25c000  ! 431: STW_R	stw	%r30, [%r23 + %r0]
	.word 0xfa25a050  ! 434: STW_I	stw	%r29, [%r22 + 0x0050]
	.word 0xfa35a0de  ! 447: STH_I	sth	%r29, [%r22 + 0x00de]
	setx	0x259fac540000ebc3, %g1, %r10
	.word 0x819a8000  ! 449: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xf63c4000  ! 450: STD_R	std	%r27, [%r17 + %r0]
	.word 0xf474c000  ! 451: STX_R	stx	%r26, [%r19 + %r0]
	.word 0xf825602c  ! 454: STW_I	stw	%r28, [%r21 + 0x002c]
	.word 0xf33ca054  ! 456: STDF_I	std	%f25, [0x0054, %r18]
	.word 0xfc3c6196  ! 459: STD_I	std	%r30, [%r17 + 0x0196]
	.word 0xbb341000  ! 460: SRLX_R	srlx	%r16, %r0, %r29
	.word 0x81946079  ! 461: WRPR_TPC_I	wrpr	%r17, 0x0079, %tpc
	.word 0xf63c60b6  ! 462: STD_I	std	%r27, [%r17 + 0x00b6]
hwintr_3_22:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_22), 16, 16)) -> intp(3, 0, e)
	.word 0xf02ce113  ! 477: STB_I	stb	%r24, [%r19 + 0x0113]
	.word 0xf63c4000  ! 479: STD_R	std	%r27, [%r17 + %r0]
	.word 0xba35c000  ! 480: SUBC_R	orn 	%r23, %r0, %r29
	.word 0xbcbd61c3  ! 486: XNORcc_I	xnorcc 	%r21, 0x01c3, %r30
	.word 0x8d94e0f3  ! 494: WRPR_PSTATE_I	wrpr	%r19, 0x00f3, %pstate
	.word 0xfa358000  ! 496: STH_R	sth	%r29, [%r22 + %r0]
	setx	data_start_3, %g1, %r16
	.word 0x8994617f  ! 505: WRPR_TICK_I	wrpr	%r17, 0x017f, %tick
	.word 0xf82de146  ! 507: STB_I	stb	%r28, [%r23 + 0x0146]
	.word 0xb81da0b5  ! 509: XOR_I	xor 	%r22, 0x00b5, %r28
	.word 0xb551c000  ! 515: RDPR_TL	rdpr	%tl, %r26
	.word 0xb33df001  ! 516: SRAX_I	srax	%r23, 0x0001, %r25
	.word 0xfe34a07b  ! 517: STH_I	sth	%r31, [%r18 + 0x007b]
	.word 0xfe25c000  ! 519: STW_R	stw	%r31, [%r23 + %r0]
	.word 0xf33c8000  ! 520: STDF_R	std	%f25, [%r0, %r18]
	.word 0xff3d0000  ! 521: STDF_R	std	%f31, [%r0, %r20]
	.word 0x83952044  ! 523: WRPR_TNPC_I	wrpr	%r20, 0x0044, %tnpc
	.word 0xfc356013  ! 524: STH_I	sth	%r30, [%r21 + 0x0013]
	.word 0xfe340000  ! 528: STH_R	sth	%r31, [%r16 + %r0]
	.word 0xb9500000  ! 531: RDPR_TPC	rdpr	%tpc, %r28
	.word 0x919520db  ! 532: WRPR_PIL_I	wrpr	%r20, 0x00db, %pil
hwintr_3_23:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_23), 16, 16)) -> intp(3, 0, 38)
	setx	data_start_7, %g1, %r23
	.word 0xb5508000  ! 540: RDPR_TSTATE	rdpr	%tstate, %r26
	.word 0xf07520f7  ! 544: STX_I	stx	%r24, [%r20 + 0x00f7]
	.word 0xf22da1ae  ! 546: STB_I	stb	%r25, [%r22 + 0x01ae]
hwintr_3_24:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_24), 16, 16)) -> intp(3, 0, 23)
	.word 0xf0242013  ! 551: STW_I	stw	%r24, [%r16 + 0x0013]
hwintr_3_25:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_25), 16, 16)) -> intp(3, 0, 3e)
hwintr_3_26:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_26), 16, 16)) -> intp(3, 0, 3)
	.word 0xfc2d612a  ! 559: STB_I	stb	%r30, [%r21 + 0x012a]
	.word 0xff3d0000  ! 560: STDF_R	std	%f31, [%r0, %r20]
	.word 0xb1540000  ! 562: RDPR_GL	<illegal instruction>
	.word 0xf675e064  ! 565: STX_I	stx	%r27, [%r23 + 0x0064]
	.word 0xf23cc000  ! 567: STD_R	std	%r25, [%r19 + %r0]
	.word 0xf6756141  ! 568: STX_I	stx	%r27, [%r21 + 0x0141]
	.word 0xf73c604e  ! 569: STDF_I	std	%f27, [0x004e, %r17]
	.word 0xf07521da  ! 572: STX_I	stx	%r24, [%r20 + 0x01da]
	.word 0xb12df001  ! 576: SLLX_I	sllx	%r23, 0x0001, %r24
	.word 0xf73c0000  ! 579: STDF_R	std	%f27, [%r0, %r16]
	.word 0xb37cc400  ! 580: MOVR_R	movre	%r19, %r0, %r25
	.word 0xf835e0bf  ! 581: STH_I	sth	%r28, [%r23 + 0x00bf]
	.word 0x819421b2  ! 582: WRPR_TPC_I	wrpr	%r16, 0x01b2, %tpc
	.word 0xf03dc000  ! 583: STD_R	std	%r24, [%r23 + %r0]
	.word 0xbd540000  ! 584: RDPR_GL	rdpr	%-, %r30
	.word 0xbc0ce166  ! 585: AND_I	and 	%r19, 0x0166, %r30
	.word 0xf225a00c  ! 586: STW_I	stw	%r25, [%r22 + 0x000c]
hwintr_3_27:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_27), 16, 16)) -> intp(3, 0, e)
	.word 0xb7520000  ! 591: RDPR_PIL	<illegal instruction>
	.word 0xbf3c9000  ! 592: SRAX_R	srax	%r18, %r0, %r31
	.word 0xbca5612b  ! 594: SUBcc_I	subcc 	%r21, 0x012b, %r30
	.word 0xfe24a166  ! 598: STW_I	stw	%r31, [%r18 + 0x0166]
	setx	data_start_3, %g1, %r21
	.word 0xb03de0ef  ! 600: XNOR_I	xnor 	%r23, 0x00ef, %r24
	setx	data_start_5, %g1, %r23
	.word 0xf42d0000  ! 608: STB_R	stb	%r26, [%r20 + %r0]
	.word 0xb7504000  ! 609: RDPR_TNPC	<illegal instruction>
	.word 0xf93d0000  ! 611: STDF_R	std	%f28, [%r0, %r20]
	.word 0x8d952142  ! 613: WRPR_PSTATE_I	wrpr	%r20, 0x0142, %pstate
	.word 0xfa2da0ce  ! 615: STB_I	stb	%r29, [%r22 + 0x00ce]
	.word 0xf53ce1d7  ! 618: STDF_I	std	%f26, [0x01d7, %r19]
	.word 0x83956156  ! 621: WRPR_TNPC_I	wrpr	%r21, 0x0156, %tnpc
	.word 0xf2346072  ! 625: STH_I	sth	%r25, [%r17 + 0x0072]
	.word 0x8794e1c3  ! 628: WRPR_TT_I	wrpr	%r19, 0x01c3, %tt
	.word 0xf825a120  ! 629: STW_I	stw	%r28, [%r22 + 0x0120]
	.word 0xf4254000  ! 631: STW_R	stw	%r26, [%r21 + %r0]
	.word 0xf4258000  ! 634: STW_R	stw	%r26, [%r22 + %r0]
	.word 0x81956038  ! 639: WRPR_TPC_I	wrpr	%r21, 0x0038, %tpc
	.word 0xf13c61fa  ! 640: STDF_I	std	%f24, [0x01fa, %r17]
	setx	data_start_5, %g1, %r18
	.word 0xf034a1ed  ! 645: STH_I	sth	%r24, [%r18 + 0x01ed]
	.word 0xf63c219f  ! 647: STD_I	std	%r27, [%r16 + 0x019f]
	.word 0xf43de0c5  ! 651: STD_I	std	%r26, [%r23 + 0x00c5]
	.word 0xf13c4000  ! 653: STDF_R	std	%f24, [%r0, %r17]
	.word 0xb5504000  ! 654: RDPR_TNPC	rdpr	%tnpc, %r26
	.word 0xf2350000  ! 655: STH_R	sth	%r25, [%r20 + %r0]
	.word 0xf035a091  ! 656: STH_I	sth	%r24, [%r22 + 0x0091]
	setx	0x8dcfb4730000c919, %g1, %r10
	.word 0x819a8000  ! 660: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xf22dc000  ! 662: STB_R	stb	%r25, [%r23 + %r0]
	.word 0xfe25a143  ! 667: STW_I	stw	%r31, [%r22 + 0x0143]
	.word 0xfa2c4000  ! 671: STB_R	stb	%r29, [%r17 + %r0]
	.word 0xbf540000  ! 672: RDPR_GL	rdpr	%-, %r31
	.word 0xb33cd000  ! 674: SRAX_R	srax	%r19, %r0, %r25
	.word 0x8d952192  ! 676: WRPR_PSTATE_I	wrpr	%r20, 0x0192, %pstate
	.word 0xb6240000  ! 678: SUB_R	sub 	%r16, %r0, %r27
hwintr_3_28:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_28), 16, 16)) -> intp(3, 0, 1e)
	.word 0xbb504000  ! 681: RDPR_TNPC	rdpr	%tnpc, %r29
	.word 0xb550c000  ! 683: RDPR_TT	<illegal instruction>
	.word 0xf624c000  ! 684: STW_R	stw	%r27, [%r19 + %r0]
	.word 0xf4258000  ! 686: STW_R	stw	%r26, [%r22 + %r0]
	.word 0xb7520000  ! 687: RDPR_PIL	<illegal instruction>
	.word 0x8994a108  ! 691: WRPR_TICK_I	wrpr	%r18, 0x0108, %tick
	.word 0xf22c60cd  ! 692: STB_I	stb	%r25, [%r17 + 0x00cd]
	.word 0x839461a2  ! 696: WRPR_TNPC_I	wrpr	%r17, 0x01a2, %tnpc
	.word 0xfc740000  ! 697: STX_R	stx	%r30, [%r16 + %r0]
	.word 0xf8250000  ! 699: STW_R	stw	%r28, [%r20 + %r0]
	setx	data_start_3, %g1, %r17
	.word 0xf225a06b  ! 705: STW_I	stw	%r25, [%r22 + 0x006b]
	.word 0xb135c000  ! 706: SRL_R	srl 	%r23, %r0, %r24
	.word 0xfe75a0f1  ! 707: STX_I	stx	%r31, [%r22 + 0x00f1]
	mov	0, %r12
	.word 0xa1930000  ! 708: WRPR_GL_R	wrpr	%r12, %r0, %-
	setx	data_start_0, %g1, %r23
	.word 0xf62d6086  ! 712: STB_I	stb	%r27, [%r21 + 0x0086]
	.word 0xfa2421ff  ! 713: STW_I	stw	%r29, [%r16 + 0x01ff]
	.word 0xf23c6147  ! 721: STD_I	std	%r25, [%r17 + 0x0147]
	.word 0xfc3d4000  ! 726: STD_R	std	%r30, [%r21 + %r0]
	.word 0xf43cc000  ! 727: STD_R	std	%r26, [%r19 + %r0]
	.word 0xf4740000  ! 730: STX_R	stx	%r26, [%r16 + %r0]
	setx	data_start_7, %g1, %r19
	setx	0xc275ab7b0000bb1e, %g1, %r10
	.word 0x819a8000  ! 741: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xf224a12e  ! 744: STW_I	stw	%r25, [%r18 + 0x012e]
hwintr_3_29:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_29), 16, 16)) -> intp(3, 0, 2e)
	.word 0xf6258000  ! 750: STW_R	stw	%r27, [%r22 + %r0]
	setx	0xc29701fe0000ddcc, %g1, %r10
	.word 0x819a8000  ! 751: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xf83da0b3  ! 752: STD_I	std	%r28, [%r22 + 0x00b3]
	.word 0xfe3d8000  ! 754: STD_R	std	%r31, [%r22 + %r0]
	.word 0x87952104  ! 760: WRPR_TT_I	wrpr	%r20, 0x0104, %tt
	.word 0xb150c000  ! 762: RDPR_TT	rdpr	%tt, %r24
	.word 0xfc348000  ! 767: STH_R	sth	%r30, [%r18 + %r0]
	.word 0xfa750000  ! 769: STX_R	stx	%r29, [%r20 + %r0]
hwintr_3_30:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_30), 16, 16)) -> intp(3, 0, 3b)
	.word 0xfc740000  ! 771: STX_R	stx	%r30, [%r16 + %r0]
	.word 0xf23de146  ! 773: STD_I	std	%r25, [%r23 + 0x0146]
	setx	data_start_4, %g1, %r18
	.word 0x8594215d  ! 777: WRPR_TSTATE_I	wrpr	%r16, 0x015d, %tstate
	.word 0xf824e050  ! 778: STW_I	stw	%r28, [%r19 + 0x0050]
	.word 0xb5520000  ! 784: RDPR_PIL	rdpr	%pil, %r26
	.word 0xbe3c20a6  ! 786: XNOR_I	xnor 	%r16, 0x00a6, %r31
	.word 0xfd3d603c  ! 787: STDF_I	std	%f30, [0x003c, %r21]
	setx	data_start_2, %g1, %r16
	.word 0xf22d4000  ! 789: STB_R	stb	%r25, [%r21 + %r0]
	setx	data_start_5, %g1, %r18
	.word 0x899460f3  ! 795: WRPR_TICK_I	wrpr	%r17, 0x00f3, %tick
	.word 0xfc240000  ! 798: STW_R	stw	%r30, [%r16 + %r0]
hwintr_3_31:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_31), 16, 16)) -> intp(3, 0, 29)
	.word 0xbf7da401  ! 803: MOVR_I	movre	%r22, 0x1, %r31
hwintr_3_32:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_32), 16, 16)) -> intp(3, 0, 1e)
	.word 0xf42c218f  ! 809: STB_I	stb	%r26, [%r16 + 0x018f]
	.word 0xfe74c000  ! 814: STX_R	stx	%r31, [%r19 + %r0]
	.word 0xb73d2001  ! 816: SRA_I	sra 	%r20, 0x0001, %r27
	.word 0xf674e1c6  ! 820: STX_I	stx	%r27, [%r19 + 0x01c6]
	.word 0xf825c000  ! 822: STW_R	stw	%r28, [%r23 + %r0]
	.word 0xfa75e112  ! 824: STX_I	stx	%r29, [%r23 + 0x0112]
	.word 0xf0340000  ! 829: STH_R	sth	%r24, [%r16 + %r0]
hwintr_3_33:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_33), 16, 16)) -> intp(3, 0, 8)
	.word 0xfa75e05c  ! 832: STX_I	stx	%r29, [%r23 + 0x005c]
	.word 0xb7508000  ! 833: RDPR_TSTATE	rdpr	%tstate, %r27
	.word 0xf02ca1b0  ! 834: STB_I	stb	%r24, [%r18 + 0x01b0]
	.word 0xf62c0000  ! 843: STB_R	stb	%r27, [%r16 + %r0]
	mov	0, %r12
	.word 0xa1930000  ! 845: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xfb3de1d7  ! 847: STDF_I	std	%f29, [0x01d7, %r23]
	.word 0xf83c8000  ! 852: STD_R	std	%r28, [%r18 + %r0]
	.word 0x91946185  ! 856: WRPR_PIL_I	wrpr	%r17, 0x0185, %pil
	.word 0xf62ca1d3  ! 859: STB_I	stb	%r27, [%r18 + 0x01d3]
	mov	1, %r12
	.word 0xa1930000  ! 860: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xf834e1ed  ! 862: STH_I	sth	%r28, [%r19 + 0x01ed]
	.word 0xfe348000  ! 863: STH_R	sth	%r31, [%r18 + %r0]
	.word 0xf22ce0f4  ! 864: STB_I	stb	%r25, [%r19 + 0x00f4]
	.word 0xf6250000  ! 866: STW_R	stw	%r27, [%r20 + %r0]
hwintr_3_34:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_34), 16, 16)) -> intp(3, 0, 29)
	.word 0xb40dc000  ! 868: AND_R	and 	%r23, %r0, %r26
	.word 0xb9520000  ! 869: RDPR_PIL	rdpr	%pil, %r28
	.word 0xf674e1d4  ! 871: STX_I	stx	%r27, [%r19 + 0x01d4]
	.word 0xfe2d21df  ! 876: STB_I	stb	%r31, [%r20 + 0x01df]
	.word 0xf2240000  ! 877: STW_R	stw	%r25, [%r16 + %r0]
	.word 0x8d946172  ! 878: WRPR_PSTATE_I	wrpr	%r17, 0x0172, %pstate
	.word 0xf43c4000  ! 880: STD_R	std	%r26, [%r17 + %r0]
	.word 0x91952193  ! 884: WRPR_PIL_I	wrpr	%r20, 0x0193, %pil
hwintr_3_35:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_35), 16, 16)) -> intp(3, 0, 28)
	.word 0xff3d2095  ! 891: STDF_I	std	%f31, [0x0095, %r20]
hwintr_3_36:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_36), 16, 16)) -> intp(3, 0, 28)
	.word 0x9194204c  ! 909: WRPR_PIL_I	wrpr	%r16, 0x004c, %pil
	.word 0xb6350000  ! 911: ORN_R	orn 	%r20, %r0, %r27
	.word 0xfa352160  ! 912: STH_I	sth	%r29, [%r20 + 0x0160]
	.word 0xb33c2001  ! 919: SRA_I	sra 	%r16, 0x0001, %r25
	.word 0xb3342001  ! 921: SRL_I	srl 	%r16, 0x0001, %r25
	.word 0xb1518000  ! 923: RDPR_PSTATE	rdpr	%pstate, %r24
	.word 0xf034e181  ! 925: STH_I	sth	%r24, [%r19 + 0x0181]
hwintr_3_37:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_37), 16, 16)) -> intp(3, 0, 9)
	.word 0xfa3c219f  ! 928: STD_I	std	%r29, [%r16 + 0x019f]
	.word 0xf2244000  ! 933: STW_R	stw	%r25, [%r17 + %r0]
	.word 0xf634c000  ! 935: STH_R	sth	%r27, [%r19 + %r0]
	.word 0xb72ce001  ! 936: SLL_I	sll 	%r19, 0x0001, %r27
	.word 0xb97d6401  ! 938: MOVR_I	movre	%r21, 0x1, %r28
	.word 0xf02c6071  ! 939: STB_I	stb	%r24, [%r17 + 0x0071]
	.word 0xfa240000  ! 941: STW_R	stw	%r29, [%r16 + %r0]
	.word 0xf53c4000  ! 942: STDF_R	std	%f26, [%r0, %r17]
	.word 0xf82da1da  ! 944: STB_I	stb	%r28, [%r22 + 0x01da]
	.word 0xf23cc000  ! 945: STD_R	std	%r25, [%r19 + %r0]
	.word 0x8594e1a5  ! 946: WRPR_TSTATE_I	wrpr	%r19, 0x01a5, %tstate
	.word 0xbf510000  ! 947: RDPR_TICK	rdpr	%tick, %r31
	.word 0xfa2d8000  ! 948: STB_R	stb	%r29, [%r22 + %r0]
hwintr_3_38:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_38), 16, 16)) -> intp(3, 0, 0)
	setx	data_start_7, %g1, %r19
	.word 0x8994e11f  ! 959: WRPR_TICK_I	wrpr	%r19, 0x011f, %tick
	.word 0xfc2d2186  ! 965: STB_I	stb	%r30, [%r20 + 0x0186]
	.word 0xf074e112  ! 966: STX_I	stx	%r24, [%r19 + 0x0112]
	.word 0xbd508000  ! 968: RDPR_TSTATE	rdpr	%tstate, %r30
	setx	data_start_1, %g1, %r16
	.word 0xb5510000  ! 971: RDPR_TICK	<illegal instruction>
hwintr_3_39:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_39), 16, 16)) -> intp(3, 0, 26)
hwintr_3_40:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_40), 16, 16)) -> intp(3, 0, 27)
hwintr_3_41:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_41), 16, 16)) -> intp(3, 0, 16)
	.word 0xb09d8000  ! 980: XORcc_R	xorcc 	%r22, %r0, %r24
	.word 0xbd540000  ! 988: RDPR_GL	<illegal instruction>
	.word 0xbb508000  ! 996: RDPR_TSTATE	<illegal instruction>
	.word 0xfe2d8000  ! 997: STB_R	stb	%r31, [%r22 + %r0]
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
	.word 0xf41da199  ! 2: LDD_I	ldd	[%r22 + 0x0199], %r26
	.word 0xf6158000  ! 5: LDUH_R	lduh	[%r22 + %r0], %r27
	.word 0xf31da0d8  ! 6: LDDF_I	ldd	[%r22, 0x00d8], %f25
	.word 0xfe042095  ! 7: LDUW_I	lduw	[%r16 + 0x0095], %r31
	setx	0x3845fe8d00003a87, %g1, %r10
	.word 0x819a8000  ! 10: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xf4454000  ! 15: LDSW_R	ldsw	[%r21 + %r0], %r26
	.word 0xf71d8000  ! 17: LDDF_R	ldd	[%r22, %r0], %f27
	.word 0xfa5d2050  ! 19: LDX_I	ldx	[%r20 + 0x0050], %r29
	.word 0x91956036  ! 20: WRPR_PIL_I	wrpr	%r21, 0x0036, %pil
	.word 0xf84ca0d0  ! 23: LDSB_I	ldsb	[%r18 + 0x00d0], %r28
	.word 0xf445a1ac  ! 25: LDSW_I	ldsw	[%r22 + 0x01ac], %r26
	.word 0xf51de03c  ! 28: LDDF_I	ldd	[%r23, 0x003c], %f26
	.word 0x83942159  ! 30: WRPR_TNPC_I	wrpr	%r16, 0x0159, %tnpc
	.word 0xf045c000  ! 31: LDSW_R	ldsw	[%r23 + %r0], %r24
	.word 0xf31c4000  ! 33: LDDF_R	ldd	[%r17, %r0], %f25
	.word 0xf05460f5  ! 34: LDSH_I	ldsh	[%r17 + 0x00f5], %r24
	.word 0xbd508000  ! 35: RDPR_TSTATE	<illegal instruction>
	.word 0xfe45e1f3  ! 39: LDSW_I	ldsw	[%r23 + 0x01f3], %r31
	.word 0xf24ce19a  ! 42: LDSB_I	ldsb	[%r19 + 0x019a], %r25
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
hwintr_2_0:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_0), 16, 16)) -> intp(2, 0, 22)
	.word 0x839420f7  ! 55: WRPR_TNPC_I	wrpr	%r16, 0x00f7, %tnpc
	.word 0xb0bc20d7  ! 56: XNORcc_I	xnorcc 	%r16, 0x00d7, %r24
hwintr_2_1:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_1), 16, 16)) -> intp(2, 0, 31)
	.word 0xf8142105  ! 60: LDUH_I	lduh	[%r16 + 0x0105], %r28
	.word 0xb32d9000  ! 61: SLLX_R	sllx	%r22, %r0, %r25
	.word 0xf044c000  ! 62: LDSW_R	ldsw	[%r19 + %r0], %r24
hwintr_2_2:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_2), 16, 16)) -> intp(2, 0, d)
	.word 0xf0558000  ! 64: LDSH_R	ldsh	[%r22 + %r0], %r24
	setx	0x7f5f6bd40000bfda, %g1, %r10
	.word 0x839a8000  ! 65: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	setx	0x202e27100008f8b, %g1, %r10
	.word 0x839a8000  ! 67: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xfe54c000  ! 68: LDSH_R	ldsh	[%r19 + %r0], %r31
	.word 0xfc15c000  ! 70: LDUH_R	lduh	[%r23 + %r0], %r30
	.word 0x8195a17c  ! 71: WRPR_TPC_I	wrpr	%r22, 0x017c, %tpc
	.word 0xbac40000  ! 73: ADDCcc_R	addccc 	%r16, %r0, %r29
hwintr_2_3:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_3), 16, 16)) -> intp(2, 0, 31)
	.word 0xb244c000  ! 75: ADDC_R	addc 	%r19, %r0, %r25
	.word 0xf014c000  ! 79: LDUH_R	lduh	[%r19 + %r0], %r24
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xfa1ca1e4  ! 84: LDD_I	ldd	[%r18 + 0x01e4], %r29
	.word 0xff1c8000  ! 87: LDDF_R	ldd	[%r18, %r0], %f31
hwintr_2_4:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_4), 16, 16)) -> intp(2, 0, 35)
	.word 0xb5518000  ! 90: RDPR_PSTATE	<illegal instruction>
	.word 0xf64c8000  ! 92: LDSB_R	ldsb	[%r18 + %r0], %r27
	mov	2, %r12
	.word 0xa1930000  ! 93: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xf0156093  ! 94: LDUH_I	lduh	[%r21 + 0x0093], %r24
	.word 0xf21dc000  ! 98: LDD_R	ldd	[%r23 + %r0], %r25
	.word 0xf51ca1a9  ! 99: LDDF_I	ldd	[%r18, 0x01a9], %f26
	.word 0xff1cc000  ! 100: LDDF_R	ldd	[%r19, %r0], %f31
	.word 0xfa05a179  ! 101: LDUW_I	lduw	[%r22 + 0x0179], %r29
	.word 0xfa5ca155  ! 103: LDX_I	ldx	[%r18 + 0x0155], %r29
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xfe0dc000  ! 107: LDUB_R	ldub	[%r23 + %r0], %r31
	.word 0xb3504000  ! 108: RDPR_TNPC	<illegal instruction>
	.word 0xb6b48000  ! 109: ORNcc_R	orncc 	%r18, %r0, %r27
	.word 0x859461d9  ! 111: WRPR_TSTATE_I	wrpr	%r17, 0x01d9, %tstate
	.word 0xf51c4000  ! 113: LDDF_R	ldd	[%r17, %r0], %f26
	.word 0xfc150000  ! 116: LDUH_R	lduh	[%r20 + %r0], %r30
	.word 0xf00520dd  ! 117: LDUW_I	lduw	[%r20 + 0x00dd], %r24
	.word 0xf25d8000  ! 119: LDX_R	ldx	[%r22 + %r0], %r25
	.word 0xf60dc000  ! 120: LDUB_R	ldub	[%r23 + %r0], %r27
	.word 0xfe0c4000  ! 126: LDUB_R	ldub	[%r17 + %r0], %r31
	.word 0x8594a194  ! 127: WRPR_TSTATE_I	wrpr	%r18, 0x0194, %tstate
	.word 0xf81ce177  ! 130: LDD_I	ldd	[%r19 + 0x0177], %r28
	.word 0xb1510000  ! 131: RDPR_TICK	<illegal instruction>
	.word 0xb8c4601b  ! 132: ADDCcc_I	addccc 	%r17, 0x001b, %r28
	setx	0x2ce9543200004f47, %g1, %r10
	.word 0x839a8000  ! 134: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xf11da03f  ! 136: LDDF_I	ldd	[%r22, 0x003f], %f24
	.word 0xb9540000  ! 138: RDPR_GL	<illegal instruction>
	.word 0xfa0dc000  ! 141: LDUB_R	ldub	[%r23 + %r0], %r29
	.word 0xfe458000  ! 146: LDSW_R	ldsw	[%r22 + %r0], %r31
hwintr_2_5:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_5), 16, 16)) -> intp(2, 0, 26)
	.word 0xf6058000  ! 157: LDUW_R	lduw	[%r22 + %r0], %r27
	.word 0xfe4c4000  ! 159: LDSB_R	ldsb	[%r17 + %r0], %r31
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf91dc000  ! 171: LDDF_R	ldd	[%r23, %r0], %f28
hwintr_2_6:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_6), 16, 16)) -> intp(2, 0, 30)
	.word 0xf21c21db  ! 175: LDD_I	ldd	[%r16 + 0x01db], %r25
	.word 0xb751c000  ! 177: RDPR_TL	<illegal instruction>
	.word 0xf604e126  ! 178: LDUW_I	lduw	[%r19 + 0x0126], %r27
	.word 0xfe4de0bd  ! 179: LDSB_I	ldsb	[%r23 + 0x00bd], %r31
	setx	data_start_3, %g1, %r21
	.word 0xb5480000  ! 184: RDHPR_HPSTATE	rdhpr	%hpstate, %r26
	.word 0xb7518000  ! 185: RDPR_PSTATE	<illegal instruction>
hwintr_2_7:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_7), 16, 16)) -> intp(2, 0, 34)
	.word 0xfe5d2057  ! 188: LDX_I	ldx	[%r20 + 0x0057], %r31
	.word 0xf004e048  ! 189: LDUW_I	lduw	[%r19 + 0x0048], %r24
	.word 0xfe5dc000  ! 192: LDX_R	ldx	[%r23 + %r0], %r31
	.word 0xf51d0000  ! 195: LDDF_R	ldd	[%r20, %r0], %f26
	setx	data_start_1, %g1, %r16
	.word 0xf91c0000  ! 198: LDDF_R	ldd	[%r16, %r0], %f28
	.word 0xfd1c608b  ! 199: LDDF_I	ldd	[%r17, 0x008b], %f30
hwintr_2_8:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_8), 16, 16)) -> intp(2, 0, 24)
	.word 0x819461b0  ! 207: WRPR_TPC_I	wrpr	%r17, 0x01b0, %tpc
	.word 0xf205e14b  ! 208: LDUW_I	lduw	[%r23 + 0x014b], %r25
hwintr_2_9:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_9), 16, 16)) -> intp(2, 0, 18)
	setx	0x1815e8cf00004c04, %g1, %r10
	.word 0x819a8000  ! 215: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xfb1c4000  ! 218: LDDF_R	ldd	[%r17, %r0], %f29
	.word 0xfc4521e7  ! 220: LDSW_I	ldsw	[%r20 + 0x01e7], %r30
	.word 0xf81d8000  ! 230: LDD_R	ldd	[%r22 + %r0], %r28
	.word 0xf2448000  ! 232: LDSW_R	ldsw	[%r18 + %r0], %r25
	setx	0xcfabafa30000eb4e, %g1, %r10
	.word 0x819a8000  ! 236: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xbe35a1f3  ! 237: ORN_I	orn 	%r22, 0x01f3, %r31
	.word 0xbd508000  ! 240: RDPR_TSTATE	<illegal instruction>
hwintr_2_10:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_10), 16, 16)) -> intp(2, 0, 8)
	.word 0xfa5c8000  ! 244: LDX_R	ldx	[%r18 + %r0], %r29
	.word 0xb6b52186  ! 245: SUBCcc_I	orncc 	%r20, 0x0186, %r27
	.word 0xbf51c000  ! 246: RDPR_TL	<illegal instruction>
	.word 0xfc154000  ! 248: LDUH_R	lduh	[%r21 + %r0], %r30
	.word 0xfe458000  ! 252: LDSW_R	ldsw	[%r22 + %r0], %r31
	.word 0xbd51c000  ! 255: RDPR_TL	<illegal instruction>
	.word 0xf2040000  ! 257: LDUW_R	lduw	[%r16 + %r0], %r25
	.word 0xfc4420ed  ! 259: LDSW_I	ldsw	[%r16 + 0x00ed], %r30
	.word 0xf255a10c  ! 261: LDSH_I	ldsh	[%r22 + 0x010c], %r25
	.word 0xb8c58000  ! 262: ADDCcc_R	addccc 	%r22, %r0, %r28
hwintr_2_11:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_11), 16, 16)) -> intp(2, 0, c)
	.word 0xb41d0000  ! 266: XOR_R	xor 	%r20, %r0, %r26
	.word 0xbc1cc000  ! 267: XOR_R	xor 	%r19, %r0, %r30
	.word 0xb1641800  ! 268: MOVcc_R	<illegal instruction>
	.word 0x8594a073  ! 269: WRPR_TSTATE_I	wrpr	%r18, 0x0073, %tstate
	.word 0x8394e016  ! 270: WRPR_TNPC_I	wrpr	%r19, 0x0016, %tnpc
hwintr_2_12:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_12), 16, 16)) -> intp(2, 0, 12)
	.word 0xf60d8000  ! 274: LDUB_R	ldub	[%r22 + %r0], %r27
	.word 0xff1d60bc  ! 275: LDDF_I	ldd	[%r21, 0x00bc], %f31
hwintr_2_13:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_13), 16, 16)) -> intp(2, 0, 2a)
	.word 0xf805c000  ! 278: LDUW_R	lduw	[%r23 + %r0], %r28
	.word 0xf84dc000  ! 280: LDSB_R	ldsb	[%r23 + %r0], %r28
	.word 0xf8050000  ! 281: LDUW_R	lduw	[%r20 + %r0], %r28
	.word 0x8394e142  ! 283: WRPR_TNPC_I	wrpr	%r19, 0x0142, %tnpc
	setx	0xda2299c600008d13, %g1, %r10
	.word 0x819a8000  ! 285: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xbe3d4000  ! 289: XNOR_R	xnor 	%r21, %r0, %r31
	.word 0xf814c000  ! 293: LDUH_R	lduh	[%r19 + %r0], %r28
	.word 0xb3540000  ! 296: RDPR_GL	<illegal instruction>
	.word 0xfe5d8000  ! 300: LDX_R	ldx	[%r22 + %r0], %r31
	.word 0xbd540000  ! 302: RDPR_GL	<illegal instruction>
	.word 0xfc5cc000  ! 308: LDX_R	ldx	[%r19 + %r0], %r30
	.word 0xfa5c8000  ! 310: LDX_R	ldx	[%r18 + %r0], %r29
	.word 0xb49c4000  ! 312: XORcc_R	xorcc 	%r17, %r0, %r26
	.word 0xb6b58000  ! 315: SUBCcc_R	orncc 	%r22, %r0, %r27
	.word 0xf0052177  ! 318: LDUW_I	lduw	[%r20 + 0x0177], %r24
	.word 0xbb540000  ! 319: RDPR_GL	<illegal instruction>
	.word 0xfa0c4000  ! 322: LDUB_R	ldub	[%r17 + %r0], %r29
	.word 0xb2b4205d  ! 325: ORNcc_I	orncc 	%r16, 0x005d, %r25
	.word 0x8394a0c9  ! 328: WRPR_TNPC_I	wrpr	%r18, 0x00c9, %tnpc
	.word 0xf41d61e4  ! 329: LDD_I	ldd	[%r21 + 0x01e4], %r26
	.word 0x8395201f  ! 330: WRPR_TNPC_I	wrpr	%r20, 0x001f, %tnpc
	.word 0xf44d6097  ! 331: LDSB_I	ldsb	[%r21 + 0x0097], %r26
	.word 0xfa550000  ! 334: LDSH_R	ldsh	[%r20 + %r0], %r29
	.word 0xfa1d8000  ! 337: LDD_R	ldd	[%r22 + %r0], %r29
hwintr_2_14:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_14), 16, 16)) -> intp(2, 0, 0)
	.word 0xf01c61b6  ! 339: LDD_I	ldd	[%r17 + 0x01b6], %r24
	.word 0x8d9560b9  ! 344: WRPR_PSTATE_I	wrpr	%r21, 0x00b9, %pstate
hwintr_2_15:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_15), 16, 16)) -> intp(2, 0, 26)
	.word 0xfc4dc000  ! 348: LDSB_R	ldsb	[%r23 + %r0], %r30
hwintr_2_16:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_16), 16, 16)) -> intp(2, 0, 1)
hwintr_2_17:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_17), 16, 16)) -> intp(2, 0, 30)
	.word 0xf64520b0  ! 354: LDSW_I	ldsw	[%r20 + 0x00b0], %r27
	.word 0x8995e0ba  ! 356: WRPR_TICK_I	wrpr	%r23, 0x00ba, %tick
	.word 0xbd480000  ! 358: RDHPR_HPSTATE	rdhpr	%hpstate, %r30
hwintr_2_18:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_18), 16, 16)) -> intp(2, 0, 2)
	.word 0xf6144000  ! 363: LDUH_R	lduh	[%r17 + %r0], %r27
	.word 0xf51c0000  ! 366: LDDF_R	ldd	[%r16, %r0], %f26
	setx	0x8f4d801700001a4e, %g1, %r10
	.word 0x839a8000  ! 367: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	mov	1, %r12
	.word 0x8f930000  ! 368: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xfc1c61fa  ! 370: LDD_I	ldd	[%r17 + 0x01fa], %r30
	.word 0xfe5520a7  ! 371: LDSH_I	ldsh	[%r20 + 0x00a7], %r31
	.word 0x8195218f  ! 372: WRPR_TPC_I	wrpr	%r20, 0x018f, %tpc
	.word 0xbd34e001  ! 373: SRL_I	srl 	%r19, 0x0001, %r30
	.word 0xfa45a1cb  ! 375: LDSW_I	ldsw	[%r22 + 0x01cb], %r29
hwintr_2_19:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_19), 16, 16)) -> intp(2, 0, 1f)
	setx	0x5e15c8a80000acda, %g1, %r10
	.word 0x819a8000  ! 385: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xfe558000  ! 386: LDSH_R	ldsh	[%r22 + %r0], %r31
	.word 0xf4550000  ! 387: LDSH_R	ldsh	[%r20 + %r0], %r26
	.word 0xf60cc000  ! 392: LDUB_R	ldub	[%r19 + %r0], %r27
	.word 0xf0452159  ! 393: LDSW_I	ldsw	[%r20 + 0x0159], %r24
hwintr_2_20:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_20), 16, 16)) -> intp(2, 0, 20)
	.word 0x8395e01a  ! 396: WRPR_TNPC_I	wrpr	%r23, 0x001a, %tnpc
	.word 0x89952139  ! 398: WRPR_TICK_I	wrpr	%r20, 0x0139, %tick
	.word 0xbd50c000  ! 399: RDPR_TT	rdpr	%tt, %r30
	.word 0xbe94c000  ! 402: ORcc_R	orcc 	%r19, %r0, %r31
	.word 0xf01c601f  ! 404: LDD_I	ldd	[%r17 + 0x001f], %r24
	.word 0xf8154000  ! 408: LDUH_R	lduh	[%r21 + %r0], %r28
	.word 0xbd643801  ! 410: MOVcc_I	<illegal instruction>
	.word 0x919420ca  ! 411: WRPR_PIL_I	wrpr	%r16, 0x00ca, %pil
	setx	data_start_5, %g1, %r17
	mov	2, %r12
	.word 0xa1930000  ! 413: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xf04ce0e4  ! 414: LDSB_I	ldsb	[%r19 + 0x00e4], %r24
	.word 0xf21dc000  ! 415: LDD_R	ldd	[%r23 + %r0], %r25
hwintr_2_21:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_21), 16, 16)) -> intp(2, 0, 1a)
	.word 0xf814e199  ! 418: LDUH_I	lduh	[%r19 + 0x0199], %r28
	.word 0x8d95610f  ! 422: WRPR_PSTATE_I	wrpr	%r21, 0x010f, %pstate
	.word 0xfc54e1b7  ! 429: LDSH_I	ldsh	[%r19 + 0x01b7], %r30
	.word 0xf41dc000  ! 437: LDD_R	ldd	[%r23 + %r0], %r26
	.word 0xfa04a00d  ! 438: LDUW_I	lduw	[%r18 + 0x000d], %r29
	.word 0xfa1c60d8  ! 442: LDD_I	ldd	[%r17 + 0x00d8], %r29
	.word 0xf24ce0f0  ! 443: LDSB_I	ldsb	[%r19 + 0x00f0], %r25
	.word 0xfc558000  ! 448: LDSH_R	ldsh	[%r22 + %r0], %r30
	setx	0xf6874f850000dc4b, %g1, %r10
	.word 0x819a8000  ! 449: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xf60ce0a7  ! 453: LDUB_I	ldub	[%r19 + 0x00a7], %r27
	.word 0xf04cc000  ! 455: LDSB_R	ldsb	[%r19 + %r0], %r24
	.word 0xb7345000  ! 460: SRLX_R	srlx	%r17, %r0, %r27
	.word 0x8194e0e8  ! 461: WRPR_TPC_I	wrpr	%r19, 0x00e8, %tpc
	.word 0xf445204d  ! 464: LDSW_I	ldsw	[%r20 + 0x004d], %r26
hwintr_2_22:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_22), 16, 16)) -> intp(2, 0, e)
	.word 0xfe4c6081  ! 474: LDSB_I	ldsb	[%r17 + 0x0081], %r31
	.word 0xf0552175  ! 476: LDSH_I	ldsh	[%r20 + 0x0175], %r24
	.word 0xb435c000  ! 480: SUBC_R	orn 	%r23, %r0, %r26
	.word 0xbebde077  ! 486: XNORcc_I	xnorcc 	%r23, 0x0077, %r31
	.word 0xf01d4000  ! 489: LDD_R	ldd	[%r21 + %r0], %r24
	.word 0xfc0d0000  ! 490: LDUB_R	ldub	[%r20 + %r0], %r30
	.word 0xfe5ce00c  ! 491: LDX_I	ldx	[%r19 + 0x000c], %r31
	.word 0xf04421ab  ! 492: LDSW_I	ldsw	[%r16 + 0x01ab], %r24
	.word 0x8d94a016  ! 494: WRPR_PSTATE_I	wrpr	%r18, 0x0016, %pstate
	setx	data_start_4, %g1, %r20
	.word 0xfe45e19a  ! 500: LDSW_I	ldsw	[%r23 + 0x019a], %r31
	.word 0xf01d2165  ! 503: LDD_I	ldd	[%r20 + 0x0165], %r24
	.word 0x8994e090  ! 505: WRPR_TICK_I	wrpr	%r19, 0x0090, %tick
	.word 0xf91c6053  ! 506: LDDF_I	ldd	[%r17, 0x0053], %f28
	.word 0xf24da07d  ! 508: LDSB_I	ldsb	[%r22 + 0x007d], %r25
	.word 0xbe1d208d  ! 509: XOR_I	xor 	%r20, 0x008d, %r31
	.word 0xfe5c6071  ! 510: LDX_I	ldx	[%r17 + 0x0071], %r31
	.word 0xf254c000  ! 511: LDSH_R	ldsh	[%r19 + %r0], %r25
	.word 0xfc55e04c  ! 513: LDSH_I	ldsh	[%r23 + 0x004c], %r30
	.word 0xbb51c000  ! 515: RDPR_TL	<illegal instruction>
	.word 0xb73c3001  ! 516: SRAX_I	srax	%r16, 0x0001, %r27
	.word 0xf64c6106  ! 518: LDSB_I	ldsb	[%r17 + 0x0106], %r27
	.word 0xf20460bb  ! 522: LDUW_I	lduw	[%r17 + 0x00bb], %r25
	.word 0x8394e02a  ! 523: WRPR_TNPC_I	wrpr	%r19, 0x002a, %tnpc
	.word 0xfa156008  ! 530: LDUH_I	lduh	[%r21 + 0x0008], %r29
	.word 0xb7500000  ! 531: RDPR_TPC	<illegal instruction>
	.word 0x91952024  ! 532: WRPR_PIL_I	wrpr	%r20, 0x0024, %pil
	.word 0xf01d4000  ! 533: LDD_R	ldd	[%r21 + %r0], %r24
hwintr_2_23:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_23), 16, 16)) -> intp(2, 0, 34)
	.word 0xf51c61d6  ! 536: LDDF_I	ldd	[%r17, 0x01d6], %f26
	setx	data_start_1, %g1, %r21
	.word 0xb1508000  ! 540: RDPR_TSTATE	<illegal instruction>
	.word 0xf844a166  ! 541: LDSW_I	ldsw	[%r18 + 0x0166], %r28
	.word 0xf4042006  ! 542: LDUW_I	lduw	[%r16 + 0x0006], %r26
	.word 0xfa5d4000  ! 547: LDX_R	ldx	[%r21 + %r0], %r29
hwintr_2_24:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_24), 16, 16)) -> intp(2, 0, 0)
hwintr_2_25:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_25), 16, 16)) -> intp(2, 0, 27)
	.word 0xf21c0000  ! 555: LDD_R	ldd	[%r16 + %r0], %r25
	.word 0xf05c21aa  ! 556: LDX_I	ldx	[%r16 + 0x01aa], %r24
hwintr_2_26:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_26), 16, 16)) -> intp(2, 0, 31)
	.word 0xf20ce08d  ! 558: LDUB_I	ldub	[%r19 + 0x008d], %r25
	.word 0xf4448000  ! 561: LDSW_R	ldsw	[%r18 + %r0], %r26
	.word 0xbb540000  ! 562: RDPR_GL	<illegal instruction>
	.word 0xf644a079  ! 570: LDSW_I	ldsw	[%r18 + 0x0079], %r27
	.word 0xf11c8000  ! 571: LDDF_R	ldd	[%r18, %r0], %f24
	.word 0xfa1cc000  ! 574: LDD_R	ldd	[%r19 + %r0], %r29
	.word 0xb12db001  ! 576: SLLX_I	sllx	%r22, 0x0001, %r24
	.word 0xf64c4000  ! 577: LDSB_R	ldsb	[%r17 + %r0], %r27
	.word 0xb17c4400  ! 580: MOVR_R	movre	%r17, %r0, %r24
	.word 0x819420a6  ! 582: WRPR_TPC_I	wrpr	%r16, 0x00a6, %tpc
	.word 0xb9540000  ! 584: RDPR_GL	<illegal instruction>
	.word 0xbc0de169  ! 585: AND_I	and 	%r23, 0x0169, %r30
	.word 0xf01c21ca  ! 589: LDD_I	ldd	[%r16 + 0x01ca], %r24
hwintr_2_27:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_27), 16, 16)) -> intp(2, 0, 2c)
	.word 0xbf520000  ! 591: RDPR_PIL	<illegal instruction>
	.word 0xb13d5000  ! 592: SRAX_R	srax	%r21, %r0, %r24
	.word 0xfa0c8000  ! 593: LDUB_R	ldub	[%r18 + %r0], %r29
	.word 0xb8a4e0d2  ! 594: SUBcc_I	subcc 	%r19, 0x00d2, %r28
	setx	data_start_6, %g1, %r17
	.word 0xb03da10c  ! 600: XNOR_I	xnor 	%r22, 0x010c, %r24
	.word 0xf0140000  ! 601: LDUH_R	lduh	[%r16 + %r0], %r24
	.word 0xf8458000  ! 603: LDSW_R	ldsw	[%r22 + %r0], %r28
	setx	data_start_6, %g1, %r20
	.word 0xbb504000  ! 609: RDPR_TNPC	<illegal instruction>
	.word 0xf445e1a9  ! 610: LDSW_I	ldsw	[%r23 + 0x01a9], %r26
	.word 0x8d942012  ! 613: WRPR_PSTATE_I	wrpr	%r16, 0x0012, %pstate
	.word 0xfa442109  ! 614: LDSW_I	ldsw	[%r16 + 0x0109], %r29
	.word 0xf8454000  ! 619: LDSW_R	ldsw	[%r21 + %r0], %r28
	.word 0x83946157  ! 621: WRPR_TNPC_I	wrpr	%r17, 0x0157, %tnpc
	.word 0x8795a17b  ! 628: WRPR_TT_I	wrpr	%r22, 0x017b, %tt
	.word 0xfe55a1b4  ! 633: LDSH_I	ldsh	[%r22 + 0x01b4], %r31
	.word 0xf11ce0b9  ! 635: LDDF_I	ldd	[%r19, 0x00b9], %f24
	.word 0xf0148000  ! 637: LDUH_R	lduh	[%r18 + %r0], %r24
	.word 0xf80c217a  ! 638: LDUB_I	ldub	[%r16 + 0x017a], %r28
	.word 0x8194a164  ! 639: WRPR_TPC_I	wrpr	%r18, 0x0164, %tpc
	setx	data_start_2, %g1, %r18
	.word 0xf4054000  ! 643: LDUW_R	lduw	[%r21 + %r0], %r26
	.word 0xfc158000  ! 649: LDUH_R	lduh	[%r22 + %r0], %r30
	.word 0xf64cc000  ! 650: LDSB_R	ldsb	[%r19 + %r0], %r27
	.word 0xb7504000  ! 654: RDPR_TNPC	<illegal instruction>
	setx	0x1210266800005a48, %g1, %r10
	.word 0x819a8000  ! 660: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xf11de1cf  ! 665: LDDF_I	ldd	[%r23, 0x01cf], %f24
	.word 0xf8548000  ! 668: LDSH_R	ldsh	[%r18 + %r0], %r28
	.word 0xf004a111  ! 669: LDUW_I	lduw	[%r18 + 0x0111], %r24
	.word 0xbf540000  ! 672: RDPR_GL	rdpr	%-, %r31
	.word 0xb73d1000  ! 674: SRAX_R	srax	%r20, %r0, %r27
	.word 0x8d94e1dd  ! 676: WRPR_PSTATE_I	wrpr	%r19, 0x01dd, %pstate
	.word 0xfa454000  ! 677: LDSW_R	ldsw	[%r21 + %r0], %r29
	.word 0xb8240000  ! 678: SUB_R	sub 	%r16, %r0, %r28
hwintr_2_28:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_28), 16, 16)) -> intp(2, 0, 6)
	.word 0xbb504000  ! 681: RDPR_TNPC	<illegal instruction>
	.word 0xb150c000  ! 683: RDPR_TT	<illegal instruction>
	.word 0xfa4560e9  ! 685: LDSW_I	ldsw	[%r21 + 0x00e9], %r29
	.word 0xb9520000  ! 687: RDPR_PIL	<illegal instruction>
	.word 0xf844e19f  ! 689: LDSW_I	ldsw	[%r19 + 0x019f], %r28
	.word 0x8994e0ba  ! 691: WRPR_TICK_I	wrpr	%r19, 0x00ba, %tick
	.word 0xfe040000  ! 695: LDUW_R	lduw	[%r16 + %r0], %r31
	.word 0x8394a145  ! 696: WRPR_TNPC_I	wrpr	%r18, 0x0145, %tnpc
	.word 0xfa0d4000  ! 698: LDUB_R	ldub	[%r21 + %r0], %r29
	.word 0xfa04a0db  ! 701: LDUW_I	lduw	[%r18 + 0x00db], %r29
	setx	data_start_5, %g1, %r22
	.word 0xb7348000  ! 706: SRL_R	srl 	%r18, %r0, %r27
	mov	1, %r12
	.word 0xa1930000  ! 708: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xf11c0000  ! 709: LDDF_R	ldd	[%r16, %r0], %f24
	setx	data_start_1, %g1, %r23
	.word 0xf04dc000  ! 714: LDSB_R	ldsb	[%r23 + %r0], %r24
	.word 0xf21ca161  ! 716: LDD_I	ldd	[%r18 + 0x0161], %r25
	.word 0xf455e0f7  ! 720: LDSH_I	ldsh	[%r23 + 0x00f7], %r26
	.word 0xfc540000  ! 723: LDSH_R	ldsh	[%r16 + %r0], %r30
	setx	data_start_4, %g1, %r21
	.word 0xfa458000  ! 740: LDSW_R	ldsw	[%r22 + %r0], %r29
	setx	0x3dfce5a90000ee8f, %g1, %r10
	.word 0x819a8000  ! 741: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xfa44a149  ! 743: LDSW_I	ldsw	[%r18 + 0x0149], %r29
	.word 0xf415e0e7  ! 745: LDUH_I	lduh	[%r23 + 0x00e7], %r26
hwintr_2_29:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_29), 16, 16)) -> intp(2, 0, d)
	setx	0xc2ef5e540000cf5b, %g1, %r10
	.word 0x819a8000  ! 751: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xfa1c0000  ! 753: LDD_R	ldd	[%r16 + %r0], %r29
	.word 0xfa448000  ! 755: LDSW_R	ldsw	[%r18 + %r0], %r29
	.word 0xf404c000  ! 757: LDUW_R	lduw	[%r19 + %r0], %r26
	.word 0xfd1c0000  ! 758: LDDF_R	ldd	[%r16, %r0], %f30
	.word 0x879560fa  ! 760: WRPR_TT_I	wrpr	%r21, 0x00fa, %tt
	.word 0xf6548000  ! 761: LDSH_R	ldsh	[%r18 + %r0], %r27
	.word 0xb550c000  ! 762: RDPR_TT	<illegal instruction>
hwintr_2_30:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_30), 16, 16)) -> intp(2, 0, 7)
	setx	data_start_3, %g1, %r19
	.word 0x8594e1ae  ! 777: WRPR_TSTATE_I	wrpr	%r19, 0x01ae, %tstate
	.word 0xf4556035  ! 782: LDSH_I	ldsh	[%r21 + 0x0035], %r26
	.word 0xbd520000  ! 784: RDPR_PIL	<illegal instruction>
	.word 0xfc5c4000  ! 785: LDX_R	ldx	[%r17 + %r0], %r30
	.word 0xbe3c609d  ! 786: XNOR_I	xnor 	%r17, 0x009d, %r31
	setx	data_start_0, %g1, %r21
	setx	data_start_7, %g1, %r23
	.word 0xf64c60e7  ! 792: LDSB_I	ldsb	[%r17 + 0x00e7], %r27
	.word 0xf04d614b  ! 793: LDSB_I	ldsb	[%r21 + 0x014b], %r24
	.word 0xf61c0000  ! 794: LDD_R	ldd	[%r16 + %r0], %r27
	.word 0x8995e009  ! 795: WRPR_TICK_I	wrpr	%r23, 0x0009, %tick
	.word 0xf814210e  ! 799: LDUH_I	lduh	[%r16 + 0x010e], %r28
hwintr_2_31:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_31), 16, 16)) -> intp(2, 0, 3)
	.word 0xb17de401  ! 803: MOVR_I	movre	%r23, 0x1, %r24
hwintr_2_32:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_32), 16, 16)) -> intp(2, 0, 21)
	.word 0xfa148000  ! 810: LDUH_R	lduh	[%r18 + %r0], %r29
	.word 0xb73d6001  ! 816: SRA_I	sra 	%r21, 0x0001, %r27
	.word 0xf015e0d4  ! 818: LDUH_I	lduh	[%r23 + 0x00d4], %r24
	.word 0xf6154000  ! 823: LDUH_R	lduh	[%r21 + %r0], %r27
	.word 0xf8448000  ! 826: LDSW_R	ldsw	[%r18 + %r0], %r28
hwintr_2_33:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_33), 16, 16)) -> intp(2, 0, 9)
	.word 0xf21d0000  ! 831: LDD_R	ldd	[%r20 + %r0], %r25
	.word 0xbd508000  ! 833: RDPR_TSTATE	<illegal instruction>
	.word 0xf054c000  ! 835: LDSH_R	ldsh	[%r19 + %r0], %r24
	.word 0xfc54a0e2  ! 837: LDSH_I	ldsh	[%r18 + 0x00e2], %r30
	.word 0xf80d202f  ! 840: LDUB_I	ldub	[%r20 + 0x002f], %r28
	.word 0xff1c8000  ! 841: LDDF_R	ldd	[%r18, %r0], %f31
	.word 0xf005a109  ! 842: LDUW_I	lduw	[%r22 + 0x0109], %r24
	.word 0xf655618f  ! 844: LDSH_I	ldsh	[%r21 + 0x018f], %r27
	mov	0, %r12
	.word 0xa1930000  ! 845: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xfe0d4000  ! 848: LDUB_R	ldub	[%r21 + %r0], %r31
	.word 0xf405e050  ! 855: LDUW_I	lduw	[%r23 + 0x0050], %r26
	.word 0x9194e027  ! 856: WRPR_PIL_I	wrpr	%r19, 0x0027, %pil
	mov	0, %r12
	.word 0xa1930000  ! 860: WRPR_GL_R	wrpr	%r12, %r0, %-
hwintr_2_34:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_34), 16, 16)) -> intp(2, 0, 2a)
	.word 0xb60c0000  ! 868: AND_R	and 	%r16, %r0, %r27
	.word 0xb5520000  ! 869: RDPR_PIL	<illegal instruction>
	.word 0xf80c8000  ! 870: LDUB_R	ldub	[%r18 + %r0], %r28
	.word 0xf2548000  ! 874: LDSH_R	ldsh	[%r18 + %r0], %r25
	.word 0x8d94e10d  ! 878: WRPR_PSTATE_I	wrpr	%r19, 0x010d, %pstate
	.word 0x919520a0  ! 884: WRPR_PIL_I	wrpr	%r20, 0x00a0, %pil
	.word 0xfb1cc000  ! 888: LDDF_R	ldd	[%r19, %r0], %f29
hwintr_2_35:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_35), 16, 16)) -> intp(2, 0, 35)
	.word 0xf65ca00e  ! 892: LDX_I	ldx	[%r18 + 0x000e], %r27
	.word 0xf2454000  ! 900: LDSW_R	ldsw	[%r21 + %r0], %r25
hwintr_2_36:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_36), 16, 16)) -> intp(2, 0, 39)
	.word 0xf054a142  ! 905: LDSH_I	ldsh	[%r18 + 0x0142], %r24
	.word 0xfa04218e  ! 906: LDUW_I	lduw	[%r16 + 0x018e], %r29
	.word 0x919461f9  ! 909: WRPR_PIL_I	wrpr	%r17, 0x01f9, %pil
	.word 0xbc358000  ! 911: ORN_R	orn 	%r22, %r0, %r30
	.word 0xfc04c000  ! 917: LDUW_R	lduw	[%r19 + %r0], %r30
	.word 0xb93d2001  ! 919: SRA_I	sra 	%r20, 0x0001, %r28
	.word 0xfa1c21fc  ! 920: LDD_I	ldd	[%r16 + 0x01fc], %r29
	.word 0xbd342001  ! 921: SRL_I	srl 	%r16, 0x0001, %r30
	.word 0xf454a0c5  ! 922: LDSH_I	ldsh	[%r18 + 0x00c5], %r26
	.word 0xbb518000  ! 923: RDPR_PSTATE	<illegal instruction>
hwintr_2_37:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_37), 16, 16)) -> intp(2, 0, 18)
	.word 0xf61d8000  ! 932: LDD_R	ldd	[%r22 + %r0], %r27
	.word 0xbd2d6001  ! 936: SLL_I	sll 	%r21, 0x0001, %r30
	.word 0xf84de08f  ! 937: LDSB_I	ldsb	[%r23 + 0x008f], %r28
	.word 0xbd7ce401  ! 938: MOVR_I	movre	%r19, 0x1, %r30
	.word 0x8594e1ec  ! 946: WRPR_TSTATE_I	wrpr	%r19, 0x01ec, %tstate
	.word 0xb3510000  ! 947: RDPR_TICK	rdpr	%tick, %r25
	.word 0xf605a115  ! 949: LDUW_I	lduw	[%r22 + 0x0115], %r27
hwintr_2_38:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_38), 16, 16)) -> intp(2, 0, 1b)
	.word 0xf455610e  ! 951: LDSH_I	ldsh	[%r21 + 0x010e], %r26
	.word 0xf20d2117  ! 952: LDUB_I	ldub	[%r20 + 0x0117], %r25
	.word 0xf31ce075  ! 955: LDDF_I	ldd	[%r19, 0x0075], %f25
	setx	data_start_3, %g1, %r23
	.word 0x8994207c  ! 959: WRPR_TICK_I	wrpr	%r16, 0x007c, %tick
	.word 0xf60da00c  ! 964: LDUB_I	ldub	[%r22 + 0x000c], %r27
	.word 0xb1508000  ! 968: RDPR_TSTATE	<illegal instruction>
	setx	data_start_4, %g1, %r21
	.word 0xfa15a168  ! 970: LDUH_I	lduh	[%r22 + 0x0168], %r29
	.word 0xbb510000  ! 971: RDPR_TICK	<illegal instruction>
	.word 0xf81da001  ! 972: LDD_I	ldd	[%r22 + 0x0001], %r28
hwintr_2_39:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_39), 16, 16)) -> intp(2, 0, 1f)
hwintr_2_40:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_40), 16, 16)) -> intp(2, 0, 1)
	.word 0xf615a104  ! 976: LDUH_I	lduh	[%r22 + 0x0104], %r27
hwintr_2_41:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_41), 16, 16)) -> intp(2, 0, 14)
	.word 0xbc9c0000  ! 980: XORcc_R	xorcc 	%r16, %r0, %r30
	.word 0xfc0c4000  ! 984: LDUB_R	ldub	[%r17 + %r0], %r30
	.word 0xfe044000  ! 986: LDUW_R	lduw	[%r17 + %r0], %r31
	.word 0xb9540000  ! 988: RDPR_GL	<illegal instruction>
	.word 0xb1508000  ! 996: RDPR_TSTATE	<illegal instruction>
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_1:
	.word 0xb1a00020  ! 4: FMOVs	fmovs	%f0, %f24
	.word 0xb9a4c9c0  ! 8: FDIVd	fdivd	%f50, %f0, %f28
	setx	0x6be41c0300002c15, %g1, %r10
	.word 0x819a8000  ! 10: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xb3a489c0  ! 11: FDIVd	fdivd	%f18, %f0, %f56
	.word 0xb1a5c8a0  ! 12: FSUBs	fsubs	%f23, %f0, %f24
	.word 0xb7a00520  ! 16: FSQRTs	fsqrt	
	.word 0xb9a80420  ! 18: FMOVRZ	dis not found

	.word 0x91952053  ! 20: WRPR_PIL_I	wrpr	%r20, 0x0053, %pil
	.word 0xbfa90820  ! 24: FMOVLEU	fmovs	%fcc1, %f0, %f31
	.word 0x83956067  ! 30: WRPR_TNPC_I	wrpr	%r21, 0x0067, %tnpc
	.word 0xbb508000  ! 35: RDPR_TSTATE	<illegal instruction>
	.word 0xb5a80820  ! 40: FMOVRLEZ	fmovs	%fcc1, %f0, %f26
	.word 0xb1a80420  ! 43: FMOVRZ	dis not found

	.word 0xb9a48820  ! 47: FADDs	fadds	%f18, %f0, %f28
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
hwintr_1_0:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_0), 16, 16)) -> intp(1, 0, 12)
	.word 0x83946159  ! 55: WRPR_TNPC_I	wrpr	%r17, 0x0159, %tnpc
	.word 0xbcbd20b7  ! 56: XNORcc_I	xnorcc 	%r20, 0x00b7, %r30
hwintr_1_1:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_1), 16, 16)) -> intp(1, 0, 33)
	.word 0xb52dd000  ! 61: SLLX_R	sllx	%r23, %r0, %r26
hwintr_1_2:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_2), 16, 16)) -> intp(1, 0, 38)
	setx	0x4e2432ab000019c9, %g1, %r10
	.word 0x839a8000  ! 65: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	setx	0xb34acb4d0000ff40, %g1, %r10
	.word 0x839a8000  ! 67: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xbfab0820  ! 69: FMOVGU	fmovs	%fcc1, %f0, %f31
	.word 0x8194e06f  ! 71: WRPR_TPC_I	wrpr	%r19, 0x006f, %tpc
	.word 0xb4c58000  ! 73: ADDCcc_R	addccc 	%r22, %r0, %r26
hwintr_1_3:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_3), 16, 16)) -> intp(1, 0, 26)
	.word 0xbc444000  ! 75: ADDC_R	addc 	%r17, %r0, %r30
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbdab8820  ! 85: FMOVPOS	fmovs	%fcc1, %f0, %f30
hwintr_1_4:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_4), 16, 16)) -> intp(1, 0, 35)
	.word 0xb7518000  ! 90: RDPR_PSTATE	<illegal instruction>
	mov	0, %r12
	.word 0xa1930000  ! 93: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb7a00040  ! 96: FMOVd	fmovd	%f0, %f58
	.word 0xbfa80820  ! 97: FMOVN	fmovs	%fcc1, %f0, %f31
	.word 0xb7a4c8c0  ! 104: FSUBd	fsubd	%f50, %f0, %f58
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb3504000  ! 108: RDPR_TNPC	<illegal instruction>
	.word 0xb0b4c000  ! 109: ORNcc_R	orncc 	%r19, %r0, %r24
	.word 0xb3abc820  ! 110: FMOVVC	fmovs	%fcc1, %f0, %f25
	.word 0x8594a028  ! 111: WRPR_TSTATE_I	wrpr	%r18, 0x0028, %tstate
	.word 0xbda48940  ! 112: FMULd	fmuld	%f18, %f0, %f30
	.word 0xb7a00040  ! 115: FMOVd	fmovd	%f0, %f58
	.word 0xbda449e0  ! 118: FDIVq	dis not found

	.word 0x8595e028  ! 127: WRPR_TSTATE_I	wrpr	%r23, 0x0028, %tstate
	.word 0xb9510000  ! 131: RDPR_TICK	<illegal instruction>
	.word 0xbac5a108  ! 132: ADDCcc_I	addccc 	%r22, 0x0108, %r29
	.word 0xb5a5c8c0  ! 133: FSUBd	fsubd	%f54, %f0, %f26
	setx	0x895d93a600006b46, %g1, %r10
	.word 0x839a8000  ! 134: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb3a80820  ! 135: FMOVRLEZ	fmovs	%fcc1, %f0, %f25
	.word 0xbfa00560  ! 137: FSQRTq	fsqrt	
	.word 0xb1540000  ! 138: RDPR_GL	<illegal instruction>
	.word 0xb3a00540  ! 139: FSQRTd	fsqrt	
	.word 0xb7a84820  ! 142: FMOVE	fmovs	%fcc1, %f0, %f27
	.word 0xbfab4820  ! 143: FMOVCC	fmovs	%fcc1, %f0, %f31
	.word 0xbba94820  ! 144: FMOVCS	fmovs	%fcc1, %f0, %f29
	.word 0xbfa58820  ! 145: FADDs	fadds	%f22, %f0, %f31
	.word 0xb9a80820  ! 147: FMOVRLEZ	fmovs	%fcc1, %f0, %f28
	.word 0xb7a00020  ! 151: FMOVs	fmovs	%f0, %f27
hwintr_1_5:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_5), 16, 16)) -> intp(1, 0, 19)
	.word 0xb7a50820  ! 154: FADDs	fadds	%f20, %f0, %f27
	.word 0xbdaa8820  ! 158: FMOVG	fmovs	%fcc1, %f0, %f30
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbfab0820  ! 166: FMOVGU	fmovs	%fcc1, %f0, %f31
	.word 0xb1a54840  ! 169: FADDd	faddd	%f52, %f0, %f24
	.word 0xbba80c20  ! 172: FMOVRLZ	dis not found

hwintr_1_6:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_6), 16, 16)) -> intp(1, 0, 33)
	.word 0xb7a8c820  ! 176: FMOVL	fmovs	%fcc1, %f0, %f27
	.word 0xb151c000  ! 177: RDPR_TL	<illegal instruction>
	setx	data_start_2, %g1, %r16
	.word 0xbfa589e0  ! 182: FDIVq	dis not found

	.word 0xbf480000  ! 184: RDHPR_HPSTATE	rdhpr	%hpstate, %r31
	.word 0xb1518000  ! 185: RDPR_PSTATE	<illegal instruction>
hwintr_1_7:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_7), 16, 16)) -> intp(1, 0, 2)
	.word 0xb3ab0820  ! 194: FMOVGU	fmovs	%fcc1, %f0, %f25
	setx	data_start_5, %g1, %r22
	.word 0xb7a00560  ! 197: FSQRTq	fsqrt	
hwintr_1_8:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_8), 16, 16)) -> intp(1, 0, 5)
	.word 0xb7aac820  ! 203: FMOVGE	fmovs	%fcc1, %f0, %f27
	.word 0x8195207a  ! 207: WRPR_TPC_I	wrpr	%r20, 0x007a, %tpc
hwintr_1_9:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_9), 16, 16)) -> intp(1, 0, 29)
	setx	0x3f0df540000ea56, %g1, %r10
	.word 0x819a8000  ! 215: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xb3a4c9e0  ! 216: FDIVq	dis not found

	.word 0xbfa80820  ! 222: FMOVRLEZ	fmovs	%fcc1, %f0, %f31
	.word 0xb1a00020  ! 234: FMOVs	fmovs	%f0, %f24
	.word 0xb3a54920  ! 235: FMULs	fmuls	%f21, %f0, %f25
	setx	0xc46fd9f000006c48, %g1, %r10
	.word 0x819a8000  ! 236: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xba35a17d  ! 237: ORN_I	orn 	%r22, 0x017d, %r29
	.word 0xb1aac820  ! 238: FMOVGE	fmovs	%fcc1, %f0, %f24
	.word 0xbb508000  ! 240: RDPR_TSTATE	<illegal instruction>
	.word 0xbda448c0  ! 241: FSUBd	fsubd	%f48, %f0, %f30
	.word 0xbfa40920  ! 242: FMULs	fmuls	%f16, %f0, %f31
hwintr_1_10:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_10), 16, 16)) -> intp(1, 0, 12)
	.word 0xb4b5a1c3  ! 245: SUBCcc_I	orncc 	%r22, 0x01c3, %r26
	.word 0xb151c000  ! 246: RDPR_TL	<illegal instruction>
	.word 0xb9a00520  ! 247: FSQRTs	fsqrt	
	.word 0xb1a81420  ! 249: FMOVRNZ	dis not found

	.word 0xbda80820  ! 253: FMOVRLEZ	fmovs	%fcc1, %f0, %f30
	.word 0xb551c000  ! 255: RDPR_TL	<illegal instruction>
	.word 0xbec5c000  ! 262: ADDCcc_R	addccc 	%r23, %r0, %r31
hwintr_1_11:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_11), 16, 16)) -> intp(1, 0, b)
	.word 0xb9a449c0  ! 264: FDIVd	fdivd	%f48, %f0, %f28
	.word 0xbe1d8000  ! 266: XOR_R	xor 	%r22, %r0, %r31
	.word 0xb81d0000  ! 267: XOR_R	xor 	%r20, %r0, %r28
	.word 0xb3641800  ! 268: MOVcc_R	<illegal instruction>
	.word 0x85946073  ! 269: WRPR_TSTATE_I	wrpr	%r17, 0x0073, %tstate
	.word 0x8395606f  ! 270: WRPR_TNPC_I	wrpr	%r21, 0x006f, %tnpc
	.word 0xbfa48940  ! 271: FMULd	fmuld	%f18, %f0, %f62
hwintr_1_12:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_12), 16, 16)) -> intp(1, 0, 1c)
	.word 0xb1a448e0  ! 276: FSUBq	dis not found

hwintr_1_13:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_13), 16, 16)) -> intp(1, 0, 2d)
	.word 0x8395a1b2  ! 283: WRPR_TNPC_I	wrpr	%r22, 0x01b2, %tnpc
	setx	0xcc5e311300007d88, %g1, %r10
	.word 0x819a8000  ! 285: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xbba94820  ! 287: FMOVCS	fmovs	%fcc1, %f0, %f29
	.word 0xb63c8000  ! 289: XNOR_R	xnor 	%r18, %r0, %r27
	.word 0xb5a81c20  ! 290: FMOVRGEZ	dis not found

	.word 0xbbaa0820  ! 295: FMOVA	fmovs	%fcc1, %f0, %f29
	.word 0xb5540000  ! 296: RDPR_GL	<illegal instruction>
	.word 0xb1a00560  ! 299: FSQRTq	fsqrt	
	.word 0xb5540000  ! 302: RDPR_GL	<illegal instruction>
	.word 0xb7a5c9e0  ! 304: FDIVq	dis not found

	.word 0xb3a8c820  ! 306: FMOVL	fmovs	%fcc1, %f0, %f25
	.word 0xb1a00560  ! 311: FSQRTq	fsqrt	
	.word 0xb69d4000  ! 312: XORcc_R	xorcc 	%r21, %r0, %r27
	.word 0xb6b5c000  ! 315: SUBCcc_R	orncc 	%r23, %r0, %r27
	.word 0xbb540000  ! 319: RDPR_GL	<illegal instruction>
	.word 0xb3a408a0  ! 321: FSUBs	fsubs	%f16, %f0, %f25
	.word 0xbda509a0  ! 324: FDIVs	fdivs	%f20, %f0, %f30
	.word 0xbeb42155  ! 325: ORNcc_I	orncc 	%r16, 0x0155, %r31
	.word 0xbba80c20  ! 326: FMOVRLZ	dis not found

	.word 0x839560ec  ! 328: WRPR_TNPC_I	wrpr	%r21, 0x00ec, %tnpc
	.word 0x839521b7  ! 330: WRPR_TNPC_I	wrpr	%r20, 0x01b7, %tnpc
	.word 0xbfa48820  ! 333: FADDs	fadds	%f18, %f0, %f31
hwintr_1_14:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_14), 16, 16)) -> intp(1, 0, a)
	.word 0xbba588c0  ! 340: FSUBd	fsubd	%f22, %f0, %f60
	.word 0xb1a81820  ! 342: FMOVRGZ	fmovs	%fcc3, %f0, %f24
	.word 0x8d95e117  ! 344: WRPR_PSTATE_I	wrpr	%r23, 0x0117, %pstate
hwintr_1_15:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_15), 16, 16)) -> intp(1, 0, 3a)
hwintr_1_16:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_16), 16, 16)) -> intp(1, 0, 17)
hwintr_1_17:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_17), 16, 16)) -> intp(1, 0, f)
	.word 0x89952170  ! 356: WRPR_TICK_I	wrpr	%r20, 0x0170, %tick
	.word 0xb1aac820  ! 357: FMOVGE	fmovs	%fcc1, %f0, %f24
	.word 0xbd480000  ! 358: RDHPR_HPSTATE	rdhpr	%hpstate, %r30
	.word 0xbfa54860  ! 360: FADDq	dis not found

	.word 0xbda81820  ! 361: FMOVRGZ	fmovs	%fcc3, %f0, %f30
hwintr_1_18:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_18), 16, 16)) -> intp(1, 0, 1e)
	setx	0x8008a74400005980, %g1, %r10
	.word 0x839a8000  ! 367: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	mov	0, %r12
	.word 0x8f930000  ! 368: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xbba00540  ! 369: FSQRTd	fsqrt	
	.word 0x8194a097  ! 372: WRPR_TPC_I	wrpr	%r18, 0x0097, %tpc
	.word 0xb735a001  ! 373: SRL_I	srl 	%r22, 0x0001, %r27
hwintr_1_19:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_19), 16, 16)) -> intp(1, 0, 9)
	.word 0xbfa00020  ! 377: FMOVs	fmovs	%f0, %f31
	.word 0xbba508a0  ! 379: FSUBs	fsubs	%f20, %f0, %f29
	setx	0xf4d2ecac00001898, %g1, %r10
	.word 0x819a8000  ! 385: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
hwintr_1_20:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_20), 16, 16)) -> intp(1, 0, c)
	.word 0x83952015  ! 396: WRPR_TNPC_I	wrpr	%r20, 0x0015, %tnpc
	.word 0xb9a58840  ! 397: FADDd	faddd	%f22, %f0, %f28
	.word 0x8995e0da  ! 398: WRPR_TICK_I	wrpr	%r23, 0x00da, %tick
	.word 0xbd50c000  ! 399: RDPR_TT	<illegal instruction>
	.word 0xbe948000  ! 402: ORcc_R	orcc 	%r18, %r0, %r31
	.word 0xb1643801  ! 410: MOVcc_I	<illegal instruction>
	.word 0x9194214b  ! 411: WRPR_PIL_I	wrpr	%r16, 0x014b, %pil
	setx	data_start_7, %g1, %r18
	mov	0, %r12
	.word 0xa1930000  ! 413: WRPR_GL_R	wrpr	%r12, %r0, %-
hwintr_1_21:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_21), 16, 16)) -> intp(1, 0, 1d)
	.word 0xbba90820  ! 420: FMOVLEU	fmovs	%fcc1, %f0, %f29
	.word 0x8d95a039  ! 422: WRPR_PSTATE_I	wrpr	%r22, 0x0039, %pstate
	.word 0xb3a4c8c0  ! 424: FSUBd	fsubd	%f50, %f0, %f56
	.word 0xbfaa8820  ! 427: FMOVG	fmovs	%fcc1, %f0, %f31
	.word 0xb5a58920  ! 435: FMULs	fmuls	%f22, %f0, %f26
	.word 0xb7a00020  ! 439: FMOVs	fmovs	%f0, %f27
	.word 0xb5a448a0  ! 446: FSUBs	fsubs	%f17, %f0, %f26
	setx	0xbdad266a000019ce, %g1, %r10
	.word 0x819a8000  ! 449: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xb1a98820  ! 458: FMOVNEG	fmovs	%fcc1, %f0, %f24
	.word 0xb7349000  ! 460: SRLX_R	srlx	%r18, %r0, %r27
	.word 0x8195a0ac  ! 461: WRPR_TPC_I	wrpr	%r22, 0x00ac, %tpc
hwintr_1_22:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_22), 16, 16)) -> intp(1, 0, 21)
	.word 0xb5a88820  ! 467: FMOVLE	fmovs	%fcc1, %f0, %f26
	.word 0xbfa00540  ! 468: FSQRTd	fsqrt	
	.word 0xbfa00560  ! 470: FSQRTq	fsqrt	
	.word 0xbbaa8820  ! 471: FMOVG	fmovs	%fcc1, %f0, %f29
	.word 0xb7a44920  ! 472: FMULs	fmuls	%f17, %f0, %f27
	.word 0xbda8c820  ! 478: FMOVL	fmovs	%fcc1, %f0, %f30
	.word 0xb8344000  ! 480: SUBC_R	orn 	%r17, %r0, %r28
	.word 0xb7a80c20  ! 484: FMOVRLZ	dis not found

	.word 0xb2bc61fe  ! 486: XNORcc_I	xnorcc 	%r17, 0x01fe, %r25
	.word 0xbda80820  ! 493: FMOVN	fmovs	%fcc1, %f0, %f30
	.word 0x8d94a049  ! 494: WRPR_PSTATE_I	wrpr	%r18, 0x0049, %pstate
	.word 0xb9a81420  ! 495: FMOVRNZ	dis not found

	setx	data_start_5, %g1, %r22
	.word 0xb5a58920  ! 499: FMULs	fmuls	%f22, %f0, %f26
	.word 0xb3aa4820  ! 502: FMOVNE	fmovs	%fcc1, %f0, %f25
	.word 0x8995e130  ! 505: WRPR_TICK_I	wrpr	%r23, 0x0130, %tick
	.word 0xb41d2057  ! 509: XOR_I	xor 	%r20, 0x0057, %r26
	.word 0xb9a00020  ! 512: FMOVs	fmovs	%f0, %f28
	.word 0xb951c000  ! 515: RDPR_TL	<illegal instruction>
	.word 0xb33df001  ! 516: SRAX_I	srax	%r23, 0x0001, %r25
	.word 0x83956127  ! 523: WRPR_TNPC_I	wrpr	%r21, 0x0127, %tnpc
	.word 0xb3a81c20  ! 526: FMOVRGEZ	dis not found

	.word 0xb7a4c840  ! 527: FADDd	faddd	%f50, %f0, %f58
	.word 0xbfa84820  ! 529: FMOVE	fmovs	%fcc1, %f0, %f31
	.word 0xb5500000  ! 531: RDPR_TPC	<illegal instruction>
	.word 0x91956161  ! 532: WRPR_PIL_I	wrpr	%r21, 0x0161, %pil
	.word 0xbda90820  ! 534: FMOVLEU	fmovs	%fcc1, %f0, %f30
hwintr_1_23:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_23), 16, 16)) -> intp(1, 0, d)
	.word 0xb7abc820  ! 537: FMOVVC	fmovs	%fcc1, %f0, %f27
	setx	data_start_4, %g1, %r16
	.word 0xbfa548e0  ! 539: FSUBq	dis not found

	.word 0xb3508000  ! 540: RDPR_TSTATE	<illegal instruction>
	.word 0xbfa00520  ! 543: FSQRTs	fsqrt	
hwintr_1_24:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_24), 16, 16)) -> intp(1, 0, f)
	.word 0xbfaa8820  ! 550: FMOVG	fmovs	%fcc1, %f0, %f31
hwintr_1_25:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_25), 16, 16)) -> intp(1, 0, 27)
hwintr_1_26:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_26), 16, 16)) -> intp(1, 0, 2e)
	.word 0xbd540000  ! 562: RDPR_GL	<illegal instruction>
	.word 0xb3a00540  ! 563: FSQRTd	fsqrt	
	.word 0xbda98820  ! 564: FMOVNEG	fmovs	%fcc1, %f0, %f30
	.word 0xb9aa4820  ! 575: FMOVNE	fmovs	%fcc1, %f0, %f28
	.word 0xb12cb001  ! 576: SLLX_I	sllx	%r18, 0x0001, %r24
	.word 0xb1a508c0  ! 578: FSUBd	fsubd	%f20, %f0, %f24
	.word 0xbb7d8400  ! 580: MOVR_R	movre	%r22, %r0, %r29
	.word 0x8194e149  ! 582: WRPR_TPC_I	wrpr	%r19, 0x0149, %tpc
	.word 0xbb540000  ! 584: RDPR_GL	<illegal instruction>
	.word 0xbc0da060  ! 585: AND_I	and 	%r22, 0x0060, %r30
	.word 0xb9a589e0  ! 588: FDIVq	dis not found

hwintr_1_27:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_27), 16, 16)) -> intp(1, 0, 4)
	.word 0xb7520000  ! 591: RDPR_PIL	<illegal instruction>
	.word 0xb13d9000  ! 592: SRAX_R	srax	%r22, %r0, %r24
	.word 0xb8a56052  ! 594: SUBcc_I	subcc 	%r21, 0x0052, %r28
	.word 0xb5a508a0  ! 596: FSUBs	fsubs	%f20, %f0, %f26
	setx	data_start_7, %g1, %r18
	.word 0xba3c2168  ! 600: XNOR_I	xnor 	%r16, 0x0168, %r29
	.word 0xbdab0820  ! 602: FMOVGU	fmovs	%fcc1, %f0, %f30
	setx	data_start_7, %g1, %r16
	.word 0xb7a98820  ! 606: FMOVNEG	fmovs	%fcc1, %f0, %f27
	.word 0xb9504000  ! 609: RDPR_TNPC	<illegal instruction>
	.word 0x8d946175  ! 613: WRPR_PSTATE_I	wrpr	%r17, 0x0175, %pstate
	.word 0xb1a48860  ! 616: FADDq	dis not found

	.word 0xb5a44940  ! 620: FMULd	fmuld	%f48, %f0, %f26
	.word 0x8395217c  ! 621: WRPR_TNPC_I	wrpr	%r20, 0x017c, %tnpc
	.word 0x8794a04c  ! 628: WRPR_TT_I	wrpr	%r18, 0x004c, %tt
	.word 0xb7a489a0  ! 632: FDIVs	fdivs	%f18, %f0, %f27
	.word 0xbfa54860  ! 636: FADDq	dis not found

	.word 0x8195e0d1  ! 639: WRPR_TPC_I	wrpr	%r23, 0x00d1, %tpc
	setx	data_start_1, %g1, %r16
	.word 0xb3ab8820  ! 652: FMOVPOS	fmovs	%fcc1, %f0, %f25
	.word 0xb7504000  ! 654: RDPR_TNPC	<illegal instruction>
	.word 0xb1aa8820  ! 657: FMOVG	fmovs	%fcc1, %f0, %f24
	.word 0xb7a58940  ! 658: FMULd	fmuld	%f22, %f0, %f58
	setx	0x9731b3ae00003dcc, %g1, %r10
	.word 0x819a8000  ! 660: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xbda9c820  ! 663: FMOVVS	fmovs	%fcc1, %f0, %f30
	.word 0xbba80c20  ! 664: FMOVRLZ	dis not found

	.word 0xb9a00540  ! 666: FSQRTd	fsqrt	
	.word 0xbba448c0  ! 670: FSUBd	fsubd	%f48, %f0, %f60
	.word 0xbd540000  ! 672: RDPR_GL	rdpr	%-, %r30
	.word 0xb1a81820  ! 673: FMOVRGZ	fmovs	%fcc3, %f0, %f24
	.word 0xb13c9000  ! 674: SRAX_R	srax	%r18, %r0, %r24
	.word 0xbda48860  ! 675: FADDq	dis not found

	.word 0x8d95a17d  ! 676: WRPR_PSTATE_I	wrpr	%r22, 0x017d, %pstate
	.word 0xb424c000  ! 678: SUB_R	sub 	%r19, %r0, %r26
hwintr_1_28:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_28), 16, 16)) -> intp(1, 0, 20)
	.word 0xb7504000  ! 681: RDPR_TNPC	<illegal instruction>
	.word 0xb1a508a0  ! 682: FSUBs	fsubs	%f20, %f0, %f24
	.word 0xb150c000  ! 683: RDPR_TT	<illegal instruction>
	.word 0xbb520000  ! 687: RDPR_PIL	<illegal instruction>
	.word 0xb3a8c820  ! 690: FMOVL	fmovs	%fcc1, %f0, %f25
	.word 0x89942132  ! 691: WRPR_TICK_I	wrpr	%r16, 0x0132, %tick
	.word 0x83942080  ! 696: WRPR_TNPC_I	wrpr	%r16, 0x0080, %tnpc
	setx	data_start_1, %g1, %r19
	.word 0xb9a94820  ! 704: FMOVCS	fmovs	%fcc1, %f0, %f28
	.word 0xb5350000  ! 706: SRL_R	srl 	%r20, %r0, %r26
	mov	2, %r12
	.word 0xa1930000  ! 708: WRPR_GL_R	wrpr	%r12, %r0, %-
	setx	data_start_6, %g1, %r20
	.word 0xb7a54940  ! 719: FMULd	fmuld	%f52, %f0, %f58
	.word 0xb1ab4820  ! 729: FMOVCC	fmovs	%fcc1, %f0, %f24
	.word 0xb1a54840  ! 731: FADDd	faddd	%f52, %f0, %f24
	.word 0xb9a40940  ! 732: FMULd	fmuld	%f16, %f0, %f28
	.word 0xb1a00540  ! 733: FSQRTd	fsqrt	
	.word 0xb7abc820  ! 734: FMOVVC	fmovs	%fcc1, %f0, %f27
	setx	data_start_7, %g1, %r16
	.word 0xb9a50940  ! 737: FMULd	fmuld	%f20, %f0, %f28
	.word 0xb1a00040  ! 738: FMOVd	fmovd	%f0, %f24
	.word 0xbba80820  ! 739: FMOVRLEZ	fmovs	%fcc1, %f0, %f29
	setx	0x4193586d00006f56, %g1, %r10
	.word 0x819a8000  ! 741: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xb7a54820  ! 742: FADDs	fadds	%f21, %f0, %f27
hwintr_1_29:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_29), 16, 16)) -> intp(1, 0, 7)
	setx	0xf24c603700004e43, %g1, %r10
	.word 0x819a8000  ! 751: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xbba00520  ! 756: FSQRTs	fsqrt	
	.word 0xbba409e0  ! 759: FDIVq	dis not found

	.word 0x87956134  ! 760: WRPR_TT_I	wrpr	%r21, 0x0134, %tt
	.word 0xb950c000  ! 762: RDPR_TT	<illegal instruction>
	.word 0xbbaa0820  ! 764: FMOVA	fmovs	%fcc1, %f0, %f29
	.word 0xb1a44960  ! 766: FMULq	dis not found

	.word 0xb3a508c0  ! 768: FSUBd	fsubd	%f20, %f0, %f56
hwintr_1_30:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_30), 16, 16)) -> intp(1, 0, 0)
	.word 0xbda5c8e0  ! 772: FSUBq	dis not found

	.word 0xbbab0820  ! 774: FMOVGU	fmovs	%fcc1, %f0, %f29
	.word 0xb1a58940  ! 775: FMULd	fmuld	%f22, %f0, %f24
	setx	data_start_5, %g1, %r23
	.word 0x8594e1d7  ! 777: WRPR_TSTATE_I	wrpr	%r19, 0x01d7, %tstate
	.word 0xb5a409a0  ! 779: FDIVs	fdivs	%f16, %f0, %f26
	.word 0xbb520000  ! 784: RDPR_PIL	<illegal instruction>
	.word 0xba3da05c  ! 786: XNOR_I	xnor 	%r22, 0x005c, %r29
	setx	data_start_2, %g1, %r18
	setx	data_start_1, %g1, %r23
	.word 0x8994a100  ! 795: WRPR_TICK_I	wrpr	%r18, 0x0100, %tick
hwintr_1_31:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_31), 16, 16)) -> intp(1, 0, a)
	.word 0xb1a44920  ! 801: FMULs	fmuls	%f17, %f0, %f24
	.word 0xb5a80820  ! 802: FMOVN	fmovs	%fcc1, %f0, %f26
	.word 0xb17da401  ! 803: MOVR_I	movre	%r22, 0x1, %r24
	.word 0xbda40820  ! 807: FADDs	fadds	%f16, %f0, %f30
hwintr_1_32:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_32), 16, 16)) -> intp(1, 0, 39)
	.word 0xbfa589c0  ! 813: FDIVd	fdivd	%f22, %f0, %f62
	.word 0xbda40860  ! 815: FADDq	dis not found

	.word 0xb93c6001  ! 816: SRA_I	sra 	%r17, 0x0001, %r28
	.word 0xbda509a0  ! 817: FDIVs	fdivs	%f20, %f0, %f30
	.word 0xb1a44820  ! 819: FADDs	fadds	%f17, %f0, %f24
	.word 0xb9a00560  ! 821: FSQRTq	fsqrt	
	.word 0xbda409c0  ! 825: FDIVd	fdivd	%f16, %f0, %f30
	.word 0xb5a80820  ! 827: FMOVN	fmovs	%fcc1, %f0, %f26
	.word 0xb5a94820  ! 828: FMOVCS	fmovs	%fcc1, %f0, %f26
hwintr_1_33:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_33), 16, 16)) -> intp(1, 0, 0)
	.word 0xbb508000  ! 833: RDPR_TSTATE	<illegal instruction>
	.word 0xbda98820  ! 836: FMOVNEG	fmovs	%fcc1, %f0, %f30
	.word 0xb7a81420  ! 838: FMOVRNZ	dis not found

	mov	2, %r12
	.word 0xa1930000  ! 845: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xbbaac820  ! 846: FMOVGE	fmovs	%fcc1, %f0, %f29
	.word 0xbfa588a0  ! 849: FSUBs	fsubs	%f22, %f0, %f31
	.word 0xb9a40940  ! 851: FMULd	fmuld	%f16, %f0, %f28
	.word 0xbfab0820  ! 854: FMOVGU	fmovs	%fcc1, %f0, %f31
	.word 0x91942194  ! 856: WRPR_PIL_I	wrpr	%r16, 0x0194, %pil
	.word 0xb9aa4820  ! 858: FMOVNE	fmovs	%fcc1, %f0, %f28
	mov	2, %r12
	.word 0xa1930000  ! 860: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb7a00020  ! 861: FMOVs	fmovs	%f0, %f27
	.word 0xbda48860  ! 865: FADDq	dis not found

hwintr_1_34:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_34), 16, 16)) -> intp(1, 0, 27)
	.word 0xb80cc000  ! 868: AND_R	and 	%r19, %r0, %r28
	.word 0xbd520000  ! 869: RDPR_PIL	<illegal instruction>
	.word 0x8d95a11a  ! 878: WRPR_PSTATE_I	wrpr	%r22, 0x011a, %pstate
	.word 0xbfa54920  ! 882: FMULs	fmuls	%f21, %f0, %f31
	.word 0xb5a00040  ! 883: FMOVd	fmovd	%f0, %f26
	.word 0x9195e0a6  ! 884: WRPR_PIL_I	wrpr	%r23, 0x00a6, %pil
	.word 0xb5a4c8a0  ! 885: FSUBs	fsubs	%f19, %f0, %f26
hwintr_1_35:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_35), 16, 16)) -> intp(1, 0, e)
	.word 0xbba44960  ! 890: FMULq	dis not found

	.word 0xbba00540  ! 893: FSQRTd	fsqrt	
	.word 0xb1a54820  ! 896: FADDs	fadds	%f21, %f0, %f24
	.word 0xb3a509e0  ! 899: FDIVq	dis not found

	.word 0xb1a81420  ! 902: FMOVRNZ	dis not found

hwintr_1_36:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_36), 16, 16)) -> intp(1, 0, 28)
	.word 0xb3a44940  ! 907: FMULd	fmuld	%f48, %f0, %f56
	.word 0x9194613f  ! 909: WRPR_PIL_I	wrpr	%r17, 0x013f, %pil
	.word 0xbdab0820  ! 910: FMOVGU	fmovs	%fcc1, %f0, %f30
	.word 0xbc344000  ! 911: ORN_R	orn 	%r17, %r0, %r30
	.word 0xb1aac820  ! 913: FMOVGE	fmovs	%fcc1, %f0, %f24
	.word 0xb3a80c20  ! 914: FMOVRLZ	dis not found

	.word 0xbba00040  ! 916: FMOVd	fmovd	%f0, %f60
	.word 0xb33d6001  ! 919: SRA_I	sra 	%r21, 0x0001, %r25
	.word 0xbb34e001  ! 921: SRL_I	srl 	%r19, 0x0001, %r29
	.word 0xbd518000  ! 923: RDPR_PSTATE	<illegal instruction>
	.word 0xb7a00560  ! 924: FSQRTq	fsqrt	
	.word 0xb3a54840  ! 926: FADDd	faddd	%f52, %f0, %f56
hwintr_1_37:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_37), 16, 16)) -> intp(1, 0, e)
	.word 0xb7a44840  ! 929: FADDd	faddd	%f48, %f0, %f58
	.word 0xb9a54860  ! 930: FADDq	dis not found

	.word 0xb12de001  ! 936: SLL_I	sll 	%r23, 0x0001, %r24
	.word 0xb97ce401  ! 938: MOVR_I	movre	%r19, 0x1, %r28
	.word 0xb9a589e0  ! 940: FDIVq	dis not found

	.word 0x8594e0a0  ! 946: WRPR_TSTATE_I	wrpr	%r19, 0x00a0, %tstate
	.word 0xb7510000  ! 947: RDPR_TICK	<illegal instruction>
hwintr_1_38:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_38), 16, 16)) -> intp(1, 0, 3e)
	.word 0xbfa84820  ! 954: FMOVE	fmovs	%fcc1, %f0, %f31
	setx	data_start_6, %g1, %r23
	.word 0xbda408e0  ! 957: FSUBq	dis not found

	.word 0x89956167  ! 959: WRPR_TICK_I	wrpr	%r21, 0x0167, %tick
	.word 0xb9ab0820  ! 960: FMOVGU	fmovs	%fcc1, %f0, %f28
	.word 0xbba588a0  ! 961: FSUBs	fsubs	%f22, %f0, %f29
	.word 0xb3a48840  ! 962: FADDd	faddd	%f18, %f0, %f56
	.word 0xb7508000  ! 968: RDPR_TSTATE	<illegal instruction>
	setx	data_start_0, %g1, %r19
	.word 0xb9510000  ! 971: RDPR_TICK	<illegal instruction>
hwintr_1_39:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_39), 16, 16)) -> intp(1, 0, 29)
	.word 0xbda00520  ! 974: FSQRTs	fsqrt	
hwintr_1_40:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_40), 16, 16)) -> intp(1, 0, 26)
	.word 0xb7a00040  ! 977: FMOVd	fmovd	%f0, %f58
hwintr_1_41:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_41), 16, 16)) -> intp(1, 0, 4)
	.word 0xb69c8000  ! 980: XORcc_R	xorcc 	%r18, %r0, %r27
	.word 0xb1aac820  ! 981: FMOVGE	fmovs	%fcc1, %f0, %f24
	.word 0xb7a80820  ! 985: FMOVRLEZ	fmovs	%fcc1, %f0, %f27
	.word 0xb7a548c0  ! 987: FSUBd	fsubd	%f52, %f0, %f58
	.word 0xb5540000  ! 988: RDPR_GL	<illegal instruction>
	.word 0xbba50820  ! 990: FADDs	fadds	%f20, %f0, %f29
	.word 0xb5a589a0  ! 991: FDIVs	fdivs	%f22, %f0, %f26
	.word 0xbfa81c20  ! 992: FMOVRGEZ	dis not found

	.word 0xbda90820  ! 993: FMOVLEU	fmovs	%fcc1, %f0, %f30
	.word 0xbd508000  ! 996: RDPR_TSTATE	<illegal instruction>

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

	.xword	0xf699d9589cac7de4
	.xword	0x06507c80cf0e44a9
	.xword	0xea142d2b3b371776
	.xword	0xbb8066a9e4c530a0
	.xword	0x66a5dc0071fc3bdc
	.xword	0x3bd5a48a473cf51b
	.xword	0x55c1763151c951b9
	.xword	0x92f56c2aab70333a
	.xword	0xd289fe8c8c0b9f06
	.xword	0xc001ce4f8ba0d73d
	.xword	0x259d5d816d864e25
	.xword	0x6e47eb24c20d39b1
	.xword	0x4e9504ebfcfb1588
	.xword	0x1de7942d90c28c2b
	.xword	0xe39f71d2259b08a2
	.xword	0xc5cf42adc8b6db47
	.xword	0x1beb396eb3fa600c
	.xword	0x9ffef8b7fde34931
	.xword	0x0cdd98d5adb3363e
	.xword	0xe53e5b7e837b6bbe
	.xword	0xb8e93a49a0338ba6
	.xword	0x67efd4b2987ec43b
	.xword	0x2f448e10e4f328ca
	.xword	0xea8643e2f377919d
	.xword	0x4ad6ffa7370a9005
	.xword	0xbafb5aa78466e59a
	.xword	0x1dffae75e968aea2
	.xword	0x8708b32d57b52c9f
	.xword	0xbbb3c63488ed7109
	.xword	0xdc059c816ce91d87
	.xword	0xac9da63fb64783de
	.xword	0x3c786929e0d4baa1
	.xword	0xe9a525a0590be2b3
	.xword	0x02d80849b5c85999
	.xword	0xe970927cb018180a
	.xword	0xb4a147b9ed644bb5
	.xword	0xb4b957fde0747fa8
	.xword	0x8f18ccb8cd1a8d3e
	.xword	0x50d2f678dbe00b56
	.xword	0x91ad58b802ce7b76
	.xword	0x1c3159b747071f65
	.xword	0xae3718208d082630
	.xword	0x5d5a7694da5b72ea
	.xword	0x3423ab9b8639f9ac
	.xword	0x82cc8b868c0aaa1a
	.xword	0xbc6fc0bbda546ad3
	.xword	0x49e94a66f9a6efb1
	.xword	0x7d3c992b81c783e1
	.xword	0x78a6c553d64078fa
	.xword	0x418ff6cdf8427917
	.xword	0xd75183023544dbfa
	.xword	0x812d13b9fd33122c
	.xword	0x72a1280784a37ee3
	.xword	0x20c80c7ac12eb94f
	.xword	0x95aa78691502a8ce
	.xword	0xf0120eee59065739
	.xword	0xcb95d0bc029a2c55
	.xword	0x18beea96d499b0ce
	.xword	0x5c6a51e4a8df6840
	.xword	0xa13fc3b7468a58d2
	.xword	0xefc604ac1939a195
	.xword	0xd007b812d0073c4f
	.xword	0x00d10bfca42208d0
	.xword	0x793c0658d1e2ef04
	.xword	0x6c3d36ca400df0c5
	.xword	0x73c24f47141bdcee
	.xword	0x896ddab24b4a3102
	.xword	0x3daf7985b5b96c09
	.xword	0x982c23ea0a03d0ed
	.xword	0x6c6aa4873c0db8d3
	.xword	0x41960d40e9e6c797
	.xword	0x6fa477d1d1971d44
	.xword	0xd347d69e078acbde
	.xword	0x91867df9520a6f41
	.xword	0xfe7291a25e2c4106
	.xword	0xee97dfd4db9db658
	.xword	0x30b5e2502dedc99c
	.xword	0x1680054febe89a6a
	.xword	0x2442cfd8ea5184e4
	.xword	0x80a7bef8c1b3236d
	.xword	0x920bc30a6d3105e8
	.xword	0x55a23823e90f35c1
	.xword	0x2038fa2764b78351
	.xword	0xb100b06482e93fc8
	.xword	0x857378edc88c3226
	.xword	0xed50463d958c9f77
	.xword	0x823a9022928f9433
	.xword	0x2dd9877e934fa106
	.xword	0x1f56c1ffb35d18aa
	.xword	0xe42935cd1e143dd2
	.xword	0x7b2f9960906bcb09
	.xword	0x86bbd9f488a9e581
	.xword	0x95616fa45113bb22
	.xword	0xf5c500b6711310d2
	.xword	0xcce3cb43fb1c16a3
	.xword	0x5e6c5516122105f3
	.xword	0x03e81ad457194dd0
	.xword	0xbdd1a96365703bf5
	.xword	0xca27de2d0dc47df5
	.xword	0x24ed2a030092e61f
	.xword	0x6345e433874b4d5d
	.xword	0x2af38da755270e0d
	.xword	0x65a4da5af489fe33
	.xword	0xb13e2745bb5b4707
	.xword	0xd2d17a7597acad55
	.xword	0x17d36cca5e23b637
	.xword	0x62c115d222c98d94
	.xword	0x315d40759afe2d74
	.xword	0xe99db922155fbb0f
	.xword	0x2ecc6dbe4f9260db
	.xword	0x52cdb2fe39546e4a
	.xword	0xf953a969257f81a0
	.xword	0x040a53686974cee5
	.xword	0xa3fc9c9fa8948d29
	.xword	0xb65010ba5682d31c
	.xword	0x16ae6376469ecb47
	.xword	0x29e90a3adf16634f
	.xword	0x080dc2b761e18b1d
	.xword	0xcbac8cbaa12d4d55
	.xword	0x23c43973c9b3ef70
	.xword	0x0024d8ec7f0c07dd
	.xword	0x77e398fd8aadd4ac
	.xword	0x10c0f070a8eba7aa
	.xword	0xe3d05f1d92d46128
	.xword	0xafcb629662fb54af
	.xword	0x40a77b65f0640cc1
	.xword	0xd292b532027c7695
	.xword	0x1307e2b64bb7516f
	.xword	0xaafaf099abc462d4
	.xword	0x86c0ffd88b70d39d
	.xword	0x34269bc49cffc565
	.xword	0x0aa50c7c0adf3bee
	.xword	0xf3283e80395756cd
	.xword	0x35b957bc6ac26984
	.xword	0x57ace36fa1f96724
	.xword	0xab53c668b391ef1c
	.xword	0xae75bda0485019b0
	.xword	0x0e5040545653c4bb
	.xword	0x4b68f1236304ad16
	.xword	0x523b5a71e92f2c06
	.xword	0xebe98d3bf67b35d3
	.xword	0x6c4e89cc1923e2ac
	.xword	0xe24684777497e5d7
	.xword	0x42ff9b5fee3a725d
	.xword	0x24b60bf7962a2cde
	.xword	0x86a71a90a1187c7f
	.xword	0x8b219cbcf7126cc3
	.xword	0x302ce99a1d3d19a9
	.xword	0x0bc8944d72aee9b8
	.xword	0xbb1c74c8ca53316a
	.xword	0x13611031ccbe5343
	.xword	0xfd44fe4120417891
	.xword	0x591a8fb9208b826c
	.xword	0x875d3df22c75a673
	.xword	0xbe4f2ed36740479a
	.xword	0x56e6ff9fc4714f93
	.xword	0xceeb0c9f00bee67e
	.xword	0xa12f29644472ecc3
	.xword	0x273416784e64c722
	.xword	0xd54371fefa19c29d
	.xword	0x1d0c40d60146492e
	.xword	0x13e1acd42c4c2381
	.xword	0x7a0890aed57859e7
	.xword	0xc3855ced173806fd
	.xword	0xda82a37384a9874d
	.xword	0x6cb0a6ed1b4f078d
	.xword	0xfde9e96ab8707e91
	.xword	0x04c98752e48f36ab
	.xword	0xfddb85e21e507751
	.xword	0x07d6d7fb72842d43
	.xword	0xa9bce406219cc31a
	.xword	0xbce10ac2b310efee
	.xword	0xe288b1e81e9cfc49
	.xword	0xa006a706e49793f1
	.xword	0xeae6db83ebf50168
	.xword	0x40b5b9ba4a74942f
	.xword	0x5026c43eee88fe43
	.xword	0x38c83b5193be3f79
	.xword	0x3d4732b8fe33c168
	.xword	0x2c17533ca61b6de3
	.xword	0x3f7ac7a125c193a0
	.xword	0xeb3d952c9a9f446b
	.xword	0x470fdd3427e077ca
	.xword	0x7a9e5a35e43cb6ff
	.xword	0x7d5fe955dcdede4f
	.xword	0x84a994ef2423da0a
	.xword	0x33c6766b44ad6f88
	.xword	0xb175f525eb5276ce
	.xword	0x03eb7d69e1b23f01
	.xword	0x61e589a6a891412d
	.xword	0x949c8d3c0bf0dcaf
	.xword	0xef1df149271020c1
	.xword	0x7cba43eb486015a2
	.xword	0x8fefb4d5f8a2b88a
	.xword	0x2d56461712d75787
	.xword	0x34a6d6823d2f347a
	.xword	0xa45841d34cd81bc6
	.xword	0xbd423644909bc840
	.xword	0xc8ce606a8f9dff08
	.xword	0x9136552290c976f0
	.xword	0x0aeb5513664cc435
	.xword	0xd350b788b4b499dd
	.xword	0x43119196086a18fb
	.xword	0x248f241f9acf381d
	.xword	0x736fd5594e99ef79
	.xword	0xa751902e4d629be7
	.xword	0x06c6d63fe98d87dd
	.xword	0xdcf0d06b38513f34
	.xword	0x443d4c68fe2274e6
	.xword	0x0a819d0525467a2c
	.xword	0x8e6337e5a596d9ea
	.xword	0xb53abcc5eee07c7e
	.xword	0xd4b46b6935e6fb2d
	.xword	0x46cd8346a9c6111f
	.xword	0x7d6e96757992f038
	.xword	0x9b5389cc0876e4cb
	.xword	0x527ede2fbc947831
	.xword	0xb415e940c4deb05b
	.xword	0xa959030ba6c519c6
	.xword	0xa419add105dafc3a
	.xword	0xa76a4b7c94cec817
	.xword	0x36a0514dcc5f2357
	.xword	0x075b35b8d9a9339a
	.xword	0x58a92fe8dcfa9c2a
	.xword	0xc30f0c5bd849fecf
	.xword	0xfa49dffcaa13e09a
	.xword	0xd47aa94721b5cecd
	.xword	0x5588fc4aee2b433a
	.xword	0xa3cedd7cdd48935d
	.xword	0x861ae54071742971
	.xword	0xcfd24a56ab1c0fb6
	.xword	0x56c5ff25dfc04413
	.xword	0x20e047b7dccf19a3
	.xword	0xec44b30fa597604a
	.xword	0x9a36ab5307d220b0
	.xword	0x62651a1a8219b9ea
	.xword	0x333f9d8f60e7a6ee
	.xword	0x188cd4f9b208b030
	.xword	0x8498080e01a6d213
	.xword	0x96b4774892f08efe
	.xword	0x7c500b20f8c852ff
	.xword	0x1bc43acb335ac64d
	.xword	0xca45ec8362c8959e
	.xword	0xacd8f6df5524e869
	.xword	0xa7e71674cf43bd6f
	.xword	0x36f9f23eed7af73b
	.xword	0xb71eeed04c0da763
	.xword	0x453cabf889029ca7
	.xword	0x987ec3ab72ad181b
	.xword	0x1b23f7eec5ea4346
	.xword	0x444bec05b60f94ea
	.xword	0xddd69a111101946e
	.xword	0x139bd3cdeb41e442
	.xword	0xee9f71f78622f38f
	.xword	0x41b169ae70e3f416
	.xword	0x7199783ca7644444
	.align 0x2000
	.data
data_start_1:

	.xword	0x6d86f2ade4812f6b
	.xword	0x8d4fec090f491e66
	.xword	0xdf37c604399c3ec3
	.xword	0x7ca0b94d59706512
	.xword	0xf5bb70dade2d17af
	.xword	0xf73cb1de5227ec25
	.xword	0x2deb213de8547123
	.xword	0xb61d21335636d24f
	.xword	0xc9e87e0274827d14
	.xword	0x870279ca1952837e
	.xword	0xb901f0a420727aee
	.xword	0x47769c9ff4f0c58a
	.xword	0x8ce3f387161ec1dc
	.xword	0x900ec9514cb63db7
	.xword	0xa1e922889aecb110
	.xword	0x6dbc43669039412e
	.xword	0x9fccd46b91c4bdd9
	.xword	0xe3f2715f9379a89e
	.xword	0xa087e60e1763fd06
	.xword	0xd4dccdc31b1db755
	.xword	0xbe2cd5b35b19b1c6
	.xword	0xb4a97db698af4bad
	.xword	0xe597df52c7444f4e
	.xword	0x7af8d3c14bf81695
	.xword	0x77de7e088b3c0d21
	.xword	0xeb420c00719e1858
	.xword	0xe4e56458776b3ec8
	.xword	0xe853935f7c59c29f
	.xword	0x66c33087e6ed6a19
	.xword	0x1bfb787412f93e6f
	.xword	0x83b262d6cd48ea22
	.xword	0x889bdc9117a19373
	.xword	0x1051801efd4ee06c
	.xword	0x9e173a739c102018
	.xword	0xfb28e0df757ec68c
	.xword	0x33cbf2edd65bdfe2
	.xword	0x147b275730713fff
	.xword	0xe10e6e581d67cf8e
	.xword	0x1cfd0b4eb8f3d1f1
	.xword	0xf169b9045ff66879
	.xword	0x398f2a4797a46f05
	.xword	0x3b77f8fe555faab6
	.xword	0x6a063d1c50129bc9
	.xword	0xf26380169ee4bf88
	.xword	0xc9ff0f0a7bb0f952
	.xword	0xcbd876775ae0e584
	.xword	0xc390f7a27e5e41a9
	.xword	0xac52be6a3c308342
	.xword	0x26ea146348d4a2fa
	.xword	0xd49cbd7980d864b0
	.xword	0xc35047f1f79ac971
	.xword	0x889da3a96d22b5aa
	.xword	0x8562b03ce72c12e7
	.xword	0x9d3f1dcd545ca0bb
	.xword	0x30e211724ec346c0
	.xword	0x8cd28907b063fc1d
	.xword	0xc69a9c4e7a2a330f
	.xword	0xfdb56fe3eb06b98f
	.xword	0x745f241822f4c5f3
	.xword	0xa954e2c4f46bc4ea
	.xword	0x74cdd3a7466f3804
	.xword	0xb8707ad95438bcf3
	.xword	0xc2e5975a481b334c
	.xword	0x40f9461963d5a81a
	.xword	0xb120e62ee82f24f5
	.xword	0x6ee41bb765e3150d
	.xword	0x6bdd367bbced89bb
	.xword	0x0d8d46f9fac824cb
	.xword	0x1f0f40926e13fd8a
	.xword	0x1160be8c2b74a01c
	.xword	0x23af5e2f55de8ff1
	.xword	0x9cf0de825fea00af
	.xword	0xb71be9e63e0476a3
	.xword	0x8439776852d8c9ad
	.xword	0x2edb34830ae4af66
	.xword	0xfc20da3a04b07065
	.xword	0xc90aade6e107c820
	.xword	0x81567812709008ed
	.xword	0x5b003768e98e0cd0
	.xword	0x2141e40831284dcc
	.xword	0x7821bc1019caab67
	.xword	0xf78ad30adf79656d
	.xword	0x338f25a419f0be75
	.xword	0x1ad3cd773abb64df
	.xword	0xb086b960e46d7758
	.xword	0x9dd2c8eec3f1517c
	.xword	0x872249deff9e0be7
	.xword	0x7b7ebe99eafbab96
	.xword	0x42fb16dd5c1cbf39
	.xword	0x989562bf40e0c628
	.xword	0x24027f155ac1470b
	.xword	0x35597d580a6c2f14
	.xword	0x7f9288dd8bbe38a0
	.xword	0x44782e561d72c26b
	.xword	0x32edb1050c14054c
	.xword	0xfa83ffd783abcba5
	.xword	0xe41356e5cb88d965
	.xword	0x3e3fffa9d799ff95
	.xword	0x1e759f6c146ec059
	.xword	0xe849632467d84055
	.xword	0x224e278a4ece6045
	.xword	0x011d4d25b547d3a8
	.xword	0x44c983db29bbc5bf
	.xword	0x7f5ca8d8f4b64f3f
	.xword	0xbad976995be80a5b
	.xword	0x0960f74952da848f
	.xword	0x6bc7b191cd27cd65
	.xword	0x24acd0e663cbfb6e
	.xword	0x9ffcab398c646ba0
	.xword	0x9a68cef38e0a0983
	.xword	0x051af658d6c31615
	.xword	0x0ea6638f295106e4
	.xword	0xeffc1dc12f84eff8
	.xword	0xc52a98d824d530c0
	.xword	0xc1987519ebf7168d
	.xword	0xf7f41e74a1e6387a
	.xword	0x9812bfdcf9bfcb7e
	.xword	0x8fb1bf11a0d3410b
	.xword	0x25079a7a5382f5c1
	.xword	0x226ec93c38e00765
	.xword	0x903e8c316dfba5b2
	.xword	0xd6bfbc678c2678c6
	.xword	0x2de7f040541612d4
	.xword	0xb79ee74d7ed4e78a
	.xword	0x94e163b89a89c544
	.xword	0x153e3ecd8046a544
	.xword	0x96b27a4c15082557
	.xword	0xb65077673797c309
	.xword	0x5f61f67e43583eea
	.xword	0xbd38ce7424fdeb05
	.xword	0xdbe119c3b6b2f460
	.xword	0x7c4c917f9774417a
	.xword	0x7a50f42e3ecb2d78
	.xword	0x1d63c68c1208edeb
	.xword	0xa1c6365f5d102971
	.xword	0x4c096c0e6a761818
	.xword	0x8fbb95e08dc90428
	.xword	0xbbf50bb41ae54821
	.xword	0x27a246ef548cf718
	.xword	0xfe5aa89c10a09d53
	.xword	0x2124dfbc974300c6
	.xword	0x497e18271834615a
	.xword	0xdb273fe0440cbc9b
	.xword	0x601120dffa87b365
	.xword	0x04032552cdf29c06
	.xword	0xd2e38348f8ce18ff
	.xword	0x723acbff0d18ccb3
	.xword	0x7d20b0653b27f8b0
	.xword	0x2dc18a22636473d9
	.xword	0x010ef645b3ff30c4
	.xword	0xb22a5fff49b597a3
	.xword	0xb66824e7294ec670
	.xword	0x6a931e7169a9b792
	.xword	0x809b04c6402f5276
	.xword	0xd9aa10181ed1f57a
	.xword	0x23ec9b4a26fab113
	.xword	0x8853071c489e7121
	.xword	0xd6da00ee43117476
	.xword	0x04723c95189e3972
	.xword	0x2eb846fb766f4413
	.xword	0x7c69c4af00d9d8ef
	.xword	0x040548ce16777cbd
	.xword	0x1a2b64615c692908
	.xword	0x2319450388e31d3d
	.xword	0x71136b164e52a322
	.xword	0x0537040b5edd86e2
	.xword	0x8c57f76634fee3a3
	.xword	0x69dd27ad67db4dc7
	.xword	0x6f24544d26ad05ff
	.xword	0x17f1b60eb3296e90
	.xword	0x21efa88d5fbac7a6
	.xword	0x8026b1e34853f52f
	.xword	0x9a1383d4776ef656
	.xword	0xfefd3b2cbd323a70
	.xword	0x37c438465d77371e
	.xword	0x0062fc22702a2d20
	.xword	0x39d4b22b5616850a
	.xword	0xe377f2747eef855f
	.xword	0xa41c08b45172bac9
	.xword	0xc2cef050564a4eb3
	.xword	0xd87570272da7b9a8
	.xword	0x29d1b7aa828250ab
	.xword	0x6c4146ebc87ac984
	.xword	0xc62a8c67192588c4
	.xword	0xf52ea3dfaf7e6bad
	.xword	0xbfe3e2d9412e696b
	.xword	0x5a9be9f979d3acb6
	.xword	0x0358c48a9ec0a247
	.xword	0x41067b8c590f8915
	.xword	0x263331e64cf81b7f
	.xword	0x83ad63eebc19f29c
	.xword	0x0c7662dc8298133c
	.xword	0x39f5316787319d1b
	.xword	0xf3608a1259b0d160
	.xword	0x082c56d1e4f92e8e
	.xword	0x197af7f2aca58269
	.xword	0x59e879adc65dd15b
	.xword	0xcb4d1eb7b2668c1a
	.xword	0x48c5e3243d552fae
	.xword	0xf9230a646f636495
	.xword	0x1408bea1ae51a4b6
	.xword	0x0a86e8b071c1ebe3
	.xword	0x784ef5b1f4eccab8
	.xword	0x0c0ed489ef5148e2
	.xword	0x9d4bc7e6e4ba8dad
	.xword	0xe8ba42096556dfeb
	.xword	0xbf999bd6bb09b825
	.xword	0x368a93dbcc0f3c38
	.xword	0x654d2acfa4daf58b
	.xword	0xb5085ea09845b402
	.xword	0x17f644b8b60844c3
	.xword	0xb758c68cc7868ded
	.xword	0x0c31d78dd5d1e62f
	.xword	0xe3c320ec9cdd6f42
	.xword	0xb825096cecfa82d4
	.xword	0xebff51609bfe054c
	.xword	0x86d01594eb88d5a2
	.xword	0x6c1874b669dfbd7b
	.xword	0xd43a4519c6fe8334
	.xword	0xeb0a0bc4de1ca96e
	.xword	0x2660ed3488bbce6a
	.xword	0xe07f687c6fdff760
	.xword	0xa1525edf1613cfc4
	.xword	0x50e7082296d3d74c
	.xword	0x5a9ba7d727bfb80c
	.xword	0xf731780dec395087
	.xword	0x4a119206657a53be
	.xword	0xb7ae9b2bd1226f61
	.xword	0x9baef439a5abf460
	.xword	0xfaf931bbdf8d28f4
	.xword	0x0e3964b93fadf9d4
	.xword	0xb217f7f13d368545
	.xword	0x0f9f5c3b86798240
	.xword	0x016507598ff3c921
	.xword	0xae09f3394b46f36a
	.xword	0x10452c6f07843e12
	.xword	0x9047e18ad05f2dfe
	.xword	0x39e38ea2f4d91ec9
	.xword	0xbb4991aa34c53fb7
	.xword	0xe53db7fd829e2de6
	.xword	0xf203535fb39112c9
	.xword	0x28152ad60ac16588
	.xword	0x212840e2d524a122
	.xword	0x540d189f0ab98a4a
	.xword	0x957c7f1794ae4376
	.xword	0xfaa5114038be2a75
	.xword	0x36d38b5a83845b65
	.xword	0x8963e9624bb8fac1
	.xword	0x058a424619cb39ee
	.xword	0x817f42bbf0817e59
	.xword	0xfed843df3debe7f0
	.xword	0xb15b01252c633a20
	.xword	0x797dd575c32dfd21
	.xword	0xc157d1d04926c57b
	.xword	0x01e3a30bf8e93f99
	.xword	0x6faf8c729e306739
	.align 0x4000
	.data
data_start_2:

	.xword	0x9be08cd89e49a1a9
	.xword	0x27de4567ba58feeb
	.xword	0xbe813a287199a39f
	.xword	0x4e48d602a792a5a5
	.xword	0xe5afb41c504d7a88
	.xword	0x807c6d41bacab1ab
	.xword	0xeb1d2523e9238f9e
	.xword	0x2aa6f0b1188b19e2
	.xword	0x82e176fd1674fd00
	.xword	0xdf9e46d193e43f65
	.xword	0x48581c219475952b
	.xword	0xa0e68cc629cee3a1
	.xword	0x1b5fdd9cfd849428
	.xword	0xdd5b535a357d2bf0
	.xword	0x4439ef03512edb4c
	.xword	0x3e64da2d1b49a380
	.xword	0xf1854ae32ad70baf
	.xword	0x8e9993d5b7268130
	.xword	0x07a10a202faa0973
	.xword	0x91c59d58245874e9
	.xword	0x77b8ebc9335abdd6
	.xword	0xa8175790ba76e612
	.xword	0x1dfd54e676b13b18
	.xword	0x675e40915fc3ce01
	.xword	0x3210dec205c8c5bc
	.xword	0x1913328b1f1ba9a9
	.xword	0x2e89857b2c4e988a
	.xword	0x67e9d14d91019a8c
	.xword	0x32b20d153e4559cd
	.xword	0x1bd9f4e4d6facb46
	.xword	0x382fa21474908f18
	.xword	0x69db3a65c65706e8
	.xword	0xb4710420ea4f7bfc
	.xword	0xfb8527e055ab54a5
	.xword	0xd78775e302c3681a
	.xword	0xb7a58a6313a5dc13
	.xword	0x5d2726ace7ef73a5
	.xword	0x411baa149dfd895a
	.xword	0x1b1444516b4966fc
	.xword	0xdddba56417b40a46
	.xword	0x855367cff8f1bfc8
	.xword	0xd3a3b029369f406f
	.xword	0x82327d7f9958970a
	.xword	0x62c78021f71ffb2d
	.xword	0xd53e9165a64aef2f
	.xword	0x025422a1ab58bbfa
	.xword	0x20658893bb5e6c5c
	.xword	0x41a3a186d90e22ca
	.xword	0xf55f659cbd5aa17f
	.xword	0xeb984c86727ada25
	.xword	0x9203fa61e654f5ed
	.xword	0x1d247c20e2f077d2
	.xword	0x16e8da65c870bcab
	.xword	0x1f88154b39306756
	.xword	0x4d21af02d77635a5
	.xword	0x4a68c2491bbd2fa2
	.xword	0x8463c991ed0b5ac8
	.xword	0xe68a9f3ada3d5a3c
	.xword	0x9fa5088d849f7db3
	.xword	0x17df3e672063759f
	.xword	0x9a7eb06f0a675f9f
	.xword	0x5735eeddba228976
	.xword	0xa975916d749abbec
	.xword	0x2c83f74a3ffff511
	.xword	0xbded2acb296edf0a
	.xword	0x92db2ef266a5361e
	.xword	0xd7b82224d8fb856b
	.xword	0x15147f115cbfbcda
	.xword	0xc143616eb8da395d
	.xword	0x728f8a8c16372b2c
	.xword	0x78f39406459e1319
	.xword	0x54e17368d8aebe45
	.xword	0xcd3e28c9c1b23d68
	.xword	0xaf39fe68c8a23375
	.xword	0xa676c02edb900082
	.xword	0xf0d21445b5c24743
	.xword	0x575d57f7872dd7ce
	.xword	0x522992f57dbba824
	.xword	0x818298dfafa4ca36
	.xword	0x7692f1ea83678782
	.xword	0x8fb88e065a2d3ace
	.xword	0xf77bb878e36a76c2
	.xword	0x2e0dbd2f5d960f9e
	.xword	0x04a43431e99ed482
	.xword	0x38d37995aaf6c709
	.xword	0x72c52fe5fa12d728
	.xword	0xc3e06888616235d1
	.xword	0xf699d3bdd96302bf
	.xword	0x6d46dfc71cba460c
	.xword	0xd9e53618a06835ea
	.xword	0xec4abc2fbe2f61c2
	.xword	0x1d9f3d096be9380c
	.xword	0xe2320e492e561e7b
	.xword	0x197b9167a4e16332
	.xword	0x29c859227143812e
	.xword	0x75d735ff83d8db86
	.xword	0x798352fcf1100293
	.xword	0xd42bc86dbbca1de9
	.xword	0xabc2ebafad3078ec
	.xword	0x9118e3569b7e4892
	.xword	0xdf171344f3fdc354
	.xword	0x953ff58bbb7660be
	.xword	0x857456dde3bcc1c1
	.xword	0x3d90a086bfc4b185
	.xword	0xe8afc2555bcf80a9
	.xword	0x7ca4de7ba3931498
	.xword	0x7b661a3b8fcd68a5
	.xword	0x1e069de54e06cb4f
	.xword	0x4af76d675ef17407
	.xword	0xb3f6ae8bb8f688e6
	.xword	0x9ac75f251f0451eb
	.xword	0x4f80922e1bcce0f4
	.xword	0x2309bf97bdc31ed1
	.xword	0xd6bcd4891925f4f0
	.xword	0x793e2d7c6dd607de
	.xword	0xd93162c9000fc3ab
	.xword	0xafdbc97effa1215d
	.xword	0xb1e824ce33585fb3
	.xword	0x362aa2bddbb2ddc4
	.xword	0x01cf28730c7369e0
	.xword	0xe0a23c91fc38c9e6
	.xword	0x01cb8983ee179e7a
	.xword	0x57b9e57dfb0bb3da
	.xword	0xd8cc29018f6337b6
	.xword	0xf813d42b463db969
	.xword	0xb0057c1c20dc2296
	.xword	0xe999b4eb16472102
	.xword	0xa89aad838d64f15e
	.xword	0x268fc449ce68a575
	.xword	0x055bd5a1f84a1de8
	.xword	0xbe34c47e458d2912
	.xword	0x3922a242e625e819
	.xword	0xce4329ceb1131e10
	.xword	0xa28844e0c7860289
	.xword	0x7a99c9ca694a6cba
	.xword	0xe9457f5e85fd4fc9
	.xword	0xe01a21649eab96d3
	.xword	0x640fc01bf1ff39a5
	.xword	0x5dc526c04aa24ecf
	.xword	0x1b5fb44d5c82e0e3
	.xword	0x4586c722765f6d6c
	.xword	0x2bc05dd4c1b8c931
	.xword	0xcad2c6a9d96dc1f0
	.xword	0xf49b7e456e801ae8
	.xword	0xa94673dd739ac074
	.xword	0x65ca30c8d2d5533d
	.xword	0x45f85a2a50077d09
	.xword	0xa6b9e0ed5a0323d1
	.xword	0x3253d5dad41ddadc
	.xword	0xa1937f4c931c1056
	.xword	0x39b15e52ccec6fed
	.xword	0x2d911d48c2bcaa62
	.xword	0x5790d2595251a603
	.xword	0x41b73ba00b9e90a0
	.xword	0x18db800740631558
	.xword	0xe6b031c591f67c45
	.xword	0x836f9c41abeab800
	.xword	0x17361f91099578a9
	.xword	0x2d8d66eb8a81ef54
	.xword	0x86aadfa9159e0cea
	.xword	0x584e73435ed63b7f
	.xword	0xbc9414865f426fec
	.xword	0x9a860db45387dced
	.xword	0xb2f9fadfe66e8d7b
	.xword	0x2d5c9bfc99beb63a
	.xword	0xfa56f0a19fd3d1a0
	.xword	0xe83ee0b242e5ade2
	.xword	0x313c1166ad840add
	.xword	0xd270e90f07370cff
	.xword	0x266989020dc2e8bc
	.xword	0x2f90d39740667bb7
	.xword	0x248ba44f557208cf
	.xword	0xb7985030bc3f0b7e
	.xword	0x250f919e9e3fcd5c
	.xword	0x656ddc26ceaed9db
	.xword	0x9c05f5923f163914
	.xword	0xd94268c290adaee1
	.xword	0xeb6521ddaf083fc2
	.xword	0xcf979eaaabf59bae
	.xword	0xfe0e469413cbad10
	.xword	0x7ab87a6f637bb904
	.xword	0xac823c6c63a1bb5c
	.xword	0x17854c448f0d5e48
	.xword	0x8b83efd6104fecae
	.xword	0x16e2a8ba7f22b045
	.xword	0x8f7c5c71d414c1e9
	.xword	0x988cf3bd50700176
	.xword	0x5cbc71dc294f3985
	.xword	0x26e32b903cf3bf73
	.xword	0x53b21d6dcd1d42bc
	.xword	0xcd4dd610fa31db39
	.xword	0x4148c078d67a9eb8
	.xword	0x3e3aba9e9f065162
	.xword	0xb96c321aadd41472
	.xword	0xbd1c4e829e1db93d
	.xword	0x7d1458d2e68f8ae8
	.xword	0x54dcdcae6f26aa7b
	.xword	0xaa6e86612eca8fcc
	.xword	0xf0134792b9f02c11
	.xword	0x9eabffbff7a80d90
	.xword	0x196643165f8a4b60
	.xword	0xde9cf3d98b661b7c
	.xword	0x9f5eb55b5751b81c
	.xword	0x8c648c3e4096837a
	.xword	0x5bcac0ba65cf1d6e
	.xword	0xd4f905133d55f756
	.xword	0xcb188e96b3aeed36
	.xword	0xa5952597a7fd0b44
	.xword	0xe1d5442967b82e1c
	.xword	0x81f7a41ea37517e1
	.xword	0xbef5bdddd5a82f24
	.xword	0x08fe2a1a57ef8b45
	.xword	0x987b44cde49786e4
	.xword	0x520edec084ef0c4b
	.xword	0x2a1c116cff56456c
	.xword	0x63afa63c5b2e95a0
	.xword	0x509a35696073fb66
	.xword	0x2f99b245c262b18d
	.xword	0x08de3c61b6c67daa
	.xword	0x54b83cdb4208a324
	.xword	0x8644aaec06db2fe3
	.xword	0xd84a6fbdecd7c370
	.xword	0xbaa6b8b288281ac8
	.xword	0x873339afcb5d5ab0
	.xword	0xd255b9f2a6e626cf
	.xword	0x6ab973d31ed5fc11
	.xword	0x0ae3e723c45ee80a
	.xword	0x0a6cef39a208309d
	.xword	0x74e8725d258a2af8
	.xword	0x6b04ebcf66ec3ddb
	.xword	0xd600e0d9760e99d4
	.xword	0xc91bdf73847092bf
	.xword	0x35ddb006e0e31f70
	.xword	0xd626f87d08cab331
	.xword	0x323da149c62f6a16
	.xword	0x5fa9182e67848ffd
	.xword	0xfa76304d20b6ec48
	.xword	0xd07f4972b5312eb6
	.xword	0x9abbf8cb3ba2555c
	.xword	0x5135948f6692b09a
	.xword	0xb0813e355ae0044e
	.xword	0x9375baf437828aa2
	.xword	0x36facc7feb086249
	.xword	0x616128613c1310a9
	.xword	0xb532c969fb922eca
	.xword	0x51e3126aa859268c
	.xword	0x55f18007377da71d
	.xword	0xa031c87bc3377306
	.xword	0xb382b1174ec71a61
	.xword	0x7db669d5f5aaac50
	.xword	0xaec6ccd464621d4d
	.xword	0x876df8175daaa6d8
	.xword	0x89e803e543cf0a70
	.xword	0x4dd79c09bcd3b594
	.xword	0x7151d5fcddeac63d
	.xword	0x40463c41f71b806f
	.align 0x8000
	.data
data_start_3:

	.xword	0x226071078f678874
	.xword	0x070f8f84a48ef51e
	.xword	0x13a6cb96ec5c1253
	.xword	0x5071b74e1f1b2914
	.xword	0x0f4575042d3d742d
	.xword	0xe855b3d2f4186152
	.xword	0x2bfffc2a71de4c9c
	.xword	0x8dbcb7e50c9c6baa
	.xword	0x38d73f1176c22ae2
	.xword	0x755a1a83a15b7150
	.xword	0x944cc86c3a4a9f43
	.xword	0x5ac6024b790205b3
	.xword	0xfaf52d8d10d69916
	.xword	0x56609b6f5b933491
	.xword	0x3490c5ea56de9a64
	.xword	0xba5e78c0826b8014
	.xword	0x150278547fc6d80d
	.xword	0x1922e5d1e43c3385
	.xword	0x0d369a135a7640c3
	.xword	0x53cb11459f4f077f
	.xword	0xe390ed2471f1b23d
	.xword	0x8119030b4582479f
	.xword	0x098ee4c74ebe9db7
	.xword	0xa3bbc6dfa1e504fc
	.xword	0x7426d5dae8c9d97d
	.xword	0xca77c99168aa681c
	.xword	0x73f01c3f76102f76
	.xword	0x3cf66452bd9eb045
	.xword	0xeb8234ac7b1ae087
	.xword	0x5b82407fbc7b7b8a
	.xword	0x46eea5b968430c58
	.xword	0xa8e053d453501bc5
	.xword	0x2348cb20e6b03a36
	.xword	0xe33689d2854972f6
	.xword	0x5400a06f064ddcb4
	.xword	0xb19094b071003b10
	.xword	0xd57d95f998c0f6fa
	.xword	0x6007280164e18b22
	.xword	0x4ee4ac9ecb8fdb2c
	.xword	0xd6f9b69cac3fd771
	.xword	0x977bed69554c9448
	.xword	0x0734e580df067ad6
	.xword	0xcae4445785cd2cfd
	.xword	0xfefa27cab551f811
	.xword	0x5a47b8f590539b38
	.xword	0x36e6212743a21030
	.xword	0x371c4b15ea648461
	.xword	0x2c17782e36672bf9
	.xword	0xd58db5ca90159b1f
	.xword	0xa69f4ca9b2db8407
	.xword	0x2623e55e9327be75
	.xword	0xd509157b7dc59d50
	.xword	0x1de277014904c737
	.xword	0xad91336040c3b214
	.xword	0xe358a80d0e29b74d
	.xword	0x8e9620363d8dd342
	.xword	0xa49e4b9edb96d6c3
	.xword	0x5f171dd631855f80
	.xword	0x38615b2e43638f2c
	.xword	0xe7b70e30b57e7712
	.xword	0x534e9031ce5d3b12
	.xword	0xb9d350c348c980e8
	.xword	0x7f1d140a8ebf4024
	.xword	0x3600a1b4b66198d7
	.xword	0xfb9738bb4e138799
	.xword	0x562c31792788fdd8
	.xword	0xd75f81b4bad4af83
	.xword	0xacf619321ff861ae
	.xword	0x76f5262307185a48
	.xword	0x8c20efacea718804
	.xword	0x14cddd4b427b1c9d
	.xword	0xa46c75ba6200a661
	.xword	0x0adf5f5cbb9ab1b1
	.xword	0xfb2ee3e727575314
	.xword	0xc5bbbe66ba2952b8
	.xword	0x2545bf5ab8529ecc
	.xword	0x5d8bcfa5ba6d4e76
	.xword	0xec385993c934830f
	.xword	0x20a95f758b5df97a
	.xword	0x984320f22468e6fa
	.xword	0x607b6720c4cd94ed
	.xword	0x82f5ca8ca14bb20d
	.xword	0xe2e8455c875329ef
	.xword	0xcf0eb2a72187d8f9
	.xword	0xa9358055ee99963f
	.xword	0xe906b046404ef7da
	.xword	0x70dfa31b34685f54
	.xword	0x8263c99828b756d3
	.xword	0x4046977035de7c74
	.xword	0xfd8f1192825215d0
	.xword	0x3bfee0d04d475db4
	.xword	0x71f6f308fad3e0cd
	.xword	0xc6024d8f6459fa94
	.xword	0x60497e9b110d7156
	.xword	0xbc761e0872e138c6
	.xword	0x9810e29b7c7764a0
	.xword	0xcb8e5b738b47eaf2
	.xword	0xf853d09b3750a31a
	.xword	0x0bad2f8878d559f9
	.xword	0x8d9a51725f42126c
	.xword	0x6ae3a32011172ba3
	.xword	0x6f5a1f5b4370ccf9
	.xword	0x17064d502755e28f
	.xword	0x6509b123a439ce95
	.xword	0xc774ec9e72b503fd
	.xword	0xd52bbf8133497b2c
	.xword	0x5942676f04b87199
	.xword	0x9a97076e630e4de5
	.xword	0x6fb24fdacc18f0d2
	.xword	0xb5b942aca28f4df7
	.xword	0xa7b27050f3d6311e
	.xword	0x5e36b37d02001611
	.xword	0x0d631c5817f90a9b
	.xword	0x36a61914408bbafc
	.xword	0x167e5533857ba7c8
	.xword	0x41be9e15320893b8
	.xword	0xf48d6266c9af7ea2
	.xword	0x563cb3450886d9ac
	.xword	0x810db2a24cdd07b9
	.xword	0xc5edc1a2f8d282ea
	.xword	0x299b13e2a402b0bb
	.xword	0x7cfcbc176dfc7e62
	.xword	0x5f0911cafa2a980c
	.xword	0x0159c2adc20b105d
	.xword	0x0ebf69b20c208fc3
	.xword	0xd5e90d7f6388f7d6
	.xword	0xedee6d1a1fc5a42d
	.xword	0xd769ea984a42d52d
	.xword	0x087880dfb2dee154
	.xword	0x249e0a23f450baec
	.xword	0xea64cfa0309cf5bd
	.xword	0x80f0152d9548a51c
	.xword	0x09a992e68e1053a0
	.xword	0x97e909630c19289a
	.xword	0xbc97a8cf3ebf64a1
	.xword	0x3a93e228fbdad2e3
	.xword	0xde0c674e5b8eb285
	.xword	0x14ed7543cc541243
	.xword	0x8fb51de3dcb3d474
	.xword	0xeb0eea4acb782b80
	.xword	0xc204c57d6d8b90eb
	.xword	0x0b9a1060ac8ee8c0
	.xword	0x76e806dd87d83cbf
	.xword	0xad21daf44514361f
	.xword	0x6b6d6219292c9791
	.xword	0x57f190fe5673e3f3
	.xword	0x92bcd7e0f16ae667
	.xword	0xc4fa250633df4c01
	.xword	0xbbf48b5338adf9fa
	.xword	0xe2fe6f8aae71a1fb
	.xword	0xd5428052d7d946da
	.xword	0xee37540c6b1bff58
	.xword	0xdcfb48659d25784d
	.xword	0x106d2fdb509b65e4
	.xword	0xde25fbf4e6ae6a1a
	.xword	0x9a4db3a3244fba8a
	.xword	0xaa465b8e99d582ab
	.xword	0x97bb0fea06c07665
	.xword	0xc6e8137e8eb67433
	.xword	0x9b08465ded9c5e23
	.xword	0x977fb6fb1ec35877
	.xword	0x4c18e81f1cd855d6
	.xword	0xf6564e48f4d44f2d
	.xword	0x68806b31c2804322
	.xword	0xc744a4fa3df61863
	.xword	0x76664fa95d94f92b
	.xword	0xaff7aeea407e2f7f
	.xword	0x689abed7286e1eea
	.xword	0x8cfdadee2b7dbb9c
	.xword	0x57fce612cade239e
	.xword	0xd207f3ab007df669
	.xword	0xb7055df4f99ce2c9
	.xword	0x6f845b3b32251456
	.xword	0x5bcde6f95eca7cf9
	.xword	0xbd21154bb4cb8641
	.xword	0x4a075a08ef924d57
	.xword	0x5c30450ba0c29633
	.xword	0x6abec6a8c33078b2
	.xword	0x2dff23e65dcaa5df
	.xword	0xb676e6af310a03ef
	.xword	0x29eb78907afef257
	.xword	0x359d6968c69d455a
	.xword	0x9a6cf802ecfd3973
	.xword	0x99867a2686b4325a
	.xword	0xb1212b6442328e50
	.xword	0x51185c29a6113f5d
	.xword	0xff226e80ace32013
	.xword	0xf4874d744b271425
	.xword	0x627e19ca064f1152
	.xword	0xc9d61b8c0d442a03
	.xword	0x07329b9e88dc4ef5
	.xword	0x8ba5b3369efff3de
	.xword	0x571b29c9001547e9
	.xword	0x1b38413765ddf835
	.xword	0x309e45b40fc0f926
	.xword	0xbeeca60446eb61eb
	.xword	0x4e2d0a2ffaae686c
	.xword	0x4fdcd4f042fd9456
	.xword	0x09ad2c6d2926c48d
	.xword	0x6d49d6bebf3dac73
	.xword	0x71139f18c0699bbc
	.xword	0xc710d4e7ffadcfe1
	.xword	0x9332ca838a7998ea
	.xword	0x91cab65f5a57f0a0
	.xword	0x756f40c7a43220a3
	.xword	0x6541f17330e8310d
	.xword	0x24cc45dad212760d
	.xword	0x349ff7dd741088da
	.xword	0x350e35188f2d4e17
	.xword	0xd95367f0405f1b25
	.xword	0x01685ce9b30ef3e1
	.xword	0x3d451463c4da0124
	.xword	0xc560f5fce81faae9
	.xword	0xaaf8e7d8df0112e5
	.xword	0xbd9d747f024de7c0
	.xword	0x9477a554cf9a662a
	.xword	0x533f36bd92845b60
	.xword	0x9a53a7a6e8605815
	.xword	0x510323f727c71d0d
	.xword	0x6473052c42e3b98f
	.xword	0x950cd8c94fcea600
	.xword	0xcab4e65bfb8eb97a
	.xword	0xd78934cf5807ec95
	.xword	0x2799c5e128b7e623
	.xword	0xb368b175e384d578
	.xword	0xe864c8f0be2d332c
	.xword	0xba1e93ac0d540c0d
	.xword	0x45f2f19096c90213
	.xword	0x6304727d22e37935
	.xword	0x05c124dee9013016
	.xword	0x96fe996fb3c7b176
	.xword	0x9faeeec1662b2731
	.xword	0x40cea98331dbf14f
	.xword	0xd7937c3692e55846
	.xword	0x7cacc443d81b87b3
	.xword	0xf140a0abd758c7ff
	.xword	0x2dea3befc1e4350b
	.xword	0x38e47041839710c0
	.xword	0x358d9b12023577dd
	.xword	0xcd88c252b5bbcea8
	.xword	0xa700437692a92dce
	.xword	0x0c3e08150bb65ffa
	.xword	0x7b22a95d5d45b196
	.xword	0x443142e5b4cd1da7
	.xword	0xc9de644646c35f5b
	.xword	0x625de40237223ef0
	.xword	0xfa722333dab99831
	.xword	0x8b7cb90c0c233073
	.xword	0x9694ed65de1c6128
	.xword	0x3b15aeb490eab762
	.xword	0x4a65de37c7c67731
	.xword	0x80b5e8e0206771b7
	.xword	0x64b67c1bb5b76a0f
	.xword	0x617de31a3cf46ae6
	.xword	0x3aa32a6e4ffae73e
	.xword	0x5b1a6fafab7db4bc
	.align 0x10000
	.data
data_start_4:

	.xword	0xf30e6daa75e84710
	.xword	0xe3a565d53099a29e
	.xword	0x2370652d29bf42c1
	.xword	0xf1c9c33a77db7579
	.xword	0xdeeeb26de808c86b
	.xword	0x22602e7e4593f3e5
	.xword	0xfd2a13674ec0ac5d
	.xword	0xec9397ca75309b06
	.xword	0x686dc076a50bc11e
	.xword	0xf6f349d6cb415df5
	.xword	0xb882e0598d4655b7
	.xword	0x565d90d2717c354b
	.xword	0xbcbda003c695b1cb
	.xword	0xb4863525e1b1ed28
	.xword	0xdd267e2560b681ad
	.xword	0x511b9e940770e1e0
	.xword	0xa53068021bf9baf4
	.xword	0x60658df142240383
	.xword	0xf7470571933d2c79
	.xword	0x62bb4a2dc3a96a9b
	.xword	0xfb198a597c0b6160
	.xword	0x272e13e8b635087d
	.xword	0x6d81ea7a0f6828ed
	.xword	0xbde277009031e99a
	.xword	0x0f747759d5b90357
	.xword	0x5de0dedea25d4c82
	.xword	0x2f7870931b0c605a
	.xword	0xd1a3a7146bb9d120
	.xword	0x8a6fed33fe7f5ef1
	.xword	0x56e7b054488d8252
	.xword	0x38b993ce7cb6331d
	.xword	0x8cf9989ef442347d
	.xword	0x78c6cabd5e7e12d8
	.xword	0x5a3a1545916e0658
	.xword	0xe2838e79345f15f7
	.xword	0x4de5773667381f27
	.xword	0x5307a43d0dee9494
	.xword	0x1f8adf085308571a
	.xword	0xdc78d6103dd96b0a
	.xword	0xb70661244c240e5c
	.xword	0xaeaae9535511e388
	.xword	0x7131c9be5f210032
	.xword	0xd0646148c35546db
	.xword	0x1079a4d381a0c8e1
	.xword	0x413e630fcd9a63c4
	.xword	0x264f35df15fe6c8d
	.xword	0x39003cf593c29353
	.xword	0x962612d74f05a084
	.xword	0xf97cba36bb49ad50
	.xword	0x064e1b1da6087de2
	.xword	0x3ed56f4f9696cad1
	.xword	0x1974cf9e8e786525
	.xword	0xb774a630d24c4374
	.xword	0x0f15bdbf6cb6c3c3
	.xword	0x91916a5e513c6bd2
	.xword	0x6fa8b5400dc0cc97
	.xword	0x5491e02d5bd742ae
	.xword	0x811cc9b2a5927980
	.xword	0x8ee071d0f23a43b5
	.xword	0xa53b3b8f7fec104d
	.xword	0x02f05a763f33e814
	.xword	0xf12cfb9d151c1d81
	.xword	0xa0f58d7e28e32b5e
	.xword	0x3c7e5d0f91984725
	.xword	0x68da5ad7f5b63f77
	.xword	0x8adcbf0ddb511b87
	.xword	0xf38a579c6c66ac26
	.xword	0x8d4f22b50b2e64b9
	.xword	0x5eab28fe56ae6c6b
	.xword	0x719573c39b3a4cf5
	.xword	0xdd0dd50a3ea9e196
	.xword	0x58a14642a7681fb4
	.xword	0xf7820917c660b684
	.xword	0x1d28980afc9c6eaf
	.xword	0x970e6f2692ec2279
	.xword	0x394c9e376696fadf
	.xword	0xf33e542c94b93740
	.xword	0xc550bfb6d609955e
	.xword	0x2771c20cc5fa8616
	.xword	0x4fc8cb5b44a8da26
	.xword	0x0966c42ab162d008
	.xword	0x2a9f2d423b5a6409
	.xword	0x7ffad508526b8e84
	.xword	0xf9b56d02cafd4fa0
	.xword	0x02d3a71d017c5c38
	.xword	0xd3faebb6b1b9ffc5
	.xword	0x691b9a8fbe672810
	.xword	0x89c04ae46cb624c0
	.xword	0x85bc53969bf7ffc6
	.xword	0xd086d8ff8411661a
	.xword	0xca80c68a9306cbec
	.xword	0x92d89f34a35f2d9c
	.xword	0x652c4b022310bcbd
	.xword	0xf0dabb80247f7d85
	.xword	0xce35668127edc91e
	.xword	0x9ac274599d731152
	.xword	0x03aa9528e06b571a
	.xword	0xb257703dd8389e76
	.xword	0xa7085d339c34d14d
	.xword	0x80f62f64b3e070b7
	.xword	0x23aa7d97fe18d029
	.xword	0x81ae7e18a6d8cfb9
	.xword	0x2a78e1210a3b4638
	.xword	0x21db405fe4cb50be
	.xword	0x7c0fea87c475a0e2
	.xword	0x8fc71a5938017176
	.xword	0x53afc6aa25cc87e5
	.xword	0x9b6ea5130f6ef533
	.xword	0x31daff6f976212e7
	.xword	0xa43b9e7e12efd2e5
	.xword	0x89bba21051676162
	.xword	0x5f78ec9964fc0492
	.xword	0x4dc447cc5d3e3121
	.xword	0x614fb872cb5ed321
	.xword	0x44a83baede70bf10
	.xword	0x80ac0c9c44f7208b
	.xword	0x2969e7f5937966de
	.xword	0x4a2a3448388bd406
	.xword	0x526feaa3ce7f63e8
	.xword	0x3d18fecae744f644
	.xword	0xd0cfe7442324b980
	.xword	0xd9738a305bdeb623
	.xword	0x91259d6f7abe8768
	.xword	0x16d8abac728eabb9
	.xword	0x7aa50d8cf8f10690
	.xword	0x08f30b632b4ee9a9
	.xword	0x3217cf88c4e97722
	.xword	0x5f2b50caab7c0c76
	.xword	0x4cda2bd2cbd0ed89
	.xword	0xaee357c9dd924763
	.xword	0x873fd58f8eff2d63
	.xword	0xabf5bf24b196bf37
	.xword	0xc888a9e75de0d1f7
	.xword	0x8f1a8674432a0a9c
	.xword	0xca7424ce7c8246d5
	.xword	0x28554a229ac8e1df
	.xword	0x1921f38a7fa7d2ea
	.xword	0x7a6b51d97a057d8d
	.xword	0xf2ed079bdd7a2852
	.xword	0xa4d39afae7885689
	.xword	0xa2dcae780f5781db
	.xword	0x96cfe4cf6b67b0b2
	.xword	0x006b6e1001565234
	.xword	0x9b7847b42725dfad
	.xword	0x333d83801d326392
	.xword	0xc098ff0ce1c7c1ea
	.xword	0x4989bcb4baabea3b
	.xword	0xe2298a2668b8ea32
	.xword	0xb450c8a0de5f959d
	.xword	0x3a8a7cfe6c9d900f
	.xword	0x4a0c95e5b0ae2a02
	.xword	0xe12df1d509437f6a
	.xword	0xc66c6602fa8ae515
	.xword	0xad40b91633f7e7a0
	.xword	0x37a5d4a408c141ed
	.xword	0xac6167a03c6b0b2c
	.xword	0xb4cb1860f31b935a
	.xword	0xfc13450b23050f2f
	.xword	0x71e4e809991afebe
	.xword	0x4f40d107e13f3937
	.xword	0xc8070a8b69bccab3
	.xword	0x26942da0cb36c8a8
	.xword	0x068dc81ca350d884
	.xword	0xcb5bf201fe271a50
	.xword	0x2a1953845614219e
	.xword	0x1236345622f6d947
	.xword	0x56efd2e53ef6b3a4
	.xword	0x76dcc14394166f33
	.xword	0x41cc047f0d1974b7
	.xword	0xf3cd5efdad2ddefe
	.xword	0x9f9fb20d49cd5ef1
	.xword	0xe93c15323e6b11e0
	.xword	0xbda948ed736ade70
	.xword	0x01696671af49ff63
	.xword	0xeadb3a906d5ca9ec
	.xword	0x323bec1857188907
	.xword	0xd474a35aa116da91
	.xword	0x9efa405453157191
	.xword	0x320e15d5c12c4b43
	.xword	0x9fa677bed44748c2
	.xword	0x77bc4eb9624321a2
	.xword	0x5557707a465300ca
	.xword	0x7156bb93c6d25b3e
	.xword	0x6a0717e6773939b1
	.xword	0x6ca24c4ecfa68d28
	.xword	0xd06ca86c58f4edb3
	.xword	0x17399eeb88acb523
	.xword	0xb94376735dc2df85
	.xword	0xde2ac9b002bb5098
	.xword	0x19025c7ecb7cb7a0
	.xword	0x215e055905201005
	.xword	0x61fc0dabc4f72b9f
	.xword	0xeb751961fe39ce3d
	.xword	0x320bbc33d24b8bad
	.xword	0x2394c438bb4f0a35
	.xword	0x26c331561260d44b
	.xword	0xfac49ef99c67ce35
	.xword	0xc48866e634b95939
	.xword	0x91da5c65f2b8def2
	.xword	0x7ee0d85490f9910d
	.xword	0x53becf6497deaa0d
	.xword	0xf22bc689f475457a
	.xword	0xeee35735391e0230
	.xword	0xce13d77c21b79537
	.xword	0x78962eb74024a340
	.xword	0x76f8edbd75b7fa5a
	.xword	0x520bfa68725bcbeb
	.xword	0x372c5586a5a8b1de
	.xword	0x0550e8d83360a294
	.xword	0xc43953c7f190ce78
	.xword	0x3e0a7639ae9f1129
	.xword	0x095505b148795b86
	.xword	0xc7f6b95f3b3566df
	.xword	0x8beaf8bcf65cacf6
	.xword	0x55e1206cc8762cb0
	.xword	0x0343873342b4e737
	.xword	0xdc106a10a22f3077
	.xword	0x450fe7ce21791039
	.xword	0x685aad811ea4bcd8
	.xword	0xd43e793f2a2a3a85
	.xword	0x79cf4a7cd0edbb11
	.xword	0xee69fa5e46bd3720
	.xword	0x7f7b43ea6c6470b9
	.xword	0x59a16b780a1d9178
	.xword	0x0f49e2bb860d362f
	.xword	0x3dc86c776820825e
	.xword	0xaf7cf318333ac98b
	.xword	0x6082ca45b2c256a2
	.xword	0x832ccbc11fa30243
	.xword	0x3561c50650328e74
	.xword	0xc09d74aa9e55cfe1
	.xword	0xbd9880ae99dc984f
	.xword	0xefecf681ca10fc12
	.xword	0xd21c8d6e407d336f
	.xword	0x14198de5181bca82
	.xword	0xb06ef65e722ee498
	.xword	0xc03fdef0cc2a581e
	.xword	0x4db90483b62930c4
	.xword	0xe9aed5396fb898fd
	.xword	0x17086ef45b33f36f
	.xword	0x1b9c96af323e23de
	.xword	0x79bae786a81d2bf7
	.xword	0xaeaaac6b27a47022
	.xword	0x44fd937f2a326fa5
	.xword	0x4021beff7c195dcd
	.xword	0x91323100bdaa708b
	.xword	0x33152e623d942be5
	.xword	0x37a4438d152d0911
	.xword	0xd7bf2e14682dc1c4
	.xword	0x8ac80ec11a13b2f6
	.xword	0x06171bfcbc854b87
	.xword	0x1c33999029dfe0de
	.xword	0xc19874f7056ce790
	.xword	0x968f685f11e1eedd
	.xword	0xf653055e004a8e31
	.xword	0x3871157beca06c14
	.align 0x20000
	.data
data_start_5:

	.xword	0xe10c9c22c1aa9a06
	.xword	0xb7431dc1db6778a9
	.xword	0x18fbcce1da3d91fc
	.xword	0x700c8f4517174839
	.xword	0xe29fdc91de7cb2b0
	.xword	0xf684d851ae5a06d2
	.xword	0x4654ab20cb5d40e7
	.xword	0xf464cc52cd96bef4
	.xword	0x9d8f815921a50d44
	.xword	0xb00832e903d5d265
	.xword	0x8ea1f48bab9783c8
	.xword	0xe141ab874aa1f44e
	.xword	0x9f78c8cca0be1c3b
	.xword	0xb61cbc2d70c566fb
	.xword	0xcc663080f6ffd66f
	.xword	0x6c67eb82901b0322
	.xword	0x9ca5121d1bec2b15
	.xword	0x87ab69883931930e
	.xword	0xe1a6a8fcc499decf
	.xword	0x0117645b237032f8
	.xword	0x4002f2db43071359
	.xword	0x529bd1281bcf7b89
	.xword	0xb5e22e27567affd8
	.xword	0x628e6a3809697df0
	.xword	0xed035b5640155997
	.xword	0xf992200993e6421b
	.xword	0x7a1385695da8e3d3
	.xword	0xccd188ad824a6e47
	.xword	0x62f1af4c973ae3c6
	.xword	0x321056489ab6035a
	.xword	0xe83bbd18c0af433b
	.xword	0x73cb18bb088a1b6a
	.xword	0xb901b7b716f46a14
	.xword	0xe4c87cb76fcb90b8
	.xword	0xc7bd5597cbd327e9
	.xword	0x3c6328f7099df488
	.xword	0xee53d2710057b47f
	.xword	0x088f2fcf554fdf01
	.xword	0x43b4caedcc889939
	.xword	0x7b73630224a5587f
	.xword	0x13546c801bbc0f95
	.xword	0x69266207f89c34f4
	.xword	0xaf58117750d60d64
	.xword	0x99089d50da606f9f
	.xword	0xa4f5e1c231d4fe02
	.xword	0xd4907147625e42f9
	.xword	0xa99cb4839858d11e
	.xword	0x2a231b88f812366b
	.xword	0xf5320192ef8c442a
	.xword	0x4fc37b46be90d983
	.xword	0x014907ead7dc8716
	.xword	0xdffe94265566a200
	.xword	0x471c79ba3670e874
	.xword	0x36a9603a77010b83
	.xword	0x88aa5beabbf71f58
	.xword	0x2d8a0dda78f541e8
	.xword	0x7247765723c11e5a
	.xword	0xaede640692f2b756
	.xword	0x2cbcfcae1cfcb654
	.xword	0xd69396adf449837c
	.xword	0xed08ea9a11a76d25
	.xword	0x575cca792aba5fa7
	.xword	0x022eedb7a3f61213
	.xword	0x1881b0a1f6f5bd51
	.xword	0xf5f4e08a67dbd6fd
	.xword	0x9447f6b29586a0a9
	.xword	0x7d84778a27b03a67
	.xword	0x37143561ab23eb11
	.xword	0xb05f6342d8a32d64
	.xword	0x45a4810d5875f394
	.xword	0x8f8a57d9df06a337
	.xword	0xdc109a871b804f92
	.xword	0x12d8f0dfee523ca4
	.xword	0x8fd54c5b57fd28db
	.xword	0x4c2df40d3e642028
	.xword	0x39ef3cc266e5159f
	.xword	0xc7996a4a3a9be952
	.xword	0xdc5ab48305251fa3
	.xword	0xd81a658721139d92
	.xword	0xce461f0eb3349416
	.xword	0xc44fbd62af16ff95
	.xword	0x4c5a0fddc9976889
	.xword	0x8460147977a0008f
	.xword	0x55af4a8ecdb4d6e0
	.xword	0x228d9397eb8a5d58
	.xword	0x59353defb2b36782
	.xword	0x771f8640eccf49ad
	.xword	0xbe0bfb2f6bdf635e
	.xword	0x5c0575985ef65419
	.xword	0xc63d397e9236523d
	.xword	0x37365462ee9f5330
	.xword	0x3c54bd97d9a44445
	.xword	0x5d580e1926837e9e
	.xword	0x639eca1750aa34c8
	.xword	0x67f8a8742c2bff29
	.xword	0x926d241f7cab7a6b
	.xword	0x1052cb848c046155
	.xword	0x976dae9f1f1a2073
	.xword	0x4fe85a42d8ff4cd6
	.xword	0xb59137771e97ab80
	.xword	0x953b21b2d061b0a6
	.xword	0x5096f425a70a35de
	.xword	0xaf1bc0682705ff41
	.xword	0x5ef4f9144d9c6052
	.xword	0xdbbe58d680d28bee
	.xword	0x91a5b5100378ca41
	.xword	0xcc6295dc186675a7
	.xword	0x4eb4017641b21f96
	.xword	0xa579cb86eb22e262
	.xword	0xa28080ff95e3755b
	.xword	0x6ce107762d71f23d
	.xword	0xdbd7418118992eb3
	.xword	0xb80b14978f2060fc
	.xword	0xdfad2dd8a2ce6da8
	.xword	0x3feac59da69db1a2
	.xword	0x4006cb6b6bef8bbe
	.xword	0x54f86d4e50ac6f12
	.xword	0xe16eb79db8da4e60
	.xword	0xbc8704014bed42fa
	.xword	0x886fa39be1edfd2d
	.xword	0xba950dd5a3e7e9f1
	.xword	0x1b485c4db20038aa
	.xword	0x1560f425f8f3764c
	.xword	0x9e56405750e0e29a
	.xword	0xce39da4e17737072
	.xword	0x1e871f67188543a5
	.xword	0x29977bd54a2f0943
	.xword	0x8f10161e0c5fe7c0
	.xword	0x90fc1d02d340c90d
	.xword	0xc2d167935111dbd8
	.xword	0xfc7fb2ac8bf033cd
	.xword	0x42c5dc7e841ffcaa
	.xword	0xc792ad8d90687159
	.xword	0xa8f9383ceea3030f
	.xword	0x401f791fcbf002ff
	.xword	0xb3c55150187ef2ca
	.xword	0x6b7793d377182ce1
	.xword	0x3715943c081f53ba
	.xword	0xe25b346e8c59a059
	.xword	0x10297eb64383a595
	.xword	0x5aa1ed677079f9ad
	.xword	0xa13ac8ad274bc201
	.xword	0xf820d7256213ef23
	.xword	0x0e655a47519ba1f9
	.xword	0x4ac85996e9f7d56d
	.xword	0x9f3494c7905bec0f
	.xword	0x8ab6f5d5cb01bb5f
	.xword	0xc968b7ba7518622a
	.xword	0xab11fb6edddd2bca
	.xword	0x32bb93242ce4f4e9
	.xword	0xd1a286080da797e0
	.xword	0x901a562d82874f1e
	.xword	0x2b85f55343d64c5b
	.xword	0x63d4088090eff052
	.xword	0xe321abf94dc42f28
	.xword	0xc35ac5cb67950912
	.xword	0x06020fb348744bb1
	.xword	0x2202eb8332b30d5d
	.xword	0x5de2d49135103b7d
	.xword	0x69eba2d64a82fe30
	.xword	0xfc8d54691d1b24f2
	.xword	0xe8bda33bb3ca6239
	.xword	0x588b1f76032c9b0a
	.xword	0x38947fe13121930b
	.xword	0x13be10b46ac3975a
	.xword	0x3d7618a2af9b4d61
	.xword	0xf1a30bd3ba4e576c
	.xword	0xdbef764cc1c41bd2
	.xword	0x8c798489814c81c9
	.xword	0x894e2b928466b601
	.xword	0x37311b747892f216
	.xword	0x96f2cada45d497b6
	.xword	0x2285374cc29c38a0
	.xword	0xa2a3eb5bda421c9a
	.xword	0x09555a1f5c0fe957
	.xword	0xccbab8177ac7dc33
	.xword	0x2dca4b4d97e0fd6d
	.xword	0x1737967be05803a1
	.xword	0xacde36c884c99b78
	.xword	0xfc430449e56dc305
	.xword	0x226acc0cce1c8f31
	.xword	0xff9c2ead27f37118
	.xword	0xd0b23c94d36e74a3
	.xword	0x0b92b3b5ce320af4
	.xword	0x1f4842436facb729
	.xword	0x71b97d897b513a04
	.xword	0xeb262772c87d2e0d
	.xword	0x9690e8294f00ceb7
	.xword	0x660f0ff31cd09a7c
	.xword	0x687a224e62447e48
	.xword	0x6c18887267ccb2d9
	.xword	0x7abf57501631c182
	.xword	0x161f0352b13436c2
	.xword	0xa0983f3e4a6c1615
	.xword	0x992257e1df448d7b
	.xword	0x55449334e7a8b4bd
	.xword	0xf8eb06a51b151c6f
	.xword	0x1c6d934f7b57d230
	.xword	0x522a09223d7fd028
	.xword	0x2ab2819d1fcdd20f
	.xword	0xd7526f50f2954774
	.xword	0xbfc116ca950aacd7
	.xword	0x3e2f3d24cc23ced7
	.xword	0x94a3bc679acfbefa
	.xword	0xd1ba3355498e6062
	.xword	0x4105734549affbd2
	.xword	0x4907fa48882f78e8
	.xword	0x85b7475ee73ec920
	.xword	0x64d72ecf3b98d3bb
	.xword	0x0c77a53e87e5e6d4
	.xword	0x49055848e2c3a25b
	.xword	0x3fde6b460ac910e6
	.xword	0xb6f0cc9b7d727031
	.xword	0x31f70911cda17b60
	.xword	0x1c19b1152d68c0cc
	.xword	0x7f2e7e6175d0ffbc
	.xword	0x598e7f671b6a98dd
	.xword	0x398cdb9705969c53
	.xword	0xf854338515349351
	.xword	0x8d8c3fb9303be59e
	.xword	0xd30fa0af95cc1ad4
	.xword	0x01ff058480ec1e6e
	.xword	0xe4df2c221c950866
	.xword	0x3214f84f24fdcf93
	.xword	0x20b1d501fee6f470
	.xword	0xdf801a7c58867f56
	.xword	0x66ef531658ee397c
	.xword	0x2e44eec99a14ad8c
	.xword	0xbf37c1441e15dd58
	.xword	0xff5361567fc3e38e
	.xword	0x6df402b19c3184b8
	.xword	0xa63fd124ec6685ed
	.xword	0x8e540ffa71a5f79a
	.xword	0x5656280e551a2833
	.xword	0x1c876345ef2d28dd
	.xword	0x87db78b723b4d773
	.xword	0x5394ef08645f3ade
	.xword	0xbd9c6a79799a3f31
	.xword	0x231396ead256a460
	.xword	0xc6b06f4d98fb7f38
	.xword	0x463b00d49ffd2b65
	.xword	0x79bb28659091bd76
	.xword	0xa11f4906d4e00e37
	.xword	0x523b8e15d584db3d
	.xword	0x44accffe3662dc76
	.xword	0x622f05f5d2f78092
	.xword	0xfa65370e4265717c
	.xword	0xfd3b64cee2be3da4
	.xword	0xc3bc2210c6a941c7
	.xword	0x9ebc9844f69bd25c
	.xword	0xcb7b08c318ef4476
	.xword	0x9becb900f9b15e08
	.xword	0xe8b77020a831214b
	.xword	0x85a06f9d08a18f87
	.xword	0xdeee9037e93ea8f3
	.xword	0xb54207f279d50e50
	.align 0x40000
	.data
data_start_6:

	.xword	0xdafd469d23012848
	.xword	0xb7a629937a8616d5
	.xword	0xa48e253df1b6a9fa
	.xword	0x49bf92fab2e29b5e
	.xword	0xdf42bdb48925633f
	.xword	0xbb1f10aadd335b7d
	.xword	0x654eb0b19b78b2f5
	.xword	0xfe773e66fc5d2534
	.xword	0x5ab2ca823ee1ea02
	.xword	0x2996f276b0ae0e80
	.xword	0x589759542b5aed4f
	.xword	0x3250483aef058139
	.xword	0x595e06253f375fb0
	.xword	0xe33204a1dc195807
	.xword	0xf2c9a393da29bc79
	.xword	0x93144f5d6594ad03
	.xword	0xc384278714a32f1c
	.xword	0xd25b28f61cf793da
	.xword	0x915ec0c5ab759730
	.xword	0xb781ecbadbbded6f
	.xword	0xa9b5855cc5a22523
	.xword	0xf43cf61eff5b6cb9
	.xword	0x6be5c7fb57f18a1d
	.xword	0x64cdd7aaf7de638d
	.xword	0xff24a29854b57a68
	.xword	0x019e69ef656be15d
	.xword	0x845cfa9323461150
	.xword	0x8dd2fcadf4fc1fb3
	.xword	0xf82ff91f3352ee4e
	.xword	0x07765385ea791751
	.xword	0x4a59aab92683e883
	.xword	0x62c94211a6f1daae
	.xword	0x1194d3e88f3a3e9a
	.xword	0x9722a0214f0b3687
	.xword	0x5f9344e2aa2a54dd
	.xword	0xe75b4a87e060be19
	.xword	0xf985311c3823453d
	.xword	0x1deddaf1341775da
	.xword	0x0744b21efa1d8538
	.xword	0x29b5bd1c45420bd2
	.xword	0x50297bd613a8e625
	.xword	0x7e89fb197044c921
	.xword	0x5feeca5398881faa
	.xword	0x69eaf06e2520d435
	.xword	0x977efc8117587392
	.xword	0x9fb148ca1182605f
	.xword	0xa69075ba898820a5
	.xword	0x3f408224bbf2782d
	.xword	0x1b2e9f268d385c3b
	.xword	0x0f4604cd2e69302f
	.xword	0x2911b1843939ed6a
	.xword	0xd14e29287656c703
	.xword	0xa351656fb52d8474
	.xword	0xe6f32461da17d1d1
	.xword	0x8a7598432194a70a
	.xword	0x899fa605c586efc4
	.xword	0xa0568742d74521c1
	.xword	0x22eac7d03b8d4842
	.xword	0xfc522a603faee99c
	.xword	0xef8940be26b2cd20
	.xword	0x4c9cb652a5ac3d24
	.xword	0xb88eb7d3ac54bdce
	.xword	0x1e3ca2a4262ed59b
	.xword	0x9233740b26395ae1
	.xword	0xf4734a57a8cd1236
	.xword	0xa3abdf77a22e8c79
	.xword	0x451b3348271e1212
	.xword	0x482694f3cce4ea08
	.xword	0x0b6853745103a1e7
	.xword	0xbbd86fcf1ebc3f56
	.xword	0x8695f8ea6b06fb95
	.xword	0xcd3411c0271746f5
	.xword	0xb840f0bf1c1cf016
	.xword	0x792ed60e3fc17b23
	.xword	0x43e9547dd322c251
	.xword	0xb73840efd538b19b
	.xword	0x8369e1e8c4805d1c
	.xword	0x06b4b099fc45abb5
	.xword	0x12d72f67f9025563
	.xword	0x9b5e43925fb55980
	.xword	0xb0f9b3560b73d7a1
	.xword	0x31199551a6aca2b4
	.xword	0xedfe6fac5d065f8a
	.xword	0xe0fdfa3c641275bc
	.xword	0xa1a59a121e660e94
	.xword	0x5258c845b30b59ce
	.xword	0x6c43c61a3ecc9db9
	.xword	0xbad51b56a97ffcd1
	.xword	0x11dd4a157589dfc9
	.xword	0xb8175cfad19a6c81
	.xword	0x28d58f30ffd2c449
	.xword	0xf366000e05e9f41c
	.xword	0x3fee47282caf0859
	.xword	0xbc128d2b451dd7d2
	.xword	0xcc6d753127b481aa
	.xword	0x6ef798bc405b35be
	.xword	0x212d02bf6ac0febf
	.xword	0x7e2a53b8dc724bed
	.xword	0x48fbedb9667fd3e9
	.xword	0xf124e3e9359b6a87
	.xword	0x7098dacd94f11efc
	.xword	0xb205b1b474ad476c
	.xword	0x059c7a661c776df4
	.xword	0xa1706b8dae94d982
	.xword	0xe9fc22e11a13aea5
	.xword	0x5576bb6a3acb1caa
	.xword	0x4598871babaf9137
	.xword	0x055dfec351b42cc3
	.xword	0xb6750dfd91c27bb4
	.xword	0x3d24e0a2208cffae
	.xword	0x6c95170041eb7855
	.xword	0x7366d0dc064b7594
	.xword	0x45bc033cfcfdc1c4
	.xword	0xf74cfdbfa7336ef0
	.xword	0x358aa548578e5148
	.xword	0x24d5e852e9118acc
	.xword	0x5edb40429d70a6d1
	.xword	0xa84b2a17e762b363
	.xword	0x6a956738ea267f55
	.xword	0xc0512254106753e4
	.xword	0xc10131693b673d04
	.xword	0x531a115651a93946
	.xword	0x9f6abcefaa87e576
	.xword	0x52af2049250d08f0
	.xword	0x2dae1092d250ea18
	.xword	0x9d1130e3c8aaa38a
	.xword	0x375dad5eeb5dd820
	.xword	0x4c612a0c1ad81a5e
	.xword	0x49fb4f05648f34c3
	.xword	0xd386951578b61715
	.xword	0xf3064a765c33c0cc
	.xword	0xc60cbb34890b408c
	.xword	0xd4e0c73821667e5f
	.xword	0xeb7abeea8968d3c1
	.xword	0x9407cb6700a817bc
	.xword	0x6a14c5e826b3e38a
	.xword	0xb259dc15f84622e7
	.xword	0x095f161fab627ce6
	.xword	0xb30eefd3d8faeeda
	.xword	0x500954a2d8bba3b5
	.xword	0x0e3db30fcf452237
	.xword	0x810004239b62ff43
	.xword	0x5e155212e0d0d5e4
	.xword	0xf95e461ec1477e43
	.xword	0x6b637d1d0ff0b580
	.xword	0x3c23cb45a55151c5
	.xword	0x29edafb7a4085932
	.xword	0x84022edace07d696
	.xword	0x61eead1cd336216b
	.xword	0x3420f9663628469e
	.xword	0xe747eb0c18b3735f
	.xword	0x1d8df55be59c3f25
	.xword	0xc773f6c9e4b04324
	.xword	0x840aab6f155a7345
	.xword	0x41d19eb74e4035b3
	.xword	0xe2d00574b7bf51b8
	.xword	0x39e860cc97d026c4
	.xword	0xf933a2ec8c2b6296
	.xword	0x6ed893d74a80290a
	.xword	0x7cf7023af1ba0a51
	.xword	0xd6df00284a7d1347
	.xword	0x861195e319816d48
	.xword	0x9efb696727d8d4c7
	.xword	0xbd21f287644b2550
	.xword	0x9e0c4a8c5cb93405
	.xword	0x086e0f6c8e3fb800
	.xword	0x55066905c9e276e3
	.xword	0xa3968ee808fbc641
	.xword	0x7f3cb8333d19b384
	.xword	0xf670453aa29632a1
	.xword	0x10a6028880078b0a
	.xword	0x06bc60c470b6153f
	.xword	0x9316e084d7441f8c
	.xword	0x072f36dcdb8c39f1
	.xword	0xe0c63c6d4f43450c
	.xword	0x94c4c3b01b87d4fc
	.xword	0xd8a4cbadf6086ce3
	.xword	0x83f52cdeac301821
	.xword	0xb144f67d2590231a
	.xword	0x3413b00e71aaafd7
	.xword	0x738d31d124c34a56
	.xword	0x93b21f83f3190be3
	.xword	0xc353cbe53ba39968
	.xword	0x183d927b71bd5457
	.xword	0xfe86351855da755f
	.xword	0xb4dde39b9b0f49b2
	.xword	0xe03c584cea8ad266
	.xword	0xba1c6da2446852ad
	.xword	0xa8591dcc315c5283
	.xword	0x0562db4f39ff82b1
	.xword	0x522e6de0b06c4ec4
	.xword	0x78912360e889c599
	.xword	0xe107e9e20b1cf464
	.xword	0x7d658499a18fef1e
	.xword	0xf0cb17682a47f816
	.xword	0x7f6de5fb7c8b1d31
	.xword	0x0eb7ab141d568c86
	.xword	0x8c325f31c7a09897
	.xword	0x7a8fd4a2c858b93c
	.xword	0xe02099b62c715033
	.xword	0xa62e35e219ad2ad7
	.xword	0x65c40851320c1610
	.xword	0xbb4d679481d42d7a
	.xword	0x6aed61f8e133256f
	.xword	0xc827cfd4fe9dfdef
	.xword	0x4b60d89cd5cd58c4
	.xword	0x3943f59f22c60207
	.xword	0x14dc5c6c0ceca82c
	.xword	0x59c9417e1d7061e0
	.xword	0xa3b53550dbdf0edd
	.xword	0xb8b589f3dc7a1bcd
	.xword	0x22e8b02b772330f7
	.xword	0x619260db8a951324
	.xword	0xd6d76dfc5e3139a6
	.xword	0x309467b81fb9fe9e
	.xword	0x53a54901019e73b5
	.xword	0xc6a8dd303f20876f
	.xword	0x5d85c0ca22f226d3
	.xword	0xfb5f85d0a36cce8f
	.xword	0xe772eed701854924
	.xword	0x98520438f192358d
	.xword	0x76462909de4a95c3
	.xword	0x949a1d0c13211004
	.xword	0x867056d9f8beed3d
	.xword	0x6206207acab7c063
	.xword	0xa2568825f539321d
	.xword	0xaad8cefdc216cd36
	.xword	0x96990f7ea573b188
	.xword	0x2abe7b656f4833d2
	.xword	0xd302c256e4846c42
	.xword	0xaa9caca05577623c
	.xword	0xf84129f0cf1d0ad3
	.xword	0x6ba8524856a3ac00
	.xword	0x1a782b2d2527aef1
	.xword	0x71ddb75f52115d27
	.xword	0x771417ccf259af1a
	.xword	0xbad55d03ea567a74
	.xword	0xcb82841a8f775e59
	.xword	0x3fc8b866d034baa6
	.xword	0x349133d718372a22
	.xword	0x18be530c0913df56
	.xword	0xcc09489fc3014bf7
	.xword	0x138282a2d93c53ae
	.xword	0xaf2020c0c572217b
	.xword	0x3bf5daffe9a54ae5
	.xword	0x1acedb05655d551e
	.xword	0x39d625432ef9fce7
	.xword	0x7a123fa9784db69b
	.xword	0x1dc95a851e1e4a93
	.xword	0x65cc69798ad1ca97
	.xword	0xa3bc925203a49c7c
	.xword	0x972335a1e7309649
	.xword	0x128d165dcb339cdd
	.xword	0xce4346556026732c
	.xword	0x1249c6cbaa7edb97
	.xword	0x45b90eae95e71f5b
	.align 0x80000
	.data
data_start_7:

	.xword	0xb062dd5d716e7e0f
	.xword	0x87a1800805e79b04
	.xword	0x4ef7917a9db231c5
	.xword	0x45de0cf0e68a7e65
	.xword	0x69c21b8e4102ba10
	.xword	0xb0cd56e4ed61c5cf
	.xword	0xf8ca47e0f3ca19a0
	.xword	0x31f62f467c9f3d45
	.xword	0x769e4db4bf09eb2d
	.xword	0x6b11235b15eca873
	.xword	0xe9d1898af5822278
	.xword	0xdcb933c27b4eb97e
	.xword	0xf528e0423e483ab1
	.xword	0x848f7d0c4ebcbdea
	.xword	0xf1b6047302719c60
	.xword	0x714cbb6e783741ab
	.xword	0xfbd5b206b69fb371
	.xword	0xd90a34478f54b5a8
	.xword	0xbf115bbf598fdcc0
	.xword	0xdb40f370492f99fa
	.xword	0xf35cffb402cb0b5f
	.xword	0x6256e5f5df265633
	.xword	0xf509cbd8f0b06922
	.xword	0x4b7138aa15ee9d1f
	.xword	0x9a5d1009bb386b9e
	.xword	0x57e5689330d0bedb
	.xword	0x583a6dba06fd69d9
	.xword	0x61626a7fced6105d
	.xword	0xc209dd7b9df2d0ea
	.xword	0x57821407aed808c9
	.xword	0x2f084f7befc910cd
	.xword	0x679d824d64043428
	.xword	0xeb2409b50dadc0fd
	.xword	0x77e48dc77244fef4
	.xword	0x0ab28e9c95da6823
	.xword	0x9144f2ef39411fa5
	.xword	0xbbdca1cdf15ae558
	.xword	0x946f050cc4d16b9f
	.xword	0x7f8160cec970bc12
	.xword	0x98959ff10fe2696e
	.xword	0x0ced200fc80182c7
	.xword	0x47840a355c7b5c04
	.xword	0xb7c7f7294770ffbf
	.xword	0xec0579cb4347362e
	.xword	0x5c5d3baa8e28ff74
	.xword	0xb9ac268df94ff230
	.xword	0x0ee8db43e65b49c1
	.xword	0x1ee73716f400b096
	.xword	0xe9efb079348e89fa
	.xword	0xca6917c209954ed3
	.xword	0x773bdd4891cd2e85
	.xword	0x18e11f02812aebe3
	.xword	0xb7895431e12a35bc
	.xword	0x43981971d0d1cf4a
	.xword	0x71dc16d9e71cd5ab
	.xword	0x6b3162297219c3a4
	.xword	0x6ed530cfc1b09218
	.xword	0x32ce7306489854f4
	.xword	0xb2a4b71fd6b8647c
	.xword	0x4147201f71d16a9d
	.xword	0x4cb1c6237cf1e4f5
	.xword	0x29ad969cb7fac268
	.xword	0xb8e30c178c2a6d66
	.xword	0x4ff86c2877322195
	.xword	0x4a281c18249b4576
	.xword	0xeebf67d38939d2b2
	.xword	0xc19d99add1f44072
	.xword	0x3d943b754cfd3d3e
	.xword	0xcdc622712a0efc64
	.xword	0xabd736074de9844c
	.xword	0xdad1f7755bb7d0bd
	.xword	0x203db3110704954d
	.xword	0x6b90b971e7b0df2b
	.xword	0xe316a421c88ff150
	.xword	0xa37ca1f6f0fc579e
	.xword	0xf6946345acd20fd4
	.xword	0x1444f6c118c403bb
	.xword	0x0cf4164f490bafe0
	.xword	0x4fbbc39c7caa88f2
	.xword	0xd031ae8f207ff4a9
	.xword	0x832b569deb45d788
	.xword	0x0f3b1463ad97839c
	.xword	0x1ece8f99b688c50a
	.xword	0xc77551e9ba411e4c
	.xword	0x91d69ae51e29aed0
	.xword	0xa3f41aa5bc7c3424
	.xword	0x1e4cb8ef198115b5
	.xword	0x387171165c55e634
	.xword	0xace983db1d275ef4
	.xword	0x6fda671a71a93dc7
	.xword	0xf55c7c0966e84f02
	.xword	0x5c4cd32a57f76231
	.xword	0x453ed0fc58f8fc78
	.xword	0xd379edf78b760d43
	.xword	0x21bf371a220e2d05
	.xword	0xb9b99e4f1ba0f1bf
	.xword	0x5afc422927bc47bb
	.xword	0xdfc69cb254c19a93
	.xword	0xd90984abc503d10d
	.xword	0x5179c8b06f0e39fa
	.xword	0x2c56522dd2a26cce
	.xword	0xcf2f089206f0b672
	.xword	0x4d89fe4994a738fa
	.xword	0x507b299658f22816
	.xword	0x14e27c0ab122f30a
	.xword	0x198d8e8b6ebe640b
	.xword	0x0011c6bdf02a9a97
	.xword	0x9323f2f07e441cc5
	.xword	0x7ea77a1045aca275
	.xword	0xc735da1ad7419900
	.xword	0x9c71aed79e1ab2f3
	.xword	0x7b7c5c07c86b1ace
	.xword	0x4fbf55a3bb482cce
	.xword	0x67f36598ac5326d5
	.xword	0x599460385e7d1b74
	.xword	0x60aea993a764afd1
	.xword	0x12c68d4d9cc5b35a
	.xword	0x756aa03dac1287a2
	.xword	0x673f8a71aa86f120
	.xword	0xf148a8ef5cb24bc5
	.xword	0xd6348048112934a4
	.xword	0x38fdbb50385e7e47
	.xword	0xf88f56293ef1f192
	.xword	0x5622139c621733c9
	.xword	0xb5736051c926fe0b
	.xword	0xa139dc2f8aaabe58
	.xword	0x21e115469a51f3b1
	.xword	0x95a69529e37788fc
	.xword	0xf2e763fc09e44eec
	.xword	0x5d2b1163dcf7513a
	.xword	0xe5b8218eafff79e6
	.xword	0x6d8c693ce6ad69af
	.xword	0x45200fb6335b6867
	.xword	0xe634e0ce2a878e0a
	.xword	0x96c5ddfe34b54e32
	.xword	0x2a92e0ec96963a49
	.xword	0x577178557aa3d33d
	.xword	0x54fd14ca0f6bf9ed
	.xword	0xe6328764bd413dc9
	.xword	0xf3cf1d1bfa8ff40f
	.xword	0x316ba75ca88676d5
	.xword	0x13cab07d161e3772
	.xword	0xc70b626b36c741bf
	.xword	0x851c8bbe775114f6
	.xword	0x66aaf7f9ef38568f
	.xword	0xa41960b463364a22
	.xword	0x9d98f76ea9ff685b
	.xword	0x8f0d9d5ea18b942c
	.xword	0x2858d0e1f696f59e
	.xword	0xf0d270fbf87d595b
	.xword	0xb5faecfed97a083c
	.xword	0xab557205d4016500
	.xword	0x58ec8e77210a99f2
	.xword	0x5fc9d2d64056013f
	.xword	0x6911b84bbb8df431
	.xword	0x21a5cde49158fd33
	.xword	0xc35048c1f508c8ca
	.xword	0xafb219bdc4f2c53f
	.xword	0xcc657ff0dcecd3ff
	.xword	0x02e235f30532dd8b
	.xword	0x33abf62d6f03dc76
	.xword	0x2a376e38484a8c55
	.xword	0x6c3391ef6b9e7191
	.xword	0x8322b7fea0aae240
	.xword	0xfb7294654f9459d8
	.xword	0xd5154339d45d901c
	.xword	0x5bf6c802b84d4198
	.xword	0x199e33ef81e04815
	.xword	0x78ed7f3dec74c33e
	.xword	0x0961a2e41f208749
	.xword	0x18beb79cfae264fd
	.xword	0x635eb552453dc887
	.xword	0x22fe7f430d0b25ac
	.xword	0xa25a987a6ec203fd
	.xword	0x2a686762949c770c
	.xword	0xa4c0a1c8d77e28ba
	.xword	0xab948893e8dfb6f2
	.xword	0xf5152e1c61cd679b
	.xword	0x0a4d0cdea54ef8a1
	.xword	0x87cdaf2ed9b79503
	.xword	0x8729d951c5b8b4dd
	.xword	0x7f06147817b45ea6
	.xword	0x65df5efad0110a1c
	.xword	0x6979eeddf2a20f91
	.xword	0x14457856a1533575
	.xword	0xa71cce43265c4d6a
	.xword	0xf6a4aa09bad57034
	.xword	0x351a1e7f306c4a01
	.xword	0x50a3f02c2aea9d89
	.xword	0x41f259f8ff61c987
	.xword	0x4fb077d80005a19a
	.xword	0x117f5ed0a0b68b9f
	.xword	0xd29bb5b8adcca57c
	.xword	0xd403a7dfee1a1a5e
	.xword	0x9279a6c2dcdd7720
	.xword	0x9e232e993e2ce350
	.xword	0x217cc2c45386d00d
	.xword	0x1b4b56eb132f5c71
	.xword	0x970c096e0a082e06
	.xword	0x4cc3ffb08defedac
	.xword	0xf0243d2743151dbd
	.xword	0x82ba01d158d0707b
	.xword	0x13afacae361b0709
	.xword	0x4c42538cba16af13
	.xword	0x9bb28cd00c7ff890
	.xword	0x31b88545ac4b5e6a
	.xword	0x29d194264a894238
	.xword	0xad8c4c974f54d3ab
	.xword	0xd26bc017cf2db229
	.xword	0xf8e0d3d3f0169e4e
	.xword	0x6430c3638b4ecf3e
	.xword	0xf6ded68469157c25
	.xword	0x66a6991832e2e5c9
	.xword	0xfa968257b6d5ae86
	.xword	0xfc4604cb1eee7465
	.xword	0xb023acec627f4235
	.xword	0x9825e95b46d30135
	.xword	0x6e4c1299ccf01c97
	.xword	0xfee570fc14420379
	.xword	0x09155fe8d72fccdb
	.xword	0x8b018580a3760f8a
	.xword	0x122ebc1f485ebc3b
	.xword	0x5edc0eb7634cb7d3
	.xword	0x1f58e1caae9bb1d2
	.xword	0x6e029dc5629da7b3
	.xword	0x235229f9df588891
	.xword	0xff3f5a7ccefcbbcb
	.xword	0x440d62b2b2f12f8d
	.xword	0x9655fab406dceb6a
	.xword	0xa919515bb4342d61
	.xword	0xd159f2fb68f0f9cb
	.xword	0x88b0babc51064b5e
	.xword	0x21fd233f9ce75810
	.xword	0x7f778bc23e0445e0
	.xword	0xb725de9eea5a5ea7
	.xword	0xfde1e3be5c5b027d
	.xword	0x3bedb537b549c680
	.xword	0x3402949a262f7331
	.xword	0xd697a67510cb3553
	.xword	0x85c9f68e31a0dc43
	.xword	0xc274cd8b13091c77
	.xword	0x75f6df31baee22ea
	.xword	0x7f1af23115140dfa
	.xword	0x7cd91cfa23d59874
	.xword	0xdb589133b58780e7
	.xword	0x003f6786fc16da78
	.xword	0x2405c8871acfb752
	.xword	0xa10dae54c64a93ea
	.xword	0xf9021d7cf3c62147
	.xword	0x3f5cf757b4dc8602
	.xword	0xd7eddbe75d97c602
	.xword	0x00f18af07489f3f0
	.xword	0x63de9a0c9a47e314
	.xword	0x0516122d0db43d4a
	.xword	0xd9ad33911145d929
	.xword	0x25a86971495750df



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
