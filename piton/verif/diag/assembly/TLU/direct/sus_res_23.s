// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: sus_res_23.s
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
   random seed:	270965576
   Jal tlu_sus_res_23.j:	
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

	setx 0xfd78e1f2473f68d0, %g1, %g0
	setx 0xc7fb9a02559b2456, %g1, %g1
	setx 0xd3fe09eabed2c01a, %g1, %g2
	setx 0x056170fb2c7d458b, %g1, %g3
	setx 0xc59cd7d1c8431d12, %g1, %g4
	setx 0x70a0470ec5ee2ccc, %g1, %g5
	setx 0x52bc512c70da0a7d, %g1, %g6
	setx 0x1fe42b371a3f5f38, %g1, %g7
	setx 0x3725003ccb1c612c, %g1, %r16
	setx 0x8364ff321edc0650, %g1, %r17
	setx 0x0cdc5010bb1abc5a, %g1, %r18
	setx 0x8f2be39d51af107f, %g1, %r19
	setx 0xe8a2b14ceb137741, %g1, %r20
	setx 0xe8be375bae15bf1a, %g1, %r21
	setx 0xa2e3d6f8903ddbe0, %g1, %r22
	setx 0x640f91215f8a1afa, %g1, %r23
	setx 0xacdd423bded54c5b, %g1, %r24
	setx 0x1081dc95de45e0a2, %g1, %r25
	setx 0x67a06b4fa008ccdf, %g1, %r26
	setx 0xa3f0667ec5b8e8d8, %g1, %r27
	setx 0x5f10799415000f0c, %g1, %r28
	setx 0x53ab0cf34c5af405, %g1, %r29
	setx 0xbe146f51cb1e49dd, %g1, %r30
	setx 0x2df71e552c515cd4, %g1, %r31
	save
	setx 0xa6d18f371cf42b1d, %g1, %r16
	setx 0x926710b10dc9d6b0, %g1, %r17
	setx 0x84979b5f0cdef119, %g1, %r18
	setx 0x0341dfb810602db7, %g1, %r19
	setx 0xee10d4a1742440b9, %g1, %r20
	setx 0x692f447acec234bc, %g1, %r21
	setx 0xe2db987540e4d1c0, %g1, %r22
	setx 0x99024724ac4d28a8, %g1, %r23
	setx 0x2a95fcab96398550, %g1, %r24
	setx 0x454d8cfba98d70d4, %g1, %r25
	setx 0x64d304f7e90b31be, %g1, %r26
	setx 0x72ab8ed8b4f01c6e, %g1, %r27
	setx 0xffb48fe24cd6e538, %g1, %r28
	setx 0xce219bfed960a562, %g1, %r29
	setx 0x299df43d5a2e94e0, %g1, %r30
	setx 0x085fcb8000220d24, %g1, %r31
	save
	setx 0x127d14acae70bc45, %g1, %r16
	setx 0x9cf36957caf95a5b, %g1, %r17
	setx 0x251f1aa9239fba3b, %g1, %r18
	setx 0xe90c9e2cae9d9006, %g1, %r19
	setx 0xdc2bb442df4c8bfb, %g1, %r20
	setx 0x7835e1f135aec498, %g1, %r21
	setx 0xb5dd4f1d60c83f70, %g1, %r22
	setx 0x7e628495e6691f8d, %g1, %r23
	setx 0xbf6af20b8dd50ca1, %g1, %r24
	setx 0x56b0d2c68908f0d7, %g1, %r25
	setx 0x054453c848f65ca7, %g1, %r26
	setx 0xc61c49b369d90050, %g1, %r27
	setx 0xdb02215b58e59c48, %g1, %r28
	setx 0xbb7bc5b87f63bfcc, %g1, %r29
	setx 0x47e6b24ea269511a, %g1, %r30
	setx 0x9c8adfaf0c139319, %g1, %r31
	restore
	setx	data_start, %r1, %r25
	mov	0x50, %r16
	mov	0x48, %r17
	mov	0x20, %r18
	mov	0x28, %r19
	mov	0x7d8, %r20
	mov	0x3c8, %r21
	mov	0x7d0, %r22
	mov	0x3e8, %r23
	mov	0x28, %r24
	mov	0x68, %r25
	mov	0x0, %r26
	mov	0x68, %r27
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
	mov	0x7f0, %r21
	.word 0x01000000  ! 3: NOP	nop
	.word 0xe4a48400  ! 4: STWA_R	stwa	%r18, [%r18 + %r0] 0x20
	.word 0xe8cf4e80  ! 5: LDSBA_R	ldsba	[%r29, %r0] 0x74, %r20
	.word 0x01000000  ! 6: NOP	nop
	.word 0xe8a4a000  ! 7: STWA_I	stwa	%r20, [%r18 + 0x0000] %asi
	mov	0x78, %r19
	.word 0xe2dd04a0  ! 9: LDXA_R	ldxa	[%r20, %r0] 0x25, %r17
	.word 0xe2c4e000  ! 10: LDSWA_I	ldswa	[%r19, + 0x0000] %asi, %r17
	.word 0xe0dec9e0  ! 11: LDXA_R	ldxa	[%r27, %r0] 0x4f, %r16
	.word 0xe0dca000  ! 12: LDXA_I	ldxa	[%r18, + 0x0000] %asi, %r16
	.word 0x01000000  ! 13: NOP	nop
	.word 0x01000000  ! 14: NOP	nop
	.word 0xe6bfce60  ! 15: STDA_R	stda	%r19, [%r31 + %r0] 0x73
	.word 0xe6d42000  ! 16: LDSHA_I	ldsha	[%r16, + 0x0000] %asi, %r19
	.word 0xe6b4a000  ! 17: STHA_I	stha	%r19, [%r18 + 0x0000] %asi
	.word 0x01000000  ! 18: NOP	nop
	.word 0xe894c400  ! 19: LDUHA_R	lduha	[%r19, %r0] 0x20, %r20
	.word 0xe8afce40  ! 20: STBA_R	stba	%r20, [%r31 + %r0] 0x72
	.word 0x87802074  ! 21: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0xe29f8e80  ! 22: LDDA_R	ldda	[%r30, %r0] 0x74, %r17
	.word 0xe0ac0400  ! 23: STBA_R	stba	%r16, [%r16 + %r0] 0x20
	.word 0x87802025  ! 24: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0xe0c5e000  ! 25: LDSWA_I	ldswa	[%r23, + 0x0000] %asi, %r16
	.word 0xeca609e0  ! 26: STWA_R	stwa	%r22, [%r24 + %r0] 0x4f
	.word 0xecc5a000  ! 27: LDSWA_I	ldswa	[%r22, + 0x0000] %asi, %r22
	.word 0xeed78e60  ! 28: LDSHA_R	ldsha	[%r30, %r0] 0x73, %r23
	.word 0xeedde000  ! 29: LDXA_I	ldxa	[%r23, + 0x0000] %asi, %r23
	.word 0xe8f40400  ! 30: STXA_R	stxa	%r20, [%r16 + %r0] 0x20
	.word 0xec9c0400  ! 31: LDDA_R	ldda	[%r16, %r0] 0x20, %r22
	.word 0x87802020  ! 32: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0x87802074  ! 33: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0xe8d689e0  ! 34: LDSHA_R	ldsha	[%r26, %r0] 0x4f, %r20
	.word 0x87802073  ! 35: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0xe2b7ce80  ! 36: STHA_R	stha	%r17, [%r31 + %r0] 0x74
	.word 0x87802025  ! 37: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0xe2b5e000  ! 38: STHA_I	stha	%r17, [%r23 + 0x0000] %asi
	.word 0x01000000  ! 39: NOP	nop
	.word 0xe0848400  ! 40: LDUWA_R	lduwa	[%r18, %r0] 0x20, %r16
	.word 0xe097ce60  ! 41: LDUHA_R	lduha	[%r31, %r0] 0x73, %r16
	.word 0xe085e000  ! 42: LDUWA_I	lduwa	[%r23, + 0x0000] %asi, %r16
	.word 0xe0b5e000  ! 43: STHA_I	stha	%r16, [%r23 + 0x0000] %asi
	.word 0xeaa584a0  ! 44: STWA_R	stwa	%r21, [%r22 + %r0] 0x25
	.word 0xead56000  ! 45: LDSHA_I	ldsha	[%r21, + 0x0000] %asi, %r21
	.word 0xe8ae89e0  ! 46: STBA_R	stba	%r20, [%r26 + %r0] 0x4f
	.word 0x01000000  ! 47: NOP	nop
	.word 0xee8f4e60  ! 48: LDUBA_R	lduba	[%r29, %r0] 0x73, %r23
	.word 0x87802072  ! 49: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0xeeac0400  ! 50: STBA_R	stba	%r23, [%r16 + %r0] 0x20
	.word 0x01000000  ! 51: NOP	nop
	.word 0xee8504a0  ! 52: LDUWA_R	lduwa	[%r20, %r0] 0x25, %r23
	.word 0x87802025  ! 53: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0x87802020  ! 54: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xeabfce60  ! 55: STDA_R	stda	%r21, [%r31 + %r0] 0x73
	.word 0xeaaca000  ! 56: STBA_I	stba	%r21, [%r18 + 0x0000] %asi
	.word 0xea9ca000  ! 57: LDDA_I	ldda	[%r18, + 0x0000] %asi, %r21
	.word 0xe6cf8e40  ! 58: LDSBA_R	ldsba	[%r30, %r0] 0x72, %r19
	.word 0xe6b4a000  ! 59: STHA_I	stha	%r19, [%r18 + 0x0000] %asi
	.word 0x01000000  ! 60: NOP	nop
	.word 0x87802020  ! 61: WRASI_I	wr	%r0, 0x0020, %asi
	mov	0x20, %r24
	.word 0xe6bf4e40  ! 63: STDA_R	stda	%r19, [%r29 + %r0] 0x72
	.word 0xe6cca000  ! 64: LDSBA_I	ldsba	[%r18, + 0x0000] %asi, %r19
	.word 0xe6f4a000  ! 65: STXA_I	stxa	%r19, [%r18 + 0x0000] %asi
	.word 0xecbf8e40  ! 66: STDA_R	stda	%r22, [%r30 + %r0] 0x72
	.word 0xe8b7ce80  ! 67: STHA_R	stha	%r20, [%r31 + %r0] 0x74
	.word 0xea848400  ! 68: LDUWA_R	lduwa	[%r18, %r0] 0x20, %r21
	.word 0x87802020  ! 69: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xea94e000  ! 70: LDUHA_I	lduha	[%r19, + 0x0000] %asi, %r21
	.word 0x01000000  ! 71: NOP	nop
	.word 0x87802025  ! 72: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0x87802025  ! 73: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0xe0af0e80  ! 74: STBA_R	stba	%r16, [%r28 + %r0] 0x74
	.word 0x01000000  ! 75: NOP	nop
	.word 0xecac0400  ! 76: STBA_R	stba	%r22, [%r16 + %r0] 0x20
	.word 0x87802074  ! 77: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0x87802073  ! 78: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0xecb7a000  ! 79: STHA_I	stha	%r22, [%r30 + 0x0000] %asi
	.word 0xec876000  ! 80: LDUWA_I	lduwa	[%r29, + 0x0000] %asi, %r22
	.word 0x87802020  ! 81: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0x87802074  ! 82: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0xecc78e60  ! 83: LDSWA_R	ldswa	[%r30, %r0] 0x73, %r22
	.word 0x87802072  ! 84: WRASI_I	wr	%r0, 0x0072, %asi
	ta	T_CHANGE_PRIV	! macro
	.word 0xe4b48400  ! 86: STHA_R	stha	%r18, [%r18 + %r0] 0x20
	.word 0x87802074  ! 87: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0x87802074  ! 88: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0xe4d7a000  ! 89: LDSHA_I	ldsha	[%r30, + 0x0000] %asi, %r18
	.word 0xe6d4c400  ! 90: LDSHA_R	ldsha	[%r19, %r0] 0x20, %r19
	.word 0x01000000  ! 91: NOP	nop
	mov	0x10, %r26
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xeccf0e40  ! 94: LDSBA_R	ldsba	[%r28, %r0] 0x72, %r22
	.word 0x87802020  ! 95: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe6ae09e0  ! 96: STBA_R	stba	%r19, [%r24 + %r0] 0x4f
	.word 0xe68c2000  ! 97: LDUBA_I	lduba	[%r16, + 0x0000] %asi, %r19
	.word 0xe6af0e40  ! 98: STBA_R	stba	%r19, [%r28 + %r0] 0x72
	.word 0xe6a4a000  ! 99: STWA_I	stwa	%r19, [%r18 + 0x0000] %asi
	.word 0xec8f4e40  ! 100: LDUBA_R	lduba	[%r29, %r0] 0x72, %r22
	.word 0xe6adc4a0  ! 101: STBA_R	stba	%r19, [%r23 + %r0] 0x25
	.word 0xe2afce60  ! 102: STBA_R	stba	%r17, [%r31 + %r0] 0x73
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xe294a000  ! 104: LDUHA_I	lduha	[%r18, + 0x0000] %asi, %r17
	.word 0x87802074  ! 105: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0x87802025  ! 106: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0x8780204f  ! 107: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xe6ac8400  ! 108: STBA_R	stba	%r19, [%r18 + %r0] 0x20
	.word 0x01000000  ! 109: NOP	nop
	.word 0x01000000  ! 110: NOP	nop
	.word 0xe6978e60  ! 111: LDUHA_R	lduha	[%r30, %r0] 0x73, %r19
	.word 0x87802074  ! 112: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0xe6b76000  ! 113: STHA_I	stha	%r19, [%r29 + 0x0000] %asi
	.word 0xe6bf6000  ! 114: STDA_I	stda	%r19, [%r29 + 0x0000] %asi
	.word 0x87802073  ! 115: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0x01000000  ! 116: NOP	nop
	.word 0x01000000  ! 117: NOP	nop
	.word 0xe087ce40  ! 118: LDUWA_R	lduwa	[%r31, %r0] 0x72, %r16
	.word 0x87802025  ! 119: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0x87802020  ! 120: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0x8780204f  ! 121: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xe0f6e000  ! 122: STXA_I	stxa	%r16, [%r27 + 0x0000] %asi
	.word 0xe0be6000  ! 123: STDA_I	stda	%r16, [%r25 + 0x0000] %asi
	.word 0x01000000  ! 124: NOP	nop
	mov	0x3c8, %r21
	.word 0xe0a62000  ! 126: STWA_I	stwa	%r16, [%r24 + 0x0000] %asi
	ta	T_CHANGE_HPRIV	! macro
	.word 0x87802074  ! 128: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0x01000000  ! 129: NOP	nop
	.word 0xe0af6000  ! 130: STBA_I	stba	%r16, [%r29 + 0x0000] %asi
	.word 0xe0b76000  ! 131: STHA_I	stha	%r16, [%r29 + 0x0000] %asi
	.word 0xe0b7e000  ! 132: STHA_I	stha	%r16, [%r31 + 0x0000] %asi
	.word 0xe0a7ce80  ! 133: STWA_R	stwa	%r16, [%r31 + %r0] 0x74
	.word 0x01000000  ! 134: NOP	nop
	.word 0xecb7ce80  ! 135: STHA_R	stha	%r22, [%r31 + %r0] 0x74
	.word 0x87802074  ! 136: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0xe88e49e0  ! 137: LDUBA_R	lduba	[%r25, %r0] 0x4f, %r20
	.word 0xe8afa000  ! 138: STBA_I	stba	%r20, [%r30 + 0x0000] %asi
	.word 0x01000000  ! 139: NOP	nop
	.word 0x01000000  ! 140: NOP	nop
	.word 0xe8cf6000  ! 141: LDSBA_I	ldsba	[%r29, + 0x0000] %asi, %r20
	.word 0xe8afe000  ! 142: STBA_I	stba	%r20, [%r31 + 0x0000] %asi
	.word 0xe8976000  ! 143: LDUHA_I	lduha	[%r29, + 0x0000] %asi, %r20
	.word 0x87802072  ! 144: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0xe8a7a000  ! 145: STWA_I	stwa	%r20, [%r30 + 0x0000] %asi
	.word 0xe6b504a0  ! 146: STHA_R	stha	%r19, [%r20 + %r0] 0x25
	.word 0xe6af2000  ! 147: STBA_I	stba	%r19, [%r28 + 0x0000] %asi
	.word 0x01000000  ! 148: NOP	nop
	.word 0xe4ac4400  ! 149: STBA_R	stba	%r18, [%r17 + %r0] 0x20
	.word 0x87802020  ! 150: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0x01000000  ! 151: NOP	nop
	.word 0x8780204f  ! 152: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0x87802025  ! 153: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0x87802073  ! 154: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0x87802020  ! 155: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0x8780204f  ! 156: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xe48e6000  ! 157: LDUBA_I	lduba	[%r25, + 0x0000] %asi, %r18
	.word 0x87802074  ! 158: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0x8780204f  ! 159: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xe6bec9e0  ! 160: STDA_R	stda	%r19, [%r27 + %r0] 0x4f
	.word 0xe6ae6000  ! 161: STBA_I	stba	%r19, [%r25 + 0x0000] %asi
	.word 0x01000000  ! 162: NOP	nop
	.word 0xe6a6c9e0  ! 163: STWA_R	stwa	%r19, [%r27 + %r0] 0x4f
	.word 0x87802074  ! 164: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0x01000000  ! 165: NOP	nop
	.word 0xe68544a0  ! 166: LDUWA_R	lduwa	[%r21, %r0] 0x25, %r19
	.word 0xe6f76000  ! 167: STXA_I	stxa	%r19, [%r29 + 0x0000] %asi
	.word 0x87802025  ! 168: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0xe8de89e0  ! 169: LDXA_R	ldxa	[%r26, %r0] 0x4f, %r20
	.word 0xe89da000  ! 170: LDDA_I	ldda	[%r22, + 0x0000] %asi, %r20
	.word 0xe8a5a000  ! 171: STWA_I	stwa	%r20, [%r22 + 0x0000] %asi
	.word 0xe8952000  ! 172: LDUHA_I	lduha	[%r20, + 0x0000] %asi, %r20
	.word 0xe8ada000  ! 173: STBA_I	stba	%r20, [%r22 + 0x0000] %asi
	.word 0xe8a5a000  ! 174: STWA_I	stwa	%r20, [%r22 + 0x0000] %asi
	.word 0x87802073  ! 175: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0xeecfce60  ! 176: LDSBA_R	ldsba	[%r31, %r0] 0x73, %r23
	.word 0x87802020  ! 177: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xee946000  ! 178: LDUHA_I	lduha	[%r17, + 0x0000] %asi, %r23
	.word 0x01000000  ! 179: NOP	nop
	.word 0xe69fce60  ! 180: LDDA_R	ldda	[%r31, %r0] 0x73, %r19
	mov	0x3f0, %r22
	.word 0xeedf0e80  ! 182: LDXA_R	ldxa	[%r28, %r0] 0x74, %r23
	.word 0x87802025  ! 183: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0x87802025  ! 184: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0xeea52000  ! 185: STWA_I	stwa	%r23, [%r20 + 0x0000] %asi
	mov	0x20, %r19
	.word 0xee952000  ! 187: LDUHA_I	lduha	[%r20, + 0x0000] %asi, %r23
	.word 0x87802072  ! 188: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0xea8f0e80  ! 189: LDUBA_R	lduba	[%r28, %r0] 0x74, %r21
	.word 0xeac72000  ! 190: LDSWA_I	ldswa	[%r28, + 0x0000] %asi, %r21
	.word 0xee8584a0  ! 191: LDUWA_R	lduwa	[%r22, %r0] 0x25, %r23
	.word 0xe6af8e40  ! 192: STBA_R	stba	%r19, [%r30 + %r0] 0x72
	mov	0x3f0, %r22
	.word 0x87802072  ! 194: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0xe6876000  ! 195: LDUWA_I	lduwa	[%r29, + 0x0000] %asi, %r19
	.word 0xe6bfa000  ! 196: STDA_I	stda	%r19, [%r30 + 0x0000] %asi
	.word 0x01000000  ! 197: NOP	nop
	.word 0xeabc8400  ! 198: STDA_R	stda	%r21, [%r18 + %r0] 0x20
	.word 0x87802025  ! 199: WRASI_I	wr	%r0, 0x0025, %asi
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_3:
	mov	0x3d0, %r22
