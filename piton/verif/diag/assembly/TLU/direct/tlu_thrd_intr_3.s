// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: tlu_thrd_intr_3.s
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
   random seed:	129547119
   Jal tlu_asi_access.j:	
********************************************************************************/


#define PCONTEXT	0x10
#define SCONTEXT	0x10

#define MAIN_PAGE_NUCLEUS_ALSO
#define MAIN_PAGE_HV_ALSO

#define H_HT0_Interrupt_0x60
#define My_HT0_Interrupt_0x60 \
	ldxa	[%g0] 0x72, %g2; \
	ldxa	[%g0] 0x74, %g2; \
	retry; \
	nop; \
	nop; \
	nop; \
	nop; \
	nop

#define H_T0_Interrupt_0x60
#define My_T0_Interrupt_0x60 \
	ldxa	[%g0] 0x72, %g2; \
	ldxa	[%g0] 0x74, %g2; \
	retry; \
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
	save
	setx 0x40ad1d2dd5f04c27, %g1, %r16
	setx 0xd98e61498d07ac26, %g1, %r17
	setx 0xd74169be27b7e3ba, %g1, %r18
	setx 0x53605fd482ac355d, %g1, %r19
	setx 0xa9d17017fec4f8a2, %g1, %r20
	setx 0x457bf02138ec59d7, %g1, %r21
	setx 0x8763a6dc43015870, %g1, %r22
	setx 0x096e15f4229f0496, %g1, %r23
	setx 0x41a0a34b9774d388, %g1, %r24
	setx 0x0b1361328ceb78b6, %g1, %r25
	setx 0x25f515d2adf0950d, %g1, %r26
	setx 0xa6dc1db9c8126187, %g1, %r27
	setx 0x7705d76a8ba3630f, %g1, %r28
	setx 0xf286d9c2e04a2f1f, %g1, %r29
	setx 0x4707bc23abcd46ed, %g1, %r30
	setx 0xb8c15cf46516076d, %g1, %r31
	save
	setx 0x04ed5c17034ce3cb, %g1, %r16
	setx 0xad95c16a20aa0ddd, %g1, %r17
	setx 0x86f70bf62cf7a49a, %g1, %r18
	setx 0x697e1bb03c821314, %g1, %r19
	setx 0xda0a0b7a0445989a, %g1, %r20
	setx 0xa293e34d9a8a8590, %g1, %r21
	setx 0x4d59fc6a5aa514cd, %g1, %r22
	setx 0x9724f70d90667319, %g1, %r23
	setx 0xf0ec0b6d46be968f, %g1, %r24
	setx 0xf53924d7c14492d0, %g1, %r25
	setx 0x9dcdbcfaebb9c2bf, %g1, %r26
	setx 0x904ff1dba7c017ac, %g1, %r27
	setx 0x33f0d673e83526ae, %g1, %r28
	setx 0x49b1fc308334a102, %g1, %r29
	setx 0x43efdb75f13b5cbc, %g1, %r30
	setx 0x8b61dba1476648db, %g1, %r31
	restore
	setx	data_start, %r1, %r16
	mov	63, %r18
	mov	0x0, %r22
	th_fork(main_th)

