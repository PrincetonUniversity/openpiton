// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: tlu_multi_mix_2_hwint_s0_69.s
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
   random seed:	112152099
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

	setx 0x634d57bfca29d99a, %g1, %g0
	setx 0xb4ae796d1f1af7d4, %g1, %g1
	setx 0x619239854dff0199, %g1, %g2
	setx 0x78046db0382eb331, %g1, %g3
	setx 0xceba010d139d5522, %g1, %g4
	setx 0x75741881dd28157f, %g1, %g5
	setx 0xe8730b1adf6bf011, %g1, %g6
	setx 0x295c1d30a9f7fcd6, %g1, %g7
	setx 0x7f28fe1903401886, %g1, %r16
	setx 0xdfc39109bc8068b7, %g1, %r17
	setx 0x8cf9e694fbe91b70, %g1, %r18
	setx 0x5ac3db96663e1ce3, %g1, %r19
	setx 0xa35643e39874a72b, %g1, %r20
	setx 0xad6007eeb0d0a320, %g1, %r21
	setx 0x5c31da41ae77ec8c, %g1, %r22
	setx 0x4195ee9f950ff8d2, %g1, %r23
	setx 0xe1aacc66f20a6b11, %g1, %r24
	setx 0xa326f7e6cfe7d54d, %g1, %r25
	setx 0x9dd1d1c63f49e185, %g1, %r26
	setx 0x7fd492ae1b15ab05, %g1, %r27
	setx 0x5c4cca0935430d48, %g1, %r28
	setx 0xad85ac08ff4f4e6c, %g1, %r29
	setx 0xc11db8898bbf30b8, %g1, %r30
	setx 0x5e611dea2f83c2e9, %g1, %r31
	save
	setx 0xba5c67e11b28cfc1, %g1, %r16
	setx 0x25afb60b0f7422cb, %g1, %r17
	setx 0xb4dcb1936fb0ea5a, %g1, %r18
	setx 0xe443016f8852b898, %g1, %r19
	setx 0x09fe69e285aedd94, %g1, %r20
	setx 0xbc698058e8b3aba4, %g1, %r21
	setx 0xf02c1258881270f0, %g1, %r22
	setx 0x08b8b14b50a03fb4, %g1, %r23
	setx 0x35cc362b6ae35e9e, %g1, %r24
	setx 0xb5f6543e2eee81c8, %g1, %r25
	setx 0xbf184ff7d76d2d4d, %g1, %r26
	setx 0x0a14273961d753ab, %g1, %r27
	setx 0x78ec434738dc98b0, %g1, %r28
	setx 0x2d4f3aa00545eee6, %g1, %r29
	setx 0xf632340dae7278dd, %g1, %r30
	setx 0xa93a4d77a9922235, %g1, %r31
	save
	setx 0x54242f725de6dce3, %g1, %r16
	setx 0x0244472a0dd7a11b, %g1, %r17
	setx 0x91034c0ed6f166c3, %g1, %r18
	setx 0xc8d7b1955d6027ea, %g1, %r19
	setx 0xa52a8227b2a7d9eb, %g1, %r20
	setx 0xa4a424ccd42d1b34, %g1, %r21
	setx 0xa6b2f4f90f29c6df, %g1, %r22
	setx 0x13ae953545297619, %g1, %r23
	setx 0x0087a1b09841da5e, %g1, %r24
	setx 0x18f45a49a52adcf1, %g1, %r25
	setx 0x93764bd81652dfa5, %g1, %r26
	setx 0x7bcfe03b3f0caed3, %g1, %r27
	setx 0x723d99764a4ca96f, %g1, %r28
	setx 0xe579fb04972e3d18, %g1, %r29
	setx 0xcc43e8ae54d41091, %g1, %r30
	setx 0x1222f269313fbf17, %g1, %r31
	save
	setx 0xf209a1ae64a401f1, %g1, %r16
	setx 0xd7226a03af2b2f61, %g1, %r17
	setx 0x77a05d84bebad0c8, %g1, %r18
	setx 0x53d930fe96371dbc, %g1, %r19
	setx 0x660a4aed14f7eb5a, %g1, %r20
	setx 0x62231f54b22aab74, %g1, %r21
	setx 0xdeb2bd4b83e85af5, %g1, %r22
	setx 0xbfd157c2f29da52f, %g1, %r23
	setx 0xc49592a0b3012432, %g1, %r24
	setx 0xd3c9cb54e7c5f6eb, %g1, %r25
	setx 0xa8731189ff7472aa, %g1, %r26
	setx 0x77e7cac7e3da1c1c, %g1, %r27
	setx 0xae70da6c00c4811a, %g1, %r28
	setx 0x670ad5bdc0370723, %g1, %r29
	setx 0x4ce21f91ebd6e1b7, %g1, %r30
	setx 0x3b5b0480dc4f1a05, %g1, %r31
	save
	setx 0xadec449dfe61800c, %g1, %r16
	setx 0x551d0053511e5dcb, %g1, %r17
	setx 0x9f4e65e501b8c822, %g1, %r18
	setx 0xb14bede7122cc387, %g1, %r19
	setx 0xe3c91f2245ac07f8, %g1, %r20
	setx 0x6194774290cb85a4, %g1, %r21
	setx 0xd052134a828cd6cb, %g1, %r22
	setx 0x8b65049c036810b2, %g1, %r23
	setx 0xaa4f1508abdfb6a5, %g1, %r24
	setx 0xbaa68c93a1c87343, %g1, %r25
	setx 0xfd1f530770a334b4, %g1, %r26
	setx 0xebbd31d5c03d5658, %g1, %r27
	setx 0x39cf7e4999beb95f, %g1, %r28
	setx 0x2a3bb73778406966, %g1, %r29
	setx 0xc82066b9d675b2a3, %g1, %r30
	setx 0x083107514e8d3795, %g1, %r31
	save
	setx 0x17d914a1235cc0e1, %g1, %r16
	setx 0xbc25d5ba55bdb35e, %g1, %r17
	setx 0xf3597c217155ee6b, %g1, %r18
	setx 0xee00e01ade037e75, %g1, %r19
	setx 0x642ae9d9a16e3711, %g1, %r20
	setx 0xbf5cf53c6fdae450, %g1, %r21
	setx 0x3d4cdaf62e8271b1, %g1, %r22
	setx 0x3ff5534593d4dd3a, %g1, %r23
	setx 0xff595ae7507aa6ae, %g1, %r24
	setx 0xb602677b4f662c64, %g1, %r25
	setx 0x2795605ac3a47157, %g1, %r26
	setx 0xf6abd74ff9645ce8, %g1, %r27
	setx 0xdc322d1a8e3177a9, %g1, %r28
	setx 0x5b90254c5f82f4c4, %g1, %r29
	setx 0x8316307c83d6340e, %g1, %r30
	setx 0xc11da7edba740e79, %g1, %r31
	save
	setx 0xaf0b4d9fc22f8800, %g1, %r16
	setx 0x178a96f87a6704ac, %g1, %r17
	setx 0x19f0c64b1b8f8db5, %g1, %r18
	setx 0x2e81eefb2715afe9, %g1, %r19
	setx 0xd33669d75230349b, %g1, %r20
	setx 0x80bdbf81dc94029d, %g1, %r21
	setx 0x9232d70649e1a298, %g1, %r22
	setx 0x101527b8563274f3, %g1, %r23
	setx 0x33e7e6ef0ef3df0c, %g1, %r24
	setx 0x623482452edbf90f, %g1, %r25
	setx 0xf1df9bd51213da28, %g1, %r26
	setx 0x09c07a696b6f47e7, %g1, %r27
	setx 0xadd72af13fc06f0c, %g1, %r28
	setx 0x9dae58254cffb7a6, %g1, %r29
	setx 0x389bbff8f3158675, %g1, %r30
	setx 0x562630a4c2bff50c, %g1, %r31
	save
	setx 0x3abd5bc93032831f, %g1, %r16
	setx 0x4f7e7205738eb1f5, %g1, %r17
	setx 0x5ef7e6d5dcfb3a0d, %g1, %r18
	setx 0xe89e501d2f48fa79, %g1, %r19
	setx 0x3c7067aa69d14fa1, %g1, %r20
	setx 0x7f9731392129cb3d, %g1, %r21
	setx 0x0810ca3738f64f26, %g1, %r22
	setx 0x856ee4674370d8bd, %g1, %r23
	setx 0xf7ccb50d9f1a9316, %g1, %r24
	setx 0xe2fd52a10c0e059b, %g1, %r25
	setx 0x8e1395cdef492918, %g1, %r26
	setx 0x19cb1a6bbb4ff2f4, %g1, %r27
	setx 0xb5acbd20b7f1e80d, %g1, %r28
	setx 0x44cbc30b2280cede, %g1, %r29
	setx 0xdb6e1f278095159a, %g1, %r30
	setx 0x41cfe5304e41cba7, %g1, %r31
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
	.word 0xbde4a14e  ! 3: SAVE_I	save	%r18, 0x0001, %r30
hwintr_0_0:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_0), 16, 16)) -> intp(0, 0, 2f)
	setx	data_start_2, %g1, %r21
	.word 0xb9e460a3  ! 11: SAVE_I	save	%r17, 0x0001, %r28
	.word 0xb3e4a011  ! 12: SAVE_I	save	%r18, 0x0001, %r25
	.word 0xb1500000  ! 13: RDPR_TPC	<illegal instruction>
	.word 0xb9e4a0e0  ! 14: SAVE_I	save	%r18, 0x0001, %r28
	.word 0xb5e4a04b  ! 15: SAVE_I	save	%r18, 0x0001, %r26
	.word 0xb0944000  ! 20: ORcc_R	orcc 	%r17, %r0, %r24
	.word 0xb5e4e094  ! 22: SAVE_I	save	%r19, 0x0001, %r26
	.word 0x819521a0  ! 28: WRPR_TPC_I	wrpr	%r20, 0x01a0, %tpc
	.word 0xb7504000  ! 31: RDPR_TNPC	<illegal instruction>
	.word 0xb095212f  ! 32: ORcc_I	orcc 	%r20, 0x012f, %r24
	.word 0xb1e4e15b  ! 33: SAVE_I	save	%r19, 0x0001, %r24
hwintr_0_1:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_1), 16, 16)) -> intp(0, 0, 1b)
	.word 0xb7e42027  ! 36: SAVE_I	save	%r16, 0x0001, %r27
	.word 0xb950c000  ! 42: RDPR_TT	<illegal instruction>
	.word 0xb5e5e05b  ! 43: SAVE_I	save	%r23, 0x0001, %r26
	.word 0xb32db001  ! 45: SLLX_I	sllx	%r22, 0x0001, %r25
	.word 0xb1e561d9  ! 46: SAVE_I	save	%r21, 0x0001, %r24
	.word 0x8195a03b  ! 55: WRPR_TPC_I	wrpr	%r22, 0x003b, %tpc
hwintr_0_2:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_2), 16, 16)) -> intp(0, 0, 2b)
	.word 0xb1e4e076  ! 61: SAVE_I	save	%r19, 0x0001, %r24
	.word 0xbfe5e1bb  ! 62: SAVE_I	save	%r23, 0x0001, %r31
	.word 0xba35c000  ! 64: ORN_R	orn 	%r23, %r0, %r29
hwintr_0_3:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_3), 16, 16)) -> intp(0, 0, 14)
	.word 0xb3e460b3  ! 72: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xb5e5e1c0  ! 73: SAVE_I	save	%r23, 0x0001, %r26
	.word 0xbde5e02c  ! 76: SAVE_I	save	%r23, 0x0001, %r30
	.word 0xbde460d4  ! 77: SAVE_I	save	%r17, 0x0001, %r30
	mov	2, %r12
	.word 0xa1930000  ! 83: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb5500000  ! 84: RDPR_TPC	<illegal instruction>
hwintr_0_4:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_4), 16, 16)) -> intp(0, 0, 1e)
hwintr_0_5:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_5), 16, 16)) -> intp(0, 0, 12)
	.word 0xb1e4e178  ! 90: SAVE_I	save	%r19, 0x0001, %r24
	.word 0xb5e5e1a8  ! 94: SAVE_I	save	%r23, 0x0001, %r26
	.word 0xb7e4e0f7  ! 95: SAVE_I	save	%r19, 0x0001, %r27
hwintr_0_6:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_6), 16, 16)) -> intp(0, 0, 31)
hwintr_0_7:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_7), 16, 16)) -> intp(0, 0, 3a)
	setx	0x941f649800006f08, %g1, %r10
	.word 0x819a8000  ! 106: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
hwintr_0_8:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_8), 16, 16)) -> intp(0, 0, 27)
	.word 0xb9e46045  ! 112: SAVE_I	save	%r17, 0x0001, %r28
	.word 0xbde5a0a6  ! 114: SAVE_I	save	%r22, 0x0001, %r30
	setx	0x77ae2e410000afc5, %g1, %r10
	.word 0x839a8000  ! 115: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	mov	1, %r12
	.word 0xa1930000  ! 117: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xba8ca075  ! 118: ANDcc_I	andcc 	%r18, 0x0075, %r29
	.word 0xbbe4a1b2  ! 121: SAVE_I	save	%r18, 0x0001, %r29
	.word 0xb3500000  ! 124: RDPR_TPC	<illegal instruction>
	.word 0xb9510000  ! 125: RDPR_TICK	<illegal instruction>
	.word 0xbfe521a3  ! 128: SAVE_I	save	%r20, 0x0001, %r31
	.word 0xbfe46009  ! 129: SAVE_I	save	%r17, 0x0001, %r31
	.word 0xb03c21a9  ! 130: XNOR_I	xnor 	%r16, 0x01a9, %r24
	.word 0xb7e460b7  ! 133: SAVE_I	save	%r17, 0x0001, %r27
	.word 0xbde521c4  ! 134: SAVE_I	save	%r20, 0x0001, %r30
hwintr_0_9:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_9), 16, 16)) -> intp(0, 0, 0)
hwintr_0_10:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_10), 16, 16)) -> intp(0, 0, 3)
	.word 0xb3e560c4  ! 139: SAVE_I	save	%r21, 0x0001, %r25
	.word 0xbbe56045  ! 145: SAVE_I	save	%r21, 0x0001, %r29
	mov	0, %r12
	.word 0xa1930000  ! 146: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb7e421bd  ! 148: SAVE_I	save	%r16, 0x0001, %r27
	.word 0x879520f0  ! 149: WRPR_TT_I	wrpr	%r20, 0x00f0, %tt
	.word 0xb3e5a05d  ! 151: SAVE_I	save	%r22, 0x0001, %r25
	mov	0, %r12
	.word 0x8f930000  ! 153: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xbbe5a0f9  ! 154: SAVE_I	save	%r22, 0x0001, %r29
	.word 0xb5e460ab  ! 155: SAVE_I	save	%r17, 0x0001, %r26
	.word 0xb3508000  ! 156: RDPR_TSTATE	<illegal instruction>
	.word 0xb73c3001  ! 157: SRAX_I	srax	%r16, 0x0001, %r27
	.word 0xb151c000  ! 158: RDPR_TL	<illegal instruction>
hwintr_0_11:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_11), 16, 16)) -> intp(0, 0, 5)
	.word 0xbd50c000  ! 166: RDPR_TT	<illegal instruction>
	.word 0xbbe5e17f  ! 167: SAVE_I	save	%r23, 0x0001, %r29
	.word 0xbb510000  ! 168: RDPR_TICK	<illegal instruction>
	.word 0xbbe561c5  ! 172: SAVE_I	save	%r21, 0x0001, %r29
	.word 0xb9e5a12a  ! 177: SAVE_I	save	%r22, 0x0001, %r28
	.word 0xbbe4a138  ! 182: SAVE_I	save	%r18, 0x0001, %r29
	.word 0xbde5a1d0  ! 183: SAVE_I	save	%r22, 0x0001, %r30
	.word 0xbbe4a102  ! 184: SAVE_I	save	%r18, 0x0001, %r29
	setx	data_start_0, %g1, %r18
	.word 0xb6142174  ! 187: OR_I	or 	%r16, 0x0174, %r27
	.word 0xbde4a0c9  ! 188: SAVE_I	save	%r18, 0x0001, %r30
hwintr_0_12:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_12), 16, 16)) -> intp(0, 0, 27)
	.word 0xbbe5605c  ! 194: SAVE_I	save	%r21, 0x0001, %r29
	.word 0xbfe5e0cd  ! 195: SAVE_I	save	%r23, 0x0001, %r31
	.word 0xb2b50000  ! 196: SUBCcc_R	orncc 	%r20, %r0, %r25
	.word 0x9194e185  ! 201: WRPR_PIL_I	wrpr	%r19, 0x0185, %pil
	.word 0xbde4e19d  ! 202: SAVE_I	save	%r19, 0x0001, %r30
	.word 0xbfe42141  ! 203: SAVE_I	save	%r16, 0x0001, %r31
	.word 0xb5e4e017  ! 204: SAVE_I	save	%r19, 0x0001, %r26
	.word 0xb7e5e1fb  ! 206: SAVE_I	save	%r23, 0x0001, %r27
	.word 0xbde5a074  ! 207: SAVE_I	save	%r22, 0x0001, %r30
	.word 0x8994604d  ! 208: WRPR_TICK_I	wrpr	%r17, 0x004d, %tick
	.word 0xbbe561be  ! 209: SAVE_I	save	%r21, 0x0001, %r29
hwintr_0_13:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_13), 16, 16)) -> intp(0, 0, 2d)
	.word 0xbbe420c2  ! 212: SAVE_I	save	%r16, 0x0001, %r29
	.word 0x85952149  ! 219: WRPR_TSTATE_I	wrpr	%r20, 0x0149, %tstate
	.word 0xb3e52198  ! 223: SAVE_I	save	%r20, 0x0001, %r25
	.word 0xb9e560ef  ! 228: SAVE_I	save	%r21, 0x0001, %r28
	.word 0xbbe4e1bf  ! 229: SAVE_I	save	%r19, 0x0001, %r29
hwintr_0_14:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_14), 16, 16)) -> intp(0, 0, 27)
	.word 0xbb518000  ! 232: RDPR_PSTATE	<illegal instruction>
	.word 0xbde5213d  ! 235: SAVE_I	save	%r20, 0x0001, %r30
	.word 0xb1e4a0d4  ! 238: SAVE_I	save	%r18, 0x0001, %r24
	.word 0xb3e42131  ! 242: SAVE_I	save	%r16, 0x0001, %r25
	.word 0xbfe5e0ff  ! 244: SAVE_I	save	%r23, 0x0001, %r31
	.word 0xbfe420e9  ! 245: SAVE_I	save	%r16, 0x0001, %r31
	.word 0xba35c000  ! 247: SUBC_R	orn 	%r23, %r0, %r29
	setx	data_start_6, %g1, %r19
	.word 0xb1e5218f  ! 257: SAVE_I	save	%r20, 0x0001, %r24
	.word 0x8d9421da  ! 258: WRPR_PSTATE_I	wrpr	%r16, 0x01da, %pstate
	.word 0x81956061  ! 259: WRPR_TPC_I	wrpr	%r21, 0x0061, %tpc
	.word 0xb7e5e131  ! 263: SAVE_I	save	%r23, 0x0001, %r27
	.word 0xb7e4a054  ! 268: SAVE_I	save	%r18, 0x0001, %r27
	.word 0xb614a0e6  ! 269: OR_I	or 	%r18, 0x00e6, %r27
	.word 0xbbe460ee  ! 270: SAVE_I	save	%r17, 0x0001, %r29
hwintr_0_15:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_15), 16, 16)) -> intp(0, 0, 12)
	.word 0xb7352001  ! 274: SRL_I	srl 	%r20, 0x0001, %r27
	.word 0xbde4a135  ! 278: SAVE_I	save	%r18, 0x0001, %r30
hwintr_0_16:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_16), 16, 16)) -> intp(0, 0, 3b)
	.word 0xbfe5a16c  ! 280: SAVE_I	save	%r22, 0x0001, %r31
	.word 0xba8ca0a7  ! 281: ANDcc_I	andcc 	%r18, 0x00a7, %r29
	.word 0xb2952166  ! 282: ORcc_I	orcc 	%r20, 0x0166, %r25
	.word 0xbfe42053  ! 283: SAVE_I	save	%r16, 0x0001, %r31
	.word 0xb1e4a0f9  ! 284: SAVE_I	save	%r18, 0x0001, %r24
	.word 0xb7e5202e  ! 286: SAVE_I	save	%r20, 0x0001, %r27
hwintr_0_17:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_17), 16, 16)) -> intp(0, 0, 1d)
	.word 0xb3e5a04a  ! 288: SAVE_I	save	%r22, 0x0001, %r25
	.word 0xb3e4a170  ! 291: SAVE_I	save	%r18, 0x0001, %r25
	.word 0x8395e1e9  ! 292: WRPR_TNPC_I	wrpr	%r23, 0x01e9, %tnpc
	.word 0xbb520000  ! 298: RDPR_PIL	<illegal instruction>
	.word 0xbbe520bb  ! 299: SAVE_I	save	%r20, 0x0001, %r29
	.word 0x9194a16b  ! 300: WRPR_PIL_I	wrpr	%r18, 0x016b, %pil
	.word 0xb7e46009  ! 302: SAVE_I	save	%r17, 0x0001, %r27
	.word 0xb1e4a009  ! 304: SAVE_I	save	%r18, 0x0001, %r24
	.word 0xb21ca1ac  ! 307: XOR_I	xor 	%r18, 0x01ac, %r25
	.word 0xb044a159  ! 308: ADDC_I	addc 	%r18, 0x0159, %r24
	.word 0x8395200f  ! 310: WRPR_TNPC_I	wrpr	%r20, 0x000f, %tnpc
	.word 0xbde4a109  ! 313: SAVE_I	save	%r18, 0x0001, %r30
hwintr_0_18:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_18), 16, 16)) -> intp(0, 0, 2f)
	.word 0xb57c4400  ! 315: MOVR_R	movre	%r17, %r0, %r26
	.word 0xb3e5a01d  ! 317: SAVE_I	save	%r22, 0x0001, %r25
	.word 0xb1e5a04b  ! 318: SAVE_I	save	%r22, 0x0001, %r24
	mov	0, %r12
	.word 0xa1930000  ! 319: WRPR_GL_R	wrpr	%r12, %r0, %-
hwintr_0_19:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_19), 16, 16)) -> intp(0, 0, 2a)
	.word 0xb7e5e19e  ! 322: SAVE_I	save	%r23, 0x0001, %r27
	.word 0xbfe4e179  ! 323: SAVE_I	save	%r19, 0x0001, %r31
hwintr_0_20:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_20), 16, 16)) -> intp(0, 0, 3)
	.word 0xbfe5e0ea  ! 329: SAVE_I	save	%r23, 0x0001, %r31
	.word 0xbfe5a02f  ! 332: SAVE_I	save	%r22, 0x0001, %r31
hwintr_0_21:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_21), 16, 16)) -> intp(0, 0, 26)
	.word 0xbc35211e  ! 344: ORN_I	orn 	%r20, 0x011e, %r30
	.word 0xb551c000  ! 345: RDPR_TL	<illegal instruction>
	.word 0xb7520000  ! 346: RDPR_PIL	<illegal instruction>
	.word 0x8594200f  ! 348: WRPR_TSTATE_I	wrpr	%r16, 0x000f, %tstate
	.word 0xbde5606a  ! 350: SAVE_I	save	%r21, 0x0001, %r30
	.word 0xbfe5a1ba  ! 353: SAVE_I	save	%r22, 0x0001, %r31
	.word 0xb9e5a0ed  ! 354: SAVE_I	save	%r22, 0x0001, %r28
	.word 0xbde4214a  ! 359: SAVE_I	save	%r16, 0x0001, %r30
	.word 0xb750c000  ! 361: RDPR_TT	<illegal instruction>
	.word 0xb3e4a1d1  ! 363: SAVE_I	save	%r18, 0x0001, %r25
hwintr_0_22:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_22), 16, 16)) -> intp(0, 0, 13)
	.word 0xb9e5a189  ! 368: SAVE_I	save	%r22, 0x0001, %r28
	.word 0xb1e42058  ! 369: SAVE_I	save	%r16, 0x0001, %r24
	mov	0, %r12
	.word 0xa1930000  ! 370: WRPR_GL_R	wrpr	%r12, %r0, %-
hwintr_0_23:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_23), 16, 16)) -> intp(0, 0, 32)
	.word 0x89946157  ! 372: WRPR_TICK_I	wrpr	%r17, 0x0157, %tick
	.word 0xbfe5e108  ! 373: SAVE_I	save	%r23, 0x0001, %r31
	mov	0, %r12
	.word 0xa1930000  ! 375: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb3e460c0  ! 386: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xb5e4e1f0  ! 390: SAVE_I	save	%r19, 0x0001, %r26
	.word 0xb1e5a09f  ! 394: SAVE_I	save	%r22, 0x0001, %r24
hwintr_0_24:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_24), 16, 16)) -> intp(0, 0, 5)
	.word 0xbe2cc000  ! 397: ANDN_R	andn 	%r19, %r0, %r31
	.word 0x919460f7  ! 399: WRPR_PIL_I	wrpr	%r17, 0x00f7, %pil
	.word 0xb7e4a0f9  ! 403: SAVE_I	save	%r18, 0x0001, %r27
	.word 0xb7504000  ! 405: RDPR_TNPC	<illegal instruction>
	.word 0xb1e5605b  ! 409: SAVE_I	save	%r21, 0x0001, %r24
	.word 0x919561c2  ! 412: WRPR_PIL_I	wrpr	%r21, 0x01c2, %pil
	.word 0xb9510000  ! 413: RDPR_TICK	<illegal instruction>
	.word 0xbde5e0bb  ! 414: SAVE_I	save	%r23, 0x0001, %r30
	.word 0xbe34a143  ! 415: ORN_I	orn 	%r18, 0x0143, %r31
hwintr_0_25:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_25), 16, 16)) -> intp(0, 0, 22)
	.word 0xb1e5e0e2  ! 422: SAVE_I	save	%r23, 0x0001, %r24
	.word 0x8995e0b9  ! 423: WRPR_TICK_I	wrpr	%r23, 0x00b9, %tick
	.word 0xb3e420f2  ! 428: SAVE_I	save	%r16, 0x0001, %r25
	.word 0xbde46067  ! 429: SAVE_I	save	%r17, 0x0001, %r30
hwintr_0_26:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_26), 16, 16)) -> intp(0, 0, 11)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
hwintr_0_27:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_27), 16, 16)) -> intp(0, 0, 19)
	.word 0xb9e52060  ! 443: SAVE_I	save	%r20, 0x0001, %r28
	.word 0xb351c000  ! 444: RDPR_TL	<illegal instruction>
	.word 0xb3e5e199  ! 447: SAVE_I	save	%r23, 0x0001, %r25
	mov	2, %r12
	.word 0xa1930000  ! 451: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb7e4a01f  ! 453: SAVE_I	save	%r18, 0x0001, %r27
hwintr_0_28:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_28), 16, 16)) -> intp(0, 0, 13)
	setx	data_start_1, %g1, %r20
	.word 0x8595e088  ! 459: WRPR_TSTATE_I	wrpr	%r23, 0x0088, %tstate
	.word 0xbbe52122  ! 460: SAVE_I	save	%r20, 0x0001, %r29
	.word 0xb7e461db  ! 462: SAVE_I	save	%r17, 0x0001, %r27
	.word 0xb9e4a073  ! 466: SAVE_I	save	%r18, 0x0001, %r28
	.word 0xb5500000  ! 467: RDPR_TPC	<illegal instruction>
	.word 0xbde42004  ! 469: SAVE_I	save	%r16, 0x0001, %r30
	mov	2, %r12
	.word 0xa1930000  ! 470: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb9e4a0ed  ! 471: SAVE_I	save	%r18, 0x0001, %r28
	.word 0xbfe4e1d7  ! 475: SAVE_I	save	%r19, 0x0001, %r31
	.word 0xb3e4e1fb  ! 476: SAVE_I	save	%r19, 0x0001, %r25
	.word 0xbfe4e0f9  ! 478: SAVE_I	save	%r19, 0x0001, %r31
	.word 0xb9510000  ! 479: RDPR_TICK	<illegal instruction>
	.word 0xb3480000  ! 480: RDHPR_HPSTATE	rdhpr	%hpstate, %r25
	.word 0xb9540000  ! 485: RDPR_GL	<illegal instruction>
	.word 0xb3e4a077  ! 488: SAVE_I	save	%r18, 0x0001, %r25
	.word 0xbc354000  ! 489: ORN_R	orn 	%r21, %r0, %r30
	.word 0x8d9560d2  ! 491: WRPR_PSTATE_I	wrpr	%r21, 0x00d2, %pstate
	.word 0xb3e5e0c2  ! 492: SAVE_I	save	%r23, 0x0001, %r25
	.word 0xbfe561cf  ! 497: SAVE_I	save	%r21, 0x0001, %r31
	.word 0xbbe42184  ! 505: SAVE_I	save	%r16, 0x0001, %r29
	.word 0xb415a023  ! 507: OR_I	or 	%r22, 0x0023, %r26
	.word 0x8395601d  ! 508: WRPR_TNPC_I	wrpr	%r21, 0x001d, %tnpc
	.word 0xb9e4a0e6  ! 509: SAVE_I	save	%r18, 0x0001, %r28
	.word 0xbbe5607d  ! 510: SAVE_I	save	%r21, 0x0001, %r29
	.word 0xb2b5e005  ! 513: SUBCcc_I	orncc 	%r23, 0x0005, %r25
hwintr_0_29:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_29), 16, 16)) -> intp(0, 0, 10)
	.word 0xb3e420ca  ! 516: SAVE_I	save	%r16, 0x0001, %r25
	.word 0xbfe56127  ! 519: SAVE_I	save	%r21, 0x0001, %r31
	.word 0xb5e4600b  ! 525: SAVE_I	save	%r17, 0x0001, %r26
	.word 0xb5e56029  ! 527: SAVE_I	save	%r21, 0x0001, %r26
hwintr_0_30:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_30), 16, 16)) -> intp(0, 0, 28)
	.word 0xbde5e152  ! 541: SAVE_I	save	%r23, 0x0001, %r30
	.word 0xbfe520cc  ! 543: SAVE_I	save	%r20, 0x0001, %r31
hwintr_0_31:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_31), 16, 16)) -> intp(0, 0, 14)
	.word 0xb5e5a16f  ! 551: SAVE_I	save	%r22, 0x0001, %r26
	.word 0x89956141  ! 552: WRPR_TICK_I	wrpr	%r21, 0x0141, %tick
	.word 0xbec44000  ! 553: ADDCcc_R	addccc 	%r17, %r0, %r31
	.word 0xb3e4610f  ! 555: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xb7e56072  ! 557: SAVE_I	save	%r21, 0x0001, %r27
	.word 0xb23d2146  ! 558: XNOR_I	xnor 	%r20, 0x0146, %r25
	.word 0xb3e52084  ! 559: SAVE_I	save	%r20, 0x0001, %r25
	.word 0xbfe56036  ! 566: SAVE_I	save	%r21, 0x0001, %r31
	.word 0x8795a042  ! 570: WRPR_TT_I	wrpr	%r22, 0x0042, %tt
