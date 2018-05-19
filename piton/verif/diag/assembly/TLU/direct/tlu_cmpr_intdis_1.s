// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: tlu_cmpr_intdis_1.s
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

#define PCONTEXT	0x10
#define SCONTEXT	0x10

#define MAIN_PAGE_NUCLEUS_ALSO
#define MAIN_PAGE_HV_ALSO

#define H_T0_Reserved_0x5e
#define My_T0_Reserved_0x5e \
	rdhpr	%hintp, %g1; \
	wrhpr	%g1, %g1, %hintp; \
	done; \
	nop; \
	nop; \
	nop; \
	nop; \
	nop

#define H_HT0_Reserved_0x5e
#define My_HT0_Reserved_0x5e \
	rdhpr	%hintp, %g1; \
	wrhpr	%g1, %g1, %hintp; \
	done; \
	nop; \
	nop; \
	nop; \
	nop; \
	nop

#define H_T0_Interrupt_Level_14_0x4e
#define My_T0_Interrupt_Level_14_0x4e \
	rd	%softint, %g1; \
	wr	%g1, %g1, %softint; \
	done; \
	nop; \
	nop; \
	nop; \
	nop; \
	nop

#include "enable_traps.h"
#include "boot.s"

.text
.global main

main:

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
	mov	0x1, %r22
	th_fork(main_th)

main_th_0:
main_th_1:
main_th_2:
main_th_3:
	ta	T_CHANGE_HPRIV	! macro
	setx	0x4000000000000000, %g1, %g1
	wrpr	%g0, %pil
	wrpr	%g1, %tick
	wr	%g1, 0x2a0, %tick_cmpr
	wr	%g1, 0x2a0, %sys_tick_cmpr
	wrhpr	%g1, 0x2a0, %hsys_tick_cmpr
	ta	T_CHANGE_NONHPRIV	! macro
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.data
data_start:

	.xword	0x0000000000000000
	.xword	0x1111111111111111
	.xword	0x2222222222222222
	.xword	0x3333333333333333
	.xword	0x4444444444444444
	.xword	0x5555555555555555
	.xword	0x6666666666666666
	.xword	0x7777777777777777
	.xword	0x7777777777777777
	.xword	0x6666666666666666
	.xword	0x5555555555555555
	.xword	0x4444444444444444
	.xword	0x3333333333333333
	.xword	0x2222222222222222
	.xword	0x1111111111111111
	.xword	0x0000000000000000
.text
 /********************************
  *      Diag PASSED !           *
  ********************************/
diag_pass:
	ta	T_GOOD_TRAP

.data
	.xword 0x1234567887654321

