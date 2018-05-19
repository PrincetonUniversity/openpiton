// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: sus_res_12.s
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
   random seed:	837432861
   Jal tlu_sus_res_12.j:	
********************************************************************************/



#define PCONTEXT	0x10
#define SCONTEXT	0x10

#define MAIN_PAGE_NUCLEUS_ALSO
#define MAIN_PAGE_HV_ALSO

#define ALL_MY_INTR_HANDLERS
#include "my_intr_handlers.s"

#include "enable_traps.h"
#include "boot.s"

.text
.global main

main:

	ta 	%icc, T_CHANGE_HPRIV
	mov	0x123, %g1
	wr	%g0, 0x20, %asi
	stxa	%g1, [0x00] %asi
	stxa	%g1, [0x08] %asi
	stxa	%g1, [0x10] %asi
	stxa	%g1, [0x18] %asi
	stxa	%g1, [0x20] %asi
	stxa	%g1, [0x28] %asi
	stxa	%g1, [0x30] %asi
	stxa	%g1, [0x38] %asi
	ta 	%icc, T_CHANGE_NONHPRIV

! Register init code

	setx 0xe33b200dc300675d, %g1, %g0
	setx 0x10492a703c5da086, %g1, %g1
	setx 0xcbd5e82c30ac6c26, %g1, %g2
	setx 0xada061047f91c05e, %g1, %g3
	setx 0x86ed00ecc795a45f, %g1, %g4
	setx 0xf1ca1c7be538c44f, %g1, %g5
	setx 0x3b6c9da2f4520947, %g1, %g6
	setx 0x0ac13608682420e9, %g1, %g7
	setx 0x4d2d8448f6a12eed, %g1, %r16
	setx 0x6a72e18bcfa5484d, %g1, %r17
	setx 0xae1f3ac412ad71d7, %g1, %r18
	setx 0xc987c3787fc6b3ae, %g1, %r19
	setx 0xcce9335ff3e669a7, %g1, %r20
	setx 0x1bbe2b3a1a1975d5, %g1, %r21
	setx 0x1f4d987e941203d1, %g1, %r22
	setx 0x7600ba317acf44e7, %g1, %r23
	setx 0xb8b0d3d2410b61cc, %g1, %r24
	setx 0x1e631f3518d96988, %g1, %r25
	setx 0x48b1dcf97940f691, %g1, %r26
	setx 0x06d83a5411435afb, %g1, %r27
	setx 0xa577de053e7a57cc, %g1, %r28
	setx 0xbf9dcb4596ed8830, %g1, %r29
	setx 0x5c80b4009b16e4da, %g1, %r30
	setx 0xfdbc5359078842bf, %g1, %r31
	save
	setx 0xaa94cf234719525c, %g1, %r16
	setx 0x2dc2c128d932ad50, %g1, %r17
	setx 0x26e1eb26d557264a, %g1, %r18
	setx 0x0a54abf328695add, %g1, %r19
	setx 0x4b86a0be562254a8, %g1, %r20
	setx 0xe344b4f49d425b60, %g1, %r21
	setx 0xd20aca2d95e8e1cd, %g1, %r22
	setx 0x5a443aca761075fd, %g1, %r23
	setx 0xd1af6a5ecdc1b478, %g1, %r24
	setx 0x1e15dc0903da535e, %g1, %r25
	setx 0x32244643f8d59cb6, %g1, %r26
	setx 0xcf18e37788082e56, %g1, %r27
	setx 0xc2c1c267a247d67c, %g1, %r28
	setx 0xb8caf8cf5c988a38, %g1, %r29
	setx 0x80fa97354c6e6481, %g1, %r30
	setx 0x4d5330fdcc8013e7, %g1, %r31
	save
	setx 0x7685b136ad009bce, %g1, %r16
	setx 0xa4de68ebaf843e2a, %g1, %r17
	setx 0xf6db212846c9c7a8, %g1, %r18
	setx 0x4386347d7d4587a3, %g1, %r19
	setx 0x303231a0696140ed, %g1, %r20
	setx 0x79da73e3dc282f5a, %g1, %r21
	setx 0xf9ae81513d38f4be, %g1, %r22
	setx 0x96d7cc25531bf091, %g1, %r23
	setx 0xd4f492eec8daac16, %g1, %r24
	setx 0x7e11b64716ff3106, %g1, %r25
	setx 0x2acdd71dab631690, %g1, %r26
	setx 0xe6b99c1779b21484, %g1, %r27
	setx 0x687417b56000ab3a, %g1, %r28
	setx 0x00f7621f756345b6, %g1, %r29
	setx 0x8ead382e1569885c, %g1, %r30
	setx 0x416e2fbd631e3106, %g1, %r31
	restore
	setx	data_start, %r1, %r25
	mov	0x0, %r16
	mov	0x30, %r17
	mov	0x8, %r18
	mov	0x20, %r19
	mov	0x3c0, %r20
	mov	0x7f8, %r21
	mov	0x7e0, %r22
	mov	0x7f0, %r23
	mov	0x78, %r24
	mov	0x10, %r25
	mov	0x18, %r26
	mov	0x50, %r27
	mov	0, %r28
	mov	0, %r29
	mov	0, %r30
	mov	0, %r31
	ta	%icc, T_CHANGE_HPRIV
	wr	%g0, 0x74, %asi
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
	setx	data_start, %r1, %r2
	or	%r2, 0, %r2
	mov	0x55, %r20
	ldub	[%r2], %r22
	cmp	%r20, %r22
	be	diag_pass
	stb	%r20, [%r2]
	.word 0xe8bcc400  ! 2: STDA_R	stda	%r20, [%r19 + %r0] 0x20
	.word 0xeebfce40  ! 3: STDA_R	stda	%r23, [%r31 + %r0] 0x72
	.word 0xeebf2000  ! 4: STDA_I	stda	%r23, [%r28 + 0x0000] %asi
	.word 0x87802020  ! 5: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xeca40400  ! 6: STWA_R	stwa	%r22, [%r16 + %r0] 0x20
	.word 0xecd4e000  ! 7: LDSHA_I	ldsha	[%r19, + 0x0000] %asi, %r22
	.word 0xeccc6000  ! 8: LDSBA_I	ldsba	[%r17, + 0x0000] %asi, %r22
	.word 0xeabe49e0  ! 9: STDA_R	stda	%r21, [%r25 + %r0] 0x4f
	.word 0xead42000  ! 10: LDSHA_I	ldsha	[%r16, + 0x0000] %asi, %r21
	.word 0x87802020  ! 11: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xeab4e000  ! 12: STHA_I	stha	%r21, [%r19 + 0x0000] %asi
	.word 0xead46000  ! 13: LDSHA_I	ldsha	[%r17, + 0x0000] %asi, %r21
	.word 0xe0b44400  ! 14: STHA_R	stha	%r16, [%r17 + %r0] 0x20
	.word 0xe4af8e80  ! 15: STBA_R	stba	%r18, [%r30 + %r0] 0x74
	.word 0xe0a689e0  ! 16: STWA_R	stwa	%r16, [%r26 + %r0] 0x4f
	mov	0x7e0, %r20
	.word 0x87802073  ! 18: WRASI_I	wr	%r0, 0x0073, %asi
	mov	0x7d0, %r20
	.word 0x87802073  ! 20: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0xe08d04a0  ! 21: LDUBA_R	lduba	[%r20, %r0] 0x25, %r16
	.word 0xe6adc4a0  ! 22: STBA_R	stba	%r19, [%r23 + %r0] 0x25
	.word 0x87802020  ! 23: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe6cca000  ! 24: LDSBA_I	ldsba	[%r18, + 0x0000] %asi, %r19
	.word 0xe4af0e60  ! 25: STBA_R	stba	%r18, [%r28 + %r0] 0x73
	.word 0xecccc400  ! 26: LDSBA_R	ldsba	[%r19, %r0] 0x20, %r22
	.word 0xec9c2000  ! 27: LDDA_I	ldda	[%r16, + 0x0000] %asi, %r22
	.word 0xe2b609e0  ! 28: STHA_R	stha	%r17, [%r24 + %r0] 0x4f
	.word 0xe2f4e000  ! 29: STXA_I	stxa	%r17, [%r19 + 0x0000] %asi
	.word 0xe28c2000  ! 30: LDUBA_I	lduba	[%r16, + 0x0000] %asi, %r17
	.word 0xe6bf0e80  ! 31: STDA_R	stda	%r19, [%r28 + %r0] 0x74
	.word 0xe6cca000  ! 32: LDSBA_I	ldsba	[%r18, + 0x0000] %asi, %r19
	rd	%asr26, %g1
halt_rstint_0_0:
	wr	%g1, 1, %asr26