hwintr_0_32:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_32), 16, 16)) -> intp(0, 0, 3f)
	setx	data_start_5, %g1, %r23
	setx	0xf4ce9d760000b982, %g1, %r10
	.word 0x819a8000  ! 578: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0x879560e6  ! 583: WRPR_TT_I	wrpr	%r21, 0x00e6, %tt
	.word 0xb5e4a1cd  ! 584: SAVE_I	save	%r18, 0x0001, %r26
	.word 0xb5e4e099  ! 585: SAVE_I	save	%r19, 0x0001, %r26
	.word 0xbfe5e0ad  ! 586: SAVE_I	save	%r23, 0x0001, %r31
	setx	data_start_1, %g1, %r22
	.word 0xb1e5e161  ! 590: SAVE_I	save	%r23, 0x0001, %r24
hwintr_0_33:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_33), 16, 16)) -> intp(0, 0, 11)
	.word 0xb1e4a12c  ! 596: SAVE_I	save	%r18, 0x0001, %r24
	.word 0xbfe560c6  ! 597: SAVE_I	save	%r21, 0x0001, %r31
	.word 0xb9520000  ! 598: RDPR_PIL	<illegal instruction>
hwintr_0_34:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_34), 16, 16)) -> intp(0, 0, 6)
	.word 0xb7e420e4  ! 602: SAVE_I	save	%r16, 0x0001, %r27
	.word 0xb5e5e171  ! 605: SAVE_I	save	%r23, 0x0001, %r26
	.word 0xb1e4617b  ! 609: SAVE_I	save	%r17, 0x0001, %r24
	.word 0xb0946119  ! 610: ORcc_I	orcc 	%r17, 0x0119, %r24
	.word 0xb5e5a000  ! 613: SAVE_I	save	%r22, 0x0001, %r26
	.word 0xb3e5a114  ! 614: SAVE_I	save	%r22, 0x0001, %r25
	.word 0x87946160  ! 616: WRPR_TT_I	wrpr	%r17, 0x0160, %tt
	.word 0x879461e6  ! 622: WRPR_TT_I	wrpr	%r17, 0x01e6, %tt
	.word 0xb5e4611f  ! 624: SAVE_I	save	%r17, 0x0001, %r26
	.word 0xbbe520ca  ! 625: SAVE_I	save	%r20, 0x0001, %r29
	.word 0xb5e5e089  ! 626: SAVE_I	save	%r23, 0x0001, %r26
	.word 0xb9e420d2  ! 636: SAVE_I	save	%r16, 0x0001, %r28
	.word 0xbfe4e1c5  ! 638: SAVE_I	save	%r19, 0x0001, %r31
	.word 0xbb641800  ! 640: MOVcc_R	<illegal instruction>
	.word 0xb5e4e15e  ! 645: SAVE_I	save	%r19, 0x0001, %r26
	.word 0xb5e46141  ! 648: SAVE_I	save	%r17, 0x0001, %r26
	.word 0xb5e5a09d  ! 651: SAVE_I	save	%r22, 0x0001, %r26
	.word 0xb7e4a1e6  ! 652: SAVE_I	save	%r18, 0x0001, %r27
hwintr_0_35:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_35), 16, 16)) -> intp(0, 0, 1)
	.word 0xb1540000  ! 660: RDPR_GL	<illegal instruction>
	.word 0xba246188  ! 663: SUB_I	sub 	%r17, 0x0188, %r29
	.word 0xb1e4e0f4  ! 664: SAVE_I	save	%r19, 0x0001, %r24
	.word 0xb9e4a077  ! 665: SAVE_I	save	%r18, 0x0001, %r28
	.word 0xbfe420dc  ! 667: SAVE_I	save	%r16, 0x0001, %r31
	.word 0xbd518000  ! 668: RDPR_PSTATE	<illegal instruction>
	.word 0xb551c000  ! 670: RDPR_TL	<illegal instruction>
	.word 0x8594a041  ! 671: WRPR_TSTATE_I	wrpr	%r18, 0x0041, %tstate
	.word 0xb0bdc000  ! 672: XNORcc_R	xnorcc 	%r23, %r0, %r24
	.word 0xb9e5210d  ! 673: SAVE_I	save	%r20, 0x0001, %r28
	.word 0xb3e5e10f  ! 674: SAVE_I	save	%r23, 0x0001, %r25
	.word 0xb2054000  ! 675: ADD_R	add 	%r21, %r0, %r25
	.word 0xbd51c000  ! 676: RDPR_TL	<illegal instruction>
	.word 0xb9480000  ! 677: RDHPR_HPSTATE	rdhpr	%hpstate, %r28
	.word 0x9195e03e  ! 680: WRPR_PIL_I	wrpr	%r23, 0x003e, %pil
	.word 0xbde4a0b0  ! 681: SAVE_I	save	%r18, 0x0001, %r30
hwintr_0_36:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_36), 16, 16)) -> intp(0, 0, 25)
hwintr_0_37:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_37), 16, 16)) -> intp(0, 0, 28)
	setx	0x90ebdb9d0000ba17, %g1, %r10
	.word 0x839a8000  ! 687: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb3e52075  ! 689: SAVE_I	save	%r20, 0x0001, %r25
	.word 0xb1520000  ! 690: RDPR_PIL	<illegal instruction>
	.word 0xbd51c000  ! 693: RDPR_TL	<illegal instruction>
	.word 0xb5520000  ! 696: RDPR_PIL	<illegal instruction>
hwintr_0_38:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_38), 16, 16)) -> intp(0, 0, 2c)
hwintr_0_39:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_39), 16, 16)) -> intp(0, 0, 1d)
	.word 0x859460a3  ! 704: WRPR_TSTATE_I	wrpr	%r17, 0x00a3, %tstate
hwintr_0_40:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_40), 16, 16)) -> intp(0, 0, 2)
hwintr_0_41:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_41), 16, 16)) -> intp(0, 0, 1b)
	.word 0xbb2d3001  ! 710: SLLX_I	sllx	%r20, 0x0001, %r29
	.word 0xb7e561e9  ! 711: SAVE_I	save	%r21, 0x0001, %r27
	.word 0xb7e560c1  ! 712: SAVE_I	save	%r21, 0x0001, %r27
	.word 0xb1e521f3  ! 713: SAVE_I	save	%r20, 0x0001, %r24
	.word 0xbb50c000  ! 714: RDPR_TT	<illegal instruction>
	.word 0xb5e461a0  ! 715: SAVE_I	save	%r17, 0x0001, %r26
	.word 0xbde461c8  ! 716: SAVE_I	save	%r17, 0x0001, %r30
	.word 0xbde4a1ec  ! 718: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xbbe56067  ! 722: SAVE_I	save	%r21, 0x0001, %r29
	.word 0xbde5a183  ! 723: SAVE_I	save	%r22, 0x0001, %r30
	.word 0xbbe46058  ! 724: SAVE_I	save	%r17, 0x0001, %r29
hwintr_0_42:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_42), 16, 16)) -> intp(0, 0, 1a)
	.word 0xbbe4e043  ! 732: SAVE_I	save	%r19, 0x0001, %r29
	.word 0xbde4205e  ! 733: SAVE_I	save	%r16, 0x0001, %r30
	.word 0xb9e5e068  ! 735: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xb7e5e1b5  ! 736: SAVE_I	save	%r23, 0x0001, %r27
	.word 0xb0948000  ! 738: ORcc_R	orcc 	%r18, %r0, %r24
	.word 0xbe1c4000  ! 742: XOR_R	xor 	%r17, %r0, %r31
	.word 0xb1e42131  ! 744: SAVE_I	save	%r16, 0x0001, %r24
	.word 0xbde5a1d7  ! 745: SAVE_I	save	%r22, 0x0001, %r30
	.word 0xb5520000  ! 749: RDPR_PIL	<illegal instruction>
	.word 0xbfe56120  ! 752: SAVE_I	save	%r21, 0x0001, %r31
	mov	2, %r12
	.word 0xa1930000  ! 753: WRPR_GL_R	wrpr	%r12, %r0, %-
	mov	2, %r12
	.word 0xa1930000  ! 755: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xbfe5a03c  ! 757: SAVE_I	save	%r22, 0x0001, %r31
	.word 0xb7e4e130  ! 758: SAVE_I	save	%r19, 0x0001, %r27
	.word 0xb7508000  ! 759: RDPR_TSTATE	<illegal instruction>
	.word 0xb1e56025  ! 761: SAVE_I	save	%r21, 0x0001, %r24
	.word 0xb5e5209c  ! 763: SAVE_I	save	%r20, 0x0001, %r26
	.word 0xb9e56022  ! 764: SAVE_I	save	%r21, 0x0001, %r28
	.word 0xb7e4a0dc  ! 765: SAVE_I	save	%r18, 0x0001, %r27
	.word 0xbfe4e1bd  ! 766: SAVE_I	save	%r19, 0x0001, %r31
hwintr_0_43:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_43), 16, 16)) -> intp(0, 0, 2a)
	.word 0xb5e5a0e4  ! 768: SAVE_I	save	%r22, 0x0001, %r26
hwintr_0_44:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_44), 16, 16)) -> intp(0, 0, 19)
	.word 0xb9e520ee  ! 772: SAVE_I	save	%r20, 0x0001, %r28
	.word 0xb135f001  ! 773: SRLX_I	srlx	%r23, 0x0001, %r24
	.word 0xb5e4e045  ! 776: SAVE_I	save	%r19, 0x0001, %r26
	.word 0xb1e461b1  ! 779: SAVE_I	save	%r17, 0x0001, %r24
	.word 0xb1e52147  ! 781: SAVE_I	save	%r20, 0x0001, %r24
	.word 0x8d94204d  ! 785: WRPR_PSTATE_I	wrpr	%r16, 0x004d, %pstate
	.word 0xbde52111  ! 786: SAVE_I	save	%r20, 0x0001, %r30
	.word 0xb5e4a13d  ! 787: SAVE_I	save	%r18, 0x0001, %r26
	.word 0xbde5e1f8  ! 789: SAVE_I	save	%r23, 0x0001, %r30
hwintr_0_45:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_45), 16, 16)) -> intp(0, 0, 5)
	.word 0xb1e5e093  ! 795: SAVE_I	save	%r23, 0x0001, %r24
	.word 0xbde421bd  ! 797: SAVE_I	save	%r16, 0x0001, %r30
	.word 0xbd510000  ! 798: RDPR_TICK	<illegal instruction>
	.word 0xbfe5a05a  ! 799: SAVE_I	save	%r22, 0x0001, %r31
	.word 0xb9e4e0c4  ! 800: SAVE_I	save	%r19, 0x0001, %r28
	.word 0xb9520000  ! 803: RDPR_PIL	<illegal instruction>
	.word 0xb7e56180  ! 804: SAVE_I	save	%r21, 0x0001, %r27
	.word 0xbf518000  ! 805: RDPR_PSTATE	<illegal instruction>
	.word 0xbde4e1b7  ! 806: SAVE_I	save	%r19, 0x0001, %r30
hwintr_0_46:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_46), 16, 16)) -> intp(0, 0, 25)
	setx	0xb6a82e4900005b02, %g1, %r10
	.word 0x819a8000  ! 809: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xb7e4a0b1  ! 811: SAVE_I	save	%r18, 0x0001, %r27
	.word 0xb82ce018  ! 820: ANDN_I	andn 	%r19, 0x0018, %r28
	.word 0xbc34a062  ! 823: ORN_I	orn 	%r18, 0x0062, %r30
	.word 0xbe0c2066  ! 829: AND_I	and 	%r16, 0x0066, %r31
	.word 0xbfe4602b  ! 830: SAVE_I	save	%r17, 0x0001, %r31
	.word 0xbe344000  ! 832: ORN_R	orn 	%r17, %r0, %r31
	.word 0xbfe4205c  ! 834: SAVE_I	save	%r16, 0x0001, %r31
	.word 0xb7e420e1  ! 839: SAVE_I	save	%r16, 0x0001, %r27
	.word 0xb551c000  ! 840: RDPR_TL	<illegal instruction>
	.word 0xbbe42029  ! 846: SAVE_I	save	%r16, 0x0001, %r29
	.word 0xbe94e168  ! 850: ORcc_I	orcc 	%r19, 0x0168, %r31
	.word 0xb3e4a0c1  ! 852: SAVE_I	save	%r18, 0x0001, %r25
	.word 0xbde4a172  ! 853: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xbde4e07f  ! 856: SAVE_I	save	%r19, 0x0001, %r30
	.word 0xba1c4000  ! 857: XOR_R	xor 	%r17, %r0, %r29
	.word 0xbfe4e1de  ! 861: SAVE_I	save	%r19, 0x0001, %r31
	.word 0xb9e421e1  ! 862: SAVE_I	save	%r16, 0x0001, %r28
	.word 0x8194e075  ! 869: WRPR_TPC_I	wrpr	%r19, 0x0075, %tpc
	.word 0xb1e4a01e  ! 873: SAVE_I	save	%r18, 0x0001, %r24
	.word 0xbf504000  ! 874: RDPR_TNPC	<illegal instruction>
	.word 0xbfe56156  ! 875: SAVE_I	save	%r21, 0x0001, %r31
	.word 0xbfe4a12c  ! 876: SAVE_I	save	%r18, 0x0001, %r31
	.word 0xb751c000  ! 878: RDPR_TL	<illegal instruction>
	.word 0xb7510000  ! 880: RDPR_TICK	<illegal instruction>
	mov	1, %r12
	.word 0x8f930000  ! 883: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xb1e520c0  ! 887: SAVE_I	save	%r20, 0x0001, %r24
	.word 0xbbe46139  ! 888: SAVE_I	save	%r17, 0x0001, %r29
	.word 0xb5540000  ! 897: RDPR_GL	<illegal instruction>
	.word 0xb3e4e18e  ! 903: SAVE_I	save	%r19, 0x0001, %r25
	.word 0xbde4e19d  ! 904: SAVE_I	save	%r19, 0x0001, %r30
hwintr_0_47:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_47), 16, 16)) -> intp(0, 0, 1b)
	.word 0xbbe4e0ba  ! 906: SAVE_I	save	%r19, 0x0001, %r29
	.word 0xbbe520e5  ! 907: SAVE_I	save	%r20, 0x0001, %r29
	.word 0x8195607b  ! 908: WRPR_TPC_I	wrpr	%r21, 0x007b, %tpc
	.word 0xb7e560ec  ! 910: SAVE_I	save	%r21, 0x0001, %r27
	.word 0xbbe5e0a1  ! 913: SAVE_I	save	%r23, 0x0001, %r29
	.word 0xb7e4a081  ! 914: SAVE_I	save	%r18, 0x0001, %r27
	.word 0xb1e421a9  ! 915: SAVE_I	save	%r16, 0x0001, %r24
	.word 0x8194a1e6  ! 917: WRPR_TPC_I	wrpr	%r18, 0x01e6, %tpc
	setx	0x89996fd40000ca06, %g1, %r10
	.word 0x819a8000  ! 920: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xb1e4e0df  ! 921: SAVE_I	save	%r19, 0x0001, %r24
	.word 0xb5e5e1cc  ! 922: SAVE_I	save	%r23, 0x0001, %r26
hwintr_0_48:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_48), 16, 16)) -> intp(0, 0, 3e)
	setx	data_start_2, %g1, %r19
	.word 0xb1e461a3  ! 933: SAVE_I	save	%r17, 0x0001, %r24
	.word 0xb035c000  ! 936: ORN_R	orn 	%r23, %r0, %r24
	.word 0xb1510000  ! 939: RDPR_TICK	<illegal instruction>
	.word 0xbfe4213f  ! 940: SAVE_I	save	%r16, 0x0001, %r31
	.word 0xbfe520f1  ! 943: SAVE_I	save	%r20, 0x0001, %r31
hwintr_0_49:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_49), 16, 16)) -> intp(0, 0, 20)
	.word 0xb9e56061  ! 948: SAVE_I	save	%r21, 0x0001, %r28
	.word 0xbb504000  ! 950: RDPR_TNPC	<illegal instruction>
hwintr_0_50:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_50), 16, 16)) -> intp(0, 0, 26)
	.word 0xb5e461cc  ! 956: SAVE_I	save	%r17, 0x0001, %r26
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
hwintr_0_51:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_51), 16, 16)) -> intp(0, 0, 37)
	.word 0xbfe5e07b  ! 966: SAVE_I	save	%r23, 0x0001, %r31
	.word 0xb3e46193  ! 968: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xbbe5611a  ! 969: SAVE_I	save	%r21, 0x0001, %r29
	.word 0xb1e520e7  ! 970: SAVE_I	save	%r20, 0x0001, %r24
	.word 0xb1e4e0a9  ! 974: SAVE_I	save	%r19, 0x0001, %r24
	.word 0xbde520f2  ! 976: SAVE_I	save	%r20, 0x0001, %r30
	setx	data_start_4, %g1, %r18
	.word 0x8794e1ee  ! 983: WRPR_TT_I	wrpr	%r19, 0x01ee, %tt
	.word 0xb3e5a174  ! 985: SAVE_I	save	%r22, 0x0001, %r25
	.word 0xb3e4a1a1  ! 986: SAVE_I	save	%r18, 0x0001, %r25
	.word 0xb3e4a0ca  ! 991: SAVE_I	save	%r18, 0x0001, %r25
	.word 0xb9e5e026  ! 992: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xb1e5a19e  ! 993: SAVE_I	save	%r22, 0x0001, %r24
	setx	0xb904747a000058cd, %g1, %r10
	.word 0x839a8000  ! 996: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
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
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_0), 16, 16)) -> intp(3, 0, 5)
	setx	data_start_2, %g1, %r23
	.word 0xb5500000  ! 13: RDPR_TPC	rdpr	%tpc, %r26
	.word 0xf23d21cd  ! 16: STD_I	std	%r25, [%r20 + 0x01cd]
	.word 0xf835e1f6  ! 17: STH_I	sth	%r28, [%r23 + 0x01f6]
	.word 0xfa354000  ! 18: STH_R	sth	%r29, [%r21 + %r0]
	.word 0xb8948000  ! 20: ORcc_R	orcc 	%r18, %r0, %r28
	.word 0xf63ce035  ! 21: STD_I	std	%r27, [%r19 + 0x0035]
	.word 0xf03c4000  ! 25: STD_R	std	%r24, [%r17 + %r0]
	.word 0x8194e17e  ! 28: WRPR_TPC_I	wrpr	%r19, 0x017e, %tpc
	.word 0xf43d2146  ! 29: STD_I	std	%r26, [%r20 + 0x0146]
	.word 0xb3504000  ! 31: RDPR_TNPC	rdpr	%tnpc, %r25
	.word 0xb4956158  ! 32: ORcc_I	orcc 	%r21, 0x0158, %r26
hwintr_3_1:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_1), 16, 16)) -> intp(3, 0, 28)
	.word 0xf03d4000  ! 35: STD_R	std	%r24, [%r21 + %r0]
	.word 0xfa3d4000  ! 41: STD_R	std	%r29, [%r21 + %r0]
	.word 0xbf50c000  ! 42: RDPR_TT	<illegal instruction>
	.word 0xbd2cf001  ! 45: SLLX_I	sllx	%r19, 0x0001, %r30
	.word 0xf53c60b2  ! 51: STDF_I	std	%f26, [0x00b2, %r17]
	.word 0xfa3c8000  ! 54: STD_R	std	%r29, [%r18 + %r0]
	.word 0x8194a0c9  ! 55: WRPR_TPC_I	wrpr	%r18, 0x00c9, %tpc
	.word 0xf62cc000  ! 56: STB_R	stb	%r27, [%r19 + %r0]
hwintr_3_2:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_2), 16, 16)) -> intp(3, 0, 11)
	.word 0xbe35c000  ! 64: ORN_R	orn 	%r23, %r0, %r31
hwintr_3_3:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_3), 16, 16)) -> intp(3, 0, 2d)
	.word 0xf4340000  ! 68: STH_R	sth	%r26, [%r16 + %r0]
	.word 0xfc344000  ! 81: STH_R	sth	%r30, [%r17 + %r0]
	mov	0, %r12
	.word 0xa1930000  ! 83: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xbd500000  ! 84: RDPR_TPC	rdpr	%tpc, %r30
	.word 0xfe2c8000  ! 85: STB_R	stb	%r31, [%r18 + %r0]
hwintr_3_4:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_4), 16, 16)) -> intp(3, 0, 10)
	.word 0xf83c4000  ! 87: STD_R	std	%r28, [%r17 + %r0]
hwintr_3_5:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_5), 16, 16)) -> intp(3, 0, 34)
	.word 0xf0352152  ! 89: STH_I	sth	%r24, [%r20 + 0x0152]
	.word 0xf83420fb  ! 91: STH_I	sth	%r28, [%r16 + 0x00fb]
	.word 0xfe3c4000  ! 97: STD_R	std	%r31, [%r17 + %r0]
	.word 0xfd3d8000  ! 98: STDF_R	std	%f30, [%r0, %r22]
hwintr_3_6:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_6), 16, 16)) -> intp(3, 0, 14)
hwintr_3_7:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_7), 16, 16)) -> intp(3, 0, 21)
	setx	0xa8c46e8b00003817, %g1, %r10
	.word 0x819a8000  ! 106: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
hwintr_3_8:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_8), 16, 16)) -> intp(3, 0, 2b)
	.word 0xff3c2080  ! 110: STDF_I	std	%f31, [0x0080, %r16]
	setx	0x8790ef500000ccda, %g1, %r10
	.word 0x839a8000  ! 115: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	mov	1, %r12
	.word 0xa1930000  ! 117: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb28ca1b6  ! 118: ANDcc_I	andcc 	%r18, 0x01b6, %r25
	.word 0xbb500000  ! 124: RDPR_TPC	rdpr	%tpc, %r29
	.word 0xbb510000  ! 125: RDPR_TICK	<illegal instruction>
	.word 0xb03de139  ! 130: XNOR_I	xnor 	%r23, 0x0139, %r24
	.word 0xfc35c000  ! 132: STH_R	sth	%r30, [%r23 + %r0]
	.word 0xfe354000  ! 135: STH_R	sth	%r31, [%r21 + %r0]
hwintr_3_9:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_9), 16, 16)) -> intp(3, 0, 3e)
hwintr_3_10:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_10), 16, 16)) -> intp(3, 0, 3b)
	.word 0xf43ce114  ! 144: STD_I	std	%r26, [%r19 + 0x0114]
	mov	1, %r12
	.word 0xa1930000  ! 146: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xf73c0000  ! 147: STDF_R	std	%f27, [%r0, %r16]
	.word 0x87956055  ! 149: WRPR_TT_I	wrpr	%r21, 0x0055, %tt
	.word 0xff3de157  ! 152: STDF_I	std	%f31, [0x0157, %r23]
	mov	2, %r12
	.word 0x8f930000  ! 153: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xbd508000  ! 156: RDPR_TSTATE	rdpr	%tstate, %r30
	.word 0xbf3df001  ! 157: SRAX_I	srax	%r23, 0x0001, %r31
	.word 0xbf51c000  ! 158: RDPR_TL	<illegal instruction>
	.word 0xfa2d8000  ! 159: STB_R	stb	%r29, [%r22 + %r0]
	.word 0xfc344000  ! 160: STH_R	sth	%r30, [%r17 + %r0]
hwintr_3_11:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_11), 16, 16)) -> intp(3, 0, 26)
	.word 0xf03d8000  ! 164: STD_R	std	%r24, [%r22 + %r0]
	.word 0xb750c000  ! 166: RDPR_TT	<illegal instruction>
	.word 0xb1510000  ! 168: RDPR_TICK	<illegal instruction>
	.word 0xf0344000  ! 169: STH_R	sth	%r24, [%r17 + %r0]
	.word 0xf2744000  ! 170: STX_R	stx	%r25, [%r17 + %r0]
	.word 0xff3c4000  ! 174: STDF_R	std	%f31, [%r0, %r17]
	.word 0xfe24c000  ! 178: STW_R	stw	%r31, [%r19 + %r0]
	.word 0xfa3c206e  ! 179: STD_I	std	%r29, [%r16 + 0x006e]
	setx	data_start_0, %g1, %r17
	.word 0xb414e031  ! 187: OR_I	or 	%r19, 0x0031, %r26
hwintr_3_12:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_12), 16, 16)) -> intp(3, 0, 2)
	.word 0xf6344000  ! 190: STH_R	sth	%r27, [%r17 + %r0]
	.word 0xbcb50000  ! 196: SUBCcc_R	orncc 	%r20, %r0, %r30
	.word 0xf8742092  ! 197: STX_I	stx	%r28, [%r16 + 0x0092]
	.word 0xf82ca1be  ! 199: STB_I	stb	%r28, [%r18 + 0x01be]
	.word 0xf435e14a  ! 200: STH_I	sth	%r26, [%r23 + 0x014a]
	.word 0x9194e0f1  ! 201: WRPR_PIL_I	wrpr	%r19, 0x00f1, %pil
	.word 0x89946100  ! 208: WRPR_TICK_I	wrpr	%r17, 0x0100, %tick
hwintr_3_13:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_13), 16, 16)) -> intp(3, 0, 2)
	.word 0xf33c4000  ! 214: STDF_R	std	%f25, [%r0, %r17]
	.word 0xf23461a1  ! 217: STH_I	sth	%r25, [%r17 + 0x01a1]
	.word 0x8595e10d  ! 219: WRPR_TSTATE_I	wrpr	%r23, 0x010d, %tstate
	.word 0xf62521bf  ! 220: STW_I	stw	%r27, [%r20 + 0x01bf]
	.word 0xf62c20ac  ! 224: STB_I	stb	%r27, [%r16 + 0x00ac]
	.word 0xf234e1f4  ! 230: STH_I	sth	%r25, [%r19 + 0x01f4]
hwintr_3_14:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_14), 16, 16)) -> intp(3, 0, 2b)
	.word 0xbf518000  ! 232: RDPR_PSTATE	rdpr	%pstate, %r31
	.word 0xf53c618b  ! 236: STDF_I	std	%f26, [0x018b, %r17]
	.word 0xbe358000  ! 247: SUBC_R	orn 	%r22, %r0, %r31
	setx	data_start_0, %g1, %r22
	.word 0xfe2d2089  ! 251: STB_I	stb	%r31, [%r20 + 0x0089]
	.word 0xf6348000  ! 253: STH_R	sth	%r27, [%r18 + %r0]
	.word 0xf82da1a4  ! 255: STB_I	stb	%r28, [%r22 + 0x01a4]
	.word 0x8d94a022  ! 258: WRPR_PSTATE_I	wrpr	%r18, 0x0022, %pstate
	.word 0x8194e120  ! 259: WRPR_TPC_I	wrpr	%r19, 0x0120, %tpc
	.word 0xf53d4000  ! 262: STDF_R	std	%f26, [%r0, %r21]
	.word 0xf024a0a8  ! 265: STW_I	stw	%r24, [%r18 + 0x00a8]
	.word 0xb2156169  ! 269: OR_I	or 	%r21, 0x0169, %r25
hwintr_3_15:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_15), 16, 16)) -> intp(3, 0, 11)
	.word 0xb5352001  ! 274: SRL_I	srl 	%r20, 0x0001, %r26
	.word 0xf73c8000  ! 276: STDF_R	std	%f27, [%r0, %r18]
hwintr_3_16:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_16), 16, 16)) -> intp(3, 0, 9)
	.word 0xb68d612b  ! 281: ANDcc_I	andcc 	%r21, 0x012b, %r27
	.word 0xbc94a18f  ! 282: ORcc_I	orcc 	%r18, 0x018f, %r30
hwintr_3_17:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_17), 16, 16)) -> intp(3, 0, 13)
	.word 0x839420d6  ! 292: WRPR_TNPC_I	wrpr	%r16, 0x00d6, %tnpc
	.word 0xf62d8000  ! 296: STB_R	stb	%r27, [%r22 + %r0]
	.word 0xf675e06a  ! 297: STX_I	stx	%r27, [%r23 + 0x006a]
	.word 0xbf520000  ! 298: RDPR_PIL	rdpr	%pil, %r31
	.word 0x9195203c  ! 300: WRPR_PIL_I	wrpr	%r20, 0x003c, %pil
	.word 0xf23d2069  ! 303: STD_I	std	%r25, [%r20 + 0x0069]
	.word 0xf42d8000  ! 305: STB_R	stb	%r26, [%r22 + %r0]
	.word 0xb41d609d  ! 307: XOR_I	xor 	%r21, 0x009d, %r26
	.word 0xbc442164  ! 308: ADDC_I	addc 	%r16, 0x0164, %r30
	.word 0xfc2d4000  ! 309: STB_R	stb	%r30, [%r21 + %r0]
	.word 0x8394a1b8  ! 310: WRPR_TNPC_I	wrpr	%r18, 0x01b8, %tnpc
hwintr_3_18:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_18), 16, 16)) -> intp(3, 0, 3e)
	.word 0xb17d0400  ! 315: MOVR_R	movre	%r20, %r0, %r24
	.word 0xf63d8000  ! 316: STD_R	std	%r27, [%r22 + %r0]
	mov	0, %r12
	.word 0xa1930000  ! 319: WRPR_GL_R	wrpr	%r12, %r0, %-
hwintr_3_19:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_19), 16, 16)) -> intp(3, 0, 25)
hwintr_3_20:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_20), 16, 16)) -> intp(3, 0, 2b)
	.word 0xf13d0000  ! 327: STDF_R	std	%f24, [%r0, %r20]
	.word 0xf93c0000  ! 328: STDF_R	std	%f28, [%r0, %r16]
	.word 0xf53c2046  ! 333: STDF_I	std	%f26, [0x0046, %r16]
hwintr_3_21:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_21), 16, 16)) -> intp(3, 0, 3a)
	.word 0xf024212b  ! 338: STW_I	stw	%r24, [%r16 + 0x012b]
	.word 0xf93d4000  ! 343: STDF_R	std	%f28, [%r0, %r21]
	.word 0xb23520ed  ! 344: ORN_I	orn 	%r20, 0x00ed, %r25
	.word 0xb151c000  ! 345: RDPR_TL	rdpr	%tl, %r24
	.word 0xb1520000  ! 346: RDPR_PIL	<illegal instruction>
	.word 0xf82da1e7  ! 347: STB_I	stb	%r28, [%r22 + 0x01e7]
	.word 0x8594e173  ! 348: WRPR_TSTATE_I	wrpr	%r19, 0x0173, %tstate
	.word 0xf07460af  ! 349: STX_I	stx	%r24, [%r17 + 0x00af]
	.word 0xfe258000  ! 351: STW_R	stw	%r31, [%r22 + %r0]
	.word 0xf73cc000  ! 352: STDF_R	std	%f27, [%r0, %r19]
	.word 0xf83d8000  ! 357: STD_R	std	%r28, [%r22 + %r0]
	.word 0xf6754000  ! 358: STX_R	stx	%r27, [%r21 + %r0]
	.word 0xbb50c000  ! 361: RDPR_TT	rdpr	%tt, %r29
	.word 0xf274e16f  ! 362: STX_I	stx	%r25, [%r19 + 0x016f]
hwintr_3_22:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_22), 16, 16)) -> intp(3, 0, 18)
	.word 0xf63da0a0  ! 366: STD_I	std	%r27, [%r22 + 0x00a0]
	.word 0xf43c8000  ! 367: STD_R	std	%r26, [%r18 + %r0]
	mov	1, %r12
	.word 0xa1930000  ! 370: WRPR_GL_R	wrpr	%r12, %r0, %-
