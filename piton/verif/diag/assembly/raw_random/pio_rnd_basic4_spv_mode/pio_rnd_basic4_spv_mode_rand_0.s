// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: pio_rnd_basic4_spv_mode_rand_0.s
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
   random seed:	676893073
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

	setx 0xbb97768c0147a096, %g1, %g0
	setx 0x7e84ee0fe85fa700, %g1, %g1
	setx 0xb6a05716bd044779, %g1, %g2
	setx 0x0037f8c56f37421b, %g1, %g3
	setx 0xe0129b6870ff6a0b, %g1, %g4
	setx 0x2e29463a9e9777ab, %g1, %g5
	setx 0xec9490d3dab3906b, %g1, %g6
	setx 0x994ed911b8b5d53a, %g1, %g7
	setx 0x147ce2b65906d379, %g1, %r16
	setx 0x28283b2ee2f1d45d, %g1, %r17
	setx 0xa762eaee67345100, %g1, %r18
	setx 0x7b2ed7853b5f83ca, %g1, %r19
	setx 0x597a32b84ecfe7a2, %g1, %r20
	setx 0xcb21d4cef66023c8, %g1, %r21
	setx 0xdd8fa9b9d6fc8c46, %g1, %r22
	setx 0x04634c444fa604af, %g1, %r23
	setx 0xe776c063a20bd53a, %g1, %r24
	setx 0xa4066030e6a5df8c, %g1, %r25
	setx 0x478e788d5e6a106a, %g1, %r26
	setx 0xa253b3b853f5bf01, %g1, %r27
	setx 0xa7c06b1b725f5f46, %g1, %r28
	setx 0x8b8a6dedd63f3a12, %g1, %r29
	setx 0xfb058a8ae2c510dd, %g1, %r30
	setx 0x8c0c5bc64e8fc516, %g1, %r31
	save
	setx 0x9d5e8fe7b4c1bb56, %g1, %r16
	setx 0xa26ec50e3cfa3ff1, %g1, %r17
	setx 0xf787736631aeed5c, %g1, %r18
	setx 0x1ec24a4b9c17e655, %g1, %r19
	setx 0xf0a17e43d98b24e1, %g1, %r20
	setx 0x3952b143b90c3e6c, %g1, %r21
	setx 0x5fc9e0731f8a0897, %g1, %r22
	setx 0x6321106261b3209f, %g1, %r23
	setx 0x0f34aae671ede3ee, %g1, %r24
	setx 0x74363101bd261389, %g1, %r25
	setx 0x6d2a4b55d6f8e513, %g1, %r26
	setx 0x434936a6a35a1c44, %g1, %r27
	setx 0x406b68a1afe0e702, %g1, %r28
	setx 0x4fe15b03e2fbe771, %g1, %r29
	setx 0x5a1e58829a2a3932, %g1, %r30
	setx 0x1bfe586e2dce33fc, %g1, %r31
	save
	setx 0x2df38f0e1aac3e5f, %g1, %r16
	setx 0x9d030172a8bf0062, %g1, %r17
	setx 0xec9549701882f70a, %g1, %r18
	setx 0xa3cad4a16826bb81, %g1, %r19
	setx 0x568546f128bffe13, %g1, %r20
	setx 0xe6d354c1b8d82c45, %g1, %r21
	setx 0x356fb67018306ce9, %g1, %r22
	setx 0x9015d006cb840e33, %g1, %r23
	setx 0x4572c95da97cd935, %g1, %r24
	setx 0x8cc63cc540c9dc71, %g1, %r25
	setx 0x75ae8dcae343ca2c, %g1, %r26
	setx 0x3ae436865102091b, %g1, %r27
	setx 0xae4df42cdfb45ae4, %g1, %r28
	setx 0xa25ea14ab0d10cc1, %g1, %r29
	setx 0x921be88bc89446f8, %g1, %r30
	setx 0x528689e4280bf6eb, %g1, %r31
	restore
	mov	0, %r8
	setx	0x00000000d01ef100, %r1, %r6
	setx	0x00000000d02ef040, %r1, %r7
	setx	0x00000000d03ef100, %r1, %r9
	setx	0x00000000d04ef040, %r1, %r10
	setx	0x00000000d05ef080, %r1, %r11
	setx	0x00000000d06ef140, %r1, %r12
	setx	0x00000000d07ef000, %r1, %r13
	.word 0xe049a018  ! 1: LDSB_I	ldsb	[%r6 + 0x0018], %r16
	.word 0xe009a018  ! 2: LDUB_I	ldub	[%r6 + 0x0018], %r16
	.word 0xec730008  ! 3: STX_R	stx	%r22, [%r12 + %r8]
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r9]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r9]ASI_BLK_P
	membar	 0x40
	.word 0xec326038  ! 10: STH_I	sth	%r22, [%r9 + 0x0038]
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec018008  ! 14: LDUW_R	lduw	[%r6 + %r8], %r22
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xe041e010  ! 16: LDSW_I	ldsw	[%r7 + 0x0010], %r16
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xe059a020  ! 18: LDX_I	ldx	[%r6 + 0x0020], %r16
	.word 0xe0728008  ! 19: STX_R	stx	%r16, [%r10 + %r8]
	.word 0xe0524008  ! 20: LDSH_R	ldsh	[%r9 + %r8], %r16
	.word 0xec3b4008  ! 21: STD_R	std	%r22, [%r13 + %r8]
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe43b0008  ! 25: STD_R	std	%r18, [%r12 + %r8]
	.word 0xe0232038  ! 26: STW_I	stw	%r16, [%r12 + 0x0038]
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xec398008  ! 28: STD_R	std	%r22, [%r6 + %r8]
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe0732000  ! 33: STX_I	stx	%r16, [%r12 + 0x0000]
	.word 0xe4224008  ! 34: STW_R	stw	%r18, [%r9 + %r8]
	.word 0xec398008  ! 35: STD_R	std	%r22, [%r6 + %r8]
	.word 0xe439c008  ! 36: STD_R	std	%r18, [%r7 + %r8]
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	.word 0xe81b0008  ! 39: LDD_R	ldd	[%r12 + %r8], %r20
	.word 0xe04aa038  ! 40: LDSB_I	ldsb	[%r10 + 0x0038], %r16
	.word 0xe44b4008  ! 41: LDSB_R	ldsb	[%r13 + %r8], %r18
	.word 0xec2b4008  ! 42: STB_R	stb	%r22, [%r13 + %r8]
	setx	0x000000007012d002, %r1, %r9
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



	setx	0x00000000d01ef080, %r1, %r6
	setx	0x00000000d02ef080, %r1, %r7
	setx	0x00000000d03ef180, %r1, %r9
	setx	0x00000000d04ef180, %r1, %r10
	setx	0x00000000d05ef100, %r1, %r11
	setx	0x00000000d06ef100, %r1, %r12
	setx	0x00000000d07ef180, %r1, %r13
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xe071e030  ! 45: STX_I	stx	%r16, [%r7 + 0x0030]
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xe8298008  ! 47: STB_R	stb	%r20, [%r6 + %r8]
	.word 0xe451a030  ! 48: LDSH_I	ldsh	[%r6 + 0x0030], %r18
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe442e010  ! 53: LDSW_I	ldsw	[%r11 + 0x0010], %r18
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe0128008  ! 56: LDUH_R	lduh	[%r10 + %r8], %r16
	.word 0xe439c008  ! 57: STD_R	std	%r18, [%r7 + %r8]
	.word 0xe8498008  ! 58: LDSB_R	ldsb	[%r6 + %r8], %r20
	.word 0xe009a018  ! 59: LDUB_I	ldub	[%r6 + 0x0018], %r16
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe0434008  ! 61: LDSW_R	ldsw	[%r13 + %r8], %r16
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xa8198008  ! 63: XOR_R	xor 	%r6, %r8, %r20
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xec0b2020  ! 65: LDUB_I	ldub	[%r12 + 0x0020], %r22
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xec5b2038  ! 68: LDX_I	ldx	[%r12 + 0x0038], %r22
	setx	0x00000000d01ef180, %r1, %r6
	setx	0x00000000d02ef180, %r1, %r7
	setx	0x00000000d03ef040, %r1, %r9
	setx	0x00000000d04ef0c0, %r1, %r10
	setx	0x00000000d05ef100, %r1, %r11
	setx	0x00000000d06ef080, %r1, %r12
	setx	0x00000000d07ef040, %r1, %r13
	.word 0xe829c008  ! 70: STB_R	stb	%r20, [%r7 + %r8]
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe8728008  ! 73: STX_R	stx	%r20, [%r10 + %r8]
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xe039e010  ! 78: STD_I	std	%r16, [%r7 + 0x0010]
	.word 0xec49a030  ! 79: LDSB_I	ldsb	[%r6 + 0x0030], %r22
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xa0934008  ! 82: ORcc_R	orcc 	%r13, %r8, %r16
	.word 0xe432a018  ! 83: STH_I	sth	%r18, [%r10 + 0x0018]
	.word 0xe0730008  ! 84: STX_R	stx	%r16, [%r12 + %r8]
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xa0832008  ! 88: ADDcc_I	addcc 	%r12, 0x0008, %r16
	.word 0xe00b0008  ! 89: LDUB_R	ldub	[%r12 + %r8], %r16
	.word 0xe001a000  ! 90: LDUW_I	lduw	[%r6 + 0x0000], %r16
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xe0728008  ! 93: STX_R	stx	%r16, [%r10 + %r8]
	stda	 %f0, [%r9]ASI_BLK_P
	membar	 0x40
	.word 0xe0230008  ! 95: STW_R	stw	%r16, [%r12 + %r8]
	.word 0xe449e030  ! 96: LDSB_I	ldsb	[%r7 + 0x0030], %r18
	.word 0xec41a020  ! 97: LDSW_I	ldsw	[%r6 + 0x0020], %r22
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r9]ASI_BLK_P
	membar	 0x40
	.word 0xec0b6038  ! 100: LDUB_I	ldub	[%r13 + 0x0038], %r22
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	.word 0xe42aa020  ! 102: STB_I	stb	%r18, [%r10 + 0x0020]
	.word 0xe8518008  ! 103: LDSH_R	ldsh	[%r6 + %r8], %r20
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r9]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe029e020  ! 110: STB_I	stb	%r16, [%r7 + 0x0020]
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r9]ASI_BLK_P
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe0132008  ! 115: LDUH_I	lduh	[%r12 + 0x0008], %r16
	.word 0xe01ae028  ! 117: LDD_I	ldd	[%r11 + 0x0028], %r16
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe03a6000  ! 119: STD_I	std	%r16, [%r9 + 0x0000]
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	.word 0xec332020  ! 121: STH_I	sth	%r22, [%r12 + 0x0020]
	.word 0xec42c008  ! 122: LDSW_R	ldsw	[%r11 + %r8], %r22
	.word 0xec19c008  ! 123: LDD_R	ldd	[%r7 + %r8], %r22
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe0236020  ! 127: STW_I	stw	%r16, [%r13 + 0x0020]
	.word 0xe471e038  ! 128: STX_I	stx	%r18, [%r7 + 0x0038]
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r9]ASI_BLK_P
	membar	 0x40
	.word 0xe0734008  ! 131: STX_R	stx	%r16, [%r13 + %r8]
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xec732000  ! 133: STX_I	stx	%r22, [%r12 + 0x0000]
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	.word 0xec198008  ! 137: LDD_R	ldd	[%r6 + %r8], %r22
	.word 0xe0336018  ! 138: STH_I	sth	%r16, [%r13 + 0x0018]
	setx	0x00000000d01ef180, %r1, %r6
	setx	0x00000000d02ef080, %r1, %r7
	setx	0x00000000d03ef140, %r1, %r9
	setx	0x00000000d04ef000, %r1, %r10
	setx	0x00000000d05ef080, %r1, %r11
	setx	0x00000000d06ef180, %r1, %r12
	setx	0x00000000d07ef040, %r1, %r13
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe002e008  ! 143: LDUW_I	lduw	[%r11 + 0x0008], %r16
	.word 0xe03a4008  ! 144: STD_R	std	%r16, [%r9 + %r8]
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r9]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xa4c26010  ! 148: ADDCcc_I	addccc 	%r9, 0x0010, %r18
	.word 0xe01ac008  ! 149: LDD_R	ldd	[%r11 + %r8], %r16
	.word 0xa0030008  ! 150: ADD_R	add 	%r12, %r8, %r16
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe041a010  ! 152: LDSW_I	ldsw	[%r6 + 0x0010], %r16
	.word 0xe81a4008  ! 153: LDD_R	ldd	[%r9 + %r8], %r20
	.word 0xe839a018  ! 154: STD_I	std	%r20, [%r6 + 0x0018]
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	.word 0xe4198008  ! 157: LDD_R	ldd	[%r6 + %r8], %r18
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r9]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	setx	0x00000000d01ef0c0, %r1, %r6
	setx	0x00000000d02ef000, %r1, %r7
	setx	0x00000000d03ef040, %r1, %r9
	setx	0x00000000d04ef000, %r1, %r10
	setx	0x00000000d05ef180, %r1, %r11
	setx	0x00000000d06ef100, %r1, %r12
	setx	0x00000000d07ef0c0, %r1, %r13
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xa0b24008  ! 168: SUBCcc_R	orncc 	%r9, %r8, %r16
	setx	0x00000000d01ef000, %r1, %r6
	setx	0x00000000d02ef180, %r1, %r7
	setx	0x00000000d03ef040, %r1, %r9
	setx	0x00000000d04ef000, %r1, %r10
	setx	0x00000000d05ef000, %r1, %r11
	setx	0x00000000d06ef140, %r1, %r12
	setx	0x00000000d07ef040, %r1, %r13
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe82a8008  ! 174: STB_R	stb	%r20, [%r10 + %r8]
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xe059a010  ! 176: LDX_I	ldx	[%r6 + 0x0010], %r16
	.word 0xe04b0008  ! 178: LDSB_R	ldsb	[%r12 + %r8], %r16
	.word 0xe81b6010  ! 179: LDD_I	ldd	[%r13 + 0x0010], %r20
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xa08a8008  ! 181: ANDcc_R	andcc 	%r10, %r8, %r16
	.word 0xe45ac008  ! 182: LDX_R	ldx	[%r11 + %r8], %r18
	.word 0xe031e030  ! 183: STH_I	sth	%r16, [%r7 + 0x0030]
	.word 0xe812c008  ! 184: LDUH_R	lduh	[%r11 + %r8], %r20
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe459a028  ! 186: LDX_I	ldx	[%r6 + 0x0028], %r18
	.word 0xec32e038  ! 187: STH_I	sth	%r22, [%r11 + 0x0038]
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	.word 0xe009a008  ! 190: LDUB_I	ldub	[%r6 + 0x0008], %r16
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe8418008  ! 192: LDSW_R	ldsw	[%r6 + %r8], %r20
	.word 0xe43a8008  ! 193: STD_R	std	%r18, [%r10 + %r8]
	.word 0xe039a000  ! 194: STD_I	std	%r16, [%r6 + 0x0000]
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec49e020  ! 196: LDSB_I	ldsb	[%r7 + 0x0020], %r22
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe84b0008  ! 198: LDSB_R	ldsb	[%r12 + %r8], %r20
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xe01b6038  ! 200: LDD_I	ldd	[%r13 + 0x0038], %r16
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	ldda	[%r9]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec130008  ! 205: LDUH_R	lduh	[%r12 + %r8], %r22
	.word 0xec732028  ! 206: STX_I	stx	%r22, [%r12 + 0x0028]
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe831a010  ! 210: STH_I	sth	%r20, [%r6 + 0x0010]
	.word 0xe822c008  ! 211: STW_R	stw	%r20, [%r11 + %r8]
	.word 0xe0132038  ! 212: LDUH_I	lduh	[%r12 + 0x0038], %r16
	.word 0xe0534008  ! 213: LDSH_R	ldsh	[%r13 + %r8], %r16
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe0718008  ! 216: STX_R	stx	%r16, [%r6 + %r8]
	.word 0xe0518008  ! 217: LDSH_R	ldsh	[%r6 + %r8], %r16
	.word 0xe0134008  ! 218: LDUH_R	lduh	[%r13 + %r8], %r16
	.word 0xe85b6030  ! 219: LDX_I	ldx	[%r13 + 0x0030], %r20
	.word 0xe0028008  ! 220: LDUW_R	lduw	[%r10 + %r8], %r16
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe03aa008  ! 223: STD_I	std	%r16, [%r10 + 0x0008]
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xe039e038  ! 225: STD_I	std	%r16, [%r7 + 0x0038]
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	.word 0xe8734008  ! 228: STX_R	stx	%r20, [%r13 + %r8]
	.word 0xe0232028  ! 229: STW_I	stw	%r16, [%r12 + 0x0028]
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe03a8008  ! 235: STD_R	std	%r16, [%r10 + %r8]
	.word 0xec4b2010  ! 236: LDSB_I	ldsb	[%r12 + 0x0010], %r22
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe022a030  ! 242: STW_I	stw	%r16, [%r10 + 0x0030]
	.word 0xe4724008  ! 243: STX_R	stx	%r18, [%r9 + %r8]
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe022a038  ! 246: STW_I	stw	%r16, [%r10 + 0x0038]
	.word 0xe049c008  ! 247: LDSB_R	ldsb	[%r7 + %r8], %r16
	.word 0xe85b0008  ! 248: LDX_R	ldx	[%r12 + %r8], %r20
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe00ae028  ! 250: LDUB_I	ldub	[%r11 + 0x0028], %r16
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe0318008  ! 252: STH_R	sth	%r16, [%r6 + %r8]
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe0526008  ! 254: LDSH_I	ldsh	[%r9 + 0x0008], %r16
	.word 0xe0298008  ! 255: STB_R	stb	%r16, [%r6 + %r8]
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	.word 0xe031a020  ! 258: STH_I	sth	%r16, [%r6 + 0x0020]
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe071a008  ! 260: STX_I	stx	%r16, [%r6 + 0x0008]
	.word 0xe059a020  ! 261: LDX_I	ldx	[%r6 + 0x0020], %r16
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec2a6000  ! 263: STB_I	stb	%r22, [%r9 + 0x0000]
	.word 0xe051e020  ! 264: LDSH_I	ldsh	[%r7 + 0x0020], %r16
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	ldda	[%r9]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe059e000  ! 268: LDX_I	ldx	[%r7 + 0x0000], %r16
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	setx	0x00000000d01ef000, %r1, %r6
	setx	0x00000000d02ef040, %r1, %r7
	setx	0x00000000d03ef1c0, %r1, %r9
	setx	0x00000000d04ef180, %r1, %r10
	setx	0x00000000d05ef0c0, %r1, %r11
	setx	0x00000000d06ef0c0, %r1, %r12
	setx	0x00000000d07ef1c0, %r1, %r13
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	.word 0xe051a018  ! 272: LDSH_I	ldsh	[%r6 + 0x0018], %r16
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec034008  ! 275: LDUW_R	lduw	[%r13 + %r8], %r22
	.word 0xec19c008  ! 276: LDD_R	ldd	[%r7 + %r8], %r22
	stda	 %f0, [%r9]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe02b4008  ! 279: STB_R	stb	%r16, [%r13 + %r8]
	.word 0xe4136028  ! 280: LDUH_I	lduh	[%r13 + 0x0028], %r18
	.word 0xe0236030  ! 281: STW_I	stw	%r16, [%r13 + 0x0030]
	.word 0xe8230008  ! 282: STW_R	stw	%r20, [%r12 + %r8]
	.word 0xe459e008  ! 283: LDX_I	ldx	[%r7 + 0x0008], %r18
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe0426020  ! 285: LDSW_I	ldsw	[%r9 + 0x0020], %r16
	ldda	[%r9]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe8318008  ! 287: STH_R	sth	%r20, [%r6 + %r8]
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe01a6018  ! 289: LDD_I	ldd	[%r9 + 0x0018], %r16
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r9]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xec498008  ! 294: LDSB_R	ldsb	[%r6 + %r8], %r22
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	ldda	[%r9]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe83b2020  ! 297: STD_I	std	%r20, [%r12 + 0x0020]
	.word 0xe44aa008  ! 298: LDSB_I	ldsb	[%r10 + 0x0008], %r18
	stda	 %f0, [%r9]ASI_BLK_P
	membar	 0x40


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
	.xword	0xcdbbfee5a9666273
	.xword	0xce8ba63bf6c943b1
	.xword	0xa23c7c09830b77a9
	.xword	0xd1340383f4a7bb28
	.xword	0xd57e2935b59248f1
	.xword	0xd299666e71c2cbc8
	.xword	0x9ad27e3d196569c2
	.xword	0x89a7cb97df65bd24
	.xword	0x4dcd5d155a919cd0
	.xword	0xc337089783d35bb2
	.xword	0xba683c0b873eea71
	.xword	0x521b2deb26ec14b9
	.xword	0x5c790d95c86d1240
	.xword	0xa328a3ce9ff18be9
	.xword	0xc3689f276966cc47
	.xword	0x5016d62e1594096f
	.xword	0x1e96ee8f499f5d6b
	.xword	0xe6ec9f510b52bdf7
	.xword	0xf1bbe07558a3d330
	.xword	0xcba85b3c8820956f
	.xword	0x3ce0f33f9905a7f3
	.xword	0xd893fe05dc594504
	.xword	0xc5b0c41d149be6e2
	.xword	0x8904e6f5df2a5266
	.xword	0x0eb9723121c9960f
	.xword	0xd624ccec965209b1
	.xword	0xcc82176d9c6967df
	.xword	0x5fc7277a0af99ae1
	.xword	0x3201d4b1945abdfd
	.xword	0x5688765fcc21492a
	.xword	0x65f5fecf17a2bf79
	.xword	0x02bc81204a0d886a
	.xword	0x43dc57b7ffc4d3ae
	.xword	0xe43652052b1c819d
	.xword	0x466dbc30f6be9aef
	.xword	0x5f7fc7a43a81cf80
	.xword	0x66e28f95af9696fb
	.xword	0xd62bffbdf7f70991
	.xword	0x66ce9bfe802f9c8d
	.xword	0x3816e0a901acdf19
	.xword	0x237488c9595c149f
	.xword	0x605c4139c907fb14
	.xword	0xb997181dfecb6412
	.xword	0x2f5f9455325c484d
	.xword	0xc16180dd8ba3d422
	.xword	0xbc5976fbafc7c03f
	.xword	0x0679062363f28e70
	.xword	0xc24ad947640b02b2
	.xword	0xe0d2fdc6975eb325
	.xword	0xcd6893d3535285b6
	.xword	0x043ed473afeb91a9
	.xword	0x2e79232f9d9fd013
	.xword	0x59081942ce59b90b
	.xword	0xfeb74a409439b4b2
	.xword	0xea71736ee65a7cd0
	.xword	0x6c6dba0f1be53433
	.xword	0x455ae7ab6af8d948
	.xword	0x3439c2c786d3ddd9
	.xword	0x3ac0b0df8894c2ea
	.xword	0xb758fdec4415ea1c
	.xword	0x31e447a86f59dadf
	.xword	0x9a207abf9e9b6779
	.xword	0xfff2b62d05f68934
	.xword	0xff51577ce5fd302a
	.xword	0x1ba97fc9b0843b49
	.xword	0x96224331cf18c2b0
	.xword	0x0b0ccd0523e7df83
	.xword	0x6e8a6bdcfc2bf275
	.xword	0xa49f68b07bc1e315
	.xword	0x72ac94f40403a464
	.xword	0xafbf709b41ad6012
	.xword	0xdcac21673729ee8e
	.xword	0x5c81d1127c019557
	.xword	0xb904517d4a5c3826
	.xword	0x71436d39115bab08
	.xword	0xe3dcc7acf2a6fbef
	.xword	0xaffe4eef4802f58e
	.xword	0xfb207f623cb2a4bc
	.xword	0xa8fc0b5a5fdc7528
	.xword	0x24796d529f6f9f0c
	.xword	0x6be50f1de0103f8c
	.xword	0x14e4eff9e2cd2b84
	.xword	0xadd1cc97793e899a
	.xword	0x19a2b23d551f7e9f
	.xword	0x878b8f6586f31980
	.xword	0xcd8ff358ba762082
	.xword	0x29bcda628faa034c
	.xword	0x4e8b991c90d4c902
	.xword	0x683c650cb5a914a7
	.xword	0xe29e2a87a0c21518
	.xword	0xa95ab64b54748f9f
	.xword	0xd077803c541efc66
	.xword	0x60f0270e7b8cb69e
	.xword	0x3c5c9f88a65ebc10
	.xword	0x9a4b39e5787c006e
	.xword	0x87856233862dd29d
	.xword	0xfaa803285cdd1f70
	.xword	0x5a11a3dd8f94f1de
	.xword	0x6aa61d3d44190e93
	.xword	0x2d0fd392f668b0f3
	.xword	0x5555531a2be386b6
	.xword	0x6a80ba9d3238a6fb
	.xword	0xaedebfbedf76956b
	.xword	0xcb9666bfcff86c63
	.xword	0x6ff8c97161c849d7
	.xword	0xe4077654584c30df
	.xword	0x0f6a1695b3af0ea6
	.xword	0x7da96b34bd38a45f
	.xword	0x0591dbf3622fc22b
	.xword	0x1b449b795a68e282
	.xword	0xbf8faddac62cb117
	.xword	0xca388bdf811fee23
	.xword	0xe4d63729a66c0394
	.xword	0x877c9140e8dbe8db
	.xword	0xe62ac4a9d2084667
	.xword	0xc1684632024b4782
	.xword	0xd01a787944c6955e
	.xword	0x167db2b1a0289054
	.xword	0xb6885e669849f783
	.xword	0x5257b23a61a7aa8c
	.xword	0xba64cc9c6339db2a
	.xword	0x7782f384f37390f4
	.xword	0x5fae63f961e14821
	.xword	0x0ab1abefc52dff0a
	.xword	0x17df82cd1f4c8163
	.xword	0x7cbda19880e0c7ae
	.xword	0x3725ba1207c3eb48
	.xword	0xd9e03a94292ff175
	.xword	0xe14cff448f748ed7
	.xword	0x2e85a551b7e7065d
	.xword	0x2356bf84b07f4bdd
	.xword	0xc1754358dc6c096a
	.xword	0xde9e44b691bdbaa8
	.xword	0x35ac9787f74073ba
	.xword	0x3f87a5136523390d
	.xword	0xaedf6d8835bb2deb
	.xword	0xad894cb7a8af46d9
	.xword	0xc4c320c7e8c9ab7c
	.xword	0x990ebd893114a913
	.xword	0x50b2a3805324967c
	.xword	0x3e55b3b5fafb4193
	.xword	0xc42fbb11c5ada76a
	.xword	0xead962b337956f82
	.xword	0x5fa7cc258ace4a2f
	.xword	0xf7772d975b38e392
	.xword	0xc196e8a04658f501
	.xword	0xcc37e1fe7389e67a
	.xword	0x71ee8e437a9a9ac6
	.xword	0xa047a6da81c5e141
	.xword	0x370193a00e109a6b
	.xword	0xde0cab4047ab02c6
	.xword	0x16f7fe1bf62cd808
	.xword	0x9a05d192b9707916
	.xword	0xa5bf0c6827722cdb
	.xword	0xb09e8e80d84e978c
	.xword	0xb4df92dabcbd103a
	.xword	0x415eca3e4017fd1e
	.xword	0x7032bbf47fb859a5
	.xword	0x4ee2dd18cfe81054
	.xword	0x98279733b6e6f8a2
	.xword	0x935eabaa80d89ed5
	.xword	0x01e244623beb3d15
	.xword	0xabc313799066603d
	.xword	0x62c5f6a5f8e35483
	.xword	0x41501bd562095a25
	.xword	0x0aa9b4120c9b96fa
	.xword	0xc59c59778a30e688
	.xword	0x9b16d9acd0541f06
	.xword	0x1b2e17fd6166a347
	.xword	0xc9140e7c51fa21ba
	.xword	0xf3d3bbdd8c05543b
	.xword	0x26783b91c6812732
	.xword	0x449f4346dc765c97
	.xword	0xf8429e77d7791227
	.xword	0x8fe6045550795585
	.xword	0x0b7143cde8bcc508
	.xword	0xdb7aeac6ef3d3014
	.xword	0xf11726d1d6d0c4fb
	.xword	0xfb8c76fd9787999f
	.xword	0xd71b6df786b47a9d
	.xword	0x6a010b5a0f49daa9
	.xword	0x6dbe92bdc06377d3
	.xword	0xc77bacccb6486937
	.xword	0xbf2f7f7e39b2f984
	.xword	0x8d94a8354aee01ba
	.xword	0xda931e378fee7a34
	.xword	0xebfdd176f3d98142
	.xword	0x8c76d50386d551e8
	.xword	0xd73a647de180e11d
	.xword	0xb50a2f851c5d561e
	.xword	0x44178da025f99dfa
	.xword	0x46b219d4cca1da13
	.xword	0x80e732c3a2bcc039
	.xword	0x5232cd37c9b91d28
	.xword	0x1184a5466c519924
	.xword	0xaab3b33cafcd97c1
	.xword	0xf03dcc264e74a9ef
	.xword	0xd9fecb51603a3a29
	.xword	0xe2ca4b2c15ecb9ea
	.xword	0x3376e5ff48b4b7b0
	.xword	0x052a80123eace41b
	.xword	0x3f0c3ee97ebff5d5
	.xword	0x31c56d0a6a42dc93
	.xword	0x6268b08f0b288941
	.xword	0x292a9d74fd8f0674
	.xword	0xa76e01faa071d952
	.xword	0xce9ca8fb1ccef82f
	.xword	0xb01b0b2be44fdf18
	.xword	0x32648cd4b6071ca3
	.xword	0xb6e4a275dc676eb1
	.xword	0xe4aeb3f6ac715999
	.xword	0xf1d93fa576db0c34
	.xword	0x764e0ff093e3f172
	.xword	0xb83038e77f7103f3
	.xword	0xc01490154719770b
	.xword	0x8217aca23c0b756b
	.xword	0x4f382235cebbb37c
	.xword	0x7f99860fab29a2e4
	.xword	0x7b39e7150d681d87
	.xword	0xff3d80f5f467c5df
	.xword	0x5c00457ffe455524
	.xword	0x1e98f7d883fa1e55
	.xword	0xdc08101fd3b5cc85
	.xword	0x405c6d1e14dd252c
	.xword	0x4193f74fbd608e05
	.xword	0x8f01ce1d93198713
	.xword	0xe9d69f64ca2ae4cf
	.xword	0xfeb2be169b6f14f4
	.xword	0xa36477a097602e41
	.xword	0xd1b607ab93d4fb88
	.xword	0x562862c3aea15bb4
	.xword	0x8cb24b05f056a25c
	.xword	0xaa51a36e2e53ae05
	.xword	0x2a71078245940b32
	.xword	0x36c73bed339d9998
	.xword	0x4724d08c6a24e717
	.xword	0xcf62f8acbb5f339c
	.xword	0xc6d832aa6bf0e22d
	.xword	0xa1981adc021f674a
	.xword	0x737d12abe461d50b
	.xword	0x061a951494d0d3cc
	.xword	0x84cc90ac525c1e22
	.xword	0xda15dada5c863384
	.xword	0x541e3dec7d37a0ad
	.xword	0x6ccdf7948dbfd9ec
	.xword	0x71d9ef6908ddf9e0
	.xword	0x24e5862a7f8cd6dc
	.xword	0x1684ea607e81362f
	.xword	0x5e99f0bca32b85f7
	.xword	0x9e5549bf530f0403
	.xword	0xaab545d474a1e785
	.xword	0x1fca975dcdf34120
	.xword	0x8ccd43129c9c2be3
	.xword	0x6359c9b7b1f4791c
	.xword	0xefa885c61ff15f22
	.xword	0xb053d98bf8ab33f4



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
	.xword	0x91f19806aaf007f5
	.xword	0xb15954ab40900ba8
	.xword	0x0a996af718da90f0
	.xword	0x751fa0886db230d5
	.xword	0x9b461a8960964f24
	.xword	0xf95b653d2b82b6dd
	.xword	0xa344b25aa533a989
	.xword	0x3845dbe13e9c16a2
	.xword	0x49a84dbd46531038
	.xword	0xab03c98d17c629f2
	.xword	0x2c4d3834ef68e4a0
	.xword	0x46ae48948a9d927c
	.xword	0x9d55a1ff145ceeb7
	.xword	0x2b6afe639db71848
	.xword	0x0245a1732de271e0
	.xword	0xcfbccf04f1a26e3a
	.xword	0xe9311e8d20f6cb01
	.xword	0x29aabf78858ba2a8
	.xword	0xfc363492fb253e00
	.xword	0xd5aaaf73f8d2a0c7
	.xword	0xda7b574adfafa9c5
	.xword	0x00e200445d93577f
	.xword	0x9bf4a4e9ece440d6
	.xword	0x10b2bc0fe9a656b2
	.xword	0xbfb27924e5f4d6dc
	.xword	0x8b21003777450308
	.xword	0xb7eb63dc47c2c48f
	.xword	0x8b18c9e6e18ae77f
	.xword	0xeb4e9c5f67a07c27
	.xword	0xc7d3e1cf75a050eb
	.xword	0x00ed18ac2994dfe3
	.xword	0x655ac5fa96b742b2
	.xword	0x1f65711c81ce3ef9
	.xword	0xd59357f5645595bc
	.xword	0x4028699cba29b4b0
	.xword	0xfeaab8623b833c77
	.xword	0xd42665565aafe71a
	.xword	0x4504a521f86c9598
	.xword	0x7b9f25c62964ec34
	.xword	0xe0d8c5bff0ecf731
	.xword	0x98c6aa30f6865953
	.xword	0xd840b581d4a423f5
	.xword	0x4e0b07926a0c60df
	.xword	0x9ec7e600594aa4a0
	.xword	0x67edf797e8bd5d1b
	.xword	0x8638f115a55f1fb6
	.xword	0x2c1888b72f1dd715
	.xword	0x9a51ae1066d3889e
	.xword	0x16d85ef4ec702b54
	.xword	0xf3ca662bad5607b7
	.xword	0x3b553f7e440cb8b9
	.xword	0x11e12a2ff4e7105a
	.xword	0xdaa269ddc849c707
	.xword	0xf37569391deaafbb
	.xword	0x9869c02ca0caf10f
	.xword	0xb66ba663bdca7ed2
	.xword	0xf6cd9695b2a8ed71
	.xword	0x4d41cca7b88d4a8f
	.xword	0x5f79e710efe3316f
	.xword	0x4ad64e14969c1c87
	.xword	0xe6eabbe2087dc0f6
	.xword	0x6b8f55437dcc2a3c
	.xword	0x2486383547dd7868
	.xword	0xa951ff32727b2771
	.xword	0x3cc6d937fdd0b78c
	.xword	0xd6ac0e1e3187696c
	.xword	0xa9c69f16c935108c
	.xword	0x8b74204eca612258
	.xword	0xa6a2e286f31e31a9
	.xword	0xac282359384fb2c4
	.xword	0x49258f309e9ed35f
	.xword	0xa70825e74028d1f9
	.xword	0x8b0825c28d4f03e7
	.xword	0x8cd891ea2303c836
	.xword	0x010701f058458b44
	.xword	0x3538e0d58b9e0374
	.xword	0x979543f60fa5aaf1
	.xword	0x4452a49559c3c49a
	.xword	0x161a797a6a030504
	.xword	0xe960a5f2663091be
	.xword	0x3ab9ce9b3aa04b3d
	.xword	0xe6bd6b06ba112cad
	.xword	0xd4cebca6c4bdf89d
	.xword	0xfcff5c1c757768ed
	.xword	0x07aef506ef05b48f
	.xword	0x281d47f2a9e78d2f
	.xword	0x6cb878c85fa7f333
	.xword	0xaae750790e712ff2
	.xword	0x118d4826eafc444a
	.xword	0x654994627ab3333f
	.xword	0x5c929b2757e5348d
	.xword	0xdd37c6f41106de5b
	.xword	0x1568d76f3338dff5
	.xword	0xdeecb97b2a44f4d4
	.xword	0xe16d28522d320937
	.xword	0x63e125aa3ece41ab
	.xword	0x64f7c129530e0ee7
	.xword	0x76619241e7070c11
	.xword	0xc460200579d74a17
	.xword	0xc4d18c83004c7e6f
	.xword	0xd8280df2948270c4
	.xword	0xaa35b02aa8d92a71
	.xword	0x5a83b649e3e25812
	.xword	0x7da9d0cb9d75d501
	.xword	0xa2e242d5b1a3860a
	.xword	0x1ae56f623ecdfd03
	.xword	0xb5ba48a610aba83f
	.xword	0xab96c4e22a61f74d
	.xword	0x77141aa0becf0aee
	.xword	0x0457ccfe4701d8f9
	.xword	0x3d598f12c40ee530
	.xword	0xa30a552a117466be
	.xword	0xb0a048064c0940c5
	.xword	0x57eed4760aa2b215
	.xword	0xf28249f60e4462dc
	.xword	0x7133df0b4943e7a2
	.xword	0x1673529dcfa346bd
	.xword	0x16ffffe9c2316d70
	.xword	0xc6e31d25ac88904d
	.xword	0xd960768160e0e7eb
	.xword	0xe478db0415ac6b5d
	.xword	0xf619e81be36fd726
	.xword	0x8f4804f682758841
	.xword	0x253c9e5cc2159b31
	.xword	0x496c568e84d7e7e6
	.xword	0x43cc83f5d3ea72ae
	.xword	0x5f86a156643eb945
	.xword	0x8dfb44ddcce9e4fb
	.xword	0x36d0e1b4e059b61c
	.xword	0x0b42cc4683620389
	.xword	0xd69e8fe920072dc9
	.xword	0xfedb302283064666
	.xword	0x0bee9263ef7dba26
	.xword	0xf76b6278fb158f25
	.xword	0x3adb37fe449bd331
	.xword	0xb57e6efe619afda5
	.xword	0xd147d929e62d63f9
	.xword	0xe110f783b8fc3489
	.xword	0x413a9729eb3d2db7
	.xword	0x86788e2262482dcb
	.xword	0x4bfdab6db3f6b4d7
	.xword	0x65316aa67ef708dc
	.xword	0x67a813fac43610f6
	.xword	0x75773039a61929d9
	.xword	0x4758dcef59d5d14a
	.xword	0x15d0038f6362ab56
	.xword	0xbbeb1078eb618aea
	.xword	0x5499a76475e8fcda
	.xword	0xb6e649c596f1202c
	.xword	0x48f415299c580e76
	.xword	0xd32323d40c48a0b8
	.xword	0xa8fe761e263d7703
	.xword	0x43f85e7878692f4d
	.xword	0xaeb0d321cde9f870
	.xword	0xa825954574ead57c
	.xword	0x67e90d256630557b
	.xword	0xfad9fcc829ebfe20
	.xword	0x492eb8e65f958f8a
	.xword	0x522511c5e7442bc2
	.xword	0x6244a4438d20ebd5
	.xword	0xdb754a83af2000db
	.xword	0x3c9766d93038de08
	.xword	0x3bc139350fe0437b
	.xword	0x3b3030a31fd2398f
	.xword	0xb0a02dd49914d784
	.xword	0x2c108447f685796c
	.xword	0xda7d8fc4321b292c
	.xword	0x725a8552b29afa30
	.xword	0x45ca345211e340d5
	.xword	0x4a1694883e070edd
	.xword	0xc9441dda80cb1d4a
	.xword	0x331b0d9f1827afc2
	.xword	0x035f68f7f1ab4e1b
	.xword	0xe680e7e0d434d11b
	.xword	0xed164aed5737847c
	.xword	0x6cc47b4c42a5c25a
	.xword	0x7f100369cc590a58
	.xword	0x81154b486af5d335
	.xword	0xb11284dd7c794a01
	.xword	0x73973b1b6434e1f9
	.xword	0x08030757131cd10c
	.xword	0x797babc9743907b8
	.xword	0x05232e4608b0ed02
	.xword	0xc70966ddc8a4efd5
	.xword	0xd63fe01f2514d891
	.xword	0x9c752ad6d896ce4d
	.xword	0x2d732bd5f5de351c
	.xword	0xf4f5d6d66ed16ce3
	.xword	0xc1b8737c2deae3d6
	.xword	0x353dee5e2e9ce074
	.xword	0x60cf44b045b93674
	.xword	0x3ea67e4d62505388
	.xword	0x54b66f7dbdd5062d
	.xword	0x18078796d228625e
	.xword	0x0bc23b5c98b3de08
	.xword	0x69563c617ce09039
	.xword	0xdfa91e7fba632a7a
	.xword	0x6d0de4fe7c2f0ad1
	.xword	0xfd7b842bc152adac
	.xword	0xf9e9642440db3e55
	.xword	0x9a56937bffa06b1c
	.xword	0x1a60f13c890b037b
	.xword	0xae1d5111a99bb9b8
	.xword	0xa081503263599348
	.xword	0x1eff5be979818e74
	.xword	0xc85257ffe7a62c4f
	.xword	0x6ab1f9101d48fae6
	.xword	0x729db1a79a32fd99
	.xword	0x8e048b752c2817ad
	.xword	0xb51f69c5b748cde2
	.xword	0x71ba881a3949b1d1
	.xword	0x2217a66d8f8afee0
	.xword	0xc0bbaa24261877b9
	.xword	0x8d8a909b51f5d8ea
	.xword	0xbdb3b68dce373004
	.xword	0xb3bc58ac6bd1c263
	.xword	0xe0a3efd93fb47b97
	.xword	0xb6abc596f1e67d09
	.xword	0xc72dcb084cf1e2b6
	.xword	0x2e9b83fc11ecd0b8
	.xword	0xf515367c528d09fe
	.xword	0x2d0a01949424581f
	.xword	0x29c63d9037077ebb
	.xword	0xa0b5e3768b29d421
	.xword	0x215608382d6b5dff
	.xword	0x6b7349bfd10a0818
	.xword	0xe402c795a06daeb2
	.xword	0x155d7e5fd82d6fce
	.xword	0x082bf23349c18b37
	.xword	0xa57ae5e5cd6cd198
	.xword	0x74d6afc216c093e4
	.xword	0x2ef7fceb01d2057f
	.xword	0x5973fecaa8d00fa6
	.xword	0x04ab88a604095dc5
	.xword	0x62d772cf8b46168b
	.xword	0x4f84ae572321387a
	.xword	0xc4800cd309b14a77
	.xword	0x44901185552cadf1
	.xword	0xd5966c3fb4062c33
	.xword	0x844f57b882be0ed6
	.xword	0x12dbce06539c491a
	.xword	0x6be17b8eee9e6921
	.xword	0xb208316a22add6b7
	.xword	0xe7885ff43d3c0afe
	.xword	0x063db15a1d251ce5
	.xword	0x4a9995ff88267d41
	.xword	0x694376dae475caff
	.xword	0x70ce745bd31b8dab
	.xword	0x0b98f81ad5f93163
	.xword	0xd57d0d7ae1ecd2ab
	.xword	0xa3c4132ea2dfa73a
	.xword	0xdc925f1fd48a71ce
	.xword	0xa97f53e13aaa5df6
	.xword	0x3140011bdbc6d184
	.xword	0x2c75c609bcd85820
	.xword	0xb560a5e412d557c5



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
	.xword	0x0dbc1983eb0d9ca6
	.xword	0x0e228dcf161908c3
	.xword	0x48cc95c1737dbfda
	.xword	0x3c69df7a447e6095
	.xword	0x1f4d165503893846
	.xword	0x0b4dfd9269099635
	.xword	0x68d3f077a28cc0a1
	.xword	0x07aae9a4bb293612
	.xword	0xd2ede030beac4e84
	.xword	0x3ff5475cc6fe3e8f
	.xword	0x9a961779b9541b7e
	.xword	0x428e14b1605cbeb5
	.xword	0x04939e0f40027918
	.xword	0x6306daa7690d63a0
	.xword	0x94e9e563335f854b
	.xword	0x45bf07d77dba2c81
	.xword	0x7bee25a0a8b0fdf3
	.xword	0xb5a44b3bd06c1145
	.xword	0x4835fde2561e9bf7
	.xword	0x0b946d4dcee3d811
	.xword	0xf06003edc4f21bf5
	.xword	0xe7f87bb588d85771
	.xword	0x0fe01a825b1e3753
	.xword	0x814394d55803716d
	.xword	0x2fd0b6c3ec52076b
	.xword	0x15035a730c24d5a8
	.xword	0xf73b07d39c3cc8c9
	.xword	0x1a1db4af596854cf
	.xword	0x5012aa7e0d0092b8
	.xword	0xd8600156f15902c4
	.xword	0x4a65777f8611107a
	.xword	0xa895825185ddb18f
	.xword	0x5c8715698c5e740b
	.xword	0x8020d79ce1d9afec
	.xword	0xfd74c374a42441ae
	.xword	0x930e4f3a959de260
	.xword	0x4b2a631781d1a85a
	.xword	0xc390458be9d21850
	.xword	0x685860c0795413a8
	.xword	0x16c6b958fd5225bc
	.xword	0xfb4f46eca597f9ba
	.xword	0x8d943c903de1dc78
	.xword	0x363db5b09e6b7bb5
	.xword	0xd05f44ae89a6f05a
	.xword	0x1da5c985d2715d29
	.xword	0x0f3eb70d7ade1368
	.xword	0x27eef327c408da21
	.xword	0x86b5fd59ddb7da59
	.xword	0x8733bd99b8ae0799
	.xword	0x8c614f23582205aa
	.xword	0x16102a071e40db7f
	.xword	0x00beb7a843f8f5e9
	.xword	0xe6056c49800bd248
	.xword	0x3802f46b3e7dc478
	.xword	0x199dde1960461777
	.xword	0x3a631d9a30c4908b
	.xword	0x7c32001d20fb7e02
	.xword	0xfd9447af51f14598
	.xword	0x565c3b61809d25cf
	.xword	0x0d5ed2a7040af0d9
	.xword	0xd50b6831322d1bf6
	.xword	0xeb9bd19823b11b51
	.xword	0xc070ece2bd9887c1
	.xword	0x0f6dfc6203ab6399
	.xword	0x3c5f4afd223f56ae
	.xword	0xfa5d723ac0887dae
	.xword	0x1e5a70a8c4a106ca
	.xword	0xc584c68edb688e1f
	.xword	0xa2abd4500b010983
	.xword	0xe85f922022909b32
	.xword	0x3af3d6874d8056a6
	.xword	0x24bd5a93b1d3cede
	.xword	0xffee3b7aad819305
	.xword	0x7bd43c92aa63bed6
	.xword	0x5647c06c8967cbfb
	.xword	0x286316b9fb98a205
	.xword	0x94153fee47edef12
	.xword	0x776ea7752ce92628
	.xword	0x3c5cbb270880b05d
	.xword	0xcde472709c6db326
	.xword	0xbbae4b66130db083
	.xword	0x2defb71b775a7958
	.xword	0xda89450b7bd0ccc5
	.xword	0xb0f5c8162241aed2
	.xword	0x436d8ee5417b9897
	.xword	0xa56f71d48911264e
	.xword	0xe5f79a7c8515790c
	.xword	0x5cdb689d759a4499
	.xword	0xb6345eee7d9fa367
	.xword	0xa5a4694fcf0c04c7
	.xword	0xd4e2fa75c597c094
	.xword	0xee0c03113ef7042a
	.xword	0x18aa1c8545493040
	.xword	0x34d7cb83b1b5289f
	.xword	0xb05530d12afb44b1
	.xword	0x5a7ecf2a8315b1c5
	.xword	0xa574ccb1007a45d9
	.xword	0x501e34eb909cf17e
	.xword	0xbb2655f0178ea065
	.xword	0xdb56d31d5754760b
	.xword	0x6ff1f9af9dd3c7c3
	.xword	0x6e8aa5150e19d3a7
	.xword	0x5451b723235d5ecc
	.xword	0x605983cdc6e8e317
	.xword	0x035a91e37a2fbaca
	.xword	0xe2f5fc7a45e1c3e9
	.xword	0x5a91851a6aaf37c1
	.xword	0xd1db80209ae174cc
	.xword	0x1cb60f15903fb9bc
	.xword	0xaffa25cd702f6538
	.xword	0xe9ee47a499ee2b3d
	.xword	0xa449dcb1d94089b1
	.xword	0x07241cebbe77ccfa
	.xword	0x5880b8b4c8a22e48
	.xword	0xc761359ba620759b
	.xword	0x1d819176015dccd8
	.xword	0xe070edf0787f2d84
	.xword	0xf9e4e8959b21974c
	.xword	0x0c3869d34f327b72
	.xword	0xf43640bc159be993
	.xword	0x0e727f6c7e622444
	.xword	0x5399763d8d226c04
	.xword	0x06b35c712939eea7
	.xword	0x441f1761a89cb6a9
	.xword	0x6a43f69f67a05d2a
	.xword	0x5c0a24e4f2c58cf5
	.xword	0xf2b591eba15fa8ce
	.xword	0x28febf88a67d8eb1
	.xword	0x9cfa418dd1b47cbc
	.xword	0xd321efdae7b4c7fd
	.xword	0x150f230960b274a5
	.xword	0x2b2e357789a81fbe
	.xword	0xa793c74b31509bc7
	.xword	0x622ad5a9d6c9c5dc
	.xword	0x17028c2bcf9e6e9a
	.xword	0x49bbbb337c4b3260
	.xword	0xb46687dbddc39ce5
	.xword	0xa7c3c5339b8aec5e
	.xword	0xa3d05cabd0ec2c0a
	.xword	0x4b6fb2e32abc7db9
	.xword	0x42bf47e8471523f4
	.xword	0xdecb0e755322858c
	.xword	0x858fb309054a9bf2
	.xword	0x0c0608c5a77e4644
	.xword	0x0322fadd65695e84
	.xword	0x350dee21f86644e5
	.xword	0x2aa74b52f2d489c5
	.xword	0x154fb73f99b1dd78
	.xword	0xb3c02e706f4afbee
	.xword	0x19643b823bea69f4
	.xword	0x1281a19ae0d386a0
	.xword	0x4b35054e5622afac
	.xword	0xe796b9a91b8c852c
	.xword	0x2a911d86a5873529
	.xword	0x236143c4c6524fa9
	.xword	0xeba3a12ea5a53f84
	.xword	0x606562d26354ae7d
	.xword	0xe0c8625e0dd684a4
	.xword	0xd1c9009a3a7edd6d
	.xword	0x5b7c7076042a4fa0
	.xword	0xe5c94ec628b53a0e
	.xword	0x34295f6347578c03
	.xword	0x1dcfce81e9455ab7
	.xword	0x1c9d7ebe036a45ec
	.xword	0x9a07e7103d8f0647
	.xword	0xbaa269e3ed7d2b25
	.xword	0x9dac898b0094e4b3
	.xword	0xe52b6b5f9a2f4e9e
	.xword	0x4bce32740aac1e55
	.xword	0x55f539004cae37e3
	.xword	0x774204be8309637f
	.xword	0xac4b8f1746bf8aea
	.xword	0x5a1ebe3b49c65c7a
	.xword	0xef673cee4caa4215
	.xword	0x9f7898ac1b167545
	.xword	0x5b4eb09ded80051a
	.xword	0x21644ed711858cb3
	.xword	0x7159714b88427443
	.xword	0xe9057bf6f97e2cf2
	.xword	0x9ff588c107f2c6e9
	.xword	0xceef517c31514d1d
	.xword	0xc8527697fb916ccf
	.xword	0x1f8274be4fc196f8
	.xword	0x72c45c39b9da38cd
	.xword	0x033ff61951d6ed92
	.xword	0x5d0f47bed2cc769f
	.xword	0x65be837f0be0d90b
	.xword	0x16a71914a283debc
	.xword	0x57f122a0bd183bb9
	.xword	0x65c6609640dfe136
	.xword	0x48827d72048feb4c
	.xword	0x27ce5c730448cb73
	.xword	0x100d681408052014
	.xword	0xc77a735896881f3e
	.xword	0x095b00598c00c174
	.xword	0xb8e346ebce1ddab6
	.xword	0x2eba5fbb4c00b5ee
	.xword	0x63cf13bb9ba73fb7
	.xword	0x393ca84b834b7dcd
	.xword	0xabde021644e0fa23
	.xword	0xf324230852673e44
	.xword	0x585ff04a18c172ae
	.xword	0x6546e2390bc4630e
	.xword	0x648bb4aa277f31db
	.xword	0x3a38aee429acb94c
	.xword	0x190927ba5b5a4580
	.xword	0x113ce805ae6ac1f9
	.xword	0x11dda3e8742a1796
	.xword	0xf216951e950a7008
	.xword	0x091c35f808b9ac0f
	.xword	0xeb99804d6622244b
	.xword	0x897d24ac0293f8b7
	.xword	0x184b0908c1ba50b7
	.xword	0x131ef1d84925686a
	.xword	0x88853940210f3999
	.xword	0x7808f2a93fc838f5
	.xword	0xde62b1f0da66e49c
	.xword	0xd21287112e3f7fd9
	.xword	0xe7b7f59c5be71d19
	.xword	0xd7b85ecd107c7ea2
	.xword	0x90ccfff8297ab80a
	.xword	0x2fbba7f36b9e0205
	.xword	0xf96f03b7d19430df
	.xword	0xc69712026fd5ac76
	.xword	0x5f8279c59decd906
	.xword	0xd251f99743f6b6ef
	.xword	0x2df89e54a9000979
	.xword	0x5a22cb1850aa39a2
	.xword	0x07611516f94a2e5a
	.xword	0x343efe8bb476ceb8
	.xword	0xe897357f98eb8018
	.xword	0x61dd98b2d766cad0
	.xword	0x3e1aa1802132bb22
	.xword	0x64645aabab95e6ce
	.xword	0x654165988c6aea69
	.xword	0x14f0518430483230
	.xword	0x1a33c0d77e35cc26
	.xword	0x542fd23c3f4dc57b
	.xword	0xd870b4bd63e665ed
	.xword	0x15c58f359133d8ab
	.xword	0x2849e49061052e25
	.xword	0xf163fbd13a69978c
	.xword	0x4587ae4bfdb63dbb
	.xword	0x681ba07f90e1c6aa
	.xword	0xe08d126cfed5a1c7
	.xword	0x8bd43230571b7a70
	.xword	0x0b75b1b64b1685cd
	.xword	0x752f2c76bc7cec2c
	.xword	0xcff616a76b067991
	.xword	0xd65d3ec71d6d2d72
	.xword	0x25158d487ab73c26
	.xword	0x0c30db1cf06287cb
	.xword	0x30b06dc8afed37ea
	.xword	0xa69704aca4149ca2
	.xword	0x587c909547aef22f
	.xword	0x8eecb0431ff40897



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
	.xword	0x556407a92000bea2
	.xword	0x10f727a15ee16caf
	.xword	0xad8d727aa63cc71d
	.xword	0xa0e0f32ee5ec36ce
	.xword	0x007d9c9036c7bdac
	.xword	0xfb87344ae6746020
	.xword	0x4b87b6f2c8dee64e
	.xword	0x91abcf9bf450c9c9
	.xword	0x5c787eebd6d4ffc2
	.xword	0xbdc30b935b4ba801
	.xword	0x6343e51779df76ae
	.xword	0x8005954ae6ce5d7d
	.xword	0x22a97e26d71c249e
	.xword	0x2152cba3f279ed70
	.xword	0x32c05c2e24fb581b
	.xword	0x6ae869f338562571
	.xword	0x8819b8df7f6e4b6c
	.xword	0x9637af154e2de3e7
	.xword	0x63846f640e1e26aa
	.xword	0x42ca29c1b062e7d0
	.xword	0x2fd5e84eee7d5bee
	.xword	0x44c4dbbe81d57a6d
	.xword	0x3f7adae6d0809ffd
	.xword	0x0a750be800a9ade5
	.xword	0xb1e30127a99027e9
	.xword	0x2c287833a80428bd
	.xword	0x47f2d39a793778d6
	.xword	0x6be9d091dfe5af6c
	.xword	0x60a4876eefe60984
	.xword	0x6f1597632958f41a
	.xword	0x4df169dd20063f69
	.xword	0xc6de74d4a5b506d5
	.xword	0x365baf69d33b128b
	.xword	0xde6444642aa78c5a
	.xword	0x8eacf7f71683addf
	.xword	0x15b0c843c72bdc6e
	.xword	0x72ca283d4777c7be
	.xword	0xc65d4ab88d963eda
	.xword	0xc311e3e121eb4f62
	.xword	0xc809e44525375c51
	.xword	0x4f566eb27c59f438
	.xword	0xb3dbf2d1410bf137
	.xword	0x9a9630238fa07af8
	.xword	0x4d22f07c54a59791
	.xword	0xac5c50b6915fae46
	.xword	0x50793b9dfabfe7e7
	.xword	0x82d7e98bec83c1c4
	.xword	0xbdbadfb529b2762c
	.xword	0x9805d8ffd5acdb23
	.xword	0x40f34ae81b9f05da
	.xword	0x7274d7634435ae32
	.xword	0xb4134b72fc88dfed
	.xword	0x7a00f1aa87464cfb
	.xword	0x53eaaf1d808676e2
	.xword	0x3aebd95c542005a7
	.xword	0xa64bc533998c88ad
	.xword	0x36ceb31cf09eaa76
	.xword	0xd3e8e29cb6d60883
	.xword	0xd1871097d862a65e
	.xword	0x765eabdbdf103333
	.xword	0xf57cf375cea8f190
	.xword	0x1742a00e5a2e05f9
	.xword	0xc80153263a65e93a
	.xword	0xa69adf3a0ceed3ee
	.xword	0xd9fa25b592e6239d
	.xword	0xead8d0a0e62f34a8
	.xword	0xdd7e4265fee0027f
	.xword	0x1638eb5362679b21
	.xword	0x6717884480b85604
	.xword	0xd61444fa6f1bd94d
	.xword	0xc1e7a490162d9ecb
	.xword	0x072b7e2697a20c01
	.xword	0x372aca7fcae8a926
	.xword	0x98d3ed7f0eee0bee
	.xword	0x87d5d5772f25bce9
	.xword	0x47c7ca9e0f08e2fa
	.xword	0x038db9280a046973
	.xword	0x7753b22240ebec02
	.xword	0xb715845528ca25a4
	.xword	0xf238acac4fade439
	.xword	0x9ece1067607407b6
	.xword	0x229507e61dd0949a
	.xword	0xf5e6b67a0bfe345d
	.xword	0x09702aad196c5fce
	.xword	0xcff0233b01fd37cc
	.xword	0x318c8a738d2578b8
	.xword	0xa598324e2218b28c
	.xword	0x42bd7afcd6cf87fd
	.xword	0x0671b29ffbd84cd5
	.xword	0x45452197e55f2e05
	.xword	0x14704c7669d98014
	.xword	0x8f27ca046597fb43
	.xword	0x271515bb4bed6946
	.xword	0xf4d5576fffa1ee69
	.xword	0xabf1de3b4a32a968
	.xword	0x8afcef3a75c96c5e
	.xword	0xb0cbb64f6a1e0748
	.xword	0x862a4ab2b1e502ef
	.xword	0x3d9a1641e9c88cc4
	.xword	0x643d13c6e3f4dc6b
	.xword	0x02e66ee839514855
	.xword	0x3d97eed26e6c99d5
	.xword	0xd3f0640898bd0275
	.xword	0x5238ac11bbce4670
	.xword	0x59d1753249d6d7ed
	.xword	0x7cb2a3dbcb7ee890
	.xword	0x540ca20cbcb1b899
	.xword	0xa3159d118f6ec65b
	.xword	0x47b6c689bd967f71
	.xword	0xdf21653aa0f396a6
	.xword	0x5271ea8138b7bf17
	.xword	0xb4de2606624ad341
	.xword	0x6ce8614092f8710b
	.xword	0x34225609f08ddb8f
	.xword	0x0620f3bbde9d8682
	.xword	0x1ec1b44b66e34370
	.xword	0x2ee845ae9fd009a7
	.xword	0xfe0ab071d0ddb2f1
	.xword	0xc7372ff9d7e58842
	.xword	0xd57688ff2084355b
	.xword	0xab514ecd5805137e
	.xword	0x4b1e926396fb134a
	.xword	0x86b221d637ae927b
	.xword	0x5c3c05a4a9ca0e4d
	.xword	0x73c6f0c811286178
	.xword	0x180596affcfc737c
	.xword	0xe61c83ee78be189f
	.xword	0x65fb836ad824dc8f
	.xword	0x986acc3633844422
	.xword	0xb2051da99884e06d
	.xword	0x0795512e3e836e1a
	.xword	0x097e7ae87bfd6772
	.xword	0xd0ee2b56fbd1bce8
	.xword	0xde6c00b1697db676
	.xword	0x850b71d39c363d6d
	.xword	0x2568131d815dddf1
	.xword	0x7ce8bbece49f8fcc
	.xword	0xaf78abb89d47730f
	.xword	0x4250a62d51f2d3ff
	.xword	0x24f2b8b8bd9df0f5
	.xword	0x46c7466ddc90c0b5
	.xword	0x77b27295e7ed84c0
	.xword	0x8a5b9e6a25c11048
	.xword	0xdf93e296be6ed601
	.xword	0x456cf0bb1f48c434
	.xword	0x1621f3d70a15ae98
	.xword	0x6252641b9f0a1515
	.xword	0x66b2e544088adff2
	.xword	0x27a315788cefc5e4
	.xword	0x6e9b4fe2612ef692
	.xword	0x81a0a7664ce96960
	.xword	0x54e37e57c6b7015c
	.xword	0x33e7229d0cdad8bb
	.xword	0xa63ded44ec3b970d
	.xword	0xd33bc4b07760325c
	.xword	0x7efb77144003ddff
	.xword	0x45b6f900b907a550
	.xword	0x5a9d86fba82beaa7
	.xword	0x7b2eb9c8037ef145
	.xword	0x656dbf951165e0c0
	.xword	0xac835bfb5214cf21
	.xword	0xfa3bcfdcd12e7e9d
	.xword	0x62eeed86a9956e07
	.xword	0xf038ebbfbfdea871
	.xword	0x44edbb2693c58e32
	.xword	0xc27523fc3a17cdfc
	.xword	0xd9cdb0399b0ce293
	.xword	0x496527c24bb686de
	.xword	0x9a6fc82b59826a3c
	.xword	0x54dd0eb642dba7f3
	.xword	0xd4e5fdd65b320c2c
	.xword	0x2dbde7b10732d861
	.xword	0xfe3d2f473b5bcb72
	.xword	0x35bde7f739070f44
	.xword	0xc2df36103f80b554
	.xword	0x7d9b6fad4cbe39a3
	.xword	0xf9b9d3e196f23ac5
	.xword	0xac2af41a2588be1f
	.xword	0xf2382d28b4358a28
	.xword	0x3901057d416f618b
	.xword	0x7a9000ee00c923ad
	.xword	0x0bd8e3f921f5cf2b
	.xword	0x7b4cd487769d9f7a
	.xword	0xef9e6af4f0568a64
	.xword	0x6fe8501bd4a5002b
	.xword	0xa26843e81b0e8c45
	.xword	0x1d8641a1bf6632b0
	.xword	0x2e6c14eb0e78834c
	.xword	0x1f02b1614bed6c83
	.xword	0x3433836610155da7
	.xword	0x78ea9fab255d5a48
	.xword	0xaa38606b169ff366
	.xword	0xfb9dd5b4ad943041
	.xword	0x953794eb5aa0f5f6
	.xword	0xce47ea758468d6e3
	.xword	0xaf797844d1d53830
	.xword	0x197452876db39561
	.xword	0x709b703d2616ed96
	.xword	0xf43d4558bb5e39e2
	.xword	0xa37f72fd0254c122
	.xword	0xc009ab4ea5dcb4b7
	.xword	0x953a4756cb577374
	.xword	0xa21f632dc9404ba6
	.xword	0xa0d34ebeb7c83bc7
	.xword	0x4ec330f02b9156f6
	.xword	0x2624c72a8c43e5a7
	.xword	0x2197f289d1fe7b3d
	.xword	0x5feb02f8ac868134
	.xword	0xea13a7dfb7d6ed7e
	.xword	0xdc88c5438d01e1cc
	.xword	0x5cdb9f6699642316
	.xword	0xef2027fb52457700
	.xword	0x48e23a933d518ffb
	.xword	0x2b4885148cfd4687
	.xword	0x716fb5b16c93f515
	.xword	0xc05658877bff2193
	.xword	0x71eef0fd45558bc6
	.xword	0xaf37a1f45e4f4794
	.xword	0xd858e9d15942fb55
	.xword	0x4caa15c6cbf5f525
	.xword	0xc33ad9ca941408f1
	.xword	0xbccb4675c34e3eb8
	.xword	0x0104da8c6f491b20
	.xword	0x920e51556d6fbd7d
	.xword	0x48c863e633e7d9f4
	.xword	0xf402fe83ad2461bd
	.xword	0xe8f449ebfb83af84
	.xword	0xe588e276d7f4f576
	.xword	0x535ad66c7b89fc8b
	.xword	0x96469dd2a9155f69
	.xword	0x29fc1ea4e4c4f0fe
	.xword	0x959fc1bc31035c6f
	.xword	0x973d19acbb5f6d08
	.xword	0xeb1023739a700ef5
	.xword	0xa460191df9e25652
	.xword	0x35ebd6d54714165e
	.xword	0x1466e51f3a3e1050
	.xword	0x070466ec29d8867a
	.xword	0xa613939814c4c2c5
	.xword	0x914d925e44e71331
	.xword	0x94cab8de3af223c0
	.xword	0xe397f37ee37ebbd2
	.xword	0x058b0ce0d8860cbd
	.xword	0x9ce92614f1c2fdbc
	.xword	0xca7c0384565fbec9
	.xword	0xdd988755d56e1995
	.xword	0x7404acf961a4455c
	.xword	0x1aedda4d588e9e7c
	.xword	0xb274ff56332bc19a
	.xword	0x2ea484df94415089
	.xword	0x74e786b4dff81ae4
	.xword	0x0aaf9b5a322cb705
	.xword	0xc473c69da2cdc820
	.xword	0x505d48c18d8ab3e5
	.xword	0x5bef0655b0602006
	.xword	0x069e5c16478707ed



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
	.xword	0x6fe545b8159d009d
	.xword	0xded93379d25182eb
	.xword	0x355398faad86ace2
	.xword	0x3370df12e888af75
	.xword	0x45bb9ea8a537650c
	.xword	0xe60a5bc78c65e394
	.xword	0xb0fb8baaf32f6953
	.xword	0xe77a82009f262a74
	.xword	0x98e0df8f78cbbdc1
	.xword	0xdddb7feb29fd3207
	.xword	0x317d95c25e50dc91
	.xword	0x9578bbdc05aa67a8
	.xword	0x362c898a164d6865
	.xword	0xabda92665cda10dc
	.xword	0x589b381179a051f1
	.xword	0x412e5318ada6d531
	.xword	0x05b17cf9b574947b
	.xword	0xd5c6cdbb4f673159
	.xword	0xa5a89b4fb196e2ee
	.xword	0x9355a05e964d8ea7
	.xword	0x0b91e495d3144aae
	.xword	0xb35ad1274b29b041
	.xword	0xf48ff4ec7656c978
	.xword	0x442f1391e4fee8bb
	.xword	0xb6180784d2383a34
	.xword	0xf64953fdaf30a607
	.xword	0x0299b46d462b6ec0
	.xword	0xec1b847de3c43eb0
	.xword	0x6bcd931471c425da
	.xword	0xc43d4bdead45894b
	.xword	0x6a0a5533a65d425e
	.xword	0x8e8f29f20aed6c59
	.xword	0x58b7f7fc4bae9feb
	.xword	0xc0fab6429f9ed105
	.xword	0x84b32c8847805055
	.xword	0x0f6c93bdec76a1be
	.xword	0xf4b4913390aa0ee9
	.xword	0xcfe80f387a2049eb
	.xword	0x5ae255c2463901a9
	.xword	0x0ba96d13248167c7
	.xword	0x2ccd5293eeeeeb9a
	.xword	0x2f920f0f08729d49
	.xword	0x9ff253dceb947a4b
	.xword	0x27bbedbf6d103a24
	.xword	0x604830312ae87660
	.xword	0x062c6c6fbbee22e7
	.xword	0x83b30582505b20f4
	.xword	0xef5e95181c18f4f4
	.xword	0xc0e64219b058e2a4
	.xword	0xf1c960cb54500bfa
	.xword	0x3026a690a4b545c6
	.xword	0xe9a0f6fb499aa107
	.xword	0x81c9374f05a85394
	.xword	0xf191f83ee778cf1a
	.xword	0x8787acb9d252e100
	.xword	0x2556a51a719035d6
	.xword	0x7c80cf78763fe7d1
	.xword	0x4aba4d30940afbfe
	.xword	0xc39ecba4470cf522
	.xword	0x8f0f2abcbabfe1f7
	.xword	0x353f70186e05bdce
	.xword	0x393ab0296ae10331
	.xword	0xa27f904eb2560e5d
	.xword	0x72f5f057740479af
	.xword	0x4fb71181d187f2ee
	.xword	0x7fd83bea369191b7
	.xword	0xe8b3e83baf42b9d6
	.xword	0x40fddfbbb2031a3d
	.xword	0x2b0711383f7b9ac1
	.xword	0x120511f9ebe4a154
	.xword	0x2cdfc564d3bf4415
	.xword	0xf0ac966eb636b215
	.xword	0x9c8d2c7e5e5ffc32
	.xword	0x8ca59530a29136bd
	.xword	0x4f55fa8e956bd8d4
	.xword	0x2f0082cbce5f4226
	.xword	0x1d9e9b31d3c852c0
	.xword	0x859811fbb7bc53e9
	.xword	0x919f335ae2c6fa47
	.xword	0xa968611f006da954
	.xword	0xa86c91cb8f54698c
	.xword	0xabd2889f51e0cdf0
	.xword	0x38d28e2f72e68749
	.xword	0xe507c61452a54756
	.xword	0x801c4d442919b404
	.xword	0x0ae7488e7c85db53
	.xword	0xa5504f495c17f00f
	.xword	0x957e0d2f9d0fdbd4
	.xword	0xdb53237fcce93aab
	.xword	0xee99944bea3e7dc9
	.xword	0x4e30e1c6037647b7
	.xword	0x34987e89221d8103
	.xword	0xbe9db4acd045e08d
	.xword	0x630b7984c2d5f7ca
	.xword	0x9fa1843aa1f51805
	.xword	0x25685f9f9c7f59b2
	.xword	0xbb10fe6c164c36bb
	.xword	0x7e06a7df5897eb50
	.xword	0xd388d79eafd66294
	.xword	0xe60fd83528ca083d
	.xword	0x79142edf8d985528
	.xword	0x6e749f2b7e8a6ee5
	.xword	0xc159e90daeaaf808
	.xword	0x44d4a3d0eb68285e
	.xword	0x1cfd787fc5daff52
	.xword	0xd6cf631ca430fb07
	.xword	0xe50645cf54c3a0e4
	.xword	0x72edef8c838e088a
	.xword	0xfacd6eee2c768717
	.xword	0x36ba82702ea9a9f8
	.xword	0xdb67bbf7f6cd2df2
	.xword	0x8abf9eeddac93608
	.xword	0x1526b309bb6a0473
	.xword	0xfadf6b8ddfa7a146
	.xword	0x1053e4c2fe382050
	.xword	0x8a076ab70ddc6b2e
	.xword	0xdacd8db1be560572
	.xword	0x300f11283ba68f7a
	.xword	0x1c281c9fec3694a6
	.xword	0x3b1b31d16e0ee0db
	.xword	0x4cef441200da876b
	.xword	0x2a718db15414405c
	.xword	0x746c9fdce946e5b6
	.xword	0x48f932e79ccff2fd
	.xword	0x48af012669ba009e
	.xword	0x24b6c8626c8513fd
	.xword	0x391bd1d29fa95b67
	.xword	0xef31cf93630b1f6c
	.xword	0xe84706c4ecd0d54e
	.xword	0x6d023266036b9cfc
	.xword	0x28e824a7ef2d343f
	.xword	0xdc9a98a57a1b0097
	.xword	0x7984cc726e081814
	.xword	0x9430bacb968d89c0
	.xword	0x03922f9f439e3864
	.xword	0x3d1462804b5a0605
	.xword	0x7fddc61aa9f25a36
	.xword	0x2d48fa095ebc1a69
	.xword	0x110fcf031fce3e25
	.xword	0x2e63a3cac128c26e
	.xword	0x7a871133ec45e7bf
	.xword	0x6770e70d1c126a05
	.xword	0x21878db91864cf1b
	.xword	0xc15d59a7dd39068a
	.xword	0xd482adf20acb6938
	.xword	0xac39391cacb42d0d
	.xword	0x25f6d3e320dc076c
	.xword	0xf48282376e347be2
	.xword	0xc0eb4da7e25e36df
	.xword	0x79c0d23c024802a0
	.xword	0xf7a2df578864f54d
	.xword	0x42410b6b4714a5db
	.xword	0xcec1036b1404f3b5
	.xword	0x4a49253c4c45f613
	.xword	0x223d5f0ea4e86193
	.xword	0x434d429c903176b3
	.xword	0x4a29b44f142f00cc
	.xword	0xd836acaf6a0ae4c0
	.xword	0xefb1f2cd51732689
	.xword	0xb9e55b3b3a34f7f9
	.xword	0x1f9d9c1bf4578415
	.xword	0x14ef5de4f1dec12b
	.xword	0xc85a280b767b3398
	.xword	0x28c1bc3451087c78
	.xword	0x86b356f85b0233c9
	.xword	0x0adb1c7d6610f661
	.xword	0x200d4c6412fed747
	.xword	0x274f2e0c9aa6ed42
	.xword	0x4806ef77a39af4e3
	.xword	0x671a6258e786846e
	.xword	0xf8de9878d9286a3b
	.xword	0xd3768f6eeb0fcc64
	.xword	0xf6851d7b5c97ee4e
	.xword	0xe46179c18b71bfff
	.xword	0x78d284278dcfdb17
	.xword	0x8d592d9c24a9a838
	.xword	0x5e601965d9529c8f
	.xword	0x061621d58db0eb46
	.xword	0xbb152190fe6cf02b
	.xword	0xeac3c2de4fe6a75e
	.xword	0x5fc652f788d991a4
	.xword	0x6b737911ce13f574
	.xword	0x48709bbdebaf8148
	.xword	0x3f898dd90a225d64
	.xword	0xb4bfae755e44e041
	.xword	0x79acb420f7a6d28e
	.xword	0x2def8e7ad715127b
	.xword	0xdbcebbe7454507d5
	.xword	0x7cc803a597ab7b0e
	.xword	0x4e0a2710768875e4
	.xword	0xafbb5f93b499fb7d
	.xword	0xa04503c3a86ba6ee
	.xword	0x0550753c2f4f51cf
	.xword	0xe18654d3f9b9a42d
	.xword	0x0dc2c22b1c622182
	.xword	0xf774bbd47b181fa2
	.xword	0x7505a2e6bd19e2b5
	.xword	0x9beeeb7d0079da17
	.xword	0xb04bf787f75b9075
	.xword	0xa02ccb7ac0f14b4d
	.xword	0x685ad83f54d4d47c
	.xword	0x44f485a8f4b0d326
	.xword	0xe23276b017a26c0c
	.xword	0xfcaee2a347cb5954
	.xword	0x6251c6712a64294c
	.xword	0xb31d77c176d2a772
	.xword	0x582b1e156b0358a7
	.xword	0x8dd8540e4acda199
	.xword	0x1838ac614b5ed52a
	.xword	0x6a4324a71f938a95
	.xword	0xf226594823f89ad2
	.xword	0x81e31e0cdaae07ea
	.xword	0xe21289b5c4fda0e6
	.xword	0x4c96bb6d81f43255
	.xword	0x4a3ac3d2f5d248aa
	.xword	0x5fce1fb452cba7be
	.xword	0x52c1dbc1b92f1926
	.xword	0xe7d17d335d5d44a8
	.xword	0xaad7fe462f6711df
	.xword	0xca9021c2b2f95739
	.xword	0x33ef0ce835def999
	.xword	0x998880b670ee7c25
	.xword	0xf0969aa46c4ed5d9
	.xword	0x0d3115b03bfa176c
	.xword	0x425e49b00a1082fd
	.xword	0x8b7175eef65458a6
	.xword	0xb22e3e90a278ec82
	.xword	0xe74b7a0a885568c8
	.xword	0xd286edbf04b7426a
	.xword	0x0a1a872e1f281e7b
	.xword	0xafbad44b2941a5b0
	.xword	0x44fe8605e0398b80
	.xword	0x4374e6728fea06c2
	.xword	0x9754a5288759b941
	.xword	0x6114c254ee8e244f
	.xword	0x82599741392aa6dd
	.xword	0x13d2abb7c4d6cab9
	.xword	0x1245d4ef858482da
	.xword	0xdc108cccb960569a
	.xword	0xc3fa62e62a1b378d
	.xword	0x579f97f528a76d23
	.xword	0x1fc1f3652e73aa5c
	.xword	0x71be22d3ef5e2dca
	.xword	0x79e6020f655ec7d9
	.xword	0xa24d00a6d1a0c559
	.xword	0x8366b90e5249c85d
	.xword	0x5c833c4e38dc366f
	.xword	0x4f91372cf787ea17
	.xword	0xee3984f4202f445f
	.xword	0x892529c42df89d14
	.xword	0x19dcdae7db2f79bf
	.xword	0xd15bb9777e104eaa
	.xword	0x20ec67aabaebbeaa
	.xword	0xf24b3a1f0c148716
	.xword	0x2cc6db6d13b2623b
	.xword	0x65779cf19383ec6b



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
	.xword	0x3c577043a39d2f29
	.xword	0x501ff94dfe4d12d5
	.xword	0x11bc0448966c47fe
	.xword	0xfe883194c6373679
	.xword	0x9910fd4417818e3a
	.xword	0x1db5b573f42fa653
	.xword	0x3b298476b9207d9b
	.xword	0xef244b8467e0b20f
	.xword	0x724582740caa7d5d
	.xword	0x092bab4cdefab73d
	.xword	0xbe8ae3d1095a06c4
	.xword	0x709c9a67dfdf4de6
	.xword	0x04da1b48be5cadec
	.xword	0xbaf1255f77b1427b
	.xword	0x4d0118b1f4d59a74
	.xword	0x9788b146397e0da4
	.xword	0x2d60d0997286f559
	.xword	0xeea7f7147a8f61d0
	.xword	0x233f335171ad9154
	.xword	0x62ee6c524191bc35
	.xword	0x76c89339d17c03af
	.xword	0x7f837791db83ffda
	.xword	0x8c9a17e403dbbbda
	.xword	0x972e1f2c68059d51
	.xword	0xf0815f6016a83b62
	.xword	0xedc3a3772bf52867
	.xword	0x1be8d7c83a84eaf0
	.xword	0xd5481429adac7e64
	.xword	0xb74889e9c0fb0fae
	.xword	0x8292ea144270b405
	.xword	0xcb1681d057e34005
	.xword	0x8cbd41775c66378a
	.xword	0x9b6745f8e96bf569
	.xword	0x268f1365b069bf41
	.xword	0x5029c964c1a43a18
	.xword	0x0ba4616a93b2f9f2
	.xword	0xc53df5977d88a459
	.xword	0x7b2f7da91bba3088
	.xword	0xf6fcd5d106b0613f
	.xword	0x78f4cba88448c908
	.xword	0x2b50c8321cf71fa3
	.xword	0xd99e243dfcf0e975
	.xword	0x3fb61c837ab63c78
	.xword	0xfd9968333c153122
	.xword	0x8705c8c55b7eeead
	.xword	0x7a1d40e3cde7307a
	.xword	0xf1aaf06e035a11e8
	.xword	0xb599967ea95dc9cc
	.xword	0xc8127699895c10ff
	.xword	0x2c684621e98c70b2
	.xword	0xbfa17e2d9e6f33e0
	.xword	0x0003e69dc5729366
	.xword	0x307fc9c335d80f2a
	.xword	0x9691532c1999c4de
	.xword	0xd4a3e640996a55b0
	.xword	0xcbd892f367249ca5
	.xword	0x196873980bfa1af7
	.xword	0x27dd063d0eede6ef
	.xword	0xb8c97f9a5c1755cb
	.xword	0xf7451bf48574a6e8
	.xword	0xaee46185387e32a3
	.xword	0x86553b89767dbbc7
	.xword	0xc5b082150d0e7c36
	.xword	0xad431f448df68542
	.xword	0x6302a420bd6bcc31
	.xword	0xb972ab9806ff886b
	.xword	0xd9af0d59626f38d8
	.xword	0xe29298f5da9f5668
	.xword	0x7c2438514338d80e
	.xword	0xec8e812dceb9a413
	.xword	0x27cec08b5413fcaa
	.xword	0xcc2d625355aa90c6
	.xword	0x9c5a1c9eb6efeef2
	.xword	0xf6f706cdf840c33f
	.xword	0x64d3136af0564ec1
	.xword	0x9a5dee49ec7c817d
	.xword	0xc8ad52c76c14a080
	.xword	0xc57228269c4cd6c4
	.xword	0x70caed27bb6e7fd5
	.xword	0x24c5f5e61350cc1c
	.xword	0xeb32518285663238
	.xword	0x68f8ee89812fd5ef
	.xword	0xecd62391a0caa7ef
	.xword	0xf9d3c681e801d7a7
	.xword	0x17fec3c997d0b2ad
	.xword	0x27aa6ceb2f9eeba0
	.xword	0x45849485b6b2ef8a
	.xword	0xc9349cbcc85619bb
	.xword	0x6e251288f01f994b
	.xword	0xf90cb5dcdf9b1a86
	.xword	0x8cb40ff3277deef8
	.xword	0x8a14c79c4987b0e6
	.xword	0xcce7e77e0cfeb8e2
	.xword	0x5ae849919585ce8d
	.xword	0x5217e812e6393890
	.xword	0x0b9d7f36f42f5ad4
	.xword	0xb34ff6a1e8bc53f0
	.xword	0xfbc74e4b018aea56
	.xword	0xf2abd5e4959fa688
	.xword	0xd2b67f9b3f514f4c
	.xword	0x0647a4c998fba421
	.xword	0x528ab0cd4c2bfacc
	.xword	0xd04271920b39bdde
	.xword	0xf15e0efcee1f03d2
	.xword	0x19b495b1326ade45
	.xword	0xba901f43c610ce81
	.xword	0x14f22785ab399294
	.xword	0x8ac3387fac6df802
	.xword	0x12bfc7445ece48ca
	.xword	0x4cc2b7519040d706
	.xword	0xb7ec6dfec43b406e
	.xword	0xca6aa21a1832eb37
	.xword	0x27680aa319427c39
	.xword	0x7fca724104b1369a
	.xword	0x567ed8f6c94505a1
	.xword	0xbcad39fa07051977
	.xword	0xfacfe3a49a93e98e
	.xword	0x61685e4aa5f3f14b
	.xword	0xd56fdfaeb7f68c15
	.xword	0x05ec3ab53190d4c4
	.xword	0xfa36ceb98e48bc4f
	.xword	0x752ae7c010e17063
	.xword	0x41d4324bafa32631
	.xword	0x056bf25c4cfaa5fe
	.xword	0x6590065dca8edcdc
	.xword	0xb96fe284da9eb5a3
	.xword	0x1e55df30860b7608
	.xword	0x2402e52c6dffc431
	.xword	0x9717962c36464538
	.xword	0x435257c43dff3685
	.xword	0x1dc532db7ff8e7fd
	.xword	0xd4fc7f91e6728fde
	.xword	0x9b58d791b7240996
	.xword	0x8f31c6cf17940dc1
	.xword	0x35dec3243c9c4f98
	.xword	0x45a1926da2537054
	.xword	0xd4799da0766c3a2b
	.xword	0xacffcfd2919ca705
	.xword	0x28cbdec659060131
	.xword	0xc1c83ead2d570f53
	.xword	0x7f8ce2123aa210d5
	.xword	0xbd4f1f76602bf9bf
	.xword	0x7f18f2dcd96035df
	.xword	0x50faab1fd4b06f04
	.xword	0xc32801513776096c
	.xword	0x7e72758a37b1c0e7
	.xword	0x991697812da41225
	.xword	0x629116a7bd475a12
	.xword	0xb7e0c111711f2f98
	.xword	0x8c16605b1c1ae81f
	.xword	0x2c9a8702adeb0360
	.xword	0x601626686ae44bd6
	.xword	0x0381fc48fd3f4844
	.xword	0xdac41fbc4dc322e1
	.xword	0xce443de933f03d71
	.xword	0x91db42d685b165a5
	.xword	0x2923b1de2b7fbea3
	.xword	0x91a418dcc20ef05a
	.xword	0x8312a0732fd617a8
	.xword	0xb6c72675a4b5728c
	.xword	0xd74128edb37a5deb
	.xword	0xfc9d9435fda3e8a7
	.xword	0x42733acbf4df547e
	.xword	0x1366591fadd99ead
	.xword	0x2d560a14739a52d9
	.xword	0x411f77344857f685
	.xword	0x2f11ae1d2af81752
	.xword	0xa3f251a3352c1e74
	.xword	0x6bd6737a9e75b175
	.xword	0x9d89a8eee92b1a58
	.xword	0x6623c78c68094c9b
	.xword	0x39f620cd7fdf14a4
	.xword	0xa3bbcd7d7d5e9690
	.xword	0x86c3febd704a8762
	.xword	0x7791d0f7d084a346
	.xword	0xd113af52cd74f585
	.xword	0x21217df2e3563554
	.xword	0x995ff323949c14bd
	.xword	0xac4c9ddcdb976fb7
	.xword	0x675411a0d4c80c68
	.xword	0x322d5fb386a02e04
	.xword	0x6dd91eb787c72abc
	.xword	0x0e2f229a32e1e2be
	.xword	0x2023995425b4a1c0
	.xword	0x10b787c40c50036c
	.xword	0x5e79cd8d9f622aef
	.xword	0x9021b9eb94227290
	.xword	0xa80bbb3511088f63
	.xword	0xaef7a9f4e6f6b2fb
	.xword	0xf3d3fc471eae756e
	.xword	0xea535dc72d833ab2
	.xword	0x58e290ddb7121be1
	.xword	0xb189284d2e3e7a78
	.xword	0x6e337e69b0c955fe
	.xword	0xef8a2b619c948733
	.xword	0x99485dd579c6ea32
	.xword	0xb2dca60da1c48aec
	.xword	0xdfa014966d6ffcf4
	.xword	0x166b175fe007bfef
	.xword	0x64e10d242a0d0d1e
	.xword	0xc2cfaae3ed4faa41
	.xword	0xa0f049fec1b18216
	.xword	0xa8667a70eb8a4a2f
	.xword	0x797c659c692e86fe
	.xword	0xfd493ab6aabe49b0
	.xword	0xba541408e63fd857
	.xword	0xefdd24ff09b3b50f
	.xword	0xb2472d9a1dc2fc88
	.xword	0xd4f925d49eacbcc4
	.xword	0x194b0ee9f3d39c2e
	.xword	0xd9cfc613187db24d
	.xword	0x7c806d26aa9a6417
	.xword	0x00cf17078aef8e75
	.xword	0xddd3ed8e1443cd58
	.xword	0xccecbc09767d9873
	.xword	0x5c9c3ef3522f2304
	.xword	0x6655ea33629bd6af
	.xword	0x2d0ac4215d08c49e
	.xword	0x22ae392f0abb2cce
	.xword	0xcfd35e3b754622c1
	.xword	0xa879c9e6eb81c9a4
	.xword	0xdcc3b865b7429494
	.xword	0x87a03f8f2cb69b8e
	.xword	0xbc1ba83adff87ffc
	.xword	0x205b6ebb17c537d5
	.xword	0x535b4805a9e4c628
	.xword	0x52af3512adbdf141
	.xword	0x0e47930dddc96233
	.xword	0x0f33c0e2d418a433
	.xword	0xe15530e35f4e23ad
	.xword	0x7d49b3c6416b23e5
	.xword	0x41e107c2b740d180
	.xword	0xe13e8e4deffd30a9
	.xword	0x98fb30b41a95ca76
	.xword	0xa9cd2a22c15ff7b9
	.xword	0x994fe21d61facda7
	.xword	0x6d0fb6caf77a0e4f
	.xword	0xe4a4ef07af2b8525
	.xword	0xbe023553b2b822c1
	.xword	0x2a3c866b24938f1f
	.xword	0x1e78de7276f1dfa7
	.xword	0x322e7f139e417524
	.xword	0x6f954e6ecd9291b8
	.xword	0x0927c5ae332ab43f
	.xword	0xc16edfd77e2f954c
	.xword	0x5e359157cecf9306
	.xword	0x708a2dfb3c06521d
	.xword	0x9dbfe4ef89794f8a
	.xword	0x8d73b069dfd44c93
	.xword	0x34cac59d170e0bbc
	.xword	0x7ad37b0dbf3bc37b
	.xword	0x8e479f50bc418e91
	.xword	0x6b6c6395ff75e9ee
	.xword	0xd25f011dff802e6f
	.xword	0x96601153d7909c56
	.xword	0x7323507af9bb05c8



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
	.xword	0x5bf82bdb7b55f98a
	.xword	0x36371e4d766ca1f6
	.xword	0x1d52528a7087665a
	.xword	0x4bb1e87963a592c6
	.xword	0x907e4154e3bd1a40
	.xword	0x0cde8d18a809268e
	.xword	0xa92249fad918bcab
	.xword	0x976d9fadaff0c5b9
	.xword	0x80357989a99cb348
	.xword	0xe752c153aba7f823
	.xword	0x835797229c5c4980
	.xword	0x164a031af54b72fe
	.xword	0xea9f2761f5f02c6a
	.xword	0x07a877d1943aa6ad
	.xword	0x04609ec12d1e8e5e
	.xword	0x8ccc4e99500a2c64
	.xword	0x698b0063a1ab7721
	.xword	0x8580e3d0f433b3d7
	.xword	0x93964ec9e4872252
	.xword	0xe0cc07134bf0cc87
	.xword	0x2f3603cf129638ca
	.xword	0x4a6772a19c313d9a
	.xword	0x0b6fe6c7f21d0f01
	.xword	0x55d1173e4f2b844e
	.xword	0xafd4bc03d8ea5f10
	.xword	0xc6da9f9a282c8986
	.xword	0xec8e3389be2fc97d
	.xword	0x75446ae9eb5c0a2b
	.xword	0x5960980217dfc897
	.xword	0xafe2724f233f84ee
	.xword	0x009b11d6cea37a0a
	.xword	0xed3d46ed1f78685d
	.xword	0xd039c6e69d79ed0d
	.xword	0x12fab4f6cd9d242f
	.xword	0x925843afbe0e97c5
	.xword	0x8c2131aa652f960e
	.xword	0x8c706eb0b2bff975
	.xword	0xd9cac69f779de556
	.xword	0x55bc5573cefb7daa
	.xword	0x470ab35bb739f981
	.xword	0xf5a5853de99ee49d
	.xword	0x0e090c60058ae455
	.xword	0x00caa1ce0cdb2346
	.xword	0x733c6d446b1a8b46
	.xword	0x711ad0845a410146
	.xword	0xde29bbb2b815837a
	.xword	0x5b62550a9cf620f4
	.xword	0x86c3904a5d2e9e99
	.xword	0xdaa8ed436e6ba67b
	.xword	0x89547270fc45c731
	.xword	0xcc78efb93004c2c1
	.xword	0x4f843c9a5b1976b6
	.xword	0x1287b23d8e012194
	.xword	0x2c281757134c929f
	.xword	0xb5515c4b88b3b0fe
	.xword	0x039915a7e2f451be
	.xword	0x10fc23bc456a754a
	.xword	0xfe7b7050146212ea
	.xword	0x7765cbf58e190aea
	.xword	0xe24912d1bcc80970
	.xword	0x56d76f553dbb82db
	.xword	0xba87231bc2f0fc50
	.xword	0xa2f7aab2f884ffab
	.xword	0x6fc3376581cfb998
	.xword	0x7107dd2424f2a8fd
	.xword	0x9b814f4507ebaaae
	.xword	0xcab63fe88814e124
	.xword	0x388383405043d04d
	.xword	0x7e3cd6d10df11875
	.xword	0x4594a377f0c10a3c
	.xword	0xfc9b660e9e046d2b
	.xword	0xd84581b754c00042
	.xword	0xaf4c4c9c28733a80
	.xword	0x673f1c4847f03dee
	.xword	0x1dd5b4fd4bd2d953
	.xword	0xdd4c5c82e2a894e9
	.xword	0xfd67008e3e6f584c
	.xword	0x48623b4893891a2a
	.xword	0x8532248da121784f
	.xword	0x5a90b611168f1e1f
	.xword	0xa3dbd9c8df6b12ce
	.xword	0x4cc3275f0b5d521b
	.xword	0xbbbc253fba75caf5
	.xword	0x7648cb26857cf5d6
	.xword	0xbc7325e21f283f96
	.xword	0x1449f6197ce656e8
	.xword	0x6d44e508ab3739e7
	.xword	0xfbae095506b5e9ad
	.xword	0xbf26dc2c9a4d790a
	.xword	0x4ae81499a3220f9c
	.xword	0xcbb76a0d2fa46610
	.xword	0x775721f68351868d
	.xword	0x6a3575dbcacac292
	.xword	0x162fc5fe7c8cc8b0
	.xword	0x92995f83059cd0e3
	.xword	0xbb22f6c10caf4894
	.xword	0xe6a1245082a6a5e4
	.xword	0xa871ccd654ecd929
	.xword	0xe57cda1eb01eef24
	.xword	0xb908618fd121a8b8
	.xword	0x58be191a71657a63
	.xword	0xba2c5ec7e9e2a23d
	.xword	0x92dd4640d3c93c35
	.xword	0x8f276c910ddddbd8
	.xword	0xc8c29267fbbb75c0
	.xword	0xac321ade0cd2088b
	.xword	0x10c7aedead4e5d3c
	.xword	0x99079cf7dd97ba2f
	.xword	0x64c224c4dec78776
	.xword	0x5b99e98f94aa3ba7
	.xword	0xe70ce9ccb4ff4889
	.xword	0x74847313ba37620a
	.xword	0x15a3b7c939c7b64b
	.xword	0x306446848d5b3810
	.xword	0xe42a0f99475cf728
	.xword	0x880b69a3a53c4124
	.xword	0x236dc50a1124a7d1
	.xword	0xa3acc618aaff38eb
	.xword	0xf1d67f404d4b8b5a
	.xword	0x7f6db2a939807765
	.xword	0xb06206788ecc65b9
	.xword	0x880483307209fdfb
	.xword	0xf5efc15b026879e8
	.xword	0x00515ac0b2f135e3
	.xword	0x2c40e713108a67df
	.xword	0xc868250a474e8398
	.xword	0x0f3cba3cedffd9c9
	.xword	0x3bddd9c5fb016966
	.xword	0x13183c7802487d32
	.xword	0x2e9a29705a9f28f9
	.xword	0x99ead6e9fb4aeff3
	.xword	0xf9594295806e2ade
	.xword	0x3257f361930478e7
	.xword	0xea405a83d45a4c39
	.xword	0xea3c13efddfd5ff3
	.xword	0x9a6f93333c15795b
	.xword	0x3e69cb7017c38ec0
	.xword	0x7ab6b5e39fc269b7
	.xword	0x2b22756a00757b66
	.xword	0xaf6cae606c0478a4
	.xword	0x3a2968556574f109
	.xword	0xe96789a7f7c5e1df
	.xword	0x0a80352934b95857
	.xword	0x98bd217bd0a3db24
	.xword	0x233eb4fe6fa9906f
	.xword	0x337d62dc33d47cc0
	.xword	0x82f1b88f7f740eb2
	.xword	0x123fe76008c79c64
	.xword	0xec30b93c816c706a
	.xword	0x777909ba639067e1
	.xword	0x5f064dd725bad773
	.xword	0x96b3e0706c0d7221
	.xword	0x4f6b702c7713de11
	.xword	0x2fc5719a164c2f77
	.xword	0x9de75272b05198db
	.xword	0xcc00659a6bf33eee
	.xword	0xd5aea7fced109258
	.xword	0xcc9d976a5bf6e48e
	.xword	0x0718dce1b0051a50
	.xword	0xebe2f1c314320598
	.xword	0xb1f98f0c5c0156c4
	.xword	0x489b1fafcf158088
	.xword	0x7a3b8512b1bdc39d
	.xword	0x8b03cf29b7056cf9
	.xword	0x9a6971504167c7fb
	.xword	0xdc03a69bb3728bb0
	.xword	0xd7c929fd94adf976
	.xword	0x75b8f1ea840014ed
	.xword	0x865587ad93186bc5
	.xword	0x47a5bf0837073694
	.xword	0x476a4bec914c0ebf
	.xword	0xe9deb24118736b2b
	.xword	0x191692eb3a89fb07
	.xword	0xef1677f9646faa11
	.xword	0xd4e43c42444bff07
	.xword	0xbb3e777a10635eea
	.xword	0xc43b371e9dc9b255
	.xword	0xd8b2dc4133966742
	.xword	0x43d10640becfc2f4
	.xword	0x0e955585b237c2d8
	.xword	0xb5f6668062a13567
	.xword	0xea9ab08c9d432fdb
	.xword	0xc2cc9daf6cd06d89
	.xword	0x63278e0e4a58201d
	.xword	0x788e9934b70324d9
	.xword	0x21bd725d778eb1de
	.xword	0xc8acbb2dcd54e73e
	.xword	0x4b62619c22672210
	.xword	0xdc37dc3da52d2437
	.xword	0x4ac5944d5d7a24c6
	.xword	0x92fcc6ad7cfa6a56
	.xword	0x5c8986abd51eed08
	.xword	0xc34cef0fd9e8f917
	.xword	0x6424ff038f417a67
	.xword	0xe97e0a267478567d
	.xword	0xdc056bfb4a2ec48d
	.xword	0x0f6cfcaad9140120
	.xword	0xc1dab5ea71e0700c
	.xword	0xe6be99caced8274e
	.xword	0x7fac0d1ae579394f
	.xword	0x7e31f3667fb55ec8
	.xword	0xf0585353309ebeb1
	.xword	0x09a51f3b37ac73a6
	.xword	0x6b83e8de8c9eab7f
	.xword	0xa50f3e9d05e23206
	.xword	0xb64089e2c09430d9
	.xword	0xfd369f91f329ec83
	.xword	0x67a4cd4606fa81e5
	.xword	0xd45bf505805b1c6e
	.xword	0xd3c0d104f6baaa3e
	.xword	0xd76b0f35b3854aed
	.xword	0xae7e9798c5f8d11b
	.xword	0xdba9de4b7bfb2dfd
	.xword	0x6980774da72fae58
	.xword	0x74cce18d3520f528
	.xword	0xff9cfbff7be2fc62
	.xword	0xf209d0a7ca56b453
	.xword	0xdabab0f2c482f70f
	.xword	0x26d874d38926b200
	.xword	0x55d7a4c490875c53
	.xword	0x33111a7116fe5174
	.xword	0x74818eee4e0596cf
	.xword	0x2969e950554d81f4
	.xword	0x7f2f016d20b64572
	.xword	0xa3d3ecc4cb54ac04
	.xword	0x29a4ef107e02dc0a
	.xword	0xe01266326bad3aff
	.xword	0xb8ac66fd9336e4a4
	.xword	0xeef42c2d78f167bd
	.xword	0x5c27567434d7f264
	.xword	0xe1f63738c3b28f8a
	.xword	0x2a8894b35e432809
	.xword	0xcc4ad603c6f3d56a
	.xword	0x460e72ff69fb4349
	.xword	0xf5d7f08b2c277084
	.xword	0x36a7f206c3ab8d42
	.xword	0x987131e3617b8a1c
	.xword	0xae61525d83590b17
	.xword	0x2431704b3377a09f
	.xword	0x2e6ff5f19c854938
	.xword	0xc5448a78aefc782f
	.xword	0x81a729b1f68e53c5
	.xword	0xf7275951e7468d17
	.xword	0x3a761845dec5e70b
	.xword	0xda320156ee9a80b5
	.xword	0x74a0ecb6c14b80ef
	.xword	0x31694c4f88d7dac3
	.xword	0x17f7f4a90a1944bf
	.xword	0x593293117b0e4e45
	.xword	0x0f0babbfeb7761b1
	.xword	0x686ebdeb55c6c603
	.xword	0x1fce60e2f9159204
	.xword	0x329aab6fd302fdd5
	.xword	0xae3791bba934c60e
	.xword	0x097235d371cb555c
	.xword	0xec40c25a6d81c984



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
	.xword	0xf1240b98533ac9ed
	.xword	0xbfa7bf992d6b4a97
	.xword	0x6b6b3365a343eccb
	.xword	0x1fff076eec915f6b
	.xword	0xfb25e8478d97215e
	.xword	0x44ffccdcceeb7f34
	.xword	0xe0251c3716c9c456
	.xword	0xe075e8ceabacd500
	.xword	0x0472c20d2d1b4a1a
	.xword	0x83a8d14f71156a3b
	.xword	0x379512aea2aa6109
	.xword	0x6bcf3540cfac7cc3
	.xword	0xfbc013b489649b97
	.xword	0x5dad8c980a708595
	.xword	0x51eb535815f7a2ce
	.xword	0x33fbf80129716221
	.xword	0x27b3f2ed5ead5feb
	.xword	0x0a7a86530e9311d7
	.xword	0x4495a8fa4d978d82
	.xword	0x357e30b6b4fb180c
	.xword	0x84cf2c251826adbf
	.xword	0xe25e6342f2abcf98
	.xword	0x391db3c79ef096e2
	.xword	0x117696fc3cdb9c81
	.xword	0x897bf93eba5a2a88
	.xword	0xab1615a1de96b58f
	.xword	0x5585477c316052fb
	.xword	0x03e20d3f24d1c5d9
	.xword	0xf5f6f20e4aa6ceda
	.xword	0x3175fb28e4019f0c
	.xword	0x1131c63b7cbdb9e2
	.xword	0x3f4947ca9bc47a3d
	.xword	0x957c1edecb6ee57c
	.xword	0xcc75e2dbfa42d71d
	.xword	0x3563827634578046
	.xword	0xcb3cefff2b6b5784
	.xword	0x62822d905bc8cc70
	.xword	0x519d20d674ca968f
	.xword	0x36a9af618d56883e
	.xword	0x7cf2bc88831bd9f3
	.xword	0xcee07a5cc07de21e
	.xword	0x1cedaa6d1195b8c4
	.xword	0xf28f0d46c4babf6d
	.xword	0x6c2f2e0dc6c5f59d
	.xword	0xde1a424f822cc4ac
	.xword	0x5bab3bd65f0b9cd6
	.xword	0xc86a20a89b84d013
	.xword	0x220b4435be825f40
	.xword	0xcd9b748a5c7b1899
	.xword	0x663ae3e11571ab78
	.xword	0x23395faee894c8b9
	.xword	0x2bf29d22311e65e4
	.xword	0xa9c2175c3b625b0d
	.xword	0xf0100fc923ff14f4
	.xword	0xfe9c56e7c912675d
	.xword	0x14e13c9a29fbfdf2
	.xword	0x5da015cb7fe9cfad
	.xword	0xeca0201c9de5678e
	.xword	0x371f317b329d3e93
	.xword	0xf9c82270b92756c2
	.xword	0xfd91aaebcd22a7da
	.xword	0xd48f04393caa482d
	.xword	0x929e637289f55f6a
	.xword	0xc031cb73d90b9816
	.xword	0x81e897b0630bd01a
	.xword	0x50692d29a9e2ce0e
	.xword	0x4a51a5477429ec1d
	.xword	0xc00737e27811b181
	.xword	0x388c2b0f4efc0661
	.xword	0x264713b267b4f74b
	.xword	0x19e95163de7e886d
	.xword	0x870ad28940e737ff
	.xword	0xafd7e1d7a6efa7fa
	.xword	0xc35b7cf416cd44da
	.xword	0x694ea7ebac57d57c
	.xword	0xe3882d864ad5772c
	.xword	0x7177fa9d91dc2935
	.xword	0x69831ce7d49b53b0
	.xword	0xd43345bac0e15115
	.xword	0x394a07674a285107
	.xword	0xc15bcc7bf03ff019
	.xword	0x36fe656dcea4d1aa
	.xword	0xa99cd5fccb296c2a
	.xword	0x598065e0de3abda7
	.xword	0xfbdbd3d219ebd790
	.xword	0xe75245883d9f36c8
	.xword	0x251674363bc1587a
	.xword	0xd9acf3278636b768
	.xword	0xb90d2ad7d5e98fab
	.xword	0x8308f7fd2db5ff19
	.xword	0x3e0a6ee6e6ae7c50
	.xword	0xe0a5c1881c1dbd7e
	.xword	0x6d516458bb572e8a
	.xword	0x40cc614dc9ee21ed
	.xword	0xd12f7357308e057c
	.xword	0x42d84547b8dc3058
	.xword	0x91a27e982ad312d4
	.xword	0x1140d6e47729aeee
	.xword	0xbcc376d2a0ccaf19
	.xword	0x248b629ca784d966
	.xword	0x8fed7cafe4545be0
	.xword	0xc94219231583f8f4
	.xword	0x5cd2e0c52973320e
	.xword	0x58139704191df31f
	.xword	0x2ac3c56ee6cde976
	.xword	0x2a65179c05e3c25e
	.xword	0x064b2d8202727f04
	.xword	0x6f2bcb5cf0e3e082
	.xword	0x28eb56820de414c3
	.xword	0xe5cff820daac43d3
	.xword	0x51ae00e59dec153f
	.xword	0xf584e7084b7b88cc
	.xword	0x597c5a351d4975e1
	.xword	0x76696d7128d23b07
	.xword	0x82603a42177deb39
	.xword	0xa81512c73fcd7afd
	.xword	0x0701b2fb6f68f997
	.xword	0x304ed4e40461c89c
	.xword	0x8034463f6e1f8134
	.xword	0x280d49971d342403
	.xword	0x6e29d2a505d53cb5
	.xword	0x85e8bae37da3334d
	.xword	0x33d1cb9d89ad09db
	.xword	0x9bd8d638baa7823f
	.xword	0x631025b884bd499f
	.xword	0xa6d05e5d4cc81bb4
	.xword	0x7cbecd2fc2b44d79
	.xword	0x19ff2966dcad529e
	.xword	0xfd469a26fdc499f0
	.xword	0x477eeb74271aa4f4
	.xword	0x9f9342dac643f1f4
	.xword	0x7c0d09f7227dba50
	.xword	0xf9d77362d796a261
	.xword	0x5156636166c153da
	.xword	0x66fbcdf850a46a5f
	.xword	0x411ab0efe151c2c0
	.xword	0x7ce0689c7e10ba72
	.xword	0x0d7c3c8fa665e2a3
	.xword	0x9047ae09326ebaf4
	.xword	0x40f17c4c40240e3b
	.xword	0x388a254cc6ae4349
	.xword	0x9ba5aade60161d94
	.xword	0x45c705b0f9e7192a
	.xword	0xa019e6acc9c81985
	.xword	0x7e6abc16ca1215ac
	.xword	0x0ee17f6796e8e6b5
	.xword	0x49e1716ca8339871
	.xword	0x5294de4ecabfd852
	.xword	0xb4bc2c9fa47e9ccb
	.xword	0x86fcbe39f20c7223
	.xword	0xc7709e87500e555a
	.xword	0x63054de953cebce5
	.xword	0x86ceb25c77747f40
	.xword	0x5a1a9680dbeb9f9f
	.xword	0x38a9d99573983672
	.xword	0x5744cac0d04d4ed5
	.xword	0xd4baf024c902068c
	.xword	0x6995fa1cec265b9f
	.xword	0xbed7c77d3eb6b2d0
	.xword	0xda3dc45b101b14f3
	.xword	0x6956ac96cfd50e71
	.xword	0x98667bfeab9db0e9
	.xword	0x0838c4d1ea90f34b
	.xword	0x43322760d4b074e8
	.xword	0xd23ddcc69357dce2
	.xword	0x63218c71dfaa4ff1
	.xword	0x37edc91bdabddc1b
	.xword	0x233a5d089e228c98
	.xword	0x8c2c438512ed7b67
	.xword	0x83447d078e43fa98
	.xword	0xe03a29cbb806d2d5
	.xword	0xb24bb639af1e7fdd
	.xword	0xedf26528a571490c
	.xword	0x893cfd0ad9a6cdbd
	.xword	0x5f1106f305b537b8
	.xword	0xf0feb3866851873e
	.xword	0xb6ef0d65934e64c5
	.xword	0x12f182df48fac627
	.xword	0x69f3847755d66d2d
	.xword	0x0492d8b4f6795f19
	.xword	0xe2b769f7fa00b32b
	.xword	0x158709a90f0a6f0a
	.xword	0xd14ec6b87c1ff264
	.xword	0xc2dffe266f3f70a2
	.xword	0x752d9c5361d2edcf
	.xword	0xd9b8c0896bbf786b
	.xword	0x5b0986cb26cf5dcb
	.xword	0xa1c319a9278c6cb5
	.xword	0x200262236549f36b
	.xword	0x7ac271f46d539f38
	.xword	0x6165a6ed8e353ff9
	.xword	0x92f269c1619f2994
	.xword	0xc514e6dce60f576c
	.xword	0x05581df6bb540a80
	.xword	0x412601e9681cbd55
	.xword	0x07121c26bcc50200
	.xword	0x9a7813711db5b2c9
	.xword	0x400238290c0e4f93
	.xword	0xc79dbec81bc45583
	.xword	0x48236eca52685464
	.xword	0x9b5f0a352999747c
	.xword	0x030ea55404a28113
	.xword	0xf72167f827730140
	.xword	0xccbeae15d3e0c6a2
	.xword	0xb6454beb003663a6
	.xword	0x3a160bc9248ac32b
	.xword	0x5ac77a7dd22deee5
	.xword	0x90b9d8acb51486d3
	.xword	0xfcb64c4270dadc4c
	.xword	0x4bcd1b648d144578
	.xword	0x3cff02678b30e9d2
	.xword	0x7a95136a855e4272
	.xword	0x93b6a7568ce9caaa
	.xword	0x26edeb7d09d6a2a6
	.xword	0x5c864456a52ff155
	.xword	0xf0478cc0349db818
	.xword	0x59e1300bf7195fed
	.xword	0x816caae7ea511eef
	.xword	0x654d57f67f2563d8
	.xword	0x7815957daa7a1941
	.xword	0xd0aef07da6cdb0fa
	.xword	0xed44a2d1e0626059
	.xword	0x3e47850e78cfad56
	.xword	0x99d2fe5884159fba
	.xword	0x4148047b38afa4f3
	.xword	0x4114e9bfa05e7aaf
	.xword	0x63bb6fad2265b01c
	.xword	0x0ede519301ce87e5
	.xword	0xbf31fa730c77cb2d
	.xword	0xb50fba22e950caa4
	.xword	0xe66bfa46a6ec850b
	.xword	0x27da2c35946c5ffa
	.xword	0x9b1fa56646b5fda5
	.xword	0x82bbfb917aeee552
	.xword	0xce4808b1d4154f64
	.xword	0xef91109e670502fa
	.xword	0x430463cb9f40ab8e
	.xword	0xb09eb4753a705270
	.xword	0x96f3d373024f478c
	.xword	0xcc1b654312291d09
	.xword	0x5f0d521ed3971f59
	.xword	0x6dda36ae80de7451
	.xword	0xc6d380ca19e008d7
	.xword	0xa31926d771a258fd
	.xword	0xab36180d4e0cbf73
	.xword	0xa44d1d345600fe42
	.xword	0x94e19058923787ec
	.xword	0x335474f229209bc0
	.xword	0x70cf17ebbd378533
	.xword	0xb2f67e0f8b864c47
	.xword	0xc3738d861141c09b
	.xword	0x65a830e1d1bb248c
	.xword	0xab778e518dac35ae
	.xword	0xa9c45e3a6c338b39
	.xword	0x28e0d2e19f2249cf
	.xword	0x724bb02be5e84552



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
	.xword	0x6218a9e2c695013c
	.xword	0x9c947826d589c062
	.xword	0x2b673e55b083c5a8
	.xword	0x692a226315928528
	.xword	0xf8063eb1d4397313
	.xword	0x1fa8c3a65f9b5996
	.xword	0x24074a30d80d2596
	.xword	0x78d14571a5e159d4
	.xword	0x9c891d62c3c72138
	.xword	0x99161075434c87fb
	.xword	0x34637e6d4771b828
	.xword	0x350f2d683d460f9a
	.xword	0x034c39069448e0c2
	.xword	0xae2f0ca8f3aeb45f
	.xword	0xd0924bbd7b1c7c55
	.xword	0xa6a491d91ff1b838
	.xword	0x7e8ee97ffa428b25
	.xword	0xa3c192259101d237
	.xword	0x619775af6ff6f410
	.xword	0x1d98ff3737297c26
	.xword	0xf6acde508bf36de0
	.xword	0xa9425b363f5fa0c5
	.xword	0xd74b67e94762f9c7
	.xword	0x69d7c1bbdcee05bc
	.xword	0x6ad3c7dc9904eda7
	.xword	0xb233ae17e467a4b9
	.xword	0x72102a451b6b2e85
	.xword	0xb72e2b36f8e8aae8
	.xword	0x2261c20a0d885590
	.xword	0x48d47711df02313b
	.xword	0xff7d888464b321a6
	.xword	0x657b9b44fd8fe587
	.xword	0x6f909125a5b9336f
	.xword	0x6c5f274b1ca04abd
	.xword	0xd1ddb68da6e4584a
	.xword	0x53a9bb393d31aba0
	.xword	0xcc5aabd2d820a941
	.xword	0x3039474188d8d9c3
	.xword	0x0dad8189de570a6f
	.xword	0x2f336e733d32fb35
	.xword	0xb72e1488bcd9d6f1
	.xword	0x39e8ee768b409a4f
	.xword	0x072335d67d84d2cb
	.xword	0x134c90bd1299feb3
	.xword	0x755a9b1e9fe3fe8a
	.xword	0xb3d366840f252f79
	.xword	0x6d5225f3aec29222
	.xword	0xcad4ce0dcc528072
	.xword	0x3e1c494233d6616d
	.xword	0x547c566dd27632d0
	.xword	0xa18b90dd3293b06b
	.xword	0x553ae34374f9eaf6
	.xword	0x5ae12ed6585714ac
	.xword	0x5d41028b976bce8a
	.xword	0xd3209795e6bf8abd
	.xword	0x0ae000085d982a2b
	.xword	0x5e3c98d1da4f862b
	.xword	0x8c4d418d39d76753
	.xword	0x50650d16656985cb
	.xword	0xeef62b84d05ac5dc
	.xword	0xf20ea1cc91633a16
	.xword	0xd21cb078bb1fe8dd
	.xword	0x5ff18fbc6bdbef27
	.xword	0xaa976d55fd14daf5
	.xword	0xd4fca365c72ea5b4
	.xword	0xdde68d9cdea4294d
	.xword	0xe53baf7a11f03ee6
	.xword	0x9004101e15085a3b
	.xword	0xe93da306e4397b86
	.xword	0x186bfead35b5770c
	.xword	0x2a141e2e413e62e6
	.xword	0x629bbc5d3abedf42
	.xword	0x3f3782960974247c
	.xword	0xd5a27180607f7926
	.xword	0x3e012085a60286ed
	.xword	0xec76680c2100bc48
	.xword	0x4a330e3aaf6de98d
	.xword	0xa3ac499efb4b9ac8
	.xword	0x48aa9d50bf738562
	.xword	0xb1a252ee7dc0c655
	.xword	0x910d6affe17ae966
	.xword	0x669991c5159a73dc
	.xword	0x564b97a519f4a3dd
	.xword	0x72a0eebf49c60119
	.xword	0x0945d87e1f0e63c8
	.xword	0x1f1f31022b4b3b1b
	.xword	0x31293183a9406bdb
	.xword	0x2e99be304671df6d
	.xword	0x7674a569928828e1
	.xword	0x40d24061f18d8042
	.xword	0x2a91bc0cd0f63a47
	.xword	0x7161e85ea6c0c72f
	.xword	0xab9c2e163ff0af05
	.xword	0xe5cfd73a6378618c
	.xword	0x8a10d4fe6524f9e3
	.xword	0x55404cde46476ca2
	.xword	0xa3a8479de7f36357
	.xword	0x02b75d34b5a8583e
	.xword	0xa99bcb8ad34a92ba
	.xword	0x1166b08ffc71cf17
	.xword	0x49a355745d271264
	.xword	0x21cf4fe287537bdb
	.xword	0xe1920b5cbef0eef8
	.xword	0x05328be285022b4b
	.xword	0x004c5b1d3a6696dd
	.xword	0x84c1b5bc9353a55e
	.xword	0xafb99a0821ced3b5
	.xword	0xf0cf495a22b947c6
	.xword	0xee9e9f8e653288e8
	.xword	0x2fdf786ead0569a1
	.xword	0x5315b1a3742c6bb3
	.xword	0xb2c7073c8a98e769
	.xword	0xd576d98d8312df33
	.xword	0xad988d0d86e66570
	.xword	0x5f183f4329d1a705
	.xword	0xb33556fcf668770c
	.xword	0xe1f7fcd49ef987e7
	.xword	0x808895668ea78dcc
	.xword	0x07d788619b008dee
	.xword	0xb7b61235e153619f
	.xword	0x6e3fae554c7227aa
	.xword	0x447a4f2e326beb58
	.xword	0x9a2b0bdb60352a02
	.xword	0x9d184c8df422150c
	.xword	0x097fe6fb3e40a9e1
	.xword	0x844ad676a4c6dfae
	.xword	0xea46f83b7afb542c
	.xword	0x593582aa86573160
	.xword	0x34048cacabce771d
	.xword	0xa09c3165f8b9a925
	.xword	0xc893dfe0c52125bc
	.xword	0x6a66c34151ec1398
	.xword	0x87ffced038d4d79a
	.xword	0x2d0004e6c940b0b4
	.xword	0x1387063a6e3f063d
	.xword	0xbb37277d2fe535fc
	.xword	0x23a6edb4ca1633fd
	.xword	0xb48c5a390badfdcb
	.xword	0x1bc32e34664274a8
	.xword	0xfd0896bb5b71c0f7
	.xword	0x9a813259b33cb4a9
	.xword	0x7c0a353c5d7c94ba
	.xword	0x3be8bfe1ad217be7
	.xword	0xfab580c8b1fe32ed
	.xword	0x1a27384dc9ea6bdb
	.xword	0x4c51835df4411901
	.xword	0x32f6e7b0f7d7cabb
	.xword	0x6518bdb2cfe8317d
	.xword	0x085fc211a7be03e3
	.xword	0x5cdb1e352fe47eb8
	.xword	0x445c99d04d0ad6b2
	.xword	0xf6dc43dd1a7ba3fc
	.xword	0x6e5819e0d9def659
	.xword	0x5b64aaf46675fbf9
	.xword	0x2f68a950d2a03ed1
	.xword	0xfa1391990b9be01d
	.xword	0x9870f12442fc4045
	.xword	0xeaadb2fb31939534
	.xword	0x1400c279589cff0a
	.xword	0x499dbeb17852ea52
	.xword	0xe2d98e7ace7e7e90
	.xword	0x8bb733e1ddaa45ed
	.xword	0x87e044f226ccbfa8
	.xword	0xc2693d9d1f2ad995
	.xword	0xf7001922cb768236
	.xword	0x27bc393d0d703cb4
	.xword	0x0316ee45dfdd3d16
	.xword	0x44cbd9fd136e21aa
	.xword	0x2e7e66ca12f57bda
	.xword	0x8f31057c934ffd99
	.xword	0xf42035db225229f8
	.xword	0x0265f2ba73889dc2
	.xword	0x64a257c4dfbc2a3f
	.xword	0x9aa5de74bd8c9808
	.xword	0xeb0d76101bef23be
	.xword	0x16d6953d0b59ccae
	.xword	0x2edae58aa20b644b
	.xword	0x9724b124b9f0c4e0
	.xword	0x39c86cc055a6b457
	.xword	0x2ce8cc72a9d5d213
	.xword	0x316904c800634f9c
	.xword	0x76791ae8af13581b
	.xword	0x7b0d8c6bd3e4450a
	.xword	0xba061baa676c25de
	.xword	0xcdbbc681129ff3b6
	.xword	0x6eedd47ef5aced2f
	.xword	0x0757865975dd05fb
	.xword	0x112a0e6cc023f61e
	.xword	0x2568e2104873762b
	.xword	0x442954c1d9dca3ea
	.xword	0xdcb8b41b10f5c664
	.xword	0x216b190b2b198d5a
	.xword	0x4b980e59a44561aa
	.xword	0x8611840590f979d7
	.xword	0xd7c079a293438663
	.xword	0x8767a1a06b5894d6
	.xword	0xff104700e7fb7e95
	.xword	0x8f7cb4e84673b831
	.xword	0x029e2d06ff33e7a8
	.xword	0x32cb9c599169a1de
	.xword	0x4bc96a9a00d4906e
	.xword	0x924f32a9bafcc6c9
	.xword	0x16ea21b3b99f2725
	.xword	0x2e1e528961e39e20
	.xword	0xab2dcd9b8f1eab64
	.xword	0x8357f2521f02e9a4
	.xword	0x7073dd8e95b97120
	.xword	0x90d4fb5125432d7a
	.xword	0x40f44a1f07350487
	.xword	0x0b57298907a1e84d
	.xword	0x0611da39e19f9040
	.xword	0x3758df2f7dcb29b6
	.xword	0xe37b19b8b9ec90c4
	.xword	0x3be1695074371767
	.xword	0x56afa8b45c7fa0e1
	.xword	0xc9e1d06c1c27365b
	.xword	0xa3ab7bd3b63226e5
	.xword	0x179b8daed5bb2ebc
	.xword	0x0435f55c78b99293
	.xword	0xb2c12e8a798fcf32
	.xword	0x69446220ad8fd31d
	.xword	0x3fcae93c47134a9b
	.xword	0x0cc59f81b92ae451
	.xword	0x1c8cf8cda301eb24
	.xword	0x6b245136ad6e4f19
	.xword	0xd0097e53cdf5b293
	.xword	0xac03908db7d59b26
	.xword	0x8c7304826123d02e
	.xword	0x81a711ce5ad10d95
	.xword	0x5189d0f6877b4829
	.xword	0x83067480cec9ed1d
	.xword	0xf64dd9171cec5da3
	.xword	0xdb56e910d32f2a28
	.xword	0xcbfd54f90991f926
	.xword	0x9c55b220cb7fe70a
	.xword	0x791ae314bfca2318
	.xword	0x521419bb9260e378
	.xword	0x5e35dabb71d1cf39
	.xword	0xc2db2e14e7eaa9f1
	.xword	0x680854d790a2ab61
	.xword	0x0b0729c173353749
	.xword	0x1ee6b0eb7495f2d0
	.xword	0xfba02a2b5aa97878
	.xword	0x93452722db4cab75
	.xword	0xa752152946207ada
	.xword	0x1da263a8148de986
	.xword	0xaf096fda6482a386
	.xword	0x3d2e4a5e1cf805f9
	.xword	0xf48dec9023f52a43
	.xword	0x6e92eed5591bb06e
	.xword	0x2f94889d5518b3a4
	.xword	0xc7ad917436c01df9
	.xword	0x4a6554a40a8c3b6e
	.xword	0x4297c37a9e98fc79
	.xword	0xe0fae5a2e181bfa8
	.xword	0x2cfa70f9dd0ead8e



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
	.xword	0x5aceeb16e30035f8
	.xword	0x8e7ce92da6519f0e
	.xword	0x22ed2c7e06d661ee
	.xword	0xed65375b625ccc5e
	.xword	0xc53041bacd95c9ee
	.xword	0x16d732ce7a1965b6
	.xword	0xa8cdd6ba67147afa
	.xword	0x4813cf661e3158d7
	.xword	0xda7aba98a83a6c0b
	.xword	0xea1a14bd107a577c
	.xword	0x3b5837f308ec82d6
	.xword	0x1d6a90773656ba13
	.xword	0x25172fb5aeae1ff2
	.xword	0xbc439af42c355ac9
	.xword	0xb3bb0aff7509e91e
	.xword	0x17ea6bf2e4649edc
	.xword	0xf0491f8e6d05e571
	.xword	0x13a358bd3ee9ea47
	.xword	0xc682806fe31f8925
	.xword	0xe0451b7fef184b75
	.xword	0x9f011e0b8bed6d1c
	.xword	0x913a3f995d925a92
	.xword	0x02d813c37d3bccd7
	.xword	0xd0f9c83556686b8d
	.xword	0xc2ad32f1fd2fc655
	.xword	0xa638c6c5b9f74625
	.xword	0xb62cb4751a4dc136
	.xword	0xf0da7d0925f92e46
	.xword	0x208bc7488508eea0
	.xword	0xc7ddbb66ddb54c49
	.xword	0x1547089f9e1c97c6
	.xword	0x4f01d4e32c963b76
	.xword	0x32041459b48dd696
	.xword	0x57ac665ca17a9383
	.xword	0x6620384a1d4bbd2b
	.xword	0x42fe32061eab2885
	.xword	0x67f4938ee3a3eccc
	.xword	0xcd4f458ad03bd6cf
	.xword	0xdb22c2b3fd5c0733
	.xword	0x38037d05a341c8a0
	.xword	0xd48c43cf7f163759
	.xword	0x60a8822370c7668e
	.xword	0xdb9c1071fc0e7663
	.xword	0x716e83ae93e32c3d
	.xword	0x7bdb8d10f585f996
	.xword	0xcc5b1edd7de8ce56
	.xword	0xbaaa2b31fa42ce23
	.xword	0xcdf092bbf101d303
	.xword	0xb7ea6c5892f8fd71
	.xword	0xbfbadaf25727ca55
	.xword	0x4de931ebd2977c3f
	.xword	0x41758526d9e10624
	.xword	0x9270d7e02d8342cc
	.xword	0x373bfd7552a1f0b4
	.xword	0x7c23b25fdb5f785d
	.xword	0xb5235e16d474f6e3
	.xword	0xfae7725560c2ce34
	.xword	0x9ce4c9a1f9871480
	.xword	0x3663939e05e9fe3e
	.xword	0x71d0d7ead5b40d31
	.xword	0x85594d99664d8e31
	.xword	0x1e3b1587764c7f74
	.xword	0x4168e4e712595943
	.xword	0x2d9ec2dbe6d7ef0f
	.xword	0xf9e769e736334a7c
	.xword	0xcfa4ff541a1d76e6
	.xword	0x58aad20cdbad28a8
	.xword	0x0d4526ec8fad67d3
	.xword	0x64d413aefbadf097
	.xword	0x01b752c371662357
	.xword	0x662a0a252d325aaa
	.xword	0x37e2691847541fb5
	.xword	0x39ea41bdcc19f515
	.xword	0xdf9761a62bda1fa7
	.xword	0x5537b247237141cd
	.xword	0x267fef4b06567e20
	.xword	0x30da766adf8a0dce
	.xword	0xd129df81b3812606
	.xword	0xec938746ba4d3438
	.xword	0xc1394334f55e7e15
	.xword	0x2deba4eeda8f2d38
	.xword	0x27d70c38e5f77eff
	.xword	0x790aefaa2fab570b
	.xword	0x4bc0a9a977462bba
	.xword	0x68654bf74c27de10
	.xword	0xf3624ae1df491425
	.xword	0x1a95aad1ec252cca
	.xword	0x0e1374b83c2ff1b9
	.xword	0xa27af5d34483124c
	.xword	0x4b9c292069a9ed04
	.xword	0xb609868ef26164f1
	.xword	0x0165a056d3e48983
	.xword	0xb6e123d28e18f033
	.xword	0xb414c59349f97947
	.xword	0xabd19bfd0ed9786e
	.xword	0xe24a4f1d98dc9da6
	.xword	0x0f53b465d8b91994
	.xword	0x38cf25ff40d5667d
	.xword	0xc934ed436c232708
	.xword	0xa9a4abbaccbb3e83
	.xword	0x467b0283d61b51cd
	.xword	0x1461206686a9a333
	.xword	0x1fad69e6b0352593
	.xword	0xd233b534f01ebbd2
	.xword	0x83b6aa3bc75bd720
	.xword	0xdb44fd9874206b1c
	.xword	0x800b9a5a6b222ee7
	.xword	0x33e6d68f4d7825c7
	.xword	0x9966833418cc3aaf
	.xword	0x5fa1da58afda0fba
	.xword	0x28431339c7a8c705
	.xword	0x550c360d2fa4f9cc
	.xword	0xd035d4a44d86b614
	.xword	0x8726d96d5ad30a8d
	.xword	0x1ed5dc448b924e40
	.xword	0x65d6b185c6ceaeb3
	.xword	0x4579f978058b7cb4
	.xword	0x07989c4a63912c19
	.xword	0x487b7ff45958e248
	.xword	0xf155ef83fa253530
	.xword	0x626e6ff2402bb18b
	.xword	0xff02d704418ecfe7
	.xword	0xa6f9f92f7de00a4d
	.xword	0x82e47d97adfd4c7e
	.xword	0x856028d8244c1de9
	.xword	0x2808c5e917c49d6a
	.xword	0xc525270e1f349e2d
	.xword	0x9ed0e55de132238d
	.xword	0x4e1ef08a16a5a298
	.xword	0xab371901cacb896e
	.xword	0x9ad23c1160b57a42
	.xword	0x0bb37da35ce6fa67
	.xword	0xb7d1c6f96d33110f
	.xword	0xfa0495175beef2bf
	.xword	0x97138830dd23e45e
	.xword	0x02152dbe994d861e
	.xword	0xd9bd5a8c388806ad
	.xword	0xc237212f971ac184
	.xword	0x787d5d9a58a68fe8
	.xword	0xf724d7bc4117f387
	.xword	0x4791415b3ad0451f
	.xword	0xd4170f684982a172
	.xword	0x9d04ac67d2d36432
	.xword	0xa15b92ace7657b1f
	.xword	0x3248d86b7ab8a231
	.xword	0x9c8ac775877bfc91
	.xword	0xf04a721b274fa6bd
	.xword	0xfcc5d49b52a5459b
	.xword	0x29f6896acafe4d02
	.xword	0xdece3a0940797932
	.xword	0x571e075c802ca13d
	.xword	0x79fe458e593fffcf
	.xword	0xdd9e53c8c265bd4c
	.xword	0x00dd601db6f73913
	.xword	0xd0789943072ce99c
	.xword	0xdeb0229f979e26fb
	.xword	0x5cb358871157bfd5
	.xword	0xfdb92c60e146d840
	.xword	0x6b8c808607f5bb1a
	.xword	0x6ae25a5b6970ba39
	.xword	0xa8d655a02d4bd2b2
	.xword	0x006b69be62796a82
	.xword	0x6cd64d885b81dc1f
	.xword	0x16c7fea075a51d38
	.xword	0x0a7ad31fd97ae77f
	.xword	0x2b56e4e0c3adbf92
	.xword	0xe336f55d150f3554
	.xword	0x1e9f5804ffd1a9fa
	.xword	0xaf7f038076f86bc0
	.xword	0x773c08da8dad7e1b
	.xword	0x852d700a6e24e6d0
	.xword	0x58d3e94bc710fa6d
	.xword	0x8647437e269c5bb7
	.xword	0xb196523b2259580c
	.xword	0xbf38e374edfb9cf5
	.xword	0x03e818a48961c30f
	.xword	0x6198de2c6a3ba03c
	.xword	0x7755dfef16975989
	.xword	0xaf8ad9a877ed2450
	.xword	0x4ad48745f4167241
	.xword	0x256bc94de0ff1a38
	.xword	0x2566321c11df25ac
	.xword	0x2aa05ab00cc2553a
	.xword	0xd686d5e6dcaef8f3
	.xword	0x83f5d5813bc800f4
	.xword	0x61b0045247ecc13c
	.xword	0xcc41fcf6acebf8fe
	.xword	0xc5a01aafa63c9b40
	.xword	0xbdd2f26af901b6e7
	.xword	0x224eda3f19b7a8e6
	.xword	0x4440ad7aaa9c864d
	.xword	0x09789bfd3c552658
	.xword	0xa6845bab9690eb50
	.xword	0x683c3f7222bd18f1
	.xword	0x73dda43691bef315
	.xword	0xd21f5a27483230a2
	.xword	0xb7e3b3b1f1ce87ec
	.xword	0xf03b9706de80f951
	.xword	0x189fa733fd0dad21
	.xword	0x869fa99f7e8f2865
	.xword	0x7ae7e987a490beeb
	.xword	0x05958e4655a9a144
	.xword	0x07fddde179fa67cc
	.xword	0x99b9c21ea57551a8
	.xword	0x8cc758028901e900
	.xword	0x2df345c3a4d7ec7d
	.xword	0xa3d02fc01be188ab
	.xword	0xd02e55d87e076b45
	.xword	0xebab933545011545
	.xword	0x2aaf6246143bc580
	.xword	0x9b0d2e09b0fd335a
	.xword	0x7d82523223b5c506
	.xword	0xe0219c93a2c3de9d
	.xword	0x6dba5fa4c9cc90e7
	.xword	0xa036d30c750021f0
	.xword	0x6a84653dba01550e
	.xword	0xc13bf6d599c1765f
	.xword	0x23a39f3d9e44d1a2
	.xword	0x255abaf6929f5b4b
	.xword	0x22a5fcf083750c2c
	.xword	0x56dd4f567242a9a9
	.xword	0xdc1be21b050475bf
	.xword	0x417efe96693bfc45
	.xword	0x289f9de4db106303
	.xword	0x549067e89fb84e33
	.xword	0x1eea371a42fc0665
	.xword	0x24f10c57967efa69
	.xword	0x495f4730bb5fcc19
	.xword	0x97a51620cf38f812
	.xword	0x605406d959e97fff
	.xword	0x346c4e1ac1fbe903
	.xword	0x488afb435d46ec41
	.xword	0xf3da5517e0193494
	.xword	0x01330a73443d75a4
	.xword	0x543e567637548eb0
	.xword	0x605066234869a439
	.xword	0x3e5bcdc2be75dabb
	.xword	0x0646ac13b0f1f463
	.xword	0xe0b5fe49e86e1626
	.xword	0x505c9243189a7219
	.xword	0x33d35503c615b4e8
	.xword	0x41b18393b45e4a03
	.xword	0x59c5a456ba356672
	.xword	0x8cd4bc2e2f39978d
	.xword	0x0c85dca0559d055c
	.xword	0xa2cb99bec995b74e
	.xword	0xeb44e0b237637072
	.xword	0x2520960c67e81de2
	.xword	0x2573927d02af454d
	.xword	0x0aac252d4a1ed3d1
	.xword	0xfe5feeb582022ae3
	.xword	0xe58a3d7be5107795
	.xword	0x6e0737bd957ecd6d
	.xword	0xaf5175ea7e09da1d
	.xword	0x6c7120659dedcff5
	.xword	0x4469a5ffe450ab30



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
	.xword	0xf56f371de181e639
	.xword	0x6b8405113a54cc2b
	.xword	0x62ea6b65bdff5516
	.xword	0xe4b1547b25b8e481
	.xword	0x29a9b61c1b93de81
	.xword	0x2280bd28b17c175a
	.xword	0xa48b092d8d01a106
	.xword	0x54b08dd37ab44fe8
	.xword	0xae61bcf693d67a4b
	.xword	0x598af9450d02e42f
	.xword	0x19d2621f011767c4
	.xword	0x042e05338dfd481f
	.xword	0xdd8a8d5b1ce7701e
	.xword	0xfea41b0b34044ae1
	.xword	0x3618869b6a9eacac
	.xword	0xced712c585f94b47
	.xword	0xebc4175b6cab33ca
	.xword	0xd99e7076f772d360
	.xword	0x49ff333694441621
	.xword	0x7f111c2771df62ec
	.xword	0x8b80c3990248ccf9
	.xword	0xed996d6ad5c936fe
	.xword	0xc9e14da954eaca44
	.xword	0x439b4f9fdaf31c39
	.xword	0xdeb1c44570841a11
	.xword	0x21261c9c1404720e
	.xword	0x05da4e478965e250
	.xword	0x3b63770997503787
	.xword	0x77e13877feb71da2
	.xword	0xc58f5270a38771f9
	.xword	0x8cd8ef7ed47a9af8
	.xword	0xb1cd86d608ee51cd
	.xword	0xe87046982a664f2f
	.xword	0x6c64b7a198eaf79c
	.xword	0x5110498eed7a1960
	.xword	0x84fb97236b790147
	.xword	0xcb29a8710302ac4d
	.xword	0x39d83c179eebbefe
	.xword	0x5c419244b6c4323a
	.xword	0xd49bfc1d6e44f10e
	.xword	0xef3033d389046152
	.xword	0x160ce4a941fc6f53
	.xword	0xfe667527c24b3791
	.xword	0x61bd944ed0056808
	.xword	0x519688949cfd5d26
	.xword	0x5edd6db36dd3dd33
	.xword	0xe765f364da0e377b
	.xword	0x30051d661654cef7
	.xword	0xace0ab0c64f7e9ad
	.xword	0x48a4814461e190a6
	.xword	0x1a31144d9a72b3ea
	.xword	0xcdfa259e461e1102
	.xword	0x4ee8835f44cdeb27
	.xword	0x451470e68cec679d
	.xword	0x3df35cae29aaf085
	.xword	0x4a82aa83944ff878
	.xword	0xeb2adbcff7bd4c2d
	.xword	0x7da69a4ac156777c
	.xword	0xead0c51d22c8585e
	.xword	0x4f9e54d2c12da0d8
	.xword	0x5c429fadfdbda4d7
	.xword	0x38a1590695e1e632
	.xword	0xd8786c3498447f5d
	.xword	0x34919c30300f180a
	.xword	0xa57be1404de94924
	.xword	0xd342fe428066ac48
	.xword	0xfe10e7bf212d37e9
	.xword	0x3ab5d7294027d1a5
	.xword	0xdfdfaa1f7e3dc97b
	.xword	0xbc614bd9fd08b6e5
	.xword	0x6a5e45bad093574d
	.xword	0x8cb34103b0e3d123
	.xword	0xb520d46ef0661c29
	.xword	0x1cc8e92cb92576e7
	.xword	0xf567cf4ea5737aa3
	.xword	0x1f01e54e1f78cd95
	.xword	0x0b4bbf509f756c2c
	.xword	0xca6e867729463690
	.xword	0xf3dfb14011a9c039
	.xword	0x399b2734d780592d
	.xword	0xaa51882b92d67cb0
	.xword	0x64578061f60dafc4
	.xword	0xf027e97743fcb421
	.xword	0x9ef2d8e48780dd6f
	.xword	0x9285e8ebd188f046
	.xword	0xba816aa3fe4db271
	.xword	0x9017d85ccc609890
	.xword	0x38239b6d27441abc
	.xword	0x1dde60d8be4b6de1
	.xword	0x3fb5b783161c0f29
	.xword	0x6cb4629ec1420661
	.xword	0xdd3ec9d99ea5b395
	.xword	0xfb3bb0b4cd60a7ec
	.xword	0x12f34c8f86ed7dfc
	.xword	0x0fdf181b3dcd4686
	.xword	0xb8d9d22527196620
	.xword	0x9930a119c2357b50
	.xword	0x33633ba42560da7c
	.xword	0x7014d5db9400643b
	.xword	0xd174ea83db37d934
	.xword	0x7bd0f3134a4882d1
	.xword	0xfb21ac1de25baf96
	.xword	0x867600b56ee76a1c
	.xword	0x46b7778195abbc97
	.xword	0x733d9b6a1f5a356f
	.xword	0xde7a6702e83a65d1
	.xword	0x753b30337c645d4e
	.xword	0x468712504ff3bc38
	.xword	0x2ca7271eeda5ae83
	.xword	0x003bba636dcc0e7e
	.xword	0x5c9840b87ce333c2
	.xword	0xaf18470cb25ed48c
	.xword	0xf3a9e6b3cca53933
	.xword	0x3e3302239a97fbb6
	.xword	0xed20395e1ab1de4d
	.xword	0x9071434aae42a4ae
	.xword	0xbec10355a2d8f46b
	.xword	0xb423b84e960c3f2f
	.xword	0x6d40164d08d394ba
	.xword	0x0edf5a2059980764
	.xword	0x38fbfaba3f43e3ee
	.xword	0x03bf378cc115178e
	.xword	0xa86f0c95726f99e2
	.xword	0x99012e31200206b5
	.xword	0x061d31b9e2774b37
	.xword	0x3053afca072a0bd9
	.xword	0x87db11d0d7f632b4
	.xword	0x6976d46dcd2a45e4
	.xword	0xcfd8ab41a58f12b3
	.xword	0xc02dc615259b15c6
	.xword	0x8d2b96b7b69ea8ae
	.xword	0x78b5efd533ccaa50
	.xword	0x2788441fbd2e0bc3
	.xword	0x8dc6a319e2a40c24
	.xword	0x431862a0d50b8b69
	.xword	0xaa6636dbc65819cc
	.xword	0x2be06c3bd1a4257c
	.xword	0x1685cfd27f675e56
	.xword	0xeef8cf98aeea275d
	.xword	0x0005202e38069059
	.xword	0xf9b78eb5e857115a
	.xword	0xef360e45bfe42e5b
	.xword	0x424f13e42eac8e24
	.xword	0x2460f9735770564e
	.xword	0x07f6ba894a0daa1a
	.xword	0x832d43784f3a8bce
	.xword	0xcabee5c26cbe752d
	.xword	0x201ab1cd08ddcc7f
	.xword	0x53e5128fe1e36865
	.xword	0x9d656539780bed9b
	.xword	0x2c9943d233167253
	.xword	0x6b15e8e9bce23c18
	.xword	0x4330c0743e38cd2a
	.xword	0x766c015aee371857
	.xword	0xa718b57097b10d51
	.xword	0xb25e1a1887058180
	.xword	0x98f74ee60fcb395f
	.xword	0xddb42e566f69fb38
	.xword	0x94b5b988b52ed202
	.xword	0xd7a178175ffd2d70
	.xword	0xfdb236d685fc4ae0
	.xword	0x3f2739cdb4b5faec
	.xword	0x9beafed1de800b72
	.xword	0x06164b974439bdfd
	.xword	0x1ff8838e20d31e41
	.xword	0xa316d2ddb2daae75
	.xword	0xbddcde6f6f27d18d
	.xword	0x751fe0e8d37ae50e
	.xword	0x7c8c4fe4cc23691e
	.xword	0x1c513f40f4d00c2d
	.xword	0x1a5de2c1a749431b
	.xword	0x9b642c4d4b39b3f9
	.xword	0xacebbafe034a591d
	.xword	0xb60a9e974c9e4c4c
	.xword	0x4a170b37f0c6bed6
	.xword	0xea28ad353042a178
	.xword	0x7516f1ec4bc53bd2
	.xword	0x0ea8bdf7046e4889
	.xword	0xbc1dd0c58b443971
	.xword	0x83e1e9a4d4704b60
	.xword	0xc3ea24d26ccf6b36
	.xword	0x8780b501090e7d38
	.xword	0xf40dc26d337d903c
	.xword	0x8ef5f11adcd19c5e
	.xword	0x33f4368bd992e04a
	.xword	0x0a7e198ef3c7c03b
	.xword	0xa95428c5c4528eff
	.xword	0x25179d59da26c041
	.xword	0x82e3cccffe183718
	.xword	0x9cdaf0161ce9265d
	.xword	0xb38ad210a6e229bd
	.xword	0x7e02fc731a6de946
	.xword	0xf89bbe2f52147d74
	.xword	0x16de4baa8c2db6c8
	.xword	0xd966316c3fb01cc8
	.xword	0x7581b155878bce09
	.xword	0xfc20142b7928bdc7
	.xword	0xf8092bb8d58e0e8e
	.xword	0xb02be63614780d19
	.xword	0x8b292d41f3bbe1b5
	.xword	0x226f816239bc09ea
	.xword	0x8aa3f8eabd07527a
	.xword	0xd478a290372ee9e4
	.xword	0x73654f42b69d6d78
	.xword	0x5c2bb2a7cf1af859
	.xword	0x07f79e5c4fe9972f
	.xword	0xff0e9ee73ff8b30a
	.xword	0x7ff3e689e01663cc
	.xword	0xbc23370ec3e99b05
	.xword	0x6afa4d595ebb82f2
	.xword	0x99fc10ecbd870245
	.xword	0x754213f2f854fa1c
	.xword	0xb4b8437c85214f20
	.xword	0xdab362df95695343
	.xword	0x728926184bf7a9f8
	.xword	0xb9c2a115845cc2aa
	.xword	0x7773e625eafd3cad
	.xword	0xb02d81cfdad7f933
	.xword	0xd7c9e39002d273ca
	.xword	0x75d9e975c9f55a36
	.xword	0x8571bbd8e718d97d
	.xword	0x83904af362c5911b
	.xword	0xf4eac15d0a8efa81
	.xword	0xd5ec0fc8046ae955
	.xword	0x59a784b65996e089
	.xword	0x2da285d84ec6387f
	.xword	0xe543f6b0f3f6ec24
	.xword	0xa5f0c773ab510290
	.xword	0xb46fbfd93c6aba6b
	.xword	0x2b959f9abdff1163
	.xword	0x752c6935d56b7143
	.xword	0x9d0089ec7743e626
	.xword	0xb3d425928d35dc1b
	.xword	0xd7a4fe1150911c86
	.xword	0x917041b95def6bc7
	.xword	0x7df634c34d71e8af
	.xword	0x64285ad91102013a
	.xword	0x72916df9eeae4291
	.xword	0x885e83f18beb7b6e
	.xword	0xd39697fbd8a1084b
	.xword	0x52191b993bd5ef2e
	.xword	0xfcedb47436d8bc2d
	.xword	0xeeb770c3a9ccc08b
	.xword	0x0a93ca27dc29c582
	.xword	0x3a47466c9a0ae04c
	.xword	0xaf9a82d90eba3ffa
	.xword	0x7785d1a8ece8d941
	.xword	0x301f58e0932e404b
	.xword	0xced33379010808c8
	.xword	0x7dfcfd1ec31e12e0
	.xword	0xd97c827b42675940
	.xword	0xb6ab253e398929ed
	.xword	0x2bcf5b8981188220
	.xword	0xc2feb735ba390265
	.xword	0x14a7fac444afb838
	.xword	0xa70de5ef4adfacff



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
	.xword	0xdf9892bcc334fba8
	.xword	0x3277cf6741dd8925
	.xword	0x1691b39f6adb83d2
	.xword	0x311850ad91d758ee
	.xword	0x0071fbf4d78345b8
	.xword	0x17dac9bb97442aa6
	.xword	0x47a87a12fa8c680d
	.xword	0x3f7fa7ee695b7fab
	.xword	0x622630aa4a5ac22e
	.xword	0x97cd52063e55554d
	.xword	0x94cb95e680c612a6
	.xword	0xb0b55532bc2964a5
	.xword	0x4278eb187768f429
	.xword	0x4468a71fd915fd82
	.xword	0xfce3ee73f7608f96
	.xword	0xd0fd594460ee5450
	.xword	0x2713163c699b6e71
	.xword	0xe88a3cb009cbcb71
	.xword	0x15f944f0163aee9d
	.xword	0x596597b49e3efcdb
	.xword	0x527085687b417d64
	.xword	0x5e6a6440a776ca6f
	.xword	0x122d51a34bbe8312
	.xword	0xf39611b6bf217955
	.xword	0xb7482c54b8b34366
	.xword	0x2c43fd2468e2a1ef
	.xword	0x1ce39989d40e443c
	.xword	0x99d59e94bc0098f7
	.xword	0xdcabbad30df7d657
	.xword	0x2772bb95ee2921e0
	.xword	0x35724cbb75e5afcb
	.xword	0xc9298f12d5848c4f
	.xword	0xecc93ecf922f4618
	.xword	0xeb9b6c3e6be57634
	.xword	0xdbc537de5ad47b51
	.xword	0xe6659d2144689008
	.xword	0x28d55b0a10ac15dd
	.xword	0xa8aa9eec06836d3f
	.xword	0x089a483711ab2df8
	.xword	0xc0a8aca439555c3b
	.xword	0x887fb610ee294994
	.xword	0x2dece916e1e11f00
	.xword	0x5c6a53d7b5d8051a
	.xword	0x4bebcdf8e9ce4fbf
	.xword	0xa6e07fe78e6cd72a
	.xword	0x69a76f8c2875aec3
	.xword	0x6cab4adaa9a09d80
	.xword	0x9de9e6704001eea6
	.xword	0x87ce6420876b5969
	.xword	0x4cb80adc3dba41be
	.xword	0x6cd04fdd914b3fb2
	.xword	0xc19ec33ea316262c
	.xword	0x06c5b51cd2daee89
	.xword	0xe1d817768152ef82
	.xword	0x64b2c989ffa7d5fd
	.xword	0x1aab3ccfc0b06720
	.xword	0x523bba752ace008d
	.xword	0xf56e6bb8eb6379ba
	.xword	0x2d7a713225fc879d
	.xword	0x011a25a98dc2213b
	.xword	0xfb13f4def00ec410
	.xword	0x181b800830b5a643
	.xword	0x9d2c8e612c20d82d
	.xword	0xe84456bfee3c4d3f
	.xword	0xf5f6a713f4d8bbbf
	.xword	0x07a50cb5455decc5
	.xword	0xaafcb5000ea223e1
	.xword	0x2075282e46678e0c
	.xword	0xe5885d0fcbc06e23
	.xword	0x14fe7c283882ac30
	.xword	0x4735f79256a08a91
	.xword	0x54f74957493187a6
	.xword	0x58e68e5ba8ac9310
	.xword	0x6165d8dd792f1822
	.xword	0x1570d4c6342c3620
	.xword	0x2f041b1895c806c2
	.xword	0xafd15c1911d67e44
	.xword	0xf691b522e1aa5f9e
	.xword	0x421f57fc172ffecd
	.xword	0x2d3a7796e083859f
	.xword	0xb05227accd781ecb
	.xword	0x3d2b3211f68dc8af
	.xword	0x6cc9f2f05eaef826
	.xword	0xd099a5ecdf1fbd53
	.xword	0xaa322bc3448ff207
	.xword	0xa74669af5aa5e127
	.xword	0x2b598c5cfc23545c
	.xword	0xf171fe300ca2e5bc
	.xword	0x05c873d499ae1280
	.xword	0x15b30a517e9d1394
	.xword	0xc9153a63fd7b7b17
	.xword	0x84274b484c7cc724
	.xword	0xe0e9f9707699a0cf
	.xword	0x890dc66c4950ddd2
	.xword	0xadc71f4c774b0726
	.xword	0x6843faa0b4617ed1
	.xword	0x31d8bf848b2665dc
	.xword	0x74f79aca86f04319
	.xword	0x5a79b505b1add506
	.xword	0x6a5c2d2a97511f78
	.xword	0x3e9b54ad80e19f1f
	.xword	0x8947f6306d79cde9
	.xword	0xd6d0012ff302eac5
	.xword	0xe99debef92ee3d45
	.xword	0x5e133ac409fd3f06
	.xword	0x4cb3a7166f7678a4
	.xword	0xd49357a5d0027d94
	.xword	0x0bac74b50a1b60b3
	.xword	0xcce0d5e9975e09e6
	.xword	0x6e36e7e6eb041c98
	.xword	0x9f36c1d1d52a3963
	.xword	0xd349a50f0a02eb9a
	.xword	0x4cac1cb9286c930a
	.xword	0x621272b7f9f22c6a
	.xword	0xbe3e9a289652df68
	.xword	0xdc4d221709632068
	.xword	0xcbb38e6978424fae
	.xword	0x4f1de936ef068e1d
	.xword	0x498b1d2b924ae1cf
	.xword	0xe4497214266c1f8e
	.xword	0xdad58b39030a951c
	.xword	0x7f461a09553839c4
	.xword	0x0417da1b2371dbfb
	.xword	0x62bf03796358be7c
	.xword	0xe21fb8b51bc474a9
	.xword	0x3a778a00f4e55ef5
	.xword	0xc0e7d38eb4708387
	.xword	0x08eaec2ddc8b0690
	.xword	0x3f3e17908ab1571c
	.xword	0x539c346ce80c8e91
	.xword	0xff3e38c97186309b
	.xword	0xe6067f1035afd7da
	.xword	0xa44a67e803f7165d
	.xword	0x28ac8449be6a4c24
	.xword	0x0e894a6300d6d0bc
	.xword	0xecbcc876c09f3221
	.xword	0x6ffb16a8e07d274e
	.xword	0x4302eac852aec51b
	.xword	0xaa3462314a1b3518
	.xword	0xee5954bb6464a35b
	.xword	0x6a9b41bea916628e
	.xword	0xcc68d328b91e0b4a
	.xword	0xd947b24c82c238ad
	.xword	0xae60d511aff788d2
	.xword	0x13ebf10c37fafce0
	.xword	0x5561f6ef9646a251
	.xword	0x05d6b0928cc2e324
	.xword	0xb116f133601f2e1b
	.xword	0xc8ace1fbb2a68eb5
	.xword	0x82e11b8ef7076d46
	.xword	0x8456fd5417514ff2
	.xword	0x015bbc03882d7c93
	.xword	0xafac13b39c012764
	.xword	0x14d8434d306ef701
	.xword	0x2b7093821bd11afd
	.xword	0xd2c11c8e980abe95
	.xword	0xdf0b36bec389900a
	.xword	0x6677324f8d97b19c
	.xword	0xbd15650550bcd4df
	.xword	0x966464cfa07e9047
	.xword	0x082952461b1eb1be
	.xword	0x4b2a5a29df026576
	.xword	0x30d0e115f6062db4
	.xword	0x3e0a2279b1af2f0f
	.xword	0xb727bd0cff23515e
	.xword	0xed3106fce8e382c0
	.xword	0x5d8a9ef2bfb3faef
	.xword	0xe877a035f870b2ee
	.xword	0x2c0c3b3488804d47
	.xword	0x28cb2c79e8b87b40
	.xword	0xe6c5fc28e358a677
	.xword	0x178b209951fa2f53
	.xword	0x3d83b247c88dfb75
	.xword	0xfe1ac3e53a079999
	.xword	0xe07f4c308bdc7e23
	.xword	0x28297938be008cad
	.xword	0xf2d3aea04e7d17ea
	.xword	0x30bb197dd5e63a60
	.xword	0xe03914f5bbf3f472
	.xword	0xf8585df69fecce79
	.xword	0xb8e5265c3bf6d310
	.xword	0xd98c96dca21a5879
	.xword	0x3b5c0b012a670442
	.xword	0xc2357ff023bd0a71
	.xword	0x24c90edce8db105d
	.xword	0x057dfb4679a56672
	.xword	0x465f345f1c409aae
	.xword	0x47746d5b394dd2ce
	.xword	0x4209c755df5aa048
	.xword	0x101cc4ae3bd954ba
	.xword	0xd58713df0b6f7014
	.xword	0x7cea8081bba976da
	.xword	0x51a75ccf45bcd05b
	.xword	0x3cc81fbeef1042bf
	.xword	0x4cc0b674983370c4
	.xword	0xfab74c2f2c8cbee7
	.xword	0x5ca317b4ab2bffdd
	.xword	0xb9c992e9023a33e1
	.xword	0x5bba0662cf488161
	.xword	0x52f1e5161664eb34
	.xword	0x2e68c9255d79d21c
	.xword	0x0e73886667512f09
	.xword	0x39d84fbd5ac1fcd5
	.xword	0xf03af7e509cc18f9
	.xword	0x4b13cdaa3213fb4b
	.xword	0xcae05d0e212413ed
	.xword	0xca9a0d456e02f0db
	.xword	0xad2fd845a2caec34
	.xword	0xadf67f2adc494a44
	.xword	0x46bf8ebbb84ed7e0
	.xword	0x0ec72ab3da014f4c
	.xword	0x09a256521238290b
	.xword	0x96217090b85b7697
	.xword	0xc831f7607c8fbb52
	.xword	0x97c3a2839ff85569
	.xword	0x73cd887e63066644
	.xword	0x597680c3cd067719
	.xword	0x13c94c71974f8ab5
	.xword	0x7abffea22e8ddf45
	.xword	0x12c465444c8b8703
	.xword	0x4a376aad3ac8d33c
	.xword	0xb98a1836ffdc6d5b
	.xword	0xa15001ac59fde669
	.xword	0xa5cde9794adf0981
	.xword	0x6262a6f5f5b11974
	.xword	0xe5d72f4e0744a7ee
	.xword	0x57e39daca6befc2f
	.xword	0x4604339afbeef291
	.xword	0x6eb872387bc5faa6
	.xword	0xb241254ad4b7e2ca
	.xword	0xebe73588adc21dba
	.xword	0x0ec7f194fe5ae9d0
	.xword	0x45c33a43411efd67
	.xword	0xa88931403dd98fe5
	.xword	0xd020fb8c963278ce
	.xword	0x0979da32a907168a
	.xword	0x6e0ce7f67ff61434
	.xword	0x4d782f8b4c7b7c65
	.xword	0x502a9c5c314c0b7e
	.xword	0xb12cb7a08bac8c7b
	.xword	0xa2189663a8d6db86
	.xword	0x657dccb6a56b51ca
	.xword	0x3c0e130296a9f0bd
	.xword	0x47f4600e9b5e9b5d
	.xword	0x62c04e1cb9376206
	.xword	0x6799849d1d44dc7b
	.xword	0xf6b4e75209feaab0
	.xword	0x4b7670e6eca87e63
	.xword	0xfc2b4eb825689b32
	.xword	0x307f5581e1b333af
	.xword	0x8b80885f95e5bc7b
	.xword	0xcdd311267300b2fa
	.xword	0x78093c82cf4b6dd6
	.xword	0x707a9e825a40c933
	.xword	0x405bfd1c71f728f4
	.xword	0x6d42616f9d6bcf7e



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
	.xword	0x8eae7f19062b198e
	.xword	0x6f33b4921f7db25f
	.xword	0x03c6171ff0622887
	.xword	0xf4dca6702a4f67b3
	.xword	0xb70d1cc67494bbee
	.xword	0x73bbe0511a969e45
	.xword	0x8e96eceb3489a9c2
	.xword	0xfbb852e11c4de61e
	.xword	0xd378e0756040cf40
	.xword	0x70e7e4090442dc65
	.xword	0x5eaab19e262edd97
	.xword	0xcd4e422e4b546bcb
	.xword	0x6a14347f67fb5d13
	.xword	0x701be37eade3d0af
	.xword	0x13398b3a193836da
	.xword	0xfd8e42a978b87dd5
	.xword	0x33a2d718aab175ec
	.xword	0xb307961c65e5b8a5
	.xword	0x15b532d1ca4958a5
	.xword	0x02887da2a54caf43
	.xword	0xc8545923cdf74be7
	.xword	0xf46e4bccc29bdd21
	.xword	0x4d6891d817b77019
	.xword	0xaddf45b0e465885b
	.xword	0x427609a420f202e3
	.xword	0x6bc845f5c758a550
	.xword	0x71350932863edbcf
	.xword	0xc7efbdb007101d4b
	.xword	0x1efde96d8129dbc3
	.xword	0xf0f749fa6fb497cf
	.xword	0x6ebd20a2f0b5e3e8
	.xword	0x9107729e8afa5051
	.xword	0x5fc8a5c59acab8a0
	.xword	0xa1034e3f6aab4022
	.xword	0xa8271bfbed848182
	.xword	0xbee474cddfff153c
	.xword	0x781618bd509f48b7
	.xword	0xf84bcd837529846a
	.xword	0x353c5ebc766c817f
	.xword	0xf5038e3ea13e47fb
	.xword	0xdea69ebdb90205bf
	.xword	0xd5d9d4d1c4b31af8
	.xword	0x4f3b239198bf6dbf
	.xword	0xf33c530289fd769b
	.xword	0xab3bb86244d802f9
	.xword	0x4f115c31df031015
	.xword	0x454a7e5ddcd42888
	.xword	0x76877116fbb62618
	.xword	0x64f0c8b228f181bd
	.xword	0x23d2c72ab0a66ea8
	.xword	0x11b0e8c4ae186e5f
	.xword	0x4a07794a9d75e6f7
	.xword	0xdfee2ad17a112ef2
	.xword	0xe5309a2f3c4baea7
	.xword	0x3e086600f3880e33
	.xword	0xffefa9d66ea9d20d
	.xword	0x636a91a094228447
	.xword	0x3a795753e33ec5fe
	.xword	0x67881ac97f5b4918
	.xword	0x4d7da2ec140a343a
	.xword	0xb45d56c6cf128c52
	.xword	0x6605834811df7adb
	.xword	0x56a1dcbfc05241d5
	.xword	0x17757220801c1913
	.xword	0x14c4800405e69b19
	.xword	0x548d4cfb0a660509
	.xword	0xb1a3a9ff2b23a7fb
	.xword	0x40bf75d24a1f25c1
	.xword	0xd2ae6fc4cb4c68be
	.xword	0xc43523ad84edc8b0
	.xword	0x0864910cac1b9132
	.xword	0x4a9aa1d735f7293b
	.xword	0xd4d0907f7decaffb
	.xword	0x088b00dbad8ca956
	.xword	0x58ff8e4a135df785
	.xword	0xf13586f84dc291c0
	.xword	0x5e73f796d9f5fe70
	.xword	0x50e84ead746ab939
	.xword	0xf70d97b04dc67c77
	.xword	0xc7250482fabcbad4
	.xword	0xf8cee7f49f61fe57
	.xword	0x75dc0154b350bfba
	.xword	0x83c1d2f037f3a2b9
	.xword	0xfa10f3b71a927c75
	.xword	0x4f9d73a540debec9
	.xword	0x59490b31b7391596
	.xword	0xc1679af5952b3467
	.xword	0xd11d6cb9316e852e
	.xword	0xeaec8a9c19a04e02
	.xword	0x5ec4f26bf3d47d36
	.xword	0x6fe061f8007e00ce
	.xword	0x77e2e4e2e43f1ef7
	.xword	0x200ec07540a6d14e
	.xword	0x3ab153bbde389e01
	.xword	0x9465271158b32b2d
	.xword	0x338a96086d660c33
	.xword	0xc11204c7aeaa4511
	.xword	0x3d34aec05eff98dc
	.xword	0xf188d6a3a9361044
	.xword	0x16afbe5099511ce6
	.xword	0x547c0bc6a1bcec27
	.xword	0x40a9a6715cfe018f
	.xword	0xb9fc37bca448b560
	.xword	0x222deb8abca263f7
	.xword	0x37525616c75d94f5
	.xword	0x18de721795d87abb
	.xword	0x42ec96500d5ff13d
	.xword	0x44f270f41e2eb702
	.xword	0x242bc8922d351719
	.xword	0x70f0583687d7e04c
	.xword	0x725665afb0fa2821
	.xword	0x633ac643aea20ac0
	.xword	0xa1a023ff2724ceb0
	.xword	0x34651696bb16b677
	.xword	0x4b3890f220296d7c
	.xword	0x2fa6a8b2d0af92d7
	.xword	0xd6bb40eb85baab65
	.xword	0xdae4579574cc5b15
	.xword	0xca8400735b253e63
	.xword	0xeba4f61a14dcfc1c
	.xword	0x3229bdcda5d8f9f1
	.xword	0x8419151b55c1d7ae
	.xword	0x25499ae41f9237ce
	.xword	0xc6148e957147a8c7
	.xword	0x612cf0fde97476aa
	.xword	0xdb6913c8bdc4916e
	.xword	0x8417ea58b4a4d6a5
	.xword	0x350aa6e5ce9e2ba2
	.xword	0xb7dc7eb236df7be1
	.xword	0xf73f86b9faebffb4
	.xword	0x95f4c5961d16b45b
	.xword	0xb8bc6030e498eea3
	.xword	0x1fa5837e443ff61b
	.xword	0xe2bb74f0fe5418df
	.xword	0x7a773350797df396
	.xword	0xe7e962165191a624
	.xword	0x0cf43e0bdc78f8a5
	.xword	0x890a447c26ed7a30
	.xword	0x05ecf10b5eff8d59
	.xword	0x1f45a10f6cd9b7b1
	.xword	0x6ae6fc479fd433b1
	.xword	0xf0e2808cd50189a0
	.xword	0xa67face2f4cf9e0a
	.xword	0x1d22ecb66b794ab3
	.xword	0xd1d295380a7309d1
	.xword	0x7bd1ca177cef436e
	.xword	0x518ec881334e82a0
	.xword	0x87cf383ff00575a7
	.xword	0xdf877450fe23e516
	.xword	0x94f759469d248b14
	.xword	0x502ccadc6368b913
	.xword	0xada7b1c4121a05ad
	.xword	0x29eda4ca7b130769
	.xword	0x3cd8f65310d215a5
	.xword	0x9052d4cf5b32ea1e
	.xword	0x60a0d16cf0dc31c9
	.xword	0xbbfc58ca974c7a0e
	.xword	0x6555b3c92873d997
	.xword	0x875113c65503bc92
	.xword	0xf288c9d1f4d3cb4a
	.xword	0xce0b9b1fc7f79733
	.xword	0x15979db43bec3d84
	.xword	0xde29c8c59908700c
	.xword	0xd8e402e19c282884
	.xword	0x03fd2c56e9dd9371
	.xword	0xfa887f58c6a15033
	.xword	0xa3c7f9b57eaafb8b
	.xword	0x9bf687bc663b8ff4
	.xword	0x18162acfd9cfc891
	.xword	0x41ef755e504cfb2d
	.xword	0xaec8337b80cc0d67
	.xword	0x2b75f2c87d1ac175
	.xword	0x4f565b36e60a7652
	.xword	0xfb2e0b02ab088bbe
	.xword	0xc054b3aa279ee667
	.xword	0xebf0202b96d4c8ae
	.xword	0x6489faa7e1f07f1c
	.xword	0x4f10804524c3798e
	.xword	0x479e262fd7af7e7d
	.xword	0xdab8edf41a8dd83f
	.xword	0x72391592996c1c2a
	.xword	0x4787f59364539e55
	.xword	0x37ccd96e04f28ad7
	.xword	0xb24f23a357543466
	.xword	0xb49598284aacd2e8
	.xword	0x5245a2be714e5890
	.xword	0x25d33594776b81bf
	.xword	0xdf0c0c2c97c62814
	.xword	0x99f54559dc833b3c
	.xword	0x96c175097c59aa91
	.xword	0x30a375300bce7d74
	.xword	0xce800cb554c5e97d
	.xword	0x2fda8fec6d8ac705
	.xword	0xc7737b38a744a967
	.xword	0x3707b2c12b39cf75
	.xword	0x4122b8d4e6f46789
	.xword	0xdde6631037064f90
	.xword	0x656a07d0f22d818a
	.xword	0xd2d28fbbed490901
	.xword	0xd5e7027d0bc82858
	.xword	0xccdb4d7aa46087ec
	.xword	0xcd9be506737314c7
	.xword	0x93a6523d8e512a3e
	.xword	0xc93434394fbae0fa
	.xword	0x15dd281b4e5bbcf8
	.xword	0x72ff8ef5cb4adb00
	.xword	0xfa92c8a8979a3220
	.xword	0xf6daed3d62086f2c
	.xword	0xd29f1aeb9157b370
	.xword	0x3d0a807e4e1b6081
	.xword	0xe8f67e903a1ffbef
	.xword	0x5cd67e80ddc666a4
	.xword	0xd95cc47e244a49d8
	.xword	0xa91ca52cc066bda1
	.xword	0xdf6055af45f250a3
	.xword	0x45bda5730b5bbb1c
	.xword	0xc6a0f2e1aa143667
	.xword	0x236638643b2c69b7
	.xword	0x77c95984d9acb216
	.xword	0xdea9a6daeca1111a
	.xword	0x10ac1cf2feaaa338
	.xword	0x4c3c4e248ba56c18
	.xword	0x2bf50b73b5e25117
	.xword	0x2cd6c88bd00f16a7
	.xword	0x33742c034e46a19b
	.xword	0xa7490f47c6b6ab53
	.xword	0x5de00af8bd2852d4
	.xword	0xb03ca548a4ff6824
	.xword	0x50f63781ddec67d7
	.xword	0x4d5835f338b5cc03
	.xword	0x9a5c43ac323092e5
	.xword	0x083aa7ea178bf7ca
	.xword	0xc3b83da0a92b815c
	.xword	0x5187b008e6c98f53
	.xword	0x6cecde7f542b708c
	.xword	0x01244b059fe7cf7d
	.xword	0x00652baf694db7fd
	.xword	0xcabcadf3fb8d03dd
	.xword	0x6802b67974f60f88
	.xword	0x11367b5aed9519b9
	.xword	0xfbc4dcd05a011da6
	.xword	0x85984e1ea67bf0e7
	.xword	0x42b84c74736e902e
	.xword	0x0c1d5143d28d90d6
	.xword	0x562052f2399dc803
	.xword	0xfc028f65c3d6a828
	.xword	0x8adf229c4c46d4f5
	.xword	0x0e3f987eeaca8138
	.xword	0x80a80022a2a1ab97
	.xword	0x632be58db7655142
	.xword	0x5b25a603e5f24b06
	.xword	0xf7828152c84010f2
	.xword	0xaf405a250f5b58e6
	.xword	0x5a2211d07f9d04a5
	.xword	0xd36ad08f219ae7f0
	.xword	0x16b71db65bd9c24a



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
	.xword	0x01eeb7626535185c
	.xword	0xb4a23d5fb175042f
	.xword	0x5be720999af2d9aa
	.xword	0x330c7e20e3b03184
	.xword	0xb08e90db7148941e
	.xword	0xe8c0db5b9da72473
	.xword	0x1363ddedca4aa97e
	.xword	0xae892d40332426a9
	.xword	0x8a07e63239830803
	.xword	0x0302b5a6fd9ecd45
	.xword	0x60c6e48b766c7768
	.xword	0xc66637c436b021a5
	.xword	0xe7bffc0678be3ea6
	.xword	0xd3d46cc6edb1ce7d
	.xword	0x2a0e2feb4772f4b0
	.xword	0xeddd99c7b69ed526
	.xword	0x83ea8e7f0eb61833
	.xword	0x8112ced56dff9ce6
	.xword	0x1fc3b6355e230f1f
	.xword	0x74961343bb8157be
	.xword	0x92b2251986216ee7
	.xword	0xaaef6e4e2da874ac
	.xword	0xe33bc2f59da3f921
	.xword	0x2eb2199d909e8f32
	.xword	0xef2441f0ce349a28
	.xword	0xdf793b6cc8db0de3
	.xword	0xe221a1125ce89d73
	.xword	0x048df6db13466ce1
	.xword	0x5e7476b30271bed0
	.xword	0x9503e55cb177902b
	.xword	0xd43be74f4597c359
	.xword	0x06f094bfff77330f
	.xword	0x51d80b726e87dccb
	.xword	0x04ef1cc1c4169f30
	.xword	0x2e5d6365d003727b
	.xword	0x7800a6e589367731
	.xword	0x1844bdfcf8e4e9dc
	.xword	0x8528620ecfb74602
	.xword	0xfdf3089828aacf5f
	.xword	0x5bfebe66b2d38455
	.xword	0x0c717bcae5d563f2
	.xword	0x6e2a367948379233
	.xword	0xe6ddf1cef42c2fba
	.xword	0xe9a31a577e41549a
	.xword	0x97314bd2a0e1cdc2
	.xword	0x3732c9bc469428e4
	.xword	0x8cb0be0126236037
	.xword	0x329af3593b1c714c
	.xword	0xf347d0354dfeec7c
	.xword	0xc29d62924e4defbb
	.xword	0xdefc8d453a7cc2fd
	.xword	0x1c017b5146555af9
	.xword	0x91da901a387621e6
	.xword	0x4820e76750cd6f7b
	.xword	0x7ee6e24324fd1ec6
	.xword	0xce99a415ba2bb0b0
	.xword	0xb0419c512c222b63
	.xword	0xa4d285d28a6f3c39
	.xword	0x6fe969fec9d7f374
	.xword	0xf7aa1bc07c594f94
	.xword	0xca832cf448e9c045
	.xword	0xb587e69657c88dcf
	.xword	0x1aa331f3caa2dbb5
	.xword	0xcda026687122044a
	.xword	0xf72a0697d11f97df
	.xword	0x073d3c8eafdf859b
	.xword	0x3c9d9d66efbaf792
	.xword	0x3facee6a54e931d0
	.xword	0x48e819db8a8a9781
	.xword	0x9dec3500bb2b7e03
	.xword	0xf67e84123a9726e7
	.xword	0x12434f038362bb71
	.xword	0x0afb857d286f9c08
	.xword	0x58e6902002168dd5
	.xword	0x902b6dab1e5e9f3a
	.xword	0xe34fe441cd1a54ee
	.xword	0xff4575bada60504e
	.xword	0x78243ad6a0460fa9
	.xword	0x0def6611774fc17a
	.xword	0x4633561a506398a1
	.xword	0x0c9e8c21eed49fdc
	.xword	0x75f54b620b75ced7
	.xword	0xe3cb2c8fa219a6df
	.xword	0x035d6bacc80bfe20
	.xword	0x8dfb88dc5eb1d1af
	.xword	0xb69e35abc0dc9619
	.xword	0x282ea57fd96513d0
	.xword	0x49c698e3e68f3fed
	.xword	0x0fcda571c924452e
	.xword	0x9fbf320387a3aa36
	.xword	0x4cb8bceeca550ab2
	.xword	0x8b360c4721562ce2
	.xword	0x04a20262893fcec4
	.xword	0x743c071ce23c7652
	.xword	0xbe68405f17ff4d86
	.xword	0xf3058671fffc7b3c
	.xword	0xae9781ccf7342caa
	.xword	0xb7bb83fac34c6d47
	.xword	0xeacd33a39b99093d
	.xword	0x6c0d4c6c8066e16a
	.xword	0x207dcf76abc77d30
	.xword	0x5048cb5fe8b0a59a
	.xword	0xeff7c109058a0b8b
	.xword	0x1b47340295605c9b
	.xword	0xe1772859a41abbcb
	.xword	0x30eaf9115aa1b7d7
	.xword	0x2bb5c61b0e16c4d8
	.xword	0xc218b486b2447f1c
	.xword	0xfb22e6272f1e8809
	.xword	0xe746260d6852ca60
	.xword	0xbe623e1a31dfbb2e
	.xword	0x19b29e53de1fffc8
	.xword	0x6d7ef7c84355729d
	.xword	0x8c50a86d2a0f9e1e
	.xword	0x35226f043181a488
	.xword	0xde712aa8ded2e5b4
	.xword	0xb73a9e439019203f
	.xword	0x8e5bb85a9a0c0905
	.xword	0xe305d99420f0c4dd
	.xword	0xc00f20d2908c04fe
	.xword	0xf31f3340d2464898
	.xword	0x752d3f1816028792
	.xword	0x3d2351e6e794c2ed
	.xword	0xaaa8ea39f797c065
	.xword	0x547e8b66651ff3ea
	.xword	0x43887aaad4039246
	.xword	0x8306882d9177f57b
	.xword	0xf9b8846386f7d384
	.xword	0xbdd8a7eae4fa83fa
	.xword	0x028c698596e8658d
	.xword	0xa5c1b793dd8afe27
	.xword	0xa16e7708053131e1
	.xword	0xc10f4f169aab2127
	.xword	0xa7732f575c6a2dc4
	.xword	0x3332514cf630cf6e
	.xword	0x862d9e74dc4e6ee0
	.xword	0xe11b1f44b1bcbcad
	.xword	0x36b2c517d4be954a
	.xword	0x77503af80f1e18a5
	.xword	0x5efe29d2fbb8e9fe
	.xword	0x374ecdba36262e2e
	.xword	0x27d3ba02a0f072fe
	.xword	0x85320962f33c79e3
	.xword	0xd5ad4f3fb08eaa39
	.xword	0x5c91811b0dbc7cf5
	.xword	0xafb7fa5d5a6d71e7
	.xword	0xef7af48efe5012c9
	.xword	0xf2aa142958db65c4
	.xword	0x9151993fc3b8617c
	.xword	0x65742449b7886736
	.xword	0xa2034ef24340107c
	.xword	0x958cb8cf6007cf92
	.xword	0x26ad8e7c086fc29b
	.xword	0x0008ba84ca9ec6de
	.xword	0x172bf7f04bb5d7b3
	.xword	0x604f41e231b6cd22
	.xword	0xa2c719d49d56bdd5
	.xword	0x18b32da3b9b6cb88
	.xword	0xf89a3b73b451a59c
	.xword	0x0b56eb9c20c0f368
	.xword	0x923990b37477680c
	.xword	0xfbf107434d1af666
	.xword	0x64c22a8296b4808d
	.xword	0x6fe79a5d4b44cc14
	.xword	0xd96283f60b24682f
	.xword	0xd5851baf091bb468
	.xword	0xb47e867df092c6e3
	.xword	0xf8e26be797fb9ff1
	.xword	0x3e1b916add541bf4
	.xword	0x86279030f655c789
	.xword	0xe7cc8ef1022c6e4e
	.xword	0x4d606325d0155e45
	.xword	0x6fd5978830a7fc92
	.xword	0xb2f92bfb6c5b0294
	.xword	0x3c839797d609059c
	.xword	0x5e3222eb4b3d75a6
	.xword	0xc3f61c210b4afd96
	.xword	0x3aa339709af89611
	.xword	0x0ab0f22803f5cb85
	.xword	0x80e5ea99ce844961
	.xword	0xfb71345fe58c624d
	.xword	0x751929b5005ce1c2
	.xword	0x33c3c5cb29555d94
	.xword	0x2346c2327c03455e
	.xword	0xc9f1cb0b41e22a29
	.xword	0xae7dc46b506f5dc8
	.xword	0x29468bad9738ed75
	.xword	0x61eb194612242d4f
	.xword	0xcba22766349925e8
	.xword	0x24aee025f0e7d4fc
	.xword	0x732c57619b11b083
	.xword	0x0c08320fd3b98759
	.xword	0xd0374c2e547e9d25
	.xword	0x42a0cd95067d3356
	.xword	0xd939ada3a6a62123
	.xword	0xd72de317326ad19f
	.xword	0x25d96f8e248236a3
	.xword	0xf2aad4b05d467f78
	.xword	0x06832262a28db5de
	.xword	0x2d01049f958aaeda
	.xword	0xf95ecced1cbb2b78
	.xword	0xaf54d83735f04938
	.xword	0xac0c38244936d33d
	.xword	0xdc97081cd64b3b41
	.xword	0xf81fc05dd7306569
	.xword	0x8e10cb98397ba2fc
	.xword	0xccd2194a3e524da9
	.xword	0x54ebaffe77aa4542
	.xword	0xf944b5385b13d239
	.xword	0xa5518a0d2b3ea391
	.xword	0xb529b9f5b0962fea
	.xword	0x6c9865954eae10b0
	.xword	0x0dc683b3b0bd1215
	.xword	0x5a10c97b67350c45
	.xword	0xf5bf6e8ac8e29884
	.xword	0x9cdf5a0b5f518337
	.xword	0x41d954060af4e00f
	.xword	0xa24c264f30d86855
	.xword	0x98e0f343e42deef9
	.xword	0x9c01930edc729606
	.xword	0x849c8b1c2f9594d3
	.xword	0xe147282a6715398d
	.xword	0x263ed2e4530ff1eb
	.xword	0x372f454448c83094
	.xword	0x725517cf4bbcbb4c
	.xword	0xe210b258116e2631
	.xword	0x8108ae009808f361
	.xword	0xc4b14a902ba9a544
	.xword	0x8cbdeef6f911b003
	.xword	0x326bc3cd8e509f34
	.xword	0xef8634ea852e33b5
	.xword	0xbc8b6e81b055c8d3
	.xword	0x6c7b6e466b9c4833
	.xword	0xbda40d95893b7b9e
	.xword	0x27d3a49ce18ef80a
	.xword	0x2a274cc82ba52169
	.xword	0x7e3e7a454459cb76
	.xword	0x3d34edb1ff8a9f7f
	.xword	0xac1d90cb8351b125
	.xword	0x3e26adcecd83e234
	.xword	0x6edc153d0f47329d
	.xword	0x826fd73ef97afdfa
	.xword	0xf1026ec7cce41ac4
	.xword	0xeb91122e3222f9b0
	.xword	0x1405e8427c185c6e
	.xword	0x2a264a19608cb292
	.xword	0x814022ca149866fe
	.xword	0x39365f280bb06051
	.xword	0x125ca9fce955efca
	.xword	0x94f6d0863d827d5f
	.xword	0x672d1b58d6b3ba10
	.xword	0xa792bd77c057ba89
	.xword	0x3098217c266428f0
	.xword	0x65e7c53e658c808c
	.xword	0xa02f2747cf817f70
	.xword	0x6f98b55f5da2f67b



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
	.xword	0x471e403d3822b3e8
	.xword	0x0d5a203fda4613cf
	.xword	0x5d93ae9e74203324
	.xword	0x30fbef27d98921d5
	.xword	0xb82d7af0fa1c303c
	.xword	0x8dd363a17d6b2c56
	.xword	0xe18e0069cc057670
	.xword	0x690bd7b4ae173930
	.xword	0xe137f3d2db477b88
	.xword	0x4e54932bbfc2b0f4
	.xword	0x40eae8c598eafb8b
	.xword	0xdafaf1a04812b37a
	.xword	0x739b61d96c04f475
	.xword	0x93f329cb1acd964c
	.xword	0x2ae5538a25458589
	.xword	0x3c4bffdf7013f9f0
	.xword	0xca5ca5558adb2fa5
	.xword	0x9a90c5177fd55c89
	.xword	0xadea36fa9c2dc0f5
	.xword	0x574b0798ad53f1bd
	.xword	0xe4d6e8be01b83ed4
	.xword	0x797c600dc22dd147
	.xword	0xfb31909790e3ebe6
	.xword	0x48f067f784743f6d
	.xword	0xb8478c88cb6b84b0
	.xword	0x323490abc6c9ffa8
	.xword	0xf6282e3c9fd549b8
	.xword	0x50ba91066b955772
	.xword	0x6c89a2f0b087ef88
	.xword	0x91effd06817042ad
	.xword	0x12ada92b34f4b7ac
	.xword	0x62447888b89421f5
	.xword	0x3f35e60aa7c67f66
	.xword	0xeee7bcf5379a7d86
	.xword	0x1a0429bcb9f381ae
	.xword	0x74b0f8768d972433
	.xword	0x8ea97cdd52f7bdbe
	.xword	0x2e30a675a2cb8353
	.xword	0xe3db8d27baf77346
	.xword	0xdd8e80fc8c4102b9
	.xword	0x4bc93cbee42ea74b
	.xword	0xe5b0d5d4a9941907
	.xword	0x8504087fd6244666
	.xword	0x7211ed1724ba914d
	.xword	0x04ae5fd1d5f697f0
	.xword	0xd627b92065205ec7
	.xword	0xd577a5303569e189
	.xword	0xa1c7e2c15941e023
	.xword	0xbc5d1dd6aefc1e32
	.xword	0x2fddeb7b05071abf
	.xword	0xa65e5c5c9671814b
	.xword	0xbac34a15340bfadc
	.xword	0xab26a901339db7e5
	.xword	0x13a49dd443e40719
	.xword	0x109fc22a606f985f
	.xword	0xb610a5e0e22f048d
	.xword	0x60ca088d8d8c8cd3
	.xword	0x71ade57351f9d279
	.xword	0x6cc07d4be8428554
	.xword	0xefe655a03ef91d56
	.xword	0xf69caeaecc547917
	.xword	0x44ded8b38ae98b70
	.xword	0x7005617c1402994c
	.xword	0xb939f21853112bf7
	.xword	0x999a84040e722eaf
	.xword	0x7f4f4aab1f40ca14
	.xword	0xfb79ce84ed9f216e
	.xword	0xb6b5b152e9dab95c
	.xword	0xea9bd7fe015a54f8
	.xword	0xebc9948c332ca0c9
	.xword	0xb7dbac8d8f6d45a7
	.xword	0xa9098b742d360d7e
	.xword	0x2c321dd66bbaedc1
	.xword	0xaa47cb4e5d974be2
	.xword	0x9a83d74084970309
	.xword	0x676fe90316c291d5
	.xword	0x9e01fcbb606e7c36
	.xword	0xe512f1bb9912f479
	.xword	0xf94b7c61b085a529
	.xword	0x47852160ca8ec7be
	.xword	0x5b3447bb16368a53
	.xword	0x31f282bba436182f
	.xword	0x6f1ced78be2a2b8a
	.xword	0x37357ddb599990ed
	.xword	0xf40a2bd25909090d
	.xword	0xd923362aab52b0e3
	.xword	0xefe56b2c567587cd
	.xword	0xae7c08ad315b3430
	.xword	0xe8fd33cbd21e50c7
	.xword	0x7fcb6e865f561bc8
	.xword	0x1a57ff4bf1e152c7
	.xword	0x8e8ee019ceec21ad
	.xword	0xbafab1af7acd683a
	.xword	0xa26d089297c8eb9f
	.xword	0x6ffafe3959a57b8a
	.xword	0xd852efdc951d2f81
	.xword	0x9e8721988ac5ccd9
	.xword	0x2ffb8cbd08352812
	.xword	0x67f2d0362e460e72
	.xword	0xdd09bc19c87e03c5
	.xword	0xf67a03f345529772
	.xword	0x1bf522734a126870
	.xword	0x10e5458c95499362
	.xword	0x2cd494dbbc89cc03
	.xword	0xa86f056e59fcbf63
	.xword	0x6289bf924b03d71c
	.xword	0xa69dbfc9bdca2d73
	.xword	0xc2f1edec305546fa
	.xword	0x6a2df0102381c993
	.xword	0x9499fa720e2ce9c7
	.xword	0x8ef3b9cf563f14be
	.xword	0x8bd3469f2a8a1414
	.xword	0x6e7f4ceae1d11815
	.xword	0x8fd82f1779358dab
	.xword	0xf3085f54be48cb76
	.xword	0x12d09124b05b4d48
	.xword	0x6c7c875a90599bef
	.xword	0x44ee8b3d6b5483cf
	.xword	0xb8d146ec64e4f8d8
	.xword	0x6a765362080eb29d
	.xword	0xed31e0df2773553e
	.xword	0x0a1374c6cd4e8ba4
	.xword	0xa50685ee7b8b8847
	.xword	0x4e8d827146424b33
	.xword	0x666513ab2573e4c1
	.xword	0xbe020c86349db21f
	.xword	0x7a9fb74d23c35a70
	.xword	0x1342cc42174ff5f5
	.xword	0xba4f0a0aded070c7
	.xword	0x4075dd2e6a07f088
	.xword	0xdc23da9e5739555b
	.xword	0x9f9fe37f278ff7a3
	.xword	0x4df085fbf553aeca
	.xword	0xbef1df80ae21938c
	.xword	0xecbf73dfedf19e6d
	.xword	0xc9e9a04adb87b15f
	.xword	0x5e26f5018716976d
	.xword	0xba019ed49216a6dd
	.xword	0x8d59efe1c26a9dab
	.xword	0xb263344d0035b31f
	.xword	0x2b55c00eebc5dd9f
	.xword	0xd15dcf7da8c55526
	.xword	0xcc16a826d27425a8
	.xword	0xa2f492caf27e7746
	.xword	0x20bba1b4fc71feb4
	.xword	0xc22f34e3b7b8d26a
	.xword	0xf8204ffdc9e4bde7
	.xword	0x78761e85e913f362
	.xword	0x42cf9aac8795d28f
	.xword	0xa00953f8ea52d418
	.xword	0x1c7ac8e727b70752
	.xword	0x8c3f9a92237ae1f5
	.xword	0xd7cec9bb648bef80
	.xword	0xbc46cebdf3e936f4
	.xword	0xb8642b0a865d39c2
	.xword	0x3cae4bd035e14b8d
	.xword	0x83ef482718e182ac
	.xword	0x2022346ceee85374
	.xword	0x2b05d501d9621197
	.xword	0xd000892e23e8a393
	.xword	0x5ec219deeaca706a
	.xword	0x025c2dc9b1be638e
	.xword	0x66ee5cb3827111a1
	.xword	0xfe769a7ec7cdc499
	.xword	0x5192f61ee8b280d2
	.xword	0xd0f8a9ddd242d2a9
	.xword	0x50994a12e27b063c
	.xword	0x82e4acca7f97e31c
	.xword	0x0a6772b26a2a7b83
	.xword	0x110b66a371051ae4
	.xword	0x554979e38238f684
	.xword	0x79790773fc171d02
	.xword	0xa07e6c9efa842c28
	.xword	0x17250c8110d7809e
	.xword	0x0d9c7fc9de2e0f1b
	.xword	0x165cc3a2f3d32b18
	.xword	0x92f49cc52c2dc822
	.xword	0x9d423823ea14c3c8
	.xword	0x702f4eb87114b6b1
	.xword	0x9f39d92bc89f9f66
	.xword	0xb1554c0ad5ac0c8c
	.xword	0xe2ec9b97d0ff2e90
	.xword	0xaa872a7a1d238bd4
	.xword	0x04003bafd6c3b3fc
	.xword	0x91691082add89558
	.xword	0x98f847c8120c68ab
	.xword	0xb0b13c788aa00222
	.xword	0xad514123dd8f9220
	.xword	0x4d14beff3687fc42
	.xword	0x49c5dc51377553a4
	.xword	0xc250edb2bd782c09
	.xword	0x671333e1bf2a8037
	.xword	0x14bebe0b459b45aa
	.xword	0x1f6afa21065cd68d
	.xword	0x782c93398b9d6643
	.xword	0x8cea50b629df3d94
	.xword	0xd616849c299a8c6d
	.xword	0x7c39d31f4b000354
	.xword	0x3a094b96fa43431c
	.xword	0xb7b26152fd141c7b
	.xword	0x59cb95a5d88214b3
	.xword	0xebe6ce3568e16029
	.xword	0x74db6f2a36e4f0f3
	.xword	0xedc39e96bf9a6090
	.xword	0x88ba127d73c71e4e
	.xword	0x71513effd0c321c6
	.xword	0xa1ed37ffa9819e50
	.xword	0xc696c7b25f1aca5d
	.xword	0xba27d75f35178982
	.xword	0xda7c6d7a11b23777
	.xword	0x4682127892fa2ade
	.xword	0x2cd83b9b21df52d1
	.xword	0x3566b5c3ac75ec6a
	.xword	0xa48ab58d31a29960
	.xword	0x462f5d9bea1d4a9e
	.xword	0x8c9280aa0121583b
	.xword	0xeec4e545f6dc7d3b
	.xword	0x2c0d2280164bb7ee
	.xword	0x054f44c45eb3961d
	.xword	0x87c48d2d95871464
	.xword	0xfdfdd099cdce9f90
	.xword	0x1c820ad0316e9fab
	.xword	0x1b3f515e0ed4c60b
	.xword	0x8d8c9a7a93a13a6d
	.xword	0x104e7fd3f7828537
	.xword	0x6e557f8e790fcf3d
	.xword	0x8fa9fc675bddb853
	.xword	0x460ed0ac23616b1d
	.xword	0x81adb2e59553e5a1
	.xword	0x23f8628f162de3bf
	.xword	0xc03507cbfd2cde0a
	.xword	0x844c7d9622193277
	.xword	0x2866ec9a9bd2d248
	.xword	0xf46675ccda12e04c
	.xword	0xa1b2b3ff61c6240c
	.xword	0xa49cf676286d73fc
	.xword	0x451df1007d30638e
	.xword	0xb553eff0a67a3c48
	.xword	0x86b2636d9a732da5
	.xword	0x8b3aa14435fe2b8b
	.xword	0xa119e6b5aff03c58
	.xword	0x837089421f1ce838
	.xword	0x19da773da834995b
	.xword	0x0f711742814eaae4
	.xword	0x229f53c79d84ca33
	.xword	0x69e6b1ce79dff463
	.xword	0xef0afac4a65a5939
	.xword	0x1c696b5a921f38af
	.xword	0xe7a5f8978e1d0764
	.xword	0x53c358afca222cdd
	.xword	0x14ea34924cfa747f
	.xword	0xddfdf38ba8e7d1fa
	.xword	0x6d832b3961448ba7
	.xword	0x88ef3d3b5215262f
	.xword	0x2a7fef8e1cc9773e
	.xword	0x957b83c69b521109



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
	.xword	0x4abbfed950a52534
	.xword	0xf21e4795332aa2b8
	.xword	0x48ba65fe494f5b08
	.xword	0x7d9edce0f5fe4654
	.xword	0x955a64db0723ab05
	.xword	0xee5551c1330850bd
	.xword	0x523b5cff266cfba2
	.xword	0xffd6dfa40efb614d
	.xword	0xce82acac3e425640
	.xword	0x5c09f2ec4791bc1d
	.xword	0x5a01c2c6bd0060c5
	.xword	0x0d02832f63026c33
	.xword	0xb459219390f123bd
	.xword	0x746e971870710372
	.xword	0x8ebcdc6b385e4c90
	.xword	0xbbcff756e0361144
	.xword	0xdbd46fad71c936f3
	.xword	0x812446a1233eb8b5
	.xword	0x25e64b769fd4fd91
	.xword	0xda6b2573d64e1ba6
	.xword	0x8f4c409e15662672
	.xword	0x25bf54b7c4d9805a
	.xword	0x449b07b42c9a9c48
	.xword	0xae32dd76d80699b2
	.xword	0xdeca801d72cbfcaf
	.xword	0x3b4bf1cd7a452370
	.xword	0xd9d2885ee651099b
	.xword	0x633c625080ddcf74
	.xword	0xdf8891217eebd8c1
	.xword	0xbbde6e5654224b18
	.xword	0x8a8653fb3824e3b8
	.xword	0x486b75d31a2cb892
	.xword	0x33320bbe2f0d324c
	.xword	0xfb7a16aa47f64265
	.xword	0x10cfbb9fea586660
	.xword	0xe6b950a812cf1dbc
	.xword	0xeea90b8174fc9172
	.xword	0x3b952190d09db47a
	.xword	0x4d65dcb2eae39534
	.xword	0x0aad97134bac4b5e
	.xword	0x68e0934bf3e7c485
	.xword	0x1a42e9a721367891
	.xword	0x6741ec77c9f3b95b
	.xword	0xcac0ccb0d4d7c0b2
	.xword	0xe3bfc882e5d3a50b
	.xword	0x8eda6ae412160af9
	.xword	0x082d9cdbb2478d61
	.xword	0xe69c1a9b6b924e91
	.xword	0xb540b51fa4e95b6f
	.xword	0x60141a49283b5b91
	.xword	0x7040868b727af9b9
	.xword	0x332653518e7eebc1
	.xword	0x4c30ec7b9e34e38b
	.xword	0x99ba4464b97d508f
	.xword	0xeca735e181022cde
	.xword	0xcd580adb869d0ea6
	.xword	0x71baeea65fd247d0
	.xword	0x4e00f4721e003398
	.xword	0x0381329a9cbf0956
	.xword	0xda82179fcbc59cf2
	.xword	0x1f2376e5e3045a5c
	.xword	0xd2a166291d2a127e
	.xword	0x81500317c97edda1
	.xword	0x3a97f82752ebb90e
	.xword	0x35462265c9702ff7
	.xword	0x1b3a771871f51cf2
	.xword	0x53cc4eb136a08237
	.xword	0xe9612fe16375c4e6
	.xword	0xeaf4bc5113b84afc
	.xword	0x0cfbc3e1c5c23f6f
	.xword	0x9a58e7e7af637542
	.xword	0x8f61b9a3ed44eeca
	.xword	0xc8ff28880288f524
	.xword	0x8bc8d3aa348b318c
	.xword	0xe8f67bad878258ab
	.xword	0x639e1da2f5af09d6
	.xword	0x2cd52d4e4d49c174
	.xword	0x8f114a7b7fd30595
	.xword	0x10f3df85f79b284e
	.xword	0xd803c103465d26c8
	.xword	0x4150d64b3a7d543d
	.xword	0xa523c3a53ec753df
	.xword	0x88eabc6ec54d40a1
	.xword	0x0093391cc5d4f651
	.xword	0xfe46e5acb759df45
	.xword	0x901bb51c7305d331
	.xword	0x97119685f7222777
	.xword	0x1733c960c8691a27
	.xword	0x70cfd4952cfd3a37
	.xword	0x6c27f08be04600b2
	.xword	0xa62825026b49a918
	.xword	0x8808e8a93ae57960
	.xword	0x587b8e82cde57510
	.xword	0x262a84150ee5dfd0
	.xword	0xc9213f5fdc08534d
	.xword	0x7484f5b19dd3054c
	.xword	0x97329b3a9b228dbe
	.xword	0x3986a2448cc525d0
	.xword	0xee292a0fdcaf34ba
	.xword	0x6502883095eb84d2
	.xword	0xa6b1870c7c0f9b17
	.xword	0x0e82141a8baede8e
	.xword	0x1a401928a4f9e5c1
	.xword	0x0f57d13a71fd15ee
	.xword	0xc6fd98be56f100f8
	.xword	0x8bd0017c77f430d6
	.xword	0x7a10bf9af99ac392
	.xword	0xeb928570e6941c82
	.xword	0xac704296e72dbc41
	.xword	0xa95602b830b0bfcf
	.xword	0xe35d2d7f9707ec65
	.xword	0x2d3576cdf48bbec2
	.xword	0x45eafe473f6b03b3
	.xword	0xa656863b9139f906
	.xword	0x75940f5cef8034ac
	.xword	0x24ad05b84f4b103e
	.xword	0x58f4ae6473258ebe
	.xword	0x4166289d4297041b
	.xword	0x473f4bf7347ef932
	.xword	0xc42dc1b830d31d20
	.xword	0x38aa1ea445f44a36
	.xword	0x7344c4d3b71d72b5
	.xword	0x88b352c6a81ea5a6
	.xword	0x55416a25f53bb1ad
	.xword	0x483048dc9c4c3914
	.xword	0x7e5143e811c6dca9
	.xword	0x5562ffd6771be476
	.xword	0xc125193e01fc92a2
	.xword	0xb9571b38df3b9da3
	.xword	0x044352d8d6eb7f6f
	.xword	0xe55d994ff528dc42
	.xword	0xade5be65aada5b80
	.xword	0x331272628f81370b
	.xword	0xd9823db341d2a365
	.xword	0xdc63e52b97882fa1
	.xword	0xbc85070a009e820a
	.xword	0x4d1182043d3c3a4e
	.xword	0xa48d14af004b654d
	.xword	0x0b5b6368c5b5395b
	.xword	0x565d7f020aa93685
	.xword	0x8d9db27d547abcdf
	.xword	0x8f343f30ddef968e
	.xword	0x68787f4cd186000c
	.xword	0x1a239309dd8e7f88
	.xword	0x608cbf5120a311e1
	.xword	0xee6f94f272c91de5
	.xword	0x6987bb2d77a7eb60
	.xword	0xee2e6e17f83e8b8a
	.xword	0xfccfab94fe818220
	.xword	0x5ba69c43ab48176b
	.xword	0xb5517fba9947279d
	.xword	0x6675a6f0c727cf5a
	.xword	0xd5ea92260cad3ed0
	.xword	0x7a596a195800171e
	.xword	0x512360bdc358b3c2
	.xword	0x1f19b35fad220157
	.xword	0xe73afc78a315eaee
	.xword	0xb7f4292a70aee532
	.xword	0xf47ad53c52c6f588
	.xword	0xd1c8b6aaac15984e
	.xword	0xc91592d8ad3d341c
	.xword	0x48331f23898d8c43
	.xword	0xf5abe0b647baad11
	.xword	0xccd1904ba677432e
	.xword	0x3ac6e0dc47ec8743
	.xword	0x69ef7f83b1a6ea07
	.xword	0x3959f4beb9670a5c
	.xword	0x17076d5862ff6ce9
	.xword	0x4b707b844848a380
	.xword	0xa0ea88bcf6fc55c5
	.xword	0xb2371536089b14d5
	.xword	0x5faf0513ebe03f1e
	.xword	0x12b57804e1b05973
	.xword	0x205137649fd6f039
	.xword	0x880d3aaa1676f0ec
	.xword	0xa82fb3f00cca5125
	.xword	0x6e4b901d39a5bdbe
	.xword	0x8886dfc0dd9cee10
	.xword	0xdb9fd35ca5c60f53
	.xword	0x803453f17866ef8b
	.xword	0x054cbd95a2e2e186
	.xword	0xb55457cdb5f56d65
	.xword	0xf680e4669f0d622a
	.xword	0x751edc96d9f76492
	.xword	0x04a64f5274d4ee71
	.xword	0x360515cc8f3d4318
	.xword	0x00989cef1392f5a6
	.xword	0xfed273d29afcc3a7
	.xword	0x7c3bfaa0600638bc
	.xword	0x5097b22665868359
	.xword	0x8af6c6c4dc270888
	.xword	0x417af304a27aceb1
	.xword	0xe1d55879e45b8854
	.xword	0xc6a9aff412d64af3
	.xword	0xe74bbffba902d95d
	.xword	0x13314a4a09039bc2
	.xword	0x2d3b41284a211867
	.xword	0x462f09015f44e856
	.xword	0xe1137bbe2c13a30f
	.xword	0x25903e381ed50723
	.xword	0x02932ab728828fb0
	.xword	0x523b3faf08cdc5ad
	.xword	0xb0c4110543f441ed
	.xword	0xc2935a36c7d599ec
	.xword	0x6f738e1c25142aac
	.xword	0xee4e34462aef7569
	.xword	0xddb899bbd36fc79d
	.xword	0xed3470a92e2d7f5e
	.xword	0xcfdb2941290bcd19
	.xword	0x1a431ffc44be86bc
	.xword	0xe66f6b059223dc3a
	.xword	0xb01cfc35f0ff8492
	.xword	0x806511b0c0694abd
	.xword	0xe941c314f5cceceb
	.xword	0x7450221ce19cdaf7
	.xword	0x7ab06f381210ee03
	.xword	0xb06b3401f93cd20e
	.xword	0x0e5dfbb1e79c028f
	.xword	0xdb737577c64d2578
	.xword	0x5c68b355f3eb05ca
	.xword	0xe63592168ef5719e
	.xword	0x4559b65d9f8d9c89
	.xword	0x8bdbb15e24472f11
	.xword	0x902b5380427d2adb
	.xword	0x9d48bec47bf6e6b0
	.xword	0x47ba1540a1040f2d
	.xword	0x41dbe227a59f1168
	.xword	0xcaee681d58788aac
	.xword	0x044bab92c74a2fd5
	.xword	0x495b788d206895c1
	.xword	0x27a0e238359c03c1
	.xword	0x39f77b27b9d70b4a
	.xword	0x6a55b8c0d537edd6
	.xword	0x3bb9682108ed2b5a
	.xword	0x0d8162ef059eb2f3
	.xword	0x9491dfe61ac6c07d
	.xword	0x1e438e4fbeea3f6a
	.xword	0x389998d273e7fc3c
	.xword	0xe0fb45a8ba089f2c
	.xword	0xa4bc1b2e6899c736
	.xword	0xf2b17dc958215320
	.xword	0x523b4ed659d89c43
	.xword	0x6623bb353ed66f6b
	.xword	0xa16fe464a5f51f4f
	.xword	0x590bfa039e5ba931
	.xword	0x1fe40d503f231e3b
	.xword	0x3edde14eebeb29ca
	.xword	0xd06118e82d17b93c
	.xword	0xcd05c60045e63e68
	.xword	0x6550d2b7f6ebbaae
	.xword	0x1c8c76f490d50cc0
	.xword	0x61a421027a9e4fbe
	.xword	0xf2f9c3a600bd6369
	.xword	0xf98757f8455e4671
	.xword	0x7e14199cadf84be1
	.xword	0x93306aedef0e6eb6



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
