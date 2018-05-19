// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: tlu_multi_mix_2_hwint_s0_33.s
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
   random seed:	763977050
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

	setx 0x7e66a396cdcf307a, %g1, %g0
	setx 0xbb742e4778eb9256, %g1, %g1
	setx 0xfe378605f1d64539, %g1, %g2
	setx 0x5078e30c44454339, %g1, %g3
	setx 0xe8a0dcaeb9834d55, %g1, %g4
	setx 0x599eb2ad1a0e998a, %g1, %g5
	setx 0xbe18c9df990f5830, %g1, %g6
	setx 0xbbe2cd921537edc8, %g1, %g7
	setx 0x6e0679c5febbef91, %g1, %r16
	setx 0xe6941b531c91d229, %g1, %r17
	setx 0x6794eb26fbfdb441, %g1, %r18
	setx 0xbe85abb1c6a62bcd, %g1, %r19
	setx 0x8315c1605bf2adf6, %g1, %r20
	setx 0x31fb107c407714af, %g1, %r21
	setx 0x89e52f9b29d2ad51, %g1, %r22
	setx 0x35fb8c3b4fb3cb34, %g1, %r23
	setx 0x9295ee8265522241, %g1, %r24
	setx 0xf67ed1867dd03b0c, %g1, %r25
	setx 0x8c69d1094ac03de5, %g1, %r26
	setx 0x15f33c99d22ea8b3, %g1, %r27
	setx 0x3b19a026eac7c49a, %g1, %r28
	setx 0xecf0f6c677e61f09, %g1, %r29
	setx 0xfa17cab526911d4c, %g1, %r30
	setx 0xb3cacd68bf663e2c, %g1, %r31
	save
	setx 0x524b635164cfb7ed, %g1, %r16
	setx 0x1466f430ed3277ef, %g1, %r17
	setx 0xc9739c44f0144e87, %g1, %r18
	setx 0xec41c2683d6c9275, %g1, %r19
	setx 0x0f3de67a055728db, %g1, %r20
	setx 0x896bcbe5e12d15b3, %g1, %r21
	setx 0x42cbb2f3b6a8506e, %g1, %r22
	setx 0x61cdc4ac1b711f8a, %g1, %r23
	setx 0x2001299670ae55a0, %g1, %r24
	setx 0x3fee000fd2bc1829, %g1, %r25
	setx 0x63cf61d412e71d67, %g1, %r26
	setx 0x7ad6f89dec3b1faf, %g1, %r27
	setx 0xa70d0bdc154445a3, %g1, %r28
	setx 0xb8a8fe007a8ac33f, %g1, %r29
	setx 0xff7d14c939110508, %g1, %r30
	setx 0xc5ff318a9b6672bd, %g1, %r31
	save
	setx 0x5775c41ca6788e32, %g1, %r16
	setx 0xe423153a33ba68db, %g1, %r17
	setx 0xe1606742a206231f, %g1, %r18
	setx 0xb71eb99001b07aef, %g1, %r19
	setx 0x8a63876031adabf6, %g1, %r20
	setx 0xf90b18e4f4560c1e, %g1, %r21
	setx 0x47124e46c80f74e5, %g1, %r22
	setx 0xb4b9aabcc45a3735, %g1, %r23
	setx 0x01fbff1adf57c3c0, %g1, %r24
	setx 0xd96c46b294394434, %g1, %r25
	setx 0xf72238842e6d21a0, %g1, %r26
	setx 0xf99f7e5f22ef918a, %g1, %r27
	setx 0x728868791fab7d5b, %g1, %r28
	setx 0xdd4a05c41207f664, %g1, %r29
	setx 0xba42cb72e5250cae, %g1, %r30
	setx 0x2565e103ff91eba9, %g1, %r31
	save
	setx 0x1ed740d4e7452eeb, %g1, %r16
	setx 0xb5ceae8f7931c703, %g1, %r17
	setx 0xff478e32aeeeaa87, %g1, %r18
	setx 0x7d34622fba8f1e7b, %g1, %r19
	setx 0xefaa701066e5dc27, %g1, %r20
	setx 0xb6ff1d20ca546b2c, %g1, %r21
	setx 0x0d34311c29cf3b32, %g1, %r22
	setx 0x340d604f6ad721c4, %g1, %r23
	setx 0xf7e32defdc78b216, %g1, %r24
	setx 0xee12c012654581fd, %g1, %r25
	setx 0x858d2f738b581553, %g1, %r26
	setx 0xbecf54411c7288a8, %g1, %r27
	setx 0xdd6100253f5e23b6, %g1, %r28
	setx 0x0ad92ef5dabd25c2, %g1, %r29
	setx 0xb0b55dd328a5222a, %g1, %r30
	setx 0x026b2856d21d2996, %g1, %r31
	save
	setx 0x9bc35d07e72a4e05, %g1, %r16
	setx 0x0773694e64b64910, %g1, %r17
	setx 0x579b30781d85ee87, %g1, %r18
	setx 0x2d6014690693b5c6, %g1, %r19
	setx 0xfa5bf5b4b168a47c, %g1, %r20
	setx 0x0ad7dd01dc357525, %g1, %r21
	setx 0x2a46c8aa030c3b8c, %g1, %r22
	setx 0xf67d410e4462e87f, %g1, %r23
	setx 0x9171dc7b4fe4f121, %g1, %r24
	setx 0xa648bf224334361f, %g1, %r25
	setx 0x2fec4c16aa410f0d, %g1, %r26
	setx 0x97ce61c15791bb11, %g1, %r27
	setx 0x033cdac8f394c2e4, %g1, %r28
	setx 0xab14add691ea6cde, %g1, %r29
	setx 0x43f13f8ce7e7574e, %g1, %r30
	setx 0x8005e0fe47e2af98, %g1, %r31
	save
	setx 0x6dac12242b9798fb, %g1, %r16
	setx 0x0f8f49c4789a0d8a, %g1, %r17
	setx 0x5d8d95ec616849bd, %g1, %r18
	setx 0x3ff0f4c7ad365782, %g1, %r19
	setx 0xc0802c80b538e4dd, %g1, %r20
	setx 0xc328bd45fbb10c56, %g1, %r21
	setx 0x4c0c5083f82b2525, %g1, %r22
	setx 0x71023eb3f383f5a1, %g1, %r23
	setx 0xace38e785e1dfb9e, %g1, %r24
	setx 0x65300fd763511e0d, %g1, %r25
	setx 0x73e5fd4dc07dbed5, %g1, %r26
	setx 0xdb905a75490db470, %g1, %r27
	setx 0xa583c64a244f23ec, %g1, %r28
	setx 0x19ed0b44ca9f4ae1, %g1, %r29
	setx 0x2bea41d2407c2b9b, %g1, %r30
	setx 0xcd9fc3c7c0feecdb, %g1, %r31
	save
	setx 0x94fb091534ff3563, %g1, %r16
	setx 0x52cfd49664ae6f7e, %g1, %r17
	setx 0xc2f72785a407a046, %g1, %r18
	setx 0xf55155dcbf01f972, %g1, %r19
	setx 0xf7077e300601e3aa, %g1, %r20
	setx 0x460e865853b97e1b, %g1, %r21
	setx 0x441aae0313eb09cf, %g1, %r22
	setx 0x9768eea72aac3127, %g1, %r23
	setx 0x799106adf9145d4c, %g1, %r24
	setx 0x5fc28ff7c975e389, %g1, %r25
	setx 0xaece1291102be99c, %g1, %r26
	setx 0x405a3e3c4f281b16, %g1, %r27
	setx 0xd6b4d4049d78c56f, %g1, %r28
	setx 0xa7395fe4d1436d36, %g1, %r29
	setx 0x9fa24430539ec739, %g1, %r30
	setx 0xe9fafa7a5971e97b, %g1, %r31
	save
	setx 0x09368744d66cbc90, %g1, %r16
	setx 0xd172e13a9d01baf1, %g1, %r17
	setx 0x56072b0d51869510, %g1, %r18
	setx 0xdadd29e40d7025e3, %g1, %r19
	setx 0xb82d22eb836ff2c0, %g1, %r20
	setx 0x9508b08a3cf6c4c2, %g1, %r21
	setx 0x0338caf7c364ef7a, %g1, %r22
	setx 0xa592776a9a9353a2, %g1, %r23
	setx 0xb713a08965c0e4d0, %g1, %r24
	setx 0xf5008bc6b7deae4d, %g1, %r25
	setx 0xf2d9cb9a782f5df4, %g1, %r26
	setx 0x61aa347930e7fbad, %g1, %r27
	setx 0xd9abae986d233320, %g1, %r28
	setx 0x9a91165b9dc12c5c, %g1, %r29
	setx 0x2a52c965664a5612, %g1, %r30
	setx 0x281ac1cae826f71c, %g1, %r31
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
	.word 0xb3e521df  ! 2: SAVE_I	save	%r20, 0x0001, %r25
hwintr_0_0:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_0), 16, 16)) -> intp(0, 0, 3e)
	.word 0xb9e460d4  ! 6: SAVE_I	save	%r17, 0x0001, %r28
	.word 0xb5e42023  ! 7: SAVE_I	save	%r16, 0x0001, %r26
	.word 0xbd50c000  ! 9: RDPR_TT	<illegal instruction>
	.word 0xbb346001  ! 14: SRL_I	srl 	%r17, 0x0001, %r29
hwintr_0_1:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_1), 16, 16)) -> intp(0, 0, 0)
	setx	data_start_5, %g1, %r20
hwintr_0_2:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_2), 16, 16)) -> intp(0, 0, 2d)
	.word 0xb5e52106  ! 26: SAVE_I	save	%r20, 0x0001, %r26
	.word 0xbbe5206e  ! 28: SAVE_I	save	%r20, 0x0001, %r29
	.word 0x8594a0c4  ! 29: WRPR_TSTATE_I	wrpr	%r18, 0x00c4, %tstate
	.word 0xb7e46125  ! 30: SAVE_I	save	%r17, 0x0001, %r27
	.word 0x8d9460d0  ! 38: WRPR_PSTATE_I	wrpr	%r17, 0x00d0, %pstate
	.word 0xb1e461aa  ! 43: SAVE_I	save	%r17, 0x0001, %r24
	.word 0xbf520000  ! 45: RDPR_PIL	<illegal instruction>
	.word 0xbfe4a05a  ! 48: SAVE_I	save	%r18, 0x0001, %r31
	.word 0xb7e5e155  ! 49: SAVE_I	save	%r23, 0x0001, %r27
	.word 0xb8b54000  ! 51: ORNcc_R	orncc 	%r21, %r0, %r28
	mov	1, %r12
	.word 0xa1930000  ! 54: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xbfe52020  ! 55: SAVE_I	save	%r20, 0x0001, %r31
	.word 0xbcbc0000  ! 61: XNORcc_R	xnorcc 	%r16, %r0, %r30
hwintr_0_3:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_3), 16, 16)) -> intp(0, 0, 17)
	.word 0xb7e4618d  ! 63: SAVE_I	save	%r17, 0x0001, %r27
	.word 0x8d946085  ! 65: WRPR_PSTATE_I	wrpr	%r17, 0x0085, %pstate
	.word 0xbf2c6001  ! 72: SLL_I	sll 	%r17, 0x0001, %r31
	.word 0xbf500000  ! 74: RDPR_TPC	<illegal instruction>
	.word 0xbd480000  ! 77: RDHPR_HPSTATE	rdhpr	%hpstate, %r30
	.word 0xb3e46098  ! 78: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xbfe56161  ! 79: SAVE_I	save	%r21, 0x0001, %r31
	setx	data_start_0, %g1, %r22
	.word 0xb095a023  ! 86: ORcc_I	orcc 	%r22, 0x0023, %r24
	.word 0xb1540000  ! 91: RDPR_GL	<illegal instruction>
	.word 0xb3e420a6  ! 93: SAVE_I	save	%r16, 0x0001, %r25
	.word 0xb1480000  ! 94: RDHPR_HPSTATE	rdhpr	%hpstate, %r24
	.word 0xb1e4a0c9  ! 96: SAVE_I	save	%r18, 0x0001, %r24
	.word 0xb7e4611c  ! 98: SAVE_I	save	%r17, 0x0001, %r27
	.word 0xb68de16f  ! 101: ANDcc_I	andcc 	%r23, 0x016f, %r27
	.word 0x8194616b  ! 102: WRPR_TPC_I	wrpr	%r17, 0x016b, %tpc
	.word 0xb5e5e12a  ! 103: SAVE_I	save	%r23, 0x0001, %r26
	setx	data_start_2, %g1, %r16
	.word 0xb9e5e048  ! 107: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xb7e4a06b  ! 108: SAVE_I	save	%r18, 0x0001, %r27
	.word 0xb3e5e19c  ! 110: SAVE_I	save	%r23, 0x0001, %r25
	.word 0xb7e5a0c0  ! 112: SAVE_I	save	%r22, 0x0001, %r27
	.word 0xb4ac21f7  ! 114: ANDNcc_I	andncc 	%r16, 0x01f7, %r26
	.word 0x83946196  ! 117: WRPR_TNPC_I	wrpr	%r17, 0x0196, %tnpc
	.word 0xb7e5e01d  ! 119: SAVE_I	save	%r23, 0x0001, %r27
	.word 0xbde4e138  ! 120: SAVE_I	save	%r19, 0x0001, %r30
	.word 0xb1540000  ! 123: RDPR_GL	<illegal instruction>
	.word 0xbf540000  ! 124: RDPR_GL	<illegal instruction>
	.word 0xb9e521af  ! 125: SAVE_I	save	%r20, 0x0001, %r28
	.word 0xb9e520e3  ! 126: SAVE_I	save	%r20, 0x0001, %r28
	.word 0x83946031  ! 130: WRPR_TNPC_I	wrpr	%r17, 0x0031, %tnpc
	setx	data_start_1, %g1, %r18
	.word 0xb5e4e037  ! 138: SAVE_I	save	%r19, 0x0001, %r26
	mov	2, %r12
	.word 0x8f930000  ! 139: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xbbe4e0a0  ! 140: SAVE_I	save	%r19, 0x0001, %r29
hwintr_0_4:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_4), 16, 16)) -> intp(0, 0, 12)
	.word 0xbde5208f  ! 142: SAVE_I	save	%r20, 0x0001, %r30
	.word 0xb7e460d8  ! 147: SAVE_I	save	%r17, 0x0001, %r27
hwintr_0_5:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_5), 16, 16)) -> intp(0, 0, 1)
	.word 0xb7e42019  ! 149: SAVE_I	save	%r16, 0x0001, %r27
	.word 0xb1e42115  ! 152: SAVE_I	save	%r16, 0x0001, %r24
	.word 0x8d956017  ! 153: WRPR_PSTATE_I	wrpr	%r21, 0x0017, %pstate
	.word 0xb2a4a0df  ! 156: SUBcc_I	subcc 	%r18, 0x00df, %r25
	.word 0xb9e42091  ! 157: SAVE_I	save	%r16, 0x0001, %r28
	.word 0xbfe46016  ! 159: SAVE_I	save	%r17, 0x0001, %r31
	.word 0xb5e460f4  ! 162: SAVE_I	save	%r17, 0x0001, %r26
	.word 0xb7e521b1  ! 170: SAVE_I	save	%r20, 0x0001, %r27
	.word 0xb3e5e03d  ! 171: SAVE_I	save	%r23, 0x0001, %r25
	.word 0xbb540000  ! 173: RDPR_GL	<illegal instruction>
hwintr_0_6:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_6), 16, 16)) -> intp(0, 0, 34)
	.word 0xbd520000  ! 178: RDPR_PIL	<illegal instruction>
	.word 0xb7e4a07c  ! 179: SAVE_I	save	%r18, 0x0001, %r27
	.word 0xbde46143  ! 180: SAVE_I	save	%r17, 0x0001, %r30
	.word 0xb1e5e16e  ! 182: SAVE_I	save	%r23, 0x0001, %r24
	.word 0xb3e5a027  ! 183: SAVE_I	save	%r22, 0x0001, %r25
	.word 0xb7e46149  ! 192: SAVE_I	save	%r17, 0x0001, %r27
	.word 0xbbe5209c  ! 193: SAVE_I	save	%r20, 0x0001, %r29
	.word 0xbbe461b0  ! 195: SAVE_I	save	%r17, 0x0001, %r29
	.word 0x8d94618f  ! 196: WRPR_PSTATE_I	wrpr	%r17, 0x018f, %pstate
	.word 0xbb518000  ! 201: RDPR_PSTATE	<illegal instruction>
hwintr_0_7:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_7), 16, 16)) -> intp(0, 0, 1f)
	.word 0xb3e5e0e3  ! 206: SAVE_I	save	%r23, 0x0001, %r25
	.word 0xb3e4e1d3  ! 210: SAVE_I	save	%r19, 0x0001, %r25
hwintr_0_8:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_8), 16, 16)) -> intp(0, 0, 37)
	.word 0xb9510000  ! 217: RDPR_TICK	<illegal instruction>
	setx	0x666e5e3600005bc2, %g1, %r10
	.word 0x819a8000  ! 225: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xb5e521d2  ! 227: SAVE_I	save	%r20, 0x0001, %r26
	.word 0xba0521af  ! 231: ADD_I	add 	%r20, 0x01af, %r29
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb7e461f4  ! 233: SAVE_I	save	%r17, 0x0001, %r27
	.word 0xbbe56161  ! 234: SAVE_I	save	%r21, 0x0001, %r29
	.word 0xbfe5a086  ! 236: SAVE_I	save	%r22, 0x0001, %r31
	.word 0xb9e4e064  ! 237: SAVE_I	save	%r19, 0x0001, %r28
hwintr_0_9:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_9), 16, 16)) -> intp(0, 0, c)
	.word 0xbde4e166  ! 240: SAVE_I	save	%r19, 0x0001, %r30
	.word 0x87942198  ! 241: WRPR_TT_I	wrpr	%r16, 0x0198, %tt
	.word 0xbfe46032  ! 242: SAVE_I	save	%r17, 0x0001, %r31
	.word 0xb1518000  ! 243: RDPR_PSTATE	<illegal instruction>
	.word 0xbfe42043  ! 245: SAVE_I	save	%r16, 0x0001, %r31
	.word 0xb3e56197  ! 248: SAVE_I	save	%r21, 0x0001, %r25
	.word 0xbc850000  ! 250: ADDcc_R	addcc 	%r20, %r0, %r30
	.word 0x9194e11d  ! 251: WRPR_PIL_I	wrpr	%r19, 0x011d, %pil
	.word 0xbde56129  ! 253: SAVE_I	save	%r21, 0x0001, %r30
	.word 0xb1e421e7  ! 254: SAVE_I	save	%r16, 0x0001, %r24
	.word 0x899521ea  ! 258: WRPR_TICK_I	wrpr	%r20, 0x01ea, %tick
	.word 0xbb2d4000  ! 259: SLL_R	sll 	%r21, %r0, %r29
	.word 0xb1e4a132  ! 260: SAVE_I	save	%r18, 0x0001, %r24
	.word 0xb3e4a119  ! 263: SAVE_I	save	%r18, 0x0001, %r25
	.word 0xb9e4209b  ! 266: SAVE_I	save	%r16, 0x0001, %r28
hwintr_0_10:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_10), 16, 16)) -> intp(0, 0, 19)
	.word 0xb3e42026  ! 272: SAVE_I	save	%r16, 0x0001, %r25
	.word 0xb2956041  ! 274: ORcc_I	orcc 	%r21, 0x0041, %r25
	.word 0x8395607f  ! 276: WRPR_TNPC_I	wrpr	%r21, 0x007f, %tnpc
hwintr_0_11:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_11), 16, 16)) -> intp(0, 0, 2f)
	setx	data_start_5, %g1, %r23
	.word 0xb5e5e01d  ! 281: SAVE_I	save	%r23, 0x0001, %r26
	.word 0x899521bd  ! 282: WRPR_TICK_I	wrpr	%r20, 0x01bd, %tick
	.word 0x9194a042  ! 283: WRPR_PIL_I	wrpr	%r18, 0x0042, %pil
	.word 0xb9e52196  ! 284: SAVE_I	save	%r20, 0x0001, %r28
	.word 0xb1e46044  ! 285: SAVE_I	save	%r17, 0x0001, %r24
	.word 0xb7e5e088  ! 291: SAVE_I	save	%r23, 0x0001, %r27
	mov	2, %r12
	.word 0xa1930000  ! 293: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xbc9c20ca  ! 296: XORcc_I	xorcc 	%r16, 0x00ca, %r30
	.word 0xbb51c000  ! 297: RDPR_TL	<illegal instruction>
	.word 0xb5504000  ! 302: RDPR_TNPC	<illegal instruction>
hwintr_0_12:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_12), 16, 16)) -> intp(0, 0, 7)
	.word 0x8795a1c8  ! 309: WRPR_TT_I	wrpr	%r22, 0x01c8, %tt
	.word 0xb7e46025  ! 310: SAVE_I	save	%r17, 0x0001, %r27
	.word 0xb9e4210f  ! 312: SAVE_I	save	%r16, 0x0001, %r28
	.word 0xbbe52157  ! 313: SAVE_I	save	%r20, 0x0001, %r29
	.word 0xb7e461d5  ! 314: SAVE_I	save	%r17, 0x0001, %r27
hwintr_0_13:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_13), 16, 16)) -> intp(0, 0, 39)
	.word 0xb1540000  ! 319: RDPR_GL	<illegal instruction>
	.word 0xb3e4a10d  ! 323: SAVE_I	save	%r18, 0x0001, %r25
	.word 0xbbe5e0be  ! 326: SAVE_I	save	%r23, 0x0001, %r29
	.word 0xbd508000  ! 328: RDPR_TSTATE	<illegal instruction>
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb5e42194  ! 333: SAVE_I	save	%r16, 0x0001, %r26
	.word 0xb81d20e8  ! 334: XOR_I	xor 	%r20, 0x00e8, %r28
	.word 0x8794a1d3  ! 335: WRPR_TT_I	wrpr	%r18, 0x01d3, %tt
	.word 0xbf510000  ! 338: RDPR_TICK	<illegal instruction>
	setx	0x4af7cc8a0000fc41, %g1, %r10
	.word 0x839a8000  ! 339: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0x9195a1b4  ! 342: WRPR_PIL_I	wrpr	%r22, 0x01b4, %pil
	.word 0xb3504000  ! 344: RDPR_TNPC	<illegal instruction>
	.word 0xbbe42076  ! 345: SAVE_I	save	%r16, 0x0001, %r29
	.word 0xb1e5e14b  ! 347: SAVE_I	save	%r23, 0x0001, %r24
	.word 0xb1540000  ! 350: RDPR_GL	<illegal instruction>
	setx	data_start_4, %g1, %r20
	.word 0xb951c000  ! 353: RDPR_TL	<illegal instruction>
	.word 0xbbe5e1e0  ! 357: SAVE_I	save	%r23, 0x0001, %r29
	.word 0xbfe42096  ! 358: SAVE_I	save	%r16, 0x0001, %r31
hwintr_0_14:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_14), 16, 16)) -> intp(0, 0, a)
	.word 0xbbe5e11b  ! 363: SAVE_I	save	%r23, 0x0001, %r29
	.word 0x8195a0d0  ! 365: WRPR_TPC_I	wrpr	%r22, 0x00d0, %tpc
	.word 0xbde5e08d  ! 370: SAVE_I	save	%r23, 0x0001, %r30
hwintr_0_15:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_15), 16, 16)) -> intp(0, 0, 21)
	.word 0x8d95a0da  ! 374: WRPR_PSTATE_I	wrpr	%r22, 0x00da, %pstate
	.word 0xb9e5617d  ! 377: SAVE_I	save	%r21, 0x0001, %r28
	.word 0xb5e4a096  ! 378: SAVE_I	save	%r18, 0x0001, %r26
	setx	0xb9f3242c00009d8e, %g1, %r10
	.word 0x839a8000  ! 379: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb3e5e0e0  ! 380: SAVE_I	save	%r23, 0x0001, %r25
	.word 0xbbe560d0  ! 381: SAVE_I	save	%r21, 0x0001, %r29
	setx	0xc0dae62d00003b95, %g1, %r10
	.word 0x819a8000  ! 384: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xb9520000  ! 385: RDPR_PIL	<illegal instruction>
	.word 0xb7e5a023  ! 387: SAVE_I	save	%r22, 0x0001, %r27
	.word 0x8995e13b  ! 389: WRPR_TICK_I	wrpr	%r23, 0x013b, %tick
	.word 0xb5e5e154  ! 390: SAVE_I	save	%r23, 0x0001, %r26
	.word 0xbbe42033  ! 394: SAVE_I	save	%r16, 0x0001, %r29
	.word 0xbbe4e0f2  ! 396: SAVE_I	save	%r19, 0x0001, %r29
	.word 0xbfe5e114  ! 397: SAVE_I	save	%r23, 0x0001, %r31
	mov	0, %r12
	.word 0xa1930000  ! 399: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb5e4e1f2  ! 400: SAVE_I	save	%r19, 0x0001, %r26
hwintr_0_16:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_16), 16, 16)) -> intp(0, 0, 3b)
	.word 0xb1e561a3  ! 403: SAVE_I	save	%r21, 0x0001, %r24
	.word 0x819560cc  ! 404: WRPR_TPC_I	wrpr	%r21, 0x00cc, %tpc
hwintr_0_17:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_17), 16, 16)) -> intp(0, 0, 34)
	.word 0xb7643801  ! 413: MOVcc_I	<illegal instruction>
hwintr_0_18:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_18), 16, 16)) -> intp(0, 0, 0)
hwintr_0_19:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_19), 16, 16)) -> intp(0, 0, 3a)
	.word 0xb094c000  ! 418: ORcc_R	orcc 	%r19, %r0, %r24
	.word 0xb7508000  ! 419: RDPR_TSTATE	<illegal instruction>
	.word 0xbd540000  ! 420: RDPR_GL	<illegal instruction>
	.word 0xb5504000  ! 421: RDPR_TNPC	<illegal instruction>
	.word 0xb1e4a13e  ! 434: SAVE_I	save	%r18, 0x0001, %r24
hwintr_0_20:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_20), 16, 16)) -> intp(0, 0, 3d)
	setx	0x60ef36720000b8de, %g1, %r10
	.word 0x839a8000  ! 436: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
hwintr_0_21:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_21), 16, 16)) -> intp(0, 0, 14)
hwintr_0_22:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_22), 16, 16)) -> intp(0, 0, 1b)
hwintr_0_23:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_23), 16, 16)) -> intp(0, 0, 18)
	.word 0xb7e4a19e  ! 444: SAVE_I	save	%r18, 0x0001, %r27
	.word 0x8395618d  ! 449: WRPR_TNPC_I	wrpr	%r21, 0x018d, %tnpc
	.word 0xb12cd000  ! 453: SLLX_R	sllx	%r19, %r0, %r24
	.word 0xbbe46043  ! 456: SAVE_I	save	%r17, 0x0001, %r29
	.word 0xb3518000  ! 458: RDPR_PSTATE	<illegal instruction>
	.word 0xbf504000  ! 465: RDPR_TNPC	<illegal instruction>
	setx	0xb7341f4100000905, %g1, %r10
	.word 0x839a8000  ! 466: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb0c5a17d  ! 473: ADDCcc_I	addccc 	%r22, 0x017d, %r24
	.word 0x8194e14e  ! 475: WRPR_TPC_I	wrpr	%r19, 0x014e, %tpc
	.word 0xb1e5a008  ! 476: SAVE_I	save	%r22, 0x0001, %r24
	.word 0xbde5208a  ! 477: SAVE_I	save	%r20, 0x0001, %r30
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
hwintr_0_24:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_24), 16, 16)) -> intp(0, 0, 2c)
	setx	0xf2b3c0750000acd2, %g1, %r10
	.word 0x839a8000  ! 488: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
hwintr_0_25:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_25), 16, 16)) -> intp(0, 0, 2b)
	.word 0xb3e5e045  ! 494: SAVE_I	save	%r23, 0x0001, %r25
	.word 0xb60560e7  ! 495: ADD_I	add 	%r21, 0x00e7, %r27
	.word 0x8795e074  ! 498: WRPR_TT_I	wrpr	%r23, 0x0074, %tt
	.word 0xb9e4e099  ! 499: SAVE_I	save	%r19, 0x0001, %r28
hwintr_0_26:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_26), 16, 16)) -> intp(0, 0, b)
	.word 0xb1e4e0a5  ! 501: SAVE_I	save	%r19, 0x0001, %r24
	.word 0x8395e11d  ! 507: WRPR_TNPC_I	wrpr	%r23, 0x011d, %tnpc
	.word 0xb9e5e183  ! 509: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xbfe461f1  ! 514: SAVE_I	save	%r17, 0x0001, %r31
	.word 0xb1e4a106  ! 518: SAVE_I	save	%r18, 0x0001, %r24
	.word 0xbc148000  ! 520: OR_R	or 	%r18, %r0, %r30
	.word 0xb1e4e0aa  ! 525: SAVE_I	save	%r19, 0x0001, %r24
hwintr_0_27:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_27), 16, 16)) -> intp(0, 0, 33)
	.word 0xb9e4e1ed  ! 531: SAVE_I	save	%r19, 0x0001, %r28
	setx	data_start_0, %g1, %r21
	.word 0xbfe4e059  ! 534: SAVE_I	save	%r19, 0x0001, %r31
	.word 0xb7508000  ! 536: RDPR_TSTATE	<illegal instruction>
	.word 0xb3e5600c  ! 538: SAVE_I	save	%r21, 0x0001, %r25
	.word 0xbfe420be  ! 540: SAVE_I	save	%r16, 0x0001, %r31
hwintr_0_28:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_28), 16, 16)) -> intp(0, 0, 3e)
hwintr_0_29:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_29), 16, 16)) -> intp(0, 0, 3d)
hwintr_0_30:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_30), 16, 16)) -> intp(0, 0, e)
	.word 0xb1e5e1b0  ! 562: SAVE_I	save	%r23, 0x0001, %r24
	setx	data_start_4, %g1, %r17
hwintr_0_31:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_31), 16, 16)) -> intp(0, 0, 3)
	.word 0xb150c000  ! 571: RDPR_TT	<illegal instruction>
	.word 0xb7520000  ! 572: RDPR_PIL	<illegal instruction>
	.word 0xb7e521d4  ! 573: SAVE_I	save	%r20, 0x0001, %r27
	.word 0xb1e521ab  ! 574: SAVE_I	save	%r20, 0x0001, %r24
	.word 0xb7504000  ! 577: RDPR_TNPC	<illegal instruction>
	.word 0xb6b5c000  ! 578: SUBCcc_R	orncc 	%r23, %r0, %r27
	.word 0xbde56071  ! 580: SAVE_I	save	%r21, 0x0001, %r30
	.word 0xbc348000  ! 584: ORN_R	orn 	%r18, %r0, %r30
	.word 0x8d946090  ! 585: WRPR_PSTATE_I	wrpr	%r17, 0x0090, %pstate
	.word 0xbde5607e  ! 588: SAVE_I	save	%r21, 0x0001, %r30
hwintr_0_32:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_32), 16, 16)) -> intp(0, 0, 33)
	setx	0xb1bacc2b0000ba4e, %g1, %r10
	.word 0x839a8000  ! 593: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xbfe4e0de  ! 594: SAVE_I	save	%r19, 0x0001, %r31
	.word 0xb3e5214a  ! 595: SAVE_I	save	%r20, 0x0001, %r25
	setx	0x8d165013000088de, %g1, %r10
	.word 0x839a8000  ! 597: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb1508000  ! 600: RDPR_TSTATE	<illegal instruction>
	.word 0xbfe4211d  ! 602: SAVE_I	save	%r16, 0x0001, %r31
