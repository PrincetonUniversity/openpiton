// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: sus_res_11.s
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
   random seed:	886260986
   Jal tlu_sus_res_11.j:	
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

	setx 0xfd94fab0ea3b9dc2, %g1, %g0
	setx 0x4aa484c39433f47b, %g1, %g1
	setx 0xd000ed49e05375ad, %g1, %g2
	setx 0x28b638b5cfd9f7be, %g1, %g3
	setx 0x9ed37f5a2c71f0b4, %g1, %g4
	setx 0xdbc13a90e089ab5a, %g1, %g5
	setx 0xf1861108d24f8816, %g1, %g6
	setx 0xb97bd1f1fcb40e42, %g1, %g7
	setx 0x5fbd0b39b02aefcb, %g1, %r16
	setx 0x80f9a2f1656c47f7, %g1, %r17
	setx 0xa22e0fddbe743acc, %g1, %r18
	setx 0xb37b9d0651ceb7aa, %g1, %r19
	setx 0x7c7e96bfbc07f99d, %g1, %r20
	setx 0x0f501831cefa9908, %g1, %r21
	setx 0xf26b287430258eaf, %g1, %r22
	setx 0x2b13d44196bf5e01, %g1, %r23
	setx 0x98694f7c07222a0a, %g1, %r24
	setx 0x1f931ae5e32e1613, %g1, %r25
	setx 0x12cb6773156a1763, %g1, %r26
	setx 0x46b7ebdad2e5478b, %g1, %r27
	setx 0xf1cf6fb9bf54e83c, %g1, %r28
	setx 0xe989dc1c9b05c7de, %g1, %r29
	setx 0xc56fd5bc4242ec1f, %g1, %r30
	setx 0xb2ffa86dd5ca9a22, %g1, %r31
	save
	setx 0x8e216c6fe040fe33, %g1, %r16
	setx 0x92eb8267de0fcf70, %g1, %r17
	setx 0xd38a8095892a47c8, %g1, %r18
	setx 0x5727e8cb7ed07ffe, %g1, %r19
	setx 0x5309b213f9c8ed44, %g1, %r20
	setx 0x937e762e002b4bef, %g1, %r21
	setx 0x1668f31aa050fd12, %g1, %r22
	setx 0x843dc76093797e7f, %g1, %r23
	setx 0x79d96289beafe530, %g1, %r24
	setx 0x41c042a73ed71eb8, %g1, %r25
	setx 0x4e61b82fd6fe468e, %g1, %r26
	setx 0xcab7213371333dae, %g1, %r27
	setx 0x9fa68d2fdba870c0, %g1, %r28
	setx 0xe940c5e8bb141659, %g1, %r29
	setx 0x707c84bd19ea4475, %g1, %r30
	setx 0x46a8d5922593159d, %g1, %r31
	save
	setx 0xa273a96b4a5a964f, %g1, %r16
	setx 0x01ff219f8c8b6921, %g1, %r17
	setx 0x2c9a128f65ab8b4d, %g1, %r18
	setx 0x81cc84d69d8e50f8, %g1, %r19
	setx 0x05c8bd5e70ee127f, %g1, %r20
	setx 0x4a3cd42584ae5337, %g1, %r21
	setx 0xa9104bb510f57cec, %g1, %r22
	setx 0xe1324fb0ea9fd645, %g1, %r23
	setx 0xc0cfb864e2bd0193, %g1, %r24
	setx 0x1cda4180d3c1579d, %g1, %r25
	setx 0x07e2c62af3c17b96, %g1, %r26
	setx 0x82c3d9dbb9d70dcd, %g1, %r27
	setx 0x461841946ecd9361, %g1, %r28
	setx 0xc8cebd4e6c11db2b, %g1, %r29
	setx 0x561b1f195f69f723, %g1, %r30
	setx 0xf062a5ab5ed0b946, %g1, %r31
	restore
	setx	data_start, %r1, %r25
	mov	0x30, %r16
	mov	0x58, %r17
	mov	0x8, %r18
	mov	0x0, %r19
	mov	0x3e8, %r20
	mov	0x7c0, %r21
	mov	0x3d8, %r22
	mov	0x3d0, %r23
	mov	0x70, %r24
	mov	0x20, %r25
	mov	0x70, %r26
	mov	0x78, %r27
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
	mov	0x8, %r16
	rd	%asr26, %g1
halt_hwintr_0_0:
	wr	%g1, 1, %asr26
!$EV trig_pc_d(0,expr(@VA(.MAIN.halt_hwintr_0_0), 16, 16)) -> intp(0, 0, 4)
	nop
	.word 0x01000000  ! 2: NOP	nop
	.word 0x87802020  ! 3: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0x87802020  ! 4: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0x87802025  ! 5: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0xe6a5a000  ! 6: STWA_I	stwa	%r19, [%r22 + 0x0000] %asi
	.word 0xe6f52000  ! 7: STXA_I	stxa	%r19, [%r20 + 0x0000] %asi
	rd	%asr26, %g1
halt_hwintr_0_1:
	wr	%g1, 1, %asr26
!$EV trig_pc_d(0,expr(@VA(.MAIN.halt_hwintr_0_1), 16, 16)) -> intp(0, 0, 4)
	nop
	.word 0x01000000  ! 8: NOP	nop
	rd	%asr26, %g1
halt_hwintr_0_2:
	wr	%g1, 1, %asr26
!$EV trig_pc_d(0,expr(@VA(.MAIN.halt_hwintr_0_2), 16, 16)) -> intp(0, 0, 4)
	nop
	.word 0x01000000  ! 9: NOP	nop
	.word 0xe6dd2000  ! 10: LDXA_I	ldxa	[%r20, + 0x0000] %asi, %r19
	rd	%asr26, %g1
halt_hwintr_0_3:
	wr	%g1, 1, %asr26
!$EV trig_pc_d(0,expr(@VA(.MAIN.halt_hwintr_0_3), 16, 16)) -> intp(0, 0, 4)
	nop
	.word 0x01000000  ! 11: NOP	nop
	.word 0xec8f4e80  ! 12: LDUBA_R	lduba	[%r29, %r0] 0x74, %r22
	rd	%asr26, %g1
halt_hwintr_0_4:
	wr	%g1, 1, %asr26
!$EV trig_pc_d(0,expr(@VA(.MAIN.halt_hwintr_0_4), 16, 16)) -> intp(0, 0, 4)
	nop
	.word 0x01000000  ! 13: NOP	nop
	.word 0xecade000  ! 14: STBA_I	stba	%r22, [%r23 + 0x0000] %asi
	rd	%asr26, %g1
halt_hwintr_0_5:
	wr	%g1, 1, %asr26
!$EV trig_pc_d(0,expr(@VA(.MAIN.halt_hwintr_0_5), 16, 16)) -> intp(0, 0, 4)
	nop
	.word 0x01000000  ! 15: NOP	nop
	.word 0xecc5e000  ! 16: LDSWA_I	ldswa	[%r23, + 0x0000] %asi, %r22
	mov	0x3f8, %r22
	.word 0x87802020  ! 18: WRASI_I	wr	%r0, 0x0020, %asi
	rd	%asr26, %g1
halt_hwintr_0_6:
	wr	%g1, 1, %asr26
!$EV trig_pc_d(0,expr(@VA(.MAIN.halt_hwintr_0_6), 16, 16)) -> intp(0, 0, 4)
	nop
	.word 0x01000000  ! 19: NOP	nop
	.word 0xe2944400  ! 20: LDUHA_R	lduha	[%r17, %r0] 0x20, %r17
	.word 0xe2c46000  ! 21: LDSWA_I	ldswa	[%r17, + 0x0000] %asi, %r17
	.word 0xe4b6c9e0  ! 22: STHA_R	stha	%r18, [%r27 + %r0] 0x4f
	.word 0xe4d4a000  ! 23: LDSHA_I	ldsha	[%r18, + 0x0000] %asi, %r18
	.word 0x8780204f  ! 24: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0x87802072  ! 25: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0xe4f7a000  ! 26: STXA_I	stxa	%r18, [%r30 + 0x0000] %asi
	.word 0xe4afa000  ! 27: STBA_I	stba	%r18, [%r30 + 0x0000] %asi
	.word 0xe4f7e000  ! 28: STXA_I	stxa	%r18, [%r31 + 0x0000] %asi
	.word 0xe8a40400  ! 29: STWA_R	stwa	%r20, [%r16 + %r0] 0x20
	.word 0xe6844400  ! 30: LDUWA_R	lduwa	[%r17, %r0] 0x20, %r19
	.word 0xeaa609e0  ! 31: STWA_R	stwa	%r21, [%r24 + %r0] 0x4f
	.word 0xecd4c400  ! 32: LDSHA_R	ldsha	[%r19, %r0] 0x20, %r22
	.word 0xe0bc8400  ! 33: STDA_R	stda	%r16, [%r18 + %r0] 0x20
	.word 0x87802020  ! 34: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe094e000  ! 35: LDUHA_I	lduha	[%r19, + 0x0000] %asi, %r16
	.word 0xe89f0e40  ! 36: LDDA_R	ldda	[%r28, %r0] 0x72, %r20
	.word 0xe6c40400  ! 37: LDSWA_R	ldswa	[%r16, %r0] 0x20, %r19
	.word 0xe68ce000  ! 38: LDUBA_I	lduba	[%r19, + 0x0000] %asi, %r19
	.word 0xe6f689e0  ! 39: STXA_R	stxa	%r19, [%r26 + %r0] 0x4f
	.word 0x87802025  ! 40: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0xe6a56000  ! 41: STWA_I	stwa	%r19, [%r21 + 0x0000] %asi
	.word 0xe4a74e60  ! 42: STWA_R	stwa	%r18, [%r29 + %r0] 0x73
	.word 0xe4bd6000  ! 43: STDA_I	stda	%r18, [%r21 + 0x0000] %asi
	.word 0xeeb5c4a0  ! 44: STHA_R	stha	%r23, [%r23 + %r0] 0x25
	rd	%asr26, %g1
halt_hwintr_0_7:
	wr	%g1, 1, %asr26
!$EV trig_pc_d(0,expr(@VA(.MAIN.halt_hwintr_0_7), 16, 16)) -> intp(0, 0, 4)
	nop
	.word 0x01000000  ! 45: NOP	nop
	rd	%asr26, %g1
halt_hwintr_0_8:
	wr	%g1, 1, %asr26
!$EV trig_pc_d(0,expr(@VA(.MAIN.halt_hwintr_0_8), 16, 16)) -> intp(0, 0, 4)
	nop
	.word 0x01000000  ! 46: NOP	nop
	rd	%asr26, %g1
halt_hwintr_0_9:
	wr	%g1, 1, %asr26
!$EV trig_pc_d(0,expr(@VA(.MAIN.halt_hwintr_0_9), 16, 16)) -> intp(0, 0, 4)
	nop
	.word 0x01000000  ! 47: NOP	nop
	.word 0x8780204f  ! 48: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xee978e80  ! 49: LDUHA_R	lduha	[%r30, %r0] 0x74, %r23
	rd	%asr26, %g1
halt_hwintr_0_10:
	wr	%g1, 1, %asr26
!$EV trig_pc_d(0,expr(@VA(.MAIN.halt_hwintr_0_10), 16, 16)) -> intp(0, 0, 4)
	nop
	.word 0x01000000  ! 50: NOP	nop
	.word 0xeec6e000  ! 51: LDSWA_I	ldswa	[%r27, + 0x0000] %asi, %r23
	.word 0xeea6a000  ! 52: STWA_I	stwa	%r23, [%r26 + 0x0000] %asi
	.word 0xeebe2000  ! 53: STDA_I	stda	%r23, [%r24 + 0x0000] %asi
	.word 0xe6f78e60  ! 54: STXA_R	stxa	%r19, [%r30 + %r0] 0x73
	.word 0xe6f6e000  ! 55: STXA_I	stxa	%r19, [%r27 + 0x0000] %asi
	rd	%asr26, %g1
halt_hwintr_0_11:
	wr	%g1, 1, %asr26
!$EV trig_pc_d(0,expr(@VA(.MAIN.halt_hwintr_0_11), 16, 16)) -> intp(0, 0, 4)
	nop
	.word 0x01000000  ! 56: NOP	nop
	.word 0x87802072  ! 57: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0xe6cf6000  ! 58: LDSBA_I	ldsba	[%r29, + 0x0000] %asi, %r19
	.word 0x87802020  ! 59: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0x87802020  ! 60: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0x87802072  ! 61: WRASI_I	wr	%r0, 0x0072, %asi
	rd	%asr26, %g1
halt_hwintr_0_12:
	wr	%g1, 1, %asr26
!$EV trig_pc_d(0,expr(@VA(.MAIN.halt_hwintr_0_12), 16, 16)) -> intp(0, 0, 4)
	nop
	.word 0x01000000  ! 62: NOP	nop
	rd	%asr26, %g1
halt_hwintr_0_13:
	wr	%g1, 1, %asr26
!$EV trig_pc_d(0,expr(@VA(.MAIN.halt_hwintr_0_13), 16, 16)) -> intp(0, 0, 4)
	nop
	.word 0x01000000  ! 63: NOP	nop
	mov	0x60, %r24
	.word 0x87802025  ! 65: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0xe6bde000  ! 66: STDA_I	stda	%r19, [%r23 + 0x0000] %asi
	.word 0xe6bde000  ! 67: STDA_I	stda	%r19, [%r23 + 0x0000] %asi
	.word 0xe6852000  ! 68: LDUWA_I	lduwa	[%r20, + 0x0000] %asi, %r19
	.word 0xe6d5e000  ! 69: LDSHA_I	ldsha	[%r23, + 0x0000] %asi, %r19
	.word 0xe6c48400  ! 70: LDSWA_R	ldswa	[%r18, %r0] 0x20, %r19
	.word 0xe6f5e000  ! 71: STXA_I	stxa	%r19, [%r23 + 0x0000] %asi
	mov	0x68, %r26
	.word 0x87802025  ! 73: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0xe6b5a000  ! 74: STHA_I	stha	%r19, [%r22 + 0x0000] %asi
	.word 0xe6cd6000  ! 75: LDSBA_I	ldsba	[%r21, + 0x0000] %asi, %r19
	.word 0xe6f52000  ! 76: STXA_I	stxa	%r19, [%r20 + 0x0000] %asi
	rd	%asr26, %g1
