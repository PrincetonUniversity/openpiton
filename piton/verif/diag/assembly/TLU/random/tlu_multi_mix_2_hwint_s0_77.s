// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: tlu_multi_mix_2_hwint_s0_77.s
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
   random seed:	792541503
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

	setx 0x206a9af90e6ef01a, %g1, %g0
	setx 0x4c03c717df03db7c, %g1, %g1
	setx 0x8ccda58510ada35b, %g1, %g2
	setx 0xb0040400937a1133, %g1, %g3
	setx 0x535e61afc0c2b42e, %g1, %g4
	setx 0x4d0fefd149288f4d, %g1, %g5
	setx 0x29c757ced77d33ad, %g1, %g6
	setx 0x72bd4af610707a9e, %g1, %g7
	setx 0x047407e7f5cc1bf2, %g1, %r16
	setx 0xa53c35f10870c67d, %g1, %r17
	setx 0xb88a5c5cdca76e32, %g1, %r18
	setx 0x2b5d6140833f06c9, %g1, %r19
	setx 0xd0e2d0f76f027719, %g1, %r20
	setx 0x20e80a2676334dda, %g1, %r21
	setx 0x82964a2bfbe8aae0, %g1, %r22
	setx 0x91ca4b2f9fb85eda, %g1, %r23
	setx 0x6023dfd66ad43e51, %g1, %r24
	setx 0xdbc328e639be7dcb, %g1, %r25
	setx 0xcfaac8b02afee125, %g1, %r26
	setx 0xa56a73587085c53d, %g1, %r27
	setx 0x4acc055d0bf03190, %g1, %r28
	setx 0xa60c2c9e25744fe2, %g1, %r29
	setx 0xbc29331b24a78b26, %g1, %r30
	setx 0x25a3076232a13573, %g1, %r31
	save
	setx 0x3385b5a155a17071, %g1, %r16
	setx 0x9f6913df96b1165b, %g1, %r17
	setx 0x92018e99c67b7d6e, %g1, %r18
	setx 0x40f56253590c8d4c, %g1, %r19
	setx 0xe621a5c4a6a9c06e, %g1, %r20
	setx 0xd02b520c0723abc0, %g1, %r21
	setx 0x4d22eee475cb2468, %g1, %r22
	setx 0x0e55e631cbab2faa, %g1, %r23
	setx 0x52eac5391ee1b366, %g1, %r24
	setx 0xbf6906e2875a378c, %g1, %r25
	setx 0x0310124bb2d88735, %g1, %r26
	setx 0xb12620296dc3339b, %g1, %r27
	setx 0x1cdfe3bb30e6afba, %g1, %r28
	setx 0x41bd13000845628c, %g1, %r29
	setx 0xc67d64df8d1fbd49, %g1, %r30
	setx 0x59cc78e37e29cdb5, %g1, %r31
	save
	setx 0x739400b8d868b5df, %g1, %r16
	setx 0xab873feaff6ce7dd, %g1, %r17
	setx 0xb64daa1ef64a9ad3, %g1, %r18
	setx 0x107f7683ee06eb7e, %g1, %r19
	setx 0x4fac7bcd485030f7, %g1, %r20
	setx 0x358babea4794cabc, %g1, %r21
	setx 0xc1edaa2f04299277, %g1, %r22
	setx 0x89e6f52f7acb4909, %g1, %r23
	setx 0x78f8033ae1615708, %g1, %r24
	setx 0x9990e88dcd2c18bf, %g1, %r25
	setx 0x9f8374caae710ad1, %g1, %r26
	setx 0xdd90c92be447e3af, %g1, %r27
	setx 0x1d821ee2d65ce73f, %g1, %r28
	setx 0x05c00604e962eec6, %g1, %r29
	setx 0x3a19abbef5fc65e5, %g1, %r30
	setx 0xc23a5b911aafb1e1, %g1, %r31
	save
	setx 0x02ebac26ab64b039, %g1, %r16
	setx 0xc940b9358a907de7, %g1, %r17
	setx 0xeda2f4be788c5ba4, %g1, %r18
	setx 0x2f2fd784941a6cf8, %g1, %r19
	setx 0xea2b8957124c8e2c, %g1, %r20
	setx 0x2bca45a64bac10d2, %g1, %r21
	setx 0xaa644dcfa1a3174b, %g1, %r22
	setx 0x8342ec98dc42bfe1, %g1, %r23
	setx 0x5236c05c775cdc64, %g1, %r24
	setx 0xe9b8572a81dbac31, %g1, %r25
	setx 0xd52cfcb1e381ef2c, %g1, %r26
	setx 0xd4d5da11f47a3ccc, %g1, %r27
	setx 0x5842505051f2b448, %g1, %r28
	setx 0x46fb30bd7944f3ff, %g1, %r29
	setx 0x13c15f3b05bc7e25, %g1, %r30
	setx 0xe3f576d892c65629, %g1, %r31
	save
	setx 0x60f89d67b8657430, %g1, %r16
	setx 0x91d0663fff46403d, %g1, %r17
	setx 0x0676845116c6e118, %g1, %r18
	setx 0xdcadd44f695fde43, %g1, %r19
	setx 0xa520e468b5ea20e8, %g1, %r20
	setx 0xd8e51d9ea4303bc6, %g1, %r21
	setx 0x0951dcca65bc88cd, %g1, %r22
	setx 0xabcfbd04d2e32804, %g1, %r23
	setx 0xf6d37df4443351b5, %g1, %r24
	setx 0x7868f02d085e58b3, %g1, %r25
	setx 0xdd88b94545f4b35a, %g1, %r26
	setx 0x75a359055a6e3f3e, %g1, %r27
	setx 0xa4ab68a5edb81b51, %g1, %r28
	setx 0x50669f310d0454c8, %g1, %r29
	setx 0x8e3760c7b7b8da4f, %g1, %r30
	setx 0xab11a005eea5bac1, %g1, %r31
	save
	setx 0xf0b11aabfc4bef09, %g1, %r16
	setx 0xfceb72e0e7c88d4e, %g1, %r17
	setx 0x1ebe0b8f46d894d3, %g1, %r18
	setx 0x185b68ae0373d3ab, %g1, %r19
	setx 0x13eaa19707733a61, %g1, %r20
	setx 0x1bcec22055d4b128, %g1, %r21
	setx 0xc53e114ac6a4a921, %g1, %r22
	setx 0xc747db5f4eaac9b4, %g1, %r23
	setx 0xbca17acb69d3be6e, %g1, %r24
	setx 0x74d890e9bca7b528, %g1, %r25
	setx 0xf9f625c43a8160f1, %g1, %r26
	setx 0x3dffe407dc535748, %g1, %r27
	setx 0x0ca7ee3a3b315273, %g1, %r28
	setx 0x61f59ccc0bba35da, %g1, %r29
	setx 0x4288b634fbdeed82, %g1, %r30
	setx 0xbce14e93c2417a41, %g1, %r31
	save
	setx 0xa0fdbdd9a6fe462c, %g1, %r16
	setx 0x07a40af0f1e2c572, %g1, %r17
	setx 0x8d8d54b3d9346d17, %g1, %r18
	setx 0xf20ddfbfc784740d, %g1, %r19
	setx 0x2187b2dbb9675cd5, %g1, %r20
	setx 0x5bfe773dbe4bfa33, %g1, %r21
	setx 0x783aba7a3c0ef6f2, %g1, %r22
	setx 0x71a0a814b9e1c4a5, %g1, %r23
	setx 0x0eb803a933dc980e, %g1, %r24
	setx 0x2e03006d40a251f7, %g1, %r25
	setx 0x08d2cf83b3a80376, %g1, %r26
	setx 0xc26aa3f578d974e1, %g1, %r27
	setx 0x6ed2a61d8c658e16, %g1, %r28
	setx 0x7b5f1ae14b8b4888, %g1, %r29
	setx 0x5ce65c984cfc4c07, %g1, %r30
	setx 0x1c3a689a8e0a80c6, %g1, %r31
	save
	setx 0x8488291558cf54e1, %g1, %r16
	setx 0x958fef3911f9d8e3, %g1, %r17
	setx 0x4fde0b972fcb00f9, %g1, %r18
	setx 0x4d8ced598d0adaa1, %g1, %r19
	setx 0x4e562210dcdd77ff, %g1, %r20
	setx 0x7f8cb73def55dd13, %g1, %r21
	setx 0x00c672979b5a1d58, %g1, %r22
	setx 0x1d482635db10024f, %g1, %r23
	setx 0xa0ff9a7d745a37c0, %g1, %r24
	setx 0x6d163955eb604b43, %g1, %r25
	setx 0x15ee3fc3e8b3f128, %g1, %r26
	setx 0x870cb885c7e2f678, %g1, %r27
	setx 0x5e73f860d6dbcf77, %g1, %r28
	setx 0xd1e6426bc0650d74, %g1, %r29
	setx 0x8da4dfbf85ec3c3a, %g1, %r30
	setx 0xd1eac73636921bdb, %g1, %r31
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
	setx	data_start_5, %g1, %r22
	setx	data_start_0, %g1, %r22
	.word 0xb9e4e189  ! 8: SAVE_I	save	%r19, 0x0001, %r28
	.word 0x8d95211e  ! 9: WRPR_PSTATE_I	wrpr	%r20, 0x011e, %pstate
	.word 0xb1e5a04b  ! 10: SAVE_I	save	%r22, 0x0001, %r24
	.word 0xbfe5a1f7  ! 13: SAVE_I	save	%r22, 0x0001, %r31
	.word 0xb73ce001  ! 14: SRA_I	sra 	%r19, 0x0001, %r27
	setx	0xfa95eefa00003cca, %g1, %r10
	.word 0x819a8000  ! 18: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
hwintr_0_0:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_0), 16, 16)) -> intp(0, 0, 1a)
	.word 0xb3e5a07a  ! 21: SAVE_I	save	%r22, 0x0001, %r25
	.word 0xbc3c6189  ! 22: XNOR_I	xnor 	%r17, 0x0189, %r30
	.word 0xbbe5612e  ! 25: SAVE_I	save	%r21, 0x0001, %r29
	.word 0xbbe521ab  ! 29: SAVE_I	save	%r20, 0x0001, %r29
	.word 0x8994a150  ! 31: WRPR_TICK_I	wrpr	%r18, 0x0150, %tick
	setx	0x9e17280d0000b90e, %g1, %r10
	.word 0x839a8000  ! 32: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb5e5e048  ! 36: SAVE_I	save	%r23, 0x0001, %r26
	.word 0x8194a104  ! 39: WRPR_TPC_I	wrpr	%r18, 0x0104, %tpc
	.word 0xb9e5a084  ! 43: SAVE_I	save	%r22, 0x0001, %r28
hwintr_0_1:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_1), 16, 16)) -> intp(0, 0, 27)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
hwintr_0_2:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_2), 16, 16)) -> intp(0, 0, 17)
	.word 0xb3508000  ! 50: RDPR_TSTATE	<illegal instruction>
	.word 0x8795a087  ! 52: WRPR_TT_I	wrpr	%r22, 0x0087, %tt
	.word 0xb9e520da  ! 55: SAVE_I	save	%r20, 0x0001, %r28
	setx	0x54018c320000cb47, %g1, %r10
	.word 0x819a8000  ! 58: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xb1e461a0  ! 59: SAVE_I	save	%r17, 0x0001, %r24
	.word 0xb1504000  ! 60: RDPR_TNPC	<illegal instruction>
	.word 0xbfe5616d  ! 61: SAVE_I	save	%r21, 0x0001, %r31
	.word 0xb7e521dc  ! 62: SAVE_I	save	%r20, 0x0001, %r27
hwintr_0_3:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_3), 16, 16)) -> intp(0, 0, 23)
hwintr_0_4:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_4), 16, 16)) -> intp(0, 0, d)
	.word 0xbbe521f0  ! 67: SAVE_I	save	%r20, 0x0001, %r29
	.word 0xbbe420a4  ! 68: SAVE_I	save	%r16, 0x0001, %r29
	.word 0xb7e5611a  ! 71: SAVE_I	save	%r21, 0x0001, %r27
	.word 0x839560bf  ! 74: WRPR_TNPC_I	wrpr	%r21, 0x00bf, %tnpc
hwintr_0_5:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_5), 16, 16)) -> intp(0, 0, 3d)
	.word 0xb5e4613d  ! 76: SAVE_I	save	%r17, 0x0001, %r26
	.word 0x8194612d  ! 78: WRPR_TPC_I	wrpr	%r17, 0x012d, %tpc
	mov	2, %r12
	.word 0xa1930000  ! 82: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb9e420d6  ! 83: SAVE_I	save	%r16, 0x0001, %r28
	.word 0xb4358000  ! 84: SUBC_R	orn 	%r22, %r0, %r26
	setx	data_start_2, %g1, %r20
	.word 0xbfe521d1  ! 92: SAVE_I	save	%r20, 0x0001, %r31
	.word 0xb1e4e042  ! 95: SAVE_I	save	%r19, 0x0001, %r24
	.word 0xb5e521e4  ! 96: SAVE_I	save	%r20, 0x0001, %r26
	.word 0xb5e46166  ! 101: SAVE_I	save	%r17, 0x0001, %r26
	.word 0xbbe461f0  ! 104: SAVE_I	save	%r17, 0x0001, %r29
hwintr_0_6:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_6), 16, 16)) -> intp(0, 0, 36)
	.word 0xb1e52098  ! 116: SAVE_I	save	%r20, 0x0001, %r24
	.word 0xbbe460be  ! 117: SAVE_I	save	%r17, 0x0001, %r29
	.word 0xb5e4200a  ! 119: SAVE_I	save	%r16, 0x0001, %r26
	.word 0xb334a001  ! 124: SRL_I	srl 	%r18, 0x0001, %r25
	.word 0xbde521d7  ! 125: SAVE_I	save	%r20, 0x0001, %r30
	.word 0xbfe5e049  ! 129: SAVE_I	save	%r23, 0x0001, %r31
	.word 0xb095e15b  ! 130: ORcc_I	orcc 	%r23, 0x015b, %r24
	.word 0xb9e4a183  ! 133: SAVE_I	save	%r18, 0x0001, %r28
	.word 0xbbe421e8  ! 135: SAVE_I	save	%r16, 0x0001, %r29
hwintr_0_7:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_7), 16, 16)) -> intp(0, 0, 1d)
	.word 0xb7e460ce  ! 142: SAVE_I	save	%r17, 0x0001, %r27
	.word 0xbfe4e1cd  ! 146: SAVE_I	save	%r19, 0x0001, %r31
	.word 0xbfe5a1c3  ! 149: SAVE_I	save	%r22, 0x0001, %r31
	.word 0xbde4e0ce  ! 156: SAVE_I	save	%r19, 0x0001, %r30
	.word 0xb9e521f5  ! 157: SAVE_I	save	%r20, 0x0001, %r28
hwintr_0_8:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_8), 16, 16)) -> intp(0, 0, 11)
	.word 0xbde5e0b4  ! 164: SAVE_I	save	%r23, 0x0001, %r30
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
hwintr_0_9:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_9), 16, 16)) -> intp(0, 0, 15)
	.word 0xb5e560ef  ! 176: SAVE_I	save	%r21, 0x0001, %r26
hwintr_0_10:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_10), 16, 16)) -> intp(0, 0, 1a)
	.word 0xb5508000  ! 183: RDPR_TSTATE	<illegal instruction>
	.word 0xb9e4e0b4  ! 186: SAVE_I	save	%r19, 0x0001, %r28
	.word 0xbbe5a0c0  ! 189: SAVE_I	save	%r22, 0x0001, %r29
	.word 0xb3e4a056  ! 190: SAVE_I	save	%r18, 0x0001, %r25
	.word 0xb3e46126  ! 191: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xb5500000  ! 193: RDPR_TPC	<illegal instruction>
	.word 0xb3e5a006  ! 195: SAVE_I	save	%r22, 0x0001, %r25
	.word 0xb68de07f  ! 201: ANDcc_I	andcc 	%r23, 0x007f, %r27
hwintr_0_11:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_11), 16, 16)) -> intp(0, 0, 3f)
	.word 0xbbe5a0e3  ! 203: SAVE_I	save	%r22, 0x0001, %r29
	.word 0xbfe4e1df  ! 204: SAVE_I	save	%r19, 0x0001, %r31
	.word 0xb9e421d4  ! 205: SAVE_I	save	%r16, 0x0001, %r28
hwintr_0_12:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_12), 16, 16)) -> intp(0, 0, d)
	.word 0xba14615b  ! 207: OR_I	or 	%r17, 0x015b, %r29
	setx	data_start_4, %g1, %r18
	.word 0xb3e52009  ! 217: SAVE_I	save	%r20, 0x0001, %r25
	.word 0x8794e0cc  ! 220: WRPR_TT_I	wrpr	%r19, 0x00cc, %tt
	.word 0xb9e561b7  ! 222: SAVE_I	save	%r21, 0x0001, %r28
	.word 0xb3e56105  ! 223: SAVE_I	save	%r21, 0x0001, %r25
	.word 0xb5e4a178  ! 229: SAVE_I	save	%r18, 0x0001, %r26
	.word 0x819420c0  ! 230: WRPR_TPC_I	wrpr	%r16, 0x00c0, %tpc
	.word 0x8594a0f3  ! 231: WRPR_TSTATE_I	wrpr	%r18, 0x00f3, %tstate
	setx	data_start_2, %g1, %r22
	.word 0xb5e4e1eb  ! 233: SAVE_I	save	%r19, 0x0001, %r26
	.word 0xb3518000  ! 235: RDPR_PSTATE	<illegal instruction>
	.word 0xb3e4603d  ! 236: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xbbe4e147  ! 238: SAVE_I	save	%r19, 0x0001, %r29
hwintr_0_13:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_13), 16, 16)) -> intp(0, 0, 5)
	.word 0xb9e5a061  ! 243: SAVE_I	save	%r22, 0x0001, %r28
	.word 0xbfe520cf  ! 248: SAVE_I	save	%r20, 0x0001, %r31
	.word 0xbbe4e0fb  ! 250: SAVE_I	save	%r19, 0x0001, %r29
	.word 0x8194a1bd  ! 252: WRPR_TPC_I	wrpr	%r18, 0x01bd, %tpc
	.word 0xb3e5203d  ! 254: SAVE_I	save	%r20, 0x0001, %r25
	.word 0xbc8d60a0  ! 256: ANDcc_I	andcc 	%r21, 0x00a0, %r30
	setx	data_start_6, %g1, %r16
	.word 0xbde5e1e0  ! 262: SAVE_I	save	%r23, 0x0001, %r30
	.word 0xb1e561f1  ! 263: SAVE_I	save	%r21, 0x0001, %r24
	.word 0xb9e4e13c  ! 265: SAVE_I	save	%r19, 0x0001, %r28
	.word 0xb7e4a01a  ! 266: SAVE_I	save	%r18, 0x0001, %r27
	.word 0xb9e46029  ! 268: SAVE_I	save	%r17, 0x0001, %r28
	.word 0xbc3d8000  ! 269: XNOR_R	xnor 	%r22, %r0, %r30
hwintr_0_14:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_14), 16, 16)) -> intp(0, 0, 38)
	.word 0xb5e4e153  ! 274: SAVE_I	save	%r19, 0x0001, %r26
	.word 0xb3e4e1f1  ! 283: SAVE_I	save	%r19, 0x0001, %r25
	.word 0xbb504000  ! 286: RDPR_TNPC	<illegal instruction>
	.word 0xb1e421a1  ! 288: SAVE_I	save	%r16, 0x0001, %r24
	.word 0xb5e4e165  ! 290: SAVE_I	save	%r19, 0x0001, %r26
	.word 0xb5e5e14c  ! 292: SAVE_I	save	%r23, 0x0001, %r26
	.word 0xbde5a074  ! 293: SAVE_I	save	%r22, 0x0001, %r30
	.word 0xb5e4214f  ! 300: SAVE_I	save	%r16, 0x0001, %r26
	mov	1, %r12
	.word 0xa1930000  ! 301: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb1e5e16d  ! 303: SAVE_I	save	%r23, 0x0001, %r24
	.word 0xb1e4a1b0  ! 306: SAVE_I	save	%r18, 0x0001, %r24
	.word 0xbfe4e175  ! 307: SAVE_I	save	%r19, 0x0001, %r31
	setx	data_start_2, %g1, %r19
	.word 0xbbe5e0b2  ! 310: SAVE_I	save	%r23, 0x0001, %r29
	.word 0xb93d2001  ! 311: SRA_I	sra 	%r20, 0x0001, %r28
	.word 0xb1e4608c  ! 312: SAVE_I	save	%r17, 0x0001, %r24
	.word 0xb7e461de  ! 315: SAVE_I	save	%r17, 0x0001, %r27
	.word 0xb1e52012  ! 318: SAVE_I	save	%r20, 0x0001, %r24
	.word 0xbbe56079  ! 326: SAVE_I	save	%r21, 0x0001, %r29
	.word 0xb9e5e0c8  ! 330: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xb9e4614f  ! 332: SAVE_I	save	%r17, 0x0001, %r28
	.word 0xbb51c000  ! 333: RDPR_TL	<illegal instruction>
	.word 0xbbe521a2  ! 334: SAVE_I	save	%r20, 0x0001, %r29
hwintr_0_15:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_15), 16, 16)) -> intp(0, 0, 3e)
	.word 0xb9520000  ! 339: RDPR_PIL	<illegal instruction>
	.word 0xbb518000  ! 344: RDPR_PSTATE	<illegal instruction>
	.word 0xbfe52084  ! 346: SAVE_I	save	%r20, 0x0001, %r31
	.word 0xbf500000  ! 348: RDPR_TPC	<illegal instruction>
	setx	data_start_1, %g1, %r17
	setx	data_start_4, %g1, %r20
	.word 0xbde5601b  ! 357: SAVE_I	save	%r21, 0x0001, %r30
	setx	0x18a3b2950000ead9, %g1, %r10
	.word 0x839a8000  ! 362: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	mov	1, %r12
	.word 0x8f930000  ! 364: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xb0254000  ! 365: SUB_R	sub 	%r21, %r0, %r24
	.word 0xbde4e193  ! 368: SAVE_I	save	%r19, 0x0001, %r30
	.word 0xb3e46069  ! 369: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xb9e42031  ! 370: SAVE_I	save	%r16, 0x0001, %r28
	.word 0x8594a11c  ! 372: WRPR_TSTATE_I	wrpr	%r18, 0x011c, %tstate
	.word 0xb8bc4000  ! 378: XNORcc_R	xnorcc 	%r17, %r0, %r28
	.word 0xb1e4a1f0  ! 383: SAVE_I	save	%r18, 0x0001, %r24
	.word 0xb3e5e08e  ! 384: SAVE_I	save	%r23, 0x0001, %r25
	.word 0xb5520000  ! 386: RDPR_PIL	<illegal instruction>
	.word 0x9195605f  ! 388: WRPR_PIL_I	wrpr	%r21, 0x005f, %pil
	.word 0xb33cd000  ! 389: SRAX_R	srax	%r19, %r0, %r25
	.word 0xb9e5617a  ! 390: SAVE_I	save	%r21, 0x0001, %r28
	.word 0x8195a021  ! 391: WRPR_TPC_I	wrpr	%r22, 0x0021, %tpc
	setx	data_start_0, %g1, %r16
	.word 0x8d94a084  ! 394: WRPR_PSTATE_I	wrpr	%r18, 0x0084, %pstate
	.word 0xbfe5e108  ! 396: SAVE_I	save	%r23, 0x0001, %r31
	.word 0xb5500000  ! 397: RDPR_TPC	<illegal instruction>
	.word 0xb2ac612e  ! 400: ANDNcc_I	andncc 	%r17, 0x012e, %r25
	.word 0xb7e5e00a  ! 405: SAVE_I	save	%r23, 0x0001, %r27
	.word 0xb9e5a06f  ! 406: SAVE_I	save	%r22, 0x0001, %r28
	.word 0xb5e46144  ! 409: SAVE_I	save	%r17, 0x0001, %r26
	.word 0xb2b48000  ! 411: ORNcc_R	orncc 	%r18, %r0, %r25
	.word 0xb5510000  ! 415: RDPR_TICK	<illegal instruction>
	setx	data_start_1, %g1, %r16
	.word 0xb1480000  ! 417: RDHPR_HPSTATE	rdhpr	%hpstate, %r24
	.word 0xbbe4a1ed  ! 419: SAVE_I	save	%r18, 0x0001, %r29
	.word 0xb7e421c5  ! 420: SAVE_I	save	%r16, 0x0001, %r27
	.word 0xb5e52142  ! 422: SAVE_I	save	%r20, 0x0001, %r26
	.word 0xbfe461e2  ! 426: SAVE_I	save	%r17, 0x0001, %r31
	.word 0xbde460ad  ! 429: SAVE_I	save	%r17, 0x0001, %r30
	.word 0xb9e56159  ! 436: SAVE_I	save	%r21, 0x0001, %r28
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb7500000  ! 438: RDPR_TPC	<illegal instruction>
	setx	data_start_5, %g1, %r18
	mov	0, %r12
	.word 0xa1930000  ! 440: WRPR_GL_R	wrpr	%r12, %r0, %-
	setx	data_start_5, %g1, %r20
	.word 0xbd510000  ! 443: RDPR_TICK	<illegal instruction>
hwintr_0_16:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_16), 16, 16)) -> intp(0, 0, d)
	.word 0xb5e5205f  ! 450: SAVE_I	save	%r20, 0x0001, %r26
	.word 0xb7e5607e  ! 452: SAVE_I	save	%r21, 0x0001, %r27
	.word 0xbde5e0e3  ! 458: SAVE_I	save	%r23, 0x0001, %r30
hwintr_0_17:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_17), 16, 16)) -> intp(0, 0, 28)
	.word 0xb5e4215c  ! 462: SAVE_I	save	%r16, 0x0001, %r26
	.word 0xbbe4a0d1  ! 464: SAVE_I	save	%r18, 0x0001, %r29
	.word 0xb7e520cd  ! 465: SAVE_I	save	%r20, 0x0001, %r27
	.word 0xb1e4e15f  ! 466: SAVE_I	save	%r19, 0x0001, %r24
	.word 0xbfe5e09a  ! 467: SAVE_I	save	%r23, 0x0001, %r31
	.word 0xb9e4e198  ! 469: SAVE_I	save	%r19, 0x0001, %r28
	.word 0x8994a1b9  ! 470: WRPR_TICK_I	wrpr	%r18, 0x01b9, %tick
	.word 0x9195a02f  ! 474: WRPR_PIL_I	wrpr	%r22, 0x002f, %pil
	mov	0, %r12
	.word 0x8f930000  ! 476: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xbfe520c8  ! 479: SAVE_I	save	%r20, 0x0001, %r31
	.word 0xb3e4e0da  ! 482: SAVE_I	save	%r19, 0x0001, %r25
	.word 0xbf500000  ! 485: RDPR_TPC	<illegal instruction>
	.word 0xb3e421bc  ! 492: SAVE_I	save	%r16, 0x0001, %r25
	.word 0xb5540000  ! 494: RDPR_GL	<illegal instruction>
	.word 0xb3510000  ! 496: RDPR_TICK	<illegal instruction>
	.word 0xbde5e1b6  ! 497: SAVE_I	save	%r23, 0x0001, %r30
	.word 0x879561a1  ! 500: WRPR_TT_I	wrpr	%r21, 0x01a1, %tt
	.word 0xb7e4a11a  ! 501: SAVE_I	save	%r18, 0x0001, %r27
hwintr_0_18:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_18), 16, 16)) -> intp(0, 0, 2f)
	.word 0xb57d8400  ! 505: MOVR_R	movre	%r22, %r0, %r26
	.word 0xbbe5615d  ! 508: SAVE_I	save	%r21, 0x0001, %r29
	.word 0xb1e4e0e2  ! 510: SAVE_I	save	%r19, 0x0001, %r24
	.word 0xb1e4e164  ! 511: SAVE_I	save	%r19, 0x0001, %r24
	.word 0x8795a027  ! 515: WRPR_TT_I	wrpr	%r22, 0x0027, %tt
	.word 0xb3e56198  ! 519: SAVE_I	save	%r21, 0x0001, %r25
	.word 0xbf51c000  ! 520: RDPR_TL	<illegal instruction>
	.word 0xb5e421d7  ! 525: SAVE_I	save	%r16, 0x0001, %r26
	mov	1, %r12
	.word 0x8f930000  ! 527: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xb5e42074  ! 531: SAVE_I	save	%r16, 0x0001, %r26
	.word 0xb1e5e091  ! 532: SAVE_I	save	%r23, 0x0001, %r24
	.word 0xbf508000  ! 534: RDPR_TSTATE	<illegal instruction>
hwintr_0_19:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_19), 16, 16)) -> intp(0, 0, 1f)
	.word 0xbc348000  ! 538: ORN_R	orn 	%r18, %r0, %r30
	.word 0x8395e0d1  ! 541: WRPR_TNPC_I	wrpr	%r23, 0x00d1, %tnpc
	.word 0xbde460af  ! 542: SAVE_I	save	%r17, 0x0001, %r30
	.word 0xb3e4e09f  ! 548: SAVE_I	save	%r19, 0x0001, %r25
	.word 0x87956146  ! 549: WRPR_TT_I	wrpr	%r21, 0x0146, %tt
	.word 0xbde4a14c  ! 550: SAVE_I	save	%r18, 0x0001, %r30
	mov	2, %r12
	.word 0x8f930000  ! 554: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xb5e5a005  ! 555: SAVE_I	save	%r22, 0x0001, %r26
	.word 0xbde4e0ca  ! 556: SAVE_I	save	%r19, 0x0001, %r30
	.word 0xb1e4615e  ! 557: SAVE_I	save	%r17, 0x0001, %r24
