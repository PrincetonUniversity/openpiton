// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: sus_res_20.s
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
   random seed:	620788574
   Jal tlu_sus_res_2.j:	
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

	setx 0x27bbf80cbbcde366, %g1, %g0
	setx 0x29ace8457ec8bb85, %g1, %g1
	setx 0xe12d0407f2af21b3, %g1, %g2
	setx 0x92af8e299487b884, %g1, %g3
	setx 0xd506ea2ce2e8c0f8, %g1, %g4
	setx 0x0ff389d44185e9f6, %g1, %g5
	setx 0x380553c0cd8ade68, %g1, %g6
	setx 0x78c6c665540fe3d6, %g1, %g7
	setx 0x5fb10fb3e57c7f09, %g1, %r16
	setx 0xb93be2ef0f5b4c05, %g1, %r17
	setx 0x373bb5b7f7aa50d0, %g1, %r18
	setx 0x471258983e364d00, %g1, %r19
	setx 0x69ae6e053b86fe15, %g1, %r20
	setx 0x4db576dd5f732464, %g1, %r21
	setx 0xb4600c6c522f4fcd, %g1, %r22
	setx 0x54388d01c318d70f, %g1, %r23
	setx 0x1532357ec5b22fe8, %g1, %r24
	setx 0x98f9be859439dd75, %g1, %r25
	setx 0x61b047bbc40b9c6b, %g1, %r26
	setx 0x21e72e9251ec29b1, %g1, %r27
	setx 0xd1476e637ab76f9c, %g1, %r28
	setx 0xc8abf4ae09c56710, %g1, %r29
	setx 0xa842d7d2a41d6663, %g1, %r30
	setx 0x3f48f8ddd2166abe, %g1, %r31
	save
	setx 0xef0cf6df107f499f, %g1, %r16
	setx 0x4578aab3d1da7ef0, %g1, %r17
	setx 0x094b99c11b9348a6, %g1, %r18
	setx 0x4823d67186ed91cc, %g1, %r19
	setx 0x80c60eb76cb01afa, %g1, %r20
	setx 0x764178d64ebeb815, %g1, %r21
	setx 0xf24b4d64b3840e76, %g1, %r22
	setx 0x8df37c981354428d, %g1, %r23
	setx 0x5f5ff3459298edf0, %g1, %r24
	setx 0xc229dbdfe3d2e160, %g1, %r25
	setx 0xdd146a1fc72c1c2e, %g1, %r26
	setx 0x1e4244c9d379e86e, %g1, %r27
	setx 0x4a86a4c9c3a9c830, %g1, %r28
	setx 0x2e0a6cdc4a63c047, %g1, %r29
	setx 0xa089da3d192686df, %g1, %r30
	setx 0xa5f903b6e873eb2f, %g1, %r31
	save
	setx 0xc68f4629b3720c23, %g1, %r16
	setx 0xa4f6252f0923d82d, %g1, %r17
	setx 0xc0b42edb9f671171, %g1, %r18
	setx 0x6c27484ac576319c, %g1, %r19
	setx 0x39181916bebc0807, %g1, %r20
	setx 0x72673f4d3abe9675, %g1, %r21
	setx 0x81c0bf65cac0ba24, %g1, %r22
	setx 0x6530d066f0d36ed5, %g1, %r23
	setx 0xa400eef6d6acf577, %g1, %r24
	setx 0x8d22b314cabbc0c9, %g1, %r25
	setx 0x25ebd42eeb049674, %g1, %r26
	setx 0x39d380eb08530ac7, %g1, %r27
	setx 0xb33642a66c75daf3, %g1, %r28
	setx 0x0b81459a39a615a9, %g1, %r29
	setx 0x9841a12fb15582b5, %g1, %r30
	setx 0xae262363ccb6bce0, %g1, %r31
	restore
	setx	data_start, %r1, %r25
	mov	0x70, %r16
	mov	0x78, %r17
	mov	0x58, %r18
	mov	0x30, %r19
	mov	0x3c8, %r20
	mov	0x7f0, %r21
	mov	0x3e8, %r22
	mov	0x3e0, %r23
	mov	0x0, %r24
	mov	0x10, %r25
	mov	0x50, %r26
	mov	0x18, %r27
	mov	0, %r28
	mov	0, %r29
	mov	0, %r30
	mov	0, %r31
	ta	%icc, T_CHANGE_HPRIV
	wr	%g0, 0x73, %asi
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
	.word 0xe6ccc400  ! 2: LDSBA_R	ldsba	[%r19, %r0] 0x20, %r19
	.word 0xe2af0e60  ! 3: STBA_R	stba	%r17, [%r28 + %r0] 0x73
	.word 0xe28fe000  ! 4: LDUBA_I	lduba	[%r31, + 0x0000] %asi, %r17
	.word 0xe2c76000  ! 5: LDSWA_I	ldswa	[%r29, + 0x0000] %asi, %r17
	.word 0xe2a72000  ! 6: STWA_I	stwa	%r17, [%r28 + 0x0000] %asi
	.word 0xe69e49e0  ! 7: LDDA_R	ldda	[%r25, %r0] 0x4f, %r19
	.word 0xe6872000  ! 8: LDUWA_I	lduwa	[%r28, + 0x0000] %asi, %r19
	.word 0xe697e000  ! 9: LDUHA_I	lduha	[%r31, + 0x0000] %asi, %r19
	.word 0xe697a000  ! 10: LDUHA_I	lduha	[%r30, + 0x0000] %asi, %r19
idle_0:
!$EV trig_pc_d(0,expr(@VA(.MAIN.idle_0), 16, 16)) -> intp(1, 2, 4)
	.word 0x01000000  ! 11: NOP	nop
	mov	0x10, %r25
	.word 0xe6cfa000  ! 13: LDSBA_I	ldsba	[%r30, + 0x0000] %asi, %r19
resume_0:
!$EV trig_pc_d(0,expr(@VA(.MAIN.resume_0), 16, 16)) -> intp(1, 3, 4)
	.word 0x01000000  ! 14: NOP	nop
	.word 0xecdc0400  ! 15: LDXA_R	ldxa	[%r16, %r0] 0x20, %r22
	.word 0xecb7a000  ! 16: STHA_I	stha	%r22, [%r30 + 0x0000] %asi
	.word 0x87802025  ! 17: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0xeccd2000  ! 18: LDSBA_I	ldsba	[%r20, + 0x0000] %asi, %r22
	.word 0xecad2000  ! 19: STBA_I	stba	%r22, [%r20 + 0x0000] %asi
	.word 0xe8874e60  ! 20: LDUWA_R	lduwa	[%r29, %r0] 0x73, %r20
	.word 0xe2f70e40  ! 21: STXA_R	stxa	%r17, [%r28 + %r0] 0x72
	.word 0x87802020  ! 22: WRASI_I	wr	%r0, 0x0020, %asi
idle_1:
!$EV trig_pc_d(0,expr(@VA(.MAIN.idle_1), 16, 16)) -> intp(2, 2, 4)
	.word 0x01000000  ! 23: NOP	nop
	.word 0xe4d40400  ! 24: LDSHA_R	ldsha	[%r16, %r0] 0x20, %r18
	.word 0x87802073  ! 25: WRASI_I	wr	%r0, 0x0073, %asi
resume_1:
!$EV trig_pc_d(0,expr(@VA(.MAIN.resume_1), 16, 16)) -> intp(2, 3, 4)
	.word 0x01000000  ! 26: NOP	nop
	.word 0xe48fa000  ! 27: LDUBA_I	lduba	[%r30, + 0x0000] %asi, %r18
	.word 0xe4af0e80  ! 28: STBA_R	stba	%r18, [%r28 + %r0] 0x74
	.word 0xeacf4e80  ! 29: LDSBA_R	ldsba	[%r29, %r0] 0x74, %r21
	.word 0x8780204f  ! 30: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xe6dfce60  ! 31: LDXA_R	ldxa	[%r31, %r0] 0x73, %r19
	.word 0xe6b62000  ! 32: STHA_I	stha	%r19, [%r24 + 0x0000] %asi
idle_2:
!$EV trig_pc_d(0,expr(@VA(.MAIN.idle_2), 16, 16)) -> intp(3, 2, 4)
	.word 0x01000000  ! 33: NOP	nop
	.word 0xe6ce6000  ! 34: LDSBA_I	ldsba	[%r25, + 0x0000] %asi, %r19
	.word 0xe0ccc400  ! 35: LDSBA_R	ldsba	[%r19, %r0] 0x20, %r16
	.word 0xe0b6e000  ! 36: STHA_I	stha	%r16, [%r27 + 0x0000] %asi
	.word 0xe0b6a000  ! 37: STHA_I	stha	%r16, [%r26 + 0x0000] %asi
	.word 0xec9504a0  ! 38: LDUHA_R	lduha	[%r20, %r0] 0x25, %r22
	.word 0xe2c7ce60  ! 39: LDSWA_R	ldswa	[%r31, %r0] 0x73, %r17
	.word 0xe296a000  ! 40: LDUHA_I	lduha	[%r26, + 0x0000] %asi, %r17
	.word 0x87802072  ! 41: WRASI_I	wr	%r0, 0x0072, %asi
resume_2:
!$EV trig_pc_d(0,expr(@VA(.MAIN.resume_2), 16, 16)) -> intp(3, 3, 4)
	.word 0x01000000  ! 42: NOP	nop
	.word 0xe49e89e0  ! 43: LDDA_R	ldda	[%r26, %r0] 0x4f, %r18
	.word 0xe6d7ce40  ! 44: LDSHA_R	ldsha	[%r31, %r0] 0x72, %r19
	.word 0xecacc400  ! 45: STBA_R	stba	%r22, [%r19 + %r0] 0x20
	.word 0xe6d70e60  ! 46: LDSHA_R	ldsha	[%r28, %r0] 0x73, %r19
	.word 0xe6d7a000  ! 47: LDSHA_I	ldsha	[%r30, + 0x0000] %asi, %r19
	.word 0xe6872000  ! 48: LDUWA_I	lduwa	[%r28, + 0x0000] %asi, %r19
	.word 0xeacd84a0  ! 49: LDSBA_R	ldsba	[%r22, %r0] 0x25, %r21
	.word 0xead72000  ! 50: LDSHA_I	ldsha	[%r28, + 0x0000] %asi, %r21
idle_3:
!$EV trig_pc_d(0,expr(@VA(.MAIN.idle_3), 16, 16)) -> intp(1, 2, 4)
	.word 0x01000000  ! 51: NOP	nop
	.word 0x87802074  ! 52: WRASI_I	wr	%r0, 0x0074, %asi