hwintr_3_23:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_23), 16, 16)) -> intp(3, 0, 2f)
	.word 0x8995a17f  ! 372: WRPR_TICK_I	wrpr	%r22, 0x017f, %tick
	mov	1, %r12
	.word 0xa1930000  ! 375: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xf82d6070  ! 383: STB_I	stb	%r28, [%r21 + 0x0070]
	.word 0xfe35a007  ! 384: STH_I	sth	%r31, [%r22 + 0x0007]
	.word 0xf6746171  ! 387: STX_I	stx	%r27, [%r17 + 0x0171]
	.word 0xf73c0000  ! 388: STDF_R	std	%f27, [%r0, %r16]
	.word 0xf73c8000  ! 391: STDF_R	std	%f27, [%r0, %r18]
hwintr_3_24:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_24), 16, 16)) -> intp(3, 0, 15)
	.word 0xfe2c60b1  ! 396: STB_I	stb	%r31, [%r17 + 0x00b1]
	.word 0xb02d0000  ! 397: ANDN_R	andn 	%r20, %r0, %r24
	.word 0xf635a06b  ! 398: STH_I	sth	%r27, [%r22 + 0x006b]
	.word 0x91946115  ! 399: WRPR_PIL_I	wrpr	%r17, 0x0115, %pil
	.word 0xf4254000  ! 404: STW_R	stw	%r26, [%r21 + %r0]
	.word 0xb1504000  ! 405: RDPR_TNPC	rdpr	%tnpc, %r24
	.word 0xfc2c0000  ! 406: STB_R	stb	%r30, [%r16 + %r0]
	.word 0xf82c20c8  ! 407: STB_I	stb	%r28, [%r16 + 0x00c8]
	.word 0x919460fe  ! 412: WRPR_PIL_I	wrpr	%r17, 0x00fe, %pil
	.word 0xbd510000  ! 413: RDPR_TICK	rdpr	%tick, %r30
	.word 0xb434617d  ! 415: ORN_I	orn 	%r17, 0x017d, %r26
hwintr_3_25:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_25), 16, 16)) -> intp(3, 0, f)
	.word 0x8995e16e  ! 423: WRPR_TICK_I	wrpr	%r23, 0x016e, %tick
	.word 0xf434a0f0  ! 425: STH_I	sth	%r26, [%r18 + 0x00f0]
	.word 0xfb3ce125  ! 426: STDF_I	std	%f29, [0x0125, %r19]
	.word 0xf73c61e3  ! 427: STDF_I	std	%f27, [0x01e3, %r17]
hwintr_3_26:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_26), 16, 16)) -> intp(3, 0, 3e)
	.word 0xfe35e1d1  ! 436: STH_I	sth	%r31, [%r23 + 0x01d1]
	.word 0xfe25a1a2  ! 437: STW_I	stw	%r31, [%r22 + 0x01a2]
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
hwintr_3_27:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_27), 16, 16)) -> intp(3, 0, 6)
	.word 0xff3d4000  ! 441: STDF_R	std	%f31, [%r0, %r21]
	.word 0xb351c000  ! 444: RDPR_TL	rdpr	%tl, %r25
	.word 0xf235a1fe  ! 445: STH_I	sth	%r25, [%r22 + 0x01fe]
	.word 0xfb3d4000  ! 448: STDF_R	std	%f29, [%r0, %r21]
	.word 0xfe2c20b4  ! 450: STB_I	stb	%r31, [%r16 + 0x00b4]
	mov	0, %r12
	.word 0xa1930000  ! 451: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xfa3ce029  ! 452: STD_I	std	%r29, [%r19 + 0x0029]
	.word 0xf62c200f  ! 454: STB_I	stb	%r27, [%r16 + 0x000f]
	.word 0xfe2dc000  ! 455: STB_R	stb	%r31, [%r23 + %r0]
hwintr_3_28:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_28), 16, 16)) -> intp(3, 0, 3b)
	setx	data_start_7, %g1, %r18
	.word 0x8594e1b4  ! 459: WRPR_TSTATE_I	wrpr	%r19, 0x01b4, %tstate
	.word 0xb1500000  ! 467: RDPR_TPC	rdpr	%tpc, %r24
	mov	1, %r12
	.word 0xa1930000  ! 470: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xfd3c2187  ! 472: STDF_I	std	%f30, [0x0187, %r16]
	.word 0xff3c8000  ! 477: STDF_R	std	%f31, [%r0, %r18]
	.word 0xb3510000  ! 479: RDPR_TICK	rdpr	%tick, %r25
	.word 0xbd480000  ! 480: RDHPR_HPSTATE	rdhpr	%hpstate, %r30
	.word 0xfc34e16b  ! 482: STH_I	sth	%r30, [%r19 + 0x016b]
	.word 0xbf540000  ! 485: RDPR_GL	<illegal instruction>
	.word 0xf224a0ba  ! 486: STW_I	stw	%r25, [%r18 + 0x00ba]
	.word 0xbc340000  ! 489: ORN_R	orn 	%r16, %r0, %r30
	.word 0x8d9521ab  ! 491: WRPR_PSTATE_I	wrpr	%r20, 0x01ab, %pstate
	.word 0xff3c617f  ! 494: STDF_I	std	%f31, [0x017f, %r17]
	.word 0xb014a001  ! 507: OR_I	or 	%r18, 0x0001, %r24
	.word 0x8395e1c8  ! 508: WRPR_TNPC_I	wrpr	%r23, 0x01c8, %tnpc
	.word 0xb8b46101  ! 513: SUBCcc_I	orncc 	%r17, 0x0101, %r28
hwintr_3_29:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_29), 16, 16)) -> intp(3, 0, 7)
hwintr_3_30:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_30), 16, 16)) -> intp(3, 0, 3)
	.word 0xf22ca163  ! 538: STB_I	stb	%r25, [%r18 + 0x0163]
	.word 0xfc350000  ! 539: STH_R	sth	%r30, [%r20 + %r0]
	.word 0xf42ce0af  ! 545: STB_I	stb	%r26, [%r19 + 0x00af]
hwintr_3_31:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_31), 16, 16)) -> intp(3, 0, 2f)
	.word 0xf4750000  ! 550: STX_R	stx	%r26, [%r20 + %r0]
	.word 0x899421f9  ! 552: WRPR_TICK_I	wrpr	%r16, 0x01f9, %tick
	.word 0xbec4c000  ! 553: ADDCcc_R	addccc 	%r19, %r0, %r31
	.word 0xf025c000  ! 556: STW_R	stw	%r24, [%r23 + %r0]
	.word 0xb23c20f1  ! 558: XNOR_I	xnor 	%r16, 0x00f1, %r25
	.word 0xf63c0000  ! 560: STD_R	std	%r27, [%r16 + %r0]
	.word 0xf4758000  ! 562: STX_R	stx	%r26, [%r22 + %r0]
	.word 0xf02c0000  ! 568: STB_R	stb	%r24, [%r16 + %r0]
	.word 0x8794a07b  ! 570: WRPR_TT_I	wrpr	%r18, 0x007b, %tt
hwintr_3_32:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_32), 16, 16)) -> intp(3, 0, 2)
	.word 0xf674e109  ! 575: STX_I	stx	%r27, [%r19 + 0x0109]
	.word 0xf93d6176  ! 576: STDF_I	std	%f28, [0x0176, %r21]
	setx	data_start_2, %g1, %r23
	setx	0xe8ca0f3800006d13, %g1, %r10
	.word 0x819a8000  ! 578: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0x8795e0f7  ! 583: WRPR_TT_I	wrpr	%r23, 0x00f7, %tt
	.word 0xf43d4000  ! 587: STD_R	std	%r26, [%r21 + %r0]
	.word 0xf33c8000  ! 588: STDF_R	std	%f25, [%r0, %r18]
	setx	data_start_2, %g1, %r21
hwintr_3_33:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_33), 16, 16)) -> intp(3, 0, b)
	.word 0xf63c4000  ! 593: STD_R	std	%r27, [%r17 + %r0]
	.word 0xbf520000  ! 598: RDPR_PIL	rdpr	%pil, %r31
	.word 0xfc758000  ! 599: STX_R	stx	%r30, [%r22 + %r0]
hwintr_3_34:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_34), 16, 16)) -> intp(3, 0, 29)
	.word 0xb095e0a0  ! 610: ORcc_I	orcc 	%r23, 0x00a0, %r24
	.word 0x87946106  ! 616: WRPR_TT_I	wrpr	%r17, 0x0106, %tt
	.word 0xfe2d2100  ! 618: STB_I	stb	%r31, [%r20 + 0x0100]
	.word 0x87952073  ! 622: WRPR_TT_I	wrpr	%r20, 0x0073, %tt
	.word 0xf22dc000  ! 627: STB_R	stb	%r25, [%r23 + %r0]
	.word 0xf024e161  ! 628: STW_I	stw	%r24, [%r19 + 0x0161]
	.word 0xfa24e02b  ! 630: STW_I	stw	%r29, [%r19 + 0x002b]
	.word 0xb5641800  ! 640: MOVcc_R	<illegal instruction>
	.word 0xf43ca0e5  ! 646: STD_I	std	%r26, [%r18 + 0x00e5]
	.word 0xf4358000  ! 649: STH_R	sth	%r26, [%r22 + %r0]
hwintr_3_35:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_35), 16, 16)) -> intp(3, 0, 8)
	.word 0xfe3d0000  ! 656: STD_R	std	%r31, [%r20 + %r0]
	.word 0xfa244000  ! 657: STW_R	stw	%r29, [%r17 + %r0]
	.word 0xf6254000  ! 659: STW_R	stw	%r27, [%r21 + %r0]
	.word 0xb3540000  ! 660: RDPR_GL	rdpr	%-, %r25
	.word 0xbe24a113  ! 663: SUB_I	sub 	%r18, 0x0113, %r31
	.word 0xb1518000  ! 668: RDPR_PSTATE	<illegal instruction>
	.word 0xbd51c000  ! 670: RDPR_TL	<illegal instruction>
	.word 0x859461b9  ! 671: WRPR_TSTATE_I	wrpr	%r17, 0x01b9, %tstate
	.word 0xb4bdc000  ! 672: XNORcc_R	xnorcc 	%r23, %r0, %r26
	.word 0xb4058000  ! 675: ADD_R	add 	%r22, %r0, %r26
	.word 0xb151c000  ! 676: RDPR_TL	rdpr	%tl, %r24
	.word 0xbd480000  ! 677: RDHPR_HPSTATE	rdhpr	%hpstate, %r30
	.word 0xf62c601a  ! 679: STB_I	stb	%r27, [%r17 + 0x001a]
	.word 0x9194e185  ! 680: WRPR_PIL_I	wrpr	%r19, 0x0185, %pil
hwintr_3_36:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_36), 16, 16)) -> intp(3, 0, 1a)
	.word 0xf93c4000  ! 684: STDF_R	std	%f28, [%r0, %r17]
hwintr_3_37:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_37), 16, 16)) -> intp(3, 0, d)
	setx	0x75ac9d460000dc50, %g1, %r10
	.word 0x839a8000  ! 687: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb3520000  ! 690: RDPR_PIL	rdpr	%pil, %r25
	.word 0xb951c000  ! 693: RDPR_TL	<illegal instruction>
	.word 0xb1520000  ! 696: RDPR_PIL	<illegal instruction>
	.word 0xfa2c0000  ! 697: STB_R	stb	%r29, [%r16 + %r0]
hwintr_3_38:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_38), 16, 16)) -> intp(3, 0, 9)
hwintr_3_39:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_39), 16, 16)) -> intp(3, 0, 13)
	.word 0x8594a04a  ! 704: WRPR_TSTATE_I	wrpr	%r18, 0x004a, %tstate
hwintr_3_40:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_40), 16, 16)) -> intp(3, 0, 37)
hwintr_3_41:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_41), 16, 16)) -> intp(3, 0, 3d)
	.word 0xb52df001  ! 710: SLLX_I	sllx	%r23, 0x0001, %r26
	.word 0xb350c000  ! 714: RDPR_TT	rdpr	%tt, %r25
	.word 0xfc340000  ! 717: STH_R	sth	%r30, [%r16 + %r0]
	.word 0xf63d8000  ! 720: STD_R	std	%r27, [%r22 + %r0]
	.word 0xfc3d20f6  ! 721: STD_I	std	%r30, [%r20 + 0x00f6]
	.word 0xf63c4000  ! 726: STD_R	std	%r27, [%r17 + %r0]
hwintr_3_42:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_42), 16, 16)) -> intp(3, 0, 1c)
	.word 0xbc94c000  ! 738: ORcc_R	orcc 	%r19, %r0, %r30
	.word 0xbc1dc000  ! 742: XOR_R	xor 	%r23, %r0, %r30
	.word 0xfc3d8000  ! 746: STD_R	std	%r30, [%r22 + %r0]
	.word 0xf875c000  ! 748: STX_R	stx	%r28, [%r23 + %r0]
	.word 0xb3520000  ! 749: RDPR_PIL	rdpr	%pil, %r25
	.word 0xfd3d6106  ! 750: STDF_I	std	%f30, [0x0106, %r21]
	mov	2, %r12
	.word 0xa1930000  ! 753: WRPR_GL_R	wrpr	%r12, %r0, %-
	mov	0, %r12
	.word 0xa1930000  ! 755: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xf23c0000  ! 756: STD_R	std	%r25, [%r16 + %r0]
	.word 0xbd508000  ! 759: RDPR_TSTATE	rdpr	%tstate, %r30
	.word 0xfa242136  ! 762: STW_I	stw	%r29, [%r16 + 0x0136]
hwintr_3_43:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_43), 16, 16)) -> intp(3, 0, 2b)
hwintr_3_44:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_44), 16, 16)) -> intp(3, 0, 4)
	.word 0xbb357001  ! 773: SRLX_I	srlx	%r21, 0x0001, %r29
	.word 0xfa252130  ! 780: STW_I	stw	%r29, [%r20 + 0x0130]
	.word 0xf4250000  ! 783: STW_R	stw	%r26, [%r20 + %r0]
	.word 0xf02c6090  ! 784: STB_I	stb	%r24, [%r17 + 0x0090]
	.word 0x8d942106  ! 785: WRPR_PSTATE_I	wrpr	%r16, 0x0106, %pstate
	.word 0xfa742075  ! 793: STX_I	stx	%r29, [%r16 + 0x0075]
hwintr_3_45:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_45), 16, 16)) -> intp(3, 0, 17)
	.word 0xf62d0000  ! 796: STB_R	stb	%r27, [%r20 + %r0]
	.word 0xbf510000  ! 798: RDPR_TICK	rdpr	%tick, %r31
	.word 0xb1520000  ! 803: RDPR_PIL	<illegal instruction>
	.word 0xb9518000  ! 805: RDPR_PSTATE	<illegal instruction>
hwintr_3_46:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_46), 16, 16)) -> intp(3, 0, 31)
	setx	0x3f69a6bc0000de57, %g1, %r10
	.word 0x819a8000  ! 809: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xf675610e  ! 810: STX_I	stx	%r27, [%r21 + 0x010e]
	.word 0xf0750000  ! 814: STX_R	stx	%r24, [%r20 + %r0]
	.word 0xf82520a1  ! 817: STW_I	stw	%r28, [%r20 + 0x00a1]
	.word 0xb82ca167  ! 820: ANDN_I	andn 	%r18, 0x0167, %r28
	.word 0xfc74c000  ! 822: STX_R	stx	%r30, [%r19 + %r0]
	.word 0xb634e17c  ! 823: ORN_I	orn 	%r19, 0x017c, %r27
	.word 0xf03cc000  ! 824: STD_R	std	%r24, [%r19 + %r0]
	.word 0xf835a1a6  ! 825: STH_I	sth	%r28, [%r22 + 0x01a6]
	.word 0xfa25c000  ! 826: STW_R	stw	%r29, [%r23 + %r0]
	.word 0xb20de112  ! 829: AND_I	and 	%r23, 0x0112, %r25
	.word 0xb2344000  ! 832: ORN_R	orn 	%r17, %r0, %r25
	.word 0xf0358000  ! 835: STH_R	sth	%r24, [%r22 + %r0]
	.word 0xf42ce0df  ! 837: STB_I	stb	%r26, [%r19 + 0x00df]
	.word 0xbd51c000  ! 840: RDPR_TL	rdpr	%tl, %r30
	.word 0xf83c8000  ! 847: STD_R	std	%r28, [%r18 + %r0]
	.word 0xb2946027  ! 850: ORcc_I	orcc 	%r17, 0x0027, %r25
	.word 0xf13ca01f  ! 851: STDF_I	std	%f24, [0x001f, %r18]
	.word 0xf675e088  ! 855: STX_I	stx	%r27, [%r23 + 0x0088]
	.word 0xb41c0000  ! 857: XOR_R	xor 	%r16, %r0, %r26
	.word 0xf93c8000  ! 866: STDF_R	std	%f28, [%r0, %r18]
	.word 0xf42c213d  ! 867: STB_I	stb	%r26, [%r16 + 0x013d]
	.word 0x819460bf  ! 869: WRPR_TPC_I	wrpr	%r17, 0x00bf, %tpc
	.word 0xfc3cc000  ! 870: STD_R	std	%r30, [%r19 + %r0]
	.word 0xf4756108  ! 871: STX_I	stx	%r26, [%r21 + 0x0108]
	.word 0xb5504000  ! 874: RDPR_TNPC	rdpr	%tnpc, %r26
	.word 0xb951c000  ! 878: RDPR_TL	<illegal instruction>
	.word 0xf43d0000  ! 879: STD_R	std	%r26, [%r20 + %r0]
	.word 0xb5510000  ! 880: RDPR_TICK	<illegal instruction>
	.word 0xf27521ac  ! 881: STX_I	stx	%r25, [%r20 + 0x01ac]
	mov	2, %r12
	.word 0x8f930000  ! 883: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xf8258000  ! 886: STW_R	stw	%r28, [%r22 + %r0]
	.word 0xfe3c2012  ! 891: STD_I	std	%r31, [%r16 + 0x0012]
	.word 0xf2750000  ! 892: STX_R	stx	%r25, [%r20 + %r0]
	.word 0xf62da15a  ! 895: STB_I	stb	%r27, [%r22 + 0x015a]
	.word 0xfc758000  ! 896: STX_R	stx	%r30, [%r22 + %r0]
	.word 0xbd540000  ! 897: RDPR_GL	rdpr	%-, %r30
	.word 0xfc746050  ! 899: STX_I	stx	%r30, [%r17 + 0x0050]
hwintr_3_47:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_47), 16, 16)) -> intp(3, 0, 30)
	.word 0x819561b6  ! 908: WRPR_TPC_I	wrpr	%r21, 0x01b6, %tpc
	.word 0xf73c4000  ! 911: STDF_R	std	%f27, [%r0, %r17]
	.word 0xf42de068  ! 916: STB_I	stb	%r26, [%r23 + 0x0068]
	.word 0x8194212a  ! 917: WRPR_TPC_I	wrpr	%r16, 0x012a, %tpc
	setx	0x852701fc00001a0a, %g1, %r10
	.word 0x819a8000  ! 920: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xfa2cc000  ! 923: STB_R	stb	%r29, [%r19 + %r0]
	.word 0xfe34a0b3  ! 924: STH_I	sth	%r31, [%r18 + 0x00b3]
hwintr_3_48:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_48), 16, 16)) -> intp(3, 0, 7)
	.word 0xfa3c8000  ! 927: STD_R	std	%r29, [%r18 + %r0]
	setx	data_start_6, %g1, %r21
	.word 0xf2748000  ! 935: STX_R	stx	%r25, [%r18 + %r0]
	.word 0xba358000  ! 936: ORN_R	orn 	%r22, %r0, %r29
	.word 0xb5510000  ! 939: RDPR_TICK	rdpr	%tick, %r26
	.word 0xf4758000  ! 941: STX_R	stx	%r26, [%r22 + %r0]
	.word 0xf8256118  ! 942: STW_I	stw	%r28, [%r21 + 0x0118]
	.word 0xfa75e08c  ! 944: STX_I	stx	%r29, [%r23 + 0x008c]
hwintr_3_49:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_49), 16, 16)) -> intp(3, 0, 18)
	.word 0xfa2d0000  ! 949: STB_R	stb	%r29, [%r20 + %r0]
	.word 0xb1504000  ! 950: RDPR_TNPC	<illegal instruction>
	.word 0xf07461e6  ! 951: STX_I	stx	%r24, [%r17 + 0x01e6]
hwintr_3_50:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_50), 16, 16)) -> intp(3, 0, 23)
	.word 0xfe75c000  ! 955: STX_R	stx	%r31, [%r23 + %r0]
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
hwintr_3_51:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_51), 16, 16)) -> intp(3, 0, 23)
	.word 0xf42c205a  ! 960: STB_I	stb	%r26, [%r16 + 0x005a]
	.word 0xf83dc000  ! 962: STD_R	std	%r28, [%r23 + %r0]
	.word 0xf4250000  ! 973: STW_R	stw	%r26, [%r20 + %r0]
	.word 0xf23c4000  ! 977: STD_R	std	%r25, [%r17 + %r0]
	setx	data_start_4, %g1, %r17
	.word 0xf62da1be  ! 979: STB_I	stb	%r27, [%r22 + 0x01be]
	.word 0x8794e17d  ! 983: WRPR_TT_I	wrpr	%r19, 0x017d, %tt
	.word 0xf62ca0e1  ! 995: STB_I	stb	%r27, [%r18 + 0x00e1]
	setx	0xd78f128c00009f57, %g1, %r10
	.word 0x839a8000  ! 996: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xf2746063  ! 997: STX_I	stx	%r25, [%r17 + 0x0063]
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
hwintr_2_0:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_0), 16, 16)) -> intp(2, 0, 17)
	setx	data_start_3, %g1, %r21
	.word 0xf20d0000  ! 7: LDUB_R	ldub	[%r20 + %r0], %r25
	.word 0xf71d61ba  ! 9: LDDF_I	ldd	[%r21, 0x01ba], %f27
	.word 0xbb500000  ! 13: RDPR_TPC	<illegal instruction>
	.word 0xb6958000  ! 20: ORcc_R	orcc 	%r22, %r0, %r27
	.word 0xfa44a186  ! 24: LDSW_I	ldsw	[%r18 + 0x0186], %r29
	.word 0xf11ce101  ! 26: LDDF_I	ldd	[%r19, 0x0101], %f24
	.word 0xfe5d2169  ! 27: LDX_I	ldx	[%r20 + 0x0169], %r31
	.word 0x81942175  ! 28: WRPR_TPC_I	wrpr	%r16, 0x0175, %tpc
	.word 0xf31c0000  ! 30: LDDF_R	ldd	[%r16, %r0], %f25
	.word 0xb3504000  ! 31: RDPR_TNPC	<illegal instruction>
	.word 0xb09421af  ! 32: ORcc_I	orcc 	%r16, 0x01af, %r24
hwintr_2_1:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_1), 16, 16)) -> intp(2, 0, 21)
	.word 0xf80c20ff  ! 37: LDUB_I	ldub	[%r16 + 0x00ff], %r28
	.word 0xf404e050  ! 38: LDUW_I	lduw	[%r19 + 0x0050], %r26
	.word 0xb150c000  ! 42: RDPR_TT	<illegal instruction>
	.word 0xb12cf001  ! 45: SLLX_I	sllx	%r19, 0x0001, %r24
	.word 0xf51ce157  ! 49: LDDF_I	ldd	[%r19, 0x0157], %f26
	.word 0xf004c000  ! 52: LDUW_R	lduw	[%r19 + %r0], %r24
	.word 0x819420e9  ! 55: WRPR_TPC_I	wrpr	%r16, 0x00e9, %tpc
	.word 0xf05ca0b1  ! 58: LDX_I	ldx	[%r18 + 0x00b1], %r24
	.word 0xfc4d4000  ! 59: LDSB_R	ldsb	[%r21 + %r0], %r30
hwintr_2_2:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_2), 16, 16)) -> intp(2, 0, 21)
	.word 0xb0340000  ! 64: ORN_R	orn 	%r16, %r0, %r24
	.word 0xf60c4000  ! 65: LDUB_R	ldub	[%r17 + %r0], %r27
hwintr_2_3:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_3), 16, 16)) -> intp(2, 0, 13)
	.word 0xfa05e161  ! 69: LDUW_I	lduw	[%r23 + 0x0161], %r29
	.word 0xf455a09a  ! 71: LDSH_I	ldsh	[%r22 + 0x009a], %r26
	.word 0xfc5c6180  ! 78: LDX_I	ldx	[%r17 + 0x0180], %r30
	.word 0xfa0c6000  ! 79: LDUB_I	ldub	[%r17 + 0x0000], %r29
	.word 0xf0144000  ! 80: LDUH_R	lduh	[%r17 + %r0], %r24
	.word 0xfa45214d  ! 82: LDSW_I	ldsw	[%r20 + 0x014d], %r29
	mov	2, %r12
	.word 0xa1930000  ! 83: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb3500000  ! 84: RDPR_TPC	<illegal instruction>
hwintr_2_4:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_4), 16, 16)) -> intp(2, 0, 27)
hwintr_2_5:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_5), 16, 16)) -> intp(2, 0, 1a)
	.word 0xf21520b0  ! 92: LDUH_I	lduh	[%r20 + 0x00b0], %r25
	.word 0xfc15c000  ! 93: LDUH_R	lduh	[%r23 + %r0], %r30
	.word 0xff1de03c  ! 99: LDDF_I	ldd	[%r23, 0x003c], %f31
	.word 0xf51de0aa  ! 101: LDDF_I	ldd	[%r23, 0x00aa], %f26
hwintr_2_6:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_6), 16, 16)) -> intp(2, 0, 2a)
hwintr_2_7:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_7), 16, 16)) -> intp(2, 0, 2d)
	setx	0x13cec2620000fec8, %g1, %r10
	.word 0x819a8000  ! 106: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
hwintr_2_8:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_8), 16, 16)) -> intp(2, 0, 22)
	setx	0x1fde71c10000ff5c, %g1, %r10
	.word 0x839a8000  ! 115: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xf00da10a  ! 116: LDUB_I	ldub	[%r22 + 0x010a], %r24
	mov	2, %r12
	.word 0xa1930000  ! 117: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb08c6029  ! 118: ANDcc_I	andcc 	%r17, 0x0029, %r24
	.word 0xf405601c  ! 122: LDUW_I	lduw	[%r21 + 0x001c], %r26
	.word 0xb9500000  ! 124: RDPR_TPC	<illegal instruction>
	.word 0xbd510000  ! 125: RDPR_TICK	<illegal instruction>
	.word 0xf31da09b  ! 126: LDDF_I	ldd	[%r22, 0x009b], %f25
	.word 0xf61cc000  ! 127: LDD_R	ldd	[%r19 + %r0], %r27
	.word 0xb83da0df  ! 130: XNOR_I	xnor 	%r22, 0x00df, %r28
	.word 0xfc5ce1f6  ! 131: LDX_I	ldx	[%r19 + 0x01f6], %r30
hwintr_2_9:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_9), 16, 16)) -> intp(2, 0, 3)
hwintr_2_10:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_10), 16, 16)) -> intp(2, 0, 2c)
	mov	1, %r12
	.word 0xa1930000  ! 146: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0x87946111  ! 149: WRPR_TT_I	wrpr	%r17, 0x0111, %tt
	.word 0xf4046068  ! 150: LDUW_I	lduw	[%r17 + 0x0068], %r26
	mov	1, %r12
	.word 0x8f930000  ! 153: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xb1508000  ! 156: RDPR_TSTATE	<illegal instruction>
	.word 0xb93df001  ! 157: SRAX_I	srax	%r23, 0x0001, %r28
	.word 0xb151c000  ! 158: RDPR_TL	<illegal instruction>
hwintr_2_11:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_11), 16, 16)) -> intp(2, 0, 1e)
	.word 0xfc5c8000  ! 163: LDX_R	ldx	[%r18 + %r0], %r30
	.word 0xb750c000  ! 166: RDPR_TT	<illegal instruction>
	.word 0xbd510000  ! 168: RDPR_TICK	<illegal instruction>
	.word 0xf8054000  ! 175: LDUW_R	lduw	[%r21 + %r0], %r28
	.word 0xf455c000  ! 176: LDSH_R	ldsh	[%r23 + %r0], %r26
	setx	data_start_0, %g1, %r21
	.word 0xfc4461ac  ! 186: LDSW_I	ldsw	[%r17 + 0x01ac], %r30
	.word 0xbe14a0a3  ! 187: OR_I	or 	%r18, 0x00a3, %r31
hwintr_2_12:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_12), 16, 16)) -> intp(2, 0, 10)
	.word 0xb0b44000  ! 196: SUBCcc_R	orncc 	%r17, %r0, %r24
	.word 0xfc4ce1a7  ! 198: LDSB_I	ldsb	[%r19 + 0x01a7], %r30
	.word 0x919460c4  ! 201: WRPR_PIL_I	wrpr	%r17, 0x00c4, %pil
	.word 0x8994a01b  ! 208: WRPR_TICK_I	wrpr	%r18, 0x001b, %tick
hwintr_2_13:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_13), 16, 16)) -> intp(2, 0, 3e)
	.word 0xfc15e08c  ! 211: LDUH_I	lduh	[%r23 + 0x008c], %r30
	.word 0xf6058000  ! 213: LDUW_R	lduw	[%r22 + %r0], %r27
	.word 0xf40ca18c  ! 216: LDUB_I	ldub	[%r18 + 0x018c], %r26
	.word 0x8595e1a1  ! 219: WRPR_TSTATE_I	wrpr	%r23, 0x01a1, %tstate
	.word 0xf45ca05c  ! 221: LDX_I	ldx	[%r18 + 0x005c], %r26
	.word 0xfc5d61c8  ! 222: LDX_I	ldx	[%r21 + 0x01c8], %r30
hwintr_2_14:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_14), 16, 16)) -> intp(2, 0, 23)
	.word 0xb5518000  ! 232: RDPR_PSTATE	rdpr	%pstate, %r26
	.word 0xfc5d2035  ! 233: LDX_I	ldx	[%r20 + 0x0035], %r30
	.word 0xf65dc000  ! 234: LDX_R	ldx	[%r23 + %r0], %r27
	.word 0xf24d212a  ! 239: LDSB_I	ldsb	[%r20 + 0x012a], %r25
	.word 0xfa5d4000  ! 243: LDX_R	ldx	[%r21 + %r0], %r29
	.word 0xf615e12b  ! 246: LDUH_I	lduh	[%r23 + 0x012b], %r27
	.word 0xb2344000  ! 247: SUBC_R	orn 	%r17, %r0, %r25
	.word 0xfe1d0000  ! 249: LDD_R	ldd	[%r20 + %r0], %r31
	setx	data_start_5, %g1, %r20
	.word 0x8d94a18e  ! 258: WRPR_PSTATE_I	wrpr	%r18, 0x018e, %pstate
	.word 0x8195a027  ! 259: WRPR_TPC_I	wrpr	%r22, 0x0027, %tpc
	.word 0xf71c6063  ! 261: LDDF_I	ldd	[%r17, 0x0063], %f27
	.word 0xf80c20f1  ! 264: LDUB_I	ldub	[%r16 + 0x00f1], %r28
	.word 0xb415a098  ! 269: OR_I	or 	%r22, 0x0098, %r26
	.word 0xf6440000  ! 271: LDSW_R	ldsw	[%r16 + %r0], %r27
	.word 0xf04c2059  ! 272: LDSB_I	ldsb	[%r16 + 0x0059], %r24
hwintr_2_15:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_15), 16, 16)) -> intp(2, 0, f)
	.word 0xbd342001  ! 274: SRL_I	srl 	%r16, 0x0001, %r30
	.word 0xf445e1a5  ! 277: LDSW_I	ldsw	[%r23 + 0x01a5], %r26