!$EV trig_pc_d(0,expr(@VA(.MAIN.halt_rstint_0_0), 16, 16)) -> intp(0, 1, 3)
	nop
	.word 0x01000000  ! 33: NOP	nop
	.word 0xe6bce000  ! 34: STDA_I	stda	%r19, [%r19 + 0x0000] %asi
	.word 0xe6bdc4a0  ! 35: STDA_R	stda	%r19, [%r23 + %r0] 0x25
	.word 0xe8b40400  ! 36: STHA_R	stha	%r20, [%r16 + %r0] 0x20
	.word 0xe6f4c400  ! 37: STXA_R	stxa	%r19, [%r19 + %r0] 0x20
	.word 0xe6cc6000  ! 38: LDSBA_I	ldsba	[%r17, + 0x0000] %asi, %r19
	.word 0xeec74e40  ! 39: LDSWA_R	ldswa	[%r29, %r0] 0x72, %r23
	.word 0xecf74e40  ! 40: STXA_R	stxa	%r22, [%r29 + %r0] 0x72
	.word 0xeabc0400  ! 41: STDA_R	stda	%r21, [%r16 + %r0] 0x20
	.word 0xeecc4400  ! 42: LDSBA_R	ldsba	[%r17, %r0] 0x20, %r23
	.word 0xe4f40400  ! 43: STXA_R	stxa	%r18, [%r16 + %r0] 0x20
	.word 0xe4dce000  ! 44: LDXA_I	ldxa	[%r19, + 0x0000] %asi, %r18
	.word 0xe0a4c400  ! 45: STWA_R	stwa	%r16, [%r19 + %r0] 0x20
	rd	%asr26, %g1
halt_rstint_0_1:
	wr	%g1, 1, %asr26
!$EV trig_pc_d(0,expr(@VA(.MAIN.halt_rstint_0_1), 16, 16)) -> intp(0, 1, 3)
	nop
	.word 0x01000000  ! 46: NOP	nop
	rd	%asr26, %g1
halt_rstint_0_2:
	wr	%g1, 1, %asr26
!$EV trig_pc_d(0,expr(@VA(.MAIN.halt_rstint_0_2), 16, 16)) -> intp(0, 1, 3)
	nop
	.word 0x01000000  ! 47: NOP	nop
	.word 0xe68f0e40  ! 48: LDUBA_R	lduba	[%r28, %r0] 0x72, %r19
	.word 0xe6aca000  ! 49: STBA_I	stba	%r19, [%r18 + 0x0000] %asi
	.word 0x87802074  ! 50: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0xe0af0e40  ! 51: STBA_R	stba	%r16, [%r28 + %r0] 0x72
	mov	0x3c0, %r22
	.word 0xe0c72000  ! 53: LDSWA_I	ldswa	[%r28, + 0x0000] %asi, %r16
	.word 0xeacd04a0  ! 54: LDSBA_R	ldsba	[%r20, %r0] 0x25, %r21
	.word 0xeaf7a000  ! 55: STXA_I	stxa	%r21, [%r30 + 0x0000] %asi
	.word 0xe4cf8e40  ! 56: LDSBA_R	ldsba	[%r30, %r0] 0x72, %r18
	.word 0xe4cfa000  ! 57: LDSBA_I	ldsba	[%r30, + 0x0000] %asi, %r18
	rd	%asr26, %g1
halt_rstint_0_3:
	wr	%g1, 1, %asr26
!$EV trig_pc_d(0,expr(@VA(.MAIN.halt_rstint_0_3), 16, 16)) -> intp(0, 1, 3)
	nop
	.word 0x01000000  ! 58: NOP	nop
	.word 0x87802072  ! 59: WRASI_I	wr	%r0, 0x0072, %asi
	rd	%asr26, %g1
halt_rstint_0_4:
	wr	%g1, 1, %asr26
!$EV trig_pc_d(0,expr(@VA(.MAIN.halt_rstint_0_4), 16, 16)) -> intp(0, 1, 3)
	nop
	.word 0x01000000  ! 60: NOP	nop
	.word 0xe4af2000  ! 61: STBA_I	stba	%r18, [%r28 + 0x0000] %asi
	.word 0xe4dfe000  ! 62: LDXA_I	ldxa	[%r31, + 0x0000] %asi, %r18
	.word 0xe6af8e80  ! 63: STBA_R	stba	%r19, [%r30 + %r0] 0x74
	.word 0xe8a44400  ! 64: STWA_R	stwa	%r20, [%r17 + %r0] 0x20
	.word 0xe8a76000  ! 65: STWA_I	stwa	%r20, [%r29 + 0x0000] %asi
	.word 0xe8c76000  ! 66: LDSWA_I	ldswa	[%r29, + 0x0000] %asi, %r20
	.word 0xe8872000  ! 67: LDUWA_I	lduwa	[%r28, + 0x0000] %asi, %r20
	.word 0xe8f70e80  ! 68: STXA_R	stxa	%r20, [%r28 + %r0] 0x74
	.word 0xecd40400  ! 69: LDSHA_R	ldsha	[%r16, %r0] 0x20, %r22
	.word 0xe2b44400  ! 70: STHA_R	stha	%r17, [%r17 + %r0] 0x20
	.word 0xe297e000  ! 71: LDUHA_I	lduha	[%r31, + 0x0000] %asi, %r17
	rd	%asr26, %g1
halt_rstint_0_5:
	wr	%g1, 1, %asr26
!$EV trig_pc_d(0,expr(@VA(.MAIN.halt_rstint_0_5), 16, 16)) -> intp(0, 1, 3)
	nop
	.word 0x01000000  ! 72: NOP	nop
	.word 0xe2bf2000  ! 73: STDA_I	stda	%r17, [%r28 + 0x0000] %asi
	.word 0x87802074  ! 74: WRASI_I	wr	%r0, 0x0074, %asi
	rd	%asr26, %g1
halt_rstint_0_6:
	wr	%g1, 1, %asr26
!$EV trig_pc_d(0,expr(@VA(.MAIN.halt_rstint_0_6), 16, 16)) -> intp(0, 1, 3)
	nop
	.word 0x01000000  ! 75: NOP	nop
	.word 0xe2afa000  ! 76: STBA_I	stba	%r17, [%r30 + 0x0000] %asi
	.word 0x87802074  ! 77: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0xe68c8400  ! 78: LDUBA_R	lduba	[%r18, %r0] 0x20, %r19
	.word 0xe4bc4400  ! 79: STDA_R	stda	%r18, [%r17 + %r0] 0x20
	.word 0xe0cd44a0  ! 80: LDSBA_R	ldsba	[%r21, %r0] 0x25, %r16
	.word 0xeeb78e60  ! 81: STHA_R	stha	%r23, [%r30 + %r0] 0x73
	.word 0x87802020  ! 82: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xeaadc4a0  ! 83: STBA_R	stba	%r21, [%r23 + %r0] 0x25
	.word 0xeaa4e000  ! 84: STWA_I	stwa	%r21, [%r19 + 0x0000] %asi
	.word 0xeaf46000  ! 85: STXA_I	stxa	%r21, [%r17 + 0x0000] %asi
	.word 0x87802073  ! 86: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0xe4f7ce40  ! 87: STXA_R	stxa	%r18, [%r31 + %r0] 0x72
	rd	%asr26, %g1
halt_rstint_0_7:
	wr	%g1, 1, %asr26
!$EV trig_pc_d(0,expr(@VA(.MAIN.halt_rstint_0_7), 16, 16)) -> intp(0, 1, 3)
	nop
	.word 0x01000000  ! 88: NOP	nop
	.word 0x87802020  ! 89: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe6df8e60  ! 90: LDXA_R	ldxa	[%r30, %r0] 0x73, %r19
	rd	%asr26, %g1
halt_rstint_0_8:
	wr	%g1, 1, %asr26
!$EV trig_pc_d(0,expr(@VA(.MAIN.halt_rstint_0_8), 16, 16)) -> intp(0, 1, 3)
	nop
	.word 0x01000000  ! 91: NOP	nop
	.word 0xe6dc6000  ! 92: LDXA_I	ldxa	[%r17, + 0x0000] %asi, %r19
	.word 0x87802025  ! 93: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0xe6c5a000  ! 94: LDSWA_I	ldswa	[%r22, + 0x0000] %asi, %r19
	.word 0xeaa78e40  ! 95: STWA_R	stwa	%r21, [%r30 + %r0] 0x72
	rd	%asr26, %g1
halt_rstint_0_9:
	wr	%g1, 1, %asr26
!$EV trig_pc_d(0,expr(@VA(.MAIN.halt_rstint_0_9), 16, 16)) -> intp(0, 1, 3)
	nop
	.word 0x01000000  ! 96: NOP	nop
	mov	0x30, %r16
	.word 0xeaa5e000  ! 98: STWA_I	stwa	%r21, [%r23 + 0x0000] %asi
	rd	%asr26, %g1
halt_rstint_0_10:
	wr	%g1, 1, %asr26