resume_3:
!$EV trig_pc_d(0,expr(@VA(.MAIN.resume_3), 16, 16)) -> intp(1, 3, 4)
	.word 0x01000000  ! 53: NOP	nop
	.word 0x87802073  ! 54: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0xeeaf4e80  ! 55: STBA_R	stba	%r23, [%r29 + %r0] 0x74
	.word 0xee9f6000  ! 56: LDDA_I	ldda	[%r29, + 0x0000] %asi, %r23
	.word 0xe2b74e60  ! 57: STHA_R	stha	%r17, [%r29 + %r0] 0x73
	.word 0xe2c76000  ! 58: LDSWA_I	ldswa	[%r29, + 0x0000] %asi, %r17
idle_4:
!$EV trig_pc_d(0,expr(@VA(.MAIN.idle_4), 16, 16)) -> intp(2, 2, 4)
	.word 0x01000000  ! 59: NOP	nop
	.word 0xe2cfa000  ! 60: LDSBA_I	ldsba	[%r30, + 0x0000] %asi, %r17
	.word 0x87802025  ! 61: WRASI_I	wr	%r0, 0x0025, %asi
resume_4:
!$EV trig_pc_d(0,expr(@VA(.MAIN.resume_4), 16, 16)) -> intp(2, 3, 4)
	.word 0x01000000  ! 62: NOP	nop
	.word 0xe2ad6000  ! 63: STBA_I	stba	%r17, [%r21 + 0x0000] %asi
	.word 0xe2bda000  ! 64: STDA_I	stda	%r17, [%r22 + 0x0000] %asi
	.word 0xe2c56000  ! 65: LDSWA_I	ldswa	[%r21, + 0x0000] %asi, %r17
	.word 0xeaac0400  ! 66: STBA_R	stba	%r21, [%r16 + %r0] 0x20
	.word 0xeaa5a000  ! 67: STWA_I	stwa	%r21, [%r22 + 0x0000] %asi
	.word 0xea8d6000  ! 68: LDUBA_I	lduba	[%r21, + 0x0000] %asi, %r21
	.word 0xe6b504a0  ! 69: STHA_R	stha	%r19, [%r20 + %r0] 0x25
	.word 0xecbc8400  ! 70: STDA_R	stda	%r22, [%r18 + %r0] 0x20
	.word 0xeadc0400  ! 71: LDXA_R	ldxa	[%r16, %r0] 0x20, %r21
	.word 0x87802074  ! 72: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0x87802020  ! 73: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe48f0e60  ! 74: LDUBA_R	lduba	[%r28, %r0] 0x73, %r18
	.word 0xecf44400  ! 75: STXA_R	stxa	%r22, [%r17 + %r0] 0x20
	.word 0xe6b609e0  ! 76: STHA_R	stha	%r19, [%r24 + %r0] 0x4f
idle_5:
!$EV trig_pc_d(0,expr(@VA(.MAIN.idle_5), 16, 16)) -> intp(3, 2, 4)
	.word 0x01000000  ! 77: NOP	nop
	.word 0x87802074  ! 78: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0x87802020  ! 79: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xea8fce80  ! 80: LDUBA_R	lduba	[%r31, %r0] 0x74, %r21
	.word 0xe48f4e40  ! 81: LDUBA_R	lduba	[%r29, %r0] 0x72, %r18
	.word 0xe4f42000  ! 82: STXA_I	stxa	%r18, [%r16 + 0x0000] %asi
	.word 0xe2f78e40  ! 83: STXA_R	stxa	%r17, [%r30 + %r0] 0x72
	.word 0xe0bd84a0  ! 84: STDA_R	stda	%r16, [%r22 + %r0] 0x25
	.word 0xe0a4e000  ! 85: STWA_I	stwa	%r16, [%r19 + 0x0000] %asi
	.word 0xe0cc2000  ! 86: LDSBA_I	ldsba	[%r16, + 0x0000] %asi, %r16
	.word 0xeadcc400  ! 87: LDXA_R	ldxa	[%r19, %r0] 0x20, %r21
	.word 0xeaa42000  ! 88: STWA_I	stwa	%r21, [%r16 + 0x0000] %asi
	.word 0xeaa4a000  ! 89: STWA_I	stwa	%r21, [%r18 + 0x0000] %asi
	.word 0xeaf42000  ! 90: STXA_I	stxa	%r21, [%r16 + 0x0000] %asi
resume_5:
!$EV trig_pc_d(0,expr(@VA(.MAIN.resume_5), 16, 16)) -> intp(3, 3, 4)
	.word 0x01000000  ! 91: NOP	nop
	.word 0xead4a000  ! 92: LDSHA_I	ldsha	[%r18, + 0x0000] %asi, %r21
	.word 0xea9ce000  ! 93: LDDA_I	ldda	[%r19, + 0x0000] %asi, %r21
	.word 0x87802020  ! 94: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe4970e80  ! 95: LDUHA_R	lduha	[%r28, %r0] 0x74, %r18
	.word 0xe4842000  ! 96: LDUWA_I	lduwa	[%r16, + 0x0000] %asi, %r18
	.word 0xe2d584a0  ! 97: LDSHA_R	ldsha	[%r22, %r0] 0x25, %r17
	.word 0xe28c6000  ! 98: LDUBA_I	lduba	[%r17, + 0x0000] %asi, %r17
	.word 0xeebe49e0  ! 99: STDA_R	stda	%r23, [%r25 + %r0] 0x4f
	.word 0xeed4e000  ! 100: LDSHA_I	ldsha	[%r19, + 0x0000] %asi, %r23
	.word 0x87802073  ! 101: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0xeeb76000  ! 102: STHA_I	stha	%r23, [%r29 + 0x0000] %asi
	.word 0x87802020  ! 103: WRASI_I	wr	%r0, 0x0020, %asi
idle_6:
!$EV trig_pc_d(0,expr(@VA(.MAIN.idle_6), 16, 16)) -> intp(1, 2, 4)
	.word 0x01000000  ! 104: NOP	nop
	.word 0x8780204f  ! 105: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0x87802074  ! 106: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0xee872000  ! 107: LDUWA_I	lduwa	[%r28, + 0x0000] %asi, %r23
	.word 0xee9fe000  ! 108: LDDA_I	ldda	[%r31, + 0x0000] %asi, %r23
	.word 0x87802073  ! 109: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0x87802025  ! 110: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0xeccf4e80  ! 111: LDSBA_R	ldsba	[%r29, %r0] 0x74, %r22
	.word 0x8780204f  ! 112: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0x87802072  ! 113: WRASI_I	wr	%r0, 0x0072, %asi
resume_6:
!$EV trig_pc_d(0,expr(@VA(.MAIN.resume_6), 16, 16)) -> intp(1, 3, 4)
	.word 0x01000000  ! 114: NOP	nop
	mov	0x18, %r18
	.word 0xecb7a000  ! 116: STHA_I	stha	%r22, [%r30 + 0x0000] %asi
idle_7:
!$EV trig_pc_d(0,expr(@VA(.MAIN.idle_7), 16, 16)) -> intp(2, 2, 4)
	.word 0x01000000  ! 117: NOP	nop
	.word 0xecb72000  ! 118: STHA_I	stha	%r22, [%r28 + 0x0000] %asi
	.word 0xe8be49e0  ! 119: STDA_R	stda	%r20, [%r25 + %r0] 0x4f
	.word 0xe8f76000  ! 120: STXA_I	stxa	%r20, [%r29 + 0x0000] %asi
	.word 0x87802074  ! 121: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0x87802073  ! 122: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0xeed74e40  ! 123: LDSHA_R	ldsha	[%r29, %r0] 0x72, %r23
resume_7:
!$EV trig_pc_d(0,expr(@VA(.MAIN.resume_7), 16, 16)) -> intp(2, 3, 4)
	.word 0x01000000  ! 124: NOP	nop
	.word 0xea8f8e60  ! 125: LDUBA_R	lduba	[%r30, %r0] 0x73, %r21
	.word 0xe0afce60  ! 126: STBA_R	stba	%r16, [%r31 + %r0] 0x73
	.word 0xe0af8e80  ! 127: STBA_R	stba	%r16, [%r30 + %r0] 0x74
	.word 0xe097e000  ! 128: LDUHA_I	lduha	[%r31, + 0x0000] %asi, %r16
	.word 0xe0b72000  ! 129: STHA_I	stha	%r16, [%r28 + 0x0000] %asi
	.word 0xe08f2000  ! 130: LDUBA_I	lduba	[%r28, + 0x0000] %asi, %r16
	.word 0xe0f7a000  ! 131: STXA_I	stxa	%r16, [%r30 + 0x0000] %asi
	.word 0xe0b72000  ! 132: STHA_I	stha	%r16, [%r28 + 0x0000] %asi
	.word 0x87802073  ! 133: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0xe09f2000  ! 134: LDDA_I	ldda	[%r28, + 0x0000] %asi, %r16
	.word 0xe0af6000  ! 135: STBA_I	stba	%r16, [%r29 + 0x0000] %asi
	.word 0xe0d72000  ! 136: LDSHA_I	ldsha	[%r28, + 0x0000] %asi, %r16
	.word 0xe097a000  ! 137: LDUHA_I	lduha	[%r30, + 0x0000] %asi, %r16
	.word 0xe0a7e000  ! 138: STWA_I	stwa	%r16, [%r31 + 0x0000] %asi
	.word 0xe0c76000  ! 139: LDSWA_I	ldswa	[%r29, + 0x0000] %asi, %r16
	.word 0x87802020  ! 140: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe2df0e80  ! 141: LDXA_R	ldxa	[%r28, %r0] 0x74, %r17
	.word 0xe2a46000  ! 142: STWA_I	stwa	%r17, [%r17 + 0x0000] %asi
	.word 0x87802072  ! 143: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0x87802025  ! 144: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0xe2bda000  ! 145: STDA_I	stda	%r17, [%r22 + 0x0000] %asi
	mov	0x7f8, %r23
idle_8:
!$EV trig_pc_d(0,expr(@VA(.MAIN.idle_8), 16, 16)) -> intp(3, 2, 4)
	.word 0x01000000  ! 147: NOP	nop
resume_8:
!$EV trig_pc_d(0,expr(@VA(.MAIN.resume_8), 16, 16)) -> intp(3, 3, 4)
	.word 0x01000000  ! 148: NOP	nop
idle_9:
!$EV trig_pc_d(0,expr(@VA(.MAIN.idle_9), 16, 16)) -> intp(1, 2, 4)
	.word 0x01000000  ! 149: NOP	nop
	.word 0x87802025  ! 150: WRASI_I	wr	%r0, 0x0025, %asi