idle_0:
!$EV trig_pc_d(3,expr(@VA(.MAIN.idle_0), 16, 16)) -> intp(0, 2, 4)
	.word 0x01000000  ! 3: NOP	nop
	.word 0xe0a6c9e0  ! 4: STWA_R	stwa	%r16, [%r27 + %r0] 0x4f
	.word 0xe4ce89e0  ! 5: LDSBA_R	ldsba	[%r26, %r0] 0x4f, %r18
hwintr_0:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_0), 16, 16)) -> intp(0, 0, 4)
	.word 0x01000000  ! 6: NOP	nop
	.word 0xe8a4a000  ! 7: STWA_I	stwa	%r20, [%r18 + 0x0000] %asi
	mov	0x0, %r17
	.word 0xe2dfce80  ! 9: LDXA_R	ldxa	[%r31, %r0] 0x74, %r17
	.word 0xe2c4e000  ! 10: LDSWA_I	ldswa	[%r19, + 0x0000] %asi, %r17
	.word 0xe4de49e0  ! 11: LDXA_R	ldxa	[%r25, %r0] 0x4f, %r18
	.word 0xe0dc2000  ! 12: LDXA_I	ldxa	[%r16, + 0x0000] %asi, %r16
resume_0:
!$EV trig_pc_d(3,expr(@VA(.MAIN.resume_0), 16, 16)) -> intp(0, 3, 4)
	.word 0x01000000  ! 13: NOP	nop
