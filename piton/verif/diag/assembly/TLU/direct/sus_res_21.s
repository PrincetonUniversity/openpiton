// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: sus_res_21.s
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
   random seed:	426513671
   Jal tlu_sus_res_21.j:	
********************************************************************************/



#define PCONTEXT	0x10
#define SCONTEXT	0x10

#define MAIN_PAGE_NUCLEUS_ALSO
#define MAIN_PAGE_HV_ALSO

#define ALL_MY_INTR_HANDLERS
#include "my_intr_handlers.s"
#include "my_trap_handlers.s"

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

	setx 0x30f6f1337913ee07, %g1, %g0
	setx 0x68a4c84d53bd5757, %g1, %g1
	setx 0x82e6500f661178ed, %g1, %g2
	setx 0x5ad23cd64459f8a5, %g1, %g3
	setx 0x39445a91269a6179, %g1, %g4
	setx 0x641f12d5e714be65, %g1, %g5
	setx 0xe1d8c80e179495dc, %g1, %g6
	setx 0x98d0b7da6047244b, %g1, %g7
	setx 0x04e6d8f1b2094eb0, %g1, %r16
	setx 0x0534f72ea1895598, %g1, %r17
	setx 0x3d351c3d62093401, %g1, %r18
	setx 0x81fe90bd57ed0bad, %g1, %r19
	setx 0x02a06786239ea533, %g1, %r20
	setx 0xed2de4b88caf780b, %g1, %r21
	setx 0xa79f0cea74d68b44, %g1, %r22
	setx 0x147789d10910fe32, %g1, %r23
	setx 0xc127634f775ad13f, %g1, %r24
	setx 0xc094f065cd638295, %g1, %r25
	setx 0xcecfd34df55770c5, %g1, %r26
	setx 0xef8e4000ff080dc2, %g1, %r27
	setx 0x0c302df6d1572fdc, %g1, %r28
	setx 0xc33e4b0a6ddacca5, %g1, %r29
	setx 0xb9ca4f9f2bd99794, %g1, %r30
	setx 0xf43c6dd103a20e95, %g1, %r31
	save
	setx 0x4ef6e17bda7bb55a, %g1, %r16
	setx 0xffc9f9c60adf2a50, %g1, %r17
	setx 0x87ffe2641484e7dd, %g1, %r18
	setx 0xe2376c3a3956be68, %g1, %r19
	setx 0x42ce7588e2072967, %g1, %r20
	setx 0x31b1f19837206807, %g1, %r21
	setx 0x24e742be2680e6d7, %g1, %r22
	setx 0x875a8016ab9714f8, %g1, %r23
	setx 0x8f331d04c7574cd8, %g1, %r24
	setx 0x31e41ee5bc38a032, %g1, %r25
	setx 0x503750bb4af1c106, %g1, %r26
	setx 0x2d594bc6206e4ab6, %g1, %r27
	setx 0xbbd0ff408018a9e4, %g1, %r28
	setx 0xbd2db9311a097a73, %g1, %r29
	setx 0x13cb293583673862, %g1, %r30
	setx 0x595a19870159565c, %g1, %r31
	save
	setx 0x05b018d911751350, %g1, %r16
	setx 0x79e364f345d8c778, %g1, %r17
	setx 0x8e1cc15671f23612, %g1, %r18
	setx 0x56d8369f0a50010d, %g1, %r19
	setx 0x3613b40cc5871f41, %g1, %r20
	setx 0xc598db4710af4b3d, %g1, %r21
	setx 0x46d0fb298888636a, %g1, %r22
	setx 0xfaa4839499199bc9, %g1, %r23
	setx 0x2e705da3ab3a64c0, %g1, %r24
	setx 0x3c0253795891d714, %g1, %r25
	setx 0x5a882b175ddbf8c3, %g1, %r26
	setx 0x85b3ea9f0fcf560d, %g1, %r27
	setx 0x9526a06a338ea54f, %g1, %r28
	setx 0x5b387c3da643f2f9, %g1, %r29
	setx 0xec242a4dd8e1dce1, %g1, %r30
	setx 0x7838f529afa5641f, %g1, %r31
	restore
	setx	data_start, %r1, %r25
	mov	0x60, %r16
	mov	0x0, %r17
	mov	0x50, %r18
	mov	0x18, %r19
	mov	0x7d0, %r20
	mov	0x3d0, %r21
	mov	0x3c8, %r22
	mov	0x7f8, %r23
	mov	0x20, %r24
	mov	0x68, %r25
	mov	0x48, %r26
	mov	0x20, %r27
	mov	0, %r28
	mov	0, %r29
	mov	0, %r30
	mov	0, %r31
	ta	%icc, T_CHANGE_HPRIV
	wr	%g0, 0x20, %asi
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
	mov	0x68, %r24
	.word 0xe884a000  ! 2: LDUWA_I	lduwa	[%r18, + 0x0000] %asi, %r20
	.word 0x87802073  ! 3: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0xe8872000  ! 4: LDUWA_I	lduwa	[%r28, + 0x0000] %asi, %r20
	.word 0xe8bf2000  ! 5: STDA_I	stda	%r20, [%r28 + 0x0000] %asi
	.word 0xe4acc400  ! 6: STBA_R	stba	%r18, [%r19 + %r0] 0x20
	.word 0xe4b72000  ! 7: STHA_I	stha	%r18, [%r28 + 0x0000] %asi
	.word 0xe4f76000  ! 8: STXA_I	stxa	%r18, [%r29 + 0x0000] %asi
	.word 0xe4bfe000  ! 9: STDA_I	stda	%r18, [%r31 + 0x0000] %asi
	mov	0x68, %r24
	.word 0x87802074  ! 11: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0xe4af6000  ! 12: STBA_I	stba	%r18, [%r29 + 0x0000] %asi
	.word 0xe4a76000  ! 13: STWA_I	stwa	%r18, [%r29 + 0x0000] %asi
	.word 0x8780204f  ! 14: WRASI_I	wr	%r0, 0x004f, %asi
	mov	0x3f0, %r23
	.word 0x87802020  ! 16: WRASI_I	wr	%r0, 0x0020, %asi
idle_0:
!$EV trig_pc_d(0,expr(@VA(.MAIN.idle_0), 16, 16)) -> intp(1, 2, 4)
	.word 0x01000000  ! 17: NOP	nop
	.word 0xe8ad44a0  ! 18: STBA_R	stba	%r20, [%r21 + %r0] 0x25
	.word 0xe8bce000  ! 19: STDA_I	stda	%r20, [%r19 + 0x0000] %asi
	.word 0xe88ca000  ! 20: LDUBA_I	lduba	[%r18, + 0x0000] %asi, %r20
hwintr_0:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0), 16, 16)) -> intp(1, 0, 4)
	.word 0x01000000  ! 21: NOP	nop
resume_0:
!$EV trig_pc_d(0,expr(@VA(.MAIN.resume_0), 16, 16)) -> intp(1, 3, 4)
	.word 0x01000000  ! 22: NOP	nop
	.word 0xe8bce000  ! 23: STDA_I	stda	%r20, [%r19 + 0x0000] %asi
	.word 0xe894e000  ! 24: LDUHA_I	lduha	[%r19, + 0x0000] %asi, %r20
	.word 0xe8bc6000  ! 25: STDA_I	stda	%r20, [%r17 + 0x0000] %asi
	ta	T_CHANGE_HPRIV	! macro
	.word 0xe8f609e0  ! 27: STXA_R	stxa	%r20, [%r24 + %r0] 0x4f
	.word 0xe8a70e60  ! 28: STWA_R	stwa	%r20, [%r28 + %r0] 0x73
	.word 0x87802020  ! 29: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe484c400  ! 30: LDUWA_R	lduwa	[%r19, %r0] 0x20, %r18
	.word 0xeebf4e60  ! 31: STDA_R	stda	%r23, [%r29 + %r0] 0x73
	.word 0xeacf4e80  ! 32: LDSBA_R	ldsba	[%r29, %r0] 0x74, %r21
	.word 0xec8f4e80  ! 33: LDUBA_R	lduba	[%r29, %r0] 0x74, %r22
	.word 0xeef70e80  ! 34: STXA_R	stxa	%r23, [%r28 + %r0] 0x74
idle_1:
!$EV trig_pc_d(0,expr(@VA(.MAIN.idle_1), 16, 16)) -> intp(2, 2, 4)
	.word 0x01000000  ! 35: NOP	nop
hwintr_1:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_1), 16, 16)) -> intp(2, 0, 4)
	.word 0x01000000  ! 36: NOP	nop
	.word 0xe6df0e80  ! 37: LDXA_R	ldxa	[%r28, %r0] 0x74, %r19
	.word 0xe09c8400  ! 38: LDDA_R	ldda	[%r18, %r0] 0x20, %r16
	.word 0xeeaf4e80  ! 39: STBA_R	stba	%r23, [%r29 + %r0] 0x74
	.word 0xeef42000  ! 40: STXA_I	stxa	%r23, [%r16 + 0x0000] %asi
resume_1:
!$EV trig_pc_d(0,expr(@VA(.MAIN.resume_1), 16, 16)) -> intp(2, 3, 4)
	.word 0x01000000  ! 41: NOP	nop
	.word 0xeeb42000  ! 42: STHA_I	stha	%r23, [%r16 + 0x0000] %asi
	.word 0xe2a74e80  ! 43: STWA_R	stwa	%r17, [%r29 + %r0] 0x74
idle_2:
!$EV trig_pc_d(0,expr(@VA(.MAIN.idle_2), 16, 16)) -> intp(3, 2, 4)
	.word 0x01000000  ! 44: NOP	nop
	.word 0x8780204f  ! 45: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xe6a78e40  ! 46: STWA_R	stwa	%r19, [%r30 + %r0] 0x72
	.word 0x87802025  ! 47: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0x87802072  ! 48: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0x87802020  ! 49: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe6cc2000  ! 50: LDSBA_I	ldsba	[%r16, + 0x0000] %asi, %r19
	.word 0xeeb5c4a0  ! 51: STHA_R	stha	%r23, [%r23 + %r0] 0x25
	.word 0xeedce000  ! 52: LDXA_I	ldxa	[%r19, + 0x0000] %asi, %r23
	mov	0x7d0, %r20
	.word 0xeef4a000  ! 54: STXA_I	stxa	%r23, [%r18 + 0x0000] %asi
	.word 0xeeaca000  ! 55: STBA_I	stba	%r23, [%r18 + 0x0000] %asi
	.word 0xeef4a000  ! 56: STXA_I	stxa	%r23, [%r18 + 0x0000] %asi
hwintr_2:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_2), 16, 16)) -> intp(3, 0, 4)
	.word 0x01000000  ! 57: NOP	nop
resume_2:
!$EV trig_pc_d(0,expr(@VA(.MAIN.resume_2), 16, 16)) -> intp(3, 3, 4)
	.word 0x01000000  ! 58: NOP	nop
