// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: tlu_multi_tsasr_2.s
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
/* File: tlu_multi_tsasr_2.s
 * Description:
 *	This diag tries to create multiple TSA access at around the same time
 * by creating asynchronous FP traps (fp_other/fp_ieee754) and wrpr to trap
 * stack registers on different threads.
 */

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
	wr	%g0, 4, %fprs

! Register init code

	setx 0xad33e5250fe21945, %g1, %g0
	setx 0x54b9e006a1646716, %g1, %g1
	setx 0x0e2db2abf7ac653e, %g1, %g2
	setx 0x860695cd1d34ca82, %g1, %g3
	setx 0xb001c79f60123864, %g1, %g4
	setx 0x74453ffe72041b51, %g1, %g5
	setx 0x6acb2d99e1b8d03f, %g1, %g6
	setx 0x99ab5c79d5b90c43, %g1, %g7
	setx 0xfa676d39201fbccc, %g1, %r16
	setx 0xf6fdb5b38f22c753, %g1, %r17
	setx 0xd7b6fcac8410a923, %g1, %r18
	setx 0xa631a91d377ac02f, %g1, %r19
	setx 0xe29bad3d70294b40, %g1, %r20
	setx 0xc3894a2bb82d2ac9, %g1, %r21
	setx 0x43115515b0204094, %g1, %r22
	setx 0x75e61a96ceabd858, %g1, %r23
	setx 0xe34a707c6cf27cce, %g1, %r24
	setx 0x8660aa6dce4566cb, %g1, %r25
	setx 0xf06d9e4b4df2e568, %g1, %r26
	setx 0xac3fad2cd14eb9f9, %g1, %r27
	setx 0xaa9c76175e692d29, %g1, %r28
	setx 0xb22a5dd6e0dcb9ec, %g1, %r29
	setx 0x490b385d3b27c3a4, %g1, %r30
	setx 0x6b05b65eaa705dc5, %g1, %r31
	setx	data_start, %g1, %l2
	ld 	[%l2+0x0], %f0
	ld 	[%l2+0x4], %f1
	ld 	[%l2+0x8], %f2
	ld 	[%l2+0xc], %f3
	ld 	[%l2+0x10], %f4
	ld 	[%l2+0x14], %f5
	ld 	[%l2+0x18], %f6
	ld 	[%l2+0x1c], %f7
	ld 	[%l2+0x20], %f8
	ld 	[%l2+0x24], %f9
	ld 	[%l2+0x28], %f10
	ld 	[%l2+0x2c], %f11
	ld 	[%l2+0x30], %f12
	ld 	[%l2+0x34], %f13
	ld 	[%l2+0x38], %f14
	ld 	[%l2+0x3c], %f15
	th_fork(main_th)

main_th_0:
main_th_1:
	ta	T_CHANGE_PRIV	! macro
	wrpr	%g0, 1, %tl
	mov	256, %g7
wait_loop_0:
	fadds	%f0, %f1, %f2
	wrpr	%l1, %tpc
	faddd	%f0, %f2, %f4
	wrpr	%l1, %tnpc
	faddq	%f0, %f4, %f8
	wrpr	%l2, %tstate
	wrpr	%l3, %tt
	dec	%g7
	cmp	%g0, %g7
	bne	%xcc, wait_loop_0
	nop
	nop
	b	diag_pass
	nop
	nop
main_th_2:
main_th_3:
	ta	T_CHANGE_PRIV	! macro
	wr	%g0, 4, %fprs
	wrpr	%g0, 1, %tl
	mov	256, %g7
wait_loop_1:
	fadds	%f8, %f9, %f10
	wrpr	%l1, %tpc
	faddd	%f8, %f10, %f12
	wrpr	%l1, %tnpc
	faddq	%f8, %f12, %f16
	wrpr	%l2, %tstate
	wrpr	%l3, %tt
	dec	%g7
	cmp	%g0, %g7
	bne	%xcc, wait_loop_1
	nop
	nop

	.data
data_start:
	.xword	0x68731cc55258fcc6
	.xword	0x64297dea458deb94
	.xword	0xbd070713e308fc36
	.xword	0x29f23727823c8f78
	.xword	0xd80b5ccc37147394
	.xword	0xc64c69ebc926ed5d
	.xword	0x270e7e9113cc3de6
	.xword	0xa2f677322b2a2a38
	.xword	0x52302adeb28379d7
	.xword	0x8a42179873392031
	.xword	0xaff96d180105a4b1
	.xword	0x489abc4fec910d6b
	.xword	0x96d7f84d6574e032
	.xword	0xfb0ef60b1312532d
	.xword	0x256c9a247076602a
	.xword	0x55c7f7f7f1df3ffc
.text
 /********************************
  *      Diag PASSED !           *
  ********************************/
diag_pass:
	ta	T_GOOD_TRAP

.data
	.xword 0x1234567887654321