hwintr_2_16:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_16), 16, 16)) -> intp(2, 0, 25)
	.word 0xb48d60f8  ! 281: ANDcc_I	andcc 	%r21, 0x00f8, %r26
	.word 0xb8942076  ! 282: ORcc_I	orcc 	%r16, 0x0076, %r28
	.word 0xfe5d60e1  ! 285: LDX_I	ldx	[%r21 + 0x00e1], %r31
hwintr_2_17:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_17), 16, 16)) -> intp(2, 0, 27)
	.word 0xf014a193  ! 289: LDUH_I	lduh	[%r18 + 0x0193], %r24
	.word 0x839460ac  ! 292: WRPR_TNPC_I	wrpr	%r17, 0x00ac, %tnpc
	.word 0xf41c60e3  ! 293: LDD_I	ldd	[%r17 + 0x00e3], %r26
	.word 0xbd520000  ! 298: RDPR_PIL	rdpr	%pil, %r30
	.word 0x9194215a  ! 300: WRPR_PIL_I	wrpr	%r16, 0x015a, %pil
	.word 0xf8558000  ! 306: LDSH_R	ldsh	[%r22 + %r0], %r28
	.word 0xb21c2174  ! 307: XOR_I	xor 	%r16, 0x0174, %r25
	.word 0xbe4520a1  ! 308: ADDC_I	addc 	%r20, 0x00a1, %r31
	.word 0x8394a118  ! 310: WRPR_TNPC_I	wrpr	%r18, 0x0118, %tnpc
	.word 0xfa05e11b  ! 311: LDUW_I	lduw	[%r23 + 0x011b], %r29
hwintr_2_18:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_18), 16, 16)) -> intp(2, 0, 39)
	.word 0xb37c0400  ! 315: MOVR_R	movre	%r16, %r0, %r25
	mov	1, %r12
	.word 0xa1930000  ! 319: WRPR_GL_R	wrpr	%r12, %r0, %-
hwintr_2_19:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_19), 16, 16)) -> intp(2, 0, 2b)
	.word 0xf84d0000  ! 325: LDSB_R	ldsb	[%r20 + %r0], %r28
hwintr_2_20:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_20), 16, 16)) -> intp(2, 0, 39)
	.word 0xf2050000  ! 330: LDUW_R	lduw	[%r20 + %r0], %r25
hwintr_2_21:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_21), 16, 16)) -> intp(2, 0, 7)
	.word 0xf84c4000  ! 336: LDSB_R	ldsb	[%r17 + %r0], %r28
	.word 0xf644c000  ! 337: LDSW_R	ldsw	[%r19 + %r0], %r27
	.word 0xfe1c4000  ! 340: LDD_R	ldd	[%r17 + %r0], %r31
	.word 0xf00ce1b9  ! 342: LDUB_I	ldub	[%r19 + 0x01b9], %r24
	.word 0xb835603d  ! 344: ORN_I	orn 	%r21, 0x003d, %r28
	.word 0xb551c000  ! 345: RDPR_TL	<illegal instruction>
	.word 0xbf520000  ! 346: RDPR_PIL	<illegal instruction>
	.word 0x8594e1a5  ! 348: WRPR_TSTATE_I	wrpr	%r19, 0x01a5, %tstate
	.word 0xf855c000  ! 360: LDSH_R	ldsh	[%r23 + %r0], %r28
	.word 0xbf50c000  ! 361: RDPR_TT	<illegal instruction>
	.word 0xfe4de0d0  ! 364: LDSB_I	ldsb	[%r23 + 0x00d0], %r31
hwintr_2_22:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_22), 16, 16)) -> intp(2, 0, 6)
	mov	1, %r12
	.word 0xa1930000  ! 370: WRPR_GL_R	wrpr	%r12, %r0, %-
hwintr_2_23:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_23), 16, 16)) -> intp(2, 0, 20)
	.word 0x8994618b  ! 372: WRPR_TICK_I	wrpr	%r17, 0x018b, %tick
	.word 0xfa1c8000  ! 374: LDD_R	ldd	[%r18 + %r0], %r29
	mov	1, %r12
	.word 0xa1930000  ! 375: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xf254a145  ! 377: LDSH_I	ldsh	[%r18 + 0x0145], %r25
	.word 0xfe15a008  ! 378: LDUH_I	lduh	[%r22 + 0x0008], %r31
	.word 0xf8154000  ! 379: LDUH_R	lduh	[%r21 + %r0], %r28
	.word 0xf41da1e2  ! 385: LDD_I	ldd	[%r22 + 0x01e2], %r26
	.word 0xf84ce1b3  ! 389: LDSB_I	ldsb	[%r19 + 0x01b3], %r28
	.word 0xf21c8000  ! 392: LDD_R	ldd	[%r18 + %r0], %r25
hwintr_2_24:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_24), 16, 16)) -> intp(2, 0, 32)
	.word 0xb62dc000  ! 397: ANDN_R	andn 	%r23, %r0, %r27
	.word 0x9195e1bc  ! 399: WRPR_PIL_I	wrpr	%r23, 0x01bc, %pil
	.word 0xf255a10d  ! 400: LDSH_I	ldsh	[%r22 + 0x010d], %r25
	.word 0xb9504000  ! 405: RDPR_TNPC	<illegal instruction>
	.word 0x9194a142  ! 412: WRPR_PIL_I	wrpr	%r18, 0x0142, %pil
	.word 0xb9510000  ! 413: RDPR_TICK	<illegal instruction>
	.word 0xba3421dc  ! 415: ORN_I	orn 	%r16, 0x01dc, %r29
	.word 0xf85d0000  ! 417: LDX_R	ldx	[%r20 + %r0], %r28
hwintr_2_25:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_25), 16, 16)) -> intp(2, 0, 3a)
	.word 0x89952069  ! 423: WRPR_TICK_I	wrpr	%r20, 0x0069, %tick
	.word 0xf845a184  ! 424: LDSW_I	ldsw	[%r22 + 0x0184], %r28
hwintr_2_26:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_26), 16, 16)) -> intp(2, 0, 3a)
	.word 0xfc5da184  ! 433: LDX_I	ldx	[%r22 + 0x0184], %r30
	.word 0xfc14216a  ! 434: LDUH_I	lduh	[%r16 + 0x016a], %r30
	.word 0xf41d2141  ! 435: LDD_I	ldd	[%r20 + 0x0141], %r26
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xfb1d617d  ! 439: LDDF_I	ldd	[%r21, 0x017d], %f29
hwintr_2_27:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_27), 16, 16)) -> intp(2, 0, 33)
	.word 0xf6454000  ! 442: LDSW_R	ldsw	[%r21 + %r0], %r27
	.word 0xb351c000  ! 444: RDPR_TL	<illegal instruction>
	.word 0xf71cc000  ! 446: LDDF_R	ldd	[%r19, %r0], %f27
	mov	2, %r12
	.word 0xa1930000  ! 451: WRPR_GL_R	wrpr	%r12, %r0, %-
hwintr_2_28:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_28), 16, 16)) -> intp(2, 0, 35)
	setx	data_start_6, %g1, %r23
	.word 0x8594216c  ! 459: WRPR_TSTATE_I	wrpr	%r16, 0x016c, %tstate
	.word 0xf4048000  ! 461: LDUW_R	lduw	[%r18 + %r0], %r26
	.word 0xf8046152  ! 463: LDUW_I	lduw	[%r17 + 0x0152], %r28
	.word 0xb5500000  ! 467: RDPR_TPC	<illegal instruction>
	.word 0xf0044000  ! 468: LDUW_R	lduw	[%r17 + %r0], %r24
	mov	2, %r12
	.word 0xa1930000  ! 470: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xf245a0a1  ! 474: LDSW_I	ldsw	[%r22 + 0x00a1], %r25
	.word 0xb3510000  ! 479: RDPR_TICK	<illegal instruction>
	.word 0xbb480000  ! 480: RDHPR_HPSTATE	rdhpr	%hpstate, %r29
	.word 0xf45461bb  ! 481: LDSH_I	ldsh	[%r17 + 0x01bb], %r26
	.word 0xf615a01f  ! 484: LDUH_I	lduh	[%r22 + 0x001f], %r27
	.word 0xb9540000  ! 485: RDPR_GL	<illegal instruction>
	.word 0xbc348000  ! 489: ORN_R	orn 	%r18, %r0, %r30
	.word 0x8d94e12b  ! 491: WRPR_PSTATE_I	wrpr	%r19, 0x012b, %pstate
	.word 0xf455c000  ! 496: LDSH_R	ldsh	[%r23 + %r0], %r26
	.word 0xfe158000  ! 499: LDUH_R	lduh	[%r22 + %r0], %r31
	.word 0xf11d20d3  ! 500: LDDF_I	ldd	[%r20, 0x00d3], %f24
	.word 0xf644e110  ! 501: LDSW_I	ldsw	[%r19 + 0x0110], %r27
	.word 0xf6056040  ! 502: LDUW_I	lduw	[%r21 + 0x0040], %r27
	.word 0xf65dc000  ! 503: LDX_R	ldx	[%r23 + %r0], %r27
	.word 0xb815616c  ! 507: OR_I	or 	%r21, 0x016c, %r28
	.word 0x839421af  ! 508: WRPR_TNPC_I	wrpr	%r16, 0x01af, %tnpc
	.word 0xbab56090  ! 513: SUBCcc_I	orncc 	%r21, 0x0090, %r29
hwintr_2_29:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_29), 16, 16)) -> intp(2, 0, 34)
	.word 0xf65c4000  ! 518: LDX_R	ldx	[%r17 + %r0], %r27
	.word 0xfc056165  ! 520: LDUW_I	lduw	[%r21 + 0x0165], %r30
	.word 0xf21c61f1  ! 521: LDD_I	ldd	[%r17 + 0x01f1], %r25
	.word 0xfc15214a  ! 522: LDUH_I	lduh	[%r20 + 0x014a], %r30
	.word 0xf8156144  ! 524: LDUH_I	lduh	[%r21 + 0x0144], %r28
	.word 0xf4450000  ! 526: LDSW_R	ldsw	[%r20 + %r0], %r26
	.word 0xfb1d8000  ! 528: LDDF_R	ldd	[%r22, %r0], %f29
	.word 0xf05c0000  ! 530: LDX_R	ldx	[%r16 + %r0], %r24
hwintr_2_30:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_30), 16, 16)) -> intp(2, 0, 3a)
	.word 0xf25d4000  ! 532: LDX_R	ldx	[%r21 + %r0], %r25
	.word 0xf014e0fa  ! 533: LDUH_I	lduh	[%r19 + 0x00fa], %r24
	.word 0xf80dc000  ! 536: LDUB_R	ldub	[%r23 + %r0], %r28
	.word 0xf4144000  ! 537: LDUH_R	lduh	[%r17 + %r0], %r26
	.word 0xfc0cc000  ! 540: LDUB_R	ldub	[%r19 + %r0], %r30
	.word 0xf2556177  ! 542: LDSH_I	ldsh	[%r21 + 0x0177], %r25
	.word 0xf85c215d  ! 546: LDX_I	ldx	[%r16 + 0x015d], %r28
hwintr_2_31:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_31), 16, 16)) -> intp(2, 0, 1e)
	.word 0x8995615a  ! 552: WRPR_TICK_I	wrpr	%r21, 0x015a, %tick
	.word 0xbec44000  ! 553: ADDCcc_R	addccc 	%r17, %r0, %r31
	.word 0xb03da026  ! 558: XNOR_I	xnor 	%r22, 0x0026, %r24
	.word 0xfc0c61b4  ! 563: LDUB_I	ldub	[%r17 + 0x01b4], %r30
	.word 0xfc0da01d  ! 565: LDUB_I	ldub	[%r22 + 0x001d], %r30
	.word 0x8794201d  ! 570: WRPR_TT_I	wrpr	%r16, 0x001d, %tt
hwintr_2_32:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_32), 16, 16)) -> intp(2, 0, 1d)
	.word 0xfc1c4000  ! 574: LDD_R	ldd	[%r17 + %r0], %r30
	setx	data_start_6, %g1, %r18
	setx	0xaeaaaa7e00007b8c, %g1, %r10
	.word 0x819a8000  ! 578: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xf71ce17b  ! 579: LDDF_I	ldd	[%r19, 0x017b], %f27
	.word 0xf214c000  ! 580: LDUH_R	lduh	[%r19 + %r0], %r25
	.word 0x8794a16b  ! 583: WRPR_TT_I	wrpr	%r18, 0x016b, %tt
	setx	data_start_1, %g1, %r16
hwintr_2_33:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_33), 16, 16)) -> intp(2, 0, 22)
	.word 0xf454e1e1  ! 592: LDSH_I	ldsh	[%r19 + 0x01e1], %r26
	.word 0xf51d618c  ! 594: LDDF_I	ldd	[%r21, 0x018c], %f26
	.word 0xb7520000  ! 598: RDPR_PIL	rdpr	%pil, %r27
hwintr_2_34:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_34), 16, 16)) -> intp(2, 0, 12)
	.word 0xfe4c8000  ! 603: LDSB_R	ldsb	[%r18 + %r0], %r31
	.word 0xfa5d4000  ! 604: LDX_R	ldx	[%r21 + %r0], %r29
	.word 0xfc140000  ! 606: LDUH_R	lduh	[%r16 + %r0], %r30
	.word 0xf41461a8  ! 607: LDUH_I	lduh	[%r17 + 0x01a8], %r26
	.word 0xf24d0000  ! 608: LDSB_R	ldsb	[%r20 + %r0], %r25
	.word 0xbe95204d  ! 610: ORcc_I	orcc 	%r20, 0x004d, %r31
	.word 0xfd1c2066  ! 612: LDDF_I	ldd	[%r16, 0x0066], %f30
	.word 0xfd1c6095  ! 615: LDDF_I	ldd	[%r17, 0x0095], %f30
	.word 0x879521ff  ! 616: WRPR_TT_I	wrpr	%r20, 0x01ff, %tt
	.word 0xf04d4000  ! 617: LDSB_R	ldsb	[%r21 + %r0], %r24
	.word 0xf455e1f1  ! 619: LDSH_I	ldsh	[%r23 + 0x01f1], %r26
	.word 0xf205a1bc  ! 620: LDUW_I	lduw	[%r22 + 0x01bc], %r25
	.word 0x8795a0ac  ! 622: WRPR_TT_I	wrpr	%r22, 0x00ac, %tt
	.word 0xf6450000  ! 623: LDSW_R	ldsw	[%r20 + %r0], %r27
	.word 0xf04ce0ae  ! 633: LDSB_I	ldsb	[%r19 + 0x00ae], %r24
	.word 0xf80d0000  ! 637: LDUB_R	ldub	[%r20 + %r0], %r28
	.word 0xb7641800  ! 640: MOVcc_R	<illegal instruction>
	.word 0xf91d8000  ! 641: LDDF_R	ldd	[%r22, %r0], %f28
	.word 0xf255a072  ! 642: LDSH_I	ldsh	[%r22 + 0x0072], %r25
	.word 0xf01c6120  ! 643: LDD_I	ldd	[%r17 + 0x0120], %r24
hwintr_2_35:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_35), 16, 16)) -> intp(2, 0, 1)
	.word 0xfe4ce1e4  ! 654: LDSB_I	ldsb	[%r19 + 0x01e4], %r31
	.word 0xf51d0000  ! 655: LDDF_R	ldd	[%r20, %r0], %f26
	.word 0xf65ce1c6  ! 658: LDX_I	ldx	[%r19 + 0x01c6], %r27
	.word 0xbd540000  ! 660: RDPR_GL	<illegal instruction>
	.word 0xf454a178  ! 661: LDSH_I	ldsh	[%r18 + 0x0178], %r26
	.word 0xf65c21a7  ! 662: LDX_I	ldx	[%r16 + 0x01a7], %r27
	.word 0xba246036  ! 663: SUB_I	sub 	%r17, 0x0036, %r29
	.word 0xbd518000  ! 668: RDPR_PSTATE	<illegal instruction>
	.word 0xb751c000  ! 670: RDPR_TL	<illegal instruction>
	.word 0x8595e015  ! 671: WRPR_TSTATE_I	wrpr	%r23, 0x0015, %tstate
	.word 0xb2bc0000  ! 672: XNORcc_R	xnorcc 	%r16, %r0, %r25
	.word 0xba05c000  ! 675: ADD_R	add 	%r23, %r0, %r29
	.word 0xb351c000  ! 676: RDPR_TL	<illegal instruction>
	.word 0xbd480000  ! 677: RDHPR_HPSTATE	rdhpr	%hpstate, %r30
	.word 0x9194e0eb  ! 680: WRPR_PIL_I	wrpr	%r19, 0x00eb, %pil
hwintr_2_36:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_36), 16, 16)) -> intp(2, 0, f)
	.word 0xfe5c0000  ! 683: LDX_R	ldx	[%r16 + %r0], %r31
hwintr_2_37:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_37), 16, 16)) -> intp(2, 0, 0)
	setx	0x3c9299d300008a49, %g1, %r10
	.word 0x839a8000  ! 687: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xf61c0000  ! 688: LDD_R	ldd	[%r16 + %r0], %r27
	.word 0xbf520000  ! 690: RDPR_PIL	<illegal instruction>
	.word 0xf4158000  ! 691: LDUH_R	lduh	[%r22 + %r0], %r26
	.word 0xbb51c000  ! 693: RDPR_TL	<illegal instruction>
	.word 0xfd1c8000  ! 695: LDDF_R	ldd	[%r18, %r0], %f30
	.word 0xbd520000  ! 696: RDPR_PIL	<illegal instruction>
	.word 0xf81de021  ! 698: LDD_I	ldd	[%r23 + 0x0021], %r28
	.word 0xf604e074  ! 700: LDUW_I	lduw	[%r19 + 0x0074], %r27
	.word 0xfc1c8000  ! 701: LDD_R	ldd	[%r18 + %r0], %r30
hwintr_2_38:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_38), 16, 16)) -> intp(2, 0, 10)
hwintr_2_39:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_39), 16, 16)) -> intp(2, 0, 39)
	.word 0x8595e189  ! 704: WRPR_TSTATE_I	wrpr	%r23, 0x0189, %tstate
hwintr_2_40:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_40), 16, 16)) -> intp(2, 0, 25)
hwintr_2_41:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_41), 16, 16)) -> intp(2, 0, 24)
	.word 0xf204c000  ! 708: LDUW_R	lduw	[%r19 + %r0], %r25
	.word 0xfc0c0000  ! 709: LDUB_R	ldub	[%r16 + %r0], %r30
	.word 0xbd2d7001  ! 710: SLLX_I	sllx	%r21, 0x0001, %r30
	.word 0xb550c000  ! 714: RDPR_TT	<illegal instruction>
	.word 0xf64461b0  ! 719: LDSW_I	ldsw	[%r17 + 0x01b0], %r27
hwintr_2_42:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_42), 16, 16)) -> intp(2, 0, 4)
	.word 0xfc558000  ! 731: LDSH_R	ldsh	[%r22 + %r0], %r30
	.word 0xfa1561cc  ! 734: LDUH_I	lduh	[%r21 + 0x01cc], %r29
	.word 0xbe94c000  ! 738: ORcc_R	orcc 	%r19, %r0, %r31
	.word 0xf4440000  ! 739: LDSW_R	ldsw	[%r16 + %r0], %r26
	.word 0xf6540000  ! 741: LDSH_R	ldsh	[%r16 + %r0], %r27
	.word 0xbc1cc000  ! 742: XOR_R	xor 	%r19, %r0, %r30
	.word 0xfe15a014  ! 743: LDUH_I	lduh	[%r22 + 0x0014], %r31
	.word 0xfc14c000  ! 747: LDUH_R	lduh	[%r19 + %r0], %r30
	.word 0xb3520000  ! 749: RDPR_PIL	<illegal instruction>
	.word 0xfe144000  ! 751: LDUH_R	lduh	[%r17 + %r0], %r31
	mov	0, %r12
	.word 0xa1930000  ! 753: WRPR_GL_R	wrpr	%r12, %r0, %-
	mov	1, %r12
	.word 0xa1930000  ! 755: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb9508000  ! 759: RDPR_TSTATE	<illegal instruction>
hwintr_2_43:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_43), 16, 16)) -> intp(2, 0, 6)
hwintr_2_44:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_44), 16, 16)) -> intp(2, 0, 2)
	.word 0xbd35f001  ! 773: SRLX_I	srlx	%r23, 0x0001, %r30
	.word 0xf85cc000  ! 774: LDX_R	ldx	[%r19 + %r0], %r28
	.word 0xf415c000  ! 777: LDUH_R	lduh	[%r23 + %r0], %r26
	.word 0xf8044000  ! 778: LDUW_R	lduw	[%r17 + %r0], %r28
	.word 0xfa0d2027  ! 782: LDUB_I	ldub	[%r20 + 0x0027], %r29
	.word 0x8d9560e0  ! 785: WRPR_PSTATE_I	wrpr	%r21, 0x00e0, %pstate
	.word 0xf01ce1d0  ! 790: LDD_I	ldd	[%r19 + 0x01d0], %r24
	.word 0xf61c2144  ! 792: LDD_I	ldd	[%r16 + 0x0144], %r27
hwintr_2_45:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_45), 16, 16)) -> intp(2, 0, 8)
	.word 0xb7510000  ! 798: RDPR_TICK	rdpr	%tick, %r27
	.word 0xfa55a03e  ! 801: LDSH_I	ldsh	[%r22 + 0x003e], %r29
	.word 0xf64461f7  ! 802: LDSW_I	ldsw	[%r17 + 0x01f7], %r27
	.word 0xbf520000  ! 803: RDPR_PIL	<illegal instruction>
	.word 0xb1518000  ! 805: RDPR_PSTATE	<illegal instruction>
hwintr_2_46:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_46), 16, 16)) -> intp(2, 0, 7)
	setx	0xe4c801800004b96, %g1, %r10
	.word 0x819a8000  ! 809: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xfc040000  ! 812: LDUW_R	lduw	[%r16 + %r0], %r30
	.word 0xf31c6150  ! 813: LDDF_I	ldd	[%r17, 0x0150], %f25
	.word 0xfc0dc000  ! 819: LDUB_R	ldub	[%r23 + %r0], %r30
	.word 0xbc2ce02d  ! 820: ANDN_I	andn 	%r19, 0x002d, %r30
	.word 0xf2448000  ! 821: LDSW_R	ldsw	[%r18 + %r0], %r25
	.word 0xb0342168  ! 823: ORN_I	orn 	%r16, 0x0168, %r24
	.word 0xf81d8000  ! 827: LDD_R	ldd	[%r22 + %r0], %r28
	.word 0xfa5ca1b9  ! 828: LDX_I	ldx	[%r18 + 0x01b9], %r29
	.word 0xb40de03d  ! 829: AND_I	and 	%r23, 0x003d, %r26
	.word 0xf11c8000  ! 831: LDDF_R	ldd	[%r18, %r0], %f24
	.word 0xb8358000  ! 832: ORN_R	orn 	%r22, %r0, %r28
	.word 0xfe5c6005  ! 833: LDX_I	ldx	[%r17 + 0x0005], %r31
	.word 0xb751c000  ! 840: RDPR_TL	<illegal instruction>
	.word 0xf85d8000  ! 844: LDX_R	ldx	[%r22 + %r0], %r28
	.word 0xf6550000  ! 848: LDSH_R	ldsh	[%r20 + %r0], %r27
	.word 0xb894a1ee  ! 850: ORcc_I	orcc 	%r18, 0x01ee, %r28
	.word 0xbc1c4000  ! 857: XOR_R	xor 	%r17, %r0, %r30
	.word 0xfc15a021  ! 858: LDUH_I	lduh	[%r22 + 0x0021], %r30
	.word 0xf41d21b8  ! 859: LDD_I	ldd	[%r20 + 0x01b8], %r26
	.word 0xf40da091  ! 865: LDUB_I	ldub	[%r22 + 0x0091], %r26
	.word 0x8195e1f5  ! 869: WRPR_TPC_I	wrpr	%r23, 0x01f5, %tpc
	.word 0xb1504000  ! 874: RDPR_TNPC	<illegal instruction>
	.word 0xb751c000  ! 878: RDPR_TL	<illegal instruction>
	.word 0xb7510000  ! 880: RDPR_TICK	<illegal instruction>
	.word 0xfe4dc000  ! 882: LDSB_R	ldsb	[%r23 + %r0], %r31
	mov	2, %r12
	.word 0x8f930000  ! 883: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xf6448000  ! 889: LDSW_R	ldsw	[%r18 + %r0], %r27
	.word 0xf44d603a  ! 894: LDSB_I	ldsb	[%r21 + 0x003a], %r26
	.word 0xb7540000  ! 897: RDPR_GL	<illegal instruction>
	.word 0xf85d6154  ! 901: LDX_I	ldx	[%r21 + 0x0154], %r28
hwintr_2_47:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_47), 16, 16)) -> intp(2, 0, b)
	.word 0x819420dd  ! 908: WRPR_TPC_I	wrpr	%r16, 0x00dd, %tpc
	.word 0xf51de16e  ! 909: LDDF_I	ldd	[%r23, 0x016e], %f26
	.word 0xf45c0000  ! 912: LDX_R	ldx	[%r16 + %r0], %r26
	.word 0x819461eb  ! 917: WRPR_TPC_I	wrpr	%r17, 0x01eb, %tpc
	setx	0x8de6a7ae00002b55, %g1, %r10
	.word 0x819a8000  ! 920: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
hwintr_2_48:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_48), 16, 16)) -> intp(2, 0, 8)
	.word 0xf405c000  ! 929: LDUW_R	lduw	[%r23 + %r0], %r26
	setx	data_start_3, %g1, %r22
	.word 0xb6348000  ! 936: ORN_R	orn 	%r18, %r0, %r27
	.word 0xf41c60b8  ! 937: LDD_I	ldd	[%r17 + 0x00b8], %r26
	.word 0xb9510000  ! 939: RDPR_TICK	<illegal instruction>
	.word 0xfa05e044  ! 945: LDUW_I	lduw	[%r23 + 0x0044], %r29
hwintr_2_49:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_49), 16, 16)) -> intp(2, 0, 3c)
	.word 0xb3504000  ! 950: RDPR_TNPC	<illegal instruction>
hwintr_2_50:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_50), 16, 16)) -> intp(2, 0, 5)
	.word 0xfc4d8000  ! 954: LDSB_R	ldsb	[%r22 + %r0], %r30
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
hwintr_2_51:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_51), 16, 16)) -> intp(2, 0, 25)
	.word 0xfe4c2168  ! 963: LDSB_I	ldsb	[%r16 + 0x0168], %r31
	.word 0xf80ca057  ! 965: LDUB_I	ldub	[%r18 + 0x0057], %r28
	.word 0xf65da172  ! 971: LDX_I	ldx	[%r22 + 0x0172], %r27
	setx	data_start_3, %g1, %r17
	.word 0xf71d8000  ! 982: LDDF_R	ldd	[%r22, %r0], %f27
	.word 0x879460db  ! 983: WRPR_TT_I	wrpr	%r17, 0x00db, %tt
	.word 0xf81ce037  ! 984: LDD_I	ldd	[%r19 + 0x0037], %r28
	.word 0xf255a182  ! 988: LDSH_I	ldsh	[%r22 + 0x0182], %r25
	setx	0xf20af8c10000c85e, %g1, %r10
	.word 0x839a8000  ! 996: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_1:
	.word 0xb9a489a0  ! 1: FDIVs	fdivs	%f18, %f0, %f28
	.word 0xbfa81c20  ! 2: FMOVRGEZ	dis not found

hwintr_1_0:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_0), 16, 16)) -> intp(1, 0, 28)
	.word 0xb1abc820  ! 5: FMOVVC	fmovs	%fcc1, %f0, %f24
	setx	data_start_2, %g1, %r16
	.word 0xbda508c0  ! 8: FSUBd	fsubd	%f20, %f0, %f30
	.word 0xb1a84820  ! 10: FMOVE	fmovs	%fcc1, %f0, %f24
	.word 0xb7500000  ! 13: RDPR_TPC	<illegal instruction>
	.word 0xbbabc820  ! 19: FMOVVC	fmovs	%fcc1, %f0, %f29
	.word 0xb8954000  ! 20: ORcc_R	orcc 	%r21, %r0, %r28
	.word 0xb9a88820  ! 23: FMOVLE	fmovs	%fcc1, %f0, %f28
	.word 0x8195206b  ! 28: WRPR_TPC_I	wrpr	%r20, 0x006b, %tpc
	.word 0xb5504000  ! 31: RDPR_TNPC	<illegal instruction>
	.word 0xbc95e132  ! 32: ORcc_I	orcc 	%r23, 0x0132, %r30
hwintr_1_1:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_1), 16, 16)) -> intp(1, 0, c)
	.word 0xb5a509c0  ! 39: FDIVd	fdivd	%f20, %f0, %f26
	.word 0xb5a488c0  ! 40: FSUBd	fsubd	%f18, %f0, %f26
	.word 0xbd50c000  ! 42: RDPR_TT	<illegal instruction>
	.word 0xbba9c820  ! 44: FMOVVS	fmovs	%fcc1, %f0, %f29
	.word 0xbf2db001  ! 45: SLLX_I	sllx	%r22, 0x0001, %r31
	.word 0xb5a00020  ! 47: FMOVs	fmovs	%f0, %f26
	.word 0xbfa00040  ! 48: FMOVd	fmovd	%f0, %f62
	.word 0xb3a80820  ! 50: FMOVN	fmovs	%fcc1, %f0, %f25
	.word 0xb7aac820  ! 53: FMOVGE	fmovs	%fcc1, %f0, %f27
	.word 0x81956146  ! 55: WRPR_TPC_I	wrpr	%r21, 0x0146, %tpc
	.word 0xb9a588c0  ! 57: FSUBd	fsubd	%f22, %f0, %f28
hwintr_1_2:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_2), 16, 16)) -> intp(1, 0, 3a)
	.word 0xb1aa8820  ! 63: FMOVG	fmovs	%fcc1, %f0, %f24
	.word 0xb835c000  ! 64: ORN_R	orn 	%r23, %r0, %r28
	.word 0xbdaa8820  ! 66: FMOVG	fmovs	%fcc1, %f0, %f30
hwintr_1_3:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_3), 16, 16)) -> intp(1, 0, 33)
	.word 0xb9a8c820  ! 70: FMOVL	fmovs	%fcc1, %f0, %f28
	.word 0xb1a548c0  ! 74: FSUBd	fsubd	%f52, %f0, %f24
	.word 0xbfa9c820  ! 75: FMOVVS	fmovs	%fcc1, %f0, %f31
	mov	1, %r12
	.word 0xa1930000  ! 83: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb5500000  ! 84: RDPR_TPC	<illegal instruction>
hwintr_1_4:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_4), 16, 16)) -> intp(1, 0, 31)
hwintr_1_5:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_5), 16, 16)) -> intp(1, 0, c)
	.word 0xb1a449c0  ! 96: FDIVd	fdivd	%f48, %f0, %f24
	.word 0xb3a58840  ! 100: FADDd	faddd	%f22, %f0, %f56
hwintr_1_6:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_6), 16, 16)) -> intp(1, 0, 29)
hwintr_1_7:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_7), 16, 16)) -> intp(1, 0, 21)
	.word 0xb1a80420  ! 104: FMOVRZ	dis not found

	.word 0xb5a488c0  ! 105: FSUBd	fsubd	%f18, %f0, %f26
	setx	0x36bcf89500008c9b, %g1, %r10
	.word 0x819a8000  ! 106: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xbba58860  ! 107: FADDq	dis not found