halt_hwintr_0_14:
	wr	%g1, 1, %asr26
!$EV trig_pc_d(0,expr(@VA(.MAIN.halt_hwintr_0_14), 16, 16)) -> intp(0, 0, 4)
	nop
	.word 0x01000000  ! 77: NOP	nop
	.word 0xe8f74e80  ! 78: STXA_R	stxa	%r20, [%r29 + %r0] 0x74
	.word 0xe4a7ce80  ! 79: STWA_R	stwa	%r18, [%r31 + %r0] 0x74
	.word 0xe485e000  ! 80: LDUWA_I	lduwa	[%r23, + 0x0000] %asi, %r18
	rd	%asr26, %g1
halt_hwintr_0_15:
	wr	%g1, 1, %asr26
!$EV trig_pc_d(0,expr(@VA(.MAIN.halt_hwintr_0_15), 16, 16)) -> intp(0, 0, 4)
	nop
	.word 0x01000000  ! 81: NOP	nop
	.word 0xe485e000  ! 82: LDUWA_I	lduwa	[%r23, + 0x0000] %asi, %r18
	.word 0xe4956000  ! 83: LDUHA_I	lduha	[%r21, + 0x0000] %asi, %r18
	rd	%asr26, %g1
halt_hwintr_0_16:
	wr	%g1, 1, %asr26
!$EV trig_pc_d(0,expr(@VA(.MAIN.halt_hwintr_0_16), 16, 16)) -> intp(0, 0, 4)
	nop
	.word 0x01000000  ! 84: NOP	nop
	.word 0xe0c649e0  ! 85: LDSWA_R	ldswa	[%r25, %r0] 0x4f, %r16
	.word 0xee8f4e80  ! 86: LDUBA_R	lduba	[%r29, %r0] 0x74, %r23
	.word 0x8780204f  ! 87: WRASI_I	wr	%r0, 0x004f, %asi
	rd	%asr26, %g1
halt_hwintr_0_17:
	wr	%g1, 1, %asr26
!$EV trig_pc_d(0,expr(@VA(.MAIN.halt_hwintr_0_17), 16, 16)) -> intp(0, 0, 4)
	nop
	.word 0x01000000  ! 88: NOP	nop
	.word 0xecf544a0  ! 89: STXA_R	stxa	%r22, [%r21 + %r0] 0x25
	.word 0xec8ea000  ! 90: LDUBA_I	lduba	[%r26, + 0x0000] %asi, %r22
	.word 0xea87ce40  ! 91: LDUWA_R	lduwa	[%r31, %r0] 0x72, %r21
	rd	%asr26, %g1
halt_hwintr_0_18:
	wr	%g1, 1, %asr26
!$EV trig_pc_d(0,expr(@VA(.MAIN.halt_hwintr_0_18), 16, 16)) -> intp(0, 0, 4)
	nop
	.word 0x01000000  ! 92: NOP	nop
	.word 0xe8a689e0  ! 93: STWA_R	stwa	%r20, [%r26 + %r0] 0x4f
	rd	%asr26, %g1
halt_hwintr_0_19:
	wr	%g1, 1, %asr26
!$EV trig_pc_d(0,expr(@VA(.MAIN.halt_hwintr_0_19), 16, 16)) -> intp(0, 0, 4)
	nop
	.word 0x01000000  ! 94: NOP	nop
	.word 0xeea544a0  ! 95: STWA_R	stwa	%r23, [%r21 + %r0] 0x25
	.word 0x87802072  ! 96: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0xe2948400  ! 97: LDUHA_R	lduha	[%r18, %r0] 0x20, %r17
	rd	%asr26, %g1
halt_hwintr_0_20:
	wr	%g1, 1, %asr26
!$EV trig_pc_d(0,expr(@VA(.MAIN.halt_hwintr_0_20), 16, 16)) -> intp(0, 0, 4)
	nop
	.word 0x01000000  ! 98: NOP	nop
	.word 0xecaf4e60  ! 99: STBA_R	stba	%r22, [%r29 + %r0] 0x73
	rd	%asr26, %g1
halt_hwintr_0_21:
	wr	%g1, 1, %asr26
!$EV trig_pc_d(0,expr(@VA(.MAIN.halt_hwintr_0_21), 16, 16)) -> intp(0, 0, 4)
	nop
	.word 0x01000000  ! 100: NOP	nop
	.word 0x87802020  ! 101: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xecb4a000  ! 102: STHA_I	stha	%r22, [%r18 + 0x0000] %asi
	rd	%asr26, %g1
halt_hwintr_0_22:
	wr	%g1, 1, %asr26
!$EV trig_pc_d(0,expr(@VA(.MAIN.halt_hwintr_0_22), 16, 16)) -> intp(0, 0, 4)
	nop
	.word 0x01000000  ! 103: NOP	nop
	.word 0xecf46000  ! 104: STXA_I	stxa	%r22, [%r17 + 0x0000] %asi
	.word 0xeccca000  ! 105: LDSBA_I	ldsba	[%r18, + 0x0000] %asi, %r22
	.word 0x87802074  ! 106: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0xecd7e000  ! 107: LDSHA_I	ldsha	[%r31, + 0x0000] %asi, %r22
	.word 0x87802074  ! 108: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0x87802073  ! 109: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0x8780204f  ! 110: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xe0be09e0  ! 111: STDA_R	stda	%r16, [%r24 + %r0] 0x4f
	mov	0x40, %r16
	rd	%asr26, %g1
halt_hwintr_0_23:
	wr	%g1, 1, %asr26
!$EV trig_pc_d(0,expr(@VA(.MAIN.halt_hwintr_0_23), 16, 16)) -> intp(0, 0, 4)
	nop
	.word 0x01000000  ! 113: NOP	nop
	.word 0xe0866000  ! 114: LDUWA_I	lduwa	[%r25, + 0x0000] %asi, %r16
	rd	%asr26, %g1
halt_hwintr_0_24:
	wr	%g1, 1, %asr26
!$EV trig_pc_d(0,expr(@VA(.MAIN.halt_hwintr_0_24), 16, 16)) -> intp(0, 0, 4)
	nop
	.word 0x01000000  ! 115: NOP	nop
	.word 0xe0a6a000  ! 116: STWA_I	stwa	%r16, [%r26 + 0x0000] %asi
	.word 0xe0f6e000  ! 117: STXA_I	stxa	%r16, [%r27 + 0x0000] %asi
	mov	0x70, %r26
	mov	0x3f8, %r22
	rd	%asr26, %g1
halt_hwintr_0_25:
	wr	%g1, 1, %asr26
!$EV trig_pc_d(0,expr(@VA(.MAIN.halt_hwintr_0_25), 16, 16)) -> intp(0, 0, 4)
	nop
	.word 0x01000000  ! 120: NOP	nop
	.word 0xe4afce80  ! 121: STBA_R	stba	%r18, [%r31 + %r0] 0x74
	rd	%asr26, %g1
halt_hwintr_0_26:
	wr	%g1, 1, %asr26
!$EV trig_pc_d(0,expr(@VA(.MAIN.halt_hwintr_0_26), 16, 16)) -> intp(0, 0, 4)
	nop
	.word 0x01000000  ! 122: NOP	nop
	.word 0xe2dcc400  ! 123: LDXA_R	ldxa	[%r19, %r0] 0x20, %r17
	.word 0xe2bee000  ! 124: STDA_I	stda	%r17, [%r27 + 0x0000] %asi
	.word 0x87802073  ! 125: WRASI_I	wr	%r0, 0x0073, %asi
	rd	%asr26, %g1
halt_hwintr_0_27:
	wr	%g1, 1, %asr26
!$EV trig_pc_d(0,expr(@VA(.MAIN.halt_hwintr_0_27), 16, 16)) -> intp(0, 0, 4)
	nop
	.word 0x01000000  ! 126: NOP	nop
	.word 0xe2b72000  ! 127: STHA_I	stha	%r17, [%r28 + 0x0000] %asi
	.word 0xe0a78e80  ! 128: STWA_R	stwa	%r16, [%r30 + %r0] 0x74
	rd	%asr26, %g1
halt_hwintr_0_28:
	wr	%g1, 1, %asr26
!$EV trig_pc_d(0,expr(@VA(.MAIN.halt_hwintr_0_28), 16, 16)) -> intp(0, 0, 4)
	nop
	.word 0x01000000  ! 129: NOP	nop
	.word 0xe0b72000  ! 130: STHA_I	stha	%r16, [%r28 + 0x0000] %asi
	.word 0xe0df6000  ! 131: LDXA_I	ldxa	[%r29, + 0x0000] %asi, %r16
	.word 0x87802025  ! 132: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0xe69544a0  ! 133: LDUHA_R	lduha	[%r21, %r0] 0x25, %r19
	.word 0x8780204f  ! 134: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xe8bc0400  ! 135: STDA_R	stda	%r20, [%r16 + %r0] 0x20
	.word 0xe4940400  ! 136: LDUHA_R	lduha	[%r16, %r0] 0x20, %r18
	.word 0xecb504a0  ! 137: STHA_R	stha	%r22, [%r20 + %r0] 0x25
	.word 0xead40400  ! 138: LDSHA_R	ldsha	[%r16, %r0] 0x20, %r21
	.word 0x87802072  ! 139: WRASI_I	wr	%r0, 0x0072, %asi
	mov	0x60, %r24
	mov	0x18, %r27
	.word 0xe4dd84a0  ! 142: LDXA_R	ldxa	[%r22, %r0] 0x25, %r18
	.word 0xe4afe000  ! 143: STBA_I	stba	%r18, [%r31 + 0x0000] %asi
	.word 0x87802020  ! 144: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe48ca000  ! 145: LDUBA_I	lduba	[%r18, + 0x0000] %asi, %r18
	.word 0xecc44400  ! 146: LDSWA_R	ldswa	[%r17, %r0] 0x20, %r22
	rd	%asr26, %g1
halt_hwintr_0_29:
	wr	%g1, 1, %asr26
!$EV trig_pc_d(0,expr(@VA(.MAIN.halt_hwintr_0_29), 16, 16)) -> intp(0, 0, 4)
	nop
	.word 0x01000000  ! 147: NOP	nop
	.word 0x8780204f  ! 148: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0x87802072  ! 149: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0xecdfa000  ! 150: LDXA_I	ldxa	[%r30, + 0x0000] %asi, %r22
	.word 0xeadc0400  ! 151: LDXA_R	ldxa	[%r16, %r0] 0x20, %r21
	rd	%asr26, %g1
halt_hwintr_0_30:
	wr	%g1, 1, %asr26
!$EV trig_pc_d(0,expr(@VA(.MAIN.halt_hwintr_0_30), 16, 16)) -> intp(0, 0, 4)
	nop
	.word 0x01000000  ! 152: NOP	nop
	.word 0xe4f7ce80  ! 153: STXA_R	stxa	%r18, [%r31 + %r0] 0x74
	.word 0xe09f4e40  ! 154: LDDA_R	ldda	[%r29, %r0] 0x72, %r16
	rd	%asr26, %g1
halt_hwintr_0_31:
	wr	%g1, 1, %asr26
!$EV trig_pc_d(0,expr(@VA(.MAIN.halt_hwintr_0_31), 16, 16)) -> intp(0, 0, 4)
	nop
	.word 0x01000000  ! 155: NOP	nop
	.word 0xe0bf6000  ! 156: STDA_I	stda	%r16, [%r29 + 0x0000] %asi
	.word 0xe0f72000  ! 157: STXA_I	stxa	%r16, [%r28 + 0x0000] %asi
	mov	0x7c0, %r21
	rd	%asr26, %g1
halt_hwintr_0_32:
	wr	%g1, 1, %asr26
!$EV trig_pc_d(0,expr(@VA(.MAIN.halt_hwintr_0_32), 16, 16)) -> intp(0, 0, 4)
	nop
	.word 0x01000000  ! 159: NOP	nop
	.word 0x8780204f  ! 160: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xe4f584a0  ! 161: STXA_R	stxa	%r18, [%r22 + %r0] 0x25
	rd	%asr26, %g1
halt_hwintr_0_33:
	wr	%g1, 1, %asr26
!$EV trig_pc_d(0,expr(@VA(.MAIN.halt_hwintr_0_33), 16, 16)) -> intp(0, 0, 4)
	nop
	.word 0x01000000  ! 162: NOP	nop
	.word 0x87802072  ! 163: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0xe4bfa000  ! 164: STDA_I	stda	%r18, [%r30 + 0x0000] %asi
	.word 0x87802074  ! 165: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0xec870e60  ! 166: LDUWA_R	lduwa	[%r28, %r0] 0x73, %r22
	.word 0x8780204f  ! 167: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xecce6000  ! 168: LDSBA_I	ldsba	[%r25, + 0x0000] %asi, %r22
	.word 0x87802025  ! 169: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0x87802025  ! 170: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0xecd52000  ! 171: LDSHA_I	ldsha	[%r20, + 0x0000] %asi, %r22
	rd	%asr26, %g1
halt_hwintr_0_34:
	wr	%g1, 1, %asr26
!$EV trig_pc_d(0,expr(@VA(.MAIN.halt_hwintr_0_34), 16, 16)) -> intp(0, 0, 4)
	nop
	.word 0x01000000  ! 172: NOP	nop
	.word 0xecf5e000  ! 173: STXA_I	stxa	%r22, [%r23 + 0x0000] %asi
	.word 0x87802074  ! 174: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0xecf72000  ! 175: STXA_I	stxa	%r22, [%r28 + 0x0000] %asi
	.word 0xeca76000  ! 176: STWA_I	stwa	%r22, [%r29 + 0x0000] %asi
	rd	%asr26, %g1
halt_hwintr_0_35:
	wr	%g1, 1, %asr26
!$EV trig_pc_d(0,expr(@VA(.MAIN.halt_hwintr_0_35), 16, 16)) -> intp(0, 0, 4)
	nop
	.word 0x01000000  ! 177: NOP	nop
	.word 0xecbf6000  ! 178: STDA_I	stda	%r22, [%r29 + 0x0000] %asi
	.word 0xeca7e000  ! 179: STWA_I	stwa	%r22, [%r31 + 0x0000] %asi
	.word 0xecbfa000  ! 180: STDA_I	stda	%r22, [%r30 + 0x0000] %asi
	.word 0xe4bcc400  ! 181: STDA_R	stda	%r18, [%r19 + %r0] 0x20
	.word 0x87802020  ! 182: WRASI_I	wr	%r0, 0x0020, %asi
	rd	%asr26, %g1
