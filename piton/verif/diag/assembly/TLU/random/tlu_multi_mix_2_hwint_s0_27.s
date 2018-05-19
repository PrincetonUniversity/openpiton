// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: tlu_multi_mix_2_hwint_s0_27.s
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
   random seed:	729919433
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

	setx 0x33a73080390cd9da, %g1, %g0
	setx 0xfc333cc6cfecc598, %g1, %g1
	setx 0x8327cf852ddf04ce, %g1, %g2
	setx 0x998033188df5ffa6, %g1, %g3
	setx 0xd825179219140520, %g1, %g4
	setx 0x7fe6dfd9ab23e7e2, %g1, %g5
	setx 0x350660ec9e589c27, %g1, %g6
	setx 0x1d8c46ef034c62ca, %g1, %g7
	setx 0x5978f88cfc995de4, %g1, %r16
	setx 0x5a7f2e9de82081d6, %g1, %r17
	setx 0x7f8dc82899f49305, %g1, %r18
	setx 0x11765d4f73e9c7f2, %g1, %r19
	setx 0xaca36fb58a455e4e, %g1, %r20
	setx 0xdd2c3c1a9344eb91, %g1, %r21
	setx 0xc6d7219a6c5369be, %g1, %r22
	setx 0x91bee607f0e57846, %g1, %r23
	setx 0x4fa7026e81fcaa71, %g1, %r24
	setx 0x7a28e666ca3279d8, %g1, %r25
	setx 0xd1b1d31f5699a115, %g1, %r26
	setx 0xf109d377fcf28051, %g1, %r27
	setx 0x009d74eb64cf11fc, %g1, %r28
	setx 0xae3eb5df50cda523, %g1, %r29
	setx 0x530f0106913573bb, %g1, %r30
	setx 0xaa33af96cc8260c2, %g1, %r31
	save
	setx 0x9b03ad815e1ecf69, %g1, %r16
	setx 0x9545a83dff2f53f3, %g1, %r17
	setx 0x2e7211b2fcdfa0ac, %g1, %r18
	setx 0x53f168e9140bf36a, %g1, %r19
	setx 0x87ec9e47ae744745, %g1, %r20
	setx 0xc9b5ef2a91805dea, %g1, %r21
	setx 0x4d9b60c624d6942c, %g1, %r22
	setx 0x6526ecdaaddf724b, %g1, %r23
	setx 0xc345f34eb3622572, %g1, %r24
	setx 0x847ee338f66d8292, %g1, %r25
	setx 0x0f0075c9c6af1e51, %g1, %r26
	setx 0x49693b9106346e33, %g1, %r27
	setx 0x4b866a2964282d59, %g1, %r28
	setx 0x4ef3353000164535, %g1, %r29
	setx 0x6ab2ecaa78973a0b, %g1, %r30
	setx 0x888f9db521dfdcb5, %g1, %r31
	save
	setx 0x347a7451e1a320a9, %g1, %r16
	setx 0x05fcdc4a72ab03b0, %g1, %r17
	setx 0x8286caa670f15a3b, %g1, %r18
	setx 0xfa7e0608246ab1cc, %g1, %r19
	setx 0xb996441622f4ccb9, %g1, %r20
	setx 0x974ccec761258908, %g1, %r21
	setx 0x083aed70c789e61b, %g1, %r22
	setx 0x5cb9cfb63f96aa61, %g1, %r23
	setx 0xd8a046d95edd1d47, %g1, %r24
	setx 0xac685233def67144, %g1, %r25
	setx 0x4445ca85fc849f63, %g1, %r26
	setx 0x12a9f303789f8b29, %g1, %r27
	setx 0x376dfc447cd222e7, %g1, %r28
	setx 0xfe8a5084558aa1ab, %g1, %r29
	setx 0x99f19ee6eaf27403, %g1, %r30
	setx 0x044558edb5a338d0, %g1, %r31
	save
	setx 0xbc4e66ba7427ba45, %g1, %r16
	setx 0xc75decf09c9a3e00, %g1, %r17
	setx 0x49be82f5c7a4898e, %g1, %r18
	setx 0x8453d4fd1a5d6032, %g1, %r19
	setx 0x9a0ca656c6010607, %g1, %r20
	setx 0x554ab6119ef3f0af, %g1, %r21
	setx 0x84a0c615abc514dc, %g1, %r22
	setx 0xde715b094b7e26dc, %g1, %r23
	setx 0x9f0dd386cfa9920f, %g1, %r24
	setx 0xb162bbbb83acc4ea, %g1, %r25
	setx 0x2e837a2d107dd59f, %g1, %r26
	setx 0x8a1d5bd06967f184, %g1, %r27
	setx 0x0392983658874f1d, %g1, %r28
	setx 0xf38da5bd6abcbf79, %g1, %r29
	setx 0x39e5afaabacd84ca, %g1, %r30
	setx 0xbfdad65cd388b5df, %g1, %r31
	save
	setx 0x0e1085d643123996, %g1, %r16
	setx 0x6b340bc1babe0008, %g1, %r17
	setx 0xe70290d309882019, %g1, %r18
	setx 0x0a2c220bfb49c6fd, %g1, %r19
	setx 0x46802f21dd812680, %g1, %r20
	setx 0xe80283d824d52b69, %g1, %r21
	setx 0xe658e68a5c782f20, %g1, %r22
	setx 0x678627604512af6f, %g1, %r23
	setx 0x9d8636864b1ed7dd, %g1, %r24
	setx 0xab7d77a444585e5b, %g1, %r25
	setx 0xe11be61212e81d63, %g1, %r26
	setx 0x20459e8d7f6ab6e7, %g1, %r27
	setx 0xecd64d6fa5bed7cc, %g1, %r28
	setx 0x97dcba78fdc1910b, %g1, %r29
	setx 0x7670533c45f01c11, %g1, %r30
	setx 0xfe00bd232692aeb3, %g1, %r31
	save
	setx 0x55b35f2ab90234e5, %g1, %r16
	setx 0x01273619c18375a6, %g1, %r17
	setx 0x46d9886428fcd5af, %g1, %r18
	setx 0x2851f1ecff436a4c, %g1, %r19
	setx 0x5d60a5c4772a1b29, %g1, %r20
	setx 0x376675d6590a1e8c, %g1, %r21
	setx 0x6fe18968508e57a9, %g1, %r22
	setx 0xc41a7456b67b6d7b, %g1, %r23
	setx 0x2a04c481d210774e, %g1, %r24
	setx 0xb418b1aef59e684e, %g1, %r25
	setx 0xbf6818a3caa10fa8, %g1, %r26
	setx 0x5a515f3b4dc0d498, %g1, %r27
	setx 0xf0647f4acef81072, %g1, %r28
	setx 0x05a7dd4c00aec5ab, %g1, %r29
	setx 0x220075e8322bb930, %g1, %r30
	setx 0xf2b840ec47c8620d, %g1, %r31
	save
	setx 0x28de2a60ad96ed2e, %g1, %r16
	setx 0xe5a013a438b423ab, %g1, %r17
	setx 0x469a2c5f3d3c211a, %g1, %r18
	setx 0xaa719ba511718dc3, %g1, %r19
	setx 0xa7ba3ea1bd83c4dc, %g1, %r20
	setx 0xea5657a7658ae3c4, %g1, %r21
	setx 0xb331dca8605c5969, %g1, %r22
	setx 0x25137cfe24a52b40, %g1, %r23
	setx 0xdcd309707f3b8521, %g1, %r24
	setx 0x7f7766a94b831683, %g1, %r25
	setx 0x21f9fa58f4f1219b, %g1, %r26
	setx 0xd1877a274ecfa848, %g1, %r27
	setx 0x3985e21fa91daa25, %g1, %r28
	setx 0x17e1dffb47d0644b, %g1, %r29
	setx 0x0b5e49a8a0351592, %g1, %r30
	setx 0xa3d8ca3bbbde9d6d, %g1, %r31
	save
	setx 0xa187cd37a678d834, %g1, %r16
	setx 0x801bee6718e2c368, %g1, %r17
	setx 0xeeaaf94a9fea341b, %g1, %r18
	setx 0x904faab315c2881d, %g1, %r19
	setx 0x13bda13986f8c3cc, %g1, %r20
	setx 0xc8229723380a8ec4, %g1, %r21
	setx 0x1ce1998701eb15b3, %g1, %r22
	setx 0xb9c1f90ae6443a4a, %g1, %r23
	setx 0x5c0efe35003d04df, %g1, %r24
	setx 0x0d6e8523197e626f, %g1, %r25
	setx 0x7dbf5e249e036070, %g1, %r26
	setx 0x75b622bceb74615e, %g1, %r27
	setx 0xb0c114e02403abd6, %g1, %r28
	setx 0xceb9b2fb595263e5, %g1, %r29
	setx 0x444d713334a0660a, %g1, %r30
	setx 0xc05d6bef46f5b259, %g1, %r31
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
	.word 0xb1e5e078  ! 2: SAVE_I	save	%r23, 0x0001, %r24
	.word 0xb2a420d6  ! 10: SUBcc_I	subcc 	%r16, 0x00d6, %r25
	.word 0xbbe5210b  ! 12: SAVE_I	save	%r20, 0x0001, %r29
	.word 0x8195a15f  ! 15: WRPR_TPC_I	wrpr	%r22, 0x015f, %tpc
	.word 0xb52d2001  ! 16: SLL_I	sll 	%r20, 0x0001, %r26
	.word 0xbfe42062  ! 17: SAVE_I	save	%r16, 0x0001, %r31
	.word 0xb5e56188  ! 18: SAVE_I	save	%r21, 0x0001, %r26
	.word 0xb3e421ff  ! 19: SAVE_I	save	%r16, 0x0001, %r25
	.word 0xb3504000  ! 21: RDPR_TNPC	<illegal instruction>
hwintr_0_0:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_0), 16, 16)) -> intp(0, 0, 2b)
	.word 0xb3e560a4  ! 27: SAVE_I	save	%r21, 0x0001, %r25
	.word 0xbde521cb  ! 28: SAVE_I	save	%r20, 0x0001, %r30
hwintr_0_1:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_1), 16, 16)) -> intp(0, 0, 2e)
	.word 0x8594e116  ! 31: WRPR_TSTATE_I	wrpr	%r19, 0x0116, %tstate
	.word 0xb5e4a003  ! 33: SAVE_I	save	%r18, 0x0001, %r26
	.word 0xbde5e091  ! 36: SAVE_I	save	%r23, 0x0001, %r30
	.word 0xb3348000  ! 38: SRL_R	srl 	%r18, %r0, %r25
	.word 0xbbe4a05e  ! 39: SAVE_I	save	%r18, 0x0001, %r29
	.word 0x87946174  ! 44: WRPR_TT_I	wrpr	%r17, 0x0174, %tt
	.word 0xb12cf001  ! 45: SLLX_I	sllx	%r19, 0x0001, %r24
	.word 0xb1e4619b  ! 52: SAVE_I	save	%r17, 0x0001, %r24
	setx	data_start_4, %g1, %r19
	.word 0xbd50c000  ! 54: RDPR_TT	<illegal instruction>
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbd500000  ! 58: RDPR_TPC	<illegal instruction>
	.word 0xb7e52122  ! 61: SAVE_I	save	%r20, 0x0001, %r27
	.word 0xb48d20cb  ! 65: ANDcc_I	andcc 	%r20, 0x00cb, %r26
	.word 0xb7e52156  ! 66: SAVE_I	save	%r20, 0x0001, %r27
	.word 0xbabd21a8  ! 67: XNORcc_I	xnorcc 	%r20, 0x01a8, %r29
	.word 0xbbe4e106  ! 70: SAVE_I	save	%r19, 0x0001, %r29
	setx	data_start_3, %g1, %r19
	.word 0xbbe4e07a  ! 73: SAVE_I	save	%r19, 0x0001, %r29
	.word 0xb97c8400  ! 77: MOVR_R	movre	%r18, %r0, %r28
	.word 0xbfe520b4  ! 81: SAVE_I	save	%r20, 0x0001, %r31
	.word 0xb1510000  ! 82: RDPR_TICK	<illegal instruction>
	.word 0xb9e5214e  ! 84: SAVE_I	save	%r20, 0x0001, %r28
	.word 0xb5480000  ! 86: RDHPR_HPSTATE	rdhpr	%hpstate, %r26
	.word 0xb1e461ab  ! 88: SAVE_I	save	%r17, 0x0001, %r24
	.word 0x8994a072  ! 92: WRPR_TICK_I	wrpr	%r18, 0x0072, %tick
	setx	data_start_3, %g1, %r20
	.word 0xb3e4e085  ! 100: SAVE_I	save	%r19, 0x0001, %r25
	.word 0xb7e5a062  ! 104: SAVE_I	save	%r22, 0x0001, %r27
	.word 0xb9e5a1b5  ! 106: SAVE_I	save	%r22, 0x0001, %r28
	.word 0xb9e42155  ! 107: SAVE_I	save	%r16, 0x0001, %r28
	.word 0xb92dc000  ! 108: SLL_R	sll 	%r23, %r0, %r28
	.word 0xb23cc000  ! 109: XNOR_R	xnor 	%r19, %r0, %r25
hwintr_0_2:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_2), 16, 16)) -> intp(0, 0, 39)
hwintr_0_3:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_3), 16, 16)) -> intp(0, 0, 39)
	.word 0xb5e4a12f  ! 114: SAVE_I	save	%r18, 0x0001, %r26
	.word 0xb1480000  ! 123: RDHPR_HPSTATE	rdhpr	%hpstate, %r24
	.word 0xbc948000  ! 124: ORcc_R	orcc 	%r18, %r0, %r30
	.word 0x8d94603e  ! 128: WRPR_PSTATE_I	wrpr	%r17, 0x003e, %pstate
hwintr_0_4:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_4), 16, 16)) -> intp(0, 0, 31)
	.word 0xba05e0b9  ! 130: ADD_I	add 	%r23, 0x00b9, %r29
	.word 0xb1e4605e  ! 134: SAVE_I	save	%r17, 0x0001, %r24
	.word 0xb9540000  ! 135: RDPR_GL	<illegal instruction>
	.word 0xb1504000  ! 137: RDPR_TNPC	<illegal instruction>
	.word 0xbfe5216b  ! 140: SAVE_I	save	%r20, 0x0001, %r31
	.word 0xb33d3001  ! 142: SRAX_I	srax	%r20, 0x0001, %r25
	.word 0x8795e1d5  ! 143: WRPR_TT_I	wrpr	%r23, 0x01d5, %tt
	.word 0xb045c000  ! 147: ADDC_R	addc 	%r23, %r0, %r24
	setx	data_start_7, %g1, %r17
	.word 0xb3e46170  ! 154: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xb7e4a1ad  ! 156: SAVE_I	save	%r18, 0x0001, %r27
	.word 0xb83d0000  ! 157: XNOR_R	xnor 	%r20, %r0, %r28
	.word 0xb1e421ed  ! 159: SAVE_I	save	%r16, 0x0001, %r24
	.word 0xb3e5e08a  ! 163: SAVE_I	save	%r23, 0x0001, %r25
	.word 0xb5e4a05d  ! 165: SAVE_I	save	%r18, 0x0001, %r26
	.word 0xb3520000  ! 167: RDPR_PIL	<illegal instruction>
	.word 0xb7e4a10e  ! 168: SAVE_I	save	%r18, 0x0001, %r27
	.word 0xb3e5a03d  ! 169: SAVE_I	save	%r22, 0x0001, %r25
	.word 0xb1e4a02d  ! 170: SAVE_I	save	%r18, 0x0001, %r24
	.word 0xbbe4e101  ! 171: SAVE_I	save	%r19, 0x0001, %r29
hwintr_0_5:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_5), 16, 16)) -> intp(0, 0, 8)
hwintr_0_6:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_6), 16, 16)) -> intp(0, 0, 3)
	.word 0xbc856040  ! 180: ADDcc_I	addcc 	%r21, 0x0040, %r30
	.word 0xbd480000  ! 182: RDHPR_HPSTATE	rdhpr	%hpstate, %r30
	.word 0xbfe4e0f9  ! 184: SAVE_I	save	%r19, 0x0001, %r31
hwintr_0_7:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_7), 16, 16)) -> intp(0, 0, 24)
	.word 0xbfe520fb  ! 191: SAVE_I	save	%r20, 0x0001, %r31
	.word 0xb9e4a1ca  ! 192: SAVE_I	save	%r18, 0x0001, %r28
	.word 0xbbe5e0ff  ! 193: SAVE_I	save	%r23, 0x0001, %r29
	.word 0xbc2c4000  ! 195: ANDN_R	andn 	%r17, %r0, %r30
	.word 0xb7e560fe  ! 196: SAVE_I	save	%r21, 0x0001, %r27
	.word 0xbbe42140  ! 197: SAVE_I	save	%r16, 0x0001, %r29
hwintr_0_8:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_8), 16, 16)) -> intp(0, 0, 18)
	.word 0xbbe521a9  ! 200: SAVE_I	save	%r20, 0x0001, %r29
	.word 0x8d94e074  ! 204: WRPR_PSTATE_I	wrpr	%r19, 0x0074, %pstate
hwintr_0_9:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_9), 16, 16)) -> intp(0, 0, 1d)
	.word 0xbbe5e14d  ! 208: SAVE_I	save	%r23, 0x0001, %r29
	.word 0xb80dc000  ! 209: AND_R	and 	%r23, %r0, %r28
	.word 0x8d94a112  ! 212: WRPR_PSTATE_I	wrpr	%r18, 0x0112, %pstate
	setx	data_start_5, %g1, %r19
	.word 0xb3e521f6  ! 214: SAVE_I	save	%r20, 0x0001, %r25
	.word 0xb9e4e13e  ! 215: SAVE_I	save	%r19, 0x0001, %r28
	.word 0xb1e46151  ! 216: SAVE_I	save	%r17, 0x0001, %r24
	.word 0x8395e0f0  ! 221: WRPR_TNPC_I	wrpr	%r23, 0x00f0, %tnpc
	setx	0xc8b564230000290c, %g1, %r10
	.word 0x819a8000  ! 223: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xb3e56072  ! 227: SAVE_I	save	%r21, 0x0001, %r25
	.word 0xb1510000  ! 228: RDPR_TICK	<illegal instruction>
	.word 0xb29cc000  ! 229: XORcc_R	xorcc 	%r19, %r0, %r25
	.word 0xbeb50000  ! 230: SUBCcc_R	orncc 	%r20, %r0, %r31
	.word 0xbde5a098  ! 235: SAVE_I	save	%r22, 0x0001, %r30
	mov	0, %r12
	.word 0xa1930000  ! 236: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb334f001  ! 239: SRLX_I	srlx	%r19, 0x0001, %r25
	.word 0xb7e5e10b  ! 241: SAVE_I	save	%r23, 0x0001, %r27
	.word 0xbbe5e0e1  ! 244: SAVE_I	save	%r23, 0x0001, %r29
	mov	0, %r12
	.word 0xa1930000  ! 246: WRPR_GL_R	wrpr	%r12, %r0, %-
	mov	1, %r12
	.word 0xa1930000  ! 247: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xbfe4a053  ! 249: SAVE_I	save	%r18, 0x0001, %r31
	setx	0x10759f8f0000cdd9, %g1, %r10
	.word 0x839a8000  ! 251: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb1e42023  ! 252: SAVE_I	save	%r16, 0x0001, %r24
	.word 0xbde460b1  ! 253: SAVE_I	save	%r17, 0x0001, %r30
	.word 0xbbe4a069  ! 258: SAVE_I	save	%r18, 0x0001, %r29
	.word 0xb445a184  ! 259: ADDC_I	addc 	%r22, 0x0184, %r26
	.word 0xbfe42088  ! 260: SAVE_I	save	%r16, 0x0001, %r31
	.word 0xb6158000  ! 262: OR_R	or 	%r22, %r0, %r27
	.word 0xb7e5a0d9  ! 264: SAVE_I	save	%r22, 0x0001, %r27
	.word 0xbbe56075  ! 265: SAVE_I	save	%r21, 0x0001, %r29
	.word 0xb3e4e1d9  ! 266: SAVE_I	save	%r19, 0x0001, %r25
	.word 0xba24613b  ! 271: SUB_I	sub 	%r17, 0x013b, %r29
hwintr_0_10:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_10), 16, 16)) -> intp(0, 0, f)
hwintr_0_11:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_11), 16, 16)) -> intp(0, 0, 5)
	.word 0xb3520000  ! 275: RDPR_PIL	<illegal instruction>
	.word 0xb9e4e0cd  ! 276: SAVE_I	save	%r19, 0x0001, %r28
	.word 0xbf510000  ! 277: RDPR_TICK	<illegal instruction>
	.word 0x83956026  ! 278: WRPR_TNPC_I	wrpr	%r21, 0x0026, %tnpc
	.word 0xb3e5601b  ! 279: SAVE_I	save	%r21, 0x0001, %r25
	.word 0xb3e560c5  ! 282: SAVE_I	save	%r21, 0x0001, %r25
hwintr_0_12:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_12), 16, 16)) -> intp(0, 0, 23)
	.word 0xbfe5218b  ! 285: SAVE_I	save	%r20, 0x0001, %r31
	setx	data_start_3, %g1, %r16
	.word 0x8195a172  ! 288: WRPR_TPC_I	wrpr	%r22, 0x0172, %tpc
	.word 0x879561a6  ! 289: WRPR_TT_I	wrpr	%r21, 0x01a6, %tt
	.word 0xb5504000  ! 291: RDPR_TNPC	<illegal instruction>
	mov	0, %r12
	.word 0x8f930000  ! 292: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xbbe4a15f  ! 294: SAVE_I	save	%r18, 0x0001, %r29
	.word 0xb9e5216a  ! 295: SAVE_I	save	%r20, 0x0001, %r28
	.word 0xb1500000  ! 296: RDPR_TPC	<illegal instruction>
	mov	2, %r12
	.word 0xa1930000  ! 298: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb9e5a01a  ! 299: SAVE_I	save	%r22, 0x0001, %r28
	.word 0xbfe42013  ! 303: SAVE_I	save	%r16, 0x0001, %r31
	.word 0xb615204e  ! 304: OR_I	or 	%r20, 0x004e, %r27
	.word 0xb3e4e018  ! 305: SAVE_I	save	%r19, 0x0001, %r25
	.word 0xb3e5a1d6  ! 306: SAVE_I	save	%r22, 0x0001, %r25
	.word 0xb5e4a0ab  ! 308: SAVE_I	save	%r18, 0x0001, %r26
	.word 0xbb480000  ! 310: RDHPR_HPSTATE	rdhpr	%hpstate, %r29
hwintr_0_13:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_13), 16, 16)) -> intp(0, 0, 33)
hwintr_0_14:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_14), 16, 16)) -> intp(0, 0, 1c)
	.word 0xb7e460eb  ! 315: SAVE_I	save	%r17, 0x0001, %r27
	setx	data_start_5, %g1, %r20
	.word 0xb3e42134  ! 320: SAVE_I	save	%r16, 0x0001, %r25
hwintr_0_15:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_15), 16, 16)) -> intp(0, 0, 3b)
	.word 0xb7e4e105  ! 323: SAVE_I	save	%r19, 0x0001, %r27
	.word 0xb5e560d6  ! 325: SAVE_I	save	%r21, 0x0001, %r26
	.word 0x8195a1f9  ! 327: WRPR_TPC_I	wrpr	%r22, 0x01f9, %tpc
	.word 0xbd520000  ! 328: RDPR_PIL	<illegal instruction>
	.word 0xb2152192  ! 330: OR_I	or 	%r20, 0x0192, %r25
	.word 0xb0b4a179  ! 331: SUBCcc_I	orncc 	%r18, 0x0179, %r24
	.word 0xb3e560e6  ! 332: SAVE_I	save	%r21, 0x0001, %r25
	.word 0xb37c6401  ! 334: MOVR_I	movre	%r17, 0x1, %r25
	.word 0xbfe560d8  ! 341: SAVE_I	save	%r21, 0x0001, %r31
	.word 0xbfe52145  ! 342: SAVE_I	save	%r20, 0x0001, %r31
	.word 0xb4bdc000  ! 343: XNORcc_R	xnorcc 	%r23, %r0, %r26
	.word 0xb13c5000  ! 345: SRAX_R	srax	%r17, %r0, %r24
	.word 0xb3e4e07a  ! 347: SAVE_I	save	%r19, 0x0001, %r25
	.word 0xb1480000  ! 349: RDHPR_HPSTATE	rdhpr	%hpstate, %r24
	.word 0xb53c8000  ! 350: SRA_R	sra 	%r18, %r0, %r26
	.word 0xb3e5a0c1  ! 352: SAVE_I	save	%r22, 0x0001, %r25
hwintr_0_16:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_16), 16, 16)) -> intp(0, 0, 2f)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb9e4e1a3  ! 363: SAVE_I	save	%r19, 0x0001, %r28
	.word 0xb4ad0000  ! 364: ANDNcc_R	andncc 	%r20, %r0, %r26
	.word 0xb7e460fe  ! 365: SAVE_I	save	%r17, 0x0001, %r27
	.word 0xb4348000  ! 366: ORN_R	orn 	%r18, %r0, %r26
	.word 0xb1e42003  ! 369: SAVE_I	save	%r16, 0x0001, %r24
	.word 0xb9e4e0c3  ! 370: SAVE_I	save	%r19, 0x0001, %r28
	.word 0xb8b5a191  ! 373: ORNcc_I	orncc 	%r22, 0x0191, %r28
	.word 0xb350c000  ! 374: RDPR_TT	<illegal instruction>
	.word 0xb334f001  ! 375: SRLX_I	srlx	%r19, 0x0001, %r25
	.word 0xb3e460fc  ! 377: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xb1e4a014  ! 379: SAVE_I	save	%r18, 0x0001, %r24
	.word 0xbde4612f  ! 382: SAVE_I	save	%r17, 0x0001, %r30
	.word 0xb9e4e17b  ! 385: SAVE_I	save	%r19, 0x0001, %r28
hwintr_0_17:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_17), 16, 16)) -> intp(0, 0, 3d)
	.word 0xbde5a10a  ! 389: SAVE_I	save	%r22, 0x0001, %r30
	.word 0xb7500000  ! 394: RDPR_TPC	<illegal instruction>
	.word 0x8394e037  ! 399: WRPR_TNPC_I	wrpr	%r19, 0x0037, %tnpc
	.word 0xbbe5a1ba  ! 400: SAVE_I	save	%r22, 0x0001, %r29
	.word 0x9194e0b5  ! 403: WRPR_PIL_I	wrpr	%r19, 0x00b5, %pil
	.word 0xbfe4e0e3  ! 405: SAVE_I	save	%r19, 0x0001, %r31
	.word 0xb5e5e06a  ! 406: SAVE_I	save	%r23, 0x0001, %r26
	.word 0xb3e4e16b  ! 415: SAVE_I	save	%r19, 0x0001, %r25
	.word 0xb5500000  ! 421: RDPR_TPC	<illegal instruction>
	.word 0xb9e5e189  ! 423: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xb7e4e0e9  ! 426: SAVE_I	save	%r19, 0x0001, %r27
hwintr_0_18:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_18), 16, 16)) -> intp(0, 0, f)
	.word 0xb5e5e165  ! 432: SAVE_I	save	%r23, 0x0001, %r26
	.word 0xbcb4a18c  ! 434: ORNcc_I	orncc 	%r18, 0x018c, %r30
	.word 0xbbe5a1b4  ! 435: SAVE_I	save	%r22, 0x0001, %r29
	.word 0xb9e5e0a5  ! 436: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xb3e5600c  ! 437: SAVE_I	save	%r21, 0x0001, %r25
	.word 0xb7508000  ! 439: RDPR_TSTATE	<illegal instruction>
	.word 0xb295a1d4  ! 440: ORcc_I	orcc 	%r22, 0x01d4, %r25
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
hwintr_0_19:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_19), 16, 16)) -> intp(0, 0, 24)
	.word 0xb3e5616d  ! 447: SAVE_I	save	%r21, 0x0001, %r25
	.word 0xbbe461e1  ! 449: SAVE_I	save	%r17, 0x0001, %r29
	.word 0xb9e4a0df  ! 453: SAVE_I	save	%r18, 0x0001, %r28
	.word 0xb9e4609a  ! 454: SAVE_I	save	%r17, 0x0001, %r28
	.word 0xbde4a0c0  ! 456: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xb7e52085  ! 459: SAVE_I	save	%r20, 0x0001, %r27
hwintr_0_20:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_20), 16, 16)) -> intp(0, 0, 25)
	.word 0xb77da401  ! 462: MOVR_I	movre	%r22, 0x1, %r27
	.word 0xb32ca001  ! 468: SLL_I	sll 	%r18, 0x0001, %r25
	.word 0xb9520000  ! 469: RDPR_PIL	<illegal instruction>
	.word 0xbde5e155  ! 474: SAVE_I	save	%r23, 0x0001, %r30
	.word 0xb3e4a0bb  ! 475: SAVE_I	save	%r18, 0x0001, %r25
	.word 0xbde4a06f  ! 476: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xb3e521a7  ! 477: SAVE_I	save	%r20, 0x0001, %r25
	.word 0xbb504000  ! 478: RDPR_TNPC	<illegal instruction>
	.word 0xb4044000  ! 480: ADD_R	add 	%r17, %r0, %r26
	.word 0xb3480000  ! 481: RDHPR_HPSTATE	rdhpr	%hpstate, %r25
	.word 0xbde52152  ! 482: SAVE_I	save	%r20, 0x0001, %r30
hwintr_0_21:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_21), 16, 16)) -> intp(0, 0, 3e)
	.word 0xb3e5604e  ! 487: SAVE_I	save	%r21, 0x0001, %r25
	.word 0x8595e050  ! 491: WRPR_TSTATE_I	wrpr	%r23, 0x0050, %tstate
	.word 0xb7e5e0b8  ! 492: SAVE_I	save	%r23, 0x0001, %r27
	.word 0xb5e5603c  ! 493: SAVE_I	save	%r21, 0x0001, %r26
	.word 0x83942044  ! 497: WRPR_TNPC_I	wrpr	%r16, 0x0044, %tnpc
	.word 0x899421b7  ! 499: WRPR_TICK_I	wrpr	%r16, 0x01b7, %tick
	.word 0xb5e4e130  ! 500: SAVE_I	save	%r19, 0x0001, %r26
	.word 0x89946158  ! 506: WRPR_TICK_I	wrpr	%r17, 0x0158, %tick
hwintr_0_22:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_22), 16, 16)) -> intp(0, 0, 29)
	.word 0xbd50c000  ! 513: RDPR_TT	<illegal instruction>
	mov	0, %r12
	.word 0xa1930000  ! 515: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb7e4e00d  ! 516: SAVE_I	save	%r19, 0x0001, %r27
	.word 0xbfe4a0a1  ! 518: SAVE_I	save	%r18, 0x0001, %r31
	.word 0xb1e561b8  ! 521: SAVE_I	save	%r21, 0x0001, %r24
	.word 0xb1e5e068  ! 524: SAVE_I	save	%r23, 0x0001, %r24
	.word 0xbde5609b  ! 527: SAVE_I	save	%r21, 0x0001, %r30
	.word 0xb3e560bb  ! 532: SAVE_I	save	%r21, 0x0001, %r25
	setx	data_start_6, %g1, %r22
	.word 0xb5e52009  ! 537: SAVE_I	save	%r20, 0x0001, %r26
	.word 0x8994a1e7  ! 539: WRPR_TICK_I	wrpr	%r18, 0x01e7, %tick
	.word 0xb9480000  ! 542: RDHPR_HPSTATE	rdhpr	%hpstate, %r28
	.word 0xb9e4a083  ! 543: SAVE_I	save	%r18, 0x0001, %r28
	.word 0xbfe56125  ! 545: SAVE_I	save	%r21, 0x0001, %r31
	.word 0xb7e4e0a9  ! 552: SAVE_I	save	%r19, 0x0001, %r27
