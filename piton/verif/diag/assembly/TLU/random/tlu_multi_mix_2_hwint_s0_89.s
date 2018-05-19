// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: tlu_multi_mix_2_hwint_s0_89.s
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
   random seed:	356964111
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

	setx 0xa6710071674fda1a, %g1, %g0
	setx 0x6f572bcf168b465c, %g1, %g1
	setx 0xf53e7585305b74b3, %g1, %g2
	setx 0x7cc7ba405cb602eb, %g1, %g3
	setx 0x7aac7a4776ce9d3e, %g1, %g4
	setx 0x24218f91627d30d5, %g1, %g5
	setx 0xcc7cc35e1189ad1d, %g1, %g6
	setx 0xc73f157e404de13e, %g1, %g7
	setx 0x03a2fbcf2574cce2, %g1, %r16
	setx 0x3c00ff11407112c5, %g1, %r17
	setx 0xb0c37afc111dbc4a, %g1, %r18
	setx 0xc84bd4f85fcbedd1, %g1, %r19
	setx 0x35291867ad0ee281, %g1, %r20
	setx 0x7b9c05c6fcd3d7d2, %g1, %r21
	setx 0x5b9acc63b685ea50, %g1, %r22
	setx 0xc51ba86fa34acf7a, %g1, %r23
	setx 0xd8be6316cb73c751, %g1, %r24
	setx 0xcea41ae6ef7494b3, %g1, %r25
	setx 0x3da14ae8bb974ca5, %g1, %r26
	setx 0x11a3df908938c95d, %g1, %r27
	setx 0x2277bb2da6a5f270, %g1, %r28
	setx 0x0414844695c9d02a, %g1, %r29
	setx 0x8a3fe6b398f4764e, %g1, %r30
	setx 0xfe14dcc21b60770b, %g1, %r31
	save
	setx 0x73ebc4a11721c3b1, %g1, %r16
	setx 0xc061654f129d731b, %g1, %r17
	setx 0x751b5c01d6b460de, %g1, %r18
	setx 0x1a58a283744ecadc, %g1, %r19
	setx 0x3f78c5bc3acb8966, %g1, %r20
	setx 0x7a0ea39c52470d30, %g1, %r21
	setx 0xa70128147708bb48, %g1, %r22
	setx 0xd0309539db3e50f2, %g1, %r23
	setx 0x9576f7410f0bbe86, %g1, %r24
	setx 0xf7f4fc12f28d763c, %g1, %r25
	setx 0x96767abb7d12df15, %g1, %r26
	setx 0xdadec069829096db, %g1, %r27
	setx 0xc84f00abfc37ba72, %g1, %r28
	setx 0xe4eb56807cd15174, %g1, %r29
	setx 0x331741775d0178d9, %g1, %r30
	setx 0xb1032c13b9f805b5, %g1, %r31
	save
	setx 0x1aeac840847f900f, %g1, %r16
	setx 0x92185aea1a9b91f5, %g1, %r17
	setx 0x501c175e2c2e7313, %g1, %r18
	setx 0xd37235ab703ba68e, %g1, %r19
	setx 0x8a9128f516556767, %g1, %r20
	setx 0xe5a71732bd29de1c, %g1, %r21
	setx 0x8a0db1774ef20e17, %g1, %r22
	setx 0x5b744da7d0b5a449, %g1, %r23
	setx 0xf2558872714c01c0, %g1, %r24
	setx 0x9e90fd7d7ab220a7, %g1, %r25
	setx 0x12f796e24ae5b6c1, %g1, %r26
	setx 0x4824ddeb4bb5a3df, %g1, %r27
	setx 0xb90f1d72b9df6fff, %g1, %r28
	setx 0x3065f6047d0eecee, %g1, %r29
	setx 0x1ef98f7ecd644055, %g1, %r30
	setx 0xfed7a9b1fd414a39, %g1, %r31
	save
	setx 0x9a91924617882f99, %g1, %r16
	setx 0xe5ab9d4ddcd4996f, %g1, %r17
	setx 0xac3108b6d5bf8194, %g1, %r18
	setx 0x1eef080c404c2b48, %g1, %r19
	setx 0xa662806f468cde04, %g1, %r20
	setx 0x9ccbc13e3a4a4c7a, %g1, %r21
	setx 0x1aee0c1fc5af5493, %g1, %r22
	setx 0x7e534660cc2a3399, %g1, %r23
	setx 0x86ffd40c3f04b59c, %g1, %r24
	setx 0xc70eed72283a0ab9, %g1, %r25
	setx 0x0819d19164a8d104, %g1, %r26
	setx 0x527612496247038c, %g1, %r27
	setx 0x47502f20b09ad7f0, %g1, %r28
	setx 0xd07b78bdeece742f, %g1, %r29
	setx 0x1bf1ed7310f76dcd, %g1, %r30
	setx 0x24d4c3f84f17bc79, %g1, %r31
	save
	setx 0xde2c80bf65ecc580, %g1, %r16
	setx 0xcbc9d3afb9f19395, %g1, %r17
	setx 0x6f999ee15f387f20, %g1, %r18
	setx 0x6ba85d2fe3fc9113, %g1, %r19
	setx 0x8e26ee90c4a457a8, %g1, %r20
	setx 0xc240204e066d477e, %g1, %r21
	setx 0x4aac92ca844d61a5, %g1, %r22
	setx 0x8b4e9324a48b379c, %g1, %r23
	setx 0x8e8c38e4ff6f9af5, %g1, %r24
	setx 0x952d7e25c84093f3, %g1, %r25
	setx 0x922aaead4d863562, %g1, %r26
	setx 0x1014aec5f4c32f26, %g1, %r27
	setx 0x0d79b5d53aedd069, %g1, %r28
	setx 0x130180891dccbea0, %g1, %r29
	setx 0x5a14b86f507603df, %g1, %r30
	setx 0x1f8775950e696af1, %g1, %r31
	save
	setx 0x361e3de37cc12d29, %g1, %r16
	setx 0x1f036f685fb6fa8e, %g1, %r17
	setx 0xce109d378c707df3, %g1, %r18
	setx 0x02ce741e0f839873, %g1, %r19
	setx 0x302316ff956fbc21, %g1, %r20
	setx 0x9255481082aa8d08, %g1, %r21
	setx 0x8651b4fadcb9c6e1, %g1, %r22
	setx 0xa97a9757ada4960c, %g1, %r23
	setx 0xc69495bb13f9496e, %g1, %r24
	setx 0x79b36ff17976d578, %g1, %r25
	setx 0xafb49f9ca1a18909, %g1, %r26
	setx 0x378c0aa7a14e2fc8, %g1, %r27
	setx 0x256460ba429d56ab, %g1, %r28
	setx 0x790c33cc9e1b0c22, %g1, %r29
	setx 0xb479f19484dafe92, %g1, %r30
	setx 0x926d991b3825d2e1, %g1, %r31
	save
	setx 0x73cce751ec508cbc, %g1, %r16
	setx 0x60a71b9055c1d3fa, %g1, %r17
	setx 0xb792d253704b9dcf, %g1, %r18
	setx 0xcf828ccfde504dfd, %g1, %r19
	setx 0x551e662ba2f4ed4d, %g1, %r20
	setx 0xfce7e4ed12009ffb, %g1, %r21
	setx 0x6b44106a92f066ca, %g1, %r22
	setx 0x41fbc444736078bd, %g1, %r23
	setx 0x18a68521b3978ee6, %g1, %r24
	setx 0x575b0d4d11028357, %g1, %r25
	setx 0x04aedf2bdfdafe9e, %g1, %r26
	setx 0x7f49f285b129a519, %g1, %r27
	setx 0xbdbb97edca4fcaee, %g1, %r28
	setx 0xa8d7c991f8631920, %g1, %r29
	setx 0x00eeb618e879cb9f, %g1, %r30
	setx 0xef3cfb62125fd33e, %g1, %r31
	save
	setx 0x7f5fe78564ec9539, %g1, %r16
	setx 0x7cacd329123e85cb, %g1, %r17
	setx 0x01d65eaf6482a309, %g1, %r18
	setx 0x9a06ba09109ad381, %g1, %r19
	setx 0x04e19d18d9bfcac7, %g1, %r20
	setx 0x0f5ac56df55582db, %g1, %r21
	setx 0xf69fc2178738a370, %g1, %r22
	setx 0xc67b905d22e486a7, %g1, %r23
	setx 0x5849dd3d9e790c18, %g1, %r24
	setx 0x4d06a445497fcfe3, %g1, %r25
	setx 0xdb76d58b61d8a2e8, %g1, %r26
	setx 0x879882fd8db1d088, %g1, %r27
	setx 0x3f7a5c60104b270f, %g1, %r28
	setx 0xb7c973eb873d9abc, %g1, %r29
	setx 0xa70e221f7789d1ba, %g1, %r30
	setx 0x5461d4bebd02d5ab, %g1, %r31
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
hwintr_0_0:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_0), 16, 16)) -> intp(0, 0, 3e)
	.word 0x899421cb  ! 3: WRPR_TICK_I	wrpr	%r16, 0x01cb, %tick
	mov	1, %r12
	.word 0x8f930000  ! 6: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xb5510000  ! 7: RDPR_TICK	<illegal instruction>
	.word 0x899461a0  ! 8: WRPR_TICK_I	wrpr	%r17, 0x01a0, %tick
	.word 0xbfe4a06c  ! 9: SAVE_I	save	%r18, 0x0001, %r31
	.word 0xb1e4a032  ! 11: SAVE_I	save	%r18, 0x0001, %r24
	.word 0xbde5e049  ! 14: SAVE_I	save	%r23, 0x0001, %r30
	mov	0, %r12
	.word 0xa1930000  ! 15: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0x8195a05d  ! 16: WRPR_TPC_I	wrpr	%r22, 0x005d, %tpc
	.word 0xbde56028  ! 21: SAVE_I	save	%r21, 0x0001, %r30
	.word 0xb485e117  ! 22: ADDcc_I	addcc 	%r23, 0x0117, %r26
	.word 0xbbe560fa  ! 24: SAVE_I	save	%r21, 0x0001, %r29
	.word 0xb3e5e097  ! 26: SAVE_I	save	%r23, 0x0001, %r25
	mov	2, %r12
	.word 0x8f930000  ! 27: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xb0944000  ! 28: ORcc_R	orcc 	%r17, %r0, %r24
hwintr_0_1:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_1), 16, 16)) -> intp(0, 0, f)
	.word 0xbcb50000  ! 32: SUBCcc_R	orncc 	%r20, %r0, %r30
	.word 0xb084218b  ! 33: ADDcc_I	addcc 	%r16, 0x018b, %r24
	.word 0xbbe42024  ! 34: SAVE_I	save	%r16, 0x0001, %r29
	.word 0xb5e4a1fc  ! 35: SAVE_I	save	%r18, 0x0001, %r26
hwintr_0_2:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_2), 16, 16)) -> intp(0, 0, 10)
	.word 0x9195a103  ! 40: WRPR_PIL_I	wrpr	%r22, 0x0103, %pil
	.word 0xb9e5e1d3  ! 45: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xbd520000  ! 47: RDPR_PIL	<illegal instruction>
	.word 0xbfe560cd  ! 48: SAVE_I	save	%r21, 0x0001, %r31
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb9e421f8  ! 51: SAVE_I	save	%r16, 0x0001, %r28
	.word 0xb7504000  ! 53: RDPR_TNPC	<illegal instruction>
	.word 0xbfe56169  ! 58: SAVE_I	save	%r21, 0x0001, %r31
	.word 0xb3e561bf  ! 59: SAVE_I	save	%r21, 0x0001, %r25
	.word 0xbfe421f3  ! 63: SAVE_I	save	%r16, 0x0001, %r31
	.word 0xbb510000  ! 65: RDPR_TICK	<illegal instruction>
hwintr_0_3:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_3), 16, 16)) -> intp(0, 0, 0)
	.word 0xb5e5611a  ! 67: SAVE_I	save	%r21, 0x0001, %r26
	.word 0xbde5a025  ! 68: SAVE_I	save	%r22, 0x0001, %r30
	.word 0xb8344000  ! 74: SUBC_R	orn 	%r17, %r0, %r28
	mov	0, %r12
	.word 0xa1930000  ! 81: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb23da15c  ! 86: XNOR_I	xnor 	%r22, 0x015c, %r25
	.word 0xbb480000  ! 89: RDHPR_HPSTATE	rdhpr	%hpstate, %r29
	.word 0xbde46000  ! 90: SAVE_I	save	%r17, 0x0001, %r30
	.word 0x8995a0c5  ! 91: WRPR_TICK_I	wrpr	%r22, 0x00c5, %tick
	.word 0xb7e421fe  ! 92: SAVE_I	save	%r16, 0x0001, %r27
	.word 0x8195a1bf  ! 93: WRPR_TPC_I	wrpr	%r22, 0x01bf, %tpc
	.word 0xb7520000  ! 94: RDPR_PIL	<illegal instruction>
	.word 0x8d94a119  ! 97: WRPR_PSTATE_I	wrpr	%r18, 0x0119, %pstate
	.word 0xb9e5a031  ! 100: SAVE_I	save	%r22, 0x0001, %r28
	.word 0xb1e561fa  ! 104: SAVE_I	save	%r21, 0x0001, %r24
	.word 0xbde4e072  ! 105: SAVE_I	save	%r19, 0x0001, %r30
	.word 0xb1e56110  ! 106: SAVE_I	save	%r21, 0x0001, %r24
	.word 0xb1e5211a  ! 109: SAVE_I	save	%r20, 0x0001, %r24
	.word 0xbf510000  ! 111: RDPR_TICK	<illegal instruction>
	.word 0xb3e56188  ! 112: SAVE_I	save	%r21, 0x0001, %r25
	.word 0xbc9d61df  ! 114: XORcc_I	xorcc 	%r21, 0x01df, %r30
	.word 0xb5e5a1bc  ! 115: SAVE_I	save	%r22, 0x0001, %r26
	.word 0xb3e4e05d  ! 117: SAVE_I	save	%r19, 0x0001, %r25
	.word 0x9195600b  ! 120: WRPR_PIL_I	wrpr	%r21, 0x000b, %pil
	.word 0xbfe520d9  ! 121: SAVE_I	save	%r20, 0x0001, %r31
	.word 0xb9e561d6  ! 122: SAVE_I	save	%r21, 0x0001, %r28
	.word 0xb3e5204e  ! 123: SAVE_I	save	%r20, 0x0001, %r25
	.word 0xbaa48000  ! 125: SUBcc_R	subcc 	%r18, %r0, %r29
	.word 0xb6a54000  ! 126: SUBcc_R	subcc 	%r21, %r0, %r27
	.word 0xbbe52167  ! 127: SAVE_I	save	%r20, 0x0001, %r29
	mov	2, %r12
	.word 0xa1930000  ! 128: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xbbe5e12d  ! 129: SAVE_I	save	%r23, 0x0001, %r29
	.word 0xb5e561ad  ! 131: SAVE_I	save	%r21, 0x0001, %r26
	.word 0xbbe5204b  ! 135: SAVE_I	save	%r20, 0x0001, %r29
	.word 0xbb518000  ! 136: RDPR_PSTATE	<illegal instruction>
	.word 0xbbe5a12d  ! 137: SAVE_I	save	%r22, 0x0001, %r29
hwintr_0_4:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_4), 16, 16)) -> intp(0, 0, 1b)
	.word 0xb8b5e009  ! 144: ORNcc_I	orncc 	%r23, 0x0009, %r28
hwintr_0_5:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_5), 16, 16)) -> intp(0, 0, 2d)
	.word 0xb9e5e073  ! 150: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xb5e520af  ! 151: SAVE_I	save	%r20, 0x0001, %r26
	.word 0xbbe52065  ! 153: SAVE_I	save	%r20, 0x0001, %r29
	setx	0xe21f81800009d0f, %g1, %r10
	.word 0x839a8000  ! 155: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb7e4e152  ! 160: SAVE_I	save	%r19, 0x0001, %r27
	.word 0xb4bc2182  ! 161: XNORcc_I	xnorcc 	%r16, 0x0182, %r26
hwintr_0_6:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_6), 16, 16)) -> intp(0, 0, c)
hwintr_0_7:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_7), 16, 16)) -> intp(0, 0, 30)
	.word 0x89946193  ! 168: WRPR_TICK_I	wrpr	%r17, 0x0193, %tick
	.word 0xbfe560e8  ! 169: SAVE_I	save	%r21, 0x0001, %r31
	.word 0x859421d0  ! 170: WRPR_TSTATE_I	wrpr	%r16, 0x01d0, %tstate
	.word 0xbde4e183  ! 172: SAVE_I	save	%r19, 0x0001, %r30
	.word 0xb015e1e7  ! 176: OR_I	or 	%r23, 0x01e7, %r24
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb7e4a0d9  ! 179: SAVE_I	save	%r18, 0x0001, %r27
	.word 0xbde4a094  ! 180: SAVE_I	save	%r18, 0x0001, %r30
	.word 0x85942111  ! 181: WRPR_TSTATE_I	wrpr	%r16, 0x0111, %tstate
	setx	data_start_6, %g1, %r19
	setx	data_start_5, %g1, %r19
	setx	data_start_7, %g1, %r21
	.word 0xb1e5e18b  ! 187: SAVE_I	save	%r23, 0x0001, %r24
hwintr_0_8:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_8), 16, 16)) -> intp(0, 0, 2)
	.word 0xbd480000  ! 189: RDHPR_HPSTATE	rdhpr	%hpstate, %r30
	.word 0xbbe42170  ! 198: SAVE_I	save	%r16, 0x0001, %r29
	.word 0xb1e4a1ff  ! 202: SAVE_I	save	%r18, 0x0001, %r24
	.word 0xbbe520db  ! 204: SAVE_I	save	%r20, 0x0001, %r29
hwintr_0_9:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_9), 16, 16)) -> intp(0, 0, 35)
	.word 0xb7e4e172  ! 208: SAVE_I	save	%r19, 0x0001, %r27
	mov	2, %r12
	.word 0x8f930000  ! 210: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xb3e5e180  ! 216: SAVE_I	save	%r23, 0x0001, %r25
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	setx	0x6438f88a00009c01, %g1, %r10
	.word 0x819a8000  ! 220: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xbfe4a158  ! 221: SAVE_I	save	%r18, 0x0001, %r31
	.word 0x9195e0af  ! 223: WRPR_PIL_I	wrpr	%r23, 0x00af, %pil
	.word 0xbfe42058  ! 224: SAVE_I	save	%r16, 0x0001, %r31
	.word 0xb5e46178  ! 227: SAVE_I	save	%r17, 0x0001, %r26
	.word 0xbbe42131  ! 228: SAVE_I	save	%r16, 0x0001, %r29
	.word 0x879560c7  ! 230: WRPR_TT_I	wrpr	%r21, 0x00c7, %tt
hwintr_0_10:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_10), 16, 16)) -> intp(0, 0, 2)
	.word 0xb0bd8000  ! 236: XNORcc_R	xnorcc 	%r22, %r0, %r24
	.word 0xbbe520eb  ! 238: SAVE_I	save	%r20, 0x0001, %r29
	setx	0xa5b57fb100002d5e, %g1, %r10
	.word 0x839a8000  ! 239: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb9e42019  ! 241: SAVE_I	save	%r16, 0x0001, %r28
	.word 0xb9e4e1bc  ! 242: SAVE_I	save	%r19, 0x0001, %r28
	.word 0xbde421c4  ! 246: SAVE_I	save	%r16, 0x0001, %r30
	.word 0xb3e5e18d  ! 247: SAVE_I	save	%r23, 0x0001, %r25
hwintr_0_11:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_11), 16, 16)) -> intp(0, 0, 1a)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbbe420bf  ! 252: SAVE_I	save	%r16, 0x0001, %r29
	mov	1, %r12
	.word 0xa1930000  ! 255: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0x8795a131  ! 256: WRPR_TT_I	wrpr	%r22, 0x0131, %tt
	setx	data_start_3, %g1, %r19
	.word 0xb7e56036  ! 259: SAVE_I	save	%r21, 0x0001, %r27
	.word 0x89952165  ! 262: WRPR_TICK_I	wrpr	%r20, 0x0165, %tick
	.word 0x8794205f  ! 263: WRPR_TT_I	wrpr	%r16, 0x005f, %tt
	.word 0xb2250000  ! 264: SUB_R	sub 	%r20, %r0, %r25
hwintr_0_12:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_12), 16, 16)) -> intp(0, 0, 2e)
	.word 0xb3504000  ! 268: RDPR_TNPC	<illegal instruction>
	.word 0xb61d2100  ! 275: XOR_I	xor 	%r20, 0x0100, %r27
	setx	data_start_2, %g1, %r16
	.word 0xbfe5a195  ! 279: SAVE_I	save	%r22, 0x0001, %r31
	.word 0x859460b0  ! 281: WRPR_TSTATE_I	wrpr	%r17, 0x00b0, %tstate
	.word 0xbde5e176  ! 282: SAVE_I	save	%r23, 0x0001, %r30
	.word 0xbec48000  ! 288: ADDCcc_R	addccc 	%r18, %r0, %r31
	.word 0xbbe5a047  ! 291: SAVE_I	save	%r22, 0x0001, %r29
	.word 0xb3e4608e  ! 298: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xbfe4615e  ! 299: SAVE_I	save	%r17, 0x0001, %r31
	.word 0x85942139  ! 300: WRPR_TSTATE_I	wrpr	%r16, 0x0139, %tstate
	.word 0xb3520000  ! 308: RDPR_PIL	<illegal instruction>
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb7480000  ! 311: RDHPR_HPSTATE	rdhpr	%hpstate, %r27
	.word 0xb7e56144  ! 314: SAVE_I	save	%r21, 0x0001, %r27
	.word 0xb23dc000  ! 315: XNOR_R	xnor 	%r23, %r0, %r25
	.word 0xbfe52029  ! 317: SAVE_I	save	%r20, 0x0001, %r31
	.word 0x8595a07e  ! 325: WRPR_TSTATE_I	wrpr	%r22, 0x007e, %tstate
	.word 0xbb2d7001  ! 327: SLLX_I	sllx	%r21, 0x0001, %r29
	.word 0xb5480000  ! 328: RDHPR_HPSTATE	rdhpr	%hpstate, %r26
	.word 0xb6240000  ! 329: SUB_R	sub 	%r16, %r0, %r27
	.word 0xbfe4218a  ! 332: SAVE_I	save	%r16, 0x0001, %r31
	.word 0xb3e5e1eb  ! 336: SAVE_I	save	%r23, 0x0001, %r25
	.word 0xbbe5a061  ! 338: SAVE_I	save	%r22, 0x0001, %r29
	.word 0xb7e5e1eb  ! 340: SAVE_I	save	%r23, 0x0001, %r27
	.word 0xb1e56154  ! 347: SAVE_I	save	%r21, 0x0001, %r24
	.word 0xbbe4a1f2  ! 351: SAVE_I	save	%r18, 0x0001, %r29
	.word 0xb9504000  ! 352: RDPR_TNPC	<illegal instruction>
	.word 0xbfe5e1b9  ! 353: SAVE_I	save	%r23, 0x0001, %r31
	.word 0xb7e4a1e3  ! 354: SAVE_I	save	%r18, 0x0001, %r27
	.word 0xbbe5209b  ! 355: SAVE_I	save	%r20, 0x0001, %r29
	.word 0xb5480000  ! 359: RDHPR_HPSTATE	rdhpr	%hpstate, %r26
	.word 0xbfe5e008  ! 362: SAVE_I	save	%r23, 0x0001, %r31
	.word 0xb49c218f  ! 363: XORcc_I	xorcc 	%r16, 0x018f, %r26
	.word 0xba2d4000  ! 364: ANDN_R	andn 	%r21, %r0, %r29
	.word 0xbde461bc  ! 365: SAVE_I	save	%r17, 0x0001, %r30
	.word 0xbd51c000  ! 370: RDPR_TL	<illegal instruction>
	setx	0xf4afe48b0000881b, %g1, %r10
	.word 0x819a8000  ! 373: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xb7e4219e  ! 375: SAVE_I	save	%r16, 0x0001, %r27
	.word 0xb7354000  ! 377: SRL_R	srl 	%r21, %r0, %r27
	setx	0x8666e4cf0000de9b, %g1, %r10
	.word 0x839a8000  ! 381: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb3e4e176  ! 383: SAVE_I	save	%r19, 0x0001, %r25
	.word 0x8995a06f  ! 385: WRPR_TICK_I	wrpr	%r22, 0x006f, %tick
hwintr_0_13:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_13), 16, 16)) -> intp(0, 0, 11)
	mov	2, %r12
	.word 0xa1930000  ! 388: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb550c000  ! 392: RDPR_TT	<illegal instruction>
	.word 0xb52c2001  ! 394: SLL_I	sll 	%r16, 0x0001, %r26
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0x8994a0cf  ! 401: WRPR_TICK_I	wrpr	%r18, 0x00cf, %tick
hwintr_0_14:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_14), 16, 16)) -> intp(0, 0, 2b)
hwintr_0_15:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_15), 16, 16)) -> intp(0, 0, 29)
	.word 0xb63d0000  ! 409: XNOR_R	xnor 	%r20, %r0, %r27
	setx	0x5895df840000fa5f, %g1, %r10
	.word 0x839a8000  ! 410: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xbc0ce03c  ! 411: AND_I	and 	%r19, 0x003c, %r30
	.word 0xb5e52177  ! 413: SAVE_I	save	%r20, 0x0001, %r26
hwintr_0_16:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_16), 16, 16)) -> intp(0, 0, 2)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
hwintr_0_17:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_17), 16, 16)) -> intp(0, 0, 34)
	.word 0xb7e56031  ! 420: SAVE_I	save	%r21, 0x0001, %r27
	.word 0xb894207d  ! 422: ORcc_I	orcc 	%r16, 0x007d, %r28
	.word 0xb23460b4  ! 426: SUBC_I	orn 	%r17, 0x00b4, %r25
	.word 0xb3e5a0ef  ! 431: SAVE_I	save	%r22, 0x0001, %r25
	.word 0xb5504000  ! 435: RDPR_TNPC	<illegal instruction>
	.word 0xb1e56123  ! 439: SAVE_I	save	%r21, 0x0001, %r24
	.word 0xb7504000  ! 442: RDPR_TNPC	<illegal instruction>
	.word 0xb5e5613c  ! 443: SAVE_I	save	%r21, 0x0001, %r26
	.word 0xb4b4c000  ! 445: SUBCcc_R	orncc 	%r19, %r0, %r26
	.word 0xb8b50000  ! 446: SUBCcc_R	orncc 	%r20, %r0, %r28
	.word 0xbde4a1ca  ! 447: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xb1e5a1b2  ! 448: SAVE_I	save	%r22, 0x0001, %r24
	.word 0xbbe42161  ! 450: SAVE_I	save	%r16, 0x0001, %r29
	.word 0xbbe4a087  ! 452: SAVE_I	save	%r18, 0x0001, %r29
	.word 0x8d95614e  ! 453: WRPR_PSTATE_I	wrpr	%r21, 0x014e, %pstate
	.word 0xb5508000  ! 460: RDPR_TSTATE	<illegal instruction>
	.word 0xb3508000  ! 462: RDPR_TSTATE	<illegal instruction>
	.word 0xb60de048  ! 469: AND_I	and 	%r23, 0x0048, %r27
	.word 0xb9504000  ! 471: RDPR_TNPC	<illegal instruction>
	.word 0xb9e5e18c  ! 477: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xbde5e0b4  ! 478: SAVE_I	save	%r23, 0x0001, %r30
	.word 0xb7e5a084  ! 484: SAVE_I	save	%r22, 0x0001, %r27
hwintr_0_18:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_18), 16, 16)) -> intp(0, 0, 21)
	.word 0x8994a191  ! 486: WRPR_TICK_I	wrpr	%r18, 0x0191, %tick
	.word 0xb9e4a0be  ! 487: SAVE_I	save	%r18, 0x0001, %r28
hwintr_0_19:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_19), 16, 16)) -> intp(0, 0, 7)
	.word 0xb3e4a0d7  ! 489: SAVE_I	save	%r18, 0x0001, %r25
	.word 0xb1e5a13e  ! 490: SAVE_I	save	%r22, 0x0001, %r24
	.word 0xb3510000  ! 491: RDPR_TICK	<illegal instruction>
	.word 0xb950c000  ! 492: RDPR_TT	<illegal instruction>
	.word 0xb1500000  ! 493: RDPR_TPC	<illegal instruction>
	.word 0xb3e52114  ! 494: SAVE_I	save	%r20, 0x0001, %r25
	.word 0xbbe4e026  ! 505: SAVE_I	save	%r19, 0x0001, %r29
	.word 0xbcb520dc  ! 506: ORNcc_I	orncc 	%r20, 0x00dc, %r30
	.word 0xbde5e066  ! 509: SAVE_I	save	%r23, 0x0001, %r30
	.word 0xb9e4a042  ! 510: SAVE_I	save	%r18, 0x0001, %r28
	.word 0x9195e05c  ! 511: WRPR_PIL_I	wrpr	%r23, 0x005c, %pil
	.word 0xbde461e1  ! 521: SAVE_I	save	%r17, 0x0001, %r30
	.word 0xb5e520a6  ! 522: SAVE_I	save	%r20, 0x0001, %r26
	.word 0xb351c000  ! 523: RDPR_TL	<illegal instruction>
	.word 0x8195e1ab  ! 526: WRPR_TPC_I	wrpr	%r23, 0x01ab, %tpc
	.word 0xb7e5a067  ! 529: SAVE_I	save	%r22, 0x0001, %r27
	.word 0xb6c521c9  ! 534: ADDCcc_I	addccc 	%r20, 0x01c9, %r27
hwintr_0_20:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_20), 16, 16)) -> intp(0, 0, 9)
	setx	0x6f833fa600007cdb, %g1, %r10
	.word 0x839a8000  ! 540: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb3e5e195  ! 541: SAVE_I	save	%r23, 0x0001, %r25
	.word 0xb9e4a097  ! 543: SAVE_I	save	%r18, 0x0001, %r28
	.word 0xb751c000  ! 545: RDPR_TL	<illegal instruction>
	.word 0xb3e4e023  ! 548: SAVE_I	save	%r19, 0x0001, %r25
	.word 0xba958000  ! 549: ORcc_R	orcc 	%r22, %r0, %r29
	.word 0xb351c000  ! 550: RDPR_TL	<illegal instruction>
	.word 0xbfe5a166  ! 553: SAVE_I	save	%r22, 0x0001, %r31
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb3e421e1  ! 556: SAVE_I	save	%r16, 0x0001, %r25
	.word 0xb5e5a09b  ! 557: SAVE_I	save	%r22, 0x0001, %r26
	.word 0xb5540000  ! 560: RDPR_GL	<illegal instruction>
	.word 0x83946149  ! 561: WRPR_TNPC_I	wrpr	%r17, 0x0149, %tnpc
	.word 0xb3e4a1cc  ! 562: SAVE_I	save	%r18, 0x0001, %r25
	.word 0x8d95e050  ! 565: WRPR_PSTATE_I	wrpr	%r23, 0x0050, %pstate
	.word 0x8595e19c  ! 566: WRPR_TSTATE_I	wrpr	%r23, 0x019c, %tstate
	mov	1, %r12
	.word 0xa1930000  ! 573: WRPR_GL_R	wrpr	%r12, %r0, %-
hwintr_0_21:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_21), 16, 16)) -> intp(0, 0, 17)
	.word 0xbbe46060  ! 575: SAVE_I	save	%r17, 0x0001, %r29
	.word 0xb9e5e0ed  ! 577: SAVE_I	save	%r23, 0x0001, %r28