hwintr_0_20:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_20), 16, 16)) -> intp(0, 0, 39)
	.word 0xbde52086  ! 564: SAVE_I	save	%r20, 0x0001, %r30
	.word 0x819421d6  ! 567: WRPR_TPC_I	wrpr	%r16, 0x01d6, %tpc
	.word 0xb9480000  ! 569: RDHPR_HPSTATE	rdhpr	%hpstate, %r28
	.word 0xb7e4a10b  ! 571: SAVE_I	save	%r18, 0x0001, %r27
	.word 0xb57ca401  ! 572: MOVR_I	movre	%r18, 0x1, %r26
	.word 0xb7e56172  ! 573: SAVE_I	save	%r21, 0x0001, %r27
	.word 0xb1e4e062  ! 574: SAVE_I	save	%r19, 0x0001, %r24
	.word 0xb5e46127  ! 576: SAVE_I	save	%r17, 0x0001, %r26
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb3e4e1be  ! 578: SAVE_I	save	%r19, 0x0001, %r25
	.word 0xb7e5a00a  ! 581: SAVE_I	save	%r22, 0x0001, %r27
	.word 0xbfe46185  ! 586: SAVE_I	save	%r17, 0x0001, %r31
	.word 0xbfe5213b  ! 588: SAVE_I	save	%r20, 0x0001, %r31
	.word 0xb7e4e02a  ! 590: SAVE_I	save	%r19, 0x0001, %r27
	.word 0xb7e5e1e8  ! 592: SAVE_I	save	%r23, 0x0001, %r27
	.word 0xb69d0000  ! 595: XORcc_R	xorcc 	%r20, %r0, %r27
	setx	0xa08422ab0000cb49, %g1, %r10
	.word 0x819a8000  ! 597: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xb29dc000  ! 598: XORcc_R	xorcc 	%r23, %r0, %r25
	.word 0xbfe5e047  ! 602: SAVE_I	save	%r23, 0x0001, %r31
	.word 0xb9480000  ! 603: RDHPR_HPSTATE	rdhpr	%hpstate, %r28
	.word 0xb7e5a1a3  ! 607: SAVE_I	save	%r22, 0x0001, %r27
	.word 0xbbe520a1  ! 610: SAVE_I	save	%r20, 0x0001, %r29
	.word 0xbf500000  ! 611: RDPR_TPC	<illegal instruction>
	.word 0xb3e521b4  ! 617: SAVE_I	save	%r20, 0x0001, %r25
	.word 0xb6b50000  ! 619: ORNcc_R	orncc 	%r20, %r0, %r27
	.word 0xb604e179  ! 620: ADD_I	add 	%r19, 0x0179, %r27
	.word 0xb3e4a122  ! 621: SAVE_I	save	%r18, 0x0001, %r25
	.word 0x8795e165  ! 624: WRPR_TT_I	wrpr	%r23, 0x0165, %tt
	.word 0xb57da401  ! 626: MOVR_I	movre	%r22, 0x1, %r26
	.word 0xbde5611f  ! 629: SAVE_I	save	%r21, 0x0001, %r30
	.word 0xb1e56013  ! 637: SAVE_I	save	%r21, 0x0001, %r24
	.word 0xb5e5213c  ! 641: SAVE_I	save	%r20, 0x0001, %r26
	.word 0xbc2c6040  ! 648: ANDN_I	andn 	%r17, 0x0040, %r30
	.word 0xb5e5219c  ! 650: SAVE_I	save	%r20, 0x0001, %r26
	.word 0x919560b1  ! 653: WRPR_PIL_I	wrpr	%r21, 0x00b1, %pil
	.word 0xbd500000  ! 656: RDPR_TPC	<illegal instruction>
	.word 0xb751c000  ! 660: RDPR_TL	<illegal instruction>
	.word 0xb7e460c9  ! 661: SAVE_I	save	%r17, 0x0001, %r27
	.word 0xbb510000  ! 663: RDPR_TICK	<illegal instruction>
	.word 0xb3e42123  ! 668: SAVE_I	save	%r16, 0x0001, %r25
hwintr_0_21:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_21), 16, 16)) -> intp(0, 0, 29)
	.word 0x85952132  ! 671: WRPR_TSTATE_I	wrpr	%r20, 0x0132, %tstate
	.word 0xbbe4a162  ! 674: SAVE_I	save	%r18, 0x0001, %r29
	setx	0xbea8bf7400007f81, %g1, %r10
	.word 0x819a8000  ! 677: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xb5e5a1b9  ! 678: SAVE_I	save	%r22, 0x0001, %r26
	.word 0xb3e4e1ce  ! 679: SAVE_I	save	%r19, 0x0001, %r25
	.word 0xbbe5e0db  ! 681: SAVE_I	save	%r23, 0x0001, %r29
	.word 0xb1e5a026  ! 683: SAVE_I	save	%r22, 0x0001, %r24
	.word 0xb3e560ab  ! 684: SAVE_I	save	%r21, 0x0001, %r25
hwintr_0_22:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_22), 16, 16)) -> intp(0, 0, 3c)
	.word 0xba35a1f0  ! 690: SUBC_I	orn 	%r22, 0x01f0, %r29
	.word 0xbd540000  ! 691: RDPR_GL	<illegal instruction>
	setx	data_start_7, %g1, %r23
	.word 0xb5e4615f  ! 693: SAVE_I	save	%r17, 0x0001, %r26
	mov	2, %r12
	.word 0x8f930000  ! 695: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xbd50c000  ! 700: RDPR_TT	<illegal instruction>
	.word 0xbde56150  ! 705: SAVE_I	save	%r21, 0x0001, %r30
	.word 0xbbe421fc  ! 707: SAVE_I	save	%r16, 0x0001, %r29
	setx	data_start_3, %g1, %r18
hwintr_0_23:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_23), 16, 16)) -> intp(0, 0, 13)
	.word 0xb7e5615f  ! 712: SAVE_I	save	%r21, 0x0001, %r27
	.word 0xb68c0000  ! 714: ANDcc_R	andcc 	%r16, %r0, %r27
	.word 0xb3350000  ! 716: SRL_R	srl 	%r20, %r0, %r25
	.word 0xb3e4a14d  ! 717: SAVE_I	save	%r18, 0x0001, %r25
	.word 0xbde52114  ! 719: SAVE_I	save	%r20, 0x0001, %r30
	.word 0xb1e56179  ! 721: SAVE_I	save	%r21, 0x0001, %r24
	.word 0xb00ce069  ! 722: AND_I	and 	%r19, 0x0069, %r24
	.word 0xba94a1e2  ! 723: ORcc_I	orcc 	%r18, 0x01e2, %r29
	.word 0xb3e4e1a7  ! 728: SAVE_I	save	%r19, 0x0001, %r25
	.word 0xbde56181  ! 729: SAVE_I	save	%r21, 0x0001, %r30
	.word 0xb1e560ce  ! 732: SAVE_I	save	%r21, 0x0001, %r24
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xbfe4e187  ! 735: SAVE_I	save	%r19, 0x0001, %r31
	.word 0xb9e5e05f  ! 738: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xb551c000  ! 739: RDPR_TL	<illegal instruction>
	.word 0xb1e5a174  ! 741: SAVE_I	save	%r22, 0x0001, %r24
	.word 0xb1342001  ! 742: SRL_I	srl 	%r16, 0x0001, %r24
	.word 0xb0bc21c0  ! 744: XNORcc_I	xnorcc 	%r16, 0x01c0, %r24
	.word 0xb1e4a0c2  ! 746: SAVE_I	save	%r18, 0x0001, %r24
	.word 0xbeb5c000  ! 747: SUBCcc_R	orncc 	%r23, %r0, %r31
	.word 0xb3e4a181  ! 754: SAVE_I	save	%r18, 0x0001, %r25
hwintr_0_24:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_24), 16, 16)) -> intp(0, 0, 2b)
	.word 0xb1e521cc  ! 758: SAVE_I	save	%r20, 0x0001, %r24
	.word 0xba1c8000  ! 761: XOR_R	xor 	%r18, %r0, %r29
	.word 0xb7e46015  ! 771: SAVE_I	save	%r17, 0x0001, %r27
	.word 0xbe944000  ! 772: ORcc_R	orcc 	%r17, %r0, %r31
	.word 0xb5e5e180  ! 775: SAVE_I	save	%r23, 0x0001, %r26
	.word 0xb9e5a0e2  ! 777: SAVE_I	save	%r22, 0x0001, %r28
	.word 0xb9e4a14c  ! 778: SAVE_I	save	%r18, 0x0001, %r28
	.word 0xbfe5a03b  ! 783: SAVE_I	save	%r22, 0x0001, %r31
	.word 0xb5520000  ! 784: RDPR_PIL	<illegal instruction>
	setx	data_start_5, %g1, %r21
	setx	0x962ec3fb0000b94a, %g1, %r10
	.word 0x839a8000  ! 795: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0x899420c2  ! 799: WRPR_TICK_I	wrpr	%r16, 0x00c2, %tick
	.word 0xbfe5a07e  ! 802: SAVE_I	save	%r22, 0x0001, %r31
	.word 0xb77dc400  ! 803: MOVR_R	movre	%r23, %r0, %r27
	.word 0xb5e4e1ca  ! 804: SAVE_I	save	%r19, 0x0001, %r26
hwintr_0_25:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_25), 16, 16)) -> intp(0, 0, 9)
hwintr_0_26:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_26), 16, 16)) -> intp(0, 0, 3d)
	setx	data_start_3, %g1, %r16
	.word 0xb9e461f7  ! 810: SAVE_I	save	%r17, 0x0001, %r28
	.word 0xb2bda04a  ! 812: XNORcc_I	xnorcc 	%r22, 0x004a, %r25
	.word 0xb5e420cc  ! 813: SAVE_I	save	%r16, 0x0001, %r26
	setx	0xcc42a0b700007a5b, %g1, %r10
	.word 0x839a8000  ! 815: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xbde461e4  ! 820: SAVE_I	save	%r17, 0x0001, %r30
	setx	0x5575575600007982, %g1, %r10
	.word 0x819a8000  ! 822: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xb7e4e11a  ! 827: SAVE_I	save	%r19, 0x0001, %r27
	.word 0xb1e521f9  ! 828: SAVE_I	save	%r20, 0x0001, %r24
	.word 0xb3e56129  ! 830: SAVE_I	save	%r21, 0x0001, %r25
	.word 0xb1e460d3  ! 833: SAVE_I	save	%r17, 0x0001, %r24
	.word 0x8d956150  ! 835: WRPR_PSTATE_I	wrpr	%r21, 0x0150, %pstate
	.word 0x81952165  ! 841: WRPR_TPC_I	wrpr	%r20, 0x0165, %tpc
	.word 0x8395a1c8  ! 843: WRPR_TNPC_I	wrpr	%r22, 0x01c8, %tnpc
	.word 0xb150c000  ! 844: RDPR_TT	<illegal instruction>
	.word 0xbfe56145  ! 850: SAVE_I	save	%r21, 0x0001, %r31
	.word 0xb5e520c5  ! 852: SAVE_I	save	%r20, 0x0001, %r26
hwintr_0_27:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_27), 16, 16)) -> intp(0, 0, 25)
hwintr_0_28:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_28), 16, 16)) -> intp(0, 0, 17)
	.word 0xbde5e09d  ! 858: SAVE_I	save	%r23, 0x0001, %r30
	.word 0x8d94e0b2  ! 860: WRPR_PSTATE_I	wrpr	%r19, 0x00b2, %pstate
	.word 0xbd34e001  ! 861: SRL_I	srl 	%r19, 0x0001, %r30
	.word 0x8995a026  ! 863: WRPR_TICK_I	wrpr	%r22, 0x0026, %tick
	.word 0xbcb58000  ! 867: ORNcc_R	orncc 	%r22, %r0, %r30
	.word 0xb9e4e056  ! 868: SAVE_I	save	%r19, 0x0001, %r28
	.word 0xb93cb001  ! 869: SRAX_I	srax	%r18, 0x0001, %r28
	.word 0xb12d4000  ! 870: SLL_R	sll 	%r21, %r0, %r24
	.word 0xb9e4a11f  ! 871: SAVE_I	save	%r18, 0x0001, %r28
	.word 0xb0a58000  ! 872: SUBcc_R	subcc 	%r22, %r0, %r24
	mov	2, %r12
	.word 0xa1930000  ! 873: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0x8794a0e8  ! 874: WRPR_TT_I	wrpr	%r18, 0x00e8, %tt
	.word 0xb7e4a068  ! 875: SAVE_I	save	%r18, 0x0001, %r27
hwintr_0_29:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_29), 16, 16)) -> intp(0, 0, 34)
	.word 0xbb510000  ! 878: RDPR_TICK	<illegal instruction>
	.word 0xb7e4e198  ! 880: SAVE_I	save	%r19, 0x0001, %r27
	.word 0xb7e4618c  ! 883: SAVE_I	save	%r17, 0x0001, %r27
	.word 0xb8c4a011  ! 885: ADDCcc_I	addccc 	%r18, 0x0011, %r28
	.word 0xb3500000  ! 886: RDPR_TPC	<illegal instruction>
	.word 0xb5e46173  ! 888: SAVE_I	save	%r17, 0x0001, %r26
hwintr_0_30:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_30), 16, 16)) -> intp(0, 0, 22)
	.word 0x899461b0  ! 893: WRPR_TICK_I	wrpr	%r17, 0x01b0, %tick
	.word 0xba950000  ! 898: ORcc_R	orcc 	%r20, %r0, %r29
hwintr_0_31:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_31), 16, 16)) -> intp(0, 0, 39)
	.word 0xb1e5214b  ! 903: SAVE_I	save	%r20, 0x0001, %r24
	setx	data_start_6, %g1, %r17
	.word 0xbe448000  ! 906: ADDC_R	addc 	%r18, %r0, %r31
	.word 0xb3e461f8  ! 907: SAVE_I	save	%r17, 0x0001, %r25
	setx	0x777c610a0000cd44, %g1, %r10
	.word 0x839a8000  ! 910: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
hwintr_0_32:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_32), 16, 16)) -> intp(0, 0, 26)
	.word 0xb9e4e137  ! 914: SAVE_I	save	%r19, 0x0001, %r28
	.word 0xb52c8000  ! 917: SLL_R	sll 	%r18, %r0, %r26
	.word 0xb5e4e145  ! 918: SAVE_I	save	%r19, 0x0001, %r26
	.word 0xbde560ea  ! 919: SAVE_I	save	%r21, 0x0001, %r30
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb53d2001  ! 922: SRA_I	sra 	%r20, 0x0001, %r26
	.word 0xbde4e06f  ! 926: SAVE_I	save	%r19, 0x0001, %r30
	.word 0xb7e5a0cb  ! 928: SAVE_I	save	%r22, 0x0001, %r27
	.word 0xbde56035  ! 929: SAVE_I	save	%r21, 0x0001, %r30
	.word 0xb01dc000  ! 930: XOR_R	xor 	%r23, %r0, %r24
	.word 0xbde5a1f4  ! 931: SAVE_I	save	%r22, 0x0001, %r30
hwintr_0_33:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_33), 16, 16)) -> intp(0, 0, 35)
	.word 0x8d9421dc  ! 936: WRPR_PSTATE_I	wrpr	%r16, 0x01dc, %pstate
hwintr_0_34:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_34), 16, 16)) -> intp(0, 0, 5)
	.word 0xb3e5a05f  ! 940: SAVE_I	save	%r22, 0x0001, %r25
	.word 0xb6b4614c  ! 942: SUBCcc_I	orncc 	%r17, 0x014c, %r27
	setx	data_start_1, %g1, %r19
	.word 0xbf510000  ! 948: RDPR_TICK	<illegal instruction>
	.word 0xb6350000  ! 952: SUBC_R	orn 	%r20, %r0, %r27
	.word 0xb9e5611e  ! 956: SAVE_I	save	%r21, 0x0001, %r28
	.word 0xb9e5a175  ! 957: SAVE_I	save	%r22, 0x0001, %r28
	setx	0xfe9da7710000dc9d, %g1, %r10
	.word 0x839a8000  ! 964: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb7e52165  ! 965: SAVE_I	save	%r20, 0x0001, %r27
	.word 0xbde5e08b  ! 966: SAVE_I	save	%r23, 0x0001, %r30
	.word 0xb1e56137  ! 968: SAVE_I	save	%r21, 0x0001, %r24
	.word 0xb9e4208c  ! 971: SAVE_I	save	%r16, 0x0001, %r28
	.word 0x8d9421f4  ! 973: WRPR_PSTATE_I	wrpr	%r16, 0x01f4, %pstate
	.word 0xb3480000  ! 975: RDHPR_HPSTATE	rdhpr	%hpstate, %r25
	.word 0xb1540000  ! 976: RDPR_GL	<illegal instruction>
	mov	0, %r12
	.word 0xa1930000  ! 977: WRPR_GL_R	wrpr	%r12, %r0, %-
	setx	data_start_2, %g1, %r23
	.word 0xb7e4203d  ! 981: SAVE_I	save	%r16, 0x0001, %r27
	.word 0xb7e5e000  ! 983: SAVE_I	save	%r23, 0x0001, %r27
	.word 0xb5510000  ! 986: RDPR_TICK	<illegal instruction>
	.word 0xb9358000  ! 987: SRL_R	srl 	%r22, %r0, %r28
	.word 0xb1e5a01a  ! 988: SAVE_I	save	%r22, 0x0001, %r24
hwintr_0_35:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_35), 16, 16)) -> intp(0, 0, 2a)
hwintr_0_36:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_36), 16, 16)) -> intp(0, 0, 1)
	.word 0xbde5618a  ! 993: SAVE_I	save	%r21, 0x0001, %r30
	.word 0xb3643801  ! 996: MOVcc_I	<illegal instruction>
	.word 0xb1e5616d  ! 997: SAVE_I	save	%r21, 0x0001, %r24
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
	setx	data_start_7, %g1, %r23
	setx	data_start_3, %g1, %r18
	.word 0x8d9520dc  ! 9: WRPR_PSTATE_I	wrpr	%r20, 0x00dc, %pstate
	.word 0xb33da001  ! 14: SRA_I	sra 	%r22, 0x0001, %r25
	.word 0xfc252082  ! 16: STW_I	stw	%r30, [%r20 + 0x0082]
	setx	0x7bf363c900009c9f, %g1, %r10
	.word 0x819a8000  ! 18: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
hwintr_3_0:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_0), 16, 16)) -> intp(3, 0, 17)
	.word 0xf2750000  ! 20: STX_R	stx	%r25, [%r20 + %r0]
	.word 0xba3da134  ! 22: XNOR_I	xnor 	%r22, 0x0134, %r29
	.word 0xf2354000  ! 26: STH_R	sth	%r25, [%r21 + %r0]
	.word 0xf4342065  ! 28: STH_I	sth	%r26, [%r16 + 0x0065]
	.word 0xf6248000  ! 30: STW_R	stw	%r27, [%r18 + %r0]
	.word 0x8995e04d  ! 31: WRPR_TICK_I	wrpr	%r23, 0x004d, %tick
	setx	0x11bab3a20000c910, %g1, %r10
	.word 0x839a8000  ! 32: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0x819521b2  ! 39: WRPR_TPC_I	wrpr	%r20, 0x01b2, %tpc
	.word 0xf8350000  ! 42: STH_R	sth	%r28, [%r20 + %r0]
	.word 0xf074616e  ! 45: STX_I	stx	%r24, [%r17 + 0x016e]
hwintr_3_1:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_1), 16, 16)) -> intp(3, 0, 21)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
hwintr_3_2:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_2), 16, 16)) -> intp(3, 0, 32)
	.word 0xb1508000  ! 50: RDPR_TSTATE	rdpr	%tstate, %r24
	.word 0x8794a1cc  ! 52: WRPR_TT_I	wrpr	%r18, 0x01cc, %tt
	.word 0xf6744000  ! 53: STX_R	stx	%r27, [%r17 + %r0]
	.word 0xf8348000  ! 56: STH_R	sth	%r28, [%r18 + %r0]
	setx	0x8e8685ec00009dc4, %g1, %r10
	.word 0x819a8000  ! 58: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xbd504000  ! 60: RDPR_TNPC	rdpr	%tnpc, %r30
hwintr_3_3:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_3), 16, 16)) -> intp(3, 0, 8)
hwintr_3_4:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_4), 16, 16)) -> intp(3, 0, 11)
	.word 0x839420c6  ! 74: WRPR_TNPC_I	wrpr	%r16, 0x00c6, %tnpc
hwintr_3_5:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_5), 16, 16)) -> intp(3, 0, 3b)
	.word 0xfa25e021  ! 77: STW_I	stw	%r29, [%r23 + 0x0021]
	.word 0x8195209d  ! 78: WRPR_TPC_I	wrpr	%r20, 0x009d, %tpc
	mov	2, %r12
	.word 0xa1930000  ! 82: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xbe350000  ! 84: SUBC_R	orn 	%r20, %r0, %r31
	.word 0xf874c000  ! 85: STX_R	stx	%r28, [%r19 + %r0]
	setx	data_start_4, %g1, %r19
	.word 0xfc74c000  ! 88: STX_R	stx	%r30, [%r19 + %r0]
	.word 0xf8740000  ! 91: STX_R	stx	%r28, [%r16 + %r0]
	.word 0xf63cc000  ! 93: STD_R	std	%r27, [%r19 + %r0]
	.word 0xf73d8000  ! 94: STDF_R	std	%f27, [%r0, %r22]
	.word 0xf235a0f3  ! 97: STH_I	sth	%r25, [%r22 + 0x00f3]
	.word 0xf275e0ea  ! 98: STX_I	stx	%r25, [%r23 + 0x00ea]
	.word 0xfe248000  ! 103: STW_R	stw	%r31, [%r18 + %r0]
	.word 0xf4250000  ! 106: STW_R	stw	%r26, [%r20 + %r0]
	.word 0xfb3d60cb  ! 107: STDF_I	std	%f29, [0x00cb, %r21]
	.word 0xfc34210f  ! 109: STH_I	sth	%r30, [%r16 + 0x010f]
	.word 0xf874c000  ! 111: STX_R	stx	%r28, [%r19 + %r0]
	.word 0xf434a1c6  ! 113: STH_I	sth	%r26, [%r18 + 0x01c6]
hwintr_3_6:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_6), 16, 16)) -> intp(3, 0, 39)
	.word 0xfa754000  ! 118: STX_R	stx	%r29, [%r21 + %r0]
	.word 0xf13c219f  ! 123: STDF_I	std	%f24, [0x019f, %r16]
	.word 0xb135e001  ! 124: SRL_I	srl 	%r23, 0x0001, %r24
	.word 0xbc946092  ! 130: ORcc_I	orcc 	%r17, 0x0092, %r30
	.word 0xfe2c603e  ! 131: STB_I	stb	%r31, [%r17 + 0x003e]
	.word 0xf93c0000  ! 136: STDF_R	std	%f28, [%r0, %r16]
	.word 0xf83de0dd  ! 137: STD_I	std	%r28, [%r23 + 0x00dd]
hwintr_3_7:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_7), 16, 16)) -> intp(3, 0, 3)
	.word 0xfa744000  ! 143: STX_R	stx	%r29, [%r17 + %r0]
	.word 0xf63cc000  ! 148: STD_R	std	%r27, [%r19 + %r0]
	.word 0xfc2c8000  ! 150: STB_R	stb	%r30, [%r18 + %r0]
	.word 0xf73ce117  ! 153: STDF_I	std	%f27, [0x0117, %r19]
	.word 0xf93dc000  ! 154: STDF_R	std	%f28, [%r0, %r23]
	.word 0xf83dc000  ! 159: STD_R	std	%r28, [%r23 + %r0]
	.word 0xf4356025  ! 160: STH_I	sth	%r26, [%r21 + 0x0025]
hwintr_3_8:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_8), 16, 16)) -> intp(3, 0, 6)
	.word 0xf035c000  ! 165: STH_R	sth	%r24, [%r23 + %r0]
	.word 0xfe2ca114  ! 166: STB_I	stb	%r31, [%r18 + 0x0114]
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf8740000  ! 174: STX_R	stx	%r28, [%r16 + %r0]
hwintr_3_9:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_9), 16, 16)) -> intp(3, 0, 28)
hwintr_3_10:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_10), 16, 16)) -> intp(3, 0, 34)
	.word 0xbd508000  ! 183: RDPR_TSTATE	rdpr	%tstate, %r30
	.word 0xb5500000  ! 193: RDPR_TPC	<illegal instruction>
	.word 0xf73da158  ! 197: STDF_I	std	%f27, [0x0158, %r22]
	.word 0xfe3c0000  ! 199: STD_R	std	%r31, [%r16 + %r0]
	.word 0xf02420a9  ! 200: STW_I	stw	%r24, [%r16 + 0x00a9]
	.word 0xb68d2180  ! 201: ANDcc_I	andcc 	%r20, 0x0180, %r27
hwintr_3_11:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_11), 16, 16)) -> intp(3, 0, 9)
hwintr_3_12:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_12), 16, 16)) -> intp(3, 0, 4)
	.word 0xba14e1d3  ! 207: OR_I	or 	%r19, 0x01d3, %r29
	setx	data_start_3, %g1, %r22
	.word 0xfa344000  ! 210: STH_R	sth	%r29, [%r17 + %r0]
	.word 0xf435e1b2  ! 212: STH_I	sth	%r26, [%r23 + 0x01b2]
	.word 0xfe3c2151  ! 213: STD_I	std	%r31, [%r16 + 0x0151]
	.word 0xf2248000  ! 215: STW_R	stw	%r25, [%r18 + %r0]
	.word 0x8794a1a7  ! 220: WRPR_TT_I	wrpr	%r18, 0x01a7, %tt
	.word 0xfa748000  ! 224: STX_R	stx	%r29, [%r18 + %r0]
	.word 0xf634a02f  ! 225: STH_I	sth	%r27, [%r18 + 0x002f]
	.word 0xf03560d9  ! 226: STH_I	sth	%r24, [%r21 + 0x00d9]
	.word 0xfb3d8000  ! 228: STDF_R	std	%f29, [%r0, %r22]
	.word 0x819460f2  ! 230: WRPR_TPC_I	wrpr	%r17, 0x00f2, %tpc
	.word 0x8595201d  ! 231: WRPR_TSTATE_I	wrpr	%r20, 0x001d, %tstate
	setx	data_start_2, %g1, %r20
	.word 0xfc2dc000  ! 234: STB_R	stb	%r30, [%r23 + %r0]
	.word 0xb1518000  ! 235: RDPR_PSTATE	rdpr	%pstate, %r24
	.word 0xfe3de199  ! 239: STD_I	std	%r31, [%r23 + 0x0199]
hwintr_3_13:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_13), 16, 16)) -> intp(3, 0, 3c)
	.word 0xf93cc000  ! 242: STDF_R	std	%f28, [%r0, %r19]
	.word 0xfd3c60af  ! 247: STDF_I	std	%f30, [0x00af, %r17]
	.word 0x8195e1d3  ! 252: WRPR_TPC_I	wrpr	%r23, 0x01d3, %tpc
	.word 0xba8d60c7  ! 256: ANDcc_I	andcc 	%r21, 0x00c7, %r29
	setx	data_start_6, %g1, %r22
	.word 0xf8248000  ! 260: STW_R	stw	%r28, [%r18 + %r0]
	.word 0xf2348000  ! 261: STH_R	sth	%r25, [%r18 + %r0]
	.word 0xb03dc000  ! 269: XNOR_R	xnor 	%r23, %r0, %r24
	.word 0xf6758000  ! 270: STX_R	stx	%r27, [%r22 + %r0]
	.word 0xf0340000  ! 271: STH_R	sth	%r24, [%r16 + %r0]
hwintr_3_14:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_14), 16, 16)) -> intp(3, 0, 4)
	.word 0xbf504000  ! 286: RDPR_TNPC	rdpr	%tnpc, %r31
	.word 0xf824e01f  ! 287: STW_I	stw	%r28, [%r19 + 0x001f]
	.word 0xf2252028  ! 291: STW_I	stw	%r25, [%r20 + 0x0028]
	.word 0xf025a198  ! 295: STW_I	stw	%r24, [%r22 + 0x0198]
	.word 0xf82ce1ab  ! 296: STB_I	stb	%r28, [%r19 + 0x01ab]
	mov	1, %r12
	.word 0xa1930000  ! 301: WRPR_GL_R	wrpr	%r12, %r0, %-
	setx	data_start_5, %g1, %r18
	.word 0xb13c2001  ! 311: SRA_I	sra 	%r16, 0x0001, %r24
	.word 0xf074a0e6  ! 313: STX_I	stx	%r24, [%r18 + 0x00e6]
	.word 0xf13c0000  ! 316: STDF_R	std	%f24, [%r0, %r16]
	.word 0xf13d8000  ! 324: STDF_R	std	%f24, [%r0, %r22]
	.word 0xf62d0000  ! 329: STB_R	stb	%r27, [%r20 + %r0]
	.word 0xbd51c000  ! 333: RDPR_TL	rdpr	%tl, %r30
hwintr_3_15:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_15), 16, 16)) -> intp(3, 0, 5)
	.word 0xbf520000  ! 339: RDPR_PIL	<illegal instruction>
	.word 0xf234e0af  ! 340: STH_I	sth	%r25, [%r19 + 0x00af]
	.word 0xfa3c4000  ! 341: STD_R	std	%r29, [%r17 + %r0]
	.word 0xb9518000  ! 344: RDPR_PSTATE	<illegal instruction>
	.word 0xbd500000  ! 348: RDPR_TPC	<illegal instruction>
	setx	data_start_7, %g1, %r17
	.word 0xfa2c8000  ! 354: STB_R	stb	%r29, [%r18 + %r0]
	.word 0xfe3cc000  ! 355: STD_R	std	%r31, [%r19 + %r0]
	setx	data_start_0, %g1, %r18
	.word 0xf075a13f  ! 358: STX_I	stx	%r24, [%r22 + 0x013f]
	setx	0xfbeb42f400008cc0, %g1, %r10
	.word 0x839a8000  ! 362: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	mov	2, %r12
	.word 0x8f930000  ! 364: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xbe254000  ! 365: SUB_R	sub 	%r21, %r0, %r31
	.word 0xf42cc000  ! 367: STB_R	stb	%r26, [%r19 + %r0]
	.word 0x859560de  ! 372: WRPR_TSTATE_I	wrpr	%r21, 0x00de, %tstate
	.word 0xfa258000  ! 374: STW_R	stw	%r29, [%r22 + %r0]
	.word 0xf53ce0c9  ! 377: STDF_I	std	%f26, [0x00c9, %r19]
	.word 0xb8bc4000  ! 378: XNORcc_R	xnorcc 	%r17, %r0, %r28
	.word 0xfe2c4000  ! 379: STB_R	stb	%r31, [%r17 + %r0]
	.word 0xfb3c0000  ! 381: STDF_R	std	%f29, [%r0, %r16]
	.word 0xb1520000  ! 386: RDPR_PIL	rdpr	%pil, %r24
	.word 0x91952068  ! 388: WRPR_PIL_I	wrpr	%r20, 0x0068, %pil
	.word 0xb53d9000  ! 389: SRAX_R	srax	%r22, %r0, %r26
	.word 0x819461e3  ! 391: WRPR_TPC_I	wrpr	%r17, 0x01e3, %tpc
	setx	data_start_1, %g1, %r20
	.word 0x8d95e1f6  ! 394: WRPR_PSTATE_I	wrpr	%r23, 0x01f6, %pstate
	.word 0xb5500000  ! 397: RDPR_TPC	rdpr	%tpc, %r26
	.word 0xfc344000  ! 399: STH_R	sth	%r30, [%r17 + %r0]
	.word 0xb2ac202b  ! 400: ANDNcc_I	andncc 	%r16, 0x002b, %r25
	.word 0xf824204c  ! 407: STW_I	stw	%r28, [%r16 + 0x004c]
	.word 0xb6b58000  ! 411: ORNcc_R	orncc 	%r22, %r0, %r27
	.word 0xfc254000  ! 413: STW_R	stw	%r30, [%r21 + %r0]
	.word 0xb3510000  ! 415: RDPR_TICK	<illegal instruction>
	setx	data_start_4, %g1, %r22
	.word 0xb9480000  ! 417: RDHPR_HPSTATE	rdhpr	%hpstate, %r28
	.word 0xf62ce1af  ! 427: STB_I	stb	%r27, [%r19 + 0x01af]
	.word 0xfe254000  ! 428: STW_R	stw	%r31, [%r21 + %r0]
	.word 0xf23d8000  ! 430: STD_R	std	%r25, [%r22 + %r0]
	.word 0xf2756171  ! 431: STX_I	stx	%r25, [%r21 + 0x0171]
	.word 0xf62c61b8  ! 434: STB_I	stb	%r27, [%r17 + 0x01b8]
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xbd500000  ! 438: RDPR_TPC	<illegal instruction>
	setx	data_start_0, %g1, %r20
	mov	2, %r12
	.word 0xa1930000  ! 440: WRPR_GL_R	wrpr	%r12, %r0, %-
	setx	data_start_2, %g1, %r23
	.word 0xbf510000  ! 443: RDPR_TICK	rdpr	%tick, %r31
	.word 0xf034e167  ! 444: STH_I	sth	%r24, [%r19 + 0x0167]
	.word 0xf025a189  ! 445: STW_I	stw	%r24, [%r22 + 0x0189]
	.word 0xf02de159  ! 446: STB_I	stb	%r24, [%r23 + 0x0159]