!$EV trig_pc_d(0,expr(@VA(.MAIN.halt_rstint_0_10), 16, 16)) -> intp(0, 1, 3)
	nop
	.word 0x01000000  ! 99: NOP	nop
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_3:
	setx	data_start, %r1, %r2
	or	%r2, 3, %r2
	mov	0x55, %r20
	ldub	[%r2], %r22
	cmp	%r20, %r22
	be	diag_pass
	stb	%r20, [%r2]
	.word 0xe6bc4400  ! 2: STDA_R	stda	%r19, [%r17 + %r0] 0x20
	.word 0xecbf4e40  ! 3: STDA_R	stda	%r22, [%r29 + %r0] 0x72
	.word 0xeebfa000  ! 4: STDA_I	stda	%r23, [%r30 + 0x0000] %asi
	.word 0x8780204f  ! 5: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xeea44400  ! 6: STWA_R	stwa	%r23, [%r17 + %r0] 0x20
	.word 0xecd42000  ! 7: LDSHA_I	ldsha	[%r16, + 0x0000] %asi, %r22
	.word 0xeccce000  ! 8: LDSBA_I	ldsba	[%r19, + 0x0000] %asi, %r22
	.word 0xe6bf8e40  ! 9: STDA_R	stda	%r19, [%r30 + %r0] 0x72
	.word 0xead42000  ! 10: LDSHA_I	ldsha	[%r16, + 0x0000] %asi, %r21
	.word 0x87802072  ! 11: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0xeab4e000  ! 12: STHA_I	stha	%r21, [%r19 + 0x0000] %asi
	.word 0xead4a000  ! 13: LDSHA_I	ldsha	[%r18, + 0x0000] %asi, %r21
	.word 0xe8b74e60  ! 14: STHA_R	stha	%r20, [%r29 + %r0] 0x73
	.word 0xe0afce60  ! 15: STBA_R	stba	%r16, [%r31 + %r0] 0x73
	.word 0xe2a74e60  ! 16: STWA_R	stwa	%r17, [%r29 + %r0] 0x73
	mov	0x3d8, %r21
	.word 0x87802073  ! 18: WRASI_I	wr	%r0, 0x0073, %asi
	mov	0x3e8, %r20
	.word 0x87802025  ! 20: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0xe88e49e0  ! 21: LDUBA_R	lduba	[%r25, %r0] 0x4f, %r20
	.word 0xeeac8400  ! 22: STBA_R	stba	%r23, [%r18 + %r0] 0x20
	.word 0x87802020  ! 23: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe6cca000  ! 24: LDSBA_I	ldsba	[%r18, + 0x0000] %asi, %r19
	.word 0xe4ae09e0  ! 25: STBA_R	stba	%r18, [%r24 + %r0] 0x4f
	.word 0xe8cf0e60  ! 26: LDSBA_R	ldsba	[%r28, %r0] 0x73, %r20
	.word 0xec9ce000  ! 27: LDDA_I	ldda	[%r19, + 0x0000] %asi, %r22
	.word 0xe6b40400  ! 28: STHA_R	stha	%r19, [%r16 + %r0] 0x20
	.word 0xe2f42000  ! 29: STXA_I	stxa	%r17, [%r16 + 0x0000] %asi
	.word 0xe28ca000  ! 30: LDUBA_I	lduba	[%r18, + 0x0000] %asi, %r17
	.word 0xeabfce80  ! 31: STDA_R	stda	%r21, [%r31 + %r0] 0x74
	.word 0xe6cc6000  ! 32: LDSBA_I	ldsba	[%r17, + 0x0000] %asi, %r19
	rd	%asr26, %g1
halt_rstint_3_0:
	wr	%g1, 1, %asr26
!$EV trig_pc_d(3,expr(@VA(.MAIN.halt_rstint_3_0), 16, 16)) -> intp(3, 1, 3)
	nop
	.word 0x01000000  ! 33: NOP	nop
	.word 0xe6bce000  ! 34: STDA_I	stda	%r19, [%r19 + 0x0000] %asi
	.word 0xeebf0e60  ! 35: STDA_R	stda	%r23, [%r28 + %r0] 0x73
	.word 0xe6b78e80  ! 36: STHA_R	stha	%r19, [%r30 + %r0] 0x74
	.word 0xecf7ce40  ! 37: STXA_R	stxa	%r22, [%r31 + %r0] 0x72
	.word 0xe6cc2000  ! 38: LDSBA_I	ldsba	[%r16, + 0x0000] %asi, %r19
	.word 0xe2c609e0  ! 39: LDSWA_R	ldswa	[%r24, %r0] 0x4f, %r17
	.word 0xeef7ce60  ! 40: STXA_R	stxa	%r23, [%r31 + %r0] 0x73
	.word 0xe6bf8e80  ! 41: STDA_R	stda	%r19, [%r30 + %r0] 0x74
	.word 0xe4cc8400  ! 42: LDSBA_R	ldsba	[%r18, %r0] 0x20, %r18
	.word 0xecf78e80  ! 43: STXA_R	stxa	%r22, [%r30 + %r0] 0x74
	.word 0xe4dc2000  ! 44: LDXA_I	ldxa	[%r16, + 0x0000] %asi, %r18
	.word 0xe6a7ce60  ! 45: STWA_R	stwa	%r19, [%r31 + %r0] 0x73
	rd	%asr26, %g1
halt_rstint_3_1:
	wr	%g1, 1, %asr26
!$EV trig_pc_d(3,expr(@VA(.MAIN.halt_rstint_3_1), 16, 16)) -> intp(3, 1, 3)
	nop
	.word 0x01000000  ! 46: NOP	nop
	rd	%asr26, %g1
halt_rstint_3_2:
	wr	%g1, 1, %asr26
!$EV trig_pc_d(3,expr(@VA(.MAIN.halt_rstint_3_2), 16, 16)) -> intp(3, 1, 3)
	nop
	.word 0x01000000  ! 47: NOP	nop
	.word 0xe28cc400  ! 48: LDUBA_R	lduba	[%r19, %r0] 0x20, %r17
	.word 0xe6ac2000  ! 49: STBA_I	stba	%r19, [%r16 + 0x0000] %asi
	.word 0x87802020  ! 50: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe8afce40  ! 51: STBA_R	stba	%r20, [%r31 + %r0] 0x72
	mov	0x3d0, %r21
	.word 0xe0c72000  ! 53: LDSWA_I	ldswa	[%r28, + 0x0000] %asi, %r16
	.word 0xe6cf4e40  ! 54: LDSBA_R	ldsba	[%r29, %r0] 0x72, %r19
	.word 0xeaf7e000  ! 55: STXA_I	stxa	%r21, [%r31 + 0x0000] %asi
	.word 0xeece09e0  ! 56: LDSBA_R	ldsba	[%r24, %r0] 0x4f, %r23
	.word 0xe4cf2000  ! 57: LDSBA_I	ldsba	[%r28, + 0x0000] %asi, %r18
	rd	%asr26, %g1
halt_rstint_3_3:
	wr	%g1, 1, %asr26
!$EV trig_pc_d(3,expr(@VA(.MAIN.halt_rstint_3_3), 16, 16)) -> intp(3, 1, 3)
	nop
	.word 0x01000000  ! 58: NOP	nop
	.word 0x87802020  ! 59: WRASI_I	wr	%r0, 0x0020, %asi
	rd	%asr26, %g1
halt_rstint_3_4:
	wr	%g1, 1, %asr26
!$EV trig_pc_d(3,expr(@VA(.MAIN.halt_rstint_3_4), 16, 16)) -> intp(3, 1, 3)
	nop
	.word 0x01000000  ! 60: NOP	nop
	.word 0xe4afe000  ! 61: STBA_I	stba	%r18, [%r31 + 0x0000] %asi
	.word 0xe4df6000  ! 62: LDXA_I	ldxa	[%r29, + 0x0000] %asi, %r18
	.word 0xe4af4e60  ! 63: STBA_R	stba	%r18, [%r29 + %r0] 0x73
	.word 0xe8a78e60  ! 64: STWA_R	stwa	%r20, [%r30 + %r0] 0x73
	.word 0xe8a72000  ! 65: STWA_I	stwa	%r20, [%r28 + 0x0000] %asi
	.word 0xe8c7a000  ! 66: LDSWA_I	ldswa	[%r30, + 0x0000] %asi, %r20
	.word 0xe887e000  ! 67: LDUWA_I	lduwa	[%r31, + 0x0000] %asi, %r20
	.word 0xe0f7ce60  ! 68: STXA_R	stxa	%r16, [%r31 + %r0] 0x73
	.word 0xe8d504a0  ! 69: LDSHA_R	ldsha	[%r20, %r0] 0x25, %r20
	.word 0xeeb44400  ! 70: STHA_R	stha	%r23, [%r17 + %r0] 0x20
	.word 0xe297e000  ! 71: LDUHA_I	lduha	[%r31, + 0x0000] %asi, %r17
	rd	%asr26, %g1
halt_rstint_3_5:
	wr	%g1, 1, %asr26