halt_hwintr_0_36:
	wr	%g1, 1, %asr26
!$EV trig_pc_d(0,expr(@VA(.MAIN.halt_hwintr_0_36), 16, 16)) -> intp(0, 0, 4)
	nop
	.word 0x01000000  ! 183: NOP	nop
	.word 0xe4dc6000  ! 184: LDXA_I	ldxa	[%r17, + 0x0000] %asi, %r18
	.word 0xe0a74e80  ! 185: STWA_R	stwa	%r16, [%r29 + %r0] 0x74
	.word 0xe4cd44a0  ! 186: LDSBA_R	ldsba	[%r21, %r0] 0x25, %r18
	.word 0x87802020  ! 187: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe4aca000  ! 188: STBA_I	stba	%r18, [%r18 + 0x0000] %asi
	.word 0xe8af8e80  ! 189: STBA_R	stba	%r20, [%r30 + %r0] 0x74
	.word 0x87802020  ! 190: WRASI_I	wr	%r0, 0x0020, %asi
	rd	%asr26, %g1
halt_hwintr_0_37:
	wr	%g1, 1, %asr26
!$EV trig_pc_d(0,expr(@VA(.MAIN.halt_hwintr_0_37), 16, 16)) -> intp(0, 0, 4)
	nop
	.word 0x01000000  ! 191: NOP	nop
	rd	%asr26, %g1
halt_hwintr_0_38:
	wr	%g1, 1, %asr26
!$EV trig_pc_d(0,expr(@VA(.MAIN.halt_hwintr_0_38), 16, 16)) -> intp(0, 0, 4)
	nop
	.word 0x01000000  ! 192: NOP	nop
	.word 0xe8a42000  ! 193: STWA_I	stwa	%r20, [%r16 + 0x0000] %asi
	.word 0xe0ac4400  ! 194: STBA_R	stba	%r16, [%r17 + %r0] 0x20
	.word 0xe0a4a000  ! 195: STWA_I	stwa	%r16, [%r18 + 0x0000] %asi
	rd	%asr26, %g1
halt_hwintr_0_39:
	wr	%g1, 1, %asr26
!$EV trig_pc_d(0,expr(@VA(.MAIN.halt_hwintr_0_39), 16, 16)) -> intp(0, 0, 4)
	nop
	.word 0x01000000  ! 196: NOP	nop
	.word 0xe0aca000  ! 197: STBA_I	stba	%r16, [%r18 + 0x0000] %asi
	.word 0x87802020  ! 198: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe0a4a000  ! 199: STWA_I	stwa	%r16, [%r18 + 0x0000] %asi
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_3:
	mov	0x38, %r18
	rd	%asr26, %g1
halt_hwintr_3_0:
	wr	%g1, 1, %asr26
!$EV trig_pc_d(3,expr(@VA(.MAIN.halt_hwintr_3_0), 16, 16)) -> intp(3, 0, 4)
	nop
	.word 0x01000000  ! 2: NOP	nop
	.word 0x8780204f  ! 3: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0x8780204f  ! 4: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0x87802020  ! 5: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe6a56000  ! 6: STWA_I	stwa	%r19, [%r21 + 0x0000] %asi
	.word 0xe6f5e000  ! 7: STXA_I	stxa	%r19, [%r23 + 0x0000] %asi
	rd	%asr26, %g1
halt_hwintr_3_1:
	wr	%g1, 1, %asr26
!$EV trig_pc_d(3,expr(@VA(.MAIN.halt_hwintr_3_1), 16, 16)) -> intp(3, 0, 4)
	nop
	.word 0x01000000  ! 8: NOP	nop
	rd	%asr26, %g1
halt_hwintr_3_2:
	wr	%g1, 1, %asr26
!$EV trig_pc_d(3,expr(@VA(.MAIN.halt_hwintr_3_2), 16, 16)) -> intp(3, 0, 4)
	nop
	.word 0x01000000  ! 9: NOP	nop
	.word 0xe6dd2000  ! 10: LDXA_I	ldxa	[%r20, + 0x0000] %asi, %r19
	rd	%asr26, %g1
halt_hwintr_3_3:
	wr	%g1, 1, %asr26
!$EV trig_pc_d(3,expr(@VA(.MAIN.halt_hwintr_3_3), 16, 16)) -> intp(3, 0, 4)
	nop
	.word 0x01000000  ! 11: NOP	nop
	.word 0xe28f4e60  ! 12: LDUBA_R	lduba	[%r29, %r0] 0x73, %r17
	rd	%asr26, %g1
halt_hwintr_3_4:
	wr	%g1, 1, %asr26
!$EV trig_pc_d(3,expr(@VA(.MAIN.halt_hwintr_3_4), 16, 16)) -> intp(3, 0, 4)
	nop
	.word 0x01000000  ! 13: NOP	nop
	.word 0xecad6000  ! 14: STBA_I	stba	%r22, [%r21 + 0x0000] %asi
	rd	%asr26, %g1
halt_hwintr_3_5:
	wr	%g1, 1, %asr26
!$EV trig_pc_d(3,expr(@VA(.MAIN.halt_hwintr_3_5), 16, 16)) -> intp(3, 0, 4)
	nop
	.word 0x01000000  ! 15: NOP	nop
	.word 0xecc5e000  ! 16: LDSWA_I	ldswa	[%r23, + 0x0000] %asi, %r22
	mov	0x7f8, %r20
	.word 0x87802073  ! 18: WRASI_I	wr	%r0, 0x0073, %asi
	rd	%asr26, %g1
halt_hwintr_3_6:
	wr	%g1, 1, %asr26
!$EV trig_pc_d(3,expr(@VA(.MAIN.halt_hwintr_3_6), 16, 16)) -> intp(3, 0, 4)
	nop
	.word 0x01000000  ! 19: NOP	nop
	.word 0xea970e40  ! 20: LDUHA_R	lduha	[%r28, %r0] 0x72, %r21
	.word 0xe2c4e000  ! 21: LDSWA_I	ldswa	[%r19, + 0x0000] %asi, %r17
	.word 0xe8b609e0  ! 22: STHA_R	stha	%r20, [%r24 + %r0] 0x4f
	.word 0xe4d42000  ! 23: LDSHA_I	ldsha	[%r16, + 0x0000] %asi, %r18
	.word 0x87802025  ! 24: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0x87802073  ! 25: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0xe4f76000  ! 26: STXA_I	stxa	%r18, [%r29 + 0x0000] %asi
	.word 0xe4afa000  ! 27: STBA_I	stba	%r18, [%r30 + 0x0000] %asi
	.word 0xe4f76000  ! 28: STXA_I	stxa	%r18, [%r29 + 0x0000] %asi
	.word 0xeea4c400  ! 29: STWA_R	stwa	%r23, [%r19 + %r0] 0x20
	.word 0xe8870e80  ! 30: LDUWA_R	lduwa	[%r28, %r0] 0x74, %r20
	.word 0xeaa4c400  ! 31: STWA_R	stwa	%r21, [%r19 + %r0] 0x20
	.word 0xead7ce80  ! 32: LDSHA_R	ldsha	[%r31, %r0] 0x74, %r21
	.word 0xe8bcc400  ! 33: STDA_R	stda	%r20, [%r19 + %r0] 0x20
	.word 0x87802025  ! 34: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0xe094e000  ! 35: LDUHA_I	lduha	[%r19, + 0x0000] %asi, %r16
	.word 0xee9cc400  ! 36: LDDA_R	ldda	[%r19, %r0] 0x20, %r23
	.word 0xe8c48400  ! 37: LDSWA_R	ldswa	[%r18, %r0] 0x20, %r20
	.word 0xe68c2000  ! 38: LDUBA_I	lduba	[%r16, + 0x0000] %asi, %r19
	.word 0xe6f689e0  ! 39: STXA_R	stxa	%r19, [%r26 + %r0] 0x4f
	.word 0x87802020  ! 40: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe6a52000  ! 41: STWA_I	stwa	%r19, [%r20 + 0x0000] %asi
	.word 0xeaa44400  ! 42: STWA_R	stwa	%r21, [%r17 + %r0] 0x20
	.word 0xe4bda000  ! 43: STDA_I	stda	%r18, [%r22 + 0x0000] %asi
	.word 0xe6b7ce60  ! 44: STHA_R	stha	%r19, [%r31 + %r0] 0x73
	rd	%asr26, %g1
halt_hwintr_3_7:
	wr	%g1, 1, %asr26
!$EV trig_pc_d(3,expr(@VA(.MAIN.halt_hwintr_3_7), 16, 16)) -> intp(3, 0, 4)
	nop
	.word 0x01000000  ! 45: NOP	nop
	rd	%asr26, %g1
halt_hwintr_3_8:
	wr	%g1, 1, %asr26
!$EV trig_pc_d(3,expr(@VA(.MAIN.halt_hwintr_3_8), 16, 16)) -> intp(3, 0, 4)
	nop
	.word 0x01000000  ! 46: NOP	nop
	rd	%asr26, %g1
halt_hwintr_3_9:
	wr	%g1, 1, %asr26
!$EV trig_pc_d(3,expr(@VA(.MAIN.halt_hwintr_3_9), 16, 16)) -> intp(3, 0, 4)
	nop
	.word 0x01000000  ! 47: NOP	nop
	.word 0x87802020  ! 48: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe097ce60  ! 49: LDUHA_R	lduha	[%r31, %r0] 0x73, %r16
	rd	%asr26, %g1
halt_hwintr_3_10:
	wr	%g1, 1, %asr26
!$EV trig_pc_d(3,expr(@VA(.MAIN.halt_hwintr_3_10), 16, 16)) -> intp(3, 0, 4)
	nop
	.word 0x01000000  ! 50: NOP	nop
	.word 0xeec6a000  ! 51: LDSWA_I	ldswa	[%r26, + 0x0000] %asi, %r23
	.word 0xeea6a000  ! 52: STWA_I	stwa	%r23, [%r26 + 0x0000] %asi
	.word 0xeebea000  ! 53: STDA_I	stda	%r23, [%r26 + 0x0000] %asi
	.word 0xeaf4c400  ! 54: STXA_R	stxa	%r21, [%r19 + %r0] 0x20
	.word 0xe6f6a000  ! 55: STXA_I	stxa	%r19, [%r26 + 0x0000] %asi
	rd	%asr26, %g1
halt_hwintr_3_11:
	wr	%g1, 1, %asr26
!$EV trig_pc_d(3,expr(@VA(.MAIN.halt_hwintr_3_11), 16, 16)) -> intp(3, 0, 4)
	nop
	.word 0x01000000  ! 56: NOP	nop
	.word 0x87802072  ! 57: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0xe6cfa000  ! 58: LDSBA_I	ldsba	[%r30, + 0x0000] %asi, %r19
	.word 0x87802072  ! 59: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0x87802072  ! 60: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0x87802025  ! 61: WRASI_I	wr	%r0, 0x0025, %asi
	rd	%asr26, %g1
halt_hwintr_3_12:
	wr	%g1, 1, %asr26
!$EV trig_pc_d(3,expr(@VA(.MAIN.halt_hwintr_3_12), 16, 16)) -> intp(3, 0, 4)
	nop
	.word 0x01000000  ! 62: NOP	nop
	rd	%asr26, %g1
halt_hwintr_3_13:
	wr	%g1, 1, %asr26
!$EV trig_pc_d(3,expr(@VA(.MAIN.halt_hwintr_3_13), 16, 16)) -> intp(3, 0, 4)
	nop
	.word 0x01000000  ! 63: NOP	nop
	mov	0x30, %r24
	.word 0x87802020  ! 65: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe6bd6000  ! 66: STDA_I	stda	%r19, [%r21 + 0x0000] %asi
	.word 0xe6bde000  ! 67: STDA_I	stda	%r19, [%r23 + 0x0000] %asi
	.word 0xe685a000  ! 68: LDUWA_I	lduwa	[%r22, + 0x0000] %asi, %r19
	.word 0xe6d5e000  ! 69: LDSHA_I	ldsha	[%r23, + 0x0000] %asi, %r19
	.word 0xeec40400  ! 70: LDSWA_R	ldswa	[%r16, %r0] 0x20, %r23
	.word 0xe6f56000  ! 71: STXA_I	stxa	%r19, [%r21 + 0x0000] %asi
	mov	0x20, %r25
	.word 0x87802072  ! 73: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0xe6b56000  ! 74: STHA_I	stha	%r19, [%r21 + 0x0000] %asi
	.word 0xe6cda000  ! 75: LDSBA_I	ldsba	[%r22, + 0x0000] %asi, %r19
	.word 0xe6f5a000  ! 76: STXA_I	stxa	%r19, [%r22 + 0x0000] %asi
	rd	%asr26, %g1
halt_hwintr_3_14:
	wr	%g1, 1, %asr26
!$EV trig_pc_d(3,expr(@VA(.MAIN.halt_hwintr_3_14), 16, 16)) -> intp(3, 0, 4)
	nop
	.word 0x01000000  ! 77: NOP	nop
	.word 0xe2f74e80  ! 78: STXA_R	stxa	%r17, [%r29 + %r0] 0x74
	.word 0xe4a4c400  ! 79: STWA_R	stwa	%r18, [%r19 + %r0] 0x20
	.word 0xe4852000  ! 80: LDUWA_I	lduwa	[%r20, + 0x0000] %asi, %r18
	rd	%asr26, %g1
halt_hwintr_3_15:
	wr	%g1, 1, %asr26
!$EV trig_pc_d(3,expr(@VA(.MAIN.halt_hwintr_3_15), 16, 16)) -> intp(3, 0, 4)
	nop
	.word 0x01000000  ! 81: NOP	nop
	.word 0xe485e000  ! 82: LDUWA_I	lduwa	[%r23, + 0x0000] %asi, %r18
	.word 0xe495a000  ! 83: LDUHA_I	lduha	[%r22, + 0x0000] %asi, %r18
	rd	%asr26, %g1
halt_hwintr_3_16:
	wr	%g1, 1, %asr26
!$EV trig_pc_d(3,expr(@VA(.MAIN.halt_hwintr_3_16), 16, 16)) -> intp(3, 0, 4)
	nop
	.word 0x01000000  ! 84: NOP	nop
	.word 0xe4c4c400  ! 85: LDSWA_R	ldswa	[%r19, %r0] 0x20, %r18
	.word 0xea8f0e40  ! 86: LDUBA_R	lduba	[%r28, %r0] 0x72, %r21
	.word 0x87802074  ! 87: WRASI_I	wr	%r0, 0x0074, %asi
	rd	%asr26, %g1