idle_1:
!$EV trig_pc_d(3,expr(@VA(.MAIN.idle_1), 16, 16)) -> intp(1, 2, 4)
	.word 0x01000000  ! 14: NOP	nop
	.word 0xecbf4e40  ! 15: STDA_R	stda	%r22, [%r29 + %r0] 0x72
	.word 0xe6d42000  ! 16: LDSHA_I	ldsha	[%r16, + 0x0000] %asi, %r19
	.word 0xe6b4a000  ! 17: STHA_I	stha	%r19, [%r18 + 0x0000] %asi
hwintr_1:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_1), 16, 16)) -> intp(1, 0, 4)
	.word 0x01000000  ! 18: NOP	nop
	.word 0xe6940400  ! 19: LDUHA_R	lduha	[%r16, %r0] 0x20, %r19
	.word 0xe2af8e60  ! 20: STBA_R	stba	%r17, [%r30 + %r0] 0x73
	.word 0x87802072  ! 21: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0xec9d84a0  ! 22: LDDA_R	ldda	[%r22, %r0] 0x25, %r22
	.word 0xeeaf8e40  ! 23: STBA_R	stba	%r23, [%r30 + %r0] 0x72
	.word 0x87802072  ! 24: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0xe0c5a000  ! 25: LDSWA_I	ldswa	[%r22, + 0x0000] %asi, %r16
	.word 0xeca74e80  ! 26: STWA_R	stwa	%r22, [%r29 + %r0] 0x74
	.word 0xecc52000  ! 27: LDSWA_I	ldswa	[%r20, + 0x0000] %asi, %r22
	.word 0xead40400  ! 28: LDSHA_R	ldsha	[%r16, %r0] 0x20, %r21
	.word 0xeedd6000  ! 29: LDXA_I	ldxa	[%r21, + 0x0000] %asi, %r23
	.word 0xe8f74e80  ! 30: STXA_R	stxa	%r20, [%r29 + %r0] 0x74
	.word 0xe49cc400  ! 31: LDDA_R	ldda	[%r19, %r0] 0x20, %r18
	.word 0x87802072  ! 32: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0x87802020  ! 33: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xecd74e40  ! 34: LDSHA_R	ldsha	[%r29, %r0] 0x72, %r22
	.word 0x87802025  ! 35: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0xe6b78e40  ! 36: STHA_R	stha	%r19, [%r30 + %r0] 0x72
	.word 0x8780204f  ! 37: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xe2b56000  ! 38: STHA_I	stha	%r17, [%r21 + 0x0000] %asi
resume_1:
!$EV trig_pc_d(3,expr(@VA(.MAIN.resume_1), 16, 16)) -> intp(1, 3, 4)
	.word 0x01000000  ! 39: NOP	nop
	.word 0xec874e80  ! 40: LDUWA_R	lduwa	[%r29, %r0] 0x74, %r22
	.word 0xee9584a0  ! 41: LDUHA_R	lduha	[%r22, %r0] 0x25, %r23
	.word 0xe085a000  ! 42: LDUWA_I	lduwa	[%r22, + 0x0000] %asi, %r16
	.word 0xe0b52000  ! 43: STHA_I	stha	%r16, [%r20 + 0x0000] %asi
	.word 0xeaa74e40  ! 44: STWA_R	stwa	%r21, [%r29 + %r0] 0x72
	.word 0xead56000  ! 45: LDSHA_I	ldsha	[%r21, + 0x0000] %asi, %r21
	.word 0xeeae09e0  ! 46: STBA_R	stba	%r23, [%r24 + %r0] 0x4f
idle_2:
!$EV trig_pc_d(3,expr(@VA(.MAIN.idle_2), 16, 16)) -> intp(2, 2, 4)
	.word 0x01000000  ! 47: NOP	nop
	.word 0xe88f8e60  ! 48: LDUBA_R	lduba	[%r30, %r0] 0x73, %r20
	.word 0x87802025  ! 49: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0xe8ae89e0  ! 50: STBA_R	stba	%r20, [%r26 + %r0] 0x4f
hwintr_2:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_2), 16, 16)) -> intp(2, 0, 4)
	.word 0x01000000  ! 51: NOP	nop
	.word 0xe08584a0  ! 52: LDUWA_R	lduwa	[%r22, %r0] 0x25, %r16
	.word 0x87802073  ! 53: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0x87802074  ! 54: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0xe2bf8e40  ! 55: STDA_R	stda	%r17, [%r30 + %r0] 0x72
	.word 0xeaaca000  ! 56: STBA_I	stba	%r21, [%r18 + 0x0000] %asi
	.word 0xea9c2000  ! 57: LDDA_I	ldda	[%r16, + 0x0000] %asi, %r21
	.word 0xecce09e0  ! 58: LDSBA_R	ldsba	[%r24, %r0] 0x4f, %r22
	.word 0xe6b4a000  ! 59: STHA_I	stha	%r19, [%r18 + 0x0000] %asi
resume_2:
!$EV trig_pc_d(3,expr(@VA(.MAIN.resume_2), 16, 16)) -> intp(2, 3, 4)
	.word 0x01000000  ! 60: NOP	nop
	.word 0x87802025  ! 61: WRASI_I	wr	%r0, 0x0025, %asi
	mov	0x78, %r27
	.word 0xe0bcc400  ! 63: STDA_R	stda	%r16, [%r19 + %r0] 0x20
	.word 0xe6cc2000  ! 64: LDSBA_I	ldsba	[%r16, + 0x0000] %asi, %r19
	.word 0xe6f46000  ! 65: STXA_I	stxa	%r19, [%r17 + 0x0000] %asi
	.word 0xe2bf0e80  ! 66: STDA_R	stda	%r17, [%r28 + %r0] 0x74
	.word 0xe6b74e60  ! 67: STHA_R	stha	%r19, [%r29 + %r0] 0x73
	.word 0xec85c4a0  ! 68: LDUWA_R	lduwa	[%r23, %r0] 0x25, %r22
	.word 0x87802074  ! 69: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0xea94e000  ! 70: LDUHA_I	lduha	[%r19, + 0x0000] %asi, %r21
idle_3:
!$EV trig_pc_d(3,expr(@VA(.MAIN.idle_3), 16, 16)) -> intp(0, 2, 4)
	.word 0x01000000  ! 71: NOP	nop
	.word 0x87802020  ! 72: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0x87802020  ! 73: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe2af0e60  ! 74: STBA_R	stba	%r17, [%r28 + %r0] 0x73