hwintr_0_33:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_33), 16, 16)) -> intp(0, 0, 32)
	setx	data_start_5, %g1, %r20
	.word 0xb9e5e031  ! 608: SAVE_I	save	%r23, 0x0001, %r28
	setx	data_start_6, %g1, %r19
	.word 0xb5e4e12d  ! 613: SAVE_I	save	%r19, 0x0001, %r26
	.word 0xbf540000  ! 616: RDPR_GL	<illegal instruction>
	.word 0xbfe4e03a  ! 617: SAVE_I	save	%r19, 0x0001, %r31
	.word 0xb3e56015  ! 620: SAVE_I	save	%r21, 0x0001, %r25
hwintr_0_34:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_34), 16, 16)) -> intp(0, 0, 3d)
	.word 0xbde52039  ! 624: SAVE_I	save	%r20, 0x0001, %r30
	.word 0xb3480000  ! 628: RDHPR_HPSTATE	rdhpr	%hpstate, %r25
	.word 0xb8bc8000  ! 631: XNORcc_R	xnorcc 	%r18, %r0, %r28
hwintr_0_35:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_35), 16, 16)) -> intp(0, 0, 37)
hwintr_0_36:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_36), 16, 16)) -> intp(0, 0, 4)
	.word 0xb5641800  ! 638: MOVcc_R	<illegal instruction>
	.word 0x8195214a  ! 641: WRPR_TPC_I	wrpr	%r20, 0x014a, %tpc
	mov	2, %r12
	.word 0x8f930000  ! 643: WRPR_TL_R	wrpr	%r12, %r0, %tl
hwintr_0_37:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_37), 16, 16)) -> intp(0, 0, 21)
	.word 0xb01da1d4  ! 647: XOR_I	xor 	%r22, 0x01d4, %r24
hwintr_0_38:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_38), 16, 16)) -> intp(0, 0, 1f)
	mov	1, %r12
	.word 0x8f930000  ! 650: WRPR_TL_R	wrpr	%r12, %r0, %tl
hwintr_0_39:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_39), 16, 16)) -> intp(0, 0, 1d)
	.word 0xb1e5a146  ! 653: SAVE_I	save	%r22, 0x0001, %r24
hwintr_0_40:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_40), 16, 16)) -> intp(0, 0, 3c)
	.word 0xb7e46093  ! 660: SAVE_I	save	%r17, 0x0001, %r27
	.word 0xb1e420d2  ! 668: SAVE_I	save	%r16, 0x0001, %r24
	setx	0xc050e5ea00009e10, %g1, %r10
	.word 0x819a8000  ! 672: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xb2348000  ! 673: SUBC_R	orn 	%r18, %r0, %r25
	.word 0xb3e4a027  ! 679: SAVE_I	save	%r18, 0x0001, %r25
	setx	data_start_1, %g1, %r20
	.word 0xb1e4a09b  ! 685: SAVE_I	save	%r18, 0x0001, %r24
	mov	1, %r12
	.word 0x8f930000  ! 690: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xb13d7001  ! 691: SRAX_I	srax	%r21, 0x0001, %r24
	.word 0x8995602a  ! 692: WRPR_TICK_I	wrpr	%r21, 0x002a, %tick
	.word 0xb5518000  ! 693: RDPR_PSTATE	<illegal instruction>
hwintr_0_41:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_41), 16, 16)) -> intp(0, 0, 1d)
	.word 0x879521c3  ! 699: WRPR_TT_I	wrpr	%r20, 0x01c3, %tt
	.word 0xbbe4a19d  ! 700: SAVE_I	save	%r18, 0x0001, %r29
	.word 0xb5e521e3  ! 701: SAVE_I	save	%r20, 0x0001, %r26
hwintr_0_42:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_42), 16, 16)) -> intp(0, 0, 1e)
	.word 0xb73cb001  ! 709: SRAX_I	srax	%r18, 0x0001, %r27
	.word 0xbbe4a0b1  ! 711: SAVE_I	save	%r18, 0x0001, %r29
	.word 0x899460c5  ! 713: WRPR_TICK_I	wrpr	%r17, 0x00c5, %tick
hwintr_0_43:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_43), 16, 16)) -> intp(0, 0, 2f)
	.word 0xbfe5e11e  ! 722: SAVE_I	save	%r23, 0x0001, %r31
	.word 0xb57cc400  ! 723: MOVR_R	movre	%r19, %r0, %r26
	.word 0xb03c0000  ! 724: XNOR_R	xnor 	%r16, %r0, %r24
	.word 0xbb2dc000  ! 728: SLL_R	sll 	%r23, %r0, %r29
hwintr_0_44:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_44), 16, 16)) -> intp(0, 0, 13)
	setx	0x610fff2d00003e48, %g1, %r10
	.word 0x839a8000  ! 738: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb1e461d8  ! 739: SAVE_I	save	%r17, 0x0001, %r24
	.word 0xbfe5e003  ! 747: SAVE_I	save	%r23, 0x0001, %r31
hwintr_0_45:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_45), 16, 16)) -> intp(0, 0, 14)
	.word 0x8994a098  ! 755: WRPR_TICK_I	wrpr	%r18, 0x0098, %tick
	.word 0xb0ada148  ! 756: ANDNcc_I	andncc 	%r22, 0x0148, %r24
	.word 0xb1e52094  ! 758: SAVE_I	save	%r20, 0x0001, %r24
	.word 0xbd540000  ! 759: RDPR_GL	<illegal instruction>
	.word 0xb3e46109  ! 766: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xb5e56185  ! 770: SAVE_I	save	%r21, 0x0001, %r26
	.word 0xb5510000  ! 773: RDPR_TICK	<illegal instruction>
	.word 0xbf2d1000  ! 774: SLLX_R	sllx	%r20, %r0, %r31
	.word 0xb7e5a0b6  ! 775: SAVE_I	save	%r22, 0x0001, %r27
	mov	2, %r12
	.word 0xa1930000  ! 777: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb7e4e18a  ! 781: SAVE_I	save	%r19, 0x0001, %r27
	.word 0xb3504000  ! 785: RDPR_TNPC	<illegal instruction>
	.word 0xb3518000  ! 787: RDPR_PSTATE	<illegal instruction>
	.word 0xbbe5e17e  ! 789: SAVE_I	save	%r23, 0x0001, %r29
	.word 0x8595218a  ! 790: WRPR_TSTATE_I	wrpr	%r20, 0x018a, %tstate
hwintr_0_46:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_46), 16, 16)) -> intp(0, 0, 2b)
	.word 0x8994e086  ! 793: WRPR_TICK_I	wrpr	%r19, 0x0086, %tick
	.word 0xb7e5200a  ! 801: SAVE_I	save	%r20, 0x0001, %r27
	.word 0xb9e46163  ! 803: SAVE_I	save	%r17, 0x0001, %r28
	.word 0xb9e46174  ! 805: SAVE_I	save	%r17, 0x0001, %r28
hwintr_0_47:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_47), 16, 16)) -> intp(0, 0, 19)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbbe4e0d5  ! 812: SAVE_I	save	%r19, 0x0001, %r29
	.word 0xbfe5a0b3  ! 813: SAVE_I	save	%r22, 0x0001, %r31
	.word 0xb0c5a0c5  ! 814: ADDCcc_I	addccc 	%r22, 0x00c5, %r24
	.word 0xbde56180  ! 817: SAVE_I	save	%r21, 0x0001, %r30
	.word 0xb9357001  ! 818: SRLX_I	srlx	%r21, 0x0001, %r28
	mov	1, %r12
	.word 0x8f930000  ! 819: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xb7e5e141  ! 821: SAVE_I	save	%r23, 0x0001, %r27
	.word 0xb6bd4000  ! 826: XNORcc_R	xnorcc 	%r21, %r0, %r27
	.word 0xb9e42135  ! 829: SAVE_I	save	%r16, 0x0001, %r28
	.word 0xbde561ac  ! 831: SAVE_I	save	%r21, 0x0001, %r30
	.word 0xb43560cf  ! 834: SUBC_I	orn 	%r21, 0x00cf, %r26
	.word 0xb73ca001  ! 837: SRA_I	sra 	%r18, 0x0001, %r27
	.word 0xb7e4a1af  ! 838: SAVE_I	save	%r18, 0x0001, %r27
	.word 0xb5e5602e  ! 839: SAVE_I	save	%r21, 0x0001, %r26
	.word 0xbbe4a09d  ! 841: SAVE_I	save	%r18, 0x0001, %r29
	mov	0, %r12
	.word 0x8f930000  ! 842: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xbe0ce183  ! 845: AND_I	and 	%r19, 0x0183, %r31
hwintr_0_48:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_48), 16, 16)) -> intp(0, 0, 1a)
	.word 0xb9e5e125  ! 849: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xbbe5a193  ! 854: SAVE_I	save	%r22, 0x0001, %r29
hwintr_0_49:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_49), 16, 16)) -> intp(0, 0, 8)
	.word 0xbbe560e3  ! 860: SAVE_I	save	%r21, 0x0001, %r29
	.word 0xb9e561fe  ! 863: SAVE_I	save	%r21, 0x0001, %r28
	.word 0xb9e52050  ! 865: SAVE_I	save	%r20, 0x0001, %r28
hwintr_0_50:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_50), 16, 16)) -> intp(0, 0, 22)
	.word 0xb7520000  ! 873: RDPR_PIL	<illegal instruction>
	.word 0xbfe56133  ! 880: SAVE_I	save	%r21, 0x0001, %r31
	.word 0xb5e521bd  ! 882: SAVE_I	save	%r20, 0x0001, %r26
	.word 0xb7e4a06a  ! 883: SAVE_I	save	%r18, 0x0001, %r27
	.word 0x8394e1b7  ! 886: WRPR_TNPC_I	wrpr	%r19, 0x01b7, %tnpc
	.word 0xb5e56147  ! 887: SAVE_I	save	%r21, 0x0001, %r26
	.word 0xb150c000  ! 890: RDPR_TT	<illegal instruction>
	.word 0xb7e5e090  ! 891: SAVE_I	save	%r23, 0x0001, %r27
	.word 0xbfe4606f  ! 892: SAVE_I	save	%r17, 0x0001, %r31
	.word 0xb7e420e9  ! 895: SAVE_I	save	%r16, 0x0001, %r27
	.word 0xbf500000  ! 896: RDPR_TPC	<illegal instruction>
	.word 0xb5e52188  ! 897: SAVE_I	save	%r20, 0x0001, %r26
	.word 0xb43c8000  ! 899: XNOR_R	xnor 	%r18, %r0, %r26
	.word 0xb5e5e1ee  ! 900: SAVE_I	save	%r23, 0x0001, %r26
	.word 0xb2b4c000  ! 905: ORNcc_R	orncc 	%r19, %r0, %r25
	.word 0xb3e5e067  ! 906: SAVE_I	save	%r23, 0x0001, %r25
hwintr_0_51:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_51), 16, 16)) -> intp(0, 0, 9)
	.word 0xb9e421b0  ! 909: SAVE_I	save	%r16, 0x0001, %r28
	.word 0xb750c000  ! 912: RDPR_TT	<illegal instruction>
hwintr_0_52:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_52), 16, 16)) -> intp(0, 0, 18)
	.word 0x8994a043  ! 916: WRPR_TICK_I	wrpr	%r18, 0x0043, %tick
	.word 0xb7e4e082  ! 917: SAVE_I	save	%r19, 0x0001, %r27
hwintr_0_53:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_53), 16, 16)) -> intp(0, 0, 3b)
	.word 0xbb520000  ! 921: RDPR_PIL	<illegal instruction>
	.word 0xbde5614d  ! 923: SAVE_I	save	%r21, 0x0001, %r30
	.word 0xb7e5e11b  ! 927: SAVE_I	save	%r23, 0x0001, %r27
	.word 0xbbe560d6  ! 929: SAVE_I	save	%r21, 0x0001, %r29
	.word 0xb1e5e11e  ! 933: SAVE_I	save	%r23, 0x0001, %r24
	.word 0xb2140000  ! 935: OR_R	or 	%r16, %r0, %r25
	.word 0xb1518000  ! 936: RDPR_PSTATE	<illegal instruction>
	.word 0xbbe42031  ! 940: SAVE_I	save	%r16, 0x0001, %r29
	.word 0xb9520000  ! 941: RDPR_PIL	<illegal instruction>
	.word 0xb7e460e0  ! 942: SAVE_I	save	%r17, 0x0001, %r27
	.word 0xbde4a0a0  ! 944: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xbfe52111  ! 945: SAVE_I	save	%r20, 0x0001, %r31
	.word 0xb9e460a5  ! 948: SAVE_I	save	%r17, 0x0001, %r28
	.word 0xb7e42097  ! 950: SAVE_I	save	%r16, 0x0001, %r27
hwintr_0_54:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_54), 16, 16)) -> intp(0, 0, 2a)
	.word 0xbbe56115  ! 952: SAVE_I	save	%r21, 0x0001, %r29
	.word 0xbfe42028  ! 954: SAVE_I	save	%r16, 0x0001, %r31
	.word 0xb9e42107  ! 958: SAVE_I	save	%r16, 0x0001, %r28
	.word 0xb7e5a153  ! 959: SAVE_I	save	%r22, 0x0001, %r27
	.word 0xb7e56058  ! 960: SAVE_I	save	%r21, 0x0001, %r27
	.word 0xbde5209a  ! 963: SAVE_I	save	%r20, 0x0001, %r30
	setx	data_start_4, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xba850000  ! 974: ADDcc_R	addcc 	%r20, %r0, %r29
	.word 0xb7e4200c  ! 976: SAVE_I	save	%r16, 0x0001, %r27
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb350c000  ! 979: RDPR_TT	<illegal instruction>
	.word 0xbf51c000  ! 980: RDPR_TL	<illegal instruction>
	.word 0xb9e421bc  ! 981: SAVE_I	save	%r16, 0x0001, %r28
	.word 0xb3e4a1e2  ! 982: SAVE_I	save	%r18, 0x0001, %r25
	.word 0xb1e421e9  ! 986: SAVE_I	save	%r16, 0x0001, %r24
	.word 0xbde4a019  ! 989: SAVE_I	save	%r18, 0x0001, %r30
	setx	data_start_4, %g1, %r22
	.word 0x879420f0  ! 995: WRPR_TT_I	wrpr	%r16, 0x00f0, %tt
	.word 0xb5e4a1b8  ! 998: SAVE_I	save	%r18, 0x0001, %r26
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
hwintr_3_0:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_0), 16, 16)) -> intp(3, 0, 3a)
	.word 0xbb50c000  ! 9: RDPR_TT	rdpr	%tt, %r29
	.word 0xb134e001  ! 14: SRL_I	srl 	%r19, 0x0001, %r24
	.word 0xf43da1a9  ! 15: STD_I	std	%r26, [%r22 + 0x01a9]
	.word 0xf82d2067  ! 18: STB_I	stb	%r28, [%r20 + 0x0067]
hwintr_3_1:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_1), 16, 16)) -> intp(3, 0, e)
	setx	data_start_6, %g1, %r17
hwintr_3_2:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_2), 16, 16)) -> intp(3, 0, 8)
	.word 0x85946124  ! 29: WRPR_TSTATE_I	wrpr	%r17, 0x0124, %tstate
	.word 0xf62d8000  ! 32: STB_R	stb	%r27, [%r22 + %r0]
	.word 0x8d94e01f  ! 38: WRPR_PSTATE_I	wrpr	%r19, 0x001f, %pstate
	.word 0xf42d4000  ! 39: STB_R	stb	%r26, [%r21 + %r0]
	.word 0xfd3ca07a  ! 41: STDF_I	std	%f30, [0x007a, %r18]
	.word 0xf2258000  ! 42: STW_R	stw	%r25, [%r22 + %r0]
	.word 0xb7520000  ! 45: RDPR_PIL	rdpr	%pil, %r27
	.word 0xf824217c  ! 47: STW_I	stw	%r28, [%r16 + 0x017c]
	.word 0xb6b48000  ! 51: ORNcc_R	orncc 	%r18, %r0, %r27
	.word 0xf73ca0d5  ! 53: STDF_I	std	%f27, [0x00d5, %r18]
	mov	0, %r12
	.word 0xa1930000  ! 54: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xf0746145  ! 59: STX_I	stx	%r24, [%r17 + 0x0145]
	.word 0xb4bcc000  ! 61: XNORcc_R	xnorcc 	%r19, %r0, %r26
hwintr_3_3:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_3), 16, 16)) -> intp(3, 0, 10)
	.word 0xf02461c9  ! 64: STW_I	stw	%r24, [%r17 + 0x01c9]
	.word 0x8d952148  ! 65: WRPR_PSTATE_I	wrpr	%r20, 0x0148, %pstate
	.word 0xf22560e4  ! 68: STW_I	stw	%r25, [%r21 + 0x00e4]
	.word 0xfc3d60b0  ! 69: STD_I	std	%r30, [%r21 + 0x00b0]
	.word 0xf63ce106  ! 71: STD_I	std	%r27, [%r19 + 0x0106]
	.word 0xb52ca001  ! 72: SLL_I	sll 	%r18, 0x0001, %r26
	.word 0xb1500000  ! 74: RDPR_TPC	rdpr	%tpc, %r24
	.word 0xb3480000  ! 77: RDHPR_HPSTATE	rdhpr	%hpstate, %r25
	setx	data_start_7, %g1, %r18
	.word 0xb0952133  ! 86: ORcc_I	orcc 	%r20, 0x0133, %r24
	.word 0xb5540000  ! 91: RDPR_GL	<illegal instruction>
	.word 0xfc25a097  ! 92: STW_I	stw	%r30, [%r22 + 0x0097]
	.word 0xbd480000  ! 94: RDHPR_HPSTATE	rdhpr	%hpstate, %r30
	.word 0xf425a1c8  ! 97: STW_I	stw	%r26, [%r22 + 0x01c8]
	.word 0xf275e146  ! 99: STX_I	stx	%r25, [%r23 + 0x0146]
	.word 0xb48da151  ! 101: ANDcc_I	andcc 	%r22, 0x0151, %r26
	.word 0x819460e4  ! 102: WRPR_TPC_I	wrpr	%r17, 0x00e4, %tpc
	.word 0xfe354000  ! 104: STH_R	sth	%r31, [%r21 + %r0]
	setx	data_start_5, %g1, %r16
	.word 0xb8ac2195  ! 114: ANDNcc_I	andncc 	%r16, 0x0195, %r28
	.word 0xfb3da04d  ! 115: STDF_I	std	%f29, [0x004d, %r22]
	.word 0x8395e135  ! 117: WRPR_TNPC_I	wrpr	%r23, 0x0135, %tnpc
	.word 0xfd3d4000  ! 118: STDF_R	std	%f30, [%r0, %r21]
	.word 0xf0340000  ! 122: STH_R	sth	%r24, [%r16 + %r0]
	.word 0xbf540000  ! 123: RDPR_GL	rdpr	%-, %r31
	.word 0xb7540000  ! 124: RDPR_GL	<illegal instruction>
	.word 0x8395603e  ! 130: WRPR_TNPC_I	wrpr	%r21, 0x003e, %tnpc
	setx	data_start_3, %g1, %r19
	.word 0xf0744000  ! 137: STX_R	stx	%r24, [%r17 + %r0]
	mov	2, %r12
	.word 0x8f930000  ! 139: WRPR_TL_R	wrpr	%r12, %r0, %tl
hwintr_3_4:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_4), 16, 16)) -> intp(3, 0, 32)
	.word 0xf83da15a  ! 144: STD_I	std	%r28, [%r22 + 0x015a]
hwintr_3_5:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_5), 16, 16)) -> intp(3, 0, 31)
	.word 0x8d94e1e7  ! 153: WRPR_PSTATE_I	wrpr	%r19, 0x01e7, %pstate
	.word 0xb0a5607f  ! 156: SUBcc_I	subcc 	%r21, 0x007f, %r24
	.word 0xfa250000  ! 160: STW_R	stw	%r29, [%r20 + %r0]
	.word 0xf03ca1bf  ! 166: STD_I	std	%r24, [%r18 + 0x01bf]
	.word 0xfe2da0b1  ! 169: STB_I	stb	%r31, [%r22 + 0x00b1]
	.word 0xf634c000  ! 172: STH_R	sth	%r27, [%r19 + %r0]
	.word 0xb3540000  ! 173: RDPR_GL	rdpr	%-, %r25
hwintr_3_6:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_6), 16, 16)) -> intp(3, 0, 24)
	.word 0xf53cc000  ! 176: STDF_R	std	%f26, [%r0, %r19]
	.word 0xf33d4000  ! 177: STDF_R	std	%f25, [%r0, %r21]
	.word 0xb5520000  ! 178: RDPR_PIL	<illegal instruction>
	.word 0xfc3d6139  ! 191: STD_I	std	%r30, [%r21 + 0x0139]
	.word 0xff3c8000  ! 194: STDF_R	std	%f31, [%r0, %r18]
	.word 0x8d94a165  ! 196: WRPR_PSTATE_I	wrpr	%r18, 0x0165, %pstate
	.word 0xf0750000  ! 200: STX_R	stx	%r24, [%r20 + %r0]
	.word 0xb1518000  ! 201: RDPR_PSTATE	rdpr	%pstate, %r24
hwintr_3_7:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_7), 16, 16)) -> intp(3, 0, d)
	.word 0xf674c000  ! 208: STX_R	stx	%r27, [%r19 + %r0]
hwintr_3_8:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_8), 16, 16)) -> intp(3, 0, 1c)
	.word 0xf2754000  ! 214: STX_R	stx	%r25, [%r21 + %r0]
	.word 0xfa3c0000  ! 216: STD_R	std	%r29, [%r16 + %r0]
	.word 0xb7510000  ! 217: RDPR_TICK	<illegal instruction>
	.word 0xf8254000  ! 219: STW_R	stw	%r28, [%r21 + %r0]
	.word 0xfd3d0000  ! 223: STDF_R	std	%f30, [%r0, %r20]
	setx	0x741d8730000df49, %g1, %r10
	.word 0x819a8000  ! 225: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xf6240000  ! 228: STW_R	stw	%r27, [%r16 + %r0]
	.word 0xf8242020  ! 229: STW_I	stw	%r28, [%r16 + 0x0020]
	.word 0xf8250000  ! 230: STW_R	stw	%r28, [%r20 + %r0]
	.word 0xb405a189  ! 231: ADD_I	add 	%r22, 0x0189, %r26
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf434c000  ! 235: STH_R	sth	%r26, [%r19 + %r0]
hwintr_3_9:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_9), 16, 16)) -> intp(3, 0, 2d)
	.word 0x879461a4  ! 241: WRPR_TT_I	wrpr	%r17, 0x01a4, %tt
	.word 0xb1518000  ! 243: RDPR_PSTATE	rdpr	%pstate, %r24
	.word 0xf075c000  ! 246: STX_R	stx	%r24, [%r23 + %r0]
	.word 0xba840000  ! 250: ADDcc_R	addcc 	%r16, %r0, %r29
	.word 0x9195a19e  ! 251: WRPR_PIL_I	wrpr	%r22, 0x019e, %pil
	.word 0xfe352096  ! 252: STH_I	sth	%r31, [%r20 + 0x0096]
	.word 0xfe3dc000  ! 256: STD_R	std	%r31, [%r23 + %r0]
	.word 0x899561f9  ! 258: WRPR_TICK_I	wrpr	%r21, 0x01f9, %tick
	.word 0xbf2d0000  ! 259: SLL_R	sll 	%r20, %r0, %r31
	.word 0xfc74a154  ! 261: STX_I	stx	%r30, [%r18 + 0x0154]
hwintr_3_10:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_10), 16, 16)) -> intp(3, 0, 0)
	.word 0xfe25215b  ! 273: STW_I	stw	%r31, [%r20 + 0x015b]
	.word 0xba952134  ! 274: ORcc_I	orcc 	%r20, 0x0134, %r29
	.word 0x8394e114  ! 276: WRPR_TNPC_I	wrpr	%r19, 0x0114, %tnpc
hwintr_3_11:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_11), 16, 16)) -> intp(3, 0, 37)
	setx	data_start_3, %g1, %r19
	.word 0xfe3d4000  ! 279: STD_R	std	%r31, [%r21 + %r0]
	.word 0x8995e1ff  ! 282: WRPR_TICK_I	wrpr	%r23, 0x01ff, %tick
	.word 0x9195a0c4  ! 283: WRPR_PIL_I	wrpr	%r22, 0x00c4, %pil
	.word 0xf4756160  ! 286: STX_I	stx	%r26, [%r21 + 0x0160]
	.word 0xf53d8000  ! 287: STDF_R	std	%f26, [%r0, %r22]
	.word 0xfa744000  ! 288: STX_R	stx	%r29, [%r17 + %r0]
	.word 0xf024a15e  ! 290: STW_I	stw	%r24, [%r18 + 0x015e]
	mov	0, %r12
	.word 0xa1930000  ! 293: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb49d60c3  ! 296: XORcc_I	xorcc 	%r21, 0x00c3, %r26
	.word 0xb351c000  ! 297: RDPR_TL	rdpr	%tl, %r25
	.word 0xf874618b  ! 298: STX_I	stx	%r28, [%r17 + 0x018b]
	.word 0xf33d21c5  ! 300: STDF_I	std	%f25, [0x01c5, %r20]
	.word 0xf834c000  ! 301: STH_R	sth	%r28, [%r19 + %r0]
	.word 0xb3504000  ! 302: RDPR_TNPC	<illegal instruction>
hwintr_3_12:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_12), 16, 16)) -> intp(3, 0, 18)
	.word 0xf23c0000  ! 306: STD_R	std	%r25, [%r16 + %r0]
	.word 0xf13d616b  ! 307: STDF_I	std	%f24, [0x016b, %r21]
	.word 0x8794a04c  ! 309: WRPR_TT_I	wrpr	%r18, 0x004c, %tt
hwintr_3_13:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_13), 16, 16)) -> intp(3, 0, 18)
	.word 0xb5540000  ! 319: RDPR_GL	rdpr	%-, %r26
	.word 0xf875c000  ! 324: STX_R	stx	%r28, [%r23 + %r0]
	.word 0xfc3c4000  ! 325: STD_R	std	%r30, [%r17 + %r0]
	.word 0xbb508000  ! 328: RDPR_TSTATE	<illegal instruction>
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xf875c000  ! 331: STX_R	stx	%r28, [%r23 + %r0]
	.word 0xbe1d6106  ! 334: XOR_I	xor 	%r21, 0x0106, %r31
	.word 0x87946139  ! 335: WRPR_TT_I	wrpr	%r17, 0x0139, %tt
	.word 0xb9510000  ! 338: RDPR_TICK	rdpr	%tick, %r28
	setx	0xc7d6f5220000df53, %g1, %r10
	.word 0x839a8000  ! 339: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xfc248000  ! 340: STW_R	stw	%r30, [%r18 + %r0]
	.word 0x91942130  ! 342: WRPR_PIL_I	wrpr	%r16, 0x0130, %pil
	.word 0xb5504000  ! 344: RDPR_TNPC	rdpr	%tnpc, %r26
	.word 0xf624a090  ! 349: STW_I	stw	%r27, [%r18 + 0x0090]
	.word 0xbd540000  ! 350: RDPR_GL	<illegal instruction>
	.word 0xff3da1e2  ! 351: STDF_I	std	%f31, [0x01e2, %r22]
	setx	data_start_5, %g1, %r18
	.word 0xb751c000  ! 353: RDPR_TL	<illegal instruction>
	.word 0xfc248000  ! 360: STW_R	stw	%r30, [%r18 + %r0]
hwintr_3_14:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_14), 16, 16)) -> intp(3, 0, 38)
	.word 0x8194a138  ! 365: WRPR_TPC_I	wrpr	%r18, 0x0138, %tpc
hwintr_3_15:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_15), 16, 16)) -> intp(3, 0, 0)
	.word 0x8d956071  ! 374: WRPR_PSTATE_I	wrpr	%r21, 0x0071, %pstate
	.word 0xfa258000  ! 376: STW_R	stw	%r29, [%r22 + %r0]
	setx	0xd8606cb800007b12, %g1, %r10
	.word 0x839a8000  ! 379: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xfe3d205b  ! 383: STD_I	std	%r31, [%r20 + 0x005b]
	setx	0x937e93d700004d97, %g1, %r10
	.word 0x819a8000  ! 384: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xbd520000  ! 385: RDPR_PIL	rdpr	%pil, %r30
	.word 0x8994e084  ! 389: WRPR_TICK_I	wrpr	%r19, 0x0084, %tick
	.word 0xf63c0000  ! 395: STD_R	std	%r27, [%r16 + %r0]
	mov	0, %r12
	.word 0xa1930000  ! 399: WRPR_GL_R	wrpr	%r12, %r0, %-
hwintr_3_16:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_16), 16, 16)) -> intp(3, 0, 3d)
	.word 0x8194e089  ! 404: WRPR_TPC_I	wrpr	%r19, 0x0089, %tpc
hwintr_3_17:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_17), 16, 16)) -> intp(3, 0, 4)
	.word 0xf225e1c3  ! 407: STW_I	stw	%r25, [%r23 + 0x01c3]
	.word 0xfe24a16e  ! 408: STW_I	stw	%r31, [%r18 + 0x016e]
	.word 0xf4242084  ! 412: STW_I	stw	%r26, [%r16 + 0x0084]
	.word 0xb3643801  ! 413: MOVcc_I	<illegal instruction>
	.word 0xf8254000  ! 414: STW_R	stw	%r28, [%r21 + %r0]
hwintr_3_18:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_18), 16, 16)) -> intp(3, 0, a)
hwintr_3_19:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_19), 16, 16)) -> intp(3, 0, 17)
	.word 0xb2950000  ! 418: ORcc_R	orcc 	%r20, %r0, %r25
	.word 0xb3508000  ! 419: RDPR_TSTATE	rdpr	%tstate, %r25
	.word 0xb7540000  ! 420: RDPR_GL	<illegal instruction>
	.word 0xbf504000  ! 421: RDPR_TNPC	<illegal instruction>
	.word 0xf6358000  ! 422: STH_R	sth	%r27, [%r22 + %r0]
	.word 0xf0744000  ! 424: STX_R	stx	%r24, [%r17 + %r0]
	.word 0xf624e036  ! 425: STW_I	stw	%r27, [%r19 + 0x0036]
	.word 0xf874e045  ! 427: STX_I	stx	%r28, [%r19 + 0x0045]
	.word 0xf73c0000  ! 428: STDF_R	std	%f27, [%r0, %r16]
hwintr_3_20:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_20), 16, 16)) -> intp(3, 0, 6)
	setx	0xb8befa3300008a42, %g1, %r10
	.word 0x839a8000  ! 436: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
hwintr_3_21:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_21), 16, 16)) -> intp(3, 0, 34)
hwintr_3_22:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_22), 16, 16)) -> intp(3, 0, 16)
hwintr_3_23:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_23), 16, 16)) -> intp(3, 0, 2)
	.word 0xf075e1b9  ! 443: STX_I	stx	%r24, [%r23 + 0x01b9]
	.word 0xf2350000  ! 448: STH_R	sth	%r25, [%r20 + %r0]
	.word 0x8395e1f1  ! 449: WRPR_TNPC_I	wrpr	%r23, 0x01f1, %tnpc
	.word 0xf73d0000  ! 450: STDF_R	std	%f27, [%r0, %r20]
	.word 0xbd2c1000  ! 453: SLLX_R	sllx	%r16, %r0, %r30
	.word 0xf2758000  ! 455: STX_R	stx	%r25, [%r22 + %r0]
	.word 0xfb3d61f6  ! 457: STDF_I	std	%f29, [0x01f6, %r21]
	.word 0xb7518000  ! 458: RDPR_PSTATE	rdpr	%pstate, %r27
	.word 0xf6750000  ! 459: STX_R	stx	%r27, [%r20 + %r0]
	.word 0xf434c000  ! 460: STH_R	sth	%r26, [%r19 + %r0]
	.word 0xfc3461eb  ! 461: STH_I	sth	%r30, [%r17 + 0x01eb]
	.word 0xfe3dc000  ! 462: STD_R	std	%r31, [%r23 + %r0]
	.word 0xb3504000  ! 465: RDPR_TNPC	<illegal instruction>
	setx	0xb39b7a920000b8dd, %g1, %r10
	.word 0x839a8000  ! 466: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xff3c20a0  ! 469: STDF_I	std	%f31, [0x00a0, %r16]
	.word 0xf23dc000  ! 471: STD_R	std	%r25, [%r23 + %r0]
	.word 0xb6c5a139  ! 473: ADDCcc_I	addccc 	%r22, 0x0139, %r27
	.word 0xfc2d8000  ! 474: STB_R	stb	%r30, [%r22 + %r0]
	.word 0x819461af  ! 475: WRPR_TPC_I	wrpr	%r17, 0x01af, %tpc
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
hwintr_3_24:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_24), 16, 16)) -> intp(3, 0, 18)
	.word 0xf0252014  ! 487: STW_I	stw	%r24, [%r20 + 0x0014]
	setx	0xcd05857b00005f53, %g1, %r10
	.word 0x839a8000  ! 488: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
