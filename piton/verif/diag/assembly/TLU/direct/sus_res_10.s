// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: sus_res_10.s
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
   random seed:	20904541
   Jal tlu_sus_res_1.j:	
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

	setx 0xdc8eb5cd6e43c31d, %g1, %g0
	setx 0x755fb3505de82d26, %g1, %g1
	setx 0x7410970c04f64c86, %g1, %g2
	setx 0x17216c4495a7293e, %g1, %g3
	setx 0x9117f48cebac3e1f, %g1, %g4
	setx 0xd918a1bb5e8bf00f, %g1, %g5
	setx 0x6cbc452215a0a767, %g1, %g6
	setx 0x7cc9d14817a31029, %g1, %g7
	setx 0x7f82d2e8365319cd, %g1, %r16
	setx 0xca634cabe433b6ad, %g1, %r17
	setx 0x79162f643ae70d17, %g1, %r18
	setx 0x826328982029c1ce, %g1, %r19
	setx 0x4db8a43f6660a227, %g1, %r20
	setx 0xa3492e7a196b8595, %g1, %r21
	setx 0xff3b03fec3973af1, %g1, %r22
	setx 0x1abdf63175942e87, %g1, %r23
	setx 0xe74a8af2e8d0d6ec, %g1, %r24
	setx 0xf004e1358002e2a8, %g1, %r25
	setx 0x66b95b7999beca11, %g1, %r26
	setx 0xab5812d4d67d8e5b, %g1, %r27
	setx 0xa6d826a5f7d455cc, %g1, %r28
	setx 0x281ce7a59f220e10, %g1, %r29
	setx 0x471b13e0f5c04e9a, %g1, %r30
	setx 0x3182fe5912c8a57f, %g1, %r31
	save
	setx 0x8a670c235b61579c, %g1, %r16
	setx 0xf2136868909e4550, %g1, %r17
	setx 0xaba18a6617969f6a, %g1, %r18
	setx 0x8657a453832ab53d, %g1, %r19
	setx 0xa4e7287e3515db08, %g1, %r20
	setx 0xa5b00774734947c0, %g1, %r21
	setx 0x7000ea4d75d2158d, %g1, %r22
	setx 0x6baa764a2fba361d, %g1, %r23
	setx 0x80b4741e50da1478, %g1, %r24
	setx 0x51644289a28b73de, %g1, %r25
	setx 0x9b80154308bbe6b6, %g1, %r26
	setx 0x3a6d1397e3ea1a56, %g1, %r27
	setx 0x76433bc72361597c, %g1, %r28
	setx 0x264be80f6cbbfe58, %g1, %r29
	setx 0x5c5fe735b50b2e61, %g1, %r30
	setx 0xa0c6633d6208b9c7, %g1, %r31
	save
	setx 0x846eae16a29e2f0e, %g1, %r16
	setx 0x56da6feb1458736a, %g1, %r17
	setx 0x4e5b9ae8a8a6f7e8, %g1, %r18
	setx 0x93d677bd949f9f63, %g1, %r19
	setx 0x3c956920a1de606d, %g1, %r20
	setx 0x104f7d63b9528a3a, %g1, %r21
	setx 0xbcdbca516254a13e, %g1, %r22
	setx 0xe5f35085487f9391, %g1, %r23
	setx 0xf4fdf00e47eaf3d6, %g1, %r24
	setx 0xad9a9c8717f0e0c6, %g1, %r25
	setx 0x2636495de5d379b0, %g1, %r26
	setx 0xf088671743221e24, %g1, %r27
	setx 0xc91835957cbd515a, %g1, %r28
	setx 0x19b7a1df98e03096, %g1, %r29
	setx 0x8e0e6a8ed173607c, %g1, %r30
	setx 0x03c86e3d045bb866, %g1, %r31
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
	wr	%g0, 0x25, %asi
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
	.word 0xe4d5e000  ! 2: LDSHA_I	ldsha	[%r23, + 0x0000] %asi, %r18
	mov	0x28, %r27
	.word 0x8780204f  ! 4: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xeeb6c9e0  ! 5: STHA_R	stha	%r23, [%r27 + %r0] 0x4f
	.word 0xeadf8e60  ! 6: LDXA_R	ldxa	[%r30, %r0] 0x73, %r21
	.word 0x87802072  ! 7: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0xe6a44400  ! 8: STWA_R	stwa	%r19, [%r17 + %r0] 0x20
	.word 0xe4b7ce40  ! 9: STHA_R	stha	%r18, [%r31 + %r0] 0x72
	rd	%asr26, %g1
halt_resume_0_0:
	wr	%g1, 1, %asr26
!$EV trig_pc_d(0,expr(@VA(.MAIN.halt_resume_0_0), 16, 16)) -> intp(0, 3, 4)
	nop
	.word 0x01000000  ! 10: NOP	nop
	.word 0xeaac4400  ! 11: STBA_R	stba	%r21, [%r17 + %r0] 0x20
	.word 0xe28544a0  ! 12: LDUWA_R	lduwa	[%r21, %r0] 0x25, %r17
	rd	%asr26, %g1
halt_resume_0_1:
	wr	%g1, 1, %asr26
!$EV trig_pc_d(0,expr(@VA(.MAIN.halt_resume_0_1), 16, 16)) -> intp(0, 3, 4)
	nop
	.word 0x01000000  ! 13: NOP	nop
	rd	%asr26, %g1
halt_resume_0_2:
	wr	%g1, 1, %asr26
!$EV trig_pc_d(0,expr(@VA(.MAIN.halt_resume_0_2), 16, 16)) -> intp(0, 3, 4)
	nop
	.word 0x01000000  ! 14: NOP	nop
	.word 0x87802073  ! 15: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0xe2f7a000  ! 16: STXA_I	stxa	%r17, [%r30 + 0x0000] %asi
	.word 0xe2bec9e0  ! 17: STDA_R	stda	%r17, [%r27 + %r0] 0x4f
	.word 0x87802025  ! 18: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0xec8504a0  ! 19: LDUWA_R	lduwa	[%r20, %r0] 0x25, %r22
	.word 0x87802025  ! 20: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0xecf5a000  ! 21: STXA_I	stxa	%r22, [%r22 + 0x0000] %asi
	.word 0x87802072  ! 22: WRASI_I	wr	%r0, 0x0072, %asi
	rd	%asr26, %g1
halt_resume_0_3:
	wr	%g1, 1, %asr26
!$EV trig_pc_d(0,expr(@VA(.MAIN.halt_resume_0_3), 16, 16)) -> intp(0, 3, 4)
	nop
	.word 0x01000000  ! 23: NOP	nop
	.word 0xe68f8e60  ! 24: LDUBA_R	lduba	[%r30, %r0] 0x73, %r19
	.word 0x87802074  ! 25: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0xe687a000  ! 26: LDUWA_I	lduwa	[%r30, + 0x0000] %asi, %r19
	.word 0x87802072  ! 27: WRASI_I	wr	%r0, 0x0072, %asi
	rd	%asr26, %g1
halt_resume_0_4:
	wr	%g1, 1, %asr26
!$EV trig_pc_d(0,expr(@VA(.MAIN.halt_resume_0_4), 16, 16)) -> intp(0, 3, 4)
	nop
	.word 0x01000000  ! 28: NOP	nop
	.word 0xe6a7a000  ! 29: STWA_I	stwa	%r19, [%r30 + 0x0000] %asi
	.word 0xe0bcc400  ! 30: STDA_R	stda	%r16, [%r19 + %r0] 0x20
	.word 0xec8f0e80  ! 31: LDUBA_R	lduba	[%r28, %r0] 0x74, %r22
	rd	%asr26, %g1
halt_resume_0_5:
	wr	%g1, 1, %asr26
!$EV trig_pc_d(0,expr(@VA(.MAIN.halt_resume_0_5), 16, 16)) -> intp(0, 3, 4)
	nop
	.word 0x01000000  ! 32: NOP	nop
	.word 0xe8dd44a0  ! 33: LDXA_R	ldxa	[%r21, %r0] 0x25, %r20
	rd	%asr26, %g1
halt_resume_0_6:
	wr	%g1, 1, %asr26
!$EV trig_pc_d(0,expr(@VA(.MAIN.halt_resume_0_6), 16, 16)) -> intp(0, 3, 4)
	nop
	.word 0x01000000  ! 34: NOP	nop
	.word 0xe6f7ce40  ! 35: STXA_R	stxa	%r19, [%r31 + %r0] 0x72
	.word 0xe2a6c9e0  ! 36: STWA_R	stwa	%r17, [%r27 + %r0] 0x4f
	.word 0xe287a000  ! 37: LDUWA_I	lduwa	[%r30, + 0x0000] %asi, %r17
	.word 0xe2c7a000  ! 38: LDSWA_I	ldswa	[%r30, + 0x0000] %asi, %r17
	.word 0xe2dfe000  ! 39: LDXA_I	ldxa	[%r31, + 0x0000] %asi, %r17
	.word 0xe4c74e40  ! 40: LDSWA_R	ldswa	[%r29, %r0] 0x72, %r18
	.word 0xe0840400  ! 41: LDUWA_R	lduwa	[%r16, %r0] 0x20, %r16
	.word 0xec9f4e80  ! 42: LDDA_R	ldda	[%r29, %r0] 0x74, %r22
	.word 0x87802025  ! 43: WRASI_I	wr	%r0, 0x0025, %asi
	rd	%asr26, %g1
halt_resume_0_7:
	wr	%g1, 1, %asr26
!$EV trig_pc_d(0,expr(@VA(.MAIN.halt_resume_0_7), 16, 16)) -> intp(0, 3, 4)
	nop
	.word 0x01000000  ! 44: NOP	nop
	rd	%asr26, %g1
halt_resume_0_8:
	wr	%g1, 1, %asr26
!$EV trig_pc_d(0,expr(@VA(.MAIN.halt_resume_0_8), 16, 16)) -> intp(0, 3, 4)
	nop
	.word 0x01000000  ! 45: NOP	nop
	.word 0xecb52000  ! 46: STHA_I	stha	%r22, [%r20 + 0x0000] %asi
	.word 0x87802073  ! 47: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0xeed78e40  ! 48: LDSHA_R	ldsha	[%r30, %r0] 0x72, %r23
	.word 0xeebf2000  ! 49: STDA_I	stda	%r23, [%r28 + 0x0000] %asi
	.word 0xeed7a000  ! 50: LDSHA_I	ldsha	[%r30, + 0x0000] %asi, %r23
	.word 0xe2cf8e60  ! 51: LDSBA_R	ldsba	[%r30, %r0] 0x73, %r17
	.word 0xe2c7a000  ! 52: LDSWA_I	ldswa	[%r30, + 0x0000] %asi, %r17
	.word 0xe2c72000  ! 53: LDSWA_I	ldswa	[%r28, + 0x0000] %asi, %r17
	.word 0xe2d7e000  ! 54: LDSHA_I	ldsha	[%r31, + 0x0000] %asi, %r17
	rd	%asr26, %g1
halt_resume_0_9:
	wr	%g1, 1, %asr26
!$EV trig_pc_d(0,expr(@VA(.MAIN.halt_resume_0_9), 16, 16)) -> intp(0, 3, 4)
	nop
	.word 0x01000000  ! 55: NOP	nop
	.word 0xe2f7e000  ! 56: STXA_I	stxa	%r17, [%r31 + 0x0000] %asi
	.word 0xe2bf2000  ! 57: STDA_I	stda	%r17, [%r28 + 0x0000] %asi
	.word 0xeebe09e0  ! 58: STDA_R	stda	%r23, [%r24 + %r0] 0x4f
	.word 0x87802025  ! 59: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0xeed56000  ! 60: LDSHA_I	ldsha	[%r21, + 0x0000] %asi, %r23
	.word 0x87802020  ! 61: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xee8ca000  ! 62: LDUBA_I	lduba	[%r18, + 0x0000] %asi, %r23
	.word 0x87802020  ! 63: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xecadc4a0  ! 64: STBA_R	stba	%r22, [%r23 + %r0] 0x25
	.word 0xecf46000  ! 65: STXA_I	stxa	%r22, [%r17 + 0x0000] %asi
	.word 0xe2cd04a0  ! 66: LDSBA_R	ldsba	[%r20, %r0] 0x25, %r17
	.word 0x8780204f  ! 67: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xe8844400  ! 68: LDUWA_R	lduwa	[%r17, %r0] 0x20, %r20
	.word 0xe8a62000  ! 69: STWA_I	stwa	%r20, [%r24 + 0x0000] %asi
	.word 0xeacf8e60  ! 70: LDSBA_R	ldsba	[%r30, %r0] 0x73, %r21
	.word 0x8780204f  ! 71: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xeaaea000  ! 72: STBA_I	stba	%r21, [%r26 + 0x0000] %asi
	.word 0xe09584a0  ! 73: LDUHA_R	lduha	[%r22, %r0] 0x25, %r16
	mov	0x7f0, %r20
	.word 0xe09ea000  ! 75: LDDA_I	ldda	[%r26, + 0x0000] %asi, %r16
	.word 0xe09e6000  ! 76: LDDA_I	ldda	[%r25, + 0x0000] %asi, %r16
	.word 0xe6d48400  ! 77: LDSHA_R	ldsha	[%r18, %r0] 0x20, %r19
	.word 0xe6be2000  ! 78: STDA_I	stda	%r19, [%r24 + 0x0000] %asi
	.word 0xeaa44400  ! 79: STWA_R	stwa	%r21, [%r17 + %r0] 0x20
	rd	%asr26, %g1