hwintr_3:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3), 16, 16)) -> intp(0, 0, 4)
	.word 0x01000000  ! 75: NOP	nop
	.word 0xeeac8400  ! 76: STBA_R	stba	%r23, [%r18 + %r0] 0x20
	.word 0x87802020  ! 77: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0x8780204f  ! 78: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xecb7a000  ! 79: STHA_I	stha	%r22, [%r30 + 0x0000] %asi
	.word 0xec87e000  ! 80: LDUWA_I	lduwa	[%r31, + 0x0000] %asi, %r22
	.word 0x8780204f  ! 81: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0x87802020  ! 82: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xecc4c400  ! 83: LDSWA_R	ldswa	[%r19, %r0] 0x20, %r22
	.word 0x87802072  ! 84: WRASI_I	wr	%r0, 0x0072, %asi
	ta	T_CHANGE_PRIV	! macro
	.word 0xe4b78e60  ! 86: STHA_R	stha	%r18, [%r30 + %r0] 0x73
	.word 0x87802074  ! 87: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0x87802020  ! 88: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe4d7a000  ! 89: LDSHA_I	ldsha	[%r30, + 0x0000] %asi, %r18
	.word 0xe0d44400  ! 90: LDSHA_R	ldsha	[%r17, %r0] 0x20, %r16
resume_3:
!$EV trig_pc_d(3,expr(@VA(.MAIN.resume_3), 16, 16)) -> intp(0, 3, 4)
	.word 0x01000000  ! 91: NOP	nop
	mov	0x8, %r25
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xe4cf0e60  ! 94: LDSBA_R	ldsba	[%r28, %r0] 0x73, %r18
	.word 0x87802072  ! 95: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0xeaafce80  ! 96: STBA_R	stba	%r21, [%r31 + %r0] 0x74
	.word 0xe68c2000  ! 97: LDUBA_I	lduba	[%r16, + 0x0000] %asi, %r19
	.word 0xe2ac0400  ! 98: STBA_R	stba	%r17, [%r16 + %r0] 0x20
	.word 0xe6a46000  ! 99: STWA_I	stwa	%r19, [%r17 + 0x0000] %asi
	.word 0xe88f8e40  ! 100: LDUBA_R	lduba	[%r30, %r0] 0x72, %r20
	.word 0xe8ac8400  ! 101: STBA_R	stba	%r20, [%r18 + %r0] 0x20
	.word 0xe0ae09e0  ! 102: STBA_R	stba	%r16, [%r24 + %r0] 0x4f
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xe294e000  ! 104: LDUHA_I	lduha	[%r19, + 0x0000] %asi, %r17
	.word 0x8780204f  ! 105: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0x87802025  ! 106: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0x87802020  ! 107: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xeaad04a0  ! 108: STBA_R	stba	%r21, [%r20 + %r0] 0x25
idle_4:
!$EV trig_pc_d(3,expr(@VA(.MAIN.idle_4), 16, 16)) -> intp(1, 2, 4)
	.word 0x01000000  ! 109: NOP	nop
hwintr_4:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_4), 16, 16)) -> intp(1, 0, 4)
	.word 0x01000000  ! 110: NOP	nop
	.word 0xe095c4a0  ! 111: LDUHA_R	lduha	[%r23, %r0] 0x25, %r16
	.word 0x87802074  ! 112: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0xe6b76000  ! 113: STHA_I	stha	%r19, [%r29 + 0x0000] %asi
	.word 0xe6bfa000  ! 114: STDA_I	stda	%r19, [%r30 + 0x0000] %asi
	.word 0x87802072  ! 115: WRASI_I	wr	%r0, 0x0072, %asi
resume_4:
!$EV trig_pc_d(3,expr(@VA(.MAIN.resume_4), 16, 16)) -> intp(1, 3, 4)
	.word 0x01000000  ! 116: NOP	nop
idle_5:
!$EV trig_pc_d(3,expr(@VA(.MAIN.idle_5), 16, 16)) -> intp(2, 2, 4)
	.word 0x01000000  ! 117: NOP	nop
	.word 0xec844400  ! 118: LDUWA_R	lduwa	[%r17, %r0] 0x20, %r22
	.word 0x87802020  ! 119: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0x87802073  ! 120: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0x8780204f  ! 121: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xe0f66000  ! 122: STXA_I	stxa	%r16, [%r25 + 0x0000] %asi
	.word 0xe0be6000  ! 123: STDA_I	stda	%r16, [%r25 + 0x0000] %asi
hwintr_5:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_5), 16, 16)) -> intp(2, 0, 4)
	.word 0x01000000  ! 124: NOP	nop
	mov	0x3d0, %r21
	.word 0xe0a6a000  ! 126: STWA_I	stwa	%r16, [%r26 + 0x0000] %asi
	ta	T_CHANGE_HPRIV	! macro
	.word 0x87802020  ! 128: WRASI_I	wr	%r0, 0x0020, %asi
resume_5:
!$EV trig_pc_d(3,expr(@VA(.MAIN.resume_5), 16, 16)) -> intp(2, 3, 4)
	.word 0x01000000  ! 129: NOP	nop
	.word 0xe0af6000  ! 130: STBA_I	stba	%r16, [%r29 + 0x0000] %asi
	.word 0xe0b72000  ! 131: STHA_I	stha	%r16, [%r28 + 0x0000] %asi
	.word 0xe0b72000  ! 132: STHA_I	stha	%r16, [%r28 + 0x0000] %asi
	.word 0xeaa70e40  ! 133: STWA_R	stwa	%r21, [%r28 + %r0] 0x72
idle_6:
!$EV trig_pc_d(3,expr(@VA(.MAIN.idle_6), 16, 16)) -> intp(0, 2, 4)
	.word 0x01000000  ! 134: NOP	nop
	.word 0xe6b4c400  ! 135: STHA_R	stha	%r19, [%r19 + %r0] 0x20
	.word 0x8780204f  ! 136: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xe28c4400  ! 137: LDUBA_R	lduba	[%r17, %r0] 0x20, %r17
	.word 0xe8afa000  ! 138: STBA_I	stba	%r20, [%r30 + 0x0000] %asi
hwintr_6:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_6), 16, 16)) -> intp(0, 0, 4)
	.word 0x01000000  ! 139: NOP	nop
resume_6:
!$EV trig_pc_d(3,expr(@VA(.MAIN.resume_6), 16, 16)) -> intp(0, 3, 4)
	.word 0x01000000  ! 140: NOP	nop
	.word 0xe8cfa000  ! 141: LDSBA_I	ldsba	[%r30, + 0x0000] %asi, %r20
	.word 0xe8afe000  ! 142: STBA_I	stba	%r20, [%r31 + 0x0000] %asi
	.word 0xe8976000  ! 143: LDUHA_I	lduha	[%r29, + 0x0000] %asi, %r20
	.word 0x87802020  ! 144: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe8a7e000  ! 145: STWA_I	stwa	%r20, [%r31 + 0x0000] %asi
	.word 0xeab584a0  ! 146: STHA_R	stha	%r21, [%r22 + %r0] 0x25
	.word 0xe6afe000  ! 147: STBA_I	stba	%r19, [%r31 + 0x0000] %asi
idle_7:
!$EV trig_pc_d(3,expr(@VA(.MAIN.idle_7), 16, 16)) -> intp(1, 2, 4)
	.word 0x01000000  ! 148: NOP	nop
	.word 0xeaadc4a0  ! 149: STBA_R	stba	%r21, [%r23 + %r0] 0x25
	.word 0x87802074  ! 150: WRASI_I	wr	%r0, 0x0074, %asi
hwintr_7:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_7), 16, 16)) -> intp(1, 0, 4)
	.word 0x01000000  ! 151: NOP	nop
	.word 0x87802073  ! 152: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0x87802072  ! 153: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0x8780204f  ! 154: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0x87802020  ! 155: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0x87802074  ! 156: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0xe48ee000  ! 157: LDUBA_I	lduba	[%r27, + 0x0000] %asi, %r18
	.word 0x8780204f  ! 158: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0x87802074  ! 159: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0xeabf4e40  ! 160: STDA_R	stda	%r21, [%r29 + %r0] 0x72
	.word 0xe6aea000  ! 161: STBA_I	stba	%r19, [%r26 + 0x0000] %asi
resume_7:
!$EV trig_pc_d(3,expr(@VA(.MAIN.resume_7), 16, 16)) -> intp(1, 3, 4)
	.word 0x01000000  ! 162: NOP	nop
	.word 0xe4a74e60  ! 163: STWA_R	stwa	%r18, [%r29 + %r0] 0x73
	.word 0x8780204f  ! 164: WRASI_I	wr	%r0, 0x004f, %asi
idle_8:
!$EV trig_pc_d(3,expr(@VA(.MAIN.idle_8), 16, 16)) -> intp(2, 2, 4)
	.word 0x01000000  ! 165: NOP	nop
	.word 0xe8878e40  ! 166: LDUWA_R	lduwa	[%r30, %r0] 0x72, %r20
	.word 0xe6f7e000  ! 167: STXA_I	stxa	%r19, [%r31 + 0x0000] %asi
	.word 0x8780204f  ! 168: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xe4dc0400  ! 169: LDXA_R	ldxa	[%r16, %r0] 0x20, %r18
	.word 0xe89d6000  ! 170: LDDA_I	ldda	[%r21, + 0x0000] %asi, %r20
	.word 0xe8a5e000  ! 171: STWA_I	stwa	%r20, [%r23 + 0x0000] %asi
	.word 0xe895e000  ! 172: LDUHA_I	lduha	[%r23, + 0x0000] %asi, %r20
	.word 0xe8ada000  ! 173: STBA_I	stba	%r20, [%r22 + 0x0000] %asi
	.word 0xe8a56000  ! 174: STWA_I	stwa	%r20, [%r21 + 0x0000] %asi
	.word 0x87802025  ! 175: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0xe6ce49e0  ! 176: LDSBA_R	ldsba	[%r25, %r0] 0x4f, %r19
	.word 0x87802020  ! 177: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xee946000  ! 178: LDUHA_I	lduha	[%r17, + 0x0000] %asi, %r23