hwintr_3_25:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_25), 16, 16)) -> intp(3, 0, 1b)
	.word 0xf93c6006  ! 491: STDF_I	std	%f28, [0x0006, %r17]
	.word 0xfa2c2031  ! 493: STB_I	stb	%r29, [%r16 + 0x0031]
	.word 0xb0046138  ! 495: ADD_I	add 	%r17, 0x0138, %r24
	.word 0x87956186  ! 498: WRPR_TT_I	wrpr	%r21, 0x0186, %tt
hwintr_3_26:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_26), 16, 16)) -> intp(3, 0, 22)
	.word 0xfb3da1cc  ! 502: STDF_I	std	%f29, [0x01cc, %r22]
	.word 0xf074c000  ! 504: STX_R	stx	%r24, [%r19 + %r0]
	.word 0x8394a1ca  ! 507: WRPR_TNPC_I	wrpr	%r18, 0x01ca, %tnpc
	.word 0xfb3c0000  ! 508: STDF_R	std	%f29, [%r0, %r16]
	.word 0xf43d60b1  ! 516: STD_I	std	%r26, [%r21 + 0x00b1]
	.word 0xbc158000  ! 520: OR_R	or 	%r22, %r0, %r30
	.word 0xf93da187  ! 523: STDF_I	std	%f28, [0x0187, %r22]
	.word 0xf43cc000  ! 527: STD_R	std	%r26, [%r19 + %r0]
hwintr_3_27:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_27), 16, 16)) -> intp(3, 0, 14)
	.word 0xfe75a1a3  ! 530: STX_I	stx	%r31, [%r22 + 0x01a3]
	setx	data_start_2, %g1, %r16
	.word 0xf83de1e8  ! 533: STD_I	std	%r28, [%r23 + 0x01e8]
	.word 0xfa74e035  ! 535: STX_I	stx	%r29, [%r19 + 0x0035]
	.word 0xb3508000  ! 536: RDPR_TSTATE	rdpr	%tstate, %r25
	.word 0xf33c8000  ! 537: STDF_R	std	%f25, [%r0, %r18]
	.word 0xf6346137  ! 542: STH_I	sth	%r27, [%r17 + 0x0137]
	.word 0xfc24c000  ! 543: STW_R	stw	%r30, [%r19 + %r0]
hwintr_3_28:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_28), 16, 16)) -> intp(3, 0, 1a)
	.word 0xfa3d0000  ! 549: STD_R	std	%r29, [%r20 + %r0]
hwintr_3_29:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_29), 16, 16)) -> intp(3, 0, 33)
	.word 0xf075214f  ! 555: STX_I	stx	%r24, [%r20 + 0x014f]
	.word 0xf43d2194  ! 557: STD_I	std	%r26, [%r20 + 0x0194]
hwintr_3_30:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_30), 16, 16)) -> intp(3, 0, 28)
	.word 0xf6348000  ! 559: STH_R	sth	%r27, [%r18 + %r0]
	.word 0xf4254000  ! 561: STW_R	stw	%r26, [%r21 + %r0]
	.word 0xfc74e068  ! 564: STX_I	stx	%r30, [%r19 + 0x0068]
	setx	data_start_7, %g1, %r17
hwintr_3_31:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_31), 16, 16)) -> intp(3, 0, 19)
	.word 0xb350c000  ! 571: RDPR_TT	<illegal instruction>
	.word 0xbd520000  ! 572: RDPR_PIL	<illegal instruction>
	.word 0xfa740000  ! 576: STX_R	stx	%r29, [%r16 + %r0]
	.word 0xb7504000  ! 577: RDPR_TNPC	<illegal instruction>
	.word 0xbeb4c000  ! 578: SUBCcc_R	orncc 	%r19, %r0, %r31
	.word 0xf03de0c1  ! 579: STD_I	std	%r24, [%r23 + 0x00c1]
	.word 0xf53d4000  ! 583: STDF_R	std	%f26, [%r0, %r21]
	.word 0xb4340000  ! 584: ORN_R	orn 	%r16, %r0, %r26
	.word 0x8d94e012  ! 585: WRPR_PSTATE_I	wrpr	%r19, 0x0012, %pstate
	.word 0xf435e099  ! 590: STH_I	sth	%r26, [%r23 + 0x0099]
hwintr_3_32:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_32), 16, 16)) -> intp(3, 0, 1f)
	.word 0xf62d0000  ! 592: STB_R	stb	%r27, [%r20 + %r0]
	setx	0x78a926c000004b5f, %g1, %r10
	.word 0x839a8000  ! 593: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xfa3dc000  ! 596: STD_R	std	%r29, [%r23 + %r0]
	setx	0xe09214060000c8c2, %g1, %r10
	.word 0x839a8000  ! 597: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xf2248000  ! 599: STW_R	stw	%r25, [%r18 + %r0]
	.word 0xb7508000  ! 600: RDPR_TSTATE	rdpr	%tstate, %r27
	.word 0xfe34e0fc  ! 603: STH_I	sth	%r31, [%r19 + 0x00fc]
	.word 0xfc3d8000  ! 604: STD_R	std	%r30, [%r22 + %r0]
hwintr_3_33:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_33), 16, 16)) -> intp(3, 0, 1c)
	setx	data_start_0, %g1, %r21
	setx	data_start_7, %g1, %r21
	.word 0xf874c000  ! 612: STX_R	stx	%r28, [%r19 + %r0]
	.word 0xf23421cf  ! 614: STH_I	sth	%r25, [%r16 + 0x01cf]
	.word 0xf625217e  ! 615: STW_I	stw	%r27, [%r20 + 0x017e]
	.word 0xbf540000  ! 616: RDPR_GL	<illegal instruction>
hwintr_3_34:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_34), 16, 16)) -> intp(3, 0, 21)
	.word 0xf93d4000  ! 623: STDF_R	std	%f28, [%r0, %r21]
	.word 0xff3ca15a  ! 626: STDF_I	std	%f31, [0x015a, %r18]
	.word 0xb3480000  ! 628: RDHPR_HPSTATE	rdhpr	%hpstate, %r25
	.word 0xfd3c4000  ! 629: STDF_R	std	%f30, [%r0, %r17]
	.word 0xb6bc8000  ! 631: XNORcc_R	xnorcc 	%r18, %r0, %r27
hwintr_3_35:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_35), 16, 16)) -> intp(3, 0, 15)
	.word 0xf73d8000  ! 634: STDF_R	std	%f27, [%r0, %r22]
	.word 0xfb3d616e  ! 636: STDF_I	std	%f29, [0x016e, %r21]
hwintr_3_36:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_36), 16, 16)) -> intp(3, 0, 16)
	.word 0xb7641800  ! 638: MOVcc_R	<illegal instruction>
	.word 0xf03cc000  ! 639: STD_R	std	%r24, [%r19 + %r0]
	.word 0x8195e1b5  ! 641: WRPR_TPC_I	wrpr	%r23, 0x01b5, %tpc
	mov	0, %r12
	.word 0x8f930000  ! 643: WRPR_TL_R	wrpr	%r12, %r0, %tl
hwintr_3_37:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_37), 16, 16)) -> intp(3, 0, 28)
	.word 0xb61da14e  ! 647: XOR_I	xor 	%r22, 0x014e, %r27
hwintr_3_38:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_38), 16, 16)) -> intp(3, 0, e)
	mov	1, %r12
	.word 0x8f930000  ! 650: WRPR_TL_R	wrpr	%r12, %r0, %tl
hwintr_3_39:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_39), 16, 16)) -> intp(3, 0, 3b)
	.word 0xfa2dc000  ! 655: STB_R	stb	%r29, [%r23 + %r0]
hwintr_3_40:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_40), 16, 16)) -> intp(3, 0, 1e)
	.word 0xf02ce1c2  ! 662: STB_I	stb	%r24, [%r19 + 0x01c2]
	.word 0xfc3c21c4  ! 663: STD_I	std	%r30, [%r16 + 0x01c4]
	.word 0xf02de01d  ! 664: STB_I	stb	%r24, [%r23 + 0x001d]
	.word 0xf62c4000  ! 667: STB_R	stb	%r27, [%r17 + %r0]
	.word 0xf62421bc  ! 669: STW_I	stw	%r27, [%r16 + 0x01bc]
	setx	0xfc0b940500001896, %g1, %r10
	.word 0x819a8000  ! 672: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xba35c000  ! 673: SUBC_R	orn 	%r23, %r0, %r29
	.word 0xf22461bc  ! 675: STW_I	stw	%r25, [%r17 + 0x01bc]
	.word 0xf4248000  ! 676: STW_R	stw	%r26, [%r18 + %r0]
	setx	data_start_5, %g1, %r21
	.word 0xfa344000  ! 681: STH_R	sth	%r29, [%r17 + %r0]
	.word 0xfa344000  ! 684: STH_R	sth	%r29, [%r17 + %r0]
	.word 0xf634c000  ! 686: STH_R	sth	%r27, [%r19 + %r0]
	.word 0xfe344000  ! 688: STH_R	sth	%r31, [%r17 + %r0]
	mov	0, %r12
	.word 0x8f930000  ! 690: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xbf3c3001  ! 691: SRAX_I	srax	%r16, 0x0001, %r31
	.word 0x8995618d  ! 692: WRPR_TICK_I	wrpr	%r21, 0x018d, %tick
	.word 0xbb518000  ! 693: RDPR_PSTATE	rdpr	%pstate, %r29
	.word 0xfa24a004  ! 694: STW_I	stw	%r29, [%r18 + 0x0004]
hwintr_3_41:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_41), 16, 16)) -> intp(3, 0, 2)
	.word 0x879561b8  ! 699: WRPR_TT_I	wrpr	%r21, 0x01b8, %tt
hwintr_3_42:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_42), 16, 16)) -> intp(3, 0, 22)
	.word 0xf034c000  ! 703: STH_R	sth	%r24, [%r19 + %r0]
	.word 0xfb3da0a5  ! 704: STDF_I	std	%f29, [0x00a5, %r22]
	.word 0xfa356012  ! 708: STH_I	sth	%r29, [%r21 + 0x0012]
	.word 0xb93d7001  ! 709: SRAX_I	srax	%r21, 0x0001, %r28
	.word 0x8994e132  ! 713: WRPR_TICK_I	wrpr	%r19, 0x0132, %tick
hwintr_3_43:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_43), 16, 16)) -> intp(3, 0, 33)
	.word 0xf2754000  ! 719: STX_R	stx	%r25, [%r21 + %r0]
	.word 0xf2744000  ! 720: STX_R	stx	%r25, [%r17 + %r0]
	.word 0xfc25c000  ! 721: STW_R	stw	%r30, [%r23 + %r0]
	.word 0xb97c0400  ! 723: MOVR_R	movre	%r16, %r0, %r28
	.word 0xb43dc000  ! 724: XNOR_R	xnor 	%r23, %r0, %r26
	.word 0xf4240000  ! 726: STW_R	stw	%r26, [%r16 + %r0]
	.word 0xfe3cc000  ! 727: STD_R	std	%r31, [%r19 + %r0]
	.word 0xb32cc000  ! 728: SLL_R	sll 	%r19, %r0, %r25
hwintr_3_44:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_44), 16, 16)) -> intp(3, 0, 2d)
	.word 0xf73d21eb  ! 731: STDF_I	std	%f27, [0x01eb, %r20]
	.word 0xf225208f  ! 732: STW_I	stw	%r25, [%r20 + 0x008f]
	.word 0xf225a0b0  ! 736: STW_I	stw	%r25, [%r22 + 0x00b0]
	setx	0xc50a79020000399c, %g1, %r10
	.word 0x839a8000  ! 738: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xf42d0000  ! 749: STB_R	stb	%r26, [%r20 + %r0]
	.word 0xf43ce062  ! 751: STD_I	std	%r26, [%r19 + 0x0062]
hwintr_3_45:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_45), 16, 16)) -> intp(3, 0, e)
	.word 0xf634a1cb  ! 753: STH_I	sth	%r27, [%r18 + 0x01cb]
	.word 0x8995a1af  ! 755: WRPR_TICK_I	wrpr	%r22, 0x01af, %tick
	.word 0xb2aca0d0  ! 756: ANDNcc_I	andncc 	%r18, 0x00d0, %r25
	.word 0xbd540000  ! 759: RDPR_GL	rdpr	%-, %r30
	.word 0xfe750000  ! 761: STX_R	stx	%r31, [%r20 + %r0]
	.word 0xfc3d0000  ! 762: STD_R	std	%r30, [%r20 + %r0]
	.word 0xfc3c21a7  ! 764: STD_I	std	%r30, [%r16 + 0x01a7]
	.word 0xfc7460ac  ! 767: STX_I	stx	%r30, [%r17 + 0x00ac]
	.word 0xf62da032  ! 771: STB_I	stb	%r27, [%r22 + 0x0032]
	.word 0xb3510000  ! 773: RDPR_TICK	<illegal instruction>
	.word 0xbb2d5000  ! 774: SLLX_R	sllx	%r21, %r0, %r29
	mov	0, %r12
	.word 0xa1930000  ! 777: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xf02d8000  ! 778: STB_R	stb	%r24, [%r22 + %r0]
	.word 0xf4744000  ! 783: STX_R	stx	%r26, [%r17 + %r0]
	.word 0xb7504000  ! 785: RDPR_TNPC	rdpr	%tnpc, %r27
	.word 0xbb518000  ! 787: RDPR_PSTATE	<illegal instruction>
	.word 0x8595e06c  ! 790: WRPR_TSTATE_I	wrpr	%r23, 0x006c, %tstate
hwintr_3_46:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_46), 16, 16)) -> intp(3, 0, 12)
	.word 0x899521a8  ! 793: WRPR_TICK_I	wrpr	%r20, 0x01a8, %tick
	.word 0xf62de114  ! 795: STB_I	stb	%r27, [%r23 + 0x0114]
	.word 0xf83d6046  ! 796: STD_I	std	%r28, [%r21 + 0x0046]
	.word 0xfc24201e  ! 800: STW_I	stw	%r30, [%r16 + 0x001e]
	.word 0xf274e07d  ! 804: STX_I	stx	%r25, [%r19 + 0x007d]
hwintr_3_47:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_47), 16, 16)) -> intp(3, 0, 31)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb6c460cb  ! 814: ADDCcc_I	addccc 	%r17, 0x00cb, %r27
	.word 0xfd3de010  ! 815: STDF_I	std	%f30, [0x0010, %r23]
	.word 0xfa342086  ! 816: STH_I	sth	%r29, [%r16 + 0x0086]
	.word 0xbf357001  ! 818: SRLX_I	srlx	%r21, 0x0001, %r31
	mov	0, %r12
	.word 0x8f930000  ! 819: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xf82da01e  ! 820: STB_I	stb	%r28, [%r22 + 0x001e]
	.word 0xfe24c000  ! 822: STW_R	stw	%r31, [%r19 + %r0]
	.word 0xf674a1a8  ! 824: STX_I	stx	%r27, [%r18 + 0x01a8]
	.word 0xb2bcc000  ! 826: XNORcc_R	xnorcc 	%r19, %r0, %r25
	.word 0xfe2ca1ee  ! 828: STB_I	stb	%r31, [%r18 + 0x01ee]
	.word 0xf0356124  ! 833: STH_I	sth	%r24, [%r21 + 0x0124]
	.word 0xb035a0b2  ! 834: SUBC_I	orn 	%r22, 0x00b2, %r24
	.word 0xbf3ce001  ! 837: SRA_I	sra 	%r19, 0x0001, %r31
	.word 0xf224e1ad  ! 840: STW_I	stw	%r25, [%r19 + 0x01ad]
	mov	0, %r12
	.word 0x8f930000  ! 842: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xfe3c0000  ! 843: STD_R	std	%r31, [%r16 + %r0]
	.word 0xb20d6019  ! 845: AND_I	and 	%r21, 0x0019, %r25
	.word 0xfc2ce192  ! 846: STB_I	stb	%r30, [%r19 + 0x0192]
hwintr_3_48:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_48), 16, 16)) -> intp(3, 0, 2)
	.word 0xf03d8000  ! 853: STD_R	std	%r24, [%r22 + %r0]
hwintr_3_49:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_49), 16, 16)) -> intp(3, 0, 31)
hwintr_3_50:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_50), 16, 16)) -> intp(3, 0, 3c)
	.word 0xb9520000  ! 873: RDPR_PIL	rdpr	%pil, %r28
	.word 0xf33dc000  ! 879: STDF_R	std	%f25, [%r0, %r23]
	.word 0xf13d4000  ! 881: STDF_R	std	%f24, [%r0, %r21]
	.word 0xfb3d6120  ! 884: STDF_I	std	%f29, [0x0120, %r21]
	.word 0x839561bb  ! 886: WRPR_TNPC_I	wrpr	%r21, 0x01bb, %tnpc
	.word 0xfc758000  ! 888: STX_R	stx	%r30, [%r22 + %r0]
	.word 0xbd50c000  ! 890: RDPR_TT	rdpr	%tt, %r30
	.word 0xb9500000  ! 896: RDPR_TPC	<illegal instruction>
	.word 0xb23d0000  ! 899: XNOR_R	xnor 	%r20, %r0, %r25
	.word 0xfe3ca08e  ! 904: STD_I	std	%r31, [%r18 + 0x008e]
	.word 0xb2b48000  ! 905: ORNcc_R	orncc 	%r18, %r0, %r25
hwintr_3_51:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_51), 16, 16)) -> intp(3, 0, 14)
	.word 0xf274a0c7  ! 910: STX_I	stx	%r25, [%r18 + 0x00c7]
	.word 0xb950c000  ! 912: RDPR_TT	<illegal instruction>
hwintr_3_52:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_52), 16, 16)) -> intp(3, 0, 19)
	.word 0xf4754000  ! 914: STX_R	stx	%r26, [%r21 + %r0]
	.word 0x8995e06d  ! 916: WRPR_TICK_I	wrpr	%r23, 0x006d, %tick
hwintr_3_53:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_53), 16, 16)) -> intp(3, 0, 1b)
	.word 0xfd3d209f  ! 919: STDF_I	std	%f30, [0x009f, %r20]
	.word 0xb1520000  ! 921: RDPR_PIL	rdpr	%pil, %r24
	.word 0xf93c0000  ! 922: STDF_R	std	%f28, [%r0, %r16]
	.word 0xf63d0000  ! 926: STD_R	std	%r27, [%r20 + %r0]
	.word 0xb4154000  ! 935: OR_R	or 	%r21, %r0, %r26
	.word 0xbd518000  ! 936: RDPR_PSTATE	<illegal instruction>
	.word 0xf83d4000  ! 937: STD_R	std	%r28, [%r21 + %r0]
	.word 0xf23de0cf  ! 939: STD_I	std	%r25, [%r23 + 0x00cf]
	.word 0xb7520000  ! 941: RDPR_PIL	<illegal instruction>
	.word 0xfe75a0e3  ! 943: STX_I	stx	%r31, [%r22 + 0x00e3]
hwintr_3_54:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_54), 16, 16)) -> intp(3, 0, 16)
	.word 0xf62ca0ce  ! 953: STB_I	stb	%r27, [%r18 + 0x00ce]
	.word 0xf93d0000  ! 957: STDF_R	std	%f28, [%r0, %r20]
	.word 0xf03d4000  ! 962: STD_R	std	%r24, [%r21 + %r0]
	.word 0xf024c000  ! 964: STW_R	stw	%r24, [%r19 + %r0]
	setx	data_start_1, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf03d8000  ! 970: STD_R	std	%r24, [%r22 + %r0]
	.word 0xfe2c617b  ! 971: STB_I	stb	%r31, [%r17 + 0x017b]
	.word 0xbc850000  ! 974: ADDcc_R	addcc 	%r20, %r0, %r30
	.word 0xf42c60e6  ! 975: STB_I	stb	%r26, [%r17 + 0x00e6]
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb350c000  ! 979: RDPR_TT	<illegal instruction>
	.word 0xbb51c000  ! 980: RDPR_TL	<illegal instruction>
	.word 0xf22560d3  ! 990: STW_I	stw	%r25, [%r21 + 0x00d3]
	setx	data_start_6, %g1, %r19
	.word 0x879460d9  ! 995: WRPR_TT_I	wrpr	%r17, 0x00d9, %tt
	.word 0xf2340000  ! 996: STH_R	sth	%r25, [%r16 + %r0]
	.word 0xf02ca0d2  ! 997: STB_I	stb	%r24, [%r18 + 0x00d2]
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
	.word 0xfc4c21ff  ! 1: LDSB_I	ldsb	[%r16 + 0x01ff], %r30
hwintr_2_0:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_0), 16, 16)) -> intp(2, 0, 3c)
	.word 0xf005a162  ! 5: LDUW_I	lduw	[%r22 + 0x0162], %r24
	.word 0xf04d8000  ! 8: LDSB_R	ldsb	[%r22 + %r0], %r24
	.word 0xbf50c000  ! 9: RDPR_TT	<illegal instruction>
	.word 0xf2056031  ! 10: LDUW_I	lduw	[%r21 + 0x0031], %r25
	.word 0xb7356001  ! 14: SRL_I	srl 	%r21, 0x0001, %r27
	.word 0xf8150000  ! 16: LDUH_R	lduh	[%r20 + %r0], %r28
	.word 0xf255c000  ! 17: LDSH_R	ldsh	[%r23 + %r0], %r25
hwintr_2_1:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_1), 16, 16)) -> intp(2, 0, f)
	setx	data_start_3, %g1, %r16
	.word 0xf71c211c  ! 23: LDDF_I	ldd	[%r16, 0x011c], %f27
hwintr_2_2:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_2), 16, 16)) -> intp(2, 0, 32)
	.word 0x8594a0c3  ! 29: WRPR_TSTATE_I	wrpr	%r18, 0x00c3, %tstate
	.word 0xf654e0b0  ! 31: LDSH_I	ldsh	[%r19 + 0x00b0], %r27
	.word 0xf255e0f5  ! 33: LDSH_I	ldsh	[%r23 + 0x00f5], %r25
	.word 0xfa5ce1f6  ! 34: LDX_I	ldx	[%r19 + 0x01f6], %r29
	.word 0xfc5dc000  ! 35: LDX_R	ldx	[%r23 + %r0], %r30
	.word 0xf84d2139  ! 36: LDSB_I	ldsb	[%r20 + 0x0139], %r28
	.word 0x8d95606d  ! 38: WRPR_PSTATE_I	wrpr	%r21, 0x006d, %pstate
	.word 0xf80ce17c  ! 44: LDUB_I	ldub	[%r19 + 0x017c], %r28
	.word 0xb9520000  ! 45: RDPR_PIL	<illegal instruction>
	.word 0xbab58000  ! 51: ORNcc_R	orncc 	%r22, %r0, %r29
	.word 0xf85d2082  ! 52: LDX_I	ldx	[%r20 + 0x0082], %r28
	mov	0, %r12
	.word 0xa1930000  ! 54: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xf0144000  ! 58: LDUH_R	lduh	[%r17 + %r0], %r24
	.word 0xfe05e1b6  ! 60: LDUW_I	lduw	[%r23 + 0x01b6], %r31
	.word 0xbabc8000  ! 61: XNORcc_R	xnorcc 	%r18, %r0, %r29
hwintr_2_3:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_3), 16, 16)) -> intp(2, 0, a)
	.word 0x8d9521a8  ! 65: WRPR_PSTATE_I	wrpr	%r20, 0x01a8, %pstate
	.word 0xf6142042  ! 66: LDUH_I	lduh	[%r16 + 0x0042], %r27
	.word 0xf614605c  ! 70: LDUH_I	lduh	[%r17 + 0x005c], %r27
	.word 0xb72c2001  ! 72: SLL_I	sll 	%r16, 0x0001, %r27
	.word 0xfe550000  ! 73: LDSH_R	ldsh	[%r20 + %r0], %r31
	.word 0xb9500000  ! 74: RDPR_TPC	<illegal instruction>
	.word 0xb9480000  ! 77: RDHPR_HPSTATE	rdhpr	%hpstate, %r28
	.word 0xf654a1bc  ! 80: LDSH_I	ldsh	[%r18 + 0x01bc], %r27
	.word 0xfd1c6069  ! 81: LDDF_I	ldd	[%r17, 0x0069], %f30
	.word 0xfc046125  ! 82: LDUW_I	lduw	[%r17 + 0x0125], %r30
	.word 0xf41ce0bf  ! 84: LDD_I	ldd	[%r19 + 0x00bf], %r26
	setx	data_start_6, %g1, %r16
	.word 0xba94a11c  ! 86: ORcc_I	orcc 	%r18, 0x011c, %r29
	.word 0xf21c8000  ! 88: LDD_R	ldd	[%r18 + %r0], %r25
	.word 0xf05c0000  ! 90: LDX_R	ldx	[%r16 + %r0], %r24
	.word 0xbd540000  ! 91: RDPR_GL	<illegal instruction>
	.word 0xbf480000  ! 94: RDHPR_HPSTATE	rdhpr	%hpstate, %r31
	.word 0xf44c2007  ! 95: LDSB_I	ldsb	[%r16 + 0x0007], %r26
	.word 0xfc0d8000  ! 100: LDUB_R	ldub	[%r22 + %r0], %r30
	.word 0xbe8c6090  ! 101: ANDcc_I	andcc 	%r17, 0x0090, %r31
	.word 0x8195213b  ! 102: WRPR_TPC_I	wrpr	%r20, 0x013b, %tpc
	setx	data_start_6, %g1, %r19
	.word 0xf71c4000  ! 106: LDDF_R	ldd	[%r17, %r0], %f27
	.word 0xf04c4000  ! 111: LDSB_R	ldsb	[%r17 + %r0], %r24
	.word 0xbaad20b4  ! 114: ANDNcc_I	andncc 	%r20, 0x00b4, %r29
	.word 0xfe0d21cf  ! 116: LDUB_I	ldub	[%r20 + 0x01cf], %r31
	.word 0x8394e1d5  ! 117: WRPR_TNPC_I	wrpr	%r19, 0x01d5, %tnpc
	.word 0xf8454000  ! 121: LDSW_R	ldsw	[%r21 + %r0], %r28
	.word 0xbf540000  ! 123: RDPR_GL	rdpr	%-, %r31
	.word 0xb3540000  ! 124: RDPR_GL	<illegal instruction>
	.word 0xf24d204e  ! 129: LDSB_I	ldsb	[%r20 + 0x004e], %r25
	.word 0x8394213f  ! 130: WRPR_TNPC_I	wrpr	%r16, 0x013f, %tnpc
	setx	data_start_2, %g1, %r18
	.word 0xf805c000  ! 132: LDUW_R	lduw	[%r23 + %r0], %r28
	.word 0xfc1560b3  ! 133: LDUH_I	lduh	[%r21 + 0x00b3], %r30
	.word 0xf844c000  ! 134: LDSW_R	ldsw	[%r19 + %r0], %r28
	mov	0, %r12
	.word 0x8f930000  ! 139: WRPR_TL_R	wrpr	%r12, %r0, %tl
hwintr_2_4:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_4), 16, 16)) -> intp(2, 0, c)
	.word 0xfa1de17e  ! 143: LDD_I	ldd	[%r23 + 0x017e], %r29
	.word 0xf41c61d4  ! 145: LDD_I	ldd	[%r17 + 0x01d4], %r26
	.word 0xfa0d4000  ! 146: LDUB_R	ldub	[%r21 + %r0], %r29
hwintr_2_5:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_5), 16, 16)) -> intp(2, 0, b)
	.word 0xfc5ce05b  ! 151: LDX_I	ldx	[%r19 + 0x005b], %r30
	.word 0x8d95604d  ! 153: WRPR_PSTATE_I	wrpr	%r21, 0x004d, %pstate
	.word 0xf40d0000  ! 154: LDUB_R	ldub	[%r20 + %r0], %r26
	.word 0xb8a5e017  ! 156: SUBcc_I	subcc 	%r23, 0x0017, %r28
	.word 0xf64de0ce  ! 158: LDSB_I	ldsb	[%r23 + 0x00ce], %r27
	.word 0xfc1ce08f  ! 165: LDD_I	ldd	[%r19 + 0x008f], %r30
	.word 0xb1540000  ! 173: RDPR_GL	<illegal instruction>
hwintr_2_6:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_6), 16, 16)) -> intp(2, 0, a)
	.word 0xf854e184  ! 175: LDSH_I	ldsh	[%r19 + 0x0184], %r28
	.word 0xb1520000  ! 178: RDPR_PIL	<illegal instruction>
	.word 0xfa1d2158  ! 187: LDD_I	ldd	[%r20 + 0x0158], %r29
	.word 0xf00c8000  ! 188: LDUB_R	ldub	[%r18 + %r0], %r24
	.word 0xfc0de112  ! 189: LDUB_I	ldub	[%r23 + 0x0112], %r30
	.word 0xfa04e09e  ! 190: LDUW_I	lduw	[%r19 + 0x009e], %r29
	.word 0x8d942096  ! 196: WRPR_PSTATE_I	wrpr	%r16, 0x0096, %pstate
	.word 0xf6148000  ! 198: LDUH_R	lduh	[%r18 + %r0], %r27
	.word 0xfc5ce1a7  ! 199: LDX_I	ldx	[%r19 + 0x01a7], %r30
	.word 0xb3518000  ! 201: RDPR_PSTATE	<illegal instruction>
hwintr_2_7:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_7), 16, 16)) -> intp(2, 0, 12)
hwintr_2_8:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_8), 16, 16)) -> intp(2, 0, 2f)
	.word 0xf404e13b  ! 212: LDUW_I	lduw	[%r19 + 0x013b], %r26
	.word 0xfb1d8000  ! 213: LDDF_R	ldd	[%r22, %r0], %f29
	.word 0xb3510000  ! 217: RDPR_TICK	<illegal instruction>
	.word 0xfa1cc000  ! 218: LDD_R	ldd	[%r19 + %r0], %r29
	.word 0xfc4d8000  ! 220: LDSB_R	ldsb	[%r22 + %r0], %r30
	.word 0xfe4c60dc  ! 221: LDSB_I	ldsb	[%r17 + 0x00dc], %r31
	setx	0x8f8239b60000c913, %g1, %r10
	.word 0x819a8000  ! 225: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xf41cc000  ! 226: LDD_R	ldd	[%r19 + %r0], %r26
	.word 0xb00561ab  ! 231: ADD_I	add 	%r21, 0x01ab, %r24
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
hwintr_2_9:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_9), 16, 16)) -> intp(2, 0, 20)
	.word 0x8794a197  ! 241: WRPR_TT_I	wrpr	%r18, 0x0197, %tt
	.word 0xb7518000  ! 243: RDPR_PSTATE	<illegal instruction>
	.word 0xf00d206c  ! 244: LDUB_I	ldub	[%r20 + 0x006c], %r24
	.word 0xfe1ce096  ! 247: LDD_I	ldd	[%r19 + 0x0096], %r31
	.word 0xf04c2095  ! 249: LDSB_I	ldsb	[%r16 + 0x0095], %r24
	.word 0xbc858000  ! 250: ADDcc_R	addcc 	%r22, %r0, %r30
	.word 0x9194e160  ! 251: WRPR_PIL_I	wrpr	%r19, 0x0160, %pil
	.word 0x8994e0d3  ! 258: WRPR_TICK_I	wrpr	%r19, 0x00d3, %tick
	.word 0xb92c8000  ! 259: SLL_R	sll 	%r18, %r0, %r28