hwintr_0_22:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_22), 16, 16)) -> intp(0, 0, 2a)
	.word 0x91956008  ! 580: WRPR_PIL_I	wrpr	%r21, 0x0008, %pil
	.word 0x8795e191  ! 581: WRPR_TT_I	wrpr	%r23, 0x0191, %tt
	.word 0xbbe5a0a6  ! 583: SAVE_I	save	%r22, 0x0001, %r29
	.word 0x85952023  ! 585: WRPR_TSTATE_I	wrpr	%r20, 0x0023, %tstate
	.word 0xb9e52084  ! 586: SAVE_I	save	%r20, 0x0001, %r28
	setx	data_start_0, %g1, %r21
	.word 0xb9e4a117  ! 592: SAVE_I	save	%r18, 0x0001, %r28
	.word 0xbde5e1b6  ! 594: SAVE_I	save	%r23, 0x0001, %r30
	.word 0xb5e4603a  ! 600: SAVE_I	save	%r17, 0x0001, %r26
	.word 0x879421b9  ! 604: WRPR_TT_I	wrpr	%r16, 0x01b9, %tt
	.word 0xb3518000  ! 605: RDPR_PSTATE	<illegal instruction>
	.word 0xb9e461b3  ! 606: SAVE_I	save	%r17, 0x0001, %r28
	.word 0x8d94e0ac  ! 607: WRPR_PSTATE_I	wrpr	%r19, 0x00ac, %pstate
	.word 0xb1e5e1d1  ! 608: SAVE_I	save	%r23, 0x0001, %r24
	mov	0, %r12
	.word 0xa1930000  ! 609: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb5e5210b  ! 610: SAVE_I	save	%r20, 0x0001, %r26
hwintr_0_23:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_23), 16, 16)) -> intp(0, 0, 7)
	mov	1, %r12
	.word 0xa1930000  ! 619: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb5510000  ! 623: RDPR_TICK	<illegal instruction>
	.word 0xb5e561a9  ! 625: SAVE_I	save	%r21, 0x0001, %r26
	.word 0xbde460b9  ! 626: SAVE_I	save	%r17, 0x0001, %r30
	.word 0xb7e4202c  ! 629: SAVE_I	save	%r16, 0x0001, %r27
	.word 0xb3e5a0e3  ! 630: SAVE_I	save	%r22, 0x0001, %r25
	.word 0xb551c000  ! 636: RDPR_TL	<illegal instruction>
hwintr_0_24:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_24), 16, 16)) -> intp(0, 0, 24)
	setx	0x1f6785680000ead0, %g1, %r10
	.word 0x839a8000  ! 638: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xbfe4a1af  ! 639: SAVE_I	save	%r18, 0x0001, %r31
	.word 0xb5e42166  ! 641: SAVE_I	save	%r16, 0x0001, %r26
	.word 0xbde4600d  ! 642: SAVE_I	save	%r17, 0x0001, %r30
	.word 0xbcb46068  ! 643: ORNcc_I	orncc 	%r17, 0x0068, %r30
	.word 0x8995a0f0  ! 645: WRPR_TICK_I	wrpr	%r22, 0x00f0, %tick
	.word 0x9194a03d  ! 650: WRPR_PIL_I	wrpr	%r18, 0x003d, %pil
	.word 0x919561a8  ! 652: WRPR_PIL_I	wrpr	%r21, 0x01a8, %pil
	.word 0xb7e5a014  ! 657: SAVE_I	save	%r22, 0x0001, %r27
	.word 0xb7e421de  ! 663: SAVE_I	save	%r16, 0x0001, %r27
hwintr_0_25:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_25), 16, 16)) -> intp(0, 0, 4)
	.word 0xb5e52027  ! 666: SAVE_I	save	%r20, 0x0001, %r26
hwintr_0_26:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_26), 16, 16)) -> intp(0, 0, 16)
hwintr_0_27:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_27), 16, 16)) -> intp(0, 0, 1)
	.word 0xb7e4a09b  ! 671: SAVE_I	save	%r18, 0x0001, %r27
hwintr_0_28:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_28), 16, 16)) -> intp(0, 0, 23)
	.word 0x9194e164  ! 674: WRPR_PIL_I	wrpr	%r19, 0x0164, %pil
hwintr_0_29:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_29), 16, 16)) -> intp(0, 0, 1c)
	.word 0xb3e4a07b  ! 684: SAVE_I	save	%r18, 0x0001, %r25
	.word 0x9194a026  ! 690: WRPR_PIL_I	wrpr	%r18, 0x0026, %pil
	.word 0xb550c000  ! 694: RDPR_TT	<illegal instruction>
hwintr_0_30:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_30), 16, 16)) -> intp(0, 0, 1e)
	.word 0xbb50c000  ! 699: RDPR_TT	<illegal instruction>
	mov	2, %r12
	.word 0xa1930000  ! 704: WRPR_GL_R	wrpr	%r12, %r0, %-
hwintr_0_31:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_31), 16, 16)) -> intp(0, 0, 28)
	.word 0xb9e521f3  ! 707: SAVE_I	save	%r20, 0x0001, %r28
	.word 0xb1518000  ! 711: RDPR_PSTATE	<illegal instruction>
	.word 0x8595e0c3  ! 714: WRPR_TSTATE_I	wrpr	%r23, 0x00c3, %tstate
	.word 0xbebc2108  ! 715: XNORcc_I	xnorcc 	%r16, 0x0108, %r31
	setx	0xd6c1354300003eda, %g1, %r10
	.word 0x839a8000  ! 717: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xbbe4e020  ! 718: SAVE_I	save	%r19, 0x0001, %r29
	mov	0, %r12
	.word 0xa1930000  ! 723: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb9e52126  ! 725: SAVE_I	save	%r20, 0x0001, %r28
hwintr_0_32:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_32), 16, 16)) -> intp(0, 0, 27)
	.word 0xbcb54000  ! 731: SUBCcc_R	orncc 	%r21, %r0, %r30
	.word 0xbbe461a3  ! 732: SAVE_I	save	%r17, 0x0001, %r29
	.word 0xbde4a01b  ! 736: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xb5e5e04f  ! 738: SAVE_I	save	%r23, 0x0001, %r26
	.word 0xb9e4206b  ! 742: SAVE_I	save	%r16, 0x0001, %r28
	.word 0xbde42140  ! 743: SAVE_I	save	%r16, 0x0001, %r30
	.word 0xb7e4e03b  ! 744: SAVE_I	save	%r19, 0x0001, %r27
hwintr_0_33:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_33), 16, 16)) -> intp(0, 0, 9)
	.word 0xb3e4e090  ! 746: SAVE_I	save	%r19, 0x0001, %r25
	.word 0xbfe56043  ! 747: SAVE_I	save	%r21, 0x0001, %r31
	.word 0xb7e4e016  ! 748: SAVE_I	save	%r19, 0x0001, %r27
	.word 0xb3500000  ! 750: RDPR_TPC	<illegal instruction>
	.word 0xbfe4e154  ! 751: SAVE_I	save	%r19, 0x0001, %r31
	.word 0xb9e561b7  ! 753: SAVE_I	save	%r21, 0x0001, %r28
hwintr_0_34:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_34), 16, 16)) -> intp(0, 0, 6)
	.word 0xbde4614c  ! 758: SAVE_I	save	%r17, 0x0001, %r30
	.word 0xb3e4a11b  ! 759: SAVE_I	save	%r18, 0x0001, %r25
hwintr_0_35:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_35), 16, 16)) -> intp(0, 0, b)
	.word 0xb435a163  ! 762: SUBC_I	orn 	%r22, 0x0163, %r26
	.word 0xb7e5e049  ! 763: SAVE_I	save	%r23, 0x0001, %r27
	.word 0xb23d8000  ! 770: XNOR_R	xnor 	%r22, %r0, %r25
	.word 0xb7480000  ! 773: RDHPR_HPSTATE	rdhpr	%hpstate, %r27
hwintr_0_36:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_36), 16, 16)) -> intp(0, 0, 29)
	.word 0xbb504000  ! 776: RDPR_TNPC	<illegal instruction>
	setx	data_start_4, %g1, %r19
	.word 0xb3e560e1  ! 778: SAVE_I	save	%r21, 0x0001, %r25
hwintr_0_37:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_37), 16, 16)) -> intp(0, 0, 3b)
	.word 0xb7e5e071  ! 784: SAVE_I	save	%r23, 0x0001, %r27
	.word 0xb7e521dd  ! 786: SAVE_I	save	%r20, 0x0001, %r27
	.word 0xb93c4000  ! 788: SRA_R	sra 	%r17, %r0, %r28
	setx	data_start_5, %g1, %r20
	.word 0x9195e0de  ! 795: WRPR_PIL_I	wrpr	%r23, 0x00de, %pil
	.word 0xb5e5e05e  ! 796: SAVE_I	save	%r23, 0x0001, %r26
	.word 0x9195a1ca  ! 797: WRPR_PIL_I	wrpr	%r22, 0x01ca, %pil
	setx	data_start_4, %g1, %r17
	.word 0xb60ca02d  ! 800: AND_I	and 	%r18, 0x002d, %r27
	setx	data_start_2, %g1, %r20
	.word 0xb7e5e026  ! 811: SAVE_I	save	%r23, 0x0001, %r27
	.word 0xb3500000  ! 812: RDPR_TPC	<illegal instruction>
	.word 0xb1e56085  ! 814: SAVE_I	save	%r21, 0x0001, %r24
	.word 0xbf3dd000  ! 816: SRAX_R	srax	%r23, %r0, %r31
	.word 0xbde52021  ! 818: SAVE_I	save	%r20, 0x0001, %r30
	.word 0xbfe521b1  ! 823: SAVE_I	save	%r20, 0x0001, %r31
	.word 0xb3e420d4  ! 829: SAVE_I	save	%r16, 0x0001, %r25
hwintr_0_38:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_38), 16, 16)) -> intp(0, 0, c)
	.word 0xb8c46190  ! 835: ADDCcc_I	addccc 	%r17, 0x0190, %r28
hwintr_0_39:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_39), 16, 16)) -> intp(0, 0, 10)
	.word 0xbfe5e0f9  ! 843: SAVE_I	save	%r23, 0x0001, %r31
	setx	data_start_6, %g1, %r23
	.word 0xb1500000  ! 846: RDPR_TPC	<illegal instruction>
	.word 0xb7e4e148  ! 848: SAVE_I	save	%r19, 0x0001, %r27
	.word 0xb3e4a0a3  ! 849: SAVE_I	save	%r18, 0x0001, %r25
	.word 0x8995e057  ! 851: WRPR_TICK_I	wrpr	%r23, 0x0057, %tick
hwintr_0_40:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_40), 16, 16)) -> intp(0, 0, 2a)
	.word 0x8995a102  ! 853: WRPR_TICK_I	wrpr	%r22, 0x0102, %tick
	mov	1, %r12
	.word 0xa1930000  ! 854: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0x83952108  ! 855: WRPR_TNPC_I	wrpr	%r20, 0x0108, %tnpc
	.word 0xb1e561bc  ! 856: SAVE_I	save	%r21, 0x0001, %r24
	.word 0xb5e4a083  ! 861: SAVE_I	save	%r18, 0x0001, %r26
	.word 0xb5e460c5  ! 862: SAVE_I	save	%r17, 0x0001, %r26
	.word 0x8d94e175  ! 863: WRPR_PSTATE_I	wrpr	%r19, 0x0175, %pstate
	.word 0xbde46128  ! 864: SAVE_I	save	%r17, 0x0001, %r30
	.word 0xb1520000  ! 866: RDPR_PIL	<illegal instruction>
	.word 0xb551c000  ! 868: RDPR_TL	<illegal instruction>
	.word 0xb3e5e045  ! 871: SAVE_I	save	%r23, 0x0001, %r25
	.word 0xbfe5a0e9  ! 873: SAVE_I	save	%r22, 0x0001, %r31
	.word 0xbde461ad  ! 874: SAVE_I	save	%r17, 0x0001, %r30
	setx	0xa2a171900000bc4a, %g1, %r10
	.word 0x839a8000  ! 875: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xbd50c000  ! 877: RDPR_TT	<illegal instruction>
	.word 0x9195e0b1  ! 886: WRPR_PIL_I	wrpr	%r23, 0x00b1, %pil
	.word 0xb7e4a0d6  ! 889: SAVE_I	save	%r18, 0x0001, %r27
	.word 0xb1e5a155  ! 894: SAVE_I	save	%r22, 0x0001, %r24
	.word 0xbfe4e1b5  ! 895: SAVE_I	save	%r19, 0x0001, %r31
	.word 0xbde5217c  ! 897: SAVE_I	save	%r20, 0x0001, %r30
	.word 0xb7e4618d  ! 900: SAVE_I	save	%r17, 0x0001, %r27
	.word 0xbfe420b6  ! 901: SAVE_I	save	%r16, 0x0001, %r31
	setx	data_start_2, %g1, %r22
	.word 0xb5e4e1b5  ! 909: SAVE_I	save	%r19, 0x0001, %r26
	.word 0xb9540000  ! 910: RDPR_GL	<illegal instruction>
hwintr_0_41:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_41), 16, 16)) -> intp(0, 0, 1b)
	.word 0xb9e4215a  ! 916: SAVE_I	save	%r16, 0x0001, %r28
	.word 0xb9e5e0db  ! 917: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xbde46038  ! 919: SAVE_I	save	%r17, 0x0001, %r30
	.word 0xbd508000  ! 920: RDPR_TSTATE	<illegal instruction>
	.word 0xbde56013  ! 924: SAVE_I	save	%r21, 0x0001, %r30
	mov	2, %r12
	.word 0x8f930000  ! 926: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0x9195e131  ! 927: WRPR_PIL_I	wrpr	%r23, 0x0131, %pil
	.word 0xb7e4614e  ! 929: SAVE_I	save	%r17, 0x0001, %r27
hwintr_0_42:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_42), 16, 16)) -> intp(0, 0, f)
	.word 0xb151c000  ! 932: RDPR_TL	<illegal instruction>
	.word 0xb1520000  ! 934: RDPR_PIL	<illegal instruction>
	.word 0xbbe5610f  ! 936: SAVE_I	save	%r21, 0x0001, %r29
	setx	data_start_7, %g1, %r21
hwintr_0_43:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_43), 16, 16)) -> intp(0, 0, 33)
	.word 0xb9e5215f  ! 958: SAVE_I	save	%r20, 0x0001, %r28
	.word 0xbde56157  ! 961: SAVE_I	save	%r21, 0x0001, %r30
	.word 0xbfe460f9  ! 964: SAVE_I	save	%r17, 0x0001, %r31
hwintr_0_44:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_44), 16, 16)) -> intp(0, 0, 32)
	.word 0xb9e4e0b9  ! 967: SAVE_I	save	%r19, 0x0001, %r28
	.word 0xbde520e0  ! 969: SAVE_I	save	%r20, 0x0001, %r30
	.word 0xbbe4a126  ! 971: SAVE_I	save	%r18, 0x0001, %r29
	.word 0xba0c8000  ! 973: AND_R	and 	%r18, %r0, %r29
	.word 0xb5e5a017  ! 974: SAVE_I	save	%r22, 0x0001, %r26
	.word 0xb9e4601a  ! 976: SAVE_I	save	%r17, 0x0001, %r28
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xbd7d2401  ! 983: MOVR_I	movre	%r20, 0x1, %r30
	.word 0xbbe4a064  ! 985: SAVE_I	save	%r18, 0x0001, %r29
	.word 0xb3e5a0c9  ! 988: SAVE_I	save	%r22, 0x0001, %r25
	.word 0xbde4e1d9  ! 991: SAVE_I	save	%r19, 0x0001, %r30
	mov	1, %r12
	.word 0xa1930000  ! 994: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0x8794a016  ! 996: WRPR_TT_I	wrpr	%r18, 0x0016, %tt
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
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_0), 16, 16)) -> intp(3, 0, 2f)
	.word 0x8994e182  ! 3: WRPR_TICK_I	wrpr	%r19, 0x0182, %tick
	.word 0xf63d608e  ! 4: STD_I	std	%r27, [%r21 + 0x008e]
	mov	0, %r12
	.word 0x8f930000  ! 6: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xb1510000  ! 7: RDPR_TICK	rdpr	%tick, %r24
	.word 0x8995e188  ! 8: WRPR_TICK_I	wrpr	%r23, 0x0188, %tick
	.word 0xf435c000  ! 12: STH_R	sth	%r26, [%r23 + %r0]
	mov	0, %r12
	.word 0xa1930000  ! 15: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0x8195a042  ! 16: WRPR_TPC_I	wrpr	%r22, 0x0042, %tpc
	.word 0xf0752144  ! 17: STX_I	stx	%r24, [%r20 + 0x0144]
	.word 0xff3de020  ! 18: STDF_I	std	%f31, [0x0020, %r23]
	.word 0xf23460e2  ! 20: STH_I	sth	%r25, [%r17 + 0x00e2]
	.word 0xb28520d1  ! 22: ADDcc_I	addcc 	%r20, 0x00d1, %r25
	mov	0, %r12
	.word 0x8f930000  ! 27: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xb4940000  ! 28: ORcc_R	orcc 	%r16, %r0, %r26
hwintr_3_1:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_1), 16, 16)) -> intp(3, 0, 4)
	.word 0xb2b44000  ! 32: SUBCcc_R	orncc 	%r17, %r0, %r25
	.word 0xbe8560a7  ! 33: ADDcc_I	addcc 	%r21, 0x00a7, %r31
hwintr_3_2:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_2), 16, 16)) -> intp(3, 0, 14)
	.word 0x9194e008  ! 40: WRPR_PIL_I	wrpr	%r19, 0x0008, %pil
	.word 0xf93d4000  ! 41: STDF_R	std	%f28, [%r0, %r21]
	.word 0xf4754000  ! 42: STX_R	stx	%r26, [%r21 + %r0]
	.word 0xbb520000  ! 47: RDPR_PIL	rdpr	%pil, %r29
	.word 0xf6248000  ! 49: STW_R	stw	%r27, [%r18 + %r0]
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xf82dc000  ! 52: STB_R	stb	%r28, [%r23 + %r0]
	.word 0xb9504000  ! 53: RDPR_TNPC	<illegal instruction>
	.word 0xf42d8000  ! 60: STB_R	stb	%r26, [%r22 + %r0]
	.word 0xf83d61d5  ! 62: STD_I	std	%r28, [%r21 + 0x01d5]
	.word 0xb5510000  ! 65: RDPR_TICK	<illegal instruction>
hwintr_3_3:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_3), 16, 16)) -> intp(3, 0, 20)
	.word 0xba350000  ! 74: SUBC_R	orn 	%r20, %r0, %r29
	.word 0xfe2dc000  ! 75: STB_R	stb	%r31, [%r23 + %r0]
	.word 0xfc75e1d2  ! 77: STX_I	stx	%r30, [%r23 + 0x01d2]
	mov	0, %r12
	.word 0xa1930000  ! 81: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xf834a08a  ! 84: STH_I	sth	%r28, [%r18 + 0x008a]
	.word 0xb43da019  ! 86: XNOR_I	xnor 	%r22, 0x0019, %r26
	.word 0xff3c2044  ! 88: STDF_I	std	%f31, [0x0044, %r16]
	.word 0xbb480000  ! 89: RDHPR_HPSTATE	rdhpr	%hpstate, %r29
	.word 0x899421ce  ! 91: WRPR_TICK_I	wrpr	%r16, 0x01ce, %tick
	.word 0x81952052  ! 93: WRPR_TPC_I	wrpr	%r20, 0x0052, %tpc
	.word 0xb1520000  ! 94: RDPR_PIL	rdpr	%pil, %r24
	.word 0x8d946045  ! 97: WRPR_PSTATE_I	wrpr	%r17, 0x0045, %pstate
	.word 0xf73ce0d8  ! 98: STDF_I	std	%f27, [0x00d8, %r19]
	.word 0xf82d6094  ! 101: STB_I	stb	%r28, [%r21 + 0x0094]
	.word 0xfe75212d  ! 110: STX_I	stx	%r31, [%r20 + 0x012d]
	.word 0xb7510000  ! 111: RDPR_TICK	rdpr	%tick, %r27
	.word 0xf82d6146  ! 113: STB_I	stb	%r28, [%r21 + 0x0146]
	.word 0xb09d606b  ! 114: XORcc_I	xorcc 	%r21, 0x006b, %r24
	.word 0xf074c000  ! 116: STX_R	stx	%r24, [%r19 + %r0]
	.word 0xf2242021  ! 118: STW_I	stw	%r25, [%r16 + 0x0021]
	.word 0x9194e10f  ! 120: WRPR_PIL_I	wrpr	%r19, 0x010f, %pil
	.word 0xbaa58000  ! 125: SUBcc_R	subcc 	%r22, %r0, %r29
	.word 0xbca44000  ! 126: SUBcc_R	subcc 	%r17, %r0, %r30
	mov	2, %r12
	.word 0xa1930000  ! 128: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xf2240000  ! 133: STW_R	stw	%r25, [%r16 + %r0]
	.word 0xf424e0a9  ! 134: STW_I	stw	%r26, [%r19 + 0x00a9]
	.word 0xb5518000  ! 136: RDPR_PSTATE	rdpr	%pstate, %r26
	.word 0xf435c000  ! 139: STH_R	sth	%r26, [%r23 + %r0]
hwintr_3_4:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_4), 16, 16)) -> intp(3, 0, 1)
	.word 0xb8b4e160  ! 144: ORNcc_I	orncc 	%r19, 0x0160, %r28
	.word 0xfe24a105  ! 145: STW_I	stw	%r31, [%r18 + 0x0105]
hwintr_3_5:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_5), 16, 16)) -> intp(3, 0, 3a)
	.word 0xff3d0000  ! 148: STDF_R	std	%f31, [%r0, %r20]
	.word 0xf33c4000  ! 149: STDF_R	std	%f25, [%r0, %r17]
	.word 0xf0340000  ! 152: STH_R	sth	%r24, [%r16 + %r0]
	setx	0xc8e3fe9100001a9f, %g1, %r10
	.word 0x839a8000  ! 155: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xfc3d8000  ! 156: STD_R	std	%r30, [%r22 + %r0]
	.word 0xf2340000  ! 158: STH_R	sth	%r25, [%r16 + %r0]
	.word 0xfc2c61ea  ! 159: STB_I	stb	%r30, [%r17 + 0x01ea]
	.word 0xb6bce0e0  ! 161: XNORcc_I	xnorcc 	%r19, 0x00e0, %r27
hwintr_3_6:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_6), 16, 16)) -> intp(3, 0, 20)
hwintr_3_7:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_7), 16, 16)) -> intp(3, 0, 3e)
	.word 0xf82d0000  ! 165: STB_R	stb	%r28, [%r20 + %r0]
	.word 0xf2248000  ! 166: STW_R	stw	%r25, [%r18 + %r0]
	.word 0xf62c4000  ! 167: STB_R	stb	%r27, [%r17 + %r0]
	.word 0x899420dd  ! 168: WRPR_TICK_I	wrpr	%r16, 0x00dd, %tick
	.word 0x859420ef  ! 170: WRPR_TSTATE_I	wrpr	%r16, 0x00ef, %tstate
	.word 0xf42ce0bf  ! 171: STB_I	stb	%r26, [%r19 + 0x00bf]
	.word 0xf8346186  ! 173: STH_I	sth	%r28, [%r17 + 0x0186]
	.word 0xf234a058  ! 175: STH_I	sth	%r25, [%r18 + 0x0058]
	.word 0xba15e0d1  ! 176: OR_I	or 	%r23, 0x00d1, %r29
	.word 0xf035209c  ! 177: STH_I	sth	%r24, [%r20 + 0x009c]
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0x85942189  ! 181: WRPR_TSTATE_I	wrpr	%r16, 0x0189, %tstate
	setx	data_start_3, %g1, %r18
	.word 0xf83c210e  ! 183: STD_I	std	%r28, [%r16 + 0x010e]
	setx	data_start_5, %g1, %r18
	setx	data_start_4, %g1, %r16
hwintr_3_8:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_8), 16, 16)) -> intp(3, 0, 35)
	.word 0xb7480000  ! 189: RDHPR_HPSTATE	rdhpr	%hpstate, %r27
	.word 0xf53d4000  ! 191: STDF_R	std	%f26, [%r0, %r21]
	.word 0xf33ca02d  ! 196: STDF_I	std	%f25, [0x002d, %r18]
	.word 0xff3d0000  ! 199: STDF_R	std	%f31, [%r0, %r20]
	.word 0xfe340000  ! 206: STH_R	sth	%r31, [%r16 + %r0]
hwintr_3_9:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_9), 16, 16)) -> intp(3, 0, 29)
	mov	0, %r12
	.word 0x8f930000  ! 210: WRPR_TL_R	wrpr	%r12, %r0, %tl
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	setx	0xb2879ef50000e85c, %g1, %r10
	.word 0x819a8000  ! 220: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xfe3c60ed  ! 222: STD_I	std	%r31, [%r17 + 0x00ed]
	.word 0x9194e03f  ! 223: WRPR_PIL_I	wrpr	%r19, 0x003f, %pil
	.word 0x8795602f  ! 230: WRPR_TT_I	wrpr	%r21, 0x002f, %tt
hwintr_3_10:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_10), 16, 16)) -> intp(3, 0, 6)
	.word 0xb6bcc000  ! 236: XNORcc_R	xnorcc 	%r19, %r0, %r27
	.word 0xf23de049  ! 237: STD_I	std	%r25, [%r23 + 0x0049]
	setx	0xdf38da3f00008ed6, %g1, %r10
	.word 0x839a8000  ! 239: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xf63c0000  ! 240: STD_R	std	%r27, [%r16 + %r0]
hwintr_3_11:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_11), 16, 16)) -> intp(3, 0, 23)
	.word 0xf2746137  ! 249: STX_I	stx	%r25, [%r17 + 0x0137]
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	mov	1, %r12
	.word 0xa1930000  ! 255: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0x87946092  ! 256: WRPR_TT_I	wrpr	%r17, 0x0092, %tt
	setx	data_start_0, %g1, %r19
	.word 0x8994e1a7  ! 262: WRPR_TICK_I	wrpr	%r19, 0x01a7, %tick
	.word 0x8795a0ac  ! 263: WRPR_TT_I	wrpr	%r22, 0x00ac, %tt
	.word 0xb6258000  ! 264: SUB_R	sub 	%r22, %r0, %r27
hwintr_3_12:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_12), 16, 16)) -> intp(3, 0, 2b)
	.word 0xb3504000  ! 268: RDPR_TNPC	rdpr	%tnpc, %r25
	.word 0xf33c0000  ! 273: STDF_R	std	%f25, [%r0, %r16]
	.word 0xba1ca01a  ! 275: XOR_I	xor 	%r18, 0x001a, %r29
	.word 0xf0348000  ! 276: STH_R	sth	%r24, [%r18 + %r0]
	.word 0xfc2ca0b3  ! 277: STB_I	stb	%r30, [%r18 + 0x00b3]
	setx	data_start_3, %g1, %r21
	.word 0x85952093  ! 281: WRPR_TSTATE_I	wrpr	%r20, 0x0093, %tstate
	.word 0xb6c40000  ! 288: ADDCcc_R	addccc 	%r16, %r0, %r27
	.word 0xfa2520f6  ! 289: STW_I	stw	%r29, [%r20 + 0x00f6]
	.word 0xfa2c8000  ! 290: STB_R	stb	%r29, [%r18 + %r0]
	.word 0xf02ca022  ! 297: STB_I	stb	%r24, [%r18 + 0x0022]
	.word 0x85952009  ! 300: WRPR_TSTATE_I	wrpr	%r20, 0x0009, %tstate
	.word 0xf82c604c  ! 302: STB_I	stb	%r28, [%r17 + 0x004c]
	.word 0xf03de1b7  ! 306: STD_I	std	%r24, [%r23 + 0x01b7]
	.word 0xbd520000  ! 308: RDPR_PIL	rdpr	%pil, %r30
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb1480000  ! 311: RDHPR_HPSTATE	rdhpr	%hpstate, %r24
	.word 0xbc3cc000  ! 315: XNOR_R	xnor 	%r19, %r0, %r30
	.word 0xf8244000  ! 318: STW_R	stw	%r28, [%r17 + %r0]
	.word 0xf23c61e4  ! 319: STD_I	std	%r25, [%r17 + 0x01e4]
	.word 0xf93ca103  ! 322: STDF_I	std	%f28, [0x0103, %r18]
	.word 0xfe25a1c2  ! 323: STW_I	stw	%r31, [%r22 + 0x01c2]
	.word 0x859521ea  ! 325: WRPR_TSTATE_I	wrpr	%r20, 0x01ea, %tstate
	.word 0xb92cb001  ! 327: SLLX_I	sllx	%r18, 0x0001, %r28
	.word 0xbd480000  ! 328: RDHPR_HPSTATE	rdhpr	%hpstate, %r30
	.word 0xba244000  ! 329: SUB_R	sub 	%r17, %r0, %r29
	.word 0xf834c000  ! 330: STH_R	sth	%r28, [%r19 + %r0]
	.word 0xf62c4000  ! 333: STB_R	stb	%r27, [%r17 + %r0]
	.word 0xf53c2111  ! 334: STDF_I	std	%f26, [0x0111, %r16]
	.word 0xfe748000  ! 335: STX_R	stx	%r31, [%r18 + %r0]
	.word 0xf8752154  ! 342: STX_I	stx	%r28, [%r20 + 0x0154]
	.word 0xf43cc000  ! 343: STD_R	std	%r26, [%r19 + %r0]
	.word 0xfb3d4000  ! 350: STDF_R	std	%f29, [%r0, %r21]
	.word 0xb1504000  ! 352: RDPR_TNPC	<illegal instruction>
	.word 0xf13d0000  ! 358: STDF_R	std	%f24, [%r0, %r20]
	.word 0xbd480000  ! 359: RDHPR_HPSTATE	rdhpr	%hpstate, %r30
	.word 0xb29c2000  ! 363: XORcc_I	xorcc 	%r16, 0x0000, %r25
	.word 0xb62dc000  ! 364: ANDN_R	andn 	%r23, %r0, %r27
	.word 0xfe34c000  ! 366: STH_R	sth	%r31, [%r19 + %r0]
	.word 0xf82ce04d  ! 369: STB_I	stb	%r28, [%r19 + 0x004d]
	.word 0xb151c000  ! 370: RDPR_TL	<illegal instruction>
	setx	0xd31d4d6900004e85, %g1, %r10
	.word 0x819a8000  ! 373: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xbd358000  ! 377: SRL_R	srl 	%r22, %r0, %r30
	setx	0xcd63059300005959, %g1, %r10
	.word 0x839a8000  ! 381: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xfc2d0000  ! 384: STB_R	stb	%r30, [%r20 + %r0]
	.word 0x8995a140  ! 385: WRPR_TICK_I	wrpr	%r22, 0x0140, %tick
hwintr_3_13:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_13), 16, 16)) -> intp(3, 0, 34)
	mov	2, %r12
	.word 0xa1930000  ! 388: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xfa754000  ! 389: STX_R	stx	%r29, [%r21 + %r0]
	.word 0xb950c000  ! 392: RDPR_TT	rdpr	%tt, %r28
	.word 0xf33de080  ! 393: STDF_I	std	%f25, [0x0080, %r23]
	.word 0xb12d6001  ! 394: SLL_I	sll 	%r21, 0x0001, %r24
	.word 0xfe74c000  ! 396: STX_R	stx	%r31, [%r19 + %r0]
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0x8995a0b6  ! 401: WRPR_TICK_I	wrpr	%r22, 0x00b6, %tick
	.word 0xf22da075  ! 405: STB_I	stb	%r25, [%r22 + 0x0075]
hwintr_3_14:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_14), 16, 16)) -> intp(3, 0, a)
hwintr_3_15:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_15), 16, 16)) -> intp(3, 0, 32)
	.word 0xb23dc000  ! 409: XNOR_R	xnor 	%r23, %r0, %r25
	setx	0x9e42e065000039d9, %g1, %r10
	.word 0x839a8000  ! 410: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb00da110  ! 411: AND_I	and 	%r22, 0x0110, %r24