hwintr_8:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_8), 16, 16)) -> intp(2, 0, 4)
	.word 0x01000000  ! 179: NOP	nop
	.word 0xec9f4e80  ! 180: LDDA_R	ldda	[%r29, %r0] 0x74, %r22
	mov	0x7c8, %r23
	.word 0xeadf8e40  ! 182: LDXA_R	ldxa	[%r30, %r0] 0x72, %r21
	.word 0x87802020  ! 183: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0x87802020  ! 184: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xeea52000  ! 185: STWA_I	stwa	%r23, [%r20 + 0x0000] %asi
	mov	0x18, %r17
	.word 0xee956000  ! 187: LDUHA_I	lduha	[%r21, + 0x0000] %asi, %r23
	.word 0x87802072  ! 188: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0xe28fce80  ! 189: LDUBA_R	lduba	[%r31, %r0] 0x74, %r17
	.word 0xeac7a000  ! 190: LDSWA_I	ldswa	[%r30, + 0x0000] %asi, %r21
	.word 0xea848400  ! 191: LDUWA_R	lduwa	[%r18, %r0] 0x20, %r21
	.word 0xeeac4400  ! 192: STBA_R	stba	%r23, [%r17 + %r0] 0x20
	mov	0x3d0, %r20
	.word 0x87802025  ! 194: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0xe687a000  ! 195: LDUWA_I	lduwa	[%r30, + 0x0000] %asi, %r19
	.word 0xe6bfe000  ! 196: STDA_I	stda	%r19, [%r31 + 0x0000] %asi