hwintr_3_16:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_16), 16, 16)) -> intp(3, 0, 26)
	.word 0xfa34e151  ! 454: STH_I	sth	%r29, [%r19 + 0x0151]
	.word 0xf93d8000  ! 459: STDF_R	std	%f28, [%r0, %r22]
	.word 0xf274e1f1  ! 460: STX_I	stx	%r25, [%r19 + 0x01f1]
hwintr_3_17:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_17), 16, 16)) -> intp(3, 0, 2b)
	.word 0x899560bf  ! 470: WRPR_TICK_I	wrpr	%r21, 0x00bf, %tick
	.word 0xf834a168  ! 473: STH_I	sth	%r28, [%r18 + 0x0168]
	.word 0x9194a050  ! 474: WRPR_PIL_I	wrpr	%r18, 0x0050, %pil
	.word 0xfc24212f  ! 475: STW_I	stw	%r30, [%r16 + 0x012f]
	mov	1, %r12
	.word 0x8f930000  ! 476: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xf835206c  ! 478: STH_I	sth	%r28, [%r20 + 0x006c]
	.word 0xfa3d20b6  ! 480: STD_I	std	%r29, [%r20 + 0x00b6]
	.word 0xf6342155  ! 481: STH_I	sth	%r27, [%r16 + 0x0155]
	.word 0xbb500000  ! 485: RDPR_TPC	rdpr	%tpc, %r29
	.word 0xf0350000  ! 488: STH_R	sth	%r24, [%r20 + %r0]
	.word 0xfe34c000  ! 489: STH_R	sth	%r31, [%r19 + %r0]
	.word 0xf02c4000  ! 491: STB_R	stb	%r24, [%r17 + %r0]
	.word 0xfa2de164  ! 493: STB_I	stb	%r29, [%r23 + 0x0164]
	.word 0xbd540000  ! 494: RDPR_GL	<illegal instruction>
	.word 0xb7510000  ! 496: RDPR_TICK	<illegal instruction>
	.word 0xfc348000  ! 499: STH_R	sth	%r30, [%r18 + %r0]
	.word 0x87942002  ! 500: WRPR_TT_I	wrpr	%r16, 0x0002, %tt
hwintr_3_18:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_18), 16, 16)) -> intp(3, 0, 3d)
	.word 0xbd7c8400  ! 505: MOVR_R	movre	%r18, %r0, %r30
	.word 0x87942120  ! 515: WRPR_TT_I	wrpr	%r16, 0x0120, %tt
	.word 0xbf51c000  ! 520: RDPR_TL	rdpr	%tl, %r31
	.word 0xfa25214e  ! 524: STW_I	stw	%r29, [%r20 + 0x014e]
	.word 0xf13d0000  ! 526: STDF_R	std	%f24, [%r0, %r20]
	mov	1, %r12
	.word 0x8f930000  ! 527: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xbf508000  ! 534: RDPR_TSTATE	rdpr	%tstate, %r31
	.word 0xf2358000  ! 535: STH_R	sth	%r25, [%r22 + %r0]
hwintr_3_19:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_19), 16, 16)) -> intp(3, 0, 3)
	.word 0xbe350000  ! 538: ORN_R	orn 	%r20, %r0, %r31
	.word 0x8395e132  ! 541: WRPR_TNPC_I	wrpr	%r23, 0x0132, %tnpc
	.word 0xf2754000  ! 545: STX_R	stx	%r25, [%r21 + %r0]
	.word 0xfa3ce0bf  ! 547: STD_I	std	%r29, [%r19 + 0x00bf]
	.word 0x8795e073  ! 549: WRPR_TT_I	wrpr	%r23, 0x0073, %tt
	.word 0xf03cc000  ! 551: STD_R	std	%r24, [%r19 + %r0]
	mov	1, %r12
	.word 0x8f930000  ! 554: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xfe2c4000  ! 559: STB_R	stb	%r31, [%r17 + %r0]
hwintr_3_20:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_20), 16, 16)) -> intp(3, 0, 11)
	.word 0xf824213e  ! 565: STW_I	stw	%r28, [%r16 + 0x013e]
	.word 0x81952188  ! 567: WRPR_TPC_I	wrpr	%r20, 0x0188, %tpc
	.word 0xb3480000  ! 569: RDHPR_HPSTATE	rdhpr	%hpstate, %r25
	.word 0xfc340000  ! 570: STH_R	sth	%r30, [%r16 + %r0]
	.word 0xb57d6401  ! 572: MOVR_I	movre	%r21, 0x1, %r26
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xf424a189  ! 579: STW_I	stw	%r26, [%r18 + 0x0189]
	.word 0xfb3c4000  ! 584: STDF_R	std	%f29, [%r0, %r17]
	.word 0xb89d4000  ! 595: XORcc_R	xorcc 	%r21, %r0, %r28
	.word 0xf82c0000  ! 596: STB_R	stb	%r28, [%r16 + %r0]
	setx	0x615132780000b954, %g1, %r10
	.word 0x819a8000  ! 597: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xb69c4000  ! 598: XORcc_R	xorcc 	%r17, %r0, %r27
	.word 0xfa35e054  ! 601: STH_I	sth	%r29, [%r23 + 0x0054]
	.word 0xb5480000  ! 603: RDHPR_HPSTATE	rdhpr	%hpstate, %r26
	.word 0xfc2c20bb  ! 605: STB_I	stb	%r30, [%r16 + 0x00bb]
	.word 0xf2746136  ! 606: STX_I	stx	%r25, [%r17 + 0x0136]
	.word 0xb7500000  ! 611: RDPR_TPC	<illegal instruction>
	.word 0xfe2c8000  ! 613: STB_R	stb	%r31, [%r18 + %r0]
	.word 0xfc258000  ! 616: STW_R	stw	%r30, [%r22 + %r0]
	.word 0xb0b44000  ! 619: ORNcc_R	orncc 	%r17, %r0, %r24
	.word 0xb60460d1  ! 620: ADD_I	add 	%r17, 0x00d1, %r27
	.word 0xf53c4000  ! 623: STDF_R	std	%f26, [%r0, %r17]
	.word 0x8795e0fc  ! 624: WRPR_TT_I	wrpr	%r23, 0x00fc, %tt
	.word 0xf33d0000  ! 625: STDF_R	std	%f25, [%r0, %r20]
	.word 0xb37de401  ! 626: MOVR_I	movre	%r23, 0x1, %r25
	.word 0xf03421a4  ! 632: STH_I	sth	%r24, [%r16 + 0x01a4]
	.word 0xfe24c000  ! 639: STW_R	stw	%r31, [%r19 + %r0]
	.word 0xf83d2047  ! 640: STD_I	std	%r28, [%r20 + 0x0047]
	.word 0xf02d204b  ! 642: STB_I	stb	%r24, [%r20 + 0x004b]
	.word 0xf82d4000  ! 646: STB_R	stb	%r28, [%r21 + %r0]
	.word 0xb02de1f2  ! 648: ANDN_I	andn 	%r23, 0x01f2, %r24
	.word 0xf674a1ee  ! 649: STX_I	stx	%r27, [%r18 + 0x01ee]
	.word 0xf82c0000  ! 651: STB_R	stb	%r28, [%r16 + %r0]
	.word 0x9195e1e8  ! 653: WRPR_PIL_I	wrpr	%r23, 0x01e8, %pil
	.word 0xb1500000  ! 656: RDPR_TPC	rdpr	%tpc, %r24
	.word 0xf02cc000  ! 657: STB_R	stb	%r24, [%r19 + %r0]
	.word 0xf634e0c9  ! 658: STH_I	sth	%r27, [%r19 + 0x00c9]
	.word 0xb551c000  ! 660: RDPR_TL	<illegal instruction>
	.word 0xbb510000  ! 663: RDPR_TICK	<illegal instruction>
	.word 0xf075c000  ! 666: STX_R	stx	%r24, [%r23 + %r0]
hwintr_3_21:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_21), 16, 16)) -> intp(3, 0, b)
	.word 0x8594e1b2  ! 671: WRPR_TSTATE_I	wrpr	%r19, 0x01b2, %tstate
	.word 0xf13d6039  ! 672: STDF_I	std	%f24, [0x0039, %r21]
	setx	0x862350840000ea92, %g1, %r10
	.word 0x819a8000  ! 677: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xf33c21c0  ! 682: STDF_I	std	%f25, [0x01c0, %r16]
hwintr_3_22:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_22), 16, 16)) -> intp(3, 0, 5)
	.word 0xb6356070  ! 690: SUBC_I	orn 	%r21, 0x0070, %r27
	.word 0xb7540000  ! 691: RDPR_GL	rdpr	%-, %r27
	setx	data_start_0, %g1, %r17
	mov	2, %r12
	.word 0x8f930000  ! 695: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xfc2de1ae  ! 697: STB_I	stb	%r30, [%r23 + 0x01ae]
	.word 0xb950c000  ! 700: RDPR_TT	rdpr	%tt, %r28
	.word 0xfa35c000  ! 701: STH_R	sth	%r29, [%r23 + %r0]
	.word 0xf434e17f  ! 702: STH_I	sth	%r26, [%r19 + 0x017f]
	setx	data_start_2, %g1, %r20
hwintr_3_23:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_23), 16, 16)) -> intp(3, 0, 12)
	.word 0xb08c8000  ! 714: ANDcc_R	andcc 	%r18, %r0, %r24
	.word 0xf02d4000  ! 715: STB_R	stb	%r24, [%r21 + %r0]
	.word 0xb1350000  ! 716: SRL_R	srl 	%r20, %r0, %r24
	.word 0xb40de028  ! 722: AND_I	and 	%r23, 0x0028, %r26
	.word 0xba94e05d  ! 723: ORcc_I	orcc 	%r19, 0x005d, %r29
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xf4348000  ! 737: STH_R	sth	%r26, [%r18 + %r0]
	.word 0xb551c000  ! 739: RDPR_TL	rdpr	%tl, %r26
	.word 0xbf35e001  ! 742: SRL_I	srl 	%r23, 0x0001, %r31
	.word 0xbabc21e4  ! 744: XNORcc_I	xnorcc 	%r16, 0x01e4, %r29
	.word 0xb0b4c000  ! 747: SUBCcc_R	orncc 	%r19, %r0, %r24
	.word 0xfa2461ef  ! 748: STW_I	stw	%r29, [%r17 + 0x01ef]
	.word 0xf634a05a  ! 749: STH_I	sth	%r27, [%r18 + 0x005a]
	.word 0xf475214d  ! 753: STX_I	stx	%r26, [%r20 + 0x014d]
hwintr_3_24:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_24), 16, 16)) -> intp(3, 0, 1)
	.word 0xf82d4000  ! 757: STB_R	stb	%r28, [%r21 + %r0]
	.word 0xf42d6099  ! 760: STB_I	stb	%r26, [%r21 + 0x0099]
	.word 0xb41c0000  ! 761: XOR_R	xor 	%r16, %r0, %r26
	.word 0xf2354000  ! 766: STH_R	sth	%r25, [%r21 + %r0]
	.word 0xfe75205f  ! 768: STX_I	stx	%r31, [%r20 + 0x005f]
	.word 0xfa2ca0f4  ! 769: STB_I	stb	%r29, [%r18 + 0x00f4]
	.word 0xba958000  ! 772: ORcc_R	orcc 	%r22, %r0, %r29
	.word 0xf0752076  ! 774: STX_I	stx	%r24, [%r20 + 0x0076]
	.word 0xf6254000  ! 781: STW_R	stw	%r27, [%r21 + %r0]
	.word 0xfe748000  ! 782: STX_R	stx	%r31, [%r18 + %r0]
	.word 0xb1520000  ! 784: RDPR_PIL	<illegal instruction>
	.word 0xfa354000  ! 785: STH_R	sth	%r29, [%r21 + %r0]
	.word 0xf834a099  ! 788: STH_I	sth	%r28, [%r18 + 0x0099]
	.word 0xf23d0000  ! 789: STD_R	std	%r25, [%r20 + %r0]
	.word 0xf73c2143  ! 790: STDF_I	std	%f27, [0x0143, %r16]
	setx	data_start_1, %g1, %r18
	.word 0xf62c20f6  ! 793: STB_I	stb	%r27, [%r16 + 0x00f6]
	setx	0x708971db00000e84, %g1, %r10
	.word 0x839a8000  ! 795: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xfc754000  ! 796: STX_R	stx	%r30, [%r21 + %r0]
	.word 0x899460e7  ! 799: WRPR_TICK_I	wrpr	%r17, 0x00e7, %tick
	.word 0xb37cc400  ! 803: MOVR_R	movre	%r19, %r0, %r25
	.word 0xf634a104  ! 805: STH_I	sth	%r27, [%r18 + 0x0104]
hwintr_3_25:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_25), 16, 16)) -> intp(3, 0, 1e)
hwintr_3_26:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_26), 16, 16)) -> intp(3, 0, 26)
	setx	data_start_7, %g1, %r17
	.word 0xbabda006  ! 812: XNORcc_I	xnorcc 	%r22, 0x0006, %r29
	setx	0x98e0003f0000bfcc, %g1, %r10
	.word 0x839a8000  ! 815: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xf4342170  ! 816: STH_I	sth	%r26, [%r16 + 0x0170]
	.word 0xf82c0000  ! 818: STB_R	stb	%r28, [%r16 + %r0]
	setx	0xe32fa62300002d9b, %g1, %r10
	.word 0x819a8000  ! 822: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xfc354000  ! 824: STH_R	sth	%r30, [%r21 + %r0]
	.word 0xfa24e086  ! 825: STW_I	stw	%r29, [%r19 + 0x0086]
	.word 0x8d94e0e0  ! 835: WRPR_PSTATE_I	wrpr	%r19, 0x00e0, %pstate
	.word 0xfe7560f0  ! 837: STX_I	stx	%r31, [%r21 + 0x00f0]
	.word 0xf824a18d  ! 839: STW_I	stw	%r28, [%r18 + 0x018d]
	.word 0x8195607b  ! 841: WRPR_TPC_I	wrpr	%r21, 0x007b, %tpc
	.word 0x8395a0ea  ! 843: WRPR_TNPC_I	wrpr	%r22, 0x00ea, %tnpc
	.word 0xbb50c000  ! 844: RDPR_TT	rdpr	%tt, %r29
	.word 0xf275a030  ! 846: STX_I	stx	%r25, [%r22 + 0x0030]
	.word 0xfc3ce1b2  ! 849: STD_I	std	%r30, [%r19 + 0x01b2]
	.word 0xf83c6064  ! 851: STD_I	std	%r28, [%r17 + 0x0064]
hwintr_3_27:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_27), 16, 16)) -> intp(3, 0, 1d)
	.word 0xfe35200b  ! 854: STH_I	sth	%r31, [%r20 + 0x000b]
hwintr_3_28:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_28), 16, 16)) -> intp(3, 0, 3d)
	.word 0xf73c20c3  ! 856: STDF_I	std	%f27, [0x00c3, %r16]
	.word 0x8d94a07d  ! 860: WRPR_PSTATE_I	wrpr	%r18, 0x007d, %pstate
	.word 0xbb34e001  ! 861: SRL_I	srl 	%r19, 0x0001, %r29
	.word 0xfa34e06a  ! 862: STH_I	sth	%r29, [%r19 + 0x006a]
	.word 0x8994205d  ! 863: WRPR_TICK_I	wrpr	%r16, 0x005d, %tick
	.word 0xb8b48000  ! 867: ORNcc_R	orncc 	%r18, %r0, %r28
	.word 0xb93db001  ! 869: SRAX_I	srax	%r22, 0x0001, %r28
	.word 0xb92c4000  ! 870: SLL_R	sll 	%r17, %r0, %r28
	.word 0xb8a5c000  ! 872: SUBcc_R	subcc 	%r23, %r0, %r28
	mov	2, %r12
	.word 0xa1930000  ! 873: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0x879521f5  ! 874: WRPR_TT_I	wrpr	%r20, 0x01f5, %tt
	.word 0xf43c8000  ! 876: STD_R	std	%r26, [%r18 + %r0]
hwintr_3_29:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_29), 16, 16)) -> intp(3, 0, 3e)
	.word 0xb1510000  ! 878: RDPR_TICK	rdpr	%tick, %r24
	.word 0xb8c5a12f  ! 885: ADDCcc_I	addccc 	%r22, 0x012f, %r28
	.word 0xb1500000  ! 886: RDPR_TPC	<illegal instruction>
hwintr_3_30:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_30), 16, 16)) -> intp(3, 0, 1a)
	.word 0xf224e025  ! 892: STW_I	stw	%r25, [%r19 + 0x0025]
	.word 0x8995e008  ! 893: WRPR_TICK_I	wrpr	%r23, 0x0008, %tick
	.word 0xfe3cc000  ! 894: STD_R	std	%r31, [%r19 + %r0]
	.word 0xba954000  ! 898: ORcc_R	orcc 	%r21, %r0, %r29
hwintr_3_31:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_31), 16, 16)) -> intp(3, 0, 10)
	setx	data_start_0, %g1, %r20
	.word 0xbc448000  ! 906: ADDC_R	addc 	%r18, %r0, %r30
	.word 0xf224a08d  ! 909: STW_I	stw	%r25, [%r18 + 0x008d]
	setx	0x75deb0f50000cb18, %g1, %r10
	.word 0x839a8000  ! 910: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
hwintr_3_32:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_32), 16, 16)) -> intp(3, 0, 1c)
	.word 0xf42c2152  ! 912: STB_I	stb	%r26, [%r16 + 0x0152]
	.word 0xfe754000  ! 916: STX_R	stx	%r31, [%r21 + %r0]
	.word 0xb72d4000  ! 917: SLL_R	sll 	%r21, %r0, %r27
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb73ca001  ! 922: SRA_I	sra 	%r18, 0x0001, %r27
	.word 0xf73d61b2  ! 924: STDF_I	std	%f27, [0x01b2, %r21]
	.word 0xf13cc000  ! 927: STDF_R	std	%f24, [%r0, %r19]
	.word 0xb41dc000  ! 930: XOR_R	xor 	%r23, %r0, %r26
	.word 0xf73de10e  ! 932: STDF_I	std	%f27, [0x010e, %r23]
hwintr_3_33:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_33), 16, 16)) -> intp(3, 0, 1d)
	.word 0x8d9421b9  ! 936: WRPR_PSTATE_I	wrpr	%r16, 0x01b9, %pstate
	.word 0xf234c000  ! 937: STH_R	sth	%r25, [%r19 + %r0]
hwintr_3_34:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_34), 16, 16)) -> intp(3, 0, 35)
	.word 0xb6b4a15f  ! 942: SUBCcc_I	orncc 	%r18, 0x015f, %r27
	.word 0xf0750000  ! 943: STX_R	stx	%r24, [%r20 + %r0]
	.word 0xfe340000  ! 946: STH_R	sth	%r31, [%r16 + %r0]
	setx	data_start_6, %g1, %r18
	.word 0xbb510000  ! 948: RDPR_TICK	rdpr	%tick, %r29
	.word 0xb6348000  ! 952: SUBC_R	orn 	%r18, %r0, %r27
	.word 0xf93c0000  ! 960: STDF_R	std	%f28, [%r0, %r16]
	.word 0xf274211e  ! 962: STX_I	stx	%r25, [%r16 + 0x011e]
	setx	0xcf10f57300009b9a, %g1, %r10
	.word 0x839a8000  ! 964: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xf6744000  ! 967: STX_R	stx	%r27, [%r17 + %r0]
	.word 0xf634a1ee  ! 969: STH_I	sth	%r27, [%r18 + 0x01ee]
	.word 0x8d94e17f  ! 973: WRPR_PSTATE_I	wrpr	%r19, 0x017f, %pstate
	.word 0xbd480000  ! 975: RDHPR_HPSTATE	rdhpr	%hpstate, %r30
	.word 0xbd540000  ! 976: RDPR_GL	<illegal instruction>
	mov	2, %r12
	.word 0xa1930000  ! 977: WRPR_GL_R	wrpr	%r12, %r0, %-
	setx	data_start_0, %g1, %r18
	.word 0xf475615b  ! 980: STX_I	stx	%r26, [%r21 + 0x015b]
	.word 0xbb510000  ! 986: RDPR_TICK	rdpr	%tick, %r29
	.word 0xbf340000  ! 987: SRL_R	srl 	%r16, %r0, %r31
hwintr_3_35:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_35), 16, 16)) -> intp(3, 0, 16)
	.word 0xff3d61fc  ! 990: STDF_I	std	%f31, [0x01fc, %r21]
hwintr_3_36:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_36), 16, 16)) -> intp(3, 0, 1a)
	.word 0xfa74611f  ! 994: STX_I	stx	%r29, [%r17 + 0x011f]
	.word 0xb1643801  ! 996: MOVcc_I	<illegal instruction>
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
	.word 0xf6150000  ! 1: LDUH_R	lduh	[%r20 + %r0], %r27
	setx	data_start_6, %g1, %r19
	.word 0xf11c0000  ! 3: LDDF_R	ldd	[%r16, %r0], %f24
	setx	data_start_5, %g1, %r17
	.word 0xfc154000  ! 5: LDUH_R	lduh	[%r21 + %r0], %r30
	.word 0xf80d61d2  ! 6: LDUB_I	ldub	[%r21 + 0x01d2], %r28
	.word 0x8d94208a  ! 9: WRPR_PSTATE_I	wrpr	%r16, 0x008a, %pstate
	.word 0xf0544000  ! 11: LDSH_R	ldsh	[%r17 + %r0], %r24
	.word 0xb53c2001  ! 14: SRA_I	sra 	%r16, 0x0001, %r26
	.word 0xf64dc000  ! 17: LDSB_R	ldsb	[%r23 + %r0], %r27
	setx	0x5af37cf20000bada, %g1, %r10
	.word 0x819a8000  ! 18: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
hwintr_2_0:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_0), 16, 16)) -> intp(2, 0, 23)
	.word 0xb43d204e  ! 22: XNOR_I	xnor 	%r20, 0x004e, %r26
	.word 0xf65ca02f  ! 24: LDX_I	ldx	[%r18 + 0x002f], %r27
	.word 0x89942080  ! 31: WRPR_TICK_I	wrpr	%r16, 0x0080, %tick
	setx	0xf6fb892a00007ec8, %g1, %r10
	.word 0x839a8000  ! 32: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0x8194a030  ! 39: WRPR_TPC_I	wrpr	%r18, 0x0030, %tpc
	.word 0xfe144000  ! 40: LDUH_R	lduh	[%r17 + %r0], %r31
	.word 0xf44d8000  ! 41: LDSB_R	ldsb	[%r22 + %r0], %r26
	.word 0xfa150000  ! 44: LDUH_R	lduh	[%r20 + %r0], %r29
hwintr_2_1:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_1), 16, 16)) -> intp(2, 0, 18)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xfc5c2136  ! 48: LDX_I	ldx	[%r16 + 0x0136], %r30
hwintr_2_2:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_2), 16, 16)) -> intp(2, 0, 29)
	.word 0xbb508000  ! 50: RDPR_TSTATE	<illegal instruction>
	.word 0xf60521c7  ! 51: LDUW_I	lduw	[%r20 + 0x01c7], %r27
	.word 0x87942037  ! 52: WRPR_TT_I	wrpr	%r16, 0x0037, %tt
	.word 0xfc05c000  ! 54: LDUW_R	lduw	[%r23 + %r0], %r30
	.word 0xf855c000  ! 57: LDSH_R	ldsh	[%r23 + %r0], %r28
	setx	0x7eac9ec00001a18, %g1, %r10
	.word 0x819a8000  ! 58: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xbd504000  ! 60: RDPR_TNPC	<illegal instruction>
hwintr_2_3:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_3), 16, 16)) -> intp(2, 0, 18)
hwintr_2_4:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_4), 16, 16)) -> intp(2, 0, 1e)
	.word 0xfe5de180  ! 65: LDX_I	ldx	[%r23 + 0x0180], %r31
	.word 0xfe5d0000  ! 69: LDX_R	ldx	[%r20 + %r0], %r31
	.word 0xf25d6135  ! 72: LDX_I	ldx	[%r21 + 0x0135], %r25
	.word 0x8394210e  ! 74: WRPR_TNPC_I	wrpr	%r16, 0x010e, %tnpc
hwintr_2_5:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_5), 16, 16)) -> intp(2, 0, 1c)
	.word 0x81956163  ! 78: WRPR_TPC_I	wrpr	%r21, 0x0163, %tpc
	.word 0xf31c0000  ! 79: LDDF_R	ldd	[%r16, %r0], %f25
	mov	1, %r12
	.word 0xa1930000  ! 82: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb635c000  ! 84: SUBC_R	orn 	%r23, %r0, %r27
	setx	data_start_6, %g1, %r18
	.word 0xf64c0000  ! 87: LDSB_R	ldsb	[%r16 + %r0], %r27
	.word 0xf4058000  ! 89: LDUW_R	lduw	[%r22 + %r0], %r26
	.word 0xf845a108  ! 100: LDSW_I	ldsw	[%r22 + 0x0108], %r28
	.word 0xf44cc000  ! 102: LDSB_R	ldsb	[%r19 + %r0], %r26
	.word 0xfe1c0000  ! 108: LDD_R	ldd	[%r16 + %r0], %r31
	.word 0xf64c8000  ! 110: LDSB_R	ldsb	[%r18 + %r0], %r27
	.word 0xf0544000  ! 112: LDSH_R	ldsh	[%r17 + %r0], %r24
hwintr_2_6:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_6), 16, 16)) -> intp(2, 0, c)
	.word 0xf0150000  ! 120: LDUH_R	lduh	[%r20 + %r0], %r24
	.word 0xb735e001  ! 124: SRL_I	srl 	%r23, 0x0001, %r27
	.word 0xfa5ca134  ! 126: LDX_I	ldx	[%r18 + 0x0134], %r29
	.word 0xf91d8000  ! 128: LDDF_R	ldd	[%r22, %r0], %f28
	.word 0xb295a0d0  ! 130: ORcc_I	orcc 	%r22, 0x00d0, %r25
	.word 0xfc55c000  ! 138: LDSH_R	ldsh	[%r23 + %r0], %r30
	.word 0xf24cc000  ! 139: LDSB_R	ldsb	[%r19 + %r0], %r25
hwintr_2_7:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_7), 16, 16)) -> intp(2, 0, 21)
	.word 0xf91ce137  ! 151: LDDF_I	ldd	[%r19, 0x0137], %f28
hwintr_2_8:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_8), 16, 16)) -> intp(2, 0, 2c)
	.word 0xfa154000  ! 163: LDUH_R	lduh	[%r21 + %r0], %r29
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xfe0d60c0  ! 170: LDUB_I	ldub	[%r21 + 0x00c0], %r31
	.word 0xfe15e00c  ! 172: LDUH_I	lduh	[%r23 + 0x000c], %r31
hwintr_2_9:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_9), 16, 16)) -> intp(2, 0, 3e)
	.word 0xfc0421ab  ! 177: LDUW_I	lduw	[%r16 + 0x01ab], %r30
	.word 0xf25421b4  ! 178: LDSH_I	ldsh	[%r16 + 0x01b4], %r25
	.word 0xf2054000  ! 179: LDUW_R	lduw	[%r21 + %r0], %r25
	.word 0xf71c6159  ! 181: LDDF_I	ldd	[%r17, 0x0159], %f27
hwintr_2_10:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_10), 16, 16)) -> intp(2, 0, 20)
	.word 0xbb508000  ! 183: RDPR_TSTATE	<illegal instruction>
	.word 0xfb1d60ba  ! 185: LDDF_I	ldd	[%r21, 0x00ba], %f29
	.word 0xf81ce0b7  ! 187: LDD_I	ldd	[%r19 + 0x00b7], %r28
	.word 0xf60ca092  ! 192: LDUB_I	ldub	[%r18 + 0x0092], %r27
	.word 0xbf500000  ! 193: RDPR_TPC	<illegal instruction>
	.word 0xf844a199  ! 194: LDSW_I	ldsw	[%r18 + 0x0199], %r28
	.word 0xfb1dc000  ! 196: LDDF_R	ldd	[%r23, %r0], %f29
	.word 0xfd1c8000  ! 198: LDDF_R	ldd	[%r18, %r0], %f30
	.word 0xb48d20e0  ! 201: ANDcc_I	andcc 	%r20, 0x00e0, %r26
hwintr_2_11:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_11), 16, 16)) -> intp(2, 0, 23)
hwintr_2_12:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_12), 16, 16)) -> intp(2, 0, 10)
	.word 0xb6142025  ! 207: OR_I	or 	%r16, 0x0025, %r27
	setx	data_start_5, %g1, %r20
	.word 0x8794e1b6  ! 220: WRPR_TT_I	wrpr	%r19, 0x01b6, %tt
	.word 0xf20c211f  ! 221: LDUB_I	ldub	[%r16 + 0x011f], %r25
	.word 0x81946133  ! 230: WRPR_TPC_I	wrpr	%r17, 0x0133, %tpc
	.word 0x85942018  ! 231: WRPR_TSTATE_I	wrpr	%r16, 0x0018, %tstate
	setx	data_start_5, %g1, %r20
	.word 0xbf518000  ! 235: RDPR_PSTATE	<illegal instruction>
	.word 0xfa0ce03a  ! 237: LDUB_I	ldub	[%r19 + 0x003a], %r29
hwintr_2_13:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_13), 16, 16)) -> intp(2, 0, 1d)
	.word 0xf45dc000  ! 245: LDX_R	ldx	[%r23 + %r0], %r26
	.word 0xfa1d617d  ! 246: LDD_I	ldd	[%r21 + 0x017d], %r29
	.word 0xf40ce18b  ! 249: LDUB_I	ldub	[%r19 + 0x018b], %r26
	.word 0x8195a139  ! 252: WRPR_TPC_I	wrpr	%r22, 0x0139, %tpc
	.word 0xfb1ce0e5  ! 253: LDDF_I	ldd	[%r19, 0x00e5], %f29
	.word 0xf31d4000  ! 255: LDDF_R	ldd	[%r21, %r0], %f25
	.word 0xbe8d61a0  ! 256: ANDcc_I	andcc 	%r21, 0x01a0, %r31
	.word 0xf05dc000  ! 257: LDX_R	ldx	[%r23 + %r0], %r24
	setx	data_start_4, %g1, %r19
	.word 0xf20da014  ! 264: LDUB_I	ldub	[%r22 + 0x0014], %r25
	.word 0xfc154000  ! 267: LDUH_R	lduh	[%r21 + %r0], %r30
	.word 0xbc3cc000  ! 269: XNOR_R	xnor 	%r19, %r0, %r30
	.word 0xfe0dc000  ! 272: LDUB_R	ldub	[%r23 + %r0], %r31