hwintr_3_16:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_16), 16, 16)) -> intp(3, 0, 6)
	.word 0xf22cc000  ! 415: STB_R	stb	%r25, [%r19 + %r0]
	.word 0xf73c8000  ! 416: STDF_R	std	%f27, [%r0, %r18]
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
hwintr_3_17:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_17), 16, 16)) -> intp(3, 0, 28)
	.word 0xb49560c9  ! 422: ORcc_I	orcc 	%r21, 0x00c9, %r26
	.word 0xb0356125  ! 426: SUBC_I	orn 	%r21, 0x0125, %r24
	.word 0xb3504000  ! 435: RDPR_TNPC	rdpr	%tnpc, %r25
	.word 0xf074c000  ! 436: STX_R	stx	%r24, [%r19 + %r0]
	.word 0xfc25c000  ! 438: STW_R	stw	%r30, [%r23 + %r0]
	.word 0xb7504000  ! 442: RDPR_TNPC	<illegal instruction>
	.word 0xb2b58000  ! 445: SUBCcc_R	orncc 	%r22, %r0, %r25
	.word 0xbcb50000  ! 446: SUBCcc_R	orncc 	%r20, %r0, %r30
	.word 0xff3cc000  ! 449: STDF_R	std	%f31, [%r0, %r19]
	.word 0x8d95a026  ! 453: WRPR_PSTATE_I	wrpr	%r22, 0x0026, %pstate
	.word 0xf33c8000  ! 455: STDF_R	std	%f25, [%r0, %r18]
	.word 0xf93d8000  ! 459: STDF_R	std	%f28, [%r0, %r22]
	.word 0xb7508000  ! 460: RDPR_TSTATE	rdpr	%tstate, %r27
	.word 0xb9508000  ! 462: RDPR_TSTATE	<illegal instruction>
	.word 0xf23d0000  ! 466: STD_R	std	%r25, [%r20 + %r0]
	.word 0xb40c206e  ! 469: AND_I	and 	%r16, 0x006e, %r26
	.word 0xf02c4000  ! 470: STB_R	stb	%r24, [%r17 + %r0]
	.word 0xb7504000  ! 471: RDPR_TNPC	<illegal instruction>
	.word 0xf625a002  ! 473: STW_I	stw	%r27, [%r22 + 0x0002]
	.word 0xfe254000  ! 474: STW_R	stw	%r31, [%r21 + %r0]
	.word 0xfd3c214d  ! 475: STDF_I	std	%f30, [0x014d, %r16]
	.word 0xfe748000  ! 479: STX_R	stx	%r31, [%r18 + %r0]
	.word 0xf22de1eb  ! 480: STB_I	stb	%r25, [%r23 + 0x01eb]
hwintr_3_18:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_18), 16, 16)) -> intp(3, 0, 3f)
	.word 0x89942011  ! 486: WRPR_TICK_I	wrpr	%r16, 0x0011, %tick
hwintr_3_19:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_19), 16, 16)) -> intp(3, 0, 1b)
	.word 0xbb510000  ! 491: RDPR_TICK	rdpr	%tick, %r29
	.word 0xbf50c000  ! 492: RDPR_TT	<illegal instruction>
	.word 0xbf500000  ! 493: RDPR_TPC	<illegal instruction>
	.word 0xf53ce0d2  ! 495: STDF_I	std	%f26, [0x00d2, %r19]
	.word 0xfc748000  ! 497: STX_R	stx	%r30, [%r18 + %r0]
	.word 0xfc250000  ! 499: STW_R	stw	%r30, [%r20 + %r0]
	.word 0xf475e132  ! 500: STX_I	stx	%r26, [%r23 + 0x0132]
	.word 0xf425a15e  ! 501: STW_I	stw	%r26, [%r22 + 0x015e]
	.word 0xf33c2069  ! 502: STDF_I	std	%f25, [0x0069, %r16]
	.word 0xbeb5a03e  ! 506: ORNcc_I	orncc 	%r22, 0x003e, %r31
	.word 0xf035c000  ! 507: STH_R	sth	%r24, [%r23 + %r0]
	.word 0x919561fd  ! 511: WRPR_PIL_I	wrpr	%r21, 0x01fd, %pil
	.word 0xfc348000  ! 512: STH_R	sth	%r30, [%r18 + %r0]
	.word 0xfa2d618b  ! 513: STB_I	stb	%r29, [%r21 + 0x018b]
	.word 0xfa3420be  ! 514: STH_I	sth	%r29, [%r16 + 0x00be]
	.word 0xfe7461cb  ! 519: STX_I	stx	%r31, [%r17 + 0x01cb]
	.word 0xf875a0e7  ! 520: STX_I	stx	%r28, [%r22 + 0x00e7]
	.word 0xb751c000  ! 523: RDPR_TL	rdpr	%tl, %r27
	.word 0x819420e8  ! 526: WRPR_TPC_I	wrpr	%r16, 0x00e8, %tpc
	.word 0xf6248000  ! 527: STW_R	stw	%r27, [%r18 + %r0]
	.word 0xfe750000  ! 528: STX_R	stx	%r31, [%r20 + %r0]
	.word 0xb2c5a089  ! 534: ADDCcc_I	addccc 	%r22, 0x0089, %r25
hwintr_3_20:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_20), 16, 16)) -> intp(3, 0, 3c)
	.word 0xf02c618a  ! 538: STB_I	stb	%r24, [%r17 + 0x018a]
	setx	0xf988685700007d81, %g1, %r10
	.word 0x839a8000  ! 540: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xbf51c000  ! 545: RDPR_TL	rdpr	%tl, %r31
	.word 0xfc2420d6  ! 546: STW_I	stw	%r30, [%r16 + 0x00d6]
	.word 0xb2950000  ! 549: ORcc_R	orcc 	%r20, %r0, %r25
	.word 0xbb51c000  ! 550: RDPR_TL	<illegal instruction>
	.word 0xfa74e138  ! 554: STX_I	stx	%r29, [%r19 + 0x0138]
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb5540000  ! 560: RDPR_GL	<illegal instruction>
	.word 0x839460d1  ! 561: WRPR_TNPC_I	wrpr	%r17, 0x00d1, %tnpc
	.word 0x8d94e02e  ! 565: WRPR_PSTATE_I	wrpr	%r19, 0x002e, %pstate
	.word 0x8595a1e8  ! 566: WRPR_TSTATE_I	wrpr	%r22, 0x01e8, %tstate
	.word 0xf73c8000  ! 570: STDF_R	std	%f27, [%r0, %r18]
	mov	0, %r12
	.word 0xa1930000  ! 573: WRPR_GL_R	wrpr	%r12, %r0, %-
hwintr_3_21:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_21), 16, 16)) -> intp(3, 0, 21)
	.word 0xfc2cc000  ! 576: STB_R	stb	%r30, [%r19 + %r0]
hwintr_3_22:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_22), 16, 16)) -> intp(3, 0, 35)
	.word 0x91952193  ! 580: WRPR_PIL_I	wrpr	%r20, 0x0193, %pil
	.word 0x8795a0cb  ! 581: WRPR_TT_I	wrpr	%r22, 0x00cb, %tt
	.word 0x8595e1cb  ! 585: WRPR_TSTATE_I	wrpr	%r23, 0x01cb, %tstate
	setx	data_start_1, %g1, %r20
	.word 0xf635e079  ! 597: STH_I	sth	%r27, [%r23 + 0x0079]
	.word 0xff3ce023  ! 598: STDF_I	std	%f31, [0x0023, %r19]
	.word 0xf425c000  ! 599: STW_R	stw	%r26, [%r23 + %r0]
	.word 0x87956191  ! 604: WRPR_TT_I	wrpr	%r21, 0x0191, %tt
	.word 0xbf518000  ! 605: RDPR_PSTATE	rdpr	%pstate, %r31
	.word 0x8d952104  ! 607: WRPR_PSTATE_I	wrpr	%r20, 0x0104, %pstate
	mov	0, %r12
	.word 0xa1930000  ! 609: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xf03421b5  ! 611: STH_I	sth	%r24, [%r16 + 0x01b5]
	.word 0xf83d0000  ! 616: STD_R	std	%r28, [%r20 + %r0]
	.word 0xf2340000  ! 617: STH_R	sth	%r25, [%r16 + %r0]
hwintr_3_23:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_23), 16, 16)) -> intp(3, 0, 37)
	mov	1, %r12
	.word 0xa1930000  ! 619: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xfe2cc000  ! 621: STB_R	stb	%r31, [%r19 + %r0]
	.word 0xfa2cc000  ! 622: STB_R	stb	%r29, [%r19 + %r0]
	.word 0xb3510000  ! 623: RDPR_TICK	rdpr	%tick, %r25
	.word 0xf83d4000  ! 624: STD_R	std	%r28, [%r21 + %r0]
	.word 0xf8740000  ! 628: STX_R	stx	%r28, [%r16 + %r0]
	.word 0xf03de025  ! 633: STD_I	std	%r24, [%r23 + 0x0025]
	.word 0xf225202e  ! 634: STW_I	stw	%r25, [%r20 + 0x002e]
	.word 0xb551c000  ! 636: RDPR_TL	<illegal instruction>
hwintr_3_24:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_24), 16, 16)) -> intp(3, 0, 1c)
	setx	0x161329120000ec9d, %g1, %r10
	.word 0x839a8000  ! 638: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb4b421d4  ! 643: ORNcc_I	orncc 	%r16, 0x01d4, %r26
	.word 0xf83c0000  ! 644: STD_R	std	%r28, [%r16 + %r0]
	.word 0x899560e4  ! 645: WRPR_TICK_I	wrpr	%r21, 0x00e4, %tick
	.word 0xfc2ca1f1  ! 649: STB_I	stb	%r30, [%r18 + 0x01f1]
	.word 0x9194e0b7  ! 650: WRPR_PIL_I	wrpr	%r19, 0x00b7, %pil
	.word 0xf475e02e  ! 651: STX_I	stx	%r26, [%r23 + 0x002e]
	.word 0x9195e071  ! 652: WRPR_PIL_I	wrpr	%r23, 0x0071, %pil
	.word 0xf63ca128  ! 653: STD_I	std	%r27, [%r18 + 0x0128]
	.word 0xf82c4000  ! 654: STB_R	stb	%r28, [%r17 + %r0]
	.word 0xfa74c000  ! 655: STX_R	stx	%r29, [%r19 + %r0]
	.word 0xf035c000  ! 662: STH_R	sth	%r24, [%r23 + %r0]
hwintr_3_25:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_25), 16, 16)) -> intp(3, 0, 1c)
hwintr_3_26:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_26), 16, 16)) -> intp(3, 0, 39)
	.word 0xf93de091  ! 668: STDF_I	std	%f28, [0x0091, %r23]
	.word 0xf4250000  ! 669: STW_R	stw	%r26, [%r20 + %r0]
hwintr_3_27:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_27), 16, 16)) -> intp(3, 0, 2f)
	.word 0xfe356117  ! 672: STH_I	sth	%r31, [%r21 + 0x0117]
hwintr_3_28:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_28), 16, 16)) -> intp(3, 0, 27)
	.word 0x91952125  ! 674: WRPR_PIL_I	wrpr	%r20, 0x0125, %pil
	.word 0xf33ca0e6  ! 675: STDF_I	std	%f25, [0x00e6, %r18]
	.word 0xf2354000  ! 681: STH_R	sth	%r25, [%r21 + %r0]
hwintr_3_29:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_29), 16, 16)) -> intp(3, 0, 23)
	.word 0xfa24e07c  ! 685: STW_I	stw	%r29, [%r19 + 0x007c]
	.word 0xfb3d61ed  ! 686: STDF_I	std	%f29, [0x01ed, %r21]
	.word 0x91956194  ! 690: WRPR_PIL_I	wrpr	%r21, 0x0194, %pil
	.word 0xf4240000  ! 693: STW_R	stw	%r26, [%r16 + %r0]
	.word 0xb550c000  ! 694: RDPR_TT	rdpr	%tt, %r26
hwintr_3_30:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_30), 16, 16)) -> intp(3, 0, 2b)
	.word 0xb350c000  ! 699: RDPR_TT	<illegal instruction>
	.word 0xfa2460aa  ! 702: STW_I	stw	%r29, [%r17 + 0x00aa]
	mov	1, %r12
	.word 0xa1930000  ! 704: WRPR_GL_R	wrpr	%r12, %r0, %-
hwintr_3_31:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_31), 16, 16)) -> intp(3, 0, 23)
	.word 0xb3518000  ! 711: RDPR_PSTATE	rdpr	%pstate, %r25
	.word 0xf274c000  ! 712: STX_R	stx	%r25, [%r19 + %r0]
	.word 0x8594e18e  ! 714: WRPR_TSTATE_I	wrpr	%r19, 0x018e, %tstate
	.word 0xbabce0b8  ! 715: XNORcc_I	xnorcc 	%r19, 0x00b8, %r29
	.word 0xfc24a040  ! 716: STW_I	stw	%r30, [%r18 + 0x0040]
	setx	0x7d74afa40000fd50, %g1, %r10
	.word 0x839a8000  ! 717: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xf73cc000  ! 722: STDF_R	std	%f27, [%r0, %r19]
	mov	1, %r12
	.word 0xa1930000  ! 723: WRPR_GL_R	wrpr	%r12, %r0, %-
hwintr_3_32:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_32), 16, 16)) -> intp(3, 0, 21)
	.word 0xf73c61c7  ! 728: STDF_I	std	%f27, [0x01c7, %r17]
	.word 0xbcb48000  ! 731: SUBCcc_R	orncc 	%r18, %r0, %r30
	.word 0xf83d4000  ! 733: STD_R	std	%r28, [%r21 + %r0]
	.word 0xfa7421f0  ! 734: STX_I	stx	%r29, [%r16 + 0x01f0]
	.word 0xfe2d0000  ! 737: STB_R	stb	%r31, [%r20 + %r0]
	.word 0xfa750000  ! 740: STX_R	stx	%r29, [%r20 + %r0]
hwintr_3_33:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_33), 16, 16)) -> intp(3, 0, 13)
	.word 0xb7500000  ! 750: RDPR_TPC	rdpr	%tpc, %r27
hwintr_3_34:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_34), 16, 16)) -> intp(3, 0, 4)
hwintr_3_35:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_35), 16, 16)) -> intp(3, 0, 1f)
	.word 0xbe35e19c  ! 762: SUBC_I	orn 	%r23, 0x019c, %r31
	.word 0xf025e1b2  ! 764: STW_I	stw	%r24, [%r23 + 0x01b2]
	.word 0xfc250000  ! 766: STW_R	stw	%r30, [%r20 + %r0]
	.word 0xb23d4000  ! 770: XNOR_R	xnor 	%r21, %r0, %r25
	.word 0xbd480000  ! 773: RDHPR_HPSTATE	rdhpr	%hpstate, %r30
hwintr_3_36:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_36), 16, 16)) -> intp(3, 0, c)
	.word 0xf82d6087  ! 775: STB_I	stb	%r28, [%r21 + 0x0087]
	.word 0xb7504000  ! 776: RDPR_TNPC	<illegal instruction>
	setx	data_start_2, %g1, %r17
hwintr_3_37:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_37), 16, 16)) -> intp(3, 0, 3c)
	.word 0xfc344000  ! 781: STH_R	sth	%r30, [%r17 + %r0]
	.word 0xf6258000  ! 782: STW_R	stw	%r27, [%r22 + %r0]
	.word 0xb33d8000  ! 788: SRA_R	sra 	%r22, %r0, %r25
	setx	data_start_5, %g1, %r21
	.word 0xf0750000  ! 790: STX_R	stx	%r24, [%r20 + %r0]
	.word 0xfa3460a9  ! 792: STH_I	sth	%r29, [%r17 + 0x00a9]
	.word 0x9195205f  ! 795: WRPR_PIL_I	wrpr	%r20, 0x005f, %pil
	.word 0x91942069  ! 797: WRPR_PIL_I	wrpr	%r16, 0x0069, %pil
	.word 0xf22d215f  ! 798: STB_I	stb	%r25, [%r20 + 0x015f]
	setx	data_start_2, %g1, %r17
	.word 0xb60ca0a9  ! 800: AND_I	and 	%r18, 0x00a9, %r27
	.word 0xf0254000  ! 801: STW_R	stw	%r24, [%r21 + %r0]
	.word 0xf43cc000  ! 804: STD_R	std	%r26, [%r19 + %r0]
	.word 0xfb3d4000  ! 807: STDF_R	std	%f29, [%r0, %r21]
	setx	data_start_0, %g1, %r22
	.word 0xbb500000  ! 812: RDPR_TPC	rdpr	%tpc, %r29
	.word 0xbd3d9000  ! 816: SRAX_R	srax	%r22, %r0, %r30
	.word 0xf02c6168  ! 817: STB_I	stb	%r24, [%r17 + 0x0168]
	.word 0xf6240000  ! 821: STW_R	stw	%r27, [%r16 + %r0]
	.word 0xf0348000  ! 825: STH_R	sth	%r24, [%r18 + %r0]
	.word 0xfa3d4000  ! 826: STD_R	std	%r29, [%r21 + %r0]
	.word 0xf4342122  ! 830: STH_I	sth	%r26, [%r16 + 0x0122]
hwintr_3_38:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_38), 16, 16)) -> intp(3, 0, 11)
	.word 0xbac5e173  ! 835: ADDCcc_I	addccc 	%r23, 0x0173, %r29
	.word 0xf624c000  ! 836: STW_R	stw	%r27, [%r19 + %r0]
hwintr_3_39:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_39), 16, 16)) -> intp(3, 0, 13)
	setx	data_start_0, %g1, %r23
	.word 0xbb500000  ! 846: RDPR_TPC	<illegal instruction>
	.word 0x89956094  ! 851: WRPR_TICK_I	wrpr	%r21, 0x0094, %tick
hwintr_3_40:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_40), 16, 16)) -> intp(3, 0, 17)
	.word 0x899560d5  ! 853: WRPR_TICK_I	wrpr	%r21, 0x00d5, %tick
	mov	1, %r12
	.word 0xa1930000  ! 854: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0x8395e131  ! 855: WRPR_TNPC_I	wrpr	%r23, 0x0131, %tnpc
	.word 0xfc2d20b7  ! 858: STB_I	stb	%r30, [%r20 + 0x00b7]
	.word 0xf8250000  ! 859: STW_R	stw	%r28, [%r20 + %r0]
	.word 0x8d94e00f  ! 863: WRPR_PSTATE_I	wrpr	%r19, 0x000f, %pstate
	.word 0xff3da15b  ! 865: STDF_I	std	%f31, [0x015b, %r22]
	.word 0xbb520000  ! 866: RDPR_PIL	rdpr	%pil, %r29
	.word 0xf275a1f3  ! 867: STX_I	stx	%r25, [%r22 + 0x01f3]
	.word 0xb951c000  ! 868: RDPR_TL	<illegal instruction>
	.word 0xf82ce122  ! 870: STB_I	stb	%r28, [%r19 + 0x0122]
	.word 0xf834206d  ! 872: STH_I	sth	%r28, [%r16 + 0x006d]
	setx	0x2216ffb00000ff00, %g1, %r10
	.word 0x839a8000  ! 875: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb150c000  ! 877: RDPR_TT	rdpr	%tt, %r24
	.word 0xfa240000  ! 879: STW_R	stw	%r29, [%r16 + %r0]
	.word 0xf13dc000  ! 884: STDF_R	std	%f24, [%r0, %r23]
	.word 0x9194e0b3  ! 886: WRPR_PIL_I	wrpr	%r19, 0x00b3, %pil
	.word 0xf42c4000  ! 890: STB_R	stb	%r26, [%r17 + %r0]
	.word 0xf73c2174  ! 892: STDF_I	std	%f27, [0x0174, %r16]
	.word 0xf2254000  ! 893: STW_R	stw	%r25, [%r21 + %r0]
	setx	data_start_6, %g1, %r20
	.word 0xb9540000  ! 910: RDPR_GL	rdpr	%-, %r28
	.word 0xf62ce0d5  ! 912: STB_I	stb	%r27, [%r19 + 0x00d5]
hwintr_3_41:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_41), 16, 16)) -> intp(3, 0, 35)
	.word 0xb9508000  ! 920: RDPR_TSTATE	rdpr	%tstate, %r28
	.word 0xf82c61f2  ! 923: STB_I	stb	%r28, [%r17 + 0x01f2]
	mov	1, %r12
	.word 0x8f930000  ! 926: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0x9195e1f3  ! 927: WRPR_PIL_I	wrpr	%r23, 0x01f3, %pil
	.word 0xf025c000  ! 928: STW_R	stw	%r24, [%r23 + %r0]
hwintr_3_42:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_42), 16, 16)) -> intp(3, 0, 15)
	.word 0xbd51c000  ! 932: RDPR_TL	rdpr	%tl, %r30
	.word 0xb1520000  ! 934: RDPR_PIL	<illegal instruction>
	setx	data_start_5, %g1, %r16
	.word 0xf33c2120  ! 940: STDF_I	std	%f25, [0x0120, %r16]
	.word 0xf62c606e  ! 944: STB_I	stb	%r27, [%r17 + 0x006e]
	.word 0xfa3d4000  ! 949: STD_R	std	%r29, [%r21 + %r0]
	.word 0xfc2d0000  ! 952: STB_R	stb	%r30, [%r20 + %r0]
hwintr_3_43:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_43), 16, 16)) -> intp(3, 0, 3b)
	.word 0xf03d8000  ! 954: STD_R	std	%r24, [%r22 + %r0]
	.word 0xf2358000  ! 959: STH_R	sth	%r25, [%r22 + %r0]
hwintr_3_44:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_44), 16, 16)) -> intp(3, 0, 7)
	.word 0xf8358000  ! 968: STH_R	sth	%r28, [%r22 + %r0]
	.word 0xf53d0000  ! 970: STDF_R	std	%f26, [%r0, %r20]
	.word 0xb00cc000  ! 973: AND_R	and 	%r19, %r0, %r24
	.word 0xf635c000  ! 975: STH_R	sth	%r27, [%r23 + %r0]
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xf53da05f  ! 981: STDF_I	std	%f26, [0x005f, %r22]
	.word 0xb77ca401  ! 983: MOVR_I	movre	%r18, 0x1, %r27
	.word 0xf22de100  ! 984: STB_I	stb	%r25, [%r23 + 0x0100]
	.word 0xf02ca01b  ! 986: STB_I	stb	%r24, [%r18 + 0x001b]
	.word 0xfe3c8000  ! 987: STD_R	std	%r31, [%r18 + %r0]
	.word 0xf0742199  ! 993: STX_I	stx	%r24, [%r16 + 0x0199]
	mov	2, %r12
	.word 0xa1930000  ! 994: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0x8795a144  ! 996: WRPR_TT_I	wrpr	%r22, 0x0144, %tt
	.word 0xfe3d2019  ! 997: STD_I	std	%r31, [%r20 + 0x0019]
	.word 0xf83c603e  ! 998: STD_I	std	%r28, [%r17 + 0x003e]
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
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_0), 16, 16)) -> intp(2, 0, 33)
	.word 0x8995a035  ! 3: WRPR_TICK_I	wrpr	%r22, 0x0035, %tick
	mov	1, %r12
	.word 0x8f930000  ! 6: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xb7510000  ! 7: RDPR_TICK	<illegal instruction>
	.word 0x89946025  ! 8: WRPR_TICK_I	wrpr	%r17, 0x0025, %tick
	mov	1, %r12
	.word 0xa1930000  ! 15: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0x8195e02c  ! 16: WRPR_TPC_I	wrpr	%r23, 0x002c, %tpc
	.word 0xf00c4000  ! 19: LDUB_R	ldub	[%r17 + %r0], %r24
	.word 0xbc8421b7  ! 22: ADDcc_I	addcc 	%r16, 0x01b7, %r30
	.word 0xf80561f8  ! 25: LDUW_I	lduw	[%r21 + 0x01f8], %r28
	mov	2, %r12
	.word 0x8f930000  ! 27: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xbc958000  ! 28: ORcc_R	orcc 	%r22, %r0, %r30
hwintr_2_1:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_1), 16, 16)) -> intp(2, 0, 4)
	.word 0xf91de164  ! 30: LDDF_I	ldd	[%r23, 0x0164], %f28
	.word 0xfa442071  ! 31: LDSW_I	ldsw	[%r16 + 0x0071], %r29
	.word 0xb6b40000  ! 32: SUBCcc_R	orncc 	%r16, %r0, %r27
	.word 0xb28560db  ! 33: ADDcc_I	addcc 	%r21, 0x00db, %r25
hwintr_2_2:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_2), 16, 16)) -> intp(2, 0, 3c)
	.word 0xf054a1fd  ! 37: LDSH_I	ldsh	[%r18 + 0x01fd], %r24
	.word 0x9195a036  ! 40: WRPR_PIL_I	wrpr	%r22, 0x0036, %pil
	.word 0xfa154000  ! 44: LDUH_R	lduh	[%r21 + %r0], %r29
	.word 0xf045c000  ! 46: LDSW_R	ldsw	[%r23 + %r0], %r24
	.word 0xbd520000  ! 47: RDPR_PIL	<illegal instruction>
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb9504000  ! 53: RDPR_TNPC	<illegal instruction>
	.word 0xf2050000  ! 54: LDUW_R	lduw	[%r20 + %r0], %r25
	.word 0xfc044000  ! 56: LDUW_R	lduw	[%r17 + %r0], %r30
	.word 0xf60c4000  ! 57: LDUB_R	ldub	[%r17 + %r0], %r27
	.word 0xf205a1d4  ! 61: LDUW_I	lduw	[%r22 + 0x01d4], %r25
	.word 0xf255e06b  ! 64: LDSH_I	ldsh	[%r23 + 0x006b], %r25
	.word 0xb9510000  ! 65: RDPR_TICK	<illegal instruction>
hwintr_2_3:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_3), 16, 16)) -> intp(2, 0, 3d)
	.word 0xfb1d203c  ! 70: LDDF_I	ldd	[%r20, 0x003c], %f29
	.word 0xfa1c6090  ! 71: LDD_I	ldd	[%r17 + 0x0090], %r29
	.word 0xf2148000  ! 72: LDUH_R	lduh	[%r18 + %r0], %r25
	.word 0xf04c60f6  ! 73: LDSB_I	ldsb	[%r17 + 0x00f6], %r24
	.word 0xbc340000  ! 74: SUBC_R	orn 	%r16, %r0, %r30
	.word 0xf4048000  ! 76: LDUW_R	lduw	[%r18 + %r0], %r26
	.word 0xf0558000  ! 78: LDSH_R	ldsh	[%r22 + %r0], %r24
	.word 0xf91ce191  ! 79: LDDF_I	ldd	[%r19, 0x0191], %f28
	mov	1, %r12
	.word 0xa1930000  ! 81: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xf64c4000  ! 82: LDSB_R	ldsb	[%r17 + %r0], %r27
	.word 0xfc5de1ec  ! 83: LDX_I	ldx	[%r23 + 0x01ec], %r30
	.word 0xf2054000  ! 85: LDUW_R	lduw	[%r21 + %r0], %r25
	.word 0xb63ca133  ! 86: XNOR_I	xnor 	%r18, 0x0133, %r27
	.word 0xb3480000  ! 89: RDHPR_HPSTATE	rdhpr	%hpstate, %r25
	.word 0x89946095  ! 91: WRPR_TICK_I	wrpr	%r17, 0x0095, %tick
	.word 0x819420f2  ! 93: WRPR_TPC_I	wrpr	%r16, 0x00f2, %tpc
	.word 0xb9520000  ! 94: RDPR_PIL	<illegal instruction>
	.word 0xf61d601d  ! 95: LDD_I	ldd	[%r21 + 0x001d], %r27
	.word 0x8d9520f0  ! 97: WRPR_PSTATE_I	wrpr	%r20, 0x00f0, %pstate
	.word 0xf815219f  ! 99: LDUH_I	lduh	[%r20 + 0x019f], %r28
	.word 0xf04ce1e6  ! 107: LDSB_I	ldsb	[%r19 + 0x01e6], %r24
	.word 0xf21c4000  ! 108: LDD_R	ldd	[%r17 + %r0], %r25
	.word 0xb1510000  ! 111: RDPR_TICK	<illegal instruction>
	.word 0xb29c21f6  ! 114: XORcc_I	xorcc 	%r16, 0x01f6, %r25
	.word 0x9195a06b  ! 120: WRPR_PIL_I	wrpr	%r22, 0x006b, %pil
	.word 0xb4a44000  ! 125: SUBcc_R	subcc 	%r17, %r0, %r26
	.word 0xb4a4c000  ! 126: SUBcc_R	subcc 	%r19, %r0, %r26
	mov	2, %r12
	.word 0xa1930000  ! 128: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xf00ca120  ! 130: LDUB_I	ldub	[%r18 + 0x0120], %r24
	.word 0xf51dc000  ! 132: LDDF_R	ldd	[%r23, %r0], %f26
	.word 0xb1518000  ! 136: RDPR_PSTATE	<illegal instruction>
	.word 0xf11dc000  ! 140: LDDF_R	ldd	[%r23, %r0], %f24
	.word 0xfe4c8000  ! 142: LDSB_R	ldsb	[%r18 + %r0], %r31
hwintr_2_4:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_4), 16, 16)) -> intp(2, 0, 1b)
	.word 0xb0b420c0  ! 144: ORNcc_I	orncc 	%r16, 0x00c0, %r24
hwintr_2_5:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_5), 16, 16)) -> intp(2, 0, 3b)
	.word 0xf0040000  ! 154: LDUW_R	lduw	[%r16 + %r0], %r24
	setx	0xda23016900002f49, %g1, %r10
	.word 0x839a8000  ! 155: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xf015c000  ! 157: LDUH_R	lduh	[%r23 + %r0], %r24
	.word 0xbabde025  ! 161: XNORcc_I	xnorcc 	%r23, 0x0025, %r29
hwintr_2_6:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_6), 16, 16)) -> intp(2, 0, 8)
	.word 0xf85ce031  ! 163: LDX_I	ldx	[%r19 + 0x0031], %r28
hwintr_2_7:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_7), 16, 16)) -> intp(2, 0, 39)
	.word 0x899560e0  ! 168: WRPR_TICK_I	wrpr	%r21, 0x00e0, %tick
	.word 0x859521fa  ! 170: WRPR_TSTATE_I	wrpr	%r20, 0x01fa, %tstate
	.word 0xf01cc000  ! 174: LDD_R	ldd	[%r19 + %r0], %r24
	.word 0xbe142133  ! 176: OR_I	or 	%r16, 0x0133, %r31
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0x8595e1b0  ! 181: WRPR_TSTATE_I	wrpr	%r23, 0x01b0, %tstate
	setx	data_start_2, %g1, %r20
	setx	data_start_1, %g1, %r21
	.word 0xf11c8000  ! 185: LDDF_R	ldd	[%r18, %r0], %f24
	setx	data_start_1, %g1, %r21
hwintr_2_8:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_8), 16, 16)) -> intp(2, 0, 34)
	.word 0xb3480000  ! 189: RDHPR_HPSTATE	rdhpr	%hpstate, %r25
	.word 0xf40d4000  ! 190: LDUB_R	ldub	[%r21 + %r0], %r26
	.word 0xf05d8000  ! 192: LDX_R	ldx	[%r22 + %r0], %r24
	.word 0xf25c4000  ! 194: LDX_R	ldx	[%r17 + %r0], %r25
	.word 0xf25d60da  ! 203: LDX_I	ldx	[%r21 + 0x00da], %r25
	.word 0xf2054000  ! 205: LDUW_R	lduw	[%r21 + %r0], %r25
hwintr_2_9:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_9), 16, 16)) -> intp(2, 0, 24)
	mov	1, %r12
	.word 0x8f930000  ! 210: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xf71d0000  ! 211: LDDF_R	ldd	[%r20, %r0], %f27
	.word 0xfa058000  ! 213: LDUW_R	lduw	[%r22 + %r0], %r29
	.word 0xfa150000  ! 214: LDUH_R	lduh	[%r20 + %r0], %r29
	.word 0xf05c0000  ! 215: LDX_R	ldx	[%r16 + %r0], %r24
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	setx	0x221cd5a2000058dc, %g1, %r10
	.word 0x819a8000  ! 220: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0x9195e1e4  ! 223: WRPR_PIL_I	wrpr	%r23, 0x01e4, %pil
	.word 0xf80de165  ! 225: LDUB_I	ldub	[%r23 + 0x0165], %r28
	.word 0x8794e010  ! 230: WRPR_TT_I	wrpr	%r19, 0x0010, %tt
	.word 0xf4158000  ! 231: LDUH_R	lduh	[%r22 + %r0], %r26
	.word 0xf6550000  ! 233: LDSH_R	ldsh	[%r20 + %r0], %r27
