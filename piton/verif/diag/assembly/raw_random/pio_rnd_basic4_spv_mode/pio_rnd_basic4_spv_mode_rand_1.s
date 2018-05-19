// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: pio_rnd_basic4_spv_mode_rand_1.s
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
   random seed:	413855648
   Jal pio_rnd_basic4_spv_mode.j:	
********************************************************************************/



#define JBI_CONFIG
#define ASI_SWVR_INTR_RECEIVE		0x72
#define ASI_SWVR_UDB_INTR_W		0x73
#define ASI_SWVR_UDB_INTR_R		0x74

#define H_T0_Trap_Instruction_0	
#define My_T0_Trap_Instruction_0	\
	ta	0x90;			\
	done;

#define H_HT0_HTrap_Instruction_0 intr0x190_custom_trap
#define H_HT0_Interrupt_0x60      intr0x60_custom_trap

#define H_HT0_Data_Access_Exception_0x30 My_0x30_trap

#include "enable_traps.h"
#include "boot.s"

.text
.global main

main:

th_fork(th_main, %l0)

th_main_0:
	ta	0x30

normal_end:
        ta      T_GOOD_TRAP

bad_end:
        ta      T_BAD_TRAP

user_text_end:

!***********************************************************************
!  Test case data start
!***********************************************************************

SECTION .MY_HYP_SEC TEXT_VA = 0x1100000000, DATA_VA = 0x1100160000
attr_text {
        Name=.MY_HYP_SEC,
        hypervisor
	}

.global intr0x60_custom_trap
intr0x60_custom_trap:
	ldxa	[%g0] ASI_SWVR_INTR_RECEIVE, %g2;
	ldxa	[%g0] ASI_SWVR_UDB_INTR_R, %g1;	
	retry;

.global intr0x190_custom_trap
intr0x190_custom_trap:

!!***********************************************************************
!!IOSYNC cycles to start sjm
!!***********************************************************************
!
!setx 0xdeadbeefdeadbeef, %g1, %g2
!setx 0xcf00beef00, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0xdeadbeefdeadbeef, %g1, %g2
!setx 0xef00beef00, %g1, %g3
!stx %g2, [%g3]
!!=====================

! initalize 
setx    ncdata_base1, %l0, %l2           ! nc data base
setx    0x1000, %l0, %l3                ! nc datawork area
add     %l2, %l3, %g3

setx 0x7766554433221100, %g1, %g2
add 0x0, %g0, %g4
!add 0x0, %g0, %g2
add 0x040, %g0, %g5
!setx 0x800e000000, %g1, %g3
stloop0:
stx %g2, [%g3 + %g4]
inc %g2
add 0x8, %g4, %g4
deccc %g5
bne stloop0
nop

! initalize
setx    user_data_start, %l0, %l2           ! nc data base
setx    0x1000, %l0, %l3                ! nc datawork area
add     %l2, %l3, %g3
add 0x0, %g0, %g4
add 0x040, %g0, %g5
dstloop6:
stx %g2, [%g3 + %g4]
inc %g2
add 0x8, %g4, %g4
deccc %g5
bne dstloop6
nop

! initalize 
setx    ncdata_base0, %l0, %l2           ! nc data base
setx    0x1000, %l0, %l3                ! nc datawork area
add     %l2, %l3, %g3

add 0x0, %g0, %g4
!add 0x1, %g0, %g2
add 0x040, %g0, %g5
! FAKE DMA space
!setx 0x8010000000, %g1, %g3
stloop1:
stx %g2, [%g3 + %g4]
inc %g2
add 0x8, %g4, %g4
deccc %g5
bne stloop1
nop

! initalize
setx    ncdata_base2, %l0, %l2           ! nc data base
setx    0x1000, %l0, %l3                ! nc datawork area
add     %l2, %l3, %g3
add 0x0, %g0, %g4
!add 0x1, %g2, %g2
add 0x040, %g0, %g5
!setx 0x800f000000, %g1, %g3
stloop2:
stx %g2, [%g3 + %g4]
inc %g2
add 0x8, %g4, %g4
deccc %g5
bne stloop2
nop

! initalize
setx    ncdata_base3, %l0, %l2           ! nc data base
setx    0x1000, %l0, %l3                ! nc datawork area
add     %l2, %l3, %g3
add 0x0, %g0, %g4
!add 0x1, %g2, %g2
add 0x040, %g0, %g5
!setx 0xc000000000, %g1, %g3
stloop3:
stx %g2, [%g3 + %g4]
inc %g2
add 0x8, %g4, %g4
deccc %g5
bne stloop3
nop

! initalize
setx    ncdata_base4, %l0, %l2           ! nc data base
setx    0x1000, %l0, %l3                ! nc datawork area
add     %l2, %l3, %g3
add 0x0, %g0, %g4
!add 0x1, %g2, %g2
add 0x040, %g0, %g5
!setx 0xd000000000, %g1, %g3
stloop4:
stx %g2, [%g3 + %g4]
inc %g2
add 0x8, %g4, %g4
deccc %g5
bne stloop4
nop

! initalize
setx    ncdata_base5, %l0, %l2           ! nc data base
setx    0x1000, %l0, %l3                ! nc datawork area
add     %l2, %l3, %g3
add 0x0, %g0, %g4
!add 0x1, %g2, %g2
add 0x040, %g0, %g5
!setx 0xe000000000, %g1, %g3
stloop5:
stx %g2, [%g3 + %g4]
inc %g2
add 0x8, %g4, %g4
deccc %g5
bne stloop5
nop

! initalize
setx    ncdata_base6, %l0, %l2           ! nc data base
setx    0x1000, %l0, %l3                ! nc datawork area
add     %l2, %l3, %g3
add 0x0, %g0, %g4
!add 0x1, %g2, %g2
add 0x040, %g0, %g5
!setx 0xf000000000, %g1, %g3
stloop6:
stx %g2, [%g3 + %g4]
inc %g2
add 0x8, %g4, %g4
deccc %g5
bne stloop6
nop
membar 0x40

wr    %g0, 7, %fprs

ldda [%g3]ASI_BLK_P, %f0

!#define MAIN_PAGE_HV_ALSO
!
!#include "enable_traps.h"
!#include "boot.s"
!
!.text
!.global main
!
!main:
!
!  ta    T_CHANGE_HPRIV
!  //ta    T_CHANGE_NONHPRIV

! Register init code

	setx 0xf931ca86736c0102, %g1, %g0
	setx 0x3d834dbc18166e7d, %g1, %g1
	setx 0xcec3278cc4bd0ac1, %g1, %g2
	setx 0xc2263ed0d00fd898, %g1, %g3
	setx 0xbcddf010897d4b6b, %g1, %g4
	setx 0x6cafc5cec26c2977, %g1, %g5
	setx 0x9de942cdd94b51ba, %g1, %g6
	setx 0xc8dada889c60070e, %g1, %g7
	setx 0x7c6e7a0c87023e4a, %g1, %r16
	setx 0x9bdf98709b201e79, %g1, %r17
	setx 0xabeede5109c487ac, %g1, %r18
	setx 0xae1c7d05ee781cbe, %g1, %r19
	setx 0x68fd28d42ecfc07e, %g1, %r20
	setx 0xebe58c63fd93cdb3, %g1, %r21
	setx 0xa6456f25c107797d, %g1, %r22
	setx 0x8de96d71b8ac3ce6, %g1, %r23
	setx 0x74e58801ec47ea9c, %g1, %r24
	setx 0x4cac1c8808f5fbcf, %g1, %r25
	setx 0x67483027a5fe7858, %g1, %r26
	setx 0x9e36cbfac828d386, %g1, %r27
	setx 0xfd0fc43af129910c, %g1, %r28
	setx 0x104de5b241f48929, %g1, %r29
	setx 0x6ac147c8c8ee2650, %g1, %r30
	setx 0x96f0c244360d8963, %g1, %r31
	save
	setx 0x448b52636e3846c8, %g1, %r16
	setx 0x1c89994a2314eaa1, %g1, %r17
	setx 0x149dcac6054e43c7, %g1, %r18
	setx 0x0c619ad2c1cba155, %g1, %r19
	setx 0xf602cb725038643f, %g1, %r20
	setx 0xb6b34ce8c79de98e, %g1, %r21
	setx 0x08b42aed64b68650, %g1, %r22
	setx 0x805a3f623102db9f, %g1, %r23
	setx 0x47055154a0bc6f55, %g1, %r24
	setx 0x1d714e3158f5c735, %g1, %r25
	setx 0x3e44d802b75a6457, %g1, %r26
	setx 0x9b777c73345eff39, %g1, %r27
	setx 0x6193494274506ac7, %g1, %r28
	setx 0x555186efaf4a0f1c, %g1, %r29
	setx 0xad654c17ea03e8f9, %g1, %r30
	setx 0x98d17e0191ea6d0a, %g1, %r31
	save
	setx 0x2a96924b7e3fd5b1, %g1, %r16
	setx 0x18b2fa895b70c2f4, %g1, %r17
	setx 0xc19e16490c93c633, %g1, %r18
	setx 0x9f8bd9e69aa5ce6b, %g1, %r19
	setx 0x12083b75d9329b57, %g1, %r20
	setx 0x3da6e87ec6d5fb1c, %g1, %r21
	setx 0xa8cc5790a59a90fe, %g1, %r22
	setx 0x58897c962a368876, %g1, %r23
	setx 0x161c78e805d365bd, %g1, %r24
	setx 0x89cf7c0bf41a7878, %g1, %r25
	setx 0x11aab65a42dad4a0, %g1, %r26
	setx 0x766151fae2df11f7, %g1, %r27
	setx 0x0cdfacb353a7ad91, %g1, %r28
	setx 0xdcb8ecff3330c6a4, %g1, %r29
	setx 0x9f46562ff0669b32, %g1, %r30
	setx 0x54de81ad24e7be61, %g1, %r31
	restore
	mov	0, %r8
	setx	0x00000000d01ef080, %r1, %r6
	setx	0x00000000d02ef080, %r1, %r7
	setx	0x00000000d03ef000, %r1, %r9
	setx	0x00000000d04ef140, %r1, %r10
	setx	0x00000000d05ef100, %r1, %r11
	setx	0x00000000d06ef000, %r1, %r12
	setx	0x00000000d07ef080, %r1, %r13
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xac8aa020  ! 2: ANDcc_I	andcc 	%r10, 0x0020, %r22
	.word 0xe029e028  ! 3: STB_I	stb	%r16, [%r7 + 0x0028]
	.word 0xec318008  ! 4: STH_R	sth	%r22, [%r6 + %r8]
	.word 0xe872c008  ! 5: STX_R	stx	%r20, [%r11 + %r8]
	.word 0xe029a030  ! 6: STB_I	stb	%r16, [%r6 + 0x0030]
	.word 0xe4432018  ! 7: LDSW_I	ldsw	[%r12 + 0x0018], %r18
	stda	 %f0, [%r9]ASI_BLK_P
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r9]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe831e030  ! 11: STH_I	sth	%r20, [%r7 + 0x0030]
	.word 0xa8b9e010  ! 12: XNORcc_I	xnorcc 	%r7, 0x0010, %r20
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec730008  ! 15: STX_R	stx	%r22, [%r12 + %r8]
	.word 0xac432018  ! 16: ADDC_I	addc 	%r12, 0x0018, %r22
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r9]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xe42a6010  ! 21: STB_I	stb	%r18, [%r9 + 0x0010]
	.word 0xe05b0008  ! 22: LDX_R	ldx	[%r12 + %r8], %r16
	.word 0xe059c008  ! 23: LDX_R	ldx	[%r7 + %r8], %r16
	.word 0xe042e020  ! 24: LDSW_I	ldsw	[%r11 + 0x0020], %r16
	.word 0xe031c008  ! 25: STH_R	sth	%r16, [%r7 + %r8]
	ldda	[%r9]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	setx	0x0000000041218b0f, %r1, %r9
	setx	0x8000000008, %r1, %r10
	stx	%r9, [%r10]



!***********************************************************************
!IOSYNC cycles to start sjm
!***********************************************************************
	setx 0xdeadbeefdeadbeef, %g1, %g2
	setx 0xcf00beef00, %g1, %g3
	stx %g2, [%g3]
!***********************************************************************
!IOSYNC cycles to start sjm
!***********************************************************************
	setx 0xdeadbeefdeadbeef, %g1, %g2
	setx 0xef00beef00, %g1, %g3
	stx %g2, [%g3]



	setx	0x00000000d01ef040, %r1, %r6
	setx	0x00000000d02ef1c0, %r1, %r7
	setx	0x00000000d03ef0c0, %r1, %r9
	setx	0x00000000d04ef100, %r1, %r10
	setx	0x00000000d05ef100, %r1, %r11
	setx	0x00000000d06ef000, %r1, %r12
	setx	0x00000000d07ef180, %r1, %r13
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	.word 0xe0730008  ! 31: STX_R	stx	%r16, [%r12 + %r8]
	setx	0x00000000d01ef100, %r1, %r6
	setx	0x00000000d02ef000, %r1, %r7
	setx	0x00000000d03ef140, %r1, %r9
	setx	0x00000000d04ef100, %r1, %r10
	setx	0x00000000d05ef040, %r1, %r11
	setx	0x00000000d06ef100, %r1, %r12
	setx	0x00000000d07ef0c0, %r1, %r13
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xec4a4008  ! 34: LDSB_R	ldsb	[%r9 + %r8], %r22
	.word 0xe4718008  ! 35: STX_R	stx	%r18, [%r6 + %r8]
	.word 0xe431e028  ! 36: STH_I	sth	%r18, [%r7 + 0x0028]
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe409a020  ! 39: LDUB_I	ldub	[%r6 + 0x0020], %r18
	.word 0xe4326020  ! 40: STH_I	sth	%r18, [%r9 + 0x0020]
	.word 0xe01ac008  ! 41: LDD_R	ldd	[%r11 + %r8], %r16
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	.word 0xe8536030  ! 43: LDSH_I	ldsh	[%r13 + 0x0030], %r20
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe00aa028  ! 45: LDUB_I	ldub	[%r10 + 0x0028], %r16
	.word 0xe031a030  ! 46: STH_I	sth	%r16, [%r6 + 0x0030]
	.word 0xe012e008  ! 47: LDUH_I	lduh	[%r11 + 0x0008], %r16
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xec0ac008  ! 49: LDUB_R	ldub	[%r11 + %r8], %r22
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe43ae038  ! 51: STD_I	std	%r18, [%r11 + 0x0038]
	stda	 %f0, [%r9]ASI_BLK_P
	membar	 0x40
	.word 0xe851a038  ! 53: LDSH_I	ldsh	[%r6 + 0x0038], %r20
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe0598008  ! 57: LDX_R	ldx	[%r6 + %r8], %r16
	.word 0xec3a4008  ! 58: STD_R	std	%r22, [%r9 + %r8]
	.word 0xe871a020  ! 59: STX_I	stx	%r20, [%r6 + 0x0020]
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe0432030  ! 61: LDSW_I	ldsw	[%r12 + 0x0030], %r16
	.word 0xe851c008  ! 62: LDSH_R	ldsh	[%r7 + %r8], %r20
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe8428008  ! 64: LDSW_R	ldsw	[%r10 + %r8], %r20
	.word 0xec018008  ! 65: LDUW_R	lduw	[%r6 + %r8], %r22
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe022e020  ! 67: STW_I	stw	%r16, [%r11 + 0x0020]
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe4234008  ! 69: STW_R	stw	%r18, [%r13 + %r8]
	stda	 %f0, [%r9]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	.word 0xe81aa020  ! 73: LDD_I	ldd	[%r10 + 0x0020], %r20
	.word 0xec71a030  ! 74: STX_I	stx	%r22, [%r6 + 0x0030]
	.word 0xec31a010  ! 75: STH_I	sth	%r22, [%r6 + 0x0010]
	.word 0xe031e018  ! 76: STH_I	sth	%r16, [%r7 + 0x0018]
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	ldda	[%r9]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xe4036008  ! 82: LDUW_I	lduw	[%r13 + 0x0008], %r18
	.word 0xe43ac008  ! 83: STD_R	std	%r18, [%r11 + %r8]
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	.word 0xa0036000  ! 85: ADD_I	add 	%r13, 0x0000, %r16
	.word 0xe8530008  ! 86: LDSH_R	ldsh	[%r12 + %r8], %r20
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xa491a018  ! 88: ORcc_I	orcc 	%r6, 0x0018, %r18
	.word 0xe80b2038  ! 89: LDUB_I	ldub	[%r12 + 0x0038], %r20
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	.word 0xec2ae028  ! 94: STB_I	stb	%r22, [%r11 + 0x0028]
	.word 0xe012c008  ! 95: LDUH_R	lduh	[%r11 + %r8], %r16
	.word 0xe831a028  ! 96: STH_I	sth	%r20, [%r6 + 0x0028]
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe009c008  ! 98: LDUB_R	ldub	[%r7 + %r8], %r16
	.word 0xe009c008  ! 99: LDUB_R	ldub	[%r7 + %r8], %r16
	.word 0xe071a018  ! 100: STX_I	stx	%r16, [%r6 + 0x0018]
	.word 0xe03b2038  ! 101: STD_I	std	%r16, [%r12 + 0x0038]
	.word 0xe831a000  ! 102: STH_I	sth	%r20, [%r6 + 0x0000]
	.word 0xe0430008  ! 103: LDSW_R	ldsw	[%r12 + %r8], %r16
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xe01ae020  ! 109: LDD_I	ldd	[%r11 + 0x0020], %r16
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe011a028  ! 111: LDUH_I	lduh	[%r6 + 0x0028], %r16
	stda	 %f0, [%r9]ASI_BLK_P
	membar	 0x40
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	.word 0xec21a030  ! 117: STW_I	stw	%r22, [%r6 + 0x0030]
	.word 0xec21c008  ! 118: STW_R	stw	%r22, [%r7 + %r8]
	.word 0xe4232030  ! 119: STW_I	stw	%r18, [%r12 + 0x0030]
	.word 0xe8398008  ! 120: STD_R	std	%r20, [%r6 + %r8]
	.word 0xec1b4008  ! 121: LDD_R	ldd	[%r13 + %r8], %r22
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xe0034008  ! 123: LDUW_R	lduw	[%r13 + %r8], %r16
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe829e038  ! 125: STB_I	stb	%r20, [%r7 + 0x0038]
	.word 0xe039e008  ! 126: STD_I	std	%r16, [%r7 + 0x0008]
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec0a8008  ! 128: LDUB_R	ldub	[%r10 + %r8], %r22
	.word 0xe02b4008  ! 129: STB_R	stb	%r16, [%r13 + %r8]
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xe821c008  ! 132: STW_R	stw	%r20, [%r7 + %r8]
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xe0532000  ! 134: LDSH_I	ldsh	[%r12 + 0x0000], %r16
	.word 0xe0234008  ! 135: STW_R	stw	%r16, [%r13 + %r8]
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xec332008  ! 137: STH_I	sth	%r22, [%r12 + 0x0008]
	stda	 %f0, [%r9]ASI_BLK_P
	membar	 0x40
	.word 0xa891a030  ! 139: ORcc_I	orcc 	%r6, 0x0030, %r20
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xec518008  ! 143: LDSH_R	ldsh	[%r6 + %r8], %r22
	.word 0xe83ac008  ! 144: STD_R	std	%r20, [%r11 + %r8]
	.word 0xe44a8008  ! 145: LDSB_R	ldsb	[%r10 + %r8], %r18
	.word 0xe03b4008  ! 146: STD_R	std	%r16, [%r13 + %r8]
	.word 0xe422e000  ! 147: STW_I	stw	%r18, [%r11 + 0x0000]
	.word 0xe021a030  ! 148: STW_I	stw	%r16, [%r6 + 0x0030]
	setx	0x00000000d01ef140, %r1, %r6
	setx	0x00000000d02ef180, %r1, %r7
	setx	0x00000000d03ef040, %r1, %r9
	setx	0x00000000d04ef000, %r1, %r10
	setx	0x00000000d05ef140, %r1, %r11
	setx	0x00000000d06ef000, %r1, %r12
	setx	0x00000000d07ef080, %r1, %r13
	.word 0xe45a6028  ! 150: LDX_I	ldx	[%r9 + 0x0028], %r18
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r9]ASI_BLK_P
	membar	 0x40
	.word 0xe009a000  ! 154: LDUB_I	ldub	[%r6 + 0x0000], %r16
	ldda	[%r9]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe41b6008  ! 157: LDD_I	ldd	[%r13 + 0x0008], %r18
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe8226030  ! 159: STW_I	stw	%r20, [%r9 + 0x0030]
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	setx	0x00000000d01ef180, %r1, %r6
	setx	0x00000000d02ef040, %r1, %r7
	setx	0x00000000d03ef1c0, %r1, %r9
	setx	0x00000000d04ef0c0, %r1, %r10
	setx	0x00000000d05ef040, %r1, %r11
	setx	0x00000000d06ef040, %r1, %r12
	setx	0x00000000d07ef040, %r1, %r13
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	setx	0x00000000d01ef0c0, %r1, %r6
	setx	0x00000000d02ef080, %r1, %r7
	setx	0x00000000d03ef140, %r1, %r9
	setx	0x00000000d04ef1c0, %r1, %r10
	setx	0x00000000d05ef180, %r1, %r11
	setx	0x00000000d06ef040, %r1, %r12
	setx	0x00000000d07ef080, %r1, %r13
	.word 0xe0134008  ! 167: LDUH_R	lduh	[%r13 + %r8], %r16
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xec4ae030  ! 171: LDSB_I	ldsb	[%r11 + 0x0030], %r22
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe0330008  ! 173: STH_R	sth	%r16, [%r12 + %r8]
	.word 0xe821c008  ! 174: STW_R	stw	%r20, [%r7 + %r8]
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	ldda	[%r9]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec71a028  ! 178: STX_I	stx	%r22, [%r6 + 0x0028]
	ldda	[%r9]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	.word 0xec424008  ! 181: LDSW_R	ldsw	[%r9 + %r8], %r22
	.word 0xe449a000  ! 182: LDSB_I	ldsb	[%r6 + 0x0000], %r18
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe8498008  ! 184: LDSB_R	ldsb	[%r6 + %r8], %r20
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	.word 0xe03a8008  ! 186: STD_R	std	%r16, [%r10 + %r8]
	.word 0xe0398008  ! 187: STD_R	std	%r16, [%r6 + %r8]
	ldda	[%r9]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe43aa030  ! 189: STD_I	std	%r18, [%r10 + 0x0030]
	.word 0xe0724008  ! 190: STX_R	stx	%r16, [%r9 + %r8]
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec128008  ! 192: LDUH_R	lduh	[%r10 + %r8], %r22
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	.word 0xe02b2018  ! 194: STB_I	stb	%r16, [%r12 + 0x0018]
	.word 0xe0328008  ! 195: STH_R	sth	%r16, [%r10 + %r8]
	.word 0xec22e000  ! 196: STW_I	stw	%r22, [%r11 + 0x0000]
	ldda	[%r9]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec1b4008  ! 198: LDD_R	ldd	[%r13 + %r8], %r22
	.word 0xe839a028  ! 199: STD_I	std	%r20, [%r6 + 0x0028]
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r9]ASI_BLK_P
	membar	 0x40
	.word 0xe031a010  ! 202: STH_I	sth	%r16, [%r6 + 0x0010]
	.word 0xa8b24008  ! 203: ORNcc_R	orncc 	%r9, %r8, %r20
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xa4b2e020  ! 205: SUBCcc_I	orncc 	%r11, 0x0020, %r18
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xe0324008  ! 207: STH_R	sth	%r16, [%r9 + %r8]
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xe051c008  ! 209: LDSH_R	ldsh	[%r7 + %r8], %r16
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe8718008  ! 212: STX_R	stx	%r20, [%r6 + %r8]
	.word 0xe02a4008  ! 213: STB_R	stb	%r16, [%r9 + %r8]
	.word 0xe441e018  ! 215: LDSW_I	ldsw	[%r7 + 0x0018], %r18
	.word 0xe8124008  ! 216: LDUH_R	lduh	[%r9 + %r8], %r20
	.word 0xa0036000  ! 217: ADD_I	add 	%r13, 0x0000, %r16
	.word 0xe422a028  ! 218: STW_I	stw	%r18, [%r10 + 0x0028]
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe8326008  ! 225: STH_I	sth	%r20, [%r9 + 0x0008]
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec41c008  ! 227: LDSW_R	ldsw	[%r7 + %r8], %r22
	.word 0xe8730008  ! 228: STX_R	stx	%r20, [%r12 + %r8]
	.word 0xa4ab4008  ! 229: ANDNcc_R	andncc 	%r13, %r8, %r18
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe812a020  ! 234: LDUH_I	lduh	[%r10 + 0x0020], %r20
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe052a018  ! 236: LDSH_I	ldsh	[%r10 + 0x0018], %r16
	.word 0xe0724008  ! 237: STX_R	stx	%r16, [%r9 + %r8]
	.word 0xe04a6000  ! 238: LDSB_I	ldsb	[%r9 + 0x0000], %r16
	.word 0xe8026038  ! 239: LDUW_I	lduw	[%r9 + 0x0038], %r20
	.word 0xec1aa008  ! 240: LDD_I	ldd	[%r10 + 0x0008], %r22
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec032038  ! 242: LDUW_I	lduw	[%r12 + 0x0038], %r22
	.word 0xe45ac008  ! 243: LDX_R	ldx	[%r11 + %r8], %r18
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe0498008  ! 245: LDSB_R	ldsb	[%r6 + %r8], %r16
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe04b0008  ! 247: LDSB_R	ldsb	[%r12 + %r8], %r16
	.word 0xe02b2030  ! 248: STB_I	stb	%r16, [%r12 + 0x0030]
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xec5b0008  ! 251: LDX_R	ldx	[%r12 + %r8], %r22
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xe022e018  ! 253: STW_I	stw	%r16, [%r11 + 0x0018]
	ldda	[%r9]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe8098008  ! 257: LDUB_R	ldub	[%r6 + %r8], %r20
	.word 0xe0528008  ! 258: LDSH_R	ldsh	[%r10 + %r8], %r16
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe4434008  ! 260: LDSW_R	ldsw	[%r13 + %r8], %r18
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe8024008  ! 262: LDUW_R	lduw	[%r9 + %r8], %r20
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe442a020  ! 264: LDSW_I	ldsw	[%r10 + 0x0020], %r18
	stda	 %f0, [%r9]ASI_BLK_P
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r9]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe84a8008  ! 270: LDSB_R	ldsb	[%r10 + %r8], %r20
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	setx	0x00000000d01ef0c0, %r1, %r6
	setx	0x00000000d02ef1c0, %r1, %r7
	setx	0x00000000d03ef000, %r1, %r9
	setx	0x00000000d04ef0c0, %r1, %r10
	setx	0x00000000d05ef1c0, %r1, %r11
	setx	0x00000000d06ef080, %r1, %r12
	setx	0x00000000d07ef000, %r1, %r13
	setx	0x00000000d01ef180, %r1, %r6
	setx	0x00000000d02ef0c0, %r1, %r7
	setx	0x00000000d03ef100, %r1, %r9
	setx	0x00000000d04ef1c0, %r1, %r10
	setx	0x00000000d05ef0c0, %r1, %r11
	setx	0x00000000d06ef0c0, %r1, %r12
	setx	0x00000000d07ef1c0, %r1, %r13
	.word 0xe022a000  ! 274: STW_I	stw	%r16, [%r10 + 0x0000]
	.word 0xec524008  ! 275: LDSH_R	ldsh	[%r9 + %r8], %r22
	.word 0xe03a4008  ! 276: STD_R	std	%r16, [%r9 + %r8]
	.word 0xe4318008  ! 277: STH_R	sth	%r18, [%r6 + %r8]
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe4326038  ! 281: STH_I	sth	%r18, [%r9 + 0x0038]
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xe85a6000  ! 283: LDX_I	ldx	[%r9 + 0x0000], %r20
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r9]ASI_BLK_P
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe81b6000  ! 289: LDD_I	ldd	[%r13 + 0x0000], %r20
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xec034008  ! 293: LDUW_R	lduw	[%r13 + %r8], %r22
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	.word 0xe4098008  ! 298: LDUB_R	ldub	[%r6 + %r8], %r18


done;

h_bad_end:
        ta T_BAD_TRAP

.global  My_0x30_trap

My_0x30_trap:
  !inc %l4
  done

SECTION .UDATA1  DATA_VA=0xd08e0000

attr_data {
        Name = .UDATA1,
        VA=0xd08e0000,
        RA=0x010e000000,
        PA=0x010e000000,
        part_0_d_ctx_nonzero_ps0_tsb,
        TTE_G=0, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_SIZE_PTR=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=0, TTE_CV=0, TTE_E=1, TTE_P=0, TTE_W=1
        }

.data
.global user_data_start
user_data_start:
        .skip 1000

SECTION .NCDATA0  DATA_VA=0xd01ee000

attr_data {
        Name = .NCDATA0,
        VA=0xd01ee000,
        RA=0x8010000000,
        PA=0x8010000000,
        part_0_d_ctx_nonzero_ps0_tsb,
        TTE_G=0, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_SIZE_PTR=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=0, TTE_CV=0, TTE_E=1, TTE_P=0, TTE_W=1
        }

.data
.global ncdata_base0
ncdata_base0:
        .skip 1000

SECTION .NCDATA1  DATA_VA=0xd02ee000

attr_data {
        Name = .NCDATA1,
        VA=0xd02ee000,
        RA=0x800e000000,
        PA=0x800e000000,
        part_0_d_ctx_nonzero_ps0_tsb,
        TTE_G=0, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_SIZE_PTR=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=0, TTE_CV=0, TTE_E=1, TTE_P=0, TTE_W=1
        }

.data
.global ncdata_base1
ncdata_base1:
        .skip 1000

SECTION .NCDATA2  DATA_VA=0xd03ee000

attr_data {
        Name = .NCDATA2,
        VA=0xd03ee000,
        RA=0x800f000000,
        PA=0x800f000000,
        part_0_d_ctx_nonzero_ps0_tsb,
        TTE_G=0, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_SIZE_PTR=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=0, TTE_CV=0, TTE_E=1, TTE_P=0, TTE_W=1
        }

.data
.global ncdata_base2
ncdata_base2:
        .skip 1000

SECTION .NCDATA3  DATA_VA=0xd04ee000

attr_data {
        Name = .NCDATA3,
        VA=0xd04ee000,
        RA=0xc000000000,
        PA=0xc000000000,
        part_0_d_ctx_nonzero_ps0_tsb,
        TTE_G=0, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_SIZE_PTR=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=0, TTE_CV=0, TTE_E=1, TTE_P=0, TTE_W=1
        }

.data
.global ncdata_base3
ncdata_base3:
        .skip 1000

SECTION .NCDATA4  DATA_VA=0xd05ee000

attr_data {
        Name = .NCDATA4,
        VA=0xd05ee000,
        RA=0xd000000000,
        PA=0xd000000000,
        part_0_d_ctx_nonzero_ps0_tsb,
        TTE_G=0, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_SIZE_PTR=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=0, TTE_CV=0, TTE_E=1, TTE_P=0, TTE_W=1
        }

.data
.global ncdata_base4
ncdata_base4:
        .skip 1000

SECTION .NCDATA5  DATA_VA=0xd06ee000

attr_data {
        Name = .NCDATA5,
        VA=0xd06ee000,
        RA=0xe000000000,
        PA=0xe000000000,
        part_0_d_ctx_nonzero_ps0_tsb,
        TTE_G=0, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_SIZE_PTR=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=0, TTE_CV=0, TTE_E=1, TTE_P=0, TTE_W=1
        }

.data
.global ncdata_base5
ncdata_base5:
        .skip 1000

SECTION .NCDATA6  DATA_VA=0xd07ee000

attr_data {
        Name = .NCDATA6,
        VA=0xd07ee000,
        RA=0xf000000000,
        PA=0xf000000000,
        part_0_d_ctx_nonzero_ps0_tsb,
        TTE_G=0, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_SIZE_PTR=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=0, TTE_CV=0, TTE_E=1, TTE_P=0, TTE_W=1
        }

.data
.global ncdata_base6
ncdata_base6:
        .skip 1000

attr_data {
        Name=.MY_HYP_SEC,
        hypervisor
        }

.global my_hyp_data
.align 0x40
my_hyp_data:
        .skip 0x200

.end



SECTION .ISEG_0 DATA_VA = 0x0000000000100000
attr_data {
	Name	 = .ISEG_0,
	RA	 = 0x0000000000100000,
	PA	 = ra2pa(0x0000000000100000,0),
	part_0_d_ctx_nonzero_ps0_tsb,
	TTE_G	 = 1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 1
}