hwintr_0_23:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_23), 16, 16)) -> intp(0, 0, 1b)
	.word 0xb9e5a0b3  ! 555: SAVE_I	save	%r22, 0x0001, %r28
hwintr_0_24:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_24), 16, 16)) -> intp(0, 0, 1b)
	.word 0xb7e5617a  ! 560: SAVE_I	save	%r21, 0x0001, %r27
	.word 0xbfe46129  ! 561: SAVE_I	save	%r17, 0x0001, %r31
	.word 0xbd510000  ! 563: RDPR_TICK	<illegal instruction>
	.word 0xb1e5e01f  ! 566: SAVE_I	save	%r23, 0x0001, %r24
hwintr_0_25:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_25), 16, 16)) -> intp(0, 0, 30)
	.word 0xb9e4219c  ! 571: SAVE_I	save	%r16, 0x0001, %r28
	.word 0xbde4e177  ! 575: SAVE_I	save	%r19, 0x0001, %r30
	.word 0xb1e46172  ! 581: SAVE_I	save	%r17, 0x0001, %r24
hwintr_0_26:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_26), 16, 16)) -> intp(0, 0, 12)
	.word 0xbde5a1ff  ! 587: SAVE_I	save	%r22, 0x0001, %r30
	.word 0xb3e460b3  ! 593: SAVE_I	save	%r17, 0x0001, %r25
hwintr_0_27:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_27), 16, 16)) -> intp(0, 0, 1a)
	setx	0x7286a9a300004fda, %g1, %r10
	.word 0x819a8000  ! 595: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xb5e4e0f6  ! 596: SAVE_I	save	%r19, 0x0001, %r26
	mov	1, %r12
	.word 0xa1930000  ! 599: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xbde561b9  ! 600: SAVE_I	save	%r21, 0x0001, %r30
	.word 0x899520c5  ! 602: WRPR_TICK_I	wrpr	%r20, 0x00c5, %tick
	mov	2, %r12
	.word 0x8f930000  ! 607: WRPR_TL_R	wrpr	%r12, %r0, %tl
	setx	0xa089712b00000980, %g1, %r10
	.word 0x819a8000  ! 608: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xbfe4a19e  ! 611: SAVE_I	save	%r18, 0x0001, %r31
	.word 0xb9e521cf  ! 613: SAVE_I	save	%r20, 0x0001, %r28
	.word 0x91946166  ! 616: WRPR_PIL_I	wrpr	%r17, 0x0166, %pil
	.word 0xbd643801  ! 619: MOVcc_I	<illegal instruction>
	.word 0xb5e5a0b9  ! 622: SAVE_I	save	%r22, 0x0001, %r26
	.word 0x8394e1c8  ! 623: WRPR_TNPC_I	wrpr	%r19, 0x01c8, %tnpc
	.word 0xbbe46101  ! 627: SAVE_I	save	%r17, 0x0001, %r29
	.word 0xb5e460f6  ! 628: SAVE_I	save	%r17, 0x0001, %r26
	.word 0xb094a026  ! 631: ORcc_I	orcc 	%r18, 0x0026, %r24
	.word 0xb7e420b4  ! 634: SAVE_I	save	%r16, 0x0001, %r27
	.word 0xbe85e0f6  ! 638: ADDcc_I	addcc 	%r23, 0x00f6, %r31
	.word 0xb7e421ac  ! 641: SAVE_I	save	%r16, 0x0001, %r27
	.word 0xbde4e0a3  ! 642: SAVE_I	save	%r19, 0x0001, %r30
	.word 0xbfe461f8  ! 645: SAVE_I	save	%r17, 0x0001, %r31
	.word 0xb0840000  ! 647: ADDcc_R	addcc 	%r16, %r0, %r24
hwintr_0_28:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_28), 16, 16)) -> intp(0, 0, 26)
hwintr_0_29:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_29), 16, 16)) -> intp(0, 0, 36)
	setx	0x9759d8a00009e8d, %g1, %r10
	.word 0x819a8000  ! 654: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xb61d8000  ! 660: XOR_R	xor 	%r22, %r0, %r27
	.word 0xb6358000  ! 661: SUBC_R	orn 	%r22, %r0, %r27
hwintr_0_30:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_30), 16, 16)) -> intp(0, 0, 26)
	.word 0xb8a44000  ! 665: SUBcc_R	subcc 	%r17, %r0, %r28
	.word 0xbde5200d  ! 666: SAVE_I	save	%r20, 0x0001, %r30
	.word 0xbbe4a0dc  ! 672: SAVE_I	save	%r18, 0x0001, %r29
	.word 0xbbe4615a  ! 673: SAVE_I	save	%r17, 0x0001, %r29
	.word 0xb7e4e01f  ! 674: SAVE_I	save	%r19, 0x0001, %r27
	.word 0xbde5a09b  ! 676: SAVE_I	save	%r22, 0x0001, %r30
hwintr_0_31:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_31), 16, 16)) -> intp(0, 0, 30)
	.word 0x8994e103  ! 681: WRPR_TICK_I	wrpr	%r19, 0x0103, %tick
	.word 0xb1e42182  ! 682: SAVE_I	save	%r16, 0x0001, %r24
hwintr_0_32:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_32), 16, 16)) -> intp(0, 0, 2f)
	.word 0xb5e5e0d5  ! 688: SAVE_I	save	%r23, 0x0001, %r26
	.word 0xb3e560b7  ! 690: SAVE_I	save	%r21, 0x0001, %r25
	mov	2, %r12
	.word 0x8f930000  ! 691: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0x8795a13f  ! 697: WRPR_TT_I	wrpr	%r22, 0x013f, %tt
hwintr_0_33:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_33), 16, 16)) -> intp(0, 0, c)
	.word 0xbde46176  ! 699: SAVE_I	save	%r17, 0x0001, %r30
	.word 0xb3e42073  ! 705: SAVE_I	save	%r16, 0x0001, %r25
	.word 0xb1e5208e  ! 706: SAVE_I	save	%r20, 0x0001, %r24
	.word 0x8994a130  ! 708: WRPR_TICK_I	wrpr	%r18, 0x0130, %tick
	.word 0xb9e420f7  ! 711: SAVE_I	save	%r16, 0x0001, %r28
	.word 0xbbe4a056  ! 712: SAVE_I	save	%r18, 0x0001, %r29
	.word 0xb7e5e0a2  ! 713: SAVE_I	save	%r23, 0x0001, %r27
hwintr_0_34:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_34), 16, 16)) -> intp(0, 0, 37)
	.word 0xb5e461de  ! 717: SAVE_I	save	%r17, 0x0001, %r26
	.word 0xb7e42199  ! 718: SAVE_I	save	%r16, 0x0001, %r27
	.word 0xbbe4e060  ! 720: SAVE_I	save	%r19, 0x0001, %r29
	setx	0x1a2805f900004d0d, %g1, %r10
	.word 0x819a8000  ! 721: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xbb500000  ! 722: RDPR_TPC	<illegal instruction>
	.word 0xbfe5a16d  ! 728: SAVE_I	save	%r22, 0x0001, %r31
	.word 0xbfe46001  ! 730: SAVE_I	save	%r17, 0x0001, %r31
	.word 0xbde5609e  ! 732: SAVE_I	save	%r21, 0x0001, %r30
	mov	0, %r12
	.word 0xa1930000  ! 733: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb5e4e0aa  ! 734: SAVE_I	save	%r19, 0x0001, %r26
	.word 0xb7e56073  ! 735: SAVE_I	save	%r21, 0x0001, %r27
	.word 0x8795215c  ! 736: WRPR_TT_I	wrpr	%r20, 0x015c, %tt
	.word 0xb40ce1a5  ! 738: AND_I	and 	%r19, 0x01a5, %r26
	.word 0xb00d60ba  ! 739: AND_I	and 	%r21, 0x00ba, %r24
	.word 0xb1e5e0f5  ! 743: SAVE_I	save	%r23, 0x0001, %r24
	.word 0xb3e46033  ! 748: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xb9e5a0ff  ! 749: SAVE_I	save	%r22, 0x0001, %r28
	.word 0x9194a00f  ! 751: WRPR_PIL_I	wrpr	%r18, 0x000f, %pil
	.word 0x83956019  ! 755: WRPR_TNPC_I	wrpr	%r21, 0x0019, %tnpc
	.word 0xbe254000  ! 757: SUB_R	sub 	%r21, %r0, %r31
	.word 0xb7e52116  ! 759: SAVE_I	save	%r20, 0x0001, %r27
	.word 0xb9e4e164  ! 760: SAVE_I	save	%r19, 0x0001, %r28
	.word 0xb294e010  ! 761: ORcc_I	orcc 	%r19, 0x0010, %r25
	.word 0xb3e46054  ! 763: SAVE_I	save	%r17, 0x0001, %r25
hwintr_0_35:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_35), 16, 16)) -> intp(0, 0, 14)
	.word 0xb9e5e0da  ! 766: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xb3e5e0f3  ! 767: SAVE_I	save	%r23, 0x0001, %r25
hwintr_0_36:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_36), 16, 16)) -> intp(0, 0, 12)
	.word 0xb9e521c5  ! 773: SAVE_I	save	%r20, 0x0001, %r28
	.word 0xb5e42150  ! 775: SAVE_I	save	%r16, 0x0001, %r26
	.word 0xbde5a184  ! 776: SAVE_I	save	%r22, 0x0001, %r30
	.word 0xbde4e134  ! 780: SAVE_I	save	%r19, 0x0001, %r30
	.word 0xbde4a16e  ! 784: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xb3480000  ! 787: RDHPR_HPSTATE	rdhpr	%hpstate, %r25
	.word 0xb3e4e065  ! 789: SAVE_I	save	%r19, 0x0001, %r25
	.word 0xbde5219c  ! 790: SAVE_I	save	%r20, 0x0001, %r30
hwintr_0_37:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_37), 16, 16)) -> intp(0, 0, 22)
	.word 0xb1e4a190  ! 797: SAVE_I	save	%r18, 0x0001, %r24
	.word 0xbde42078  ! 801: SAVE_I	save	%r16, 0x0001, %r30
	.word 0xb5e5a19e  ! 803: SAVE_I	save	%r22, 0x0001, %r26
	.word 0xbfe461c2  ! 804: SAVE_I	save	%r17, 0x0001, %r31
	.word 0xb3e56062  ! 807: SAVE_I	save	%r21, 0x0001, %r25
hwintr_0_38:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_38), 16, 16)) -> intp(0, 0, 3)
	.word 0xb5344000  ! 814: SRL_R	srl 	%r17, %r0, %r26
	.word 0xb7e4e117  ! 817: SAVE_I	save	%r19, 0x0001, %r27
	.word 0xbfe4a122  ! 820: SAVE_I	save	%r18, 0x0001, %r31
	.word 0xb7e42098  ! 826: SAVE_I	save	%r16, 0x0001, %r27
	.word 0xb3e420ce  ! 827: SAVE_I	save	%r16, 0x0001, %r25
	.word 0xbbe4e025  ! 830: SAVE_I	save	%r19, 0x0001, %r29
	.word 0xbde56003  ! 837: SAVE_I	save	%r21, 0x0001, %r30
	.word 0xbbe5e10f  ! 838: SAVE_I	save	%r23, 0x0001, %r29
	setx	data_start_2, %g1, %r22
	.word 0xb5e4610d  ! 841: SAVE_I	save	%r17, 0x0001, %r26
	.word 0xbd500000  ! 849: RDPR_TPC	<illegal instruction>
	.word 0xbbe5611e  ! 851: SAVE_I	save	%r21, 0x0001, %r29
	.word 0xb7e42162  ! 856: SAVE_I	save	%r16, 0x0001, %r27
	.word 0xb7e5e1a7  ! 857: SAVE_I	save	%r23, 0x0001, %r27
	setx	data_start_6, %g1, %r21
	.word 0xbbe4e198  ! 861: SAVE_I	save	%r19, 0x0001, %r29
	.word 0xb1e42125  ! 863: SAVE_I	save	%r16, 0x0001, %r24
	.word 0x8594e102  ! 864: WRPR_TSTATE_I	wrpr	%r19, 0x0102, %tstate
	.word 0xbbe5e167  ! 867: SAVE_I	save	%r23, 0x0001, %r29
	setx	data_start_6, %g1, %r23
	.word 0xb9e5e112  ! 872: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xb1e5e0bb  ! 874: SAVE_I	save	%r23, 0x0001, %r24
	.word 0xbd508000  ! 876: RDPR_TSTATE	<illegal instruction>
hwintr_0_39:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_39), 16, 16)) -> intp(0, 0, e)
hwintr_0_40:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_40), 16, 16)) -> intp(0, 0, 27)
	.word 0x8d94e1c9  ! 893: WRPR_PSTATE_I	wrpr	%r19, 0x01c9, %pstate
	.word 0xb245e19c  ! 895: ADDC_I	addc 	%r23, 0x019c, %r25
	.word 0xb5e560ab  ! 896: SAVE_I	save	%r21, 0x0001, %r26
	.word 0xb1e4207c  ! 898: SAVE_I	save	%r16, 0x0001, %r24
	setx	data_start_1, %g1, %r23
	.word 0xbbe42189  ! 901: SAVE_I	save	%r16, 0x0001, %r29
	setx	0x827df3ca00007f9c, %g1, %r10
	.word 0x839a8000  ! 904: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0x839521ac  ! 911: WRPR_TNPC_I	wrpr	%r20, 0x01ac, %tnpc
	.word 0xbfe5e03b  ! 914: SAVE_I	save	%r23, 0x0001, %r31
	.word 0xb5510000  ! 915: RDPR_TICK	<illegal instruction>
hwintr_0_41:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_41), 16, 16)) -> intp(0, 0, 2e)
	.word 0xbbe5a12a  ! 926: SAVE_I	save	%r22, 0x0001, %r29
	.word 0xb9500000  ! 927: RDPR_TPC	<illegal instruction>
	.word 0xbfe56135  ! 936: SAVE_I	save	%r21, 0x0001, %r31
	setx	0x4b7ef3ac0000e802, %g1, %r10
	.word 0x819a8000  ! 938: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xb3e46129  ! 939: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xb3e4a0b6  ! 941: SAVE_I	save	%r18, 0x0001, %r25
	.word 0xb7e4e19f  ! 942: SAVE_I	save	%r19, 0x0001, %r27
hwintr_0_42:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_42), 16, 16)) -> intp(0, 0, 2e)
	setx	0x15f23bc90000fedc, %g1, %r10
	.word 0x819a8000  ! 950: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0x81956106  ! 951: WRPR_TPC_I	wrpr	%r21, 0x0106, %tpc
	.word 0x89956180  ! 953: WRPR_TICK_I	wrpr	%r21, 0x0180, %tick
	.word 0xbbe5602d  ! 954: SAVE_I	save	%r21, 0x0001, %r29
hwintr_0_43:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_43), 16, 16)) -> intp(0, 0, 3)
	.word 0xb6b58000  ! 956: ORNcc_R	orncc 	%r22, %r0, %r27
hwintr_0_44:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_44), 16, 16)) -> intp(0, 0, 38)
	.word 0xba048000  ! 959: ADD_R	add 	%r18, %r0, %r29
	.word 0xb9e52079  ! 960: SAVE_I	save	%r20, 0x0001, %r28
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb7e4a1d8  ! 963: SAVE_I	save	%r18, 0x0001, %r27
	setx	data_start_2, %g1, %r19
	.word 0x8194203e  ! 970: WRPR_TPC_I	wrpr	%r16, 0x003e, %tpc
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0x8394a09a  ! 976: WRPR_TNPC_I	wrpr	%r18, 0x009a, %tnpc
	setx	0x9c44718e00002b8c, %g1, %r10
	.word 0x839a8000  ! 980: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb9e46181  ! 981: SAVE_I	save	%r17, 0x0001, %r28
	.word 0xb5e5a03c  ! 982: SAVE_I	save	%r22, 0x0001, %r26
	.word 0xbf540000  ! 984: RDPR_GL	<illegal instruction>
	.word 0x83946150  ! 986: WRPR_TNPC_I	wrpr	%r17, 0x0150, %tnpc
	setx	data_start_4, %g1, %r18
	.word 0xbde560bb  ! 990: SAVE_I	save	%r21, 0x0001, %r30
	.word 0xb1e4a0dc  ! 996: SAVE_I	save	%r18, 0x0001, %r24
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
	.word 0xfc3d4000  ! 1: STD_R	std	%r30, [%r21 + %r0]
	.word 0xf0744000  ! 6: STX_R	stx	%r24, [%r17 + %r0]
	.word 0xb4a561ec  ! 10: SUBcc_I	subcc 	%r21, 0x01ec, %r26
	.word 0xf2744000  ! 11: STX_R	stx	%r25, [%r17 + %r0]
	.word 0xf42c8000  ! 13: STB_R	stb	%r26, [%r18 + %r0]
	.word 0x81946140  ! 15: WRPR_TPC_I	wrpr	%r17, 0x0140, %tpc
	.word 0xbb2ca001  ! 16: SLL_I	sll 	%r18, 0x0001, %r29
	.word 0xf82de18f  ! 20: STB_I	stb	%r28, [%r23 + 0x018f]
	.word 0xbb504000  ! 21: RDPR_TNPC	rdpr	%tnpc, %r29
	.word 0xfe74a14f  ! 23: STX_I	stx	%r31, [%r18 + 0x014f]
hwintr_3_0:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_0), 16, 16)) -> intp(3, 0, 22)
hwintr_3_1:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_1), 16, 16)) -> intp(3, 0, 30)
	.word 0x8595602e  ! 31: WRPR_TSTATE_I	wrpr	%r21, 0x002e, %tstate
	.word 0xf23ca0e9  ! 35: STD_I	std	%r25, [%r18 + 0x00e9]
	.word 0xfa258000  ! 37: STW_R	stw	%r29, [%r22 + %r0]
	.word 0xbb344000  ! 38: SRL_R	srl 	%r17, %r0, %r29
	.word 0xfb3d2004  ! 43: STDF_I	std	%f29, [0x0004, %r20]
	.word 0x8794a0ce  ! 44: WRPR_TT_I	wrpr	%r18, 0x00ce, %tt
	.word 0xbb2d7001  ! 45: SLLX_I	sllx	%r21, 0x0001, %r29
	.word 0xf624e02a  ! 47: STW_I	stw	%r27, [%r19 + 0x002a]
	setx	data_start_3, %g1, %r22
	.word 0xb750c000  ! 54: RDPR_TT	rdpr	%tt, %r27
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb1500000  ! 58: RDPR_TPC	<illegal instruction>
	.word 0xf62d211e  ! 62: STB_I	stb	%r27, [%r20 + 0x011e]
	.word 0xb48c61df  ! 65: ANDcc_I	andcc 	%r17, 0x01df, %r26
	.word 0xb4bd61dc  ! 67: XNORcc_I	xnorcc 	%r21, 0x01dc, %r26
	.word 0xf23d4000  ! 69: STD_R	std	%r25, [%r21 + %r0]
	setx	data_start_5, %g1, %r20
	.word 0xf825e09a  ! 74: STW_I	stw	%r28, [%r23 + 0x009a]
	.word 0xb57c0400  ! 77: MOVR_R	movre	%r16, %r0, %r26
	.word 0xfe2cc000  ! 79: STB_R	stb	%r31, [%r19 + %r0]
	.word 0xf82ca0d9  ! 80: STB_I	stb	%r28, [%r18 + 0x00d9]
	.word 0xb5510000  ! 82: RDPR_TICK	<illegal instruction>
	.word 0xb9480000  ! 86: RDHPR_HPSTATE	rdhpr	%hpstate, %r28
	.word 0xfb3c60cf  ! 87: STDF_I	std	%f29, [0x00cf, %r17]
	.word 0xfc2d209e  ! 90: STB_I	stb	%r30, [%r20 + 0x009e]
	.word 0x8995e166  ! 92: WRPR_TICK_I	wrpr	%r23, 0x0166, %tick
	.word 0xf53cc000  ! 94: STDF_R	std	%f26, [%r0, %r19]
	setx	data_start_4, %g1, %r18
	.word 0xfb3c217a  ! 101: STDF_I	std	%f29, [0x017a, %r16]
	.word 0xfe74c000  ! 102: STX_R	stx	%r31, [%r19 + %r0]
	.word 0xbd2d8000  ! 108: SLL_R	sll 	%r22, %r0, %r30
	.word 0xba3c8000  ! 109: XNOR_R	xnor 	%r18, %r0, %r29
hwintr_3_2:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_2), 16, 16)) -> intp(3, 0, 2a)
hwintr_3_3:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_3), 16, 16)) -> intp(3, 0, 1a)
	.word 0xf074a101  ! 112: STX_I	stx	%r24, [%r18 + 0x0101]
	.word 0xfa254000  ! 117: STW_R	stw	%r29, [%r21 + %r0]
	.word 0xf434a040  ! 120: STH_I	sth	%r26, [%r18 + 0x0040]
	.word 0xb5480000  ! 123: RDHPR_HPSTATE	rdhpr	%hpstate, %r26
	.word 0xb2950000  ! 124: ORcc_R	orcc 	%r20, %r0, %r25
	.word 0x8d94613b  ! 128: WRPR_PSTATE_I	wrpr	%r17, 0x013b, %pstate
hwintr_3_4:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_4), 16, 16)) -> intp(3, 0, 1b)
	.word 0xb205a17c  ! 130: ADD_I	add 	%r22, 0x017c, %r25
	.word 0xf434c000  ! 131: STH_R	sth	%r26, [%r19 + %r0]
	.word 0xbf540000  ! 135: RDPR_GL	rdpr	%-, %r31
	.word 0xf424c000  ! 136: STW_R	stw	%r26, [%r19 + %r0]
	.word 0xb7504000  ! 137: RDPR_TNPC	<illegal instruction>
	.word 0xfe74a160  ! 139: STX_I	stx	%r31, [%r18 + 0x0160]
	.word 0xb73c7001  ! 142: SRAX_I	srax	%r17, 0x0001, %r27
	.word 0x8795e05f  ! 143: WRPR_TT_I	wrpr	%r23, 0x005f, %tt
	.word 0xff3c21f6  ! 144: STDF_I	std	%f31, [0x01f6, %r16]
	.word 0xb4458000  ! 147: ADDC_R	addc 	%r22, %r0, %r26
	.word 0xfe2d8000  ! 151: STB_R	stb	%r31, [%r22 + %r0]
	.word 0xf22520d8  ! 152: STW_I	stw	%r25, [%r20 + 0x00d8]
	setx	data_start_4, %g1, %r18
	.word 0xb03d4000  ! 157: XNOR_R	xnor 	%r21, %r0, %r24
	.word 0xf8744000  ! 160: STX_R	stx	%r28, [%r17 + %r0]
	.word 0xf434a1cf  ! 161: STH_I	sth	%r26, [%r18 + 0x01cf]
	.word 0xfe2dc000  ! 164: STB_R	stb	%r31, [%r23 + %r0]
	.word 0xb7520000  ! 167: RDPR_PIL	rdpr	%pil, %r27
	.word 0xf2740000  ! 172: STX_R	stx	%r25, [%r16 + %r0]
	.word 0xf0254000  ! 173: STW_R	stw	%r24, [%r21 + %r0]
hwintr_3_5:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_5), 16, 16)) -> intp(3, 0, b)
	.word 0xf02d4000  ! 177: STB_R	stb	%r24, [%r21 + %r0]
hwintr_3_6:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_6), 16, 16)) -> intp(3, 0, 6)
	.word 0xfc240000  ! 179: STW_R	stw	%r30, [%r16 + %r0]
	.word 0xba8520d0  ! 180: ADDcc_I	addcc 	%r20, 0x00d0, %r29
	.word 0xf22d0000  ! 181: STB_R	stb	%r25, [%r20 + %r0]
	.word 0xbb480000  ! 182: RDHPR_HPSTATE	rdhpr	%hpstate, %r29
hwintr_3_7:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_7), 16, 16)) -> intp(3, 0, 23)
	.word 0xf075c000  ! 188: STX_R	stx	%r24, [%r23 + %r0]
	.word 0xfe3ce0fb  ! 189: STD_I	std	%r31, [%r19 + 0x00fb]
	.word 0xbe2c4000  ! 195: ANDN_R	andn 	%r17, %r0, %r31
hwintr_3_8:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_8), 16, 16)) -> intp(3, 0, 12)
	.word 0x8d9421b7  ! 204: WRPR_PSTATE_I	wrpr	%r16, 0x01b7, %pstate
hwintr_3_9:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_9), 16, 16)) -> intp(3, 0, 9)
	.word 0xba0c8000  ! 209: AND_R	and 	%r18, %r0, %r29
	.word 0xfe2de11f  ! 211: STB_I	stb	%r31, [%r23 + 0x011f]
	.word 0x8d942045  ! 212: WRPR_PSTATE_I	wrpr	%r16, 0x0045, %pstate
	setx	data_start_4, %g1, %r17
	.word 0xf834e0eb  ! 217: STH_I	sth	%r28, [%r19 + 0x00eb]
	.word 0xfe350000  ! 219: STH_R	sth	%r31, [%r20 + %r0]
	.word 0x8395218f  ! 221: WRPR_TNPC_I	wrpr	%r20, 0x018f, %tnpc
	setx	0x42c250b600002f5b, %g1, %r10
	.word 0x819a8000  ! 223: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xfc358000  ! 224: STH_R	sth	%r30, [%r22 + %r0]
	.word 0xb7510000  ! 228: RDPR_TICK	rdpr	%tick, %r27
	.word 0xbe9c0000  ! 229: XORcc_R	xorcc 	%r16, %r0, %r31
	.word 0xbab40000  ! 230: SUBCcc_R	orncc 	%r16, %r0, %r29
	mov	2, %r12
	.word 0xa1930000  ! 236: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xfa75e1ca  ! 238: STX_I	stx	%r29, [%r23 + 0x01ca]
	.word 0xb9357001  ! 239: SRLX_I	srlx	%r21, 0x0001, %r28
	.word 0xf13de16b  ! 240: STDF_I	std	%f24, [0x016b, %r23]
	.word 0xfc244000  ! 243: STW_R	stw	%r30, [%r17 + %r0]
	.word 0xfe3c0000  ! 245: STD_R	std	%r31, [%r16 + %r0]
	mov	2, %r12
	.word 0xa1930000  ! 246: WRPR_GL_R	wrpr	%r12, %r0, %-
	mov	2, %r12
	.word 0xa1930000  ! 247: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xf03461be  ! 248: STH_I	sth	%r24, [%r17 + 0x01be]
	setx	0x662727880000fa03, %g1, %r10
	.word 0x839a8000  ! 251: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb8456164  ! 259: ADDC_I	addc 	%r21, 0x0164, %r28
	.word 0xb0150000  ! 262: OR_R	or 	%r20, %r0, %r24
	.word 0xf475e1b2  ! 270: STX_I	stx	%r26, [%r23 + 0x01b2]
	.word 0xb425a02f  ! 271: SUB_I	sub 	%r22, 0x002f, %r26
hwintr_3_10:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_10), 16, 16)) -> intp(3, 0, 19)
hwintr_3_11:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_11), 16, 16)) -> intp(3, 0, 22)
	.word 0xb9520000  ! 275: RDPR_PIL	rdpr	%pil, %r28
	.word 0xbb510000  ! 277: RDPR_TICK	<illegal instruction>
	.word 0x839520df  ! 278: WRPR_TNPC_I	wrpr	%r20, 0x00df, %tnpc
hwintr_3_12:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_12), 16, 16)) -> intp(3, 0, 35)
	setx	data_start_3, %g1, %r21
	.word 0x8195a17d  ! 288: WRPR_TPC_I	wrpr	%r22, 0x017d, %tpc
	.word 0x8794e1f9  ! 289: WRPR_TT_I	wrpr	%r19, 0x01f9, %tt
	.word 0xbf504000  ! 291: RDPR_TNPC	rdpr	%tnpc, %r31
	mov	2, %r12
	.word 0x8f930000  ! 292: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xbd500000  ! 296: RDPR_TPC	rdpr	%tpc, %r30
	mov	1, %r12
	.word 0xa1930000  ! 298: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xbc14203f  ! 304: OR_I	or 	%r16, 0x003f, %r30
	.word 0xf82c4000  ! 309: STB_R	stb	%r28, [%r17 + %r0]
	.word 0xb5480000  ! 310: RDHPR_HPSTATE	rdhpr	%hpstate, %r26
hwintr_3_13:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_13), 16, 16)) -> intp(3, 0, 2d)
hwintr_3_14:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_14), 16, 16)) -> intp(3, 0, 32)
	setx	data_start_1, %g1, %r19
hwintr_3_15:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_15), 16, 16)) -> intp(3, 0, 6)
	.word 0xfc354000  ! 324: STH_R	sth	%r30, [%r21 + %r0]
	.word 0xf474e07e  ! 326: STX_I	stx	%r26, [%r19 + 0x007e]
	.word 0x8195a059  ! 327: WRPR_TPC_I	wrpr	%r22, 0x0059, %tpc
	.word 0xbb520000  ! 328: RDPR_PIL	rdpr	%pil, %r29
	.word 0xba142198  ! 330: OR_I	or 	%r16, 0x0198, %r29
	.word 0xb4b4a01e  ! 331: SUBCcc_I	orncc 	%r18, 0x001e, %r26
	.word 0xb37ca401  ! 334: MOVR_I	movre	%r18, 0x1, %r25
	.word 0xfc34c000  ! 335: STH_R	sth	%r30, [%r19 + %r0]
	.word 0xfa2d4000  ! 336: STB_R	stb	%r29, [%r21 + %r0]
	.word 0xbcbcc000  ! 343: XNORcc_R	xnorcc 	%r19, %r0, %r30
	.word 0xbb3d1000  ! 345: SRAX_R	srax	%r20, %r0, %r29
	.word 0xf82ce0e1  ! 348: STB_I	stb	%r28, [%r19 + 0x00e1]
	.word 0xb1480000  ! 349: RDHPR_HPSTATE	rdhpr	%hpstate, %r24
	.word 0xb33cc000  ! 350: SRA_R	sra 	%r19, %r0, %r25
	.word 0xf6240000  ! 354: STW_R	stw	%r27, [%r16 + %r0]
hwintr_3_16:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_16), 16, 16)) -> intp(3, 0, f)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb8ad4000  ! 364: ANDNcc_R	andncc 	%r21, %r0, %r28
	.word 0xbe340000  ! 366: ORN_R	orn 	%r16, %r0, %r31
	.word 0xfe3da0b9  ! 367: STD_I	std	%r31, [%r22 + 0x00b9]
	.word 0xfe2d0000  ! 371: STB_R	stb	%r31, [%r20 + %r0]
	.word 0xb2b4a191  ! 373: ORNcc_I	orncc 	%r18, 0x0191, %r25
	.word 0xbf50c000  ! 374: RDPR_TT	<illegal instruction>
	.word 0xb5357001  ! 375: SRLX_I	srlx	%r21, 0x0001, %r26
	.word 0xfc2cc000  ! 378: STB_R	stb	%r30, [%r19 + %r0]
	.word 0xf02c212f  ! 380: STB_I	stb	%r24, [%r16 + 0x012f]