halt_hwintr_3_17:
	wr	%g1, 1, %asr26
!$EV trig_pc_d(3,expr(@VA(.MAIN.halt_hwintr_3_17), 16, 16)) -> intp(3, 0, 4)
	nop
	.word 0x01000000  ! 88: NOP	nop
	.word 0xecf584a0  ! 89: STXA_R	stxa	%r22, [%r22 + %r0] 0x25
	.word 0xec8ee000  ! 90: LDUBA_I	lduba	[%r27, + 0x0000] %asi, %r22
	.word 0xe6844400  ! 91: LDUWA_R	lduwa	[%r17, %r0] 0x20, %r19
	rd	%asr26, %g1
halt_hwintr_3_18:
	wr	%g1, 1, %asr26
!$EV trig_pc_d(3,expr(@VA(.MAIN.halt_hwintr_3_18), 16, 16)) -> intp(3, 0, 4)
	nop
	.word 0x01000000  ! 92: NOP	nop
	.word 0xe0a48400  ! 93: STWA_R	stwa	%r16, [%r18 + %r0] 0x20
	rd	%asr26, %g1
halt_hwintr_3_19:
	wr	%g1, 1, %asr26
!$EV trig_pc_d(3,expr(@VA(.MAIN.halt_hwintr_3_19), 16, 16)) -> intp(3, 0, 4)
	nop
	.word 0x01000000  ! 94: NOP	nop
	.word 0xe0a6c9e0  ! 95: STWA_R	stwa	%r16, [%r27 + %r0] 0x4f
	.word 0x87802020  ! 96: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe097ce40  ! 97: LDUHA_R	lduha	[%r31, %r0] 0x72, %r16
	rd	%asr26, %g1
halt_hwintr_3_20:
	wr	%g1, 1, %asr26
!$EV trig_pc_d(3,expr(@VA(.MAIN.halt_hwintr_3_20), 16, 16)) -> intp(3, 0, 4)
	nop
	.word 0x01000000  ! 98: NOP	nop
	.word 0xe4af4e40  ! 99: STBA_R	stba	%r18, [%r29 + %r0] 0x72
	rd	%asr26, %g1
halt_hwintr_3_21:
	wr	%g1, 1, %asr26
!$EV trig_pc_d(3,expr(@VA(.MAIN.halt_hwintr_3_21), 16, 16)) -> intp(3, 0, 4)
	nop
	.word 0x01000000  ! 100: NOP	nop
	.word 0x87802020  ! 101: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xecb42000  ! 102: STHA_I	stha	%r22, [%r16 + 0x0000] %asi
	rd	%asr26, %g1
halt_hwintr_3_22:
	wr	%g1, 1, %asr26
!$EV trig_pc_d(3,expr(@VA(.MAIN.halt_hwintr_3_22), 16, 16)) -> intp(3, 0, 4)
	nop
	.word 0x01000000  ! 103: NOP	nop
	.word 0xecf42000  ! 104: STXA_I	stxa	%r22, [%r16 + 0x0000] %asi
	.word 0xeccc6000  ! 105: LDSBA_I	ldsba	[%r17, + 0x0000] %asi, %r22
	.word 0x8780204f  ! 106: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xecd76000  ! 107: LDSHA_I	ldsha	[%r29, + 0x0000] %asi, %r22
	.word 0x87802074  ! 108: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0x87802025  ! 109: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0x87802073  ! 110: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0xeebfce40  ! 111: STDA_R	stda	%r23, [%r31 + %r0] 0x72
	mov	0x68, %r17
	rd	%asr26, %g1
halt_hwintr_3_23:
	wr	%g1, 1, %asr26
!$EV trig_pc_d(3,expr(@VA(.MAIN.halt_hwintr_3_23), 16, 16)) -> intp(3, 0, 4)
	nop
	.word 0x01000000  ! 113: NOP	nop
	.word 0xe0862000  ! 114: LDUWA_I	lduwa	[%r24, + 0x0000] %asi, %r16
	rd	%asr26, %g1
halt_hwintr_3_24:
	wr	%g1, 1, %asr26
!$EV trig_pc_d(3,expr(@VA(.MAIN.halt_hwintr_3_24), 16, 16)) -> intp(3, 0, 4)
	nop
	.word 0x01000000  ! 115: NOP	nop
	.word 0xe0a6a000  ! 116: STWA_I	stwa	%r16, [%r26 + 0x0000] %asi
	.word 0xe0f62000  ! 117: STXA_I	stxa	%r16, [%r24 + 0x0000] %asi
	mov	0x48, %r26
	mov	0x3f0, %r20
	rd	%asr26, %g1
halt_hwintr_3_25:
	wr	%g1, 1, %asr26
!$EV trig_pc_d(3,expr(@VA(.MAIN.halt_hwintr_3_25), 16, 16)) -> intp(3, 0, 4)
	nop
	.word 0x01000000  ! 120: NOP	nop
	.word 0xe0af4e80  ! 121: STBA_R	stba	%r16, [%r29 + %r0] 0x74
	rd	%asr26, %g1
halt_hwintr_3_26:
	wr	%g1, 1, %asr26
!$EV trig_pc_d(3,expr(@VA(.MAIN.halt_hwintr_3_26), 16, 16)) -> intp(3, 0, 4)
	nop
	.word 0x01000000  ! 122: NOP	nop
	.word 0xeedc0400  ! 123: LDXA_R	ldxa	[%r16, %r0] 0x20, %r23
	.word 0xe2be6000  ! 124: STDA_I	stda	%r17, [%r25 + 0x0000] %asi
	.word 0x87802025  ! 125: WRASI_I	wr	%r0, 0x0025, %asi
	rd	%asr26, %g1
halt_hwintr_3_27:
	wr	%g1, 1, %asr26
!$EV trig_pc_d(3,expr(@VA(.MAIN.halt_hwintr_3_27), 16, 16)) -> intp(3, 0, 4)
	nop
	.word 0x01000000  ! 126: NOP	nop
	.word 0xe2b7e000  ! 127: STHA_I	stha	%r17, [%r31 + 0x0000] %asi
	.word 0xeaa40400  ! 128: STWA_R	stwa	%r21, [%r16 + %r0] 0x20
	rd	%asr26, %g1
halt_hwintr_3_28:
	wr	%g1, 1, %asr26
!$EV trig_pc_d(3,expr(@VA(.MAIN.halt_hwintr_3_28), 16, 16)) -> intp(3, 0, 4)
	nop
	.word 0x01000000  ! 129: NOP	nop
	.word 0xe0b7a000  ! 130: STHA_I	stha	%r16, [%r30 + 0x0000] %asi
	.word 0xe0dfa000  ! 131: LDXA_I	ldxa	[%r30, + 0x0000] %asi, %r16
	.word 0x87802020  ! 132: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe0948400  ! 133: LDUHA_R	lduha	[%r18, %r0] 0x20, %r16
	.word 0x87802072  ! 134: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0xe4bec9e0  ! 135: STDA_R	stda	%r18, [%r27 + %r0] 0x4f
	.word 0xe0978e40  ! 136: LDUHA_R	lduha	[%r30, %r0] 0x72, %r16
	.word 0xe6b70e60  ! 137: STHA_R	stha	%r19, [%r28 + %r0] 0x73
	.word 0xecd78e60  ! 138: LDSHA_R	ldsha	[%r30, %r0] 0x73, %r22
	.word 0x87802025  ! 139: WRASI_I	wr	%r0, 0x0025, %asi
	mov	0x30, %r25
	mov	0x40, %r24
	.word 0xe2df4e80  ! 142: LDXA_R	ldxa	[%r29, %r0] 0x74, %r17
	.word 0xe4af2000  ! 143: STBA_I	stba	%r18, [%r28 + 0x0000] %asi
	.word 0x87802072  ! 144: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0xe48c6000  ! 145: LDUBA_I	lduba	[%r17, + 0x0000] %asi, %r18
	.word 0xe0c70e80  ! 146: LDSWA_R	ldswa	[%r28, %r0] 0x74, %r16
	rd	%asr26, %g1
halt_hwintr_3_29:
	wr	%g1, 1, %asr26
!$EV trig_pc_d(3,expr(@VA(.MAIN.halt_hwintr_3_29), 16, 16)) -> intp(3, 0, 4)
	nop
	.word 0x01000000  ! 147: NOP	nop
	.word 0x87802074  ! 148: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0x87802020  ! 149: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xecdf2000  ! 150: LDXA_I	ldxa	[%r28, + 0x0000] %asi, %r22
	.word 0xe0df0e80  ! 151: LDXA_R	ldxa	[%r28, %r0] 0x74, %r16
	rd	%asr26, %g1
halt_hwintr_3_30:
	wr	%g1, 1, %asr26
!$EV trig_pc_d(3,expr(@VA(.MAIN.halt_hwintr_3_30), 16, 16)) -> intp(3, 0, 4)
	nop
	.word 0x01000000  ! 152: NOP	nop
	.word 0xe6f70e40  ! 153: STXA_R	stxa	%r19, [%r28 + %r0] 0x72
	.word 0xee9cc400  ! 154: LDDA_R	ldda	[%r19, %r0] 0x20, %r23
	rd	%asr26, %g1
halt_hwintr_3_31:
	wr	%g1, 1, %asr26
!$EV trig_pc_d(3,expr(@VA(.MAIN.halt_hwintr_3_31), 16, 16)) -> intp(3, 0, 4)
	nop
	.word 0x01000000  ! 155: NOP	nop
	.word 0xe0bf6000  ! 156: STDA_I	stda	%r16, [%r29 + 0x0000] %asi
	.word 0xe0f7e000  ! 157: STXA_I	stxa	%r16, [%r31 + 0x0000] %asi
	mov	0x3c0, %r20
	rd	%asr26, %g1
halt_hwintr_3_32:
	wr	%g1, 1, %asr26
!$EV trig_pc_d(3,expr(@VA(.MAIN.halt_hwintr_3_32), 16, 16)) -> intp(3, 0, 4)
	nop
	.word 0x01000000  ! 159: NOP	nop
	.word 0x87802072  ! 160: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0xeef74e40  ! 161: STXA_R	stxa	%r23, [%r29 + %r0] 0x72
	rd	%asr26, %g1
halt_hwintr_3_33:
	wr	%g1, 1, %asr26
!$EV trig_pc_d(3,expr(@VA(.MAIN.halt_hwintr_3_33), 16, 16)) -> intp(3, 0, 4)
	nop
	.word 0x01000000  ! 162: NOP	nop
	.word 0x87802072  ! 163: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0xe4bfa000  ! 164: STDA_I	stda	%r18, [%r30 + 0x0000] %asi
	.word 0x87802020  ! 165: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe087ce80  ! 166: LDUWA_R	lduwa	[%r31, %r0] 0x74, %r16
	.word 0x87802020  ! 167: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xeccea000  ! 168: LDSBA_I	ldsba	[%r26, + 0x0000] %asi, %r22
	.word 0x87802072  ! 169: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0x87802020  ! 170: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xecd5e000  ! 171: LDSHA_I	ldsha	[%r23, + 0x0000] %asi, %r22
	rd	%asr26, %g1
halt_hwintr_3_34:
	wr	%g1, 1, %asr26
!$EV trig_pc_d(3,expr(@VA(.MAIN.halt_hwintr_3_34), 16, 16)) -> intp(3, 0, 4)
	nop
	.word 0x01000000  ! 172: NOP	nop
	.word 0xecf56000  ! 173: STXA_I	stxa	%r22, [%r21 + 0x0000] %asi
	.word 0x87802072  ! 174: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0xecf7e000  ! 175: STXA_I	stxa	%r22, [%r31 + 0x0000] %asi
	.word 0xeca7a000  ! 176: STWA_I	stwa	%r22, [%r30 + 0x0000] %asi
	rd	%asr26, %g1
halt_hwintr_3_35:
	wr	%g1, 1, %asr26
!$EV trig_pc_d(3,expr(@VA(.MAIN.halt_hwintr_3_35), 16, 16)) -> intp(3, 0, 4)
	nop
	.word 0x01000000  ! 177: NOP	nop
	.word 0xecbfa000  ! 178: STDA_I	stda	%r22, [%r30 + 0x0000] %asi
	.word 0xeca7e000  ! 179: STWA_I	stwa	%r22, [%r31 + 0x0000] %asi
	.word 0xecbfa000  ! 180: STDA_I	stda	%r22, [%r30 + 0x0000] %asi
	.word 0xeabc0400  ! 181: STDA_R	stda	%r21, [%r16 + %r0] 0x20
	.word 0x87802020  ! 182: WRASI_I	wr	%r0, 0x0020, %asi
	rd	%asr26, %g1
halt_hwintr_3_36:
	wr	%g1, 1, %asr26
!$EV trig_pc_d(3,expr(@VA(.MAIN.halt_hwintr_3_36), 16, 16)) -> intp(3, 0, 4)
	nop
	.word 0x01000000  ! 183: NOP	nop
	.word 0xe4dc2000  ! 184: LDXA_I	ldxa	[%r16, + 0x0000] %asi, %r18
	.word 0xe2a5c4a0  ! 185: STWA_R	stwa	%r17, [%r23 + %r0] 0x25
	.word 0xe6cc0400  ! 186: LDSBA_R	ldsba	[%r16, %r0] 0x20, %r19
	.word 0x87802025  ! 187: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0xe4ace000  ! 188: STBA_I	stba	%r18, [%r19 + 0x0000] %asi
	.word 0xe2acc400  ! 189: STBA_R	stba	%r17, [%r19 + %r0] 0x20
	.word 0x87802025  ! 190: WRASI_I	wr	%r0, 0x0025, %asi
	rd	%asr26, %g1
halt_hwintr_3_37:
	wr	%g1, 1, %asr26
!$EV trig_pc_d(3,expr(@VA(.MAIN.halt_hwintr_3_37), 16, 16)) -> intp(3, 0, 4)
	nop
	.word 0x01000000  ! 191: NOP	nop
	rd	%asr26, %g1
halt_hwintr_3_38:
	wr	%g1, 1, %asr26