.data
	.xword	0x17c910b3d70a5759
	.xword	0xcca3a9a8f65d9c6b
	.xword	0x41cc185e438e92d0
	.xword	0x6b4ef4a7960705b3
	.xword	0x0ae8d1e3174e7ea3
	.xword	0xab893f791cdd12dc
	.xword	0xa90c91a520910b6b
	.xword	0x6d752df0c9b1e603
	.xword	0x104fedf85172c337
	.xword	0x310b1e375d32bc6e
	.xword	0xd5989963d5591057
	.xword	0x2d66e24fda7bee40
	.xword	0x8c10a9078eec6c4a
	.xword	0x076ac9afe86c5194
	.xword	0x995335398cc0fd6d
	.xword	0x397259ea0b465309
	.xword	0x431734b1197b06bc
	.xword	0x73fd361021bc2fc5
	.xword	0xa7160edd1c6be708
	.xword	0x02d423e89b655162
	.xword	0x1430ab4565861e9c
	.xword	0xa0185c76da1daff7
	.xword	0x69392e43157adf70
	.xword	0xd24cd0d36bd00b15
	.xword	0x3e52484d9f433262
	.xword	0x672b83adb2fe56d2
	.xword	0x01400cc3a58987b0
	.xword	0x7a1174ca4f58dee4
	.xword	0x38fc17555db5266a
	.xword	0xb5ad63f2fee5d628
	.xword	0xa6f86509e1b3c300
	.xword	0x6a400e4b1d31f371
	.xword	0xf34dde7e3c4ef630
	.xword	0x20ce3ab30d4f0456
	.xword	0x46c61f9201ca6e66
	.xword	0x07d54fdd5f3ae0cf
	.xword	0x2bcd2c0b5ad5977a
	.xword	0x3a0f4023bd787097
	.xword	0xaaa7ecf45d304a1a
	.xword	0x81f0b4423c782d8a
	.xword	0xfe5d4fec97f908cd
	.xword	0x77387f7e60b3acba
	.xword	0x65e0f904d14b8c2a
	.xword	0xe2fde509bde34c11
	.xword	0x826bf8943cb396ca
	.xword	0xfa28ce352da49f28
	.xword	0x30ef8b5049ae7d29
	.xword	0xa3a367eeda7a67b0
	.xword	0x681812ac783f8114
	.xword	0x189e98ea6fed3766
	.xword	0xfb74b066c0ed3037
	.xword	0xb28d284932b591ab
	.xword	0x161879e5bf20af82
	.xword	0xa0d30f75852125dd
	.xword	0xfc4e227ec4d8817e
	.xword	0x585d28e4ff1a5ec5
	.xword	0x787f9a869fceb048
	.xword	0xbff6ccb556af09ff
	.xword	0x4cb6a3329465dac0
	.xword	0xed6a0f236f819e02
	.xword	0x92818ea83cd676ec
	.xword	0x0fe1f1b4b8b09414
	.xword	0x8924b031daca1dcf
	.xword	0xddb168f1ba651741
	.xword	0x84cb226df46a399a
	.xword	0x01490f2b7696c71d
	.xword	0xb0ff29d35939e0b3
	.xword	0x39f31a46f0ee1327
	.xword	0xccdc031b71aa1911
	.xword	0xb87967d3fcfd26a2
	.xword	0x5934605e9ea6e521
	.xword	0xb3f63321c0ac8b3a
	.xword	0x080e7dd7568f5031
	.xword	0x59b5876150a28d3a
	.xword	0x1749278376b5c5c6
	.xword	0x2cc894ba5794bda9
	.xword	0x9a8f4d070aee9f2c
	.xword	0x265c46b6bf2185e7
	.xword	0x40794824d602e861
	.xword	0xf5b7a7589d0915f2
	.xword	0x0525b9c0e052acfe
	.xword	0x726d2093660e98b3
	.xword	0x866610a53f310d9a
	.xword	0x939b0b6b1bf213d8
	.xword	0xaa05520c8bd15b00
	.xword	0xad73794f2cfa34cf
	.xword	0x65625746ccab2bc9
	.xword	0xdcbddd2c49e8f503
	.xword	0x9d34b207140a5a98
	.xword	0xe0b53d41ebf98f47
	.xword	0x4d5dbaa4c58b15ed
	.xword	0xa9e6d73c3b51e02a
	.xword	0x5bffd4903f11017d
	.xword	0xffb393d71e9044ac
	.xword	0x498298aa369a194b
	.xword	0xf203b124668dc024
	.xword	0x4ac9e21360d67bbe
	.xword	0xd170d68e5d4826fc
	.xword	0x6fead0a2f0ca102a
	.xword	0x7e5f24fcfa30445e
	.xword	0x9bc2c52f9508356b
	.xword	0x6afb2e21e92eaf3f
	.xword	0x14985f36f6d86c09
	.xword	0xe4fa646a87665bb1
	.xword	0xa884097ffa5a1e99
	.xword	0x8480e1012e69e933
	.xword	0x40172014883f9126
	.xword	0xcbddca100e1565d4
	.xword	0x8db54ce3485ebf99
	.xword	0x77efe75dc3b6969a
	.xword	0x58707d327e8ed916
	.xword	0xeaa66ee025465229
	.xword	0xa4c60774faa665e4
	.xword	0x2c655d4d10a73784
	.xword	0x7fb18103a9185365
	.xword	0x0868e05eddc429c3
	.xword	0x73ec96930221396f
	.xword	0x0f88dc2008e38c46
	.xword	0x1817bd1b61058994
	.xword	0x712172048420dc1c
	.xword	0x8bf6918dfb7c2cef
	.xword	0xe9b74f00218b0a8e
	.xword	0xc27a6773caa7ebcd
	.xword	0x1a2913bd1e321a7d
	.xword	0x493d46da4909cbcc
	.xword	0x8eedaf4bd33cb407
	.xword	0x2ad26a185eb10a6b
	.xword	0xf0e4004acbf11b5b
	.xword	0x0f2f752579e65f0e
	.xword	0x3f0a4b3621dd7fde
	.xword	0xa2596ab69da8f933
	.xword	0x53dd897dfa68d617
	.xword	0x77617bbc9464c00f
	.xword	0xda32559f6ce7c24a
	.xword	0x8f09493205e4c9af
	.xword	0x435ba5e33fe2fe16
	.xword	0x95d7529b691417c4
	.xword	0xfa02012c8487c652
	.xword	0x7aeb176a0798b64e
	.xword	0x83e87fac2cf2bd9b
	.xword	0x4a7b9a28121f70db
	.xword	0x0dab8fa72782954a
	.xword	0x428b268298b2d054
	.xword	0x47023c7a13121a8b
	.xword	0xd932ad121f8e59ff
	.xword	0x1b83851e8df0a03b
	.xword	0x5f49babd8e994e61
	.xword	0x1aa4ba20e4169e14
	.xword	0x3e754dfd5d9b2b85
	.xword	0xc9b2fc14b73fd6f8
	.xword	0xe6efcd27f783bd66
	.xword	0x3cca7f1c2101ed02
	.xword	0xbee371da2f78481f
	.xword	0x35fdada5a1b41194
	.xword	0x220ce163c3293e66
	.xword	0xb99ce8feabc9a113
	.xword	0x2c6b804d16abb91e
	.xword	0x24dcdd17aa09e1b7
	.xword	0x0f68ef43f6b35af7
	.xword	0xb80b34bb078d4848
	.xword	0x6f63c766a377e2bb
	.xword	0x81a39e435d032768
	.xword	0xbffe00fc95c029a6
	.xword	0x9bb9b4cc6abc0190
	.xword	0xf3682a4036127d28
	.xword	0x46f2af4eb3fb5c2a
	.xword	0x80ee922ea4dd0e41
	.xword	0xb8853e2181e8afcc
	.xword	0xe0a5ebc8e6a8913e
	.xword	0x631605329871d7dc
	.xword	0x5335c3cd9272886e
	.xword	0xc2f79a0ecc1d448c
	.xword	0xd9eed90b6101bccf
	.xword	0xbc66fe7be363c871
	.xword	0xf62d85eabc3205e5
	.xword	0x997b6450e731e9aa
	.xword	0x061ffdca43417e7f
	.xword	0xda2bfbf610f5bf80
	.xword	0x9cd7aaa790264bb9
	.xword	0x8a7e821b4968fecc
	.xword	0xe8907c01214164a5
	.xword	0x033f38282721c157
	.xword	0x6fdbfb2e21bf2d91
	.xword	0x82c54b4faf7f4e91
	.xword	0x9c5b05f1a1cda18a
	.xword	0xc0c594b8a53d678a
	.xword	0x2586cb8558c8ec82
	.xword	0xb57a2404d49acfb7
	.xword	0x5d09b57960fdf3a3
	.xword	0x5602d64274128161
	.xword	0x39e2a06ea5f340ac
	.xword	0x28a5d2ba46345167
	.xword	0xc1084e67b45a36a7
	.xword	0x826086689d4dc9e2
	.xword	0x241ee051d358a00e
	.xword	0xe0b4af31c0a9ee2f
	.xword	0x74671cf39ae6a22b
	.xword	0x0b9a4a1aaeebb93a
	.xword	0x4aa3164f0fada621
	.xword	0xfd479a513f49d967
	.xword	0xb09631f9504cafa8
	.xword	0xca6f480b01e54dd3
	.xword	0x5d51e3b731b5017a
	.xword	0x13f076ea5bbb8fde
	.xword	0x4fe7086e6bd6d123
	.xword	0xd94a008e30a0f8ef
	.xword	0x858b2d268a95f26a
	.xword	0x84dcd28d9ec1e406
	.xword	0x231cbc68388406fe
	.xword	0x99b8604e8804ee19
	.xword	0x1f36d941f2574a1c
	.xword	0xde29d43b7a92dd57
	.xword	0xfc1542784f7569b1
	.xword	0x5deba619b0e8bb1e
	.xword	0xb84cd6eac76a6879
	.xword	0x2de6807178c3a23b
	.xword	0xf5bf5aa1d0d48f6d
	.xword	0x3786df89211edf08
	.xword	0x4cbf5fac81ff87d8
	.xword	0xe879515fc9695e4a
	.xword	0xf28c25cb0c50dcad
	.xword	0xded9a49f90ab105f
	.xword	0x521e4dc8328e518f
	.xword	0x503de62ca09a520e
	.xword	0x045845ae0369717e
	.xword	0xa29cc053deec707f
	.xword	0xf2ff7fa16a3086ae
	.xword	0x60344d03c898a6a8
	.xword	0xca474ccdfcba83cb
	.xword	0x81ce57d5bbb59d4f
	.xword	0xee9eac4ab3ec11ed
	.xword	0xaf8ba2c0553253e1
	.xword	0xdc43496c35048a16
	.xword	0xf9963e40c91608f0
	.xword	0x5945ac2135f505ff
	.xword	0x5d60d072b9f269f0
	.xword	0x96d99c8f3d7ef379
	.xword	0x20a517404a26a2f7
	.xword	0xf09a32e3904fa36d
	.xword	0xbb44274cc874463d
	.xword	0xa9efc9b9a10f5586
	.xword	0x011d8cded9e760dd
	.xword	0x2c90a5b56fc7127c
	.xword	0x015ea01089d1d611
	.xword	0x027aab10799d5daf
	.xword	0xab0072ca7f9ca732
	.xword	0x89152bf95cd64e65
	.xword	0x3d9ae045dabf249b
	.xword	0x115ee990d44a1991
	.xword	0x0caa23c1384b3340
	.xword	0x1090c470c440a9db
	.xword	0x99492e768cc23d82
	.xword	0xe35ccd8335d1760b
	.xword	0x81b45f531d2f1033
	.xword	0x64ec39078d00efd7
	.xword	0x2062aa200750b030



SECTION .ISEG_1 DATA_VA = 0x0000000010100000
attr_data {
	Name	 = .ISEG_1,
	RA	 = 0x0000000010100000,
	PA	 = ra2pa(0x0000000010100000,0),
	part_0_d_ctx_nonzero_ps0_tsb,
	TTE_G	 = 1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 1
}

.data
	.xword	0x8161e0d396a27f3d
	.xword	0x0422182a624527a5
	.xword	0xbd47b104dee9ba35
	.xword	0x31345d7d75f1f40c
	.xword	0xfaacc7fb2333fb45
	.xword	0xa397b276ad8bc978
	.xword	0x8538efe9ce3f104b
	.xword	0xfccda743979819f2
	.xword	0x27c13e0160a56dfc
	.xword	0x1b493d3df69ce8cb
	.xword	0x5649a5be6975b935
	.xword	0x85afa1a622dfb908
	.xword	0x0505ec97e7dd0643
	.xword	0xc1090bfd74da1fde
	.xword	0x8ab871f64fb45a0a
	.xword	0xc635baf8e0207d00
	.xword	0x8ddb2fd69abeabec
	.xword	0xd366aa8a015f8101
	.xword	0xe4b31d0f7213041d
	.xword	0x2f75b33b032333c2
	.xword	0x608384a8d79fa9f7
	.xword	0x17741adaa70375bc
	.xword	0x98a59d0bbeb160e1
	.xword	0xa54c1f94af237d5d
	.xword	0x2508ce1221051791
	.xword	0x3be6b04aa8c52c66
	.xword	0xa75c5a3fc6caae14
	.xword	0xcee98cd6877c72ff
	.xword	0x3246d948eb922ced
	.xword	0xfb5eefaab514aa2f
	.xword	0xc43ecceb9773eb02
	.xword	0x71af8b5c65ec6729
	.xword	0x3872a4cc82bc14a4
	.xword	0xeb5b71ea492c9318
	.xword	0x4664203ff83bec25
	.xword	0xa71bd88b1c0092e8
	.xword	0x96107bce745f23e7
	.xword	0xb9313f00c85b9512
	.xword	0x456728d0fb91facb
	.xword	0x89f5027e4fa7d5c1
	.xword	0xe468889d14c0aa54
	.xword	0x356bb9ee4d950bd2
	.xword	0x8d32b8b63c12f7d8
	.xword	0xe429da84e56e74cc
	.xword	0x03366ac1f8f5ff08
	.xword	0x044ea78f31e6c37c
	.xword	0x87cc387049869cd5
	.xword	0x6ad91829f9cf32ac
	.xword	0xd2ac9cd7383a7bdc
	.xword	0x18c4f71e7e2d284c
	.xword	0x0b4ea99bdfdadd0f
	.xword	0x12887f193253c289
	.xword	0x407aafefd26dda91
	.xword	0x861481171a0210b6
	.xword	0xb1355ad9eb0900ef
	.xword	0xcd9018cdcd84f25e
	.xword	0x77576679b4ae4293
	.xword	0x75b4cdcc8f3e9308
	.xword	0xc4df028f9640bd41
	.xword	0xd9a08710e8927b09
	.xword	0x0470ab4726c1f257
	.xword	0x8816f37d6beb6948
	.xword	0x000f71d2fee71861
	.xword	0x7ef4fd7b86f0cba7
	.xword	0x73f3d9e23447aba7
	.xword	0xe0f3555e1f21c749
	.xword	0x76055fa88100d769
	.xword	0x9e8c859da76c71f2
	.xword	0xe85f07ff0516e071
	.xword	0xd30759f96b37cf8d
	.xword	0xa8a851111e6a4750
	.xword	0x84900677213714a1
	.xword	0x10508e972063c6b4
	.xword	0xb8e43533cc383428
	.xword	0x12d21824cf28ad63
	.xword	0x3bc4b66c3fd462d5
	.xword	0xbeee2be62bdd61f7
	.xword	0x37790db10850415f
	.xword	0x60d9429f3ce43291
	.xword	0x5706409c8ca7b698
	.xword	0x3b2a436c706e774a
	.xword	0x69fdde23cd8b4a79
	.xword	0xce1a6636940dbee6
	.xword	0xc458db172cacfce2
	.xword	0x4eb11731811e915f
	.xword	0x2da407b2d584a3ee
	.xword	0xe4409d825d7f65a7
	.xword	0x9b86b637babdd3c6
	.xword	0x473f3368e0591302
	.xword	0xe70ea488e4d74b88
	.xword	0x6ea885a881807704
	.xword	0x943be44de0595fe1
	.xword	0xe01bedb2a3db31cc
	.xword	0x8af8f86e8df88410
	.xword	0xb208a598053d7b4d
	.xword	0x7d4f095981665c00
	.xword	0x1a5811ef3b18135f
	.xword	0x31be85fc38d8e37d
	.xword	0x7db51b7a41d89ec5
	.xword	0xa1bc9ce08ead0cf1
	.xword	0x6d787a5ba5e4724d
	.xword	0x1de6fc79c6e7001b
	.xword	0xc826bce349862921
	.xword	0x0ffbbadd330c063a
	.xword	0x4f147259e1d081da
	.xword	0x7b7a760ed5f7c52c
	.xword	0xd973c169db8e8321
	.xword	0xefa34a115c07b802
	.xword	0x3731fd71cb67497a
	.xword	0xc544a7e2e809cf81
	.xword	0x6f7136fcb4245f5f
	.xword	0x32bd1f30b7851a98
	.xword	0x232ac32dd3fc10ae
	.xword	0x439fc1a18a78a0f4
	.xword	0x06f30808c2f8d414
	.xword	0xdcdcdb9d00503ce0
	.xword	0xf0b112f3a18230ea
	.xword	0x1e983dfd5f3f7bf6
	.xword	0x899b102578d27b79
	.xword	0x0ca1e279a11f2a19
	.xword	0xe61a425008cb4fe1
	.xword	0x46d3dc686069ebb6
	.xword	0x18a6f232b349ccab
	.xword	0x31340137424e72af
	.xword	0x8ce79a40763830f3
	.xword	0x26b8c448c6962d60
	.xword	0x68ff79c56e52f566
	.xword	0x62a42abdbe83dd74
	.xword	0x1d9c86fd865ad5ab
	.xword	0x8f62840230a20ae3
	.xword	0x5aecdb102a5e3c9e
	.xword	0xa63382d118ddb001
	.xword	0xbf6a326f0d60a204
	.xword	0xecd378b05a0267b0
	.xword	0x79d781ded4772985
	.xword	0xe0658451e34059d5
	.xword	0xf065a48bfe12f8c6
	.xword	0x14160c9640e45d0f
	.xword	0x8e94c7b20802e1b4
	.xword	0x1bc6888d55919702
	.xword	0x459ea1cbc12944cc
	.xword	0xf117867cd00b29f7
	.xword	0x397c3c8f96669c63
	.xword	0xfca919b987e49d86
	.xword	0xe36c7707a7f3ae1e
	.xword	0x916c3b68e14fcbd7
	.xword	0x28eb65bd7b9ac6ec
	.xword	0x49aaa0a3c469e2ec
	.xword	0x9af0cdb3366416aa
	.xword	0xc9a2f2d414c2df4c
	.xword	0xffb461f4b156eb2a
	.xword	0x14c9bc1892a81b50
	.xword	0x22bee42d28c772b6
	.xword	0x1910afa3101b2761
	.xword	0x498b47ba275944e9
	.xword	0xee0c4363c58372b3
	.xword	0xbaf63244347e8c9d
	.xword	0x4b69a8e04bb24c11
	.xword	0xbf13b52555056108
	.xword	0x15e0a888952424c8
	.xword	0xde6ded4bfbac02d4
	.xword	0x87c1fb40aa6f2f33
	.xword	0x57f6088a29f83910
	.xword	0x7d579356114b1092
	.xword	0xac1a9aacc5bc89bc
	.xword	0x6f9db1c8e9d4a07f
	.xword	0x2a44c0dc16ae1c46
	.xword	0x230f55fa63720cfa
	.xword	0x6957c39a42d31caf
	.xword	0x4abf6f6e884fd4be
	.xword	0x9c30d1a63c1506c2
	.xword	0x2bd2b7865b278a7e
	.xword	0x0c1b48ace661147e
	.xword	0xf6819210078581e7
	.xword	0x3dd34919b00a1d3f
	.xword	0x1de1052a37926696
	.xword	0xd9a0589cf39e890a
	.xword	0x7d240ac3fb505952
	.xword	0x84a0fc51bdbac603
	.xword	0xbb7a7f75c2b510d4
	.xword	0x36d2ba4bf9ae74cd
	.xword	0x3fb91f03d0131cdd
	.xword	0xa2c6562ea9d91877
	.xword	0xff31f6ade3592fc9
	.xword	0xa48702955e0cd972
	.xword	0x6f3cab56c624250e
	.xword	0xdeb99585e8793d48
	.xword	0xf0e77d862ade3d15
	.xword	0x2985747db510c7f9
	.xword	0x680ff8875b0087d3
	.xword	0xf116669526a2e616
	.xword	0x352830a1c362a2b9
	.xword	0x0623e597b956c3a7
	.xword	0x306c370c94897e71
	.xword	0xe8e5f0c1b187d7de
	.xword	0xaec62274688fcd88
	.xword	0x4706fcd96a727906
	.xword	0x9435544477381e24
	.xword	0x235a1ee90ebaf132
	.xword	0xbb3a0b6f145c98e1
	.xword	0xd76982ad71e8eff2
	.xword	0x0c66571a03c5c331
	.xword	0xb347702a26199d2e
	.xword	0xfa921ebbf569d038
	.xword	0xa0d1c0eb06c3285a
	.xword	0x12a4726cdc808c3d
	.xword	0x9ea7fee777da8413
	.xword	0xe57b5fec65ed8e9e
	.xword	0xab82fe0fe1d1bbce
	.xword	0xb152ca28beed4a8d
	.xword	0x0bfb544c45bf7e73
	.xword	0xf46bba64a2534dee
	.xword	0x2e125546bf17e53e
	.xword	0xc7b0cc6ef97ef2f3
	.xword	0x6d64885ab1e1a589
	.xword	0x5ecb72f1349bff21
	.xword	0xca4f39983138c0a8
	.xword	0x0e142fbf7a527584
	.xword	0xe29d35b0dda4c4f0
	.xword	0x841cc604cdf8d003
	.xword	0xf17c3aed80ccb8ff
	.xword	0x929627609fc75fae
	.xword	0x204d518097835dc7
	.xword	0xd3b4370fbe92d20e
	.xword	0xde081d3d14ce7dc7
	.xword	0xf26ea94cd33370ea
	.xword	0x2ed971988e67c9af
	.xword	0x03d809ae21dd7ee7
	.xword	0x8c04fdf161c08109
	.xword	0x1499c4fdd8676607
	.xword	0x2c8e18ecf07524d1
	.xword	0xc407996717d95095
	.xword	0x471c46b97b693cab
	.xword	0x302642880bfa20e9
	.xword	0xf7a6b20074927702
	.xword	0xb16b1a068d784778
	.xword	0x592ac67b0e53393a
	.xword	0x59f3a88092626c90
	.xword	0x9f7d2486de1287a1
	.xword	0xd817fd56c25520c0
	.xword	0xc00f34970b003ec3
	.xword	0xdf95800c851691b6
	.xword	0xf712df457202ad35
	.xword	0xb7dda22e4b70b9a8
	.xword	0x46768d79d9b9f247
	.xword	0x859f5745c52cd52d
	.xword	0x5a93f129e0b359e3
	.xword	0xc88a13a051f60386
	.xword	0xa1e12e60a60702e6
	.xword	0xfa6b855f13387300
	.xword	0x497eb4665599ad18
	.xword	0xa4075ee7d45781f4
	.xword	0x9b4d591f2e41848f
	.xword	0x4e653968de29077a
	.xword	0x911f57060cac09ca
	.xword	0xc2740046713b003b



SECTION .ISEG_2 DATA_VA = 0x0000000020100000
attr_data {
	Name	 = .ISEG_2,
	RA	 = 0x0000000020100000,
	PA	 = ra2pa(0x0000000020100000,0),
	part_0_d_ctx_nonzero_ps0_tsb,
	TTE_G	 = 1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 1
}

.data
	.xword	0x6c416b2f87c71d0a
	.xword	0xf7e1b84219ff96e0
	.xword	0x02dc8bf774c9f3c1
	.xword	0x83b93260ab330e92
	.xword	0x960b0d1ba42e9b56
	.xword	0xa28bd72521d0a2f0
	.xword	0x5d4d2dd5928889a5
	.xword	0xabd135b6e76dad7b
	.xword	0x7e24bba2924d578b
	.xword	0x0f0f2975b514bd54
	.xword	0xa5d291eb63e40e80
	.xword	0xd15203c76477b373
	.xword	0x5c37d781f0bcec32
	.xword	0x0495215d587ec93d
	.xword	0x401f5625cf2c6b58
	.xword	0xd589e2f4a48167f0
	.xword	0x8988dc1c95bcaef1
	.xword	0x5f2cb2eed0e17a19
	.xword	0x3347f6e96f781559
	.xword	0x9266a5448799c008
	.xword	0x1c73a2265a7f5c2e
	.xword	0xbb1052dd510b2480
	.xword	0x8b67e58135d92e54
	.xword	0xb9016f0222a38272
	.xword	0xfecbf999993a42d4
	.xword	0xdf67355e3bcae723
	.xword	0xa579f8189394868b
	.xword	0x75f2a52a067bebcc
	.xword	0x8696f033c64c71a7
	.xword	0x5656c6edd0aa58bc
	.xword	0x00d5079c91b2a315
	.xword	0xbbeb3900fe124dcf
	.xword	0x4b52ff60fe8f5666
	.xword	0x6571c472e7215944
	.xword	0xebae0fa902131bb3
	.xword	0x68c432eb4c7b9f1c
	.xword	0x5979c45c9cef5a05
	.xword	0x6aa0d3bef7fa6332
	.xword	0xd5dc7df9474518c9
	.xword	0x03f7c29d1013f32b
	.xword	0xcd37d9b9554d3fda
	.xword	0xfc4030e1b0b367e4
	.xword	0xaada833e50a3ecb6
	.xword	0xd965134d678e7a23
	.xword	0x01de093271aa6def
	.xword	0x1c7e5a19eb84100b
	.xword	0x3d7edd6a5ca4bbf0
	.xword	0xcfb406ec829a7a36
	.xword	0x648db60f3b9ed84c
	.xword	0x8bab1e07f0731803
	.xword	0x5e1dc7151cfeba11
	.xword	0x597296896330dc14
	.xword	0x60b3084ee6705de4
	.xword	0xe06dab41bfe2ebf0
	.xword	0xec5a5e67efff06d8
	.xword	0x4eb851c94f3f7045
	.xword	0x8ec115948d1f0d6e
	.xword	0x354ba29de6b0641b
	.xword	0xba03e83531296baa
	.xword	0xb56e6638f892e1d4
	.xword	0x72c8c2ba26f5cf97
	.xword	0xdab808a48697a70a
	.xword	0x9261ea98100b65a7
	.xword	0x27307607a35e281c
	.xword	0x74218cb659f8a027
	.xword	0x70f6425509ed5298
	.xword	0x72883550c6f7ca9b
	.xword	0x599ca0040ee547a2
	.xword	0xce1c83b42596790e
	.xword	0x9afd19eee32a3341
	.xword	0x7b77eaf032a27936
	.xword	0xc67478483912fae8
	.xword	0xec852183a7a5847a
	.xword	0x25842e0b4a6e7f05
	.xword	0x86df992447fbbda1
	.xword	0x55696c6c6b2379bd
	.xword	0x73ff61c7b94afd49
	.xword	0xa31581ccd6175fee
	.xword	0x7f5329d2bac64f01
	.xword	0x7e285e370a5e00b7
	.xword	0xffad43a5df267eb8
	.xword	0x7e0aca5dcbf31752
	.xword	0xf1365168e401cb7e
	.xword	0xa069ccbb3e33afb4
	.xword	0x0457921934029bec
	.xword	0xc33f57281de3776f
	.xword	0x9ea6bb21bdf51ff9
	.xword	0x3433335a8fa41954
	.xword	0xc8796b4401639bfa
	.xword	0x6fba228fe24c917a
	.xword	0xefd2d64286a663b7
	.xword	0xfbdf48bac83f088b
	.xword	0x7967fcebbb346942
	.xword	0x9aa7a305cf194699
	.xword	0x156d1b16dcfebb6d
	.xword	0xd9c297262a95c886
	.xword	0x6b502a4874895ba9
	.xword	0x2c2b2e267ef8388f
	.xword	0x0b5fb8a14a0c57b5
	.xword	0x29148a40aacdf2c0
	.xword	0xf6364473a52f1b72
	.xword	0xf4720220b7a00504
	.xword	0x677d8ab9a74803e2
	.xword	0x29b374c176f2c49f
	.xword	0xd1fe8d51ae199129
	.xword	0x0eec4041901bfc40
	.xword	0x8493007ad52a4b11
	.xword	0x802b7f3492041698
	.xword	0x550e29848fb57c68
	.xword	0x011681d4aa4bbf4d
	.xword	0xa922f7bfbb381c43
	.xword	0x161de7ace294f6af
	.xword	0x6272649719a79a1a
	.xword	0x80163dbf5f6d4c71
	.xword	0x099ac901466cc1d6
	.xword	0xc6fc079d0c65026f
	.xword	0x9a1dcf71e884fd4a
	.xword	0x236bc439a1f41010
	.xword	0xcaf085189500f91a
	.xword	0x0c0cc6dc125b9ce3
	.xword	0x0cfa9b1c49b4ed8b
	.xword	0xa97a4a5236aeee6e
	.xword	0x344e9fa700a99480
	.xword	0x53fdbb82f4ce79a8
	.xword	0x09992359c0c17e7f
	.xword	0x0302ac549f8b61d2
	.xword	0x949055bed67e3186
	.xword	0xa4be5c08941d2986
	.xword	0xa602b83d072eaa3d
	.xword	0x6fbbbf291bc8863a
	.xword	0xbed964b22baac333
	.xword	0x225616e0c7374c10
	.xword	0xf6180c1770365001
	.xword	0x5cbab14b540d7f8a
	.xword	0x1738181d424da9b8
	.xword	0x911d1bc8bc917a6d
	.xword	0xe071acbbc5e6d914
	.xword	0xd9cc36c9ceba009b
	.xword	0x8d7ce7c6c445a559
	.xword	0x21301fc64767f509
	.xword	0xf8fa8e17261b4544
	.xword	0x2a4c435559cd097a
	.xword	0xfe772f2e1fa1ded3
	.xword	0x44fab5e527fa681a
	.xword	0x6effe6ea4a912aca
	.xword	0xedc4b23184c60a5e
	.xword	0xd0ab6da4eb18070b
	.xword	0xf3c82829bb425425
	.xword	0x47533ef6c43bd353
	.xword	0x4375b82477a4ed2f
	.xword	0x63f44ae616334565
	.xword	0x57ba65e34fcf931f
	.xword	0x4a8edfa2b9957c71
	.xword	0x7aa5633980d40649
	.xword	0xc9a729a206255f7d
	.xword	0xa7eb43a77cbd7343
	.xword	0xb1a6834482634948
	.xword	0x3fe624b54e335806
	.xword	0x257a05316224382c
	.xword	0x4a17f531c3cc3fed
	.xword	0x4ca0ec055cddf6c4
	.xword	0xc80092cc4fbe29cc
	.xword	0x66b29e4eeeeaa2c6
	.xword	0x3ef2097267f273dc
	.xword	0x666491e9390e9cd5
	.xword	0x09a213935a2d979a
	.xword	0x4e1e40163f9d5803
	.xword	0xb868e64a1b92e04c
	.xword	0x1c5f06ed549c1758
	.xword	0xc4e543b209a9bd2d
	.xword	0x65dbcd9b63e0b155
	.xword	0x5b8388d24e9ddd3f
	.xword	0x504697822188196b
	.xword	0x61c4693f8ed28dd2
	.xword	0xa886e592db6b09e1
	.xword	0x12fabf8e0df56ba8
	.xword	0x845fdde7c6dc27c8
	.xword	0xec49cf6453aa5b5c
	.xword	0xeb2d938df569fcb9
	.xword	0x0ef582d413a043f9
	.xword	0xc1cf81d8f0a8c6e5
	.xword	0x1ae599860f9afaca
	.xword	0x9bdecc2c0bdc95ed
	.xword	0x4de058d58e82c53e
	.xword	0x7ceb5b8e3fdd74a0
	.xword	0x35bdbe401a6e12c4
	.xword	0x1466231dec09e7c4
	.xword	0x383d1dba2b3ae10e
	.xword	0xd7b6c02ef61ee6c9
	.xword	0xf565483a3531c6a6
	.xword	0x05e1374d7dcd06aa
	.xword	0xc529b29ad30b8ca0
	.xword	0x5f8a363520c36556
	.xword	0x95408698875eaa10
	.xword	0xf2675a9fd93c1049
	.xword	0xe4c5a48974640d4f
	.xword	0xb1bcd09656c09e9e
	.xword	0xe86defa3e69f39b3
	.xword	0x3e9879426d3dc841
	.xword	0x064df31971a72f2f
	.xword	0xf9fab526d45eb6da
	.xword	0x3d90e7b5dcd1e23f
	.xword	0xd99377971a4cb5f0
	.xword	0x7ef8f2d63f9a4f27
	.xword	0xd4d2d45b076edec9
	.xword	0xdd57d520532d3e50
	.xword	0x3e25d11aa7c9b33e
	.xword	0x2442d75630ab4af1
	.xword	0xf96f056e302ba9ec
	.xword	0xea038d5da034b1d9
	.xword	0x66fc54e76fd15bcb
	.xword	0xfa0f300b2067e153
	.xword	0x371f4a871baf83ef
	.xword	0xd7291f15b49a575d
	.xword	0xd637c660c69e1b0b
	.xword	0xbf1c3d513cf599da
	.xword	0x51e138f0be059cd8
	.xword	0xf763cd4a52bf3238
	.xword	0xf103a43dc8e11e69
	.xword	0x96083c8951d7b29f
	.xword	0xf30e6977ae3ef078
	.xword	0x0c1787fdd9009b51
	.xword	0x6ed5c972f3392d4e
	.xword	0xa6f7814470ae5bb8
	.xword	0x6956e2baab9c802b
	.xword	0x6a81efa2250ba9f4
	.xword	0xd24c365a332b31c7
	.xword	0x472d2d982ec0893c
	.xword	0xaeb7609f3652cfbb
	.xword	0x205511a15895a4f5
	.xword	0x194232b43313156b
	.xword	0x5ff3a3b6756e96e8
	.xword	0x4746712174c89c71
	.xword	0xeabd394a00d985f5
	.xword	0x3303e029eb25dc51
	.xword	0x993b0adb8a67c6cf
	.xword	0x9dec6b01bc5a2ecf
	.xword	0x222e33d55940225b
	.xword	0x6f381257c3a2a89c
	.xword	0x83de39921a6b763d
	.xword	0xb2084c8af9092cfc
	.xword	0xe8ae72cb7f42e006
	.xword	0xdaf437e49064af22
	.xword	0x807c4523edf66844
	.xword	0x10faeb2ce93ce565
	.xword	0xd7b71b34c825ee37
	.xword	0xe015f5b7b5b56411
	.xword	0x344234e18ab27484
	.xword	0xb1049c11b419074f
	.xword	0x0f5d2656c1f1660b
	.xword	0x02f3b8753c8b03cb
	.xword	0x0c71a868af836313
	.xword	0x8c91906a736277b1
	.xword	0xbb5f36ed0a3becc4
	.xword	0x5a9f0879172fa345
	.xword	0xa05659031bfbfc8a



SECTION .ISEG_3 DATA_VA = 0x0000000030100000
attr_data {
	Name	 = .ISEG_3,
	RA	 = 0x0000000030100000,
	PA	 = ra2pa(0x0000000030100000,0),
	part_0_d_ctx_nonzero_ps0_tsb,
	TTE_G	 = 1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 1
}