hwintr_3_17:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_17), 16, 16)) -> intp(3, 0, 2e)
	.word 0xf83d4000  ! 391: STD_R	std	%r28, [%r21 + %r0]
	.word 0xfa2d618f  ! 393: STB_I	stb	%r29, [%r21 + 0x018f]
	.word 0xb5500000  ! 394: RDPR_TPC	<illegal instruction>
	.word 0xf33d6071  ! 395: STDF_I	std	%f25, [0x0071, %r21]
	.word 0xf23de1fa  ! 396: STD_I	std	%r25, [%r23 + 0x01fa]
	.word 0xf624a110  ! 397: STW_I	stw	%r27, [%r18 + 0x0110]
	.word 0x8395616a  ! 399: WRPR_TNPC_I	wrpr	%r21, 0x016a, %tnpc
	.word 0xf22de1c6  ! 401: STB_I	stb	%r25, [%r23 + 0x01c6]
	.word 0xfe2de103  ! 402: STB_I	stb	%r31, [%r23 + 0x0103]
	.word 0x9194a140  ! 403: WRPR_PIL_I	wrpr	%r18, 0x0140, %pil
	.word 0xf83ca0c9  ! 404: STD_I	std	%r28, [%r18 + 0x00c9]
	.word 0xf82c616b  ! 408: STB_I	stb	%r28, [%r17 + 0x016b]
	.word 0xf22c21eb  ! 409: STB_I	stb	%r25, [%r16 + 0x01eb]
	.word 0xfa3ca00e  ! 412: STD_I	std	%r29, [%r18 + 0x000e]
	.word 0xb7500000  ! 421: RDPR_TPC	rdpr	%tpc, %r27
	.word 0xfe2c0000  ! 422: STB_R	stb	%r31, [%r16 + %r0]
	.word 0xf62d6081  ! 425: STB_I	stb	%r27, [%r21 + 0x0081]
hwintr_3_18:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_18), 16, 16)) -> intp(3, 0, 2c)
	.word 0xff3cc000  ! 428: STDF_R	std	%f31, [%r0, %r19]
	.word 0xf43c0000  ! 430: STD_R	std	%r26, [%r16 + %r0]
	.word 0xf63c4000  ! 431: STD_R	std	%r27, [%r17 + %r0]
	.word 0xbab5a0dd  ! 434: ORNcc_I	orncc 	%r22, 0x00dd, %r29
	.word 0xb9508000  ! 439: RDPR_TSTATE	<illegal instruction>
	.word 0xbe952104  ! 440: ORcc_I	orcc 	%r20, 0x0104, %r31
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
hwintr_3_19:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_19), 16, 16)) -> intp(3, 0, 37)
	.word 0xfb3c0000  ! 443: STDF_R	std	%f29, [%r0, %r16]
	.word 0xfc754000  ! 444: STX_R	stx	%r30, [%r21 + %r0]
	.word 0xfe74a125  ! 452: STX_I	stx	%r31, [%r18 + 0x0125]
	.word 0xfa24c000  ! 458: STW_R	stw	%r29, [%r19 + %r0]
	.word 0xf42c206e  ! 460: STB_I	stb	%r26, [%r16 + 0x006e]
hwintr_3_20:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_20), 16, 16)) -> intp(3, 0, 30)
	.word 0xb17da401  ! 462: MOVR_I	movre	%r22, 0x1, %r24
	.word 0xf62c213b  ! 465: STB_I	stb	%r27, [%r16 + 0x013b]
	.word 0xf824c000  ! 466: STW_R	stw	%r28, [%r19 + %r0]
	.word 0xb32de001  ! 468: SLL_I	sll 	%r23, 0x0001, %r25
	.word 0xb7520000  ! 469: RDPR_PIL	<illegal instruction>
	.word 0xf73de0a8  ! 470: STDF_I	std	%f27, [0x00a8, %r23]
	.word 0xfa3ca1a6  ! 471: STD_I	std	%r29, [%r18 + 0x01a6]
	.word 0xbb504000  ! 478: RDPR_TNPC	<illegal instruction>
	.word 0xf33d8000  ! 479: STDF_R	std	%f25, [%r0, %r22]
	.word 0xba058000  ! 480: ADD_R	add 	%r22, %r0, %r29
	.word 0xbb480000  ! 481: RDHPR_HPSTATE	rdhpr	%hpstate, %r29
hwintr_3_21:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_21), 16, 16)) -> intp(3, 0, 25)
	.word 0xf6758000  ! 489: STX_R	stx	%r27, [%r22 + %r0]
	.word 0xf93cc000  ! 490: STDF_R	std	%f28, [%r0, %r19]
	.word 0x859420a7  ! 491: WRPR_TSTATE_I	wrpr	%r16, 0x00a7, %tstate
	.word 0xfe3c0000  ! 494: STD_R	std	%r31, [%r16 + %r0]
	.word 0xfc3dc000  ! 496: STD_R	std	%r30, [%r23 + %r0]
	.word 0x8394e0e2  ! 497: WRPR_TNPC_I	wrpr	%r19, 0x00e2, %tnpc
	.word 0x89946044  ! 499: WRPR_TICK_I	wrpr	%r17, 0x0044, %tick
	.word 0xfc3cc000  ! 504: STD_R	std	%r30, [%r19 + %r0]
	.word 0x89956124  ! 506: WRPR_TICK_I	wrpr	%r21, 0x0124, %tick
	.word 0xfe344000  ! 507: STH_R	sth	%r31, [%r17 + %r0]
hwintr_3_22:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_22), 16, 16)) -> intp(3, 0, 32)
	.word 0xf53d6002  ! 510: STDF_I	std	%f26, [0x0002, %r21]
	.word 0xbd50c000  ! 513: RDPR_TT	rdpr	%tt, %r30
	mov	2, %r12
	.word 0xa1930000  ! 515: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xf93c4000  ! 525: STDF_R	std	%f28, [%r0, %r17]
	.word 0xf8252088  ! 530: STW_I	stw	%r28, [%r20 + 0x0088]
	setx	data_start_0, %g1, %r17
	.word 0xfd3d2077  ! 535: STDF_I	std	%f30, [0x0077, %r20]
	.word 0xfa75e17a  ! 538: STX_I	stx	%r29, [%r23 + 0x017a]
	.word 0x89946174  ! 539: WRPR_TICK_I	wrpr	%r17, 0x0174, %tick
	.word 0xb9480000  ! 542: RDHPR_HPSTATE	rdhpr	%hpstate, %r28
	.word 0xfb3de0b3  ! 544: STDF_I	std	%f29, [0x00b3, %r23]
	.word 0xf63c216f  ! 547: STD_I	std	%r27, [%r16 + 0x016f]
	.word 0xf62d60b5  ! 548: STB_I	stb	%r27, [%r21 + 0x00b5]
	.word 0xf424a06e  ! 549: STW_I	stw	%r26, [%r18 + 0x006e]
	.word 0xf22d4000  ! 551: STB_R	stb	%r25, [%r21 + %r0]
hwintr_3_23:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_23), 16, 16)) -> intp(3, 0, 7)
hwintr_3_24:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_24), 16, 16)) -> intp(3, 0, 22)
	.word 0xf82c4000  ! 558: STB_R	stb	%r28, [%r17 + %r0]
	.word 0xfe75e1c1  ! 562: STX_I	stx	%r31, [%r23 + 0x01c1]
	.word 0xb5510000  ! 563: RDPR_TICK	rdpr	%tick, %r26
	.word 0xfa74e0ae  ! 565: STX_I	stx	%r29, [%r19 + 0x00ae]
hwintr_3_25:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_25), 16, 16)) -> intp(3, 0, 3f)
	.word 0xf034a1f9  ! 569: STH_I	sth	%r24, [%r18 + 0x01f9]
	.word 0xfe25e0ff  ! 573: STW_I	stw	%r31, [%r23 + 0x00ff]
	.word 0xf674c000  ! 579: STX_R	stx	%r27, [%r19 + %r0]
	.word 0xf2750000  ! 583: STX_R	stx	%r25, [%r20 + %r0]
hwintr_3_26:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_26), 16, 16)) -> intp(3, 0, 10)
	.word 0xfc2ce158  ! 586: STB_I	stb	%r30, [%r19 + 0x0158]
	.word 0xf22d0000  ! 592: STB_R	stb	%r25, [%r20 + %r0]
hwintr_3_27:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_27), 16, 16)) -> intp(3, 0, 32)
	setx	0x2439103d0000d98d, %g1, %r10
	.word 0x819a8000  ! 595: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	mov	1, %r12
	.word 0xa1930000  ! 599: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0x899520c5  ! 602: WRPR_TICK_I	wrpr	%r20, 0x00c5, %tick
	.word 0xfe254000  ! 606: STW_R	stw	%r31, [%r21 + %r0]
	mov	1, %r12
	.word 0x8f930000  ! 607: WRPR_TL_R	wrpr	%r12, %r0, %tl
	setx	0xd4cb32880000f810, %g1, %r10
	.word 0x819a8000  ! 608: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xfc74a04c  ! 610: STX_I	stx	%r30, [%r18 + 0x004c]
	.word 0xf434e13f  ! 612: STH_I	sth	%r26, [%r19 + 0x013f]
	.word 0xf03d4000  ! 614: STD_R	std	%r24, [%r21 + %r0]
	.word 0xfa3d6160  ! 615: STD_I	std	%r29, [%r21 + 0x0160]
	.word 0x9194a132  ! 616: WRPR_PIL_I	wrpr	%r18, 0x0132, %pil
	.word 0xfa3d0000  ! 617: STD_R	std	%r29, [%r20 + %r0]
	.word 0xb3643801  ! 619: MOVcc_I	<illegal instruction>
	.word 0xf6740000  ! 620: STX_R	stx	%r27, [%r16 + %r0]
	.word 0x8395e0e8  ! 623: WRPR_TNPC_I	wrpr	%r23, 0x00e8, %tnpc
	.word 0xfc356199  ! 629: STH_I	sth	%r30, [%r21 + 0x0199]
	.word 0xf2250000  ! 630: STW_R	stw	%r25, [%r20 + %r0]
	.word 0xb89520c1  ! 631: ORcc_I	orcc 	%r20, 0x00c1, %r28
	.word 0xf43d8000  ! 633: STD_R	std	%r26, [%r22 + %r0]
	.word 0xf6248000  ! 635: STW_R	stw	%r27, [%r18 + %r0]
	.word 0xb6842045  ! 638: ADDcc_I	addcc 	%r16, 0x0045, %r27
	.word 0xfc2da0d7  ! 640: STB_I	stb	%r30, [%r22 + 0x00d7]
	.word 0xb2848000  ! 647: ADDcc_R	addcc 	%r18, %r0, %r25
	.word 0xf824c000  ! 648: STW_R	stw	%r28, [%r19 + %r0]
hwintr_3_28:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_28), 16, 16)) -> intp(3, 0, 13)
hwintr_3_29:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_29), 16, 16)) -> intp(3, 0, 15)
	setx	0xe2660a480000fad7, %g1, %r10
	.word 0x819a8000  ! 654: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xf0244000  ! 657: STW_R	stw	%r24, [%r17 + %r0]
	.word 0xba1d0000  ! 660: XOR_R	xor 	%r20, %r0, %r29
	.word 0xb0348000  ! 661: SUBC_R	orn 	%r18, %r0, %r24
hwintr_3_30:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_30), 16, 16)) -> intp(3, 0, b)
	.word 0xf02dc000  ! 664: STB_R	stb	%r24, [%r23 + %r0]
	.word 0xbea50000  ! 665: SUBcc_R	subcc 	%r20, %r0, %r31
	.word 0xf63dc000  ! 671: STD_R	std	%r27, [%r23 + %r0]
	.word 0xfe24c000  ! 677: STW_R	stw	%r31, [%r19 + %r0]
hwintr_3_31:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_31), 16, 16)) -> intp(3, 0, 27)
	.word 0x8995e1ca  ! 681: WRPR_TICK_I	wrpr	%r23, 0x01ca, %tick
hwintr_3_32:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_32), 16, 16)) -> intp(3, 0, 0)
	.word 0xf53d617e  ! 684: STDF_I	std	%f26, [0x017e, %r21]
	mov	2, %r12
	.word 0x8f930000  ! 691: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xf0354000  ! 694: STH_R	sth	%r24, [%r21 + %r0]
	.word 0x8795e0d9  ! 697: WRPR_TT_I	wrpr	%r23, 0x00d9, %tt
hwintr_3_33:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_33), 16, 16)) -> intp(3, 0, d)
	.word 0xf435a1f5  ! 701: STH_I	sth	%r26, [%r22 + 0x01f5]
	.word 0x8994a1c5  ! 708: WRPR_TICK_I	wrpr	%r18, 0x01c5, %tick
	.word 0xfa754000  ! 710: STX_R	stx	%r29, [%r21 + %r0]
	.word 0xf43d6067  ! 714: STD_I	std	%r26, [%r21 + 0x0067]
hwintr_3_34:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_34), 16, 16)) -> intp(3, 0, b)
	.word 0xf4352124  ! 719: STH_I	sth	%r26, [%r20 + 0x0124]
	setx	0x6fd856be0000eb51, %g1, %r10
	.word 0x819a8000  ! 721: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xbb500000  ! 722: RDPR_TPC	rdpr	%tpc, %r29
	.word 0xfe344000  ! 725: STH_R	sth	%r31, [%r17 + %r0]
	.word 0xf6256012  ! 726: STW_I	stw	%r27, [%r21 + 0x0012]
	.word 0xfc75e154  ! 731: STX_I	stx	%r30, [%r23 + 0x0154]
	mov	2, %r12
	.word 0xa1930000  ! 733: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0x87952097  ! 736: WRPR_TT_I	wrpr	%r20, 0x0097, %tt
	.word 0xb60ca0c5  ! 738: AND_I	and 	%r18, 0x00c5, %r27
	.word 0xb40de19f  ! 739: AND_I	and 	%r23, 0x019f, %r26
	.word 0xf8344000  ! 745: STH_R	sth	%r28, [%r17 + %r0]
	.word 0x91942135  ! 751: WRPR_PIL_I	wrpr	%r16, 0x0135, %pil
	.word 0x83942093  ! 755: WRPR_TNPC_I	wrpr	%r16, 0x0093, %tnpc
	.word 0xbc24c000  ! 757: SUB_R	sub 	%r19, %r0, %r30
	.word 0xf03d611d  ! 758: STD_I	std	%r24, [%r21 + 0x011d]
	.word 0xbe9461c4  ! 761: ORcc_I	orcc 	%r17, 0x01c4, %r31
hwintr_3_35:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_35), 16, 16)) -> intp(3, 0, 20)
hwintr_3_36:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_36), 16, 16)) -> intp(3, 0, 2e)
	.word 0xfc244000  ! 777: STW_R	stw	%r30, [%r17 + %r0]
	.word 0xb3480000  ! 787: RDHPR_HPSTATE	rdhpr	%hpstate, %r25
hwintr_3_37:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_37), 16, 16)) -> intp(3, 0, 1e)
	.word 0xfe240000  ! 796: STW_R	stw	%r31, [%r16 + %r0]
	.word 0xf62dc000  ! 798: STB_R	stb	%r27, [%r23 + %r0]
	.word 0xf6248000  ! 802: STW_R	stw	%r27, [%r18 + %r0]
	.word 0xf53de1b8  ! 808: STDF_I	std	%f26, [0x01b8, %r23]
	.word 0xf22d21be  ! 809: STB_I	stb	%r25, [%r20 + 0x01be]
hwintr_3_38:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_38), 16, 16)) -> intp(3, 0, 23)
	.word 0xf874e0f1  ! 812: STX_I	stx	%r28, [%r19 + 0x00f1]
	.word 0xb5348000  ! 814: SRL_R	srl 	%r18, %r0, %r26
	.word 0xfb3ce10a  ! 816: STDF_I	std	%f29, [0x010a, %r19]
	.word 0xf33d8000  ! 821: STDF_R	std	%f25, [%r0, %r22]
	.word 0xfc3c4000  ! 822: STD_R	std	%r30, [%r17 + %r0]
	.word 0xf62c2038  ! 825: STB_I	stb	%r27, [%r16 + 0x0038]
	.word 0xfa24c000  ! 832: STW_R	stw	%r29, [%r19 + %r0]
	.word 0xf635a07d  ! 833: STH_I	sth	%r27, [%r22 + 0x007d]
	.word 0xfe258000  ! 835: STW_R	stw	%r31, [%r22 + %r0]
	setx	data_start_2, %g1, %r17
	.word 0xf2350000  ! 842: STH_R	sth	%r25, [%r20 + %r0]
	.word 0xff3d8000  ! 844: STDF_R	std	%f31, [%r0, %r22]
	.word 0xbf500000  ! 849: RDPR_TPC	<illegal instruction>
	.word 0xf82521b9  ! 853: STW_I	stw	%r28, [%r20 + 0x01b9]
	.word 0xfa258000  ! 854: STW_R	stw	%r29, [%r22 + %r0]
	setx	data_start_3, %g1, %r21
	.word 0x8594203a  ! 864: WRPR_TSTATE_I	wrpr	%r16, 0x003a, %tstate
	.word 0xf63de14a  ! 869: STD_I	std	%r27, [%r23 + 0x014a]
	setx	data_start_7, %g1, %r17
	.word 0xfa2c0000  ! 873: STB_R	stb	%r29, [%r16 + %r0]
	.word 0xfe25a0d2  ! 875: STW_I	stw	%r31, [%r22 + 0x00d2]
	.word 0xb1508000  ! 876: RDPR_TSTATE	rdpr	%tstate, %r24
	.word 0xfc35a02d  ! 877: STH_I	sth	%r30, [%r22 + 0x002d]
	.word 0xf83ca06c  ! 883: STD_I	std	%r28, [%r18 + 0x006c]
hwintr_3_39:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_39), 16, 16)) -> intp(3, 0, 1f)
	.word 0xf834e107  ! 889: STH_I	sth	%r28, [%r19 + 0x0107]
hwintr_3_40:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_40), 16, 16)) -> intp(3, 0, 13)
	.word 0xf275e1ae  ! 892: STX_I	stx	%r25, [%r23 + 0x01ae]
	.word 0x8d9521b9  ! 893: WRPR_PSTATE_I	wrpr	%r20, 0x01b9, %pstate
	.word 0xf6244000  ! 894: STW_R	stw	%r27, [%r17 + %r0]
	.word 0xb2456033  ! 895: ADDC_I	addc 	%r21, 0x0033, %r25
	setx	data_start_7, %g1, %r18
	setx	0x6d5d67b900004f50, %g1, %r10
	.word 0x839a8000  ! 904: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xfc744000  ! 907: STX_R	stx	%r30, [%r17 + %r0]
	.word 0xf93d0000  ! 908: STDF_R	std	%f28, [%r0, %r20]
	.word 0xfc350000  ! 909: STH_R	sth	%r30, [%r20 + %r0]
	.word 0x8395a057  ! 911: WRPR_TNPC_I	wrpr	%r22, 0x0057, %tnpc
	.word 0xb1510000  ! 915: RDPR_TICK	rdpr	%tick, %r24
	.word 0xf82de040  ! 917: STB_I	stb	%r28, [%r23 + 0x0040]
hwintr_3_41:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_41), 16, 16)) -> intp(3, 0, 7)
	.word 0xf22c0000  ! 922: STB_R	stb	%r25, [%r16 + %r0]
	.word 0xfc75a116  ! 923: STX_I	stx	%r30, [%r22 + 0x0116]
	.word 0xfe2da0db  ! 925: STB_I	stb	%r31, [%r22 + 0x00db]
	.word 0xbb500000  ! 927: RDPR_TPC	<illegal instruction>
	.word 0xfa24e0ef  ! 929: STW_I	stw	%r29, [%r19 + 0x00ef]
	.word 0xfc756094  ! 931: STX_I	stx	%r30, [%r21 + 0x0094]
	.word 0xfa3d60db  ! 932: STD_I	std	%r29, [%r21 + 0x00db]
	.word 0xfc34207c  ! 937: STH_I	sth	%r30, [%r16 + 0x007c]
	setx	0x3402479b0000f9c4, %g1, %r10
	.word 0x819a8000  ! 938: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xf53de026  ! 943: STDF_I	std	%f26, [0x0026, %r23]
	.word 0xfa75c000  ! 944: STX_R	stx	%r29, [%r23 + %r0]
hwintr_3_42:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_42), 16, 16)) -> intp(3, 0, 1e)
	.word 0xfb3ce09b  ! 947: STDF_I	std	%f29, [0x009b, %r19]
	.word 0xf6250000  ! 948: STW_R	stw	%r27, [%r20 + %r0]
	setx	0x8b8e571b00003fdb, %g1, %r10
	.word 0x819a8000  ! 950: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0x8194604a  ! 951: WRPR_TPC_I	wrpr	%r17, 0x004a, %tpc
	.word 0xfd3de19c  ! 952: STDF_I	std	%f30, [0x019c, %r23]
	.word 0x899420c5  ! 953: WRPR_TICK_I	wrpr	%r16, 0x00c5, %tick
hwintr_3_43:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_43), 16, 16)) -> intp(3, 0, 23)
	.word 0xb6b44000  ! 956: ORNcc_R	orncc 	%r17, %r0, %r27
hwintr_3_44:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_44), 16, 16)) -> intp(3, 0, 2f)
	.word 0xb0040000  ! 959: ADD_R	add 	%r16, %r0, %r24
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xfb3d60b8  ! 965: STDF_I	std	%f29, [0x00b8, %r21]
	.word 0xfc240000  ! 967: STW_R	stw	%r30, [%r16 + %r0]
	setx	data_start_4, %g1, %r23
	.word 0x819420da  ! 970: WRPR_TPC_I	wrpr	%r16, 0x00da, %tpc
	.word 0xf4352085  ! 972: STH_I	sth	%r26, [%r20 + 0x0085]
	.word 0xf2740000  ! 973: STX_R	stx	%r25, [%r16 + %r0]
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0x8395a14e  ! 976: WRPR_TNPC_I	wrpr	%r22, 0x014e, %tnpc
	setx	0xe916c48300000b51, %g1, %r10
	.word 0x839a8000  ! 980: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xbd540000  ! 984: RDPR_GL	rdpr	%-, %r30
	.word 0x8395e1cb  ! 986: WRPR_TNPC_I	wrpr	%r23, 0x01cb, %tnpc
	setx	data_start_1, %g1, %r20
	.word 0xfa246187  ! 988: STW_I	stw	%r29, [%r17 + 0x0187]
	.word 0xfe258000  ! 995: STW_R	stw	%r31, [%r22 + %r0]
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
	.word 0xf85560aa  ! 4: LDSH_I	ldsh	[%r21 + 0x00aa], %r28
	.word 0xfa1d0000  ! 7: LDD_R	ldd	[%r20 + %r0], %r29
	.word 0xbca5a04b  ! 10: SUBcc_I	subcc 	%r22, 0x004b, %r30
	.word 0xf71c8000  ! 14: LDDF_R	ldd	[%r18, %r0], %f27
	.word 0x8194a1de  ! 15: WRPR_TPC_I	wrpr	%r18, 0x01de, %tpc
	.word 0xb72de001  ! 16: SLL_I	sll 	%r23, 0x0001, %r27
	.word 0xbf504000  ! 21: RDPR_TNPC	<illegal instruction>
hwintr_2_0:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_0), 16, 16)) -> intp(2, 0, 3d)
hwintr_2_1:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_1), 16, 16)) -> intp(2, 0, 16)
	.word 0xf2552145  ! 30: LDSH_I	ldsh	[%r20 + 0x0145], %r25
	.word 0x8595e094  ! 31: WRPR_TSTATE_I	wrpr	%r23, 0x0094, %tstate
	.word 0xfe4d8000  ! 32: LDSB_R	ldsb	[%r22 + %r0], %r31
	.word 0xbb354000  ! 38: SRL_R	srl 	%r21, %r0, %r29
	.word 0xf80d214c  ! 40: LDUB_I	ldub	[%r20 + 0x014c], %r28
	.word 0xf01d0000  ! 42: LDD_R	ldd	[%r20 + %r0], %r24
	.word 0x8795a0c0  ! 44: WRPR_TT_I	wrpr	%r22, 0x00c0, %tt
	.word 0xb12cb001  ! 45: SLLX_I	sllx	%r18, 0x0001, %r24
	.word 0xf44d0000  ! 48: LDSB_R	ldsb	[%r20 + %r0], %r26
	.word 0xf005e0bf  ! 49: LDUW_I	lduw	[%r23 + 0x00bf], %r24
	.word 0xfa45e07e  ! 51: LDSW_I	ldsw	[%r23 + 0x007e], %r29
	setx	data_start_5, %g1, %r18
	.word 0xbb50c000  ! 54: RDPR_TT	<illegal instruction>
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf244203a  ! 56: LDSW_I	ldsw	[%r16 + 0x003a], %r25
	.word 0xf81c0000  ! 57: LDD_R	ldd	[%r16 + %r0], %r28
	.word 0xb1500000  ! 58: RDPR_TPC	<illegal instruction>
	.word 0xfc5dc000  ! 59: LDX_R	ldx	[%r23 + %r0], %r30
	.word 0xf60d607f  ! 60: LDUB_I	ldub	[%r21 + 0x007f], %r27
	.word 0xbc8ce068  ! 65: ANDcc_I	andcc 	%r19, 0x0068, %r30
	.word 0xbebc6084  ! 67: XNORcc_I	xnorcc 	%r17, 0x0084, %r31
	setx	data_start_2, %g1, %r20
	.word 0xf25de0e4  ! 72: LDX_I	ldx	[%r23 + 0x00e4], %r25
	.word 0xbb7cc400  ! 77: MOVR_R	movre	%r19, %r0, %r29
	.word 0xb5510000  ! 82: RDPR_TICK	<illegal instruction>
	.word 0xb1480000  ! 86: RDHPR_HPSTATE	rdhpr	%hpstate, %r24
	.word 0xf645e061  ! 89: LDSW_I	ldsw	[%r23 + 0x0061], %r27
	.word 0x89946158  ! 92: WRPR_TICK_I	wrpr	%r17, 0x0158, %tick
	.word 0xf854a1d5  ! 93: LDSH_I	ldsh	[%r18 + 0x01d5], %r28
	setx	data_start_0, %g1, %r16
	.word 0xf4050000  ! 105: LDUW_R	lduw	[%r20 + %r0], %r26
	.word 0xbd2c0000  ! 108: SLL_R	sll 	%r16, %r0, %r30
	.word 0xbe3c4000  ! 109: XNOR_R	xnor 	%r17, %r0, %r31
hwintr_2_2:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_2), 16, 16)) -> intp(2, 0, 22)
hwintr_2_3:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_3), 16, 16)) -> intp(2, 0, 1f)
	.word 0xfc0d4000  ! 115: LDUB_R	ldub	[%r21 + %r0], %r30
	.word 0xf2142186  ! 118: LDUH_I	lduh	[%r16 + 0x0186], %r25
	.word 0xf85c4000  ! 122: LDX_R	ldx	[%r17 + %r0], %r28
	.word 0xb9480000  ! 123: RDHPR_HPSTATE	rdhpr	%hpstate, %r28
	.word 0xbe948000  ! 124: ORcc_R	orcc 	%r18, %r0, %r31
	.word 0xfc5d60ee  ! 125: LDX_I	ldx	[%r21 + 0x00ee], %r30
	.word 0xf405e0aa  ! 127: LDUW_I	lduw	[%r23 + 0x00aa], %r26
	.word 0x8d94a041  ! 128: WRPR_PSTATE_I	wrpr	%r18, 0x0041, %pstate
hwintr_2_4:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_4), 16, 16)) -> intp(2, 0, 1e)
	.word 0xbe04611b  ! 130: ADD_I	add 	%r17, 0x011b, %r31
	.word 0xf40ce1be  ! 133: LDUB_I	ldub	[%r19 + 0x01be], %r26
	.word 0xb9540000  ! 135: RDPR_GL	rdpr	%-, %r28
	.word 0xbb504000  ! 137: RDPR_TNPC	<illegal instruction>
	.word 0xfa54c000  ! 138: LDSH_R	ldsh	[%r19 + %r0], %r29
	.word 0xf014602d  ! 141: LDUH_I	lduh	[%r17 + 0x002d], %r24
	.word 0xbf3db001  ! 142: SRAX_I	srax	%r22, 0x0001, %r31
	.word 0x879561f3  ! 143: WRPR_TT_I	wrpr	%r21, 0x01f3, %tt
	.word 0xf84d8000  ! 146: LDSB_R	ldsb	[%r22 + %r0], %r28
	.word 0xb6458000  ! 147: ADDC_R	addc 	%r22, %r0, %r27
	.word 0xfc1d4000  ! 148: LDD_R	ldd	[%r21 + %r0], %r30
	.word 0xfa452143  ! 150: LDSW_I	ldsw	[%r20 + 0x0143], %r29
	setx	data_start_4, %g1, %r23
	.word 0xb83dc000  ! 157: XNOR_R	xnor 	%r23, %r0, %r28
	.word 0xfe0c4000  ! 158: LDUB_R	ldub	[%r17 + %r0], %r31
	.word 0xf6544000  ! 166: LDSH_R	ldsh	[%r17 + %r0], %r27
	.word 0xb9520000  ! 167: RDPR_PIL	<illegal instruction>
	.word 0xfd1ca034  ! 174: LDDF_I	ldd	[%r18, 0x0034], %f30
hwintr_2_5:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_5), 16, 16)) -> intp(2, 0, 2a)
	.word 0xfc1d4000  ! 176: LDD_R	ldd	[%r21 + %r0], %r30
hwintr_2_6:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_6), 16, 16)) -> intp(2, 0, 1e)
	.word 0xbc84a0a5  ! 180: ADDcc_I	addcc 	%r18, 0x00a5, %r30
	.word 0xb3480000  ! 182: RDHPR_HPSTATE	rdhpr	%hpstate, %r25
	.word 0xf645a1c9  ! 183: LDSW_I	ldsw	[%r22 + 0x01c9], %r27
hwintr_2_7:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_7), 16, 16)) -> intp(2, 0, 2)
	.word 0xbc2c0000  ! 195: ANDN_R	andn 	%r16, %r0, %r30
hwintr_2_8:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_8), 16, 16)) -> intp(2, 0, 2d)
	.word 0xf05dc000  ! 203: LDX_R	ldx	[%r23 + %r0], %r24
	.word 0x8d9521d9  ! 204: WRPR_PSTATE_I	wrpr	%r20, 0x01d9, %pstate
hwintr_2_9:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_9), 16, 16)) -> intp(2, 0, 6)
	.word 0xfe0561a5  ! 207: LDUW_I	lduw	[%r21 + 0x01a5], %r31
	.word 0xba0d8000  ! 209: AND_R	and 	%r22, %r0, %r29
	.word 0xf04560d4  ! 210: LDSW_I	ldsw	[%r21 + 0x00d4], %r24
	.word 0x8d9461d8  ! 212: WRPR_PSTATE_I	wrpr	%r17, 0x01d8, %pstate
	setx	data_start_1, %g1, %r19
	.word 0xfe4520ca  ! 218: LDSW_I	ldsw	[%r20 + 0x00ca], %r31
	.word 0x839460f1  ! 221: WRPR_TNPC_I	wrpr	%r17, 0x00f1, %tnpc
	setx	0x3267f0a500000900, %g1, %r10
	.word 0x819a8000  ! 223: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xf215c000  ! 225: LDUH_R	lduh	[%r23 + %r0], %r25
	.word 0xbf510000  ! 228: RDPR_TICK	<illegal instruction>
	.word 0xbc9c0000  ! 229: XORcc_R	xorcc 	%r16, %r0, %r30
	.word 0xb8b54000  ! 230: SUBCcc_R	orncc 	%r21, %r0, %r28
	.word 0xfc144000  ! 231: LDUH_R	lduh	[%r17 + %r0], %r30
	mov	1, %r12
	.word 0xa1930000  ! 236: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb935b001  ! 239: SRLX_I	srlx	%r22, 0x0001, %r28
	mov	0, %r12
	.word 0xa1930000  ! 246: WRPR_GL_R	wrpr	%r12, %r0, %-
	mov	2, %r12
	.word 0xa1930000  ! 247: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xfe5c0000  ! 250: LDX_R	ldx	[%r16 + %r0], %r31
	setx	0x65d796d600001f44, %g1, %r10
	.word 0x839a8000  ! 251: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xfe4c61e2  ! 254: LDSB_I	ldsb	[%r17 + 0x01e2], %r31
	.word 0xf815e05a  ! 255: LDUH_I	lduh	[%r23 + 0x005a], %r28
	.word 0xfa44c000  ! 256: LDSW_R	ldsw	[%r19 + %r0], %r29
	.word 0xb245a187  ! 259: ADDC_I	addc 	%r22, 0x0187, %r25
	.word 0xf61d2029  ! 261: LDD_I	ldd	[%r20 + 0x0029], %r27
	.word 0xb2150000  ! 262: OR_R	or 	%r20, %r0, %r25
	.word 0xfa1da175  ! 263: LDD_I	ldd	[%r22 + 0x0175], %r29
	.word 0xf8144000  ! 268: LDUH_R	lduh	[%r17 + %r0], %r28
	.word 0xf65d6119  ! 269: LDX_I	ldx	[%r21 + 0x0119], %r27
	.word 0xb425e00f  ! 271: SUB_I	sub 	%r23, 0x000f, %r26