!$EV trig_pc_d(3,expr(@VA(.MAIN.halt_rstint_3_5), 16, 16)) -> intp(3, 1, 3)
	nop
	.word 0x01000000  ! 72: NOP	nop
	.word 0xe2bfa000  ! 73: STDA_I	stda	%r17, [%r30 + 0x0000] %asi
	.word 0x87802020  ! 74: WRASI_I	wr	%r0, 0x0020, %asi
	rd	%asr26, %g1
halt_rstint_3_6:
	wr	%g1, 1, %asr26
!$EV trig_pc_d(3,expr(@VA(.MAIN.halt_rstint_3_6), 16, 16)) -> intp(3, 1, 3)
	nop
	.word 0x01000000  ! 75: NOP	nop
	.word 0xe2af2000  ! 76: STBA_I	stba	%r17, [%r28 + 0x0000] %asi
	.word 0x87802025  ! 77: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0xe68fce40  ! 78: LDUBA_R	lduba	[%r31, %r0] 0x72, %r19
	.word 0xeabd84a0  ! 79: STDA_R	stda	%r21, [%r22 + %r0] 0x25
	.word 0xe0cf0e80  ! 80: LDSBA_R	ldsba	[%r28, %r0] 0x74, %r16
	.word 0xe4b6c9e0  ! 81: STHA_R	stha	%r18, [%r27 + %r0] 0x4f
	.word 0x87802020  ! 82: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe0ac8400  ! 83: STBA_R	stba	%r16, [%r18 + %r0] 0x20
	.word 0xeaa4a000  ! 84: STWA_I	stwa	%r21, [%r18 + 0x0000] %asi
	.word 0xeaf4a000  ! 85: STXA_I	stxa	%r21, [%r18 + 0x0000] %asi
	.word 0x87802073  ! 86: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0xeaf44400  ! 87: STXA_R	stxa	%r21, [%r17 + %r0] 0x20
	rd	%asr26, %g1
halt_rstint_3_7:
	wr	%g1, 1, %asr26
!$EV trig_pc_d(3,expr(@VA(.MAIN.halt_rstint_3_7), 16, 16)) -> intp(3, 1, 3)
	nop
	.word 0x01000000  ! 88: NOP	nop
	.word 0x87802025  ! 89: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0xe4df8e40  ! 90: LDXA_R	ldxa	[%r30, %r0] 0x72, %r18
	rd	%asr26, %g1
halt_rstint_3_8:
	wr	%g1, 1, %asr26
!$EV trig_pc_d(3,expr(@VA(.MAIN.halt_rstint_3_8), 16, 16)) -> intp(3, 1, 3)
	nop
	.word 0x01000000  ! 91: NOP	nop
	.word 0xe6dc6000  ! 92: LDXA_I	ldxa	[%r17, + 0x0000] %asi, %r19
	.word 0x87802074  ! 93: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0xe6c56000  ! 94: LDSWA_I	ldswa	[%r21, + 0x0000] %asi, %r19
	.word 0xe2a70e80  ! 95: STWA_R	stwa	%r17, [%r28 + %r0] 0x74
	rd	%asr26, %g1
halt_rstint_3_9:
	wr	%g1, 1, %asr26
!$EV trig_pc_d(3,expr(@VA(.MAIN.halt_rstint_3_9), 16, 16)) -> intp(3, 1, 3)
	nop
	.word 0x01000000  ! 96: NOP	nop
	mov	0x68, %r17
	.word 0xeaa56000  ! 98: STWA_I	stwa	%r21, [%r21 + 0x0000] %asi
	rd	%asr26, %g1
halt_rstint_3_10:
	wr	%g1, 1, %asr26
!$EV trig_pc_d(3,expr(@VA(.MAIN.halt_rstint_3_10), 16, 16)) -> intp(3, 1, 3)
	nop
	.word 0x01000000  ! 99: NOP	nop
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_2:
	setx	data_start, %r1, %r2
	or	%r2, 2, %r2
	mov	0x55, %r20
	ldub	[%r2], %r22
	cmp	%r20, %r22
	be	diag_pass
	stb	%r20, [%r2]
	.word 0xe8bf4e40  ! 2: STDA_R	stda	%r20, [%r29 + %r0] 0x72
	.word 0xe2bcc400  ! 3: STDA_R	stda	%r17, [%r19 + %r0] 0x20
	.word 0xeebf6000  ! 4: STDA_I	stda	%r23, [%r29 + 0x0000] %asi
	.word 0x87802073  ! 5: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0xeaa40400  ! 6: STWA_R	stwa	%r21, [%r16 + %r0] 0x20
	.word 0xecd42000  ! 7: LDSHA_I	ldsha	[%r16, + 0x0000] %asi, %r22
	.word 0xeccca000  ! 8: LDSBA_I	ldsba	[%r18, + 0x0000] %asi, %r22
	.word 0xecbf0e40  ! 9: STDA_R	stda	%r22, [%r28 + %r0] 0x72
	.word 0xead4a000  ! 10: LDSHA_I	ldsha	[%r18, + 0x0000] %asi, %r21
	.word 0x8780204f  ! 11: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xeab46000  ! 12: STHA_I	stha	%r21, [%r17 + 0x0000] %asi
	.word 0xead4a000  ! 13: LDSHA_I	ldsha	[%r18, + 0x0000] %asi, %r21
	.word 0xe4b74e80  ! 14: STHA_R	stha	%r18, [%r29 + %r0] 0x74
	.word 0xeaad04a0  ! 15: STBA_R	stba	%r21, [%r20 + %r0] 0x25
	.word 0xeea4c400  ! 16: STWA_R	stwa	%r23, [%r19 + %r0] 0x20
	mov	0x3f0, %r22
	.word 0x87802025  ! 18: WRASI_I	wr	%r0, 0x0025, %asi
	mov	0x3f8, %r21
	.word 0x87802073  ! 20: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0xe08f0e60  ! 21: LDUBA_R	lduba	[%r28, %r0] 0x73, %r16
	.word 0xe4acc400  ! 22: STBA_R	stba	%r18, [%r19 + %r0] 0x20
	.word 0x87802025  ! 23: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0xe6cca000  ! 24: LDSBA_I	ldsba	[%r18, + 0x0000] %asi, %r19
	.word 0xe2ac4400  ! 25: STBA_R	stba	%r17, [%r17 + %r0] 0x20
	.word 0xeacf4e40  ! 26: LDSBA_R	ldsba	[%r29, %r0] 0x72, %r21
	.word 0xec9ce000  ! 27: LDDA_I	ldda	[%r19, + 0x0000] %asi, %r22
	.word 0xecb40400  ! 28: STHA_R	stha	%r22, [%r16 + %r0] 0x20
	.word 0xe2f42000  ! 29: STXA_I	stxa	%r17, [%r16 + 0x0000] %asi
	.word 0xe28c6000  ! 30: LDUBA_I	lduba	[%r17, + 0x0000] %asi, %r17
	.word 0xecbd84a0  ! 31: STDA_R	stda	%r22, [%r22 + %r0] 0x25
	.word 0xe6cca000  ! 32: LDSBA_I	ldsba	[%r18, + 0x0000] %asi, %r19
	rd	%asr26, %g1
halt_rstint_2_0:
	wr	%g1, 1, %asr26
!$EV trig_pc_d(2,expr(@VA(.MAIN.halt_rstint_2_0), 16, 16)) -> intp(2, 1, 3)
	nop
	.word 0x01000000  ! 33: NOP	nop
	.word 0xe6bc2000  ! 34: STDA_I	stda	%r19, [%r16 + 0x0000] %asi
	.word 0xe4bf8e60  ! 35: STDA_R	stda	%r18, [%r30 + %r0] 0x73
	.word 0xe6b74e60  ! 36: STHA_R	stha	%r19, [%r29 + %r0] 0x73
	.word 0xecf6c9e0  ! 37: STXA_R	stxa	%r22, [%r27 + %r0] 0x4f
	.word 0xe6cca000  ! 38: LDSBA_I	ldsba	[%r18, + 0x0000] %asi, %r19
	.word 0xecc4c400  ! 39: LDSWA_R	ldswa	[%r19, %r0] 0x20, %r22
	.word 0xeef48400  ! 40: STXA_R	stxa	%r23, [%r18 + %r0] 0x20
	.word 0xe6be49e0  ! 41: STDA_R	stda	%r19, [%r25 + %r0] 0x4f
	.word 0xe2ccc400  ! 42: LDSBA_R	ldsba	[%r19, %r0] 0x20, %r17
	.word 0xe6f689e0  ! 43: STXA_R	stxa	%r19, [%r26 + %r0] 0x4f
	.word 0xe4dc2000  ! 44: LDXA_I	ldxa	[%r16, + 0x0000] %asi, %r18
	.word 0xeea689e0  ! 45: STWA_R	stwa	%r23, [%r26 + %r0] 0x4f
	rd	%asr26, %g1
halt_rstint_2_1:
	wr	%g1, 1, %asr26
!$EV trig_pc_d(2,expr(@VA(.MAIN.halt_rstint_2_1), 16, 16)) -> intp(2, 1, 3)
	nop
	.word 0x01000000  ! 46: NOP	nop
	rd	%asr26, %g1