resume_9:
!$EV trig_pc_d(0,expr(@VA(.MAIN.resume_9), 16, 16)) -> intp(1, 3, 4)
	.word 0x01000000  ! 151: NOP	nop
	.word 0xe6f78e80  ! 152: STXA_R	stxa	%r19, [%r30 + %r0] 0x74
	.word 0xe69d2000  ! 153: LDDA_I	ldda	[%r20, + 0x0000] %asi, %r19
	.word 0xe4cf4e60  ! 154: LDSBA_R	ldsba	[%r29, %r0] 0x73, %r18
idle_10:
!$EV trig_pc_d(0,expr(@VA(.MAIN.idle_10), 16, 16)) -> intp(2, 2, 4)
	.word 0x01000000  ! 155: NOP	nop
	.word 0xe49da000  ! 156: LDDA_I	ldda	[%r22, + 0x0000] %asi, %r18
	.word 0xe2ce49e0  ! 157: LDSBA_R	ldsba	[%r25, %r0] 0x4f, %r17
	mov	0x40, %r27
	.word 0xe295a000  ! 159: LDUHA_I	lduha	[%r22, + 0x0000] %asi, %r17
	.word 0xe4cd84a0  ! 160: LDSBA_R	ldsba	[%r22, %r0] 0x25, %r18
	.word 0xe4d52000  ! 161: LDSHA_I	ldsha	[%r20, + 0x0000] %asi, %r18
	.word 0xe6b70e40  ! 162: STHA_R	stha	%r19, [%r28 + %r0] 0x72
	.word 0xe68d6000  ! 163: LDUBA_I	lduba	[%r21, + 0x0000] %asi, %r19
	.word 0xe6bd6000  ! 164: STDA_I	stda	%r19, [%r21 + 0x0000] %asi
	.word 0xe8af0e40  ! 165: STBA_R	stba	%r20, [%r28 + %r0] 0x72
	.word 0xe8ad2000  ! 166: STBA_I	stba	%r20, [%r20 + 0x0000] %asi
	mov	0x8, %r27
resume_10:
!$EV trig_pc_d(0,expr(@VA(.MAIN.resume_10), 16, 16)) -> intp(2, 3, 4)
	.word 0x01000000  ! 168: NOP	nop
	.word 0xe8bd6000  ! 169: STDA_I	stda	%r20, [%r21 + 0x0000] %asi
	.word 0x87802073  ! 170: WRASI_I	wr	%r0, 0x0073, %asi
idle_11:
!$EV trig_pc_d(0,expr(@VA(.MAIN.idle_11), 16, 16)) -> intp(3, 2, 4)
	.word 0x01000000  ! 171: NOP	nop
	.word 0xe2af0e40  ! 172: STBA_R	stba	%r17, [%r28 + %r0] 0x72
	.word 0xe48f8e60  ! 173: LDUBA_R	lduba	[%r30, %r0] 0x73, %r18
	.word 0x87802073  ! 174: WRASI_I	wr	%r0, 0x0073, %asi
resume_11:
!$EV trig_pc_d(0,expr(@VA(.MAIN.resume_11), 16, 16)) -> intp(3, 3, 4)
	.word 0x01000000  ! 175: NOP	nop
	.word 0xe4f7a000  ! 176: STXA_I	stxa	%r18, [%r30 + 0x0000] %asi
	.word 0xe4bf6000  ! 177: STDA_I	stda	%r18, [%r29 + 0x0000] %asi
	.word 0xe4f48400  ! 178: STXA_R	stxa	%r18, [%r18 + %r0] 0x20
	.word 0xe48fa000  ! 179: LDUBA_I	lduba	[%r30, + 0x0000] %asi, %r18
	.word 0xe8ae49e0  ! 180: STBA_R	stba	%r20, [%r25 + %r0] 0x4f
	.word 0xeac689e0  ! 181: LDSWA_R	ldswa	[%r26, %r0] 0x4f, %r21
idle_12:
!$EV trig_pc_d(0,expr(@VA(.MAIN.idle_12), 16, 16)) -> intp(1, 2, 4)
	.word 0x01000000  ! 182: NOP	nop
	.word 0xea9d44a0  ! 183: LDDA_R	ldda	[%r21, %r0] 0x25, %r21
	.word 0x87802020  ! 184: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe6a609e0  ! 185: STWA_R	stwa	%r19, [%r24 + %r0] 0x4f
	.word 0xe6b4e000  ! 186: STHA_I	stha	%r19, [%r19 + 0x0000] %asi
	.word 0xe6b4a000  ! 187: STHA_I	stha	%r19, [%r18 + 0x0000] %asi
	.word 0xe68f4e40  ! 188: LDUBA_R	lduba	[%r29, %r0] 0x72, %r19
	.word 0xe6c4e000  ! 189: LDSWA_I	ldswa	[%r19, + 0x0000] %asi, %r19
	.word 0x87802073  ! 190: WRASI_I	wr	%r0, 0x0073, %asi