hwintr_2_10:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_10), 16, 16)) -> intp(2, 0, 16)
hwintr_2_11:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_11), 16, 16)) -> intp(2, 0, 2)
	.word 0xb9520000  ! 275: RDPR_PIL	<illegal instruction>
	.word 0xbd510000  ! 277: RDPR_TICK	<illegal instruction>
	.word 0x8395e0a1  ! 278: WRPR_TNPC_I	wrpr	%r23, 0x00a1, %tnpc
hwintr_2_12:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_12), 16, 16)) -> intp(2, 0, 37)
	setx	data_start_6, %g1, %r18
	.word 0x819461c7  ! 288: WRPR_TPC_I	wrpr	%r17, 0x01c7, %tpc
	.word 0x8794e177  ! 289: WRPR_TT_I	wrpr	%r19, 0x0177, %tt
	.word 0xf84ce1af  ! 290: LDSB_I	ldsb	[%r19 + 0x01af], %r28
	.word 0xbf504000  ! 291: RDPR_TNPC	rdpr	%tnpc, %r31
	mov	0, %r12
	.word 0x8f930000  ! 292: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xf80da1a1  ! 293: LDUB_I	ldub	[%r22 + 0x01a1], %r28
	.word 0xb7500000  ! 296: RDPR_TPC	<illegal instruction>
	mov	1, %r12
	.word 0xa1930000  ! 298: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xfe1dc000  ! 300: LDD_R	ldd	[%r23 + %r0], %r31
	.word 0xf40c4000  ! 301: LDUB_R	ldub	[%r17 + %r0], %r26
	.word 0xb014a150  ! 304: OR_I	or 	%r18, 0x0150, %r24
	.word 0xf91da04b  ! 307: LDDF_I	ldd	[%r22, 0x004b], %f28
	.word 0xb3480000  ! 310: RDHPR_HPSTATE	rdhpr	%hpstate, %r25
hwintr_2_13:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_13), 16, 16)) -> intp(2, 0, d)
hwintr_2_14:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_14), 16, 16)) -> intp(2, 0, 39)
	setx	data_start_7, %g1, %r23
	.word 0xf60da046  ! 319: LDUB_I	ldub	[%r22 + 0x0046], %r27
hwintr_2_15:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_15), 16, 16)) -> intp(2, 0, 29)
	.word 0x819460e7  ! 327: WRPR_TPC_I	wrpr	%r17, 0x00e7, %tpc
	.word 0xb3520000  ! 328: RDPR_PIL	<illegal instruction>
	.word 0xf85460f9  ! 329: LDSH_I	ldsh	[%r17 + 0x00f9], %r28
	.word 0xb01521a9  ! 330: OR_I	or 	%r20, 0x01a9, %r24
	.word 0xb8b4a13a  ! 331: SUBCcc_I	orncc 	%r18, 0x013a, %r28
	.word 0xb97c6401  ! 334: MOVR_I	movre	%r17, 0x1, %r28
	.word 0xb4bd4000  ! 343: XNORcc_R	xnorcc 	%r21, %r0, %r26
	.word 0xfb1da109  ! 344: LDDF_I	ldd	[%r22, 0x0109], %f29
	.word 0xbd3d5000  ! 345: SRAX_R	srax	%r21, %r0, %r30
	.word 0xf84dc000  ! 346: LDSB_R	ldsb	[%r23 + %r0], %r28
	.word 0xb7480000  ! 349: RDHPR_HPSTATE	rdhpr	%hpstate, %r27
	.word 0xbd3c0000  ! 350: SRA_R	sra 	%r16, %r0, %r30
	.word 0xf2456169  ! 353: LDSW_I	ldsw	[%r21 + 0x0169], %r25
hwintr_2_16:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_16), 16, 16)) -> intp(2, 0, 28)
	.word 0xf45d8000  ! 357: LDX_R	ldx	[%r22 + %r0], %r26
	.word 0xfc050000  ! 359: LDUW_R	lduw	[%r20 + %r0], %r30
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xfc0ca106  ! 361: LDUB_I	ldub	[%r18 + 0x0106], %r30
	.word 0xfe0ce1fd  ! 362: LDUB_I	ldub	[%r19 + 0x01fd], %r31
	.word 0xb4ad0000  ! 364: ANDNcc_R	andncc 	%r20, %r0, %r26
	.word 0xb8358000  ! 366: ORN_R	orn 	%r22, %r0, %r28
	.word 0xf40c4000  ! 368: LDUB_R	ldub	[%r17 + %r0], %r26
	.word 0xfa54a0bd  ! 372: LDSH_I	ldsh	[%r18 + 0x00bd], %r29
	.word 0xb2b4a1aa  ! 373: ORNcc_I	orncc 	%r18, 0x01aa, %r25
	.word 0xb950c000  ! 374: RDPR_TT	<illegal instruction>
	.word 0xb3357001  ! 375: SRLX_I	srlx	%r21, 0x0001, %r25
	.word 0xfc450000  ! 383: LDSW_R	ldsw	[%r20 + %r0], %r30
	.word 0xfa1d2131  ! 384: LDD_I	ldd	[%r20 + 0x0131], %r29
	.word 0xf454a161  ! 387: LDSH_I	ldsh	[%r18 + 0x0161], %r26
hwintr_2_17:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_17), 16, 16)) -> intp(2, 0, 2a)
	.word 0xbf500000  ! 394: RDPR_TPC	<illegal instruction>
	.word 0xf71d4000  ! 398: LDDF_R	ldd	[%r21, %r0], %f27
	.word 0x83946170  ! 399: WRPR_TNPC_I	wrpr	%r17, 0x0170, %tnpc
	.word 0x91946073  ! 403: WRPR_PIL_I	wrpr	%r17, 0x0073, %pil
	.word 0xf654e0ea  ! 407: LDSH_I	ldsh	[%r19 + 0x00ea], %r27
	.word 0xf6544000  ! 410: LDSH_R	ldsh	[%r17 + %r0], %r27
	.word 0xfa150000  ! 411: LDUH_R	lduh	[%r20 + %r0], %r29
	.word 0xf60c0000  ! 413: LDUB_R	ldub	[%r16 + %r0], %r27
	.word 0xf91c4000  ! 414: LDDF_R	ldd	[%r17, %r0], %f28
	.word 0xf81ca0e9  ! 416: LDD_I	ldd	[%r18 + 0x00e9], %r28
	.word 0xfe1d2056  ! 417: LDD_I	ldd	[%r20 + 0x0056], %r31
	.word 0xf91c21c8  ! 419: LDDF_I	ldd	[%r16, 0x01c8], %f28
	.word 0xb7500000  ! 421: RDPR_TPC	<illegal instruction>
	.word 0xf64c8000  ! 424: LDSB_R	ldsb	[%r18 + %r0], %r27
hwintr_2_18:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_18), 16, 16)) -> intp(2, 0, 11)
	.word 0xf21d6084  ! 429: LDD_I	ldd	[%r21 + 0x0084], %r25
	.word 0xbab4207d  ! 434: ORNcc_I	orncc 	%r16, 0x007d, %r29
	.word 0xfa0560d0  ! 438: LDUW_I	lduw	[%r21 + 0x00d0], %r29
	.word 0xb9508000  ! 439: RDPR_TSTATE	<illegal instruction>
	.word 0xb89521f4  ! 440: ORcc_I	orcc 	%r20, 0x01f4, %r28
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
hwintr_2_19:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_19), 16, 16)) -> intp(2, 0, 3a)
	.word 0xfa058000  ! 455: LDUW_R	lduw	[%r22 + %r0], %r29
hwintr_2_20:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_20), 16, 16)) -> intp(2, 0, e)
	.word 0xbd7ce401  ! 462: MOVR_I	movre	%r19, 0x1, %r30
	.word 0xf91ca0f4  ! 463: LDDF_I	ldd	[%r18, 0x00f4], %f28
	.word 0xf015619b  ! 464: LDUH_I	lduh	[%r21 + 0x019b], %r24
	.word 0xb92c6001  ! 468: SLL_I	sll 	%r17, 0x0001, %r28
	.word 0xbb520000  ! 469: RDPR_PIL	<illegal instruction>
	.word 0xf20da124  ! 472: LDUB_I	ldub	[%r22 + 0x0124], %r25
	.word 0xf445e196  ! 473: LDSW_I	ldsw	[%r23 + 0x0196], %r26
	.word 0xb3504000  ! 478: RDPR_TNPC	<illegal instruction>
	.word 0xb4050000  ! 480: ADD_R	add 	%r20, %r0, %r26
	.word 0xb9480000  ! 481: RDHPR_HPSTATE	rdhpr	%hpstate, %r28
	.word 0xf21da0d1  ! 484: LDD_I	ldd	[%r22 + 0x00d1], %r25
hwintr_2_21:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_21), 16, 16)) -> intp(2, 0, 35)
	.word 0xf244a1f6  ! 486: LDSW_I	ldsw	[%r18 + 0x01f6], %r25
	.word 0xf01ce164  ! 488: LDD_I	ldd	[%r19 + 0x0164], %r24
	.word 0x8595e095  ! 491: WRPR_TSTATE_I	wrpr	%r23, 0x0095, %tstate
	.word 0x83952127  ! 497: WRPR_TNPC_I	wrpr	%r20, 0x0127, %tnpc
	.word 0xfc1460ec  ! 498: LDUH_I	lduh	[%r17 + 0x00ec], %r30
	.word 0x89952037  ! 499: WRPR_TICK_I	wrpr	%r20, 0x0037, %tick
	.word 0xfa158000  ! 503: LDUH_R	lduh	[%r22 + %r0], %r29
	.word 0x8995a1b4  ! 506: WRPR_TICK_I	wrpr	%r22, 0x01b4, %tick
hwintr_2_22:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_22), 16, 16)) -> intp(2, 0, 24)
	.word 0xfe5ce146  ! 511: LDX_I	ldx	[%r19 + 0x0146], %r31
	.word 0xb550c000  ! 513: RDPR_TT	<illegal instruction>
	mov	1, %r12
	.word 0xa1930000  ! 515: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xf444a1ab  ! 520: LDSW_I	ldsw	[%r18 + 0x01ab], %r26
	.word 0xf65d0000  ! 523: LDX_R	ldx	[%r20 + %r0], %r27
	.word 0xf65420d3  ! 526: LDSH_I	ldsh	[%r16 + 0x00d3], %r27
	setx	data_start_5, %g1, %r20
	.word 0xf91ce093  ! 536: LDDF_I	ldd	[%r19, 0x0093], %f28
	.word 0x8994a0f4  ! 539: WRPR_TICK_I	wrpr	%r18, 0x00f4, %tick
	.word 0xf01521c2  ! 540: LDUH_I	lduh	[%r20 + 0x01c2], %r24
	.word 0xfc1da145  ! 541: LDD_I	ldd	[%r22 + 0x0145], %r30
	.word 0xbf480000  ! 542: RDHPR_HPSTATE	rdhpr	%hpstate, %r31
	.word 0xf85cc000  ! 550: LDX_R	ldx	[%r19 + %r0], %r28
hwintr_2_23:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_23), 16, 16)) -> intp(2, 0, 13)
	.word 0xf85d0000  ! 554: LDX_R	ldx	[%r20 + %r0], %r28
hwintr_2_24:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_24), 16, 16)) -> intp(2, 0, 37)
	.word 0xb9510000  ! 563: RDPR_TICK	<illegal instruction>
	.word 0xfe1c6119  ! 567: LDD_I	ldd	[%r17 + 0x0119], %r31
hwintr_2_25:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_25), 16, 16)) -> intp(2, 0, 3e)
	.word 0xfc04a194  ! 576: LDUW_I	lduw	[%r18 + 0x0194], %r30
	.word 0xfa1dc000  ! 577: LDD_R	ldd	[%r23 + %r0], %r29
	.word 0xf8040000  ! 580: LDUW_R	lduw	[%r16 + %r0], %r28
hwintr_2_26:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_26), 16, 16)) -> intp(2, 0, 26)
hwintr_2_27:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_27), 16, 16)) -> intp(2, 0, 23)
	setx	0x82d836380000da84, %g1, %r10
	.word 0x819a8000  ! 595: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xf71ce060  ! 598: LDDF_I	ldd	[%r19, 0x0060], %f27
	mov	2, %r12
	.word 0xa1930000  ! 599: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0x89942032  ! 602: WRPR_TICK_I	wrpr	%r16, 0x0032, %tick
	.word 0xff1d20cf  ! 603: LDDF_I	ldd	[%r20, 0x00cf], %f31
	.word 0xf25d20e8  ! 604: LDX_I	ldx	[%r20 + 0x00e8], %r25
	.word 0xfc4dc000  ! 605: LDSB_R	ldsb	[%r23 + %r0], %r30
	mov	0, %r12
	.word 0x8f930000  ! 607: WRPR_TL_R	wrpr	%r12, %r0, %tl
	setx	0x4c6230080000af8f, %g1, %r10
	.word 0x819a8000  ! 608: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xf81ca0da  ! 609: LDD_I	ldd	[%r18 + 0x00da], %r28
	.word 0x9194604d  ! 616: WRPR_PIL_I	wrpr	%r17, 0x004d, %pil
	.word 0xf21c0000  ! 618: LDD_R	ldd	[%r16 + %r0], %r25
	.word 0xbb643801  ! 619: MOVcc_I	<illegal instruction>
	.word 0xff1c0000  ! 621: LDDF_R	ldd	[%r16, %r0], %f31
	.word 0x8395a183  ! 623: WRPR_TNPC_I	wrpr	%r22, 0x0183, %tnpc
	.word 0xfc044000  ! 624: LDUW_R	lduw	[%r17 + %r0], %r30
	.word 0xf00c4000  ! 626: LDUB_R	ldub	[%r17 + %r0], %r24
	.word 0xba95e068  ! 631: ORcc_I	orcc 	%r23, 0x0068, %r29
	.word 0xf64d4000  ! 632: LDSB_R	ldsb	[%r21 + %r0], %r27
	.word 0xf20cc000  ! 637: LDUB_R	ldub	[%r19 + %r0], %r25
	.word 0xbe84216b  ! 638: ADDcc_I	addcc 	%r16, 0x016b, %r31
	.word 0xf51ca00a  ! 639: LDDF_I	ldd	[%r18, 0x000a], %f26
	.word 0xb8854000  ! 647: ADDcc_R	addcc 	%r21, %r0, %r28
	.word 0xf51d61b3  ! 649: LDDF_I	ldd	[%r21, 0x01b3], %f26
hwintr_2_28:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_28), 16, 16)) -> intp(2, 0, 31)
hwintr_2_29:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_29), 16, 16)) -> intp(2, 0, 1)
	setx	0x53472dda00005cc0, %g1, %r10
	.word 0x819a8000  ! 654: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xfa150000  ! 655: LDUH_R	lduh	[%r20 + %r0], %r29
	.word 0xf8456090  ! 658: LDSW_I	ldsw	[%r21 + 0x0090], %r28
	.word 0xf01de144  ! 659: LDD_I	ldd	[%r23 + 0x0144], %r24
	.word 0xba1c4000  ! 660: XOR_R	xor 	%r17, %r0, %r29
	.word 0xb634c000  ! 661: SUBC_R	orn 	%r19, %r0, %r27
hwintr_2_30:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_30), 16, 16)) -> intp(2, 0, 11)
	.word 0xf415a00d  ! 663: LDUH_I	lduh	[%r22 + 0x000d], %r26
	.word 0xbea58000  ! 665: SUBcc_R	subcc 	%r22, %r0, %r31
	.word 0xf40de010  ! 667: LDUB_I	ldub	[%r23 + 0x0010], %r26
	.word 0xf845c000  ! 670: LDSW_R	ldsw	[%r23 + %r0], %r28
hwintr_2_31:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_31), 16, 16)) -> intp(2, 0, 26)
	.word 0x899421e9  ! 681: WRPR_TICK_I	wrpr	%r16, 0x01e9, %tick
hwintr_2_32:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_32), 16, 16)) -> intp(2, 0, 14)
	.word 0xf854c000  ! 685: LDSH_R	ldsh	[%r19 + %r0], %r28
	mov	2, %r12
	.word 0x8f930000  ! 691: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xf445609b  ! 692: LDSW_I	ldsw	[%r21 + 0x009b], %r26
	.word 0xf11ca10b  ! 693: LDDF_I	ldd	[%r18, 0x010b], %f24
	.word 0x8794e054  ! 697: WRPR_TT_I	wrpr	%r19, 0x0054, %tt
hwintr_2_33:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_33), 16, 16)) -> intp(2, 0, 3e)
	.word 0xfa0d0000  ! 703: LDUB_R	ldub	[%r20 + %r0], %r29
	.word 0xf84d61c4  ! 704: LDSB_I	ldsb	[%r21 + 0x01c4], %r28
	.word 0xf6540000  ! 707: LDSH_R	ldsh	[%r16 + %r0], %r27
	.word 0x89952099  ! 708: WRPR_TICK_I	wrpr	%r20, 0x0099, %tick
	.word 0xf81c8000  ! 715: LDD_R	ldd	[%r18 + %r0], %r28
hwintr_2_34:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_34), 16, 16)) -> intp(2, 0, 8)
	setx	0xafd613710000a9db, %g1, %r10
	.word 0x819a8000  ! 721: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xb3500000  ! 722: RDPR_TPC	<illegal instruction>
	.word 0xf80ce0c6  ! 724: LDUB_I	ldub	[%r19 + 0x00c6], %r28
	.word 0xf71c2175  ! 727: LDDF_I	ldd	[%r16, 0x0175], %f27
	mov	1, %r12
	.word 0xa1930000  ! 733: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0x8795a10d  ! 736: WRPR_TT_I	wrpr	%r22, 0x010d, %tt
	.word 0xfa148000  ! 737: LDUH_R	lduh	[%r18 + %r0], %r29
	.word 0xb80d6198  ! 738: AND_I	and 	%r21, 0x0198, %r28
	.word 0xb40da19d  ! 739: AND_I	and 	%r22, 0x019d, %r26
	.word 0xfa55603c  ! 740: LDSH_I	ldsh	[%r21 + 0x003c], %r29
	.word 0xfe4c6168  ! 741: LDSB_I	ldsb	[%r17 + 0x0168], %r31
	.word 0xf11c0000  ! 744: LDDF_R	ldd	[%r16, %r0], %f24
	.word 0xf015c000  ! 747: LDUH_R	lduh	[%r23 + %r0], %r24
	.word 0x919521c5  ! 751: WRPR_PIL_I	wrpr	%r20, 0x01c5, %pil
	.word 0xf4142117  ! 753: LDUH_I	lduh	[%r16 + 0x0117], %r26
	.word 0xfa1da03b  ! 754: LDD_I	ldd	[%r22 + 0x003b], %r29
	.word 0x8395208c  ! 755: WRPR_TNPC_I	wrpr	%r20, 0x008c, %tnpc
	.word 0xbe258000  ! 757: SUB_R	sub 	%r22, %r0, %r31
	.word 0xb694e15f  ! 761: ORcc_I	orcc 	%r19, 0x015f, %r27
	.word 0xfe5d6189  ! 762: LDX_I	ldx	[%r21 + 0x0189], %r31
hwintr_2_35:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_35), 16, 16)) -> intp(2, 0, 1f)
	.word 0xf855e085  ! 765: LDSH_I	ldsh	[%r23 + 0x0085], %r28
hwintr_2_36:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_36), 16, 16)) -> intp(2, 0, 39)
	.word 0xf60d4000  ! 770: LDUB_R	ldub	[%r21 + %r0], %r27
	.word 0xf31ce0e6  ! 771: LDDF_I	ldd	[%r19, 0x00e6], %f25
	.word 0xf4548000  ! 774: LDSH_R	ldsh	[%r18 + %r0], %r26
	.word 0xfe0c2031  ! 778: LDUB_I	ldub	[%r16 + 0x0031], %r31
	.word 0xf444a0f6  ! 779: LDSW_I	ldsw	[%r18 + 0x00f6], %r26
	.word 0xf245a0ae  ! 781: LDSW_I	ldsw	[%r22 + 0x00ae], %r25
	.word 0xfe550000  ! 783: LDSH_R	ldsh	[%r20 + %r0], %r31
	.word 0xf4544000  ! 785: LDSH_R	ldsh	[%r17 + %r0], %r26
	.word 0xb1480000  ! 787: RDHPR_HPSTATE	rdhpr	%hpstate, %r24
hwintr_2_37:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_37), 16, 16)) -> intp(2, 0, 36)
	.word 0xfe45c000  ! 794: LDSW_R	ldsw	[%r23 + %r0], %r31
	.word 0xfa1461aa  ! 799: LDUH_I	lduh	[%r17 + 0x01aa], %r29
	.word 0xf80c60b4  ! 800: LDUB_I	ldub	[%r17 + 0x00b4], %r28
	.word 0xfc55a027  ! 806: LDSH_I	ldsh	[%r22 + 0x0027], %r30
hwintr_2_38:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_38), 16, 16)) -> intp(2, 0, 28)
	.word 0xf91dc000  ! 813: LDDF_R	ldd	[%r23, %r0], %f28
	.word 0xb5358000  ! 814: SRL_R	srl 	%r22, %r0, %r26
	.word 0xfa144000  ! 815: LDUH_R	lduh	[%r17 + %r0], %r29
	.word 0xf65521c5  ! 818: LDSH_I	ldsh	[%r20 + 0x01c5], %r27
	.word 0xfc04c000  ! 819: LDUW_R	lduw	[%r19 + %r0], %r30
	.word 0xfa444000  ! 824: LDSW_R	ldsw	[%r17 + %r0], %r29
	.word 0xf85d0000  ! 828: LDX_R	ldx	[%r20 + %r0], %r28
	.word 0xf11cc000  ! 831: LDDF_R	ldd	[%r19, %r0], %f24
	.word 0xfa45e039  ! 836: LDSW_I	ldsw	[%r23 + 0x0039], %r29
	.word 0xf4440000  ! 839: LDSW_R	ldsw	[%r16 + %r0], %r26
	setx	data_start_3, %g1, %r21
	.word 0xf51c2095  ! 843: LDDF_I	ldd	[%r16, 0x0095], %f26
	.word 0xf014e0c4  ! 846: LDUH_I	lduh	[%r19 + 0x00c4], %r24
	.word 0xf45561ed  ! 847: LDSH_I	ldsh	[%r21 + 0x01ed], %r26
	.word 0xf25da00b  ! 848: LDX_I	ldx	[%r22 + 0x000b], %r25
	.word 0xbb500000  ! 849: RDPR_TPC	<illegal instruction>
	.word 0xfa0d4000  ! 850: LDUB_R	ldub	[%r21 + %r0], %r29
	.word 0xfa1d0000  ! 852: LDD_R	ldd	[%r20 + %r0], %r29
	.word 0xf01cc000  ! 855: LDD_R	ldd	[%r19 + %r0], %r24
	.word 0xfc1c6083  ! 858: LDD_I	ldd	[%r17 + 0x0083], %r30
	setx	data_start_6, %g1, %r23
	.word 0xf0056175  ! 860: LDUW_I	lduw	[%r21 + 0x0175], %r24
	.word 0xf00d6085  ! 862: LDUB_I	ldub	[%r21 + 0x0085], %r24
	.word 0x859560ce  ! 864: WRPR_TSTATE_I	wrpr	%r21, 0x00ce, %tstate
	.word 0xf6548000  ! 865: LDSH_R	ldsh	[%r18 + %r0], %r27
	setx	data_start_4, %g1, %r23
	.word 0xb1508000  ! 876: RDPR_TSTATE	<illegal instruction>
	.word 0xf6454000  ! 878: LDSW_R	ldsw	[%r21 + %r0], %r27
	.word 0xf0058000  ! 879: LDUW_R	lduw	[%r22 + %r0], %r24
	.word 0xf04521fb  ! 882: LDSW_I	ldsw	[%r20 + 0x01fb], %r24
hwintr_2_39:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_39), 16, 16)) -> intp(2, 0, 2e)
	.word 0xf21c2130  ! 886: LDD_I	ldd	[%r16 + 0x0130], %r25
	.word 0xf80d0000  ! 888: LDUB_R	ldub	[%r20 + %r0], %r28
	.word 0xf71d610e  ! 890: LDDF_I	ldd	[%r21, 0x010e], %f27
hwintr_2_40:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_40), 16, 16)) -> intp(2, 0, 11)
	.word 0x8d9460ad  ! 893: WRPR_PSTATE_I	wrpr	%r17, 0x00ad, %pstate
	.word 0xb4456116  ! 895: ADDC_I	addc 	%r21, 0x0116, %r26
	setx	data_start_4, %g1, %r19
	.word 0xfa1c60fc  ! 902: LDD_I	ldd	[%r17 + 0x00fc], %r29
	.word 0xf0544000  ! 903: LDSH_R	ldsh	[%r17 + %r0], %r24
	setx	0x5d3ad35100009894, %g1, %r10
	.word 0x839a8000  ! 904: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xfc4de10e  ! 906: LDSB_I	ldsb	[%r23 + 0x010e], %r30
	.word 0x8394a057  ! 911: WRPR_TNPC_I	wrpr	%r18, 0x0057, %tnpc
	.word 0xf81ca11b  ! 912: LDD_I	ldd	[%r18 + 0x011b], %r28
	.word 0xf84d4000  ! 913: LDSB_R	ldsb	[%r21 + %r0], %r28
	.word 0xb5510000  ! 915: RDPR_TICK	<illegal instruction>
	.word 0xf64ce116  ! 916: LDSB_I	ldsb	[%r19 + 0x0116], %r27
	.word 0xfa5dc000  ! 918: LDX_R	ldx	[%r23 + %r0], %r29
hwintr_2_41:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_41), 16, 16)) -> intp(2, 0, 13)
	.word 0xf71cc000  ! 921: LDDF_R	ldd	[%r19, %r0], %f27
	.word 0xb9500000  ! 927: RDPR_TPC	<illegal instruction>
	.word 0xfe050000  ! 933: LDUW_R	lduw	[%r20 + %r0], %r31
	.word 0xfc558000  ! 934: LDSH_R	ldsh	[%r22 + %r0], %r30
	.word 0xfc15c000  ! 935: LDUH_R	lduh	[%r23 + %r0], %r30
	setx	0x734902b400008e44, %g1, %r10
	.word 0x819a8000  ! 938: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xfa4da1e0  ! 940: LDSB_I	ldsb	[%r22 + 0x01e0], %r29
hwintr_2_42:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_42), 16, 16)) -> intp(2, 0, 3d)
	.word 0xfb1dc000  ! 946: LDDF_R	ldd	[%r23, %r0], %f29
	setx	0xe81d1fa400008f02, %g1, %r10
	.word 0x819a8000  ! 950: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0x8195a139  ! 951: WRPR_TPC_I	wrpr	%r22, 0x0139, %tpc
	.word 0x899560de  ! 953: WRPR_TICK_I	wrpr	%r21, 0x00de, %tick
hwintr_2_43:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_43), 16, 16)) -> intp(2, 0, 18)
	.word 0xb4b44000  ! 956: ORNcc_R	orncc 	%r17, %r0, %r26
hwintr_2_44:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_44), 16, 16)) -> intp(2, 0, 29)
	.word 0xfc058000  ! 958: LDUW_R	lduw	[%r22 + %r0], %r30
	.word 0xbc054000  ! 959: ADD_R	add 	%r21, %r0, %r30
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xfb1cc000  ! 962: LDDF_R	ldd	[%r19, %r0], %f29
	.word 0xfe0c0000  ! 964: LDUB_R	ldub	[%r16 + %r0], %r31
	.word 0xfe558000  ! 968: LDSH_R	ldsh	[%r22 + %r0], %r31
	setx	data_start_6, %g1, %r21
	.word 0x819520ab  ! 970: WRPR_TPC_I	wrpr	%r20, 0x00ab, %tpc
	.word 0xfa5ca14a  ! 971: LDX_I	ldx	[%r18 + 0x014a], %r29
	.word 0xf204c000  ! 974: LDUW_R	lduw	[%r19 + %r0], %r25
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0x83956142  ! 976: WRPR_TNPC_I	wrpr	%r21, 0x0142, %tnpc
	.word 0xf0542148  ! 977: LDSH_I	ldsh	[%r16 + 0x0148], %r24
	setx	0xf8afeb3b0000280c, %g1, %r10
	.word 0x839a8000  ! 980: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xf455c000  ! 983: LDSH_R	ldsh	[%r23 + %r0], %r26
	.word 0xb3540000  ! 984: RDPR_GL	<illegal instruction>
	.word 0x8395a0b0  ! 986: WRPR_TNPC_I	wrpr	%r22, 0x00b0, %tnpc
	setx	data_start_4, %g1, %r22
	.word 0xf00dc000  ! 989: LDUB_R	ldub	[%r23 + %r0], %r24
	.word 0xfa540000  ! 994: LDSH_R	ldsh	[%r16 + %r0], %r29
	.word 0xfe4de1cc  ! 998: LDSB_I	ldsb	[%r23 + 0x01cc], %r31
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_1:
	.word 0xb9a00040  ! 3: FMOVd	fmovd	%f0, %f28
	.word 0xb9abc820  ! 5: FMOVVC	fmovs	%fcc1, %f0, %f28
	.word 0xb3a00020  ! 8: FMOVs	fmovs	%f0, %f25
	.word 0xbbaa4820  ! 9: FMOVNE	fmovs	%fcc1, %f0, %f29
	.word 0xb2a5a0f7  ! 10: SUBcc_I	subcc 	%r22, 0x00f7, %r25
	.word 0x8195e0da  ! 15: WRPR_TPC_I	wrpr	%r23, 0x00da, %tpc
	.word 0xbb2d6001  ! 16: SLL_I	sll 	%r21, 0x0001, %r29
	.word 0xb1504000  ! 21: RDPR_TNPC	<illegal instruction>
	.word 0xb7a4c940  ! 22: FMULd	fmuld	%f50, %f0, %f58
	.word 0xbdaa4820  ! 24: FMOVNE	fmovs	%fcc1, %f0, %f30
	.word 0xb5a448c0  ! 25: FSUBd	fsubd	%f48, %f0, %f26