.data
	.xword	0x3b55275f1bf2cfac
	.xword	0x6c0d14d31873edd4
	.xword	0x11bff816c5e9f245
	.xword	0xd86e41824d48605b
	.xword	0x66d28ae545a12174
	.xword	0xf10e74d6f2042eb3
	.xword	0x5ccad7d2c3a9744a
	.xword	0x771cb642c02e4506
	.xword	0x79e5341d67cc7b34
	.xword	0x2fa14115c08fb938
	.xword	0xd16d4940b907315a
	.xword	0x8bdaefcdff979d46
	.xword	0x4b4b8101cc341515
	.xword	0x1aef9bb8db9bfba3
	.xword	0x14724f5820a3e0e7
	.xword	0x9ce9bfb2434b4015
	.xword	0x0475bc6309abb321
	.xword	0x6a8303430ddfa630
	.xword	0x4e829fe4f65ae33e
	.xword	0x14e1362bdfc6b62e
	.xword	0xcda83f4dc7b925c5
	.xword	0xc22237a4ba88f2a3
	.xword	0xec201d1d2e0f925e
	.xword	0x1a3b118ed120bad1
	.xword	0x2434059fbec556fc
	.xword	0xbdae8f9fb3fbd4c3
	.xword	0xfca8a112103bea78
	.xword	0x63a8d3559095cf36
	.xword	0x7926f556bc6843cd
	.xword	0x32b7fe82da46d884
	.xword	0x82aad3fdb33afc39
	.xword	0xb5e9d8d5cb9abe74
	.xword	0x42c52c13935e212e
	.xword	0xca64ea190c786fde
	.xword	0x73ac4b5af6aaa433
	.xword	0x08936a46ba8ddec2
	.xword	0x005e609c15b4e58b
	.xword	0x01d0adf301e8c735
	.xword	0xbdaafc28dd1c5cd1
	.xword	0xa565d3170283e2a4
	.xword	0x9978d32e7ae28073
	.xword	0x636c0646cd778488
	.xword	0x6d8b33d8913ba1f1
	.xword	0x8eaf2ba5bd636b4a
	.xword	0x5ab529f811b55303
	.xword	0xe3b7a4816a9e3c1a
	.xword	0xd56a851707dcb242
	.xword	0x15bbe48aaca60f0a
	.xword	0x03aa025d2a6add5f
	.xword	0x1aa654a2749aa19f
	.xword	0xb3f37041ac1c22e9
	.xword	0xd0d387438b831518
	.xword	0x33813f3192ef44ea
	.xword	0x9dc916d487571b95
	.xword	0x2d4bd77e1654211a
	.xword	0x4537fc3ad23bffa0
	.xword	0xe4c386f947f331b7
	.xword	0x24af7bbfe5c402a0
	.xword	0x4a1be9de2bffafe8
	.xword	0x67d43e0f6e80cf80
	.xword	0xd66e582d1b3191a6
	.xword	0x4184b92de7a0d606
	.xword	0xb36a60b397a26b15
	.xword	0x6cc8b971fce72890
	.xword	0xb60776f5185e2883
	.xword	0xfc0fb0a0b8d1680b
	.xword	0x1e3d40040c53eaad
	.xword	0x1f9cfa7f2c40041a
	.xword	0x83ec4b75e5e57ef7
	.xword	0x7839b577fc10b259
	.xword	0x1b50201dc1c1a24a
	.xword	0xa822084f59249d80
	.xword	0xd53f9bc00cf626f2
	.xword	0x43690dc4178d7fff
	.xword	0xc212adc46bacd545
	.xword	0xf8a9c3f174c847eb
	.xword	0x4129ac3980b35a34
	.xword	0xfe39b3e1057973d6
	.xword	0x7aad47a320f35515
	.xword	0xa37e7f0a4820a28a
	.xword	0xe2a35f87fc28511a
	.xword	0xf6ce6e58ba7c0b97
	.xword	0x1878ac8acced174c
	.xword	0x6f2fb9a3ca21e66b
	.xword	0xfc9574e4e908ebba
	.xword	0x5cf09ed34d4303da
	.xword	0xc5b5b4a6f50d83ca
	.xword	0xf4c96b7f2666c87a
	.xword	0xd3199bed3052d6e5
	.xword	0xfd6deea929788683
	.xword	0xc0337835a44169c0
	.xword	0x4df8a87c637f3b72
	.xword	0x4dde9b182ef75af0
	.xword	0x7312d4c844e28f2e
	.xword	0x01524045109f01b4
	.xword	0x4355337723b4e8b0
	.xword	0xcda0b0bd97a67c21
	.xword	0x425146db759f0de2
	.xword	0xea0b4751e1bb0466
	.xword	0x2fe0e3ae770caae4
	.xword	0x8c56a87b222edf17
	.xword	0x07b6c9c113ca7d69
	.xword	0x65a6676c0ba9149f
	.xword	0x0f57e8a43bb24d4a
	.xword	0xb1f1dadb9c4bfdd0
	.xword	0x10a0223a0b0bf174
	.xword	0xc21b05436126999d
	.xword	0x08e6e354707a801c
	.xword	0x93973b6c89e4869e
	.xword	0x119a0cf1feb7aaed
	.xword	0x7e308ecfcb3c900b
	.xword	0x196baed6c0f1cb9d
	.xword	0x41cdecebe8633473
	.xword	0x97985315e3c4ff76
	.xword	0xf1ddba6262bb137d
	.xword	0x72c75fde94a51b37
	.xword	0x6fa3c4fdc7781860
	.xword	0x0eb650c456ed2a89
	.xword	0x49a707a2b9377bba
	.xword	0x29c9bce406eea905
	.xword	0xe3d3a8bedcd7bab3
	.xword	0xdcceee578b9d9a4e
	.xword	0x4ae78c51032eb5f4
	.xword	0x1f3a5747353857fa
	.xword	0xab437df12af651be
	.xword	0xc01c01e3ff55d124
	.xword	0x95ad6ae371eaab38
	.xword	0xf4ec0455771cc282
	.xword	0x2826c856c4fb7ac2
	.xword	0x9fd11abbe436fff8
	.xword	0x483abb7b2f229b82
	.xword	0x48121befbb81d24b
	.xword	0x4d67f522a4817bfb
	.xword	0x03af4a663b9bc5f9
	.xword	0xd624c774dec63612
	.xword	0x2cca3dc3f491f0bc
	.xword	0x59d3f8496a76a4b8
	.xword	0x8463c9eff77d8c22
	.xword	0xd34e4a9095f75b0a
	.xword	0xaccd6f76e5d55073
	.xword	0x17df71d6269a8d95
	.xword	0xcdeb7d9236fa0151
	.xword	0x326fb17dac4029fc
	.xword	0xc055741af8df3a58
	.xword	0x0c027dfd8a77f96f
	.xword	0xf729e8774fcfc806
	.xword	0xd2aed3c0389dcf94
	.xword	0xb2255128cac72833
	.xword	0x448fc69ce9ab2de6
	.xword	0x0fbd72266217ea32
	.xword	0xef66802f6fbc5f7c
	.xword	0xf22d26df5b386933
	.xword	0x3a256fa8d56d52df
	.xword	0x4f3295586f674743
	.xword	0x8cdeecb798a5e717
	.xword	0x4ca0fdbefa0561d1
	.xword	0x60a4919193d825dc
	.xword	0xaf53a0be840bbc73
	.xword	0x1f461f32383642a7
	.xword	0x41a67fbbfaa21056
	.xword	0xf63ac28ca90ac928
	.xword	0x3eb36cb4e9296d04
	.xword	0xa31fda73c45920ce
	.xword	0x5cd52ddd6c9eb05f
	.xword	0x41d8e9f0e75c509b
	.xword	0x729db28e6c020aff
	.xword	0xeb8d48e4261bcb47
	.xword	0xb574db7517026ca6
	.xword	0x8875731e88379c42
	.xword	0xf204e41e60437be6
	.xword	0xfe841c97f633d287
	.xword	0xec240741a09a2963
	.xword	0xf6e64f6f7f9a0646
	.xword	0x130de13993bfdfa8
	.xword	0x59c31952bc899c00
	.xword	0x42e8efb1467f4923
	.xword	0x3159a30b29e61ba4
	.xword	0x829390f19e6bc7f1
	.xword	0xc7f1f928d1d973c8
	.xword	0xb515cf34dd9d2645
	.xword	0x9c7359964034270c
	.xword	0x918d7c53d988b8a8
	.xword	0xff18220fa63fca44
	.xword	0x5259f5fe5c64f7b6
	.xword	0x1574d0550273d8cb
	.xword	0xa7681e1056555015
	.xword	0x14c41b45dd26554b
	.xword	0x60842cbcb27bf5e9
	.xword	0x1ccd68b1b2a6ae0f
	.xword	0x1ef8b2ee9f9aad71
	.xword	0xb1599da2b1b54e36
	.xword	0x99faa0a226d041d7
	.xword	0x1d6f8598bfe161a9
	.xword	0x61058f22558f9a9a
	.xword	0x8d29b210ca75be8b
	.xword	0x0f9202ea9d785127
	.xword	0xab2ef37d550e43c0
	.xword	0x7ea9551c7e74ce66
	.xword	0xdddcd1c14da9b6ea
	.xword	0x8328938b5bbf962c
	.xword	0x95f936a7ee1c8062
	.xword	0xb397f2a7626d7afb
	.xword	0x32594fddaaee69db
	.xword	0x358bfcccd5050948
	.xword	0xec97488a53735b7a
	.xword	0xfda6d3e47d6d8d29
	.xword	0xb4a975448e89d4df
	.xword	0x829d18a7e2e76147
	.xword	0xfe33c06369271338
	.xword	0x2c816ecd7763fedc
	.xword	0x6daac69df679c041
	.xword	0xafe057e4bcecadc1
	.xword	0x5c994b39d72a34a7
	.xword	0x6740091f4023ad3e
	.xword	0x3d9a25532c8be9f8
	.xword	0x82ec01c3acecf59f
	.xword	0x14f87ba11fe00cab
	.xword	0xa3ebb4e0b37b5511
	.xword	0xab6eb65c2c4ef6c6
	.xword	0x4019c988933734e5
	.xword	0x7f36522a4eb93ede
	.xword	0xf95411843a6fbd55
	.xword	0x022ac4c9e4c9c322
	.xword	0xac7134c4e504c3c7
	.xword	0xbcdccf7a3efbe46d
	.xword	0x667ec4e223bbbef9
	.xword	0x308f6c5fd15ba0c1
	.xword	0x6e12801435bfdb42
	.xword	0x52ce026cd90f0b2e
	.xword	0xbfb784049152e1e2
	.xword	0xa6d55c2bd8f42c09
	.xword	0x71821a001793e1f0
	.xword	0xe0e9316b40092552
	.xword	0x2b9e49afee6a7e28
	.xword	0xf488f8c10cf04da2
	.xword	0x10eb3444fc0bd6d6
	.xword	0xbb1177e7c187a6cb
	.xword	0xf702966cc2e71aef
	.xword	0x9fe11d791510fed1
	.xword	0xdb3ddda1d01b224d
	.xword	0x3af3c456d527caab
	.xword	0xaf226a4524e73f5c
	.xword	0x54f792f4881aebbe
	.xword	0x1c45a785747a81c5
	.xword	0x2cc64b6b112aeb99
	.xword	0xc90b3d6f41daa419
	.xword	0xe00dd53db5944b5e
	.xword	0x7a7c875179098f76
	.xword	0x1b18e0d12e7a7791
	.xword	0xfbfe043d600be179
	.xword	0xa56a57c5f4e4e4a1
	.xword	0x8093756e0962e39d
	.xword	0xe8ea7ff1130c8005
	.xword	0x193f35cf406a449c
	.xword	0xd53a968c18036f71
	.xword	0xfafd11b096dfa991



SECTION .ISEG_4 DATA_VA = 0x0000000040100000
attr_data {
	Name	 = .ISEG_4,
	RA	 = 0x0000000040100000,
	PA	 = ra2pa(0x0000000040100000,0),
	part_0_d_ctx_nonzero_ps0_tsb,
	TTE_G	 = 1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 1
}

.data
	.xword	0x7c5529752e10f1f1
	.xword	0x4717ddaafbbf3dc5
	.xword	0xfc8ce536846970fa
	.xword	0x6624db6c0fae829d
	.xword	0x50fe138e92c7a13f
	.xword	0xf911e76a28f46d13
	.xword	0xf7b1b5be25788310
	.xword	0x2113b6faeebee2ce
	.xword	0xfe32a1e9f3fd1768
	.xword	0x4f9ae272468ce39a
	.xword	0xf6cccc03a2e01373
	.xword	0xb618bed7a4f22463
	.xword	0xbcd147801a27d6f3
	.xword	0x3ecc0bb316d44bdc
	.xword	0xa91dd7ac4c2a19ba
	.xword	0xe8a0d2cae90aefef
	.xword	0xe690c19439cf0523
	.xword	0x711c4db71d994fe5
	.xword	0x14db432451b4b323
	.xword	0xc212e23d820d14aa
	.xword	0x9424746ef06a58aa
	.xword	0x2870595f8114ece1
	.xword	0x01d1f9d928aa34c0
	.xword	0xfaff1946ff3b21a0
	.xword	0xff19ad0fdf293c46
	.xword	0x28e002faae6271e1
	.xword	0x8fb906cec5e12db6
	.xword	0xf0cf5311560675a4
	.xword	0x51d011b032f5bee2
	.xword	0x491e401dbe1c6564
	.xword	0xda39c3ea84fcaa60
	.xword	0xe802f8f4fc451e04
	.xword	0x348a5964dd36c937
	.xword	0x31b33f21d32db7b6
	.xword	0x4439f7d0686d7cad
	.xword	0x58e77c98b00f2fe3
	.xword	0x78605da2ece6bb8a
	.xword	0x97da5c28fbb93b11
	.xword	0xc2af683a711510bc
	.xword	0xaf1e8bda98989e84
	.xword	0x162d5b53312ef4ca
	.xword	0x083df185455cf785
	.xword	0x8c9e2835ca58c08d
	.xword	0x662f5036371a56ba
	.xword	0x27113a2cbcfe0a7f
	.xword	0x23e3a28376a38b47
	.xword	0x18fc4efbea4212da
	.xword	0x9d2997271e5cbd95
	.xword	0xd801436ffd313980
	.xword	0x5f8c7066cd0df832
	.xword	0x16320a6d77ae4711
	.xword	0x96788b54a87978c4
	.xword	0x1e29d50963dbc453
	.xword	0xdfcd08bc033b20db
	.xword	0x2a033690fce3a3ca
	.xword	0xc1b95e7a13e9fd9c
	.xword	0xb6134c4ba98b1118
	.xword	0x560dbe293117bf99
	.xword	0xc5f46b90b780cfb9
	.xword	0xac903fdf33a66722
	.xword	0x4689615b66b45fe9
	.xword	0x39a5b61c0f54a9fa
	.xword	0x4055c971e69fb1f5
	.xword	0x64e0fee4560caf12
	.xword	0xb875f800f2450fa4
	.xword	0x90e2d40a8d3b0a17
	.xword	0x957268549922a8c6
	.xword	0x74f49441525ca1fa
	.xword	0xad3b6cac60b85d7f
	.xword	0x363f0fc9c8de67aa
	.xword	0x2147db3e17ed2a83
	.xword	0xef09839e472bb053
	.xword	0xb8d19808c28b916a
	.xword	0xad0e2430c726084b
	.xword	0x246b51acf20d6cbb
	.xword	0x1a94fbc72f5626fd
	.xword	0x03d8a628e8fd49a5
	.xword	0x632be69a79681b6f
	.xword	0x145652e437d1fcc4
	.xword	0x3277cf1207db82fa
	.xword	0x51970f452258ce72
	.xword	0x5c68ea4923ba2260
	.xword	0xb8a8560f48e468de
	.xword	0x8257d623b999028a
	.xword	0x25a11f4a85230fb1
	.xword	0x18256a84d90b2c6a
	.xword	0xbf00460184def0a8
	.xword	0x2f4e89fdf699e701
	.xword	0x4b99905fca4f58a1
	.xword	0x757f2bf8bea5d126
	.xword	0x1622d9748d5f5cff
	.xword	0xfb96f233db421dba
	.xword	0x08f47813b53757ea
	.xword	0x5e21cda4efab102a
	.xword	0x044b8f9752046816
	.xword	0xb97092f63f89da8c
	.xword	0x751b69ce785d6795
	.xword	0x0534b373946d9b91
	.xword	0xf84bd8c6e8a39f4f
	.xword	0xe4ace4c328803777
	.xword	0xe655d0687d9ed12f
	.xword	0xba07a5140a650d1a
	.xword	0x438bd5f731ccf872
	.xword	0x9dd660796c583fcc
	.xword	0x5998ddc0b562c75c
	.xword	0x0667c6d8e73ea665
	.xword	0x8fe4209249ac0420
	.xword	0x5dc9f8d0827ef9de
	.xword	0xaa6b07982354b2a1
	.xword	0xe74423bd17ee115d
	.xword	0x60888af722107f98
	.xword	0x18a89940a0c054d8
	.xword	0x82436c9576bc27a8
	.xword	0xb3a57579f7fced4a
	.xword	0xd5e1afa8d10285e7
	.xword	0x84f4a5ec7b40398a
	.xword	0x0dbb3142e55206b5
	.xword	0x369ebbd8a9fda81a
	.xword	0xed2aaf4d00c1960f
	.xword	0x59d8de87002e7cf3
	.xword	0xe30fea836f8cc61f
	.xword	0x9490b2f3a216cd5b
	.xword	0xce6043e8702969bd
	.xword	0x28e6751b35175b85
	.xword	0x3bf42ca4434c1663
	.xword	0xbf776f6e60e2c2c3
	.xword	0xffc9e223470336da
	.xword	0x0525182094180382
	.xword	0x1efead592b2e83c0
	.xword	0x5bd1a8b6a1c8b621
	.xword	0xc0c5813f228b5749
	.xword	0x1a40d10781f9f081
	.xword	0xc375442c15273d96
	.xword	0x7abdf3aaa2577433
	.xword	0x1a6ebd978fe5c3a4
	.xword	0xc9dc669c31d91047
	.xword	0xa8c94a30404be9f6
	.xword	0x729676223633bef5
	.xword	0xdbb25ad851a67a77
	.xword	0xf81b4afd1a746497
	.xword	0x2447857fe670c280
	.xword	0x12bd1fc36d2d5293
	.xword	0x31d170872d7bf5cf
	.xword	0x61d28b8595feaf0f
	.xword	0x1fd542c1107fa955
	.xword	0x33fc4cdc2ae486c0
	.xword	0x1ab3da2ae2479af2
	.xword	0x658958e82cdb92ea
	.xword	0xdedb37d9829605cd
	.xword	0x015a7aaf700dd01c
	.xword	0xf1f8eb01a8b441a9
	.xword	0x1dd1d14bfc121e07
	.xword	0x033cd78acb101b52
	.xword	0xcbd66613ee084ba1
	.xword	0x5beaad6685d58861
	.xword	0x2bd98cd57545fc1e
	.xword	0xf52968e5069367e9
	.xword	0x240b0d0de701cbe2
	.xword	0x2338753ee34b4c2b
	.xword	0x38401e81443dc35e
	.xword	0xc57230ec8b96a98b
	.xword	0x9d33758a4e7f5008
	.xword	0x9b0aa8458ec29734
	.xword	0xa1fa98f16df9f345
	.xword	0xeefbccd26b2cafe2
	.xword	0xc49af8dcf026b26f
	.xword	0x5fc827c309de5066
	.xword	0xab3054ac685b8378
	.xword	0xdd19b2db2f7ed1e6
	.xword	0x8fb262618bbd81d3
	.xword	0xe70a958919753562
	.xword	0x5fcbbff146da6b7e
	.xword	0xbaf6cc47e76f3b90
	.xword	0x443f47509b84c386
	.xword	0x5ba0c6d2d6a72cc8
	.xword	0x8620ad6116c2112a
	.xword	0x05042377dcfdd0aa
	.xword	0xddeda8731fa2d362
	.xword	0xbd70a7ceb27d1d12
	.xword	0x448ff333b61ad182
	.xword	0x1a6f0d0f77d2efe3
	.xword	0xa8057f118417fca1
	.xword	0x27161f24d85933b6
	.xword	0x2dc58232ad548852
	.xword	0xfbf2be9e8680b12c
	.xword	0x98967b4e815accc3
	.xword	0x3c03e5e4650b1bac
	.xword	0x9f1d00fda762fc7b
	.xword	0x1bc323671b6f8cf2
	.xword	0xed0e5cffc6d5e226
	.xword	0xd3dbdaa29ca9ce34
	.xword	0x22f2197af2b4b0c4
	.xword	0xe5df03b0eaa7dc92
	.xword	0x1b6e9dfaad2e9b03
	.xword	0xf7e5b137ac02ebee
	.xword	0xce67405b69b66288
	.xword	0x75408a02491b9768
	.xword	0x2578813862f9c014
	.xword	0xf75a54649963fc4d
	.xword	0x23581799ed91f68f
	.xword	0x2502fc53569fb8ab
	.xword	0x180219414cd3308f
	.xword	0x587972d91d3dd7d9
	.xword	0x41bbc93a30699533
	.xword	0xabbcff2e414cafba
	.xword	0xc737be71c587448e
	.xword	0xce08a28402a0bb5d
	.xword	0xa126a79ff6065286
	.xword	0x774a356906fcd511
	.xword	0xd7600c802cbbaea9
	.xword	0x7c4a54e88f064b5d
	.xword	0x07cd5453eecd749c
	.xword	0xfe3114f6a230b529
	.xword	0xa8b19d3df1674ec5
	.xword	0xeb405f983c75cfa8
	.xword	0x12927ad35842f935
	.xword	0x7c63efb4c859fb12
	.xword	0x42d7756f1051d809
	.xword	0x5691903a821cfabb
	.xword	0xd96184afb8b99b10
	.xword	0xf4ed2c7512b28e61
	.xword	0x2a5b75f40a95f55b
	.xword	0x11edea741095ef6f
	.xword	0x8e2930cb3bd2578f
	.xword	0x598d482ba7325992
	.xword	0x2f010c202df69643
	.xword	0x068450768069db0b
	.xword	0xa70bda0475764547
	.xword	0xf576fc3ce5c77ddd
	.xword	0x681d529075355b7c
	.xword	0x411ee3139af9aeed
	.xword	0xe3d287eb84f7124c
	.xword	0xe55d62f7ab2b642f
	.xword	0x0f726b034fbe07dc
	.xword	0x707775e651be286c
	.xword	0x2caef27dbeae16ce
	.xword	0x5922dbc62ed23be9
	.xword	0xc4e4d61650ebc7d4
	.xword	0x032de21e59f32e67
	.xword	0xa4044dc16e31e06e
	.xword	0x2e1038cadfbc1e8c
	.xword	0xcbcbee99ec1af304
	.xword	0x0c12c1e7f840831b
	.xword	0xda3d80e213912239
	.xword	0x624d1d9dda7c1bf4
	.xword	0x7f5f50b710111878
	.xword	0x3c07415731709656
	.xword	0x0199a3f7e221fbc6
	.xword	0x4368639babd62756
	.xword	0xf595b4603bfe68dd
	.xword	0x9937b7636a966aba
	.xword	0xd4066988c3fe033c
	.xword	0x8c40dab218d78fd3
	.xword	0x04c9e20785fa573a
	.xword	0xdc6215364f55cf84
	.xword	0x14a8e632548217b9



SECTION .ISEG_5 DATA_VA = 0x0000000050100000
attr_data {
	Name	 = .ISEG_5,
	RA	 = 0x0000000050100000,
	PA	 = ra2pa(0x0000000050100000,0),
	part_0_d_ctx_nonzero_ps0_tsb,
	TTE_G	 = 1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 1
}

.data
	.xword	0xa8f7e4cb43700655
	.xword	0xb491c724ff7fdd57
	.xword	0x0d919a5dfc28d550
	.xword	0x76d21fa09ad2615d
	.xword	0x587750ef8a897305
	.xword	0x86f254e4f6a4c882
	.xword	0x51b700a4a4cd3ba7
	.xword	0x25466191f3a1d4c5
	.xword	0xc9a6bf50d72f575b
	.xword	0xb001c62c179093f1
	.xword	0xd6ae0d69aa21fd4e
	.xword	0x9b45c02777dc7b8a
	.xword	0xbdf79498f1e12f79
	.xword	0x3e0856eaf3f6d914
	.xword	0x63362043e2846466
	.xword	0x97ffcc37cf3f8fcc
	.xword	0x7c9770d7af8b4530
	.xword	0xf2d37dac2287c3a0
	.xword	0x5a5f05c441107f25
	.xword	0x076cf655a9504a81
	.xword	0x7f7902e20fc13486
	.xword	0xb304eefb859b6133
	.xword	0x14b70ecad72749cc
	.xword	0x5aebb15eb698b8c2
	.xword	0xf49fd658fe6094d3
	.xword	0x588ed568247f2988
	.xword	0xa3f13018ada942c5
	.xword	0xa7404417bbe8fa88
	.xword	0x3570aa0d6befe4e7
	.xword	0x334334e1ad555460
	.xword	0x184c490ea632baa7
	.xword	0x2ff6fab171a1f46a
	.xword	0x9d3baec6b4237319
	.xword	0x676b5ad548616036
	.xword	0xd646176dc5e21b20
	.xword	0x7a03ae38c5ab0f7f
	.xword	0xef461ab3784632fc
	.xword	0xc9f8299a39d6c4d2
	.xword	0x66185fc3f94539e3
	.xword	0x25a6d0a8cb3f2df3
	.xword	0x046e91147905c07a
	.xword	0x01be60355bcbb09c
	.xword	0x718719b573a76bf2
	.xword	0x063fa59b69a17d01
	.xword	0x26cc04413275abcb
	.xword	0x26903f8d662e3226
	.xword	0x02c8305a4e0b8aeb
	.xword	0x19a5c8c3351f9ba8
	.xword	0xd7db6d6c583a0059
	.xword	0xbe8df204ab2136d8
	.xword	0xbd108cbdb8927257
	.xword	0x23901353ab8dcad6
	.xword	0x81887b93124517b2
	.xword	0x8468f1eb73ef584c
	.xword	0x88d903301dc8f14f
	.xword	0x28e9cce687ebadfb
	.xword	0x19b21d619121016e
	.xword	0xcf216ef1dd120eec
	.xword	0x4958531493608c53
	.xword	0x0eb03825b674d9f4
	.xword	0x282807b4df5d24a7
	.xword	0xd724a55f91b8ca61
	.xword	0x72945d900ac4710f
	.xword	0x814315a6e79b23b3
	.xword	0xe0ca2be240e64f2a
	.xword	0xe9e804564e9fcefb
	.xword	0x1133dce1f4d5e22e
	.xword	0xfd762ee1fcbe5783
	.xword	0x3be647dbee82d3a4
	.xword	0x3078b2bd166bd75f
	.xword	0x61d353e70ae1610e
	.xword	0x316aa516861f78ff
	.xword	0x763811b52010388a
	.xword	0x978d454213db1644
	.xword	0x1c644cc59f546e98
	.xword	0x5658029959209c44
	.xword	0x32a3d22fc105db23
	.xword	0xa729869334f40279
	.xword	0xb51cbe69cd20eebb
	.xword	0x678a44426d497353
	.xword	0x1408296e76e5b24e
	.xword	0xb23636d5feac473a
	.xword	0xddce0d0d0f30912a
	.xword	0x59fcd0f3af26e602
	.xword	0x15171bd78739f56d
	.xword	0xd28df4a05e746710
	.xword	0xfb114ee84e0ba12b
	.xword	0xe88fbe830d916508
	.xword	0xec80106b707764fc
	.xword	0x8ac2f93b4af79768
	.xword	0x4836ffaa541018aa
	.xword	0xae14ba8083c50743
	.xword	0xa59f0a6cb54cd39e
	.xword	0xf541e761dd688337
	.xword	0xb0d8ce87bc395728
	.xword	0x734989e1e7283a76
	.xword	0xcff84f5f6b95b3ac
	.xword	0x503aa19ca0a3fe23
	.xword	0x61e135c476c4ad63
	.xword	0x42d7e5efe7f38ca4
	.xword	0x47ea4a8ec23f7abb
	.xword	0x6028c3caaa6dbe73
	.xword	0x24984d7c8e971f2f
	.xword	0xe46fda0cec19abc0
	.xword	0xe34a0335849b3ea6
	.xword	0xbda0ffc467535692
	.xword	0xa88866e6764d55e4
	.xword	0x776abca4b4607c75
	.xword	0xd3ecf67a6445a3db
	.xword	0xda01cda3338b44fc
	.xword	0xdbb4b0bd685d8bd9
	.xword	0x1bea258c7657b329
	.xword	0xa19e689f8510fbeb
	.xword	0x0e28b9cba25d5974
	.xword	0xda7e2d33f6d4c6cd
	.xword	0xc0d6e0323f4794a3
	.xword	0xd032f190e4fa1313
	.xword	0x3055fe3ec6935ff0
	.xword	0x5cf5449b94324584
	.xword	0xd1a7942563f1444b
	.xword	0x1683aab1925e0195
	.xword	0x92431ffd4c97a099
	.xword	0xae6a92773675e29a
	.xword	0x3faa380546302b1f
	.xword	0x9b4b248fb8456ce1
	.xword	0x5c4012f35b947f07
	.xword	0xbbbd779aadc17c77
	.xword	0xc7d40ac66748d8cb
	.xword	0xb8e509671381efec
	.xword	0xcc1d5365f54cb50e
	.xword	0xd9e7a69ae725fbbc
	.xword	0xfaa1c418a853c6d3
	.xword	0xd0991c41e9f1fa9f
	.xword	0x2eeeb73a1e6b9357
	.xword	0x99b38701d2076345
	.xword	0x1bd9d4a44158d019
	.xword	0x7e4c1aaa236b928e
	.xword	0x9b6b0ccb35c1ba9b
	.xword	0x5309a92272b751d5
	.xword	0xea34fca8e41823a8
	.xword	0x68d2caf29add32e9
	.xword	0x482e676266a8d18e
	.xword	0x6cf8870afbc3ce9c
	.xword	0x3f74f481983a0e7e
	.xword	0xfd31be1a0fa64d2b
	.xword	0x7df9e6c7fd1b177c
	.xword	0x12874800ee3a4d0c
	.xword	0x88e03efbd9264a2c
	.xword	0xcbfc01af16e938ed
	.xword	0x671189da282375dc
	.xword	0xbee878ce782b7950
	.xword	0x2b5528c91b1f9bc0
	.xword	0xa160620c3488f61e
	.xword	0x973066f32106e532
	.xword	0xebe07d8aab84909e
	.xword	0x8b1e78d3387d0312
	.xword	0x207848a2bb2f575f
	.xword	0x17e063f55124f7f5
	.xword	0x588e91c3f3ab4566
	.xword	0x4c4ddf50801228bc
	.xword	0x046a3ef4a67ce734
	.xword	0x64a38897ca94f7da
	.xword	0xdb8ed692558b6940
	.xword	0xac4a0c6ebf8d1345
	.xword	0xd6c10c886d4be6da
	.xword	0xb5767aed075300ea
	.xword	0x20e125ac97cca316
	.xword	0x2d0542f57546dc01
	.xword	0xf924038ef6187eec
	.xword	0xc51a1a06604498d7
	.xword	0x35872669becb8ec4
	.xword	0x996fafd24c066e89
	.xword	0xf019c53aae8f5d23
	.xword	0x1c701860a5728fae
	.xword	0xb18878560b879207
	.xword	0x4b30e7e0dd2fbd8d
	.xword	0xa3ada17f1e4052df
	.xword	0x94d69b052cbd0eae
	.xword	0xbb8ffa1be7bd4c2a
	.xword	0x2ff602580c73ee02
	.xword	0xf9b78094088fe3eb
	.xword	0x01d48dcad5aa45a8
	.xword	0x9a884c66fca627c3
	.xword	0x7345cd4a0960865e
	.xword	0x18b49777f17bef38
	.xword	0xa0ee54bbe316c832
	.xword	0xbaa429afbb2e0036
	.xword	0x2d81e9a8f9989e9f
	.xword	0x0d24550b90d4b3cb
	.xword	0x6e2da211638225ae
	.xword	0x7ba1581e2254eadd
	.xword	0x4d7df455df8798dd
	.xword	0x3cc81a4bd4e3fda0
	.xword	0xaf41d83300bbd61c
	.xword	0x02a84c27dff7aeb2
	.xword	0xe6f8c4a8aaa7638f
	.xword	0x100fd3bd5da75204
	.xword	0xf80751c61392dc60
	.xword	0x86285adf962672d6
	.xword	0xb1afcf3e6a80cbab
	.xword	0x4b9fa5ac6dd79644
	.xword	0x3c92d825d949d1d2
	.xword	0x7e0e1980658397b9
	.xword	0x5eff97269868ce04
	.xword	0x820e87cc8bec9c16
	.xword	0x8aac53a875ad4631
	.xword	0x35cb505412d2779e
	.xword	0x6c45b9af395efd53
	.xword	0x0374c73d864cedc9
	.xword	0x6172541284fd4472
	.xword	0xd7f56b8856a571d8
	.xword	0x15249822d5f6b765
	.xword	0xb915e05ec1a8213a
	.xword	0x28b0153f3a4605b6
	.xword	0x66ebb5b76b592adc
	.xword	0x643021e14b17aca5
	.xword	0x831d817eb3fdc173
	.xword	0xef0bbb83e42b7e32
	.xword	0xe593f63303d8a72d
	.xword	0xd8a163dd90ae26d9
	.xword	0x793a76f7c6e24f81
	.xword	0xdabf55e6800bc977
	.xword	0x297252dc50c8e50e
	.xword	0x16b0eab7cba5a664
	.xword	0x5a644b5693a31372
	.xword	0x72e3901956364d6b
	.xword	0x1b6d8f7e6fe117e6
	.xword	0xb724b5005b39512a
	.xword	0x2f87a310f87bf5c0
	.xword	0xcb873f741b87bafc
	.xword	0xd1ffbb7587ed85c0
	.xword	0xb520d7536a6a30ca
	.xword	0xb4b5b8d8b8ae97ab
	.xword	0x96dfbd356bef0fbc
	.xword	0x490579adbd380d95
	.xword	0xd8a64044e702476d
	.xword	0x4fbe8e96a4c565b3
	.xword	0x65a02ebd45887602
	.xword	0xb0e75f005751ee9e
	.xword	0xc0307bd21056e237
	.xword	0x8f0c860b5e74e689
	.xword	0xf57ddbca2d7d2795
	.xword	0x6a8b25f88b740a7f
	.xword	0xe9fc3f9267a9525a
	.xword	0x187760c9c9784435
	.xword	0x4109094e84555674
	.xword	0x25a842bcae4dd045
	.xword	0x1a0eb75fc84fd99a
	.xword	0x0af72db0457d87bc
	.xword	0x52d26cc42e98c9a9
	.xword	0xe52fec5367a27991
	.xword	0x5ccc29a984623622
	.xword	0xbd9e17f70d5993e1
	.xword	0x6f08f904c1d12d61
	.xword	0x9ddfcd412a1d490d
	.xword	0x56bc1702cf1c7641



SECTION .ISEG_6 DATA_VA = 0x0000000060100000
attr_data {
	Name	 = .ISEG_6,
	RA	 = 0x0000000060100000,
	PA	 = ra2pa(0x0000000060100000,0),
	part_0_d_ctx_nonzero_ps0_tsb,
	TTE_G	 = 1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 1
}