halt_resume_0_10:
	wr	%g1, 1, %asr26
!$EV trig_pc_d(0,expr(@VA(.MAIN.halt_resume_0_10), 16, 16)) -> intp(0, 3, 4)
	nop
	.word 0x01000000  ! 80: NOP	nop
	.word 0xeace2000  ! 81: LDSBA_I	ldsba	[%r24, + 0x0000] %asi, %r21
	.word 0xeca74e40  ! 82: STWA_R	stwa	%r22, [%r29 + %r0] 0x72
	rd	%asr26, %g1
halt_resume_0_11:
	wr	%g1, 1, %asr26
!$EV trig_pc_d(0,expr(@VA(.MAIN.halt_resume_0_11), 16, 16)) -> intp(0, 3, 4)
	nop
	.word 0x01000000  ! 83: NOP	nop
	.word 0xecc66000  ! 84: LDSWA_I	ldswa	[%r25, + 0x0000] %asi, %r22
	.word 0x87802072  ! 85: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0xecf7e000  ! 86: STXA_I	stxa	%r22, [%r31 + 0x0000] %asi
	.word 0xec9fe000  ! 87: LDDA_I	ldda	[%r31, + 0x0000] %asi, %r22
	.word 0xe2bf4e80  ! 88: STDA_R	stda	%r17, [%r29 + %r0] 0x74
	.word 0xe2c7e000  ! 89: LDSWA_I	ldswa	[%r31, + 0x0000] %asi, %r17
	.word 0xeeddc4a0  ! 90: LDXA_R	ldxa	[%r23, %r0] 0x25, %r23
	.word 0xee8fe000  ! 91: LDUBA_I	lduba	[%r31, + 0x0000] %asi, %r23
	.word 0xee8fe000  ! 92: LDUBA_I	lduba	[%r31, + 0x0000] %asi, %r23
	.word 0xee8f6000  ! 93: LDUBA_I	lduba	[%r29, + 0x0000] %asi, %r23
	rd	%asr26, %g1
halt_resume_0_12:
	wr	%g1, 1, %asr26
!$EV trig_pc_d(0,expr(@VA(.MAIN.halt_resume_0_12), 16, 16)) -> intp(0, 3, 4)
	nop
	.word 0x01000000  ! 94: NOP	nop
	.word 0x87802072  ! 95: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0xe6bfce60  ! 96: STDA_R	stda	%r19, [%r31 + %r0] 0x73
	rd	%asr26, %g1
halt_resume_0_13:
	wr	%g1, 1, %asr26
!$EV trig_pc_d(0,expr(@VA(.MAIN.halt_resume_0_13), 16, 16)) -> intp(0, 3, 4)
	nop
	.word 0x01000000  ! 97: NOP	nop
	.word 0xe6af6000  ! 98: STBA_I	stba	%r19, [%r29 + 0x0000] %asi
	.word 0x87802074  ! 99: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0xe487ce60  ! 100: LDUWA_R	lduwa	[%r31, %r0] 0x73, %r18
	.word 0xeccfce40  ! 101: LDSBA_R	ldsba	[%r31, %r0] 0x72, %r22
	.word 0xecaf6000  ! 102: STBA_I	stba	%r22, [%r29 + 0x0000] %asi
	.word 0xecb72000  ! 103: STHA_I	stha	%r22, [%r28 + 0x0000] %asi
	.word 0xeca72000  ! 104: STWA_I	stwa	%r22, [%r28 + 0x0000] %asi
	.word 0xecdf6000  ! 105: LDXA_I	ldxa	[%r29, + 0x0000] %asi, %r22
	.word 0xe0af4e40  ! 106: STBA_R	stba	%r16, [%r29 + %r0] 0x72
	.word 0xe2c4c400  ! 107: LDSWA_R	ldswa	[%r19, %r0] 0x20, %r17
	mov	0x7e0, %r20
	.word 0xe28f6000  ! 109: LDUBA_I	lduba	[%r29, + 0x0000] %asi, %r17
	.word 0xe8b40400  ! 110: STHA_R	stha	%r20, [%r16 + %r0] 0x20
	.word 0x87802020  ! 111: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xeac48400  ! 112: LDSWA_R	ldswa	[%r18, %r0] 0x20, %r21
	rd	%asr26, %g1
halt_resume_0_14:
	wr	%g1, 1, %asr26
!$EV trig_pc_d(0,expr(@VA(.MAIN.halt_resume_0_14), 16, 16)) -> intp(0, 3, 4)
	nop
	.word 0x01000000  ! 113: NOP	nop
	.word 0xeaac0400  ! 114: STBA_R	stba	%r21, [%r16 + %r0] 0x20
	.word 0xe0be09e0  ! 115: STDA_R	stda	%r16, [%r24 + %r0] 0x4f
	rd	%asr26, %g1
halt_resume_0_15:
	wr	%g1, 1, %asr26
!$EV trig_pc_d(0,expr(@VA(.MAIN.halt_resume_0_15), 16, 16)) -> intp(0, 3, 4)
	nop
	.word 0x01000000  ! 116: NOP	nop
	rd	%asr26, %g1
halt_resume_0_16:
	wr	%g1, 1, %asr26
!$EV trig_pc_d(0,expr(@VA(.MAIN.halt_resume_0_16), 16, 16)) -> intp(0, 3, 4)
	nop
	.word 0x01000000  ! 117: NOP	nop
	.word 0xe0bc6000  ! 118: STDA_I	stda	%r16, [%r17 + 0x0000] %asi
	.word 0x87802073  ! 119: WRASI_I	wr	%r0, 0x0073, %asi
	rd	%asr26, %g1
halt_resume_0_17:
	wr	%g1, 1, %asr26
!$EV trig_pc_d(0,expr(@VA(.MAIN.halt_resume_0_17), 16, 16)) -> intp(0, 3, 4)
	nop
	.word 0x01000000  ! 120: NOP	nop
	rd	%asr26, %g1
halt_resume_0_18:
	wr	%g1, 1, %asr26
!$EV trig_pc_d(0,expr(@VA(.MAIN.halt_resume_0_18), 16, 16)) -> intp(0, 3, 4)
	nop
	.word 0x01000000  ! 121: NOP	nop
	.word 0xe8b7ce80  ! 122: STHA_R	stha	%r20, [%r31 + %r0] 0x74
	.word 0xe69fce80  ! 123: LDDA_R	ldda	[%r31, %r0] 0x74, %r19
	.word 0xe6876000  ! 124: LDUWA_I	lduwa	[%r29, + 0x0000] %asi, %r19
	.word 0xe6a72000  ! 125: STWA_I	stwa	%r19, [%r28 + 0x0000] %asi
	.word 0xe0b70e40  ! 126: STHA_R	stha	%r16, [%r28 + %r0] 0x72
	.word 0xeaad04a0  ! 127: STBA_R	stba	%r21, [%r20 + %r0] 0x25
	rd	%asr26, %g1
halt_resume_0_19:
	wr	%g1, 1, %asr26
!$EV trig_pc_d(0,expr(@VA(.MAIN.halt_resume_0_19), 16, 16)) -> intp(0, 3, 4)
	nop
	.word 0x01000000  ! 128: NOP	nop
	.word 0xe8acc400  ! 129: STBA_R	stba	%r20, [%r19 + %r0] 0x20
	rd	%asr26, %g1
halt_resume_0_20:
	wr	%g1, 1, %asr26
!$EV trig_pc_d(0,expr(@VA(.MAIN.halt_resume_0_20), 16, 16)) -> intp(0, 3, 4)
	nop
	.word 0x01000000  ! 130: NOP	nop
	.word 0xe8b76000  ! 131: STHA_I	stha	%r20, [%r29 + 0x0000] %asi
	.word 0x87802074  ! 132: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0xe8df2000  ! 133: LDXA_I	ldxa	[%r28, + 0x0000] %asi, %r20
	.word 0xeaa70e60  ! 134: STWA_R	stwa	%r21, [%r28 + %r0] 0x73
	.word 0xea8fa000  ! 135: LDUBA_I	lduba	[%r30, + 0x0000] %asi, %r21
	.word 0xe8b609e0  ! 136: STHA_R	stha	%r20, [%r24 + %r0] 0x4f
	.word 0xeeafce40  ! 137: STBA_R	stba	%r23, [%r31 + %r0] 0x72
	.word 0xeebf2000  ! 138: STDA_I	stda	%r23, [%r28 + 0x0000] %asi
	.word 0xe6940400  ! 139: LDUHA_R	lduha	[%r16, %r0] 0x20, %r19
	mov	0x28, %r26
	mov	0x50, %r27
	.word 0xee9f4e80  ! 142: LDDA_R	ldda	[%r29, %r0] 0x74, %r23
	rd	%asr26, %g1
halt_resume_0_21:
	wr	%g1, 1, %asr26
!$EV trig_pc_d(0,expr(@VA(.MAIN.halt_resume_0_21), 16, 16)) -> intp(0, 3, 4)
	nop
	.word 0x01000000  ! 143: NOP	nop
	.word 0xeea7ce80  ! 144: STWA_R	stwa	%r23, [%r31 + %r0] 0x74
	mov	0x40, %r17
	.word 0xeecf2000  ! 146: LDSBA_I	ldsba	[%r28, + 0x0000] %asi, %r23
	.word 0xe0d5c4a0  ! 147: LDSHA_R	ldsha	[%r23, %r0] 0x25, %r16
	mov	0x18, %r27
	.word 0xeacdc4a0  ! 149: LDSBA_R	ldsba	[%r23, %r0] 0x25, %r21
	.word 0xead7a000  ! 150: LDSHA_I	ldsha	[%r30, + 0x0000] %asi, %r21
	.word 0xe2f74e60  ! 151: STXA_R	stxa	%r17, [%r29 + %r0] 0x73
	.word 0xe0d609e0  ! 152: LDSHA_R	ldsha	[%r24, %r0] 0x4f, %r16
	.word 0xe09f6000  ! 153: LDDA_I	ldda	[%r29, + 0x0000] %asi, %r16
	.word 0x87802074  ! 154: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0xe68e89e0  ! 155: LDUBA_R	lduba	[%r26, %r0] 0x4f, %r19
	.word 0xe6cf6000  ! 156: LDSBA_I	ldsba	[%r29, + 0x0000] %asi, %r19
	.word 0xe0ce49e0  ! 157: LDSBA_R	ldsba	[%r25, %r0] 0x4f, %r16
	.word 0xe0cf6000  ! 158: LDSBA_I	ldsba	[%r29, + 0x0000] %asi, %r16
	.word 0x87802073  ! 159: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0xe8af0e80  ! 160: STBA_R	stba	%r20, [%r28 + %r0] 0x74
	.word 0xe8bf6000  ! 161: STDA_I	stda	%r20, [%r29 + 0x0000] %asi
	mov	0x40, %r24
	.word 0xeccec9e0  ! 163: LDSBA_R	ldsba	[%r27, %r0] 0x4f, %r22
	.word 0xe4f40400  ! 164: STXA_R	stxa	%r18, [%r16 + %r0] 0x20
	mov	0x30, %r17
	.word 0xeaf584a0  ! 166: STXA_R	stxa	%r21, [%r22 + %r0] 0x25
	.word 0xea8f6000  ! 167: LDUBA_I	lduba	[%r29, + 0x0000] %asi, %r21
	.word 0x87802073  ! 168: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0xe68f0e80  ! 169: LDUBA_R	lduba	[%r28, %r0] 0x74, %r19
	mov	0x50, %r27
	rd	%asr26, %g1
halt_resume_0_22:
	wr	%g1, 1, %asr26
!$EV trig_pc_d(0,expr(@VA(.MAIN.halt_resume_0_22), 16, 16)) -> intp(0, 3, 4)
	nop
	.word 0x01000000  ! 171: NOP	nop
	.word 0xe48f8e60  ! 172: LDUBA_R	lduba	[%r30, %r0] 0x73, %r18
	.word 0xe4972000  ! 173: LDUHA_I	lduha	[%r28, + 0x0000] %asi, %r18
	.word 0xe48fe000  ! 174: LDUBA_I	lduba	[%r31, + 0x0000] %asi, %r18
	.word 0xe6a70e80  ! 175: STWA_R	stwa	%r19, [%r28 + %r0] 0x74
	.word 0xe0cd84a0  ! 176: LDSBA_R	ldsba	[%r22, %r0] 0x25, %r16
	.word 0xe2b6c9e0  ! 177: STHA_R	stha	%r17, [%r27 + %r0] 0x4f
	.word 0xe6940400  ! 178: LDUHA_R	lduha	[%r16, %r0] 0x20, %r19
	.word 0xe6b72000  ! 179: STHA_I	stha	%r19, [%r28 + 0x0000] %asi
	.word 0xe6afa000  ! 180: STBA_I	stba	%r19, [%r30 + 0x0000] %asi
	.word 0xe6df2000  ! 181: LDXA_I	ldxa	[%r28, + 0x0000] %asi, %r19
	.word 0xe6df2000  ! 182: LDXA_I	ldxa	[%r28, + 0x0000] %asi, %r19
	.word 0xeed4c400  ! 183: LDSHA_R	ldsha	[%r19, %r0] 0x20, %r23
	.word 0x87802020  ! 184: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xeedc2000  ! 185: LDXA_I	ldxa	[%r16, + 0x0000] %asi, %r23
	.word 0xeaf40400  ! 186: STXA_R	stxa	%r21, [%r16 + %r0] 0x20
	.word 0xea8c2000  ! 187: LDUBA_I	lduba	[%r16, + 0x0000] %asi, %r21
	rd	%asr26, %g1