hwintr_1_0:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_0), 16, 16)) -> intp(1, 0, 19)
hwintr_1_1:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_1), 16, 16)) -> intp(1, 0, 15)
	.word 0x85946104  ! 31: WRPR_TSTATE_I	wrpr	%r17, 0x0104, %tstate
	.word 0xb3aac820  ! 34: FMOVGE	fmovs	%fcc1, %f0, %f25
	.word 0xb5354000  ! 38: SRL_R	srl 	%r21, %r0, %r26
	.word 0xb9a5c9a0  ! 41: FDIVs	fdivs	%f23, %f0, %f28
	.word 0x8795211c  ! 44: WRPR_TT_I	wrpr	%r20, 0x011c, %tt
	.word 0xbd2df001  ! 45: SLLX_I	sllx	%r23, 0x0001, %r30
	.word 0xb7a80c20  ! 46: FMOVRLZ	dis not found

	.word 0xb3a00540  ! 50: FSQRTd	fsqrt	
	setx	data_start_1, %g1, %r17
	.word 0xbf50c000  ! 54: RDPR_TT	<illegal instruction>
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb3500000  ! 58: RDPR_TPC	<illegal instruction>
	.word 0xb3abc820  ! 63: FMOVVC	fmovs	%fcc1, %f0, %f25
	.word 0xbfaa4820  ! 64: FMOVNE	fmovs	%fcc1, %f0, %f31
	.word 0xb48de023  ! 65: ANDcc_I	andcc 	%r23, 0x0023, %r26
	.word 0xb4bc6080  ! 67: XNORcc_I	xnorcc 	%r17, 0x0080, %r26
	.word 0xb1a4c860  ! 68: FADDq	dis not found

	setx	data_start_6, %g1, %r20
	.word 0xbdabc820  ! 75: FMOVVC	fmovs	%fcc1, %f0, %f30
	.word 0xbda80c20  ! 76: FMOVRLZ	dis not found

	.word 0xb97d8400  ! 77: MOVR_R	movre	%r22, %r0, %r28
	.word 0xb5a50820  ! 78: FADDs	fadds	%f20, %f0, %f26
	.word 0xbf510000  ! 82: RDPR_TICK	<illegal instruction>
	.word 0xb1a00560  ! 83: FSQRTq	fsqrt	
	.word 0xb9a5c860  ! 85: FADDq	dis not found

	.word 0xb1480000  ! 86: RDHPR_HPSTATE	rdhpr	%hpstate, %r24
	.word 0xbda81c20  ! 91: FMOVRGEZ	dis not found

	.word 0x89952022  ! 92: WRPR_TICK_I	wrpr	%r20, 0x0022, %tick
	.word 0xb7aa4820  ! 95: FMOVNE	fmovs	%fcc1, %f0, %f27
	.word 0xb9a81420  ! 96: FMOVRNZ	dis not found

	setx	data_start_1, %g1, %r20
	.word 0xb7a88820  ! 98: FMOVLE	fmovs	%fcc1, %f0, %f27
	.word 0xb1a409a0  ! 99: FDIVs	fdivs	%f16, %f0, %f24
	.word 0xb3a00020  ! 103: FMOVs	fmovs	%f0, %f25
	.word 0xb52d0000  ! 108: SLL_R	sll 	%r20, %r0, %r26
	.word 0xba3d0000  ! 109: XNOR_R	xnor 	%r20, %r0, %r29
hwintr_1_2:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_2), 16, 16)) -> intp(1, 0, 19)
hwintr_1_3:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_3), 16, 16)) -> intp(1, 0, a)
	.word 0xb3a81820  ! 113: FMOVRGZ	fmovs	%fcc3, %f0, %f25
	.word 0xb7a84820  ! 116: FMOVE	fmovs	%fcc1, %f0, %f27
	.word 0xb1aa8820  ! 119: FMOVG	fmovs	%fcc1, %f0, %f24
	.word 0xb9aa4820  ! 121: FMOVNE	fmovs	%fcc1, %f0, %f28
	.word 0xbd480000  ! 123: RDHPR_HPSTATE	rdhpr	%hpstate, %r30
	.word 0xba940000  ! 124: ORcc_R	orcc 	%r16, %r0, %r29
	.word 0xbba80820  ! 126: FMOVN	fmovs	%fcc1, %f0, %f29
	.word 0x8d956176  ! 128: WRPR_PSTATE_I	wrpr	%r21, 0x0176, %pstate
hwintr_1_4:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_4), 16, 16)) -> intp(1, 0, 31)
	.word 0xb804a15c  ! 130: ADD_I	add 	%r18, 0x015c, %r28
	.word 0xb3aa0820  ! 132: FMOVA	fmovs	%fcc1, %f0, %f25
	.word 0xb9540000  ! 135: RDPR_GL	<illegal instruction>
	.word 0xb3504000  ! 137: RDPR_TNPC	<illegal instruction>
	.word 0xb93cb001  ! 142: SRAX_I	srax	%r18, 0x0001, %r28
	.word 0x8795a020  ! 143: WRPR_TT_I	wrpr	%r22, 0x0020, %tt
	.word 0xb5a84820  ! 145: FMOVE	fmovs	%fcc1, %f0, %f26
	.word 0xb0440000  ! 147: ADDC_R	addc 	%r16, %r0, %r24
	.word 0xb9a489c0  ! 149: FDIVd	fdivd	%f18, %f0, %f28
	setx	data_start_2, %g1, %r19
	.word 0xb7a90820  ! 155: FMOVLEU	fmovs	%fcc1, %f0, %f27
	.word 0xb63c4000  ! 157: XNOR_R	xnor 	%r17, %r0, %r27
	.word 0xbda00020  ! 162: FMOVs	fmovs	%f0, %f30
	.word 0xbb520000  ! 167: RDPR_PIL	<illegal instruction>
hwintr_1_5:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_5), 16, 16)) -> intp(1, 0, 3e)
hwintr_1_6:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_6), 16, 16)) -> intp(1, 0, 2b)
	.word 0xb684e1e6  ! 180: ADDcc_I	addcc 	%r19, 0x01e6, %r27
	.word 0xb5480000  ! 182: RDHPR_HPSTATE	rdhpr	%hpstate, %r26
	.word 0xbba88820  ! 185: FMOVLE	fmovs	%fcc1, %f0, %f29
hwintr_1_7:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_7), 16, 16)) -> intp(1, 0, 1b)
	.word 0xbba50860  ! 187: FADDq	dis not found

	.word 0xb7a40960  ! 190: FMULq	dis not found

	.word 0xb1a58960  ! 194: FMULq	dis not found

	.word 0xb42dc000  ! 195: ANDN_R	andn 	%r23, %r0, %r26
hwintr_1_8:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_8), 16, 16)) -> intp(1, 0, b)
	.word 0xb9a9c820  ! 199: FMOVVS	fmovs	%fcc1, %f0, %f28
	.word 0xbbaa0820  ! 201: FMOVA	fmovs	%fcc1, %f0, %f29
	.word 0xbbaa8820  ! 202: FMOVG	fmovs	%fcc1, %f0, %f29
	.word 0x8d95603e  ! 204: WRPR_PSTATE_I	wrpr	%r21, 0x003e, %pstate
	.word 0xb3a00020  ! 205: FMOVs	fmovs	%f0, %f25
hwintr_1_9:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_9), 16, 16)) -> intp(1, 0, 1d)
	.word 0xb00c8000  ! 209: AND_R	and 	%r18, %r0, %r24
	.word 0x8d94e0af  ! 212: WRPR_PSTATE_I	wrpr	%r19, 0x00af, %pstate
	setx	data_start_7, %g1, %r16
	.word 0xbdaa4820  ! 220: FMOVNE	fmovs	%fcc1, %f0, %f30
	.word 0x839520e6  ! 221: WRPR_TNPC_I	wrpr	%r20, 0x00e6, %tnpc
	.word 0xbda449e0  ! 222: FDIVq	dis not found

	setx	0xbb92a510000cc97, %g1, %r10
	.word 0x819a8000  ! 223: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xbba8c820  ! 226: FMOVL	fmovs	%fcc1, %f0, %f29
	.word 0xb5510000  ! 228: RDPR_TICK	<illegal instruction>
	.word 0xba9cc000  ! 229: XORcc_R	xorcc 	%r19, %r0, %r29
	.word 0xb2b4c000  ! 230: SUBCcc_R	orncc 	%r19, %r0, %r25
	.word 0xbfa00520  ! 232: FSQRTs	fsqrt	
	.word 0xb1a00040  ! 233: FMOVd	fmovd	%f0, %f24
	.word 0xb3a80420  ! 234: FMOVRZ	dis not found

	mov	1, %r12
	.word 0xa1930000  ! 236: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb9ab4820  ! 237: FMOVCC	fmovs	%fcc1, %f0, %f28
	.word 0xbf34b001  ! 239: SRLX_I	srlx	%r18, 0x0001, %r31
	.word 0xb1aa8820  ! 242: FMOVG	fmovs	%fcc1, %f0, %f24
	mov	2, %r12
	.word 0xa1930000  ! 246: WRPR_GL_R	wrpr	%r12, %r0, %-
	mov	0, %r12
	.word 0xa1930000  ! 247: WRPR_GL_R	wrpr	%r12, %r0, %-
	setx	0x8608e820000028d7, %g1, %r10
	.word 0x839a8000  ! 251: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb3aa4820  ! 257: FMOVNE	fmovs	%fcc1, %f0, %f25
	.word 0xb645a14b  ! 259: ADDC_I	addc 	%r22, 0x014b, %r27
	.word 0xb4158000  ! 262: OR_R	or 	%r22, %r0, %r26
	.word 0xbbab4820  ! 267: FMOVCC	fmovs	%fcc1, %f0, %f29
	.word 0xb425a059  ! 271: SUB_I	sub 	%r22, 0x0059, %r26
	.word 0xbda88820  ! 272: FMOVLE	fmovs	%fcc1, %f0, %f30
hwintr_1_10:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_10), 16, 16)) -> intp(1, 0, 24)
hwintr_1_11:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_11), 16, 16)) -> intp(1, 0, 37)
	.word 0xb1520000  ! 275: RDPR_PIL	<illegal instruction>
	.word 0xb5510000  ! 277: RDPR_TICK	<illegal instruction>
	.word 0x8394e1f2  ! 278: WRPR_TNPC_I	wrpr	%r19, 0x01f2, %tnpc
	.word 0xbda548c0  ! 280: FSUBd	fsubd	%f52, %f0, %f30
	.word 0xbba448c0  ! 281: FSUBd	fsubd	%f48, %f0, %f60
	.word 0xb1a48920  ! 283: FMULs	fmuls	%f18, %f0, %f24
hwintr_1_12:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_12), 16, 16)) -> intp(1, 0, 39)
	setx	data_start_5, %g1, %r18
	.word 0xbfaa0820  ! 287: FMOVA	fmovs	%fcc1, %f0, %f31
	.word 0x819521db  ! 288: WRPR_TPC_I	wrpr	%r20, 0x01db, %tpc
	.word 0x87946104  ! 289: WRPR_TT_I	wrpr	%r17, 0x0104, %tt
	.word 0xbd504000  ! 291: RDPR_TNPC	rdpr	%tnpc, %r30
	mov	2, %r12
	.word 0x8f930000  ! 292: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xb7500000  ! 296: RDPR_TPC	<illegal instruction>
	.word 0xb1a80820  ! 297: FMOVRLEZ	fmovs	%fcc1, %f0, %f24
	mov	2, %r12
	.word 0xa1930000  ! 298: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb7a80c20  ! 302: FMOVRLZ	dis not found

	.word 0xb814e16e  ! 304: OR_I	or 	%r19, 0x016e, %r28
	.word 0xb7480000  ! 310: RDHPR_HPSTATE	rdhpr	%hpstate, %r27
hwintr_1_13:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_13), 16, 16)) -> intp(1, 0, 16)
	.word 0xb9a00560  ! 312: FSQRTq	fsqrt	
hwintr_1_14:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_14), 16, 16)) -> intp(1, 0, 0)
	.word 0xb5aa8820  ! 314: FMOVG	fmovs	%fcc1, %f0, %f26
	setx	data_start_2, %g1, %r18
	.word 0xb3a5c920  ! 317: FMULs	fmuls	%f23, %f0, %f25
	.word 0xb3a548e0  ! 318: FSUBq	dis not found

hwintr_1_15:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_15), 16, 16)) -> intp(1, 0, 24)
	.word 0xbfa548a0  ! 322: FSUBs	fsubs	%f21, %f0, %f31
	.word 0x819561df  ! 327: WRPR_TPC_I	wrpr	%r21, 0x01df, %tpc
	.word 0xbf520000  ! 328: RDPR_PIL	<illegal instruction>
	.word 0xb2156107  ! 330: OR_I	or 	%r21, 0x0107, %r25
	.word 0xbcb4e0c7  ! 331: SUBCcc_I	orncc 	%r19, 0x00c7, %r30
	.word 0xbfa409e0  ! 333: FDIVq	dis not found

	.word 0xb77da401  ! 334: MOVR_I	movre	%r22, 0x1, %r27
	.word 0xbbabc820  ! 337: FMOVVC	fmovs	%fcc1, %f0, %f29
	.word 0xb5a44820  ! 338: FADDs	fadds	%f17, %f0, %f26
	.word 0xbda81c20  ! 339: FMOVRGEZ	dis not found

	.word 0xb3a98820  ! 340: FMOVNEG	fmovs	%fcc1, %f0, %f25
	.word 0xbebd8000  ! 343: XNORcc_R	xnorcc 	%r22, %r0, %r31
	.word 0xb93dd000  ! 345: SRAX_R	srax	%r23, %r0, %r28
	.word 0xbb480000  ! 349: RDHPR_HPSTATE	rdhpr	%hpstate, %r29
	.word 0xb73c4000  ! 350: SRA_R	sra 	%r17, %r0, %r27
	.word 0xbfa00020  ! 351: FMOVs	fmovs	%f0, %f31
	.word 0xbda00020  ! 355: FMOVs	fmovs	%f0, %f30
hwintr_1_16:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_16), 16, 16)) -> intp(1, 0, f)
	.word 0xb9a5c940  ! 358: FMULd	fmuld	%f54, %f0, %f28
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbcac0000  ! 364: ANDNcc_R	andncc 	%r16, %r0, %r30
	.word 0xba354000  ! 366: ORN_R	orn 	%r21, %r0, %r29
	.word 0xbcb52046  ! 373: ORNcc_I	orncc 	%r20, 0x0046, %r30
	.word 0xb550c000  ! 374: RDPR_TT	<illegal instruction>
	.word 0xbd35b001  ! 375: SRLX_I	srlx	%r22, 0x0001, %r30
	.word 0xb1a40840  ! 376: FADDd	faddd	%f16, %f0, %f24
	.word 0xbba88820  ! 381: FMOVLE	fmovs	%fcc1, %f0, %f29
	.word 0xb7a5c9a0  ! 386: FDIVs	fdivs	%f23, %f0, %f27
hwintr_1_17:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_17), 16, 16)) -> intp(1, 0, c)
	.word 0xb5a58820  ! 390: FADDs	fadds	%f22, %f0, %f26
	.word 0xbfa50860  ! 392: FADDq	dis not found

	.word 0xbb500000  ! 394: RDPR_TPC	<illegal instruction>
	.word 0x83942123  ! 399: WRPR_TNPC_I	wrpr	%r16, 0x0123, %tnpc
	.word 0x919460ba  ! 403: WRPR_PIL_I	wrpr	%r17, 0x00ba, %pil
	.word 0xbfa5c840  ! 418: FADDd	faddd	%f54, %f0, %f62
	.word 0xbfa40920  ! 420: FMULs	fmuls	%f16, %f0, %f31
	.word 0xbf500000  ! 421: RDPR_TPC	<illegal instruction>
hwintr_1_18:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_18), 16, 16)) -> intp(1, 0, 2e)
	.word 0xb5a5c820  ! 433: FADDs	fadds	%f23, %f0, %f26
	.word 0xb2b5a0d7  ! 434: ORNcc_I	orncc 	%r22, 0x00d7, %r25
	.word 0xb5508000  ! 439: RDPR_TSTATE	<illegal instruction>
	.word 0xba9460b9  ! 440: ORcc_I	orcc 	%r17, 0x00b9, %r29
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
hwintr_1_19:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_19), 16, 16)) -> intp(1, 0, 37)
	.word 0xb5a80820  ! 445: FMOVRLEZ	fmovs	%fcc1, %f0, %f26
	.word 0xbbab0820  ! 446: FMOVGU	fmovs	%fcc1, %f0, %f29
	.word 0xb1a449a0  ! 448: FDIVs	fdivs	%f17, %f0, %f24
	.word 0xbba4c940  ! 450: FMULd	fmuld	%f50, %f0, %f60
	.word 0xbdaa8820  ! 451: FMOVG	fmovs	%fcc1, %f0, %f30
	.word 0xbda00020  ! 457: FMOVs	fmovs	%f0, %f30
hwintr_1_20:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_20), 16, 16)) -> intp(1, 0, 3f)
	.word 0xb77ca401  ! 462: MOVR_I	movre	%r18, 0x1, %r27
	.word 0xbba549e0  ! 467: FDIVq	dis not found

	.word 0xbd2ca001  ! 468: SLL_I	sll 	%r18, 0x0001, %r30
	.word 0xbd520000  ! 469: RDPR_PIL	<illegal instruction>
	.word 0xb3504000  ! 478: RDPR_TNPC	<illegal instruction>
	.word 0xbe040000  ! 480: ADD_R	add 	%r16, %r0, %r31
	.word 0xb3480000  ! 481: RDHPR_HPSTATE	rdhpr	%hpstate, %r25
	.word 0xbda00520  ! 483: FSQRTs	fsqrt	
hwintr_1_21:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_21), 16, 16)) -> intp(1, 0, 23)
	.word 0x859560ad  ! 491: WRPR_TSTATE_I	wrpr	%r21, 0x00ad, %tstate
	.word 0xb7a80c20  ! 495: FMOVRLZ	dis not found

	.word 0x8394a1ad  ! 497: WRPR_TNPC_I	wrpr	%r18, 0x01ad, %tnpc
	.word 0x899520b6  ! 499: WRPR_TICK_I	wrpr	%r20, 0x00b6, %tick
	.word 0xb9a00020  ! 501: FMOVs	fmovs	%f0, %f28
	.word 0xbfa588c0  ! 502: FSUBd	fsubd	%f22, %f0, %f62
	.word 0xbda549c0  ! 505: FDIVd	fdivd	%f52, %f0, %f30
	.word 0x8994a0ab  ! 506: WRPR_TICK_I	wrpr	%r18, 0x00ab, %tick
	.word 0xb5a408c0  ! 508: FSUBd	fsubd	%f16, %f0, %f26
hwintr_1_22:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_22), 16, 16)) -> intp(1, 0, 32)
	.word 0xbfa4c8c0  ! 512: FSUBd	fsubd	%f50, %f0, %f62
	.word 0xb350c000  ! 513: RDPR_TT	<illegal instruction>
	.word 0xbba80c20  ! 514: FMOVRLZ	dis not found

	mov	0, %r12
	.word 0xa1930000  ! 515: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xbda9c820  ! 517: FMOVVS	fmovs	%fcc1, %f0, %f30
	.word 0xb7a80820  ! 519: FMOVRLEZ	fmovs	%fcc1, %f0, %f27
	.word 0xb7abc820  ! 522: FMOVVC	fmovs	%fcc1, %f0, %f27
	.word 0xbba408c0  ! 528: FSUBd	fsubd	%f16, %f0, %f60
	.word 0xb9a80820  ! 529: FMOVRLEZ	fmovs	%fcc1, %f0, %f28
	.word 0xb5ab0820  ! 531: FMOVGU	fmovs	%fcc1, %f0, %f26
	setx	data_start_0, %g1, %r21
	.word 0xb5a8c820  ! 534: FMOVL	fmovs	%fcc1, %f0, %f26
	.word 0x899420ad  ! 539: WRPR_TICK_I	wrpr	%r16, 0x00ad, %tick
	.word 0xb9480000  ! 542: RDHPR_HPSTATE	rdhpr	%hpstate, %r28
	.word 0xb9aac820  ! 546: FMOVGE	fmovs	%fcc1, %f0, %f28
hwintr_1_23:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_23), 16, 16)) -> intp(1, 0, 25)
hwintr_1_24:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_24), 16, 16)) -> intp(1, 0, b)
	.word 0xbfaac820  ! 557: FMOVGE	fmovs	%fcc1, %f0, %f31
	.word 0xbbaac820  ! 559: FMOVGE	fmovs	%fcc1, %f0, %f29
	.word 0xb1510000  ! 563: RDPR_TICK	<illegal instruction>
	.word 0xbba81c20  ! 564: FMOVRGEZ	dis not found

hwintr_1_25:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_25), 16, 16)) -> intp(1, 0, 22)
	.word 0xb7a548e0  ! 570: FSUBq	dis not found

	.word 0xb5a448a0  ! 572: FSUBs	fsubs	%f17, %f0, %f26
	.word 0xb3a81c20  ! 574: FMOVRGEZ	dis not found

	.word 0xbda54860  ! 578: FADDq	dis not found

	.word 0xb7a81820  ! 582: FMOVRGZ	fmovs	%fcc3, %f0, %f27
hwintr_1_26:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_26), 16, 16)) -> intp(1, 0, 2e)
	.word 0xbda448e0  ! 585: FSUBq	dis not found

	.word 0xbba81c20  ! 588: FMOVRGEZ	dis not found

	.word 0xbda40960  ! 589: FMULq	dis not found

	.word 0xb9a449c0  ! 590: FDIVd	fdivd	%f48, %f0, %f28
	.word 0xb3a588a0  ! 591: FSUBs	fsubs	%f22, %f0, %f25
hwintr_1_27:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_27), 16, 16)) -> intp(1, 0, 2b)
	setx	0xbc45148000004b0f, %g1, %r10
	.word 0x819a8000  ! 595: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xb5a00520  ! 597: FSQRTs	fsqrt	
	mov	2, %r12
	.word 0xa1930000  ! 599: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb7a408c0  ! 601: FSUBd	fsubd	%f16, %f0, %f58
	.word 0x8994a1d4  ! 602: WRPR_TICK_I	wrpr	%r18, 0x01d4, %tick
	mov	1, %r12
	.word 0x8f930000  ! 607: WRPR_TL_R	wrpr	%r12, %r0, %tl
	setx	0x9e61e7c00007f95, %g1, %r10
	.word 0x819a8000  ! 608: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0x9195613c  ! 616: WRPR_PIL_I	wrpr	%r21, 0x013c, %pil
	.word 0xb9643801  ! 619: MOVcc_I	<illegal instruction>
	.word 0x83946132  ! 623: WRPR_TNPC_I	wrpr	%r17, 0x0132, %tnpc
	.word 0xb1a94820  ! 625: FMOVCS	fmovs	%fcc1, %f0, %f24
	.word 0xbc95e122  ! 631: ORcc_I	orcc 	%r23, 0x0122, %r30
	.word 0xb7a5c840  ! 636: FADDd	faddd	%f54, %f0, %f58
	.word 0xba85e12c  ! 638: ADDcc_I	addcc 	%r23, 0x012c, %r29
	.word 0xb5a50840  ! 643: FADDd	faddd	%f20, %f0, %f26
	.word 0xb7a81820  ! 644: FMOVRGZ	fmovs	%fcc3, %f0, %f27
	.word 0xb3a80420  ! 646: FMOVRZ	dis not found

	.word 0xbc854000  ! 647: ADDcc_R	addcc 	%r21, %r0, %r30
hwintr_1_28:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_28), 16, 16)) -> intp(1, 0, 35)
	.word 0xb7a40940  ! 651: FMULd	fmuld	%f16, %f0, %f58
	.word 0xbba81c20  ! 652: FMOVRGEZ	dis not found

hwintr_1_29:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_29), 16, 16)) -> intp(1, 0, 1d)
	setx	0x35b6d92100009d12, %g1, %r10
	.word 0x819a8000  ! 654: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xb1a58840  ! 656: FADDd	faddd	%f22, %f0, %f24
	.word 0xb41cc000  ! 660: XOR_R	xor 	%r19, %r0, %r26
	.word 0xb4350000  ! 661: SUBC_R	orn 	%r20, %r0, %r26
hwintr_1_30:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_30), 16, 16)) -> intp(1, 0, 3d)
	.word 0xb8a50000  ! 665: SUBcc_R	subcc 	%r20, %r0, %r28
	.word 0xb9a90820  ! 668: FMOVLEU	fmovs	%fcc1, %f0, %f28
	.word 0xb5a81820  ! 669: FMOVRGZ	fmovs	%fcc3, %f0, %f26
	.word 0xbba00540  ! 675: FSQRTd	fsqrt	
hwintr_1_31:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_31), 16, 16)) -> intp(1, 0, 0)
	.word 0xb5a40940  ! 679: FMULd	fmuld	%f16, %f0, %f26
	.word 0xb3a40840  ! 680: FADDd	faddd	%f16, %f0, %f56
	.word 0x8995e103  ! 681: WRPR_TICK_I	wrpr	%r23, 0x0103, %tick
hwintr_1_32:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_32), 16, 16)) -> intp(1, 0, 17)
	.word 0xb9a589e0  ! 686: FDIVq	dis not found

	.word 0xbfa8c820  ! 687: FMOVL	fmovs	%fcc1, %f0, %f31
	.word 0xb3a88820  ! 689: FMOVLE	fmovs	%fcc1, %f0, %f25
	mov	0, %r12
	.word 0x8f930000  ! 691: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xbfaac820  ! 695: FMOVGE	fmovs	%fcc1, %f0, %f31
	.word 0xbfab8820  ! 696: FMOVPOS	fmovs	%fcc1, %f0, %f31
	.word 0x8794a086  ! 697: WRPR_TT_I	wrpr	%r18, 0x0086, %tt
hwintr_1_33:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_33), 16, 16)) -> intp(1, 0, 3e)
	.word 0xb1a00520  ! 700: FSQRTs	fsqrt	
	.word 0xbba80820  ! 702: FMOVRLEZ	fmovs	%fcc1, %f0, %f29
	.word 0x8994e01d  ! 708: WRPR_TICK_I	wrpr	%r19, 0x001d, %tick
	.word 0xb9a00520  ! 709: FSQRTs	fsqrt	
hwintr_1_34:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_34), 16, 16)) -> intp(1, 0, 2a)
	setx	0xc98f450000cf1b, %g1, %r10
	.word 0x819a8000  ! 721: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xb5500000  ! 722: RDPR_TPC	<illegal instruction>
	.word 0xb1ab4820  ! 723: FMOVCC	fmovs	%fcc1, %f0, %f24
	.word 0xb9a588c0  ! 729: FSUBd	fsubd	%f22, %f0, %f28
	mov	1, %r12
	.word 0xa1930000  ! 733: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0x8794a1df  ! 736: WRPR_TT_I	wrpr	%r18, 0x01df, %tt
	.word 0xba0c21d4  ! 738: AND_I	and 	%r16, 0x01d4, %r29
	.word 0xbe0da11e  ! 739: AND_I	and 	%r22, 0x011e, %r31
	.word 0xb5a50960  ! 742: FMULq	dis not found

	.word 0xb5a00540  ! 746: FSQRTd	fsqrt	
	.word 0xb7a448e0  ! 750: FSUBq	dis not found

	.word 0x9194e182  ! 751: WRPR_PIL_I	wrpr	%r19, 0x0182, %pil
	.word 0xb5a5c960  ! 752: FMULq	dis not found

	.word 0x8394611d  ! 755: WRPR_TNPC_I	wrpr	%r17, 0x011d, %tnpc
	.word 0xbdaa0820  ! 756: FMOVA	fmovs	%fcc1, %f0, %f30
	.word 0xb6254000  ! 757: SUB_R	sub 	%r21, %r0, %r27
	.word 0xb89521d2  ! 761: ORcc_I	orcc 	%r20, 0x01d2, %r28
hwintr_1_35:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_35), 16, 16)) -> intp(1, 0, 1a)
hwintr_1_36:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_36), 16, 16)) -> intp(1, 0, 17)
	.word 0xb1a80c20  ! 769: FMOVRLZ	dis not found

	.word 0xb9a00520  ! 772: FSQRTs	fsqrt	
	.word 0xb3a81820  ! 782: FMOVRGZ	fmovs	%fcc3, %f0, %f25
	.word 0xb7a4c9a0  ! 786: FDIVs	fdivs	%f19, %f0, %f27
	.word 0xbf480000  ! 787: RDHPR_HPSTATE	rdhpr	%hpstate, %r31
	.word 0xb1a40940  ! 788: FMULd	fmuld	%f16, %f0, %f24
	.word 0xb9ab4820  ! 791: FMOVCC	fmovs	%fcc1, %f0, %f28
hwintr_1_37:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_37), 16, 16)) -> intp(1, 0, 21)
	.word 0xb7a5c9a0  ! 793: FDIVs	fdivs	%f23, %f0, %f27
	.word 0xb9a80c20  ! 795: FMOVRLZ	dis not found

	.word 0xb9a80820  ! 805: FMOVN	fmovs	%fcc1, %f0, %f28
hwintr_1_38:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_38), 16, 16)) -> intp(1, 0, 3b)
	.word 0xb9a9c820  ! 811: FMOVVS	fmovs	%fcc1, %f0, %f28
	.word 0xbb344000  ! 814: SRL_R	srl 	%r17, %r0, %r29
	.word 0xbda80820  ! 823: FMOVN	fmovs	%fcc1, %f0, %f30
	.word 0xb3a98820  ! 829: FMOVNEG	fmovs	%fcc1, %f0, %f25
	.word 0xbbaa8820  ! 834: FMOVG	fmovs	%fcc1, %f0, %f29
	setx	data_start_5, %g1, %r23
	.word 0xb9a40820  ! 845: FADDs	fadds	%f16, %f0, %f28
	.word 0xbf500000  ! 849: RDPR_TPC	<illegal instruction>
	setx	data_start_2, %g1, %r23
	.word 0x8595a10d  ! 864: WRPR_TSTATE_I	wrpr	%r22, 0x010d, %tstate
	.word 0xb3ab8820  ! 866: FMOVPOS	fmovs	%fcc1, %f0, %f25
	.word 0xbfaa8820  ! 868: FMOVG	fmovs	%fcc1, %f0, %f31
	setx	data_start_6, %g1, %r21
	.word 0xbba00560  ! 871: FSQRTq	fsqrt	
	.word 0xbb508000  ! 876: RDPR_TSTATE	<illegal instruction>
	.word 0xb1a90820  ! 880: FMOVLEU	fmovs	%fcc1, %f0, %f24
	.word 0xbbaa0820  ! 881: FMOVA	fmovs	%fcc1, %f0, %f29
hwintr_1_39:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_39), 16, 16)) -> intp(1, 0, 1e)
	.word 0xb1a8c820  ! 885: FMOVL	fmovs	%fcc1, %f0, %f24
	.word 0xb1a00540  ! 887: FSQRTd	fsqrt	
hwintr_1_40:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_40), 16, 16)) -> intp(1, 0, a)
	.word 0x8d9420fa  ! 893: WRPR_PSTATE_I	wrpr	%r16, 0x00fa, %pstate
	.word 0xb044213b  ! 895: ADDC_I	addc 	%r16, 0x013b, %r24
	.word 0xbda54920  ! 897: FMULs	fmuls	%f21, %f0, %f30
	setx	data_start_3, %g1, %r20
	.word 0xb9a9c820  ! 900: FMOVVS	fmovs	%fcc1, %f0, %f28
	setx	0x16bd263e00008e0c, %g1, %r10
	.word 0x839a8000  ! 904: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb7aa4820  ! 905: FMOVNE	fmovs	%fcc1, %f0, %f27
	.word 0xbda48860  ! 910: FADDq	dis not found

	.word 0x8395a06d  ! 911: WRPR_TNPC_I	wrpr	%r22, 0x006d, %tnpc
	.word 0xb9510000  ! 915: RDPR_TICK	<illegal instruction>
	.word 0xb3a00560  ! 919: FSQRTq	fsqrt	
hwintr_1_41:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_41), 16, 16)) -> intp(1, 0, 5)
	.word 0xb5a00040  ! 924: FMOVd	fmovd	%f0, %f26
	.word 0xbb500000  ! 927: RDPR_TPC	<illegal instruction>
	.word 0xb1a80820  ! 928: FMOVRLEZ	fmovs	%fcc1, %f0, %f24
	.word 0xbdaa0820  ! 930: FMOVA	fmovs	%fcc1, %f0, %f30
	setx	0xe95d824d0000ce41, %g1, %r10
	.word 0x819a8000  ! 938: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