hwintr_2_10:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_10), 16, 16)) -> intp(2, 0, 16)
	.word 0xf25c21c4  ! 271: LDX_I	ldx	[%r16 + 0x01c4], %r25
	.word 0xbc956068  ! 274: ORcc_I	orcc 	%r21, 0x0068, %r30
	.word 0xf40c0000  ! 275: LDUB_R	ldub	[%r16 + %r0], %r26
	.word 0x8394e1d5  ! 276: WRPR_TNPC_I	wrpr	%r19, 0x01d5, %tnpc
hwintr_2_11:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_11), 16, 16)) -> intp(2, 0, 39)
	setx	data_start_6, %g1, %r21
	.word 0x8995a064  ! 282: WRPR_TICK_I	wrpr	%r22, 0x0064, %tick
	.word 0x91942135  ! 283: WRPR_PIL_I	wrpr	%r16, 0x0135, %pil
	mov	2, %r12
	.word 0xa1930000  ! 293: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xf84c4000  ! 294: LDSB_R	ldsb	[%r17 + %r0], %r28
	.word 0xb69ca1bd  ! 296: XORcc_I	xorcc 	%r18, 0x01bd, %r27
	.word 0xb151c000  ! 297: RDPR_TL	<illegal instruction>
	.word 0xf204c000  ! 299: LDUW_R	lduw	[%r19 + %r0], %r25
	.word 0xbd504000  ! 302: RDPR_TNPC	<illegal instruction>
hwintr_2_12:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_12), 16, 16)) -> intp(2, 0, 2e)
	.word 0xf005a0db  ! 305: LDUW_I	lduw	[%r22 + 0x00db], %r24
	.word 0x879520ed  ! 309: WRPR_TT_I	wrpr	%r20, 0x00ed, %tt
	.word 0xf81d8000  ! 311: LDD_R	ldd	[%r22 + %r0], %r28
	.word 0xf44c21c1  ! 315: LDSB_I	ldsb	[%r16 + 0x01c1], %r26
	.word 0xf65c4000  ! 316: LDX_R	ldx	[%r17 + %r0], %r27
hwintr_2_13:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_13), 16, 16)) -> intp(2, 0, 19)
	.word 0xb7540000  ! 319: RDPR_GL	<illegal instruction>
	.word 0xfd1c8000  ! 320: LDDF_R	ldd	[%r18, %r0], %f30
	.word 0xf60c0000  ! 321: LDUB_R	ldub	[%r16 + %r0], %r27
	.word 0xf24c4000  ! 322: LDSB_R	ldsb	[%r17 + %r0], %r25
	.word 0xb3508000  ! 328: RDPR_TSTATE	<illegal instruction>
	.word 0xfa040000  ! 329: LDUW_R	lduw	[%r16 + %r0], %r29
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xf2140000  ! 332: LDUH_R	lduh	[%r16 + %r0], %r25
	.word 0xb81de0b8  ! 334: XOR_I	xor 	%r23, 0x00b8, %r28
	.word 0x87952138  ! 335: WRPR_TT_I	wrpr	%r20, 0x0138, %tt
	.word 0xfe148000  ! 336: LDUH_R	lduh	[%r18 + %r0], %r31
	.word 0xb1510000  ! 338: RDPR_TICK	<illegal instruction>
	setx	0x4b5408bd0000ea50, %g1, %r10
	.word 0x839a8000  ! 339: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xf05d8000  ! 341: LDX_R	ldx	[%r22 + %r0], %r24
	.word 0x91952122  ! 342: WRPR_PIL_I	wrpr	%r20, 0x0122, %pil
	.word 0xbb504000  ! 344: RDPR_TNPC	<illegal instruction>
	.word 0xfa4c61d1  ! 346: LDSB_I	ldsb	[%r17 + 0x01d1], %r29
	.word 0xb7540000  ! 350: RDPR_GL	<illegal instruction>
	setx	data_start_2, %g1, %r21
	.word 0xbb51c000  ! 353: RDPR_TL	<illegal instruction>
	.word 0xf605a1a7  ! 355: LDUW_I	lduw	[%r22 + 0x01a7], %r27
	.word 0xfe154000  ! 356: LDUH_R	lduh	[%r21 + %r0], %r31
	.word 0xf21d215d  ! 359: LDD_I	ldd	[%r20 + 0x015d], %r25
hwintr_2_14:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_14), 16, 16)) -> intp(2, 0, 27)
	.word 0xf215e050  ! 362: LDUH_I	lduh	[%r23 + 0x0050], %r25
	.word 0xf20c60d6  ! 364: LDUB_I	ldub	[%r17 + 0x00d6], %r25
	.word 0x8194607a  ! 365: WRPR_TPC_I	wrpr	%r17, 0x007a, %tpc
	.word 0xf81c8000  ! 366: LDD_R	ldd	[%r18 + %r0], %r28
	.word 0xf00561b3  ! 367: LDUW_I	lduw	[%r21 + 0x01b3], %r24
	.word 0xfc1d61a8  ! 368: LDD_I	ldd	[%r21 + 0x01a8], %r30
hwintr_2_15:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_15), 16, 16)) -> intp(2, 0, 30)
	.word 0xfb1cc000  ! 373: LDDF_R	ldd	[%r19, %r0], %f29
	.word 0x8d956072  ! 374: WRPR_PSTATE_I	wrpr	%r21, 0x0072, %pstate
	setx	0xa85259a900009dc7, %g1, %r10
	.word 0x839a8000  ! 379: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xf61dc000  ! 382: LDD_R	ldd	[%r23 + %r0], %r27
	setx	0x5ef1ba1500004d11, %g1, %r10
	.word 0x819a8000  ! 384: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xbf520000  ! 385: RDPR_PIL	<illegal instruction>
	.word 0xf31d8000  ! 386: LDDF_R	ldd	[%r22, %r0], %f25
	.word 0x8994e1e9  ! 389: WRPR_TICK_I	wrpr	%r19, 0x01e9, %tick
	.word 0xf8558000  ! 391: LDSH_R	ldsh	[%r22 + %r0], %r28
	.word 0xfc4d4000  ! 393: LDSB_R	ldsb	[%r21 + %r0], %r30
	mov	0, %r12
	.word 0xa1930000  ! 399: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xfc0dc000  ! 401: LDUB_R	ldub	[%r23 + %r0], %r30
hwintr_2_16:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_16), 16, 16)) -> intp(2, 0, 29)
	.word 0x8195a16c  ! 404: WRPR_TPC_I	wrpr	%r22, 0x016c, %tpc
hwintr_2_17:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_17), 16, 16)) -> intp(2, 0, 12)
	.word 0xf71d8000  ! 409: LDDF_R	ldd	[%r22, %r0], %f27
	.word 0xb7643801  ! 413: MOVcc_I	<illegal instruction>
hwintr_2_18:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_18), 16, 16)) -> intp(2, 0, 2)
hwintr_2_19:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_19), 16, 16)) -> intp(2, 0, 34)
	.word 0xb0950000  ! 418: ORcc_R	orcc 	%r20, %r0, %r24
	.word 0xb1508000  ! 419: RDPR_TSTATE	<illegal instruction>
	.word 0xb1540000  ! 420: RDPR_GL	<illegal instruction>
	.word 0xb5504000  ! 421: RDPR_TNPC	<illegal instruction>
	.word 0xfa14c000  ! 423: LDUH_R	lduh	[%r19 + %r0], %r29
	.word 0xff1c6170  ! 431: LDDF_I	ldd	[%r17, 0x0170], %f31
	.word 0xfa054000  ! 432: LDUW_R	lduw	[%r21 + %r0], %r29
hwintr_2_20:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_20), 16, 16)) -> intp(2, 0, 19)
	setx	0x406cdd8500008845, %g1, %r10
	.word 0x839a8000  ! 436: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
hwintr_2_21:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_21), 16, 16)) -> intp(2, 0, 27)
	.word 0xf45cc000  ! 438: LDX_R	ldx	[%r19 + %r0], %r26
	.word 0xf85da1b8  ! 439: LDX_I	ldx	[%r22 + 0x01b8], %r28
hwintr_2_22:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_22), 16, 16)) -> intp(2, 0, 2a)
hwintr_2_23:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_23), 16, 16)) -> intp(2, 0, 3e)
	.word 0xfa444000  ! 442: LDSW_R	ldsw	[%r17 + %r0], %r29
	.word 0xfa44e060  ! 447: LDSW_I	ldsw	[%r19 + 0x0060], %r29
	.word 0x8394207e  ! 449: WRPR_TNPC_I	wrpr	%r16, 0x007e, %tnpc
	.word 0xb92c1000  ! 453: SLLX_R	sllx	%r16, %r0, %r28
	.word 0xf044e029  ! 454: LDSW_I	ldsw	[%r19 + 0x0029], %r24
	.word 0xbb518000  ! 458: RDPR_PSTATE	<illegal instruction>
	.word 0xf2556188  ! 464: LDSH_I	ldsh	[%r21 + 0x0188], %r25
	.word 0xb5504000  ! 465: RDPR_TNPC	<illegal instruction>
	setx	0x83e19dfd00003e5c, %g1, %r10
	.word 0x839a8000  ! 466: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xf405c000  ! 467: LDUW_R	lduw	[%r23 + %r0], %r26
	.word 0xb2c460e4  ! 473: ADDCcc_I	addccc 	%r17, 0x00e4, %r25
	.word 0x8194e0ff  ! 475: WRPR_TPC_I	wrpr	%r19, 0x00ff, %tpc
	.word 0xf0150000  ! 478: LDUH_R	lduh	[%r20 + %r0], %r24
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xfa1d20b8  ! 482: LDD_I	ldd	[%r20 + 0x00b8], %r29
	.word 0xf51de18d  ! 483: LDDF_I	ldd	[%r23, 0x018d], %f26
hwintr_2_24:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_24), 16, 16)) -> intp(2, 0, 5)
	setx	0xbaeed52c00003f4d, %g1, %r10
	.word 0x839a8000  ! 488: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xfe0ce0a5  ! 489: LDUB_I	ldub	[%r19 + 0x00a5], %r31
hwintr_2_25:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_25), 16, 16)) -> intp(2, 0, f)
	.word 0xb005618f  ! 495: ADD_I	add 	%r21, 0x018f, %r24
	.word 0xf05de15d  ! 497: LDX_I	ldx	[%r23 + 0x015d], %r24
	.word 0x8795a19c  ! 498: WRPR_TT_I	wrpr	%r22, 0x019c, %tt
hwintr_2_26:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_26), 16, 16)) -> intp(2, 0, 3a)
	.word 0xfc152048  ! 503: LDUH_I	lduh	[%r20 + 0x0048], %r30
	.word 0x8395a155  ! 507: WRPR_TNPC_I	wrpr	%r22, 0x0155, %tnpc
	.word 0xf854210e  ! 510: LDSH_I	ldsh	[%r16 + 0x010e], %r28
	.word 0xf845a06b  ! 513: LDSW_I	ldsw	[%r22 + 0x006b], %r28
	.word 0xf25ca001  ! 515: LDX_I	ldx	[%r18 + 0x0001], %r25
	.word 0xf6456167  ! 519: LDSW_I	ldsw	[%r21 + 0x0167], %r27
	.word 0xb4148000  ! 520: OR_R	or 	%r18, %r0, %r26
hwintr_2_27:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_27), 16, 16)) -> intp(2, 0, 2c)
	.word 0xfc0da134  ! 529: LDUB_I	ldub	[%r22 + 0x0134], %r30
	setx	data_start_5, %g1, %r23
	.word 0xbd508000  ! 536: RDPR_TSTATE	<illegal instruction>
	.word 0xf65d0000  ! 539: LDX_R	ldx	[%r20 + %r0], %r27
	.word 0xfe0c0000  ! 541: LDUB_R	ldub	[%r16 + %r0], %r31
hwintr_2_28:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_28), 16, 16)) -> intp(2, 0, 30)
	.word 0xf65c21dc  ! 548: LDX_I	ldx	[%r16 + 0x01dc], %r27
hwintr_2_29:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_29), 16, 16)) -> intp(2, 0, 28)
	.word 0xf24de073  ! 552: LDSB_I	ldsb	[%r23 + 0x0073], %r25
	.word 0xf31ce0b1  ! 554: LDDF_I	ldd	[%r19, 0x00b1], %f25
hwintr_2_30:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_30), 16, 16)) -> intp(2, 0, b)
	.word 0xf71d0000  ! 560: LDDF_R	ldd	[%r20, %r0], %f27
	.word 0xf20d4000  ! 565: LDUB_R	ldub	[%r21 + %r0], %r25
	setx	data_start_3, %g1, %r17
hwintr_2_31:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_31), 16, 16)) -> intp(2, 0, 12)
	.word 0xf40ca05a  ! 568: LDUB_I	ldub	[%r18 + 0x005a], %r26
	.word 0xf215c000  ! 569: LDUH_R	lduh	[%r23 + %r0], %r25
	.word 0xb550c000  ! 571: RDPR_TT	<illegal instruction>
	.word 0xb1520000  ! 572: RDPR_PIL	<illegal instruction>
	.word 0xf11d8000  ! 575: LDDF_R	ldd	[%r22, %r0], %f24
	.word 0xb7504000  ! 577: RDPR_TNPC	<illegal instruction>
	.word 0xb6b5c000  ! 578: SUBCcc_R	orncc 	%r23, %r0, %r27
	.word 0xfc0d6125  ! 581: LDUB_I	ldub	[%r21 + 0x0125], %r30
	.word 0xf31c4000  ! 582: LDDF_R	ldd	[%r17, %r0], %f25
	.word 0xb6354000  ! 584: ORN_R	orn 	%r21, %r0, %r27
	.word 0x8d942025  ! 585: WRPR_PSTATE_I	wrpr	%r16, 0x0025, %pstate
	.word 0xf41d0000  ! 586: LDD_R	ldd	[%r20 + %r0], %r26
	.word 0xf04d8000  ! 587: LDSB_R	ldsb	[%r22 + %r0], %r24
	.word 0xf04d0000  ! 589: LDSB_R	ldsb	[%r20 + %r0], %r24
hwintr_2_32:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_32), 16, 16)) -> intp(2, 0, 39)
	setx	0x89f7eaf200004fce, %g1, %r10
	.word 0x839a8000  ! 593: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	setx	0xa8c999040000acd5, %g1, %r10
	.word 0x839a8000  ! 597: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xf80c0000  ! 598: LDUB_R	ldub	[%r16 + %r0], %r28
	.word 0xb1508000  ! 600: RDPR_TSTATE	<illegal instruction>
	.word 0xf24c4000  ! 601: LDSB_R	ldsb	[%r17 + %r0], %r25
	.word 0xfc55e0ee  ! 605: LDSH_I	ldsh	[%r23 + 0x00ee], %r30
hwintr_2_33:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_33), 16, 16)) -> intp(2, 0, 26)
	setx	data_start_4, %g1, %r19
	setx	data_start_0, %g1, %r18
	.word 0xfe554000  ! 611: LDSH_R	ldsh	[%r21 + %r0], %r31
	.word 0xb7540000  ! 616: RDPR_GL	<illegal instruction>
	.word 0xf015e06d  ! 618: LDUH_I	lduh	[%r23 + 0x006d], %r24
	.word 0xf25da0d0  ! 619: LDX_I	ldx	[%r22 + 0x00d0], %r25
	.word 0xfe0c61bb  ! 621: LDUB_I	ldub	[%r17 + 0x01bb], %r31
hwintr_2_34:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_34), 16, 16)) -> intp(2, 0, 2d)
	.word 0xf85c8000  ! 625: LDX_R	ldx	[%r18 + %r0], %r28
	.word 0xb3480000  ! 628: RDHPR_HPSTATE	rdhpr	%hpstate, %r25
	.word 0xfe5cc000  ! 630: LDX_R	ldx	[%r19 + %r0], %r31
	.word 0xb4bd4000  ! 631: XNORcc_R	xnorcc 	%r21, %r0, %r26
	.word 0xfe1d0000  ! 632: LDD_R	ldd	[%r20 + %r0], %r31
hwintr_2_35:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_35), 16, 16)) -> intp(2, 0, 12)
	.word 0xfa556043  ! 635: LDSH_I	ldsh	[%r21 + 0x0043], %r29
hwintr_2_36:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_36), 16, 16)) -> intp(2, 0, 2c)
	.word 0xb7641800  ! 638: MOVcc_R	<illegal instruction>
	.word 0x8194a078  ! 641: WRPR_TPC_I	wrpr	%r18, 0x0078, %tpc
	mov	1, %r12
	.word 0x8f930000  ! 643: WRPR_TL_R	wrpr	%r12, %r0, %tl
hwintr_2_37:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_37), 16, 16)) -> intp(2, 0, 15)
	.word 0xf045c000  ! 645: LDSW_R	ldsw	[%r23 + %r0], %r24
	.word 0xf81d0000  ! 646: LDD_R	ldd	[%r20 + %r0], %r28
	.word 0xbe1c21b2  ! 647: XOR_I	xor 	%r16, 0x01b2, %r31
hwintr_2_38:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_38), 16, 16)) -> intp(2, 0, 36)
	mov	0, %r12
	.word 0x8f930000  ! 650: WRPR_TL_R	wrpr	%r12, %r0, %tl
hwintr_2_39:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_39), 16, 16)) -> intp(2, 0, 2a)
	.word 0xf85ca1b5  ! 654: LDX_I	ldx	[%r18 + 0x01b5], %r28
	.word 0xf65da1d0  ! 656: LDX_I	ldx	[%r22 + 0x01d0], %r27
	.word 0xf20dc000  ! 657: LDUB_R	ldub	[%r23 + %r0], %r25
hwintr_2_40:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_40), 16, 16)) -> intp(2, 0, 8)
	.word 0xf00dc000  ! 659: LDUB_R	ldub	[%r23 + %r0], %r24
	.word 0xf254a14f  ! 665: LDSH_I	ldsh	[%r18 + 0x014f], %r25
	.word 0xf40de074  ! 671: LDUB_I	ldub	[%r23 + 0x0074], %r26
	setx	0xb48476000002a1f, %g1, %r10
	.word 0x819a8000  ! 672: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xba354000  ! 673: SUBC_R	orn 	%r21, %r0, %r29
	.word 0xf244c000  ! 678: LDSW_R	ldsw	[%r19 + %r0], %r25
	setx	data_start_0, %g1, %r23
	.word 0xfa4d8000  ! 682: LDSB_R	ldsb	[%r22 + %r0], %r29
	.word 0xfc5c6176  ! 687: LDX_I	ldx	[%r17 + 0x0176], %r30
	mov	0, %r12
	.word 0x8f930000  ! 690: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xbf3d3001  ! 691: SRAX_I	srax	%r20, 0x0001, %r31
	.word 0x8995e1e7  ! 692: WRPR_TICK_I	wrpr	%r23, 0x01e7, %tick
	.word 0xb3518000  ! 693: RDPR_PSTATE	<illegal instruction>
	.word 0xf21d0000  ! 695: LDD_R	ldd	[%r20 + %r0], %r25
hwintr_2_41:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_41), 16, 16)) -> intp(2, 0, c)
	.word 0x8795e0f6  ! 699: WRPR_TT_I	wrpr	%r23, 0x00f6, %tt
hwintr_2_42:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_42), 16, 16)) -> intp(2, 0, 1)
	.word 0xf005c000  ! 707: LDUW_R	lduw	[%r23 + %r0], %r24
	.word 0xbf3cf001  ! 709: SRAX_I	srax	%r19, 0x0001, %r31
	.word 0x8994e158  ! 713: WRPR_TICK_I	wrpr	%r19, 0x0158, %tick
	.word 0xf6158000  ! 714: LDUH_R	lduh	[%r22 + %r0], %r27
	.word 0xf0148000  ! 715: LDUH_R	lduh	[%r18 + %r0], %r24
	.word 0xf6148000  ! 716: LDUH_R	lduh	[%r18 + %r0], %r27
	.word 0xfb1c8000  ! 717: LDDF_R	ldd	[%r18, %r0], %f29
hwintr_2_43:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_43), 16, 16)) -> intp(2, 0, 24)
	.word 0xb37d0400  ! 723: MOVR_R	movre	%r20, %r0, %r25
	.word 0xb63d4000  ! 724: XNOR_R	xnor 	%r21, %r0, %r27
	.word 0xb52d8000  ! 728: SLL_R	sll 	%r22, %r0, %r26
hwintr_2_44:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_44), 16, 16)) -> intp(2, 0, e)
	.word 0xfa05603e  ! 733: LDUW_I	lduw	[%r21 + 0x003e], %r29
	.word 0xf41dc000  ! 735: LDD_R	ldd	[%r23 + %r0], %r26
	.word 0xfc55c000  ! 737: LDSH_R	ldsh	[%r23 + %r0], %r30
	setx	0x71f44f2500008c8b, %g1, %r10
	.word 0x839a8000  ! 738: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xf615a14d  ! 740: LDUH_I	lduh	[%r22 + 0x014d], %r27
	.word 0xfe5d8000  ! 742: LDX_R	ldx	[%r22 + %r0], %r31
	.word 0xfc5d8000  ! 743: LDX_R	ldx	[%r22 + %r0], %r30
	.word 0xfa45c000  ! 746: LDSW_R	ldsw	[%r23 + %r0], %r29
hwintr_2_45:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_45), 16, 16)) -> intp(2, 0, 25)
	.word 0x899521e5  ! 755: WRPR_TICK_I	wrpr	%r20, 0x01e5, %tick
	.word 0xb8ada0fe  ! 756: ANDNcc_I	andncc 	%r22, 0x00fe, %r28
	.word 0xbb540000  ! 759: RDPR_GL	<illegal instruction>
	.word 0xfd1d8000  ! 763: LDDF_R	ldd	[%r22, %r0], %f30
	.word 0xb3510000  ! 773: RDPR_TICK	<illegal instruction>
	.word 0xb12d1000  ! 774: SLLX_R	sllx	%r20, %r0, %r24
	mov	0, %r12
	.word 0xa1930000  ! 777: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xf04c8000  ! 782: LDSB_R	ldsb	[%r18 + %r0], %r24
	.word 0xbb504000  ! 785: RDPR_TNPC	<illegal instruction>
	.word 0xf20c8000  ! 786: LDUB_R	ldub	[%r18 + %r0], %r25
	.word 0xb5518000  ! 787: RDPR_PSTATE	<illegal instruction>
	.word 0x859420c5  ! 790: WRPR_TSTATE_I	wrpr	%r16, 0x00c5, %tstate
hwintr_2_46:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_46), 16, 16)) -> intp(2, 0, 2e)
	.word 0x899420a0  ! 793: WRPR_TICK_I	wrpr	%r16, 0x00a0, %tick
	.word 0xfa048000  ! 794: LDUW_R	lduw	[%r18 + %r0], %r29
	.word 0xfc45a08b  ! 797: LDSW_I	ldsw	[%r22 + 0x008b], %r30
	.word 0xf01de17c  ! 799: LDD_I	ldd	[%r23 + 0x017c], %r24
	.word 0xf65c8000  ! 806: LDX_R	ldx	[%r18 + %r0], %r27
hwintr_2_47:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_47), 16, 16)) -> intp(2, 0, c)
	.word 0xf80d0000  ! 808: LDUB_R	ldub	[%r20 + %r0], %r28
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbac5a0ff  ! 814: ADDCcc_I	addccc 	%r22, 0x00ff, %r29
	.word 0xb335b001  ! 818: SRLX_I	srlx	%r22, 0x0001, %r25
	mov	1, %r12
	.word 0x8f930000  ! 819: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xbebd0000  ! 826: XNORcc_R	xnorcc 	%r20, %r0, %r31
	.word 0xfe5c8000  ! 827: LDX_R	ldx	[%r18 + %r0], %r31
	.word 0xb434604e  ! 834: SUBC_I	orn 	%r17, 0x004e, %r26
	.word 0xf40c2145  ! 835: LDUB_I	ldub	[%r16 + 0x0145], %r26
	.word 0xb73da001  ! 837: SRA_I	sra 	%r22, 0x0001, %r27
	mov	2, %r12
	.word 0x8f930000  ! 842: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xba0d21a3  ! 845: AND_I	and 	%r20, 0x01a3, %r29
	.word 0xf655a15a  ! 847: LDSH_I	ldsh	[%r22 + 0x015a], %r27
hwintr_2_48:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_48), 16, 16)) -> intp(2, 0, 33)
	.word 0xf215e088  ! 850: LDUH_I	lduh	[%r23 + 0x0088], %r25
	.word 0xf2048000  ! 857: LDUW_R	lduw	[%r18 + %r0], %r25
	.word 0xf41da0bf  ! 858: LDD_I	ldd	[%r22 + 0x00bf], %r26
hwintr_2_49:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_49), 16, 16)) -> intp(2, 0, 8)
	.word 0xf41c61f5  ! 861: LDD_I	ldd	[%r17 + 0x01f5], %r26
	.word 0xfa5ce05f  ! 862: LDX_I	ldx	[%r19 + 0x005f], %r29
	.word 0xfe1c8000  ! 867: LDD_R	ldd	[%r18 + %r0], %r31
	.word 0xf21da184  ! 868: LDD_I	ldd	[%r22 + 0x0184], %r25
	.word 0xf91ce1ad  ! 869: LDDF_I	ldd	[%r19, 0x01ad], %f28
hwintr_2_50:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_50), 16, 16)) -> intp(2, 0, 24)
	.word 0xfc4ce0c4  ! 872: LDSB_I	ldsb	[%r19 + 0x00c4], %r30
	.word 0xb7520000  ! 873: RDPR_PIL	<illegal instruction>
	.word 0xf31da11a  ! 874: LDDF_I	ldd	[%r22, 0x011a], %f25
	.word 0xfe4421ef  ! 885: LDSW_I	ldsw	[%r16 + 0x01ef], %r31
	.word 0x8394e00e  ! 886: WRPR_TNPC_I	wrpr	%r19, 0x000e, %tnpc
	.word 0xbd50c000  ! 890: RDPR_TT	<illegal instruction>
	.word 0xf40cc000  ! 893: LDUB_R	ldub	[%r19 + %r0], %r26
	.word 0xf61c8000  ! 894: LDD_R	ldd	[%r18 + %r0], %r27
	.word 0xb1500000  ! 896: RDPR_TPC	<illegal instruction>
	.word 0xb63c4000  ! 899: XNOR_R	xnor 	%r17, %r0, %r27
	.word 0xfc0cc000  ! 902: LDUB_R	ldub	[%r19 + %r0], %r30
	.word 0xbab44000  ! 905: ORNcc_R	orncc 	%r17, %r0, %r29
hwintr_2_51:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_51), 16, 16)) -> intp(2, 0, 35)
	.word 0xb550c000  ! 912: RDPR_TT	<illegal instruction>
hwintr_2_52:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_52), 16, 16)) -> intp(2, 0, 2)
	.word 0x8995a12f  ! 916: WRPR_TICK_I	wrpr	%r22, 0x012f, %tick
hwintr_2_53:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_53), 16, 16)) -> intp(2, 0, 19)
	.word 0xb3520000  ! 921: RDPR_PIL	<illegal instruction>
	.word 0xfa0d4000  ! 924: LDUB_R	ldub	[%r21 + %r0], %r29
	.word 0xf4444000  ! 925: LDSW_R	ldsw	[%r17 + %r0], %r26
	.word 0xfd1d4000  ! 930: LDDF_R	ldd	[%r21, %r0], %f30
	.word 0xf2058000  ! 931: LDUW_R	lduw	[%r22 + %r0], %r25
	.word 0xfe45202f  ! 932: LDSW_I	ldsw	[%r20 + 0x002f], %r31
	.word 0xf01d0000  ! 934: LDD_R	ldd	[%r20 + %r0], %r24
	.word 0xb8148000  ! 935: OR_R	or 	%r18, %r0, %r28
	.word 0xb5518000  ! 936: RDPR_PSTATE	<illegal instruction>
	.word 0xf844a080  ! 938: LDSW_I	ldsw	[%r18 + 0x0080], %r28
	.word 0xb9520000  ! 941: RDPR_PIL	<illegal instruction>
hwintr_2_54:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_54), 16, 16)) -> intp(2, 0, 25)
	.word 0xf0554000  ! 956: LDSH_R	ldsh	[%r21 + %r0], %r24
	setx	data_start_6, %g1, %r22
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf45d213d  ! 972: LDX_I	ldx	[%r20 + 0x013d], %r26
	.word 0xf844c000  ! 973: LDSW_R	ldsw	[%r19 + %r0], %r28
	.word 0xba84c000  ! 974: ADDcc_R	addcc 	%r19, %r0, %r29
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf05c203b  ! 978: LDX_I	ldx	[%r16 + 0x003b], %r24
	.word 0xb750c000  ! 979: RDPR_TT	<illegal instruction>
	.word 0xb151c000  ! 980: RDPR_TL	<illegal instruction>
	.word 0xfe1cc000  ! 984: LDD_R	ldd	[%r19 + %r0], %r31
	.word 0xf40d4000  ! 985: LDUB_R	ldub	[%r21 + %r0], %r26
	.word 0xf2156089  ! 992: LDUH_I	lduh	[%r21 + 0x0089], %r25
	.word 0xf00421dd  ! 993: LDUW_I	lduw	[%r16 + 0x01dd], %r24
	setx	data_start_7, %g1, %r19
	.word 0x8794e07c  ! 995: WRPR_TT_I	wrpr	%r19, 0x007c, %tt
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_1:
	.word 0xb9a80820  ! 3: FMOVN	fmovs	%fcc1, %f0, %f28
hwintr_1_0:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_0), 16, 16)) -> intp(1, 0, 5)
	.word 0xb350c000  ! 9: RDPR_TT	<illegal instruction>
	.word 0xb9a00540  ! 11: FSQRTd	fsqrt	
	.word 0xb9ab4820  ! 12: FMOVCC	fmovs	%fcc1, %f0, %f28
	.word 0xb3a81c20  ! 13: FMOVRGEZ	dis not found

	.word 0xb1356001  ! 14: SRL_I	srl 	%r21, 0x0001, %r24
	.word 0xb9a589a0  ! 19: FDIVs	fdivs	%f22, %f0, %f28
hwintr_1_1:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_1), 16, 16)) -> intp(1, 0, 37)
	setx	data_start_2, %g1, %r19
	.word 0xb9a5c8c0  ! 22: FSUBd	fsubd	%f54, %f0, %f28
	.word 0xb1a5c8c0  ! 24: FSUBd	fsubd	%f54, %f0, %f24
hwintr_1_2:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_2), 16, 16)) -> intp(1, 0, 27)
	.word 0xb7a448c0  ! 27: FSUBd	fsubd	%f48, %f0, %f58
	.word 0x8595e0a3  ! 29: WRPR_TSTATE_I	wrpr	%r23, 0x00a3, %tstate
	.word 0xbfa48840  ! 37: FADDd	faddd	%f18, %f0, %f62
	.word 0x8d94208e  ! 38: WRPR_PSTATE_I	wrpr	%r16, 0x008e, %pstate
	.word 0xb7a44920  ! 40: FMULs	fmuls	%f17, %f0, %f27
	.word 0xb1520000  ! 45: RDPR_PIL	<illegal instruction>
	.word 0xb5a48860  ! 46: FADDq	dis not found

	.word 0xb3a54840  ! 50: FADDd	faddd	%f52, %f0, %f56
	.word 0xb4b40000  ! 51: ORNcc_R	orncc 	%r16, %r0, %r26
	mov	2, %r12
	.word 0xa1930000  ! 54: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xbbaa0820  ! 56: FMOVA	fmovs	%fcc1, %f0, %f29
	.word 0xb3a4c920  ! 57: FMULs	fmuls	%f19, %f0, %f25
	.word 0xbabc8000  ! 61: XNORcc_R	xnorcc 	%r18, %r0, %r29
