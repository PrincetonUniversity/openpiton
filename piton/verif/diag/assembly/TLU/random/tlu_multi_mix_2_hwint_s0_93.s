// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: tlu_multi_mix_2_hwint_s0_93.s
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
   random seed:	513519287
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

	setx 0xeb31af2d7cb3c91a, %g1, %g0
	setx 0xd86b7c4b2011d5ac, %g1, %g1
	setx 0xbd9f61850b484dbf, %g1, %g2
	setx 0x7fdda7e03b997c97, %g1, %g3
	setx 0x80f5ed937519ae46, %g1, %g4
	setx 0xeef1deb150691949, %g1, %g5
	setx 0xd7235856325358e5, %g1, %g6
	setx 0x75ca77223d8af5ee, %g1, %g7
	setx 0xf1d0cd231bb031aa, %g1, %r16
	setx 0x6a5531e19d3d7ca9, %g1, %r17
	setx 0xb70ae04c82cc8356, %g1, %r18
	setx 0xf4ee11f456702b75, %g1, %r19
	setx 0xc895529f3a55fd15, %g1, %r20
	setx 0x847552366940b2ce, %g1, %r21
	setx 0xb2d3d2ffdf5ae448, %g1, %r22
	setx 0x6ebb234f1484184a, %g1, %r23
	setx 0x810acb361d54f8d1, %g1, %r24
	setx 0x599a52e659612d27, %g1, %r25
	setx 0xebe35ce4db92f3e5, %g1, %r26
	setx 0xccaa232ce9334a2d, %g1, %r27
	setx 0x19e1f5656873d0a0, %g1, %r28
	setx 0x75f7c68a656179ee, %g1, %r29
	setx 0xed52f19f6380f9a2, %g1, %r30
	setx 0x4a201f9263c41107, %g1, %r31
	save
	setx 0x82955c211fe56611, %g1, %r16
	setx 0x1d6d0a47a7fe3fbb, %g1, %r17
	setx 0x719752a5f90d30d6, %g1, %r18
	setx 0xf06b925bbc441f54, %g1, %r19
	setx 0xbc1c32e8c9a41182, %g1, %r20
	setx 0xa3213894e27ff358, %g1, %r21
	setx 0x9fa7671c5a630eb8, %g1, %r22
	setx 0x45f3a85d684728b6, %g1, %r23
	setx 0x171f003571f825f6, %g1, %r24
	setx 0x5a7045ea04cbc5d4, %g1, %r25
	setx 0xddee97333bf6f385, %g1, %r26
	setx 0x279cd1899c9ba77b, %g1, %r27
	setx 0x0215dfe38cc0efce, %g1, %r28
	setx 0x988746c00fcd9f18, %g1, %r29
	setx 0x76ce42e34448ab21, %g1, %r30
	setx 0x8091db5bfa3d8a35, %g1, %r31
	save
	setx 0x4b207664bc92bf57, %g1, %r16
	setx 0xe01fbc6a5c55d561, %g1, %r17
	setx 0xed682d3e0e1a73b3, %g1, %r18
	setx 0x7833d0dfd3ad98c6, %g1, %r19
	setx 0xb44ff059b9406eef, %g1, %r20
	setx 0xcd3353466bbf9cac, %g1, %r21
	setx 0x7ac2153b1e868aa7, %g1, %r22
	setx 0x7a24e70395b22e69, %g1, %r23
	setx 0xc012e10e06db999c, %g1, %r24
	setx 0xc27db9550f68c17b, %g1, %r25
	setx 0xcb99ac8e61c92f09, %g1, %r26
	setx 0x2f2eda0b636a40e7, %g1, %r27
	setx 0xbc84dffad35822df, %g1, %r28
	setx 0xd80a7c0496000a02, %g1, %r29
	setx 0x1ae06fde1f9f46cd, %g1, %r30
	setx 0xc8087221ba26a9b5, %g1, %r31
	save
	setx 0xd93cb23698312d49, %g1, %r16
	setx 0xaedc34790d03d733, %g1, %r17
	setx 0x16d8b5d2478a51bc, %g1, %r18
	setx 0xfb6270306111b2b0, %g1, %r19
	setx 0x1f3dbeab443633d0, %g1, %r20
	setx 0xe5f1dd2aab28efae, %g1, %r21
	setx 0xdf6d2737ae13b297, %g1, %r22
	setx 0x4ad748e443842925, %g1, %r23
	setx 0xe4918d5422ef9668, %g1, %r24
	setx 0x145f29764df44e1d, %g1, %r25
	setx 0xfbf54481d23784b0, %g1, %r26
	setx 0xf42661853304adac, %g1, %r27
	setx 0xd3b7a198dc8710c4, %g1, %r28
	setx 0x8f5c6b3de2c7e0b7, %g1, %r29
	setx 0x7a931b6f7b1ec8e1, %g1, %r30
	setx 0xa60c7288fbad3b91, %g1, %r31
	save
	setx 0xbe0f6cbb16342678, %g1, %r16
	setx 0x559e5897884cd6a1, %g1, %r17
	setx 0x96b159696a4db8e4, %g1, %r18
	setx 0xa514ef1fa81c25bb, %g1, %r19
	setx 0x2d58f434ab02fdc8, %g1, %r20
	setx 0x5c0cf0d67e1abcaa, %g1, %r21
	setx 0x9fdb83caf7e4f5d1, %g1, %r22
	setx 0xd1d0e9d4a46e3188, %g1, %r23
	setx 0x404112aca1a2d355, %g1, %r24
	setx 0x494ba741dbd36693, %g1, %r25
	setx 0xd5256ea1dfb157c6, %g1, %r26
	setx 0x4383eee54b7acb0a, %g1, %r27
	setx 0xd63ca43d97926915, %g1, %r28
	setx 0xa8a3776516d2b0ec, %g1, %r29
	setx 0xf8a84a43b0fbf9a7, %g1, %r30
	setx 0x1bb233ed0685b539, %g1, %r31
	save
	setx 0xf09b5d1f7167d3d9, %g1, %r16
	setx 0x70086b8c9884e62e, %g1, %r17
	setx 0xb0af620b6145c3e3, %g1, %r18
	setx 0xce03d39611e450b7, %g1, %r19
	setx 0x7f2245f387b3a001, %g1, %r20
	setx 0x58e2eca8b13fcb98, %g1, %r21
	setx 0xce4ff772af395581, %g1, %r22
	setx 0x064639b306c16be8, %g1, %r23
	setx 0xdc2acdd3601804ee, %g1, %r24
	setx 0x32abcba5917331d0, %g1, %r25
	setx 0xec1753585c7ec265, %g1, %r26
	setx 0x1c25ccf74170e988, %g1, %r27
	setx 0x50d4c2fa9506f2e7, %g1, %r28
	setx 0x0cdb974c5bad2126, %g1, %r29
	setx 0xe6f603a430be3cea, %g1, %r30
	setx 0x6aab41bf8bc71cd1, %g1, %r31
	save
	setx 0xbf4c140d39b04004, %g1, %r16
	setx 0xa28ef66074fee81e, %g1, %r17
	setx 0xfacef123b424247b, %g1, %r18
	setx 0x29a39d6793674795, %g1, %r19
	setx 0xc3e12103973b1be9, %g1, %r20
	setx 0xd05ee4b55dc91bff, %g1, %r21
	setx 0x2751b72205b974e6, %g1, %r22
	setx 0x3593566ce7c6a3e9, %g1, %r23
	setx 0xd928335d724862f2, %g1, %r24
	setx 0xfdcd06ddcf96dc67, %g1, %r25
	setx 0xd14586bfa602b0b2, %g1, %r26
	setx 0x31fdb94daa1d0435, %g1, %r27
	setx 0x84e4707543ff7eea, %g1, %r28
	setx 0xac63b439ae3839ec, %g1, %r29
	setx 0xea583d5876849f8b, %g1, %r30
	setx 0x2c875ba60fc6471a, %g1, %r31
	save
	setx 0xc1ec9a8d9ee93a45, %g1, %r16
	setx 0xf6c7c2e1f33a94bf, %g1, %r17
	setx 0x532e50bb1363f391, %g1, %r18
	setx 0x7263d491e76347f1, %g1, %r19
	setx 0x2a5b4ebc8ba737db, %g1, %r20
	setx 0xa6dbb2450eb1025f, %g1, %r21
	setx 0x156112572e7dfd9c, %g1, %r22
	setx 0x2ba4c031ce02b2f3, %g1, %r23
	setx 0xdd3b11dde42dc454, %g1, %r24
	setx 0xae77917dafa50cb3, %g1, %r25
	setx 0xc096644fdc1e4a48, %g1, %r26
	setx 0x72a70999063faf20, %g1, %r27
	setx 0x32b042e0e423814b, %g1, %r28
	setx 0xa399352bcc1836a0, %g1, %r29
	setx 0xa5b9254fa02f157a, %g1, %r30
	setx 0x2afc23e2f8a32023, %g1, %r31
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
	.word 0xbde5219a  ! 3: SAVE_I	save	%r20, 0x0001, %r30
	.word 0xb1e4a15d  ! 5: SAVE_I	save	%r18, 0x0001, %r24
	.word 0xbde52164  ! 6: SAVE_I	save	%r20, 0x0001, %r30
	.word 0x89956128  ! 7: WRPR_TICK_I	wrpr	%r21, 0x0128, %tick
hwintr_0_0:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_0), 16, 16)) -> intp(0, 0, 31)
	.word 0xbc3de0ad  ! 9: XNOR_I	xnor 	%r23, 0x00ad, %r30
	.word 0xb1e4a15c  ! 12: SAVE_I	save	%r18, 0x0001, %r24
	.word 0x9195a03f  ! 17: WRPR_PIL_I	wrpr	%r22, 0x003f, %pil
hwintr_0_1:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_1), 16, 16)) -> intp(0, 0, f)
	.word 0xb52c0000  ! 23: SLL_R	sll 	%r16, %r0, %r26
	setx	0xb3405f8f0000a918, %g1, %r10
	.word 0x819a8000  ! 24: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xb5e520ca  ! 26: SAVE_I	save	%r20, 0x0001, %r26
	.word 0xb5e4200a  ! 28: SAVE_I	save	%r16, 0x0001, %r26
hwintr_0_2:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_2), 16, 16)) -> intp(0, 0, 1d)
	.word 0xb3e5e1c4  ! 35: SAVE_I	save	%r23, 0x0001, %r25
	.word 0xb3e56083  ! 38: SAVE_I	save	%r21, 0x0001, %r25
	.word 0xbde46194  ! 40: SAVE_I	save	%r17, 0x0001, %r30
	.word 0xb3e42110  ! 41: SAVE_I	save	%r16, 0x0001, %r25
	.word 0xb9e5a080  ! 42: SAVE_I	save	%r22, 0x0001, %r28
hwintr_0_3:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_3), 16, 16)) -> intp(0, 0, 3f)
	.word 0xb1e4a1bc  ! 45: SAVE_I	save	%r18, 0x0001, %r24
	.word 0xb1500000  ! 49: RDPR_TPC	<illegal instruction>
	.word 0xb3504000  ! 51: RDPR_TNPC	<illegal instruction>
	.word 0xb7e4a0a3  ! 55: SAVE_I	save	%r18, 0x0001, %r27
	.word 0x8194a15b  ! 58: WRPR_TPC_I	wrpr	%r18, 0x015b, %tpc
	.word 0xbfe5e1a5  ! 59: SAVE_I	save	%r23, 0x0001, %r31
	.word 0xb3520000  ! 62: RDPR_PIL	<illegal instruction>
hwintr_0_4:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_4), 16, 16)) -> intp(0, 0, 1c)
	.word 0xbbe5205b  ! 64: SAVE_I	save	%r20, 0x0001, %r29
hwintr_0_5:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_5), 16, 16)) -> intp(0, 0, 1f)
	.word 0x9195e015  ! 68: WRPR_PIL_I	wrpr	%r23, 0x0015, %pil
	.word 0xbde5211d  ! 77: SAVE_I	save	%r20, 0x0001, %r30
	.word 0xbde56175  ! 78: SAVE_I	save	%r21, 0x0001, %r30
	.word 0xbb51c000  ! 81: RDPR_TL	<illegal instruction>
	.word 0xb5e56087  ! 82: SAVE_I	save	%r21, 0x0001, %r26
	.word 0xb9e5a1c6  ! 86: SAVE_I	save	%r22, 0x0001, %r28
	setx	data_start_6, %g1, %r17
	.word 0xb550c000  ! 91: RDPR_TT	<illegal instruction>
	.word 0xbb500000  ! 95: RDPR_TPC	<illegal instruction>
hwintr_0_6:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_6), 16, 16)) -> intp(0, 0, d)
	.word 0xbfe5e085  ! 97: SAVE_I	save	%r23, 0x0001, %r31
	.word 0xbc044000  ! 98: ADD_R	add 	%r17, %r0, %r30
	.word 0xbbe561b4  ! 100: SAVE_I	save	%r21, 0x0001, %r29
	.word 0xb1e4a075  ! 106: SAVE_I	save	%r18, 0x0001, %r24
hwintr_0_7:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_7), 16, 16)) -> intp(0, 0, 1)
	setx	data_start_4, %g1, %r20
	.word 0xb63d6075  ! 116: XNOR_I	xnor 	%r21, 0x0075, %r27
	.word 0x8795608d  ! 117: WRPR_TT_I	wrpr	%r21, 0x008d, %tt
	.word 0xb9e52039  ! 118: SAVE_I	save	%r20, 0x0001, %r28
	setx	0x9299dd5500005a54, %g1, %r10
	.word 0x819a8000  ! 119: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xbfe561b7  ! 120: SAVE_I	save	%r21, 0x0001, %r31
	.word 0xbbe5a124  ! 122: SAVE_I	save	%r22, 0x0001, %r29
hwintr_0_8:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_8), 16, 16)) -> intp(0, 0, 3e)
	.word 0xbd510000  ! 127: RDPR_TICK	<illegal instruction>
	.word 0xb3e460ba  ! 128: SAVE_I	save	%r17, 0x0001, %r25
	setx	data_start_7, %g1, %r22
	.word 0xb1e5a1c1  ! 137: SAVE_I	save	%r22, 0x0001, %r24
	.word 0xbf480000  ! 138: RDHPR_HPSTATE	rdhpr	%hpstate, %r31
	.word 0xb9e4e09d  ! 139: SAVE_I	save	%r19, 0x0001, %r28
hwintr_0_9:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_9), 16, 16)) -> intp(0, 0, 26)
	.word 0xb3e56125  ! 143: SAVE_I	save	%r21, 0x0001, %r25
	.word 0x89942046  ! 147: WRPR_TICK_I	wrpr	%r16, 0x0046, %tick
	.word 0xbbe5a02b  ! 149: SAVE_I	save	%r22, 0x0001, %r29
	.word 0x87952164  ! 152: WRPR_TT_I	wrpr	%r20, 0x0164, %tt
	.word 0xbbe56133  ! 153: SAVE_I	save	%r21, 0x0001, %r29
	.word 0xbfe420f3  ! 157: SAVE_I	save	%r16, 0x0001, %r31
hwintr_0_10:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_10), 16, 16)) -> intp(0, 0, 1e)
	.word 0xbfe421fd  ! 159: SAVE_I	save	%r16, 0x0001, %r31
	setx	data_start_7, %g1, %r19
hwintr_0_11:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_11), 16, 16)) -> intp(0, 0, 3a)
	.word 0xb7e561c1  ! 165: SAVE_I	save	%r21, 0x0001, %r27
	mov	0, %r12
	.word 0x8f930000  ! 167: WRPR_TL_R	wrpr	%r12, %r0, %tl
hwintr_0_12:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_12), 16, 16)) -> intp(0, 0, 11)
	.word 0xb7510000  ! 169: RDPR_TICK	<illegal instruction>
	.word 0xbfe56089  ! 171: SAVE_I	save	%r21, 0x0001, %r31
	.word 0x8d94e13e  ! 172: WRPR_PSTATE_I	wrpr	%r19, 0x013e, %pstate
	.word 0xbfe5a041  ! 174: SAVE_I	save	%r22, 0x0001, %r31
	.word 0xb1e5e178  ! 178: SAVE_I	save	%r23, 0x0001, %r24
	.word 0x859560b5  ! 182: WRPR_TSTATE_I	wrpr	%r21, 0x00b5, %tstate
	.word 0xbbe5e1cb  ! 185: SAVE_I	save	%r23, 0x0001, %r29
	.word 0xbfe46027  ! 188: SAVE_I	save	%r17, 0x0001, %r31
	.word 0x819421f3  ! 191: WRPR_TPC_I	wrpr	%r16, 0x01f3, %tpc
	.word 0xb7e5a02c  ! 192: SAVE_I	save	%r22, 0x0001, %r27
	.word 0xb3480000  ! 193: RDHPR_HPSTATE	rdhpr	%hpstate, %r25
	.word 0xbfe4e0fb  ! 194: SAVE_I	save	%r19, 0x0001, %r31
	.word 0xb151c000  ! 196: RDPR_TL	<illegal instruction>
	.word 0xb5480000  ! 197: RDHPR_HPSTATE	rdhpr	%hpstate, %r26
	.word 0xbfe52167  ! 200: SAVE_I	save	%r20, 0x0001, %r31
	.word 0xb951c000  ! 201: RDPR_TL	<illegal instruction>
	mov	2, %r12
	.word 0xa1930000  ! 202: WRPR_GL_R	wrpr	%r12, %r0, %-
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xba956153  ! 205: ORcc_I	orcc 	%r21, 0x0153, %r29
	.word 0xbb51c000  ! 210: RDPR_TL	<illegal instruction>
	.word 0xbbe46124  ! 212: SAVE_I	save	%r17, 0x0001, %r29
	.word 0xb1518000  ! 214: RDPR_PSTATE	<illegal instruction>
	.word 0xbb50c000  ! 222: RDPR_TT	<illegal instruction>
	.word 0xb52c3001  ! 226: SLLX_I	sllx	%r16, 0x0001, %r26
	.word 0xb9e4e0cc  ! 229: SAVE_I	save	%r19, 0x0001, %r28
	.word 0xbe8521aa  ! 230: ADDcc_I	addcc 	%r20, 0x01aa, %r31
	.word 0xbfe4e1e0  ! 231: SAVE_I	save	%r19, 0x0001, %r31
	.word 0xb7e521ee  ! 234: SAVE_I	save	%r20, 0x0001, %r27
hwintr_0_13:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_13), 16, 16)) -> intp(0, 0, 15)
	.word 0x9194e114  ! 240: WRPR_PIL_I	wrpr	%r19, 0x0114, %pil
	.word 0xbeb520ce  ! 241: ORNcc_I	orncc 	%r20, 0x00ce, %r31
	.word 0xb5e5a1d9  ! 242: SAVE_I	save	%r22, 0x0001, %r26
	setx	0x11c56eda00006f97, %g1, %r10
	.word 0x839a8000  ! 244: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb1e5e014  ! 245: SAVE_I	save	%r23, 0x0001, %r24
	.word 0xbde5e17d  ! 246: SAVE_I	save	%r23, 0x0001, %r30
	.word 0xb7540000  ! 248: RDPR_GL	<illegal instruction>
	.word 0xbcb48000  ! 249: ORNcc_R	orncc 	%r18, %r0, %r30
	.word 0xbebc2130  ! 252: XNORcc_I	xnorcc 	%r16, 0x0130, %r31
	.word 0xb69ce056  ! 255: XORcc_I	xorcc 	%r19, 0x0056, %r27
	.word 0xbfe460ae  ! 260: SAVE_I	save	%r17, 0x0001, %r31
	.word 0xbfe4604a  ! 261: SAVE_I	save	%r17, 0x0001, %r31
	.word 0xbde52030  ! 262: SAVE_I	save	%r20, 0x0001, %r30
	.word 0xb3e460de  ! 263: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xbfe52095  ! 272: SAVE_I	save	%r20, 0x0001, %r31
	.word 0xb8844000  ! 274: ADDcc_R	addcc 	%r17, %r0, %r28
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
hwintr_0_14:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_14), 16, 16)) -> intp(0, 0, 35)
	.word 0xbbe460b2  ! 282: SAVE_I	save	%r17, 0x0001, %r29
	mov	1, %r12
	.word 0x8f930000  ! 284: WRPR_TL_R	wrpr	%r12, %r0, %tl
hwintr_0_15:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_15), 16, 16)) -> intp(0, 0, e)
	.word 0xb1e4e1df  ! 291: SAVE_I	save	%r19, 0x0001, %r24
	.word 0xb5e5e117  ! 294: SAVE_I	save	%r23, 0x0001, %r26
	.word 0xb5e4e066  ! 296: SAVE_I	save	%r19, 0x0001, %r26
hwintr_0_16:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_16), 16, 16)) -> intp(0, 0, 4)
	.word 0xbde4207a  ! 299: SAVE_I	save	%r16, 0x0001, %r30
	.word 0x85956098  ! 301: WRPR_TSTATE_I	wrpr	%r21, 0x0098, %tstate
	.word 0xbbe5a0d2  ! 302: SAVE_I	save	%r22, 0x0001, %r29
	.word 0xb5e560f1  ! 303: SAVE_I	save	%r21, 0x0001, %r26
hwintr_0_17:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_17), 16, 16)) -> intp(0, 0, a)
	.word 0x8994219c  ! 305: WRPR_TICK_I	wrpr	%r16, 0x019c, %tick
	.word 0xb1e4a019  ! 306: SAVE_I	save	%r18, 0x0001, %r24
	.word 0xb9e5e0eb  ! 307: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xb00cc000  ! 308: AND_R	and 	%r19, %r0, %r24
	.word 0xbde5a0fb  ! 309: SAVE_I	save	%r22, 0x0001, %r30
	.word 0xb9e56143  ! 310: SAVE_I	save	%r21, 0x0001, %r28
	.word 0xbf3c4000  ! 311: SRA_R	sra 	%r17, %r0, %r31
	setx	0x2809395a0000ed0b, %g1, %r10
	.word 0x839a8000  ! 312: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb73c2001  ! 313: SRA_I	sra 	%r16, 0x0001, %r27
	.word 0xb7e56192  ! 314: SAVE_I	save	%r21, 0x0001, %r27
	.word 0xbfe5209c  ! 320: SAVE_I	save	%r20, 0x0001, %r31
	.word 0xbcbce1f6  ! 326: XNORcc_I	xnorcc 	%r19, 0x01f6, %r30
	.word 0xb5e52027  ! 327: SAVE_I	save	%r20, 0x0001, %r26
	.word 0xbfe420fe  ! 328: SAVE_I	save	%r16, 0x0001, %r31
	.word 0xbbe46176  ! 332: SAVE_I	save	%r17, 0x0001, %r29
	.word 0xb5520000  ! 334: RDPR_PIL	<illegal instruction>
	.word 0xb3520000  ! 339: RDPR_PIL	<illegal instruction>
	.word 0xb7e4a178  ! 340: SAVE_I	save	%r18, 0x0001, %r27
	.word 0xba94a162  ! 341: ORcc_I	orcc 	%r18, 0x0162, %r29
	.word 0xb2c48000  ! 345: ADDCcc_R	addccc 	%r18, %r0, %r25
	.word 0xb9e46086  ! 346: SAVE_I	save	%r17, 0x0001, %r28
	.word 0xb7e460d0  ! 347: SAVE_I	save	%r17, 0x0001, %r27
	.word 0xb3e5608a  ! 349: SAVE_I	save	%r21, 0x0001, %r25
	mov	2, %r12
	.word 0xa1930000  ! 350: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb7e46002  ! 352: SAVE_I	save	%r17, 0x0001, %r27
	.word 0xbde5a040  ! 353: SAVE_I	save	%r22, 0x0001, %r30
	.word 0xbb510000  ! 356: RDPR_TICK	<illegal instruction>
hwintr_0_18:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_18), 16, 16)) -> intp(0, 0, 3b)
	.word 0xbbe4215c  ! 358: SAVE_I	save	%r16, 0x0001, %r29
	.word 0xbbe42149  ! 360: SAVE_I	save	%r16, 0x0001, %r29
hwintr_0_19:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_19), 16, 16)) -> intp(0, 0, 12)
	.word 0x8d9520b0  ! 364: WRPR_PSTATE_I	wrpr	%r20, 0x00b0, %pstate
	.word 0xb3e5203f  ! 367: SAVE_I	save	%r20, 0x0001, %r25
	.word 0xb8258000  ! 370: SUB_R	sub 	%r22, %r0, %r28
hwintr_0_20:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_20), 16, 16)) -> intp(0, 0, 2d)
	.word 0x83942153  ! 375: WRPR_TNPC_I	wrpr	%r16, 0x0153, %tnpc
	.word 0xb7e5a12b  ! 376: SAVE_I	save	%r22, 0x0001, %r27
hwintr_0_21:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_21), 16, 16)) -> intp(0, 0, 3c)
	.word 0xbe94c000  ! 378: ORcc_R	orcc 	%r19, %r0, %r31
hwintr_0_22:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_22), 16, 16)) -> intp(0, 0, e)
	.word 0xb1e4a17b  ! 383: SAVE_I	save	%r18, 0x0001, %r24
hwintr_0_23:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_23), 16, 16)) -> intp(0, 0, 10)
	.word 0xb1e5a1d1  ! 388: SAVE_I	save	%r22, 0x0001, %r24
	.word 0xb5e561fe  ! 389: SAVE_I	save	%r21, 0x0001, %r26
	.word 0xb7540000  ! 390: RDPR_GL	<illegal instruction>
	setx	data_start_4, %g1, %r22
	.word 0xb7e5e09d  ! 393: SAVE_I	save	%r23, 0x0001, %r27
	setx	0xebe8255400007c51, %g1, %r10
	.word 0x839a8000  ! 394: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb3e4e1f4  ! 397: SAVE_I	save	%r19, 0x0001, %r25
	.word 0xbfe46001  ! 398: SAVE_I	save	%r17, 0x0001, %r31
	.word 0xb7518000  ! 402: RDPR_PSTATE	<illegal instruction>
	.word 0xbde4a068  ! 407: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xb7e5e1b5  ! 409: SAVE_I	save	%r23, 0x0001, %r27
	.word 0xb0140000  ! 413: OR_R	or 	%r16, %r0, %r24
	mov	0, %r12
	.word 0xa1930000  ! 414: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb7e4a18d  ! 417: SAVE_I	save	%r18, 0x0001, %r27
	.word 0xb9e520dd  ! 419: SAVE_I	save	%r20, 0x0001, %r28
	.word 0xbb540000  ! 420: RDPR_GL	<illegal instruction>
	.word 0xbb3de001  ! 423: SRA_I	sra 	%r23, 0x0001, %r29
	.word 0xb3500000  ! 425: RDPR_TPC	<illegal instruction>
	.word 0xb3e5216c  ! 427: SAVE_I	save	%r20, 0x0001, %r25
	.word 0xbfe4e17a  ! 428: SAVE_I	save	%r19, 0x0001, %r31
hwintr_0_24:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_24), 16, 16)) -> intp(0, 0, 2a)
	.word 0xbde4a094  ! 432: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xb3e46180  ! 433: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xbd50c000  ! 434: RDPR_TT	<illegal instruction>
	setx	data_start_4, %g1, %r20
	.word 0xbfe5a1c6  ! 438: SAVE_I	save	%r22, 0x0001, %r31
	.word 0xbbe561c2  ! 439: SAVE_I	save	%r21, 0x0001, %r29
	.word 0xb9e5a06f  ! 440: SAVE_I	save	%r22, 0x0001, %r28
	.word 0xb5e421a3  ! 442: SAVE_I	save	%r16, 0x0001, %r26
	.word 0xb1e5e0b8  ! 443: SAVE_I	save	%r23, 0x0001, %r24
hwintr_0_25:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_25), 16, 16)) -> intp(0, 0, 14)
	.word 0xb1e4e077  ! 446: SAVE_I	save	%r19, 0x0001, %r24
	.word 0x899521fc  ! 447: WRPR_TICK_I	wrpr	%r20, 0x01fc, %tick
	.word 0xbde5a1c5  ! 448: SAVE_I	save	%r22, 0x0001, %r30
	.word 0x8d9420c4  ! 451: WRPR_PSTATE_I	wrpr	%r16, 0x00c4, %pstate
	.word 0xb7e5a03f  ! 453: SAVE_I	save	%r22, 0x0001, %r27
	.word 0xbb540000  ! 458: RDPR_GL	<illegal instruction>
	.word 0xbbe42137  ! 460: SAVE_I	save	%r16, 0x0001, %r29
	.word 0xb7e4a158  ! 461: SAVE_I	save	%r18, 0x0001, %r27
	.word 0xb5e42168  ! 462: SAVE_I	save	%r16, 0x0001, %r26
	.word 0xbbe5a0d0  ! 465: SAVE_I	save	%r22, 0x0001, %r29
	.word 0xb3e4a062  ! 473: SAVE_I	save	%r18, 0x0001, %r25
	.word 0xb5e4e007  ! 475: SAVE_I	save	%r19, 0x0001, %r26
	.word 0x8394e183  ! 476: WRPR_TNPC_I	wrpr	%r19, 0x0183, %tnpc
	.word 0xb5e5a136  ! 479: SAVE_I	save	%r22, 0x0001, %r26
	.word 0xb5e5a12b  ! 482: SAVE_I	save	%r22, 0x0001, %r26
	.word 0xbbe4a057  ! 485: SAVE_I	save	%r18, 0x0001, %r29
	.word 0xbbe4a1d9  ! 486: SAVE_I	save	%r18, 0x0001, %r29
	.word 0xb7e420e3  ! 487: SAVE_I	save	%r16, 0x0001, %r27
	.word 0xbde5e103  ! 490: SAVE_I	save	%r23, 0x0001, %r30
	.word 0xbde4e0f6  ! 501: SAVE_I	save	%r19, 0x0001, %r30
	.word 0xbbe4200f  ! 502: SAVE_I	save	%r16, 0x0001, %r29
	.word 0xb9e5e142  ! 503: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xb5e5e1c6  ! 504: SAVE_I	save	%r23, 0x0001, %r26
	.word 0xbf504000  ! 506: RDPR_TNPC	<illegal instruction>
	.word 0xb1e461a6  ! 507: SAVE_I	save	%r17, 0x0001, %r24
	setx	0x210c91370000fddd, %g1, %r10
	.word 0x839a8000  ! 511: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xbde56031  ! 514: SAVE_I	save	%r21, 0x0001, %r30
	.word 0xbcbc4000  ! 515: XNORcc_R	xnorcc 	%r17, %r0, %r30
	.word 0xb3e420ee  ! 516: SAVE_I	save	%r16, 0x0001, %r25
	.word 0x9195e01c  ! 521: WRPR_PIL_I	wrpr	%r23, 0x001c, %pil
	.word 0xbfe4219d  ! 524: SAVE_I	save	%r16, 0x0001, %r31
	.word 0x8194a0ed  ! 525: WRPR_TPC_I	wrpr	%r18, 0x00ed, %tpc
	setx	data_start_7, %g1, %r20
	.word 0xb8258000  ! 531: SUB_R	sub 	%r22, %r0, %r28
	setx	data_start_5, %g1, %r20
	.word 0xb5e5a133  ! 534: SAVE_I	save	%r22, 0x0001, %r26
	.word 0x89952183  ! 535: WRPR_TICK_I	wrpr	%r20, 0x0183, %tick
	.word 0xbbe4e00a  ! 540: SAVE_I	save	%r19, 0x0001, %r29
	.word 0xb5e561c6  ! 542: SAVE_I	save	%r21, 0x0001, %r26
	setx	data_start_7, %g1, %r21
	.word 0xb1e5e023  ! 545: SAVE_I	save	%r23, 0x0001, %r24
	.word 0xbf518000  ! 549: RDPR_PSTATE	<illegal instruction>
	.word 0xb8a4215a  ! 552: SUBcc_I	subcc 	%r16, 0x015a, %r28