resume_12:
!$EV trig_pc_d(0,expr(@VA(.MAIN.resume_12), 16, 16)) -> intp(1, 3, 4)
	.word 0x01000000  ! 191: NOP	nop
	.word 0xe6cfa000  ! 192: LDSBA_I	ldsba	[%r30, + 0x0000] %asi, %r19
	.word 0xe4a6c9e0  ! 193: STWA_R	stwa	%r18, [%r27 + %r0] 0x4f
	.word 0xe4d7a000  ! 194: LDSHA_I	ldsha	[%r30, + 0x0000] %asi, %r18
	.word 0xe4bfa000  ! 195: STDA_I	stda	%r18, [%r30 + 0x0000] %asi
	.word 0xe48f6000  ! 196: LDUBA_I	lduba	[%r29, + 0x0000] %asi, %r18
	.word 0xe2b70e80  ! 197: STHA_R	stha	%r17, [%r28 + %r0] 0x74
	.word 0x87802072  ! 198: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0xee9c4400  ! 199: LDDA_R	ldda	[%r17, %r0] 0x20, %r23
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_3:
	.word 0xe6cfce40  ! 2: LDSBA_R	ldsba	[%r31, %r0] 0x72, %r19
	.word 0xecadc4a0  ! 3: STBA_R	stba	%r22, [%r23 + %r0] 0x25
	.word 0xe28f6000  ! 4: LDUBA_I	lduba	[%r29, + 0x0000] %asi, %r17
	.word 0xe2c72000  ! 5: LDSWA_I	ldswa	[%r28, + 0x0000] %asi, %r17
	.word 0xe2a76000  ! 6: STWA_I	stwa	%r17, [%r29 + 0x0000] %asi
	.word 0xe69f8e40  ! 7: LDDA_R	ldda	[%r30, %r0] 0x72, %r19
	.word 0xe6876000  ! 8: LDUWA_I	lduwa	[%r29, + 0x0000] %asi, %r19
	.word 0xe6976000  ! 9: LDUHA_I	lduha	[%r29, + 0x0000] %asi, %r19
	.word 0xe697a000  ! 10: LDUHA_I	lduha	[%r30, + 0x0000] %asi, %r19
	.word 0x01000000  ! 11: NOP	nop
	mov	0x20, %r27
	.word 0xe6cf6000  ! 13: LDSBA_I	ldsba	[%r29, + 0x0000] %asi, %r19
	.word 0x01000000  ! 14: NOP	nop
	.word 0xecde89e0  ! 15: LDXA_R	ldxa	[%r26, %r0] 0x4f, %r22
	.word 0xecb76000  ! 16: STHA_I	stha	%r22, [%r29 + 0x0000] %asi
	.word 0x87802020  ! 17: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xeccde000  ! 18: LDSBA_I	ldsba	[%r23, + 0x0000] %asi, %r22
	.word 0xecad6000  ! 19: STBA_I	stba	%r22, [%r21 + 0x0000] %asi
	.word 0xe6848400  ! 20: LDUWA_R	lduwa	[%r18, %r0] 0x20, %r19
	.word 0xe6f40400  ! 21: STXA_R	stxa	%r19, [%r16 + %r0] 0x20
	.word 0x87802072  ! 22: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0x01000000  ! 23: NOP	nop
	.word 0xe4d44400  ! 24: LDSHA_R	ldsha	[%r17, %r0] 0x20, %r18
	.word 0x87802073  ! 25: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0x01000000  ! 26: NOP	nop
	.word 0xe48fa000  ! 27: LDUBA_I	lduba	[%r30, + 0x0000] %asi, %r18
	.word 0xe4adc4a0  ! 28: STBA_R	stba	%r18, [%r23 + %r0] 0x25
	.word 0xe2cf8e80  ! 29: LDSBA_R	ldsba	[%r30, %r0] 0x74, %r17
	.word 0x8780204f  ! 30: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xe2df0e40  ! 31: LDXA_R	ldxa	[%r28, %r0] 0x72, %r17
	.word 0xe6b62000  ! 32: STHA_I	stha	%r19, [%r24 + 0x0000] %asi
	.word 0x01000000  ! 33: NOP	nop
	.word 0xe6ce2000  ! 34: LDSBA_I	ldsba	[%r24, + 0x0000] %asi, %r19
	.word 0xe0cc8400  ! 35: LDSBA_R	ldsba	[%r18, %r0] 0x20, %r16
	.word 0xe0b6e000  ! 36: STHA_I	stha	%r16, [%r27 + 0x0000] %asi
	.word 0xe0b62000  ! 37: STHA_I	stha	%r16, [%r24 + 0x0000] %asi
	.word 0xe0948400  ! 38: LDUHA_R	lduha	[%r18, %r0] 0x20, %r16
	.word 0xe6c4c400  ! 39: LDSWA_R	ldswa	[%r19, %r0] 0x20, %r19
	.word 0xe2962000  ! 40: LDUHA_I	lduha	[%r24, + 0x0000] %asi, %r17
	.word 0x87802020  ! 41: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0x01000000  ! 42: NOP	nop
	.word 0xe29e09e0  ! 43: LDDA_R	ldda	[%r24, %r0] 0x4f, %r17
	.word 0xe2d78e40  ! 44: LDSHA_R	ldsha	[%r30, %r0] 0x72, %r17
	.word 0xecac4400  ! 45: STBA_R	stba	%r22, [%r17 + %r0] 0x20
	.word 0xe6d504a0  ! 46: LDSHA_R	ldsha	[%r20, %r0] 0x25, %r19
	.word 0xe6d7a000  ! 47: LDSHA_I	ldsha	[%r30, + 0x0000] %asi, %r19
	.word 0xe687a000  ! 48: LDUWA_I	lduwa	[%r30, + 0x0000] %asi, %r19
	.word 0xeacd84a0  ! 49: LDSBA_R	ldsba	[%r22, %r0] 0x25, %r21
	.word 0xead72000  ! 50: LDSHA_I	ldsha	[%r28, + 0x0000] %asi, %r21
	.word 0x01000000  ! 51: NOP	nop
	.word 0x87802072  ! 52: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0x01000000  ! 53: NOP	nop
	.word 0x87802020  ! 54: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xeaaf4e80  ! 55: STBA_R	stba	%r21, [%r29 + %r0] 0x74
	.word 0xee9f2000  ! 56: LDDA_I	ldda	[%r28, + 0x0000] %asi, %r23
	.word 0xe2b40400  ! 57: STHA_R	stha	%r17, [%r16 + %r0] 0x20
	.word 0xe2c72000  ! 58: LDSWA_I	ldswa	[%r28, + 0x0000] %asi, %r17
	.word 0x01000000  ! 59: NOP	nop
	.word 0xe2cf2000  ! 60: LDSBA_I	ldsba	[%r28, + 0x0000] %asi, %r17
	.word 0x8780204f  ! 61: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0x01000000  ! 62: NOP	nop
	.word 0xe2ade000  ! 63: STBA_I	stba	%r17, [%r23 + 0x0000] %asi
	.word 0xe2bd6000  ! 64: STDA_I	stda	%r17, [%r21 + 0x0000] %asi
	.word 0xe2c5a000  ! 65: LDSWA_I	ldswa	[%r22, + 0x0000] %asi, %r17
	.word 0xe6afce40  ! 66: STBA_R	stba	%r19, [%r31 + %r0] 0x72
	.word 0xeaa5a000  ! 67: STWA_I	stwa	%r21, [%r22 + 0x0000] %asi
	.word 0xea8d6000  ! 68: LDUBA_I	lduba	[%r21, + 0x0000] %asi, %r21
	.word 0xe8b544a0  ! 69: STHA_R	stha	%r20, [%r21 + %r0] 0x25
	.word 0xeabf4e80  ! 70: STDA_R	stda	%r21, [%r29 + %r0] 0x74
	.word 0xe6dcc400  ! 71: LDXA_R	ldxa	[%r19, %r0] 0x20, %r19
	.word 0x87802020  ! 72: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0x87802020  ! 73: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xee8c8400  ! 74: LDUBA_R	lduba	[%r18, %r0] 0x20, %r23
	.word 0xeef44400  ! 75: STXA_R	stxa	%r23, [%r17 + %r0] 0x20
	.word 0xe8b40400  ! 76: STHA_R	stha	%r20, [%r16 + %r0] 0x20
	.word 0x01000000  ! 77: NOP	nop
	.word 0x87802025  ! 78: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0x87802020  ! 79: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xea8dc4a0  ! 80: LDUBA_R	lduba	[%r23, %r0] 0x25, %r21
	.word 0xe68d44a0  ! 81: LDUBA_R	lduba	[%r21, %r0] 0x25, %r19
	.word 0xe4f4e000  ! 82: STXA_I	stxa	%r18, [%r19 + 0x0000] %asi
	.word 0xecf70e80  ! 83: STXA_R	stxa	%r22, [%r28 + %r0] 0x74
	.word 0xe0bf0e40  ! 84: STDA_R	stda	%r16, [%r28 + %r0] 0x72
	.word 0xe0a46000  ! 85: STWA_I	stwa	%r16, [%r17 + 0x0000] %asi
	.word 0xe0cca000  ! 86: LDSBA_I	ldsba	[%r18, + 0x0000] %asi, %r16
	.word 0xe8dc8400  ! 87: LDXA_R	ldxa	[%r18, %r0] 0x20, %r20
	.word 0xeaa42000  ! 88: STWA_I	stwa	%r21, [%r16 + 0x0000] %asi
	.word 0xeaa46000  ! 89: STWA_I	stwa	%r21, [%r17 + 0x0000] %asi
	.word 0xeaf4e000  ! 90: STXA_I	stxa	%r21, [%r19 + 0x0000] %asi
	.word 0x01000000  ! 91: NOP	nop
	.word 0xead42000  ! 92: LDSHA_I	ldsha	[%r16, + 0x0000] %asi, %r21
	.word 0xea9c2000  ! 93: LDDA_I	ldda	[%r16, + 0x0000] %asi, %r21
	.word 0x8780204f  ! 94: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xe097ce80  ! 95: LDUHA_R	lduha	[%r31, %r0] 0x74, %r16
	.word 0xe484e000  ! 96: LDUWA_I	lduwa	[%r19, + 0x0000] %asi, %r18
	.word 0xe2d40400  ! 97: LDSHA_R	ldsha	[%r16, %r0] 0x20, %r17
	.word 0xe28c6000  ! 98: LDUBA_I	lduba	[%r17, + 0x0000] %asi, %r17
	.word 0xe2bf4e40  ! 99: STDA_R	stda	%r17, [%r29 + %r0] 0x72
	.word 0xeed46000  ! 100: LDSHA_I	ldsha	[%r17, + 0x0000] %asi, %r23
	.word 0x87802025  ! 101: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0xeeb7a000  ! 102: STHA_I	stha	%r23, [%r30 + 0x0000] %asi
	.word 0x8780204f  ! 103: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0x01000000  ! 104: NOP	nop
	.word 0x87802020  ! 105: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0x8780204f  ! 106: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xee87a000  ! 107: LDUWA_I	lduwa	[%r30, + 0x0000] %asi, %r23
	.word 0xee9f6000  ! 108: LDDA_I	ldda	[%r29, + 0x0000] %asi, %r23
	.word 0x87802073  ! 109: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0x87802020  ! 110: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe8cf8e80  ! 111: LDSBA_R	ldsba	[%r30, %r0] 0x74, %r20
	.word 0x87802020  ! 112: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0x87802020  ! 113: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0x01000000  ! 114: NOP	nop
	mov	0x28, %r17
	.word 0xecb76000  ! 116: STHA_I	stha	%r22, [%r29 + 0x0000] %asi
	.word 0x01000000  ! 117: NOP	nop
	.word 0xecb7a000  ! 118: STHA_I	stha	%r22, [%r30 + 0x0000] %asi
	.word 0xe2bc8400  ! 119: STDA_R	stda	%r17, [%r18 + %r0] 0x20
	.word 0xe8f7a000  ! 120: STXA_I	stxa	%r20, [%r30 + 0x0000] %asi
	.word 0x87802020  ! 121: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0x87802073  ! 122: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0xe0d74e60  ! 123: LDSHA_R	ldsha	[%r29, %r0] 0x73, %r16
	.word 0x01000000  ! 124: NOP	nop
	.word 0xec8fce60  ! 125: LDUBA_R	lduba	[%r31, %r0] 0x73, %r22
	.word 0xe2ac4400  ! 126: STBA_R	stba	%r17, [%r17 + %r0] 0x20
	.word 0xe8af4e80  ! 127: STBA_R	stba	%r20, [%r29 + %r0] 0x74
	.word 0xe0976000  ! 128: LDUHA_I	lduha	[%r29, + 0x0000] %asi, %r16
	.word 0xe0b72000  ! 129: STHA_I	stha	%r16, [%r28 + 0x0000] %asi
	.word 0xe08f6000  ! 130: LDUBA_I	lduba	[%r29, + 0x0000] %asi, %r16
	.word 0xe0f76000  ! 131: STXA_I	stxa	%r16, [%r29 + 0x0000] %asi
	.word 0xe0b72000  ! 132: STHA_I	stha	%r16, [%r28 + 0x0000] %asi
	.word 0x87802020  ! 133: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe09f6000  ! 134: LDDA_I	ldda	[%r29, + 0x0000] %asi, %r16
	.word 0xe0af2000  ! 135: STBA_I	stba	%r16, [%r28 + 0x0000] %asi
	.word 0xe0d72000  ! 136: LDSHA_I	ldsha	[%r28, + 0x0000] %asi, %r16
	.word 0xe097e000  ! 137: LDUHA_I	lduha	[%r31, + 0x0000] %asi, %r16
	.word 0xe0a72000  ! 138: STWA_I	stwa	%r16, [%r28 + 0x0000] %asi
	.word 0xe0c7a000  ! 139: LDSWA_I	ldswa	[%r30, + 0x0000] %asi, %r16
	.word 0x87802020  ! 140: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe6df4e60  ! 141: LDXA_R	ldxa	[%r29, %r0] 0x73, %r19
	.word 0xe2a4e000  ! 142: STWA_I	stwa	%r17, [%r19 + 0x0000] %asi
	.word 0x87802025  ! 143: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0x87802020  ! 144: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe2bd2000  ! 145: STDA_I	stda	%r17, [%r20 + 0x0000] %asi
	mov	0x7c8, %r21
	.word 0x01000000  ! 147: NOP	nop
	.word 0x01000000  ! 148: NOP	nop
	.word 0x01000000  ! 149: NOP	nop
	.word 0x8780204f  ! 150: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0x01000000  ! 151: NOP	nop
	.word 0xeef70e80  ! 152: STXA_R	stxa	%r23, [%r28 + %r0] 0x74
	.word 0xe69d2000  ! 153: LDDA_I	ldda	[%r20, + 0x0000] %asi, %r19
	.word 0xeacf4e60  ! 154: LDSBA_R	ldsba	[%r29, %r0] 0x73, %r21
	.word 0x01000000  ! 155: NOP	nop
	.word 0xe49de000  ! 156: LDDA_I	ldda	[%r23, + 0x0000] %asi, %r18
	.word 0xe8cc4400  ! 157: LDSBA_R	ldsba	[%r17, %r0] 0x20, %r20
	mov	0x48, %r25
	.word 0xe2952000  ! 159: LDUHA_I	lduha	[%r20, + 0x0000] %asi, %r17
	.word 0xe8cc4400  ! 160: LDSBA_R	ldsba	[%r17, %r0] 0x20, %r20
	.word 0xe4d5e000  ! 161: LDSHA_I	ldsha	[%r23, + 0x0000] %asi, %r18
	.word 0xe2b74e60  ! 162: STHA_R	stha	%r17, [%r29 + %r0] 0x73
	.word 0xe68d6000  ! 163: LDUBA_I	lduba	[%r21, + 0x0000] %asi, %r19
	.word 0xe6bd6000  ! 164: STDA_I	stda	%r19, [%r21 + 0x0000] %asi
	.word 0xe4acc400  ! 165: STBA_R	stba	%r18, [%r19 + %r0] 0x20
	.word 0xe8ada000  ! 166: STBA_I	stba	%r20, [%r22 + 0x0000] %asi
	mov	0x0, %r26
	.word 0x01000000  ! 168: NOP	nop
	.word 0xe8bd2000  ! 169: STDA_I	stda	%r20, [%r20 + 0x0000] %asi
	.word 0x87802020  ! 170: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0x01000000  ! 171: NOP	nop
	.word 0xe2af4e60  ! 172: STBA_R	stba	%r17, [%r29 + %r0] 0x73
	.word 0xec8fce60  ! 173: LDUBA_R	lduba	[%r31, %r0] 0x73, %r22
	.word 0x87802025  ! 174: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0x01000000  ! 175: NOP	nop
	.word 0xe4f72000  ! 176: STXA_I	stxa	%r18, [%r28 + 0x0000] %asi
	.word 0xe4bf2000  ! 177: STDA_I	stda	%r18, [%r28 + 0x0000] %asi
	.word 0xe6f544a0  ! 178: STXA_R	stxa	%r19, [%r21 + %r0] 0x25
	.word 0xe48f2000  ! 179: LDUBA_I	lduba	[%r28, + 0x0000] %asi, %r18
	.word 0xeeac8400  ! 180: STBA_R	stba	%r23, [%r18 + %r0] 0x20
	.word 0xecc70e80  ! 181: LDSWA_R	ldswa	[%r28, %r0] 0x74, %r22
	.word 0x01000000  ! 182: NOP	nop
	.word 0xe29d84a0  ! 183: LDDA_R	ldda	[%r22, %r0] 0x25, %r17
	.word 0x8780204f  ! 184: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xe4a78e40  ! 185: STWA_R	stwa	%r18, [%r30 + %r0] 0x72
	.word 0xe6b46000  ! 186: STHA_I	stha	%r19, [%r17 + 0x0000] %asi
	.word 0xe6b42000  ! 187: STHA_I	stha	%r19, [%r16 + 0x0000] %asi
	.word 0xee8c8400  ! 188: LDUBA_R	lduba	[%r18, %r0] 0x20, %r23
	.word 0xe6c46000  ! 189: LDSWA_I	ldswa	[%r17, + 0x0000] %asi, %r19
	.word 0x87802074  ! 190: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0x01000000  ! 191: NOP	nop
	.word 0xe6cf2000  ! 192: LDSBA_I	ldsba	[%r28, + 0x0000] %asi, %r19
	.word 0xeea544a0  ! 193: STWA_R	stwa	%r23, [%r21 + %r0] 0x25
	.word 0xe4d76000  ! 194: LDSHA_I	ldsha	[%r29, + 0x0000] %asi, %r18
	.word 0xe4bf6000  ! 195: STDA_I	stda	%r18, [%r29 + 0x0000] %asi
	.word 0xe48f2000  ! 196: LDUBA_I	lduba	[%r28, + 0x0000] %asi, %r18
	.word 0xeeb7ce80  ! 197: STHA_R	stha	%r23, [%r31 + %r0] 0x74
	.word 0x87802072  ! 198: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0xea9f0e40  ! 199: LDDA_R	ldda	[%r28, %r0] 0x72, %r21
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_2:
	.word 0xe0cc0400  ! 2: LDSBA_R	ldsba	[%r16, %r0] 0x20, %r16
	.word 0xeaad04a0  ! 3: STBA_R	stba	%r21, [%r20 + %r0] 0x25
	.word 0xe28f2000  ! 4: LDUBA_I	lduba	[%r28, + 0x0000] %asi, %r17
	.word 0xe2c72000  ! 5: LDSWA_I	ldswa	[%r28, + 0x0000] %asi, %r17
	.word 0xe2a7e000  ! 6: STWA_I	stwa	%r17, [%r31 + 0x0000] %asi
	.word 0xe29f4e40  ! 7: LDDA_R	ldda	[%r29, %r0] 0x72, %r17
	.word 0xe687a000  ! 8: LDUWA_I	lduwa	[%r30, + 0x0000] %asi, %r19
	.word 0xe6976000  ! 9: LDUHA_I	lduha	[%r29, + 0x0000] %asi, %r19
	.word 0xe697e000  ! 10: LDUHA_I	lduha	[%r31, + 0x0000] %asi, %r19
	.word 0x01000000  ! 11: NOP	nop
	mov	0x30, %r26
	.word 0xe6cf6000  ! 13: LDSBA_I	ldsba	[%r29, + 0x0000] %asi, %r19
	.word 0x01000000  ! 14: NOP	nop
	.word 0xe0ddc4a0  ! 15: LDXA_R	ldxa	[%r23, %r0] 0x25, %r16
	.word 0xecb7e000  ! 16: STHA_I	stha	%r22, [%r31 + 0x0000] %asi
	.word 0x87802025  ! 17: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0xeccde000  ! 18: LDSBA_I	ldsba	[%r23, + 0x0000] %asi, %r22
	.word 0xecada000  ! 19: STBA_I	stba	%r22, [%r22 + 0x0000] %asi
	.word 0xe88649e0  ! 20: LDUWA_R	lduwa	[%r25, %r0] 0x4f, %r20
	.word 0xecf504a0  ! 21: STXA_R	stxa	%r22, [%r20 + %r0] 0x25
	.word 0x87802072  ! 22: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0x01000000  ! 23: NOP	nop
	.word 0xe4d609e0  ! 24: LDSHA_R	ldsha	[%r24, %r0] 0x4f, %r18
	.word 0x87802072  ! 25: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0x01000000  ! 26: NOP	nop
	.word 0xe48f6000  ! 27: LDUBA_I	lduba	[%r29, + 0x0000] %asi, %r18
	.word 0xeeac8400  ! 28: STBA_R	stba	%r23, [%r18 + %r0] 0x20
	.word 0xecce89e0  ! 29: LDSBA_R	ldsba	[%r26, %r0] 0x4f, %r22
	.word 0x87802020  ! 30: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe8dfce80  ! 31: LDXA_R	ldxa	[%r31, %r0] 0x74, %r20
	.word 0xe6b6e000  ! 32: STHA_I	stha	%r19, [%r27 + 0x0000] %asi
	.word 0x01000000  ! 33: NOP	nop
	.word 0xe6ce2000  ! 34: LDSBA_I	ldsba	[%r24, + 0x0000] %asi, %r19
	.word 0xe8cf0e60  ! 35: LDSBA_R	ldsba	[%r28, %r0] 0x73, %r20
	.word 0xe0b6e000  ! 36: STHA_I	stha	%r16, [%r27 + 0x0000] %asi
	.word 0xe0b6e000  ! 37: STHA_I	stha	%r16, [%r27 + 0x0000] %asi
	.word 0xe0970e40  ! 38: LDUHA_R	lduha	[%r28, %r0] 0x72, %r16
	.word 0xeec7ce60  ! 39: LDSWA_R	ldswa	[%r31, %r0] 0x73, %r23
	.word 0xe2962000  ! 40: LDUHA_I	lduha	[%r24, + 0x0000] %asi, %r17
	.word 0x87802020  ! 41: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0x01000000  ! 42: NOP	nop
	.word 0xe69d44a0  ! 43: LDDA_R	ldda	[%r21, %r0] 0x25, %r19
	.word 0xe8d40400  ! 44: LDSHA_R	ldsha	[%r16, %r0] 0x20, %r20
	.word 0xeaad84a0  ! 45: STBA_R	stba	%r21, [%r22 + %r0] 0x25
	.word 0xe0d70e40  ! 46: LDSHA_R	ldsha	[%r28, %r0] 0x72, %r16
	.word 0xe6d72000  ! 47: LDSHA_I	ldsha	[%r28, + 0x0000] %asi, %r19
	.word 0xe6876000  ! 48: LDUWA_I	lduwa	[%r29, + 0x0000] %asi, %r19
	.word 0xe4cf4e40  ! 49: LDSBA_R	ldsba	[%r29, %r0] 0x72, %r18
	.word 0xead76000  ! 50: LDSHA_I	ldsha	[%r29, + 0x0000] %asi, %r21
	.word 0x01000000  ! 51: NOP	nop
	.word 0x87802073  ! 52: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0x01000000  ! 53: NOP	nop
	.word 0x87802072  ! 54: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0xe4afce60  ! 55: STBA_R	stba	%r18, [%r31 + %r0] 0x73
	.word 0xee9f6000  ! 56: LDDA_I	ldda	[%r29, + 0x0000] %asi, %r23
	.word 0xe2b78e40  ! 57: STHA_R	stha	%r17, [%r30 + %r0] 0x72
	.word 0xe2c76000  ! 58: LDSWA_I	ldswa	[%r29, + 0x0000] %asi, %r17
	.word 0x01000000  ! 59: NOP	nop
	.word 0xe2cf6000  ! 60: LDSBA_I	ldsba	[%r29, + 0x0000] %asi, %r17
	.word 0x87802073  ! 61: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0x01000000  ! 62: NOP	nop
	.word 0xe2ada000  ! 63: STBA_I	stba	%r17, [%r22 + 0x0000] %asi
	.word 0xe2bd2000  ! 64: STDA_I	stda	%r17, [%r20 + 0x0000] %asi
	.word 0xe2c52000  ! 65: LDSWA_I	ldswa	[%r20, + 0x0000] %asi, %r17
	.word 0xe8ac8400  ! 66: STBA_R	stba	%r20, [%r18 + %r0] 0x20
	.word 0xeaa52000  ! 67: STWA_I	stwa	%r21, [%r20 + 0x0000] %asi
	.word 0xea8d2000  ! 68: LDUBA_I	lduba	[%r20, + 0x0000] %asi, %r21
	.word 0xe0b78e40  ! 69: STHA_R	stha	%r16, [%r30 + %r0] 0x72
	.word 0xe4bc8400  ! 70: STDA_R	stda	%r18, [%r18 + %r0] 0x20
	.word 0xe8ddc4a0  ! 71: LDXA_R	ldxa	[%r23, %r0] 0x25, %r20
	.word 0x87802020  ! 72: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0x87802020  ! 73: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe48f0e40  ! 74: LDUBA_R	lduba	[%r28, %r0] 0x72, %r18
	.word 0xeaf40400  ! 75: STXA_R	stxa	%r21, [%r16 + %r0] 0x20
	.word 0xecb7ce40  ! 76: STHA_R	stha	%r22, [%r31 + %r0] 0x72
	.word 0x01000000  ! 77: NOP	nop
	.word 0x87802073  ! 78: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0x87802020  ! 79: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xec8f8e80  ! 80: LDUBA_R	lduba	[%r30, %r0] 0x74, %r22
	.word 0xe28e49e0  ! 81: LDUBA_R	lduba	[%r25, %r0] 0x4f, %r17
	.word 0xe4f4a000  ! 82: STXA_I	stxa	%r18, [%r18 + 0x0000] %asi
	.word 0xe0f44400  ! 83: STXA_R	stxa	%r16, [%r17 + %r0] 0x20
	.word 0xe0bd04a0  ! 84: STDA_R	stda	%r16, [%r20 + %r0] 0x25
	.word 0xe0a4e000  ! 85: STWA_I	stwa	%r16, [%r19 + 0x0000] %asi
	.word 0xe0cca000  ! 86: LDSBA_I	ldsba	[%r18, + 0x0000] %asi, %r16
	.word 0xe6dec9e0  ! 87: LDXA_R	ldxa	[%r27, %r0] 0x4f, %r19
	.word 0xeaa42000  ! 88: STWA_I	stwa	%r21, [%r16 + 0x0000] %asi
	.word 0xeaa4a000  ! 89: STWA_I	stwa	%r21, [%r18 + 0x0000] %asi
	.word 0xeaf4e000  ! 90: STXA_I	stxa	%r21, [%r19 + 0x0000] %asi
	.word 0x01000000  ! 91: NOP	nop
	.word 0xead46000  ! 92: LDSHA_I	ldsha	[%r17, + 0x0000] %asi, %r21
	.word 0xea9c2000  ! 93: LDDA_I	ldda	[%r16, + 0x0000] %asi, %r21
	.word 0x87802020  ! 94: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xec974e40  ! 95: LDUHA_R	lduha	[%r29, %r0] 0x72, %r22
	.word 0xe484e000  ! 96: LDUWA_I	lduwa	[%r19, + 0x0000] %asi, %r18
	.word 0xe6d74e40  ! 97: LDSHA_R	ldsha	[%r29, %r0] 0x72, %r19
	.word 0xe28ca000  ! 98: LDUBA_I	lduba	[%r18, + 0x0000] %asi, %r17
	.word 0xe0bc0400  ! 99: STDA_R	stda	%r16, [%r16 + %r0] 0x20
	.word 0xeed42000  ! 100: LDSHA_I	ldsha	[%r16, + 0x0000] %asi, %r23
	.word 0x8780204f  ! 101: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xeeb7e000  ! 102: STHA_I	stha	%r23, [%r31 + 0x0000] %asi
	.word 0x8780204f  ! 103: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0x01000000  ! 104: NOP	nop
	.word 0x87802073  ! 105: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0x87802074  ! 106: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0xee876000  ! 107: LDUWA_I	lduwa	[%r29, + 0x0000] %asi, %r23
	.word 0xee9f2000  ! 108: LDDA_I	ldda	[%r28, + 0x0000] %asi, %r23
	.word 0x87802020  ! 109: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0x87802020  ! 110: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe2cc0400  ! 111: LDSBA_R	ldsba	[%r16, %r0] 0x20, %r17
	.word 0x87802020  ! 112: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0x87802073  ! 113: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0x01000000  ! 114: NOP	nop
	mov	0x78, %r17
	.word 0xecb7a000  ! 116: STHA_I	stha	%r22, [%r30 + 0x0000] %asi
	.word 0x01000000  ! 117: NOP	nop
	.word 0xecb76000  ! 118: STHA_I	stha	%r22, [%r29 + 0x0000] %asi
	.word 0xe6bcc400  ! 119: STDA_R	stda	%r19, [%r19 + %r0] 0x20
	.word 0xe8f7e000  ! 120: STXA_I	stxa	%r20, [%r31 + 0x0000] %asi
	.word 0x87802025  ! 121: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0x87802020  ! 122: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xecd7ce80  ! 123: LDSHA_R	ldsha	[%r31, %r0] 0x74, %r22
	.word 0x01000000  ! 124: NOP	nop
	.word 0xe68fce80  ! 125: LDUBA_R	lduba	[%r31, %r0] 0x74, %r19
	.word 0xe0af8e40  ! 126: STBA_R	stba	%r16, [%r30 + %r0] 0x72
	.word 0xeaac4400  ! 127: STBA_R	stba	%r21, [%r17 + %r0] 0x20
	.word 0xe097e000  ! 128: LDUHA_I	lduha	[%r31, + 0x0000] %asi, %r16
	.word 0xe0b7e000  ! 129: STHA_I	stha	%r16, [%r31 + 0x0000] %asi
	.word 0xe08f6000  ! 130: LDUBA_I	lduba	[%r29, + 0x0000] %asi, %r16
	.word 0xe0f7e000  ! 131: STXA_I	stxa	%r16, [%r31 + 0x0000] %asi
	.word 0xe0b7a000  ! 132: STHA_I	stha	%r16, [%r30 + 0x0000] %asi
	.word 0x87802072  ! 133: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0xe09f2000  ! 134: LDDA_I	ldda	[%r28, + 0x0000] %asi, %r16
	.word 0xe0afe000  ! 135: STBA_I	stba	%r16, [%r31 + 0x0000] %asi
	.word 0xe0d7e000  ! 136: LDSHA_I	ldsha	[%r31, + 0x0000] %asi, %r16
	.word 0xe0976000  ! 137: LDUHA_I	lduha	[%r29, + 0x0000] %asi, %r16
	.word 0xe0a76000  ! 138: STWA_I	stwa	%r16, [%r29 + 0x0000] %asi
	.word 0xe0c72000  ! 139: LDSWA_I	ldswa	[%r28, + 0x0000] %asi, %r16
	.word 0x87802073  ! 140: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0xe0de89e0  ! 141: LDXA_R	ldxa	[%r26, %r0] 0x4f, %r16
	.word 0xe2a46000  ! 142: STWA_I	stwa	%r17, [%r17 + 0x0000] %asi
	.word 0x87802072  ! 143: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0x87802073  ! 144: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0xe2bde000  ! 145: STDA_I	stda	%r17, [%r23 + 0x0000] %asi
	mov	0x3d0, %r23
	.word 0x01000000  ! 147: NOP	nop
	.word 0x01000000  ! 148: NOP	nop
	.word 0x01000000  ! 149: NOP	nop
	.word 0x8780204f  ! 150: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0x01000000  ! 151: NOP	nop
	.word 0xe6f544a0  ! 152: STXA_R	stxa	%r19, [%r21 + %r0] 0x25
	.word 0xe69d6000  ! 153: LDDA_I	ldda	[%r21, + 0x0000] %asi, %r19
	.word 0xeacc4400  ! 154: LDSBA_R	ldsba	[%r17, %r0] 0x20, %r21
	.word 0x01000000  ! 155: NOP	nop
	.word 0xe49d2000  ! 156: LDDA_I	ldda	[%r20, + 0x0000] %asi, %r18
	.word 0xe8cf0e40  ! 157: LDSBA_R	ldsba	[%r28, %r0] 0x72, %r20
	mov	0x40, %r25
	.word 0xe295e000  ! 159: LDUHA_I	lduha	[%r23, + 0x0000] %asi, %r17
	.word 0xe2cf0e40  ! 160: LDSBA_R	ldsba	[%r28, %r0] 0x72, %r17
	.word 0xe4d5a000  ! 161: LDSHA_I	ldsha	[%r22, + 0x0000] %asi, %r18
	.word 0xeeb609e0  ! 162: STHA_R	stha	%r23, [%r24 + %r0] 0x4f
	.word 0xe68d2000  ! 163: LDUBA_I	lduba	[%r20, + 0x0000] %asi, %r19
	.word 0xe6bd6000  ! 164: STDA_I	stda	%r19, [%r21 + 0x0000] %asi
	.word 0xe0afce80  ! 165: STBA_R	stba	%r16, [%r31 + %r0] 0x74
	.word 0xe8ade000  ! 166: STBA_I	stba	%r20, [%r23 + 0x0000] %asi
	mov	0x30, %r26
	.word 0x01000000  ! 168: NOP	nop
	.word 0xe8bde000  ! 169: STDA_I	stda	%r20, [%r23 + 0x0000] %asi
	.word 0x87802074  ! 170: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0x01000000  ! 171: NOP	nop
	.word 0xe6ae49e0  ! 172: STBA_R	stba	%r19, [%r25 + %r0] 0x4f
	.word 0xe88d44a0  ! 173: LDUBA_R	lduba	[%r21, %r0] 0x25, %r20
	.word 0x87802074  ! 174: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0x01000000  ! 175: NOP	nop
	.word 0xe4f7a000  ! 176: STXA_I	stxa	%r18, [%r30 + 0x0000] %asi
	.word 0xe4bfe000  ! 177: STDA_I	stda	%r18, [%r31 + 0x0000] %asi
	.word 0xeef7ce40  ! 178: STXA_R	stxa	%r23, [%r31 + %r0] 0x72
	.word 0xe48f2000  ! 179: LDUBA_I	lduba	[%r28, + 0x0000] %asi, %r18
	.word 0xe8af4e60  ! 180: STBA_R	stba	%r20, [%r29 + %r0] 0x73
	.word 0xeec74e40  ! 181: LDSWA_R	ldswa	[%r29, %r0] 0x72, %r23
	.word 0x01000000  ! 182: NOP	nop
	.word 0xe49f8e60  ! 183: LDDA_R	ldda	[%r30, %r0] 0x73, %r18
	.word 0x87802072  ! 184: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0xe6a649e0  ! 185: STWA_R	stwa	%r19, [%r25 + %r0] 0x4f
	.word 0xe6b4e000  ! 186: STHA_I	stha	%r19, [%r19 + 0x0000] %asi
	.word 0xe6b4a000  ! 187: STHA_I	stha	%r19, [%r18 + 0x0000] %asi
	.word 0xe48c8400  ! 188: LDUBA_R	lduba	[%r18, %r0] 0x20, %r18
	.word 0xe6c42000  ! 189: LDSWA_I	ldswa	[%r16, + 0x0000] %asi, %r19
	.word 0x87802074  ! 190: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0x01000000  ! 191: NOP	nop
	.word 0xe6cfe000  ! 192: LDSBA_I	ldsba	[%r31, + 0x0000] %asi, %r19
	.word 0xe2a48400  ! 193: STWA_R	stwa	%r17, [%r18 + %r0] 0x20
	.word 0xe4d76000  ! 194: LDSHA_I	ldsha	[%r29, + 0x0000] %asi, %r18
	.word 0xe4bf6000  ! 195: STDA_I	stda	%r18, [%r29 + 0x0000] %asi
	.word 0xe48f6000  ! 196: LDUBA_I	lduba	[%r29, + 0x0000] %asi, %r18
	.word 0xe4b70e80  ! 197: STHA_R	stha	%r18, [%r28 + %r0] 0x74
	.word 0x87802072  ! 198: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0xe09c0400  ! 199: LDDA_R	ldda	[%r16, %r0] 0x20, %r16
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_1:
	.word 0xe2cf8e80  ! 2: LDSBA_R	ldsba	[%r30, %r0] 0x74, %r17
	.word 0xeaafce60  ! 3: STBA_R	stba	%r21, [%r31 + %r0] 0x73
	.word 0xe28f2000  ! 4: LDUBA_I	lduba	[%r28, + 0x0000] %asi, %r17
	.word 0xe2c7a000  ! 5: LDSWA_I	ldswa	[%r30, + 0x0000] %asi, %r17
	.word 0xe2a76000  ! 6: STWA_I	stwa	%r17, [%r29 + 0x0000] %asi
	.word 0xe69e89e0  ! 7: LDDA_R	ldda	[%r26, %r0] 0x4f, %r19
	.word 0xe687e000  ! 8: LDUWA_I	lduwa	[%r31, + 0x0000] %asi, %r19
	.word 0xe6976000  ! 9: LDUHA_I	lduha	[%r29, + 0x0000] %asi, %r19
	.word 0xe697e000  ! 10: LDUHA_I	lduha	[%r31, + 0x0000] %asi, %r19
	.word 0x01000000  ! 11: NOP	nop
	mov	0x50, %r25
	.word 0xe6cf2000  ! 13: LDSBA_I	ldsba	[%r28, + 0x0000] %asi, %r19
	.word 0x01000000  ! 14: NOP	nop
	.word 0xeedcc400  ! 15: LDXA_R	ldxa	[%r19, %r0] 0x20, %r23
	.word 0xecb7a000  ! 16: STHA_I	stha	%r22, [%r30 + 0x0000] %asi
	.word 0x87802074  ! 17: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0xeccd2000  ! 18: LDSBA_I	ldsba	[%r20, + 0x0000] %asi, %r22
	.word 0xecade000  ! 19: STBA_I	stba	%r22, [%r23 + 0x0000] %asi
	.word 0xec848400  ! 20: LDUWA_R	lduwa	[%r18, %r0] 0x20, %r22
	.word 0xe2f504a0  ! 21: STXA_R	stxa	%r17, [%r20 + %r0] 0x25
	.word 0x87802074  ! 22: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0x01000000  ! 23: NOP	nop
	.word 0xeed70e60  ! 24: LDSHA_R	ldsha	[%r28, %r0] 0x73, %r23
	.word 0x87802074  ! 25: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0x01000000  ! 26: NOP	nop
	.word 0xe48f6000  ! 27: LDUBA_I	lduba	[%r29, + 0x0000] %asi, %r18
	.word 0xeaac4400  ! 28: STBA_R	stba	%r21, [%r17 + %r0] 0x20
	.word 0xe4cc8400  ! 29: LDSBA_R	ldsba	[%r18, %r0] 0x20, %r18
	.word 0x87802020  ! 30: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe4df0e40  ! 31: LDXA_R	ldxa	[%r28, %r0] 0x72, %r18
	.word 0xe6b6e000  ! 32: STHA_I	stha	%r19, [%r27 + 0x0000] %asi
	.word 0x01000000  ! 33: NOP	nop
	.word 0xe6ce2000  ! 34: LDSBA_I	ldsba	[%r24, + 0x0000] %asi, %r19
	.word 0xe4cf4e80  ! 35: LDSBA_R	ldsba	[%r29, %r0] 0x74, %r18
	.word 0xe0b6e000  ! 36: STHA_I	stha	%r16, [%r27 + 0x0000] %asi
	.word 0xe0b6a000  ! 37: STHA_I	stha	%r16, [%r26 + 0x0000] %asi
	.word 0xe494c400  ! 38: LDUHA_R	lduha	[%r19, %r0] 0x20, %r18
	.word 0xeac70e40  ! 39: LDSWA_R	ldswa	[%r28, %r0] 0x72, %r21
	.word 0xe296e000  ! 40: LDUHA_I	lduha	[%r27, + 0x0000] %asi, %r17
	.word 0x87802074  ! 41: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0x01000000  ! 42: NOP	nop
	.word 0xe89d04a0  ! 43: LDDA_R	ldda	[%r20, %r0] 0x25, %r20
	.word 0xe0d5c4a0  ! 44: LDSHA_R	ldsha	[%r23, %r0] 0x25, %r16
	.word 0xeeaf0e40  ! 45: STBA_R	stba	%r23, [%r28 + %r0] 0x72
	.word 0xead70e40  ! 46: LDSHA_R	ldsha	[%r28, %r0] 0x72, %r21
	.word 0xe6d7e000  ! 47: LDSHA_I	ldsha	[%r31, + 0x0000] %asi, %r19
	.word 0xe687a000  ! 48: LDUWA_I	lduwa	[%r30, + 0x0000] %asi, %r19
	.word 0xeccf4e60  ! 49: LDSBA_R	ldsba	[%r29, %r0] 0x73, %r22
	.word 0xead7e000  ! 50: LDSHA_I	ldsha	[%r31, + 0x0000] %asi, %r21
	.word 0x01000000  ! 51: NOP	nop
	.word 0x87802020  ! 52: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0x01000000  ! 53: NOP	nop
	.word 0x87802072  ! 54: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0xecaf8e60  ! 55: STBA_R	stba	%r22, [%r30 + %r0] 0x73
	.word 0xee9f6000  ! 56: LDDA_I	ldda	[%r29, + 0x0000] %asi, %r23
	.word 0xe2b689e0  ! 57: STHA_R	stha	%r17, [%r26 + %r0] 0x4f
	.word 0xe2c7a000  ! 58: LDSWA_I	ldswa	[%r30, + 0x0000] %asi, %r17
	.word 0x01000000  ! 59: NOP	nop
	.word 0xe2cf6000  ! 60: LDSBA_I	ldsba	[%r29, + 0x0000] %asi, %r17
	.word 0x87802025  ! 61: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0x01000000  ! 62: NOP	nop
	.word 0xe2ad2000  ! 63: STBA_I	stba	%r17, [%r20 + 0x0000] %asi
	.word 0xe2bd2000  ! 64: STDA_I	stda	%r17, [%r20 + 0x0000] %asi
	.word 0xe2c5e000  ! 65: LDSWA_I	ldswa	[%r23, + 0x0000] %asi, %r17
	.word 0xeeacc400  ! 66: STBA_R	stba	%r23, [%r19 + %r0] 0x20
	.word 0xeaa56000  ! 67: STWA_I	stwa	%r21, [%r21 + 0x0000] %asi
	.word 0xea8de000  ! 68: LDUBA_I	lduba	[%r23, + 0x0000] %asi, %r21
	.word 0xe6b70e40  ! 69: STHA_R	stha	%r19, [%r28 + %r0] 0x72
	.word 0xe2bf4e40  ! 70: STDA_R	stda	%r17, [%r29 + %r0] 0x72
	.word 0xecdd04a0  ! 71: LDXA_R	ldxa	[%r20, %r0] 0x25, %r22
	.word 0x8780204f  ! 72: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0x8780204f  ! 73: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xe28e09e0  ! 74: LDUBA_R	lduba	[%r24, %r0] 0x4f, %r17
	.word 0xecf44400  ! 75: STXA_R	stxa	%r22, [%r17 + %r0] 0x20
	.word 0xe6b5c4a0  ! 76: STHA_R	stha	%r19, [%r23 + %r0] 0x25
	.word 0x01000000  ! 77: NOP	nop
	.word 0x87802072  ! 78: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0x87802074  ! 79: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0xe48f8e60  ! 80: LDUBA_R	lduba	[%r30, %r0] 0x73, %r18
	.word 0xe28d44a0  ! 81: LDUBA_R	lduba	[%r21, %r0] 0x25, %r17
	.word 0xe4f4a000  ! 82: STXA_I	stxa	%r18, [%r18 + 0x0000] %asi
	.word 0xecf504a0  ! 83: STXA_R	stxa	%r22, [%r20 + %r0] 0x25
	.word 0xe2bf8e40  ! 84: STDA_R	stda	%r17, [%r30 + %r0] 0x72
	.word 0xe0a4a000  ! 85: STWA_I	stwa	%r16, [%r18 + 0x0000] %asi
	.word 0xe0cce000  ! 86: LDSBA_I	ldsba	[%r19, + 0x0000] %asi, %r16
	.word 0xe2dd04a0  ! 87: LDXA_R	ldxa	[%r20, %r0] 0x25, %r17
	.word 0xeaa4e000  ! 88: STWA_I	stwa	%r21, [%r19 + 0x0000] %asi
	.word 0xeaa4a000  ! 89: STWA_I	stwa	%r21, [%r18 + 0x0000] %asi
	.word 0xeaf4a000  ! 90: STXA_I	stxa	%r21, [%r18 + 0x0000] %asi
	.word 0x01000000  ! 91: NOP	nop
	.word 0xead42000  ! 92: LDSHA_I	ldsha	[%r16, + 0x0000] %asi, %r21
	.word 0xea9c2000  ! 93: LDDA_I	ldda	[%r16, + 0x0000] %asi, %r21
	.word 0x8780204f  ! 94: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xea9649e0  ! 95: LDUHA_R	lduha	[%r25, %r0] 0x4f, %r21
	.word 0xe484e000  ! 96: LDUWA_I	lduwa	[%r19, + 0x0000] %asi, %r18
	.word 0xecd70e60  ! 97: LDSHA_R	ldsha	[%r28, %r0] 0x73, %r22
	.word 0xe28ca000  ! 98: LDUBA_I	lduba	[%r18, + 0x0000] %asi, %r17
	.word 0xe0bf8e80  ! 99: STDA_R	stda	%r16, [%r30 + %r0] 0x74
	.word 0xeed4e000  ! 100: LDSHA_I	ldsha	[%r19, + 0x0000] %asi, %r23
	.word 0x87802025  ! 101: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0xeeb76000  ! 102: STHA_I	stha	%r23, [%r29 + 0x0000] %asi
	.word 0x87802025  ! 103: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0x01000000  ! 104: NOP	nop
	.word 0x87802020  ! 105: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0x87802020  ! 106: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xee872000  ! 107: LDUWA_I	lduwa	[%r28, + 0x0000] %asi, %r23
	.word 0xee9fe000  ! 108: LDDA_I	ldda	[%r31, + 0x0000] %asi, %r23
	.word 0x87802020  ! 109: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0x87802020  ! 110: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xeacf0e40  ! 111: LDSBA_R	ldsba	[%r28, %r0] 0x72, %r21
	.word 0x87802073  ! 112: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0x87802072  ! 113: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0x01000000  ! 114: NOP	nop
	mov	0x0, %r18
	.word 0xecb76000  ! 116: STHA_I	stha	%r22, [%r29 + 0x0000] %asi
	.word 0x01000000  ! 117: NOP	nop
	.word 0xecb76000  ! 118: STHA_I	stha	%r22, [%r29 + 0x0000] %asi
	.word 0xe2be49e0  ! 119: STDA_R	stda	%r17, [%r25 + %r0] 0x4f
	.word 0xe8f76000  ! 120: STXA_I	stxa	%r20, [%r29 + 0x0000] %asi
	.word 0x8780204f  ! 121: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0x87802020  ! 122: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xecd48400  ! 123: LDSHA_R	ldsha	[%r18, %r0] 0x20, %r22
	.word 0x01000000  ! 124: NOP	nop
	.word 0xe68c4400  ! 125: LDUBA_R	lduba	[%r17, %r0] 0x20, %r19
	.word 0xe2ac4400  ! 126: STBA_R	stba	%r17, [%r17 + %r0] 0x20
	.word 0xe6ac4400  ! 127: STBA_R	stba	%r19, [%r17 + %r0] 0x20
	.word 0xe097e000  ! 128: LDUHA_I	lduha	[%r31, + 0x0000] %asi, %r16
	.word 0xe0b7a000  ! 129: STHA_I	stha	%r16, [%r30 + 0x0000] %asi
	.word 0xe08f2000  ! 130: LDUBA_I	lduba	[%r28, + 0x0000] %asi, %r16
	.word 0xe0f72000  ! 131: STXA_I	stxa	%r16, [%r28 + 0x0000] %asi
	.word 0xe0b72000  ! 132: STHA_I	stha	%r16, [%r28 + 0x0000] %asi
	.word 0x87802073  ! 133: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0xe09fe000  ! 134: LDDA_I	ldda	[%r31, + 0x0000] %asi, %r16
	.word 0xe0af6000  ! 135: STBA_I	stba	%r16, [%r29 + 0x0000] %asi
	.word 0xe0d7e000  ! 136: LDSHA_I	ldsha	[%r31, + 0x0000] %asi, %r16
	.word 0xe0972000  ! 137: LDUHA_I	lduha	[%r28, + 0x0000] %asi, %r16
	.word 0xe0a72000  ! 138: STWA_I	stwa	%r16, [%r28 + 0x0000] %asi
	.word 0xe0c7e000  ! 139: LDSWA_I	ldswa	[%r31, + 0x0000] %asi, %r16
	.word 0x87802073  ! 140: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0xeadc4400  ! 141: LDXA_R	ldxa	[%r17, %r0] 0x20, %r21
	.word 0xe2a42000  ! 142: STWA_I	stwa	%r17, [%r16 + 0x0000] %asi
	.word 0x87802020  ! 143: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0x87802072  ! 144: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0xe2bda000  ! 145: STDA_I	stda	%r17, [%r22 + 0x0000] %asi
	mov	0x3e8, %r20
	.word 0x01000000  ! 147: NOP	nop
	.word 0x01000000  ! 148: NOP	nop
	.word 0x01000000  ! 149: NOP	nop
	.word 0x87802025  ! 150: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0x01000000  ! 151: NOP	nop
	.word 0xeef6c9e0  ! 152: STXA_R	stxa	%r23, [%r27 + %r0] 0x4f
	.word 0xe69de000  ! 153: LDDA_I	ldda	[%r23, + 0x0000] %asi, %r19
	.word 0xe8cf8e40  ! 154: LDSBA_R	ldsba	[%r30, %r0] 0x72, %r20
	.word 0x01000000  ! 155: NOP	nop
	.word 0xe49de000  ! 156: LDDA_I	ldda	[%r23, + 0x0000] %asi, %r18
	.word 0xeccc8400  ! 157: LDSBA_R	ldsba	[%r18, %r0] 0x20, %r22
	mov	0x10, %r24
	.word 0xe295a000  ! 159: LDUHA_I	lduha	[%r22, + 0x0000] %asi, %r17
	.word 0xe2ccc400  ! 160: LDSBA_R	ldsba	[%r19, %r0] 0x20, %r17
	.word 0xe4d5e000  ! 161: LDSHA_I	ldsha	[%r23, + 0x0000] %asi, %r18
	.word 0xe6b4c400  ! 162: STHA_R	stha	%r19, [%r19 + %r0] 0x20
	.word 0xe68d6000  ! 163: LDUBA_I	lduba	[%r21, + 0x0000] %asi, %r19
	.word 0xe6bde000  ! 164: STDA_I	stda	%r19, [%r23 + 0x0000] %asi
	.word 0xe4ae09e0  ! 165: STBA_R	stba	%r18, [%r24 + %r0] 0x4f
	.word 0xe8ad6000  ! 166: STBA_I	stba	%r20, [%r21 + 0x0000] %asi
	mov	0x78, %r24
	.word 0x01000000  ! 168: NOP	nop
	.word 0xe8bd6000  ! 169: STDA_I	stda	%r20, [%r21 + 0x0000] %asi
	.word 0x87802074  ! 170: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0x01000000  ! 171: NOP	nop
	.word 0xeaacc400  ! 172: STBA_R	stba	%r21, [%r19 + %r0] 0x20
	.word 0xec8c8400  ! 173: LDUBA_R	lduba	[%r18, %r0] 0x20, %r22
	.word 0x87802073  ! 174: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0x01000000  ! 175: NOP	nop
	.word 0xe4f7e000  ! 176: STXA_I	stxa	%r18, [%r31 + 0x0000] %asi
	.word 0xe4bf6000  ! 177: STDA_I	stda	%r18, [%r29 + 0x0000] %asi
	.word 0xe0f5c4a0  ! 178: STXA_R	stxa	%r16, [%r23 + %r0] 0x25
	.word 0xe48fe000  ! 179: LDUBA_I	lduba	[%r31, + 0x0000] %asi, %r18
	.word 0xe4af0e80  ! 180: STBA_R	stba	%r18, [%r28 + %r0] 0x74
	.word 0xecc7ce40  ! 181: LDSWA_R	ldswa	[%r31, %r0] 0x72, %r22
	.word 0x01000000  ! 182: NOP	nop
	.word 0xe29f4e80  ! 183: LDDA_R	ldda	[%r29, %r0] 0x74, %r17
	.word 0x87802073  ! 184: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0xe0a40400  ! 185: STWA_R	stwa	%r16, [%r16 + %r0] 0x20
	.word 0xe6b42000  ! 186: STHA_I	stha	%r19, [%r16 + 0x0000] %asi
	.word 0xe6b46000  ! 187: STHA_I	stha	%r19, [%r17 + 0x0000] %asi
	.word 0xe88fce60  ! 188: LDUBA_R	lduba	[%r31, %r0] 0x73, %r20
	.word 0xe6c42000  ! 189: LDSWA_I	ldswa	[%r16, + 0x0000] %asi, %r19
	.word 0x87802073  ! 190: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0x01000000  ! 191: NOP	nop
	.word 0xe6cf6000  ! 192: LDSBA_I	ldsba	[%r29, + 0x0000] %asi, %r19
	.word 0xeca584a0  ! 193: STWA_R	stwa	%r22, [%r22 + %r0] 0x25
	.word 0xe4d7e000  ! 194: LDSHA_I	ldsha	[%r31, + 0x0000] %asi, %r18
	.word 0xe4bfa000  ! 195: STDA_I	stda	%r18, [%r30 + 0x0000] %asi
	.word 0xe48f2000  ! 196: LDUBA_I	lduba	[%r28, + 0x0000] %asi, %r18
	.word 0xe6b70e80  ! 197: STHA_R	stha	%r19, [%r28 + %r0] 0x74
	.word 0x87802020  ! 198: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe69dc4a0  ! 199: LDDA_R	ldda	[%r23, %r0] 0x25, %r19