idle_3:
!$EV trig_pc_d(0,expr(@VA(.MAIN.idle_3), 16, 16)) -> intp(1, 2, 4)
	.word 0x01000000  ! 59: NOP	nop
hwintr_3:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_3), 16, 16)) -> intp(1, 0, 4)
	.word 0x01000000  ! 60: NOP	nop
	.word 0x87802074  ! 61: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0xeea76000  ! 62: STWA_I	stwa	%r23, [%r29 + 0x0000] %asi
	.word 0xeef76000  ! 63: STXA_I	stxa	%r23, [%r29 + 0x0000] %asi
	.word 0xeec72000  ! 64: LDSWA_I	ldswa	[%r28, + 0x0000] %asi, %r23
resume_3:
!$EV trig_pc_d(0,expr(@VA(.MAIN.resume_3), 16, 16)) -> intp(1, 3, 4)
	.word 0x01000000  ! 65: NOP	nop
	.word 0x8780204f  ! 66: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xea844400  ! 67: LDUWA_R	lduwa	[%r17, %r0] 0x20, %r21
	.word 0xe8a74e40  ! 68: STWA_R	stwa	%r20, [%r29 + %r0] 0x72
idle_4:
!$EV trig_pc_d(0,expr(@VA(.MAIN.idle_4), 16, 16)) -> intp(2, 2, 4)
	.word 0x01000000  ! 69: NOP	nop
	.word 0x87802072  ! 70: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0xe8b7a000  ! 71: STHA_I	stha	%r20, [%r30 + 0x0000] %asi
	mov	0x60, %r17
	.word 0xe8bf4e40  ! 73: STDA_R	stda	%r20, [%r29 + %r0] 0x72
	.word 0xe887e000  ! 74: LDUWA_I	lduwa	[%r31, + 0x0000] %asi, %r20
	.word 0xecf6c9e0  ! 75: STXA_R	stxa	%r22, [%r27 + %r0] 0x4f
hwintr_4:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_4), 16, 16)) -> intp(2, 0, 4)
	.word 0x01000000  ! 76: NOP	nop
	.word 0x87802073  ! 77: WRASI_I	wr	%r0, 0x0073, %asi
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x87802073  ! 79: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0xe2bf4e60  ! 80: STDA_R	stda	%r17, [%r29 + %r0] 0x73
	.word 0xe2c7e000  ! 81: LDSWA_I	ldswa	[%r31, + 0x0000] %asi, %r17
	.word 0xe2cf6000  ! 82: LDSBA_I	ldsba	[%r29, + 0x0000] %asi, %r17
resume_4:
!$EV trig_pc_d(0,expr(@VA(.MAIN.resume_4), 16, 16)) -> intp(2, 3, 4)
	.word 0x01000000  ! 83: NOP	nop
	.word 0x87802073  ! 84: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0xe2f7e000  ! 85: STXA_I	stxa	%r17, [%r31 + 0x0000] %asi
	.word 0xeaf5c4a0  ! 86: STXA_R	stxa	%r21, [%r23 + %r0] 0x25
	.word 0xea972000  ! 87: LDUHA_I	lduha	[%r28, + 0x0000] %asi, %r21
	.word 0xe8a649e0  ! 88: STWA_R	stwa	%r20, [%r25 + %r0] 0x4f
	.word 0xe8b76000  ! 89: STHA_I	stha	%r20, [%r29 + 0x0000] %asi
	.word 0xe4870e60  ! 90: LDUWA_R	lduwa	[%r28, %r0] 0x73, %r18
	.word 0xe4f72000  ! 91: STXA_I	stxa	%r18, [%r28 + 0x0000] %asi
	.word 0xeec74e40  ! 92: LDSWA_R	ldswa	[%r29, %r0] 0x72, %r23
	.word 0xee9fa000  ! 93: LDDA_I	ldda	[%r30, + 0x0000] %asi, %r23
	ta	T_CHANGE_PRIV	! macro
	.word 0xeec7e000  ! 95: LDSWA_I	ldswa	[%r31, + 0x0000] %asi, %r23
idle_5:
!$EV trig_pc_d(0,expr(@VA(.MAIN.idle_5), 16, 16)) -> intp(3, 2, 4)
	.word 0x01000000  ! 96: NOP	nop
	.word 0xeeaf6000  ! 97: STBA_I	stba	%r23, [%r29 + 0x0000] %asi
	.word 0xeebfe000  ! 98: STDA_I	stda	%r23, [%r31 + 0x0000] %asi
	.word 0xe0d44400  ! 99: LDSHA_R	ldsha	[%r17, %r0] 0x20, %r16
	.word 0xe0a76000  ! 100: STWA_I	stwa	%r16, [%r29 + 0x0000] %asi
	.word 0xe0bf2000  ! 101: STDA_I	stda	%r16, [%r28 + 0x0000] %asi
	.word 0xe8ccc400  ! 102: LDSBA_R	ldsba	[%r19, %r0] 0x20, %r20
	.word 0xeacfce80  ! 103: LDSBA_R	ldsba	[%r31, %r0] 0x74, %r21
	.word 0xe4bfce40  ! 104: STDA_R	stda	%r18, [%r31 + %r0] 0x72
	.word 0xe48f2000  ! 105: LDUBA_I	lduba	[%r28, + 0x0000] %asi, %r18
	.word 0xe4872000  ! 106: LDUWA_I	lduwa	[%r28, + 0x0000] %asi, %r18
	.word 0xe6944400  ! 107: LDUHA_R	lduha	[%r17, %r0] 0x20, %r19
	.word 0xe6df0e60  ! 108: LDXA_R	ldxa	[%r28, %r0] 0x73, %r19
	.word 0xe6afa000  ! 109: STBA_I	stba	%r19, [%r30 + 0x0000] %asi
hwintr_5:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_5), 16, 16)) -> intp(3, 0, 4)
	.word 0x01000000  ! 110: NOP	nop
	.word 0xe48ec9e0  ! 111: LDUBA_R	lduba	[%r27, %r0] 0x4f, %r18
	.word 0xe4bfa000  ! 112: STDA_I	stda	%r18, [%r30 + 0x0000] %asi
	.word 0xe48f2000  ! 113: LDUBA_I	lduba	[%r28, + 0x0000] %asi, %r18
	.word 0xe4872000  ! 114: LDUWA_I	lduwa	[%r28, + 0x0000] %asi, %r18
	.word 0xe69c8400  ! 115: LDDA_R	ldda	[%r18, %r0] 0x20, %r19
	mov	0x58, %r26
resume_5:
!$EV trig_pc_d(0,expr(@VA(.MAIN.resume_5), 16, 16)) -> intp(3, 3, 4)
	.word 0x01000000  ! 117: NOP	nop
	.word 0xe6cfa000  ! 118: LDSBA_I	ldsba	[%r30, + 0x0000] %asi, %r19
	.word 0xe2df0e40  ! 119: LDXA_R	ldxa	[%r28, %r0] 0x72, %r17
	.word 0x87802073  ! 120: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0xe2a7e000  ! 121: STWA_I	stwa	%r17, [%r31 + 0x0000] %asi
idle_6:
!$EV trig_pc_d(0,expr(@VA(.MAIN.idle_6), 16, 16)) -> intp(1, 2, 4)
	.word 0x01000000  ! 122: NOP	nop
	.word 0x8780204f  ! 123: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xe2be6000  ! 124: STDA_I	stda	%r17, [%r25 + 0x0000] %asi
	.word 0xe2f584a0  ! 125: STXA_R	stxa	%r17, [%r22 + %r0] 0x25
	.word 0xe2a6a000  ! 126: STWA_I	stwa	%r17, [%r26 + 0x0000] %asi
	.word 0xe2b6e000  ! 127: STHA_I	stha	%r17, [%r27 + 0x0000] %asi
	.word 0xea9ec9e0  ! 128: LDDA_R	ldda	[%r27, %r0] 0x4f, %r21
	.word 0x87802020  ! 129: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xeab46000  ! 130: STHA_I	stha	%r21, [%r17 + 0x0000] %asi
	.word 0xe2bf8e40  ! 131: STDA_R	stda	%r17, [%r30 + %r0] 0x72
	.word 0xe8b5c4a0  ! 132: STHA_R	stha	%r20, [%r23 + %r0] 0x25
	.word 0xe8a46000  ! 133: STWA_I	stwa	%r20, [%r17 + 0x0000] %asi
	.word 0x87802074  ! 134: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0xe8cfe000  ! 135: LDSBA_I	ldsba	[%r31, + 0x0000] %asi, %r20
	.word 0xe29f4e60  ! 136: LDDA_R	ldda	[%r29, %r0] 0x73, %r17
	.word 0xe69f0e40  ! 137: LDDA_R	ldda	[%r28, %r0] 0x72, %r19
	.word 0xe4dfce80  ! 138: LDXA_R	ldxa	[%r31, %r0] 0x74, %r18
hwintr_6:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_6), 16, 16)) -> intp(1, 0, 4)
	.word 0x01000000  ! 139: NOP	nop
resume_6:
!$EV trig_pc_d(0,expr(@VA(.MAIN.resume_6), 16, 16)) -> intp(1, 3, 4)
	.word 0x01000000  ! 140: NOP	nop
	.word 0x87802025  ! 141: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0x87802072  ! 142: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0xe48f2000  ! 143: LDUBA_I	lduba	[%r28, + 0x0000] %asi, %r18
idle_7:
!$EV trig_pc_d(0,expr(@VA(.MAIN.idle_7), 16, 16)) -> intp(2, 2, 4)
	.word 0x01000000  ! 144: NOP	nop
	.word 0xe4d72000  ! 145: LDSHA_I	ldsha	[%r28, + 0x0000] %asi, %r18
	.word 0xe2c40400  ! 146: LDSWA_R	ldswa	[%r16, %r0] 0x20, %r17
	.word 0xe6948400  ! 147: LDUHA_R	lduha	[%r18, %r0] 0x20, %r19
	.word 0xeac74e80  ! 148: LDSWA_R	ldswa	[%r29, %r0] 0x74, %r21
	.word 0xeea609e0  ! 149: STWA_R	stwa	%r23, [%r24 + %r0] 0x4f
	.word 0xee876000  ! 150: LDUWA_I	lduwa	[%r29, + 0x0000] %asi, %r23
	.word 0xeeaf8e40  ! 151: STBA_R	stba	%r23, [%r30 + %r0] 0x72
	.word 0xec844400  ! 152: LDUWA_R	lduwa	[%r17, %r0] 0x20, %r22
	.word 0xec874e40  ! 153: LDUWA_R	lduwa	[%r29, %r0] 0x72, %r22
hwintr_7:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_7), 16, 16)) -> intp(2, 0, 4)
	.word 0x01000000  ! 154: NOP	nop
	.word 0xeab48400  ! 155: STHA_R	stha	%r21, [%r18 + %r0] 0x20
	.word 0xea97a000  ! 156: LDUHA_I	lduha	[%r30, + 0x0000] %asi, %r21