!$EV trig_pc_d(3,expr(@VA(.MAIN.halt_hwintr_3_38), 16, 16)) -> intp(3, 0, 4)
	nop
	.word 0x01000000  ! 192: NOP	nop
	.word 0xe8a4a000  ! 193: STWA_I	stwa	%r20, [%r18 + 0x0000] %asi
	.word 0xe4af8e60  ! 194: STBA_R	stba	%r18, [%r30 + %r0] 0x73
	.word 0xe0a42000  ! 195: STWA_I	stwa	%r16, [%r16 + 0x0000] %asi
	rd	%asr26, %g1
halt_hwintr_3_39:
	wr	%g1, 1, %asr26
!$EV trig_pc_d(3,expr(@VA(.MAIN.halt_hwintr_3_39), 16, 16)) -> intp(3, 0, 4)
	nop
	.word 0x01000000  ! 196: NOP	nop
	.word 0xe0aca000  ! 197: STBA_I	stba	%r16, [%r18 + 0x0000] %asi
	.word 0x87802020  ! 198: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe0a4e000  ! 199: STWA_I	stwa	%r16, [%r19 + 0x0000] %asi
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_2:
	mov	0x28, %r19
	rd	%asr26, %g1
halt_hwintr_2_0:
	wr	%g1, 1, %asr26
!$EV trig_pc_d(2,expr(@VA(.MAIN.halt_hwintr_2_0), 16, 16)) -> intp(2, 0, 4)
	nop
	.word 0x01000000  ! 2: NOP	nop
	.word 0x87802072  ! 3: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0x87802020  ! 4: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0x87802020  ! 5: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe6a52000  ! 6: STWA_I	stwa	%r19, [%r20 + 0x0000] %asi
	.word 0xe6f56000  ! 7: STXA_I	stxa	%r19, [%r21 + 0x0000] %asi
	rd	%asr26, %g1
halt_hwintr_2_1:
	wr	%g1, 1, %asr26
!$EV trig_pc_d(2,expr(@VA(.MAIN.halt_hwintr_2_1), 16, 16)) -> intp(2, 0, 4)
	nop
	.word 0x01000000  ! 8: NOP	nop
	rd	%asr26, %g1
halt_hwintr_2_2:
	wr	%g1, 1, %asr26
!$EV trig_pc_d(2,expr(@VA(.MAIN.halt_hwintr_2_2), 16, 16)) -> intp(2, 0, 4)
	nop
	.word 0x01000000  ! 9: NOP	nop
	.word 0xe6dd6000  ! 10: LDXA_I	ldxa	[%r21, + 0x0000] %asi, %r19
	rd	%asr26, %g1
halt_hwintr_2_3:
	wr	%g1, 1, %asr26
!$EV trig_pc_d(2,expr(@VA(.MAIN.halt_hwintr_2_3), 16, 16)) -> intp(2, 0, 4)
	nop
	.word 0x01000000  ! 11: NOP	nop
	.word 0xe08f8e80  ! 12: LDUBA_R	lduba	[%r30, %r0] 0x74, %r16
	rd	%asr26, %g1
halt_hwintr_2_4:
	wr	%g1, 1, %asr26
!$EV trig_pc_d(2,expr(@VA(.MAIN.halt_hwintr_2_4), 16, 16)) -> intp(2, 0, 4)
	nop
	.word 0x01000000  ! 13: NOP	nop
	.word 0xecada000  ! 14: STBA_I	stba	%r22, [%r22 + 0x0000] %asi
	rd	%asr26, %g1
halt_hwintr_2_5:
	wr	%g1, 1, %asr26
!$EV trig_pc_d(2,expr(@VA(.MAIN.halt_hwintr_2_5), 16, 16)) -> intp(2, 0, 4)
	nop
	.word 0x01000000  ! 15: NOP	nop
	.word 0xecc56000  ! 16: LDSWA_I	ldswa	[%r21, + 0x0000] %asi, %r22
	mov	0x7e0, %r23
	.word 0x87802073  ! 18: WRASI_I	wr	%r0, 0x0073, %asi
	rd	%asr26, %g1
halt_hwintr_2_6:
	wr	%g1, 1, %asr26
!$EV trig_pc_d(2,expr(@VA(.MAIN.halt_hwintr_2_6), 16, 16)) -> intp(2, 0, 4)
	nop
	.word 0x01000000  ! 19: NOP	nop
	.word 0xe895c4a0  ! 20: LDUHA_R	lduha	[%r23, %r0] 0x25, %r20
	.word 0xe2c4a000  ! 21: LDSWA_I	ldswa	[%r18, + 0x0000] %asi, %r17
	.word 0xe2b584a0  ! 22: STHA_R	stha	%r17, [%r22 + %r0] 0x25
	.word 0xe4d4a000  ! 23: LDSHA_I	ldsha	[%r18, + 0x0000] %asi, %r18
	.word 0x87802025  ! 24: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0x87802073  ! 25: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0xe4f7e000  ! 26: STXA_I	stxa	%r18, [%r31 + 0x0000] %asi
	.word 0xe4afe000  ! 27: STBA_I	stba	%r18, [%r31 + 0x0000] %asi
	.word 0xe4f76000  ! 28: STXA_I	stxa	%r18, [%r29 + 0x0000] %asi
	.word 0xeea6c9e0  ! 29: STWA_R	stwa	%r23, [%r27 + %r0] 0x4f
	.word 0xec870e60  ! 30: LDUWA_R	lduwa	[%r28, %r0] 0x73, %r22
	.word 0xe4a78e80  ! 31: STWA_R	stwa	%r18, [%r30 + %r0] 0x74
	.word 0xecd7ce60  ! 32: LDSHA_R	ldsha	[%r31, %r0] 0x73, %r22
	.word 0xeabe09e0  ! 33: STDA_R	stda	%r21, [%r24 + %r0] 0x4f
	.word 0x87802072  ! 34: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0xe0946000  ! 35: LDUHA_I	lduha	[%r17, + 0x0000] %asi, %r16
	.word 0xe09fce80  ! 36: LDDA_R	ldda	[%r31, %r0] 0x74, %r16
	.word 0xeac44400  ! 37: LDSWA_R	ldswa	[%r17, %r0] 0x20, %r21
	.word 0xe68ce000  ! 38: LDUBA_I	lduba	[%r19, + 0x0000] %asi, %r19
	.word 0xecf6c9e0  ! 39: STXA_R	stxa	%r22, [%r27 + %r0] 0x4f
	.word 0x87802020  ! 40: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe6a52000  ! 41: STWA_I	stwa	%r19, [%r20 + 0x0000] %asi
	.word 0xe0a7ce60  ! 42: STWA_R	stwa	%r16, [%r31 + %r0] 0x73
	.word 0xe4bde000  ! 43: STDA_I	stda	%r18, [%r23 + 0x0000] %asi
	.word 0xe2b7ce80  ! 44: STHA_R	stha	%r17, [%r31 + %r0] 0x74
	rd	%asr26, %g1
halt_hwintr_2_7:
	wr	%g1, 1, %asr26
!$EV trig_pc_d(2,expr(@VA(.MAIN.halt_hwintr_2_7), 16, 16)) -> intp(2, 0, 4)
	nop
	.word 0x01000000  ! 45: NOP	nop
	rd	%asr26, %g1
halt_hwintr_2_8:
	wr	%g1, 1, %asr26
!$EV trig_pc_d(2,expr(@VA(.MAIN.halt_hwintr_2_8), 16, 16)) -> intp(2, 0, 4)
	nop
	.word 0x01000000  ! 46: NOP	nop
	rd	%asr26, %g1
halt_hwintr_2_9:
	wr	%g1, 1, %asr26
!$EV trig_pc_d(2,expr(@VA(.MAIN.halt_hwintr_2_9), 16, 16)) -> intp(2, 0, 4)
	nop
	.word 0x01000000  ! 47: NOP	nop
	.word 0x87802020  ! 48: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe297ce60  ! 49: LDUHA_R	lduha	[%r31, %r0] 0x73, %r17
	rd	%asr26, %g1
halt_hwintr_2_10:
	wr	%g1, 1, %asr26
!$EV trig_pc_d(2,expr(@VA(.MAIN.halt_hwintr_2_10), 16, 16)) -> intp(2, 0, 4)
	nop
	.word 0x01000000  ! 50: NOP	nop
	.word 0xeec66000  ! 51: LDSWA_I	ldswa	[%r25, + 0x0000] %asi, %r23
	.word 0xeea66000  ! 52: STWA_I	stwa	%r23, [%r25 + 0x0000] %asi
	.word 0xeebe2000  ! 53: STDA_I	stda	%r23, [%r24 + 0x0000] %asi
	.word 0xecf5c4a0  ! 54: STXA_R	stxa	%r22, [%r23 + %r0] 0x25
	.word 0xe6f6e000  ! 55: STXA_I	stxa	%r19, [%r27 + 0x0000] %asi
	rd	%asr26, %g1
halt_hwintr_2_11:
	wr	%g1, 1, %asr26
!$EV trig_pc_d(2,expr(@VA(.MAIN.halt_hwintr_2_11), 16, 16)) -> intp(2, 0, 4)
	nop
	.word 0x01000000  ! 56: NOP	nop
	.word 0x87802025  ! 57: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0xe6cf2000  ! 58: LDSBA_I	ldsba	[%r28, + 0x0000] %asi, %r19
	.word 0x87802020  ! 59: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0x87802025  ! 60: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0x8780204f  ! 61: WRASI_I	wr	%r0, 0x004f, %asi
	rd	%asr26, %g1
halt_hwintr_2_12:
	wr	%g1, 1, %asr26
!$EV trig_pc_d(2,expr(@VA(.MAIN.halt_hwintr_2_12), 16, 16)) -> intp(2, 0, 4)
	nop
	.word 0x01000000  ! 62: NOP	nop
	rd	%asr26, %g1
halt_hwintr_2_13:
	wr	%g1, 1, %asr26
!$EV trig_pc_d(2,expr(@VA(.MAIN.halt_hwintr_2_13), 16, 16)) -> intp(2, 0, 4)
	nop
	.word 0x01000000  ! 63: NOP	nop
	mov	0x40, %r27
	.word 0x8780204f  ! 65: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xe6bd2000  ! 66: STDA_I	stda	%r19, [%r20 + 0x0000] %asi
	.word 0xe6bde000  ! 67: STDA_I	stda	%r19, [%r23 + 0x0000] %asi
	.word 0xe6852000  ! 68: LDUWA_I	lduwa	[%r20, + 0x0000] %asi, %r19
	.word 0xe6d52000  ! 69: LDSHA_I	ldsha	[%r20, + 0x0000] %asi, %r19
	.word 0xe0c6c9e0  ! 70: LDSWA_R	ldswa	[%r27, %r0] 0x4f, %r16
	.word 0xe6f52000  ! 71: STXA_I	stxa	%r19, [%r20 + 0x0000] %asi
	mov	0x70, %r27
	.word 0x8780204f  ! 73: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xe6b5a000  ! 74: STHA_I	stha	%r19, [%r22 + 0x0000] %asi
	.word 0xe6cde000  ! 75: LDSBA_I	ldsba	[%r23, + 0x0000] %asi, %r19
	.word 0xe6f56000  ! 76: STXA_I	stxa	%r19, [%r21 + 0x0000] %asi
	rd	%asr26, %g1
halt_hwintr_2_14:
	wr	%g1, 1, %asr26
!$EV trig_pc_d(2,expr(@VA(.MAIN.halt_hwintr_2_14), 16, 16)) -> intp(2, 0, 4)
	nop
	.word 0x01000000  ! 77: NOP	nop
	.word 0xe4f44400  ! 78: STXA_R	stxa	%r18, [%r17 + %r0] 0x20
	.word 0xe6a48400  ! 79: STWA_R	stwa	%r19, [%r18 + %r0] 0x20
	.word 0xe4856000  ! 80: LDUWA_I	lduwa	[%r21, + 0x0000] %asi, %r18
	rd	%asr26, %g1
halt_hwintr_2_15:
	wr	%g1, 1, %asr26
!$EV trig_pc_d(2,expr(@VA(.MAIN.halt_hwintr_2_15), 16, 16)) -> intp(2, 0, 4)
	nop
	.word 0x01000000  ! 81: NOP	nop
	.word 0xe485e000  ! 82: LDUWA_I	lduwa	[%r23, + 0x0000] %asi, %r18
	.word 0xe4956000  ! 83: LDUHA_I	lduha	[%r21, + 0x0000] %asi, %r18
	rd	%asr26, %g1
halt_hwintr_2_16:
	wr	%g1, 1, %asr26
!$EV trig_pc_d(2,expr(@VA(.MAIN.halt_hwintr_2_16), 16, 16)) -> intp(2, 0, 4)
	nop
	.word 0x01000000  ! 84: NOP	nop
	.word 0xe8c7ce80  ! 85: LDSWA_R	ldswa	[%r31, %r0] 0x74, %r20
	.word 0xec8f8e80  ! 86: LDUBA_R	lduba	[%r30, %r0] 0x74, %r22
	.word 0x87802073  ! 87: WRASI_I	wr	%r0, 0x0073, %asi
	rd	%asr26, %g1
halt_hwintr_2_17:
	wr	%g1, 1, %asr26
!$EV trig_pc_d(2,expr(@VA(.MAIN.halt_hwintr_2_17), 16, 16)) -> intp(2, 0, 4)
	nop
	.word 0x01000000  ! 88: NOP	nop
	.word 0xecf649e0  ! 89: STXA_R	stxa	%r22, [%r25 + %r0] 0x4f
	.word 0xec8ee000  ! 90: LDUBA_I	lduba	[%r27, + 0x0000] %asi, %r22
	.word 0xe6840400  ! 91: LDUWA_R	lduwa	[%r16, %r0] 0x20, %r19
	rd	%asr26, %g1
halt_hwintr_2_18:
	wr	%g1, 1, %asr26
!$EV trig_pc_d(2,expr(@VA(.MAIN.halt_hwintr_2_18), 16, 16)) -> intp(2, 0, 4)
	nop
	.word 0x01000000  ! 92: NOP	nop
	.word 0xe8a44400  ! 93: STWA_R	stwa	%r20, [%r17 + %r0] 0x20
	rd	%asr26, %g1
halt_hwintr_2_19:
	wr	%g1, 1, %asr26