halt_resume_0_23:
	wr	%g1, 1, %asr26
!$EV trig_pc_d(0,expr(@VA(.MAIN.halt_resume_0_23), 16, 16)) -> intp(0, 3, 4)
	nop
	.word 0x01000000  ! 188: NOP	nop
	rd	%asr26, %g1
halt_resume_0_24:
	wr	%g1, 1, %asr26
!$EV trig_pc_d(0,expr(@VA(.MAIN.halt_resume_0_24), 16, 16)) -> intp(0, 3, 4)
	nop
	.word 0x01000000  ! 189: NOP	nop
	mov	0x7d0, %r22
	.word 0xe2bc4400  ! 191: STDA_R	stda	%r17, [%r17 + %r0] 0x20
	.word 0xe28c6000  ! 192: LDUBA_I	lduba	[%r17, + 0x0000] %asi, %r17
	.word 0x87802073  ! 193: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0xe4970e80  ! 194: LDUHA_R	lduha	[%r28, %r0] 0x74, %r18
	.word 0xe4b7e000  ! 195: STHA_I	stha	%r18, [%r31 + 0x0000] %asi
	.word 0xe89f8e40  ! 196: LDDA_R	ldda	[%r30, %r0] 0x72, %r20
	.word 0xe0a6c9e0  ! 197: STWA_R	stwa	%r16, [%r27 + %r0] 0x4f
	.word 0xeebcc400  ! 198: STDA_R	stda	%r23, [%r19 + %r0] 0x20
	.word 0x87802020  ! 199: WRASI_I	wr	%r0, 0x0020, %asi
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_3:
	.word 0xe4d52000  ! 2: LDSHA_I	ldsha	[%r20, + 0x0000] %asi, %r18
	mov	0x28, %r25
	.word 0x87802025  ! 4: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0xe6b544a0  ! 5: STHA_R	stha	%r19, [%r21 + %r0] 0x25
	.word 0xeedf8e80  ! 6: LDXA_R	ldxa	[%r30, %r0] 0x74, %r23
	.word 0x87802072  ! 7: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0xe2a544a0  ! 8: STWA_R	stwa	%r17, [%r21 + %r0] 0x25
	.word 0xe8b70e40  ! 9: STHA_R	stha	%r20, [%r28 + %r0] 0x72
	rd	%asr26, %g1
halt_resume_3_0:
	wr	%g1, 1, %asr26
!$EV trig_pc_d(3,expr(@VA(.MAIN.halt_resume_3_0), 16, 16)) -> intp(3, 3, 4)
	nop
	.word 0x01000000  ! 10: NOP	nop
	.word 0xeeaf4e40  ! 11: STBA_R	stba	%r23, [%r29 + %r0] 0x72
	.word 0xec874e40  ! 12: LDUWA_R	lduwa	[%r29, %r0] 0x72, %r22
	rd	%asr26, %g1
halt_resume_3_1:
	wr	%g1, 1, %asr26
!$EV trig_pc_d(3,expr(@VA(.MAIN.halt_resume_3_1), 16, 16)) -> intp(3, 3, 4)
	nop
	.word 0x01000000  ! 13: NOP	nop
	rd	%asr26, %g1
halt_resume_3_2:
	wr	%g1, 1, %asr26
!$EV trig_pc_d(3,expr(@VA(.MAIN.halt_resume_3_2), 16, 16)) -> intp(3, 3, 4)
	nop
	.word 0x01000000  ! 14: NOP	nop
	.word 0x87802025  ! 15: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0xe2f72000  ! 16: STXA_I	stxa	%r17, [%r28 + 0x0000] %asi
	.word 0xe6bdc4a0  ! 17: STDA_R	stda	%r19, [%r23 + %r0] 0x25
	.word 0x87802020  ! 18: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xea87ce60  ! 19: LDUWA_R	lduwa	[%r31, %r0] 0x73, %r21
	.word 0x87802072  ! 20: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0xecf5a000  ! 21: STXA_I	stxa	%r22, [%r22 + 0x0000] %asi
	.word 0x87802020  ! 22: WRASI_I	wr	%r0, 0x0020, %asi
	rd	%asr26, %g1
halt_resume_3_3:
	wr	%g1, 1, %asr26
!$EV trig_pc_d(3,expr(@VA(.MAIN.halt_resume_3_3), 16, 16)) -> intp(3, 3, 4)
	nop
	.word 0x01000000  ! 23: NOP	nop
	.word 0xee8c0400  ! 24: LDUBA_R	lduba	[%r16, %r0] 0x20, %r23
	.word 0x87802072  ! 25: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0xe687a000  ! 26: LDUWA_I	lduwa	[%r30, + 0x0000] %asi, %r19
	.word 0x87802025  ! 27: WRASI_I	wr	%r0, 0x0025, %asi
	rd	%asr26, %g1
halt_resume_3_4:
	wr	%g1, 1, %asr26
!$EV trig_pc_d(3,expr(@VA(.MAIN.halt_resume_3_4), 16, 16)) -> intp(3, 3, 4)
	nop
	.word 0x01000000  ! 28: NOP	nop
	.word 0xe6a76000  ! 29: STWA_I	stwa	%r19, [%r29 + 0x0000] %asi
	.word 0xe2be49e0  ! 30: STDA_R	stda	%r17, [%r25 + %r0] 0x4f
	.word 0xe08f0e40  ! 31: LDUBA_R	lduba	[%r28, %r0] 0x72, %r16
	rd	%asr26, %g1
halt_resume_3_5:
	wr	%g1, 1, %asr26
!$EV trig_pc_d(3,expr(@VA(.MAIN.halt_resume_3_5), 16, 16)) -> intp(3, 3, 4)
	nop
	.word 0x01000000  ! 32: NOP	nop
	.word 0xeadf4e40  ! 33: LDXA_R	ldxa	[%r29, %r0] 0x72, %r21
	rd	%asr26, %g1
halt_resume_3_6:
	wr	%g1, 1, %asr26
!$EV trig_pc_d(3,expr(@VA(.MAIN.halt_resume_3_6), 16, 16)) -> intp(3, 3, 4)
	nop
	.word 0x01000000  ! 34: NOP	nop
	.word 0xeaf74e80  ! 35: STXA_R	stxa	%r21, [%r29 + %r0] 0x74
	.word 0xe0a4c400  ! 36: STWA_R	stwa	%r16, [%r19 + %r0] 0x20
	.word 0xe287e000  ! 37: LDUWA_I	lduwa	[%r31, + 0x0000] %asi, %r17
	.word 0xe2c76000  ! 38: LDSWA_I	ldswa	[%r29, + 0x0000] %asi, %r17
	.word 0xe2df6000  ! 39: LDXA_I	ldxa	[%r29, + 0x0000] %asi, %r17
	.word 0xecc40400  ! 40: LDSWA_R	ldswa	[%r16, %r0] 0x20, %r22
	.word 0xea8504a0  ! 41: LDUWA_R	lduwa	[%r20, %r0] 0x25, %r21
	.word 0xe09f4e60  ! 42: LDDA_R	ldda	[%r29, %r0] 0x73, %r16
	.word 0x8780204f  ! 43: WRASI_I	wr	%r0, 0x004f, %asi
	rd	%asr26, %g1
halt_resume_3_7:
	wr	%g1, 1, %asr26
!$EV trig_pc_d(3,expr(@VA(.MAIN.halt_resume_3_7), 16, 16)) -> intp(3, 3, 4)
	nop
	.word 0x01000000  ! 44: NOP	nop
	rd	%asr26, %g1
halt_resume_3_8:
	wr	%g1, 1, %asr26
!$EV trig_pc_d(3,expr(@VA(.MAIN.halt_resume_3_8), 16, 16)) -> intp(3, 3, 4)
	nop
	.word 0x01000000  ! 45: NOP	nop
	.word 0xecb52000  ! 46: STHA_I	stha	%r22, [%r20 + 0x0000] %asi
	.word 0x87802025  ! 47: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0xecd70e60  ! 48: LDSHA_R	ldsha	[%r28, %r0] 0x73, %r22
	.word 0xeebfe000  ! 49: STDA_I	stda	%r23, [%r31 + 0x0000] %asi
	.word 0xeed7e000  ! 50: LDSHA_I	ldsha	[%r31, + 0x0000] %asi, %r23
	.word 0xe6ccc400  ! 51: LDSBA_R	ldsba	[%r19, %r0] 0x20, %r19
	.word 0xe2c72000  ! 52: LDSWA_I	ldswa	[%r28, + 0x0000] %asi, %r17
	.word 0xe2c72000  ! 53: LDSWA_I	ldswa	[%r28, + 0x0000] %asi, %r17
	.word 0xe2d72000  ! 54: LDSHA_I	ldsha	[%r28, + 0x0000] %asi, %r17
	rd	%asr26, %g1
halt_resume_3_9:
	wr	%g1, 1, %asr26
!$EV trig_pc_d(3,expr(@VA(.MAIN.halt_resume_3_9), 16, 16)) -> intp(3, 3, 4)
	nop
	.word 0x01000000  ! 55: NOP	nop
	.word 0xe2f72000  ! 56: STXA_I	stxa	%r17, [%r28 + 0x0000] %asi
	.word 0xe2bfe000  ! 57: STDA_I	stda	%r17, [%r31 + 0x0000] %asi
	.word 0xeebc8400  ! 58: STDA_R	stda	%r23, [%r18 + %r0] 0x20
	.word 0x87802020  ! 59: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xeed5a000  ! 60: LDSHA_I	ldsha	[%r22, + 0x0000] %asi, %r23
	.word 0x87802073  ! 61: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0xee8ca000  ! 62: LDUBA_I	lduba	[%r18, + 0x0000] %asi, %r23
	.word 0x8780204f  ! 63: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xe8ac8400  ! 64: STBA_R	stba	%r20, [%r18 + %r0] 0x20
	.word 0xecf46000  ! 65: STXA_I	stxa	%r22, [%r17 + 0x0000] %asi
	.word 0xecccc400  ! 66: LDSBA_R	ldsba	[%r19, %r0] 0x20, %r22
	.word 0x87802074  ! 67: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0xea870e40  ! 68: LDUWA_R	lduwa	[%r28, %r0] 0x72, %r21
	.word 0xe8a66000  ! 69: STWA_I	stwa	%r20, [%r25 + 0x0000] %asi
	.word 0xeece89e0  ! 70: LDSBA_R	ldsba	[%r26, %r0] 0x4f, %r23
	.word 0x8780204f  ! 71: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xeaae6000  ! 72: STBA_I	stba	%r21, [%r25 + 0x0000] %asi
	.word 0xe496c9e0  ! 73: LDUHA_R	lduha	[%r27, %r0] 0x4f, %r18
	mov	0x3d8, %r23
	.word 0xe09e6000  ! 75: LDDA_I	ldda	[%r25, + 0x0000] %asi, %r16
	.word 0xe09ee000  ! 76: LDDA_I	ldda	[%r27, + 0x0000] %asi, %r16
	.word 0xecd70e40  ! 77: LDSHA_R	ldsha	[%r28, %r0] 0x72, %r22
	.word 0xe6be2000  ! 78: STDA_I	stda	%r19, [%r24 + 0x0000] %asi
	.word 0xe2a74e60  ! 79: STWA_R	stwa	%r17, [%r29 + %r0] 0x73
	rd	%asr26, %g1
halt_resume_3_10:
	wr	%g1, 1, %asr26
!$EV trig_pc_d(3,expr(@VA(.MAIN.halt_resume_3_10), 16, 16)) -> intp(3, 3, 4)
	nop
	.word 0x01000000  ! 80: NOP	nop
	.word 0xeace2000  ! 81: LDSBA_I	ldsba	[%r24, + 0x0000] %asi, %r21
	.word 0xeaa4c400  ! 82: STWA_R	stwa	%r21, [%r19 + %r0] 0x20
	rd	%asr26, %g1
halt_resume_3_11:
	wr	%g1, 1, %asr26
!$EV trig_pc_d(3,expr(@VA(.MAIN.halt_resume_3_11), 16, 16)) -> intp(3, 3, 4)
	nop
	.word 0x01000000  ! 83: NOP	nop
	.word 0xecc66000  ! 84: LDSWA_I	ldswa	[%r25, + 0x0000] %asi, %r22
	.word 0x87802074  ! 85: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0xecf76000  ! 86: STXA_I	stxa	%r22, [%r29 + 0x0000] %asi
	.word 0xec9f2000  ! 87: LDDA_I	ldda	[%r28, + 0x0000] %asi, %r22
	.word 0xe6bf8e60  ! 88: STDA_R	stda	%r19, [%r30 + %r0] 0x73
	.word 0xe2c72000  ! 89: LDSWA_I	ldswa	[%r28, + 0x0000] %asi, %r17
	.word 0xecdcc400  ! 90: LDXA_R	ldxa	[%r19, %r0] 0x20, %r22
	.word 0xee8fe000  ! 91: LDUBA_I	lduba	[%r31, + 0x0000] %asi, %r23
	.word 0xee8f6000  ! 92: LDUBA_I	lduba	[%r29, + 0x0000] %asi, %r23
	.word 0xee8f2000  ! 93: LDUBA_I	lduba	[%r28, + 0x0000] %asi, %r23
	rd	%asr26, %g1