hwintr_0_26:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_26), 16, 16)) -> intp(0, 0, 2)
	.word 0xb7500000  ! 556: RDPR_TPC	<illegal instruction>
	.word 0xbfe5a037  ! 557: SAVE_I	save	%r22, 0x0001, %r31
hwintr_0_27:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_27), 16, 16)) -> intp(0, 0, 29)
	.word 0xb7e52077  ! 561: SAVE_I	save	%r20, 0x0001, %r27
	.word 0xbfe46118  ! 563: SAVE_I	save	%r17, 0x0001, %r31
	.word 0xbbe42068  ! 564: SAVE_I	save	%r16, 0x0001, %r29
	setx	data_start_3, %g1, %r22
	.word 0xbf520000  ! 566: RDPR_PIL	<illegal instruction>
hwintr_0_28:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_28), 16, 16)) -> intp(0, 0, 10)
	.word 0xbd51c000  ! 569: RDPR_TL	<illegal instruction>
	.word 0xbde52024  ! 570: SAVE_I	save	%r20, 0x0001, %r30
	.word 0xb5e56070  ! 576: SAVE_I	save	%r21, 0x0001, %r26
	.word 0xb5e420b6  ! 578: SAVE_I	save	%r16, 0x0001, %r26
	.word 0xb1520000  ! 581: RDPR_PIL	<illegal instruction>
hwintr_0_29:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_29), 16, 16)) -> intp(0, 0, 1e)
	setx	0xbf3ee15c0000bbd2, %g1, %r10
	.word 0x839a8000  ! 592: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xbe4560dc  ! 596: ADDC_I	addc 	%r21, 0x00dc, %r31
	.word 0xb8346193  ! 598: ORN_I	orn 	%r17, 0x0193, %r28
	.word 0xb5e460b1  ! 599: SAVE_I	save	%r17, 0x0001, %r26
	.word 0xb92c0000  ! 602: SLL_R	sll 	%r16, %r0, %r28
	setx	data_start_7, %g1, %r21
	.word 0x87942186  ! 609: WRPR_TT_I	wrpr	%r16, 0x0186, %tt
	.word 0xbc2d8000  ! 612: ANDN_R	andn 	%r22, %r0, %r30
	.word 0x8d946196  ! 613: WRPR_PSTATE_I	wrpr	%r17, 0x0196, %pstate
	.word 0xb5e5e0e8  ! 621: SAVE_I	save	%r23, 0x0001, %r26
	.word 0xb1518000  ! 623: RDPR_PSTATE	<illegal instruction>
	.word 0xb7e4e162  ! 625: SAVE_I	save	%r19, 0x0001, %r27
	.word 0xb9e420aa  ! 627: SAVE_I	save	%r16, 0x0001, %r28
	.word 0xbde5e152  ! 630: SAVE_I	save	%r23, 0x0001, %r30
	.word 0xb7e4a1c4  ! 631: SAVE_I	save	%r18, 0x0001, %r27
	.word 0xb625c000  ! 632: SUB_R	sub 	%r23, %r0, %r27
	.word 0xb6348000  ! 634: SUBC_R	orn 	%r18, %r0, %r27
	.word 0xb5504000  ! 636: RDPR_TNPC	<illegal instruction>
	setx	0x58f02c5600004d1b, %g1, %r10
	.word 0x819a8000  ! 639: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
hwintr_0_30:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_30), 16, 16)) -> intp(0, 0, 18)
	.word 0xbbe56101  ! 643: SAVE_I	save	%r21, 0x0001, %r29
	.word 0xb9504000  ! 647: RDPR_TNPC	<illegal instruction>
	setx	data_start_4, %g1, %r18
	.word 0xbde560ce  ! 649: SAVE_I	save	%r21, 0x0001, %r30
	.word 0xb3508000  ! 650: RDPR_TSTATE	<illegal instruction>
	setx	0x9050fa630000ea5f, %g1, %r10
	.word 0x819a8000  ! 652: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	setx	0xc1a676050000ef96, %g1, %r10
	.word 0x839a8000  ! 653: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb1e5a19f  ! 655: SAVE_I	save	%r22, 0x0001, %r24
	.word 0xb13c6001  ! 656: SRA_I	sra 	%r17, 0x0001, %r24
	.word 0xb3540000  ! 660: RDPR_GL	<illegal instruction>
	.word 0xbbe461c7  ! 666: SAVE_I	save	%r17, 0x0001, %r29
	.word 0xbbe42038  ! 667: SAVE_I	save	%r16, 0x0001, %r29
	.word 0xb5e4e148  ! 672: SAVE_I	save	%r19, 0x0001, %r26
	.word 0xb7e5e13b  ! 674: SAVE_I	save	%r23, 0x0001, %r27
	.word 0xb5e4a165  ! 676: SAVE_I	save	%r18, 0x0001, %r26
	.word 0xb5e5212a  ! 680: SAVE_I	save	%r20, 0x0001, %r26
	.word 0xb1510000  ! 683: RDPR_TICK	<illegal instruction>
	.word 0xbde42130  ! 688: SAVE_I	save	%r16, 0x0001, %r30
	.word 0xb1e5a165  ! 689: SAVE_I	save	%r22, 0x0001, %r24
	.word 0xbde4e1d5  ! 693: SAVE_I	save	%r19, 0x0001, %r30
	.word 0xbfe461ad  ! 696: SAVE_I	save	%r17, 0x0001, %r31
	mov	2, %r12
	.word 0x8f930000  ! 698: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xb5518000  ! 702: RDPR_PSTATE	<illegal instruction>
	.word 0xbfe5e1b1  ! 703: SAVE_I	save	%r23, 0x0001, %r31
hwintr_0_31:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_31), 16, 16)) -> intp(0, 0, 35)
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	setx	0xe9f7ce550000ec0f, %g1, %r10
	.word 0x839a8000  ! 711: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb9e521f7  ! 716: SAVE_I	save	%r20, 0x0001, %r28
	.word 0xb1e460ef  ! 717: SAVE_I	save	%r17, 0x0001, %r24
	.word 0xbd2d3001  ! 718: SLLX_I	sllx	%r20, 0x0001, %r30
	.word 0xbde42118  ! 722: SAVE_I	save	%r16, 0x0001, %r30
	.word 0xb1e56057  ! 724: SAVE_I	save	%r21, 0x0001, %r24
	.word 0x8794613b  ! 729: WRPR_TT_I	wrpr	%r17, 0x013b, %tt
	.word 0xb5e5e0f0  ! 731: SAVE_I	save	%r23, 0x0001, %r26
	.word 0xbbe520b8  ! 732: SAVE_I	save	%r20, 0x0001, %r29
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb5480000  ! 734: RDHPR_HPSTATE	rdhpr	%hpstate, %r26
	.word 0xbd355000  ! 735: SRLX_R	srlx	%r21, %r0, %r30
	.word 0xb7e5217f  ! 737: SAVE_I	save	%r20, 0x0001, %r27
hwintr_0_32:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_32), 16, 16)) -> intp(0, 0, 20)
hwintr_0_33:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_33), 16, 16)) -> intp(0, 0, 23)
	.word 0xbde5e168  ! 744: SAVE_I	save	%r23, 0x0001, %r30
	.word 0xbd510000  ! 745: RDPR_TICK	<illegal instruction>
hwintr_0_34:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_34), 16, 16)) -> intp(0, 0, 39)
	.word 0x8d9420fb  ! 748: WRPR_PSTATE_I	wrpr	%r16, 0x00fb, %pstate
	.word 0xb7e561d9  ! 750: SAVE_I	save	%r21, 0x0001, %r27
	.word 0xb3e520fd  ! 752: SAVE_I	save	%r20, 0x0001, %r25
	setx	data_start_6, %g1, %r22
	.word 0x8395216c  ! 757: WRPR_TNPC_I	wrpr	%r20, 0x016c, %tnpc
	.word 0x9195a128  ! 758: WRPR_PIL_I	wrpr	%r22, 0x0128, %pil
	.word 0xb7e42008  ! 759: SAVE_I	save	%r16, 0x0001, %r27
hwintr_0_35:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_35), 16, 16)) -> intp(0, 0, 25)
	.word 0x839421a8  ! 768: WRPR_TNPC_I	wrpr	%r16, 0x01a8, %tnpc
	.word 0xb3e5617c  ! 769: SAVE_I	save	%r21, 0x0001, %r25
	.word 0xbde461da  ! 771: SAVE_I	save	%r17, 0x0001, %r30
	.word 0xbf500000  ! 778: RDPR_TPC	<illegal instruction>
	setx	data_start_2, %g1, %r20
	setx	0xc9042eb3000019dd, %g1, %r10
	.word 0x819a8000  ! 780: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0x8395e1f0  ! 781: WRPR_TNPC_I	wrpr	%r23, 0x01f0, %tnpc
	.word 0xb3e4e1fc  ! 782: SAVE_I	save	%r19, 0x0001, %r25
	.word 0xb7e5e1b0  ! 784: SAVE_I	save	%r23, 0x0001, %r27
	.word 0xbfe4205c  ! 788: SAVE_I	save	%r16, 0x0001, %r31
	.word 0xbbe4e172  ! 789: SAVE_I	save	%r19, 0x0001, %r29
	.word 0xb5e5a1d9  ! 791: SAVE_I	save	%r22, 0x0001, %r26
	.word 0xbcc460b0  ! 792: ADDCcc_I	addccc 	%r17, 0x00b0, %r30
hwintr_0_36:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_36), 16, 16)) -> intp(0, 0, 1e)
	setx	0x6b70731a0000ad9b, %g1, %r10
	.word 0x839a8000  ! 794: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb9e42118  ! 795: SAVE_I	save	%r16, 0x0001, %r28
	.word 0xbbe4e1c1  ! 800: SAVE_I	save	%r19, 0x0001, %r29
	.word 0xbb480000  ! 804: RDHPR_HPSTATE	rdhpr	%hpstate, %r29
	.word 0xb9e4e1a0  ! 805: SAVE_I	save	%r19, 0x0001, %r28
	.word 0xbbe5e077  ! 810: SAVE_I	save	%r23, 0x0001, %r29
	.word 0xbbe4a156  ! 811: SAVE_I	save	%r18, 0x0001, %r29
hwintr_0_37:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_37), 16, 16)) -> intp(0, 0, 4)
	.word 0xbd510000  ! 816: RDPR_TICK	<illegal instruction>
	.word 0xb3e4e110  ! 819: SAVE_I	save	%r19, 0x0001, %r25
hwintr_0_38:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_38), 16, 16)) -> intp(0, 0, f)
	.word 0xbde5e117  ! 823: SAVE_I	save	%r23, 0x0001, %r30
	.word 0xbbe560ad  ! 824: SAVE_I	save	%r21, 0x0001, %r29
	.word 0xbde420b8  ! 825: SAVE_I	save	%r16, 0x0001, %r30
hwintr_0_39:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_39), 16, 16)) -> intp(0, 0, 1f)
	.word 0xbd2d4000  ! 829: SLL_R	sll 	%r21, %r0, %r30
	.word 0xb9e460cd  ! 830: SAVE_I	save	%r17, 0x0001, %r28
	.word 0xbbe52111  ! 831: SAVE_I	save	%r20, 0x0001, %r29
	.word 0xb9e4617f  ! 832: SAVE_I	save	%r17, 0x0001, %r28
	.word 0xb7e560d4  ! 834: SAVE_I	save	%r21, 0x0001, %r27
	setx	data_start_6, %g1, %r20
	.word 0xb62ca18e  ! 842: ANDN_I	andn 	%r18, 0x018e, %r27
	.word 0xb3e5601b  ! 845: SAVE_I	save	%r21, 0x0001, %r25
	.word 0x899520cb  ! 850: WRPR_TICK_I	wrpr	%r20, 0x00cb, %tick
	.word 0xb5e52010  ! 851: SAVE_I	save	%r20, 0x0001, %r26
	.word 0xb2b5c000  ! 853: SUBCcc_R	orncc 	%r23, %r0, %r25
	.word 0xb7e4e023  ! 854: SAVE_I	save	%r19, 0x0001, %r27
	.word 0xbfe42156  ! 855: SAVE_I	save	%r16, 0x0001, %r31
	.word 0xb1e4a044  ! 868: SAVE_I	save	%r18, 0x0001, %r24
	.word 0xb5e421c3  ! 872: SAVE_I	save	%r16, 0x0001, %r26
	.word 0x89946123  ! 873: WRPR_TICK_I	wrpr	%r17, 0x0123, %tick
	.word 0xbfe5219a  ! 879: SAVE_I	save	%r20, 0x0001, %r31
hwintr_0_40:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_40), 16, 16)) -> intp(0, 0, 3e)
	.word 0xbfe56063  ! 883: SAVE_I	save	%r21, 0x0001, %r31
	.word 0xbfe5a179  ! 887: SAVE_I	save	%r22, 0x0001, %r31
	.word 0xb1e5a1c0  ! 892: SAVE_I	save	%r22, 0x0001, %r24
	.word 0xb1e46168  ! 893: SAVE_I	save	%r17, 0x0001, %r24
	.word 0xb7e521e7  ! 895: SAVE_I	save	%r20, 0x0001, %r27
hwintr_0_41:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_41), 16, 16)) -> intp(0, 0, 17)
	.word 0xb0ada1a1  ! 902: ANDNcc_I	andncc 	%r22, 0x01a1, %r24
	setx	0x90d1e53a0000ad80, %g1, %r10
	.word 0x819a8000  ! 910: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xb5e5e1b5  ! 914: SAVE_I	save	%r23, 0x0001, %r26
	.word 0xbde5e0e8  ! 920: SAVE_I	save	%r23, 0x0001, %r30
	.word 0x87952193  ! 921: WRPR_TT_I	wrpr	%r20, 0x0193, %tt
	.word 0xb1e52161  ! 930: SAVE_I	save	%r20, 0x0001, %r24
	.word 0xb3e46142  ! 932: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xb3e520fc  ! 936: SAVE_I	save	%r20, 0x0001, %r25
	.word 0xb6048000  ! 939: ADD_R	add 	%r18, %r0, %r27
	setx	data_start_2, %g1, %r23
	.word 0xbd51c000  ! 942: RDPR_TL	<illegal instruction>
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xbb51c000  ! 944: RDPR_TL	<illegal instruction>
	.word 0xb5e5a18c  ! 946: SAVE_I	save	%r22, 0x0001, %r26
	.word 0xbde521c2  ! 949: SAVE_I	save	%r20, 0x0001, %r30
	setx	0x3050271800007c4a, %g1, %r10
	.word 0x819a8000  ! 954: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xb7e520d1  ! 956: SAVE_I	save	%r20, 0x0001, %r27
	.word 0xb1520000  ! 964: RDPR_PIL	<illegal instruction>
	.word 0xb1e5e1f2  ! 965: SAVE_I	save	%r23, 0x0001, %r24
	.word 0xbfe4e19d  ! 966: SAVE_I	save	%r19, 0x0001, %r31
	.word 0xb150c000  ! 971: RDPR_TT	<illegal instruction>
	.word 0xb43de16a  ! 972: XNOR_I	xnor 	%r23, 0x016a, %r26
	.word 0xb0252058  ! 974: SUB_I	sub 	%r20, 0x0058, %r24
	.word 0xb1e460da  ! 981: SAVE_I	save	%r17, 0x0001, %r24
	.word 0xb82c6009  ! 982: ANDN_I	andn 	%r17, 0x0009, %r28
	.word 0xbf50c000  ! 984: RDPR_TT	<illegal instruction>
	.word 0xbfe4608e  ! 985: SAVE_I	save	%r17, 0x0001, %r31
	.word 0xb3e5e00e  ! 986: SAVE_I	save	%r23, 0x0001, %r25
hwintr_0_42:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_42), 16, 16)) -> intp(0, 0, 20)
	.word 0xb5e42023  ! 995: SAVE_I	save	%r16, 0x0001, %r26
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
	.word 0xfe2c0000  ! 1: STB_R	stb	%r31, [%r16 + %r0]
	.word 0xf73c4000  ! 4: STDF_R	std	%f27, [%r0, %r17]
	.word 0x89956088  ! 7: WRPR_TICK_I	wrpr	%r21, 0x0088, %tick
hwintr_3_0:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_0), 16, 16)) -> intp(3, 0, 1b)
	.word 0xb83d604e  ! 9: XNOR_I	xnor 	%r21, 0x004e, %r28
	.word 0xf6258000  ! 15: STW_R	stw	%r27, [%r22 + %r0]
	.word 0x9194200f  ! 17: WRPR_PIL_I	wrpr	%r16, 0x000f, %pil
	.word 0xf62dc000  ! 18: STB_R	stb	%r27, [%r23 + %r0]
	.word 0xfc3dc000  ! 20: STD_R	std	%r30, [%r23 + %r0]
	.word 0xf83561b1  ! 21: STH_I	sth	%r28, [%r21 + 0x01b1]
hwintr_3_1:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_1), 16, 16)) -> intp(3, 0, 9)
	.word 0xb52c4000  ! 23: SLL_R	sll 	%r17, %r0, %r26
	setx	0x20f7bae500005d8f, %g1, %r10
	.word 0x819a8000  ! 24: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xfe258000  ! 30: STW_R	stw	%r31, [%r22 + %r0]
	.word 0xf93dc000  ! 32: STDF_R	std	%f28, [%r0, %r23]
	.word 0xf434216a  ! 33: STH_I	sth	%r26, [%r16 + 0x016a]
hwintr_3_2:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_2), 16, 16)) -> intp(3, 0, 2e)
	.word 0xf275a1ac  ! 39: STX_I	stx	%r25, [%r22 + 0x01ac]
	.word 0xfc250000  ! 43: STW_R	stw	%r30, [%r20 + %r0]
hwintr_3_3:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_3), 16, 16)) -> intp(3, 0, 1f)
	.word 0xbf500000  ! 49: RDPR_TPC	rdpr	%tpc, %r31
	.word 0xf0742062  ! 50: STX_I	stx	%r24, [%r16 + 0x0062]
	.word 0xb1504000  ! 51: RDPR_TNPC	<illegal instruction>
	.word 0xf63d219e  ! 53: STD_I	std	%r27, [%r20 + 0x019e]
	.word 0xf13c0000  ! 54: STDF_R	std	%f24, [%r0, %r16]
	.word 0xfd3ce16c  ! 56: STDF_I	std	%f30, [0x016c, %r19]
	.word 0xfe254000  ! 57: STW_R	stw	%r31, [%r21 + %r0]
	.word 0x8194a121  ! 58: WRPR_TPC_I	wrpr	%r18, 0x0121, %tpc
	.word 0xfc3c0000  ! 61: STD_R	std	%r30, [%r16 + %r0]
	.word 0xb7520000  ! 62: RDPR_PIL	rdpr	%pil, %r27
hwintr_3_4:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_4), 16, 16)) -> intp(3, 0, 37)
	.word 0xfe74e0e0  ! 65: STX_I	stx	%r31, [%r19 + 0x00e0]
hwintr_3_5:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_5), 16, 16)) -> intp(3, 0, 3b)
	.word 0x919461f9  ! 68: WRPR_PIL_I	wrpr	%r17, 0x01f9, %pil
	.word 0xf2254000  ! 70: STW_R	stw	%r25, [%r21 + %r0]
	.word 0xfa25e0dc  ! 73: STW_I	stw	%r29, [%r23 + 0x00dc]
	.word 0xf42c0000  ! 74: STB_R	stb	%r26, [%r16 + %r0]
	.word 0xbb51c000  ! 81: RDPR_TL	rdpr	%tl, %r29
	.word 0xfe74c000  ! 83: STX_R	stx	%r31, [%r19 + %r0]
	.word 0xf62d0000  ! 87: STB_R	stb	%r27, [%r20 + %r0]
	setx	data_start_1, %g1, %r17
	.word 0xb950c000  ! 91: RDPR_TT	<illegal instruction>
	.word 0xf93cc000  ! 92: STDF_R	std	%f28, [%r0, %r19]
	.word 0xbf500000  ! 95: RDPR_TPC	<illegal instruction>
hwintr_3_6:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_6), 16, 16)) -> intp(3, 0, 1f)
	.word 0xb204c000  ! 98: ADD_R	add 	%r19, %r0, %r25
	.word 0xf22d0000  ! 99: STB_R	stb	%r25, [%r20 + %r0]
hwintr_3_7:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_7), 16, 16)) -> intp(3, 0, 38)
	setx	data_start_1, %g1, %r17
	.word 0xb03de08c  ! 116: XNOR_I	xnor 	%r23, 0x008c, %r24
	.word 0x8794216e  ! 117: WRPR_TT_I	wrpr	%r16, 0x016e, %tt
	setx	0x626868e40000f983, %g1, %r10
	.word 0x819a8000  ! 119: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xfb3c20be  ! 125: STDF_I	std	%f29, [0x00be, %r16]
hwintr_3_8:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_8), 16, 16)) -> intp(3, 0, 14)
	.word 0xb5510000  ! 127: RDPR_TICK	rdpr	%tick, %r26
	setx	data_start_6, %g1, %r23
	.word 0xf62c8000  ! 130: STB_R	stb	%r27, [%r18 + %r0]
	.word 0xf025a179  ! 133: STW_I	stw	%r24, [%r22 + 0x0179]
	.word 0xbb480000  ! 138: RDHPR_HPSTATE	rdhpr	%hpstate, %r29
hwintr_3_9:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_9), 16, 16)) -> intp(3, 0, 3c)
	.word 0x8994203b  ! 147: WRPR_TICK_I	wrpr	%r16, 0x003b, %tick
	.word 0xf33c0000  ! 150: STDF_R	std	%f25, [%r0, %r16]
	.word 0x87952013  ! 152: WRPR_TT_I	wrpr	%r20, 0x0013, %tt
	.word 0xf235c000  ! 155: STH_R	sth	%r25, [%r23 + %r0]
	.word 0xf0244000  ! 156: STW_R	stw	%r24, [%r17 + %r0]
hwintr_3_10:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_10), 16, 16)) -> intp(3, 0, 5)
	setx	data_start_1, %g1, %r22
hwintr_3_11:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_11), 16, 16)) -> intp(3, 0, 10)
	.word 0xfa758000  ! 166: STX_R	stx	%r29, [%r22 + %r0]
	mov	2, %r12
	.word 0x8f930000  ! 167: WRPR_TL_R	wrpr	%r12, %r0, %tl
hwintr_3_12:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_12), 16, 16)) -> intp(3, 0, 32)
	.word 0xb5510000  ! 169: RDPR_TICK	rdpr	%tick, %r26
	.word 0xfa3d61d2  ! 170: STD_I	std	%r29, [%r21 + 0x01d2]
	.word 0x8d95e025  ! 172: WRPR_PSTATE_I	wrpr	%r23, 0x0025, %pstate
	.word 0x859521bd  ! 182: WRPR_TSTATE_I	wrpr	%r20, 0x01bd, %tstate
	.word 0xf73de008  ! 187: STDF_I	std	%f27, [0x0008, %r23]
	.word 0x81952023  ! 191: WRPR_TPC_I	wrpr	%r20, 0x0023, %tpc
	.word 0xb7480000  ! 193: RDHPR_HPSTATE	rdhpr	%hpstate, %r27
	.word 0xb351c000  ! 196: RDPR_TL	<illegal instruction>
	.word 0xbd480000  ! 197: RDHPR_HPSTATE	rdhpr	%hpstate, %r30
	.word 0xf02d6100  ! 198: STB_I	stb	%r24, [%r21 + 0x0100]
	.word 0xf2340000  ! 199: STH_R	sth	%r25, [%r16 + %r0]
	.word 0xb351c000  ! 201: RDPR_TL	<illegal instruction>
	mov	2, %r12
	.word 0xa1930000  ! 202: WRPR_GL_R	wrpr	%r12, %r0, %-
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb6946086  ! 205: ORcc_I	orcc 	%r17, 0x0086, %r27
	.word 0xb751c000  ! 210: RDPR_TL	rdpr	%tl, %r27
	.word 0xb3518000  ! 214: RDPR_PSTATE	<illegal instruction>
	.word 0xf424213f  ! 215: STW_I	stw	%r26, [%r16 + 0x013f]
	.word 0xf2244000  ! 217: STW_R	stw	%r25, [%r17 + %r0]
	.word 0xfd3c4000  ! 221: STDF_R	std	%f30, [%r0, %r17]
	.word 0xbb50c000  ! 222: RDPR_TT	<illegal instruction>
	.word 0xf82de1e4  ! 223: STB_I	stb	%r28, [%r23 + 0x01e4]
	.word 0xfd3cc000  ! 224: STDF_R	std	%f30, [%r0, %r19]
	.word 0xfa250000  ! 225: STW_R	stw	%r29, [%r20 + %r0]
	.word 0xbf2db001  ! 226: SLLX_I	sllx	%r22, 0x0001, %r31
	.word 0xb6842032  ! 230: ADDcc_I	addcc 	%r16, 0x0032, %r27
	.word 0xfb3de13e  ! 232: STDF_I	std	%f29, [0x013e, %r23]
	.word 0xf6758000  ! 233: STX_R	stx	%r27, [%r22 + %r0]
hwintr_3_13:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_13), 16, 16)) -> intp(3, 0, 38)
	.word 0xf02c61ca  ! 237: STB_I	stb	%r24, [%r17 + 0x01ca]
	.word 0xf43d4000  ! 238: STD_R	std	%r26, [%r21 + %r0]
	.word 0xf234e02e  ! 239: STH_I	sth	%r25, [%r19 + 0x002e]
	.word 0x9194e067  ! 240: WRPR_PIL_I	wrpr	%r19, 0x0067, %pil
	.word 0xb0b42133  ! 241: ORNcc_I	orncc 	%r16, 0x0133, %r24
	setx	0x71e0e6f50000af5b, %g1, %r10
	.word 0x839a8000  ! 244: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xbb540000  ! 248: RDPR_GL	rdpr	%-, %r29
	.word 0xb4b58000  ! 249: ORNcc_R	orncc 	%r22, %r0, %r26
	.word 0xb6bda1c0  ! 252: XNORcc_I	xnorcc 	%r22, 0x01c0, %r27
	.word 0xb49de0f1  ! 255: XORcc_I	xorcc 	%r23, 0x00f1, %r26
	.word 0xfe2461c0  ! 257: STW_I	stw	%r31, [%r17 + 0x01c0]
	.word 0xfa2ce05e  ! 264: STB_I	stb	%r29, [%r19 + 0x005e]
	.word 0xb6854000  ! 274: ADDcc_R	addcc 	%r21, %r0, %r27
	.word 0xfe35e1a5  ! 275: STH_I	sth	%r31, [%r23 + 0x01a5]
	.word 0xf82c0000  ! 276: STB_R	stb	%r28, [%r16 + %r0]
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
hwintr_3_14:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_14), 16, 16)) -> intp(3, 0, 14)
	mov	2, %r12
	.word 0x8f930000  ! 284: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xfe35e054  ! 286: STH_I	sth	%r31, [%r23 + 0x0054]
hwintr_3_15:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_15), 16, 16)) -> intp(3, 0, 3)
	.word 0xfa3c6105  ! 288: STD_I	std	%r29, [%r17 + 0x0105]
	.word 0xfa344000  ! 290: STH_R	sth	%r29, [%r17 + %r0]
	.word 0xfe3d60cb  ! 293: STD_I	std	%r31, [%r21 + 0x00cb]
	.word 0xf13c20ac  ! 297: STDF_I	std	%f24, [0x00ac, %r16]
hwintr_3_16:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_16), 16, 16)) -> intp(3, 0, 35)
	.word 0xf03d4000  ! 300: STD_R	std	%r24, [%r21 + %r0]
	.word 0x859420f6  ! 301: WRPR_TSTATE_I	wrpr	%r16, 0x00f6, %tstate
hwintr_3_17:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_17), 16, 16)) -> intp(3, 0, 14)
	.word 0x899520c6  ! 305: WRPR_TICK_I	wrpr	%r20, 0x00c6, %tick
	.word 0xb60c8000  ! 308: AND_R	and 	%r18, %r0, %r27
	.word 0xbd3c4000  ! 311: SRA_R	sra 	%r17, %r0, %r30
	setx	0x615b16840000db58, %g1, %r10
	.word 0x839a8000  ! 312: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xbb3c6001  ! 313: SRA_I	sra 	%r17, 0x0001, %r29
	.word 0xfd3ce161  ! 315: STDF_I	std	%f30, [0x0161, %r19]
	.word 0xfc2c4000  ! 318: STB_R	stb	%r30, [%r17 + %r0]
	.word 0xf8256183  ! 324: STW_I	stw	%r28, [%r21 + 0x0183]
	.word 0xb2bca0a2  ! 326: XNORcc_I	xnorcc 	%r18, 0x00a2, %r25
	.word 0xf0250000  ! 329: STW_R	stw	%r24, [%r20 + %r0]
	.word 0xb3520000  ! 334: RDPR_PIL	rdpr	%pil, %r25
	.word 0xfa758000  ! 335: STX_R	stx	%r29, [%r22 + %r0]
	.word 0xfd3c4000  ! 336: STDF_R	std	%f30, [%r0, %r17]
	.word 0xfc34c000  ! 338: STH_R	sth	%r30, [%r19 + %r0]
	.word 0xb9520000  ! 339: RDPR_PIL	<illegal instruction>
	.word 0xb294a06f  ! 341: ORcc_I	orcc 	%r18, 0x006f, %r25
	.word 0xf73c4000  ! 342: STDF_R	std	%f27, [%r0, %r17]
	.word 0xf43ce0d3  ! 344: STD_I	std	%r26, [%r19 + 0x00d3]
	.word 0xb2c58000  ! 345: ADDCcc_R	addccc 	%r22, %r0, %r25
	mov	2, %r12
	.word 0xa1930000  ! 350: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb7510000  ! 356: RDPR_TICK	rdpr	%tick, %r27
hwintr_3_18:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_18), 16, 16)) -> intp(3, 0, 8)
	.word 0xf03cc000  ! 359: STD_R	std	%r24, [%r19 + %r0]
hwintr_3_19:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_19), 16, 16)) -> intp(3, 0, 1a)
	.word 0xf63ca128  ! 363: STD_I	std	%r27, [%r18 + 0x0128]
	.word 0x8d94a145  ! 364: WRPR_PSTATE_I	wrpr	%r18, 0x0145, %pstate
	.word 0xfc750000  ! 365: STX_R	stx	%r30, [%r20 + %r0]
	.word 0xfc25c000  ! 368: STW_R	stw	%r30, [%r23 + %r0]
	.word 0xf22de076  ! 369: STB_I	stb	%r25, [%r23 + 0x0076]
	.word 0xb424c000  ! 370: SUB_R	sub 	%r19, %r0, %r26
hwintr_3_20:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_20), 16, 16)) -> intp(3, 0, e)
	.word 0x8395e166  ! 375: WRPR_TNPC_I	wrpr	%r23, 0x0166, %tnpc
hwintr_3_21:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_21), 16, 16)) -> intp(3, 0, 29)
	.word 0xbe954000  ! 378: ORcc_R	orcc 	%r21, %r0, %r31
hwintr_3_22:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_22), 16, 16)) -> intp(3, 0, 1f)
	.word 0xfa3d6012  ! 382: STD_I	std	%r29, [%r21 + 0x0012]
	.word 0xfb3c6115  ! 384: STDF_I	std	%f29, [0x0115, %r17]
	.word 0xfe246057  ! 386: STW_I	stw	%r31, [%r17 + 0x0057]