!$EV trig_pc_d(2,expr(@VA(.MAIN.halt_hwintr_2_19), 16, 16)) -> intp(2, 0, 4)
	nop
	.word 0x01000000  ! 94: NOP	nop
	.word 0xe8a70e80  ! 95: STWA_R	stwa	%r20, [%r28 + %r0] 0x74
	.word 0x87802020  ! 96: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xee974e60  ! 97: LDUHA_R	lduha	[%r29, %r0] 0x73, %r23
	rd	%asr26, %g1
halt_hwintr_2_20:
	wr	%g1, 1, %asr26
!$EV trig_pc_d(2,expr(@VA(.MAIN.halt_hwintr_2_20), 16, 16)) -> intp(2, 0, 4)
	nop
	.word 0x01000000  ! 98: NOP	nop
	.word 0xe6af0e80  ! 99: STBA_R	stba	%r19, [%r28 + %r0] 0x74
	rd	%asr26, %g1
halt_hwintr_2_21:
	wr	%g1, 1, %asr26
!$EV trig_pc_d(2,expr(@VA(.MAIN.halt_hwintr_2_21), 16, 16)) -> intp(2, 0, 4)
	nop
	.word 0x01000000  ! 100: NOP	nop
	.word 0x87802020  ! 101: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xecb4e000  ! 102: STHA_I	stha	%r22, [%r19 + 0x0000] %asi
	rd	%asr26, %g1
halt_hwintr_2_22:
	wr	%g1, 1, %asr26
!$EV trig_pc_d(2,expr(@VA(.MAIN.halt_hwintr_2_22), 16, 16)) -> intp(2, 0, 4)
	nop
	.word 0x01000000  ! 103: NOP	nop
	.word 0xecf4a000  ! 104: STXA_I	stxa	%r22, [%r18 + 0x0000] %asi
	.word 0xeccc6000  ! 105: LDSBA_I	ldsba	[%r17, + 0x0000] %asi, %r22
	.word 0x87802020  ! 106: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xecd7a000  ! 107: LDSHA_I	ldsha	[%r30, + 0x0000] %asi, %r22
	.word 0x87802020  ! 108: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0x8780204f  ! 109: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0x8780204f  ! 110: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xecbf4e80  ! 111: STDA_R	stda	%r22, [%r29 + %r0] 0x74
	mov	0x50, %r17
	rd	%asr26, %g1
halt_hwintr_2_23:
	wr	%g1, 1, %asr26
!$EV trig_pc_d(2,expr(@VA(.MAIN.halt_hwintr_2_23), 16, 16)) -> intp(2, 0, 4)
	nop
	.word 0x01000000  ! 113: NOP	nop
	.word 0xe086a000  ! 114: LDUWA_I	lduwa	[%r26, + 0x0000] %asi, %r16
	rd	%asr26, %g1
halt_hwintr_2_24:
	wr	%g1, 1, %asr26
!$EV trig_pc_d(2,expr(@VA(.MAIN.halt_hwintr_2_24), 16, 16)) -> intp(2, 0, 4)
	nop
	.word 0x01000000  ! 115: NOP	nop
	.word 0xe0a6e000  ! 116: STWA_I	stwa	%r16, [%r27 + 0x0000] %asi
	.word 0xe0f62000  ! 117: STXA_I	stxa	%r16, [%r24 + 0x0000] %asi
	mov	0x58, %r27
	mov	0x3e8, %r21
	rd	%asr26, %g1
halt_hwintr_2_25:
	wr	%g1, 1, %asr26
!$EV trig_pc_d(2,expr(@VA(.MAIN.halt_hwintr_2_25), 16, 16)) -> intp(2, 0, 4)
	nop
	.word 0x01000000  ! 120: NOP	nop
	.word 0xe2aec9e0  ! 121: STBA_R	stba	%r17, [%r27 + %r0] 0x4f
	rd	%asr26, %g1
halt_hwintr_2_26:
	wr	%g1, 1, %asr26
!$EV trig_pc_d(2,expr(@VA(.MAIN.halt_hwintr_2_26), 16, 16)) -> intp(2, 0, 4)
	nop
	.word 0x01000000  ! 122: NOP	nop
	.word 0xeede09e0  ! 123: LDXA_R	ldxa	[%r24, %r0] 0x4f, %r23
	.word 0xe2be6000  ! 124: STDA_I	stda	%r17, [%r25 + 0x0000] %asi
	.word 0x87802025  ! 125: WRASI_I	wr	%r0, 0x0025, %asi
	rd	%asr26, %g1
halt_hwintr_2_27:
	wr	%g1, 1, %asr26
!$EV trig_pc_d(2,expr(@VA(.MAIN.halt_hwintr_2_27), 16, 16)) -> intp(2, 0, 4)
	nop
	.word 0x01000000  ! 126: NOP	nop
	.word 0xe2b7e000  ! 127: STHA_I	stha	%r17, [%r31 + 0x0000] %asi
	.word 0xeca70e40  ! 128: STWA_R	stwa	%r22, [%r28 + %r0] 0x72
	rd	%asr26, %g1
halt_hwintr_2_28:
	wr	%g1, 1, %asr26
!$EV trig_pc_d(2,expr(@VA(.MAIN.halt_hwintr_2_28), 16, 16)) -> intp(2, 0, 4)
	nop
	.word 0x01000000  ! 129: NOP	nop
	.word 0xe0b7a000  ! 130: STHA_I	stha	%r16, [%r30 + 0x0000] %asi
	.word 0xe0df2000  ! 131: LDXA_I	ldxa	[%r28, + 0x0000] %asi, %r16
	.word 0x87802025  ! 132: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0xe89609e0  ! 133: LDUHA_R	lduha	[%r24, %r0] 0x4f, %r20
	.word 0x87802073  ! 134: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0xeabf0e80  ! 135: STDA_R	stda	%r21, [%r28 + %r0] 0x74
	.word 0xec948400  ! 136: LDUHA_R	lduha	[%r18, %r0] 0x20, %r22
	.word 0xe8b7ce80  ! 137: STHA_R	stha	%r20, [%r31 + %r0] 0x74
	.word 0xe2d74e80  ! 138: LDSHA_R	ldsha	[%r29, %r0] 0x74, %r17
	.word 0x87802074  ! 139: WRASI_I	wr	%r0, 0x0074, %asi
	mov	0x68, %r25
	mov	0x38, %r26
	.word 0xe6ddc4a0  ! 142: LDXA_R	ldxa	[%r23, %r0] 0x25, %r19
	.word 0xe4af6000  ! 143: STBA_I	stba	%r18, [%r29 + 0x0000] %asi
	.word 0x87802074  ! 144: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0xe48ca000  ! 145: LDUBA_I	lduba	[%r18, + 0x0000] %asi, %r18
	.word 0xeec544a0  ! 146: LDSWA_R	ldswa	[%r21, %r0] 0x25, %r23
	rd	%asr26, %g1
halt_hwintr_2_29:
	wr	%g1, 1, %asr26
!$EV trig_pc_d(2,expr(@VA(.MAIN.halt_hwintr_2_29), 16, 16)) -> intp(2, 0, 4)
	nop
	.word 0x01000000  ! 147: NOP	nop
	.word 0x87802073  ! 148: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0x87802074  ! 149: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0xecdf6000  ! 150: LDXA_I	ldxa	[%r29, + 0x0000] %asi, %r22
	.word 0xeedf0e40  ! 151: LDXA_R	ldxa	[%r28, %r0] 0x72, %r23
	rd	%asr26, %g1
halt_hwintr_2_30:
	wr	%g1, 1, %asr26
!$EV trig_pc_d(2,expr(@VA(.MAIN.halt_hwintr_2_30), 16, 16)) -> intp(2, 0, 4)
	nop
	.word 0x01000000  ! 152: NOP	nop
	.word 0xeef78e60  ! 153: STXA_R	stxa	%r23, [%r30 + %r0] 0x73
	.word 0xe09f4e80  ! 154: LDDA_R	ldda	[%r29, %r0] 0x74, %r16
	rd	%asr26, %g1
halt_hwintr_2_31:
	wr	%g1, 1, %asr26
!$EV trig_pc_d(2,expr(@VA(.MAIN.halt_hwintr_2_31), 16, 16)) -> intp(2, 0, 4)
	nop
	.word 0x01000000  ! 155: NOP	nop
	.word 0xe0bfa000  ! 156: STDA_I	stda	%r16, [%r30 + 0x0000] %asi
	.word 0xe0f7a000  ! 157: STXA_I	stxa	%r16, [%r30 + 0x0000] %asi
	mov	0x7c8, %r23
	rd	%asr26, %g1
halt_hwintr_2_32:
	wr	%g1, 1, %asr26
!$EV trig_pc_d(2,expr(@VA(.MAIN.halt_hwintr_2_32), 16, 16)) -> intp(2, 0, 4)
	nop
	.word 0x01000000  ! 159: NOP	nop
	.word 0x87802074  ! 160: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0xe6f4c400  ! 161: STXA_R	stxa	%r19, [%r19 + %r0] 0x20
	rd	%asr26, %g1
halt_hwintr_2_33:
	wr	%g1, 1, %asr26
!$EV trig_pc_d(2,expr(@VA(.MAIN.halt_hwintr_2_33), 16, 16)) -> intp(2, 0, 4)
	nop
	.word 0x01000000  ! 162: NOP	nop
	.word 0x8780204f  ! 163: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xe4bf2000  ! 164: STDA_I	stda	%r18, [%r28 + 0x0000] %asi
	.word 0x87802020  ! 165: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe6878e80  ! 166: LDUWA_R	lduwa	[%r30, %r0] 0x74, %r19
	.word 0x87802072  ! 167: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0xecce2000  ! 168: LDSBA_I	ldsba	[%r24, + 0x0000] %asi, %r22
	.word 0x87802020  ! 169: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0x87802073  ! 170: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0xecd5e000  ! 171: LDSHA_I	ldsha	[%r23, + 0x0000] %asi, %r22
	rd	%asr26, %g1
halt_hwintr_2_34:
	wr	%g1, 1, %asr26
!$EV trig_pc_d(2,expr(@VA(.MAIN.halt_hwintr_2_34), 16, 16)) -> intp(2, 0, 4)
	nop
	.word 0x01000000  ! 172: NOP	nop
	.word 0xecf52000  ! 173: STXA_I	stxa	%r22, [%r20 + 0x0000] %asi
	.word 0x87802072  ! 174: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0xecf7a000  ! 175: STXA_I	stxa	%r22, [%r30 + 0x0000] %asi
	.word 0xeca72000  ! 176: STWA_I	stwa	%r22, [%r28 + 0x0000] %asi
	rd	%asr26, %g1
halt_hwintr_2_35:
	wr	%g1, 1, %asr26
!$EV trig_pc_d(2,expr(@VA(.MAIN.halt_hwintr_2_35), 16, 16)) -> intp(2, 0, 4)
	nop
	.word 0x01000000  ! 177: NOP	nop
	.word 0xecbf2000  ! 178: STDA_I	stda	%r22, [%r28 + 0x0000] %asi
	.word 0xeca7a000  ! 179: STWA_I	stwa	%r22, [%r30 + 0x0000] %asi
	.word 0xecbf6000  ! 180: STDA_I	stda	%r22, [%r29 + 0x0000] %asi
	.word 0xe4bcc400  ! 181: STDA_R	stda	%r18, [%r19 + %r0] 0x20
	.word 0x87802025  ! 182: WRASI_I	wr	%r0, 0x0025, %asi
	rd	%asr26, %g1
halt_hwintr_2_36:
	wr	%g1, 1, %asr26
!$EV trig_pc_d(2,expr(@VA(.MAIN.halt_hwintr_2_36), 16, 16)) -> intp(2, 0, 4)
	nop
	.word 0x01000000  ! 183: NOP	nop
	.word 0xe4dc2000  ! 184: LDXA_I	ldxa	[%r16, + 0x0000] %asi, %r18
	.word 0xe8a7ce60  ! 185: STWA_R	stwa	%r20, [%r31 + %r0] 0x73
	.word 0xe0ccc400  ! 186: LDSBA_R	ldsba	[%r19, %r0] 0x20, %r16
	.word 0x87802073  ! 187: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0xe4ace000  ! 188: STBA_I	stba	%r18, [%r19 + 0x0000] %asi
	.word 0xe2af8e80  ! 189: STBA_R	stba	%r17, [%r30 + %r0] 0x74
	.word 0x87802020  ! 190: WRASI_I	wr	%r0, 0x0020, %asi
	rd	%asr26, %g1
halt_hwintr_2_37:
	wr	%g1, 1, %asr26
!$EV trig_pc_d(2,expr(@VA(.MAIN.halt_hwintr_2_37), 16, 16)) -> intp(2, 0, 4)
	nop
	.word 0x01000000  ! 191: NOP	nop
	rd	%asr26, %g1
halt_hwintr_2_38:
	wr	%g1, 1, %asr26
!$EV trig_pc_d(2,expr(@VA(.MAIN.halt_hwintr_2_38), 16, 16)) -> intp(2, 0, 4)
	nop
	.word 0x01000000  ! 192: NOP	nop
	.word 0xe8a46000  ! 193: STWA_I	stwa	%r20, [%r17 + 0x0000] %asi
	.word 0xe0ac8400  ! 194: STBA_R	stba	%r16, [%r18 + %r0] 0x20
	.word 0xe0a42000  ! 195: STWA_I	stwa	%r16, [%r16 + 0x0000] %asi
	rd	%asr26, %g1
halt_hwintr_2_39:
	wr	%g1, 1, %asr26
!$EV trig_pc_d(2,expr(@VA(.MAIN.halt_hwintr_2_39), 16, 16)) -> intp(2, 0, 4)
	nop
	.word 0x01000000  ! 196: NOP	nop
	.word 0xe0ac2000  ! 197: STBA_I	stba	%r16, [%r16 + 0x0000] %asi
	.word 0x87802072  ! 198: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0xe0a4e000  ! 199: STWA_I	stwa	%r16, [%r19 + 0x0000] %asi
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_1:
	mov	0x18, %r17
	rd	%asr26, %g1
halt_hwintr_1_0:
	wr	%g1, 1, %asr26
!$EV trig_pc_d(1,expr(@VA(.MAIN.halt_hwintr_1_0), 16, 16)) -> intp(1, 0, 4)
	nop
	.word 0x01000000  ! 2: NOP	nop
	.word 0x87802025  ! 3: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0x87802020  ! 4: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0x8780204f  ! 5: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xe6a52000  ! 6: STWA_I	stwa	%r19, [%r20 + 0x0000] %asi
	.word 0xe6f5e000  ! 7: STXA_I	stxa	%r19, [%r23 + 0x0000] %asi
	rd	%asr26, %g1