halt_rstint_2_2:
	wr	%g1, 1, %asr26
!$EV trig_pc_d(2,expr(@VA(.MAIN.halt_rstint_2_2), 16, 16)) -> intp(2, 1, 3)
	nop
	.word 0x01000000  ! 47: NOP	nop
	.word 0xe08f0e60  ! 48: LDUBA_R	lduba	[%r28, %r0] 0x73, %r16
	.word 0xe6aca000  ! 49: STBA_I	stba	%r19, [%r18 + 0x0000] %asi
	.word 0x87802020  ! 50: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xecacc400  ! 51: STBA_R	stba	%r22, [%r19 + %r0] 0x20
	mov	0x7c8, %r23
	.word 0xe0c7e000  ! 53: LDSWA_I	ldswa	[%r31, + 0x0000] %asi, %r16
	.word 0xe2cf4e80  ! 54: LDSBA_R	ldsba	[%r29, %r0] 0x74, %r17
	.word 0xeaf76000  ! 55: STXA_I	stxa	%r21, [%r29 + 0x0000] %asi
	.word 0xeacf0e40  ! 56: LDSBA_R	ldsba	[%r28, %r0] 0x72, %r21
	.word 0xe4cfe000  ! 57: LDSBA_I	ldsba	[%r31, + 0x0000] %asi, %r18
	rd	%asr26, %g1
halt_rstint_2_3:
	wr	%g1, 1, %asr26
!$EV trig_pc_d(2,expr(@VA(.MAIN.halt_rstint_2_3), 16, 16)) -> intp(2, 1, 3)
	nop
	.word 0x01000000  ! 58: NOP	nop
	.word 0x8780204f  ! 59: WRASI_I	wr	%r0, 0x004f, %asi
	rd	%asr26, %g1
halt_rstint_2_4:
	wr	%g1, 1, %asr26
!$EV trig_pc_d(2,expr(@VA(.MAIN.halt_rstint_2_4), 16, 16)) -> intp(2, 1, 3)
	nop
	.word 0x01000000  ! 60: NOP	nop
	.word 0xe4afe000  ! 61: STBA_I	stba	%r18, [%r31 + 0x0000] %asi
	.word 0xe4df2000  ! 62: LDXA_I	ldxa	[%r28, + 0x0000] %asi, %r18
	.word 0xeaae49e0  ! 63: STBA_R	stba	%r21, [%r25 + %r0] 0x4f
	.word 0xeea74e80  ! 64: STWA_R	stwa	%r23, [%r29 + %r0] 0x74
	.word 0xe8a76000  ! 65: STWA_I	stwa	%r20, [%r29 + 0x0000] %asi
	.word 0xe8c7e000  ! 66: LDSWA_I	ldswa	[%r31, + 0x0000] %asi, %r20
	.word 0xe887a000  ! 67: LDUWA_I	lduwa	[%r30, + 0x0000] %asi, %r20
	.word 0xe4f609e0  ! 68: STXA_R	stxa	%r18, [%r24 + %r0] 0x4f
	.word 0xe4d70e60  ! 69: LDSHA_R	ldsha	[%r28, %r0] 0x73, %r18
	.word 0xe0b7ce60  ! 70: STHA_R	stha	%r16, [%r31 + %r0] 0x73
	.word 0xe2976000  ! 71: LDUHA_I	lduha	[%r29, + 0x0000] %asi, %r17
	rd	%asr26, %g1
halt_rstint_2_5:
	wr	%g1, 1, %asr26
!$EV trig_pc_d(2,expr(@VA(.MAIN.halt_rstint_2_5), 16, 16)) -> intp(2, 1, 3)
	nop
	.word 0x01000000  ! 72: NOP	nop
	.word 0xe2bfe000  ! 73: STDA_I	stda	%r17, [%r31 + 0x0000] %asi
	.word 0x87802020  ! 74: WRASI_I	wr	%r0, 0x0020, %asi
	rd	%asr26, %g1
halt_rstint_2_6:
	wr	%g1, 1, %asr26
!$EV trig_pc_d(2,expr(@VA(.MAIN.halt_rstint_2_6), 16, 16)) -> intp(2, 1, 3)
	nop
	.word 0x01000000  ! 75: NOP	nop
	.word 0xe2af6000  ! 76: STBA_I	stba	%r17, [%r29 + 0x0000] %asi
	.word 0x87802074  ! 77: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0xe28dc4a0  ! 78: LDUBA_R	lduba	[%r23, %r0] 0x25, %r17
	.word 0xe6bfce60  ! 79: STDA_R	stda	%r19, [%r31 + %r0] 0x73
	.word 0xe6cd84a0  ! 80: LDSBA_R	ldsba	[%r22, %r0] 0x25, %r19
	.word 0xe2b74e80  ! 81: STHA_R	stha	%r17, [%r29 + %r0] 0x74
	.word 0x87802020  ! 82: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe0af8e60  ! 83: STBA_R	stba	%r16, [%r30 + %r0] 0x73
	.word 0xeaa46000  ! 84: STWA_I	stwa	%r21, [%r17 + 0x0000] %asi
	.word 0xeaf4e000  ! 85: STXA_I	stxa	%r21, [%r19 + 0x0000] %asi
	.word 0x8780204f  ! 86: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xe8f70e40  ! 87: STXA_R	stxa	%r20, [%r28 + %r0] 0x72
	rd	%asr26, %g1
halt_rstint_2_7:
	wr	%g1, 1, %asr26
!$EV trig_pc_d(2,expr(@VA(.MAIN.halt_rstint_2_7), 16, 16)) -> intp(2, 1, 3)
	nop
	.word 0x01000000  ! 88: NOP	nop
	.word 0x8780204f  ! 89: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xeadc0400  ! 90: LDXA_R	ldxa	[%r16, %r0] 0x20, %r21
	rd	%asr26, %g1
halt_rstint_2_8:
	wr	%g1, 1, %asr26
!$EV trig_pc_d(2,expr(@VA(.MAIN.halt_rstint_2_8), 16, 16)) -> intp(2, 1, 3)
	nop
	.word 0x01000000  ! 91: NOP	nop
	.word 0xe6dce000  ! 92: LDXA_I	ldxa	[%r19, + 0x0000] %asi, %r19
	.word 0x87802020  ! 93: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe6c5e000  ! 94: LDSWA_I	ldswa	[%r23, + 0x0000] %asi, %r19
	.word 0xe8a6c9e0  ! 95: STWA_R	stwa	%r20, [%r27 + %r0] 0x4f
	rd	%asr26, %g1
halt_rstint_2_9:
	wr	%g1, 1, %asr26
!$EV trig_pc_d(2,expr(@VA(.MAIN.halt_rstint_2_9), 16, 16)) -> intp(2, 1, 3)
	nop
	.word 0x01000000  ! 96: NOP	nop
	mov	0x10, %r19
	.word 0xeaa5a000  ! 98: STWA_I	stwa	%r21, [%r22 + 0x0000] %asi
	rd	%asr26, %g1
halt_rstint_2_10:
	wr	%g1, 1, %asr26
!$EV trig_pc_d(2,expr(@VA(.MAIN.halt_rstint_2_10), 16, 16)) -> intp(2, 1, 3)
	nop
	.word 0x01000000  ! 99: NOP	nop
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_1:
	setx	data_start, %r1, %r2
	or	%r2, 1, %r2
	mov	0x55, %r20
	ldub	[%r2], %r22
	cmp	%r20, %r22
	be	diag_pass
	stb	%r20, [%r2]
	.word 0xe6bc8400  ! 2: STDA_R	stda	%r19, [%r18 + %r0] 0x20
	.word 0xeebf4e80  ! 3: STDA_R	stda	%r23, [%r29 + %r0] 0x74
	.word 0xeebf2000  ! 4: STDA_I	stda	%r23, [%r28 + 0x0000] %asi
	.word 0x87802025  ! 5: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0xe0a48400  ! 6: STWA_R	stwa	%r16, [%r18 + %r0] 0x20
	.word 0xecd46000  ! 7: LDSHA_I	ldsha	[%r17, + 0x0000] %asi, %r22
	.word 0xeccca000  ! 8: LDSBA_I	ldsba	[%r18, + 0x0000] %asi, %r22
	.word 0xe4bf4e40  ! 9: STDA_R	stda	%r18, [%r29 + %r0] 0x72
	.word 0xead42000  ! 10: LDSHA_I	ldsha	[%r16, + 0x0000] %asi, %r21
	.word 0x8780204f  ! 11: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xeab42000  ! 12: STHA_I	stha	%r21, [%r16 + 0x0000] %asi
	.word 0xead4a000  ! 13: LDSHA_I	ldsha	[%r18, + 0x0000] %asi, %r21
	.word 0xeab504a0  ! 14: STHA_R	stha	%r21, [%r20 + %r0] 0x25
	.word 0xe2ad44a0  ! 15: STBA_R	stba	%r17, [%r21 + %r0] 0x25
	.word 0xe2a70e40  ! 16: STWA_R	stwa	%r17, [%r28 + %r0] 0x72
	mov	0x7c8, %r20
	.word 0x87802025  ! 18: WRASI_I	wr	%r0, 0x0025, %asi
	mov	0x7f8, %r22
	.word 0x87802020  ! 20: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xea8f4e60  ! 21: LDUBA_R	lduba	[%r29, %r0] 0x73, %r21
	.word 0xeaacc400  ! 22: STBA_R	stba	%r21, [%r19 + %r0] 0x20
	.word 0x87802072  ! 23: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0xe6cc6000  ! 24: LDSBA_I	ldsba	[%r17, + 0x0000] %asi, %r19
	.word 0xeaaf8e80  ! 25: STBA_R	stba	%r21, [%r30 + %r0] 0x74
	.word 0xe0cdc4a0  ! 26: LDSBA_R	ldsba	[%r23, %r0] 0x25, %r16
	.word 0xec9ce000  ! 27: LDDA_I	ldda	[%r19, + 0x0000] %asi, %r22
	.word 0xe0b7ce60  ! 28: STHA_R	stha	%r16, [%r31 + %r0] 0x73
	.word 0xe2f46000  ! 29: STXA_I	stxa	%r17, [%r17 + 0x0000] %asi
	.word 0xe28c6000  ! 30: LDUBA_I	lduba	[%r17, + 0x0000] %asi, %r17
	.word 0xe8bc0400  ! 31: STDA_R	stda	%r20, [%r16 + %r0] 0x20
	.word 0xe6cc6000  ! 32: LDSBA_I	ldsba	[%r17, + 0x0000] %asi, %r19
	rd	%asr26, %g1