hwintr_2_14:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_14), 16, 16)) -> intp(2, 0, 1b)
	.word 0xf45cc000  ! 275: LDX_R	ldx	[%r19 + %r0], %r26
	.word 0xf80c0000  ! 276: LDUB_R	ldub	[%r16 + %r0], %r28
	.word 0xf40d6187  ! 278: LDUB_I	ldub	[%r21 + 0x0187], %r26
	.word 0xfa54c000  ! 279: LDSH_R	ldsh	[%r19 + %r0], %r29
	.word 0xfa05217c  ! 280: LDUW_I	lduw	[%r20 + 0x017c], %r29
	.word 0xf854c000  ! 282: LDSH_R	ldsh	[%r19 + %r0], %r28
	.word 0xb3504000  ! 286: RDPR_TNPC	rdpr	%tnpc, %r25
	.word 0xfa55e14c  ! 289: LDSH_I	ldsh	[%r23 + 0x014c], %r29
	.word 0xf0540000  ! 294: LDSH_R	ldsh	[%r16 + %r0], %r24
	mov	0, %r12
	.word 0xa1930000  ! 301: WRPR_GL_R	wrpr	%r12, %r0, %-
	setx	data_start_0, %g1, %r18
	.word 0xb33ca001  ! 311: SRA_I	sra 	%r18, 0x0001, %r25
	.word 0xf45c4000  ! 314: LDX_R	ldx	[%r17 + %r0], %r26
	.word 0xfd1da078  ! 317: LDDF_I	ldd	[%r22, 0x0078], %f30
	.word 0xf04ce191  ! 319: LDSB_I	ldsb	[%r19 + 0x0191], %r24
	.word 0xfe0d20e0  ! 320: LDUB_I	ldub	[%r20 + 0x00e0], %r31
	.word 0xfc4c613f  ! 321: LDSB_I	ldsb	[%r17 + 0x013f], %r30
	.word 0xf71ce1ed  ! 322: LDDF_I	ldd	[%r19, 0x01ed], %f27
	.word 0xfa158000  ! 327: LDUH_R	lduh	[%r22 + %r0], %r29
	.word 0xf005c000  ! 328: LDUW_R	lduw	[%r23 + %r0], %r24
	.word 0xf8058000  ! 331: LDUW_R	lduw	[%r22 + %r0], %r28
	.word 0xb151c000  ! 333: RDPR_TL	<illegal instruction>
hwintr_2_15:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_15), 16, 16)) -> intp(2, 0, 3a)
	.word 0xf4542068  ! 336: LDSH_I	ldsh	[%r16 + 0x0068], %r26
	.word 0xbb520000  ! 339: RDPR_PIL	<illegal instruction>
	.word 0xfd1d0000  ! 343: LDDF_R	ldd	[%r20, %r0], %f30
	.word 0xbb518000  ! 344: RDPR_PSTATE	<illegal instruction>
	.word 0xb1500000  ! 348: RDPR_TPC	<illegal instruction>
	setx	data_start_2, %g1, %r21
	.word 0xf41dc000  ! 351: LDD_R	ldd	[%r23 + %r0], %r26
	.word 0xf25da0e3  ! 352: LDX_I	ldx	[%r22 + 0x00e3], %r25
	setx	data_start_6, %g1, %r17
	setx	0x2458be930000da04, %g1, %r10
	.word 0x839a8000  ! 362: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xf45cc000  ! 363: LDX_R	ldx	[%r19 + %r0], %r26
	mov	2, %r12
	.word 0x8f930000  ! 364: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xb8258000  ! 365: SUB_R	sub 	%r22, %r0, %r28
	.word 0xfc44e0f7  ! 371: LDSW_I	ldsw	[%r19 + 0x00f7], %r30
	.word 0x8594612b  ! 372: WRPR_TSTATE_I	wrpr	%r17, 0x012b, %tstate
	.word 0xfa0c8000  ! 375: LDUB_R	ldub	[%r18 + %r0], %r29
	.word 0xf844a007  ! 376: LDSW_I	ldsw	[%r18 + 0x0007], %r28
	.word 0xbabd8000  ! 378: XNORcc_R	xnorcc 	%r22, %r0, %r29
	.word 0xf61dc000  ! 382: LDD_R	ldd	[%r23 + %r0], %r27
	.word 0xf8146020  ! 385: LDUH_I	lduh	[%r17 + 0x0020], %r28
	.word 0xbb520000  ! 386: RDPR_PIL	<illegal instruction>
	.word 0xfe448000  ! 387: LDSW_R	ldsw	[%r18 + %r0], %r31
	.word 0x919460bf  ! 388: WRPR_PIL_I	wrpr	%r17, 0x00bf, %pil
	.word 0xbd3d9000  ! 389: SRAX_R	srax	%r22, %r0, %r30
	.word 0x8194e181  ! 391: WRPR_TPC_I	wrpr	%r19, 0x0181, %tpc
	setx	data_start_5, %g1, %r19
	.word 0x8d946000  ! 394: WRPR_PSTATE_I	wrpr	%r17, 0x0000, %pstate
	.word 0xb9500000  ! 397: RDPR_TPC	<illegal instruction>
	.word 0xf40dc000  ! 398: LDUB_R	ldub	[%r23 + %r0], %r26
	.word 0xbead61e2  ! 400: ANDNcc_I	andncc 	%r21, 0x01e2, %r31
	.word 0xfa450000  ! 401: LDSW_R	ldsw	[%r20 + %r0], %r29
	.word 0xf00d618c  ! 404: LDUB_I	ldub	[%r21 + 0x018c], %r24
	.word 0xfc05c000  ! 410: LDUW_R	lduw	[%r23 + %r0], %r30
	.word 0xb4b44000  ! 411: ORNcc_R	orncc 	%r17, %r0, %r26
	.word 0xfe44a16b  ! 414: LDSW_I	ldsw	[%r18 + 0x016b], %r31
	.word 0xbb510000  ! 415: RDPR_TICK	<illegal instruction>
	setx	data_start_5, %g1, %r23
	.word 0xb5480000  ! 417: RDHPR_HPSTATE	rdhpr	%hpstate, %r26
	.word 0xfa0cc000  ! 418: LDUB_R	ldub	[%r19 + %r0], %r29
	.word 0xf64c2035  ! 423: LDSB_I	ldsb	[%r16 + 0x0035], %r27
	.word 0xfa140000  ! 424: LDUH_R	lduh	[%r16 + %r0], %r29
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xbf500000  ! 438: RDPR_TPC	<illegal instruction>
	setx	data_start_2, %g1, %r18
	mov	1, %r12
	.word 0xa1930000  ! 440: WRPR_GL_R	wrpr	%r12, %r0, %-
	setx	data_start_0, %g1, %r17
	.word 0xbf510000  ! 443: RDPR_TICK	rdpr	%tick, %r31
	.word 0xf804219f  ! 448: LDUW_I	lduw	[%r16 + 0x019f], %r28
hwintr_2_16:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_16), 16, 16)) -> intp(2, 0, b)
	.word 0xf45c6129  ! 451: LDX_I	ldx	[%r17 + 0x0129], %r26
	.word 0xf05da000  ! 453: LDX_I	ldx	[%r22 + 0x0000], %r24
	.word 0xf60c4000  ! 455: LDUB_R	ldub	[%r17 + %r0], %r27
	.word 0xf24c20e3  ! 456: LDSB_I	ldsb	[%r16 + 0x00e3], %r25
hwintr_2_17:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_17), 16, 16)) -> intp(2, 0, 2e)
	.word 0xfe5d6170  ! 463: LDX_I	ldx	[%r21 + 0x0170], %r31
	.word 0x8995e0e0  ! 470: WRPR_TICK_I	wrpr	%r23, 0x00e0, %tick
	.word 0xf60c61da  ! 471: LDUB_I	ldub	[%r17 + 0x01da], %r27
	.word 0xf41dc000  ! 472: LDD_R	ldd	[%r23 + %r0], %r26
	.word 0x9194e082  ! 474: WRPR_PIL_I	wrpr	%r19, 0x0082, %pil
	mov	0, %r12
	.word 0x8f930000  ! 476: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xf814e118  ! 477: LDUH_I	lduh	[%r19 + 0x0118], %r28
	.word 0xbf500000  ! 485: RDPR_TPC	<illegal instruction>
	.word 0xf05c6185  ! 486: LDX_I	ldx	[%r17 + 0x0185], %r24
	.word 0xf45c0000  ! 487: LDX_R	ldx	[%r16 + %r0], %r26
	.word 0xbf540000  ! 494: RDPR_GL	<illegal instruction>
	.word 0xb5510000  ! 496: RDPR_TICK	<illegal instruction>
	.word 0x8794602a  ! 500: WRPR_TT_I	wrpr	%r17, 0x002a, %tt
hwintr_2_18:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_18), 16, 16)) -> intp(2, 0, 22)
	.word 0xf51c6077  ! 504: LDDF_I	ldd	[%r17, 0x0077], %f26
	.word 0xb77dc400  ! 505: MOVR_R	movre	%r23, %r0, %r27
	.word 0xf8048000  ! 512: LDUW_R	lduw	[%r18 + %r0], %r28
	.word 0x8795e1a9  ! 515: WRPR_TT_I	wrpr	%r23, 0x01a9, %tt
	.word 0xf51ca1c8  ! 516: LDDF_I	ldd	[%r18, 0x01c8], %f26
	.word 0xf71cc000  ! 518: LDDF_R	ldd	[%r19, %r0], %f27
	.word 0xb551c000  ! 520: RDPR_TL	rdpr	%tl, %r26
	.word 0xfa44a1a6  ! 521: LDSW_I	ldsw	[%r18 + 0x01a6], %r29
	mov	1, %r12
	.word 0x8f930000  ! 527: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xf20dc000  ! 530: LDUB_R	ldub	[%r23 + %r0], %r25
	.word 0xfe056139  ! 533: LDUW_I	lduw	[%r21 + 0x0139], %r31
	.word 0xb5508000  ! 534: RDPR_TSTATE	rdpr	%tstate, %r26
	.word 0xf44d4000  ! 536: LDSB_R	ldsb	[%r21 + %r0], %r26
hwintr_2_19:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_19), 16, 16)) -> intp(2, 0, 14)
	.word 0xba340000  ! 538: ORN_R	orn 	%r16, %r0, %r29
	.word 0xf404608c  ! 540: LDUW_I	lduw	[%r17 + 0x008c], %r26
	.word 0x8395a17f  ! 541: WRPR_TNPC_I	wrpr	%r22, 0x017f, %tnpc
	.word 0xf6156122  ! 543: LDUH_I	lduh	[%r21 + 0x0122], %r27
	.word 0x8794e1f2  ! 549: WRPR_TT_I	wrpr	%r19, 0x01f2, %tt
	.word 0xff1d207e  ! 552: LDDF_I	ldd	[%r20, 0x007e], %f31
	.word 0xf84461a5  ! 553: LDSW_I	ldsw	[%r17 + 0x01a5], %r28
	mov	0, %r12
	.word 0x8f930000  ! 554: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xfc5d4000  ! 560: LDX_R	ldx	[%r21 + %r0], %r30
	.word 0xf0450000  ! 561: LDSW_R	ldsw	[%r20 + %r0], %r24
hwintr_2_20:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_20), 16, 16)) -> intp(2, 0, 3c)
	.word 0xf814a1f7  ! 566: LDUH_I	lduh	[%r18 + 0x01f7], %r28
	.word 0x81956162  ! 567: WRPR_TPC_I	wrpr	%r21, 0x0162, %tpc
	.word 0xf80c6010  ! 568: LDUB_I	ldub	[%r17 + 0x0010], %r28
	.word 0xbf480000  ! 569: RDHPR_HPSTATE	rdhpr	%hpstate, %r31
	.word 0xbd7ce401  ! 572: MOVR_I	movre	%r19, 0x1, %r30
	.word 0xf80421c4  ! 575: LDUW_I	lduw	[%r16 + 0x01c4], %r28
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xf64d8000  ! 580: LDSB_R	ldsb	[%r22 + %r0], %r27
	.word 0xf2540000  ! 591: LDSH_R	ldsh	[%r16 + %r0], %r25
	.word 0xfd1d8000  ! 594: LDDF_R	ldd	[%r22, %r0], %f30
	.word 0xb29dc000  ! 595: XORcc_R	xorcc 	%r23, %r0, %r25
	setx	0x26978f7300001d50, %g1, %r10
	.word 0x819a8000  ! 597: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xbc9c0000  ! 598: XORcc_R	xorcc 	%r16, %r0, %r30
	.word 0xf00c0000  ! 599: LDUB_R	ldub	[%r16 + %r0], %r24
	.word 0xf01ca048  ! 600: LDD_I	ldd	[%r18 + 0x0048], %r24
	.word 0xb1480000  ! 603: RDHPR_HPSTATE	rdhpr	%hpstate, %r24
	.word 0xfa45610a  ! 604: LDSW_I	ldsw	[%r21 + 0x010a], %r29
	.word 0xbf500000  ! 611: RDPR_TPC	<illegal instruction>
	.word 0xf4150000  ! 612: LDUH_R	lduh	[%r20 + %r0], %r26
	.word 0xf0148000  ! 615: LDUH_R	lduh	[%r18 + %r0], %r24
	.word 0xbab5c000  ! 619: ORNcc_R	orncc 	%r23, %r0, %r29
	.word 0xbe04a018  ! 620: ADD_I	add 	%r18, 0x0018, %r31
	.word 0xf0156008  ! 622: LDUH_I	lduh	[%r21 + 0x0008], %r24
	.word 0x8795e068  ! 624: WRPR_TT_I	wrpr	%r23, 0x0068, %tt
	.word 0xb37c6401  ! 626: MOVR_I	movre	%r17, 0x1, %r25
	.word 0xfc1d4000  ! 627: LDD_R	ldd	[%r21 + %r0], %r30
	.word 0xfc1d0000  ! 628: LDD_R	ldd	[%r20 + %r0], %r30
	.word 0xf40d2153  ! 631: LDUB_I	ldub	[%r20 + 0x0153], %r26
	.word 0xf6152038  ! 635: LDUH_I	lduh	[%r20 + 0x0038], %r27
	.word 0xf04420ee  ! 644: LDSW_I	ldsw	[%r16 + 0x00ee], %r24
	.word 0xf805a080  ! 645: LDUW_I	lduw	[%r22 + 0x0080], %r28
	.word 0xfe4ce06b  ! 647: LDSB_I	ldsb	[%r19 + 0x006b], %r31
	.word 0xb42ce067  ! 648: ANDN_I	andn 	%r19, 0x0067, %r26
	.word 0xf6044000  ! 652: LDUW_R	lduw	[%r17 + %r0], %r27
	.word 0x9194a1a1  ! 653: WRPR_PIL_I	wrpr	%r18, 0x01a1, %pil
	.word 0xfc448000  ! 654: LDSW_R	ldsw	[%r18 + %r0], %r30
	.word 0xf215e198  ! 655: LDUH_I	lduh	[%r23 + 0x0198], %r25
	.word 0xbb500000  ! 656: RDPR_TPC	<illegal instruction>
	.word 0xb351c000  ! 660: RDPR_TL	<illegal instruction>
	.word 0xbf510000  ! 663: RDPR_TICK	<illegal instruction>
	.word 0xfa0d8000  ! 665: LDUB_R	ldub	[%r22 + %r0], %r29
	.word 0xf4446072  ! 667: LDSW_I	ldsw	[%r17 + 0x0072], %r26
hwintr_2_21:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_21), 16, 16)) -> intp(2, 0, 39)
	.word 0x8594e1d5  ! 671: WRPR_TSTATE_I	wrpr	%r19, 0x01d5, %tstate
	.word 0xfc54207b  ! 673: LDSH_I	ldsh	[%r16 + 0x007b], %r30
	.word 0xf65d219a  ! 675: LDX_I	ldx	[%r20 + 0x019a], %r27
	setx	0xb6e7d3f800008e11, %g1, %r10
	.word 0x819a8000  ! 677: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xf61c0000  ! 680: LDD_R	ldd	[%r16 + %r0], %r27
	.word 0xf85c8000  ! 686: LDX_R	ldx	[%r18 + %r0], %r28
	.word 0xf24c206d  ! 687: LDSB_I	ldsb	[%r16 + 0x006d], %r25
	.word 0xf2454000  ! 688: LDSW_R	ldsw	[%r21 + %r0], %r25
hwintr_2_22:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_22), 16, 16)) -> intp(2, 0, 31)
	.word 0xb63561a3  ! 690: SUBC_I	orn 	%r21, 0x01a3, %r27
	.word 0xb5540000  ! 691: RDPR_GL	<illegal instruction>
	setx	data_start_6, %g1, %r19
	mov	2, %r12
	.word 0x8f930000  ! 695: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xfa1d6122  ! 696: LDD_I	ldd	[%r21 + 0x0122], %r29
	.word 0xb750c000  ! 700: RDPR_TT	<illegal instruction>
	.word 0xfe0ce17f  ! 703: LDUB_I	ldub	[%r19 + 0x017f], %r31
	.word 0xf51d60cc  ! 704: LDDF_I	ldd	[%r21, 0x00cc], %f26
	.word 0xf0444000  ! 706: LDSW_R	ldsw	[%r17 + %r0], %r24
	.word 0xf055c000  ! 709: LDSH_R	ldsh	[%r23 + %r0], %r24
	setx	data_start_7, %g1, %r16
hwintr_2_23:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_23), 16, 16)) -> intp(2, 0, 37)
	.word 0xf60d4000  ! 713: LDUB_R	ldub	[%r21 + %r0], %r27
	.word 0xb68d8000  ! 714: ANDcc_R	andcc 	%r22, %r0, %r27
	.word 0xbd354000  ! 716: SRL_R	srl 	%r21, %r0, %r30
	.word 0xf11ce1e0  ! 720: LDDF_I	ldd	[%r19, 0x01e0], %f24
	.word 0xb80ce0c6  ! 722: AND_I	and 	%r19, 0x00c6, %r28
	.word 0xb09421ad  ! 723: ORcc_I	orcc 	%r16, 0x01ad, %r24
	.word 0xf64c0000  ! 724: LDSB_R	ldsb	[%r16 + %r0], %r27
	.word 0xf91c8000  ! 730: LDDF_R	ldd	[%r18, %r0], %f28
	.word 0xf8140000  ! 731: LDUH_R	lduh	[%r16 + %r0], %r28
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xf80d0000  ! 734: LDUB_R	ldub	[%r20 + %r0], %r28
	.word 0xfc44c000  ! 736: LDSW_R	ldsw	[%r19 + %r0], %r30
	.word 0xbb51c000  ! 739: RDPR_TL	<illegal instruction>
	.word 0xfe5dc000  ! 740: LDX_R	ldx	[%r23 + %r0], %r31
	.word 0xbb342001  ! 742: SRL_I	srl 	%r16, 0x0001, %r29
	.word 0xb6bd20a7  ! 744: XNORcc_I	xnorcc 	%r20, 0x00a7, %r27
	.word 0xf0048000  ! 745: LDUW_R	lduw	[%r18 + %r0], %r24
	.word 0xbab5c000  ! 747: SUBCcc_R	orncc 	%r23, %r0, %r29
	.word 0xfe458000  ! 751: LDSW_R	ldsw	[%r22 + %r0], %r31
	.word 0xff1ca118  ! 755: LDDF_I	ldd	[%r18, 0x0118], %f31
hwintr_2_24:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_24), 16, 16)) -> intp(2, 0, 2e)
	.word 0xf91c6134  ! 759: LDDF_I	ldd	[%r17, 0x0134], %f28
	.word 0xb01c8000  ! 761: XOR_R	xor 	%r18, %r0, %r24
	.word 0xf31c60a0  ! 764: LDDF_I	ldd	[%r17, 0x00a0], %f25
	.word 0xfd1ca1a9  ! 767: LDDF_I	ldd	[%r18, 0x01a9], %f30
	.word 0xf11c202c  ! 770: LDDF_I	ldd	[%r16, 0x002c], %f24
	.word 0xbc948000  ! 772: ORcc_R	orcc 	%r18, %r0, %r30
	.word 0xf04d6105  ! 780: LDSB_I	ldsb	[%r21 + 0x0105], %r24
	.word 0xb9520000  ! 784: RDPR_PIL	<illegal instruction>
	.word 0xf05cc000  ! 786: LDX_R	ldx	[%r19 + %r0], %r24
	.word 0xf20c4000  ! 787: LDUB_R	ldub	[%r17 + %r0], %r25
	.word 0xf044c000  ! 791: LDSW_R	ldsw	[%r19 + %r0], %r24
	setx	data_start_2, %g1, %r21
	.word 0xfa1d206d  ! 794: LDD_I	ldd	[%r20 + 0x006d], %r29
	setx	0x5f16413e000029d7, %g1, %r10
	.word 0x839a8000  ! 795: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xf65d202e  ! 797: LDX_I	ldx	[%r20 + 0x002e], %r27
	.word 0x8995e001  ! 799: WRPR_TICK_I	wrpr	%r23, 0x0001, %tick
	.word 0xbd7d8400  ! 803: MOVR_R	movre	%r22, %r0, %r30
hwintr_2_25:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_25), 16, 16)) -> intp(2, 0, 3e)
hwintr_2_26:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_26), 16, 16)) -> intp(2, 0, 38)
	setx	data_start_7, %g1, %r19
	.word 0xfc4dc000  ! 809: LDSB_R	ldsb	[%r23 + %r0], %r30
	.word 0xfc4d4000  ! 811: LDSB_R	ldsb	[%r21 + %r0], %r30
	.word 0xbebde00e  ! 812: XNORcc_I	xnorcc 	%r23, 0x000e, %r31
	setx	0xf3b3db150000aa09, %g1, %r10
	.word 0x839a8000  ! 815: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xfa4d4000  ! 819: LDSB_R	ldsb	[%r21 + %r0], %r29
	setx	0x6d83f020000ae08, %g1, %r10
	.word 0x819a8000  ! 822: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xf454a090  ! 823: LDSH_I	ldsh	[%r18 + 0x0090], %r26
	.word 0xf214e135  ! 831: LDUH_I	lduh	[%r19 + 0x0135], %r25
	.word 0x8d94e0e3  ! 835: WRPR_PSTATE_I	wrpr	%r19, 0x00e3, %pstate
	.word 0xf605a0d8  ! 836: LDUW_I	lduw	[%r22 + 0x00d8], %r27
	.word 0xf01c60e9  ! 838: LDD_I	ldd	[%r17 + 0x00e9], %r24
	.word 0xf80c8000  ! 840: LDUB_R	ldub	[%r18 + %r0], %r28
	.word 0x8194e0ca  ! 841: WRPR_TPC_I	wrpr	%r19, 0x00ca, %tpc
	.word 0x8394a103  ! 843: WRPR_TNPC_I	wrpr	%r18, 0x0103, %tnpc
	.word 0xbd50c000  ! 844: RDPR_TT	<illegal instruction>
	.word 0xfe0cc000  ! 845: LDUB_R	ldub	[%r19 + %r0], %r31
	.word 0xf045a141  ! 847: LDSW_I	ldsw	[%r22 + 0x0141], %r24
	.word 0xfa5d0000  ! 848: LDX_R	ldx	[%r20 + %r0], %r29
hwintr_2_27:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_27), 16, 16)) -> intp(2, 0, 25)
hwintr_2_28:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_28), 16, 16)) -> intp(2, 0, 17)
	.word 0xfa5ce142  ! 857: LDX_I	ldx	[%r19 + 0x0142], %r29
	.word 0x8d95e1aa  ! 860: WRPR_PSTATE_I	wrpr	%r23, 0x01aa, %pstate
	.word 0xb734a001  ! 861: SRL_I	srl 	%r18, 0x0001, %r27
	.word 0x8995a043  ! 863: WRPR_TICK_I	wrpr	%r22, 0x0043, %tick
	.word 0xf65d2173  ! 865: LDX_I	ldx	[%r20 + 0x0173], %r27
	.word 0xb0b50000  ! 867: ORNcc_R	orncc 	%r20, %r0, %r24
	.word 0xb53cb001  ! 869: SRAX_I	srax	%r18, 0x0001, %r26
	.word 0xb92cc000  ! 870: SLL_R	sll 	%r19, %r0, %r28
	.word 0xbca48000  ! 872: SUBcc_R	subcc 	%r18, %r0, %r30
	mov	1, %r12
	.word 0xa1930000  ! 873: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0x8795a150  ! 874: WRPR_TT_I	wrpr	%r22, 0x0150, %tt
hwintr_2_29:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_29), 16, 16)) -> intp(2, 0, 2e)
	.word 0xb7510000  ! 878: RDPR_TICK	<illegal instruction>
	.word 0xf855c000  ! 881: LDSH_R	ldsh	[%r23 + %r0], %r28
	.word 0xfa458000  ! 884: LDSW_R	ldsw	[%r22 + %r0], %r29
	.word 0xb2c5e092  ! 885: ADDCcc_I	addccc 	%r23, 0x0092, %r25
	.word 0xb5500000  ! 886: RDPR_TPC	<illegal instruction>
	.word 0xf61d8000  ! 889: LDD_R	ldd	[%r22 + %r0], %r27
	.word 0xf60c6172  ! 890: LDUB_I	ldub	[%r17 + 0x0172], %r27
hwintr_2_30:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_30), 16, 16)) -> intp(2, 0, 21)
	.word 0x89942166  ! 893: WRPR_TICK_I	wrpr	%r16, 0x0166, %tick
	.word 0xf2048000  ! 897: LDUW_R	lduw	[%r18 + %r0], %r25
	.word 0xbe944000  ! 898: ORcc_R	orcc 	%r17, %r0, %r31
	.word 0xf25c61c4  ! 900: LDX_I	ldx	[%r17 + 0x01c4], %r25
	.word 0xfc540000  ! 901: LDSH_R	ldsh	[%r16 + %r0], %r30
hwintr_2_31:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_31), 16, 16)) -> intp(2, 0, 12)
	.word 0xf004a1c0  ! 904: LDUW_I	lduw	[%r18 + 0x01c0], %r24
	setx	data_start_1, %g1, %r20
	.word 0xb2454000  ! 906: ADDC_R	addc 	%r21, %r0, %r25
	setx	0xd7208eaa00004d4b, %g1, %r10
	.word 0x839a8000  ! 910: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
hwintr_2_32:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_32), 16, 16)) -> intp(2, 0, a)
	.word 0xfa4c206f  ! 915: LDSB_I	ldsb	[%r16 + 0x006f], %r29
	.word 0xb92d0000  ! 917: SLL_R	sll 	%r20, %r0, %r28
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xfc040000  ! 921: LDUW_R	lduw	[%r16 + %r0], %r30
	.word 0xb93d6001  ! 922: SRA_I	sra 	%r21, 0x0001, %r28
	.word 0xf85c20cd  ! 925: LDX_I	ldx	[%r16 + 0x00cd], %r28
	.word 0xbc1cc000  ! 930: XOR_R	xor 	%r19, %r0, %r30
	.word 0xf254e11f  ! 933: LDSH_I	ldsh	[%r19 + 0x011f], %r25
hwintr_2_33:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_33), 16, 16)) -> intp(2, 0, 0)
	.word 0xfc1de1da  ! 935: LDD_I	ldd	[%r23 + 0x01da], %r30
	.word 0x8d95a175  ! 936: WRPR_PSTATE_I	wrpr	%r22, 0x0175, %pstate
hwintr_2_34:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_34), 16, 16)) -> intp(2, 0, 3e)
	.word 0xb6b5a10f  ! 942: SUBCcc_I	orncc 	%r22, 0x010f, %r27
	setx	data_start_5, %g1, %r16
	.word 0xb3510000  ! 948: RDPR_TICK	<illegal instruction>
	.word 0xf4048000  ! 949: LDUW_R	lduw	[%r18 + %r0], %r26
	.word 0xfa5cc000  ! 950: LDX_R	ldx	[%r19 + %r0], %r29
	.word 0xba35c000  ! 952: SUBC_R	orn 	%r23, %r0, %r29
	.word 0xf21d0000  ! 954: LDD_R	ldd	[%r20 + %r0], %r25
	.word 0xf24ce01f  ! 955: LDSB_I	ldsb	[%r19 + 0x001f], %r25
	.word 0xff1dc000  ! 961: LDDF_R	ldd	[%r23, %r0], %f31
	setx	0xa3d36d020000eb42, %g1, %r10
	.word 0x839a8000  ! 964: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xf20d0000  ! 972: LDUB_R	ldub	[%r20 + %r0], %r25
	.word 0x8d9460d4  ! 973: WRPR_PSTATE_I	wrpr	%r17, 0x00d4, %pstate
	.word 0xf005a1da  ! 974: LDUW_I	lduw	[%r22 + 0x01da], %r24
	.word 0xb7480000  ! 975: RDHPR_HPSTATE	rdhpr	%hpstate, %r27
	.word 0xbf540000  ! 976: RDPR_GL	<illegal instruction>
	mov	0, %r12
	.word 0xa1930000  ! 977: WRPR_GL_R	wrpr	%r12, %r0, %-
	setx	data_start_3, %g1, %r22
	.word 0xb1510000  ! 986: RDPR_TICK	<illegal instruction>
	.word 0xb3350000  ! 987: SRL_R	srl 	%r20, %r0, %r25
hwintr_2_35:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_35), 16, 16)) -> intp(2, 0, 19)
	.word 0xff1c4000  ! 991: LDDF_R	ldd	[%r17, %r0], %f31
hwintr_2_36:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_36), 16, 16)) -> intp(2, 0, 6)
	.word 0xbd643801  ! 996: MOVcc_I	<illegal instruction>
	.word 0xf0140000  ! 998: LDUH_R	lduh	[%r16 + %r0], %r24
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_1:
	setx	data_start_0, %g1, %r16
	setx	data_start_6, %g1, %r19
	.word 0xb9a50820  ! 7: FADDs	fadds	%f20, %f0, %f28
	.word 0x8d95a0ad  ! 9: WRPR_PSTATE_I	wrpr	%r22, 0x00ad, %pstate
	.word 0xb1a548a0  ! 12: FSUBs	fsubs	%f21, %f0, %f24
	.word 0xbd3de001  ! 14: SRA_I	sra 	%r23, 0x0001, %r30
	.word 0xb7a9c820  ! 15: FMOVVS	fmovs	%fcc1, %f0, %f27
	setx	0x6fc2d4bd0000ed85, %g1, %r10
	.word 0x819a8000  ! 18: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
hwintr_1_0:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_0), 16, 16)) -> intp(1, 0, 3f)
	.word 0xbe3d60da  ! 22: XNOR_I	xnor 	%r21, 0x00da, %r31
	.word 0xb1a508e0  ! 23: FSUBq	dis not found

	.word 0xb5aa0820  ! 27: FMOVA	fmovs	%fcc1, %f0, %f26
	.word 0x899561ef  ! 31: WRPR_TICK_I	wrpr	%r21, 0x01ef, %tick
	setx	0x61d80830000cf54, %g1, %r10
	.word 0x839a8000  ! 32: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb1a408c0  ! 33: FSUBd	fsubd	%f16, %f0, %f24
	.word 0xbfa8c820  ! 34: FMOVL	fmovs	%fcc1, %f0, %f31
	.word 0xb9abc820  ! 35: FMOVVC	fmovs	%fcc1, %f0, %f28
	.word 0xb5a509e0  ! 37: FDIVq	dis not found

	.word 0xbba44940  ! 38: FMULd	fmuld	%f48, %f0, %f60
	.word 0x8194a0e1  ! 39: WRPR_TPC_I	wrpr	%r18, 0x00e1, %tpc