halt_hwintr_1_1:
	wr	%g1, 1, %asr26
!$EV trig_pc_d(1,expr(@VA(.MAIN.halt_hwintr_1_1), 16, 16)) -> intp(1, 0, 4)
	nop
	.word 0x01000000  ! 8: NOP	nop
	rd	%asr26, %g1
halt_hwintr_1_2:
	wr	%g1, 1, %asr26
!$EV trig_pc_d(1,expr(@VA(.MAIN.halt_hwintr_1_2), 16, 16)) -> intp(1, 0, 4)
	nop
	.word 0x01000000  ! 9: NOP	nop
	.word 0xe6dd6000  ! 10: LDXA_I	ldxa	[%r21, + 0x0000] %asi, %r19
	rd	%asr26, %g1
halt_hwintr_1_3:
	wr	%g1, 1, %asr26
!$EV trig_pc_d(1,expr(@VA(.MAIN.halt_hwintr_1_3), 16, 16)) -> intp(1, 0, 4)
	nop
	.word 0x01000000  ! 11: NOP	nop
	.word 0xe68f0e80  ! 12: LDUBA_R	lduba	[%r28, %r0] 0x74, %r19
	rd	%asr26, %g1
halt_hwintr_1_4:
	wr	%g1, 1, %asr26
!$EV trig_pc_d(1,expr(@VA(.MAIN.halt_hwintr_1_4), 16, 16)) -> intp(1, 0, 4)
	nop
	.word 0x01000000  ! 13: NOP	nop
	.word 0xecad2000  ! 14: STBA_I	stba	%r22, [%r20 + 0x0000] %asi
	rd	%asr26, %g1
halt_hwintr_1_5:
	wr	%g1, 1, %asr26
!$EV trig_pc_d(1,expr(@VA(.MAIN.halt_hwintr_1_5), 16, 16)) -> intp(1, 0, 4)
	nop
	.word 0x01000000  ! 15: NOP	nop
	.word 0xecc56000  ! 16: LDSWA_I	ldswa	[%r21, + 0x0000] %asi, %r22
	mov	0x3e0, %r23
	.word 0x8780204f  ! 18: WRASI_I	wr	%r0, 0x004f, %asi
	rd	%asr26, %g1
halt_hwintr_1_6:
	wr	%g1, 1, %asr26
!$EV trig_pc_d(1,expr(@VA(.MAIN.halt_hwintr_1_6), 16, 16)) -> intp(1, 0, 4)
	nop
	.word 0x01000000  ! 19: NOP	nop
	.word 0xee9544a0  ! 20: LDUHA_R	lduha	[%r21, %r0] 0x25, %r23
	.word 0xe2c4a000  ! 21: LDSWA_I	ldswa	[%r18, + 0x0000] %asi, %r17
	.word 0xe2b6c9e0  ! 22: STHA_R	stha	%r17, [%r27 + %r0] 0x4f
	.word 0xe4d46000  ! 23: LDSHA_I	ldsha	[%r17, + 0x0000] %asi, %r18
	.word 0x87802020  ! 24: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0x8780204f  ! 25: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xe4f72000  ! 26: STXA_I	stxa	%r18, [%r28 + 0x0000] %asi
	.word 0xe4af6000  ! 27: STBA_I	stba	%r18, [%r29 + 0x0000] %asi
	.word 0xe4f72000  ! 28: STXA_I	stxa	%r18, [%r28 + 0x0000] %asi
	.word 0xe6a4c400  ! 29: STWA_R	stwa	%r19, [%r19 + %r0] 0x20
	.word 0xe484c400  ! 30: LDUWA_R	lduwa	[%r19, %r0] 0x20, %r18
	.word 0xe2a6c9e0  ! 31: STWA_R	stwa	%r17, [%r27 + %r0] 0x4f
	.word 0xeed48400  ! 32: LDSHA_R	ldsha	[%r18, %r0] 0x20, %r23
	.word 0xe6bd44a0  ! 33: STDA_R	stda	%r19, [%r21 + %r0] 0x25
	.word 0x87802074  ! 34: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0xe0942000  ! 35: LDUHA_I	lduha	[%r16, + 0x0000] %asi, %r16
	.word 0xea9d04a0  ! 36: LDDA_R	ldda	[%r20, %r0] 0x25, %r21
	.word 0xeac40400  ! 37: LDSWA_R	ldswa	[%r16, %r0] 0x20, %r21
	.word 0xe68c6000  ! 38: LDUBA_I	lduba	[%r17, + 0x0000] %asi, %r19
	.word 0xe4f74e60  ! 39: STXA_R	stxa	%r18, [%r29 + %r0] 0x73
	.word 0x87802073  ! 40: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0xe6a52000  ! 41: STWA_I	stwa	%r19, [%r20 + 0x0000] %asi
	.word 0xe4a78e60  ! 42: STWA_R	stwa	%r18, [%r30 + %r0] 0x73
	.word 0xe4bd6000  ! 43: STDA_I	stda	%r18, [%r21 + 0x0000] %asi
	.word 0xe6b78e60  ! 44: STHA_R	stha	%r19, [%r30 + %r0] 0x73
	rd	%asr26, %g1
halt_hwintr_1_7:
	wr	%g1, 1, %asr26
!$EV trig_pc_d(1,expr(@VA(.MAIN.halt_hwintr_1_7), 16, 16)) -> intp(1, 0, 4)
	nop
	.word 0x01000000  ! 45: NOP	nop
	rd	%asr26, %g1
halt_hwintr_1_8:
	wr	%g1, 1, %asr26
!$EV trig_pc_d(1,expr(@VA(.MAIN.halt_hwintr_1_8), 16, 16)) -> intp(1, 0, 4)
	nop
	.word 0x01000000  ! 46: NOP	nop
	rd	%asr26, %g1
halt_hwintr_1_9:
	wr	%g1, 1, %asr26
!$EV trig_pc_d(1,expr(@VA(.MAIN.halt_hwintr_1_9), 16, 16)) -> intp(1, 0, 4)
	nop
	.word 0x01000000  ! 47: NOP	nop
	.word 0x87802020  ! 48: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe09504a0  ! 49: LDUHA_R	lduha	[%r20, %r0] 0x25, %r16
	rd	%asr26, %g1
halt_hwintr_1_10:
	wr	%g1, 1, %asr26
!$EV trig_pc_d(1,expr(@VA(.MAIN.halt_hwintr_1_10), 16, 16)) -> intp(1, 0, 4)
	nop
	.word 0x01000000  ! 50: NOP	nop
	.word 0xeec6a000  ! 51: LDSWA_I	ldswa	[%r26, + 0x0000] %asi, %r23
	.word 0xeea6a000  ! 52: STWA_I	stwa	%r23, [%r26 + 0x0000] %asi
	.word 0xeebe6000  ! 53: STDA_I	stda	%r23, [%r25 + 0x0000] %asi
	.word 0xe8f74e80  ! 54: STXA_R	stxa	%r20, [%r29 + %r0] 0x74
	.word 0xe6f62000  ! 55: STXA_I	stxa	%r19, [%r24 + 0x0000] %asi
	rd	%asr26, %g1
halt_hwintr_1_11:
	wr	%g1, 1, %asr26
!$EV trig_pc_d(1,expr(@VA(.MAIN.halt_hwintr_1_11), 16, 16)) -> intp(1, 0, 4)
	nop
	.word 0x01000000  ! 56: NOP	nop
	.word 0x8780204f  ! 57: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xe6cfe000  ! 58: LDSBA_I	ldsba	[%r31, + 0x0000] %asi, %r19
	.word 0x87802025  ! 59: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0x8780204f  ! 60: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0x87802025  ! 61: WRASI_I	wr	%r0, 0x0025, %asi
	rd	%asr26, %g1
halt_hwintr_1_12:
	wr	%g1, 1, %asr26
!$EV trig_pc_d(1,expr(@VA(.MAIN.halt_hwintr_1_12), 16, 16)) -> intp(1, 0, 4)
	nop
	.word 0x01000000  ! 62: NOP	nop
	rd	%asr26, %g1
halt_hwintr_1_13:
	wr	%g1, 1, %asr26
!$EV trig_pc_d(1,expr(@VA(.MAIN.halt_hwintr_1_13), 16, 16)) -> intp(1, 0, 4)
	nop
	.word 0x01000000  ! 63: NOP	nop
	mov	0x20, %r25
	.word 0x87802025  ! 65: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0xe6bd6000  ! 66: STDA_I	stda	%r19, [%r21 + 0x0000] %asi
	.word 0xe6bde000  ! 67: STDA_I	stda	%r19, [%r23 + 0x0000] %asi
	.word 0xe685e000  ! 68: LDUWA_I	lduwa	[%r23, + 0x0000] %asi, %r19
	.word 0xe6d5e000  ! 69: LDSHA_I	ldsha	[%r23, + 0x0000] %asi, %r19
	.word 0xe8c7ce80  ! 70: LDSWA_R	ldswa	[%r31, %r0] 0x74, %r20
	.word 0xe6f5a000  ! 71: STXA_I	stxa	%r19, [%r22 + 0x0000] %asi
	mov	0x78, %r26
	.word 0x8780204f  ! 73: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xe6b52000  ! 74: STHA_I	stha	%r19, [%r20 + 0x0000] %asi
	.word 0xe6cda000  ! 75: LDSBA_I	ldsba	[%r22, + 0x0000] %asi, %r19
	.word 0xe6f5e000  ! 76: STXA_I	stxa	%r19, [%r23 + 0x0000] %asi
	rd	%asr26, %g1
halt_hwintr_1_14:
	wr	%g1, 1, %asr26
!$EV trig_pc_d(1,expr(@VA(.MAIN.halt_hwintr_1_14), 16, 16)) -> intp(1, 0, 4)
	nop
	.word 0x01000000  ! 77: NOP	nop
	.word 0xe2f6c9e0  ! 78: STXA_R	stxa	%r17, [%r27 + %r0] 0x4f
	.word 0xe4a609e0  ! 79: STWA_R	stwa	%r18, [%r24 + %r0] 0x4f
	.word 0xe4852000  ! 80: LDUWA_I	lduwa	[%r20, + 0x0000] %asi, %r18
	rd	%asr26, %g1
halt_hwintr_1_15:
	wr	%g1, 1, %asr26
!$EV trig_pc_d(1,expr(@VA(.MAIN.halt_hwintr_1_15), 16, 16)) -> intp(1, 0, 4)
	nop
	.word 0x01000000  ! 81: NOP	nop
	.word 0xe4852000  ! 82: LDUWA_I	lduwa	[%r20, + 0x0000] %asi, %r18
	.word 0xe4952000  ! 83: LDUHA_I	lduha	[%r20, + 0x0000] %asi, %r18
	rd	%asr26, %g1
halt_hwintr_1_16:
	wr	%g1, 1, %asr26
!$EV trig_pc_d(1,expr(@VA(.MAIN.halt_hwintr_1_16), 16, 16)) -> intp(1, 0, 4)
	nop
	.word 0x01000000  ! 84: NOP	nop
	.word 0xe6c7ce40  ! 85: LDSWA_R	ldswa	[%r31, %r0] 0x72, %r19
	.word 0xea8f4e60  ! 86: LDUBA_R	lduba	[%r29, %r0] 0x73, %r21
	.word 0x87802020  ! 87: WRASI_I	wr	%r0, 0x0020, %asi
	rd	%asr26, %g1
halt_hwintr_1_17:
	wr	%g1, 1, %asr26
!$EV trig_pc_d(1,expr(@VA(.MAIN.halt_hwintr_1_17), 16, 16)) -> intp(1, 0, 4)
	nop
	.word 0x01000000  ! 88: NOP	nop
	.word 0xe8f74e60  ! 89: STXA_R	stxa	%r20, [%r29 + %r0] 0x73
	.word 0xec8ea000  ! 90: LDUBA_I	lduba	[%r26, + 0x0000] %asi, %r22
	.word 0xe884c400  ! 91: LDUWA_R	lduwa	[%r19, %r0] 0x20, %r20
	rd	%asr26, %g1
halt_hwintr_1_18:
	wr	%g1, 1, %asr26
!$EV trig_pc_d(1,expr(@VA(.MAIN.halt_hwintr_1_18), 16, 16)) -> intp(1, 0, 4)
	nop
	.word 0x01000000  ! 92: NOP	nop
	.word 0xeaa4c400  ! 93: STWA_R	stwa	%r21, [%r19 + %r0] 0x20
	rd	%asr26, %g1
halt_hwintr_1_19:
	wr	%g1, 1, %asr26
!$EV trig_pc_d(1,expr(@VA(.MAIN.halt_hwintr_1_19), 16, 16)) -> intp(1, 0, 4)
	nop
	.word 0x01000000  ! 94: NOP	nop
	.word 0xe2a584a0  ! 95: STWA_R	stwa	%r17, [%r22 + %r0] 0x25
	.word 0x8780204f  ! 96: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xe297ce60  ! 97: LDUHA_R	lduha	[%r31, %r0] 0x73, %r17
	rd	%asr26, %g1
halt_hwintr_1_20:
	wr	%g1, 1, %asr26
!$EV trig_pc_d(1,expr(@VA(.MAIN.halt_hwintr_1_20), 16, 16)) -> intp(1, 0, 4)
	nop
	.word 0x01000000  ! 98: NOP	nop
	.word 0xe8aec9e0  ! 99: STBA_R	stba	%r20, [%r27 + %r0] 0x4f
	rd	%asr26, %g1
halt_hwintr_1_21:
	wr	%g1, 1, %asr26
!$EV trig_pc_d(1,expr(@VA(.MAIN.halt_hwintr_1_21), 16, 16)) -> intp(1, 0, 4)
	nop
	.word 0x01000000  ! 100: NOP	nop
	.word 0x8780204f  ! 101: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xecb4a000  ! 102: STHA_I	stha	%r22, [%r18 + 0x0000] %asi
	rd	%asr26, %g1
halt_hwintr_1_22:
	wr	%g1, 1, %asr26