halt_rstint_1_0:
	wr	%g1, 1, %asr26
!$EV trig_pc_d(1,expr(@VA(.MAIN.halt_rstint_1_0), 16, 16)) -> intp(1, 1, 3)
	nop
	.word 0x01000000  ! 33: NOP	nop
	.word 0xe6bc2000  ! 34: STDA_I	stda	%r19, [%r16 + 0x0000] %asi
	.word 0xeabd04a0  ! 35: STDA_R	stda	%r21, [%r20 + %r0] 0x25
	.word 0xe2b48400  ! 36: STHA_R	stha	%r17, [%r18 + %r0] 0x20
	.word 0xe6f70e80  ! 37: STXA_R	stxa	%r19, [%r28 + %r0] 0x74
	.word 0xe6cc6000  ! 38: LDSBA_I	ldsba	[%r17, + 0x0000] %asi, %r19
	.word 0xe4c48400  ! 39: LDSWA_R	ldswa	[%r18, %r0] 0x20, %r18
	.word 0xe0f544a0  ! 40: STXA_R	stxa	%r16, [%r21 + %r0] 0x25
	.word 0xe4bc4400  ! 41: STDA_R	stda	%r18, [%r17 + %r0] 0x20
	.word 0xe6cc4400  ! 42: LDSBA_R	ldsba	[%r17, %r0] 0x20, %r19
	.word 0xe8f70e80  ! 43: STXA_R	stxa	%r20, [%r28 + %r0] 0x74
	.word 0xe4dce000  ! 44: LDXA_I	ldxa	[%r19, + 0x0000] %asi, %r18
	.word 0xe8a74e40  ! 45: STWA_R	stwa	%r20, [%r29 + %r0] 0x72
	rd	%asr26, %g1
halt_rstint_1_1:
	wr	%g1, 1, %asr26
!$EV trig_pc_d(1,expr(@VA(.MAIN.halt_rstint_1_1), 16, 16)) -> intp(1, 1, 3)
	nop
	.word 0x01000000  ! 46: NOP	nop
	rd	%asr26, %g1
halt_rstint_1_2:
	wr	%g1, 1, %asr26
!$EV trig_pc_d(1,expr(@VA(.MAIN.halt_rstint_1_2), 16, 16)) -> intp(1, 1, 3)
	nop
	.word 0x01000000  ! 47: NOP	nop
	.word 0xea8dc4a0  ! 48: LDUBA_R	lduba	[%r23, %r0] 0x25, %r21
	.word 0xe6ac2000  ! 49: STBA_I	stba	%r19, [%r16 + 0x0000] %asi
	.word 0x87802020  ! 50: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe6aec9e0  ! 51: STBA_R	stba	%r19, [%r27 + %r0] 0x4f
	mov	0x3c8, %r22
	.word 0xe0c76000  ! 53: LDSWA_I	ldswa	[%r29, + 0x0000] %asi, %r16
	.word 0xeecec9e0  ! 54: LDSBA_R	ldsba	[%r27, %r0] 0x4f, %r23
	.word 0xeaf76000  ! 55: STXA_I	stxa	%r21, [%r29 + 0x0000] %asi
	.word 0xeecd84a0  ! 56: LDSBA_R	ldsba	[%r22, %r0] 0x25, %r23
	.word 0xe4cf2000  ! 57: LDSBA_I	ldsba	[%r28, + 0x0000] %asi, %r18
	rd	%asr26, %g1
halt_rstint_1_3:
	wr	%g1, 1, %asr26
!$EV trig_pc_d(1,expr(@VA(.MAIN.halt_rstint_1_3), 16, 16)) -> intp(1, 1, 3)
	nop
	.word 0x01000000  ! 58: NOP	nop
	.word 0x87802020  ! 59: WRASI_I	wr	%r0, 0x0020, %asi
	rd	%asr26, %g1
halt_rstint_1_4:
	wr	%g1, 1, %asr26
!$EV trig_pc_d(1,expr(@VA(.MAIN.halt_rstint_1_4), 16, 16)) -> intp(1, 1, 3)
	nop
	.word 0x01000000  ! 60: NOP	nop
	.word 0xe4af2000  ! 61: STBA_I	stba	%r18, [%r28 + 0x0000] %asi
	.word 0xe4df6000  ! 62: LDXA_I	ldxa	[%r29, + 0x0000] %asi, %r18
	.word 0xecafce80  ! 63: STBA_R	stba	%r22, [%r31 + %r0] 0x74
	.word 0xeea7ce60  ! 64: STWA_R	stwa	%r23, [%r31 + %r0] 0x73
	.word 0xe8a7e000  ! 65: STWA_I	stwa	%r20, [%r31 + 0x0000] %asi
	.word 0xe8c72000  ! 66: LDSWA_I	ldswa	[%r28, + 0x0000] %asi, %r20
	.word 0xe8872000  ! 67: LDUWA_I	lduwa	[%r28, + 0x0000] %asi, %r20
	.word 0xe2f78e80  ! 68: STXA_R	stxa	%r17, [%r30 + %r0] 0x74
	.word 0xe2d649e0  ! 69: LDSHA_R	ldsha	[%r25, %r0] 0x4f, %r17
	.word 0xe8b44400  ! 70: STHA_R	stha	%r20, [%r17 + %r0] 0x20
	.word 0xe297a000  ! 71: LDUHA_I	lduha	[%r30, + 0x0000] %asi, %r17
	rd	%asr26, %g1
halt_rstint_1_5:
	wr	%g1, 1, %asr26
!$EV trig_pc_d(1,expr(@VA(.MAIN.halt_rstint_1_5), 16, 16)) -> intp(1, 1, 3)
	nop
	.word 0x01000000  ! 72: NOP	nop
	.word 0xe2bf6000  ! 73: STDA_I	stda	%r17, [%r29 + 0x0000] %asi
	.word 0x87802073  ! 74: WRASI_I	wr	%r0, 0x0073, %asi
	rd	%asr26, %g1
halt_rstint_1_6:
	wr	%g1, 1, %asr26
!$EV trig_pc_d(1,expr(@VA(.MAIN.halt_rstint_1_6), 16, 16)) -> intp(1, 1, 3)
	nop
	.word 0x01000000  ! 75: NOP	nop
	.word 0xe2af2000  ! 76: STBA_I	stba	%r17, [%r28 + 0x0000] %asi
	.word 0x87802073  ! 77: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0xee8e09e0  ! 78: LDUBA_R	lduba	[%r24, %r0] 0x4f, %r23
	.word 0xecbf4e60  ! 79: STDA_R	stda	%r22, [%r29 + %r0] 0x73
	.word 0xe6cf4e40  ! 80: LDSBA_R	ldsba	[%r29, %r0] 0x72, %r19
	.word 0xe8b4c400  ! 81: STHA_R	stha	%r20, [%r19 + %r0] 0x20
	.word 0x87802025  ! 82: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0xecaf4e40  ! 83: STBA_R	stba	%r22, [%r29 + %r0] 0x72
	.word 0xeaa4e000  ! 84: STWA_I	stwa	%r21, [%r19 + 0x0000] %asi
	.word 0xeaf4a000  ! 85: STXA_I	stxa	%r21, [%r18 + 0x0000] %asi
	.word 0x8780204f  ! 86: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xeef44400  ! 87: STXA_R	stxa	%r23, [%r17 + %r0] 0x20
	rd	%asr26, %g1