.data
	.xword	0xbd5f0e38622d61ed
	.xword	0x9af082b7534a72e9
	.xword	0x6f58f3998e32b3f1
	.xword	0xbeb8af7cde362f14
	.xword	0x7e462b61baf95601
	.xword	0x705ef9f380c01669
	.xword	0xc3b4a9bc93b3eb8d
	.xword	0x1b0525fa4df7dbce
	.xword	0xec2f2645e5d83384
	.xword	0xbe30300237915453
	.xword	0x0f4403e4b119fd23
	.xword	0x18195b3cdbba57e7
	.xword	0x98f617856916367d
	.xword	0xe5f8e5136868160c
	.xword	0x5366db6ba7681dbd
	.xword	0x27e070a6ee30f0d7
	.xword	0xf618ba031b82b7c4
	.xword	0xbf6432c79ec94832
	.xword	0x4457d98b1669e858
	.xword	0x43249653d8b1c479
	.xword	0x738be631c52e6247
	.xword	0x823748d8b770f8ff
	.xword	0xe706a5fa87e3602c
	.xword	0xbd80df6fba77ac58
	.xword	0xeddcdd0f47bacf72
	.xword	0xdebdc4e6f5007b0a
	.xword	0x8c1be19ab6dd452e
	.xword	0x37179035d9a156c0
	.xword	0x66099cb2e47159fe
	.xword	0xcfe7da0224c6f24a
	.xword	0x74a2793f6f69341b
	.xword	0x4480ed2bf8448ba6
	.xword	0x84ce2b3d0222706b
	.xword	0x7d4f37ef1d062462
	.xword	0xf8aa9fa075486e89
	.xword	0xdcc0326c0f49b386
	.xword	0xc6f512640270e590
	.xword	0xbb6298254239ec5d
	.xword	0xab7694f79c75d1f7
	.xword	0xc2032770ebae713a
	.xword	0xd9333d3dc56c9d66
	.xword	0xcdfef57a3b6531ce
	.xword	0xe7ee988ebae9aa32
	.xword	0xb63a8084a280597e
	.xword	0xbfa67a3babbcdca5
	.xword	0x3eea077d291362ef
	.xword	0xbfbd94f0e65dba38
	.xword	0xded06648fa8ee51e
	.xword	0x11167413183cfb13
	.xword	0x01fb18537dac11b3
	.xword	0x4e9cd7ccf86a4492
	.xword	0x1bad9bcd6dc70231
	.xword	0x16300d0d1dcc3e3c
	.xword	0xea4f74d17bf01fc1
	.xword	0xb8b456dfc6a6b0bc
	.xword	0x2dc65cd67b02b729
	.xword	0x884ea10d47c21b0b
	.xword	0x4023ac9794815403
	.xword	0x419a5a701137609c
	.xword	0xdba06432ba82f7df
	.xword	0x3823f84a1920d173
	.xword	0xa3eb74eed8ec57e7
	.xword	0xe492be94527f880f
	.xword	0x2a552aad584935de
	.xword	0xb4552e1ebe9da6f5
	.xword	0xd75e3c61614cc105
	.xword	0xf73be282cdfdf28a
	.xword	0x3768775ea88bf541
	.xword	0x18a7ffc4b14ca886
	.xword	0xa3e29d4d6a11883f
	.xword	0x37e0c9954e2af510
	.xword	0xe01d934b57ab1430
	.xword	0x14ee8c47a9496185
	.xword	0xb135afcc36af99fc
	.xword	0x076d7f7b8131f9c2
	.xword	0x939125dd1ba3a874
	.xword	0xed620d9e622255e2
	.xword	0x4f4e5fa685730c83
	.xword	0x65a8ddd6a5036021
	.xword	0x7baaf5fac03d31f5
	.xword	0xf063c4b79b4d3350
	.xword	0xde5c5efe70b02ed0
	.xword	0x064c147b85be03bf
	.xword	0x99c344d6b70387a2
	.xword	0xf1ea86e46163c930
	.xword	0x488fc1392284ad9c
	.xword	0x9998b053abd994ed
	.xword	0x5a4745b050afa53f
	.xword	0xce1d5fd9c31e5db5
	.xword	0x0de7948735eb212f
	.xword	0xf6ede0677bdf43f3
	.xword	0xbd98631aa22fa005
	.xword	0xdb15503a773d5cf1
	.xword	0x65905940d1f706fb
	.xword	0xa29691eae8975acf
	.xword	0x49027fafbadc0732
	.xword	0x40ca06a016a63964
	.xword	0x96085df340ec8931
	.xword	0xd8bd3b976d5889a5
	.xword	0x456f03ce22239191
	.xword	0x565bd83a5ef84c0b
	.xword	0xff10f1fe49c561fe
	.xword	0x7697256c359690a4
	.xword	0x845d09c4d8815fb9
	.xword	0x9a5277c9f36daab3
	.xword	0x634dec55157af76a
	.xword	0xb408e9f04e4fda45
	.xword	0xd1eed8a2c84f0abe
	.xword	0x7df05a6537c195e9
	.xword	0x27bc1857fc13d3be
	.xword	0x28c059923dd8f0d6
	.xword	0x82797bdc293afbdf
	.xword	0xffb40e22ba759867
	.xword	0x91b82b31934a87ba
	.xword	0xf26afdd0a126a34d
	.xword	0x1cd74184bb19fee6
	.xword	0x4bfcfdee969cd685
	.xword	0x0140be1ba490dbf2
	.xword	0x2e5ad5903ce0fa63
	.xword	0x726d42d9eee7530c
	.xword	0x50e65aee0b9196d3
	.xword	0xbc134ff92d65a371
	.xword	0x85239041ff9c4703
	.xword	0x7a85170b9d6be8ca
	.xword	0xacaf97ba17aec5f9
	.xword	0x73cfdcdc003d65e9
	.xword	0x8646ab4ba00d3111
	.xword	0x6c6f51d631b785fe
	.xword	0x161e33874541ae0a
	.xword	0x0370365314222856
	.xword	0x6796868ca5f764e7
	.xword	0x7e337a0493c2fa27
	.xword	0xc9030f771a86fa8f
	.xword	0x9cc863016be82669
	.xword	0x744bb2bfc03e8b14
	.xword	0x43d36eb431996ed2
	.xword	0xec6d508e45f7fab6
	.xword	0x0a775a90f0c5c8b6
	.xword	0xd13ed9578ccf1ee5
	.xword	0xbf439a5a7e5765b2
	.xword	0x28a80ed46b306398
	.xword	0x3867ad741aff801b
	.xword	0xc56d5fa6ffbe8193
	.xword	0x91f8fb87391a121d
	.xword	0xce28a65f3371224e
	.xword	0xd464c220f694fbed
	.xword	0x3d90f3807814bc25
	.xword	0x66ffb8d0edc89656
	.xword	0xf7794eab3ab43cff
	.xword	0xa2c062f7f2ec5bfb
	.xword	0xbcd8b4d9da0bd3e3
	.xword	0x97912e485a13336f
	.xword	0x96df48ab0137ebdd
	.xword	0x84777c6101454122
	.xword	0x28972620b204c208
	.xword	0xb6fb0ca09619a01f
	.xword	0x6e539f4ac9026c58
	.xword	0x62b5acbd3a911fc9
	.xword	0xfb5237be9c11278c
	.xword	0xeb5ffd1e4057d765
	.xword	0xc788d57bc71739ba
	.xword	0xc077833eeec57e9f
	.xword	0xb5d9581e3b8da6c2
	.xword	0xfd952f8447c29ed4
	.xword	0x215701d62266d198
	.xword	0x79b32e6662882c25
	.xword	0xedf92dd19bf3bf03
	.xword	0xa494f8fbd6600b5d
	.xword	0x248efcd72724e976
	.xword	0xdc22be9964147d7d
	.xword	0xeb13c170777ad7cb
	.xword	0xc2aac7f43e03ae07
	.xword	0x84ba0a3a12841c0b
	.xword	0xa061a16a0d6b55e2
	.xword	0x77dd7f1b51248105
	.xword	0xa7ec359f9789a27a
	.xword	0xa4b9b6e4774f7067
	.xword	0xb2adcc35dc39bc90
	.xword	0x8119a7b5de8db115
	.xword	0x8759d6b740eba8b3
	.xword	0xb8145be1b013aebe
	.xword	0xbd3cd78b555b577a
	.xword	0x79407690d6276d54
	.xword	0xca75673f9b9a4851
	.xword	0x72282c4c0cf76cd7
	.xword	0x6933ba4f86e1a3c8
	.xword	0xe81134b03e72f260
	.xword	0x7aa861140e3146e7
	.xword	0x5c1a957d2adf2979
	.xword	0xdd8f6a1d7e8a1945
	.xword	0xd9d4478c72f75fa3
	.xword	0x31d55ba660eda503
	.xword	0xd05ddc5f080a0d62
	.xword	0xea86e19c5f88cd60
	.xword	0xa83d5428f919bd62
	.xword	0xf0fc89f2637a9c8e
	.xword	0x96a35d33ec167b35
	.xword	0xb16935b263cc6574
	.xword	0x4cbb5edec2fd2024
	.xword	0x7f8459da965210ce
	.xword	0xbc7d6495baccaf8a
	.xword	0x3ea632f5e8b1afd3
	.xword	0xe639cfacc31afede
	.xword	0x0def948edcbb4cc2
	.xword	0x2f38832d4a21e8d5
	.xword	0x7f127b518a05af0e
	.xword	0x7cc4a89f0ab38557
	.xword	0xc794586b7e000114
	.xword	0x41ffe6d4d64923cb
	.xword	0x2e6572a65c329fa8
	.xword	0x266ec653d9dacb40
	.xword	0x9130638a148002a9
	.xword	0xb2bb795f00b17c07
	.xword	0xceb3157451beba51
	.xword	0xfcd1760399a7174b
	.xword	0x9d39e065759106b9
	.xword	0xafb096afd3a04ade
	.xword	0x4f759fbacbbd2f21
	.xword	0x6ab60b9fc3ab27f6
	.xword	0x188fdb89ec37bcd2
	.xword	0x04e64fbe3798ccce
	.xword	0x667b008c7d2febea
	.xword	0xe0981fb5cf969774
	.xword	0xf31f0eb985827548
	.xword	0x34fccfc1c87f0872
	.xword	0x1ee04e021760804c
	.xword	0x734e589f38734807
	.xword	0xa22339d1c18c758c
	.xword	0xa4305f7ae70fda70
	.xword	0x7f00cf9e660a04fe
	.xword	0x80658ab51b2e1b8c
	.xword	0x840bb9cb9c67f426
	.xword	0x59ca0fdf15e77287
	.xword	0x5cd6dcda8148b065
	.xword	0x0780566c1a92730c
	.xword	0x40a72f28b616173d
	.xword	0xb1a186d8987204df
	.xword	0x7ef2f3725604efe5
	.xword	0xe8a95c6b92a575b2
	.xword	0x39cd80a90d3bf01f
	.xword	0xbc4e65ba84de98f0
	.xword	0x1afb1f0e37e249b4
	.xword	0x452455fff07f3a08
	.xword	0x95aca6c37690bdbc
	.xword	0xf7fdec6fa4c1006b
	.xword	0x9eefa57337052753
	.xword	0x8abdb8cf1c5c1c56
	.xword	0x6b389cb3bb3794ef
	.xword	0xf94728c966102619
	.xword	0x9f081fbb5a4cb6a9
	.xword	0x3d87e4e195584459
	.xword	0x7a69b1a5dc26bc51
	.xword	0x2eb9da0695349622
	.xword	0x3d675ce4dffaeacf
	.xword	0xd541604159844069
	.xword	0x9e7424bfec3ae6c1



SECTION .ISEG_7 DATA_VA = 0x0000000070100000
attr_data {
	Name	 = .ISEG_7,
	RA	 = 0x0000000070100000,
	PA	 = ra2pa(0x0000000070100000,0),
	part_0_d_ctx_nonzero_ps0_tsb,
	TTE_G	 = 1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 1
}

.data
	.xword	0x388f762fde2b3b92
	.xword	0xde8cf4ca88a212fd
	.xword	0x1a551b2c7625a66b
	.xword	0x26001f10348b3f08
	.xword	0x7bf9b346420ead1d
	.xword	0x1ea4a0c1e41ab8c1
	.xword	0xbd3927c18743a769
	.xword	0x0d2dcab6d7273e86
	.xword	0x4597e2b551997d33
	.xword	0x855cb08fb859c026
	.xword	0x09607ca86a3638aa
	.xword	0x74f767cc24145727
	.xword	0xaf36325c02feeef3
	.xword	0x6f0434560c0150c3
	.xword	0x18d451d645aaa91d
	.xword	0x1ed1cfd61193751d
	.xword	0x06351c9cb33992d8
	.xword	0xca6bab6360bd4547
	.xword	0x675c127a3361a473
	.xword	0xdc77f0ba4de29bdd
	.xword	0x9b68a1db149a5a46
	.xword	0x97baf393a41ff0a9
	.xword	0x2e5a0b9f7cd99020
	.xword	0x33851231cd60c6de
	.xword	0x333dca1cd5e407dd
	.xword	0xffa86fe730d5ecc2
	.xword	0x7fc92687d6b6467a
	.xword	0x422a53ae3fd2316b
	.xword	0x4655f64252960607
	.xword	0x6c1e3ed30255c5f1
	.xword	0xef02cbb5820e5ffe
	.xword	0x99d3e5b712fc2b9c
	.xword	0xbcb05e8aaa4acf23
	.xword	0x83c60f39191d7777
	.xword	0xaafd9da7df471fc0
	.xword	0xc9d6cbaa4170d340
	.xword	0x095c1f2df99b21b9
	.xword	0x8f180fd9387b1098
	.xword	0x3a80b729374b2764
	.xword	0x6b19adb5bcb445c9
	.xword	0x39bc6febca2993d7
	.xword	0x24546065a74afe6f
	.xword	0xc755af7856b9fb7b
	.xword	0x3015f755943433e7
	.xword	0xa1f70cfe6f526374
	.xword	0x08bff5c5a0bf8225
	.xword	0xbffce4c351cd11df
	.xword	0x3851b60a87432d02
	.xword	0xbf94fa5aa49926f1
	.xword	0x9abd992b12543d8f
	.xword	0x0f5fccf751a0d789
	.xword	0x8e54b8c8c4e79aca
	.xword	0x930da273ebc03d15
	.xword	0x0f0d218b53981b2d
	.xword	0xf0918cda72f7344b
	.xword	0x60d8313fc538dcec
	.xword	0xbccff81fdd2341ce
	.xword	0x715fa63559ef16c2
	.xword	0xf85a6b68c32bec18
	.xword	0xba32c65a5e47d066
	.xword	0x9371a49f33c0de98
	.xword	0xdcca9bb7ce0cb692
	.xword	0xd95a996882ab17e5
	.xword	0xe6382f931236b121
	.xword	0xe9b991f42e7f4f2b
	.xword	0x57016cfe9a0655c0
	.xword	0xaf01fadf39b5fb76
	.xword	0x542703b320d9b9a3
	.xword	0xeecd87367e6bf491
	.xword	0xd981e3985b718a7e
	.xword	0x1c79ebc1739a5520
	.xword	0xc014cbfd25280582
	.xword	0x2e1e8efd41fd08ee
	.xword	0x3e1f8016bc0999dc
	.xword	0x891ac50a2f246208
	.xword	0xa7766e776771f1dc
	.xword	0x7fc1b0b5bf8fb1cc
	.xword	0xd18ac403de84e061
	.xword	0x876626ce7abded91
	.xword	0x9c1b1e02db0ae6dd
	.xword	0x4173bf1d9dbe0b28
	.xword	0x80d7a5e656d891e4
	.xword	0x65444effc251b5c0
	.xword	0x61ddc00f5f13435f
	.xword	0xcb9f08ccd7bbb8fd
	.xword	0x53ca272c012e570d
	.xword	0x27a908c5bb922769
	.xword	0x56513c35c3a7eade
	.xword	0x2b0c643b3bd4cc28
	.xword	0x57c768bccd3cc0e7
	.xword	0x16c8e35b250d90ac
	.xword	0xdb022268f4c70158
	.xword	0xd925909cb2a00ec0
	.xword	0x09a0179ec6b17fa8
	.xword	0xa946704cbc27451f
	.xword	0x3be8bca773e02012
	.xword	0x381958e2e17af941
	.xword	0x932f7edf80ffd59e
	.xword	0x3026680bce8e1f37
	.xword	0x3e942e3985e6db0c
	.xword	0x4196c45bbc6358bb
	.xword	0x549b93c5ef657c9d
	.xword	0x707cd9bbf754e018
	.xword	0xa89c4d16645c5e01
	.xword	0x70e208f98adc7611
	.xword	0x3b5e10bb57d9535c
	.xword	0xd788e5be88b29526
	.xword	0xd5c4ba20f9ca6ec6
	.xword	0x58a70dff77cbd06e
	.xword	0x17bb9c93ef55d054
	.xword	0xae4f6257a00688bf
	.xword	0x6097d8dbb922c5a5
	.xword	0xf95defe003132d68
	.xword	0x5b345f321d485f41
	.xword	0xc6f5a185547cca54
	.xword	0x967719f55dcaa6e5
	.xword	0xf90aaca417bce11b
	.xword	0xb80a184ab2dd97e6
	.xword	0x6b18883c9ba978e3
	.xword	0x8537e7136d4d6524
	.xword	0x99ae49be700e22e8
	.xword	0x474befcccd10bd77
	.xword	0xdc932b6f2356af04
	.xword	0x68c8f1f3f71581df
	.xword	0x105962113a4eac65
	.xword	0x46ee15573db03258
	.xword	0x390c8742222ce8ee
	.xword	0x7faeca16830d1f34
	.xword	0xb39bcbdb753769f5
	.xword	0x2137b4ca65d2331f
	.xword	0x307e984352104838
	.xword	0xd9711a8d1a7ec731
	.xword	0x234843104a06cb94
	.xword	0xdbd860bb36f60525
	.xword	0x336dcc2226475579
	.xword	0x10ea9bd6e2393cd0
	.xword	0x48ccdcfec5264e60
	.xword	0xc273428aaffe29ea
	.xword	0x131e81611b43955b
	.xword	0xadb1a15641c75d16
	.xword	0x0e46e8582b6f642c
	.xword	0x7e3d681fe746cc19
	.xword	0xbd1e6a51944f5d6a
	.xword	0x65ecac59ba492490
	.xword	0x44c44dc98d7f90c5
	.xword	0x0058c277c0589e85
	.xword	0x192b0f5022aeab58
	.xword	0xa8cd6b8cf5f2a9f3
	.xword	0xb130634ee220d976
	.xword	0x029b2e47f9761caf
	.xword	0x92a4dc0eb577da26
	.xword	0xfc9b428c1c774a35
	.xword	0xde594d4de8af0435
	.xword	0x4e75643c51bdd2f7
	.xword	0x2ad3b49a3b966826
	.xword	0xb03dca20c69201a5
	.xword	0xfe96fe947205a8e3
	.xword	0x59eee5263845a4f2
	.xword	0x694f0745aabdaee8
	.xword	0x26fd1267fb2a7320
	.xword	0x205cbebf01ba3956
	.xword	0xf2f13590b89ebadf
	.xword	0x8af49dd991ce81ca
	.xword	0xacf5b012a2755d1e
	.xword	0xd41e06f3db1e79be
	.xword	0xe1660f77bdc0d9bc
	.xword	0xabc8ac8a2494ad3d
	.xword	0xf6fb32705b41263c
	.xword	0xbf5672a954addb6e
	.xword	0x3afc7849a8a90c75
	.xword	0xc1c522fc6a6d957e
	.xword	0x26905ae36746734f
	.xword	0xbb350a3951b49ee2
	.xword	0xdb42e2e111fd6247
	.xword	0x1f766b3e1b4da016
	.xword	0x0b21e3cd17589ff5
	.xword	0x0c260f22504ad3e1
	.xword	0x3829275e94ff0b1b
	.xword	0x00054e04a7bdce36
	.xword	0x59e5ec012a1b3f23
	.xword	0x667d2e22a041f183
	.xword	0x2f293f26a9ea1f23
	.xword	0xd004f9c5dbd1910f
	.xword	0x4b2b0e0427f49062
	.xword	0xc99b88fa03e393b3
	.xword	0xceba946a8dee0e07
	.xword	0xc8bfe55f311740c1
	.xword	0xed5e5f068fa51b9e
	.xword	0x050476e6ab31abce
	.xword	0x7f7f8a7d3e9ea19d
	.xword	0xb928ac079febf8bf
	.xword	0x28a2c7b1b51d8e4a
	.xword	0x9bdf14a2a55745ae
	.xword	0xc47a2c6c401fb02d
	.xword	0xd723a7b86755bbcf
	.xword	0xc10799ea4a5a97c2
	.xword	0x1618612bc8e9cbc9
	.xword	0x25195130a775bcc9
	.xword	0x506621e2dbe10d43
	.xword	0x7b76d2502e732002
	.xword	0x3068db1b4e32f446
	.xword	0xc8c3f5135a9c4e0e
	.xword	0xa574143a02512f1d
	.xword	0x9b8e9d8e3fde21ad
	.xword	0xa9d64845363db9a7
	.xword	0x251408684ad7826d
	.xword	0xc4ef45678e3227db
	.xword	0x4e76ec8a0d7ee131
	.xword	0x86b3f6feb35b7fa6
	.xword	0x7668b2b9cdc1718b
	.xword	0x4464adf5e8af4dfa
	.xword	0x592d2e618bf04151
	.xword	0x7b3ba66b118b334d
	.xword	0x9463025fc4a7bf19
	.xword	0xf2efa15f0829453b
	.xword	0x224e84c82e615bfa
	.xword	0x64ea69c7ee7cc455
	.xword	0x571d34e3b11f611c
	.xword	0x5ac694c43ede769a
	.xword	0x524fb1ed8e6d0df8
	.xword	0x2355dd9797f48ce5
	.xword	0xe6ea6fe63557603e
	.xword	0xc5688f36519c45ec
	.xword	0xc9fabaf67b880bee
	.xword	0xb3adf10d8e904b9a
	.xword	0xfc85f5c997c27302
	.xword	0xa88e14c86ce8e1ae
	.xword	0x7efff10749b29fe5
	.xword	0xed1e9e99dd3ce3c4
	.xword	0x39f81003d87dde40
	.xword	0x7590e9df4ed968a2
	.xword	0xdf348a66ea9f0545
	.xword	0x4b9e32a4a8016c6a
	.xword	0x944365b3d77f2272
	.xword	0xe0665d247a073c5f
	.xword	0x0815b402b4ccb9cf
	.xword	0x0a535ddc61b3f24e
	.xword	0x5279a39eb39310db
	.xword	0x0ccb0b63928ba21f
	.xword	0xb0f6e59ff804bf1e
	.xword	0xabfda1299ed88c8a
	.xword	0x3e59305b10dc4f7f
	.xword	0xb71d553bb531f5c6
	.xword	0x9b6e4e2f7a5ea917
	.xword	0x9b4a03ecbbd1b9cf
	.xword	0x69ec37465e983196
	.xword	0x1f67ec4b8642a2e3
	.xword	0xcc3452a344b7959e
	.xword	0xc214b76741771ffc
	.xword	0xcad090a738f255b7
	.xword	0xf91c1f9f62bfc5ba
	.xword	0xb915250c813a4fd2
	.xword	0xe38133e1ee7e29c3
	.xword	0x9f6398a3c6124ffb
	.xword	0x33aca8892a2f9bad
	.xword	0xf1f2f6659429faf6



SECTION .ISEG_8 DATA_VA = 0x0000000080100000
attr_data {
	Name	 = .ISEG_8,
	RA	 = 0x0000000080100000,
	PA	 = ra2pa(0x0000000080100000,0),
	part_0_d_ctx_nonzero_ps0_tsb,
	TTE_G	 = 1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 1
}

.data
	.xword	0xc58336c718086f52
	.xword	0x35906a0e38b9bf51
	.xword	0x8bbb87e9f07bcf4f
	.xword	0xfb041b33ce97f757
	.xword	0x65b338f78612d1c2
	.xword	0x042962e3633e1fc3
	.xword	0xa3cd6fad5d598de0
	.xword	0xdbc9b3c4cef6ffd3
	.xword	0xe7f7209b2efafa61
	.xword	0x674c08d0f3593550
	.xword	0xdcd844cef01e284a
	.xword	0x26ce1d1a40c4a5fc
	.xword	0x137bc813f3fadd79
	.xword	0xea1d50e3a59c2cab
	.xword	0x125d602bd89f8918
	.xword	0xccfab52598a036ca
	.xword	0x9693e1233d710f37
	.xword	0x32eb1e6680b96404
	.xword	0x4bb13eb19e761c98
	.xword	0xf872a2636ca178ad
	.xword	0x3518401349010574
	.xword	0xc1e192af3be78fb8
	.xword	0x070980923e53227f
	.xword	0xd29f18e79d0052f8
	.xword	0x4d36a192cb3da0fb
	.xword	0x80e0c08810b46f16
	.xword	0x08b90a4eb81ff6da
	.xword	0xd7848a60a2784777
	.xword	0x1ac239b9004cf5fc
	.xword	0x7f3e545df36ae90e
	.xword	0x5ca069fe08b6980d
	.xword	0x00c4d5fbd54ef308
	.xword	0x7ba16fd3f0bd95d2
	.xword	0x13aec5cc29e12803
	.xword	0xb1e0779ca59464fd
	.xword	0x5a5a221f45f54050
	.xword	0x2b4de15029f9ae93
	.xword	0x9f8f69ad63ab8f10
	.xword	0xc1133e46c9c2af74
	.xword	0x00dc5119891cfbc1
	.xword	0xeadfcc4123f2eb0c
	.xword	0xd828f043673bcb2a
	.xword	0xbe020c1002397032
	.xword	0xda8eb10510222b2e
	.xword	0xfa76ad3d4cfac454
	.xword	0xd7b482c6f29c183b
	.xword	0x6d756d18151306cd
	.xword	0x129116f74491ec0e
	.xword	0x05b1aa44305ec760
	.xword	0x8f5ab7de13278e94
	.xword	0x43de28faa9997a2f
	.xword	0xd197cf1167b0db10
	.xword	0x56122b95831dcc12
	.xword	0xb407e31738e8578a
	.xword	0x6402eb3d56efed27
	.xword	0x9fc64c3a58399e67
	.xword	0xe7ce80bfe2ee98da
	.xword	0x76f42311049d96c1
	.xword	0xbfc07357ef2d0679
	.xword	0xa97b898b94ecebf9
	.xword	0xa6838316c1a32b65
	.xword	0x3fd2ac5a8c4aef07
	.xword	0x9687210e986e76ce
	.xword	0xbd808ec266694618
	.xword	0xcde4a64d0cf08ef6
	.xword	0x220b1588d9fcc03d
	.xword	0x21a9538b3dcacf9f
	.xword	0x818c6b423bd63f10
	.xword	0xbb56d990148fec40
	.xword	0x8b51cd61f3304354
	.xword	0x7732843dfb959b2f
	.xword	0x8e000e5966035d75
	.xword	0x4fafe0a8143a4a8b
	.xword	0x5e0c2a8ec5bd5f00
	.xword	0xe75e0cbbd04ada2d
	.xword	0xc0cda7de59346c6c
	.xword	0x4e8e64fa87db308a
	.xword	0xc4d34e609f979d0b
	.xword	0x873404000e265b5f
	.xword	0x69deac98a4813185
	.xword	0xb49eea2e1560793a
	.xword	0xb48db248391ccfbb
	.xword	0x75e9f4dcb3dca70f
	.xword	0x9c151924c499c24c
	.xword	0x24c0b24d0fb4d450
	.xword	0x0d65a90ccaebbe7d
	.xword	0xb6242efc2470c34f
	.xword	0xa02c8050c6c2c7ca
	.xword	0xa638a03fea52e8cd
	.xword	0x0a1858141dba8bda
	.xword	0xe283bbcb7d36d708
	.xword	0x8ad3bd7a99473c21
	.xword	0x934c5aa57d6b9126
	.xword	0xbb808424b5ba9a0a
	.xword	0xcd7b9679f43e8a87
	.xword	0xb24af8959cd2ea62
	.xword	0xe3c21705b3265ff3
	.xword	0x63be38741ab6288f
	.xword	0x1d53f3f090ed7ccb
	.xword	0xb596695d8878c0c1
	.xword	0x8d0c8894d6a78e4f
	.xword	0x3b16b073b7e86164
	.xword	0xb1d31c67eb71701a
	.xword	0xf31dfa846900064a
	.xword	0x799b63d4501ae25a
	.xword	0xbf59a868bf6eedae
	.xword	0x2b22c26cbc302c67
	.xword	0x37b11ebc39bf15f7
	.xword	0x91283bafd6314332
	.xword	0x833134685265f890
	.xword	0x98bd65ac76c04c3a
	.xword	0xc893ebbb4599cc98
	.xword	0x5d8495470ccdc33c
	.xword	0xb28853435bf06ea9
	.xword	0x70e680cf013d4bde
	.xword	0xacbe223bb55e7d2d
	.xword	0x43e20a1699ce59ef
	.xword	0xacdc4bc5e24f5c19
	.xword	0x94dffcfa2603342e
	.xword	0x61387a9da8735e4e
	.xword	0xa03d279523bedd57
	.xword	0x2d11da5a59575e3e
	.xword	0xed91547f4709ad5b
	.xword	0xe49d889cf4a071bf
	.xword	0xfc06298cf53b8620
	.xword	0x45f10167430bfedb
	.xword	0xb32c3fdc86415ff4
	.xword	0x805a887c2d6b98e6
	.xword	0x4fd92fcbba7e0fab
	.xword	0x81d9240b4191424f
	.xword	0xce77fb0b00997e5c
	.xword	0x077919c3d5dbff8c
	.xword	0x1b3a7152309c0e77
	.xword	0x6087a37c3ad1bdaf
	.xword	0x388fff3e95ce2674
	.xword	0x8a54cc3165151a62
	.xword	0x49fc30e5be734920
	.xword	0xf3c9d4ccbc18316b
	.xword	0xd4c2c851f3b8bb0d
	.xword	0xb790749ba078085b
	.xword	0x00cbc6d88dda79d5
	.xword	0xf3aa53a60266257a
	.xword	0x017b05c67b39af36
	.xword	0xf5d3b610c23efc41
	.xword	0x5b7cc48494a55215
	.xword	0xd0f256a9fcdff316
	.xword	0xa104ddb4d0dc5549
	.xword	0x528498c6fa0b5d63
	.xword	0xf912d4f9679b08b2
	.xword	0xbde7d7e6c8c9f86d
	.xword	0x19c446e9a0fe651c
	.xword	0x8df0ad2c4286630e
	.xword	0x5775647d5c3de54a
	.xword	0x3e4bdd52472762f0
	.xword	0x795f02f6ff2f76a6
	.xword	0x95521b4dd103d278
	.xword	0xea0b5f84e4b50204
	.xword	0x1863664b8ca182f9
	.xword	0x73240fc237fe9e26
	.xword	0xfae8be548cb83d07
	.xword	0x379a4f05ebb26f20
	.xword	0x9a5a4541301e075c
	.xword	0x2e97d52af7059e2d
	.xword	0xb57d332ec10bc9ae
	.xword	0x8e87f750a29df7a2
	.xword	0x8ae257d7fb378951
	.xword	0x7ebf813862ce87f4
	.xword	0xa2b4e622df2d2d1b
	.xword	0xa9b9bf9c3375e52c
	.xword	0xd32a19ffbf4f07c9
	.xword	0x2ee6a7647a63fb87
	.xword	0x736413ce9f5278b6
	.xword	0xe3ed55f40c965fcd
	.xword	0x9b4acd0af97784e4
	.xword	0xadfa09a61bc823e2
	.xword	0x4ca9579d4f73a996
	.xword	0x4c2fa3828d8d9678
	.xword	0x0ee3bd3eb7c2a6bd
	.xword	0xf559bc055c5a6df0
	.xword	0x9cdb77cca2dfdb54
	.xword	0xb6ae30a69f11e24e
	.xword	0x15680b8789900476
	.xword	0xed376989ce5db9b4
	.xword	0x4422dd9750dfa82f
	.xword	0x422b19520871e1a7
	.xword	0x6af357555924a142
	.xword	0x44c035a79f1fbb17
	.xword	0xf480900979c2972e
	.xword	0xe948331b8c67c6ef
	.xword	0xf8676e620be37443
	.xword	0x370fc1afc1e3e555
	.xword	0xa657c715ac817baf
	.xword	0x7ba7ea50645328e8
	.xword	0xcee0bbf263907b4e
	.xword	0xf2f1ffb4968b417f
	.xword	0xe17f56884729b6a4
	.xword	0xf8a2e264edd30aaf
	.xword	0x0e28895ac599b9c6
	.xword	0xff0ea7312180040e
	.xword	0x813035f54e00d4a9
	.xword	0x402d02836be2a968
	.xword	0x1dd59d169fbc6a51
	.xword	0x6dc1f7a372561178
	.xword	0x518367562d3486dd
	.xword	0x13b7f79f7324815a
	.xword	0x49b878e90671e6a1
	.xword	0xab4308a4dd499abf
	.xword	0xfb482c51a90fcb01
	.xword	0x66e692bb0a297642
	.xword	0x571a66c19a80571b
	.xword	0x02690dcd04cc5265
	.xword	0x0944f8dc62566aa9
	.xword	0x446dd93e619638e0
	.xword	0xf322f550a556caa4
	.xword	0x39cc7cb66dead5a7
	.xword	0xf4101dd819842945
	.xword	0x72f6fbea989aa564
	.xword	0xe0370d7fbce79ec2
	.xword	0xbae2c33ec60de2c0
	.xword	0x67a99720989fde5b
	.xword	0x52ecae316c7a976b
	.xword	0xf40a36c9eb120e10
	.xword	0xaaf314f7ac987515
	.xword	0xd552415e73bc4576
	.xword	0x611375c3eb5b3fc2
	.xword	0x9173890b718e9290
	.xword	0x3e5ea73d85051c9b
	.xword	0x95b6df41ad708016
	.xword	0x2fc2363b738fc00e
	.xword	0x7b723a2aa42bc2d9
	.xword	0x590be3eacb1d2157
	.xword	0x18dc7a2cbe34e1bc
	.xword	0xeeb56241ff3f765b
	.xword	0xd259e78aa3b34324
	.xword	0xd5d92fe4e53d725c
	.xword	0x218cd2ad791100bf
	.xword	0x456b88d9c72466a6
	.xword	0x3dacc1a5ac491397
	.xword	0x59c3f051bed56751
	.xword	0x91b64dbc44a16383
	.xword	0x462ba6f86e923175
	.xword	0xd464ff1bfd52c543
	.xword	0xe45964586dee718d
	.xword	0x547a017e8ff49e01
	.xword	0x458e5e3429735075
	.xword	0x5fd769779c9c2935
	.xword	0xb2c494222b4444c3
	.xword	0x7c36519c866c3909
	.xword	0x500999e396a977f7
	.xword	0x594f14a61b4f403e
	.xword	0x6b1b7e03fea9d87c
	.xword	0xc874d54026d0a0fc
	.xword	0x613a29f89e924435
	.xword	0x897927a166ec7dd4
	.xword	0x24e208bcef8791e6
	.xword	0x619c09dcb323f9c3



SECTION .ISEG_9 DATA_VA = 0x0000000090100000
attr_data {
	Name	 = .ISEG_9,
	RA	 = 0x0000000090100000,
	PA	 = ra2pa(0x0000000090100000,0),
	part_0_d_ctx_nonzero_ps0_tsb,
	TTE_G	 = 1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 1
}