hwintr_3_23:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_23), 16, 16)) -> intp(3, 0, 33)
	.word 0xb3540000  ! 390: RDPR_GL	rdpr	%-, %r25
	setx	data_start_3, %g1, %r21
	setx	0x84c39a100000fc1a, %g1, %r10
	.word 0x839a8000  ! 394: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xf82de061  ! 396: STB_I	stb	%r28, [%r23 + 0x0061]
	.word 0xf2348000  ! 399: STH_R	sth	%r25, [%r18 + %r0]
	.word 0xb7518000  ! 402: RDPR_PSTATE	rdpr	%pstate, %r27
	.word 0xff3c4000  ! 405: STDF_R	std	%f31, [%r0, %r17]
	.word 0xfe3cc000  ! 412: STD_R	std	%r31, [%r19 + %r0]
	.word 0xb0154000  ! 413: OR_R	or 	%r21, %r0, %r24
	mov	1, %r12
	.word 0xa1930000  ! 414: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xf474a0ab  ! 418: STX_I	stx	%r26, [%r18 + 0x00ab]
	.word 0xb7540000  ! 420: RDPR_GL	rdpr	%-, %r27
	.word 0xbd3c6001  ! 423: SRA_I	sra 	%r17, 0x0001, %r30
	.word 0xf82d201f  ! 424: STB_I	stb	%r28, [%r20 + 0x001f]
	.word 0xb3500000  ! 425: RDPR_TPC	<illegal instruction>
hwintr_3_24:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_24), 16, 16)) -> intp(3, 0, 2d)
	.word 0xb350c000  ! 434: RDPR_TT	<illegal instruction>
	setx	data_start_2, %g1, %r22
hwintr_3_25:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_25), 16, 16)) -> intp(3, 0, 37)
	.word 0x899521dc  ! 447: WRPR_TICK_I	wrpr	%r20, 0x01dc, %tick
	.word 0xf635e0cf  ! 449: STH_I	sth	%r27, [%r23 + 0x00cf]
	.word 0x8d95a0c9  ! 451: WRPR_PSTATE_I	wrpr	%r22, 0x00c9, %pstate
	.word 0xf63c4000  ! 454: STD_R	std	%r27, [%r17 + %r0]
	.word 0xfe34e08f  ! 456: STH_I	sth	%r31, [%r19 + 0x008f]
	.word 0xb3540000  ! 458: RDPR_GL	rdpr	%-, %r25
	.word 0xf2758000  ! 463: STX_R	stx	%r25, [%r22 + %r0]
	.word 0xfc3c8000  ! 466: STD_R	std	%r30, [%r18 + %r0]
	.word 0xff3da1fa  ! 467: STDF_I	std	%f31, [0x01fa, %r22]
	.word 0x839561fb  ! 476: WRPR_TNPC_I	wrpr	%r21, 0x01fb, %tnpc
	.word 0xf6744000  ! 478: STX_R	stx	%r27, [%r17 + %r0]
	.word 0xf034a0eb  ! 480: STH_I	sth	%r24, [%r18 + 0x00eb]
	.word 0xfc740000  ! 493: STX_R	stx	%r30, [%r16 + %r0]
	.word 0xfe350000  ! 496: STH_R	sth	%r31, [%r20 + %r0]
	.word 0xf83da0ba  ! 497: STD_I	std	%r28, [%r22 + 0x00ba]
	.word 0xf4258000  ! 498: STW_R	stw	%r26, [%r22 + %r0]
	.word 0xf035a045  ! 499: STH_I	sth	%r24, [%r22 + 0x0045]
	.word 0xf2258000  ! 500: STW_R	stw	%r25, [%r22 + %r0]
	.word 0xbf504000  ! 506: RDPR_TNPC	rdpr	%tnpc, %r31
	setx	0xd45051b50000f956, %g1, %r10
	.word 0x839a8000  ! 511: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xbabd0000  ! 515: XNORcc_R	xnorcc 	%r20, %r0, %r29
	.word 0xf82d21af  ! 517: STB_I	stb	%r28, [%r20 + 0x01af]
	.word 0x9195a115  ! 521: WRPR_PIL_I	wrpr	%r22, 0x0115, %pil
	.word 0xf0742097  ! 523: STX_I	stx	%r24, [%r16 + 0x0097]
	.word 0x8195e19b  ! 525: WRPR_TPC_I	wrpr	%r23, 0x019b, %tpc
	.word 0xf13ce028  ! 526: STDF_I	std	%f24, [0x0028, %r19]
	setx	data_start_0, %g1, %r17
	.word 0xf82da076  ! 530: STB_I	stb	%r28, [%r22 + 0x0076]
	.word 0xb0250000  ! 531: SUB_R	sub 	%r20, %r0, %r24
	setx	data_start_4, %g1, %r22
	.word 0x89942084  ! 535: WRPR_TICK_I	wrpr	%r16, 0x0084, %tick
	.word 0xf074a018  ! 537: STX_I	stx	%r24, [%r18 + 0x0018]
	.word 0xf42cc000  ! 541: STB_R	stb	%r26, [%r19 + %r0]
	setx	data_start_0, %g1, %r20
	.word 0xb1518000  ! 549: RDPR_PSTATE	rdpr	%pstate, %r24
	.word 0xfc354000  ! 550: STH_R	sth	%r30, [%r21 + %r0]
	.word 0xf6340000  ! 551: STH_R	sth	%r27, [%r16 + %r0]
	.word 0xb6a56109  ! 552: SUBcc_I	subcc 	%r21, 0x0109, %r27
hwintr_3_26:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_26), 16, 16)) -> intp(3, 0, 38)
	.word 0xbd500000  ! 556: RDPR_TPC	<illegal instruction>
	.word 0xf13da0a1  ! 559: STDF_I	std	%f24, [0x00a1, %r22]
hwintr_3_27:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_27), 16, 16)) -> intp(3, 0, 26)
	.word 0xfe748000  ! 562: STX_R	stx	%r31, [%r18 + %r0]
	setx	data_start_7, %g1, %r16
	.word 0xb1520000  ! 566: RDPR_PIL	<illegal instruction>
hwintr_3_28:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_28), 16, 16)) -> intp(3, 0, d)
	.word 0xb551c000  ! 569: RDPR_TL	<illegal instruction>
	.word 0xfe354000  ! 571: STH_R	sth	%r31, [%r21 + %r0]
	.word 0xf8744000  ! 577: STX_R	stx	%r28, [%r17 + %r0]
	.word 0xf53c61f5  ! 579: STDF_I	std	%f26, [0x01f5, %r17]
	.word 0xb7520000  ! 581: RDPR_PIL	<illegal instruction>
	.word 0xf63ca165  ! 582: STD_I	std	%r27, [%r18 + 0x0165]
	.word 0xf83d6062  ! 583: STD_I	std	%r28, [%r21 + 0x0062]
	.word 0xf434e01f  ! 584: STH_I	sth	%r26, [%r19 + 0x001f]
	.word 0xf83d0000  ! 586: STD_R	std	%r28, [%r20 + %r0]
hwintr_3_29:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_29), 16, 16)) -> intp(3, 0, 34)
	.word 0xf0340000  ! 591: STH_R	sth	%r24, [%r16 + %r0]
	setx	0xc76bee5b0000c91d, %g1, %r10
	.word 0x839a8000  ! 592: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xfc34a058  ! 593: STH_I	sth	%r30, [%r18 + 0x0058]
	.word 0xf03ca048  ! 594: STD_I	std	%r24, [%r18 + 0x0048]
	.word 0xba45a1a0  ! 596: ADDC_I	addc 	%r22, 0x01a0, %r29
	.word 0xfe3c8000  ! 597: STD_R	std	%r31, [%r18 + %r0]
	.word 0xbe342129  ! 598: ORN_I	orn 	%r16, 0x0129, %r31
	.word 0xf0752063  ! 601: STX_I	stx	%r24, [%r20 + 0x0063]
	.word 0xb32d8000  ! 602: SLL_R	sll 	%r22, %r0, %r25
	.word 0xf13d4000  ! 603: STDF_R	std	%f24, [%r0, %r21]
	setx	data_start_1, %g1, %r23
	.word 0x879520c9  ! 609: WRPR_TT_I	wrpr	%r20, 0x00c9, %tt
	.word 0xf2358000  ! 610: STH_R	sth	%r25, [%r22 + %r0]
	.word 0xb82d8000  ! 612: ANDN_R	andn 	%r22, %r0, %r28
	.word 0x8d95e0ca  ! 613: WRPR_PSTATE_I	wrpr	%r23, 0x00ca, %pstate
	.word 0xfa3de00e  ! 614: STD_I	std	%r29, [%r23 + 0x000e]
	.word 0xf434e0ed  ! 620: STH_I	sth	%r26, [%r19 + 0x00ed]
	.word 0xf0240000  ! 622: STW_R	stw	%r24, [%r16 + %r0]
	.word 0xb7518000  ! 623: RDPR_PSTATE	rdpr	%pstate, %r27
	.word 0xbc24c000  ! 632: SUB_R	sub 	%r19, %r0, %r30
	.word 0xbe354000  ! 634: SUBC_R	orn 	%r21, %r0, %r31
	.word 0xb9504000  ! 636: RDPR_TNPC	<illegal instruction>
	setx	0x4f3ac5ac00008dc4, %g1, %r10
	.word 0x819a8000  ! 639: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
hwintr_3_30:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_30), 16, 16)) -> intp(3, 0, 5)
	.word 0xfd3ca07c  ! 645: STDF_I	std	%f30, [0x007c, %r18]
	.word 0xbf504000  ! 647: RDPR_TNPC	rdpr	%tnpc, %r31
	setx	data_start_3, %g1, %r19
	.word 0xb1508000  ! 650: RDPR_TSTATE	<illegal instruction>
	.word 0xf0350000  ! 651: STH_R	sth	%r24, [%r20 + %r0]
	setx	0xde72e35e0000c846, %g1, %r10
	.word 0x819a8000  ! 652: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	setx	0x947146ef00002f07, %g1, %r10
	.word 0x839a8000  ! 653: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb73c2001  ! 656: SRA_I	sra 	%r16, 0x0001, %r27
	.word 0xf83c20cb  ! 658: STD_I	std	%r28, [%r16 + 0x00cb]
	.word 0xbf540000  ! 660: RDPR_GL	rdpr	%-, %r31
	.word 0xfa2420d5  ! 662: STW_I	stw	%r29, [%r16 + 0x00d5]
	.word 0xff3c612b  ! 663: STDF_I	std	%f31, [0x012b, %r17]
	.word 0xfa75a006  ! 664: STX_I	stx	%r29, [%r22 + 0x0006]
	.word 0xf82ce1c9  ! 668: STB_I	stb	%r28, [%r19 + 0x01c9]
	.word 0xf02de1e3  ! 670: STB_I	stb	%r24, [%r23 + 0x01e3]
	.word 0xf93d8000  ! 673: STDF_R	std	%f28, [%r0, %r22]
	.word 0xf83c2017  ! 678: STD_I	std	%r28, [%r16 + 0x0017]
	.word 0xf475e05a  ! 681: STX_I	stx	%r26, [%r23 + 0x005a]
	.word 0xb7510000  ! 683: RDPR_TICK	<illegal instruction>
	.word 0xf62c6111  ! 690: STB_I	stb	%r27, [%r17 + 0x0111]
	mov	1, %r12
	.word 0x8f930000  ! 698: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xfc24c000  ! 700: STW_R	stw	%r30, [%r19 + %r0]
	.word 0xb7518000  ! 702: RDPR_PSTATE	rdpr	%pstate, %r27
hwintr_3_31:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_31), 16, 16)) -> intp(3, 0, 35)
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xf02da069  ! 708: STB_I	stb	%r24, [%r22 + 0x0069]
	setx	0x1424aa30000dd1d, %g1, %r10
	.word 0x839a8000  ! 711: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xf0750000  ! 713: STX_R	stx	%r24, [%r20 + %r0]
	.word 0xfa3520be  ! 715: STH_I	sth	%r29, [%r20 + 0x00be]
	.word 0xb52d3001  ! 718: SLLX_I	sllx	%r20, 0x0001, %r26
	.word 0xf02521f6  ! 727: STW_I	stw	%r24, [%r20 + 0x01f6]
	.word 0x8795200c  ! 729: WRPR_TT_I	wrpr	%r20, 0x000c, %tt
	.word 0xf424601b  ! 730: STW_I	stw	%r26, [%r17 + 0x001b]
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb7480000  ! 734: RDHPR_HPSTATE	rdhpr	%hpstate, %r27
	.word 0xbd34d000  ! 735: SRLX_R	srlx	%r19, %r0, %r30
hwintr_3_32:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_32), 16, 16)) -> intp(3, 0, 15)
	.word 0xf4750000  ! 741: STX_R	stx	%r26, [%r20 + %r0]
hwintr_3_33:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_33), 16, 16)) -> intp(3, 0, 28)
	.word 0xbd510000  ! 745: RDPR_TICK	rdpr	%tick, %r30
	.word 0xf275a108  ! 746: STX_I	stx	%r25, [%r22 + 0x0108]
hwintr_3_34:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_34), 16, 16)) -> intp(3, 0, a)
	.word 0x8d94e169  ! 748: WRPR_PSTATE_I	wrpr	%r19, 0x0169, %pstate
	.word 0xf4344000  ! 749: STH_R	sth	%r26, [%r17 + %r0]
	.word 0xff3de020  ! 751: STDF_I	std	%f31, [0x0020, %r23]
	setx	data_start_1, %g1, %r20
	.word 0x8395a1c3  ! 757: WRPR_TNPC_I	wrpr	%r22, 0x01c3, %tnpc
	.word 0x9194a010  ! 758: WRPR_PIL_I	wrpr	%r18, 0x0010, %pil
hwintr_3_35:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_35), 16, 16)) -> intp(3, 0, 3f)
	.word 0xf53ce1ec  ! 762: STDF_I	std	%f26, [0x01ec, %r19]
	.word 0xf2254000  ! 763: STW_R	stw	%r25, [%r21 + %r0]
	.word 0xfe25c000  ! 765: STW_R	stw	%r31, [%r23 + %r0]
	.word 0xf225c000  ! 767: STW_R	stw	%r25, [%r23 + %r0]
	.word 0x8395a1fd  ! 768: WRPR_TNPC_I	wrpr	%r22, 0x01fd, %tnpc
	.word 0xfc746119  ! 772: STX_I	stx	%r30, [%r17 + 0x0119]
	.word 0xfa2d61c3  ! 773: STB_I	stb	%r29, [%r21 + 0x01c3]
	.word 0xf82da167  ! 774: STB_I	stb	%r28, [%r22 + 0x0167]
	.word 0xfe75e0e2  ! 775: STX_I	stx	%r31, [%r23 + 0x00e2]
	.word 0xf075a188  ! 777: STX_I	stx	%r24, [%r22 + 0x0188]
	.word 0xb5500000  ! 778: RDPR_TPC	rdpr	%tpc, %r26
	setx	data_start_3, %g1, %r20
	setx	0xa5bc216900007b0e, %g1, %r10
	.word 0x819a8000  ! 780: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0x8394e1a6  ! 781: WRPR_TNPC_I	wrpr	%r19, 0x01a6, %tnpc
	.word 0xf435210b  ! 783: STH_I	sth	%r26, [%r20 + 0x010b]
	.word 0xb2c4a183  ! 792: ADDCcc_I	addccc 	%r18, 0x0183, %r25
hwintr_3_36:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_36), 16, 16)) -> intp(3, 0, 11)
	setx	0xec27bc4e0000fa99, %g1, %r10
	.word 0x839a8000  ! 794: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xff3c2176  ! 797: STDF_I	std	%f31, [0x0176, %r16]
	.word 0xf83c20b0  ! 798: STD_I	std	%r28, [%r16 + 0x00b0]
	.word 0xb1480000  ! 804: RDHPR_HPSTATE	rdhpr	%hpstate, %r24
	.word 0xf62da0ed  ! 807: STB_I	stb	%r27, [%r22 + 0x00ed]
hwintr_3_37:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_37), 16, 16)) -> intp(3, 0, 22)
	.word 0xbb510000  ! 816: RDPR_TICK	<illegal instruction>
hwintr_3_38:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_38), 16, 16)) -> intp(3, 0, 26)
	.word 0xf8254000  ! 826: STW_R	stw	%r28, [%r21 + %r0]
hwintr_3_39:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_39), 16, 16)) -> intp(3, 0, 30)
	.word 0xb52c0000  ! 829: SLL_R	sll 	%r16, %r0, %r26
	.word 0xfc2de0f6  ! 833: STB_I	stb	%r30, [%r23 + 0x00f6]
	setx	data_start_1, %g1, %r22
	.word 0xf424e078  ! 837: STW_I	stw	%r26, [%r19 + 0x0078]
	.word 0xba2d207e  ! 842: ANDN_I	andn 	%r20, 0x007e, %r29
	.word 0xf82d4000  ! 843: STB_R	stb	%r28, [%r21 + %r0]
	.word 0xfa2d8000  ! 844: STB_R	stb	%r29, [%r22 + %r0]
	.word 0xf62d2047  ! 849: STB_I	stb	%r27, [%r20 + 0x0047]
	.word 0x899460d0  ! 850: WRPR_TICK_I	wrpr	%r17, 0x00d0, %tick
	.word 0xb6b44000  ! 853: SUBCcc_R	orncc 	%r17, %r0, %r27
	.word 0xf074c000  ! 857: STX_R	stx	%r24, [%r19 + %r0]
	.word 0xf274c000  ! 859: STX_R	stx	%r25, [%r19 + %r0]
	.word 0xf8340000  ! 860: STH_R	sth	%r28, [%r16 + %r0]
	.word 0xf025a1b9  ! 865: STW_I	stw	%r24, [%r22 + 0x01b9]
	.word 0xfa744000  ! 870: STX_R	stx	%r29, [%r17 + %r0]
	.word 0xfa3d4000  ! 871: STD_R	std	%r29, [%r21 + %r0]
	.word 0x8994e16a  ! 873: WRPR_TICK_I	wrpr	%r19, 0x016a, %tick
	.word 0xfa3c211f  ! 875: STD_I	std	%r29, [%r16 + 0x011f]
	.word 0xf075c000  ! 876: STX_R	stx	%r24, [%r23 + %r0]
	.word 0xfe2da122  ! 878: STB_I	stb	%r31, [%r22 + 0x0122]
	.word 0xfc2de0c0  ! 881: STB_I	stb	%r30, [%r23 + 0x00c0]
hwintr_3_40:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_40), 16, 16)) -> intp(3, 0, 28)
	.word 0xf425e105  ! 888: STW_I	stw	%r26, [%r23 + 0x0105]
	.word 0xf03c212c  ! 889: STD_I	std	%r24, [%r16 + 0x012c]
	.word 0xfa2de1ef  ! 890: STB_I	stb	%r29, [%r23 + 0x01ef]
	.word 0xf675a09c  ! 891: STX_I	stx	%r27, [%r22 + 0x009c]
hwintr_3_41:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_41), 16, 16)) -> intp(3, 0, 26)
	.word 0xbaada0ce  ! 902: ANDNcc_I	andncc 	%r22, 0x00ce, %r29
	setx	0x89e6190800002d52, %g1, %r10
	.word 0x819a8000  ! 910: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xf6358000  ! 911: STH_R	sth	%r27, [%r22 + %r0]
	.word 0xf8758000  ! 912: STX_R	stx	%r28, [%r22 + %r0]
	.word 0xf63d0000  ! 915: STD_R	std	%r27, [%r20 + %r0]
	.word 0xf22d0000  ! 918: STB_R	stb	%r25, [%r20 + %r0]
	.word 0xfb3c0000  ! 919: STDF_R	std	%f29, [%r0, %r16]
	.word 0x8795e1d0  ! 921: WRPR_TT_I	wrpr	%r23, 0x01d0, %tt
	.word 0xf27520a6  ! 925: STX_I	stx	%r25, [%r20 + 0x00a6]
	.word 0xfe248000  ! 926: STW_R	stw	%r31, [%r18 + %r0]
	.word 0xfa2c4000  ! 927: STB_R	stb	%r29, [%r17 + %r0]
	.word 0xf0340000  ! 928: STH_R	sth	%r24, [%r16 + %r0]
	.word 0xb4048000  ! 939: ADD_R	add 	%r18, %r0, %r26
	setx	data_start_1, %g1, %r20
	.word 0xbf51c000  ! 942: RDPR_TL	rdpr	%tl, %r31
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb551c000  ! 944: RDPR_TL	<illegal instruction>
	.word 0xf635a123  ! 948: STH_I	sth	%r27, [%r22 + 0x0123]
	.word 0xfe3d0000  ! 951: STD_R	std	%r31, [%r20 + %r0]
	setx	0x3e5ef7390000ff11, %g1, %r10
	.word 0x819a8000  ! 954: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xfc24a18a  ! 962: STW_I	stw	%r30, [%r18 + 0x018a]
	.word 0xf4346075  ! 963: STH_I	sth	%r26, [%r17 + 0x0075]
	.word 0xb9520000  ! 964: RDPR_PIL	rdpr	%pil, %r28
	.word 0xf035a0ad  ! 968: STH_I	sth	%r24, [%r22 + 0x00ad]
	.word 0xbb50c000  ! 971: RDPR_TT	<illegal instruction>
	.word 0xba3c617a  ! 972: XNOR_I	xnor 	%r17, 0x017a, %r29
	.word 0xf53d209e  ! 973: STDF_I	std	%f26, [0x009e, %r20]
	.word 0xb62520b9  ! 974: SUB_I	sub 	%r20, 0x00b9, %r27
	.word 0xf13d60e2  ! 976: STDF_I	std	%f24, [0x00e2, %r21]
	.word 0xf675e01c  ! 978: STX_I	stx	%r27, [%r23 + 0x001c]
	.word 0xba2d217a  ! 982: ANDN_I	andn 	%r20, 0x017a, %r29
	.word 0xbb50c000  ! 984: RDPR_TT	<illegal instruction>
	.word 0xfa3d61a5  ! 987: STD_I	std	%r29, [%r21 + 0x01a5]
hwintr_3_42:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_42), 16, 16)) -> intp(3, 0, 28)
	.word 0xfa35216d  ! 994: STH_I	sth	%r29, [%r20 + 0x016d]
	.word 0xf03d2149  ! 996: STD_I	std	%r24, [%r20 + 0x0149]
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
	.word 0x8995a0e4  ! 7: WRPR_TICK_I	wrpr	%r22, 0x00e4, %tick
hwintr_2_0:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_0), 16, 16)) -> intp(2, 0, f)
	.word 0xb23d613f  ! 9: XNOR_I	xnor 	%r21, 0x013f, %r25
	.word 0xf815e055  ! 10: LDUH_I	lduh	[%r23 + 0x0055], %r28
	.word 0xf0450000  ! 14: LDSW_R	ldsw	[%r20 + %r0], %r24
	.word 0x9194a1e9  ! 17: WRPR_PIL_I	wrpr	%r18, 0x01e9, %pil
hwintr_2_1:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_1), 16, 16)) -> intp(2, 0, c)
	.word 0xb72d8000  ! 23: SLL_R	sll 	%r22, %r0, %r27
	setx	0xffba312500008f14, %g1, %r10
	.word 0x819a8000  ! 24: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xfe0d4000  ! 25: LDUB_R	ldub	[%r21 + %r0], %r31
	.word 0xf6544000  ! 27: LDSH_R	ldsh	[%r17 + %r0], %r27
	.word 0xfa1c2137  ! 29: LDD_I	ldd	[%r16 + 0x0137], %r29
	.word 0xf41d20a1  ! 31: LDD_I	ldd	[%r20 + 0x00a1], %r26
hwintr_2_2:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_2), 16, 16)) -> intp(2, 0, 3)
	.word 0xf2540000  ! 36: LDSH_R	ldsh	[%r16 + %r0], %r25
hwintr_2_3:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_3), 16, 16)) -> intp(2, 0, 3a)
	.word 0xbb500000  ! 49: RDPR_TPC	rdpr	%tpc, %r29
	.word 0xbf504000  ! 51: RDPR_TNPC	<illegal instruction>
	.word 0xfa4c8000  ! 52: LDSB_R	ldsb	[%r18 + %r0], %r29
	.word 0x819420c6  ! 58: WRPR_TPC_I	wrpr	%r16, 0x00c6, %tpc
	.word 0xb1520000  ! 62: RDPR_PIL	<illegal instruction>
hwintr_2_4:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_4), 16, 16)) -> intp(2, 0, 8)
hwintr_2_5:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_5), 16, 16)) -> intp(2, 0, 28)
	.word 0x9194a1f5  ! 68: WRPR_PIL_I	wrpr	%r18, 0x01f5, %pil
	.word 0xf4054000  ! 69: LDUW_R	lduw	[%r21 + %r0], %r26
	.word 0xfa15a10f  ! 76: LDUH_I	lduh	[%r22 + 0x010f], %r29
	.word 0xfe14e0c4  ! 79: LDUH_I	lduh	[%r19 + 0x00c4], %r31
	.word 0xf51c4000  ! 80: LDDF_R	ldd	[%r17, %r0], %f26
	.word 0xb351c000  ! 81: RDPR_TL	<illegal instruction>
	.word 0xf404a147  ! 84: LDUW_I	lduw	[%r18 + 0x0147], %r26
	.word 0xfa4cc000  ! 85: LDSB_R	ldsb	[%r19 + %r0], %r29
	setx	data_start_3, %g1, %r19
	.word 0xfa5ca0c4  ! 89: LDX_I	ldx	[%r18 + 0x00c4], %r29
	.word 0xb750c000  ! 91: RDPR_TT	<illegal instruction>
	.word 0xfd1d0000  ! 93: LDDF_R	ldd	[%r20, %r0], %f30
	.word 0xfc55a1d2  ! 94: LDSH_I	ldsh	[%r22 + 0x01d2], %r30
	.word 0xb1500000  ! 95: RDPR_TPC	<illegal instruction>
hwintr_2_6:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_6), 16, 16)) -> intp(2, 0, 16)
	.word 0xb6050000  ! 98: ADD_R	add 	%r20, %r0, %r27
	.word 0xf84520cf  ! 101: LDSW_I	ldsw	[%r20 + 0x00cf], %r28
	.word 0xfa4ce097  ! 102: LDSB_I	ldsb	[%r19 + 0x0097], %r29
	.word 0xf01d0000  ! 103: LDD_R	ldd	[%r20 + %r0], %r24
	.word 0xfe4d0000  ! 104: LDSB_R	ldsb	[%r20 + %r0], %r31
	.word 0xf31d61f3  ! 105: LDDF_I	ldd	[%r21, 0x01f3], %f25
	.word 0xf6148000  ! 108: LDUH_R	lduh	[%r18 + %r0], %r27
	.word 0xf65d6004  ! 109: LDX_I	ldx	[%r21 + 0x0004], %r27
hwintr_2_7:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_7), 16, 16)) -> intp(2, 0, 1f)
	.word 0xfc1da134  ! 113: LDD_I	ldd	[%r22 + 0x0134], %r30
	.word 0xf61c8000  ! 114: LDD_R	ldd	[%r18 + %r0], %r27
	setx	data_start_4, %g1, %r16
	.word 0xb83d61ec  ! 116: XNOR_I	xnor 	%r21, 0x01ec, %r28
	.word 0x87942150  ! 117: WRPR_TT_I	wrpr	%r16, 0x0150, %tt
	setx	0x3fe750300006cc8, %g1, %r10
	.word 0x819a8000  ! 119: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
hwintr_2_8:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_8), 16, 16)) -> intp(2, 0, 29)
	.word 0xbf510000  ! 127: RDPR_TICK	<illegal instruction>
	setx	data_start_1, %g1, %r21
	.word 0xf4058000  ! 132: LDUW_R	lduw	[%r22 + %r0], %r26
	.word 0xfa0c2080  ! 135: LDUB_I	ldub	[%r16 + 0x0080], %r29
	.word 0xbb480000  ! 138: RDHPR_HPSTATE	rdhpr	%hpstate, %r29
	.word 0xf2048000  ! 140: LDUW_R	lduw	[%r18 + %r0], %r25
hwintr_2_9:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_9), 16, 16)) -> intp(2, 0, 17)
	.word 0xfa45e044  ! 144: LDSW_I	ldsw	[%r23 + 0x0044], %r29
	.word 0xfa0d0000  ! 146: LDUB_R	ldub	[%r20 + %r0], %r29
	.word 0x899560b3  ! 147: WRPR_TICK_I	wrpr	%r21, 0x00b3, %tick
	.word 0xf41d4000  ! 148: LDD_R	ldd	[%r21 + %r0], %r26
	.word 0xf00de199  ! 151: LDUB_I	ldub	[%r23 + 0x0199], %r24
	.word 0x8795a07a  ! 152: WRPR_TT_I	wrpr	%r22, 0x007a, %tt
hwintr_2_10:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_10), 16, 16)) -> intp(2, 0, 2a)
	.word 0xf11d8000  ! 161: LDDF_R	ldd	[%r22, %r0], %f24
	setx	data_start_0, %g1, %r18
hwintr_2_11:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_11), 16, 16)) -> intp(2, 0, 3c)
	mov	0, %r12
	.word 0x8f930000  ! 167: WRPR_TL_R	wrpr	%r12, %r0, %tl
hwintr_2_12:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_12), 16, 16)) -> intp(2, 0, 3f)
	.word 0xb7510000  ! 169: RDPR_TICK	<illegal instruction>
	.word 0x8d95e00d  ! 172: WRPR_PSTATE_I	wrpr	%r23, 0x000d, %pstate
	.word 0xf055a128  ! 173: LDSH_I	ldsh	[%r22 + 0x0128], %r24
	.word 0xfe5de1db  ! 177: LDX_I	ldx	[%r23 + 0x01db], %r31
	.word 0xfc05a129  ! 180: LDUW_I	lduw	[%r22 + 0x0129], %r30
	.word 0xfc14e13e  ! 181: LDUH_I	lduh	[%r19 + 0x013e], %r30
	.word 0x85952134  ! 182: WRPR_TSTATE_I	wrpr	%r20, 0x0134, %tstate
	.word 0xf04ce0ed  ! 184: LDSB_I	ldsb	[%r19 + 0x00ed], %r24
	.word 0xf61d0000  ! 189: LDD_R	ldd	[%r20 + %r0], %r27
	.word 0x81946113  ! 191: WRPR_TPC_I	wrpr	%r17, 0x0113, %tpc
	.word 0xb7480000  ! 193: RDHPR_HPSTATE	rdhpr	%hpstate, %r27
	.word 0xf31cc000  ! 195: LDDF_R	ldd	[%r19, %r0], %f25
	.word 0xb551c000  ! 196: RDPR_TL	<illegal instruction>
	.word 0xb3480000  ! 197: RDHPR_HPSTATE	rdhpr	%hpstate, %r25
	.word 0xb551c000  ! 201: RDPR_TL	<illegal instruction>
	mov	0, %r12
	.word 0xa1930000  ! 202: WRPR_GL_R	wrpr	%r12, %r0, %-
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb094a159  ! 205: ORcc_I	orcc 	%r18, 0x0159, %r24
	.word 0xf91ca0fd  ! 206: LDDF_I	ldd	[%r18, 0x00fd], %f28
	.word 0xfc550000  ! 208: LDSH_R	ldsh	[%r20 + %r0], %r30
	.word 0xf0558000  ! 209: LDSH_R	ldsh	[%r22 + %r0], %r24
	.word 0xb951c000  ! 210: RDPR_TL	<illegal instruction>
	.word 0xf245e0f6  ! 211: LDSW_I	ldsw	[%r23 + 0x00f6], %r25
	.word 0xf31d2033  ! 213: LDDF_I	ldd	[%r20, 0x0033], %f25
	.word 0xb3518000  ! 214: RDPR_PSTATE	<illegal instruction>
	.word 0xfb1de115  ! 219: LDDF_I	ldd	[%r23, 0x0115], %f29
	.word 0xf65d603e  ! 220: LDX_I	ldx	[%r21 + 0x003e], %r27
	.word 0xbd50c000  ! 222: RDPR_TT	<illegal instruction>
	.word 0xbb2df001  ! 226: SLLX_I	sllx	%r23, 0x0001, %r29
	.word 0xb684a16e  ! 230: ADDcc_I	addcc 	%r18, 0x016e, %r27
	.word 0xf455a0e6  ! 235: LDSH_I	ldsh	[%r22 + 0x00e6], %r26