halt_rstint_1_7:
	wr	%g1, 1, %asr26
!$EV trig_pc_d(1,expr(@VA(.MAIN.halt_rstint_1_7), 16, 16)) -> intp(1, 1, 3)
	nop
	.word 0x01000000  ! 88: NOP	nop
	.word 0x87802020  ! 89: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xecdcc400  ! 90: LDXA_R	ldxa	[%r19, %r0] 0x20, %r22
	rd	%asr26, %g1
halt_rstint_1_8:
	wr	%g1, 1, %asr26
!$EV trig_pc_d(1,expr(@VA(.MAIN.halt_rstint_1_8), 16, 16)) -> intp(1, 1, 3)
	nop
	.word 0x01000000  ! 91: NOP	nop
	.word 0xe6dc2000  ! 92: LDXA_I	ldxa	[%r16, + 0x0000] %asi, %r19
	.word 0x87802025  ! 93: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0xe6c56000  ! 94: LDSWA_I	ldswa	[%r21, + 0x0000] %asi, %r19
	.word 0xe0a689e0  ! 95: STWA_R	stwa	%r16, [%r26 + %r0] 0x4f
	rd	%asr26, %g1
halt_rstint_1_9:
	wr	%g1, 1, %asr26
!$EV trig_pc_d(1,expr(@VA(.MAIN.halt_rstint_1_9), 16, 16)) -> intp(1, 1, 3)
	nop
	.word 0x01000000  ! 96: NOP	nop
	mov	0x40, %r18
	.word 0xeaa52000  ! 98: STWA_I	stwa	%r21, [%r20 + 0x0000] %asi
	rd	%asr26, %g1
halt_rstint_1_10:
	wr	%g1, 1, %asr26
!$EV trig_pc_d(1,expr(@VA(.MAIN.halt_rstint_1_10), 16, 16)) -> intp(1, 1, 3)
	nop
	.word 0x01000000  ! 99: NOP	nop

join_lbl_0_0:
!		$EV trig_pc_d(1,expr(@VA(.RED_EXT_SEC.HRedmode_Reset_Handler) + 4, 16, 16)) -> intp(1, 1, 1)
!		$EV trig_pc_d(1,expr(@VA(.RED_EXT_SEC.HRedmode_Reset_Handler) + 8, 16, 16)) -> intp(2, 1, 1)
!		$EV trig_pc_d(1,expr(@VA(.RED_EXT_SEC.HRedmode_Reset_Handler) + 12, 16, 16)) -> intp(3, 1, 1)
	.data
data_start:

	.xword	0x0000000000000001
	.xword	0x1853b5a2b9d8c506
	.xword	0x7869fb98637e16d4
	.xword	0x2c1bf9fae3ca4b5b
	.xword	0x0ff876f7a218f635
	.xword	0x0a9fad4ec86f8788
	.xword	0xc4a0da8ddd665ddb
	.xword	0xa559a570084077a0
	.xword	0x4729a4ba0cb48392
	.xword	0xcae194becf7850b7
	.xword	0x886b0728e4c2cb69
	.xword	0x2e247bc14de96f6e
	.xword	0x1396e26761ef3928
	.xword	0x3c96a3913f3b0c7d
	.xword	0x2f68e70a347d4970
	.xword	0xd87093f21e46ce4e



.text
diag_pass:
	ta	T_GOOD_TRAP

.data
	.xword 0x1234567887654321