.data
	.xword	0x81017a86f4a0d361
	.xword	0x4d0c8a6ffb455d37
	.xword	0x325767d2016bf3d1
	.xword	0x0932da916840249e
	.xword	0xfb2125a03821a0fd
	.xword	0x23230e5cc5e9aa31
	.xword	0x93bb5cfba10baa95
	.xword	0x317b1d6d4c8dbb15
	.xword	0x0b5d408b0e4ff6c2
	.xword	0x87b847068ea3437e
	.xword	0x73b1485a864360ed
	.xword	0x7cc2077a8493caf7
	.xword	0x69708d0c49be6f2c
	.xword	0x77277de66380b5b2
	.xword	0xf27816e3edf221e8
	.xword	0x48e6dbfc762e0f73
	.xword	0xea4dd16c79cf9650
	.xword	0x35422cc4cfb6467d
	.xword	0x4d474affa048483f
	.xword	0xa99777befd2d7415
	.xword	0xf43e52fe8a759c02
	.xword	0x1ff1c77d30dd803c
	.xword	0x0d10d9d6c52e0c5b
	.xword	0xff2d8dc316d055ae
	.xword	0xf8c19fe9681a89de
	.xword	0x146baa25d19bd9c1
	.xword	0xc0711bf10e930690
	.xword	0x389a140bb13bef47
	.xword	0x9240765fb57ac4b3
	.xword	0x82c1283a6d1e2881
	.xword	0xd588207aa4096c19
	.xword	0x59c363e6f0dfb091
	.xword	0x8f786290a19258c8
	.xword	0x084183fd007e577e
	.xword	0xd8819ec3271230b7
	.xword	0x11167eba2368cabb
	.xword	0xba2097e261e8d224
	.xword	0xf055dcb518eedfa5
	.xword	0x87f4c86e34ea65dd
	.xword	0x286aa27b360381ea
	.xword	0xc8019f10ce39f49d
	.xword	0x7ad0602a18423c48
	.xword	0xeee39aa6d3598837
	.xword	0x4494a4659014d5e3
	.xword	0x4e74f7311404d341
	.xword	0xa057ac5a98b7d825
	.xword	0x2d8ef3ff79ec029f
	.xword	0x27e89557e6fbfc97
	.xword	0xea3a67e5667e619c
	.xword	0xb8e1a2f9df6dc1e5
	.xword	0x2dcfcff068bff5ce
	.xword	0x25169c6f1d8417d8
	.xword	0x512b0076496a2432
	.xword	0x1a475d60f8df51ff
	.xword	0x79a906d0777b6398
	.xword	0x8edf32af05e0d2e4
	.xword	0xbd0ed93b56237fe9
	.xword	0xc3da94153cf81b24
	.xword	0xcba6f965f7eed7b9
	.xword	0x628ebcf862ef336e
	.xword	0x014af1aae5813cd3
	.xword	0xcc379bd5d7ccc973
	.xword	0x267cb0527edd1f04
	.xword	0x34af05bae1035b47
	.xword	0xe803a6ea501fef33
	.xword	0x5c664329d64d3739
	.xword	0x94807878de09cf43
	.xword	0x9de92483f56d3e95
	.xword	0x7a9ea946222aebd0
	.xword	0xc0e75bcb80b157b4
	.xword	0xa1a93aad634f58fc
	.xword	0xa14e430887c1283f
	.xword	0x22f3ff851d597c46
	.xword	0x24289592d196ced6
	.xword	0x004a9e30c2ea4de3
	.xword	0x90e4660faccf6395
	.xword	0xa13742065f54bab2
	.xword	0xcaf9fcf786068541
	.xword	0xa9bb6c7ed1a33f49
	.xword	0xbf6894148e03272d
	.xword	0xed386b3692b05ec6
	.xword	0xb8bccc0406f36323
	.xword	0x5dc0690e0dc67724
	.xword	0x944246d1f110b8e0
	.xword	0xc2c91168dd0d5b84
	.xword	0x5df71880f84b8510
	.xword	0xcfb899af0fef9d6a
	.xword	0x6539a91cba1ed6dc
	.xword	0xbe18a51ae2a0519d
	.xword	0xc265ff15fc6a15e9
	.xword	0xfac4f0ab6e920ced
	.xword	0x84242d969113b1b4
	.xword	0xb700ee3f3563cf6b
	.xword	0xcba58131c4d2d5f0
	.xword	0x71347c278f12db34
	.xword	0x14daf1f0f73c5bca
	.xword	0x7b39d8d4df7dd6fd
	.xword	0x3681dbe195837e71
	.xword	0xf9a711b96bab827f
	.xword	0x392de50865411542
	.xword	0x90df639c8ce125b7
	.xword	0xe15873c3fcf8a956
	.xword	0xc3a78b11d85b246b
	.xword	0xb4a4b5a590d98f87
	.xword	0x08ba2dbaa0ee2fa7
	.xword	0x90298d8391c2d9ee
	.xword	0x5d6b360f7a385e84
	.xword	0x0c50786ef73eb9e3
	.xword	0xc652aaf2480f2f05
	.xword	0x4bace85cb16eeb9e
	.xword	0xd3b4ab9ed0e20735
	.xword	0x49ddc11b47ad4a0a
	.xword	0x7a915b62335f1103
	.xword	0x98874905fdb43278
	.xword	0x57de9be080f7d755
	.xword	0xf37467e195eff38a
	.xword	0xf5e788753cb13217
	.xword	0xfc01dfb655203a3c
	.xword	0xad5aa38d9128c7a5
	.xword	0xe1eb6136ba44171f
	.xword	0x0c1936b224bc0f5a
	.xword	0x53d3a5c5e6ca79b6
	.xword	0x0fa090b635f3aefe
	.xword	0x1524e38b5785de69
	.xword	0x1c32e72cb8d554ae
	.xword	0x0ac0324152985371
	.xword	0x795bd2b5254729d8
	.xword	0xb57f5f1cb9f3057c
	.xword	0x2a2efc1c4fb813c7
	.xword	0x75e4ad226682b1af
	.xword	0x70c97a8fe54050b8
	.xword	0xb236b07a90683f30
	.xword	0x22bd73ea9ca0f43c
	.xword	0x003cf1111fabae9f
	.xword	0x9b12e7c06c381a1a
	.xword	0x49a388d2ca347b0a
	.xword	0xf600e905d46095a7
	.xword	0x9f1c3aa8d6cc61fc
	.xword	0xab17911ce6a238c1
	.xword	0x92001c921395fc90
	.xword	0xb6bbf2260e170961
	.xword	0x17e8cfe72fde70ce
	.xword	0x768a4f31ddb4a0d5
	.xword	0xf232a15eb517a863
	.xword	0x6c8b6df7aee5d782
	.xword	0x751a19502e2a9f82
	.xword	0xa8b64d9cfdc5cc60
	.xword	0x55c264aea60f7fd7
	.xword	0xa253c0cf9f02a9ab
	.xword	0x35ebf90480450aa5
	.xword	0xac3a8497428794e1
	.xword	0x953a8489ecae74ec
	.xword	0xdb49e9b14225a10b
	.xword	0x4dcf73d306e9d8d7
	.xword	0x4d62a13634878657
	.xword	0x40dec43b71a4b05c
	.xword	0xbfb8ff1f68e21400
	.xword	0x2cc5a6ae544484a2
	.xword	0xfc7cc1fcdd35e1a9
	.xword	0x86e00f0e28cfc958
	.xword	0x985bfd8f43c0c38f
	.xword	0xb621adfb48f9287b
	.xword	0x88755a95aa3f6374
	.xword	0xaec34376fd354991
	.xword	0xa0958636355c4724
	.xword	0x6f50386eef3fa720
	.xword	0xcaf0bfb6aaea3aff
	.xword	0x16c807194f6279c4
	.xword	0x2fe9b9b74f25d667
	.xword	0x48dbfd21a30fc2ea
	.xword	0xe3bb797202b71126
	.xword	0xf9a922d256af2692
	.xword	0xf9eb6b5c5006d764
	.xword	0xe116d897ed021d60
	.xword	0x099a4f380092fa87
	.xword	0xe60f6ff3f42b548e
	.xword	0xad4ab4e10fa40c35
	.xword	0x1ce55c4ccf2b973f
	.xword	0x8b3785e8f045ab37
	.xword	0x0dadad520a185ed9
	.xword	0xae897b3dea5ac399
	.xword	0x55a614c273a5e8d1
	.xword	0xc5ce5fbdb27f8eca
	.xword	0x3292b9a49eee9196
	.xword	0x4982eb2a6829f3df
	.xword	0x0d9db64b0248c8c9
	.xword	0x9bd941e05bd802ab
	.xword	0xc1cd759950f95aa1
	.xword	0x86ce1bbf13bab89f
	.xword	0x015d8af5158d9c49
	.xword	0xaeab3f971c32fbd5
	.xword	0x4a9161e9e87819fa
	.xword	0xe73dcaa40a2d7b8d
	.xword	0x63253e7a11eb9b3a
	.xword	0x42807c4c2b1f9edb
	.xword	0xeaf74eed2bf3f88a
	.xword	0xf193bb010b152b2d
	.xword	0xb48d75282c15f5cd
	.xword	0x62e3348ffaf304bc
	.xword	0xae08fbce9a9dfaeb
	.xword	0x60efeddffa412def
	.xword	0xf6d3d40c9d9581c3
	.xword	0x1cc774833401b22f
	.xword	0x1b7a8955a3cc10a5
	.xword	0x6314187adaac0573
	.xword	0x655bafa71f7712b4
	.xword	0x3838c09245c2412b
	.xword	0x2f17846550658542
	.xword	0x94b7bb89d7bb62ac
	.xword	0x0857850cab5b1fc6
	.xword	0x3ce5908c9e41d671
	.xword	0x2dd9d8bfa2c14159
	.xword	0x04f95fbd34fef965
	.xword	0xd9965f271a428d4b
	.xword	0x38a9ae8ec7544583
	.xword	0x33b346f04cea6d28
	.xword	0x3fb834a091419603
	.xword	0xb7bf6a479682d671
	.xword	0xceb5c15ac0435ea5
	.xword	0x3ef49fff75fe619a
	.xword	0x847fe6552fbc8265
	.xword	0xfa285ec24c200b7c
	.xword	0x3a409cfd30c0b0f5
	.xword	0x9e1d893c087a7c22
	.xword	0x47b2ea1b1ec33a7c
	.xword	0x174aa7ee67e230fc
	.xword	0x69c9c804503f2e9e
	.xword	0xdac7ed3380f5663a
	.xword	0xb9043fc1a627dcd3
	.xword	0x6e28b53370a1bf90
	.xword	0x215bfc7b4cd67ac9
	.xword	0x87c396d41350e625
	.xword	0x3b64336aa6b59aec
	.xword	0x52ce4f5e72645759
	.xword	0x61904273680cc020
	.xword	0xfa26e84659b4bf1a
	.xword	0x951374dd5ed1822f
	.xword	0xe967712571e2ecdd
	.xword	0xb2630e8643d93fa2
	.xword	0x171a385e3c1d4f41
	.xword	0xd25794f47bc397bc
	.xword	0x74bde5c1ab62ca54
	.xword	0xececdd7cdab497df
	.xword	0x02890091f04fc5ac
	.xword	0xd7bd4544ff90b32f
	.xword	0x40dc3dd7bff2a9f3
	.xword	0x3ac3d3d22e0f2068
	.xword	0xc833d5a3721a0704
	.xword	0xca333109f595a21e
	.xword	0xd2a71af96fae70aa
	.xword	0x4a59e7c60a1a4d54
	.xword	0xa7eb30f0644ad4c0
	.xword	0xa238b6f4d02c89d9
	.xword	0xd20cde86bca2d3d5
	.xword	0x56b4b9d19806225e
	.xword	0x19fda6b0c66da9d0



SECTION .ISEG_10 DATA_VA = 0x00000000a0100000
attr_data {
	Name	 = .ISEG_10,
	RA	 = 0x00000000a0100000,
	PA	 = ra2pa(0x00000000a0100000,0),
	part_0_d_ctx_nonzero_ps0_tsb,
	TTE_G	 = 1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 1
}

.data
	.xword	0x33c86fc558816993
	.xword	0x6c29b884a4d2aa3b
	.xword	0x0880533c17d55984
	.xword	0xeb9a09c08bca90ba
	.xword	0xeca011d235013be2
	.xword	0xee7bfbe313f671c3
	.xword	0xc95b9aa42807a37a
	.xword	0x6683147a7912c12b
	.xword	0xfb82dc20ed084d9b
	.xword	0xf2619476e17e26b2
	.xword	0x3320f3fadefab467
	.xword	0x338df26b39839ce0
	.xword	0x92137cc551976a94
	.xword	0xcc6dd22cba396946
	.xword	0xc0ad64be42db588a
	.xword	0xae2b0653ce6d6058
	.xword	0x22028dcb0763dd8a
	.xword	0x57c596974aa2fdc8
	.xword	0x2048437860c3f9cc
	.xword	0x37ff553edddef7ed
	.xword	0xf6385affa7e4eb5f
	.xword	0x28509a76c6a2c4f2
	.xword	0x9fb0d514df513510
	.xword	0xefe6f416a7b87c02
	.xword	0x73ba584d31e380de
	.xword	0x4f44ffb365d08e1d
	.xword	0x8689e775cf6dc06e
	.xword	0xd874f98ea33baf9a
	.xword	0xba75d34af2a853ac
	.xword	0x45dd971d0645ad03
	.xword	0x7a2e9937bc5e99f8
	.xword	0xf328235ca1aa4d51
	.xword	0x9b59ec4bba348f37
	.xword	0xd6ba7f44fffc92f0
	.xword	0x993b4a4a540ab743
	.xword	0xdca240b3bd730d8c
	.xword	0x41dbc2adf5b3b3a2
	.xword	0xea4341c0a9b3647b
	.xword	0x8faa8c40be5c8af9
	.xword	0x3b6cc11c4ef482c8
	.xword	0xab90de55d65ebeb2
	.xword	0x9157d576df529d2a
	.xword	0x9bdf4480503611ef
	.xword	0x9a9b93a965aabcb0
	.xword	0xcdfd5c354442b471
	.xword	0xd79a8d6678875ffa
	.xword	0x9e277de9f927d1bb
	.xword	0x5401d8d281e138e7
	.xword	0x67afa0a7a8238ee2
	.xword	0x4b1a21628768384a
	.xword	0xf953cc07cc1ba542
	.xword	0x0ec17b8e4885d6c9
	.xword	0x566113f3f916d518
	.xword	0x0e4da7165c637728
	.xword	0x7aa07d60e876d39d
	.xword	0xf1464e763e347398
	.xword	0x903930b36bb800b4
	.xword	0xb38113ed8b5b0b41
	.xword	0x8bc2461164d0f20a
	.xword	0xe2b65aa2f1a2607a
	.xword	0xd6c1e06f0d6cdeac
	.xword	0xddb9bc60f68bc407
	.xword	0x583aa3c618023628
	.xword	0x91c4dad9e710e0a7
	.xword	0x04e2e2ece26f49dd
	.xword	0x55753366a6b43d6f
	.xword	0xa411a35ca670befc
	.xword	0xaf9913e25d5833c3
	.xword	0x9e7caef7ff39c694
	.xword	0xf83f29080c7ba94b
	.xword	0x0a903da17e0374a2
	.xword	0xaa9ec7bd60381177
	.xword	0x28f0ce324d5608cb
	.xword	0x73799809df50a67c
	.xword	0xd1e4ce4cc3f80fb8
	.xword	0x53f8513f65dcf383
	.xword	0xf4f1bca616de7f34
	.xword	0xb231940b736fedad
	.xword	0xe8620f858e4aaa95
	.xword	0x94666e0d1369a7cb
	.xword	0x4f2ad2c00b4606e6
	.xword	0x4f236760da9b1692
	.xword	0x6511e3a4c6f54c9f
	.xword	0x8df043471c1b7b72
	.xword	0x06efa700d7319776
	.xword	0xf109f41365814135
	.xword	0x06639c50df4ea37f
	.xword	0x581883da93bb3945
	.xword	0xcde8491624ca256a
	.xword	0x18c6b9cf20ac7414
	.xword	0x2c556ac34f0be477
	.xword	0x2f40b8f7e9516311
	.xword	0xd33d9363a5b268e9
	.xword	0x869084fd29668e20
	.xword	0x3147a65827146ab8
	.xword	0xf6b80eeaf51245fa
	.xword	0x5120dd96a7713664
	.xword	0x352ae45a4ef61f0e
	.xword	0xe8845ca5288cd12c
	.xword	0xa3d3f761ea033b22
	.xword	0x82ddd659a6e668d4
	.xword	0x8babe5e38f0182e2
	.xword	0x8ee9c1e34a6aea57
	.xword	0x0dc43f5b12def97d
	.xword	0xaee44ac0eebb3a18
	.xword	0x72343af49be5118f
	.xword	0x85e1993802cced1a
	.xword	0x90a205e562a74853
	.xword	0x8f8c3658be684492
	.xword	0x27d6c14c3d9787f2
	.xword	0x0796c6eb004d0a50
	.xword	0xf2948df49b84f841
	.xword	0xfe4bddff564a55b8
	.xword	0x0be7e44a8d545c20
	.xword	0xf1818a4e7ab26604
	.xword	0x7320a75dc4fa1372
	.xword	0xfd45829540d264be
	.xword	0x6f3785bae3de231e
	.xword	0x5f929c70f5581484
	.xword	0x8faf8d8bc8a35349
	.xword	0x3b952fe19a3e4c41
	.xword	0x058db7ff48c6ec1d
	.xword	0xd72d29890432ad28
	.xword	0x4ac44a144978c5f3
	.xword	0x73fc25887b6bcaff
	.xword	0x61293e29e27aafd7
	.xword	0xac1e100f02f3d4ff
	.xword	0xbfaac54f7d099704
	.xword	0x74018a38fd03bd37
	.xword	0xd3f09b1d0f4a01a9
	.xword	0x2ef338a9e4fdc077
	.xword	0x6d614c712211590b
	.xword	0x9c1f65243fcda5a2
	.xword	0x86cb2fee7f40d974
	.xword	0x9b2a8de0af4e0562
	.xword	0xdf1e4e701b4650b7
	.xword	0x598f40b14501b649
	.xword	0xd7d51fc6e1379ad4
	.xword	0xaa1e7f396c77c216
	.xword	0x9a6f073c1eccbb36
	.xword	0x35d7dc068550d415
	.xword	0x8d83481e579853af
	.xword	0xebc7fa26722935de
	.xword	0xffb17afbdd402cd1
	.xword	0xc98b6c292f65ea1d
	.xword	0x16589a20ae47903c
	.xword	0xa9ca6b6f6fb053cb
	.xword	0x5112e0d23f9a62c9
	.xword	0x93102ba2d5d59576
	.xword	0x5f0a142b58c43252
	.xword	0x5f49ea759024926d
	.xword	0xdd5988e4a595ac88
	.xword	0x21e9a98ef10bafb7
	.xword	0x421cda5228c76d8c
	.xword	0xf80f0296b613251b
	.xword	0x0c8581ecc9263142
	.xword	0x9336594ecba7cf44
	.xword	0xb38bf24b39a103a4
	.xword	0x879dba061575afda
	.xword	0xe6448299f3df7d84
	.xword	0x1a479f630af037df
	.xword	0xcaa0c0510dd84ef5
	.xword	0x7f204c31adc02f7b
	.xword	0x176405d3339ac44f
	.xword	0x417e04f65ffc49cb
	.xword	0xee7cfaa1a9aad739
	.xword	0x163519e8ca91a756
	.xword	0xba876aaea264c329
	.xword	0x79316e55b8080131
	.xword	0x23152dee6f24fa4e
	.xword	0x499d264d66a16190
	.xword	0x0313c360cf4f1a31
	.xword	0x02e8e5b1e793b721
	.xword	0xa16cc3358a1909ff
	.xword	0x8178324171070e01
	.xword	0x7de1bc15f8c0decf
	.xword	0xac2c3a25a8d0a879
	.xword	0x61fefd4fa41bbb24
	.xword	0x6cc17e70a40f8e17
	.xword	0xaf31ed9ca7deacc6
	.xword	0x2d18674d44416ce5
	.xword	0x099f6c7ca7b4e80f
	.xword	0x1e7c662587393347
	.xword	0xdb7c00ac4619474a
	.xword	0x842200e3e2c73e60
	.xword	0x2724e1505dcc7f3c
	.xword	0x50ab4c2f5b47aaac
	.xword	0xc00475f95021eb9e
	.xword	0x7f3021ae6186a611
	.xword	0x7e0fec54a65957ff
	.xword	0x852bedc98d038042
	.xword	0x9f327abf9236d448
	.xword	0x34b26ac1aa05759a
	.xword	0xa927afb79dc02ea0
	.xword	0x54cc8f02e0a8a96d
	.xword	0x752d72547fab6451
	.xword	0x850e5be502a3640f
	.xword	0x60a7e6e43c15eda3
	.xword	0x8af23d552d2137fe
	.xword	0xcf2f7c438728c7ac
	.xword	0xae9045d71c266cb1
	.xword	0x34550b9990430449
	.xword	0xc86608d5c2ccfe6b
	.xword	0x77ea9763e7badb84
	.xword	0x1d58996c2b4c29f6
	.xword	0x0d82607a3055b001
	.xword	0xb7d263d1541e4282
	.xword	0x00485c94fc77e298
	.xword	0xe7eb982b94492ed3
	.xword	0xd1d51523a2f7a081
	.xword	0x2e7ec572a92a2a2b
	.xword	0x2326cf72999a2456
	.xword	0xd54d4158ee16f250
	.xword	0x88abde5cc6e8e095
	.xword	0xfe300631337cc5ed
	.xword	0xabba2045588815dc
	.xword	0x833b91fc320fd05e
	.xword	0xd964fc3a909540da
	.xword	0xacf3bfcc34c8c7c3
	.xword	0xcb5a7f6d72bfb8b8
	.xword	0xa40a36019b1efcf5
	.xword	0x9cb50d8be7ce1d9d
	.xword	0x531df2c4a338757b
	.xword	0xb7bcd148875d379f
	.xword	0xe0dead18fc010cc1
	.xword	0xa9b1d2ce44c8205e
	.xword	0x61103fb30869919c
	.xword	0x456ae270667d0455
	.xword	0x37f2c4d2486ae05a
	.xword	0x12ca01ea39cd75ad
	.xword	0xc9c25c491423d793
	.xword	0x6213acb7c86af251
	.xword	0xf29bf8df9bba1ce1
	.xword	0xed1ea68dffc4221a
	.xword	0x39706525de8e4a1a
	.xword	0x1edecefafb7687a1
	.xword	0x3ffb4baa2d63591f
	.xword	0x45d920da23e7ae91
	.xword	0x2741667c3582147e
	.xword	0xb6a8acf4f0c7205b
	.xword	0x1e5fb6653aebfd12
	.xword	0x846a580473ae3f78
	.xword	0xb76d0ad39c40107b
	.xword	0x370693c3ca8d78b2
	.xword	0xea481431e8e9e87d
	.xword	0xca94102e3a25b19d
	.xword	0xee9751294559e55d
	.xword	0xc9ad856bf664e5a7
	.xword	0x6f83f3c624ae44de
	.xword	0x3513fb96bbb51432
	.xword	0x40d38dc3e3f1546d
	.xword	0x90ac316929c554ce
	.xword	0x0de43b846e3e926d
	.xword	0x34483308d4e4c56e
	.xword	0xa40b836c9ecaca56
	.xword	0x6b483dac40b981b5



SECTION .ISEG_11 DATA_VA = 0x00000000b0100000
attr_data {
	Name	 = .ISEG_11,
	RA	 = 0x00000000b0100000,
	PA	 = ra2pa(0x00000000b0100000,0),
	part_0_d_ctx_nonzero_ps0_tsb,
	TTE_G	 = 1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 1
}

.data
	.xword	0x525aa84d2a83aefb
	.xword	0xa2c2d88745c15b8a
	.xword	0x6894ef28e53e4687
	.xword	0x2b3c9100d3429fe3
	.xword	0x0116faa44fe0127e
	.xword	0x578c52c5fa67af96
	.xword	0x589e7b8d2d8c14b8
	.xword	0x6e0d831575148c0d
	.xword	0x48ddaf57a0df6312
	.xword	0x169648bad65893cc
	.xword	0xf76c3066a2bc2752
	.xword	0x6f58cf92bd682e52
	.xword	0xf7709932f37e6e2b
	.xword	0x729d68f963f74369
	.xword	0xa53d84d50298a867
	.xword	0xe0050f0b3bce1ca2
	.xword	0x82540b64cd24ca71
	.xword	0xa5cbaec9a202ee61
	.xword	0x72a95aee822035e6
	.xword	0x7861d2d563331401
	.xword	0xc4711da75670612d
	.xword	0x3ab6e4f5b4613a3d
	.xword	0xd27dc14476205467
	.xword	0x79de1325c459099b
	.xword	0x2c288392a81db6f7
	.xword	0x97df0fe758a6e907
	.xword	0x717457c872068021
	.xword	0x93de2c46ea185908
	.xword	0xdf69144a5b33d5af
	.xword	0x801fa0cc3944074a
	.xword	0x207350dc81597dab
	.xword	0xa1699a15f5746d2d
	.xword	0xd206865f45c59215
	.xword	0xc5272033ba9b2ae1
	.xword	0x1aab7aad17f9330c
	.xword	0xede6af8e998cbe96
	.xword	0x43eecea338255f39
	.xword	0xbf1978e80be0aa65
	.xword	0x8c8b0935e04994bd
	.xword	0xd6a2193d20a8c3b6
	.xword	0x2781159f56d25ede
	.xword	0x25493e713ce69c2e
	.xword	0x35cfad663a277ff1
	.xword	0xb740adc8eee492a5
	.xword	0xaa60cb0a3a3321ef
	.xword	0xf74629cc092c9592
	.xword	0x83d43d0eceff3e09
	.xword	0x93654ffdc46ca9fe
	.xword	0x115111b8911aa3eb
	.xword	0x2a7e3610dfc481e8
	.xword	0x9706b261f978e204
	.xword	0x0dcabc4f0d4dcd7e
	.xword	0x602a3e70edcba414
	.xword	0x35ec7fc146606262
	.xword	0x51459f17e6efd28e
	.xword	0xa9ca032dd519c0f1
	.xword	0xbd2268628156f0d4
	.xword	0xff2d7d96585e43eb
	.xword	0x697d5cdae4679cc4
	.xword	0x1e8f5ce7dbc8d5c0
	.xword	0xdf478d56be45a61c
	.xword	0xc1e1a3f4bc68271e
	.xword	0x2540a492daf8f180
	.xword	0x327df6e9274fbbc2
	.xword	0xb0c548a8343f9814
	.xword	0x7b56b2adc854b5b9
	.xword	0x4b19917fdf553341
	.xword	0xa8e5733c7730c154
	.xword	0xd4b19f4dc1c084ad
	.xword	0x03f7f9b071fcbb2f
	.xword	0xf9d8e6cc8d8affe8
	.xword	0x1cf766d12c15babc
	.xword	0x0913ed3a46275977
	.xword	0x3861b79ae2ae7d59
	.xword	0x12b92091f3d505d8
	.xword	0xdd5b7b097aba9c6c
	.xword	0x4721e102a1731980
	.xword	0x52f5675f8025e7c9
	.xword	0xfd89d6827592a5d5
	.xword	0x4eb3b830f7dfe39e
	.xword	0x431405fb2b9d10cc
	.xword	0x7f7f8d572d402e94
	.xword	0xa245b2a63ac5e85d
	.xword	0x0db55d5053a70a88
	.xword	0x3496578ff5473c4d
	.xword	0xe5f73794fd69f48d
	.xword	0xfd0012b874d11dbb
	.xword	0x72ba173fdf98c9f7
	.xword	0x5f55a5f3c32bd4a4
	.xword	0xce8a188d658359da
	.xword	0xe066bcc30dec33fb
	.xword	0xd3ff8253eb68089f
	.xword	0xb7be341fc2e14770
	.xword	0xdf3c358bc77fe797
	.xword	0xdeb107fec2f57079
	.xword	0x20ea47154d31a628
	.xword	0xb6604973eb49eee4
	.xword	0x608ec3d7b09892f0
	.xword	0xef11a4522c7883f8
	.xword	0xb6574383f857fcb7
	.xword	0x41363ee3a2ede0fc
	.xword	0x6ab00086f009d347
	.xword	0xb2d9b4e58581aa31
	.xword	0x625c9858a231c9b3
	.xword	0x55af0d39639e41af
	.xword	0x38d7a091daad7d7f
	.xword	0x9e1bda561344ce8a
	.xword	0xac8d4ae25f23b634
	.xword	0x494a0e17b9eb0c56
	.xword	0x93144e0dcdb2aeb1
	.xword	0x909bdc9041157cab
	.xword	0x7080efebfce21eb8
	.xword	0xe01d0c829f7ac576
	.xword	0xed911b1a2928383d
	.xword	0x4d1926d2a048d495
	.xword	0x810c60004596eea8
	.xword	0xa2838a2263bd792d
	.xword	0xd473f9be09a13265
	.xword	0x5ba18803e6ae82ed
	.xword	0x3bc2f31da6c521af
	.xword	0x344715f16caf5696
	.xword	0x4edaad8ae7889a8a
	.xword	0xac196600e4955897
	.xword	0x1bd8194b15ecff7d
	.xword	0x3e43b457c4436c62
	.xword	0xfda426613f9cceb0
	.xword	0xcf0dd8ca8cab76b7
	.xword	0x959c500b35cbfef2
	.xword	0xef464c1f49a717e9
	.xword	0x6ba2fd3b438a4b42
	.xword	0xb95e8c36d497194f
	.xword	0xe2c25d5947a43e1c
	.xword	0x515493e57c59f342
	.xword	0x6babceccdc1077ce
	.xword	0xe22408a570e42bcd
	.xword	0x9d26a59fd3f7af31
	.xword	0x06b182cfeedbcd6f
	.xword	0xda04e07b6decd0ea
	.xword	0x12b7e839d8087406
	.xword	0xc51163610c367c76
	.xword	0xf1bfc895218a2af4
	.xword	0x5ae8aed92c4ae59e
	.xword	0xc742b607c74fef66
	.xword	0x618f915ad09efa01
	.xword	0xd5245a6046477f29
	.xword	0x100cd74115622623
	.xword	0x6fea6989da48faf8
	.xword	0xc09540af65b66d71
	.xword	0x7f17b743293372fa
	.xword	0xae57f70ebb531c6c
	.xword	0xc34f4ea652ba4e92
	.xword	0x4bc1b91fd534b5e2
	.xword	0xcd1dfa1eeee762a2
	.xword	0x6bc26988a2f90036
	.xword	0x9b316e753f172245
	.xword	0x4ca37056d9766e43
	.xword	0xedcf5cdf9da528f5
	.xword	0x405cbcd8c764097f
	.xword	0x9da5a17a1439a8c6
	.xword	0x025c8dcede412f47
	.xword	0x1517afa7d7e5cf4b
	.xword	0xe41bab9192631196
	.xword	0x39026a52bcf25a1d
	.xword	0xa324e7bb94c3186b
	.xword	0xb5d6bf0971af70cb
	.xword	0x8d2497ee8b9efc39
	.xword	0x8eab474ae7a109cf
	.xword	0x0a0afbd2dc53e900
	.xword	0xdd3c7968e16369f9
	.xword	0x43b772635ee054ee
	.xword	0x8c98a485031825af
	.xword	0xae1b98640fe82e5c
	.xword	0x010da92f8e38fb4b
	.xword	0xb20041eeedc9967a
	.xword	0x3ebe8b7c5cef5bd0
	.xword	0x6389e735e2048a6d
	.xword	0x9b8f38a1cf033b04
	.xword	0x5d7e56a1b2cc8c58
	.xword	0xba3e9c422affd646
	.xword	0xb3d069bdb17651f5
	.xword	0xebbe2dbe27db990b
	.xword	0xc0ed908fe0bcd6e8
	.xword	0x12d96c49d526cdaf
	.xword	0x90c946ec3dc66861
	.xword	0x9822db86aba14a8f
	.xword	0x56e3a351a81be4d3
	.xword	0x439e4d5be8d968a8
	.xword	0xdd8428171a350deb
	.xword	0xa94c98bf77713baa
	.xword	0x5ddebbd3cd49c3a1
	.xword	0xec32b7080e9a1670
	.xword	0x3145f9816c47c464
	.xword	0x59df30528aa0a768
	.xword	0x6d926696fa7a7063
	.xword	0x9fa9e9d7d8dcb0e4
	.xword	0x4da01a436ea868a3
	.xword	0x9602801601d18a96
	.xword	0x4913ac33e7be5fc4
	.xword	0xc5f2e1130a237455
	.xword	0x270fc5a68fef590b
	.xword	0xb8415d7d204007b1
	.xword	0xfc6b22bfc41e44f8
	.xword	0x5350d747dd4885e4
	.xword	0x5a819f881583f972
	.xword	0xd046526d764ec770
	.xword	0x085cb5e2d52b2c4a
	.xword	0x52520cf76e1026c4
	.xword	0xb5d246045a9c2ddb
	.xword	0xdfb2af58f007e750
	.xword	0xcce824102129e5db
	.xword	0xad6676e452d7204e
	.xword	0x1d431b12fd4efbe0
	.xword	0x3bb415f43e7899e4
	.xword	0xb21654243d7b4510
	.xword	0x1b047ec7d1ac727d
	.xword	0x14c4bdf0383cde6a
	.xword	0x7ea7078ebae753d9
	.xword	0x5473e25439e41ce2
	.xword	0x503ea5e75e123e0a
	.xword	0x6f1f6ff79e056dc0
	.xword	0xca287666c33c3f8c
	.xword	0xe258f2f7a73389da
	.xword	0xd8e2124b36ce427a
	.xword	0x09ce2650d9b582a1
	.xword	0x7c1cd1d71eafab9c
	.xword	0x6128638ce3e67b52
	.xword	0x14c6befb27467a63
	.xword	0xe5c5864e2c78c103
	.xword	0x6b3a43245ff4b5e0
	.xword	0xfc8f49e1debbb529
	.xword	0xe25e2b3dc4464f07
	.xword	0xe55d1eb445233a75
	.xword	0x49ac68e89f39a716
	.xword	0xba4834c948b8aa4e
	.xword	0xdaa6b14201a77d41
	.xword	0xcbb5e938579a8a36
	.xword	0x601bced37c47a203
	.xword	0x3442f480041ce3b4
	.xword	0x9603635833f996e8
	.xword	0x3577458a633a444f
	.xword	0x24a77571f88fabb0
	.xword	0x632feec659c8b633
	.xword	0xc097be45ef948712
	.xword	0xcba3e72d05a25f39
	.xword	0xee2a3619d27c5580
	.xword	0xdc8c66e1257d52c8
	.xword	0x060fb939e937d7bc
	.xword	0xc92f0f63bdc33c35
	.xword	0xab8f1feec1c54803
	.xword	0xac7cda0bc0dac0b2
	.xword	0x47934d1338d466b3
	.xword	0xde4f7425de62c189
	.xword	0x8085387a7e6d3e5c
	.xword	0xecfe56578ab68416
	.xword	0xb2eb6bc0fe0305b2
	.xword	0xa5bd515ccef28a28



SECTION .ISEG_12 DATA_VA = 0x00000000c0100000
attr_data {
	Name	 = .ISEG_12,
	RA	 = 0x00000000c0100000,
	PA	 = ra2pa(0x00000000c0100000,0),
	part_0_d_ctx_nonzero_ps0_tsb,
	TTE_G	 = 1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 1
}