hwintr_1_3:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_3), 16, 16)) -> intp(1, 0, b)
	.word 0x8d95615c  ! 65: WRPR_PSTATE_I	wrpr	%r21, 0x015c, %pstate
	.word 0xbda00540  ! 67: FSQRTd	fsqrt	
	.word 0xbb2c6001  ! 72: SLL_I	sll 	%r17, 0x0001, %r29
	.word 0xbf500000  ! 74: RDPR_TPC	<illegal instruction>
	.word 0xb7aa8820  ! 75: FMOVG	fmovs	%fcc1, %f0, %f27
	.word 0xb3a00020  ! 76: FMOVs	fmovs	%f0, %f25
	.word 0xb1480000  ! 77: RDHPR_HPSTATE	rdhpr	%hpstate, %r24
	.word 0xbfa00560  ! 83: FSQRTq	fsqrt	
	setx	data_start_2, %g1, %r18
	.word 0xba94e074  ! 86: ORcc_I	orcc 	%r19, 0x0074, %r29
	.word 0xb9a00040  ! 87: FMOVd	fmovd	%f0, %f28
	.word 0xb9a80c20  ! 89: FMOVRLZ	dis not found

	.word 0xbb540000  ! 91: RDPR_GL	<illegal instruction>
	.word 0xb1480000  ! 94: RDHPR_HPSTATE	rdhpr	%hpstate, %r24
	.word 0xbe8ce1fa  ! 101: ANDcc_I	andcc 	%r19, 0x01fa, %r31
	.word 0x8194e1eb  ! 102: WRPR_TPC_I	wrpr	%r19, 0x01eb, %tpc
	setx	data_start_0, %g1, %r19
	.word 0xb7a4c940  ! 109: FMULd	fmuld	%f50, %f0, %f58
	.word 0xbdaa8820  ! 113: FMOVG	fmovs	%fcc1, %f0, %f30
	.word 0xb4ade175  ! 114: ANDNcc_I	andncc 	%r23, 0x0175, %r26
	.word 0x8395616b  ! 117: WRPR_TNPC_I	wrpr	%r21, 0x016b, %tnpc
	.word 0xb5540000  ! 123: RDPR_GL	rdpr	%-, %r26
	.word 0xb9540000  ! 124: RDPR_GL	<illegal instruction>
	.word 0xbba94820  ! 127: FMOVCS	fmovs	%fcc1, %f0, %f29
	.word 0xbba50820  ! 128: FADDs	fadds	%f20, %f0, %f29
	.word 0x8395e1d1  ! 130: WRPR_TNPC_I	wrpr	%r23, 0x01d1, %tnpc
	setx	data_start_0, %g1, %r17
	.word 0xb1abc820  ! 135: FMOVVC	fmovs	%fcc1, %f0, %f24
	.word 0xb9ab4820  ! 136: FMOVCC	fmovs	%fcc1, %f0, %f28
	mov	1, %r12
	.word 0x8f930000  ! 139: WRPR_TL_R	wrpr	%r12, %r0, %tl
hwintr_1_4:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_4), 16, 16)) -> intp(1, 0, 2b)
hwintr_1_5:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_5), 16, 16)) -> intp(1, 0, 31)
	.word 0xb9a00560  ! 150: FSQRTq	fsqrt	
	.word 0x8d9421fa  ! 153: WRPR_PSTATE_I	wrpr	%r16, 0x01fa, %pstate
	.word 0xbda448e0  ! 155: FSUBq	dis not found

	.word 0xb2a5e083  ! 156: SUBcc_I	subcc 	%r23, 0x0083, %r25
	.word 0xb5abc820  ! 161: FMOVVC	fmovs	%fcc1, %f0, %f26
	.word 0xb7a88820  ! 163: FMOVLE	fmovs	%fcc1, %f0, %f27
	.word 0xb5a9c820  ! 164: FMOVVS	fmovs	%fcc1, %f0, %f26
	.word 0xbfab8820  ! 167: FMOVPOS	fmovs	%fcc1, %f0, %f31
	.word 0xb5a509e0  ! 168: FDIVq	dis not found

	.word 0xbd540000  ! 173: RDPR_GL	<illegal instruction>
hwintr_1_6:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_6), 16, 16)) -> intp(1, 0, c)
	.word 0xb7520000  ! 178: RDPR_PIL	<illegal instruction>
	.word 0xb9a448a0  ! 181: FSUBs	fsubs	%f17, %f0, %f28
	.word 0xbfa588a0  ! 184: FSUBs	fsubs	%f22, %f0, %f31
	.word 0xb7aa4820  ! 185: FMOVNE	fmovs	%fcc1, %f0, %f27
	.word 0xb5a408e0  ! 186: FSUBq	dis not found

	.word 0x8d95a061  ! 196: WRPR_PSTATE_I	wrpr	%r22, 0x0061, %pstate
	.word 0xbba509a0  ! 197: FDIVs	fdivs	%f20, %f0, %f29
	.word 0xb5518000  ! 201: RDPR_PSTATE	<illegal instruction>
hwintr_1_7:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_7), 16, 16)) -> intp(1, 0, 1d)
	.word 0xb5aac820  ! 203: FMOVGE	fmovs	%fcc1, %f0, %f26
	.word 0xb7a5c8c0  ! 204: FSUBd	fsubd	%f54, %f0, %f58
	.word 0xb1a5c8a0  ! 205: FSUBs	fsubs	%f23, %f0, %f24
	.word 0xb9a81420  ! 207: FMOVRNZ	dis not found

	.word 0xb5a00520  ! 209: FSQRTs	fsqrt	
hwintr_1_8:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_8), 16, 16)) -> intp(1, 0, 3f)
	.word 0xb9a409e0  ! 215: FDIVq	dis not found

	.word 0xbb510000  ! 217: RDPR_TICK	<illegal instruction>
	.word 0xb3a80420  ! 222: FMOVRZ	dis not found

	.word 0xbba84820  ! 224: FMOVE	fmovs	%fcc1, %f0, %f29
	setx	0x553c2b5600007884, %g1, %r10
	.word 0x819a8000  ! 225: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xbc05a19a  ! 231: ADD_I	add 	%r22, 0x019a, %r30
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbfa408a0  ! 238: FSUBs	fsubs	%f16, %f0, %f31
hwintr_1_9:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_9), 16, 16)) -> intp(1, 0, 5)
	.word 0x8795e1b9  ! 241: WRPR_TT_I	wrpr	%r23, 0x01b9, %tt
	.word 0xb3518000  ! 243: RDPR_PSTATE	<illegal instruction>
	.word 0xb6840000  ! 250: ADDcc_R	addcc 	%r16, %r0, %r27
	.word 0x9194e0b2  ! 251: WRPR_PIL_I	wrpr	%r19, 0x00b2, %pil
	.word 0xb5a81420  ! 255: FMOVRNZ	dis not found

	.word 0xb9a5c960  ! 257: FMULq	dis not found

	.word 0x899461f4  ! 258: WRPR_TICK_I	wrpr	%r17, 0x01f4, %tick
	.word 0xbb2c8000  ! 259: SLL_R	sll 	%r18, %r0, %r29
	.word 0xbfaa4820  ! 262: FMOVNE	fmovs	%fcc1, %f0, %f31
	.word 0xb5a80420  ! 264: FMOVRZ	dis not found

	.word 0xb3a80c20  ! 265: FMOVRLZ	dis not found

	.word 0xb9a408c0  ! 267: FSUBd	fsubd	%f16, %f0, %f28
	.word 0xb3a94820  ! 268: FMOVCS	fmovs	%fcc1, %f0, %f25
hwintr_1_10:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_10), 16, 16)) -> intp(1, 0, 1e)
	.word 0xbba81820  ! 270: FMOVRGZ	fmovs	%fcc3, %f0, %f29
	.word 0xb2952052  ! 274: ORcc_I	orcc 	%r20, 0x0052, %r25
	.word 0x839520a8  ! 276: WRPR_TNPC_I	wrpr	%r20, 0x00a8, %tnpc
hwintr_1_11:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_11), 16, 16)) -> intp(1, 0, 1b)
	setx	data_start_2, %g1, %r19
	.word 0xbbaac820  ! 280: FMOVGE	fmovs	%fcc1, %f0, %f29
	.word 0x8995608d  ! 282: WRPR_TICK_I	wrpr	%r21, 0x008d, %tick
	.word 0x9194e171  ! 283: WRPR_PIL_I	wrpr	%r19, 0x0171, %pil
	.word 0xbba00020  ! 289: FMOVs	fmovs	%f0, %f29
	.word 0xb3a00520  ! 292: FSQRTs	fsqrt	
	mov	2, %r12
	.word 0xa1930000  ! 293: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb3a589e0  ! 295: FDIVq	dis not found

	.word 0xbe9de1ba  ! 296: XORcc_I	xorcc 	%r23, 0x01ba, %r31
	.word 0xb751c000  ! 297: RDPR_TL	<illegal instruction>
	.word 0xb3504000  ! 302: RDPR_TNPC	<illegal instruction>
hwintr_1_12:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_12), 16, 16)) -> intp(1, 0, a)
	.word 0xb9aa0820  ! 304: FMOVA	fmovs	%fcc1, %f0, %f28
	.word 0xbda84820  ! 308: FMOVE	fmovs	%fcc1, %f0, %f30
	.word 0x8795a1c8  ! 309: WRPR_TT_I	wrpr	%r22, 0x01c8, %tt
hwintr_1_13:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_13), 16, 16)) -> intp(1, 0, b)
	.word 0xb9a44840  ! 318: FADDd	faddd	%f48, %f0, %f28
	.word 0xb1540000  ! 319: RDPR_GL	<illegal instruction>
	.word 0xb1a84820  ! 327: FMOVE	fmovs	%fcc1, %f0, %f24
	.word 0xb9508000  ! 328: RDPR_TSTATE	<illegal instruction>
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb41da1b9  ! 334: XOR_I	xor 	%r22, 0x01b9, %r26
	.word 0x8795a0ea  ! 335: WRPR_TT_I	wrpr	%r22, 0x00ea, %tt
	.word 0xb7a80820  ! 337: FMOVRLEZ	fmovs	%fcc1, %f0, %f27
	.word 0xb5510000  ! 338: RDPR_TICK	<illegal instruction>
	setx	0x74717bdc00006d0f, %g1, %r10
	.word 0x839a8000  ! 339: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0x9195e1af  ! 342: WRPR_PIL_I	wrpr	%r23, 0x01af, %pil
	.word 0xb3a80820  ! 343: FMOVN	fmovs	%fcc1, %f0, %f25
	.word 0xbf504000  ! 344: RDPR_TNPC	<illegal instruction>
	.word 0xb9a81820  ! 348: FMOVRGZ	fmovs	%fcc3, %f0, %f28
	.word 0xbf540000  ! 350: RDPR_GL	<illegal instruction>
	setx	data_start_5, %g1, %r17
	.word 0xbf51c000  ! 353: RDPR_TL	<illegal instruction>
	.word 0xbba4c940  ! 354: FMULd	fmuld	%f50, %f0, %f60
hwintr_1_14:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_14), 16, 16)) -> intp(1, 0, 5)
	.word 0x819460fd  ! 365: WRPR_TPC_I	wrpr	%r17, 0x00fd, %tpc
	.word 0xb5a48940  ! 369: FMULd	fmuld	%f18, %f0, %f26
	.word 0xbbabc820  ! 371: FMOVVC	fmovs	%fcc1, %f0, %f29
hwintr_1_15:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_15), 16, 16)) -> intp(1, 0, 30)
	.word 0x8d94e127  ! 374: WRPR_PSTATE_I	wrpr	%r19, 0x0127, %pstate
	.word 0xb7aa0820  ! 375: FMOVA	fmovs	%fcc1, %f0, %f27
	setx	0xbcf0a61c00003f1a, %g1, %r10
	.word 0x839a8000  ! 379: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	setx	0x4d9a2f8c00009acb, %g1, %r10
	.word 0x819a8000  ! 384: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xb3520000  ! 385: RDPR_PIL	<illegal instruction>
	.word 0xbfaa4820  ! 388: FMOVNE	fmovs	%fcc1, %f0, %f31
	.word 0x899560aa  ! 389: WRPR_TICK_I	wrpr	%r21, 0x00aa, %tick
	.word 0xb7a488c0  ! 392: FSUBd	fsubd	%f18, %f0, %f58
	.word 0xb9a98820  ! 398: FMOVNEG	fmovs	%fcc1, %f0, %f28
	mov	0, %r12
	.word 0xa1930000  ! 399: WRPR_GL_R	wrpr	%r12, %r0, %-
hwintr_1_16:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_16), 16, 16)) -> intp(1, 0, 9)
	.word 0x81946013  ! 404: WRPR_TPC_I	wrpr	%r17, 0x0013, %tpc
	.word 0xb5a508e0  ! 405: FSUBq	dis not found

hwintr_1_17:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_17), 16, 16)) -> intp(1, 0, b)
	.word 0xb1ab8820  ! 410: FMOVPOS	fmovs	%fcc1, %f0, %f24
	.word 0xb3a508c0  ! 411: FSUBd	fsubd	%f20, %f0, %f56
	.word 0xb7643801  ! 413: MOVcc_I	<illegal instruction>
hwintr_1_18:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_18), 16, 16)) -> intp(1, 0, 2b)
	.word 0xb5a00520  ! 416: FSQRTs	fsqrt	
hwintr_1_19:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_19), 16, 16)) -> intp(1, 0, 6)
	.word 0xbe94c000  ! 418: ORcc_R	orcc 	%r19, %r0, %r31
	.word 0xb7508000  ! 419: RDPR_TSTATE	<illegal instruction>
	.word 0xbb540000  ! 420: RDPR_GL	<illegal instruction>
	.word 0xbb504000  ! 421: RDPR_TNPC	<illegal instruction>
	.word 0xbba81c20  ! 426: FMOVRGEZ	dis not found

	.word 0xbfab8820  ! 429: FMOVPOS	fmovs	%fcc1, %f0, %f31
	.word 0xb5a8c820  ! 430: FMOVL	fmovs	%fcc1, %f0, %f26
	.word 0xbda408a0  ! 433: FSUBs	fsubs	%f16, %f0, %f30
hwintr_1_20:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_20), 16, 16)) -> intp(1, 0, 22)
	setx	0x5d21e3f90000bdc7, %g1, %r10
	.word 0x839a8000  ! 436: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
hwintr_1_21:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_21), 16, 16)) -> intp(1, 0, 16)
hwintr_1_22:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_22), 16, 16)) -> intp(1, 0, 1c)
hwintr_1_23:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_23), 16, 16)) -> intp(1, 0, 25)
	.word 0xb9a00040  ! 445: FMOVd	fmovd	%f0, %f28
	.word 0xbfa4c8a0  ! 446: FSUBs	fsubs	%f19, %f0, %f31
	.word 0x8394e13f  ! 449: WRPR_TNPC_I	wrpr	%r19, 0x013f, %tnpc
	.word 0xbba54840  ! 451: FADDd	faddd	%f52, %f0, %f60
	.word 0xb5a408c0  ! 452: FSUBd	fsubd	%f16, %f0, %f26
	.word 0xbf2d9000  ! 453: SLLX_R	sllx	%r22, %r0, %r31
	.word 0xb5518000  ! 458: RDPR_PSTATE	<illegal instruction>
	.word 0xb3a4c860  ! 463: FADDq	dis not found

	.word 0xb9504000  ! 465: RDPR_TNPC	<illegal instruction>
	setx	0x2dc94acd00001ac7, %g1, %r10
	.word 0x839a8000  ! 466: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xbba81c20  ! 468: FMOVRGEZ	dis not found

	.word 0xb3a5c860  ! 470: FADDq	dis not found

	.word 0xb1a80c20  ! 472: FMOVRLZ	dis not found

	.word 0xb4c4e1ba  ! 473: ADDCcc_I	addccc 	%r19, 0x01ba, %r26
	.word 0x8195e09c  ! 475: WRPR_TPC_I	wrpr	%r23, 0x009c, %tpc
	.word 0xbda84820  ! 479: FMOVE	fmovs	%fcc1, %f0, %f30
	.word 0xb9a8c820  ! 480: FMOVL	fmovs	%fcc1, %f0, %f28
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xbbabc820  ! 484: FMOVVC	fmovs	%fcc1, %f0, %f29
	.word 0xbda84820  ! 485: FMOVE	fmovs	%fcc1, %f0, %f30
hwintr_1_24:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_24), 16, 16)) -> intp(1, 0, 33)
	setx	0x27f1555c0000ae55, %g1, %r10
	.word 0x839a8000  ! 488: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
hwintr_1_25:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_25), 16, 16)) -> intp(1, 0, 39)
	.word 0xb5a00560  ! 492: FSQRTq	fsqrt	
	.word 0xbc05a027  ! 495: ADD_I	add 	%r22, 0x0027, %r30
	.word 0xbda88820  ! 496: FMOVLE	fmovs	%fcc1, %f0, %f30
	.word 0x879561fc  ! 498: WRPR_TT_I	wrpr	%r21, 0x01fc, %tt
hwintr_1_26:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_26), 16, 16)) -> intp(1, 0, 2c)
	.word 0xb5a80820  ! 505: FMOVRLEZ	fmovs	%fcc1, %f0, %f26
	.word 0xb5a40840  ! 506: FADDd	faddd	%f16, %f0, %f26
	.word 0x8394e0e0  ! 507: WRPR_TNPC_I	wrpr	%r19, 0x00e0, %tnpc
	.word 0xb1a80420  ! 511: FMOVRZ	dis not found

	.word 0xb7ab4820  ! 512: FMOVCC	fmovs	%fcc1, %f0, %f27
	.word 0xbfa80c20  ! 517: FMOVRLZ	dis not found

	.word 0xb0144000  ! 520: OR_R	or 	%r17, %r0, %r24
	.word 0xbba00560  ! 521: FSQRTq	fsqrt	
	.word 0xb7a80420  ! 522: FMOVRZ	dis not found

	.word 0xbda5c9a0  ! 524: FDIVs	fdivs	%f23, %f0, %f30
	.word 0xb7a80420  ! 526: FMOVRZ	dis not found

hwintr_1_27:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_27), 16, 16)) -> intp(1, 0, 2)
	setx	data_start_1, %g1, %r18
	.word 0xb5508000  ! 536: RDPR_TSTATE	<illegal instruction>
	.word 0xb7a94820  ! 544: FMOVCS	fmovs	%fcc1, %f0, %f27
	.word 0xb3a549e0  ! 545: FDIVq	dis not found

	.word 0xb7a98820  ! 546: FMOVNEG	fmovs	%fcc1, %f0, %f27
hwintr_1_28:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_28), 16, 16)) -> intp(1, 0, 1)
hwintr_1_29:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_29), 16, 16)) -> intp(1, 0, 27)
	.word 0xb5a4c8e0  ! 551: FSUBq	dis not found

	.word 0xb9aa4820  ! 553: FMOVNE	fmovs	%fcc1, %f0, %f28
	.word 0xbba489a0  ! 556: FDIVs	fdivs	%f18, %f0, %f29
hwintr_1_30:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_30), 16, 16)) -> intp(1, 0, 26)
	.word 0xb7a80820  ! 563: FMOVN	fmovs	%fcc1, %f0, %f27
	setx	data_start_4, %g1, %r20
hwintr_1_31:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_31), 16, 16)) -> intp(1, 0, 13)
	.word 0xb7a00020  ! 570: FMOVs	fmovs	%f0, %f27
	.word 0xbd50c000  ! 571: RDPR_TT	<illegal instruction>
	.word 0xbb520000  ! 572: RDPR_PIL	<illegal instruction>
	.word 0xb1504000  ! 577: RDPR_TNPC	<illegal instruction>
	.word 0xb4b50000  ! 578: SUBCcc_R	orncc 	%r20, %r0, %r26
	.word 0xb035c000  ! 584: ORN_R	orn 	%r23, %r0, %r24
	.word 0x8d952169  ! 585: WRPR_PSTATE_I	wrpr	%r20, 0x0169, %pstate
hwintr_1_32:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_32), 16, 16)) -> intp(1, 0, 2)
	setx	0x67336f6f0000d8ca, %g1, %r10
	.word 0x839a8000  ! 593: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	setx	0x928af0d100007ec7, %g1, %r10
	.word 0x839a8000  ! 597: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb7508000  ! 600: RDPR_TSTATE	<illegal instruction>
hwintr_1_33:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_33), 16, 16)) -> intp(1, 0, 3d)
	setx	data_start_0, %g1, %r18
	setx	data_start_5, %g1, %r18
	.word 0xb7a549e0  ! 610: FDIVq	dis not found

	.word 0xb9540000  ! 616: RDPR_GL	<illegal instruction>
hwintr_1_34:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_34), 16, 16)) -> intp(1, 0, 34)
	.word 0xb5a50940  ! 627: FMULd	fmuld	%f20, %f0, %f26
	.word 0xb1480000  ! 628: RDHPR_HPSTATE	rdhpr	%hpstate, %r24
	.word 0xbcbd0000  ! 631: XNORcc_R	xnorcc 	%r20, %r0, %r30
hwintr_1_35:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_35), 16, 16)) -> intp(1, 0, 1a)
hwintr_1_36:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_36), 16, 16)) -> intp(1, 0, 20)
	.word 0xbb641800  ! 638: MOVcc_R	<illegal instruction>
	.word 0xb9a00560  ! 640: FSQRTq	fsqrt	
	.word 0x8194603a  ! 641: WRPR_TPC_I	wrpr	%r17, 0x003a, %tpc
	.word 0xbfa489e0  ! 642: FDIVq	dis not found

	mov	0, %r12
	.word 0x8f930000  ! 643: WRPR_TL_R	wrpr	%r12, %r0, %tl
hwintr_1_37:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_37), 16, 16)) -> intp(1, 0, 31)
	.word 0xb81de027  ! 647: XOR_I	xor 	%r23, 0x0027, %r28
hwintr_1_38:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_38), 16, 16)) -> intp(1, 0, 1)
	.word 0xb9a5c8c0  ! 649: FSUBd	fsubd	%f54, %f0, %f28
	mov	2, %r12
	.word 0x8f930000  ! 650: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xb3a00020  ! 651: FMOVs	fmovs	%f0, %f25
hwintr_1_39:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_39), 16, 16)) -> intp(1, 0, 34)
hwintr_1_40:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_40), 16, 16)) -> intp(1, 0, 2)
	.word 0xb3a81c20  ! 661: FMOVRGEZ	dis not found

	.word 0xb9a9c820  ! 666: FMOVVS	fmovs	%fcc1, %f0, %f28
	.word 0xb9a5c860  ! 670: FADDq	dis not found

	setx	0xf8de5fbd00005890, %g1, %r10
	.word 0x819a8000  ! 672: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xb434c000  ! 673: SUBC_R	orn 	%r19, %r0, %r26
	.word 0xbba80c20  ! 674: FMOVRLZ	dis not found

	.word 0xb5a40960  ! 677: FMULq	dis not found

	setx	data_start_7, %g1, %r19
	.word 0xbda00540  ! 683: FSQRTd	fsqrt	
	.word 0xb5a50840  ! 689: FADDd	faddd	%f20, %f0, %f26
	mov	1, %r12
	.word 0x8f930000  ! 690: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xb73db001  ! 691: SRAX_I	srax	%r22, 0x0001, %r27
	.word 0x89946029  ! 692: WRPR_TICK_I	wrpr	%r17, 0x0029, %tick
	.word 0xbb518000  ! 693: RDPR_PSTATE	<illegal instruction>
hwintr_1_41:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_41), 16, 16)) -> intp(1, 0, d)
	.word 0xb1a00560  ! 697: FSQRTq	fsqrt	
	.word 0xb9a98820  ! 698: FMOVNEG	fmovs	%fcc1, %f0, %f28
	.word 0x879461dc  ! 699: WRPR_TT_I	wrpr	%r17, 0x01dc, %tt
hwintr_1_42:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_42), 16, 16)) -> intp(1, 0, 2d)
	.word 0xb5a00560  ! 705: FSQRTq	fsqrt	
	.word 0xb5a80420  ! 706: FMOVRZ	dis not found

	.word 0xb13df001  ! 709: SRAX_I	srax	%r23, 0x0001, %r24
	.word 0xb7a549e0  ! 710: FDIVq	dis not found

	.word 0xb3a488c0  ! 712: FSUBd	fsubd	%f18, %f0, %f56
	.word 0x8995a134  ! 713: WRPR_TICK_I	wrpr	%r22, 0x0134, %tick
hwintr_1_43:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_43), 16, 16)) -> intp(1, 0, 11)
	.word 0xbd7c0400  ! 723: MOVR_R	movre	%r16, %r0, %r30
	.word 0xb83cc000  ! 724: XNOR_R	xnor 	%r19, %r0, %r28
	.word 0xb1a80420  ! 725: FMOVRZ	dis not found

	.word 0xbf2d8000  ! 728: SLL_R	sll 	%r22, %r0, %r31
	.word 0xb7aa8820  ! 729: FMOVG	fmovs	%fcc1, %f0, %f27
hwintr_1_44:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_44), 16, 16)) -> intp(1, 0, 2c)
	.word 0xb1a5c9a0  ! 734: FDIVs	fdivs	%f23, %f0, %f24
	setx	0x1473e59a00000b9f, %g1, %r10
	.word 0x839a8000  ! 738: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xbda509a0  ! 741: FDIVs	fdivs	%f20, %f0, %f30
	.word 0xb5a90820  ! 744: FMOVLEU	fmovs	%fcc1, %f0, %f26
	.word 0xb9a88820  ! 745: FMOVLE	fmovs	%fcc1, %f0, %f28
	.word 0xb1a44920  ! 748: FMULs	fmuls	%f17, %f0, %f24
	.word 0xbfa00020  ! 750: FMOVs	fmovs	%f0, %f31
hwintr_1_45:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_45), 16, 16)) -> intp(1, 0, 3c)
	.word 0xb1a81c20  ! 754: FMOVRGEZ	dis not found

	.word 0x89956034  ! 755: WRPR_TICK_I	wrpr	%r21, 0x0034, %tick
	.word 0xb4ac60b2  ! 756: ANDNcc_I	andncc 	%r17, 0x00b2, %r26
	.word 0xb5a50920  ! 757: FMULs	fmuls	%f20, %f0, %f26
	.word 0xb7540000  ! 759: RDPR_GL	<illegal instruction>
	.word 0xb3a80420  ! 760: FMOVRZ	dis not found

	.word 0xbba58860  ! 765: FADDq	dis not found

	.word 0xbba80820  ! 768: FMOVRLEZ	fmovs	%fcc1, %f0, %f29
	.word 0xb3a5c9a0  ! 769: FDIVs	fdivs	%f23, %f0, %f25
	.word 0xbda448c0  ! 772: FSUBd	fsubd	%f48, %f0, %f30
	.word 0xb3510000  ! 773: RDPR_TICK	<illegal instruction>
	.word 0xb52d1000  ! 774: SLLX_R	sllx	%r20, %r0, %r26
	.word 0xbdab4820  ! 776: FMOVCC	fmovs	%fcc1, %f0, %f30
	mov	1, %r12
	.word 0xa1930000  ! 777: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb1aac820  ! 779: FMOVGE	fmovs	%fcc1, %f0, %f24
	.word 0xbfa00560  ! 780: FSQRTq	fsqrt	
	.word 0xbba80c20  ! 784: FMOVRLZ	dis not found

	.word 0xb7504000  ! 785: RDPR_TNPC	<illegal instruction>
	.word 0xb3518000  ! 787: RDPR_PSTATE	<illegal instruction>
	.word 0xb7a84820  ! 788: FMOVE	fmovs	%fcc1, %f0, %f27
	.word 0x8594a142  ! 790: WRPR_TSTATE_I	wrpr	%r18, 0x0142, %tstate
	.word 0xb3a50840  ! 791: FADDd	faddd	%f20, %f0, %f56
hwintr_1_46:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_46), 16, 16)) -> intp(1, 0, 12)
	.word 0x8995a065  ! 793: WRPR_TICK_I	wrpr	%r22, 0x0065, %tick
	.word 0xb1a4c9c0  ! 798: FDIVd	fdivd	%f50, %f0, %f24
	.word 0xbdaa8820  ! 802: FMOVG	fmovs	%fcc1, %f0, %f30
hwintr_1_47:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_47), 16, 16)) -> intp(1, 0, 37)
	.word 0xbba80820  ! 809: FMOVN	fmovs	%fcc1, %f0, %f29
	.word 0xb3aa4820  ! 810: FMOVNE	fmovs	%fcc1, %f0, %f25
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb0c5e0eb  ! 814: ADDCcc_I	addccc 	%r23, 0x00eb, %r24
	.word 0xb334f001  ! 818: SRLX_I	srlx	%r19, 0x0001, %r25
	mov	0, %r12
	.word 0x8f930000  ! 819: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xbdab4820  ! 823: FMOVCC	fmovs	%fcc1, %f0, %f30
	.word 0xbba488a0  ! 825: FSUBs	fsubs	%f18, %f0, %f29
	.word 0xb2bdc000  ! 826: XNORcc_R	xnorcc 	%r23, %r0, %r25
	.word 0xb3a449c0  ! 830: FDIVd	fdivd	%f48, %f0, %f56
	.word 0xb3a84820  ! 832: FMOVE	fmovs	%fcc1, %f0, %f25
	.word 0xb2346063  ! 834: SUBC_I	orn 	%r17, 0x0063, %r25
	.word 0xbda54940  ! 836: FMULd	fmuld	%f52, %f0, %f30
	.word 0xbb3c6001  ! 837: SRA_I	sra 	%r17, 0x0001, %r29
	mov	2, %r12
	.word 0x8f930000  ! 842: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xb3a80c20  ! 844: FMOVRLZ	dis not found

	.word 0xb40d20d4  ! 845: AND_I	and 	%r20, 0x00d4, %r26
hwintr_1_48:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_48), 16, 16)) -> intp(1, 0, 16)
	.word 0xbfa4c840  ! 851: FADDd	faddd	%f50, %f0, %f62
	.word 0xbda80420  ! 852: FMOVRZ	dis not found

	.word 0xbba4c960  ! 855: FMULq	dis not found

	.word 0xb1aa4820  ! 856: FMOVNE	fmovs	%fcc1, %f0, %f24
hwintr_1_49:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_49), 16, 16)) -> intp(1, 0, 39)
	.word 0xb7a40860  ! 864: FADDq	dis not found

	.word 0xbba80820  ! 866: FMOVN	fmovs	%fcc1, %f0, %f29
	.word 0xb1aa8820  ! 870: FMOVG	fmovs	%fcc1, %f0, %f24
hwintr_1_50:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_50), 16, 16)) -> intp(1, 0, 35)
	.word 0xb9520000  ! 873: RDPR_PIL	<illegal instruction>
	.word 0xb7a50860  ! 875: FADDq	dis not found

	.word 0xb3a50860  ! 876: FADDq	dis not found

	.word 0xbba4c8e0  ! 877: FSUBq	dis not found

	.word 0xb3a409e0  ! 878: FDIVq	dis not found

	.word 0x8395e036  ! 886: WRPR_TNPC_I	wrpr	%r23, 0x0036, %tnpc
	.word 0xbda81820  ! 889: FMOVRGZ	fmovs	%fcc3, %f0, %f30
	.word 0xb550c000  ! 890: RDPR_TT	<illegal instruction>
	.word 0xb1500000  ! 896: RDPR_TPC	<illegal instruction>
	.word 0xbba5c840  ! 898: FADDd	faddd	%f54, %f0, %f60
	.word 0xbc3cc000  ! 899: XNOR_R	xnor 	%r19, %r0, %r30
	.word 0xb3a5c9c0  ! 901: FDIVd	fdivd	%f54, %f0, %f56
	.word 0xbfa81c20  ! 903: FMOVRGEZ	dis not found

	.word 0xb8b5c000  ! 905: ORNcc_R	orncc 	%r23, %r0, %r28
	.word 0xb9a00040  ! 907: FMOVd	fmovd	%f0, %f28