hwintr_2_13:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_13), 16, 16)) -> intp(2, 0, 2b)
	.word 0x9194e10c  ! 240: WRPR_PIL_I	wrpr	%r19, 0x010c, %pil
	.word 0xb0b4e0ef  ! 241: ORNcc_I	orncc 	%r19, 0x00ef, %r24
	.word 0xfe54c000  ! 243: LDSH_R	ldsh	[%r19 + %r0], %r31
	setx	0x946a605f0000098f, %g1, %r10
	.word 0x839a8000  ! 244: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xf20ce175  ! 247: LDUB_I	ldub	[%r19 + 0x0175], %r25
	.word 0xbb540000  ! 248: RDPR_GL	<illegal instruction>
	.word 0xb0b4c000  ! 249: ORNcc_R	orncc 	%r19, %r0, %r24
	.word 0xfd1d8000  ! 251: LDDF_R	ldd	[%r22, %r0], %f30
	.word 0xb0bda0a6  ! 252: XNORcc_I	xnorcc 	%r22, 0x00a6, %r24
	.word 0xfd1c4000  ! 254: LDDF_R	ldd	[%r17, %r0], %f30
	.word 0xbe9d610a  ! 255: XORcc_I	xorcc 	%r21, 0x010a, %r31
	.word 0xfc140000  ! 258: LDUH_R	lduh	[%r16 + %r0], %r30
	.word 0xf6146035  ! 266: LDUH_I	lduh	[%r17 + 0x0035], %r27
	.word 0xf8542098  ! 268: LDSH_I	ldsh	[%r16 + 0x0098], %r28
	.word 0xfe144000  ! 271: LDUH_R	lduh	[%r17 + %r0], %r31
	.word 0xf2144000  ! 273: LDUH_R	lduh	[%r17 + %r0], %r25
	.word 0xb684c000  ! 274: ADDcc_R	addcc 	%r19, %r0, %r27
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xfe0dc000  ! 278: LDUB_R	ldub	[%r23 + %r0], %r31
hwintr_2_14:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_14), 16, 16)) -> intp(2, 0, 2f)
	.word 0xfc5cc000  ! 283: LDX_R	ldx	[%r19 + %r0], %r30
	mov	1, %r12
	.word 0x8f930000  ! 284: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xf51ca19c  ! 285: LDDF_I	ldd	[%r18, 0x019c], %f26
hwintr_2_15:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_15), 16, 16)) -> intp(2, 0, 24)
hwintr_2_16:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_16), 16, 16)) -> intp(2, 0, 31)
	.word 0x8594207c  ! 301: WRPR_TSTATE_I	wrpr	%r16, 0x007c, %tstate
hwintr_2_17:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_17), 16, 16)) -> intp(2, 0, 10)
	.word 0x8994e098  ! 305: WRPR_TICK_I	wrpr	%r19, 0x0098, %tick
	.word 0xb40c0000  ! 308: AND_R	and 	%r16, %r0, %r26
	.word 0xb53c0000  ! 311: SRA_R	sra 	%r16, %r0, %r26
	setx	0x1e47197900005c82, %g1, %r10
	.word 0x839a8000  ! 312: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xbb3c2001  ! 313: SRA_I	sra 	%r16, 0x0001, %r29
	.word 0xf81da03a  ! 323: LDD_I	ldd	[%r22 + 0x003a], %r28
	.word 0xb8bda1ba  ! 326: XNORcc_I	xnorcc 	%r22, 0x01ba, %r28
	.word 0xb3520000  ! 334: RDPR_PIL	<illegal instruction>
	.word 0xf8048000  ! 337: LDUW_R	lduw	[%r18 + %r0], %r28
	.word 0xbd520000  ! 339: RDPR_PIL	<illegal instruction>
	.word 0xb095618a  ! 341: ORcc_I	orcc 	%r21, 0x018a, %r24
	.word 0xb6c40000  ! 345: ADDCcc_R	addccc 	%r16, %r0, %r27
	mov	2, %r12
	.word 0xa1930000  ! 350: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xfa556036  ! 351: LDSH_I	ldsh	[%r21 + 0x0036], %r29
	.word 0xf40c8000  ! 354: LDUB_R	ldub	[%r18 + %r0], %r26
	.word 0xf65d4000  ! 355: LDX_R	ldx	[%r21 + %r0], %r27
	.word 0xb5510000  ! 356: RDPR_TICK	<illegal instruction>
hwintr_2_18:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_18), 16, 16)) -> intp(2, 0, 35)
hwintr_2_19:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_19), 16, 16)) -> intp(2, 0, 10)
	.word 0x8d95202d  ! 364: WRPR_PSTATE_I	wrpr	%r20, 0x002d, %pstate
	.word 0xb8258000  ! 370: SUB_R	sub 	%r22, %r0, %r28
hwintr_2_20:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_20), 16, 16)) -> intp(2, 0, 1b)
	.word 0xf0550000  ! 374: LDSH_R	ldsh	[%r20 + %r0], %r24
	.word 0x8395e0a8  ! 375: WRPR_TNPC_I	wrpr	%r23, 0x00a8, %tnpc
hwintr_2_21:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_21), 16, 16)) -> intp(2, 0, 32)
	.word 0xb2958000  ! 378: ORcc_R	orcc 	%r22, %r0, %r25
hwintr_2_22:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_22), 16, 16)) -> intp(2, 0, 5)
hwintr_2_23:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_23), 16, 16)) -> intp(2, 0, 9)
	.word 0xb5540000  ! 390: RDPR_GL	<illegal instruction>
	setx	data_start_3, %g1, %r23
	.word 0xfe5c2177  ! 392: LDX_I	ldx	[%r16 + 0x0177], %r31
	setx	0xd135fc470000ca1c, %g1, %r10
	.word 0x839a8000  ! 394: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xf25c4000  ! 395: LDX_R	ldx	[%r17 + %r0], %r25
	.word 0xfc5c61f2  ! 400: LDX_I	ldx	[%r17 + 0x01f2], %r30
	.word 0xf41ca030  ! 401: LDD_I	ldd	[%r18 + 0x0030], %r26
	.word 0xb7518000  ! 402: RDPR_PSTATE	<illegal instruction>
	.word 0xf8442032  ! 406: LDSW_I	ldsw	[%r16 + 0x0032], %r28
	.word 0xf20c6054  ! 408: LDUB_I	ldub	[%r17 + 0x0054], %r25
	.word 0xfc54614f  ! 411: LDSH_I	ldsh	[%r17 + 0x014f], %r30
	.word 0xbe150000  ! 413: OR_R	or 	%r20, %r0, %r31
	mov	0, %r12
	.word 0xa1930000  ! 414: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xf41c21b2  ! 416: LDD_I	ldd	[%r16 + 0x01b2], %r26
	.word 0xbd540000  ! 420: RDPR_GL	<illegal instruction>
	.word 0xbb3da001  ! 423: SRA_I	sra 	%r22, 0x0001, %r29
	.word 0xbb500000  ! 425: RDPR_TPC	<illegal instruction>
hwintr_2_24:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_24), 16, 16)) -> intp(2, 0, 38)
	.word 0xb350c000  ! 434: RDPR_TT	<illegal instruction>
	.word 0xf91d2190  ! 436: LDDF_I	ldd	[%r20, 0x0190], %f28
	setx	data_start_6, %g1, %r21
	.word 0xfe1d605a  ! 441: LDD_I	ldd	[%r21 + 0x005a], %r31
hwintr_2_25:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_25), 16, 16)) -> intp(2, 0, 1f)
	.word 0x8995e16a  ! 447: WRPR_TICK_I	wrpr	%r23, 0x016a, %tick
	.word 0xf2540000  ! 450: LDSH_R	ldsh	[%r16 + %r0], %r25
	.word 0x8d95e048  ! 451: WRPR_PSTATE_I	wrpr	%r23, 0x0048, %pstate
	.word 0xfd1d0000  ! 457: LDDF_R	ldd	[%r20, %r0], %f30
	.word 0xb1540000  ! 458: RDPR_GL	<illegal instruction>
	.word 0xfc5c6149  ! 459: LDX_I	ldx	[%r17 + 0x0149], %r30
	.word 0xf00560b1  ! 464: LDUW_I	lduw	[%r21 + 0x00b1], %r24
	.word 0xf40d4000  ! 470: LDUB_R	ldub	[%r21 + %r0], %r26
	.word 0xf85da104  ! 471: LDX_I	ldx	[%r22 + 0x0104], %r28
	.word 0xf65d8000  ! 472: LDX_R	ldx	[%r22 + %r0], %r27
	.word 0x8395e10c  ! 476: WRPR_TNPC_I	wrpr	%r23, 0x010c, %tnpc
	.word 0xfc4c4000  ! 477: LDSB_R	ldsb	[%r17 + %r0], %r30
	.word 0xfe4c0000  ! 488: LDSB_R	ldsb	[%r16 + %r0], %r31
	.word 0xfe4c2166  ! 489: LDSB_I	ldsb	[%r16 + 0x0166], %r31
	.word 0xb9504000  ! 506: RDPR_TNPC	rdpr	%tnpc, %r28
	.word 0xf0054000  ! 508: LDUW_R	lduw	[%r21 + %r0], %r24
	.word 0xfa04606a  ! 510: LDUW_I	lduw	[%r17 + 0x006a], %r29
	setx	0xb99afe750000c81a, %g1, %r10
	.word 0x839a8000  ! 511: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xfe4dc000  ! 512: LDSB_R	ldsb	[%r23 + %r0], %r31
	.word 0xb8bc4000  ! 515: XNORcc_R	xnorcc 	%r17, %r0, %r28
	.word 0xf404e024  ! 518: LDUW_I	lduw	[%r19 + 0x0024], %r26
	.word 0xf2058000  ! 520: LDUW_R	lduw	[%r22 + %r0], %r25
	.word 0x9194611c  ! 521: WRPR_PIL_I	wrpr	%r17, 0x011c, %pil
	.word 0xf844c000  ! 522: LDSW_R	ldsw	[%r19 + %r0], %r28
	.word 0x8194a019  ! 525: WRPR_TPC_I	wrpr	%r18, 0x0019, %tpc
	.word 0xfe55201a  ! 527: LDSH_I	ldsh	[%r20 + 0x001a], %r31
	setx	data_start_5, %g1, %r18
	.word 0xbc250000  ! 531: SUB_R	sub 	%r20, %r0, %r30
	setx	data_start_2, %g1, %r21
	.word 0xf81421c3  ! 533: LDUH_I	lduh	[%r16 + 0x01c3], %r28
	.word 0x89952089  ! 535: WRPR_TICK_I	wrpr	%r20, 0x0089, %tick
	.word 0xf405c000  ! 538: LDUW_R	lduw	[%r23 + %r0], %r26
	setx	data_start_0, %g1, %r18
	.word 0xf004c000  ! 546: LDUW_R	lduw	[%r19 + %r0], %r24
	.word 0xf214c000  ! 548: LDUH_R	lduh	[%r19 + %r0], %r25
	.word 0xb9518000  ! 549: RDPR_PSTATE	<illegal instruction>
	.word 0xbca52055  ! 552: SUBcc_I	subcc 	%r20, 0x0055, %r30
hwintr_2_26:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_26), 16, 16)) -> intp(2, 0, 1d)
	.word 0xf8550000  ! 554: LDSH_R	ldsh	[%r20 + %r0], %r28
	.word 0xf8040000  ! 555: LDUW_R	lduw	[%r16 + %r0], %r28
	.word 0xb9500000  ! 556: RDPR_TPC	<illegal instruction>
	.word 0xf51dc000  ! 558: LDDF_R	ldd	[%r23, %r0], %f26
hwintr_2_27:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_27), 16, 16)) -> intp(2, 0, 3f)
	setx	data_start_6, %g1, %r16
	.word 0xbb520000  ! 566: RDPR_PIL	<illegal instruction>
hwintr_2_28:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_28), 16, 16)) -> intp(2, 0, 10)
	.word 0xf84c0000  ! 568: LDSB_R	ldsb	[%r16 + %r0], %r28
	.word 0xb351c000  ! 569: RDPR_TL	<illegal instruction>
	.word 0xf71c201f  ! 572: LDDF_I	ldd	[%r16, 0x001f], %f27
	.word 0xf8142136  ! 573: LDUH_I	lduh	[%r16 + 0x0136], %r28
	.word 0xf645c000  ! 580: LDSW_R	ldsw	[%r23 + %r0], %r27
	.word 0xb3520000  ! 581: RDPR_PIL	<illegal instruction>
	.word 0xf0450000  ! 588: LDSW_R	ldsw	[%r20 + %r0], %r24
	.word 0xfe5cc000  ! 589: LDX_R	ldx	[%r19 + %r0], %r31
hwintr_2_29:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_29), 16, 16)) -> intp(2, 0, 13)
	setx	0xf9fa60df00008bc5, %g1, %r10
	.word 0x839a8000  ! 592: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xf215e184  ! 595: LDUH_I	lduh	[%r23 + 0x0184], %r25
	.word 0xb04561ac  ! 596: ADDC_I	addc 	%r21, 0x01ac, %r24
	.word 0xbe342108  ! 598: ORN_I	orn 	%r16, 0x0108, %r31
	.word 0xb92c4000  ! 602: SLL_R	sll 	%r17, %r0, %r28
	.word 0xfe046138  ! 605: LDUW_I	lduw	[%r17 + 0x0138], %r31
	setx	data_start_2, %g1, %r16
	.word 0xf41d8000  ! 607: LDD_R	ldd	[%r22 + %r0], %r26
	.word 0x8795e0d8  ! 609: WRPR_TT_I	wrpr	%r23, 0x00d8, %tt
	.word 0xfa4c6105  ! 611: LDSB_I	ldsb	[%r17 + 0x0105], %r29
	.word 0xb22d4000  ! 612: ANDN_R	andn 	%r21, %r0, %r25
	.word 0x8d946005  ! 613: WRPR_PSTATE_I	wrpr	%r17, 0x0005, %pstate
	.word 0xfc05610d  ! 616: LDUW_I	lduw	[%r21 + 0x010d], %r30
	.word 0xf00521b9  ! 619: LDUW_I	lduw	[%r20 + 0x01b9], %r24
	.word 0xb1518000  ! 623: RDPR_PSTATE	<illegal instruction>
	.word 0xf20c2008  ! 626: LDUB_I	ldub	[%r16 + 0x0008], %r25
	.word 0xf71d4000  ! 629: LDDF_R	ldd	[%r21, %r0], %f27
	.word 0xb024c000  ! 632: SUB_R	sub 	%r19, %r0, %r24
	.word 0xf0042069  ! 633: LDUW_I	lduw	[%r16 + 0x0069], %r24
	.word 0xb6350000  ! 634: SUBC_R	orn 	%r20, %r0, %r27
	.word 0xf8054000  ! 635: LDUW_R	lduw	[%r21 + %r0], %r28
	.word 0xb3504000  ! 636: RDPR_TNPC	<illegal instruction>
	.word 0xf81d8000  ! 637: LDD_R	ldd	[%r22 + %r0], %r28
	setx	0x3dffce4d00009c1c, %g1, %r10
	.word 0x819a8000  ! 639: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
hwintr_2_30:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_30), 16, 16)) -> intp(2, 0, f)
	.word 0xf40da1d0  ! 641: LDUB_I	ldub	[%r22 + 0x01d0], %r26
	.word 0xb3504000  ! 647: RDPR_TNPC	rdpr	%tnpc, %r25
	setx	data_start_6, %g1, %r20
	.word 0xb1508000  ! 650: RDPR_TSTATE	<illegal instruction>
	setx	0xc3d8980e00000b5f, %g1, %r10
	.word 0x819a8000  ! 652: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	setx	0xb30691760000bd1a, %g1, %r10
	.word 0x839a8000  ! 653: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xf21ca13c  ! 654: LDD_I	ldd	[%r18 + 0x013c], %r25
	.word 0xbb3c6001  ! 656: SRA_I	sra 	%r17, 0x0001, %r29
	.word 0xfe05c000  ! 657: LDUW_R	lduw	[%r23 + %r0], %r31
	.word 0xf40d8000  ! 659: LDUB_R	ldub	[%r22 + %r0], %r26
	.word 0xbd540000  ! 660: RDPR_GL	rdpr	%-, %r30
	.word 0xf0450000  ! 669: LDSW_R	ldsw	[%r20 + %r0], %r24
	.word 0xf0440000  ! 671: LDSW_R	ldsw	[%r16 + %r0], %r24
	.word 0xf20c4000  ! 677: LDUB_R	ldub	[%r17 + %r0], %r25
	.word 0xb5510000  ! 683: RDPR_TICK	<illegal instruction>
	.word 0xf21cc000  ! 685: LDD_R	ldd	[%r19 + %r0], %r25
	.word 0xf25d0000  ! 687: LDX_R	ldx	[%r20 + %r0], %r25
	.word 0xf61c8000  ! 691: LDD_R	ldd	[%r18 + %r0], %r27
	.word 0xf05cc000  ! 695: LDX_R	ldx	[%r19 + %r0], %r24
	mov	2, %r12
	.word 0x8f930000  ! 698: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xf0044000  ! 699: LDUW_R	lduw	[%r17 + %r0], %r24
	.word 0xbb518000  ! 702: RDPR_PSTATE	<illegal instruction>
	.word 0xf2058000  ! 704: LDUW_R	lduw	[%r22 + %r0], %r25
hwintr_2_31:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_31), 16, 16)) -> intp(2, 0, e)
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xfc548000  ! 707: LDSH_R	ldsh	[%r18 + %r0], %r30
	.word 0xfd1d2115  ! 709: LDDF_I	ldd	[%r20, 0x0115], %f30
	setx	0xaf53cf4f0000cb44, %g1, %r10
	.word 0x839a8000  ! 711: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb12cf001  ! 718: SLLX_I	sllx	%r19, 0x0001, %r24
	.word 0xfa4ce076  ! 728: LDSB_I	ldsb	[%r19 + 0x0076], %r29
	.word 0x8795205f  ! 729: WRPR_TT_I	wrpr	%r20, 0x005f, %tt
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb3480000  ! 734: RDHPR_HPSTATE	rdhpr	%hpstate, %r25
	.word 0xbb349000  ! 735: SRLX_R	srlx	%r18, %r0, %r29
hwintr_2_32:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_32), 16, 16)) -> intp(2, 0, 0)
hwintr_2_33:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_33), 16, 16)) -> intp(2, 0, 18)
	.word 0xb1510000  ! 745: RDPR_TICK	<illegal instruction>
hwintr_2_34:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_34), 16, 16)) -> intp(2, 0, 3e)
	.word 0x8d9461a2  ! 748: WRPR_PSTATE_I	wrpr	%r17, 0x01a2, %pstate
	setx	data_start_2, %g1, %r21
	.word 0x8395a1cb  ! 757: WRPR_TNPC_I	wrpr	%r22, 0x01cb, %tnpc
	.word 0x9194614a  ! 758: WRPR_PIL_I	wrpr	%r17, 0x014a, %pil
	.word 0xf45d4000  ! 760: LDX_R	ldx	[%r21 + %r0], %r26
hwintr_2_35:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_35), 16, 16)) -> intp(2, 0, 5)
	.word 0x83952025  ! 768: WRPR_TNPC_I	wrpr	%r20, 0x0025, %tnpc
	.word 0xf41d0000  ! 770: LDD_R	ldd	[%r20 + %r0], %r26
	.word 0xf51d0000  ! 776: LDDF_R	ldd	[%r20, %r0], %f26
	.word 0xbf500000  ! 778: RDPR_TPC	<illegal instruction>
	setx	data_start_6, %g1, %r23
	setx	0x63885c1e00009dd1, %g1, %r10
	.word 0x819a8000  ! 780: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0x8395608a  ! 781: WRPR_TNPC_I	wrpr	%r21, 0x008a, %tnpc
	.word 0xb2c4e14f  ! 792: ADDCcc_I	addccc 	%r19, 0x014f, %r25
hwintr_2_36:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_36), 16, 16)) -> intp(2, 0, 39)
	setx	0xca124b000006d41, %g1, %r10
	.word 0x839a8000  ! 794: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xf60c6021  ! 799: LDUB_I	ldub	[%r17 + 0x0021], %r27
	.word 0xfa5c20ec  ! 801: LDX_I	ldx	[%r16 + 0x00ec], %r29
	.word 0xbf480000  ! 804: RDHPR_HPSTATE	rdhpr	%hpstate, %r31
	.word 0xff1c4000  ! 808: LDDF_R	ldd	[%r17, %r0], %f31
	.word 0xf91de040  ! 809: LDDF_I	ldd	[%r23, 0x0040], %f28
hwintr_2_37:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_37), 16, 16)) -> intp(2, 0, e)
	.word 0xb7510000  ! 816: RDPR_TICK	<illegal instruction>
hwintr_2_38:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_38), 16, 16)) -> intp(2, 0, 33)
	.word 0xf01cc000  ! 822: LDD_R	ldd	[%r19 + %r0], %r24
hwintr_2_39:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_39), 16, 16)) -> intp(2, 0, 3d)
	.word 0xb72c0000  ! 829: SLL_R	sll 	%r16, %r0, %r27
	setx	data_start_6, %g1, %r16
	.word 0xf205e0fe  ! 836: LDUW_I	lduw	[%r23 + 0x00fe], %r25
	.word 0xfa44a010  ! 838: LDSW_I	ldsw	[%r18 + 0x0010], %r29
	.word 0xf61c2058  ! 840: LDD_I	ldd	[%r16 + 0x0058], %r27
	.word 0xb62ca179  ! 842: ANDN_I	andn 	%r18, 0x0179, %r27
	.word 0xfc04e141  ! 846: LDUW_I	lduw	[%r19 + 0x0141], %r30
	.word 0xfa1561e6  ! 848: LDUH_I	lduh	[%r21 + 0x01e6], %r29
	.word 0x899560b0  ! 850: WRPR_TICK_I	wrpr	%r21, 0x00b0, %tick
	.word 0xb0b58000  ! 853: SUBCcc_R	orncc 	%r22, %r0, %r24
	.word 0xf85ce18e  ! 863: LDX_I	ldx	[%r19 + 0x018e], %r28
	.word 0xf11c210e  ! 864: LDDF_I	ldd	[%r16, 0x010e], %f24
	.word 0xf055a09e  ! 866: LDSH_I	ldsh	[%r22 + 0x009e], %r24
	.word 0xfa544000  ! 869: LDSH_R	ldsh	[%r17 + %r0], %r29
	.word 0x8994a00e  ! 873: WRPR_TICK_I	wrpr	%r18, 0x000e, %tick
	.word 0xf64de147  ! 880: LDSB_I	ldsb	[%r23 + 0x0147], %r27
hwintr_2_40:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_40), 16, 16)) -> intp(2, 0, d)
	.word 0xfe144000  ! 884: LDUH_R	lduh	[%r17 + %r0], %r31
	.word 0xf40c4000  ! 885: LDUB_R	ldub	[%r17 + %r0], %r26
	.word 0xfa0d4000  ! 894: LDUB_R	ldub	[%r21 + %r0], %r29
	.word 0xf31de15c  ! 896: LDDF_I	ldd	[%r23, 0x015c], %f25
	.word 0xfc140000  ! 899: LDUH_R	lduh	[%r16 + %r0], %r30
hwintr_2_41:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_41), 16, 16)) -> intp(2, 0, 7)
	.word 0xb0ade15c  ! 902: ANDNcc_I	andncc 	%r23, 0x015c, %r24
	.word 0xf815616c  ! 903: LDUH_I	lduh	[%r21 + 0x016c], %r28
	.word 0xfe54e0c5  ! 904: LDSH_I	ldsh	[%r19 + 0x00c5], %r31
	.word 0xf41ca03f  ! 905: LDD_I	ldd	[%r18 + 0x003f], %r26
	.word 0xf604a187  ! 907: LDUW_I	lduw	[%r18 + 0x0187], %r27
	.word 0xf85d8000  ! 909: LDX_R	ldx	[%r22 + %r0], %r28
	setx	0xa06626a0000ac58, %g1, %r10
	.word 0x819a8000  ! 910: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0x87952178  ! 921: WRPR_TT_I	wrpr	%r20, 0x0178, %tt
	.word 0xfc1c4000  ! 922: LDD_R	ldd	[%r17 + %r0], %r30
	.word 0xfe154000  ! 923: LDUH_R	lduh	[%r21 + %r0], %r31
	.word 0xf01d4000  ! 924: LDD_R	ldd	[%r21 + %r0], %r24
	.word 0xfc1de0bd  ! 931: LDD_I	ldd	[%r23 + 0x00bd], %r30
	.word 0xfe144000  ! 933: LDUH_R	lduh	[%r17 + %r0], %r31
	.word 0xf71ca1bd  ! 934: LDDF_I	ldd	[%r18, 0x01bd], %f27
	.word 0xfd1da19d  ! 937: LDDF_I	ldd	[%r22, 0x019d], %f30
	.word 0xf21d0000  ! 938: LDD_R	ldd	[%r20 + %r0], %r25
	.word 0xba04c000  ! 939: ADD_R	add 	%r19, %r0, %r29
	setx	data_start_1, %g1, %r20
	.word 0xb751c000  ! 942: RDPR_TL	rdpr	%tl, %r27
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xbd51c000  ! 944: RDPR_TL	<illegal instruction>
	setx	0x4c2d65bc00004d15, %g1, %r10
	.word 0x819a8000  ! 954: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xf80d8000  ! 957: LDUB_R	ldub	[%r22 + %r0], %r28
	.word 0xfa4da1cf  ! 959: LDSB_I	ldsb	[%r22 + 0x01cf], %r29
	.word 0xf04d604f  ! 960: LDSB_I	ldsb	[%r21 + 0x004f], %r24
	.word 0xbb520000  ! 964: RDPR_PIL	<illegal instruction>
	.word 0xfc1c6118  ! 967: LDD_I	ldd	[%r17 + 0x0118], %r30
	.word 0xf01d60c7  ! 969: LDD_I	ldd	[%r21 + 0x00c7], %r24
	.word 0xb350c000  ! 971: RDPR_TT	<illegal instruction>
	.word 0xb03d216c  ! 972: XNOR_I	xnor 	%r20, 0x016c, %r24
	.word 0xb02461f3  ! 974: SUB_I	sub 	%r17, 0x01f3, %r24
	.word 0xfb1ce185  ! 979: LDDF_I	ldd	[%r19, 0x0185], %f29
	.word 0xf814c000  ! 980: LDUH_R	lduh	[%r19 + %r0], %r28
	.word 0xbe2ca014  ! 982: ANDN_I	andn 	%r18, 0x0014, %r31
	.word 0xfc5d605b  ! 983: LDX_I	ldx	[%r21 + 0x005b], %r30
	.word 0xb750c000  ! 984: RDPR_TT	<illegal instruction>
hwintr_2_42:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_42), 16, 16)) -> intp(2, 0, 16)
	.word 0xf0054000  ! 991: LDUW_R	lduw	[%r21 + %r0], %r24
	.word 0xfe1ca0d8  ! 992: LDD_I	ldd	[%r18 + 0x00d8], %r31
	.word 0xfc1c4000  ! 993: LDD_R	ldd	[%r17 + %r0], %r30
	.word 0xf604c000  ! 997: LDUW_R	lduw	[%r19 + %r0], %r27
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_1:
	.word 0xb1abc820  ! 2: FMOVVC	fmovs	%fcc1, %f0, %f24
	.word 0x8995e06b  ! 7: WRPR_TICK_I	wrpr	%r23, 0x006b, %tick
hwintr_1_0:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_0), 16, 16)) -> intp(1, 0, 13)
	.word 0xba3c607d  ! 9: XNOR_I	xnor 	%r17, 0x007d, %r29
	.word 0xbda80c20  ! 11: FMOVRLZ	dis not found

	.word 0xb1a80c20  ! 13: FMOVRLZ	dis not found

	.word 0xbfa98820  ! 16: FMOVNEG	fmovs	%fcc1, %f0, %f31
	.word 0x9194a1c9  ! 17: WRPR_PIL_I	wrpr	%r18, 0x01c9, %pil
	.word 0xb3a448a0  ! 19: FSUBs	fsubs	%f17, %f0, %f25
hwintr_1_1:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_1), 16, 16)) -> intp(1, 0, 2a)
	.word 0xbd2dc000  ! 23: SLL_R	sll 	%r23, %r0, %r30
	setx	0xac690a2c0000eac8, %g1, %r10
	.word 0x819a8000  ! 24: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
hwintr_1_2:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_2), 16, 16)) -> intp(1, 0, 27)
	.word 0xb1a84820  ! 37: FMOVE	fmovs	%fcc1, %f0, %f24
hwintr_1_3:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_3), 16, 16)) -> intp(1, 0, 30)
	.word 0xbfab8820  ! 46: FMOVPOS	fmovs	%fcc1, %f0, %f31
	.word 0xb7a589a0  ! 47: FDIVs	fdivs	%f22, %f0, %f27
	.word 0xb1a9c820  ! 48: FMOVVS	fmovs	%fcc1, %f0, %f24
	.word 0xb3500000  ! 49: RDPR_TPC	<illegal instruction>
	.word 0xb5504000  ! 51: RDPR_TNPC	<illegal instruction>
	.word 0x8194210e  ! 58: WRPR_TPC_I	wrpr	%r16, 0x010e, %tpc
	.word 0xb3ab4820  ! 60: FMOVCC	fmovs	%fcc1, %f0, %f25
	.word 0xb9520000  ! 62: RDPR_PIL	<illegal instruction>
hwintr_1_4:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_4), 16, 16)) -> intp(1, 0, 0)
hwintr_1_5:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_5), 16, 16)) -> intp(1, 0, 2b)
	.word 0xb9aa0820  ! 67: FMOVA	fmovs	%fcc1, %f0, %f28
	.word 0x91952067  ! 68: WRPR_PIL_I	wrpr	%r20, 0x0067, %pil
	.word 0xbdaa4820  ! 71: FMOVNE	fmovs	%fcc1, %f0, %f30
	.word 0xb9a50840  ! 72: FADDd	faddd	%f20, %f0, %f28
	.word 0xb5a8c820  ! 75: FMOVL	fmovs	%fcc1, %f0, %f26
	.word 0xbd51c000  ! 81: RDPR_TL	<illegal instruction>
	setx	data_start_1, %g1, %r19
	.word 0xb3a84820  ! 90: FMOVE	fmovs	%fcc1, %f0, %f25
	.word 0xb550c000  ! 91: RDPR_TT	<illegal instruction>
	.word 0xb1500000  ! 95: RDPR_TPC	<illegal instruction>