.data
	.xword	0x65cb99a2103e4f2b
	.xword	0x07796ca32ee61226
	.xword	0x9be443aa4a5996fd
	.xword	0x7f8f3a17b469a68f
	.xword	0x42d38c4e7dc77926
	.xword	0x2f033363fd41e86e
	.xword	0x376f48055d44b138
	.xword	0xc6cee06649cd0d71
	.xword	0xbbbf039c7953eff6
	.xword	0xb8da57ac137832db
	.xword	0x296e1fba5b4c919c
	.xword	0x0a38783f8b7c60e8
	.xword	0xdb1766210fd8bca0
	.xword	0xfa008357089b9faa
	.xword	0xdeb477983250104c
	.xword	0x94107ecf7139fffb
	.xword	0xa358f11412d9e19f
	.xword	0xcfd510a464373996
	.xword	0xdc4baade36159ec6
	.xword	0x7aa7815c961975c4
	.xword	0xd524de124424d1fe
	.xword	0x33c909188de99413
	.xword	0x3a49a8b7f7a741aa
	.xword	0xe02a67aeeef35caf
	.xword	0x6271590c57a5a5de
	.xword	0x9148bed52a9c0f1d
	.xword	0x6e7404646d3b7b17
	.xword	0x86fa9a554a8ec363
	.xword	0x100abc680549ebdd
	.xword	0x7e38370a0b46f3f2
	.xword	0x8c25c547f0119168
	.xword	0x6a3c446c6726e143
	.xword	0x7e23c8265152b32c
	.xword	0xb1a6b6a30e2fe958
	.xword	0x2d4cc5b98707d318
	.xword	0x1b4fd7a06f61e4cc
	.xword	0xe22de6119d753f3f
	.xword	0x10132dc843d741fb
	.xword	0x11f0bfc87b4d2043
	.xword	0x526c2b326a62f1fd
	.xword	0x19b76aaa091968c9
	.xword	0x04b73f63b7ee28f2
	.xword	0xd4ef97adbf43ed44
	.xword	0x54d155c395178e64
	.xword	0xf69a612affeae5a1
	.xword	0xba405a974a64d79f
	.xword	0xac9903c8b8a1d30e
	.xword	0xb1eca41a472f4001
	.xword	0x4efc191224d49ace
	.xword	0xe70fb1ac31c046a5
	.xword	0xad0be6f581b1c3ad
	.xword	0xe89db6e27bcd9af1
	.xword	0x80f512b4ccf00c6a
	.xword	0x54f82d39961aa493
	.xword	0x19730c4fde5ae0a6
	.xword	0x5c7096e0738c6faa
	.xword	0xf938b41438cb26cf
	.xword	0xfe060bc5d078483d
	.xword	0x008e6dfd53bc9d15
	.xword	0xc0b10a10f41b4a78
	.xword	0xd280d92b6b967169
	.xword	0xa28a7fd6cc766a4a
	.xword	0xa65e571e1723d725
	.xword	0x4f769fcbd9556188
	.xword	0xb13cb931573bb641
	.xword	0x8245ce3717aa8a34
	.xword	0xdc81da7919b43037
	.xword	0xe453b14120492cde
	.xword	0x0d98b1b8d96de286
	.xword	0x556dcd056f96516c
	.xword	0xf992e9e994712ded
	.xword	0xb47d9520118d9c1a
	.xword	0x0619276750e6ee16
	.xword	0x9aefe481650cee54
	.xword	0xd0f6a388f866410f
	.xword	0x067bc6731caaa515
	.xword	0x5029ec3129db65ed
	.xword	0x8228a0d4542a8866
	.xword	0xb6f86afa6a7c4c44
	.xword	0x1bb6d6e70b36ec8f
	.xword	0x80106cf45a93a685
	.xword	0x7789e1475576a12f
	.xword	0x2b8c01c6f6bb8c6f
	.xword	0xabd2a18e75d4f993
	.xword	0x4c786e2aa790ab3e
	.xword	0x34ed3fa72ccc5b7e
	.xword	0x9a3053474ca9b4f3
	.xword	0xc4faff31da802893
	.xword	0xa90530aaea34f286
	.xword	0x1d0dbc224349b6a6
	.xword	0x5eb8c96dc3f5f96d
	.xword	0x1a911c4b64028a14
	.xword	0x0d2059bf1823e461
	.xword	0xdd5180421e0e966b
	.xword	0x4d9728c26544a742
	.xword	0xcbc73dd0dc9887ce
	.xword	0x595e0fbb6adfd592
	.xword	0x1187972fa55d7fba
	.xword	0xdb1c7bf0a1613830
	.xword	0x7b984f163c46806e
	.xword	0xd43f8e4dbc064e1d
	.xword	0xa5dcf4cfa2225f0d
	.xword	0x337e74877716fd44
	.xword	0x86547d320c801dc2
	.xword	0x940885a0e94681c5
	.xword	0xa31f043d84e7517b
	.xword	0xedd04322045f55f7
	.xword	0xcfa8ad600183a8bc
	.xword	0x6a300fbfa1e558d4
	.xword	0xff1dc7e4c4da027a
	.xword	0x91965a39d60ca294
	.xword	0x828d3198238f26d0
	.xword	0x473eb589779acbd6
	.xword	0xe4e2d9f51e040e98
	.xword	0x06636f4d36c7b722
	.xword	0x7f0f2e1098f895d6
	.xword	0xd4dfd61ef8e82f31
	.xword	0x2895f827defa098d
	.xword	0x2e78f62491833aa4
	.xword	0x13531bd9666ec322
	.xword	0x85183f911a864512
	.xword	0x3638991a6712d39c
	.xword	0x0174bd4a813462f5
	.xword	0xd13761783b3924e7
	.xword	0x693ccbc59d056a70
	.xword	0xbe80480d39775a15
	.xword	0xa70db5f2b584f180
	.xword	0x17959dd2a40d605f
	.xword	0xcf8fc3c37294ac94
	.xword	0xa238f807cf1682c0
	.xword	0xb3ad31c24af9574d
	.xword	0x676d29aa6221f0d4
	.xword	0x3ab1e20759f36375
	.xword	0x1aafce77ed02f747
	.xword	0x8668eca1747a5251
	.xword	0x842dd1277237792d
	.xword	0xae571c2f384b4649
	.xword	0x9be54f9b42634eb6
	.xword	0x7cefcf5a314880f8
	.xword	0x1e69e083f81b3e8a
	.xword	0xee90629cfdfa9fa4
	.xword	0x641bdc3c00c8c6c8
	.xword	0xe56bc1332207f415
	.xword	0x922e13e095eb9bfe
	.xword	0x200b287e930e6216
	.xword	0xa5c499ce1fc94df8
	.xword	0xc5e3fdeb48cf50f8
	.xword	0xb9146b96fd1e069a
	.xword	0xea163189d3efe6e1
	.xword	0xd4b7d35174903738
	.xword	0x48964d5a303a6727
	.xword	0xecfb99032f5f90a2
	.xword	0x7cfc135fc0fb9c86
	.xword	0xb12370eb35b01af2
	.xword	0xdaf74c90fc47919d
	.xword	0xc3fe5d5abd2fa4a4
	.xword	0x0b39e2c7ac7fcbe8
	.xword	0x307a716c04233e85
	.xword	0x007a4c27535ac8c8
	.xword	0xf94699c21190dbc5
	.xword	0xb7958aaa0c72004c
	.xword	0xdeab7f2f4aad3535
	.xword	0xa88d37eba83bffd7
	.xword	0xec77b152eea94e08
	.xword	0x1871d8018994552d
	.xword	0x2c850af21770c65d
	.xword	0xb39e4bedc82ffa21
	.xword	0xaea2f9694dbb800b
	.xword	0x9a01e9d38b93decd
	.xword	0xdd2b88e6667c143b
	.xword	0x47744c5c47baf2e6
	.xword	0x1733ff0dcbe5cb48
	.xword	0x4982aba677f1d1f4
	.xword	0xe43a0de2f0e7b550
	.xword	0x079c5ce2c99edce5
	.xword	0x5564aa61f2aeb6ad
	.xword	0x9cca8daf7b36f461
	.xword	0xa8594a584609bdb1
	.xword	0x4fae26259042ac3e
	.xword	0xab9d44e73a604fec
	.xword	0x63f766ddaabb2ab4
	.xword	0x7d00fe5289bc0dbb
	.xword	0x23b495a1ecee6492
	.xword	0xc5ad34a9974a9d55
	.xword	0xc2a400b9e30535da
	.xword	0x3ee2597f481c43ae
	.xword	0x9f7cda7d503f3072
	.xword	0x25641c139876e57d
	.xword	0x2f072d21a3481ccf
	.xword	0x98b1753546cfa078
	.xword	0x41fd5a33b213cc40
	.xword	0x8f8200028c0d429c
	.xword	0xc24cc300e398efe3
	.xword	0x1f68dfd9e324d0c9
	.xword	0x3485bc002b1d5b90
	.xword	0x7dd3d29f90badc8c
	.xword	0x9e232d64498def2c
	.xword	0x46afeca74ad3c85c
	.xword	0x1f11da0c70ded13d
	.xword	0x18a7ed5de6386072
	.xword	0x28e219fce17356bf
	.xword	0x2c72394506ff87b5
	.xword	0x714286142df3b757
	.xword	0xc26fde9dff813efe
	.xword	0x9efd061fa18ed031
	.xword	0xd0d7f4c08dfdcc25
	.xword	0x64cfc2a1e70ad37b
	.xword	0xb31011b54159623f
	.xword	0x3f3aea1a8e83957b
	.xword	0xa2349fb06013eb5a
	.xword	0x532099442f4a65ed
	.xword	0x630e928fb8d4ee21
	.xword	0x7ebddd9cad7e4412
	.xword	0xa7a690f23e147ff5
	.xword	0x7353f6d14d83656a
	.xword	0xa2b145099b8f4801
	.xword	0x7c09c63aacca6ccb
	.xword	0x260e6fec5ae2d5d9
	.xword	0x51dd1dc41de4d1ee
	.xword	0x475e8909dac5637e
	.xword	0x73a8fd491a011084
	.xword	0xb641aed8eef48252
	.xword	0x76cb6582599c2411
	.xword	0x1d91ab5aa2d3ab27
	.xword	0x291ba99e26fb07fb
	.xword	0x15dbeae36ba3da31
	.xword	0x26aa8843c03c3687
	.xword	0x6c6bf2987bb37b9b
	.xword	0x6690a5e5d2bb98dc
	.xword	0x609590ecfd2855ad
	.xword	0x17aa2c2a84f05a58
	.xword	0xb16751828867a119
	.xword	0x2b75a19c3b675d3b
	.xword	0x7e94b5e98cfb2c30
	.xword	0x5d551b054b2c2dfd
	.xword	0x77cee38146339d53
	.xword	0x0afe1036b9c6504e
	.xword	0x5cd39469ad096d6e
	.xword	0x26650bdc414a3400
	.xword	0x4bdf205cf538e50c
	.xword	0xa5bc4e2f5384735e
	.xword	0x597da199f78879c3
	.xword	0x1a2bf7810273792b
	.xword	0xebc653dd7dd98227
	.xword	0x1fcdc5dd4dc7dd1b
	.xword	0x7f186a99e640dcda
	.xword	0xa1fc0b4f2b0d52b3
	.xword	0x8962bc4b822ac96c
	.xword	0x547175abcd83f203
	.xword	0x986d79e0f9dfd21b
	.xword	0xff0a56754737ee70
	.xword	0x3e12c34335db9c04
	.xword	0xb9d1619af1dbdbb1
	.xword	0xa149629031bcebdd
	.xword	0xc6cf2adc317d55ff
	.xword	0xd93b511d2226560a



SECTION .ISEG_13 DATA_VA = 0x00000000d0100000
attr_data {
	Name	 = .ISEG_13,
	RA	 = 0x00000000d0100000,
	PA	 = ra2pa(0x00000000d0100000,0),
	part_0_d_ctx_nonzero_ps0_tsb,
	TTE_G	 = 1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 1
}

.data
	.xword	0x955e06ab55cb1dcd
	.xword	0x4824eeb1a67ea2e0
	.xword	0x8479faf3cc37dd46
	.xword	0x623aa8b84d7027eb
	.xword	0xa8242457471b749e
	.xword	0xbb8c626ee8047048
	.xword	0x8789addd8d09b7bc
	.xword	0xf7ed8882b3b88a97
	.xword	0xd36bdea1cd6204d4
	.xword	0xf3bcada66ca5b848
	.xword	0xd22644064eb769ff
	.xword	0xf8888013ea2a1bc0
	.xword	0x2f8d7ba87e08a32a
	.xword	0x4bbc42a7988bcdc3
	.xword	0x509d03a2fc7c850a
	.xword	0x9902d7b0e6f9673c
	.xword	0xe827cfc6b5e17ca1
	.xword	0x7a7b333238532dcf
	.xword	0x0bff3d17f5936ed2
	.xword	0x537d648dc1bb5476
	.xword	0xc0f611bb2cc63f2f
	.xword	0x0764c147de59c69d
	.xword	0xbdf5c8d716003c84
	.xword	0x897bf67fb262a1ea
	.xword	0x601edcbbdaf0f770
	.xword	0xcce5a3e8c9cbde4d
	.xword	0xc127734cb75d7a01
	.xword	0x8b31751d1b3c215a
	.xword	0xce2501968a0ffa85
	.xword	0xf092eb7c4c6bc668
	.xword	0x1574c31b99171bb2
	.xword	0xae51d884e2eaf16f
	.xword	0x677418f205056adb
	.xword	0x90d8cb90fa29affd
	.xword	0x6d770c950f9ad3cd
	.xword	0x4bf01344ae087f02
	.xword	0x417f8d6c73c0cefb
	.xword	0x7f4b99bc55661f20
	.xword	0xdf020f24aeb6465c
	.xword	0x358be601747cc5eb
	.xword	0x9a015cd9361a344b
	.xword	0x0101fb4d0b60bc9c
	.xword	0x02efabb74bb5713e
	.xword	0x0d5e3c2ae9ebf88a
	.xword	0xbb34b9ac641425c5
	.xword	0x297766f5ba99ea53
	.xword	0x3d658da20f0114e0
	.xword	0x0d711b3a65ce863c
	.xword	0x7a456b14e7e0e888
	.xword	0xff6d710b10774a8d
	.xword	0x31fbebfa21ac2a99
	.xword	0xc423b9c2cd95c1b3
	.xword	0xdaacbb3aaca192f2
	.xword	0xed9b68ee75310d03
	.xword	0x91e14e1132757c17
	.xword	0x0acdec5dd9ceb8db
	.xword	0xe2735f46d80d50ea
	.xword	0xfcc167481a0753e2
	.xword	0x02ed8e68d96222fb
	.xword	0xd3fb4d0a971aa810
	.xword	0x607751a7445ac99d
	.xword	0x9e6048f4c5fb9882
	.xword	0xb9537c6f4b988928
	.xword	0x7119703e3c144ab5
	.xword	0xa5c51ee147ecd53f
	.xword	0xc226192b642b2507
	.xword	0xa12e5b2705bd112f
	.xword	0x06f1c1f138104727
	.xword	0x7289a6f93c31e764
	.xword	0x4614916fea1813c9
	.xword	0x697c3d4bfef6c151
	.xword	0x130b64aa466a69fc
	.xword	0x53f21128f498a2e7
	.xword	0x8d07b019dca347b5
	.xword	0x0780ff56bf76eaf5
	.xword	0x62f91419d4477a57
	.xword	0x9777ddc7fc6af1ac
	.xword	0xb84859bd8223bf0b
	.xword	0xdc43e98b6e948737
	.xword	0x4b20545d5f7502a7
	.xword	0xadcbd143db082ab1
	.xword	0x690d4ad0524eda45
	.xword	0x912ad12753a0a050
	.xword	0x3ca7a516a5a0678b
	.xword	0xf1bc66059afd42ff
	.xword	0x31958013b27d6e52
	.xword	0x73e46b42ff62edca
	.xword	0xf78c62de7175872c
	.xword	0x8d439e075e90d0f0
	.xword	0x5275550cd04db61d
	.xword	0x804b59c02ffd043f
	.xword	0x13f7a06dfbb1cc08
	.xword	0x4ac37dd573359450
	.xword	0xbdbc786296dae529
	.xword	0xe0b9f292dfcd57f9
	.xword	0x11df853bd9f31ada
	.xword	0xf90f5f96536d4808
	.xword	0xac134ffea1cd3c55
	.xword	0xb2e87690b273e3f3
	.xword	0x47aa7e389587c5b8
	.xword	0xd1d5a252e4bfc870
	.xword	0x467e2a5571f4fd3b
	.xword	0x203601de3ad33058
	.xword	0x16ce614c5b2ec0af
	.xword	0x4fb5b2c08a0464de
	.xword	0xd60f61d5091ff418
	.xword	0xa22f1b9c19b675c9
	.xword	0x2319fa7e420d744b
	.xword	0x1e5efe512e5db208
	.xword	0xa12af0f5e689cc70
	.xword	0x5f91b1f9fb595c68
	.xword	0x5b4cbb27e224a8f1
	.xword	0xf64be62c7cd0cf2a
	.xword	0x5cf61ea07ac79735
	.xword	0x5e2c8d8846e8d60c
	.xword	0x9d550adc71d43269
	.xword	0xa1b7722e0db86a82
	.xword	0x29157256068f4d76
	.xword	0x65490992c4ec7a96
	.xword	0x0ec89fe051453a1c
	.xword	0xc0945a64ea808588
	.xword	0xe8c5ed4c5d1abdb8
	.xword	0x906a6aacc0e8df0d
	.xword	0xf7cf45077514244c
	.xword	0x2d51fbe4882444c6
	.xword	0x3d2e4f564a0c87d6
	.xword	0xce50a78b4f54a638
	.xword	0x72f148d80b55d65d
	.xword	0x6e6754a1dd9546be
	.xword	0xee84c26319d7ebc0
	.xword	0x1426f459f57c5bfe
	.xword	0x754a3c4fcc8c28a6
	.xword	0x73889fb62fc806a5
	.xword	0xe4cabc40ea02069c
	.xword	0x7c21ae2567134229
	.xword	0x30458daa263243d1
	.xword	0xe65194dc3f419b7a
	.xword	0x8410861b0920cfcd
	.xword	0x427b30d576bd1213
	.xword	0x7194190269700e7a
	.xword	0x8fdd69ad8b0932af
	.xword	0x5390d5be42bd6f2a
	.xword	0xa0796b702b6d1229
	.xword	0x6a3e120472340c76
	.xword	0x3cc96f250c6d29e7
	.xword	0xbac8fc500181c182
	.xword	0x21918b3d0bb91826
	.xword	0x40c28376e6be3a37
	.xword	0x198655f7d58628d9
	.xword	0x70f5e7c1b578bec6
	.xword	0x02b3ff98a4555628
	.xword	0x56b218d8ea483d23
	.xword	0xa596c18fd14262cd
	.xword	0x730e0ac4d38bd5e5
	.xword	0x1d41e8e428f22688
	.xword	0xc0a37c8c88c993c0
	.xword	0xcc0f2963ec01efc7
	.xword	0x0d8bc7c61bda0411
	.xword	0x2219438aeecf7e78
	.xword	0xa33b196b7c9319a3
	.xword	0xd22e43876eb90e88
	.xword	0x473f67553ac5c162
	.xword	0x0e0e4465be1cb5b2
	.xword	0xbf271ef0a5dd9322
	.xword	0x5f8ae31d957968e5
	.xword	0xcdaef4fa6bf119af
	.xword	0x613092e3e6758301
	.xword	0xa79c44f8f5cf9688
	.xword	0xfebaeb6275f4bba5
	.xword	0xc21c144d7cf5ff07
	.xword	0x88f6e81f61159c02
	.xword	0x4e3bfa063d9bac7a
	.xword	0x46cd20f9177a9964
	.xword	0x09c2d114e9dd8170
	.xword	0xa526d852fc5cc4bb
	.xword	0x9cf8a902ff2b7fae
	.xword	0x041470a84f6365b2
	.xword	0x80733860f48fea8c
	.xword	0x35b3f067896d2244
	.xword	0x5aae0c3e82df5a63
	.xword	0x8eed40e9abfdde06
	.xword	0xe65e6295ff4c7cfc
	.xword	0xf2b9e6d2088f97b0
	.xword	0xaab80cf57a96bc56
	.xword	0x0ed2149e0673a245
	.xword	0xfc4ff4073db5221a
	.xword	0xca357e83784f20e3
	.xword	0x0b212428025d12fa
	.xword	0x690213623243d521
	.xword	0xf6d7b446efdafd7c
	.xword	0x115e2322ba384742
	.xword	0x4363184fa31b4895
	.xword	0x447695793838a83e
	.xword	0xe2fb822594ef5bdd
	.xword	0xe31762cdd81287d2
	.xword	0xb25afe15c26bd841
	.xword	0xf9e260e83066be24
	.xword	0x131bd77e6752c1d1
	.xword	0x81ad2ff7daabe73a
	.xword	0x3f25ae7d9e1d3f9e
	.xword	0xb86adbde7af8f402
	.xword	0x7b633e511e7de1c1
	.xword	0x59d2f98cd8a943be
	.xword	0x0de9bef18681e4af
	.xword	0x89f55ca59287893f
	.xword	0x17bb5b7383dbfb15
	.xword	0x5029ca373f4d8147
	.xword	0xbd98152c3acd716b
	.xword	0x16f5c3d71f826a1e
	.xword	0x930a2fbff3aa235e
	.xword	0xea44ddcd52fdd6c8
	.xword	0x6d832d24ac714140
	.xword	0xb3bb0c365203ae90
	.xword	0x6fa96a4b2a973727
	.xword	0xbdc9a0b002f5ca7e
	.xword	0xf0391d82a68da795
	.xword	0xf9b62126fba8ab40
	.xword	0x45dbc1c05569e12f
	.xword	0x8bdd1173f54d52f6
	.xword	0x7677c86251776c10
	.xword	0xa27b26982f35eb52
	.xword	0xe4ffd5f4ea25e74c
	.xword	0x7cd3ae763efd6da8
	.xword	0xf1528e0c373a3f0a
	.xword	0x75fadbed9f1c2baa
	.xword	0x2e9f11c0be4dbd19
	.xword	0xa29d71579adc31c6
	.xword	0x2582c0d22f18ecf5
	.xword	0x5b65895fa27ea0b7
	.xword	0x79033023967734c4
	.xword	0xae4489f6c6556acc
	.xword	0x791fed84eb896c8d
	.xword	0x16b13969800835a1
	.xword	0x7decddbb2c9c1ff1
	.xword	0xc282d03fd12897ae
	.xword	0x575813bf97ed4494
	.xword	0x896e9b2607fbe3d7
	.xword	0xd9e6ade7d504df1a
	.xword	0x4b313b5bf802a955
	.xword	0x1805e6ad0647e7c6
	.xword	0x3c2f6e55c3a831eb
	.xword	0x4303394c58f5a1f9
	.xword	0x1f99a9e2cc96729b
	.xword	0xd282178de584a45f
	.xword	0x19e8b1e7584d3f43
	.xword	0xe9cd0402da83cc0e
	.xword	0x47b756ad92f1bb26
	.xword	0xe62a63e5ee4008d4
	.xword	0xb396479885149fa5
	.xword	0x83b02ad07fcc97a9
	.xword	0x809935e5be1acac7
	.xword	0xdcf7a7fa4137f8cb
	.xword	0x263532dadc92c634
	.xword	0x299d9345c4dc94e6
	.xword	0x54a3053b668c5473
	.xword	0x14a652c170cd0d24



SECTION .ISEG_14 DATA_VA = 0x00000000e0100000
attr_data {
	Name	 = .ISEG_14,
	RA	 = 0x00000000e0100000,
	PA	 = ra2pa(0x00000000e0100000,0),
	part_0_d_ctx_nonzero_ps0_tsb,
	TTE_G	 = 1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 1
}

.data
	.xword	0x309fc73431c08b1f
	.xword	0x838a445ec019277b
	.xword	0x2c597db93fe57155
	.xword	0x458b14f9565ff956
	.xword	0x5eeecc8781745554
	.xword	0xa2674c86951d5607
	.xword	0x577421a0955883ff
	.xword	0x8b9c9c18d2ea24d2
	.xword	0xfafb959392a8358a
	.xword	0x19c0948482d8dc96
	.xword	0xd4558cc81531967b
	.xword	0x5ba2dd2da70035e2
	.xword	0x29ec969aa5978ea6
	.xword	0x2b62034d2f4a81eb
	.xword	0xc1a49e1e96316c29
	.xword	0xbbe91093728d7eea
	.xword	0xf3f59826a647ffed
	.xword	0x723503883bff39e0
	.xword	0x37ea368b6ca83d8c
	.xword	0x61b7260ed74b5cc2
	.xword	0xbab3ad5e0e9b5304
	.xword	0x271f081cae52bc1c
	.xword	0xf711abcc7e03f0b4
	.xword	0x87a19d19b7eae40d
	.xword	0xfdba260ac6292210
	.xword	0x7e444903e6d0339e
	.xword	0x7bf01709930095b3
	.xword	0x1ca30368b0185bc8
	.xword	0xd78eda2fe79acb5e
	.xword	0x212093cc17233a4c
	.xword	0x55505531a5bc6336
	.xword	0x2231e7d66e3fd68c
	.xword	0x0a5da313a482cf1e
	.xword	0xc9bf22004767b63e
	.xword	0x0d19a75d64d26b5b
	.xword	0xefaef83c525b8a7d
	.xword	0xa51ecb75b734563a
	.xword	0x17076311dda087b2
	.xword	0x631a8df90f1bcf5a
	.xword	0x5908cd50f9bf7b86
	.xword	0x15f791c655035678
	.xword	0x8d81a32b40549ed1
	.xword	0x3de1a208a9b805b6
	.xword	0x28ae2b7a268ec6c4
	.xword	0xc1669e0733ff713f
	.xword	0x707fb99416ac8777
	.xword	0xbe5c82c5038d51e4
	.xword	0xf4802d085b5f88ea
	.xword	0x76233db387169239
	.xword	0x46a9d15bb57d5202
	.xword	0x3c98131f23e6c149
	.xword	0xbeb183115b627909
	.xword	0x10842af3c19479aa
	.xword	0xb5cd4962c63ce623
	.xword	0x5d4b79f2447e9856
	.xword	0xf97e9f9f2edf463f
	.xword	0x101a8bd30c1a6b79
	.xword	0x0296926a0e3a508f
	.xword	0x5340c7b6f30638cd
	.xword	0xf4528f527a1f2d1a
	.xword	0xa3182fe877da9935
	.xword	0x390a1fb1a154cc6c
	.xword	0xd2779dea7c040222
	.xword	0xf52dbe86d6d84628
	.xword	0x23d52a8af6e3576b
	.xword	0xbd86f61dc8066198
	.xword	0x4a2e41cba47ea4c8
	.xword	0x56fb4ccd6b590d8f
	.xword	0xd7210c5b78fb5090
	.xword	0xacfbc494c26ea6db
	.xword	0x05703a5a6c7dcbc1
	.xword	0xbfd6fa2135862e5f
	.xword	0x24ce3d48e6c172dd
	.xword	0xf7d1198c79eda93f
	.xword	0x6d50f3b27b9d5de8
	.xword	0xec8b50573683ad71
	.xword	0x2f49e6c849f30257
	.xword	0xf4d885c0179f35c4
	.xword	0xfe34dc49ed5a7b97
	.xword	0xce0e72dff4995511
	.xword	0xad75f236fa401369
	.xword	0x1bc9de2f13af0a14
	.xword	0x4889b7d6067ba33b
	.xword	0x4dc54b23d19ce935
	.xword	0xe069ae54212dd5c8
	.xword	0x727df58dd3a0d4a0
	.xword	0xfdde07954f953b58
	.xword	0x7551e29cc2ac2c76
	.xword	0x2fe7e811053f19c8
	.xword	0xd601ef95316437e3
	.xword	0x06f52afef1dca465
	.xword	0x12699b46072d010c
	.xword	0x183fb04dcf0814a5
	.xword	0xe478587df20476bc
	.xword	0xe453c5b3a6002d6f
	.xword	0x45afc238101e5470
	.xword	0x96832a1e493e0a21
	.xword	0xf79eafa7cf398b55
	.xword	0x6175df136dfe8fc7
	.xword	0x48a952bbce801d1d
	.xword	0x2aa7ef1398c8d251
	.xword	0x0e676151d0b379c5
	.xword	0xc224c46ffafc18d8
	.xword	0x2b4f81ca241d065b
	.xword	0x0a72a52125c6981b
	.xword	0xb134a346665fde14
	.xword	0xdca15c6f8f4a449d
	.xword	0x0a36d644b1c677df
	.xword	0xe7e31c3f86c13736
	.xword	0x53a70d94f34834da
	.xword	0xf92698e2a7c50851
	.xword	0x44c8a70832daf075
	.xword	0x7d4ee577585e233e
	.xword	0x607f9de0ada4c8cc
	.xword	0x9d58dbd85241c248
	.xword	0x1cbcb3ce3a2cc347
	.xword	0x6f3be24ab9f5c529
	.xword	0x7afabcf1496a6586
	.xword	0xbd496a605e44eefe
	.xword	0x26ae57d513ed678e
	.xword	0xe22c1942f4d8ae52
	.xword	0xd4bc1f691330923e
	.xword	0x299f66683c041764
	.xword	0x50d53dc0273edb1f
	.xword	0x6b433742a1b8088e
	.xword	0x551d77d7c7bc820a
	.xword	0x230e18eeab8af91e
	.xword	0x5557820a996190ee
	.xword	0x09b4ce7012fbde8f
	.xword	0x004895c18f2f821d
	.xword	0x18a76ded4f70073e
	.xword	0x34a180fefac11d8d
	.xword	0x66e42a82d851d9a2
	.xword	0x156f8c3667a96a9b
	.xword	0x19a6b4e93ef64e75
	.xword	0xeb505b9ba1c27119
	.xword	0x2a86284b43fc9978
	.xword	0xaa9fe0333666bbf9
	.xword	0x1d7774cc24f07ef2
	.xword	0x53b5ec36de7a19bb
	.xword	0xfd8b952710260832
	.xword	0x7283f902670cb032
	.xword	0x2b88b635b496d2db
	.xword	0x3cc8a0f5cef9b31c
	.xword	0x386294b5063ca008
	.xword	0xcb490e084eacb5f6
	.xword	0x44baaa5d441460ce
	.xword	0x3eb469cd41c15434
	.xword	0x81723bd0d9db2175
	.xword	0xecbabe43ac166298
	.xword	0x7d2d898d3cac710f
	.xword	0x201673370fc33b50
	.xword	0x5a6316c540eb5c7c
	.xword	0x61a5f328b51084b1
	.xword	0x9bd14ff1a42fe2f0
	.xword	0x79a01f91c8147d7d
	.xword	0x3fa808571646cc66
	.xword	0x153200ca5eae4958
	.xword	0x4d2c248ba1ea6757
	.xword	0x119b4d5387737464
	.xword	0xc6c069ed0bfb34d8
	.xword	0x0f1aacc65f7630f7
	.xword	0xe0f14c5cf6003d3d
	.xword	0x7a71f17ce5484093
	.xword	0x0c6ab7d8f66308c0
	.xword	0xe2489fdc8194a1d2
	.xword	0xc55f9789884b14be
	.xword	0x8140924fa3599eda
	.xword	0xcbf9bd402ec6e3f9
	.xword	0x1d3bee6541f83b81
	.xword	0xc25e6b9da027f330
	.xword	0xe6fdcbad5f44a8d8
	.xword	0xe6682d92cd5c954a
	.xword	0xc5b12200973beade
	.xword	0x3df654c6da290d3d
	.xword	0xb39479214b9f0d8a
	.xword	0x864a6a62eaa78e86
	.xword	0x2855e325ae6a8b8a
	.xword	0xb0e40b2ee603ceb8
	.xword	0x83aff8cfb257f2a3
	.xword	0x8bf23d82269e610a
	.xword	0x1435a3df14d2323c
	.xword	0x8a2ca13e98416b25
	.xword	0x9770dd111dfaa099
	.xword	0xcf86d9541d450338
	.xword	0xc6ebf2975a36a7be
	.xword	0x22f7c4677cc7da2a
	.xword	0x793bdd237c002754
	.xword	0xfde34a5fcfa1e071
	.xword	0xb0bd9bbe15f1d646
	.xword	0x0f7b0619cefdbd65
	.xword	0xa75e8a128c51e8ce
	.xword	0x2e25b6e1040430bf
	.xword	0x11781f690fbcc3d0
	.xword	0x1a31a67747a718eb
	.xword	0x9c04dd7a381616f0
	.xword	0xb2ae1baa895c1fc8
	.xword	0x5cd8d0af805090f1
	.xword	0xad250b4df1c768ec
	.xword	0xc8d3a7d9a7341f86
	.xword	0x5bc96f667c2ca395
	.xword	0x025054387cd4a930
	.xword	0x7d5fa6f4bfcb8058
	.xword	0xd507b45d4d9c8966
	.xword	0x6f0c32a351e9ed09
	.xword	0xd30f992235831c79
	.xword	0xa24e64f1b3d5d93d
	.xword	0x51b41fc5b6a2769a
	.xword	0xc5d109c08ccb0122
	.xword	0x8729a3ab87db72bc
	.xword	0xfd89054127c4f2e0
	.xword	0x53842d50e1592120
	.xword	0x3527a7492a200a0d
	.xword	0xae1095eba7cf6086
	.xword	0x56436e374a3806a2
	.xword	0x464f4707311917f8
	.xword	0xfe73e69b1b35e7d1
	.xword	0xfd84ad07a1676ba4
	.xword	0xd67a48774fc72238
	.xword	0x2ec91780b3320f25
	.xword	0xbcd7f4ee3f92a4a9
	.xword	0x8e893142bcf7f8b2
	.xword	0x549a38bc9d83fc7e
	.xword	0x8e551f3fd106fc65
	.xword	0x2c109bc0458c4a69
	.xword	0xd4f6ea1c91fa2ad3
	.xword	0xc589e8dc6b54f62d
	.xword	0x4bdf120a457b693f
	.xword	0x4e8cc32d3a8e41ea
	.xword	0x04e13aa6d9199567
	.xword	0xc3191b2281db32c7
	.xword	0x9801fb2f1a30b756
	.xword	0x601115b76c28449b
	.xword	0x13d82e5f04f58b4e
	.xword	0x50488992b93ad9be
	.xword	0x55082b7151b0dcb6
	.xword	0x68e35de6c2da55f2
	.xword	0x6717f7cea333a611
	.xword	0x1786088fe5265efb
	.xword	0x79a46fec48ee39ce
	.xword	0xdcc00d9f61edb3a9
	.xword	0x5e892a83fcf172f0
	.xword	0x88567929a5a552f6
	.xword	0xf02ee972bdcd728f
	.xword	0xa14e677f0ca9951d
	.xword	0x869d85f842a991f0
	.xword	0x999a226f5ba5332b
	.xword	0x2076049ead5e2b13
	.xword	0xe8e9d8677777dc1c
	.xword	0x382de6ac687be73e
	.xword	0x224f90d8dd921061
	.xword	0x3d21f174c09fd400
	.xword	0xfd7665e77c3e2925
	.xword	0x468c614247679e9d
	.xword	0xf76d163e6dffe4f1
	.xword	0xb05a1f04850ac147



SECTION .ISEG_15 DATA_VA = 0x00000000f0100000
attr_data {
	Name	 = .ISEG_15,
	RA	 = 0x00000000f0100000,
	PA	 = ra2pa(0x00000000f0100000,0),
	part_0_d_ctx_nonzero_ps0_tsb,
	TTE_G	 = 1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 1
}