hwintr_1_51:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_51), 16, 16)) -> intp(1, 0, 0)
	.word 0xbba4c9e0  ! 911: FDIVq	dis not found

	.word 0xbd50c000  ! 912: RDPR_TT	<illegal instruction>
hwintr_1_52:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_52), 16, 16)) -> intp(1, 0, a)
	.word 0xbda4c920  ! 915: FMULs	fmuls	%f19, %f0, %f30
	.word 0x899521b6  ! 916: WRPR_TICK_I	wrpr	%r20, 0x01b6, %tick
hwintr_1_53:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_53), 16, 16)) -> intp(1, 0, 1d)
	.word 0xb9a408c0  ! 920: FSUBd	fsubd	%f16, %f0, %f28
	.word 0xb9520000  ! 921: RDPR_PIL	<illegal instruction>
	.word 0xbfa5c840  ! 928: FADDd	faddd	%f54, %f0, %f62
	.word 0xba154000  ! 935: OR_R	or 	%r21, %r0, %r29
	.word 0xb3518000  ! 936: RDPR_PSTATE	<illegal instruction>
	.word 0xbf520000  ! 941: RDPR_PIL	<illegal instruction>
	.word 0xb1a508e0  ! 946: FSUBq	dis not found

	.word 0xb5a549a0  ! 947: FDIVs	fdivs	%f21, %f0, %f26
	.word 0xb5a408a0  ! 949: FSUBs	fsubs	%f16, %f0, %f26
hwintr_1_54:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_54), 16, 16)) -> intp(1, 0, 19)
	.word 0xb3a488a0  ! 955: FSUBs	fsubs	%f18, %f0, %f25
	.word 0xbfa449a0  ! 961: FDIVs	fdivs	%f17, %f0, %f31
	setx	data_start_7, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbfa88820  ! 967: FMOVLE	fmovs	%fcc1, %f0, %f31
	.word 0xbda80c20  ! 968: FMOVRLZ	dis not found

	.word 0xbbabc820  ! 969: FMOVVC	fmovs	%fcc1, %f0, %f29
	.word 0xb884c000  ! 974: ADDcc_R	addcc 	%r19, %r0, %r28
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb150c000  ! 979: RDPR_TT	<illegal instruction>
	.word 0xb351c000  ! 980: RDPR_TL	<illegal instruction>
	.word 0xbbabc820  ! 983: FMOVVC	fmovs	%fcc1, %f0, %f29
	.word 0xbda449c0  ! 987: FDIVd	fdivd	%f48, %f0, %f30
	.word 0xb5a00560  ! 988: FSQRTq	fsqrt	
	.word 0xb5a81420  ! 991: FMOVRNZ	dis not found

	setx	data_start_3, %g1, %r21
	.word 0x8794e1a8  ! 995: WRPR_TT_I	wrpr	%r19, 0x01a8, %tt

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

	.xword	0xb9ea6eb069f017e0
	.xword	0xd8febc6fad900fd2
	.xword	0x04164cb1c099ab4d
	.xword	0x79efbcaf04842fb3
	.xword	0x09d2cb1670083443
	.xword	0xfed63bfeb285be8e
	.xword	0x68db0831435c19e1
	.xword	0x44f2ec5c14df8e55
	.xword	0xa939fd6802758880
	.xword	0xefe2cf8d46a3d685
	.xword	0x282afd87c067445d
	.xword	0xce3171c7e3334fd3
	.xword	0xf9c451023a0c4127
	.xword	0x3824b5f2ccc2e3e6
	.xword	0x36a7d0ad8a24c963
	.xword	0x38daa3dcea7000f3
	.xword	0x5a32d38245779767
	.xword	0xd76104fbad9bd18f
	.xword	0xc53a156a4e35355f
	.xword	0x88b6585ae981095c
	.xword	0xf4bf131a084a64cf
	.xword	0x5d283deb0a621f4c
	.xword	0xd7ff720826b59433
	.xword	0x5f4fb52a95e4e9f0
	.xword	0x449ea250e32a7fd2
	.xword	0x8e73e4bffb30d262
	.xword	0x4c2ea401803393f3
	.xword	0xcdd92bbb1984c9fe
	.xword	0xa1ea380f844ee4f3
	.xword	0xc8da2f32e075f8ee
	.xword	0xc689a4a8c37f7eb9
	.xword	0xb017791353975976
	.xword	0xcd7dcd2a94133beb
	.xword	0x997664658f63b432
	.xword	0x97f128b432d0db26
	.xword	0x9454a350991b0f35
	.xword	0xfc3311ccdcc6dcb2
	.xword	0x01230a40a54a0875
	.xword	0xe8d071dd5652c982
	.xword	0x8d41d27b4a72b24f
	.xword	0xd84eff2f9bf2ba9e
	.xword	0x4a78532fb305b78c
	.xword	0x6372a2b7ae6041f7
	.xword	0x9d7f5e716edd0493
	.xword	0x9a5042e2e5bd8de9
	.xword	0x42ce22a446be2317
	.xword	0x4f8d9935ef0aaa77
	.xword	0x3b839d3ed1183d29
	.xword	0x007980b0bf46095f
	.xword	0xba37f1670c0e4a7b
	.xword	0xcdd8cc304b23dda4
	.xword	0x2b5cdba04ed6a616
	.xword	0x38d647efc3a5f1a1
	.xword	0x2821724ee066402f
	.xword	0xb572aa846414f4d7
	.xword	0x445a670f23af5328
	.xword	0xeb7ff7317c55a126
	.xword	0x0a4c4c67e655c09d
	.xword	0xfb551b297ad89a0d
	.xword	0x5f0331aad1d9d5ba
	.xword	0x8d50c40f852b887e
	.xword	0x6508d3bbcb6af251
	.xword	0x0ff6974ca6873cf4
	.xword	0x6611814e9c8c4e95
	.xword	0x945412f3d2a126b2
	.xword	0xc211013958837dd3
	.xword	0x6eb8c2ffe69bb81c
	.xword	0x57e13f63db9c667e
	.xword	0x6615526554d3bba2
	.xword	0xe31c5d9365af996a
	.xword	0xe9708451e8e273af
	.xword	0xacd70ce3e3a4998d
	.xword	0x66205b01ca09a596
	.xword	0x2be9c3c22d6677fe
	.xword	0x86792f9d202e9a5e
	.xword	0xf6c48de54dd7fa67
	.xword	0x51a34f4d089148d7
	.xword	0xc1b3cc7ef371078a
	.xword	0x1438fce7a6b8a995
	.xword	0xc30ea43a7bce9ddd
	.xword	0x6d16aaee99894b35
	.xword	0x1c76e2854adbbd99
	.xword	0x5968cb9b6220f880
	.xword	0x114c22f34763e9f8
	.xword	0x460db660e7d6b67a
	.xword	0xf86a95a55fda282e
	.xword	0xa03d18100b7a38f0
	.xword	0x77f58835448de3b2
	.xword	0xf19de618cdfed732
	.xword	0x1613840386618a8f
	.xword	0xaa755586d4218946
	.xword	0xf901bb9d3a15bedb
	.xword	0x35994b9f3d98bc68
	.xword	0x17dca338520b4aee
	.xword	0xc345d96ecb419928
	.xword	0x2bb69ab1ee8e5a21
	.xword	0x1a84ffc59a9187f5
	.xword	0x240d55f4a465b950
	.xword	0x6601d21eb22ec432
	.xword	0xe8d3b69f42081ce0
	.xword	0x6b8536116c72b862
	.xword	0xeeb71c36e1596c81
	.xword	0x177f7fdc572921d9
	.xword	0xe6df8732290a997b
	.xword	0x6e446964bb6aa018
	.xword	0x9013ea83cd0e6b72
	.xword	0x2562cbd095de8ac1
	.xword	0xfbf6d8b70257fe9c
	.xword	0xb856e58e964d8eb2
	.xword	0x51d1b1cb94056efd
	.xword	0x75b3409041536d56
	.xword	0x742d51915797859b
	.xword	0x86bf5f872205e969
	.xword	0x460c7eb37050a0be
	.xword	0x60bf08c5bd8564f2
	.xword	0x5f4b0e53b4ee0128
	.xword	0x410ca457b63877db
	.xword	0xc9781706ef874d88
	.xword	0xf34e05e91cb8cb4a
	.xword	0xa34ad9ad05496318
	.xword	0xbed7b9e42efa4d29
	.xword	0x751f1cbefec9ae32
	.xword	0x0a9be0a068c009b9
	.xword	0x134addc39c864443
	.xword	0x7c821d11e63efd60
	.xword	0x8bce819ad2b6910c
	.xword	0x2e852048f9ac78a5
	.xword	0xe2c82e6ce26c94ff
	.xword	0x24fa92eadf1a46f6
	.xword	0x88522b540ec883c4
	.xword	0x968b77d14ee25323
	.xword	0x712de972002a72bd
	.xword	0xb2c9cdce39d75acb
	.xword	0x7e639993d125e7ae
	.xword	0x8aa01d780e45e4c3
	.xword	0x926f6fe6b98415a6
	.xword	0xdaf948d264a27ac2
	.xword	0x2fbeabdbfe936089
	.xword	0xe1a62f79c9826012
	.xword	0x2106aa40387fa916
	.xword	0xba835c8a1f121309
	.xword	0x87d43b389a41924c
	.xword	0x0b261312b29d4b0e
	.xword	0x13223fbcc06819ee
	.xword	0xd233e2c0b17fcebd
	.xword	0x00796e859a047614
	.xword	0x872e1780b89375b5
	.xword	0xb75d3bca58964433
	.xword	0x76d882c5e124b892
	.xword	0xf0f4789d32cd8fab
	.xword	0xf1b3af0818df6f75
	.xword	0xa27e9791c3ec2e72
	.xword	0xe8b7f56d3bf85701
	.xword	0xbaf292d63aefc0b5
	.xword	0xf52f006f54cee422
	.xword	0xa2d5478e28e05ca3
	.xword	0x2f3d165a6e8bbcd7
	.xword	0x64fac9354b3b51f0
	.xword	0xd4c3a3abbc19240a
	.xword	0xfa6a8f64d2e50b3e
	.xword	0x1073385ecb7a469d
	.xword	0xa07019fe9c3bd50f
	.xword	0xb74c2ea4d26dd3bc
	.xword	0x92b6cb5f83f6deec
	.xword	0xb78987873bd05792
	.xword	0x036d591fa957f24c
	.xword	0x42b82eba7b1fca75
	.xword	0x307828f0adc77dc7
	.xword	0x57d78c1d20bca528
	.xword	0x6f329e9824dd4e79
	.xword	0x90023ebba32cff99
	.xword	0x8fc737139b61977a
	.xword	0x93d5bd34dafe0bf9
	.xword	0xbf90f3d5744e9b05
	.xword	0xf18a7514fb2a9e7b
	.xword	0x8c98294fc1e9e553
	.xword	0x3cd54f1bf8899aae
	.xword	0x3ae64c3c6075d225
	.xword	0xc57ba0561ca49741
	.xword	0x5d04df30f6da9975
	.xword	0x7c265bc2500331d2
	.xword	0x05f1126271e75d5f
	.xword	0x90b7f69ad911e104
	.xword	0x873e7a6d9fbedb79
	.xword	0x7f0a710d0a6cc443
	.xword	0xcfa5e28893234a4a
	.xword	0x0616a13269b2249c
	.xword	0xbfbfe15015cc4ce0
	.xword	0xb00236a816333632
	.xword	0x90bc5a5eb365bf51
	.xword	0xd301d9b9e26d05f8
	.xword	0xf173c1da48a6c8c0
	.xword	0x1cce565e255a4fc6
	.xword	0xef0fdedc1b5c52c3
	.xword	0x7683567087023ef7
	.xword	0x0e7e1a8cf10dd897
	.xword	0x695e6fd0b8c638c7
	.xword	0x761730b7a3ad562b
	.xword	0x71119523e32e7492
	.xword	0xd7fa3fd4fbf9ad53
	.xword	0x920210bf78291651
	.xword	0x6067872c7dc6c35a
	.xword	0x298bd50c55c227d8
	.xword	0xbcd5c96a7ce8b02f
	.xword	0x47625b8f1012b50f
	.xword	0x1b4566388c35d80d
	.xword	0x1ffffefa221ec133
	.xword	0x98784b5e7384b3e2
	.xword	0x16c8d91c41697225
	.xword	0xab650d72da8e466b
	.xword	0x37ce9319ec43932d
	.xword	0x1b5fae4ef6470006
	.xword	0x3a5fec50c0a85f0d
	.xword	0xe75baf6491b14ed9
	.xword	0x7566ba77a7f59057
	.xword	0xea189e185b863b22
	.xword	0xdf78f521efbfc683
	.xword	0x42d3547c8d9a7304
	.xword	0xb547f12864e5e7cc
	.xword	0x8b2340c2563c0378
	.xword	0x7a15dcc9c4bb7ac1
	.xword	0x265e6ada8b745acf
	.xword	0xe0b59d6a2985652e
	.xword	0x2002b2c17529c138
	.xword	0x2c62219fd48d9dc0
	.xword	0xb1005658d4441efe
	.xword	0x6ee8c2b383110d21
	.xword	0xecc60f785ca5e921
	.xword	0x631185a0b365ccd8
	.xword	0x84338518d337ebec
	.xword	0x2e2624bc099b89cd
	.xword	0x523fa55a5a8d1d1a
	.xword	0x17420286d0632a07
	.xword	0x8a2bb507b369a5bd
	.xword	0xb00559e036e137e1
	.xword	0xd9ae9bbc58888b3c
	.xword	0x24f34a515a2c0e97
	.xword	0xe5d8c1772e48d6a2
	.xword	0x7ca9d72f54413f83
	.xword	0xd95b0fe4ff5c35cc
	.xword	0xbf3048d89ea1453d
	.xword	0x109e2fd5c5f02aca
	.xword	0xa4f0a0bda0dc03dd
	.xword	0xd1aca299cdf62acb
	.xword	0xf2c0b2c0f35259b1
	.xword	0x08d0f63b4f218f8c
	.xword	0xa1388cde7452bb59
	.xword	0x63514461b68b3e35
	.xword	0x8d1b8eb65fc9d8d4
	.xword	0xb4cce8d03dd88f00
	.xword	0x53290021593dc9c4
	.xword	0x8eb622a0fc0b8d9e
	.xword	0x7ed44dc66d2c8483
	.xword	0xfd22acc87550527d
	.xword	0x9e351194732cd579
	.xword	0x672f0813e34ee2c9
	.align 0x2000
	.data
data_start_1:

	.xword	0xb724abb754a3a892
	.xword	0x9003cf400a77f9bc
	.xword	0xb653f1cf6157f86a
	.xword	0xc24e45078f47afa2
	.xword	0x1377c603a224213d
	.xword	0xaa23bd73218689b7
	.xword	0xe4f2cd7cc27393ab
	.xword	0x993cab79a5fea494
	.xword	0xd3e0bab9b315f784
	.xword	0xfb5cc87a4f644cd5
	.xword	0x9e80fe213cec2621
	.xword	0x040c9ad6f94c882f
	.xword	0xd056bac5f371ba83
	.xword	0x4dde42ebb79d8045
	.xword	0x58c9331afa31c912
	.xword	0x9df94118a76afa3e
	.xword	0x8e9dd18a53861ee4
	.xword	0xec41077b769b9962
	.xword	0xb5af1950c2b91268
	.xword	0xf0f8eb4f8091f037
	.xword	0x6a85a4b884f4be21
	.xword	0x1c63a2c1069fe623
	.xword	0x27c34afc36e803a4
	.xword	0x42d643800daf7bd9
	.xword	0x2d7cb013c06e3e22
	.xword	0x1e8f8c66a3386b0e
	.xword	0x1768b856aef96c6f
	.xword	0xf31012d317ba5ef9
	.xword	0x74177cc182cc6ffc
	.xword	0x2c2be46273ed00f9
	.xword	0x7048cc11b3a73bf1
	.xword	0x798223fabef55d9e
	.xword	0xcda2eed848a58114
	.xword	0x4fdca0e32b23c3f4
	.xword	0x739c0dfa04279958
	.xword	0xb1225aed48f6ce7d
	.xword	0x7fa41a6ed1ff757d
	.xword	0xb0812490be65a1ec
	.xword	0xd80bdb98bfb9589f
	.xword	0x3e2612a85fc91349
	.xword	0x9b553fa032e19922
	.xword	0x2efbef8f79f0e4d6
	.xword	0x2cf5ad50b2850a3f
	.xword	0xae561189f06c5165
	.xword	0xe44b0493b56f2709
	.xword	0xd3ed2bd9e3318f4c
	.xword	0x7caa69a2b19a45ca
	.xword	0xd64257d74c30c750
	.xword	0xf263a6e6600147c6
	.xword	0x2357ab6661e7f6f4
	.xword	0x6601badb361465fe
	.xword	0x13572c43d8e59232
	.xword	0xdee899b2b0f9fa00
	.xword	0xdc4cf281a9afca5f
	.xword	0x6fd70a403e508fba
	.xword	0x8734d0f6f109347b
	.xword	0x42d6a42cb80520be
	.xword	0xc2633d784a9b716c
	.xword	0x394089cc4ac18ea4
	.xword	0x9c570cafe365bc40
	.xword	0x83a12e382752970b
	.xword	0xf2b80d760bc8e863
	.xword	0xe67a7b47e20d2e9d
	.xword	0x57b79090e439ae9f
	.xword	0x360af86b1a22fa23
	.xword	0x850e8933e36e9737
	.xword	0x44881f54675043f5
	.xword	0x484d4b9623d03517
	.xword	0xa973eb61b44a431f
	.xword	0x662be999556a6cfc
	.xword	0x2aa933ee5be1df74
	.xword	0xa1f42e55dfe5e5d0
	.xword	0x99af234531d6d024
	.xword	0xee2a6b894036cb57
	.xword	0xbd3d14a6149be36e
	.xword	0xd7351a06f7d7635c
	.xword	0x38ddef714ef0b1ce
	.xword	0x59cfdbd14de34a89
	.xword	0x9131dc63d458c6a3
	.xword	0xc65ec9cf8530f3a9
	.xword	0x45dd89116fbb142f
	.xword	0x7a96fe90799c5565
	.xword	0x5e3747cef431fdfb
	.xword	0x68c085ce2bf793f7
	.xword	0x442608531419add3
	.xword	0x4dcbb30900784572
	.xword	0x8e5cfcb03d285a4d
	.xword	0x985777c23e0db4ff
	.xword	0xa8a026e2964677c0
	.xword	0x1e9f95bb004a6f17
	.xword	0x57ace1662b994af9
	.xword	0xd6f5eaafcba729b6
	.xword	0x079640c2fa15ce0e
	.xword	0x690d7a401ccd48d2
	.xword	0x2166537d066aaeba
	.xword	0x9b5708456a3f30a6
	.xword	0x94a71a5eab16116c
	.xword	0x757933a0fd6102de
	.xword	0x5585f5b7f8206730
	.xword	0xc48b33c5de805841
	.xword	0x9a196b63201fa5f0
	.xword	0x4838f25aacbaa054
	.xword	0xfdddb76225176e93
	.xword	0x9f92f4df3209a758
	.xword	0xe2b57b3b9855ec6e
	.xword	0x6ab9a722d97682f0
	.xword	0x1c04a2f6c976cf02
	.xword	0xee058efdd8bb3cbd
	.xword	0xd80881a515d17dcb
	.xword	0x18c181ba9a50bdd8
	.xword	0xce1e052d7a673fec
	.xword	0xae05ec57d09ece5f
	.xword	0x8fc3c759cb3bdc1a
	.xword	0xa9a3ee701acf3137
	.xword	0x989757522eccfbbd
	.xword	0xe7e61043ec74b779
	.xword	0x4af0790782919d44
	.xword	0xea6ef5f233c91d67
	.xword	0xf4cb2a65b5c1e41d
	.xword	0x9f7c8260938e1f5e
	.xword	0xb6b6cf8f90c1fd88
	.xword	0xdf204eadcb84f950
	.xword	0x44ea1ae163b25b5c
	.xword	0xb55093d88d09f9ff
	.xword	0x84f14b4d15d7b45b
	.xword	0x3323253937779ad2
	.xword	0x4c4f3452e4b5c482
	.xword	0x6d67c1dca8e42798
	.xword	0x725f082e19664aad
	.xword	0x8c8cfd31d7089b9f
	.xword	0x5b550c4a399604ad
	.xword	0xbadf4af36cc478d9
	.xword	0xf654e03916bcafa6
	.xword	0x885ad399b9809d1d
	.xword	0xc2585354347fe123
	.xword	0x9c3c2ab207b41458
	.xword	0xdd1be6d343fb5f8c
	.xword	0x7d17d68beb1d6594
	.xword	0xc38fd887f58e30f8
	.xword	0x85e3260df2beb395
	.xword	0x53e497aa8c711596
	.xword	0xede5fc9cc4d11b2d
	.xword	0x915b151aa24be7ba
	.xword	0x2b8e6b7ededb6c5b
	.xword	0x5addde05b029cf75
	.xword	0x3c03b29336e7d1cc
	.xword	0x74f8e02a68a78aa7
	.xword	0x90c0c3d7cb4952b9
	.xword	0x59d3c8b8721798e1
	.xword	0x2c33c83ade5366d6
	.xword	0xa38a40f815a10c44
	.xword	0x3d5f94344d85233f
	.xword	0x8f6cdec6648079f0
	.xword	0xf14ce239dfc33f46
	.xword	0x0690f9582fc7615c
	.xword	0x54d4f3ce000cdbe0
	.xword	0x8ca8b31eb74e5265
	.xword	0x41509fe9e7ee4c0d
	.xword	0xc12caa7e18f296d8
	.xword	0x6c1db1d32f3b828f
	.xword	0x0ad81b94f9d47ed8
	.xword	0xaf73d6cad27c3486
	.xword	0xfffb729d054d4e96
	.xword	0x23661118f869f115
	.xword	0x338b71b7e011017b
	.xword	0xc34a826e66ca4ee3
	.xword	0xde7bc9b397d941fc
	.xword	0xbf885ed50de45b49
	.xword	0x7efa4c2c678c7f30
	.xword	0xec313f454a859402
	.xword	0xdf53c980962d0ffb
	.xword	0x0652a93cea3c852c
	.xword	0xfc815bf7fff29903
	.xword	0x6b24579ee630b3b4
	.xword	0x93576eb6d0642d76
	.xword	0x951fc3458787590b
	.xword	0xf54a4e4f2055780d
	.xword	0xda485795a31e195a
	.xword	0xfd75ce4083fabe90
	.xword	0x5305ef8620f7442a
	.xword	0xac8f991e6c99ce2c
	.xword	0x27836a45cb02c441
	.xword	0xfa6ed14c49b6daea
	.xword	0x51b06d1d37c00899
	.xword	0x4cd630183c25a27c
	.xword	0xa799affdd0fa60eb
	.xword	0xddac289ad6ff099f
	.xword	0x57b24d45f0ce7171
	.xword	0x03704a597012c8fa
	.xword	0x3e8fbdea899a1593
	.xword	0xa669f09fa42b02ca
	.xword	0x03d224083f1be9e8
	.xword	0xbdd3dfb5ae01bd3c
	.xword	0x7782d743dbfcaf86
	.xword	0x9df6aeea3ef90411
	.xword	0x2edb73153d350d77
	.xword	0x444b9ce5f0f9b3e7
	.xword	0x03f3c5e96fc52f7c
	.xword	0xdcc41408b1d3db8d
	.xword	0xfefaa2c68ee59009
	.xword	0x152601b5640e70db
	.xword	0xcd43af065fa62b6a
	.xword	0x4edb55fcbd5b63f5
	.xword	0x6790b180db276715
	.xword	0xfdf92d94627d7cae
	.xword	0xc6636d1f2de4a591
	.xword	0xf91c33ba06a8875c
	.xword	0x6f0d4a02be9b2532
	.xword	0xd131c2aba19d8044
	.xword	0x940e1064af0b3451
	.xword	0x46463d07f19018bb
	.xword	0xa5c46614c048edc9
	.xword	0x1dbb449be7758c86
	.xword	0xa236fa0c859079e0
	.xword	0x3b27e3d885e47e4b
	.xword	0x28391dfd25f5c394
	.xword	0x41575a178befb24c
	.xword	0x3c0953c209e70429
	.xword	0x5cd9490bc5fc9482
	.xword	0x4cb63f17d1ea056a
	.xword	0xe648298b48952b14
	.xword	0x11b7db7ae37cd3ca
	.xword	0x79b2ca97d57d9aa3
	.xword	0xbd37fba86047d3ee
	.xword	0x098ab3461e82c6ef
	.xword	0x075f45bc8a862e88
	.xword	0x9e64709516e927c5
	.xword	0xfad933313d7948ec
	.xword	0xefdbb6a62545aed0
	.xword	0x5a1e1b70e796c2ee
	.xword	0xd37ec4cd138f91a4
	.xword	0x8953721162f535cd
	.xword	0x1081eec639d5e343
	.xword	0xfb6cd4a4c4996ecb
	.xword	0x0f729bb034bda3c6
	.xword	0x06d0a8e1df4e7017
	.xword	0x0cce0e991958bcaa
	.xword	0x4307fd6265fb7094
	.xword	0x1f5d25b1f626e3ae
	.xword	0x95839ce13cc95e38
	.xword	0xc83f74c094455ade
	.xword	0xe55a63ddfafe094d
	.xword	0xd23aada770c2f3e0
	.xword	0x1e608d19bac20334
	.xword	0x401461aa64f4e865
	.xword	0x5d7eb27ff9932b94
	.xword	0x4f9604c226466ae8
	.xword	0x393d625a1e835933
	.xword	0xd5ab97537c040dce
	.xword	0xbe1c320d51260314
	.xword	0xd2e9dff6fe33714b
	.xword	0x008143f43ad25ba0
	.xword	0x291cdc58084a35f9
	.xword	0x351b0c7c361d5099
	.xword	0xc142c2936bfd15cd
	.xword	0xb7b0110f42ec4f9f
	.align 0x4000
	.data