halt_resume_3_12:
	wr	%g1, 1, %asr26
!$EV trig_pc_d(3,expr(@VA(.MAIN.halt_resume_3_12), 16, 16)) -> intp(3, 3, 4)
	nop
	.word 0x01000000  ! 94: NOP	nop
	.word 0x87802020  ! 95: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe4be89e0  ! 96: STDA_R	stda	%r18, [%r26 + %r0] 0x4f
	rd	%asr26, %g1
halt_resume_3_13:
	wr	%g1, 1, %asr26
!$EV trig_pc_d(3,expr(@VA(.MAIN.halt_resume_3_13), 16, 16)) -> intp(3, 3, 4)
	nop
	.word 0x01000000  ! 97: NOP	nop
	.word 0xe6afe000  ! 98: STBA_I	stba	%r19, [%r31 + 0x0000] %asi
	.word 0x87802020  ! 99: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe2870e40  ! 100: LDUWA_R	lduwa	[%r28, %r0] 0x72, %r17
	.word 0xe8cf8e60  ! 101: LDSBA_R	ldsba	[%r30, %r0] 0x73, %r20
	.word 0xecafa000  ! 102: STBA_I	stba	%r22, [%r30 + 0x0000] %asi
	.word 0xecb72000  ! 103: STHA_I	stha	%r22, [%r28 + 0x0000] %asi
	.word 0xeca76000  ! 104: STWA_I	stwa	%r22, [%r29 + 0x0000] %asi
	.word 0xecdf2000  ! 105: LDXA_I	ldxa	[%r28, + 0x0000] %asi, %r22
	.word 0xecac4400  ! 106: STBA_R	stba	%r22, [%r17 + %r0] 0x20
	.word 0xecc7ce80  ! 107: LDSWA_R	ldswa	[%r31, %r0] 0x74, %r22
	mov	0x3c8, %r20
	.word 0xe28f6000  ! 109: LDUBA_I	lduba	[%r29, + 0x0000] %asi, %r17
	.word 0xe6b4c400  ! 110: STHA_R	stha	%r19, [%r19 + %r0] 0x20
	.word 0x87802020  ! 111: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xeac584a0  ! 112: LDSWA_R	ldswa	[%r22, %r0] 0x25, %r21
	rd	%asr26, %g1
halt_resume_3_14:
	wr	%g1, 1, %asr26
!$EV trig_pc_d(3,expr(@VA(.MAIN.halt_resume_3_14), 16, 16)) -> intp(3, 3, 4)
	nop
	.word 0x01000000  ! 113: NOP	nop
	.word 0xe8ac4400  ! 114: STBA_R	stba	%r20, [%r17 + %r0] 0x20
	.word 0xe2bf8e60  ! 115: STDA_R	stda	%r17, [%r30 + %r0] 0x73
	rd	%asr26, %g1
halt_resume_3_15:
	wr	%g1, 1, %asr26
!$EV trig_pc_d(3,expr(@VA(.MAIN.halt_resume_3_15), 16, 16)) -> intp(3, 3, 4)
	nop
	.word 0x01000000  ! 116: NOP	nop
	rd	%asr26, %g1
halt_resume_3_16:
	wr	%g1, 1, %asr26
!$EV trig_pc_d(3,expr(@VA(.MAIN.halt_resume_3_16), 16, 16)) -> intp(3, 3, 4)
	nop
	.word 0x01000000  ! 117: NOP	nop
	.word 0xe0bce000  ! 118: STDA_I	stda	%r16, [%r19 + 0x0000] %asi
	.word 0x87802074  ! 119: WRASI_I	wr	%r0, 0x0074, %asi
	rd	%asr26, %g1
halt_resume_3_17:
	wr	%g1, 1, %asr26
!$EV trig_pc_d(3,expr(@VA(.MAIN.halt_resume_3_17), 16, 16)) -> intp(3, 3, 4)
	nop
	.word 0x01000000  ! 120: NOP	nop
	rd	%asr26, %g1
halt_resume_3_18:
	wr	%g1, 1, %asr26
!$EV trig_pc_d(3,expr(@VA(.MAIN.halt_resume_3_18), 16, 16)) -> intp(3, 3, 4)
	nop
	.word 0x01000000  ! 121: NOP	nop
	.word 0xeeb4c400  ! 122: STHA_R	stha	%r23, [%r19 + %r0] 0x20
	.word 0xe69cc400  ! 123: LDDA_R	ldda	[%r19, %r0] 0x20, %r19
	.word 0xe687a000  ! 124: LDUWA_I	lduwa	[%r30, + 0x0000] %asi, %r19
	.word 0xe6a7a000  ! 125: STWA_I	stwa	%r19, [%r30 + 0x0000] %asi
	.word 0xeab70e80  ! 126: STHA_R	stha	%r21, [%r28 + %r0] 0x74
	.word 0xeaaf8e40  ! 127: STBA_R	stba	%r21, [%r30 + %r0] 0x72
	rd	%asr26, %g1
halt_resume_3_19:
	wr	%g1, 1, %asr26
!$EV trig_pc_d(3,expr(@VA(.MAIN.halt_resume_3_19), 16, 16)) -> intp(3, 3, 4)
	nop
	.word 0x01000000  ! 128: NOP	nop
	.word 0xe2af0e60  ! 129: STBA_R	stba	%r17, [%r28 + %r0] 0x73
	rd	%asr26, %g1
halt_resume_3_20:
	wr	%g1, 1, %asr26
!$EV trig_pc_d(3,expr(@VA(.MAIN.halt_resume_3_20), 16, 16)) -> intp(3, 3, 4)
	nop
	.word 0x01000000  ! 130: NOP	nop
	.word 0xe8b7e000  ! 131: STHA_I	stha	%r20, [%r31 + 0x0000] %asi
	.word 0x87802020  ! 132: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe8df2000  ! 133: LDXA_I	ldxa	[%r28, + 0x0000] %asi, %r20
	.word 0xe8a78e40  ! 134: STWA_R	stwa	%r20, [%r30 + %r0] 0x72
	.word 0xea8fa000  ! 135: LDUBA_I	lduba	[%r30, + 0x0000] %asi, %r21
	.word 0xeab48400  ! 136: STHA_R	stha	%r21, [%r18 + %r0] 0x20
	.word 0xeaaf4e60  ! 137: STBA_R	stba	%r21, [%r29 + %r0] 0x73
	.word 0xeebf6000  ! 138: STDA_I	stda	%r23, [%r29 + 0x0000] %asi
	.word 0xea9504a0  ! 139: LDUHA_R	lduha	[%r20, %r0] 0x25, %r21
	mov	0x78, %r24
	mov	0x40, %r26
	.word 0xec9cc400  ! 142: LDDA_R	ldda	[%r19, %r0] 0x20, %r22
	rd	%asr26, %g1
halt_resume_3_21:
	wr	%g1, 1, %asr26
!$EV trig_pc_d(3,expr(@VA(.MAIN.halt_resume_3_21), 16, 16)) -> intp(3, 3, 4)
	nop
	.word 0x01000000  ! 143: NOP	nop
	.word 0xeaa74e80  ! 144: STWA_R	stwa	%r21, [%r29 + %r0] 0x74
	mov	0x68, %r17
	.word 0xeecfa000  ! 146: LDSBA_I	ldsba	[%r30, + 0x0000] %asi, %r23
	.word 0xecd44400  ! 147: LDSHA_R	ldsha	[%r17, %r0] 0x20, %r22
	mov	0x70, %r27
	.word 0xeecc4400  ! 149: LDSBA_R	ldsba	[%r17, %r0] 0x20, %r23
	.word 0xead72000  ! 150: LDSHA_I	ldsha	[%r28, + 0x0000] %asi, %r21
	.word 0xe8f40400  ! 151: STXA_R	stxa	%r20, [%r16 + %r0] 0x20
	.word 0xecd70e60  ! 152: LDSHA_R	ldsha	[%r28, %r0] 0x73, %r22
	.word 0xe09f6000  ! 153: LDDA_I	ldda	[%r29, + 0x0000] %asi, %r16
	.word 0x87802074  ! 154: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0xe68f0e40  ! 155: LDUBA_R	lduba	[%r28, %r0] 0x72, %r19
	.word 0xe6cfe000  ! 156: LDSBA_I	ldsba	[%r31, + 0x0000] %asi, %r19
	.word 0xeace49e0  ! 157: LDSBA_R	ldsba	[%r25, %r0] 0x4f, %r21
	.word 0xe0cf2000  ! 158: LDSBA_I	ldsba	[%r28, + 0x0000] %asi, %r16
	.word 0x8780204f  ! 159: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xe8ad04a0  ! 160: STBA_R	stba	%r20, [%r20 + %r0] 0x25
	.word 0xe8bfe000  ! 161: STDA_I	stda	%r20, [%r31 + 0x0000] %asi
	mov	0x0, %r25
	.word 0xe0cdc4a0  ! 163: LDSBA_R	ldsba	[%r23, %r0] 0x25, %r16
	.word 0xe8f44400  ! 164: STXA_R	stxa	%r20, [%r17 + %r0] 0x20
	mov	0x58, %r16
	.word 0xecf689e0  ! 166: STXA_R	stxa	%r22, [%r26 + %r0] 0x4f
	.word 0xea8f6000  ! 167: LDUBA_I	lduba	[%r29, + 0x0000] %asi, %r21
	.word 0x87802020  ! 168: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe08c8400  ! 169: LDUBA_R	lduba	[%r18, %r0] 0x20, %r16
	mov	0x0, %r24
	rd	%asr26, %g1
halt_resume_3_22:
	wr	%g1, 1, %asr26
!$EV trig_pc_d(3,expr(@VA(.MAIN.halt_resume_3_22), 16, 16)) -> intp(3, 3, 4)
	nop
	.word 0x01000000  ! 171: NOP	nop
	.word 0xec8c4400  ! 172: LDUBA_R	lduba	[%r17, %r0] 0x20, %r22
	.word 0xe497e000  ! 173: LDUHA_I	lduha	[%r31, + 0x0000] %asi, %r18
	.word 0xe48fa000  ! 174: LDUBA_I	lduba	[%r30, + 0x0000] %asi, %r18
	.word 0xeea7ce60  ! 175: STWA_R	stwa	%r23, [%r31 + %r0] 0x73
	.word 0xe4cf0e80  ! 176: LDSBA_R	ldsba	[%r28, %r0] 0x74, %r18
	.word 0xe8b544a0  ! 177: STHA_R	stha	%r20, [%r21 + %r0] 0x25
	.word 0xe49584a0  ! 178: LDUHA_R	lduha	[%r22, %r0] 0x25, %r18
	.word 0xe6b76000  ! 179: STHA_I	stha	%r19, [%r29 + 0x0000] %asi
	.word 0xe6afa000  ! 180: STBA_I	stba	%r19, [%r30 + 0x0000] %asi
	.word 0xe6dfa000  ! 181: LDXA_I	ldxa	[%r30, + 0x0000] %asi, %r19
	.word 0xe6dfe000  ! 182: LDXA_I	ldxa	[%r31, + 0x0000] %asi, %r19
	.word 0xe4d544a0  ! 183: LDSHA_R	ldsha	[%r21, %r0] 0x25, %r18
	.word 0x87802020  ! 184: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xeedc6000  ! 185: LDXA_I	ldxa	[%r17, + 0x0000] %asi, %r23
	.word 0xeef78e80  ! 186: STXA_R	stxa	%r23, [%r30 + %r0] 0x74
	.word 0xea8c2000  ! 187: LDUBA_I	lduba	[%r16, + 0x0000] %asi, %r21
	rd	%asr26, %g1
halt_resume_3_23:
	wr	%g1, 1, %asr26
!$EV trig_pc_d(3,expr(@VA(.MAIN.halt_resume_3_23), 16, 16)) -> intp(3, 3, 4)
	nop
	.word 0x01000000  ! 188: NOP	nop
	rd	%asr26, %g1
halt_resume_3_24:
	wr	%g1, 1, %asr26