hwintr_1_8:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_8), 16, 16)) -> intp(1, 0, 6)
	.word 0xb7a549a0  ! 109: FDIVs	fdivs	%f21, %f0, %f27
	.word 0xb3a58940  ! 111: FMULd	fmuld	%f22, %f0, %f56
	.word 0xb5ab4820  ! 113: FMOVCC	fmovs	%fcc1, %f0, %f26
	setx	0x6ebc009400008f87, %g1, %r10
	.word 0x839a8000  ! 115: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	mov	1, %r12
	.word 0xa1930000  ! 117: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb88ca175  ! 118: ANDcc_I	andcc 	%r18, 0x0175, %r28
	.word 0xbfa80c20  ! 119: FMOVRLZ	dis not found

	.word 0xbdaac820  ! 120: FMOVGE	fmovs	%fcc1, %f0, %f30
	.word 0xb9a549a0  ! 123: FDIVs	fdivs	%f21, %f0, %f28
	.word 0xb7500000  ! 124: RDPR_TPC	<illegal instruction>
	.word 0xbd510000  ! 125: RDPR_TICK	<illegal instruction>
	.word 0xbe3de030  ! 130: XNOR_I	xnor 	%r23, 0x0030, %r31
	.word 0xb7a00560  ! 136: FSQRTq	fsqrt	
hwintr_1_9:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_9), 16, 16)) -> intp(1, 0, 35)
hwintr_1_10:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_10), 16, 16)) -> intp(1, 0, 20)
	.word 0xb3abc820  ! 140: FMOVVC	fmovs	%fcc1, %f0, %f25
	.word 0xbfabc820  ! 141: FMOVVC	fmovs	%fcc1, %f0, %f31
	.word 0xb7a408e0  ! 142: FSUBq	dis not found

	.word 0xb3a5c9e0  ! 143: FDIVq	dis not found

	mov	0, %r12
	.word 0xa1930000  ! 146: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0x8795a047  ! 149: WRPR_TT_I	wrpr	%r22, 0x0047, %tt
	mov	1, %r12
	.word 0x8f930000  ! 153: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xbd508000  ! 156: RDPR_TSTATE	<illegal instruction>
	.word 0xb33db001  ! 157: SRAX_I	srax	%r22, 0x0001, %r25
	.word 0xbd51c000  ! 158: RDPR_TL	<illegal instruction>
	.word 0xb5a448a0  ! 161: FSUBs	fsubs	%f17, %f0, %f26
hwintr_1_11:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_11), 16, 16)) -> intp(1, 0, 34)
	.word 0xbfaa0820  ! 165: FMOVA	fmovs	%fcc1, %f0, %f31
	.word 0xb750c000  ! 166: RDPR_TT	<illegal instruction>
	.word 0xbf510000  ! 168: RDPR_TICK	<illegal instruction>
	.word 0xbba94820  ! 171: FMOVCS	fmovs	%fcc1, %f0, %f29
	.word 0xbdaac820  ! 173: FMOVGE	fmovs	%fcc1, %f0, %f30
	.word 0xb7a81820  ! 180: FMOVRGZ	fmovs	%fcc3, %f0, %f27
	.word 0xb3aac820  ! 181: FMOVGE	fmovs	%fcc1, %f0, %f25
	setx	data_start_2, %g1, %r16
	.word 0xba14e092  ! 187: OR_I	or 	%r19, 0x0092, %r29
hwintr_1_12:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_12), 16, 16)) -> intp(1, 0, 8)
	.word 0xb1a4c820  ! 191: FADDs	fadds	%f19, %f0, %f24
	.word 0xbfaac820  ! 192: FMOVGE	fmovs	%fcc1, %f0, %f31
	.word 0xb9a80420  ! 193: FMOVRZ	dis not found

	.word 0xbcb54000  ! 196: SUBCcc_R	orncc 	%r21, %r0, %r30
	.word 0x9195a075  ! 201: WRPR_PIL_I	wrpr	%r22, 0x0075, %pil
	.word 0xb7a00540  ! 205: FSQRTd	fsqrt	
	.word 0x89946174  ! 208: WRPR_TICK_I	wrpr	%r17, 0x0174, %tick
hwintr_1_13:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_13), 16, 16)) -> intp(1, 0, 28)
	.word 0xb5a489a0  ! 215: FDIVs	fdivs	%f18, %f0, %f26
	.word 0xbfa90820  ! 218: FMOVLEU	fmovs	%fcc1, %f0, %f31
	.word 0x85952161  ! 219: WRPR_TSTATE_I	wrpr	%r20, 0x0161, %tstate
	.word 0xbdaa8820  ! 225: FMOVG	fmovs	%fcc1, %f0, %f30
	.word 0xb5a80820  ! 226: FMOVN	fmovs	%fcc1, %f0, %f26
	.word 0xb3a94820  ! 227: FMOVCS	fmovs	%fcc1, %f0, %f25
hwintr_1_14:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_14), 16, 16)) -> intp(1, 0, 38)
	.word 0xb3518000  ! 232: RDPR_PSTATE	<illegal instruction>
	.word 0xbbaa4820  ! 237: FMOVNE	fmovs	%fcc1, %f0, %f29
	.word 0xb9aa8820  ! 240: FMOVG	fmovs	%fcc1, %f0, %f28
	.word 0xb1a94820  ! 241: FMOVCS	fmovs	%fcc1, %f0, %f24
	.word 0xb6350000  ! 247: SUBC_R	orn 	%r20, %r0, %r27
	.word 0xb3a5c9e0  ! 248: FDIVq	dis not found

	setx	data_start_5, %g1, %r22
	.word 0xb5a90820  ! 252: FMOVLEU	fmovs	%fcc1, %f0, %f26
	.word 0xbba409c0  ! 254: FDIVd	fdivd	%f16, %f0, %f60
	.word 0xb9ab4820  ! 256: FMOVCC	fmovs	%fcc1, %f0, %f28
	.word 0x8d94600b  ! 258: WRPR_PSTATE_I	wrpr	%r17, 0x000b, %pstate
	.word 0x8194a03d  ! 259: WRPR_TPC_I	wrpr	%r18, 0x003d, %tpc
	.word 0xb7aa8820  ! 260: FMOVG	fmovs	%fcc1, %f0, %f27
	.word 0xb9a00540  ! 266: FSQRTd	fsqrt	
	.word 0xb3a549a0  ! 267: FDIVs	fdivs	%f21, %f0, %f25
	.word 0xb21561bb  ! 269: OR_I	or 	%r21, 0x01bb, %r25
hwintr_1_15:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_15), 16, 16)) -> intp(1, 0, f)
	.word 0xbf34e001  ! 274: SRL_I	srl 	%r19, 0x0001, %r31
	.word 0xbda9c820  ! 275: FMOVVS	fmovs	%fcc1, %f0, %f30
hwintr_1_16:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_16), 16, 16)) -> intp(1, 0, 18)
	.word 0xb08da106  ! 281: ANDcc_I	andcc 	%r22, 0x0106, %r24
	.word 0xb695a08d  ! 282: ORcc_I	orcc 	%r22, 0x008d, %r27
hwintr_1_17:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_17), 16, 16)) -> intp(1, 0, 20)
	.word 0xbda80820  ! 290: FMOVRLEZ	fmovs	%fcc1, %f0, %f30
	.word 0x83956118  ! 292: WRPR_TNPC_I	wrpr	%r21, 0x0118, %tnpc
	.word 0xbfa90820  ! 294: FMOVLEU	fmovs	%fcc1, %f0, %f31
	.word 0xb1a58820  ! 295: FADDs	fadds	%f22, %f0, %f24
	.word 0xbd520000  ! 298: RDPR_PIL	<illegal instruction>
	.word 0x919461ae  ! 300: WRPR_PIL_I	wrpr	%r17, 0x01ae, %pil
	.word 0xb1a80c20  ! 301: FMOVRLZ	dis not found

	.word 0xbe1de1dc  ! 307: XOR_I	xor 	%r23, 0x01dc, %r31
	.word 0xb4456100  ! 308: ADDC_I	addc 	%r21, 0x0100, %r26
	.word 0x8395a03f  ! 310: WRPR_TNPC_I	wrpr	%r22, 0x003f, %tnpc
	.word 0xb9a88820  ! 312: FMOVLE	fmovs	%fcc1, %f0, %f28
hwintr_1_18:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_18), 16, 16)) -> intp(1, 0, b)
	.word 0xbf7d4400  ! 315: MOVR_R	movre	%r21, %r0, %r31
	mov	1, %r12
	.word 0xa1930000  ! 319: WRPR_GL_R	wrpr	%r12, %r0, %-
hwintr_1_19:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_19), 16, 16)) -> intp(1, 0, 3c)
	.word 0xb5ab8820  ! 321: FMOVPOS	fmovs	%fcc1, %f0, %f26
	.word 0xb9aac820  ! 324: FMOVGE	fmovs	%fcc1, %f0, %f28
hwintr_1_20:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_20), 16, 16)) -> intp(1, 0, 11)
	.word 0xb7a81820  ! 331: FMOVRGZ	fmovs	%fcc3, %f0, %f27
	.word 0xb9a50820  ! 334: FADDs	fadds	%f20, %f0, %f28
hwintr_1_21:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_21), 16, 16)) -> intp(1, 0, f)
	.word 0xbba54860  ! 339: FADDq	dis not found

	.word 0xb3a408c0  ! 341: FSUBd	fsubd	%f16, %f0, %f56
	.word 0xbe3461e2  ! 344: ORN_I	orn 	%r17, 0x01e2, %r31
	.word 0xb751c000  ! 345: RDPR_TL	<illegal instruction>
	.word 0xb1520000  ! 346: RDPR_PIL	<illegal instruction>
	.word 0x8594a0cd  ! 348: WRPR_TSTATE_I	wrpr	%r18, 0x00cd, %tstate
	.word 0xb7a80820  ! 355: FMOVRLEZ	fmovs	%fcc1, %f0, %f27
	.word 0xbba90820  ! 356: FMOVLEU	fmovs	%fcc1, %f0, %f29
	.word 0xbf50c000  ! 361: RDPR_TT	<illegal instruction>
hwintr_1_22:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_22), 16, 16)) -> intp(1, 0, 5)
	mov	1, %r12
	.word 0xa1930000  ! 370: WRPR_GL_R	wrpr	%r12, %r0, %-
hwintr_1_23:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_23), 16, 16)) -> intp(1, 0, d)
	.word 0x899560af  ! 372: WRPR_TICK_I	wrpr	%r21, 0x00af, %tick
	mov	2, %r12
	.word 0xa1930000  ! 375: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xbba00020  ! 376: FMOVs	fmovs	%f0, %f29
	.word 0xbda00540  ! 380: FSQRTd	fsqrt	
	.word 0xb7a94820  ! 381: FMOVCS	fmovs	%fcc1, %f0, %f27
	.word 0xbfa00020  ! 382: FMOVs	fmovs	%f0, %f31
	.word 0xb7a44820  ! 393: FADDs	fadds	%f17, %f0, %f27
hwintr_1_24:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_24), 16, 16)) -> intp(1, 0, 1)
	.word 0xb02c4000  ! 397: ANDN_R	andn 	%r17, %r0, %r24
	.word 0x919421b5  ! 399: WRPR_PIL_I	wrpr	%r16, 0x01b5, %pil
	.word 0xb7a84820  ! 401: FMOVE	fmovs	%fcc1, %f0, %f27
	.word 0xbda81c20  ! 402: FMOVRGEZ	dis not found

	.word 0xbd504000  ! 405: RDPR_TNPC	<illegal instruction>
	.word 0xb1a00520  ! 408: FSQRTs	fsqrt	
	.word 0xb5a549a0  ! 410: FDIVs	fdivs	%f21, %f0, %f26
	.word 0xb5a4c8a0  ! 411: FSUBs	fsubs	%f19, %f0, %f26
	.word 0x9195a031  ! 412: WRPR_PIL_I	wrpr	%r22, 0x0031, %pil
	.word 0xbb510000  ! 413: RDPR_TICK	<illegal instruction>
	.word 0xb635e1a0  ! 415: ORN_I	orn 	%r23, 0x01a0, %r27
	.word 0xb7ab0820  ! 416: FMOVGU	fmovs	%fcc1, %f0, %f27
	.word 0xb5aa4820  ! 418: FMOVNE	fmovs	%fcc1, %f0, %f26
	.word 0xb9a88820  ! 419: FMOVLE	fmovs	%fcc1, %f0, %f28
hwintr_1_25:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_25), 16, 16)) -> intp(1, 0, d)
	.word 0xbba58820  ! 421: FADDs	fadds	%f22, %f0, %f29
	.word 0x89956199  ! 423: WRPR_TICK_I	wrpr	%r21, 0x0199, %tick
	.word 0xbba548c0  ! 430: FSUBd	fsubd	%f52, %f0, %f60
	.word 0xb5a408a0  ! 431: FSUBs	fsubs	%f16, %f0, %f26
hwintr_1_26:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_26), 16, 16)) -> intp(1, 0, 3d)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
hwintr_1_27:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_27), 16, 16)) -> intp(1, 0, 6)
	.word 0xb551c000  ! 444: RDPR_TL	<illegal instruction>
	.word 0xbba00020  ! 449: FMOVs	fmovs	%f0, %f29
	mov	0, %r12
	.word 0xa1930000  ! 451: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xbda00560  ! 456: FSQRTq	fsqrt	
hwintr_1_28:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_28), 16, 16)) -> intp(1, 0, 38)
	setx	data_start_3, %g1, %r16
	.word 0x859561f8  ! 459: WRPR_TSTATE_I	wrpr	%r21, 0x01f8, %tstate
	.word 0xb1a00560  ! 464: FSQRTq	fsqrt	
	.word 0xb3a81820  ! 465: FMOVRGZ	fmovs	%fcc3, %f0, %f25
	.word 0xbf500000  ! 467: RDPR_TPC	<illegal instruction>
	mov	0, %r12
	.word 0xa1930000  ! 470: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb3a80c20  ! 473: FMOVRLZ	dis not found

	.word 0xb5510000  ! 479: RDPR_TICK	<illegal instruction>
	.word 0xb5480000  ! 480: RDHPR_HPSTATE	rdhpr	%hpstate, %r26
	.word 0xb9a00560  ! 483: FSQRTq	fsqrt	
	.word 0xb9540000  ! 485: RDPR_GL	<illegal instruction>
	.word 0xbda90820  ! 487: FMOVLEU	fmovs	%fcc1, %f0, %f30
	.word 0xb4354000  ! 489: ORN_R	orn 	%r21, %r0, %r26
	.word 0xb3a9c820  ! 490: FMOVVS	fmovs	%fcc1, %f0, %f25
	.word 0x8d956155  ! 491: WRPR_PSTATE_I	wrpr	%r21, 0x0155, %pstate
	.word 0xb9a80c20  ! 493: FMOVRLZ	dis not found

	.word 0xb7ab4820  ! 495: FMOVCC	fmovs	%fcc1, %f0, %f27
	.word 0xb1a50860  ! 498: FADDq	dis not found

	.word 0xbda48840  ! 504: FADDd	faddd	%f18, %f0, %f30
	.word 0xb5ab8820  ! 506: FMOVPOS	fmovs	%fcc1, %f0, %f26
	.word 0xba14e0ee  ! 507: OR_I	or 	%r19, 0x00ee, %r29
	.word 0x83952031  ! 508: WRPR_TNPC_I	wrpr	%r20, 0x0031, %tnpc
	.word 0xb5a90820  ! 511: FMOVLEU	fmovs	%fcc1, %f0, %f26
	.word 0xb7a00020  ! 512: FMOVs	fmovs	%f0, %f27
	.word 0xb6b5a0c0  ! 513: SUBCcc_I	orncc 	%r22, 0x00c0, %r27
hwintr_1_29:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_29), 16, 16)) -> intp(1, 0, 6)
	.word 0xbfa5c8c0  ! 515: FSUBd	fsubd	%f54, %f0, %f62
	.word 0xb3a80820  ! 517: FMOVRLEZ	fmovs	%fcc1, %f0, %f25
	.word 0xbda548e0  ! 523: FSUBq	dis not found

	.word 0xb1a409e0  ! 529: FDIVq	dis not found

hwintr_1_30:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_30), 16, 16)) -> intp(1, 0, 16)
	.word 0xbfab8820  ! 534: FMOVPOS	fmovs	%fcc1, %f0, %f31
	.word 0xb9a00560  ! 535: FSQRTq	fsqrt	
	.word 0xbdab0820  ! 544: FMOVGU	fmovs	%fcc1, %f0, %f30
	.word 0xb3abc820  ! 547: FMOVVC	fmovs	%fcc1, %f0, %f25
hwintr_1_31:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_31), 16, 16)) -> intp(1, 0, 24)
	.word 0xb9a588c0  ! 549: FSUBd	fsubd	%f22, %f0, %f28
	.word 0x8994611c  ! 552: WRPR_TICK_I	wrpr	%r17, 0x011c, %tick
	.word 0xb6c54000  ! 553: ADDCcc_R	addccc 	%r21, %r0, %r27
	.word 0xb7a94820  ! 554: FMOVCS	fmovs	%fcc1, %f0, %f27
	.word 0xbc3ca1d6  ! 558: XNOR_I	xnor 	%r18, 0x01d6, %r30
	.word 0xb7a98820  ! 561: FMOVNEG	fmovs	%fcc1, %f0, %f27
	.word 0xb1a50940  ! 564: FMULd	fmuld	%f20, %f0, %f24
	.word 0xbda488e0  ! 567: FSUBq	dis not found

	.word 0xbfa58860  ! 569: FADDq	dis not found

	.word 0x8795211d  ! 570: WRPR_TT_I	wrpr	%r20, 0x011d, %tt
hwintr_1_32:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_32), 16, 16)) -> intp(1, 0, 11)
	.word 0xbdaa8820  ! 572: FMOVG	fmovs	%fcc1, %f0, %f30
	.word 0xb1a54860  ! 573: FADDq	dis not found

	setx	data_start_3, %g1, %r23
	setx	0x1908234e00006d4b, %g1, %r10
	.word 0x819a8000  ! 578: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xb7a80c20  ! 581: FMOVRLZ	dis not found

	.word 0xb5aa4820  ! 582: FMOVNE	fmovs	%fcc1, %f0, %f26
	.word 0x879461dc  ! 583: WRPR_TT_I	wrpr	%r17, 0x01dc, %tt
	setx	data_start_7, %g1, %r23
hwintr_1_33:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_33), 16, 16)) -> intp(1, 0, 2a)
	.word 0xbda40940  ! 595: FMULd	fmuld	%f16, %f0, %f30
	.word 0xb9520000  ! 598: RDPR_PIL	<illegal instruction>
hwintr_1_34:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_34), 16, 16)) -> intp(1, 0, 24)
	.word 0xb9a549c0  ! 601: FDIVd	fdivd	%f52, %f0, %f28
	.word 0xb2952127  ! 610: ORcc_I	orcc 	%r20, 0x0127, %r25
	.word 0xb7a00520  ! 611: FSQRTs	fsqrt	
	.word 0x879560b3  ! 616: WRPR_TT_I	wrpr	%r21, 0x00b3, %tt
	.word 0xb1a81c20  ! 621: FMOVRGEZ	dis not found

	.word 0x8795e0ed  ! 622: WRPR_TT_I	wrpr	%r23, 0x00ed, %tt
	.word 0xb7a80820  ! 629: FMOVN	fmovs	%fcc1, %f0, %f27
	.word 0xb7a81820  ! 631: FMOVRGZ	fmovs	%fcc3, %f0, %f27
	.word 0xbfa80c20  ! 632: FMOVRLZ	dis not found

	.word 0xbfa81820  ! 634: FMOVRGZ	fmovs	%fcc3, %f0, %f31
	.word 0xb9aa8820  ! 635: FMOVG	fmovs	%fcc1, %f0, %f28
	.word 0xbfab0820  ! 639: FMOVGU	fmovs	%fcc1, %f0, %f31
	.word 0xbb641800  ! 640: MOVcc_R	<illegal instruction>
	.word 0xbda00520  ! 644: FSQRTs	fsqrt	
	.word 0xb1a409a0  ! 647: FDIVs	fdivs	%f16, %f0, %f24
	.word 0xbbabc820  ! 650: FMOVVC	fmovs	%fcc1, %f0, %f29
hwintr_1_35:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_35), 16, 16)) -> intp(1, 0, 1a)
	.word 0xb5540000  ! 660: RDPR_GL	<illegal instruction>
	.word 0xba2460ef  ! 663: SUB_I	sub 	%r17, 0x00ef, %r29
	.word 0xb5a489c0  ! 666: FDIVd	fdivd	%f18, %f0, %f26
	.word 0xb3518000  ! 668: RDPR_PSTATE	<illegal instruction>
	.word 0xbfa549c0  ! 669: FDIVd	fdivd	%f52, %f0, %f62
	.word 0xb151c000  ! 670: RDPR_TL	<illegal instruction>
	.word 0x8594a132  ! 671: WRPR_TSTATE_I	wrpr	%r18, 0x0132, %tstate
	.word 0xbebc4000  ! 672: XNORcc_R	xnorcc 	%r17, %r0, %r31
	.word 0xbc05c000  ! 675: ADD_R	add 	%r23, %r0, %r30
	.word 0xbf51c000  ! 676: RDPR_TL	<illegal instruction>
	.word 0xb9480000  ! 677: RDHPR_HPSTATE	rdhpr	%hpstate, %r28
	.word 0xbda84820  ! 678: FMOVE	fmovs	%fcc1, %f0, %f30
	.word 0x9194a0bb  ! 680: WRPR_PIL_I	wrpr	%r18, 0x00bb, %pil
hwintr_1_36:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_36), 16, 16)) -> intp(1, 0, 1f)
hwintr_1_37:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_37), 16, 16)) -> intp(1, 0, a)
	.word 0xbda80c20  ! 686: FMOVRLZ	dis not found

	setx	0xa5995bc70000db4f, %g1, %r10
	.word 0x839a8000  ! 687: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb9520000  ! 690: RDPR_PIL	<illegal instruction>
	.word 0xbfa44840  ! 692: FADDd	faddd	%f48, %f0, %f62
	.word 0xbd51c000  ! 693: RDPR_TL	<illegal instruction>
	.word 0xbda4c9c0  ! 694: FDIVd	fdivd	%f50, %f0, %f30
	.word 0xb3520000  ! 696: RDPR_PIL	<illegal instruction>
	.word 0xbdabc820  ! 699: FMOVVC	fmovs	%fcc1, %f0, %f30
hwintr_1_38:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_38), 16, 16)) -> intp(1, 0, c)
hwintr_1_39:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_39), 16, 16)) -> intp(1, 0, 16)
	.word 0x859560a7  ! 704: WRPR_TSTATE_I	wrpr	%r21, 0x00a7, %tstate
	.word 0xb9a44820  ! 705: FADDs	fadds	%f17, %f0, %f28
hwintr_1_40:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_40), 16, 16)) -> intp(1, 0, 20)
hwintr_1_41:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_41), 16, 16)) -> intp(1, 0, 7)
	.word 0xbb2d7001  ! 710: SLLX_I	sllx	%r21, 0x0001, %r29
	.word 0xb350c000  ! 714: RDPR_TT	<illegal instruction>
	.word 0xb3a00560  ! 725: FSQRTq	fsqrt	
	.word 0xb1a44860  ! 727: FADDq	dis not found

hwintr_1_42:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_42), 16, 16)) -> intp(1, 0, 13)
	.word 0xb1a88820  ! 729: FMOVLE	fmovs	%fcc1, %f0, %f24
	.word 0xbba589c0  ! 730: FDIVd	fdivd	%f22, %f0, %f60
	.word 0xb3a58840  ! 737: FADDd	faddd	%f22, %f0, %f56
	.word 0xbe95c000  ! 738: ORcc_R	orcc 	%r23, %r0, %r31
	.word 0xb7a80820  ! 740: FMOVN	fmovs	%fcc1, %f0, %f27
	.word 0xb01d8000  ! 742: XOR_R	xor 	%r22, %r0, %r24
	.word 0xbb520000  ! 749: RDPR_PIL	<illegal instruction>
	mov	1, %r12
	.word 0xa1930000  ! 753: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb5a00020  ! 754: FMOVs	fmovs	%f0, %f26
	mov	2, %r12
	.word 0xa1930000  ! 755: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb7508000  ! 759: RDPR_TSTATE	<illegal instruction>
	.word 0xb3a80820  ! 760: FMOVN	fmovs	%fcc1, %f0, %f25
hwintr_1_43:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_43), 16, 16)) -> intp(1, 0, 2e)
	.word 0xb5a40940  ! 769: FMULd	fmuld	%f16, %f0, %f26
hwintr_1_44:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_44), 16, 16)) -> intp(1, 0, 2)
	.word 0xb1a40860  ! 771: FADDq	dis not found

	.word 0xbd343001  ! 773: SRLX_I	srlx	%r16, 0x0001, %r30
	.word 0xbba00040  ! 775: FMOVd	fmovd	%f0, %f60
	.word 0x8d94e041  ! 785: WRPR_PSTATE_I	wrpr	%r19, 0x0041, %pstate
	.word 0xbba5c840  ! 788: FADDd	faddd	%f54, %f0, %f60
	.word 0xb7aa8820  ! 791: FMOVG	fmovs	%fcc1, %f0, %f27
hwintr_1_45:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_45), 16, 16)) -> intp(1, 0, 4)
	.word 0xb3510000  ! 798: RDPR_TICK	<illegal instruction>
	.word 0xb5520000  ! 803: RDPR_PIL	<illegal instruction>
	.word 0xb7518000  ! 805: RDPR_PSTATE	<illegal instruction>
hwintr_1_46:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_46), 16, 16)) -> intp(1, 0, 2d)
	.word 0xb7aa4820  ! 808: FMOVNE	fmovs	%fcc1, %f0, %f27
	setx	0x5663440900000e19, %g1, %r10
	.word 0x819a8000  ! 809: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xb3a94820  ! 815: FMOVCS	fmovs	%fcc1, %f0, %f25
	.word 0xb7a81c20  ! 816: FMOVRGEZ	dis not found

	.word 0xb9a00020  ! 818: FMOVs	fmovs	%f0, %f28
	.word 0xbc2d6093  ! 820: ANDN_I	andn 	%r21, 0x0093, %r30
	.word 0xb2352151  ! 823: ORN_I	orn 	%r20, 0x0151, %r25
	.word 0xbc0da0e3  ! 829: AND_I	and 	%r22, 0x00e3, %r30
	.word 0xb2354000  ! 832: ORN_R	orn 	%r21, %r0, %r25
	.word 0xb5a00520  ! 836: FSQRTs	fsqrt	
	.word 0xb7a44940  ! 838: FMULd	fmuld	%f48, %f0, %f58
	.word 0xb551c000  ! 840: RDPR_TL	<illegal instruction>
	.word 0xb9a449c0  ! 841: FDIVd	fdivd	%f48, %f0, %f28
	.word 0xb1aa8820  ! 842: FMOVG	fmovs	%fcc1, %f0, %f24
	.word 0xbfa00540  ! 843: FSQRTd	fsqrt	
	.word 0xbba449a0  ! 845: FDIVs	fdivs	%f17, %f0, %f29
	.word 0xb5a54920  ! 849: FMULs	fmuls	%f21, %f0, %f26
	.word 0xb494a1c9  ! 850: ORcc_I	orcc 	%r18, 0x01c9, %r26
	.word 0xbdaac820  ! 854: FMOVGE	fmovs	%fcc1, %f0, %f30
	.word 0xbe1d8000  ! 857: XOR_R	xor 	%r22, %r0, %r31
	.word 0xb3a9c820  ! 860: FMOVVS	fmovs	%fcc1, %f0, %f25
	.word 0xb7a5c960  ! 863: FMULq	dis not found

	.word 0xb9a84820  ! 864: FMOVE	fmovs	%fcc1, %f0, %f28
	.word 0xb5a54820  ! 868: FADDs	fadds	%f21, %f0, %f26
	.word 0x8195a02f  ! 869: WRPR_TPC_I	wrpr	%r22, 0x002f, %tpc
	.word 0xbbaa4820  ! 872: FMOVNE	fmovs	%fcc1, %f0, %f29
	.word 0xb5504000  ! 874: RDPR_TNPC	<illegal instruction>
	.word 0xbfa81420  ! 877: FMOVRNZ	dis not found

	.word 0xb751c000  ! 878: RDPR_TL	<illegal instruction>
	.word 0xb1510000  ! 880: RDPR_TICK	<illegal instruction>
	mov	0, %r12
	.word 0x8f930000  ! 883: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xb3aa8820  ! 884: FMOVG	fmovs	%fcc1, %f0, %f25
	.word 0xb5a81820  ! 885: FMOVRGZ	fmovs	%fcc3, %f0, %f26
	.word 0xb5a44860  ! 890: FADDq	dis not found

	.word 0xb1a5c940  ! 893: FMULd	fmuld	%f54, %f0, %f24
	.word 0xb3540000  ! 897: RDPR_GL	<illegal instruction>
	.word 0xbba81c20  ! 898: FMOVRGEZ	dis not found

	.word 0xbba8c820  ! 900: FMOVL	fmovs	%fcc1, %f0, %f29
	.word 0xb7a88820  ! 902: FMOVLE	fmovs	%fcc1, %f0, %f27
hwintr_1_47:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_47), 16, 16)) -> intp(1, 0, 1)
	.word 0x8195e093  ! 908: WRPR_TPC_I	wrpr	%r23, 0x0093, %tpc
	.word 0x81956022  ! 917: WRPR_TPC_I	wrpr	%r21, 0x0022, %tpc
	.word 0xbfab0820  ! 918: FMOVGU	fmovs	%fcc1, %f0, %f31
	.word 0xb3a449a0  ! 919: FDIVs	fdivs	%f17, %f0, %f25
	setx	0x969b5cd60000cd55, %g1, %r10
	.word 0x819a8000  ! 920: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xbfa509e0  ! 925: FDIVq	dis not found

hwintr_1_48:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_48), 16, 16)) -> intp(1, 0, 0)
	.word 0xb7a90820  ! 928: FMOVLEU	fmovs	%fcc1, %f0, %f27
	.word 0xb5a44820  ! 930: FADDs	fadds	%f17, %f0, %f26
	setx	data_start_2, %g1, %r21
	.word 0xb9a4c8e0  ! 932: FSUBq	dis not found

	.word 0xbfa00540  ! 934: FSQRTd	fsqrt	
	.word 0xba34c000  ! 936: ORN_R	orn 	%r19, %r0, %r29
	.word 0xb5a80820  ! 938: FMOVN	fmovs	%fcc1, %f0, %f26
	.word 0xbd510000  ! 939: RDPR_TICK	<illegal instruction>
hwintr_1_49:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_49), 16, 16)) -> intp(1, 0, 21)
	.word 0xb9a81420  ! 947: FMOVRNZ	dis not found

	.word 0xb1504000  ! 950: RDPR_TNPC	<illegal instruction>
hwintr_1_50:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_50), 16, 16)) -> intp(1, 0, 10)
	.word 0xbba48960  ! 953: FMULq	dis not found

	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