hwintr_1_6:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_6), 16, 16)) -> intp(1, 0, 39)
	.word 0xbc054000  ! 98: ADD_R	add 	%r21, %r0, %r30
	.word 0xbfa488e0  ! 107: FSUBq	dis not found

	.word 0xb9a88820  ! 110: FMOVLE	fmovs	%fcc1, %f0, %f28
	.word 0xb5aa8820  ! 111: FMOVG	fmovs	%fcc1, %f0, %f26
hwintr_1_7:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_7), 16, 16)) -> intp(1, 0, 16)
	setx	data_start_1, %g1, %r18
	.word 0xb83ce154  ! 116: XNOR_I	xnor 	%r19, 0x0154, %r28
	.word 0x8794a1dd  ! 117: WRPR_TT_I	wrpr	%r18, 0x01dd, %tt
	setx	0xfe3e1faf00006b8f, %g1, %r10
	.word 0x819a8000  ! 119: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xbda449a0  ! 121: FDIVs	fdivs	%f17, %f0, %f30
	.word 0xb1ab4820  ! 123: FMOVCC	fmovs	%fcc1, %f0, %f24
	.word 0xbfa8c820  ! 124: FMOVL	fmovs	%fcc1, %f0, %f31
hwintr_1_8:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_8), 16, 16)) -> intp(1, 0, 13)
	.word 0xbb510000  ! 127: RDPR_TICK	<illegal instruction>
	setx	data_start_0, %g1, %r22
	.word 0xb5a80820  ! 131: FMOVRLEZ	fmovs	%fcc1, %f0, %f26
	.word 0xb9a8c820  ! 134: FMOVL	fmovs	%fcc1, %f0, %f28
	.word 0xb9a84820  ! 136: FMOVE	fmovs	%fcc1, %f0, %f28
	.word 0xb3480000  ! 138: RDHPR_HPSTATE	rdhpr	%hpstate, %r25
hwintr_1_9:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_9), 16, 16)) -> intp(1, 0, 39)
	.word 0xb3a81c20  ! 142: FMOVRGEZ	dis not found

	.word 0xb9a44920  ! 145: FMULs	fmuls	%f17, %f0, %f28
	.word 0x899560b2  ! 147: WRPR_TICK_I	wrpr	%r21, 0x00b2, %tick
	.word 0x8795e1b1  ! 152: WRPR_TT_I	wrpr	%r23, 0x01b1, %tt
	.word 0xb7ab0820  ! 154: FMOVGU	fmovs	%fcc1, %f0, %f27
hwintr_1_10:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_10), 16, 16)) -> intp(1, 0, 12)
	.word 0xb9aa8820  ! 160: FMOVG	fmovs	%fcc1, %f0, %f28
	.word 0xb9a80c20  ! 162: FMOVRLZ	dis not found

	setx	data_start_6, %g1, %r23
hwintr_1_11:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_11), 16, 16)) -> intp(1, 0, e)
	mov	0, %r12
	.word 0x8f930000  ! 167: WRPR_TL_R	wrpr	%r12, %r0, %tl
hwintr_1_12:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_12), 16, 16)) -> intp(1, 0, 6)
	.word 0xb3510000  ! 169: RDPR_TICK	<illegal instruction>
	.word 0x8d9561a2  ! 172: WRPR_PSTATE_I	wrpr	%r21, 0x01a2, %pstate
	.word 0xb3a80c20  ! 175: FMOVRLZ	dis not found

	.word 0xbda80820  ! 176: FMOVRLEZ	fmovs	%fcc1, %f0, %f30
	.word 0xb7a5c820  ! 179: FADDs	fadds	%f23, %f0, %f27
	.word 0x8594a1dd  ! 182: WRPR_TSTATE_I	wrpr	%r18, 0x01dd, %tstate
	.word 0xb3a4c960  ! 183: FMULq	dis not found

	.word 0xb9a54960  ! 186: FMULq	dis not found

	.word 0xb5a8c820  ! 190: FMOVL	fmovs	%fcc1, %f0, %f26
	.word 0x8195203e  ! 191: WRPR_TPC_I	wrpr	%r20, 0x003e, %tpc
	.word 0xbf480000  ! 193: RDHPR_HPSTATE	rdhpr	%hpstate, %r31
	.word 0xb151c000  ! 196: RDPR_TL	<illegal instruction>
	.word 0xb5480000  ! 197: RDHPR_HPSTATE	rdhpr	%hpstate, %r26
	.word 0xb151c000  ! 201: RDPR_TL	<illegal instruction>
	mov	2, %r12
	.word 0xa1930000  ! 202: WRPR_GL_R	wrpr	%r12, %r0, %-
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbba90820  ! 204: FMOVLEU	fmovs	%fcc1, %f0, %f29
	.word 0xbc94a105  ! 205: ORcc_I	orcc 	%r18, 0x0105, %r30
	.word 0xb3a589c0  ! 207: FDIVd	fdivd	%f22, %f0, %f56
	.word 0xb751c000  ! 210: RDPR_TL	<illegal instruction>
	.word 0xb7518000  ! 214: RDPR_PSTATE	<illegal instruction>
	.word 0xb9a44860  ! 216: FADDq	dis not found

	.word 0xbda5c820  ! 218: FADDs	fadds	%f23, %f0, %f30
	.word 0xb150c000  ! 222: RDPR_TT	<illegal instruction>
	.word 0xbb2c3001  ! 226: SLLX_I	sllx	%r16, 0x0001, %r29
	.word 0xbfabc820  ! 227: FMOVVC	fmovs	%fcc1, %f0, %f31
	.word 0xb7a00520  ! 228: FSQRTs	fsqrt	
	.word 0xbc84605c  ! 230: ADDcc_I	addcc 	%r17, 0x005c, %r30
hwintr_1_13:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_13), 16, 16)) -> intp(1, 0, 0)
	.word 0x9194e19e  ! 240: WRPR_PIL_I	wrpr	%r19, 0x019e, %pil
	.word 0xbab5e0ce  ! 241: ORNcc_I	orncc 	%r23, 0x00ce, %r29
	setx	0x7409452b00002adf, %g1, %r10
	.word 0x839a8000  ! 244: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb3540000  ! 248: RDPR_GL	<illegal instruction>
	.word 0xb0b58000  ! 249: ORNcc_R	orncc 	%r22, %r0, %r24
	.word 0xbfa5c860  ! 250: FADDq	dis not found

	.word 0xbebce1f0  ! 252: XNORcc_I	xnorcc 	%r19, 0x01f0, %r31
	.word 0xb7aac820  ! 253: FMOVGE	fmovs	%fcc1, %f0, %f27
	.word 0xb49da0ed  ! 255: XORcc_I	xorcc 	%r22, 0x00ed, %r26
	.word 0xb7a4c840  ! 256: FADDd	faddd	%f50, %f0, %f58
	.word 0xb9a44940  ! 259: FMULd	fmuld	%f48, %f0, %f28
	.word 0xb9a81c20  ! 265: FMOVRGEZ	dis not found

	.word 0xb7a98820  ! 267: FMOVNEG	fmovs	%fcc1, %f0, %f27
	.word 0xb7a00540  ! 269: FSQRTd	fsqrt	
	.word 0xbdabc820  ! 270: FMOVVC	fmovs	%fcc1, %f0, %f30
	.word 0xb4850000  ! 274: ADDcc_R	addcc 	%r20, %r0, %r26
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb1a40920  ! 279: FMULs	fmuls	%f16, %f0, %f24
	.word 0xb1a00560  ! 280: FSQRTq	fsqrt	
hwintr_1_14:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_14), 16, 16)) -> intp(1, 0, 35)
	mov	0, %r12
	.word 0x8f930000  ! 284: WRPR_TL_R	wrpr	%r12, %r0, %tl
hwintr_1_15:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_15), 16, 16)) -> intp(1, 0, 3e)
	.word 0xb7abc820  ! 289: FMOVVC	fmovs	%fcc1, %f0, %f27
	.word 0xbfa508c0  ! 292: FSUBd	fsubd	%f20, %f0, %f62
	.word 0xb7a81420  ! 295: FMOVRNZ	dis not found

hwintr_1_16:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_16), 16, 16)) -> intp(1, 0, 36)
	.word 0x8594e131  ! 301: WRPR_TSTATE_I	wrpr	%r19, 0x0131, %tstate
hwintr_1_17:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_17), 16, 16)) -> intp(1, 0, c)
	.word 0x8995e1f9  ! 305: WRPR_TICK_I	wrpr	%r23, 0x01f9, %tick
	.word 0xbe0d0000  ! 308: AND_R	and 	%r20, %r0, %r31
	.word 0xbb3dc000  ! 311: SRA_R	sra 	%r23, %r0, %r29
	setx	0xd1b057bd0000be16, %g1, %r10
	.word 0x839a8000  ! 312: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xbb3c6001  ! 313: SRA_I	sra 	%r17, 0x0001, %r29
	.word 0xbba00020  ! 316: FMOVs	fmovs	%f0, %f29
	.word 0xb1ab0820  ! 317: FMOVGU	fmovs	%fcc1, %f0, %f24
	.word 0xb3a40820  ! 319: FADDs	fadds	%f16, %f0, %f25
	.word 0xb7aa8820  ! 321: FMOVG	fmovs	%fcc1, %f0, %f27
	.word 0xbfa8c820  ! 322: FMOVL	fmovs	%fcc1, %f0, %f31
	.word 0xb5ab8820  ! 325: FMOVPOS	fmovs	%fcc1, %f0, %f26
	.word 0xb8bda079  ! 326: XNORcc_I	xnorcc 	%r22, 0x0079, %r28
	.word 0xb3a8c820  ! 330: FMOVL	fmovs	%fcc1, %f0, %f25
	.word 0xb7aa8820  ! 331: FMOVG	fmovs	%fcc1, %f0, %f27
	.word 0xb5a58960  ! 333: FMULq	dis not found

	.word 0xb1520000  ! 334: RDPR_PIL	<illegal instruction>
	.word 0xb3520000  ! 339: RDPR_PIL	<illegal instruction>
	.word 0xb8956154  ! 341: ORcc_I	orcc 	%r21, 0x0154, %r28
	.word 0xb1a9c820  ! 343: FMOVVS	fmovs	%fcc1, %f0, %f24
	.word 0xb6c48000  ! 345: ADDCcc_R	addccc 	%r18, %r0, %r27
	.word 0xbda548a0  ! 348: FSUBs	fsubs	%f21, %f0, %f30
	mov	2, %r12
	.word 0xa1930000  ! 350: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb3510000  ! 356: RDPR_TICK	<illegal instruction>
hwintr_1_18:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_18), 16, 16)) -> intp(1, 0, 25)
	.word 0xb9a81820  ! 361: FMOVRGZ	fmovs	%fcc3, %f0, %f28
hwintr_1_19:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_19), 16, 16)) -> intp(1, 0, 24)
	.word 0x8d95a1ea  ! 364: WRPR_PSTATE_I	wrpr	%r22, 0x01ea, %pstate
	.word 0xb7aa0820  ! 366: FMOVA	fmovs	%fcc1, %f0, %f27
	.word 0xb6250000  ! 370: SUB_R	sub 	%r20, %r0, %r27
	.word 0xb7a81820  ! 371: FMOVRGZ	fmovs	%fcc3, %f0, %f27
hwintr_1_20:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_20), 16, 16)) -> intp(1, 0, 18)
	.word 0xbfa58920  ! 373: FMULs	fmuls	%f22, %f0, %f31
	.word 0x8394a172  ! 375: WRPR_TNPC_I	wrpr	%r18, 0x0172, %tnpc
hwintr_1_21:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_21), 16, 16)) -> intp(1, 0, 2f)
	.word 0xbe94c000  ! 378: ORcc_R	orcc 	%r19, %r0, %r31
	.word 0xbfa90820  ! 379: FMOVLEU	fmovs	%fcc1, %f0, %f31
	.word 0xb5a40940  ! 380: FMULd	fmuld	%f16, %f0, %f26
hwintr_1_22:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_22), 16, 16)) -> intp(1, 0, 34)
	.word 0xb9a5c9e0  ! 385: FDIVq	dis not found

hwintr_1_23:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_23), 16, 16)) -> intp(1, 0, 2a)
	.word 0xb7540000  ! 390: RDPR_GL	<illegal instruction>
	setx	data_start_0, %g1, %r21
	setx	0x872b789c0000b951, %g1, %r10
	.word 0x839a8000  ! 394: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb3518000  ! 402: RDPR_PSTATE	<illegal instruction>
	.word 0xbdab4820  ! 403: FMOVCC	fmovs	%fcc1, %f0, %f30
	.word 0xb1a5c940  ! 404: FMULd	fmuld	%f54, %f0, %f24
	.word 0xb1a98820  ! 410: FMOVNEG	fmovs	%fcc1, %f0, %f24
	.word 0xbe150000  ! 413: OR_R	or 	%r20, %r0, %r31
	mov	2, %r12
	.word 0xa1930000  ! 414: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb1a80420  ! 415: FMOVRZ	dis not found

	.word 0xb3540000  ! 420: RDPR_GL	<illegal instruction>
	.word 0xbfa9c820  ! 421: FMOVVS	fmovs	%fcc1, %f0, %f31
	.word 0xbba4c820  ! 422: FADDs	fadds	%f19, %f0, %f29
	.word 0xbd3c2001  ! 423: SRA_I	sra 	%r16, 0x0001, %r30
	.word 0xbd500000  ! 425: RDPR_TPC	<illegal instruction>
	.word 0xbfa4c9a0  ! 426: FDIVs	fdivs	%f19, %f0, %f31
	.word 0xbfa488a0  ! 429: FSUBs	fsubs	%f18, %f0, %f31
	.word 0xbba81420  ! 430: FMOVRNZ	dis not found

hwintr_1_24:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_24), 16, 16)) -> intp(1, 0, 5)
	.word 0xb350c000  ! 434: RDPR_TT	<illegal instruction>
	.word 0xb5a5c8a0  ! 435: FSUBs	fsubs	%f23, %f0, %f26
	setx	data_start_3, %g1, %r19
	.word 0xb9a448c0  ! 444: FSUBd	fsubd	%f48, %f0, %f28
hwintr_1_25:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_25), 16, 16)) -> intp(1, 0, f)
	.word 0x89946179  ! 447: WRPR_TICK_I	wrpr	%r17, 0x0179, %tick
	.word 0x8d94e081  ! 451: WRPR_PSTATE_I	wrpr	%r19, 0x0081, %pstate
	.word 0xb5a00560  ! 452: FSQRTq	fsqrt	
	.word 0xb9a5c960  ! 455: FMULq	dis not found

	.word 0xb1540000  ! 458: RDPR_GL	<illegal instruction>
	.word 0xb5a4c860  ! 468: FADDq	dis not found

	.word 0xb7a81c20  ! 469: FMOVRGEZ	dis not found

	.word 0xbda5c9c0  ! 474: FDIVd	fdivd	%f54, %f0, %f30
	.word 0x83946133  ! 476: WRPR_TNPC_I	wrpr	%r17, 0x0133, %tnpc
	.word 0xb3a00560  ! 481: FSQRTq	fsqrt	
	.word 0xbda81c20  ! 483: FMOVRGEZ	dis not found

	.word 0xb1a44840  ! 484: FADDd	faddd	%f48, %f0, %f24
	.word 0xb1a508c0  ! 491: FSUBd	fsubd	%f20, %f0, %f24
	.word 0xb3a94820  ! 492: FMOVCS	fmovs	%fcc1, %f0, %f25
	.word 0xb1a81420  ! 494: FMOVRNZ	dis not found

	.word 0xb7a58820  ! 495: FADDs	fadds	%f22, %f0, %f27
	.word 0xb5aa8820  ! 505: FMOVG	fmovs	%fcc1, %f0, %f26
	.word 0xb3504000  ! 506: RDPR_TNPC	<illegal instruction>
	.word 0xbda88820  ! 509: FMOVLE	fmovs	%fcc1, %f0, %f30
	setx	0x2d053d5100005d98, %g1, %r10
	.word 0x839a8000  ! 511: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb5a489e0  ! 513: FDIVq	dis not found

	.word 0xb2bdc000  ! 515: XNORcc_R	xnorcc 	%r23, %r0, %r25
	.word 0xb1a00560  ! 519: FSQRTq	fsqrt	
	.word 0x9195616a  ! 521: WRPR_PIL_I	wrpr	%r21, 0x016a, %pil
	.word 0x81952126  ! 525: WRPR_TPC_I	wrpr	%r20, 0x0126, %tpc
	.word 0xb5a449c0  ! 528: FDIVd	fdivd	%f48, %f0, %f26
	setx	data_start_0, %g1, %r16
	.word 0xb8258000  ! 531: SUB_R	sub 	%r22, %r0, %r28
	setx	data_start_6, %g1, %r20
	.word 0x8994e047  ! 535: WRPR_TICK_I	wrpr	%r19, 0x0047, %tick
	.word 0xb3a54820  ! 536: FADDs	fadds	%f21, %f0, %f25
	.word 0xb1a5c9c0  ! 539: FDIVd	fdivd	%f54, %f0, %f24
	.word 0xbfa00520  ! 543: FSQRTs	fsqrt	
	setx	data_start_0, %g1, %r16
	.word 0xbfa4c9a0  ! 547: FDIVs	fdivs	%f19, %f0, %f31
	.word 0xb5518000  ! 549: RDPR_PSTATE	<illegal instruction>
	.word 0xb0a421a4  ! 552: SUBcc_I	subcc 	%r16, 0x01a4, %r24
hwintr_1_26:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_26), 16, 16)) -> intp(1, 0, 1f)
	.word 0xbf500000  ! 556: RDPR_TPC	<illegal instruction>
hwintr_1_27:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_27), 16, 16)) -> intp(1, 0, 22)
	setx	data_start_2, %g1, %r22
	.word 0xbd520000  ! 566: RDPR_PIL	<illegal instruction>
hwintr_1_28:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_28), 16, 16)) -> intp(1, 0, d)
	.word 0xbf51c000  ! 569: RDPR_TL	<illegal instruction>
	.word 0xb3a58820  ! 574: FADDs	fadds	%f22, %f0, %f25
	.word 0xb7a58840  ! 575: FADDd	faddd	%f22, %f0, %f58
	.word 0xbf520000  ! 581: RDPR_PIL	<illegal instruction>
	.word 0xbfa48840  ! 585: FADDd	faddd	%f18, %f0, %f62
	.word 0xbbabc820  ! 587: FMOVVC	fmovs	%fcc1, %f0, %f29
hwintr_1_29:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_29), 16, 16)) -> intp(1, 0, 33)
	setx	0x605c0d4600003bc0, %g1, %r10
	.word 0x839a8000  ! 592: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xbe4461ce  ! 596: ADDC_I	addc 	%r17, 0x01ce, %r31
	.word 0xb03460a7  ! 598: ORN_I	orn 	%r17, 0x00a7, %r24
	.word 0xb1aa0820  ! 600: FMOVA	fmovs	%fcc1, %f0, %f24
	.word 0xbd2c4000  ! 602: SLL_R	sll 	%r17, %r0, %r30
	.word 0xbfaa0820  ! 604: FMOVA	fmovs	%fcc1, %f0, %f31
	setx	data_start_4, %g1, %r17
	.word 0xbba50940  ! 608: FMULd	fmuld	%f20, %f0, %f60
	.word 0x87946158  ! 609: WRPR_TT_I	wrpr	%r17, 0x0158, %tt
	.word 0xb22cc000  ! 612: ANDN_R	andn 	%r19, %r0, %r25
	.word 0x8d942130  ! 613: WRPR_PSTATE_I	wrpr	%r16, 0x0130, %pstate
	.word 0xbbaa8820  ! 615: FMOVG	fmovs	%fcc1, %f0, %f29
	.word 0xbda408e0  ! 617: FSUBq	dis not found

	.word 0xbdaac820  ! 618: FMOVGE	fmovs	%fcc1, %f0, %f30
	.word 0xbf518000  ! 623: RDPR_PSTATE	<illegal instruction>
	.word 0xb7a00040  ! 624: FMOVd	fmovd	%f0, %f58
	.word 0xb5a408e0  ! 628: FSUBq	dis not found

	.word 0xb8258000  ! 632: SUB_R	sub 	%r22, %r0, %r28
	.word 0xb835c000  ! 634: SUBC_R	orn 	%r23, %r0, %r28
	.word 0xbb504000  ! 636: RDPR_TNPC	<illegal instruction>
	.word 0xb9a80420  ! 638: FMOVRZ	dis not found

	setx	0xd1b150200009947, %g1, %r10
	.word 0x819a8000  ! 639: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
hwintr_1_30:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_30), 16, 16)) -> intp(1, 0, c)
	.word 0xbda00560  ! 642: FSQRTq	fsqrt	
	.word 0xb3a4c9c0  ! 644: FDIVd	fdivd	%f50, %f0, %f56
	.word 0xb3a00520  ! 646: FSQRTs	fsqrt	
	.word 0xb5504000  ! 647: RDPR_TNPC	<illegal instruction>
	setx	data_start_4, %g1, %r17
	.word 0xb1508000  ! 650: RDPR_TSTATE	<illegal instruction>
	setx	0xc50a40850000bf10, %g1, %r10
	.word 0x819a8000  ! 652: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	setx	0xbc8bc2a0000e8c5, %g1, %r10
	.word 0x839a8000  ! 653: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb53c2001  ! 656: SRA_I	sra 	%r16, 0x0001, %r26
	.word 0xbf540000  ! 660: RDPR_GL	<illegal instruction>
	.word 0xbba00020  ! 661: FMOVs	fmovs	%f0, %f29
	.word 0xb3aa8820  ! 665: FMOVG	fmovs	%fcc1, %f0, %f25
	.word 0xb7a00520  ! 675: FSQRTs	fsqrt	
	.word 0xbba5c9c0  ! 679: FDIVd	fdivd	%f54, %f0, %f60
	.word 0xb3a588a0  ! 682: FSUBs	fsubs	%f22, %f0, %f25
	.word 0xb9510000  ! 683: RDPR_TICK	<illegal instruction>
	.word 0xbda81c20  ! 684: FMOVRGEZ	dis not found

	.word 0xbba00520  ! 686: FSQRTs	fsqrt	
	.word 0xb9a00040  ! 692: FMOVd	fmovd	%f0, %f28
	.word 0xbda4c840  ! 694: FADDd	faddd	%f50, %f0, %f30
	.word 0xb5aa4820  ! 697: FMOVNE	fmovs	%fcc1, %f0, %f26
	mov	2, %r12
	.word 0x8f930000  ! 698: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xb7a80c20  ! 701: FMOVRLZ	dis not found

	.word 0xbd518000  ! 702: RDPR_PSTATE	<illegal instruction>
hwintr_1_31:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_31), 16, 16)) -> intp(1, 0, f)
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xbda84820  ! 710: FMOVE	fmovs	%fcc1, %f0, %f30
	setx	0x7704f3b400005e9a, %g1, %r10
	.word 0x839a8000  ! 711: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb1a98820  ! 712: FMOVNEG	fmovs	%fcc1, %f0, %f24
	.word 0xb9aac820  ! 714: FMOVGE	fmovs	%fcc1, %f0, %f28
	.word 0xb52db001  ! 718: SLLX_I	sllx	%r22, 0x0001, %r26
	.word 0xbfa58860  ! 719: FADDq	dis not found

	.word 0xbda4c8e0  ! 720: FSUBq	dis not found

	.word 0xb7a548c0  ! 721: FSUBd	fsubd	%f52, %f0, %f58
	.word 0xb7aac820  ! 723: FMOVGE	fmovs	%fcc1, %f0, %f27
	.word 0xbba80820  ! 725: FMOVN	fmovs	%fcc1, %f0, %f29
	.word 0xbba449a0  ! 726: FDIVs	fdivs	%f17, %f0, %f29
	.word 0x8794a068  ! 729: WRPR_TT_I	wrpr	%r18, 0x0068, %tt
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb7480000  ! 734: RDHPR_HPSTATE	rdhpr	%hpstate, %r27
	.word 0xb5359000  ! 735: SRLX_R	srlx	%r22, %r0, %r26
	.word 0xb1a4c840  ! 736: FADDd	faddd	%f50, %f0, %f24
	.word 0xb7abc820  ! 738: FMOVVC	fmovs	%fcc1, %f0, %f27
hwintr_1_32:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_32), 16, 16)) -> intp(1, 0, 36)
	.word 0xbba589e0  ! 740: FDIVq	dis not found

hwintr_1_33:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_33), 16, 16)) -> intp(1, 0, 2f)
	.word 0xb1a50840  ! 743: FADDd	faddd	%f20, %f0, %f24
	.word 0xb1510000  ! 745: RDPR_TICK	<illegal instruction>
hwintr_1_34:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_34), 16, 16)) -> intp(1, 0, 38)
	.word 0x8d95a051  ! 748: WRPR_PSTATE_I	wrpr	%r22, 0x0051, %pstate
	.word 0xbdab4820  ! 753: FMOVCC	fmovs	%fcc1, %f0, %f30
	setx	data_start_2, %g1, %r17
	.word 0xb5a88820  ! 755: FMOVLE	fmovs	%fcc1, %f0, %f26
	.word 0xb9a00040  ! 756: FMOVd	fmovd	%f0, %f28
	.word 0x83946162  ! 757: WRPR_TNPC_I	wrpr	%r17, 0x0162, %tnpc
	.word 0x919520ec  ! 758: WRPR_PIL_I	wrpr	%r20, 0x00ec, %pil
hwintr_1_35:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_35), 16, 16)) -> intp(1, 0, 26)
	.word 0xb7ab4820  ! 764: FMOVCC	fmovs	%fcc1, %f0, %f27
	.word 0xb9a548c0  ! 766: FSUBd	fsubd	%f52, %f0, %f28
	.word 0x8394a002  ! 768: WRPR_TNPC_I	wrpr	%r18, 0x0002, %tnpc
	.word 0xb1500000  ! 778: RDPR_TPC	<illegal instruction>
	setx	data_start_0, %g1, %r19
	setx	0xdb3147d20000ab94, %g1, %r10
	.word 0x819a8000  ! 780: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0x839561eb  ! 781: WRPR_TNPC_I	wrpr	%r21, 0x01eb, %tnpc
	.word 0xbda81420  ! 785: FMOVRNZ	dis not found

	.word 0xb1aa0820  ! 786: FMOVA	fmovs	%fcc1, %f0, %f24
	.word 0xbda80820  ! 787: FMOVN	fmovs	%fcc1, %f0, %f30
	.word 0xb7aa8820  ! 790: FMOVG	fmovs	%fcc1, %f0, %f27
	.word 0xb2c56050  ! 792: ADDCcc_I	addccc 	%r21, 0x0050, %r25
hwintr_1_36:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_36), 16, 16)) -> intp(1, 0, 0)
	setx	0x20374f370000ea04, %g1, %r10
	.word 0x839a8000  ! 794: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xbba00560  ! 796: FSQRTq	fsqrt	
	.word 0xbba81420  ! 802: FMOVRNZ	dis not found

	.word 0xbba90820  ! 803: FMOVLEU	fmovs	%fcc1, %f0, %f29
	.word 0xb9480000  ! 804: RDHPR_HPSTATE	rdhpr	%hpstate, %r28
	.word 0xb7a81c20  ! 806: FMOVRGEZ	dis not found

	.word 0xbda8c820  ! 812: FMOVL	fmovs	%fcc1, %f0, %f30
hwintr_1_37:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_37), 16, 16)) -> intp(1, 0, 7)
	.word 0xb1aac820  ! 814: FMOVGE	fmovs	%fcc1, %f0, %f24
	.word 0xb5aa4820  ! 815: FMOVNE	fmovs	%fcc1, %f0, %f26
	.word 0xb1510000  ! 816: RDPR_TICK	<illegal instruction>
	.word 0xb5a8c820  ! 817: FMOVL	fmovs	%fcc1, %f0, %f26
	.word 0xb5a448a0  ! 818: FSUBs	fsubs	%f17, %f0, %f26
	.word 0xbfa00520  ! 820: FSQRTs	fsqrt	
hwintr_1_38:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_38), 16, 16)) -> intp(1, 0, 1c)
	.word 0xbfa54920  ! 827: FMULs	fmuls	%f21, %f0, %f31
hwintr_1_39:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_39), 16, 16)) -> intp(1, 0, 3e)
	.word 0xb72cc000  ! 829: SLL_R	sll 	%r19, %r0, %r27
	setx	data_start_0, %g1, %r21
	.word 0xbdab8820  ! 839: FMOVPOS	fmovs	%fcc1, %f0, %f30
	.word 0xb1a9c820  ! 841: FMOVVS	fmovs	%fcc1, %f0, %f24
	.word 0xbc2ce02f  ! 842: ANDN_I	andn 	%r19, 0x002f, %r30
	.word 0xb5ab8820  ! 847: FMOVPOS	fmovs	%fcc1, %f0, %f26
	.word 0x8995e0bf  ! 850: WRPR_TICK_I	wrpr	%r23, 0x00bf, %tick
	.word 0xbda4c920  ! 852: FMULs	fmuls	%f19, %f0, %f30
	.word 0xb0b50000  ! 853: SUBCcc_R	orncc 	%r20, %r0, %r24
	.word 0xbda88820  ! 856: FMOVLE	fmovs	%fcc1, %f0, %f30
	.word 0xb5a549c0  ! 858: FDIVd	fdivd	%f52, %f0, %f26
	.word 0xbfaa0820  ! 861: FMOVA	fmovs	%fcc1, %f0, %f31
	.word 0xbda81820  ! 862: FMOVRGZ	fmovs	%fcc3, %f0, %f30
	.word 0xbda548a0  ! 867: FSUBs	fsubs	%f21, %f0, %f30
	.word 0x8994e13c  ! 873: WRPR_TICK_I	wrpr	%r19, 0x013c, %tick
	.word 0xb5a4c9a0  ! 874: FDIVs	fdivs	%f19, %f0, %f26
	.word 0xb1a54840  ! 877: FADDd	faddd	%f52, %f0, %f24
hwintr_1_40:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_40), 16, 16)) -> intp(1, 0, 3)
	.word 0xbda00040  ! 886: FMOVd	fmovd	%f0, %f30
	.word 0xb7a548e0  ! 897: FSUBq	dis not found

	.word 0xb7a449c0  ! 898: FDIVd	fdivd	%f48, %f0, %f58