hwintr_2_10:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_10), 16, 16)) -> intp(2, 0, 5)
	.word 0xb8bd0000  ! 236: XNORcc_R	xnorcc 	%r20, %r0, %r28
	setx	0xf0fd921f00001f5d, %g1, %r10
	.word 0x839a8000  ! 239: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xfc44616d  ! 243: LDSW_I	ldsw	[%r17 + 0x016d], %r30
	.word 0xf85ce17e  ! 245: LDX_I	ldx	[%r19 + 0x017e], %r28
hwintr_2_11:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_11), 16, 16)) -> intp(2, 0, 2e)
	.word 0xf40da188  ! 250: LDUB_I	ldub	[%r22 + 0x0188], %r26
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf04c0000  ! 254: LDSB_R	ldsb	[%r16 + %r0], %r24
	mov	1, %r12
	.word 0xa1930000  ! 255: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0x879421a1  ! 256: WRPR_TT_I	wrpr	%r16, 0x01a1, %tt
	setx	data_start_6, %g1, %r18
	.word 0x8994e191  ! 262: WRPR_TICK_I	wrpr	%r19, 0x0191, %tick
	.word 0x8794a08b  ! 263: WRPR_TT_I	wrpr	%r18, 0x008b, %tt
	.word 0xba258000  ! 264: SUB_R	sub 	%r22, %r0, %r29
	.word 0xf65d20f0  ! 265: LDX_I	ldx	[%r20 + 0x00f0], %r27
	.word 0xf815c000  ! 266: LDUH_R	lduh	[%r23 + %r0], %r28
hwintr_2_12:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_12), 16, 16)) -> intp(2, 0, 8)
	.word 0xbd504000  ! 268: RDPR_TNPC	<illegal instruction>
	.word 0xfc5ce17e  ! 271: LDX_I	ldx	[%r19 + 0x017e], %r30
	.word 0xfc5461fc  ! 274: LDSH_I	ldsh	[%r17 + 0x01fc], %r30
	.word 0xba1ca023  ! 275: XOR_I	xor 	%r18, 0x0023, %r29
	setx	data_start_4, %g1, %r21
	.word 0x85956075  ! 281: WRPR_TSTATE_I	wrpr	%r21, 0x0075, %tstate
	.word 0xf0158000  ! 284: LDUH_R	lduh	[%r22 + %r0], %r24
	.word 0xf0140000  ! 287: LDUH_R	lduh	[%r16 + %r0], %r24
	.word 0xb6c48000  ! 288: ADDCcc_R	addccc 	%r18, %r0, %r27
	.word 0xfa1d0000  ! 295: LDD_R	ldd	[%r20 + %r0], %r29
	.word 0xfc45a139  ! 296: LDSW_I	ldsw	[%r22 + 0x0139], %r30
	.word 0x8594a12e  ! 300: WRPR_TSTATE_I	wrpr	%r18, 0x012e, %tstate
	.word 0xf04de152  ! 304: LDSB_I	ldsb	[%r23 + 0x0152], %r24
	.word 0xf605e0e5  ! 305: LDUW_I	lduw	[%r23 + 0x00e5], %r27
	.word 0xbf520000  ! 308: RDPR_PIL	<illegal instruction>
	.word 0xf51c60d8  ! 309: LDDF_I	ldd	[%r17, 0x00d8], %f26
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbd480000  ! 311: RDHPR_HPSTATE	rdhpr	%hpstate, %r30
	.word 0xbe3d0000  ! 315: XNOR_R	xnor 	%r20, %r0, %r31
	.word 0xfe0de1a1  ! 320: LDUB_I	ldub	[%r23 + 0x01a1], %r31
	.word 0xf255a09b  ! 321: LDSH_I	ldsh	[%r22 + 0x009b], %r25
	.word 0xfa0ce057  ! 324: LDUB_I	ldub	[%r19 + 0x0057], %r29
	.word 0x8595219b  ! 325: WRPR_TSTATE_I	wrpr	%r20, 0x019b, %tstate
	.word 0xb12d3001  ! 327: SLLX_I	sllx	%r20, 0x0001, %r24
	.word 0xb9480000  ! 328: RDHPR_HPSTATE	rdhpr	%hpstate, %r28
	.word 0xb224c000  ! 329: SUB_R	sub 	%r19, %r0, %r25
	.word 0xfc5dc000  ! 331: LDX_R	ldx	[%r23 + %r0], %r30
	.word 0xf04460c6  ! 341: LDSW_I	ldsw	[%r17 + 0x00c6], %r24
	.word 0xfd1dc000  ! 344: LDDF_R	ldd	[%r23, %r0], %f30
	.word 0xf04c8000  ! 346: LDSB_R	ldsb	[%r18 + %r0], %r24
	.word 0xfe45a139  ! 348: LDSW_I	ldsw	[%r22 + 0x0139], %r31
	.word 0xf84dc000  ! 349: LDSB_R	ldsb	[%r23 + %r0], %r28
	.word 0xbd504000  ! 352: RDPR_TNPC	<illegal instruction>
	.word 0xfa5520a1  ! 357: LDSH_I	ldsh	[%r20 + 0x00a1], %r29
	.word 0xb5480000  ! 359: RDHPR_HPSTATE	rdhpr	%hpstate, %r26
	.word 0xb89c203c  ! 363: XORcc_I	xorcc 	%r16, 0x003c, %r28
	.word 0xb42dc000  ! 364: ANDN_R	andn 	%r23, %r0, %r26
	.word 0xb151c000  ! 370: RDPR_TL	<illegal instruction>
	setx	0x36042d6100001c07, %g1, %r10
	.word 0x819a8000  ! 373: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xfc05e16a  ! 374: LDUW_I	lduw	[%r23 + 0x016a], %r30
	.word 0xf0450000  ! 376: LDSW_R	ldsw	[%r20 + %r0], %r24
	.word 0xbd350000  ! 377: SRL_R	srl 	%r20, %r0, %r30
	.word 0xf855a055  ! 379: LDSH_I	ldsh	[%r22 + 0x0055], %r28
	setx	0x4b6dc0190000b854, %g1, %r10
	.word 0x839a8000  ! 381: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xf245c000  ! 382: LDSW_R	ldsw	[%r23 + %r0], %r25
	.word 0x89956108  ! 385: WRPR_TICK_I	wrpr	%r21, 0x0108, %tick
hwintr_2_13:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_13), 16, 16)) -> intp(2, 0, 1a)
	mov	2, %r12
	.word 0xa1930000  ! 388: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xf204a142  ! 390: LDUW_I	lduw	[%r18 + 0x0142], %r25
	.word 0xf644a0a4  ! 391: LDSW_I	ldsw	[%r18 + 0x00a4], %r27
	.word 0xbd50c000  ! 392: RDPR_TT	<illegal instruction>
	.word 0xb32de001  ! 394: SLL_I	sll 	%r23, 0x0001, %r25
	.word 0xf0154000  ! 395: LDUH_R	lduh	[%r21 + %r0], %r24
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf60c2120  ! 399: LDUB_I	ldub	[%r16 + 0x0120], %r27
	.word 0x8995a03b  ! 401: WRPR_TICK_I	wrpr	%r22, 0x003b, %tick
	.word 0xf45c21c0  ! 404: LDX_I	ldx	[%r16 + 0x01c0], %r26
hwintr_2_14:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_14), 16, 16)) -> intp(2, 0, 2e)
hwintr_2_15:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_15), 16, 16)) -> intp(2, 0, 4)
	.word 0xb63cc000  ! 409: XNOR_R	xnor 	%r19, %r0, %r27
	setx	0x2b25854000009ed9, %g1, %r10
	.word 0x839a8000  ! 410: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb00da061  ! 411: AND_I	and 	%r22, 0x0061, %r24
hwintr_2_16:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_16), 16, 16)) -> intp(2, 0, 25)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
hwintr_2_17:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_17), 16, 16)) -> intp(2, 0, 7)
	.word 0xf4142106  ! 421: LDUH_I	lduh	[%r16 + 0x0106], %r26
	.word 0xbc94a14d  ! 422: ORcc_I	orcc 	%r18, 0x014d, %r30
	.word 0xf204212f  ! 423: LDUW_I	lduw	[%r16 + 0x012f], %r25
	.word 0xfa0cc000  ! 425: LDUB_R	ldub	[%r19 + %r0], %r29
	.word 0xbe35e0da  ! 426: SUBC_I	orn 	%r23, 0x00da, %r31
	.word 0xfe556017  ! 429: LDSH_I	ldsh	[%r21 + 0x0017], %r31
	.word 0xf71da0cb  ! 430: LDDF_I	ldd	[%r22, 0x00cb], %f27
	.word 0xf21d61e2  ! 432: LDD_I	ldd	[%r21 + 0x01e2], %r25
	.word 0xb5504000  ! 435: RDPR_TNPC	<illegal instruction>
	.word 0xbd504000  ! 442: RDPR_TNPC	<illegal instruction>
	.word 0xb0b50000  ! 445: SUBCcc_R	orncc 	%r20, %r0, %r24
	.word 0xb6b58000  ! 446: SUBCcc_R	orncc 	%r22, %r0, %r27
	.word 0x8d94a1bc  ! 453: WRPR_PSTATE_I	wrpr	%r18, 0x01bc, %pstate
	.word 0xf20c2195  ! 456: LDUB_I	ldub	[%r16 + 0x0195], %r25
	.word 0xfe448000  ! 458: LDSW_R	ldsw	[%r18 + %r0], %r31
	.word 0xb5508000  ! 460: RDPR_TSTATE	<illegal instruction>
	.word 0xfc1d202b  ! 461: LDD_I	ldd	[%r20 + 0x002b], %r30
	.word 0xb3508000  ! 462: RDPR_TSTATE	<illegal instruction>
	.word 0xf91ca098  ! 463: LDDF_I	ldd	[%r18, 0x0098], %f28
	.word 0xf24d60f9  ! 464: LDSB_I	ldsb	[%r21 + 0x00f9], %r25
	.word 0xf65d619c  ! 468: LDX_I	ldx	[%r21 + 0x019c], %r27
	.word 0xb00c60f1  ! 469: AND_I	and 	%r17, 0x00f1, %r24
	.word 0xb7504000  ! 471: RDPR_TNPC	<illegal instruction>
	.word 0xfa44c000  ! 472: LDSW_R	ldsw	[%r19 + %r0], %r29
hwintr_2_18:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_18), 16, 16)) -> intp(2, 0, 1f)
	.word 0x89946053  ! 486: WRPR_TICK_I	wrpr	%r17, 0x0053, %tick
hwintr_2_19:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_19), 16, 16)) -> intp(2, 0, 1a)
	.word 0xbf510000  ! 491: RDPR_TICK	<illegal instruction>
	.word 0xb150c000  ! 492: RDPR_TT	<illegal instruction>
	.word 0xb7500000  ! 493: RDPR_TPC	<illegal instruction>
	.word 0xfa1dc000  ! 498: LDD_R	ldd	[%r23 + %r0], %r29
	.word 0xbeb421b7  ! 506: ORNcc_I	orncc 	%r16, 0x01b7, %r31
	.word 0x919420d4  ! 511: WRPR_PIL_I	wrpr	%r16, 0x00d4, %pil
	.word 0xf41d0000  ! 517: LDD_R	ldd	[%r20 + %r0], %r26
	.word 0xbf51c000  ! 523: RDPR_TL	<illegal instruction>
	.word 0xf11d8000  ! 524: LDDF_R	ldd	[%r22, %r0], %f24
	.word 0x8194e106  ! 526: WRPR_TPC_I	wrpr	%r19, 0x0106, %tpc
	.word 0xfa5c8000  ! 530: LDX_R	ldx	[%r18 + %r0], %r29
	.word 0xfc154000  ! 532: LDUH_R	lduh	[%r21 + %r0], %r30
	.word 0xb4c5a052  ! 534: ADDCcc_I	addccc 	%r22, 0x0052, %r26
hwintr_2_20:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_20), 16, 16)) -> intp(2, 0, 21)
	.word 0xf2040000  ! 537: LDUW_R	lduw	[%r16 + %r0], %r25
	setx	0xda9098060000dc0b, %g1, %r10
	.word 0x839a8000  ! 540: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xf05d21af  ! 542: LDX_I	ldx	[%r20 + 0x01af], %r24
	.word 0xb151c000  ! 545: RDPR_TL	rdpr	%tl, %r24
	.word 0xbc948000  ! 549: ORcc_R	orcc 	%r18, %r0, %r30
	.word 0xb951c000  ! 550: RDPR_TL	<illegal instruction>
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb3540000  ! 560: RDPR_GL	<illegal instruction>
	.word 0x8395a0d0  ! 561: WRPR_TNPC_I	wrpr	%r22, 0x00d0, %tnpc
	.word 0x8d9521dd  ! 565: WRPR_PSTATE_I	wrpr	%r20, 0x01dd, %pstate
	.word 0x8594a001  ! 566: WRPR_TSTATE_I	wrpr	%r18, 0x0001, %tstate
	.word 0xf2052013  ! 569: LDUW_I	lduw	[%r20 + 0x0013], %r25
	.word 0xfa0cc000  ! 571: LDUB_R	ldub	[%r19 + %r0], %r29
	mov	1, %r12
	.word 0xa1930000  ! 573: WRPR_GL_R	wrpr	%r12, %r0, %-
hwintr_2_21:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_21), 16, 16)) -> intp(2, 0, 3f)
hwintr_2_22:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_22), 16, 16)) -> intp(2, 0, 3d)
	.word 0x9195e19c  ! 580: WRPR_PIL_I	wrpr	%r23, 0x019c, %pil
	.word 0x879560ef  ! 581: WRPR_TT_I	wrpr	%r21, 0x00ef, %tt
	.word 0xf71de1a7  ! 582: LDDF_I	ldd	[%r23, 0x01a7], %f27
	.word 0x8595213e  ! 585: WRPR_TSTATE_I	wrpr	%r20, 0x013e, %tstate
	setx	data_start_6, %g1, %r19
	.word 0xf80da17b  ! 589: LDUB_I	ldub	[%r22 + 0x017b], %r28
	.word 0xfa048000  ! 590: LDUW_R	lduw	[%r18 + %r0], %r29
	.word 0xf00d6007  ! 596: LDUB_I	ldub	[%r21 + 0x0007], %r24
	.word 0x87946137  ! 604: WRPR_TT_I	wrpr	%r17, 0x0137, %tt
	.word 0xbb518000  ! 605: RDPR_PSTATE	rdpr	%pstate, %r29
	.word 0x8d9561ea  ! 607: WRPR_PSTATE_I	wrpr	%r21, 0x01ea, %pstate
	mov	1, %r12
	.word 0xa1930000  ! 609: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xf054e0f2  ! 613: LDSH_I	ldsh	[%r19 + 0x00f2], %r24
hwintr_2_23:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_23), 16, 16)) -> intp(2, 0, 2f)
	mov	1, %r12
	.word 0xa1930000  ! 619: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb7510000  ! 623: RDPR_TICK	<illegal instruction>
	.word 0xfa1d615f  ! 627: LDD_I	ldd	[%r21 + 0x015f], %r29
	.word 0xfd1d8000  ! 631: LDDF_R	ldd	[%r22, %r0], %f30
	.word 0xb151c000  ! 636: RDPR_TL	<illegal instruction>
hwintr_2_24:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_24), 16, 16)) -> intp(2, 0, 36)
	setx	0xbec08d370000ad5a, %g1, %r10
	.word 0x839a8000  ! 638: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xfe4c2186  ! 640: LDSB_I	ldsb	[%r16 + 0x0186], %r31
	.word 0xb6b4610e  ! 643: ORNcc_I	orncc 	%r17, 0x010e, %r27
	.word 0x8994a19f  ! 645: WRPR_TICK_I	wrpr	%r18, 0x019f, %tick
	.word 0xf31c8000  ! 646: LDDF_R	ldd	[%r18, %r0], %f25
	.word 0x9194e0b4  ! 650: WRPR_PIL_I	wrpr	%r19, 0x00b4, %pil
	.word 0x919521fd  ! 652: WRPR_PIL_I	wrpr	%r20, 0x01fd, %pil
	.word 0xfd1de1a0  ! 656: LDDF_I	ldd	[%r23, 0x01a0], %f30
	.word 0xf644c000  ! 658: LDSW_R	ldsw	[%r19 + %r0], %r27
	.word 0xf64c4000  ! 659: LDSB_R	ldsb	[%r17 + %r0], %r27
	.word 0xfa0cc000  ! 660: LDUB_R	ldub	[%r19 + %r0], %r29
	.word 0xf91c4000  ! 661: LDDF_R	ldd	[%r17, %r0], %f28
	.word 0xf6558000  ! 664: LDSH_R	ldsh	[%r22 + %r0], %r27
hwintr_2_25:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_25), 16, 16)) -> intp(2, 0, 25)
hwintr_2_26:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_26), 16, 16)) -> intp(2, 0, 5)
hwintr_2_27:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_27), 16, 16)) -> intp(2, 0, 22)
hwintr_2_28:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_28), 16, 16)) -> intp(2, 0, 1c)
	.word 0x9195a077  ! 674: WRPR_PIL_I	wrpr	%r22, 0x0077, %pil
	.word 0xf11de0a0  ! 677: LDDF_I	ldd	[%r23, 0x00a0], %f24
hwintr_2_29:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_29), 16, 16)) -> intp(2, 0, 27)
	.word 0x919460d6  ! 690: WRPR_PIL_I	wrpr	%r17, 0x00d6, %pil
	.word 0xf65521c6  ! 691: LDSH_I	ldsh	[%r20 + 0x01c6], %r27
	.word 0xbd50c000  ! 694: RDPR_TT	<illegal instruction>
hwintr_2_30:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_30), 16, 16)) -> intp(2, 0, 2d)
	.word 0xf40d0000  ! 696: LDUB_R	ldub	[%r20 + %r0], %r26
	.word 0xb750c000  ! 699: RDPR_TT	<illegal instruction>
	.word 0xfe04a05f  ! 700: LDUW_I	lduw	[%r18 + 0x005f], %r31
	mov	2, %r12
	.word 0xa1930000  ! 704: WRPR_GL_R	wrpr	%r12, %r0, %-
hwintr_2_31:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_31), 16, 16)) -> intp(2, 0, f)
	.word 0xfb1c201d  ! 708: LDDF_I	ldd	[%r16, 0x001d], %f29
	.word 0xfa1c21bd  ! 710: LDD_I	ldd	[%r16 + 0x01bd], %r29
	.word 0xbb518000  ! 711: RDPR_PSTATE	<illegal instruction>
	.word 0xfc0c4000  ! 713: LDUB_R	ldub	[%r17 + %r0], %r30
	.word 0x8595e1a6  ! 714: WRPR_TSTATE_I	wrpr	%r23, 0x01a6, %tstate
	.word 0xbcbca039  ! 715: XNORcc_I	xnorcc 	%r18, 0x0039, %r30
	setx	0x70a4a33000004c08, %g1, %r10
	.word 0x839a8000  ! 717: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xfa1c8000  ! 720: LDD_R	ldd	[%r18 + %r0], %r29
	.word 0xfe4d8000  ! 721: LDSB_R	ldsb	[%r22 + %r0], %r31
	mov	1, %r12
	.word 0xa1930000  ! 723: WRPR_GL_R	wrpr	%r12, %r0, %-
hwintr_2_32:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_32), 16, 16)) -> intp(2, 0, c)
	.word 0xff1c60f1  ! 729: LDDF_I	ldd	[%r17, 0x00f1], %f31
	.word 0xf24c8000  ! 730: LDSB_R	ldsb	[%r18 + %r0], %r25
	.word 0xb0b58000  ! 731: SUBCcc_R	orncc 	%r22, %r0, %r24
	.word 0xf45cc000  ! 741: LDX_R	ldx	[%r19 + %r0], %r26
hwintr_2_33:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_33), 16, 16)) -> intp(2, 0, 24)
	.word 0xf80c4000  ! 749: LDUB_R	ldub	[%r17 + %r0], %r28
	.word 0xb7500000  ! 750: RDPR_TPC	<illegal instruction>
hwintr_2_34:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_34), 16, 16)) -> intp(2, 0, 25)
	.word 0xfc444000  ! 757: LDSW_R	ldsw	[%r17 + %r0], %r30
hwintr_2_35:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_35), 16, 16)) -> intp(2, 0, 2c)
	.word 0xb03561c3  ! 762: SUBC_I	orn 	%r21, 0x01c3, %r24
	.word 0xfe1d618e  ! 765: LDD_I	ldd	[%r21 + 0x018e], %r31
	.word 0xf04d6035  ! 767: LDSB_I	ldsb	[%r21 + 0x0035], %r24
	.word 0xb23d4000  ! 770: XNOR_R	xnor 	%r21, %r0, %r25
	.word 0xf41c0000  ! 772: LDD_R	ldd	[%r16 + %r0], %r26
	.word 0xb3480000  ! 773: RDHPR_HPSTATE	rdhpr	%hpstate, %r25
hwintr_2_36:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_36), 16, 16)) -> intp(2, 0, 28)
	.word 0xb9504000  ! 776: RDPR_TNPC	<illegal instruction>
	setx	data_start_3, %g1, %r16
hwintr_2_37:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_37), 16, 16)) -> intp(2, 0, 10)
	.word 0xfe5da0da  ! 780: LDX_I	ldx	[%r22 + 0x00da], %r31
	.word 0xb93c0000  ! 788: SRA_R	sra 	%r16, %r0, %r28
	setx	data_start_2, %g1, %r19
	.word 0xf31d0000  ! 791: LDDF_R	ldd	[%r20, %r0], %f25
	.word 0x919421e9  ! 795: WRPR_PIL_I	wrpr	%r16, 0x01e9, %pil
	.word 0x9195a16b  ! 797: WRPR_PIL_I	wrpr	%r22, 0x016b, %pil
	setx	data_start_0, %g1, %r19
	.word 0xbe0c6169  ! 800: AND_I	and 	%r17, 0x0169, %r31
	.word 0xf51c201e  ! 802: LDDF_I	ldd	[%r16, 0x001e], %f26
	.word 0xf65ca19f  ! 803: LDX_I	ldx	[%r18 + 0x019f], %r27
	.word 0xf51d6020  ! 805: LDDF_I	ldd	[%r21, 0x0020], %f26
	.word 0xf215e028  ! 806: LDUH_I	lduh	[%r23 + 0x0028], %r25
	setx	data_start_6, %g1, %r19
	.word 0xb1500000  ! 812: RDPR_TPC	<illegal instruction>
	.word 0xfd1ce009  ! 813: LDDF_I	ldd	[%r19, 0x0009], %f30
	.word 0xbf3c5000  ! 816: SRAX_R	srax	%r17, %r0, %r31
	.word 0xfe158000  ! 824: LDUH_R	lduh	[%r22 + %r0], %r31
hwintr_2_38:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_38), 16, 16)) -> intp(2, 0, 2a)
	.word 0xfa154000  ! 834: LDUH_R	lduh	[%r21 + %r0], %r29
	.word 0xb0c420e1  ! 835: ADDCcc_I	addccc 	%r16, 0x00e1, %r24
	.word 0xfa544000  ! 838: LDSH_R	ldsh	[%r17 + %r0], %r29
	.word 0xf20ce11e  ! 839: LDUB_I	ldub	[%r19 + 0x011e], %r25
hwintr_2_39:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_39), 16, 16)) -> intp(2, 0, 0)
	.word 0xf80d8000  ! 841: LDUB_R	ldub	[%r22 + %r0], %r28
	setx	data_start_3, %g1, %r20
	.word 0xbf500000  ! 846: RDPR_TPC	<illegal instruction>
	.word 0xfe5520d7  ! 847: LDSH_I	ldsh	[%r20 + 0x00d7], %r31
	.word 0x8995a173  ! 851: WRPR_TICK_I	wrpr	%r22, 0x0173, %tick
hwintr_2_40:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_40), 16, 16)) -> intp(2, 0, 10)
	.word 0x8995e1ea  ! 853: WRPR_TICK_I	wrpr	%r23, 0x01ea, %tick
	mov	0, %r12
	.word 0xa1930000  ! 854: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0x8395a16a  ! 855: WRPR_TNPC_I	wrpr	%r22, 0x016a, %tnpc
	.word 0xf11da047  ! 860: LDDF_I	ldd	[%r22, 0x0047], %f24
	.word 0x8d95206b  ! 863: WRPR_PSTATE_I	wrpr	%r20, 0x006b, %pstate
	.word 0xb7520000  ! 866: RDPR_PIL	<illegal instruction>
	.word 0xb951c000  ! 868: RDPR_TL	<illegal instruction>
	.word 0xf0140000  ! 869: LDUH_R	lduh	[%r16 + %r0], %r24
	setx	0x8c2f5bc0000bc91, %g1, %r10
	.word 0x839a8000  ! 875: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xf01da199  ! 876: LDD_I	ldd	[%r22 + 0x0199], %r24
	.word 0xbb50c000  ! 877: RDPR_TT	<illegal instruction>
	.word 0xfc4d6074  ! 878: LDSB_I	ldsb	[%r21 + 0x0074], %r30
	.word 0xfe1da0b9  ! 880: LDD_I	ldd	[%r22 + 0x00b9], %r31
	.word 0xf60cc000  ! 881: LDUB_R	ldub	[%r19 + %r0], %r27
	.word 0xfe15e05a  ! 883: LDUH_I	lduh	[%r23 + 0x005a], %r31
	.word 0x919420e2  ! 886: WRPR_PIL_I	wrpr	%r16, 0x00e2, %pil
	.word 0xfc0cc000  ! 887: LDUB_R	ldub	[%r19 + %r0], %r30
	.word 0xf005c000  ! 888: LDUW_R	lduw	[%r23 + %r0], %r24
	setx	data_start_5, %g1, %r21
	.word 0xf8448000  ! 906: LDSW_R	ldsw	[%r18 + %r0], %r28
	.word 0xf60de1e9  ! 908: LDUB_I	ldub	[%r23 + 0x01e9], %r27
	.word 0xb9540000  ! 910: RDPR_GL	<illegal instruction>
	.word 0xf6546041  ! 911: LDSH_I	ldsh	[%r17 + 0x0041], %r27
	.word 0xf65c20e3  ! 913: LDX_I	ldx	[%r16 + 0x00e3], %r27
	.word 0xf4144000  ! 914: LDUH_R	lduh	[%r17 + %r0], %r26
hwintr_2_41:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_41), 16, 16)) -> intp(2, 0, 1f)
	.word 0xb7508000  ! 920: RDPR_TSTATE	<illegal instruction>
	.word 0xf64d61b0  ! 921: LDSB_I	ldsb	[%r21 + 0x01b0], %r27
	.word 0xf81c4000  ! 922: LDD_R	ldd	[%r17 + %r0], %r28
	mov	0, %r12
	.word 0x8f930000  ! 926: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0x9194a02f  ! 927: WRPR_PIL_I	wrpr	%r18, 0x002f, %pil
	.word 0xf0050000  ! 930: LDUW_R	lduw	[%r20 + %r0], %r24
hwintr_2_42:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_42), 16, 16)) -> intp(2, 0, 6)
	.word 0xb951c000  ! 932: RDPR_TL	<illegal instruction>
	.word 0xfa5cc000  ! 933: LDX_R	ldx	[%r19 + %r0], %r29
	.word 0xb7520000  ! 934: RDPR_PIL	<illegal instruction>
	.word 0xf01d2045  ! 937: LDD_I	ldd	[%r20 + 0x0045], %r24
	setx	data_start_2, %g1, %r18
	.word 0xfc5420f5  ! 941: LDSH_I	ldsh	[%r16 + 0x00f5], %r30
	.word 0xf2046158  ! 942: LDUW_I	lduw	[%r17 + 0x0158], %r25
	.word 0xf41c6094  ! 943: LDD_I	ldd	[%r17 + 0x0094], %r26
	.word 0xfe444000  ! 945: LDSW_R	ldsw	[%r17 + %r0], %r31
	.word 0xf40ca0be  ! 947: LDUB_I	ldub	[%r18 + 0x00be], %r26
	.word 0xf01c0000  ! 950: LDD_R	ldd	[%r16 + %r0], %r24
hwintr_2_43:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_43), 16, 16)) -> intp(2, 0, 23)
	.word 0xf845e032  ! 955: LDSW_I	ldsw	[%r23 + 0x0032], %r28
	.word 0xf2454000  ! 957: LDSW_R	ldsw	[%r21 + %r0], %r25
	.word 0xf61c203c  ! 963: LDD_I	ldd	[%r16 + 0x003c], %r27
hwintr_2_44:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_44), 16, 16)) -> intp(2, 0, 35)
	.word 0xf0148000  ! 966: LDUH_R	lduh	[%r18 + %r0], %r24
	.word 0xf64ce128  ! 972: LDSB_I	ldsb	[%r19 + 0x0128], %r27
	.word 0xb60c0000  ! 973: AND_R	and 	%r16, %r0, %r27
	.word 0xf8440000  ! 978: LDSW_R	ldsw	[%r16 + %r0], %r28
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xbb7d2401  ! 983: MOVR_I	movre	%r20, 0x1, %r29
	.word 0xf81560a9  ! 989: LDUH_I	lduh	[%r21 + 0x00a9], %r28
	.word 0xf65d8000  ! 990: LDX_R	ldx	[%r22 + %r0], %r27
	mov	2, %r12
	.word 0xa1930000  ! 994: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0x879421fd  ! 996: WRPR_TT_I	wrpr	%r16, 0x01fd, %tt
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_1:
hwintr_1_0:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_0), 16, 16)) -> intp(1, 0, 2c)
	.word 0xb3a00560  ! 2: FSQRTq	fsqrt	
	.word 0x8994e117  ! 3: WRPR_TICK_I	wrpr	%r19, 0x0117, %tick
	.word 0xbba549c0  ! 5: FDIVd	fdivd	%f52, %f0, %f60
	mov	1, %r12
	.word 0x8f930000  ! 6: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xbf510000  ! 7: RDPR_TICK	<illegal instruction>
	.word 0x8995e09d  ! 8: WRPR_TICK_I	wrpr	%r23, 0x009d, %tick
	.word 0xbba80820  ! 10: FMOVRLEZ	fmovs	%fcc1, %f0, %f29
	.word 0xbda9c820  ! 13: FMOVVS	fmovs	%fcc1, %f0, %f30
	mov	1, %r12
	.word 0xa1930000  ! 15: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0x8194a13c  ! 16: WRPR_TPC_I	wrpr	%r18, 0x013c, %tpc
	.word 0xb685206e  ! 22: ADDcc_I	addcc 	%r20, 0x006e, %r27
	.word 0xbfa00040  ! 23: FMOVd	fmovd	%f0, %f62
	mov	0, %r12
	.word 0x8f930000  ! 27: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xb8954000  ! 28: ORcc_R	orcc 	%r21, %r0, %r28
hwintr_1_1:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_1), 16, 16)) -> intp(1, 0, 2a)
	.word 0xbab48000  ! 32: SUBCcc_R	orncc 	%r18, %r0, %r29
	.word 0xb08421d9  ! 33: ADDcc_I	addcc 	%r16, 0x01d9, %r24
hwintr_1_2:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_2), 16, 16)) -> intp(1, 0, 24)
	.word 0xbfa489e0  ! 38: FDIVq	dis not found

	.word 0xb1a8c820  ! 39: FMOVL	fmovs	%fcc1, %f0, %f24
	.word 0x9195e1a6  ! 40: WRPR_PIL_I	wrpr	%r23, 0x01a6, %pil
	.word 0xb9a00560  ! 43: FSQRTq	fsqrt	
	.word 0xb3520000  ! 47: RDPR_PIL	<illegal instruction>
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb9504000  ! 53: RDPR_TNPC	<illegal instruction>
	.word 0xb9a409e0  ! 55: FDIVq	dis not found

	.word 0xb1510000  ! 65: RDPR_TICK	<illegal instruction>