hwintr_1_51:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_51), 16, 16)) -> intp(1, 0, 30)
	.word 0xbba549a0  ! 959: FDIVs	fdivs	%f21, %f0, %f29
	.word 0xb5a5c8a0  ! 961: FSUBs	fsubs	%f23, %f0, %f26
	.word 0xb7a00020  ! 964: FMOVs	fmovs	%f0, %f27
	.word 0xb1a81c20  ! 967: FMOVRGEZ	dis not found

	.word 0xb3a4c8a0  ! 972: FSUBs	fsubs	%f19, %f0, %f25
	.word 0xb3ab4820  ! 975: FMOVCC	fmovs	%fcc1, %f0, %f25
	setx	data_start_2, %g1, %r20
	.word 0xbfa00540  ! 980: FSQRTd	fsqrt	
	.word 0xbfa4c860  ! 981: FADDq	dis not found

	.word 0x879460d5  ! 983: WRPR_TT_I	wrpr	%r17, 0x00d5, %tt
	.word 0xbbaac820  ! 987: FMOVGE	fmovs	%fcc1, %f0, %f29
	.word 0xb1a00540  ! 989: FSQRTd	fsqrt	
	.word 0xb7a409a0  ! 990: FDIVs	fdivs	%f16, %f0, %f27
	.word 0xb7a94820  ! 994: FMOVCS	fmovs	%fcc1, %f0, %f27
	setx	0xfb7c48360000f811, %g1, %r10
	.word 0x839a8000  ! 996: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb7a58860  ! 998: FADDq	dis not found


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

	.xword	0x1bb0d6383b98989e
	.xword	0x6a8f86d6354a3b38
	.xword	0xa7978845ec12bcfd
	.xword	0x569c8a75f7eaf8c4
	.xword	0xf51a84c7c57de38b
	.xword	0xb7180b084014abd0
	.xword	0x0b0d379d71451d20
	.xword	0x9ead6d7047e3aed3
	.xword	0x0bfc715f22f9c1db
	.xword	0x95c484e7d4c9a440
	.xword	0xef2aa07902983ac3
	.xword	0x0c26e261059133f5
	.xword	0x803fc312a86f6563
	.xword	0xcd1c6101b0185dcd
	.xword	0xc3f054b68c1ef3e5
	.xword	0x16602f263c3bda9f
	.xword	0x5659508b3935170c
	.xword	0xf3c37b92bfa583c3
	.xword	0xf143a65cceef9474
	.xword	0xfde2b5b71701d934
	.xword	0x5b03f35b81e60c3a
	.xword	0xca3fc349bb9fe0fc
	.xword	0x884a4ec5fa730666
	.xword	0xcdb9801c089e06bf
	.xword	0x5da47ca9a56f1818
	.xword	0x34aa3f5f6f184beb
	.xword	0x936b887463c06e62
	.xword	0x0e294901b41fc448
	.xword	0xe3571499083d64b8
	.xword	0x411cd761bdfe1cae
	.xword	0x6d56927881a9e951
	.xword	0xdae4efc510b570cc
	.xword	0xc7760c9cf2ed9e90
	.xword	0x1137e1a688eeb1a5
	.xword	0x864e701516c0d7f0
	.xword	0xafd9fc1610036a8e
	.xword	0x4c964862a4dc9862
	.xword	0x07ac46338c4f84cc
	.xword	0x6db31528847664ff
	.xword	0x6a591da40ccaa64e
	.xword	0xa424772cf6aa665a
	.xword	0xd032dae89e1ff97b
	.xword	0xb5315ad1811d825e
	.xword	0x4d1a2bf6cabfbb7b
	.xword	0xb6d1d974420b3f80
	.xword	0xd246338a398f42e8
	.xword	0xd9fb1e547f94eaba
	.xword	0x095f26cf821f17ff
	.xword	0x1ae7878f25cd8176
	.xword	0xc5f5a8fe834ccf97
	.xword	0xf95fc32f599e6dc2
	.xword	0xc38795ff4f8d71b8
	.xword	0x81329a748293ef0c
	.xword	0xa60df4da7c23aa71
	.xword	0xa590e375db2d06bb
	.xword	0xc2476e3a351deb08
	.xword	0x72dd50eea228732e
	.xword	0xcbcf365f0d20aa17
	.xword	0xd2a1df27dd180619
	.xword	0xc1797a743a02d04f
	.xword	0x0914e74b7858cd6e
	.xword	0x11e628bdd3bc2d6b
	.xword	0xd269426ea79434be
	.xword	0x1f55e5bd58cef8a7
	.xword	0x8e144f3c58065cf0
	.xword	0xb38df6335e9a78d1
	.xword	0xe780d72f9e4dc304
	.xword	0x835f451cec883830
	.xword	0x8ca853c9bb1ac37a
	.xword	0x67486f125e07e43f
	.xword	0x7b9c620e45372052
	.xword	0x854b81e2d330e855
	.xword	0x67852dd13177b6a9
	.xword	0x05bb162323c57042
	.xword	0xdaa41e895b7ba794
	.xword	0x0e7d763b5d8f3e9d
	.xword	0x2fbfae927090f18d
	.xword	0x25dea9d704695c1d
	.xword	0x69a2cf776467ecd8
	.xword	0x6d4ba4df0388dadf
	.xword	0x234794821bff647b
	.xword	0x5ab8068d94aacc85
	.xword	0x1aee6b226fb361f0
	.xword	0x8afecffdb23144b3
	.xword	0x5a520887cec124ee
	.xword	0xf63219b4bf77a61e
	.xword	0x59d0ced65bc7cf88
	.xword	0x3c521ce654998afa
	.xword	0xa2a2cf2f8e43a77d
	.xword	0x92cac9deccb32c6a
	.xword	0x268d97d4956fda8e
	.xword	0xd1165d350ac080c0
	.xword	0x5825d8f2d34f5e98
	.xword	0x15a891ed5a42139d
	.xword	0xce0f641e3812ea91
	.xword	0xfed5554bdbbd36ad
	.xword	0x457ad991cb955b54
	.xword	0x11ee0f15d544e33f
	.xword	0x6357af0ac5e2541e
	.xword	0xffd8135ba54c132e
	.xword	0x9d84b041973fb689
	.xword	0x6e26d0c4802323f3
	.xword	0x3c4a00073d31712e
	.xword	0x50c30efe1ab847b3
	.xword	0x6f5134647d30b7c7
	.xword	0xe1893ad465737994
	.xword	0x97807620bd20c040
	.xword	0x75dc719380b838f6
	.xword	0xad9e6a3c070ebef9
	.xword	0xdf0418863af96641
	.xword	0x99ed478eb3ddb670
	.xword	0x9a4fffb4bdc06cc2
	.xword	0x410f19b48aea18b1
	.xword	0x72227835db02eb02
	.xword	0x44fd627ef1141efe
	.xword	0x414e74cfdbe557a7
	.xword	0x60ac678e5743908f
	.xword	0xc2bdb36f13dec391
	.xword	0xc80c316ccb9ed115
	.xword	0xd5e3fe55c542115a
	.xword	0x181edc5c7a49807e
	.xword	0xbe2edc976f6aeea9
	.xword	0xf01e85c4818229f4
	.xword	0xa14ef3ea9a4996c0
	.xword	0x9a3d43b4ec830b7c
	.xword	0x137a51ab2ba23294
	.xword	0x77ba542a9ef3a21a
	.xword	0x732f97e84d5f5c9f
	.xword	0xfff841fc37393ed2
	.xword	0x102e7fabc9cc8593
	.xword	0x0255a61fc7df4e2d
	.xword	0x05d89c941977bbc2
	.xword	0x2bef1973e76a555e
	.xword	0x7e0abc8d89790105
	.xword	0x306e99b8316bee19
	.xword	0xb7c7aa6e14ad5438
	.xword	0xbde92d175876f00e
	.xword	0x4d34348740d23d3e
	.xword	0x090076da1bdda03b
	.xword	0x91cc588452c3efc7
	.xword	0x5d1cce18dc53746c
	.xword	0x0f2d7e3e4efa712c
	.xword	0xb540a84f33e58a8f
	.xword	0x30d62144efd2c217
	.xword	0xd7dcd71c19c6cb66
	.xword	0x8a03e5bd41288893
	.xword	0x3882027bbfb5185b
	.xword	0xeb4cde3bdc70f243
	.xword	0xca51ebd7066dda77
	.xword	0xcdea78b151fb9fd7
	.xword	0x859e2bac6c30cb1d
	.xword	0xe5a945ebd767d459
	.xword	0x411f62298a3fa57b
	.xword	0xa6e467543404615b
	.xword	0x80863e209df1d7ec
	.xword	0xff1cde4d2578695e
	.xword	0x66be0dfed4d837bb
	.xword	0x840e0ec2c6c7f85f
	.xword	0x8144b1764536fa6a
	.xword	0x055ec13f69583a9a
	.xword	0x0512723a8964efb5
	.xword	0xd239d40f692c9f87
	.xword	0x6d3e40c220c2863a
	.xword	0x0e14a382b7dde653
	.xword	0xe391742ebc5b56c9
	.xword	0xcd2e07b19abd797b
	.xword	0x0d2aa1a8c15c474f
	.xword	0x62f97c43c0788402
	.xword	0x17dddceaa11253d7
	.xword	0x620728135a541654
	.xword	0xb17a968000578544
	.xword	0x9e27a8a99dd4d04e
	.xword	0xf7f27a40a0b838b1
	.xword	0x7f701c2b675bd00b
	.xword	0x0ecc47f81a24de3f
	.xword	0x8bb0551c11388243
	.xword	0x8a6888117dd0f20e
	.xword	0x44d69b66a3758033
	.xword	0x8f481a949a1d90a1
	.xword	0x6a5c2af61187f398
	.xword	0x3a76a3460c231f8b
	.xword	0x62b010668b4b98ae
	.xword	0xa54da9834be6b99c
	.xword	0xdf9c45bc3ae8730a
	.xword	0x130530a87615ccc0
	.xword	0xb0b11f720fd46a75
	.xword	0x6d6d7b3d9414c5f8
	.xword	0xe9268d1116d6d432
	.xword	0x9a53a123c7e97687
	.xword	0xe6e7026e33b2ac06
	.xword	0xdca9e88b8c7186df
	.xword	0x4fc1b4df2c148077
	.xword	0xba967ee9eb4364d0
	.xword	0xd21bc926e8a478e5
	.xword	0x23d775f0513ff059
	.xword	0xeafa465626db17d9
	.xword	0xc656decdb02b9352
	.xword	0x02cde0decf125630
	.xword	0xd9d60c2b6851cf6d
	.xword	0xcda429cb1b456275
	.xword	0x301a164d950af7c4
	.xword	0x1a12e63e2c6c990f
	.xword	0x530ef089e5a55330
	.xword	0x65e6e88fa9ab6f87
	.xword	0xa4cb1eaf860bb52e
	.xword	0x6f72191c028a5c7b
	.xword	0xa6da4ae2b3d29366
	.xword	0xf8e4754482047d37
	.xword	0x8effb6bc69a91b1e
	.xword	0xb920b656efd8dfeb
	.xword	0xb7ced14686913829
	.xword	0x28f1a1ebc7588b1f
	.xword	0xcef059e934311a3d
	.xword	0xfe7a046557835249
	.xword	0x40aa3b0a69317f4d
	.xword	0xe8f0c11881c3cbb7
	.xword	0xc6f6ddb6b5b9d40f
	.xword	0x0a0ef3af3f0645cf
	.xword	0x877dc508b7efad38
	.xword	0xa64f1c940e9acdda
	.xword	0x10173e0e77d829c1
	.xword	0x1dfbbe683e4a290b
	.xword	0x6e9865d5ecb1ad5c
	.xword	0xf93ba7fa34dfbfab
	.xword	0xeb03ee902a79e54f
	.xword	0x7a93eda5ab48abaf
	.xword	0xd4a3038eb8dbac32
	.xword	0xb6f5b13852686a95
	.xword	0x548c835d9a712038
	.xword	0xf6dee5b860745759
	.xword	0x558ea89aafa17542
	.xword	0x2e2ebc1709d4a0ad
	.xword	0x3306a9c5d6710507
	.xword	0x3ece9b35326990fa
	.xword	0x560440f37ad4fc9e
	.xword	0xea2ed31b74055f4c
	.xword	0x5b734219b11e72c9
	.xword	0x2fbd621eef8137b1
	.xword	0x38d64200c2a5d0c7
	.xword	0x9515660796ea9145
	.xword	0xc8cfcf1fae88df74
	.xword	0x0af5dc8f3c43162a
	.xword	0x573631116599a29f
	.xword	0x38254f20ac32f8c4
	.xword	0xc8bd4ab11f8a808c
	.xword	0x906ba71eb18a596c
	.xword	0x2b60133e1f5d121c
	.xword	0x9a318ffa981cb1d0
	.xword	0x48ef1d91cf7e8ddd
	.xword	0xd09f3234bb020797
	.xword	0xdb2c65265d4025a1
	.xword	0xf22bf7833a7d80c1
	.xword	0x1e507e4fbd34cc13
	.xword	0xafd634965183ef8b
	.xword	0xcfce2e4190ec3f73
	.xword	0x1f46ed5dfde444f8
	.align 0x2000
	.data
data_start_1:

	.xword	0x422ba74804d1db5e
	.xword	0x1707476b0e1f728c
	.xword	0xf38bf955a2a27108
	.xword	0x65a95f271f2b9f94
	.xword	0x8d24d7e1e95ec5db
	.xword	0xe47d0676708a1d11
	.xword	0xe0145dedfe2fea58
	.xword	0x1ec2270449bceb63
	.xword	0xb89fab4963fe29ab
	.xword	0xd51650cafa6dce83
	.xword	0x8ef703419269ad5e
	.xword	0x63b345f7ed27ca50
	.xword	0x2991f97a5f90edc1
	.xword	0x50d6db4bcd938bef
	.xword	0xba7c6938acbdeaca
	.xword	0xd5267f1027abf692
	.xword	0x8a8682af1919b787
	.xword	0xeaef70fece0f4202
	.xword	0xcef5f3e3664ed2e3
	.xword	0xdaa5a376f2f96ec2
	.xword	0xb7358a5cdbff8f27
	.xword	0x9044e81c03f01449
	.xword	0xd408f05e6661380c
	.xword	0x263448874b3e668f
	.xword	0x8e416c99982ac953
	.xword	0xdb350917f36a04a6
	.xword	0xc4931b434c462054
	.xword	0x3c235f7a84af0300
	.xword	0xf2c65b8fc4c8dfec
	.xword	0x07ff875bf1fa3cc6
	.xword	0x945a0ba220568a65
	.xword	0xe560eaae292d5218
	.xword	0x2adde1266448aded
	.xword	0xa706a2e334117939
	.xword	0xad8198add8994f1c
	.xword	0x70efa29300cbe377
	.xword	0x1d0fedf2a5d10e49
	.xword	0x93820fc673843301
	.xword	0x58d1bdc253bdda21
	.xword	0x9770c44ac33e0757
	.xword	0x82db668da0215e17
	.xword	0x10d07d1a5d9bfcc8
	.xword	0x710913eb370353b2
	.xword	0x76f66cff59434072
	.xword	0xb2fbfc0ff9ee2070
	.xword	0x3410a345d0b68165
	.xword	0x8bd90964eb0e6392
	.xword	0x0d1df7f6a637023c
	.xword	0x80523eb927f3a485
	.xword	0xdd8531cd21270aa2
	.xword	0x001b31be00270175
	.xword	0xb794ec67be8070a8
	.xword	0xd4cc04d665aa5567
	.xword	0x28af14d2560652ab
	.xword	0x556f171dd0a04e9f
	.xword	0xaf58fc05855b43b5
	.xword	0xdde43c24210b317c
	.xword	0x75c46136b2949b88
	.xword	0x7b88e0504dcc6a44
	.xword	0x76f81681e539dbdc
	.xword	0x324ec85f346e4b2c
	.xword	0xe06f0fcb11174c99
	.xword	0x0b49ec3631698ac6
	.xword	0x6a3429681f789490
	.xword	0x9a91ff35a0dd4657
	.xword	0x280a4c9f48984c02
	.xword	0x7ad28bea7e2aa3ac
	.xword	0xa7d1910f3a4a6e9b
	.xword	0x51a01907aa3e650c
	.xword	0xd32317ac226e7065
	.xword	0x7450927e5c00ffae
	.xword	0x5614ace5ee2d5aeb
	.xword	0x78dc3182b208f939
	.xword	0x7a159ae0990cc252
	.xword	0xa1419b7c6ae4d680
	.xword	0x21b7d4cb15fa7077
	.xword	0x1e28f5c1b52ebccd
	.xword	0x11db560452da3023
	.xword	0x8bd2bde625e482fa
	.xword	0x5ca4bcff7190d105
	.xword	0x92a2f5acc2c13722
	.xword	0xfda7b87145789802
	.xword	0xfec7f69ff6311c1c
	.xword	0x737efc5dd1f10bf2
	.xword	0x861e27c9761f04df
	.xword	0x33313faacca4abe6
	.xword	0x74dd0d4401aab2ff
	.xword	0x3f7fbdb4173f9d27
	.xword	0xd83303f71c04b4e3
	.xword	0x9c1c5114af500c36
	.xword	0x6d8466781ee40c73
	.xword	0x32daa780bb033b94
	.xword	0x36f26cb8cb50fb02
	.xword	0x88a43c21c3634ff0
	.xword	0x07fd8e02cc1d8403
	.xword	0xcff7d39859046ef6
	.xword	0x1bf9b3679f2f9ca0
	.xword	0x33e690478a9052ee
	.xword	0x2d57b2a5a7d901a7
	.xword	0x54683df3b21cf8be
	.xword	0xeeb4c40eea71bcd7
	.xword	0x89889bb589b770d5
	.xword	0x5a779dca5a5db78c
	.xword	0x3532332f65130e2b
	.xword	0x74b053c6d446a619
	.xword	0x4b2123b37f8da4a3
	.xword	0x10dfc8687f44dbd3
	.xword	0x50b56c8a265b2328
	.xword	0x9ab67d91cc25eafe
	.xword	0x3ae53add2cd88a47
	.xword	0xc15e6250d6e9ba9e
	.xword	0x73a77a1bd60b5a70
	.xword	0xb88b42082640382b
	.xword	0x5e0bd31142fb29cf
	.xword	0xec0b1541c99d1985
	.xword	0xdf9b21ed2659f41d
	.xword	0xfaa20168029c0864
	.xword	0xa2bb0b021232e388
	.xword	0x07449bb31395aac3
	.xword	0xa682b9923df778c5
	.xword	0x3572f3766519e593
	.xword	0xee99b338fa20f6c3
	.xword	0x4f00285dd664bbe2
	.xword	0xc75a59ba8882636b
	.xword	0xb37385baae94ed18
	.xword	0x4df7f754795872c5
	.xword	0x93d1c1ecf93bbafe
	.xword	0xbc3582bef15416b4
	.xword	0x747f48f6f8d6485b
	.xword	0x1691bec23dd6cc8d
	.xword	0x93941432fbb99415
	.xword	0xc5949435090db283
	.xword	0xf8ba95bc994cee5e
	.xword	0x25079d3eb59aa56a
	.xword	0x6d9300c4ff60dbb5
	.xword	0xa2ecd5777ef90d2e
	.xword	0xcde730a5d86ed085
	.xword	0xa3f2b9f34d607a96
	.xword	0xca7ae7d949d4fbdb
	.xword	0x5979316eab286ffc
	.xword	0xc85bfdc3437d66e6
	.xword	0xd5694834278c2c67
	.xword	0x575d4ca198c2e950
	.xword	0x7b7f0a9d39e730c5
	.xword	0x11c6c52b1d5bb1bf
	.xword	0x7fbe2b47ef732b39
	.xword	0xe5fb4e124d948709
	.xword	0xa2bfc2e867ae3a05
	.xword	0xae1f4adc33f8e901
	.xword	0x6e70db7138f6372e
	.xword	0x41ce22e193ef5bd3
	.xword	0xc300f748e862a541
	.xword	0x33d520dfca1867d9
	.xword	0x27e6d3334211d2df
	.xword	0x7590d26dbe1a92bf
	.xword	0x20e89d8206eca972
	.xword	0x2d4225b5f078531a
	.xword	0x1c0d2d931d90c781
	.xword	0x64a329fae37e03fd
	.xword	0x659fd813925b4fb8
	.xword	0xfd6c1f2fdbeb2076
	.xword	0xcfe030460bc1fc72
	.xword	0x2c59553b2328dd69
	.xword	0xeff41dfe8d86d69c
	.xword	0x709e0de6c866fbb8
	.xword	0x4eb3dd8510bc0659
	.xword	0xc4b32d5c1b5695bb
	.xword	0x922726c4e823b3c3
	.xword	0xa51e22cfd54bba12
	.xword	0xf021acb762fbf552
	.xword	0x4d02c050225e9eba
	.xword	0xa72083911ae5626a
	.xword	0x9500f3c2f99d2b1e
	.xword	0x80399443a6749c04
	.xword	0x708d182671a43055
	.xword	0x7d98bfbfd7b72a9f
	.xword	0x12456d88b3688cd2
	.xword	0x70b4081abd6229f1
	.xword	0xc6478e7b91e26bfe
	.xword	0x1f0a4591139a51d8
	.xword	0xdaa8d45e14beb3ea
	.xword	0xc2344d10e6674e61
	.xword	0x40d61e11bdba2b75
	.xword	0xfea97302546b109a
	.xword	0x4c4bc75806bffb24
	.xword	0xe34d5e2a1f9d5855
	.xword	0x531c9bb9d548c8a2
	.xword	0xf6604de41355aa57
	.xword	0x85d8e670965ac582
	.xword	0x58bc08efa1062788
	.xword	0xe1d922f023fc19bd
	.xword	0xbc1097bdf392acfb
	.xword	0x9b05117e97fb151e
	.xword	0x86add81c959c687b
	.xword	0x24c9f05ba5d499c3
	.xword	0xc640a5ef40d3656e
	.xword	0x7798507802273ed5
	.xword	0x58ac183fce29a710
	.xword	0x467f637177f2e653
	.xword	0x11d9d25f567ebf8c
	.xword	0x3b666b05d813e97a
	.xword	0xecc5325052bde8e0
	.xword	0xaaf0193e69350120
	.xword	0x6ac594601b778695
	.xword	0x859c88549352e30f
	.xword	0x88436c2cda51a90a
	.xword	0x75a69485dbc101c4
	.xword	0x58eb6ec7ab9bc62b
	.xword	0x71d414cb886cf4bd
	.xword	0x4456e2b615e1d147
	.xword	0x5f6cd893e1da866a
	.xword	0x3df2b7a192028c79
	.xword	0xf436565e2d2ffa14
	.xword	0xd456b6159233356a
	.xword	0x120bbd7e82329ffb
	.xword	0xc71c126bffab47cd
	.xword	0xf45ca7a74ad8206d
	.xword	0xc16418084ad67d76
	.xword	0x8c961c4b98483430
	.xword	0xd855448d5dc66dbd
	.xword	0x98ad8c96bc4763ce
	.xword	0xb3f38d46befe4b4e
	.xword	0xd4671a722c473c48
	.xword	0x582c61ae864123a8
	.xword	0xf8227a19ba948b62
	.xword	0x38498b0a72ab4461
	.xword	0x1386e7bea267cf4d
	.xword	0x149cb9889c0d72f9
	.xword	0xd6ce2fcd3faa4ac0
	.xword	0xe62faf1ca3b2f149
	.xword	0xe80d4e0399f00e98
	.xword	0xa378e6574c3b5d9a
	.xword	0xdd3cce1be53ba8bb
	.xword	0xf3230e2b710e10ad
	.xword	0x0c7d9f29fe810af2
	.xword	0x53364e90e42221d9
	.xword	0x21c1a2feea720cf9
	.xword	0xf4b560aa6cec2cc7
	.xword	0x2f74067296fce90a
	.xword	0xbe1e656acd45cfa4
	.xword	0x93d35fddc8d6bedb
	.xword	0x58ea4f00b82a01d4
	.xword	0xe2ab9e0d644d110a
	.xword	0x162ba21e3dfd24ff
	.xword	0x7754eec9249753e1
	.xword	0x4cbd5e338b27ca22
	.xword	0xef5142a243056964
	.xword	0xa890ac703f89a7ff
	.xword	0x26b345c9601398c0
	.xword	0x1e433964c224ca4b
	.xword	0x8cc7688fb4f6e5b6
	.xword	0x1201cd75a0938b2a
	.xword	0xdffd09f653d86e2d
	.xword	0x0cdfcdbbff2b8d13
	.xword	0xb566889493e2ef91
	.xword	0xd4e5e6d9e32c9b88
	.align 0x4000
	.data
data_start_2:

	.xword	0x49928af7408581d1
	.xword	0x2010dd069c45588c
	.xword	0xced3a1acd168e055
	.xword	0x387a49e4ecfdd6df
	.xword	0x969136b1f36ee647
	.xword	0x244e559c30f03c16
	.xword	0xbbe78be4961c9a24
	.xword	0x37c44e1c3ecd58ce
	.xword	0xdcd33e2a87b65b9e
	.xword	0xfcbbb03469e6af39
	.xword	0xd5f15f8fa89dd552
	.xword	0xf0e445181d7a47fa
	.xword	0x46cfd7a8326e670a
	.xword	0x284ee5e2eeb68ff8
	.xword	0xd450aa8fbae28098
	.xword	0xc186deba8b7db498
	.xword	0xecc751afb1de90c4
	.xword	0x02ad6ccd9a78aa43
	.xword	0xc664c846c05c74ac
	.xword	0x7f6c5617f0c8dfe5
	.xword	0xdda0fc418a3b2cba
	.xword	0x8becc2f50d27c262
	.xword	0x446c9f37c4598c26
	.xword	0xe9a93f05812ff5a1
	.xword	0xb1cf2b47f67c4980
	.xword	0xb7bb9b1de5980469
	.xword	0xde0c9681c16abcb6
	.xword	0xd96f54dbaa130242
	.xword	0x28adf28cac9db032
	.xword	0xb924fa16af96a01d
	.xword	0x9f8ff7d6b457a59f
	.xword	0x03a9b8bfb911d54c
	.xword	0x32ee9a5ba9f8fcc9
	.xword	0x6de32d3442276fe8
	.xword	0x9be1c622dcdfdb26
	.xword	0x29c06bad5131eb82
	.xword	0x531f71b790a4582a
	.xword	0x21c8ac3a7f588dc5
	.xword	0x9504b59aed9cc13b
	.xword	0xf92405de371e1bef
	.xword	0xd073baa2720f8b7c
	.xword	0x9a89476190781fbd
	.xword	0x68f4caa5dc456b04
	.xword	0x0b9f60ed566c4ef6
	.xword	0x4a25ac6b291d577b
	.xword	0x2c0601acbb3a58ef
	.xword	0x96c0064df12009a1
	.xword	0xa61f7f16ce5c8e1b
	.xword	0x76b0cca68eff2f93
	.xword	0x41f595b3cb397499
	.xword	0xc908bace985c7b29
	.xword	0xd206229aa5fbf315
	.xword	0x5e9ceef4af1e3cbe
	.xword	0x09384181bc16e141
	.xword	0x5d20d77b46b87cae
	.xword	0xaceaa1650d135846
	.xword	0x29abb675ab0bca0a
	.xword	0x7a16c01947ab4407
	.xword	0x672ce20113111ec7
	.xword	0x0d6cb044aa813559
	.xword	0x93870c860ad96f7a
	.xword	0x8f1af3debfaacb6e
	.xword	0x44d79ad55a387386
	.xword	0xcc1990b976273402
	.xword	0x3b0b0d2f23f82265
	.xword	0xcfe5864b2c9f6db2
	.xword	0x567b15b4b21e1789
	.xword	0xf5d008ba1c715563
	.xword	0x6bb1dfa37430b0f8
	.xword	0x7f812fdccc92fde6
	.xword	0xa3a287aad1ba7042
	.xword	0x4e129b170865894b
	.xword	0x8ec451f2f0add1f8
	.xword	0x865b9ef3b1cab17d
	.xword	0x45c14821b3a166be
	.xword	0x8864abe16435f88a
	.xword	0x06a638fb48cc5eef
	.xword	0xfce0fd6ea0d4adc6
	.xword	0x29a644ec5ddc5f6a
	.xword	0x320803ef8af733aa
	.xword	0x8069a04c00c48562
	.xword	0x6d446f20632c09c5
	.xword	0x9b891f658a71f302
	.xword	0x635a54a1d390db2f
	.xword	0x244fa54047dfddf7
	.xword	0x6558ba4cd4cd28b0
	.xword	0xf9605cbf6e17780c
	.xword	0xb384947e8030b620
	.xword	0xf6cb459fd878797a
	.xword	0x42578a691aed4f93
	.xword	0xc521009b6cb1c092
	.xword	0x759c4c3311e5d099
	.xword	0xea353757287487e5
	.xword	0x8f37a9574702959e
	.xword	0xc91b77818a921e40
	.xword	0x681fb5d8fd09b0c6
	.xword	0xf1cd05105ee71bf5
	.xword	0xa4199ca641049d59
	.xword	0x31a00085e9b0394d
	.xword	0x21c89852d82a4626
	.xword	0xa4c56b8f79d68b93
	.xword	0xe33e8733312412e4
	.xword	0x6ee3aa38e88449c1
	.xword	0x02b28e45af82fcec
	.xword	0x438e3a67dacce414
	.xword	0x8f6597041130650e
	.xword	0xb70ecb01214a7945
	.xword	0x1d5672a58b80e6c5
	.xword	0x39cd66b1597f7c69
	.xword	0xa86cb47d7914436a
	.xword	0x7ab49d6f285a74b2
	.xword	0x8a22370695c747e7
	.xword	0x0ade6af57213f14a
	.xword	0xb3d78f08914b36ee
	.xword	0xf5f2cfda7865fc35
	.xword	0x47548ae3a9024fb2
	.xword	0xae1255f07caf2785
	.xword	0xf90dd504b1a22c5a
	.xword	0xf8fe2d487f5dffa1
	.xword	0x2e1e28ecb28591c1
	.xword	0xfa2e9a430d5044b2
	.xword	0x222734f070afd6f3
	.xword	0xaa97f33a4da85b76
	.xword	0x99747219c49946ed
	.xword	0xa694bf55b7e8a45a
	.xword	0x1d111b31e6478f8e
	.xword	0xf11ac34b7abd2502
	.xword	0xd36f28f8173e7bba
	.xword	0x0d944e5c8a7ea55c
	.xword	0xa1a1a258aa39a310
	.xword	0x518c345d123f8a66
	.xword	0x1bc706b31d1355ca
	.xword	0x6554b02902526d05
	.xword	0x9285b7533f3bbdac
	.xword	0xa8a86770dcc871a7
	.xword	0x7db50351a43327b5
	.xword	0x2a3f1767842206f6
	.xword	0x0dfef7dc0a6afbf6
	.xword	0x963804851659a278
	.xword	0x2b38bab1db91cc62
	.xword	0xcb6106df549c2f77
	.xword	0xc9af908d187e3e54
	.xword	0xab1af6f61d486468
	.xword	0x2d9e2915d4af4cf2
	.xword	0xbc61d41eacf2029f
	.xword	0x1f856c271dd3aa5d
	.xword	0x5a7b2a7362a0a154
	.xword	0x2992f5e043896a82
	.xword	0x4592a88455ee4566
	.xword	0x483f36af5bafdd44
	.xword	0xbadcfde33750cd15
	.xword	0x6e7dc0ce935a8cbb
	.xword	0xdb096aefc0253d7b
	.xword	0x34a4bbbb40c61170
	.xword	0x45f6df152ae7f033
	.xword	0x445a21c75a01b6ff
	.xword	0x81e3070f315317a3
	.xword	0xc4914853b0bef028
	.xword	0xdef057994fb05945
	.xword	0x1dbfbc9cfd75aae2
	.xword	0x8bca448570e3147d
	.xword	0x75ed2fabc39313fc
	.xword	0xab9faed40fb968ac
	.xword	0x5df2095165bf52e9
	.xword	0xd12ca4d2dd782009
	.xword	0x505a9e8a89e47069
	.xword	0x27cf659dcd36e03a
	.xword	0xfcd303ef6fd9a682
	.xword	0xe4381f3172961024
	.xword	0xef105799666514ae
	.xword	0xc6b10abff2b6a9d8
	.xword	0x6e2e23fb3884ae6a
	.xword	0x965f1643aa784149
	.xword	0x152c416c5621d796
	.xword	0x8b4c2cabd25743a2
	.xword	0x78a45ae9b01fae72
	.xword	0xb10b5df5fe3cef89
	.xword	0x918f987fc7a31450
	.xword	0x6c44a3f8430799fe
	.xword	0x2a3a80e20a54775b
	.xword	0x237fb3aaf54f2344
	.xword	0xb9f6758476a0a55b
	.xword	0x196267c211190b5c
	.xword	0x6cdaf4786c62b957
	.xword	0x67f32a66677ec019
	.xword	0x33114aa963a41111
	.xword	0xa6fba918b4561a9b
	.xword	0xf6c347b54f692fd9
	.xword	0xff27840ca5dfa040
	.xword	0x0a6a2836c8785c11
	.xword	0x5f47fd07f5068218
	.xword	0x145bdbf50d4dae58
	.xword	0x96241d0b841bd6f8
	.xword	0x22d44a64c86176a7
	.xword	0x6de3a00473ab9c81
	.xword	0xe258fadd8b60a4ef
	.xword	0x83868e7cb39ccaea
	.xword	0x20ca4ecc4b47d3c8
	.xword	0xf8c14b704aaa2309
	.xword	0x2304a8707c55cc24
	.xword	0xf8a3e46d7dd2751b
	.xword	0x9d194c3c112643f0
	.xword	0x166da12de686fef6
	.xword	0xe08a22cf32e854e3
	.xword	0xdea7b265f42ded34
	.xword	0x2efa03258fdca131
	.xword	0x7764a7635fdc22d2
	.xword	0xcd265ee1d54410c4
	.xword	0x07c997c9a3a4aa9b
	.xword	0x799f1da6cf085f20
	.xword	0xe991f3ae49c40b35
	.xword	0x9f9bc8a31fb7210b
	.xword	0x842680aaa2e9f968
	.xword	0xec74e835e2c33c0c
	.xword	0x1eecb6966d20ba66
	.xword	0xd5faafb24b37aa3d
	.xword	0xb702a4d132e3195f
	.xword	0x146fc1b03322c69c
	.xword	0x45c69b6bac8074a1
	.xword	0x0178c715b6e36691
	.xword	0x7277d4228ef2067a
	.xword	0xf3989e14f81478b4
	.xword	0x35fb4ae081136b65
	.xword	0x8d1cc4de57f233e2
	.xword	0x76679b7ee144ff8b
	.xword	0xe732772d57b4f5e8
	.xword	0x4db6283eb7aa4626
	.xword	0x7c71e8eaa936d08e
	.xword	0xf91c8ee1fb06d5e2
	.xword	0xc5b5f946388a3c34
	.xword	0xe9388dba8ff089a6
	.xword	0xa80adc00b6dc979e
	.xword	0xc637da5036eabfa3
	.xword	0x18310ce958257eef
	.xword	0x8c17d30b88a18a38
	.xword	0x770274e45e1643eb
	.xword	0xb677fe22599e3fb9
	.xword	0x428f8739c9d19c24
	.xword	0x3284fb06c3d25acb
	.xword	0x6079d56a3ab37800
	.xword	0xc9ca5afe6e6a2cb8
	.xword	0x98fd78eca19d11ee
	.xword	0xca3855468944fd63
	.xword	0x23b9ad223e80446e
	.xword	0x6c3b91501e146cf3
	.xword	0x74f4319fa0f8ccf8
	.xword	0xeb0d4f7a3aa1f957
	.xword	0x76dfd4e91fe184f2
	.xword	0x93c4a0c073408054
	.xword	0x80fd2c51f21bf022
	.xword	0x4f5728f9424b45ae
	.xword	0x1474e698a71a9976
	.xword	0x6d12ba584efc2eda
	.xword	0xf97f6a43c271105e
	.xword	0xac18ad0ebf0316b0
	.xword	0x86102001184dc084
	.align 0x8000
	.data