hwintr_1_41:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_41), 16, 16)) -> intp(1, 0, 2a)
	.word 0xb7a5c960  ! 901: FMULq	dis not found

	.word 0xbaada062  ! 902: ANDNcc_I	andncc 	%r22, 0x0062, %r29
	.word 0xb9a50860  ! 906: FADDq	dis not found

	.word 0xbda80c20  ! 908: FMOVRLZ	dis not found

	setx	0x3cb37a21000008dc, %g1, %r10
	.word 0x819a8000  ! 910: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xbda84820  ! 913: FMOVE	fmovs	%fcc1, %f0, %f30
	.word 0xbba50940  ! 916: FMULd	fmuld	%f20, %f0, %f60
	.word 0xb1a00560  ! 917: FSQRTq	fsqrt	
	.word 0x879520a3  ! 921: WRPR_TT_I	wrpr	%r20, 0x00a3, %tt
	.word 0xbfa588a0  ! 929: FSUBs	fsubs	%f22, %f0, %f31
	.word 0xb7a81820  ! 935: FMOVRGZ	fmovs	%fcc3, %f0, %f27
	.word 0xbe044000  ! 939: ADD_R	add 	%r17, %r0, %r31
	setx	data_start_2, %g1, %r21
	.word 0xbbaa8820  ! 941: FMOVG	fmovs	%fcc1, %f0, %f29
	.word 0xb751c000  ! 942: RDPR_TL	<illegal instruction>
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb551c000  ! 944: RDPR_TL	<illegal instruction>
	.word 0xb1a81420  ! 945: FMOVRNZ	dis not found

	.word 0xb9abc820  ! 947: FMOVVC	fmovs	%fcc1, %f0, %f28
	.word 0xb7a4c840  ! 950: FADDd	faddd	%f50, %f0, %f58
	.word 0xbdab4820  ! 952: FMOVCC	fmovs	%fcc1, %f0, %f30
	.word 0xb5a00560  ! 953: FSQRTq	fsqrt	
	setx	0x1f4f8fdd00009890, %g1, %r10
	.word 0x819a8000  ! 954: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xbdab0820  ! 955: FMOVGU	fmovs	%fcc1, %f0, %f30
	.word 0xb5a5c960  ! 958: FMULq	dis not found

	.word 0xb9a589e0  ! 961: FDIVq	dis not found

	.word 0xbd520000  ! 964: RDPR_PIL	<illegal instruction>
	.word 0xb7a4c940  ! 970: FMULd	fmuld	%f50, %f0, %f58
	.word 0xb750c000  ! 971: RDPR_TT	<illegal instruction>
	.word 0xbc3d613f  ! 972: XNOR_I	xnor 	%r21, 0x013f, %r30
	.word 0xb02560c3  ! 974: SUB_I	sub 	%r21, 0x00c3, %r24
	.word 0xb5a94820  ! 975: FMOVCS	fmovs	%fcc1, %f0, %f26
	.word 0xb3a88820  ! 977: FMOVLE	fmovs	%fcc1, %f0, %f25
	.word 0xb62de0a5  ! 982: ANDN_I	andn 	%r23, 0x00a5, %r27
	.word 0xb750c000  ! 984: RDPR_TT	<illegal instruction>
	.word 0xb9a00540  ! 988: FSQRTd	fsqrt	
	.word 0xb9a44860  ! 989: FADDq	dis not found

hwintr_1_42:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_42), 16, 16)) -> intp(1, 0, 4)
	.word 0xb1a80420  ! 998: FMOVRZ	dis not found


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

	.xword	0x405aaa98f7744390
	.xword	0x725a2b1a43c944fe
	.xword	0x4548f2fd00e0653b
	.xword	0x05a8a8a921641ba0
	.xword	0x6466a24d1a99f1c0
	.xword	0x9cc2039c488ec353
	.xword	0x00b2b8ec2cb29ed9
	.xword	0x6e41b167209b4bfd
	.xword	0xb4845e795cc60ccc
	.xword	0x1a22455d76bb3802
	.xword	0x93949b714b9c438d
	.xword	0x8ce1300b620785ac
	.xword	0x9f5589c3fd63139c
	.xword	0x80af9d47e959b6d2
	.xword	0x49e3a219863aa9a6
	.xword	0xad314026eee2cc8d
	.xword	0x2e54f45ab640327c
	.xword	0xab77d714dca4c8d4
	.xword	0x65a2cfd2a008b4e0
	.xword	0x29932f6ac6fb2a74
	.xword	0xbf2fef54a7fba4b1
	.xword	0xde0ce9673163cc63
	.xword	0x22f230612bd8d14d
	.xword	0xec4b6473378f3181
	.xword	0x6aa5437034a6221b
	.xword	0xe9a9c44ec78e4d1a
	.xword	0x9173a71cba785dc0
	.xword	0x40373cfe74ef5ea1
	.xword	0x19d3bcc83e5dda98
	.xword	0x9da5e083c19b8905
	.xword	0x53ec323757310941
	.xword	0x7932d971c23d526b
	.xword	0x30b86978b37a1675
	.xword	0x198225146e49166e
	.xword	0x072d4d1756c72583
	.xword	0x0b702c6eb6b828d0
	.xword	0x47638a02a062df16
	.xword	0x94c48d6406ded335
	.xword	0xec7bb0215369a8d3
	.xword	0x71f2f50928565180
	.xword	0x6bdd61cf1781f275
	.xword	0x48e07e3cc6055665
	.xword	0x988cff007b05c9a2
	.xword	0x0a203daeea7ba74e
	.xword	0x64fdd1ea217f5bcf
	.xword	0x7d011ac12bc431ce
	.xword	0xe0a826da7464bf3c
	.xword	0x2d6fd71831f3e1ea
	.xword	0xb2d4194018683862
	.xword	0xe441b7913819a334
	.xword	0xbd9131c85bfdd737
	.xword	0xa3ed4afae4cb8823
	.xword	0x3a17cb57d2e5a04f
	.xword	0x6bb1186ffed5a907
	.xword	0x6ec645077a260bfb
	.xword	0xaccf5a19b4bee25e
	.xword	0x0ecd17dfd6760d48
	.xword	0x2fb270cbc7532185
	.xword	0xea3016075419a360
	.xword	0x954d40d2e8ffc169
	.xword	0x3e4a60e97df4342d
	.xword	0x602d292d91b3251f
	.xword	0xff6bb060ea53974e
	.xword	0x1c06c1708b587596
	.xword	0x4cff0da4c6e3f957
	.xword	0xcdb48f7ddc187f4f
	.xword	0x63d1bcecbb720a02
	.xword	0x20aaaddfdaade9f4
	.xword	0xf872fe794ad0ba7f
	.xword	0x83dd1282a33bc0af
	.xword	0x222860505fcfba74
	.xword	0xb7e6717853124a8d
	.xword	0x08ea0478ef7db5ef
	.xword	0x97dd96436dcf817d
	.xword	0x337a19f933a71a92
	.xword	0xf517df7e33e19ea4
	.xword	0x28c4b2bd4a595e37
	.xword	0x6770a5306401bb7d
	.xword	0xe689668da1218b28
	.xword	0x44b41cb842b6f9de
	.xword	0xcf0f95cfea793e29
	.xword	0x2c8cc543e9a5a74b
	.xword	0x7223cf842ee27e43
	.xword	0xc1fbfc5053b4adcf
	.xword	0x726811cb5ed14dac
	.xword	0x91c9af1cb4c6ac71
	.xword	0x8d0875e30b627c66
	.xword	0xdba6b252934cb61e
	.xword	0x1797d18682f6b442
	.xword	0xb001ee2752ed7f03
	.xword	0x466c0c732fe33d70
	.xword	0x31eec90a0577b376
	.xword	0x55be68e3ba82bc47
	.xword	0xd80a21fadaaa7b72
	.xword	0x9e1b2f530ea280ca
	.xword	0x98acfc30d5cf9cab
	.xword	0x9127105af4a91288
	.xword	0x7b51462c932afdd8
	.xword	0x7bbd358895aeab1d
	.xword	0x90aeefc331220fea
	.xword	0x92090c31a0d49449
	.xword	0x227b8b4517ee609f
	.xword	0xbdd91f041ffe1065
	.xword	0x5b817f4cc75e107b
	.xword	0x3a4cb1fa29f9e4b8
	.xword	0xd6e4277d836f9bc7
	.xword	0xa7be4e05613213f1
	.xword	0x00a8ed75421cde41
	.xword	0xc1013356ed5f239f
	.xword	0x0bc07e39d2f99d6d
	.xword	0x6a6d3051f9deb1c9
	.xword	0x6958ef97d3379f96
	.xword	0x9369ec5b3f32e376
	.xword	0x63c847d0d8f49530
	.xword	0xb36369643a2fb204
	.xword	0x1e625d23ebbe35fa
	.xword	0x19902dea2bdfbe5e
	.xword	0x5f006a3df1c329a6
	.xword	0x18c7ab61d588ea3f
	.xword	0x7e9c3ace64462bc9
	.xword	0x02a2c23399ea2120
	.xword	0x26033d08de4d135f
	.xword	0x4220a40e23bc69b0
	.xword	0xaa588773c3433635
	.xword	0x75681f02e757ae4e
	.xword	0x9826a66f77fa62c1
	.xword	0x46a817932561df4b
	.xword	0x8a51e034caadbd70
	.xword	0x5d14698eb5e2ee5b
	.xword	0x31f71a34a117ed77
	.xword	0xadc451803395a529
	.xword	0xa6240c3275e6ad33
	.xword	0xdba0c6b5f5640520
	.xword	0xff90d612008f1b47
	.xword	0x4b56c677bdd8e138
	.xword	0xbd08cb04ac027060
	.xword	0xc2b988583cad3a08
	.xword	0xf821e1cf7a1df48b
	.xword	0x01463ba1392604d8
	.xword	0x0b30cf87fb37b490
	.xword	0x56a16f4b39269ea2
	.xword	0xf721032efd193399
	.xword	0xdad1289523e793c4
	.xword	0xb6704d5bde813190
	.xword	0x3c771ccebd5fbddf
	.xword	0xb8c22c87bbb8bc86
	.xword	0x338efcc6e9fa8c25
	.xword	0x7e377524dbd3b484
	.xword	0x840ac0428b68b813
	.xword	0x3c0e1027cebe0eab
	.xword	0x22fb349fabdf7003
	.xword	0x973f7d863c3d842c
	.xword	0x24620631ca4a30f5
	.xword	0x13490c19ef5c7d9f
	.xword	0x824d8d57d710dde9
	.xword	0x6b63aefc80a21395
	.xword	0x7bcc9838abca5fe2
	.xword	0x29dbb65b047907c8
	.xword	0x2c8e2ad4c9eaa405
	.xword	0xa2cb4ba0a8e6f380
	.xword	0x1bb2ff3d153f878e
	.xword	0x26e181037328488c
	.xword	0x4652c0090c29adc9
	.xword	0x5234f7483caef86d
	.xword	0xd03c7b15a2ee5d3a
	.xword	0x427cc2a545633dbf
	.xword	0xc48a8ee6de306797
	.xword	0xd8702d74944d97cd
	.xword	0x016566a49bcd5d43
	.xword	0x740de38217c83584
	.xword	0x1fb3c702cf3aecd6
	.xword	0xa52d2938d59d6b3e
	.xword	0x311064ed151dd17e
	.xword	0xb19adb388ed3bda4
	.xword	0x25168a470aa34d72
	.xword	0xe71979b20866e0b6
	.xword	0x4702a9819a64c24d
	.xword	0x9fb978e93fdf7a52
	.xword	0x2ac3159de63c80da
	.xword	0x7f8db75211e4d6ad
	.xword	0x46b5480e8b83585d
	.xword	0xe2a2f10b8572e46a
	.xword	0x5c29c2ddb30a66bd
	.xword	0x7285a0db3668e8fb
	.xword	0xedbd1b3141cea75f
	.xword	0xd43da71ad2bae743
	.xword	0xeb15a3a759bde2ae
	.xword	0x21c2291722f8bda2
	.xword	0xe0c466e43979a93b
	.xword	0xdccc85f18f1bed76
	.xword	0xc022e688b7b5a8ed
	.xword	0x8a111dd361324c76
	.xword	0x224d1e756253a8e7
	.xword	0x179550ef5a4eb691
	.xword	0x6d9d18a90e974543
	.xword	0x848a8da291b2949d
	.xword	0x6daeb48bcb278a18
	.xword	0x731887b90f974ef4
	.xword	0xa708930716ed78a5
	.xword	0xda7dbaaac436d9fa
	.xword	0x0e67ad0010518838
	.xword	0x30ac85bdc74b8f18
	.xword	0x90a8541826f0de04
	.xword	0x12f031b74f071942
	.xword	0x7a8927fb1835278d
	.xword	0x48d0b10a0134edf3
	.xword	0xcda699695484dd47
	.xword	0x4fedbccdb01ca392
	.xword	0xad834dd6c2ee6111
	.xword	0xae6509b388401322
	.xword	0x4f97721fcfc4ad77
	.xword	0x0b4082dac2b42bd4
	.xword	0xfa85283936463f81
	.xword	0x904b1bba49561769
	.xword	0x3d3b43a7e3a2c9cc
	.xword	0x1a9f93dea53bea41
	.xword	0x35d46aec9ea5dabe
	.xword	0xdeda8436dd36d384
	.xword	0x931fb0f1272752e2
	.xword	0xdf66a61f25683cab
	.xword	0x03cb1d753700a267
	.xword	0xca16b3d1f1dedf54
	.xword	0x11f6a6a256f83427
	.xword	0x4aadf95fdc8c4b96
	.xword	0xdb934b465696ae2d
	.xword	0xce78b6d36492fd5c
	.xword	0xd559523ba8cd615f
	.xword	0x48710c58f976dba4
	.xword	0xc4a312e12904b9f2
	.xword	0xdf9b5ffefd1cf9d5
	.xword	0x8e300218e0caaf26
	.xword	0xe0053a644126f51a
	.xword	0x5083bdf18701e101
	.xword	0x2fd2112880da2e26
	.xword	0x44e91d16e9f86d24
	.xword	0xcd18c767db27641e
	.xword	0xa7682974e48bb19b
	.xword	0x72fba92cfaa2b229
	.xword	0x90ff133a70f1ca1f
	.xword	0x708048622985a945
	.xword	0xb796a5deb13a57c8
	.xword	0x11c8c0ebdca068d0
	.xword	0xc822003c8953ca13
	.xword	0x369c80a01a44f7fd
	.xword	0xec779f0b986bb5aa
	.xword	0x86ae611bdeecc30d
	.xword	0xb313e2bdc8d27976
	.xword	0x683fba76597fff1d
	.xword	0x62a795cec1b34315
	.xword	0x698a31abbac3b9da
	.xword	0x90a8cf36e0900c7d
	.xword	0xc80b179b74a1c581
	.xword	0xdb07fb952aa427b8
	.xword	0x5895051691b035a6
	.xword	0xdfdecdc1e15d22bf
	.xword	0xe4a45ca13a178512
	.align 0x2000
	.data
data_start_1:

	.xword	0xfbef20407a390094
	.xword	0x8d0131c97a065646
	.xword	0x7382a6e0b1f5aef0
	.xword	0x6a81d8f3f22ebce9
	.xword	0x047bc6f61e7a0711
	.xword	0x37c134bc225c5322
	.xword	0x3bf04c33d8e00c97
	.xword	0xde42829de472634b
	.xword	0x47b1193442030f0d
	.xword	0xf736d19ffd4975b9
	.xword	0x2682a42432bf5473
	.xword	0x72302e79be9c954b
	.xword	0xa326e73f073f9890
	.xword	0x4f9fbe7e5d1a1775
	.xword	0x3458419ed42de93a
	.xword	0xcaa6321554b08222
	.xword	0x7b1ed7631a8f940b
	.xword	0xfbd06e6c5bf94b06
	.xword	0x544fbca5f259f05c
	.xword	0x85218e505054db60
	.xword	0x60c08232fa3fcf4a
	.xword	0xb0592db1363a4caf
	.xword	0xa0a6ef6e71cf9160
	.xword	0x87a704eb80e146f4
	.xword	0xf1808bc69b246e2c
	.xword	0x2b128929c4ae7395
	.xword	0xe474c2db6d582948
	.xword	0x1b69e8e317aa8d68
	.xword	0xf976b7360b715834
	.xword	0x9e0c8dac6f2f69bb
	.xword	0x0e6a9c9719bd4849
	.xword	0xf0a194c12ba920e5
	.xword	0xf50794f356a4d409
	.xword	0x02fb1c3f90a2a511
	.xword	0xc47949f3693aa009
	.xword	0x485c437f7331a1ad
	.xword	0x8196d81f8366b74e
	.xword	0x22929c64381d5fa3
	.xword	0x94e8dbd58a95a267
	.xword	0x99c946a886d26502
	.xword	0x1e7be1677f5ed331
	.xword	0x1b5f355d88e96a61
	.xword	0x81cba5aa2a347c4a
	.xword	0x750a4407ad3f34fd
	.xword	0x21a1b62c72d34a4a
	.xword	0xdeac90bcdb1ff305
	.xword	0xc9d3957e1d735c0f
	.xword	0xc529434b5b22b0e4
	.xword	0xac26ef99c131ee8d
	.xword	0x94812451c00564af
	.xword	0x02233a24815251e3
	.xword	0xfe86acb515af9d05
	.xword	0x30212b9c9f731424
	.xword	0xfee042ff3de3660e
	.xword	0xccfd2a2f4a13b2a7
	.xword	0xf635158c466772b7
	.xword	0xa0994f1d4233137c
	.xword	0x8fbc0bc971b27c59
	.xword	0x38da529bb61f9287
	.xword	0x396335e587be899d
	.xword	0xc27cb9fe7dfbc712
	.xword	0x35dcd45f99beb074
	.xword	0xf59f7d38bf904c70
	.xword	0x55e71a2d4415164b
	.xword	0x8570d9ce4586496e
	.xword	0x503f45297a99191c
	.xword	0x922236bb024a6972
	.xword	0x9d15a9fbaa61e562
	.xword	0xa926a8c2f51d8552
	.xword	0x18736b4ac9c8ac35
	.xword	0xe25847a79523e265
	.xword	0x41754bfc22f7067c
	.xword	0x44bc20fb187b3d53
	.xword	0x9910ff2370ba14a3
	.xword	0x1095eb5e3e2272b8
	.xword	0xb9177f81f2319a8b
	.xword	0xc128cd47ff97faa9
	.xword	0xe23080e7d10f5a7c
	.xword	0xc5e823bf618fed25
	.xword	0x5dbfbd59a54b6c84
	.xword	0x67795157dddf09c6
	.xword	0x07d98fafec0f0632
	.xword	0xe7a63ead3db8a631
	.xword	0xfd68c75a8a0e706b
	.xword	0xfce6bce75dce9872
	.xword	0x365a9c45cdc5b3ff
	.xword	0x6cd82441f3115fd3
	.xword	0xc5dd198fc11ab12d
	.xword	0x8271112670ef9653
	.xword	0x514c22d9f9d66a47
	.xword	0xbf86b7fb4b3128cf
	.xword	0x729a14e0b22533a5
	.xword	0x1073cd273f054548
	.xword	0x584f4126c1949897
	.xword	0x2f5cf472ab8253b7
	.xword	0x49ff3980ca00d86b
	.xword	0x4be9856a37c4d7be
	.xword	0xb62f6e777c7c38a8
	.xword	0x261973f3bbb5ab4a
	.xword	0xb1f5d63633cf756e
	.xword	0x82a313ab2baab81c
	.xword	0x522fa13b0d04edca
	.xword	0xbb5ab8f4eed1be66
	.xword	0x094fc5b388eafc69
	.xword	0x2fa1077ebef87687
	.xword	0xe700283408406ea9
	.xword	0x2de0e81c2871dc47
	.xword	0xb228adb305f12245
	.xword	0xda125a0edefd06fe
	.xword	0x295d5cdeec58e5a5
	.xword	0x635acc952a44bd58
	.xword	0x4fe75b416977a4ef
	.xword	0xcfcdc5034d290897
	.xword	0x10418d79729c6f82
	.xword	0xf2c5e93eb953398a
	.xword	0xc41da0356fc1b4bd
	.xword	0x539fc5a3170d2d34
	.xword	0xe8a583535bde0dd8
	.xword	0x767be015bb3148a1
	.xword	0x16d2833ee44e1a04
	.xword	0xd234a162c2005154
	.xword	0x68e5f9f289fc2198
	.xword	0x806be9e25f842c51
	.xword	0x99d0ec397486b1a7
	.xword	0xe9d88076c1033903
	.xword	0x959d917da291a40b
	.xword	0x5e99e517e64abef5
	.xword	0x05bb08a2649d3cf9
	.xword	0x2bf22d4a762707cb
	.xword	0x100ed85f8fa7b8cf
	.xword	0xde5ba56060a40ad5
	.xword	0xdd864ae2c0f2385e
	.xword	0xbc88838ea7aeea18
	.xword	0xe597525f20216153
	.xword	0xaa2af54075009692
	.xword	0x6e2e4e41a716378b
	.xword	0x437bfa3f7d21d64b
	.xword	0x11e00d484bed09b2
	.xword	0x7f99b3e19c1ac15c
	.xword	0x648f46037fc7ab62
	.xword	0x02c7bf06a3ff4ece
	.xword	0x971288ba892c6c84
	.xword	0xba6fcb736fb5220a
	.xword	0xfd76fd90900aeaec
	.xword	0xfeef900b09f05d21
	.xword	0x26f50826067e6c46
	.xword	0xd2ce70150afa9908
	.xword	0xc02119999bf9a65e
	.xword	0xd16c3efea54be68d
	.xword	0x3ebd9f71d3c90ea9
	.xword	0xb9caefddbca50e0a
	.xword	0x3348616a63126880
	.xword	0xe71d966a51aec9ef
	.xword	0xe66c2c3ea6da928d
	.xword	0x722fbb855fff2fbe
	.xword	0xc26eb97d9b40b97e
	.xword	0xd32143903621f7c3
	.xword	0xcbb5fa2e8eb2d898
	.xword	0xb261b083d865deda
	.xword	0x85b1f050a855dc11
	.xword	0x2805b8aa453b8b9a
	.xword	0x3b33c97e8908af61
	.xword	0x694ed32a592b43b2
	.xword	0x13b42f9c6e9979bf
	.xword	0xe2ab189c86699e07
	.xword	0xb5e084bd574b897f
	.xword	0xd758bd60b9fc9933
	.xword	0x6d1ef93d6ead0147
	.xword	0x68335b212c0f2907
	.xword	0xaa2906995b8cb18d
	.xword	0xa79d88758054e4db
	.xword	0xab689046a5f10cf1
	.xword	0x4cf8ae80967910f1
	.xword	0x17e7df6ce3afd4ab
	.xword	0xfb43f9ee6638daea
	.xword	0x71220aeae7aca46d
	.xword	0x3072c1042ae340cc
	.xword	0x171126994d0c272a
	.xword	0x4c60f35a877a04b8
	.xword	0xa53bba91e080d071
	.xword	0x12b82e002119a6f9
	.xword	0x8dae1e5a86821d88
	.xword	0xc75db4f2e0b55071
	.xword	0x98aa72f5b927a154
	.xword	0xe2d2e455ebdcdbba
	.xword	0x372886a1245c1fbe
	.xword	0xb53fe0a8974af7aa
	.xword	0x7cb2e94c3b85f53d
	.xword	0xcbb8d8ca9b559ee7
	.xword	0xd1ade12f909f59a7
	.xword	0x61cf06f98280e42f
	.xword	0xeeb30f0a74e8c05d
	.xword	0x3df2b2bc275fe4a4
	.xword	0x489dc9377d95d94c
	.xword	0x329ab2d59567790b
	.xword	0x335cfe2f03bb6d5d
	.xword	0xf00e735874e3f67d
	.xword	0xa1ef3f3d1c8e5041
	.xword	0x0b82d89e8d1f0d67
	.xword	0x0797b444457935d3
	.xword	0xcc3f5552365b8c5a
	.xword	0xfaa3ef50660bc1a3
	.xword	0xd42a05b6b69b536b
	.xword	0xc9f3293f48c0f299
	.xword	0x8dea37cd8ecb45f0
	.xword	0x57a2e09bbf275273
	.xword	0xe2e6b277d00397fa
	.xword	0x84903274316b7041
	.xword	0xba07cd8717442a76
	.xword	0x1d09c54b66ce34a3
	.xword	0xb1c180cebde48604
	.xword	0x59f5bf54a8f43058
	.xword	0xbfe5fec66b83c7fd
	.xword	0x078e53f4c6a38069
	.xword	0x6c9b80d5637a7e8f
	.xword	0x4751a912f77aa3ce
	.xword	0x5177b58531acf64a
	.xword	0x8331646cc3fe7dc9
	.xword	0xb23f016df1fc7773
	.xword	0xa426479c68ebf490
	.xword	0x58850cb419fa3e9d
	.xword	0xa35a5d4a464f950f
	.xword	0x14ad49ccbf60684b
	.xword	0x4cc84e20eb9566e1
	.xword	0x2f6812efa1ac36b6
	.xword	0x58a330ae2dc77c03
	.xword	0x2e8bfed710790c15
	.xword	0x9bb42189028c4262
	.xword	0x0258f920a856559e
	.xword	0x298cfbd3c87d2c20
	.xword	0xb72c247d8d254c98
	.xword	0x97557a0995459ed2
	.xword	0xcd76e97c3d08e35e
	.xword	0x2376aec06220b981
	.xword	0x914b330fc5e68709
	.xword	0x7ea1baa983eb179c
	.xword	0x6302faf94adf4a4d
	.xword	0xb436fadda025e86c
	.xword	0x0dae77db78cae84c
	.xword	0x55842bd11ca4d792
	.xword	0x2592ee36c310fd5b
	.xword	0xf0f505bb83a6ba6a
	.xword	0xa73db8408616326c
	.xword	0x48faa59017977e97
	.xword	0x90bc7d62596930ed
	.xword	0x0e4b7f1c7f63dd59
	.xword	0x72c59f65948118b9
	.xword	0xd1f3dc3554435027
	.xword	0xb4e8e593d5cdd6c4
	.xword	0xc0fd18e621d4c2a5
	.xword	0x7abf1bc2c91324b3
	.xword	0x3e88f5313b19b4d8
	.xword	0x0471f574ad46e5a9
	.xword	0x74bce0fbce07f395
	.xword	0xad9086c38af2113c
	.xword	0x536ca3ea29299cb9
	.align 0x4000
	.data
data_start_2:

	.xword	0xc5bda2950e897955
	.xword	0xe0710f5e2b77869a
	.xword	0x5e568bc6e584cfda
	.xword	0x55ac1483f97348ea
	.xword	0x3030aab3166e946a
	.xword	0x6c1da291f51f0a05
	.xword	0x5482049b7574617a
	.xword	0x2ace901521f061b4
	.xword	0x9b59c2af41e449da
	.xword	0x87904cd353eccbbe
	.xword	0x25c50764671a919c
	.xword	0xdb9376568f13df89
	.xword	0x4dd703f2fffd734a
	.xword	0x76d526ebd3af047b
	.xword	0xedc8c55c660931f0
	.xword	0xc35b8f1d59180623
	.xword	0x1bc2edcd6dec248e
	.xword	0xf846319d6bb87db4
	.xword	0x410fd7101f3da47e
	.xword	0x25e776c709510dcf
	.xword	0xa84c21094095e5e1
	.xword	0xcdff266892377ed0
	.xword	0xca4be99d1e972038
	.xword	0xd9c5892320676f99
	.xword	0xb919e2c7337198ae
	.xword	0x034dc4cdacd81951
	.xword	0x5af894d43c844221
	.xword	0x748ced2fd31df6db
	.xword	0xac097c22aeaf2551
	.xword	0xb26f64d9edd02ea7
	.xword	0x358d452091ab016d
	.xword	0x355e38c39210ddb0
	.xword	0x9295510c2d244b26
	.xword	0x41679bfdbe6a8b40
	.xword	0xe908420741ffed57
	.xword	0x1e956aac9d33213f
	.xword	0x7cf1d5c4d3c80ad5
	.xword	0x754c1730dd33f826
	.xword	0x1e01427964f3e1c6
	.xword	0x31f81faa6bf5b738
	.xword	0x8ff0fa26e1c0c711
	.xword	0xaa1fa5aea2182b40
	.xword	0x67f7f1bab817e328
	.xword	0x446e3abeecd2b38a
	.xword	0x5ab13570e26dd72e
	.xword	0x0b7cae35e0f09253
	.xword	0x19d11a6ec8d6a1cb
	.xword	0x7262231c81707610
	.xword	0x2039cc2facb146fc
	.xword	0xaf8835e11115a0fe
	.xword	0xb79ae16361eb5e83
	.xword	0xbfd5fde45773cdfa
	.xword	0xb2b2a54d6a3583e1
	.xword	0x4ca590c654f0b524
	.xword	0x617f692a7f9fd67f
	.xword	0x557d984e104bec70
	.xword	0xf78a0a49fbc21d13
	.xword	0x125746430034084c
	.xword	0xa62b48a8b02425f9
	.xword	0x6aa5564643372f89
	.xword	0x0b3ecb321a9d005d
	.xword	0x14dba46d288d6135
	.xword	0xbc3e613b78fa845d
	.xword	0x3431c1eb83174de2
	.xword	0x38c3a18d148df0fe
	.xword	0x223b590f2749e093
	.xword	0x1b4395a309e801f2
	.xword	0xb19ca9dbe5940fd3
	.xword	0xab88cfccd64c1ceb
	.xword	0x1232af92f49970fa
	.xword	0xcc542c7134cd99ab
	.xword	0xdd52a96ab66a2a20
	.xword	0xb736434d2d844380
	.xword	0x5f90057c3aa08635
	.xword	0x839809be9420125b
	.xword	0xf16b292ad76cd2aa
	.xword	0x371905ac37a084d4
	.xword	0xfe808ab781a1ec4e
	.xword	0x75918725614efa90
	.xword	0x723294cdd9b6f63e
	.xword	0x89dadae339030d4f
	.xword	0x7f7aaf73a6af78d6
	.xword	0xbc8808c3a70c50bd
	.xword	0x34ae019bc67eadf0
	.xword	0x196065112baf45bc
	.xword	0x61e62565c36486d1
	.xword	0x38f8ad22f0ff1da6
	.xword	0x70668103486426f7
	.xword	0x88dde381f2f07e86
	.xword	0x33665289439c509d
	.xword	0x9834cd1e21891ab5
	.xword	0xc92a304dcfcea55f
	.xword	0x9c9ea56ea5a1cbcf
	.xword	0xd253115148bd7a71
	.xword	0x49407972a57a1a45
	.xword	0xfbe59cf7a5545ccd
	.xword	0x2c9333cd807aac85
	.xword	0xb803e4b2de299ff2
	.xword	0xa88aaa0ca7029d74
	.xword	0x88c4abbf7171d925
	.xword	0xfedfdf7b3b796e88
	.xword	0x894982f0be28a215
	.xword	0x3b4f674f08f62b23
	.xword	0x895c724bbd49bbfb
	.xword	0xcc7f81b0debaf207
	.xword	0x7d9621f561f9817b
	.xword	0x9431abfd3e4ced1c
	.xword	0x3ebc8a5fe966d618
	.xword	0x4b688eb1da29a505
	.xword	0x172b45cc5c4b7227
	.xword	0xb25dd411e977689d
	.xword	0x348740c147d5cd0e
	.xword	0x304c502e94cba448
	.xword	0x16c17a473d96143f
	.xword	0x77425882683c5b91
	.xword	0xdf5668a73764be66
	.xword	0xe5d2557a56ad4508
	.xword	0x72ce26c52d08141d
	.xword	0xe3f783630f846267
	.xword	0xb488edeaa9433fc7
	.xword	0x71ac44add7bff71c
	.xword	0x234a1cdbc0a4102b
	.xword	0xc7b9962f95ed74b5
	.xword	0x38ee0eddf77ed9d1
	.xword	0xf84c0f8d43863f4e
	.xword	0x1a0cde3ec98aea79
	.xword	0xbd41ad665878b34f
	.xword	0x34f1c30bb3485f36
	.xword	0x98498597aa9694d0
	.xword	0xddf10cdfc24e5ede
	.xword	0x32aaae6e3675b4eb
	.xword	0x1a114cbe8a05fc36
	.xword	0x1466a25d533440a4
	.xword	0x7d47f49dc1a62897
	.xword	0xabf619d767d7c67d
	.xword	0xda6a93e3202644ea
	.xword	0x494a0589245f6af1
	.xword	0x54814a06f222d40e
	.xword	0xfdcd019992a3591e
	.xword	0xb0c474849e633045
	.xword	0xc14696ae8a877fd4
	.xword	0x171cf37a710c293e
	.xword	0x34dde9de61ac5530
	.xword	0x46c5ae57aa190e53
	.xword	0x94f2dedf0934a2c5
	.xword	0x6293155229960cce
	.xword	0x866d496835979340
	.xword	0xcf58d3cffdd06a72
	.xword	0x36d0669a2d7bb849
	.xword	0x8669b9c59ad6db4e
	.xword	0xb473bc13d0348f58
	.xword	0x986e03a3106b6c7a
	.xword	0xf22233627d6982de
	.xword	0x4f997c7615d6fc61
	.xword	0x78dd9b80c6c3a117
	.xword	0xb2cea8ea25098177
	.xword	0xa51d88eed945321d
	.xword	0xe6ea0ade69585737
	.xword	0x67ee44f04a36ac48
	.xword	0xc6f79216a034e3b2
	.xword	0xdfa26deb2a9dba9b
	.xword	0x7dc888388b6186fd
	.xword	0xb8d5c39fce1b93dc
	.xword	0x4f5fd2c930d3b89e
	.xword	0xba9f38dba9b887b5
	.xword	0x2e004fa329701ef3
	.xword	0x0edc4161d4275850
	.xword	0xa62b70da083944cb
	.xword	0x474805e9ba2cfb0c
	.xword	0x5c35bee112c50b96
	.xword	0x1630017583338c4b
	.xword	0xec4d7233754f8f97
	.xword	0x427e2441cc4c5644
	.xword	0xdef3ca602c19bbd7
	.xword	0xe266987262fa0ee1
	.xword	0x553ba15b8f685e85
	.xword	0x5ae665bb0d6f507d
	.xword	0x5de5a3b08e1b68ed
	.xword	0xb3ab6f261586d60d
	.xword	0xd8e52cec06e33d56
	.xword	0x0177e28e731c1481
	.xword	0xeea394fcf0505b25
	.xword	0x9984a8c9d08808e3
	.xword	0x6c45865742231f1c
	.xword	0xb11e011562e8466f
	.xword	0x5d7d261cdc30a81f
	.xword	0x5582f9d62f1b6441
	.xword	0xcdf4748f3d1a2942
	.xword	0x662849d2894bda12
	.xword	0x659548c45bed5c8f
	.xword	0x54be2335f4f40f41
	.xword	0xffd3e308ff4f1d85
	.xword	0x6a2c6beb1c49dde3
	.xword	0x9b5181e5c230173e
	.xword	0x8b221ae3aec152bd
	.xword	0xb2c3825300a51b13
	.xword	0xe349c509362c9145
	.xword	0xd31e681e0319d624
	.xword	0x07ac629e0ba027ba
	.xword	0xf37ce22ff4527e84
	.xword	0xea7e64fe7b7ae99e
	.xword	0x77a577a2f8d3b9c0
	.xword	0xd6d43ded9c668689
	.xword	0x73241b5822c1d11e
	.xword	0x5989306fdcc7eeac
	.xword	0xeb2c8e11a1e93b36
	.xword	0xaf8d4c6362f0e8c5
	.xword	0x4774bc6bbe47078b
	.xword	0x1af7a39d084c3b90
	.xword	0x03a3fb670c93663d
	.xword	0xfee29ad39bfa2860
	.xword	0x7ab0fb2aaea765f8
	.xword	0x13bfc6b9e713b5cf
	.xword	0xe3b6bf52a0ee0470
	.xword	0xc63f81728e0d270c
	.xword	0xd1946a26d7504cef
	.xword	0xfabd8772f132f226
	.xword	0xe47faa57e2d514e4
	.xword	0x9d882c8af4c64bf2
	.xword	0x8d3817ca971bf85c
	.xword	0x593bdbd3d0266c18
	.xword	0x7ac62b133319d396
	.xword	0x686cd2cac745a4b7
	.xword	0x650f165bfa79b1bb
	.xword	0x2baedd81dbe4ec9a
	.xword	0x50376f36f066bba0
	.xword	0xc7bc43e0997fde6c
	.xword	0xab251aa0405df1e5
	.xword	0xef3c217fbda797bc
	.xword	0xe10c2a8d8fd830ce
	.xword	0xc99f0f69242d7d2b
	.xword	0xe8cfa6ceda0822a3
	.xword	0xa578e2974210df2d
	.xword	0x07680b80f543fcfa
	.xword	0x20c6a89d9352f5ef
	.xword	0x51a13f5ec6f0c787
	.xword	0x8935177fc44b2833
	.xword	0x6bb5f26e79f9f4cc
	.xword	0xf3e147190ee3fa15
	.xword	0xb5d17327b3c3e7b0
	.xword	0x7a27a7ffd8e33ce0
	.xword	0xcbbb13dcd25eb65c
	.xword	0x547d3b5698ce90e2
	.xword	0xdc4b2a8c0d4b2029
	.xword	0x9f5e0a1d46d85e06
	.xword	0x09c01ec841b95966
	.xword	0xb0fefd783d42a416
	.xword	0x8f051a77622d86c8
	.xword	0xb0ed1968e6ff6d28
	.xword	0xb7dff033ab0a7c91
	.xword	0xbcfbddc03f41f92e
	.xword	0x585e32353c3a21d5
	.xword	0xa08390abe4a7c2bd
	.xword	0xa9b81e4e4144d2dd
	.xword	0x5afa8a6046ade8b8
	.xword	0x7f41fb016ff34552
	.align 0x8000
	.data