hwintr_1_1:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_1), 16, 16)) -> intp(1, 0, 18)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
hwintr_1_2:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_2), 16, 16)) -> intp(1, 0, 39)
	.word 0xb3508000  ! 50: RDPR_TSTATE	<illegal instruction>
	.word 0x879520b5  ! 52: WRPR_TT_I	wrpr	%r20, 0x00b5, %tt
	setx	0x531bc89e00006d0c, %g1, %r10
	.word 0x819a8000  ! 58: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xb3504000  ! 60: RDPR_TNPC	<illegal instruction>
hwintr_1_3:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_3), 16, 16)) -> intp(1, 0, 9)
hwintr_1_4:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_4), 16, 16)) -> intp(1, 0, 2b)
	.word 0xbba84820  ! 66: FMOVE	fmovs	%fcc1, %f0, %f29
	.word 0xb5a9c820  ! 70: FMOVVS	fmovs	%fcc1, %f0, %f26
	.word 0xb7a5c9e0  ! 73: FDIVq	dis not found

	.word 0x839521ec  ! 74: WRPR_TNPC_I	wrpr	%r20, 0x01ec, %tnpc
hwintr_1_5:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_5), 16, 16)) -> intp(1, 0, 11)
	.word 0x8194e159  ! 78: WRPR_TPC_I	wrpr	%r19, 0x0159, %tpc
	.word 0xbba5c8c0  ! 80: FSUBd	fsubd	%f54, %f0, %f60
	.word 0xb7a4c8e0  ! 81: FSUBq	dis not found

	mov	0, %r12
	.word 0xa1930000  ! 82: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xba340000  ! 84: SUBC_R	orn 	%r16, %r0, %r29
	setx	data_start_4, %g1, %r20
	.word 0xbda4c8e0  ! 90: FSUBq	dis not found

	.word 0xbda44860  ! 99: FADDq	dis not found

	.word 0xb1a90820  ! 105: FMOVLEU	fmovs	%fcc1, %f0, %f24
	.word 0xb3a40960  ! 114: FMULq	dis not found

hwintr_1_6:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_6), 16, 16)) -> intp(1, 0, 2f)
	.word 0xb5a00020  ! 121: FMOVs	fmovs	%f0, %f26
	.word 0xb5a80820  ! 122: FMOVRLEZ	fmovs	%fcc1, %f0, %f26
	.word 0xb3352001  ! 124: SRL_I	srl 	%r20, 0x0001, %r25
	.word 0xb5ab4820  ! 127: FMOVCC	fmovs	%fcc1, %f0, %f26
	.word 0xb0956052  ! 130: ORcc_I	orcc 	%r21, 0x0052, %r24
	.word 0xbba00520  ! 132: FSQRTs	fsqrt	
	.word 0xb9aa0820  ! 134: FMOVA	fmovs	%fcc1, %f0, %f28
	.word 0xbba00540  ! 140: FSQRTd	fsqrt	
hwintr_1_7:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_7), 16, 16)) -> intp(1, 0, 39)
	.word 0xbba4c840  ! 144: FADDd	faddd	%f50, %f0, %f60
	.word 0xb1a84820  ! 145: FMOVE	fmovs	%fcc1, %f0, %f24
	.word 0xb5aa8820  ! 147: FMOVG	fmovs	%fcc1, %f0, %f26
	.word 0xb1a81c20  ! 152: FMOVRGEZ	dis not found

	.word 0xb9a81420  ! 155: FMOVRNZ	dis not found

	.word 0xb9a81c20  ! 158: FMOVRGEZ	dis not found

hwintr_1_8:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_8), 16, 16)) -> intp(1, 0, 24)
	.word 0xbfa548a0  ! 162: FSUBs	fsubs	%f21, %f0, %f31
	.word 0xb7a84820  ! 167: FMOVE	fmovs	%fcc1, %f0, %f27
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb7ab8820  ! 169: FMOVPOS	fmovs	%fcc1, %f0, %f27
	.word 0xbda98820  ! 171: FMOVNEG	fmovs	%fcc1, %f0, %f30
	.word 0xbba489e0  ! 173: FDIVq	dis not found

hwintr_1_9:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_9), 16, 16)) -> intp(1, 0, f)
	.word 0xbfa44820  ! 180: FADDs	fadds	%f17, %f0, %f31
hwintr_1_10:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_10), 16, 16)) -> intp(1, 0, 0)
	.word 0xb5508000  ! 183: RDPR_TSTATE	<illegal instruction>
	.word 0xb1a81820  ! 184: FMOVRGZ	fmovs	%fcc3, %f0, %f24
	.word 0xbba80c20  ! 188: FMOVRLZ	dis not found

	.word 0xbf500000  ! 193: RDPR_TPC	<illegal instruction>
	.word 0xbe8da117  ! 201: ANDcc_I	andcc 	%r22, 0x0117, %r31
hwintr_1_11:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_11), 16, 16)) -> intp(1, 0, 17)
hwintr_1_12:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_12), 16, 16)) -> intp(1, 0, 23)
	.word 0xb215a1d8  ! 207: OR_I	or 	%r22, 0x01d8, %r25
	.word 0xbfab4820  ! 208: FMOVCC	fmovs	%fcc1, %f0, %f31
	setx	data_start_0, %g1, %r21
	.word 0xb7aac820  ! 211: FMOVGE	fmovs	%fcc1, %f0, %f27
	.word 0xb7a80820  ! 214: FMOVRLEZ	fmovs	%fcc1, %f0, %f27
	.word 0xbda4c940  ! 216: FMULd	fmuld	%f50, %f0, %f30
	.word 0xbda88820  ! 218: FMOVLE	fmovs	%fcc1, %f0, %f30
	.word 0xb1a50860  ! 219: FADDq	dis not found

	.word 0x8794e041  ! 220: WRPR_TT_I	wrpr	%r19, 0x0041, %tt
	.word 0xbba48960  ! 227: FMULq	dis not found

	.word 0x8194e037  ! 230: WRPR_TPC_I	wrpr	%r19, 0x0037, %tpc
	.word 0x859521c2  ! 231: WRPR_TSTATE_I	wrpr	%r20, 0x01c2, %tstate
	setx	data_start_4, %g1, %r19
	.word 0xbf518000  ! 235: RDPR_PSTATE	<illegal instruction>
hwintr_1_13:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_13), 16, 16)) -> intp(1, 0, 25)
	.word 0xbda00520  ! 241: FSQRTs	fsqrt	
	.word 0xb9a589c0  ! 244: FDIVd	fdivd	%f22, %f0, %f28
	.word 0xb9a58820  ! 251: FADDs	fadds	%f22, %f0, %f28
	.word 0x8194a149  ! 252: WRPR_TPC_I	wrpr	%r18, 0x0149, %tpc
	.word 0xba8de07b  ! 256: ANDcc_I	andcc 	%r23, 0x007b, %r29
	.word 0xb9ab0820  ! 258: FMOVGU	fmovs	%fcc1, %f0, %f28
	setx	data_start_7, %g1, %r23
	.word 0xbc3d4000  ! 269: XNOR_R	xnor 	%r21, %r0, %r30
hwintr_1_14:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_14), 16, 16)) -> intp(1, 0, 8)
	.word 0xb7a00540  ! 277: FSQRTd	fsqrt	
	.word 0xbda80c20  ! 281: FMOVRLZ	dis not found

	.word 0xbdab0820  ! 284: FMOVGU	fmovs	%fcc1, %f0, %f30
	.word 0xb3aa0820  ! 285: FMOVA	fmovs	%fcc1, %f0, %f25
	.word 0xb7504000  ! 286: RDPR_TNPC	<illegal instruction>
	.word 0xb9a488e0  ! 297: FSUBq	dis not found

	.word 0xb9a589e0  ! 298: FDIVq	dis not found

	.word 0xbba00020  ! 299: FMOVs	fmovs	%f0, %f29
	mov	2, %r12
	.word 0xa1930000  ! 301: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb5a88820  ! 302: FMOVLE	fmovs	%fcc1, %f0, %f26
	.word 0xbba4c960  ! 304: FMULq	dis not found

	.word 0xbba58860  ! 305: FADDq	dis not found

	setx	data_start_7, %g1, %r23
	.word 0xbfa94820  ! 309: FMOVCS	fmovs	%fcc1, %f0, %f31
	.word 0xbd3de001  ! 311: SRA_I	sra 	%r23, 0x0001, %r30
	.word 0xb9a489e0  ! 323: FDIVq	dis not found

	.word 0xbba588c0  ! 325: FSUBd	fsubd	%f22, %f0, %f60
	.word 0xb351c000  ! 333: RDPR_TL	<illegal instruction>
hwintr_1_15:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_15), 16, 16)) -> intp(1, 0, 35)
	.word 0xbda5c8c0  ! 337: FSUBd	fsubd	%f54, %f0, %f30
	.word 0xbfa588c0  ! 338: FSUBd	fsubd	%f22, %f0, %f62
	.word 0xb1520000  ! 339: RDPR_PIL	<illegal instruction>
	.word 0xb9a88820  ! 342: FMOVLE	fmovs	%fcc1, %f0, %f28
	.word 0xbb518000  ! 344: RDPR_PSTATE	<illegal instruction>
	.word 0xbda5c860  ! 345: FADDq	dis not found

	.word 0xb3a44920  ! 347: FMULs	fmuls	%f17, %f0, %f25
	.word 0xb5500000  ! 348: RDPR_TPC	<illegal instruction>
	.word 0xb3a5c940  ! 349: FMULd	fmuld	%f54, %f0, %f56
	setx	data_start_3, %g1, %r17
	.word 0xb3a80820  ! 353: FMOVN	fmovs	%fcc1, %f0, %f25
	setx	data_start_6, %g1, %r21
	.word 0xbfa54960  ! 359: FMULq	dis not found

	.word 0xb1aa0820  ! 360: FMOVA	fmovs	%fcc1, %f0, %f24
	.word 0xbda90820  ! 361: FMOVLEU	fmovs	%fcc1, %f0, %f30
	setx	0x7503250500004e04, %g1, %r10
	.word 0x839a8000  ! 362: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	mov	2, %r12
	.word 0x8f930000  ! 364: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xb4258000  ! 365: SUB_R	sub 	%r22, %r0, %r26
	.word 0xb1a81820  ! 366: FMOVRGZ	fmovs	%fcc3, %f0, %f24
	.word 0x85946027  ! 372: WRPR_TSTATE_I	wrpr	%r17, 0x0027, %tstate
	.word 0xb5a84820  ! 373: FMOVE	fmovs	%fcc1, %f0, %f26
	.word 0xbebd8000  ! 378: XNORcc_R	xnorcc 	%r22, %r0, %r31
	.word 0xbfa50820  ! 380: FADDs	fadds	%f20, %f0, %f31
	.word 0xb7520000  ! 386: RDPR_PIL	<illegal instruction>
	.word 0x9194e1ec  ! 388: WRPR_PIL_I	wrpr	%r19, 0x01ec, %pil
	.word 0xbd3d9000  ! 389: SRAX_R	srax	%r22, %r0, %r30
	.word 0x8195a1c6  ! 391: WRPR_TPC_I	wrpr	%r22, 0x01c6, %tpc
	.word 0xb3a00560  ! 392: FSQRTq	fsqrt	
	setx	data_start_6, %g1, %r20
	.word 0x8d95e032  ! 394: WRPR_PSTATE_I	wrpr	%r23, 0x0032, %pstate
	.word 0xb1a90820  ! 395: FMOVLEU	fmovs	%fcc1, %f0, %f24
	.word 0xbd500000  ! 397: RDPR_TPC	<illegal instruction>
	.word 0xb4ada1e9  ! 400: ANDNcc_I	andncc 	%r22, 0x01e9, %r26
	.word 0xbda81c20  ! 402: FMOVRGEZ	dis not found

	.word 0xbfa409e0  ! 403: FDIVq	dis not found

	.word 0xb1a00560  ! 408: FSQRTq	fsqrt	
	.word 0xbeb54000  ! 411: ORNcc_R	orncc 	%r21, %r0, %r31
	.word 0xbfa58820  ! 412: FADDs	fadds	%f22, %f0, %f31
	.word 0xbb510000  ! 415: RDPR_TICK	<illegal instruction>
	setx	data_start_4, %g1, %r19
	.word 0xb3480000  ! 417: RDHPR_HPSTATE	rdhpr	%hpstate, %r25
	.word 0xbda00540  ! 421: FSQRTd	fsqrt	
	.word 0xb9a00540  ! 425: FSQRTd	fsqrt	
	.word 0xbfa448e0  ! 432: FSUBq	dis not found

	.word 0xb9a4c8c0  ! 433: FSUBd	fsubd	%f50, %f0, %f28
	.word 0xb7a81c20  ! 435: FMOVRGEZ	dis not found

	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xbd500000  ! 438: RDPR_TPC	<illegal instruction>
	setx	data_start_7, %g1, %r22
	mov	2, %r12
	.word 0xa1930000  ! 440: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb9a4c840  ! 441: FADDd	faddd	%f50, %f0, %f28
	setx	data_start_3, %g1, %r19
	.word 0xb9510000  ! 443: RDPR_TICK	rdpr	%tick, %r28
	.word 0xb3a9c820  ! 447: FMOVVS	fmovs	%fcc1, %f0, %f25
hwintr_1_16:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_16), 16, 16)) -> intp(1, 0, 26)
	.word 0xb5a409e0  ! 457: FDIVq	dis not found

hwintr_1_17:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_17), 16, 16)) -> intp(1, 0, 13)
	.word 0xbda44960  ! 468: FMULq	dis not found

	.word 0x899520d0  ! 470: WRPR_TICK_I	wrpr	%r20, 0x00d0, %tick
	.word 0x919461d8  ! 474: WRPR_PIL_I	wrpr	%r17, 0x01d8, %pil
	mov	1, %r12
	.word 0x8f930000  ! 476: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xbda448c0  ! 483: FSUBd	fsubd	%f48, %f0, %f30
	.word 0xbda408a0  ! 484: FSUBs	fsubs	%f16, %f0, %f30
	.word 0xb1500000  ! 485: RDPR_TPC	<illegal instruction>
	.word 0xb1ab0820  ! 490: FMOVGU	fmovs	%fcc1, %f0, %f24
	.word 0xb9540000  ! 494: RDPR_GL	<illegal instruction>
	.word 0xb3a40820  ! 495: FADDs	fadds	%f16, %f0, %f25
	.word 0xbd510000  ! 496: RDPR_TICK	<illegal instruction>
	.word 0xbfa5c940  ! 498: FMULd	fmuld	%f54, %f0, %f62
	.word 0x8795e068  ! 500: WRPR_TT_I	wrpr	%r23, 0x0068, %tt
hwintr_1_18:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_18), 16, 16)) -> intp(1, 0, 1)
	.word 0xb9a90820  ! 503: FMOVLEU	fmovs	%fcc1, %f0, %f28
	.word 0xb77d0400  ! 505: MOVR_R	movre	%r20, %r0, %r27
	.word 0xbfa88820  ! 506: FMOVLE	fmovs	%fcc1, %f0, %f31
	.word 0xb3a00520  ! 507: FSQRTs	fsqrt	
	.word 0xb7a9c820  ! 509: FMOVVS	fmovs	%fcc1, %f0, %f27
	.word 0xbfa509c0  ! 513: FDIVd	fdivd	%f20, %f0, %f62
	.word 0xbba90820  ! 514: FMOVLEU	fmovs	%fcc1, %f0, %f29
	.word 0x8794a116  ! 515: WRPR_TT_I	wrpr	%r18, 0x0116, %tt
	.word 0xbda00540  ! 517: FSQRTd	fsqrt	
	.word 0xbd51c000  ! 520: RDPR_TL	<illegal instruction>
	.word 0xb7ab8820  ! 522: FMOVPOS	fmovs	%fcc1, %f0, %f27
	.word 0xbda408e0  ! 523: FSUBq	dis not found

	mov	1, %r12
	.word 0x8f930000  ! 527: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xb3a80420  ! 528: FMOVRZ	dis not found

	.word 0xb7a00020  ! 529: FMOVs	fmovs	%f0, %f27
	.word 0xb3508000  ! 534: RDPR_TSTATE	<illegal instruction>
hwintr_1_19:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_19), 16, 16)) -> intp(1, 0, 31)
	.word 0xbe35c000  ! 538: ORN_R	orn 	%r23, %r0, %r31
	.word 0xbba00040  ! 539: FMOVd	fmovd	%f0, %f60
	.word 0x8395a05c  ! 541: WRPR_TNPC_I	wrpr	%r22, 0x005c, %tnpc
	.word 0xb1a88820  ! 544: FMOVLE	fmovs	%fcc1, %f0, %f24
	.word 0xb1a48940  ! 546: FMULd	fmuld	%f18, %f0, %f24
	.word 0x879520b8  ! 549: WRPR_TT_I	wrpr	%r20, 0x00b8, %tt
	mov	2, %r12
	.word 0x8f930000  ! 554: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xb5ab8820  ! 558: FMOVPOS	fmovs	%fcc1, %f0, %f26
	.word 0xbfa40860  ! 562: FADDq	dis not found

hwintr_1_20:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_20), 16, 16)) -> intp(1, 0, 34)
	.word 0x819521ed  ! 567: WRPR_TPC_I	wrpr	%r20, 0x01ed, %tpc
	.word 0xb7480000  ! 569: RDHPR_HPSTATE	rdhpr	%hpstate, %r27
	.word 0xb77c6401  ! 572: MOVR_I	movre	%r17, 0x1, %r27
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb3a9c820  ! 582: FMOVVS	fmovs	%fcc1, %f0, %f25
	.word 0xb7abc820  ! 583: FMOVVC	fmovs	%fcc1, %f0, %f27
	.word 0xb9a50920  ! 585: FMULs	fmuls	%f20, %f0, %f28
	.word 0xb1a54860  ! 587: FADDq	dis not found

	.word 0xbfa84820  ! 589: FMOVE	fmovs	%fcc1, %f0, %f31
	.word 0xbba00560  ! 593: FSQRTq	fsqrt	
	.word 0xb29c8000  ! 595: XORcc_R	xorcc 	%r18, %r0, %r25
	setx	0xfb3c21aa00005a12, %g1, %r10
	.word 0x819a8000  ! 597: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xb69c0000  ! 598: XORcc_R	xorcc 	%r16, %r0, %r27
	.word 0xbf480000  ! 603: RDHPR_HPSTATE	rdhpr	%hpstate, %r31
	.word 0xb9a81420  ! 608: FMOVRNZ	dis not found

	.word 0xb7a00020  ! 609: FMOVs	fmovs	%f0, %f27
	.word 0xb7500000  ! 611: RDPR_TPC	<illegal instruction>
	.word 0xb3abc820  ! 614: FMOVVC	fmovs	%fcc1, %f0, %f25
	.word 0xb9a00560  ! 618: FSQRTq	fsqrt	
	.word 0xbab48000  ! 619: ORNcc_R	orncc 	%r18, %r0, %r29
	.word 0xb205a073  ! 620: ADD_I	add 	%r22, 0x0073, %r25
	.word 0x8794a06a  ! 624: WRPR_TT_I	wrpr	%r18, 0x006a, %tt
	.word 0xb77de401  ! 626: MOVR_I	movre	%r23, 0x1, %r27
	.word 0xbda90820  ! 630: FMOVLEU	fmovs	%fcc1, %f0, %f30
	.word 0xb7aa4820  ! 633: FMOVNE	fmovs	%fcc1, %f0, %f27
	.word 0xb9a00040  ! 634: FMOVd	fmovd	%f0, %f28
	.word 0xb3a8c820  ! 636: FMOVL	fmovs	%fcc1, %f0, %f25
	.word 0xbfa408c0  ! 638: FSUBd	fsubd	%f16, %f0, %f62
	.word 0xb1a5c8c0  ! 643: FSUBd	fsubd	%f54, %f0, %f24
	.word 0xbe2c6040  ! 648: ANDN_I	andn 	%r17, 0x0040, %r31
	.word 0x91952026  ! 653: WRPR_PIL_I	wrpr	%r20, 0x0026, %pil
	.word 0xb9500000  ! 656: RDPR_TPC	<illegal instruction>
	.word 0xb9a00560  ! 659: FSQRTq	fsqrt	
	.word 0xbb51c000  ! 660: RDPR_TL	<illegal instruction>
	.word 0xb5a408c0  ! 662: FSUBd	fsubd	%f16, %f0, %f26
	.word 0xb5510000  ! 663: RDPR_TICK	<illegal instruction>
	.word 0xb3a9c820  ! 664: FMOVVS	fmovs	%fcc1, %f0, %f25
	.word 0xb1aac820  ! 669: FMOVGE	fmovs	%fcc1, %f0, %f24
hwintr_1_21:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_21), 16, 16)) -> intp(1, 0, 4)
	.word 0x8595a172  ! 671: WRPR_TSTATE_I	wrpr	%r22, 0x0172, %tstate
	.word 0xb3a81820  ! 676: FMOVRGZ	fmovs	%fcc3, %f0, %f25
	setx	0x7187897f00005ec0, %g1, %r10
	.word 0x819a8000  ! 677: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xb9a98820  ! 685: FMOVNEG	fmovs	%fcc1, %f0, %f28
hwintr_1_22:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_22), 16, 16)) -> intp(1, 0, 14)
	.word 0xb8352136  ! 690: SUBC_I	orn 	%r20, 0x0136, %r28
	.word 0xbd540000  ! 691: RDPR_GL	<illegal instruction>
	setx	data_start_1, %g1, %r23
	.word 0xbba80820  ! 694: FMOVN	fmovs	%fcc1, %f0, %f29
	mov	2, %r12
	.word 0x8f930000  ! 695: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xb9a58840  ! 698: FADDd	faddd	%f22, %f0, %f28
	.word 0xb3a00540  ! 699: FSQRTd	fsqrt	
	.word 0xb550c000  ! 700: RDPR_TT	<illegal instruction>
	.word 0xbda98820  ! 708: FMOVNEG	fmovs	%fcc1, %f0, %f30
	setx	data_start_1, %g1, %r17
hwintr_1_23:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_23), 16, 16)) -> intp(1, 0, 13)
	.word 0xb08d4000  ! 714: ANDcc_R	andcc 	%r21, %r0, %r24
	.word 0xbd350000  ! 716: SRL_R	srl 	%r20, %r0, %r30
	.word 0xb7a80c20  ! 718: FMOVRLZ	dis not found

	.word 0xb80c60b7  ! 722: AND_I	and 	%r17, 0x00b7, %r28
	.word 0xba95206a  ! 723: ORcc_I	orcc 	%r20, 0x006a, %r29
	.word 0xb5a48860  ! 725: FADDq	dis not found

	.word 0xb7ab0820  ! 726: FMOVGU	fmovs	%fcc1, %f0, %f27
	.word 0xbdab4820  ! 727: FMOVCC	fmovs	%fcc1, %f0, %f30
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xbb51c000  ! 739: RDPR_TL	<illegal instruction>
	.word 0xb535e001  ! 742: SRL_I	srl 	%r23, 0x0001, %r26
	.word 0xbda80420  ! 743: FMOVRZ	dis not found

	.word 0xb6bce0c2  ! 744: XNORcc_I	xnorcc 	%r19, 0x00c2, %r27
	.word 0xb8b40000  ! 747: SUBCcc_R	orncc 	%r16, %r0, %r28
	.word 0xbdab0820  ! 750: FMOVGU	fmovs	%fcc1, %f0, %f30
	.word 0xbba00520  ! 752: FSQRTs	fsqrt	
hwintr_1_24:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_24), 16, 16)) -> intp(1, 0, 3)
	.word 0xb01d4000  ! 761: XOR_R	xor 	%r21, %r0, %r24
	.word 0xbfa00560  ! 762: FSQRTq	fsqrt	
	.word 0xb1a549c0  ! 763: FDIVd	fdivd	%f52, %f0, %f24
	.word 0xb3a00560  ! 765: FSQRTq	fsqrt	
	.word 0xbc940000  ! 772: ORcc_R	orcc 	%r16, %r0, %r30
	.word 0xbba548a0  ! 773: FSUBs	fsubs	%f21, %f0, %f29
	.word 0xb3a80820  ! 776: FMOVN	fmovs	%fcc1, %f0, %f25
	.word 0xb9a00040  ! 779: FMOVd	fmovd	%f0, %f28
	.word 0xbf520000  ! 784: RDPR_PIL	<illegal instruction>
	setx	data_start_6, %g1, %r23
	setx	0x5fa56b860000d949, %g1, %r10
	.word 0x839a8000  ! 795: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xbda00540  ! 798: FSQRTd	fsqrt	
	.word 0x8994e077  ! 799: WRPR_TICK_I	wrpr	%r19, 0x0077, %tick
	.word 0xb5a80c20  ! 800: FMOVRLZ	dis not found

	.word 0xb9a5c920  ! 801: FMULs	fmuls	%f23, %f0, %f28
	.word 0xb57d4400  ! 803: MOVR_R	movre	%r21, %r0, %r26
hwintr_1_25:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_25), 16, 16)) -> intp(1, 0, 21)
hwintr_1_26:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_26), 16, 16)) -> intp(1, 0, 2d)
	setx	data_start_2, %g1, %r17
	.word 0xbabda144  ! 812: XNORcc_I	xnorcc 	%r22, 0x0144, %r29
	.word 0xbda40840  ! 814: FADDd	faddd	%f16, %f0, %f30
	setx	0x539d6caf00008c01, %g1, %r10
	.word 0x839a8000  ! 815: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb3a50960  ! 817: FMULq	dis not found

	.word 0xb5aa4820  ! 821: FMOVNE	fmovs	%fcc1, %f0, %f26
	setx	0xe2ffc4f20000fedd, %g1, %r10
	.word 0x819a8000  ! 822: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xb5a84820  ! 826: FMOVE	fmovs	%fcc1, %f0, %f26
	.word 0xb9aac820  ! 829: FMOVGE	fmovs	%fcc1, %f0, %f28
	.word 0xb3a509c0  ! 832: FDIVd	fdivd	%f20, %f0, %f56
	.word 0xb9a48920  ! 834: FMULs	fmuls	%f18, %f0, %f28
	.word 0x8d95a148  ! 835: WRPR_PSTATE_I	wrpr	%r22, 0x0148, %pstate
	.word 0x8194e115  ! 841: WRPR_TPC_I	wrpr	%r19, 0x0115, %tpc
	.word 0xb9a80c20  ! 842: FMOVRLZ	dis not found

	.word 0x83956032  ! 843: WRPR_TNPC_I	wrpr	%r21, 0x0032, %tnpc
	.word 0xb550c000  ! 844: RDPR_TT	<illegal instruction>
hwintr_1_27:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_27), 16, 16)) -> intp(1, 0, b)
hwintr_1_28:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_28), 16, 16)) -> intp(1, 0, 1f)
	.word 0xb9a40820  ! 859: FADDs	fadds	%f16, %f0, %f28
	.word 0x8d94a094  ! 860: WRPR_PSTATE_I	wrpr	%r18, 0x0094, %pstate
	.word 0xbb34e001  ! 861: SRL_I	srl 	%r19, 0x0001, %r29
	.word 0x8994e1a7  ! 863: WRPR_TICK_I	wrpr	%r19, 0x01a7, %tick
	.word 0xb1a80420  ! 864: FMOVRZ	dis not found

	.word 0xb9a50960  ! 866: FMULq	dis not found

	.word 0xbab5c000  ! 867: ORNcc_R	orncc 	%r23, %r0, %r29
	.word 0xb73df001  ! 869: SRAX_I	srax	%r23, 0x0001, %r27
	.word 0xb12d4000  ! 870: SLL_R	sll 	%r21, %r0, %r24
	.word 0xb0a58000  ! 872: SUBcc_R	subcc 	%r22, %r0, %r24
	mov	0, %r12
	.word 0xa1930000  ! 873: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0x8795a04b  ! 874: WRPR_TT_I	wrpr	%r22, 0x004b, %tt
hwintr_1_29:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_29), 16, 16)) -> intp(1, 0, 5)
	.word 0xbd510000  ! 878: RDPR_TICK	<illegal instruction>
	.word 0xb5ab0820  ! 879: FMOVGU	fmovs	%fcc1, %f0, %f26
	.word 0xb5aac820  ! 882: FMOVGE	fmovs	%fcc1, %f0, %f26
	.word 0xb6c5204f  ! 885: ADDCcc_I	addccc 	%r20, 0x004f, %r27
	.word 0xb3500000  ! 886: RDPR_TPC	<illegal instruction>
	.word 0xb9a548e0  ! 887: FSUBq	dis not found

hwintr_1_30:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_30), 16, 16)) -> intp(1, 0, 39)
	.word 0x8995610b  ! 893: WRPR_TICK_I	wrpr	%r21, 0x010b, %tick
	.word 0xb9a448a0  ! 895: FSUBs	fsubs	%f17, %f0, %f28
	.word 0xb5a00520  ! 896: FSQRTs	fsqrt	
	.word 0xb695c000  ! 898: ORcc_R	orcc 	%r23, %r0, %r27
	.word 0xbba58840  ! 899: FADDd	faddd	%f22, %f0, %f60
hwintr_1_31:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_31), 16, 16)) -> intp(1, 0, 30)
	setx	data_start_6, %g1, %r20
	.word 0xba444000  ! 906: ADDC_R	addc 	%r17, %r0, %r29
	.word 0xb5a00560  ! 908: FSQRTq	fsqrt	
	setx	0xb208404c00000c84, %g1, %r10
	.word 0x839a8000  ! 910: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
hwintr_1_32:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_32), 16, 16)) -> intp(1, 0, 37)
	.word 0xbba5c840  ! 913: FADDd	faddd	%f54, %f0, %f60
	.word 0xb32c0000  ! 917: SLL_R	sll 	%r16, %r0, %r25
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbd3d2001  ! 922: SRA_I	sra 	%r20, 0x0001, %r30
	.word 0xb3a94820  ! 923: FMOVCS	fmovs	%fcc1, %f0, %f25
	.word 0xb01d4000  ! 930: XOR_R	xor 	%r21, %r0, %r24
hwintr_1_33:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_33), 16, 16)) -> intp(1, 0, 3d)
	.word 0x8d942006  ! 936: WRPR_PSTATE_I	wrpr	%r16, 0x0006, %pstate
	.word 0xb1aa4820  ! 938: FMOVNE	fmovs	%fcc1, %f0, %f24
hwintr_1_34:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_34), 16, 16)) -> intp(1, 0, 16)
	.word 0xbda50920  ! 941: FMULs	fmuls	%f20, %f0, %f30
	.word 0xb0b5e1e4  ! 942: SUBCcc_I	orncc 	%r23, 0x01e4, %r24
	.word 0xb3aa0820  ! 944: FMOVA	fmovs	%fcc1, %f0, %f25
	.word 0xbfa80820  ! 945: FMOVRLEZ	fmovs	%fcc1, %f0, %f31
	setx	data_start_3, %g1, %r20
	.word 0xb9510000  ! 948: RDPR_TICK	<illegal instruction>
	.word 0xbda00540  ! 951: FSQRTd	fsqrt	
	.word 0xb235c000  ! 952: SUBC_R	orn 	%r23, %r0, %r25
	.word 0xb5a40860  ! 953: FADDq	dis not found

	.word 0xb7ab4820  ! 958: FMOVCC	fmovs	%fcc1, %f0, %f27
	.word 0xb5a84820  ! 959: FMOVE	fmovs	%fcc1, %f0, %f26
	.word 0xb5a80820  ! 963: FMOVRLEZ	fmovs	%fcc1, %f0, %f26
	setx	0x172edbb800003ad7, %g1, %r10
	.word 0x839a8000  ! 964: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb9a00540  ! 970: FSQRTd	fsqrt	
	.word 0x8d95a0b0  ! 973: WRPR_PSTATE_I	wrpr	%r22, 0x00b0, %pstate
	.word 0xbb480000  ! 975: RDHPR_HPSTATE	rdhpr	%hpstate, %r29
	.word 0xb3540000  ! 976: RDPR_GL	<illegal instruction>
	mov	0, %r12
	.word 0xa1930000  ! 977: WRPR_GL_R	wrpr	%r12, %r0, %-
	setx	data_start_5, %g1, %r18
	.word 0xbbabc820  ! 979: FMOVVC	fmovs	%fcc1, %f0, %f29
	.word 0xb3aa4820  ! 982: FMOVNE	fmovs	%fcc1, %f0, %f25
	.word 0xb7a81820  ! 984: FMOVRGZ	fmovs	%fcc3, %f0, %f27
	.word 0xb1a00520  ! 985: FSQRTs	fsqrt	
	.word 0xb1510000  ! 986: RDPR_TICK	<illegal instruction>
	.word 0xb1358000  ! 987: SRL_R	srl 	%r22, %r0, %r24