hwintr_1_3:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_3), 16, 16)) -> intp(1, 0, 1f)
	.word 0xbbaac820  ! 69: FMOVGE	fmovs	%fcc1, %f0, %f29
	.word 0xbc340000  ! 74: SUBC_R	orn 	%r16, %r0, %r30
	.word 0xbda5c860  ! 80: FADDq	dis not found

	mov	2, %r12
	.word 0xa1930000  ! 81: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb23da0bf  ! 86: XNOR_I	xnor 	%r22, 0x00bf, %r25
	.word 0xb7a88820  ! 87: FMOVLE	fmovs	%fcc1, %f0, %f27
	.word 0xbd480000  ! 89: RDHPR_HPSTATE	rdhpr	%hpstate, %r30
	.word 0x8994a0c3  ! 91: WRPR_TICK_I	wrpr	%r18, 0x00c3, %tick
	.word 0x8195e07d  ! 93: WRPR_TPC_I	wrpr	%r23, 0x007d, %tpc
	.word 0xb5520000  ! 94: RDPR_PIL	<illegal instruction>
	.word 0xb1a00520  ! 96: FSQRTs	fsqrt	
	.word 0x8d9561df  ! 97: WRPR_PSTATE_I	wrpr	%r21, 0x01df, %pstate
	.word 0xb3a44960  ! 102: FMULq	dis not found

	.word 0xb3a81420  ! 103: FMOVRNZ	dis not found

	.word 0xb5510000  ! 111: RDPR_TICK	<illegal instruction>
	.word 0xb49ca0fc  ! 114: XORcc_I	xorcc 	%r18, 0x00fc, %r26
	.word 0xb3a00040  ! 119: FMOVd	fmovd	%f0, %f56
	.word 0x91946165  ! 120: WRPR_PIL_I	wrpr	%r17, 0x0165, %pil
	.word 0xbba00520  ! 124: FSQRTs	fsqrt	
	.word 0xbca40000  ! 125: SUBcc_R	subcc 	%r16, %r0, %r30
	.word 0xb2a50000  ! 126: SUBcc_R	subcc 	%r20, %r0, %r25
	mov	1, %r12
	.word 0xa1930000  ! 128: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb3518000  ! 136: RDPR_PSTATE	<illegal instruction>
	.word 0xb7a81420  ! 138: FMOVRNZ	dis not found

	.word 0xbda94820  ! 141: FMOVCS	fmovs	%fcc1, %f0, %f30
hwintr_1_4:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_4), 16, 16)) -> intp(1, 0, 18)
	.word 0xb4b561b3  ! 144: ORNcc_I	orncc 	%r21, 0x01b3, %r26
hwintr_1_5:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_5), 16, 16)) -> intp(1, 0, 9)
	.word 0xbba8c820  ! 147: FMOVL	fmovs	%fcc1, %f0, %f29
	setx	0x215c47730000fc1f, %g1, %r10
	.word 0x839a8000  ! 155: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb8bd6085  ! 161: XNORcc_I	xnorcc 	%r21, 0x0085, %r28
hwintr_1_6:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_6), 16, 16)) -> intp(1, 0, 24)
hwintr_1_7:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_7), 16, 16)) -> intp(1, 0, 11)
	.word 0x8995e17f  ! 168: WRPR_TICK_I	wrpr	%r23, 0x017f, %tick
	.word 0x8595205f  ! 170: WRPR_TSTATE_I	wrpr	%r20, 0x005f, %tstate
	.word 0xb415a0c8  ! 176: OR_I	or 	%r22, 0x00c8, %r26
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0x8594615e  ! 181: WRPR_TSTATE_I	wrpr	%r17, 0x015e, %tstate
	setx	data_start_1, %g1, %r23
	setx	data_start_6, %g1, %r17
	setx	data_start_1, %g1, %r19
hwintr_1_8:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_8), 16, 16)) -> intp(1, 0, b)
	.word 0xbb480000  ! 189: RDHPR_HPSTATE	rdhpr	%hpstate, %r29
	.word 0xbda90820  ! 193: FMOVLEU	fmovs	%fcc1, %f0, %f30
	.word 0xb7a4c8c0  ! 195: FSUBd	fsubd	%f50, %f0, %f58
	.word 0xb5a588e0  ! 197: FSUBq	dis not found

	.word 0xb9a588e0  ! 200: FSUBq	dis not found

	.word 0xbda88820  ! 201: FMOVLE	fmovs	%fcc1, %f0, %f30
hwintr_1_9:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_9), 16, 16)) -> intp(1, 0, 2)
	.word 0xbba80420  ! 209: FMOVRZ	dis not found

	mov	1, %r12
	.word 0x8f930000  ! 210: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xb3a54960  ! 212: FMULq	dis not found

	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb3a00520  ! 218: FSQRTs	fsqrt	
	.word 0xbda81420  ! 219: FMOVRNZ	dis not found

	setx	0x39ab5b4d00001f9e, %g1, %r10
	.word 0x819a8000  ! 220: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0x9194606f  ! 223: WRPR_PIL_I	wrpr	%r17, 0x006f, %pil
	.word 0xb5a00560  ! 226: FSQRTq	fsqrt	
	.word 0xbba549a0  ! 229: FDIVs	fdivs	%f21, %f0, %f29
	.word 0x8794217c  ! 230: WRPR_TT_I	wrpr	%r16, 0x017c, %tt
	.word 0xb9a00540  ! 232: FSQRTd	fsqrt	
hwintr_1_10:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_10), 16, 16)) -> intp(1, 0, 3b)
	.word 0xb5a549a0  ! 235: FDIVs	fdivs	%f21, %f0, %f26
	.word 0xbebdc000  ! 236: XNORcc_R	xnorcc 	%r23, %r0, %r31
	setx	0xd48fe6c00001ac9, %g1, %r10
	.word 0x839a8000  ! 239: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb7a588c0  ! 244: FSUBd	fsubd	%f22, %f0, %f58
hwintr_1_11:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_11), 16, 16)) -> intp(1, 0, 23)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb1a80820  ! 253: FMOVRLEZ	fmovs	%fcc1, %f0, %f24
	mov	2, %r12
	.word 0xa1930000  ! 255: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0x879520ea  ! 256: WRPR_TT_I	wrpr	%r20, 0x00ea, %tt
	.word 0xbda84820  ! 257: FMOVE	fmovs	%fcc1, %f0, %f30
	setx	data_start_7, %g1, %r20
	.word 0xbfaa4820  ! 260: FMOVNE	fmovs	%fcc1, %f0, %f31
	.word 0xb3a509c0  ! 261: FDIVd	fdivd	%f20, %f0, %f56
	.word 0x8994a1fc  ! 262: WRPR_TICK_I	wrpr	%r18, 0x01fc, %tick
	.word 0x8795a142  ! 263: WRPR_TT_I	wrpr	%r22, 0x0142, %tt
	.word 0xb6250000  ! 264: SUB_R	sub 	%r20, %r0, %r27
hwintr_1_12:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_12), 16, 16)) -> intp(1, 0, c)
	.word 0xb5504000  ! 268: RDPR_TNPC	<illegal instruction>
	.word 0xb7a589e0  ! 269: FDIVq	dis not found

	.word 0xb1a00020  ! 270: FMOVs	fmovs	%f0, %f24
	.word 0xb3a98820  ! 272: FMOVNEG	fmovs	%fcc1, %f0, %f25
	.word 0xb41ca14c  ! 275: XOR_I	xor 	%r18, 0x014c, %r26
	setx	data_start_2, %g1, %r21
	.word 0xb7a549c0  ! 280: FDIVd	fdivd	%f52, %f0, %f58
	.word 0x8595204a  ! 281: WRPR_TSTATE_I	wrpr	%r20, 0x004a, %tstate
	.word 0xb3a549c0  ! 283: FDIVd	fdivd	%f52, %f0, %f56
	.word 0xb5a54860  ! 285: FADDq	dis not found

	.word 0xbda00520  ! 286: FSQRTs	fsqrt	
	.word 0xb8c58000  ! 288: ADDCcc_R	addccc 	%r22, %r0, %r28
	.word 0xbda00040  ! 292: FMOVd	fmovd	%f0, %f30
	.word 0xb3a00540  ! 293: FSQRTd	fsqrt	
	.word 0xb9a00020  ! 294: FMOVs	fmovs	%f0, %f28
	.word 0x8594a17e  ! 300: WRPR_TSTATE_I	wrpr	%r18, 0x017e, %tstate
	.word 0xbfa48920  ! 301: FMULs	fmuls	%f18, %f0, %f31
	.word 0xb5a40860  ! 303: FADDq	dis not found

	.word 0xbfa5c8a0  ! 307: FSUBs	fsubs	%f23, %f0, %f31
	.word 0xb9520000  ! 308: RDPR_PIL	<illegal instruction>
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb9480000  ! 311: RDHPR_HPSTATE	rdhpr	%hpstate, %r28
	.word 0xbbaa0820  ! 312: FMOVA	fmovs	%fcc1, %f0, %f29
	.word 0xb9a8c820  ! 313: FMOVL	fmovs	%fcc1, %f0, %f28
	.word 0xb03cc000  ! 315: XNOR_R	xnor 	%r19, %r0, %r24
	.word 0xb3a98820  ! 316: FMOVNEG	fmovs	%fcc1, %f0, %f25
	.word 0x859460c0  ! 325: WRPR_TSTATE_I	wrpr	%r17, 0x00c0, %tstate
	.word 0xb5a98820  ! 326: FMOVNEG	fmovs	%fcc1, %f0, %f26
	.word 0xb52d7001  ! 327: SLLX_I	sllx	%r21, 0x0001, %r26
	.word 0xbf480000  ! 328: RDHPR_HPSTATE	rdhpr	%hpstate, %r31
	.word 0xba24c000  ! 329: SUB_R	sub 	%r19, %r0, %r29
	.word 0xb1a00020  ! 337: FMOVs	fmovs	%f0, %f24
	.word 0xbba80820  ! 339: FMOVRLEZ	fmovs	%fcc1, %f0, %f29
	.word 0xbda80820  ! 345: FMOVN	fmovs	%fcc1, %f0, %f30
	.word 0xbf504000  ! 352: RDPR_TNPC	<illegal instruction>
	.word 0xbba00520  ! 356: FSQRTs	fsqrt	
	.word 0xbf480000  ! 359: RDHPR_HPSTATE	rdhpr	%hpstate, %r31
	.word 0xb9ab4820  ! 360: FMOVCC	fmovs	%fcc1, %f0, %f28
	.word 0xb3a8c820  ! 361: FMOVL	fmovs	%fcc1, %f0, %f25
	.word 0xb49da055  ! 363: XORcc_I	xorcc 	%r22, 0x0055, %r26
	.word 0xba2c0000  ! 364: ANDN_R	andn 	%r16, %r0, %r29
	.word 0xb5a00540  ! 367: FSQRTd	fsqrt	
	.word 0xb5a8c820  ! 368: FMOVL	fmovs	%fcc1, %f0, %f26
	.word 0xbf51c000  ! 370: RDPR_TL	<illegal instruction>
	.word 0xbfa94820  ! 371: FMOVCS	fmovs	%fcc1, %f0, %f31
	.word 0xb9a00520  ! 372: FSQRTs	fsqrt	
	setx	0xca5fb7270000a9c9, %g1, %r10
	.word 0x819a8000  ! 373: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xb3350000  ! 377: SRL_R	srl 	%r20, %r0, %r25
	.word 0xbda80820  ! 378: FMOVN	fmovs	%fcc1, %f0, %f30
	.word 0xb7a449e0  ! 380: FDIVq	dis not found

	setx	0x3b6246f20000f882, %g1, %r10
	.word 0x839a8000  ! 381: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0x8994a1ef  ! 385: WRPR_TICK_I	wrpr	%r18, 0x01ef, %tick
hwintr_1_13:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_13), 16, 16)) -> intp(1, 0, 0)
	.word 0xbba589a0  ! 387: FDIVs	fdivs	%f22, %f0, %f29
	mov	1, %r12
	.word 0xa1930000  ! 388: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb550c000  ! 392: RDPR_TT	<illegal instruction>
	.word 0xb92c2001  ! 394: SLL_I	sll 	%r16, 0x0001, %r28
	.word 0xb3a58860  ! 397: FADDq	dis not found

	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb3ab4820  ! 400: FMOVCC	fmovs	%fcc1, %f0, %f25
	.word 0x899420ab  ! 401: WRPR_TICK_I	wrpr	%r16, 0x00ab, %tick
	.word 0xbfa9c820  ! 402: FMOVVS	fmovs	%fcc1, %f0, %f31
	.word 0xb9a5c960  ! 403: FMULq	dis not found

hwintr_1_14:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_14), 16, 16)) -> intp(1, 0, 15)
hwintr_1_15:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_15), 16, 16)) -> intp(1, 0, 27)
	.word 0xb3a508a0  ! 408: FSUBs	fsubs	%f20, %f0, %f25
	.word 0xb03c4000  ! 409: XNOR_R	xnor 	%r17, %r0, %r24
	setx	0x8863d7a40000588f, %g1, %r10
	.word 0x839a8000  ! 410: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xbe0ce0bf  ! 411: AND_I	and 	%r19, 0x00bf, %r31
	.word 0xb5abc820  ! 412: FMOVVC	fmovs	%fcc1, %f0, %f26
hwintr_1_16:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_16), 16, 16)) -> intp(1, 0, 1f)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
hwintr_1_17:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_17), 16, 16)) -> intp(1, 0, 35)
	.word 0xb5a489c0  ! 419: FDIVd	fdivd	%f18, %f0, %f26
	.word 0xba95a080  ! 422: ORcc_I	orcc 	%r22, 0x0080, %r29
	.word 0xb9ab4820  ! 424: FMOVCC	fmovs	%fcc1, %f0, %f28
	.word 0xba35e106  ! 426: SUBC_I	orn 	%r23, 0x0106, %r29
	.word 0xb5a00540  ! 427: FSQRTd	fsqrt	
	.word 0xb9a00540  ! 428: FSQRTd	fsqrt	
	.word 0xbda80820  ! 433: FMOVN	fmovs	%fcc1, %f0, %f30
	.word 0xb3ab8820  ! 434: FMOVPOS	fmovs	%fcc1, %f0, %f25
	.word 0xbb504000  ! 435: RDPR_TNPC	<illegal instruction>
	.word 0xb3a00560  ! 437: FSQRTq	fsqrt	
	.word 0xbdaa0820  ! 440: FMOVA	fmovs	%fcc1, %f0, %f30
	.word 0xb7a54920  ! 441: FMULs	fmuls	%f21, %f0, %f27
	.word 0xb9504000  ! 442: RDPR_TNPC	<illegal instruction>
	.word 0xb1a80820  ! 444: FMOVN	fmovs	%fcc1, %f0, %f24
	.word 0xbeb4c000  ! 445: SUBCcc_R	orncc 	%r19, %r0, %r31
	.word 0xbeb48000  ! 446: SUBCcc_R	orncc 	%r18, %r0, %r31
	.word 0xb3a81820  ! 451: FMOVRGZ	fmovs	%fcc3, %f0, %f25
	.word 0x8d95a11c  ! 453: WRPR_PSTATE_I	wrpr	%r22, 0x011c, %pstate
	.word 0xb5a00560  ! 454: FSQRTq	fsqrt	
	.word 0xb7a80820  ! 457: FMOVRLEZ	fmovs	%fcc1, %f0, %f27
	.word 0xb9508000  ! 460: RDPR_TSTATE	<illegal instruction>
	.word 0xb7508000  ! 462: RDPR_TSTATE	<illegal instruction>
	.word 0xbba98820  ! 465: FMOVNEG	fmovs	%fcc1, %f0, %f29
	.word 0xb9a80c20  ! 467: FMOVRLZ	dis not found

	.word 0xb20c600b  ! 469: AND_I	and 	%r17, 0x000b, %r25
	.word 0xb5504000  ! 471: RDPR_TNPC	<illegal instruction>
	.word 0xbfa00540  ! 476: FSQRTd	fsqrt	
	.word 0xb5a489c0  ! 481: FDIVd	fdivd	%f18, %f0, %f26
	.word 0xb5a9c820  ! 482: FMOVVS	fmovs	%fcc1, %f0, %f26
	.word 0xb5a4c8a0  ! 483: FSUBs	fsubs	%f19, %f0, %f26
hwintr_1_18:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_18), 16, 16)) -> intp(1, 0, 14)
	.word 0x8994e0c6  ! 486: WRPR_TICK_I	wrpr	%r19, 0x00c6, %tick
hwintr_1_19:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_19), 16, 16)) -> intp(1, 0, e)
	.word 0xb9510000  ! 491: RDPR_TICK	<illegal instruction>
	.word 0xb550c000  ! 492: RDPR_TT	<illegal instruction>
	.word 0xb3500000  ! 493: RDPR_TPC	<illegal instruction>
	.word 0xbfa5c8e0  ! 496: FSUBq	dis not found

	.word 0xb7aa4820  ! 503: FMOVNE	fmovs	%fcc1, %f0, %f27
	.word 0xb9aa8820  ! 504: FMOVG	fmovs	%fcc1, %f0, %f28
	.word 0xbeb5e11f  ! 506: ORNcc_I	orncc 	%r23, 0x011f, %r31
	.word 0xb7a4c8e0  ! 508: FSUBq	dis not found

	.word 0x919560e6  ! 511: WRPR_PIL_I	wrpr	%r21, 0x00e6, %pil
	.word 0xb9a00040  ! 515: FMOVd	fmovd	%f0, %f28
	.word 0xbda98820  ! 516: FMOVNEG	fmovs	%fcc1, %f0, %f30
	.word 0xb1a50920  ! 518: FMULs	fmuls	%f20, %f0, %f24
	.word 0xb951c000  ! 523: RDPR_TL	<illegal instruction>
	.word 0xb7abc820  ! 525: FMOVVC	fmovs	%fcc1, %f0, %f27
	.word 0x8194e0fd  ! 526: WRPR_TPC_I	wrpr	%r19, 0x00fd, %tpc
	.word 0xb1a58960  ! 531: FMULq	dis not found

	.word 0xb5a5c9c0  ! 533: FDIVd	fdivd	%f54, %f0, %f26
	.word 0xbec4e089  ! 534: ADDCcc_I	addccc 	%r19, 0x0089, %r31
	.word 0xbfa00540  ! 535: FSQRTd	fsqrt	
hwintr_1_20:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_20), 16, 16)) -> intp(1, 0, 11)
	.word 0xb9a94820  ! 539: FMOVCS	fmovs	%fcc1, %f0, %f28
	setx	0xf58b7a2e00009b8a, %g1, %r10
	.word 0x839a8000  ! 540: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xbfa549a0  ! 544: FDIVs	fdivs	%f21, %f0, %f31
	.word 0xbf51c000  ! 545: RDPR_TL	<illegal instruction>
	.word 0xb3a90820  ! 547: FMOVLEU	fmovs	%fcc1, %f0, %f25
	.word 0xb2948000  ! 549: ORcc_R	orcc 	%r18, %r0, %r25
	.word 0xb351c000  ! 550: RDPR_TL	<illegal instruction>
	.word 0xb5a81820  ! 551: FMOVRGZ	fmovs	%fcc3, %f0, %f26
	.word 0xb1a508c0  ! 552: FSUBd	fsubd	%f20, %f0, %f24
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb5a00020  ! 558: FMOVs	fmovs	%f0, %f26
	.word 0xb5a9c820  ! 559: FMOVVS	fmovs	%fcc1, %f0, %f26
	.word 0xb3540000  ! 560: RDPR_GL	<illegal instruction>
	.word 0x8394e000  ! 561: WRPR_TNPC_I	wrpr	%r19, 0x0000, %tnpc
	.word 0xb9a4c920  ! 563: FMULs	fmuls	%f19, %f0, %f28
	.word 0xbda98820  ! 564: FMOVNEG	fmovs	%fcc1, %f0, %f30
	.word 0x8d94e06c  ! 565: WRPR_PSTATE_I	wrpr	%r19, 0x006c, %pstate
	.word 0x859560a3  ! 566: WRPR_TSTATE_I	wrpr	%r21, 0x00a3, %tstate
	.word 0xbba409a0  ! 567: FDIVs	fdivs	%f16, %f0, %f29
	.word 0xb5a94820  ! 568: FMOVCS	fmovs	%fcc1, %f0, %f26
	.word 0xbbaa8820  ! 572: FMOVG	fmovs	%fcc1, %f0, %f29
	mov	0, %r12
	.word 0xa1930000  ! 573: WRPR_GL_R	wrpr	%r12, %r0, %-
hwintr_1_21:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_21), 16, 16)) -> intp(1, 0, a)
hwintr_1_22:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_22), 16, 16)) -> intp(1, 0, 24)
	.word 0xbbaa0820  ! 579: FMOVA	fmovs	%fcc1, %f0, %f29
	.word 0x9194a1a7  ! 580: WRPR_PIL_I	wrpr	%r18, 0x01a7, %pil
	.word 0x8795a19e  ! 581: WRPR_TT_I	wrpr	%r22, 0x019e, %tt
	.word 0xb9a81420  ! 584: FMOVRNZ	dis not found

	.word 0x8595a1a9  ! 585: WRPR_TSTATE_I	wrpr	%r22, 0x01a9, %tstate
	setx	data_start_2, %g1, %r22
	.word 0xb9a58820  ! 588: FADDs	fadds	%f22, %f0, %f28
	.word 0xb9a5c820  ! 591: FADDs	fadds	%f23, %f0, %f28
	.word 0xbba84820  ! 593: FMOVE	fmovs	%fcc1, %f0, %f29
	.word 0xb1a00020  ! 595: FMOVs	fmovs	%f0, %f24
	.word 0xb9a00520  ! 601: FSQRTs	fsqrt	
	.word 0xb3a94820  ! 602: FMOVCS	fmovs	%fcc1, %f0, %f25
	.word 0xb5a44860  ! 603: FADDq	dis not found

	.word 0x8795215c  ! 604: WRPR_TT_I	wrpr	%r20, 0x015c, %tt
	.word 0xb1518000  ! 605: RDPR_PSTATE	<illegal instruction>
	.word 0x8d94618b  ! 607: WRPR_PSTATE_I	wrpr	%r17, 0x018b, %pstate
	mov	1, %r12
	.word 0xa1930000  ! 609: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xbda548e0  ! 612: FSUBq	dis not found

	.word 0xbfaa0820  ! 614: FMOVA	fmovs	%fcc1, %f0, %f31
	.word 0xb1aa4820  ! 615: FMOVNE	fmovs	%fcc1, %f0, %f24
hwintr_1_23:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_23), 16, 16)) -> intp(1, 0, 30)
	mov	0, %r12
	.word 0xa1930000  ! 619: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb1a40960  ! 620: FMULq	dis not found

	.word 0xb5510000  ! 623: RDPR_TICK	<illegal instruction>
	.word 0xbfa40960  ! 632: FMULq	dis not found

	.word 0xb1a81c20  ! 635: FMOVRGEZ	dis not found

	.word 0xbd51c000  ! 636: RDPR_TL	<illegal instruction>
hwintr_1_24:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_24), 16, 16)) -> intp(1, 0, 8)
	setx	0x1b37880f00000f80, %g1, %r10
	.word 0x839a8000  ! 638: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xbeb42162  ! 643: ORNcc_I	orncc 	%r16, 0x0162, %r31
	.word 0x8994217f  ! 645: WRPR_TICK_I	wrpr	%r16, 0x017f, %tick
	.word 0xbfa9c820  ! 647: FMOVVS	fmovs	%fcc1, %f0, %f31
	.word 0xb3a00560  ! 648: FSQRTq	fsqrt	
	.word 0x9195a123  ! 650: WRPR_PIL_I	wrpr	%r22, 0x0123, %pil
	.word 0x91946061  ! 652: WRPR_PIL_I	wrpr	%r17, 0x0061, %pil
hwintr_1_25:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_25), 16, 16)) -> intp(1, 0, 12)
hwintr_1_26:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_26), 16, 16)) -> intp(1, 0, 1)
hwintr_1_27:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_27), 16, 16)) -> intp(1, 0, 3d)
hwintr_1_28:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_28), 16, 16)) -> intp(1, 0, 3d)
	.word 0x91942128  ! 674: WRPR_PIL_I	wrpr	%r16, 0x0128, %pil
	.word 0xb5a5c9c0  ! 676: FDIVd	fdivd	%f54, %f0, %f26
	.word 0xb9a8c820  ! 678: FMOVL	fmovs	%fcc1, %f0, %f28
	.word 0xb1a4c8c0  ! 679: FSUBd	fsubd	%f50, %f0, %f24
	.word 0xb5a5c9c0  ! 680: FDIVd	fdivd	%f54, %f0, %f26
hwintr_1_29:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_29), 16, 16)) -> intp(1, 0, 1f)
	.word 0xb3a50820  ! 683: FADDs	fadds	%f20, %f0, %f25
	.word 0xb5a00040  ! 687: FMOVd	fmovd	%f0, %f26
	.word 0xb1a94820  ! 688: FMOVCS	fmovs	%fcc1, %f0, %f24
	.word 0xbfa408c0  ! 689: FSUBd	fsubd	%f16, %f0, %f62
	.word 0x9195203b  ! 690: WRPR_PIL_I	wrpr	%r20, 0x003b, %pil
	.word 0xb7abc820  ! 692: FMOVVC	fmovs	%fcc1, %f0, %f27
	.word 0xb350c000  ! 694: RDPR_TT	<illegal instruction>
hwintr_1_30:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_30), 16, 16)) -> intp(1, 0, 1f)
	.word 0xb9aa8820  ! 697: FMOVG	fmovs	%fcc1, %f0, %f28
	.word 0xb3a50860  ! 698: FADDq	dis not found

	.word 0xb750c000  ! 699: RDPR_TT	<illegal instruction>
	.word 0xb1a58920  ! 701: FMULs	fmuls	%f22, %f0, %f24
	.word 0xbfaa8820  ! 703: FMOVG	fmovs	%fcc1, %f0, %f31
	mov	0, %r12
	.word 0xa1930000  ! 704: WRPR_GL_R	wrpr	%r12, %r0, %-
hwintr_1_31:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_31), 16, 16)) -> intp(1, 0, 0)
	.word 0xbdabc820  ! 706: FMOVVC	fmovs	%fcc1, %f0, %f30
	.word 0xb9aac820  ! 709: FMOVGE	fmovs	%fcc1, %f0, %f28
	.word 0xbb518000  ! 711: RDPR_PSTATE	<illegal instruction>
	.word 0x859421a5  ! 714: WRPR_TSTATE_I	wrpr	%r16, 0x01a5, %tstate
	.word 0xb0bce1ec  ! 715: XNORcc_I	xnorcc 	%r19, 0x01ec, %r24
	setx	0xd05f3e00006f45, %g1, %r10
	.word 0x839a8000  ! 717: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xbba00540  ! 719: FSQRTd	fsqrt	
	mov	1, %r12
	.word 0xa1930000  ! 723: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb5a00540  ! 724: FSQRTd	fsqrt	
	.word 0xb1a549c0  ! 726: FDIVd	fdivd	%f52, %f0, %f24
hwintr_1_32:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_32), 16, 16)) -> intp(1, 0, 1b)
	.word 0xb6b54000  ! 731: SUBCcc_R	orncc 	%r21, %r0, %r27
	.word 0xb3a54960  ! 735: FMULq	dis not found

	.word 0xbba58820  ! 739: FADDs	fadds	%f22, %f0, %f29
hwintr_1_33:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_33), 16, 16)) -> intp(1, 0, 5)
	.word 0xb5500000  ! 750: RDPR_TPC	<illegal instruction>
	.word 0xbba489c0  ! 752: FDIVd	fdivd	%f18, %f0, %f60
	.word 0xb3a00540  ! 754: FSQRTd	fsqrt	
hwintr_1_34:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_34), 16, 16)) -> intp(1, 0, 20)
	.word 0xb5a84820  ! 756: FMOVE	fmovs	%fcc1, %f0, %f26
	.word 0xb9a84820  ! 760: FMOVE	fmovs	%fcc1, %f0, %f28
hwintr_1_35:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_35), 16, 16)) -> intp(1, 0, 19)
	.word 0xb03461c6  ! 762: SUBC_I	orn 	%r17, 0x01c6, %r24
	.word 0xb5a54920  ! 768: FMULs	fmuls	%f21, %f0, %f26
	.word 0xbda4c9a0  ! 769: FDIVs	fdivs	%f19, %f0, %f30
	.word 0xb03c8000  ! 770: XNOR_R	xnor 	%r18, %r0, %r24
	.word 0xb9a94820  ! 771: FMOVCS	fmovs	%fcc1, %f0, %f28
	.word 0xb3480000  ! 773: RDHPR_HPSTATE	rdhpr	%hpstate, %r25
hwintr_1_36:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_36), 16, 16)) -> intp(1, 0, 13)
	.word 0xb7504000  ! 776: RDPR_TNPC	<illegal instruction>
	setx	data_start_5, %g1, %r21
hwintr_1_37:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_37), 16, 16)) -> intp(1, 0, 12)
	.word 0xb7a54920  ! 783: FMULs	fmuls	%f21, %f0, %f27
	.word 0xb5a80820  ! 785: FMOVN	fmovs	%fcc1, %f0, %f26
	.word 0xb7a00560  ! 787: FSQRTq	fsqrt	
	.word 0xb13d0000  ! 788: SRA_R	sra 	%r20, %r0, %r24
	setx	data_start_4, %g1, %r16
	.word 0xb1a44840  ! 793: FADDd	faddd	%f48, %f0, %f24
	.word 0xb7a489c0  ! 794: FDIVd	fdivd	%f18, %f0, %f58
	.word 0x9194602a  ! 795: WRPR_PIL_I	wrpr	%r17, 0x002a, %pil
	.word 0x9195a0e4  ! 797: WRPR_PIL_I	wrpr	%r22, 0x00e4, %pil
	setx	data_start_6, %g1, %r21
	.word 0xb40ce177  ! 800: AND_I	and 	%r19, 0x0177, %r26
	.word 0xbba4c9e0  ! 808: FDIVq	dis not found

	.word 0xb7a58840  ! 809: FADDd	faddd	%f22, %f0, %f58
	setx	data_start_6, %g1, %r17
	.word 0xbb500000  ! 812: RDPR_TPC	<illegal instruction>
	.word 0xbba00020  ! 815: FMOVs	fmovs	%f0, %f29
	.word 0xb13c5000  ! 816: SRAX_R	srax	%r17, %r0, %r24
	.word 0xbba488e0  ! 819: FSUBq	dis not found

	.word 0xb5a90820  ! 820: FMOVLEU	fmovs	%fcc1, %f0, %f26
	.word 0xb1a00560  ! 822: FSQRTq	fsqrt	
	.word 0xbba448a0  ! 827: FSUBs	fsubs	%f17, %f0, %f29
	.word 0xbba80820  ! 828: FMOVN	fmovs	%fcc1, %f0, %f29
	.word 0xb1a80820  ! 831: FMOVN	fmovs	%fcc1, %f0, %f24
hwintr_1_38:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_38), 16, 16)) -> intp(1, 0, 3d)
	.word 0xbfa489a0  ! 833: FDIVs	fdivs	%f18, %f0, %f31
	.word 0xbcc5e19f  ! 835: ADDCcc_I	addccc 	%r23, 0x019f, %r30
	.word 0xb7abc820  ! 837: FMOVVC	fmovs	%fcc1, %f0, %f27
hwintr_1_39:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_39), 16, 16)) -> intp(1, 0, e)
	.word 0xb5abc820  ! 842: FMOVVC	fmovs	%fcc1, %f0, %f26
	setx	data_start_2, %g1, %r17
	.word 0xbba589a0  ! 845: FDIVs	fdivs	%f22, %f0, %f29
	.word 0xbd500000  ! 846: RDPR_TPC	<illegal instruction>
	.word 0xb7a508e0  ! 850: FSUBq	dis not found

	.word 0x8994e0ec  ! 851: WRPR_TICK_I	wrpr	%r19, 0x00ec, %tick