hwintr_1_42:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_42), 16, 16)) -> intp(1, 0, 34)
	.word 0xb7ab0820  ! 949: FMOVGU	fmovs	%fcc1, %f0, %f27
	setx	0xf1dedfba0000ec58, %g1, %r10
	.word 0x819a8000  ! 950: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0x81952178  ! 951: WRPR_TPC_I	wrpr	%r20, 0x0178, %tpc
	.word 0x8994e1a7  ! 953: WRPR_TICK_I	wrpr	%r19, 0x01a7, %tick
hwintr_1_43:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_43), 16, 16)) -> intp(1, 0, 10)
	.word 0xbeb44000  ! 956: ORNcc_R	orncc 	%r17, %r0, %r31
hwintr_1_44:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_44), 16, 16)) -> intp(1, 0, 37)
	.word 0xb404c000  ! 959: ADD_R	add 	%r19, %r0, %r26
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbfa58860  ! 966: FADDq	dis not found

	setx	data_start_6, %g1, %r23
	.word 0x8194a09e  ! 970: WRPR_TPC_I	wrpr	%r18, 0x009e, %tpc
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0x8394a152  ! 976: WRPR_TNPC_I	wrpr	%r18, 0x0152, %tnpc
	.word 0xb7a88820  ! 978: FMOVLE	fmovs	%fcc1, %f0, %f27
	.word 0xb7a00520  ! 979: FSQRTs	fsqrt	
	setx	0xdb7c2cc900000b10, %g1, %r10
	.word 0x839a8000  ! 980: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb5540000  ! 984: RDPR_GL	<illegal instruction>
	.word 0xbbab8820  ! 985: FMOVPOS	fmovs	%fcc1, %f0, %f29
	.word 0x8394218a  ! 986: WRPR_TNPC_I	wrpr	%r16, 0x018a, %tnpc
	setx	data_start_4, %g1, %r19
	.word 0xbfa40940  ! 991: FMULd	fmuld	%f16, %f0, %f62
	.word 0xb9a58940  ! 992: FMULd	fmuld	%f22, %f0, %f28
	.word 0xb3aa8820  ! 993: FMOVG	fmovs	%fcc1, %f0, %f25
	.word 0xb3aac820  ! 997: FMOVGE	fmovs	%fcc1, %f0, %f25

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

	.xword	0xfd8f63082b07cedd
	.xword	0xbb450633f22277a8
	.xword	0xe101b313966b1a5b
	.xword	0x677baf360dedade9
	.xword	0x117804ad75b7304b
	.xword	0xdb7333044c9af9e2
	.xword	0x61fdf885b5270b75
	.xword	0xae4b7429373437b5
	.xword	0x9827d6a1a34a5521
	.xword	0x5852f7fd9ea7a280
	.xword	0x90ffee5b626133fd
	.xword	0xe81d3e97fac1575b
	.xword	0x5b65ab9a0fb29ce7
	.xword	0xe82ced44246f6dc5
	.xword	0x16939fd88300a639
	.xword	0xbf784a436df5c0b0
	.xword	0x3fd77903e91a089a
	.xword	0x8d178f0d568abc5d
	.xword	0x82c908c015056bb5
	.xword	0xe3d8b78774114cc0
	.xword	0xa95989539374e9f5
	.xword	0x95261255cd887cf8
	.xword	0x5d8f512ec339afe5
	.xword	0x7a23831d465011bf
	.xword	0xe88f41a677cc7c80
	.xword	0xffd9b69beeb5c98c
	.xword	0x5fbdbf8408fed000
	.xword	0x08e0f8773abd1731
	.xword	0xc219aeac0e55fc49
	.xword	0xd094989f2d108d05
	.xword	0x6a70dc036ece041c
	.xword	0x4ae252d52b1bb382
	.xword	0xb08ce8ffdfb52f9a
	.xword	0xc42f52cdb90a0fc6
	.xword	0xfbdc4cd39bcf4ffb
	.xword	0xe9321ac8768c7dde
	.xword	0xca31eca13940ec34
	.xword	0x64d94baaac7d010f
	.xword	0xbac749fec28f5186
	.xword	0x720bb8aa5a5f1a30
	.xword	0xd701162c87ec8f6b
	.xword	0x8c74aca215468d0e
	.xword	0x240fcce4ceb2ebb0
	.xword	0x7a2cf11f2cc919f1
	.xword	0x1d1f4ae2a94dbb90
	.xword	0x798bc516d3903fcb
	.xword	0xa24de9e31b544828
	.xword	0x8282e5c107d2d7f6
	.xword	0x5b240133ce6449e5
	.xword	0xb750a55bd8f5c4d8
	.xword	0xb63fc2bdfa68497c
	.xword	0x118c31417f9d76c5
	.xword	0xab4767c31d6c4760
	.xword	0x09dd61af35b4a805
	.xword	0xfb13ab1e2a316797
	.xword	0x058c75c26a425256
	.xword	0x76a4dcf748ea62d3
	.xword	0x023aff458b64aeb7
	.xword	0x7d95af31ca783232
	.xword	0xa2de42bb97fa61b6
	.xword	0xe7ccaf4d56260489
	.xword	0xe91e3c57bda3177a
	.xword	0x413473ae8df99071
	.xword	0x00a45ce0b9e6b0dc
	.xword	0xa1348fa1806a8320
	.xword	0xe10a3a504a602091
	.xword	0x4643ca1a87d6837a
	.xword	0x447ded00ae803b89
	.xword	0x4359da103b9115ba
	.xword	0xcaf46a9cb6396ef3
	.xword	0xae09e3e3f7fe62c8
	.xword	0xe296f0af545d934a
	.xword	0xb02c2ec1fdb2da06
	.xword	0xef86bddb2a224b1b
	.xword	0x75d0c52e28db4e09
	.xword	0x1efb7930f1c13727
	.xword	0x5ffbee9ed813ca14
	.xword	0xb76b94221517c364
	.xword	0x02f9e4e029db7e69
	.xword	0x9dac248d343e7734
	.xword	0x934f8a6ec06b03f6
	.xword	0xead10fb692979c26
	.xword	0xe7ed34a6bad2582a
	.xword	0xb4492d293a08f18e
	.xword	0x6472f213605beeb5
	.xword	0xe55f4daaddb30e4c
	.xword	0x8f49b02f20b5b4e2
	.xword	0x9c6a50edcc4322ab
	.xword	0x24e4cadd718325b7
	.xword	0x9ca5dc26559df5e8
	.xword	0xe5735aabbcf49f23
	.xword	0xed0784d785fd51be
	.xword	0x00e35ce8f025516c
	.xword	0xc882729498c94c9f
	.xword	0x4df20f941689e794
	.xword	0xf835316b8d13f7d5
	.xword	0xa4e705bc58dea911
	.xword	0x607843b4d0cb74a5
	.xword	0xea325a996561b2c2
	.xword	0x4c655701d3d52c99
	.xword	0x7981369d5dfa58a7
	.xword	0xdb3004d68e527508
	.xword	0xda27090c26424eac
	.xword	0xd182b26f5e338593
	.xword	0x8cdbb3833baf1ccb
	.xword	0x428b9ca7b19fb80c
	.xword	0xa00cdf6a8bbb4c52
	.xword	0x23a37e30c742031e
	.xword	0x0ced3b8a58891f68
	.xword	0x5ba94b420fa5f310
	.xword	0xd83861dbbcb07562
	.xword	0x006cb8e197b712ed
	.xword	0x0e3593baf79858aa
	.xword	0x260a2dee80a12af6
	.xword	0x045252ca059a3706
	.xword	0xb276ab9dbd69f55a
	.xword	0x3a2b9e74625cc4cd
	.xword	0xa0f469ef5ac7787f
	.xword	0xf859acd23e2b3235
	.xword	0x010f513cb1b6d823
	.xword	0x117f8c585ca28269
	.xword	0xe0f524a103490dad
	.xword	0x178b854c5c86dcc4
	.xword	0x559555291cd007b3
	.xword	0xd0dd3279cad7e7aa
	.xword	0x557222455ec95d1d
	.xword	0xa6aa2f91b51972e0
	.xword	0x1701b729c015dbec
	.xword	0xe5f50ff262a15e3c
	.xword	0xbae6b2bfe9de350a
	.xword	0x04d4b8be177cdb03
	.xword	0x14a1825ff5781cca
	.xword	0x91ac35eebd17ebba
	.xword	0xedcd768d541882d6
	.xword	0x04b2f4761508bd62
	.xword	0x0547a06c60b5d4a5
	.xword	0xef63dbee4a70d9db
	.xword	0xc3eea65d4a62fff7
	.xword	0xdf4d2ab3ae99d10a
	.xword	0x3aa8f59922219f99
	.xword	0xdb4960fc3ef403e7
	.xword	0xcd59e799fdb2b399
	.xword	0xac70c110e86d1be8
	.xword	0xe86462c89af5b139
	.xword	0xf069264d66ffc710
	.xword	0x6278298827ad901c
	.xword	0x8d73546825b36b71
	.xword	0xf87c929afb20a842
	.xword	0xdbb8e7e555136973
	.xword	0xb1d1bb07e09247e4
	.xword	0xaec396d0f0bd5cf3
	.xword	0xb5a2f17d9dba76ca
	.xword	0xabb06ada853cddd2
	.xword	0xc520aa0d595163c3
	.xword	0x7fa25d5f9cfd471e
	.xword	0xdaf6e779d8ecb90b
	.xword	0xc86d5c1ee7dd0247
	.xword	0xcc20aace4c915a08
	.xword	0x0990504801e64cde
	.xword	0x646b339ee7a1dc5c
	.xword	0xb9b141dd3c544f13
	.xword	0x5e9231ae4b357b21
	.xword	0x4e4311f0fdc8f9c3
	.xword	0x0add6c61b08a26f5
	.xword	0xfed0b4503c9e1536
	.xword	0x5d4fa6fc802ed427
	.xword	0xcce54d33f27764da
	.xword	0x1226e9e1174193ba
	.xword	0x18c5ad29060c9e53
	.xword	0xa38fac6559d6b689
	.xword	0x9d6205754b842484
	.xword	0xa3b7f00e62a7ef9c
	.xword	0x349346b3a007f380
	.xword	0x0cec1a6893c8f166
	.xword	0xdba449f3f5f776fb
	.xword	0x21ee4da506d249d8
	.xword	0x3c641b2217f19c23
	.xword	0xedfbd8b48c8bbb0a
	.xword	0x3360f2b7fb87db53
	.xword	0xe0a8bd4574df0f99
	.xword	0x2f161b3c9d402e6f
	.xword	0x953a07786304d281
	.xword	0x351865c1b30294d4
	.xword	0xc9b3deed48a2638e
	.xword	0x02cfca55f5d81a3b
	.xword	0x1abd56e8e74cd08b
	.xword	0x52bdba3937b3e474
	.xword	0xdc46274466e55c31
	.xword	0x1d597566ac4819a2
	.xword	0x4610be1f755e1059
	.xword	0x90577183be0f3705
	.xword	0x34ea3a965114ef1e
	.xword	0x859f6aeb79312079
	.xword	0x71d48992881c3fe9
	.xword	0x91e6f8bf194e7a3e
	.xword	0xfbdea7716561c11e
	.xword	0x81ad0e8c5db6ac3f
	.xword	0x85df278da98cb745
	.xword	0x63e0273150de5197
	.xword	0x2117eec4ab79fb36
	.xword	0x78a0e764a209015c
	.xword	0xda3aab345cdbe48a
	.xword	0xe176a12cbb55a3fe
	.xword	0x517d05ac7fbedca7
	.xword	0x30d9a92af6c31d39
	.xword	0xeaae5c5f4dc7c5bd
	.xword	0xe6dad4a4a02f6e4b
	.xword	0x392318161867f057
	.xword	0xebfe6be6334577cf
	.xword	0xad96daffd9cb4611
	.xword	0x0d1f2fe3886667c1
	.xword	0x3be38846f458599e
	.xword	0x5b6ec60b480686b4
	.xword	0x97f5fb1e0ed9a1f4
	.xword	0x60c610eca03dfbc0
	.xword	0xd66d6aa4cc008766
	.xword	0x1bf29223dedbeab7
	.xword	0xb69800c5945258d1
	.xword	0x8bd48aa0ab94b161
	.xword	0x93b39e0abad74b62
	.xword	0xc9d8f3968b7c4496
	.xword	0x967676f8f6894c23
	.xword	0x98adb9f1e8c3dd33
	.xword	0x45e131497817a6c3
	.xword	0x0aaf42c41ec2e5c8
	.xword	0xbfda21889193de69
	.xword	0x17d03e686e550efc
	.xword	0x697d60c8dce36c4a
	.xword	0x720911a83c4e9ae0
	.xword	0x05558e8482f037c9
	.xword	0xd8cbdc03a7537367
	.xword	0x8b5fe74d90b78b6b
	.xword	0x0027cba177e5f8da
	.xword	0x981835f0778627d9
	.xword	0xba311a40315ca929
	.xword	0xb78be9f6d8e17ae1
	.xword	0xe354595a83452ab7
	.xword	0x926209bff54d0b44
	.xword	0xfa23db16ae38faf9
	.xword	0x4fafbafef5b35df3
	.xword	0x862a88e08640163d
	.xword	0x3b0744ba34ac9e2f
	.xword	0x9d4b7873affd7392
	.xword	0x8c57376a1bbac6dd
	.xword	0x6f491c509a3f469a
	.xword	0x1923c39a33a78a3f
	.xword	0x88a7e9a8d6d1134e
	.xword	0xfb07592f16834bd2
	.xword	0xcb253399869e2e1e
	.xword	0xdd7c31aa6acc89af
	.xword	0x47a8c60fcf3b752d
	.xword	0xb96a10708edead3b
	.xword	0xdfb04a4ffd3b1a8a
	.xword	0x4171e9ce3c5e81d6
	.xword	0xe2dbbfdce85941b3
	.xword	0x3a9c88e10000cad2
	.align 0x2000
	.data
data_start_1:

	.xword	0x83d395d61877cab3
	.xword	0x4069fde2d40f37ea
	.xword	0x017c0a480485ca1d
	.xword	0xd2c27383e5e58c81
	.xword	0x6bc85a0cc2e1e308
	.xword	0x2283c5a5acfe3c7b
	.xword	0x22c85caf0721ce8d
	.xword	0xbf34e0c9f781746f
	.xword	0x5ca99d1846775ef7
	.xword	0x93e8e8be6d8c0d73
	.xword	0xc1e66280a64d6105
	.xword	0x9e93b718e5569e61
	.xword	0xb5680934e16197a0
	.xword	0x00bc0820fb659038
	.xword	0x813792540975600d
	.xword	0xb65fd7a14131e251
	.xword	0xe94f86993aa1db69
	.xword	0xc1c26897de26132c
	.xword	0x7e2dfbea6001f2ae
	.xword	0xd96d5a179e368c39
	.xword	0x1e827869c43044a0
	.xword	0xaaf37e5116b3af26
	.xword	0x5d2475e17aa54482
	.xword	0x8b767ff6afd040fa
	.xword	0x65853bf1c1ab6795
	.xword	0x0b8c2e173cd89774
	.xword	0xbf144bb7a9e21bea
	.xword	0xdba02f70f4829ec5
	.xword	0x0b4d10193bdaa943
	.xword	0x06a17508915fff47
	.xword	0x8bd8c2f911da4534
	.xword	0x49b61450e75faf52
	.xword	0xe98bef06474314a7
	.xword	0x86dd0b92affc86cf
	.xword	0xb2ff6017d2d7c337
	.xword	0x13be136fbc5ff95c
	.xword	0x8a8618e69366ec41
	.xword	0x8aecece586f8d439
	.xword	0xd9599f3d1e879831
	.xword	0x8aa74dde66004e81
	.xword	0x4e39e5ebd5712ecd
	.xword	0x988a92230728d92e
	.xword	0x99afa5f95003ebe9
	.xword	0x0ae25723df297534
	.xword	0xf38eba3a6f47acc3
	.xword	0x086236758fda3c34
	.xword	0x78d834f1c815e551
	.xword	0x778d5b6846e914ad
	.xword	0x643529a7a0799d35
	.xword	0x54ceae2350a8cf60
	.xword	0x57a7c5224c630621
	.xword	0x53871e76bbf1df20
	.xword	0xa92f1364a987db33
	.xword	0x6245867b7ced6fc7
	.xword	0xd00983dc0ce0be23
	.xword	0x8839bb27a0b54725
	.xword	0x01ba65a7ddaa3153
	.xword	0x0bea2a9c1c1ce809
	.xword	0x3c94efe3cbe3ecd4
	.xword	0x065352cb05ff5760
	.xword	0x4709227034e19f10
	.xword	0x99b4bfe08af3dbe5
	.xword	0x34be3deda1ce1b43
	.xword	0xb052f1a2ac7e0d02
	.xword	0x4289a78ec1a30d6a
	.xword	0x3c4f0e4e4433b43f
	.xword	0x88465e553f8bef73
	.xword	0x5d1a4fb49695587b
	.xword	0xb99f6f74c28e1d91
	.xword	0xdb0a350f5b47a14a
	.xword	0xf68db1a3bbc4a53b
	.xword	0x9dbd5fdf5e6fc196
	.xword	0x94ae9be43324d127
	.xword	0x99f3c44335000395
	.xword	0x7ee6b8fce4109d4f
	.xword	0xd9642981213ce064
	.xword	0x4f1c46cc3f5e6229
	.xword	0xa72cffc32eae1b1c
	.xword	0x8c6c58ef092ba5c8
	.xword	0x18e356afc582ccd5
	.xword	0x4c47f78179c95c19
	.xword	0xa23dda2ae77cf5e4
	.xword	0x73f5096b28d7c738
	.xword	0xcad6be4077f3ed71
	.xword	0xb8b8e8b726134674
	.xword	0x36c810429e8c6bf1
	.xword	0xa54252db06b65443
	.xword	0x95d8d11bfbce993b
	.xword	0xbe3ef766539523a9
	.xword	0x59c774fcec47ea9d
	.xword	0xd5165f3a597ff46f
	.xword	0x972fd27f9157da88
	.xword	0x9fc30ed87c3926bc
	.xword	0xc841c18f3861626c
	.xword	0x2533c41494b36e93
	.xword	0x76f3ee3f9d45cf3d
	.xword	0x07dedad5ad57c53c
	.xword	0x4a5cea39792ba33f
	.xword	0x990168fa9d385659
	.xword	0x5671f86376ae00f4
	.xword	0xe0310bae91c2be45
	.xword	0x4acfa3ca4346d1a5
	.xword	0xd4c0b6ae98343c21
	.xword	0x8cb3ca263eeb57dd
	.xword	0x6ac7914f7c855bde
	.xword	0x2280afeb1f88b3e6
	.xword	0x70dbfc3d26ae71c0
	.xword	0x3ca9899190a186c3
	.xword	0xa3b8066b8a127405
	.xword	0x6dea8384cf96cb94
	.xword	0x3bc18f4495fc24a2
	.xword	0xc293cd44fb24e55e
	.xword	0x3fc621293347652e
	.xword	0x0d7feca3641c825c
	.xword	0x094fbb849d1d41fd
	.xword	0x9ba8abfcacd0d440
	.xword	0xb541b059d5d7696c
	.xword	0xb3187cce8fac1b1b
	.xword	0x850770be91ace68d
	.xword	0x965a2ccf0c948c6f
	.xword	0xdf362706db83027e
	.xword	0x4f63633e8efcbf2b
	.xword	0xada7f9dd6cb4deae
	.xword	0x18c282ef59a89eb8
	.xword	0x6d821b89495c7fbb
	.xword	0x595093edbfe06cce
	.xword	0xecc94dbeb4245b22
	.xword	0xdfb69091288c107b
	.xword	0xeb4179e1913e7668
	.xword	0x07a7ec108d6ffc36
	.xword	0x3fcc8bb21f391ce2
	.xword	0x55610403fba09c5f
	.xword	0xee631afd6489752b
	.xword	0x349991e25b8be644
	.xword	0x06b7ce3a69fd8471
	.xword	0xc2eacd294f271de6
	.xword	0x77f0fdfcb3f3251e
	.xword	0x60b6ce62062c1f17
	.xword	0x4b7a0ec566b077a1
	.xword	0xb62670e778d2c10f
	.xword	0x5183b0658a30e1e6
	.xword	0x665f90572525de82
	.xword	0x35fdbb500282604a
	.xword	0xe5d1d2eca09a4292
	.xword	0xafbde79542e4d8bb
	.xword	0x987d33860ef86447
	.xword	0xb40bbdb6fc97354e
	.xword	0x78d2f4b9153e2ffb
	.xword	0x51f934a0fa189f89
	.xword	0xe60f10843f7fce87
	.xword	0xa3d2b673177abeb2
	.xword	0xcef7f36f81b6dc13
	.xword	0xcc2d125103d348e7
	.xword	0x31dd19ddced0d138
	.xword	0xeeec44737539a396
	.xword	0x430c13d424da67b8
	.xword	0xb028853d893ea50e
	.xword	0x54510695cc6190d6
	.xword	0xa91b8b4f68b40eef
	.xword	0x3c4c7c14e33734c1
	.xword	0xa5df434e2876d0f8
	.xword	0x5461595e41a87157
	.xword	0x2c60613a07c411d2
	.xword	0x7620d763c9195c85
	.xword	0x4b4f469072f67af5
	.xword	0x1377dbf4fece0b40
	.xword	0x565b754539886fc9
	.xword	0x97bea431045cbcb7
	.xword	0xb6127ce0188a77f3
	.xword	0x26c10f88ef407691
	.xword	0xe44bdabe58abaa65
	.xword	0x3a0b1c243c77abb1
	.xword	0xe044b96b7a1dc65e
	.xword	0xb8f3260f82f3aecc
	.xword	0x27c571f210c5f972
	.xword	0x7a3bab5f95a76b61
	.xword	0x4a7f9d98c727f6c3
	.xword	0x4d43ee9463197aa6
	.xword	0xd013e8360d436140
	.xword	0x06f48fe9b297d6ad
	.xword	0x3c19d95b3102879b
	.xword	0x4aa5356bb29bf267
	.xword	0x53ac0da3e086ce5d
	.xword	0x82d7fb0536114761
	.xword	0xb6798550270210ed
	.xword	0x7018fd2a48e97841
	.xword	0xefdc200c3cc17457
	.xword	0x69f51e285d773f3c
	.xword	0xd7c0c10c7b1f82c0
	.xword	0x765939ccb1c55737
	.xword	0x74bae77828e28c19
	.xword	0xa98425820365a559
	.xword	0x10a39098128674b7
	.xword	0x28c2b4ffc1a7e2d1
	.xword	0xdb2472e6f881ab2e
	.xword	0xeb0b667091d403f0
	.xword	0x97d99ca4d6b360a5
	.xword	0x0b8f3aa4e182a455
	.xword	0xebc884cd04c7c553
	.xword	0x5b487ef6649f4306
	.xword	0xc27c88a6a989f460
	.xword	0xc2cd0b2b6559b4c8
	.xword	0x504eb9598a94248c
	.xword	0x7e0b1554a5be80d2
	.xword	0x88660df6267cb36c
	.xword	0xc2ff7d74e7600498
	.xword	0x5a6870c72a84531b
	.xword	0x438bdae53fb51832
	.xword	0xc8b32ae94a3fad52
	.xword	0x66b5f6a7731c1d22
	.xword	0x2f9c484eca400806
	.xword	0xb987cd76d71cdd28
	.xword	0xeb7a3825b01e376e
	.xword	0x271e2b044c94c97d
	.xword	0x07f6176e99e8db66
	.xword	0x8a36f2c2c8596723
	.xword	0x3f6e9f5a5b0f8753
	.xword	0x483451121e08ed2d
	.xword	0x3b0527ecc1264b98
	.xword	0x2423e4c0e800f929
	.xword	0xebc0d899c8e99586
	.xword	0x285d4e4348331b54
	.xword	0x8dede064ad0aa6cf
	.xword	0x7b2b71ef4bc49114
	.xword	0x5ad744d41a37b2b8
	.xword	0x2f9d0585a89ba00d
	.xword	0xb4120db5b5e27e90
	.xword	0x62c75bd8681d3065
	.xword	0xaeecec606105f6e9
	.xword	0x2bc1964cbbc47fef
	.xword	0xfcb432febb25c40b
	.xword	0xb8b78f15fe6e4c7b
	.xword	0xaeed9d3f6585e2c0
	.xword	0x2d858165b4b36c8a
	.xword	0x3a315f6a6bd15015
	.xword	0x2ecacae27aa077b4
	.xword	0x5b71a9a61675a784
	.xword	0x227b10b6bef973d6
	.xword	0x7afd6544bfa4cce0
	.xword	0x364a5e1d66a28eef
	.xword	0x3e9de9ec7b3c0641
	.xword	0x5452a02a79516a80
	.xword	0x6ba35587fbf3a0be
	.xword	0x095e6fd8d4cf4358
	.xword	0xecf775829b6e9a6e
	.xword	0x47e045ca6267fc14
	.xword	0x1c6631519b2d46cd
	.xword	0x6b79a9b1aec8a4d6
	.xword	0x6ef4b83ff6e1bfe6
	.xword	0x58a3d5b5a6c947d6
	.xword	0xb5ec7abced97f6e5
	.xword	0x032523ce66fbd1bb
	.xword	0xbd259e6ad014384f
	.xword	0x056b5994b6c2e3ff
	.xword	0xaf4592c284a4e00a
	.xword	0x31ed75d0a570bb03
	.align 0x4000
	.data
data_start_2:

	.xword	0x6ab5ef387a23b4fe
	.xword	0xff9d35d5e58e957f
	.xword	0x69cd68af87d14fef
	.xword	0xd30ca34a4f772552
	.xword	0x1387072d4a43c600
	.xword	0x21fcced8ab0f0daa
	.xword	0xb5dcecbd0153fe54
	.xword	0x5cfa08d4bc2a28cc
	.xword	0x57c5c771ceceeab0
	.xword	0x7ef4b3ef459ab0d8
	.xword	0xd5fa8a75a4731e15
	.xword	0x1dbc776a023592d6
	.xword	0x85ca9e6d0a626774
	.xword	0x4a38571ee67cf549
	.xword	0x3de870322ba56b6e
	.xword	0x9acbe7fd4afc6f39
	.xword	0x9c4ee4fd73323999
	.xword	0x91fa70b9bc10aef4
	.xword	0x3e7ce6dfac601e4d
	.xword	0x10076fce7c8e470e
	.xword	0xdc16626373b4f041
	.xword	0xcf27723fb3386622
	.xword	0xc04b8ae58f7f97c7
	.xword	0x0dc46aa974884e1a
	.xword	0x45039024e604672c
	.xword	0xae747b9f96bb8383
	.xword	0x7678793538cd0aeb
	.xword	0x873f62a5ff920ed0
	.xword	0xe7e61a159e5055c8
	.xword	0x82886caad60e1cc0
	.xword	0x7e330d5fd7ac1a62
	.xword	0x0b8ef45301191750
	.xword	0x5d194ab72150edb4
	.xword	0x2f6cdc5ba87916ba
	.xword	0x02b02a69300b0cba
	.xword	0x862e348105dc93e4
	.xword	0x1d601acddf6a2f43
	.xword	0x4c80b26df275f74a
	.xword	0x42b7e3f4342fada3
	.xword	0xcb984246256faa6c
	.xword	0x3ef91bf0e040807a
	.xword	0x93dd2f2d2396715f
	.xword	0xd8026ae45953391a
	.xword	0x3387c2bafd158986
	.xword	0x3d8e52e97359f7ce
	.xword	0xad416fa943175dd6
	.xword	0xcf6f5357a93d6773
	.xword	0x0e6294d0fef16a65
	.xword	0x8aa6062df4bccafe
	.xword	0x7165e0b106c30b1e
	.xword	0xcdcfb339132d2748
	.xword	0x15cdae35c908af28
	.xword	0x3375e6e5f64b5d8c
	.xword	0xe7b1bc7ac155695b
	.xword	0xf28f2373fe81ad8a
	.xword	0xc9b095c51abcea27
	.xword	0x3bf9d8ee69c15a3c
	.xword	0xc556acd72ba78918
	.xword	0x4cd009f92301e2f7
	.xword	0x90fd4ad3790530ac
	.xword	0x026418fa5475629a
	.xword	0x1d5bd2e71e45c684
	.xword	0x4bda3b0df427d449
	.xword	0x75c036667f934e43
	.xword	0x76763fbf23ae692d
	.xword	0xd8741ee3168030a3
	.xword	0x54c55dcac5b7d4a6
	.xword	0xcfdfa703d2d60b4d
	.xword	0xc91ec8157b39586b
	.xword	0x36540b8fe72aae2f
	.xword	0xa641b881468e98bd
	.xword	0x534646727d52555e
	.xword	0x2303141f72b5ea4b
	.xword	0x3656a3a434d75e56
	.xword	0x6a7557623daf53e4
	.xword	0xb122663b00bf630c
	.xword	0x16fe999bb8ef36dc
	.xword	0xce23ece84ece0a88
	.xword	0xa27c3c802578f414
	.xword	0x3f30995406cb9595
	.xword	0xb05a397f57a8776f
	.xword	0x6b2c8c6a3f635d35
	.xword	0x10e9b25f618ff47d
	.xword	0x89f5c40c8b851191
	.xword	0x1405851e0ddc1c19
	.xword	0xd293bd3d98bd1c04
	.xword	0xa1784635da80b997
	.xword	0x13a89983dd2c7ad2
	.xword	0x4b136d2d68abc06c
	.xword	0x097b27322404d998
	.xword	0xd91cba7d1193a9d9
	.xword	0x2edbf861b8161159
	.xword	0xf2a21611d4345ed0
	.xword	0xcaf10273ae2ecc92
	.xword	0x5b2e2d9ff9dfb75f
	.xword	0x054700a1139c203e
	.xword	0x1d95574fa1c027e7
	.xword	0x786534edff7f38cc
	.xword	0x1fa6fda0a141ba74
	.xword	0xc18179149568c1d8
	.xword	0xa691b2537d73d524
	.xword	0x14711719184b5380
	.xword	0xf81efb10cfd56580
	.xword	0xfc58cfe671022fcc
	.xword	0xfdbcd9f73b2c8418
	.xword	0xf740125f57f56553
	.xword	0x5c91002e05f040b3
	.xword	0x284a3abe18fab020
	.xword	0x8b8295924067f3c7
	.xword	0xdf201b615e5dee97
	.xword	0x9321acdeb599e3c4
	.xword	0x83b55e6c3551da8f
	.xword	0x6b7d5c32b9b60843
	.xword	0x67f14c5eb36f11e6
	.xword	0x41834c5adbca9c3a
	.xword	0xa9bd892daf5ee743
	.xword	0x4c34e1fea94c6662
	.xword	0x74ef9c1e47fa011a
	.xword	0x45dd4283457f8ddf
	.xword	0x3740061d1b77f454
	.xword	0xd99747862a9e10da
	.xword	0x787aa2c69858c26c
	.xword	0xc5b265003461cdfd
	.xword	0x00f9b4b672e45984
	.xword	0xce6507f670fedcd0
	.xword	0x385c146af04bcde6
	.xword	0x9ed571c9328e9ebc
	.xword	0x0848cce9545b65f9
	.xword	0x51a74bbf0cdae5ab
	.xword	0x5e03c349caea8c10
	.xword	0x8af1a4758dd74aa7
	.xword	0xb6c7ce1e8e33603f
	.xword	0x9cf7166dee7fa51e
	.xword	0xcf5b6ce862cf2a48
	.xword	0xa9c3d8628c0c5918
	.xword	0xa7b245db51d27a1c
	.xword	0xf8d89433f294903b
	.xword	0x212ae0d960104287
	.xword	0x1d9a91385585ad78
	.xword	0x2783b4f66ea3e009
	.xword	0x8689fa142a89f7ca
	.xword	0xdd6f4d08fda5fa27
	.xword	0xb77e7ff9a05a78d4
	.xword	0xcaf280909dbd5b74
	.xword	0x3dcb90ec8b9496d5
	.xword	0x37fe571c94944f49
	.xword	0xdd2610716b3caf00
	.xword	0x1fce7c4767ed42b9
	.xword	0x7137ae0b24542643
	.xword	0x86d7a0abc47358ff
	.xword	0x0a9f94c29737f143
	.xword	0xf122601f6c029f97
	.xword	0xc85ef130630ccf04
	.xword	0x5f6837a3c7ab0fbb
	.xword	0xc05e6134d5b87ec1
	.xword	0xf326ccd2f62a38fa
	.xword	0x0a8ab24fb25763cf
	.xword	0x17af682ff8c7535e
	.xword	0x0ca6c6725d449816
	.xword	0x9fc3fbeeefe5ecd4
	.xword	0x86cfc2c69ba86ba1
	.xword	0xc5de90455a4db857
	.xword	0x25ff5ab86dedb7dd
	.xword	0x9145ee4a2e1e9ec8
	.xword	0x37798729d9f92898
	.xword	0x07b2017fa4030c25
	.xword	0xceca7becd3c7c350
	.xword	0x081c3be6b28760e5
	.xword	0x1a4014a5b819d672
	.xword	0x4283c8a4e4a36c2b
	.xword	0xa5a3df096c747806
	.xword	0xa5ccfeb2fee03a30
	.xword	0x96982fe6ba1434f1
	.xword	0x323dcea68f626b30
	.xword	0x0eee6e60b15b5ad5
	.xword	0xbf1ec41894e6f9dd
	.xword	0x6a469d4ff6fcab81
	.xword	0x51750dd4867f9acf
	.xword	0x688ee1e8d7e44002
	.xword	0xcb3f40a7b73c5cda
	.xword	0xfebb0c1769a2f8f7
	.xword	0x99d78695f7f0de1f
	.xword	0x9a26246b9d243ac5
	.xword	0x39a0c769a7a50c51
	.xword	0xa7b9979f1e38eda4
	.xword	0x287ccc552217f055
	.xword	0xa854719eb1c03abd
	.xword	0x061d23dc51edea07
	.xword	0x7096a01aa08889c7
	.xword	0x8c6c0dadc83bf10a
	.xword	0x550c2632542a8c05
	.xword	0x64138a111df1d8c5
	.xword	0x14c4b51e835bff34
	.xword	0x375cf3d8832a279d
	.xword	0xe169f2d410805c64
	.xword	0xba6fa83a9b704f11
	.xword	0xb3a24b6206a7761a
	.xword	0xe2e0e126e95e504a
	.xword	0xf6bdfceec89fb574
	.xword	0x6df07c7cdb24fc0b
	.xword	0x35caa11049391c05
	.xword	0x6646bfb0eef36101
	.xword	0x7ae3049e909d2858
	.xword	0xbd35f14a4567550f
	.xword	0x279d99cf92ab59b2
	.xword	0x1e5909322bdfcb80
	.xword	0xe61641b3d711f24a
	.xword	0x9290989a64cdcf8c
	.xword	0x77f56e43db353eb7
	.xword	0x1b7ddec1fc6c7cc5
	.xword	0xbd36f6c7842684a0
	.xword	0xf1cad814859fae6f
	.xword	0x49f7a86ed270d1d2
	.xword	0x4f956f9d09be193e
	.xword	0x8beaed2ce884d752
	.xword	0x7fd3088419c3f04d
	.xword	0x9b79a00496e2767e
	.xword	0xf4fe4e4dd1c12676
	.xword	0x2ed8d4622fc8f571
	.xword	0x24c71039078942b5
	.xword	0x1e7f6172f776bab7
	.xword	0xb15297dc39197df3
	.xword	0x4e08ee3f1388925e
	.xword	0xe690f6ef1d613c5a
	.xword	0xf218c21b155a7029
	.xword	0xf536651221f89c8b
	.xword	0xebc5aeccf409b94e
	.xword	0x313c8161795e79dc
	.xword	0xfd95e9450fa07218
	.xword	0x6156f053c0c89b33
	.xword	0x136b1f9c7dca2490
	.xword	0xb2aaa082695a2d5a
	.xword	0xb10ce0d7c431c5b4
	.xword	0xdba99c04b768d669
	.xword	0xec0e49ddfdbfc0e9
	.xword	0x0ba65981548adc36
	.xword	0x0b79e6603aedaa16
	.xword	0xbf2fb339efe76692
	.xword	0x8c7ba86db0220d73
	.xword	0x380e3959896df9de
	.xword	0xfc9869b118f08eb1
	.xword	0x71919cef72184402
	.xword	0x04e60d49ee487efd
	.xword	0xbb09058b108c3409
	.xword	0xccf2418533468410
	.xword	0x5f94a8f5fa6fbe76
	.xword	0x5acd6a5f5ebd85cf
	.xword	0x1fe2705e50e331f5
	.xword	0x1f598bdd530e268e
	.xword	0x4d9fe015ac8cd54a
	.xword	0x5c75d4779b5aff05
	.xword	0x9f7d7568293f163f
	.xword	0xf58ab1b47d3eb66d
	.xword	0x55df28d565c1dff5
	.xword	0x4336442b2104c7bb
	.xword	0xd7298a04a16c4142
	.align 0x8000
	.data