join_lbl_0_0:
!		$EV trig_pc_d(1,expr(@VA(.RED_EXT_SEC.HRedmode_Reset_Handler) + 4, 16, 16)) -> intp(1, 1, 1)
!		$EV trig_pc_d(1,expr(@VA(.RED_EXT_SEC.HRedmode_Reset_Handler) + 8, 16, 16)) -> intp(2, 1, 1)
!		$EV trig_pc_d(1,expr(@VA(.RED_EXT_SEC.HRedmode_Reset_Handler) + 12, 16, 16)) -> intp(3, 1, 1)
	.data
data_start:

	.xword	0x29b19ecb5c6e3a70
	.xword	0xbdb25fe77473e277
	.xword	0x4ee36982c18b6382
	.xword	0x47f679f16aee8d40
	.xword	0x266bc42d9c922d04
	.xword	0x4bdc21dfb8d56b1f
	.xword	0x0cc48ddcbbeffd55
	.xword	0x809fb8a0d0fbe4b8
	.xword	0x80b09792af238f3c
	.xword	0x61aa83f694921b7a
	.xword	0xca6ba6f1609fe9d5
	.xword	0x788147e166c5c808
	.xword	0x7fe158c6af8c24db
	.xword	0x5e584b2a5d424364
	.xword	0xff7ac35ce91d34d0
	.xword	0x1381bcd11ca8e82c