.data
	.xword	0x9d6bdaa4247cdd79
	.xword	0x6ccf70ba97bbdae7
	.xword	0x30b56d5f99bcc663
	.xword	0x7adcf864d9ac5a12
	.xword	0xef71327d1c7ea459
	.xword	0x1484369d7ffe45bf
	.xword	0x8e00a6c08ce20420
	.xword	0xf98e1820cb9ee3ef
	.xword	0xbc21c64870b57cdd
	.xword	0x2972e5241684f035
	.xword	0x9227f010ead1276f
	.xword	0xe56a0d9bc5eb80bf
	.xword	0x650a585a0b2ffdf8
	.xword	0xeb7ab8496b7b51fd
	.xword	0x9372e5fe28aa7e8d
	.xword	0x1b9c57fc0126b250
	.xword	0xfaf9def6c1f608bf
	.xword	0x0d2b8329550c87ad
	.xword	0x6c271a6af6c6363b
	.xword	0xa34682ed8de3869b
	.xword	0x53ecd342bc6315da
	.xword	0x77920de3b0ff9494
	.xword	0x6d0fff386144da6a
	.xword	0xed1bedfd4e59b6b6
	.xword	0x2f4af1b21b695e36
	.xword	0xeae14fb93f138db7
	.xword	0x822d882dfc573051
	.xword	0xedd6f7bb37bf57e5
	.xword	0xd2ea1c0870dee4d0
	.xword	0xf782743d9af508f1
	.xword	0xff599564aa197756
	.xword	0x9b083ee42995e807
	.xword	0xb3e644130cbf71d9
	.xword	0x6f4d7c27bb778acb
	.xword	0x73e539717f728850
	.xword	0xc00771c5bbff32ec
	.xword	0x170cbc4937961795
	.xword	0x1b63739402af40e8
	.xword	0xb1a6aca137528888
	.xword	0x7a166d0908a54ddc
	.xword	0x2527848a41e3bee8
	.xword	0xfa2ab470126b3d22
	.xword	0x22ac2196d891383d
	.xword	0x1b4e0b02dcf736f5
	.xword	0x2f91f7b60b296005
	.xword	0x58dc3ed2dea785b0
	.xword	0xd3381f758349db40
	.xword	0xff6b3f550672e1ce
	.xword	0x500e26696a81194d
	.xword	0x38dcd85b7a0a527f
	.xword	0x96143dc033cd07c7
	.xword	0xe686f81b6fecd6b6
	.xword	0x91e99560016bbe98
	.xword	0xe1688a34b3a3975f
	.xword	0xbf62dc8454cdbb56
	.xword	0xce88f6e91e9444da
	.xword	0x5e2bcbef93010d5c
	.xword	0x472caeb98e90ed27
	.xword	0xe51827fc7b7a1357
	.xword	0xa97d863b446092d8
	.xword	0x20aeaa8014f80c84
	.xword	0x4665889bb8625dcc
	.xword	0xfb3a3bb6805d60e6
	.xword	0x4f38a8109c6494a4
	.xword	0x9ca4c1d2ac6abd8e
	.xword	0xae17b1311d2d359c
	.xword	0x05ffddc8743283c4
	.xword	0x719122f58622afc0
	.xword	0x8719159734ed9504
	.xword	0x7b4a7e7a8e49cdc6
	.xword	0x3048bb082666dc95
	.xword	0xff35cebe91de0964
	.xword	0x97f21478304ff902
	.xword	0xfd4c54f45c646011
	.xword	0x257afedf691b1c74
	.xword	0xa68fe9fb0e74f540
	.xword	0xd37a10af75f3ae43
	.xword	0x20506ca303d05b9c
	.xword	0x218b66261ceb4f6a
	.xword	0x5cdaa8e1bf165eef
	.xword	0x9227c1df9ab14d47
	.xword	0xf94f5e5d6e17e2df
	.xword	0x213dce5d42760892
	.xword	0xa3c5f991d90aa931
	.xword	0x838c9cf4dcac4083
	.xword	0x1c3aa9f2dce9117b
	.xword	0x61cb214d5f5b3b8d
	.xword	0x92fb87398887dde7
	.xword	0xfed27c9a867cc6c5
	.xword	0xf96009c687ca6d0a
	.xword	0x15de0cbbaed011cb
	.xword	0x44e5599c57dfbca7
	.xword	0x87b2f162c77ac6ad
	.xword	0x0f35874588215c15
	.xword	0x396b6d51cd6dbeda
	.xword	0x733c712f2cf0e35c
	.xword	0x16ce247d851a0582
	.xword	0xada3b6b1a5adc937
	.xword	0xde5d69a799790945
	.xword	0x7ced6f393d33532b
	.xword	0xad782dbdece70df6
	.xword	0x7d6166126de43166
	.xword	0xab2b784c283e3cf7
	.xword	0x8d9e8464dbc67224
	.xword	0xdbce811f4401ffdb
	.xword	0x6768c9e67bf82d79
	.xword	0xd02aae8442e85299
	.xword	0x42fce5b723ae0051
	.xword	0xe5d1e22aad42f17e
	.xword	0xcac2ecc6a85a0633
	.xword	0xde6a58dd05f6c127
	.xword	0x56a530896c16341e
	.xword	0x13e4a2462508060e
	.xword	0xa81113735f7e0ba5
	.xword	0xa203e40d84ab5785
	.xword	0x3acc56ff07c9a890
	.xword	0x987625509c8579ad
	.xword	0x1a26a9f629e3e399
	.xword	0x729be7ccdba7c426
	.xword	0xe5101e9f905874c1
	.xword	0xf486875bf86a7d74
	.xword	0x1b6d63e0c3895f1a
	.xword	0xca11e1accc50b084
	.xword	0x6d5ae318b0100f16
	.xword	0x14aee907012ab75d
	.xword	0x5431ab95c2378ef2
	.xword	0xfa82917c15f4b124
	.xword	0x01ee1eaba385a05a
	.xword	0x3373edba9c5fc28b
	.xword	0x0a24fde41d0c5d8a
	.xword	0x0368294999a27a3b
	.xword	0xa18bbc3f7370cf2f
	.xword	0x7e0bb387f22a613a
	.xword	0x639112d63cf419b5
	.xword	0xc10323b4676cd3ad
	.xword	0x068d916366f8aeb2
	.xword	0x97fa92acff9563dc
	.xword	0x8cce414a859ad40b
	.xword	0x53c7a2ef76a9323d
	.xword	0xb5b66403503b0d40
	.xword	0x6d4596b6aea8a6b2
	.xword	0xbe7bba31935b52a3
	.xword	0xe9af8543fde5e0b2
	.xword	0x6b7aa43d7e00a381
	.xword	0xaa6c2cf808d78d6c
	.xword	0xe3ec7b9dc820379a
	.xword	0xf813cb3bbb9611b4
	.xword	0x77a4404ecfbab29b
	.xword	0xcc0388d68286d803
	.xword	0xa82813b42d92b378
	.xword	0xea16a8e9e2da5357
	.xword	0xc6717f4c4f8c99cf
	.xword	0x1a1ddfbb6f975b66
	.xword	0x286c7c7503257c7c
	.xword	0x55bb1da5f22ee95d
	.xword	0x0f60aea3df7847a4
	.xword	0xa85b677d2c6bf055
	.xword	0xaa93c7454416589d
	.xword	0x863c452e62750749
	.xword	0x07b5a35a709c761f
	.xword	0xaa3bba69204cf643
	.xword	0x4a205ec563220f13
	.xword	0x8a93d56ca622a83c
	.xword	0xc8ccd4614bf11402
	.xword	0x8aeabbbd65e9d274
	.xword	0xb85f2f99d6e9f73b
	.xword	0x67e30c7947b8c747
	.xword	0x78467167b318f00d
	.xword	0x674818b808f66d7d
	.xword	0x2d76d8722833076a
	.xword	0xa299e225bb632419
	.xword	0x49fb3904dba0b923
	.xword	0xd5adac8300603d52
	.xword	0xcb4aac5f8603ebd0
	.xword	0x7a47b3d30b8eb2a1
	.xword	0x66743f621eebc591
	.xword	0x120876289ab1758b
	.xword	0x4002bf603d586fee
	.xword	0xdb53273c825ecd17
	.xword	0x2abbcd3ff7f3234f
	.xword	0xcd285bbd06312c7c
	.xword	0x33d2cfd12cb0fb85
	.xword	0x4c6a899e266d50dd
	.xword	0x675c49ab91426209
	.xword	0x2fa2a89d8d26b963
	.xword	0x7938e687d6a915bd
	.xword	0xb47ee4d2794f740a
	.xword	0x1eeead7fb1ec8907
	.xword	0xb8f5dae0d7389046
	.xword	0xe544efa6311ed2a9
	.xword	0x756bc880c0f757a9
	.xword	0x5cc26efd3cba23c6
	.xword	0x38d47b387a3aef2b
	.xword	0xa2a5eb5047282073
	.xword	0xc2000ebe6ea429d9
	.xword	0x4a95bf3131c1003b
	.xword	0x86db75e228fafb6d
	.xword	0x3d0fd07bb2f9f3b2
	.xword	0x7f097808d181b38f
	.xword	0xb3466b22e649cf25
	.xword	0x3d28cb1286189db3
	.xword	0xd3fa19f06c44b329
	.xword	0x7c6c3dcdc6603936
	.xword	0x0540f4404d5726da
	.xword	0x4b499af69c71d6b8
	.xword	0xdf4bd287e669cb73
	.xword	0xa7ec2951b1429689
	.xword	0xc5372d8e45ca92be
	.xword	0xc2417ffc676fca13
	.xword	0xbe3c8d281a3f7588
	.xword	0xb13484e57a5e8889
	.xword	0x14478946c554eb86
	.xword	0x3f5e8a1d53d291ac
	.xword	0xadaf836f717951fe
	.xword	0xb71b15ef925357e4
	.xword	0x5adc1d5771aee71d
	.xword	0x4cbd5ec1a299a2f2
	.xword	0xfafb6b12ddef64de
	.xword	0x994ed01b619fd29d
	.xword	0x987da2670701b02f
	.xword	0x1404ef008ff8921f
	.xword	0x8e18219cf2ebd3fd
	.xword	0x552c5c2f481a822c
	.xword	0xcf2e3b0d0226300e
	.xword	0x0025cdccc5872973
	.xword	0x610607c850b104ed
	.xword	0x8c4ab3138da53582
	.xword	0xb177017fe7010349
	.xword	0xac3aa5a12f00cc69
	.xword	0xdd5649f8bab8f80d
	.xword	0xeb32fd7f033af82e
	.xword	0xcdc918b4ff942275
	.xword	0x9b6fdc7cc6408a75
	.xword	0x9d9c9411d396b95c
	.xword	0x86b00f4b0659d9d1
	.xword	0x6b91b12e628c2072
	.xword	0x0bb42241affb496d
	.xword	0x938bc31cbc667c4b
	.xword	0xfe5df1a37a7f7570
	.xword	0x7636c93f4e9557bc
	.xword	0x803b290f7d4aec46
	.xword	0x20cb36308acc7fcd
	.xword	0x9150808a86d80143
	.xword	0xc1ac365bc1111bc2
	.xword	0xa7acc446f3abd783
	.xword	0xe7b87c0c00bc771e
	.xword	0x3b39a842a22185b3
	.xword	0x006168e2b84ddd72
	.xword	0xa15813cf9b8c3212
	.xword	0xe4793586a5ad8163
	.xword	0x63cdb3e3f4c1e3f4
	.xword	0xe6ff9a8262951387
	.xword	0x69d171b26e63d53f
	.xword	0xfe5cf08ee83e5fba
	.xword	0x27f66a6b04b4dc4e
	.xword	0x5e61203a7c37f13c