!$EV trig_pc_d(3,expr(@VA(.MAIN.halt_resume_3_24), 16, 16)) -> intp(3, 3, 4)
	nop
	.word 0x01000000  ! 189: NOP	nop
	mov	0x7d0, %r23
	.word 0xe2bc0400  ! 191: STDA_R	stda	%r17, [%r16 + %r0] 0x20
	.word 0xe28c6000  ! 192: LDUBA_I	lduba	[%r17, + 0x0000] %asi, %r17
	.word 0x87802025  ! 193: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0xea95c4a0  ! 194: LDUHA_R	lduha	[%r23, %r0] 0x25, %r21
	.word 0xe4b72000  ! 195: STHA_I	stha	%r18, [%r28 + 0x0000] %asi
	.word 0xe89c4400  ! 196: LDDA_R	ldda	[%r17, %r0] 0x20, %r20
	.word 0xeca78e60  ! 197: STWA_R	stwa	%r22, [%r30 + %r0] 0x73
	.word 0xeebf8e80  ! 198: STDA_R	stda	%r23, [%r30 + %r0] 0x74
	.word 0x87802020  ! 199: WRASI_I	wr	%r0, 0x0020, %asi
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_2:
	.word 0xe4d5a000  ! 2: LDSHA_I	ldsha	[%r22, + 0x0000] %asi, %r18
	mov	0x30, %r25
	.word 0x87802073  ! 4: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0xecb74e60  ! 5: STHA_R	stha	%r22, [%r29 + %r0] 0x73
	.word 0xe2df4e80  ! 6: LDXA_R	ldxa	[%r29, %r0] 0x74, %r17
	.word 0x8780204f  ! 7: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xe0a78e60  ! 8: STWA_R	stwa	%r16, [%r30 + %r0] 0x73
	.word 0xeab5c4a0  ! 9: STHA_R	stha	%r21, [%r23 + %r0] 0x25
	rd	%asr26, %g1
halt_resume_2_0:
	wr	%g1, 1, %asr26
!$EV trig_pc_d(2,expr(@VA(.MAIN.halt_resume_2_0), 16, 16)) -> intp(2, 3, 4)
	nop
	.word 0x01000000  ! 10: NOP	nop
	.word 0xecaf4e80  ! 11: STBA_R	stba	%r22, [%r29 + %r0] 0x74
	.word 0xea848400  ! 12: LDUWA_R	lduwa	[%r18, %r0] 0x20, %r21
	rd	%asr26, %g1
halt_resume_2_1:
	wr	%g1, 1, %asr26
!$EV trig_pc_d(2,expr(@VA(.MAIN.halt_resume_2_1), 16, 16)) -> intp(2, 3, 4)
	nop
	.word 0x01000000  ! 13: NOP	nop
	rd	%asr26, %g1
halt_resume_2_2:
	wr	%g1, 1, %asr26
!$EV trig_pc_d(2,expr(@VA(.MAIN.halt_resume_2_2), 16, 16)) -> intp(2, 3, 4)
	nop
	.word 0x01000000  ! 14: NOP	nop
	.word 0x8780204f  ! 15: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xe2f7e000  ! 16: STXA_I	stxa	%r17, [%r31 + 0x0000] %asi
	.word 0xe4bf0e60  ! 17: STDA_R	stda	%r18, [%r28 + %r0] 0x73
	.word 0x87802074  ! 18: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0xe0878e60  ! 19: LDUWA_R	lduwa	[%r30, %r0] 0x73, %r16
	.word 0x87802074  ! 20: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0xecf5e000  ! 21: STXA_I	stxa	%r22, [%r23 + 0x0000] %asi
	.word 0x8780204f  ! 22: WRASI_I	wr	%r0, 0x004f, %asi
	rd	%asr26, %g1
halt_resume_2_3:
	wr	%g1, 1, %asr26
!$EV trig_pc_d(2,expr(@VA(.MAIN.halt_resume_2_3), 16, 16)) -> intp(2, 3, 4)
	nop
	.word 0x01000000  ! 23: NOP	nop
	.word 0xee8c0400  ! 24: LDUBA_R	lduba	[%r16, %r0] 0x20, %r23
	.word 0x87802072  ! 25: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0xe6876000  ! 26: LDUWA_I	lduwa	[%r29, + 0x0000] %asi, %r19
	.word 0x87802020  ! 27: WRASI_I	wr	%r0, 0x0020, %asi
	rd	%asr26, %g1
halt_resume_2_4:
	wr	%g1, 1, %asr26
!$EV trig_pc_d(2,expr(@VA(.MAIN.halt_resume_2_4), 16, 16)) -> intp(2, 3, 4)
	nop
	.word 0x01000000  ! 28: NOP	nop
	.word 0xe6a7e000  ! 29: STWA_I	stwa	%r19, [%r31 + 0x0000] %asi
	.word 0xe0be49e0  ! 30: STDA_R	stda	%r16, [%r25 + %r0] 0x4f
	.word 0xe28e09e0  ! 31: LDUBA_R	lduba	[%r24, %r0] 0x4f, %r17
	rd	%asr26, %g1
halt_resume_2_5:
	wr	%g1, 1, %asr26
!$EV trig_pc_d(2,expr(@VA(.MAIN.halt_resume_2_5), 16, 16)) -> intp(2, 3, 4)
	nop
	.word 0x01000000  ! 32: NOP	nop
	.word 0xe6dc0400  ! 33: LDXA_R	ldxa	[%r16, %r0] 0x20, %r19
	rd	%asr26, %g1
halt_resume_2_6:
	wr	%g1, 1, %asr26
!$EV trig_pc_d(2,expr(@VA(.MAIN.halt_resume_2_6), 16, 16)) -> intp(2, 3, 4)
	nop
	.word 0x01000000  ! 34: NOP	nop
	.word 0xe8f4c400  ! 35: STXA_R	stxa	%r20, [%r19 + %r0] 0x20
	.word 0xe0a78e80  ! 36: STWA_R	stwa	%r16, [%r30 + %r0] 0x74
	.word 0xe2876000  ! 37: LDUWA_I	lduwa	[%r29, + 0x0000] %asi, %r17
	.word 0xe2c7a000  ! 38: LDSWA_I	ldswa	[%r30, + 0x0000] %asi, %r17
	.word 0xe2dfa000  ! 39: LDXA_I	ldxa	[%r30, + 0x0000] %asi, %r17
	.word 0xecc584a0  ! 40: LDSWA_R	ldswa	[%r22, %r0] 0x25, %r22
	.word 0xea87ce40  ! 41: LDUWA_R	lduwa	[%r31, %r0] 0x72, %r21
	.word 0xec9c0400  ! 42: LDDA_R	ldda	[%r16, %r0] 0x20, %r22
	.word 0x8780204f  ! 43: WRASI_I	wr	%r0, 0x004f, %asi
	rd	%asr26, %g1
halt_resume_2_7:
	wr	%g1, 1, %asr26
!$EV trig_pc_d(2,expr(@VA(.MAIN.halt_resume_2_7), 16, 16)) -> intp(2, 3, 4)
	nop
	.word 0x01000000  ! 44: NOP	nop
	rd	%asr26, %g1
halt_resume_2_8:
	wr	%g1, 1, %asr26
!$EV trig_pc_d(2,expr(@VA(.MAIN.halt_resume_2_8), 16, 16)) -> intp(2, 3, 4)
	nop
	.word 0x01000000  ! 45: NOP	nop
	.word 0xecb5a000  ! 46: STHA_I	stha	%r22, [%r22 + 0x0000] %asi
	.word 0x87802020  ! 47: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe4d78e80  ! 48: LDSHA_R	ldsha	[%r30, %r0] 0x74, %r18
	.word 0xeebfa000  ! 49: STDA_I	stda	%r23, [%r30 + 0x0000] %asi
	.word 0xeed7e000  ! 50: LDSHA_I	ldsha	[%r31, + 0x0000] %asi, %r23
	.word 0xe6ce89e0  ! 51: LDSBA_R	ldsba	[%r26, %r0] 0x4f, %r19
	.word 0xe2c76000  ! 52: LDSWA_I	ldswa	[%r29, + 0x0000] %asi, %r17
	.word 0xe2c72000  ! 53: LDSWA_I	ldswa	[%r28, + 0x0000] %asi, %r17
	.word 0xe2d72000  ! 54: LDSHA_I	ldsha	[%r28, + 0x0000] %asi, %r17
	rd	%asr26, %g1
halt_resume_2_9:
	wr	%g1, 1, %asr26
!$EV trig_pc_d(2,expr(@VA(.MAIN.halt_resume_2_9), 16, 16)) -> intp(2, 3, 4)
	nop
	.word 0x01000000  ! 55: NOP	nop
	.word 0xe2f72000  ! 56: STXA_I	stxa	%r17, [%r28 + 0x0000] %asi
	.word 0xe2bf6000  ! 57: STDA_I	stda	%r17, [%r29 + 0x0000] %asi
	.word 0xecbd84a0  ! 58: STDA_R	stda	%r22, [%r22 + %r0] 0x25
	.word 0x87802074  ! 59: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0xeed5a000  ! 60: LDSHA_I	ldsha	[%r22, + 0x0000] %asi, %r23
	.word 0x87802074  ! 61: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0xee8c2000  ! 62: LDUBA_I	lduba	[%r16, + 0x0000] %asi, %r23
	.word 0x87802072  ! 63: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0xecae09e0  ! 64: STBA_R	stba	%r22, [%r24 + %r0] 0x4f
	.word 0xecf4a000  ! 65: STXA_I	stxa	%r22, [%r18 + 0x0000] %asi
	.word 0xe4cf8e40  ! 66: LDSBA_R	ldsba	[%r30, %r0] 0x72, %r18
	.word 0x87802025  ! 67: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0xe6844400  ! 68: LDUWA_R	lduwa	[%r17, %r0] 0x20, %r19
	.word 0xe8a6e000  ! 69: STWA_I	stwa	%r20, [%r27 + 0x0000] %asi
	.word 0xeecf4e40  ! 70: LDSBA_R	ldsba	[%r29, %r0] 0x72, %r23
	.word 0x87802074  ! 71: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0xeaaea000  ! 72: STBA_I	stba	%r21, [%r26 + 0x0000] %asi
	.word 0xee9504a0  ! 73: LDUHA_R	lduha	[%r20, %r0] 0x25, %r23
	mov	0x3f8, %r21
	.word 0xe09e2000  ! 75: LDDA_I	ldda	[%r24, + 0x0000] %asi, %r16
	.word 0xe09e6000  ! 76: LDDA_I	ldda	[%r25, + 0x0000] %asi, %r16
	.word 0xe8d40400  ! 77: LDSHA_R	ldsha	[%r16, %r0] 0x20, %r20
	.word 0xe6bea000  ! 78: STDA_I	stda	%r19, [%r26 + 0x0000] %asi
	.word 0xe6a649e0  ! 79: STWA_R	stwa	%r19, [%r25 + %r0] 0x4f
	rd	%asr26, %g1
halt_resume_2_10:
	wr	%g1, 1, %asr26
!$EV trig_pc_d(2,expr(@VA(.MAIN.halt_resume_2_10), 16, 16)) -> intp(2, 3, 4)
	nop
	.word 0x01000000  ! 80: NOP	nop
	.word 0xeace6000  ! 81: LDSBA_I	ldsba	[%r25, + 0x0000] %asi, %r21
	.word 0xe4a40400  ! 82: STWA_R	stwa	%r18, [%r16 + %r0] 0x20
	rd	%asr26, %g1
halt_resume_2_11:
	wr	%g1, 1, %asr26
!$EV trig_pc_d(2,expr(@VA(.MAIN.halt_resume_2_11), 16, 16)) -> intp(2, 3, 4)
	nop
	.word 0x01000000  ! 83: NOP	nop
	.word 0xecc66000  ! 84: LDSWA_I	ldswa	[%r25, + 0x0000] %asi, %r22
	.word 0x87802020  ! 85: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xecf72000  ! 86: STXA_I	stxa	%r22, [%r28 + 0x0000] %asi
	.word 0xec9fe000  ! 87: LDDA_I	ldda	[%r31, + 0x0000] %asi, %r22
	.word 0xeebec9e0  ! 88: STDA_R	stda	%r23, [%r27 + %r0] 0x4f
	.word 0xe2c72000  ! 89: LDSWA_I	ldswa	[%r28, + 0x0000] %asi, %r17
	.word 0xe4dcc400  ! 90: LDXA_R	ldxa	[%r19, %r0] 0x20, %r18
	.word 0xee8f2000  ! 91: LDUBA_I	lduba	[%r28, + 0x0000] %asi, %r23
	.word 0xee8f6000  ! 92: LDUBA_I	lduba	[%r29, + 0x0000] %asi, %r23
	.word 0xee8fa000  ! 93: LDUBA_I	lduba	[%r30, + 0x0000] %asi, %r23
	rd	%asr26, %g1
halt_resume_2_12:
	wr	%g1, 1, %asr26
!$EV trig_pc_d(2,expr(@VA(.MAIN.halt_resume_2_12), 16, 16)) -> intp(2, 3, 4)
	nop
	.word 0x01000000  ! 94: NOP	nop
	.word 0x87802073  ! 95: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0xe4bf8e40  ! 96: STDA_R	stda	%r18, [%r30 + %r0] 0x72
	rd	%asr26, %g1
halt_resume_2_13:
	wr	%g1, 1, %asr26