data_start_3:

	.xword	0xd37deb2322dd56f0
	.xword	0x3ff4834630f12f63
	.xword	0xa71bbee36c426748
	.xword	0xaf535fc8d4dce04d
	.xword	0x1bd1255300a88e86
	.xword	0x972af9fc0b9c04f3
	.xword	0xd29244b26a4daad2
	.xword	0x8da6e7e24fee2312
	.xword	0x5c67390d8aeb0d94
	.xword	0xfdcd3ad76fb564f5
	.xword	0x1febdb3d8b75c1a8
	.xword	0xb0edd8873fc783e6
	.xword	0xddfa4b222f23431f
	.xword	0x944a8d090cbbe5d6
	.xword	0x71e2c5e29d119e1c
	.xword	0x2944457d0d274360
	.xword	0xc0ffeb9a5c7dfb9d
	.xword	0xc87bfb996e2d65f9
	.xword	0x3167514f8888450a
	.xword	0x10b090b5a342c823
	.xword	0x1c1a6c11a09267ba
	.xword	0x417d74ffdfc07589
	.xword	0xaaa1ad2f58d156b4
	.xword	0xffc25293eae56d23
	.xword	0x78b1b650647d5b08
	.xword	0xf2ead623b4c6e68b
	.xword	0xde73f483f1fbeda0
	.xword	0xed92a47255628bd9
	.xword	0xf58c503deabdebec
	.xword	0xe3616c1c3b8f92ee
	.xword	0xdb5a5c9f2b16c138
	.xword	0x80cfff6b05c34666
	.xword	0x09f42ccb2e92566c
	.xword	0x4b492a10a603cbc4
	.xword	0xf903c7cf093f2ab9
	.xword	0xdd6812591b323d37
	.xword	0x357b69a95bbdbce6
	.xword	0x8ff0ae6058c3b824
	.xword	0xc00339eb9f0ce76d
	.xword	0x02f3a215fdea64d0
	.xword	0xe70e697d638a7d67
	.xword	0x3ab8a191935a555e
	.xword	0x3e322c84701b2741
	.xword	0x700c9f1bceaec528
	.xword	0x2fcf21d15f62a3c8
	.xword	0x4b03d8bd2607224c
	.xword	0x2c0a3552a34eb475
	.xword	0x54635b6b366473f5
	.xword	0xe4c03b59e61e320a
	.xword	0xbece7d32cf10a9ae
	.xword	0x93e09228669a4371
	.xword	0x281b54d01eb890aa
	.xword	0x79f4410294d8aff7
	.xword	0x30e9d412948bf594
	.xword	0xb2691376fe47fe8e
	.xword	0x21800df5a6fc2338
	.xword	0xa5713ffba57f9cea
	.xword	0x35873c0bbd2be9da
	.xword	0xc56233b2c70f9247
	.xword	0x7ba9b35795cd23d5
	.xword	0x6e084a419302eca2
	.xword	0x3fe8455168c9c24f
	.xword	0x752b9868e2fb33e8
	.xword	0x23e26a263ec73364
	.xword	0x72242cea36c127e1
	.xword	0x3d1193c7d32ed571
	.xword	0xb884d5797ebd1ddd
	.xword	0x2666689bda648ad9
	.xword	0xb68c74b80a142229
	.xword	0x06d31c2b3914d9df
	.xword	0x0bfce1839c4fc787
	.xword	0x3da7dae5d24f08b6
	.xword	0x2da3cd701956c115
	.xword	0xea6f81b1e90054a6
	.xword	0x53df9f5bcc3bbf22
	.xword	0x4dc4e25c352acc4f
	.xword	0xd7cd64fa009a808f
	.xword	0xe5c3c3b1c28a7b74
	.xword	0x574fd5112ee09dc2
	.xword	0xc2d453e60939bf2b
	.xword	0x749754fef0b5753c
	.xword	0xdec85150fbbb218e
	.xword	0x916ef633ccdd23fa
	.xword	0x6265b8ce3a47597a
	.xword	0x601f11c9b607645c
	.xword	0x4b2dcaefbc953b3a
	.xword	0x2c6d36ced02e77c6
	.xword	0xf09058580ed8773d
	.xword	0xe8c2a3b3b36545a4
	.xword	0x6703ed2c7dab7510
	.xword	0xe7b6f4cd93325c61
	.xword	0xba5c165ab2a53fcb
	.xword	0x3d4c71397b506fd6
	.xword	0x54fb0cff92c8f8d0
	.xword	0xec22957bda14fb21
	.xword	0x3c6393eee2c3e6e3
	.xword	0x355c531e61ea6899
	.xword	0x445d56c1064fe60d
	.xword	0x8216ae549f501251
	.xword	0xeff33b19a6771a80
	.xword	0x08f7b14daff8a2f9
	.xword	0x6bb4b3906a86328a
	.xword	0xd6e94b198970573f
	.xword	0xd88ec6740dca7fcc
	.xword	0x141b4af8c8e3976b
	.xword	0x1ad0660ec6e77f6c
	.xword	0x246a068c2ef1fc18
	.xword	0xf33bca3655e55d86
	.xword	0x7b670fcbfc8c25e8
	.xword	0x34b4cd2d8c72f340
	.xword	0x03613d66b334cd44
	.xword	0xe9d0b34ea92577e7
	.xword	0x0bb7edf54af8e0a9
	.xword	0xe0220e1106cf9196
	.xword	0xe6cdea3a813be87b
	.xword	0xe8582366ad7405a6
	.xword	0x1dada7b7f42800ea
	.xword	0xb822cf9a55b7b2bc
	.xword	0x0ca4fdb1e91c67db
	.xword	0x6da31becf0334b91
	.xword	0xa7b4c9d2f430247d
	.xword	0x289ed293f2770ba2
	.xword	0x595900eeed122bc8
	.xword	0x23920cc8679771ac
	.xword	0xabf08c831a931dc0
	.xword	0x59d504a12c0d0a19
	.xword	0x24f1b26f9f053e94
	.xword	0x94237ebcdf3f004e
	.xword	0x30defd265eec908b
	.xword	0xa92623949fff9455
	.xword	0x7327199e865bd61d
	.xword	0xa080756bc1b3beeb
	.xword	0x3a82a2b362af0965
	.xword	0x10c719bed71be36a
	.xword	0x7df55d6b3138fff2
	.xword	0x548fe7d01343b4a7
	.xword	0x5f67a180c33732da
	.xword	0x652b36fccc4f25dc
	.xword	0x1a23cc84d4797c2a
	.xword	0x99fd2b1419fd88c7
	.xword	0x1a9d21dbdb654dc0
	.xword	0x54771f1bbdf65752
	.xword	0x1c497f829a8cdb70
	.xword	0x976c377f95c120d2
	.xword	0x40f2cea116912380
	.xword	0x29c2fd95c2e9399c
	.xword	0xb848b60077660903
	.xword	0x0995ed0aca5ef81c
	.xword	0x713ba304607aeb17
	.xword	0x17eddc89fc8f3d99
	.xword	0x6f9bc928b606b147
	.xword	0x07cbb50be27c8571
	.xword	0x5482b3f83f938d23
	.xword	0xa233a6d370b25786
	.xword	0x7aca3e991e2c2b8d
	.xword	0x944d87fe18abbfcb
	.xword	0xd262e48c35ee3748
	.xword	0x6c07a40e0fbd0315
	.xword	0xbd829516eb9d4b04
	.xword	0x4a57f44ddfa66f3d
	.xword	0xd6a55ebccda85e6b
	.xword	0x897466908f0b20e4
	.xword	0x83c76b93d851d6ae
	.xword	0xa8a6f023f4fcc59c
	.xword	0xfd4772ec0c810f4c
	.xword	0xfa2c5e39565c98aa
	.xword	0x85ca8d7e380c4c9d
	.xword	0xb77a877067dd6e84
	.xword	0xf4878002eedce043
	.xword	0x2b273cbd7ff46e6e
	.xword	0xcd767f16f9c46658
	.xword	0x1689539f875f2a5d
	.xword	0xb3fdb036d7fb1617
	.xword	0xef09b18be34de3a8
	.xword	0xbb114330859a3e19
	.xword	0x0ca3b73426a77751
	.xword	0x039a372f3ca54508
	.xword	0xaa40ebdd3c2fd982
	.xword	0x274c718aae30764b
	.xword	0x84d108257e97ebf0
	.xword	0x9a703fb8b7c6210c
	.xword	0x00febfd7fb723390
	.xword	0xb39553a57d8d4243
	.xword	0xaba44e4672b0581d
	.xword	0xc0cdf5c896ec85a1
	.xword	0x9ac9f2db5e699817
	.xword	0x9a93dc5f4296cb7c
	.xword	0x7c823ec6eaa7a6c6
	.xword	0xb9ee21f3617446cf
	.xword	0x30494ce0cc0c5efc
	.xword	0x8c442b83c1062825
	.xword	0xc3561f34eb583341
	.xword	0x897a9edbb9290069
	.xword	0x062a5126a7806dcd
	.xword	0x8f6e1a307d6868b3
	.xword	0xca4b82ea285443ed
	.xword	0x9518d487439d5c42
	.xword	0xfafbd48239f2b7fb
	.xword	0x2e5f09fc99592820
	.xword	0xd3a6d6b69c2493ba
	.xword	0xa2c36b7b114f3ce9
	.xword	0x82e160593614f774
	.xword	0xf6c99b2022ecf670
	.xword	0x09d51d47a5ee5520
	.xword	0x6a84219c693dac31
	.xword	0xba45fd56defabca7
	.xword	0x6e16ac9cf6dd15fd
	.xword	0xfd05c6bdf66eba0d
	.xword	0x8ca1b673bfc0c2a3
	.xword	0xa2227143c4198ca0
	.xword	0xaebb94d4227463c1
	.xword	0x2e82ce8b30a9a638
	.xword	0x399abd5cd23744d1
	.xword	0xe9e241db9d0b00d9
	.xword	0x68365a9ec9dea473
	.xword	0x347dffc9f4e8569e
	.xword	0x11e8f38a3a44aa0a
	.xword	0x49464340bed763e0
	.xword	0xbefd92f304aca1c3
	.xword	0xadfc5e64801f5a13
	.xword	0x697337ddd2dfa3d4
	.xword	0x91920ac1cb1e562d
	.xword	0x1cec62791e38cb6f
	.xword	0x8c4be6dacd584d6b
	.xword	0x37c5ca77c7c0504f
	.xword	0x4b2c9dfceb999ab8
	.xword	0xf0eb1c24e310f229
	.xword	0xb2630461b318306b
	.xword	0xd1c0b35837a872f3
	.xword	0x5cff0ec26a37ba9a
	.xword	0xf69766f063fbf691
	.xword	0x1c30ccb498221eec
	.xword	0x9a5b390872933d98
	.xword	0x199b01d147d0503b
	.xword	0xd9bb200ab59d12fd
	.xword	0x329bc4bc4a1acf67
	.xword	0xe0890f64c103ed22
	.xword	0x85a3f1be1249da35
	.xword	0xc133da92c8c2a283
	.xword	0x1b2bb83639e80762
	.xword	0xdd226e6f35dcc6b7
	.xword	0x3a611b19366eb151
	.xword	0xc9799a9e520c3732
	.xword	0xf9a0780ca87c6e93
	.xword	0x7f00f7d1e9b5034a
	.xword	0xba07e8683f196030
	.xword	0x95b3d9916220ad91
	.xword	0x84488af0d1100e05
	.xword	0xd8957d1c93176056
	.xword	0x1a5ee521cec336fb
	.xword	0x3f8dbc9338daf93e
	.xword	0x27f6c4cbf8cd43c6
	.xword	0x39ce1669fa3fec0b
	.xword	0xf9e88ab39fb5eea1
	.xword	0xe7300a6e5249f223
	.xword	0x4c54160f52c3bf78
	.align 0x10000
	.data
data_start_4:

	.xword	0xa3e4890a89ab17c5
	.xword	0xbd0d7a5a2b088bf9
	.xword	0x50abdb35da3ed82d
	.xword	0x94b973278786189e
	.xword	0x506d47447fabed6b
	.xword	0xf76fc2d29d9477bf
	.xword	0x7a70566f8fe0ce80
	.xword	0x94019b96b2d646ba
	.xword	0x23fe1df1c6e71e28
	.xword	0x7f3bca3ae053c897
	.xword	0xf14f8f35ae149df9
	.xword	0x05eaa6203c312f31
	.xword	0xc3190fd5de8eae32
	.xword	0x2f9d1af9d940318c
	.xword	0x9bbe2af175fff027
	.xword	0xfb51d4f35c98ccc3
	.xword	0x75f36a759c491780
	.xword	0x9437c9068fab07b6
	.xword	0x1dcffea4e8c336eb
	.xword	0xa8637e68bce918a9
	.xword	0x57940ca3ca69b701
	.xword	0x9afcbb105cff593a
	.xword	0x8b9e2871c26190fa
	.xword	0xcbd4e92728d1fd17
	.xword	0x30ce6c37a3c0af83
	.xword	0xc21e7fd20d8f20e4
	.xword	0xbeb27b49abcaae89
	.xword	0xf41dbe53ba106167
	.xword	0x7953408191308723
	.xword	0xd7265da5088bf6cc
	.xword	0x53b06baad6ab7f0f
	.xword	0xc37be142ef0c9724
	.xword	0xd6e7f0106101ebdc
	.xword	0xe2e3e7bb8a748d7a
	.xword	0x7c7af1913d38240a
	.xword	0x06be57b1d6918653
	.xword	0xdc4f2322aecf9991
	.xword	0xb68cbd8e673404b2
	.xword	0x1f24c1818c451931
	.xword	0xced1c2aa31861517
	.xword	0x74d6c0996cbf0a5c
	.xword	0x73de2cb26a9abe5a
	.xword	0xb260d4430997c7e3
	.xword	0x92b920a6021400e7
	.xword	0xb101e9e12820cf33
	.xword	0x67792be418ae2bfe
	.xword	0x04e8cd2ac7e3466e
	.xword	0xeffcbe1b1f4f0d1c
	.xword	0x0f797696049b562e
	.xword	0x827c8401578a6002
	.xword	0xc64c52d52dffc981
	.xword	0x43d2a83045413a87
	.xword	0x83dad1b5c78aac59
	.xword	0x78c8e41eebe18041
	.xword	0x09594dd744d104df
	.xword	0x181f1066cff0cc52
	.xword	0x2be6f52ad9dae0b6
	.xword	0xdc1380f0ecaa8dc9
	.xword	0x2ae21a138ad71b5b
	.xword	0xba2ba55473cd5dcf
	.xword	0x07977e890ef01023
	.xword	0x4942aacbaa25dbd2
	.xword	0xc7dae49387da4633
	.xword	0x5da8026cd637a89a
	.xword	0xc095d8cc4d9aad2e
	.xword	0x4690eca9da969b31
	.xword	0x4c1fac07411f9283
	.xword	0xc8769ba1736219b3
	.xword	0x1927a1f3dd67950a
	.xword	0x9326480e297cce81
	.xword	0x96958490e33516bb
	.xword	0x114ff826f90dcd82
	.xword	0xde5bc7dd57a64329
	.xword	0x961c81de9ba03848
	.xword	0xbaebc7a35b0c022e
	.xword	0x1ec00a2e37858560
	.xword	0xeb23ef638d2632ab
	.xword	0xcad92032f1bdc4f0
	.xword	0xef63fe5e7cad3ec1
	.xword	0x8b1450dcf491204f
	.xword	0xb7bc21fd817df874
	.xword	0x81ff04a798a9c3e2
	.xword	0xf1473ea734499ab9
	.xword	0xb057e7a6be42b71d
	.xword	0xbb8a4fe96e4bb482
	.xword	0xef4854122efdc7d2
	.xword	0xb25d7f06fe364a26
	.xword	0x4e082c1842b40c9a
	.xword	0xa0a8cbb5bf29d916
	.xword	0x3beb8f00b22db80a
	.xword	0x5950721ed83d88df
	.xword	0x14563933ebc3ebd3
	.xword	0x054972294a2e3e0c
	.xword	0x5f1081c54d337f81
	.xword	0xaecdde0d77cd03b7
	.xword	0xf67586854d307caa
	.xword	0xc72a0f32e5d857a4
	.xword	0x0b27ad413e0bb7ce
	.xword	0xe8c4bb410f4a9c17
	.xword	0x7f42b2bae1c40119
	.xword	0x13df7d80cd8f2eee
	.xword	0xa50d10b7e5eaba35
	.xword	0x194f5cb098d1870e
	.xword	0x9badec067dcb4dad
	.xword	0x8bd890756c2500c4
	.xword	0xdaf60c6aaba00ebc
	.xword	0xcc1420a8245c9965
	.xword	0x3a3363337e792c6d
	.xword	0x1a67fa8c3b630bd2
	.xword	0xa9047db390bceef7
	.xword	0xf6b5bb5ceb2c0478
	.xword	0xbdd3f1a19e7e5b77
	.xword	0x7e87eb4ff63ec063
	.xword	0xe619597bf1fbf6c1
	.xword	0x757adbb474dae0b4
	.xword	0x17d1b7e3531b3af3
	.xword	0x8914071042f1ba85
	.xword	0xf3ec5fcd310082ff
	.xword	0xf42bdff0b895920a
	.xword	0xc6358952c4dd6f76
	.xword	0x9350681d4ec39540
	.xword	0x8cb01c488c95f5c9
	.xword	0x1d619f5e9908cb5f
	.xword	0x25bda9adc4b5dca7
	.xword	0x00571bb6344236a8
	.xword	0xbb487792d20e92e8
	.xword	0x9b1d99a63be4bb92
	.xword	0x24a83ac3c5f832b8
	.xword	0xca6b0408f444926c
	.xword	0xc09de314100be995
	.xword	0x50ad4894d97ca3ea
	.xword	0x822d2a82e4505e24
	.xword	0xf60f7e8b8b8319e0
	.xword	0xd6d5427e40b0f0e3
	.xword	0xd1916f7b3c72a858
	.xword	0x32e041b2027d8a10
	.xword	0x53f36960c2d42d44
	.xword	0x0aa50077770f5ad0
	.xword	0xb0257192f982b33c
	.xword	0x8f81f138e7ece0e2
	.xword	0x6e310d6c1042c3cb
	.xword	0x28c58d948828a753
	.xword	0xd16b7929219869b2
	.xword	0x6946bfbb0ed26c82
	.xword	0xc819f6dce80900b2
	.xword	0x4643c1fb18008900
	.xword	0xd8422ccde3654a89
	.xword	0x44beae160022d363
	.xword	0x9de26c5b78bc44c5
	.xword	0x22ccdd5ac46ab81d
	.xword	0xb0119b95e624ec4a
	.xword	0x7e4b170b6107d870
	.xword	0xd387a12774bfc594
	.xword	0x799366656a83a8ee
	.xword	0xd4fe6bf0c164b45d
	.xword	0x36953073d4094af1
	.xword	0x9e98f1e9400f80db
	.xword	0x1a070e38dbd17f0b
	.xword	0xa20c6b508704511c
	.xword	0x554b585f478df98e
	.xword	0x2e68742600c3f709
	.xword	0xe08482b6d38371d1
	.xword	0x4af936ca04126c64
	.xword	0x542d064c47ed3da7
	.xword	0x27daffd922a83684
	.xword	0xd3248860a7254970
	.xword	0x229bcb996be171d4
	.xword	0x470e92822a91fe7e
	.xword	0xd8503bd2a6426b3a
	.xword	0x6f754f58e303e5f3
	.xword	0xcf148b55c298fb4a
	.xword	0x4ec24dca7625a2db
	.xword	0x407f59ec4a540582
	.xword	0x0930d9a7e5c34c5b
	.xword	0xc93d8728b904959c
	.xword	0xb672b9b680685df4
	.xword	0xa5a32ce0bd845699
	.xword	0xd6361ff5a3b4f0df
	.xword	0x2c7c51f72384d849
	.xword	0x422901020e558351
	.xword	0xb9981d2ff6bc1aef
	.xword	0xa978d3e60547d476
	.xword	0x2669f80a07a5b103
	.xword	0x1a9430c481f957f9
	.xword	0x53a47b5e9e5e8fd0
	.xword	0x41c37dfdc81acfab
	.xword	0xadc659a111ca60fe
	.xword	0x8bf7016edb8bf35d
	.xword	0xc0dd3ddc04863387
	.xword	0x99cc15bdb6814df0
	.xword	0xd4f69290d86e72ba
	.xword	0x754d5c70913630e1
	.xword	0x7d9a559262c7dcc6
	.xword	0xdcdc418e01a873ac
	.xword	0x7493a8d8b3addd11
	.xword	0xa446c20647111430
	.xword	0xd321b95a27427d65
	.xword	0x559ec62276efe73b
	.xword	0x5797d767443a892e
	.xword	0xfe08c69be7459304
	.xword	0x630d893605451473
	.xword	0x09655068fc2ab0fa
	.xword	0x083c27ce845292a1
	.xword	0x30c1b8c0c51ad19a
	.xword	0xb192c5b8646749a4
	.xword	0x9b61b4196145003d
	.xword	0x217bf313333d9296
	.xword	0x5f3fbb09476ac693
	.xword	0xcbdcc8712b74e509
	.xword	0x414ddb6e63a85bc8
	.xword	0x19ae76b012e5e160
	.xword	0x34ef6169ee25bcd2
	.xword	0x44a4495cd66fd2f6
	.xword	0xd1c186a2f20242ab
	.xword	0x0965685fa0e5d7c4
	.xword	0xfe34e1e18de2cc59
	.xword	0xd80ba77f8075b073
	.xword	0xa6a9c83743c588a4
	.xword	0x3d1ec78d07b9dd75
	.xword	0x95ede17c1e4fa1fe
	.xword	0xeb013243d3080c7a
	.xword	0x6516ee199f287739
	.xword	0x599c90e434ca632e
	.xword	0xd9ece2e40d933281
	.xword	0x86b4d11441d1ae0d
	.xword	0x8a4cea368e45cafb
	.xword	0x923273cd4cced9cd
	.xword	0x44440a0cba2df56a
	.xword	0x38950b61c5addac6
	.xword	0xcf6fe81ac987b69c
	.xword	0x10b590037499c6b2
	.xword	0x9fefbbfad74b969d
	.xword	0xa2156468c73e2cb0
	.xword	0xc4eecb740fbf904b
	.xword	0xc772af7dbf1fe491
	.xword	0xbe31df9f7d5140f5
	.xword	0x76a6dccc9a9fad3c
	.xword	0xcea78a66d131e57a
	.xword	0x6dce9cd3983657cb
	.xword	0x39d1b17339e8c95d
	.xword	0x03b53b1575898edb
	.xword	0x2a9387453a0ff463
	.xword	0x4d1f1c967a6d534d
	.xword	0xd298a74a70bfa0eb
	.xword	0x5f5c94e5b5a7714f
	.xword	0xd29ec8d6d29d4d53
	.xword	0x6df1e323cba669d4
	.xword	0xd667f7427f08caeb
	.xword	0xd575b4e26043d8c9
	.xword	0x5fc6885bbeeedf9a
	.xword	0x61102b25f3b6395c
	.xword	0xab8b5356f0c840dd
	.xword	0x697033cf237d4cbc
	.xword	0x851dc683a39ecc2e
	.xword	0xfa76fda4fd5844eb
	.xword	0xbe9e053e9eb72b7a
	.align 0x20000
	.data