resume_7:
!$EV trig_pc_d(0,expr(@VA(.MAIN.resume_7), 16, 16)) -> intp(2, 3, 4)
	.word 0x01000000  ! 157: NOP	nop
	.word 0xeadcc400  ! 158: LDXA_R	ldxa	[%r19, %r0] 0x20, %r21
	.word 0xe68f4e60  ! 159: LDUBA_R	lduba	[%r29, %r0] 0x73, %r19
idle_8:
!$EV trig_pc_d(0,expr(@VA(.MAIN.idle_8), 16, 16)) -> intp(3, 2, 4)
	.word 0x01000000  ! 160: NOP	nop
	.word 0xeabf0e60  ! 161: STDA_R	stda	%r21, [%r28 + %r0] 0x73
	.word 0xeadfa000  ! 162: LDXA_I	ldxa	[%r30, + 0x0000] %asi, %r21
	.word 0x87802072  ! 163: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0xe2a4c400  ! 164: STWA_R	stwa	%r17, [%r19 + %r0] 0x20
	.word 0xe2bfe000  ! 165: STDA_I	stda	%r17, [%r31 + 0x0000] %asi
	.word 0xe2af2000  ! 166: STBA_I	stba	%r17, [%r28 + 0x0000] %asi
hwintr_8:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_8), 16, 16)) -> intp(3, 0, 4)
	.word 0x01000000  ! 167: NOP	nop
	.word 0xe2c6c9e0  ! 168: LDSWA_R	ldswa	[%r27, %r0] 0x4f, %r17
resume_8:
!$EV trig_pc_d(0,expr(@VA(.MAIN.resume_8), 16, 16)) -> intp(3, 3, 4)
	.word 0x01000000  ! 169: NOP	nop
	.word 0xe2876000  ! 170: LDUWA_I	lduwa	[%r29, + 0x0000] %asi, %r17
idle_9:
!$EV trig_pc_d(0,expr(@VA(.MAIN.idle_9), 16, 16)) -> intp(1, 2, 4)
	.word 0x01000000  ! 171: NOP	nop
	.word 0xe6dd04a0  ! 172: LDXA_R	ldxa	[%r20, %r0] 0x25, %r19
	.word 0x87802074  ! 173: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0xeab40400  ! 174: STHA_R	stha	%r21, [%r16 + %r0] 0x20
	.word 0x87802020  ! 175: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xeaf4a000  ! 176: STXA_I	stxa	%r21, [%r18 + 0x0000] %asi
hwintr_9:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_9), 16, 16)) -> intp(1, 0, 4)
	.word 0x01000000  ! 177: NOP	nop
	.word 0xe68fce60  ! 178: LDUBA_R	lduba	[%r31, %r0] 0x73, %r19
	.word 0xeeaf0e60  ! 179: STBA_R	stba	%r23, [%r28 + %r0] 0x73
	.word 0xeea42000  ! 180: STWA_I	stwa	%r23, [%r16 + 0x0000] %asi
	.word 0xe6844400  ! 181: LDUWA_R	lduwa	[%r17, %r0] 0x20, %r19
	.word 0xe6a5c4a0  ! 182: STWA_R	stwa	%r19, [%r23 + %r0] 0x25
	.word 0x8780204f  ! 183: WRASI_I	wr	%r0, 0x004f, %asi
	mov	0x3d0, %r21
	.word 0xe6966000  ! 185: LDUHA_I	lduha	[%r25, + 0x0000] %asi, %r19
	.word 0xe0acc400  ! 186: STBA_R	stba	%r16, [%r19 + %r0] 0x20
	.word 0xe4bf4e80  ! 187: STDA_R	stda	%r18, [%r29 + %r0] 0x74
	.word 0xe48e2000  ! 188: LDUBA_I	lduba	[%r24, + 0x0000] %asi, %r18
	.word 0xe4be6000  ! 189: STDA_I	stda	%r18, [%r25 + 0x0000] %asi
	.word 0xe2df8e80  ! 190: LDXA_R	ldxa	[%r30, %r0] 0x74, %r17
	.word 0xee8c0400  ! 191: LDUBA_R	lduba	[%r16, %r0] 0x20, %r23
	.word 0x8780204f  ! 192: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xe4c7ce80  ! 193: LDSWA_R	ldswa	[%r31, %r0] 0x74, %r18
	.word 0xe4cee000  ! 194: LDSBA_I	ldsba	[%r27, + 0x0000] %asi, %r18
	.word 0xe2c40400  ! 195: LDSWA_R	ldswa	[%r16, %r0] 0x20, %r17
	.word 0xe29ea000  ! 196: LDDA_I	ldda	[%r26, + 0x0000] %asi, %r17
	.word 0xe2f66000  ! 197: STXA_I	stxa	%r17, [%r25 + 0x0000] %asi
	.word 0xe2a6e000  ! 198: STWA_I	stwa	%r17, [%r27 + 0x0000] %asi