!$EV trig_pc_d(2,expr(@VA(.MAIN.halt_resume_2_13), 16, 16)) -> intp(2, 3, 4)
	nop
	.word 0x01000000  ! 97: NOP	nop
	.word 0xe6af2000  ! 98: STBA_I	stba	%r19, [%r28 + 0x0000] %asi
	.word 0x8780204f  ! 99: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xec840400  ! 100: LDUWA_R	lduwa	[%r16, %r0] 0x20, %r22
	.word 0xe0ce09e0  ! 101: LDSBA_R	ldsba	[%r24, %r0] 0x4f, %r16
	.word 0xecafa000  ! 102: STBA_I	stba	%r22, [%r30 + 0x0000] %asi
	.word 0xecb72000  ! 103: STHA_I	stha	%r22, [%r28 + 0x0000] %asi
	.word 0xeca7e000  ! 104: STWA_I	stwa	%r22, [%r31 + 0x0000] %asi
	.word 0xecdf2000  ! 105: LDXA_I	ldxa	[%r28, + 0x0000] %asi, %r22
	.word 0xe4acc400  ! 106: STBA_R	stba	%r18, [%r19 + %r0] 0x20
	.word 0xeac544a0  ! 107: LDSWA_R	ldswa	[%r21, %r0] 0x25, %r21
	mov	0x7c0, %r20
	.word 0xe28fe000  ! 109: LDUBA_I	lduba	[%r31, + 0x0000] %asi, %r17
	.word 0xe2b584a0  ! 110: STHA_R	stha	%r17, [%r22 + %r0] 0x25
	.word 0x87802072  ! 111: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0xe8c78e60  ! 112: LDSWA_R	ldswa	[%r30, %r0] 0x73, %r20
	rd	%asr26, %g1
halt_resume_2_14:
	wr	%g1, 1, %asr26
!$EV trig_pc_d(2,expr(@VA(.MAIN.halt_resume_2_14), 16, 16)) -> intp(2, 3, 4)
	nop
	.word 0x01000000  ! 113: NOP	nop
	.word 0xe8adc4a0  ! 114: STBA_R	stba	%r20, [%r23 + %r0] 0x25
	.word 0xeebc0400  ! 115: STDA_R	stda	%r23, [%r16 + %r0] 0x20
	rd	%asr26, %g1
halt_resume_2_15:
	wr	%g1, 1, %asr26
!$EV trig_pc_d(2,expr(@VA(.MAIN.halt_resume_2_15), 16, 16)) -> intp(2, 3, 4)
	nop
	.word 0x01000000  ! 116: NOP	nop
	rd	%asr26, %g1
halt_resume_2_16:
	wr	%g1, 1, %asr26
!$EV trig_pc_d(2,expr(@VA(.MAIN.halt_resume_2_16), 16, 16)) -> intp(2, 3, 4)
	nop
	.word 0x01000000  ! 117: NOP	nop
	.word 0xe0bc6000  ! 118: STDA_I	stda	%r16, [%r17 + 0x0000] %asi
	.word 0x87802072  ! 119: WRASI_I	wr	%r0, 0x0072, %asi
	rd	%asr26, %g1
halt_resume_2_17:
	wr	%g1, 1, %asr26
!$EV trig_pc_d(2,expr(@VA(.MAIN.halt_resume_2_17), 16, 16)) -> intp(2, 3, 4)
	nop
	.word 0x01000000  ! 120: NOP	nop
	rd	%asr26, %g1
halt_resume_2_18:
	wr	%g1, 1, %asr26
!$EV trig_pc_d(2,expr(@VA(.MAIN.halt_resume_2_18), 16, 16)) -> intp(2, 3, 4)
	nop
	.word 0x01000000  ! 121: NOP	nop
	.word 0xeeb544a0  ! 122: STHA_R	stha	%r23, [%r21 + %r0] 0x25
	.word 0xea9fce80  ! 123: LDDA_R	ldda	[%r31, %r0] 0x74, %r21
	.word 0xe687e000  ! 124: LDUWA_I	lduwa	[%r31, + 0x0000] %asi, %r19
	.word 0xe6a76000  ! 125: STWA_I	stwa	%r19, [%r29 + 0x0000] %asi
	.word 0xecb74e80  ! 126: STHA_R	stha	%r22, [%r29 + %r0] 0x74
	.word 0xe8af0e80  ! 127: STBA_R	stba	%r20, [%r28 + %r0] 0x74
	rd	%asr26, %g1
halt_resume_2_19:
	wr	%g1, 1, %asr26
!$EV trig_pc_d(2,expr(@VA(.MAIN.halt_resume_2_19), 16, 16)) -> intp(2, 3, 4)
	nop
	.word 0x01000000  ! 128: NOP	nop
	.word 0xe6ac8400  ! 129: STBA_R	stba	%r19, [%r18 + %r0] 0x20
	rd	%asr26, %g1
halt_resume_2_20:
	wr	%g1, 1, %asr26
!$EV trig_pc_d(2,expr(@VA(.MAIN.halt_resume_2_20), 16, 16)) -> intp(2, 3, 4)
	nop
	.word 0x01000000  ! 130: NOP	nop
	.word 0xe8b76000  ! 131: STHA_I	stha	%r20, [%r29 + 0x0000] %asi
	.word 0x87802020  ! 132: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe8dfe000  ! 133: LDXA_I	ldxa	[%r31, + 0x0000] %asi, %r20
	.word 0xeea4c400  ! 134: STWA_R	stwa	%r23, [%r19 + %r0] 0x20
	.word 0xea8fa000  ! 135: LDUBA_I	lduba	[%r30, + 0x0000] %asi, %r21
	.word 0xe2b6c9e0  ! 136: STHA_R	stha	%r17, [%r27 + %r0] 0x4f
	.word 0xe2acc400  ! 137: STBA_R	stba	%r17, [%r19 + %r0] 0x20
	.word 0xeebfe000  ! 138: STDA_I	stda	%r23, [%r31 + 0x0000] %asi
	.word 0xe494c400  ! 139: LDUHA_R	lduha	[%r19, %r0] 0x20, %r18
	mov	0x18, %r27
	mov	0x48, %r27
	.word 0xe89f0e60  ! 142: LDDA_R	ldda	[%r28, %r0] 0x73, %r20
	rd	%asr26, %g1
halt_resume_2_21:
	wr	%g1, 1, %asr26
!$EV trig_pc_d(2,expr(@VA(.MAIN.halt_resume_2_21), 16, 16)) -> intp(2, 3, 4)
	nop
	.word 0x01000000  ! 143: NOP	nop
	.word 0xe8a4c400  ! 144: STWA_R	stwa	%r20, [%r19 + %r0] 0x20
	mov	0x50, %r19
	.word 0xeecfa000  ! 146: LDSBA_I	ldsba	[%r30, + 0x0000] %asi, %r23
	.word 0xecd5c4a0  ! 147: LDSHA_R	ldsha	[%r23, %r0] 0x25, %r22
	mov	0x58, %r26
	.word 0xeacf4e80  ! 149: LDSBA_R	ldsba	[%r29, %r0] 0x74, %r21
	.word 0xead76000  ! 150: LDSHA_I	ldsha	[%r29, + 0x0000] %asi, %r21
	.word 0xe2f609e0  ! 151: STXA_R	stxa	%r17, [%r24 + %r0] 0x4f
	.word 0xe2d40400  ! 152: LDSHA_R	ldsha	[%r16, %r0] 0x20, %r17
	.word 0xe09fe000  ! 153: LDDA_I	ldda	[%r31, + 0x0000] %asi, %r16
	.word 0x8780204f  ! 154: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xe08d84a0  ! 155: LDUBA_R	lduba	[%r22, %r0] 0x25, %r16
	.word 0xe6cfa000  ! 156: LDSBA_I	ldsba	[%r30, + 0x0000] %asi, %r19
	.word 0xe6cec9e0  ! 157: LDSBA_R	ldsba	[%r27, %r0] 0x4f, %r19
	.word 0xe0cf2000  ! 158: LDSBA_I	ldsba	[%r28, + 0x0000] %asi, %r16
	.word 0x8780204f  ! 159: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xeeac8400  ! 160: STBA_R	stba	%r23, [%r18 + %r0] 0x20
	.word 0xe8bfa000  ! 161: STDA_I	stda	%r20, [%r30 + 0x0000] %asi
	mov	0x8, %r24
	.word 0xe8cc4400  ! 163: LDSBA_R	ldsba	[%r17, %r0] 0x20, %r20
	.word 0xe2f74e80  ! 164: STXA_R	stxa	%r17, [%r29 + %r0] 0x74
	mov	0x40, %r16
	.word 0xe6f48400  ! 166: STXA_R	stxa	%r19, [%r18 + %r0] 0x20
	.word 0xea8fe000  ! 167: LDUBA_I	lduba	[%r31, + 0x0000] %asi, %r21
	.word 0x87802074  ! 168: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0xec8cc400  ! 169: LDUBA_R	lduba	[%r19, %r0] 0x20, %r22
	mov	0x78, %r26
	rd	%asr26, %g1
halt_resume_2_22:
	wr	%g1, 1, %asr26
!$EV trig_pc_d(2,expr(@VA(.MAIN.halt_resume_2_22), 16, 16)) -> intp(2, 3, 4)
	nop
	.word 0x01000000  ! 171: NOP	nop
	.word 0xee8e89e0  ! 172: LDUBA_R	lduba	[%r26, %r0] 0x4f, %r23
	.word 0xe4972000  ! 173: LDUHA_I	lduha	[%r28, + 0x0000] %asi, %r18
	.word 0xe48fa000  ! 174: LDUBA_I	lduba	[%r30, + 0x0000] %asi, %r18
	.word 0xeca74e80  ! 175: STWA_R	stwa	%r22, [%r29 + %r0] 0x74
	.word 0xe0cf0e40  ! 176: LDSBA_R	ldsba	[%r28, %r0] 0x72, %r16
	.word 0xe0b70e80  ! 177: STHA_R	stha	%r16, [%r28 + %r0] 0x74
	.word 0xe6940400  ! 178: LDUHA_R	lduha	[%r16, %r0] 0x20, %r19
	.word 0xe6b7a000  ! 179: STHA_I	stha	%r19, [%r30 + 0x0000] %asi
	.word 0xe6afa000  ! 180: STBA_I	stba	%r19, [%r30 + 0x0000] %asi
	.word 0xe6dfe000  ! 181: LDXA_I	ldxa	[%r31, + 0x0000] %asi, %r19
	.word 0xe6dfa000  ! 182: LDXA_I	ldxa	[%r30, + 0x0000] %asi, %r19
	.word 0xe0d44400  ! 183: LDSHA_R	ldsha	[%r17, %r0] 0x20, %r16
	.word 0x8780204f  ! 184: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xeedca000  ! 185: LDXA_I	ldxa	[%r18, + 0x0000] %asi, %r23
	.word 0xecf4c400  ! 186: STXA_R	stxa	%r22, [%r19 + %r0] 0x20
	.word 0xea8c2000  ! 187: LDUBA_I	lduba	[%r16, + 0x0000] %asi, %r21
	rd	%asr26, %g1
halt_resume_2_23:
	wr	%g1, 1, %asr26
!$EV trig_pc_d(2,expr(@VA(.MAIN.halt_resume_2_23), 16, 16)) -> intp(2, 3, 4)
	nop
	.word 0x01000000  ! 188: NOP	nop
	rd	%asr26, %g1
halt_resume_2_24:
	wr	%g1, 1, %asr26
!$EV trig_pc_d(2,expr(@VA(.MAIN.halt_resume_2_24), 16, 16)) -> intp(2, 3, 4)
	nop
	.word 0x01000000  ! 189: NOP	nop
	mov	0x7c8, %r22
	.word 0xe2bc0400  ! 191: STDA_R	stda	%r17, [%r16 + %r0] 0x20
	.word 0xe28ce000  ! 192: LDUBA_I	lduba	[%r19, + 0x0000] %asi, %r17
	.word 0x8780204f  ! 193: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xea970e80  ! 194: LDUHA_R	lduha	[%r28, %r0] 0x74, %r21
	.word 0xe4b76000  ! 195: STHA_I	stha	%r18, [%r29 + 0x0000] %asi
	.word 0xec9c8400  ! 196: LDDA_R	ldda	[%r18, %r0] 0x20, %r22
	.word 0xe8a48400  ! 197: STWA_R	stwa	%r20, [%r18 + %r0] 0x20
	.word 0xe4bc0400  ! 198: STDA_R	stda	%r18, [%r16 + %r0] 0x20
	.word 0x87802020  ! 199: WRASI_I	wr	%r0, 0x0020, %asi
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_1:
	.word 0xe4d5e000  ! 2: LDSHA_I	ldsha	[%r23, + 0x0000] %asi, %r18
	mov	0x50, %r26
	.word 0x87802074  ! 4: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0xe4b7ce80  ! 5: STHA_R	stha	%r18, [%r31 + %r0] 0x74
	.word 0xecde89e0  ! 6: LDXA_R	ldxa	[%r26, %r0] 0x4f, %r22
	.word 0x8780204f  ! 7: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xe0a44400  ! 8: STWA_R	stwa	%r16, [%r17 + %r0] 0x20
	.word 0xecb40400  ! 9: STHA_R	stha	%r22, [%r16 + %r0] 0x20
	rd	%asr26, %g1
halt_resume_1_0:
	wr	%g1, 1, %asr26
!$EV trig_pc_d(1,expr(@VA(.MAIN.halt_resume_1_0), 16, 16)) -> intp(1, 3, 4)
	nop
	.word 0x01000000  ! 10: NOP	nop
	.word 0xe2af4e60  ! 11: STBA_R	stba	%r17, [%r29 + %r0] 0x73
	.word 0xec87ce60  ! 12: LDUWA_R	lduwa	[%r31, %r0] 0x73, %r22
	rd	%asr26, %g1
halt_resume_1_1:
	wr	%g1, 1, %asr26
!$EV trig_pc_d(1,expr(@VA(.MAIN.halt_resume_1_1), 16, 16)) -> intp(1, 3, 4)
	nop
	.word 0x01000000  ! 13: NOP	nop
	rd	%asr26, %g1