hwintr_1_35:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_35), 16, 16)) -> intp(1, 0, 26)
hwintr_1_36:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_36), 16, 16)) -> intp(1, 0, 35)
	.word 0xb3ab0820  ! 995: FMOVGU	fmovs	%fcc1, %f0, %f25
	.word 0xb1643801  ! 996: MOVcc_I	<illegal instruction>

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

	.xword	0x9dabd758468ff844
	.xword	0x82d2efaa6d8cd1cd
	.xword	0xe769e707715c5df3
	.xword	0x12ab280009eae0b7
	.xword	0x8c9ed111a1491124
	.xword	0x30772ffe413329de
	.xword	0xfc75a6d9f6c5ccc1
	.xword	0x47659cc242b07d26
	.xword	0x161c93b4167d29d8
	.xword	0x8fa4b6102b4eff9c
	.xword	0x3f2c8c8f1ecae20a
	.xword	0x8fd537f8d899cc84
	.xword	0x957105f82175154d
	.xword	0x1fafc32aeca64b08
	.xword	0xe8f65ca3f3e039e1
	.xword	0xe258b5a7d42e3091
	.xword	0x8f5a5764e3894e68
	.xword	0x7787334d5287c2a6
	.xword	0xb2b5033da1604697
	.xword	0x15c71c42650eb153
	.xword	0x0fbace7e88257b66
	.xword	0x0814837fa536a36a
	.xword	0xceffd76de024a292
	.xword	0xb2e2fec0a29db729
	.xword	0x9bc830f425a66ce1
	.xword	0x3d6a96e42c5d9382
	.xword	0xc902413632d60372
	.xword	0x13e87e035619f3e3
	.xword	0x750481369ed12133
	.xword	0x6ad3de546a5f23b0
	.xword	0x0b246c83ca9f0c95
	.xword	0xc7efdacdd0c3d915
	.xword	0x84f615835c2197df
	.xword	0xb03fa873e1b40c3d
	.xword	0x6a9a3fc7c168f26d
	.xword	0xe5c41a7a51535193
	.xword	0x230eba25a53e1367
	.xword	0xe021b0b5b7f778b5
	.xword	0x0da69a6ab9dd96f7
	.xword	0xb1678bf2c6937c14
	.xword	0x783373f5d8c554d4
	.xword	0xbfb72f626f2767cf
	.xword	0x8ca0f67e475d391b
	.xword	0xa0da5f7ea26c284a
	.xword	0x1e6ee909cff6f100
	.xword	0x9ddb054811ed33e5
	.xword	0x634ee79f43f9eec9
	.xword	0xeba7843a5443a03c
	.xword	0x01725636d8f1a207
	.xword	0x0ec445fa0301ca2f
	.xword	0x841a85d7fe60d47d
	.xword	0x39da50dad51eb1f5
	.xword	0x094456738fad5b50
	.xword	0xf585cfcc219a48bd
	.xword	0xdca3869db552eb2c
	.xword	0x4b6589706363a70a
	.xword	0x5709105de5e9dd88
	.xword	0x65147f36fbe5f3cf
	.xword	0xb610fc854c79fc61
	.xword	0x3c3bc7922e67fc35
	.xword	0x66c3ce16b4a7c1af
	.xword	0xf0eda41960a59874
	.xword	0x00067fb89375de7d
	.xword	0x38ec38c41ac48325
	.xword	0x737a579cc1f1130e
	.xword	0xe5fcef205ce105ed
	.xword	0x8f7f09dc86361324
	.xword	0xbf269c2fd6b8cba4
	.xword	0x15c4b8a88895ff3c
	.xword	0xeca0312060c0feb0
	.xword	0x06673ab4d2449a1b
	.xword	0xed531183f93a13f6
	.xword	0xefb4b87108c8c746
	.xword	0xa95820bb8d1f6413
	.xword	0x78698caccf7effcc
	.xword	0xc096db378e414957
	.xword	0x83377b5ffd6cb6bd
	.xword	0xce22ac171efe56be
	.xword	0x17e37970708054df
	.xword	0x05aafb7cf81dd863
	.xword	0x2b855e5a576aa6a9
	.xword	0x03408c4df733a0d8
	.xword	0x87349b68814cedca
	.xword	0x9d0feb911c654923
	.xword	0xd5f1a6218ddeccd1
	.xword	0x7692ba798c9c8cec
	.xword	0xaf1ffe32e607d233
	.xword	0x34f30cb30910de3a
	.xword	0x7cae049f2393c453
	.xword	0xd02e399f6194cb7e
	.xword	0xdce10ae4c5116643
	.xword	0xc5da95d85cba4d62
	.xword	0x4574865e17f29a3d
	.xword	0x905e0c76dde1602e
	.xword	0x0f0553f4b5363421
	.xword	0x76a6712e4e703c07
	.xword	0x6dbc3d0ddeb1881d
	.xword	0x91380dd355254e4d
	.xword	0x18b11a6dc1db084d
	.xword	0x51620f6a896f9151
	.xword	0x09e219f207239c6b
	.xword	0x945ae8a2325b14b1
	.xword	0x029adabb58910003
	.xword	0xf97a852673a0027a
	.xword	0x1c81c6e2fbdda4ae
	.xword	0xf53cea08427460c9
	.xword	0x82f82c2668cc2751
	.xword	0x4e37b9a336c50828
	.xword	0x1d577dbaa5e1a66f
	.xword	0x626b901e2129b303
	.xword	0x79776d91f71b65d9
	.xword	0x0d5d6e18030ea108
	.xword	0x7574117c56000dc3
	.xword	0x23b03e6109e15820
	.xword	0x8e60bbec20bd504b
	.xword	0xe6625a94dadf4c4a
	.xword	0x59f98315b718eadf
	.xword	0xd183a6552026cfcf
	.xword	0xe57f954fab286f0a
	.xword	0xf19d03ebc41793e8
	.xword	0xa0ecbd8516f7422e
	.xword	0xec5160694de72e81
	.xword	0xbca4c226616d65ed
	.xword	0xfeb7297c9052092f
	.xword	0xdf0dd4a917513681
	.xword	0x071a472b05275582
	.xword	0x03c264751cdc068a
	.xword	0x32d900b7af17bf07
	.xword	0x58a7eba23244e4da
	.xword	0x8e3a3433ac5df266
	.xword	0x48224aa427ad3500
	.xword	0xe12ec32ab87620c8
	.xword	0x29a5c1a23000e8f0
	.xword	0xd999b633f5763db5
	.xword	0x85f812487f8fc6bd
	.xword	0x4a7590963245c61b
	.xword	0xb770d3df4d4e605d
	.xword	0x93039bb9d8a302d9
	.xword	0xc0823bae0cc8cfa7
	.xword	0x117b911f0b10c93d
	.xword	0x7be3bf8b5fe735f4
	.xword	0x61482e6823781166
	.xword	0x4c40f0a5c6ec242c
	.xword	0xbb01a0e52ec57a0a
	.xword	0x048ab1a55ed90ade
	.xword	0x89823fe9aaab130d
	.xword	0xb42da4463e35f8ff
	.xword	0xb42060f56190de38
	.xword	0xecc7f04ce939774b
	.xword	0x47787fcf6edbc351
	.xword	0x8a519ca030ee3edb
	.xword	0xedef32ab96338646
	.xword	0xf3b52d71116f0e5a
	.xword	0xf3adea5c039418b7
	.xword	0x5cf0066d89f988d7
	.xword	0x90af7db8092a429a
	.xword	0xf62d4f688da3e8aa
	.xword	0xdfd19d1b1c71a24f
	.xword	0xef407e1cc3fb461a
	.xword	0x2d662107a583886d
	.xword	0x024c6b0acd79f3ba
	.xword	0xe9df737cf5c491fd
	.xword	0xf4249d0068aa5df1
	.xword	0xfb7e19d64666f316
	.xword	0x09011c457ceaebd3
	.xword	0x6da03ad73d85e0a3
	.xword	0x01f1b08f39c2600a
	.xword	0xa3678e53f83b30f0
	.xword	0x7769a81accdfb74a
	.xword	0x8c2a458f317e67ce
	.xword	0x78d56d9930ac2a50
	.xword	0x3206094ec1423473
	.xword	0x50e7abe8aae8365e
	.xword	0xab0a5e80ab704cdf
	.xword	0xf2dc214b28f6ab8d
	.xword	0x00d2b2234fc1bc7e
	.xword	0x3e35391f36b3f389
	.xword	0x7a57b15473710dcf
	.xword	0x6531d6be0a80499b
	.xword	0xa20cf0b01022f243
	.xword	0x1a6b71d8a36429a7
	.xword	0xe409a24b7ae05adb
	.xword	0x5a26e8ae5d7d06a6
	.xword	0x2dacdda57623536a
	.xword	0xffe286f1f70f2c2e
	.xword	0x1f0418ed3f54d0a2
	.xword	0x63411117338a112f
	.xword	0x4acd3a4e4acee2d6
	.xword	0x7da8c5dcaa7fcdc4
	.xword	0xf8a75d6dda960b8b
	.xword	0x869c2649d0f8a426
	.xword	0x252f9ea4274d6ea3
	.xword	0xced635edc4121bf2
	.xword	0x25d63a9a56b0872f
	.xword	0x73ba9e9eb1a0a185
	.xword	0x0609333dcb3d6563
	.xword	0x2bbf8713b1f9a12f
	.xword	0x0287e922d2818694
	.xword	0x8ac2630aef2695de
	.xword	0xa7893964bbebad4e
	.xword	0x4736e5bf5ce1d1ea
	.xword	0x6c3e5b078bac9cdc
	.xword	0xd0c4dcf189a56897
	.xword	0x14cbaa68e378b2b0
	.xword	0x835fb246c1b0abce
	.xword	0xb45d06cbdf834439
	.xword	0x39bff55f112084de
	.xword	0x2325864edbb834a6
	.xword	0x0a753b0328915035
	.xword	0x457554737d848e26
	.xword	0xc4811516d0bf682d
	.xword	0x0bd8b7928ccdc94e
	.xword	0x868c3b81c6c48035
	.xword	0xf06283a85acca4a1
	.xword	0x9b8a4a007d32fdf8
	.xword	0x5654e8181811be48
	.xword	0x3910e21fee75c81f
	.xword	0x986962679de5fb59
	.xword	0x46420374a972e5af
	.xword	0x13b3e3d633e98ba2
	.xword	0x78f40d715f87bb13
	.xword	0xa1a2b1fe7688fccc
	.xword	0xe9e61a93a24434f8
	.xword	0xcf3724dfa7e5778c
	.xword	0xaf3ba5ed629d46e2
	.xword	0x18706ab77eba9dff
	.xword	0xcec48c78a466e90e
	.xword	0xa69de3ee61726b11
	.xword	0x6867d8041cf44019
	.xword	0x434e674715a08de5
	.xword	0x32cc961e0a5f02b6
	.xword	0x12a7315ceb993129
	.xword	0x1bde3db67e45acc8
	.xword	0xb8eb2eeabb51e452
	.xword	0xa6a6eed7e80dfc44
	.xword	0x0a7171a2a8a912c9
	.xword	0x1ebe838a385f3882
	.xword	0xca3726a362431c1a
	.xword	0x14e75959b56c8590
	.xword	0x51c14031ca02bdd1
	.xword	0x55583249d263c16a
	.xword	0x5b0ae8dc01a8f1e7
	.xword	0x0b14ca4d3e04c7db
	.xword	0x074df3f20b02e100
	.xword	0x09b6cc872822203d
	.xword	0xf9e4d8ceada5b3ef
	.xword	0x0bf2dae31052d44f
	.xword	0x28bac318bd2b77f3
	.xword	0xf0028ba44486ffca
	.xword	0x2244134744e8e8a4
	.xword	0xdded3519454fef33
	.xword	0xfd4cf73aa7ae792c
	.xword	0xe5a3b7796638e9fa
	.xword	0x2274aececbadf755
	.xword	0xce6ed857a774d82d
	.xword	0x28e7069b1babf21b
	.align 0x2000
	.data
data_start_1:

	.xword	0xb85ca1b9b143f6eb
	.xword	0x6993f6f280499cea
	.xword	0x0db3822c8549d35c
	.xword	0xd80f52efae36c991
	.xword	0x52f411823458d50f
	.xword	0x3bc03ee6afa5cba3
	.xword	0x65e222681e41a20d
	.xword	0x4f5cc42300ea6526
	.xword	0x7016923a19567285
	.xword	0xf7858e26da4564a0
	.xword	0xbd0c7d32ff18bd6d
	.xword	0x8240fea82b854cf0
	.xword	0xbd3a74a8f4abab4c
	.xword	0xe07524f05a1c04a7
	.xword	0x0cbda08aee93f36d
	.xword	0xe7ed2384e4609075
	.xword	0x4102145775aa0c1f
	.xword	0x829a31a07d59a238
	.xword	0xc959bfeeb629b39c
	.xword	0x00f4443e3fca3c07
	.xword	0xa67387b9f085d616
	.xword	0x331b105d41c36479
	.xword	0x2e2fb1ffdf2e4248
	.xword	0x093b35d5ecd4560b
	.xword	0x704d3b385a660d94
	.xword	0x7725a57da8c0dbc0
	.xword	0x299a43b6a4822cab
	.xword	0x05f1eac5aa54f98c
	.xword	0x23a9d177cca461a5
	.xword	0x23e93145836bd8c5
	.xword	0xad99dac9af11c355
	.xword	0xc066420cb431df59
	.xword	0x4ec9d964fb67c355
	.xword	0x20c32baaede33605
	.xword	0x341c906541056908
	.xword	0xb59b4b7bf3caee7f
	.xword	0x217281d857d2045f
	.xword	0xe60f40795f61ebbb
	.xword	0x234b98a905e6d38f
	.xword	0xb447425129fc2a85
	.xword	0xcfc814a6c5549cae
	.xword	0x24ee8d796904e500
	.xword	0xb0654cf3e27506e3
	.xword	0x7bb7ab78649e2d95
	.xword	0x6b6d794f2ad53ba4
	.xword	0x792839e1d5862718
	.xword	0xfe7fc8f8404c84e0
	.xword	0x25fb08396c9c52cd
	.xword	0x5f1b7a144654a31a
	.xword	0x010203bcdea0e1de
	.xword	0x8e1d18d10b213aeb
	.xword	0x0f51b91a273a3961
	.xword	0xa85a9bbc85d2cd85
	.xword	0x62064b113d901bb2
	.xword	0x0e1741671ff52186
	.xword	0xf85ae94036d6b974
	.xword	0xb9af6f0d4bd3998a
	.xword	0xa84bf9d828b89be4
	.xword	0xb16772ada9aab944
	.xword	0xebd0caac6aad0477
	.xword	0x205f87e79f7c7369
	.xword	0xd20356dedd396b6a
	.xword	0x4284f114151f89c5
	.xword	0x92fdb943bf0a7540
	.xword	0x84bdd95f163f345a
	.xword	0xb2b0732e58be0358
	.xword	0x2a87ae4ce4eb384b
	.xword	0xafaa607fe882eab1
	.xword	0xdba7d14eca7d2138
	.xword	0x48377c6028082e68
	.xword	0xa7e6b9545aa83561
	.xword	0x8ad9e44fca6be9b8
	.xword	0x5ced611cbba80313
	.xword	0xe617487c5c526606
	.xword	0x95a6afa79e691cba
	.xword	0x6ac8f4e099478a7b
	.xword	0xd5da463f3b8d2a85
	.xword	0xebba181251795186
	.xword	0x4286bc082f205abf
	.xword	0x2912ef3f12971bb3
	.xword	0xacf48405a433e5d0
	.xword	0xe2f74a42e9fa0219
	.xword	0x055104a58e619504
	.xword	0x05d169df8c6268a3
	.xword	0x4ef2f467483a6e30
	.xword	0x780d85315042b512
	.xword	0xcc8cfaa686eaf616
	.xword	0x087421783f2b83da
	.xword	0x52c6bd2aaa293873
	.xword	0xbdf9749c60945501
	.xword	0x37a70c0ebe24c1b6
	.xword	0xf4dbf59514091092
	.xword	0x7fa25c3b2c15d793
	.xword	0x0e365cef7e7b008f
	.xword	0x6cb9234e49cb6c5d
	.xword	0x94927e013caabee8
	.xword	0x16a152e3b4bccefd
	.xword	0x45269096a9d07942
	.xword	0x8ed707ebaf7e0b62
	.xword	0x383951e6aa9b4323
	.xword	0xe8a0228d42c8df67
	.xword	0x927f3bad3a79d9df
	.xword	0xe6cca0ae8da0b770
	.xword	0x933caded4e9bcc46
	.xword	0x90af5803b5f8d34f
	.xword	0x2aaeeaf46cacb5d6
	.xword	0x2241178c6cf55b50
	.xword	0x3eb4b5066544cdfe
	.xword	0x917073626c7a86a0
	.xword	0x04f25e0b00e50b8a
	.xword	0x48e9d9d40aa4807f
	.xword	0x35562014843cd009
	.xword	0x6acec1d091516713
	.xword	0x5776dc874ccd1c28
	.xword	0x0a6d3d8af49bbb8b
	.xword	0x879e356bf65ae244
	.xword	0x67274b6764ce0864
	.xword	0x236ab19f77a7cc4d
	.xword	0xe35f8cf9fa42f00b
	.xword	0x7a3e2af987524a76
	.xword	0x45ed712abf45dca7
	.xword	0x01d001ecd10d9d55
	.xword	0x0aafd3a6f6e893ff
	.xword	0x515825aef5367efc
	.xword	0x4b7802bc3d6eeebc
	.xword	0x222231c73930c91b
	.xword	0x55a41e72c1bac220
	.xword	0x1b1bf291c2538f4e
	.xword	0x9fc55eb2652cc9c9
	.xword	0x3b92646d93ed08fb
	.xword	0x4c66417790bb679a
	.xword	0x6161b0044162f70e
	.xword	0x4df2f9242fcd4a35
	.xword	0xe852f3219e41e116
	.xword	0x55c645f0afef8e63
	.xword	0x66723291508cc958
	.xword	0xe8b9c7497477e462
	.xword	0x4ef0dee60d5fe5ad
	.xword	0x1894b6292ed2636b
	.xword	0xfd3c18f6b7863ee5
	.xword	0x7a4f103b3774d538
	.xword	0xb3ebca4f5c7112eb
	.xword	0x23e525c062ca89e2
	.xword	0x5f1c2b78b35c4ca3
	.xword	0x06878d0c6217b30d
	.xword	0x166bfdcd0de50faf
	.xword	0xde952decd74b9082
	.xword	0x606fb0ec14778bd4
	.xword	0xd192d0a0d8e6c26c
	.xword	0x541a723445fbb5e2
	.xword	0x782d47d64fb3a89b
	.xword	0xae3741b92d762214
	.xword	0x741d2e84a13bd82e
	.xword	0x4b6116f4c0ca4c6a
	.xword	0x013da7dc36ba6ae0
	.xword	0xa20941df87db4a04
	.xword	0xd9ab35a24c4b7a0c
	.xword	0xeac67857bdab588c
	.xword	0x49d06c0de1429ac7
	.xword	0xf5ed32063cd8fd9e
	.xword	0x4fd04feb4883c5a1
	.xword	0x438390b9d9e46c80
	.xword	0x235aef1bd8417c14
	.xword	0xb632a999ab7ecbf4
	.xword	0x8c1afa31f757ce85
	.xword	0x3cc4ad7bbf5a9a40
	.xword	0xe23b68997d4d54a1
	.xword	0x2907b8b95dbbde2a
	.xword	0x2c7d812fec6a3312
	.xword	0x874620ea1fb062be
	.xword	0x89a6fbe2cf0bbb89
	.xword	0x06de98eaeaa0b037
	.xword	0xa2a96cdd5b8ccd46
	.xword	0xd1d26d9f7ce33ac9
	.xword	0x7fdc3bf6f9fb0388
	.xword	0x8fe64ce246992762
	.xword	0x597dacbf4445deca
	.xword	0x9dba2d178912b8b6
	.xword	0xcf990fe06c5c4575
	.xword	0x6d32635a7712cbc5
	.xword	0x4bf82ea2eabcc921
	.xword	0xd1c1ad86e572f78e
	.xword	0xe4b543dbc58ea619
	.xword	0xd9a83f7fe34d32b0
	.xword	0xb1e464a5c74e1a40
	.xword	0x587abbd513e4b441
	.xword	0x0a29ab90258124bb
	.xword	0x1e0bc82bd400da19
	.xword	0xd4171432d360cc19
	.xword	0xbea186f84fd52809
	.xword	0x224c15a77c023a8b
	.xword	0xa365b2880a03533f
	.xword	0x65985782bbce2ca5
	.xword	0x1a6def9ca8e02b28
	.xword	0x3af1c941dc8b7f0b
	.xword	0xc9101ca38887a29e
	.xword	0x75f5ba71c9ea5122
	.xword	0xfc7a427d4b3720e0
	.xword	0x18dd7d515f3cf245
	.xword	0xccec3e21fb6bd56b
	.xword	0xfc7e77268e970921
	.xword	0x0896cbfcf5826208
	.xword	0xc99d411a672ad210
	.xword	0xf2251be3f92d462c
	.xword	0x7b9cc9edc6a758a0
	.xword	0x911d6da3f9ebaa4f
	.xword	0x5bdbad356a28aa10
	.xword	0x932637e0d3b93113
	.xword	0x8d1986b88883ab89
	.xword	0x027ad069a7db3036
	.xword	0x9879d4d0f8b066d2
	.xword	0xf7f2c32694e23ab8
	.xword	0x94ac1731b1561e61
	.xword	0x9a7c17c2ec5f5bfc
	.xword	0x2faecc0bb15878e9
	.xword	0xfb7a2a1b3bf2f24a
	.xword	0x87761e0d5fe12bac
	.xword	0x3087fdb53706482d
	.xword	0xa1afa1447217ab46
	.xword	0x789d1f949422b738
	.xword	0xfb98e6c541adea08
	.xword	0xde1c74e0e335fe9c
	.xword	0x3a6a6be0c5332aa5
	.xword	0x2955fd03966c049a
	.xword	0xef61cd8375d1e253
	.xword	0x8f6109eca41bbfc5
	.xword	0xaf93009442b0cafa
	.xword	0xe13df4710bd937fc
	.xword	0xec5ada04fa4867e6
	.xword	0x9949a6cf68f5fbe8
	.xword	0x3dc9f829169b5baf
	.xword	0x41c6113f275fa28a
	.xword	0x8e31c6c126f3266d
	.xword	0x75421d45e0ef674f
	.xword	0xb41b4b01b3f7e3ba
	.xword	0x9defb2b35f65e39c
	.xword	0xf2614c6615d6508a
	.xword	0x7df078dc0db9eddf
	.xword	0x6ccdd28658bbdce5
	.xword	0xe7460e2168b6b3ed
	.xword	0x916d08c01b08ab12
	.xword	0x6c6b94053b0cbc2b
	.xword	0xb8324bcb7950a376
	.xword	0x50e5b8e2262b39e5
	.xword	0xeca964895e30ef02
	.xword	0x84c7fa3191e82208
	.xword	0xd1a9c5dae78ee01c
	.xword	0x61b3774d42e98d93
	.xword	0xc3fc3b47951fcf3f
	.xword	0xbfc2928f71f45d3f
	.xword	0x0cf3b8ddad9461b6
	.xword	0xb1e6c18d7644ea0c
	.xword	0x190f718aef038bb1
	.xword	0x0899d4aba7207f0a
	.xword	0xe50337524157ff1e
	.xword	0x24fcd6440f7c44cb
	.align 0x4000
	.data
data_start_2:

	.xword	0x0f7bad7157c9bb5a
	.xword	0xf2105a4e6cbcbedd
	.xword	0x23ea1e0c0fd14ccc
	.xword	0xbdac5926c67f5199
	.xword	0x265a5d280d22d405
	.xword	0x723fad29887166c8
	.xword	0x33a073e8b7d50395
	.xword	0x4f34d7eef0bb29c2
	.xword	0xca528105e0fae9a3
	.xword	0x64076cd756c1e68e
	.xword	0x1c578c35db517e44
	.xword	0xe635939f53de87f6
	.xword	0xdb0543ca8d5e1b02
	.xword	0xdc96d2a60c09942e
	.xword	0x48d62e78db56d8e2
	.xword	0x9aec830f502df91e
	.xword	0x97f24311766a1d02
	.xword	0xcf2392d5057da4c9
	.xword	0xd16ddfc541b15d68
	.xword	0xf09844087e7e2971
	.xword	0x6790b8fd7680ae1f
	.xword	0x1f3749c7295337ec
	.xword	0x1a7e6458ad613e2a
	.xword	0x86e2c58f22c54d22
	.xword	0x4d8fa189a332b9ec
	.xword	0xc4143de93e250fbb
	.xword	0xc716b5c76fe2b612
	.xword	0xaf54f862c92787ce
	.xword	0x39c26e5ffeb140c6
	.xword	0x3fe3c3dcba1eebd3
	.xword	0x913dad0d16193c29
	.xword	0x6649cbefbb8e406c
	.xword	0x1f78d1f6d7e11392
	.xword	0x8f11d344de21a574
	.xword	0x30f945cb2bd48bde
	.xword	0x4c6c7bbd01249a81
	.xword	0xd9f480068d0db365
	.xword	0x2e3a8af52fc19749
	.xword	0x2f7a227b3c670d18
	.xword	0x6afa2f9bef2ce685
	.xword	0x44b4bc85a049c24f
	.xword	0x663598e718b32447
	.xword	0xae45910b462efbc6
	.xword	0x48308c65e5cbaa4b
	.xword	0xb3bf0a0ec76390d4
	.xword	0x66e28bb7b2c06191
	.xword	0x02ee93a90e52e9b0
	.xword	0x043597fc39102b3e
	.xword	0x661e4d49011eef4b
	.xword	0xaedad9be1223689d
	.xword	0x67fc028ee95c2a13
	.xword	0xa508fcbdce0caba4
	.xword	0x84612433bd0ca200
	.xword	0xffcdba91543eb2c6
	.xword	0xfcde3223848a5aba
	.xword	0x1f1a969d5d09b2fa
	.xword	0xbb3135a1b9718076
	.xword	0xd33752ab655c3f69
	.xword	0x77dd471c9c2c7696
	.xword	0x9ae6bceb00059f02
	.xword	0x940d1923069c6e1e
	.xword	0xbaa6cb8978a8ebb5
	.xword	0xff01c941e7f30768
	.xword	0xe6203adec5094dd2
	.xword	0x6738c442d4aab539
	.xword	0x4abae18e68a946d0
	.xword	0xa4e7342038091969
	.xword	0x741f5c4af7296e5a
	.xword	0xf3b28ffeb60b91e9
	.xword	0x3f0b444408bc81b3
	.xword	0xce1ec27bfceaa665
	.xword	0x64da1b40ad25258f
	.xword	0xfdd486cdb86d4943
	.xword	0x0d7fc88201d0e62c
	.xword	0xb903fc34ae470731
	.xword	0xca1125c9fc202070
	.xword	0x2ea42d458a1cbfe8
	.xword	0xd6c321fd2b7a2e34
	.xword	0x750659081b9a279d
	.xword	0x6a85da8a42564989
	.xword	0xecbe1fed0587b0f1
	.xword	0x8d7a7eface803efc
	.xword	0xafe8a74cfdeb3676
	.xword	0x0d5b71720fbf682d
	.xword	0x64361bc8d8862502
	.xword	0xd3dced99d8499983
	.xword	0x08e800603735c5a0
	.xword	0x951657a72efa7478
	.xword	0xa467dc651fadc7a5
	.xword	0x84d16c818cda6dc0
	.xword	0xdaa0c2d11ce99a29
	.xword	0x5931ad6bb328fa34
	.xword	0x483dc7291596d00a
	.xword	0x5f7a9c23da5eff3f
	.xword	0xddfeb286de8aceac
	.xword	0x4e7f66145124276d
	.xword	0x3634771f1275207b
	.xword	0x389109dc3538281a
	.xword	0x2ad5f0618d141d60
	.xword	0x7f29937284cc3322
	.xword	0x0a9c7c26c7cd80dd
	.xword	0xdf0f1def23a9a6ff
	.xword	0x2cb1bb2274733ebc
	.xword	0x49765e5725ebe417
	.xword	0x56a91fef774a97ef
	.xword	0x88992e10cba452be
	.xword	0xb80545fe94600edc
	.xword	0xb9ba7ac6af675d7b
	.xword	0x39a89c528c85b534
	.xword	0x964f6002159b9d41
	.xword	0x6c967eddacbc1222
	.xword	0x632e156aedd72c2e
	.xword	0x5f1e54f4bf6f0cf0
	.xword	0x4bc4538f07afa064
	.xword	0xa84c5cccbf39b1dc
	.xword	0xd467502460400b28
	.xword	0x2298b9b6f5b707ae
	.xword	0x5461ed1a52edcd25
	.xword	0xbf1bb9f10fa06049
	.xword	0x37444b9dba2c4256
	.xword	0xa3d7525c102734e5
	.xword	0xd290ddb0d715a1d3
	.xword	0x17e9fa2d60c8a43c
	.xword	0x9169e5f0d19fc759
	.xword	0x1d878a18b6d7ee38
	.xword	0xd57b949ec27c5ec2
	.xword	0xbd3bb03a2cfcd9b2
	.xword	0x2deda742fd1ad99d
	.xword	0xe64cb5d208795f88
	.xword	0xe594f84e8cf325fb
	.xword	0x9db5934123e0248c
	.xword	0xc88a791244e82eb1
	.xword	0xf7e40ddf920f98b0
	.xword	0xd80a6576e4b063a0
	.xword	0x87883659615850dc
	.xword	0xe5b00e7bf58d3a3c
	.xword	0x76c4a1deff58193a
	.xword	0xc150d99a81b516ae
	.xword	0xa96f9613b9aee6d6
	.xword	0xcd31ed16bfd63b96
	.xword	0x34f093776895af44
	.xword	0x18e9d6c929a10edc
	.xword	0xeb89cc9e43d64ec1
	.xword	0x44d1053da30c9364
	.xword	0xf923da3a9cd162c5
	.xword	0x9a06272d86240c04
	.xword	0x6b482000465c3ccb
	.xword	0x08c088ccc517008c
	.xword	0x1014e55c2ab387c0
	.xword	0xb84d752987a87f06
	.xword	0x9514a66511770f0d
	.xword	0x24ce3621a584054a
	.xword	0xc3cee11b65092604
	.xword	0x47c05d0c1bc3dfa3
	.xword	0xa4a9fc7dc5076810
	.xword	0xc0f089b28974ed08
	.xword	0x0b52f34f7972a5b0
	.xword	0xf4576f7239cbf2af
	.xword	0x22613cb394377291
	.xword	0x2951b6636af4280a
	.xword	0x40481179f5898c3d
	.xword	0xfdddcf1d7dd1cfd8
	.xword	0xa17c2ccf163e2e3b
	.xword	0x4aa655790f5203d4
	.xword	0xc40c7d731ff7d8ff
	.xword	0x255298a6c165abf0
	.xword	0x2123bd1d0cbefe91
	.xword	0x97440ae9855efbb6
	.xword	0x06dab7ee142473bd
	.xword	0x7b9b414d65a38c08
	.xword	0x60851792e71eb136
	.xword	0x3718578bf826bd1c
	.xword	0x4fb9b0cfa7fc785a
	.xword	0x2c12559529d4416e
	.xword	0xbcf01ab4c3a0bfc2
	.xword	0x4fef5b7ff2362149
	.xword	0x30dfd8e1b5681089
	.xword	0xb0865d6987809e8a
	.xword	0xd5c5ff8a17f9bc0c
	.xword	0x2c93b847c4b0141d
	.xword	0x3467fddb383560a6
	.xword	0x5c150c770f3b20c1
	.xword	0x46daec15b2fda670
	.xword	0x03f217d46e74d38d
	.xword	0x0901ced79ace0fd8
	.xword	0x94a1d0a52d7541f0
	.xword	0x3a95b4c9e7ef4414
	.xword	0xb8d15f1c9492efbd
	.xword	0xa1b8f1a12300b1cf
	.xword	0x8e02bd27c59793d4
	.xword	0xf6e59de4b0dc8a1e
	.xword	0xdd5a4df6091c83b3
	.xword	0xb26b1a2e040073f4
	.xword	0xa3ff25e45c8ed6cd
	.xword	0x19571fd215ea0eb2
	.xword	0x6da056ea55335abc
	.xword	0xe0f59ee5b3cb154a
	.xword	0x33746171c39c5662
	.xword	0x8b654f037d9665f0
	.xword	0xadd89acc56106d03
	.xword	0x46fa558bb24e1493
	.xword	0xca96c34dc36046d6
	.xword	0x33f0704f77255f71
	.xword	0xab7d510a5be23824
	.xword	0xa8157da0bf6ca314
	.xword	0x4d439c3422cea74d
	.xword	0xd009e0313bd426c5
	.xword	0x51022af391e93b63
	.xword	0xd242b0a546eb5adf
	.xword	0xdce48ce435f888fd
	.xword	0x8d86ed0b4586cb9f
	.xword	0xe550ea87454538b7
	.xword	0x39e18fbfe703791c
	.xword	0xbded9b3a14a013fd
	.xword	0x00652b91f3f5aa7c
	.xword	0x78d87dff5db74036
	.xword	0x66e11832ff9c6425
	.xword	0x342d3a4c6c74a707
	.xword	0xdf90199f6b70d96a
	.xword	0x27c190393fc3d0f8
	.xword	0x03b2d9b400590e65
	.xword	0xc368ca000ce1f756
	.xword	0xd68636b26db4f676
	.xword	0x292ace2fc7dcdf14
	.xword	0x296fdbd082e60170
	.xword	0x1b61c2f92631fdda
	.xword	0xb9b0d82150ba3ea2
	.xword	0xa848af9e0f60404c
	.xword	0x35ece05ccf5f95b1
	.xword	0x128c7dc97b99a408
	.xword	0x0d77a54013222bb6
	.xword	0xe836c837f6c9503d
	.xword	0xc03b54caa8e53ab1
	.xword	0x5fcc8135f75b5218
	.xword	0xb5a6caa7d6471230
	.xword	0x9805f0b59232b861
	.xword	0x915f002e7b78a799
	.xword	0x8c2e2e0a3f2deabf
	.xword	0xbf17fa29e423c967
	.xword	0xb9977efe0a5be235
	.xword	0x3932b45b2880ee50
	.xword	0xe54754411d1a6817
	.xword	0xa0ba8660154a97f4
	.xword	0x7fc052cd2222bf6d
	.xword	0x558aabd69800ffe2
	.xword	0x1601acfe1546ec43
	.xword	0x14738e56c23d0040
	.xword	0x7b8be04e4c87526c
	.xword	0x0c5ef390444d0c52
	.xword	0x06b7cb516acafaf2
	.xword	0x4d3b8223a1aab668
	.xword	0x384dd8cafda11e24
	.xword	0x8d8e9614022449d7
	.xword	0x1da95a1b5bd53099
	.xword	0xab029bf9b8e44af8
	.xword	0x66fa0a145bd07a03
	.align 0x8000
	.data