resume_8:
!$EV trig_pc_d(3,expr(@VA(.MAIN.resume_8), 16, 16)) -> intp(2, 3, 4)
	.word 0x01000000  ! 197: NOP	nop
	.word 0xeabf0e60  ! 198: STDA_R	stda	%r21, [%r28 + %r0] 0x73
	.word 0x87802074  ! 199: WRASI_I	wr	%r0, 0x0074, %asi
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_2:
	mov	0x3c0, %r22
	.word 0x01000000  ! 3: NOP	nop
	.word 0xeea649e0  ! 4: STWA_R	stwa	%r23, [%r25 + %r0] 0x4f
	.word 0xeacf8e40  ! 5: LDSBA_R	ldsba	[%r30, %r0] 0x72, %r21
	.word 0x01000000  ! 6: NOP	nop
	.word 0xe8a42000  ! 7: STWA_I	stwa	%r20, [%r16 + 0x0000] %asi
	mov	0x78, %r16
	.word 0xe6df4e80  ! 9: LDXA_R	ldxa	[%r29, %r0] 0x74, %r19
	.word 0xe2c46000  ! 10: LDSWA_I	ldswa	[%r17, + 0x0000] %asi, %r17
	.word 0xeaddc4a0  ! 11: LDXA_R	ldxa	[%r23, %r0] 0x25, %r21
	.word 0xe0dc6000  ! 12: LDXA_I	ldxa	[%r17, + 0x0000] %asi, %r16
	.word 0x01000000  ! 13: NOP	nop
	.word 0x01000000  ! 14: NOP	nop
	.word 0xe8bc8400  ! 15: STDA_R	stda	%r20, [%r18 + %r0] 0x20
	.word 0xe6d4e000  ! 16: LDSHA_I	ldsha	[%r19, + 0x0000] %asi, %r19
	.word 0xe6b4e000  ! 17: STHA_I	stha	%r19, [%r19 + 0x0000] %asi
	.word 0x01000000  ! 18: NOP	nop
	.word 0xe6944400  ! 19: LDUHA_R	lduha	[%r17, %r0] 0x20, %r19
	.word 0xe8aec9e0  ! 20: STBA_R	stba	%r20, [%r27 + %r0] 0x4f
	.word 0x87802074  ! 21: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0xec9c4400  ! 22: LDDA_R	ldda	[%r17, %r0] 0x20, %r22
	.word 0xeaae09e0  ! 23: STBA_R	stba	%r21, [%r24 + %r0] 0x4f
	.word 0x87802020  ! 24: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe0c5a000  ! 25: LDSWA_I	ldswa	[%r22, + 0x0000] %asi, %r16
	.word 0xe8a44400  ! 26: STWA_R	stwa	%r20, [%r17 + %r0] 0x20
	.word 0xecc56000  ! 27: LDSWA_I	ldswa	[%r21, + 0x0000] %asi, %r22
	.word 0xe0d7ce80  ! 28: LDSHA_R	ldsha	[%r31, %r0] 0x74, %r16
	.word 0xeedd2000  ! 29: LDXA_I	ldxa	[%r20, + 0x0000] %asi, %r23
	.word 0xe8f40400  ! 30: STXA_R	stxa	%r20, [%r16 + %r0] 0x20
	.word 0xee9e49e0  ! 31: LDDA_R	ldda	[%r25, %r0] 0x4f, %r23
	.word 0x87802025  ! 32: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0x87802020  ! 33: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe0d649e0  ! 34: LDSHA_R	ldsha	[%r25, %r0] 0x4f, %r16
	.word 0x87802073  ! 35: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0xeab4c400  ! 36: STHA_R	stha	%r21, [%r19 + %r0] 0x20
	.word 0x8780204f  ! 37: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xe2b56000  ! 38: STHA_I	stha	%r17, [%r21 + 0x0000] %asi
	.word 0x01000000  ! 39: NOP	nop
	.word 0xe2874e40  ! 40: LDUWA_R	lduwa	[%r29, %r0] 0x72, %r17
	.word 0xe0978e80  ! 41: LDUHA_R	lduha	[%r30, %r0] 0x74, %r16
	.word 0xe0856000  ! 42: LDUWA_I	lduwa	[%r21, + 0x0000] %asi, %r16
	.word 0xe0b52000  ! 43: STHA_I	stha	%r16, [%r20 + 0x0000] %asi
	.word 0xeca48400  ! 44: STWA_R	stwa	%r22, [%r18 + %r0] 0x20
	.word 0xead5e000  ! 45: LDSHA_I	ldsha	[%r23, + 0x0000] %asi, %r21
	.word 0xeeae49e0  ! 46: STBA_R	stba	%r23, [%r25 + %r0] 0x4f
	.word 0x01000000  ! 47: NOP	nop
	.word 0xe48f8e80  ! 48: LDUBA_R	lduba	[%r30, %r0] 0x74, %r18
	.word 0x87802073  ! 49: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0xe6afce80  ! 50: STBA_R	stba	%r19, [%r31 + %r0] 0x74
	.word 0x01000000  ! 51: NOP	nop
	.word 0xe08689e0  ! 52: LDUWA_R	lduwa	[%r26, %r0] 0x4f, %r16
	.word 0x87802072  ! 53: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0x87802072  ! 54: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0xe6bfce60  ! 55: STDA_R	stda	%r19, [%r31 + %r0] 0x73
	.word 0xeaac6000  ! 56: STBA_I	stba	%r21, [%r17 + 0x0000] %asi
	.word 0xea9c6000  ! 57: LDDA_I	ldda	[%r17, + 0x0000] %asi, %r21
	.word 0xe6cd84a0  ! 58: LDSBA_R	ldsba	[%r22, %r0] 0x25, %r19
	.word 0xe6b4e000  ! 59: STHA_I	stha	%r19, [%r19 + 0x0000] %asi
	.word 0x01000000  ! 60: NOP	nop
	.word 0x87802020  ! 61: WRASI_I	wr	%r0, 0x0020, %asi
	mov	0x20, %r27
	.word 0xeebf0e80  ! 63: STDA_R	stda	%r23, [%r28 + %r0] 0x74
	.word 0xe6cca000  ! 64: LDSBA_I	ldsba	[%r18, + 0x0000] %asi, %r19
	.word 0xe6f4a000  ! 65: STXA_I	stxa	%r19, [%r18 + 0x0000] %asi
	.word 0xe0bc8400  ! 66: STDA_R	stda	%r16, [%r18 + %r0] 0x20
	.word 0xe2b74e40  ! 67: STHA_R	stha	%r17, [%r29 + %r0] 0x72
	.word 0xe686c9e0  ! 68: LDUWA_R	lduwa	[%r27, %r0] 0x4f, %r19
	.word 0x87802025  ! 69: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0xea94a000  ! 70: LDUHA_I	lduha	[%r18, + 0x0000] %asi, %r21
	.word 0x01000000  ! 71: NOP	nop
	.word 0x87802020  ! 72: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0x87802072  ! 73: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0xe8af0e60  ! 74: STBA_R	stba	%r20, [%r28 + %r0] 0x73
	.word 0x01000000  ! 75: NOP	nop
	.word 0xecaf8e80  ! 76: STBA_R	stba	%r22, [%r30 + %r0] 0x74
	.word 0x87802074  ! 77: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0x87802074  ! 78: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0xecb76000  ! 79: STHA_I	stha	%r22, [%r29 + 0x0000] %asi
	.word 0xec87e000  ! 80: LDUWA_I	lduwa	[%r31, + 0x0000] %asi, %r22
	.word 0x87802025  ! 81: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0x87802020  ! 82: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xeec7ce80  ! 83: LDSWA_R	ldswa	[%r31, %r0] 0x74, %r23
	.word 0x8780204f  ! 84: WRASI_I	wr	%r0, 0x004f, %asi
	ta	T_CHANGE_PRIV	! macro
	.word 0xeeb70e40  ! 86: STHA_R	stha	%r23, [%r28 + %r0] 0x72
	.word 0x87802072  ! 87: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0x87802072  ! 88: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0xe4d7a000  ! 89: LDSHA_I	ldsha	[%r30, + 0x0000] %asi, %r18
	.word 0xe6d5c4a0  ! 90: LDSHA_R	ldsha	[%r23, %r0] 0x25, %r19
	.word 0x01000000  ! 91: NOP	nop
	mov	0x20, %r26
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xe4cf0e40  ! 94: LDSBA_R	ldsba	[%r28, %r0] 0x72, %r18
	.word 0x87802072  ! 95: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0xe0af4e80  ! 96: STBA_R	stba	%r16, [%r29 + %r0] 0x74
	.word 0xe68c2000  ! 97: LDUBA_I	lduba	[%r16, + 0x0000] %asi, %r19
	.word 0xeaaf8e80  ! 98: STBA_R	stba	%r21, [%r30 + %r0] 0x74
	.word 0xe6a4e000  ! 99: STWA_I	stwa	%r19, [%r19 + 0x0000] %asi
	.word 0xe88f4e80  ! 100: LDUBA_R	lduba	[%r29, %r0] 0x74, %r20
	.word 0xeaac4400  ! 101: STBA_R	stba	%r21, [%r17 + %r0] 0x20
	.word 0xecac8400  ! 102: STBA_R	stba	%r22, [%r18 + %r0] 0x20
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xe2946000  ! 104: LDUHA_I	lduha	[%r17, + 0x0000] %asi, %r17
	.word 0x87802072  ! 105: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0x87802073  ! 106: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0x87802020  ! 107: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe2ae09e0  ! 108: STBA_R	stba	%r17, [%r24 + %r0] 0x4f
	.word 0x01000000  ! 109: NOP	nop
	.word 0x01000000  ! 110: NOP	nop
	.word 0xee978e60  ! 111: LDUHA_R	lduha	[%r30, %r0] 0x73, %r23
	.word 0x87802025  ! 112: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0xe6b7e000  ! 113: STHA_I	stha	%r19, [%r31 + 0x0000] %asi
	.word 0xe6bf2000  ! 114: STDA_I	stda	%r19, [%r28 + 0x0000] %asi
	.word 0x87802025  ! 115: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0x01000000  ! 116: NOP	nop
	.word 0x01000000  ! 117: NOP	nop
	.word 0xea878e60  ! 118: LDUWA_R	lduwa	[%r30, %r0] 0x73, %r21
	.word 0x87802072  ! 119: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0x8780204f  ! 120: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0x87802020  ! 121: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe0f62000  ! 122: STXA_I	stxa	%r16, [%r24 + 0x0000] %asi
	.word 0xe0bea000  ! 123: STDA_I	stda	%r16, [%r26 + 0x0000] %asi
	.word 0x01000000  ! 124: NOP	nop
	mov	0x3e8, %r20
	.word 0xe0a6a000  ! 126: STWA_I	stwa	%r16, [%r26 + 0x0000] %asi
	ta	T_CHANGE_HPRIV	! macro
	.word 0x87802020  ! 128: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0x01000000  ! 129: NOP	nop
	.word 0xe0af6000  ! 130: STBA_I	stba	%r16, [%r29 + 0x0000] %asi
	.word 0xe0b76000  ! 131: STHA_I	stha	%r16, [%r29 + 0x0000] %asi
	.word 0xe0b7e000  ! 132: STHA_I	stha	%r16, [%r31 + 0x0000] %asi
	.word 0xe0a7ce40  ! 133: STWA_R	stwa	%r16, [%r31 + %r0] 0x72
	.word 0x01000000  ! 134: NOP	nop
	.word 0xeeb48400  ! 135: STHA_R	stha	%r23, [%r18 + %r0] 0x20
	.word 0x8780204f  ! 136: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xe08f0e40  ! 137: LDUBA_R	lduba	[%r28, %r0] 0x72, %r16
	.word 0xe8afa000  ! 138: STBA_I	stba	%r20, [%r30 + 0x0000] %asi
	.word 0x01000000  ! 139: NOP	nop
	.word 0x01000000  ! 140: NOP	nop
	.word 0xe8cfa000  ! 141: LDSBA_I	ldsba	[%r30, + 0x0000] %asi, %r20
	.word 0xe8af6000  ! 142: STBA_I	stba	%r20, [%r29 + 0x0000] %asi
	.word 0xe8972000  ! 143: LDUHA_I	lduha	[%r28, + 0x0000] %asi, %r20
	.word 0x87802072  ! 144: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0xe8a76000  ! 145: STWA_I	stwa	%r20, [%r29 + 0x0000] %asi
	.word 0xeeb7ce40  ! 146: STHA_R	stha	%r23, [%r31 + %r0] 0x72
	.word 0xe6af6000  ! 147: STBA_I	stba	%r19, [%r29 + 0x0000] %asi
	.word 0x01000000  ! 148: NOP	nop
	.word 0xe0ac0400  ! 149: STBA_R	stba	%r16, [%r16 + %r0] 0x20
	.word 0x87802074  ! 150: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0x01000000  ! 151: NOP	nop
	.word 0x87802025  ! 152: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0x87802073  ! 153: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0x87802020  ! 154: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0x87802025  ! 155: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0x87802020  ! 156: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe48ee000  ! 157: LDUBA_I	lduba	[%r27, + 0x0000] %asi, %r18
	.word 0x87802074  ! 158: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0x87802025  ! 159: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0xe4bfce60  ! 160: STDA_R	stda	%r18, [%r31 + %r0] 0x73
	.word 0xe6ae6000  ! 161: STBA_I	stba	%r19, [%r25 + 0x0000] %asi
	.word 0x01000000  ! 162: NOP	nop
	.word 0xeea649e0  ! 163: STWA_R	stwa	%r23, [%r25 + %r0] 0x4f
	.word 0x87802020  ! 164: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0x01000000  ! 165: NOP	nop
	.word 0xe2840400  ! 166: LDUWA_R	lduwa	[%r16, %r0] 0x20, %r17
	.word 0xe6f7a000  ! 167: STXA_I	stxa	%r19, [%r30 + 0x0000] %asi
	.word 0x87802025  ! 168: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0xecdfce60  ! 169: LDXA_R	ldxa	[%r31, %r0] 0x73, %r22
	.word 0xe89de000  ! 170: LDDA_I	ldda	[%r23, + 0x0000] %asi, %r20
	.word 0xe8a5e000  ! 171: STWA_I	stwa	%r20, [%r23 + 0x0000] %asi
	.word 0xe8952000  ! 172: LDUHA_I	lduha	[%r20, + 0x0000] %asi, %r20
	.word 0xe8ad6000  ! 173: STBA_I	stba	%r20, [%r21 + 0x0000] %asi
	.word 0xe8a56000  ! 174: STWA_I	stwa	%r20, [%r21 + 0x0000] %asi
	.word 0x87802072  ! 175: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0xeccfce40  ! 176: LDSBA_R	ldsba	[%r31, %r0] 0x72, %r22
	.word 0x87802025  ! 177: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0xee946000  ! 178: LDUHA_I	lduha	[%r17, + 0x0000] %asi, %r23
	.word 0x01000000  ! 179: NOP	nop
	.word 0xea9ec9e0  ! 180: LDDA_R	ldda	[%r27, %r0] 0x4f, %r21
	mov	0x3c8, %r22
	.word 0xe8dcc400  ! 182: LDXA_R	ldxa	[%r19, %r0] 0x20, %r20
	.word 0x8780204f  ! 183: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0x87802020  ! 184: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xeea5a000  ! 185: STWA_I	stwa	%r23, [%r22 + 0x0000] %asi
	mov	0x78, %r17
	.word 0xee95a000  ! 187: LDUHA_I	lduha	[%r22, + 0x0000] %asi, %r23
	.word 0x8780204f  ! 188: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xec8cc400  ! 189: LDUBA_R	lduba	[%r19, %r0] 0x20, %r22
	.word 0xeac76000  ! 190: LDSWA_I	ldswa	[%r29, + 0x0000] %asi, %r21
	.word 0xee8649e0  ! 191: LDUWA_R	lduwa	[%r25, %r0] 0x4f, %r23
	.word 0xe6af4e40  ! 192: STBA_R	stba	%r19, [%r29 + %r0] 0x72
	mov	0x3f0, %r20
	.word 0x87802073  ! 194: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0xe6872000  ! 195: LDUWA_I	lduwa	[%r28, + 0x0000] %asi, %r19
	.word 0xe6bfe000  ! 196: STDA_I	stda	%r19, [%r31 + 0x0000] %asi
	.word 0x01000000  ! 197: NOP	nop
	.word 0xecbec9e0  ! 198: STDA_R	stda	%r22, [%r27 + %r0] 0x4f
	.word 0x87802074  ! 199: WRASI_I	wr	%r0, 0x0074, %asi
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_1:
	mov	0x3d8, %r23
	.word 0x01000000  ! 3: NOP	nop
	.word 0xe2a4c400  ! 4: STWA_R	stwa	%r17, [%r19 + %r0] 0x20
	.word 0xeccc8400  ! 5: LDSBA_R	ldsba	[%r18, %r0] 0x20, %r22
	.word 0x01000000  ! 6: NOP	nop
	.word 0xe8a4e000  ! 7: STWA_I	stwa	%r20, [%r19 + 0x0000] %asi
	mov	0x60, %r17
	.word 0xe2de89e0  ! 9: LDXA_R	ldxa	[%r26, %r0] 0x4f, %r17
	.word 0xe2c4e000  ! 10: LDSWA_I	ldswa	[%r19, + 0x0000] %asi, %r17
	.word 0xeedd44a0  ! 11: LDXA_R	ldxa	[%r21, %r0] 0x25, %r23
	.word 0xe0dc2000  ! 12: LDXA_I	ldxa	[%r16, + 0x0000] %asi, %r16
	.word 0x01000000  ! 13: NOP	nop
	.word 0x01000000  ! 14: NOP	nop
	.word 0xe8bcc400  ! 15: STDA_R	stda	%r20, [%r19 + %r0] 0x20
	.word 0xe6d42000  ! 16: LDSHA_I	ldsha	[%r16, + 0x0000] %asi, %r19
	.word 0xe6b4a000  ! 17: STHA_I	stha	%r19, [%r18 + 0x0000] %asi
	.word 0x01000000  ! 18: NOP	nop
	.word 0xea940400  ! 19: LDUHA_R	lduha	[%r16, %r0] 0x20, %r21
	.word 0xe8af8e80  ! 20: STBA_R	stba	%r20, [%r30 + %r0] 0x74
	.word 0x87802020  ! 21: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xee9fce60  ! 22: LDDA_R	ldda	[%r31, %r0] 0x73, %r23
	.word 0xe4ae89e0  ! 23: STBA_R	stba	%r18, [%r26 + %r0] 0x4f
	.word 0x87802020  ! 24: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe0c56000  ! 25: LDSWA_I	ldswa	[%r21, + 0x0000] %asi, %r16
	.word 0xe6a5c4a0  ! 26: STWA_R	stwa	%r19, [%r23 + %r0] 0x25
	.word 0xecc5a000  ! 27: LDSWA_I	ldswa	[%r22, + 0x0000] %asi, %r22
	.word 0xe8d689e0  ! 28: LDSHA_R	ldsha	[%r26, %r0] 0x4f, %r20
	.word 0xeedda000  ! 29: LDXA_I	ldxa	[%r22, + 0x0000] %asi, %r23
	.word 0xe6f5c4a0  ! 30: STXA_R	stxa	%r19, [%r23 + %r0] 0x25
	.word 0xe89e89e0  ! 31: LDDA_R	ldda	[%r26, %r0] 0x4f, %r20
	.word 0x87802025  ! 32: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0x87802073  ! 33: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0xe8d5c4a0  ! 34: LDSHA_R	ldsha	[%r23, %r0] 0x25, %r20
	.word 0x87802072  ! 35: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0xe6b70e40  ! 36: STHA_R	stha	%r19, [%r28 + %r0] 0x72
	.word 0x87802020  ! 37: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe2b5a000  ! 38: STHA_I	stha	%r17, [%r22 + 0x0000] %asi
	.word 0x01000000  ! 39: NOP	nop
	.word 0xe68609e0  ! 40: LDUWA_R	lduwa	[%r24, %r0] 0x4f, %r19
	.word 0xec9609e0  ! 41: LDUHA_R	lduha	[%r24, %r0] 0x4f, %r22
	.word 0xe0852000  ! 42: LDUWA_I	lduwa	[%r20, + 0x0000] %asi, %r16
	.word 0xe0b52000  ! 43: STHA_I	stha	%r16, [%r20 + 0x0000] %asi
	.word 0xe4a609e0  ! 44: STWA_R	stwa	%r18, [%r24 + %r0] 0x4f
	.word 0xead5a000  ! 45: LDSHA_I	ldsha	[%r22, + 0x0000] %asi, %r21
	.word 0xe2ae09e0  ! 46: STBA_R	stba	%r17, [%r24 + %r0] 0x4f
	.word 0x01000000  ! 47: NOP	nop
	.word 0xe08f0e40  ! 48: LDUBA_R	lduba	[%r28, %r0] 0x72, %r16
	.word 0x87802020  ! 49: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe2af8e60  ! 50: STBA_R	stba	%r17, [%r30 + %r0] 0x73
	.word 0x01000000  ! 51: NOP	nop
	.word 0xe28504a0  ! 52: LDUWA_R	lduwa	[%r20, %r0] 0x25, %r17
	.word 0x87802020  ! 53: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0x87802074  ! 54: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0xeabf8e40  ! 55: STDA_R	stda	%r21, [%r30 + %r0] 0x72
	.word 0xeaac6000  ! 56: STBA_I	stba	%r21, [%r17 + 0x0000] %asi
	.word 0xea9c6000  ! 57: LDDA_I	ldda	[%r17, + 0x0000] %asi, %r21
	.word 0xeecfce40  ! 58: LDSBA_R	ldsba	[%r31, %r0] 0x72, %r23
	.word 0xe6b4e000  ! 59: STHA_I	stha	%r19, [%r19 + 0x0000] %asi
	.word 0x01000000  ! 60: NOP	nop
	.word 0x87802025  ! 61: WRASI_I	wr	%r0, 0x0025, %asi
	mov	0x20, %r27
	.word 0xeebfce80  ! 63: STDA_R	stda	%r23, [%r31 + %r0] 0x74
	.word 0xe6cca000  ! 64: LDSBA_I	ldsba	[%r18, + 0x0000] %asi, %r19
	.word 0xe6f4a000  ! 65: STXA_I	stxa	%r19, [%r18 + 0x0000] %asi
	.word 0xe4bfce80  ! 66: STDA_R	stda	%r18, [%r31 + %r0] 0x74
	.word 0xecb4c400  ! 67: STHA_R	stha	%r22, [%r19 + %r0] 0x20
	.word 0xe28649e0  ! 68: LDUWA_R	lduwa	[%r25, %r0] 0x4f, %r17
	.word 0x87802072  ! 69: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0xea94e000  ! 70: LDUHA_I	lduha	[%r19, + 0x0000] %asi, %r21
	.word 0x01000000  ! 71: NOP	nop
	.word 0x87802073  ! 72: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0x87802072  ! 73: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0xeeaf4e60  ! 74: STBA_R	stba	%r23, [%r29 + %r0] 0x73
	.word 0x01000000  ! 75: NOP	nop
	.word 0xe4afce60  ! 76: STBA_R	stba	%r18, [%r31 + %r0] 0x73
	.word 0x87802073  ! 77: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0x87802074  ! 78: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0xecb76000  ! 79: STHA_I	stha	%r22, [%r29 + 0x0000] %asi
	.word 0xec876000  ! 80: LDUWA_I	lduwa	[%r29, + 0x0000] %asi, %r22
	.word 0x87802025  ! 81: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0x87802025  ! 82: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0xeec5c4a0  ! 83: LDSWA_R	ldswa	[%r23, %r0] 0x25, %r23
	.word 0x87802073  ! 84: WRASI_I	wr	%r0, 0x0073, %asi
	ta	T_CHANGE_PRIV	! macro
	.word 0xe6b504a0  ! 86: STHA_R	stha	%r19, [%r20 + %r0] 0x25
	.word 0x87802025  ! 87: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0x87802073  ! 88: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0xe4d7e000  ! 89: LDSHA_I	ldsha	[%r31, + 0x0000] %asi, %r18
	.word 0xe4d7ce60  ! 90: LDSHA_R	ldsha	[%r31, %r0] 0x73, %r18
	.word 0x01000000  ! 91: NOP	nop
	mov	0x38, %r26
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xe4cf4e80  ! 94: LDSBA_R	ldsba	[%r29, %r0] 0x74, %r18
	.word 0x87802074  ! 95: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0xecafce40  ! 96: STBA_R	stba	%r22, [%r31 + %r0] 0x72
	.word 0xe68c6000  ! 97: LDUBA_I	lduba	[%r17, + 0x0000] %asi, %r19
	.word 0xeaac0400  ! 98: STBA_R	stba	%r21, [%r16 + %r0] 0x20
	.word 0xe6a42000  ! 99: STWA_I	stwa	%r19, [%r16 + 0x0000] %asi
	.word 0xe68cc400  ! 100: LDUBA_R	lduba	[%r19, %r0] 0x20, %r19
	.word 0xeeacc400  ! 101: STBA_R	stba	%r23, [%r19 + %r0] 0x20
	.word 0xecac0400  ! 102: STBA_R	stba	%r22, [%r16 + %r0] 0x20
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xe294a000  ! 104: LDUHA_I	lduha	[%r18, + 0x0000] %asi, %r17
	.word 0x87802074  ! 105: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0x87802074  ! 106: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0x8780204f  ! 107: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xe8acc400  ! 108: STBA_R	stba	%r20, [%r19 + %r0] 0x20
	.word 0x01000000  ! 109: NOP	nop
	.word 0x01000000  ! 110: NOP	nop
	.word 0xe4974e60  ! 111: LDUHA_R	lduha	[%r29, %r0] 0x73, %r18
	.word 0x87802020  ! 112: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe6b72000  ! 113: STHA_I	stha	%r19, [%r28 + 0x0000] %asi
	.word 0xe6bfa000  ! 114: STDA_I	stda	%r19, [%r30 + 0x0000] %asi
	.word 0x87802020  ! 115: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0x01000000  ! 116: NOP	nop
	.word 0x01000000  ! 117: NOP	nop
	.word 0xea8504a0  ! 118: LDUWA_R	lduwa	[%r20, %r0] 0x25, %r21
	.word 0x87802020  ! 119: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0x87802074  ! 120: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0x87802020  ! 121: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe0f6a000  ! 122: STXA_I	stxa	%r16, [%r26 + 0x0000] %asi
	.word 0xe0bea000  ! 123: STDA_I	stda	%r16, [%r26 + 0x0000] %asi
	.word 0x01000000  ! 124: NOP	nop
	mov	0x7c8, %r22
	.word 0xe0a6e000  ! 126: STWA_I	stwa	%r16, [%r27 + 0x0000] %asi
	ta	T_CHANGE_HPRIV	! macro
	.word 0x87802074  ! 128: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0x01000000  ! 129: NOP	nop
	.word 0xe0af6000  ! 130: STBA_I	stba	%r16, [%r29 + 0x0000] %asi
	.word 0xe0b72000  ! 131: STHA_I	stha	%r16, [%r28 + 0x0000] %asi
	.word 0xe0b72000  ! 132: STHA_I	stha	%r16, [%r28 + 0x0000] %asi
	.word 0xeaa544a0  ! 133: STWA_R	stwa	%r21, [%r21 + %r0] 0x25
	.word 0x01000000  ! 134: NOP	nop
	.word 0xecb544a0  ! 135: STHA_R	stha	%r22, [%r21 + %r0] 0x25
	.word 0x87802073  ! 136: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0xe08d84a0  ! 137: LDUBA_R	lduba	[%r22, %r0] 0x25, %r16
	.word 0xe8afa000  ! 138: STBA_I	stba	%r20, [%r30 + 0x0000] %asi
	.word 0x01000000  ! 139: NOP	nop
	.word 0x01000000  ! 140: NOP	nop
	.word 0xe8cfe000  ! 141: LDSBA_I	ldsba	[%r31, + 0x0000] %asi, %r20
	.word 0xe8afe000  ! 142: STBA_I	stba	%r20, [%r31 + 0x0000] %asi
	.word 0xe897a000  ! 143: LDUHA_I	lduha	[%r30, + 0x0000] %asi, %r20
	.word 0x87802025  ! 144: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0xe8a72000  ! 145: STWA_I	stwa	%r20, [%r28 + 0x0000] %asi
	.word 0xeab689e0  ! 146: STHA_R	stha	%r21, [%r26 + %r0] 0x4f
	.word 0xe6af2000  ! 147: STBA_I	stba	%r19, [%r28 + 0x0000] %asi
	.word 0x01000000  ! 148: NOP	nop
	.word 0xe4ac8400  ! 149: STBA_R	stba	%r18, [%r18 + %r0] 0x20
	.word 0x87802025  ! 150: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0x01000000  ! 151: NOP	nop
	.word 0x87802020  ! 152: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0x8780204f  ! 153: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0x87802074  ! 154: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0x8780204f  ! 155: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0x87802073  ! 156: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0xe48ee000  ! 157: LDUBA_I	lduba	[%r27, + 0x0000] %asi, %r18
	.word 0x87802020  ! 158: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0x87802020  ! 159: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe0bf4e40  ! 160: STDA_R	stda	%r16, [%r29 + %r0] 0x72
	.word 0xe6ae6000  ! 161: STBA_I	stba	%r19, [%r25 + 0x0000] %asi
	.word 0x01000000  ! 162: NOP	nop
	.word 0xe8a609e0  ! 163: STWA_R	stwa	%r20, [%r24 + %r0] 0x4f
	.word 0x87802073  ! 164: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0x01000000  ! 165: NOP	nop
	.word 0xe8878e80  ! 166: LDUWA_R	lduwa	[%r30, %r0] 0x74, %r20
	.word 0xe6f7a000  ! 167: STXA_I	stxa	%r19, [%r30 + 0x0000] %asi
	.word 0x87802073  ! 168: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0xe8dfce40  ! 169: LDXA_R	ldxa	[%r31, %r0] 0x72, %r20
	.word 0xe89d2000  ! 170: LDDA_I	ldda	[%r20, + 0x0000] %asi, %r20
	.word 0xe8a5a000  ! 171: STWA_I	stwa	%r20, [%r22 + 0x0000] %asi
	.word 0xe895a000  ! 172: LDUHA_I	lduha	[%r22, + 0x0000] %asi, %r20
	.word 0xe8ada000  ! 173: STBA_I	stba	%r20, [%r22 + 0x0000] %asi
	.word 0xe8a56000  ! 174: STWA_I	stwa	%r20, [%r21 + 0x0000] %asi
	.word 0x87802020  ! 175: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe0cf0e60  ! 176: LDSBA_R	ldsba	[%r28, %r0] 0x73, %r16
	.word 0x8780204f  ! 177: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xee94e000  ! 178: LDUHA_I	lduha	[%r19, + 0x0000] %asi, %r23
	.word 0x01000000  ! 179: NOP	nop
	.word 0xe29cc400  ! 180: LDDA_R	ldda	[%r19, %r0] 0x20, %r17
	mov	0x7f8, %r23
	.word 0xe0dd84a0  ! 182: LDXA_R	ldxa	[%r22, %r0] 0x25, %r16
	.word 0x87802025  ! 183: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0x87802020  ! 184: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xeea52000  ! 185: STWA_I	stwa	%r23, [%r20 + 0x0000] %asi
	mov	0x40, %r17
	.word 0xee95e000  ! 187: LDUHA_I	lduha	[%r23, + 0x0000] %asi, %r23
	.word 0x87802074  ! 188: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0xea8f0e60  ! 189: LDUBA_R	lduba	[%r28, %r0] 0x73, %r21
	.word 0xeac72000  ! 190: LDSWA_I	ldswa	[%r28, + 0x0000] %asi, %r21
	.word 0xe2874e40  ! 191: LDUWA_R	lduwa	[%r29, %r0] 0x72, %r17
	.word 0xe0af8e80  ! 192: STBA_R	stba	%r16, [%r30 + %r0] 0x74
	mov	0x3c8, %r23
	.word 0x87802072  ! 194: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0xe687e000  ! 195: LDUWA_I	lduwa	[%r31, + 0x0000] %asi, %r19
	.word 0xe6bfe000  ! 196: STDA_I	stda	%r19, [%r31 + 0x0000] %asi
	.word 0x01000000  ! 197: NOP	nop
	.word 0xeabe09e0  ! 198: STDA_R	stda	%r21, [%r24 + %r0] 0x4f
	.word 0x87802073  ! 199: WRASI_I	wr	%r0, 0x0073, %asi