hwintr_1_40:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_40), 16, 16)) -> intp(1, 0, 16)
	.word 0x89946120  ! 853: WRPR_TICK_I	wrpr	%r17, 0x0120, %tick
	mov	1, %r12
	.word 0xa1930000  ! 854: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0x8394a11b  ! 855: WRPR_TNPC_I	wrpr	%r18, 0x011b, %tnpc
	.word 0xbdab0820  ! 857: FMOVGU	fmovs	%fcc1, %f0, %f30
	.word 0x8d95a1c8  ! 863: WRPR_PSTATE_I	wrpr	%r22, 0x01c8, %pstate
	.word 0xbb520000  ! 866: RDPR_PIL	<illegal instruction>
	.word 0xb551c000  ! 868: RDPR_TL	<illegal instruction>
	setx	0xfc50a5400000c94d, %g1, %r10
	.word 0x839a8000  ! 875: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb150c000  ! 877: RDPR_TT	<illegal instruction>
	.word 0xb7a00040  ! 882: FMOVd	fmovd	%f0, %f58
	.word 0xbda5c960  ! 885: FMULq	dis not found

	.word 0x919521f6  ! 886: WRPR_PIL_I	wrpr	%r20, 0x01f6, %pil
	.word 0xb5a4c820  ! 891: FADDs	fadds	%f19, %f0, %f26
	.word 0xb3a408c0  ! 896: FSUBd	fsubd	%f16, %f0, %f56
	.word 0xb9a00540  ! 898: FSQRTd	fsqrt	
	.word 0xb7a589c0  ! 899: FDIVd	fdivd	%f22, %f0, %f58
	.word 0xb5a00040  ! 902: FMOVd	fmovd	%f0, %f26
	setx	data_start_5, %g1, %r19
	.word 0xb9a4c840  ! 904: FADDd	faddd	%f50, %f0, %f28
	.word 0xb5a80420  ! 905: FMOVRZ	dis not found

	.word 0xb1a44940  ! 907: FMULd	fmuld	%f48, %f0, %f24
	.word 0xbf540000  ! 910: RDPR_GL	<illegal instruction>
hwintr_1_41:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_41), 16, 16)) -> intp(1, 0, 11)
	.word 0xb1a548a0  ! 918: FSUBs	fsubs	%f21, %f0, %f24
	.word 0xbf508000  ! 920: RDPR_TSTATE	<illegal instruction>
	.word 0xbba8c820  ! 925: FMOVL	fmovs	%fcc1, %f0, %f29
	mov	1, %r12
	.word 0x8f930000  ! 926: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0x9194e007  ! 927: WRPR_PIL_I	wrpr	%r19, 0x0007, %pil
hwintr_1_42:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_42), 16, 16)) -> intp(1, 0, 11)
	.word 0xbf51c000  ! 932: RDPR_TL	<illegal instruction>
	.word 0xbb520000  ! 934: RDPR_PIL	<illegal instruction>
	.word 0xb1a58920  ! 935: FMULs	fmuls	%f22, %f0, %f24
	setx	data_start_5, %g1, %r21
	.word 0xb5a80420  ! 939: FMOVRZ	dis not found

	.word 0xbfa5c8c0  ! 946: FSUBd	fsubd	%f54, %f0, %f62
	.word 0xb3a44920  ! 948: FMULs	fmuls	%f17, %f0, %f25
	.word 0xb3a409c0  ! 951: FDIVd	fdivd	%f16, %f0, %f56
hwintr_1_43:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_43), 16, 16)) -> intp(1, 0, 26)
	.word 0xb5ab0820  ! 956: FMOVGU	fmovs	%fcc1, %f0, %f26
	.word 0xb9a548a0  ! 960: FSUBs	fsubs	%f21, %f0, %f28
	.word 0xbfa48860  ! 962: FADDq	dis not found

hwintr_1_44:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_44), 16, 16)) -> intp(1, 0, 38)
	.word 0xb60c8000  ! 973: AND_R	and 	%r18, %r0, %r27
	.word 0xbfa58840  ! 977: FADDd	faddd	%f22, %f0, %f62
	.word 0xb3a00540  ! 979: FSQRTd	fsqrt	
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb1ab8820  ! 982: FMOVPOS	fmovs	%fcc1, %f0, %f24
	.word 0xbb7d6401  ! 983: MOVR_I	movre	%r21, 0x1, %r29
	.word 0xb1a44820  ! 992: FADDs	fadds	%f17, %f0, %f24
	mov	2, %r12
	.word 0xa1930000  ! 994: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xbba448e0  ! 995: FSUBq	dis not found

	.word 0x87956187  ! 996: WRPR_TT_I	wrpr	%r21, 0x0187, %tt

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

	.xword	0x1231edd8dc6a68cc
	.xword	0x97fb42f4468457e8
	.xword	0xbb72878beda1abcd
	.xword	0xe6df4fe5d6cc3bed
	.xword	0x0053a8a35862d3af
	.xword	0x73ef1783a8761a45
	.xword	0x8150aa8f9ad7a3b5
	.xword	0x1338d262c8e6a95b
	.xword	0xb2c7ee5da3af904f
	.xword	0x7ec9d545b77e7d4d
	.xword	0x873c3b12b4c86ea7
	.xword	0x1cd9260a39a5b534
	.xword	0x4ea58b95ddc8619c
	.xword	0x4dbcc9324d89abbf
	.xword	0xf906b52e7326bceb
	.xword	0x22692edecc9c94ca
	.xword	0x2fabddc1845adb88
	.xword	0xa539d4d0fc043625
	.xword	0x2ed99e5f93414f21
	.xword	0x303a84da5a8c0d14
	.xword	0xf6a8f426fef9f097
	.xword	0xb8661fcab5049637
	.xword	0xa7b8cfdf6a30dd15
	.xword	0xadf0a2f26bdc157d
	.xword	0xb49748336637c938
	.xword	0x91df2364bed85f45
	.xword	0xf4684ad5a6149c8c
	.xword	0xc38bcbb007943e92
	.xword	0x241db3add0faf300
	.xword	0xb620197e312c8e37
	.xword	0x5943459d1e4dc8a9
	.xword	0x810f048afd7ef1fd
	.xword	0x26e4708ed75f9c1f
	.xword	0xf16ec4f9e780577c
	.xword	0x38cc6790b4b273b5
	.xword	0x73dac38421dbe095
	.xword	0x7d0bcb844fc034b6
	.xword	0x5c787a382542dc45
	.xword	0xc2f7a9e4af66aaec
	.xword	0x73bfc5df4cb5d904
	.xword	0x0634205848844354
	.xword	0x000d004031a59770
	.xword	0xb986176c1761a803
	.xword	0x9f00300b81bdb51e
	.xword	0xaa37bff163321fb6
	.xword	0x7007c09b165ef323
	.xword	0x8c20f5f4fab2a854
	.xword	0x069850277fc30ff7
	.xword	0x740b4d5f32e2e925
	.xword	0x50c85ebf1c61cc06
	.xword	0xff2638a8293d2557
	.xword	0xf8addf6cbaea19bb
	.xword	0x4c45ef8acbf7a1e9
	.xword	0x8250a64d6633c340
	.xword	0x538d7820654ba942
	.xword	0xea5e50190f67946b
	.xword	0x4b6e67e9ab4f7121
	.xword	0x0222a0696a4f980c
	.xword	0x0b3fde228aa10de3
	.xword	0xcf6f8a8bdca79e72
	.xword	0xe219e2df89c376c3
	.xword	0x831c35df38ec863e
	.xword	0xb5ee60841f978063
	.xword	0x1e0f2420cdf0f432
	.xword	0xb7a53ad6659eef85
	.xword	0xe98b06cefd5165ee
	.xword	0x5881c55c6d429fe9
	.xword	0x2c89c64edc99d86f
	.xword	0x6ef36c6534e792e5
	.xword	0xb6fcb72bea06980d
	.xword	0x2621bacdc4b37dbd
	.xword	0xe329e9ea646fe481
	.xword	0x478a12eae9facb5b
	.xword	0x21818a326464a2c9
	.xword	0x4d617c2b06d1ee13
	.xword	0xe9f9ba8e95217512
	.xword	0x87e71f8a2e58c4be
	.xword	0x66131b80d05ca1a9
	.xword	0x22c4940ed37959d9
	.xword	0xec6bb1cb5859a698
	.xword	0x5035caba6a20553f
	.xword	0xeb1ba106d57a6713
	.xword	0xbfa35b81e24b2d11
	.xword	0x7b028050ff5cdfd0
	.xword	0x022bf22c01a9ecab
	.xword	0x18b438d10fd89140
	.xword	0x050325dc718ef323
	.xword	0x321cf80cffcff0ea
	.xword	0xeb292b3d59c8f7b7
	.xword	0xa78bb515061393af
	.xword	0x5719c9c71444a0ca
	.xword	0x064de74bbd668920
	.xword	0x705a287dadd09946
	.xword	0x4f01ada99d92b2e1
	.xword	0xc295f506eb6170dd
	.xword	0xbba2b2acb979510f
	.xword	0x6f764ec1c3d7c131
	.xword	0x300f1d9b0717626a
	.xword	0x9efe33fd26f6c90a
	.xword	0xe3d99ebfaf27eca7
	.xword	0x1730099a2c763122
	.xword	0x23ce24cb786dff5e
	.xword	0x8808052c1cdd1690
	.xword	0x29024dba05e51838
	.xword	0x5474590250e56b70
	.xword	0x6a60588ba2329ad5
	.xword	0x0a8cf738c1650da5
	.xword	0x7714b356898aa313
	.xword	0x2b65c0ef0b77926d
	.xword	0xd94a0a71f1d4bb61
	.xword	0x07aa980e03220777
	.xword	0x46eb03c7d5e05df5
	.xword	0x54ad4593454eb904
	.xword	0x7d24dee87221d2c6
	.xword	0x8a9beb1deffd5cac
	.xword	0x236236a5224874e2
	.xword	0xfa7e0fcdb85f4216
	.xword	0xc6ca2409749a2965
	.xword	0x50d913863be25847
	.xword	0xb02b15150f6b0eb8
	.xword	0xdf4d4eec7662982b
	.xword	0xc94e2f57f5e0fb59
	.xword	0x7e7dbfe8f6085bbb
	.xword	0x691dc6e3785a31e6
	.xword	0x647f5cc921338112
	.xword	0x803a29f48c5fc8ff
	.xword	0x760433c52fea0a37
	.xword	0x964027b8e808f9da
	.xword	0xb4a056c82f19580a
	.xword	0x040018eb75dd66ef
	.xword	0x069c8d6405c9a43a
	.xword	0xf744ab37244ff225
	.xword	0x71ea39fa6172fbda
	.xword	0xff0f31fc0d87c025
	.xword	0x8d6548f03ce22351
	.xword	0xe6165c36a89163ee
	.xword	0xe001252d2275ffe3
	.xword	0x479f5ebfb1510ce3
	.xword	0xa6a33d6f38c9e1da
	.xword	0xcb418b13764ebd20
	.xword	0x0461a69a5c4a3482
	.xword	0xdb79578f2da2e866
	.xword	0x4dae92c135b49108
	.xword	0xee00c6de189abddb
	.xword	0x4e72556046ad3de6
	.xword	0x79363098a9e475b7
	.xword	0xce6cba6bc0efb79d
	.xword	0x6071dbebd1075b16
	.xword	0x95e5ae2f489afda1
	.xword	0x783af3ec654d0477
	.xword	0xba1fa25eb9989093
	.xword	0xc5adb4184f9774fb
	.xword	0xedf0bc20be0b4ee7
	.xword	0x521fafb3ce2e2b0b
	.xword	0x2a05c81e2099a4ce
	.xword	0xbb01591dc0ae85ca
	.xword	0x7871cbc96e9137de
	.xword	0x9ea529552d128aba
	.xword	0xbb9b190f873f1de7
	.xword	0x9c1035067a576706
	.xword	0x004a7aa40fdbd6a4
	.xword	0x952e4bfd4c59d073
	.xword	0x17021419d3ec4276
	.xword	0x622e582cfc52408b
	.xword	0x2f9e6d55320e192a
	.xword	0x1d7e7dca86178a4f
	.xword	0x2bd39eeeaef957bd
	.xword	0xc1d986bd1671e4b3
	.xword	0x039cbbfb20dea927
	.xword	0x402db50a4149dcb4
	.xword	0x37869d1a49cccf86
	.xword	0x4ba75474bd10e006
	.xword	0x4e83c607e15793d2
	.xword	0xf076f367cfaf609c
	.xword	0x516283791d8287bf
	.xword	0x95cc31402c27fbe8
	.xword	0xbaa62eee1bfa1336
	.xword	0x48fcbc33ec859d51
	.xword	0xc650f05fa6fa992e
	.xword	0x57c2309e98a3221e
	.xword	0xb9541ff3ae2fe12d
	.xword	0x9e3c4763525c015e
	.xword	0x37c63dcec61e4ccd
	.xword	0x6559420288ce58ce
	.xword	0x3953b371f528d0ed
	.xword	0x5fa80390d1187e81
	.xword	0xb998e580c91fabe0
	.xword	0x7d5ae12805db3fe8
	.xword	0xecf6798f191d337f
	.xword	0x93c6d96f9f3cd429
	.xword	0xffe9dcb4ce5fd6bf
	.xword	0xf0576516283893c2
	.xword	0xe9f4dd69f1243a3b
	.xword	0x760d1f56cfa32e04
	.xword	0xa610f1cba91c9da0
	.xword	0x6ad38bdf37eb174c
	.xword	0x2b55f0add587f3a2
	.xword	0x734f4a1feb3efb7f
	.xword	0xbe7ca300cd5832ee
	.xword	0x19718126f45b1c89
	.xword	0x6a5d2544ade58a31
	.xword	0x4cde22870d10a31d
	.xword	0x492a31d691ed54b6
	.xword	0x10fea26c5c3fd9f1
	.xword	0x0b803a7e9b756558
	.xword	0x90c83ec2c2f38a12
	.xword	0x19ce1e9f51ff1534
	.xword	0xcae88e22900fc2b1
	.xword	0x3935d32212961d92
	.xword	0xe4ec065352979e12
	.xword	0x80285cb13c5beec8
	.xword	0xf8367ba1f749eb89
	.xword	0x42e7d1119841d0fa
	.xword	0xf9381ec4e06eeda7
	.xword	0xf128172d65caad43
	.xword	0x3613bcd27b5927f0
	.xword	0x042184e75167c7d5
	.xword	0xa567f3ae2cbb6bb7
	.xword	0x06125b236ab34fdf
	.xword	0x282bd958cba05873
	.xword	0x2708da5c812fee62
	.xword	0x6e933a0f7c19c12c
	.xword	0x985f2ec9d72c8383
	.xword	0xfd469bf2d5b7f3b4
	.xword	0xb3c14081bb4cfd32
	.xword	0x19d7ce369aaa3ead
	.xword	0x1d0289df9d494795
	.xword	0x0809d6136b4530e3
	.xword	0x7eb74a29231c5773
	.xword	0xfd8bebaa73734e92
	.xword	0xa9e498e43c7c796c
	.xword	0xe211719f00dd3239
	.xword	0x1cbd45422af5b947
	.xword	0x4d6743a6ba3c35e3
	.xword	0xa2417b28e7306a45
	.xword	0x8f0aa1ab3637a656
	.xword	0x1130c03a0db0ec9d
	.xword	0xaad24fd6e643ea00
	.xword	0x8db5029a15b3528d
	.xword	0x5fc1fa1832a729e8
	.xword	0xc248e360ea4c432c
	.xword	0xc83e616816db5817
	.xword	0xd859fdea85ff4eed
	.xword	0x0cbd691c0e24f8f5
	.xword	0x7a4c57ef168ed02f
	.xword	0x2fb23f90812fc630
	.xword	0x846b912ec358ba34
	.xword	0xd07cb9b63865813f
	.xword	0x9169e891304da9f6
	.xword	0x13d55bbddf1d63c9
	.xword	0x9af170ef8574de60
	.xword	0x458d716527c355cb
	.xword	0x45991970a21af274
	.xword	0x1ca984f54d975a38
	.xword	0x4efdbc4e4381427b
	.xword	0xa4c529f54ac111fc
	.align 0x2000
	.data
data_start_1:

	.xword	0xe6a5284fbc6ed625
	.xword	0x2eb5177d74a00bcd
	.xword	0x42ddb6a1ef386565
	.xword	0xe406488444f0ab99
	.xword	0x8114d41497480715
	.xword	0x075a1952e7a61255
	.xword	0x4880be15a8eaa100
	.xword	0xff893ef3d24b82ef
	.xword	0xf6da2018c3cfea27
	.xword	0x41be29715d9b54d3
	.xword	0xfb6572117893a74f
	.xword	0x165ff3a1faaf940d
	.xword	0x63e9037612cd15de
	.xword	0xb4e74e09ed811508
	.xword	0x9b342d730ccb431b
	.xword	0x5ae0ec4066e362f5
	.xword	0x8c5bc29f52441a34
	.xword	0x36406b19b0e4a070
	.xword	0x512fdd1035289408
	.xword	0xba146e6146ba601d
	.xword	0x10eb55dc2ad60b62
	.xword	0x2c9bd204b651f8c6
	.xword	0x10961a21f71bc3c3
	.xword	0xdcea7c42a0a827e9
	.xword	0xad1922dc3710fd7d
	.xword	0x55861cc9a6a53f32
	.xword	0x2c11e5a7ddc1d816
	.xword	0xf8f784004f0486cc
	.xword	0xe8c56d3d87dc1c0a
	.xword	0xec736680a759bfec
	.xword	0x67ebac65222eb644
	.xword	0x2a06e43460c12caf
	.xword	0xd2032387240627a1
	.xword	0xbf3c88a6f683228a
	.xword	0x742d736c8c9a91d5
	.xword	0xf8b6a1e34a724418
	.xword	0xbcab99275d884a72
	.xword	0x6607486e970a22c0
	.xword	0x21a8d37ca2ab6703
	.xword	0x18bbb2e77810f461
	.xword	0x32c8015e09c47f80
	.xword	0x295e75809113f5d8
	.xword	0x6ead2e6ca41680d1
	.xword	0x18f0b8b7d4067860
	.xword	0x4781387c245abc63
	.xword	0xed5fc16c6a5514d6
	.xword	0x32bf3d47006cba92
	.xword	0x3cfb7fa053ab0ca3
	.xword	0xaa3dafd760a945bd
	.xword	0xa4d99a82e749da26
	.xword	0x41999978caae57ef
	.xword	0x9c7ca34fc474a8f3
	.xword	0x452ffdcdb7fea488
	.xword	0xb56d039adf35c0a9
	.xword	0xe05896ad0464ee94
	.xword	0xd981cca712a255e3
	.xword	0xf6430a07333c5ae0
	.xword	0x2621d82165442f32
	.xword	0xe131ceee1c8ef1de
	.xword	0x890e37f0c786f2d2
	.xword	0x488efe62834a9b9b
	.xword	0xad43903cb2331219
	.xword	0x88c3b066d9e57006
	.xword	0xa44994d59b118fba
	.xword	0x302bff2b9f3bc2b3
	.xword	0x5dfe0ddf265edba7
	.xword	0x1bab542ea9c8cfe5
	.xword	0xe63230a9e05a1930
	.xword	0xdfcec21b6267954d
	.xword	0x3f91d676fcb452ea
	.xword	0x5baaf1d31719b2c2
	.xword	0x6ed669c60f1f4e43
	.xword	0x93c58625a3a05b5f
	.xword	0x8375a035ddd191b7
	.xword	0x227fe6b6e8fa6de8
	.xword	0xb8144705ada93e8e
	.xword	0xf2f94ccb654698e7
	.xword	0x579a755c3ed0cbb6
	.xword	0x27071f34d930c388
	.xword	0x8d12fef69a52d4c6
	.xword	0x9fc0f372b1101940
	.xword	0x0a589b6330e757aa
	.xword	0x30d1ac8c98e03aa7
	.xword	0x73bff6dc8c1e64d9
	.xword	0xd12ab6f06ca0cf2b
	.xword	0xa711e61f02de0008
	.xword	0xbf645df2c0095ca3
	.xword	0x18a78b4be77e77d4
	.xword	0x0537c7a79267543c
	.xword	0x3287012f6a5fb365
	.xword	0x09839f013f94daf3
	.xword	0x71259f3999279486
	.xword	0x38b68d22dfbb090f
	.xword	0x3cc0bc541858bc65
	.xword	0x1d4951f65a83db5f
	.xword	0x7449e8fe52aa55d4
	.xword	0x70dbdc941c85d3dc
	.xword	0x515f4e3f7dd5d21b
	.xword	0x4b54cc4a458c1830
	.xword	0xd7e7766196a629be
	.xword	0xfa770f429d6a9f01
	.xword	0xdcab353db1b1f4f3
	.xword	0x77017387f9585dfa
	.xword	0xb7a40edc7172fd46
	.xword	0x3d329054d3faa57d
	.xword	0xd30a87018d5aac5e
	.xword	0x21099cc094ece803
	.xword	0xf3dce8a9a73f6030
	.xword	0x40408439c7831982
	.xword	0xea50bb26fa8febad
	.xword	0x3c320e318a185e0b
	.xword	0x4646ea2ef75a52f5
	.xword	0xd11f5953e99bd3f8
	.xword	0x013c8faf8ebc21e3
	.xword	0x26879bb8d0b341aa
	.xword	0xe8be4c481bc9b78b
	.xword	0xf9e809ecf1af23b5
	.xword	0x719e52bd98222b4f
	.xword	0xceca892cc6c21912
	.xword	0xabed4e4cb2b45414
	.xword	0x5073a8f00199ead4
	.xword	0xfc7188ec53b2e232
	.xword	0xcf665c0ee63f82f3
	.xword	0x6d5fed71c961e72c
	.xword	0x0b3b2cb45280eb5e
	.xword	0x5aa87404af635aea
	.xword	0xe53577d457314f40
	.xword	0x1ac54b1fd0f0a334
	.xword	0x994254425e36f97c
	.xword	0x0239b9774bd3336c
	.xword	0xfd3d5d0dc3027ab7
	.xword	0x22c50d0652a6f4f6
	.xword	0xd0ca345bf5b68911
	.xword	0x4af385d980a95f08
	.xword	0xf0424123efbfbd2c
	.xword	0xd601ce315c41181c
	.xword	0x36ddcf81181b7ed5
	.xword	0xd7481f8bfd9ed340
	.xword	0xc10ec749925064c1
	.xword	0xf354d9190996d6ba
	.xword	0x6330393f3f47d552
	.xword	0xcc37af32caddbdce
	.xword	0x16b8f5f2a4a82f19
	.xword	0x8c3344fab6e09457
	.xword	0x1a15e7650e7ae3fe
	.xword	0x3ca9546f5af058c9
	.xword	0x97813ece10001108
	.xword	0xab0855e2e1444312
	.xword	0xb8ad7fd70af8c16a
	.xword	0xb578cf974d759d46
	.xword	0x898b06e807897d35
	.xword	0xc092d85ac115df9d
	.xword	0xee6c1112e1b11c39
	.xword	0x8e1d2cf619c5b126
	.xword	0xd3c708d3b2c3e129
	.xword	0x578c9ff720917c40
	.xword	0xcb7612c593e7ba98
	.xword	0xa3fe8ead7c3395c9
	.xword	0x41ebc7e06d69e22b
	.xword	0x33f9db9389115fb9
	.xword	0x519617e2c0970a21
	.xword	0x71950210ae39bb51
	.xword	0x5bd0b237a1604fa3
	.xword	0xb8ece200049fa347
	.xword	0x212572e2c4967de5
	.xword	0xb294fbbc89709660
	.xword	0x5df8b241a0c67fc3
	.xword	0xf6684843fb0c455e
	.xword	0x88218c81f391af52
	.xword	0x3f4a5e9d29115aa8
	.xword	0xf0e977f182a5096d
	.xword	0xb30b85a1c142c4bb
	.xword	0x5081da7efd132901
	.xword	0xa1fe95c48f5e3b90
	.xword	0x634aec4a3f1a9c68
	.xword	0xbacb4ccbf7755934
	.xword	0xe088f87d95bf6108
	.xword	0x43de06d3e335ca07
	.xword	0x5d17ba0dead90db8
	.xword	0xe51d55d0ab4843ab
	.xword	0x04a048401f640471
	.xword	0x9388abd1dc9d7fde
	.xword	0x6f51c9a064aa43a2
	.xword	0x50ec34d60b346ae0
	.xword	0x434043296a1e0ba9
	.xword	0x9e3a08825c9fffac
	.xword	0x3ef72f2b41412079
	.xword	0x42c94b933d490e5a
	.xword	0x1fb75c9d752bbc04
	.xword	0x319dee2daaaa33f5
	.xword	0x1e3afa0c07fcad46
	.xword	0x25d2c9b46dd76620
	.xword	0x6f08820dc1b2d170
	.xword	0x9e33b1706f830c94
	.xword	0xed7b90e0ad5b2125
	.xword	0xf8590c6b27a40afa
	.xword	0x270227fb30bffd23
	.xword	0x7366e57c5dc4e2ed
	.xword	0xc2635574a3cdd8b2
	.xword	0x88f781895ebd7c3c
	.xword	0x6f63300c24a72d6e
	.xword	0xd9a9820f1948d8f0
	.xword	0x615646295ea0a65f
	.xword	0x680d12effb8e18aa
	.xword	0x5c8d826954452c7d
	.xword	0x628ed2ad1bb84587
	.xword	0xbf6b1959fc7dcd6a
	.xword	0x6cfb292b6a31df4c
	.xword	0xee80fbce99e58d3a
	.xword	0x1c0bbbecc6072f17
	.xword	0x80377006415c4ef5
	.xword	0x41984611c9b5df6d
	.xword	0xa23144e8fe1b35a2
	.xword	0xe95a694d850b5a4b
	.xword	0xa232b3eb01e8bb6e
	.xword	0xc313ed3a737fcb35
	.xword	0x216a735993b6074a
	.xword	0xbb7b7be99bfe0998
	.xword	0xe1838102f1abfce4
	.xword	0x90a7c17da4db297b
	.xword	0x990c6f1f733c2837
	.xword	0x1b9a635749954a67
	.xword	0xef01715d620c3026
	.xword	0x89ff14f5f41fce84
	.xword	0xa779df5aff407de9
	.xword	0xd4502ef31a39060a
	.xword	0xfbe319aa78fa09de
	.xword	0xc7c790fccd807433
	.xword	0xea4b74d926033a3a
	.xword	0x4edabf163d8bbebd
	.xword	0xcc87f76cf88401e4
	.xword	0xc93e148eb63b3ab9
	.xword	0xa438fd7884a47755
	.xword	0x0d1aaf312434d890
	.xword	0xa7085108a0f5ceed
	.xword	0xdd316d1ef2af3fd2
	.xword	0x49de2d952829fd6b
	.xword	0xb68274efd9f305be
	.xword	0x795be6e576d36e0c
	.xword	0x4b23880f7901b5e6
	.xword	0x2a6ae0228336d9a2
	.xword	0x141453fe56ab7686
	.xword	0x79073bf87af65a7a
	.xword	0x0c8317e7bf39f23e
	.xword	0x3eeb04b90e762762
	.xword	0x0ae57725f4cefe79
	.xword	0xb1f243dddd029618
	.xword	0xa92189a86f490609
	.xword	0x9dfd674d9c166057
	.xword	0x86eea9474649b934
	.xword	0xdb21a9e83e14c8ba
	.xword	0xf7ca31c795c0a79a
	.xword	0xeed131695a370d24
	.xword	0x820d77a100f0406b
	.xword	0xb3db837fb380f13a
	.xword	0x621d1d1253f0acb6
	.align 0x4000
	.data