#if 0
!!# /* File:	tlu_sus_res_11.j
!!#  * Description:
!!#  * This temple is targets the suspend_rstint coverage object, by interseting
!!#  * halt instructions and reset interrupt events in between the asi access
!!#  */
!!# 
!!# template main ();
!!# 
!!# 
!!# %%section c_declarations
!!# 
!!#   int i, j;
!!#   int loop_cnt = 0;
!!#   int Const_Zero = 0;
!!# 
!!#   my_imm_asi_to_rvar (int line, int rv_ro, field_type_t fld, void *data);
!!# 
!!# %%section init
!!# 
!!#   static int asi_rvar_array[6] = {Rv_20, Rv_25, Rv_4f, Rv_72_73_74, Rv_72_73_74, Rv_72_73_74};
!!# 
!!#   IJ_bind_thread_group(th_all, 0xf);
!!#   IJ_bind_thread_group(th_0, 0x1);
!!#   IJ_bind_thread_group(th_1, 0x2);
!!#   IJ_bind_thread_group(th_2, 0x4);
!!#   IJ_bind_thread_group(th_3, 0x8);
!!# 
!!#   IJ_set_default_rule_wt_rvar ( "{16}" );
!!#   IJ_set_rvar (Rv_low_wt, "{1}");
!!#   IJ_set_rvar (Rv_mid_wt, "{8}");
!!# 
!!#   IJ_set_rvar (Rv_intr_vect, "5'brrrrr");
!!# 
!!#   /* scratch pad asi = 0x20; va = 0 - 38 */
!!#   IJ_set_rvar (Rv_scratch_pad_va, "13'b0 0000 0rrr r000");
!!# 
!!#   /* queue asi = 0x25; va = 3c0 - 3f8 */
!!#   IJ_set_rvar (Rv_q_va, "13'b0 0r11 11rr r000");
!!# 
!!#   /* hyp scratch pad asi = 0x4f; va = 0 - 38 */
!!#   IJ_set_rvar (Rv_hyp_scratch_pad_va, "13'b0 0000 0rrr r000");
!!# 
!!#   IJ_set_rvar (Rv_asi, "{0x20, 0x25, 0x4f, 0x72, 0x73, 0x74}");
!!#   IJ_copy_rvar (Rv_asi_reg, Rv_asi);
!!# 
!!#   IJ_set_rvar (Rv_20, "5'b1 00rr");
!!#   IJ_set_rvar (Rv_25, "5'b1 01rr");
!!#   IJ_set_rvar (Rv_4f, "5'b1 10rr");
!!#   IJ_set_rvar (Rv_72_73_74, "5'b1 11rr");
!!# 
!!#   IJ_assign_ropr_fld (ijdefault, Ft_Imm_Asi, Rv_asi);
!!# 
!!#   IJ_set_rvar (Rv_rand64, "64'hrrrr rrrr rrrr rrrr");
!!# 
!!#   IJ_set_ropr_fld (ijdefault, Ft_Rs2, "{0}");
!!#   IJ_set_ropr_fld (ijdefault, Ft_Simm13, "13'b0 0000 0000 rr00");
!!#   IJ_set_ropr_fld (ijdefault, Ft_Rd, "{16..23}");
!!# 
!!#   IJ_install_ropr_cb (ijdefault, Ft_Rs1, my_imm_asi_to_rvar, Rv_asi, Ft_Null, (void *) asi_rvar_array);
!!# 
!!#   IJ_set_ropr_fld   ( Ro_asi, Ft_Rs1, "{0}");
!!#   IJ_assign_ropr_fld (Ro_asi, Ft_Simm13, Rv_asi_reg);
!!# 
!!#   IJ_set_ropr_fld    (Ro_reg_asi, Ft_Rs1, "{0}");
!!#   IJ_set_ropr_fld    (Ro_reg_asi, Ft_Simm13, "{0}");
!!#   IJ_install_ropr_cb (Ro_reg_asi, Ft_Rs1, my_imm_asi_to_rvar, Rv_asi_reg, Ft_Null, (void *) asi_rvar_array);
!!# 
!!#   IJ_init_regs_by_setx (th_all, 3, 1, Rv_rand64);
!!#   IJ_printf (th_all, "\tsetx\tdata_start, %%r1, %%r25\n");
!!# 
!!#   IJ_printf (th_all, "\tmov\t0x%rx, %%r16\n", Rv_scratch_pad_va);
!!#   IJ_printf (th_all, "\tmov\t0x%rx, %%r17\n", Rv_scratch_pad_va);
!!#   IJ_printf (th_all, "\tmov\t0x%rx, %%r18\n", Rv_scratch_pad_va);
!!#   IJ_printf (th_all, "\tmov\t0x%rx, %%r19\n", Rv_scratch_pad_va);
!!# 
!!#   IJ_printf (th_all, "\tmov\t0x%rx, %%r20\n", Rv_q_va);
!!#   IJ_printf (th_all, "\tmov\t0x%rx, %%r21\n", Rv_q_va);
!!#   IJ_printf (th_all, "\tmov\t0x%rx, %%r22\n", Rv_q_va);
!!#   IJ_printf (th_all, "\tmov\t0x%rx, %%r23\n", Rv_q_va);
!!# 
!!#   IJ_printf (th_all, "\tmov\t0x%rx, %%r24\n", Rv_hyp_scratch_pad_va);
!!#   IJ_printf (th_all, "\tmov\t0x%rx, %%r25\n", Rv_hyp_scratch_pad_va);
!!#   IJ_printf (th_all, "\tmov\t0x%rx, %%r26\n", Rv_hyp_scratch_pad_va);
!!#   IJ_printf (th_all, "\tmov\t0x%rx, %%r27\n", Rv_hyp_scratch_pad_va);
!!# 
!!#   IJ_printf (th_all, "\tmov\t0, %%r28\n");
!!#   IJ_printf (th_all, "\tmov\t0, %%r29\n");
!!#   IJ_printf (th_all, "\tmov\t0, %%r30\n");
!!#   IJ_printf (th_all, "\tmov\t0, %%r31\n");
!!# 
!!#   IJ_printf (th_all, "\tta\t%%icc, T_CHANGE_HPRIV\n");
!!#   IJ_printf (th_all, "\twr\t%%g0, 0x%rx, %%asi\n", Rv_asi_reg);
!!# /*
!!#   IJ_printf (th_all, "\tstxa\t%%g0, [%%g0] 0x42\n");
!!#   IJ_printf (th_all, "\tmov\t0x38, %%g1\n");
!!#   IJ_printf (th_all, "\tstxa\t%%g0, [%%g1] 0x58\n");
!!# */
!!# 
!!#   IJ_th_fork(0x2, 0x4, 0x8);
!!# 
!!#   IJ_printf (th_all, "\tsetx\tdata_start, %%r1, %%r2\n");
!!#   IJ_printf (th_0, "\tor\t%%r2, 0, %%r2\n");
!!#   IJ_printf (th_1, "\tor\t%%r2, 1, %%r2\n");
!!#   IJ_printf (th_2, "\tor\t%%r2, 2, %%r2\n");
!!#   IJ_printf (th_3, "\tor\t%%r2, 3, %%r2\n");
!!#   IJ_printf (th_all, "\tmov\t0x55, %%r20\n");
!!#   IJ_printf (th_all, "\tldub\t[%%r2], %%r22\n");
!!#   IJ_printf (th_all, "\tcmp\t%%r20, %%r22\n");
!!#   IJ_printf (th_all, "\tbe\tdiag_pass\n");
!!#   IJ_printf (th_all, "\tstb\t%%r20, [%%r2]\n");
!!# 
!!#   return 0;
!!# 	
!!# %%section finish
!!# 
!!#   IJ_th_join(0xf);
!!#   IJ_th_start (Seq_Start, NULL, 1);
!!# 
!!#   IJ_printf (th_all, "\t.data\ndata_start:\n\n");
!!# 		IJ_printf  (th_all,"\t.xword\t0x%016llrx\n", Const_Zero);
!!#   for (i = 1; i < 16; i++) {
!!# 		IJ_printf  (th_all,"\t.xword\t0x%016llrx\n", Rv_rand64);
!!#   }
!!# 
!!# %%section diag_ini
!!# 
!!# #define PCONTEXT	0x10
!!# #define SCONTEXT	0x10
!!# 
!!# #define MAIN_PAGE_NUCLEUS_ALSO
!!# #define MAIN_PAGE_HV_ALSO
!!# 
!!# #define ALL_MY_INTR_HANDLERS
!!# #include "my_intr_handlers.s"
!!# 
!!# #include "enable_traps.h"
!!# #include "boot.s"
!!# 
!!# .text
!!# .global main
!!# 
!!# main:
!!# 
!!# 	ta 	%icc, T_CHANGE_HPRIV
!!# 	mov	0x123, %g1
!!# 	wr	%g0, 0x20, %asi
!!# 	stxa	%g1, [0x00] %asi
!!# 	stxa	%g1, [0x08] %asi
!!# 	stxa	%g1, [0x10] %asi
!!# 	stxa	%g1, [0x18] %asi
!!# 	stxa	%g1, [0x20] %asi
!!# 	stxa	%g1, [0x28] %asi
!!# 	stxa	%g1, [0x30] %asi
!!# 	stxa	%g1, [0x38] %asi
!!# 	ta 	%icc, T_CHANGE_NONHPRIV
!!# 
!!# %%section diag_fini
!!# 
!!# .text
!!# diag_pass:
!!# 	ta	T_GOOD_TRAP
!!# 
!!# .data
!!# 	.xword 0x1234567887654321
!!# 
!!# %%section grammar
!!# 
!!# inst_block: inst_type
!!# 	    | inst_block inst_type
!!# 	{
!!# 		IJ_generate (th_all, $2);
!!# 	}
!!# ;
!!# 
!!# 
!!# inst_type: load_imm_asi
!!# 	| load_reg_asi  %ropr Ro_reg_asi
!!# 	| store_imm_asi
!!# 	| store_reg_asi %ropr Ro_reg_asi
!!# 	| change_priv_tl %rvar low_wt
!!# 	| set_20_va     %rvar mid_wt
!!# 	| set_25_va	%rvar mid_wt
!!# 	| set_4f_va	%rvar mid_wt
!!# 	| wrasi		// rvar mid_wt
!!# 	| halt_rstint
!!# ;
!!# 
!!# wrasi: tWRASI_I %ropr Ro_asi
!!# ;
!!# 
!!# change_priv_tl: tCHANGE_NONPRIV | tCHANGE_PRIV | tCHANGE_NONHPRIV 
!!# 	| tCHANGE_HPRIV // | tCHANGE_TO_TL0 | tCHANGE_TO_TL1
!!# ;
!!# 
!!# set_20_va: mSET_20_VA
!!# 	{
!!# 		IJ_printf (th_all, "\tmov\t0x%rx, %%r%rd\n",
!!# 			Rv_scratch_pad_va,Rv_20);
!!#         }
!!# ;
!!# 
!!# set_25_va: mSET_25_VA
!!# 	{
!!# 		IJ_printf (th_all, "\tmov\t0x%rx, %%r%rd\n",
!!# 			 Rv_q_va,Rv_25);
!!#         }
!!# ;
!!# 
!!# set_4f_va: mSET_4f_VA
!!# 	{
!!# 		IJ_printf (th_all, "\tmov\t0x%rx, %%r%rd\n",
!!# 			 Rv_hyp_scratch_pad_va,Rv_4f);
!!#         }
!!# ;
!!# 
!!# load_imm_asi:  tLDSBA_R | tLDSHA_R | tLDSWA_R | tLDUBA_R
!!# 	| tLDUHA_R | tLDUWA_R | tLDXA_R | tLDDA_R
!!# ;
!!# 
!!# load_reg_asi:  tLDSBA_I | tLDSHA_I | tLDSWA_I | tLDUBA_I 
!!# 	| tLDUHA_I | tLDUWA_I | tLDXA_I | tLDDA_I
!!# ;
!!# 
!!# store_imm_asi: tSTBA_R | tSTHA_R | tSTWA_R | tSTXA_R | tSTDA_R
!!# ;
!!# 
!!# store_reg_asi: tSTBA_I | tSTHA_I | tSTWA_I | tSTXA_I | tSTDA_I 
!!# ;
!!# 
!!# halt_rstint: tNOP
!!# 	{
!!#           IJ_printf (th_all, "\trd\t%%asr26, %%g1\n");
!!#           IJ_printf (th_all, "halt_rstint_%y_%d:\n", loop_cnt);
!!#           IJ_printf (th_all, "\twr\t%%g1, 1, %%asr26\n");
!!# 	  IJ_printf (th_all, "!$EV trig_pc_d(%y,expr(@VA(.MAIN.halt_rstint_%y_%d), 16, 16)) -> intp(%y, 1, 3)\n", loop_cnt);
!!#           IJ_printf (th_all, "\tnop\n");
!!#           loop_cnt++;
!!# 	} ;
!!# 
!!# %%
!!# 
!!# %%section cbfunc
!!# 
!!# my_imm_asi_to_rvar (int line, int rv_ro, field_type_t fld, void *data)
!!# {
!!#   int asi;
!!#   int r;
!!#   int *d = (int *) data;
!!# 
!!#   if (fld == Ft_Null)
!!#       asi = IJ_get_rvar_val32(rv_ro);
!!#   else
!!#     asi = IJ_get_ropr_fld_val (rv_ro, fld);
!!# 
!!#   switch (asi) {
!!#     case 0x20:
!!#       IJ_update_rvar (d[0]);
!!#       return (IJ_get_rvar_val32(d[0]));
!!#     case 0x25:
!!#       IJ_update_rvar (d[1]);
!!#       return (IJ_get_rvar_val32(d[1]));
!!#     case 0x4f:
!!#       IJ_update_rvar (d[2]);
!!#       return (IJ_get_rvar_val32(d[2]));
!!#     case 0x72:
!!#       IJ_update_rvar (d[3]);
!!#       return (IJ_get_rvar_val32(d[3]));
!!#     case 0x73:
!!#       IJ_update_rvar (d[4]);
!!#       return (IJ_get_rvar_val32(d[4]));
!!#     case 0x74:
!!#       IJ_update_rvar (d[5]);
!!#       return (IJ_get_rvar_val32(d[5]));
!!#   }
!!# }
!!# %%
!!# 
!!# endtemplate
#endif