join_lbl_0_0:
!		$EV trig_pc_d(1,expr(@VA(.RED_EXT_SEC.HRedmode_Reset_Handler) + 4, 16, 16)) -> intp(1, 1, 1)
!		$EV trig_pc_d(1,expr(@VA(.RED_EXT_SEC.HRedmode_Reset_Handler) + 8, 16, 16)) -> intp(2, 1, 1)
!		$EV trig_pc_d(1,expr(@VA(.RED_EXT_SEC.HRedmode_Reset_Handler) + 12, 16, 16)) -> intp(3, 1, 1)
	.data
data_start:

	.xword	0xdbee1795f349ba14
	.xword	0x4e802ef5abf782ba
	.xword	0x370c0a5da25b64c9
	.xword	0xe5d4b2920a5e2142
	.xword	0xde4f77e325be5194
	.xword	0x4f36b87794d56c0b
	.xword	0xca8551ead09210a8
	.xword	0x1d07312960a9d6b0
	.xword	0xe72e43dba137a76f
	.xword	0x96991f94bc937fe5
	.xword	0xedafce26652f84a3
	.xword	0x61065ae0227f3ecc
	.xword	0x989f59e3cc766949
	.xword	0x73f88ac85b33e456
	.xword	0xa0dec13b939ab9bc
	.xword	0xb138d1b63cf8ef77