data_start_2:

	.xword	0x4bc2cc178ce73a36
	.xword	0x746f6304836384c3
	.xword	0xc48651f5e774c939
	.xword	0x0b3d5b1f6ef1778c
	.xword	0x2204eebee63670d2
	.xword	0x313ee644b861ab1c
	.xword	0x96fec01b80859c56
	.xword	0xa0780335a04db6f1
	.xword	0x5ea198a665cac5bd
	.xword	0x372fb67d4fa758d1
	.xword	0x61e9c27b4b92ca78
	.xword	0xf7e3df2349b3e81d
	.xword	0x8a9352ed3e4ed40f
	.xword	0x1ff9a8c7e2a55eb7
	.xword	0x506e546b6833cb6e
	.xword	0xdc224f75dd9328d3
	.xword	0x39133b66c6cc8cac
	.xword	0x7422a34f98b84601
	.xword	0xbe2781916e2d11a0
	.xword	0x70d3c6dcfb3e8316
	.xword	0x889f03290c06a523
	.xword	0x7edd160ef2198d6d
	.xword	0x3be806de4621b66b
	.xword	0xb5da2e3dfc86ecfc
	.xword	0xf8064fc3657b39e8
	.xword	0x4192a21126e9577e
	.xword	0x430492fb0f5d252a
	.xword	0x7c2356c5f89e1e52
	.xword	0xeeaf4729795a6546
	.xword	0x66db394b0534c1e9
	.xword	0x3548f6dc47e75f96
	.xword	0x034811eba153d182
	.xword	0xef1293bb7ba3cfee
	.xword	0xf4de4099758bbca5
	.xword	0xf8a2393952657848
	.xword	0x3545b8e6033aa8a2
	.xword	0x705d06c2b84e1fe1
	.xword	0xf78e2d7e139c1240
	.xword	0x67952870998599f1
	.xword	0x3cb79b2ac6867b82
	.xword	0x0b32f466d7965201
	.xword	0x475c97ecd79ce34b
	.xword	0xe03e55d3e2cae475
	.xword	0xe8ae8060917e89ff
	.xword	0xc61dfaedd258949b
	.xword	0x5efb684a795c299c
	.xword	0xa4c432dc2de014b1
	.xword	0x32bae7a128c9f990
	.xword	0xa09b8f850672b1a8
	.xword	0x023f0c95ad960664
	.xword	0x14827358e9ba2045
	.xword	0xcc47a532935eff69
	.xword	0x1ee9c2ad8fa26ca9
	.xword	0xa752faa21c332d14
	.xword	0x46871d4ce18b639e
	.xword	0xce14444a1eb6a67d
	.xword	0x513187a87b32baea
	.xword	0x6a8d43e9419c5823
	.xword	0xf335d8b0c15c17e0
	.xword	0x6f839b3f816b0d50
	.xword	0x43a001ad3d41f85d
	.xword	0x92dabaf17188ddd0
	.xword	0xeb19e221472eb0c9
	.xword	0x9f37b2cb2881d3ec
	.xword	0xf28ec089229857f2
	.xword	0xeddc623b1636d8cf
	.xword	0xda880b06eab569dc
	.xword	0x5c800c1ca27429cd
	.xword	0x6245f8ef586f363b
	.xword	0x7310c5341b5561f2
	.xword	0x0d75fbf138a70df0
	.xword	0x71316a42594736d2
	.xword	0xe7ca9db641a2e45d
	.xword	0x4d1d6997b3c84e7f
	.xword	0x8d308ada7374793c
	.xword	0xf6c245e7778291df
	.xword	0xa444fbe7fdcb6eb7
	.xword	0x44bf70f828420a0e
	.xword	0x1b7a3f3666cd1f3c
	.xword	0x7e4f97ce6580d683
	.xword	0x0731c562cba3982c
	.xword	0x36af4a52c76dae89
	.xword	0xa7e37d9db6e897da
	.xword	0xe8469bfa39cd854e
	.xword	0xebc1cbacb70e0388
	.xword	0xf574653759a7131c
	.xword	0x9f02b354b08597fc
	.xword	0x2b6a999c39d38040
	.xword	0xfb2b57fe731c53ee
	.xword	0x8c15e9d20a749b5d
	.xword	0x3390ee913b38b141
	.xword	0x9ae268751a2093fe
	.xword	0xb3de843ce035d67d
	.xword	0x1702d958e2e136eb
	.xword	0x2393fcbd9421fe1c
	.xword	0xd04842c834958041
	.xword	0x25895780d18f5dd8
	.xword	0x956fb41ea3089aba
	.xword	0x6332e3c2c88b9862
	.xword	0x96d093925af1ba15
	.xword	0x78b7211261b61780
	.xword	0xef4378169c38191b
	.xword	0xa9856c19da63239c
	.xword	0x1168b8f24589c2a9
	.xword	0x829487e7c8416398
	.xword	0x8412193eda96e2d0
	.xword	0xc6ee5ff9cf33b7d4
	.xword	0x98598853f6209fc4
	.xword	0x00ff2626d0067d4a
	.xword	0x2e2105b29bd604de
	.xword	0x8f644453cf518176
	.xword	0xd445d3360a7d659e
	.xword	0x7298c5bf3e06b044
	.xword	0xb63670b1cd4e074c
	.xword	0xe34763fefd3a5769
	.xword	0x598669b512d44ab4
	.xword	0x3f2f9952b4fd7325
	.xword	0x907193a5791e34ec
	.xword	0xaa24b4b084e634ab
	.xword	0xaf7b09c4116ead04
	.xword	0x08cdc5d46a913a68
	.xword	0x7a9296f970499a1e
	.xword	0x47101b8d20aa4f6d
	.xword	0x9a98f17106489822
	.xword	0xec76d08b2a46b6ac
	.xword	0xfaab9b4408a38273
	.xword	0xd4fbc76df4565168
	.xword	0x16419d7238af5c98
	.xword	0x6dcf2de79c4101f0
	.xword	0x8730255258ba3f87
	.xword	0xfd681babd1cbadf1
	.xword	0x383ab0f3788dc40a
	.xword	0x79cee7093e38c7b5
	.xword	0xd99d1c6d43462380
	.xword	0x2a06230f6d88dd93
	.xword	0x02deea3110417a54
	.xword	0x9927f3f3f498a9af
	.xword	0x4ad8b76e55e57910
	.xword	0x72b99f15a7293a99
	.xword	0xd5266ef1e9d0e77e
	.xword	0xc11a2c3e7f64816d
	.xword	0x0741058d7d2d7c38
	.xword	0x37c0965a52cd51d6
	.xword	0x75f09efbf99ca6cc
	.xword	0x171aa51f0ec5532a
	.xword	0x451ce3ed8e5d0746
	.xword	0xd373fa6494a1c1aa
	.xword	0x048ef4bf2d9ec009
	.xword	0x98c12b01e6ea98e1
	.xword	0x1fb2fe699f80215a
	.xword	0x036792c2ece468ec
	.xword	0x63cb3197c2ee145d
	.xword	0x812dce63b3fcdd6e
	.xword	0xf4a6c1efe98130f9
	.xword	0x73a2b3a507446be8
	.xword	0x9bf27d14aa3d649d
	.xword	0xba34e907d5a3ba98
	.xword	0xfea6e4153ad8fc90
	.xword	0x795fc779e185abb4
	.xword	0x44a02fd44aabc9dd
	.xword	0xe71a1269853cf9c7
	.xword	0x1c44524f6958f68c
	.xword	0x629aa45cb4b4b85e
	.xword	0x6a21895e30d35c6b
	.xword	0x2a81ac76262a332c
	.xword	0x871386bc4ba26af5
	.xword	0xa32daad251ed59da
	.xword	0xee25d5daeb751224
	.xword	0xde0163a52e1312e2
	.xword	0x233c6a396dd83082
	.xword	0xd6df16a3ed14a538
	.xword	0x4d7d53c4d9e7f673
	.xword	0xdabb7b1b1159a3bb
	.xword	0x2613f07d7b81e5c6
	.xword	0x29d63c7788dddaa9
	.xword	0x5f3569625c8c7f74
	.xword	0x79141e38dc9a1a54
	.xword	0x806bc08cf1ea78dd
	.xword	0x51786569ce195cd5
	.xword	0xaf6c680bf10667eb
	.xword	0x04b56bfd3e2f9a47
	.xword	0xa1d4fc7475b9b30d
	.xword	0xfb232f8b55fef89f
	.xword	0x5e4d8237ce65cdf7
	.xword	0x13f578b76d412564
	.xword	0x18d857f2128d25dd
	.xword	0xcf25581138e9a124
	.xword	0x1c3505cf11cf76a6
	.xword	0xf924fffa98aebaed
	.xword	0xd10196e4f093ee67
	.xword	0x985ab7072d4668b2
	.xword	0x6aa26a59ff24d4a0
	.xword	0x3685301c7e1b5fdd
	.xword	0x3d368ad89886eeae
	.xword	0xc18f7a4a983b8096
	.xword	0x392a6e7f1c49610c
	.xword	0x199e2308498f6e38
	.xword	0xd34bcdb9fa4fb5e2
	.xword	0x5adc5bd9954957c2
	.xword	0xff8636dedd4dda34
	.xword	0x217c15ac39671541
	.xword	0xa9453a1131808038
	.xword	0x66192dd098c3e0be
	.xword	0x5ec2e6ef41dc8f0d
	.xword	0x574cc18a87e13db9
	.xword	0x4f2ad0e5849f4130
	.xword	0x9a3c658734082bb0
	.xword	0x93915f2d7c0ab161
	.xword	0x8ee18a2ebe8da241
	.xword	0x123b4f3ae793e5a7
	.xword	0xbfa6e40919c9b77f
	.xword	0x23dfb9b62da560e5
	.xword	0x7621c773e6b6fb90
	.xword	0x72000f317cac0cbf
	.xword	0x6dce0220c8e491cc
	.xword	0x64faa5fd84219d75
	.xword	0xc1de69aea78a66aa
	.xword	0x92c26c86d6ba0d63
	.xword	0xe11601769ee1b5f0
	.xword	0x8c484526abdc099c
	.xword	0x4f1db3a89ef5a7c2
	.xword	0x877fed594aff994a
	.xword	0xc9c82beb65b06948
	.xword	0x84b91a9aa83f22a4
	.xword	0xa2fb111cff193a97
	.xword	0x2085c8031bfd4f59
	.xword	0x24edcbd9dd19da50
	.xword	0x95e9432cedb0b3e3
	.xword	0x52785b4254cc418e
	.xword	0x43e5a6f343196bb0
	.xword	0x49190b64b6dc10a4
	.xword	0x6edbf863c342c015
	.xword	0xf8eca6e2a6c96321
	.xword	0xd70ff9347daa7741
	.xword	0xcd5e67377883c0ec
	.xword	0x96cccb86c6b58478
	.xword	0x70146b923e58bb4c
	.xword	0xc54573bde928471e
	.xword	0x1370de4bb1ce6ad7
	.xword	0x7b57171dd40a0962
	.xword	0x1bd41d1af9e3a88a
	.xword	0x52f2b3b8b5959ae5
	.xword	0xe4b28face5578d6d
	.xword	0xb2f497e44edcd9a7
	.xword	0x287c46b77930c2a1
	.xword	0xf36f2c2d3e150797
	.xword	0xd6a1d9e61125311a
	.xword	0x206abb5bbf5ac44c
	.xword	0x866d4bb84cde2f83
	.xword	0xc4b77e30c3878e0c
	.xword	0x4dc64eba1ad8a500
	.xword	0x4963d3e060c0870c
	.xword	0x3d3105d8c856d455
	.xword	0x2c8982ffe1828344
	.xword	0xd1a7959b4fd60066
	.xword	0xa0e21990d598632e
	.align 0x8000
	.data
data_start_3:

	.xword	0xb2844d2b8dc30a68
	.xword	0xb4edfbcb568746ca
	.xword	0xddaad00308d658e2
	.xword	0xbe7dee68bfcfb2a1
	.xword	0x61c308524434c72c
	.xword	0x9f49209076637613
	.xword	0xa6bcdd9348186679
	.xword	0x2b3568b0a72f58af
	.xword	0x11cb094387cbb525
	.xword	0x5df1bde606094c55
	.xword	0x61e0b849f6729334
	.xword	0xfa442f37b5195049
	.xword	0xbca2212e73ca669d
	.xword	0x57862202d89f0e6a
	.xword	0xff42c0b4847bcccf
	.xword	0xaa3544c8f939c136
	.xword	0x19f68cbd8b4697a1
	.xword	0xfd8892a84bfa5a5b
	.xword	0x889bd00468ec16dc
	.xword	0xcb7146b39ed162a0
	.xword	0xc4d068ed0ef11f48
	.xword	0x0840eb9e5e72988a
	.xword	0x79af4a15ab716324
	.xword	0x2ff7bf528c16ef09
	.xword	0x68d3e1da507f11d2
	.xword	0x84bfbb62d551885b
	.xword	0x00b02e2f6c0ac752
	.xword	0xfa91909ad809227c
	.xword	0x7a1474f54359d65d
	.xword	0xb4741a82c1e86133
	.xword	0x2e1b8aafe0e6231e
	.xword	0x7ce067327146c57d
	.xword	0x8899e7289719e91d
	.xword	0x7e9ee31f7e858f84
	.xword	0xaabe074b90aca3c4
	.xword	0x7c5f3248b1bd53f5
	.xword	0xdff2ea0d379536ac
	.xword	0x0758172ec82d2870
	.xword	0x03aaee13712a2ff2
	.xword	0xe8c1942703fc0da9
	.xword	0xbc6952202d4868cb
	.xword	0xe10409d6ccff0b15
	.xword	0xc766a7a32269cc93
	.xword	0xf89f0dd38e298e94
	.xword	0xbface33a9b806a38
	.xword	0x530477d514e45e1b
	.xword	0x4b8ce060ab4f0d50
	.xword	0x38d7787558ef4e17
	.xword	0x22dcb7f40bc680e7
	.xword	0x2975f2a1b2ae8bf1
	.xword	0xdcd9525e4c71611b
	.xword	0xd2e42aa08cff03b7
	.xword	0xae300496866aa1d1
	.xword	0x5ae530a3285234da
	.xword	0x1dcbb4aadbe19dfb
	.xword	0x90ff0a7af56557b2
	.xword	0xa85449d4800f1640
	.xword	0x172ccebd64019cbd
	.xword	0xee753c53e7148f24
	.xword	0x3e2bbfc4a1cb2072
	.xword	0x8ae5ba13dcf1aca2
	.xword	0xc6f62d46735ccc43
	.xword	0xecbc54ba2b49eeed
	.xword	0x4c979576f3747fdb
	.xword	0xfd12cedd5f23420b
	.xword	0x390366dbdfec6707
	.xword	0xb86c260f8bbcb2fe
	.xword	0x5b16ca9841efe77d
	.xword	0x22501ad939924afa
	.xword	0x1271b3e21665009b
	.xword	0xec18ff91ec64bbe3
	.xword	0x7355be3a7280f4af
	.xword	0x540d841fe25a171a
	.xword	0x9cd0a75ea76a17d4
	.xword	0x820bcbca06648286
	.xword	0xbf60a08b21706551
	.xword	0x3707c3346fd14911
	.xword	0x782b02232336c0ee
	.xword	0x68e3df5946615309
	.xword	0x672b3883d4a7c199
	.xword	0xb22c95b02bb73d07
	.xword	0xd9d68bbb202aaec3
	.xword	0x49df60d8aa8eb80a
	.xword	0xda51a27ee1d99287
	.xword	0x202ac677b90068df
	.xword	0xe1d1a8706ba0f7e7
	.xword	0x94e587701574a25a
	.xword	0x72b692da2eecee4b
	.xword	0x12b36e9e9da51582
	.xword	0x79eed4d4cb738170
	.xword	0xfe8a24898325e055
	.xword	0xd0415b68a9bc393b
	.xword	0xaaa1749454ac8ead
	.xword	0x150837b27d823a12
	.xword	0x0208c0b4f485b44b
	.xword	0xcb6af4ee85ced5cd
	.xword	0x05626d36880cbcee
	.xword	0xb0767f21edbf2ea1
	.xword	0x5a9f6e3f5327b1a5
	.xword	0x05645c9c10d4eaf6
	.xword	0x023bc42414c3b1cb
	.xword	0x4e795a37eda26964
	.xword	0x461008907bda233e
	.xword	0xa902e31dce89629d
	.xword	0x0fd2bac65edb15bb
	.xword	0x655d58288a7b6bc4
	.xword	0x0e7b130fd533b3c9
	.xword	0x3d3bf643042606ba
	.xword	0x6c717d6f43156858
	.xword	0x95fce1cf9a04e303
	.xword	0xe03c217345224c5d
	.xword	0x03650c0a60c68765
	.xword	0x743f1185a75a3bd2
	.xword	0x225c54a02226c5af
	.xword	0x5c5035d83166b915
	.xword	0x1a4f243931af7fd1
	.xword	0xf32b0353c44b368c
	.xword	0xf008ad1c1c8d7491
	.xword	0x4c97ea40e05001cd
	.xword	0xad639e3fa93ed4c0
	.xword	0xa7cac4dce5810b6a
	.xword	0xfc07fc8d22341540
	.xword	0xb6700f76c112689d
	.xword	0x7d24574fad51fe5d
	.xword	0xe2a3097c333d0e97
	.xword	0xaa511d99997ef4c8
	.xword	0x49d71653f7157a22
	.xword	0x3039e67740ee43dd
	.xword	0xfec28ba9d71d9da3
	.xword	0xee0365756dc39658
	.xword	0x273883c8776a6c54
	.xword	0xd2eaafcc91656105
	.xword	0x6f83a5f02206cc2b
	.xword	0x05229b9546d39ee5
	.xword	0x3fa1d186bbf22086
	.xword	0x80c3a697367b5c46
	.xword	0x94a7f5d9e5e554c9
	.xword	0x22ab85532788271f
	.xword	0xc3b340a604a6125e
	.xword	0xf6fdc2db9c966e8b
	.xword	0xdfe26acb89c64b5f
	.xword	0x02d83f17a0664eab
	.xword	0xc27809f1b1474990
	.xword	0xb2ee3572c2211aa5
	.xword	0x12729d92819335b8
	.xword	0x2c81681e55760186
	.xword	0x3a05fa0de68061fa
	.xword	0xede3d36da62214c6
	.xword	0xc48110b56c6d2df7
	.xword	0xad187bd6bff093f3
	.xword	0x53c68b32f44a6c78
	.xword	0x9c9a274b4eb33331
	.xword	0x853e8604ea3dc1e3
	.xword	0xd80aabb5cbd3bc78
	.xword	0x87cd652c814e9302
	.xword	0x920d55e710edb079
	.xword	0x81be92986e001cf7
	.xword	0xdaa803b398e0043f
	.xword	0xad4448c297de8846
	.xword	0x0a25577e9b9ceb7e
	.xword	0xeac153dfc4f58e3c
	.xword	0x51eb0ada16f65be8
	.xword	0xc605f8e5f2e4a28e
	.xword	0x86ba9bcd28fa5ec1
	.xword	0x03763f527d558fb1
	.xword	0x652fdf4d425ca523
	.xword	0x0e25c0fe25b17595
	.xword	0x578811a7f688f6e5
	.xword	0x6c76f0baf61b36f6
	.xword	0xba697ba6f64450be
	.xword	0xc8b19afee326b1a5
	.xword	0xfdb932a1c6e10b47
	.xword	0x3fa3f85aaa70567b
	.xword	0x58c1719b9f1b3cab
	.xword	0x285dd83d2db96a10
	.xword	0xd508b6dd887680c5
	.xword	0x0d20b3b4ced90608
	.xword	0x1d1aa36a982f521c
	.xword	0x021eb8118f1a7ffb
	.xword	0x76ef02a9188c5d81
	.xword	0x6d59a35d30f104fb
	.xword	0x7e438221be162e48
	.xword	0x2ca1b98045ce12ed
	.xword	0x337a4012c6f0f625
	.xword	0x188f3c38dc0f0fba
	.xword	0xd8674c29b8f17b1f
	.xword	0x0bddcade1067441a
	.xword	0xd13bbdd3360b6f2a
	.xword	0xc093b67c9cfb1620
	.xword	0xc193b2f34de78559
	.xword	0x953e1a6ca3e7444a
	.xword	0x1bd0998e6bd86f0d
	.xword	0xd84a31165a966f45
	.xword	0xe23c17bd942b3fa8
	.xword	0x8b2b784d8ad61f60
	.xword	0xb9f6823176564d7f
	.xword	0xba925bf6cebf631f
	.xword	0x7c55b56df6f4b34c
	.xword	0x1e90e5d05fea403a
	.xword	0x59f965c8083f6eba
	.xword	0x69e264949daa57d4
	.xword	0x6540805b01d52e40
	.xword	0x265f6806ecbeaa12
	.xword	0xffd63b2004616ccb
	.xword	0x074eb653a48285a9
	.xword	0x2630b53729ed2524
	.xword	0x2f62a377fb766d7d
	.xword	0x72b97cd507025ac3
	.xword	0x8d55512f9bf932fc
	.xword	0xb772a8268594e600
	.xword	0x0160850deac50d32
	.xword	0x8b2a8297baf43ca9
	.xword	0x5afe140ee697b375
	.xword	0x540f5b70e0ce405c
	.xword	0x00e42f5fb06fb20b
	.xword	0xa4cb4306df36e6c2
	.xword	0x5546a5f8b599a8cf
	.xword	0x768dee4dde633686
	.xword	0x45a4fad245116b10
	.xword	0x97400330f7f666f5
	.xword	0xb2c5f71fff6127cd
	.xword	0x92cadfaed5de078c
	.xword	0xb42665b5a504f459
	.xword	0x4b428e76a4491746
	.xword	0xa33f60d776e96d6d
	.xword	0xff2406776ccf07a7
	.xword	0xc4f6b8456256272f
	.xword	0x418e19fc41e034fe
	.xword	0xdb5e416dd874ec41
	.xword	0xe2c62686ce30f273
	.xword	0x0837af6b3abb069d
	.xword	0x0e54c2e2a75f3ec6
	.xword	0xe8570682562df23c
	.xword	0x07055d8f89e81694
	.xword	0x57bada82feb5b0b7
	.xword	0x75c90a0677cb7e91
	.xword	0xe30b136f2067a8bf
	.xword	0x445da57405f521e0
	.xword	0x199e900611391b66
	.xword	0xe1070814c8699926
	.xword	0xbd2e2f7b953f7aee
	.xword	0xed1477221713c398
	.xword	0x3e72e20aa02c2539
	.xword	0xd4d62fd88f6f59fc
	.xword	0x05742702fffe14d0
	.xword	0x6618e9d5e41ab318
	.xword	0xf903c496ff7391fd
	.xword	0x4eb7163fdc9a3d30
	.xword	0xe3c19bbca260d080
	.xword	0x9f7b92be2fc4bb5e
	.xword	0x91d56c9fee1188b2
	.xword	0x1ac6d06aee5e2c2c
	.xword	0x8717e324f7df64f4
	.xword	0x632cb42a6b803275
	.xword	0x35e711d02db7aafd
	.xword	0x35ade261f13ef1ee
	.align 0x10000
	.data
data_start_4:

	.xword	0x80c31841d3380092
	.xword	0xd864e5d8705988ba
	.xword	0x1c5c82b53d17801e
	.xword	0xb58ef1db1029055d
	.xword	0x13a02dacc220fe67
	.xword	0xa89313870e1ffcd9
	.xword	0x1833d580fd945d29
	.xword	0xe439f0f1aa8ddde0
	.xword	0x3e268caf94418106
	.xword	0xf0169807adffd5aa
	.xword	0xdef04b899b0ff916
	.xword	0xf5df3d022a1746c5
	.xword	0x5edee193fce3dcab
	.xword	0xf9f4def7e21b0c97
	.xword	0x2ffa4ae661e929dd
	.xword	0xa6e2ef105f08f18a
	.xword	0x46c565f107de8982
	.xword	0xf2f264d40190a741
	.xword	0xd4dfb342eb898961
	.xword	0x33d68b3edfcae040
	.xword	0xfe5466dcc83f783b
	.xword	0xfca0cb85c05eeeb6
	.xword	0xedbd9aa8e827262e
	.xword	0xfc1d90db9d2bf258
	.xword	0xf92fd2eacb5c73ec
	.xword	0x11f0463c26dfbca8
	.xword	0x6c8afb50046f7063
	.xword	0xfdb652c7b6d90b70
	.xword	0xfed8c5a4ae878ea1
	.xword	0x6897740c238168d8
	.xword	0x26f7287358017af1
	.xword	0x70ab500888ec174a
	.xword	0x3a057d7acb0d1f0e
	.xword	0xc5bfc50a1662cd49
	.xword	0xb6b61619cc674513
	.xword	0xa25ebeaf2cedb67b
	.xword	0x74ee7f3c17ebaf1f
	.xword	0x770fd8c72d52af97
	.xword	0xe578bb3cdbc7fca4
	.xword	0x06e762fea13ad20d
	.xword	0x2dae4a2a06a331c7
	.xword	0xa35345da31265fc2
	.xword	0x4f53c229ccc4a285
	.xword	0x892b8f731e801282
	.xword	0xa5947e2aca8fda79
	.xword	0x3f43bfc8d47447eb
	.xword	0x403fd287d235040a
	.xword	0x4987a81014614ccc
	.xword	0x3e3009a44337785d
	.xword	0x632f8f486158f9a2
	.xword	0x9ffaa7b47e171f12
	.xword	0x7559ce24e1e33a13
	.xword	0x9e3896a61ecf948a
	.xword	0x11bb4dc8bc3380fd
	.xword	0x1a7724eeffc17bdf
	.xword	0x74ebd96d6166c752
	.xword	0x1e5fe42db0fa1972
	.xword	0xc01cedd2a556566d
	.xword	0x71ca5cde769e0288
	.xword	0x84bce68c3075899d
	.xword	0x81185b2062d6bb64
	.xword	0xef8bf6409f423662
	.xword	0x1f16cd437cedfce7
	.xword	0xbb5d48710670731e
	.xword	0xd2df2c8f57be9b87
	.xword	0x387e28636bf0138b
	.xword	0x035d12788dbe1228
	.xword	0xa45f75cc1801d714
	.xword	0x2893f061367a83d8
	.xword	0x9f5f32e496312d3e
	.xword	0xa70c33864b70d0b7
	.xword	0xbaaed4cd19499a24
	.xword	0x8646f97b67326b0b
	.xword	0x63c59a7f98c078a7
	.xword	0x66d7c085d5e107d6
	.xword	0xcac5b80dd5419601
	.xword	0x348c01da97ff4cd8
	.xword	0xccdf5485b6423518
	.xword	0x980bab1108cc62db
	.xword	0x574d982097807774
	.xword	0x1dede6c8ee8ab5af
	.xword	0x5faa3da270ccef61
	.xword	0xb897b25c46a93cb9
	.xword	0x578b56f5908ccd2b
	.xword	0xc0c0cdf681375ca2
	.xword	0x9fc939993e084952
	.xword	0x881818fa52384ab2
	.xword	0xdd21995313df51ee
	.xword	0xa0ec8916070a99e1
	.xword	0x59509c56dc17d088
	.xword	0x121d634c9bb434d3
	.xword	0xcad76a33e5218e1b
	.xword	0x92a13923aed24545
	.xword	0xdb90a820a81eeb08
	.xword	0xd9795e1e092305c8
	.xword	0xa9e977c1cee69dbd
	.xword	0x515d9acbf29b6a17
	.xword	0x2112aed156775435
	.xword	0x21e19efbf04e7805
	.xword	0x48864d30c3d93995
	.xword	0x02247a66531f28cb
	.xword	0x1321d1a99575461d
	.xword	0x606751266cfbb0c1
	.xword	0xd91e051d44b2aefa
	.xword	0x4d741f8c81173805
	.xword	0x9f01cadc103b31fd
	.xword	0x513572d166639afa
	.xword	0xb0d45575b633f460
	.xword	0xc798f764cc08ca2f
	.xword	0x4bcef3d7ee8590b0
	.xword	0x7d44ee15bc60e4ea
	.xword	0x6edc92987cc317eb
	.xword	0xbc46a9a6b3998a6e
	.xword	0x8f0ac8289b4cbb1c
	.xword	0x188315f7beb34668
	.xword	0xcee53f5152ec6661
	.xword	0xa4fdc0c9eb8b1e36
	.xword	0x30f5d2afba3a7def
	.xword	0xd872503cf1d0401e
	.xword	0x5bb17c34a488f8d8
	.xword	0xfccd2a83a94d34a7
	.xword	0xbec55ee8a884dbc7
	.xword	0xa006d95623a93d79
	.xword	0x5ebbe74139c45018
	.xword	0xb86f2e9f51efed75
	.xword	0xdbf5d6b42abdd639
	.xword	0x86b2a99eb43a3f00
	.xword	0xfb5a943244c26349
	.xword	0x8c3c3c98222b5428
	.xword	0xe663db6bf06a74b7
	.xword	0x7328788719ecf766
	.xword	0x298255588b26ca8b
	.xword	0x72621af509133dca
	.xword	0x946b0ad1ea5df5eb
	.xword	0x15cccd7e5056b86c
	.xword	0xf733f03a6eb4c4d1
	.xword	0x7066b2eef4ba287f
	.xword	0x7f333e818adc45ea
	.xword	0x7c720ade33b17e67
	.xword	0x719cfcaddd4a1b6a
	.xword	0xeb696466170de6b0
	.xword	0xfc686348fe34d326
	.xword	0xc8c0285be9f974ec
	.xword	0x4129659193ab62a5
	.xword	0xe4ea93ac01f3cb5f
	.xword	0x6548827745032b9e
	.xword	0x620724269efaf7a7
	.xword	0x7c6387c36a2ba002
	.xword	0x343b02ff511f3e95
	.xword	0x416768d71d0de915
	.xword	0x0aecced83156bb5b
	.xword	0x78e45c025ad06ded
	.xword	0x1ecbd575d89b29b1
	.xword	0x689fa2ccd1acefcc
	.xword	0xbd542211b11e2e76
	.xword	0x880f523c17b0dd9f
	.xword	0xb00745705f8efcd6
	.xword	0xd76b5607138488d0
	.xword	0x5b2e41378057503d
	.xword	0xab499b56b97803d9
	.xword	0xef36461ba3e670c4
	.xword	0x735036c2c7534e06
	.xword	0xf962adc998f7b941
	.xword	0xdc14f2f93511fcdc
	.xword	0xbfc65e55732b1f19
	.xword	0x7e250629bafb51f0
	.xword	0x2f1a84b11066fc72
	.xword	0x73f1f978b876a107
	.xword	0x63277202b71aafbc
	.xword	0x1ab012312a7e6384
	.xword	0xea4937d14d890a65
	.xword	0xc1ebcc73af1ac678
	.xword	0x85f7a497de75cf86
	.xword	0x31f663e40a6ce64b
	.xword	0x55049bd5c4b37fbb
	.xword	0xe67bda18640a98d7
	.xword	0x81a85742b185cb9a
	.xword	0x2f89461db1802d95
	.xword	0x07ee60a8e02a217e
	.xword	0xaade0c3c1c25e517
	.xword	0xe3208c43604822e8
	.xword	0xc54542bbd7d4e511
	.xword	0x8b284440e6121891
	.xword	0xa279674f71ee88f8
	.xword	0x7d7b1e106c77c288
	.xword	0x50f157de68a52137
	.xword	0x7f352b6141bb5d6b
	.xword	0x3335b4d1125ab6b3
	.xword	0x34bb428574cd3987
	.xword	0xa22bdcbc06b093e6
	.xword	0x2e7a7c90de0671a2
	.xword	0x45691138d6868a33
	.xword	0x51987ac399163dba
	.xword	0xfdaa3f7f3b2b0aac
	.xword	0x2deedbafdd1a0048
	.xword	0x31e698bf32dad371
	.xword	0xbd35ed77a158e378
	.xword	0x0f4b734172636197
	.xword	0x890f708ffcb5af41
	.xword	0xaa9d546de56dbbd9
	.xword	0x3478af2a3666e267
	.xword	0xb84d3e604fcd5bfd
	.xword	0xe4cb1837677deb64
	.xword	0x6f57a3df9ca78ebc
	.xword	0xbc9136709e70f68f
	.xword	0xc64bb592bb8e2c7a
	.xword	0x5fb453c7c2d37821
	.xword	0x63f974a37b7a3676
	.xword	0xd6fe1e4899fd4503
	.xword	0xbf930d921dd41ad2
	.xword	0x6fe43d862008a603
	.xword	0x6b0910522e4baa76
	.xword	0xb5b34b4eb279fc10
	.xword	0xc4a35f7205337a7c
	.xword	0x1f06ab9a773f1a1b
	.xword	0xb5330022fec4de10
	.xword	0xcfce9cd23f2f4ee0
	.xword	0x83696a9f186d39c2
	.xword	0x624234b663b7190e
	.xword	0x89c55dc66d8d4d8c
	.xword	0xc7da23adb9853db4
	.xword	0x3814f88aad88dd15
	.xword	0x569a25a18270173f
	.xword	0xfb9c20677650f9d3
	.xword	0x94743f11cef2f031
	.xword	0xac0a876aba9ddbc5
	.xword	0x428fbe7a2de38c39
	.xword	0xcccfa4c20ebbd20f
	.xword	0xc92d44c199724df9
	.xword	0x91d1eca216b6cd84
	.xword	0x6554785594d8c3e4
	.xword	0x9a78b3691dd83eb7
	.xword	0x590dc51fd193deea
	.xword	0xe5e2b20fe7cab3ac
	.xword	0x6fb36aeb39be3163
	.xword	0x50287dd5cf03cb30
	.xword	0xd9ecc39a7529edbf
	.xword	0xb691ab2a06e19dba
	.xword	0x281f67730f05f5cb
	.xword	0x1c0c245f50dccafa
	.xword	0x767a8da65e521cc6
	.xword	0xaa3e56d234b2efc5
	.xword	0x81d00ef55ee21701
	.xword	0xa69353f14147a477
	.xword	0x15318926cc04e168
	.xword	0x4161c9cf9fe8ea98
	.xword	0x10535ccfcf2147ea
	.xword	0xf921f1781e9e8485
	.xword	0xff6b7aa74b8b5686
	.xword	0xa8360b18b97cf849
	.xword	0x4cb3014605c72fc5
	.xword	0xa9898c821748cef8
	.xword	0xa225a2cf2eb433b5
	.xword	0x382acf41b765c206
	.xword	0xbbe6b8379830b878
	.xword	0x9864f1f4268e4411
	.align 0x20000
	.data