data_start_2:

	.xword	0xcb50a881749ba01c
	.xword	0x9c6cee4259e95353
	.xword	0xb40057d8d53b199f
	.xword	0xea9fcfef9ba1028b
	.xword	0x8bd2324b11da0f5f
	.xword	0x3e6e7656eec54fe3
	.xword	0x537adafda872f06c
	.xword	0xa12624a898d6efc1
	.xword	0x30db5fa5abbd34dd
	.xword	0xa29c354a1adb1a9a
	.xword	0xcead36a9a96826bc
	.xword	0x49b70f90de81a1e6
	.xword	0x72f36f9d54184fb1
	.xword	0x48f6faac84222846
	.xword	0x8fd747dd593ca2af
	.xword	0x7cb99ce1579f6cbe
	.xword	0x4a459e1edd184af5
	.xword	0xb4f0e4fb7e689c92
	.xword	0x1b12f2885323141a
	.xword	0x56c3767c325abc34
	.xword	0x431b655749027655
	.xword	0x793fc438d7602a4b
	.xword	0x3e23e6956a260e77
	.xword	0xa959a78abc423a29
	.xword	0xfabbef270c6e2c66
	.xword	0xb822a6abb9f2e6df
	.xword	0x31c48f4849f96e34
	.xword	0x7b1b0d1e1961774b
	.xword	0x846ac5c71563f1de
	.xword	0x93ae7ad958138105
	.xword	0x56d76899a6082ad7
	.xword	0xace157db2b13ebd5
	.xword	0x77cfde1a455b45bb
	.xword	0x421f169dc25919fe
	.xword	0x3699ffff4612439d
	.xword	0x9af4929705fa8624
	.xword	0x0cee2150f4a8fa90
	.xword	0xa2f7dd9b852751b9
	.xword	0xb9de15dd08122b21
	.xword	0x918630964aab5599
	.xword	0xcc57becf74bd3d61
	.xword	0x2cc5a9924c99fade
	.xword	0x51c7f007e7762eb1
	.xword	0x5e0894623c06b066
	.xword	0xfa3d8483637543bf
	.xword	0x54bdc5cdc84502a8
	.xword	0x4e7e3c08b33fa3c6
	.xword	0x11997f99faf3537a
	.xword	0xff9ee6202e44d6b2
	.xword	0x367f5a0945ac8d37
	.xword	0x2d46e6891faa23a9
	.xword	0xe42e1e407ac2c3e5
	.xword	0x25e5bd6959d6652f
	.xword	0x0495a01a414e32d3
	.xword	0xc18b19f6bc6b2022
	.xword	0x439f8dc633bafe6b
	.xword	0x3bfb530eb7b0a805
	.xword	0xfc1f3e12734074fe
	.xword	0xc208a6315abdb1e6
	.xword	0xa8f8c31df5c9b133
	.xword	0x5f48a708047897c3
	.xword	0x2ca9f2f0271bde2f
	.xword	0x1ffacd2a2b52dc02
	.xword	0x00727faa59bb656f
	.xword	0x465d15c0d4e3bb26
	.xword	0xe19a0172a3aabff5
	.xword	0x37ee50aeebe06527
	.xword	0xe21dd5ba9fb868e0
	.xword	0x6d632c782a67c3be
	.xword	0x8271f5f69c10b712
	.xword	0xc3ad0d88c119079a
	.xword	0xad90265d671a27a1
	.xword	0x1ac5e5077a6025be
	.xword	0x82b69ce7d23e1ad0
	.xword	0x59d699c7994a74ef
	.xword	0x34c412dcb6f05f27
	.xword	0xf729669d3cfd30e9
	.xword	0x0e05c411db0c2b7e
	.xword	0xcf68f881f05cc9ee
	.xword	0xa3a5e171f3ae00ca
	.xword	0x10979cb2bad64c0f
	.xword	0x4cdd5cea12157cf4
	.xword	0xfcaf35c1fc7999a7
	.xword	0x996564f973ec8178
	.xword	0xc94e875039dc4c12
	.xword	0xbf8d1a2421ce70d5
	.xword	0x72d43087e5f739bf
	.xword	0x178f90853078be84
	.xword	0xa64bd758ba0b07d9
	.xword	0xf93a41fad01e76a3
	.xword	0xe3ad2be2edf74c40
	.xword	0x7967f9222b168a1b
	.xword	0xc66132920e0fa3e7
	.xword	0xfacfb4bc6872b54e
	.xword	0xce901c93cbe4435d
	.xword	0x3816837e5486bd27
	.xword	0x4c478cff1a98f2c3
	.xword	0x7004e7a2ee70a083
	.xword	0xd6de9370c374e099
	.xword	0xe64c909b37f32783
	.xword	0x6bb3f701a214d1e2
	.xword	0x09263e5307c2c334
	.xword	0xc4fcde9f2993a83d
	.xword	0xaa8ed98c4ea604d3
	.xword	0x1aa56d7f87736203
	.xword	0xacdafdfcb2d576e0
	.xword	0xf1bed1c1d8602828
	.xword	0xef80404c09b28596
	.xword	0x86da01d4ffa0deda
	.xword	0x0ee874d81b3db485
	.xword	0x5b2e93e6e20e8610
	.xword	0x52023fab5bf26d11
	.xword	0x2203a65a2a76f531
	.xword	0xfb253a20a17929e0
	.xword	0xdcb22a6c11d160b5
	.xword	0xcefc1e939cf1654a
	.xword	0xd3a43dea968efb9b
	.xword	0x4df7674deacce8f4
	.xword	0xd16a05502e0b25e1
	.xword	0x75d7a4c38e006728
	.xword	0xee30b612ceb2a615
	.xword	0xad9590379ce52a21
	.xword	0x17c4bac4dac74a2a
	.xword	0xb5d25218b9fc8f4d
	.xword	0x939be4c2cab58540
	.xword	0xd7f5595e52739b25
	.xword	0x26e01fb17d641aa0
	.xword	0xf71aceeb21660199
	.xword	0xe7c906c03bec4acb
	.xword	0x96f48316e7b45ef3
	.xword	0x3de887ff6f045ab1
	.xword	0xad69c19a0c0f9dc1
	.xword	0xd67c9860c7105e31
	.xword	0x0a03b0c32316d9ad
	.xword	0x40878aac3a9cca77
	.xword	0x335faa903e10fcf7
	.xword	0x89a3ec1e1d7020fe
	.xword	0x05c0ce36e11f64f7
	.xword	0xd40d9e7a67722546
	.xword	0xccaffe19d33eb5c6
	.xword	0x32ddd2190f59c027
	.xword	0xf7cf0c4a0407f46a
	.xword	0xb0c8083e30b1cb8b
	.xword	0x246afce468c5c801
	.xword	0x2de655250a9d9323
	.xword	0xa9eb5ab2ed4b3baf
	.xword	0xb1c461e44981d02b
	.xword	0x285829f1901df30c
	.xword	0x91d4d548dc04b63c
	.xword	0x49657ddd964f2791
	.xword	0x54abd6413ffe49ba
	.xword	0xaced2eee28620ec6
	.xword	0xf130dd326e5130cb
	.xword	0xfd3c5ce55d606f7d
	.xword	0x26238efce470a2bc
	.xword	0x7cb850462996fdc8
	.xword	0xa75e544b4668bfdc
	.xword	0xe7b3be3a14447703
	.xword	0x4482a9b797ed96dc
	.xword	0x832973969b0e367d
	.xword	0x6a7661d37479cb1f
	.xword	0xeb100da3ce158191
	.xword	0x52b2f2efce6e76b9
	.xword	0x4f55117663701b45
	.xword	0x8fbccb7018e1d037
	.xword	0x8693284be1c717c5
	.xword	0x585aa2bbd66e4a24
	.xword	0xccc92a5912fd742b
	.xword	0xe15fc0e693ac609e
	.xword	0x691777c4493f9299
	.xword	0xdaaa6bfffe732e22
	.xword	0xd347f4ccc3b9631a
	.xword	0xad8a0f630b5fb8f4
	.xword	0x0d5a3b07408a859b
	.xword	0x0c5695cee780167d
	.xword	0x0370a0735a757448
	.xword	0x17549bfa963de8fe
	.xword	0x19752024d4c2f0d3
	.xword	0x9daf9205cd232cdc
	.xword	0xf0ceaddcbb13f4a7
	.xword	0x3b4fcd1672cc36ef
	.xword	0x9736e83cb9aa931c
	.xword	0xaa09ce17021dfb5c
	.xword	0xed838537a76d8513
	.xword	0x5f42721ad74e9b1d
	.xword	0xd3ba055536290ba7
	.xword	0xe313527433edb45c
	.xword	0x9e74ffbbed926c28
	.xword	0x86d9c1c3bac44b3e
	.xword	0x2c4384973b3237b5
	.xword	0xbe86904539745601
	.xword	0x072c52015fbab1fd
	.xword	0x07b69245a1668d31
	.xword	0x8a154a6da82d3ae8
	.xword	0x5d257f3715e9bc27
	.xword	0xcbe49e04381db359
	.xword	0x87ddaecff7d46bae
	.xword	0xcb9437f8c58d2233
	.xword	0x6830b69b42b9cfa4
	.xword	0xbd8e7126fada6b1d
	.xword	0x82d6bf7b70bc05db
	.xword	0x211ece7ecce077e8
	.xword	0x202540b0a04aacb5
	.xword	0xf66e577e6eedc96e
	.xword	0x869c4a88347ed793
	.xword	0xc077dede57eb2e0b
	.xword	0x68c488726dc64091
	.xword	0x55dae44ebe712ac8
	.xword	0x9e8f4e064b8c65d6
	.xword	0x4322636a2330d45f
	.xword	0x8efab04b45e98d24
	.xword	0x21f0a2368523613b
	.xword	0xc9506798bf93887c
	.xword	0xa69103a98cb8cdb3
	.xword	0x55fbb0b748336437
	.xword	0x63db9a4a1f36eadc
	.xword	0xac3d11c74dff7fe4
	.xword	0x98fa44ee92b1c343
	.xword	0x920cdfda309bae3d
	.xword	0x003153f78f88eba3
	.xword	0x3e06e829ebab017a
	.xword	0x29f0ed9c5349fcc1
	.xword	0xe154bbad71b75755
	.xword	0x4e9bed9d059acf2b
	.xword	0x450eb29eeb01add1
	.xword	0xa215cf820d4e8f77
	.xword	0xaad1b6c71df3045b
	.xword	0xae7290485a10b6b9
	.xword	0x8ee15629e9d0f553
	.xword	0xbe66331fa948606c
	.xword	0x33e3252fdd9b2883
	.xword	0x3aa89ca4ba67fb1c
	.xword	0x35c7d85ade192c90
	.xword	0x6a80eed49943a541
	.xword	0x626fdc4ba954a7e3
	.xword	0xc1c8759ae2311007
	.xword	0x9fc32ee741546d1d
	.xword	0xff3f1b53a2c03d56
	.xword	0xdb777f65a6b7293c
	.xword	0x13c987419306eda4
	.xword	0x5b3782f087dfc45c
	.xword	0x31bea256676eff24
	.xword	0xc7ec4dd98f9b2be8
	.xword	0x6773ae730c8c7a50
	.xword	0x10981099c2dfe6a6
	.xword	0xc149bd0e4abc68f2
	.xword	0x3c583d687309513b
	.xword	0x2fea957525494776
	.xword	0x20a17807d7568051
	.xword	0xffa638d46867601f
	.xword	0xb4fda802a94f2429
	.xword	0x37b7146f876fae48
	.xword	0x30c4d0ca8279af3d
	.xword	0x86302a3168a6c65c
	.xword	0xe26ab5ba53608268
	.xword	0x88cc3025b1d66256
	.align 0x8000
	.data
data_start_3:

	.xword	0x085a1dfcbdc075ce
	.xword	0x5f36a0daeb00de3b
	.xword	0x1b092b4a4f3112ae
	.xword	0x09814f5cf16705eb
	.xword	0xe228fefdd1ee5cf4
	.xword	0x91dade3276436bc6
	.xword	0x36cf319b952fb2c6
	.xword	0xfaea102035da5d22
	.xword	0x71466939aff9265f
	.xword	0xcca57d0b88db9f3f
	.xword	0xcd63b834245af7cd
	.xword	0x97b5ecdbbe11bd89
	.xword	0xdceae3ed5eb00727
	.xword	0xcdd4418b5bd1e1e8
	.xword	0xfd81c3a71f99e08e
	.xword	0x22a06df6076e1a4b
	.xword	0x8d384aa1fa0a2829
	.xword	0x2fb9e455f1bdf300
	.xword	0xcd2abbf6f4847380
	.xword	0x405f89cbd29c961d
	.xword	0xe62ee57c880e5907
	.xword	0xb8716f9cdcd6f3f7
	.xword	0x3bb08dfa67b9ab92
	.xword	0xe0d3fe6694970114
	.xword	0x511fdf9fade22d90
	.xword	0x44cc2cec9b767ef6
	.xword	0x6a006f0d1802182c
	.xword	0x68f214fa12a0e78d
	.xword	0x108802a9fb2bf543
	.xword	0x17fef4a4fadfdce7
	.xword	0x8bc6bca4be8e6205
	.xword	0x216805ab07e3dfcb
	.xword	0x1e308b893154c293
	.xword	0x016e65ece9421a70
	.xword	0x1df35db04cd11f0e
	.xword	0xb4bb5b3f1eb1d28f
	.xword	0x2d0c000e90bc7e60
	.xword	0xdfa120fc1b739930
	.xword	0xe7a91bef7d818afc
	.xword	0x3a7290676e03c561
	.xword	0xf9a824c78a7f9749
	.xword	0xe62f45886a3b7356
	.xword	0xbda976bc1ac63858
	.xword	0xfe1817a66560dbfd
	.xword	0x2f93e54e32a954af
	.xword	0x387e0dabfa177cd0
	.xword	0x3da9230641fa9987
	.xword	0x4c99a72fd86bb50e
	.xword	0x57da243b05600f10
	.xword	0xce4fa69f2d46dc07
	.xword	0xdf771a4fcc245799
	.xword	0x59b75a03101a7f27
	.xword	0x3d18ff1f5218480a
	.xword	0xf94e286555e438c8
	.xword	0xe5e967cdcddeb04f
	.xword	0x6dbf2da12d53c01f
	.xword	0xa5a552f79e791308
	.xword	0x7de2b80a9dc2446f
	.xword	0x0881536bc1610c8e
	.xword	0xa2cb5df0cb3d86ab
	.xword	0xeb116540da599d44
	.xword	0xec01b49084708d4d
	.xword	0xc4d8c574bf9da1a0
	.xword	0xa0effb1c1f2f8f62
	.xword	0x82a930a75b7d3010
	.xword	0xb8b8ac8ab79f2815
	.xword	0xcd436f4dcc23226a
	.xword	0xcca91952278adc9e
	.xword	0x5c7e7ac8eb9faa30
	.xword	0x2d88578d0d057e34
	.xword	0xb7e6204f07f30c86
	.xword	0x17ba0f98a2d55c88
	.xword	0x9aeb44f1f75796ee
	.xword	0xcbf501b1df655e0a
	.xword	0xcd8f9483e4b3beff
	.xword	0x94e97f7ce0440baa
	.xword	0xac671eeafad6d49b
	.xword	0x16c4e224ffd4c041
	.xword	0x103d1dc14ddd88e5
	.xword	0x481566fc0947f004
	.xword	0x16ea6a0b6df6a039
	.xword	0xe93bbb796dc7577f
	.xword	0x500db981950066c3
	.xword	0x894405496bed9fb9
	.xword	0xb8bdc32dec9cac35
	.xword	0x71361b7995bf037e
	.xword	0xc3050983e64777d2
	.xword	0x151709a2d61a5af9
	.xword	0x626d613ca1a8232a
	.xword	0x9339b5c3a1249b70
	.xword	0x85dc9feda6126da4
	.xword	0x366de15742334f47
	.xword	0x050348d5f34401df
	.xword	0xc885e5a858b98896
	.xword	0xb626a12a282cdc73
	.xword	0xe30518aea4abaeaa
	.xword	0x30d2673bc0ec1d34
	.xword	0x32c824dd90335488
	.xword	0x0f07eed2a6f69286
	.xword	0xa2e350cfa45a927e
	.xword	0xd4ccddd49969b859
	.xword	0x427a2f6405ca4aff
	.xword	0x215c105e131499a5
	.xword	0x6ab608d761c5de06
	.xword	0xa97085bdf301a6d0
	.xword	0x55873fd17ae905a7
	.xword	0xb1776fa465443c9c
	.xword	0x13dc3e03983d3341
	.xword	0x346b1151f8f5b16e
	.xword	0x58eab6ce970945af
	.xword	0x36e14603c2a0b147
	.xword	0xda5840d67cb34ce5
	.xword	0xdeef4873a93c23c7
	.xword	0x476128b2aefb246a
	.xword	0x11672f480fef17eb
	.xword	0xaa0655d173ccb384
	.xword	0xfb3496dda42bce88
	.xword	0xcd73ea817ae480ea
	.xword	0x8b06803d707af8b0
	.xword	0xa3ff3133c2a57c17
	.xword	0x7848cfc5102d34dd
	.xword	0xbb40bd157a8af893
	.xword	0x5240e2f55e1d7ff8
	.xword	0x7bd0376336a1b6ca
	.xword	0x6225cd28190aec5a
	.xword	0x14f189e89b88bd03
	.xword	0x527b8802463ac4cd
	.xword	0x93759a9170d73c29
	.xword	0x0d9f58d169078ad3
	.xword	0x78d98caafe61a80b
	.xword	0x2a970822a87eba99
	.xword	0x0bdaa207fe656934
	.xword	0x78124e3057d56e15
	.xword	0xb72731495beb5ded
	.xword	0x6e6d14bbb9355728
	.xword	0x808cbedebbd40453
	.xword	0x57c9c91bda592924
	.xword	0x3edc90126f11d6e3
	.xword	0xcedee92ff2672e29
	.xword	0xef027fc2c262b552
	.xword	0xe0d2dad58d39fcef
	.xword	0x7d51e33ba5d050e0
	.xword	0x6ae5e19acb5a8263
	.xword	0x9703a9931a64caa3
	.xword	0x0faf00f44fa18001
	.xword	0x9c56ba26c741a6e5
	.xword	0x90cd8379a99444f0
	.xword	0x3970edcb3f751007
	.xword	0x7d3f253da48e7e5e
	.xword	0x4e0cb555140ac1fe
	.xword	0x5cb404ea762caa0c
	.xword	0x5409b69c68d3d50b
	.xword	0x8a82837e5b870d8d
	.xword	0x81629718a652e177
	.xword	0x222bdb2bac69bd01
	.xword	0x2f46c00d854594e2
	.xword	0x89a821385f69fc2c
	.xword	0x95208bab567af2bd
	.xword	0x2c407919a4790f76
	.xword	0xb12269eba368a582
	.xword	0x8b8dce3a6de30549
	.xword	0x18d82a87cf5deca4
	.xword	0xf4f0cb5a25ef0861
	.xword	0x6423e49a3b8a62d1
	.xword	0x9b0a6a3add8b4401
	.xword	0xc19e40acb80b2bfe
	.xword	0xf0ec7ed6eed94d53
	.xword	0xe5050ded7870b5d2
	.xword	0x898ba7d43c41f737
	.xword	0x791fb86836bd1062
	.xword	0x92909c33bababd4a
	.xword	0x4814a83f484d3bcd
	.xword	0x25d8cd00d379e377
	.xword	0x0433b8725baf8155
	.xword	0xc4a7e588a62ce9a8
	.xword	0x2f82047be9c14e29
	.xword	0xb86eb286ea9e20a8
	.xword	0x9e6754510537ac2f
	.xword	0xeaf8b2a2723980f5
	.xword	0xe3bfd198a1c21481
	.xword	0x657bb44b016ffa1e
	.xword	0x1c595cc21675e171
	.xword	0x581001881493d698
	.xword	0xb0988aa72d7068d6
	.xword	0x9290353bca413b53
	.xword	0x3f82476a61c4da28
	.xword	0x5f2daa3800a1c8cc
	.xword	0x6fab0d7ec241127f
	.xword	0x2f21926490326158
	.xword	0xc748fb83e63268da
	.xword	0x6714908e24b58710
	.xword	0xdff5e1b5a22037bc
	.xword	0x9a509f5e6654fd59
	.xword	0xa37589a91cfadcf3
	.xword	0x44cb283e3b1eb9f7
	.xword	0x0ca59750fc784b8a
	.xword	0x3f43fb9dd091c4e0
	.xword	0x27537ba05b95ed40
	.xword	0x719d18ed982e80de
	.xword	0xcf1fad60735ff708
	.xword	0x5124c493f0e724ff
	.xword	0x74cd415ef6784227
	.xword	0x9e351128d1dac7b5
	.xword	0x6af9d8060c5266d7
	.xword	0x714fba9fc27f45d4
	.xword	0xf9906ab495af9560
	.xword	0x975bd33cba743d89
	.xword	0x74514eca4752e2e2
	.xword	0x24bdfea28637bc2d
	.xword	0x1d07b898473d5ca7
	.xword	0x344aa77ea3983674
	.xword	0xb18a280c1accecef
	.xword	0xc60edef21c998c2e
	.xword	0x5add2706ab14d59f
	.xword	0x495d041e84dca4ef
	.xword	0x64d8d6d1de1d7391
	.xword	0x43144c9069bedc4d
	.xword	0x0dbe9d2178260d26
	.xword	0x87192953fdd4f39c
	.xword	0xda521f62b768fe1f
	.xword	0x1d1881d7385d0550
	.xword	0xafff2cb95b931d67
	.xword	0xbde1aa539960e947
	.xword	0xc997e90a5ffb1d19
	.xword	0x12fe05e80a5f0ef8
	.xword	0x2c7536b1def74340
	.xword	0xdcc004b7a8965cc4
	.xword	0x64ee909d5971c988
	.xword	0x7e9cc0a914e7c770
	.xword	0x8fff60e454f72e53
	.xword	0x04983d21d1c41e41
	.xword	0xa8a900a4b3eb57e1
	.xword	0x64156bae3b09954a
	.xword	0x5c2054802bbc05c3
	.xword	0xff719b1aaef62ceb
	.xword	0x9d25652ce1bdc66d
	.xword	0x5e352a1abae9b2fb
	.xword	0x31c63977e18bde2b
	.xword	0x34cbe91342fd2749
	.xword	0x1d4dd88172102d69
	.xword	0x78f4c3708b7298f9
	.xword	0xfd226e36e44a7801
	.xword	0x6cec45feda0ec81c
	.xword	0x515df9e6f6bf9082
	.xword	0xdab554b64418f404
	.xword	0xb38a5b0900e71937
	.xword	0x17df8d2eb434d87e
	.xword	0xfe30e9ffe16bc80d
	.xword	0xde6da67b19e4f12a
	.xword	0xe85ae30329d00e97
	.xword	0x0d6f7306c3751e1f
	.xword	0xd3553c0b4ffa29c9
	.xword	0x0acc36b3c10cabdb
	.xword	0xd98350e3291e6574
	.xword	0x328e1de626571548
	.xword	0x6c399c71917d06bc
	.align 0x10000
	.data
data_start_4:

	.xword	0x6d5af839755c7e3c
	.xword	0x4dfd17eebb3b6229
	.xword	0x62f89d8ef76aa998
	.xword	0x41cb69358e72bf4f
	.xword	0x17f1a83b843b142d
	.xword	0xa25dae15afeaf79a
	.xword	0x2a7681ed070ef4a8
	.xword	0x3c1dc389da856a80
	.xword	0x8d35cabb55ce0c3d
	.xword	0xcceccd65bd740d7e
	.xword	0x83fe3a90fccf5259
	.xword	0x948f59dada052a60
	.xword	0x9064678595c9ae76
	.xword	0xa489e080778ef973
	.xword	0xfdd0ddabfbc9311c
	.xword	0x5571f9193017a495
	.xword	0xa6ecdbf933de08a5
	.xword	0xcb25819ef0f690e7
	.xword	0x80ab82bfa367f5cf
	.xword	0x64abac0c9bbd863b
	.xword	0x87636fdebd218632
	.xword	0x15cc92bbf386ff78
	.xword	0x1b4bf70a8ed83c72
	.xword	0xca70f178f75bbfcb
	.xword	0x094fb77aa423dcdd
	.xword	0xf19bae6cdea34f47
	.xword	0x8f72768620765cba
	.xword	0xafb9edf9ef4b9347
	.xword	0x68fc91b955efae0a
	.xword	0x16333ebb1be0036e
	.xword	0x121627664dafb29d
	.xword	0x412b6c8287b2d29e
	.xword	0xa65b5b8655392b36
	.xword	0x95e3b457ba5b31d4
	.xword	0xbf9b2340b3698dc3
	.xword	0xc6877af42ab6b066
	.xword	0x489c314a0732e888
	.xword	0x38a8bace8a735f17
	.xword	0x11cc51ededc62b1f
	.xword	0xa410b5e78aa3dca5
	.xword	0x9377bc214ca1ad0e
	.xword	0x34b4803baf216f6a
	.xword	0x45c3bfcfce546d68
	.xword	0x0188c32573d3c73f
	.xword	0xc3abdaa9a3402f42
	.xword	0xa0958d4d72c95986
	.xword	0xc09856570a13b2fc
	.xword	0x9f2ce5b8bd665ebd
	.xword	0x11acc1e841abff71
	.xword	0xa83a9b00280504bc
	.xword	0x3cc96e8d79092315
	.xword	0xf922e2a76ef310eb
	.xword	0x353c2bb1ebdfc873
	.xword	0xcafb5290623c301f
	.xword	0xae91193437975e92
	.xword	0xa8a05c900e78f7a8
	.xword	0x29d248b8656daf5c
	.xword	0x40a0aa6bc7076153
	.xword	0x6ef0c4257034751a
	.xword	0x8ba5fad0471b3c48
	.xword	0x3fdcd6b80f12bfaa
	.xword	0xd6bb4fb776ef8c06
	.xword	0x123006f7efd0d0c2
	.xword	0x8ae38eccdedd11cd
	.xword	0x6f028ccfe5a04a9f
	.xword	0x9034ab437fdc7738
	.xword	0xb2bdba8a9f5ed1d5
	.xword	0x136768c4e78f0e1d
	.xword	0xef3c46462c530ed2
	.xword	0x824f563f73154b84
	.xword	0xdea5c2c2dfc29b13
	.xword	0x432c8fac3e06bc03
	.xword	0x3d731e3ee5ac3ed9
	.xword	0x36252ae9c5bd82e7
	.xword	0xd32d94a7bf752b1d
	.xword	0x1f2a5d8b5d609006
	.xword	0x32a511d50dd16e78
	.xword	0xb057f8ac8d9d098a
	.xword	0xa46e99cf1e4bde44
	.xword	0x241980f15fa6b699
	.xword	0x208d3b17f09c40fc
	.xword	0x42a6cb1fa96f2d82
	.xword	0x110b8ca69fa33a86
	.xword	0xb0c0823d2935f378
	.xword	0xe04d69911ae90251
	.xword	0xa440945df5992b03
	.xword	0xe82fd85a7a3c97a1
	.xword	0xb6bbf0d14605cab3
	.xword	0x657632ba46b96e3c
	.xword	0xa32f049b9318d122
	.xword	0x81ac4510dd182dfd
	.xword	0xed3e30a3a50e29d9
	.xword	0xe31ebaf141a579cb
	.xword	0xf7d4a2f47dfc74c2
	.xword	0x04cbf34f247602bd
	.xword	0x81823275516eb98c
	.xword	0x1b74ad8549603b45
	.xword	0xb993bd56b5a3d9b4
	.xword	0x66845711d9d4310d
	.xword	0xb99c408a7d44959f
	.xword	0x7a21ce35a33ef804
	.xword	0x1cd124e5eb736f34
	.xword	0xc9f4608e31f4f411
	.xword	0xbb6c5cae03b4459d
	.xword	0xb49e7e5bfbb76cfd
	.xword	0xd3446864ab3f5243
	.xword	0x9c32927b73016867
	.xword	0x5d61013a1e92b305
	.xword	0xd071a049dc5d2cfc
	.xword	0x82a36aa391893816
	.xword	0x3135de4e39cd253e
	.xword	0x15ee1d7b82cf9674
	.xword	0xcb1b4086254ff1e3
	.xword	0x5dfeee14e427d653
	.xword	0x3a602595a228c4b2
	.xword	0x4b40373a0e0926a6
	.xword	0xab8994d890a3e06b
	.xword	0xad8cdf91083ff835
	.xword	0xd82379587baeb50b
	.xword	0xd93407c8357273aa
	.xword	0x506857ad9d78f19b
	.xword	0x0d3a1eb6a0806bf7
	.xword	0xf8b2bd54260573fc
	.xword	0x793679cec252b653
	.xword	0x78018c223e3d3f76
	.xword	0x96a51358200a3d8f
	.xword	0x6054ac6ee542d88c
	.xword	0xa3f750ecd30f4e0b
	.xword	0x37c26a86939f122b
	.xword	0x612bde54c59abdb1
	.xword	0xb3377a88986b2d31
	.xword	0x9ae1a4d0cde96a7b
	.xword	0x6d072447ad9582e4
	.xword	0xf5ee31d1b51049a3
	.xword	0x9795aa2ebf542ab5
	.xword	0x6dc7084aebd5baab
	.xword	0x479e99b62cb32b4e
	.xword	0x33759b2fb33dcdd7
	.xword	0x167d23c7f85d71a4
	.xword	0x73556e150293829e
	.xword	0x51c128e7ecd9bdc9
	.xword	0x362fef500eacb4eb
	.xword	0xfaef5493bbdf5b3d
	.xword	0xb65cfd6d22d27c2e
	.xword	0x4b346371fb032307
	.xword	0x59a0eab8cfac2438
	.xword	0xec4b4893a690172f
	.xword	0xbfc22adf4185b34e
	.xword	0xa81624f98887565a
	.xword	0x217c8d73171d4fa7
	.xword	0xb263d5ed79011ae8
	.xword	0xf566512fe9babd96
	.xword	0x41f68ce656947d75
	.xword	0x12fb2e8df384135a
	.xword	0xa43bef5d2ce09c01
	.xword	0x103dcc28fff80012
	.xword	0xd7e6f10f63644f62
	.xword	0x6398147211155aa1
	.xword	0x278707012ca99cc1
	.xword	0x31a15a8856907c6d
	.xword	0xe1a4aacf2811467f
	.xword	0x26a0e3622ee44e59
	.xword	0xad3648d6d89cf3c5
	.xword	0xdd7233f482ff40bd
	.xword	0xa6b82fc35d007bcd
	.xword	0x54f97a0882a0727b
	.xword	0xb742f734979a7d93
	.xword	0xa8a5a1915d6596a8
	.xword	0x3f1b838003139791
	.xword	0x22bc4e942e6a5ae9
	.xword	0x69c208397c495f1c
	.xword	0x3eaf9e7459526144
	.xword	0x636459331b57be0f
	.xword	0x87a6c668466f6853
	.xword	0x3384057b03f9d839
	.xword	0xaaa32500997c36ee
	.xword	0x8861614ba445307e
	.xword	0xb6b83b8ea7df840d
	.xword	0x974f6754bf013e89
	.xword	0x0f664aeb47459a05
	.xword	0xe42442940b6325c0
	.xword	0x8d1334460bbee4b1
	.xword	0xea774e39e59952e8
	.xword	0x71cd59115d81c522
	.xword	0x5522ab80ea28fae5
	.xword	0x531232dc7014b1fd
	.xword	0x5eab6f9ce94b28e8
	.xword	0xab06c138f26034eb
	.xword	0xeebffe01a3736baa
	.xword	0x396791a243f27a76
	.xword	0xcd058c68f320b9bd
	.xword	0x2f51694a11838943
	.xword	0x6e0795ac257334a3
	.xword	0xee3d9a70136171fa
	.xword	0x47a2fbec3e116bea
	.xword	0x80acf2525e965182
	.xword	0xb21f72fc00e1cecd
	.xword	0x086273be45aa4718
	.xword	0xe06a6fef1303f59d
	.xword	0x8dc33cdc641eecce
	.xword	0xe98c58ae0c0e53a7
	.xword	0xff064b8a680ee7cc
	.xword	0xb0fce8861df53e6c
	.xword	0x66b5e1105ee784d7
	.xword	0x7038221becc39482
	.xword	0x7bac3630dea8d2f3
	.xword	0x77057a3559a70b41
	.xword	0x6ffc82bffd79d69b
	.xword	0x2bc2970d17731bd5
	.xword	0x8ec37ecabb788b3f
	.xword	0x1e7ab2eececae26f
	.xword	0x7be99f4521871029
	.xword	0x3bdd7ad677023f53
	.xword	0xd2dffdd956ced262
	.xword	0x09560dfbee1fefd8
	.xword	0x53da9fc3773d973c
	.xword	0x02afba6a9ed04c16
	.xword	0xf1d842a6ed14ae38
	.xword	0x74e6cc0c7afe78bd
	.xword	0x1e6f2f6d9228e211
	.xword	0xf9f41fdfb88cce49
	.xword	0x0461d9a3607997f7
	.xword	0x35a9e5010039a76f
	.xword	0x30f7198da0415b59
	.xword	0xf8b513f4575c2255
	.xword	0x132b141b6d815737
	.xword	0xebbb85a2163d1a1c
	.xword	0x0c64fb9297867017
	.xword	0x63de6e2990612c37
	.xword	0xad09f29b2b92626c
	.xword	0x2901db3d57a62b2a
	.xword	0x2a2d72e93b512922
	.xword	0x98ceaf2b74299f81
	.xword	0x64956343512c0270
	.xword	0xee3c75951f90ec74
	.xword	0x76c0a8e5d5efc882
	.xword	0x3510ed3c815b72d7
	.xword	0xf816304f015a8793
	.xword	0x4abb6ceaca57c6dd
	.xword	0xffdfb05a8b60d0d0
	.xword	0x0cfff34b7633785d
	.xword	0x2337977a1bab239a
	.xword	0xe49ffd9ea76b3a26
	.xword	0xf7974efd2c62c4e5
	.xword	0x175bf02c09c3c193
	.xword	0xde87cd5cc114512f
	.xword	0xef372b496e9121bc
	.xword	0xf72780fe61fe7b40
	.xword	0xd85040b8fc6d977d
	.xword	0xb7baf14f5b2d1d02
	.xword	0x95553cd822f2f389
	.xword	0x0bbee5d042af2b91
	.xword	0x0edd211bea406464
	.xword	0x8d2f1ede537cbc25
	.xword	0xe1dbf59ec21abde6
	.xword	0x1c1dbed117162e07
	.align 0x20000
	.data