!$EV trig_pc_d(1,expr(@VA(.MAIN.halt_hwintr_1_22), 16, 16)) -> intp(1, 0, 4)
	nop
	.word 0x01000000  ! 103: NOP	nop
	.word 0xecf4e000  ! 104: STXA_I	stxa	%r22, [%r19 + 0x0000] %asi
	.word 0xeccce000  ! 105: LDSBA_I	ldsba	[%r19, + 0x0000] %asi, %r22
	.word 0x87802020  ! 106: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xecd76000  ! 107: LDSHA_I	ldsha	[%r29, + 0x0000] %asi, %r22
	.word 0x87802073  ! 108: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0x87802072  ! 109: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0x8780204f  ! 110: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xecbc8400  ! 111: STDA_R	stda	%r22, [%r18 + %r0] 0x20
	mov	0x40, %r17
	rd	%asr26, %g1
halt_hwintr_1_23:
	wr	%g1, 1, %asr26
!$EV trig_pc_d(1,expr(@VA(.MAIN.halt_hwintr_1_23), 16, 16)) -> intp(1, 0, 4)
	nop
	.word 0x01000000  ! 113: NOP	nop
	.word 0xe086a000  ! 114: LDUWA_I	lduwa	[%r26, + 0x0000] %asi, %r16
	rd	%asr26, %g1
halt_hwintr_1_24:
	wr	%g1, 1, %asr26
!$EV trig_pc_d(1,expr(@VA(.MAIN.halt_hwintr_1_24), 16, 16)) -> intp(1, 0, 4)
	nop
	.word 0x01000000  ! 115: NOP	nop
	.word 0xe0a6a000  ! 116: STWA_I	stwa	%r16, [%r26 + 0x0000] %asi
	.word 0xe0f6e000  ! 117: STXA_I	stxa	%r16, [%r27 + 0x0000] %asi
	mov	0x70, %r26
	mov	0x3d0, %r21
	rd	%asr26, %g1
halt_hwintr_1_25:
	wr	%g1, 1, %asr26
!$EV trig_pc_d(1,expr(@VA(.MAIN.halt_hwintr_1_25), 16, 16)) -> intp(1, 0, 4)
	nop
	.word 0x01000000  ! 120: NOP	nop
	.word 0xe4afce40  ! 121: STBA_R	stba	%r18, [%r31 + %r0] 0x72
	rd	%asr26, %g1
halt_hwintr_1_26:
	wr	%g1, 1, %asr26
!$EV trig_pc_d(1,expr(@VA(.MAIN.halt_hwintr_1_26), 16, 16)) -> intp(1, 0, 4)
	nop
	.word 0x01000000  ! 122: NOP	nop
	.word 0xe0dc8400  ! 123: LDXA_R	ldxa	[%r18, %r0] 0x20, %r16
	.word 0xe2be2000  ! 124: STDA_I	stda	%r17, [%r24 + 0x0000] %asi
	.word 0x8780204f  ! 125: WRASI_I	wr	%r0, 0x004f, %asi
	rd	%asr26, %g1
halt_hwintr_1_27:
	wr	%g1, 1, %asr26
!$EV trig_pc_d(1,expr(@VA(.MAIN.halt_hwintr_1_27), 16, 16)) -> intp(1, 0, 4)
	nop
	.word 0x01000000  ! 126: NOP	nop
	.word 0xe2b7e000  ! 127: STHA_I	stha	%r17, [%r31 + 0x0000] %asi
	.word 0xeaa74e80  ! 128: STWA_R	stwa	%r21, [%r29 + %r0] 0x74
	rd	%asr26, %g1
halt_hwintr_1_28:
	wr	%g1, 1, %asr26
!$EV trig_pc_d(1,expr(@VA(.MAIN.halt_hwintr_1_28), 16, 16)) -> intp(1, 0, 4)
	nop
	.word 0x01000000  ! 129: NOP	nop
	.word 0xe0b7a000  ! 130: STHA_I	stha	%r16, [%r30 + 0x0000] %asi
	.word 0xe0dfa000  ! 131: LDXA_I	ldxa	[%r30, + 0x0000] %asi, %r16
	.word 0x87802025  ! 132: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0xe69584a0  ! 133: LDUHA_R	lduha	[%r22, %r0] 0x25, %r19
	.word 0x87802072  ! 134: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0xeabf8e40  ! 135: STDA_R	stda	%r21, [%r30 + %r0] 0x72
	.word 0xe8978e40  ! 136: LDUHA_R	lduha	[%r30, %r0] 0x72, %r20
	.word 0xe2b649e0  ! 137: STHA_R	stha	%r17, [%r25 + %r0] 0x4f
	.word 0xe0d74e60  ! 138: LDSHA_R	ldsha	[%r29, %r0] 0x73, %r16
	.word 0x8780204f  ! 139: WRASI_I	wr	%r0, 0x004f, %asi
	mov	0x18, %r27
	mov	0x50, %r27
	.word 0xeedc0400  ! 142: LDXA_R	ldxa	[%r16, %r0] 0x20, %r23
	.word 0xe4afa000  ! 143: STBA_I	stba	%r18, [%r30 + 0x0000] %asi
	.word 0x87802025  ! 144: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0xe48ca000  ! 145: LDUBA_I	lduba	[%r18, + 0x0000] %asi, %r18
	.word 0xeac7ce60  ! 146: LDSWA_R	ldswa	[%r31, %r0] 0x73, %r21
	rd	%asr26, %g1
halt_hwintr_1_29:
	wr	%g1, 1, %asr26
!$EV trig_pc_d(1,expr(@VA(.MAIN.halt_hwintr_1_29), 16, 16)) -> intp(1, 0, 4)
	nop
	.word 0x01000000  ! 147: NOP	nop
	.word 0x87802020  ! 148: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0x87802074  ! 149: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0xecdf2000  ! 150: LDXA_I	ldxa	[%r28, + 0x0000] %asi, %r22
	.word 0xe8dfce60  ! 151: LDXA_R	ldxa	[%r31, %r0] 0x73, %r20
	rd	%asr26, %g1
halt_hwintr_1_30:
	wr	%g1, 1, %asr26
!$EV trig_pc_d(1,expr(@VA(.MAIN.halt_hwintr_1_30), 16, 16)) -> intp(1, 0, 4)
	nop
	.word 0x01000000  ! 152: NOP	nop
	.word 0xe6f70e60  ! 153: STXA_R	stxa	%r19, [%r28 + %r0] 0x73
	.word 0xe09d04a0  ! 154: LDDA_R	ldda	[%r20, %r0] 0x25, %r16
	rd	%asr26, %g1
halt_hwintr_1_31:
	wr	%g1, 1, %asr26
!$EV trig_pc_d(1,expr(@VA(.MAIN.halt_hwintr_1_31), 16, 16)) -> intp(1, 0, 4)
	nop
	.word 0x01000000  ! 155: NOP	nop
	.word 0xe0bfe000  ! 156: STDA_I	stda	%r16, [%r31 + 0x0000] %asi
	.word 0xe0f7e000  ! 157: STXA_I	stxa	%r16, [%r31 + 0x0000] %asi
	mov	0x7f0, %r20
	rd	%asr26, %g1
halt_hwintr_1_32:
	wr	%g1, 1, %asr26
!$EV trig_pc_d(1,expr(@VA(.MAIN.halt_hwintr_1_32), 16, 16)) -> intp(1, 0, 4)
	nop
	.word 0x01000000  ! 159: NOP	nop
	.word 0x87802074  ! 160: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0xe6f4c400  ! 161: STXA_R	stxa	%r19, [%r19 + %r0] 0x20
	rd	%asr26, %g1
halt_hwintr_1_33:
	wr	%g1, 1, %asr26
!$EV trig_pc_d(1,expr(@VA(.MAIN.halt_hwintr_1_33), 16, 16)) -> intp(1, 0, 4)
	nop
	.word 0x01000000  ! 162: NOP	nop
	.word 0x87802074  ! 163: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0xe4bf2000  ! 164: STDA_I	stda	%r18, [%r28 + 0x0000] %asi
	.word 0x8780204f  ! 165: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xe2874e60  ! 166: LDUWA_R	lduwa	[%r29, %r0] 0x73, %r17
	.word 0x87802025  ! 167: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0xecce2000  ! 168: LDSBA_I	ldsba	[%r24, + 0x0000] %asi, %r22
	.word 0x87802074  ! 169: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0x87802025  ! 170: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0xecd5a000  ! 171: LDSHA_I	ldsha	[%r22, + 0x0000] %asi, %r22
	rd	%asr26, %g1
halt_hwintr_1_34:
	wr	%g1, 1, %asr26
!$EV trig_pc_d(1,expr(@VA(.MAIN.halt_hwintr_1_34), 16, 16)) -> intp(1, 0, 4)
	nop
	.word 0x01000000  ! 172: NOP	nop
	.word 0xecf56000  ! 173: STXA_I	stxa	%r22, [%r21 + 0x0000] %asi
	.word 0x87802073  ! 174: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0xecf72000  ! 175: STXA_I	stxa	%r22, [%r28 + 0x0000] %asi
	.word 0xeca7a000  ! 176: STWA_I	stwa	%r22, [%r30 + 0x0000] %asi
	rd	%asr26, %g1
halt_hwintr_1_35:
	wr	%g1, 1, %asr26
!$EV trig_pc_d(1,expr(@VA(.MAIN.halt_hwintr_1_35), 16, 16)) -> intp(1, 0, 4)
	nop
	.word 0x01000000  ! 177: NOP	nop
	.word 0xecbf2000  ! 178: STDA_I	stda	%r22, [%r28 + 0x0000] %asi
	.word 0xeca7a000  ! 179: STWA_I	stwa	%r22, [%r30 + 0x0000] %asi
	.word 0xecbfa000  ! 180: STDA_I	stda	%r22, [%r30 + 0x0000] %asi
	.word 0xeabfce40  ! 181: STDA_R	stda	%r21, [%r31 + %r0] 0x72
	.word 0x87802020  ! 182: WRASI_I	wr	%r0, 0x0020, %asi
	rd	%asr26, %g1
halt_hwintr_1_36:
	wr	%g1, 1, %asr26
!$EV trig_pc_d(1,expr(@VA(.MAIN.halt_hwintr_1_36), 16, 16)) -> intp(1, 0, 4)
	nop
	.word 0x01000000  ! 183: NOP	nop
	.word 0xe4dc2000  ! 184: LDXA_I	ldxa	[%r16, + 0x0000] %asi, %r18
	.word 0xe8a74e60  ! 185: STWA_R	stwa	%r20, [%r29 + %r0] 0x73
	.word 0xe0cf4e60  ! 186: LDSBA_R	ldsba	[%r29, %r0] 0x73, %r16
	.word 0x87802025  ! 187: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0xe4ac2000  ! 188: STBA_I	stba	%r18, [%r16 + 0x0000] %asi
	.word 0xe2aec9e0  ! 189: STBA_R	stba	%r17, [%r27 + %r0] 0x4f
	.word 0x8780204f  ! 190: WRASI_I	wr	%r0, 0x004f, %asi
	rd	%asr26, %g1
halt_hwintr_1_37:
	wr	%g1, 1, %asr26
!$EV trig_pc_d(1,expr(@VA(.MAIN.halt_hwintr_1_37), 16, 16)) -> intp(1, 0, 4)
	nop
	.word 0x01000000  ! 191: NOP	nop
	rd	%asr26, %g1
halt_hwintr_1_38:
	wr	%g1, 1, %asr26
!$EV trig_pc_d(1,expr(@VA(.MAIN.halt_hwintr_1_38), 16, 16)) -> intp(1, 0, 4)
	nop
	.word 0x01000000  ! 192: NOP	nop
	.word 0xe8a4e000  ! 193: STWA_I	stwa	%r20, [%r19 + 0x0000] %asi
	.word 0xe4af0e60  ! 194: STBA_R	stba	%r18, [%r28 + %r0] 0x73
	.word 0xe0a4a000  ! 195: STWA_I	stwa	%r16, [%r18 + 0x0000] %asi
	rd	%asr26, %g1
halt_hwintr_1_39:
	wr	%g1, 1, %asr26
!$EV trig_pc_d(1,expr(@VA(.MAIN.halt_hwintr_1_39), 16, 16)) -> intp(1, 0, 4)
	nop
	.word 0x01000000  ! 196: NOP	nop
	.word 0xe0aca000  ! 197: STBA_I	stba	%r16, [%r18 + 0x0000] %asi
	.word 0x87802020  ! 198: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe0a42000  ! 199: STWA_I	stwa	%r16, [%r16 + 0x0000] %asi

join_lbl_0_0:
!		$EV trig_pc_d(1,expr(@VA(.RED_EXT_SEC.HRedmode_Reset_Handler) + 4, 16, 16)) -> intp(1, 1, 1)
!		$EV trig_pc_d(1,expr(@VA(.RED_EXT_SEC.HRedmode_Reset_Handler) + 8, 16, 16)) -> intp(2, 1, 1)
!		$EV trig_pc_d(1,expr(@VA(.RED_EXT_SEC.HRedmode_Reset_Handler) + 12, 16, 16)) -> intp(3, 1, 1)
	.data
data_start:

	.xword	0x66cf74676b9125c8
	.xword	0xecf0dfe09080e1f0
	.xword	0x7721b4cbdcea4a68
	.xword	0xd6eb840a8bc6871f
	.xword	0xb039bbd5a06fe8c0
	.xword	0xa765c6846ba82cb8
	.xword	0x340abd0b6dd0ea1f
	.xword	0xeabeebb25b92340d
	.xword	0xfaef44898289a290
	.xword	0xe6e51eeb4f598e4e
	.xword	0x8c8bed652ff4a616
	.xword	0xb939638c1b199c6a
	.xword	0x3ea37ac45a93f80f
	.xword	0x4a9a8c40e820c197
	.xword	0x651c814dbc86e730
	.xword	0x0e0a1221a79f8c0b



.text
	ta	T_GOOD_TRAP

.data
	.xword 0x1234567887654321

#if 0
!!# /* File:	tlu_sus_res_11.j
!!#  * Description:
!!#  * This temple is targets the suspend_resume coverage object, by interseting
!!#  * halt instructions and hw interrupt events in between the asi access
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
!!#           IJ_printf (th_all, "halt_hwintr_%y_%d:\n", loop_cnt);
!!#           IJ_printf (th_all, "\twr\t%%g1, 1, %%asr26\n");
!!# 	  IJ_printf (th_all, "!$EV trig_pc_d(%y,expr(@VA(.MAIN.halt_hwintr_%y_%d), 16, 16)) -> intp(%y, 0, %d)\n", loop_cnt, Rv_intr_vect);
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