data_start_3:

	.xword	0x9be83072e491c42e
	.xword	0xaf548d6328c6b768
	.xword	0x12373f8c994c3784
	.xword	0xe73255ebe177587d
	.xword	0x5744ed9a319ca361
	.xword	0x9927cbfc2ebf9b71
	.xword	0xad684d27e455fcf4
	.xword	0xe5ae12e6922997b8
	.xword	0x4ff3217a3990bccc
	.xword	0xeddb9485093404d6
	.xword	0x315b87f39805ceaf
	.xword	0x230ef395c60214da
	.xword	0x8682515280a0bd3a
	.xword	0x991db5803d1c6fcd
	.xword	0xfefebb0c20c60f8d
	.xword	0x5add883c7b4b800f
	.xword	0x718f3767b4e6ec99
	.xword	0x969d7b7543a3509f
	.xword	0x9eee2dc635c982da
	.xword	0xe141641b46c855b4
	.xword	0xf7fc1618eb170393
	.xword	0x7c936a705960d794
	.xword	0xead1cbf29c5fef10
	.xword	0xc2402190bc514e54
	.xword	0xf9b80448b3bbe66d
	.xword	0xb2c114cfd96a33d4
	.xword	0x2826229b0536a716
	.xword	0xb52203a87b439a66
	.xword	0xb0d1195b34dcb680
	.xword	0x4d960553cd902ad2
	.xword	0xde95c63bd459963a
	.xword	0xcabb77084f8f4d59
	.xword	0xcb9231f2dd9ddd6c
	.xword	0x77bf1360991c2ee3
	.xword	0x8d5452bba92e72f9
	.xword	0xfab675d022a82f0f
	.xword	0x613edfa3f2e5dad5
	.xword	0xbc9e1d7e65ca115d
	.xword	0x2e0879a10f515a4c
	.xword	0x274f23cf4be566d9
	.xword	0x33f7766e40b54905
	.xword	0x58b47ffa797704b2
	.xword	0x785ac38c6fd07897
	.xword	0x848aa93095c5b5be
	.xword	0x793bec7d76de55d1
	.xword	0x9a6a5898809f079b
	.xword	0xd9b6735462fd467c
	.xword	0xe00a473312c26f28
	.xword	0x4225cef5636dac78
	.xword	0xeeb89f867dc0e0c2
	.xword	0xce16fe0537a4facc
	.xword	0x6d450562f66c7779
	.xword	0x4cd91742ef167b4a
	.xword	0x4e39d9e2122ad73b
	.xword	0xa4bfe8b769dcf322
	.xword	0x982de20a82fe494c
	.xword	0xc175474d4203185d
	.xword	0xddc2e3f254140c03
	.xword	0x9a723bbf886e25b6
	.xword	0x2e3f8b7ad0dd236d
	.xword	0xb6a4d2d8cfbcdf6d
	.xword	0xd0485bdf20b49214
	.xword	0x98be47c310dfec0c
	.xword	0xe0d8ed00c4e831dd
	.xword	0xf6cceaadd256425c
	.xword	0x5cf0dcc609d488e0
	.xword	0xeb259aa3ebc1b43a
	.xword	0x1c72e16f58d151c1
	.xword	0x822c9d081e86f643
	.xword	0xdd2359ee134e8ec5
	.xword	0x0d7f00c38844cd03
	.xword	0x17ed3ba30461a3f4
	.xword	0xd402308aece3ed20
	.xword	0x1f9c029d3afb272b
	.xword	0x23a9506008d3d100
	.xword	0x55b7577dd5794e1f
	.xword	0xda76aef4f2e00f3f
	.xword	0xebc2c9f9ffb14311
	.xword	0xc64ece7ee4852a93
	.xword	0xff90e0e0be278b27
	.xword	0xdde3aec652f4f341
	.xword	0x3ba7e99379e9b67a
	.xword	0x447bbf0a583789fb
	.xword	0xc0572a32977a373a
	.xword	0x6b1ee86c6f8b5238
	.xword	0x0d56d9856ea6478d
	.xword	0xdbc8b2bbbca2a8e4
	.xword	0x53c60834330d60ba
	.xword	0x012c6b630a2e6d6a
	.xword	0x0c43a1eef26361cb
	.xword	0xfa6cacaa06e69a85
	.xword	0x5b355a5e65a66d93
	.xword	0x478dfc5d64a19843
	.xword	0xc0e21a7bbaa18537
	.xword	0x3a5cdedf20f7e236
	.xword	0xdbe2bf08a4d6afed
	.xword	0xd42dc851606595c2
	.xword	0x72862bda994d1983
	.xword	0xedbdef89e6af230b
	.xword	0x02b78c2a6f19dabf
	.xword	0xed032af78982edaa
	.xword	0x09adf9ae2dddcbfc
	.xword	0xbc9ee2f257fbd87e
	.xword	0xdebcd42ba3af1ec9
	.xword	0x77eeccf4666b3169
	.xword	0xf43905db44418cb6
	.xword	0x449ad47995bb8e39
	.xword	0x04c3016b66b9f261
	.xword	0xd46c2028ac206417
	.xword	0xc39b384b9c24d073
	.xword	0x4ae167e8ad4d4e12
	.xword	0x004ef7067c5a693f
	.xword	0xa9e040cff832f92f
	.xword	0x5f0528100e465197
	.xword	0x7212b408ef7a995a
	.xword	0x402b1e2266331213
	.xword	0x6348bc064f73783a
	.xword	0x566612a4b8f46ad0
	.xword	0xaebe67a9c14a887d
	.xword	0x526b9e20a20e7a73
	.xword	0x169054f45d223945
	.xword	0x0c40f02addcd6c52
	.xword	0x343f9fac66c86023
	.xword	0xbb89acde801ca2d5
	.xword	0x6c3aa33647d3299e
	.xword	0x8a0728a9d8c74bc9
	.xword	0xd012fc17eb465c75
	.xword	0xa316b7d4d6868066
	.xword	0x78b5818453f8f96b
	.xword	0x032cdd0f2713bb4c
	.xword	0x2f120a70b83414b6
	.xword	0x2c4cc7ade99416cd
	.xword	0xf180cd5eae28ae13
	.xword	0x10cd51d86096bf5c
	.xword	0x29e9d90710fe2341
	.xword	0x743413830ee0ac2a
	.xword	0xf248439f9c8ffbc0
	.xword	0x720421e7c3539a23
	.xword	0xa3d911736a9301cd
	.xword	0x9123731a81b504ad
	.xword	0xabf4effd0ccc0bfa
	.xword	0x563c07386cf6b037
	.xword	0x809f9d90b114f1e5
	.xword	0xeaad67a9611e9aa1
	.xword	0xf9e505a3ff2b0b84
	.xword	0x0f3b9f7cbdb85bc9
	.xword	0x4a83d43862f78a45
	.xword	0xe83edd7f6fe08bc0
	.xword	0x5b9f00b4272ecd2a
	.xword	0x1e6c6c7df8e433e0
	.xword	0xfc5b5ee68f11f175
	.xword	0xde7cce979f714e4d
	.xword	0xc976426c368e82af
	.xword	0xdb55bb09ea82cc60
	.xword	0xee1290bb6dbba29a
	.xword	0x6f3679af5b398cb5
	.xword	0x42908dc157c35c23
	.xword	0xec3969753917b5f8
	.xword	0x90f3969007b08f8c
	.xword	0x2196f62c3134416d
	.xword	0xf173ca10c4625c73
	.xword	0x7f07931df078f6f5
	.xword	0xfb30a6fe996830d6
	.xword	0xdae17a4f4e7637b6
	.xword	0x6e5806214779c051
	.xword	0x944e58439c20780f
	.xword	0x87954c76518fcb66
	.xword	0x14893123486815d3
	.xword	0x1550b42b92ba8a7f
	.xword	0x13b3480fc6bbdf8b
	.xword	0xaec23881804ca580
	.xword	0xcd052e928aa18d3d
	.xword	0x08bba952d76394e8
	.xword	0xafd05496b65ae3ee
	.xword	0xec6484f52bde77fa
	.xword	0xa13a0a9d841d6156
	.xword	0xcce3762547ade6e7
	.xword	0xcd95a406d50634bb
	.xword	0xd43971420e76ed90
	.xword	0x2b680353d55bec31
	.xword	0x6c546e2c59e04c33
	.xword	0x9f79dea541965468
	.xword	0xb014b7541baec5e2
	.xword	0x65d394f7c985b911
	.xword	0x12563f802247b6b7
	.xword	0x6eb372bb9693a44f
	.xword	0x31f62b7aa207e066
	.xword	0xa7f0ec2e4b80643e
	.xword	0xf0ba1b6faf6896bc
	.xword	0xcf4b856ae8c4ba30
	.xword	0x2ecffc15e406a95e
	.xword	0x97d298ad0b74a2c1
	.xword	0xb8d2a79a2045bd59
	.xword	0x80a28ded991f7e4b
	.xword	0x96ac387e1aa68ba5
	.xword	0x71874a67c4fbecbd
	.xword	0x4962d38a7833bec6
	.xword	0xd5d7c336d8cc5b9e
	.xword	0x8c10b9769a656ab5
	.xword	0xa7def6b9746cf577
	.xword	0xbefb89f2b771428b
	.xword	0x28e8e6a3f08cde4b
	.xword	0x6d4b364577f993c8
	.xword	0xb79cc6c54f775ccd
	.xword	0x79b63614dc0a5880
	.xword	0xc84dd7a2911d7194
	.xword	0x2a788171efc5e3e3
	.xword	0xc6b4a0d10578dfd9
	.xword	0x844a576d3a457d1b
	.xword	0x7fdfdeb97ad86700
	.xword	0x923914080fc260bd
	.xword	0x8ee6cbda1d2370cd
	.xword	0xced887a0ac0a6a1a
	.xword	0x45e56499fef1e577
	.xword	0x73658ede044b7562
	.xword	0x1392ed930145689a
	.xword	0x0c6f92f42d82ed20
	.xword	0x15a11c336892ef51
	.xword	0x36d2afb467599d72
	.xword	0x3afc7acedc55d95d
	.xword	0x67e3edbe1ea8105d
	.xword	0x2e4116bd27859698
	.xword	0xfb97a025d5230bb8
	.xword	0x156e84591d253897
	.xword	0x56d4fc360a019947
	.xword	0x720927fda8eea4b4
	.xword	0x57d895e8cd415c9a
	.xword	0x196d0db0d504baca
	.xword	0x872a85e42b39ef3c
	.xword	0x681ed473cb9325a8
	.xword	0xe59072de3816c4b2
	.xword	0xea4f56e851d8941b
	.xword	0xbf9a4ed34f635a01
	.xword	0xe7ed34af2d77a744
	.xword	0xfd71c77ff55c4f4d
	.xword	0xc607bf75605bbf13
	.xword	0xa0d724b702e20764
	.xword	0x583c007669882810
	.xword	0x3f4d615d2e7838a2
	.xword	0x7870092f500d6db1
	.xword	0x14aa4b5ec504d265
	.xword	0xa6b4fb304bef57d4
	.xword	0x869a6d3f2eb4f723
	.xword	0x5f9be27ed7238512
	.xword	0xd334b7e0ac7c0777
	.xword	0x98ab23ad905714ce
	.xword	0x7ccca432dae83640
	.xword	0xba6382508d28eeb5
	.xword	0x2f4e0f4fa8277a4d
	.xword	0xdb51f6162574b734
	.xword	0xe296087d5525d9e1
	.xword	0x4077305e4019bbfe
	.xword	0x20a1f52f51e1d105
	.xword	0xd889d85734a26437
	.xword	0x7fb7feedf40fd227
	.xword	0x12e44a1c870988c6
	.align 0x10000
	.data
data_start_4:

	.xword	0x1e26fe953a2d3559
	.xword	0x9c712c9e7502c8cb
	.xword	0xfafde823f3094455
	.xword	0x89f8d0ea5dee5156
	.xword	0x56478f4210fe7ad4
	.xword	0xd7d3b7b7bbe4b4c4
	.xword	0x09244f6a519efbcf
	.xword	0x5b80b7a6c8aadf19
	.xword	0x51b25057c102665f
	.xword	0xc5478d8cf95211c0
	.xword	0x09ee8c76c146eebe
	.xword	0x00691aac8c3f7c56
	.xword	0xd8fe6cdb481d0846
	.xword	0xf7b0610affd7cbc8
	.xword	0x33346922cce73ec9
	.xword	0xbff556484b111964
	.xword	0xc026b5029fdbcc60
	.xword	0xf134593dbdac7cb8
	.xword	0x06dc63369925e8a5
	.xword	0x4600e24f29db8090
	.xword	0x68b0a684367dffc0
	.xword	0xd68c31768143d0e6
	.xword	0xb73b187f933655fa
	.xword	0x44e86d0a15fa38ec
	.xword	0xe40c96f41e58a17c
	.xword	0xd08e4162dc81c6dd
	.xword	0x0a9ad740eb1db065
	.xword	0x537f0101d789285e
	.xword	0x7cae8eb99994e652
	.xword	0x4478ee6848603d9a
	.xword	0xf417b11d4d05c9d6
	.xword	0xd41688d325065c8d
	.xword	0x557539043a999df7
	.xword	0xb0626057838c60e9
	.xword	0x78e66738c1193b79
	.xword	0xf45773e1ada7a818
	.xword	0xb23dcf9fa601ce9e
	.xword	0x9f0960870bd5f0c2
	.xword	0x2552e7994ee586f6
	.xword	0x5e09470a0a7ae765
	.xword	0xd869c313b8a0e653
	.xword	0xd7eea48f246afd27
	.xword	0x848c19dee9850245
	.xword	0xeaba7210e2dd1282
	.xword	0x290eb3f98b17e652
	.xword	0x5017bf2ce8daaaa1
	.xword	0xf11f963274a96821
	.xword	0x5553da6eba673250
	.xword	0x8aa6779c9277804b
	.xword	0xbb2e17b55dd3c23e
	.xword	0xfbaa0ec8a4088a66
	.xword	0xae25500371cf0a28
	.xword	0xeab01d4a468421e4
	.xword	0x2bee45a452378120
	.xword	0xc5ba8fb0100f4d23
	.xword	0x3aae0acf9880e988
	.xword	0x50280a8c7cee9859
	.xword	0x7b8fbf8c2a9fecb0
	.xword	0x007a66a3396e0b49
	.xword	0xcf47f1881540f042
	.xword	0x0512580a50408156
	.xword	0x756649b2d6398689
	.xword	0xd4fcb109d6ee81a3
	.xword	0xfaa0e10f9a106dc3
	.xword	0x5221d4c452e40497
	.xword	0x53b79d67b3087077
	.xword	0x869ba61437fab93c
	.xword	0x3155290ee70d86f5
	.xword	0xea194f026ca7243f
	.xword	0xa982374ac974b34a
	.xword	0x68f9cd195a35b0ad
	.xword	0x01658cfb408e7912
	.xword	0xe78af5ba102a8949
	.xword	0x9403563867bed09b
	.xword	0xea6540efdb0f8452
	.xword	0xb98f9210cb6600d4
	.xword	0xe0ca72744ed0e16d
	.xword	0xa27e476028b5acd2
	.xword	0xd4a8006cfa35d0ca
	.xword	0x56aa0cf4d33a785b
	.xword	0x917d0826be0803d2
	.xword	0x434e8bc01dd7371d
	.xword	0x350f32bec2d1dacf
	.xword	0x7a4408c5f41aa7c2
	.xword	0x9c9e6f35b5213aca
	.xword	0x91c418c249965a35
	.xword	0xc77b49f62d3c7e00
	.xword	0x294d9a4442f192ad
	.xword	0xcf6b69a0294af74c
	.xword	0x26a365e0045fd93a
	.xword	0x06cb452bc1f2a70f
	.xword	0x7c8dd4a9276d983e
	.xword	0xee8900672d16b177
	.xword	0x45bf206bcfafc0d3
	.xword	0x3dfde7807ad90ea8
	.xword	0x93266b5c80a45c44
	.xword	0x27bb3581cdb70d70
	.xword	0xb46a2b04bd13f01e
	.xword	0xcb605f9656382487
	.xword	0x4698a145af1d79a4
	.xword	0x9d69322388fcdb93
	.xword	0x6a21947f37f5e6f7
	.xword	0xe993ed9d1dfc815e
	.xword	0x009ace0d934d20b1
	.xword	0xebc781928ab16e00
	.xword	0xd420134db55005d0
	.xword	0x120db5f189f82f03
	.xword	0xc136cdd0ca749d0c
	.xword	0xfa69a6d81c624ca7
	.xword	0xde1b91ba00a79651
	.xword	0xc74821749aed6bf1
	.xword	0xc9e9e65525665fe3
	.xword	0x0262ca5edc173d42
	.xword	0x69a0f7397bd44962
	.xword	0xe195a27a9927162a
	.xword	0x9ddc1a93b42179fe
	.xword	0xa654892639d69071
	.xword	0x793e172ee169f4a8
	.xword	0xcedfb1ecc9dc2633
	.xword	0x79f7cf0bd8432903
	.xword	0x3e7b33b3fee7fe85
	.xword	0x1f842d7056e5d958
	.xword	0x5eeb08fe5d2586c0
	.xword	0x8f8fcbf977bdcaa5
	.xword	0x7b8d7e2bb7ac48ff
	.xword	0xf35f50a11b3b851d
	.xword	0xb69c79d3a4addbcd
	.xword	0xc95be11879b62cb5
	.xword	0xab91aa1664a53a4b
	.xword	0x8380773923358e95
	.xword	0x00f69de6abf0b259
	.xword	0x518f71457399a1d2
	.xword	0x1aede87469d11c2d
	.xword	0xe8721784acf7004d
	.xword	0xc1dd9ea94a229b7a
	.xword	0x9aa966357edca2f0
	.xword	0x7681d29cd0744257
	.xword	0xf7259f379c71e100
	.xword	0xe4a8681db20d591a
	.xword	0x1583e8284a5c7beb
	.xword	0xa5d51a068c1e019e
	.xword	0x03000f1875a7efb4
	.xword	0x4d3700879eaf91b8
	.xword	0x38950899f6b67d09
	.xword	0xcbaa1a91f5d23846
	.xword	0xd823741faea1dc1f
	.xword	0x2cf2a6bcd7aac216
	.xword	0x191c060c7926a5d0
	.xword	0xff253ef3b72ca3f7
	.xword	0xa881ac70a6e80d37
	.xword	0x16f9b8ae801c3739
	.xword	0xe156e8817323f5d8
	.xword	0x484753bf54b9bf45
	.xword	0xafd71c5c1540e571
	.xword	0x6a16555e7ebfaca0
	.xword	0x8ceb3f4a25bac679
	.xword	0x55e309f8bb627638
	.xword	0xeffb09fbd72b210f
	.xword	0x7fc38d37fa5065be
	.xword	0xcd79ee183901dd8b
	.xword	0xdcd9d6855043ef42
	.xword	0x3371fd81e78198e3
	.xword	0xdc700c260aaad2d4
	.xword	0xf5d8c4eaf26bbaa1
	.xword	0xbc2351ae382a438f
	.xword	0x63386e816dbb4132
	.xword	0xd9818d2ef5928a0f
	.xword	0x2bcbf585129c0f62
	.xword	0x179c9fbeb550c038
	.xword	0x272700d0da3e41be
	.xword	0x3decace31f21d764
	.xword	0xac5c18d923b05f5d
	.xword	0x88beb4549358942f
	.xword	0xe925e90feef14ade
	.xword	0xe37dd806c8445f37
	.xword	0xf07caf8b4afab4a2
	.xword	0x656b397f448e3265
	.xword	0x6ee0ad5ff2ef876d
	.xword	0x8a8b0d20275da34b
	.xword	0xfa83dce29183b105
	.xword	0x45b5802dea372e91
	.xword	0xf01a5ef4c770dee4
	.xword	0xfc527101ac16e0f6
	.xword	0x777212fca484f4a7
	.xword	0xbb896410038a973e
	.xword	0x42eee6370270cc90
	.xword	0x696cefbf14f6c35d
	.xword	0xb0c7c63ed99bf4d1
	.xword	0x81ed9cfba6c183d4
	.xword	0x85f628a2ba1bca06
	.xword	0xd2cd1aa1cbd5d309
	.xword	0x3bdfaf81f71ee17c
	.xword	0x46ea2505fc2bf3b9
	.xword	0x7a7e08714efb0fb0
	.xword	0x9039c6d180cffc52
	.xword	0x241f5f40d8b42d67
	.xword	0x2f021f1231a3d714
	.xword	0x0166a1f9ee8a8a44
	.xword	0x1e80580936955265
	.xword	0xd6e85aeba1957408
	.xword	0x9c73f547a8f2cdae
	.xword	0x37f4146ca6b511fb
	.xword	0x9e39cf8d178475fb
	.xword	0x5c641f20101e204f
	.xword	0x272c8c82eaaef502
	.xword	0xc3dd621d9bd49d15
	.xword	0x0616b808089d764e
	.xword	0xb34f0ffc953168ef
	.xword	0x3036b77b1fa880b8
	.xword	0x9b7fef5b47aa81b9
	.xword	0x35365888dbf0fea9
	.xword	0xab8ac7477c2c6758
	.xword	0xeba0629888bf0990
	.xword	0xa3db72b651173317
	.xword	0xbb0110a95c07e25b
	.xword	0x674f0fc9f157da53
	.xword	0xcbd2f54da0857147
	.xword	0x93dae88cc4f0ff46
	.xword	0x81911068d20c13ba
	.xword	0x5894a6980aab66db
	.xword	0xd85054dbb448e62a
	.xword	0x7d0b77572bed98b4
	.xword	0xe454bd97a7f54778
	.xword	0x33b1b37798ce4e89
	.xword	0x3eed2ef70ee7b2c8
	.xword	0x4c5571319226bd9f
	.xword	0xefeb62cf4200f201
	.xword	0x03f124ed3c4d7fb9
	.xword	0x9a6ec96229799b5f
	.xword	0x893b740035f7c435
	.xword	0x2dfadd472e128cb4
	.xword	0x533bfed759f286c4
	.xword	0x6ada25d0ad93045f
	.xword	0xc4d1e282f1cd88a2
	.xword	0x43aabf4709816cd9
	.xword	0xa49f6d0396ed31be
	.xword	0x310a3688e6f89fcb
	.xword	0xa066f992f25b0a4a
	.xword	0x76bf80466058c783
	.xword	0xbc37324a4ff26696
	.xword	0xea1fd7c6ebbbbbc0
	.xword	0x034b119af547d914
	.xword	0x4958cfba18b58623
	.xword	0x89868d8a223f0338
	.xword	0xfabce2fab1522cc8
	.xword	0x69834a774bffc33a
	.xword	0x4d87fdc648347936
	.xword	0xcb2eb5ce02f63474
	.xword	0xf0c66aad4a370b5c
	.xword	0x1c2b915a7489cfe5
	.xword	0x75b6481966f1d407
	.xword	0x5c7da4f75f847313
	.xword	0x589289e126a4b6d1
	.xword	0x848a130a7d91c09d
	.xword	0x302d54d26d0310e9
	.xword	0x8898d5aa90b1f187
	.align 0x20000
	.data