data_start_5:

	.xword	0xf58104a75d948c73
	.xword	0x1ac379d42ac02c55
	.xword	0x9819071fe2a0219b
	.xword	0x72176c7a3e3d4bde
	.xword	0xb39db38f764ed600
	.xword	0x99d5f4bac2fb2976
	.xword	0xacedf00d5ad8d546
	.xword	0x322170882b469941
	.xword	0x18d86514128bbad2
	.xword	0x5304487ed9d28c2e
	.xword	0xf4bccda0fe10d119
	.xword	0x0c2161dca706624f
	.xword	0x9a01441e5d5fdc1e
	.xword	0x3c18967e4d7a65d2
	.xword	0x8adbbcb7c92f6113
	.xword	0x06b5839662af2d9d
	.xword	0x1c7d00316ef1c18b
	.xword	0x7e6f4e474ef132e4
	.xword	0x052df310d2091890
	.xword	0x9f73500dfa1d3002
	.xword	0x05545ebbd2a26ede
	.xword	0x7f21ada6a1225462
	.xword	0x5ac2d6fd85ca41b8
	.xword	0xca821431cb1adb2a
	.xword	0xf005c56395f2afb5
	.xword	0xba74fe35c27ae779
	.xword	0x33810bb50fb2aeb2
	.xword	0xe976495d6d4cfc24
	.xword	0xcdc1b91fa5a7f13a
	.xword	0xfac1dfa604d8bc92
	.xword	0x9deb41af545d7735
	.xword	0x8860d5051857548b
	.xword	0xf87b447eb02960b8
	.xword	0x91b43ffaf365a1b5
	.xword	0xe671f05321081118
	.xword	0xc8f1fe8cc7ba699d
	.xword	0xe3f00f5e75665e72
	.xword	0xadbc1be5a1d9a969
	.xword	0xc4b491942c8dfbe7
	.xword	0xcd7c791ff36029cf
	.xword	0x6c73b9d805fc0e32
	.xword	0xfaa80003a5d354b9
	.xword	0x5350ff44f30fa0c2
	.xword	0xcd0b1266ac5d61b9
	.xword	0x63bf84ee6bbe0515
	.xword	0x45050fa7ee8c37ad
	.xword	0x0ad65c1d7ab960e1
	.xword	0xe5507f8d06ab41ab
	.xword	0x01ff439f3274ac39
	.xword	0x230e569e3839bffd
	.xword	0x9f0bc31f4a70aa97
	.xword	0x217013ed0e2ca9c7
	.xword	0x4cfd0c9a8f31fb3a
	.xword	0xab92b2ce11a8fc32
	.xword	0x4214d5ac6f158279
	.xword	0x850348f8da7db0e0
	.xword	0x87a08bb5e3f4430e
	.xword	0xb69a72fb34183143
	.xword	0x48013b78521340d2
	.xword	0x85dad7b9b07549d0
	.xword	0x8c45624317288412
	.xword	0x3231a00bd7619309
	.xword	0x5acd5733d7e8a335
	.xword	0xc6855d6138c05b25
	.xword	0x1537ad66323ae250
	.xword	0x4a86b0f9e8491012
	.xword	0x87233aebac280bc1
	.xword	0xd5e22d6619e7c54a
	.xword	0xa966133949694e53
	.xword	0x0ca468d427491ae2
	.xword	0xf6c6fe9ab3b61181
	.xword	0x0a1c18cbed38c0e4
	.xword	0xa19b5d2cf8b9015a
	.xword	0xa551eea11bf0c0f1
	.xword	0x9a57146a3b1c8469
	.xword	0x0694161c02af114e
	.xword	0x1559e8f20c36c8de
	.xword	0xe9a8a1a454d937a8
	.xword	0x502778fb62bee71a
	.xword	0x9b9e6a67a7d5eb27
	.xword	0x0b51d1ef1d1618eb
	.xword	0xfa489175fc62d5ed
	.xword	0x99ab562bbb8e5ae1
	.xword	0x69845038e5282db0
	.xword	0x5f5300218c521365
	.xword	0x8d8bea0c760124b9
	.xword	0x1829c0d5a3f74518
	.xword	0xe04443ecd4988cab
	.xword	0x2209bf1de5e0c93c
	.xword	0x3740f0c395a4cd29
	.xword	0x6b0e8049e7ead83c
	.xword	0x54f8b6f26e368bfd
	.xword	0x052a8c018421a437
	.xword	0xa10eca4b37b6d1dc
	.xword	0x10a0c66e17963cb0
	.xword	0x29209b42d3c4dd31
	.xword	0xb9712168856ba382
	.xword	0xa57cc8fa697c379a
	.xword	0x3120dd1e09079f55
	.xword	0x45fa1dd9c441e8ab
	.xword	0xfef570b40da9579d
	.xword	0x95473305797cff4f
	.xword	0x958ecb2f73a04608
	.xword	0x5b36c7a21ad67748
	.xword	0x04fcb515d1fad12f
	.xword	0x80245fa081bae964
	.xword	0x2a933f9a66095bef
	.xword	0x32406894a6417127
	.xword	0x37ff797ffc2045fa
	.xword	0x49ed041d7e26a98a
	.xword	0x9cd8049d4f2e699a
	.xword	0x891f24e8ebf57da0
	.xword	0x74d9cfd62090d2c8
	.xword	0xf2a50cbfd4a3e143
	.xword	0x391f0e061c4223b4
	.xword	0x308d859075aa47ab
	.xword	0x77696c46b0213486
	.xword	0x24e945930712b581
	.xword	0x53174d59c1a01f98
	.xword	0x90c53aedeb78351c
	.xword	0x8c2596794562cf94
	.xword	0x9925065ff3e52a85
	.xword	0xe97d5f0f2b262b93
	.xword	0x3ff35f357721aa61
	.xword	0x6f5f30e1e5acb516
	.xword	0xfb56dd6f905dc724
	.xword	0x870b260cbf53effe
	.xword	0x1740a60abe53515e
	.xword	0xdbd0ece71a9c9bd3
	.xword	0xad3e71c984cedd98
	.xword	0x575674bce1753906
	.xword	0xf8156a56034ea8b4
	.xword	0x27bd4f411ae850ac
	.xword	0x30a32e1cc80e9f38
	.xword	0xb2460f568aa63c76
	.xword	0x4a89c5b9e3160620
	.xword	0xe38ce90425e4ca2d
	.xword	0x904d43526a5c2ea2
	.xword	0xeca762ae0cd3bf53
	.xword	0xd3ae7745da1f9865
	.xword	0xfe8bd407dfe307cb
	.xword	0x19c546c01f9dc7c6
	.xword	0x1423d861becdad41
	.xword	0xc12bc4e2e5349908
	.xword	0x4b704605b4ffbe00
	.xword	0x1f3bd6a4ca1720a5
	.xword	0xd8050e3d5e368746
	.xword	0x12d6e3d6a2fe617f
	.xword	0x4591b355846f4a85
	.xword	0xaf44d0ce8c49e51e
	.xword	0xc2b2247db980f8ba
	.xword	0x7b9de89e5cdf855c
	.xword	0xa89c44feacab5a2c
	.xword	0xc26497c08a130f77
	.xword	0xeb130974c3420ad4
	.xword	0xa2b3c45b668c67de
	.xword	0xde1165c888ddd5d8
	.xword	0xd7db1d18c95e7beb
	.xword	0x61c101adb9ae77c7
	.xword	0xe5eb92bf84994b13
	.xword	0x8d8bce1ad313f9f8
	.xword	0xbc52909d0e3cbd80
	.xword	0x5daddf9369ca8ebd
	.xword	0x8b1ebf4dac6c17e2
	.xword	0x2113a442da4670f6
	.xword	0x619f451c2b10793f
	.xword	0x5bae5992937c4225
	.xword	0xa7d229e90bdc4855
	.xword	0xed8ce3f6a185bf94
	.xword	0x0fd8ffd2311f87da
	.xword	0x6d9f606e5b6791c0
	.xword	0x4d5493bc7161179f
	.xword	0xd964b5d2bb32d279
	.xword	0x960c721556ca5cd0
	.xword	0x668ea219e3287c5f
	.xword	0x585e5a8bc4e28ec9
	.xword	0xb760f3dd997cc0fb
	.xword	0x9e0cfdbf58af78bc
	.xword	0xc8f656a6e0078cea
	.xword	0x0a6bb42d7697dc20
	.xword	0x1aac72fa527b06f7
	.xword	0xf39bcb1cfa26c973
	.xword	0xa4c2d3b6e8ab3911
	.xword	0x16673753028c6c95
	.xword	0x7cac436ae910abad
	.xword	0xb953d4f85289d700
	.xword	0x58d3cf4f75819bd5
	.xword	0x3f23e3bbf7ee05c0
	.xword	0x83e13abd39653dd3
	.xword	0xefebac976caa25b6
	.xword	0x081f2dddbd8846c9
	.xword	0x4227d591bb0bf1eb
	.xword	0x06b445f9e5dbad2e
	.xword	0x8b4eeb407badcf12
	.xword	0x3e07e78940b0b49f
	.xword	0xa7e7f792a9528915
	.xword	0xb8c6f42fd5a02c41
	.xword	0x15586f94894fe73d
	.xword	0x4eb3edb9788a428a
	.xword	0x76a614e64fcd3cf0
	.xword	0x227310541513fb32
	.xword	0x473797e63df7acbd
	.xword	0x642d8b9170c15231
	.xword	0x538af20bbb776ee2
	.xword	0x2dccdffe9ff22f65
	.xword	0x2b0ca6a911676a72
	.xword	0x22787082bfd86c97
	.xword	0x645063da10c8b395
	.xword	0xe59e355c6aa79005
	.xword	0x63279376cc89532b
	.xword	0xd759965d4fb930f7
	.xword	0x7d09ef8c797bacb2
	.xword	0x360dbcb0d1697703
	.xword	0x192887d7383e460c
	.xword	0xdb6eed8134605d59
	.xword	0x735a4f5387ff3bca
	.xword	0xaf1a85dd654564ec
	.xword	0x71f0c5ca18b048c9
	.xword	0x0bc43048e7d14b82
	.xword	0xf2331f788cae1cfc
	.xword	0xac7322eef1fa3300
	.xword	0xea0072baecffe51c
	.xword	0xead8970b631704ee
	.xword	0x76ff9a7c7b18f6e3
	.xword	0x4a3b031b02638539
	.xword	0x749bee4f176f03ae
	.xword	0x82a63db7672a57a9
	.xword	0xfcd3af482714729a
	.xword	0x9ed8e94356d77218
	.xword	0xa829d32c04e2e94f
	.xword	0xc3ea899f2a9b537e
	.xword	0x0344227a959bc955
	.xword	0x18a98c78af4961ed
	.xword	0x2ed72a9fb587fe16
	.xword	0x3cc01e6e634db543
	.xword	0xe87663a5276cfd99
	.xword	0xbcec771f97263db3
	.xword	0x6cd8e068ebaa4934
	.xword	0x09f8cab181e05abd
	.xword	0x4fc060971b6d2653
	.xword	0x583b019a1816b200
	.xword	0xa1bcf216aa858d41
	.xword	0xc1827e41812f25dc
	.xword	0x22e6b5ac7f9183b2
	.xword	0x7f1f0b1413273d44
	.xword	0x33e96dfa26f08874
	.xword	0x36a5e655b25a331e
	.xword	0xa93b4fa26f91e4a9
	.xword	0xee479fbecf7c3249
	.xword	0x9e6efb0dcb7115c1
	.xword	0xc1406daa1bac8fb1
	.xword	0x5ac384a046a415d9
	.xword	0xe64fd3fe8cbdf70c
	.xword	0x1e9fd590ba1a4049
	.xword	0xf325854b01b91a8a
	.xword	0x66ebb4e94e622cfa
	.align 0x40000
	.data
data_start_6:

	.xword	0x67f57194846d410e
	.xword	0x114e9e4f36d364c7
	.xword	0xf494e078b0510c7d
	.xword	0x474b1e51bb4be3c1
	.xword	0xff7a5349aab8d66f
	.xword	0xe3210a15fc7c8234
	.xword	0xdaafbf44ba677e54
	.xword	0x4b2b4806d11e1064
	.xword	0x31528565794d97c2
	.xword	0x749418999d515fbd
	.xword	0xda52fd22b84c129a
	.xword	0x3e487f43d65b58f7
	.xword	0x151072cba6e24f03
	.xword	0xb0ada85d92b47c2c
	.xword	0x28159ad2a59d7c36
	.xword	0xe68f09d0fe3ffb15
	.xword	0x3e31c05c2eb36a54
	.xword	0x8980f01c25b56284
	.xword	0xc600f9ef7662d968
	.xword	0xce1c4e60780ff048
	.xword	0x90246e62400b20c4
	.xword	0x830f243a970b9a01
	.xword	0xa96af1df379be6bb
	.xword	0xa26bb180f2e1eccd
	.xword	0x4f1d90d40f8be3ec
	.xword	0xc2e69b898d074e2c
	.xword	0xfff7e30e9151d2fe
	.xword	0x8b875e672d7cf09e
	.xword	0x4a200a91b9fa6018
	.xword	0xce315eaae36a3058
	.xword	0x6b83bc236d5174ea
	.xword	0xf0d84e96d3912d48
	.xword	0x022461fc57176d9e
	.xword	0x83156d4df34f8a5b
	.xword	0x0546a42d99c4fe0d
	.xword	0xd01a6e468d2ba964
	.xword	0x2ca547dcc5322b6c
	.xword	0x121ceb381d9a7607
	.xword	0x0e144b42495ab251
	.xword	0x5bb83eaf295ed3d4
	.xword	0x52765c20598b9d62
	.xword	0x95df6a35e574a4c7
	.xword	0x100cb537d1b1e076
	.xword	0xd1fa2a7bb3880442
	.xword	0x13086112a1b89c35
	.xword	0x50bcaf8f9026bbe7
	.xword	0x99fa1d9b4185695b
	.xword	0x622c883afacc310c
	.xword	0xb4f939fe600438f3
	.xword	0xceb1965dcb5a6e78
	.xword	0x50a18c059503b905
	.xword	0x85c2e717c2067572
	.xword	0xe1e1c762186554ee
	.xword	0xf30b8a4cd870b6bb
	.xword	0xdd8feab64650ba8e
	.xword	0xefee8394a869694f
	.xword	0x7d5a7f732f6b2e1d
	.xword	0x44e73751f952fa34
	.xword	0xefeebacf9daf8785
	.xword	0xfb5ba2bff323f913
	.xword	0x7da5c11ce63bda38
	.xword	0x6a2f0f2c9ab0c4a4
	.xword	0xd9a18fe4393c2b6e
	.xword	0x046bf4b7ee570852
	.xword	0xe1646b4add676869
	.xword	0xefba49288f519077
	.xword	0x875b4dc3dceab4e0
	.xword	0x1b170bbf7bb2d917
	.xword	0x641cedbf5f99f880
	.xword	0x5ab47814af24845d
	.xword	0xa8bcbb7c98c448c0
	.xword	0xd31d5bfdefb3f4a3
	.xword	0x29a15c88eb21a609
	.xword	0x164db973eaaca8bc
	.xword	0x3dfccbaaedec6999
	.xword	0x96d187f8d4925592
	.xword	0x59c946c4d7540af7
	.xword	0x442e454cb35c044c
	.xword	0x70f102bccfce7509
	.xword	0x74abbec5b7e3279c
	.xword	0x101d37003f47173c
	.xword	0xfa6c5735e6ffefdb
	.xword	0x02485dde5a0b8f09
	.xword	0x595acded230226f2
	.xword	0x839bdfb69932232f
	.xword	0x007c4229b06691de
	.xword	0xa35e445bd491882b
	.xword	0xcedac8350666c5b8
	.xword	0x2a962cd3ad098537
	.xword	0x67fcba480dca99b7
	.xword	0x90c614bbde0e804a
	.xword	0x5d390ddc241ecf26
	.xword	0xb1900162a5d9cafd
	.xword	0xd328a864bd7de2d3
	.xword	0xceacacf732efad49
	.xword	0xe443a8309f3cd634
	.xword	0x3c25fbe01a105221
	.xword	0x9d8f8d6abcf1bdcc
	.xword	0x88aacf098486379e
	.xword	0xd3559b78bed76cd6
	.xword	0x46a2e49b428cb191
	.xword	0x3fe4d0c4fcc2c006
	.xword	0x2be82869b1ec4737
	.xword	0xf04b288a0181b4b4
	.xword	0xbfaa8b66e4457853
	.xword	0xb9cd8212e03ec7f7
	.xword	0x68733269917af850
	.xword	0x8b36901ccf46c802
	.xword	0x6f8f12a0658cda27
	.xword	0x0934ef5cc8799577
	.xword	0x52ad1efc93ef2afc
	.xword	0x5ce9906f590558df
	.xword	0x5161696cc385157c
	.xword	0x48517d7e9bb1afc8
	.xword	0xa479fc00a49ceea5
	.xword	0x352df5ebc3953715
	.xword	0x9734155bc07ed167
	.xword	0x2a1e554bce22b12c
	.xword	0x73d3645417e31bc6
	.xword	0xe8de189806f7e166
	.xword	0xff56dac91c56b05d
	.xword	0x75616ac045291c27
	.xword	0xc33a1ce26fa1f22b
	.xword	0x09b4b470ab4de9d7
	.xword	0xb77b35b753926dfc
	.xword	0x0a01c71802d052ed
	.xword	0x70e139c9e78040f3
	.xword	0xf06f75ec5fb96a34
	.xword	0xeec5ca015a0403d5
	.xword	0xffecdfc217743e7b
	.xword	0xb6f36eb5c7d1504d
	.xword	0xbb473d6dd770dcb6
	.xword	0xd6d3c1668a564140
	.xword	0x94898835c83a423a
	.xword	0x020772f65a7e6d1a
	.xword	0x283c859817988114
	.xword	0x0764b328ca23309b
	.xword	0xfffad0f05f4a5a88
	.xword	0xfd636b8d42e6a8f1
	.xword	0x4753b717c540d2ef
	.xword	0x29d47464b79d09a2
	.xword	0xe767de23370c9d3c
	.xword	0x259f3f1ac3ac9379
	.xword	0x82a80a3eb9f048e6
	.xword	0xb7be17afc8ca1462
	.xword	0x01a7001c50c8a37e
	.xword	0x9e9b69e7689d1387
	.xword	0xfa5e9d7214770d96
	.xword	0x2a8365e84800cd03
	.xword	0x9bb56cb7673ecbf5
	.xword	0x9040694570d93a46
	.xword	0xa37c78fb83d9a8df
	.xword	0x421b0899bf2255d3
	.xword	0xa7de9e052cdca313
	.xword	0x9839cff1698a147f
	.xword	0xbcdfe31a56327354
	.xword	0x6b1bef91ce23d019
	.xword	0xa883eedd27daca7d
	.xword	0x629bd8cd7b41b9f4
	.xword	0x2ab6367bd5b80cf7
	.xword	0x6f989bdefb85035b
	.xword	0xee90e615b2320157
	.xword	0xe1960ff0bcf1052c
	.xword	0xeef194323e437a2d
	.xword	0xcf6c3f38817a2635
	.xword	0x404fa7060e503398
	.xword	0xc7d3099408f8dee7
	.xword	0x3a1b0f380c0fdee8
	.xword	0xaa48058e6b76af65
	.xword	0x38d8f5f4bd719c7d
	.xword	0x2ac9f2e31bcbcd03
	.xword	0xd0682182e6712260
	.xword	0x55f894020f972c6e
	.xword	0xe3a19fa231627159
	.xword	0x310291ec68e5246a
	.xword	0x4f101e3b6d812dc8
	.xword	0x866892b6410a3e13
	.xword	0xe5b3a49e3d4d3e51
	.xword	0x4c46f04fe9116220
	.xword	0x3939f7ff266098f8
	.xword	0xa4905d689e4b663a
	.xword	0xd0280a84dba53207
	.xword	0xf17dd0e5f3366e1b
	.xword	0x69ff0510c31e8e5a
	.xword	0x859c9c121300c5e7
	.xword	0x3d9eab71a365803e
	.xword	0x682c8dc35c9071b3
	.xword	0xb3120bca61ee4b49
	.xword	0x6b3ad15782b7a6d5
	.xword	0x4e9cb07ba09b7492
	.xword	0x27f0961fbcbc5c79
	.xword	0xb33579bbb5d9964d
	.xword	0xa003b3fdbdfd0b48
	.xword	0xb81cee258d711765
	.xword	0xfe7d8e3f94eb6b84
	.xword	0xfb78b4dca288e9ab
	.xword	0x2f8ddc1fb888d2ed
	.xword	0xc544e495ea369f50
	.xword	0xd3bc6cacb3dddd7f
	.xword	0xaee434fe97878612
	.xword	0xb19d8849d97811d6
	.xword	0x3d024d6f4df3c83f
	.xword	0x7ae5db6540bc048c
	.xword	0xe2c761f119aa1677
	.xword	0xb678f64357891eae
	.xword	0x8a83499aa1afe534
	.xword	0x81b500551e068b40
	.xword	0x037ceafbfdf36c99
	.xword	0xca543dce31ab376e
	.xword	0xaed19789213291d2
	.xword	0xa5952fb2ecebb7b3
	.xword	0xffed00a878ea3aa5
	.xword	0x69d0b0b212d00e03
	.xword	0xa3dd08319309b704
	.xword	0x4405e8c929eb346a
	.xword	0xc7256819c6de071b
	.xword	0xaaba4799c7fe6bac
	.xword	0x826fc23748f73358
	.xword	0x8a5ab27e9a0d5abc
	.xword	0x8f90f5a70042c274
	.xword	0x521543f78cea4765
	.xword	0x9947e433667ac4bd
	.xword	0xa2643e7c94d665e0
	.xword	0x5f8ce46fd2e0beee
	.xword	0xcbf72f50aacd1695
	.xword	0x2f1791b06c4873c6
	.xword	0x53a8d0bbde4524a2
	.xword	0x284193f53a068f5a
	.xword	0xa49190b57a18912e
	.xword	0x66ada0a1efbe533c
	.xword	0xf9d5f19f2becef5c
	.xword	0xfc184995cbc3cb5d
	.xword	0x4f38c939e2ba5cdd
	.xword	0x84025881057a0e83
	.xword	0x6b80fc816ba6f6b0
	.xword	0x3b7a3d46ab789806
	.xword	0x83403375ef83fd44
	.xword	0x9944ced96a919d63
	.xword	0x0f67f92fcabca548
	.xword	0x44158e2c057172ba
	.xword	0xdc507167ca97f1f9
	.xword	0x29d08ee5f54d1868
	.xword	0x51c4cbc34a86d594
	.xword	0x6d0aba49487cb752
	.xword	0xc496aa7111d80194
	.xword	0x39e3c1a521574e38
	.xword	0x306c396d267eafcc
	.xword	0xf83772cf683e8e45
	.xword	0x37ce49b6c6b43514
	.xword	0x79b694eb08e6b424
	.xword	0x255113b2e66e6d4f
	.xword	0xbf91d0b952dbe742
	.xword	0x388220b27ba16661
	.xword	0x53156b2c22bc7ef8
	.xword	0x26a2fca7cbd747db
	.xword	0x1a3b188a63892bfd
	.align 0x80000
	.data
data_start_7:

	.xword	0x9fce7787f583933f
	.xword	0x5ca1dd1961937edb
	.xword	0x1a8a7322e4130603
	.xword	0x5c788ee3f6d7d90d
	.xword	0x9d2821b89f6cd202
	.xword	0xc9ceb715923629e6
	.xword	0xf4431d5ac1788982
	.xword	0xf01f2f4906cd04ea
	.xword	0xd8e24156f1fdae66
	.xword	0x6ddb97723a6650ba
	.xword	0x4aea74430e356913
	.xword	0xd7dfcc8da835eb8f
	.xword	0xaa12faa8c43d66ad
	.xword	0x04f31ef0bdc28e15
	.xword	0xed215312434d9338
	.xword	0x2a79286febd80053
	.xword	0x96520d7fec2f8656
	.xword	0x352bc0ab706ba256
	.xword	0x72f357d0dc35981d
	.xword	0x2389e498deb351a4
	.xword	0x71c07e73b1aa6869
	.xword	0x952f950d2b2cf702
	.xword	0x7f71989dd188aee2
	.xword	0x6b7ff801dcd49ae0
	.xword	0x33a35a2f30e2259d
	.xword	0x292be3202f40f354
	.xword	0x7e38aa18d7ebed9f
	.xword	0xdd3755b158352412
	.xword	0xe854bd34eed3b031
	.xword	0x660a11a9bf806663
	.xword	0xd7025537c9b56110
	.xword	0x36ce1ce6ba6dcea9
	.xword	0x1a6889190c983064
	.xword	0x8eda75645c7d0464
	.xword	0x8b2e9823437f3902
	.xword	0xb953d25e0d3fe6d6
	.xword	0x2a42367ce8782027
	.xword	0x59775e0e927de117
	.xword	0x6df207a6622637c2
	.xword	0xeec2eeded67330d2
	.xword	0x955a5b84e5b39291
	.xword	0xb6d80b9d35d708e5
	.xword	0x17e212aa626bffd5
	.xword	0x520091fc16f151a9
	.xword	0x25354ceb3d3c3eef
	.xword	0xf077d87c3e1a2c75
	.xword	0xf57a8c3dc804b3b2
	.xword	0xf3b87a83371c7d07
	.xword	0xa8a378ee8ac15d36
	.xword	0xaf99e7a9cdb0643f
	.xword	0x09594b9cb352944a
	.xword	0x34997b66278d0ceb
	.xword	0x3d5a335e9b564c4c
	.xword	0x375ac9f14a499b26
	.xword	0xa4128db359c32673
	.xword	0x74b9e4c6d93677d4
	.xword	0x2119570dd9b38f48
	.xword	0x315fd997366a8952
	.xword	0xee0ac21e69eb11df
	.xword	0xfaff075384cbcf31
	.xword	0xbea0fa0c9e61388b
	.xword	0x675a405197a4b2ea
	.xword	0xfb9e1e1da693e6ef
	.xword	0x53747508a6bfb87f
	.xword	0x04c3c52349c1bd43
	.xword	0xd7cd26b50f94f676
	.xword	0x2a4d8c58bf43540d
	.xword	0x3bb1d2c74de21a99
	.xword	0x9aed52969eea0f40
	.xword	0x8df16ffd8e1f90c0
	.xword	0x523d79e1bf3c0ebc
	.xword	0x1aef5e4262b70c48
	.xword	0xb25f76d74edc1b55
	.xword	0xea609bed81e40426
	.xword	0x49bd2d84813a0811
	.xword	0x649cc2c4da54a11d
	.xword	0xbf08269a0809b147
	.xword	0xe1deaff312c51944
	.xword	0x34a8df12393c48cd
	.xword	0x76be1d82819a58d4
	.xword	0x70d0b750ca7e87fa
	.xword	0xc134c99b9b1c9ec2
	.xword	0x6cd9f324247e2293
	.xword	0xb69d345650acfb19
	.xword	0xab64c096be41694b
	.xword	0xeecbd10107a90b4d
	.xword	0xac2b34f0f1315f3e
	.xword	0xeaaf8d52f47e66c4
	.xword	0xb27e703da300a4b1
	.xword	0x78bfd31efc643d45
	.xword	0x82e9cc3b296ac1e2
	.xword	0xd8bd49516eec46f4
	.xword	0x28111de762d10b89
	.xword	0x0cfe25d44143b559
	.xword	0x6f348568b3a81d0f
	.xword	0xa1abf578b1001fb2
	.xword	0x9416dec04ace586f
	.xword	0x3c7c2fd89395abc4
	.xword	0x974f09e74eb0ad96
	.xword	0xef7fb4627cf70640
	.xword	0xb2e616f935435358
	.xword	0xf653ac6473e8ff8d
	.xword	0x13a7f99b82348ff9
	.xword	0x3cf66d4601817c86
	.xword	0x62dfc248a5e8ecac
	.xword	0x67ca94e7bbb5598d
	.xword	0x2e152c896e2a291b
	.xword	0x7be96a3631bd1649
	.xword	0x5ceed7ac1908fceb
	.xword	0x0f1b0ea8604c6f58
	.xword	0x3030e045486cb252
	.xword	0x0e2107662b814e70
	.xword	0x4b75a0973e5491e3
	.xword	0x2129965f33e8b3f9
	.xword	0x9405ead3a7c6f4e6
	.xword	0x02343a03d6013806
	.xword	0x1c0e1e3c14b0f825
	.xword	0xc1645e38491821f1
	.xword	0xad7b6ae76352f5fe
	.xword	0x19e0baa33c9dbc65
	.xword	0xd427608cbfc2cec5
	.xword	0x0e76f96b0b482435
	.xword	0x50a9417927fe1167
	.xword	0xe495c2542bed6d81
	.xword	0x8cca97b811f9bda3
	.xword	0x352ca688b8e6eca2
	.xword	0x77c240cfc24ea84b
	.xword	0x6b1362af53d683f3
	.xword	0x648617ea88c8b882
	.xword	0xea57da45cc27ad3b
	.xword	0x83949ca11e07a6c9
	.xword	0xaf827c34a7ac2993
	.xword	0xcb9db7d2d9701715
	.xword	0xa239a794a592057a
	.xword	0xce99144bb0caaba1
	.xword	0x4dc1863317ad4b73
	.xword	0x0a931d8495c7c696
	.xword	0x30fff69709ab2ce0
	.xword	0x81efbed2b95d7df0
	.xword	0xc692077e8a0e2487
	.xword	0x3633d7ee7d63e2e5
	.xword	0xb6dbbc6717c31410
	.xword	0xccd86b4a1fd301b1
	.xword	0xf4840c35908dcf03
	.xword	0x1ddf876640087573
	.xword	0xf4f8d3a328ff72ff
	.xword	0x347bc20136c0dcaa
	.xword	0x30a7f86910a0f452
	.xword	0x9e0d4fda33c22c4c
	.xword	0x18fe8dabf162d68f
	.xword	0x6f13067e39c83320
	.xword	0x8534ab57b9260eea
	.xword	0x075fda8408255c02
	.xword	0xaa948f1478efd10f
	.xword	0x6b1683279579ddd2
	.xword	0x6e00dc4fab5facfa
	.xword	0x91364ad812e92b18
	.xword	0xd6d4b72c94499434
	.xword	0xe3d590951a1b8fea
	.xword	0x20cee211ded6cb41
	.xword	0x94d4520904b9454f
	.xword	0xe44e432cef04582d
	.xword	0x521a029d90c0075a
	.xword	0x3aaf069c356cbefe
	.xword	0x91e2a26e8b6c99be
	.xword	0x1c5c5769d373ed01
	.xword	0x754190fba13c7749
	.xword	0x6bd4e3015651c19d
	.xword	0x74741cbe1e30e9d0
	.xword	0x841d7136d728e2f1
	.xword	0x8746a06c3480fc35
	.xword	0x04f78c665665c985
	.xword	0xc61ff41ddc4ad4c7
	.xword	0x4c0393f661f93656
	.xword	0x0b5d398e3be0381b
	.xword	0xb5a1792ebbcf5806
	.xword	0x65153973781e4ec6
	.xword	0x455907f8940f7be2
	.xword	0x61b845f01a9bca96
	.xword	0x27ac2d87c5e8c817
	.xword	0x020494560f7bdf13
	.xword	0x2502cd2d8bc7d29e
	.xword	0xdbd4c83611832a7c
	.xword	0x546e87b6f4572b21
	.xword	0x70700b5884f22b96
	.xword	0x15994ab6e8a00316
	.xword	0x0d13a0671487f491
	.xword	0x3e298724cef8a0e9
	.xword	0x581eb793688221d9
	.xword	0x11459af99a7a8edd
	.xword	0x3c46482685ef1213
	.xword	0xb81f8856bf57ec06
	.xword	0x09ad46f807edf323
	.xword	0x8f3a19630b6cfc9e
	.xword	0x056acce41f2be8c3
	.xword	0x3051e2060bcfe1a5
	.xword	0x469490886b463a8a
	.xword	0x15cdce309b4d3905
	.xword	0xf052e3f14b99eff7
	.xword	0x4f187cfcc71f380f
	.xword	0x478c1438f69be5f4
	.xword	0x5c3d3d39588f72af
	.xword	0x34ce87617345ec57
	.xword	0x3d507202c221cf00
	.xword	0x5e539431f8c5c35a
	.xword	0xc7499f37099c3433
	.xword	0xdbd8bd3a60cdb33e
	.xword	0xc6138e706c4c5a31
	.xword	0xfba1b622f045ee4c
	.xword	0xb123977585647053
	.xword	0x70c7525385dfa2dc
	.xword	0xa984c112f1a8f8b1
	.xword	0x0598c0f020c3d828
	.xword	0x947347a7ff96d6ff
	.xword	0xbe8e1a755eabd1bd
	.xword	0xed3f3e1b8c759234
	.xword	0x8455e389af03fab6
	.xword	0xc61be81ffd489ea5
	.xword	0xd9eb0c3aefecb4a7
	.xword	0xfde98eff071173f4
	.xword	0xc93544816a979848
	.xword	0x5d35aab5934182be
	.xword	0x377ae371c8897c78
	.xword	0x0b3d0d449f39541e
	.xword	0x3f5a2baf597972e7
	.xword	0x78eb1658237ec2b0
	.xword	0x2eba902315143afe
	.xword	0x8a8df70ceb0c014a
	.xword	0x61d675fc2e265ff1
	.xword	0x05b2486284165bb4
	.xword	0xbe87c35751e80caf
	.xword	0x2a147192e891ad3b
	.xword	0x36563e3c949a2da5
	.xword	0xba1ca4f7e60bbcf1
	.xword	0xb8fd31a310758d27
	.xword	0x4b71f2c0593dfeec
	.xword	0xa5cbaefab3b907be
	.xword	0x2a99f7ad7c7f1b01
	.xword	0xf3194ccce7f394e5
	.xword	0xa70d1c1393804b6b
	.xword	0x14706178c32a20dc
	.xword	0xe0e26c9f44371d55
	.xword	0x4b846cdf3c7da2ec
	.xword	0x71cf2b7562618d16
	.xword	0x935a0a99ae71dc2b
	.xword	0x5c14c5a448292a34
	.xword	0x74b069ffcf60c4b6
	.xword	0xccdb2dbf07dd04aa
	.xword	0xe32cf26184b3391f
	.xword	0x13bfa0968582880f
	.xword	0x3f18a861475242bf
	.xword	0xbd2a954d2e02606e
	.xword	0x36f839cce82ff117
	.xword	0x81e0a3653212b864
	.xword	0x74719f528a9e8ae3
	.xword	0x012533ac1e9bf067



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