.text
	ta	T_GOOD_TRAP

.data
	.xword 0x1234567887654321

#if 0
!!# /* File:	tlu_sus_res_1.j
!!#  * Description:
!!#  * This temple is targets the suspend_resume coverage object, by interseting
!!#  * idle, and resume interrupt events in between the asi access,
!!#  * actually thread0 behaves as main thread controlling idle/resume of other (1...3)
!!#  * threads
!!#  */
!!# 
!!# template main ();
!!# 
!!# 
!!# %%section c_declarations
!!# 
!!#   int i, j;
!!#   int idle_intr = 1;
!!#   int idle_cnt = 0;
!!#   int resume_cnt = 0;
!!#   int intr_tid = 1;
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
!!#   if (idle_intr == 0) {
!!#     IJ_printf (th_M, "resume_%d:\n", resume_cnt);
!!#     IJ_printf (th_M, "\tnop\n", resume_cnt);
!!#     IJ_printf (th_M, "\tnop\n", resume_cnt);
!!#     IJ_printf (th_M, "\tnop\n", resume_cnt);
!!#     IJ_printf (th_M, "\tnop\n", resume_cnt);
!!#     IJ_printf (th_M, "!$EV trig_pc_d(0,expr(@VA(.MAIN.resume_%d), 16, 16)) -> intp(%d, 3, %d)\n", resume_cnt, intr_tid, Rv_intr_vect);
!!#     resume_cnt++;
!!#     idle_intr = 1;
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
!!# 	  if (idle_intr) {
!!#             IJ_printf (th_M, "idle_%d:\n", idle_cnt);
!!# 	    IJ_printf (th_M, "!$EV trig_pc_d(0,expr(@VA(.MAIN.idle_%d), 16, 16)) -> intp(%d, 2, %d)\n", idle_cnt, intr_tid, Rv_intr_vect);
!!#             idle_cnt++;
!!# 	    idle_intr = 0;
!!#           } else {
!!#             IJ_printf (th_M, "resume_%d:\n", resume_cnt);
!!# 	    IJ_printf (th_M, "!$EV trig_pc_d(0,expr(@VA(.MAIN.resume_%d), 16, 16)) -> intp(%d, 3, %d)\n", resume_cnt, intr_tid, Rv_intr_vect);
!!#             resume_cnt++;
!!# 	    idle_intr = 1;
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