resume_9:
!$EV trig_pc_d(0,expr(@VA(.MAIN.resume_9), 16, 16)) -> intp(1, 3, 4)
	.word 0x01000000  ! 199: NOP	nop
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_3:
	mov	0x0, %r26
	.word 0xe8842000  ! 2: LDUWA_I	lduwa	[%r16, + 0x0000] %asi, %r20
	.word 0x87802020  ! 3: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe8872000  ! 4: LDUWA_I	lduwa	[%r28, + 0x0000] %asi, %r20
	.word 0xe8bfa000  ! 5: STDA_I	stda	%r20, [%r30 + 0x0000] %asi
	.word 0xe0afce60  ! 6: STBA_R	stba	%r16, [%r31 + %r0] 0x73
	.word 0xe4b72000  ! 7: STHA_I	stha	%r18, [%r28 + 0x0000] %asi
	.word 0xe4f72000  ! 8: STXA_I	stxa	%r18, [%r28 + 0x0000] %asi
	.word 0xe4bf2000  ! 9: STDA_I	stda	%r18, [%r28 + 0x0000] %asi
	mov	0x10, %r24
	.word 0x87802025  ! 11: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0xe4afa000  ! 12: STBA_I	stba	%r18, [%r30 + 0x0000] %asi
	.word 0xe4a76000  ! 13: STWA_I	stwa	%r18, [%r29 + 0x0000] %asi
	.word 0x87802020  ! 14: WRASI_I	wr	%r0, 0x0020, %asi
	mov	0x7e0, %r23
	.word 0x87802020  ! 16: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0x01000000  ! 17: NOP	nop
	.word 0xecacc400  ! 18: STBA_R	stba	%r22, [%r19 + %r0] 0x20
	.word 0xe8bc2000  ! 19: STDA_I	stda	%r20, [%r16 + 0x0000] %asi
	.word 0xe88c6000  ! 20: LDUBA_I	lduba	[%r17, + 0x0000] %asi, %r20
	.word 0x01000000  ! 21: NOP	nop
	.word 0x01000000  ! 22: NOP	nop
	.word 0xe8bce000  ! 23: STDA_I	stda	%r20, [%r19 + 0x0000] %asi
	.word 0xe8946000  ! 24: LDUHA_I	lduha	[%r17, + 0x0000] %asi, %r20
	.word 0xe8bca000  ! 25: STDA_I	stda	%r20, [%r18 + 0x0000] %asi
	ta	T_CHANGE_HPRIV	! macro
	.word 0xe8f7ce80  ! 27: STXA_R	stxa	%r20, [%r31 + %r0] 0x74
	.word 0xe6a78e80  ! 28: STWA_R	stwa	%r19, [%r30 + %r0] 0x74
	.word 0x87802020  ! 29: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe6878e60  ! 30: LDUWA_R	lduwa	[%r30, %r0] 0x73, %r19
	.word 0xeebc8400  ! 31: STDA_R	stda	%r23, [%r18 + %r0] 0x20
	.word 0xe6cc4400  ! 32: LDSBA_R	ldsba	[%r17, %r0] 0x20, %r19
	.word 0xe68c0400  ! 33: LDUBA_R	lduba	[%r16, %r0] 0x20, %r19
	.word 0xeaf48400  ! 34: STXA_R	stxa	%r21, [%r18 + %r0] 0x20
	.word 0x01000000  ! 35: NOP	nop
	.word 0x01000000  ! 36: NOP	nop
	.word 0xe2de89e0  ! 37: LDXA_R	ldxa	[%r26, %r0] 0x4f, %r17
	.word 0xec9d44a0  ! 38: LDDA_R	ldda	[%r21, %r0] 0x25, %r22
	.word 0xeeaf4e80  ! 39: STBA_R	stba	%r23, [%r29 + %r0] 0x74
	.word 0xeef42000  ! 40: STXA_I	stxa	%r23, [%r16 + 0x0000] %asi
	.word 0x01000000  ! 41: NOP	nop
	.word 0xeeb46000  ! 42: STHA_I	stha	%r23, [%r17 + 0x0000] %asi
	.word 0xe4a7ce60  ! 43: STWA_R	stwa	%r18, [%r31 + %r0] 0x73
	.word 0x01000000  ! 44: NOP	nop
	.word 0x8780204f  ! 45: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xeca78e60  ! 46: STWA_R	stwa	%r22, [%r30 + %r0] 0x73
	.word 0x87802025  ! 47: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0x87802073  ! 48: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0x8780204f  ! 49: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xe6cc6000  ! 50: LDSBA_I	ldsba	[%r17, + 0x0000] %asi, %r19
	.word 0xe2b7ce80  ! 51: STHA_R	stha	%r17, [%r31 + %r0] 0x74
	.word 0xeedce000  ! 52: LDXA_I	ldxa	[%r19, + 0x0000] %asi, %r23
	mov	0x7e8, %r22
	.word 0xeef46000  ! 54: STXA_I	stxa	%r23, [%r17 + 0x0000] %asi
	.word 0xeeac6000  ! 55: STBA_I	stba	%r23, [%r17 + 0x0000] %asi
	.word 0xeef4a000  ! 56: STXA_I	stxa	%r23, [%r18 + 0x0000] %asi
	.word 0x01000000  ! 57: NOP	nop
	.word 0x01000000  ! 58: NOP	nop
	.word 0x01000000  ! 59: NOP	nop
	.word 0x01000000  ! 60: NOP	nop
	.word 0x87802020  ! 61: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xeea76000  ! 62: STWA_I	stwa	%r23, [%r29 + 0x0000] %asi
	.word 0xeef7a000  ! 63: STXA_I	stxa	%r23, [%r30 + 0x0000] %asi
	.word 0xeec7e000  ! 64: LDSWA_I	ldswa	[%r31, + 0x0000] %asi, %r23
	.word 0x01000000  ! 65: NOP	nop
	.word 0x87802074  ! 66: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0xec844400  ! 67: LDUWA_R	lduwa	[%r17, %r0] 0x20, %r22
	.word 0xe0a74e60  ! 68: STWA_R	stwa	%r16, [%r29 + %r0] 0x73
	.word 0x01000000  ! 69: NOP	nop
	.word 0x87802020  ! 70: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe8b7a000  ! 71: STHA_I	stha	%r20, [%r30 + 0x0000] %asi
	mov	0x40, %r16
	.word 0xeebf4e60  ! 73: STDA_R	stda	%r23, [%r29 + %r0] 0x73
	.word 0xe8872000  ! 74: LDUWA_I	lduwa	[%r28, + 0x0000] %asi, %r20
	.word 0xecf74e40  ! 75: STXA_R	stxa	%r22, [%r29 + %r0] 0x72
	.word 0x01000000  ! 76: NOP	nop
	.word 0x87802025  ! 77: WRASI_I	wr	%r0, 0x0025, %asi
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x87802020  ! 79: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe6bd84a0  ! 80: STDA_R	stda	%r19, [%r22 + %r0] 0x25
	.word 0xe2c7e000  ! 81: LDSWA_I	ldswa	[%r31, + 0x0000] %asi, %r17
	.word 0xe2cfa000  ! 82: LDSBA_I	ldsba	[%r30, + 0x0000] %asi, %r17
	.word 0x01000000  ! 83: NOP	nop
	.word 0x87802020  ! 84: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe2f76000  ! 85: STXA_I	stxa	%r17, [%r29 + 0x0000] %asi
	.word 0xe2f78e60  ! 86: STXA_R	stxa	%r17, [%r30 + %r0] 0x73
	.word 0xea97e000  ! 87: LDUHA_I	lduha	[%r31, + 0x0000] %asi, %r21
	.word 0xeea78e60  ! 88: STWA_R	stwa	%r23, [%r30 + %r0] 0x73
	.word 0xe8b7e000  ! 89: STHA_I	stha	%r20, [%r31 + 0x0000] %asi
	.word 0xe687ce60  ! 90: LDUWA_R	lduwa	[%r31, %r0] 0x73, %r19
	.word 0xe4f72000  ! 91: STXA_I	stxa	%r18, [%r28 + 0x0000] %asi
	.word 0xe4c74e40  ! 92: LDSWA_R	ldswa	[%r29, %r0] 0x72, %r18
	.word 0xee9fe000  ! 93: LDDA_I	ldda	[%r31, + 0x0000] %asi, %r23
	ta	T_CHANGE_PRIV	! macro
	.word 0xeec7e000  ! 95: LDSWA_I	ldswa	[%r31, + 0x0000] %asi, %r23
	.word 0x01000000  ! 96: NOP	nop
	.word 0xeeafe000  ! 97: STBA_I	stba	%r23, [%r31 + 0x0000] %asi
	.word 0xeebf2000  ! 98: STDA_I	stda	%r23, [%r28 + 0x0000] %asi
	.word 0xe8d6c9e0  ! 99: LDSHA_R	ldsha	[%r27, %r0] 0x4f, %r20
	.word 0xe0a76000  ! 100: STWA_I	stwa	%r16, [%r29 + 0x0000] %asi
	.word 0xe0bfa000  ! 101: STDA_I	stda	%r16, [%r30 + 0x0000] %asi
	.word 0xe0cdc4a0  ! 102: LDSBA_R	ldsba	[%r23, %r0] 0x25, %r16
	.word 0xe8cc4400  ! 103: LDSBA_R	ldsba	[%r17, %r0] 0x20, %r20
	.word 0xe2bd84a0  ! 104: STDA_R	stda	%r17, [%r22 + %r0] 0x25
	.word 0xe48f2000  ! 105: LDUBA_I	lduba	[%r28, + 0x0000] %asi, %r18
	.word 0xe4876000  ! 106: LDUWA_I	lduwa	[%r29, + 0x0000] %asi, %r18
	.word 0xe2974e40  ! 107: LDUHA_R	lduha	[%r29, %r0] 0x72, %r17
	.word 0xe2dfce60  ! 108: LDXA_R	ldxa	[%r31, %r0] 0x73, %r17
	.word 0xe6af6000  ! 109: STBA_I	stba	%r19, [%r29 + 0x0000] %asi
	.word 0x01000000  ! 110: NOP	nop
	.word 0xe68fce80  ! 111: LDUBA_R	lduba	[%r31, %r0] 0x74, %r19
	.word 0xe4bfe000  ! 112: STDA_I	stda	%r18, [%r31 + 0x0000] %asi
	.word 0xe48fe000  ! 113: LDUBA_I	lduba	[%r31, + 0x0000] %asi, %r18
	.word 0xe487e000  ! 114: LDUWA_I	lduwa	[%r31, + 0x0000] %asi, %r18
	.word 0xee9f8e80  ! 115: LDDA_R	ldda	[%r30, %r0] 0x74, %r23
	mov	0x68, %r25
	.word 0x01000000  ! 117: NOP	nop
	.word 0xe6cfa000  ! 118: LDSBA_I	ldsba	[%r30, + 0x0000] %asi, %r19
	.word 0xecdf4e60  ! 119: LDXA_R	ldxa	[%r29, %r0] 0x73, %r22
	.word 0x87802025  ! 120: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0xe2a72000  ! 121: STWA_I	stwa	%r17, [%r28 + 0x0000] %asi
	.word 0x01000000  ! 122: NOP	nop
	.word 0x87802020  ! 123: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe2bee000  ! 124: STDA_I	stda	%r17, [%r27 + 0x0000] %asi
	.word 0xe6f544a0  ! 125: STXA_R	stxa	%r19, [%r21 + %r0] 0x25
	.word 0xe2a6e000  ! 126: STWA_I	stwa	%r17, [%r27 + 0x0000] %asi
	.word 0xe2b66000  ! 127: STHA_I	stha	%r17, [%r25 + 0x0000] %asi
	.word 0xee9fce80  ! 128: LDDA_R	ldda	[%r31, %r0] 0x74, %r23
	.word 0x87802074  ! 129: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0xeab4e000  ! 130: STHA_I	stha	%r21, [%r19 + 0x0000] %asi
	.word 0xe8bf8e60  ! 131: STDA_R	stda	%r20, [%r30 + %r0] 0x73
	.word 0xe8b70e40  ! 132: STHA_R	stha	%r20, [%r28 + %r0] 0x72
	.word 0xe8a42000  ! 133: STWA_I	stwa	%r20, [%r16 + 0x0000] %asi
	.word 0x8780204f  ! 134: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xe8cfa000  ! 135: LDSBA_I	ldsba	[%r30, + 0x0000] %asi, %r20
	.word 0xee9d44a0  ! 136: LDDA_R	ldda	[%r21, %r0] 0x25, %r23
	.word 0xe69e49e0  ! 137: LDDA_R	ldda	[%r25, %r0] 0x4f, %r19
	.word 0xe2dcc400  ! 138: LDXA_R	ldxa	[%r19, %r0] 0x20, %r17
	.word 0x01000000  ! 139: NOP	nop
	.word 0x01000000  ! 140: NOP	nop
	.word 0x8780204f  ! 141: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0x8780204f  ! 142: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xe48f2000  ! 143: LDUBA_I	lduba	[%r28, + 0x0000] %asi, %r18
	.word 0x01000000  ! 144: NOP	nop
	.word 0xe4d7e000  ! 145: LDSHA_I	ldsha	[%r31, + 0x0000] %asi, %r18
	.word 0xeac5c4a0  ! 146: LDSWA_R	ldswa	[%r23, %r0] 0x25, %r21
	.word 0xee944400  ! 147: LDUHA_R	lduha	[%r17, %r0] 0x20, %r23
	.word 0xeac4c400  ! 148: LDSWA_R	ldswa	[%r19, %r0] 0x20, %r21
	.word 0xe2a74e60  ! 149: STWA_R	stwa	%r17, [%r29 + %r0] 0x73
	.word 0xee876000  ! 150: LDUWA_I	lduwa	[%r29, + 0x0000] %asi, %r23
	.word 0xecae89e0  ! 151: STBA_R	stba	%r22, [%r26 + %r0] 0x4f
	.word 0xe68609e0  ! 152: LDUWA_R	lduwa	[%r24, %r0] 0x4f, %r19
	.word 0xea84c400  ! 153: LDUWA_R	lduwa	[%r19, %r0] 0x20, %r21
	.word 0x01000000  ! 154: NOP	nop
	.word 0xeeb609e0  ! 155: STHA_R	stha	%r23, [%r24 + %r0] 0x4f
	.word 0xea976000  ! 156: LDUHA_I	lduha	[%r29, + 0x0000] %asi, %r21
	.word 0x01000000  ! 157: NOP	nop
	.word 0xecde49e0  ! 158: LDXA_R	ldxa	[%r25, %r0] 0x4f, %r22
	.word 0xe48d84a0  ! 159: LDUBA_R	lduba	[%r22, %r0] 0x25, %r18
	.word 0x01000000  ! 160: NOP	nop
	.word 0xe4bc8400  ! 161: STDA_R	stda	%r18, [%r18 + %r0] 0x20
	.word 0xeadf6000  ! 162: LDXA_I	ldxa	[%r29, + 0x0000] %asi, %r21
	.word 0x87802020  ! 163: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe2a44400  ! 164: STWA_R	stwa	%r17, [%r17 + %r0] 0x20
	.word 0xe2bfe000  ! 165: STDA_I	stda	%r17, [%r31 + 0x0000] %asi
	.word 0xe2af2000  ! 166: STBA_I	stba	%r17, [%r28 + 0x0000] %asi
	.word 0x01000000  ! 167: NOP	nop
	.word 0xe0c689e0  ! 168: LDSWA_R	ldswa	[%r26, %r0] 0x4f, %r16
	.word 0x01000000  ! 169: NOP	nop
	.word 0xe2876000  ! 170: LDUWA_I	lduwa	[%r29, + 0x0000] %asi, %r17
	.word 0x01000000  ! 171: NOP	nop
	.word 0xeadf8e40  ! 172: LDXA_R	ldxa	[%r30, %r0] 0x72, %r21
	.word 0x87802020  ! 173: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe0b78e60  ! 174: STHA_R	stha	%r16, [%r30 + %r0] 0x73
	.word 0x87802020  ! 175: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xeaf42000  ! 176: STXA_I	stxa	%r21, [%r16 + 0x0000] %asi
	.word 0x01000000  ! 177: NOP	nop
	.word 0xec8e89e0  ! 178: LDUBA_R	lduba	[%r26, %r0] 0x4f, %r22
	.word 0xe0ac0400  ! 179: STBA_R	stba	%r16, [%r16 + %r0] 0x20
	.word 0xeea46000  ! 180: STWA_I	stwa	%r23, [%r17 + 0x0000] %asi
	.word 0xe6848400  ! 181: LDUWA_R	lduwa	[%r18, %r0] 0x20, %r19
	.word 0xeca40400  ! 182: STWA_R	stwa	%r22, [%r16 + %r0] 0x20
	.word 0x8780204f  ! 183: WRASI_I	wr	%r0, 0x004f, %asi
	mov	0x7c8, %r22
	.word 0xe6962000  ! 185: LDUHA_I	lduha	[%r24, + 0x0000] %asi, %r19
	.word 0xe4af8e80  ! 186: STBA_R	stba	%r18, [%r30 + %r0] 0x74
	.word 0xeabc4400  ! 187: STDA_R	stda	%r21, [%r17 + %r0] 0x20
	.word 0xe48e2000  ! 188: LDUBA_I	lduba	[%r24, + 0x0000] %asi, %r18
	.word 0xe4bee000  ! 189: STDA_I	stda	%r18, [%r27 + 0x0000] %asi
	.word 0xe8dc0400  ! 190: LDXA_R	ldxa	[%r16, %r0] 0x20, %r20
	.word 0xee8f0e40  ! 191: LDUBA_R	lduba	[%r28, %r0] 0x72, %r23
	.word 0x8780204f  ! 192: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xeec74e40  ! 193: LDSWA_R	ldswa	[%r29, %r0] 0x72, %r23
	.word 0xe4ce2000  ! 194: LDSBA_I	ldsba	[%r24, + 0x0000] %asi, %r18
	.word 0xeec7ce60  ! 195: LDSWA_R	ldswa	[%r31, %r0] 0x73, %r23
	.word 0xe29e6000  ! 196: LDDA_I	ldda	[%r25, + 0x0000] %asi, %r17
	.word 0xe2f6a000  ! 197: STXA_I	stxa	%r17, [%r26 + 0x0000] %asi
	.word 0xe2a6a000  ! 198: STWA_I	stwa	%r17, [%r26 + 0x0000] %asi
	.word 0x01000000  ! 199: NOP	nop
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_2:
	mov	0x58, %r25
	.word 0xe884e000  ! 2: LDUWA_I	lduwa	[%r19, + 0x0000] %asi, %r20
	.word 0x87802020  ! 3: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe887a000  ! 4: LDUWA_I	lduwa	[%r30, + 0x0000] %asi, %r20
	.word 0xe8bfa000  ! 5: STDA_I	stda	%r20, [%r30 + 0x0000] %asi
	.word 0xecaf8e60  ! 6: STBA_R	stba	%r22, [%r30 + %r0] 0x73
	.word 0xe4b72000  ! 7: STHA_I	stha	%r18, [%r28 + 0x0000] %asi
	.word 0xe4f72000  ! 8: STXA_I	stxa	%r18, [%r28 + 0x0000] %asi
	.word 0xe4bf6000  ! 9: STDA_I	stda	%r18, [%r29 + 0x0000] %asi
	mov	0x70, %r26
	.word 0x87802020  ! 11: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe4af2000  ! 12: STBA_I	stba	%r18, [%r28 + 0x0000] %asi
	.word 0xe4a7e000  ! 13: STWA_I	stwa	%r18, [%r31 + 0x0000] %asi
	.word 0x87802074  ! 14: WRASI_I	wr	%r0, 0x0074, %asi
	mov	0x3c0, %r22
	.word 0x87802074  ! 16: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0x01000000  ! 17: NOP	nop
	.word 0xe4ae09e0  ! 18: STBA_R	stba	%r18, [%r24 + %r0] 0x4f
	.word 0xe8bce000  ! 19: STDA_I	stda	%r20, [%r19 + 0x0000] %asi
	.word 0xe88c2000  ! 20: LDUBA_I	lduba	[%r16, + 0x0000] %asi, %r20
	.word 0x01000000  ! 21: NOP	nop
	.word 0x01000000  ! 22: NOP	nop
	.word 0xe8bc2000  ! 23: STDA_I	stda	%r20, [%r16 + 0x0000] %asi
	.word 0xe894e000  ! 24: LDUHA_I	lduha	[%r19, + 0x0000] %asi, %r20
	.word 0xe8bce000  ! 25: STDA_I	stda	%r20, [%r19 + 0x0000] %asi
	ta	T_CHANGE_HPRIV	! macro
	.word 0xeef609e0  ! 27: STXA_R	stxa	%r23, [%r24 + %r0] 0x4f
	.word 0xe4a504a0  ! 28: STWA_R	stwa	%r18, [%r20 + %r0] 0x25
	.word 0x87802072  ! 29: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0xe6874e60  ! 30: LDUWA_R	lduwa	[%r29, %r0] 0x73, %r19
	.word 0xeabcc400  ! 31: STDA_R	stda	%r21, [%r19 + %r0] 0x20
	.word 0xeecd04a0  ! 32: LDSBA_R	ldsba	[%r20, %r0] 0x25, %r23
	.word 0xe68c4400  ! 33: LDUBA_R	lduba	[%r17, %r0] 0x20, %r19
	.word 0xeef544a0  ! 34: STXA_R	stxa	%r23, [%r21 + %r0] 0x25
	.word 0x01000000  ! 35: NOP	nop
	.word 0x01000000  ! 36: NOP	nop
	.word 0xeedfce40  ! 37: LDXA_R	ldxa	[%r31, %r0] 0x72, %r23
	.word 0xe49f0e40  ! 38: LDDA_R	ldda	[%r28, %r0] 0x72, %r18
	.word 0xe4af4e40  ! 39: STBA_R	stba	%r18, [%r29 + %r0] 0x72
	.word 0xeef4a000  ! 40: STXA_I	stxa	%r23, [%r18 + 0x0000] %asi
	.word 0x01000000  ! 41: NOP	nop
	.word 0xeeb4a000  ! 42: STHA_I	stha	%r23, [%r18 + 0x0000] %asi
	.word 0xe6a7ce40  ! 43: STWA_R	stwa	%r19, [%r31 + %r0] 0x72
	.word 0x01000000  ! 44: NOP	nop
	.word 0x87802072  ! 45: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0xeca7ce60  ! 46: STWA_R	stwa	%r22, [%r31 + %r0] 0x73
	.word 0x87802020  ! 47: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0x87802020  ! 48: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0x87802020  ! 49: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe6cc2000  ! 50: LDSBA_I	ldsba	[%r16, + 0x0000] %asi, %r19
	.word 0xeab7ce60  ! 51: STHA_R	stha	%r21, [%r31 + %r0] 0x73
	.word 0xeedc6000  ! 52: LDXA_I	ldxa	[%r17, + 0x0000] %asi, %r23
	mov	0x7e0, %r21
	.word 0xeef46000  ! 54: STXA_I	stxa	%r23, [%r17 + 0x0000] %asi
	.word 0xeeace000  ! 55: STBA_I	stba	%r23, [%r19 + 0x0000] %asi
	.word 0xeef4e000  ! 56: STXA_I	stxa	%r23, [%r19 + 0x0000] %asi
	.word 0x01000000  ! 57: NOP	nop
	.word 0x01000000  ! 58: NOP	nop
	.word 0x01000000  ! 59: NOP	nop
	.word 0x01000000  ! 60: NOP	nop
	.word 0x87802020  ! 61: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xeea72000  ! 62: STWA_I	stwa	%r23, [%r28 + 0x0000] %asi
	.word 0xeef7e000  ! 63: STXA_I	stxa	%r23, [%r31 + 0x0000] %asi
	.word 0xeec7a000  ! 64: LDSWA_I	ldswa	[%r30, + 0x0000] %asi, %r23
	.word 0x01000000  ! 65: NOP	nop
	.word 0x87802025  ! 66: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0xe087ce80  ! 67: LDUWA_R	lduwa	[%r31, %r0] 0x74, %r16
	.word 0xe8a7ce80  ! 68: STWA_R	stwa	%r20, [%r31 + %r0] 0x74
	.word 0x01000000  ! 69: NOP	nop
	.word 0x8780204f  ! 70: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xe8b7a000  ! 71: STHA_I	stha	%r20, [%r30 + 0x0000] %asi
	mov	0x68, %r19
	.word 0xe4bc8400  ! 73: STDA_R	stda	%r18, [%r18 + %r0] 0x20
	.word 0xe8872000  ! 74: LDUWA_I	lduwa	[%r28, + 0x0000] %asi, %r20
	.word 0xeef70e80  ! 75: STXA_R	stxa	%r23, [%r28 + %r0] 0x74
	.word 0x01000000  ! 76: NOP	nop
	.word 0x87802074  ! 77: WRASI_I	wr	%r0, 0x0074, %asi
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x87802020  ! 79: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xeabe89e0  ! 80: STDA_R	stda	%r21, [%r26 + %r0] 0x4f
	.word 0xe2c76000  ! 81: LDSWA_I	ldswa	[%r29, + 0x0000] %asi, %r17
	.word 0xe2cfe000  ! 82: LDSBA_I	ldsba	[%r31, + 0x0000] %asi, %r17
	.word 0x01000000  ! 83: NOP	nop
	.word 0x87802020  ! 84: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe2f7a000  ! 85: STXA_I	stxa	%r17, [%r30 + 0x0000] %asi
	.word 0xeef70e60  ! 86: STXA_R	stxa	%r23, [%r28 + %r0] 0x73
	.word 0xea972000  ! 87: LDUHA_I	lduha	[%r28, + 0x0000] %asi, %r21
	.word 0xe0a6c9e0  ! 88: STWA_R	stwa	%r16, [%r27 + %r0] 0x4f
	.word 0xe8b7e000  ! 89: STHA_I	stha	%r20, [%r31 + 0x0000] %asi
	.word 0xec844400  ! 90: LDUWA_R	lduwa	[%r17, %r0] 0x20, %r22
	.word 0xe4f76000  ! 91: STXA_I	stxa	%r18, [%r29 + 0x0000] %asi
	.word 0xe0c70e40  ! 92: LDSWA_R	ldswa	[%r28, %r0] 0x72, %r16
	.word 0xee9f2000  ! 93: LDDA_I	ldda	[%r28, + 0x0000] %asi, %r23
	ta	T_CHANGE_PRIV	! macro
	.word 0xeec7a000  ! 95: LDSWA_I	ldswa	[%r30, + 0x0000] %asi, %r23
	.word 0x01000000  ! 96: NOP	nop
	.word 0xeeafe000  ! 97: STBA_I	stba	%r23, [%r31 + 0x0000] %asi
	.word 0xeebf6000  ! 98: STDA_I	stda	%r23, [%r29 + 0x0000] %asi
	.word 0xe4d6c9e0  ! 99: LDSHA_R	ldsha	[%r27, %r0] 0x4f, %r18
	.word 0xe0a72000  ! 100: STWA_I	stwa	%r16, [%r28 + 0x0000] %asi
	.word 0xe0bfe000  ! 101: STDA_I	stda	%r16, [%r31 + 0x0000] %asi
	.word 0xeecc0400  ! 102: LDSBA_R	ldsba	[%r16, %r0] 0x20, %r23
	.word 0xeeccc400  ! 103: LDSBA_R	ldsba	[%r19, %r0] 0x20, %r23
	.word 0xe6bf4e60  ! 104: STDA_R	stda	%r19, [%r29 + %r0] 0x73
	.word 0xe48f6000  ! 105: LDUBA_I	lduba	[%r29, + 0x0000] %asi, %r18
	.word 0xe4876000  ! 106: LDUWA_I	lduwa	[%r29, + 0x0000] %asi, %r18
	.word 0xee974e60  ! 107: LDUHA_R	lduha	[%r29, %r0] 0x73, %r23
	.word 0xe8dc8400  ! 108: LDXA_R	ldxa	[%r18, %r0] 0x20, %r20
	.word 0xe6af2000  ! 109: STBA_I	stba	%r19, [%r28 + 0x0000] %asi
	.word 0x01000000  ! 110: NOP	nop
	.word 0xee8f0e40  ! 111: LDUBA_R	lduba	[%r28, %r0] 0x72, %r23
	.word 0xe4bf2000  ! 112: STDA_I	stda	%r18, [%r28 + 0x0000] %asi
	.word 0xe48f2000  ! 113: LDUBA_I	lduba	[%r28, + 0x0000] %asi, %r18
	.word 0xe4876000  ! 114: LDUWA_I	lduwa	[%r29, + 0x0000] %asi, %r18
	.word 0xec9c8400  ! 115: LDDA_R	ldda	[%r18, %r0] 0x20, %r22
	mov	0x58, %r26
	.word 0x01000000  ! 117: NOP	nop
	.word 0xe6cfa000  ! 118: LDSBA_I	ldsba	[%r30, + 0x0000] %asi, %r19
	.word 0xe8dc0400  ! 119: LDXA_R	ldxa	[%r16, %r0] 0x20, %r20
	.word 0x87802020  ! 120: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe2a76000  ! 121: STWA_I	stwa	%r17, [%r29 + 0x0000] %asi
	.word 0x01000000  ! 122: NOP	nop
	.word 0x87802073  ! 123: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0xe2be2000  ! 124: STDA_I	stda	%r17, [%r24 + 0x0000] %asi
	.word 0xe0f40400  ! 125: STXA_R	stxa	%r16, [%r16 + %r0] 0x20
	.word 0xe2a6e000  ! 126: STWA_I	stwa	%r17, [%r27 + 0x0000] %asi
	.word 0xe2b6e000  ! 127: STHA_I	stha	%r17, [%r27 + 0x0000] %asi
	.word 0xe69f0e80  ! 128: LDDA_R	ldda	[%r28, %r0] 0x74, %r19
	.word 0x87802025  ! 129: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0xeab46000  ! 130: STHA_I	stha	%r21, [%r17 + 0x0000] %asi
	.word 0xeabfce60  ! 131: STDA_R	stda	%r21, [%r31 + %r0] 0x73
	.word 0xe4b78e80  ! 132: STHA_R	stha	%r18, [%r30 + %r0] 0x74
	.word 0xe8a42000  ! 133: STWA_I	stwa	%r20, [%r16 + 0x0000] %asi
	.word 0x87802020  ! 134: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe8cf2000  ! 135: LDSBA_I	ldsba	[%r28, + 0x0000] %asi, %r20
	.word 0xe69ec9e0  ! 136: LDDA_R	ldda	[%r27, %r0] 0x4f, %r19
	.word 0xe89d84a0  ! 137: LDDA_R	ldda	[%r22, %r0] 0x25, %r20
	.word 0xe0de49e0  ! 138: LDXA_R	ldxa	[%r25, %r0] 0x4f, %r16
	.word 0x01000000  ! 139: NOP	nop
	.word 0x01000000  ! 140: NOP	nop
	.word 0x87802072  ! 141: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0x87802073  ! 142: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0xe48f2000  ! 143: LDUBA_I	lduba	[%r28, + 0x0000] %asi, %r18
	.word 0x01000000  ! 144: NOP	nop
	.word 0xe4d7e000  ! 145: LDSHA_I	ldsha	[%r31, + 0x0000] %asi, %r18
	.word 0xecc70e80  ! 146: LDSWA_R	ldswa	[%r28, %r0] 0x74, %r22
	.word 0xe8978e80  ! 147: LDUHA_R	lduha	[%r30, %r0] 0x74, %r20
	.word 0xe0c544a0  ! 148: LDSWA_R	ldswa	[%r21, %r0] 0x25, %r16
	.word 0xeea6c9e0  ! 149: STWA_R	stwa	%r23, [%r27 + %r0] 0x4f
	.word 0xee87e000  ! 150: LDUWA_I	lduwa	[%r31, + 0x0000] %asi, %r23
	.word 0xeead44a0  ! 151: STBA_R	stba	%r23, [%r21 + %r0] 0x25
	.word 0xe2870e60  ! 152: LDUWA_R	lduwa	[%r28, %r0] 0x73, %r17
	.word 0xe2874e80  ! 153: LDUWA_R	lduwa	[%r29, %r0] 0x74, %r17
	.word 0x01000000  ! 154: NOP	nop
	.word 0xeab44400  ! 155: STHA_R	stha	%r21, [%r17 + %r0] 0x20
	.word 0xea976000  ! 156: LDUHA_I	lduha	[%r29, + 0x0000] %asi, %r21
	.word 0x01000000  ! 157: NOP	nop
	.word 0xe8dc4400  ! 158: LDXA_R	ldxa	[%r17, %r0] 0x20, %r20
	.word 0xe48e89e0  ! 159: LDUBA_R	lduba	[%r26, %r0] 0x4f, %r18
	.word 0x01000000  ! 160: NOP	nop
	.word 0xeabec9e0  ! 161: STDA_R	stda	%r21, [%r27 + %r0] 0x4f
	.word 0xeadfe000  ! 162: LDXA_I	ldxa	[%r31, + 0x0000] %asi, %r21
	.word 0x87802020  ! 163: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe6a4c400  ! 164: STWA_R	stwa	%r19, [%r19 + %r0] 0x20
	.word 0xe2bf6000  ! 165: STDA_I	stda	%r17, [%r29 + 0x0000] %asi
	.word 0xe2afa000  ! 166: STBA_I	stba	%r17, [%r30 + 0x0000] %asi
	.word 0x01000000  ! 167: NOP	nop
	.word 0xe0c689e0  ! 168: LDSWA_R	ldswa	[%r26, %r0] 0x4f, %r16
	.word 0x01000000  ! 169: NOP	nop
	.word 0xe2872000  ! 170: LDUWA_I	lduwa	[%r28, + 0x0000] %asi, %r17
	.word 0x01000000  ! 171: NOP	nop
	.word 0xecdfce80  ! 172: LDXA_R	ldxa	[%r31, %r0] 0x74, %r22
	.word 0x8780204f  ! 173: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xe0b584a0  ! 174: STHA_R	stha	%r16, [%r22 + %r0] 0x25
	.word 0x87802073  ! 175: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0xeaf4e000  ! 176: STXA_I	stxa	%r21, [%r19 + 0x0000] %asi
	.word 0x01000000  ! 177: NOP	nop
	.word 0xee8f4e80  ! 178: LDUBA_R	lduba	[%r29, %r0] 0x74, %r23
	.word 0xe4afce40  ! 179: STBA_R	stba	%r18, [%r31 + %r0] 0x72
	.word 0xeea46000  ! 180: STWA_I	stwa	%r23, [%r17 + 0x0000] %asi
	.word 0xe4878e80  ! 181: LDUWA_R	lduwa	[%r30, %r0] 0x74, %r18
	.word 0xeaa40400  ! 182: STWA_R	stwa	%r21, [%r16 + %r0] 0x20
	.word 0x87802072  ! 183: WRASI_I	wr	%r0, 0x0072, %asi
	mov	0x7e0, %r20
	.word 0xe6966000  ! 185: LDUHA_I	lduha	[%r25, + 0x0000] %asi, %r19
	.word 0xecaf8e60  ! 186: STBA_R	stba	%r22, [%r30 + %r0] 0x73
	.word 0xeabec9e0  ! 187: STDA_R	stda	%r21, [%r27 + %r0] 0x4f
	.word 0xe48e2000  ! 188: LDUBA_I	lduba	[%r24, + 0x0000] %asi, %r18
	.word 0xe4be6000  ! 189: STDA_I	stda	%r18, [%r25 + 0x0000] %asi
	.word 0xe2df4e60  ! 190: LDXA_R	ldxa	[%r29, %r0] 0x73, %r17
	.word 0xe48e49e0  ! 191: LDUBA_R	lduba	[%r25, %r0] 0x4f, %r18
	.word 0x8780204f  ! 192: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xe2c48400  ! 193: LDSWA_R	ldswa	[%r18, %r0] 0x20, %r17
	.word 0xe4ce2000  ! 194: LDSBA_I	ldsba	[%r24, + 0x0000] %asi, %r18
	.word 0xecc7ce40  ! 195: LDSWA_R	ldswa	[%r31, %r0] 0x72, %r22
	.word 0xe29ea000  ! 196: LDDA_I	ldda	[%r26, + 0x0000] %asi, %r17
	.word 0xe2f66000  ! 197: STXA_I	stxa	%r17, [%r25 + 0x0000] %asi
	.word 0xe2a66000  ! 198: STWA_I	stwa	%r17, [%r25 + 0x0000] %asi
	.word 0x01000000  ! 199: NOP	nop
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_1:
	mov	0x40, %r24
	.word 0xe884a000  ! 2: LDUWA_I	lduwa	[%r18, + 0x0000] %asi, %r20
	.word 0x87802020  ! 3: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe887e000  ! 4: LDUWA_I	lduwa	[%r31, + 0x0000] %asi, %r20
	.word 0xe8bf2000  ! 5: STDA_I	stda	%r20, [%r28 + 0x0000] %asi
	.word 0xecaf8e60  ! 6: STBA_R	stba	%r22, [%r30 + %r0] 0x73
	.word 0xe4b7a000  ! 7: STHA_I	stha	%r18, [%r30 + 0x0000] %asi
	.word 0xe4f7a000  ! 8: STXA_I	stxa	%r18, [%r30 + 0x0000] %asi
	.word 0xe4bfa000  ! 9: STDA_I	stda	%r18, [%r30 + 0x0000] %asi
	mov	0x78, %r24
	.word 0x87802072  ! 11: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0xe4af2000  ! 12: STBA_I	stba	%r18, [%r28 + 0x0000] %asi
	.word 0xe4a7e000  ! 13: STWA_I	stwa	%r18, [%r31 + 0x0000] %asi
	.word 0x87802020  ! 14: WRASI_I	wr	%r0, 0x0020, %asi
	mov	0x3e8, %r22
	.word 0x87802074  ! 16: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0x01000000  ! 17: NOP	nop
	.word 0xe4acc400  ! 18: STBA_R	stba	%r18, [%r19 + %r0] 0x20
	.word 0xe8bc6000  ! 19: STDA_I	stda	%r20, [%r17 + 0x0000] %asi
	.word 0xe88ca000  ! 20: LDUBA_I	lduba	[%r18, + 0x0000] %asi, %r20
	.word 0x01000000  ! 21: NOP	nop
	.word 0x01000000  ! 22: NOP	nop
	.word 0xe8bc2000  ! 23: STDA_I	stda	%r20, [%r16 + 0x0000] %asi
	.word 0xe894a000  ! 24: LDUHA_I	lduha	[%r18, + 0x0000] %asi, %r20
	.word 0xe8bc2000  ! 25: STDA_I	stda	%r20, [%r16 + 0x0000] %asi
	ta	T_CHANGE_HPRIV	! macro
	.word 0xeaf609e0  ! 27: STXA_R	stxa	%r21, [%r24 + %r0] 0x4f
	.word 0xe0a7ce60  ! 28: STWA_R	stwa	%r16, [%r31 + %r0] 0x73
	.word 0x87802020  ! 29: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe4848400  ! 30: LDUWA_R	lduwa	[%r18, %r0] 0x20, %r18
	.word 0xeebcc400  ! 31: STDA_R	stda	%r23, [%r19 + %r0] 0x20
	.word 0xe8cfce80  ! 32: LDSBA_R	ldsba	[%r31, %r0] 0x74, %r20
	.word 0xe88c8400  ! 33: LDUBA_R	lduba	[%r18, %r0] 0x20, %r20
	.word 0xe8f7ce60  ! 34: STXA_R	stxa	%r20, [%r31 + %r0] 0x73
	.word 0x01000000  ! 35: NOP	nop
	.word 0x01000000  ! 36: NOP	nop
	.word 0xeedc8400  ! 37: LDXA_R	ldxa	[%r18, %r0] 0x20, %r23
	.word 0xee9d44a0  ! 38: LDDA_R	ldda	[%r21, %r0] 0x25, %r23
	.word 0xe2af4e40  ! 39: STBA_R	stba	%r17, [%r29 + %r0] 0x72
	.word 0xeef46000  ! 40: STXA_I	stxa	%r23, [%r17 + 0x0000] %asi
	.word 0x01000000  ! 41: NOP	nop
	.word 0xeeb4e000  ! 42: STHA_I	stha	%r23, [%r19 + 0x0000] %asi
	.word 0xeea78e60  ! 43: STWA_R	stwa	%r23, [%r30 + %r0] 0x73
	.word 0x01000000  ! 44: NOP	nop
	.word 0x87802073  ! 45: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0xeca7ce60  ! 46: STWA_R	stwa	%r22, [%r31 + %r0] 0x73
	.word 0x87802025  ! 47: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0x87802020  ! 48: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0x8780204f  ! 49: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xe6cc6000  ! 50: LDSBA_I	ldsba	[%r17, + 0x0000] %asi, %r19
	.word 0xe0b5c4a0  ! 51: STHA_R	stha	%r16, [%r23 + %r0] 0x25
	.word 0xeedca000  ! 52: LDXA_I	ldxa	[%r18, + 0x0000] %asi, %r23
	mov	0x3d0, %r23
	.word 0xeef4e000  ! 54: STXA_I	stxa	%r23, [%r19 + 0x0000] %asi
	.word 0xeeac2000  ! 55: STBA_I	stba	%r23, [%r16 + 0x0000] %asi
	.word 0xeef4a000  ! 56: STXA_I	stxa	%r23, [%r18 + 0x0000] %asi
	.word 0x01000000  ! 57: NOP	nop
	.word 0x01000000  ! 58: NOP	nop
	.word 0x01000000  ! 59: NOP	nop
	.word 0x01000000  ! 60: NOP	nop
	.word 0x87802020  ! 61: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xeea72000  ! 62: STWA_I	stwa	%r23, [%r28 + 0x0000] %asi
	.word 0xeef7e000  ! 63: STXA_I	stxa	%r23, [%r31 + 0x0000] %asi
	.word 0xeec7e000  ! 64: LDSWA_I	ldswa	[%r31, + 0x0000] %asi, %r23
	.word 0x01000000  ! 65: NOP	nop
	.word 0x87802073  ! 66: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0xe4874e40  ! 67: LDUWA_R	lduwa	[%r29, %r0] 0x72, %r18
	.word 0xe0a48400  ! 68: STWA_R	stwa	%r16, [%r18 + %r0] 0x20
	.word 0x01000000  ! 69: NOP	nop
	.word 0x8780204f  ! 70: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xe8b76000  ! 71: STHA_I	stha	%r20, [%r29 + 0x0000] %asi
	mov	0x8, %r17
	.word 0xeebfce60  ! 73: STDA_R	stda	%r23, [%r31 + %r0] 0x73
	.word 0xe887a000  ! 74: LDUWA_I	lduwa	[%r30, + 0x0000] %asi, %r20
	.word 0xe2f544a0  ! 75: STXA_R	stxa	%r17, [%r21 + %r0] 0x25
	.word 0x01000000  ! 76: NOP	nop
	.word 0x87802072  ! 77: WRASI_I	wr	%r0, 0x0072, %asi
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x87802020  ! 79: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xeebd04a0  ! 80: STDA_R	stda	%r23, [%r20 + %r0] 0x25
	.word 0xe2c7e000  ! 81: LDSWA_I	ldswa	[%r31, + 0x0000] %asi, %r17
	.word 0xe2cf6000  ! 82: LDSBA_I	ldsba	[%r29, + 0x0000] %asi, %r17
	.word 0x01000000  ! 83: NOP	nop
	.word 0x87802025  ! 84: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0xe2f76000  ! 85: STXA_I	stxa	%r17, [%r29 + 0x0000] %asi
	.word 0xe4f7ce60  ! 86: STXA_R	stxa	%r18, [%r31 + %r0] 0x73
	.word 0xea97a000  ! 87: LDUHA_I	lduha	[%r30, + 0x0000] %asi, %r21
	.word 0xe2a74e60  ! 88: STWA_R	stwa	%r17, [%r29 + %r0] 0x73
	.word 0xe8b76000  ! 89: STHA_I	stha	%r20, [%r29 + 0x0000] %asi
	.word 0xea8609e0  ! 90: LDUWA_R	lduwa	[%r24, %r0] 0x4f, %r21
	.word 0xe4f7e000  ! 91: STXA_I	stxa	%r18, [%r31 + 0x0000] %asi
	.word 0xe8c48400  ! 92: LDSWA_R	ldswa	[%r18, %r0] 0x20, %r20
	.word 0xee9fe000  ! 93: LDDA_I	ldda	[%r31, + 0x0000] %asi, %r23
	ta	T_CHANGE_PRIV	! macro
	.word 0xeec76000  ! 95: LDSWA_I	ldswa	[%r29, + 0x0000] %asi, %r23
	.word 0x01000000  ! 96: NOP	nop
	.word 0xeeafe000  ! 97: STBA_I	stba	%r23, [%r31 + 0x0000] %asi
	.word 0xeebfa000  ! 98: STDA_I	stda	%r23, [%r30 + 0x0000] %asi
	.word 0xe4d78e40  ! 99: LDSHA_R	ldsha	[%r30, %r0] 0x72, %r18
	.word 0xe0a72000  ! 100: STWA_I	stwa	%r16, [%r28 + 0x0000] %asi
	.word 0xe0bf6000  ! 101: STDA_I	stda	%r16, [%r29 + 0x0000] %asi
	.word 0xe4cd04a0  ! 102: LDSBA_R	ldsba	[%r20, %r0] 0x25, %r18
	.word 0xe4cd04a0  ! 103: LDSBA_R	ldsba	[%r20, %r0] 0x25, %r18
	.word 0xecbcc400  ! 104: STDA_R	stda	%r22, [%r19 + %r0] 0x20
	.word 0xe48f2000  ! 105: LDUBA_I	lduba	[%r28, + 0x0000] %asi, %r18
	.word 0xe4876000  ! 106: LDUWA_I	lduwa	[%r29, + 0x0000] %asi, %r18
	.word 0xe8978e40  ! 107: LDUHA_R	lduha	[%r30, %r0] 0x72, %r20
	.word 0xecdc8400  ! 108: LDXA_R	ldxa	[%r18, %r0] 0x20, %r22
	.word 0xe6afe000  ! 109: STBA_I	stba	%r19, [%r31 + 0x0000] %asi
	.word 0x01000000  ! 110: NOP	nop
	.word 0xe88d44a0  ! 111: LDUBA_R	lduba	[%r21, %r0] 0x25, %r20
	.word 0xe4bfe000  ! 112: STDA_I	stda	%r18, [%r31 + 0x0000] %asi
	.word 0xe48fa000  ! 113: LDUBA_I	lduba	[%r30, + 0x0000] %asi, %r18
	.word 0xe487e000  ! 114: LDUWA_I	lduwa	[%r31, + 0x0000] %asi, %r18
	.word 0xea9ec9e0  ! 115: LDDA_R	ldda	[%r27, %r0] 0x4f, %r21
	mov	0x50, %r25
	.word 0x01000000  ! 117: NOP	nop
	.word 0xe6cfe000  ! 118: LDSBA_I	ldsba	[%r31, + 0x0000] %asi, %r19
	.word 0xe4dc4400  ! 119: LDXA_R	ldxa	[%r17, %r0] 0x20, %r18
	.word 0x87802020  ! 120: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe2a7e000  ! 121: STWA_I	stwa	%r17, [%r31 + 0x0000] %asi
	.word 0x01000000  ! 122: NOP	nop
	.word 0x87802072  ! 123: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0xe2be6000  ! 124: STDA_I	stda	%r17, [%r25 + 0x0000] %asi
	.word 0xe2f584a0  ! 125: STXA_R	stxa	%r17, [%r22 + %r0] 0x25
	.word 0xe2a6e000  ! 126: STWA_I	stwa	%r17, [%r27 + 0x0000] %asi
	.word 0xe2b66000  ! 127: STHA_I	stha	%r17, [%r25 + 0x0000] %asi
	.word 0xe29f4e40  ! 128: LDDA_R	ldda	[%r29, %r0] 0x72, %r17
	.word 0x8780204f  ! 129: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xeab4a000  ! 130: STHA_I	stha	%r21, [%r18 + 0x0000] %asi
	.word 0xe8bf0e60  ! 131: STDA_R	stda	%r20, [%r28 + %r0] 0x73
	.word 0xecb544a0  ! 132: STHA_R	stha	%r22, [%r21 + %r0] 0x25
	.word 0xe8a4a000  ! 133: STWA_I	stwa	%r20, [%r18 + 0x0000] %asi
	.word 0x87802025  ! 134: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0xe8cf6000  ! 135: LDSBA_I	ldsba	[%r29, + 0x0000] %asi, %r20
	.word 0xe69dc4a0  ! 136: LDDA_R	ldda	[%r23, %r0] 0x25, %r19
	.word 0xe69e89e0  ! 137: LDDA_R	ldda	[%r26, %r0] 0x4f, %r19
	.word 0xe8de09e0  ! 138: LDXA_R	ldxa	[%r24, %r0] 0x4f, %r20
	.word 0x01000000  ! 139: NOP	nop
	.word 0x01000000  ! 140: NOP	nop
	.word 0x8780204f  ! 141: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0x87802074  ! 142: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0xe48f6000  ! 143: LDUBA_I	lduba	[%r29, + 0x0000] %asi, %r18
	.word 0x01000000  ! 144: NOP	nop
	.word 0xe4d72000  ! 145: LDSHA_I	ldsha	[%r28, + 0x0000] %asi, %r18
	.word 0xecc5c4a0  ! 146: LDSWA_R	ldswa	[%r23, %r0] 0x25, %r22
	.word 0xe89584a0  ! 147: LDUHA_R	lduha	[%r22, %r0] 0x25, %r20
	.word 0xeec70e60  ! 148: LDSWA_R	ldswa	[%r28, %r0] 0x73, %r23
	.word 0xe8a70e40  ! 149: STWA_R	stwa	%r20, [%r28 + %r0] 0x72
	.word 0xee872000  ! 150: LDUWA_I	lduwa	[%r28, + 0x0000] %asi, %r23
	.word 0xe2af0e60  ! 151: STBA_R	stba	%r17, [%r28 + %r0] 0x73
	.word 0xe0840400  ! 152: LDUWA_R	lduwa	[%r16, %r0] 0x20, %r16
	.word 0xea8544a0  ! 153: LDUWA_R	lduwa	[%r21, %r0] 0x25, %r21
	.word 0x01000000  ! 154: NOP	nop
	.word 0xeeb74e80  ! 155: STHA_R	stha	%r23, [%r29 + %r0] 0x74
	.word 0xea976000  ! 156: LDUHA_I	lduha	[%r29, + 0x0000] %asi, %r21
	.word 0x01000000  ! 157: NOP	nop
	.word 0xe0dc4400  ! 158: LDXA_R	ldxa	[%r17, %r0] 0x20, %r16
	.word 0xe08f8e60  ! 159: LDUBA_R	lduba	[%r30, %r0] 0x73, %r16
	.word 0x01000000  ! 160: NOP	nop
	.word 0xecbe09e0  ! 161: STDA_R	stda	%r22, [%r24 + %r0] 0x4f
	.word 0xeadfa000  ! 162: LDXA_I	ldxa	[%r30, + 0x0000] %asi, %r21
	.word 0x87802020  ! 163: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xeca7ce40  ! 164: STWA_R	stwa	%r22, [%r31 + %r0] 0x72
	.word 0xe2bf6000  ! 165: STDA_I	stda	%r17, [%r29 + 0x0000] %asi
	.word 0xe2afa000  ! 166: STBA_I	stba	%r17, [%r30 + 0x0000] %asi
	.word 0x01000000  ! 167: NOP	nop
	.word 0xeac609e0  ! 168: LDSWA_R	ldswa	[%r24, %r0] 0x4f, %r21
	.word 0x01000000  ! 169: NOP	nop
	.word 0xe287a000  ! 170: LDUWA_I	lduwa	[%r30, + 0x0000] %asi, %r17
	.word 0x01000000  ! 171: NOP	nop
	.word 0xe2dfce40  ! 172: LDXA_R	ldxa	[%r31, %r0] 0x72, %r17
	.word 0x87802072  ! 173: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0xeab544a0  ! 174: STHA_R	stha	%r21, [%r21 + %r0] 0x25
	.word 0x87802025  ! 175: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0xeaf4a000  ! 176: STXA_I	stxa	%r21, [%r18 + 0x0000] %asi
	.word 0x01000000  ! 177: NOP	nop
	.word 0xe48e09e0  ! 178: LDUBA_R	lduba	[%r24, %r0] 0x4f, %r18
	.word 0xecadc4a0  ! 179: STBA_R	stba	%r22, [%r23 + %r0] 0x25
	.word 0xeea42000  ! 180: STWA_I	stwa	%r23, [%r16 + 0x0000] %asi
	.word 0xe487ce40  ! 181: LDUWA_R	lduwa	[%r31, %r0] 0x72, %r18
	.word 0xe8a70e60  ! 182: STWA_R	stwa	%r20, [%r28 + %r0] 0x73
	.word 0x87802020  ! 183: WRASI_I	wr	%r0, 0x0020, %asi
	mov	0x3c8, %r23
	.word 0xe696a000  ! 185: LDUHA_I	lduha	[%r26, + 0x0000] %asi, %r19
	.word 0xe8ae89e0  ! 186: STBA_R	stba	%r20, [%r26 + %r0] 0x4f
	.word 0xe4bc8400  ! 187: STDA_R	stda	%r18, [%r18 + %r0] 0x20
	.word 0xe48e6000  ! 188: LDUBA_I	lduba	[%r25, + 0x0000] %asi, %r18
	.word 0xe4be6000  ! 189: STDA_I	stda	%r18, [%r25 + 0x0000] %asi
	.word 0xecdcc400  ! 190: LDXA_R	ldxa	[%r19, %r0] 0x20, %r22
	.word 0xe28c8400  ! 191: LDUBA_R	lduba	[%r18, %r0] 0x20, %r17
	.word 0x87802074  ! 192: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0xe2c584a0  ! 193: LDSWA_R	ldswa	[%r22, %r0] 0x25, %r17
	.word 0xe4cee000  ! 194: LDSBA_I	ldsba	[%r27, + 0x0000] %asi, %r18
	.word 0xe2c7ce80  ! 195: LDSWA_R	ldswa	[%r31, %r0] 0x74, %r17
	.word 0xe29ee000  ! 196: LDDA_I	ldda	[%r27, + 0x0000] %asi, %r17
	.word 0xe2f62000  ! 197: STXA_I	stxa	%r17, [%r24 + 0x0000] %asi
	.word 0xe2a6a000  ! 198: STWA_I	stwa	%r17, [%r26 + 0x0000] %asi
	.word 0x01000000  ! 199: NOP	nop