data_start_3:

	.xword	0x8f2be47cd806de6a
	.xword	0x5a1c1fad651bd835
	.xword	0x2f82bf7f60314183
	.xword	0x05ce4f2a5f6037a2
	.xword	0x5043bce9afaddca8
	.xword	0x790271412be303f8
	.xword	0x2b1be0ec981590c2
	.xword	0x2d4d8647ebaeb13b
	.xword	0x66ac7543b832a7ec
	.xword	0xede1cf5729568b29
	.xword	0xc02bd74bf4478f29
	.xword	0xd81ffd0e59f60e39
	.xword	0xe2ed2eb484f8d28c
	.xword	0x10961db5c102fb41
	.xword	0xf1938e7a8f6c5923
	.xword	0x89776a06d9706226
	.xword	0xee47ed8a0467cc6e
	.xword	0x04a46c57224a3cfd
	.xword	0x6fbc726dea0f63ab
	.xword	0xdf99fc2de877d04e
	.xword	0x58cefbb4e6e985a1
	.xword	0x5f9d3eeea08666c3
	.xword	0xaeb6af172e3f2959
	.xword	0x2475a7800f740597
	.xword	0x59772b3dd227809a
	.xword	0x52276a265387ac34
	.xword	0x64e8797347f9b03e
	.xword	0x0f29dbd2c49d7190
	.xword	0xef189f91d257cf9e
	.xword	0x881d8114772366b4
	.xword	0x79760eeaff192ddc
	.xword	0xf029b9dba96da0ad
	.xword	0x9961ca3d9a44cebd
	.xword	0x2f2d809e39d9d0df
	.xword	0x12a63d873d6434e5
	.xword	0xdb67ad090eead555
	.xword	0xcd81a59bde131ecd
	.xword	0x605f58c9e82f5888
	.xword	0xbb8622155a6bdfed
	.xword	0x6ac1fb61c03ecac8
	.xword	0xb0878b7136fb46dd
	.xword	0xfa9d705ece4e6e84
	.xword	0x9d01f0959cce2436
	.xword	0x0764a04f7ba320b1
	.xword	0xb387967db905b32a
	.xword	0x720f0f02ecf5e789
	.xword	0x98c2d17afb596707
	.xword	0xf538fa258e9b0fa9
	.xword	0xa130d0c01ff05809
	.xword	0x8072a42b35049a59
	.xword	0x4b45541aaa0fe088
	.xword	0xf491ae65c338fec3
	.xword	0xe4c754004befd6db
	.xword	0x8c0ba400c704cb02
	.xword	0x43d2a1794d110e9f
	.xword	0x523eb4aae1613546
	.xword	0xc2c94021d972f818
	.xword	0x801cbd6999863527
	.xword	0x88c53f4324beb802
	.xword	0x7713f2f8b66eb58a
	.xword	0x87226d29aa76a851
	.xword	0x89a548e924a02a0e
	.xword	0xc2d0ba071b0915d9
	.xword	0x2c312a934270e107
	.xword	0xde99fa47e8a45000
	.xword	0xc4db80eae374dfb3
	.xword	0x3ef44ac94d4d0026
	.xword	0xae029602ec1de98c
	.xword	0x4ba76ccb224ecbf6
	.xword	0x14302269919829b6
	.xword	0x4930465681e6caf6
	.xword	0x0c1c1775a8f52fb6
	.xword	0xb31ce7d00f6457a9
	.xword	0x5e75e15380ce4303
	.xword	0x72c8e5e3960dd024
	.xword	0x6ca7175383cf833a
	.xword	0x0780465a28b119fb
	.xword	0xe84a17acf61d08b5
	.xword	0xd83f145aabf5bd15
	.xword	0xa030adf60ce51e6e
	.xword	0xefc8274c5dc0659c
	.xword	0x9ebb4674829ffda8
	.xword	0xf3c3d02e9674fcd1
	.xword	0xf8ceb19b89aca276
	.xword	0x3f70e3a5ad491fd4
	.xword	0x424f77e6c65e13ec
	.xword	0x91900e016773f024
	.xword	0xd4d1c10766c40603
	.xword	0xf3d2189ac8bbcbe4
	.xword	0x4a8b7364146940e0
	.xword	0x6699a9775f252de4
	.xword	0x908598a7efbf6b05
	.xword	0x24a34600b3fed159
	.xword	0x1a36e81b1d4fecee
	.xword	0xcd3bf9cfc00ed486
	.xword	0xdfbf81bbfad67631
	.xword	0xf73a744253fe20d7
	.xword	0x700e2b0f066d108a
	.xword	0xfe4c1246f796b500
	.xword	0xa155bc44725d3525
	.xword	0xb5fbffbb99a7cc96
	.xword	0x33c27f4f1544097e
	.xword	0x761de2fc1c004b34
	.xword	0x0169f92f9b0d65ed
	.xword	0xc116ef771f48adff
	.xword	0x51240a765a3d983a
	.xword	0x90b27e04fe3215b2
	.xword	0x186ed623d81d6efb
	.xword	0x2bda1082b2f0821a
	.xword	0x2e16f21e55cad00f
	.xword	0xfc473e2c43775448
	.xword	0xbab5da0cf0ec0333
	.xword	0xc9a7afc5a7a8bf89
	.xword	0x5b0940e86ac86ab8
	.xword	0xada39445fecf74fb
	.xword	0xe7d8e75a16071486
	.xword	0x0f35635887353295
	.xword	0x1602413350990af0
	.xword	0x4092b5ed854363b1
	.xword	0x793e98732992f7a1
	.xword	0x55f5b6742c6fa585
	.xword	0x58e2052e5c799cae
	.xword	0xf78f393c45aca0f5
	.xword	0x496d2f0cf7aaaeeb
	.xword	0x840a023f997b7473
	.xword	0x81be422d59635242
	.xword	0x7e7a19f5be5a8367
	.xword	0xeaaa825ab149b4df
	.xword	0x8163aec447687f70
	.xword	0xe9161175837481ee
	.xword	0x3d535b1ef40dd7b1
	.xword	0x3a63e772943770ac
	.xword	0x2e000f93a1a79da7
	.xword	0xbb18bbf3d3462303
	.xword	0x491e68599a7b87f4
	.xword	0xab47ba1ccf6d3521
	.xword	0x9b1eb7d6082cab25
	.xword	0x3ed61306ed3912af
	.xword	0xaa511695f3510629
	.xword	0x82b11bc5f6494ebc
	.xword	0x47a0e77624686233
	.xword	0x25c5deb0a55411dd
	.xword	0x67af9fda00b096cf
	.xword	0xc114cf643ac3f40b
	.xword	0xe28a67f5e888f06a
	.xword	0x5f6fd8d9e44ea77d
	.xword	0xcc6bde0c58e1f44e
	.xword	0xe85100ef07e79a50
	.xword	0x2757f63a402c3b1b
	.xword	0x5bb9d854f47b0832
	.xword	0x5086608c7eb54d4a
	.xword	0x7f9a97143e546a68
	.xword	0x92c35e16fba7a45d
	.xword	0xcf9364e163a75914
	.xword	0xf8e7d510cd33fb9e
	.xword	0x11e85a6e9e61d988
	.xword	0xdd37df092814b5b3
	.xword	0x933818871c25e08d
	.xword	0x778a3b4282432d5d
	.xword	0xd526e8fdfbab27a9
	.xword	0xf1e02ff1c357d223
	.xword	0x3298f50192acda31
	.xword	0x7da7e66df76639dd
	.xword	0x81b6e36aaa269c6e
	.xword	0x4532f37883c342c9
	.xword	0xa63d0921064b71e9
	.xword	0x113f6d5553f75a60
	.xword	0xaed8ae0b9f19cf4a
	.xword	0xea7ad07677d8c6e6
	.xword	0xbef5e81f369a1d7e
	.xword	0x7aed61a38f6c5e3a
	.xword	0x92a3f26d6ff5ee0e
	.xword	0x09db001084a80a29
	.xword	0x2c5bee11b54fe01f
	.xword	0x548676632083b666
	.xword	0x00ae93cc9e10cefb
	.xword	0x7026067ab6a154c0
	.xword	0xc74bf7c58d28f555
	.xword	0xc7e30c0dc0a0310d
	.xword	0x62cbc99375687ab2
	.xword	0x139f1a21add818ed
	.xword	0x8abdc2df1d3afee2
	.xword	0x95e4c8e52d331ad1
	.xword	0x10ea18a88cabc9b7
	.xword	0x256d78e54931aac0
	.xword	0xce969595b310c7da
	.xword	0xe88e4c8b469734ea
	.xword	0x4d5737886250eafa
	.xword	0xd6f5e2bdff2b6c3b
	.xword	0x5cc9a116352146b5
	.xword	0x0b1078750b5bcc86
	.xword	0x00d3990cfc64f752
	.xword	0x297cbc36f0d390d2
	.xword	0x218a9034be11a453
	.xword	0x5ff8692e6c0eac4b
	.xword	0x4a9b22388c081e0c
	.xword	0x18750e1357d51004
	.xword	0x357c81f43a54002b
	.xword	0x172e090585f26d6a
	.xword	0xcd860c947fe59754
	.xword	0x99a298d0e792e7d5
	.xword	0x4b5ba8e79120a486
	.xword	0x2c8b8f571e880167
	.xword	0x939ea106793232f4
	.xword	0x9dce99747bcf3a82
	.xword	0x3437c86269ad93dc
	.xword	0x1a822596b9cf288e
	.xword	0x367f00417e41e5d1
	.xword	0x4902b024e6fb4b3b
	.xword	0xd4764124a14dc6cf
	.xword	0x8af77251709ba5e6
	.xword	0xb4d16df8a29329f0
	.xword	0xa9d8c1ec2321d9af
	.xword	0xa2991de11054826f
	.xword	0xc48e7b88aa6f2b69
	.xword	0xb7f4f30919be2c09
	.xword	0xa0281167e605236f
	.xword	0x56c38b8b577d8347
	.xword	0xa762c9c69f10b545
	.xword	0x8e9cc527eda0df2b
	.xword	0x5aa239f8f68a5512
	.xword	0x15f038c24023898d
	.xword	0xea7c92fd4620add9
	.xword	0xf8a7cc6186d93a6d
	.xword	0xb64da92d6a0b4085
	.xword	0x845b6ecf7057735d
	.xword	0x60b4273d555e3385
	.xword	0x70f5a58f0f830740
	.xword	0x7c2f4a1201f12871
	.xword	0x6831874dea87ee0c
	.xword	0xea2e64c7a18d3ab7
	.xword	0x0bc2533a493ebdf1
	.xword	0x8efac7dc2898bbae
	.xword	0x8598b13a0db15052
	.xword	0x78f180e69971d0a1
	.xword	0x32e13d1012dbe86d
	.xword	0x33095c9a7b90aa68
	.xword	0x0dfdad2c8e38a093
	.xword	0x02d7543ad19a458f
	.xword	0x10b64f176c7448ac
	.xword	0xd2a24d178c3b1593
	.xword	0x88fab120fc372135
	.xword	0x417fffb6913b028d
	.xword	0x4778c38921a7f034
	.xword	0xba96ca5884290c82
	.xword	0x1c87a2f026b25d1c
	.xword	0xcd4d5fd35786ca50
	.xword	0x8485b6a319fdf021
	.xword	0x07bf8aec6788b46e
	.xword	0x5de62cc8a2fe8f34
	.xword	0x4ff81bfada650179
	.xword	0xe498c4f7bce926ee
	.xword	0x5bb25a5246ce774c
	.xword	0x7272fa06d1ae934c
	.xword	0x51dcf22b6ebd82c0
	.xword	0x32730eaa7509e534
	.align 0x10000
	.data
data_start_4:

	.xword	0x0dcf797f08ae2372
	.xword	0xb17a0437fef60b28
	.xword	0x37ad47fb2b86bffe
	.xword	0x344ecd82854ecd18
	.xword	0x28b3c4ed8391eb59
	.xword	0x9b8bc96385d0b978
	.xword	0x6fbbc5a1253ff650
	.xword	0x431f534e744cded8
	.xword	0xacadb4d3abe84deb
	.xword	0xc28e4b3f29b73682
	.xword	0x1ff0bf6d5edee71a
	.xword	0xc60175495daccd54
	.xword	0xd31c54cacec85b77
	.xword	0xeddddc26ca9957c6
	.xword	0x2fd70683044af3d9
	.xword	0x977a9c6c795e421f
	.xword	0x79c3716238026e67
	.xword	0x55d7ce362ec49e51
	.xword	0x5a3dcba36e1cfe17
	.xword	0xb0920f0296534e16
	.xword	0xf3ee6f1533fdc761
	.xword	0xc5e2fc8fc84f657d
	.xword	0xca8aa613d59182af
	.xword	0xb00bdf77b92f5ea8
	.xword	0xdbd795f5a84b074d
	.xword	0x6a18b038f05dc3ac
	.xword	0xeeb0b5b48c533a99
	.xword	0x3a0aba3a0dc37dcb
	.xword	0xc0dc3f221f28c4e2
	.xword	0x3a1c2f83c6659580
	.xword	0x96607ad6f304abcc
	.xword	0xadc033fc6357bdd6
	.xword	0x0b740ae4708b53f1
	.xword	0x772788d55cfa60f0
	.xword	0x00d0a5a04743a4aa
	.xword	0x7ebee694be2bcd38
	.xword	0x56e397da4b5cf9f6
	.xword	0x1cd24c0aeaca1734
	.xword	0xb60c27387b7230e1
	.xword	0x10598a2b0af8b577
	.xword	0x4c569e5289f45677
	.xword	0xc21e31a86cca4a2f
	.xword	0x944e033fb0290294
	.xword	0x211c356626adb2d2
	.xword	0x715195b2e9e35717
	.xword	0xecca095e7c59b332
	.xword	0x82578ef2b97003ed
	.xword	0x000b92d9349f23de
	.xword	0x4656016d4ddd28f8
	.xword	0x5132b30ce80f20f9
	.xword	0x256f87f62e2aef12
	.xword	0x11d2435bb1e5339d
	.xword	0xa817dd01e552783d
	.xword	0xe12f4c2ed32603eb
	.xword	0x8446dc023eb3b051
	.xword	0xe3bbc9376837afdb
	.xword	0xa46099dd1589d3af
	.xword	0x43be40c01a08f561
	.xword	0xc7af38677d6c6243
	.xword	0x2e1519f70fdffe70
	.xword	0x8d60a33fc5e7c496
	.xword	0x75cbfd3e08cd3b8e
	.xword	0x66183c694d34f7d6
	.xword	0x9ab3adad052c7b7c
	.xword	0x63f156c4cc66ac01
	.xword	0xf10e77e4addbb156
	.xword	0xe2f893af9fefe853
	.xword	0x2d15056fa07da3d3
	.xword	0x9ad5b54f0c3e1595
	.xword	0x73986941615c414b
	.xword	0xefd299eb92bb56a8
	.xword	0xc76dfb0f589bb459
	.xword	0xc925e9d6a890ec9c
	.xword	0xa5af59fae0366949
	.xword	0x1b5108fcc4fed11b
	.xword	0x7ba180696ae87aee
	.xword	0x3f33637b34960f2a
	.xword	0x55078f8ae83fefef
	.xword	0x0519c86263065d3c
	.xword	0x7d1029e4b80b9ad1
	.xword	0x967f60616776efb8
	.xword	0x0b23bba59266898b
	.xword	0x68d2220dc9302e98
	.xword	0x2665bb43e1d90d88
	.xword	0x4afa68ad154952e0
	.xword	0x40290a852a4788fc
	.xword	0x12e9bcc707508db2
	.xword	0x626eccf1f2185a86
	.xword	0x5e2572c47640d225
	.xword	0xf5aecb124ef04232
	.xword	0xa66d93b4ada8b3c2
	.xword	0xadbe3a6a44515dd9
	.xword	0xabf2fecb7e3f4c81
	.xword	0x0840d43655823942
	.xword	0x81877e5cb809d7a3
	.xword	0xca6bb8b0f1830323
	.xword	0x09d15186ecec945c
	.xword	0x3d569a8ebdc7f0e2
	.xword	0xe292f840694e5aef
	.xword	0x633dfc077589aa2b
	.xword	0xec7687caede9d2b3
	.xword	0x75cb7b2229fa364a
	.xword	0x0165faa46bfbd48e
	.xword	0x92c1740dfc234cd6
	.xword	0x21bd2fd0db9307d7
	.xword	0x92cbdfa148312a41
	.xword	0xe5829fd695693966
	.xword	0x2cae1e70daa67b4e
	.xword	0x0804712e00f3f5c6
	.xword	0xfd5412add1f2dedb
	.xword	0xb7b548183420c815
	.xword	0xcd03e7191fc8aa08
	.xword	0x805c4aeade36d14e
	.xword	0x06ba23abd0695e02
	.xword	0xd048f42e5edf9bbb
	.xword	0xf609e4dcc896be9c
	.xword	0x50fe8e47ab22819d
	.xword	0xfd70e509fb3b4397
	.xword	0xc0feb150a183dd7c
	.xword	0x11b97839f0923b25
	.xword	0x58be136f3a36cb3b
	.xword	0xe22a471c6bd6ccc5
	.xword	0x6f6859d4b14aa121
	.xword	0x17e733cf3c6c0615
	.xword	0xd284ef468f5ad024
	.xword	0xa5bd0f80dbd8c2bf
	.xword	0xcd3843d77a739611
	.xword	0x553b95cae859dd63
	.xword	0x787a1d793274ca9c
	.xword	0xeb4bc59d4fd937c4
	.xword	0xaeb2bd3593fe5f6c
	.xword	0x213a81919407a226
	.xword	0xc71e1c88c3855b04
	.xword	0xccc97e42b373d60e
	.xword	0x0c37a853fb332e14
	.xword	0xc21d1130d18f2da7
	.xword	0xb9505aa8260d7f58
	.xword	0x4974bc3964b54622
	.xword	0x22f74e97f0841507
	.xword	0x9260f2c407fc07a0
	.xword	0xa144cd2f44468ade
	.xword	0xab84394bb1ae035e
	.xword	0xe74b6f0c61105adc
	.xword	0x9407b416028ebc8a
	.xword	0xc1e745b2618968ac
	.xword	0x196dc55ff677ebf1
	.xword	0xca44cfc378aa35d8
	.xword	0x9bef57dad46a0b8c
	.xword	0x5f60dd50a25c3d1b
	.xword	0x55a9cf6477c5f353
	.xword	0x142cb367859a2e90
	.xword	0xc9681ec185d7c304
	.xword	0xb9c01d6e06efbbb6
	.xword	0xcab5574a4753ede7
	.xword	0x8796e653e5238bad
	.xword	0xc12d3b78333d5b99
	.xword	0xb2ab394c08c393a2
	.xword	0x7ac5a9b71bd2ba8a
	.xword	0x1ecfcb8154233278
	.xword	0xcd6425c17db28bdf
	.xword	0xc59037420b82ab55
	.xword	0xcb2de787c7f24c34
	.xword	0x9ed40aa21bba6df4
	.xword	0xf5ba16fd27af4ae3
	.xword	0x3849314eea1bdd7b
	.xword	0xf78848e4e56b503a
	.xword	0x0fa94265e6c1b18d
	.xword	0xe894aecedcd86006
	.xword	0x172cd2517c26e912
	.xword	0xd5d4e912b7e016b1
	.xword	0x6bbdebab7305f4a1
	.xword	0x8d25d3d33986c8b0
	.xword	0xd38d203e13ca633a
	.xword	0x6e373e0015a08feb
	.xword	0xcf346643b7dc3532
	.xword	0xa9a3b3557c184567
	.xword	0xa43d5ed431bbdffa
	.xword	0xdc3d08d13e2edd63
	.xword	0x0134f120c22dedb3
	.xword	0x586f623338449c9f
	.xword	0xb6c0836f2446f142
	.xword	0x4a273cd50d5bca3f
	.xword	0xb31007ce850abd3f
	.xword	0x389abf5c46d0f596
	.xword	0x6878e3ff471626e4
	.xword	0x453a11c9729625b3
	.xword	0x2c5bdedb1d04f9f8
	.xword	0x60eae56b174540fb
	.xword	0xd177292cc783bad6
	.xword	0xbb615d7eedec68ab
	.xword	0x207db963cc4a4bac
	.xword	0x22e34e719c5e72a0
	.xword	0xbce01962929ff6a6
	.xword	0x07b04c367f8ff91a
	.xword	0xda885dcbd7b35fea
	.xword	0xdb033df205a541bf
	.xword	0x306f3d6243ea0d72
	.xword	0xe0babc9f748c2d31
	.xword	0x02614de7d05b804b
	.xword	0xa0c471c44bca18b5
	.xword	0xb6c2084ec285dc24
	.xword	0x4752de7829429164
	.xword	0xba536b0e574be4ba
	.xword	0x9eaea3e7b99b9664
	.xword	0x52773ab4dccf4477
	.xword	0x68dea4b51bd79783
	.xword	0xd891115d7421b351
	.xword	0xe0eba71f6979f666
	.xword	0x5e3383aee92452ab
	.xword	0x91b51c5329db561e
	.xword	0x120fc16f084abaaf
	.xword	0xe4177024610741f1
	.xword	0x77d516a9cafbdbf0
	.xword	0x48c9722c9ca20c33
	.xword	0xe68fbe0177633429
	.xword	0x024cdfaf4f8ff26c
	.xword	0x0a48f03aa83facd7
	.xword	0x9dfb932d4dfca4a1
	.xword	0x8b0e657bfd0b088e
	.xword	0x81cce1ca0c81beb2
	.xword	0x1c8fb503e77a7170
	.xword	0x3f0e5413835ba1f7
	.xword	0x28959df6153428f5
	.xword	0xe0a3db4836139ee6
	.xword	0xac27ed7546590fe2
	.xword	0xe78bd6b9710a2f4e
	.xword	0xd3c682da249e30af
	.xword	0x664302233c38722e
	.xword	0xced5e40f59d3f11f
	.xword	0xdc25fdd1ddf6bd73
	.xword	0xaf19a1bc1504c78b
	.xword	0xe1e5855d7c79b09a
	.xword	0xb5a2f5459dc06cc7
	.xword	0x74dbe8d573f7b102
	.xword	0xfdc8d2c084a0aa08
	.xword	0xe2786741be8904fb
	.xword	0x6dce1ed6715ae424
	.xword	0xfec2e5563b83853d
	.xword	0x4a19fa5dafa03548
	.xword	0x4459f85b258f436f
	.xword	0x7c1819511a8236ab
	.xword	0xa8bfae0f1617f866
	.xword	0xc31ad94af422d7ac
	.xword	0x1de8864257b23893
	.xword	0xf78d80e67abb7568
	.xword	0x7b84cd8c974b5eb6
	.xword	0xeb8b8861dce7fdc4
	.xword	0xe5641bc6af5e8a7f
	.xword	0x34a4570f4747d968
	.xword	0x2a97636f4993b499
	.xword	0x6cd6d60f11b8419d
	.xword	0xc04157e8c4f9b05a
	.xword	0xadcf0d8371898b06
	.xword	0x4bd43608dc41698c
	.xword	0x745f299bfb8c81cf
	.xword	0xbdeb73fe7abb7e0f
	.align 0x20000
	.data