halt_resume_1_2:
	wr	%g1, 1, %asr26
!$EV trig_pc_d(1,expr(@VA(.MAIN.halt_resume_1_2), 16, 16)) -> intp(1, 3, 4)
	nop
	.word 0x01000000  ! 14: NOP	nop
	.word 0x87802073  ! 15: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0xe2f7e000  ! 16: STXA_I	stxa	%r17, [%r31 + 0x0000] %asi
	.word 0xeebf8e40  ! 17: STDA_R	stda	%r23, [%r30 + %r0] 0x72
	.word 0x87802073  ! 18: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0xea8584a0  ! 19: LDUWA_R	lduwa	[%r22, %r0] 0x25, %r21
	.word 0x87802025  ! 20: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0xecf5e000  ! 21: STXA_I	stxa	%r22, [%r23 + 0x0000] %asi
	.word 0x8780204f  ! 22: WRASI_I	wr	%r0, 0x004f, %asi
	rd	%asr26, %g1
halt_resume_1_3:
	wr	%g1, 1, %asr26
!$EV trig_pc_d(1,expr(@VA(.MAIN.halt_resume_1_3), 16, 16)) -> intp(1, 3, 4)
	nop
	.word 0x01000000  ! 23: NOP	nop
	.word 0xe28cc400  ! 24: LDUBA_R	lduba	[%r19, %r0] 0x20, %r17
	.word 0x87802025  ! 25: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0xe687e000  ! 26: LDUWA_I	lduwa	[%r31, + 0x0000] %asi, %r19
	.word 0x8780204f  ! 27: WRASI_I	wr	%r0, 0x004f, %asi
	rd	%asr26, %g1
halt_resume_1_4:
	wr	%g1, 1, %asr26
!$EV trig_pc_d(1,expr(@VA(.MAIN.halt_resume_1_4), 16, 16)) -> intp(1, 3, 4)
	nop
	.word 0x01000000  ! 28: NOP	nop
	.word 0xe6a7e000  ! 29: STWA_I	stwa	%r19, [%r31 + 0x0000] %asi
	.word 0xe6bc8400  ! 30: STDA_R	stda	%r19, [%r18 + %r0] 0x20
	.word 0xee8d04a0  ! 31: LDUBA_R	lduba	[%r20, %r0] 0x25, %r23
	rd	%asr26, %g1
halt_resume_1_5:
	wr	%g1, 1, %asr26
!$EV trig_pc_d(1,expr(@VA(.MAIN.halt_resume_1_5), 16, 16)) -> intp(1, 3, 4)
	nop
	.word 0x01000000  ! 32: NOP	nop
	.word 0xe2dd84a0  ! 33: LDXA_R	ldxa	[%r22, %r0] 0x25, %r17
	rd	%asr26, %g1
halt_resume_1_6:
	wr	%g1, 1, %asr26
!$EV trig_pc_d(1,expr(@VA(.MAIN.halt_resume_1_6), 16, 16)) -> intp(1, 3, 4)
	nop
	.word 0x01000000  ! 34: NOP	nop
	.word 0xe0f78e80  ! 35: STXA_R	stxa	%r16, [%r30 + %r0] 0x74
	.word 0xeaa5c4a0  ! 36: STWA_R	stwa	%r21, [%r23 + %r0] 0x25
	.word 0xe287e000  ! 37: LDUWA_I	lduwa	[%r31, + 0x0000] %asi, %r17
	.word 0xe2c72000  ! 38: LDSWA_I	ldswa	[%r28, + 0x0000] %asi, %r17
	.word 0xe2df2000  ! 39: LDXA_I	ldxa	[%r28, + 0x0000] %asi, %r17
	.word 0xeec48400  ! 40: LDSWA_R	ldswa	[%r18, %r0] 0x20, %r23
	.word 0xea844400  ! 41: LDUWA_R	lduwa	[%r17, %r0] 0x20, %r21
	.word 0xe49f8e80  ! 42: LDDA_R	ldda	[%r30, %r0] 0x74, %r18
	.word 0x87802020  ! 43: WRASI_I	wr	%r0, 0x0020, %asi
	rd	%asr26, %g1
halt_resume_1_7:
	wr	%g1, 1, %asr26
!$EV trig_pc_d(1,expr(@VA(.MAIN.halt_resume_1_7), 16, 16)) -> intp(1, 3, 4)
	nop
	.word 0x01000000  ! 44: NOP	nop
	rd	%asr26, %g1
halt_resume_1_8:
	wr	%g1, 1, %asr26
!$EV trig_pc_d(1,expr(@VA(.MAIN.halt_resume_1_8), 16, 16)) -> intp(1, 3, 4)
	nop
	.word 0x01000000  ! 45: NOP	nop
	.word 0xecb5a000  ! 46: STHA_I	stha	%r22, [%r22 + 0x0000] %asi
	.word 0x87802025  ! 47: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0xe2d4c400  ! 48: LDSHA_R	ldsha	[%r19, %r0] 0x20, %r17
	.word 0xeebf6000  ! 49: STDA_I	stda	%r23, [%r29 + 0x0000] %asi
	.word 0xeed7a000  ! 50: LDSHA_I	ldsha	[%r30, + 0x0000] %asi, %r23
	.word 0xeccd44a0  ! 51: LDSBA_R	ldsba	[%r21, %r0] 0x25, %r22
	.word 0xe2c7e000  ! 52: LDSWA_I	ldswa	[%r31, + 0x0000] %asi, %r17
	.word 0xe2c72000  ! 53: LDSWA_I	ldswa	[%r28, + 0x0000] %asi, %r17
	.word 0xe2d76000  ! 54: LDSHA_I	ldsha	[%r29, + 0x0000] %asi, %r17
	rd	%asr26, %g1
halt_resume_1_9:
	wr	%g1, 1, %asr26
!$EV trig_pc_d(1,expr(@VA(.MAIN.halt_resume_1_9), 16, 16)) -> intp(1, 3, 4)
	nop
	.word 0x01000000  ! 55: NOP	nop
	.word 0xe2f72000  ! 56: STXA_I	stxa	%r17, [%r28 + 0x0000] %asi
	.word 0xe2bf6000  ! 57: STDA_I	stda	%r17, [%r29 + 0x0000] %asi
	.word 0xe4bc8400  ! 58: STDA_R	stda	%r18, [%r18 + %r0] 0x20
	.word 0x87802072  ! 59: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0xeed56000  ! 60: LDSHA_I	ldsha	[%r21, + 0x0000] %asi, %r23
	.word 0x87802072  ! 61: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0xee8c2000  ! 62: LDUBA_I	lduba	[%r16, + 0x0000] %asi, %r23
	.word 0x87802020  ! 63: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xecaec9e0  ! 64: STBA_R	stba	%r22, [%r27 + %r0] 0x4f
	.word 0xecf4e000  ! 65: STXA_I	stxa	%r22, [%r19 + 0x0000] %asi
	.word 0xe8cd04a0  ! 66: LDSBA_R	ldsba	[%r20, %r0] 0x25, %r20
	.word 0x87802074  ! 67: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0xe48649e0  ! 68: LDUWA_R	lduwa	[%r25, %r0] 0x4f, %r18
	.word 0xe8a62000  ! 69: STWA_I	stwa	%r20, [%r24 + 0x0000] %asi
	.word 0xe6cdc4a0  ! 70: LDSBA_R	ldsba	[%r23, %r0] 0x25, %r19
	.word 0x87802073  ! 71: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0xeaae2000  ! 72: STBA_I	stba	%r21, [%r24 + 0x0000] %asi
	.word 0xe2978e60  ! 73: LDUHA_R	lduha	[%r30, %r0] 0x73, %r17
	mov	0x3c8, %r20
	.word 0xe09e6000  ! 75: LDDA_I	ldda	[%r25, + 0x0000] %asi, %r16
	.word 0xe09ea000  ! 76: LDDA_I	ldda	[%r26, + 0x0000] %asi, %r16
	.word 0xe0d689e0  ! 77: LDSHA_R	ldsha	[%r26, %r0] 0x4f, %r16
	.word 0xe6bee000  ! 78: STDA_I	stda	%r19, [%r27 + 0x0000] %asi
	.word 0xeaa78e40  ! 79: STWA_R	stwa	%r21, [%r30 + %r0] 0x72
	rd	%asr26, %g1
halt_resume_1_10:
	wr	%g1, 1, %asr26
!$EV trig_pc_d(1,expr(@VA(.MAIN.halt_resume_1_10), 16, 16)) -> intp(1, 3, 4)
	nop
	.word 0x01000000  ! 80: NOP	nop
	.word 0xeacea000  ! 81: LDSBA_I	ldsba	[%r26, + 0x0000] %asi, %r21
	.word 0xe4a5c4a0  ! 82: STWA_R	stwa	%r18, [%r23 + %r0] 0x25
	rd	%asr26, %g1
halt_resume_1_11:
	wr	%g1, 1, %asr26
!$EV trig_pc_d(1,expr(@VA(.MAIN.halt_resume_1_11), 16, 16)) -> intp(1, 3, 4)
	nop
	.word 0x01000000  ! 83: NOP	nop
	.word 0xecc6e000  ! 84: LDSWA_I	ldswa	[%r27, + 0x0000] %asi, %r22
	.word 0x8780204f  ! 85: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xecf7e000  ! 86: STXA_I	stxa	%r22, [%r31 + 0x0000] %asi
	.word 0xec9f6000  ! 87: LDDA_I	ldda	[%r29, + 0x0000] %asi, %r22
	.word 0xe8bd04a0  ! 88: STDA_R	stda	%r20, [%r20 + %r0] 0x25
	.word 0xe2c76000  ! 89: LDSWA_I	ldswa	[%r29, + 0x0000] %asi, %r17
	.word 0xe0dfce60  ! 90: LDXA_R	ldxa	[%r31, %r0] 0x73, %r16
	.word 0xee8f2000  ! 91: LDUBA_I	lduba	[%r28, + 0x0000] %asi, %r23
	.word 0xee8fa000  ! 92: LDUBA_I	lduba	[%r30, + 0x0000] %asi, %r23
	.word 0xee8fa000  ! 93: LDUBA_I	lduba	[%r30, + 0x0000] %asi, %r23
	rd	%asr26, %g1
halt_resume_1_12:
	wr	%g1, 1, %asr26
!$EV trig_pc_d(1,expr(@VA(.MAIN.halt_resume_1_12), 16, 16)) -> intp(1, 3, 4)
	nop
	.word 0x01000000  ! 94: NOP	nop
	.word 0x87802072  ! 95: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0xe8bc0400  ! 96: STDA_R	stda	%r20, [%r16 + %r0] 0x20
	rd	%asr26, %g1
halt_resume_1_13:
	wr	%g1, 1, %asr26
!$EV trig_pc_d(1,expr(@VA(.MAIN.halt_resume_1_13), 16, 16)) -> intp(1, 3, 4)
	nop
	.word 0x01000000  ! 97: NOP	nop
	.word 0xe6af2000  ! 98: STBA_I	stba	%r19, [%r28 + 0x0000] %asi
	.word 0x87802025  ! 99: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0xe8844400  ! 100: LDUWA_R	lduwa	[%r17, %r0] 0x20, %r20
	.word 0xe0cf8e40  ! 101: LDSBA_R	ldsba	[%r30, %r0] 0x72, %r16
	.word 0xecaf2000  ! 102: STBA_I	stba	%r22, [%r28 + 0x0000] %asi
	.word 0xecb72000  ! 103: STHA_I	stha	%r22, [%r28 + 0x0000] %asi
	.word 0xeca76000  ! 104: STWA_I	stwa	%r22, [%r29 + 0x0000] %asi
	.word 0xecdf6000  ! 105: LDXA_I	ldxa	[%r29, + 0x0000] %asi, %r22
	.word 0xecac0400  ! 106: STBA_R	stba	%r22, [%r16 + %r0] 0x20
	.word 0xeec74e40  ! 107: LDSWA_R	ldswa	[%r29, %r0] 0x72, %r23
	mov	0x7e8, %r22
	.word 0xe28fa000  ! 109: LDUBA_I	lduba	[%r30, + 0x0000] %asi, %r17
	.word 0xeab6c9e0  ! 110: STHA_R	stha	%r21, [%r27 + %r0] 0x4f
	.word 0x87802025  ! 111: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0xe8c70e40  ! 112: LDSWA_R	ldswa	[%r28, %r0] 0x72, %r20
	rd	%asr26, %g1
halt_resume_1_14:
	wr	%g1, 1, %asr26
!$EV trig_pc_d(1,expr(@VA(.MAIN.halt_resume_1_14), 16, 16)) -> intp(1, 3, 4)
	nop
	.word 0x01000000  ! 113: NOP	nop
	.word 0xecaf8e60  ! 114: STBA_R	stba	%r22, [%r30 + %r0] 0x73
	.word 0xe0bc8400  ! 115: STDA_R	stda	%r16, [%r18 + %r0] 0x20
	rd	%asr26, %g1
halt_resume_1_15:
	wr	%g1, 1, %asr26
!$EV trig_pc_d(1,expr(@VA(.MAIN.halt_resume_1_15), 16, 16)) -> intp(1, 3, 4)
	nop
	.word 0x01000000  ! 116: NOP	nop
	rd	%asr26, %g1