.text
	ta	T_GOOD_TRAP

.data
	.xword 0x1234567887654321

#if 0
!!# /* File:	tlu_sus_res_21.j
!!#  * Description:
!!#  * This temple is targets the suspend_resume coverage object, by interseting
!!#  * idle, HW , and resume interrupt events in between the asi access,
!!#  * actually thread3 behaves as main thread controlling idle/resume of other (0...2)
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
!!#   int intr_tid = 0;
!!#   intr_type intr_ev = IDLE_INTR;
!!# 
!!#   my_imm_asi_to_rvar (int line, int rv_ro, field_type_t fld, void *data);
!!# 
!!# %%section init
!!# 
!!#   static int asi_rvar_array[6] = {Rv_20, Rv_25, Rv_4f, Rv_72_73_74, Rv_72_73_74, Rv_72_73_74};
!!# 
!!#   IJ_bind_thread_group(th_M, 0x8);
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
!!#     IJ_printf (th_M, "!$EV trig_pc_d(%y,expr(@VA(.MAIN.resume_%d), 16, 16)) -> intp(%d, 3, %d)\n", resume_cnt, intr_tid, Rv_intr_vect);
!!#     resume_cnt++;
!!#     intr_ev = IDLE_INTR;
!!#     //intr_tid = (intr_tid == 3) ? 0: intr_tid++;
!!#     if (intr_tid < 2) intr_tid++; else intr_tid = 0;
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
!!# 	    IJ_printf (th_M, "!$EV trig_pc_d(%y,expr(@VA(.MAIN.idle_%d), 16, 16)) -> intp(%d, 2, %d)\n", idle_cnt, intr_tid, Rv_intr_vect);
!!#             idle_cnt++;
!!# 	    intr_ev = HW_INTR;
!!#           } else if (intr_ev == HW_INTR) {
!!#             IJ_printf (th_M, "hwintr_%d:\n", resume_cnt);
!!# 	    IJ_printf (th_M, "!$EV trig_pc_d(%y,expr(@VA(.MAIN.hwintr_%d), 16, 16)) -> intp(%d, 0, %d)\n", hwintr_cnt, intr_tid, Rv_intr_vect);
!!#             hwintr_cnt++;
!!# 	    intr_ev = RESUME_INTR;
!!#           } else {
!!#             IJ_printf (th_M, "resume_%d:\n", resume_cnt);
!!# 	    IJ_printf (th_M, "!$EV trig_pc_d(%y,expr(@VA(.MAIN.resume_%d), 16, 16)) -> intp(%d, 3, %d)\n", resume_cnt, intr_tid, Rv_intr_vect);
!!#             resume_cnt++;
!!# 	    intr_ev = IDLE_INTR;
!!#             if (intr_tid < 2) intr_tid++; else intr_tid = 0;
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