data_start_5:

	.xword	0x551a27e112b305f1
	.xword	0x541307c2df35d3e4
	.xword	0xe1f380edc31034d4
	.xword	0x03be1b192adefd37
	.xword	0x48ea3327c8c55cf2
	.xword	0xb68bd11f5e00c184
	.xword	0x129e601ba01683bb
	.xword	0x0da8366db702bd08
	.xword	0xbf345a221c631d1f
	.xword	0xeac35ccacd79ba32
	.xword	0x81f9e3c3e7d26ec3
	.xword	0x3fab5b6727f8e032
	.xword	0xd97a4b6ef6623d56
	.xword	0x02f20822b1b22355
	.xword	0x0ec9ef7d0ebcc7e9
	.xword	0x81d7a51991c0902f
	.xword	0xd858d36e3572e9c0
	.xword	0x7c17d5374dc7b058
	.xword	0x1c95d16f90a38422
	.xword	0x2fd5cc2031869b4d
	.xword	0x7f6144cfa086653e
	.xword	0x2c08cf98084ca3d9
	.xword	0x7062015edad8051d
	.xword	0x0ee84be256004f10
	.xword	0xf79c53b71304ff85
	.xword	0x47807279686e743e
	.xword	0xe5b05f97497d4708
	.xword	0xb3ee26749d0c8c89
	.xword	0x4193163f0b674f4b
	.xword	0x4e3f8744b50f0d55
	.xword	0x7f49949f64b4ed13
	.xword	0x06089662de72f336
	.xword	0xe0991e97c8dd6180
	.xword	0x943f6352a5da85e6
	.xword	0x3080cac5f6b2293e
	.xword	0xbfbc39e8d49cb741
	.xword	0xa5706114f9c52652
	.xword	0x6f771a761d5734ee
	.xword	0x783079d0d2b6bc21
	.xword	0xcce5c1dc82968307
	.xword	0xe1815c1693db0476
	.xword	0x063fc96616e44ea2
	.xword	0xa92adadf2c38437b
	.xword	0xeabc35f645a447bd
	.xword	0x40ff25c18f6bef53
	.xword	0xab3556579aca911c
	.xword	0x19b3f5f8d1380808
	.xword	0x3916ddddbc7d6622
	.xword	0x1ef1642b91e2cd3e
	.xword	0x8a91182e8da18ad2
	.xword	0x470ebd1d1ca50000
	.xword	0x582ece419ac961ba
	.xword	0x32d289fb7f5e7a4d
	.xword	0xdcfe1955b67edd11
	.xword	0x773e40ad84acafca
	.xword	0xbf8afa85029425ec
	.xword	0xb688d27799d6201a
	.xword	0xd5d370ae677252f2
	.xword	0xe770228794ce9c65
	.xword	0xb88e551562c198a3
	.xword	0x9bf6aa9e325f3920
	.xword	0x6c99e4e2000d132d
	.xword	0xdbad3e93e693b6d8
	.xword	0x724b562ccf66080d
	.xword	0x8d158cfe9d705eca
	.xword	0x4e94bced66297f99
	.xword	0x475174dc257f12af
	.xword	0x2582511f420ac5bf
	.xword	0x05c0b030b89dab6a
	.xword	0x9ffd709328fdcf01
	.xword	0xf7f4205c8006a45a
	.xword	0x5d431a8ef8cc51d9
	.xword	0xf3462cd6ed12b795
	.xword	0xabe69067fea4f9ad
	.xword	0xc28b54ed942f0981
	.xword	0x2a794e856b432bc3
	.xword	0x3c0753e7603a14f9
	.xword	0xa6c8c2f658c87d2d
	.xword	0x0696a2275b2597af
	.xword	0x39317335ed33ffbf
	.xword	0x614a6f3a0d59106a
	.xword	0xf0cf48eeceb3deea
	.xword	0x5f590044c2590c29
	.xword	0x6374f1c89338cbe0
	.xword	0xbb98090d8d30815e
	.xword	0x8593eef3d5ff137b
	.xword	0xb62a4b60181d4652
	.xword	0x4de9d2f99fd647c8
	.xword	0x9309022b28ceb512
	.xword	0x65758193174b1511
	.xword	0xb2d95fc3ed383e3d
	.xword	0x50ed7ed173cf26dd
	.xword	0xe8033b96191504b0
	.xword	0x296a6429724f2772
	.xword	0xf8aafe7bac7be1d9
	.xword	0x6a2951b681b67a0a
	.xword	0x62934b4135f6d36b
	.xword	0x7e07b0346ca52afa
	.xword	0x881275c2ffba6ae1
	.xword	0x5a8fdc734571780c
	.xword	0x88d3e0cc0ad2dcb2
	.xword	0xc8c88829f8bb3329
	.xword	0x0f7689725e773561
	.xword	0x510c2214805d1476
	.xword	0x2434b97ad45e1c56
	.xword	0x97686fec3515db80
	.xword	0x4cb53ddb0b8c5a9a
	.xword	0x3f7d913fce372817
	.xword	0xbd8e18b78cc06a53
	.xword	0x1d5e6fed11bfcf6d
	.xword	0x6ff5173b0ec40ea1
	.xword	0x62d22d08bcc1dd58
	.xword	0xfb63efe967a03e85
	.xword	0x5e40e40ccffab211
	.xword	0xaf6d3ecdbea14118
	.xword	0x5d1e4674240d7f43
	.xword	0xbb306a553b1fd214
	.xword	0x1aa9c843f3a31f29
	.xword	0x72882e89e55984e4
	.xword	0x1d3d99729a4202cd
	.xword	0xdeef9a4981adc0b7
	.xword	0x5a76ea93c00af4fc
	.xword	0xa39dbace8debc528
	.xword	0x627a62b288b56079
	.xword	0x4a2624306c6af982
	.xword	0x1f6680b2213332e2
	.xword	0x1de167be9d1e3515
	.xword	0x8399cfc14821bbbb
	.xword	0xaba049344156343d
	.xword	0x3da0ac25e6f765ef
	.xword	0xb7e841cf05a71d50
	.xword	0xc864df22b55e51a8
	.xword	0x6459d4bdf86cf28f
	.xword	0x60468f90578b4ab4
	.xword	0x1ab5fe0ab3fc74f7
	.xword	0xeddb1de47acfc017
	.xword	0x23fd6a87b08132fa
	.xword	0xb2349eb556d88a82
	.xword	0xc0f6f7e539b35bf2
	.xword	0xb7654bc843c3c2c8
	.xword	0xafe94a7e82adccc0
	.xword	0xcbfda30f360928db
	.xword	0x3afdb59e3cc30e54
	.xword	0x7b66ece8ce5fd81b
	.xword	0xb4107f4656460066
	.xword	0xd7489fbbafe925f1
	.xword	0x380f1171aae51440
	.xword	0xa1c3eeb569ac220c
	.xword	0x1a968881617c441c
	.xword	0x4287cd875701043d
	.xword	0x4f6b3e37d1278b53
	.xword	0x32e43bc5838ded11
	.xword	0x01c00e196dc8a0be
	.xword	0x8fc4b5af194fe514
	.xword	0x2de0eaa465eb1e2e
	.xword	0x7f23a982a49e58c6
	.xword	0xf18e02ef9f38f693
	.xword	0xf5c4872193b2d910
	.xword	0xac13957cc7cc0b96
	.xword	0x31d1bc16c96a631c
	.xword	0x268e53e9a1d9080c
	.xword	0x7d1943e4f53c32d8
	.xword	0x935a39561a37b1ee
	.xword	0x8784d1513ecd1f98
	.xword	0x32b394a42f7244ed
	.xword	0xad9bf65a773c43ba
	.xword	0x2c82ba8e051ed1b3
	.xword	0x29efe34546b3137d
	.xword	0xe7a12f7700858553
	.xword	0x30bff72826e5527e
	.xword	0xbe7a0919002df7f1
	.xword	0x8976f7ca02aab580
	.xword	0xe497916d1ed0c4d8
	.xword	0x3aba5f147c6df265
	.xword	0xa4d55645144cd7b6
	.xword	0x705c3446d87ca417
	.xword	0x9d0da915c5bf965d
	.xword	0xc96a68be68be5dd6
	.xword	0x5f50e4d50097a432
	.xword	0xb4616f4ec06d2afc
	.xword	0xdbc8b38e279afc84
	.xword	0x4af1db509dc03d87
	.xword	0x65b1a704e303a97c
	.xword	0x954361a30bacaed6
	.xword	0x4a064360b34d7148
	.xword	0x8a8cdc0085c188cb
	.xword	0xf8e57edd72d93687
	.xword	0xef8b415768cc8573
	.xword	0x2782ec92b79ab4f0
	.xword	0x04c0c69d53aca628
	.xword	0xa0d36d93bfd81db5
	.xword	0xfce990fdd7d1a69a
	.xword	0xd0fe6d9a76e06f3e
	.xword	0x5f24e31465d8473f
	.xword	0xfb5dae4a31b6c11d
	.xword	0x4a8c0551376a1775
	.xword	0x91a1efa61eb81fb4
	.xword	0x27cf22422a676822
	.xword	0xb0d8ff96d1c17b80
	.xword	0x34d6f3b4a180680f
	.xword	0x464a7e9a79c85439
	.xword	0x996f11e5a80c1130
	.xword	0x0e53728125c21aa7
	.xword	0x816306737ac88c39
	.xword	0xfae46d5de69cc823
	.xword	0x64d60de7ad20859c
	.xword	0x1c978436e52d169a
	.xword	0x7ec66ba53b01d970
	.xword	0xebd0f5ba27b6200f
	.xword	0x3e9bec5c9d5bfc63
	.xword	0xcb83d8be25ecc0d9
	.xword	0xed95879b9695173d
	.xword	0xcad4b0aa9d215e0d
	.xword	0x81a24c188934cec8
	.xword	0x8a19fb6f6bd7d83d
	.xword	0x7731bb3343f00590
	.xword	0x0bf382ed54319433
	.xword	0x24f8ccffcf9f192e
	.xword	0xe1520f65e01341b1
	.xword	0x482ba8d96636ad63
	.xword	0x03102f71292700ae
	.xword	0x4434dc48c62ab3ba
	.xword	0x3d76c8410d222be7
	.xword	0xab58b4a2fd21cebd
	.xword	0x87a4926700c767b9
	.xword	0x24a2023c679c3d3d
	.xword	0xeb0878d151e3d09a
	.xword	0xa0cfcb7ea5d1dd18
	.xword	0xc5f9417c68252a52
	.xword	0xb414e5960807a585
	.xword	0x72731c79033f1f61
	.xword	0xf14308f3d4efb54a
	.xword	0xcc85942e5c6aadf5
	.xword	0x529d0821fa17a312
	.xword	0x93a264ea872c907f
	.xword	0xe04cd33a70706165
	.xword	0xb9500ac4a82dd58d
	.xword	0xedfed4e63036467b
	.xword	0x2a33588d1242fb8f
	.xword	0x840bcea45efed30a
	.xword	0x7ab325c864d62703
	.xword	0xed64608f9d971d54
	.xword	0x59b415e151a704b1
	.xword	0x9b931e036482ac0a
	.xword	0x5d68a0e511095da4
	.xword	0x00b4e8a26d7360a1
	.xword	0xa9f92d3081d5c142
	.xword	0x889d9e802661bd1c
	.xword	0x89076dfe52242aa0
	.xword	0x50072db2dc6d46c4
	.xword	0x77476a73cab5154e
	.xword	0x0572524443bedb3b
	.xword	0xa5b2a6cb0f8ed4c1
	.xword	0x1ba460b75a8b0516
	.xword	0x582b0277915beab9
	.xword	0xf6265f486328e532
	.align 0x40000
	.data
data_start_6:

	.xword	0xb69dc0b39a86b8c8
	.xword	0x25c424d4b47d7647
	.xword	0xe50c5c8f7ed06bf6
	.xword	0x741ef52aede1ba95
	.xword	0x3f8bcda0e8c26395
	.xword	0xc999ac3fd6e03816
	.xword	0x4740b78eeffeafa3
	.xword	0xc11d499de1915671
	.xword	0x78108daf8e2b8bfb
	.xword	0xbca7fbe8039971bc
	.xword	0x5923b2f9cf88e855
	.xword	0x039d0ea7c2bb3aa3
	.xword	0xc42e72b2e7491380
	.xword	0x286a725666fe5221
	.xword	0x3fdc531142147c14
	.xword	0x46d297ac00263dea
	.xword	0xe6f3205c9c5fb89c
	.xword	0x40741b7274f33514
	.xword	0x65a6c2852581c88e
	.xword	0x71d4c6fa77610bf9
	.xword	0x523dc4b6698fa7f1
	.xword	0xff986ab54c8ddc29
	.xword	0xa7c981baba53aec1
	.xword	0x5b18cf70cbc53b89
	.xword	0x3e78554e8e76da5c
	.xword	0x0a805d88d9108599
	.xword	0x105201abca05c1f2
	.xword	0xb29b89516f2342ea
	.xword	0x18bc6b5c5d33b87e
	.xword	0x12e325ff61216a5f
	.xword	0x82889ab82b47afad
	.xword	0xbb197759fbc06809
	.xword	0x258f4469cfe21b27
	.xword	0xc097312d964acf1c
	.xword	0xf0d82774c4f3810c
	.xword	0xb2e9dae646a68934
	.xword	0xf41f572d35b99482
	.xword	0xf77a7841bafee3c5
	.xword	0xb630c28a0be5d5ea
	.xword	0x058604fbe7ed3a37
	.xword	0xddb435a33017bbc3
	.xword	0xe714587df196ef54
	.xword	0x1eaef8e2270d208e
	.xword	0x70c5a0402b44cd55
	.xword	0x606caedce8ad2894
	.xword	0xf3708bbc35aa88c4
	.xword	0x9cedc07f22169450
	.xword	0x4c4cab286931f548
	.xword	0x5106b9122bbc95ec
	.xword	0xd59863e204b3f411
	.xword	0x223c7ef7b61515c3
	.xword	0xaabdd0582163e075
	.xword	0x919dcc5462ccaac4
	.xword	0xe7b16be93e527aa4
	.xword	0x80026ab6615beb66
	.xword	0x07246d0f1ea15b96
	.xword	0x0a0796e9ae37af90
	.xword	0x2d6d6132c0693b18
	.xword	0xb8c3f9e30ccfb20a
	.xword	0xe735a37ec87af740
	.xword	0x233a45cc7b6f175e
	.xword	0xac83f365dd3a85e3
	.xword	0x2eaeb7f592082df5
	.xword	0x6d3091b6b99e5a6c
	.xword	0x4b011394ded1a60c
	.xword	0xbadaa338882bc8bf
	.xword	0xacf3ee0a19840381
	.xword	0xf6599f470ed8ec5c
	.xword	0x64d704088146032a
	.xword	0x6c9590951d87c667
	.xword	0x1e592fbf18c2f426
	.xword	0x9ecae3b38de9753a
	.xword	0x879743e2e74f69b5
	.xword	0x7496710f3b63d777
	.xword	0xf2472983c67c2e63
	.xword	0xdc8c9eb219fb6c04
	.xword	0xb2fcda9ea491f103
	.xword	0xc3b9c81d9c58ffe0
	.xword	0x8d7a1045ee6a0cc5
	.xword	0x95b6f93753574832
	.xword	0x88f42e3acb183fb6
	.xword	0xe1abc05cd8536a2b
	.xword	0x19afa6a668835cde
	.xword	0x5e40f1accbdd359f
	.xword	0x4e1678fbb96916c5
	.xword	0xeee0f369bfa1a164
	.xword	0x9e3084ef85c1a445
	.xword	0xba11fd973cebf333
	.xword	0xded8519429850bb8
	.xword	0x9734444ca456ea44
	.xword	0x9f74480cff607d36
	.xword	0xf1281257fefddd6a
	.xword	0x234ff27a3ad8a0b1
	.xword	0xe702c428cae96987
	.xword	0x38ba0d631532c4a8
	.xword	0x109dc547eed0c587
	.xword	0x551cb6a7a8501a90
	.xword	0xf54f8c2cb2539465
	.xword	0xb4f6c92cd9332500
	.xword	0x25c7c2250c427fe3
	.xword	0x6665c5688b857661
	.xword	0xb694e533892d0464
	.xword	0x9866ad7a70c4a141
	.xword	0xee64334876478e2a
	.xword	0x9b3818c4ef0ea91f
	.xword	0xe272d4a4d931f68c
	.xword	0x4f21ec5c53535351
	.xword	0xe665380dcf52954c
	.xword	0x78aec3f0d0fef9fc
	.xword	0xe01a4d0d5a358903
	.xword	0x9027a0de4fc81b81
	.xword	0x1ce0b23db122b8ba
	.xword	0xba66362ea7be1e37
	.xword	0x50fa753155d98136
	.xword	0xcebc36638238c5c3
	.xword	0x51616d25f61fb228
	.xword	0x3cac161b37fde3d7
	.xword	0x3670f5d8ae166bbf
	.xword	0x55688b1b488bc712
	.xword	0x3854b88c71bec166
	.xword	0x4796a6a2e08d6f6d
	.xword	0x3fef9dac2050b743
	.xword	0x6eeb996f13b5db51
	.xword	0x7c1552a02dcb7884
	.xword	0xa946fd605b698579
	.xword	0x38d482c205327f84
	.xword	0x62ccc859b833dd1e
	.xword	0xb8ebeea82cd4bf16
	.xword	0x09c3ca7b1a7860b1
	.xword	0x8770ee549d20a686
	.xword	0x7b1c1151f270a217
	.xword	0xccb983022c04761c
	.xword	0xf2555cf631d302b3
	.xword	0xb5a23122b8459a57
	.xword	0x1c710eb13771a310
	.xword	0x1e56e6f48dcc2c9a
	.xword	0x9631ad58725adf4f
	.xword	0xfd70eaf4d976668f
	.xword	0xc03f051c64998b64
	.xword	0x0a563edf3e9a0a27
	.xword	0xcf53c06c5bf1856c
	.xword	0x427eb97ec6aa8540
	.xword	0x703c061009df19fd
	.xword	0xd0918093571c5ded
	.xword	0xf65c59eb6ad8b0b7
	.xword	0xb1500c9b8f773a04
	.xword	0x7fc9c19c9b5d4726
	.xword	0x27dcf4385040a73e
	.xword	0x55f245216f568955
	.xword	0x36b57b707f279e8f
	.xword	0x4437a6aaead51133
	.xword	0x446fbb500e9764af
	.xword	0x1f2aad57008c5504
	.xword	0x108f63b82108a30d
	.xword	0x79066009f67cc883
	.xword	0x9efda98cffc60ec4
	.xword	0xc16dc379716f745d
	.xword	0x3eff825a6cfee143
	.xword	0x822cd0e5fdbc5edd
	.xword	0x2aa0f73d66128336
	.xword	0xfb938a9ee96ce9a8
	.xword	0xfc77cc250908d2b2
	.xword	0x64595bd6152352e2
	.xword	0xf6b4c8003ecec05c
	.xword	0x43fb92504f0552f3
	.xword	0x1ff75c68b0a6fde0
	.xword	0xae003cade03586f1
	.xword	0x0aeb573fee013907
	.xword	0xd19af62ccae9d53a
	.xword	0xd212dd83cbaade54
	.xword	0x4409281a84aaa1d9
	.xword	0xaf9ba006f68c1ba6
	.xword	0x471a32f7197aeb22
	.xword	0x0a0e694c68b74ff6
	.xword	0xe31eb13f29e28637
	.xword	0xf98df9e2a83e62ce
	.xword	0xccd38d609d27f81b
	.xword	0xc4b57c1f59f068a5
	.xword	0x1ae02805a926277e
	.xword	0x0090e3e3b7ed6cc7
	.xword	0xb92f7669768832fb
	.xword	0x125b5c856e606093
	.xword	0xb574f2593e6f9777
	.xword	0x6c1dba727846779c
	.xword	0x30ba1f6190a0e389
	.xword	0x03d5d85d44eecb5d
	.xword	0x81ac9f75bba00b4c
	.xword	0x93bfda0bd31ec317
	.xword	0x0372296e21234f5b
	.xword	0x4ff372bd8eb86fef
	.xword	0xfb325e6843a300a4
	.xword	0xcb8b8f5acf3ebea5
	.xword	0x99dc46d059cdbaa5
	.xword	0x08642aae800fd530
	.xword	0x156b7624fc00e06f
	.xword	0x4020f70042a601c0
	.xword	0xb6439526513242c5
	.xword	0x6b9594b410b5fc6d
	.xword	0xef2bfabb8ae2a733
	.xword	0x05d50f6a2ef65898
	.xword	0x71e53ec2e1dbab3e
	.xword	0xa4abe3c2d4b39451
	.xword	0xd4093a8cfdd5a7ea
	.xword	0x036fff93056f7780
	.xword	0x8a35e18e2839b2cb
	.xword	0x75745f66675c7bf1
	.xword	0x90dac5277cbdb6c8
	.xword	0x0525dcbfd292a0e0
	.xword	0xa2dd48d01abe90fa
	.xword	0x0e9d8274a02f3cbf
	.xword	0x442a17355f9a1853
	.xword	0xd2ebc7f8583f7c02
	.xword	0xf1ce38ca4630883f
	.xword	0x5b694c69bd13791e
	.xword	0xb459b9d3a4f3967b
	.xword	0x93f6047ad9d77919
	.xword	0xef343ddf2399933d
	.xword	0xf226c17b9b20d94a
	.xword	0x192377e759c3f389
	.xword	0x8133d87ba05f4acd
	.xword	0x4177f58debca6ca8
	.xword	0x25c25df56eeed79d
	.xword	0x120c9ae7ad3d2ab4
	.xword	0x641fbf9cd3b8c103
	.xword	0xe2a72a2f029fdd45
	.xword	0xe309262df9ded478
	.xword	0xe986978c883d381f
	.xword	0x43585f8ea267e412
	.xword	0xd99970113e241f4e
	.xword	0x2189f08fb014c367
	.xword	0xb1a2cb75f7932524
	.xword	0x06d206c9e02505df
	.xword	0x4051a92be593d82e
	.xword	0x75c1166af9ddee74
	.xword	0x4c04f6ad6b468cf0
	.xword	0x0b3b73a3332c27a1
	.xword	0x389ccfb693015fb6
	.xword	0x4cb3fab9ba9fae1a
	.xword	0xf2aeee823ffafd53
	.xword	0x2bdc7ac86111ba05
	.xword	0x74c48ec20fbd1863
	.xword	0x274e4c315cb8f31c
	.xword	0xea510a11cf7310ca
	.xword	0xc21fedd9acae496b
	.xword	0x855e65e9f60c0a84
	.xword	0xe78185af8ed22718
	.xword	0xbb69afe6a1e57a14
	.xword	0x9154147ffe968f9c
	.xword	0x3f62e5bfb2d4547d
	.xword	0xb8c559e3cc29a095
	.xword	0x511d031c3c50ea88
	.xword	0x4d8353f7807e4246
	.xword	0x4609210866bc7195
	.xword	0x281316b871651ab6
	.xword	0x8f270e736c9ee8f2
	.xword	0x48ab7e4dd288ca12
	.align 0x80000
	.data
data_start_7:

	.xword	0xf06e3e7529fca37e
	.xword	0x55420f319423f4c4
	.xword	0xc335e0a7c9a1458c
	.xword	0x2fa289f55cfd343d
	.xword	0xa38cc3b182ffd10d
	.xword	0x9bc3b3315ac1374b
	.xword	0x0f30caa1889c8bd0
	.xword	0xe1af9d36872b30be
	.xword	0x093fa885cb88e614
	.xword	0xb0e5efe15c471bdb
	.xword	0x1a8daccfa3cff940
	.xword	0xf4b7375c1b3430d2
	.xword	0x8b1d686f54ac7f69
	.xword	0x70b8a7bda13b7408
	.xword	0x0cd36ae3222ddcbc
	.xword	0x5dcf16d9abc171aa
	.xword	0xf883a8891bc4a26c
	.xword	0x4c2241e539830330
	.xword	0xa0ded0c5fe16c284
	.xword	0x7097346fdff448f5
	.xword	0xd2fd8b96bea3d6b4
	.xword	0x5ecc781b59068c34
	.xword	0xb67e377a1fd0d4e7
	.xword	0x02f537c9b403e802
	.xword	0x3d534e0a82471b71
	.xword	0x5a97673c1e506278
	.xword	0x6429deb754ba3623
	.xword	0x7e0516dac9809be5
	.xword	0xb4726c2fc7e783bf
	.xword	0x0bf5ef69e7a9773b
	.xword	0x2246f0722e328ed3
	.xword	0xcf5bf48b3193290d
	.xword	0xf88c89d0fea6be9a
	.xword	0x77e24b4de199406e
	.xword	0xd61f74b2d409eab2
	.xword	0x8c78764943f28b3a
	.xword	0x1ded5496d5b79056
	.xword	0x6d3df72a038ceb4a
	.xword	0x37a0e0eb8291efeb
	.xword	0x2140c9fdbdba2877
	.xword	0x9336ee10048155a5
	.xword	0x2c7db2909e29a1f5
	.xword	0x60dc2d7ab75b3920
	.xword	0x58b81537680f2c73
	.xword	0xdf77af678b2e686e
	.xword	0x82fabc830f1daf2e
	.xword	0xa7604a78c5c8daf5
	.xword	0x26cd25b81747c0b4
	.xword	0xd68a7e13208d2c31
	.xword	0x2d02da4d742becba
	.xword	0x73e8debdf4b000a2
	.xword	0x4f4019b1e9440e20
	.xword	0x83966bef88ed53e5
	.xword	0x280072e847f95be4
	.xword	0x9231db705d9cc1a7
	.xword	0x3662a7498486bf92
	.xword	0xebb5783c548d6d29
	.xword	0x345c2db1b625e56b
	.xword	0xdfd0910f56c0a8b8
	.xword	0x4ae723c69cec5c51
	.xword	0x5937b76975fc6a5c
	.xword	0x1d3a229cffaec3cc
	.xword	0x7a276263fccc0c9a
	.xword	0x19fe7cce5ecb6ba6
	.xword	0xdf995e3c3f07714f
	.xword	0xfcbaea1675e3bb27
	.xword	0xd39369aec7c8022a
	.xword	0x8139a57e6e4a56b2
	.xword	0x7fdfa74c9423e869
	.xword	0x7200ce35bc7ad51d
	.xword	0xf338114a9eb4f1cd
	.xword	0xc3544404add48f49
	.xword	0xfb9d16db509bb28f
	.xword	0x38c4d8dc67c24c55
	.xword	0xe4cf0f7d4b250272
	.xword	0x77318d8b1e9bc71f
	.xword	0xb0b1ec7ef745d1f6
	.xword	0x39123eb93b48524f
	.xword	0xa1e3fed409720ec2
	.xword	0x6fbf6c0e9419581b
	.xword	0x290cb55e887478ac
	.xword	0x18a87d21eeb8e57e
	.xword	0x9a8078dbfd71cbbb
	.xword	0x60f90e1e0de4e69c
	.xword	0xafc18ce5783e5b20
	.xword	0xcd6dfbf70227f372
	.xword	0xe3ed6cb6f5c352bf
	.xword	0x12abd3eb8dd91031
	.xword	0x64042344e55ced53
	.xword	0x756db481b723b54a
	.xword	0xa1576f3d8ff36cff
	.xword	0xb5cf4ad0668091ff
	.xword	0x76ab7e3379dfebab
	.xword	0xae9c908dbc6b7476
	.xword	0x4cad8cb85ce87435
	.xword	0x585e884f52b310f1
	.xword	0xd0bab71e77c72640
	.xword	0x3694aac55cfbb0f8
	.xword	0x4cd9cb99ea03e39c
	.xword	0x0cb6f902ba4f8758
	.xword	0x83702a4f28dd9d15
	.xword	0x954f5dfd426dec5e
	.xword	0x06386264b4385f69
	.xword	0xb12c777ce217c77d
	.xword	0x7889b9727f855987
	.xword	0x072eff83d6cbf8cc
	.xword	0xb1c119da8650e13d
	.xword	0xe1f921e24aa860ac
	.xword	0x617c82e81c0a81ba
	.xword	0x90fd19f3c87e2132
	.xword	0x9efbbebc301cdabb
	.xword	0x359103bee780e1c1
	.xword	0x51fb598ec4307723
	.xword	0xbaddbd919965409d
	.xword	0x51bf7098ade78d06
	.xword	0x294fdc5a73da89fc
	.xword	0x7c1bbb5d03bd5e11
	.xword	0x9d47d476621f07b5
	.xword	0x5755af231e78464a
	.xword	0x3947c7e9e2d15334
	.xword	0x430205df1a8d0b61
	.xword	0x6645bdccde68f749
	.xword	0x8f607db8166c6ce7
	.xword	0x0f87f158b799bd3a
	.xword	0xd0734910181cd2df
	.xword	0x01c0083843ecf6dc
	.xword	0xb7bd9fff7d94da7e
	.xword	0x97043442cb3b62a0
	.xword	0xe43d9c193f9589b0
	.xword	0xfc9d0c44bc758a0d
	.xword	0x6567662bffc7f511
	.xword	0xdcc95f8ed4c61806
	.xword	0xc47d4f502b91b5ac
	.xword	0x04880427d7897ffd
	.xword	0x27f5d5f1c74229fb
	.xword	0x0ed85fce73076009
	.xword	0x1f7fde0cd2a16e73
	.xword	0x539289705d4b14b0
	.xword	0x18297145dd99530a
	.xword	0x3cdc6f262621c4d8
	.xword	0x964234971c1f53cb
	.xword	0xc1dcd637f1c5c569
	.xword	0x7c24efd3bd37c4ee
	.xword	0xf426fbe30b2fe1de
	.xword	0xd8c70324cd30c425
	.xword	0x2658b198fc72cba9
	.xword	0xae561e973d2a3f26
	.xword	0x48a7306bd8adec65
	.xword	0x0273036cb24bfb75
	.xword	0x4b57a01bc8951d35
	.xword	0x35ab701968f9ce57
	.xword	0xc77d451c6f7b1899
	.xword	0x7e001b286fc9c3fb
	.xword	0xb60a9360eb21082a
	.xword	0xba186b5fa675747b
	.xword	0x123fba171fcb8353
	.xword	0xfccbfd4af858f012
	.xword	0xa1b7f3c578b692d3
	.xword	0xc3a4af5949c7d931
	.xword	0x919e049c425ad82b
	.xword	0x3b6cdd322f97e0ed
	.xword	0x2efce334cc60cd2a
	.xword	0x0201db9b873b2061
	.xword	0x0efad0dbc556092b
	.xword	0x0c4ef11c95b9913e
	.xword	0x0df7535f41332e50
	.xword	0xb253610228785320
	.xword	0xb963b61e9edc6227
	.xword	0xfebaeafe80031e9d
	.xword	0xc24dc6f73e415640
	.xword	0x8ada8fda80215131
	.xword	0x0a38b375e8c0c413
	.xword	0x1d3d6e2eb0af0e03
	.xword	0x446773eb54263997
	.xword	0x3a8291f103cde5ea
	.xword	0x86d7fa11e450e19a
	.xword	0xd38e5f7aaed64394
	.xword	0x1dd1a8139dcaf547
	.xword	0xe023fea6376d3858
	.xword	0xaab799c7a0b23832
	.xword	0x8a2cf714d325bb4a
	.xword	0x06508edcc98bf927
	.xword	0x0eb9571790441b42
	.xword	0x99772247b3df51e2
	.xword	0x280e9650ec8d8110
	.xword	0xcada3d8ca0b7ef94
	.xword	0x2ba3f64d95a10aca
	.xword	0xb48f0191ee18cd89
	.xword	0x54d5e7915ffa249f
	.xword	0x3ceab5d40113fffd
	.xword	0x03c6dfb58495356a
	.xword	0x14521e04e9c52776
	.xword	0x8d10b8f6f3d8d896
	.xword	0xdbfe81e16e66da11
	.xword	0x82fbdddb61e76c61
	.xword	0xc8327e69ec6bf2d5
	.xword	0x26167fd68af01fd0
	.xword	0x1816d406c3a72111
	.xword	0x93ca5ecc9b6d5d7d
	.xword	0xd995670ebad14565
	.xword	0x318abbb5966ebf9f
	.xword	0xeb54b3067aa218d6
	.xword	0xe0907d6e689f8943
	.xword	0xaaec2faef60366b6
	.xword	0xbbf07a9ba5e1c686
	.xword	0xc921b2a0c997bdfa
	.xword	0xd5c13018939ec536
	.xword	0xec996d4ffb0fc2c7
	.xword	0x6dda4a863a667d53
	.xword	0x44d3cd15c5f42976
	.xword	0x06946ba6e44a672c
	.xword	0x711a03de426576f1
	.xword	0xeeaab930afe6f396
	.xword	0x7e6b6d96144e0766
	.xword	0x9629547fb2fc0ae9
	.xword	0xa57b7a8c74bccd09
	.xword	0xd2e8bac3c93ccc31
	.xword	0x90ebaa51abe76e6d
	.xword	0x9b6ca4c6a59d4713
	.xword	0xdf6090267be0face
	.xword	0x1e036838198ec75b
	.xword	0x07d00eab6e4de68e
	.xword	0xebe17374489593db
	.xword	0xf38c79260929ec8d
	.xword	0x523ec2686f748e3a
	.xword	0x97942cb03ae5885d
	.xword	0xd9087a0973b2d91f
	.xword	0xe56d736c1848756f
	.xword	0x3fe3381039eff9b4
	.xword	0xd864b9f9a7335fdf
	.xword	0xbf96e921ca76c317
	.xword	0xf7dae21266870458
	.xword	0x8744da414b073ac2
	.xword	0xb0483e479daa23db
	.xword	0x15cf36ba39af2ba6
	.xword	0xf14a0318f2f45849
	.xword	0xf1a62db2f923193c
	.xword	0x52c5b92534e42c93
	.xword	0x1459b773222330c4
	.xword	0xbd8e198287aa8119
	.xword	0xd015e438c26d69d0
	.xword	0x04f2cebfaf88a827
	.xword	0xde43052d03aec8d5
	.xword	0x916e18eb69f9263c
	.xword	0xf3832fb9c6b8d67e
	.xword	0xb952c1ff4f496515
	.xword	0x589c208262eae907
	.xword	0xd1d42477cb0ce4d4
	.xword	0x62c639e95c377548
	.xword	0x26c1fecd37c6a8fe
	.xword	0xb0eaaec9ae646ea0
	.xword	0x11f10c9c827703ce
	.xword	0x3e1b4bff57301e3f
	.xword	0x47428728026cf6e8
	.xword	0xedd34cdb43bd93a6
	.xword	0xd1e5395440ed8162



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