join_lbl_0_0:
!		$EV trig_pc_d(1,expr(@VA(.RED_EXT_SEC.HRedmode_Reset_Handler) + 4, 16, 16)) -> intp(1, 1, 1)
!		$EV trig_pc_d(1,expr(@VA(.RED_EXT_SEC.HRedmode_Reset_Handler) + 8, 16, 16)) -> intp(2, 1, 1)
!		$EV trig_pc_d(1,expr(@VA(.RED_EXT_SEC.HRedmode_Reset_Handler) + 12, 16, 16)) -> intp(3, 1, 1)
	.data
data_start:

	.xword	0x1d3a6bec7405a3ea
	.xword	0xcd7356e6fcc255c3
	.xword	0x302ddc0f072f4988
	.xword	0x192d5e24b95d4a5a
	.xword	0x53d6583ed54bbcfc
	.xword	0xcefa269d4450a6d8
	.xword	0x6f650d0040db9aa7
	.xword	0x7df1e92284ff816f
	.xword	0x3cf79b17f960df2f
	.xword	0xbb398f916bddaa0b
	.xword	0x0f57fad8a797dbdc
	.xword	0x70f14ca6611ae0a2
	.xword	0x8973e14526345fbc
	.xword	0x5580709d36a4d110
	.xword	0xefa7beb6400ede1a
	.xword	0xb10894dc06bea0c0