data_start_5:

	.xword	0xfc4851375a5f19cd
	.xword	0x2d5975bc441ac4f1
	.xword	0xac4087aa3fa7345e
	.xword	0x962dd731d29f9c4d
	.xword	0x19a0a3b9051dd64b
	.xword	0xce98e2c6a1bbc97b
	.xword	0x571d0047f648d250
	.xword	0x774c5748ae6ff596
	.xword	0x3a7adf14c270aa2f
	.xword	0x0836d2c6c6851d09
	.xword	0xc0aa4b0987643301
	.xword	0xb5db6bb1c038ab5f
	.xword	0x6000a0d8c9249caa
	.xword	0x019454d320f119bd
	.xword	0x32476d6f8c29284a
	.xword	0x61ed72da2fe6aa07
	.xword	0x496dbdad5e0ecba7
	.xword	0xeaae089ca8ed03c6
	.xword	0xb2f7180137ee46ed
	.xword	0xc0462a6d53e74ad1
	.xword	0xda76d09454ce7f1a
	.xword	0x45bf314f8143c577
	.xword	0xfb16d2285b2de3bf
	.xword	0xa6a5478e28188bae
	.xword	0x9bfbd9d7ffd587a3
	.xword	0x6ecbfb010de8e1b2
	.xword	0x7a4b697b43d06bfe
	.xword	0xb3fd94115f9ecd8c
	.xword	0x0ef49b3dcefc7523
	.xword	0xb7b7b2dc26e6e1c4
	.xword	0x7d1f09ad679e4724
	.xword	0x7b809110f90b0d5f
	.xword	0x6c6b909530fe461e
	.xword	0x1a1706e82e0c3db0
	.xword	0xc79eff0882830efd
	.xword	0xc8cfdb0e6c8c9c13
	.xword	0x0f866cd5339aa5fe
	.xword	0xad51ede7e68a0fba
	.xword	0xd13a7c9d9d5e44c7
	.xword	0x8e9a0230f7bb9c64
	.xword	0x45591ecdb1e41b2a
	.xword	0x5c38461363299a5c
	.xword	0xe96120fdb391d560
	.xword	0xb6295cd1a0bed706
	.xword	0x0b14a898f4f10673
	.xword	0x381b728521dbaf91
	.xword	0xd5ecb64b2f82cb78
	.xword	0x445a04d2db8a2137
	.xword	0x5226417ae57571b5
	.xword	0x2af266b0faa4629d
	.xword	0x57d42ec7b7c4d99d
	.xword	0x34d912ca068f594e
	.xword	0x8259db5605ff5e23
	.xword	0xdadb69dd49b33066
	.xword	0x148776fba2114923
	.xword	0x62d21cf7968f1bb6
	.xword	0x2d24c900213fd81a
	.xword	0x1cbcb791d6bb583a
	.xword	0x8a3f80a029bcf5dc
	.xword	0xea8c593f7a8ea0b8
	.xword	0x295d924c6ee52154
	.xword	0xed91313524c99421
	.xword	0x68adf5396a8030f4
	.xword	0xd48919315cbd1cc5
	.xword	0x8b136bd7efeca493
	.xword	0xc9f7889a8f2cf495
	.xword	0xe28f8915406d1ae6
	.xword	0xe6f875367a3a7755
	.xword	0xb7a207b0aa6e119f
	.xword	0xd88410ebeb372a55
	.xword	0x4c63f4e88e72ed2a
	.xword	0xaf3766231da56b75
	.xword	0xdb63f74f4ae0fc4f
	.xword	0x625fdd1f7f328159
	.xword	0x4a7068e86f431a85
	.xword	0x8fe79c3fc2d9e542
	.xword	0x4f9b2c1e465ca81c
	.xword	0x34d979a98b30a4ee
	.xword	0x09288515e3397eca
	.xword	0xb15c4b12c641ba6b
	.xword	0x5375284efeffc63e
	.xword	0xc5df54ed69db47b8
	.xword	0x020be07b24141808
	.xword	0xffaf644d417dfc81
	.xword	0xb0451d1c559b9fee
	.xword	0x6c2c8b68f045b46d
	.xword	0xe172f32059fb395b
	.xword	0x0e339e79da227c17
	.xword	0x1e7f6ad71f969844
	.xword	0x0cc76914bfe6f6b6
	.xword	0x81d92cd018117288
	.xword	0xc2010cf2abc09107
	.xword	0xd7a068b11a484440
	.xword	0xca47cf6cc50f3f83
	.xword	0x13c75145425b740d
	.xword	0x644b5edb41a178ab
	.xword	0x7975f8d593fceb9f
	.xword	0xeeb4b1a3a419df1e
	.xword	0x78f9db574137b1e0
	.xword	0x5761b9a533eed0ce
	.xword	0x2fdfc1baf63dd324
	.xword	0xc30514fa6d054d86
	.xword	0x9941319c14931796
	.xword	0x9fcb6ab7a50a09c5
	.xword	0x55dbe12599cbc118
	.xword	0x617aa4e5234e8f51
	.xword	0x749104ce9952b221
	.xword	0x838e9f2a75e683f2
	.xword	0xfb7ff50f23d78e64
	.xword	0x8c16cb21a4889447
	.xword	0x429668e9fb1ee97f
	.xword	0x27ec8012dd82e466
	.xword	0x7b38241c05f0baa9
	.xword	0x0b6ec04e9cf7e7f5
	.xword	0xa64de4a6e05e069c
	.xword	0x9e4f54acf6787d44
	.xword	0xa6ecc9d06a148ca2
	.xword	0x753b4fe8016db711
	.xword	0x7cd410edd3d556b9
	.xword	0xc17ba7d86301e83d
	.xword	0x1edacb0971407ecf
	.xword	0xb32bdcb9b5cf9dd3
	.xword	0xeefc02f8d140577c
	.xword	0x9fb1366e4f990ced
	.xword	0xee3b230aaf473e08
	.xword	0xff3078891e131302
	.xword	0x99ec71f1933fd7ef
	.xword	0x6c29cfc66f647d02
	.xword	0x7f2c08a8ae87d70e
	.xword	0xebd83f4dda477d13
	.xword	0x403cbe3dfdb84ea2
	.xword	0xa19df358fea139be
	.xword	0x8618ce039d376163
	.xword	0x8760e130b03efd61
	.xword	0xf598ba03dbd9ab47
	.xword	0xd2ed35adaa053d20
	.xword	0x35c3fbfaff9151b4
	.xword	0xd9505f863afdfec9
	.xword	0x3f0a658c4cde5162
	.xword	0x77290fd402fb9f4c
	.xword	0xb501924b744e58db
	.xword	0xd5c09ce68169f5be
	.xword	0x28b7ec9e37b2dc4b
	.xword	0x13333cc8f87e31c7
	.xword	0x3a767404466368d3
	.xword	0x11d3e1668ad508de
	.xword	0x87c0e162d3c8249f
	.xword	0xe84c2a2467809082
	.xword	0x60d3b4388ffc590a
	.xword	0xd67115026b60e7bf
	.xword	0x7533f01048eefbfb
	.xword	0x6700d090d9d1f881
	.xword	0x092f5d55db8d06b0
	.xword	0xaa95064fb3bcd5d4
	.xword	0xe0fd4e74f9265cca
	.xword	0x16da5a524ebcd5fb
	.xword	0x1e667ad15dce9b47
	.xword	0x501ec01dfd8f8ebc
	.xword	0x4773ad8bbdb7229b
	.xword	0xefbc1ff43771e6d3
	.xword	0x108c47dec131b569
	.xword	0x3ef811b1dae4e3ef
	.xword	0x17d91cc0bdd49e49
	.xword	0x3977a53dce803365
	.xword	0xb551fcde106a1e77
	.xword	0x25e7b4a744990dd5
	.xword	0xadef64fdd2e3b784
	.xword	0x3f91c63d4ccfb557
	.xword	0xe14c3f1eabe79bdd
	.xword	0x50be3bef1904ed33
	.xword	0x036056bb34debcd8
	.xword	0x69e85d54a1e7a18e
	.xword	0xc3f186df32532216
	.xword	0xb05e09fbb598f456
	.xword	0xb02e476e51fc37d3
	.xword	0xe81295308d539498
	.xword	0xe57cd5d25dc50bd4
	.xword	0x16278e4a21c6b4a3
	.xword	0x86b0f751c645372a
	.xword	0xd1fcf4fdc1230354
	.xword	0xb4bc0e3273078e74
	.xword	0x450f76fa4a09c264
	.xword	0xe29c9fd4bc1da21a
	.xword	0x9d3b29de789c5a47
	.xword	0xd170b5885c5e1bfe
	.xword	0xecd5c68a8d7d3427
	.xword	0x7755819873c355f3
	.xword	0x61671574d3622e8c
	.xword	0x2ce4dcc1cebbfb33
	.xword	0x0e4c782c27ca2097
	.xword	0x422f19d58a5a166a
	.xword	0x8682e849eb83f81f
	.xword	0xdd2f20d68278eb70
	.xword	0x7609ef42c739cf11
	.xword	0x8830ea45481707da
	.xword	0xff2d7e9c9ef1bc3e
	.xword	0xf95ab7561d53cb71
	.xword	0xbb65c01333172eec
	.xword	0x603faaac98238189
	.xword	0x0d29ac4092703875
	.xword	0x6ba82d193b9d3b68
	.xword	0xee44e2c3d220db83
	.xword	0x4504ad29cd9d4755
	.xword	0xfa231de73aed0307
	.xword	0x51f980eac44fdb8c
	.xword	0x999132fb7e7d9f9b
	.xword	0xf07787b4ca8c1a5c
	.xword	0x34af30d8ec8d3521
	.xword	0xef5c505b4b84b89b
	.xword	0xbe4ef499b121a71e
	.xword	0xd5581cc2b40bbac0
	.xword	0x0493d79eb337bc2d
	.xword	0xd19e99b767b6d2af
	.xword	0x8f9080c0affff19b
	.xword	0xc6b306f92ee64d59
	.xword	0xd1b34a22f0f9085b
	.xword	0x8ee1e18fed373da5
	.xword	0xeeb3577d5f0b67aa
	.xword	0xbe8890be7be4339f
	.xword	0x17c15d4e2871c1fc
	.xword	0x32e961a3f5c019cf
	.xword	0x6a4c949d9950500e
	.xword	0xa4f70c454b216f09
	.xword	0xfd041d2f55d09eac
	.xword	0xcfb40970b2938bb1
	.xword	0xe6a16bd952cc9ef0
	.xword	0x9de067c8ead8ea34
	.xword	0x1ca8598e32c7cd7d
	.xword	0x76de859aa032920a
	.xword	0x62b05ab91ee51365
	.xword	0x441530b2e69dbe8f
	.xword	0xba113b6eaba228b8
	.xword	0x215bdc5c608d9ec8
	.xword	0xe692f026f5a5123c
	.xword	0xcfe870004112d29f
	.xword	0xe3701d8689ff6025
	.xword	0x384379335ba3290e
	.xword	0x824685018d183b6b
	.xword	0xb9d5ca53f25f2a8f
	.xword	0xbaa0d5ddf62926d3
	.xword	0xf201863a2e65b637
	.xword	0xe17a5ae5961f56f2
	.xword	0x0cefa6015e1fc1cd
	.xword	0xcc16d86c20863dfd
	.xword	0x9168e6000c0ce5c3
	.xword	0x6762571f27ec01bb
	.xword	0x745f51ec35ad4bd7
	.xword	0xf7c888d02e957c3e
	.xword	0x855d9fcf358809cc
	.xword	0x95a5fe6427b11aca
	.xword	0xfb7d9c7c17262d29
	.xword	0x324833f04bc78b17
	.xword	0x80ef89ca3c2e8f73
	.xword	0x809ac34c8e6b7fd7
	.xword	0x6ac7d1fcba73a19e
	.xword	0xa77a5d54c67e2bba
	.align 0x40000
	.data
data_start_6:

	.xword	0x9a7ccd338fd9926e
	.xword	0xd4b97bc63d4967fe
	.xword	0xe3fb2681f88baf98
	.xword	0x995fb01ad3f00240
	.xword	0xb307b1f5a086bde8
	.xword	0xfc379c1d2d9d525d
	.xword	0x04bdf0f9a8ccd25b
	.xword	0x8a1568b3bc609ef0
	.xword	0x7520591d604b1dde
	.xword	0x8d37abe38bae21aa
	.xword	0x35417d0fa4732598
	.xword	0x78c3ec8c29262c43
	.xword	0x0acdb1f7f1f890ea
	.xword	0x896e2871735c677d
	.xword	0xad354819f4d5c3b0
	.xword	0x8dad622a08eeb423
	.xword	0xc789aa9520d2be03
	.xword	0xed713887f320894f
	.xword	0x307b6ab023d92273
	.xword	0x4e7958c1c8668212
	.xword	0x223bbd1c680d08dc
	.xword	0x414d274549e40a3a
	.xword	0x5c222131dda1b37b
	.xword	0xe744c593dbd4e2c4
	.xword	0xebea83d7b3b1a015
	.xword	0xf68d06a9bdde6a6f
	.xword	0x7f51c1ab27b95b2e
	.xword	0x1bcfc52d66bea75a
	.xword	0xcb5c5bdfdea2e200
	.xword	0x4ad4dcd3ca42b431
	.xword	0x38bf60e55ab6a191
	.xword	0x6e28a3d9fa2a9d61
	.xword	0x56a48ad864c0db39
	.xword	0x5d0f1fd8b613a8f6
	.xword	0xc9b5870127ee18c9
	.xword	0x2bde4b3ecb4c060f
	.xword	0x0a928606aed0fa97
	.xword	0xb281c2fc51f2a933
	.xword	0x91c79b73778c1cdb
	.xword	0x50fa927d735ca66b
	.xword	0x7ae3ea2dfe8e6c73
	.xword	0x4026e36a331b3fb2
	.xword	0x5866b2b81dd46d11
	.xword	0x3e7e5962331f94f8
	.xword	0x88683b5f371689ca
	.xword	0xc1c51136737c08d3
	.xword	0x456033379001f1d0
	.xword	0xc42884a7520acf3f
	.xword	0x7c591c418f37b047
	.xword	0x06b84d99e8dcb551
	.xword	0xac4f0c2beb3d8b92
	.xword	0xf38efadd0c9db914
	.xword	0xa44a7ed7ec4f0f0c
	.xword	0xdbc6cc31282198a5
	.xword	0xabafe8e69c493bfa
	.xword	0xb7308193b571ea88
	.xword	0xb2afda0b82dab798
	.xword	0xe7a68124fff64489
	.xword	0x09f36560044d83e3
	.xword	0x339022bdbd97b9d9
	.xword	0x156a906d539004cd
	.xword	0x857f212a05024b26
	.xword	0x1526a4f7302b831e
	.xword	0x6551aff526ce90fd
	.xword	0x0fa918326a0a6445
	.xword	0x90acae3935607636
	.xword	0x3175e4514ab3541f
	.xword	0xf2ce3c6589990b46
	.xword	0x709941093f8d2e22
	.xword	0x46e970b5dc8936e5
	.xword	0xa7b01fcea9171090
	.xword	0xd881d5a182441e1d
	.xword	0x426bcda08f7d72af
	.xword	0x650e0002e58fd31d
	.xword	0xe9f54131a45a3af4
	.xword	0x3bf5da8ab773584d
	.xword	0xa0aa5ccc4e3867bc
	.xword	0xca44e5d3c26bc050
	.xword	0xd77c4e16bfcfab0a
	.xword	0x35493323bcbb4311
	.xword	0x8d7c571cf07e8def
	.xword	0x0adb97867281bc74
	.xword	0x34a84d965011f05b
	.xword	0x9c1440a726db3411
	.xword	0x63b2142d68948d35
	.xword	0x64f22160894e77d1
	.xword	0x4e99a89138f57649
	.xword	0x049e89fd3beed583
	.xword	0xd868b62df620150b
	.xword	0x5a207a01ac8a2de3
	.xword	0xfa8c24b4c7700b7c
	.xword	0xc0a21345a3cb88bb
	.xword	0xf39b36bb9247e8ee
	.xword	0x11056b4a220105cb
	.xword	0xa42b0aa20b27a64f
	.xword	0xd59e61371d31bcad
	.xword	0x3132f03431eb427b
	.xword	0xa837f069aef046b2
	.xword	0x89939140787d5ff3
	.xword	0xd1d13da94e496a8f
	.xword	0x3f6eedb638f9393c
	.xword	0xef1adc9fb0e73e0d
	.xword	0x1e69fd2a649f8ceb
	.xword	0xd060af0899ffd7ba
	.xword	0x3363431336177e4f
	.xword	0x1c489c0e2ce33aab
	.xword	0x81dea40ce1ba5ab9
	.xword	0x12b3eecffa71fdf3
	.xword	0xa49c0a38d785e7c4
	.xword	0x9cf256fde13bb0c4
	.xword	0x2af6a3668b7e3136
	.xword	0x3f995a8194ad6fd4
	.xword	0x5b060fcc98888d3f
	.xword	0xa305d00aaa755754
	.xword	0xa3d01256d073ab1a
	.xword	0x9e1914b4be2abd77
	.xword	0xce0882f0c1488852
	.xword	0xb7b362c00be1ad4b
	.xword	0x8c113c0d59419540
	.xword	0x2168dd565b121d0e
	.xword	0x3e3acfa3d3232e6b
	.xword	0x1890c1b1adfcc512
	.xword	0x41ebba6ba93f2fdc
	.xword	0xec0f014fa3bff6fb
	.xword	0xd2631cd82188e577
	.xword	0x41714a985eca3562
	.xword	0x2f1144997c9a2bd7
	.xword	0xf5272c05db06a295
	.xword	0xbf0ac750f62f5f5f
	.xword	0x48d49c415dc9d24e
	.xword	0xf4909c3a535869a9
	.xword	0xa04a8dda9d77727e
	.xword	0x78b8b0973695d857
	.xword	0x143524506436d726
	.xword	0x2767020a5f37838c
	.xword	0xa5996e7b17c444df
	.xword	0x88291ca0e3f0ba59
	.xword	0x605d0ae3f9d1d718
	.xword	0xc7e25da95e07ac6f
	.xword	0xcb18b58d01bb070d
	.xword	0x9c99759b5ff327c7
	.xword	0x3256ea6b7cd5394f
	.xword	0x0ace0bb30e5050ab
	.xword	0x7c9363af1c66e848
	.xword	0x850cb1d565c6a79e
	.xword	0xe23c5d8f8938fabb
	.xword	0x7b7cc854250ebcae
	.xword	0x420d1b15d5ddc0b0
	.xword	0xc5b6d6d21c81c6b2
	.xword	0x47650de98bc11d59
	.xword	0xcc0e86be54a209cc
	.xword	0x2c08666e8192d03b
	.xword	0xc2a81003090b0121
	.xword	0x563261c8d6feb0d0
	.xword	0xb904fb0a43e3b172
	.xword	0x7ee599c18d1458de
	.xword	0xfa2137a30dfd5e6a
	.xword	0x3f6a528269b66bf7
	.xword	0x01a144bc3c9a9f1d
	.xword	0x5cafcea4147dab24
	.xword	0x09c1dde7186e3200
	.xword	0x29cab2674b0e67bb
	.xword	0xc90594a836b22112
	.xword	0x1aaf82080c44ee5c
	.xword	0xe747a8e1dca6b7be
	.xword	0x2774f4786dd6e3e4
	.xword	0x88a9e8bfadad7078
	.xword	0xe96a23e8f2cc67ce
	.xword	0x4abb8d75795af739
	.xword	0xb3b1a7a94612e45f
	.xword	0xc72262c1e6b52c5d
	.xword	0x1b07c67284302f53
	.xword	0x3d9fb20da7f8d2eb
	.xword	0x5e3935881704a5e3
	.xword	0x4a183b74144ec40f
	.xword	0x26c7a21712319fd1
	.xword	0x58ea31d1f379a62b
	.xword	0x14a1e0c0141b1fb1
	.xword	0x593c35975a648369
	.xword	0xd1ce765adc45a694
	.xword	0xacff329e5f008e69
	.xword	0x4cec59f5054cea6c
	.xword	0xe93cc80a0c776835
	.xword	0x5f5315ae163b83ea
	.xword	0xbcf0f329225de42f
	.xword	0x068b7a6b1aa234f8
	.xword	0x89256e6e1838a5b3
	.xword	0x5a5c94d5dd1abe79
	.xword	0xb446b4f63694933f
	.xword	0xe6e1734a0b6d07bb
	.xword	0x9921f0f2a63e9943
	.xword	0x45058278b99240fc
	.xword	0xccf3c3890d1b5367
	.xword	0xc5a78ba369486af1
	.xword	0x0193b12b2c5c2cc1
	.xword	0xd416ef1e5d7abb72
	.xword	0x042bc7de41d93b45
	.xword	0x56921b774c72bbb0
	.xword	0xde32e1db0155580b
	.xword	0xa0e89be8408979f6
	.xword	0x7114c9be68c1af13
	.xword	0xc6fd1574ff32c3f0
	.xword	0xb5dffcd9de7ceee4
	.xword	0xc554cee4b7a82589
	.xword	0xb9f1b1ba85a1f283
	.xword	0xde7363aca78bdf32
	.xword	0x652460357e3cec0f
	.xword	0xcf43505a24cce6d6
	.xword	0x8fa2eda3db7594ab
	.xword	0xc38272be0d0d883c
	.xword	0xab62e01d8df9a9d7
	.xword	0x4256d85a22226fa4
	.xword	0xa21a0e59c0284693
	.xword	0x7716882bc856cfc2
	.xword	0x602d47fe5059cedd
	.xword	0x97ae21c4f9f5b012
	.xword	0x99f3cbdfa98ef8b7
	.xword	0xfb84c482ac58af15
	.xword	0xe848a6c6a53aa2df
	.xword	0x70496c6a9c18d274
	.xword	0xdf2dd0a178fbb2c7
	.xword	0x605f85ad10b781f2
	.xword	0x34a8783d0e7d0cb3
	.xword	0x6b2503d318daf1d7
	.xword	0x8dbc5f9d5b68c1d1
	.xword	0x3b65d54050a17df2
	.xword	0x58a825e7a58a33bd
	.xword	0xbf93fb58dcd62690
	.xword	0x91143744b4e97157
	.xword	0x5fc34b79426ebd7f
	.xword	0x3012483a8cc25a92
	.xword	0x1237f3fc5ab7ca2c
	.xword	0x0bde7ce69fc52519
	.xword	0x232d1690037a392e
	.xword	0x4e4ff8d57ab90268
	.xword	0xb0946a8c1cd3cab1
	.xword	0x3f81f5ef6a460ef0
	.xword	0x19f98257d267f024
	.xword	0xb916948b20212cac
	.xword	0xa8eec24df57be198
	.xword	0xb37033c20cdb034c
	.xword	0x0d62c9b0c8475c2e
	.xword	0xa2e3c63e85920384
	.xword	0x052b4438356fb8af
	.xword	0x766f50e22dfcb88f
	.xword	0x7005a6779bb1b019
	.xword	0x6657519aa038abbe
	.xword	0x0a4c6976caa02010
	.xword	0x54a46a2c059531a7
	.xword	0xb42671308158efe9
	.xword	0x24f2668dd9943695
	.xword	0xe6c9798bdbb7c9f9
	.xword	0x2b9f9fbc4c28c28c
	.xword	0x0e6e8ecbb3cd944c
	.xword	0xbb1f33bc9867c38f
	.xword	0xdfdcd143478a6ddf
	.align 0x80000
	.data
data_start_7:

	.xword	0x0ee6e1d79fdf5d56
	.xword	0xd29f3f24c93e5b2d
	.xword	0x7a3df1885b9a616b
	.xword	0xee8574c9c47aaa8f
	.xword	0xc33fabeb767e65ff
	.xword	0xd4aa70b82dd73936
	.xword	0x9660995497f6a9f7
	.xword	0x1e4a030fabf58449
	.xword	0xfd1d5a30309bf38a
	.xword	0x1a533e576be58d55
	.xword	0xeb40502465fa49ed
	.xword	0x4724cce388223c41
	.xword	0x0c852abdfe740342
	.xword	0x7512a3aa4e707b6e
	.xword	0x92ffb65a2780319f
	.xword	0xbb80cfbd32a41d18
	.xword	0x30362a27e899b529
	.xword	0xcecb58ddb06c2782
	.xword	0x0f4952d47e11f4a0
	.xword	0xb21caf03ecf0af93
	.xword	0xa6dfc7eaf79e6451
	.xword	0xcf3b9228b8ea728c
	.xword	0xe508844019f5487d
	.xword	0xc67795436b61b2e2
	.xword	0xbffd9191a56f3c83
	.xword	0x9d6cb6d402f792ca
	.xword	0xf953ea228a97dcc9
	.xword	0x92366aa56a0cfcdd
	.xword	0xf2156c2e8a87aa02
	.xword	0x29b7f14e58bb5d43
	.xword	0xadd9ee0a90eee8e7
	.xword	0x68b91feb9511a662
	.xword	0xe87ebb59665a6849
	.xword	0x2ec2d22cccbd6067
	.xword	0x3e33f0ff6a90f70f
	.xword	0xc1d7658b63e7dad5
	.xword	0x3053397b075b4dae
	.xword	0x61ba728adfd2567c
	.xword	0x9b1fa56a3cde3d24
	.xword	0x6fed82db8442b56a
	.xword	0x57782572e7a0619c
	.xword	0x050455f0941c91bf
	.xword	0xe6e7e4d144f0c730
	.xword	0x281aeb7733fbb3d4
	.xword	0xe7c30dbb724f751f
	.xword	0x40de537ba4b14029
	.xword	0x22c6aab0b2a8f37e
	.xword	0x6227e27af12e8833
	.xword	0x2e90ca27784155d3
	.xword	0xc2ef3876287fd0ca
	.xword	0x7b1ae6bc7a4f4c45
	.xword	0x3d348724ee42b6a2
	.xword	0xd630cd7e6849085e
	.xword	0x9615240fc1dc720d
	.xword	0xf36d450bf800d056
	.xword	0xb3a77d0c1cc50350
	.xword	0x14bd76ed08682976
	.xword	0x79e5bdd7b683bd54
	.xword	0x0e0ea868ba672008
	.xword	0x5b9846fa08597a50
	.xword	0xac5da7ad3fd5ed06
	.xword	0x6c6521c99e261e28
	.xword	0x43d655d00ba199a4
	.xword	0x86a3ef5889f2bc80
	.xword	0x1c7adc3aa3fce5dd
	.xword	0xca0f04f7f0f3f6ed
	.xword	0xbb0febc2b372a5ca
	.xword	0x2936630ac72d8c1b
	.xword	0x6b396b589d4946c7
	.xword	0x9e97a3d26626fb32
	.xword	0x963c7f86a7f71ce5
	.xword	0xf2e39dd9f039c1aa
	.xword	0xdcc756427e94309a
	.xword	0xe73e531a2714f64c
	.xword	0x7ab7446a37e8aa21
	.xword	0xa69a8869255fde9c
	.xword	0x823f38e9985e387d
	.xword	0x2df9184ed996afc0
	.xword	0x20b0c5671db2d2c1
	.xword	0xf5babf7c97cbe36f
	.xword	0xd150f3000a9b3bc3
	.xword	0x79ab08c01141fb9d
	.xword	0x4e0a17df08fc846a
	.xword	0x5dab172b66c056ce
	.xword	0xa108aaecd196c94b
	.xword	0x4060b14ac6384cb5
	.xword	0x1040845ae0ae771e
	.xword	0x793e7adac8a515e7
	.xword	0x878a4f139982f335
	.xword	0xa802c7716dbff3bd
	.xword	0x321bfc50791c614c
	.xword	0x898f998a4dc52b37
	.xword	0x61050ae56736a45c
	.xword	0x926f9cc749a382e9
	.xword	0x5c41018032247919
	.xword	0x288eb0e163097327
	.xword	0xd73e86fff7a54c26
	.xword	0xe7cd03905376c5f8
	.xword	0x4a80c2994f9a81cf
	.xword	0x656d6a46299d88fe
	.xword	0x3b8d30ba9bd3ee58
	.xword	0x0acbc143957a6949
	.xword	0xeb9f5d0c24cb51ab
	.xword	0xf5aa288751d96532
	.xword	0xc8f384e54d5fa2ab
	.xword	0x6fec398e42737b20
	.xword	0xb3f07bc28f34e881
	.xword	0x7421320aec9fb240
	.xword	0x3218bbf8a4f3e811
	.xword	0x35af823ad72b9e28
	.xword	0xcfe0656a2536b3bd
	.xword	0x4a1066d39fd4f133
	.xword	0x7dbe5ae524f751ac
	.xword	0x96171271cba63074
	.xword	0x658a70ddd50ef646
	.xword	0x7db0aadbd476d501
	.xword	0x03e2f2cfd3dd0e79
	.xword	0x39610ebc7c577633
	.xword	0x168ed26d1642113c
	.xword	0xe46d09fba6f4fc5d
	.xword	0x0f83866672fe027d
	.xword	0x1228a08b478fca41
	.xword	0x22b839bd9821c5e7
	.xword	0x345db73430242b60
	.xword	0x573bf85f3b1d7eed
	.xword	0x0bb1138c97a4bf5d
	.xword	0x1840c55f0cd7723b
	.xword	0xc04d973214666a49
	.xword	0x1511bb2c39dbe211
	.xword	0x2e0e54bca7e7bbc3
	.xword	0x8b04aa39cd8c2d8a
	.xword	0xe87ad56bc01f2770
	.xword	0x4bcdf10af42bf2e6
	.xword	0x7359186918830b4e
	.xword	0xc5402c17147b700a
	.xword	0xe3c65c76ce7a3e5a
	.xword	0x2024a851f205c4bb
	.xword	0xa5e4a9a6fe94659e
	.xword	0x71733805b8c353e2
	.xword	0x77f7834851d5d4a9
	.xword	0x7c38dceeebe84c58
	.xword	0x482c7f9c07ba6a08
	.xword	0x003c05fa5392da29
	.xword	0x6194802af42da6c3
	.xword	0xd851dbecc463a303
	.xword	0x996d61f1f7eec356
	.xword	0xf53fcd34112d58c2
	.xword	0x9e524e775637ae98
	.xword	0xb2975cba970d8695
	.xword	0xd04503d5c0b2e737
	.xword	0x61aa504253874746
	.xword	0xc616025cb7a34a01
	.xword	0x2c16a9a0e6646c40
	.xword	0x59ebb554eaa91736
	.xword	0x5ca7843b022e294c
	.xword	0x051176a22de55ffc
	.xword	0x298dd42e25daeaa4
	.xword	0xc8858742dc2af1af
	.xword	0xea021da96f73721d
	.xword	0x54db09a259f61ff6
	.xword	0x80149e8a6e2dabc8
	.xword	0x497a7b2c342a512a
	.xword	0x187f71de56061984
	.xword	0x7bb9fbaf021bb6e4
	.xword	0x37ad80431b47c5c6
	.xword	0xe12c06a71e43ceed
	.xword	0x5f37601b6338eb15
	.xword	0x6410090dce796c0b
	.xword	0x9378034c71210ea3
	.xword	0x5e8e278706205ca4
	.xword	0x420b1dd6eb771b6e
	.xword	0x72140e2db2cfbb3a
	.xword	0x8111f7f12c50b240
	.xword	0x36988618b18b360e
	.xword	0xb1bd8126c704d198
	.xword	0x2bf607b7d2a80e2f
	.xword	0x5356996c0925b45a
	.xword	0xa3131f55e99c9a99
	.xword	0xb2c16f96e0d3f066
	.xword	0xa3c63d8ec4cdab77
	.xword	0x3a0b815639c801e1
	.xword	0x63470d84fa1a2287
	.xword	0xb15553195e007420
	.xword	0x77b9878dee51ab2d
	.xword	0x35d23c1632833a20
	.xword	0xbee23146aec98f16
	.xword	0x8b0df945531a9b6d
	.xword	0xd9aba8ff0b1a2a73
	.xword	0xac00977b15bdad21
	.xword	0x14d757744e290b6c
	.xword	0xcad798c3409f3e07
	.xword	0x5088ad3dcfea0e88
	.xword	0x2ee3924832b7ea23
	.xword	0x549576ab704062bb
	.xword	0xac5af5a4271eaf2e
	.xword	0x1bf1145849d2d838
	.xword	0xf89245fdce575ecf
	.xword	0xb5f6aca6f9ca0f83
	.xword	0x4485a682ef11dda2
	.xword	0xfe9ce3ff123b13c1
	.xword	0x8e0c1aa5b2ca2bd0
	.xword	0xa2dd3d4f74125693
	.xword	0xdfceae973619d0b1
	.xword	0x064f13d8ef446729
	.xword	0x8599b5ab6cd6215a
	.xword	0x4191fcd3ca33d859
	.xword	0x3e9712e6af6213fc
	.xword	0x92cdbdc875e600bc
	.xword	0x26ae726a22a508a7
	.xword	0xfb49a3e3feb6e591
	.xword	0x79b98642ea7cba2a
	.xword	0x27ceca978f247f34
	.xword	0x31017454c317cd41
	.xword	0x6528a6013a0ed503
	.xword	0x4d33ba25bcbc3c2f
	.xword	0xad5ac909629b9293
	.xword	0x339cf6f3d57a8397
	.xword	0xc86457ffdf7cf09f
	.xword	0xb72202b6916fe72d
	.xword	0x820c3765c92f909f
	.xword	0x91c181b44126a5b0
	.xword	0x7a6611d1f4c901c3
	.xword	0xbb09bea86c46ccb8
	.xword	0x85abf5a035d37e84
	.xword	0x50f4d52111124057
	.xword	0xbaf562774d153e94
	.xword	0x6f96d2bd24750685
	.xword	0x2a627c141cad4be8
	.xword	0x62b5493addc8c0c0
	.xword	0xd57c5dc2e2eed5d6
	.xword	0x41eb14dbeafbe191
	.xword	0xadff8fbb6ca838e0
	.xword	0x11bd3b57c2b94eeb
	.xword	0x9ed8ba38399d375c
	.xword	0xf6d38f387592d859
	.xword	0x72d5c060330a223f
	.xword	0x9b81c549b638abb8
	.xword	0xed54ecfcf58260c4
	.xword	0x07b07203f88015f8
	.xword	0xa0582f5ad4fab186
	.xword	0x9f24a12bd6f43997
	.xword	0xbecec747ab79471e
	.xword	0xbe28e3f493518347
	.xword	0xb0aa7afa7b9f87ad
	.xword	0xdc7b21403ce68fa3
	.xword	0x54784b5ff74f12f1
	.xword	0x475373cb72568afb
	.xword	0x3b55b890de6c391f
	.xword	0x3a53062d3c68fe22
	.xword	0x90eedb66b35b0382
	.xword	0xc5d296b4207eaadd
	.xword	0x08cdbe0e6760f4c1
	.xword	0xa244afa18c0cb0e0
	.xword	0xb0f3c660f78e0e80
	.xword	0x38ed4567dcec9f5e
	.xword	0xf26ca86bc1ad73b9



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