data_start_5:

	.xword	0x97984d7c7ec50c56
	.xword	0x2439599354f3ec34
	.xword	0x16f8186f21f16d97
	.xword	0x70005a0fb6bc7cf2
	.xword	0x6bdbfd332f96d363
	.xword	0xb8bca09cf03393b0
	.xword	0x67dade76d863e4ea
	.xword	0xc02ec1ef729df41b
	.xword	0xd4c1249eda88454b
	.xword	0xdd7c3c4853044869
	.xword	0xb2ff44517bcfea28
	.xword	0xcfeddb871451a599
	.xword	0x0febd94a487d6f3b
	.xword	0xc678282e2d03a768
	.xword	0x8402a79479cf1bad
	.xword	0x18b95310166b1ccc
	.xword	0xfce93eef10899e71
	.xword	0x0e0b11c3fb3682c0
	.xword	0xd03b58a8d7ca6ccb
	.xword	0xae8310f189a4d17c
	.xword	0x9dc64885ec59e19d
	.xword	0xa1809ae44ae09f1a
	.xword	0x26e4214ecc6050ed
	.xword	0xd4af265eeabbec03
	.xword	0xb2b46e8165d8f550
	.xword	0x04f6d1cae5f0b78d
	.xword	0x0c524fd718d1c87c
	.xword	0xdf02b8283c8655fe
	.xword	0x5d7ecdbe4d8f86f8
	.xword	0xf5d79879aeb2699e
	.xword	0xe87c342f3b21d687
	.xword	0xba76c6eac24dd4bb
	.xword	0xdc468d59f743462e
	.xword	0x37c51bbedb6b0e2b
	.xword	0x58bc132187fd62ea
	.xword	0x503f395fdccc07b1
	.xword	0x5e1ec1454723b597
	.xword	0xa35403eed226e37f
	.xword	0x842a33ca393aabc7
	.xword	0x5a550f173f0ebec9
	.xword	0xda18b342f686f426
	.xword	0x07df8d8d4e7e5e56
	.xword	0xaeb0bb4c3189a865
	.xword	0x5951e198232c5cfc
	.xword	0x178ea06374c0f660
	.xword	0x7f8a8e25a16373d5
	.xword	0xc2d1bc3c52f164cb
	.xword	0x14b34fb3e5a5e328
	.xword	0x37a8b86ae20a2006
	.xword	0x99612863409f079f
	.xword	0x851d6d4791f04584
	.xword	0x0fa58e496d0046a1
	.xword	0xfb20b26f565f66e0
	.xword	0x3befc8c9bce9a86a
	.xword	0xb116618ece41784f
	.xword	0x34a0341ecb7f5ac6
	.xword	0x9350d8af8e0c6fd4
	.xword	0xd965188b985fe465
	.xword	0x8d234ddd08022624
	.xword	0x70f6dd0bb4c3497c
	.xword	0x4239d3f2fe3aadc7
	.xword	0x0a4d8b77e8cff5ab
	.xword	0x93509c46cec16be1
	.xword	0x9aa86f7267e4f4f0
	.xword	0x08f6691dc50714f5
	.xword	0x9438b570294f77c2
	.xword	0x0a92db8c43f3c741
	.xword	0xe9c9fc7d5982953c
	.xword	0x2c80ee6379c50087
	.xword	0x4d69e57efcbf99ab
	.xword	0x42ea77617f962d90
	.xword	0x11b8275e8128239e
	.xword	0x97c35dd858a033bf
	.xword	0x30bab47fd5b370ff
	.xword	0x4fd43e23c88f0dbb
	.xword	0xf492f003a710b2d7
	.xword	0x71e56128ad91547e
	.xword	0xe67906fa0d43c16c
	.xword	0xabf26b00b91def59
	.xword	0xa4ef6e4d2c7b7dbe
	.xword	0x2c5917291d93841a
	.xword	0xb47ef8d51ae3bbac
	.xword	0x9d7b60e1312d32a3
	.xword	0x23a435178bdaa00c
	.xword	0x831d14fd6f46b6e5
	.xword	0x2813819f3802a431
	.xword	0x7c6a028d1e02aac1
	.xword	0xb8d85bac3d725d01
	.xword	0x298a4848b7f8425f
	.xword	0x3e7b535b3e372158
	.xword	0x67a822b18273543a
	.xword	0xcca471081dbf74db
	.xword	0x8e0db68e24cef978
	.xword	0x369bdda787eba80b
	.xword	0xffb913db676cbfd4
	.xword	0xfbc38078a84fa0a1
	.xword	0x7ab2141217aea03c
	.xword	0x4a2c661671cface3
	.xword	0x769e2be465dfb75e
	.xword	0xff61b94068120044
	.xword	0x5e9558e8e839b256
	.xword	0x626c0ac2a52c9409
	.xword	0x2c7e3438fe1ba426
	.xword	0x977e5878546871c6
	.xword	0x475c7689a3103514
	.xword	0x9d6a7672635c000c
	.xword	0x8d3b883450c16722
	.xword	0x41b7d56dea2e170a
	.xword	0x217bcadef0cd0869
	.xword	0x04d9688becfa376d
	.xword	0x5bce44231249dbc3
	.xword	0xacb053556bdf3589
	.xword	0xcc9a4872f0508ac7
	.xword	0xfb43e4e4b2bbbd8d
	.xword	0xb9d7aa584fb4dec1
	.xword	0x98f6f9599875b0eb
	.xword	0xc3a9828a0633070c
	.xword	0x04f72db7cc2f4648
	.xword	0xa8572d6561ba8117
	.xword	0x6d0cd18dd6303598
	.xword	0x876d9813da4c0306
	.xword	0x6c154f3767c2a89d
	.xword	0xb699523f3200488a
	.xword	0x0272c430da78d8a7
	.xword	0xb6ed8b923672c44c
	.xword	0x5c108e2fbfa0001d
	.xword	0x14bc721dbb40981c
	.xword	0x16742a445ee84402
	.xword	0x603e6cd614e495c1
	.xword	0xaf5837c317ddb3c7
	.xword	0xe827d0b7f45cc459
	.xword	0x314176c46e6f24e2
	.xword	0x01153b4deab93788
	.xword	0xd4406ca74cb396ec
	.xword	0x4f19273689880fc3
	.xword	0x1a6078ed72acb6d0
	.xword	0x78ab1af8192a7145
	.xword	0xb2e713109ae46d1f
	.xword	0x1001c51a8860aa02
	.xword	0x7a257da5f1e99099
	.xword	0x227af9cb5a274798
	.xword	0x35cb091fb6004bac
	.xword	0xf130a0140f08fd03
	.xword	0x36967d91ca60110d
	.xword	0x5d2e759837f7db95
	.xword	0xa46178bf3787cc4d
	.xword	0xf73b41f0d460eb38
	.xword	0x7c4a44bd32d832e0
	.xword	0x1daaf29462026872
	.xword	0x3d33b40f54a42280
	.xword	0x9f91b980aa2facc1
	.xword	0x80904794879bb9b2
	.xword	0x652f3dd06b2cecbe
	.xword	0x26e060346b7753d7
	.xword	0xeaa2241c45e51c31
	.xword	0xea3208302bc83cd8
	.xword	0x3047eeccf501cafe
	.xword	0xe79c03ad6a43cc29
	.xword	0x6bb46bee1a2b2025
	.xword	0xc06ec1a5e69cca09
	.xword	0xc68374ab3809cc96
	.xword	0x900af946288ab442
	.xword	0x14f04cb98848cf5a
	.xword	0x613a7cbfe5456fc6
	.xword	0xf6b75eb41b360f2e
	.xword	0xfa3036c5d0c4e7ee
	.xword	0x464530bd90c8b2ae
	.xword	0xf8272d4d51568aa7
	.xword	0x964168cdfceb0b33
	.xword	0xfa0d5abf1d8b75cc
	.xword	0xe2265e1bf3464dc2
	.xword	0x790779e96772e9b2
	.xword	0x1db8e97441be15ea
	.xword	0x26169a392b4c27c1
	.xword	0xfc1464a9e4e91775
	.xword	0xd85e23060b0a51ce
	.xword	0xee592170f154621f
	.xword	0x0bc69a83b66936a8
	.xword	0x504066a4c374a699
	.xword	0x69b50ef6fb9e515c
	.xword	0xf03abeb3c74c1215
	.xword	0x41be2132213703a5
	.xword	0x0f74a99f7e2a39f3
	.xword	0x8d201ed2d3078174
	.xword	0x164a5ac795b5372f
	.xword	0x5ca636cec11b99d4
	.xword	0x45be2c4ca756cc71
	.xword	0x066bbfec5bf80ab5
	.xword	0x6b77c017332ef5ad
	.xword	0x6ba43049be5338d9
	.xword	0x37e4ba1fd64df365
	.xword	0x997192fd6834e749
	.xword	0xc80059f83bbd57d1
	.xword	0xbf0cc7dd9e539b89
	.xword	0xd0a8596b123e8681
	.xword	0x27e45f82ba2cf926
	.xword	0x8fbf7ff634ced1cc
	.xword	0x7b895f264dab82cd
	.xword	0x402af51ce3f7c3a0
	.xword	0x37b0456ffdb6915a
	.xword	0x4ca55f8dc77c367d
	.xword	0x5311e2862dcd1a72
	.xword	0xb78e57e90bea5f1a
	.xword	0x10a62a0984ff0852
	.xword	0x313c3de1011fd177
	.xword	0x79a21c5f03596ce3
	.xword	0x540e7495331d5807
	.xword	0xf3ecfc22f3aa4098
	.xword	0x39052ac59f0237ba
	.xword	0x96d35eef740ea2b3
	.xword	0xcf67b6b25fb7e9fa
	.xword	0xe2bb0bd724ab4f5d
	.xword	0x1b9de92c49ad6c14
	.xword	0x00f13ec0f7b69bf9
	.xword	0x7d587a792f1c612a
	.xword	0xf70e16646c7c1294
	.xword	0x7b49f76feceb2fab
	.xword	0xf3af5ed84e7112fb
	.xword	0x838b6f0e2926d40c
	.xword	0xc7eff500fc417150
	.xword	0xbba9b482c7225282
	.xword	0xd6bd16431795143a
	.xword	0x45cbd9a1a876b503
	.xword	0x4d3e5dcdbe236a81
	.xword	0x262efc2759bd3d4d
	.xword	0xdfa0568fc84952d1
	.xword	0x993a466417047b06
	.xword	0xdcb5da5f43a1c78d
	.xword	0x3056968cb2f999f3
	.xword	0xdf6483df83695e18
	.xword	0x50cc1c42760d3b05
	.xword	0xa399cd7fca30c3e6
	.xword	0xf000f0a3f07bc429
	.xword	0xb9689399dfcba762
	.xword	0x93c6c9d2f0d69651
	.xword	0xdab7547f4276aa17
	.xword	0xba06feb1cd449b94
	.xword	0x10d950c65663bea2
	.xword	0x51f8687ed6e257cf
	.xword	0xc6f2608e3b5f1202
	.xword	0x86e3139cc3c4a950
	.xword	0x408a8476cf55ac25
	.xword	0xc7f8cccf45a75187
	.xword	0x88becf947beb36e5
	.xword	0xc80cd21d1ac3d4a7
	.xword	0x5371b4d7dca560ee
	.xword	0x3c8de202f9181ab0
	.xword	0xf958df5bbfe0e857
	.xword	0x9965178c242ceb30
	.xword	0xf683ac9e3e3f15e5
	.xword	0x2d8ab9d021b08f03
	.xword	0x5a20348501f6a93a
	.xword	0x79104667da825fbc
	.xword	0xe0ed003ba043ecc4
	.xword	0xb9165de0cc054176
	.xword	0xd82c021c5048fd3a
	.align 0x40000
	.data
data_start_6:

	.xword	0x0c696723e3439995
	.xword	0x423cd2980a66728c
	.xword	0x406e42b2f1530a5f
	.xword	0x53932f0676496fee
	.xword	0x0508bdb9fd2a1a55
	.xword	0x643f9f036acb97fe
	.xword	0xc39eb74b0e213b00
	.xword	0x36b45bdf9a6e77c2
	.xword	0x250e3305e06cae67
	.xword	0xa219015d3af9ea63
	.xword	0x9622c321ba4e0aad
	.xword	0xb8a84523328ba0dc
	.xword	0x0b06c69f1e14af40
	.xword	0xecf87c462eb7a70a
	.xword	0x0cf2a47cbf81d64c
	.xword	0xae0bb095fdd46623
	.xword	0x09b3f8537b0be02a
	.xword	0x44acf98c9a7b248a
	.xword	0x7a0584664fcf204a
	.xword	0x71941f076236c004
	.xword	0x26a110dae0c99130
	.xword	0x2bb62dd64ea2c200
	.xword	0x0e877193ba16763a
	.xword	0xab31e2bc3257ae3d
	.xword	0x87745220dfd937ac
	.xword	0x931fc8e6fa2b5c3b
	.xword	0x7d19f54594bdd997
	.xword	0x1c7de65b2bf283e1
	.xword	0x0860d696b66f13f8
	.xword	0xfd19c4dbe915185d
	.xword	0xb7debb081607cdba
	.xword	0xcd80a6bb74196d42
	.xword	0x9b1b9018c8f341d5
	.xword	0xa7b21913ebf0c9f2
	.xword	0x7c501c52c85f4869
	.xword	0x6cf60e45de90ae7f
	.xword	0xac6d136ac3d76120
	.xword	0x6acd18f77ba4728c
	.xword	0x3113ad2a4b9604e4
	.xword	0xb83eb41a940d4d26
	.xword	0x3e25d67cbbee442b
	.xword	0x03201d58cf8828da
	.xword	0x56c072c1ed772db0
	.xword	0x1a73613296f094d4
	.xword	0x78df1f8e3c338b93
	.xword	0x33c25cd1816648d7
	.xword	0x122f547922f0c75b
	.xword	0x0940e5ac559cf00a
	.xword	0x45a02cdddb6ab4b6
	.xword	0x36afafd3f42ebacf
	.xword	0xb60a03f950226494
	.xword	0xba731fbca23891d4
	.xword	0x3252a30e6717dcff
	.xword	0x10c6ca54cbd69ea7
	.xword	0x53aecb072bd60bdd
	.xword	0xa1fa5a0ab06b0f9c
	.xword	0x15c7242e36bb68b0
	.xword	0x19a2e454da7a6bb0
	.xword	0x157457aee2cf88a3
	.xword	0x40d273d05911a249
	.xword	0x286aa0b13f1f7d48
	.xword	0x70edfbefdc0238dd
	.xword	0xd3f757f1d53de4dd
	.xword	0xb4bc24bdda3b3b41
	.xword	0x6eba113db50227c4
	.xword	0x7897712277fd0906
	.xword	0x28372b5f921bdcac
	.xword	0x4abc860a02bc75a9
	.xword	0x6e37bb4c8892c6ef
	.xword	0x29b0f484e4f7b40f
	.xword	0x6c8cc63110b03b5b
	.xword	0x3b867dfaf2f0cdd5
	.xword	0x93bf0cb07d9354fe
	.xword	0xc2c8d10700990d5b
	.xword	0xdd01428ddcfa1574
	.xword	0x15a629f11019e82b
	.xword	0xee60775db7c0e968
	.xword	0xa9da4e3bbe46d897
	.xword	0x7fead0cfbc5566fd
	.xword	0x29e75d4bc2981f0e
	.xword	0xebfb57ae84cb8b58
	.xword	0xac38afab54f54c2d
	.xword	0x4be1ec7eb4db48cb
	.xword	0x5a738bd14e574ea3
	.xword	0xaeb786da849a15bd
	.xword	0x32941f43ccb1ff2e
	.xword	0x7ab6d4f88b48eda6
	.xword	0x8838d04a21c4a8ba
	.xword	0x37078b927276956b
	.xword	0xc1351457be7009fd
	.xword	0x6c6f53098aadb3b8
	.xword	0x413d1f4afaa1e5a1
	.xword	0x5531471be95ba10a
	.xword	0x8128d098f9aea4cd
	.xword	0x47b62ba23a496cb9
	.xword	0xba6a554a400b1253
	.xword	0x5f25997214db8ebf
	.xword	0x633eaba9b85dff39
	.xword	0x4dc30fe6f1e93ddc
	.xword	0x3a3cc22a425c1b03
	.xword	0x66bf8df9a5be4d12
	.xword	0x993c64198ae02d13
	.xword	0x2187945f1ad874ba
	.xword	0xd8736f5bdd1eb82e
	.xword	0x87f152848d97ce23
	.xword	0x615eb3169c28e3b2
	.xword	0x9399f98669829494
	.xword	0x27f4fb72a83c1c18
	.xword	0x139d584c6eb9ce82
	.xword	0x33a71d494d771db6
	.xword	0x316f6132d7ccee25
	.xword	0x5c20d5079f4907ef
	.xword	0x1d896df51f3c9c34
	.xword	0x7cad7ec7be554445
	.xword	0x7912a6c819bb2e94
	.xword	0x39e4e96fe2f6684c
	.xword	0x6848460ac25b45e1
	.xword	0xa16d777bbe713630
	.xword	0xfe484cce76b360c5
	.xword	0xc4b53ad66a811393
	.xword	0xd14856b7c9df0796
	.xword	0x357c89967e5de92b
	.xword	0xdf123c6f48f21b63
	.xword	0xadadbf0317a902b1
	.xword	0x3b2f8f8886102be2
	.xword	0x0ace2f0f62539dd7
	.xword	0x307d0083ac9e09df
	.xword	0xe05c5ff448faab20
	.xword	0x43211ce681e6a129
	.xword	0xc0bcb55565235c1e
	.xword	0x3902d8ac151bae34
	.xword	0xdf3e75d265488bbe
	.xword	0x0606704c56e8ba4c
	.xword	0xa5c0dc81d90c305a
	.xword	0xd487c49c9bc35235
	.xword	0x3ebdfc503bc1124f
	.xword	0x25526e3b94076fe7
	.xword	0x61b3fc86d259a685
	.xword	0x553fd8cc029807ed
	.xword	0xe5672bba26359d80
	.xword	0xeec0b5a2e902eb15
	.xword	0x4bbe3c63907cdc60
	.xword	0xc99a220762f9041e
	.xword	0x64645c92f3249122
	.xword	0xf684ac8b22610919
	.xword	0x3cda4b08919e5b11
	.xword	0xb30af63f77f5febf
	.xword	0x99c4c27194f0aa91
	.xword	0x8514ef574c098e0a
	.xword	0xbf7ee7608126d996
	.xword	0x104e892e9c5b9450
	.xword	0xb3fa2443b719ff52
	.xword	0xda44ed17c5759783
	.xword	0x5f00f5d81383e476
	.xword	0x90f994ade93f8a07
	.xword	0x3686b86528da3233
	.xword	0xeacd9005920c83f2
	.xword	0x5a6faf468ba36ab0
	.xword	0x482d846c730b8b05
	.xword	0xab6f6e7c2311dec4
	.xword	0xd7ace4f4c14c1254
	.xword	0x636e6ceb1b017a36
	.xword	0xfb15eb3ef91d2508
	.xword	0x104f2e1e8bde3e2a
	.xword	0x5e722e38cdcb76a5
	.xword	0xac19f669ed6703f9
	.xword	0xd2c662fa84aa9413
	.xword	0x133f6374d2b37146
	.xword	0xec60bc519fbde65e
	.xword	0xca5034ec8f524b54
	.xword	0xd4586aed1e78be30
	.xword	0x41bfe01332e1618a
	.xword	0xeead98f811bcda88
	.xword	0xbcfa303311b58b62
	.xword	0x5b9125ac184f14ba
	.xword	0x56dd7050bcd7a00e
	.xword	0xac39c897d72447c1
	.xword	0x6ed1ee2b64cb5a73
	.xword	0x9944756a6aca6492
	.xword	0xd786077e9306cce4
	.xword	0xe34aeb7833ac2e91
	.xword	0x8eac6c20d287253d
	.xword	0xc64854190ac724a2
	.xword	0x8ae5acb6dd7b2e40
	.xword	0x87335a1d3f51c21f
	.xword	0x51361ec56972208a
	.xword	0x30437d9d727b315c
	.xword	0xd0255c16b9e79a55
	.xword	0xc542066f6a4af1eb
	.xword	0x06563029c64324a1
	.xword	0x0500848c378a2ade
	.xword	0xc40581e61ed3ceef
	.xword	0x594369cd68e8908e
	.xword	0x6f26d8957e075c95
	.xword	0x18d7e2aff7691ca2
	.xword	0xa67831dc86a5d094
	.xword	0xdc7223901e22a977
	.xword	0x068a371a0e0209c2
	.xword	0x59326e863ac06d03
	.xword	0x7422dc4125dc845b
	.xword	0x44f05043b8f21528
	.xword	0x9f6cf757d14a4a55
	.xword	0xf4f3155963db805b
	.xword	0x5d75326e8bc9b818
	.xword	0x6541b154e87014cc
	.xword	0x7426e2cafc1cc24c
	.xword	0x16aad03f96275b5c
	.xword	0xab8dad966ca94827
	.xword	0x1b1f2a68f01d1ad3
	.xword	0xd4ea966b4649d69e
	.xword	0xff1899b5a5966953
	.xword	0x25e9ad356d9f5ea4
	.xword	0xeda1a106b247d693
	.xword	0xa6c33b70e960b970
	.xword	0x626249437fc13ef3
	.xword	0x3c58a8709e6e08d3
	.xword	0x6d652383835abf62
	.xword	0x811ac05ee58f9cbf
	.xword	0xd7b3d83c198f08cc
	.xword	0xc69df2c45a901ead
	.xword	0x1865bf56fcb71adc
	.xword	0xd3e25ce493613287
	.xword	0x37bd90e3d575b970
	.xword	0x686d219401cc36ac
	.xword	0xf70d3aa7eadb0301
	.xword	0x1d4e419e7ac4f73b
	.xword	0xf2cf9f19e5a1ea10
	.xword	0xe857f6805ca4bd65
	.xword	0xd890197f75842418
	.xword	0x39346fd97476cdd5
	.xword	0xfaae459149c5e83c
	.xword	0xb0ff7bf161de77af
	.xword	0x6010ae04baab2ca5
	.xword	0x621407c37a7ef588
	.xword	0x0303bc705cae40f6
	.xword	0x54369632c63bb6c1
	.xword	0x9960a8829585f997
	.xword	0x6eb60b01c9226bf7
	.xword	0x75c890747e844b08
	.xword	0xd2570e0058ceaa1b
	.xword	0xe500476402ea98ae
	.xword	0xb9b882f53de39abe
	.xword	0xcdc37becae7033e6
	.xword	0xd93821130ecf27d9
	.xword	0xe38a9108cb532b66
	.xword	0xe8459ea7b7f6f26f
	.xword	0x776f77bc3825567a
	.xword	0xc53f4022218cad9b
	.xword	0xa779b2c683de6bdf
	.xword	0x10c74f0fde00ae80
	.xword	0x89ece716c4064a14
	.xword	0x4ccb558234bcd85d
	.xword	0x5eace6d6d37d8831
	.xword	0x035eb794b132512a
	.xword	0xcbd734ab75bab615
	.xword	0x94d16aec48d43558
	.align 0x80000
	.data
data_start_7:

	.xword	0xec425ebe3fe9871a
	.xword	0x6e12c5e41945063f
	.xword	0x6ddc8d51f8b8e87f
	.xword	0xceee23af1cf6b5d3
	.xword	0x4a56b4bf96d78e46
	.xword	0x400e5af271dfb0ce
	.xword	0x45eecc70d87d8848
	.xword	0x6df3207344a9ebef
	.xword	0x8a2d250c11b2a87d
	.xword	0x084ddfe0d5994219
	.xword	0xab571d6814f69781
	.xword	0x922fa46fa9916cf2
	.xword	0x7d6d97e0752732f5
	.xword	0x9b14a2394feb1e4f
	.xword	0x1e9a5014b41f8f40
	.xword	0x6e9ad4c37070f2c3
	.xword	0xbe8033ec676ef601
	.xword	0x3487b0c1f47a5471
	.xword	0x89e68099d2c87b16
	.xword	0x6a1654d84f702a76
	.xword	0x6071ab119fb3750c
	.xword	0xc1d9330e37c9dbd8
	.xword	0x3a3ba246cf4b76d2
	.xword	0xbeecce8682bb5905
	.xword	0x2c8b015a0c758e02
	.xword	0x2faad90592b40771
	.xword	0x0f7a38ed40e33919
	.xword	0x8200548274c6354c
	.xword	0xc80e774b58f6ff46
	.xword	0xd32a71daadd21211
	.xword	0xf3147e34858c8836
	.xword	0xe783d7b5f11f4092
	.xword	0x8195c490fd39ce70
	.xword	0x791cd749debdd54b
	.xword	0x69c96f76f1a25b70
	.xword	0x2dcd0cda4001dc35
	.xword	0x9d263bad6dc44b61
	.xword	0x9124eaf5859bc688
	.xword	0xc48e658938fc9595
	.xword	0x40b8f9a5b2d7b469
	.xword	0xabcd83a5f4b33233
	.xword	0x60136f7790bbd851
	.xword	0x3865da842971c692
	.xword	0x7b32ff65b0498595
	.xword	0xaf2648bd95735235
	.xword	0xe7a6e4d303190ad6
	.xword	0x3df766a7aeb6ccaf
	.xword	0x23ddbe2a8e3e755b
	.xword	0x85d37a4bf2c64f01
	.xword	0x3f36fcdaa1706f3e
	.xword	0x4ef923c800c2a9ff
	.xword	0x392e14e244285c31
	.xword	0x575ae3cc1ec6f792
	.xword	0x43a26598c79057d5
	.xword	0x0dce084e597edf92
	.xword	0x4f6e3a785c2b8f3d
	.xword	0xcf3337a4ef7df421
	.xword	0xd606aa45a1f066e7
	.xword	0x39ba50a8e8ba08da
	.xword	0xecd39152a28b4d22
	.xword	0x3301798a89fe0a6b
	.xword	0x4859e914b318194a
	.xword	0xe6eb2f650435972a
	.xword	0x3a72d2f81f8fb5ad
	.xword	0x54da50ccd66d0c39
	.xword	0x65571a2949b85b66
	.xword	0xea2f67cfe870baae
	.xword	0x4f45bd96f5449c6a
	.xword	0xe212a6a08543f051
	.xword	0x8a14ccf1cef7e61d
	.xword	0x4ccb3d6673876100
	.xword	0x59c5fe741f0e2501
	.xword	0x1d590afbe692a9b6
	.xword	0x1dfef1e74c5d2191
	.xword	0x3a603176496bdff5
	.xword	0x5a470d45dac900db
	.xword	0xd1e3c1bb226b5ef4
	.xword	0x164fe6ad129fc4f5
	.xword	0x8bb8e1ab370a96ed
	.xword	0x05f725794cb48ee0
	.xword	0x52cabd598b6fe2bf
	.xword	0x0ed43d25747bb050
	.xword	0xff219f2c41c289a5
	.xword	0x2769340bf9497597
	.xword	0x21055eb70ca1e136
	.xword	0xe5d3793469901297
	.xword	0x33f7b4029378fb92
	.xword	0x0e68b367c46f7de0
	.xword	0x177e04c79b3e1d7d
	.xword	0xb5b1b349e64fae86
	.xword	0x06c401b3b272506d
	.xword	0x78c191c966597f0e
	.xword	0xc858126e7617fae4
	.xword	0x797a639f04933434
	.xword	0xc68623c109913e97
	.xword	0x478d97ac49acb0b4
	.xword	0xa0a37f25fc56bb90
	.xword	0x1c9f818e5073170b
	.xword	0x3b743d00e2ded01d
	.xword	0x43c7c4a64012bd5b
	.xword	0x7c4057313cb67fb6
	.xword	0xf95a098f79d7c792
	.xword	0x41f232a9de85ea1f
	.xword	0x451221dd82b4e646
	.xword	0xa3cc4129362b6ec8
	.xword	0x15237a2c530d2706
	.xword	0x446f6f21893a1bda
	.xword	0xd75d7b952c6c6a57
	.xword	0x57edf0bf79961287
	.xword	0xd562c5348c72c266
	.xword	0x14515bc598124de8
	.xword	0x0f3a5daa291d1c95
	.xword	0x60a7d49e056164ca
	.xword	0x4d3c6afd15efea6e
	.xword	0xd7c9dfdfdbc7ed9c
	.xword	0x1fa8a985b188e3fa
	.xword	0x95cab725c9aceb5a
	.xword	0xc8b9738dcde5a648
	.xword	0x9c934f6d3e56f3c5
	.xword	0x93a8980b4c8233f1
	.xword	0x05a3f2f5dd1a74e1
	.xword	0x8fd10d99fc6ed8c8
	.xword	0xdb0925c2b7563680
	.xword	0xa9a3ac11bf6a4e70
	.xword	0xd531e13fb24d5a45
	.xword	0x5f8fe0176e71b25a
	.xword	0xa58894005ba483e4
	.xword	0x7df6c1553ee8f0b5
	.xword	0x7d8b5d5f7990e6e0
	.xword	0x13032c1bc47ea07a
	.xword	0x7c3a38c57aae45b4
	.xword	0x8acb4e2b7604501e
	.xword	0x2167af357793482a
	.xword	0xd6db0ab7ab14870e
	.xword	0x8147c567d17d6c41
	.xword	0xef5b50fe1f5a45ec
	.xword	0x1a2c9dcf9f183a40
	.xword	0x5ce8305054acae49
	.xword	0x4c735665f992e112
	.xword	0xd7c9576cf2b57bc5
	.xword	0xe1fa1a8880690718
	.xword	0xd586260be73b39c9
	.xword	0x0e1f12be2638778b
	.xword	0xcc8bacfd622f5d5f
	.xword	0x72d921bd724237f3
	.xword	0x63f5bece1af55e6f
	.xword	0x336605d99e1eaa8d
	.xword	0x9e3af5923f4b9114
	.xword	0x9eca394f07476574
	.xword	0x7497b0c480f4966e
	.xword	0x85f21a090a1c25b6
	.xword	0x517348c6c3c127ba
	.xword	0xeec3b2ec71339dae
	.xword	0x1277c5b9c38bca2d
	.xword	0xe6a28071589f4c75
	.xword	0x8836dc068382f2ff
	.xword	0x46010a98735719ed
	.xword	0x0ada2fb8cabd82ae
	.xword	0x4e40325557a93b8b
	.xword	0xbc13f60db466cf48
	.xword	0x63bc4945c34973d0
	.xword	0x62b9f926a0340c87
	.xword	0x432771d08a9e1088
	.xword	0xb6b5228b5d06dcef
	.xword	0xd5d942fd955733ec
	.xword	0x331c9aa59990bef2
	.xword	0x11eadb9d3bfc1bd0
	.xword	0x933a1c7f91eb6213
	.xword	0xe60f753e733f1650
	.xword	0xaab216229e020ad5
	.xword	0x6657bde389177972
	.xword	0x490008c2dabca303
	.xword	0x572cabd76c990e51
	.xword	0xcf4fc5116e1376a6
	.xword	0x618f1ede01ff0a0f
	.xword	0x9b7f76e5b6a00176
	.xword	0xc1fda5febafc7d2a
	.xword	0x47d77a33cf6f61d4
	.xword	0x1a50066269564eea
	.xword	0x78144eccca9c6d2d
	.xword	0xeb11143c56e97ab3
	.xword	0x22a85c940d4c5b38
	.xword	0x6cc068b6dbdbf97a
	.xword	0xe41c56a22ae5a57b
	.xword	0x4f484cc752c8714f
	.xword	0x85379942a539c91f
	.xword	0xf31ee76254db7a91
	.xword	0xd6ffecff64abe5d7
	.xword	0xf308dd14f1ebbd4d
	.xword	0x33283dedf59a4502
	.xword	0x51898a11cfe9d879
	.xword	0xdcb1fe529f6806a6
	.xword	0xb190f3057fa752bb
	.xword	0x4a8e835ee979a1bc
	.xword	0xd41b59cc2340a0bf
	.xword	0x6ee5ad5efa3949e4
	.xword	0x9fb7077d4c01c148
	.xword	0x79df5309b1a7b771
	.xword	0xb91be420db0a0712
	.xword	0xa614c3e710f2ff72
	.xword	0x293a2cef6c9d819a
	.xword	0x42b7b6e8cb2cafe7
	.xword	0xc39d30a53fd61031
	.xword	0xeaa0304efa4f0fa9
	.xword	0xf9def13d087768c2
	.xword	0x02ba199554662c33
	.xword	0x1987f6ee98d087df
	.xword	0x82e439c71efd69b9
	.xword	0x54f94aa7607da2f6
	.xword	0x82c8041009308643
	.xword	0x14940035acc40d73
	.xword	0x30d62a84dcfd2000
	.xword	0xd1dd7cabfd1b24fa
	.xword	0xee544f0323813244
	.xword	0xc677ce92b6e43dac
	.xword	0xecb5130939aa7365
	.xword	0x3fce42b1361324c0
	.xword	0x7f02b95c98771a1b
	.xword	0x4f575e6698fa3355
	.xword	0xa81f5264f9f93df7
	.xword	0xd11eef1fd0561a12
	.xword	0x98e5ecf0ca6d36f9
	.xword	0xc113d67ad3e633b6
	.xword	0x9c1f87cabd829bea
	.xword	0x8bba19751e599fb6
	.xword	0x4df492b63c2ef739
	.xword	0x5f65409ccc86991f
	.xword	0xedadbde853ec05d5
	.xword	0xccdc4dfdde019779
	.xword	0x535e6bb618af696c
	.xword	0xa604c9e07fb0a346
	.xword	0xfb8d1875b27c1c69
	.xword	0x617a1da862df2639
	.xword	0x3740b889a44125a8
	.xword	0xee1da233aed01084
	.xword	0x294e01f9ce51d843
	.xword	0x785762a6182e82b5
	.xword	0x351c44dc84f01c49
	.xword	0xa704f4c057eea6e0
	.xword	0x5e58204cec9cadab
	.xword	0xd7323cc0c9b038b6
	.xword	0x208623b19340e3ac
	.xword	0x584195ea21bff5b8
	.xword	0xf4a307c127d15fb2
	.xword	0xadefde5c94e790ad
	.xword	0xb543435f423d84f3
	.xword	0x3c41ad442b51ab66
	.xword	0xb386345e4a9bdb6c
	.xword	0xaece0297df6def79
	.xword	0xedd33a7f368c3703
	.xword	0xaf2f90b008d3b7d9
	.xword	0x028c92c42c202bf9
	.xword	0x2bc05a26589e9ac2
	.xword	0xcf1ac205e2e6d2cc
	.xword	0x6a5100f6e7921a86
	.xword	0xea53249752434a39



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