.text
	ta	T_GOOD_TRAP

.data
	.xword 0x1234567887654321

#if 0
!!# /* File:	tlu_sus_res_21.j
!!#  * Description:
!!#  * This temple is targets the suspend_resume coverage object, by interseting
!!#  * idle, HW , and resume interrupt events in between the asi access,
!!#  * actually thread0 behaves as main thread controlling idle/resume of other (1...3)
!!#  * threads
!!#  */
!!# 
!!# template main ();
!!# 
!!# 
!!# %%section c_declarations
!!# 
!!#   typedef enum {IDLE_INTR = 0, HW_INTR, RESUME_INTR} intr_type;
!!#   int i, j;
!!#   int idle_cnt = 0;
!!#   int hwintr_cnt = 0;
!!#   int resume_cnt = 0;
!!#   int intr_tid = 1;
!!#   intr_type intr_ev = IDLE_INTR;
!!# 
!!#   my_imm_asi_to_rvar (int line, int rv_ro, field_type_t fld, void *data);
!!# 
!!# %%section init
!!# 
!!#   static int asi_rvar_array[6] = {Rv_20, Rv_25, Rv_4f, Rv_72_73_74, Rv_72_73_74, Rv_72_73_74};
!!# 
!!#   IJ_bind_thread_group(th_M, 0x01);
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
!!#   if (intr_ev != IDLE_INTR) {
!!#     IJ_printf (th_M, "resume_%d:\n", resume_cnt);
!!#     IJ_printf (th_M, "\tnop\n", resume_cnt);
!!#     IJ_printf (th_M, "\tnop\n", resume_cnt);
!!#     IJ_printf (th_M, "\tnop\n", resume_cnt);
!!#     IJ_printf (th_M, "\tnop\n", resume_cnt);
!!#     IJ_printf (th_M, "!$EV trig_pc_d(0,expr(@VA(.MAIN.resume_%d), 16, 16)) -> intp(%d, 3, %d)\n", resume_cnt, intr_tid, Rv_intr_vect);
!!#     resume_cnt++;
!!#     intr_ev = IDLE_INTR;
!!#     //intr_tid = (intr_tid == 3) ? 0: intr_tid++;
!!#     if (intr_tid < 3) intr_tid++; else intr_tid = 1;
!!#   }
!!# 
!!#   IJ_printf (th_all, "\t.data\ndata_start:\n\n");
!!#   for (i = 0; i < 16; i++) {
!!# 		IJ_printf  (th_all,"\t.xword\t0x%016llrx\n", Rv_rand64);
!!#   }
!!# 
!!#   
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
!!# #include "my_trap_handlers.s"
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
!!# 	| idle_resume
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
!!# idle_resume: tNOP
!!# 	{
!!# 	  if (intr_ev == IDLE_INTR) {
!!#             IJ_printf (th_M, "idle_%d:\n", idle_cnt);
!!# 	    IJ_printf (th_M, "!$EV trig_pc_d(0,expr(@VA(.MAIN.idle_%d), 16, 16)) -> intp(%d, 2, %d)\n", idle_cnt, intr_tid, Rv_intr_vect);
!!#             idle_cnt++;
!!# 	    intr_ev = HW_INTR;
!!#           } else if (intr_ev == HW_INTR) {
!!#             IJ_printf (th_M, "hwintr_%d:\n", resume_cnt);
!!# 	    IJ_printf (th_M, "!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_%d), 16, 16)) -> intp(%d, 0, %d)\n", hwintr_cnt, intr_tid, Rv_intr_vect);
!!#             hwintr_cnt++;
!!# 	    intr_ev = RESUME_INTR;
!!#           } else {
!!#             IJ_printf (th_M, "resume_%d:\n", resume_cnt);
!!# 	    IJ_printf (th_M, "!$EV trig_pc_d(0,expr(@VA(.MAIN.resume_%d), 16, 16)) -> intp(%d, 3, %d)\n", resume_cnt, intr_tid, Rv_intr_vect);
!!#             resume_cnt++;
!!# 	    intr_ev = IDLE_INTR;
!!#             if (intr_tid < 3) intr_tid++; else intr_tid = 1;
!!#           }
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