data_start_5:

	.xword	0x00ca832a37347ea0
	.xword	0x3defdd4e959dddf7
	.xword	0x2276426841ac84fc
	.xword	0x009f16becc1a13f3
	.xword	0xb94d844dd80a3e66
	.xword	0x85cbe9943f606fd1
	.xword	0x75c91e2a772d4af0
	.xword	0x6c17c06f3037c721
	.xword	0x1191eb94a2c51c56
	.xword	0xd85de76868e7aa0c
	.xword	0xb58bf5c26b9b0fc1
	.xword	0x993d20ae74bff6c4
	.xword	0x26f09f805a79a174
	.xword	0xf29db38e6fbacd46
	.xword	0x0d1b84453bfce13c
	.xword	0x484cfc42f6c7947f
	.xword	0x6d26654f376bdc2a
	.xword	0xd0369113a3724381
	.xword	0xf34fb52d6c7373e5
	.xword	0x9e4d51ce699e6f35
	.xword	0x8aadf9dece4110ad
	.xword	0x850259ac3d10817b
	.xword	0xbadd47acd5a3f7a5
	.xword	0xed99a9d770e513c1
	.xword	0x1fce57e5ff8438ba
	.xword	0xdf4617fb8033a16d
	.xword	0x97e62186de07ae58
	.xword	0x1dc403e941d12ebc
	.xword	0x9437dff2f69e4fe1
	.xword	0xfbbac757e7163fc8
	.xword	0xa0a6d3f40cf6d430
	.xword	0x75e5449cd0af384c
	.xword	0xbdc1729d393ebb2f
	.xword	0x456111910a9a1091
	.xword	0x619018f0e3cad407
	.xword	0x5baf9a650787c822
	.xword	0x60f7cfd5047da03f
	.xword	0xf0eeedd1a1e20e9e
	.xword	0x4aed1a3c542b4dc7
	.xword	0xe6f7e0ef5321b021
	.xword	0x12ba870d19f3eddc
	.xword	0x05ba75b45544074a
	.xword	0x367f9c8dd7e55e7b
	.xword	0x5409b2ad2dd8bcce
	.xword	0xf7bfe2156c764727
	.xword	0x6b8af02b36993b85
	.xword	0x9036efcc24418e67
	.xword	0xb84ee84b586383e2
	.xword	0xb9d46a02e20acf2a
	.xword	0xb397dac3f6526259
	.xword	0x28c0708d222b3f00
	.xword	0x938be1aec9ef50e7
	.xword	0xe2af5e194d266d46
	.xword	0xe2d05ecb71d18399
	.xword	0x0fd486d8999c9907
	.xword	0x0c431698647763c2
	.xword	0x34e313c26d3d89c2
	.xword	0xd19c4361014095a6
	.xword	0x7fe913a851688f64
	.xword	0x4be08f8762582b59
	.xword	0x783d1c9d92572c83
	.xword	0xc7ce184b7cab41bd
	.xword	0xd9cdd83b95ee4398
	.xword	0x04a8eac514de55fd
	.xword	0x2c85385f161ba3a0
	.xword	0xec9115a0d6eef0f6
	.xword	0xad9149a44d5c9957
	.xword	0xd970ee2f082c9d0d
	.xword	0x5420acb48d2c06cb
	.xword	0xac5b2c54a1d2da1c
	.xword	0x6fe36b93b8120c9d
	.xword	0xc3b5f6ee88859014
	.xword	0xbb06acf795fb024c
	.xword	0xec1404c496ade5a7
	.xword	0xd7f06b7809b27cac
	.xword	0xcfe47023e088a402
	.xword	0xfe2fbcec58be3be5
	.xword	0x4749deebced1b8fe
	.xword	0x341df9869402946b
	.xword	0x4d13c71745cf8d93
	.xword	0x74a7f3ea232ddd5a
	.xword	0x511b644e00b270a4
	.xword	0xe486647ddc3460ef
	.xword	0x947bff66bed026bd
	.xword	0x3615fb1e718af4d6
	.xword	0xa936e03e4e968fd3
	.xword	0x64c1c5d87b7c51b0
	.xword	0x436f006b6f48b175
	.xword	0xf6bc81ff866a2579
	.xword	0x6cc2feb341d9b016
	.xword	0xe756c81534c8c69b
	.xword	0x7f949264d7ef3c94
	.xword	0x0add4baa75de6d0f
	.xword	0x6a9da3dcc7b19757
	.xword	0x67ddc0cacba00e16
	.xword	0xcfd1ad5b3d161b06
	.xword	0x906ce33f5d21cb9d
	.xword	0xb4392ce693af37d3
	.xword	0x0db3f9de550a1019
	.xword	0x29044abcfe3a576c
	.xword	0x1c90453a8c31682a
	.xword	0xb3c377bd57dde183
	.xword	0xd6132f555193c8e4
	.xword	0x6bafcc1fc8821ffd
	.xword	0x8a1e9292734b90d8
	.xword	0x6dc0ed67eb41c168
	.xword	0x572d063611a5c842
	.xword	0x0e750360c653bcf8
	.xword	0xddba9dd7a025217f
	.xword	0xc8475b31960f1b7b
	.xword	0x6a7ff46cf98c5243
	.xword	0x437b299a405403d2
	.xword	0x161a04eeadf463ab
	.xword	0x5e2db34b61e366d9
	.xword	0xd192ad3a2d0674c9
	.xword	0x2d854d9f5657562f
	.xword	0xeca843fe914b9ac8
	.xword	0xe8e5cb2483b672ea
	.xword	0xbed45aca656eca5c
	.xword	0x9b62e3730465946e
	.xword	0xa29f6cbc969675b1
	.xword	0x8e6adb9cd3548323
	.xword	0x6d6c734d76c6ad25
	.xword	0xa7a95fb7c26d4e2e
	.xword	0x13863feff680da62
	.xword	0x5b5b13c8ed91bb09
	.xword	0xcc0967275dc12ac1
	.xword	0x1bae54a0c60cc5cc
	.xword	0x2324b641eda056f5
	.xword	0x8de7d76a5d5c0b41
	.xword	0x2d55aeca7233ba95
	.xword	0xfcfd7359de894659
	.xword	0x499faa67719df001
	.xword	0x3571f20f8888739c
	.xword	0xf306607773b17a83
	.xword	0x44fb5ec5c4a3943e
	.xword	0x7ce77f638fa6927b
	.xword	0x53ef257ba4959184
	.xword	0xc7811ed73e17428a
	.xword	0xeb76ba63712cfb4a
	.xword	0x2660f49c778c4109
	.xword	0x21843ebc6d114e32
	.xword	0x8eb1be9725cebe61
	.xword	0x00061a3acc43c5fe
	.xword	0xb2acdbb96923ae2b
	.xword	0x8dc68990df6a5fb5
	.xword	0xf749fa5284c5d65e
	.xword	0x8a42815b7a75180f
	.xword	0x990587bd8514309d
	.xword	0x0c965b3ca563aa5c
	.xword	0x5e8a9dc48a35b649
	.xword	0xbcc9e6c263913b83
	.xword	0x492b92a11e4d6330
	.xword	0x327cd79b4c5e5506
	.xword	0xdf290e1b6565599a
	.xword	0x2a0ea4141d63406f
	.xword	0xb8c09aee62d198eb
	.xword	0xb7b41b304b82781e
	.xword	0xf84223bea0362bf4
	.xword	0x91172078c492e989
	.xword	0xbbda41168ad972dd
	.xword	0x59385e6a64a238cb
	.xword	0x7506142c9fc6d02c
	.xword	0x69c5d06d2ecb85ea
	.xword	0x4b2066a3ffb6d35e
	.xword	0x889cfd7565f4f5f0
	.xword	0x5fd4762da4c30712
	.xword	0xab93196307ba3376
	.xword	0x4d76faed6ccf9658
	.xword	0x47fe1845659a5ea9
	.xword	0x053f19e8f6ec303c
	.xword	0x38071a23bd990c5c
	.xword	0xb91680c133e0ccbc
	.xword	0xbc13de87cc8b812b
	.xword	0x49a1d8330a05308e
	.xword	0x2891ed8c7543e622
	.xword	0x665e5eb84daa430f
	.xword	0x49fcf473004fee7d
	.xword	0xde1f8d349158cedb
	.xword	0x96c967426f5eca9a
	.xword	0x1cec1066b3402fcd
	.xword	0xc6415a0ad3d4b8ee
	.xword	0xf5d70fee340da7ad
	.xword	0x352d33e17e43ff32
	.xword	0x2cf1633564932e70
	.xword	0xfc68931e4822da66
	.xword	0x1f8d48c08f314771
	.xword	0xd6201fcc049b24c0
	.xword	0xc719bb1ed70cee05
	.xword	0x34f30c900e96d151
	.xword	0x3b90121d79560e66
	.xword	0xb2337ddb321849ac
	.xword	0x96386aabb694900e
	.xword	0xc5e9e08b6115b867
	.xword	0x0a00f84bf6b723a0
	.xword	0xb4c504b4978419da
	.xword	0x273cb4761120467c
	.xword	0x6ca541e94264c2e8
	.xword	0x2552cf5a74592894
	.xword	0xc42d81da58429ff0
	.xword	0x0af79cf05606a42c
	.xword	0x0d694c759cf77bc7
	.xword	0x461a824dbf37bbf0
	.xword	0xd231b9055a67e9c5
	.xword	0xaef08fc303ce7433
	.xword	0x9b912c6b8a972639
	.xword	0x9bf6d82bc6f3af8e
	.xword	0xbdca3958e266510a
	.xword	0x55c80b8deec52389
	.xword	0x7c87e96998f5df3e
	.xword	0x6b1660e9e68028b1
	.xword	0x77ab1912eced2dbe
	.xword	0x674623b000e3db32
	.xword	0x304472f7fa7f9924
	.xword	0x2cff17b683fd7a40
	.xword	0x4694e36424ef8021
	.xword	0xbcae57f2e0d7ffc6
	.xword	0x39a6b7e294837402
	.xword	0x5ecf273c6da7fbb3
	.xword	0xe56ff7191512f81f
	.xword	0xe1cc997469f86f18
	.xword	0x7b389233145c40a1
	.xword	0xe665f6393dd1cf2e
	.xword	0xa8313f671120f3b8
	.xword	0xcd4f3ab64549ef90
	.xword	0xcb525485c5b2a72b
	.xword	0x1c0c88615d4fdd66
	.xword	0xceb0361288c79696
	.xword	0x9a281208d78cd18c
	.xword	0x3d42a3cafac82619
	.xword	0x0f8c1a950c8106d5
	.xword	0x407074d07040adb2
	.xword	0xc80a86c3b1e559ed
	.xword	0x4259fccc4f9ef4ee
	.xword	0xb006b41fb0c51391
	.xword	0xb87d2b3e0dddc11b
	.xword	0x882e767eb6255449
	.xword	0x941a92f4bfa7a70f
	.xword	0x397a61c4459c1010
	.xword	0x3db621a7446095b6
	.xword	0x99d3537b1613ee20
	.xword	0xc6cf94387a8bf220
	.xword	0xac6cdff4c4a1fb2f
	.xword	0xb130c8cfb7c8702f
	.xword	0xabec0d3635462c7b
	.xword	0x4c09945d9b45a015
	.xword	0xf388ea9d9b1892c2
	.xword	0xe9af73d3e28739e2
	.xword	0x4f19ba731dbbdfdd
	.xword	0xa980f647ea6f7eb8
	.xword	0x574348eb8c5732b5
	.xword	0xe7b5271596ff3ca5
	.xword	0x87d772a715f13ce4
	.xword	0x30a8421ec939e7ee
	.xword	0x7dc420720d42268c
	.xword	0x99cc23cbf9b94b36
	.align 0x40000
	.data
data_start_6:

	.xword	0x8f803912554f0b14
	.xword	0xae51ea91652f30ac
	.xword	0x338dd36865649e9e
	.xword	0x5120f2e197432d4f
	.xword	0x40ccf078024d1837
	.xword	0x95c5d6ae22abb8b1
	.xword	0x2f4cda39cd134015
	.xword	0x25804f0ac04af331
	.xword	0x705c8133e665eb34
	.xword	0xc238ad987b845d3b
	.xword	0x04de00b9c03b2d91
	.xword	0x48e8cc7bad802a28
	.xword	0xb7678d94e61c61f5
	.xword	0x123803ff54b0d328
	.xword	0x5236a3dd8ca528b0
	.xword	0xa281ca1573b0d83c
	.xword	0xda69b40253d1a484
	.xword	0x730ad5d6c9d802cc
	.xword	0xa33b33f2212aee33
	.xword	0xc3985e72ca920d1a
	.xword	0x68d7ac19dc41e2b1
	.xword	0x087b64e9f7199ad3
	.xword	0xfc60898972b56df6
	.xword	0x0128bc5b157338c7
	.xword	0x16bae7410f43267b
	.xword	0xc572198ca7e15f14
	.xword	0xb6d96d9aaf5a6f81
	.xword	0xb34a00e861cd5d0d
	.xword	0x4cf0f6650a366a98
	.xword	0x9f13d62760d8ce6d
	.xword	0xa5fd3ed79b2de3f2
	.xword	0x664f4aa5d45552b5
	.xword	0xeecba14bd8ba69f5
	.xword	0xe5393d9abedf38b5
	.xword	0x2d4abe1c334cf53e
	.xword	0x4c7cf71c1161a4ba
	.xword	0x06669f9640fd4637
	.xword	0xa21b1ebd41273204
	.xword	0xf9b947929771d2cb
	.xword	0xa903068084e0d4a8
	.xword	0x5a10a70c25505c79
	.xword	0xedb46b8906686b1d
	.xword	0x0a67239a8c9a966e
	.xword	0x08dc0b7b9edecd25
	.xword	0x28eb9c6d67bc5a8a
	.xword	0x7632d053b9f0ddda
	.xword	0xc394d3bcf1ac41cc
	.xword	0x9cbf75b91b3e3439
	.xword	0x565240fce4b6d22a
	.xword	0x57afc02bb78846db
	.xword	0x1f20b089125ef8c4
	.xword	0xd3a72ef3433b06ce
	.xword	0x0c51bfe31d3252cf
	.xword	0x30236fed6699fd12
	.xword	0xff5f8591e6c3dd3d
	.xword	0x0350faf6d17eba64
	.xword	0xb33014fee11f8fa2
	.xword	0x66f1ffe6c3cdc4ca
	.xword	0x1e8c8d984b4ef526
	.xword	0x76fa6ce431affa0c
	.xword	0x3ce64a7892b673f0
	.xword	0x61899869c91858d7
	.xword	0xcfedae9d2ad568c5
	.xword	0x268ecef189985b5c
	.xword	0x9da7643a8fc5e62f
	.xword	0x0ddfa610c2da6dc3
	.xword	0xfad692aad5563940
	.xword	0x0e480466832ed14b
	.xword	0xb54232cd4d028f91
	.xword	0x43adc9e682848359
	.xword	0xe7b6f024c73e37bf
	.xword	0x93f3dffab4fef72e
	.xword	0x9d4fc9f41cc81eda
	.xword	0xe6588c9234b23c42
	.xword	0x65b62ffe2bc21723
	.xword	0x9ae3b74ff3dd172c
	.xword	0x8cd49540a9ec3ebf
	.xword	0x9fb83183d97430c5
	.xword	0x35fa0093ae13a574
	.xword	0x9dac44da99af2128
	.xword	0x9076c036ce9d0f31
	.xword	0xbea6f923ca9cad27
	.xword	0x3337a0b28f294090
	.xword	0xcb92acfed77d327f
	.xword	0x4622ea9eb20498a4
	.xword	0xa0255fa28d911a54
	.xword	0x9d312c83dfc234bf
	.xword	0xf2e3fc4435006d19
	.xword	0x7b66d03a77a649d5
	.xword	0x06d33ea4859f1cf9
	.xword	0xe171be2c23a4a9a9
	.xword	0x3fce9fb23c985f77
	.xword	0x1ac2476b91dbceb2
	.xword	0xfc9b4e1bdd48aa2d
	.xword	0xc4f4042a3659464c
	.xword	0xb0e13dd9f041b3d9
	.xword	0xd40b0a312c60dbf2
	.xword	0xafc0efdcde0eb347
	.xword	0xc3a2c35625076e12
	.xword	0xeacf66290f03823f
	.xword	0x3983961f82bab78d
	.xword	0x1c4caa447dbed43a
	.xword	0xcc3148180aee68b6
	.xword	0x792f3acf616abb43
	.xword	0x849619a06d7c1287
	.xword	0xee67aec83f870d55
	.xword	0xa66650c7e3e98fe3
	.xword	0xcf246e345ad5595f
	.xword	0xbed7ca9af032822a
	.xword	0xb1844385ab3a257c
	.xword	0x8cee409645a723d2
	.xword	0xda17091fae34918b
	.xword	0x0597371ed96d7a4d
	.xword	0xa59d86ffa74dc605
	.xword	0xf393ba60a6af433f
	.xword	0xc6c58fe42cb7ab22
	.xword	0x3fd4554c9595b07f
	.xword	0xaf66f7bf4033a91a
	.xword	0x45f1f5fe20854388
	.xword	0xad8130ad37c9fad0
	.xword	0xad4c10a1caf5603d
	.xword	0x7ecfd8690579f927
	.xword	0x71181a42c47f99a4
	.xword	0x8c1a82f01ff80fdc
	.xword	0xffc89d02ea4291b6
	.xword	0xd0c35d06c40cdc7d
	.xword	0xe149d516b1ccef73
	.xword	0x0a8c298c575aa114
	.xword	0xe45a02098413204b
	.xword	0xee68956eb4f68953
	.xword	0xe86a89133a6273e2
	.xword	0x6376724307b79d44
	.xword	0x63d5f343f3880642
	.xword	0x8f2ab80f2fcd99bb
	.xword	0xcd49bf5be9b0ad18
	.xword	0xe49a23a061c5c2e3
	.xword	0x9a7de7d995d71142
	.xword	0x978afb782008d56f
	.xword	0xa4b1688094e5c5b2
	.xword	0x6512655563e8be96
	.xword	0xfc2894789276e284
	.xword	0xd0a6efdaad23f19a
	.xword	0x2ffed3b0799124f5
	.xword	0xabbd1f5c57dfaa51
	.xword	0xa9b6ce8c1ac8ed6c
	.xword	0x243be61627e2c77e
	.xword	0x455f143f67d81a4e
	.xword	0x73c164801ffc1a4c
	.xword	0x0ea1a6d1e22f34b7
	.xword	0x8245dde30c44893f
	.xword	0x94fa0a64380a151f
	.xword	0xa9a0886cacacee27
	.xword	0x059553acc16f9944
	.xword	0x5de7961a422a997c
	.xword	0x0343d889a8622729
	.xword	0x07e7f2dbc78790dd
	.xword	0x2d1b41b0dce889cb
	.xword	0x2241fcaee8cca69c
	.xword	0xf0b71395f701c85c
	.xword	0xb5449a464bfd8af5
	.xword	0xc21cfdf077f5a586
	.xword	0x77b4c7e228e1d6ec
	.xword	0xb35a97b955507acf
	.xword	0x47af2e398a83a8c9
	.xword	0x4a63452c45559298
	.xword	0x98f24905a2394f0e
	.xword	0x215e5056deb44bf4
	.xword	0xfe2679593681f289
	.xword	0xf3a2c5e7be9deb96
	.xword	0x59a20f049b8f7162
	.xword	0xb1c05db2462cf134
	.xword	0x488542e1ecf341a6
	.xword	0x2bee11064f5c06fe
	.xword	0xf43b0ec5e32c5ef3
	.xword	0xec2bac44cafffaf7
	.xword	0xc587ea91e19a155f
	.xword	0x31a80252e47860a8
	.xword	0xd0e0ad05f8502474
	.xword	0x7c41df47370edd33
	.xword	0x4fedbb913fb73bce
	.xword	0x1c2217a1b014253b
	.xword	0x74487960c5b2b68c
	.xword	0x0fa2084a2a4b4f51
	.xword	0x876649ce723b8610
	.xword	0xa4d6609821692130
	.xword	0x67c3152a92638362
	.xword	0x67de28f8638355a4
	.xword	0x4933cd20955c65ae
	.xword	0x239e41d8668b56bb
	.xword	0x9999565f91ad3bb7
	.xword	0x43244f9fd3aab746
	.xword	0xe321205c2d4c0676
	.xword	0xf88ae387ad61a6d2
	.xword	0xd829a8de7aac10d4
	.xword	0xa8f26502c7d58e9f
	.xword	0xfed6abc765b4d8e9
	.xword	0x469ba06bf071494f
	.xword	0xbb8cfc1974ce8926
	.xword	0xb2d9d79858d4a59b
	.xword	0x2a313689119323a9
	.xword	0xd4d8230f3bf4c723
	.xword	0xb2dfafb815b1661e
	.xword	0xe178788a3c47b55e
	.xword	0x090e1cad3107d3a0
	.xword	0xc8ced57a42e50e16
	.xword	0x32ade2f2284e703a
	.xword	0x25eb5dd061072a8b
	.xword	0xbfa5fbc02f6a4a76
	.xword	0x4cfa79cfcd8ee6ba
	.xword	0x1e633259102ba277
	.xword	0x5e2ff70c64cb393f
	.xword	0xd4de50cb045ec64f
	.xword	0xf3825baaadfab5d1
	.xword	0xce9a0ed4b1b74d8b
	.xword	0x83ac212a497eeffd
	.xword	0x2f2a0eadf9958682
	.xword	0xdeb882f75d512754
	.xword	0x0b60ac22d4dccb62
	.xword	0xe119810c38ac5bbe
	.xword	0xa85e603e9fcdc2e0
	.xword	0x22848592226a3576
	.xword	0x145dd8c7e28ab2ff
	.xword	0x0cf3812edf7295cb
	.xword	0x3c54cd61e7177b86
	.xword	0xbece96db6391fc4e
	.xword	0xc014c9c163d501d1
	.xword	0xdc1d46c5b3ce1503
	.xword	0x68ae192c991fdebc
	.xword	0x6917717675d201dc
	.xword	0x737d4d29999ff826
	.xword	0x06f467c8195e27d7
	.xword	0xc523ed784c877d79
	.xword	0x46e3faca4c28c286
	.xword	0xcd61c4b59469c453
	.xword	0x3b46f783bfb8b1ad
	.xword	0x2b2e1edf0e60e63a
	.xword	0xa9c39d128466406c
	.xword	0x13a14cbca33d6899
	.xword	0xdea2b94ec9d2df07
	.xword	0x1c02c08c0c1e8a6d
	.xword	0x542810c5aa8d5b65
	.xword	0x470b54f1fb7d6591
	.xword	0x84e0856af2f8b517
	.xword	0x8db68df035e626a9
	.xword	0x9491ebb4082d15a7
	.xword	0xf98ed437760910ea
	.xword	0x9e2d3feb81c675aa
	.xword	0xc75c336c995904b0
	.xword	0x5c9eccf905896b64
	.xword	0x3e8c14817c8886b6
	.xword	0xd1500131b35a21ed
	.xword	0x426ea43c3904d63b
	.xword	0x87469f267a617a1f
	.xword	0x24661bca67f2b193
	.xword	0x53fb8e06b40d374a
	.xword	0x6b263ccb0bf3ad40
	.align 0x80000
	.data
data_start_7:

	.xword	0x01689284d46f54d0
	.xword	0x27a01c58cf0db0b0
	.xword	0xbe7dec511319346c
	.xword	0xf5d184093f84190a
	.xword	0xc33ce1f54045414b
	.xword	0x79e7bfef6ed70282
	.xword	0x19b8fb41682c72c9
	.xword	0xeede2fe35961db20
	.xword	0x635c7b1a3cde70b5
	.xword	0x336404b67adcd633
	.xword	0x873b4e32f00c1891
	.xword	0x6725fa5eb65ea0ed
	.xword	0xe87d7397cc785f62
	.xword	0x0d44bb975aee67ed
	.xword	0xc16a0542db45cebd
	.xword	0xfc46f39d260dbfcb
	.xword	0x7039160a2878a70a
	.xword	0x6baab24e37ecdb40
	.xword	0x74653323938754f2
	.xword	0x74b898ebd0ecedbc
	.xword	0x9d404a9c40b0b981
	.xword	0x24b8420a74299ace
	.xword	0x77783f673ef67d22
	.xword	0x9fe59453f5a94003
	.xword	0xc67e4121990ac3e5
	.xword	0x31e2f25b9af07893
	.xword	0x5f5a3294c0236fe6
	.xword	0xecd6260f391d2f8f
	.xword	0x608748f0ed462bea
	.xword	0xefb7f9c6ee458395
	.xword	0x4a3b9aa926bbbbd8
	.xword	0x969acd54bfab60d1
	.xword	0x7ea94c65e6af82b3
	.xword	0x93bae757e47e4650
	.xword	0x089c17c487ee1c0c
	.xword	0x253f55ca91f57180
	.xword	0xfc0b2dfa7350a5fc
	.xword	0x96bc7699022203c1
	.xword	0xd4babe2daaf4fd6a
	.xword	0x17b7d3a2a0095300
	.xword	0xe55d65b03fc716ef
	.xword	0x1278fafca67f4634
	.xword	0x37e9c02705e144c6
	.xword	0xe2bf96ee94e4720f
	.xword	0x818b79ea6f1bb417
	.xword	0xecdb85e643aff4c3
	.xword	0x94437704cd6958c8
	.xword	0x035b968b68de67f6
	.xword	0x3e475a305bc94645
	.xword	0x46c02040136f561e
	.xword	0x755d82a072265197
	.xword	0x9a14b553a91d945d
	.xword	0xa495b6e60a4b2d79
	.xword	0xac0e9f2c18bdaa6c
	.xword	0xc15df36a5b6e656a
	.xword	0x7895d2ea381924fe
	.xword	0x28d02ffda662d166
	.xword	0x7d66f9923c20b24f
	.xword	0xe760fbffeba873e7
	.xword	0x56140f09e9e3be9e
	.xword	0xcfa94074cbbd1ac6
	.xword	0xb19cb8020ab4a758
	.xword	0x92b71d4e2b6dfc5a
	.xword	0x10d395590b727f27
	.xword	0x6123c9b2dce103ad
	.xword	0x46744753f1c5f357
	.xword	0x1feff00727fe172d
	.xword	0xddeaa5bdc2c63608
	.xword	0x1051f84aa7b587bc
	.xword	0x9d165efe7e71a8b0
	.xword	0x71f783a0bb87c5f8
	.xword	0x62a90d33fcedef8d
	.xword	0x6e4a3ad924822dd4
	.xword	0x499b0f556fada62f
	.xword	0xadfd6bc3a08bd576
	.xword	0x34883875db0995a4
	.xword	0xc32c477fa134e312
	.xword	0x77b1718d2a31a9a3
	.xword	0xd198c947943971db
	.xword	0xff6141003824944d
	.xword	0xb09cb50accf35a23
	.xword	0x66c6cd0eaedc2ddb
	.xword	0x82ac3f74b0a2e640
	.xword	0x040fcb924fcb5707
	.xword	0x5057c6fb74412eb9
	.xword	0x7b884b212c842ae9
	.xword	0x610fb15ac804ecf8
	.xword	0x27d347b7f7b0031b
	.xword	0x1cff8558c7065638
	.xword	0x6ca6b1cdf2878ffa
	.xword	0xa606f13d45d0db84
	.xword	0xe1b0f9df7ecf6f93
	.xword	0x44b6214a2dcee3f4
	.xword	0xeb1293ab5e15662a
	.xword	0xb1cc73f4a46b6768
	.xword	0xc82314e9f98c24b3
	.xword	0x58fe4f5b28888c43
	.xword	0xd9f78cf829f20e90
	.xword	0x7e2bb123d12b006a
	.xword	0xd5dc9a7ac876c6c7
	.xword	0x8de9f8908d1743ac
	.xword	0xe2eb01f14708ed19
	.xword	0xc9f61d42ba8dd0ad
	.xword	0xd0e2c86b29aeb8c2
	.xword	0x2b664fcf279c04ed
	.xword	0x5768d1d2f416ddc5
	.xword	0x31ffdae24cf9bd9d
	.xword	0xc7106bd2dfd0e1e5
	.xword	0x71e5943a51f14a64
	.xword	0x313997d96f720b9c
	.xword	0xb51648b34f3ef123
	.xword	0x287042c4d76e98a2
	.xword	0x78d968fe2005776f
	.xword	0x67bbb9bec11ddbbe
	.xword	0xf662ec3d0fb056d4
	.xword	0x6d1600f9864dd489
	.xword	0xfbc15b16f708c972
	.xword	0x8f9dcbf8102786d7
	.xword	0x7ecd8ee895642a19
	.xword	0xcc9a8bf87cfa0107
	.xword	0x6c09c6594277e5df
	.xword	0xdc0fd547c09e83e0
	.xword	0x700bb3455a5142f5
	.xword	0x4ed7d62071ba04fe
	.xword	0x49675d65459c6727
	.xword	0xca5fc0f56cbb3f9a
	.xword	0xdf747913e7c719c4
	.xword	0x3a9063472515510d
	.xword	0xe9a449672cbfaf14
	.xword	0x0e2672b903cb1bb8
	.xword	0xaeb0eaa55a66d8e6
	.xword	0x3138072c3f874aea
	.xword	0xf820d046cf4f44de
	.xword	0x8dfda5001c372a60
	.xword	0xc96e8847a1b7736a
	.xword	0xfeaa6b1a99b73e07
	.xword	0x15ca2405c9fced86
	.xword	0x219711f9163f4ea6
	.xword	0xbc3ca887dbfcc860
	.xword	0xfafaa5235e762ca5
	.xword	0x91253563d2725cfc
	.xword	0x73e18aa7830e16e4
	.xword	0xa54c5610822f6671
	.xword	0x61f23ebece21f95c
	.xword	0xde11dbfcdf826c58
	.xword	0xd11bb1df39902f67
	.xword	0x5417784532f0a9b6
	.xword	0x88ebe36ae6dbced2
	.xword	0xe64a3c12ae76d650
	.xword	0x2a57b8e483be73d8
	.xword	0x83117d2767a55d11
	.xword	0xab4daa722d85462b
	.xword	0x245b1180c4825867
	.xword	0x3716ec280fc9d83e
	.xword	0xefa57f8a380015eb
	.xword	0xf91173bd8ec6bbc6
	.xword	0x5f5cecc1419d491e
	.xword	0xc137f81d8dfef539
	.xword	0x5c2070e80accd357
	.xword	0x649f44dc7e56dcc7
	.xword	0xf1f9b12877fe1fee
	.xword	0x4bd99506cbb2356b
	.xword	0x287f8773c2d7074c
	.xword	0x6bc3daabfcce617a
	.xword	0x6a72bd0f6a4997cb
	.xword	0x20cbbee56a099da8
	.xword	0x28266d1f2e827bf3
	.xword	0x6836996ea6aed975
	.xword	0xe79530a2835a1066
	.xword	0x460879526c895e88
	.xword	0x847fba10ee9f6ecd
	.xword	0x69144d461feec5a0
	.xword	0xf71bb5cecb410a75
	.xword	0x2e73a05ef6ce2e60
	.xword	0x75bb55bd7898eb59
	.xword	0x4f10f3a4e8791683
	.xword	0xd208425d2df2cfe9
	.xword	0x24c1e4d67e475482
	.xword	0xee7af36805bb07b1
	.xword	0x070a9dfd23ad5260
	.xword	0xfa1a5339f5fefdec
	.xword	0xd0f8a264e9aa4931
	.xword	0x6f14a344a3db5b5d
	.xword	0xd170a23e57e3d95d
	.xword	0x4c8186175462e841
	.xword	0x0f634fed8d14ba72
	.xword	0xae719556dc451047
	.xword	0x6fde5e97f825ea69
	.xword	0x4cd84e42c6ed303f
	.xword	0x5eef6ab04531bc7a
	.xword	0xd5fce2e91aea2bb8
	.xword	0xdb8b407a909dc6dd
	.xword	0x76e0755fe00cb955
	.xword	0xf2b7c589fdfa3bdb
	.xword	0x29a7a80fed1031d8
	.xword	0x0f65f0be4ee408c8
	.xword	0xa83c60cf439da110
	.xword	0xcee1842b353cec25
	.xword	0x185590b1f3a9192c
	.xword	0x13db38c286b6d195
	.xword	0x87d3b72c7d08b94b
	.xword	0x5bbadbaeb6a7aabc
	.xword	0xdc98d83ddeabb85c
	.xword	0x392fb3e2dc69aad6
	.xword	0xc0f039f71ddd918c
	.xword	0x55acee206274b9b3
	.xword	0x40c759aa05f819a5
	.xword	0x3bc4adf3d173df89
	.xword	0x396bace39ef26d39
	.xword	0x2c1068db253a6d46
	.xword	0xe8f4a488524c5cc6
	.xword	0xf2456d283405e749
	.xword	0x6b32d1d80ccf6124
	.xword	0xaf9a9b0ac5d3ffe4
	.xword	0x56b28e2a14c1896b
	.xword	0xbfc68880a6828ec3
	.xword	0x914fd2373a106c2d
	.xword	0x7130ef10d1bd48d1
	.xword	0xfd9d3840a6af34fa
	.xword	0x770dbee01cbcb2e5
	.xword	0xd7457fb22a5229f3
	.xword	0x905f81b13fbd7dd9
	.xword	0x146f9f95a6cad0fb
	.xword	0xc07b0962ae79f5f2
	.xword	0xa6fc8e0e0a9e2f87
	.xword	0x1a65ada4e9f43367
	.xword	0xe19ca52a774e1b0c
	.xword	0x9537dd61ceb5a248
	.xword	0x409618454949d46d
	.xword	0x3ee2e8f75232c1dc
	.xword	0xfa8a51bdf1796224
	.xword	0x7583844b23dcbe1d
	.xword	0x3a682c9ae696abfa
	.xword	0x5125b826510495ab
	.xword	0x6be4517032da7197
	.xword	0x3a8ab1c38ea8892d
	.xword	0xd5a1ca6ff4f99aa2
	.xword	0x9998543dce8291f8
	.xword	0x29e631a1fccd9d8d
	.xword	0x5a7c36268a10820e
	.xword	0xddfb9e25d1a829c2
	.xword	0x79baacde440ad598
	.xword	0xa17b1a6d42eb3565
	.xword	0x91cfee26d2631258
	.xword	0x081476752b731d68
	.xword	0xe26e4cfdda89a743
	.xword	0xd120f88e7b0c530f
	.xword	0x2749b420b47a2e12
	.xword	0x37de58393e50c812
	.xword	0x2d1b978154212432
	.xword	0xef1d8355e998091a
	.xword	0x6d0502d9418d7e0b
	.xword	0x37abf16305dbe3d8
	.xword	0xe7a7b426e56573a5
	.xword	0x42ec3717378343e3
	.xword	0xe33134ad0e1f69ba



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
