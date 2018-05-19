// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: tlu_asi_access_mt_1_rand_s1.s
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
   random seed:	288635253
   Jal tlu_asi_access_mt_1.j:	
********************************************************************************/



#define PCONTEXT	0x10
#define SCONTEXT	0x10

#define MAIN_PAGE_NUCLEUS_ALSO
#define MAIN_PAGE_HV_ALSO

#define ALL_MY_INTR_HANDLERS
#include "my_intr_handlers.s"
#include "my_trap_handlers.s"
#include "tlu_custom_trap_handlers.s"

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

	setx 0x844f585612f89b99, %g1, %g0
	setx 0x2a8ba7ec01d5f538, %g1, %g1
	setx 0xdf24f761af7e6c82, %g1, %g2
	setx 0xb7a1ef12a386a385, %g1, %g3
	setx 0x15fcff242a85aa08, %g1, %g4
	setx 0x41de5e8a4f9bb22c, %g1, %g5
	setx 0x3089ecc2cc742969, %g1, %g6
	setx 0x8b5411b7d4de1390, %g1, %g7
	setx 0xcd2eae37941efb3d, %g1, %r16
	setx 0x2bac9a9396c73062, %g1, %r17
	setx 0x3d89db613901cc05, %g1, %r18
	setx 0x7c2cfce19e67d6f0, %g1, %r19
	setx 0x349966a152c2beb1, %g1, %r20
	setx 0x379c432f879809f9, %g1, %r21
	setx 0x17c99f12de647e32, %g1, %r22
	setx 0xe3f18d7700b6b75c, %g1, %r23
	setx 0xa8baf5fdb6186fb7, %g1, %r24
	setx 0x043f5825867eddbe, %g1, %r25
	setx 0xb3fdc9bbefb38b66, %g1, %r26
	setx 0x721e19800436ce61, %g1, %r27
	setx 0x9065ccf4b29ac059, %g1, %r28
	setx 0xc1fe4861b3cd3d0f, %g1, %r29
	setx 0x2e452edf5de6043d, %g1, %r30
	setx 0x39312e8c69fdfc50, %g1, %r31
	save
	setx 0x0e36169c3af89c6e, %g1, %r16
	setx 0x0e103ef235674cc1, %g1, %r17
	setx 0xfbf41e6726bd9f01, %g1, %r18
	setx 0xe459ad241ddabe60, %g1, %r19
	setx 0x41c811501d89e67d, %g1, %r20
	setx 0xca68eb9ebbc23a21, %g1, %r21
	setx 0x795b18312cf4256e, %g1, %r22
	setx 0x77a6532c2de5b8c2, %g1, %r23
	setx 0xf44a79443e301f68, %g1, %r24
	setx 0x0cda53a500bb7444, %g1, %r25
	setx 0xa85ba0513b80c62c, %g1, %r26
	setx 0x4f9670f84510180d, %g1, %r27
	setx 0x85162b2e28e81361, %g1, %r28
	setx 0x444aa57645507b0d, %g1, %r29
	setx 0x0fa3e1d6bd20dd10, %g1, %r30
	setx 0xf0128a1c7bb9d6b4, %g1, %r31
	save
	setx 0xb2351c0c319151d1, %g1, %r16
	setx 0x55cd31bdf81fccff, %g1, %r17
	setx 0xc8c7e83350d7890a, %g1, %r18
	setx 0x56a721c66ad63096, %g1, %r19
	setx 0x9c4cf3120bae6ebe, %g1, %r20
	setx 0x43bb6900d00906e4, %g1, %r21
	setx 0x8830c81bd87f55ad, %g1, %r22
	setx 0xd67b76ddedc6fbae, %g1, %r23
	setx 0x901f3a4eddb99a08, %g1, %r24
	setx 0x50a0706ea8f29f7b, %g1, %r25
	setx 0xe133207153983d87, %g1, %r26
	setx 0x7b747deeec8faaaf, %g1, %r27
	setx 0x135b764e6cb0cc73, %g1, %r28
	setx 0x2a7c92c4ad98d5c0, %g1, %r29
	setx 0x426f5ae074a60484, %g1, %r30
	setx 0x47e504464417aa56, %g1, %r31
	restore
	mov	0x20, %r16
	mov	0x10, %r17
	mov	0x50, %r18
	mov	0x70, %r19
	mov	0x3c8, %r20
	mov	0x7d0, %r21
	mov	0x3d8, %r22
	mov	0x3e8, %r23
	mov	0x50, %r24
	mov	0x38, %r25
	mov	0x58, %r26
	mov	0x28, %r27
	mov	0, %r28
	mov	0, %r29
	mov	0, %r30
	mov	0, %r31
	ta	%icc, T_CHANGE_HPRIV
	wr	%g0, 0x73, %asi
	stxa	%g0, [%g0] 0x42
	mov	0x38, %g1
	stxa	%g0, [%g1] 0x58
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
	.word 0xe8cf6000  ! 1: LDSBA_I	ldsba	[%r29, + 0x0000] %asi, %r20
	.word 0xe8976000  ! 2: LDUHA_I	lduha	[%r29, + 0x0000] %asi, %r20
	.word 0x87802072  ! 3: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0x87802020  ! 4: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0x87802073  ! 5: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0xe8df6000  ! 6: LDXA_I	ldxa	[%r29, + 0x0000] %asi, %r20
	.word 0xe6df0e80  ! 7: LDXA_R	ldxa	[%r28, %r0] 0x74, %r19
	.word 0x87802073  ! 8: WRASI_I	wr	%r0, 0x0073, %asi
	mov	0x7f8, %r21
	mov	0x38, %r16
	.word 0xe4a5c4a0  ! 11: STWA_R	stwa	%r18, [%r23 + %r0] 0x25
	.word 0xeaf689e0  ! 12: STXA_R	stxa	%r21, [%r26 + %r0] 0x4f
	.word 0xea9f2000  ! 13: LDDA_I	ldda	[%r28, + 0x0000] %asi, %r21
	.word 0x87802025  ! 14: WRASI_I	wr	%r0, 0x0025, %asi
	mov	0x70, %r19
	mov	0x28, %r24
	.word 0x87802020  ! 17: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xea8ce000  ! 18: LDUBA_I	lduba	[%r19, + 0x0000] %asi, %r21
	mov	0x3d0, %r22
	mov	0x3d0, %r23
	mov	0x60, %r26
	mov	0x3e0, %r22
	.word 0xeab7ce60  ! 23: STHA_R	stha	%r21, [%r31 + %r0] 0x73
	.word 0xea846000  ! 24: LDUWA_I	lduwa	[%r17, + 0x0000] %asi, %r21
	.word 0xeaf4a000  ! 25: STXA_I	stxa	%r21, [%r18 + 0x0000] %asi
	.word 0x87802074  ! 26: WRASI_I	wr	%r0, 0x0074, %asi
	mov	0x40, %r19
	.word 0xecf40400  ! 28: STXA_R	stxa	%r22, [%r16 + %r0] 0x20
	.word 0xec9fe000  ! 29: LDDA_I	ldda	[%r31, + 0x0000] %asi, %r22
	.word 0xec9fe000  ! 30: LDDA_I	ldda	[%r31, + 0x0000] %asi, %r22
	.word 0xecb76000  ! 31: STHA_I	stha	%r22, [%r29 + 0x0000] %asi
	.word 0xe8d7ce60  ! 32: LDSHA_R	ldsha	[%r31, %r0] 0x73, %r20
	.word 0x87802072  ! 33: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0xeaa44400  ! 34: STWA_R	stwa	%r21, [%r17 + %r0] 0x20
	.word 0xea97e000  ! 35: LDUHA_I	lduha	[%r31, + 0x0000] %asi, %r21
	.word 0xea876000  ! 36: LDUWA_I	lduwa	[%r29, + 0x0000] %asi, %r21
	.word 0x87802020  ! 37: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xeadc6000  ! 38: LDXA_I	ldxa	[%r17, + 0x0000] %asi, %r21
	mov	0x7e0, %r20
	.word 0xe4cf0e40  ! 40: LDSBA_R	ldsba	[%r28, %r0] 0x72, %r18
	.word 0xe2b78e60  ! 41: STHA_R	stha	%r17, [%r30 + %r0] 0x73
	mov	0x28, %r27
	.word 0xe2948400  ! 43: LDUHA_R	lduha	[%r18, %r0] 0x20, %r17
	.word 0xe29ca000  ! 44: LDDA_I	ldda	[%r18, + 0x0000] %asi, %r17
	.word 0xe4be49e0  ! 45: STDA_R	stda	%r18, [%r25 + %r0] 0x4f
	.word 0xe69e09e0  ! 46: LDDA_R	ldda	[%r24, %r0] 0x4f, %r19
	.word 0xea8d44a0  ! 47: LDUBA_R	lduba	[%r21, %r0] 0x25, %r21
	mov	0x60, %r16
	.word 0xeac42000  ! 49: LDSWA_I	ldswa	[%r16, + 0x0000] %asi, %r21
	.word 0xeabc2000  ! 50: STDA_I	stda	%r21, [%r16 + 0x0000] %asi
	.word 0xecbf8e60  ! 51: STDA_R	stda	%r22, [%r30 + %r0] 0x73
	.word 0xe88609e0  ! 52: LDUWA_R	lduwa	[%r24, %r0] 0x4f, %r20
	mov	0x20, %r17
	.word 0xe8b4e000  ! 54: STHA_I	stha	%r20, [%r19 + 0x0000] %asi
	mov	0x50, %r26
	.word 0xe8d42000  ! 56: LDSHA_I	ldsha	[%r16, + 0x0000] %asi, %r20
	.word 0xeedfce80  ! 57: LDXA_R	ldxa	[%r31, %r0] 0x74, %r23
	.word 0xeedca000  ! 58: LDXA_I	ldxa	[%r18, + 0x0000] %asi, %r23
	.word 0xee942000  ! 59: LDUHA_I	lduha	[%r16, + 0x0000] %asi, %r23
	.word 0xe4cf0e80  ! 60: LDSBA_R	ldsba	[%r28, %r0] 0x74, %r18
	.word 0xe8c44400  ! 61: LDSWA_R	ldswa	[%r17, %r0] 0x20, %r20
	.word 0x87802073  ! 62: WRASI_I	wr	%r0, 0x0073, %asi
	mov	0x18, %r26
	.word 0x8780204f  ! 64: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xe89e2000  ! 65: LDDA_I	ldda	[%r24, + 0x0000] %asi, %r20
	mov	0x18, %r18
	.word 0xe8bcc400  ! 67: STDA_R	stda	%r20, [%r19 + %r0] 0x20
	.word 0x8780204f  ! 68: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xe8962000  ! 69: LDUHA_I	lduha	[%r24, + 0x0000] %asi, %r20
	mov	0x3c8, %r22
	.word 0x87802074  ! 71: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0xe8cf6000  ! 72: LDSBA_I	ldsba	[%r29, + 0x0000] %asi, %r20
	.word 0x87802072  ! 73: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0xe4dc4400  ! 74: LDXA_R	ldxa	[%r17, %r0] 0x20, %r18
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xe2d40400  ! 76: LDSHA_R	ldsha	[%r16, %r0] 0x20, %r17
	.word 0xe2bf6000  ! 77: STDA_I	stda	%r17, [%r29 + 0x0000] %asi
	.word 0xecc7ce40  ! 78: LDSWA_R	ldswa	[%r31, %r0] 0x72, %r22
	.word 0xeccfa000  ! 79: LDSBA_I	ldsba	[%r30, + 0x0000] %asi, %r22
	.word 0xea8d04a0  ! 80: LDUBA_R	lduba	[%r20, %r0] 0x25, %r21
	.word 0xe2ad04a0  ! 81: STBA_R	stba	%r17, [%r20 + %r0] 0x25
	.word 0xe4b5c4a0  ! 82: STHA_R	stha	%r18, [%r23 + %r0] 0x25
	.word 0x8780204f  ! 83: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xe4be2000  ! 84: STDA_I	stda	%r18, [%r24 + 0x0000] %asi
	.word 0x87802020  ! 85: WRASI_I	wr	%r0, 0x0020, %asi
	mov	0x40, %r25
	.word 0xe6874e80  ! 87: LDUWA_R	lduwa	[%r29, %r0] 0x74, %r19
	ta	T_CHANGE_HPRIV	! macro
	.word 0xe6dc2000  ! 89: LDXA_I	ldxa	[%r16, + 0x0000] %asi, %r19
	mov	0x8, %r17
	mov	0x58, %r18
	.word 0xe0df0e60  ! 92: LDXA_R	ldxa	[%r28, %r0] 0x73, %r16
	.word 0x87802074  ! 93: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0x87802020  ! 94: WRASI_I	wr	%r0, 0x0020, %asi
	mov	0x18, %r24
	mov	0x7e0, %r22
	.word 0xe084a000  ! 97: LDUWA_I	lduwa	[%r18, + 0x0000] %asi, %r16
	.word 0xe08ca000  ! 98: LDUBA_I	lduba	[%r18, + 0x0000] %asi, %r16
	.word 0xe0d42000  ! 99: LDSHA_I	ldsha	[%r16, + 0x0000] %asi, %r16
	.word 0xe0bce000  ! 100: STDA_I	stda	%r16, [%r19 + 0x0000] %asi
	.word 0xe0a42000  ! 101: STWA_I	stwa	%r16, [%r16 + 0x0000] %asi
	.word 0x87802020  ! 102: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0x87802025  ! 103: WRASI_I	wr	%r0, 0x0025, %asi
	mov	0x30, %r16
	.word 0xe68d04a0  ! 105: LDUBA_R	lduba	[%r20, %r0] 0x25, %r19
	.word 0xeecf0e80  ! 106: LDSBA_R	ldsba	[%r28, %r0] 0x74, %r23
	mov	0x28, %r26
	.word 0xe4bc4400  ! 108: STDA_R	stda	%r18, [%r17 + %r0] 0x20
	ta	T_CHANGE_PRIV	! macro
	.word 0xe8df8e80  ! 110: LDXA_R	ldxa	[%r30, %r0] 0x74, %r20
	.word 0x87802020  ! 111: WRASI_I	wr	%r0, 0x0020, %asi
	mov	0x68, %r18
	.word 0xe8cc0400  ! 113: LDSBA_R	ldsba	[%r16, %r0] 0x20, %r20
	.word 0xeac74e60  ! 114: LDSWA_R	ldswa	[%r29, %r0] 0x73, %r21
	.word 0xea8c6000  ! 115: LDUBA_I	lduba	[%r17, + 0x0000] %asi, %r21
	.word 0xe88504a0  ! 116: LDUWA_R	lduwa	[%r20, %r0] 0x25, %r20
	.word 0xe88ca000  ! 117: LDUBA_I	lduba	[%r18, + 0x0000] %asi, %r20
	.word 0xe8f46000  ! 118: STXA_I	stxa	%r20, [%r17 + 0x0000] %asi
	.word 0x87802025  ! 119: WRASI_I	wr	%r0, 0x0025, %asi
	mov	0x48, %r25
	.word 0xeabf0e40  ! 121: STDA_R	stda	%r21, [%r28 + %r0] 0x72
	mov	0x60, %r25
	.word 0xeaade000  ! 123: STBA_I	stba	%r21, [%r23 + 0x0000] %asi
	.word 0x8780204f  ! 124: WRASI_I	wr	%r0, 0x004f, %asi
	mov	0x68, %r19
	.word 0xea9e6000  ! 126: LDDA_I	ldda	[%r25, + 0x0000] %asi, %r21
	.word 0x87802020  ! 127: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0x87802073  ! 128: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0x87802073  ! 129: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0x87802074  ! 130: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0x87802074  ! 131: WRASI_I	wr	%r0, 0x0074, %asi
	mov	0x58, %r26
	.word 0xea9fa000  ! 133: LDDA_I	ldda	[%r30, + 0x0000] %asi, %r21
	.word 0xea9fa000  ! 134: LDDA_I	ldda	[%r30, + 0x0000] %asi, %r21
	.word 0x87802020  ! 135: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe6f40400  ! 136: STXA_R	stxa	%r19, [%r16 + %r0] 0x20
	.word 0xeca7ce80  ! 137: STWA_R	stwa	%r22, [%r31 + %r0] 0x74
	.word 0xe4cf0e60  ! 138: LDSBA_R	ldsba	[%r28, %r0] 0x73, %r18
	.word 0xecbe89e0  ! 139: STDA_R	stda	%r22, [%r26 + %r0] 0x4f
	.word 0xec9ca000  ! 140: LDDA_I	ldda	[%r18, + 0x0000] %asi, %r22
	.word 0x87802025  ! 141: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0xec9da000  ! 142: LDDA_I	ldda	[%r22, + 0x0000] %asi, %r22
	mov	0x7e0, %r22
	.word 0x8780204f  ! 144: WRASI_I	wr	%r0, 0x004f, %asi
	mov	0x48, %r17
	mov	0x68, %r26
	.word 0x87802072  ! 147: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0xecb7e000  ! 148: STHA_I	stha	%r22, [%r31 + 0x0000] %asi
	.word 0xecb7a000  ! 149: STHA_I	stha	%r22, [%r30 + 0x0000] %asi
	.word 0xecc76000  ! 150: LDSWA_I	ldswa	[%r29, + 0x0000] %asi, %r22
	mov	0x40, %r19
	.word 0xe4a689e0  ! 152: STWA_R	stwa	%r18, [%r26 + %r0] 0x4f
	.word 0xe4872000  ! 153: LDUWA_I	lduwa	[%r28, + 0x0000] %asi, %r18
	mov	0x8, %r25
	.word 0xeacfce60  ! 155: LDSBA_R	ldsba	[%r31, %r0] 0x73, %r21
	.word 0xea87a000  ! 156: LDUWA_I	lduwa	[%r30, + 0x0000] %asi, %r21
	.word 0xeac72000  ! 157: LDSWA_I	ldswa	[%r28, + 0x0000] %asi, %r21
	mov	0x3d0, %r22
	.word 0xeea4c400  ! 159: STWA_R	stwa	%r23, [%r19 + %r0] 0x20
	.word 0x87802020  ! 160: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xeeaca000  ! 161: STBA_I	stba	%r23, [%r18 + 0x0000] %asi
	.word 0x87802020  ! 162: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe6f689e0  ! 163: STXA_R	stxa	%r19, [%r26 + %r0] 0x4f
	.word 0x87802073  ! 164: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0xe4ae09e0  ! 165: STBA_R	stba	%r18, [%r24 + %r0] 0x4f
	.word 0xe4bf6000  ! 166: STDA_I	stda	%r18, [%r29 + 0x0000] %asi
	.word 0xe48f6000  ! 167: LDUBA_I	lduba	[%r29, + 0x0000] %asi, %r18
	mov	0x7f0, %r20
	.word 0xe89649e0  ! 169: LDUHA_R	lduha	[%r25, %r0] 0x4f, %r20
	mov	0x30, %r26
	.word 0xe8c76000  ! 171: LDSWA_I	ldswa	[%r29, + 0x0000] %asi, %r20
	ta	T_CHANGE_NONPRIV	! macro
	mov	0x7e0, %r20
	mov	0x7f8, %r20
	.word 0xe8976000  ! 175: LDUHA_I	lduha	[%r29, + 0x0000] %asi, %r20
	.word 0x87802073  ! 176: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0x87802020  ! 177: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe8dc2000  ! 178: LDXA_I	ldxa	[%r16, + 0x0000] %asi, %r20
	.word 0xe4b70e40  ! 179: STHA_R	stha	%r18, [%r28 + %r0] 0x72
	.word 0xeabf0e80  ! 180: STDA_R	stda	%r21, [%r28 + %r0] 0x74
	mov	0x7d8, %r23
	mov	0x48, %r19
	.word 0x87802073  ! 183: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0xeabf6000  ! 184: STDA_I	stda	%r21, [%r29 + 0x0000] %asi
	.word 0x87802074  ! 185: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0x87802020  ! 186: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xea8c6000  ! 187: LDUBA_I	lduba	[%r17, + 0x0000] %asi, %r21
	.word 0x8780204f  ! 188: WRASI_I	wr	%r0, 0x004f, %asi
	mov	0x70, %r17
	.word 0xe49d44a0  ! 190: LDDA_R	ldda	[%r21, %r0] 0x25, %r18
	.word 0xe4b48400  ! 191: STHA_R	stha	%r18, [%r18 + %r0] 0x20
	.word 0xe4b66000  ! 192: STHA_I	stha	%r18, [%r25 + 0x0000] %asi
	.word 0xe0b609e0  ! 193: STHA_R	stha	%r16, [%r24 + %r0] 0x4f
	mov	0x50, %r17
	mov	0x3c0, %r21
	mov	0x7c0, %r20
	mov	0x48, %r24
	.word 0xe0b62000  ! 198: STHA_I	stha	%r16, [%r24 + 0x0000] %asi
	.word 0xe09e6000  ! 199: LDDA_I	ldda	[%r25, + 0x0000] %asi, %r16
	.word 0xe0f6e000  ! 200: STXA_I	stxa	%r16, [%r27 + 0x0000] %asi
	.word 0xe0de2000  ! 201: LDXA_I	ldxa	[%r24, + 0x0000] %asi, %r16
	mov	0x3f8, %r22
	.word 0x87802073  ! 203: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0xe0bfa000  ! 204: STDA_I	stda	%r16, [%r30 + 0x0000] %asi
	.word 0xe0af2000  ! 205: STBA_I	stba	%r16, [%r28 + 0x0000] %asi
	mov	0x3e8, %r20
	.word 0xecdd84a0  ! 207: LDXA_R	ldxa	[%r22, %r0] 0x25, %r22
	.word 0xee8dc4a0  ! 208: LDUBA_R	lduba	[%r23, %r0] 0x25, %r23
	.word 0xee9f2000  ! 209: LDDA_I	ldda	[%r28, + 0x0000] %asi, %r23
	.word 0xe8bc8400  ! 210: STDA_R	stda	%r20, [%r18 + %r0] 0x20
	.word 0xe88f2000  ! 211: LDUBA_I	lduba	[%r28, + 0x0000] %asi, %r20
	.word 0xe8afe000  ! 212: STBA_I	stba	%r20, [%r31 + 0x0000] %asi
	.word 0xe8d7e000  ! 213: LDSHA_I	ldsha	[%r31, + 0x0000] %asi, %r20
	.word 0xeaacc400  ! 214: STBA_R	stba	%r21, [%r19 + %r0] 0x20
	.word 0xeab44400  ! 215: STHA_R	stha	%r21, [%r17 + %r0] 0x20
	.word 0x87802020  ! 216: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe2ac0400  ! 217: STBA_R	stba	%r17, [%r16 + %r0] 0x20
	mov	0x10, %r27
	.word 0xe2aca000  ! 219: STBA_I	stba	%r17, [%r18 + 0x0000] %asi
	.word 0x8780204f  ! 220: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xe2b6a000  ! 221: STHA_I	stha	%r17, [%r26 + 0x0000] %asi
	mov	0x18, %r26
	mov	0x0, %r26
	mov	0x7c8, %r20
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xe2a66000  ! 226: STWA_I	stwa	%r17, [%r25 + 0x0000] %asi
	mov	0x3f8, %r21
	.word 0x87802073  ! 228: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0xe28cc400  ! 229: LDUBA_R	lduba	[%r19, %r0] 0x20, %r17
	.word 0x87802073  ! 230: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0xe2afe000  ! 231: STBA_I	stba	%r17, [%r31 + 0x0000] %asi
	.word 0xe8a74e80  ! 232: STWA_R	stwa	%r20, [%r29 + %r0] 0x74
	.word 0x87802073  ! 233: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0xe8afa000  ! 234: STBA_I	stba	%r20, [%r30 + 0x0000] %asi
	mov	0x28, %r25
	.word 0xe08689e0  ! 236: LDUWA_R	lduwa	[%r26, %r0] 0x4f, %r16
	.word 0xecf48400  ! 237: STXA_R	stxa	%r22, [%r18 + %r0] 0x20
	.word 0xe2b4c400  ! 238: STHA_R	stha	%r17, [%r19 + %r0] 0x20
	.word 0x87802074  ! 239: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0xe2d76000  ! 240: LDSHA_I	ldsha	[%r29, + 0x0000] %asi, %r17
	.word 0xe2d7ce60  ! 241: LDSHA_R	ldsha	[%r31, %r0] 0x73, %r17
	.word 0xec9d04a0  ! 242: LDDA_R	ldda	[%r20, %r0] 0x25, %r22
	.word 0xeca7a000  ! 243: STWA_I	stwa	%r22, [%r30 + 0x0000] %asi
	.word 0xe8c7ce80  ! 244: LDSWA_R	ldswa	[%r31, %r0] 0x74, %r20
	mov	0x60, %r26
	mov	0x38, %r27
	.word 0xeca74e40  ! 247: STWA_R	stwa	%r22, [%r29 + %r0] 0x72
	.word 0xe887ce40  ! 248: LDUWA_R	lduwa	[%r31, %r0] 0x72, %r20
	.word 0xe695c4a0  ! 249: LDUHA_R	lduha	[%r23, %r0] 0x25, %r19
	.word 0x87802073  ! 250: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0xeabf4e80  ! 251: STDA_R	stda	%r21, [%r29 + %r0] 0x74
	.word 0xeabf6000  ! 252: STDA_I	stda	%r21, [%r29 + 0x0000] %asi
	mov	0x30, %r16
	mov	0x3d8, %r23
	mov	0x50, %r19
	.word 0xe2978e80  ! 256: LDUHA_R	lduha	[%r30, %r0] 0x74, %r17
	.word 0xe8a48400  ! 257: STWA_R	stwa	%r20, [%r18 + %r0] 0x20
	.word 0xe8df6000  ! 258: LDXA_I	ldxa	[%r29, + 0x0000] %asi, %r20
	.word 0xe4b40400  ! 259: STHA_R	stha	%r18, [%r16 + %r0] 0x20
	.word 0xea8e09e0  ! 260: LDUBA_R	lduba	[%r24, %r0] 0x4f, %r21
	mov	0x30, %r19
	.word 0xeab7a000  ! 262: STHA_I	stha	%r21, [%r30 + 0x0000] %asi
	.word 0xe2f7ce80  ! 263: STXA_R	stxa	%r17, [%r31 + %r0] 0x74
	.word 0xe2b72000  ! 264: STHA_I	stha	%r17, [%r28 + 0x0000] %asi
	.word 0xe2f7e000  ! 265: STXA_I	stxa	%r17, [%r31 + 0x0000] %asi
	.word 0xe2d76000  ! 266: LDSHA_I	ldsha	[%r29, + 0x0000] %asi, %r17
	.word 0xe2bfa000  ! 267: STDA_I	stda	%r17, [%r30 + 0x0000] %asi
	mov	0x3e0, %r21
	.word 0xe2bf6000  ! 269: STDA_I	stda	%r17, [%r29 + 0x0000] %asi
	.word 0xe2b72000  ! 270: STHA_I	stha	%r17, [%r28 + 0x0000] %asi
	.word 0x87802074  ! 271: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0xe287a000  ! 272: LDUWA_I	lduwa	[%r30, + 0x0000] %asi, %r17
	.word 0x87802072  ! 273: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0x87802025  ! 274: WRASI_I	wr	%r0, 0x0025, %asi
	mov	0x7e0, %r21
	.word 0xe2f70e40  ! 276: STXA_R	stxa	%r17, [%r28 + %r0] 0x72
	.word 0xe29cc400  ! 277: LDDA_R	ldda	[%r19, %r0] 0x20, %r17
	.word 0xe2d5a000  ! 278: LDSHA_I	ldsha	[%r22, + 0x0000] %asi, %r17
	.word 0xeaa70e60  ! 279: STWA_R	stwa	%r21, [%r28 + %r0] 0x73
	mov	0x70, %r26
	.word 0xeaf56000  ! 281: STXA_I	stxa	%r21, [%r21 + 0x0000] %asi
	.word 0xeabd2000  ! 282: STDA_I	stda	%r21, [%r20 + 0x0000] %asi
	mov	0x3f8, %r22
	.word 0xe8dcc400  ! 284: LDXA_R	ldxa	[%r19, %r0] 0x20, %r20
	mov	0x40, %r19
	.word 0xe8f56000  ! 286: STXA_I	stxa	%r20, [%r21 + 0x0000] %asi
	.word 0xe8a5a000  ! 287: STWA_I	stwa	%r20, [%r22 + 0x0000] %asi
	.word 0xe0874e60  ! 288: LDUWA_R	lduwa	[%r29, %r0] 0x73, %r16
	.word 0xe0ade000  ! 289: STBA_I	stba	%r16, [%r23 + 0x0000] %asi
	.word 0x87802074  ! 290: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0xe8ae09e0  ! 291: STBA_R	stba	%r20, [%r24 + %r0] 0x4f
	mov	0x38, %r18
	.word 0xe8dfa000  ! 293: LDXA_I	ldxa	[%r30, + 0x0000] %asi, %r20
	mov	0x40, %r25
	.word 0xe6870e40  ! 295: LDUWA_R	lduwa	[%r28, %r0] 0x72, %r19
	.word 0xeed78e60  ! 296: LDSHA_R	ldsha	[%r30, %r0] 0x73, %r23
	.word 0xeedf2000  ! 297: LDXA_I	ldxa	[%r28, + 0x0000] %asi, %r23
	.word 0xe6b70e80  ! 298: STHA_R	stha	%r19, [%r28 + %r0] 0x74
	.word 0xe49f0e60  ! 299: LDDA_R	ldda	[%r28, %r0] 0x73, %r18
	.word 0xecd6c9e0  ! 300: LDSHA_R	ldsha	[%r27, %r0] 0x4f, %r22
	.word 0x8780204f  ! 301: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xec96a000  ! 302: LDUHA_I	lduha	[%r26, + 0x0000] %asi, %r22
	.word 0xecae6000  ! 303: STBA_I	stba	%r22, [%r25 + 0x0000] %asi
	.word 0xecb62000  ! 304: STHA_I	stha	%r22, [%r24 + 0x0000] %asi
	mov	0x50, %r18
	mov	0x7c8, %r20
	.word 0xec8e6000  ! 307: LDUBA_I	lduba	[%r25, + 0x0000] %asi, %r22
	mov	0x20, %r25
	.word 0xecdee000  ! 309: LDXA_I	ldxa	[%r27, + 0x0000] %asi, %r22
	.word 0xecc6a000  ! 310: LDSWA_I	ldswa	[%r26, + 0x0000] %asi, %r22
	mov	0x0, %r24
	.word 0xeea48400  ! 312: STWA_R	stwa	%r23, [%r18 + %r0] 0x20
	.word 0xe6974e80  ! 313: LDUHA_R	lduha	[%r29, %r0] 0x74, %r19
	.word 0xe6a66000  ! 314: STWA_I	stwa	%r19, [%r25 + 0x0000] %asi
	.word 0x87802072  ! 315: WRASI_I	wr	%r0, 0x0072, %asi
	mov	0x28, %r24
	.word 0xec874e60  ! 317: LDUWA_R	lduwa	[%r29, %r0] 0x73, %r22
	mov	0x0, %r19
	mov	0x30, %r25
	.word 0xecbf2000  ! 320: STDA_I	stda	%r22, [%r28 + 0x0000] %asi
	mov	0x8, %r18
	.word 0xec8f8e80  ! 322: LDUBA_R	lduba	[%r30, %r0] 0x74, %r22
	.word 0xe0de89e0  ! 323: LDXA_R	ldxa	[%r26, %r0] 0x4f, %r16
	.word 0xe4a504a0  ! 324: STWA_R	stwa	%r18, [%r20 + %r0] 0x25
	mov	0x0, %r19
	.word 0xe2b44400  ! 326: STHA_R	stha	%r17, [%r17 + %r0] 0x20
	.word 0xe2dfe000  ! 327: LDXA_I	ldxa	[%r31, + 0x0000] %asi, %r17
	mov	0x28, %r18
	mov	0x0, %r18
	.word 0xea8c0400  ! 330: LDUBA_R	lduba	[%r16, %r0] 0x20, %r21
	mov	0x78, %r19
	mov	0x78, %r25
	ta	T_CHANGE_NONHPRIV	! macro
	mov	0x7c0, %r22
	.word 0xeaa7e000  ! 335: STWA_I	stwa	%r21, [%r31 + 0x0000] %asi
	.word 0x87802072  ! 336: WRASI_I	wr	%r0, 0x0072, %asi
	mov	0x40, %r19
	.word 0xe2afce40  ! 338: STBA_R	stba	%r17, [%r31 + %r0] 0x72
	mov	0x70, %r17
	.word 0xe685c4a0  ! 340: LDUWA_R	lduwa	[%r23, %r0] 0x25, %r19
	.word 0xe69f6000  ! 341: LDDA_I	ldda	[%r29, + 0x0000] %asi, %r19
	.word 0xeccc8400  ! 342: LDSBA_R	ldsba	[%r18, %r0] 0x20, %r22
	.word 0xe2b7ce40  ! 343: STHA_R	stha	%r17, [%r31 + %r0] 0x72
	.word 0xe2870e60  ! 344: LDUWA_R	lduwa	[%r28, %r0] 0x73, %r17
	.word 0x87802072  ! 345: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0xec844400  ! 346: LDUWA_R	lduwa	[%r17, %r0] 0x20, %r22
	.word 0xecb72000  ! 347: STHA_I	stha	%r22, [%r28 + 0x0000] %asi
	.word 0xecc7e000  ! 348: LDSWA_I	ldswa	[%r31, + 0x0000] %asi, %r22
	.word 0xeef48400  ! 349: STXA_R	stxa	%r23, [%r18 + %r0] 0x20
	mov	0x30, %r16
	.word 0xe8b74e60  ! 351: STHA_R	stha	%r20, [%r29 + %r0] 0x73
	.word 0xe4a7ce40  ! 352: STWA_R	stwa	%r18, [%r31 + %r0] 0x72
	mov	0x20, %r26
	.word 0xe4a7e000  ! 354: STWA_I	stwa	%r18, [%r31 + 0x0000] %asi
	.word 0xe0d74e40  ! 355: LDSHA_R	ldsha	[%r29, %r0] 0x72, %r16
	mov	0x3d0, %r21
	.word 0xe29fce80  ! 357: LDDA_R	ldda	[%r31, %r0] 0x74, %r17
	.word 0xeab7ce80  ! 358: STHA_R	stha	%r21, [%r31 + %r0] 0x74
	.word 0xeabf6000  ! 359: STDA_I	stda	%r21, [%r29 + 0x0000] %asi
	mov	0x7f8, %r23
	.word 0xeaa72000  ! 361: STWA_I	stwa	%r21, [%r28 + 0x0000] %asi
	.word 0x87802073  ! 362: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0x87802072  ! 363: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0xe0a6c9e0  ! 364: STWA_R	stwa	%r16, [%r27 + %r0] 0x4f
	.word 0xea9c8400  ! 365: LDDA_R	ldda	[%r18, %r0] 0x20, %r21
	mov	0x7d8, %r22
	.word 0xeab7e000  ! 367: STHA_I	stha	%r21, [%r31 + 0x0000] %asi
	mov	0x7c0, %r22
	.word 0xea97a000  ! 369: LDUHA_I	lduha	[%r30, + 0x0000] %asi, %r21
	.word 0xe2c504a0  ! 370: LDSWA_R	ldswa	[%r20, %r0] 0x25, %r17
	.word 0xe8b74e80  ! 371: STHA_R	stha	%r20, [%r29 + %r0] 0x74
	.word 0xe88f6000  ! 372: LDUBA_I	lduba	[%r29, + 0x0000] %asi, %r20
	mov	0x7f0, %r21
	.word 0xe8876000  ! 374: LDUWA_I	lduwa	[%r29, + 0x0000] %asi, %r20
	.word 0xe89504a0  ! 375: LDUHA_R	lduha	[%r20, %r0] 0x25, %r20
	.word 0x87802073  ! 376: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0xe4af8e80  ! 377: STBA_R	stba	%r18, [%r30 + %r0] 0x74
	mov	0x28, %r27
	.word 0xe2b48400  ! 379: STHA_R	stha	%r17, [%r18 + %r0] 0x20
	.word 0xe2af6000  ! 380: STBA_I	stba	%r17, [%r29 + 0x0000] %asi
	.word 0xe4ae09e0  ! 381: STBA_R	stba	%r18, [%r24 + %r0] 0x4f
	.word 0xe4872000  ! 382: LDUWA_I	lduwa	[%r28, + 0x0000] %asi, %r18
	.word 0xe4f504a0  ! 383: STXA_R	stxa	%r18, [%r20 + %r0] 0x25
	.word 0xe8bf8e80  ! 384: STDA_R	stda	%r20, [%r30 + %r0] 0x74
	.word 0xe8cfa000  ! 385: LDSBA_I	ldsba	[%r30, + 0x0000] %asi, %r20
	.word 0xeadfce60  ! 386: LDXA_R	ldxa	[%r31, %r0] 0x73, %r21
	mov	0x3e0, %r22
	.word 0x87802020  ! 388: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xea9c6000  ! 389: LDDA_I	ldda	[%r17, + 0x0000] %asi, %r21
	mov	0x20, %r17
	.word 0xeabca000  ! 391: STDA_I	stda	%r21, [%r18 + 0x0000] %asi
	.word 0xeaa46000  ! 392: STWA_I	stwa	%r21, [%r17 + 0x0000] %asi
	.word 0x87802020  ! 393: WRASI_I	wr	%r0, 0x0020, %asi
	mov	0x18, %r27
	.word 0x87802074  ! 395: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0xe4df4e60  ! 396: LDXA_R	ldxa	[%r29, %r0] 0x73, %r18
	.word 0xe4f72000  ! 397: STXA_I	stxa	%r18, [%r28 + 0x0000] %asi
	.word 0x87802074  ! 398: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0xe8c6c9e0  ! 399: LDSWA_R	ldswa	[%r27, %r0] 0x4f, %r20
	mov	0x48, %r19
	mov	0x48, %r27
	.word 0xe8b584a0  ! 402: STHA_R	stha	%r20, [%r22 + %r0] 0x25
	.word 0xe88fa000  ! 403: LDUBA_I	lduba	[%r30, + 0x0000] %asi, %r20
	mov	0x7f0, %r23
	.word 0xe2f74e40  ! 405: STXA_R	stxa	%r17, [%r29 + %r0] 0x72
	.word 0x87802073  ! 406: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0xe2c7e000  ! 407: LDSWA_I	ldswa	[%r31, + 0x0000] %asi, %r17
	mov	0x7d0, %r23
	.word 0xe8aec9e0  ! 409: STBA_R	stba	%r20, [%r27 + %r0] 0x4f
	.word 0xe8b7ce40  ! 410: STHA_R	stha	%r20, [%r31 + %r0] 0x72
	mov	0x7c8, %r22
	.word 0xe8d7e000  ! 412: LDSHA_I	ldsha	[%r31, + 0x0000] %asi, %r20
	mov	0x3d8, %r20
	mov	0x68, %r19
	.word 0xe8af6000  ! 415: STBA_I	stba	%r20, [%r29 + 0x0000] %asi
	.word 0xee8f4e40  ! 416: LDUBA_R	lduba	[%r29, %r0] 0x72, %r23
	.word 0xe4b504a0  ! 417: STHA_R	stha	%r18, [%r20 + %r0] 0x25
	mov	0x7c8, %r20
	mov	0x10, %r25
	.word 0xe487a000  ! 420: LDUWA_I	lduwa	[%r30, + 0x0000] %asi, %r18
	.word 0xe4b72000  ! 421: STHA_I	stha	%r18, [%r28 + 0x0000] %asi
	.word 0xe4dfe000  ! 422: LDXA_I	ldxa	[%r31, + 0x0000] %asi, %r18
	mov	0x58, %r25
	mov	0x78, %r24
	.word 0xe686c9e0  ! 425: LDUWA_R	lduwa	[%r27, %r0] 0x4f, %r19
	.word 0xe6876000  ! 426: LDUWA_I	lduwa	[%r29, + 0x0000] %asi, %r19
	.word 0xe8dcc400  ! 427: LDXA_R	ldxa	[%r19, %r0] 0x20, %r20
	.word 0x87802073  ! 428: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0xe8a7a000  ! 429: STWA_I	stwa	%r20, [%r30 + 0x0000] %asi
	.word 0x87802074  ! 430: WRASI_I	wr	%r0, 0x0074, %asi
	mov	0x38, %r19
	.word 0xeca4c400  ! 432: STWA_R	stwa	%r22, [%r19 + %r0] 0x20
	.word 0xec9ec9e0  ! 433: LDDA_R	ldda	[%r27, %r0] 0x4f, %r22
	.word 0xe0840400  ! 434: LDUWA_R	lduwa	[%r16, %r0] 0x20, %r16
	.word 0x87802025  ! 435: WRASI_I	wr	%r0, 0x0025, %asi
	mov	0x70, %r27
	.word 0xeac40400  ! 437: LDSWA_R	ldswa	[%r16, %r0] 0x20, %r21
	.word 0xe2a4c400  ! 438: STWA_R	stwa	%r17, [%r19 + %r0] 0x20
	mov	0x7c0, %r21
	.word 0xeeafce40  ! 440: STBA_R	stba	%r23, [%r31 + %r0] 0x72
	.word 0xe8d6c9e0  ! 441: LDSHA_R	ldsha	[%r27, %r0] 0x4f, %r20
	mov	0x3c8, %r23
	.word 0x87802072  ! 443: WRASI_I	wr	%r0, 0x0072, %asi
	mov	0x7f0, %r22
	.word 0xe8cfa000  ! 445: LDSBA_I	ldsba	[%r30, + 0x0000] %asi, %r20
	mov	0x3d8, %r20
	mov	0x58, %r27
	.word 0xe2df8e80  ! 448: LDXA_R	ldxa	[%r30, %r0] 0x74, %r17
	.word 0xe2bfe000  ! 449: STDA_I	stda	%r17, [%r31 + 0x0000] %asi
	.word 0xe6a5c4a0  ! 450: STWA_R	stwa	%r19, [%r23 + %r0] 0x25
	mov	0x7c8, %r20
	.word 0xe6c7e000  ! 452: LDSWA_I	ldswa	[%r31, + 0x0000] %asi, %r19
	mov	0x48, %r16
	.word 0xe6afa000  ! 454: STBA_I	stba	%r19, [%r30 + 0x0000] %asi
	.word 0xe6dfa000  ! 455: LDXA_I	ldxa	[%r30, + 0x0000] %asi, %r19
	.word 0x8780204f  ! 456: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xe29cc400  ! 457: LDDA_R	ldda	[%r19, %r0] 0x20, %r17
	mov	0x38, %r17
	.word 0xe2d6e000  ! 459: LDSHA_I	ldsha	[%r27, + 0x0000] %asi, %r17
	.word 0xe0b7ce80  ! 460: STHA_R	stha	%r16, [%r31 + %r0] 0x74
	.word 0xe8cfce60  ! 461: LDSBA_R	ldsba	[%r31, %r0] 0x73, %r20
	.word 0xea8544a0  ! 462: LDUWA_R	lduwa	[%r21, %r0] 0x25, %r21
	.word 0xead6a000  ! 463: LDSHA_I	ldsha	[%r26, + 0x0000] %asi, %r21
	.word 0xeab6a000  ! 464: STHA_I	stha	%r21, [%r26 + 0x0000] %asi
	.word 0xe0d78e60  ! 465: LDSHA_R	ldsha	[%r30, %r0] 0x73, %r16
	.word 0xe0a66000  ! 466: STWA_I	stwa	%r16, [%r25 + 0x0000] %asi
	mov	0x38, %r19
	mov	0x3d8, %r22
	.word 0x87802025  ! 469: WRASI_I	wr	%r0, 0x0025, %asi
	mov	0x7e0, %r21
	.word 0xeca44400  ! 471: STWA_R	stwa	%r22, [%r17 + %r0] 0x20
	mov	0x7d8, %r21
	.word 0xead689e0  ! 473: LDSHA_R	ldsha	[%r26, %r0] 0x4f, %r21
	mov	0x78, %r24
	mov	0x60, %r16
	mov	0x40, %r19
	mov	0x28, %r18
	mov	0x58, %r17
	.word 0xe4af8e80  ! 479: STBA_R	stba	%r18, [%r30 + %r0] 0x74
	.word 0xe0f40400  ! 480: STXA_R	stxa	%r16, [%r16 + %r0] 0x20
	.word 0xe095a000  ! 481: LDUHA_I	lduha	[%r22, + 0x0000] %asi, %r16
	.word 0xe085e000  ! 482: LDUWA_I	lduwa	[%r23, + 0x0000] %asi, %r16
	.word 0xee9f0e80  ! 483: LDDA_R	ldda	[%r28, %r0] 0x74, %r23
	.word 0xecac4400  ! 484: STBA_R	stba	%r22, [%r17 + %r0] 0x20
	.word 0xe4a74e60  ! 485: STWA_R	stwa	%r18, [%r29 + %r0] 0x73
	.word 0xeca5c4a0  ! 486: STWA_R	stwa	%r22, [%r23 + %r0] 0x25
	.word 0xeca52000  ! 487: STWA_I	stwa	%r22, [%r20 + 0x0000] %asi
	.word 0xe2af0e40  ! 488: STBA_R	stba	%r17, [%r28 + %r0] 0x72
	mov	0x3f8, %r21
	.word 0xe2f52000  ! 490: STXA_I	stxa	%r17, [%r20 + 0x0000] %asi
	.word 0xe2bd2000  ! 491: STDA_I	stda	%r17, [%r20 + 0x0000] %asi
	mov	0x10, %r16
	.word 0xeabf8e60  ! 493: STDA_R	stda	%r21, [%r30 + %r0] 0x73
	mov	0x70, %r17
	.word 0xe0974e40  ! 495: LDUHA_R	lduha	[%r29, %r0] 0x72, %r16
	.word 0xecd7ce80  ! 496: LDSHA_R	ldsha	[%r31, %r0] 0x74, %r22
	mov	0x70, %r18
	.word 0xe69f4e80  ! 498: LDDA_R	ldda	[%r29, %r0] 0x74, %r19
	.word 0x87802020  ! 499: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe6a4e000  ! 500: STWA_I	stwa	%r19, [%r19 + 0x0000] %asi
	.word 0xe2f40400  ! 501: STXA_R	stxa	%r17, [%r16 + %r0] 0x20
	.word 0x87802020  ! 502: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0x87802020  ! 503: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0x8780204f  ! 504: WRASI_I	wr	%r0, 0x004f, %asi
	mov	0x68, %r19
	mov	0x20, %r25
	.word 0x87802073  ! 507: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0x87802020  ! 508: WRASI_I	wr	%r0, 0x0020, %asi
	mov	0x50, %r27
	.word 0x8780204f  ! 510: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xe2b6e000  ! 511: STHA_I	stha	%r17, [%r27 + 0x0000] %asi
	mov	0x30, %r18
	.word 0xe2c66000  ! 513: LDSWA_I	ldswa	[%r25, + 0x0000] %asi, %r17
	.word 0xe2ccc400  ! 514: LDSBA_R	ldsba	[%r19, %r0] 0x20, %r17
	.word 0xe2d6a000  ! 515: LDSHA_I	ldsha	[%r26, + 0x0000] %asi, %r17
	mov	0x7e8, %r22
	.word 0xe2be6000  ! 517: STDA_I	stda	%r17, [%r25 + 0x0000] %asi
	.word 0xe2dea000  ! 518: LDXA_I	ldxa	[%r26, + 0x0000] %asi, %r17
	.word 0x87802074  ! 519: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0xe2afe000  ! 520: STBA_I	stba	%r17, [%r31 + 0x0000] %asi
	.word 0xe2cf2000  ! 521: LDSBA_I	ldsba	[%r28, + 0x0000] %asi, %r17
	.word 0xeaae89e0  ! 522: STBA_R	stba	%r21, [%r26 + %r0] 0x4f
	.word 0xeadf6000  ! 523: LDXA_I	ldxa	[%r29, + 0x0000] %asi, %r21
	mov	0x50, %r25
	mov	0x18, %r24
	.word 0x8780204f  ! 526: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xeaf649e0  ! 527: STXA_R	stxa	%r21, [%r25 + %r0] 0x4f
	.word 0xeabe6000  ! 528: STDA_I	stda	%r21, [%r25 + 0x0000] %asi
	.word 0x87802073  ! 529: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0xea976000  ! 530: LDUHA_I	lduha	[%r29, + 0x0000] %asi, %r21
	.word 0xe68c0400  ! 531: LDUBA_R	lduba	[%r16, %r0] 0x20, %r19
	.word 0xecf649e0  ! 532: STXA_R	stxa	%r22, [%r25 + %r0] 0x4f
	.word 0xec9f2000  ! 533: LDDA_I	ldda	[%r28, + 0x0000] %asi, %r22
	.word 0xe8be49e0  ! 534: STDA_R	stda	%r20, [%r25 + %r0] 0x4f
	.word 0xe8a72000  ! 535: STWA_I	stwa	%r20, [%r28 + 0x0000] %asi
	.word 0xeedc8400  ! 536: LDXA_R	ldxa	[%r18, %r0] 0x20, %r23
	.word 0x87802074  ! 537: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0x87802074  ! 538: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0xee9fe000  ! 539: LDDA_I	ldda	[%r31, + 0x0000] %asi, %r23
	mov	0x3d0, %r21
	mov	0x48, %r17
	.word 0xeecf2000  ! 542: LDSBA_I	ldsba	[%r28, + 0x0000] %asi, %r23
	mov	0x3e8, %r22
	.word 0xeed7a000  ! 544: LDSHA_I	ldsha	[%r30, + 0x0000] %asi, %r23
	.word 0xeed7e000  ! 545: LDSHA_I	ldsha	[%r31, + 0x0000] %asi, %r23
	.word 0xe8f4c400  ! 546: STXA_R	stxa	%r20, [%r19 + %r0] 0x20
	.word 0xeeb44400  ! 547: STHA_R	stha	%r23, [%r17 + %r0] 0x20
	mov	0x7c8, %r20
	.word 0xe6f40400  ! 549: STXA_R	stxa	%r19, [%r16 + %r0] 0x20
	.word 0xe2bfce40  ! 550: STDA_R	stda	%r17, [%r31 + %r0] 0x72
	mov	0x48, %r16
	.word 0xe2a544a0  ! 552: STWA_R	stwa	%r17, [%r21 + %r0] 0x25
	.word 0x87802025  ! 553: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0xe2bd2000  ! 554: STDA_I	stda	%r17, [%r20 + 0x0000] %asi
	.word 0xe2ade000  ! 555: STBA_I	stba	%r17, [%r23 + 0x0000] %asi
	.word 0xe2952000  ! 556: LDUHA_I	lduha	[%r20, + 0x0000] %asi, %r17
	.word 0xe2cde000  ! 557: LDSBA_I	ldsba	[%r23, + 0x0000] %asi, %r17
	.word 0xe285a000  ! 558: LDUWA_I	lduwa	[%r22, + 0x0000] %asi, %r17
	.word 0xe28d2000  ! 559: LDUBA_I	lduba	[%r20, + 0x0000] %asi, %r17
	ta	T_CHANGE_PRIV	! macro
	.word 0xe4a44400  ! 561: STWA_R	stwa	%r18, [%r17 + %r0] 0x20
	.word 0xee9dc4a0  ! 562: LDDA_R	ldda	[%r23, %r0] 0x25, %r23
	mov	0x28, %r26
	.word 0xeec5e000  ! 564: LDSWA_I	ldswa	[%r23, + 0x0000] %asi, %r23
	mov	0x70, %r19
	.word 0xe28f0e40  ! 566: LDUBA_R	lduba	[%r28, %r0] 0x72, %r17
	mov	0x68, %r27
	.word 0x87802020  ! 568: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0x87802073  ! 569: WRASI_I	wr	%r0, 0x0073, %asi
	mov	0x28, %r26
	.word 0xec940400  ! 571: LDUHA_R	lduha	[%r16, %r0] 0x20, %r22
	mov	0x3f8, %r20
	mov	0x78, %r18
	.word 0xeccfa000  ! 574: LDSBA_I	ldsba	[%r30, + 0x0000] %asi, %r22
	.word 0xecb76000  ! 575: STHA_I	stha	%r22, [%r29 + 0x0000] %asi
	mov	0x50, %r24
	mov	0x7e0, %r20
	.word 0xeab4c400  ! 578: STHA_R	stha	%r21, [%r19 + %r0] 0x20
	.word 0xeaf76000  ! 579: STXA_I	stxa	%r21, [%r29 + 0x0000] %asi
	.word 0xeef40400  ! 580: STXA_R	stxa	%r23, [%r16 + %r0] 0x20
	.word 0xeadf8e60  ! 581: LDXA_R	ldxa	[%r30, %r0] 0x73, %r21
	.word 0xeabfce40  ! 582: STDA_R	stda	%r21, [%r31 + %r0] 0x72
	.word 0xeab72000  ! 583: STHA_I	stha	%r21, [%r28 + 0x0000] %asi
	.word 0xe2cfce40  ! 584: LDSBA_R	ldsba	[%r31, %r0] 0x72, %r17
	.word 0xe6a504a0  ! 585: STWA_R	stwa	%r19, [%r20 + %r0] 0x25
	mov	0x40, %r16
	mov	0x68, %r27
	.word 0xe6bf2000  ! 588: STDA_I	stda	%r19, [%r28 + 0x0000] %asi
	.word 0x8780204f  ! 589: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xe8dfce40  ! 590: LDXA_R	ldxa	[%r31, %r0] 0x72, %r20
	.word 0xe8de6000  ! 591: LDXA_I	ldxa	[%r25, + 0x0000] %asi, %r20
	.word 0xe8b62000  ! 592: STHA_I	stha	%r20, [%r24 + 0x0000] %asi
	.word 0x87802020  ! 593: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0x8780204f  ! 594: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xeaacc400  ! 595: STBA_R	stba	%r21, [%r19 + %r0] 0x20
	mov	0x3f0, %r23
	mov	0x28, %r27
	.word 0xecb7ce80  ! 598: STHA_R	stha	%r22, [%r31 + %r0] 0x74
	.word 0xee9fce60  ! 599: LDDA_R	ldda	[%r31, %r0] 0x73, %r23
	.word 0xecaec9e0  ! 600: STBA_R	stba	%r22, [%r27 + %r0] 0x4f
	.word 0x87802073  ! 601: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0xe6ce49e0  ! 602: LDSBA_R	ldsba	[%r25, %r0] 0x4f, %r19
	mov	0x68, %r27
	.word 0xe8f78e80  ! 604: STXA_R	stxa	%r20, [%r30 + %r0] 0x74
	.word 0xe2af8e40  ! 605: STBA_R	stba	%r17, [%r30 + %r0] 0x72
	.word 0xe2b76000  ! 606: STHA_I	stha	%r17, [%r29 + 0x0000] %asi
	.word 0xe2d72000  ! 607: LDSHA_I	ldsha	[%r28, + 0x0000] %asi, %r17
	.word 0x8780204f  ! 608: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xe4b649e0  ! 609: STHA_R	stha	%r18, [%r25 + %r0] 0x4f
	.word 0xe4de6000  ! 610: LDXA_I	ldxa	[%r25, + 0x0000] %asi, %r18
	.word 0xee8d44a0  ! 611: LDUBA_R	lduba	[%r21, %r0] 0x25, %r23
	.word 0xe887ce80  ! 612: LDUWA_R	lduwa	[%r31, %r0] 0x74, %r20
	.word 0xe48f8e40  ! 613: LDUBA_R	lduba	[%r30, %r0] 0x72, %r18
	mov	0x48, %r24
	.word 0xe4bea000  ! 615: STDA_I	stda	%r18, [%r26 + 0x0000] %asi
	.word 0xe4f62000  ! 616: STXA_I	stxa	%r18, [%r24 + 0x0000] %asi
	mov	0x58, %r16
	.word 0xe2cf0e40  ! 618: LDSBA_R	ldsba	[%r28, %r0] 0x72, %r17
	.word 0xe2d6a000  ! 619: LDSHA_I	ldsha	[%r26, + 0x0000] %asi, %r17
	mov	0x18, %r19
	.word 0x87802020  ! 621: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0x87802073  ! 622: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0x87802073  ! 623: WRASI_I	wr	%r0, 0x0073, %asi
	mov	0x3c8, %r20
	.word 0xe297e000  ! 625: LDUHA_I	lduha	[%r31, + 0x0000] %asi, %r17
	.word 0xe6f544a0  ! 626: STXA_R	stxa	%r19, [%r21 + %r0] 0x25
	.word 0xe6dc4400  ! 627: LDXA_R	ldxa	[%r17, %r0] 0x20, %r19
	mov	0x58, %r16
	.word 0xe6cf6000  ! 629: LDSBA_I	ldsba	[%r29, + 0x0000] %asi, %r19
	.word 0xe6bfa000  ! 630: STDA_I	stda	%r19, [%r30 + 0x0000] %asi
	.word 0xe68f6000  ! 631: LDUBA_I	lduba	[%r29, + 0x0000] %asi, %r19
	.word 0xe6f7e000  ! 632: STXA_I	stxa	%r19, [%r31 + 0x0000] %asi
	.word 0xe6f72000  ! 633: STXA_I	stxa	%r19, [%r28 + 0x0000] %asi
	.word 0xe6f7a000  ! 634: STXA_I	stxa	%r19, [%r30 + 0x0000] %asi
	.word 0xeed44400  ! 635: LDSHA_R	ldsha	[%r17, %r0] 0x20, %r23
	mov	0x70, %r19
	mov	0x10, %r25
	mov	0x0, %r26
	.word 0xee976000  ! 639: LDUHA_I	lduha	[%r29, + 0x0000] %asi, %r23
	.word 0xeea76000  ! 640: STWA_I	stwa	%r23, [%r29 + 0x0000] %asi
	.word 0xee972000  ! 641: LDUHA_I	lduha	[%r28, + 0x0000] %asi, %r23
	mov	0x7c8, %r21
	.word 0xecd70e60  ! 643: LDSHA_R	ldsha	[%r28, %r0] 0x73, %r22
	.word 0x87802074  ! 644: WRASI_I	wr	%r0, 0x0074, %asi
	mov	0x7c8, %r23
	.word 0xecbec9e0  ! 646: STDA_R	stda	%r22, [%r27 + %r0] 0x4f
	.word 0xecc48400  ! 647: LDSWA_R	ldswa	[%r18, %r0] 0x20, %r22
	.word 0xecd7a000  ! 648: LDSHA_I	ldsha	[%r30, + 0x0000] %asi, %r22
	.word 0xecaf6000  ! 649: STBA_I	stba	%r22, [%r29 + 0x0000] %asi
	.word 0xeccf6000  ! 650: LDSBA_I	ldsba	[%r29, + 0x0000] %asi, %r22
	.word 0xe4b7ce80  ! 651: STHA_R	stha	%r18, [%r31 + %r0] 0x74
	.word 0xe4afa000  ! 652: STBA_I	stba	%r18, [%r30 + 0x0000] %asi
	.word 0xecd78e40  ! 653: LDSHA_R	ldsha	[%r30, %r0] 0x72, %r22
	.word 0xecc7e000  ! 654: LDSWA_I	ldswa	[%r31, + 0x0000] %asi, %r22
	.word 0xecbf2000  ! 655: STDA_I	stda	%r22, [%r28 + 0x0000] %asi
	mov	0x78, %r18
	.word 0xecf72000  ! 657: STXA_I	stxa	%r22, [%r28 + 0x0000] %asi
	.word 0x87802073  ! 658: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0x87802074  ! 659: WRASI_I	wr	%r0, 0x0074, %asi
	mov	0x68, %r17
	mov	0x38, %r27
	mov	0x30, %r18
	.word 0xecc44400  ! 663: LDSWA_R	ldswa	[%r17, %r0] 0x20, %r22
	.word 0xe29d04a0  ! 664: LDDA_R	ldda	[%r20, %r0] 0x25, %r17
	.word 0xe8b7ce40  ! 665: STHA_R	stha	%r20, [%r31 + %r0] 0x72
	.word 0xe8df6000  ! 666: LDXA_I	ldxa	[%r29, + 0x0000] %asi, %r20
	mov	0x78, %r26
	.word 0xe8d7ce60  ! 668: LDSHA_R	ldsha	[%r31, %r0] 0x73, %r20
	.word 0xecacc400  ! 669: STBA_R	stba	%r22, [%r19 + %r0] 0x20
	mov	0x7f8, %r21
	.word 0x87802074  ! 671: WRASI_I	wr	%r0, 0x0074, %asi
	mov	0x60, %r26
	.word 0xeccf6000  ! 673: LDSBA_I	ldsba	[%r29, + 0x0000] %asi, %r22
	.word 0xecbfa000  ! 674: STDA_I	stda	%r22, [%r30 + 0x0000] %asi
	.word 0xe0a78e40  ! 675: STWA_R	stwa	%r16, [%r30 + %r0] 0x72
	.word 0xecafce60  ! 676: STBA_R	stba	%r22, [%r31 + %r0] 0x73
	.word 0x87802073  ! 677: WRASI_I	wr	%r0, 0x0073, %asi
	mov	0x3f8, %r20
	mov	0x68, %r25
	.word 0xe4bc8400  ! 680: STDA_R	stda	%r18, [%r18 + %r0] 0x20
	.word 0xe4a72000  ! 681: STWA_I	stwa	%r18, [%r28 + 0x0000] %asi
	.word 0xe4df6000  ! 682: LDXA_I	ldxa	[%r29, + 0x0000] %asi, %r18
	.word 0xe4d7e000  ! 683: LDSHA_I	ldsha	[%r31, + 0x0000] %asi, %r18
	.word 0xe497e000  ! 684: LDUHA_I	lduha	[%r31, + 0x0000] %asi, %r18
	.word 0xe2b544a0  ! 685: STHA_R	stha	%r17, [%r21 + %r0] 0x25
	mov	0x10, %r18
	mov	0x48, %r27
	.word 0xe28f6000  ! 688: LDUBA_I	lduba	[%r29, + 0x0000] %asi, %r17
	.word 0xe28f6000  ! 689: LDUBA_I	lduba	[%r29, + 0x0000] %asi, %r17
	.word 0xeab48400  ! 690: STHA_R	stha	%r21, [%r18 + %r0] 0x20
	.word 0xeac7a000  ! 691: LDSWA_I	ldswa	[%r30, + 0x0000] %asi, %r21
	.word 0xe8d70e60  ! 692: LDSHA_R	ldsha	[%r28, %r0] 0x73, %r20
	.word 0xe88fe000  ! 693: LDUBA_I	lduba	[%r31, + 0x0000] %asi, %r20
	.word 0xe69dc4a0  ! 694: LDDA_R	ldda	[%r23, %r0] 0x25, %r19
	.word 0xe6bfa000  ! 695: STDA_I	stda	%r19, [%r30 + 0x0000] %asi
	.word 0xe6f7e000  ! 696: STXA_I	stxa	%r19, [%r31 + 0x0000] %asi
	mov	0x68, %r17
	.word 0xeea70e40  ! 698: STWA_R	stwa	%r23, [%r28 + %r0] 0x72
	.word 0xec87ce40  ! 699: LDUWA_R	lduwa	[%r31, %r0] 0x72, %r22
	mov	0x7f0, %r21
	mov	0x20, %r24
	.word 0xee970e40  ! 702: LDUHA_R	lduha	[%r28, %r0] 0x72, %r23
	.word 0xeea72000  ! 703: STWA_I	stwa	%r23, [%r28 + 0x0000] %asi
	.word 0xead544a0  ! 704: LDSHA_R	ldsha	[%r21, %r0] 0x25, %r21
	.word 0xea87e000  ! 705: LDUWA_I	lduwa	[%r31, + 0x0000] %asi, %r21
	mov	0x58, %r18
	mov	0x7c8, %r23
	ta	T_CHANGE_NONPRIV	! macro
	mov	0x18, %r27
	.word 0xea8fce60  ! 710: LDUBA_R	lduba	[%r31, %r0] 0x73, %r21
	.word 0xe4f44400  ! 711: STXA_R	stxa	%r18, [%r17 + %r0] 0x20
	.word 0xec9609e0  ! 712: LDUHA_R	lduha	[%r24, %r0] 0x4f, %r22
	.word 0xecbfa000  ! 713: STDA_I	stda	%r22, [%r30 + 0x0000] %asi
	.word 0x87802074  ! 714: WRASI_I	wr	%r0, 0x0074, %asi
	mov	0x20, %r17
	.word 0xe0840400  ! 716: LDUWA_R	lduwa	[%r16, %r0] 0x20, %r16
	.word 0xecdc4400  ! 717: LDXA_R	ldxa	[%r17, %r0] 0x20, %r22
	.word 0xecb7e000  ! 718: STHA_I	stha	%r22, [%r31 + 0x0000] %asi
	.word 0xe29e49e0  ! 719: LDDA_R	ldda	[%r25, %r0] 0x4f, %r17
	mov	0x70, %r26
	mov	0x48, %r19
	.word 0xe297e000  ! 722: LDUHA_I	lduha	[%r31, + 0x0000] %asi, %r17
	mov	0x3d8, %r20
	.word 0xe2cfa000  ! 724: LDSBA_I	ldsba	[%r30, + 0x0000] %asi, %r17
	.word 0xe28fa000  ! 725: LDUBA_I	lduba	[%r30, + 0x0000] %asi, %r17
	mov	0x7c8, %r21
	.word 0xe2cf2000  ! 727: LDSBA_I	ldsba	[%r28, + 0x0000] %asi, %r17
	.word 0xe2876000  ! 728: LDUWA_I	lduwa	[%r29, + 0x0000] %asi, %r17
	mov	0x3e8, %r22
	.word 0x87802073  ! 730: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0xeebfce60  ! 731: STDA_R	stda	%r23, [%r31 + %r0] 0x73
	.word 0xeef7e000  ! 732: STXA_I	stxa	%r23, [%r31 + 0x0000] %asi
	.word 0xe6be89e0  ! 733: STDA_R	stda	%r19, [%r26 + %r0] 0x4f
	.word 0xe6bfa000  ! 734: STDA_I	stda	%r19, [%r30 + 0x0000] %asi
	.word 0xe2b5c4a0  ! 735: STHA_R	stha	%r17, [%r23 + %r0] 0x25
	.word 0xecccc400  ! 736: LDSBA_R	ldsba	[%r19, %r0] 0x20, %r22
	.word 0x87802072  ! 737: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0x8780204f  ! 738: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xeac504a0  ! 739: LDSWA_R	ldswa	[%r20, %r0] 0x25, %r21
	mov	0x3d0, %r23
	ta	T_CHANGE_HPRIV	! macro
	.word 0xe8c5c4a0  ! 742: LDSWA_R	ldswa	[%r23, %r0] 0x25, %r20
	mov	0x3f8, %r23
	.word 0xe886e000  ! 744: LDUWA_I	lduwa	[%r27, + 0x0000] %asi, %r20
	.word 0xe88ee000  ! 745: LDUBA_I	lduba	[%r27, + 0x0000] %asi, %r20
	.word 0xecd4c400  ! 746: LDSHA_R	ldsha	[%r19, %r0] 0x20, %r22
	.word 0xecc62000  ! 747: LDSWA_I	ldswa	[%r24, + 0x0000] %asi, %r22
	.word 0xeccee000  ! 748: LDSBA_I	ldsba	[%r27, + 0x0000] %asi, %r22
	.word 0xecf6e000  ! 749: STXA_I	stxa	%r22, [%r27 + 0x0000] %asi
	.word 0xeecf4e40  ! 750: LDSBA_R	ldsba	[%r29, %r0] 0x72, %r23
	.word 0xe6bdc4a0  ! 751: STDA_R	stda	%r19, [%r23 + %r0] 0x25
	mov	0x68, %r25
	.word 0x87802020  ! 753: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xeaa5c4a0  ! 754: STWA_R	stwa	%r21, [%r23 + %r0] 0x25
	.word 0xea8c2000  ! 755: LDUBA_I	lduba	[%r16, + 0x0000] %asi, %r21
	.word 0x87802073  ! 756: WRASI_I	wr	%r0, 0x0073, %asi
	mov	0x58, %r24
	.word 0xe88cc400  ! 758: LDUBA_R	lduba	[%r19, %r0] 0x20, %r20
	.word 0x8780204f  ! 759: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xe0a584a0  ! 760: STWA_R	stwa	%r16, [%r22 + %r0] 0x25
	.word 0xe09e6000  ! 761: LDDA_I	ldda	[%r25, + 0x0000] %asi, %r16
	mov	0x3f0, %r20
	.word 0xe4af0e60  ! 763: STBA_R	stba	%r18, [%r28 + %r0] 0x73
	.word 0xeaf74e40  ! 764: STXA_R	stxa	%r21, [%r29 + %r0] 0x72
	.word 0xe8878e80  ! 765: LDUWA_R	lduwa	[%r30, %r0] 0x74, %r20
	.word 0xe48fce40  ! 766: LDUBA_R	lduba	[%r31, %r0] 0x72, %r18
	mov	0x3d8, %r21
	.word 0xe08ec9e0  ! 768: LDUBA_R	lduba	[%r27, %r0] 0x4f, %r16
	.word 0xea97ce40  ! 769: LDUHA_R	lduha	[%r31, %r0] 0x72, %r21
	.word 0xec9c4400  ! 770: LDDA_R	ldda	[%r17, %r0] 0x20, %r22
	.word 0xeead04a0  ! 771: STBA_R	stba	%r23, [%r20 + %r0] 0x25
	.word 0xe8ddc4a0  ! 772: LDXA_R	ldxa	[%r23, %r0] 0x25, %r20
	.word 0xe0bd84a0  ! 773: STDA_R	stda	%r16, [%r22 + %r0] 0x25
	.word 0xe28f8e80  ! 774: LDUBA_R	lduba	[%r30, %r0] 0x74, %r17
	mov	0x20, %r27
	mov	0x7e8, %r22
	.word 0xee9fce40  ! 777: LDDA_R	ldda	[%r31, %r0] 0x72, %r23
	mov	0x0, %r27
	mov	0x68, %r25
	.word 0x8780204f  ! 780: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xeea66000  ! 781: STWA_I	stwa	%r23, [%r25 + 0x0000] %asi
	.word 0x87802020  ! 782: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe8c40400  ! 783: LDSWA_R	ldswa	[%r16, %r0] 0x20, %r20
	.word 0xe8ac2000  ! 784: STBA_I	stba	%r20, [%r16 + 0x0000] %asi
	.word 0xe8d4e000  ! 785: LDSHA_I	ldsha	[%r19, + 0x0000] %asi, %r20
	.word 0xe2a44400  ! 786: STWA_R	stwa	%r17, [%r17 + %r0] 0x20
	.word 0xeeaf4e60  ! 787: STBA_R	stba	%r23, [%r29 + %r0] 0x73
	mov	0x20, %r26
	.word 0xe4afce80  ! 789: STBA_R	stba	%r18, [%r31 + %r0] 0x74
	.word 0xe68e49e0  ! 790: LDUBA_R	lduba	[%r25, %r0] 0x4f, %r19
	.word 0xeebd44a0  ! 791: STDA_R	stda	%r23, [%r21 + %r0] 0x25
	.word 0xeed4a000  ! 792: LDSHA_I	ldsha	[%r18, + 0x0000] %asi, %r23
	.word 0xee84e000  ! 793: LDUWA_I	lduwa	[%r19, + 0x0000] %asi, %r23
	.word 0x87802072  ! 794: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0xecf44400  ! 795: STXA_R	stxa	%r22, [%r17 + %r0] 0x20
	.word 0xead504a0  ! 796: LDSHA_R	ldsha	[%r20, %r0] 0x25, %r21
	.word 0xe0f689e0  ! 797: STXA_R	stxa	%r16, [%r26 + %r0] 0x4f
	.word 0xe68d04a0  ! 798: LDUBA_R	lduba	[%r20, %r0] 0x25, %r19
	mov	0x58, %r25
	.word 0xe0a649e0  ! 800: STWA_R	stwa	%r16, [%r25 + %r0] 0x4f
	.word 0xe0dfe000  ! 801: LDXA_I	ldxa	[%r31, + 0x0000] %asi, %r16
	.word 0xe0d7a000  ! 802: LDSHA_I	ldsha	[%r30, + 0x0000] %asi, %r16
	.word 0xe0872000  ! 803: LDUWA_I	lduwa	[%r28, + 0x0000] %asi, %r16
	mov	0x7c8, %r22
	.word 0xe0bfe000  ! 805: STDA_I	stda	%r16, [%r31 + 0x0000] %asi
	.word 0xe4ac8400  ! 806: STBA_R	stba	%r18, [%r18 + %r0] 0x20
	.word 0xe48f2000  ! 807: LDUBA_I	lduba	[%r28, + 0x0000] %asi, %r18
	mov	0x3e0, %r22
	mov	0x70, %r18
	.word 0xeac7ce60  ! 810: LDSWA_R	ldswa	[%r31, %r0] 0x73, %r21
	.word 0xeaafe000  ! 811: STBA_I	stba	%r21, [%r31 + 0x0000] %asi
	mov	0x8, %r16
	.word 0x87802072  ! 813: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0x8780204f  ! 814: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xe0b7ce40  ! 815: STHA_R	stha	%r16, [%r31 + %r0] 0x72
	.word 0x87802072  ! 816: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0xe0876000  ! 817: LDUWA_I	lduwa	[%r29, + 0x0000] %asi, %r16
	.word 0xeedc8400  ! 818: LDXA_R	ldxa	[%r18, %r0] 0x20, %r23
	.word 0xe4b40400  ! 819: STHA_R	stha	%r18, [%r16 + %r0] 0x20
	.word 0x8780204f  ! 820: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xe4aea000  ! 821: STBA_I	stba	%r18, [%r26 + 0x0000] %asi
	.word 0xeef70e80  ! 822: STXA_R	stxa	%r23, [%r28 + %r0] 0x74
	.word 0xe09d44a0  ! 823: LDDA_R	ldda	[%r21, %r0] 0x25, %r16
	.word 0xe2d78e60  ! 824: LDSHA_R	ldsha	[%r30, %r0] 0x73, %r17
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xe2dee000  ! 826: LDXA_I	ldxa	[%r27, + 0x0000] %asi, %r17
	.word 0x87802020  ! 827: WRASI_I	wr	%r0, 0x0020, %asi
	mov	0x3e0, %r20
	.word 0xe89f0e80  ! 829: LDDA_R	ldda	[%r28, %r0] 0x74, %r20
	.word 0xeec48400  ! 830: LDSWA_R	ldswa	[%r18, %r0] 0x20, %r23
	.word 0xeeb4a000  ! 831: STHA_I	stha	%r23, [%r18 + 0x0000] %asi
	.word 0x87802025  ! 832: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0xeebde000  ! 833: STDA_I	stda	%r23, [%r23 + 0x0000] %asi
	.word 0xeed52000  ! 834: LDSHA_I	ldsha	[%r20, + 0x0000] %asi, %r23
	.word 0xeef56000  ! 835: STXA_I	stxa	%r23, [%r21 + 0x0000] %asi
	.word 0x8780204f  ! 836: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xeedea000  ! 837: LDXA_I	ldxa	[%r26, + 0x0000] %asi, %r23
	.word 0x87802074  ! 838: WRASI_I	wr	%r0, 0x0074, %asi
	mov	0x3c0, %r21
	mov	0x48, %r17
	.word 0xeacf8e80  ! 841: LDSBA_R	ldsba	[%r30, %r0] 0x74, %r21
	.word 0xeab7a000  ! 842: STHA_I	stha	%r21, [%r30 + 0x0000] %asi
	.word 0xe0d5c4a0  ! 843: LDSHA_R	ldsha	[%r23, %r0] 0x25, %r16
	.word 0x87802074  ! 844: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0xe08c8400  ! 845: LDUBA_R	lduba	[%r18, %r0] 0x20, %r16
	.word 0xe0a7e000  ! 846: STWA_I	stwa	%r16, [%r31 + 0x0000] %asi
	.word 0xe0bf2000  ! 847: STDA_I	stda	%r16, [%r28 + 0x0000] %asi
	.word 0x8780204f  ! 848: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xe0be2000  ! 849: STDA_I	stda	%r16, [%r24 + 0x0000] %asi
	.word 0xe09c0400  ! 850: LDDA_R	ldda	[%r16, %r0] 0x20, %r16
	.word 0x87802074  ! 851: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0xe0bf2000  ! 852: STDA_I	stda	%r16, [%r28 + 0x0000] %asi
	mov	0x7c0, %r23
	.word 0xe0d7a000  ! 854: LDSHA_I	ldsha	[%r30, + 0x0000] %asi, %r16
	mov	0x20, %r24
	mov	0x50, %r26
	.word 0xe0cf2000  ! 857: LDSBA_I	ldsba	[%r28, + 0x0000] %asi, %r16
	.word 0xecb74e40  ! 858: STHA_R	stha	%r22, [%r29 + %r0] 0x72
	.word 0x87802020  ! 859: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe0b7ce80  ! 860: STHA_R	stha	%r16, [%r31 + %r0] 0x74
	.word 0x87802020  ! 861: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xee8d04a0  ! 862: LDUBA_R	lduba	[%r20, %r0] 0x25, %r23
	.word 0xe8cec9e0  ! 863: LDSBA_R	ldsba	[%r27, %r0] 0x4f, %r20
	mov	0x3d8, %r23
	mov	0x60, %r25
	mov	0x48, %r27
	.word 0x87802072  ! 867: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0xe6c7ce60  ! 868: LDSWA_R	ldswa	[%r31, %r0] 0x73, %r19
	.word 0x8780204f  ! 869: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xe6b6e000  ! 870: STHA_I	stha	%r19, [%r27 + 0x0000] %asi
	mov	0x0, %r16
	.word 0x87802074  ! 872: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0xeec78e60  ! 873: LDSWA_R	ldswa	[%r30, %r0] 0x73, %r23
	.word 0xecd689e0  ! 874: LDSHA_R	ldsha	[%r26, %r0] 0x4f, %r22
	mov	0x20, %r18
	.word 0x87802025  ! 876: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0xe28fce40  ! 877: LDUBA_R	lduba	[%r31, %r0] 0x72, %r17
	.word 0xea974e80  ! 878: LDUHA_R	lduha	[%r29, %r0] 0x74, %r21
	.word 0xeaa5e000  ! 879: STWA_I	stwa	%r21, [%r23 + 0x0000] %asi
	.word 0xeaf52000  ! 880: STXA_I	stxa	%r21, [%r20 + 0x0000] %asi
	.word 0x87802072  ! 881: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0x87802073  ! 882: WRASI_I	wr	%r0, 0x0073, %asi
	mov	0x48, %r25
	.word 0x87802020  ! 884: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xeea609e0  ! 885: STWA_R	stwa	%r23, [%r24 + %r0] 0x4f
	.word 0xecdd84a0  ! 886: LDXA_R	ldxa	[%r22, %r0] 0x25, %r22
	.word 0xecd4e000  ! 887: LDSHA_I	ldsha	[%r19, + 0x0000] %asi, %r22
	.word 0x87802074  ! 888: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0x87802020  ! 889: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xec84e000  ! 890: LDUWA_I	lduwa	[%r19, + 0x0000] %asi, %r22
	.word 0xeab74e80  ! 891: STHA_R	stha	%r21, [%r29 + %r0] 0x74
	.word 0x87802025  ! 892: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0xeadde000  ! 893: LDXA_I	ldxa	[%r23, + 0x0000] %asi, %r21
	mov	0x10, %r16
	mov	0x7f0, %r21
	mov	0x3f8, %r22
	mov	0x0, %r16
	.word 0xe8af0e80  ! 898: STBA_R	stba	%r20, [%r28 + %r0] 0x74
	.word 0xe8a5e000  ! 899: STWA_I	stwa	%r20, [%r23 + 0x0000] %asi
	.word 0xee9689e0  ! 900: LDUHA_R	lduha	[%r26, %r0] 0x4f, %r23
	.word 0xe0ad04a0  ! 901: STBA_R	stba	%r16, [%r20 + %r0] 0x25
	.word 0xe6d70e40  ! 902: LDSHA_R	ldsha	[%r28, %r0] 0x72, %r19
	.word 0xeabc0400  ! 903: STDA_R	stda	%r21, [%r16 + %r0] 0x20
	.word 0xe2f7ce40  ! 904: STXA_R	stxa	%r17, [%r31 + %r0] 0x72
	.word 0xe2d5a000  ! 905: LDSHA_I	ldsha	[%r22, + 0x0000] %asi, %r17
	.word 0x87802020  ! 906: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe2b4e000  ! 907: STHA_I	stha	%r17, [%r19 + 0x0000] %asi
	.word 0x87802073  ! 908: WRASI_I	wr	%r0, 0x0073, %asi
	mov	0x68, %r17
	mov	0x8, %r17
	.word 0x87802020  ! 911: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe4c48400  ! 912: LDSWA_R	ldswa	[%r18, %r0] 0x20, %r18
	mov	0x8, %r27
	mov	0x8, %r19
	mov	0x70, %r16
	.word 0xe4a4a000  ! 916: STWA_I	stwa	%r18, [%r18 + 0x0000] %asi
	.word 0xe4b74e40  ! 917: STHA_R	stha	%r18, [%r29 + %r0] 0x72
	.word 0x8780204f  ! 918: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xe8cf4e60  ! 919: LDSBA_R	ldsba	[%r29, %r0] 0x73, %r20
	.word 0xe8b66000  ! 920: STHA_I	stha	%r20, [%r25 + 0x0000] %asi
	.word 0xeca689e0  ! 921: STWA_R	stwa	%r22, [%r26 + %r0] 0x4f
	mov	0x8, %r19
	mov	0x20, %r26
	.word 0xe8cdc4a0  ! 924: LDSBA_R	ldsba	[%r23, %r0] 0x25, %r20
	.word 0xe8f62000  ! 925: STXA_I	stxa	%r20, [%r24 + 0x0000] %asi
	.word 0x87802020  ! 926: WRASI_I	wr	%r0, 0x0020, %asi
	mov	0x78, %r19
	.word 0xe8be09e0  ! 928: STDA_R	stda	%r20, [%r24 + %r0] 0x4f
	.word 0xea844400  ! 929: LDUWA_R	lduwa	[%r17, %r0] 0x20, %r21
	.word 0x87802020  ! 930: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe0bcc400  ! 931: STDA_R	stda	%r16, [%r19 + %r0] 0x20
	.word 0xeab70e60  ! 932: STHA_R	stha	%r21, [%r28 + %r0] 0x73
	mov	0x7d0, %r21
	.word 0xead42000  ! 934: LDSHA_I	ldsha	[%r16, + 0x0000] %asi, %r21
	.word 0xe4df8e80  ! 935: LDXA_R	ldxa	[%r30, %r0] 0x74, %r18
	.word 0xe49c6000  ! 936: LDDA_I	ldda	[%r17, + 0x0000] %asi, %r18
	.word 0x87802020  ! 937: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe4ac6000  ! 938: STBA_I	stba	%r18, [%r17 + 0x0000] %asi
	.word 0x87802020  ! 939: WRASI_I	wr	%r0, 0x0020, %asi
	mov	0x28, %r25
	.word 0xe4b42000  ! 941: STHA_I	stha	%r18, [%r16 + 0x0000] %asi
	.word 0xe0878e40  ! 942: LDUWA_R	lduwa	[%r30, %r0] 0x72, %r16
	mov	0x7e8, %r22
	.word 0xe0846000  ! 944: LDUWA_I	lduwa	[%r17, + 0x0000] %asi, %r16
	.word 0xe2adc4a0  ! 945: STBA_R	stba	%r17, [%r23 + %r0] 0x25
	.word 0xe0f6c9e0  ! 946: STXA_R	stxa	%r16, [%r27 + %r0] 0x4f
	.word 0x87802025  ! 947: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0x87802025  ! 948: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0xe0cf0e40  ! 949: LDSBA_R	ldsba	[%r28, %r0] 0x72, %r16
	.word 0xe0b5e000  ! 950: STHA_I	stha	%r16, [%r23 + 0x0000] %asi
	.word 0xe0bd6000  ! 951: STDA_I	stda	%r16, [%r21 + 0x0000] %asi
	.word 0xe8dec9e0  ! 952: LDXA_R	ldxa	[%r27, %r0] 0x4f, %r20
	.word 0xe89de000  ! 953: LDDA_I	ldda	[%r23, + 0x0000] %asi, %r20
	.word 0xe8f5e000  ! 954: STXA_I	stxa	%r20, [%r23 + 0x0000] %asi
	.word 0x87802025  ! 955: WRASI_I	wr	%r0, 0x0025, %asi
	mov	0x7d8, %r21
	.word 0xe8f5e000  ! 957: STXA_I	stxa	%r20, [%r23 + 0x0000] %asi
	mov	0x3f0, %r22
	.word 0xe6ac4400  ! 959: STBA_R	stba	%r19, [%r17 + %r0] 0x20
	mov	0x3f8, %r22
	mov	0x40, %r18
	.word 0xe6bd6000  ! 962: STDA_I	stda	%r19, [%r21 + 0x0000] %asi
	mov	0x20, %r17
	.word 0xe695e000  ! 964: LDUHA_I	lduha	[%r23, + 0x0000] %asi, %r19
	mov	0x78, %r17
	mov	0x7c8, %r23
	.word 0x87802073  ! 967: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0xe6bf6000  ! 968: STDA_I	stda	%r19, [%r29 + 0x0000] %asi
	.word 0xe687e000  ! 969: LDUWA_I	lduwa	[%r31, + 0x0000] %asi, %r19
	.word 0xe4870e80  ! 970: LDUWA_R	lduwa	[%r28, %r0] 0x74, %r18
	.word 0xe4dfa000  ! 971: LDXA_I	ldxa	[%r30, + 0x0000] %asi, %r18
	.word 0x87802020  ! 972: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe4bc6000  ! 973: STDA_I	stda	%r18, [%r17 + 0x0000] %asi
	.word 0xe88504a0  ! 974: LDUWA_R	lduwa	[%r20, %r0] 0x25, %r20
	.word 0xe2f44400  ! 975: STXA_R	stxa	%r17, [%r17 + %r0] 0x20
	.word 0xe4b7ce60  ! 976: STHA_R	stha	%r18, [%r31 + %r0] 0x73
	mov	0x30, %r24
	mov	0x7e8, %r23
	.word 0x87802025  ! 979: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0xe4dd6000  ! 980: LDXA_I	ldxa	[%r21, + 0x0000] %asi, %r18
	.word 0xe2f584a0  ! 981: STXA_R	stxa	%r17, [%r22 + %r0] 0x25
	mov	0x78, %r27
	.word 0xe8bf4e80  ! 983: STDA_R	stda	%r20, [%r29 + %r0] 0x74
	.word 0x87802073  ! 984: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0xe89fa000  ! 985: LDDA_I	ldda	[%r30, + 0x0000] %asi, %r20
	mov	0x58, %r26
	.word 0xe4948400  ! 987: LDUHA_R	lduha	[%r18, %r0] 0x20, %r18
	mov	0x10, %r16
	.word 0xe4af6000  ! 989: STBA_I	stba	%r18, [%r29 + 0x0000] %asi
	mov	0x7f8, %r23
	mov	0x0, %r16
	mov	0x70, %r16
	.word 0x87802073  ! 993: WRASI_I	wr	%r0, 0x0073, %asi
	mov	0x68, %r19
	.word 0x87802073  ! 995: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0xe497a000  ! 996: LDUHA_I	lduha	[%r30, + 0x0000] %asi, %r18
	.word 0xe497e000  ! 997: LDUHA_I	lduha	[%r31, + 0x0000] %asi, %r18
	.word 0xeadf0e80  ! 998: LDXA_R	ldxa	[%r28, %r0] 0x74, %r21
	mov	0x28, %r25
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_3:
	.word 0xe8cfa000  ! 1: LDSBA_I	ldsba	[%r30, + 0x0000] %asi, %r20
	.word 0xe897e000  ! 2: LDUHA_I	lduha	[%r31, + 0x0000] %asi, %r20
	.word 0x87802020  ! 3: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0x87802074  ! 4: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0x8780204f  ! 5: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xe8df2000  ! 6: LDXA_I	ldxa	[%r28, + 0x0000] %asi, %r20
	.word 0xecddc4a0  ! 7: LDXA_R	ldxa	[%r23, %r0] 0x25, %r22
	.word 0x87802072  ! 8: WRASI_I	wr	%r0, 0x0072, %asi
	mov	0x3c8, %r22
	mov	0x20, %r16
	.word 0xe2a74e40  ! 11: STWA_R	stwa	%r17, [%r29 + %r0] 0x72
	.word 0xecf5c4a0  ! 12: STXA_R	stxa	%r22, [%r23 + %r0] 0x25
	.word 0xea9f2000  ! 13: LDDA_I	ldda	[%r28, + 0x0000] %asi, %r21
	.word 0x87802020  ! 14: WRASI_I	wr	%r0, 0x0020, %asi
	mov	0x30, %r19
	mov	0x0, %r26
	.word 0x87802072  ! 17: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0xea8ce000  ! 18: LDUBA_I	lduba	[%r19, + 0x0000] %asi, %r21
	mov	0x7f0, %r21
	mov	0x3d0, %r22
	mov	0x40, %r27
	mov	0x7c0, %r23
	.word 0xe8b7ce60  ! 23: STHA_R	stha	%r20, [%r31 + %r0] 0x73
	.word 0xea846000  ! 24: LDUWA_I	lduwa	[%r17, + 0x0000] %asi, %r21
	.word 0xeaf42000  ! 25: STXA_I	stxa	%r21, [%r16 + 0x0000] %asi
	.word 0x87802072  ! 26: WRASI_I	wr	%r0, 0x0072, %asi
	mov	0x40, %r19
	.word 0xe4f7ce60  ! 28: STXA_R	stxa	%r18, [%r31 + %r0] 0x73
	.word 0xec9f6000  ! 29: LDDA_I	ldda	[%r29, + 0x0000] %asi, %r22
	.word 0xec9fe000  ! 30: LDDA_I	ldda	[%r31, + 0x0000] %asi, %r22
	.word 0xecb7a000  ! 31: STHA_I	stha	%r22, [%r30 + 0x0000] %asi
	.word 0xe8d7ce40  ! 32: LDSHA_R	ldsha	[%r31, %r0] 0x72, %r20
	.word 0x8780204f  ! 33: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xe4a70e40  ! 34: STWA_R	stwa	%r18, [%r28 + %r0] 0x72
	.word 0xea97e000  ! 35: LDUHA_I	lduha	[%r31, + 0x0000] %asi, %r21
	.word 0xea87e000  ! 36: LDUWA_I	lduwa	[%r31, + 0x0000] %asi, %r21
	.word 0x87802074  ! 37: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0xeadc6000  ! 38: LDXA_I	ldxa	[%r17, + 0x0000] %asi, %r21
	mov	0x3e8, %r21
	.word 0xe6cd84a0  ! 40: LDSBA_R	ldsba	[%r22, %r0] 0x25, %r19
	.word 0xe2b48400  ! 41: STHA_R	stha	%r17, [%r18 + %r0] 0x20
	mov	0x50, %r25
	.word 0xe297ce40  ! 43: LDUHA_R	lduha	[%r31, %r0] 0x72, %r17
	.word 0xe29ce000  ! 44: LDDA_I	ldda	[%r19, + 0x0000] %asi, %r17
	.word 0xe6bd84a0  ! 45: STDA_R	stda	%r19, [%r22 + %r0] 0x25
	.word 0xe09fce60  ! 46: LDDA_R	ldda	[%r31, %r0] 0x73, %r16
	.word 0xe68c4400  ! 47: LDUBA_R	lduba	[%r17, %r0] 0x20, %r19
	mov	0x38, %r19
	.word 0xeac4a000  ! 49: LDSWA_I	ldswa	[%r18, + 0x0000] %asi, %r21
	.word 0xeabc6000  ! 50: STDA_I	stda	%r21, [%r17 + 0x0000] %asi
	.word 0xe2bfce80  ! 51: STDA_R	stda	%r17, [%r31 + %r0] 0x74
	.word 0xe0840400  ! 52: LDUWA_R	lduwa	[%r16, %r0] 0x20, %r16
	mov	0x28, %r18
	.word 0xe8b42000  ! 54: STHA_I	stha	%r20, [%r16 + 0x0000] %asi
	mov	0x0, %r25
	.word 0xe8d46000  ! 56: LDSHA_I	ldsha	[%r17, + 0x0000] %asi, %r20
	.word 0xe0de09e0  ! 57: LDXA_R	ldxa	[%r24, %r0] 0x4f, %r16
	.word 0xeedca000  ! 58: LDXA_I	ldxa	[%r18, + 0x0000] %asi, %r23
	.word 0xee94e000  ! 59: LDUHA_I	lduha	[%r19, + 0x0000] %asi, %r23
	.word 0xeccc8400  ! 60: LDSBA_R	ldsba	[%r18, %r0] 0x20, %r22
	.word 0xe8c6c9e0  ! 61: LDSWA_R	ldswa	[%r27, %r0] 0x4f, %r20
	.word 0x87802020  ! 62: WRASI_I	wr	%r0, 0x0020, %asi
	mov	0x58, %r25
	.word 0x87802074  ! 64: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0xe89e6000  ! 65: LDDA_I	ldda	[%r25, + 0x0000] %asi, %r20
	mov	0x20, %r18
	.word 0xe2bf8e40  ! 67: STDA_R	stda	%r17, [%r30 + %r0] 0x72
	.word 0x8780204f  ! 68: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xe8962000  ! 69: LDUHA_I	lduha	[%r24, + 0x0000] %asi, %r20
	mov	0x7d0, %r22
	.word 0x87802073  ! 71: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0xe8cfe000  ! 72: LDSBA_I	ldsba	[%r31, + 0x0000] %asi, %r20
	.word 0x87802020  ! 73: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe0dcc400  ! 74: LDXA_R	ldxa	[%r19, %r0] 0x20, %r16
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xead48400  ! 76: LDSHA_R	ldsha	[%r18, %r0] 0x20, %r21
	.word 0xe2bf6000  ! 77: STDA_I	stda	%r17, [%r29 + 0x0000] %asi
	.word 0xecc40400  ! 78: LDSWA_R	ldswa	[%r16, %r0] 0x20, %r22
	.word 0xeccf2000  ! 79: LDSBA_I	ldsba	[%r28, + 0x0000] %asi, %r22
	.word 0xee8f0e80  ! 80: LDUBA_R	lduba	[%r28, %r0] 0x74, %r23
	.word 0xeeaf8e40  ! 81: STBA_R	stba	%r23, [%r30 + %r0] 0x72
	.word 0xe4b7ce80  ! 82: STHA_R	stha	%r18, [%r31 + %r0] 0x74
	.word 0x8780204f  ! 83: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xe4be2000  ! 84: STDA_I	stda	%r18, [%r24 + 0x0000] %asi
	.word 0x87802025  ! 85: WRASI_I	wr	%r0, 0x0025, %asi
	mov	0x58, %r25
	.word 0xea874e60  ! 87: LDUWA_R	lduwa	[%r29, %r0] 0x73, %r21
	ta	T_CHANGE_HPRIV	! macro
	.word 0xe6dc6000  ! 89: LDXA_I	ldxa	[%r17, + 0x0000] %asi, %r19
	mov	0x78, %r18
	mov	0x10, %r18
	.word 0xe4dfce80  ! 92: LDXA_R	ldxa	[%r31, %r0] 0x74, %r18
	.word 0x87802074  ! 93: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0x8780204f  ! 94: WRASI_I	wr	%r0, 0x004f, %asi
	mov	0x78, %r27
	mov	0x7d0, %r20
	.word 0xe0846000  ! 97: LDUWA_I	lduwa	[%r17, + 0x0000] %asi, %r16
	.word 0xe08ca000  ! 98: LDUBA_I	lduba	[%r18, + 0x0000] %asi, %r16
	.word 0xe0d4e000  ! 99: LDSHA_I	ldsha	[%r19, + 0x0000] %asi, %r16
	.word 0xe0bca000  ! 100: STDA_I	stda	%r16, [%r18 + 0x0000] %asi
	.word 0xe0a4a000  ! 101: STWA_I	stwa	%r16, [%r18 + 0x0000] %asi
	.word 0x87802020  ! 102: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0x87802072  ! 103: WRASI_I	wr	%r0, 0x0072, %asi
	mov	0x0, %r19
	.word 0xe08f8e40  ! 105: LDUBA_R	lduba	[%r30, %r0] 0x72, %r16
	.word 0xeacc0400  ! 106: LDSBA_R	ldsba	[%r16, %r0] 0x20, %r21
	mov	0x60, %r25
	.word 0xe6bc4400  ! 108: STDA_R	stda	%r19, [%r17 + %r0] 0x20
	ta	T_CHANGE_PRIV	! macro
	.word 0xe4df4e40  ! 110: LDXA_R	ldxa	[%r29, %r0] 0x72, %r18
	.word 0x87802072  ! 111: WRASI_I	wr	%r0, 0x0072, %asi
	mov	0x40, %r18
	.word 0xeecf0e40  ! 113: LDSBA_R	ldsba	[%r28, %r0] 0x72, %r23
	.word 0xe4c74e60  ! 114: LDSWA_R	ldswa	[%r29, %r0] 0x73, %r18
	.word 0xea8ca000  ! 115: LDUBA_I	lduba	[%r18, + 0x0000] %asi, %r21
	.word 0xe684c400  ! 116: LDUWA_R	lduwa	[%r19, %r0] 0x20, %r19
	.word 0xe88ce000  ! 117: LDUBA_I	lduba	[%r19, + 0x0000] %asi, %r20
	.word 0xe8f46000  ! 118: STXA_I	stxa	%r20, [%r17 + 0x0000] %asi
	.word 0x87802074  ! 119: WRASI_I	wr	%r0, 0x0074, %asi
	mov	0x40, %r26
	.word 0xeebc4400  ! 121: STDA_R	stda	%r23, [%r17 + %r0] 0x20
	mov	0x40, %r27
	.word 0xeaad6000  ! 123: STBA_I	stba	%r21, [%r21 + 0x0000] %asi
	.word 0x87802072  ! 124: WRASI_I	wr	%r0, 0x0072, %asi
	mov	0x68, %r17
	.word 0xea9ee000  ! 126: LDDA_I	ldda	[%r27, + 0x0000] %asi, %r21
	.word 0x87802073  ! 127: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0x87802072  ! 128: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0x87802072  ! 129: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0x87802073  ! 130: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0x87802073  ! 131: WRASI_I	wr	%r0, 0x0073, %asi
	mov	0x58, %r24
	.word 0xea9fe000  ! 133: LDDA_I	ldda	[%r31, + 0x0000] %asi, %r21
	.word 0xea9f2000  ! 134: LDDA_I	ldda	[%r28, + 0x0000] %asi, %r21
	.word 0x8780204f  ! 135: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xeef74e60  ! 136: STXA_R	stxa	%r23, [%r29 + %r0] 0x73
	.word 0xe2a7ce80  ! 137: STWA_R	stwa	%r17, [%r31 + %r0] 0x74
	.word 0xe4cf8e80  ! 138: LDSBA_R	ldsba	[%r30, %r0] 0x74, %r18
	.word 0xeebc8400  ! 139: STDA_R	stda	%r23, [%r18 + %r0] 0x20
	.word 0xec9c2000  ! 140: LDDA_I	ldda	[%r16, + 0x0000] %asi, %r22
	.word 0x87802020  ! 141: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xec9d6000  ! 142: LDDA_I	ldda	[%r21, + 0x0000] %asi, %r22
	mov	0x3e0, %r23
	.word 0x8780204f  ! 144: WRASI_I	wr	%r0, 0x004f, %asi
	mov	0x38, %r17
	mov	0x40, %r24
	.word 0x87802073  ! 147: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0xecb76000  ! 148: STHA_I	stha	%r22, [%r29 + 0x0000] %asi
	.word 0xecb7e000  ! 149: STHA_I	stha	%r22, [%r31 + 0x0000] %asi
	.word 0xecc7a000  ! 150: LDSWA_I	ldswa	[%r30, + 0x0000] %asi, %r22
	mov	0x50, %r17
	.word 0xeaa74e40  ! 152: STWA_R	stwa	%r21, [%r29 + %r0] 0x72
	.word 0xe4872000  ! 153: LDUWA_I	lduwa	[%r28, + 0x0000] %asi, %r18
	mov	0x10, %r24
	.word 0xeccc4400  ! 155: LDSBA_R	ldsba	[%r17, %r0] 0x20, %r22
	.word 0xea872000  ! 156: LDUWA_I	lduwa	[%r28, + 0x0000] %asi, %r21
	.word 0xeac7e000  ! 157: LDSWA_I	ldswa	[%r31, + 0x0000] %asi, %r21
	mov	0x7f0, %r23
	.word 0xeca74e60  ! 159: STWA_R	stwa	%r22, [%r29 + %r0] 0x73
	.word 0x87802020  ! 160: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xeeac6000  ! 161: STBA_I	stba	%r23, [%r17 + 0x0000] %asi
	.word 0x87802020  ! 162: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe0f70e80  ! 163: STXA_R	stxa	%r16, [%r28 + %r0] 0x74
	.word 0x87802072  ! 164: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0xe2ad04a0  ! 165: STBA_R	stba	%r17, [%r20 + %r0] 0x25
	.word 0xe4bf6000  ! 166: STDA_I	stda	%r18, [%r29 + 0x0000] %asi
	.word 0xe48fe000  ! 167: LDUBA_I	lduba	[%r31, + 0x0000] %asi, %r18
	mov	0x3d0, %r20
	.word 0xe097ce60  ! 169: LDUHA_R	lduha	[%r31, %r0] 0x73, %r16
	mov	0x28, %r25
	.word 0xe8c7e000  ! 171: LDSWA_I	ldswa	[%r31, + 0x0000] %asi, %r20
	ta	T_CHANGE_NONPRIV	! macro
	mov	0x7e0, %r22
	mov	0x3e0, %r22
	.word 0xe8976000  ! 175: LDUHA_I	lduha	[%r29, + 0x0000] %asi, %r20
	.word 0x87802020  ! 176: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0x87802020  ! 177: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe8dce000  ! 178: LDXA_I	ldxa	[%r19, + 0x0000] %asi, %r20
	.word 0xe6b7ce60  ! 179: STHA_R	stha	%r19, [%r31 + %r0] 0x73
	.word 0xeabd04a0  ! 180: STDA_R	stda	%r21, [%r20 + %r0] 0x25
	mov	0x7c8, %r23
	mov	0x58, %r18
	.word 0x87802025  ! 183: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0xeabf6000  ! 184: STDA_I	stda	%r21, [%r29 + 0x0000] %asi
	.word 0x87802025  ! 185: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0x87802073  ! 186: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0xea8ca000  ! 187: LDUBA_I	lduba	[%r18, + 0x0000] %asi, %r21
	.word 0x87802072  ! 188: WRASI_I	wr	%r0, 0x0072, %asi
	mov	0x48, %r16
	.word 0xe89f0e40  ! 190: LDDA_R	ldda	[%r28, %r0] 0x72, %r20
	.word 0xe2b5c4a0  ! 191: STHA_R	stha	%r17, [%r23 + %r0] 0x25
	.word 0xe4b6e000  ! 192: STHA_I	stha	%r18, [%r27 + 0x0000] %asi
	.word 0xecb74e80  ! 193: STHA_R	stha	%r22, [%r29 + %r0] 0x74
	mov	0x68, %r18
	mov	0x7d8, %r21
	mov	0x7c0, %r20
	mov	0x10, %r24
	.word 0xe0b66000  ! 198: STHA_I	stha	%r16, [%r25 + 0x0000] %asi
	.word 0xe09ea000  ! 199: LDDA_I	ldda	[%r26, + 0x0000] %asi, %r16
	.word 0xe0f6e000  ! 200: STXA_I	stxa	%r16, [%r27 + 0x0000] %asi
	.word 0xe0dea000  ! 201: LDXA_I	ldxa	[%r26, + 0x0000] %asi, %r16
	mov	0x3f8, %r23
	.word 0x87802072  ! 203: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0xe0bfe000  ! 204: STDA_I	stda	%r16, [%r31 + 0x0000] %asi
	.word 0xe0af6000  ! 205: STBA_I	stba	%r16, [%r29 + 0x0000] %asi
	mov	0x7c0, %r23
	.word 0xe4df4e80  ! 207: LDXA_R	ldxa	[%r29, %r0] 0x74, %r18
	.word 0xec8cc400  ! 208: LDUBA_R	lduba	[%r19, %r0] 0x20, %r22
	.word 0xee9fa000  ! 209: LDDA_I	ldda	[%r30, + 0x0000] %asi, %r23
	.word 0xecbd84a0  ! 210: STDA_R	stda	%r22, [%r22 + %r0] 0x25
	.word 0xe88f6000  ! 211: LDUBA_I	lduba	[%r29, + 0x0000] %asi, %r20
	.word 0xe8afe000  ! 212: STBA_I	stba	%r20, [%r31 + 0x0000] %asi
	.word 0xe8d76000  ! 213: LDSHA_I	ldsha	[%r29, + 0x0000] %asi, %r20
	.word 0xe6ad84a0  ! 214: STBA_R	stba	%r19, [%r22 + %r0] 0x25
	.word 0xeab74e40  ! 215: STHA_R	stha	%r21, [%r29 + %r0] 0x72
	.word 0x87802073  ! 216: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0xe4ac8400  ! 217: STBA_R	stba	%r18, [%r18 + %r0] 0x20
	mov	0x30, %r25
	.word 0xe2ac6000  ! 219: STBA_I	stba	%r17, [%r17 + 0x0000] %asi
	.word 0x87802073  ! 220: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0xe2b66000  ! 221: STHA_I	stha	%r17, [%r25 + 0x0000] %asi
	mov	0x0, %r27
	mov	0x60, %r25
	mov	0x7c8, %r21
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xe2a66000  ! 226: STWA_I	stwa	%r17, [%r25 + 0x0000] %asi
	mov	0x3f0, %r22
	.word 0x87802074  ! 228: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0xe48f0e80  ! 229: LDUBA_R	lduba	[%r28, %r0] 0x74, %r18
	.word 0x87802074  ! 230: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0xe2afa000  ! 231: STBA_I	stba	%r17, [%r30 + 0x0000] %asi
	.word 0xe8a584a0  ! 232: STWA_R	stwa	%r20, [%r22 + %r0] 0x25
	.word 0x87802025  ! 233: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0xe8af6000  ! 234: STBA_I	stba	%r20, [%r29 + 0x0000] %asi
	mov	0x28, %r27
	.word 0xe684c400  ! 236: LDUWA_R	lduwa	[%r19, %r0] 0x20, %r19
	.word 0xe6f6c9e0  ! 237: STXA_R	stxa	%r19, [%r27 + %r0] 0x4f
	.word 0xeeb48400  ! 238: STHA_R	stha	%r23, [%r18 + %r0] 0x20
	.word 0x87802020  ! 239: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe2d76000  ! 240: LDSHA_I	ldsha	[%r29, + 0x0000] %asi, %r17
	.word 0xecd74e80  ! 241: LDSHA_R	ldsha	[%r29, %r0] 0x74, %r22
	.word 0xee9e49e0  ! 242: LDDA_R	ldda	[%r25, %r0] 0x4f, %r23
	.word 0xeca7e000  ! 243: STWA_I	stwa	%r22, [%r31 + 0x0000] %asi
	.word 0xe2c74e40  ! 244: LDSWA_R	ldswa	[%r29, %r0] 0x72, %r17
	mov	0x18, %r27
	mov	0x8, %r24
	.word 0xe0a78e80  ! 247: STWA_R	stwa	%r16, [%r30 + %r0] 0x74
	.word 0xe884c400  ! 248: LDUWA_R	lduwa	[%r19, %r0] 0x20, %r20
	.word 0xee970e40  ! 249: LDUHA_R	lduha	[%r28, %r0] 0x72, %r23
	.word 0x87802072  ! 250: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0xe2bd04a0  ! 251: STDA_R	stda	%r17, [%r20 + %r0] 0x25
	.word 0xeabfa000  ! 252: STDA_I	stda	%r21, [%r30 + 0x0000] %asi
	mov	0x8, %r18
	mov	0x3d0, %r22
	mov	0x40, %r17
	.word 0xee97ce60  ! 256: LDUHA_R	lduha	[%r31, %r0] 0x73, %r23
	.word 0xe0a4c400  ! 257: STWA_R	stwa	%r16, [%r19 + %r0] 0x20
	.word 0xe8df2000  ! 258: LDXA_I	ldxa	[%r28, + 0x0000] %asi, %r20
	.word 0xeab48400  ! 259: STHA_R	stha	%r21, [%r18 + %r0] 0x20
	.word 0xec8cc400  ! 260: LDUBA_R	lduba	[%r19, %r0] 0x20, %r22
	mov	0x70, %r19
	.word 0xeab7a000  ! 262: STHA_I	stha	%r21, [%r30 + 0x0000] %asi
	.word 0xe2f649e0  ! 263: STXA_R	stxa	%r17, [%r25 + %r0] 0x4f
	.word 0xe2b7a000  ! 264: STHA_I	stha	%r17, [%r30 + 0x0000] %asi
	.word 0xe2f7a000  ! 265: STXA_I	stxa	%r17, [%r30 + 0x0000] %asi
	.word 0xe2d7e000  ! 266: LDSHA_I	ldsha	[%r31, + 0x0000] %asi, %r17
	.word 0xe2bfe000  ! 267: STDA_I	stda	%r17, [%r31 + 0x0000] %asi
	mov	0x3d8, %r20
	.word 0xe2bf2000  ! 269: STDA_I	stda	%r17, [%r28 + 0x0000] %asi
	.word 0xe2b76000  ! 270: STHA_I	stha	%r17, [%r29 + 0x0000] %asi
	.word 0x87802020  ! 271: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe287e000  ! 272: LDUWA_I	lduwa	[%r31, + 0x0000] %asi, %r17
	.word 0x87802074  ! 273: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0x87802020  ! 274: WRASI_I	wr	%r0, 0x0020, %asi
	mov	0x7c0, %r21
	.word 0xe8f70e60  ! 276: STXA_R	stxa	%r20, [%r28 + %r0] 0x73
	.word 0xee9f4e40  ! 277: LDDA_R	ldda	[%r29, %r0] 0x72, %r23
	.word 0xe2d56000  ! 278: LDSHA_I	ldsha	[%r21, + 0x0000] %asi, %r17
	.word 0xeca4c400  ! 279: STWA_R	stwa	%r22, [%r19 + %r0] 0x20
	mov	0x30, %r27
	.word 0xeaf52000  ! 281: STXA_I	stxa	%r21, [%r20 + 0x0000] %asi
	.word 0xeabd6000  ! 282: STDA_I	stda	%r21, [%r21 + 0x0000] %asi
	mov	0x3f0, %r21
	.word 0xe2de49e0  ! 284: LDXA_R	ldxa	[%r25, %r0] 0x4f, %r17
	mov	0x60, %r18
	.word 0xe8f56000  ! 286: STXA_I	stxa	%r20, [%r21 + 0x0000] %asi
	.word 0xe8a52000  ! 287: STWA_I	stwa	%r20, [%r20 + 0x0000] %asi
	.word 0xe8870e80  ! 288: LDUWA_R	lduwa	[%r28, %r0] 0x74, %r20
	.word 0xe0ad2000  ! 289: STBA_I	stba	%r16, [%r20 + 0x0000] %asi
	.word 0x87802020  ! 290: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xecad44a0  ! 291: STBA_R	stba	%r22, [%r21 + %r0] 0x25
	mov	0x10, %r17
	.word 0xe8dfa000  ! 293: LDXA_I	ldxa	[%r30, + 0x0000] %asi, %r20
	mov	0x28, %r27
	.word 0xe4870e60  ! 295: LDUWA_R	lduwa	[%r28, %r0] 0x73, %r18
	.word 0xecd74e40  ! 296: LDSHA_R	ldsha	[%r29, %r0] 0x72, %r22
	.word 0xeedfa000  ! 297: LDXA_I	ldxa	[%r30, + 0x0000] %asi, %r23
	.word 0xecb48400  ! 298: STHA_R	stha	%r22, [%r18 + %r0] 0x20
	.word 0xe29dc4a0  ! 299: LDDA_R	ldda	[%r23, %r0] 0x25, %r17
	.word 0xeed649e0  ! 300: LDSHA_R	ldsha	[%r25, %r0] 0x4f, %r23
	.word 0x87802073  ! 301: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0xec96e000  ! 302: LDUHA_I	lduha	[%r27, + 0x0000] %asi, %r22
	.word 0xecaee000  ! 303: STBA_I	stba	%r22, [%r27 + 0x0000] %asi
	.word 0xecb66000  ! 304: STHA_I	stha	%r22, [%r25 + 0x0000] %asi
	mov	0x48, %r18
	mov	0x3d0, %r23
	.word 0xec8e6000  ! 307: LDUBA_I	lduba	[%r25, + 0x0000] %asi, %r22
	mov	0x70, %r24
	.word 0xecde6000  ! 309: LDXA_I	ldxa	[%r25, + 0x0000] %asi, %r22
	.word 0xecc6a000  ! 310: LDSWA_I	ldswa	[%r26, + 0x0000] %asi, %r22
	mov	0x18, %r27
	.word 0xe2a78e80  ! 312: STWA_R	stwa	%r17, [%r30 + %r0] 0x74
	.word 0xec97ce60  ! 313: LDUHA_R	lduha	[%r31, %r0] 0x73, %r22
	.word 0xe6a6e000  ! 314: STWA_I	stwa	%r19, [%r27 + 0x0000] %asi
	.word 0x8780204f  ! 315: WRASI_I	wr	%r0, 0x004f, %asi
	mov	0x60, %r25
	.word 0xee87ce60  ! 317: LDUWA_R	lduwa	[%r31, %r0] 0x73, %r23
	mov	0x50, %r16
	mov	0x38, %r27
	.word 0xecbfa000  ! 320: STDA_I	stda	%r22, [%r30 + 0x0000] %asi
	mov	0x20, %r19
	.word 0xec8f0e40  ! 322: LDUBA_R	lduba	[%r28, %r0] 0x72, %r22
	.word 0xecde09e0  ! 323: LDXA_R	ldxa	[%r24, %r0] 0x4f, %r22
	.word 0xeaa70e80  ! 324: STWA_R	stwa	%r21, [%r28 + %r0] 0x74
	mov	0x20, %r19
	.word 0xe0b78e60  ! 326: STHA_R	stha	%r16, [%r30 + %r0] 0x73
	.word 0xe2dfe000  ! 327: LDXA_I	ldxa	[%r31, + 0x0000] %asi, %r17
	mov	0x60, %r18
	mov	0x70, %r18
	.word 0xe28f0e80  ! 330: LDUBA_R	lduba	[%r28, %r0] 0x74, %r17
	mov	0x38, %r17
	mov	0x50, %r26
	ta	T_CHANGE_NONHPRIV	! macro
	mov	0x7d0, %r21
	.word 0xeaa76000  ! 335: STWA_I	stwa	%r21, [%r29 + 0x0000] %asi
	.word 0x87802020  ! 336: WRASI_I	wr	%r0, 0x0020, %asi
	mov	0x38, %r19
	.word 0xecac4400  ! 338: STBA_R	stba	%r22, [%r17 + %r0] 0x20
	mov	0x20, %r18
	.word 0xea848400  ! 340: LDUWA_R	lduwa	[%r18, %r0] 0x20, %r21
	.word 0xe69f6000  ! 341: LDDA_I	ldda	[%r29, + 0x0000] %asi, %r19
	.word 0xe6cf4e80  ! 342: LDSBA_R	ldsba	[%r29, %r0] 0x74, %r19
	.word 0xeeb74e80  ! 343: STHA_R	stha	%r23, [%r29 + %r0] 0x74
	.word 0xe687ce60  ! 344: LDUWA_R	lduwa	[%r31, %r0] 0x73, %r19
	.word 0x87802074  ! 345: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0xea84c400  ! 346: LDUWA_R	lduwa	[%r19, %r0] 0x20, %r21
	.word 0xecb7a000  ! 347: STHA_I	stha	%r22, [%r30 + 0x0000] %asi
	.word 0xecc72000  ! 348: LDSWA_I	ldswa	[%r28, + 0x0000] %asi, %r22
	.word 0xeef44400  ! 349: STXA_R	stxa	%r23, [%r17 + %r0] 0x20
	mov	0x68, %r18
	.word 0xeab649e0  ! 351: STHA_R	stha	%r21, [%r25 + %r0] 0x4f
	.word 0xeea689e0  ! 352: STWA_R	stwa	%r23, [%r26 + %r0] 0x4f
	mov	0x10, %r24
	.word 0xe4a76000  ! 354: STWA_I	stwa	%r18, [%r29 + 0x0000] %asi
	.word 0xecd74e40  ! 355: LDSHA_R	ldsha	[%r29, %r0] 0x72, %r22
	mov	0x7f0, %r23
	.word 0xe49c8400  ! 357: LDDA_R	ldda	[%r18, %r0] 0x20, %r18
	.word 0xe4b7ce60  ! 358: STHA_R	stha	%r18, [%r31 + %r0] 0x73
	.word 0xeabf2000  ! 359: STDA_I	stda	%r21, [%r28 + 0x0000] %asi
	mov	0x7c0, %r20
	.word 0xeaa72000  ! 361: STWA_I	stwa	%r21, [%r28 + 0x0000] %asi
	.word 0x8780204f  ! 362: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0x8780204f  ! 363: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xeea5c4a0  ! 364: STWA_R	stwa	%r23, [%r23 + %r0] 0x25
	.word 0xe69cc400  ! 365: LDDA_R	ldda	[%r19, %r0] 0x20, %r19
	mov	0x7f8, %r23
	.word 0xeab76000  ! 367: STHA_I	stha	%r21, [%r29 + 0x0000] %asi
	mov	0x7f8, %r21
	.word 0xea97e000  ! 369: LDUHA_I	lduha	[%r31, + 0x0000] %asi, %r21
	.word 0xe6c504a0  ! 370: LDSWA_R	ldswa	[%r20, %r0] 0x25, %r19
	.word 0xe8b584a0  ! 371: STHA_R	stha	%r20, [%r22 + %r0] 0x25
	.word 0xe88f6000  ! 372: LDUBA_I	lduba	[%r29, + 0x0000] %asi, %r20
	mov	0x7d0, %r20
	.word 0xe887e000  ! 374: LDUWA_I	lduwa	[%r31, + 0x0000] %asi, %r20
	.word 0xe2948400  ! 375: LDUHA_R	lduha	[%r18, %r0] 0x20, %r17
	.word 0x87802020  ! 376: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xeaae89e0  ! 377: STBA_R	stba	%r21, [%r26 + %r0] 0x4f
	mov	0x28, %r25
	.word 0xeab609e0  ! 379: STHA_R	stha	%r21, [%r24 + %r0] 0x4f
	.word 0xe2af6000  ! 380: STBA_I	stba	%r17, [%r29 + 0x0000] %asi
	.word 0xeeaec9e0  ! 381: STBA_R	stba	%r23, [%r27 + %r0] 0x4f
	.word 0xe4876000  ! 382: LDUWA_I	lduwa	[%r29, + 0x0000] %asi, %r18
	.word 0xeaf40400  ! 383: STXA_R	stxa	%r21, [%r16 + %r0] 0x20
	.word 0xe8bfce60  ! 384: STDA_R	stda	%r20, [%r31 + %r0] 0x73
	.word 0xe8cf2000  ! 385: LDSBA_I	ldsba	[%r28, + 0x0000] %asi, %r20
	.word 0xe2dd44a0  ! 386: LDXA_R	ldxa	[%r21, %r0] 0x25, %r17
	mov	0x3d8, %r21
	.word 0x87802074  ! 388: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0xea9c2000  ! 389: LDDA_I	ldda	[%r16, + 0x0000] %asi, %r21
	mov	0x78, %r19
	.word 0xeabca000  ! 391: STDA_I	stda	%r21, [%r18 + 0x0000] %asi
	.word 0xeaa46000  ! 392: STWA_I	stwa	%r21, [%r17 + 0x0000] %asi
	.word 0x87802074  ! 393: WRASI_I	wr	%r0, 0x0074, %asi
	mov	0x48, %r25
	.word 0x87802020  ! 395: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe0dd44a0  ! 396: LDXA_R	ldxa	[%r21, %r0] 0x25, %r16
	.word 0xe4f7a000  ! 397: STXA_I	stxa	%r18, [%r30 + 0x0000] %asi
	.word 0x87802072  ! 398: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0xe2c70e40  ! 399: LDSWA_R	ldswa	[%r28, %r0] 0x72, %r17
	mov	0x58, %r17
	mov	0x60, %r24
	.word 0xe0b74e40  ! 402: STHA_R	stha	%r16, [%r29 + %r0] 0x72
	.word 0xe88fa000  ! 403: LDUBA_I	lduba	[%r30, + 0x0000] %asi, %r20
	mov	0x3f0, %r20
	.word 0xe2f649e0  ! 405: STXA_R	stxa	%r17, [%r25 + %r0] 0x4f
	.word 0x8780204f  ! 406: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xe2c7e000  ! 407: LDSWA_I	ldswa	[%r31, + 0x0000] %asi, %r17
	mov	0x7c0, %r21
	.word 0xeeac8400  ! 409: STBA_R	stba	%r23, [%r18 + %r0] 0x20
	.word 0xe6b504a0  ! 410: STHA_R	stha	%r19, [%r20 + %r0] 0x25
	mov	0x3f0, %r22
	.word 0xe8d7a000  ! 412: LDSHA_I	ldsha	[%r30, + 0x0000] %asi, %r20
	mov	0x3e8, %r20
	mov	0x70, %r16
	.word 0xe8afa000  ! 415: STBA_I	stba	%r20, [%r30 + 0x0000] %asi
	.word 0xea8f8e60  ! 416: LDUBA_R	lduba	[%r30, %r0] 0x73, %r21
	.word 0xecb689e0  ! 417: STHA_R	stha	%r22, [%r26 + %r0] 0x4f
	mov	0x7e0, %r23
	mov	0x0, %r25
	.word 0xe4876000  ! 420: LDUWA_I	lduwa	[%r29, + 0x0000] %asi, %r18
	.word 0xe4b72000  ! 421: STHA_I	stha	%r18, [%r28 + 0x0000] %asi
	.word 0xe4df2000  ! 422: LDXA_I	ldxa	[%r28, + 0x0000] %asi, %r18
	mov	0x58, %r25
	mov	0x8, %r25
	.word 0xe484c400  ! 425: LDUWA_R	lduwa	[%r19, %r0] 0x20, %r18
	.word 0xe687e000  ! 426: LDUWA_I	lduwa	[%r31, + 0x0000] %asi, %r19
	.word 0xeedfce80  ! 427: LDXA_R	ldxa	[%r31, %r0] 0x74, %r23
	.word 0x87802072  ! 428: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0xe8a72000  ! 429: STWA_I	stwa	%r20, [%r28 + 0x0000] %asi
	.word 0x87802020  ! 430: WRASI_I	wr	%r0, 0x0020, %asi
	mov	0x10, %r18
	.word 0xe0a689e0  ! 432: STWA_R	stwa	%r16, [%r26 + %r0] 0x4f
	.word 0xe69cc400  ! 433: LDDA_R	ldda	[%r19, %r0] 0x20, %r19
	.word 0xe0874e60  ! 434: LDUWA_R	lduwa	[%r29, %r0] 0x73, %r16
	.word 0x87802073  ! 435: WRASI_I	wr	%r0, 0x0073, %asi
	mov	0x18, %r24
	.word 0xe2c4c400  ! 437: LDSWA_R	ldswa	[%r19, %r0] 0x20, %r17
	.word 0xeea74e40  ! 438: STWA_R	stwa	%r23, [%r29 + %r0] 0x72
	mov	0x7e8, %r23
	.word 0xe0ae09e0  ! 440: STBA_R	stba	%r16, [%r24 + %r0] 0x4f
	.word 0xe4d689e0  ! 441: LDSHA_R	ldsha	[%r26, %r0] 0x4f, %r18
	mov	0x7d8, %r23
	.word 0x87802072  ! 443: WRASI_I	wr	%r0, 0x0072, %asi
	mov	0x3d0, %r21
	.word 0xe8cfa000  ! 445: LDSBA_I	ldsba	[%r30, + 0x0000] %asi, %r20
	mov	0x3c0, %r22
	mov	0x68, %r25
	.word 0xe6dfce40  ! 448: LDXA_R	ldxa	[%r31, %r0] 0x72, %r19
	.word 0xe2bfa000  ! 449: STDA_I	stda	%r17, [%r30 + 0x0000] %asi
	.word 0xe2a7ce80  ! 450: STWA_R	stwa	%r17, [%r31 + %r0] 0x74
	mov	0x7c0, %r20
	.word 0xe6c72000  ! 452: LDSWA_I	ldswa	[%r28, + 0x0000] %asi, %r19
	mov	0x18, %r19
	.word 0xe6afa000  ! 454: STBA_I	stba	%r19, [%r30 + 0x0000] %asi
	.word 0xe6df2000  ! 455: LDXA_I	ldxa	[%r28, + 0x0000] %asi, %r19
	.word 0x87802072  ! 456: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0xe89fce40  ! 457: LDDA_R	ldda	[%r31, %r0] 0x72, %r20
	mov	0x18, %r18
	.word 0xe2d66000  ! 459: LDSHA_I	ldsha	[%r25, + 0x0000] %asi, %r17
	.word 0xecb70e60  ! 460: STHA_R	stha	%r22, [%r28 + %r0] 0x73
	.word 0xe4cf4e40  ! 461: LDSBA_R	ldsba	[%r29, %r0] 0x72, %r18
	.word 0xe8874e40  ! 462: LDUWA_R	lduwa	[%r29, %r0] 0x72, %r20
	.word 0xead6e000  ! 463: LDSHA_I	ldsha	[%r27, + 0x0000] %asi, %r21
	.word 0xeab62000  ! 464: STHA_I	stha	%r21, [%r24 + 0x0000] %asi
	.word 0xeed504a0  ! 465: LDSHA_R	ldsha	[%r20, %r0] 0x25, %r23
	.word 0xe0a6a000  ! 466: STWA_I	stwa	%r16, [%r26 + 0x0000] %asi
	mov	0x10, %r16
	mov	0x7f8, %r23
	.word 0x87802072  ! 469: WRASI_I	wr	%r0, 0x0072, %asi
	mov	0x7d8, %r23
	.word 0xeaa78e40  ! 471: STWA_R	stwa	%r21, [%r30 + %r0] 0x72
	mov	0x3e0, %r23
	.word 0xe2d70e40  ! 473: LDSHA_R	ldsha	[%r28, %r0] 0x72, %r17
	mov	0x28, %r27
	mov	0x10, %r16
	mov	0x18, %r18
	mov	0x40, %r18
	mov	0x50, %r16
	.word 0xeaae09e0  ! 479: STBA_R	stba	%r21, [%r24 + %r0] 0x4f
	.word 0xe6f5c4a0  ! 480: STXA_R	stxa	%r19, [%r23 + %r0] 0x25
	.word 0xe0956000  ! 481: LDUHA_I	lduha	[%r21, + 0x0000] %asi, %r16
	.word 0xe0856000  ! 482: LDUWA_I	lduwa	[%r21, + 0x0000] %asi, %r16
	.word 0xec9cc400  ! 483: LDDA_R	ldda	[%r19, %r0] 0x20, %r22
	.word 0xecac8400  ! 484: STBA_R	stba	%r22, [%r18 + %r0] 0x20
	.word 0xe8a70e40  ! 485: STWA_R	stwa	%r20, [%r28 + %r0] 0x72
	.word 0xe0a689e0  ! 486: STWA_R	stwa	%r16, [%r26 + %r0] 0x4f
	.word 0xeca5e000  ! 487: STWA_I	stwa	%r22, [%r23 + 0x0000] %asi
	.word 0xecafce80  ! 488: STBA_R	stba	%r22, [%r31 + %r0] 0x74
	mov	0x3e0, %r22
	.word 0xe2f52000  ! 490: STXA_I	stxa	%r17, [%r20 + 0x0000] %asi
	.word 0xe2bda000  ! 491: STDA_I	stda	%r17, [%r22 + 0x0000] %asi
	mov	0x28, %r16
	.word 0xeabe09e0  ! 493: STDA_R	stda	%r21, [%r24 + %r0] 0x4f
	mov	0x70, %r19
	.word 0xe497ce40  ! 495: LDUHA_R	lduha	[%r31, %r0] 0x72, %r18
	.word 0xeed70e60  ! 496: LDSHA_R	ldsha	[%r28, %r0] 0x73, %r23
	mov	0x50, %r18
	.word 0xe69dc4a0  ! 498: LDDA_R	ldda	[%r23, %r0] 0x25, %r19
	.word 0x87802073  ! 499: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0xe6a4e000  ! 500: STWA_I	stwa	%r19, [%r19 + 0x0000] %asi
	.word 0xe2f7ce60  ! 501: STXA_R	stxa	%r17, [%r31 + %r0] 0x73
	.word 0x87802025  ! 502: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0x87802020  ! 503: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0x87802073  ! 504: WRASI_I	wr	%r0, 0x0073, %asi
	mov	0x58, %r18
	mov	0x40, %r24
	.word 0x87802072  ! 507: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0x87802020  ! 508: WRASI_I	wr	%r0, 0x0020, %asi
	mov	0x20, %r26
	.word 0x87802020  ! 510: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe2b66000  ! 511: STHA_I	stha	%r17, [%r25 + 0x0000] %asi
	mov	0x78, %r19
	.word 0xe2c6a000  ! 513: LDSWA_I	ldswa	[%r26, + 0x0000] %asi, %r17
	.word 0xe6cf0e60  ! 514: LDSBA_R	ldsba	[%r28, %r0] 0x73, %r19
	.word 0xe2d6a000  ! 515: LDSHA_I	ldsha	[%r26, + 0x0000] %asi, %r17
	mov	0x3d0, %r21
	.word 0xe2be6000  ! 517: STDA_I	stda	%r17, [%r25 + 0x0000] %asi
	.word 0xe2de6000  ! 518: LDXA_I	ldxa	[%r25, + 0x0000] %asi, %r17
	.word 0x87802025  ! 519: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0xe2af6000  ! 520: STBA_I	stba	%r17, [%r29 + 0x0000] %asi
	.word 0xe2cfa000  ! 521: LDSBA_I	ldsba	[%r30, + 0x0000] %asi, %r17
	.word 0xe6aec9e0  ! 522: STBA_R	stba	%r19, [%r27 + %r0] 0x4f
	.word 0xeadf6000  ! 523: LDXA_I	ldxa	[%r29, + 0x0000] %asi, %r21
	mov	0x58, %r26
	mov	0x78, %r25
	.word 0x87802020  ! 526: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe0f609e0  ! 527: STXA_R	stxa	%r16, [%r24 + %r0] 0x4f
	.word 0xeabe2000  ! 528: STDA_I	stda	%r21, [%r24 + 0x0000] %asi
	.word 0x87802020  ! 529: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xea976000  ! 530: LDUHA_I	lduha	[%r29, + 0x0000] %asi, %r21
	.word 0xec8e09e0  ! 531: LDUBA_R	lduba	[%r24, %r0] 0x4f, %r22
	.word 0xe4f74e40  ! 532: STXA_R	stxa	%r18, [%r29 + %r0] 0x72
	.word 0xec9f2000  ! 533: LDDA_I	ldda	[%r28, + 0x0000] %asi, %r22
	.word 0xe2be09e0  ! 534: STDA_R	stda	%r17, [%r24 + %r0] 0x4f
	.word 0xe8a76000  ! 535: STWA_I	stwa	%r20, [%r29 + 0x0000] %asi
	.word 0xe0dd44a0  ! 536: LDXA_R	ldxa	[%r21, %r0] 0x25, %r16
	.word 0x87802073  ! 537: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0x87802072  ! 538: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0xee9fa000  ! 539: LDDA_I	ldda	[%r30, + 0x0000] %asi, %r23
	mov	0x3d8, %r23
	mov	0x18, %r18
	.word 0xeecfa000  ! 542: LDSBA_I	ldsba	[%r30, + 0x0000] %asi, %r23
	mov	0x7c0, %r21
	.word 0xeed76000  ! 544: LDSHA_I	ldsha	[%r29, + 0x0000] %asi, %r23
	.word 0xeed76000  ! 545: LDSHA_I	ldsha	[%r29, + 0x0000] %asi, %r23
	.word 0xecf78e80  ! 546: STXA_R	stxa	%r22, [%r30 + %r0] 0x74
	.word 0xe0b70e40  ! 547: STHA_R	stha	%r16, [%r28 + %r0] 0x72
	mov	0x7d0, %r21
	.word 0xeef70e40  ! 549: STXA_R	stxa	%r23, [%r28 + %r0] 0x72
	.word 0xe0bc0400  ! 550: STDA_R	stda	%r16, [%r16 + %r0] 0x20
	mov	0x68, %r18
	.word 0xe6a78e60  ! 552: STWA_R	stwa	%r19, [%r30 + %r0] 0x73
	.word 0x87802025  ! 553: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0xe2bd6000  ! 554: STDA_I	stda	%r17, [%r21 + 0x0000] %asi
	.word 0xe2ad6000  ! 555: STBA_I	stba	%r17, [%r21 + 0x0000] %asi
	.word 0xe295e000  ! 556: LDUHA_I	lduha	[%r23, + 0x0000] %asi, %r17
	.word 0xe2cd6000  ! 557: LDSBA_I	ldsba	[%r21, + 0x0000] %asi, %r17
	.word 0xe2852000  ! 558: LDUWA_I	lduwa	[%r20, + 0x0000] %asi, %r17
	.word 0xe28da000  ! 559: LDUBA_I	lduba	[%r22, + 0x0000] %asi, %r17
	ta	T_CHANGE_PRIV	! macro
	.word 0xeca649e0  ! 561: STWA_R	stwa	%r22, [%r25 + %r0] 0x4f
	.word 0xee9cc400  ! 562: LDDA_R	ldda	[%r19, %r0] 0x20, %r23
	mov	0x20, %r24
	.word 0xeec5e000  ! 564: LDSWA_I	ldswa	[%r23, + 0x0000] %asi, %r23
	mov	0x70, %r18
	.word 0xea8cc400  ! 566: LDUBA_R	lduba	[%r19, %r0] 0x20, %r21
	mov	0x38, %r26
	.word 0x8780204f  ! 568: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0x87802074  ! 569: WRASI_I	wr	%r0, 0x0074, %asi
	mov	0x20, %r26
	.word 0xea97ce60  ! 571: LDUHA_R	lduha	[%r31, %r0] 0x73, %r21
	mov	0x7f0, %r21
	mov	0x50, %r16
	.word 0xeccf2000  ! 574: LDSBA_I	ldsba	[%r28, + 0x0000] %asi, %r22
	.word 0xecb7e000  ! 575: STHA_I	stha	%r22, [%r31 + 0x0000] %asi
	mov	0x40, %r25
	mov	0x7c8, %r21
	.word 0xe6b689e0  ! 578: STHA_R	stha	%r19, [%r26 + %r0] 0x4f
	.word 0xeaf72000  ! 579: STXA_I	stxa	%r21, [%r28 + 0x0000] %asi
	.word 0xeef609e0  ! 580: STXA_R	stxa	%r23, [%r24 + %r0] 0x4f
	.word 0xe0dd04a0  ! 581: LDXA_R	ldxa	[%r20, %r0] 0x25, %r16
	.word 0xe0bfce40  ! 582: STDA_R	stda	%r16, [%r31 + %r0] 0x72
	.word 0xeab72000  ! 583: STHA_I	stha	%r21, [%r28 + 0x0000] %asi
	.word 0xeacd84a0  ! 584: LDSBA_R	ldsba	[%r22, %r0] 0x25, %r21
	.word 0xeca74e80  ! 585: STWA_R	stwa	%r22, [%r29 + %r0] 0x74
	mov	0x48, %r18
	mov	0x30, %r26
	.word 0xe6bf2000  ! 588: STDA_I	stda	%r19, [%r28 + 0x0000] %asi
	.word 0x87802020  ! 589: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe2de09e0  ! 590: LDXA_R	ldxa	[%r24, %r0] 0x4f, %r17
	.word 0xe8de6000  ! 591: LDXA_I	ldxa	[%r25, + 0x0000] %asi, %r20
	.word 0xe8b66000  ! 592: STHA_I	stha	%r20, [%r25 + 0x0000] %asi
	.word 0x87802072  ! 593: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0x87802074  ! 594: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0xe4af4e60  ! 595: STBA_R	stba	%r18, [%r29 + %r0] 0x73
	mov	0x7d8, %r21
	mov	0x38, %r27
	.word 0xecb544a0  ! 598: STHA_R	stha	%r22, [%r21 + %r0] 0x25
	.word 0xe09f8e60  ! 599: LDDA_R	ldda	[%r30, %r0] 0x73, %r16
	.word 0xe8ae89e0  ! 600: STBA_R	stba	%r20, [%r26 + %r0] 0x4f
	.word 0x8780204f  ! 601: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xe4cc4400  ! 602: LDSBA_R	ldsba	[%r17, %r0] 0x20, %r18
	mov	0x78, %r25
	.word 0xe4f74e80  ! 604: STXA_R	stxa	%r18, [%r29 + %r0] 0x74
	.word 0xecad44a0  ! 605: STBA_R	stba	%r22, [%r21 + %r0] 0x25
	.word 0xe2b7a000  ! 606: STHA_I	stha	%r17, [%r30 + 0x0000] %asi
	.word 0xe2d76000  ! 607: LDSHA_I	ldsha	[%r29, + 0x0000] %asi, %r17
	.word 0x87802073  ! 608: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0xecb70e60  ! 609: STHA_R	stha	%r22, [%r28 + %r0] 0x73
	.word 0xe4de6000  ! 610: LDXA_I	ldxa	[%r25, + 0x0000] %asi, %r18
	.word 0xea8c8400  ! 611: LDUBA_R	lduba	[%r18, %r0] 0x20, %r21
	.word 0xea870e40  ! 612: LDUWA_R	lduwa	[%r28, %r0] 0x72, %r21
	.word 0xea8d84a0  ! 613: LDUBA_R	lduba	[%r22, %r0] 0x25, %r21
	mov	0x20, %r24
	.word 0xe4be2000  ! 615: STDA_I	stda	%r18, [%r24 + 0x0000] %asi
	.word 0xe4f6e000  ! 616: STXA_I	stxa	%r18, [%r27 + 0x0000] %asi
	mov	0x20, %r17
	.word 0xe8cf0e60  ! 618: LDSBA_R	ldsba	[%r28, %r0] 0x73, %r20
	.word 0xe2d6a000  ! 619: LDSHA_I	ldsha	[%r26, + 0x0000] %asi, %r17
	mov	0x8, %r19
	.word 0x87802025  ! 621: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0x8780204f  ! 622: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0x87802074  ! 623: WRASI_I	wr	%r0, 0x0074, %asi
	mov	0x7f8, %r20
	.word 0xe2972000  ! 625: LDUHA_I	lduha	[%r28, + 0x0000] %asi, %r17
	.word 0xe0f7ce40  ! 626: STXA_R	stxa	%r16, [%r31 + %r0] 0x72
	.word 0xeede49e0  ! 627: LDXA_R	ldxa	[%r25, %r0] 0x4f, %r23
	mov	0x18, %r19
	.word 0xe6cfe000  ! 629: LDSBA_I	ldsba	[%r31, + 0x0000] %asi, %r19
	.word 0xe6bf2000  ! 630: STDA_I	stda	%r19, [%r28 + 0x0000] %asi
	.word 0xe68f2000  ! 631: LDUBA_I	lduba	[%r28, + 0x0000] %asi, %r19
	.word 0xe6f72000  ! 632: STXA_I	stxa	%r19, [%r28 + 0x0000] %asi
	.word 0xe6f7e000  ! 633: STXA_I	stxa	%r19, [%r31 + 0x0000] %asi
	.word 0xe6f72000  ! 634: STXA_I	stxa	%r19, [%r28 + 0x0000] %asi
	.word 0xe2d4c400  ! 635: LDSHA_R	ldsha	[%r19, %r0] 0x20, %r17
	mov	0x0, %r19
	mov	0x60, %r27
	mov	0x30, %r25
	.word 0xee97e000  ! 639: LDUHA_I	lduha	[%r31, + 0x0000] %asi, %r23
	.word 0xeea72000  ! 640: STWA_I	stwa	%r23, [%r28 + 0x0000] %asi
	.word 0xee97e000  ! 641: LDUHA_I	lduha	[%r31, + 0x0000] %asi, %r23
	mov	0x7d8, %r22
	.word 0xe8d70e40  ! 643: LDSHA_R	ldsha	[%r28, %r0] 0x72, %r20
	.word 0x87802020  ! 644: WRASI_I	wr	%r0, 0x0020, %asi
	mov	0x3f8, %r23
	.word 0xe4bf8e40  ! 646: STDA_R	stda	%r18, [%r30 + %r0] 0x72
	.word 0xe0c609e0  ! 647: LDSWA_R	ldswa	[%r24, %r0] 0x4f, %r16
	.word 0xecd72000  ! 648: LDSHA_I	ldsha	[%r28, + 0x0000] %asi, %r22
	.word 0xecafa000  ! 649: STBA_I	stba	%r22, [%r30 + 0x0000] %asi
	.word 0xeccf2000  ! 650: LDSBA_I	ldsba	[%r28, + 0x0000] %asi, %r22
	.word 0xe4b78e60  ! 651: STHA_R	stha	%r18, [%r30 + %r0] 0x73
	.word 0xe4afe000  ! 652: STBA_I	stba	%r18, [%r31 + 0x0000] %asi
	.word 0xe2d7ce40  ! 653: LDSHA_R	ldsha	[%r31, %r0] 0x72, %r17
	.word 0xecc72000  ! 654: LDSWA_I	ldswa	[%r28, + 0x0000] %asi, %r22
	.word 0xecbfe000  ! 655: STDA_I	stda	%r22, [%r31 + 0x0000] %asi
	mov	0x8, %r18
	.word 0xecf72000  ! 657: STXA_I	stxa	%r22, [%r28 + 0x0000] %asi
	.word 0x87802073  ! 658: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0x87802072  ! 659: WRASI_I	wr	%r0, 0x0072, %asi
	mov	0x68, %r18
	mov	0x58, %r24
	mov	0x28, %r17
	.word 0xeac70e60  ! 663: LDSWA_R	ldswa	[%r28, %r0] 0x73, %r21
	.word 0xe29f0e40  ! 664: LDDA_R	ldda	[%r28, %r0] 0x72, %r17
	.word 0xecb74e80  ! 665: STHA_R	stha	%r22, [%r29 + %r0] 0x74
	.word 0xe8df2000  ! 666: LDXA_I	ldxa	[%r28, + 0x0000] %asi, %r20
	mov	0x50, %r26
	.word 0xead70e60  ! 668: LDSHA_R	ldsha	[%r28, %r0] 0x73, %r21
	.word 0xe4ad44a0  ! 669: STBA_R	stba	%r18, [%r21 + %r0] 0x25
	mov	0x7e8, %r20
	.word 0x87802025  ! 671: WRASI_I	wr	%r0, 0x0025, %asi
	mov	0x60, %r26
	.word 0xeccf2000  ! 673: LDSBA_I	ldsba	[%r28, + 0x0000] %asi, %r22
	.word 0xecbf2000  ! 674: STDA_I	stda	%r22, [%r28 + 0x0000] %asi
	.word 0xeea70e80  ! 675: STWA_R	stwa	%r23, [%r28 + %r0] 0x74
	.word 0xeaafce60  ! 676: STBA_R	stba	%r21, [%r31 + %r0] 0x73
	.word 0x87802073  ! 677: WRASI_I	wr	%r0, 0x0073, %asi
	mov	0x3c0, %r21
	mov	0x48, %r27
	.word 0xe8bc8400  ! 680: STDA_R	stda	%r20, [%r18 + %r0] 0x20
	.word 0xe4a72000  ! 681: STWA_I	stwa	%r18, [%r28 + 0x0000] %asi
	.word 0xe4df2000  ! 682: LDXA_I	ldxa	[%r28, + 0x0000] %asi, %r18
	.word 0xe4d76000  ! 683: LDSHA_I	ldsha	[%r29, + 0x0000] %asi, %r18
	.word 0xe4972000  ! 684: LDUHA_I	lduha	[%r28, + 0x0000] %asi, %r18
	.word 0xe6b609e0  ! 685: STHA_R	stha	%r19, [%r24 + %r0] 0x4f
	mov	0x50, %r18
	mov	0x78, %r27
	.word 0xe28f2000  ! 688: LDUBA_I	lduba	[%r28, + 0x0000] %asi, %r17
	.word 0xe28f2000  ! 689: LDUBA_I	lduba	[%r28, + 0x0000] %asi, %r17
	.word 0xe2b504a0  ! 690: STHA_R	stha	%r17, [%r20 + %r0] 0x25
	.word 0xeac7a000  ! 691: LDSWA_I	ldswa	[%r30, + 0x0000] %asi, %r21
	.word 0xe0d44400  ! 692: LDSHA_R	ldsha	[%r17, %r0] 0x20, %r16
	.word 0xe88f6000  ! 693: LDUBA_I	lduba	[%r29, + 0x0000] %asi, %r20
	.word 0xea9d84a0  ! 694: LDDA_R	ldda	[%r22, %r0] 0x25, %r21
	.word 0xe6bfe000  ! 695: STDA_I	stda	%r19, [%r31 + 0x0000] %asi
	.word 0xe6f7a000  ! 696: STXA_I	stxa	%r19, [%r30 + 0x0000] %asi
	mov	0x30, %r18
	.word 0xe0a74e40  ! 698: STWA_R	stwa	%r16, [%r29 + %r0] 0x72
	.word 0xea870e80  ! 699: LDUWA_R	lduwa	[%r28, %r0] 0x74, %r21
	mov	0x3c0, %r20
	mov	0x58, %r27
	.word 0xee9504a0  ! 702: LDUHA_R	lduha	[%r20, %r0] 0x25, %r23
	.word 0xeea7e000  ! 703: STWA_I	stwa	%r23, [%r31 + 0x0000] %asi
	.word 0xead70e80  ! 704: LDSHA_R	ldsha	[%r28, %r0] 0x74, %r21
	.word 0xea872000  ! 705: LDUWA_I	lduwa	[%r28, + 0x0000] %asi, %r21
	mov	0x70, %r17
	mov	0x7c8, %r20
	ta	T_CHANGE_NONPRIV	! macro
	mov	0x70, %r25
	.word 0xe08f8e40  ! 710: LDUBA_R	lduba	[%r30, %r0] 0x72, %r16
	.word 0xeaf48400  ! 711: STXA_R	stxa	%r21, [%r18 + %r0] 0x20
	.word 0xe2940400  ! 712: LDUHA_R	lduha	[%r16, %r0] 0x20, %r17
	.word 0xecbfe000  ! 713: STDA_I	stda	%r22, [%r31 + 0x0000] %asi
	.word 0x87802025  ! 714: WRASI_I	wr	%r0, 0x0025, %asi
	mov	0x0, %r17
	.word 0xea874e80  ! 716: LDUWA_R	lduwa	[%r29, %r0] 0x74, %r21
	.word 0xeedf0e80  ! 717: LDXA_R	ldxa	[%r28, %r0] 0x74, %r23
	.word 0xecb76000  ! 718: STHA_I	stha	%r22, [%r29 + 0x0000] %asi
	.word 0xe49d04a0  ! 719: LDDA_R	ldda	[%r20, %r0] 0x25, %r18
	mov	0x58, %r25
	mov	0x58, %r16
	.word 0xe297a000  ! 722: LDUHA_I	lduha	[%r30, + 0x0000] %asi, %r17
	mov	0x3e8, %r20
	.word 0xe2cf2000  ! 724: LDSBA_I	ldsba	[%r28, + 0x0000] %asi, %r17
	.word 0xe28f6000  ! 725: LDUBA_I	lduba	[%r29, + 0x0000] %asi, %r17
	mov	0x7d0, %r22
	.word 0xe2cfe000  ! 727: LDSBA_I	ldsba	[%r31, + 0x0000] %asi, %r17
	.word 0xe287e000  ! 728: LDUWA_I	lduwa	[%r31, + 0x0000] %asi, %r17
	mov	0x7f0, %r22
	.word 0x87802073  ! 730: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0xecbc4400  ! 731: STDA_R	stda	%r22, [%r17 + %r0] 0x20
	.word 0xeef76000  ! 732: STXA_I	stxa	%r23, [%r29 + 0x0000] %asi
	.word 0xe0bfce80  ! 733: STDA_R	stda	%r16, [%r31 + %r0] 0x74
	.word 0xe6bfe000  ! 734: STDA_I	stda	%r19, [%r31 + 0x0000] %asi
	.word 0xe6b74e40  ! 735: STHA_R	stha	%r19, [%r29 + %r0] 0x72
	.word 0xe8cf8e60  ! 736: LDSBA_R	ldsba	[%r30, %r0] 0x73, %r20
	.word 0x87802025  ! 737: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0x87802073  ! 738: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0xe6c70e40  ! 739: LDSWA_R	ldswa	[%r28, %r0] 0x72, %r19
	mov	0x7e0, %r21
	ta	T_CHANGE_HPRIV	! macro
	.word 0xe0c44400  ! 742: LDSWA_R	ldswa	[%r17, %r0] 0x20, %r16
	mov	0x3c0, %r21
	.word 0xe8866000  ! 744: LDUWA_I	lduwa	[%r25, + 0x0000] %asi, %r20
	.word 0xe88ea000  ! 745: LDUBA_I	lduba	[%r26, + 0x0000] %asi, %r20
	.word 0xead504a0  ! 746: LDSHA_R	ldsha	[%r20, %r0] 0x25, %r21
	.word 0xecc6a000  ! 747: LDSWA_I	ldswa	[%r26, + 0x0000] %asi, %r22
	.word 0xecce2000  ! 748: LDSBA_I	ldsba	[%r24, + 0x0000] %asi, %r22
	.word 0xecf6e000  ! 749: STXA_I	stxa	%r22, [%r27 + 0x0000] %asi
	.word 0xeacc0400  ! 750: LDSBA_R	ldsba	[%r16, %r0] 0x20, %r21
	.word 0xecbe49e0  ! 751: STDA_R	stda	%r22, [%r25 + %r0] 0x4f
	mov	0x10, %r25
	.word 0x87802074  ! 753: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0xeea544a0  ! 754: STWA_R	stwa	%r23, [%r21 + %r0] 0x25
	.word 0xea8ce000  ! 755: LDUBA_I	lduba	[%r19, + 0x0000] %asi, %r21
	.word 0x87802074  ! 756: WRASI_I	wr	%r0, 0x0074, %asi
	mov	0x18, %r26
	.word 0xee8e09e0  ! 758: LDUBA_R	lduba	[%r24, %r0] 0x4f, %r23
	.word 0x87802073  ! 759: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0xe2a74e40  ! 760: STWA_R	stwa	%r17, [%r29 + %r0] 0x72
	.word 0xe09ee000  ! 761: LDDA_I	ldda	[%r27, + 0x0000] %asi, %r16
	mov	0x3e8, %r20
	.word 0xe0aec9e0  ! 763: STBA_R	stba	%r16, [%r27 + %r0] 0x4f
	.word 0xe0f40400  ! 764: STXA_R	stxa	%r16, [%r16 + %r0] 0x20
	.word 0xe6878e60  ! 765: LDUWA_R	lduwa	[%r30, %r0] 0x73, %r19
	.word 0xe48c8400  ! 766: LDUBA_R	lduba	[%r18, %r0] 0x20, %r18
	mov	0x7c0, %r20
	.word 0xe08d84a0  ! 768: LDUBA_R	lduba	[%r22, %r0] 0x25, %r16
	.word 0xe09609e0  ! 769: LDUHA_R	lduha	[%r24, %r0] 0x4f, %r16
	.word 0xe89c0400  ! 770: LDDA_R	ldda	[%r16, %r0] 0x20, %r20
	.word 0xecafce60  ! 771: STBA_R	stba	%r22, [%r31 + %r0] 0x73
	.word 0xe4dd44a0  ! 772: LDXA_R	ldxa	[%r21, %r0] 0x25, %r18
	.word 0xe4bf0e40  ! 773: STDA_R	stda	%r18, [%r28 + %r0] 0x72
	.word 0xe28f8e40  ! 774: LDUBA_R	lduba	[%r30, %r0] 0x72, %r17
	mov	0x40, %r24
	mov	0x3d8, %r23
	.word 0xe89d84a0  ! 777: LDDA_R	ldda	[%r22, %r0] 0x25, %r20
	mov	0x20, %r24
	mov	0x68, %r26
	.word 0x87802020  ! 780: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xeea66000  ! 781: STWA_I	stwa	%r23, [%r25 + 0x0000] %asi
	.word 0x87802020  ! 782: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xecc40400  ! 783: LDSWA_R	ldswa	[%r16, %r0] 0x20, %r22
	.word 0xe8ac6000  ! 784: STBA_I	stba	%r20, [%r17 + 0x0000] %asi
	.word 0xe8d4a000  ! 785: LDSHA_I	ldsha	[%r18, + 0x0000] %asi, %r20
	.word 0xe6a70e40  ! 786: STWA_R	stwa	%r19, [%r28 + %r0] 0x72
	.word 0xe2ac4400  ! 787: STBA_R	stba	%r17, [%r17 + %r0] 0x20
	mov	0x70, %r27
	.word 0xeaaf0e60  ! 789: STBA_R	stba	%r21, [%r28 + %r0] 0x73
	.word 0xe48e49e0  ! 790: LDUBA_R	lduba	[%r25, %r0] 0x4f, %r18
	.word 0xe2bc0400  ! 791: STDA_R	stda	%r17, [%r16 + %r0] 0x20
	.word 0xeed4e000  ! 792: LDSHA_I	ldsha	[%r19, + 0x0000] %asi, %r23
	.word 0xee846000  ! 793: LDUWA_I	lduwa	[%r17, + 0x0000] %asi, %r23
	.word 0x87802073  ! 794: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0xeaf4c400  ! 795: STXA_R	stxa	%r21, [%r19 + %r0] 0x20
	.word 0xead48400  ! 796: LDSHA_R	ldsha	[%r18, %r0] 0x20, %r21
	.word 0xecf7ce40  ! 797: STXA_R	stxa	%r22, [%r31 + %r0] 0x72
	.word 0xea8e89e0  ! 798: LDUBA_R	lduba	[%r26, %r0] 0x4f, %r21
	mov	0x28, %r24
	.word 0xe2a70e60  ! 800: STWA_R	stwa	%r17, [%r28 + %r0] 0x73
	.word 0xe0df6000  ! 801: LDXA_I	ldxa	[%r29, + 0x0000] %asi, %r16
	.word 0xe0d72000  ! 802: LDSHA_I	ldsha	[%r28, + 0x0000] %asi, %r16
	.word 0xe087e000  ! 803: LDUWA_I	lduwa	[%r31, + 0x0000] %asi, %r16
	mov	0x7d8, %r22
	.word 0xe0bfa000  ! 805: STDA_I	stda	%r16, [%r30 + 0x0000] %asi
	.word 0xe4af0e60  ! 806: STBA_R	stba	%r18, [%r28 + %r0] 0x73
	.word 0xe48fe000  ! 807: LDUBA_I	lduba	[%r31, + 0x0000] %asi, %r18
	mov	0x3c0, %r20
	mov	0x40, %r17
	.word 0xeec649e0  ! 810: LDSWA_R	ldswa	[%r25, %r0] 0x4f, %r23
	.word 0xeaaf2000  ! 811: STBA_I	stba	%r21, [%r28 + 0x0000] %asi
	mov	0x60, %r17
	.word 0x8780204f  ! 813: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0x87802020  ! 814: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe8b5c4a0  ! 815: STHA_R	stha	%r20, [%r23 + %r0] 0x25
	.word 0x87802072  ! 816: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0xe087a000  ! 817: LDUWA_I	lduwa	[%r30, + 0x0000] %asi, %r16
	.word 0xe6de89e0  ! 818: LDXA_R	ldxa	[%r26, %r0] 0x4f, %r19
	.word 0xe0b689e0  ! 819: STHA_R	stha	%r16, [%r26 + %r0] 0x4f
	.word 0x87802074  ! 820: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0xe4ae2000  ! 821: STBA_I	stba	%r18, [%r24 + 0x0000] %asi
	.word 0xe8f78e40  ! 822: STXA_R	stxa	%r20, [%r30 + %r0] 0x72
	.word 0xe29e89e0  ! 823: LDDA_R	ldda	[%r26, %r0] 0x4f, %r17
	.word 0xe6d7ce60  ! 824: LDSHA_R	ldsha	[%r31, %r0] 0x73, %r19
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xe2de6000  ! 826: LDXA_I	ldxa	[%r25, + 0x0000] %asi, %r17
	.word 0x87802020  ! 827: WRASI_I	wr	%r0, 0x0020, %asi
	mov	0x7c8, %r20
	.word 0xe09e49e0  ! 829: LDDA_R	ldda	[%r25, %r0] 0x4f, %r16
	.word 0xe2c649e0  ! 830: LDSWA_R	ldswa	[%r25, %r0] 0x4f, %r17
	.word 0xeeb42000  ! 831: STHA_I	stha	%r23, [%r16 + 0x0000] %asi
	.word 0x87802025  ! 832: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0xeebd2000  ! 833: STDA_I	stda	%r23, [%r20 + 0x0000] %asi
	.word 0xeed52000  ! 834: LDSHA_I	ldsha	[%r20, + 0x0000] %asi, %r23
	.word 0xeef52000  ! 835: STXA_I	stxa	%r23, [%r20 + 0x0000] %asi
	.word 0x8780204f  ! 836: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xeedee000  ! 837: LDXA_I	ldxa	[%r27, + 0x0000] %asi, %r23
	.word 0x87802072  ! 838: WRASI_I	wr	%r0, 0x0072, %asi
	mov	0x3d0, %r23
	mov	0x10, %r18
	.word 0xeccd04a0  ! 841: LDSBA_R	ldsba	[%r20, %r0] 0x25, %r22
	.word 0xeab7e000  ! 842: STHA_I	stha	%r21, [%r31 + 0x0000] %asi
	.word 0xe6d70e80  ! 843: LDSHA_R	ldsha	[%r28, %r0] 0x74, %r19
	.word 0x87802073  ! 844: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0xe08f4e60  ! 845: LDUBA_R	lduba	[%r29, %r0] 0x73, %r16
	.word 0xe0a72000  ! 846: STWA_I	stwa	%r16, [%r28 + 0x0000] %asi
	.word 0xe0bfe000  ! 847: STDA_I	stda	%r16, [%r31 + 0x0000] %asi
	.word 0x87802074  ! 848: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0xe0bee000  ! 849: STDA_I	stda	%r16, [%r27 + 0x0000] %asi
	.word 0xea9f8e80  ! 850: LDDA_R	ldda	[%r30, %r0] 0x74, %r21
	.word 0x87802025  ! 851: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0xe0bfe000  ! 852: STDA_I	stda	%r16, [%r31 + 0x0000] %asi
	mov	0x7c0, %r22
	.word 0xe0d76000  ! 854: LDSHA_I	ldsha	[%r29, + 0x0000] %asi, %r16
	mov	0x50, %r27
	mov	0x58, %r24
	.word 0xe0cfa000  ! 857: LDSBA_I	ldsba	[%r30, + 0x0000] %asi, %r16
	.word 0xe6b584a0  ! 858: STHA_R	stha	%r19, [%r22 + %r0] 0x25
	.word 0x87802072  ! 859: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0xe0b44400  ! 860: STHA_R	stha	%r16, [%r17 + %r0] 0x20
	.word 0x8780204f  ! 861: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xee8c0400  ! 862: LDUBA_R	lduba	[%r16, %r0] 0x20, %r23
	.word 0xe8cf8e80  ! 863: LDSBA_R	ldsba	[%r30, %r0] 0x74, %r20
	mov	0x7e8, %r22
	mov	0x60, %r25
	mov	0x68, %r24
	.word 0x8780204f  ! 867: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xeec609e0  ! 868: LDSWA_R	ldswa	[%r24, %r0] 0x4f, %r23
	.word 0x87802025  ! 869: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0xe6b62000  ! 870: STHA_I	stha	%r19, [%r24 + 0x0000] %asi
	mov	0x8, %r16
	.word 0x8780204f  ! 872: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xe2c70e60  ! 873: LDSWA_R	ldswa	[%r28, %r0] 0x73, %r17
	.word 0xe2d70e60  ! 874: LDSHA_R	ldsha	[%r28, %r0] 0x73, %r17
	mov	0x8, %r18
	.word 0x8780204f  ! 876: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xee8d84a0  ! 877: LDUBA_R	lduba	[%r22, %r0] 0x25, %r23
	.word 0xe497ce80  ! 878: LDUHA_R	lduha	[%r31, %r0] 0x74, %r18
	.word 0xeaa5a000  ! 879: STWA_I	stwa	%r21, [%r22 + 0x0000] %asi
	.word 0xeaf5e000  ! 880: STXA_I	stxa	%r21, [%r23 + 0x0000] %asi
	.word 0x87802020  ! 881: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0x87802074  ! 882: WRASI_I	wr	%r0, 0x0074, %asi
	mov	0x68, %r26
	.word 0x87802025  ! 884: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0xe4a48400  ! 885: STWA_R	stwa	%r18, [%r18 + %r0] 0x20
	.word 0xe8dc8400  ! 886: LDXA_R	ldxa	[%r18, %r0] 0x20, %r20
	.word 0xecd4a000  ! 887: LDSHA_I	ldsha	[%r18, + 0x0000] %asi, %r22
	.word 0x8780204f  ! 888: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0x87802072  ! 889: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0xec842000  ! 890: LDUWA_I	lduwa	[%r16, + 0x0000] %asi, %r22
	.word 0xecb7ce80  ! 891: STHA_R	stha	%r22, [%r31 + %r0] 0x74
	.word 0x87802072  ! 892: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0xeadda000  ! 893: LDXA_I	ldxa	[%r22, + 0x0000] %asi, %r21
	mov	0x58, %r17
	mov	0x7f0, %r20
	mov	0x7f8, %r21
	mov	0x58, %r18
	.word 0xe2af8e40  ! 898: STBA_R	stba	%r17, [%r30 + %r0] 0x72
	.word 0xe8a52000  ! 899: STWA_I	stwa	%r20, [%r20 + 0x0000] %asi
	.word 0xe4940400  ! 900: LDUHA_R	lduha	[%r16, %r0] 0x20, %r18
	.word 0xe4ac0400  ! 901: STBA_R	stba	%r18, [%r16 + %r0] 0x20
	.word 0xecd4c400  ! 902: LDSHA_R	ldsha	[%r19, %r0] 0x20, %r22
	.word 0xe6bd84a0  ! 903: STDA_R	stda	%r19, [%r22 + %r0] 0x25
	.word 0xeef70e60  ! 904: STXA_R	stxa	%r23, [%r28 + %r0] 0x73
	.word 0xe2d56000  ! 905: LDSHA_I	ldsha	[%r21, + 0x0000] %asi, %r17
	.word 0x87802025  ! 906: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0xe2b46000  ! 907: STHA_I	stha	%r17, [%r17 + 0x0000] %asi
	.word 0x87802020  ! 908: WRASI_I	wr	%r0, 0x0020, %asi
	mov	0x60, %r17
	mov	0x40, %r19
	.word 0x87802025  ! 911: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0xecc7ce80  ! 912: LDSWA_R	ldswa	[%r31, %r0] 0x74, %r22
	mov	0x18, %r25
	mov	0x70, %r17
	mov	0x0, %r18
	.word 0xe4a4e000  ! 916: STWA_I	stwa	%r18, [%r19 + 0x0000] %asi
	.word 0xecb74e80  ! 917: STHA_R	stha	%r22, [%r29 + %r0] 0x74
	.word 0x87802073  ! 918: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0xeccf0e80  ! 919: LDSBA_R	ldsba	[%r28, %r0] 0x74, %r22
	.word 0xe8b6e000  ! 920: STHA_I	stha	%r20, [%r27 + 0x0000] %asi
	.word 0xe0a78e60  ! 921: STWA_R	stwa	%r16, [%r30 + %r0] 0x73
	mov	0x8, %r16
	mov	0x78, %r25
	.word 0xeccf4e80  ! 924: LDSBA_R	ldsba	[%r29, %r0] 0x74, %r22
	.word 0xe8f6a000  ! 925: STXA_I	stxa	%r20, [%r26 + 0x0000] %asi
	.word 0x87802020  ! 926: WRASI_I	wr	%r0, 0x0020, %asi
	mov	0x38, %r16
	.word 0xe4bdc4a0  ! 928: STDA_R	stda	%r18, [%r23 + %r0] 0x25
	.word 0xe48649e0  ! 929: LDUWA_R	lduwa	[%r25, %r0] 0x4f, %r18
	.word 0x87802074  ! 930: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0xeebd04a0  ! 931: STDA_R	stda	%r23, [%r20 + %r0] 0x25
	.word 0xe4b504a0  ! 932: STHA_R	stha	%r18, [%r20 + %r0] 0x25
	mov	0x7f0, %r20
	.word 0xead42000  ! 934: LDSHA_I	ldsha	[%r16, + 0x0000] %asi, %r21
	.word 0xeedc0400  ! 935: LDXA_R	ldxa	[%r16, %r0] 0x20, %r23
	.word 0xe49ca000  ! 936: LDDA_I	ldda	[%r18, + 0x0000] %asi, %r18
	.word 0x87802072  ! 937: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0xe4ace000  ! 938: STBA_I	stba	%r18, [%r19 + 0x0000] %asi
	.word 0x87802073  ! 939: WRASI_I	wr	%r0, 0x0073, %asi
	mov	0x8, %r26
	.word 0xe4b46000  ! 941: STHA_I	stha	%r18, [%r17 + 0x0000] %asi
	.word 0xe28504a0  ! 942: LDUWA_R	lduwa	[%r20, %r0] 0x25, %r17
	mov	0x7d8, %r22
	.word 0xe084a000  ! 944: LDUWA_I	lduwa	[%r18, + 0x0000] %asi, %r16
	.word 0xeaaf4e80  ! 945: STBA_R	stba	%r21, [%r29 + %r0] 0x74
	.word 0xe6f78e60  ! 946: STXA_R	stxa	%r19, [%r30 + %r0] 0x73
	.word 0x8780204f  ! 947: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0x87802072  ! 948: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0xe4cf0e40  ! 949: LDSBA_R	ldsba	[%r28, %r0] 0x72, %r18
	.word 0xe0b52000  ! 950: STHA_I	stha	%r16, [%r20 + 0x0000] %asi
	.word 0xe0bde000  ! 951: STDA_I	stda	%r16, [%r23 + 0x0000] %asi
	.word 0xe8ddc4a0  ! 952: LDXA_R	ldxa	[%r23, %r0] 0x25, %r20
	.word 0xe89da000  ! 953: LDDA_I	ldda	[%r22, + 0x0000] %asi, %r20
	.word 0xe8f56000  ! 954: STXA_I	stxa	%r20, [%r21 + 0x0000] %asi
	.word 0x87802072  ! 955: WRASI_I	wr	%r0, 0x0072, %asi
	mov	0x7d0, %r23
	.word 0xe8f52000  ! 957: STXA_I	stxa	%r20, [%r20 + 0x0000] %asi
	mov	0x3d8, %r21
	.word 0xe6af8e80  ! 959: STBA_R	stba	%r19, [%r30 + %r0] 0x74
	mov	0x7d8, %r20
	mov	0x0, %r17
	.word 0xe6bd6000  ! 962: STDA_I	stda	%r19, [%r21 + 0x0000] %asi
	mov	0x58, %r16
	.word 0xe695a000  ! 964: LDUHA_I	lduha	[%r22, + 0x0000] %asi, %r19
	mov	0x48, %r17
	mov	0x3f8, %r21
	.word 0x87802074  ! 967: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0xe6bf6000  ! 968: STDA_I	stda	%r19, [%r29 + 0x0000] %asi
	.word 0xe6872000  ! 969: LDUWA_I	lduwa	[%r28, + 0x0000] %asi, %r19
	.word 0xe48544a0  ! 970: LDUWA_R	lduwa	[%r21, %r0] 0x25, %r18
	.word 0xe4df2000  ! 971: LDXA_I	ldxa	[%r28, + 0x0000] %asi, %r18
	.word 0x87802074  ! 972: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0xe4bc2000  ! 973: STDA_I	stda	%r18, [%r16 + 0x0000] %asi
	.word 0xe4840400  ! 974: LDUWA_R	lduwa	[%r16, %r0] 0x20, %r18
	.word 0xecf40400  ! 975: STXA_R	stxa	%r22, [%r16 + %r0] 0x20
	.word 0xe6b7ce80  ! 976: STHA_R	stha	%r19, [%r31 + %r0] 0x74
	mov	0x20, %r25
	mov	0x7d8, %r23
	.word 0x87802020  ! 979: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe4dde000  ! 980: LDXA_I	ldxa	[%r23, + 0x0000] %asi, %r18
	.word 0xeef4c400  ! 981: STXA_R	stxa	%r23, [%r19 + %r0] 0x20
	mov	0x20, %r25
	.word 0xe2bfce40  ! 983: STDA_R	stda	%r17, [%r31 + %r0] 0x72
	.word 0x87802074  ! 984: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0xe89f6000  ! 985: LDDA_I	ldda	[%r29, + 0x0000] %asi, %r20
	mov	0x70, %r26
	.word 0xec9544a0  ! 987: LDUHA_R	lduha	[%r21, %r0] 0x25, %r22
	mov	0x40, %r17
	.word 0xe4afe000  ! 989: STBA_I	stba	%r18, [%r31 + 0x0000] %asi
	mov	0x3c8, %r22
	mov	0x10, %r16
	mov	0x60, %r16
	.word 0x87802020  ! 993: WRASI_I	wr	%r0, 0x0020, %asi
	mov	0x50, %r19
	.word 0x87802074  ! 995: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0xe497e000  ! 996: LDUHA_I	lduha	[%r31, + 0x0000] %asi, %r18
	.word 0xe497e000  ! 997: LDUHA_I	lduha	[%r31, + 0x0000] %asi, %r18
	.word 0xecde49e0  ! 998: LDXA_R	ldxa	[%r25, %r0] 0x4f, %r22
	mov	0x0, %r27
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_2:
	.word 0xe8cf2000  ! 1: LDSBA_I	ldsba	[%r28, + 0x0000] %asi, %r20
	.word 0xe8972000  ! 2: LDUHA_I	lduha	[%r28, + 0x0000] %asi, %r20
	.word 0x87802025  ! 3: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0x87802073  ! 4: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0x87802025  ! 5: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0xe8df6000  ! 6: LDXA_I	ldxa	[%r29, + 0x0000] %asi, %r20
	.word 0xeedf8e80  ! 7: LDXA_R	ldxa	[%r30, %r0] 0x74, %r23
	.word 0x8780204f  ! 8: WRASI_I	wr	%r0, 0x004f, %asi
	mov	0x3c8, %r20
	mov	0x8, %r19
	.word 0xe8a6c9e0  ! 11: STWA_R	stwa	%r20, [%r27 + %r0] 0x4f
	.word 0xecf504a0  ! 12: STXA_R	stxa	%r22, [%r20 + %r0] 0x25
	.word 0xea9f2000  ! 13: LDDA_I	ldda	[%r28, + 0x0000] %asi, %r21
	.word 0x87802074  ! 14: WRASI_I	wr	%r0, 0x0074, %asi
	mov	0x70, %r18
	mov	0x38, %r24
	.word 0x87802020  ! 17: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xea8ca000  ! 18: LDUBA_I	lduba	[%r18, + 0x0000] %asi, %r21
	mov	0x3c8, %r22
	mov	0x3d0, %r21
	mov	0x60, %r25
	mov	0x3c8, %r23
	.word 0xe0b44400  ! 23: STHA_R	stha	%r16, [%r17 + %r0] 0x20
	.word 0xea842000  ! 24: LDUWA_I	lduwa	[%r16, + 0x0000] %asi, %r21
	.word 0xeaf4a000  ! 25: STXA_I	stxa	%r21, [%r18 + 0x0000] %asi
	.word 0x87802073  ! 26: WRASI_I	wr	%r0, 0x0073, %asi
	mov	0x28, %r19
	.word 0xeef48400  ! 28: STXA_R	stxa	%r23, [%r18 + %r0] 0x20
	.word 0xec9f2000  ! 29: LDDA_I	ldda	[%r28, + 0x0000] %asi, %r22
	.word 0xec9f2000  ! 30: LDDA_I	ldda	[%r28, + 0x0000] %asi, %r22
	.word 0xecb72000  ! 31: STHA_I	stha	%r22, [%r28 + 0x0000] %asi
	.word 0xe0d649e0  ! 32: LDSHA_R	ldsha	[%r25, %r0] 0x4f, %r16
	.word 0x8780204f  ! 33: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xeea44400  ! 34: STWA_R	stwa	%r23, [%r17 + %r0] 0x20
	.word 0xea972000  ! 35: LDUHA_I	lduha	[%r28, + 0x0000] %asi, %r21
	.word 0xea872000  ! 36: LDUWA_I	lduwa	[%r28, + 0x0000] %asi, %r21
	.word 0x87802025  ! 37: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0xeadc6000  ! 38: LDXA_I	ldxa	[%r17, + 0x0000] %asi, %r21
	mov	0x7e0, %r20
	.word 0xe2cfce80  ! 40: LDSBA_R	ldsba	[%r31, %r0] 0x74, %r17
	.word 0xe6b504a0  ! 41: STHA_R	stha	%r19, [%r20 + %r0] 0x25
	mov	0x50, %r25
	.word 0xec978e60  ! 43: LDUHA_R	lduha	[%r30, %r0] 0x73, %r22
	.word 0xe29ce000  ! 44: LDDA_I	ldda	[%r19, + 0x0000] %asi, %r17
	.word 0xe6bec9e0  ! 45: STDA_R	stda	%r19, [%r27 + %r0] 0x4f
	.word 0xee9e89e0  ! 46: LDDA_R	ldda	[%r26, %r0] 0x4f, %r23
	.word 0xe88c4400  ! 47: LDUBA_R	lduba	[%r17, %r0] 0x20, %r20
	mov	0x40, %r19
	.word 0xeac4e000  ! 49: LDSWA_I	ldswa	[%r19, + 0x0000] %asi, %r21
	.word 0xeabc2000  ! 50: STDA_I	stda	%r21, [%r16 + 0x0000] %asi
	.word 0xecbe89e0  ! 51: STDA_R	stda	%r22, [%r26 + %r0] 0x4f
	.word 0xea870e60  ! 52: LDUWA_R	lduwa	[%r28, %r0] 0x73, %r21
	mov	0x0, %r16
	.word 0xe8b4e000  ! 54: STHA_I	stha	%r20, [%r19 + 0x0000] %asi
	mov	0x70, %r26
	.word 0xe8d46000  ! 56: LDSHA_I	ldsha	[%r17, + 0x0000] %asi, %r20
	.word 0xeedf8e60  ! 57: LDXA_R	ldxa	[%r30, %r0] 0x73, %r23
	.word 0xeedc2000  ! 58: LDXA_I	ldxa	[%r16, + 0x0000] %asi, %r23
	.word 0xee94e000  ! 59: LDUHA_I	lduha	[%r19, + 0x0000] %asi, %r23
	.word 0xe2cc4400  ! 60: LDSBA_R	ldsba	[%r17, %r0] 0x20, %r17
	.word 0xeac584a0  ! 61: LDSWA_R	ldswa	[%r22, %r0] 0x25, %r21
	.word 0x87802073  ! 62: WRASI_I	wr	%r0, 0x0073, %asi
	mov	0x58, %r26
	.word 0x87802025  ! 64: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0xe89ee000  ! 65: LDDA_I	ldda	[%r27, + 0x0000] %asi, %r20
	mov	0x58, %r17
	.word 0xe4bd84a0  ! 67: STDA_R	stda	%r18, [%r22 + %r0] 0x25
	.word 0x87802072  ! 68: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0xe8966000  ! 69: LDUHA_I	lduha	[%r25, + 0x0000] %asi, %r20
	mov	0x3e8, %r20
	.word 0x87802074  ! 71: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0xe8cfe000  ! 72: LDSBA_I	ldsba	[%r31, + 0x0000] %asi, %r20
	.word 0x87802074  ! 73: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0xe8dc4400  ! 74: LDXA_R	ldxa	[%r17, %r0] 0x20, %r20
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xecd70e80  ! 76: LDSHA_R	ldsha	[%r28, %r0] 0x74, %r22
	.word 0xe2bfa000  ! 77: STDA_I	stda	%r17, [%r30 + 0x0000] %asi
	.word 0xecc689e0  ! 78: LDSWA_R	ldswa	[%r26, %r0] 0x4f, %r22
	.word 0xeccf2000  ! 79: LDSBA_I	ldsba	[%r28, + 0x0000] %asi, %r22
	.word 0xe88f0e60  ! 80: LDUBA_R	lduba	[%r28, %r0] 0x73, %r20
	.word 0xe0ae09e0  ! 81: STBA_R	stba	%r16, [%r24 + %r0] 0x4f
	.word 0xe4b70e40  ! 82: STHA_R	stha	%r18, [%r28 + %r0] 0x72
	.word 0x8780204f  ! 83: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xe4bea000  ! 84: STDA_I	stda	%r18, [%r26 + 0x0000] %asi
	.word 0x87802025  ! 85: WRASI_I	wr	%r0, 0x0025, %asi
	mov	0x70, %r26
	.word 0xe4874e80  ! 87: LDUWA_R	lduwa	[%r29, %r0] 0x74, %r18
	ta	T_CHANGE_HPRIV	! macro
	.word 0xe6dce000  ! 89: LDXA_I	ldxa	[%r19, + 0x0000] %asi, %r19
	mov	0x0, %r17
	mov	0x38, %r18
	.word 0xecdfce60  ! 92: LDXA_R	ldxa	[%r31, %r0] 0x73, %r22
	.word 0x87802025  ! 93: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0x87802020  ! 94: WRASI_I	wr	%r0, 0x0020, %asi
	mov	0x50, %r26
	mov	0x7d8, %r22
	.word 0xe084a000  ! 97: LDUWA_I	lduwa	[%r18, + 0x0000] %asi, %r16
	.word 0xe08ce000  ! 98: LDUBA_I	lduba	[%r19, + 0x0000] %asi, %r16
	.word 0xe0d46000  ! 99: LDSHA_I	ldsha	[%r17, + 0x0000] %asi, %r16
	.word 0xe0bca000  ! 100: STDA_I	stda	%r16, [%r18 + 0x0000] %asi
	.word 0xe0a4e000  ! 101: STWA_I	stwa	%r16, [%r19 + 0x0000] %asi
	.word 0x87802073  ! 102: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0x87802072  ! 103: WRASI_I	wr	%r0, 0x0072, %asi
	mov	0x70, %r19
	.word 0xe08c0400  ! 105: LDUBA_R	lduba	[%r16, %r0] 0x20, %r16
	.word 0xeccf8e40  ! 106: LDSBA_R	ldsba	[%r30, %r0] 0x72, %r22
	mov	0x38, %r25
	.word 0xe0bd84a0  ! 108: STDA_R	stda	%r16, [%r22 + %r0] 0x25
	ta	T_CHANGE_PRIV	! macro
	.word 0xe0dc4400  ! 110: LDXA_R	ldxa	[%r17, %r0] 0x20, %r16
	.word 0x8780204f  ! 111: WRASI_I	wr	%r0, 0x004f, %asi
	mov	0x0, %r16
	.word 0xeecf0e80  ! 113: LDSBA_R	ldsba	[%r28, %r0] 0x74, %r23
	.word 0xe0c40400  ! 114: LDSWA_R	ldswa	[%r16, %r0] 0x20, %r16
	.word 0xea8c6000  ! 115: LDUBA_I	lduba	[%r17, + 0x0000] %asi, %r21
	.word 0xe6878e40  ! 116: LDUWA_R	lduwa	[%r30, %r0] 0x72, %r19
	.word 0xe88ce000  ! 117: LDUBA_I	lduba	[%r19, + 0x0000] %asi, %r20
	.word 0xe8f4a000  ! 118: STXA_I	stxa	%r20, [%r18 + 0x0000] %asi
	.word 0x87802073  ! 119: WRASI_I	wr	%r0, 0x0073, %asi
	mov	0x10, %r26
	.word 0xe2bfce60  ! 121: STDA_R	stda	%r17, [%r31 + %r0] 0x73
	mov	0x18, %r25
	.word 0xeaad2000  ! 123: STBA_I	stba	%r21, [%r20 + 0x0000] %asi
	.word 0x87802020  ! 124: WRASI_I	wr	%r0, 0x0020, %asi
	mov	0x50, %r19
	.word 0xea9ee000  ! 126: LDDA_I	ldda	[%r27, + 0x0000] %asi, %r21
	.word 0x87802073  ! 127: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0x87802074  ! 128: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0x87802025  ! 129: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0x87802020  ! 130: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0x87802072  ! 131: WRASI_I	wr	%r0, 0x0072, %asi
	mov	0x48, %r27
	.word 0xea9fe000  ! 133: LDDA_I	ldda	[%r31, + 0x0000] %asi, %r21
	.word 0xea9fa000  ! 134: LDDA_I	ldda	[%r30, + 0x0000] %asi, %r21
	.word 0x87802073  ! 135: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0xe6f6c9e0  ! 136: STXA_R	stxa	%r19, [%r27 + %r0] 0x4f
	.word 0xe8a6c9e0  ! 137: STWA_R	stwa	%r20, [%r27 + %r0] 0x4f
	.word 0xeccf4e40  ! 138: LDSBA_R	ldsba	[%r29, %r0] 0x72, %r22
	.word 0xe0bcc400  ! 139: STDA_R	stda	%r16, [%r19 + %r0] 0x20
	.word 0xec9ce000  ! 140: LDDA_I	ldda	[%r19, + 0x0000] %asi, %r22
	.word 0x87802020  ! 141: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xec9da000  ! 142: LDDA_I	ldda	[%r22, + 0x0000] %asi, %r22
	mov	0x3d0, %r21
	.word 0x87802073  ! 144: WRASI_I	wr	%r0, 0x0073, %asi
	mov	0x50, %r19
	mov	0x70, %r24
	.word 0x87802073  ! 147: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0xecb72000  ! 148: STHA_I	stha	%r22, [%r28 + 0x0000] %asi
	.word 0xecb7e000  ! 149: STHA_I	stha	%r22, [%r31 + 0x0000] %asi
	.word 0xecc7e000  ! 150: LDSWA_I	ldswa	[%r31, + 0x0000] %asi, %r22
	mov	0x48, %r18
	.word 0xeaa40400  ! 152: STWA_R	stwa	%r21, [%r16 + %r0] 0x20
	.word 0xe4872000  ! 153: LDUWA_I	lduwa	[%r28, + 0x0000] %asi, %r18
	mov	0x78, %r24
	.word 0xe0cf4e80  ! 155: LDSBA_R	ldsba	[%r29, %r0] 0x74, %r16
	.word 0xea876000  ! 156: LDUWA_I	lduwa	[%r29, + 0x0000] %asi, %r21
	.word 0xeac76000  ! 157: LDSWA_I	ldswa	[%r29, + 0x0000] %asi, %r21
	mov	0x3e0, %r21
	.word 0xeea78e40  ! 159: STWA_R	stwa	%r23, [%r30 + %r0] 0x72
	.word 0x8780204f  ! 160: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xeeac6000  ! 161: STBA_I	stba	%r23, [%r17 + 0x0000] %asi
	.word 0x87802020  ! 162: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe6f40400  ! 163: STXA_R	stxa	%r19, [%r16 + %r0] 0x20
	.word 0x87802073  ! 164: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0xeeaec9e0  ! 165: STBA_R	stba	%r23, [%r27 + %r0] 0x4f
	.word 0xe4bf6000  ! 166: STDA_I	stda	%r18, [%r29 + 0x0000] %asi
	.word 0xe48fa000  ! 167: LDUBA_I	lduba	[%r30, + 0x0000] %asi, %r18
	mov	0x3f8, %r23
	.word 0xee978e60  ! 169: LDUHA_R	lduha	[%r30, %r0] 0x73, %r23
	mov	0x40, %r26
	.word 0xe8c7a000  ! 171: LDSWA_I	ldswa	[%r30, + 0x0000] %asi, %r20
	ta	T_CHANGE_NONPRIV	! macro
	mov	0x7d0, %r22
	mov	0x7c8, %r20
	.word 0xe8976000  ! 175: LDUHA_I	lduha	[%r29, + 0x0000] %asi, %r20
	.word 0x87802020  ! 176: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0x87802025  ! 177: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0xe8dc2000  ! 178: LDXA_I	ldxa	[%r16, + 0x0000] %asi, %r20
	.word 0xeab40400  ! 179: STHA_R	stha	%r21, [%r16 + %r0] 0x20
	.word 0xeebfce40  ! 180: STDA_R	stda	%r23, [%r31 + %r0] 0x72
	mov	0x7c0, %r20
	mov	0x40, %r16
	.word 0x8780204f  ! 183: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xeabfe000  ! 184: STDA_I	stda	%r21, [%r31 + 0x0000] %asi
	.word 0x8780204f  ! 185: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0x8780204f  ! 186: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xea8c6000  ! 187: LDUBA_I	lduba	[%r17, + 0x0000] %asi, %r21
	.word 0x87802020  ! 188: WRASI_I	wr	%r0, 0x0020, %asi
	mov	0x68, %r19
	.word 0xe29c0400  ! 190: LDDA_R	ldda	[%r16, %r0] 0x20, %r17
	.word 0xe0b44400  ! 191: STHA_R	stha	%r16, [%r17 + %r0] 0x20
	.word 0xe4b62000  ! 192: STHA_I	stha	%r18, [%r24 + 0x0000] %asi
	.word 0xe2b78e60  ! 193: STHA_R	stha	%r17, [%r30 + %r0] 0x73
	mov	0x60, %r18
	mov	0x3e8, %r21
	mov	0x7d0, %r21
	mov	0x68, %r27
	.word 0xe0b62000  ! 198: STHA_I	stha	%r16, [%r24 + 0x0000] %asi
	.word 0xe09ea000  ! 199: LDDA_I	ldda	[%r26, + 0x0000] %asi, %r16
	.word 0xe0f6e000  ! 200: STXA_I	stxa	%r16, [%r27 + 0x0000] %asi
	.word 0xe0de6000  ! 201: LDXA_I	ldxa	[%r25, + 0x0000] %asi, %r16
	mov	0x7e0, %r23
	.word 0x87802025  ! 203: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0xe0bfe000  ! 204: STDA_I	stda	%r16, [%r31 + 0x0000] %asi
	.word 0xe0afa000  ! 205: STBA_I	stba	%r16, [%r30 + 0x0000] %asi
	mov	0x7e0, %r20
	.word 0xe4dfce40  ! 207: LDXA_R	ldxa	[%r31, %r0] 0x72, %r18
	.word 0xea8e49e0  ! 208: LDUBA_R	lduba	[%r25, %r0] 0x4f, %r21
	.word 0xee9f2000  ! 209: LDDA_I	ldda	[%r28, + 0x0000] %asi, %r23
	.word 0xe8bd84a0  ! 210: STDA_R	stda	%r20, [%r22 + %r0] 0x25
	.word 0xe88fa000  ! 211: LDUBA_I	lduba	[%r30, + 0x0000] %asi, %r20
	.word 0xe8af2000  ! 212: STBA_I	stba	%r20, [%r28 + 0x0000] %asi
	.word 0xe8d7e000  ! 213: LDSHA_I	ldsha	[%r31, + 0x0000] %asi, %r20
	.word 0xe2acc400  ! 214: STBA_R	stba	%r17, [%r19 + %r0] 0x20
	.word 0xe6b78e60  ! 215: STHA_R	stha	%r19, [%r30 + %r0] 0x73
	.word 0x87802072  ! 216: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0xe0ac0400  ! 217: STBA_R	stba	%r16, [%r16 + %r0] 0x20
	mov	0x70, %r24
	.word 0xe2aca000  ! 219: STBA_I	stba	%r17, [%r18 + 0x0000] %asi
	.word 0x87802072  ! 220: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0xe2b6a000  ! 221: STHA_I	stha	%r17, [%r26 + 0x0000] %asi
	mov	0x40, %r25
	mov	0x48, %r24
	mov	0x3c8, %r20
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xe2a6e000  ! 226: STWA_I	stwa	%r17, [%r27 + 0x0000] %asi
	mov	0x7c8, %r22
	.word 0x87802020  ! 228: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe68cc400  ! 229: LDUBA_R	lduba	[%r19, %r0] 0x20, %r19
	.word 0x87802073  ! 230: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0xe2af2000  ! 231: STBA_I	stba	%r17, [%r28 + 0x0000] %asi
	.word 0xe4a4c400  ! 232: STWA_R	stwa	%r18, [%r19 + %r0] 0x20
	.word 0x87802073  ! 233: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0xe8afa000  ! 234: STBA_I	stba	%r20, [%r30 + 0x0000] %asi
	mov	0x60, %r24
	.word 0xe685c4a0  ! 236: LDUWA_R	lduwa	[%r23, %r0] 0x25, %r19
	.word 0xe6f609e0  ! 237: STXA_R	stxa	%r19, [%r24 + %r0] 0x4f
	.word 0xe6b40400  ! 238: STHA_R	stha	%r19, [%r16 + %r0] 0x20
	.word 0x87802020  ! 239: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe2d72000  ! 240: LDSHA_I	ldsha	[%r28, + 0x0000] %asi, %r17
	.word 0xecd70e40  ! 241: LDSHA_R	ldsha	[%r28, %r0] 0x72, %r22
	.word 0xec9c8400  ! 242: LDDA_R	ldda	[%r18, %r0] 0x20, %r22
	.word 0xeca7a000  ! 243: STWA_I	stwa	%r22, [%r30 + 0x0000] %asi
	.word 0xeac44400  ! 244: LDSWA_R	ldswa	[%r17, %r0] 0x20, %r21
	mov	0x50, %r26
	mov	0x40, %r25
	.word 0xe4a584a0  ! 247: STWA_R	stwa	%r18, [%r22 + %r0] 0x25
	.word 0xe8848400  ! 248: LDUWA_R	lduwa	[%r18, %r0] 0x20, %r20
	.word 0xec940400  ! 249: LDUHA_R	lduha	[%r16, %r0] 0x20, %r22
	.word 0x87802020  ! 250: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xeebe49e0  ! 251: STDA_R	stda	%r23, [%r25 + %r0] 0x4f
	.word 0xeabf6000  ! 252: STDA_I	stda	%r21, [%r29 + 0x0000] %asi
	mov	0x28, %r19
	mov	0x7f8, %r23
	mov	0x18, %r16
	.word 0xe695c4a0  ! 256: LDUHA_R	lduha	[%r23, %r0] 0x25, %r19
	.word 0xe6a7ce40  ! 257: STWA_R	stwa	%r19, [%r31 + %r0] 0x72
	.word 0xe8dfe000  ! 258: LDXA_I	ldxa	[%r31, + 0x0000] %asi, %r20
	.word 0xeab7ce40  ! 259: STHA_R	stha	%r21, [%r31 + %r0] 0x72
	.word 0xee8f0e60  ! 260: LDUBA_R	lduba	[%r28, %r0] 0x73, %r23
	mov	0x38, %r17
	.word 0xeab7a000  ! 262: STHA_I	stha	%r21, [%r30 + 0x0000] %asi
	.word 0xeef74e40  ! 263: STXA_R	stxa	%r23, [%r29 + %r0] 0x72
	.word 0xe2b72000  ! 264: STHA_I	stha	%r17, [%r28 + 0x0000] %asi
	.word 0xe2f7e000  ! 265: STXA_I	stxa	%r17, [%r31 + 0x0000] %asi
	.word 0xe2d7a000  ! 266: LDSHA_I	ldsha	[%r30, + 0x0000] %asi, %r17
	.word 0xe2bfe000  ! 267: STDA_I	stda	%r17, [%r31 + 0x0000] %asi
	mov	0x3d8, %r20
	.word 0xe2bf6000  ! 269: STDA_I	stda	%r17, [%r29 + 0x0000] %asi
	.word 0xe2b7e000  ! 270: STHA_I	stha	%r17, [%r31 + 0x0000] %asi
	.word 0x87802020  ! 271: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe2872000  ! 272: LDUWA_I	lduwa	[%r28, + 0x0000] %asi, %r17
	.word 0x87802072  ! 273: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0x8780204f  ! 274: WRASI_I	wr	%r0, 0x004f, %asi
	mov	0x7d8, %r21
	.word 0xe2f689e0  ! 276: STXA_R	stxa	%r17, [%r26 + %r0] 0x4f
	.word 0xec9d04a0  ! 277: LDDA_R	ldda	[%r20, %r0] 0x25, %r22
	.word 0xe2d56000  ! 278: LDSHA_I	ldsha	[%r21, + 0x0000] %asi, %r17
	.word 0xe4a44400  ! 279: STWA_R	stwa	%r18, [%r17 + %r0] 0x20
	mov	0x68, %r25
	.word 0xeaf5a000  ! 281: STXA_I	stxa	%r21, [%r22 + 0x0000] %asi
	.word 0xeabde000  ! 282: STDA_I	stda	%r21, [%r23 + 0x0000] %asi
	mov	0x7e0, %r21
	.word 0xe4dc4400  ! 284: LDXA_R	ldxa	[%r17, %r0] 0x20, %r18
	mov	0x0, %r17
	.word 0xe8f56000  ! 286: STXA_I	stxa	%r20, [%r21 + 0x0000] %asi
	.word 0xe8a52000  ! 287: STWA_I	stwa	%r20, [%r20 + 0x0000] %asi
	.word 0xe8840400  ! 288: LDUWA_R	lduwa	[%r16, %r0] 0x20, %r20
	.word 0xe0ad6000  ! 289: STBA_I	stba	%r16, [%r21 + 0x0000] %asi
	.word 0x87802074  ! 290: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0xe4ae49e0  ! 291: STBA_R	stba	%r18, [%r25 + %r0] 0x4f
	mov	0x48, %r17
	.word 0xe8dfa000  ! 293: LDXA_I	ldxa	[%r30, + 0x0000] %asi, %r20
	mov	0x20, %r24
	.word 0xe28544a0  ! 295: LDUWA_R	lduwa	[%r21, %r0] 0x25, %r17
	.word 0xe4d78e60  ! 296: LDSHA_R	ldsha	[%r30, %r0] 0x73, %r18
	.word 0xeedfa000  ! 297: LDXA_I	ldxa	[%r30, + 0x0000] %asi, %r23
	.word 0xe6b70e80  ! 298: STHA_R	stha	%r19, [%r28 + %r0] 0x74
	.word 0xea9f4e80  ! 299: LDDA_R	ldda	[%r29, %r0] 0x74, %r21
	.word 0xe2d609e0  ! 300: LDSHA_R	ldsha	[%r24, %r0] 0x4f, %r17
	.word 0x87802074  ! 301: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0xec962000  ! 302: LDUHA_I	lduha	[%r24, + 0x0000] %asi, %r22
	.word 0xecae6000  ! 303: STBA_I	stba	%r22, [%r25 + 0x0000] %asi
	.word 0xecb6e000  ! 304: STHA_I	stha	%r22, [%r27 + 0x0000] %asi
	mov	0x60, %r18
	mov	0x7c8, %r21
	.word 0xec8ea000  ! 307: LDUBA_I	lduba	[%r26, + 0x0000] %asi, %r22
	mov	0x28, %r27
	.word 0xecdee000  ! 309: LDXA_I	ldxa	[%r27, + 0x0000] %asi, %r22
	.word 0xecc62000  ! 310: LDSWA_I	ldswa	[%r24, + 0x0000] %asi, %r22
	mov	0x20, %r24
	.word 0xe6a544a0  ! 312: STWA_R	stwa	%r19, [%r21 + %r0] 0x25
	.word 0xe896c9e0  ! 313: LDUHA_R	lduha	[%r27, %r0] 0x4f, %r20
	.word 0xe6a66000  ! 314: STWA_I	stwa	%r19, [%r25 + 0x0000] %asi
	.word 0x87802020  ! 315: WRASI_I	wr	%r0, 0x0020, %asi
	mov	0x28, %r27
	.word 0xe6844400  ! 317: LDUWA_R	lduwa	[%r17, %r0] 0x20, %r19
	mov	0x58, %r16
	mov	0x68, %r26
	.word 0xecbfe000  ! 320: STDA_I	stda	%r22, [%r31 + 0x0000] %asi
	mov	0x58, %r18
	.word 0xe68e89e0  ! 322: LDUBA_R	lduba	[%r26, %r0] 0x4f, %r19
	.word 0xe8dc8400  ! 323: LDXA_R	ldxa	[%r18, %r0] 0x20, %r20
	.word 0xeaa689e0  ! 324: STWA_R	stwa	%r21, [%r26 + %r0] 0x4f
	mov	0x58, %r19
	.word 0xe2b5c4a0  ! 326: STHA_R	stha	%r17, [%r23 + %r0] 0x25
	.word 0xe2df2000  ! 327: LDXA_I	ldxa	[%r28, + 0x0000] %asi, %r17
	mov	0x30, %r19
	mov	0x18, %r18
	.word 0xe88d84a0  ! 330: LDUBA_R	lduba	[%r22, %r0] 0x25, %r20
	mov	0x10, %r17
	mov	0x0, %r25
	ta	T_CHANGE_NONHPRIV	! macro
	mov	0x3c0, %r23
	.word 0xeaa76000  ! 335: STWA_I	stwa	%r21, [%r29 + 0x0000] %asi
	.word 0x87802020  ! 336: WRASI_I	wr	%r0, 0x0020, %asi
	mov	0x38, %r19
	.word 0xe0afce40  ! 338: STBA_R	stba	%r16, [%r31 + %r0] 0x72
	mov	0x50, %r17
	.word 0xe4878e40  ! 340: LDUWA_R	lduwa	[%r30, %r0] 0x72, %r18
	.word 0xe69f6000  ! 341: LDDA_I	ldda	[%r29, + 0x0000] %asi, %r19
	.word 0xe6cec9e0  ! 342: LDSBA_R	ldsba	[%r27, %r0] 0x4f, %r19
	.word 0xe2b4c400  ! 343: STHA_R	stha	%r17, [%r19 + %r0] 0x20
	.word 0xe8840400  ! 344: LDUWA_R	lduwa	[%r16, %r0] 0x20, %r20
	.word 0x87802020  ! 345: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xea874e40  ! 346: LDUWA_R	lduwa	[%r29, %r0] 0x72, %r21
	.word 0xecb72000  ! 347: STHA_I	stha	%r22, [%r28 + 0x0000] %asi
	.word 0xecc7a000  ! 348: LDSWA_I	ldswa	[%r30, + 0x0000] %asi, %r22
	.word 0xe4f44400  ! 349: STXA_R	stxa	%r18, [%r17 + %r0] 0x20
	mov	0x48, %r17
	.word 0xe4b544a0  ! 351: STHA_R	stha	%r18, [%r21 + %r0] 0x25
	.word 0xe6a504a0  ! 352: STWA_R	stwa	%r19, [%r20 + %r0] 0x25
	mov	0x78, %r26
	.word 0xe4a7a000  ! 354: STWA_I	stwa	%r18, [%r30 + 0x0000] %asi
	.word 0xecd48400  ! 355: LDSHA_R	ldsha	[%r18, %r0] 0x20, %r22
	mov	0x3d8, %r21
	.word 0xee9f8e60  ! 357: LDDA_R	ldda	[%r30, %r0] 0x73, %r23
	.word 0xecb78e40  ! 358: STHA_R	stha	%r22, [%r30 + %r0] 0x72
	.word 0xeabf6000  ! 359: STDA_I	stda	%r21, [%r29 + 0x0000] %asi
	mov	0x7c8, %r21
	.word 0xeaa76000  ! 361: STWA_I	stwa	%r21, [%r29 + 0x0000] %asi
	.word 0x87802020  ! 362: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0x87802074  ! 363: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0xeaa78e60  ! 364: STWA_R	stwa	%r21, [%r30 + %r0] 0x73
	.word 0xea9d04a0  ! 365: LDDA_R	ldda	[%r20, %r0] 0x25, %r21
	mov	0x7f8, %r23
	.word 0xeab7a000  ! 367: STHA_I	stha	%r21, [%r30 + 0x0000] %asi
	mov	0x3c8, %r22
	.word 0xea97a000  ! 369: LDUHA_I	lduha	[%r30, + 0x0000] %asi, %r21
	.word 0xe6c78e80  ! 370: LDSWA_R	ldswa	[%r30, %r0] 0x74, %r19
	.word 0xe4b74e80  ! 371: STHA_R	stha	%r18, [%r29 + %r0] 0x74
	.word 0xe88f2000  ! 372: LDUBA_I	lduba	[%r28, + 0x0000] %asi, %r20
	mov	0x3c8, %r22
	.word 0xe8872000  ! 374: LDUWA_I	lduwa	[%r28, + 0x0000] %asi, %r20
	.word 0xec974e60  ! 375: LDUHA_R	lduha	[%r29, %r0] 0x73, %r22
	.word 0x87802073  ! 376: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0xeaac4400  ! 377: STBA_R	stba	%r21, [%r17 + %r0] 0x20
	mov	0x20, %r26
	.word 0xe6b5c4a0  ! 379: STHA_R	stha	%r19, [%r23 + %r0] 0x25
	.word 0xe2afe000  ! 380: STBA_I	stba	%r17, [%r31 + 0x0000] %asi
	.word 0xe6aec9e0  ! 381: STBA_R	stba	%r19, [%r27 + %r0] 0x4f
	.word 0xe487a000  ! 382: LDUWA_I	lduwa	[%r30, + 0x0000] %asi, %r18
	.word 0xe4f584a0  ! 383: STXA_R	stxa	%r18, [%r22 + %r0] 0x25
	.word 0xeebf0e60  ! 384: STDA_R	stda	%r23, [%r28 + %r0] 0x73
	.word 0xe8cf2000  ! 385: LDSBA_I	ldsba	[%r28, + 0x0000] %asi, %r20
	.word 0xe6dcc400  ! 386: LDXA_R	ldxa	[%r19, %r0] 0x20, %r19
	mov	0x3c0, %r22
	.word 0x87802074  ! 388: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0xea9ce000  ! 389: LDDA_I	ldda	[%r19, + 0x0000] %asi, %r21
	mov	0x68, %r16
	.word 0xeabc2000  ! 391: STDA_I	stda	%r21, [%r16 + 0x0000] %asi
	.word 0xeaa4e000  ! 392: STWA_I	stwa	%r21, [%r19 + 0x0000] %asi
	.word 0x8780204f  ! 393: WRASI_I	wr	%r0, 0x004f, %asi
	mov	0x68, %r27
	.word 0x87802020  ! 395: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe2dfce80  ! 396: LDXA_R	ldxa	[%r31, %r0] 0x74, %r17
	.word 0xe4f7e000  ! 397: STXA_I	stxa	%r18, [%r31 + 0x0000] %asi
	.word 0x87802074  ! 398: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0xe8c44400  ! 399: LDSWA_R	ldswa	[%r17, %r0] 0x20, %r20
	mov	0x0, %r16
	mov	0x8, %r24
	.word 0xe4b5c4a0  ! 402: STHA_R	stha	%r18, [%r23 + %r0] 0x25
	.word 0xe88f2000  ! 403: LDUBA_I	lduba	[%r28, + 0x0000] %asi, %r20
	mov	0x7f0, %r22
	.word 0xeaf6c9e0  ! 405: STXA_R	stxa	%r21, [%r27 + %r0] 0x4f
	.word 0x8780204f  ! 406: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xe2c7e000  ! 407: LDSWA_I	ldswa	[%r31, + 0x0000] %asi, %r17
	mov	0x3d0, %r23
	.word 0xeead04a0  ! 409: STBA_R	stba	%r23, [%r20 + %r0] 0x25
	.word 0xeab7ce40  ! 410: STHA_R	stha	%r21, [%r31 + %r0] 0x72
	mov	0x7e0, %r22
	.word 0xe8d76000  ! 412: LDSHA_I	ldsha	[%r29, + 0x0000] %asi, %r20
	mov	0x3f8, %r23
	mov	0x70, %r16
	.word 0xe8af2000  ! 415: STBA_I	stba	%r20, [%r28 + 0x0000] %asi
	.word 0xe48e89e0  ! 416: LDUBA_R	lduba	[%r26, %r0] 0x4f, %r18
	.word 0xe0b78e80  ! 417: STHA_R	stha	%r16, [%r30 + %r0] 0x74
	mov	0x7f0, %r22
	mov	0x18, %r26
	.word 0xe487e000  ! 420: LDUWA_I	lduwa	[%r31, + 0x0000] %asi, %r18
	.word 0xe4b72000  ! 421: STHA_I	stha	%r18, [%r28 + 0x0000] %asi
	.word 0xe4dfa000  ! 422: LDXA_I	ldxa	[%r30, + 0x0000] %asi, %r18
	mov	0x78, %r26
	mov	0x58, %r27
	.word 0xe2848400  ! 425: LDUWA_R	lduwa	[%r18, %r0] 0x20, %r17
	.word 0xe6872000  ! 426: LDUWA_I	lduwa	[%r28, + 0x0000] %asi, %r19
	.word 0xe6dc8400  ! 427: LDXA_R	ldxa	[%r18, %r0] 0x20, %r19
	.word 0x87802073  ! 428: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0xe8a7e000  ! 429: STWA_I	stwa	%r20, [%r31 + 0x0000] %asi
	.word 0x87802025  ! 430: WRASI_I	wr	%r0, 0x0025, %asi
	mov	0x68, %r17
	.word 0xeca70e60  ! 432: STWA_R	stwa	%r22, [%r28 + %r0] 0x73
	.word 0xea9c0400  ! 433: LDDA_R	ldda	[%r16, %r0] 0x20, %r21
	.word 0xec84c400  ! 434: LDUWA_R	lduwa	[%r19, %r0] 0x20, %r22
	.word 0x87802020  ! 435: WRASI_I	wr	%r0, 0x0020, %asi
	mov	0x28, %r26
	.word 0xe6c6c9e0  ! 437: LDSWA_R	ldswa	[%r27, %r0] 0x4f, %r19
	.word 0xe6a7ce80  ! 438: STWA_R	stwa	%r19, [%r31 + %r0] 0x74
	mov	0x3d0, %r23
	.word 0xeeaf8e40  ! 440: STBA_R	stba	%r23, [%r30 + %r0] 0x72
	.word 0xeed74e60  ! 441: LDSHA_R	ldsha	[%r29, %r0] 0x73, %r23
	mov	0x3e8, %r21
	.word 0x87802072  ! 443: WRASI_I	wr	%r0, 0x0072, %asi
	mov	0x3e8, %r21
	.word 0xe8cf6000  ! 445: LDSBA_I	ldsba	[%r29, + 0x0000] %asi, %r20
	mov	0x3e0, %r20
	mov	0x0, %r25
	.word 0xeadf8e40  ! 448: LDXA_R	ldxa	[%r30, %r0] 0x72, %r21
	.word 0xe2bfe000  ! 449: STDA_I	stda	%r17, [%r31 + 0x0000] %asi
	.word 0xeaa5c4a0  ! 450: STWA_R	stwa	%r21, [%r23 + %r0] 0x25
	mov	0x7e8, %r23
	.word 0xe6c76000  ! 452: LDSWA_I	ldswa	[%r29, + 0x0000] %asi, %r19
	mov	0x70, %r17
	.word 0xe6afe000  ! 454: STBA_I	stba	%r19, [%r31 + 0x0000] %asi
	.word 0xe6df6000  ! 455: LDXA_I	ldxa	[%r29, + 0x0000] %asi, %r19
	.word 0x87802020  ! 456: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe29f4e40  ! 457: LDDA_R	ldda	[%r29, %r0] 0x72, %r17
	mov	0x0, %r18
	.word 0xe2d62000  ! 459: LDSHA_I	ldsha	[%r24, + 0x0000] %asi, %r17
	.word 0xe2b584a0  ! 460: STHA_R	stha	%r17, [%r22 + %r0] 0x25
	.word 0xe6cf4e80  ! 461: LDSBA_R	ldsba	[%r29, %r0] 0x74, %r19
	.word 0xee848400  ! 462: LDUWA_R	lduwa	[%r18, %r0] 0x20, %r23
	.word 0xead6e000  ! 463: LDSHA_I	ldsha	[%r27, + 0x0000] %asi, %r21
	.word 0xeab66000  ! 464: STHA_I	stha	%r21, [%r25 + 0x0000] %asi
	.word 0xe6d70e40  ! 465: LDSHA_R	ldsha	[%r28, %r0] 0x72, %r19
	.word 0xe0a6a000  ! 466: STWA_I	stwa	%r16, [%r26 + 0x0000] %asi
	mov	0x40, %r16
	mov	0x7c0, %r23
	.word 0x8780204f  ! 469: WRASI_I	wr	%r0, 0x004f, %asi
	mov	0x3d8, %r23
	.word 0xeaa40400  ! 471: STWA_R	stwa	%r21, [%r16 + %r0] 0x20
	mov	0x7f0, %r23
	.word 0xeed7ce60  ! 473: LDSHA_R	ldsha	[%r31, %r0] 0x73, %r23
	mov	0x68, %r26
	mov	0x8, %r17
	mov	0x48, %r19
	mov	0x40, %r18
	mov	0x30, %r18
	.word 0xecaf8e80  ! 479: STBA_R	stba	%r22, [%r30 + %r0] 0x74
	.word 0xecf584a0  ! 480: STXA_R	stxa	%r22, [%r22 + %r0] 0x25
	.word 0xe095a000  ! 481: LDUHA_I	lduha	[%r22, + 0x0000] %asi, %r16
	.word 0xe0852000  ! 482: LDUWA_I	lduwa	[%r20, + 0x0000] %asi, %r16
	.word 0xea9ec9e0  ! 483: LDDA_R	ldda	[%r27, %r0] 0x4f, %r21
	.word 0xe2ad44a0  ! 484: STBA_R	stba	%r17, [%r21 + %r0] 0x25
	.word 0xe0a48400  ! 485: STWA_R	stwa	%r16, [%r18 + %r0] 0x20
	.word 0xeca40400  ! 486: STWA_R	stwa	%r22, [%r16 + %r0] 0x20
	.word 0xeca5e000  ! 487: STWA_I	stwa	%r22, [%r23 + 0x0000] %asi
	.word 0xeaaf0e80  ! 488: STBA_R	stba	%r21, [%r28 + %r0] 0x74
	mov	0x3d8, %r23
	.word 0xe2f5e000  ! 490: STXA_I	stxa	%r17, [%r23 + 0x0000] %asi
	.word 0xe2bd6000  ! 491: STDA_I	stda	%r17, [%r21 + 0x0000] %asi
	mov	0x48, %r16
	.word 0xe2bf0e40  ! 493: STDA_R	stda	%r17, [%r28 + %r0] 0x72
	mov	0x0, %r17
	.word 0xe6974e80  ! 495: LDUHA_R	lduha	[%r29, %r0] 0x74, %r19
	.word 0xe0d4c400  ! 496: LDSHA_R	ldsha	[%r19, %r0] 0x20, %r16
	mov	0x48, %r16
	.word 0xee9f8e80  ! 498: LDDA_R	ldda	[%r30, %r0] 0x74, %r23
	.word 0x87802074  ! 499: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0xe6a4e000  ! 500: STWA_I	stwa	%r19, [%r19 + 0x0000] %asi
	.word 0xecf70e40  ! 501: STXA_R	stxa	%r22, [%r28 + %r0] 0x72
	.word 0x87802073  ! 502: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0x87802020  ! 503: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0x87802074  ! 504: WRASI_I	wr	%r0, 0x0074, %asi
	mov	0x0, %r17
	mov	0x20, %r26
	.word 0x87802072  ! 507: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0x87802020  ! 508: WRASI_I	wr	%r0, 0x0020, %asi
	mov	0x18, %r24
	.word 0x87802072  ! 510: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0xe2b6e000  ! 511: STHA_I	stha	%r17, [%r27 + 0x0000] %asi
	mov	0x68, %r19
	.word 0xe2c6e000  ! 513: LDSWA_I	ldswa	[%r27, + 0x0000] %asi, %r17
	.word 0xe2cd84a0  ! 514: LDSBA_R	ldsba	[%r22, %r0] 0x25, %r17
	.word 0xe2d66000  ! 515: LDSHA_I	ldsha	[%r25, + 0x0000] %asi, %r17
	mov	0x3d0, %r20
	.word 0xe2bea000  ! 517: STDA_I	stda	%r17, [%r26 + 0x0000] %asi
	.word 0xe2de2000  ! 518: LDXA_I	ldxa	[%r24, + 0x0000] %asi, %r17
	.word 0x87802074  ! 519: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0xe2afe000  ! 520: STBA_I	stba	%r17, [%r31 + 0x0000] %asi
	.word 0xe2cf2000  ! 521: LDSBA_I	ldsba	[%r28, + 0x0000] %asi, %r17
	.word 0xeaae49e0  ! 522: STBA_R	stba	%r21, [%r25 + %r0] 0x4f
	.word 0xeadfa000  ! 523: LDXA_I	ldxa	[%r30, + 0x0000] %asi, %r21
	mov	0x70, %r25
	mov	0x10, %r24
	.word 0x8780204f  ! 526: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xecf4c400  ! 527: STXA_R	stxa	%r22, [%r19 + %r0] 0x20
	.word 0xeabea000  ! 528: STDA_I	stda	%r21, [%r26 + 0x0000] %asi
	.word 0x87802074  ! 529: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0xea97e000  ! 530: LDUHA_I	lduha	[%r31, + 0x0000] %asi, %r21
	.word 0xe28c4400  ! 531: LDUBA_R	lduba	[%r17, %r0] 0x20, %r17
	.word 0xe4f504a0  ! 532: STXA_R	stxa	%r18, [%r20 + %r0] 0x25
	.word 0xec9f2000  ! 533: LDDA_I	ldda	[%r28, + 0x0000] %asi, %r22
	.word 0xe8bfce40  ! 534: STDA_R	stda	%r20, [%r31 + %r0] 0x72
	.word 0xe8a7a000  ! 535: STWA_I	stwa	%r20, [%r30 + 0x0000] %asi
	.word 0xe0dfce40  ! 536: LDXA_R	ldxa	[%r31, %r0] 0x72, %r16
	.word 0x87802073  ! 537: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0x87802020  ! 538: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xee9f6000  ! 539: LDDA_I	ldda	[%r29, + 0x0000] %asi, %r23
	mov	0x7c0, %r21
	mov	0x78, %r18
	.word 0xeecfe000  ! 542: LDSBA_I	ldsba	[%r31, + 0x0000] %asi, %r23
	mov	0x3c0, %r21
	.word 0xeed72000  ! 544: LDSHA_I	ldsha	[%r28, + 0x0000] %asi, %r23
	.word 0xeed7a000  ! 545: LDSHA_I	ldsha	[%r30, + 0x0000] %asi, %r23
	.word 0xe2f74e60  ! 546: STXA_R	stxa	%r17, [%r29 + %r0] 0x73
	.word 0xe2b7ce80  ! 547: STHA_R	stha	%r17, [%r31 + %r0] 0x74
	mov	0x3f0, %r21
	.word 0xe6f609e0  ! 549: STXA_R	stxa	%r19, [%r24 + %r0] 0x4f
	.word 0xe6bd04a0  ! 550: STDA_R	stda	%r19, [%r20 + %r0] 0x25
	mov	0x28, %r19
	.word 0xe2a6c9e0  ! 552: STWA_R	stwa	%r17, [%r27 + %r0] 0x4f
	.word 0x8780204f  ! 553: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xe2bde000  ! 554: STDA_I	stda	%r17, [%r23 + 0x0000] %asi
	.word 0xe2ada000  ! 555: STBA_I	stba	%r17, [%r22 + 0x0000] %asi
	.word 0xe2952000  ! 556: LDUHA_I	lduha	[%r20, + 0x0000] %asi, %r17
	.word 0xe2cda000  ! 557: LDSBA_I	ldsba	[%r22, + 0x0000] %asi, %r17
	.word 0xe2852000  ! 558: LDUWA_I	lduwa	[%r20, + 0x0000] %asi, %r17
	.word 0xe28d2000  ! 559: LDUBA_I	lduba	[%r20, + 0x0000] %asi, %r17
	ta	T_CHANGE_PRIV	! macro
	.word 0xeaa70e60  ! 561: STWA_R	stwa	%r21, [%r28 + %r0] 0x73
	.word 0xe49f4e60  ! 562: LDDA_R	ldda	[%r29, %r0] 0x73, %r18
	mov	0x38, %r26
	.word 0xeec52000  ! 564: LDSWA_I	ldswa	[%r20, + 0x0000] %asi, %r23
	mov	0x0, %r17
	.word 0xe28f8e80  ! 566: LDUBA_R	lduba	[%r30, %r0] 0x74, %r17
	mov	0x60, %r27
	.word 0x87802072  ! 568: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0x87802020  ! 569: WRASI_I	wr	%r0, 0x0020, %asi
	mov	0x58, %r26
	.word 0xe096c9e0  ! 571: LDUHA_R	lduha	[%r27, %r0] 0x4f, %r16
	mov	0x7e0, %r20
	mov	0x28, %r19
	.word 0xeccf2000  ! 574: LDSBA_I	ldsba	[%r28, + 0x0000] %asi, %r22
	.word 0xecb7a000  ! 575: STHA_I	stha	%r22, [%r30 + 0x0000] %asi
	mov	0x70, %r24
	mov	0x3e0, %r20
	.word 0xe0b6c9e0  ! 578: STHA_R	stha	%r16, [%r27 + %r0] 0x4f
	.word 0xeaf76000  ! 579: STXA_I	stxa	%r21, [%r29 + 0x0000] %asi
	.word 0xecf40400  ! 580: STXA_R	stxa	%r22, [%r16 + %r0] 0x20
	.word 0xe4dc0400  ! 581: LDXA_R	ldxa	[%r16, %r0] 0x20, %r18
	.word 0xecbf4e80  ! 582: STDA_R	stda	%r22, [%r29 + %r0] 0x74
	.word 0xeab7a000  ! 583: STHA_I	stha	%r21, [%r30 + 0x0000] %asi
	.word 0xeccc8400  ! 584: LDSBA_R	ldsba	[%r18, %r0] 0x20, %r22
	.word 0xe0a7ce60  ! 585: STWA_R	stwa	%r16, [%r31 + %r0] 0x73
	mov	0x60, %r16
	mov	0x28, %r25
	.word 0xe6bf6000  ! 588: STDA_I	stda	%r19, [%r29 + 0x0000] %asi
	.word 0x8780204f  ! 589: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xe6dc0400  ! 590: LDXA_R	ldxa	[%r16, %r0] 0x20, %r19
	.word 0xe8dee000  ! 591: LDXA_I	ldxa	[%r27, + 0x0000] %asi, %r20
	.word 0xe8b6e000  ! 592: STHA_I	stha	%r20, [%r27 + 0x0000] %asi
	.word 0x8780204f  ! 593: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0x87802020  ! 594: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xeeae09e0  ! 595: STBA_R	stba	%r23, [%r24 + %r0] 0x4f
	mov	0x7e8, %r22
	mov	0x38, %r25
	.word 0xeab48400  ! 598: STHA_R	stha	%r21, [%r18 + %r0] 0x20
	.word 0xe69f8e40  ! 599: LDDA_R	ldda	[%r30, %r0] 0x72, %r19
	.word 0xe6ad84a0  ! 600: STBA_R	stba	%r19, [%r22 + %r0] 0x25
	.word 0x8780204f  ! 601: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xeeccc400  ! 602: LDSBA_R	ldsba	[%r19, %r0] 0x20, %r23
	mov	0x30, %r25
	.word 0xecf70e40  ! 604: STXA_R	stxa	%r22, [%r28 + %r0] 0x72
	.word 0xecac4400  ! 605: STBA_R	stba	%r22, [%r17 + %r0] 0x20
	.word 0xe2b72000  ! 606: STHA_I	stha	%r17, [%r28 + 0x0000] %asi
	.word 0xe2d7a000  ! 607: LDSHA_I	ldsha	[%r30, + 0x0000] %asi, %r17
	.word 0x87802025  ! 608: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0xeeb48400  ! 609: STHA_R	stha	%r23, [%r18 + %r0] 0x20
	.word 0xe4dea000  ! 610: LDXA_I	ldxa	[%r26, + 0x0000] %asi, %r18
	.word 0xe88e49e0  ! 611: LDUBA_R	lduba	[%r25, %r0] 0x4f, %r20
	.word 0xee87ce40  ! 612: LDUWA_R	lduwa	[%r31, %r0] 0x72, %r23
	.word 0xe48e49e0  ! 613: LDUBA_R	lduba	[%r25, %r0] 0x4f, %r18
	mov	0x38, %r24
	.word 0xe4be2000  ! 615: STDA_I	stda	%r18, [%r24 + 0x0000] %asi
	.word 0xe4f62000  ! 616: STXA_I	stxa	%r18, [%r24 + 0x0000] %asi
	mov	0x30, %r18
	.word 0xe8cf8e80  ! 618: LDSBA_R	ldsba	[%r30, %r0] 0x74, %r20
	.word 0xe2d6a000  ! 619: LDSHA_I	ldsha	[%r26, + 0x0000] %asi, %r17
	mov	0x18, %r17
	.word 0x8780204f  ! 621: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0x8780204f  ! 622: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0x87802073  ! 623: WRASI_I	wr	%r0, 0x0073, %asi
	mov	0x7d8, %r21
	.word 0xe2976000  ! 625: LDUHA_I	lduha	[%r29, + 0x0000] %asi, %r17
	.word 0xe4f40400  ! 626: STXA_R	stxa	%r18, [%r16 + %r0] 0x20
	.word 0xecdd44a0  ! 627: LDXA_R	ldxa	[%r21, %r0] 0x25, %r22
	mov	0x60, %r16
	.word 0xe6cfe000  ! 629: LDSBA_I	ldsba	[%r31, + 0x0000] %asi, %r19
	.word 0xe6bf2000  ! 630: STDA_I	stda	%r19, [%r28 + 0x0000] %asi
	.word 0xe68f2000  ! 631: LDUBA_I	lduba	[%r28, + 0x0000] %asi, %r19
	.word 0xe6f7e000  ! 632: STXA_I	stxa	%r19, [%r31 + 0x0000] %asi
	.word 0xe6f7a000  ! 633: STXA_I	stxa	%r19, [%r30 + 0x0000] %asi
	.word 0xe6f7a000  ! 634: STXA_I	stxa	%r19, [%r30 + 0x0000] %asi
	.word 0xead584a0  ! 635: LDSHA_R	ldsha	[%r22, %r0] 0x25, %r21
	mov	0x50, %r18
	mov	0x10, %r25
	mov	0x18, %r25
	.word 0xee97e000  ! 639: LDUHA_I	lduha	[%r31, + 0x0000] %asi, %r23
	.word 0xeea7e000  ! 640: STWA_I	stwa	%r23, [%r31 + 0x0000] %asi
	.word 0xee972000  ! 641: LDUHA_I	lduha	[%r28, + 0x0000] %asi, %r23
	mov	0x3e8, %r21
	.word 0xe8d7ce40  ! 643: LDSHA_R	ldsha	[%r31, %r0] 0x72, %r20
	.word 0x8780204f  ! 644: WRASI_I	wr	%r0, 0x004f, %asi
	mov	0x3f8, %r22
	.word 0xe4bf4e60  ! 646: STDA_R	stda	%r18, [%r29 + %r0] 0x73
	.word 0xe8c7ce60  ! 647: LDSWA_R	ldswa	[%r31, %r0] 0x73, %r20
	.word 0xecd76000  ! 648: LDSHA_I	ldsha	[%r29, + 0x0000] %asi, %r22
	.word 0xecafe000  ! 649: STBA_I	stba	%r22, [%r31 + 0x0000] %asi
	.word 0xeccfe000  ! 650: LDSBA_I	ldsba	[%r31, + 0x0000] %asi, %r22
	.word 0xe8b44400  ! 651: STHA_R	stha	%r20, [%r17 + %r0] 0x20
	.word 0xe4af2000  ! 652: STBA_I	stba	%r18, [%r28 + 0x0000] %asi
	.word 0xead44400  ! 653: LDSHA_R	ldsha	[%r17, %r0] 0x20, %r21
	.word 0xecc7a000  ! 654: LDSWA_I	ldswa	[%r30, + 0x0000] %asi, %r22
	.word 0xecbfe000  ! 655: STDA_I	stda	%r22, [%r31 + 0x0000] %asi
	mov	0x18, %r18
	.word 0xecf72000  ! 657: STXA_I	stxa	%r22, [%r28 + 0x0000] %asi
	.word 0x8780204f  ! 658: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0x87802074  ! 659: WRASI_I	wr	%r0, 0x0074, %asi
	mov	0x70, %r16
	mov	0x18, %r26
	mov	0x40, %r17
	.word 0xeec44400  ! 663: LDSWA_R	ldswa	[%r17, %r0] 0x20, %r23
	.word 0xec9c8400  ! 664: LDDA_R	ldda	[%r18, %r0] 0x20, %r22
	.word 0xeeb70e40  ! 665: STHA_R	stha	%r23, [%r28 + %r0] 0x72
	.word 0xe8df2000  ! 666: LDXA_I	ldxa	[%r28, + 0x0000] %asi, %r20
	mov	0x20, %r25
	.word 0xe4d40400  ! 668: LDSHA_R	ldsha	[%r16, %r0] 0x20, %r18
	.word 0xe2ad04a0  ! 669: STBA_R	stba	%r17, [%r20 + %r0] 0x25
	mov	0x7f8, %r22
	.word 0x87802020  ! 671: WRASI_I	wr	%r0, 0x0020, %asi
	mov	0x48, %r27
	.word 0xeccf2000  ! 673: LDSBA_I	ldsba	[%r28, + 0x0000] %asi, %r22
	.word 0xecbf6000  ! 674: STDA_I	stda	%r22, [%r29 + 0x0000] %asi
	.word 0xe6a5c4a0  ! 675: STWA_R	stwa	%r19, [%r23 + %r0] 0x25
	.word 0xe6afce40  ! 676: STBA_R	stba	%r19, [%r31 + %r0] 0x72
	.word 0x8780204f  ! 677: WRASI_I	wr	%r0, 0x004f, %asi
	mov	0x3c8, %r22
	mov	0x70, %r27
	.word 0xe2bf8e60  ! 680: STDA_R	stda	%r17, [%r30 + %r0] 0x73
	.word 0xe4a7a000  ! 681: STWA_I	stwa	%r18, [%r30 + 0x0000] %asi
	.word 0xe4df6000  ! 682: LDXA_I	ldxa	[%r29, + 0x0000] %asi, %r18
	.word 0xe4d76000  ! 683: LDSHA_I	ldsha	[%r29, + 0x0000] %asi, %r18
	.word 0xe497e000  ! 684: LDUHA_I	lduha	[%r31, + 0x0000] %asi, %r18
	.word 0xeeb70e80  ! 685: STHA_R	stha	%r23, [%r28 + %r0] 0x74
	mov	0x78, %r16
	mov	0x20, %r24
	.word 0xe28f6000  ! 688: LDUBA_I	lduba	[%r29, + 0x0000] %asi, %r17
	.word 0xe28fa000  ! 689: LDUBA_I	lduba	[%r30, + 0x0000] %asi, %r17
	.word 0xe2b7ce40  ! 690: STHA_R	stha	%r17, [%r31 + %r0] 0x72
	.word 0xeac72000  ! 691: LDSWA_I	ldswa	[%r28, + 0x0000] %asi, %r21
	.word 0xe0d70e80  ! 692: LDSHA_R	ldsha	[%r28, %r0] 0x74, %r16
	.word 0xe88f6000  ! 693: LDUBA_I	lduba	[%r29, + 0x0000] %asi, %r20
	.word 0xe69f8e60  ! 694: LDDA_R	ldda	[%r30, %r0] 0x73, %r19
	.word 0xe6bfa000  ! 695: STDA_I	stda	%r19, [%r30 + 0x0000] %asi
	.word 0xe6f7a000  ! 696: STXA_I	stxa	%r19, [%r30 + 0x0000] %asi
	mov	0x28, %r16
	.word 0xe6a4c400  ! 698: STWA_R	stwa	%r19, [%r19 + %r0] 0x20
	.word 0xe6874e40  ! 699: LDUWA_R	lduwa	[%r29, %r0] 0x72, %r19
	mov	0x3f8, %r20
	mov	0x60, %r26
	.word 0xe694c400  ! 702: LDUHA_R	lduha	[%r19, %r0] 0x20, %r19
	.word 0xeea72000  ! 703: STWA_I	stwa	%r23, [%r28 + 0x0000] %asi
	.word 0xeed78e80  ! 704: LDSHA_R	ldsha	[%r30, %r0] 0x74, %r23
	.word 0xea87a000  ! 705: LDUWA_I	lduwa	[%r30, + 0x0000] %asi, %r21
	mov	0x10, %r17
	mov	0x3f0, %r21
	ta	T_CHANGE_NONPRIV	! macro
	mov	0x20, %r24
	.word 0xee8c8400  ! 710: LDUBA_R	lduba	[%r18, %r0] 0x20, %r23
	.word 0xeef44400  ! 711: STXA_R	stxa	%r23, [%r17 + %r0] 0x20
	.word 0xe2978e80  ! 712: LDUHA_R	lduha	[%r30, %r0] 0x74, %r17
	.word 0xecbfa000  ! 713: STDA_I	stda	%r22, [%r30 + 0x0000] %asi
	.word 0x87802074  ! 714: WRASI_I	wr	%r0, 0x0074, %asi
	mov	0x68, %r19
	.word 0xe88649e0  ! 716: LDUWA_R	lduwa	[%r25, %r0] 0x4f, %r20
	.word 0xe4de49e0  ! 717: LDXA_R	ldxa	[%r25, %r0] 0x4f, %r18
	.word 0xecb72000  ! 718: STHA_I	stha	%r22, [%r28 + 0x0000] %asi
	.word 0xec9c4400  ! 719: LDDA_R	ldda	[%r17, %r0] 0x20, %r22
	mov	0x40, %r24
	mov	0x18, %r17
	.word 0xe2972000  ! 722: LDUHA_I	lduha	[%r28, + 0x0000] %asi, %r17
	mov	0x7f8, %r23
	.word 0xe2cf6000  ! 724: LDSBA_I	ldsba	[%r29, + 0x0000] %asi, %r17
	.word 0xe28fa000  ! 725: LDUBA_I	lduba	[%r30, + 0x0000] %asi, %r17
	mov	0x7e8, %r22
	.word 0xe2cfe000  ! 727: LDSBA_I	ldsba	[%r31, + 0x0000] %asi, %r17
	.word 0xe2872000  ! 728: LDUWA_I	lduwa	[%r28, + 0x0000] %asi, %r17
	mov	0x7c8, %r23
	.word 0x8780204f  ! 730: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xe8bc8400  ! 731: STDA_R	stda	%r20, [%r18 + %r0] 0x20
	.word 0xeef7e000  ! 732: STXA_I	stxa	%r23, [%r31 + 0x0000] %asi
	.word 0xe0be89e0  ! 733: STDA_R	stda	%r16, [%r26 + %r0] 0x4f
	.word 0xe6bfa000  ! 734: STDA_I	stda	%r19, [%r30 + 0x0000] %asi
	.word 0xeeb7ce80  ! 735: STHA_R	stha	%r23, [%r31 + %r0] 0x74
	.word 0xeccf8e80  ! 736: LDSBA_R	ldsba	[%r30, %r0] 0x74, %r22
	.word 0x87802072  ! 737: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0x87802072  ! 738: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0xe8c44400  ! 739: LDSWA_R	ldswa	[%r17, %r0] 0x20, %r20
	mov	0x3e8, %r22
	ta	T_CHANGE_HPRIV	! macro
	.word 0xe6c48400  ! 742: LDSWA_R	ldswa	[%r18, %r0] 0x20, %r19
	mov	0x7c0, %r22
	.word 0xe8866000  ! 744: LDUWA_I	lduwa	[%r25, + 0x0000] %asi, %r20
	.word 0xe88e6000  ! 745: LDUBA_I	lduba	[%r25, + 0x0000] %asi, %r20
	.word 0xe0d6c9e0  ! 746: LDSHA_R	ldsha	[%r27, %r0] 0x4f, %r16
	.word 0xecc66000  ! 747: LDSWA_I	ldswa	[%r25, + 0x0000] %asi, %r22
	.word 0xecce6000  ! 748: LDSBA_I	ldsba	[%r25, + 0x0000] %asi, %r22
	.word 0xecf66000  ! 749: STXA_I	stxa	%r22, [%r25 + 0x0000] %asi
	.word 0xe4cf4e60  ! 750: LDSBA_R	ldsba	[%r29, %r0] 0x73, %r18
	.word 0xe4bcc400  ! 751: STDA_R	stda	%r18, [%r19 + %r0] 0x20
	mov	0x30, %r27
	.word 0x87802072  ! 753: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0xe0a48400  ! 754: STWA_R	stwa	%r16, [%r18 + %r0] 0x20
	.word 0xea8ca000  ! 755: LDUBA_I	lduba	[%r18, + 0x0000] %asi, %r21
	.word 0x87802020  ! 756: WRASI_I	wr	%r0, 0x0020, %asi
	mov	0x68, %r26
	.word 0xe88f4e60  ! 758: LDUBA_R	lduba	[%r29, %r0] 0x73, %r20
	.word 0x87802020  ! 759: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xeca74e80  ! 760: STWA_R	stwa	%r22, [%r29 + %r0] 0x74
	.word 0xe09e2000  ! 761: LDDA_I	ldda	[%r24, + 0x0000] %asi, %r16
	mov	0x3c8, %r21
	.word 0xeeaec9e0  ! 763: STBA_R	stba	%r23, [%r27 + %r0] 0x4f
	.word 0xeef4c400  ! 764: STXA_R	stxa	%r23, [%r19 + %r0] 0x20
	.word 0xe487ce80  ! 765: LDUWA_R	lduwa	[%r31, %r0] 0x74, %r18
	.word 0xe68e89e0  ! 766: LDUBA_R	lduba	[%r26, %r0] 0x4f, %r19
	mov	0x7c0, %r22
	.word 0xe88cc400  ! 768: LDUBA_R	lduba	[%r19, %r0] 0x20, %r20
	.word 0xea97ce40  ! 769: LDUHA_R	lduha	[%r31, %r0] 0x72, %r21
	.word 0xe49d44a0  ! 770: LDDA_R	ldda	[%r21, %r0] 0x25, %r18
	.word 0xe6ac4400  ! 771: STBA_R	stba	%r19, [%r17 + %r0] 0x20
	.word 0xeedf0e40  ! 772: LDXA_R	ldxa	[%r28, %r0] 0x72, %r23
	.word 0xecbcc400  ! 773: STDA_R	stda	%r22, [%r19 + %r0] 0x20
	.word 0xe48c8400  ! 774: LDUBA_R	lduba	[%r18, %r0] 0x20, %r18
	mov	0x50, %r24
	mov	0x3e0, %r23
	.word 0xea9e09e0  ! 777: LDDA_R	ldda	[%r24, %r0] 0x4f, %r21
	mov	0x48, %r25
	mov	0x60, %r24
	.word 0x87802025  ! 780: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0xeea66000  ! 781: STWA_I	stwa	%r23, [%r25 + 0x0000] %asi
	.word 0x87802074  ! 782: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0xe0c609e0  ! 783: LDSWA_R	ldswa	[%r24, %r0] 0x4f, %r16
	.word 0xe8ace000  ! 784: STBA_I	stba	%r20, [%r19 + 0x0000] %asi
	.word 0xe8d4e000  ! 785: LDSHA_I	ldsha	[%r19, + 0x0000] %asi, %r20
	.word 0xe6a584a0  ! 786: STWA_R	stwa	%r19, [%r22 + %r0] 0x25
	.word 0xe0ae09e0  ! 787: STBA_R	stba	%r16, [%r24 + %r0] 0x4f
	mov	0x0, %r26
	.word 0xe2af4e40  ! 789: STBA_R	stba	%r17, [%r29 + %r0] 0x72
	.word 0xe48cc400  ! 790: LDUBA_R	lduba	[%r19, %r0] 0x20, %r18
	.word 0xe0bc0400  ! 791: STDA_R	stda	%r16, [%r16 + %r0] 0x20
	.word 0xeed42000  ! 792: LDSHA_I	ldsha	[%r16, + 0x0000] %asi, %r23
	.word 0xee84a000  ! 793: LDUWA_I	lduwa	[%r18, + 0x0000] %asi, %r23
	.word 0x87802073  ! 794: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0xe6f44400  ! 795: STXA_R	stxa	%r19, [%r17 + %r0] 0x20
	.word 0xe6d78e80  ! 796: LDSHA_R	ldsha	[%r30, %r0] 0x74, %r19
	.word 0xe0f7ce60  ! 797: STXA_R	stxa	%r16, [%r31 + %r0] 0x73
	.word 0xea8f8e60  ! 798: LDUBA_R	lduba	[%r30, %r0] 0x73, %r21
	mov	0x50, %r27
	.word 0xeea7ce80  ! 800: STWA_R	stwa	%r23, [%r31 + %r0] 0x74
	.word 0xe0df6000  ! 801: LDXA_I	ldxa	[%r29, + 0x0000] %asi, %r16
	.word 0xe0d7e000  ! 802: LDSHA_I	ldsha	[%r31, + 0x0000] %asi, %r16
	.word 0xe0876000  ! 803: LDUWA_I	lduwa	[%r29, + 0x0000] %asi, %r16
	mov	0x3e8, %r23
	.word 0xe0bf6000  ! 805: STDA_I	stda	%r16, [%r29 + 0x0000] %asi
	.word 0xe6af0e40  ! 806: STBA_R	stba	%r19, [%r28 + %r0] 0x72
	.word 0xe48f2000  ! 807: LDUBA_I	lduba	[%r28, + 0x0000] %asi, %r18
	mov	0x3d8, %r20
	mov	0x18, %r19
	.word 0xecc4c400  ! 810: LDSWA_R	ldswa	[%r19, %r0] 0x20, %r22
	.word 0xeaafa000  ! 811: STBA_I	stba	%r21, [%r30 + 0x0000] %asi
	mov	0x70, %r17
	.word 0x87802025  ! 813: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0x87802072  ! 814: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0xe0b44400  ! 815: STHA_R	stha	%r16, [%r17 + %r0] 0x20
	.word 0x87802020  ! 816: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe087a000  ! 817: LDUWA_I	lduwa	[%r30, + 0x0000] %asi, %r16
	.word 0xe8dfce60  ! 818: LDXA_R	ldxa	[%r31, %r0] 0x73, %r20
	.word 0xeab48400  ! 819: STHA_R	stha	%r21, [%r18 + %r0] 0x20
	.word 0x87802074  ! 820: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0xe4ae2000  ! 821: STBA_I	stba	%r18, [%r24 + 0x0000] %asi
	.word 0xe8f544a0  ! 822: STXA_R	stxa	%r20, [%r21 + %r0] 0x25
	.word 0xea9ec9e0  ! 823: LDDA_R	ldda	[%r27, %r0] 0x4f, %r21
	.word 0xe8d609e0  ! 824: LDSHA_R	ldsha	[%r24, %r0] 0x4f, %r20
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xe2dea000  ! 826: LDXA_I	ldxa	[%r26, + 0x0000] %asi, %r17
	.word 0x87802073  ! 827: WRASI_I	wr	%r0, 0x0073, %asi
	mov	0x3f8, %r23
	.word 0xe09f8e60  ! 829: LDDA_R	ldda	[%r30, %r0] 0x73, %r16
	.word 0xe4c689e0  ! 830: LDSWA_R	ldswa	[%r26, %r0] 0x4f, %r18
	.word 0xeeb4e000  ! 831: STHA_I	stha	%r23, [%r19 + 0x0000] %asi
	.word 0x87802020  ! 832: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xeebd2000  ! 833: STDA_I	stda	%r23, [%r20 + 0x0000] %asi
	.word 0xeed56000  ! 834: LDSHA_I	ldsha	[%r21, + 0x0000] %asi, %r23
	.word 0xeef52000  ! 835: STXA_I	stxa	%r23, [%r20 + 0x0000] %asi
	.word 0x87802073  ! 836: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0xeedee000  ! 837: LDXA_I	ldxa	[%r27, + 0x0000] %asi, %r23
	.word 0x87802074  ! 838: WRASI_I	wr	%r0, 0x0074, %asi
	mov	0x7e8, %r21
	mov	0x10, %r19
	.word 0xe0cc4400  ! 841: LDSBA_R	ldsba	[%r17, %r0] 0x20, %r16
	.word 0xeab7e000  ! 842: STHA_I	stha	%r21, [%r31 + 0x0000] %asi
	.word 0xe2d74e80  ! 843: LDSHA_R	ldsha	[%r29, %r0] 0x74, %r17
	.word 0x87802020  ! 844: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xea8c4400  ! 845: LDUBA_R	lduba	[%r17, %r0] 0x20, %r21
	.word 0xe0a72000  ! 846: STWA_I	stwa	%r16, [%r28 + 0x0000] %asi
	.word 0xe0bfa000  ! 847: STDA_I	stda	%r16, [%r30 + 0x0000] %asi
	.word 0x87802072  ! 848: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0xe0be6000  ! 849: STDA_I	stda	%r16, [%r25 + 0x0000] %asi
	.word 0xe09c4400  ! 850: LDDA_R	ldda	[%r17, %r0] 0x20, %r16
	.word 0x87802073  ! 851: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0xe0bfa000  ! 852: STDA_I	stda	%r16, [%r30 + 0x0000] %asi
	mov	0x7e0, %r22
	.word 0xe0d7a000  ! 854: LDSHA_I	ldsha	[%r30, + 0x0000] %asi, %r16
	mov	0x68, %r25
	mov	0x78, %r25
	.word 0xe0cf6000  ! 857: LDSBA_I	ldsba	[%r29, + 0x0000] %asi, %r16
	.word 0xeab78e60  ! 858: STHA_R	stha	%r21, [%r30 + %r0] 0x73
	.word 0x87802074  ! 859: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0xe0b78e40  ! 860: STHA_R	stha	%r16, [%r30 + %r0] 0x72
	.word 0x87802073  ! 861: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0xe28d44a0  ! 862: LDUBA_R	lduba	[%r21, %r0] 0x25, %r17
	.word 0xe4cc0400  ! 863: LDSBA_R	ldsba	[%r16, %r0] 0x20, %r18
	mov	0x3d8, %r23
	mov	0x78, %r27
	mov	0x18, %r26
	.word 0x87802025  ! 867: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0xeac7ce40  ! 868: LDSWA_R	ldswa	[%r31, %r0] 0x72, %r21
	.word 0x87802073  ! 869: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0xe6b6e000  ! 870: STHA_I	stha	%r19, [%r27 + 0x0000] %asi
	mov	0x8, %r19
	.word 0x87802020  ! 872: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe2c4c400  ! 873: LDSWA_R	ldswa	[%r19, %r0] 0x20, %r17
	.word 0xead689e0  ! 874: LDSHA_R	ldsha	[%r26, %r0] 0x4f, %r21
	mov	0x68, %r17
	.word 0x87802072  ! 876: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0xe48e49e0  ! 877: LDUBA_R	lduba	[%r25, %r0] 0x4f, %r18
	.word 0xe2944400  ! 878: LDUHA_R	lduha	[%r17, %r0] 0x20, %r17
	.word 0xeaa52000  ! 879: STWA_I	stwa	%r21, [%r20 + 0x0000] %asi
	.word 0xeaf5e000  ! 880: STXA_I	stxa	%r21, [%r23 + 0x0000] %asi
	.word 0x87802072  ! 881: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0x87802020  ! 882: WRASI_I	wr	%r0, 0x0020, %asi
	mov	0x60, %r26
	.word 0x87802072  ! 884: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0xe8a74e40  ! 885: STWA_R	stwa	%r20, [%r29 + %r0] 0x72
	.word 0xeadec9e0  ! 886: LDXA_R	ldxa	[%r27, %r0] 0x4f, %r21
	.word 0xecd4a000  ! 887: LDSHA_I	ldsha	[%r18, + 0x0000] %asi, %r22
	.word 0x87802074  ! 888: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0x87802072  ! 889: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0xec84a000  ! 890: LDUWA_I	lduwa	[%r18, + 0x0000] %asi, %r22
	.word 0xeab7ce40  ! 891: STHA_R	stha	%r21, [%r31 + %r0] 0x72
	.word 0x87802073  ! 892: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0xeadda000  ! 893: LDXA_I	ldxa	[%r22, + 0x0000] %asi, %r21
	mov	0x78, %r19
	mov	0x7f0, %r21
	mov	0x7e0, %r23
	mov	0x38, %r16
	.word 0xeeacc400  ! 898: STBA_R	stba	%r23, [%r19 + %r0] 0x20
	.word 0xe8a5e000  ! 899: STWA_I	stwa	%r20, [%r23 + 0x0000] %asi
	.word 0xec978e80  ! 900: LDUHA_R	lduha	[%r30, %r0] 0x74, %r22
	.word 0xeeac0400  ! 901: STBA_R	stba	%r23, [%r16 + %r0] 0x20
	.word 0xeed40400  ! 902: LDSHA_R	ldsha	[%r16, %r0] 0x20, %r23
	.word 0xe2bec9e0  ! 903: STDA_R	stda	%r17, [%r27 + %r0] 0x4f
	.word 0xeaf40400  ! 904: STXA_R	stxa	%r21, [%r16 + %r0] 0x20
	.word 0xe2d52000  ! 905: LDSHA_I	ldsha	[%r20, + 0x0000] %asi, %r17
	.word 0x87802020  ! 906: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe2b4a000  ! 907: STHA_I	stha	%r17, [%r18 + 0x0000] %asi
	.word 0x87802074  ! 908: WRASI_I	wr	%r0, 0x0074, %asi
	mov	0x70, %r18
	mov	0x28, %r18
	.word 0x87802025  ! 911: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0xe0c7ce80  ! 912: LDSWA_R	ldswa	[%r31, %r0] 0x74, %r16
	mov	0x68, %r27
	mov	0x48, %r17
	mov	0x38, %r17
	.word 0xe4a42000  ! 916: STWA_I	stwa	%r18, [%r16 + 0x0000] %asi
	.word 0xe4b48400  ! 917: STHA_R	stha	%r18, [%r18 + %r0] 0x20
	.word 0x87802020  ! 918: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe6cc4400  ! 919: LDSBA_R	ldsba	[%r17, %r0] 0x20, %r19
	.word 0xe8b6e000  ! 920: STHA_I	stha	%r20, [%r27 + 0x0000] %asi
	.word 0xe0a74e80  ! 921: STWA_R	stwa	%r16, [%r29 + %r0] 0x74
	mov	0x0, %r19
	mov	0x8, %r24
	.word 0xe4cd44a0  ! 924: LDSBA_R	ldsba	[%r21, %r0] 0x25, %r18
	.word 0xe8f62000  ! 925: STXA_I	stxa	%r20, [%r24 + 0x0000] %asi
	.word 0x87802020  ! 926: WRASI_I	wr	%r0, 0x0020, %asi
	mov	0x40, %r17
	.word 0xe0bf4e40  ! 928: STDA_R	stda	%r16, [%r29 + %r0] 0x72
	.word 0xe286c9e0  ! 929: LDUWA_R	lduwa	[%r27, %r0] 0x4f, %r17
	.word 0x87802074  ! 930: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0xeabc8400  ! 931: STDA_R	stda	%r21, [%r18 + %r0] 0x20
	.word 0xeab44400  ! 932: STHA_R	stha	%r21, [%r17 + %r0] 0x20
	mov	0x3e0, %r23
	.word 0xead46000  ! 934: LDSHA_I	ldsha	[%r17, + 0x0000] %asi, %r21
	.word 0xe8de89e0  ! 935: LDXA_R	ldxa	[%r26, %r0] 0x4f, %r20
	.word 0xe49ce000  ! 936: LDDA_I	ldda	[%r19, + 0x0000] %asi, %r18
	.word 0x87802020  ! 937: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe4ac2000  ! 938: STBA_I	stba	%r18, [%r16 + 0x0000] %asi
	.word 0x87802072  ! 939: WRASI_I	wr	%r0, 0x0072, %asi
	mov	0x68, %r24
	.word 0xe4b46000  ! 941: STHA_I	stha	%r18, [%r17 + 0x0000] %asi
	.word 0xec85c4a0  ! 942: LDUWA_R	lduwa	[%r23, %r0] 0x25, %r22
	mov	0x3f0, %r21
	.word 0xe0842000  ! 944: LDUWA_I	lduwa	[%r16, + 0x0000] %asi, %r16
	.word 0xe2ac8400  ! 945: STBA_R	stba	%r17, [%r18 + %r0] 0x20
	.word 0xe2f689e0  ! 946: STXA_R	stxa	%r17, [%r26 + %r0] 0x4f
	.word 0x87802025  ! 947: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0x8780204f  ! 948: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xeece49e0  ! 949: LDSBA_R	ldsba	[%r25, %r0] 0x4f, %r23
	.word 0xe0b5e000  ! 950: STHA_I	stha	%r16, [%r23 + 0x0000] %asi
	.word 0xe0bde000  ! 951: STDA_I	stda	%r16, [%r23 + 0x0000] %asi
	.word 0xe8df8e40  ! 952: LDXA_R	ldxa	[%r30, %r0] 0x72, %r20
	.word 0xe89d2000  ! 953: LDDA_I	ldda	[%r20, + 0x0000] %asi, %r20
	.word 0xe8f56000  ! 954: STXA_I	stxa	%r20, [%r21 + 0x0000] %asi
	.word 0x87802020  ! 955: WRASI_I	wr	%r0, 0x0020, %asi
	mov	0x3f0, %r23
	.word 0xe8f56000  ! 957: STXA_I	stxa	%r20, [%r21 + 0x0000] %asi
	mov	0x7d8, %r20
	.word 0xecaf4e40  ! 959: STBA_R	stba	%r22, [%r29 + %r0] 0x72
	mov	0x7e8, %r23
	mov	0x58, %r19
	.word 0xe6bda000  ! 962: STDA_I	stda	%r19, [%r22 + 0x0000] %asi
	mov	0x70, %r17
	.word 0xe6956000  ! 964: LDUHA_I	lduha	[%r21, + 0x0000] %asi, %r19
	mov	0x60, %r18
	mov	0x3e8, %r20
	.word 0x87802020  ! 967: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe6bfa000  ! 968: STDA_I	stda	%r19, [%r30 + 0x0000] %asi
	.word 0xe6876000  ! 969: LDUWA_I	lduwa	[%r29, + 0x0000] %asi, %r19
	.word 0xe887ce40  ! 970: LDUWA_R	lduwa	[%r31, %r0] 0x72, %r20
	.word 0xe4df2000  ! 971: LDXA_I	ldxa	[%r28, + 0x0000] %asi, %r18
	.word 0x87802072  ! 972: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0xe4bca000  ! 973: STDA_I	stda	%r18, [%r18 + 0x0000] %asi
	.word 0xee874e80  ! 974: LDUWA_R	lduwa	[%r29, %r0] 0x74, %r23
	.word 0xe0f40400  ! 975: STXA_R	stxa	%r16, [%r16 + %r0] 0x20
	.word 0xeab78e40  ! 976: STHA_R	stha	%r21, [%r30 + %r0] 0x72
	mov	0x28, %r25
	mov	0x7e0, %r21
	.word 0x87802072  ! 979: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0xe4dde000  ! 980: LDXA_I	ldxa	[%r23, + 0x0000] %asi, %r18
	.word 0xe8f44400  ! 981: STXA_R	stxa	%r20, [%r17 + %r0] 0x20
	mov	0x30, %r24
	.word 0xeebfce80  ! 983: STDA_R	stda	%r23, [%r31 + %r0] 0x74
	.word 0x87802072  ! 984: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0xe89fa000  ! 985: LDDA_I	ldda	[%r30, + 0x0000] %asi, %r20
	mov	0x50, %r26
	.word 0xea944400  ! 987: LDUHA_R	lduha	[%r17, %r0] 0x20, %r21
	mov	0x28, %r17
	.word 0xe4af2000  ! 989: STBA_I	stba	%r18, [%r28 + 0x0000] %asi
	mov	0x7d8, %r22
	mov	0x20, %r17
	mov	0x40, %r17
	.word 0x87802072  ! 993: WRASI_I	wr	%r0, 0x0072, %asi
	mov	0x18, %r18
	.word 0x87802073  ! 995: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0xe497e000  ! 996: LDUHA_I	lduha	[%r31, + 0x0000] %asi, %r18
	.word 0xe497e000  ! 997: LDUHA_I	lduha	[%r31, + 0x0000] %asi, %r18
	.word 0xe0dc8400  ! 998: LDXA_R	ldxa	[%r18, %r0] 0x20, %r16
	mov	0x58, %r24
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_1:
	.word 0xe8cfa000  ! 1: LDSBA_I	ldsba	[%r30, + 0x0000] %asi, %r20
	.word 0xe897a000  ! 2: LDUHA_I	lduha	[%r30, + 0x0000] %asi, %r20
	.word 0x8780204f  ! 3: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0x87802072  ! 4: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0x87802074  ! 5: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0xe8dfa000  ! 6: LDXA_I	ldxa	[%r30, + 0x0000] %asi, %r20
	.word 0xecdf4e40  ! 7: LDXA_R	ldxa	[%r29, %r0] 0x72, %r22
	.word 0x8780204f  ! 8: WRASI_I	wr	%r0, 0x004f, %asi
	mov	0x7d0, %r20
	mov	0x70, %r18
	.word 0xeea7ce60  ! 11: STWA_R	stwa	%r23, [%r31 + %r0] 0x73
	.word 0xeef7ce60  ! 12: STXA_R	stxa	%r23, [%r31 + %r0] 0x73
	.word 0xea9f2000  ! 13: LDDA_I	ldda	[%r28, + 0x0000] %asi, %r21
	.word 0x87802072  ! 14: WRASI_I	wr	%r0, 0x0072, %asi
	mov	0x18, %r19
	mov	0x18, %r24
	.word 0x87802020  ! 17: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xea8ca000  ! 18: LDUBA_I	lduba	[%r18, + 0x0000] %asi, %r21
	mov	0x3e8, %r21
	mov	0x3d0, %r23
	mov	0x20, %r27
	mov	0x3c8, %r22
	.word 0xe8b78e60  ! 23: STHA_R	stha	%r20, [%r30 + %r0] 0x73
	.word 0xea842000  ! 24: LDUWA_I	lduwa	[%r16, + 0x0000] %asi, %r21
	.word 0xeaf46000  ! 25: STXA_I	stxa	%r21, [%r17 + 0x0000] %asi
	.word 0x8780204f  ! 26: WRASI_I	wr	%r0, 0x004f, %asi
	mov	0x78, %r16
	.word 0xe8f74e80  ! 28: STXA_R	stxa	%r20, [%r29 + %r0] 0x74
	.word 0xec9fe000  ! 29: LDDA_I	ldda	[%r31, + 0x0000] %asi, %r22
	.word 0xec9f2000  ! 30: LDDA_I	ldda	[%r28, + 0x0000] %asi, %r22
	.word 0xecb72000  ! 31: STHA_I	stha	%r22, [%r28 + 0x0000] %asi
	.word 0xeed78e80  ! 32: LDSHA_R	ldsha	[%r30, %r0] 0x74, %r23
	.word 0x87802020  ! 33: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe4a74e40  ! 34: STWA_R	stwa	%r18, [%r29 + %r0] 0x72
	.word 0xea976000  ! 35: LDUHA_I	lduha	[%r29, + 0x0000] %asi, %r21
	.word 0xea876000  ! 36: LDUWA_I	lduwa	[%r29, + 0x0000] %asi, %r21
	.word 0x87802073  ! 37: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0xeadca000  ! 38: LDXA_I	ldxa	[%r18, + 0x0000] %asi, %r21
	mov	0x7d0, %r23
	.word 0xeacfce80  ! 40: LDSBA_R	ldsba	[%r31, %r0] 0x74, %r21
	.word 0xe6b689e0  ! 41: STHA_R	stha	%r19, [%r26 + %r0] 0x4f
	mov	0x20, %r25
	.word 0xea978e40  ! 43: LDUHA_R	lduha	[%r30, %r0] 0x72, %r21
	.word 0xe29ce000  ! 44: LDDA_I	ldda	[%r19, + 0x0000] %asi, %r17
	.word 0xe8bf0e60  ! 45: STDA_R	stda	%r20, [%r28 + %r0] 0x73
	.word 0xec9f4e60  ! 46: LDDA_R	ldda	[%r29, %r0] 0x73, %r22
	.word 0xe68f0e60  ! 47: LDUBA_R	lduba	[%r28, %r0] 0x73, %r19
	mov	0x8, %r17
	.word 0xeac4e000  ! 49: LDSWA_I	ldswa	[%r19, + 0x0000] %asi, %r21
	.word 0xeabc6000  ! 50: STDA_I	stda	%r21, [%r17 + 0x0000] %asi
	.word 0xeebe09e0  ! 51: STDA_R	stda	%r23, [%r24 + %r0] 0x4f
	.word 0xec84c400  ! 52: LDUWA_R	lduwa	[%r19, %r0] 0x20, %r22
	mov	0x68, %r18
	.word 0xe8b42000  ! 54: STHA_I	stha	%r20, [%r16 + 0x0000] %asi
	mov	0x0, %r27
	.word 0xe8d42000  ! 56: LDSHA_I	ldsha	[%r16, + 0x0000] %asi, %r20
	.word 0xeadfce80  ! 57: LDXA_R	ldxa	[%r31, %r0] 0x74, %r21
	.word 0xeedca000  ! 58: LDXA_I	ldxa	[%r18, + 0x0000] %asi, %r23
	.word 0xee94e000  ! 59: LDUHA_I	lduha	[%r19, + 0x0000] %asi, %r23
	.word 0xe2cf4e60  ! 60: LDSBA_R	ldsba	[%r29, %r0] 0x73, %r17
	.word 0xeec5c4a0  ! 61: LDSWA_R	ldswa	[%r23, %r0] 0x25, %r23
	.word 0x8780204f  ! 62: WRASI_I	wr	%r0, 0x004f, %asi
	mov	0x0, %r26
	.word 0x87802020  ! 64: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe89ea000  ! 65: LDDA_I	ldda	[%r26, + 0x0000] %asi, %r20
	mov	0x0, %r19
	.word 0xe4be89e0  ! 67: STDA_R	stda	%r18, [%r26 + %r0] 0x4f
	.word 0x87802020  ! 68: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe8962000  ! 69: LDUHA_I	lduha	[%r24, + 0x0000] %asi, %r20
	mov	0x3d0, %r22
	.word 0x87802074  ! 71: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0xe8cf6000  ! 72: LDSBA_I	ldsba	[%r29, + 0x0000] %asi, %r20
	.word 0x87802020  ! 73: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe4dc0400  ! 74: LDXA_R	ldxa	[%r16, %r0] 0x20, %r18
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xe6d6c9e0  ! 76: LDSHA_R	ldsha	[%r27, %r0] 0x4f, %r19
	.word 0xe2bf2000  ! 77: STDA_I	stda	%r17, [%r28 + 0x0000] %asi
	.word 0xe4c5c4a0  ! 78: LDSWA_R	ldswa	[%r23, %r0] 0x25, %r18
	.word 0xeccfa000  ! 79: LDSBA_I	ldsba	[%r30, + 0x0000] %asi, %r22
	.word 0xe28e89e0  ! 80: LDUBA_R	lduba	[%r26, %r0] 0x4f, %r17
	.word 0xeeaec9e0  ! 81: STBA_R	stba	%r23, [%r27 + %r0] 0x4f
	.word 0xe8b584a0  ! 82: STHA_R	stha	%r20, [%r22 + %r0] 0x25
	.word 0x87802020  ! 83: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe4bee000  ! 84: STDA_I	stda	%r18, [%r27 + 0x0000] %asi
	.word 0x87802025  ! 85: WRASI_I	wr	%r0, 0x0025, %asi
	mov	0x68, %r25
	.word 0xea8689e0  ! 87: LDUWA_R	lduwa	[%r26, %r0] 0x4f, %r21
	ta	T_CHANGE_HPRIV	! macro
	.word 0xe6dc2000  ! 89: LDXA_I	ldxa	[%r16, + 0x0000] %asi, %r19
	mov	0x0, %r19
	mov	0x50, %r18
	.word 0xe0df4e40  ! 92: LDXA_R	ldxa	[%r29, %r0] 0x72, %r16
	.word 0x87802072  ! 93: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0x87802073  ! 94: WRASI_I	wr	%r0, 0x0073, %asi
	mov	0x8, %r26
	mov	0x7e8, %r22
	.word 0xe084e000  ! 97: LDUWA_I	lduwa	[%r19, + 0x0000] %asi, %r16
	.word 0xe08c6000  ! 98: LDUBA_I	lduba	[%r17, + 0x0000] %asi, %r16
	.word 0xe0d42000  ! 99: LDSHA_I	ldsha	[%r16, + 0x0000] %asi, %r16
	.word 0xe0bc2000  ! 100: STDA_I	stda	%r16, [%r16 + 0x0000] %asi
	.word 0xe0a42000  ! 101: STWA_I	stwa	%r16, [%r16 + 0x0000] %asi
	.word 0x87802073  ! 102: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0x87802072  ! 103: WRASI_I	wr	%r0, 0x0072, %asi
	mov	0x48, %r19
	.word 0xe48f8e40  ! 105: LDUBA_R	lduba	[%r30, %r0] 0x72, %r18
	.word 0xe0ccc400  ! 106: LDSBA_R	ldsba	[%r19, %r0] 0x20, %r16
	mov	0x68, %r27
	.word 0xe6be09e0  ! 108: STDA_R	stda	%r19, [%r24 + %r0] 0x4f
	ta	T_CHANGE_PRIV	! macro
	.word 0xeaddc4a0  ! 110: LDXA_R	ldxa	[%r23, %r0] 0x25, %r21
	.word 0x87802074  ! 111: WRASI_I	wr	%r0, 0x0074, %asi
	mov	0x18, %r19
	.word 0xe6cc0400  ! 113: LDSBA_R	ldsba	[%r16, %r0] 0x20, %r19
	.word 0xe6c74e40  ! 114: LDSWA_R	ldswa	[%r29, %r0] 0x72, %r19
	.word 0xea8c6000  ! 115: LDUBA_I	lduba	[%r17, + 0x0000] %asi, %r21
	.word 0xe087ce40  ! 116: LDUWA_R	lduwa	[%r31, %r0] 0x72, %r16
	.word 0xe88c2000  ! 117: LDUBA_I	lduba	[%r16, + 0x0000] %asi, %r20
	.word 0xe8f4a000  ! 118: STXA_I	stxa	%r20, [%r18 + 0x0000] %asi
	.word 0x87802025  ! 119: WRASI_I	wr	%r0, 0x0025, %asi
	mov	0x38, %r24
	.word 0xe0bec9e0  ! 121: STDA_R	stda	%r16, [%r27 + %r0] 0x4f
	mov	0x0, %r24
	.word 0xeaad6000  ! 123: STBA_I	stba	%r21, [%r21 + 0x0000] %asi
	.word 0x8780204f  ! 124: WRASI_I	wr	%r0, 0x004f, %asi
	mov	0x0, %r18
	.word 0xea9e6000  ! 126: LDDA_I	ldda	[%r25, + 0x0000] %asi, %r21
	.word 0x87802073  ! 127: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0x87802072  ! 128: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0x8780204f  ! 129: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0x87802073  ! 130: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0x87802074  ! 131: WRASI_I	wr	%r0, 0x0074, %asi
	mov	0x20, %r24
	.word 0xea9f2000  ! 133: LDDA_I	ldda	[%r28, + 0x0000] %asi, %r21
	.word 0xea9f2000  ! 134: LDDA_I	ldda	[%r28, + 0x0000] %asi, %r21
	.word 0x87802073  ! 135: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0xe6f609e0  ! 136: STXA_R	stxa	%r19, [%r24 + %r0] 0x4f
	.word 0xeca544a0  ! 137: STWA_R	stwa	%r22, [%r21 + %r0] 0x25
	.word 0xe2cfce40  ! 138: LDSBA_R	ldsba	[%r31, %r0] 0x72, %r17
	.word 0xe6bf8e80  ! 139: STDA_R	stda	%r19, [%r30 + %r0] 0x74
	.word 0xec9c6000  ! 140: LDDA_I	ldda	[%r17, + 0x0000] %asi, %r22
	.word 0x8780204f  ! 141: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xec9d6000  ! 142: LDDA_I	ldda	[%r21, + 0x0000] %asi, %r22
	mov	0x3c8, %r23
	.word 0x87802073  ! 144: WRASI_I	wr	%r0, 0x0073, %asi
	mov	0x10, %r16
	mov	0x28, %r25
	.word 0x87802072  ! 147: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0xecb72000  ! 148: STHA_I	stha	%r22, [%r28 + 0x0000] %asi
	.word 0xecb7a000  ! 149: STHA_I	stha	%r22, [%r30 + 0x0000] %asi
	.word 0xecc76000  ! 150: LDSWA_I	ldswa	[%r29, + 0x0000] %asi, %r22
	mov	0x10, %r18
	.word 0xe0a70e80  ! 152: STWA_R	stwa	%r16, [%r28 + %r0] 0x74
	.word 0xe4872000  ! 153: LDUWA_I	lduwa	[%r28, + 0x0000] %asi, %r18
	mov	0x48, %r26
	.word 0xe2cc4400  ! 155: LDSBA_R	ldsba	[%r17, %r0] 0x20, %r17
	.word 0xea872000  ! 156: LDUWA_I	lduwa	[%r28, + 0x0000] %asi, %r21
	.word 0xeac7a000  ! 157: LDSWA_I	ldswa	[%r30, + 0x0000] %asi, %r21
	mov	0x3e8, %r22
	.word 0xe8a504a0  ! 159: STWA_R	stwa	%r20, [%r20 + %r0] 0x25
	.word 0x8780204f  ! 160: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xeeace000  ! 161: STBA_I	stba	%r23, [%r19 + 0x0000] %asi
	.word 0x8780204f  ! 162: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xeaf48400  ! 163: STXA_R	stxa	%r21, [%r18 + %r0] 0x20
	.word 0x87802025  ! 164: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0xeaaf0e40  ! 165: STBA_R	stba	%r21, [%r28 + %r0] 0x72
	.word 0xe4bf6000  ! 166: STDA_I	stda	%r18, [%r29 + 0x0000] %asi
	.word 0xe48f2000  ! 167: LDUBA_I	lduba	[%r28, + 0x0000] %asi, %r18
	mov	0x3d8, %r23
	.word 0xe0974e80  ! 169: LDUHA_R	lduha	[%r29, %r0] 0x74, %r16
	mov	0x30, %r27
	.word 0xe8c7e000  ! 171: LDSWA_I	ldswa	[%r31, + 0x0000] %asi, %r20
	ta	T_CHANGE_NONPRIV	! macro
	mov	0x7c8, %r23
	mov	0x3d8, %r23
	.word 0xe897e000  ! 175: LDUHA_I	lduha	[%r31, + 0x0000] %asi, %r20
	.word 0x87802020  ! 176: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0x87802025  ! 177: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0xe8dc2000  ! 178: LDXA_I	ldxa	[%r16, + 0x0000] %asi, %r20
	.word 0xeab689e0  ! 179: STHA_R	stha	%r21, [%r26 + %r0] 0x4f
	.word 0xeebc8400  ! 180: STDA_R	stda	%r23, [%r18 + %r0] 0x20
	mov	0x7e8, %r20
	mov	0x60, %r16
	.word 0x87802073  ! 183: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0xeabfa000  ! 184: STDA_I	stda	%r21, [%r30 + 0x0000] %asi
	.word 0x8780204f  ! 185: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0x87802020  ! 186: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xea8c6000  ! 187: LDUBA_I	lduba	[%r17, + 0x0000] %asi, %r21
	.word 0x87802025  ! 188: WRASI_I	wr	%r0, 0x0025, %asi
	mov	0x70, %r19
	.word 0xe29e89e0  ! 190: LDDA_R	ldda	[%r26, %r0] 0x4f, %r17
	.word 0xe0b44400  ! 191: STHA_R	stha	%r16, [%r17 + %r0] 0x20
	.word 0xe4b62000  ! 192: STHA_I	stha	%r18, [%r24 + 0x0000] %asi
	.word 0xe4b74e60  ! 193: STHA_R	stha	%r18, [%r29 + %r0] 0x73
	mov	0x8, %r19
	mov	0x7d8, %r21
	mov	0x7e0, %r20
	mov	0x78, %r27
	.word 0xe0b66000  ! 198: STHA_I	stha	%r16, [%r25 + 0x0000] %asi
	.word 0xe09ee000  ! 199: LDDA_I	ldda	[%r27, + 0x0000] %asi, %r16
	.word 0xe0f66000  ! 200: STXA_I	stxa	%r16, [%r25 + 0x0000] %asi
	.word 0xe0dea000  ! 201: LDXA_I	ldxa	[%r26, + 0x0000] %asi, %r16
	mov	0x7e8, %r21
	.word 0x87802020  ! 203: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe0bfa000  ! 204: STDA_I	stda	%r16, [%r30 + 0x0000] %asi
	.word 0xe0afa000  ! 205: STBA_I	stba	%r16, [%r30 + 0x0000] %asi
	mov	0x7c8, %r20
	.word 0xe6dcc400  ! 207: LDXA_R	ldxa	[%r19, %r0] 0x20, %r19
	.word 0xea8d84a0  ! 208: LDUBA_R	lduba	[%r22, %r0] 0x25, %r21
	.word 0xee9f2000  ! 209: LDDA_I	ldda	[%r28, + 0x0000] %asi, %r23
	.word 0xe8bf4e80  ! 210: STDA_R	stda	%r20, [%r29 + %r0] 0x74
	.word 0xe88fa000  ! 211: LDUBA_I	lduba	[%r30, + 0x0000] %asi, %r20
	.word 0xe8afa000  ! 212: STBA_I	stba	%r20, [%r30 + 0x0000] %asi
	.word 0xe8d7a000  ! 213: LDSHA_I	ldsha	[%r30, + 0x0000] %asi, %r20
	.word 0xeead84a0  ! 214: STBA_R	stba	%r23, [%r22 + %r0] 0x25
	.word 0xe8b7ce60  ! 215: STHA_R	stha	%r20, [%r31 + %r0] 0x73
	.word 0x87802025  ! 216: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0xecae89e0  ! 217: STBA_R	stba	%r22, [%r26 + %r0] 0x4f
	mov	0x48, %r26
	.word 0xe2ac2000  ! 219: STBA_I	stba	%r17, [%r16 + 0x0000] %asi
	.word 0x8780204f  ! 220: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xe2b6a000  ! 221: STHA_I	stha	%r17, [%r26 + 0x0000] %asi
	mov	0x40, %r24
	mov	0x18, %r25
	mov	0x7f0, %r23
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xe2a66000  ! 226: STWA_I	stwa	%r17, [%r25 + 0x0000] %asi
	mov	0x3c8, %r23
	.word 0x8780204f  ! 228: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xe48fce60  ! 229: LDUBA_R	lduba	[%r31, %r0] 0x73, %r18
	.word 0x87802025  ! 230: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0xe2afe000  ! 231: STBA_I	stba	%r17, [%r31 + 0x0000] %asi
	.word 0xe4a70e60  ! 232: STWA_R	stwa	%r18, [%r28 + %r0] 0x73
	.word 0x8780204f  ! 233: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xe8afa000  ! 234: STBA_I	stba	%r20, [%r30 + 0x0000] %asi
	mov	0x10, %r27
	.word 0xe48504a0  ! 236: LDUWA_R	lduwa	[%r20, %r0] 0x25, %r18
	.word 0xecf7ce80  ! 237: STXA_R	stxa	%r22, [%r31 + %r0] 0x74
	.word 0xecb689e0  ! 238: STHA_R	stha	%r22, [%r26 + %r0] 0x4f
	.word 0x87802072  ! 239: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0xe2d76000  ! 240: LDSHA_I	ldsha	[%r29, + 0x0000] %asi, %r17
	.word 0xead40400  ! 241: LDSHA_R	ldsha	[%r16, %r0] 0x20, %r21
	.word 0xea9c0400  ! 242: LDDA_R	ldda	[%r16, %r0] 0x20, %r21
	.word 0xeca76000  ! 243: STWA_I	stwa	%r22, [%r29 + 0x0000] %asi
	.word 0xe2c6c9e0  ! 244: LDSWA_R	ldswa	[%r27, %r0] 0x4f, %r17
	mov	0x48, %r25
	mov	0x8, %r25
	.word 0xeca7ce80  ! 247: STWA_R	stwa	%r22, [%r31 + %r0] 0x74
	.word 0xe885c4a0  ! 248: LDUWA_R	lduwa	[%r23, %r0] 0x25, %r20
	.word 0xe0974e80  ! 249: LDUHA_R	lduha	[%r29, %r0] 0x74, %r16
	.word 0x87802025  ! 250: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0xecbf8e40  ! 251: STDA_R	stda	%r22, [%r30 + %r0] 0x72
	.word 0xeabfa000  ! 252: STDA_I	stda	%r21, [%r30 + 0x0000] %asi
	mov	0x40, %r17
	mov	0x3d0, %r21
	mov	0x50, %r18
	.word 0xea940400  ! 256: LDUHA_R	lduha	[%r16, %r0] 0x20, %r21
	.word 0xe2a48400  ! 257: STWA_R	stwa	%r17, [%r18 + %r0] 0x20
	.word 0xe8dfa000  ! 258: LDXA_I	ldxa	[%r30, + 0x0000] %asi, %r20
	.word 0xe8b7ce40  ! 259: STHA_R	stha	%r20, [%r31 + %r0] 0x72
	.word 0xea8f0e80  ! 260: LDUBA_R	lduba	[%r28, %r0] 0x74, %r21
	mov	0x60, %r17
	.word 0xeab7e000  ! 262: STHA_I	stha	%r21, [%r31 + 0x0000] %asi
	.word 0xe4f4c400  ! 263: STXA_R	stxa	%r18, [%r19 + %r0] 0x20
	.word 0xe2b7e000  ! 264: STHA_I	stha	%r17, [%r31 + 0x0000] %asi
	.word 0xe2f72000  ! 265: STXA_I	stxa	%r17, [%r28 + 0x0000] %asi
	.word 0xe2d72000  ! 266: LDSHA_I	ldsha	[%r28, + 0x0000] %asi, %r17
	.word 0xe2bfe000  ! 267: STDA_I	stda	%r17, [%r31 + 0x0000] %asi
	mov	0x7d8, %r20
	.word 0xe2bfe000  ! 269: STDA_I	stda	%r17, [%r31 + 0x0000] %asi
	.word 0xe2b76000  ! 270: STHA_I	stha	%r17, [%r29 + 0x0000] %asi
	.word 0x87802020  ! 271: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe2876000  ! 272: LDUWA_I	lduwa	[%r29, + 0x0000] %asi, %r17
	.word 0x87802020  ! 273: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0x87802020  ! 274: WRASI_I	wr	%r0, 0x0020, %asi
	mov	0x7c0, %r23
	.word 0xe6f78e80  ! 276: STXA_R	stxa	%r19, [%r30 + %r0] 0x74
	.word 0xe69c0400  ! 277: LDDA_R	ldda	[%r16, %r0] 0x20, %r19
	.word 0xe2d52000  ! 278: LDSHA_I	ldsha	[%r20, + 0x0000] %asi, %r17
	.word 0xeea7ce40  ! 279: STWA_R	stwa	%r23, [%r31 + %r0] 0x72
	mov	0x48, %r26
	.word 0xeaf5a000  ! 281: STXA_I	stxa	%r21, [%r22 + 0x0000] %asi
	.word 0xeabd6000  ! 282: STDA_I	stda	%r21, [%r21 + 0x0000] %asi
	mov	0x3f8, %r21
	.word 0xecde09e0  ! 284: LDXA_R	ldxa	[%r24, %r0] 0x4f, %r22
	mov	0x10, %r19
	.word 0xe8f5a000  ! 286: STXA_I	stxa	%r20, [%r22 + 0x0000] %asi
	.word 0xe8a5e000  ! 287: STWA_I	stwa	%r20, [%r23 + 0x0000] %asi
	.word 0xec878e60  ! 288: LDUWA_R	lduwa	[%r30, %r0] 0x73, %r22
	.word 0xe0ad2000  ! 289: STBA_I	stba	%r16, [%r20 + 0x0000] %asi
	.word 0x87802020  ! 290: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe6af4e60  ! 291: STBA_R	stba	%r19, [%r29 + %r0] 0x73
	mov	0x60, %r18
	.word 0xe8dfe000  ! 293: LDXA_I	ldxa	[%r31, + 0x0000] %asi, %r20
	mov	0x20, %r25
	.word 0xee870e40  ! 295: LDUWA_R	lduwa	[%r28, %r0] 0x72, %r23
	.word 0xeed40400  ! 296: LDSHA_R	ldsha	[%r16, %r0] 0x20, %r23
	.word 0xeedf2000  ! 297: LDXA_I	ldxa	[%r28, + 0x0000] %asi, %r23
	.word 0xe4b48400  ! 298: STHA_R	stha	%r18, [%r18 + %r0] 0x20
	.word 0xe89cc400  ! 299: LDDA_R	ldda	[%r19, %r0] 0x20, %r20
	.word 0xe2d4c400  ! 300: LDSHA_R	ldsha	[%r19, %r0] 0x20, %r17
	.word 0x87802020  ! 301: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xec966000  ! 302: LDUHA_I	lduha	[%r25, + 0x0000] %asi, %r22
	.word 0xecaee000  ! 303: STBA_I	stba	%r22, [%r27 + 0x0000] %asi
	.word 0xecb66000  ! 304: STHA_I	stha	%r22, [%r25 + 0x0000] %asi
	mov	0x58, %r18
	mov	0x3c0, %r23
	.word 0xec8e2000  ! 307: LDUBA_I	lduba	[%r24, + 0x0000] %asi, %r22
	mov	0x78, %r24
	.word 0xecdea000  ! 309: LDXA_I	ldxa	[%r26, + 0x0000] %asi, %r22
	.word 0xecc66000  ! 310: LDSWA_I	ldswa	[%r25, + 0x0000] %asi, %r22
	mov	0x78, %r25
	.word 0xe2a504a0  ! 312: STWA_R	stwa	%r17, [%r20 + %r0] 0x25
	.word 0xec97ce40  ! 313: LDUHA_R	lduha	[%r31, %r0] 0x72, %r22
	.word 0xe6a62000  ! 314: STWA_I	stwa	%r19, [%r24 + 0x0000] %asi
	.word 0x8780204f  ! 315: WRASI_I	wr	%r0, 0x004f, %asi
	mov	0x38, %r27
	.word 0xe0874e40  ! 317: LDUWA_R	lduwa	[%r29, %r0] 0x72, %r16
	mov	0x40, %r17
	mov	0x0, %r25
	.word 0xecbfa000  ! 320: STDA_I	stda	%r22, [%r30 + 0x0000] %asi
	mov	0x38, %r19
	.word 0xe28c8400  ! 322: LDUBA_R	lduba	[%r18, %r0] 0x20, %r17
	.word 0xe0dfce80  ! 323: LDXA_R	ldxa	[%r31, %r0] 0x74, %r16
	.word 0xeea4c400  ! 324: STWA_R	stwa	%r23, [%r19 + %r0] 0x20
	mov	0x58, %r18
	.word 0xeeb48400  ! 326: STHA_R	stha	%r23, [%r18 + %r0] 0x20
	.word 0xe2dfa000  ! 327: LDXA_I	ldxa	[%r30, + 0x0000] %asi, %r17
	mov	0x50, %r17
	mov	0x28, %r17
	.word 0xe08d84a0  ! 330: LDUBA_R	lduba	[%r22, %r0] 0x25, %r16
	mov	0x20, %r16
	mov	0x28, %r24
	ta	T_CHANGE_NONHPRIV	! macro
	mov	0x3e0, %r22
	.word 0xeaa76000  ! 335: STWA_I	stwa	%r21, [%r29 + 0x0000] %asi
	.word 0x8780204f  ! 336: WRASI_I	wr	%r0, 0x004f, %asi
	mov	0x48, %r16
	.word 0xe4ac4400  ! 338: STBA_R	stba	%r18, [%r17 + %r0] 0x20
	mov	0x48, %r18
	.word 0xe0874e80  ! 340: LDUWA_R	lduwa	[%r29, %r0] 0x74, %r16
	.word 0xe69fe000  ! 341: LDDA_I	ldda	[%r31, + 0x0000] %asi, %r19
	.word 0xe8cc0400  ! 342: LDSBA_R	ldsba	[%r16, %r0] 0x20, %r20
	.word 0xe4b7ce60  ! 343: STHA_R	stha	%r18, [%r31 + %r0] 0x73
	.word 0xe6874e60  ! 344: LDUWA_R	lduwa	[%r29, %r0] 0x73, %r19
	.word 0x87802072  ! 345: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0xea874e60  ! 346: LDUWA_R	lduwa	[%r29, %r0] 0x73, %r21
	.word 0xecb7a000  ! 347: STHA_I	stha	%r22, [%r30 + 0x0000] %asi
	.word 0xecc72000  ! 348: LDSWA_I	ldswa	[%r28, + 0x0000] %asi, %r22
	.word 0xeaf584a0  ! 349: STXA_R	stxa	%r21, [%r22 + %r0] 0x25
	mov	0x58, %r19
	.word 0xe4b4c400  ! 351: STHA_R	stha	%r18, [%r19 + %r0] 0x20
	.word 0xeea44400  ! 352: STWA_R	stwa	%r23, [%r17 + %r0] 0x20
	mov	0x10, %r25
	.word 0xe4a76000  ! 354: STWA_I	stwa	%r18, [%r29 + 0x0000] %asi
	.word 0xe4d74e60  ! 355: LDSHA_R	ldsha	[%r29, %r0] 0x73, %r18
	mov	0x7f8, %r21
	.word 0xe89f4e60  ! 357: LDDA_R	ldda	[%r29, %r0] 0x73, %r20
	.word 0xecb44400  ! 358: STHA_R	stha	%r22, [%r17 + %r0] 0x20
	.word 0xeabfe000  ! 359: STDA_I	stda	%r21, [%r31 + 0x0000] %asi
	mov	0x7c8, %r20
	.word 0xeaa76000  ! 361: STWA_I	stwa	%r21, [%r29 + 0x0000] %asi
	.word 0x87802025  ! 362: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0x87802074  ! 363: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0xeca544a0  ! 364: STWA_R	stwa	%r22, [%r21 + %r0] 0x25
	.word 0xea9fce80  ! 365: LDDA_R	ldda	[%r31, %r0] 0x74, %r21
	mov	0x7f8, %r23
	.word 0xeab7e000  ! 367: STHA_I	stha	%r21, [%r31 + 0x0000] %asi
	mov	0x3f0, %r23
	.word 0xea976000  ! 369: LDUHA_I	lduha	[%r29, + 0x0000] %asi, %r21
	.word 0xe8c70e40  ! 370: LDSWA_R	ldswa	[%r28, %r0] 0x72, %r20
	.word 0xe8b4c400  ! 371: STHA_R	stha	%r20, [%r19 + %r0] 0x20
	.word 0xe88fa000  ! 372: LDUBA_I	lduba	[%r30, + 0x0000] %asi, %r20
	mov	0x3e0, %r22
	.word 0xe887a000  ! 374: LDUWA_I	lduwa	[%r30, + 0x0000] %asi, %r20
	.word 0xe496c9e0  ! 375: LDUHA_R	lduha	[%r27, %r0] 0x4f, %r18
	.word 0x87802020  ! 376: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe0af4e80  ! 377: STBA_R	stba	%r16, [%r29 + %r0] 0x74
	mov	0x70, %r24
	.word 0xe8b78e80  ! 379: STHA_R	stha	%r20, [%r30 + %r0] 0x74
	.word 0xe2afa000  ! 380: STBA_I	stba	%r17, [%r30 + 0x0000] %asi
	.word 0xe6af0e80  ! 381: STBA_R	stba	%r19, [%r28 + %r0] 0x74
	.word 0xe4876000  ! 382: LDUWA_I	lduwa	[%r29, + 0x0000] %asi, %r18
	.word 0xe2f40400  ! 383: STXA_R	stxa	%r17, [%r16 + %r0] 0x20
	.word 0xe8be89e0  ! 384: STDA_R	stda	%r20, [%r26 + %r0] 0x4f
	.word 0xe8cfa000  ! 385: LDSBA_I	ldsba	[%r30, + 0x0000] %asi, %r20
	.word 0xe8df8e80  ! 386: LDXA_R	ldxa	[%r30, %r0] 0x74, %r20
	mov	0x3d0, %r23
	.word 0x8780204f  ! 388: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xea9c6000  ! 389: LDDA_I	ldda	[%r17, + 0x0000] %asi, %r21
	mov	0x28, %r16
	.word 0xeabca000  ! 391: STDA_I	stda	%r21, [%r18 + 0x0000] %asi
	.word 0xeaa4e000  ! 392: STWA_I	stwa	%r21, [%r19 + 0x0000] %asi
	.word 0x87802073  ! 393: WRASI_I	wr	%r0, 0x0073, %asi
	mov	0x18, %r27
	.word 0x87802020  ! 395: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xeedd84a0  ! 396: LDXA_R	ldxa	[%r22, %r0] 0x25, %r23
	.word 0xe4f76000  ! 397: STXA_I	stxa	%r18, [%r29 + 0x0000] %asi
	.word 0x87802072  ! 398: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0xeec78e40  ! 399: LDSWA_R	ldswa	[%r30, %r0] 0x72, %r23
	mov	0x70, %r19
	mov	0x58, %r25
	.word 0xe2b70e60  ! 402: STHA_R	stha	%r17, [%r28 + %r0] 0x73
	.word 0xe88fe000  ! 403: LDUBA_I	lduba	[%r31, + 0x0000] %asi, %r20
	mov	0x3d0, %r23
	.word 0xe0f689e0  ! 405: STXA_R	stxa	%r16, [%r26 + %r0] 0x4f
	.word 0x87802020  ! 406: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe2c7e000  ! 407: LDSWA_I	ldswa	[%r31, + 0x0000] %asi, %r17
	mov	0x7c0, %r21
	.word 0xecacc400  ! 409: STBA_R	stba	%r22, [%r19 + %r0] 0x20
	.word 0xe8b78e80  ! 410: STHA_R	stha	%r20, [%r30 + %r0] 0x74
	mov	0x7e0, %r23
	.word 0xe8d7e000  ! 412: LDSHA_I	ldsha	[%r31, + 0x0000] %asi, %r20
	mov	0x7c0, %r23
	mov	0x30, %r18
	.word 0xe8afa000  ! 415: STBA_I	stba	%r20, [%r30 + 0x0000] %asi
	.word 0xe68d44a0  ! 416: LDUBA_R	lduba	[%r21, %r0] 0x25, %r19
	.word 0xe2b504a0  ! 417: STHA_R	stha	%r17, [%r20 + %r0] 0x25
	mov	0x7c0, %r23
	mov	0x68, %r27
	.word 0xe487a000  ! 420: LDUWA_I	lduwa	[%r30, + 0x0000] %asi, %r18
	.word 0xe4b76000  ! 421: STHA_I	stha	%r18, [%r29 + 0x0000] %asi
	.word 0xe4dfe000  ! 422: LDXA_I	ldxa	[%r31, + 0x0000] %asi, %r18
	mov	0x0, %r25
	mov	0x58, %r24
	.word 0xee870e40  ! 425: LDUWA_R	lduwa	[%r28, %r0] 0x72, %r23
	.word 0xe6876000  ! 426: LDUWA_I	lduwa	[%r29, + 0x0000] %asi, %r19
	.word 0xeade89e0  ! 427: LDXA_R	ldxa	[%r26, %r0] 0x4f, %r21
	.word 0x87802020  ! 428: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe8a7a000  ! 429: STWA_I	stwa	%r20, [%r30 + 0x0000] %asi
	.word 0x87802073  ! 430: WRASI_I	wr	%r0, 0x0073, %asi
	mov	0x38, %r16
	.word 0xe6a48400  ! 432: STWA_R	stwa	%r19, [%r18 + %r0] 0x20
	.word 0xe49f0e80  ! 433: LDDA_R	ldda	[%r28, %r0] 0x74, %r18
	.word 0xe4848400  ! 434: LDUWA_R	lduwa	[%r18, %r0] 0x20, %r18
	.word 0x87802025  ! 435: WRASI_I	wr	%r0, 0x0025, %asi
	mov	0x48, %r25
	.word 0xe2c74e80  ! 437: LDSWA_R	ldswa	[%r29, %r0] 0x74, %r17
	.word 0xe4a48400  ! 438: STWA_R	stwa	%r18, [%r18 + %r0] 0x20
	mov	0x7c0, %r20
	.word 0xe6ac8400  ! 440: STBA_R	stba	%r19, [%r18 + %r0] 0x20
	.word 0xe8d78e40  ! 441: LDSHA_R	ldsha	[%r30, %r0] 0x72, %r20
	mov	0x3c8, %r23
	.word 0x87802020  ! 443: WRASI_I	wr	%r0, 0x0020, %asi
	mov	0x7e8, %r20
	.word 0xe8cfa000  ! 445: LDSBA_I	ldsba	[%r30, + 0x0000] %asi, %r20
	mov	0x3c0, %r20
	mov	0x20, %r24
	.word 0xecdf8e80  ! 448: LDXA_R	ldxa	[%r30, %r0] 0x74, %r22
	.word 0xe2bf2000  ! 449: STDA_I	stda	%r17, [%r28 + 0x0000] %asi
	.word 0xe8a544a0  ! 450: STWA_R	stwa	%r20, [%r21 + %r0] 0x25
	mov	0x3e8, %r23
	.word 0xe6c72000  ! 452: LDSWA_I	ldswa	[%r28, + 0x0000] %asi, %r19
	mov	0x10, %r17
	.word 0xe6af2000  ! 454: STBA_I	stba	%r19, [%r28 + 0x0000] %asi
	.word 0xe6dfa000  ! 455: LDXA_I	ldxa	[%r30, + 0x0000] %asi, %r19
	.word 0x87802072  ! 456: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0xee9c8400  ! 457: LDDA_R	ldda	[%r18, %r0] 0x20, %r23
	mov	0x0, %r19
	.word 0xe2d62000  ! 459: LDSHA_I	ldsha	[%r24, + 0x0000] %asi, %r17
	.word 0xeeb44400  ! 460: STHA_R	stha	%r23, [%r17 + %r0] 0x20
	.word 0xe0cd04a0  ! 461: LDSBA_R	ldsba	[%r20, %r0] 0x25, %r16
	.word 0xea85c4a0  ! 462: LDUWA_R	lduwa	[%r23, %r0] 0x25, %r21
	.word 0xead66000  ! 463: LDSHA_I	ldsha	[%r25, + 0x0000] %asi, %r21
	.word 0xeab62000  ! 464: STHA_I	stha	%r21, [%r24 + 0x0000] %asi
	.word 0xe0d649e0  ! 465: LDSHA_R	ldsha	[%r25, %r0] 0x4f, %r16
	.word 0xe0a66000  ! 466: STWA_I	stwa	%r16, [%r25 + 0x0000] %asi
	mov	0x18, %r19
	mov	0x3d0, %r22
	.word 0x87802020  ! 469: WRASI_I	wr	%r0, 0x0020, %asi
	mov	0x7f0, %r21
	.word 0xe4a78e60  ! 471: STWA_R	stwa	%r18, [%r30 + %r0] 0x73
	mov	0x7d0, %r21
	.word 0xe4d48400  ! 473: LDSHA_R	ldsha	[%r18, %r0] 0x20, %r18
	mov	0x30, %r25
	mov	0x10, %r17
	mov	0x20, %r18
	mov	0x40, %r19
	mov	0x0, %r16
	.word 0xe6afce80  ! 479: STBA_R	stba	%r19, [%r31 + %r0] 0x74
	.word 0xe8f74e80  ! 480: STXA_R	stxa	%r20, [%r29 + %r0] 0x74
	.word 0xe0952000  ! 481: LDUHA_I	lduha	[%r20, + 0x0000] %asi, %r16
	.word 0xe0852000  ! 482: LDUWA_I	lduwa	[%r20, + 0x0000] %asi, %r16
	.word 0xe29f8e40  ! 483: LDDA_R	ldda	[%r30, %r0] 0x72, %r17
	.word 0xe6af0e40  ! 484: STBA_R	stba	%r19, [%r28 + %r0] 0x72
	.word 0xeea5c4a0  ! 485: STWA_R	stwa	%r23, [%r23 + %r0] 0x25
	.word 0xe4a74e80  ! 486: STWA_R	stwa	%r18, [%r29 + %r0] 0x74
	.word 0xeca56000  ! 487: STWA_I	stwa	%r22, [%r21 + 0x0000] %asi
	.word 0xeeac4400  ! 488: STBA_R	stba	%r23, [%r17 + %r0] 0x20
	mov	0x3e0, %r21
	.word 0xe2f52000  ! 490: STXA_I	stxa	%r17, [%r20 + 0x0000] %asi
	.word 0xe2bde000  ! 491: STDA_I	stda	%r17, [%r23 + 0x0000] %asi
	mov	0x0, %r18
	.word 0xe6bf4e40  ! 493: STDA_R	stda	%r19, [%r29 + %r0] 0x72
	mov	0x60, %r16
	.word 0xea978e80  ! 495: LDUHA_R	lduha	[%r30, %r0] 0x74, %r21
	.word 0xeed70e60  ! 496: LDSHA_R	ldsha	[%r28, %r0] 0x73, %r23
	mov	0x48, %r17
	.word 0xe49c8400  ! 498: LDDA_R	ldda	[%r18, %r0] 0x20, %r18
	.word 0x87802020  ! 499: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe6a4e000  ! 500: STWA_I	stwa	%r19, [%r19 + 0x0000] %asi
	.word 0xe8f78e80  ! 501: STXA_R	stxa	%r20, [%r30 + %r0] 0x74
	.word 0x87802020  ! 502: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0x87802020  ! 503: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0x8780204f  ! 504: WRASI_I	wr	%r0, 0x004f, %asi
	mov	0x70, %r16
	mov	0x70, %r25
	.word 0x87802074  ! 507: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0x87802072  ! 508: WRASI_I	wr	%r0, 0x0072, %asi
	mov	0x50, %r26
	.word 0x8780204f  ! 510: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xe2b6e000  ! 511: STHA_I	stha	%r17, [%r27 + 0x0000] %asi
	mov	0x30, %r16
	.word 0xe2c6e000  ! 513: LDSWA_I	ldswa	[%r27, + 0x0000] %asi, %r17
	.word 0xe4cc0400  ! 514: LDSBA_R	ldsba	[%r16, %r0] 0x20, %r18
	.word 0xe2d6e000  ! 515: LDSHA_I	ldsha	[%r27, + 0x0000] %asi, %r17
	mov	0x7c0, %r22
	.word 0xe2bea000  ! 517: STDA_I	stda	%r17, [%r26 + 0x0000] %asi
	.word 0xe2dee000  ! 518: LDXA_I	ldxa	[%r27, + 0x0000] %asi, %r17
	.word 0x8780204f  ! 519: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xe2af2000  ! 520: STBA_I	stba	%r17, [%r28 + 0x0000] %asi
	.word 0xe2cfa000  ! 521: LDSBA_I	ldsba	[%r30, + 0x0000] %asi, %r17
	.word 0xe2af4e40  ! 522: STBA_R	stba	%r17, [%r29 + %r0] 0x72
	.word 0xeadfa000  ! 523: LDXA_I	ldxa	[%r30, + 0x0000] %asi, %r21
	mov	0x30, %r24
	mov	0x30, %r25
	.word 0x87802074  ! 526: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0xe4f48400  ! 527: STXA_R	stxa	%r18, [%r18 + %r0] 0x20
	.word 0xeabea000  ! 528: STDA_I	stda	%r21, [%r26 + 0x0000] %asi
	.word 0x87802020  ! 529: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xea97e000  ! 530: LDUHA_I	lduha	[%r31, + 0x0000] %asi, %r21
	.word 0xe88f4e60  ! 531: LDUBA_R	lduba	[%r29, %r0] 0x73, %r20
	.word 0xe6f4c400  ! 532: STXA_R	stxa	%r19, [%r19 + %r0] 0x20
	.word 0xec9fa000  ! 533: LDDA_I	ldda	[%r30, + 0x0000] %asi, %r22
	.word 0xe2bf8e80  ! 534: STDA_R	stda	%r17, [%r30 + %r0] 0x74
	.word 0xe8a7e000  ! 535: STWA_I	stwa	%r20, [%r31 + 0x0000] %asi
	.word 0xe6dc8400  ! 536: LDXA_R	ldxa	[%r18, %r0] 0x20, %r19
	.word 0x87802020  ! 537: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0x87802020  ! 538: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xee9f2000  ! 539: LDDA_I	ldda	[%r28, + 0x0000] %asi, %r23
	mov	0x7d0, %r20
	mov	0x20, %r18
	.word 0xeecf6000  ! 542: LDSBA_I	ldsba	[%r29, + 0x0000] %asi, %r23
	mov	0x3e0, %r22
	.word 0xeed7a000  ! 544: LDSHA_I	ldsha	[%r30, + 0x0000] %asi, %r23
	.word 0xeed76000  ! 545: LDSHA_I	ldsha	[%r29, + 0x0000] %asi, %r23
	.word 0xe0f4c400  ! 546: STXA_R	stxa	%r16, [%r19 + %r0] 0x20
	.word 0xeeb7ce40  ! 547: STHA_R	stha	%r23, [%r31 + %r0] 0x72
	mov	0x7f8, %r20
	.word 0xe2f7ce60  ! 549: STXA_R	stxa	%r17, [%r31 + %r0] 0x73
	.word 0xe6bf8e80  ! 550: STDA_R	stda	%r19, [%r30 + %r0] 0x74
	mov	0x50, %r19
	.word 0xe2a70e80  ! 552: STWA_R	stwa	%r17, [%r28 + %r0] 0x74
	.word 0x8780204f  ! 553: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xe2bde000  ! 554: STDA_I	stda	%r17, [%r23 + 0x0000] %asi
	.word 0xe2ade000  ! 555: STBA_I	stba	%r17, [%r23 + 0x0000] %asi
	.word 0xe295a000  ! 556: LDUHA_I	lduha	[%r22, + 0x0000] %asi, %r17
	.word 0xe2cde000  ! 557: LDSBA_I	ldsba	[%r23, + 0x0000] %asi, %r17
	.word 0xe2852000  ! 558: LDUWA_I	lduwa	[%r20, + 0x0000] %asi, %r17
	.word 0xe28d2000  ! 559: LDUBA_I	lduba	[%r20, + 0x0000] %asi, %r17
	ta	T_CHANGE_PRIV	! macro
	.word 0xe6a44400  ! 561: STWA_R	stwa	%r19, [%r17 + %r0] 0x20
	.word 0xe69f0e60  ! 562: LDDA_R	ldda	[%r28, %r0] 0x73, %r19
	mov	0x68, %r27
	.word 0xeec5e000  ! 564: LDSWA_I	ldswa	[%r23, + 0x0000] %asi, %r23
	mov	0x18, %r19
	.word 0xee8c4400  ! 566: LDUBA_R	lduba	[%r17, %r0] 0x20, %r23
	mov	0x8, %r27
	.word 0x87802072  ! 568: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0x87802072  ! 569: WRASI_I	wr	%r0, 0x0072, %asi
	mov	0x60, %r26
	.word 0xe8948400  ! 571: LDUHA_R	lduha	[%r18, %r0] 0x20, %r20
	mov	0x3d8, %r20
	mov	0x20, %r17
	.word 0xeccf2000  ! 574: LDSBA_I	ldsba	[%r28, + 0x0000] %asi, %r22
	.word 0xecb76000  ! 575: STHA_I	stha	%r22, [%r29 + 0x0000] %asi
	mov	0x48, %r27
	mov	0x7d8, %r21
	.word 0xeab70e60  ! 578: STHA_R	stha	%r21, [%r28 + %r0] 0x73
	.word 0xeaf7a000  ! 579: STXA_I	stxa	%r21, [%r30 + 0x0000] %asi
	.word 0xeef5c4a0  ! 580: STXA_R	stxa	%r23, [%r23 + %r0] 0x25
	.word 0xe4dfce80  ! 581: LDXA_R	ldxa	[%r31, %r0] 0x74, %r18
	.word 0xe0bf0e60  ! 582: STDA_R	stda	%r16, [%r28 + %r0] 0x73
	.word 0xeab7a000  ! 583: STHA_I	stha	%r21, [%r30 + 0x0000] %asi
	.word 0xe2cc0400  ! 584: LDSBA_R	ldsba	[%r16, %r0] 0x20, %r17
	.word 0xeca40400  ! 585: STWA_R	stwa	%r22, [%r16 + %r0] 0x20
	mov	0x28, %r18
	mov	0x20, %r25
	.word 0xe6bf2000  ! 588: STDA_I	stda	%r19, [%r28 + 0x0000] %asi
	.word 0x87802072  ! 589: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0xeadcc400  ! 590: LDXA_R	ldxa	[%r19, %r0] 0x20, %r21
	.word 0xe8dee000  ! 591: LDXA_I	ldxa	[%r27, + 0x0000] %asi, %r20
	.word 0xe8b6e000  ! 592: STHA_I	stha	%r20, [%r27 + 0x0000] %asi
	.word 0x87802020  ! 593: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0x8780204f  ! 594: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xe2af0e80  ! 595: STBA_R	stba	%r17, [%r28 + %r0] 0x74
	mov	0x7e0, %r23
	mov	0x8, %r27
	.word 0xe2b7ce60  ! 598: STHA_R	stha	%r17, [%r31 + %r0] 0x73
	.word 0xe69cc400  ! 599: LDDA_R	ldda	[%r19, %r0] 0x20, %r19
	.word 0xeeae09e0  ! 600: STBA_R	stba	%r23, [%r24 + %r0] 0x4f
	.word 0x87802020  ! 601: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe0cfce40  ! 602: LDSBA_R	ldsba	[%r31, %r0] 0x72, %r16
	mov	0x48, %r24
	.word 0xe8f649e0  ! 604: STXA_R	stxa	%r20, [%r25 + %r0] 0x4f
	.word 0xecaf8e40  ! 605: STBA_R	stba	%r22, [%r30 + %r0] 0x72
	.word 0xe2b7a000  ! 606: STHA_I	stha	%r17, [%r30 + 0x0000] %asi
	.word 0xe2d7a000  ! 607: LDSHA_I	ldsha	[%r30, + 0x0000] %asi, %r17
	.word 0x8780204f  ! 608: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xe8b74e60  ! 609: STHA_R	stha	%r20, [%r29 + %r0] 0x73
	.word 0xe4dee000  ! 610: LDXA_I	ldxa	[%r27, + 0x0000] %asi, %r18
	.word 0xea8f0e60  ! 611: LDUBA_R	lduba	[%r28, %r0] 0x73, %r21
	.word 0xea848400  ! 612: LDUWA_R	lduwa	[%r18, %r0] 0x20, %r21
	.word 0xee8f4e60  ! 613: LDUBA_R	lduba	[%r29, %r0] 0x73, %r23
	mov	0x20, %r26
	.word 0xe4bee000  ! 615: STDA_I	stda	%r18, [%r27 + 0x0000] %asi
	.word 0xe4f6e000  ! 616: STXA_I	stxa	%r18, [%r27 + 0x0000] %asi
	mov	0x30, %r17
	.word 0xeeccc400  ! 618: LDSBA_R	ldsba	[%r19, %r0] 0x20, %r23
	.word 0xe2d62000  ! 619: LDSHA_I	ldsha	[%r24, + 0x0000] %asi, %r17
	mov	0x30, %r19
	.word 0x8780204f  ! 621: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0x87802020  ! 622: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0x87802074  ! 623: WRASI_I	wr	%r0, 0x0074, %asi
	mov	0x7c8, %r23
	.word 0xe2976000  ! 625: LDUHA_I	lduha	[%r29, + 0x0000] %asi, %r17
	.word 0xecf78e60  ! 626: STXA_R	stxa	%r22, [%r30 + %r0] 0x73
	.word 0xe2dc4400  ! 627: LDXA_R	ldxa	[%r17, %r0] 0x20, %r17
	mov	0x58, %r18
	.word 0xe6cf2000  ! 629: LDSBA_I	ldsba	[%r28, + 0x0000] %asi, %r19
	.word 0xe6bfe000  ! 630: STDA_I	stda	%r19, [%r31 + 0x0000] %asi
	.word 0xe68fe000  ! 631: LDUBA_I	lduba	[%r31, + 0x0000] %asi, %r19
	.word 0xe6f7a000  ! 632: STXA_I	stxa	%r19, [%r30 + 0x0000] %asi
	.word 0xe6f72000  ! 633: STXA_I	stxa	%r19, [%r28 + 0x0000] %asi
	.word 0xe6f72000  ! 634: STXA_I	stxa	%r19, [%r28 + 0x0000] %asi
	.word 0xead584a0  ! 635: LDSHA_R	ldsha	[%r22, %r0] 0x25, %r21
	mov	0x48, %r17
	mov	0x18, %r25
	mov	0x78, %r24
	.word 0xee976000  ! 639: LDUHA_I	lduha	[%r29, + 0x0000] %asi, %r23
	.word 0xeea7a000  ! 640: STWA_I	stwa	%r23, [%r30 + 0x0000] %asi
	.word 0xee972000  ! 641: LDUHA_I	lduha	[%r28, + 0x0000] %asi, %r23
	mov	0x3d0, %r21
	.word 0xecd7ce80  ! 643: LDSHA_R	ldsha	[%r31, %r0] 0x74, %r22
	.word 0x87802020  ! 644: WRASI_I	wr	%r0, 0x0020, %asi
	mov	0x3c8, %r23
	.word 0xe8bf8e60  ! 646: STDA_R	stda	%r20, [%r30 + %r0] 0x73
	.word 0xe2c48400  ! 647: LDSWA_R	ldswa	[%r18, %r0] 0x20, %r17
	.word 0xecd76000  ! 648: LDSHA_I	ldsha	[%r29, + 0x0000] %asi, %r22
	.word 0xecaf6000  ! 649: STBA_I	stba	%r22, [%r29 + 0x0000] %asi
	.word 0xeccf2000  ! 650: LDSBA_I	ldsba	[%r28, + 0x0000] %asi, %r22
	.word 0xecb584a0  ! 651: STHA_R	stha	%r22, [%r22 + %r0] 0x25
	.word 0xe4af6000  ! 652: STBA_I	stba	%r18, [%r29 + 0x0000] %asi
	.word 0xe0d70e80  ! 653: LDSHA_R	ldsha	[%r28, %r0] 0x74, %r16
	.word 0xecc76000  ! 654: LDSWA_I	ldswa	[%r29, + 0x0000] %asi, %r22
	.word 0xecbfe000  ! 655: STDA_I	stda	%r22, [%r31 + 0x0000] %asi
	mov	0x78, %r17
	.word 0xecf72000  ! 657: STXA_I	stxa	%r22, [%r28 + 0x0000] %asi
	.word 0x87802025  ! 658: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0x87802020  ! 659: WRASI_I	wr	%r0, 0x0020, %asi
	mov	0x38, %r17
	mov	0x70, %r27
	mov	0x60, %r18
	.word 0xeac44400  ! 663: LDSWA_R	ldswa	[%r17, %r0] 0x20, %r21
	.word 0xe69fce60  ! 664: LDDA_R	ldda	[%r31, %r0] 0x73, %r19
	.word 0xecb5c4a0  ! 665: STHA_R	stha	%r22, [%r23 + %r0] 0x25
	.word 0xe8dfa000  ! 666: LDXA_I	ldxa	[%r30, + 0x0000] %asi, %r20
	mov	0x28, %r26
	.word 0xe6d7ce40  ! 668: LDSHA_R	ldsha	[%r31, %r0] 0x72, %r19
	.word 0xe8acc400  ! 669: STBA_R	stba	%r20, [%r19 + %r0] 0x20
	mov	0x3f8, %r22
	.word 0x87802025  ! 671: WRASI_I	wr	%r0, 0x0025, %asi
	mov	0x28, %r26
	.word 0xeccf6000  ! 673: LDSBA_I	ldsba	[%r29, + 0x0000] %asi, %r22
	.word 0xecbf6000  ! 674: STDA_I	stda	%r22, [%r29 + 0x0000] %asi
	.word 0xe6a649e0  ! 675: STWA_R	stwa	%r19, [%r25 + %r0] 0x4f
	.word 0xe2adc4a0  ! 676: STBA_R	stba	%r17, [%r23 + %r0] 0x25
	.word 0x87802020  ! 677: WRASI_I	wr	%r0, 0x0020, %asi
	mov	0x7c0, %r22
	mov	0x70, %r27
	.word 0xe2be89e0  ! 680: STDA_R	stda	%r17, [%r26 + %r0] 0x4f
	.word 0xe4a7e000  ! 681: STWA_I	stwa	%r18, [%r31 + 0x0000] %asi
	.word 0xe4dfe000  ! 682: LDXA_I	ldxa	[%r31, + 0x0000] %asi, %r18
	.word 0xe4d76000  ! 683: LDSHA_I	ldsha	[%r29, + 0x0000] %asi, %r18
	.word 0xe4976000  ! 684: LDUHA_I	lduha	[%r29, + 0x0000] %asi, %r18
	.word 0xecb74e40  ! 685: STHA_R	stha	%r22, [%r29 + %r0] 0x72
	mov	0x38, %r16
	mov	0x78, %r27
	.word 0xe28fa000  ! 688: LDUBA_I	lduba	[%r30, + 0x0000] %asi, %r17
	.word 0xe28fe000  ! 689: LDUBA_I	lduba	[%r31, + 0x0000] %asi, %r17
	.word 0xeeb78e80  ! 690: STHA_R	stha	%r23, [%r30 + %r0] 0x74
	.word 0xeac76000  ! 691: LDSWA_I	ldswa	[%r29, + 0x0000] %asi, %r21
	.word 0xead44400  ! 692: LDSHA_R	ldsha	[%r17, %r0] 0x20, %r21
	.word 0xe88fa000  ! 693: LDUBA_I	lduba	[%r30, + 0x0000] %asi, %r20
	.word 0xe29cc400  ! 694: LDDA_R	ldda	[%r19, %r0] 0x20, %r17
	.word 0xe6bfa000  ! 695: STDA_I	stda	%r19, [%r30 + 0x0000] %asi
	.word 0xe6f7a000  ! 696: STXA_I	stxa	%r19, [%r30 + 0x0000] %asi
	mov	0x8, %r18
	.word 0xeea504a0  ! 698: STWA_R	stwa	%r23, [%r20 + %r0] 0x25
	.word 0xe6878e40  ! 699: LDUWA_R	lduwa	[%r30, %r0] 0x72, %r19
	mov	0x3c8, %r23
	mov	0x10, %r27
	.word 0xe2948400  ! 702: LDUHA_R	lduha	[%r18, %r0] 0x20, %r17
	.word 0xeea72000  ! 703: STWA_I	stwa	%r23, [%r28 + 0x0000] %asi
	.word 0xe0d7ce60  ! 704: LDSHA_R	ldsha	[%r31, %r0] 0x73, %r16
	.word 0xea87a000  ! 705: LDUWA_I	lduwa	[%r30, + 0x0000] %asi, %r21
	mov	0x70, %r17
	mov	0x3d0, %r20
	ta	T_CHANGE_NONPRIV	! macro
	mov	0x38, %r26
	.word 0xea8c0400  ! 710: LDUBA_R	lduba	[%r16, %r0] 0x20, %r21
	.word 0xeaf78e60  ! 711: STXA_R	stxa	%r21, [%r30 + %r0] 0x73
	.word 0xe8970e60  ! 712: LDUHA_R	lduha	[%r28, %r0] 0x73, %r20
	.word 0xecbf6000  ! 713: STDA_I	stda	%r22, [%r29 + 0x0000] %asi
	.word 0x87802020  ! 714: WRASI_I	wr	%r0, 0x0020, %asi
	mov	0x38, %r17
	.word 0xe2874e40  ! 716: LDUWA_R	lduwa	[%r29, %r0] 0x72, %r17
	.word 0xecdf0e60  ! 717: LDXA_R	ldxa	[%r28, %r0] 0x73, %r22
	.word 0xecb7e000  ! 718: STHA_I	stha	%r22, [%r31 + 0x0000] %asi
	.word 0xe29f0e60  ! 719: LDDA_R	ldda	[%r28, %r0] 0x73, %r17
	mov	0x10, %r25
	mov	0x8, %r17
	.word 0xe297e000  ! 722: LDUHA_I	lduha	[%r31, + 0x0000] %asi, %r17
	mov	0x3f8, %r20
	.word 0xe2cf6000  ! 724: LDSBA_I	ldsba	[%r29, + 0x0000] %asi, %r17
	.word 0xe28fe000  ! 725: LDUBA_I	lduba	[%r31, + 0x0000] %asi, %r17
	mov	0x7c0, %r22
	.word 0xe2cf2000  ! 727: LDSBA_I	ldsba	[%r28, + 0x0000] %asi, %r17
	.word 0xe2876000  ! 728: LDUWA_I	lduwa	[%r29, + 0x0000] %asi, %r17
	mov	0x3d8, %r21
	.word 0x87802020  ! 730: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe8bf0e40  ! 731: STDA_R	stda	%r20, [%r28 + %r0] 0x72
	.word 0xeef76000  ! 732: STXA_I	stxa	%r23, [%r29 + 0x0000] %asi
	.word 0xeebfce60  ! 733: STDA_R	stda	%r23, [%r31 + %r0] 0x73
	.word 0xe6bfa000  ! 734: STDA_I	stda	%r19, [%r30 + 0x0000] %asi
	.word 0xecb44400  ! 735: STHA_R	stha	%r22, [%r17 + %r0] 0x20
	.word 0xeacf8e60  ! 736: LDSBA_R	ldsba	[%r30, %r0] 0x73, %r21
	.word 0x8780204f  ! 737: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0x87802020  ! 738: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe6c40400  ! 739: LDSWA_R	ldswa	[%r16, %r0] 0x20, %r19
	mov	0x7d8, %r20
	ta	T_CHANGE_HPRIV	! macro
	.word 0xeac5c4a0  ! 742: LDSWA_R	ldswa	[%r23, %r0] 0x25, %r21
	mov	0x3d0, %r23
	.word 0xe8866000  ! 744: LDUWA_I	lduwa	[%r25, + 0x0000] %asi, %r20
	.word 0xe88e6000  ! 745: LDUBA_I	lduba	[%r25, + 0x0000] %asi, %r20
	.word 0xe4d7ce40  ! 746: LDSHA_R	ldsha	[%r31, %r0] 0x72, %r18
	.word 0xecc66000  ! 747: LDSWA_I	ldswa	[%r25, + 0x0000] %asi, %r22
	.word 0xecce2000  ! 748: LDSBA_I	ldsba	[%r24, + 0x0000] %asi, %r22
	.word 0xecf6a000  ! 749: STXA_I	stxa	%r22, [%r26 + 0x0000] %asi
	.word 0xe6ce09e0  ! 750: LDSBA_R	ldsba	[%r24, %r0] 0x4f, %r19
	.word 0xecbc8400  ! 751: STDA_R	stda	%r22, [%r18 + %r0] 0x20
	mov	0x40, %r26
	.word 0x87802073  ! 753: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0xe4a7ce80  ! 754: STWA_R	stwa	%r18, [%r31 + %r0] 0x74
	.word 0xea8ce000  ! 755: LDUBA_I	lduba	[%r19, + 0x0000] %asi, %r21
	.word 0x87802020  ! 756: WRASI_I	wr	%r0, 0x0020, %asi
	mov	0x78, %r27
	.word 0xea8c4400  ! 758: LDUBA_R	lduba	[%r17, %r0] 0x20, %r21
	.word 0x87802073  ! 759: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0xe8a78e60  ! 760: STWA_R	stwa	%r20, [%r30 + %r0] 0x73
	.word 0xe09ee000  ! 761: LDDA_I	ldda	[%r27, + 0x0000] %asi, %r16
	mov	0x7d0, %r20
	.word 0xe6ad44a0  ! 763: STBA_R	stba	%r19, [%r21 + %r0] 0x25
	.word 0xe0f609e0  ! 764: STXA_R	stxa	%r16, [%r24 + %r0] 0x4f
	.word 0xec874e60  ! 765: LDUWA_R	lduwa	[%r29, %r0] 0x73, %r22
	.word 0xea8d84a0  ! 766: LDUBA_R	lduba	[%r22, %r0] 0x25, %r21
	mov	0x7f0, %r22
	.word 0xe28fce80  ! 768: LDUBA_R	lduba	[%r31, %r0] 0x74, %r17
	.word 0xe49609e0  ! 769: LDUHA_R	lduha	[%r24, %r0] 0x4f, %r18
	.word 0xee9f4e60  ! 770: LDDA_R	ldda	[%r29, %r0] 0x73, %r23
	.word 0xe6ac4400  ! 771: STBA_R	stba	%r19, [%r17 + %r0] 0x20
	.word 0xe2dfce60  ! 772: LDXA_R	ldxa	[%r31, %r0] 0x73, %r17
	.word 0xeabf8e60  ! 773: STDA_R	stda	%r21, [%r30 + %r0] 0x73
	.word 0xe68f4e80  ! 774: LDUBA_R	lduba	[%r29, %r0] 0x74, %r19
	mov	0x60, %r24
	mov	0x3d0, %r23
	.word 0xec9c0400  ! 777: LDDA_R	ldda	[%r16, %r0] 0x20, %r22
	mov	0x30, %r27
	mov	0x18, %r26
	.word 0x87802020  ! 780: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xeea62000  ! 781: STWA_I	stwa	%r23, [%r24 + 0x0000] %asi
	.word 0x87802020  ! 782: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe8c78e80  ! 783: LDSWA_R	ldswa	[%r30, %r0] 0x74, %r20
	.word 0xe8ace000  ! 784: STBA_I	stba	%r20, [%r19 + 0x0000] %asi
	.word 0xe8d42000  ! 785: LDSHA_I	ldsha	[%r16, + 0x0000] %asi, %r20
	.word 0xe2a5c4a0  ! 786: STWA_R	stwa	%r17, [%r23 + %r0] 0x25
	.word 0xeeafce40  ! 787: STBA_R	stba	%r23, [%r31 + %r0] 0x72
	mov	0x28, %r27
	.word 0xe8ae89e0  ! 789: STBA_R	stba	%r20, [%r26 + %r0] 0x4f
	.word 0xe28d84a0  ! 790: LDUBA_R	lduba	[%r22, %r0] 0x25, %r17
	.word 0xe6bc4400  ! 791: STDA_R	stda	%r19, [%r17 + %r0] 0x20
	.word 0xeed4e000  ! 792: LDSHA_I	ldsha	[%r19, + 0x0000] %asi, %r23
	.word 0xee84a000  ! 793: LDUWA_I	lduwa	[%r18, + 0x0000] %asi, %r23
	.word 0x87802074  ! 794: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0xe4f74e40  ! 795: STXA_R	stxa	%r18, [%r29 + %r0] 0x72
	.word 0xecd6c9e0  ! 796: LDSHA_R	ldsha	[%r27, %r0] 0x4f, %r22
	.word 0xeef544a0  ! 797: STXA_R	stxa	%r23, [%r21 + %r0] 0x25
	.word 0xe08f0e40  ! 798: LDUBA_R	lduba	[%r28, %r0] 0x72, %r16
	mov	0x38, %r24
	.word 0xe2a6c9e0  ! 800: STWA_R	stwa	%r17, [%r27 + %r0] 0x4f
	.word 0xe0dfe000  ! 801: LDXA_I	ldxa	[%r31, + 0x0000] %asi, %r16
	.word 0xe0d7e000  ! 802: LDSHA_I	ldsha	[%r31, + 0x0000] %asi, %r16
	.word 0xe087a000  ! 803: LDUWA_I	lduwa	[%r30, + 0x0000] %asi, %r16
	mov	0x7e0, %r22
	.word 0xe0bf2000  ! 805: STDA_I	stda	%r16, [%r28 + 0x0000] %asi
	.word 0xecaf0e80  ! 806: STBA_R	stba	%r22, [%r28 + %r0] 0x74
	.word 0xe48fe000  ! 807: LDUBA_I	lduba	[%r31, + 0x0000] %asi, %r18
	mov	0x7d8, %r20
	mov	0x50, %r17
	.word 0xe0c40400  ! 810: LDSWA_R	ldswa	[%r16, %r0] 0x20, %r16
	.word 0xeaafa000  ! 811: STBA_I	stba	%r21, [%r30 + 0x0000] %asi
	mov	0x58, %r16
	.word 0x87802025  ! 813: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0x87802025  ! 814: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0xe8b609e0  ! 815: STHA_R	stha	%r20, [%r24 + %r0] 0x4f
	.word 0x87802025  ! 816: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0xe087e000  ! 817: LDUWA_I	lduwa	[%r31, + 0x0000] %asi, %r16
	.word 0xeede49e0  ! 818: LDXA_R	ldxa	[%r25, %r0] 0x4f, %r23
	.word 0xe0b544a0  ! 819: STHA_R	stha	%r16, [%r21 + %r0] 0x25
	.word 0x87802073  ! 820: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0xe4aea000  ! 821: STBA_I	stba	%r18, [%r26 + 0x0000] %asi
	.word 0xeaf40400  ! 822: STXA_R	stxa	%r21, [%r16 + %r0] 0x20
	.word 0xee9d44a0  ! 823: LDDA_R	ldda	[%r21, %r0] 0x25, %r23
	.word 0xe4d4c400  ! 824: LDSHA_R	ldsha	[%r19, %r0] 0x20, %r18
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xe2dea000  ! 826: LDXA_I	ldxa	[%r26, + 0x0000] %asi, %r17
	.word 0x87802020  ! 827: WRASI_I	wr	%r0, 0x0020, %asi
	mov	0x7e0, %r20
	.word 0xe09e09e0  ! 829: LDDA_R	ldda	[%r24, %r0] 0x4f, %r16
	.word 0xeac70e60  ! 830: LDSWA_R	ldswa	[%r28, %r0] 0x73, %r21
	.word 0xeeb42000  ! 831: STHA_I	stha	%r23, [%r16 + 0x0000] %asi
	.word 0x87802020  ! 832: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xeebd2000  ! 833: STDA_I	stda	%r23, [%r20 + 0x0000] %asi
	.word 0xeed5a000  ! 834: LDSHA_I	ldsha	[%r22, + 0x0000] %asi, %r23
	.word 0xeef56000  ! 835: STXA_I	stxa	%r23, [%r21 + 0x0000] %asi
	.word 0x87802020  ! 836: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xeede6000  ! 837: LDXA_I	ldxa	[%r25, + 0x0000] %asi, %r23
	.word 0x87802025  ! 838: WRASI_I	wr	%r0, 0x0025, %asi
	mov	0x3e0, %r23
	mov	0x40, %r16
	.word 0xe6cf4e40  ! 841: LDSBA_R	ldsba	[%r29, %r0] 0x72, %r19
	.word 0xeab7a000  ! 842: STHA_I	stha	%r21, [%r30 + 0x0000] %asi
	.word 0xe8d504a0  ! 843: LDSHA_R	ldsha	[%r20, %r0] 0x25, %r20
	.word 0x87802025  ! 844: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0xec8f8e40  ! 845: LDUBA_R	lduba	[%r30, %r0] 0x72, %r22
	.word 0xe0a7e000  ! 846: STWA_I	stwa	%r16, [%r31 + 0x0000] %asi
	.word 0xe0bfe000  ! 847: STDA_I	stda	%r16, [%r31 + 0x0000] %asi
	.word 0x87802025  ! 848: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0xe0be2000  ! 849: STDA_I	stda	%r16, [%r24 + 0x0000] %asi
	.word 0xe89f0e60  ! 850: LDDA_R	ldda	[%r28, %r0] 0x73, %r20
	.word 0x8780204f  ! 851: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xe0bfe000  ! 852: STDA_I	stda	%r16, [%r31 + 0x0000] %asi
	mov	0x3e8, %r21
	.word 0xe0d76000  ! 854: LDSHA_I	ldsha	[%r29, + 0x0000] %asi, %r16
	mov	0x50, %r26
	mov	0x28, %r25
	.word 0xe0cf6000  ! 857: LDSBA_I	ldsba	[%r29, + 0x0000] %asi, %r16
	.word 0xe6b40400  ! 858: STHA_R	stha	%r19, [%r16 + %r0] 0x20
	.word 0x8780204f  ! 859: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xe6b504a0  ! 860: STHA_R	stha	%r19, [%r20 + %r0] 0x25
	.word 0x87802072  ! 861: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0xea8d04a0  ! 862: LDUBA_R	lduba	[%r20, %r0] 0x25, %r21
	.word 0xe0cf0e60  ! 863: LDSBA_R	ldsba	[%r28, %r0] 0x73, %r16
	mov	0x7c8, %r21
	mov	0x70, %r26
	mov	0x70, %r27
	.word 0x87802020  ! 867: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe4c44400  ! 868: LDSWA_R	ldswa	[%r17, %r0] 0x20, %r18
	.word 0x87802020  ! 869: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe6b66000  ! 870: STHA_I	stha	%r19, [%r25 + 0x0000] %asi
	mov	0x50, %r19
	.word 0x87802072  ! 872: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0xecc4c400  ! 873: LDSWA_R	ldswa	[%r19, %r0] 0x20, %r22
	.word 0xeed7ce80  ! 874: LDSHA_R	ldsha	[%r31, %r0] 0x74, %r23
	mov	0x70, %r16
	.word 0x87802074  ! 876: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0xe08fce60  ! 877: LDUBA_R	lduba	[%r31, %r0] 0x73, %r16
	.word 0xee9609e0  ! 878: LDUHA_R	lduha	[%r24, %r0] 0x4f, %r23
	.word 0xeaa5e000  ! 879: STWA_I	stwa	%r21, [%r23 + 0x0000] %asi
	.word 0xeaf56000  ! 880: STXA_I	stxa	%r21, [%r21 + 0x0000] %asi
	.word 0x87802073  ! 881: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0x87802020  ! 882: WRASI_I	wr	%r0, 0x0020, %asi
	mov	0x38, %r25
	.word 0x87802025  ! 884: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0xe0a4c400  ! 885: STWA_R	stwa	%r16, [%r19 + %r0] 0x20
	.word 0xe6dc0400  ! 886: LDXA_R	ldxa	[%r16, %r0] 0x20, %r19
	.word 0xecd4a000  ! 887: LDSHA_I	ldsha	[%r18, + 0x0000] %asi, %r22
	.word 0x87802072  ! 888: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0x87802073  ! 889: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0xec84e000  ! 890: LDUWA_I	lduwa	[%r19, + 0x0000] %asi, %r22
	.word 0xe4b40400  ! 891: STHA_R	stha	%r18, [%r16 + %r0] 0x20
	.word 0x87802073  ! 892: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0xeadd6000  ! 893: LDXA_I	ldxa	[%r21, + 0x0000] %asi, %r21
	mov	0x60, %r18
	mov	0x3f0, %r22
	mov	0x7f8, %r22
	mov	0x30, %r16
	.word 0xe2ae89e0  ! 898: STBA_R	stba	%r17, [%r26 + %r0] 0x4f
	.word 0xe8a52000  ! 899: STWA_I	stwa	%r20, [%r20 + 0x0000] %asi
	.word 0xe2974e60  ! 900: LDUHA_R	lduha	[%r29, %r0] 0x73, %r17
	.word 0xecaf4e40  ! 901: STBA_R	stba	%r22, [%r29 + %r0] 0x72
	.word 0xe6d4c400  ! 902: LDSHA_R	ldsha	[%r19, %r0] 0x20, %r19
	.word 0xeebec9e0  ! 903: STDA_R	stda	%r23, [%r27 + %r0] 0x4f
	.word 0xeaf609e0  ! 904: STXA_R	stxa	%r21, [%r24 + %r0] 0x4f
	.word 0xe2d56000  ! 905: LDSHA_I	ldsha	[%r21, + 0x0000] %asi, %r17
	.word 0x87802025  ! 906: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0xe2b46000  ! 907: STHA_I	stha	%r17, [%r17 + 0x0000] %asi
	.word 0x87802073  ! 908: WRASI_I	wr	%r0, 0x0073, %asi
	mov	0x0, %r19
	mov	0x28, %r16
	.word 0x87802020  ! 911: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe2c5c4a0  ! 912: LDSWA_R	ldswa	[%r23, %r0] 0x25, %r17
	mov	0x8, %r27
	mov	0x28, %r19
	mov	0x10, %r16
	.word 0xe4a42000  ! 916: STWA_I	stwa	%r18, [%r16 + 0x0000] %asi
	.word 0xe6b44400  ! 917: STHA_R	stha	%r19, [%r17 + %r0] 0x20
	.word 0x87802020  ! 918: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe6ce49e0  ! 919: LDSBA_R	ldsba	[%r25, %r0] 0x4f, %r19
	.word 0xe8b62000  ! 920: STHA_I	stha	%r20, [%r24 + 0x0000] %asi
	.word 0xeea6c9e0  ! 921: STWA_R	stwa	%r23, [%r27 + %r0] 0x4f
	mov	0x70, %r19
	mov	0x78, %r26
	.word 0xe4cfce60  ! 924: LDSBA_R	ldsba	[%r31, %r0] 0x73, %r18
	.word 0xe8f6a000  ! 925: STXA_I	stxa	%r20, [%r26 + 0x0000] %asi
	.word 0x87802020  ! 926: WRASI_I	wr	%r0, 0x0020, %asi
	mov	0x50, %r17
	.word 0xecbd84a0  ! 928: STDA_R	stda	%r22, [%r22 + %r0] 0x25
	.word 0xe8874e40  ! 929: LDUWA_R	lduwa	[%r29, %r0] 0x72, %r20
	.word 0x87802020  ! 930: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe8be89e0  ! 931: STDA_R	stda	%r20, [%r26 + %r0] 0x4f
	.word 0xe0b44400  ! 932: STHA_R	stha	%r16, [%r17 + %r0] 0x20
	mov	0x7f0, %r22
	.word 0xead4a000  ! 934: LDSHA_I	ldsha	[%r18, + 0x0000] %asi, %r21
	.word 0xeedf0e40  ! 935: LDXA_R	ldxa	[%r28, %r0] 0x72, %r23
	.word 0xe49c2000  ! 936: LDDA_I	ldda	[%r16, + 0x0000] %asi, %r18
	.word 0x87802020  ! 937: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe4ac6000  ! 938: STBA_I	stba	%r18, [%r17 + 0x0000] %asi
	.word 0x87802072  ! 939: WRASI_I	wr	%r0, 0x0072, %asi
	mov	0x50, %r24
	.word 0xe4b4a000  ! 941: STHA_I	stha	%r18, [%r18 + 0x0000] %asi
	.word 0xe88584a0  ! 942: LDUWA_R	lduwa	[%r22, %r0] 0x25, %r20
	mov	0x3c8, %r22
	.word 0xe084a000  ! 944: LDUWA_I	lduwa	[%r18, + 0x0000] %asi, %r16
	.word 0xe4ae49e0  ! 945: STBA_R	stba	%r18, [%r25 + %r0] 0x4f
	.word 0xe2f74e80  ! 946: STXA_R	stxa	%r17, [%r29 + %r0] 0x74
	.word 0x87802072  ! 947: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0x87802020  ! 948: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe6ccc400  ! 949: LDSBA_R	ldsba	[%r19, %r0] 0x20, %r19
	.word 0xe0b56000  ! 950: STHA_I	stha	%r16, [%r21 + 0x0000] %asi
	.word 0xe0bda000  ! 951: STDA_I	stda	%r16, [%r22 + 0x0000] %asi
	.word 0xeedc0400  ! 952: LDXA_R	ldxa	[%r16, %r0] 0x20, %r23
	.word 0xe89de000  ! 953: LDDA_I	ldda	[%r23, + 0x0000] %asi, %r20
	.word 0xe8f56000  ! 954: STXA_I	stxa	%r20, [%r21 + 0x0000] %asi
	.word 0x87802025  ! 955: WRASI_I	wr	%r0, 0x0025, %asi
	mov	0x7e0, %r21
	.word 0xe8f52000  ! 957: STXA_I	stxa	%r20, [%r20 + 0x0000] %asi
	mov	0x3e0, %r22
	.word 0xe0ac8400  ! 959: STBA_R	stba	%r16, [%r18 + %r0] 0x20
	mov	0x7e8, %r20
	mov	0x18, %r17
	.word 0xe6bde000  ! 962: STDA_I	stda	%r19, [%r23 + 0x0000] %asi
	mov	0x28, %r19
	.word 0xe6956000  ! 964: LDUHA_I	lduha	[%r21, + 0x0000] %asi, %r19
	mov	0x40, %r18
	mov	0x7f0, %r21
	.word 0x87802025  ! 967: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0xe6bf6000  ! 968: STDA_I	stda	%r19, [%r29 + 0x0000] %asi
	.word 0xe6876000  ! 969: LDUWA_I	lduwa	[%r29, + 0x0000] %asi, %r19
	.word 0xec87ce80  ! 970: LDUWA_R	lduwa	[%r31, %r0] 0x74, %r22
	.word 0xe4df6000  ! 971: LDXA_I	ldxa	[%r29, + 0x0000] %asi, %r18
	.word 0x87802025  ! 972: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0xe4bca000  ! 973: STDA_I	stda	%r18, [%r18 + 0x0000] %asi
	.word 0xe68584a0  ! 974: LDUWA_R	lduwa	[%r22, %r0] 0x25, %r19
	.word 0xeef78e80  ! 975: STXA_R	stxa	%r23, [%r30 + %r0] 0x74
	.word 0xe6b40400  ! 976: STHA_R	stha	%r19, [%r16 + %r0] 0x20
	mov	0x20, %r25
	mov	0x7d0, %r20
	.word 0x8780204f  ! 979: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xe4dd6000  ! 980: LDXA_I	ldxa	[%r21, + 0x0000] %asi, %r18
	.word 0xe0f70e60  ! 981: STXA_R	stxa	%r16, [%r28 + %r0] 0x73
	mov	0x38, %r27
	.word 0xecbd84a0  ! 983: STDA_R	stda	%r22, [%r22 + %r0] 0x25
	.word 0x87802020  ! 984: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe89f2000  ! 985: LDDA_I	ldda	[%r28, + 0x0000] %asi, %r20
	mov	0x68, %r27
	.word 0xe2944400  ! 987: LDUHA_R	lduha	[%r17, %r0] 0x20, %r17
	mov	0x68, %r17
	.word 0xe4af2000  ! 989: STBA_I	stba	%r18, [%r28 + 0x0000] %asi
	mov	0x7e0, %r20
	mov	0x8, %r17
	mov	0x0, %r19
	.word 0x87802020  ! 993: WRASI_I	wr	%r0, 0x0020, %asi
	mov	0x78, %r17
	.word 0x87802020  ! 995: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe4972000  ! 996: LDUHA_I	lduha	[%r28, + 0x0000] %asi, %r18
	.word 0xe497e000  ! 997: LDUHA_I	lduha	[%r31, + 0x0000] %asi, %r18
	.word 0xe0dd44a0  ! 998: LDXA_R	ldxa	[%r21, %r0] 0x25, %r16
	mov	0x18, %r25

join_lbl_0_0:
!		$EV trig_pc_d(1,expr(@VA(.RED_EXT_SEC.HRedmode_Reset_Handler) + 4, 16, 16)) -> intp(1, 1, 1)
!		$EV trig_pc_d(1,expr(@VA(.RED_EXT_SEC.HRedmode_Reset_Handler) + 8, 16, 16)) -> intp(2, 1, 1)
!		$EV trig_pc_d(1,expr(@VA(.RED_EXT_SEC.HRedmode_Reset_Handler) + 12, 16, 16)) -> intp(3, 1, 1)



	ta	T_GOOD_TRAP

.data
	.xword 0x1234567887654321

#if 0
!!# /*
!!#  */
!!# 
!!# %%section c_declarations
!!# 
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
!!#   static int asi_rvar_array[6] = {Rv_20, Rv_25, Rv_4f, Rv_72_73_74, Rv_72_73_74, Rv_72_73_74};
!!# 
!!#   IJ_bind_thread_group("diag.j", 19, th_all,    0xf);
!!# 
!!#   IJ_set_default_rule_wt_rvar ( "diag.j", 21,"{16}" );
!!#   IJ_set_rvar ("diag.j", 22, Rv_low_wt, "{1}");
!!#   IJ_set_rvar ("diag.j", 23, Rv_mid_wt, "{8}");
!!# 
!!#   IJ_set_rvar ("diag.j", 26, Rv_scratch_pad_va, "13'b0 0000 0rrr r000");
!!# 
!!#   IJ_set_rvar ("diag.j", 29, Rv_q_va, "13'b0 0r11 11rr r000");
!!# 
!!#   IJ_set_rvar ("diag.j", 32, Rv_hyp_scratch_pad_va, "13'b0 0000 0rrr r000");
!!# 
!!#   IJ_set_rvar ("diag.j", 34, Rv_asi, "{0x20, 0x25, 0x4f, 0x72, 0x73, 0x74}");
!!#   IJ_copy_rvar ("diag.j", 35, Rv_asi_reg, Rv_asi);
!!# 
!!#   IJ_set_rvar ("diag.j", 37, Rv_20, "5'b1 00rr");
!!#   IJ_set_rvar ("diag.j", 38, Rv_25, "5'b1 01rr");
!!#   IJ_set_rvar ("diag.j", 39, Rv_4f, "5'b1 10rr");
!!#   IJ_set_rvar ("diag.j", 40, Rv_72_73_74, "5'b1 11rr");
!!# 
!!#   IJ_assign_ropr_fld ("diag.j", 42, ijdefault, Ft_Imm_Asi, Rv_asi);
!!# 
!!#   IJ_set_rvar ("diag.j", 44, Rv_rand64, "64'hrrrr rrrr rrrr rrrr");
!!# 
!!#   IJ_set_ropr_fld ("diag.j", 46, ijdefault, Ft_Rs2, "{0}");
!!#   IJ_set_ropr_fld ("diag.j", 47, ijdefault, Ft_Simm13, "13'b0 0000 0000 rr00");
!!#   IJ_set_ropr_fld ("diag.j", 48, ijdefault, Ft_Rd, "{16..23}");
!!# 
!!#   IJ_install_ropr_cb ("diag.j", 50,ijdefault, Ft_Rs1, my_imm_asi_to_rvar, Rv_asi, Ft_Null, (void *) asi_rvar_array);
!!# 
!!#   IJ_set_ropr_fld   ( "diag.j", 52, Ro_asi, Ft_Rs1, "{0}");
!!#   IJ_assign_ropr_fld ("diag.j", 53, Ro_asi, Ft_Simm13, Rv_asi_reg);
!!# 
!!#   IJ_set_ropr_fld    ("diag.j", 55, Ro_reg_asi, Ft_Rs1, "{0}");
!!#   IJ_set_ropr_fld    ("diag.j", 56, Ro_reg_asi, Ft_Simm13, "{0}");
!!#   IJ_install_ropr_cb ("diag.j", 57,Ro_reg_asi, Ft_Rs1, my_imm_asi_to_rvar, Rv_asi_reg, Ft_Null, (void *) asi_rvar_array);
!!# 
!!#   IJ_init_regs_by_setx ("diag.j", 59, th_all, 3, 1, Rv_rand64);
!!# 
!!#   IJ_printf ("diag.j", 61, th_all, "\tmov\t0x%rx, %%r16\n", Rv_scratch_pad_va);
!!#   IJ_printf ("diag.j", 62, th_all, "\tmov\t0x%rx, %%r17\n", Rv_scratch_pad_va);
!!#   IJ_printf ("diag.j", 63, th_all, "\tmov\t0x%rx, %%r18\n", Rv_scratch_pad_va);
!!#   IJ_printf ("diag.j", 64, th_all, "\tmov\t0x%rx, %%r19\n", Rv_scratch_pad_va);
!!# 
!!#   IJ_printf ("diag.j", 66, th_all, "\tmov\t0x%rx, %%r20\n", Rv_q_va);
!!#   IJ_printf ("diag.j", 67, th_all, "\tmov\t0x%rx, %%r21\n", Rv_q_va);
!!#   IJ_printf ("diag.j", 68, th_all, "\tmov\t0x%rx, %%r22\n", Rv_q_va);
!!#   IJ_printf ("diag.j", 69, th_all, "\tmov\t0x%rx, %%r23\n", Rv_q_va);
!!# 
!!#   IJ_printf ("diag.j", 71, th_all, "\tmov\t0x%rx, %%r24\n", Rv_hyp_scratch_pad_va);
!!#   IJ_printf ("diag.j", 72, th_all, "\tmov\t0x%rx, %%r25\n", Rv_hyp_scratch_pad_va);
!!#   IJ_printf ("diag.j", 73, th_all, "\tmov\t0x%rx, %%r26\n", Rv_hyp_scratch_pad_va);
!!#   IJ_printf ("diag.j", 74, th_all, "\tmov\t0x%rx, %%r27\n", Rv_hyp_scratch_pad_va);
!!# 
!!#   IJ_printf ("diag.j", 76, th_all, "\tmov\t0, %%r28\n");
!!#   IJ_printf ("diag.j", 77, th_all, "\tmov\t0, %%r29\n");
!!#   IJ_printf ("diag.j", 78, th_all, "\tmov\t0, %%r30\n");
!!#   IJ_printf ("diag.j", 79, th_all, "\tmov\t0, %%r31\n");
!!# 
!!#   IJ_printf ("diag.j", 81, th_all, "\tta\t%%icc, T_CHANGE_HPRIV\n");
!!#   IJ_printf ("diag.j", 82, th_all, "\twr\t%%g0, 0x%rx, %%asi\n", Rv_asi_reg);
!!#   IJ_printf ("diag.j", 83, th_all, "\tstxa\t%%g0, [%%g0] 0x42\n");
!!#   IJ_printf ("diag.j", 84, th_all, "\tmov\t0x38, %%g1\n");
!!#   IJ_printf ("diag.j", 85, th_all, "\tstxa\t%%g0, [%%g1] 0x58\n");
!!# 
!!#   IJ_th_fork("diag.j", 87,0x2, 0x4, 0x8, -1);;
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
!!#   IJ_th_join("diag.j", 93,0xff);
!!#   IJ_th_start ("diag.j", 94,Seq_Start, NULL, 1);
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
!!# 	{
!!# 		IJ_generate ("diag.j", 141, th_all, $2);
!!# 	}
!!# ;
!!# 
!!# inst_type: load_imm_asi
!!# 	| load_reg_asi  %ropr  Ro_reg_asi
!!# 	| store_imm_asi
!!# 	| store_reg_asi %ropr  Ro_reg_asi
!!# 	| change_priv_tl %rvar  Rv_low_wt
!!# 	| set_20_va     %rvar  Rv_mid_wt
!!# 	| set_25_va	%rvar  Rv_mid_wt
!!# 	| set_4f_va	%rvar  Rv_mid_wt
!!# 	| wrasi		// rvar Rv_mid_wt
!!# ;
!!# 
!!# wrasi: tWRASI_I %ropr  Ro_asi
!!# ;
!!# 
!!# change_priv_tl: tCHANGE_NONPRIV | tCHANGE_PRIV | tCHANGE_NONHPRIV 
!!# 	| tCHANGE_HPRIV // | tCHANGE_TO_TL0 | tCHANGE_TO_TL1
!!# ;
!!# 
!!# set_20_va: mSET_20_VA
!!# 	{
!!# 		IJ_printf ("diag.j", 166, th_all, "\tmov\t0x%rx, %%r%rd\n",
!!# 			Rv_scratch_pad_va,Rv_20);
!!#         }
!!# ;
!!# 
!!# set_25_va: mSET_25_VA
!!# 	{
!!# 		IJ_printf ("diag.j", 173, th_all, "\tmov\t0x%rx, %%r%rd\n",
!!# 			 Rv_q_va,Rv_25);
!!#         }
!!# ;
!!# 
!!# set_4f_va: mSET_4f_VA
!!# 	{
!!# 		IJ_printf ("diag.j", 180, th_all, "\tmov\t0x%rx, %%r%rd\n",
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
!!# 
!!# %%
!!# %%section cbfunc
!!# 
!!# 
!!# my_imm_asi_to_rvar (int line, int rv_ro, field_type_t fld, void *data)
!!# {
!!#   int asi;
!!#   int r;
!!#   int *d = (int *) data;
!!# 
!!#   if (fld == Ft_Null)
!!#       asi = IJ_get_rvar_val32("diag.j", 208, rv_ro);
!!#   else
!!#     asi = IJ_get_ropr_fld_val ("diag.j", 210, rv_ro, fld);
!!# 
!!#   switch (asi) {
!!#     case 0x20:
!!#       IJ_update_rvar ("diag.j", 214, d[0]);
!!#       return (IJ_get_rvar_val32("diag.j", 215, d[0]));
!!#     case 0x25:
!!#       IJ_update_rvar ("diag.j", 217, d[1]);
!!#       return (IJ_get_rvar_val32("diag.j", 218, d[1]));
!!#     case 0x4f:
!!#       IJ_update_rvar ("diag.j", 220, d[2]);
!!#       return (IJ_get_rvar_val32("diag.j", 221, d[2]));
!!#     case 0x72:
!!#       IJ_update_rvar ("diag.j", 223, d[3]);
!!#       return (IJ_get_rvar_val32("diag.j", 224, d[3]));
!!#     case 0x73:
!!#       IJ_update_rvar ("diag.j", 226, d[4]);
!!#       return (IJ_get_rvar_val32("diag.j", 227, d[4]));
!!#     case 0x74:
!!#       IJ_update_rvar ("diag.j", 229, d[5]);
!!#       return (IJ_get_rvar_val32("diag.j", 230, d[5]));
!!#   }
!!# }
!!# 
!!# 
!!# 
!!# 
!!# %%
!!# %%section stat
!!# 
!!# %%
#endif