data_start_3:

	.xword	0x467f4a035d0bc3ef
	.xword	0x20a3b75f26bbb384
	.xword	0xba36db43f07e94ac
	.xword	0x350c26943dd64692
	.xword	0x8c3dff353d4405be
	.xword	0x76a0be2c393cdf3d
	.xword	0x9f4fe0bae5d38aa2
	.xword	0x1eca148207bf6247
	.xword	0x0d2a50d30cdba708
	.xword	0xc3a0bdfd9bd67c0c
	.xword	0x98409ab75d716ce3
	.xword	0x8a5cbfef8dd5915f
	.xword	0xdb27c20f9436b595
	.xword	0x4bf5017eed828232
	.xword	0xd1f00cdfbaa71b90
	.xword	0x3580d199343bd06f
	.xword	0xcc31192ff731bb3c
	.xword	0x57c15077350aa351
	.xword	0x7634444f8c9ed937
	.xword	0x17c3a990879da15a
	.xword	0x1cba090a48c8c259
	.xword	0xe2b5ba6a9df87fba
	.xword	0xd28d2b5be03dccad
	.xword	0xa5db4207a8f0080b
	.xword	0xac672e688b1c26a3
	.xword	0x1c2efad8a9ef35ea
	.xword	0xc9dc0a54421c1494
	.xword	0x3297a272a611b722
	.xword	0xae75f20da76ab3f0
	.xword	0x02238f3822dd8340
	.xword	0x417da61d3d41782e
	.xword	0x5484402725c42233
	.xword	0xcf809b33422752c9
	.xword	0xdb17302f3b219f5b
	.xword	0x155d70279ad5d3ca
	.xword	0xa66696215ebf046e
	.xword	0x24f8901bb8ba5b93
	.xword	0x717a2c2e6efb0b9a
	.xword	0xb4693f37d7b8241f
	.xword	0x430fe5f921cbf92a
	.xword	0x02f74ec3c923ffd0
	.xword	0x11aa790092ead7ba
	.xword	0x279775daa0670636
	.xword	0xda6c90c39fc46a20
	.xword	0x7115bf3b7f20135e
	.xword	0x642f0cdd63702ff4
	.xword	0x0333d87f0c185ab5
	.xword	0x3e41b957decb81cb
	.xword	0x6c6e4ff22baa1047
	.xword	0x2ecaf0ce2f2bbbd8
	.xword	0x377ca3a57f36c4db
	.xword	0x0f448b489fb9ad25
	.xword	0xd5b9c8162a77adf1
	.xword	0x3a3fbd783bbe0923
	.xword	0x13a972cb17188a88
	.xword	0xfff3bf5c984be132
	.xword	0x169a1aa7c56b9ad3
	.xword	0xef5839eaac9fbabd
	.xword	0x2ed2fe546ebc21dc
	.xword	0xfbe6041764514450
	.xword	0xb4f3b426a5083f63
	.xword	0x55a2669434604046
	.xword	0xa4050e6ce1e29604
	.xword	0x72f2d97d922326f4
	.xword	0x7abc06f07f6583d6
	.xword	0x78dbabb7764cf776
	.xword	0x31690b13300e10e8
	.xword	0xea94bc8b68659836
	.xword	0xb1773da7583c21d9
	.xword	0x9b9e602b5b372275
	.xword	0xe6c98451374c83bd
	.xword	0xf21de96af1dcd693
	.xword	0x62f6fb1d268b3819
	.xword	0x1631849098a9765c
	.xword	0x74365705974987ee
	.xword	0x314db7d867e21829
	.xword	0x60cc6dcb2fcd13c3
	.xword	0xe74a4b1688deb1ee
	.xword	0xa5798574faa225dc
	.xword	0x4d75d2fe66d65ff3
	.xword	0x157666dd43def558
	.xword	0xd0d7a3c20f5d33d6
	.xword	0x95dde2883deb1a02
	.xword	0x145bdbc05bce9442
	.xword	0xeea22fd6cd9e67da
	.xword	0x25bcc6f6811b7d63
	.xword	0x05297f2848ca586a
	.xword	0x71dbb5654e87e431
	.xword	0x1b348e19931d9dd2
	.xword	0x3ae3a2c7a8fd5a39
	.xword	0x0d2a0a0364ec6555
	.xword	0x78353eff56727a9c
	.xword	0xa07f9aa458c28bca
	.xword	0x624238dda38f723e
	.xword	0x63ce6bdea5a02a13
	.xword	0xd77f8c075cd0cb27
	.xword	0xd5e9ee9c71cdf208
	.xword	0xaec2e29702614974
	.xword	0x6f37eb3d64929b2d
	.xword	0xbf172019f6213b8e
	.xword	0x6180a4aebcfac0fc
	.xword	0xf1af9e81344a71d9
	.xword	0x0d5ad05d64cafb9f
	.xword	0xf63d153df660bd71
	.xword	0x0346921566f4fe6d
	.xword	0xd2623bd71b66988c
	.xword	0xa6956e3e8232ca88
	.xword	0xdfcd72f987568089
	.xword	0x340c226a7341da71
	.xword	0xe2cfac5b411ae789
	.xword	0x3d0847e9eaa99871
	.xword	0x23dd8f1ad60a7906
	.xword	0x33eaac57cd24cbfc
	.xword	0x086d23ff9c3da43e
	.xword	0x8218cfc17d143887
	.xword	0x0873fe88abe40023
	.xword	0x4da3be546aea3cca
	.xword	0x6d93f5c5f7314017
	.xword	0x394afcff1e7b8449
	.xword	0x4baf9cd59acbf326
	.xword	0xf6899fd638864fe7
	.xword	0xd6f333085f8262a6
	.xword	0xf061fdceb106c4ec
	.xword	0x690a7c91fbe998e9
	.xword	0x25a60aad80705797
	.xword	0x5f8d12961851ef72
	.xword	0x0c4e8eb08e52355c
	.xword	0x82a5e714af88b6e5
	.xword	0x490a4fcbe0663115
	.xword	0x4b89295b603163a4
	.xword	0xbd30c0a3023acd08
	.xword	0x12a5bbf29c73776d
	.xword	0xdbebced5421902fd
	.xword	0xdb675f50d47876ea
	.xword	0x64511967d8b12bfb
	.xword	0x3d91538fd049c0d9
	.xword	0x252eb34e1771ef49
	.xword	0xc8741bd1a384972a
	.xword	0xbcbdb039c65a363a
	.xword	0xbf2a8a479b3e6a28
	.xword	0x916527ea2fa58dba
	.xword	0xb8efdcbc640a551b
	.xword	0xbe217d944d207010
	.xword	0xd602f273c5b584cf
	.xword	0x1e8f07f071f8530f
	.xword	0x0b924359f2eaa44c
	.xword	0x762b612d2f7eec95
	.xword	0x2ee731246b132243
	.xword	0xc715f6353a84c639
	.xword	0xb7022b08bc47aa96
	.xword	0xb96018aecb42a05b
	.xword	0xd6e87e35c31a2fdc
	.xword	0xcf45ddd68b449728
	.xword	0xc3cacff31e218c18
	.xword	0x0a7b5228113dfbb5
	.xword	0xea62f6c399d36e4e
	.xword	0x0e9d47c4ceb07385
	.xword	0x24bb0bc93e9aa70f
	.xword	0x79b2a2574c431b2d
	.xword	0x1b25bbc6515bc882
	.xword	0x56874569f8ae922d
	.xword	0xebd3406ab4290f62
	.xword	0xd304df9f7ca53a68
	.xword	0xa19ae4a34090e99b
	.xword	0xeb6a6fdc7ee39524
	.xword	0xa225eb0ec36709a6
	.xword	0xd402eab1ee95e39c
	.xword	0x44eb861e3c29e8e2
	.xword	0xb0da4d66351152bb
	.xword	0xbbda52f5248b7cc0
	.xword	0x509b006cf53d2acb
	.xword	0xbb30c7f9594b3488
	.xword	0xddf25bc9cb9e070f
	.xword	0x5042b5be67962f56
	.xword	0xe1b9a18c596a92bd
	.xword	0xb9646995f6d675ea
	.xword	0xadf8cad460b44740
	.xword	0x7c2e7b49c43aebbd
	.xword	0x06b344999deb499a
	.xword	0x3b80717a9348e8c5
	.xword	0xbdab6fe420ea63a3
	.xword	0xf3f2fbd38bcc540d
	.xword	0x0b9888e22361bc45
	.xword	0x236348a0d2ca263b
	.xword	0x1799708f3b473b7f
	.xword	0x1ec546b24647c0fc
	.xword	0x33be29314fe22993
	.xword	0x5905c032e710e7c1
	.xword	0x59d45eb871151fe1
	.xword	0x6b23e123987a0e12
	.xword	0x28cd2e5e6fd619d1
	.xword	0x492ca858e87a95f4
	.xword	0xa367d8a149577df3
	.xword	0xb96446f6d3a9f8f3
	.xword	0x8bddbc944b856746
	.xword	0x6d263626f3b8b452
	.xword	0x68b36a89223971dc
	.xword	0x12a5c628294a67e5
	.xword	0xbac81d963503bf49
	.xword	0xaa6b533e30d3ea10
	.xword	0x8fc0ac2fb3c3c650
	.xword	0x52fb39e03821b4ac
	.xword	0x6d703fb3e422f3c9
	.xword	0xa0e09274e90fc702
	.xword	0x4a73a0d8cfe59b74
	.xword	0x537890a155be3b8d
	.xword	0x4e2d307348533687
	.xword	0x560bb6825ab77aae
	.xword	0x745829de45d9cc5c
	.xword	0x61bd8b499bfa0311
	.xword	0x299027e31cc2ae4e
	.xword	0x7bdcaf5e48eb573d
	.xword	0x3674cbc3aca6f267
	.xword	0x6403b97ccc3cd05b
	.xword	0x9a1cb5ef6a8f15f5
	.xword	0x36e70f211c50d6fa
	.xword	0x93b69bec6877bbc6
	.xword	0x412477a2f44be369
	.xword	0xcbc041b952fda164
	.xword	0xbc6b2399bd2ad4f9
	.xword	0xbc9b8c1db34bcf65
	.xword	0xd993504ef440fa73
	.xword	0x827f86cbb246f84c
	.xword	0x7c4e93dbcc1e3f19
	.xword	0xc23419a204a48312
	.xword	0x3e3e469813b4caed
	.xword	0x1555d57aa5763ed3
	.xword	0xf76361fb9f68ec2b
	.xword	0x68051f15f38dcfd1
	.xword	0x050a2dcca1d06c92
	.xword	0x39c91af52abb43f7
	.xword	0xaea2ebd4d8d620f6
	.xword	0x44103f668ad52b57
	.xword	0x2406c8d4b7293b96
	.xword	0x47c8b75b0d04f963
	.xword	0x5ae0794b4caf5ce1
	.xword	0x8c52bf3aec855b4c
	.xword	0x96d8f6d9a5d96fd9
	.xword	0xfe17b539b0977b26
	.xword	0xe5f7ceb3cf904171
	.xword	0xf51f26152683f66c
	.xword	0x3fec46f70c6b7db5
	.xword	0xe189e969ecc1f7fa
	.xword	0xf0a21bb70f7d8bfd
	.xword	0xda0799723eac114a
	.xword	0xeaff818079dcbc68
	.xword	0x4156948a8ebdea21
	.xword	0xae716684a2b1815d
	.xword	0x5889e280389c8d4b
	.xword	0xd5c9c25b42d5cda5
	.xword	0x756a9be8b940e415
	.xword	0x8fd300e16838a96d
	.xword	0xce3b3ef5dc47b77e
	.xword	0x3d3a694b391b4573
	.xword	0x01ef708564c99c4c
	.xword	0x06f46e7c8d7e53ff
	.align 0x10000
	.data
data_start_4:

	.xword	0x2ae6995fe18665b4
	.xword	0x0056340e32a17969
	.xword	0xe5a3893a574eee4f
	.xword	0x9a58356423e71b6a
	.xword	0x1c74ddd506cb5c72
	.xword	0x547ad33911c93e26
	.xword	0x49463952e230f346
	.xword	0x05b1704703917a3c
	.xword	0x5da23c55f67df43f
	.xword	0x67d76c79d9fbbf97
	.xword	0xd437eea71935570e
	.xword	0x0acf64f1ee0375fb
	.xword	0x000a9733617cb669
	.xword	0x50c4ce524a012670
	.xword	0x18954c664b1eaf71
	.xword	0x13f86f79ba089d79
	.xword	0x2a6ba2950e527437
	.xword	0x8c4af7a6254de264
	.xword	0x9da9753bda1d7e19
	.xword	0xf757871173a8cc1a
	.xword	0x1deb6f53d8913882
	.xword	0x77c0bbdbbe9a8e00
	.xword	0x4bdd9c9cef7bc3b1
	.xword	0x839b1394434d85f5
	.xword	0x91ebd3aafe4baa43
	.xword	0x8989dd269e896a2b
	.xword	0x4ab15a9903e02be0
	.xword	0x99ed64d06eec5974
	.xword	0x16a8dc6b44358809
	.xword	0x5752fa713bb9aac1
	.xword	0x6e4173c72357abd3
	.xword	0xfd16f6cda48f87bb
	.xword	0x0bcce364c355710e
	.xword	0x943bf85970fec311
	.xword	0xc5b8627fa9792e6c
	.xword	0x6008a1c93e1e0a50
	.xword	0xc89b39d791436245
	.xword	0xfa562661a6e478c8
	.xword	0x00d95abecf58b3a9
	.xword	0xf42e445128df26a9
	.xword	0x17ad96d9a745cf2a
	.xword	0x2312e277b29b6b13
	.xword	0x25ae2e932c956538
	.xword	0xac6bbed6d88809bd
	.xword	0xd17254d8952c1e4f
	.xword	0xb3030f4f9fd7dcda
	.xword	0x1f188541fe74ad80
	.xword	0x7a06fb1f0831f264
	.xword	0x833a02d6ea0bad87
	.xword	0x5439f321392cef28
	.xword	0x1f2fd5d04158c8c0
	.xword	0xb1189e9d65427dba
	.xword	0x0139bc5f4bd88e87
	.xword	0x3aaa37292ce6db43
	.xword	0xbed93a173233482c
	.xword	0x5f8920b80e7a3e0e
	.xword	0x6f5f878afd6b33e2
	.xword	0x004da044a87360bf
	.xword	0x2a02bcc64b8e1341
	.xword	0xaaac91d6ab798570
	.xword	0x81f9ab903abf6363
	.xword	0xb77963c76b20f449
	.xword	0xe3ff3c4aec91bb26
	.xword	0x4b08399ebbe46ae1
	.xword	0x04c4f8ffebef86bf
	.xword	0x0345b261e75ce6dc
	.xword	0xbe6db2744676a5bc
	.xword	0x78a0c04d6136c2a6
	.xword	0x6f23ae226afdb0b2
	.xword	0xe422d1680308a3af
	.xword	0x89694c00f20dbef8
	.xword	0x859d6193ca0724f6
	.xword	0x8a6fc9e71a73fdc8
	.xword	0xa21ce8ceff7b0357
	.xword	0xd4bf89ce92f3d942
	.xword	0x81ad8621418e65cf
	.xword	0xc45ff6f55408712a
	.xword	0x6af48a85a1613790
	.xword	0x192dac4e58d43f4b
	.xword	0x51cb68e23746c4c7
	.xword	0xbdf63afcc3ed8b59
	.xword	0xe70f45963fccb2f9
	.xword	0xa13fa38631cdb963
	.xword	0x67ebb7e306705b3c
	.xword	0xb1a3c5cb79563af2
	.xword	0x6a670dfa6ccafec5
	.xword	0xd77a86eb09075ec1
	.xword	0x3e9a93aea65e684d
	.xword	0x355dae2a83034a27
	.xword	0x321f5fe6dbce954b
	.xword	0xb97108db4909d216
	.xword	0x4a105e81e266024b
	.xword	0x4e18629e90dd7cfd
	.xword	0x9dfcfca68a41a8c5
	.xword	0x60afc5452fc57037
	.xword	0x9b17ee932e9da822
	.xword	0x817c7defd6944059
	.xword	0xe3acf82c9427f811
	.xword	0x1cb3e608a29b6665
	.xword	0x36a1ccb697cacab5
	.xword	0x6f867274f9344b98
	.xword	0xc92d372674a84538
	.xword	0x83a77105276572eb
	.xword	0xc6e257058ca1f34b
	.xword	0x59a97a8d6f3a1dd1
	.xword	0x8bb8bb04220ea3f1
	.xword	0xd17598ebede53a67
	.xword	0xa4282e0669d65b6e
	.xword	0x3ab5fb51b224e3ab
	.xword	0x890c59c0c72a6772
	.xword	0xb07926b13ab7770e
	.xword	0xf827895f3fa9a8d1
	.xword	0x9b9d87d320381780
	.xword	0x5cc5b7c91aa8b8f7
	.xword	0x83616d11b1d5d658
	.xword	0xb9045369ad890a90
	.xword	0x4bd7e524152b55cf
	.xword	0x1e929aebc1294fc7
	.xword	0x33cc157c8252913a
	.xword	0xc60e90bd2027b627
	.xword	0xbad3557fa08890b8
	.xword	0x3045ddd17d771721
	.xword	0x2ef8dbb1eaf1ef09
	.xword	0x403589e86d04b9cf
	.xword	0x51b5a75357b175aa
	.xword	0xd9f61899b4396b27
	.xword	0x07f94926ccf25420
	.xword	0x64f12e3bb7197b33
	.xword	0x49983283a5687316
	.xword	0xefbfe247fdc44b9a
	.xword	0xe57b02d6f114f574
	.xword	0x3f65dd9e262b3eac
	.xword	0x2f4f76a2bb3f55f7
	.xword	0xdb41567483cef38c
	.xword	0xb7009f6cb50cc972
	.xword	0x0d1b0c1d72f4d228
	.xword	0xa15f401186b0b701
	.xword	0x92c808361076fb1a
	.xword	0x3a263cfa08914bb9
	.xword	0xc87cd955d1c519ea
	.xword	0x8dbca90823cd39bc
	.xword	0x0a0987d26efc667c
	.xword	0x11906e1b8805fbcb
	.xword	0xeaa00ba598898b8c
	.xword	0x9ee26035990283d3
	.xword	0xd6a6519f2053e9c0
	.xword	0x35b6640060ed822e
	.xword	0xcf4cfeaff2ca0ecd
	.xword	0x5879ccf3c714ee96
	.xword	0xfb4c827a2854fe2d
	.xword	0x83fa6850655ea571
	.xword	0x3780312f29012a51
	.xword	0x4068fef7c7f65ee7
	.xword	0xf75b6eb186f87688
	.xword	0xef1196df30ab4a62
	.xword	0x49464397f08303fe
	.xword	0xf948bad0b46a135f
	.xword	0x906cfbd0fa340528
	.xword	0xc749195cb0bc2e68
	.xword	0x91fb885095cc2425
	.xword	0x0c1bd1bbf5de2fa7
	.xword	0x400be4e94e893aaa
	.xword	0x0cb6b9a563cfdc2e
	.xword	0xd8f5d0acef87b0a3
	.xword	0x02abe8d55fcdc0a7
	.xword	0x0adb473063f972aa
	.xword	0xf2a383a17dea0a77
	.xword	0x787fb0d449a917f8
	.xword	0xf5a9b19a11036046
	.xword	0x45df6543742c294a
	.xword	0x8558963f9890ecae
	.xword	0xf2bf82f206104b8b
	.xword	0x2fcffaa09be80777
	.xword	0x2873548a32329b3f
	.xword	0x46fcf380ca9fefc1
	.xword	0x8172783068885ddd
	.xword	0xc1bda53f4fb68f4c
	.xword	0xd11a44fab2a78e08
	.xword	0xa1ae773fe04e60e9
	.xword	0x06279e840ecb8cc2
	.xword	0x577bdd3cfbe3da11
	.xword	0x0c90bd55ef7a29b4
	.xword	0x8a641809e4e0424b
	.xword	0x650140ed94ca35ef
	.xword	0x496b246a6205e78d
	.xword	0xd69a4c86e5981190
	.xword	0x02d51049300d60d0
	.xword	0x3208818c2c466f00
	.xword	0xdecfa7682770f5dc
	.xword	0x0f3bf056cba06028
	.xword	0x43c2d79abb04323e
	.xword	0x3f3354631f463969
	.xword	0x51e285674458f375
	.xword	0x018b29e61469792d
	.xword	0x3295058b16fb8279
	.xword	0x06358ce1130b3820
	.xword	0x945798893abfefc5
	.xword	0xd9eb535c35709cc9
	.xword	0x6a02ca8494a69ea3
	.xword	0x5d80fa3ffc77fb1b
	.xword	0xa51b1eca49c9fefd
	.xword	0xde255e6094948481
	.xword	0x6ea8aa5697e91016
	.xword	0x7a74b3caec590cd7
	.xword	0x002eaa61d2f34c31
	.xword	0x91994283333fc88f
	.xword	0xb1062e8ee85f19c8
	.xword	0xd7af50572adc3c2b
	.xword	0x4a85f378df044862
	.xword	0x06fbde9602f47d41
	.xword	0xca436627ebb9b68b
	.xword	0x961cc5d600736446
	.xword	0xf0a419a227d8fba2
	.xword	0xb30d0621453a453f
	.xword	0x7083dbc6839025b1
	.xword	0x1175f240831f2481
	.xword	0xedefc0d4f0b7bc93
	.xword	0xb0a7c2e39047cfd8
	.xword	0x4adfabc1ecd1a1c6
	.xword	0xa4cb6731cd59f2b4
	.xword	0xa8c2c1a284e1d02e
	.xword	0x478048c6729435c2
	.xword	0xbb32579bcd6be8fb
	.xword	0x0a099aeeeb385fc1
	.xword	0xcb89c7c629baa407
	.xword	0xb2e56ef8e0736041
	.xword	0xa5f938ab688dca66
	.xword	0x929841facb19eed6
	.xword	0xbc1e566bc4aa9456
	.xword	0x3321f27e46b321fa
	.xword	0xd86e3d7a484f4696
	.xword	0xc2cbed157863e050
	.xword	0x770ded8973255e2d
	.xword	0xf0dcca8513622c39
	.xword	0x66ea95e236533bf2
	.xword	0xd179c58b1ff5932f
	.xword	0x5f714e519c05a6fb
	.xword	0xa516f8ca90e263b7
	.xword	0x4f6aa72be4124303
	.xword	0x7c2c16b79a2f4f91
	.xword	0xa7540786bd471dd2
	.xword	0x5b7d40fe2d7f1859
	.xword	0xc781a6656152aa17
	.xword	0x501c6034837e0762
	.xword	0x6c57ab6260cf0ddb
	.xword	0x9a63385f10b03e6a
	.xword	0x42595b2439849e6a
	.xword	0x68bd43da57736078
	.xword	0x0fd0988402597eac
	.xword	0xc7ac2774aa6e0d5b
	.xword	0x42f20024253b3e2a
	.xword	0xc76b9f3077554e8a
	.xword	0xa0849a9e7c94c751
	.xword	0x35e0e73b279e77fa
	.xword	0x822851ff038a05f7
	.xword	0x72c9d8e18c0c67db
	.align 0x20000
	.data