main_th_0:
main_th_1:
main_th_2:
main_th_3:
	stxa	%r22, [%g0] 0x72
	stxa	%r22, [%g0] 0x73
	stxa	%r22, [%g0] 0x74
	ldxa	[%g0] 0x72, %r20
	ldxa	[%g0] 0x73, %r20
	ldxa	[%g0] 0x74, %r20
	nop
	ta	T_CHANGE_PRIV	! macro
	nop
	stxa	%r22, [%g0] 0x72
	stxa	%r22, [%g0] 0x73
	stxa	%r22, [%g0] 0x74
	ldxa	[%g0] 0x72, %r20
	ldxa	[%g0] 0x73, %r20
	ldxa	[%g0] 0x74, %r22
	nop
	nop
	nop
	nop
	ta	T_CHANGE_HPRIV	! macro
	nop
	ldxa	[%g0] 0x72, %r20
	ldxa	[%g0] 0x73, %r20
	stxa	%r22, [%g0] 0x73
	nop
	nop
	nop
	nop
	stb	%r18, [%r16]
	nop
	nop
	nop
	ldxa	[%g0] 0x72, %r20
	nop
	ldxa	[%g0] 0x74, %r22
	stxa	%r22, [%g0] 0x74
	nop
	nop
	nop
	nop
	stb	%r18, [%r16]
	nop
	nop
	nop
	rdpr	%pstate, %g2
	wrpr	%g2, 0x2, %pstate
	stxa	%r22, [%g0] 0x73	!INTR_VEC 0
	add	%r22, 1, %r22
	nop
	nop
	nop
	nop
	stxa	%r22, [%g0] 0x73	!INTR_VEC 1
	add	%r22, 1, %r22
	nop
	nop
	nop
	nop
	stxa	%r22, [%g0] 0x73	!INTR_VEC 2
	add	%r22, 1, %r22
	nop
	nop
	nop
	nop
	stxa	%r22, [%g0] 0x73	!INTR_VEC 3
	add	%r22, 1, %r22
	nop
	nop
	nop
	nop
	stxa	%r22, [%g0] 0x73	!INTR_VEC 4
	add	%r22, 1, %r22
	nop
	nop
	nop
	nop
	stxa	%r22, [%g0] 0x73	!INTR_VEC 5
	add	%r22, 1, %r22
	nop
	nop
	nop
	nop
	stxa	%r22, [%g0] 0x73	!INTR_VEC 6
	add	%r22, 1, %r22
	nop
	nop
	nop
	nop
	stxa	%r22, [%g0] 0x73	!INTR_VEC 7
	add	%r22, 1, %r22
	nop
	nop
	nop
	nop
	stxa	%r22, [%g0] 0x73	!INTR_VEC 8
	add	%r22, 1, %r22
	nop
	nop
	nop
	nop
	stxa	%r22, [%g0] 0x73	!INTR_VEC 9
	add	%r22, 1, %r22
	nop
	nop
	nop
	nop
	stxa	%r22, [%g0] 0x73	!INTR_VEC 10
	add	%r22, 1, %r22
	nop
	nop
	nop
	nop
	stxa	%r22, [%g0] 0x73	!INTR_VEC 11
	add	%r22, 1, %r22
	nop
	nop
	nop
	nop
	stxa	%r22, [%g0] 0x73	!INTR_VEC 12
	add	%r22, 1, %r22
	nop
	nop
	nop
	nop
	stxa	%r22, [%g0] 0x73	!INTR_VEC 13
	add	%r22, 1, %r22
	nop
	nop
	nop
	nop
	stxa	%r22, [%g0] 0x73	!INTR_VEC 14
	add	%r22, 1, %r22
	nop
	nop
	nop
	nop
	stxa	%r22, [%g0] 0x73	!INTR_VEC 15
	add	%r22, 1, %r22
	nop
	nop
	nop
	nop
	stxa	%r22, [%g0] 0x73	!INTR_VEC 16
	add	%r22, 1, %r22
	nop
	nop
	nop
	nop
	stxa	%r22, [%g0] 0x73	!INTR_VEC 17
	add	%r22, 1, %r22
	nop
	nop
	nop
	nop
	stxa	%r22, [%g0] 0x73	!INTR_VEC 18
	add	%r22, 1, %r22
	nop
	nop
	nop
	nop
	stxa	%r22, [%g0] 0x73	!INTR_VEC 19
	add	%r22, 1, %r22
	nop
	nop
	nop
	nop
	stxa	%r22, [%g0] 0x73	!INTR_VEC 20
	add	%r22, 1, %r22
	nop
	nop
	nop
	nop
	stxa	%r22, [%g0] 0x73	!INTR_VEC 21
	add	%r22, 1, %r22
	nop
	nop
	nop
	nop
	stxa	%r22, [%g0] 0x73	!INTR_VEC 22
	add	%r22, 1, %r22
	nop
	nop
	nop
	nop
	stxa	%r22, [%g0] 0x73	!INTR_VEC 23
	add	%r22, 1, %r22
	nop
	nop
	nop
	nop
	stxa	%r22, [%g0] 0x73	!INTR_VEC 24
	add	%r22, 1, %r22
	nop
	nop
	nop
	nop
	stxa	%r22, [%g0] 0x73	!INTR_VEC 25
	add	%r22, 1, %r22
	nop
	nop
	nop
	nop
	stxa	%r22, [%g0] 0x73	!INTR_VEC 26
	add	%r22, 1, %r22
	nop
	nop
	nop
	nop
	stxa	%r22, [%g0] 0x73	!INTR_VEC 27
	add	%r22, 1, %r22
	nop
	nop
	nop
	nop
	stxa	%r22, [%g0] 0x73	!INTR_VEC 28
	add	%r22, 1, %r22
	nop
	nop
	nop
	nop
	stxa	%r22, [%g0] 0x73	!INTR_VEC 29
	add	%r22, 1, %r22
	nop
	nop
	nop
	nop
	stxa	%r22, [%g0] 0x73	!INTR_VEC 30
	add	%r22, 1, %r22
	nop
	nop
	nop
	nop
	stxa	%r22, [%g0] 0x73	!INTR_VEC 31
	add	%r22, 1, %r22
	nop
	nop
	nop
	nop
	stxa	%r22, [%g0] 0x73	!INTR_VEC 32
	add	%r22, 1, %r22
	nop
	nop
	nop
	nop
	stxa	%r22, [%g0] 0x73	!INTR_VEC 33
	add	%r22, 1, %r22
	nop
	nop
	nop
	nop
	stxa	%r22, [%g0] 0x73	!INTR_VEC 34
	add	%r22, 1, %r22
	nop
	nop
	nop
	nop
	stxa	%r22, [%g0] 0x73	!INTR_VEC 35
	add	%r22, 1, %r22
	nop
	nop
	nop
	nop
	stxa	%r22, [%g0] 0x73	!INTR_VEC 36
	add	%r22, 1, %r22
	nop
	nop
	nop
	nop
	stxa	%r22, [%g0] 0x73	!INTR_VEC 37
	add	%r22, 1, %r22
	nop
	nop
	nop
	nop
	stxa	%r22, [%g0] 0x73	!INTR_VEC 38
	add	%r22, 1, %r22
	nop
	nop
	nop
	nop
	stxa	%r22, [%g0] 0x73	!INTR_VEC 39
	add	%r22, 1, %r22
	nop
	nop
	nop
	nop
	stxa	%r22, [%g0] 0x73	!INTR_VEC 40
	add	%r22, 1, %r22
	nop
	nop
	nop
	nop
	stxa	%r22, [%g0] 0x73	!INTR_VEC 41
	add	%r22, 1, %r22
	nop
	nop
	nop
	nop
	stxa	%r22, [%g0] 0x73	!INTR_VEC 42
	add	%r22, 1, %r22
	nop
	nop
	nop
	nop
	stxa	%r22, [%g0] 0x73	!INTR_VEC 43
	add	%r22, 1, %r22
	nop
	nop
	nop
	nop
	stxa	%r22, [%g0] 0x73	!INTR_VEC 44
	add	%r22, 1, %r22
	nop
	nop
	nop
	nop
	stxa	%r22, [%g0] 0x73	!INTR_VEC 45
	add	%r22, 1, %r22
	nop
	nop
	nop
	nop
	stxa	%r22, [%g0] 0x73	!INTR_VEC 46
	add	%r22, 1, %r22
	nop
	nop
	nop
	nop
	stxa	%r22, [%g0] 0x73	!INTR_VEC 47
	add	%r22, 1, %r22
	nop
	nop
	nop
	nop
	stxa	%r22, [%g0] 0x73	!INTR_VEC 48
	add	%r22, 1, %r22
	nop
	nop
	nop
	nop
	stxa	%r22, [%g0] 0x73	!INTR_VEC 49
	add	%r22, 1, %r22
	nop
	nop
	nop
	nop
	stxa	%r22, [%g0] 0x73	!INTR_VEC 50
	add	%r22, 1, %r22
	nop
	nop
	nop
	nop
	stxa	%r22, [%g0] 0x73	!INTR_VEC 51
	add	%r22, 1, %r22
	nop
	nop
	nop
	nop
	stxa	%r22, [%g0] 0x73	!INTR_VEC 52
	add	%r22, 1, %r22
	nop
	nop
	nop
	nop
	stxa	%r22, [%g0] 0x73	!INTR_VEC 53
	add	%r22, 1, %r22
	nop
	nop
	nop
	nop
	stxa	%r22, [%g0] 0x73	!INTR_VEC 54
	add	%r22, 1, %r22
	nop
	nop
	nop
	nop
	stxa	%r22, [%g0] 0x73	!INTR_VEC 55
	add	%r22, 1, %r22
	nop
	nop
	nop
	nop
	stxa	%r22, [%g0] 0x73	!INTR_VEC 56
	add	%r22, 1, %r22
	nop
	nop
	nop
	nop
	stxa	%r22, [%g0] 0x73	!INTR_VEC 57
	add	%r22, 1, %r22
	nop
	nop
	nop
	nop
	stxa	%r22, [%g0] 0x73	!INTR_VEC 58
	add	%r22, 1, %r22
	nop
	nop
	nop
	nop
	stxa	%r22, [%g0] 0x73	!INTR_VEC 59
	add	%r22, 1, %r22
	nop
	nop
	nop
	nop
	stxa	%r22, [%g0] 0x73	!INTR_VEC 60
	add	%r22, 1, %r22
	nop
	nop
	nop
	nop
	stxa	%r22, [%g0] 0x73	!INTR_VEC 61
	add	%r22, 1, %r22
	nop
	nop
	nop
	nop
	stxa	%r22, [%g0] 0x73	!INTR_VEC 62
	add	%r22, 1, %r22
	nop
	nop
	nop
	nop
	stxa	%r22, [%g0] 0x73	!INTR_VEC 63
	add	%r22, 1, %r22
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	ldxa	[%g0] 0x74, %r20	!INTR_VEC 63
	nop
	nop
	nop
	nop
	ldxa	[%g0] 0x74, %r20	!INTR_VEC 62
	nop
	nop
	nop
	nop
	ldxa	[%g0] 0x74, %r20	!INTR_VEC 61
	nop
	nop
	nop
	nop
	ldxa	[%g0] 0x74, %r20	!INTR_VEC 60
	nop
	nop
	nop
	nop
	ldxa	[%g0] 0x74, %r20	!INTR_VEC 59
	nop
	nop
	nop
	nop
	ldxa	[%g0] 0x74, %r20	!INTR_VEC 58
	nop
	nop
	nop
	nop
	ldxa	[%g0] 0x74, %r20	!INTR_VEC 57
	nop
	nop
	nop
	nop
	ldxa	[%g0] 0x74, %r20	!INTR_VEC 56
	nop
	nop
	nop
	nop
	ldxa	[%g0] 0x74, %r20	!INTR_VEC 55
	nop
	nop
	nop
	nop
	ldxa	[%g0] 0x74, %r20	!INTR_VEC 54
	nop
	nop
	nop
	nop
	ldxa	[%g0] 0x74, %r20	!INTR_VEC 53
	nop
	nop
	nop
	nop
	ldxa	[%g0] 0x74, %r20	!INTR_VEC 52
	nop
	nop
	nop
	nop
	ldxa	[%g0] 0x74, %r20	!INTR_VEC 51
	nop
	nop
	nop
	nop
	ldxa	[%g0] 0x74, %r20	!INTR_VEC 50
	nop
	nop
	nop
	nop
	ldxa	[%g0] 0x74, %r20	!INTR_VEC 49
	nop
	nop
	nop
	nop
	ldxa	[%g0] 0x74, %r20	!INTR_VEC 48
	nop
	nop
	nop
	nop
	ldxa	[%g0] 0x74, %r20	!INTR_VEC 47
	nop
	nop
	nop
	nop
	ldxa	[%g0] 0x74, %r20	!INTR_VEC 46
	nop
	nop
	nop
	nop
	ldxa	[%g0] 0x74, %r20	!INTR_VEC 45
	nop
	nop
	nop
	nop
	ldxa	[%g0] 0x74, %r20	!INTR_VEC 44
	nop
	nop
	nop
	nop
	ldxa	[%g0] 0x74, %r20	!INTR_VEC 43
	nop
	nop
	nop
	nop
	ldxa	[%g0] 0x74, %r20	!INTR_VEC 42
	nop
	nop
	nop
	nop
	ldxa	[%g0] 0x74, %r20	!INTR_VEC 41
	nop
	nop
	nop
	nop
	ldxa	[%g0] 0x74, %r20	!INTR_VEC 40
	nop
	nop
	nop
	nop
	ldxa	[%g0] 0x74, %r20	!INTR_VEC 39
	nop
	nop
	nop
	nop
	ldxa	[%g0] 0x74, %r20	!INTR_VEC 38
	nop
	nop
	nop
	nop
	ldxa	[%g0] 0x74, %r20	!INTR_VEC 37
	nop
	nop
	nop
	nop
	ldxa	[%g0] 0x74, %r20	!INTR_VEC 36
	nop
	nop
	nop
	nop
	ldxa	[%g0] 0x74, %r20	!INTR_VEC 35
	nop
	nop
	nop
	nop
	ldxa	[%g0] 0x74, %r20	!INTR_VEC 34
	nop
	nop
	nop
	nop
	ldxa	[%g0] 0x74, %r20	!INTR_VEC 33
	nop
	nop
	nop
	nop
	ldxa	[%g0] 0x74, %r20	!INTR_VEC 32
	nop
	nop
	nop
	nop
	ldxa	[%g0] 0x74, %r20	!INTR_VEC 31
	nop
	nop
	nop
	nop
	ldxa	[%g0] 0x74, %r20	!INTR_VEC 30
	nop
	nop
	nop
	nop
	ldxa	[%g0] 0x74, %r20	!INTR_VEC 29
	nop
	nop
	nop
	nop
	ldxa	[%g0] 0x74, %r20	!INTR_VEC 28
	nop
	nop
	nop
	nop
	ldxa	[%g0] 0x74, %r20	!INTR_VEC 27
	nop
	nop
	nop
	nop
	ldxa	[%g0] 0x74, %r20	!INTR_VEC 26
	nop
	nop
	nop
	nop
	ldxa	[%g0] 0x74, %r20	!INTR_VEC 25
	nop
	nop
	nop
	nop
	ldxa	[%g0] 0x74, %r20	!INTR_VEC 24
	nop
	nop
	nop
	nop
	ldxa	[%g0] 0x74, %r20	!INTR_VEC 23
	nop
	nop
	nop
	nop
	ldxa	[%g0] 0x74, %r20	!INTR_VEC 22
	nop
	nop
	nop
	nop
	ldxa	[%g0] 0x74, %r20	!INTR_VEC 21
	nop
	nop
	nop
	nop
	ldxa	[%g0] 0x74, %r20	!INTR_VEC 20
	nop
	nop
	nop
	nop
	ldxa	[%g0] 0x74, %r20	!INTR_VEC 19
	nop
	nop
	nop
	nop
	ldxa	[%g0] 0x74, %r20	!INTR_VEC 18
	nop
	nop
	nop
	nop
	ldxa	[%g0] 0x74, %r20	!INTR_VEC 17
	nop
	nop
	nop
	nop
	ldxa	[%g0] 0x74, %r20	!INTR_VEC 16
	nop
	nop
	nop
	nop
	ldxa	[%g0] 0x74, %r20	!INTR_VEC 15
	nop
	nop
	nop
	nop
	ldxa	[%g0] 0x74, %r20	!INTR_VEC 14
	nop
	nop
	nop
	nop
	ldxa	[%g0] 0x74, %r20	!INTR_VEC 13
	nop
	nop
	nop
	nop
	ldxa	[%g0] 0x74, %r20	!INTR_VEC 12
	nop
	nop
	nop
	nop
	ldxa	[%g0] 0x74, %r20	!INTR_VEC 11
	nop
	nop
	nop
	nop
	ldxa	[%g0] 0x74, %r20	!INTR_VEC 10
	nop
	nop
	nop
	nop
	ldxa	[%g0] 0x74, %r20	!INTR_VEC 9
	nop
	nop
	nop
	nop
	ldxa	[%g0] 0x74, %r20	!INTR_VEC 8
	nop
	nop
	nop
	nop
	ldxa	[%g0] 0x74, %r20	!INTR_VEC 7
	nop
	nop
	nop
	nop
	ldxa	[%g0] 0x74, %r20	!INTR_VEC 6
	nop
	nop
	nop
	nop
	ldxa	[%g0] 0x74, %r20	!INTR_VEC 5
	nop
	nop
	nop
	nop
	ldxa	[%g0] 0x74, %r20	!INTR_VEC 4
	nop
	nop
	nop
	nop
	ldxa	[%g0] 0x74, %r20	!INTR_VEC 3
	nop
	nop
	nop
	nop
	ldxa	[%g0] 0x74, %r20	!INTR_VEC 2
	nop
	nop
	nop
	nop
	ldxa	[%g0] 0x74, %r20	!INTR_VEC 1
	nop
	nop
	nop
	nop
	ldxa	[%g0] 0x74, %r20	!INTR_VEC 0
	nop
	nop
	nop
	nop
	stxa	%r22, [%g0] 0x73	!INTR_VEC 0
	add	%r22, 1, %r22
	nop
	nop
	nop
	nop
	stxa	%r22, [%g0] 0x73	!INTR_VEC 1
	add	%r22, 1, %r22
	nop
	nop
	nop
	nop
	stxa	%r22, [%g0] 0x73	!INTR_VEC 2
	add	%r22, 1, %r22
	nop
	nop
	nop
	nop
	stxa	%r22, [%g0] 0x73	!INTR_VEC 3
	add	%r22, 1, %r22
	nop
	nop
	nop
	nop
	stxa	%r22, [%g0] 0x73	!INTR_VEC 4
	add	%r22, 1, %r22
	nop
	nop
	nop
	nop
	stxa	%r22, [%g0] 0x73	!INTR_VEC 5
	add	%r22, 1, %r22
	nop
	nop
	nop
	nop
	stxa	%r22, [%g0] 0x73	!INTR_VEC 6
	add	%r22, 1, %r22
	nop
	nop
	nop
	nop
	stxa	%r22, [%g0] 0x73	!INTR_VEC 7
	add	%r22, 1, %r22
	nop
	nop
	nop
	nop
	stxa	%r22, [%g0] 0x73	!INTR_VEC 8
	add	%r22, 1, %r22
	nop
	nop
	nop
	nop
	stxa	%r22, [%g0] 0x73	!INTR_VEC 9
	add	%r22, 1, %r22
	nop
	nop
	nop
	nop
	stxa	%r22, [%g0] 0x73	!INTR_VEC 10
	add	%r22, 1, %r22
	nop
	nop
	nop
	nop
	stxa	%r22, [%g0] 0x73	!INTR_VEC 11
	add	%r22, 1, %r22
	nop
	nop
	nop
	nop
	stxa	%r22, [%g0] 0x73	!INTR_VEC 12
	add	%r22, 1, %r22
	nop
	nop
	nop
	nop
	stxa	%r22, [%g0] 0x73	!INTR_VEC 13
	add	%r22, 1, %r22
	nop
	nop
	nop
	nop
	stxa	%r22, [%g0] 0x73	!INTR_VEC 14
	add	%r22, 1, %r22
	nop
	nop
	nop
	nop
	stxa	%r22, [%g0] 0x73	!INTR_VEC 15
	add	%r22, 1, %r22
	nop
	nop
	nop
	nop
	stxa	%r22, [%g0] 0x73	!INTR_VEC 16
	add	%r22, 1, %r22
	nop
	nop
	nop
	nop
	stxa	%r22, [%g0] 0x73	!INTR_VEC 17
	add	%r22, 1, %r22
	nop
	nop
	nop
	nop
	stxa	%r22, [%g0] 0x73	!INTR_VEC 18
	add	%r22, 1, %r22
	nop
	nop
	nop
	nop
	stxa	%r22, [%g0] 0x73	!INTR_VEC 19
	add	%r22, 1, %r22
	nop
	nop
	nop
	nop
	stxa	%r22, [%g0] 0x73	!INTR_VEC 20
	add	%r22, 1, %r22
	nop
	nop
	nop
	nop
	stxa	%r22, [%g0] 0x73	!INTR_VEC 21
	add	%r22, 1, %r22
	nop
	nop
	nop
	nop
	stxa	%r22, [%g0] 0x73	!INTR_VEC 22
	add	%r22, 1, %r22
	nop
	nop
	nop
	nop
	stxa	%r22, [%g0] 0x73	!INTR_VEC 23
	add	%r22, 1, %r22
	nop
	nop
	nop
	nop
	stxa	%r22, [%g0] 0x73	!INTR_VEC 24
	add	%r22, 1, %r22
	nop
	nop
	nop
	nop
	stxa	%r22, [%g0] 0x73	!INTR_VEC 25
	add	%r22, 1, %r22
	nop
	nop
	nop
	nop
	stxa	%r22, [%g0] 0x73	!INTR_VEC 26
	add	%r22, 1, %r22
	nop
	nop
	nop
	nop
	stxa	%r22, [%g0] 0x73	!INTR_VEC 27
	add	%r22, 1, %r22
	nop
	nop
	nop
	nop
	stxa	%r22, [%g0] 0x73	!INTR_VEC 28
	add	%r22, 1, %r22
	nop
	nop
	nop
	nop
	stxa	%r22, [%g0] 0x73	!INTR_VEC 29
	add	%r22, 1, %r22
	nop
	nop
	nop
	nop
	stxa	%r22, [%g0] 0x73	!INTR_VEC 30
	add	%r22, 1, %r22
	nop
	nop
	nop
	nop
	stxa	%r22, [%g0] 0x73	!INTR_VEC 31
	add	%r22, 1, %r22
	nop
	nop
	nop
	nop
	stxa	%r22, [%g0] 0x73	!INTR_VEC 32
	add	%r22, 1, %r22
	nop
	nop
	nop
	nop
	stxa	%r22, [%g0] 0x73	!INTR_VEC 33
	add	%r22, 1, %r22
	nop
	nop
	nop
	nop
	stxa	%r22, [%g0] 0x73	!INTR_VEC 34
	add	%r22, 1, %r22
	nop
	nop
	nop
	nop
	stxa	%r22, [%g0] 0x73	!INTR_VEC 35
	add	%r22, 1, %r22
	nop
	nop
	nop
	nop
	stxa	%r22, [%g0] 0x73	!INTR_VEC 36
	add	%r22, 1, %r22
	nop
	nop
	nop
	nop
	stxa	%r22, [%g0] 0x73	!INTR_VEC 37
	add	%r22, 1, %r22
	nop
	nop
	nop
	nop
	stxa	%r22, [%g0] 0x73	!INTR_VEC 38
	add	%r22, 1, %r22
	nop
	nop
	nop
	nop
	stxa	%r22, [%g0] 0x73	!INTR_VEC 39
	add	%r22, 1, %r22
	nop
	nop
	nop
	nop
	stxa	%r22, [%g0] 0x73	!INTR_VEC 40
	add	%r22, 1, %r22
	nop
	nop
	nop
	nop
	stxa	%r22, [%g0] 0x73	!INTR_VEC 41
	add	%r22, 1, %r22
	nop
	nop
	nop
	nop
	stxa	%r22, [%g0] 0x73	!INTR_VEC 42
	add	%r22, 1, %r22
	nop
	nop
	nop
	nop
	stxa	%r22, [%g0] 0x73	!INTR_VEC 43
	add	%r22, 1, %r22
	nop
	nop
	nop
	nop
	stxa	%r22, [%g0] 0x73	!INTR_VEC 44
	add	%r22, 1, %r22
	nop
	nop
	nop
	nop
	stxa	%r22, [%g0] 0x73	!INTR_VEC 45
	add	%r22, 1, %r22
	nop
	nop
	nop
	nop
	stxa	%r22, [%g0] 0x73	!INTR_VEC 46
	add	%r22, 1, %r22
	nop
	nop
	nop
	nop
	stxa	%r22, [%g0] 0x73	!INTR_VEC 47
	add	%r22, 1, %r22
	nop
	nop
	nop
	nop
	stxa	%r22, [%g0] 0x73	!INTR_VEC 48
	add	%r22, 1, %r22
	nop
	nop
	nop
	nop
	stxa	%r22, [%g0] 0x73	!INTR_VEC 49
	add	%r22, 1, %r22
	nop
	nop
	nop
	nop
	stxa	%r22, [%g0] 0x73	!INTR_VEC 50
	add	%r22, 1, %r22
	nop
	nop
	nop
	nop
	stxa	%r22, [%g0] 0x73	!INTR_VEC 51
	add	%r22, 1, %r22
	nop
	nop
	nop
	nop
	stxa	%r22, [%g0] 0x73	!INTR_VEC 52
	add	%r22, 1, %r22
	nop
	nop
	nop
	nop
	stxa	%r22, [%g0] 0x73	!INTR_VEC 53
	add	%r22, 1, %r22
	nop
	nop
	nop
	nop
	stxa	%r22, [%g0] 0x73	!INTR_VEC 54
	add	%r22, 1, %r22
	nop
	nop
	nop
	nop
	stxa	%r22, [%g0] 0x73	!INTR_VEC 55
	add	%r22, 1, %r22
	nop
	nop
	nop
	nop
	stxa	%r22, [%g0] 0x73	!INTR_VEC 56
	add	%r22, 1, %r22
	nop
	nop
	nop
	nop
	stxa	%r22, [%g0] 0x73	!INTR_VEC 57
	add	%r22, 1, %r22
	nop
	nop
	nop
	nop
	stxa	%r22, [%g0] 0x73	!INTR_VEC 58
	add	%r22, 1, %r22
	nop
	nop
	nop
	nop
	stxa	%r22, [%g0] 0x73	!INTR_VEC 59
	add	%r22, 1, %r22
	nop
	nop
	nop
	nop
	stxa	%r22, [%g0] 0x73	!INTR_VEC 60
	add	%r22, 1, %r22
	nop
	nop
	nop
	nop
	stxa	%r22, [%g0] 0x73	!INTR_VEC 61
	add	%r22, 1, %r22
	nop
	nop
	nop
	nop
	stxa	%r22, [%g0] 0x73	!INTR_VEC 62
	add	%r22, 1, %r22
	nop
	nop
	nop
	nop
	stxa	%r22, [%g0] 0x73	!INTR_VEC 63
	add	%r22, 1, %r22
	nop
	nop
	nop
	nop
	stxa	%r22, [%g0] 0x73	!INTR_VEC 63
	add	%r22, 1, %r22
	nop
	nop
	nop
	nop
	rdpr	%pstate, %g2
	wrpr	%g2, 0x2, %pstate
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
	ta	T_GOOD_TRAP

.data
	.xword 0x1234567887654321