#if 0
!!# /*
!!#  */
!!# 
!!# %%section c_declarations
!!# 
!!# 
!!#   uint64 b_DATA_ARRAY[12000], h_DATA_ARRAY[12000], w_DATA_ARRAY[12000], x_DATA_ARRAY[12000];
!!#   uint64 b_ADDR_ARRAY[12000], h_ADDR_ARRAY[12000], w_ADDR_ARRAY[12000], x_ADDR_ARRAY[12000];
!!#   uint64 data_st = 0;
!!#   uint64 addr_st = 0;
!!#   uint64 noise_data_st = 0;
!!#   uint64 data_ld = 0;
!!#   int wr_cntr = 0;
!!#   int rd_cntr = 0;
!!#   int b_wr_cntr = 0;
!!#   int b_rd_cntr = 0;
!!#   int h_wr_cntr = 0;
!!#   int h_rd_cntr = 0;
!!#   int w_wr_cntr = 0;
!!#   int w_rd_cntr = 0;
!!#   int x_wr_cntr = 0;
!!#   int x_rd_cntr = 0;
!!#   int a_addr_sel = 0;
!!#   int a_wr_cntr = 0;
!!#   int a_rd_cntr = 0;
!!#   int b_a_wr_cntr = 0;
!!#   int b_a_rd_cntr = 0;
!!#   int h_a_wr_cntr = 0;
!!#   int h_a_rd_cntr = 0;
!!#   int w_a_wr_cntr = 0;
!!#   int w_a_rd_cntr = 0;
!!#   int x_a_wr_cntr = 0;
!!#   int x_a_rd_cntr = 0;
!!#   int i =0;
!!#   int j =0;
!!#   uint64 jbi0, jbi1, jbi2, jbi3, jbi4, jbi5, jbi6, jbi_addr,jbi_config,mem_ad;
!!#   int fr_done = 0;
!!#   int addr_sel = 0;
!!#   int store_addr = 0;
!!#   int rnd_cnt = 0;
!!#   int invalid_config = 1;
!!#   int config_cnt = 0;
!!# 
!!#   int sjm0_w_mask = 0, sjm1_w_mask = 0;
!!#   int m_tmp = 0;
!!#   uint64 mask = 0;
!!#   int sjm_rd0 = 0, sjm_wr0 = 0, sjm_rd1 = 0, sjm_wr1 = 0;
!!#   int sjm4_dat = 0, sjm5_dat = 0, sjm4_cnt = 0, sjm5_cnt = 0;
!!#   int sjm0_data[8][16];
!!#   int sjm1_data[8][16];
!!#   uint64 sjm0_addr[8], sj4_ad = 0;
!!#   uint64 sjm1_addr[8], sj5_ad = 0;
!!# 
!!#   int sjm_rd0_io = 0, sjm_wr0_io = 0, sjm_rd1_io = 0, sjm_wr1_io = 0;
!!#   int sjm4_cnt_io = 0, sjm5_cnt_io = 0;
!!#   int sjm0_data_io[8][16];
!!#   int sjm1_data_io[8][16];
!!#   uint64 sjm0_addr_io[8];
!!#   uint64 sjm1_addr_io[8];
!!# 
!!#   int sjm_rd0_io1 = 0, sjm_wr0_io1 = 0, sjm_rd1_io1 = 0, sjm_wr1_io1 = 0;
!!#   int sjm4_cnt_io1 = 0, sjm5_cnt_io1 = 0;
!!#   int sjm0_data_io1[8][16];
!!#   int sjm1_data_io1[8][16];
!!#   uint64 sjm0_addr_io1[8];
!!#   uint64 sjm1_addr_io1[8];
!!# 
!!#   int sjm0_w_mask_m_io = 0, sjm1_w_mask_m_io = 0;
!!#   int sjm_rd0_m_io = 0, sjm_wr0_m_io = 0, sjm_rd1_m_io = 0, sjm_wr1_m_io = 0;
!!#   int sjm4_cnt_m_io = 0, sjm5_cnt_m_io = 0;
!!#   int sjm0_data_m_io[8][16];
!!#   int sjm1_data_m_io[8][16];
!!#   uint64 sjm0_addr_m_io[8];
!!#   uint64 sjm1_addr_m_io[8];
!!#   int     rnd_n,b_sz;
!!# 
!!# #define ISEG	0
!!# #define MY_HYP_SEC	1
!!# #define UDATA1	2
!!# #define NCDATA0	3
!!# #define NCDATA1	4
!!# #define NCDATA2	5
!!# #define NCDATA3	6
!!# #define NCDATA4	7
!!# #define NCDATA5	8
!!# #define NCDATA6	9
!!# 
!!# %%
!!# %%section control
!!# 
!!# %%
!!# %%section init
!!# {
!!# 
!!# 
!!#   IJ_set_rvar ("diag.j", 104, rv_0, "{11}");
!!# 
!!#   IJ_set_rvar ("diag.j", 106, wt_ld, "{30}");
!!#   IJ_set_rvar ("diag.j", 107, wt_st, "{30}");
!!#   IJ_set_rvar ("diag.j", 108, wt_bl, "{30}");
!!#   IJ_set_rvar ("diag.j", 109, wt_alu, "{3}");
!!# 
!!#   IJ_set_rvar ("diag.j", 112, Rv_rand64, "64'hrrrr rrrr rrrr rrrr");
!!#   IJ_set_rvar ("diag.j", 113, Rv_Simm13, "13'b0 0000 rrrr r000");
!!#   IJ_set_rvar ("diag.j", 114, Rv_addr_sel, "3'brrr");
!!# 
!!#   IJ_set_rvar ("diag.j", 119, Rv_memaddr_pattern_dma,
!!#         "24'{0},"
!!# 
!!#         "20'b 000r rrrr rrrr rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rr00 0000,");
!!# 
!!#   ! only 60* or 61*
!!#   IJ_set_rvar ("diag.j", 128, Rv_memaddr_pattern_io,
!!#         "4'{0},"
!!# 
!!#         "20'b 0000 0000 0000 0000 0110,"
!!#         "20'b 000r rrrr rrrr rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rr00 0000,");
!!# 
!!#   IJ_set_rvar ("diag.j", 137, Rv_rand32, "32'hrrrr rrrr");
!!#   IJ_set_rvar ("diag.j", 138, Rv_rand_mask, "32'h0000 rrrr");
!!# 
!!#   IJ_set_rvar ("diag.j", 142, Rv_memaddr_pattern,
!!#         "24'{0},"
!!# 
!!#         "20'b 0000 0000 1101 0000 1000,"
!!#         "20'b 1110 0001 000r rr00 0000,");
!!#          ! init only till 7fff 
!!# 
!!#         !"20'b 0001 0000 rrrr 0000 0001,"
!!#         !"20'{0}");
!!# 
!!#   ! Define address patterns for all the various address
!!#   ! spaces in JBI
!!# 
!!#   ! 80_1000_0000 - 80_FFFF_FFFF (Should not be 80_0*)
!!#   IJ_set_rvar ("diag.j", 158, Rv_jbiaddr_pattern0,
!!#         "24'{0},"
!!# 
!!#         "20'b 0000 0000 1101 0000 0001,"
!!#         "20'b 1110 1111 000r rr00 0000,");
!!#          ! init only till 7fff 
!!# 
!!#   ! 80_0E00_0000 - 80_0EFF_FFFF
!!#   ! Since we are doing it in the user area, and .1000 are 
!!#   ! init to zeros 
!!#   ! the address is : 0xd01ee000
!!#   IJ_set_rvar ("diag.j", 172, Rv_jbiaddr_pattern1,
!!#         "24'{0},"
!!# 
!!#         "20'b 0000 0000 1101 0000 0010,"
!!#         "20'b 1110 1111 000r rr00 0000,");
!!#          ! init only till 7fff 
!!# 
!!#   ! 80_0F00_0000 - 80_0FFF_FFFF
!!#   IJ_set_rvar ("diag.j", 185, Rv_jbiaddr_pattern2,
!!#         "24'{0},"
!!# 
!!#         "20'b 0000 0000 1101 0000 0011,"
!!#         "20'b 1110 1111 000r rr00 0000,");
!!#          ! init only till 7fff 
!!# 
!!#   ! C0_0000_0000 - CF_FFFF_FFFF
!!#   IJ_set_rvar ("diag.j", 197, Rv_jbiaddr_pattern3,
!!#         "24'{0},"
!!# 
!!#         "20'b 0000 0000 1101 0000 0100,"
!!#         "20'b 1110 1111 000r rr00 0000,");
!!#          ! init only till 7fff 
!!# 
!!#   ! D0_0000_0000 - DF_FFFF_FFFF
!!#   IJ_set_rvar ("diag.j", 209, Rv_jbiaddr_pattern4,
!!#         "24'{0},"
!!# 
!!#         "20'b 0000 0000 1101 0000 0101,"
!!#         "20'b 1110 1111 000r rr00 0000,");
!!#          ! init only till 7fff 
!!# 
!!#   ! E0_0000_0000 - EF_FFFF_FFFF
!!#   IJ_set_rvar ("diag.j", 221, Rv_jbiaddr_pattern5,
!!#         "24'{0},"
!!# 
!!#         "20'b 0000 0000 1101 0000 0110,"
!!#         "20'b 1110 1111 000r rr00 0000,");
!!#          ! init only till 7fff 
!!# 
!!#   ! F0_0000_0000 - FE_FFFF_FFFF ( Should not be FF*)
!!#   IJ_set_rvar ("diag.j", 233, Rv_jbiaddr_pattern6,
!!#         "24'{0},"
!!# 
!!#         "20'b 0000 0000 1101 0000 0111,"
!!#         "20'b 1110 1111 000r rr00 0000,");
!!#          ! init only till 7fff 
!!# 
!!#   ! FF_F000_0000 - FF_FFFF_FFFF 
!!#   IJ_set_rvar ("diag.j", 243, Rv_ssiaddr_pattern,
!!#         "24'{0},"
!!# 
!!#         "20'b 1111 1111 1111 rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr r000,");
!!# 
!!#   ! Other  cases ?? when LOW TH and HG TH are random, HI>LO always (TBD)
!!# 
!!#   IJ_set_rvar ("diag.j", 254, Rv_jbi_fifo_wr0_config,
!!#         "24'{0},"
!!# 
!!#         "20'b 0000 0000 0rrr 0rrr 00rr,"
!!#         "20'b 00rr rrrr 0000 0000 rrrr,");
!!# 
!!#   IJ_set_rvar ("diag.j", 262, Rv_jbi_fifo_wr1_config,
!!#         "24'{0},"
!!# 
!!#         "20'b 0000 0000 0rrr 0rrr 00rr,"
!!#         "20'b 00rr rrrr 1rrr 0000 rrrr,");
!!# 
!!#   IJ_set_ropr_fld    ("diag.j", 270, ijdefault, Ft_Rs1, "{6,7,9,10,11,12,13}");  ! BASE
!!#   IJ_set_ropr_fld    ("diag.j", 271, ijdefault, Ft_Rs2, "{8}");
!!#   !IJ_set_ropr_fld    (ijdefault, Ft_Rd, "{16..23}");
!!#   !IJ_set_ropr_fld    (Rv_ldstD, Ft_Rd, "{16,18,20,22}");
!!#   IJ_set_ropr_fld    ("diag.j", 274, ijdefault, Ft_Rd, "{16,18,20,22}");
!!# 
!!#   !IJ_set_ropr_fld    (ijdefault, Ft_Simm13, "13'b0 0000 0000 0000");
!!#   IJ_set_ropr_fld    ("diag.j", 277, ijdefault, Ft_Simm13, "13'b0 0000 00rr r000");
!!#   IJ_set_ropr_fld    ("diag.j", 278, ijdefault, Ft_Imm_Asi, "{0}");
!!# 
!!#   IJ_bind_file_group("diag.j", 282, sjm_4,"sjm_4.cmd", NULL);;
!!#   IJ_bind_file_group("diag.j", 283, sjm_5,"sjm_5.cmd", NULL);;
!!# 
!!#   IJ_bind_thread_group("diag.j", 286, th_M, 0x1);
!!# 
!!#   IJ_printf ("diag.j", 288, sjm_4, "CONFIG id=28 iosyncadr=0x7CF00BEEF00\n");
!!#   IJ_printf ("diag.j", 289, sjm_4, "TIMEOUT 10000000\n");
!!#   IJ_printf ("diag.j", 290, sjm_4, "IOSYNC\n");
!!# 
!!#   IJ_printf ("diag.j", 292, sjm_4, "#==================================================\n");
!!#   IJ_printf ("diag.j", 294, sjm_4, "#==================================================\n");
!!#   IJ_printf ("diag.j", 295, sjm_4, "\n\nLABEL_0:\n");
!!# 
!!#   IJ_printf ("diag.j", 297, sjm_5, "CONFIG id=30 iosyncadr=0x7EF00BEEF00\n");
!!#   IJ_printf ("diag.j", 298, sjm_5, "TIMEOUT 10000000\n");
!!#   IJ_printf ("diag.j", 299, sjm_5, "IOSYNC\n");
!!#   IJ_printf ("diag.j", 300, sjm_5, "#==================================================\n");
!!#   IJ_printf ("diag.j", 302, sjm_5, "#==================================================\n");
!!#   IJ_printf ("diag.j", 303, sjm_5, "\n\nLABEL_0:\n");
!!# 
!!#   IJ_init_regs_by_setx ("diag.j", 306, th_M, 3, 1, Rv_rand64);
!!# 
!!#   IJ_printf ("diag.j", 308, th_M, "\tmov\t0, %%r8\n");
!!#   IJ_printf ("diag.j", 309, th_M, "\tsetx\t0x%016llrx, %%r1, %%r6\n", Rv_jbiaddr_pattern0);
!!#   IJ_printf ("diag.j", 310, th_M, "\tsetx\t0x%016llrx, %%r1, %%r7\n", Rv_jbiaddr_pattern1);
!!#   IJ_printf ("diag.j", 311, th_M, "\tsetx\t0x%016llrx, %%r1, %%r9\n", Rv_jbiaddr_pattern2);
!!#   IJ_printf ("diag.j", 312, th_M, "\tsetx\t0x%016llrx, %%r1, %%r10\n", Rv_jbiaddr_pattern3);
!!#   IJ_printf ("diag.j", 313, th_M, "\tsetx\t0x%016llrx, %%r1, %%r11\n", Rv_jbiaddr_pattern4);
!!#   IJ_printf ("diag.j", 314, th_M, "\tsetx\t0x%016llrx, %%r1, %%r12\n", Rv_jbiaddr_pattern5);
!!#   IJ_printf ("diag.j", 315, th_M, "\tsetx\t0x%016llrx, %%r1, %%r13\n", Rv_jbiaddr_pattern6);
!!# 
!!#   !IJ_printf (th_M, "\tmov\t0, %%r8\n");
!!# 
!!# }
!!# 
!!# %%
!!# %%section finish
!!# {
!!# 
!!# 
!!# !  IJ_printf(th_M,"\tnop\n\tta T_GOOD_TRAP\n\tnop\n");
!!# !  IJ_printf(th_M,"\ttest_fail:\n\tta T_BAD_TRAP\n\tnop\n");
!!#   IJ_printf ("diag.j", 346, sjm_4, "\n\nBA LABEL_0\n");
!!#   IJ_printf ("diag.j", 347, sjm_5, "\n\nBA LABEL_0\n");
!!# 
!!#   int i,j;
!!#   ! Do this else midas wont put any tsbs for the above.
!!#   for (i = 0; i < 16; i++) {
!!#     IJ_iseg_printf("diag.j", 352,ISEG, i, th_M, ".data\n");
!!#     for (j = 0; j < 256; j++) {
!!#     IJ_iseg_printf("diag.j", 354,ISEG, i, th_M, "\t.xword\t0x%016llrx\n", Rv_rand64);
!!#     }
!!#   }
!!# 
!!#   IJ_th_start ("diag.j", 359,Seq_Start, NULL, 2);
!!# 
!!# }
!!# 
!!# 
!!# 
!!# %%
!!# %%section map
!!# 
!!# 
!!#   SECTION .ISEG DATA_VA = "24'{0}, 20'b0000 0000 iiii 0000 0001, 20'{0}"
!!# 
!!#   attr_data {
!!#         Name = .ISEG,
!!#         RA = "24'{0}, 20'b0000 0000 iiii 0000 0001, 20'{0}",
!!#         part_0_d_ctx_nonzero_ps0_tsb,
!!#         TTE_G = 1, TTE_Context = PCONTEXT, TTE_V = 1, TTE_Size = 0,
!!#         TTE_NFO = 0, TTE_IE = 0, TTE_Soft2 = 0, TTE_Diag = 0, TTE_Soft = 0,
!!#         TTE_L = 0, TTE_CP = 1, TTE_CV = 1, TTE_E = 0, TTE_P = 0, TTE_W = 1
!!#   }
!!#   enumerate {
!!#         DATA_VA
!!#  }
!!# 
!!# 
!!# 
!!# 
!!# %%
!!# %%section grammar
!!# 
!!# 
!!# inst_block: inst_type
!!#             | inst_block inst_type
!!# 	{
!!# 		IJ_generate ("diag.j", 790, th_M, $2);
!!# 	}
!!# ;
!!# 
!!# inst_type: set_addr  %rvar  wt_alu |
!!#            load      %rvar  wt_ld |
!!#            alu       %rvar  wt_alu |
!!#            block_ld  %rvar  wt_bl |
!!#            block_st  %rvar  wt_bl |
!!#            store     %rvar  wt_ld |
!!#            sjm4 | sjm5
!!# 
!!# !inst_type: set_addr load atomics alu store atomics_asi barier
!!# !{
!!# 		!IJ_generate (th_M, $2);
!!# 		!IJ_generate (th_M, $3);
!!# 		!IJ_generate (th_M, $4);
!!# 
!!# 		!IJ_generate (th_M, $5);
!!# 		!IJ_generate (th_M, $6);
!!# 		!IJ_generate (th_M, $7);
!!# !}
!!# 
!!# ;
!!# 
!!# sjm4: set_sjm4_wr_b | set_sjm4_rd_b |  set_sjm4_wr_b_io | set_sjm4_rd_b_io | set_sjm4_wr_io | set_sjm4_rd_io | set_sjm4_wr_m | set_sjm4_wr_m_io | set_sjm4_rd_m_io 
!!# ;
!!# 
!!# set_sjm4_wr_b : mSET_SJM4_WR_B
!!#                 {
!!# 
!!#                   if (sjm4_cnt < 8) { 
!!#                    IJ_printf ("diag.j", 826, sjm_4, "\n");
!!#                      sjm4_cnt++;
!!# 
!!#                      sj4_ad =  IJ_get_rvar_val64("diag.j", 829, Rv_memaddr_pattern_dma);
!!#                      sjm0_addr[sjm_wr0] = sj4_ad; 
!!#                      IJ_printf ("diag.j", 831, sjm_4, "WRITEBLK  0x%016llx +\n",sj4_ad);
!!#                      IJ_update_rvar("diag.j", 832, Rv_memaddr_pattern_dma);
!!# 
!!#                       for (i=0;i<16;i++) { 
!!#                          !IJ_printf (sjm_4, "# debug %d \n",i);
!!#                          sjm0_data[sjm_wr0][i] = IJ_get_rvar_val32("diag.j", 836, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 837, Rv_rand32);
!!#                          if (i%4 == 0) {IJ_printf ("diag.j", 838, sjm_4, "        "); }
!!#                          IJ_printf ("diag.j", 839, sjm_4, "0x%08x ",sjm0_data[sjm_wr0][i]);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 841, sjm_4, "\n"); else 
!!#                             IJ_printf ("diag.j", 842, sjm_4, "+\n");
!!#                           }
!!#                         }
!!#                       if (sjm_wr0 == 7) sjm_wr0 = 0; else sjm_wr0++;
!!#                     }
!!#                 }
!!# 
!!# ;  
!!# 
!!# set_sjm4_rd_b : mSET_SJM4_RD_B
!!#                 {
!!# 
!!#                   if (sjm4_cnt > 0) { 
!!#                    IJ_printf ("diag.j", 855, sjm_4, "\n");
!!#                      sjm4_cnt--;
!!# 
!!#                      sj4_ad = sjm0_addr[sjm_rd0];
!!#                      IJ_printf ("diag.j", 860, sjm_4, "READBLK  0x%016llx +\n",sj4_ad);
!!# 
!!#                       for (i=0;i<16;i++) { 
!!#                          sjm4_dat = sjm0_data[sjm_rd0][i];
!!#                          if (i%4 == 0) IJ_printf ("diag.j", 864, sjm_4, "        ");
!!#                          IJ_printf ("diag.j", 865, sjm_4, "0x%08x ",sjm4_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 867, sjm_4, "\n"); else 
!!#                             IJ_printf ("diag.j", 868, sjm_4, "+\n");
!!#                            }
!!#                         }
!!#                       if (sjm_rd0 == 7) sjm_rd0 = 0; else sjm_rd0++;
!!#                     }
!!#                 }
!!# 
!!# ;  
!!# 
!!# set_sjm4_wr_m : mSET_SJM4_WR_M
!!#                 {
!!# 
!!#                   if (sjm4_cnt > 0) { 
!!#                    IJ_printf ("diag.j", 882, sjm_4, "\n");
!!#                      !sjm4_cnt--;
!!# 
!!#  		     sjm0_w_mask =  IJ_get_rvar_val32("diag.j", 886, Rv_rand_mask);
!!#                      IJ_update_rvar("diag.j", 887, Rv_rand_mask);
!!# 
!!#                       m_tmp = sjm0_w_mask;
!!#                       mask  = 0;
!!#                      for (i=0;i<16;i++) {
!!#                       if (m_tmp & 0x1 ) {
!!#                         mask = mask << 4;
!!#                         mask = mask | 0xf;
!!#                         } else {
!!#                         mask = mask << 4;
!!#                        }
!!# 
!!#                       m_tmp = m_tmp >> 1;
!!#                      }
!!# 
!!#                      sj4_ad = sjm0_addr[sjm_rd0];
!!#                      IJ_printf ("diag.j", 904, sjm_4, "WRITEMSK  0x%016llx 0x%016llx +\n",sj4_ad,mask);
!!# 
!!#                       m_tmp = sjm0_w_mask;
!!#                       for (i=0;i<16;i++) { 
!!#                        if (m_tmp & 0x1 ) {
!!#                          sjm0_data[sjm_rd0][i] = IJ_get_rvar_val32("diag.j", 909, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 910, Rv_rand32);
!!#                          sjm4_dat = sjm0_data[sjm_rd0][i];
!!#                          if (i%4 == 0) IJ_printf ("diag.j", 912, sjm_4, "        ");
!!#                          IJ_printf ("diag.j", 913, sjm_4, "0x%08x ",sjm4_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 915, sjm_4, "\n"); else 
!!#                             IJ_printf ("diag.j", 916, sjm_4, "+\n");
!!#                            }
!!#                         } else {
!!#                          !sjm4_dat = sjm0_data[sjm_rd0][i];
!!#                          sjm4_dat = 0;
!!#                          if (i%4 == 0) IJ_printf ("diag.j", 921, sjm_4, "        ");
!!#                          IJ_printf ("diag.j", 922, sjm_4, "0x%08x ",sjm4_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 924, sjm_4, "\n"); else 
!!#                             IJ_printf ("diag.j", 925, sjm_4, "+\n");
!!#                            }
!!#                         }
!!#                         m_tmp = m_tmp >> 1;
!!#                        }
!!#                       !if (sjm_rd0 == 7) sjm_rd0 = 0; else sjm_rd0++;
!!#                     }
!!#                 }
!!# 
!!# ;  
!!# 
!!# set_sjm4_wr_b_io : mSET_SJM4_WR_B_IO
!!#                 {
!!# 
!!#                   if (sjm4_cnt_io < 8) { 
!!#                    IJ_printf ("diag.j", 942, sjm_4, "\n");
!!#                      sjm4_cnt_io++;
!!# 
!!#                      sj4_ad =  IJ_get_rvar_val64("diag.j", 945, Rv_memaddr_pattern_io);
!!#                      sjm0_addr_io[sjm_wr0_io] = sj4_ad; 
!!#                      IJ_printf ("diag.j", 947, sjm_4, "WRITEBLKIO  0x%016llx +\n",sj4_ad);
!!#                      IJ_update_rvar("diag.j", 948, Rv_memaddr_pattern_io);
!!# 
!!#                       for (i=0;i<16;i++) { 
!!#                          !IJ_printf (sjm_4, "# debug %d \n",i);
!!#                          sjm0_data_io[sjm_wr0_io][i] = IJ_get_rvar_val32("diag.j", 952, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 953, Rv_rand32);
!!#                          if (i%4 == 0) {IJ_printf ("diag.j", 954, sjm_4, "        "); }
!!#                          IJ_printf ("diag.j", 955, sjm_4, "0x%08x ",sjm0_data_io[sjm_wr0_io][i]);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 957, sjm_4, "\n"); else 
!!#                             IJ_printf ("diag.j", 958, sjm_4, "+\n");
!!#                           }
!!#                         }
!!#                       if (sjm_wr0_io == 7) sjm_wr0_io = 0; else sjm_wr0_io++;
!!#                     }
!!#                 }
!!# 
!!# ;  
!!# 
!!# set_sjm4_rd_b_io : mSET_SJM4_RD_B_IO
!!#                 {
!!# 
!!#                   if (sjm4_cnt_io > 0) { 
!!#                    IJ_printf ("diag.j", 971, sjm_4, "\n");
!!#                      sjm4_cnt_io--;
!!# 
!!#                      sj4_ad = sjm0_addr_io[sjm_rd0_io];
!!#                      IJ_printf ("diag.j", 976, sjm_4, "READBLKIO  0x%016llx +\n",sj4_ad);
!!# 
!!#                       for (i=0;i<16;i++) { 
!!#                          sjm4_dat = sjm0_data_io[sjm_rd0_io][i];
!!#                          if (i%4 == 0) IJ_printf ("diag.j", 980, sjm_4, "        ");
!!#                          IJ_printf ("diag.j", 981, sjm_4, "0x%08x ",sjm4_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 983, sjm_4, "\n"); else 
!!#                             IJ_printf ("diag.j", 984, sjm_4, "+\n");
!!#                            }
!!#                         }
!!#                       if (sjm_rd0_io == 7) sjm_rd0_io = 0; else sjm_rd0_io++;
!!#                     }
!!#                 }
!!# 
!!# ;  
!!# 
!!# set_sjm4_wr_io : mSET_SJM4_WR_IO
!!#                 {
!!# 
!!#                   if (sjm4_cnt_io1 < 8) { 
!!#                    IJ_printf ("diag.j", 999, sjm_4, "\n");
!!#                      sjm4_cnt_io1++;
!!# 
!!#                      sj4_ad =  IJ_get_rvar_val64("diag.j", 1002, Rv_memaddr_pattern_io);
!!#                      sjm0_addr_io1[sjm_wr0_io1] = sj4_ad; 
!!#                      IJ_printf ("diag.j", 1004, sjm_4, "WRITEIO  0x%016llx ",sj4_ad);
!!#                      IJ_update_rvar("diag.j", 1005, Rv_memaddr_pattern_io);
!!# 
!!#                      rnd_n = random()%5;
!!#                      switch (rnd_n) {
!!#                        case 0 : b_sz = 4; break;
!!#                        case 1 : b_sz = 8; break;
!!#                        !case 0 : b_sz = 1; break;
!!#                        !case 1 : b_sz = 2; break;
!!#                        case 2 : b_sz = 4; break;
!!#                        case 3 : b_sz = 8; break;
!!#                        default :b_sz = 16; break;
!!#                       } 
!!# 
!!#                      sjm0_data_io1[sjm_wr0_io1][15] = b_sz; ! byte size in entry 15, for read
!!# 
!!#                       IJ_printf ("diag.j", 1020, sjm_4, "%d ",b_sz);
!!#                       for (i=0;i<4;i++) { 
!!#                          !IJ_printf (sjm_4, "# debug %d \n",i);
!!#                          sjm0_data_io1[sjm_wr0_io1][i] = IJ_get_rvar_val32("diag.j", 1023, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 1024, Rv_rand32);
!!#                          IJ_printf ("diag.j", 1025, sjm_4, "0x%08x ",sjm0_data_io1[sjm_wr0_io1][i]);
!!#                          if((i==0) && ((b_sz == 1) | (b_sz == 2) | (b_sz == 4)) ) break; 
!!#                          if((i==1) && (b_sz == 8)) break; 
!!#                       }
!!#                       if ( random()%2 == 0) {
!!#                       IJ_printf ("diag.j", 1030, sjm_4, "\n");
!!#                       } else {
!!#                       IJ_printf ("diag.j", 1032, sjm_4, "\n");
!!#                       }
!!# 
!!#                       if (sjm_wr0_io1 == 7) sjm_wr0_io1 = 0; else sjm_wr0_io1++;
!!#                     }
!!#                 }
!!# 
!!# ;  
!!# 
!!# set_sjm4_rd_io : mSET_SJM4_RD_IO
!!#                 {
!!# 
!!#                   if (sjm4_cnt_io1 > 0) {
!!#                    IJ_printf ("diag.j", 1046, sjm_4, "\n");
!!#                      sjm4_cnt_io1--;
!!# 
!!#                      sj4_ad = sjm0_addr_io1[sjm_rd0_io1];
!!#                      b_sz   = sjm0_data_io1[sjm_rd0_io1][15];
!!#                      IJ_printf ("diag.j", 1052, sjm_4, "READIO  0x%016llx %d ",sj4_ad,b_sz);
!!# 
!!#                       for (i=0;i<4;i++) {
!!#                          sjm4_dat = sjm0_data_io1[sjm_rd0_io1][i];
!!#                          IJ_printf ("diag.j", 1056, sjm_4, "0x%08x ",sjm4_dat);
!!#                          if((i==0) && ((b_sz == 1) | (b_sz == 2) | (b_sz == 4)) ) break;
!!#                          if((i==1) && (b_sz == 8)) break;
!!#                         }
!!#                       if (sjm_rd0_io1 == 7) sjm_rd0_io1 = 0; else sjm_rd0_io1++;
!!#                     }
!!#                 }
!!# 
!!# ;
!!# 
!!# set_sjm4_wr_m_io : mSET_SJM4_WR_M_IO
!!#                 {
!!# 
!!#                   if (sjm4_cnt_m_io < 8) { 
!!#                    IJ_printf ("diag.j", 1071, sjm_4, "\n");
!!# 
!!#                      sj4_ad =  IJ_get_rvar_val64("diag.j", 1073, Rv_memaddr_pattern_io);
!!#                      sjm0_addr_m_io[sjm_wr0_m_io] = sj4_ad; 
!!#                      IJ_update_rvar("diag.j", 1075, Rv_memaddr_pattern_io);
!!# 
!!#                      sjm4_cnt_m_io++;
!!# 
!!#  		     sjm0_w_mask_m_io =  IJ_get_rvar_val32("diag.j", 1081, Rv_rand_mask);
!!#                      IJ_update_rvar("diag.j", 1082, Rv_rand_mask);
!!# 
!!#                       m_tmp = sjm0_w_mask_m_io & 0xf; ! 4 bits * 4 = 16 bit mask
!!#                       mask  = 0;
!!#                      for (i=0;i<4;i++) {
!!#                       if (m_tmp & 0x1 ) {
!!#                         mask = mask << 4;
!!#                         mask = mask | 0xf;
!!#                         } else {
!!#                         mask = mask << 4;
!!#                        }
!!# 
!!#                       m_tmp = m_tmp >> 1;
!!#                      }
!!# 
!!#                      !IJ_printf (sjm_4, "# debug WRITEMSK  0x%016llx 0x%016llx +\n",mask_flip,mask);
!!#                      ! mask_flip = 0;
!!#                      ! for (i=0;i<15;i++) { 
!!#                      !  fl_tmp = mask & 0xf;
!!#                      !  mask_flip = mask_flip | fl_tmp;
!!#                      !  mask_flip = mask_flip << 4;
!!#                      !  mask      = mask      >> 4;
!!#                      ! }
!!#                      !IJ_printf (sjm_4, "# debug WRITEMSK  0x%016llx 0x%016llx +\n",mask_flip,mask);
!!#                      !mask = mask_flip | mask;
!!# 
!!#                      IJ_printf ("diag.j", 1109, sjm_4, "WRITEMSKIO  0x%016llx 0x%04x  ",sj4_ad,mask);
!!#                      sjm0_data_m_io[sjm_wr0_m_io][15] = mask; ! data fifo , 15 stores address
!!# 
!!#                       m_tmp = sjm0_w_mask_m_io & 0xf;
!!#                       for (i=0;i<4;i++) { 
!!#                        if (m_tmp & 0x1 ) {
!!#                          sjm0_data_m_io[sjm_wr0_m_io][i] = IJ_get_rvar_val32("diag.j", 1115, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 1116, Rv_rand32);
!!#                          sjm4_dat = sjm0_data_m_io[sjm_wr0_m_io][i];
!!#                          !if (i%4 == 0) IJ_printf (sjm_4, "        ");
!!#                          IJ_printf ("diag.j", 1119, sjm_4, "0x%08x ",sjm4_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                              IJ_printf ("diag.j", 1121, sjm_4, "\n"); 
!!#                             !if (i==15 ) IJ_printf (sjm_4, "\n"); else 
!!#                             !IJ_printf (sjm_4, "+\n");
!!#                            }
!!#                         } else {
!!#                          !sjm4_dat = sjm0_data[sjm_rd0][i];
!!#                          sjm4_dat = 0;
!!#                          sjm0_data_m_io[sjm_wr0_m_io][i] = sjm4_dat;
!!#                          !if (i%4 == 0) IJ_printf (sjm_4, "        ");
!!#                          IJ_printf ("diag.j", 1130, sjm_4, "0x%08x ",sjm4_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             IJ_printf ("diag.j", 1132, sjm_4, "\n"); 
!!#                             !if (i==15 ) IJ_printf (sjm_4, "\n"); else 
!!#                             !IJ_printf (sjm_4, "+\n");
!!#                            }
!!#                         }
!!#                         m_tmp = m_tmp >> 1;
!!#                        }
!!#                       if (sjm_wr0_m_io == 7) sjm_wr0_m_io = 0; else sjm_wr0_m_io++;
!!#                     }
!!#                 }
!!# 
!!# ;  
!!# 
!!# set_sjm4_rd_m_io : mSET_SJM4_RD_M_IO
!!#                 {
!!# 
!!#                   if (sjm4_cnt_m_io > 0) { 
!!#                    IJ_printf ("diag.j", 1150, sjm_4, "\n");
!!#                      sjm4_cnt_m_io--;
!!# 
!!#                      sj4_ad = sjm0_addr_m_io[sjm_rd0_m_io];
!!#                      mask   = sjm0_data_m_io[sjm_rd0_m_io][15];
!!#                      IJ_printf ("diag.j", 1156, sjm_4, "READMSKIO   0x%016llx 0x%04llx  ",sj4_ad,mask);
!!# 
!!#                       for (i=0;i<4;i++) { 
!!#                          sjm4_dat = sjm0_data_m_io[sjm_rd0_m_io][i];
!!#                          !if (i%4 == 0) IJ_printf (sjm_4, "        ");
!!#                          IJ_printf ("diag.j", 1161, sjm_4, "0x%08x ",sjm4_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             IJ_printf ("diag.j", 1163, sjm_4, "\n");
!!#                             !if (i==15 ) IJ_printf (sjm_4, "\n"); else 
!!#                             !IJ_printf (sjm_4, "+\n");
!!#                            }
!!#                         }
!!#                       if (sjm_rd0_m_io == 7) sjm_rd0_m_io = 0; else sjm_rd0_m_io++;
!!#                     }
!!#                 }
!!# 
!!# ;  
!!# 
!!# sjm5: set_sjm5_wr_b | set_sjm5_rd_b |  set_sjm5_wr_b_io | set_sjm5_rd_b_io | set_sjm5_wr_io | set_sjm5_rd_io | set_sjm5_wr_m | set_sjm5_wr_m_io | set_sjm5_rd_m_io 
!!# ;
!!# 
!!# set_sjm5_wr_b : mSET_SJM5_WR_B
!!#                 {
!!# 
!!#                   if (sjm5_cnt < 8) { 
!!#                    IJ_printf ("diag.j", 1181, sjm_5, "\n");
!!#                      sjm5_cnt++;
!!# 
!!#                      sj5_ad =  IJ_get_rvar_val64("diag.j", 1184, Rv_memaddr_pattern_dma);
!!#                      sjm1_addr[sjm_wr1] = sj5_ad; 
!!#                      IJ_printf ("diag.j", 1186, sjm_5, "WRITEBLK  0x%016llx +\n",sj5_ad);
!!#                      IJ_update_rvar("diag.j", 1187, Rv_memaddr_pattern_dma);
!!# 
!!#                       for (i=0;i<16;i++) { 
!!#                          sjm1_data[sjm_wr1][i] = IJ_get_rvar_val32("diag.j", 1190, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 1191, Rv_rand32);
!!#                          if (i%4 == 0) IJ_printf ("diag.j", 1192, sjm_5, "        ");
!!#                          IJ_printf ("diag.j", 1193, sjm_5, "0x%08x ",sjm1_data[sjm_wr1][i]);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 1195, sjm_5, "\n"); else 
!!#                             IJ_printf ("diag.j", 1196, sjm_5, "+\n");
!!#                            }
!!#                         }
!!#                       if (sjm_wr1 == 7) sjm_wr1 = 0; else sjm_wr1++;
!!#                     }
!!#                 }
!!# 
!!# ;  
!!# 
!!# set_sjm5_rd_b : mSET_SJM5_RD_B
!!#                 {
!!# 
!!#                   if (sjm5_cnt > 0) { 
!!#                    IJ_printf ("diag.j", 1209, sjm_5, "\n");
!!#                      sjm5_cnt--;
!!# 
!!#                      sj5_ad = sjm1_addr[sjm_rd1];
!!#                      IJ_printf ("diag.j", 1214, sjm_5, "READBLK  0x%016llx +\n",sj5_ad);
!!# 
!!#                       for (i=0;i<16;i++) { 
!!#                          sjm5_dat = sjm1_data[sjm_rd1][i];
!!#                          if (i%4 == 0) IJ_printf ("diag.j", 1218, sjm_5, "        ");
!!#                          IJ_printf ("diag.j", 1219, sjm_5, "0x%08x ",sjm5_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 1221, sjm_5, "\n"); else 
!!#                             IJ_printf ("diag.j", 1222, sjm_5, "+\n");
!!#                            }
!!#                         }
!!#                       if (sjm_rd1 == 7) sjm_rd1 = 0; else sjm_rd1++;
!!#                     }
!!#                 }
!!# 
!!# ;  
!!# 
!!# set_sjm5_wr_m : mSET_SJM5_WR_M
!!#                 {
!!# 
!!#                   if (sjm5_cnt > 0) { 
!!#                    IJ_printf ("diag.j", 1236, sjm_5, "\n");
!!#                      !sjm4_cnt--;
!!# 
!!#  		     sjm1_w_mask =  IJ_get_rvar_val32("diag.j", 1240, Rv_rand_mask);
!!#                      IJ_update_rvar("diag.j", 1241, Rv_rand_mask);
!!# 
!!#                       m_tmp = sjm1_w_mask;
!!#                       mask  = 0;
!!#                      for (i=0;i<16;i++) {
!!#                       if (m_tmp & 0x1 ) {
!!#                         mask = mask << 4;
!!#                         mask = mask | 0xf;
!!#                         } else {
!!#                         mask = mask << 4;
!!#                        }
!!# 
!!#                       m_tmp = m_tmp >> 1;
!!#                      }
!!# 
!!#                      sj5_ad = sjm1_addr[sjm_rd1];
!!#                      IJ_printf ("diag.j", 1258, sjm_5, "WRITEMSK  0x%016llx 0x%016llx +\n",sj5_ad,mask);
!!# 
!!#                       m_tmp = sjm1_w_mask;
!!#                       for (i=0;i<16;i++) { 
!!#                        if (m_tmp & 0x1 ) {
!!#                          sjm1_data[sjm_rd1][i] = IJ_get_rvar_val32("diag.j", 1263, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 1264, Rv_rand32);
!!#                          sjm5_dat = sjm1_data[sjm_rd1][i];
!!#                          if (i%4 == 0) IJ_printf ("diag.j", 1266, sjm_5, "        ");
!!#                          IJ_printf ("diag.j", 1267, sjm_5, "0x%08x ",sjm5_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 1269, sjm_5, "\n"); else 
!!#                             IJ_printf ("diag.j", 1270, sjm_5, "+\n");
!!#                            }
!!#                         } else {
!!#                          !sjm5_dat = sjm1_data[sjm_rd1][i];
!!#                          sjm5_dat = 0;
!!#                          if (i%4 == 0) IJ_printf ("diag.j", 1275, sjm_5, "        ");
!!#                          IJ_printf ("diag.j", 1276, sjm_5, "0x%08x ",sjm5_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 1278, sjm_5, "\n"); else 
!!#                             IJ_printf ("diag.j", 1279, sjm_5, "+\n");
!!#                            }
!!#                         }
!!#                         m_tmp = m_tmp >> 1;
!!#                        }
!!#                       !if (sjm_rd1 == 7) sjm_rd1 = 0; else sjm_rd1++;
!!#                     }
!!#                 }
!!# 
!!# ;  
!!# 
!!# set_sjm5_wr_b_io : mSET_SJM5_WR_B_IO
!!#                 {
!!# 
!!#                   if (sjm5_cnt_io < 8) { 
!!#                    IJ_printf ("diag.j", 1296, sjm_5, "\n");
!!#                      sjm5_cnt_io++;
!!# 
!!#                      sj5_ad =  IJ_get_rvar_val64("diag.j", 1299, Rv_memaddr_pattern_io);
!!#                      sjm1_addr_io[sjm_wr1_io] = sj5_ad; 
!!#                      IJ_printf ("diag.j", 1301, sjm_5, "WRITEBLKIO  0x%016llx +\n",sj5_ad);
!!#                      IJ_update_rvar("diag.j", 1302, Rv_memaddr_pattern_io);
!!# 
!!#                       for (i=0;i<16;i++) { 
!!#                          !IJ_printf (sjm_5, "# debug %d \n",i);
!!#                          sjm1_data_io[sjm_wr1_io][i] = IJ_get_rvar_val32("diag.j", 1306, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 1307, Rv_rand32);
!!#                          if (i%4 == 0) {IJ_printf ("diag.j", 1308, sjm_5, "        "); }
!!#                          IJ_printf ("diag.j", 1309, sjm_5, "0x%08x ",sjm1_data_io[sjm_wr1_io][i]);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 1311, sjm_5, "\n"); else 
!!#                             IJ_printf ("diag.j", 1312, sjm_5, "+\n");
!!#                           }
!!#                         }
!!#                       if (sjm_wr1_io == 7) sjm_wr1_io = 0; else sjm_wr1_io++;
!!#                     }
!!#                 }
!!# 
!!# ;  
!!# 
!!# set_sjm5_rd_b_io : mSET_SJM5_RD_B_IO
!!#                 {
!!# 
!!#                   if (sjm5_cnt_io > 0) { 
!!#                    IJ_printf ("diag.j", 1325, sjm_5, "\n");
!!#                      sjm5_cnt_io--;
!!# 
!!#                      sj5_ad = sjm1_addr_io[sjm_rd1_io];
!!#                      IJ_printf ("diag.j", 1330, sjm_5, "READBLKIO  0x%016llx +\n",sj5_ad);
!!# 
!!#                       for (i=0;i<16;i++) { 
!!#                          sjm5_dat = sjm1_data_io[sjm_rd1_io][i];
!!#                          if (i%4 == 0) IJ_printf ("diag.j", 1334, sjm_5, "        ");
!!#                          IJ_printf ("diag.j", 1335, sjm_5, "0x%08x ",sjm5_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 1337, sjm_5, "\n"); else 
!!#                             IJ_printf ("diag.j", 1338, sjm_5, "+\n");
!!#                            }
!!#                         }
!!#                       if (sjm_rd1_io == 7) sjm_rd1_io = 0; else sjm_rd1_io++;
!!#                     }
!!#                 }
!!# 
!!# ;  
!!# 
!!# set_sjm5_wr_io : mSET_SJM5_WR_IO
!!#                 {
!!# 
!!#                   if (sjm5_cnt_io1 < 8) { 
!!#                    IJ_printf ("diag.j", 1354, sjm_5, "\n");
!!#                      sjm5_cnt_io1++;
!!# 
!!#                      sj5_ad =  IJ_get_rvar_val64("diag.j", 1357, Rv_memaddr_pattern_io);
!!#                      sjm1_addr_io1[sjm_wr1_io1] = sj5_ad; 
!!#                      IJ_printf ("diag.j", 1359, sjm_5, "WRITEIO  0x%016llx ",sj5_ad);
!!#                      IJ_update_rvar("diag.j", 1360, Rv_memaddr_pattern_io);
!!# 
!!#                      rnd_n = random()%5;
!!#                      switch (rnd_n) {
!!#                        case 0 : b_sz = 4; break;
!!#                        case 1 : b_sz = 8; break;
!!#                        !case 0 : b_sz = 1; break;
!!#                        !case 1 : b_sz = 2; break;
!!#                        case 2 : b_sz = 4; break;
!!#                        case 3 : b_sz = 8; break;
!!#                        default :b_sz = 16; break;
!!#                       } 
!!# 
!!#                      sjm1_data_io1[sjm_wr1_io1][15] = b_sz; ! byte size in entry 15, for read
!!# 
!!#                       IJ_printf ("diag.j", 1375, sjm_5, "%d ",b_sz);
!!#                       for (i=0;i<4;i++) { 
!!#                          !IJ_printf (sjm_5, "# debug %d \n",i);
!!#                          sjm1_data_io1[sjm_wr1_io1][i] = IJ_get_rvar_val32("diag.j", 1378, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 1379, Rv_rand32);
!!#                          IJ_printf ("diag.j", 1380, sjm_5, "0x%08x ",sjm1_data_io1[sjm_wr1_io1][i]);
!!#                          if((i==0) && ((b_sz == 1) | (b_sz == 2) | (b_sz == 4)) ) break; 
!!#                          if((i==1) && (b_sz == 8)) break; 
!!#                       }
!!#                       if ( random()%2 == 0) {
!!#                       IJ_printf ("diag.j", 1385, sjm_5, "\n");
!!#                       } else {
!!#                       IJ_printf ("diag.j", 1387, sjm_5, "\n");
!!#                       }
!!# 
!!#                       if (sjm_wr1_io1 == 7) sjm_wr1_io1 = 0; else sjm_wr1_io1++;
!!#                     }
!!#                 }
!!# 
!!# ;  
!!# 
!!# set_sjm5_rd_io : mSET_SJM5_RD_IO
!!#                 {
!!# 
!!#                   if (sjm5_cnt_io1 > 0) {
!!#                    IJ_printf ("diag.j", 1401, sjm_5, "\n");
!!#                      sjm5_cnt_io1--;
!!# 
!!#                      sj5_ad = sjm1_addr_io1[sjm_rd1_io1];
!!#                      b_sz   = sjm1_data_io1[sjm_rd1_io1][15];
!!#                      IJ_printf ("diag.j", 1407, sjm_5, "READIO  0x%016llx %d ",sj5_ad,b_sz);
!!# 
!!#                       for (i=0;i<4;i++) {
!!#                          sjm5_dat = sjm1_data_io1[sjm_rd1_io1][i];
!!#                          IJ_printf ("diag.j", 1411, sjm_5, "0x%08x ",sjm5_dat);
!!#                          if((i==0) && ((b_sz == 1) | (b_sz == 2) | (b_sz == 4)) ) break;
!!#                          if((i==1) && (b_sz == 8)) break;
!!#                         }
!!#                       if (sjm_rd1_io1 == 7) sjm_rd1_io1 = 0; else sjm_rd1_io1++;
!!#                     }
!!#                 }
!!# 
!!# ;
!!# 
!!# set_sjm5_wr_m_io : mSET_SJM5_WR_M_IO
!!#                 {
!!# 
!!#                   if (sjm5_cnt_m_io < 8) { 
!!#                    IJ_printf ("diag.j", 1426, sjm_5, "\n");
!!# 
!!#                      sj5_ad =  IJ_get_rvar_val64("diag.j", 1428, Rv_memaddr_pattern_io);
!!#                      sjm1_addr_m_io[sjm_wr1_m_io] = sj5_ad; 
!!#                      IJ_update_rvar("diag.j", 1430, Rv_memaddr_pattern_io);
!!# 
!!#                      sjm5_cnt_m_io++;
!!# 
!!#  		     sjm1_w_mask_m_io =  IJ_get_rvar_val32("diag.j", 1436, Rv_rand_mask);
!!#                      IJ_update_rvar("diag.j", 1437, Rv_rand_mask);
!!# 
!!#                       m_tmp = sjm1_w_mask_m_io & 0xf; ! 4 bits * 4 = 16 bit mask
!!#                       mask  = 0;
!!#                      for (i=0;i<4;i++) {
!!#                       if (m_tmp & 0x1 ) {
!!#                         mask = mask << 4;
!!#                         mask = mask | 0xf;
!!#                         } else {
!!#                         mask = mask << 4;
!!#                        }
!!# 
!!#                       m_tmp = m_tmp >> 1;
!!#                      }
!!# 
!!#                      !IJ_printf (sjm_5, "# debug WRITEMSK  0x%016llx 0x%016llx +\n",mask_flip,mask);
!!#                      ! mask_flip = 0;
!!#                      ! for (i=0;i<15;i++) { 
!!#                      !  fl_tmp = mask & 0xf;
!!#                      !  mask_flip = mask_flip | fl_tmp;
!!#                      !  mask_flip = mask_flip << 4;
!!#                      !  mask      = mask      >> 4;
!!#                      ! }
!!#                      !IJ_printf (sjm_5, "# debug WRITEMSK  0x%016llx 0x%016llx +\n",mask_flip,mask);
!!#                      !mask = mask_flip | mask;
!!# 
!!#                      IJ_printf ("diag.j", 1464, sjm_5, "WRITEMSKIO  0x%016llx 0x%04x  ",sj5_ad,mask);
!!#                      sjm1_data_m_io[sjm_wr1_m_io][15] = mask; ! data fifo , 15 stores address
!!# 
!!#                       m_tmp = sjm1_w_mask_m_io & 0xf;
!!#                       for (i=0;i<4;i++) { 
!!#                        if (m_tmp & 0x1 ) {
!!#                          sjm1_data_m_io[sjm_wr1_m_io][i] = IJ_get_rvar_val32("diag.j", 1470, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 1471, Rv_rand32);
!!#                          sjm5_dat = sjm1_data_m_io[sjm_wr1_m_io][i];
!!#                          !if (i%4 == 0) IJ_printf (sjm_5, "        ");
!!#                          IJ_printf ("diag.j", 1474, sjm_5, "0x%08x ",sjm5_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                              IJ_printf ("diag.j", 1476, sjm_5, "\n"); 
!!#                             !if (i==15 ) IJ_printf (sjm_5, "\n"); else 
!!#                             !IJ_printf (sjm_5, "+\n");
!!#                            }
!!#                         } else {
!!#                          !sjm5_dat = sjm1_data[sjm_rd1][i];
!!#                          sjm5_dat = 0;
!!#                          sjm1_data_m_io[sjm_wr1_m_io][i] = sjm5_dat;
!!#                          !if (i%4 == 0) IJ_printf (sjm_5, "        ");
!!#                          IJ_printf ("diag.j", 1485, sjm_5, "0x%08x ",sjm5_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             IJ_printf ("diag.j", 1487, sjm_5, "\n"); 
!!#                             !if (i==15 ) IJ_printf (sjm_5, "\n"); else 
!!#                             !IJ_printf (sjm_5, "+\n");
!!#                            }
!!#                         }
!!#                         m_tmp = m_tmp >> 1;
!!#                        }
!!#                       if (sjm_wr1_m_io == 7) sjm_wr1_m_io = 0; else sjm_wr1_m_io++;
!!#                     }
!!#                 }
!!# 
!!# ;  
!!# 
!!# set_sjm5_rd_m_io : mSET_SJM5_RD_M_IO
!!#                 {
!!# 
!!#                   if (sjm5_cnt_m_io > 0) { 
!!#                    IJ_printf ("diag.j", 1505, sjm_5, "\n");
!!#                      sjm5_cnt_m_io--;
!!# 
!!#                      sj5_ad = sjm1_addr_m_io[sjm_rd1_m_io];
!!#                      mask   = sjm1_data_m_io[sjm_rd1_m_io][15];
!!#                      IJ_printf ("diag.j", 1511, sjm_5, "READMSKIO   0x%016llx 0x%04llx  ",sj5_ad,mask);
!!# 
!!#                       for (i=0;i<4;i++) { 
!!#                          sjm5_dat = sjm1_data_m_io[sjm_rd1_m_io][i];
!!#                          !if (i%4 == 0) IJ_printf (sjm_5, "        ");
!!#                          IJ_printf ("diag.j", 1516, sjm_5, "0x%08x ",sjm5_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             IJ_printf ("diag.j", 1518, sjm_5, "\n");
!!#                             !if (i==15 ) IJ_printf (sjm_5, "\n"); else 
!!#                             !IJ_printf (sjm_5, "+\n");
!!#                            }
!!#                         }
!!#                       if (sjm_rd1_m_io == 7) sjm_rd1_m_io = 0; else sjm_rd1_m_io++;
!!#                     }
!!#                 }
!!# 
!!# ;  
!!# 
!!# set_addr:  set_memaddr %rvar  wt_alu
!!# ;
!!# 
!!# set_memaddr: mSET_MEMADDR %rvar  wt_alu
!!#                 {
!!# 
!!#                         ! Update the JBI-CONFIG FIFO parameters
!!#                         invalid_config = 1;
!!#                         while (invalid_config) {
!!#                         if (random()%2) {
!!#                         !if (config_cnt > 500) {
!!#                         jbi_config = IJ_get_rvar_val64("diag.j", 1545, Rv_jbi_fifo_wr0_config);
!!#                         IJ_update_rvar("diag.j", 1546, Rv_jbi_fifo_wr0_config);
!!#                         } else {
!!#                         jbi_config = IJ_get_rvar_val64("diag.j", 1548, Rv_jbi_fifo_wr1_config);
!!#                         IJ_update_rvar("diag.j", 1549, Rv_jbi_fifo_wr1_config);
!!#                         }
!!#                         if (((jbi_config>>24) & 0x7) < ((jbi_config>>28) & 0x7)) {
!!#                         invalid_config = 0;
!!#                          }
!!#                         } config_cnt++;
!!# 
!!#                         if (fr_done == 0) {
!!#                          fr_done = 1;
!!#                         IJ_printf ("diag.j", 1558, th_M, "\tsetx\t0x%016llx, %%r1, %%r9\n",
!!#                                 jbi_config);
!!#                         IJ_printf ("diag.j", 1560, th_M, "\tsetx\t0x8000000008, %%r1, %%r10\n");
!!#                         IJ_printf ("diag.j", 1561, th_M, "\tstx\t%%r9, [%%r10]\n");
!!#                         IJ_printf ("diag.j", 1562, th_M, "\n\n\n");
!!#                         IJ_printf ("diag.j", 1563, th_M, "!***********************************************************************\n");
!!#                         IJ_printf ("diag.j", 1564, th_M, "!IOSYNC cycles to start sjm\n");
!!#                         IJ_printf ("diag.j", 1565, th_M, "!***********************************************************************\n");
!!#                         IJ_printf ("diag.j", 1566, th_M, "\tsetx 0xdeadbeefdeadbeef, %%g1, %%g2\n");
!!#                         IJ_printf ("diag.j", 1567, th_M, "\tsetx 0xcf00beef00, %%g1, %%g3\n");
!!#                         IJ_printf ("diag.j", 1568, th_M, "\tstx %%g2, [%%g3]\n");
!!#                         IJ_printf ("diag.j", 1569, th_M, "!***********************************************************************\n");
!!#                         IJ_printf ("diag.j", 1570, th_M, "!IOSYNC cycles to start sjm\n");
!!#                         IJ_printf ("diag.j", 1571, th_M, "!***********************************************************************\n");
!!#                         IJ_printf ("diag.j", 1572, th_M, "\tsetx 0xdeadbeefdeadbeef, %%g1, %%g2\n");
!!#                         IJ_printf ("diag.j", 1573, th_M, "\tsetx 0xef00beef00, %%g1, %%g3\n");
!!#                         IJ_printf ("diag.j", 1574, th_M, "\tstx %%g2, [%%g3]\n");
!!#                         IJ_printf ("diag.j", 1575, th_M, "\n\n\n");
!!#                         }
!!# 
!!# !                        IJ_printf (th_M, "\tsetx\t0x%016llx, %%r1, %%r6\n",
!!# !                                jbi_config);
!!# !                        	IJ_printf (th_M, "\tsetx\t0x8000000008, %%r1, %%r10\n");
!!# !                        IJ_printf (th_M, "\tstx\t%%r6, [%%r10]\n");
!!# 
!!#                       IJ_printf ("diag.j", 1585, th_M, "\tsetx\t0x%016llrx, %%r1, %%r6\n",
!!#                               Rv_jbiaddr_pattern0);
!!#                       IJ_printf ("diag.j", 1587, th_M, "\tsetx\t0x%016llrx, %%r1, %%r7\n",
!!#                               Rv_jbiaddr_pattern1);
!!#                       IJ_printf ("diag.j", 1589, th_M, "\tsetx\t0x%016llrx, %%r1, %%r9\n",
!!#                               Rv_jbiaddr_pattern2);
!!#                       IJ_printf ("diag.j", 1591, th_M, "\tsetx\t0x%016llrx, %%r1, %%r10\n",
!!#                               Rv_jbiaddr_pattern3);
!!#                       IJ_printf ("diag.j", 1593, th_M, "\tsetx\t0x%016llrx, %%r1, %%r11\n",
!!#                               Rv_jbiaddr_pattern4);
!!#                       IJ_printf ("diag.j", 1595, th_M, "\tsetx\t0x%016llrx, %%r1, %%r12\n",
!!#                               Rv_jbiaddr_pattern5);
!!#                       IJ_printf ("diag.j", 1597, th_M, "\tsetx\t0x%016llrx, %%r1, %%r13\n",
!!#                               Rv_jbiaddr_pattern6);
!!#                 }
!!# ;
!!# 
!!# block_ld :  set_block_ld   %rvar  wt_bl
!!# ;
!!# set_block_ld :  mSET_BLOCK_LD %rvar  wt_bl
!!#                 {
!!#                         rnd_cnt = random() %7;
!!#                         switch (rnd_cnt) {
!!#                         case 0 : IJ_printf ("diag.j", 1608, th_M, "\tldda\t[%%r6]ASI_BLK_P, %%f0\n"); break;
!!#                         case 1 : IJ_printf ("diag.j", 1609, th_M, "\tldda\t[%%r7]ASI_BLK_P, %%f0\n"); break;
!!#                         case 2 : IJ_printf ("diag.j", 1610, th_M, "\tldda\t[%%r9]ASI_BLK_P, %%f0\n"); break;
!!#                         case 3 : IJ_printf ("diag.j", 1611, th_M, "\tldda\t[%%r10]ASI_BLK_P, %%f0\n"); break;
!!#                         case 4 : IJ_printf ("diag.j", 1612, th_M, "\tldda\t[%%r11]ASI_BLK_P, %%f0\n"); break;
!!#                         case 5 : IJ_printf ("diag.j", 1613, th_M, "\tldda\t[%%r12]ASI_BLK_P, %%f0\n"); break;
!!#                         case 6 : IJ_printf ("diag.j", 1614, th_M, "\tldda\t[%%r13]ASI_BLK_P, %%f0\n"); break;
!!#                         default : IJ_printf ("diag.j", 1615, th_M, "\tldda\t[%%r8]ASI_BLK_P, %%f0\n"); break;
!!#                         }
!!#                         IJ_printf ("diag.j", 1617, th_M, "\tmembar\t 0x40\n");
!!#                  }
!!# 
!!# ;
!!# 
!!# block_st :  set_block_st   %rvar  wt_bl
!!# ;
!!# set_block_st :  mSET_BLOCK_ST   %rvar  wt_bl
!!#                 {
!!#                         rnd_cnt = random() %7;
!!#                         switch (rnd_cnt) {
!!#                         case 0 : IJ_printf ("diag.j", 1628, th_M, "\tstda\t %%f0, [%%r6]ASI_BLK_P\n"); break;
!!#                         case 1 : IJ_printf ("diag.j", 1629, th_M, "\tstda\t %%f0, [%%r7]ASI_BLK_P\n"); break;
!!#                         case 2 : IJ_printf ("diag.j", 1630, th_M, "\tstda\t %%f0, [%%r9]ASI_BLK_P\n"); break;
!!#                         case 3 : IJ_printf ("diag.j", 1631, th_M, "\tstda\t %%f0, [%%r10]ASI_BLK_P\n"); break;
!!#                         case 4 : IJ_printf ("diag.j", 1632, th_M, "\tstda\t %%f0, [%%r11]ASI_BLK_P\n"); break;
!!#                         case 5 : IJ_printf ("diag.j", 1633, th_M, "\tstda\t %%f0, [%%r12]ASI_BLK_P\n"); break;
!!#                         case 6 : IJ_printf ("diag.j", 1634, th_M, "\tstda\t %%f0, [%%r13]ASI_BLK_P\n"); break;
!!#                         default  : IJ_printf ("diag.j", 1635, th_M, "\tstda\t %%f0, [%%r7]ASI_BLK_P\n"); break;
!!#                         }
!!#                         IJ_printf ("diag.j", 1637, th_M, "\tmembar\t 0x40\n");
!!#                  }
!!# 
!!# ;
!!# 
!!# load: gLOAD  %rvar  wt_ld 
!!# ;
!!# 
!!# store: gSTORE  %rvar  wt_st
!!# ;
!!# 
!!# alu: gALU  %rvar  wt_alu
!!# ; 
!!# 
!!# ! add only non-asi and then extend it ( add CASA later ) 
!!# atomics : tSWAP_R | tSWAP_I | tLDSTUB_R | tLDSTUB_I
!!# ;
!!# 
!!# atomics_asi : tSWAPA_R | tSWAPA_I | tLDSTUBA_R | tLDSTUBA_I | tCASA_I | tCASA_R | tCASXA_I | tCASXA_R
!!# ;
!!# 
!!# barier      : tMEMBAR | tSTBAR 
!!# ;
!!# 
!!# 
!!# 
!!# 
!!# %%
!!# %%section cbfunc
!!# 
!!# %%
!!# %%section stat
!!# 
!!# %%
#endif