data_start_5:

	.xword	0xf350d0ef02ac0e57
	.xword	0xea196ad5fc73261d
	.xword	0x60206929cc4e3ba4
	.xword	0xb667816b5b981110
	.xword	0x722040bb0c61bd32
	.xword	0x2899a38679ea8e15
	.xword	0x0426471a5f25deea
	.xword	0x3826c9354cc37f05
	.xword	0xcea4a3c9dc864628
	.xword	0xf6339fb8335b9ddf
	.xword	0xae04b2be789477e0
	.xword	0x76d5ab73b202eaf9
	.xword	0x7d7e298761d629ac
	.xword	0xdef835936f907bdb
	.xword	0xc9de5acef20b23d5
	.xword	0x30294506c8a4835e
	.xword	0xe99304e83d028041
	.xword	0x9dc895f7fdecd7c1
	.xword	0xc82707ca9e88e6b4
	.xword	0xe2119b78c3bfd0fb
	.xword	0x1308f4fbf68dfbde
	.xword	0xf40359945e5ac819
	.xword	0x4ac43f63dfeb5ec9
	.xword	0x363169b3a2dc16be
	.xword	0x5825aa9abc0b4a7b
	.xword	0x257e15a454c4e3e9
	.xword	0xf4b3d1245aa24611
	.xword	0x144d892b5a8b1eda
	.xword	0xbb446416a817a12b
	.xword	0x292dcdeacd449559
	.xword	0x7d65aea54e9d84e5
	.xword	0x2a7596789a240b83
	.xword	0xe1e7bce4f9825d42
	.xword	0x699e9cfc65c21082
	.xword	0x405c09e699984eae
	.xword	0x9ec4f47146277694
	.xword	0x639c08e87fd88777
	.xword	0x3065c5f49ae5a115
	.xword	0x7ff201b8b9297c3e
	.xword	0x773976658e7a1bf0
	.xword	0x30b1e62af408204c
	.xword	0x7ad8549283005972
	.xword	0x5f291fb2b6e93407
	.xword	0xb6bb75de739376c9
	.xword	0x11acc7a65c4e6a0f
	.xword	0x013906820abaefcc
	.xword	0x8f8acba9ca5c22a1
	.xword	0x7a159aaddcdcd039
	.xword	0x78187c7e5fa243fc
	.xword	0xf2d54b39fc5047a2
	.xword	0xa9b76335da2fae6e
	.xword	0x4c316984f9d81914
	.xword	0x0fe9e7e0615b9dd2
	.xword	0x32df56586a2842a0
	.xword	0x29c44ca95906d59d
	.xword	0x6b4b6a6e3545de6f
	.xword	0x57feb0159fd5c148
	.xword	0x9f8baf04c12b1fcd
	.xword	0xb62e5aa8c1b257d8
	.xword	0x1a2b65346b8d765a
	.xword	0xf84f49d61f8f7d6a
	.xword	0xc877dfdc539cc616
	.xword	0x8dba42585e3864e0
	.xword	0xddcc6401880fa3d5
	.xword	0x7d00ee3594dff7e7
	.xword	0x3272297ffffb2857
	.xword	0xe9201f3f0fcdd826
	.xword	0x94f99a80fbd955a2
	.xword	0x1124fbcebab5f8b6
	.xword	0xf63337756274dbb7
	.xword	0xf68ee804227be0e4
	.xword	0x62de7040c729e66d
	.xword	0xf8bb20d81734d572
	.xword	0x46a17552a4d6f5db
	.xword	0x071aa2c40c69e2dc
	.xword	0xf3d52f1e25648f51
	.xword	0x2bba06dc3c95b9e6
	.xword	0xf871734d3e312624
	.xword	0xd90aeac557715bb1
	.xword	0x61c8d96954df9509
	.xword	0x0e4112e596360b95
	.xword	0x6b6d1e93aa6caafd
	.xword	0xd577badf9e8995e9
	.xword	0x0d084667ea5a7f53
	.xword	0xc916efba1b00b023
	.xword	0x2175e1117c3445fd
	.xword	0xbbd37a8fb6571286
	.xword	0x7b013af354927a7b
	.xword	0x6ec6dd01b6d95130
	.xword	0x5f16db3db95a6a53
	.xword	0xba1351ba0967098f
	.xword	0x6edc2ebbc730aed0
	.xword	0x0f8d0a83e3949b36
	.xword	0x3278d8713ec98129
	.xword	0xb80cfb4e5dd282cd
	.xword	0xadf3b57f24c5c025
	.xword	0x719111c490c2ee99
	.xword	0x79d79158d53e1897
	.xword	0x8d45951ab6026ba1
	.xword	0x403a00e1a7bccc71
	.xword	0x171233af74bf2849
	.xword	0xd7a7a8d5421d6e85
	.xword	0x861e9b5da0d880c1
	.xword	0xc49c20d16cf12d5d
	.xword	0x2d15018d249e001a
	.xword	0x47e6abe70a2533b7
	.xword	0x37098f6333c35ea4
	.xword	0x9c636a4240099ac7
	.xword	0x26fbf41bb7954988
	.xword	0xd5fde2bd4712221a
	.xword	0x27e881094f5623ba
	.xword	0x6aeb16ab34760418
	.xword	0x808d95928d2ab995
	.xword	0x2fe6b1a4b22703fb
	.xword	0xd8b2b2b62c68b9d5
	.xword	0x05d6c42bd4991331
	.xword	0x5401db4383baaefa
	.xword	0x7cd559eb11a47d3a
	.xword	0xccc9ed01e6d2272f
	.xword	0x2f7c7626c970adbd
	.xword	0x9dfbedbaf9249e02
	.xword	0xf9aa2560f734149c
	.xword	0xd2301a24f67725e3
	.xword	0xe73efc3d2f24cf63
	.xword	0x09afec93e26c4278
	.xword	0xd291eadc8586f30f
	.xword	0xc8b4e5e8fd997d8f
	.xword	0x415d50b3ffe3b1a4
	.xword	0xf33880f7164b5de8
	.xword	0x7e6b4a0de0b3154c
	.xword	0xee1fd7e4076e8af7
	.xword	0xfce59df9b0d27724
	.xword	0xb5e88d2c9f4705cc
	.xword	0xce14507723dca891
	.xword	0xe28563077bc563af
	.xword	0x4df92160e91e632e
	.xword	0x68a4af7484806041
	.xword	0x36f4462f6310daf8
	.xword	0xf90ff67ce4821015
	.xword	0xba7ed01cb24c785b
	.xword	0xf386600c29ca27b0
	.xword	0x8e96f4360155876a
	.xword	0x5dc87142b2ba192c
	.xword	0x684c29c5abdb5ce3
	.xword	0x56fed9330982f0a7
	.xword	0xfb64bd32d4d15739
	.xword	0xd1e31ef36a30fb7d
	.xword	0x0cf0bf4a4ebf9898
	.xword	0x91de5282bdc5e8f6
	.xword	0x83bfa8dfe7922a6a
	.xword	0x65390c3e3fca768d
	.xword	0x40ccdd887dffc647
	.xword	0x56394088342e7d47
	.xword	0xb3eaaee9ef8e9d82
	.xword	0x3d0e009215ad3c39
	.xword	0xf6c3fb69bbeaf1f5
	.xword	0x5c16b4cd0d85e81b
	.xword	0x8096796278d5a849
	.xword	0x5a6f0b23275ef3f2
	.xword	0x440e69c9a5326597
	.xword	0x397851c14e555ea5
	.xword	0x6e4d01e406334437
	.xword	0x9c2f91248ea98b24
	.xword	0xc9d689f2bb122f45
	.xword	0xe53cd97935bfa661
	.xword	0x9f9e772f29fe8260
	.xword	0x2fa71d96ccb5d8b4
	.xword	0x6c50f37f836f8c80
	.xword	0xd871845b8fa08556
	.xword	0x7e0c9c1280552eb3
	.xword	0x41abd7efc698dfa1
	.xword	0xfe2eeaeb76aa86a1
	.xword	0x294081f01c363218
	.xword	0x0dc80c4afbe834d3
	.xword	0xa0e5e0e803070802
	.xword	0xf737393e2416433c
	.xword	0x977ba9360bb2bff4
	.xword	0x15f06022fc19934d
	.xword	0x9805813f9e2a8a28
	.xword	0xa35546f85b1a64d1
	.xword	0x799d5e8a822345b4
	.xword	0xb511b153e4117d61
	.xword	0x1ca829b169cae18a
	.xword	0x9ae3a753193cf1df
	.xword	0x59303fb720d51ec9
	.xword	0x873a7813f0eae121
	.xword	0x232120d498e94e5c
	.xword	0x4db3212b7ce52e9f
	.xword	0xa2b19945d0be0768
	.xword	0x398330a480f66c0c
	.xword	0x8c1c504b5c104aa7
	.xword	0xc70adda0f517bfcb
	.xword	0xd39f7379632e89a2
	.xword	0x2fb364657ce9815b
	.xword	0xad85ac24682782f5
	.xword	0x842551eef5aef4aa
	.xword	0xb2e5ea6d1103a907
	.xword	0xda9f88dfd1b798bf
	.xword	0xb89a5c3f5c2ec183
	.xword	0x8d6ea86e548611ea
	.xword	0x0c3ce801792e2d4b
	.xword	0x84201a4a13caeea1
	.xword	0xa34cbf875181a97a
	.xword	0xd505c9d5a474df83
	.xword	0x4fdd2dd592d1a2e3
	.xword	0x171b01b46cf591b7
	.xword	0x5b32c46e57572b01
	.xword	0x581d8f81ad03bf4b
	.xword	0x153268d7ae8b7727
	.xword	0x0ac3f9b39b0722b4
	.xword	0xea00da74f594a6c9
	.xword	0x835c9c61b34bf3a1
	.xword	0xcb64fde98cb7d4de
	.xword	0x0876cc357c997b85
	.xword	0x2a3229139ae5f4d8
	.xword	0x0b84b97d1cc25c75
	.xword	0xf09e8bee7f7665d4
	.xword	0xdfe6bdecd017a2d3
	.xword	0xdb745a9268c9d4c0
	.xword	0x06f763638bce562d
	.xword	0xcf63a100c55c157e
	.xword	0x86bdf05af73c517c
	.xword	0x85cb16e2f6c76999
	.xword	0xc6876f74230d6e1d
	.xword	0x4c24c362712c45c2
	.xword	0x7a646a4263134106
	.xword	0xc75b783621018f24
	.xword	0xbc90dde941e5064c
	.xword	0x59ef97131a95e2b9
	.xword	0xb8817ed6438e8ee9
	.xword	0x1265823d2af98de3
	.xword	0x4147afe273c82a72
	.xword	0x16cf6820dfae08eb
	.xword	0x150091a68f3dea18
	.xword	0x56b6f130fce7e465
	.xword	0x41c7cc5858f7fed4
	.xword	0x07e2fd29323866de
	.xword	0xc31afb70b9689c6c
	.xword	0xbe40b513ae0ee26b
	.xword	0x1dbbb4899d410e23
	.xword	0xadfdf4c92e8ee69f
	.xword	0x6fd593ec8c663792
	.xword	0xf5443b4c8d210d53
	.xword	0x5fe53c635e7b12c3
	.xword	0x600f1afbf16f444a
	.xword	0x39517051a752e9ec
	.xword	0x72cf56efc353f2d6
	.xword	0x55823d3ca95446a0
	.xword	0x24a8c4f7a7f178f5
	.xword	0x0c29faf935196a4e
	.xword	0x99a76d237a80aa26
	.xword	0x4e497ce51dab452f
	.xword	0xb0f85a9e134c08a7
	.xword	0x9bb25f67c3e9a8cf
	.xword	0xed822ecaf083e942
	.xword	0x22153406e6794cfe
	.align 0x40000
	.data
data_start_6:

	.xword	0x137b4bd948e482ab
	.xword	0xc7ce2af6477147f6
	.xword	0xe2d13af7fbb49252
	.xword	0x0d11c22ad8b6ec83
	.xword	0x234d537d6992924a
	.xword	0xf8347a281af2ba99
	.xword	0xdd95f5deb00c9e72
	.xword	0xd0c1dec42b677c5f
	.xword	0x46769254b5af27c7
	.xword	0xe6aa14e5f14fc333
	.xword	0xb03a2036308d1a67
	.xword	0x49ffb7758a07be2b
	.xword	0xfe926a352e8f6457
	.xword	0x780c2f2200558f44
	.xword	0xb4a0e2c30f2cf7a2
	.xword	0xa488ae3f79f0cf3c
	.xword	0x946325b4ab6f6d14
	.xword	0xa572a5744bec2527
	.xword	0xcd794cdcd78ded1f
	.xword	0xe53d1615e9cf3691
	.xword	0xfdd3e542ae2287bc
	.xword	0x6d8c67e02b9fc661
	.xword	0xdbc5c36085d88810
	.xword	0x49743f606a23104e
	.xword	0x7eefb6dd4d55ec84
	.xword	0xd8deb2032c51d7aa
	.xword	0x034bcfc3c5bf09df
	.xword	0xaa1e9a8a1c724b8b
	.xword	0x4aa83cd8d27dc33f
	.xword	0x0f4ec14e07992db6
	.xword	0x272b6dba7ab10182
	.xword	0x2f35db48849f0efd
	.xword	0x7898d3223ad7d4a1
	.xword	0x9a0f39a4db9d9893
	.xword	0x963e033c1da2b1e2
	.xword	0xfc8e56ced68a734f
	.xword	0x89b25bf90d876791
	.xword	0x7452a91e1309e7bb
	.xword	0x367c3f826be0bf5c
	.xword	0x8edd1e79587f6551
	.xword	0xc7d7062a823c9524
	.xword	0x1f7f5ee8fe223e03
	.xword	0x5085f342efd4a9fb
	.xword	0x63155a25f92e3906
	.xword	0xe6a6fe19859a5799
	.xword	0xf8b892d84e69e61e
	.xword	0xa72c8e5ce4de48bc
	.xword	0x0ba0775d93bd162e
	.xword	0x468326aff0ad8e5f
	.xword	0x20f06cce6cb8d976
	.xword	0x92bcbb1413645409
	.xword	0x0126b1138efd6461
	.xword	0x6dcbd96d49dc69a6
	.xword	0x6cd1399862cce8ae
	.xword	0x2413594df61601b8
	.xword	0xb15c87b64a11f499
	.xword	0x3deaf7784f346448
	.xword	0xdcf2e64c9fcb88de
	.xword	0xaf4c462a84ae14e1
	.xword	0xcb1b770fcf1df1ec
	.xword	0x79594b2c5e5970f9
	.xword	0x15df9fb0681125c3
	.xword	0x0888272e69409bfb
	.xword	0x0c9ba4adf882a95f
	.xword	0xa8d7f316c7216d67
	.xword	0x73b45e7a3600d87c
	.xword	0x0498fdf183985cce
	.xword	0xa65ea7edf52eac68
	.xword	0xca4665f29d8628ce
	.xword	0x6406ef8dbb50462f
	.xword	0xf3ec544b43a104db
	.xword	0xd57443b8e0a6f26f
	.xword	0x62f8c91c2fd95d83
	.xword	0xb7cea313de60c59b
	.xword	0x7fe6d9a867cebb43
	.xword	0xd871f5d754b948cf
	.xword	0x9caabacf3fb787df
	.xword	0xfdbab3980206feb7
	.xword	0x98c62e746f439bb0
	.xword	0x13a14bfb11c8318a
	.xword	0xf1fe91ea43dc2378
	.xword	0x3dd1855035cb6598
	.xword	0x3ed16a7cf1488cdc
	.xword	0x3735224e6180b469
	.xword	0x7b5fd254f4503b53
	.xword	0x3a0b32f20849f4ab
	.xword	0xb9988ece6284e83e
	.xword	0xd153105bb0c8ee67
	.xword	0xe70668c04dc70953
	.xword	0x5e64cbf3dec13b6c
	.xword	0xb4c079b921320ef6
	.xword	0x59a4437991bf744d
	.xword	0x389c4abe668a1482
	.xword	0x5708f2786ef58ee8
	.xword	0xb2aee78d02ac8f6c
	.xword	0x6aa760ad1ddc32f6
	.xword	0x7bd2ee05390c4145
	.xword	0x7776409caba6c48c
	.xword	0x824f500cad2f2c7c
	.xword	0x20bddb54435a7e51
	.xword	0xf28d6cf8c43f931f
	.xword	0x1bb6f8bdd05cf828
	.xword	0x213a3d96c100e6aa
	.xword	0x10d8c72f0525736d
	.xword	0x43849181b1f1040e
	.xword	0xe20fad46bcbdf38c
	.xword	0xfbfdd774c70cc784
	.xword	0x8f289736e11d69f2
	.xword	0x3b613eb04abcd974
	.xword	0xf6fd99343f87caee
	.xword	0xe7859a519cf1f506
	.xword	0xa79870ebf95d1780
	.xword	0xa2e6ff9d7822f3e2
	.xword	0xb32a1b35c224369e
	.xword	0x7dbb74a1f28496b1
	.xword	0xd244c3a60947d6d0
	.xword	0x732080d0b6e8f0d3
	.xword	0x8278e5fe2f1b5419
	.xword	0xd4c0eb1960fd9fd7
	.xword	0x70719b56db50b7e5
	.xword	0x6aaae57c1acbc24d
	.xword	0x9574c0fc2b3a58ec
	.xword	0x1d1899d2cf748945
	.xword	0x7b7238ec190ac6c0
	.xword	0xf42c5dafb0bcf1c7
	.xword	0xf60792c51d361d95
	.xword	0x14df43797e648b91
	.xword	0x112fef67d5bc83de
	.xword	0xf525ff8442452113
	.xword	0xf8a780f8821032a5
	.xword	0x19cc8caa37752347
	.xword	0x92cbf00a7ec8743b
	.xword	0xe942b2b469b97c2b
	.xword	0x3392f586dbf2dfb0
	.xword	0x86471e623a61d388
	.xword	0x8b3c5a0fdc5261fd
	.xword	0x46ab90ca918cf294
	.xword	0xb955a3f84ef873e6
	.xword	0xc83cdcd3a43e8cee
	.xword	0xb44bad08659de8bc
	.xword	0x67438d7098acb90a
	.xword	0xfa9ec03941a3ea8a
	.xword	0xe0736ccfe4ecbaef
	.xword	0xeffc794d2eabe212
	.xword	0x82656ae453238f2f
	.xword	0xf28942cec9cabc2b
	.xword	0x9f9c688d83638ead
	.xword	0x03ed5b821667853c
	.xword	0x2642335634591b5d
	.xword	0x65fbe8500ba29ac3
	.xword	0xc25b7a4cdf5e7682
	.xword	0xb22a5c16a1857027
	.xword	0x278deb44aaa4dedf
	.xword	0xdc6085fb088418fe
	.xword	0xd8fe99dc7c34ec67
	.xword	0x5c4d8b12f20230a3
	.xword	0xfaed6ad46ff1897d
	.xword	0xccad7db72bfb4205
	.xword	0xb3003dae7fa1c047
	.xword	0x78a6658d8335b211
	.xword	0xe747223211967396
	.xword	0x498ed3873a740c0c
	.xword	0xf56004244f432314
	.xword	0x46b6e1b4e54abedb
	.xword	0xc278da182a97c5fb
	.xword	0x3d4cc1af133cd178
	.xword	0x02377543e158c844
	.xword	0x614021ae557b64b3
	.xword	0x958aeebde124f873
	.xword	0xe8f977fd180ff3b7
	.xword	0xdfe902591f8a8592
	.xword	0xb6d3ed75dfa47fb1
	.xword	0x59bd84eab89c97d3
	.xword	0xf48cf12a063709af
	.xword	0x31e32c942ac26f9e
	.xword	0x57f69ed89b337207
	.xword	0x1f1b58296bb0321c
	.xword	0x6919c893a5efd661
	.xword	0x4ecf515ec96ea6c6
	.xword	0xd7cb0b002721f677
	.xword	0x33bf533242472a9f
	.xword	0x5347b89aa96b5397
	.xword	0x718f142fc7534ff1
	.xword	0x6cb016ae239bdb8a
	.xword	0x0e6eea5c412bae6c
	.xword	0xe69b58a2b03e7d83
	.xword	0x939bc0c11e893620
	.xword	0x9007e2af2caefbfe
	.xword	0x91fa47a9b45c596a
	.xword	0x9b32bccc3423f9f0
	.xword	0xca36f5b44fe74fd6
	.xword	0x3ebffc2d4b523b5e
	.xword	0xbfabb0e4d1db97ed
	.xword	0x32669a70a637fb2a
	.xword	0x74e7cfcf95a6963a
	.xword	0x288964496cbd4500
	.xword	0x6e4d1bedd18c2c5c
	.xword	0xda5827418d791d99
	.xword	0x155910c2ff30d8b0
	.xword	0x2a6176b0f16f28b2
	.xword	0x550960ff055261a6
	.xword	0xe11fd37daacbb11b
	.xword	0x9f8e8c0c07d208be
	.xword	0x534a13262d4c16ba
	.xword	0x4aec5e1ab095c6db
	.xword	0xed492c6702a08633
	.xword	0xd0013497e1d6a1f2
	.xword	0x8fea3eadcb93bfc5
	.xword	0x7143ff90d314ac78
	.xword	0xc9e615061e1ce306
	.xword	0x6d64e5eb7020e5fb
	.xword	0x26142e2b6331afec
	.xword	0x15f4d1c1a91e0dab
	.xword	0x1b7107dcd8aaeb48
	.xword	0xeff8850bc68d7b65
	.xword	0x22fb5a53c350ab1d
	.xword	0xb571d703f1d598bd
	.xword	0xf51b8e7d98026a36
	.xword	0x2746e2c636ba9a96
	.xword	0xf0bbe4e8c6114742
	.xword	0xc17be8eb3ac13e71
	.xword	0x6feb0a318649fb96
	.xword	0x218a00c161fbe0f3
	.xword	0xb8ff963e798dd79d
	.xword	0x79983ad598d344a7
	.xword	0xb832f1fb8be8b954
	.xword	0x32f42dca74e6ed93
	.xword	0x5766dbfc0176fee1
	.xword	0x5d3116724ffa09d3
	.xword	0xff1332eb0c5f79d1
	.xword	0x955e97579da4f85e
	.xword	0xe737edcef2e36088
	.xword	0x17908b06be3d98c1
	.xword	0x2b027e5e1e7b54da
	.xword	0xd83b452fc31e77fe
	.xword	0xef934d93eddf1cf0
	.xword	0x31cc2d6435760af1
	.xword	0xcebf59786fad2849
	.xword	0x3d18ed59b8e4bfc0
	.xword	0x2db7e0bd31aa5533
	.xword	0x8f3be2365d5fef9e
	.xword	0xb6b5711a8a906bb8
	.xword	0xfa28a8aad85f50ea
	.xword	0xd88e29578d095adf
	.xword	0x1a8febe456648b76
	.xword	0xa6a867b494680fc1
	.xword	0x5f2e3d1e677e6399
	.xword	0xa1154e8cff0d1a16
	.xword	0x887d913cbce0a2c9
	.xword	0xa7ec94d68cd557ea
	.xword	0xfd88622e82876696
	.xword	0x6967f803167276af
	.xword	0x117cff27a5ca4de2
	.xword	0xe7103869ed690f8d
	.xword	0x6d563dbed1639f14
	.xword	0xa12efbaddc261de1
	.align 0x80000
	.data
data_start_7:

	.xword	0x2cfd16d00c9bfdf6
	.xword	0x3f0ab07bd5697742
	.xword	0x9ed3d4d941800f14
	.xword	0x91af36ede697ee20
	.xword	0xde32973b60206329
	.xword	0xa580b7d93fb08a84
	.xword	0x58cf81d53abe0282
	.xword	0xd9d0b66dd3c3512c
	.xword	0xabc10de049520574
	.xword	0xa1691fee0ffdddc7
	.xword	0x56c1f86dcf513e8e
	.xword	0xa9cb0d51774ec96f
	.xword	0x383fbc158b62e43e
	.xword	0x69476deb30cb7c10
	.xword	0xbdca74a76dc22e8f
	.xword	0x80e45a697ecf204b
	.xword	0xfe730228feb02e03
	.xword	0xd6bec80112dd1acc
	.xword	0xae4bb928c3437d16
	.xword	0x028dcc33cb954dbf
	.xword	0xe01fac633e7c8062
	.xword	0x24470584b3c4bc96
	.xword	0xa3d9ac319b146a96
	.xword	0x9b0d007ee06b11cc
	.xword	0x0cfbaf80920c6524
	.xword	0x3b7f5cd9857fbb8c
	.xword	0x0a8ecb668ec9b2e4
	.xword	0x2732a5f0e1648f36
	.xword	0xa09933029e2329a0
	.xword	0xf14dd4ba7770a936
	.xword	0x8726b14a3e236c17
	.xword	0x0f8f1f2ae6156bae
	.xword	0x323dba5bdc1c0c89
	.xword	0xfdc5b0c066ea66ff
	.xword	0x906e2ceaac19e53c
	.xword	0x4c0166c5c08df4a0
	.xword	0x98638b150e8b5a59
	.xword	0x62f79dcf1486bc92
	.xword	0x5f20285e3249ce5a
	.xword	0x19830a3a61ce5ccb
	.xword	0x0237f6709bafadfe
	.xword	0xe71a57d14657b4c4
	.xword	0x5cfd45a96979f89d
	.xword	0x24c5f2293ed0ca76
	.xword	0xd0cca159fd96ef4a
	.xword	0x9c5c85832a510a2d
	.xword	0x16b7b1f661e68fc3
	.xword	0xf30565fdba2ffe17
	.xword	0x7555a524fd7df51a
	.xword	0x5021625dafa0741f
	.xword	0x8df7b4784be0175c
	.xword	0x779b3a9a62d7bddb
	.xword	0xbe091283d0d2e02a
	.xword	0x8bd23c7cd7c2f722
	.xword	0xd576e62589789b23
	.xword	0x21f5de8b367af928
	.xword	0xf2c9e8ca24eba80b
	.xword	0x6c1ca803b31495a5
	.xword	0x81f0de5f01b3f8b5
	.xword	0x94a76087491f5e3a
	.xword	0x267a1e0edd20cc32
	.xword	0xa8da8ce560ca6cd7
	.xword	0xe2679053b0349b15
	.xword	0x049cb7fcf2273c08
	.xword	0x5a238c23eb04ec39
	.xword	0x9fd789d8b824bc64
	.xword	0x98d3235a2f905923
	.xword	0x188591ad92a4086c
	.xword	0x1c7a6f2cf55b4992
	.xword	0x819abc12960c10d0
	.xword	0xa8eadea42c504da7
	.xword	0x8a7e078fa368dd2e
	.xword	0xda19fd2820cb5450
	.xword	0xab7b73c45f8e2202
	.xword	0x7890659bc3ffd146
	.xword	0xe84fc530ee9d29e0
	.xword	0xda67d5c7f0de50a1
	.xword	0xf3fa7d037f95456c
	.xword	0x6992674fb635d686
	.xword	0xe406ed0d15e2ed47
	.xword	0x7761cd63ebbe4377
	.xword	0x2174b3df7a51654b
	.xword	0x050982b96b6691ab
	.xword	0x0a777d88c1bb2251
	.xword	0x7bc675bb9a49cb83
	.xword	0x6849652098d758f7
	.xword	0x59f08fd0c3a38360
	.xword	0x6530e6aa94befcee
	.xword	0x687e5652e60adaf8
	.xword	0x87ea09207333f142
	.xword	0x509fbf886e9bbd83
	.xword	0xe648caef46a6e4dd
	.xword	0x097d2eb565723032
	.xword	0x871875efbbdbfaa2
	.xword	0xc0973f3dfaf7ea02
	.xword	0xb8035f60cd9140a3
	.xword	0x6d6f872cf0aeb3a2
	.xword	0xd1f912bd73a5d614
	.xword	0x6a737fd67d62c53e
	.xword	0x84993085964f0d24
	.xword	0x3edda5f107367429
	.xword	0xc41d85078cc0e736
	.xword	0x2fcdc6b7c0554436
	.xword	0x9619835bed549111
	.xword	0xf37424ab99e7e5f6
	.xword	0x065c9169c576d3f9
	.xword	0x596b4bab7b8e1d6f
	.xword	0x48c2e0f476721b61
	.xword	0x52bdad66b48e6945
	.xword	0x67d7801438ad05e5
	.xword	0x354824daea7b73b9
	.xword	0x56ca6939649f0a9f
	.xword	0x990f9a6aec912357
	.xword	0x7b0d913b264d7ba8
	.xword	0x6665f1a287b48f14
	.xword	0x5f92dff6b4a43053
	.xword	0x4d5627b85d297eec
	.xword	0x3a27c0f72a01c746
	.xword	0xd2b4238820636b41
	.xword	0xd2bfb4a2a5fd7255
	.xword	0x79948b0df309094f
	.xword	0x11a712f2a00fa683
	.xword	0xae216ca5f972b9ac
	.xword	0x74859eecd065b0b0
	.xword	0x4900bf268f3f6d82
	.xword	0x3c39eba971d42a4b
	.xword	0xd4429dfc36b78d41
	.xword	0xf4580a7b1b985ef8
	.xword	0xd752d1409227e75b
	.xword	0xd98045d9076dbe9b
	.xword	0xb2f7522e491110e8
	.xword	0xc195478b68b699a5
	.xword	0x9bdca496c418bde8
	.xword	0xc7fc1ff327427b04
	.xword	0x524e3d71c7fc2f1f
	.xword	0xd16b2e58e5280a81
	.xword	0xb012ba4522be39e8
	.xword	0x2185a95fcb7017d7
	.xword	0x34c8497f9a59d321
	.xword	0xc087d792bb20fcd6
	.xword	0xef93707c0ce116e8
	.xword	0x2322410cd2dfb7f8
	.xword	0x0de31057285308d3
	.xword	0xac6dd4a2c8b32d53
	.xword	0x6a33f7729a5036a7
	.xword	0x042809c0558acb5e
	.xword	0xfbd9c07b93c93e92
	.xword	0x280b726e53619371
	.xword	0xc74e083a2e06550c
	.xword	0x8a71addaed1e24bf
	.xword	0x85590020b4b917c3
	.xword	0x8294254b87c2615a
	.xword	0x822518a023dd965d
	.xword	0x4f9c43e9553142b6
	.xword	0xa8c4bf9b00efa6fc
	.xword	0xf445b8a581903165
	.xword	0xbf79c36144bf835d
	.xword	0xe89b4fdbe69987b5
	.xword	0x6911f020beb68fa7
	.xword	0x2b4c655fb90dc05b
	.xword	0xf62d84e36e26953c
	.xword	0xac80f2b485d250e4
	.xword	0xbb4417c304528fe5
	.xword	0xe8bd14d12d4b1d03
	.xword	0x90c3e5ed0a20bb02
	.xword	0x0d68b19b52027617
	.xword	0xa29b68babc15efb3
	.xword	0xaf552643f887d7c1
	.xword	0xa10b68ff3ae4d9da
	.xword	0xc22531188e347791
	.xword	0xd60df8452a988cc1
	.xword	0xe16529c8dfba60fa
	.xword	0xf8bb1e10056d07ff
	.xword	0x1e8c2e16529af0c9
	.xword	0xcbee7ed7a4b52734
	.xword	0xccde440057d91cb8
	.xword	0x9298700524aa54d0
	.xword	0x871a467260f12422
	.xword	0x0868e575781a2ba6
	.xword	0xca28c5973a97eff9
	.xword	0xd7d0a504cd30472f
	.xword	0xcc007beb5ca30dea
	.xword	0x9a7734ca41b10655
	.xword	0xae9ad019c84cbdf9
	.xword	0x8ee5fcd362e4377c
	.xword	0x313f5fc5a9da2c9a
	.xword	0xf7764a059abe6640
	.xword	0x15cd456f0a4b1cbc
	.xword	0x43b79ca11f2cc9e3
	.xword	0x61839a91a8980fc3
	.xword	0x5c14fab8ed78b995
	.xword	0x52b778cd702a03ee
	.xword	0xfc9cdaf2459c3113
	.xword	0x1aafb644d352f324
	.xword	0xc7e219c7e57ffae0
	.xword	0x9f7da1bdc6717c5c
	.xword	0xac49ff27e691183c
	.xword	0xafc32bb9c7c6c430
	.xword	0x368180fbf3b6e02e
	.xword	0x4eb7a558a40a6f52
	.xword	0xe900405be208fada
	.xword	0x9b189e02cb1767dd
	.xword	0x397f2ecde09b6f89
	.xword	0x96cb77c3f50af8a8
	.xword	0x587618e159507f62
	.xword	0xf6b6fa151d62dc56
	.xword	0x72b080452e21ae66
	.xword	0x7f996fb5e74b1792
	.xword	0x267917adb47fd84d
	.xword	0x44fa41df7267d1fa
	.xword	0xe6a3ac2706a9d1fa
	.xword	0xa0e352a8c3184328
	.xword	0x5cf9fc558c316dd2
	.xword	0x735534e2a7a75d27
	.xword	0xf23d4c9ed6d81263
	.xword	0xeaaa16d51807697b
	.xword	0x4208b630371fbcbc
	.xword	0xc48c2897dcd8789c
	.xword	0x729e886d4adc4f3b
	.xword	0xb447984094a01884
	.xword	0xd6295fa014a25d76
	.xword	0xb11010a49313e882
	.xword	0x52692e31b207be77
	.xword	0x92b81ef2103bf584
	.xword	0x04b89bd67bacac10
	.xword	0xf6daa70b23d101c0
	.xword	0x32aefef9f414b5f4
	.xword	0x6bf72f458f0778a0
	.xword	0x00a5950a7582ca35
	.xword	0xc7a5cd394d60edf0
	.xword	0x7caf5807169e37e2
	.xword	0xa23b2a99b4c0dcce
	.xword	0xf7f9f79b553bf04f
	.xword	0x9273b998f9c40aa0
	.xword	0xaffb91d061c775c5
	.xword	0x4b1d04a1aadc8fdf
	.xword	0xcb4e20613cb42b92
	.xword	0xedfa134d22bfc26a
	.xword	0x6568930be7d49b9c
	.xword	0x955ef77b58537e7f
	.xword	0x459e28b4e0f3dbb5
	.xword	0x4124a520aab71279
	.xword	0x21ae85a56bc39ccb
	.xword	0x7f461adec491845a
	.xword	0x4db52054b3c20fcd
	.xword	0x63b79d61c7b11d94
	.xword	0x553b36b9502f7f84
	.xword	0x4bc42cae0fbbf233
	.xword	0x63634c402530b864
	.xword	0x9fd84a165a0b4953
	.xword	0xd394d1f36d1cf882
	.xword	0x4f881823d8c6278d
	.xword	0x2e12bd04739c2941
	.xword	0x4e6a5c6d12e0398a
	.xword	0xd13b80d020c21a5b
	.xword	0x706e7a4cbe630ab7



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