halt_resume_1_16:
	wr	%g1, 1, %asr26
!$EV trig_pc_d(1,expr(@VA(.MAIN.halt_resume_1_16), 16, 16)) -> intp(1, 3, 4)
	nop
	.word 0x01000000  ! 117: NOP	nop
	.word 0xe0bc2000  ! 118: STDA_I	stda	%r16, [%r16 + 0x0000] %asi
	.word 0x87802020  ! 119: WRASI_I	wr	%r0, 0x0020, %asi
	rd	%asr26, %g1
halt_resume_1_17:
	wr	%g1, 1, %asr26
!$EV trig_pc_d(1,expr(@VA(.MAIN.halt_resume_1_17), 16, 16)) -> intp(1, 3, 4)
	nop
	.word 0x01000000  ! 120: NOP	nop
	rd	%asr26, %g1
halt_resume_1_18:
	wr	%g1, 1, %asr26
!$EV trig_pc_d(1,expr(@VA(.MAIN.halt_resume_1_18), 16, 16)) -> intp(1, 3, 4)
	nop
	.word 0x01000000  ! 121: NOP	nop
	.word 0xecb74e60  ! 122: STHA_R	stha	%r22, [%r29 + %r0] 0x73
	.word 0xec9f4e60  ! 123: LDDA_R	ldda	[%r29, %r0] 0x73, %r22
	.word 0xe687a000  ! 124: LDUWA_I	lduwa	[%r30, + 0x0000] %asi, %r19
	.word 0xe6a76000  ! 125: STWA_I	stwa	%r19, [%r29 + 0x0000] %asi
	.word 0xeab584a0  ! 126: STHA_R	stha	%r21, [%r22 + %r0] 0x25
	.word 0xe0ac8400  ! 127: STBA_R	stba	%r16, [%r18 + %r0] 0x20
	rd	%asr26, %g1
halt_resume_1_19:
	wr	%g1, 1, %asr26
!$EV trig_pc_d(1,expr(@VA(.MAIN.halt_resume_1_19), 16, 16)) -> intp(1, 3, 4)
	nop
	.word 0x01000000  ! 128: NOP	nop
	.word 0xe0ac8400  ! 129: STBA_R	stba	%r16, [%r18 + %r0] 0x20
	rd	%asr26, %g1
halt_resume_1_20:
	wr	%g1, 1, %asr26
!$EV trig_pc_d(1,expr(@VA(.MAIN.halt_resume_1_20), 16, 16)) -> intp(1, 3, 4)
	nop
	.word 0x01000000  ! 130: NOP	nop
	.word 0xe8b7a000  ! 131: STHA_I	stha	%r20, [%r30 + 0x0000] %asi
	.word 0x8780204f  ! 132: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xe8dfe000  ! 133: LDXA_I	ldxa	[%r31, + 0x0000] %asi, %r20
	.word 0xeca609e0  ! 134: STWA_R	stwa	%r22, [%r24 + %r0] 0x4f
	.word 0xea8fe000  ! 135: LDUBA_I	lduba	[%r31, + 0x0000] %asi, %r21
	.word 0xecb48400  ! 136: STHA_R	stha	%r22, [%r18 + %r0] 0x20
	.word 0xe2af4e60  ! 137: STBA_R	stba	%r17, [%r29 + %r0] 0x73
	.word 0xeebfa000  ! 138: STDA_I	stda	%r23, [%r30 + 0x0000] %asi
	.word 0xee95c4a0  ! 139: LDUHA_R	lduha	[%r23, %r0] 0x25, %r23
	mov	0x28, %r25
	mov	0x18, %r24
	.word 0xe09f0e40  ! 142: LDDA_R	ldda	[%r28, %r0] 0x72, %r16
	rd	%asr26, %g1
halt_resume_1_21:
	wr	%g1, 1, %asr26
!$EV trig_pc_d(1,expr(@VA(.MAIN.halt_resume_1_21), 16, 16)) -> intp(1, 3, 4)
	nop
	.word 0x01000000  ! 143: NOP	nop
	.word 0xe6a7ce60  ! 144: STWA_R	stwa	%r19, [%r31 + %r0] 0x73
	mov	0x0, %r19
	.word 0xeecf6000  ! 146: LDSBA_I	ldsba	[%r29, + 0x0000] %asi, %r23
	.word 0xead4c400  ! 147: LDSHA_R	ldsha	[%r19, %r0] 0x20, %r21
	mov	0x0, %r26
	.word 0xe4cc8400  ! 149: LDSBA_R	ldsba	[%r18, %r0] 0x20, %r18
	.word 0xead76000  ! 150: LDSHA_I	ldsha	[%r29, + 0x0000] %asi, %r21
	.word 0xe0f74e80  ! 151: STXA_R	stxa	%r16, [%r29 + %r0] 0x74
	.word 0xe0d4c400  ! 152: LDSHA_R	ldsha	[%r19, %r0] 0x20, %r16
	.word 0xe09fe000  ! 153: LDDA_I	ldda	[%r31, + 0x0000] %asi, %r16
	.word 0x87802020  ! 154: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xec8f4e40  ! 155: LDUBA_R	lduba	[%r29, %r0] 0x72, %r22
	.word 0xe6cfa000  ! 156: LDSBA_I	ldsba	[%r30, + 0x0000] %asi, %r19
	.word 0xeccc4400  ! 157: LDSBA_R	ldsba	[%r17, %r0] 0x20, %r22
	.word 0xe0cfa000  ! 158: LDSBA_I	ldsba	[%r30, + 0x0000] %asi, %r16
	.word 0x87802073  ! 159: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0xe0ad84a0  ! 160: STBA_R	stba	%r16, [%r22 + %r0] 0x25
	.word 0xe8bfa000  ! 161: STDA_I	stda	%r20, [%r30 + 0x0000] %asi
	mov	0x58, %r27
	.word 0xe2cf0e80  ! 163: LDSBA_R	ldsba	[%r28, %r0] 0x74, %r17
	.word 0xe8f40400  ! 164: STXA_R	stxa	%r20, [%r16 + %r0] 0x20
	mov	0x18, %r16
	.word 0xe6f40400  ! 166: STXA_R	stxa	%r19, [%r16 + %r0] 0x20
	.word 0xea8f2000  ! 167: LDUBA_I	lduba	[%r28, + 0x0000] %asi, %r21
	.word 0x87802025  ! 168: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0xe28fce60  ! 169: LDUBA_R	lduba	[%r31, %r0] 0x73, %r17
	mov	0x28, %r24
	rd	%asr26, %g1
halt_resume_1_22:
	wr	%g1, 1, %asr26
!$EV trig_pc_d(1,expr(@VA(.MAIN.halt_resume_1_22), 16, 16)) -> intp(1, 3, 4)
	nop
	.word 0x01000000  ! 171: NOP	nop
	.word 0xe48e49e0  ! 172: LDUBA_R	lduba	[%r25, %r0] 0x4f, %r18
	.word 0xe4972000  ! 173: LDUHA_I	lduha	[%r28, + 0x0000] %asi, %r18
	.word 0xe48f6000  ! 174: LDUBA_I	lduba	[%r29, + 0x0000] %asi, %r18
	.word 0xe8a649e0  ! 175: STWA_R	stwa	%r20, [%r25 + %r0] 0x4f
	.word 0xe0ce09e0  ! 176: LDSBA_R	ldsba	[%r24, %r0] 0x4f, %r16
	.word 0xe6b7ce60  ! 177: STHA_R	stha	%r19, [%r31 + %r0] 0x73
	.word 0xe49584a0  ! 178: LDUHA_R	lduha	[%r22, %r0] 0x25, %r18
	.word 0xe6b7a000  ! 179: STHA_I	stha	%r19, [%r30 + 0x0000] %asi
	.word 0xe6af6000  ! 180: STBA_I	stba	%r19, [%r29 + 0x0000] %asi
	.word 0xe6dfa000  ! 181: LDXA_I	ldxa	[%r30, + 0x0000] %asi, %r19
	.word 0xe6dfe000  ! 182: LDXA_I	ldxa	[%r31, + 0x0000] %asi, %r19
	.word 0xe8d44400  ! 183: LDSHA_R	ldsha	[%r17, %r0] 0x20, %r20
	.word 0x87802074  ! 184: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0xeedca000  ! 185: LDXA_I	ldxa	[%r18, + 0x0000] %asi, %r23
	.word 0xe2f40400  ! 186: STXA_R	stxa	%r17, [%r16 + %r0] 0x20
	.word 0xea8c6000  ! 187: LDUBA_I	lduba	[%r17, + 0x0000] %asi, %r21
	rd	%asr26, %g1
halt_resume_1_23:
	wr	%g1, 1, %asr26
!$EV trig_pc_d(1,expr(@VA(.MAIN.halt_resume_1_23), 16, 16)) -> intp(1, 3, 4)
	nop
	.word 0x01000000  ! 188: NOP	nop
	rd	%asr26, %g1
halt_resume_1_24:
	wr	%g1, 1, %asr26
!$EV trig_pc_d(1,expr(@VA(.MAIN.halt_resume_1_24), 16, 16)) -> intp(1, 3, 4)
	nop
	.word 0x01000000  ! 189: NOP	nop
	mov	0x7f0, %r23
	.word 0xe2bf4e80  ! 191: STDA_R	stda	%r17, [%r29 + %r0] 0x74
	.word 0xe28c2000  ! 192: LDUBA_I	lduba	[%r16, + 0x0000] %asi, %r17
	.word 0x87802072  ! 193: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0xea96c9e0  ! 194: LDUHA_R	lduha	[%r27, %r0] 0x4f, %r21
	.word 0xe4b7a000  ! 195: STHA_I	stha	%r18, [%r30 + 0x0000] %asi
	.word 0xe09f0e40  ! 196: LDDA_R	ldda	[%r28, %r0] 0x72, %r16
	.word 0xe2a4c400  ! 197: STWA_R	stwa	%r17, [%r19 + %r0] 0x20
	.word 0xe6bf8e80  ! 198: STDA_R	stda	%r19, [%r30 + %r0] 0x74
	.word 0x87802020  ! 199: WRASI_I	wr	%r0, 0x0020, %asi

join_lbl_0_0:
!		$EV trig_pc_d(1,expr(@VA(.RED_EXT_SEC.HRedmode_Reset_Handler) + 4, 16, 16)) -> intp(1, 1, 1)
!		$EV trig_pc_d(1,expr(@VA(.RED_EXT_SEC.HRedmode_Reset_Handler) + 8, 16, 16)) -> intp(2, 1, 1)
!		$EV trig_pc_d(1,expr(@VA(.RED_EXT_SEC.HRedmode_Reset_Handler) + 12, 16, 16)) -> intp(3, 1, 1)
	.data
data_start:

	.xword	0xad13d562f7a69686
	.xword	0x101c06c124264ba7
	.xword	0xf130e1d51267a7bc
	.xword	0x6046b42c4c1928c8
	.xword	0xd6bb6c4d2232e8a5
	.xword	0xcc7a1b0994c29a4d
	.xword	0xfc43aa52ab31c970
	.xword	0x7880d3f3e8aaf878
	.xword	0x20b756d1c199eaf8
	.xword	0x561888616b49b1e2
	.xword	0x79f65b654e6f4f95
	.xword	0xdd0b3e55cc501a80
	.xword	0x711a4d0fa8aecc5d
	.xword	0x099ae0f1f73fe0d5
	.xword	0x1e15eaa9be9bf09b
	.xword	0x9c847e47e83226c1



.text
	ta	T_GOOD_TRAP

.data
	.xword 0x1234567887654321

#if 0
!!# /* File:	tlu_sus_res_1.j
!!#  * Description:
!!#  * This temple is targets the suspend_resume coverage object, by interseting
!!#  * halt instructions and resume interrupt events in between the asi access
!!#  */
!!# 
!!# template main ();
!!# 
!!# 
!!# %%section c_declarations
!!# 
!!#   int i, j;
!!#   int loop_cnt = 0;
!!# 
!!#   my_imm_asi_to_rvar (int line, int rv_ro, field_type_t fld, void *data);
!!# 
!!# %%section init
!!# 
!!#   static int asi_rvar_array[6] = {Rv_20, Rv_25, Rv_4f, Rv_72_73_74, Rv_72_73_74, Rv_72_73_74};
!!# 
!!#   IJ_bind_thread_group(th_all, 0xf);
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
!!#   return 0;
!!# 	
!!# %%section finish
!!# 
!!#   IJ_th_join(0xf);
!!#   IJ_th_start (Seq_Start, NULL, 1);
!!# 
!!#   IJ_printf (th_all, "\t.data\ndata_start:\n\n");
!!#   for (i = 0; i < 16; i++) {
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
!!# 	| halt_resume
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
!!# halt_resume: tNOP
!!# 	{
!!#           IJ_printf (th_all, "\trd\t%%asr26, %%g1\n");
!!#           IJ_printf (th_all, "halt_resume_%y_%d:\n", loop_cnt);
!!#           IJ_printf (th_all, "\twr\t%%g1, 1, %%asr26\n");
!!# 	  IJ_printf (th_all, "!$EV trig_pc_d(%y,expr(@VA(.MAIN.halt_resume_%y_%d), 16, 16)) -> intp(%y, 3, %d)\n", loop_cnt, Rv_intr_vect);
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
