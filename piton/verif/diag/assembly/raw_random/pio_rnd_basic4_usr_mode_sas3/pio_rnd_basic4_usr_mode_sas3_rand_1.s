// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: pio_rnd_basic4_usr_mode_sas3_rand_1.s
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
   random seed:	242662096
   Jal pio_rnd_basic4_usr_mode_sas3.j:	
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

	setx	user_data_start, %l0, %l1
	setx	0xf0, %l0, %l2
        mov     0,%l4
        setx    ncdata_base0, %l0, %l2           ! nc data base
        setx    0x1000, %l0, %l3                ! nc datawork area
        add     %l2, %l3, %g3
!loop0:	
!	ldub	[%l1 + 0x7f], %l3
!	subcc	%l3, %l2, %g0
!	bnz	loop0
!	nop
!	prefetch [%l1 + 0x3f], #n_writes

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
ldda [%g3]ASI_BLK_P, %f16

! Register init code

	setx 0xdc3d25a64540eec2, %g1, %g0
	setx 0x4c40e6b483a8446d, %g1, %g1
	setx 0xe1c4c26cf9578779, %g1, %g2
	setx 0x4f5e4f883547a188, %g1, %g3
	setx 0xdb6ae738f5a8c053, %g1, %g4
	setx 0x1cfd4416ff73c9b7, %g1, %g5
	setx 0x7db675ed6cc81962, %g1, %g6
	setx 0xfd6f2b586c1820a6, %g1, %g7
	setx 0xe4fd69047c4eaa72, %g1, %r16
	setx 0x90dbc01030b37a39, %g1, %r17
	setx 0xecefabc10649a674, %g1, %r18
	setx 0x29112d05e6a5aa46, %g1, %r19
	setx 0x925b4a14761dab86, %g1, %r20
	setx 0xc3b3e38b162687a3, %g1, %r21
	setx 0x345100e5c3823655, %g1, %r22
	setx 0x21d0b6c171c4b4b6, %g1, %r23
	setx 0x8b1305392c1d253c, %g1, %r24
	setx 0x47945e20df2195df, %g1, %r25
	setx 0x1b3e3f477f09bf50, %g1, %r26
	setx 0x51915b5a09ce192e, %g1, %r27
	setx 0xa7dd2902f4c8fa84, %g1, %r28
	setx 0xf76fe9420ebcaf01, %g1, %r29
	setx 0x5afc1e685a2052d8, %g1, %r30
	setx 0x4ca68e0c2c0075f3, %g1, %r31
	save
	setx 0x29975aa33a025a68, %g1, %r16
	setx 0x3ca98d0a3cde63a1, %g1, %r17
	setx 0xb888a4c6ae88b61f, %g1, %r18
	setx 0x65fdd29a59b3ded5, %g1, %r19
	setx 0x26b90d3ab477be5f, %g1, %r20
	setx 0xe0632df8e643eb6e, %g1, %r21
	setx 0x471f17a51bd04788, %g1, %r22
	setx 0xc2f7068a43ba6cf7, %g1, %r23
	setx 0x13954df4409beb1d, %g1, %r24
	setx 0x705f5d31308971f5, %g1, %r25
	setx 0xcef1c192d8018317, %g1, %r26
	setx 0xd73a530b21e43e89, %g1, %r27
	setx 0x237bfcb283e985b7, %g1, %r28
	setx 0x1d149c173d5fb484, %g1, %r29
	setx 0xe59122877e21dfa9, %g1, %r30
	setx 0x3ab33c919231102a, %g1, %r31
	save
	setx 0x541a0ec3dfc461e9, %g1, %r16
	setx 0x61a4cda131514a54, %g1, %r17
	setx 0x7854b13935f8c263, %g1, %r18
	setx 0xe52e2b767f5e3a4b, %g1, %r19
	setx 0x2fcaa135e5568c17, %g1, %r20
	setx 0x4170ed8ee14c76a4, %g1, %r21
	setx 0xf029fa101f1b5776, %g1, %r22
	setx 0x65c13abe460519c6, %g1, %r23
	setx 0x7baca218a860ddbd, %g1, %r24
	setx 0x34c82603298e0b88, %g1, %r25
	setx 0x55ccf35a80a18008, %g1, %r26
	setx 0xdca9193a7789b737, %g1, %r27
	setx 0xf473c92b55c27581, %g1, %r28
	setx 0xab3f5777edeacd34, %g1, %r29
	setx 0xb700390774868ed2, %g1, %r30
	setx 0xdb5aef6579875581, %g1, %r31
	restore
	mov	0, %r8
	setx	0x00000000d01ef080, %r1, %r6
	setx	0x00000000d02ef080, %r1, %r7
	setx	0x00000000d03ef000, %r1, %r9
	setx	0x00000000d04ef140, %r1, %r10
	setx	0x00000000d05ef100, %r1, %r11
	setx	0x00000000d06ef000, %r1, %r12
	setx	0x00000000d07ef080, %r1, %r13
	.word 0xe0530008  ! 1: LDSH_R	ldsh	[%r12 + %r8], %r16
	stda	 %f16, [%r11]ASI_BLK_P
	membar	 0x40
	.word 0xe4718008  ! 3: STX_R	stx	%r18, [%r6 + %r8]
	.word 0xe031a020  ! 4: STH_I	sth	%r16, [%r6 + 0x0020]
	.word 0xe422e018  ! 5: STW_I	stw	%r18, [%r11 + 0x0018]
	stda	 %f16, [%r6]ASI_BLK_PL
	membar	 0x40
!DEBUG rnd_cnt = 1 
	ldda	[%r12]ASI_BLK_PL, %f16
	membar	 0x40
	.word 0xe029e028  ! 8: STB_I	stb	%r16, [%r7 + 0x0028]
	.word 0xec0a6010  ! 9: LDUB_I	ldub	[%r9 + 0x0010], %r22
	.word 0xec534008  ! 10: LDSH_R	ldsh	[%r13 + %r8], %r22
	.word 0xe0598008  ! 11: LDX_R	ldx	[%r6 + %r8], %r16
	.word 0xe41aa038  ! 12: LDD_I	ldd	[%r10 + 0x0038], %r18
	.word 0xe8432020  ! 13: LDSW_I	ldsw	[%r12 + 0x0020], %r20
	stda	 %f0, [%r9]ASI_BLK_P
	membar	 0x40
	.word 0xe839e018  ! 15: STD_I	std	%r20, [%r7 + 0x0018]
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
!DEBUG rnd_cnt = 0 
	ldda	[%r7]ASI_BLK_P, %f16
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_PL
	membar	 0x40
	.word 0xec2b4008  ! 19: STB_R	stb	%r22, [%r13 + %r8]
	.word 0xe41a6030  ! 20: LDD_I	ldd	[%r9 + 0x0030], %r18
	.word 0xe401a008  ! 21: LDUW_I	lduw	[%r6 + 0x0008], %r18
	.word 0xe0318008  ! 22: STH_R	sth	%r16, [%r6 + %r8]
!DEBUG rnd_cnt = 1 
	ldda	[%r13]ASI_BLK_PL, %f0
	membar	 0x40
	setx	0x00000000d08e1000, %r1, %r6
	setx	0x00000000d08e1080, %r1, %r7
	setx	0x00000000d08e1080, %r1, %r9
	setx	0x00000000d08e1000, %r1, %r10
	setx	0x00000000d08e1180, %r1, %r11
	setx	0x00000000d08e1080, %r1, %r12
	setx	0x00000000d08e1180, %r1, %r13
	.word 0xec52c008  ! 25: LDSH_R	ldsh	[%r11 + %r8], %r22
	.word 0xe009a030  ! 26: LDUB_I	ldub	[%r6 + 0x0030], %r16
!DEBUG rnd_cnt = 1 
	ldda	[%r10]ASI_BLK_PL, %f16
	membar	 0x40
!DEBUG rnd_cnt = 0 
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xe05aa028  ! 30: LDX_I	ldx	[%r10 + 0x0028], %r16
	.word 0xec098008  ! 31: LDUB_R	ldub	[%r6 + %r8], %r22
	.word 0xe052e030  ! 32: LDSH_I	ldsh	[%r11 + 0x0030], %r16
	setx	0x00000000d02ef1c0, %r1, %r6
	setx	0x00000000d08e1100, %r1, %r7
	setx	0x00000000d04ef100, %r1, %r9
	setx	0x00000000d08e1180, %r1, %r10
	setx	0x00000000d06ef000, %r1, %r11
	setx	0x00000000d08e1040, %r1, %r12
	setx	0x00000000d08e1080, %r1, %r13
	.word 0xe00b4008  ! 34: LDUB_R	ldub	[%r13 + %r8], %r16
	stda	 %f0, [%r11]ASI_BLK_PL
	membar	 0x40
!DEBUG rnd_cnt = 0 
	ldda	[%r10]ASI_BLK_P, %f16
	membar	 0x40
!DEBUG rnd_cnt = 0 
	ldda	[%r7]ASI_BLK_P, %f16
	membar	 0x40
	.word 0xec01a008  ! 38: LDUW_I	lduw	[%r6 + 0x0008], %r22
	stda	 %f16, [%r11]ASI_BLK_P
	membar	 0x40
	.word 0xe0032000  ! 40: LDUW_I	lduw	[%r12 + 0x0000], %r16
	.word 0xe0330008  ! 41: STH_R	sth	%r16, [%r12 + %r8]
	.word 0xec718008  ! 42: STX_R	stx	%r22, [%r6 + %r8]
	.word 0xe44a6028  ! 43: LDSB_I	ldsb	[%r9 + 0x0028], %r18
	stda	 %f0, [%r9]ASI_BLK_P
	membar	 0x40
!DEBUG rnd_cnt = 0 
	ldda	[%r7]ASI_BLK_P, %f16
	membar	 0x40
	.word 0xe02b6000  ! 46: STB_I	stb	%r16, [%r13 + 0x0000]
	.word 0xe002c008  ! 47: LDUW_R	lduw	[%r11 + %r8], %r16
	.word 0xe432c008  ! 48: STH_R	sth	%r18, [%r11 + %r8]
	stda	 %f0, [%r11]ASI_BLK_PL
	membar	 0x40
	.word 0xe0726000  ! 50: STX_I	stx	%r16, [%r9 + 0x0000]
	.word 0xe01a8008  ! 51: LDD_R	ldd	[%r10 + %r8], %r16
	.word 0xe441a018  ! 52: LDSW_I	ldsw	[%r6 + 0x0018], %r18
	.word 0xe03b4008  ! 53: STD_R	std	%r16, [%r13 + %r8]
	stda	 %f0, [%r13]ASI_BLK_PL
	membar	 0x40
	.word 0xec32c008  ! 55: STH_R	sth	%r22, [%r11 + %r8]
	.word 0xe05ae008  ! 57: LDX_I	ldx	[%r11 + 0x0008], %r16
	.word 0xec2b2000  ! 58: STB_I	stb	%r22, [%r12 + 0x0000]
	setx	0x00000000d01ef040, %r1, %r6
	setx	0x00000000d02ef0c0, %r1, %r7
	setx	0x00000000d03ef0c0, %r1, %r9
	setx	0x00000000d04ef1c0, %r1, %r10
	setx	0x00000000d05ef100, %r1, %r11
	setx	0x00000000d06ef180, %r1, %r12
	setx	0x00000000d07ef180, %r1, %r13
	.word 0xe04a4008  ! 61: LDSB_R	ldsb	[%r9 + %r8], %r16
!DEBUG rnd_cnt = 0 
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe0532000  ! 63: LDSH_I	ldsh	[%r12 + 0x0000], %r16
	.word 0xe022a038  ! 65: STW_I	stw	%r16, [%r10 + 0x0038]
!DEBUG rnd_cnt = 0 
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe871e030  ! 67: STX_I	stx	%r20, [%r7 + 0x0030]
	.word 0xe05b4008  ! 68: LDX_R	ldx	[%r13 + %r8], %r16
	.word 0xe871c008  ! 69: STX_R	stx	%r20, [%r7 + %r8]
	.word 0xe001a038  ! 70: LDUW_I	lduw	[%r6 + 0x0038], %r16
!DEBUG rnd_cnt = 1 
	ldda	[%r6]ASI_BLK_PL, %f0
	membar	 0x40
	.word 0xe0430008  ! 72: LDSW_R	ldsw	[%r12 + %r8], %r16
	.word 0xe049e000  ! 73: LDSB_I	ldsb	[%r7 + 0x0000], %r16
	.word 0xec4b2020  ! 74: LDSB_I	ldsb	[%r12 + 0x0020], %r22
	.word 0xe051a038  ! 75: LDSH_I	ldsh	[%r6 + 0x0038], %r16
	.word 0xe039a000  ! 76: STD_I	std	%r16, [%r6 + 0x0000]
	.word 0xe051a020  ! 77: LDSH_I	ldsh	[%r6 + 0x0020], %r16
	.word 0xec018008  ! 78: LDUW_R	lduw	[%r6 + %r8], %r22
	stda	 %f16, [%r6]ASI_BLK_PL
	membar	 0x40
	.word 0xec12e020  ! 80: LDUH_I	lduh	[%r11 + 0x0020], %r22
	.word 0xec71c008  ! 81: STX_R	stx	%r22, [%r7 + %r8]
	.word 0xe071a020  ! 82: STX_I	stx	%r16, [%r6 + 0x0020]
	.word 0xe0536020  ! 83: LDSH_I	ldsh	[%r13 + 0x0020], %r16
!DEBUG rnd_cnt = 0 
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe439e008  ! 85: STD_I	std	%r18, [%r7 + 0x0008]
	.word 0xe8734008  ! 86: STX_R	stx	%r20, [%r13 + %r8]
	.word 0xe051a030  ! 87: LDSH_I	ldsh	[%r6 + 0x0030], %r16
	.word 0xe42b0008  ! 88: STB_R	stb	%r18, [%r12 + %r8]
!DEBUG rnd_cnt = 1 
	ldda	[%r13]ASI_BLK_PL, %f0
	membar	 0x40
!DEBUG rnd_cnt = 0 
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe85ae008  ! 91: LDX_I	ldx	[%r11 + 0x0008], %r20
	.word 0xe4426038  ! 92: LDSW_I	ldsw	[%r9 + 0x0038], %r18
	.word 0xe029c008  ! 93: STB_R	stb	%r16, [%r7 + %r8]
	.word 0xec718008  ! 94: STX_R	stx	%r22, [%r6 + %r8]
	.word 0xe021c008  ! 95: STW_R	stw	%r16, [%r7 + %r8]
	stda	 %f16, [%r7]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_PL
	membar	 0x40
	.word 0xe002c008  ! 98: LDUW_R	lduw	[%r11 + %r8], %r16
	.word 0xe05b6038  ! 99: LDX_I	ldx	[%r13 + 0x0038], %r16
!DEBUG rnd_cnt = 1 
	ldda	[%r6]ASI_BLK_PL, %f0
	membar	 0x40
	.word 0xe051c008  ! 101: LDSH_R	ldsh	[%r7 + %r8], %r16
	.word 0xe001c008  ! 102: LDUW_R	lduw	[%r7 + %r8], %r16
	.word 0xe4524008  ! 103: LDSH_R	ldsh	[%r9 + %r8], %r18
	.word 0xe01b4008  ! 104: LDD_R	ldd	[%r13 + %r8], %r16
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	.word 0xec318008  ! 107: STH_R	sth	%r22, [%r6 + %r8]
	.word 0xe029e028  ! 108: STB_I	stb	%r16, [%r7 + 0x0028]
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	stda	 %f16, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe459a030  ! 111: LDX_I	ldx	[%r6 + 0x0030], %r18
	.word 0xe029a000  ! 112: STB_I	stb	%r16, [%r6 + 0x0000]
	.word 0xe4430008  ! 113: LDSW_R	ldsw	[%r12 + %r8], %r18
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	.word 0xe041a030  ! 115: LDSW_I	ldsw	[%r6 + 0x0030], %r16
	.word 0xec718008  ! 116: STX_R	stx	%r22, [%r6 + %r8]
	.word 0xe00b2038  ! 117: LDUB_I	ldub	[%r12 + 0x0038], %r16
!DEBUG rnd_cnt = 0 
	ldda	[%r12]ASI_BLK_P, %f16
	membar	 0x40
	.word 0xec19c008  ! 119: LDD_R	ldd	[%r7 + %r8], %r22
	.word 0xe4334008  ! 120: STH_R	sth	%r18, [%r13 + %r8]
	stda	 %f16, [%r11]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_PL
	membar	 0x40
	.word 0xe4728008  ! 123: STX_R	stx	%r18, [%r10 + %r8]
!DEBUG rnd_cnt = 0 
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe4336030  ! 125: STH_I	sth	%r18, [%r13 + 0x0030]
	.word 0xe4432030  ! 126: LDSW_I	ldsw	[%r12 + 0x0030], %r18
!DEBUG rnd_cnt = 0 
	ldda	[%r9]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe43b4008  ! 128: STD_R	std	%r18, [%r13 + %r8]
!DEBUG rnd_cnt = 0 
	ldda	[%r12]ASI_BLK_P, %f16
	membar	 0x40
!DEBUG rnd_cnt = 0 
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
!DEBUG rnd_cnt = 0 
	ldda	[%r12]ASI_BLK_P, %f16
	membar	 0x40
	.word 0xe0324008  ! 132: STH_R	sth	%r16, [%r9 + %r8]
	.word 0xe0236030  ! 133: STW_I	stw	%r16, [%r13 + 0x0030]
	.word 0xa00b4008  ! 134: AND_R	and 	%r13, %r8, %r16
	.word 0xec298008  ! 135: STB_R	stb	%r22, [%r6 + %r8]
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xe031c008  ! 137: STH_R	sth	%r16, [%r7 + %r8]
!DEBUG rnd_cnt = 0 
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_PL
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xec428008  ! 141: LDSW_R	ldsw	[%r10 + %r8], %r22
	stda	 %f0, [%r9]ASI_BLK_P
	membar	 0x40
	.word 0xec3b0008  ! 143: STD_R	std	%r22, [%r12 + %r8]
	.word 0xec418008  ! 144: LDSW_R	ldsw	[%r6 + %r8], %r22
	stda	 %f0, [%r11]ASI_BLK_PL
	membar	 0x40
!DEBUG rnd_cnt = 0 
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
!DEBUG rnd_cnt = 0 
	ldda	[%r12]ASI_BLK_P, %f16
	membar	 0x40
!DEBUG rnd_cnt = 1 
	ldda	[%r13]ASI_BLK_PL, %f0
	membar	 0x40
	.word 0xe4030008  ! 149: LDUW_R	lduw	[%r12 + %r8], %r18
	.word 0xec226020  ! 150: STW_I	stw	%r22, [%r9 + 0x0020]
	.word 0xe4218008  ! 151: STW_R	stw	%r18, [%r6 + %r8]
	.word 0xe0734008  ! 152: STX_R	stx	%r16, [%r13 + %r8]
	.word 0xe4034008  ! 153: LDUW_R	lduw	[%r13 + %r8], %r18
	.word 0xe8526010  ! 154: LDSH_I	ldsh	[%r9 + 0x0010], %r20
!DEBUG rnd_cnt = 0 
	ldda	[%r12]ASI_BLK_P, %f16
	membar	 0x40
	.word 0xac0ae030  ! 156: AND_I	and 	%r11, 0x0030, %r22
	stda	 %f16, [%r12]ASI_BLK_PL
	membar	 0x40
	.word 0xe01ac008  ! 158: LDD_R	ldd	[%r11 + %r8], %r16
!DEBUG rnd_cnt = 0 
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f16, [%r11]ASI_BLK_P
	membar	 0x40
	.word 0xe049a010  ! 161: LDSB_I	ldsb	[%r6 + 0x0010], %r16
!DEBUG rnd_cnt = 1 
	ldda	[%r13]ASI_BLK_PL, %f0
	membar	 0x40
	.word 0xe439e030  ! 163: STD_I	std	%r18, [%r7 + 0x0030]
!DEBUG rnd_cnt = 0 
	ldda	[%r9]ASI_BLK_P, %f0
	membar	 0x40
!DEBUG rnd_cnt = 1 
	ldda	[%r7]ASI_BLK_PL, %f16
	membar	 0x40
	.word 0xec732010  ! 166: STX_I	stx	%r22, [%r12 + 0x0010]
	stda	 %f16, [%r6]ASI_BLK_PL
	membar	 0x40
	.word 0xe0128008  ! 168: LDUH_R	lduh	[%r10 + %r8], %r16
	.word 0xe45aa018  ! 169: LDX_I	ldx	[%r10 + 0x0018], %r18
	.word 0xe8298008  ! 170: STB_R	stb	%r20, [%r6 + %r8]
!DEBUG rnd_cnt = 0 
	ldda	[%r10]ASI_BLK_P, %f16
	membar	 0x40
!DEBUG rnd_cnt = 0 
	ldda	[%r10]ASI_BLK_P, %f16
	membar	 0x40
!DEBUG rnd_cnt = 0 
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
!DEBUG rnd_cnt = 0 
	ldda	[%r9]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe459a038  ! 175: LDX_I	ldx	[%r6 + 0x0038], %r18
	.word 0xe071a000  ! 176: STX_I	stx	%r16, [%r6 + 0x0000]
!DEBUG rnd_cnt = 1 
	ldda	[%r12]ASI_BLK_PL, %f16
	membar	 0x40
	.word 0xe029c008  ! 178: STB_R	stb	%r16, [%r7 + %r8]
	stda	 %f0, [%r9]ASI_BLK_PL
	membar	 0x40
	.word 0xa012e028  ! 180: OR_I	or 	%r11, 0x0028, %r16
	.word 0xe039c008  ! 181: STD_R	std	%r16, [%r7 + %r8]
	.word 0xe04a8008  ! 182: LDSB_R	ldsb	[%r10 + %r8], %r16
	.word 0xe8098008  ! 183: LDUB_R	ldub	[%r6 + %r8], %r20
	.word 0xec4b6018  ! 184: LDSB_I	ldsb	[%r13 + 0x0018], %r22
	.word 0xec21a020  ! 185: STW_I	stw	%r22, [%r6 + 0x0020]
	.word 0xec218008  ! 186: STW_R	stw	%r22, [%r6 + %r8]
!DEBUG rnd_cnt = 0 
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r9]ASI_BLK_P
	membar	 0x40
	.word 0xec324008  ! 189: STH_R	sth	%r22, [%r9 + %r8]
	.word 0xa0a1c008  ! 190: SUBcc_R	subcc 	%r7, %r8, %r16
!DEBUG rnd_cnt = 1 
	ldda	[%r12]ASI_BLK_PL, %f16
	membar	 0x40
	.word 0xe4718008  ! 192: STX_R	stx	%r18, [%r6 + %r8]
	.word 0xe0124008  ! 193: LDUH_R	lduh	[%r9 + %r8], %r16
	.word 0xe852a008  ! 194: LDSH_I	ldsh	[%r10 + 0x0008], %r20
	.word 0xec1b0008  ! 195: LDD_R	ldd	[%r12 + %r8], %r22
	.word 0xec49a030  ! 196: LDSB_I	ldsb	[%r6 + 0x0030], %r22
	.word 0xe01b6030  ! 197: LDD_I	ldd	[%r13 + 0x0030], %r16
	.word 0xe8530008  ! 198: LDSH_R	ldsh	[%r12 + %r8], %r20
	.word 0xe8736008  ! 199: STX_I	stx	%r20, [%r13 + 0x0008]
	.word 0xe4198008  ! 200: LDD_R	ldd	[%r6 + %r8], %r18
	.word 0xec226030  ! 201: STW_I	stw	%r22, [%r9 + 0x0030]
	.word 0xe84b6010  ! 202: LDSB_I	ldsb	[%r13 + 0x0010], %r20
!DEBUG rnd_cnt = 1 
	ldda	[%r9]ASI_BLK_PL, %f0
	membar	 0x40
	stda	 %f16, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe0298008  ! 205: STB_R	stb	%r16, [%r6 + %r8]
	stda	 %f0, [%r9]ASI_BLK_PL
	membar	 0x40
	.word 0xe01ac008  ! 207: LDD_R	ldd	[%r11 + %r8], %r16
	.word 0xe04a4008  ! 208: LDSB_R	ldsb	[%r9 + %r8], %r16
	.word 0xe85ae008  ! 209: LDX_I	ldx	[%r11 + 0x0008], %r20
!DEBUG rnd_cnt = 1 
	ldda	[%r9]ASI_BLK_PL, %f0
	membar	 0x40
	.word 0xe02a8008  ! 211: STB_R	stb	%r16, [%r10 + %r8]
	.word 0xa0a18008  ! 212: SUBcc_R	subcc 	%r6, %r8, %r16
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xe851c008  ! 214: LDSH_R	ldsh	[%r7 + %r8], %r20
	.word 0xe071e038  ! 215: STX_I	stx	%r16, [%r7 + 0x0038]
	.word 0xe0734008  ! 216: STX_R	stx	%r16, [%r13 + %r8]
!DEBUG rnd_cnt = 0 
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe8718008  ! 218: STX_R	stx	%r20, [%r6 + %r8]
	.word 0xe0332028  ! 219: STH_I	sth	%r16, [%r12 + 0x0028]
	.word 0xe0336028  ! 220: STH_I	sth	%r16, [%r13 + 0x0028]
	.word 0xe4328008  ! 221: STH_R	sth	%r18, [%r10 + %r8]
	.word 0xec498008  ! 222: LDSB_R	ldsb	[%r6 + %r8], %r22
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xe4032010  ! 224: LDUW_I	lduw	[%r12 + 0x0010], %r18
	stda	 %f0, [%r11]ASI_BLK_PL
	membar	 0x40
!DEBUG rnd_cnt = 1 
	ldda	[%r13]ASI_BLK_PL, %f0
	membar	 0x40
	.word 0xec3b6038  ! 227: STD_I	std	%r22, [%r13 + 0x0038]
!DEBUG rnd_cnt = 1 
	ldda	[%r13]ASI_BLK_PL, %f0
	membar	 0x40
	.word 0xe822e028  ! 229: STW_I	stw	%r20, [%r11 + 0x0028]
	.word 0xe0518008  ! 230: LDSH_R	ldsh	[%r6 + %r8], %r16
	stda	 %f16, [%r12]ASI_BLK_PL
	membar	 0x40
	.word 0xe429a020  ! 232: STB_I	stb	%r18, [%r6 + 0x0020]
!DEBUG rnd_cnt = 1 
	ldda	[%r6]ASI_BLK_PL, %f0
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xe002e030  ! 235: LDUW_I	lduw	[%r11 + 0x0030], %r16
	.word 0xe82a4008  ! 236: STB_R	stb	%r20, [%r9 + %r8]
	.word 0xe8734008  ! 237: STX_R	stx	%r20, [%r13 + %r8]
	.word 0xe05a4008  ! 238: LDX_R	ldx	[%r9 + %r8], %r16
	.word 0xec2aa000  ! 239: STB_I	stb	%r22, [%r10 + 0x0000]
	stda	 %f0, [%r13]ASI_BLK_PL
	membar	 0x40
!DEBUG rnd_cnt = 0 
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe071c008  ! 242: STX_R	stx	%r16, [%r7 + %r8]
	.word 0xe43a8008  ! 243: STD_R	std	%r18, [%r10 + %r8]
!DEBUG rnd_cnt = 0 
	ldda	[%r12]ASI_BLK_P, %f16
	membar	 0x40
!DEBUG rnd_cnt = 0 
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe011a000  ! 248: LDUH_I	lduh	[%r6 + 0x0000], %r16
	.word 0xe051c008  ! 249: LDSH_R	ldsh	[%r7 + %r8], %r16
	stda	 %f0, [%r9]ASI_BLK_PL
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_PL
	membar	 0x40
	.word 0xec228008  ! 252: STW_R	stw	%r22, [%r10 + %r8]
	.word 0xe42a8008  ! 253: STB_R	stb	%r18, [%r10 + %r8]
	.word 0xe8118008  ! 254: LDUH_R	lduh	[%r6 + %r8], %r20
	.word 0xec0aa030  ! 255: LDUB_I	ldub	[%r10 + 0x0030], %r22
	.word 0xec5aa010  ! 257: LDX_I	ldx	[%r10 + 0x0010], %r22
	.word 0xe8224008  ! 258: STW_R	stw	%r20, [%r9 + %r8]
	.word 0xa0334008  ! 259: SUBC_R	orn 	%r13, %r8, %r16
	stda	 %f16, [%r10]ASI_BLK_PL
	membar	 0x40
	.word 0xec730008  ! 261: STX_R	stx	%r22, [%r12 + %r8]
	.word 0xe822c008  ! 262: STW_R	stw	%r20, [%r11 + %r8]
	stda	 %f0, [%r13]ASI_BLK_PL
	membar	 0x40
	.word 0xacc24008  ! 264: ADDCcc_R	addccc 	%r9, %r8, %r22
	.word 0xe43aa020  ! 265: STD_I	std	%r18, [%r10 + 0x0020]
!DEBUG rnd_cnt = 1 
	ldda	[%r13]ASI_BLK_PL, %f0
	membar	 0x40
	.word 0xe02a6008  ! 267: STB_I	stb	%r16, [%r9 + 0x0008]
	.word 0xe0024008  ! 268: LDUW_R	lduw	[%r9 + %r8], %r16
	.word 0xe039a008  ! 269: STD_I	std	%r16, [%r6 + 0x0008]
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f16, [%r11]ASI_BLK_P
	membar	 0x40
	.word 0xec29a000  ! 272: STB_I	stb	%r22, [%r6 + 0x0000]
	.word 0xe4318008  ! 273: STH_R	sth	%r18, [%r6 + %r8]
!DEBUG rnd_cnt = 1 
	ldda	[%r6]ASI_BLK_PL, %f0
	membar	 0x40
	.word 0xe0326000  ! 276: STH_I	sth	%r16, [%r9 + 0x0000]
	stda	 %f0, [%r7]ASI_BLK_PL
	membar	 0x40
	.word 0xe001e020  ! 278: LDUW_I	lduw	[%r7 + 0x0020], %r16
	.word 0xec532000  ! 279: LDSH_I	ldsh	[%r12 + 0x0000], %r22
	.word 0xe411a020  ! 280: LDUH_I	lduh	[%r6 + 0x0020], %r18
	.word 0xe41b0008  ! 281: LDD_R	ldd	[%r12 + %r8], %r18
!DEBUG rnd_cnt = 0 
	ldda	[%r12]ASI_BLK_P, %f16
	membar	 0x40
	.word 0xec232000  ! 283: STW_I	stw	%r22, [%r12 + 0x0000]
	.word 0xe032c008  ! 284: STH_R	sth	%r16, [%r11 + %r8]
	.word 0xe0098008  ! 285: LDUB_R	ldub	[%r6 + %r8], %r16
	.word 0xe81ac008  ! 286: LDD_R	ldd	[%r11 + %r8], %r20
	.word 0xe02a8008  ! 287: STB_R	stb	%r16, [%r10 + %r8]
	setx	0x00000000d02ef040, %r1, %r6
	setx	0x00000000d08e1080, %r1, %r7
	setx	0x00000000d04ef000, %r1, %r9
	setx	0x00000000d08e1140, %r1, %r10
	setx	0x00000000d06ef080, %r1, %r11
	setx	0x00000000d08e10c0, %r1, %r12
	setx	0x00000000d08e1100, %r1, %r13
	.word 0xe0324008  ! 289: STH_R	sth	%r16, [%r9 + %r8]
	.word 0xe81a8008  ! 290: LDD_R	ldd	[%r10 + %r8], %r20
	stda	 %f0, [%r13]ASI_BLK_PL
	membar	 0x40
	.word 0xe42ac008  ! 292: STB_R	stb	%r18, [%r11 + %r8]
	.word 0xec29e030  ! 293: STB_I	stb	%r22, [%r7 + 0x0030]
!DEBUG rnd_cnt = 0 
	ldda	[%r10]ASI_BLK_P, %f16
	membar	 0x40
	.word 0xec2b4008  ! 295: STB_R	stb	%r22, [%r13 + %r8]
	.word 0xe459a030  ! 296: LDX_I	ldx	[%r6 + 0x0030], %r18
	.word 0xe812c008  ! 297: LDUH_R	lduh	[%r11 + %r8], %r20
	.word 0xe8226008  ! 298: STW_I	stw	%r20, [%r9 + 0x0008]
	setx	0x00000000d02ef180, %r1, %r6
	setx	0x00000000d08e1040, %r1, %r7
	setx	0x00000000d04ef080, %r1, %r9
	setx	0x00000000d08e1040, %r1, %r10
	setx	0x00000000d06ef000, %r1, %r11
	setx	0x00000000d08e1180, %r1, %r12
	setx	0x00000000d08e1180, %r1, %r13



normal_end:
        ta      T_GOOD_TRAP

bad_end:
        ta      T_BAD_TRAP

user_text_end:

!***********************************************************************
!  Test case data start
!***********************************************************************

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
        .skip 4000

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

!***********************************************************************
!IOSYNC cycles to start sjm
!***********************************************************************

setx 0xdeadbeefdeadbeef, %g1, %g2
setx 0xcf00beef00, %g1, %g3
stx %g2, [%g3]
!=====================
setx 0xdeadbeefdeadbeef, %g1, %g2
setx 0xef00beef00, %g1, %g3
stx %g2, [%g3]
!=====================

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

done;

h_bad_end:
        ta T_BAD_TRAP

.global  My_0x30_trap

My_0x30_trap:
  !inc %l4
  done

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
	.xword	0x73ff36fb429dfb81
	.xword	0x04589ebf38086f28
	.xword	0xc1a9453d55415fea
	.xword	0xa875c4e49e14d65a
	.xword	0x6a9fcbbfb95f1347
	.xword	0xbb7b30f3debbc4e9
	.xword	0x924aab835183df97
	.xword	0x8f6ef7d19586ff69
	.xword	0x1be2458c46d4de94
	.xword	0xbc86053e26eec5f3
	.xword	0x4ee03953ab8d4350
	.xword	0x7ddb5206206488e7
	.xword	0x15e46b53168376f2
	.xword	0xf3e4966b94510fa9
	.xword	0xfa36b448472043ca
	.xword	0x40a83923f1236f3d
	.xword	0x3873e30744509854
	.xword	0xb1d21dec2b5b85a7
	.xword	0x32ba56f24ca62d21
	.xword	0xa81de90501981163
	.xword	0xdb221e02c51a22e4
	.xword	0xc8ef6d763675b658
	.xword	0x1f6278e7883fcd22
	.xword	0xab54d07d39f40593
	.xword	0xa5b82e09656f00f6
	.xword	0x677ac64e93cdddcb
	.xword	0x35eb515535483333
	.xword	0xde5e72d995cfee6b
	.xword	0x81a67930c498a0af
	.xword	0x8a69c9845f142f20
	.xword	0x6981d9f1eae90be7
	.xword	0x12d18410cbf88086
	.xword	0xf0a7380491f36997
	.xword	0x2ac561f4db5572eb
	.xword	0xea55bdb9ebc59a21
	.xword	0xd58cdfb404535098
	.xword	0x5f027d2fce8b43f7
	.xword	0x6b481c68b846bc42
	.xword	0xd9289b9bbdea5edd
	.xword	0x7b6bebc036ea6684
	.xword	0x7e925d47ead22904
	.xword	0xf7aaf25c5b8664ae
	.xword	0x9f5646c4a163b422
	.xword	0xbbf813a5d38e08bd
	.xword	0xac9e4f422a2c53bc
	.xword	0x17588c7a061407bc
	.xword	0xda6ce2e07dec6757
	.xword	0xe39bdf0df94e7806
	.xword	0xea71eec6ee652e78
	.xword	0xcf05759c386d42b2
	.xword	0x950f02428f9b69a9
	.xword	0xa782ccb8d54b28a2
	.xword	0x39d1fa1a3626c134
	.xword	0xf1325aa2c8cea0dc
	.xword	0x3d9c7caf911ef4d1
	.xword	0xa69148831ba0d85f
	.xword	0xd79ebd6cc26c1f87
	.xword	0x210e3c9890a01c0a
	.xword	0xbc7257b270e8b401
	.xword	0x4b92dba3dd469161
	.xword	0x97f67e572fa8dd61
	.xword	0x3d0467b2d982e298
	.xword	0x6b0d987b1c6e3013
	.xword	0xf6881118269a8e3b
	.xword	0x7fcd13ed3496dc68
	.xword	0x6f8254f7352233ea
	.xword	0xdc87ed50dffb59e5
	.xword	0x9f0880f17fb7c481
	.xword	0x8f5fd2f2b0283070
	.xword	0xe12dc11f7d702621
	.xword	0x74dca3776d9a5135
	.xword	0xfac2fbd31b38bc11
	.xword	0x5f761300171c8a9c
	.xword	0x16876ddaef961176
	.xword	0x42ba71316ed4e1e9
	.xword	0x9a5cae82605608af
	.xword	0xe18d648a841d8ddd
	.xword	0x40fccc95513c3dee
	.xword	0x9e6a8cd6e742314d
	.xword	0xcfb62d4d6be92b68
	.xword	0x1b8b0ed870ba22b9
	.xword	0x2070c12dfd4dfb68
	.xword	0x055fe7d74c40ce0c
	.xword	0xa63484dadc6992ff
	.xword	0x6b2249faf4af9973
	.xword	0xae7ac8083c3e306f
	.xword	0xa1e518615de0dbd6
	.xword	0x26b273b3e0c5a553
	.xword	0xe4189760d96135ce
	.xword	0xdfe636a863fdcc97
	.xword	0x6b9de93baf7e8f13
	.xword	0x167c4a40945fc553
	.xword	0xdd153be85bf2e14e
	.xword	0x4b0dcb90a2f90556
	.xword	0x66717b539d40a093
	.xword	0xb93ae05b86c98be8
	.xword	0xb5d8edfaedc7a7db
	.xword	0x26b3795371083614
	.xword	0x63976c0e289e1aa0
	.xword	0x37c0a39ccacfc874
	.xword	0xfc7f3460b12509c4
	.xword	0x47e9c8aa2f775ff4
	.xword	0x70dc3ec4f4589528
	.xword	0xf58ed8430555fe0a
	.xword	0xaede99b9b92863de
	.xword	0x105565bc8a847994
	.xword	0xbf2b18249ce2a78c
	.xword	0xb8586122bd1b439d
	.xword	0x6ea1680b11962681
	.xword	0xdec8c4e863c79118
	.xword	0xe851805b86e24bf9
	.xword	0x34eaf7a22d9aab28
	.xword	0x8b79b2819925ef51
	.xword	0x9a5905166a4c4054
	.xword	0xd9f7a2a640af05e9
	.xword	0xafd29bbe61aadc9e
	.xword	0x65cd6ee3e8a4e3a3
	.xword	0xd724e656208b741e
	.xword	0x62144099fbc975da
	.xword	0x138ce288ea52df05
	.xword	0x9f92a05733251ce1
	.xword	0x166d643dcaea1ee9
	.xword	0x365094581e1eb833
	.xword	0x7dbaef867006e581
	.xword	0x41f72d5c09d481eb
	.xword	0x2f6fbb461fe96b56
	.xword	0x08ed63135ddea102
	.xword	0x980e53f289b38faf
	.xword	0x8e0602149d84de6a
	.xword	0xababba71c4752ea1
	.xword	0xad36db56fe7572fb
	.xword	0x182addd7cdfc5185
	.xword	0x16c3f6cf353b0a45
	.xword	0x39fd45df75442592
	.xword	0x5c3e97cc2a4ff372
	.xword	0xb32366d00941db67
	.xword	0xaaaccd44f761b004
	.xword	0xbf9c244a3b877d42
	.xword	0xd3e87741b267aa31
	.xword	0x7c6b04a81f2a9683
	.xword	0x0966316c3bf19906
	.xword	0x28644f377758bcd0
	.xword	0xdd8ab77dc6d781d4
	.xword	0x301f2c2758667934
	.xword	0x8f1cc09a75ecc684
	.xword	0xf4fc962e7b757b3b
	.xword	0xd402f6ed16878b5d
	.xword	0x6fca23104fdcc5f0
	.xword	0x8e8dce98b5c6f22f
	.xword	0x697a643b521b0dae
	.xword	0x60a1b84886a224f6
	.xword	0x25e6bc4d50a33ba7
	.xword	0x9f03807408caa4c4
	.xword	0xd783a8ac1a769be4
	.xword	0xc8a9d0e627d588c6
	.xword	0xf56defc1611a8c1a
	.xword	0x0876190b880409e4
	.xword	0x29f8776a1b18ca86
	.xword	0xae10af6ecd67fba9
	.xword	0x38ed3d724090e0e9
	.xword	0x83bf4591b4e0247d
	.xword	0x8b742f4d0b05383e
	.xword	0xa2e0ddb760d44ea5
	.xword	0x34ba2f894e8c6735
	.xword	0xded3e2754d25b2de
	.xword	0x8dff030e0b09e77a
	.xword	0x76d03c7b9752ca82
	.xword	0x77f0c2208a45a886
	.xword	0x802ac88c5c5c972f
	.xword	0x40c89fd0581798bd
	.xword	0xdea507f27bbf15d1
	.xword	0x1c53c1d4316b4c1b
	.xword	0x5228fe36470aebfc
	.xword	0xfe224f682ffe0658
	.xword	0xfbea537ca3a5b236
	.xword	0x9151b17809000927
	.xword	0xe4f2a0b9d9c771f9
	.xword	0x172cdeec15248528
	.xword	0x668130c56b1f84c0
	.xword	0x2759532258001327
	.xword	0x36a376a0b823012d
	.xword	0xcfe2fb79fded1e11
	.xword	0x8c402e8b7f3882df
	.xword	0x8c8c94c1c0dd81f5
	.xword	0x4a070df534952500
	.xword	0xa2c50525a3f66ce3
	.xword	0x4a1869afb63ebe4b
	.xword	0x70cf77cd83f9e740
	.xword	0x1c51fedada5c0da7
	.xword	0xcee61514dc517810
	.xword	0x63debccaaf08e4fc
	.xword	0x39f721280d59420f
	.xword	0x2efd5e444ad4a7fc
	.xword	0xcfeb170d744dc05d
	.xword	0xdf04eb77b15e2957
	.xword	0x1c5bea1df1bd88c3
	.xword	0xd0e80e22f55e7227
	.xword	0xccddb36a216a8fd8
	.xword	0xb60ac55ada9e4f7b
	.xword	0x1c0abe9f6d08f83c
	.xword	0x40400b98f8d88645
	.xword	0x2895c171a50118bc
	.xword	0xcc775791aaea8797
	.xword	0xf30d111e031ffb6c
	.xword	0xf2657c8ab8ce63bf
	.xword	0x0a321dd336ba9114
	.xword	0xe3c9b125f9ba5afa
	.xword	0x83b31210844f844f
	.xword	0x9909706a7dc9ef66
	.xword	0xd682afa12c43b285
	.xword	0x6ee11bdcb2d05257
	.xword	0xf903f2973dde91fa
	.xword	0x03e86922cdede4ef
	.xword	0xc6274cb73f4562a6
	.xword	0x117c5fab50049748
	.xword	0x00908b32144419c5
	.xword	0xe42006f256b6b15b
	.xword	0x322aa1517df60e48
	.xword	0xc5e13344d8a1c540
	.xword	0x22fc9d9d30534011
	.xword	0xec18494aa382bfe3
	.xword	0x6903fffc1de6555a
	.xword	0x65f1be41f593b59f
	.xword	0x06e74c985263a4f0
	.xword	0x13dfceb0095ea42d
	.xword	0x953e6f4e858b0a47
	.xword	0xc19ea04c1a16bd98
	.xword	0xa7c402d2d59e8585
	.xword	0x8941da66a5e8ca39
	.xword	0xa03b4af0d4c7e624
	.xword	0x1ca3214f285c39d0
	.xword	0x9bec385ef99a6bc0
	.xword	0x4b39b6ad9eb67cad
	.xword	0x4b24be577f135a77
	.xword	0xbeb379a831cde0ea
	.xword	0xa866598161f9c890
	.xword	0x9c537c0bdf4ccbd2
	.xword	0x8b428b5a4458dcc0
	.xword	0xa6db114e5d2c547a
	.xword	0x0472d1e56bbe575a
	.xword	0xb2121a168b7ef315
	.xword	0x0bb428725bacce0c
	.xword	0x38ec5a658e2649cb
	.xword	0x0a71ab873f820a94
	.xword	0x5caf7e6bf35436ed
	.xword	0x5bdb75cdd85c2b1a
	.xword	0x6e24a91d99126646
	.xword	0xf0f5b75f54486581
	.xword	0x0ecd71bec258c194
	.xword	0xac82cd57ef095154
	.xword	0x6933a197e1c45231
	.xword	0xe0985a0415f480b4
	.xword	0xba670b81b66cdd29
	.xword	0x1ad65d3521e80b54
	.xword	0xaa9f83f3c11aa765
	.xword	0x550bd05704c41869



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
	.xword	0x516ee6a11cace9fe
	.xword	0x769ee23a66601d92
	.xword	0x66e6f477236241f9
	.xword	0xcd935ae360b7925a
	.xword	0x8c273dd0a811bb22
	.xword	0xb6a51a079a35c729
	.xword	0x9e16257ffaa7319a
	.xword	0x02aa99f85d6d9e16
	.xword	0xf0229f7fd366dedd
	.xword	0x98b55973ba5cddfd
	.xword	0x9f7e9132cc0af2f5
	.xword	0x062131edf7617b86
	.xword	0x623eca6d88fc10a0
	.xword	0xbf2e9483c678c77d
	.xword	0x9188ee213283e5ce
	.xword	0x9e1a5b9f9fab19fa
	.xword	0x4046e7a54be49b89
	.xword	0x0c6ffc1aa50b4722
	.xword	0x2fa49fa80e909194
	.xword	0x38a9721bf1a09d8b
	.xword	0x893a4bfa9089c3d3
	.xword	0x0304213f05bc17a1
	.xword	0xc3a5a422656630f8
	.xword	0xab828ec1580b4455
	.xword	0xc035895b7d035fa6
	.xword	0x6651428c8eacdeb5
	.xword	0x03fe7f2b17e82a01
	.xword	0x4e3fde7a5e41fa73
	.xword	0xc8d06b076b75bccd
	.xword	0xbd22a811271a8d48
	.xword	0x82a9fafe93aaae2b
	.xword	0x9de4602ccda5f870
	.xword	0x9ffe81d388f6d7f7
	.xword	0x30461722352f008c
	.xword	0xa679c924c387d9a9
	.xword	0xb3c5dfd18bcb369a
	.xword	0x9622cd420d09e592
	.xword	0xd6d18ac4ff6ada77
	.xword	0x8132b79d6b533081
	.xword	0xd213f4f7b92f7e6b
	.xword	0x7025b12be74e4393
	.xword	0xc5ddf13f7c6408fd
	.xword	0x3de48279fac9cd52
	.xword	0xacf200eab2b68858
	.xword	0xae0b239194fb4923
	.xword	0xbf4088855561b1ad
	.xword	0x03f4c21b6d12f3f2
	.xword	0xadb6b39e08909512
	.xword	0x423b5a2471b1fbdb
	.xword	0x59173d67aa8b651d
	.xword	0x1bcda593f666db92
	.xword	0xcdd0c41f6caa14dd
	.xword	0xc4b5b6cadec84643
	.xword	0x28b724844423ceaf
	.xword	0x633b9208978f4e3e
	.xword	0xc5c230a810de31ad
	.xword	0x967a69623c3df63f
	.xword	0xc6573aa2513ec7ca
	.xword	0x97602e7a6d4fb3f7
	.xword	0xdb35fe00d08468d8
	.xword	0xad52d131389bf8f9
	.xword	0xec7c249f4e9c3acd
	.xword	0x2c5b52f5fd4172ef
	.xword	0xef74ce4e04fbf327
	.xword	0x2d3361325524875b
	.xword	0x35ea8409cd77178b
	.xword	0x7504e635a25067e9
	.xword	0x8b1fae5c6af76399
	.xword	0x71159d6df97fa743
	.xword	0x206aaed28daf7d6b
	.xword	0x3b91d00cb1adbda0
	.xword	0x9b11daa81e82c3e2
	.xword	0xa3db2411522b0787
	.xword	0x35dc0b13fc27003f
	.xword	0xc802378d23baa543
	.xword	0xd1cb9815a1eb5ab6
	.xword	0xfbeb0017dd2a54cb
	.xword	0x22a0157caaa1f6b9
	.xword	0x4970531fa7d88a58
	.xword	0x31dbb2661de98061
	.xword	0xd17765b183cb64a2
	.xword	0xc982d26de9887835
	.xword	0x189cf54d5d6350f3
	.xword	0xf8f98a10468be58b
	.xword	0x71fede846008dbb0
	.xword	0xccdc8cfa2b3e1faa
	.xword	0xc5d25e840c4300fb
	.xword	0xcb35f43eea989c02
	.xword	0x22363c7fd85295cb
	.xword	0xa1c0c829cfa831c8
	.xword	0x04c50b94284f3d1f
	.xword	0xc16006cd0bfdc135
	.xword	0x8a72c1088b012567
	.xword	0x1051b211ce1d25e2
	.xword	0xe342dddb064c51c2
	.xword	0x456ca96e61d0971d
	.xword	0xf49b4209ce9975c0
	.xword	0x7de6e3e6baf74f89
	.xword	0xc9ab46c9b06dd9b2
	.xword	0x3257783b6ebf9fa7
	.xword	0x38eaeeb9366c6d7c
	.xword	0x730f71530f807fee
	.xword	0xcb5088708f9c16e5
	.xword	0xd626759f95145d0c
	.xword	0xdd368d89e220e5f9
	.xword	0x3eb499a0e3af1ce8
	.xword	0x14122de2dc38b51a
	.xword	0xd99105aee6ab7179
	.xword	0xc430587b0c806482
	.xword	0x6a033384a71a3be6
	.xword	0x1d5a5e77bd9fd5db
	.xword	0x35aa2354f083ff69
	.xword	0xbb1cf73d6bd28221
	.xword	0x6727d3789728879b
	.xword	0x5dc1e6487478fde2
	.xword	0x99881fabdfc66f93
	.xword	0xe80181f833321efe
	.xword	0x1206def6315d181b
	.xword	0xf1b058de38f95279
	.xword	0xdba4b8fbd531cc75
	.xword	0xd21966a005b121ba
	.xword	0x843927c2c7affde9
	.xword	0xeb50075f07bd2816
	.xword	0x5cdef817478a0df7
	.xword	0x848373adf62210dd
	.xword	0xab0c5e7e5cd4f254
	.xword	0x824a4170096cf17d
	.xword	0x523852628e2a8428
	.xword	0xb9ce3df33df411c6
	.xword	0x485fce89278a8920
	.xword	0x9fdea3b1d74a6ce1
	.xword	0xd9d74ffa1fc5bb5b
	.xword	0x61241ccfeda76718
	.xword	0xa56cbe2755a38750
	.xword	0xac311fa3c4ea9ebc
	.xword	0x2fc1fe3ca26f5118
	.xword	0xa5c0987bf29f1ee4
	.xword	0xf6c19a201112e184
	.xword	0x8f882f685275a03b
	.xword	0x27ad0cc8178b4bd4
	.xword	0xc8cab96f7e640803
	.xword	0x554645660f170e78
	.xword	0x8f73dcae46bf3cc8
	.xword	0x229117a0379c5ebd
	.xword	0x3d5a552e27f0b738
	.xword	0x9689576dfdd68f5a
	.xword	0x237de0c136e6523f
	.xword	0x894da052481d25fb
	.xword	0xc3334c494e03ca5f
	.xword	0x320a66409e4c0da5
	.xword	0x35727ac3f9bb184a
	.xword	0x63adbe5401733b13
	.xword	0xc3ad0cd08dad09d5
	.xword	0xc5e7656c01e3ad6b
	.xword	0xb6cf36429d2c0c56
	.xword	0x02c22c004fe17083
	.xword	0x42eafc8f5a7d7bbf
	.xword	0x35853fd034f92621
	.xword	0x4bb395d5206d21b2
	.xword	0xe528bf2205df62f9
	.xword	0x291f730639528404
	.xword	0x0e45c4125a2207c3
	.xword	0x22bde2006a65abcd
	.xword	0x056aca4e311a8d3c
	.xword	0xaf5dbd9de343cb71
	.xword	0x2cd04ef34492463a
	.xword	0x77d95e014a682ab8
	.xword	0x489022a41fa2aa3a
	.xword	0xcec728c8772151cc
	.xword	0xe19502f236c3d4f7
	.xword	0xf6878521278f194c
	.xword	0x7051629cb6569b4c
	.xword	0x8443c4c536e2d440
	.xword	0x742a1e086d8649d4
	.xword	0x66750e4562b26d73
	.xword	0x24daedb38a1bb261
	.xword	0xecf8264afb26ee93
	.xword	0xac278e54bbf395d5
	.xword	0xf13486a761d35f67
	.xword	0xf74229907600599d
	.xword	0xe17760fc24762e2d
	.xword	0x8d9171af916f0111
	.xword	0x017de4ac92d719ff
	.xword	0xc6d5e553e9ed589a
	.xword	0x14a5679c27cbd78c
	.xword	0x3b56f1f73d17a500
	.xword	0x0c6c83fdda025cf2
	.xword	0x9280f42cd78c8b3f
	.xword	0xafa06fec763edf32
	.xword	0xf5354e0f0dfa18c3
	.xword	0x1bdac98873b1a80a
	.xword	0x110b506c303d9a47
	.xword	0xeaef3165e2487eb4
	.xword	0xe3d6aff103fb7d55
	.xword	0xe0cf3866bd56800b
	.xword	0x6d4e41f2149e4a69
	.xword	0x4df14aa55b777435
	.xword	0x4bcedb93bc4f2207
	.xword	0x980d26fb3a29e628
	.xword	0xbccc7f62135efa04
	.xword	0x0f625abcd1ba8c5e
	.xword	0x6185ef9e8aface8d
	.xword	0x8f217ab31326509b
	.xword	0x0653c15435284519
	.xword	0x917c1a7b94ee61b5
	.xword	0xa4bf1d5437e6004c
	.xword	0xe053b301c7bd7802
	.xword	0x816253d9ff322af8
	.xword	0x8b6b8756ed1dbbdd
	.xword	0x3a3c98039698302f
	.xword	0xfb1a1e0710f4476b
	.xword	0xd982ef68be9d51bd
	.xword	0xf3495d2509fd1f59
	.xword	0x09aa291be51b9b81
	.xword	0xad0f523633e31d61
	.xword	0xd9bc30958dec0cde
	.xword	0x2cd1a92d671ac574
	.xword	0x6010609c6a78c723
	.xword	0x6be7d9609b0b83fa
	.xword	0x62859ac493643e38
	.xword	0x4e3f7263cc1dd321
	.xword	0x3e803fc1a97c4620
	.xword	0x8ddc9c6def6fbb70
	.xword	0xddeac0254b881b6e
	.xword	0x3800b42fd6e945bf
	.xword	0x08ffe4d193d56e48
	.xword	0x3756997ea532d813
	.xword	0xf460b4cc955f63cc
	.xword	0xadfdb6de4406a36b
	.xword	0xa2c2fe3fee8bf961
	.xword	0x38c01b2078d4e8d9
	.xword	0x5a947418372e0767
	.xword	0x6cb51a5e601bb1d1
	.xword	0xf7d504a6e368491f
	.xword	0xf2579efe99cb3f20
	.xword	0x0190062abfb26182
	.xword	0x38e9fa6bf4beaa88
	.xword	0xe964a8a0f78b9bf5
	.xword	0xf9e245b6734177f5
	.xword	0xe45a216dd76cd07a
	.xword	0x84edf81fee41e20e
	.xword	0xd1f8c477ce93a2ac
	.xword	0x23385e58d1c2ec69
	.xword	0xd8c5b7dbc5be5dc0
	.xword	0xc8affeb8a233c1ef
	.xword	0x82c8515ebb551a74
	.xword	0xec2f3f25f2ad03c6
	.xword	0x99c179fef5a91e18
	.xword	0xbba90c496e2a8903
	.xword	0xba57f6a956b8e2fc
	.xword	0x348b19c572228ece
	.xword	0xb5ac9d7952cf22fa
	.xword	0xf32fc7dfca377604
	.xword	0x354f183a0c8a97eb
	.xword	0xcafcd636f09f3f25
	.xword	0x66b032e14f000eba



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
	.xword	0xc5596b20d75288cd
	.xword	0xcd6ae32d90f966e7
	.xword	0xd79befd31e1c3767
	.xword	0x24478302665e939b
	.xword	0x32862c5f10bbd43f
	.xword	0x6c66bd6379318af5
	.xword	0x0d1b4ed32ec23723
	.xword	0xde6f3e1caed3599c
	.xword	0x0996ab8883544dc0
	.xword	0xc909ac3e74789662
	.xword	0x83bcd91b12e22bc4
	.xword	0x9b417b2db048c5e7
	.xword	0xdeb47af34495c0bc
	.xword	0xb68fd322d3f46f42
	.xword	0x470c99e39954a758
	.xword	0x03f27819ef8f69e4
	.xword	0x9dfbebcdf92338e6
	.xword	0x3e332265be2f873b
	.xword	0x682b596855e5475c
	.xword	0x70a1c85066c2193b
	.xword	0x73be6c8d735e317f
	.xword	0x2540ef644d951bbd
	.xword	0xbf1dd91d7936d20c
	.xword	0x8e3682906c232b7e
	.xword	0x74630a61da070dab
	.xword	0xacb571ccc40444a0
	.xword	0xd649212b5af6bfd9
	.xword	0x5229e3843574f26e
	.xword	0x9b79345dcecfbe06
	.xword	0xd4ea7d3f8005267c
	.xword	0x1ece050339a1c6e1
	.xword	0xe35634d9bf3a4c2a
	.xword	0x0c72a513f46c7e19
	.xword	0xd55bd130e71353b6
	.xword	0xd6dadadfef8f8890
	.xword	0x5b5f872400de5850
	.xword	0x78c1f0818db631ce
	.xword	0xf82e9ace2a75b1ef
	.xword	0x2fc8f12e6d295103
	.xword	0xca41f7076ff28e4c
	.xword	0xe4249b9196c379fb
	.xword	0xdba28b83a5637b1e
	.xword	0x47fe8e361e5a9232
	.xword	0x287560afb43a042e
	.xword	0x7200c8cbe988c315
	.xword	0x46b7ae121f4775f6
	.xword	0x8cd1ad4e4ec32f07
	.xword	0x7e8f31cab831a6ad
	.xword	0x2176c9c5b6c096de
	.xword	0xb1f0ca7ec7db669e
	.xword	0x84eadc101aef2277
	.xword	0x315921fd123d8047
	.xword	0x579f9d08536d65e3
	.xword	0xbeaabad4e672243e
	.xword	0x27cee43487fe348b
	.xword	0x575d3bb51a63df75
	.xword	0xd3384e7917b065cc
	.xword	0x409c75f249589ea4
	.xword	0x37b68fbe5089be15
	.xword	0x226994a454143973
	.xword	0xb3ec4b06aa992d57
	.xword	0x92614b7d616d3355
	.xword	0x6dc2b34d3d02ce11
	.xword	0x84772cc3d2811a94
	.xword	0xbe058a25eac7af93
	.xword	0xe2f15d95ed55c9e2
	.xword	0xa95c30c421310e68
	.xword	0x0ec176404ab57d2a
	.xword	0x477bcd41db492e69
	.xword	0x91d5d15f412911b4
	.xword	0x1ba8e683d74dbb87
	.xword	0xcae836b6520e03a4
	.xword	0x4e9ff06e868bc120
	.xword	0x15c9f31348cf7e0e
	.xword	0x152124704640b1f6
	.xword	0xd93c4e671111d339
	.xword	0xf9b992f587c0f09f
	.xword	0xb75898d5a6d8701b
	.xword	0x69a80e6c443182ab
	.xword	0x733e4ecaf4c869c6
	.xword	0x20f1aa85d7637e48
	.xword	0x1b640cd99cd6673e
	.xword	0x840b3df6d72179a4
	.xword	0x4d5ed91c28b259ac
	.xword	0xdd38f988855f1caf
	.xword	0x8b0115cb1868dbf3
	.xword	0x292bb9bb5cd5261f
	.xword	0x60e389ebdca0c639
	.xword	0xdc1b227e77f4e590
	.xword	0xc67c9a9f94cc4ac2
	.xword	0x3690cf9d0bc74a93
	.xword	0x7ccb2c37704c595f
	.xword	0x56caa8c85c98b4cb
	.xword	0xafdf3aa84c99892c
	.xword	0x7b751eac97e672bf
	.xword	0xa11a2d3e9fcb7ef1
	.xword	0xdf1330a58ed52762
	.xword	0x609aa086a0db7c9c
	.xword	0xa2f32e57dcb4f8bf
	.xword	0xfa5f37acb75fbdb4
	.xword	0x91a6e0be1fb05963
	.xword	0xef7e97b3d6015f27
	.xword	0x6c33bbcf1991672a
	.xword	0x4afd1bca68e89870
	.xword	0xb7da0cd447e1ee1a
	.xword	0x650a20556c246e6a
	.xword	0xa0736ae127e6c7af
	.xword	0xd83870856fa28e6a
	.xword	0xb991e208ca0b0a25
	.xword	0x3efdd3d7137c83d9
	.xword	0xe263189489d654af
	.xword	0x4d5f5ed0895422e6
	.xword	0x63814031dc95b89a
	.xword	0xf9261e4fa5c7684e
	.xword	0xce68bcfd9db6e555
	.xword	0x4c51076ca61579d5
	.xword	0xd0b917358cb8973c
	.xword	0x5e24d71347c9b49b
	.xword	0x0a6953343ba3ec68
	.xword	0xae6bde837f7b6a45
	.xword	0xe86617cb6363a862
	.xword	0xccf91f31c5bfca40
	.xword	0x7339b8ce6fe85bd1
	.xword	0x0d6d121f760f3a59
	.xword	0x88671f5a42b3d5e8
	.xword	0x0b0a0819b375303e
	.xword	0xf6c2df44e1707e3e
	.xword	0x365037dc8e5f1d3d
	.xword	0x5ba8f3e39b8d0d6e
	.xword	0xe444ffee4981e48d
	.xword	0xe0b6a05b19dedf4c
	.xword	0x2e6d5c7e620ddf09
	.xword	0x8177603022986e6f
	.xword	0x453140e18c612f35
	.xword	0x6dd9965c6654c482
	.xword	0xf3cd2320e54e5b61
	.xword	0xdba0034ea5da2fa3
	.xword	0xa4ad2d340d9dd63e
	.xword	0x3345a56ec37c6ae4
	.xword	0xf4d30ec986845085
	.xword	0x800e70684d8d355c
	.xword	0xe2396a19c3017e61
	.xword	0x037062b7005692ee
	.xword	0x42df06e5081639d7
	.xword	0xd39c494f44b6809c
	.xword	0xd77ae94f53e51d20
	.xword	0x182f726411755e8d
	.xword	0x143286cd7ba7131b
	.xword	0x4f5d2f3dcca59643
	.xword	0xcbe419bfc96780d9
	.xword	0x31ecaaa1b879f6c7
	.xword	0x92852e893236c9bb
	.xword	0xd113d0a07d969618
	.xword	0xda71e9dc6576e61c
	.xword	0xfe2a8da99283e00a
	.xword	0x801047a6d6241caf
	.xword	0x558886b2d4c3a200
	.xword	0x9ed4dc7b40cdaaad
	.xword	0x3488093b82d178ca
	.xword	0xa5bb9a93d67882bc
	.xword	0xfe3b45da8e35d185
	.xword	0x568b4e87e3ea13ee
	.xword	0x966b50001db2cabd
	.xword	0x2dca394bd152b8b2
	.xword	0x175b9321371b5a9c
	.xword	0x02f42285a483690c
	.xword	0x8ad56ae05ceb2980
	.xword	0x00bdde0b171e5e9e
	.xword	0x1a9f12622fb034e9
	.xword	0x1cf438ef2b18fec1
	.xword	0x7ddd3e0c498bad80
	.xword	0xb70d218dd0c51023
	.xword	0xa17d067716271adf
	.xword	0xa327894b54341312
	.xword	0x44fdad6812a17c1f
	.xword	0xefbaa9e483a6576d
	.xword	0xb0f7e2f2343e2d37
	.xword	0x4e6dc717ec463d29
	.xword	0x64fa6481625d239a
	.xword	0x4f3575a3294966c6
	.xword	0xf8af6e4e9baa0f45
	.xword	0xce8b48b6181f5e2e
	.xword	0x9e004c2002111809
	.xword	0x7e2110a114a18e51
	.xword	0xf9c0630d10e69f26
	.xword	0xbab8684bc5f35bba
	.xword	0x98a1d6eb675e6e7d
	.xword	0xd216e3a967102e66
	.xword	0x0ffc00aa886d0c93
	.xword	0x0195912b95a9ea9c
	.xword	0x1796e7b82deea10b
	.xword	0x36d245c4a4da6705
	.xword	0xcf6fc3b0440dab40
	.xword	0x9d03284b742e57be
	.xword	0x4e012f958920b4b3
	.xword	0x4bde366504448177
	.xword	0x82ef0a5d79c64a51
	.xword	0x022f818dfa7deee3
	.xword	0x7d19d86b54bc53bd
	.xword	0x2e7393f4e679d3c3
	.xword	0xf9cb3a787d7e7b41
	.xword	0x6f214e1e27dcc300
	.xword	0xd3c3503d68823b37
	.xword	0x59b623dba529c079
	.xword	0x297a293317964ac9
	.xword	0x47eebdd58184ea15
	.xword	0xf54bea8dc93c2ef6
	.xword	0x6f34fcb8c6a6ebe6
	.xword	0x3c85c8aa6f88cfe8
	.xword	0x0914a96ab03c5a1f
	.xword	0xdf58ef0f5533bca2
	.xword	0x2d605834502fbd8a
	.xword	0xa15544d9389be84f
	.xword	0x10b79159141c49dd
	.xword	0x6c7f616385fd436b
	.xword	0x9ef73f46ee75adee
	.xword	0x682702e70d621460
	.xword	0xaae3fba8d3562f82
	.xword	0x16ad3a0f9dbde026
	.xword	0x5ebd3e68dad50756
	.xword	0xf46902769ec79e06
	.xword	0x160d4955a57ec3b3
	.xword	0xc548eb938c1ca871
	.xword	0x627f5aec8bbe4ef1
	.xword	0x551c8d8c3117c3c0
	.xword	0xf1ba3c395b8c1ead
	.xword	0x946c5a69bb6ad838
	.xword	0xf7708c52dab071e7
	.xword	0x4557a990d2175d7c
	.xword	0x672dd7e980f98142
	.xword	0x7a53d9c57ef821fd
	.xword	0x4fed94f90941d44c
	.xword	0xc8687e3e27812190
	.xword	0xbcf3b01f80a50edd
	.xword	0x97ece76641983c07
	.xword	0x825f5e050c908b2b
	.xword	0x43d21fb40de00160
	.xword	0xdb68054db563a579
	.xword	0x6f8646873d599bab
	.xword	0x61e081b95d8ff07c
	.xword	0xbf50950d02eceedf
	.xword	0x3765eb6280623ee7
	.xword	0x901fba952352575a
	.xword	0x81118020eb9d39a5
	.xword	0x22376d13181149be
	.xword	0x277dabaa40e50693
	.xword	0x72459a4075591395
	.xword	0xe26a6c5004c1cdc9
	.xword	0x944ee75a1fdce66e
	.xword	0xec5ea3a68703adac
	.xword	0x2f597fe214321e32
	.xword	0xb3635effd77092c9
	.xword	0x314214b561dbf89b
	.xword	0xa7cc038fdea97541
	.xword	0xf0c7965ec63be162
	.xword	0x18b565a36f48596e



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
	.xword	0x3daaa3bac6aa6bd7
	.xword	0x48f654320dd5f30e
	.xword	0x5b990de4bfe12016
	.xword	0xa6ac8e0de8f188be
	.xword	0x07134a1ad26724f9
	.xword	0x6c31a1c2b63ea920
	.xword	0xd27c2eb4bf78cce5
	.xword	0x41eed7bf7d6ffe3b
	.xword	0x7c7976e4f378f9fa
	.xword	0x7901e175c0503570
	.xword	0x2d5509a3563c972f
	.xword	0xfc90aa5497779981
	.xword	0x8f26660379cd3555
	.xword	0x0f90434a2ba10ee4
	.xword	0xe9eb95d779a03488
	.xword	0xaf11582b987a7528
	.xword	0x82705999230d0a92
	.xword	0x1aee561b16686cc5
	.xword	0x27556b5e9b4f13f6
	.xword	0x7602e86b1d2bcde8
	.xword	0x1e5a8112139b2b3f
	.xword	0xcc85b0d63cf77b27
	.xword	0x890f6c6531b8df3a
	.xword	0x4e4a384dd7c09f37
	.xword	0x908a23f01b81c21d
	.xword	0xe13d93bac0825eb6
	.xword	0x2c9442cbf9c18f39
	.xword	0xdc2a1ac9ea559085
	.xword	0xc74bb39e8b63a87d
	.xword	0x0eeb288cbf6d15d3
	.xword	0xcb5591b62192a7bf
	.xword	0xc0bb80b7ecc3f099
	.xword	0x343c07f2485c9c81
	.xword	0x8f946691d9365ee0
	.xword	0xc2affc61c35d69e4
	.xword	0x4b9ecefcb7580815
	.xword	0xdf4f856c37cfd32f
	.xword	0xdbaf8fd1d65397c1
	.xword	0x98b4c674b7345760
	.xword	0xf4d1f5f62b69e705
	.xword	0x82d5b1ba03a612af
	.xword	0xe3105524c59923c0
	.xword	0x787544ae97fb768b
	.xword	0x36a1a5190aa9e998
	.xword	0x713dc2e610f52615
	.xword	0x368c4d2359f07ba9
	.xword	0xd3b30fc7c29e2a1c
	.xword	0xc08f1823e2cd72b9
	.xword	0xbee950efdbecd041
	.xword	0x373c06868de3fbac
	.xword	0xbb5ccb1ddf6908ef
	.xword	0xa36193c2e470ce6f
	.xword	0x3064bec1d6b35197
	.xword	0x85460bbe09617266
	.xword	0x823833c2d6ad7f78
	.xword	0xccbb8b6f6318b34b
	.xword	0x6d651f4b8212e89f
	.xword	0xc1cdeb1e1043479c
	.xword	0xac6a56200d7bfd28
	.xword	0xac3b4ec3aff177eb
	.xword	0x54bb989bcaca5b99
	.xword	0xe3993dd06bec0042
	.xword	0x8461e1fcc25fae4e
	.xword	0x6bc7ddf2577b762f
	.xword	0x5b350eb9ae65435e
	.xword	0xc6b301e85c4cd7fe
	.xword	0x8baad1c5a7e9d765
	.xword	0xa92ceba70a914fbc
	.xword	0x5acff36dd6bde1bd
	.xword	0x1092c951edcff540
	.xword	0xa9d4ca46e80063f7
	.xword	0xc00ced788e052107
	.xword	0x6c87fb1fc51521d3
	.xword	0xecf9ce28899466bd
	.xword	0xf2602c7b43ce404a
	.xword	0xc79a9c725f7727f1
	.xword	0x6ef0c64892b045a7
	.xword	0xaa5534feb816414b
	.xword	0x72bc6db0883ed76e
	.xword	0xaa8478e5d3702d57
	.xword	0xc6152610d3476ca9
	.xword	0x82f89c73714f3892
	.xword	0x5ddb2ee03a8fdd10
	.xword	0x4711f1611efe632c
	.xword	0x6d6b8d4179c7d106
	.xword	0x69fe6425d0656b44
	.xword	0xb941a928147827af
	.xword	0x456aa584069ef631
	.xword	0x7bb82de6d5949d54
	.xword	0xb5d697bdcdc8c809
	.xword	0x36ec359f8e496142
	.xword	0x93e41a49c73e93f1
	.xword	0x942e4f919dd4ee78
	.xword	0xbd2b655d026a9026
	.xword	0x8f721a8e688f7b04
	.xword	0x6990b06d6ee028b9
	.xword	0xf4845a3f1fa682f9
	.xword	0x12d904ecdc560e7a
	.xword	0xa74330d3f62f96fd
	.xword	0x37265c45205cd8d8
	.xword	0xd4f73aadb7fab0e6
	.xword	0x7e5fe9a47057ab64
	.xword	0x7be89c2edd1afb6e
	.xword	0x08d5dec1908995eb
	.xword	0x5e3a1ca3e307e7b6
	.xword	0xd4b1f04aaa9252fb
	.xword	0xe3996e32f042cfaa
	.xword	0x7f8bc537e8580d74
	.xword	0xc7c354c322ba9c17
	.xword	0x0ee9a0c71bbb8e55
	.xword	0x17920817591fc678
	.xword	0x662003cd34ac6bdc
	.xword	0x40c36690cb8d1e8e
	.xword	0xba8d003906792f60
	.xword	0xcd908b24484b4a35
	.xword	0x42b113d9872d843e
	.xword	0x64d397aa2790f725
	.xword	0x6ff454d4e5731062
	.xword	0xcd0d13b8c6a8cda3
	.xword	0xcf1a06a2051eabba
	.xword	0x460706f4c28eb49c
	.xword	0xf0a2f10353320dd7
	.xword	0x7109c8783fd83340
	.xword	0x79f42c13168f244c
	.xword	0x571bf30199875a89
	.xword	0x8b2761d308eff986
	.xword	0xb2aa4812012a04cb
	.xword	0xa9e34b2d3d24196a
	.xword	0xc394832e004009fa
	.xword	0xbc54b833349f0296
	.xword	0xfbb145efd7ec80fa
	.xword	0xe8205e92efbba63a
	.xword	0xa7c5221e4a01fd75
	.xword	0x4cae5bdf65eca84f
	.xword	0x78d51bd0d8618639
	.xword	0xc4ae53840ec37c7e
	.xword	0xc5b60dc70155f5d6
	.xword	0xef5705f491d54b70
	.xword	0xc0ab97faf7eb784f
	.xword	0x079b905cf6775307
	.xword	0x437c44bfc91806ea
	.xword	0x0377c3ae0f59622b
	.xword	0x00197249889d5118
	.xword	0x10465f21780118b4
	.xword	0xa67b0b6239239e11
	.xword	0x8c1c67328f6b2abf
	.xword	0x3ffc229f23e7e5d6
	.xword	0xaa02042d1629581b
	.xword	0xc713c3eb8dcb05c1
	.xword	0x3e8bbf1a1d99d33f
	.xword	0x00cab9b91a6f07e5
	.xword	0xdd0715e899c84c43
	.xword	0x3843547dac27b672
	.xword	0xf35c8389c14e1fbe
	.xword	0xf25024c4c51af62f
	.xword	0x3b9a0a1e722e6779
	.xword	0xd3f142a0feaf7d4e
	.xword	0x3aaaff120f390c54
	.xword	0x11c363d4344b0b4c
	.xword	0x0026f9af084afce9
	.xword	0xaf66501ac5bf300f
	.xword	0xe4c7d227ca7488e7
	.xword	0xf0c44a37ac2a7651
	.xword	0xe17838a6e5736bc1
	.xword	0x02a6491007684c32
	.xword	0xb7216d5a2f8175cc
	.xword	0x5bfcc33141609f8a
	.xword	0xc0a6978e4775a0f1
	.xword	0x88d2ff6565bbcca7
	.xword	0x43048a5ef97361a5
	.xword	0x7df741a16b118c9a
	.xword	0xb0c383b954e57b36
	.xword	0xd0518e112b33d4ca
	.xword	0xe43eb01d819130e3
	.xword	0xe96319ab59cdf388
	.xword	0xac03227224e4dbfb
	.xword	0x2c8a00a121746e3c
	.xword	0xc2344513df3a9c5d
	.xword	0x9f567802cf2a04a2
	.xword	0xaff9a2cb43c0b2a8
	.xword	0x06c3fde7ae317baf
	.xword	0x0603658d7c85f06e
	.xword	0x46d2af7f2f67089f
	.xword	0x4a3cad22c45ad8a3
	.xword	0x0aef462aa2785838
	.xword	0x9344bd2da1b0b66a
	.xword	0xbc6b26af7a002ed9
	.xword	0x831eed1b0398ce7b
	.xword	0x6c77f27c81e0fa9e
	.xword	0xa67a5df714546f99
	.xword	0xb97e7c177334642c
	.xword	0x10d0c83b70577a4a
	.xword	0x7a870be5bebec087
	.xword	0x2a32d674d1dbff4e
	.xword	0x011d314004f0060a
	.xword	0x67ed0b105e660cc4
	.xword	0x2707d30126654a84
	.xword	0x0d2dda04f3d68e98
	.xword	0x4cb9fe5ca8f27137
	.xword	0x7ed7b4f9ae261a3a
	.xword	0x263b9a3cceae150a
	.xword	0x01d484cdd5abf012
	.xword	0x1e8964c9d85315c4
	.xword	0x61cf4ad38de5cbf1
	.xword	0x7b3c28d79d1a8c66
	.xword	0xf7df01c88a4170dd
	.xword	0x475e81d31b24669e
	.xword	0x2b9cd30da3d5557a
	.xword	0x5e1c0c332b495ead
	.xword	0xb9872a487de41a2a
	.xword	0x3cf845e1d8114d36
	.xword	0xed844434886d5ddc
	.xword	0x657e03e5a56ad13a
	.xword	0xa45923cd99b0b4e8
	.xword	0xb7256e71670693a6
	.xword	0x72ea0fbd0a53ff96
	.xword	0xac986a4edbbb9e56
	.xword	0x38700618c202b570
	.xword	0x7954fe8b9786bb3f
	.xword	0x53cffb679719d703
	.xword	0xfe2be3e7833a8dfe
	.xword	0xc9daca21bbc440bb
	.xword	0xf7dede841a048a56
	.xword	0xca871acb3316fe42
	.xword	0x988c3eb701d913e0
	.xword	0x6a41d8b2b754d2e3
	.xword	0xe3e59773498e26f9
	.xword	0xf9af58241416a60a
	.xword	0xf7a4278f2aa23a74
	.xword	0x1725e00a542a5d97
	.xword	0x4c3658cdd96ca962
	.xword	0xbe69e8c84feae47f
	.xword	0x5d8edca7f41610f1
	.xword	0x677b714276cdc3fb
	.xword	0x75ef8760ad986bbd
	.xword	0xd3dd3be8caf48c3d
	.xword	0x8d3fbe9a2a4efb94
	.xword	0xd3c82970d1f896ae
	.xword	0x3e0725832cce1e90
	.xword	0x73cc2a2fe0b96efe
	.xword	0x44edc9d0f7d52777
	.xword	0xa0b79d9574a10866
	.xword	0xa753b09988d944a7
	.xword	0x85fe766f67975963
	.xword	0xbafe4529bad95760
	.xword	0x1d06aba3f8a75824
	.xword	0xc42ecb3cb8e5f0c1
	.xword	0x389005cd7ced740c
	.xword	0x1ad40b58164f8eff
	.xword	0x85daa9856929f841
	.xword	0xf11b5e23b569031a
	.xword	0xda93897dbed27a33
	.xword	0x8ed42d1520c8d63d
	.xword	0x3e2437260187361e
	.xword	0xfaedb78e32deff95
	.xword	0x887d6ed6a1e42f26



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
	.xword	0xf744be4d8ebe109b
	.xword	0x475fcd243de36f9e
	.xword	0x1e922440c21e9201
	.xword	0x9ca9ae5c269144b9
	.xword	0x48e3c026ea18c896
	.xword	0x4fbeb9cf8e79d143
	.xword	0x94930a6081fc4a90
	.xword	0x8cc7b02a9710fe4b
	.xword	0xdaef181e7a15b956
	.xword	0xcc7546dd19a43775
	.xword	0x5da387519a936c48
	.xword	0xab94be6cbe7c228d
	.xword	0xb087f208fa39582c
	.xword	0x70417d05eb253e65
	.xword	0xd9d7c47567248116
	.xword	0x80d4c54a1ba00596
	.xword	0xc245b6830706a6ac
	.xword	0xb0ea354dba2147aa
	.xword	0xcd3161f3d7b83348
	.xword	0xf39fee6bbd1164b1
	.xword	0xaa48f6c86d1cb8bf
	.xword	0x26a3a12f17efac06
	.xword	0x735c6461f015adab
	.xword	0x28025476665e96c4
	.xword	0xea656bfda98925bd
	.xword	0xdb38f72523cd2e8c
	.xword	0xb3e14d41188a37bd
	.xword	0xb1478f848b9d87ff
	.xword	0xb1b626dc6f4bdfa3
	.xword	0x2a7611e6d09faeb9
	.xword	0x13481e335fe9a295
	.xword	0xb2c387cacc6ee255
	.xword	0x3f864ca664976a9e
	.xword	0x4fdcb20df4d029f6
	.xword	0x3a3ecce9196b84c0
	.xword	0xa70c8b3dd001af39
	.xword	0xbdca746f9f19e212
	.xword	0xd34a45ceef443b10
	.xword	0xa1f2725b8abae86c
	.xword	0x3c97d1cec47a963a
	.xword	0x2aaf919146744f68
	.xword	0x9218d2af0db319b1
	.xword	0x9c5cc6c95924edd9
	.xword	0x327ec9f209a9093f
	.xword	0x13c8747f48f4ad2c
	.xword	0x437b57f161300f33
	.xword	0x5db4b3f27974ef4a
	.xword	0x587aaa359db518e9
	.xword	0x2ba5a2d4a384ba39
	.xword	0x5cc54cdcd5088766
	.xword	0x94d18799300b3980
	.xword	0x08924073c4cbf7be
	.xword	0x5da698807b8f68a7
	.xword	0x952e2ff6e0b16fbe
	.xword	0x4e2f1cc8bb974773
	.xword	0x01d46100bc9f120b
	.xword	0x82dd8778d161903b
	.xword	0xeaac30ec2d17194a
	.xword	0x2da800c41c87542f
	.xword	0x2529cdeb1c141d0a
	.xword	0x2ac77f751396e0ca
	.xword	0xcb1f247b100c10ce
	.xword	0x625d2d663fe1b500
	.xword	0x63c91f73566e2b7d
	.xword	0xdf0b7750e02ef0c7
	.xword	0x46b6aff83fc443c6
	.xword	0xb96f1ef4a3e8c0ae
	.xword	0x37ee70293ed9c5c6
	.xword	0x986a76ae3c230da4
	.xword	0x4c963932fa1e23f8
	.xword	0x841610b010528a89
	.xword	0x8fc7783c53fe782b
	.xword	0x73db8136f54956eb
	.xword	0x5f2c7eef6e0fee56
	.xword	0x99b4577c160b1ce9
	.xword	0xf826bf2ac77b2aa9
	.xword	0x7db1f94f7a21ece9
	.xword	0x59e773aab838840d
	.xword	0x996f810d6913f8dc
	.xword	0xe6b7ae0b687e8ac2
	.xword	0xba501929e543a11d
	.xword	0x7c695cd142c4b890
	.xword	0x8da9b81193e3db79
	.xword	0xadf00f2cdd077c3f
	.xword	0x4f8cb02e10ab8707
	.xword	0x174a11a77bf41dad
	.xword	0x40150e7d940ea0b2
	.xword	0xfb42751e18faea47
	.xword	0x6e042ab476cc62bf
	.xword	0x49e6ce78141e4129
	.xword	0xc99fdaecddf9f9c0
	.xword	0xa38461b9f9e89e18
	.xword	0x9a478dcbc7250028
	.xword	0xb0dcc856b175f3d3
	.xword	0x0e7709a414a1eeb8
	.xword	0xf3694b85b7ec1a93
	.xword	0xabca9251e3cc72fb
	.xword	0x929470a94cb190b8
	.xword	0x9b712001c5e72757
	.xword	0x57d081c4f250adb8
	.xword	0x54f092ae9e3bafdb
	.xword	0xd58bfe7a86585645
	.xword	0x7fa1be9f79b458aa
	.xword	0x36335f8612347545
	.xword	0x05d8153109935176
	.xword	0x7cb9f786c639307d
	.xword	0x355fa6c51089d3e6
	.xword	0x48b59e3d7eb2441d
	.xword	0xf8f9c80c2f2c48f2
	.xword	0x2739f47da6bbeec6
	.xword	0xde4dd04293263e15
	.xword	0x45601fd0d70f68c0
	.xword	0xa7cabf8c2988baff
	.xword	0x480083f101232923
	.xword	0xb4b155d5581cbf99
	.xword	0xa57969b19436619b
	.xword	0xbe789dcd966123ac
	.xword	0xe25a06ad2e9d4c95
	.xword	0x111219a218fa0f69
	.xword	0xafd68f43fd2bd6e9
	.xword	0x9eeb03fc9d64b88f
	.xword	0x785e339036efa168
	.xword	0xfa9b03e64d1c14bb
	.xword	0xc0ec06b5b2d179a0
	.xword	0x895a2e0838addee1
	.xword	0x30ca092c2470320f
	.xword	0x200293bfb59dad49
	.xword	0xb90f18fbc0088af8
	.xword	0x05fec7e4ee587701
	.xword	0x5926ddfbcc21a78a
	.xword	0xacc29714d8affd8b
	.xword	0x32fff23020e4bd37
	.xword	0x447fa12bab7fc394
	.xword	0xe4eb084f53aaa474
	.xword	0x7dc72aecd6ffe17d
	.xword	0xcc6a05abcf62d62f
	.xword	0xbb5599ff080a1184
	.xword	0xdba86419056452e3
	.xword	0xbf0abfdeb164f01e
	.xword	0x46ba0d273106ba91
	.xword	0x22f23acc928086dc
	.xword	0x0fe8117d49447692
	.xword	0x57c35280b0d31a66
	.xword	0x426c35032eba5a5e
	.xword	0xaffa2eb43d0784b2
	.xword	0x97c46552808ec92b
	.xword	0x456c8aeecad8897a
	.xword	0x308d742ed9ad6bae
	.xword	0x7194e4e7c8cf0824
	.xword	0x9f9c962f21bda554
	.xword	0xea0d4a53c284cd60
	.xword	0xd70cb41af6d2315e
	.xword	0xe4b5c625c0e657ed
	.xword	0x77fca39d78f07058
	.xword	0x176267428c7fae0d
	.xword	0x3baaf2c29342b734
	.xword	0x5ddbe633a00ba489
	.xword	0xb043dadecd84c47a
	.xword	0xea2861eda58d68bc
	.xword	0xdb5b5de770015dcf
	.xword	0xbbe1e9045228f2ea
	.xword	0x6073c5afa0488060
	.xword	0xd764b2b380b1a680
	.xword	0xe9d79b9d4e267afa
	.xword	0x5f5023672934d896
	.xword	0x9f4de14933544ea2
	.xword	0x1b2a6b93287cb3a8
	.xword	0xeef23a6a1da7dd01
	.xword	0x4e510fb9e9317a2f
	.xword	0x57e5c8fa7ab09e8d
	.xword	0x23ce8e9be3bafe6f
	.xword	0xf7a2bcb85b956054
	.xword	0x7c722ae6ece7ac9d
	.xword	0xeb15d3a13c63e7b1
	.xword	0x0cb1268a1b20f77b
	.xword	0x518dae8b3ff6dac3
	.xword	0x569c5efc52c37eae
	.xword	0x4359b36006f7da7f
	.xword	0x45df0a3749251cb8
	.xword	0xe9ea753bbd246b4a
	.xword	0x913f539101b8aa31
	.xword	0xae450d53f70e6ba6
	.xword	0xd3cb9344a05daa4a
	.xword	0xc6e3731b1483ff24
	.xword	0x1b9b28407fb4b5b9
	.xword	0xe93babc30bcc5294
	.xword	0xdc51971cb7e305ab
	.xword	0xdcc35967c378e0d2
	.xword	0x5e208747c150a8fc
	.xword	0x3470a91dc68a5559
	.xword	0xfc49dd9f28ae5e42
	.xword	0xf63a911dbe959588
	.xword	0xddb6c4473c61bbea
	.xword	0xdb3dc24cfd1502f2
	.xword	0x4683ceb5d2350d1c
	.xword	0x490cdb3cffe3df8e
	.xword	0x30711a092e040b08
	.xword	0xc6f9cc292f99fed9
	.xword	0x9f3d5bb51e9e6e1b
	.xword	0x5b0865af6c7044a8
	.xword	0x7b995bb7e93ed98e
	.xword	0xbd1458abc064d008
	.xword	0xcc4111c1f748cc87
	.xword	0xb53194c12c17bc6c
	.xword	0xa73e27874bde1223
	.xword	0xf7c108bb09e64a1a
	.xword	0x7a0d47ae9c4cbc03
	.xword	0xf08d435b7c6a00f2
	.xword	0x35ccf7a661a72f18
	.xword	0xadb79e2fd1e09b81
	.xword	0xbd14d1dc2722c098
	.xword	0xd85e36500850892d
	.xword	0x0d57a971bbb88a68
	.xword	0xba8069cf16e1456b
	.xword	0x546489b5c1b3db71
	.xword	0x15e94657e10cdde8
	.xword	0x0e20c87420fae40b
	.xword	0xebff58aca1442e67
	.xword	0x0b20c855733c9dda
	.xword	0x7732001355d9c299
	.xword	0x59cb1153e9f27be9
	.xword	0x5fd365c53b2cb6d2
	.xword	0xb2277014df3e0995
	.xword	0x01834c791275ff00
	.xword	0x0ba35b1d9abe60be
	.xword	0xaeccd931bd549315
	.xword	0x6c8c42a8a4581a58
	.xword	0x8fa5e9456000dfef
	.xword	0xebf83f7dad11fb4f
	.xword	0x2fc9fb326176d7d8
	.xword	0x3b28054ecbc5c76f
	.xword	0x1cfac780b5852064
	.xword	0x105f38edaeb97de6
	.xword	0x058e71499f5facac
	.xword	0x1cca65cac023330f
	.xword	0xe556c964cf6fe4bf
	.xword	0xa7f266eaa012d11d
	.xword	0x718b11c18da3db9d
	.xword	0x57db693c97d85c36
	.xword	0x6b1c593f04ba5819
	.xword	0x81acd42d1e17c8dc
	.xword	0xeb4b7f366f78d054
	.xword	0xe6cf0a3d19e82779
	.xword	0x6f807a26360f41ce
	.xword	0x2e555d2aa27a6576
	.xword	0x87b33937380bf170
	.xword	0x7f736f1b1cb8dc7e
	.xword	0x85ee6f17cf952d55
	.xword	0x75a28038616da018
	.xword	0x5d1b5bb4848d9af6
	.xword	0x2ae0e1fc564ea25d
	.xword	0x79b6438f7cc3fc8f
	.xword	0x71f251964fc33f5a
	.xword	0x3b6fef54232f33ff
	.xword	0x96e0589b678051fd
	.xword	0x1b79f0ac71503bf3



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
	.xword	0xf173d514cfeb2eb1
	.xword	0x5593ede90182371f
	.xword	0x636f4d7edc4921ed
	.xword	0x12375fce7a3470d4
	.xword	0x7b27ff78ce4739d0
	.xword	0xe5cffa473beca490
	.xword	0xd3f7032d54942bf0
	.xword	0x979c17a61c5e7ac2
	.xword	0x569d51a9734b594c
	.xword	0x2a7fca6998fb00f0
	.xword	0x72c0879a21664d09
	.xword	0x88408fb760a0f8c6
	.xword	0xcc31b5172fd5dc73
	.xword	0xee2f8f5badc96668
	.xword	0x20fc4d0f3f84886a
	.xword	0xacfec1829ed25ef1
	.xword	0x59a9161e5bc8e95e
	.xword	0x77c178f2f93e9526
	.xword	0x6190a9dc076f6694
	.xword	0x68d3d2b94874d8ef
	.xword	0x7df3dccd539038d1
	.xword	0x6eaea9e0c685f288
	.xword	0x06f5c6b66c9d808c
	.xword	0x748e340560ae5e15
	.xword	0x5dccc6665e3dfbf6
	.xword	0x8f26a191bb295de7
	.xword	0xb2ac3ca486b8f71e
	.xword	0xa7879ca439fcddff
	.xword	0x96d9250c9b659b0a
	.xword	0xd3feec98ec8eeea5
	.xword	0x86a816e48b50648d
	.xword	0x8c3d955012c58d72
	.xword	0x897743cc05f2eaab
	.xword	0x890ade61658fc35b
	.xword	0x9db5cd5f08f068d9
	.xword	0x53f95b6ea4c0515c
	.xword	0x83e0cbdb34a063ca
	.xword	0xf20ccc51e30484db
	.xword	0x6313fd6d2db504dd
	.xword	0xa44ca7d7813e7486
	.xword	0x53a722eaceda3919
	.xword	0xec44dc077a072188
	.xword	0x208f2283d3a5b8d0
	.xword	0x707ae815d5ab42cb
	.xword	0x073101b86a5ac78f
	.xword	0xa1b146145eaf3599
	.xword	0x51c736867dfbbec4
	.xword	0x4cd42df4abd2ad07
	.xword	0x44c53bf98fa128c1
	.xword	0x2aee2842b3661bdf
	.xword	0x7ad99df7805b7850
	.xword	0xfde08cd9b6c0e45f
	.xword	0x07b69bfb3f6a8a7d
	.xword	0x83df75b0d45ab0f0
	.xword	0xca75c99fe37b6726
	.xword	0x2047a6517612fcf6
	.xword	0xd18476f52794891c
	.xword	0xc3cf96010461da48
	.xword	0x07eb746bf7570d29
	.xword	0x3e08c1d336d4cbbf
	.xword	0x7e4065bde10ddad2
	.xword	0x9d00ad2aa4397775
	.xword	0x3b451a578bf41437
	.xword	0x0ef9a76489791839
	.xword	0xf990f290f91ccdaf
	.xword	0x934fdb3ca266bf92
	.xword	0x15689385b25524fd
	.xword	0x841711bb16e15818
	.xword	0x3cece0d2a1c3cacd
	.xword	0x10ae1930f6f41a89
	.xword	0x2c4300582b634147
	.xword	0x82f53fb8dc8dbcb3
	.xword	0xb86e2aa8f2be8dad
	.xword	0x07095f1daeef1251
	.xword	0xf4ab27346738ce35
	.xword	0xf72cbc40663390e4
	.xword	0xd2a31ca8977d2bc3
	.xword	0x665018289eb65e97
	.xword	0xbc06e9635927157c
	.xword	0xb4ce544833741a6a
	.xword	0xc5f007d3282ed972
	.xword	0xb9173a497b9752c0
	.xword	0x57e2d4db6ad677ab
	.xword	0x08ef81c3c245ad2b
	.xword	0x4d051452eeb198d2
	.xword	0xa5bf101eae8830b9
	.xword	0xe6ba3b8d396b52e7
	.xword	0xbf25c9b8d87f1d9c
	.xword	0x64d98f70cb54374a
	.xword	0xc695b650058aabad
	.xword	0x023f1db04f057ad5
	.xword	0x177ee5c5ed86630a
	.xword	0x425ac5f9d6c57c6c
	.xword	0x32aa81677c63f881
	.xword	0x983db74990869719
	.xword	0x498027d55cc5c65a
	.xword	0xc6c312eee1c52169
	.xword	0x1696f0c6cfe08cd9
	.xword	0x76ff3acf6127d788
	.xword	0xe290aeb48f8b8311
	.xword	0x505fab287075ad1f
	.xword	0xf4cc9b2ddbd39144
	.xword	0xfb1dc66b511d9cef
	.xword	0x2a6ab6453703f5a8
	.xword	0x90e749ca016e05f4
	.xword	0xa266d64398437c4a
	.xword	0xe9f32d11c710567b
	.xword	0xb14e6d1a96da13f2
	.xword	0x945dbf19e6bdc015
	.xword	0x2a699f53faa2066c
	.xword	0x556d3bd3c54639ab
	.xword	0xcd33b9912810db85
	.xword	0x4f99760837d71224
	.xword	0xb2c03696999c66ed
	.xword	0x4547e0baff4fec90
	.xword	0xd2ae536ef192a256
	.xword	0x957d7b6b7f86fb64
	.xword	0xa818453f5239a8a7
	.xword	0x18ea64426d81d3d1
	.xword	0xbfd304fabec9f67a
	.xword	0xa4d5b0fc44b8a6a7
	.xword	0xceda015053b128a6
	.xword	0x7d32a145c0b9f807
	.xword	0x1d91f3f40382629b
	.xword	0x7948c9211ce61ac7
	.xword	0x8ca3b7aac4aa5d79
	.xword	0x2a934940a2dd7828
	.xword	0xe405ac70992d8a54
	.xword	0x0e27ead5df3803b9
	.xword	0xa0cf2b05776087cb
	.xword	0x26e1d9be239ab0e9
	.xword	0x424689a28bd591c9
	.xword	0x54964581469f5f37
	.xword	0x5476844aaab47b9a
	.xword	0x0f36cba12caf6e2d
	.xword	0x8cd8f091d2734624
	.xword	0xa88002fb5836df29
	.xword	0xdb0912c938e0f10a
	.xword	0xc3291c77b315e661
	.xword	0x7b6e8d0421e6c3e4
	.xword	0x5ad5a8d504c99915
	.xword	0x1f12fc103528de94
	.xword	0xdd400e9a042e86eb
	.xword	0xe3292e00c6080e08
	.xword	0x31efdc795e2c5a78
	.xword	0x5c84700b389c5705
	.xword	0x3f9d7b356100a4d2
	.xword	0x1d02d7890afd5bcc
	.xword	0x72447001c103bc68
	.xword	0xa69d4290acc82404
	.xword	0x24430f8fa47037cd
	.xword	0xcf7f90d36ecdc65f
	.xword	0xb91de3a0f54b14ce
	.xword	0x25f4726b31662df1
	.xword	0xa93e1bd73ef536af
	.xword	0xabcc9f2106a4393c
	.xword	0x85a907ed08d9c8bc
	.xword	0x1208b8a6a036cf9d
	.xword	0x23cd7eac622a9ff1
	.xword	0x7a0e5018c9e6a8f9
	.xword	0xaba9d29775757172
	.xword	0xaacf653e3f6c8529
	.xword	0x0cc44123e39c5f8f
	.xword	0xad435f674a5e845a
	.xword	0x3a73ea4e9751102f
	.xword	0x3e1e17ed31662f53
	.xword	0xd70fc2f3827e2f15
	.xword	0xd45177a029f94ad4
	.xword	0x953e05b706d58fef
	.xword	0x05c052c357f8d679
	.xword	0xb9045b2a9f0c9e61
	.xword	0x1a72a5fbd50b4c17
	.xword	0xc49970ba56edcc23
	.xword	0x53062422e789cbfb
	.xword	0xca8e839a189cc12a
	.xword	0x36c0d744f5d28ca2
	.xword	0xb5afe23b6b183a69
	.xword	0x3237418731068b5e
	.xword	0x4bbaa95e485d662a
	.xword	0xb46c43444ea89965
	.xword	0x21f1d6de22d186e2
	.xword	0xeff72cd427f48df0
	.xword	0x4b2e7d99200098f5
	.xword	0xb5372f2772c8bf34
	.xword	0xdf2f7968f5db2853
	.xword	0xc134e194dcf90f96
	.xword	0x332c9122975904e6
	.xword	0x1f0de9f89439104e
	.xword	0xc8a4957133d58e10
	.xword	0xbc01c9fce6f502f6
	.xword	0xd4a2fad1b8daf30c
	.xword	0xa107e8e8963d9534
	.xword	0xedfd7efde9fc3ac4
	.xword	0x671b43f3bfdea4a3
	.xword	0x6cee25a4ecfb9795
	.xword	0x0ce2c095f11a5161
	.xword	0x089e2d30cb7d3040
	.xword	0x2f0751fc64a949be
	.xword	0x09e9297980c40263
	.xword	0x2ed6ae8cb55540c0
	.xword	0x1821ce0a63231ab8
	.xword	0x4f287cab2de3588b
	.xword	0x3baa2aae746eff30
	.xword	0x3cbc0ef43f1be94b
	.xword	0x884f7cbb4b6ea1c3
	.xword	0x43e9aaa610b642f9
	.xword	0x076dfcec99745477
	.xword	0x33fe83def6922b1a
	.xword	0xddca63329b228645
	.xword	0xba595b32002ea65d
	.xword	0x05b679718e185daf
	.xword	0xed681dc2e3d7b83d
	.xword	0x2302dbd32b1661da
	.xword	0xdf505759d3f1a652
	.xword	0xbf86755a7c38c9c9
	.xword	0x664804e90b2aa1f8
	.xword	0xf20d4bd0711c6707
	.xword	0x54711d3aaac70b21
	.xword	0xc43655c8bfc5fd18
	.xword	0x57b18ee3f8f81080
	.xword	0x517c8972e8f511c6
	.xword	0x9bbcb4f3bed122f3
	.xword	0xc793e658cdf045a7
	.xword	0x97f4101cf8073b45
	.xword	0xc541dfc0cfa0c784
	.xword	0x73823f1a0d206987
	.xword	0xc599c33ce2a50d54
	.xword	0x3339426275e2af26
	.xword	0xbe79e7b38cbbecd2
	.xword	0x29e2d1f8988a040e
	.xword	0xe6ae8e3e9ac07098
	.xword	0x907fe20bbbab38fb
	.xword	0xe6b070ef686c3060
	.xword	0xac6778451a22459c
	.xword	0x05d5a81552a6517e
	.xword	0x24ee366df137ab4a
	.xword	0xc1173d15edf5c7be
	.xword	0xabb932a3a64ee49f
	.xword	0xe9ec1fab199da6a9
	.xword	0x4580624c99bb9d00
	.xword	0x60a726e185737526
	.xword	0x06c3013a38f7eba0
	.xword	0x03903a46eee83742
	.xword	0xf7b91e00b64598f2
	.xword	0x3e509a7ae8569b0b
	.xword	0x728f023741033f8d
	.xword	0x1e36f314c79bdb0e
	.xword	0xeb43488e89b64839
	.xword	0x280ca551d206a379
	.xword	0xf899fb9fb17ea361
	.xword	0xa98dc48880f1dfcb
	.xword	0xb94617f8fcf5ae5a
	.xword	0x06a641d0f9be430b
	.xword	0xcf2acb156cb1e85e
	.xword	0xe74f6e5dcaf4756f
	.xword	0x89b6845ceaba09a7



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
	.xword	0x83a43f3d6d0ede87
	.xword	0x48dfea3e39f93db3
	.xword	0x0afad86fe9c57af0
	.xword	0x66aaa9efa17b79b4
	.xword	0x51b3b5d54e24eb95
	.xword	0xcf3b1d12793250b2
	.xword	0x7fd4ad688b68de44
	.xword	0x3f319ca4299af60f
	.xword	0x6694245e1d72658a
	.xword	0xeb4cfe7cc779af3b
	.xword	0x80be6f496307ba64
	.xword	0x5642364ef2546ae6
	.xword	0x74c066d234a8c6aa
	.xword	0x052a706f98d0b3a7
	.xword	0x8d5097aea193a325
	.xword	0xfc06edd29bb5d3a4
	.xword	0x308790fc7021cf32
	.xword	0xb0c37913a15af852
	.xword	0x0207d62f315015dd
	.xword	0x5e41fa321a6b96f8
	.xword	0x67cf0b53e01f063b
	.xword	0xc59a449f216ad38b
	.xword	0xdbd6f0ca1bac4c30
	.xword	0x87eb35dd623662a9
	.xword	0xcdd0120623fc2ce3
	.xword	0x7f9fa383745d04af
	.xword	0x45fe1aaa68143605
	.xword	0x3d16b402e27aac00
	.xword	0x67a2f7f74a2dde09
	.xword	0xe9a42da8bc7f6e03
	.xword	0xafbf3be469e48521
	.xword	0xefe414f00130d4c0
	.xword	0x2970c456d6460ebb
	.xword	0xa71ab47352dc20d6
	.xword	0x5724c12acbd99cb8
	.xword	0xa51ffb5dfb2624f2
	.xword	0x2d21b2479001ce06
	.xword	0xb4699750ff5e42f2
	.xword	0x5cb8c9855829243b
	.xword	0x9ff1c49734c2d014
	.xword	0x1f66cae3b1630660
	.xword	0xc775bcf45f36b4e7
	.xword	0x674683fe1e0b0880
	.xword	0x500949a4ad492f1f
	.xword	0x8a6c9bf3eaa0a996
	.xword	0xd28c7ae8c2f181af
	.xword	0xacde502d57de3829
	.xword	0x23f61f159050741a
	.xword	0xb5fea47b09c8e426
	.xword	0x0e964c106a605cb4
	.xword	0x74c3946b9decf70b
	.xword	0x6e232342a50f0183
	.xword	0x32e9d80eea4e8dc2
	.xword	0x29876966fdb1b5a4
	.xword	0x16be59e73adf5b0d
	.xword	0x2a40ee2acb081731
	.xword	0xd122f29361f907dd
	.xword	0x6a1f135a203a6114
	.xword	0x789f3e5eae7c4295
	.xword	0xdc14f67a75898aa7
	.xword	0xe7c5548233de22e2
	.xword	0x0c9a744440d919ee
	.xword	0x86ece4005d8b81c3
	.xword	0xf68801f48c3b509e
	.xword	0xb9250e90d9561fd0
	.xword	0x48a3de56140335ea
	.xword	0xa49666478b23f05c
	.xword	0xcdcca48f0b6588d8
	.xword	0xfddf3758fbeaef78
	.xword	0x4de5130af33af466
	.xword	0x3e06cf4289e004be
	.xword	0xa327f98dd562cbc3
	.xword	0xfd5c94d63c16ef82
	.xword	0x230cbf3032f5df2f
	.xword	0xdfbdc56aace5a3b5
	.xword	0xd453cb81103ff5cf
	.xword	0x56c2313d59f8c796
	.xword	0xffc18b1b058c0b2f
	.xword	0x3826ab8cbe0f36c5
	.xword	0xfd31e176202c5f0b
	.xword	0xa9a498a35a300c31
	.xword	0xcde036d24b2ebcaf
	.xword	0x1f2bbf1bfb542e73
	.xword	0x26e48cd87c098ddc
	.xword	0x9fb7b7d1d673163f
	.xword	0x244458baa154ed3d
	.xword	0xd86f0cbd7f240b28
	.xword	0xe43184b2103211cd
	.xword	0x812952d601162cd5
	.xword	0xc19caf333f84fa36
	.xword	0x4806bfe17165e137
	.xword	0x3fc2555a3d5c8fa2
	.xword	0x018cfb375d6c6a8c
	.xword	0x2dfa7f882adb912e
	.xword	0xe8e431d186aefa87
	.xword	0x5f6964dd6c9b4a95
	.xword	0x92c1e3a0749ad324
	.xword	0x9ed31df4a56f3f3b
	.xword	0x1dbb3171e8ac1277
	.xword	0x9d60bdba1902cdc2
	.xword	0x22f2c32226f70927
	.xword	0x9a3e108d0ccfad74
	.xword	0x445e9c900d5c80a9
	.xword	0xa423b09a5917f437
	.xword	0xb5612a243ce6a08b
	.xword	0xeac79a8afb91605c
	.xword	0xdcf9b5ea655167e4
	.xword	0x245678014034e916
	.xword	0x98d18bde579f14e0
	.xword	0x3198a5cf8777b975
	.xword	0x02706ce09e6ed308
	.xword	0x822fe9f4d2c73ce9
	.xword	0x08b67bcbb4eb343b
	.xword	0xf475856c4320f16e
	.xword	0xc53d92224bcd09b3
	.xword	0x9c4fb1ec1b2bb6e3
	.xword	0x715d2ca6d4facceb
	.xword	0xdf0547f217de721c
	.xword	0xe54c880e1b2f0a21
	.xword	0x583cdeebfd8ee460
	.xword	0x57780a0c3a3a00c3
	.xword	0x80ace65ae90a02d4
	.xword	0x97308950015a7885
	.xword	0x3d6754b45a7696d3
	.xword	0xc7e08a1706f28268
	.xword	0x50f45af17c21a999
	.xword	0xab499dbe3fb6ccd7
	.xword	0x951f9d595240ef4d
	.xword	0x3102a6a5340872d0
	.xword	0xf2f29ca42728dc75
	.xword	0x9d33af9727561f2d
	.xword	0xbddd621d1732266a
	.xword	0xbd6740a5b7487a1d
	.xword	0x74ec556bc324809d
	.xword	0xb50ab5d1f7bfed53
	.xword	0x04adf15a6929c920
	.xword	0x0465508e962fd158
	.xword	0xaf641b9cdad41c4c
	.xword	0xe230acbcd472e6ad
	.xword	0xb1952b86caed9cd8
	.xword	0x902cee1a62ca5b47
	.xword	0x086015ffd516755b
	.xword	0x1522ef35d56cc4ac
	.xword	0x07bdee8cbd7c49c3
	.xword	0x1566ec2226179bdd
	.xword	0xcccc15ce024ae5ef
	.xword	0x15dec9ef152f1628
	.xword	0x8096dd7c4ddad21f
	.xword	0x0f4729d2c0a71f51
	.xword	0x43e39c6c3cfa8d69
	.xword	0xd7ea4ac2c91f92e3
	.xword	0x8ab26e8ebf9ac71c
	.xword	0xe855ac64eb3b6308
	.xword	0x48c93fad65083cb8
	.xword	0x1cb359e172e70e89
	.xword	0x917f899438d3c5ee
	.xword	0x27840d0fd25ba5aa
	.xword	0xd5083fd3b7035c78
	.xword	0x99f6f1a56c1793d4
	.xword	0x30ce6dfc687f7c39
	.xword	0xfe55ba824c5d81cf
	.xword	0x32fd11c426f378d9
	.xword	0x76f1f72ab217fff2
	.xword	0xacf755f059088662
	.xword	0x68eb3435d2ca28fd
	.xword	0xce7de10940594ae2
	.xword	0x61eb0f0e124918fa
	.xword	0xdbdd8d3ca3840d9b
	.xword	0x77df4d8237d74d9a
	.xword	0xcc257d948b2141e4
	.xword	0x81bef168d994ebf8
	.xword	0xadc65aa1033e4763
	.xword	0xb152f6e44295fa5a
	.xword	0xdf7dd697195920a3
	.xword	0xdedcd90a43fdc33b
	.xword	0x638991042ac02ac0
	.xword	0x50a5b958a23ebc1e
	.xword	0x03045f74075a7f87
	.xword	0x400482cd0f1e16ec
	.xword	0x51e6767d9269a511
	.xword	0xe103f54156ce71f7
	.xword	0xe1f24d21f6b519eb
	.xword	0xf6fe6a956b95659a
	.xword	0x2a48fd851994d0d2
	.xword	0x45016c0501198ced
	.xword	0xffd53a57adb1c283
	.xword	0xeee98cb8a35aa6ee
	.xword	0x6878255c1a7f6aec
	.xword	0x80e2dcc2d0a7e559
	.xword	0xb5e3b0bfa78a14d2
	.xword	0x36ac069bd6a7552b
	.xword	0x84ef73d4f9dd4629
	.xword	0x5c3056e537118a2e
	.xword	0x3fc02e059c63be36
	.xword	0xa6fc875e18ceb07b
	.xword	0x63fe9c9f7ab46d4a
	.xword	0xdbdeb4d38bd180d7
	.xword	0xeadeeac6d93e3b10
	.xword	0xe3a989c506ac2915
	.xword	0x61dfa3d99875f054
	.xword	0x1b34ac7349c8c1c9
	.xword	0x715117d38c7d41fb
	.xword	0x7ac76c486567793b
	.xword	0x7075a2119cd2718a
	.xword	0xbb4ec93b211b72aa
	.xword	0xd22420519a35804a
	.xword	0x3c2d64ea7b421ba1
	.xword	0x8ec93f7d16b8430b
	.xword	0xea1a67a952e24d4b
	.xword	0xd4d132d6f0ac4a91
	.xword	0xa2786ee3e091749c
	.xword	0xac246afa85d47eca
	.xword	0x6e82640eea97c1f8
	.xword	0x4578afe2a4463860
	.xword	0xe8100e27cfbbeec1
	.xword	0x6fa8d9c5662af9df
	.xword	0x9880116ccabb55dc
	.xword	0x108f490cd4b593cb
	.xword	0xb052d7082df760c2
	.xword	0x6db79b8bd9f8412e
	.xword	0x196cd7dc6c817cc4
	.xword	0xb906e285c1b95104
	.xword	0xb807ed761de886e2
	.xword	0xdba7192b747a4514
	.xword	0x3914b0aad2ffa0db
	.xword	0x2afd719871970231
	.xword	0x1f7cad74c16118cc
	.xword	0x9e576935fb6da79c
	.xword	0xb9a58829b89a52c9
	.xword	0x9b3014e11aaf1cf9
	.xword	0xbaf69918e415f819
	.xword	0xbcb08842ffe7aa23
	.xword	0xc87817644fa8c17c
	.xword	0x1c6e4da67c4a55e9
	.xword	0x873d358379d791e8
	.xword	0x8cb75c8765d2512a
	.xword	0xb3581fb47f6d3d51
	.xword	0xcf1a528cc9511c72
	.xword	0x56becd7d31138ba0
	.xword	0xb949dd92ed1f0e35
	.xword	0x5e06c5672931e17d
	.xword	0x5996d5b5bdccace3
	.xword	0xa53e316d029115db
	.xword	0x0a9680736460f56e
	.xword	0x0368d44ead0db909
	.xword	0x94de96306f7d0e86
	.xword	0x4252fac59fca243f
	.xword	0x49a4f226f20eee5a
	.xword	0xe83e95cbcc2e88bf
	.xword	0xfbda13ab0e2c6fd3
	.xword	0xa55537c03a9aff75
	.xword	0x789eb046655c7a07
	.xword	0xf226f52c72bb3c57
	.xword	0x5044315c61cf6836
	.xword	0x55e02a5cb5ba98ce
	.xword	0x1ec07dafb934288a



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
	.xword	0x49f896211cd77986
	.xword	0x38606e81f44e222e
	.xword	0x0bb38c5e25931eba
	.xword	0x9256d38feb59edbe
	.xword	0xe5b557a1ab9708e5
	.xword	0xec52c2483e4ddd6e
	.xword	0xc74d589532901c27
	.xword	0x0332508ad18ed105
	.xword	0x3fe1bb3ad3fdd894
	.xword	0x121dabb2ba6efa6d
	.xword	0xffe6645dd614f920
	.xword	0x7346f468f9f464f6
	.xword	0x1bb17a87d5af0f0e
	.xword	0x71909d5c272f91db
	.xword	0x976fdef961e10712
	.xword	0x81eca79c63ea2f89
	.xword	0x05c9675f5afccfca
	.xword	0x0a257f59bc553312
	.xword	0x74e9d0e555bf7117
	.xword	0x2cbdc367b31a3b29
	.xword	0x72248ce3341e0db8
	.xword	0x51ef4b83a0a5cfa6
	.xword	0xe85f95ff357ea272
	.xword	0x44b75ea94319f0cc
	.xword	0x9298a95f7d8ab24d
	.xword	0x77d14312f5379a40
	.xword	0x3644795d66400998
	.xword	0x61d5702c86eedbf3
	.xword	0x363a8bd85eb797cb
	.xword	0xd77a4db4201f7040
	.xword	0x7427c702a177ec92
	.xword	0x2bc0af2fbcc68eb2
	.xword	0x335d68e11566fedf
	.xword	0x5ece779af874a467
	.xword	0xf7ce51a8f5dfd8b7
	.xword	0x4200c3e0d8cfa338
	.xword	0xd23ac54c46c8790e
	.xword	0x2edeaa9873f42804
	.xword	0xc1a18ffef3fe8b3b
	.xword	0x4e6e316e41172887
	.xword	0x2fa68ef48130c51d
	.xword	0x3a1d1c496c84391a
	.xword	0x178efd4a811a9087
	.xword	0xffde9322d8ea515a
	.xword	0xba4ece6467d0c64a
	.xword	0xdf509e251fdbca44
	.xword	0x4f0ae2d6df280050
	.xword	0xb693d3d811e7859d
	.xword	0x1d0c381cf0e9384f
	.xword	0x227ece85279671ca
	.xword	0x0c3c797e12c3e913
	.xword	0xf36fc70e573676c3
	.xword	0x6f627d112cfe2ab7
	.xword	0xdee0cded20035f24
	.xword	0xbe5c3d2272f87ba1
	.xword	0x8056d8710556659e
	.xword	0xc1ea66c33e276afb
	.xword	0x5a675426ef251239
	.xword	0x27303a4a8d33504b
	.xword	0x1b80840662e19ffb
	.xword	0x717cf27cb8fc109d
	.xword	0x0605b904c378bdd2
	.xword	0x6a28705da2a93cb3
	.xword	0xfd4d3baa238da24e
	.xword	0x4d98c9eea8555431
	.xword	0x5d1fd376a62a7943
	.xword	0xc3990af482aa79b2
	.xword	0x782aefb894c4df57
	.xword	0xa506cfad1e872228
	.xword	0x8e0130818654c676
	.xword	0x7f43e92c84ae5e35
	.xword	0x668f0380ab8a123a
	.xword	0x07beb2ec7b9f1f50
	.xword	0x42a7c1f64febe11a
	.xword	0x907716eb2ef2d038
	.xword	0x65f7f5b8c7d1ce9c
	.xword	0x31c5a70ce422c701
	.xword	0x641b3b4d9a8a7c4e
	.xword	0x6ae6c68d792d6166
	.xword	0x897d5d82465207f3
	.xword	0x40c2326a7b252253
	.xword	0x685025e3b9ae6380
	.xword	0x2b27de11ee30359e
	.xword	0x81edd9cb1802b485
	.xword	0xa296af2ea6d0d2dc
	.xword	0x29aea85efff72989
	.xword	0x957e3c4b24649886
	.xword	0x2688a5d480396fd9
	.xword	0xfe9d172847d2bdd0
	.xword	0x4758c8c1919f3035
	.xword	0xefd788246bd0a31b
	.xword	0x8a0d3a97ad568feb
	.xword	0xee2c0746f99b18aa
	.xword	0x937b6895602394d5
	.xword	0x93ff80c656aa3c0d
	.xword	0x5a78e03e1a84bba3
	.xword	0xdeb577b3d159c6e5
	.xword	0xf93d8081b95ce04c
	.xword	0xe2cccc5d75ab1c53
	.xword	0x8af8cf8c8aa8a7b1
	.xword	0x828df65a162bbf10
	.xword	0x3a0c6cd4be867686
	.xword	0x3d9bec470ca0c763
	.xword	0xdaa68e0f3863e6c9
	.xword	0x49623c7cb3111c35
	.xword	0x09a32de3f927c01c
	.xword	0x12e480ccc1da6028
	.xword	0x5c3b37c4997a84c5
	.xword	0xa5765d4c0a3a56b8
	.xword	0xceea808918dbe1e9
	.xword	0xce10cf7035b7d1b5
	.xword	0xa3aa928d8b8b224a
	.xword	0xb6194fe45add443c
	.xword	0x61b2deb27aff4bfc
	.xword	0x9b1f98a437da731c
	.xword	0x7c8205108ed38ec6
	.xword	0x00ae840a208deed7
	.xword	0xf3f9148c5c4b7bcd
	.xword	0x0ad5368dc30152e4
	.xword	0x28cc3c20a46c62ac
	.xword	0xd8da956cfeff591a
	.xword	0x2f02c9b371203b3e
	.xword	0x2419d96a02dfea81
	.xword	0x7c9eb4bad5f8a69e
	.xword	0x60af48fa9d94cbf5
	.xword	0x0951e851a52ce68d
	.xword	0xc2abee014f545a4a
	.xword	0xee1f1badac9b35f6
	.xword	0xb8ab23fc34577a5c
	.xword	0x197ab5b2d9bcce85
	.xword	0x4aad21e9f98d9fd4
	.xword	0x0cc38735ae986e88
	.xword	0xe9d8caf95c95ee3d
	.xword	0x58bab6291b122f66
	.xword	0x63cceaceba71d9e1
	.xword	0x7ed58a324e48d026
	.xword	0xf75f7be336569b44
	.xword	0x0164b54aced1666f
	.xword	0xacee7c5cafc8ce7f
	.xword	0x4f38b1f80dcb8983
	.xword	0x6356d0fdfebea991
	.xword	0x51dc7b97cd5fe02a
	.xword	0x16d4b63eaa8b507f
	.xword	0x973c88d6625f3355
	.xword	0xa4c62606233d96ee
	.xword	0x88b92da8312fdecf
	.xword	0x4a6ba2951861b5a3
	.xword	0x249704d85d2ec0bc
	.xword	0x248692bd8272496a
	.xword	0x16ca16bc49658920
	.xword	0xff615a9123a8c5e0
	.xword	0x9fc3f16005664bbb
	.xword	0x41eb6765b0b2db52
	.xword	0xd329bcbe8f2c5aca
	.xword	0xb6a4da31954b07ea
	.xword	0x6238532474b3a82d
	.xword	0x94132056f6e98260
	.xword	0xde9923615fe3cd5f
	.xword	0xff26d336d6660772
	.xword	0xaea6483788253f43
	.xword	0xe53162aaf16e5467
	.xword	0x058fd3d4e0c27d2d
	.xword	0x9bb4f358e83e68ee
	.xword	0x3b4a54ca1c096027
	.xword	0x0edac221c9325360
	.xword	0x58334fc1ee7f8163
	.xword	0x731c493a83207e1a
	.xword	0x1185345225dd4dcb
	.xword	0x3a2af4849ec22e5a
	.xword	0x7f93e03e896ee609
	.xword	0x8912f6ae9f32c81d
	.xword	0xa48d798d2770f0be
	.xword	0x1a614271d4828874
	.xword	0x4abc61ecdf986d4e
	.xword	0xe762887cb0d78fbd
	.xword	0xb8ac2a63025e4708
	.xword	0x66c55444d865893e
	.xword	0xbb44d0ef23ac6ece
	.xword	0x3d5234e76d042415
	.xword	0xd4340d5a1ea0ebf4
	.xword	0x0165f8d218e02bbd
	.xword	0xb6492b7933d4bb95
	.xword	0x7f3adefd4883d47c
	.xword	0x08659fc42e768f69
	.xword	0xf2210457f3e9a7eb
	.xword	0x439f74955cbc9a69
	.xword	0x4b7810154e274e9f
	.xword	0xf9afe3fa24dcbcdc
	.xword	0x36bd987b99fa47b6
	.xword	0x4bbb4b186b02a90e
	.xword	0xeac7713c6806aaa2
	.xword	0xb40a509f5039e199
	.xword	0xc3bb3b74f7e7ad96
	.xword	0xb09815751e2d43bd
	.xword	0x1de2df696367e313
	.xword	0xfd55baee126baffd
	.xword	0x883f8379db5a8747
	.xword	0xb63a4193eda4f2f6
	.xword	0x2ea9fce2568b1ff7
	.xword	0x862496dcc5a58823
	.xword	0xa3240784cb42a70a
	.xword	0x54dabc9a7694d486
	.xword	0x9bece423171b71f1
	.xword	0x2667247a67f28995
	.xword	0x78c411b2249719c0
	.xword	0x1b8cb97d96ba7410
	.xword	0x25cd6068edc03a59
	.xword	0xc0bbc01718f1e0a3
	.xword	0xb9dda3b1a130bd27
	.xword	0x656fad85150cca48
	.xword	0x9aa9e46ff50eb058
	.xword	0x1839a377d8054c2a
	.xword	0xa105b75dd9d192dc
	.xword	0x6d96cb25991371dd
	.xword	0x0eafa7b6f794471c
	.xword	0x0c25fbb5d54b9aa4
	.xword	0xc61422898cd588c1
	.xword	0x3ecee0fc4809c9ea
	.xword	0x47136f7072d929fc
	.xword	0x838c268083e143b1
	.xword	0xdf458b66f26f8535
	.xword	0x04c48c71ece8629e
	.xword	0x1db44c3dac1f620d
	.xword	0x2b0898095dc515bf
	.xword	0x4669b221aa769586
	.xword	0x650ae9febb2b8356
	.xword	0xb43c5e71910683be
	.xword	0x50431e3fa7bf1bc1
	.xword	0x84835c18c7fa6172
	.xword	0xe1e7e047a653554e
	.xword	0x88941ef9468965e9
	.xword	0xefb8d3fc0defa640
	.xword	0x639b5ccc58f673ac
	.xword	0xa716f6776448fefd
	.xword	0x70b1ada2432e1bd3
	.xword	0x0960c870db0fb2ce
	.xword	0xb4fb960591126ffe
	.xword	0xde72786ef2e5eafd
	.xword	0xb39f188298610e3d
	.xword	0x88d63327dd4a735c
	.xword	0x3cf3f7cc0e749bd7
	.xword	0x09666fc9586c7296
	.xword	0x97297eb6247e57a2
	.xword	0xa09122dca8424a1c
	.xword	0x66fe6fe2cb289eb4
	.xword	0x73fb57fcca6cdb4f
	.xword	0xf2a6f164d8e148c2
	.xword	0x8e32b9602e32dce5
	.xword	0x9cf7ca0e02c9e14e
	.xword	0x84ed0ce20a9a63df
	.xword	0x01b97bc8b5d27078
	.xword	0x3a7c395d23c492cd
	.xword	0x39891594ae61d300
	.xword	0x21e0184abcf5dbbd
	.xword	0xac270f435868937b
	.xword	0xd0f02aa0c57d33c7



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
	.xword	0x5ee7d7f7e5a361fb
	.xword	0x6ee48148adbfebba
	.xword	0xe5fd3439ae21369c
	.xword	0x14b975c941485853
	.xword	0xb84d6468b7de80b1
	.xword	0x27bff98e7f93a712
	.xword	0x0f38bffcfa813b03
	.xword	0x316f573abbb89348
	.xword	0x466531a470e0d42b
	.xword	0x1221ee855e0c8ea7
	.xword	0x84b8d071f3cad64b
	.xword	0x493e5a4c63b793c8
	.xword	0xea27d9882b957da8
	.xword	0x5fb29220672e39a9
	.xword	0x766bce259caa3085
	.xword	0x0bc93f5a08918db5
	.xword	0x57763a33e3f67cc2
	.xword	0x5cf8a1a778bfa381
	.xword	0x6f3d7d6bd04e37aa
	.xword	0x6aa568afdf9b787d
	.xword	0xc5235672ec0d06d3
	.xword	0x73fe881dc3f5fa2e
	.xword	0xb8536dc39f83c4dc
	.xword	0x9ead4d289739a3d2
	.xword	0x1bc50a4bbd32c3a4
	.xword	0xceac8180f10fc36f
	.xword	0xb17e17a6b36ec263
	.xword	0x0e15028e421d2469
	.xword	0xfd09913a6226b121
	.xword	0xc204e2ee9b47b20c
	.xword	0x6b045b67071b1763
	.xword	0x936355e542bde538
	.xword	0x7e7715fcf695846b
	.xword	0x5a2a42558985bfc3
	.xword	0x2c23d90da64b33d4
	.xword	0xa13632f0b37fbba1
	.xword	0xc033f56ab41a96fb
	.xword	0xe927fb8a3fbaaad5
	.xword	0xda4184d9276802ed
	.xword	0xd3017c720ec3e788
	.xword	0x252576a116778f8d
	.xword	0xbb8749ada83c1d5b
	.xword	0x23e5e849b3c06bdc
	.xword	0xd165da42137ff159
	.xword	0xdec5f9548efdc974
	.xword	0x8ef3debc5f1a3e7f
	.xword	0x6325f41b276ffa9a
	.xword	0x6e2e4f6327ada6fd
	.xword	0x44d60b7f588f332e
	.xword	0x69f51290ea782a73
	.xword	0x20ff200ee7d1bd79
	.xword	0xa23e6c243795d161
	.xword	0x737a183df1bbc851
	.xword	0xeddb0dcbfda83fe9
	.xword	0xf27af8d0364754f8
	.xword	0x56f15b9a61f74db0
	.xword	0x3b418f62c999ef92
	.xword	0x628bf8f0688bf23f
	.xword	0xde490a8569538d7d
	.xword	0x0c4d320eb604340d
	.xword	0x022298958d39ccd4
	.xword	0x227b81a18d937dd7
	.xword	0x124db6d325612ba9
	.xword	0x68fc26a040b52147
	.xword	0x8e4e6aa30efb2a83
	.xword	0x6306aa7943bdff31
	.xword	0x2e74fbd970b89e92
	.xword	0x3a29953278a5015f
	.xword	0x2ce1c0972f037364
	.xword	0x40469e5b605402db
	.xword	0x480a312bec81ab72
	.xword	0xc6e681d55b763b2b
	.xword	0xa8f2b168ccab5180
	.xword	0x948d5e463ef397bc
	.xword	0x88000b43143d54a8
	.xword	0xd7f31e03d0451831
	.xword	0x8f7690cc457d0cd7
	.xword	0x8bc8832b4feeaff9
	.xword	0x51830e3910db61ad
	.xword	0x3a550f9ecd99aec1
	.xword	0x82f60c7fd5e722d8
	.xword	0x3f058ce7eb042619
	.xword	0x5aa6a7f59ee53226
	.xword	0x968a50773c5e4c6f
	.xword	0x4d488fb6be0dcc87
	.xword	0x32007146aa245fd3
	.xword	0xa4bd8d6d99d41a3b
	.xword	0x253f1b328e695378
	.xword	0xbcb1d041900e429f
	.xword	0x74eabf026c1da7a9
	.xword	0x22f72634b1be4c7e
	.xword	0xf8a721590d3bf529
	.xword	0x4aaff9918027332f
	.xword	0x00156a493aa0022f
	.xword	0x693386ae14689b25
	.xword	0xbe3322cb71471c85
	.xword	0xb22633218503f2e5
	.xword	0xd7c76ba478f5f461
	.xword	0xfeaf8596854caeb3
	.xword	0x86cb31a4d3fe6859
	.xword	0x4f1f193bc970e0a8
	.xword	0xb2b4017704194294
	.xword	0x09d07166e9f924a6
	.xword	0xf8fbb47972aa6146
	.xword	0xfa671a22b9c85250
	.xword	0xc4a7ed0222ffddc1
	.xword	0xadc05c3c138d2a70
	.xword	0xa89f838d917feac9
	.xword	0xcd3eb67c29550493
	.xword	0x1ae3b97f9b6b5cc2
	.xword	0x41eeb6eb2ca01ed5
	.xword	0x1e7ba3fdc0724d7b
	.xword	0xe8880929af2286a6
	.xword	0x8c01026d5eb71fff
	.xword	0xeeb9d321f49fdd3f
	.xword	0x88596f21b2d7558b
	.xword	0x280ddaa314961a1b
	.xword	0xc4f40ab3599058f5
	.xword	0xea12aca78d93c82f
	.xword	0xc135b5b53b1099fa
	.xword	0x48cdea80b74cab41
	.xword	0x66a0095120acdf8a
	.xword	0x8c326aae30d33f96
	.xword	0xca0435e0a5309ade
	.xword	0xb53fc89452fc1ba5
	.xword	0x6dba87bed7ef72f5
	.xword	0x3e7fd63e0fe2e567
	.xword	0x87442b9d886e882c
	.xword	0x7e59dc4fe8b336ae
	.xword	0x4677790e0788831b
	.xword	0xf75a0d1f36d164b5
	.xword	0x065a703a8f02c677
	.xword	0xe18a6d69f17a21e2
	.xword	0xd235b29fe4b8c903
	.xword	0x7a02fc48903bdaf6
	.xword	0x39b41dc4307df9f8
	.xword	0x13dc734f58a88d17
	.xword	0xaa53c0eccd5611b3
	.xword	0x3d43c3a19129b152
	.xword	0x77c61a062ed14c58
	.xword	0xeaad5e9426b3b2e1
	.xword	0x3e122505c1d3a97e
	.xword	0x09a829bb3c2524f2
	.xword	0x8de371a908d0fd79
	.xword	0xf111c0e12c5f2422
	.xword	0x2c330bf6295dcaee
	.xword	0x7e3746c2580f6aa0
	.xword	0x27588094b753411d
	.xword	0xfe6d11dc1443b914
	.xword	0x485ee81f938792da
	.xword	0x199d63bfb7f1baf5
	.xword	0xf6b7d0e486110f33
	.xword	0x1e6390d5435b7bcb
	.xword	0x1fce87fabff13743
	.xword	0xae94a9b29cefd87b
	.xword	0xe9b0db7a7136560c
	.xword	0xd9885cd98f4835f5
	.xword	0xb3589f060bc97926
	.xword	0xc586b45d3281a0e6
	.xword	0x843ccdd7f95bf70c
	.xword	0x20ac922c7ab21c12
	.xword	0xf9f85b302bc8b115
	.xword	0x5ebd9528015cccdd
	.xword	0x7d12a20faba239a9
	.xword	0xb1e2569646837650
	.xword	0x8427addab899e82d
	.xword	0xefbe6f652b9ac45d
	.xword	0xef401bf12e8b4146
	.xword	0x5e185a24e887f7b6
	.xword	0x941b9a29dfcf782b
	.xword	0x622cf1db7939ba2a
	.xword	0xcc86e0512f358736
	.xword	0x860caf5dac24ac95
	.xword	0x70b16553559e23b9
	.xword	0xadd20fc688427b4c
	.xword	0x135d539ec3d2a6f5
	.xword	0x3943f1d95021b7b6
	.xword	0xec3f7f418a205ea3
	.xword	0x2dbb6dbe525f52a4
	.xword	0x2031cf3648b0319e
	.xword	0x4f56135f5e099d60
	.xword	0xfaec214fe4892a60
	.xword	0xd08a66f1bbf942bc
	.xword	0x8d894a5e83a8a630
	.xword	0xe0971d1f8bf7278f
	.xword	0xf201293706140936
	.xword	0x7f7df04713e4c5f6
	.xword	0x8f851ed7655c5032
	.xword	0x1aa3a21030baecba
	.xword	0x13f6584e9157f504
	.xword	0xee06dbc19ea9bc2a
	.xword	0x9fe1b4e8af5da208
	.xword	0x8c59e14a9a182911
	.xword	0x3213a4db2adc0015
	.xword	0x0ea600b1c85a81eb
	.xword	0x38eaa4a6de1d3f32
	.xword	0xdc69fdda5dcaa969
	.xword	0xcbb5ed3eba153b9d
	.xword	0x4f742bcb2d19e67f
	.xword	0x913699e1ebe35262
	.xword	0xf102ce7fedf2551f
	.xword	0xced0126bb501e2e4
	.xword	0x8a309374bd20a189
	.xword	0xf36701bfc500077e
	.xword	0x4c194750c14de85a
	.xword	0x29f00ac3a39ca1ba
	.xword	0xa9ccd1b8464beaeb
	.xword	0xd600a4be28e44778
	.xword	0xe4f804d554ccc25e
	.xword	0xb97697d7a9be6ce1
	.xword	0x1532d4b96ad4287c
	.xword	0x7db9faf1af8a8474
	.xword	0xea700b38e5d51a55
	.xword	0x192748a670004f5b
	.xword	0xefa6d7cb175e9fce
	.xword	0xb6c5a8130a654a4a
	.xword	0xfb8aec614c216499
	.xword	0x4b03a951df1c2267
	.xword	0x52aedfd77a5fb827
	.xword	0x020e607795609b4b
	.xword	0xa946dc7042234ee2
	.xword	0x84ac62183cb464bb
	.xword	0x091deb52e7522747
	.xword	0xfdb928ed35344b42
	.xword	0x28ddb5239d43f966
	.xword	0xfd27d6e90fbe2c00
	.xword	0xaa401e69b17bafdc
	.xword	0x00019269c28f9f87
	.xword	0xfe42439acc05b738
	.xword	0x08ff96aaed9b230d
	.xword	0xf94c527a1aca2345
	.xword	0xf52b6a8f42d8ba9a
	.xword	0xa2a00d75a537645b
	.xword	0x09d54da90d19b5fe
	.xword	0x01b61528ac0a4b5b
	.xword	0x2b027acfa169c901
	.xword	0x9c571ca08c124b70
	.xword	0x6ff8f4f5c310c0cc
	.xword	0x14d1ee06b5eef2bc
	.xword	0x4f859adf4886ffa8
	.xword	0xb18540a4617a244a
	.xword	0x9effd6b9e76f166a
	.xword	0x5d79119b0069f8b6
	.xword	0x4d580b8e913126cb
	.xword	0xc21c66d7bc2fb193
	.xword	0x5b61cee40e04ed2d
	.xword	0x35a83239f1140bc0
	.xword	0xd7faccb8c38d86ee
	.xword	0xfb49bab3e57bf868
	.xword	0x4cf15ed206d2bc12
	.xword	0xbbfb890fc0f8af94
	.xword	0x2cfb7c0398357ecd
	.xword	0xe7d16b973c22772d
	.xword	0x0a0b2e3de1502f14
	.xword	0xb50e4ca36ecdade4
	.xword	0xd1eb67a68a6e4f9e



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
	.xword	0x0b58cb86ce7df102
	.xword	0xd997b0eb9bd98b5d
	.xword	0x703b445156387163
	.xword	0xb6a99d9ee97e51fc
	.xword	0xb483a7a1a7e78c13
	.xword	0x07a65a3a190bbd15
	.xword	0x8bd28cb862fed728
	.xword	0x7f3aa154edfbccba
	.xword	0xff48aebd5e18f4da
	.xword	0x491b82e21376c7ce
	.xword	0x34383fd136213fa5
	.xword	0x32353c59f83b6a74
	.xword	0xda4c90a418f181df
	.xword	0xf480b797149644a5
	.xword	0xe7aa07523c9011be
	.xword	0xde531817f9f33e31
	.xword	0x997842d3d16b899f
	.xword	0xf1769fc0a62190d4
	.xword	0xfa394ccb3bbc7998
	.xword	0x80a76142eafecac1
	.xword	0x9d451d4b719d9bc9
	.xword	0x6d4e202058c4e788
	.xword	0xc914f24e9e5ec268
	.xword	0xd5d63ce2db6f0190
	.xword	0x68155d9656ad0573
	.xword	0x39d66cd3de8a9850
	.xword	0x73c5de280fadfd7f
	.xword	0x6275d1772b628b3f
	.xword	0xeb189359b36fc069
	.xword	0x213286627dff8d71
	.xword	0xef5dc6d431adc327
	.xword	0xd3295b73f748adb0
	.xword	0x533b544a9943d706
	.xword	0x75b0648140e1fe81
	.xword	0xc2c66b97d68fa779
	.xword	0x4403837f8f6cb398
	.xword	0xaef366bbc877c69d
	.xword	0xd561eeb706e85fb3
	.xword	0x00d69490a54c2ffa
	.xword	0x82b79b8b975d9db0
	.xword	0x906b33636480a998
	.xword	0x528a64ca868a2c83
	.xword	0x69bd74b311b944e1
	.xword	0x3325f9c18b6a21ff
	.xword	0xc0e0bac027f7dbba
	.xword	0x85fff03249d8529d
	.xword	0xcde2542ebe01ffe8
	.xword	0xe5ce6de6138d491c
	.xword	0xe59559e06817ada3
	.xword	0xdafe98212f60f137
	.xword	0xb843baf74d690501
	.xword	0xcf01e6190220743f
	.xword	0xec9e234812cc7ea9
	.xword	0x1f1430d4bc904b65
	.xword	0xce138f908d44bd0b
	.xword	0x5b6730426ff4dde3
	.xword	0x6ec784774cf67091
	.xword	0xfd2c158907aa56a6
	.xword	0x9199e49937b6b1a2
	.xword	0x2ad080af6e572f0e
	.xword	0x2bd1ec919351b3da
	.xword	0x1a94a1ef0432478f
	.xword	0x60526b5956750199
	.xword	0x95e6058cf0270229
	.xword	0x8904d3f632e0307d
	.xword	0xb1ef5095fc59b362
	.xword	0x648eed27416056aa
	.xword	0xca4942df53d34b70
	.xword	0x89c45b880973d7ae
	.xword	0xbb7c64cc901e3ed1
	.xword	0x5e30d47f88025f89
	.xword	0x8f48c9b4d6b0bc8b
	.xword	0x0221e1b7eb864886
	.xword	0x43b87b72bdbe6945
	.xword	0x24746b31b2509f03
	.xword	0x1c16e84066bfd528
	.xword	0x629c156459863f78
	.xword	0x438778cb37b7079e
	.xword	0x96dfa8e02970f06d
	.xword	0x152f44ee077b6202
	.xword	0x149160d5a0d2d134
	.xword	0xc17d4fc98da0a01f
	.xword	0xa457556d93b8c7d2
	.xword	0x1d589045b78a0cbd
	.xword	0x465f4e63072394ff
	.xword	0xf3c4ba81caaa4528
	.xword	0x14b70e15209ec7f8
	.xword	0x8844a5311572d585
	.xword	0xe367f9115203f11f
	.xword	0xc994165c6c102ef4
	.xword	0x877acc0ff7c52850
	.xword	0xb5b270fdbc243bb4
	.xword	0x45ca447e3a1f90c4
	.xword	0x6142bde50756d4ad
	.xword	0x66f38fa752d8bc92
	.xword	0x82029fd2ec2f05a7
	.xword	0xf10fae38913408bd
	.xword	0x5e154a12db064121
	.xword	0xbacc70a498a0cb8e
	.xword	0x496b40dfac445b56
	.xword	0x22f552ce922b6f81
	.xword	0x637db08d23c7e506
	.xword	0x1ba3d6021dc0d080
	.xword	0xa4a3c012364bd6a3
	.xword	0x5895d7ec3cd6559b
	.xword	0xa0ce836f6ff89f13
	.xword	0x8a9fd9ce8a375bfa
	.xword	0xeb1f4599c2cc7fd4
	.xword	0x08142c992932c3e0
	.xword	0x8b5afa2924713731
	.xword	0x478e312a87b8c512
	.xword	0xbea9530019c28fa9
	.xword	0xf1a04f6840d9e876
	.xword	0xbdd1a5ec4f59276f
	.xword	0xe341bfad5b850187
	.xword	0xa760b2608575c8d2
	.xword	0xec811859ff6eacac
	.xword	0x2a08d75a778790f9
	.xword	0x1a4bb7daca33d72c
	.xword	0xdf28785e8fd4fcfc
	.xword	0x92ba41a2af5f57e9
	.xword	0x6b8dcf0c172eebcb
	.xword	0xddcf3e0f9451cb19
	.xword	0xfd650a9e550f9a53
	.xword	0x713839ea51caa05e
	.xword	0xb60248c4dbb4dbe2
	.xword	0x30b5833f79318126
	.xword	0x37a7e328dbbec293
	.xword	0x3053e2417c00bfd5
	.xword	0x9d3a4886f5a4c1f1
	.xword	0xbc8cb2ac1742d808
	.xword	0x697d577e88306068
	.xword	0x62ae0794d63ef4d5
	.xword	0x4d354ece1dcf4fdf
	.xword	0x3cf6420f554b7386
	.xword	0xe89a3abb0601bb8b
	.xword	0x75a36e3ecb23e0ee
	.xword	0x9a503d553bfe994f
	.xword	0x26de7e0df275772c
	.xword	0x4923c0d189fbf5fb
	.xword	0x3c115326d007a0f5
	.xword	0xfcca7536208e04e9
	.xword	0xf37831d7498533f8
	.xword	0xe25280d3e92a81d7
	.xword	0xd631f0e056acf119
	.xword	0x1e4169f5e99aae35
	.xword	0xe150c11b7b6d5c73
	.xword	0xe207c52a9f331a20
	.xword	0x6660d6d32e4548d3
	.xword	0x0376b2aa27cf933d
	.xword	0x52a6a375c5427b2e
	.xword	0xbbff89e823dcc5b0
	.xword	0x155dc3db5233fb89
	.xword	0x8e89ac474962dc5b
	.xword	0x05f25d82318aac40
	.xword	0x636ccd2906582133
	.xword	0xd74d084c518d0b5c
	.xword	0x364f7f8de390c6a2
	.xword	0x61b11f7fe68c809b
	.xword	0x3e7bbcb7b2b7e3f6
	.xword	0x9a0559274284d337
	.xword	0x3126d4ccb22c88aa
	.xword	0x155bef520076c0d7
	.xword	0xd89b2762cb8f5a5d
	.xword	0x0580da11ae22dd41
	.xword	0x8291e5431eb6d86e
	.xword	0x1969adb63734ba01
	.xword	0x1b7008b353d93d65
	.xword	0x6c1ff621c408cf42
	.xword	0x8827c20cd6108b9a
	.xword	0x28aa4b8024d5ab50
	.xword	0xe4ebdcd02d8df3fd
	.xword	0x626a92cff36fd678
	.xword	0x687617e9d3545c50
	.xword	0x43cd23a646352ce6
	.xword	0xba03d2515bd6353e
	.xword	0x869c194a5651c753
	.xword	0x9d22e7e007159e64
	.xword	0xfb80cd8345542f3e
	.xword	0x70f9fe06c4202451
	.xword	0x1b076b2c2896c0ca
	.xword	0xa2224270885805f0
	.xword	0xf6bbd775033bc79a
	.xword	0xf13c381a5047ac85
	.xword	0xba64b581d02d28f6
	.xword	0xf0bd4a68dd0709df
	.xword	0x22477faf24069c66
	.xword	0xe2957e156e1c96c5
	.xword	0x448e7a43e5ec906a
	.xword	0xd401b58c4593ea5f
	.xword	0x9b5e6f0c47300b3e
	.xword	0x6c31aa21d162900f
	.xword	0xb28d7a8471cbeb9d
	.xword	0x55e4d950f8043bfd
	.xword	0xc411dd1bdbcab2c8
	.xword	0xef052ae336bf4352
	.xword	0x0b668b50c28a6b07
	.xword	0x137a312362523800
	.xword	0x507bd840d9221fb1
	.xword	0xea2875af35a3ebf4
	.xword	0x2a9704295bc67715
	.xword	0x9f17244161e8d4fa
	.xword	0xcbe7cad2a1469bb2
	.xword	0x796ae959dc59e513
	.xword	0x90da058f9b4b7894
	.xword	0x9dfb47da43f0feb8
	.xword	0x2a06256e81328aa2
	.xword	0xaec87d7498945271
	.xword	0x722a537a891f4de4
	.xword	0x8142fffb25955953
	.xword	0xb2818094f9b3b6ba
	.xword	0xf040c219b4729d95
	.xword	0x7c9ace23363e80f5
	.xword	0xd4e2faef2437b7b4
	.xword	0xfadb3e1f3794cce0
	.xword	0xa2e1b0c4ba920eef
	.xword	0xade5ddeeb38679c5
	.xword	0x78d7c7e72986b700
	.xword	0xda2d3a7434c22b77
	.xword	0x322629726cb611fe
	.xword	0xdf90cd6d577661f4
	.xword	0xc3da8edf1dae09bf
	.xword	0x222d03a5fa198dfe
	.xword	0x51cbb40cace4b7f8
	.xword	0x7821d2b812c8aff7
	.xword	0x4e53d92e2555ce50
	.xword	0xb5b7b9a0b9011769
	.xword	0x065e575c928ba19d
	.xword	0x2152baaeebb19a84
	.xword	0x45c4c67645cb06d1
	.xword	0xf20c498f26d80fa5
	.xword	0xeae0ed8c55a2c9ee
	.xword	0x59fc7bad914a3e87
	.xword	0x0adc24385d0155cc
	.xword	0xdd4f4d1e94388fdb
	.xword	0xefbca61478cca96d
	.xword	0xbcc5006b0c5edd12
	.xword	0x9730b489710c6a92
	.xword	0xcfef0394b2e82a12
	.xword	0xa8e44c274acc7322
	.xword	0x7ed880d7cb892202
	.xword	0x138b58fca52f58dc
	.xword	0x5ba8c42a5eb2924a
	.xword	0x2a9f782030a931b1
	.xword	0x7b9175ba4b2ac5a8
	.xword	0xcb9bc507ce81a410
	.xword	0x439671d389dc9c09
	.xword	0x913a7103ccdc843a
	.xword	0x537d95774e6437a9
	.xword	0x0ad51ffec633d0c3
	.xword	0xb680f451680b37a2
	.xword	0xe7c024f1f0176bcd
	.xword	0x5b736a38f67d2e8a
	.xword	0x54488949cf254d2a
	.xword	0xc93887fdbaa968e9
	.xword	0x6b7f997f9cca24c2



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
	.xword	0x35af407bd4a2a0fa
	.xword	0xd5c9bd96ead1fc67
	.xword	0x8a16f3d2c1c091d9
	.xword	0xf6074c91495b2c31
	.xword	0xcb2920a43bd9f368
	.xword	0xfd38333b82c55fb5
	.xword	0x3edf7625dd849762
	.xword	0x47d09bd87dd86505
	.xword	0x40da57ef99475343
	.xword	0xa78f990d52630a7e
	.xword	0xfb8a705be27685c7
	.xword	0x5758972001f5b482
	.xword	0x224e801a3ac5af06
	.xword	0xf94398a479097857
	.xword	0x43ac27b8d3ed6901
	.xword	0x9a70b8b4d654acd8
	.xword	0x89aa5d85881465ab
	.xword	0xb86feee25c403303
	.xword	0x5733eb971b3c7d37
	.xword	0x1222db692e560d89
	.xword	0xc25e429a5d9c7a9d
	.xword	0xcdc2871922972e7d
	.xword	0x3b69b5cfa3c872de
	.xword	0xfb1f54608aea2f4c
	.xword	0x196a2d8837ac85d5
	.xword	0x38127f475d02ea0a
	.xword	0xe27a7d39ef1c0d90
	.xword	0x3661df3f6edbd80e
	.xword	0x51d6aac180444907
	.xword	0xac7020c9074dbf00
	.xword	0x15d32bb402904992
	.xword	0x6ea5eb79214724cb
	.xword	0x8fb9c9177228af04
	.xword	0x3825a2bc4d1152c1
	.xword	0x40309b4bba5aec84
	.xword	0xe75ec94fff7202ea
	.xword	0x67ddb1033a9eec18
	.xword	0x0f2456466afeb93c
	.xword	0x8f208c8c02b8dbbc
	.xword	0x54ab8da420871070
	.xword	0x9f76b05c54d549c1
	.xword	0x210d6e5c99304d3c
	.xword	0x7ccfb497be5a69da
	.xword	0x4bb3512678b19d98
	.xword	0x16382ca4aff0f725
	.xword	0xaa9ebdd3c9d734b2
	.xword	0xeb516136f73f63c3
	.xword	0x13184e518d5c2609
	.xword	0xebbb74476d554515
	.xword	0x4152bd582df9038d
	.xword	0xf278a9c910595fc7
	.xword	0x16cc1ae428ff2667
	.xword	0x74936a52e367cac3
	.xword	0x1e6e08ac6f7c8f42
	.xword	0x5733e349ad71b9d1
	.xword	0x83a2fef27354dc80
	.xword	0xfa21a5a2807d0340
	.xword	0x3c9ab0432b7ec5ac
	.xword	0x44f54a457c7d54a8
	.xword	0x388c72301963c381
	.xword	0x659085318f3d1185
	.xword	0x16a90f37b0265c6c
	.xword	0xe7f544a51ee92fd7
	.xword	0xcea0086736fd11f6
	.xword	0x21fd0f58117d14fd
	.xword	0x0fce977f4adde6bc
	.xword	0x10a2dba33b156894
	.xword	0x3060958f497302b4
	.xword	0x969aa78f809c5328
	.xword	0xef37bdba16c77982
	.xword	0x711c22c274cd7d40
	.xword	0xabe77dc6890b04a9
	.xword	0x405693b4fd37f7bd
	.xword	0x1371d04c1c2f4b20
	.xword	0x5ede56ba11d99c11
	.xword	0x6d8b575db325cf1b
	.xword	0x3289144f4f288241
	.xword	0x42758522e27cb718
	.xword	0x7ea2ceb2e7ebcffa
	.xword	0x1add004f7d14ad9f
	.xword	0xaeb409be5457544e
	.xword	0x8c8b3ec7e597a244
	.xword	0x7689702d7ec38879
	.xword	0xcdf605a77ddf180f
	.xword	0xc72637a821353d74
	.xword	0x02e286952acc57e9
	.xword	0x1d6d2d027f064a78
	.xword	0x6a314a7bf2378f7a
	.xword	0x4a5aa2da7be0830f
	.xword	0x0402b9d56537018b
	.xword	0xb07b5c711c278e75
	.xword	0xb4d2c014d196ac08
	.xword	0x48ba2d5c39d166b0
	.xword	0x3b0918b9bcf1a148
	.xword	0xf281af875936ef62
	.xword	0x7418103b9afbec68
	.xword	0xed5b0e0b7e575edc
	.xword	0x17524761ff1a6bfa
	.xword	0xe21a124acd5a7f15
	.xword	0x4729b98c0a08e211
	.xword	0xe60ed64015719af8
	.xword	0xaf0e8b9952ac5f9a
	.xword	0x802973a3f408f094
	.xword	0x99812b572b6fc3df
	.xword	0xfad443650b78d4ed
	.xword	0xfe9c2b0aa0ca1243
	.xword	0x6c94bab991c84190
	.xword	0x3a9ef77c562f1461
	.xword	0x8fc2c0f55020b261
	.xword	0x0d2f694850e9b8fd
	.xword	0x61f6caf0ab036171
	.xword	0xe038802f0c24fdd1
	.xword	0xea1fc618ff334138
	.xword	0x93cf2bd5f1f678b3
	.xword	0xf11ab06fd569db74
	.xword	0xdbf29c2b3da5ce42
	.xword	0xd37cb489d9b85808
	.xword	0xc2163b851c8c038c
	.xword	0x80be563f8aa2a7f2
	.xword	0xdbe455643037a6c0
	.xword	0x9496e93710c58f91
	.xword	0x5e8112b10a7fda97
	.xword	0x5e2c48a6f9f56613
	.xword	0x615c2efedb5bf730
	.xword	0x6ee1e6bed54351be
	.xword	0x57e2fda8b39c59b1
	.xword	0x128922d6d4467392
	.xword	0xb2f894df99bae5d8
	.xword	0xcb029d4274d201cd
	.xword	0x34e873e9986f71bd
	.xword	0x14e52caa1202e21a
	.xword	0x130755f8c5435c81
	.xword	0xa1c79b0dd26d6a74
	.xword	0x96884ef0f89380c0
	.xword	0xadb689302ff45e8a
	.xword	0x36eda42d930ef9d9
	.xword	0x615066540fc573fa
	.xword	0x17afc6262d563b0c
	.xword	0xd7b812756bd56086
	.xword	0x1b8b492b1a136340
	.xword	0x8d349af4f1c3379d
	.xword	0xa0e3fcbc9f8e1f32
	.xword	0x8f7826d90f53f471
	.xword	0x6d55efee1c243407
	.xword	0xe9fdee8bb81b6ff8
	.xword	0xfa61c63d22c6ab33
	.xword	0x32cc297d9d5d68ce
	.xword	0x8d12cb7abd81daf0
	.xword	0x822018f772184253
	.xword	0x05d57c5e4c15a1f1
	.xword	0xb8d054556fc9f8fb
	.xword	0xce449a87e7598390
	.xword	0x56dd30dafc302b67
	.xword	0x6e7b59f1abc39591
	.xword	0xf0fc7659abdaa7a0
	.xword	0xc80f6a7fe08eb00e
	.xword	0x8190a50a20c1377a
	.xword	0x10378162aba908ee
	.xword	0x26bd1d36278c83ea
	.xword	0x1c6774125fd14709
	.xword	0x24f5a39306e38bb9
	.xword	0x1bda4e56a5d18a16
	.xword	0xf03a74d0ea289d8f
	.xword	0x4272afe6ca784a08
	.xword	0x4c1e4a5c4b9c98c5
	.xword	0x650110b45a3571df
	.xword	0xee07ee1958697fd8
	.xword	0x8c1918247af09d13
	.xword	0xed05a7c610011128
	.xword	0x204527411c2c5184
	.xword	0x8a192b0a0ca47b3b
	.xword	0x31f470b099c146ae
	.xword	0x97417beccb33faf9
	.xword	0xe847d56a72524976
	.xword	0xfcf6140f5fc002c8
	.xword	0x596838a2bad8d515
	.xword	0xf37005d7997ff409
	.xword	0x196efdf8f300abb9
	.xword	0x201e1bde64008b5a
	.xword	0xe8b29846a7f26ee2
	.xword	0xa58ed59365b8b5b3
	.xword	0xe72a4fcc4ef60381
	.xword	0xb575937450fdb6bb
	.xword	0x7fef63b4412592cb
	.xword	0x8cea74fc98dbbf88
	.xword	0x6418fc8bddcff69d
	.xword	0x7242f400d22b7ab6
	.xword	0x35e343593d017c79
	.xword	0xc8b4fac32000d785
	.xword	0x798233b946af7bce
	.xword	0xc9b5ac1c78d9a9ed
	.xword	0x2e928e285ef9fd1e
	.xword	0x8aef5a02758545bb
	.xword	0xe2925cdbf6e650eb
	.xword	0x058e554ef5e9f298
	.xword	0x44ba261859c1fe18
	.xword	0x991717eed45d42b2
	.xword	0x972c1617ea119598
	.xword	0xd883e4eb13d06e46
	.xword	0x65543da11741dfee
	.xword	0x5313a38c676c9e80
	.xword	0xeabe12f1f3322f39
	.xword	0xa7e5c2fc12e8dbf9
	.xword	0xbfcc45523dfdfd0c
	.xword	0x3ef4b0353b0b3429
	.xword	0xcff294f59dfce725
	.xword	0x3df616eff34851a4
	.xword	0xd4209d8152513d01
	.xword	0xa301e34004bec094
	.xword	0xaa92bba0fbd3c140
	.xword	0x1ab2acf4c8c131fc
	.xword	0x2eca0f2f3152744e
	.xword	0x928743b37cc1c3c5
	.xword	0x5cc7ad4ab82d1a23
	.xword	0xc18e00d8b933bbe9
	.xword	0x637f081830505a91
	.xword	0xefad4dc15be0475a
	.xword	0xc844d0f3fd69bd64
	.xword	0xd7b2dd34b35aeab4
	.xword	0xb8d2892bd152cfcd
	.xword	0x81289fe762adbe8c
	.xword	0x7689733f6c715962
	.xword	0x6274a03004c18de2
	.xword	0x606f90f147a5beeb
	.xword	0xdc5b33dfb184ac24
	.xword	0x820505f7d94501a0
	.xword	0xb10fb3cb97f6f08e
	.xword	0x5ea33b3e1807420f
	.xword	0x6d5555baa2ddb9ab
	.xword	0xb354bcb0fd961e46
	.xword	0xd2de95cb5a04170d
	.xword	0x541d2b99026fc81b
	.xword	0xc0cfcb44c17efc6c
	.xword	0xc0df106f70841918
	.xword	0x67ebeb7d317fd121
	.xword	0xeaf21ef296324cca
	.xword	0x9fcadb5447a7c65d
	.xword	0xb7bd55cb0b3ae7c5
	.xword	0x810484b93c0a9376
	.xword	0x6a7eea37d5eca27c
	.xword	0x9b2b40b2f4137627
	.xword	0x0d06213ab806051c
	.xword	0x646b73828955a1cf
	.xword	0xb4f4f049a7b897dd
	.xword	0x354a31b0da5d6ffb
	.xword	0x3fe0e218cc3eadef
	.xword	0x7e0d30dca7949d48
	.xword	0x15c8bd1c03e82482
	.xword	0x557c0eca278abd9f
	.xword	0x180ec4cc1ea79c5f
	.xword	0x8bfcb9bb256b1379
	.xword	0xc1d46494a7ed053a
	.xword	0x98388a740297a597
	.xword	0xc2d1cc4a2ee37eb0
	.xword	0x8d21403435fd3be2
	.xword	0xab99dd1ee2ce7885



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
	.xword	0xaf16a61c98a7bb2d
	.xword	0x5ff5d36ec1d099af
	.xword	0x6915058507c45e9f
	.xword	0x1877aa06a5e6b9e4
	.xword	0xbbfdbc7860c1e63f
	.xword	0x6d25f6f8197be00f
	.xword	0x41ee9e2d4b19ddc0
	.xword	0x7d58b22fde309d6b
	.xword	0xad097ee20d5c4b67
	.xword	0xfe7f0ad21ecb0b8c
	.xword	0xfcd8708fb398560d
	.xword	0xbe0a196d08fd7e25
	.xword	0x161ed766166ed2ab
	.xword	0xe81a7259a0770597
	.xword	0xdcad6a5addddc073
	.xword	0x435bad8d7848b26b
	.xword	0x5432f5e47a690833
	.xword	0x8aa0466f92998843
	.xword	0x5cf4c100e882c992
	.xword	0x4633afc925aebff4
	.xword	0x30526e7ff390050b
	.xword	0x232ab763d5b9820d
	.xword	0x75d234a2d70a0b6e
	.xword	0xf0b2202e5d3b9ff2
	.xword	0xaed14b4352221a59
	.xword	0x463bfbdfad4289f7
	.xword	0x4fbd2a6816830b0b
	.xword	0x8e3993c045c32836
	.xword	0xa51704c28bb825c4
	.xword	0x2b70be74af7dfc3a
	.xword	0x8e7747e749addad2
	.xword	0xd19a610d6a15ecf1
	.xword	0x167b219ab041a112
	.xword	0xcde351d6b20a7ccd
	.xword	0x275b0b26ae0c5ebc
	.xword	0xf8a685e75210bfab
	.xword	0xe39323d18ef84677
	.xword	0x2d3cd1f2bdaf4387
	.xword	0xced8f19d78a53be7
	.xword	0x05e2ef7eededfc56
	.xword	0xabaf7ad73fd7ac0c
	.xword	0x60839787e86eb3e5
	.xword	0x8b9d218ded885287
	.xword	0x35e901432a60b55d
	.xword	0x1c1f304f66ee1715
	.xword	0x4f38425b9569c24b
	.xword	0x4a7663497019a24b
	.xword	0x69f13c8fa90217d2
	.xword	0xa8be6bd65a2358d2
	.xword	0x5a40b2e93c90f492
	.xword	0xdd4d2f027b6f16dc
	.xword	0xe7bc1c18a9b7635a
	.xword	0x0daae610efc3c7e9
	.xword	0xc105172fc9978304
	.xword	0x40b0a6f5a604e787
	.xword	0x4172d6f3622ebec0
	.xword	0xad4ef9cf8c4c83ad
	.xword	0x8aaa9bdc7318a2ef
	.xword	0x98c1cb3b2c6e53a5
	.xword	0x58e25dfdfedae560
	.xword	0xf1c1affb40b32c13
	.xword	0x06551dddb398138b
	.xword	0xeddee4517e4f79e1
	.xword	0x2c3a77700c0ef44d
	.xword	0x1f4e07849e45df60
	.xword	0x53e7f1c574c5478b
	.xword	0x1606c3bb7f2f9ac8
	.xword	0x6a0979fc72bef1c5
	.xword	0xea1e8fcd3466f9d5
	.xword	0x72ab7307c814e1eb
	.xword	0x90fd4ad4d1698bb2
	.xword	0x719a5d092ee8ac08
	.xword	0x0e7325a2576e6e22
	.xword	0x6878afc64914daee
	.xword	0x0ac6dcf56cd9f209
	.xword	0xade8d9c1635d6876
	.xword	0xb3c7a8c11df397b3
	.xword	0xc5a317f7da2fe993
	.xword	0x519324a2034c8d78
	.xword	0x835f430abc70ecc7
	.xword	0xaae7bdd19e78ec82
	.xword	0x2ac308eff327dab8
	.xword	0xdc47502810846e7c
	.xword	0xb2652a2b25a46837
	.xword	0xd95fc42fa06aa974
	.xword	0x3e020601792e2957
	.xword	0xd56605fdfc0d8ed2
	.xword	0x207e1effe5bfbeca
	.xword	0xc4a908f23f193e6e
	.xword	0xd4cab5cc698d6f60
	.xword	0x58e57755e4db21e5
	.xword	0x86a8c8f8427a17cc
	.xword	0x3104b0dd2ba0a310
	.xword	0xce59d48307ca6a50
	.xword	0xbd14bf24be67a9e0
	.xword	0x7e14c7c6726bbdce
	.xword	0x3329377c7e90de02
	.xword	0xc3fe80e2bdeebdad
	.xword	0x8bfebe8653b53460
	.xword	0x9e55800705856873
	.xword	0x98b049ce52ef45a7
	.xword	0xdb8846969f357ad0
	.xword	0x2451682838adc043
	.xword	0xcf539c8ab78d46d8
	.xword	0x891e5a8e5d93daa8
	.xword	0x34a401835beea75a
	.xword	0xbc4c9b42f1a08785
	.xword	0xad417ae59c7f1761
	.xword	0x1856a314b397324b
	.xword	0xbdc76a6262c3532f
	.xword	0x9d994848aa27827a
	.xword	0xd0b507f42bb06a82
	.xword	0xdbb3025b022af3f8
	.xword	0xa73f424f06e89b3a
	.xword	0x5ab24314201e074a
	.xword	0xdafaa68147f8b42e
	.xword	0x976a2b1ec098faac
	.xword	0x8163b9b9a95e6c75
	.xword	0x636989fdb6f482e8
	.xword	0x0fc858ab70d2b1dc
	.xword	0x06bb9478b9342cff
	.xword	0x751a00ea6e686334
	.xword	0xd23355fc6011ea6c
	.xword	0xca10aadd46664907
	.xword	0x7b19ce17accf38db
	.xword	0x61052a74e854649b
	.xword	0xfdd1a644eeba1020
	.xword	0xdc3c674b7902b9bc
	.xword	0x6cd80a19c4e6dce0
	.xword	0x5656d2082b69064b
	.xword	0xb591162686d78da4
	.xword	0x9c2cfd01ab87d12b
	.xword	0x06e525e3eeed3164
	.xword	0xca18c0082e51d459
	.xword	0x50596469f9ba7a7e
	.xword	0x7d41f7c0c6049974
	.xword	0x159480c8d83b107b
	.xword	0xc14f1ffd86b2b172
	.xword	0x992965e2acd9e1eb
	.xword	0x09af3c23da0daf86
	.xword	0x44063c680ddff407
	.xword	0x9bdce5b20b4f03e3
	.xword	0x47fdf777538c2816
	.xword	0x98bb082cfd767d65
	.xword	0x98866f2dc586b636
	.xword	0xe77e66df9c6f8f7a
	.xword	0xf08c3f9a9fc7c680
	.xword	0x83d25bb09b871422
	.xword	0x7fbe6d01f2e0a118
	.xword	0x49e718e07cec64d9
	.xword	0x753e987e6325e4b7
	.xword	0xa1169ed95e84e489
	.xword	0xd268371cd59dbb00
	.xword	0xaa1b2b83f4bcec40
	.xword	0xf5b2ea33ff0019f9
	.xword	0x70269dc9bd964205
	.xword	0xacaa248f19744e96
	.xword	0x2a93b2c9d3f53d1e
	.xword	0x9f4598545e13b7f5
	.xword	0x3edbc0624d55726a
	.xword	0xa258ded224a5c99a
	.xword	0xa130e67025ea5554
	.xword	0xe94dbb7862f6c376
	.xword	0x1701817750182e44
	.xword	0x274c0c3cbbfb64bf
	.xword	0x65f8cb11eb5821bf
	.xword	0x1b2b67ae1ebbf198
	.xword	0x7db65b4180daa99c
	.xword	0x74c62ce25e59e6d1
	.xword	0x1e13705e5a20fd54
	.xword	0x78c3d750c023b701
	.xword	0xb07e8fdbb60835b0
	.xword	0xffa4a3d1dbf24605
	.xword	0x9beb54f1fa9f4046
	.xword	0x1a669b54785e8e34
	.xword	0x502acba988a1fdfb
	.xword	0x0d8ae4743debd608
	.xword	0x5a09319392fd1228
	.xword	0x1cd36a2a8809d6da
	.xword	0x2bf300a825d14e39
	.xword	0xeec9ca54cc2e9d82
	.xword	0x035767ea43d90674
	.xword	0x2ee4b64b8b8b77b9
	.xword	0xe9ed857376e616fb
	.xword	0xa105cd382ae6da17
	.xword	0x7aee61b7efeea350
	.xword	0xfe208de84434a98d
	.xword	0xb92e3d4b4d4f98ca
	.xword	0x70a3f1261ca99324
	.xword	0xd7e4cbe848a56491
	.xword	0xb78c0e2e4ba69193
	.xword	0x634d18eb8fe60d43
	.xword	0xcce6e1fbdbf91f6e
	.xword	0x51e373b00314bb8e
	.xword	0x72572b844c1ad005
	.xword	0xd0f188069853e0cf
	.xword	0x4d6e08ff40e4c87c
	.xword	0x28f2eea500280295
	.xword	0xcd46f4b031153af8
	.xword	0xffea682c53e58feb
	.xword	0x3328ef20f87d15f2
	.xword	0x60ed9d49c673031f
	.xword	0xbf1b86f099629c46
	.xword	0xa2e8a9b8207d42a4
	.xword	0x31553f8ebe71c1c1
	.xword	0x828e9270f1e3a6f3
	.xword	0x874f533d33acf29e
	.xword	0xdb7e735a1d2154a2
	.xword	0x26c27d3534452213
	.xword	0x55d1c722133afc7e
	.xword	0xde03aef340928199
	.xword	0x34dbfb58e82a39dd
	.xword	0x337912b3ded9ce14
	.xword	0x200f0c11c804d67e
	.xword	0x69110b7f9a90933f
	.xword	0x0c6ac93089a8d960
	.xword	0xc12b5039a00d22d5
	.xword	0xecd1d9d79a211b0b
	.xword	0x0eab8819f34b3a60
	.xword	0x5524b9167de8ac4f
	.xword	0x445136ad659617dd
	.xword	0xaff2153991849074
	.xword	0x62fb32a9d1078512
	.xword	0x79da4d1fe0d11b71
	.xword	0xa2aaa2fe714abbe9
	.xword	0x9b9fc6c21add602b
	.xword	0xf54f3fbbe54d313a
	.xword	0x5335d4b18f765326
	.xword	0xfdd5839d5392311b
	.xword	0xa77c2a7c3892400e
	.xword	0x93389678682f831f
	.xword	0x5f79dac1604ebef1
	.xword	0xa75d5ec745703164
	.xword	0x57b6f6fa7fde0eb8
	.xword	0x3c196c57184860a9
	.xword	0x2906bd9514436725
	.xword	0xbbf463a0085617bd
	.xword	0x786c79c7dcd5cfd0
	.xword	0xa98e9fc2f8068608
	.xword	0xabe51834f42e5266
	.xword	0x5956fb147b17ef05
	.xword	0x5341c54d0ffc6d63
	.xword	0xa65b6aa0b00472a0
	.xword	0xe9c0634ea94755aa
	.xword	0x5fadceb7776e8ae3
	.xword	0xe5a6ad3fbee11803
	.xword	0x16a61e5124359a72
	.xword	0xb44cf2ca8133060c
	.xword	0x695704c2c291dbe6
	.xword	0x0a77d630f705d9fb
	.xword	0x897b367ba57aaca6
	.xword	0xb1840332f0335136
	.xword	0xf19b91883a59c99a
	.xword	0xe55bc574d279644d
	.xword	0x13f0de20fc5aaa61
	.xword	0xf0232efa87182bf6



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
	.xword	0x979683f87129a996
	.xword	0x3b92e08e6113b68b
	.xword	0xee99df6d55790471
	.xword	0x24b272f5dc64e314
	.xword	0xb6f7af9ace095e99
	.xword	0xc965190f93182a29
	.xword	0xa67fce6967cfa7cc
	.xword	0x66c2da910b869c73
	.xword	0x4561e4f5aec556a2
	.xword	0x502c7743661a0be5
	.xword	0x48643f24d010c90b
	.xword	0x89dabd6b4a632804
	.xword	0x803ab2855a5592fa
	.xword	0xda4cbada159bf2b7
	.xword	0xc6e1212b6d91a2c0
	.xword	0x331246cc0861cc55
	.xword	0x4b1243308b10cafd
	.xword	0x0b2e6ffd23adebc7
	.xword	0x63c4815eaf98ba5d
	.xword	0x90b431b33e3078af
	.xword	0xfddfa467142c5310
	.xword	0xa5a6093ae30e870a
	.xword	0x0dc2d129ebe68994
	.xword	0xd7d13ee0362bbfbe
	.xword	0xd56a15c2411e0f87
	.xword	0x6d554d46a1c55fba
	.xword	0x9835d56ec75333e8
	.xword	0x139da11d3825ea3c
	.xword	0x1ade6eae7bbc2eac
	.xword	0x717fd289d5b33cd8
	.xword	0xed09107365a055a6
	.xword	0x7737f9260f1ae970
	.xword	0x6e759da91da125dd
	.xword	0x2500002b894b7765
	.xword	0x1ee6da80145f7b0b
	.xword	0xcdc199445e5209cc
	.xword	0xe5ef8419d98d449e
	.xword	0x552953a3c9e2821c
	.xword	0x58a90111bac8b63a
	.xword	0x1badb5ee91ba7e77
	.xword	0xd280ae9a7a253031
	.xword	0x610ca1e4632f8f6e
	.xword	0xf37dcb9940df24e7
	.xword	0x192401fa006fa9c0
	.xword	0x2280f291c959b526
	.xword	0xa52daf9b279b70d1
	.xword	0xb5a5f44a32937cce
	.xword	0x1ad97b560538efda
	.xword	0x24281793359c776d
	.xword	0x0c95e4c708375bbd
	.xword	0x0352907ed9a9d54b
	.xword	0x5e8cfd5a33ee8794
	.xword	0x363cf0a3b6017ab0
	.xword	0x806fef386f19408a
	.xword	0xf582aa6ba670db88
	.xword	0xb115d2d8487fb294
	.xword	0xb52bd9d0c1d886ff
	.xword	0x24db699355c9b7db
	.xword	0xd1f9620ccf76a43d
	.xword	0x6852d83753fb7bc1
	.xword	0xddce7df83ecaf8b4
	.xword	0x885bae695b4c90d0
	.xword	0xcb5198a29acab14a
	.xword	0x6e4dbc78d32727ca
	.xword	0xb62a0888ffc5557a
	.xword	0x5c5577c548f6351f
	.xword	0xbaa7aef6a7204212
	.xword	0xdbebf1a21d816fc3
	.xword	0x4cab93f2be2c3afa
	.xword	0x8437f491f295b7a2
	.xword	0x700eda33633ce479
	.xword	0x2401c48bcd9e93fb
	.xword	0xcfcb06df700a27d8
	.xword	0x2419b9cbb5d8c51a
	.xword	0x167cb198103377c7
	.xword	0xb76a971cf2ca09b4
	.xword	0x340f2a034e5cdf4f
	.xword	0x38a65990923eefe0
	.xword	0xc8db2096100b97fd
	.xword	0xe32dc9ed254e4c56
	.xword	0xec27051f1c7114ea
	.xword	0xcf77c939f7c58d61
	.xword	0x9576bbf812cad80d
	.xword	0xa9e2d596088a0c68
	.xword	0xa0e677fd48a8fae4
	.xword	0x9ee8073295e94399
	.xword	0x3a924924f7890f28
	.xword	0x74434d8d5ae95019
	.xword	0x8e37824f76f0e511
	.xword	0x6bd0772993dde85d
	.xword	0x4b87172e420624ad
	.xword	0x68b93d2eda5a055c
	.xword	0xad22dfaffe58c2ee
	.xword	0xf2ce58abad481cef
	.xword	0x3cfef0ae6a3b431d
	.xword	0x13b080495174a432
	.xword	0x17dca887898d7d58
	.xword	0xe4989b74c965d98a
	.xword	0xe2e1ac659e35a0bc
	.xword	0x0adcef14bbb490d5
	.xword	0xfb652200ae47a051
	.xword	0x8d319bf528346447
	.xword	0xf638cc50cbb66448
	.xword	0x34010bf57cc366a5
	.xword	0x0ffa48257dedd9c6
	.xword	0xcc8548bf51e03336
	.xword	0x44564bf6817cc654
	.xword	0x0dc2249efc5303d3
	.xword	0x697cc3bf3ea1356f
	.xword	0x04bd072335bfff70
	.xword	0x04ef51f3217acd98
	.xword	0x9a75f1339216e50a
	.xword	0x8dd8d1e849ec67ad
	.xword	0x378ec632ec0446ea
	.xword	0x3425b1ef7c0c83d4
	.xword	0xd50da023cb829e6a
	.xword	0x7a716ab9c32715d7
	.xword	0x753b06d8fe672df5
	.xword	0x6fd6f0c6ae463d3c
	.xword	0x5980092594c41f5f
	.xword	0xcf3e5699f2835c7c
	.xword	0x5e4acfa84b9dc043
	.xword	0xfe32e257eb53a4e4
	.xword	0x9f5000963a05ba26
	.xword	0xf6f26b570d229cac
	.xword	0xd73ef79ac29ac0b2
	.xword	0x322f69353370920a
	.xword	0xacd3201846ddc5ec
	.xword	0x2dd197709d9a9608
	.xword	0x64e7304f3b626570
	.xword	0xed4772b9ea493e09
	.xword	0x9144924c203183a9
	.xword	0x0bbd882e4caf46ba
	.xword	0x4d2531d2eb2cec02
	.xword	0x44263543993858ce
	.xword	0x98f3eea3ab92c0b7
	.xword	0x031c75f1948666fc
	.xword	0x7c5f2839e285928f
	.xword	0x6a0c6786b518b5a2
	.xword	0xf127360d1308d611
	.xword	0xbcd0991a36b7c79f
	.xword	0x22ddef59b2266c68
	.xword	0x3f4af1aff9712a8b
	.xword	0xd3d305c006c53304
	.xword	0x290f489c453603b6
	.xword	0x7bc5c3f1738019e7
	.xword	0x9eae6fb539c84fd5
	.xword	0xa88a5200b8c7ffe4
	.xword	0x16d4181a15f29668
	.xword	0x5255aec184011201
	.xword	0xa86b4c05b25d0c09
	.xword	0x074536d924c8a447
	.xword	0x9e54d9a7a7f61328
	.xword	0x7b1a307f7ea3a997
	.xword	0x692e25ee54d65cc8
	.xword	0x8804c6e76f3774f1
	.xword	0x954534fb114442a0
	.xword	0x188fa49ab1ce2af2
	.xword	0x4f1f682bb1614285
	.xword	0x6dfc742cd33eae0f
	.xword	0x0c782f5803f4ba10
	.xword	0xf69474f786689d98
	.xword	0xccec8b080316ebde
	.xword	0x67b6136939332734
	.xword	0xc2c8478731f662f7
	.xword	0x401e2b94a5c309fd
	.xword	0x078c7df4fe83afe5
	.xword	0x493963fcc7951e39
	.xword	0x4580d5a4588fc068
	.xword	0xc8868abeef77c973
	.xword	0x71be790caaf6b1da
	.xword	0x3291c49cc6dc8fb2
	.xword	0x534f98ec3f994818
	.xword	0xfdb01ed062c34335
	.xword	0xd973196fa431eb3f
	.xword	0x9dec2f651d2954b2
	.xword	0xed5eb0a9882047f9
	.xword	0x15685c5c15db0959
	.xword	0xa46b784fa1dbf90e
	.xword	0xe39b86c37ac208f5
	.xword	0x1f2696999b3fe772
	.xword	0x1716d12ffea526ca
	.xword	0x0c510b931b966cfe
	.xword	0xeea2ef2d55cf14f8
	.xword	0x4d4d368e98639db1
	.xword	0x83bdff311516d9a4
	.xword	0x6ba03514f6ec4054
	.xword	0x8f0bf794a5ba3870
	.xword	0x933bee4d34e3ba53
	.xword	0xa06b448209d44692
	.xword	0xc4068d5c9b2c7c93
	.xword	0x612c1670002d2903
	.xword	0xa99cf0a829090a05
	.xword	0x9aba0deaf24f58a0
	.xword	0xfda4fb8658d9576d
	.xword	0x22be7c17c882e5e0
	.xword	0x5590464f8a1256b1
	.xword	0xfb217ebd72ff4a16
	.xword	0xa16a95af03899bd0
	.xword	0xc0ac959e261a5de3
	.xword	0x1e6a4599b53c41bb
	.xword	0xacad286162b19b50
	.xword	0x4045109c806f43b5
	.xword	0x954accc8db8eb10e
	.xword	0x652ed9a90d34a232
	.xword	0xbe84b506c5594777
	.xword	0x3d7487f0073fa4c8
	.xword	0x1df410171676b9ba
	.xword	0xf939fd1946e170cf
	.xword	0x99fc9d34c603e5a0
	.xword	0xe45f8b48b102adff
	.xword	0x7a1b3da75c97523d
	.xword	0xc5ed6d49047cf64e
	.xword	0x4cfe5781e41ae0b9
	.xword	0xaaeaa2f1d27b4476
	.xword	0x7bdd402cff3d358e
	.xword	0xcedd3dba85af0000
	.xword	0x939756978e6543ea
	.xword	0x312ae9f4128dc7b0
	.xword	0x52165c7892044a02
	.xword	0x6780c1ee06ef401f
	.xword	0xd03442db9f2e9c39
	.xword	0x07c89a3cf1d3f2d2
	.xword	0x798255d7bdc1bb7d
	.xword	0xd62bdfdeb9d501fe
	.xword	0x203471a66c9e81af
	.xword	0xceac9bbe3127f6ff
	.xword	0x71baf291269291cf
	.xword	0xcd7c82c2edd813c5
	.xword	0x399450fc70835042
	.xword	0x234871ebfb9a3194
	.xword	0xd2b565d53c1fb037
	.xword	0xdd177010c31ec178
	.xword	0xb459ea886769229a
	.xword	0x9f491fdc2ef7e652
	.xword	0xd792e2f30592cc90
	.xword	0xf1b3c1d80319744d
	.xword	0x8d54e0a9e9aaf75a
	.xword	0xb0131d7f9f731ff0
	.xword	0x38de05e8c7679864
	.xword	0x59cadc50264e4fa4
	.xword	0xf573c59093652609
	.xword	0x8c458371fd2f902c
	.xword	0xa8cd1970032b7028
	.xword	0x64f46cdcc541e7a3
	.xword	0x94be98e73786c00b
	.xword	0x9405bbb73c4f1760
	.xword	0xe7f1b07a96d96826
	.xword	0xa8be634566974de8
	.xword	0x75d90a0d1fce10d5
	.xword	0xc561fc36b290512f
	.xword	0x09fa09db1a30015b
	.xword	0xad20f201a4f17f13
	.xword	0xb379d6503a83c813
	.xword	0xa5de9ceb8daa3791
	.xword	0xfe82fab2711ef9d3



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
	.xword	0x86491e4f394dffd9
	.xword	0xcb878691022a0ef0
	.xword	0xef46e080452aa736
	.xword	0xc278fd80951c808a
	.xword	0xa76506079da57f63
	.xword	0x25beb7359de45620
	.xword	0x8b3104358a626130
	.xword	0x9fe9f1264cd37861
	.xword	0xc66bc1e699a8a78e
	.xword	0x68519e4cfde0e858
	.xword	0x920d31fc91f64c66
	.xword	0xbb36facc49079729
	.xword	0x66f31cc5a30bb4f9
	.xword	0xe8b95be8a81fa651
	.xword	0x19be9eb0abb1fb92
	.xword	0x9e70451f0097b9a5
	.xword	0xc956a6f484e2b8ef
	.xword	0x4359016794674d80
	.xword	0x3836e5ddadf77597
	.xword	0xe378b264047dd642
	.xword	0xd1e4ab00773a58d5
	.xword	0x3012b38549b3551c
	.xword	0xbca56708abee9dfd
	.xword	0xd1231cf285e95e17
	.xword	0xbe52e1e02c075b95
	.xword	0xcafabc5fd38b9512
	.xword	0x3a1fa17f4428b53f
	.xword	0xd8ebdca5ad872703
	.xword	0x9777caf832ec09db
	.xword	0x1f9b417da6969520
	.xword	0x02b5e5267915a316
	.xword	0xcf485cdf2d77c00c
	.xword	0x9e3ae934399f77c7
	.xword	0xac3bc0d7d1c660cf
	.xword	0xcf1b65c6010ebe1c
	.xword	0xe4961eb9de40352d
	.xword	0x66e1e63da34b4946
	.xword	0xaf7d52e7649c8bbc
	.xword	0x4bb13ac91768f3d4
	.xword	0x67311de6dc8de422
	.xword	0xa30c7cd0ce89e068
	.xword	0x2ede8d2f852eaf17
	.xword	0x6f661c5c5fd89a56
	.xword	0x3c35606cc06908fe
	.xword	0x043039e54a263cb9
	.xword	0xa4f11369361914cf
	.xword	0xe6642579fc224c7a
	.xword	0xb8416945055c694c
	.xword	0xf354d4c9987c569b
	.xword	0x5152c5f9ca8b23ea
	.xword	0xb3b694fa9d49e8d6
	.xword	0x81ac9e308c71766b
	.xword	0xa605e611662db9b6
	.xword	0x1a0c2eac8c18d939
	.xword	0xcc204da7a31d773e
	.xword	0x113a6bba95c94a0f
	.xword	0xe1bcf2a2034f8db6
	.xword	0x1a03e62877388c1c
	.xword	0x9fc37569709f7e76
	.xword	0x9f30e4dcdbd32213
	.xword	0xdba71a95d2819199
	.xword	0x4019ce2a888217cd
	.xword	0x361cc7d70ae040e6
	.xword	0x605ad5cfff64abc9
	.xword	0x1c2ae41ea1b4d1be
	.xword	0x839acb0374298ac7
	.xword	0x58699cc726bb701d
	.xword	0x74ca6f9d744f3118
	.xword	0x8c3f0d456b9524c3
	.xword	0x82b48876fe77a168
	.xword	0x7a23f4594521f7f3
	.xword	0xa50b0d294cb42067
	.xword	0xbe0b7845f602bfbd
	.xword	0xf1ab5a4f17082f3f
	.xword	0x88a4fe3aa6d08f3c
	.xword	0xf13fe926558d8e5e
	.xword	0xbc57dde21da79ab2
	.xword	0xbb66ac8f368a4102
	.xword	0x728e48c38e30d52b
	.xword	0x6365d3f15a4e178b
	.xword	0x27251928410e7d22
	.xword	0x421e35434e85750e
	.xword	0x46269f708225dbd5
	.xword	0xef125aee7f3501eb
	.xword	0x8ab7e3410f240b7f
	.xword	0xdcbb3ebe17b3853b
	.xword	0xcf464be47bff3333
	.xword	0x45aa4811c039bd6e
	.xword	0xb42b678fd8affe55
	.xword	0x4cadcd6ad5661755
	.xword	0x12e3706b1ddf1409
	.xword	0x401d8a640b041185
	.xword	0x43bbacc81ba9e00e
	.xword	0xfec70cafa379d06c
	.xword	0xcf408fba7474f30c
	.xword	0x89bfbaf20ad74f36
	.xword	0x5dd50d212a9e94c4
	.xword	0xa71789dfc09f444e
	.xword	0x27b172042925e735
	.xword	0xdaca146b46a611a9
	.xword	0x7979c9225d611415
	.xword	0xc7ea427b97863acf
	.xword	0xe6f167f81ecb5f84
	.xword	0x69192d50f69564c0
	.xword	0x3a79517fc51182ff
	.xword	0x963dd9f9fa1d1fd9
	.xword	0x5913766f2e6c0d9e
	.xword	0x0e9d874329c5b2e0
	.xword	0x15129de2db5e8c51
	.xword	0x760a69edbacee191
	.xword	0xfc7656ffcdef6abf
	.xword	0xb88354d4dac189aa
	.xword	0x3839a24ac6f0d827
	.xword	0x0ab8eb5047e4ed68
	.xword	0x8b85c7ad074b5422
	.xword	0x3f94e4aeb9489fd5
	.xword	0xb341bec5f240f54e
	.xword	0xad2036acc6b67de5
	.xword	0xd3a67d2c611ce173
	.xword	0xe58757e2d634db35
	.xword	0x8741ecc4ed85df2b
	.xword	0xf585dec32617bfb5
	.xword	0x4ee67131d5c13342
	.xword	0x784469e98ad9ad0d
	.xword	0x59a498924539a1c9
	.xword	0x0069d7c7e27ad5cd
	.xword	0x8652d3100e9111bf
	.xword	0xfbd4e1043e759f42
	.xword	0xb1e9971588d6d9f5
	.xword	0x264b72600d70eb4f
	.xword	0xcf8fbaee17628cda
	.xword	0x1a0c1fbf07465e6e
	.xword	0xb4348ba959eb16c8
	.xword	0x79d1c8b9b93261ca
	.xword	0xb8cd7fdf6848b680
	.xword	0x78426ee1cc9a443d
	.xword	0xb4b35777c4a76de8
	.xword	0x9fcf5058abb78382
	.xword	0x82d649951f4aa3e1
	.xword	0x0081bf7b1e7920bc
	.xword	0xbd991b46410c5328
	.xword	0x564791f6f7ed08c9
	.xword	0xd8b80071b24b7320
	.xword	0x5397646ab19848e1
	.xword	0x502b300b8e41dc66
	.xword	0xe4c68cbbd9a9f8c9
	.xword	0x827b81ec21bb847c
	.xword	0x1c30ce5dab2ebb09
	.xword	0x0c9deac2a5b29ca7
	.xword	0x4237a34078a4c5c4
	.xword	0x776cb066b8591e2b
	.xword	0x1083fafeadddcad6
	.xword	0x8b9102c84bb47647
	.xword	0x29e09cb7eac2805a
	.xword	0x59cda446d37c96eb
	.xword	0x4435f1b7a795fef1
	.xword	0x2ff4a270dcdb64c6
	.xword	0x8bf9c16400290a3f
	.xword	0x41fc425f765d8305
	.xword	0xaaf63517e2415f85
	.xword	0xedddfbc37e5b3fda
	.xword	0x6eaea81a197e45b1
	.xword	0xad178afcdf844203
	.xword	0x2d7ca4cdd4b4ae88
	.xword	0x47c5e9effa217599
	.xword	0x7ae7b6a94c84b97d
	.xword	0x47e7b213b2236e2e
	.xword	0x53388c9258653d41
	.xword	0xb7b804ff68d6fafe
	.xword	0x3cad855deea458e4
	.xword	0x4682b2de499d9499
	.xword	0x21bcb821217e6ba7
	.xword	0xa37fe1bd1d01669c
	.xword	0x42c9e71eab956313
	.xword	0xb66eb912cefd569a
	.xword	0x0e48fdbb08eb4da3
	.xword	0x5c31088738f32c40
	.xword	0x6794f3aa4547e01b
	.xword	0xd682350027d92f24
	.xword	0xb07e5423cc857d69
	.xword	0x0285d277f14c4fd7
	.xword	0x5585d19a4beffe0c
	.xword	0x8a8006ef79e10c5f
	.xword	0xccfaf3a239309fdc
	.xword	0xb7084f1e103cf152
	.xword	0x57985ff96b343541
	.xword	0x9a53162a16225f9b
	.xword	0x5025b625bb5baab4
	.xword	0xb608723374ec40d4
	.xword	0x00744b650d7f033e
	.xword	0x888f123bfd08116e
	.xword	0xd622ce4e0a108ac4
	.xword	0xf989c7fdf7c986d9
	.xword	0xd51bb65ede598ed5
	.xword	0x152de142ecec26fe
	.xword	0x361070abad8f5650
	.xword	0x4b527d2590436907
	.xword	0x892454c1401704b9
	.xword	0x4af6fc11423c786c
	.xword	0x8946d78013445d85
	.xword	0x9f15c7094cb931fc
	.xword	0xc1af08e068fbc7c4
	.xword	0xe060f064e689e08c
	.xword	0xaaf12056c115fea2
	.xword	0x874526e00ddbeb7e
	.xword	0xbf9199f8b66b1039
	.xword	0x9691479528fb2499
	.xword	0xbfeab8eca3b4f8d3
	.xword	0x1ea17881080cd216
	.xword	0x555973f2813fc8b7
	.xword	0xa558527e9a42923f
	.xword	0x2c75de76e0d7a884
	.xword	0x50e51a1d268b082c
	.xword	0x8e7d9c5527bb1379
	.xword	0x566a79dad6e1bba3
	.xword	0x7200f72fe1fdcf90
	.xword	0xa51485c9c67bddd5
	.xword	0x58e974f3392e984f
	.xword	0x691871efc5443fb7
	.xword	0x6260e66e25316c89
	.xword	0x52fe2dd73d94cdae
	.xword	0xeba7eff799b60967
	.xword	0x0f113880f7e65103
	.xword	0x7387f032c822d5b2
	.xword	0xe280a688b0bdd9e7
	.xword	0xa4a549c6f4fa91b8
	.xword	0x6acf3c238f771d8f
	.xword	0xc1fceafa72a376fd
	.xword	0x6fac91466462148d
	.xword	0x8f6d1b20d6567b1c
	.xword	0x3403cae0026dff93
	.xword	0x59082c4f3fa6bd47
	.xword	0x013f74f2cbf1aa6d
	.xword	0x1dd5ebf6da6d63c4
	.xword	0x56a46281d2591117
	.xword	0x26e578b9835ba7cb
	.xword	0x375903fd9554a130
	.xword	0xb68dbb0f960bf349
	.xword	0x916fabbbe025cbfd
	.xword	0x355ba72129a1ec69
	.xword	0xbcefdec6e6f04fe5
	.xword	0x0212df4d841c5300
	.xword	0x430b450db00d6a98
	.xword	0x33d53c1778f13e49
	.xword	0xbae186a8268f0c38
	.xword	0xaac9032894f9ee2b
	.xword	0x0647d5d8979ce8cd
	.xword	0x5da0290be807e4b5
	.xword	0x9c9237515a7e4e5f
	.xword	0xccdc2323d1483795
	.xword	0xc828ca11117f4802
	.xword	0x1c7bab0a3a76f824
	.xword	0x23e3e2291828c2bc
	.xword	0xd4d68e3213632bd6
	.xword	0x5090b0ccae771caa
	.xword	0xcc128c0a07882040



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
	.xword	0x38952cfa93120c00
	.xword	0x2e47ed58b5951933
	.xword	0x50f78cb93786f52a
	.xword	0x12cc09fc0387cf2b
	.xword	0x46d02f00aa8cd52a
	.xword	0x5f3098c50ad2ae0e
	.xword	0xdc2f07fad0856cf5
	.xword	0x7e7c60b41eea8ad4
	.xword	0xd59364077af11345
	.xword	0x1b2e424ceeef547f
	.xword	0x5437467d7c8402e8
	.xword	0xf5d70a19025976f0
	.xword	0x0baef51ae96eb092
	.xword	0xcef8273d31afb3e9
	.xword	0x585b4e2ff188a11c
	.xword	0xd7a8e4edfb4687d6
	.xword	0xcd8d78964f851e9d
	.xword	0xb274851b2bae203e
	.xword	0x1cc0412d1d88d156
	.xword	0x8512d82136fdbb26
	.xword	0x4280388ba6f2f4de
	.xword	0xea116966fd4a6654
	.xword	0x653884d764df79ed
	.xword	0xb7064d2b566dc09a
	.xword	0x340c37c929d94727
	.xword	0x98c5814b676aed2d
	.xword	0xf49cd31652e667b4
	.xword	0x0b3991b67fb99f3a
	.xword	0x77a9afc0e2e69204
	.xword	0x13373433fce93a69
	.xword	0xf23bb12d463aabe5
	.xword	0xc9fc5598a52ce6b6
	.xword	0x752ec69ee2256bfc
	.xword	0xfa8cc39994faed7f
	.xword	0xe4d4336cc8537bf9
	.xword	0x63b36fb7e71abcb9
	.xword	0x988b7d377273855d
	.xword	0xa053a6735bcbe002
	.xword	0x1c3c9598a376cf13
	.xword	0xdff0ad8eb326da1b
	.xword	0xb5d02ff3fcba22a7
	.xword	0x48273e4cd9525930
	.xword	0x99f0951e7e0e5068
	.xword	0x55deb3e2e62b3618
	.xword	0x971b2e73795dd81b
	.xword	0x7cbe4340a490df9d
	.xword	0xe3fdb51ff586d677
	.xword	0x4d7f4fa441e19847
	.xword	0x3a9ad3e0e1a74182
	.xword	0x29d5f0b4ca6bbf51
	.xword	0x3e1c8a8f05534713
	.xword	0x794759d4fbfe313d
	.xword	0x144ab361b8c4c465
	.xword	0x19e90200a1c8582e
	.xword	0x3ec2bdf5930a97a7
	.xword	0xa1b420dfc116c4af
	.xword	0xd187680cc3f78c28
	.xword	0x2f48b7e4bab54d43
	.xword	0x20a3917a2c43087c
	.xword	0x34055509438f205a
	.xword	0x3f30a19b825615aa
	.xword	0x6e300846d54b44a7
	.xword	0x43a771821956ca90
	.xword	0x18a83625592ccf7a
	.xword	0x2236ca937ca859cf
	.xword	0x25c74ef0dcdc1125
	.xword	0x96d55a898a24cd5a
	.xword	0x09a2a2bbc9574742
	.xword	0x4dad5378cc4f4fcb
	.xword	0xa3e32fad5968f177
	.xword	0x11299387eab9c3f7
	.xword	0x9f325e7fbb52012e
	.xword	0xfd226ca6f0134b1a
	.xword	0x014eeb7a868b52d8
	.xword	0x8f6b2633cce89d14
	.xword	0x3e36fefce67cd2bf
	.xword	0x83bf5e5b73d02049
	.xword	0xed8dd6bcb5d32547
	.xword	0x3ee4841d6e19cf2e
	.xword	0x23af1402080ce88f
	.xword	0x96ad604f8b92ad0e
	.xword	0x2a43c73f206382ed
	.xword	0x476e34dbc060a064
	.xword	0xffa4d14aad3d42cc
	.xword	0x1b9a78717e9560fe
	.xword	0x40aedc8301b547d5
	.xword	0xcdf22077e3b3216b
	.xword	0xe0203b7209a8437d
	.xword	0x774de479b31f1d05
	.xword	0x23812521dfda35f7
	.xword	0xc3604f2bd5279716
	.xword	0x91d70e93e4caa662
	.xword	0x97c9414c1034d79a
	.xword	0x14f4614cd75f06ad
	.xword	0xe17e8bbe1c0e469c
	.xword	0xdaab7b9cdae1d860
	.xword	0x87a03467afe86203
	.xword	0x30cf2322b4a7ef58
	.xword	0xfe4811fbd1e54414
	.xword	0x47b48c2c7fec9ff5
	.xword	0x7b60260cbeca73c4
	.xword	0xaad5eccb9e46d762
	.xword	0xd2c5f61a020c9b2c
	.xword	0x8b7b36accd2bbc22
	.xword	0xe6700c0414887924
	.xword	0xcba1a7602ed11b6a
	.xword	0xcd0299d680072719
	.xword	0xbab720599b6dc715
	.xword	0x02e3e3c76793a8c8
	.xword	0x4c9435ee0e35cd22
	.xword	0x7fbc2e0c35c83975
	.xword	0x716b04a4184b3269
	.xword	0xff34990b3ccbea9e
	.xword	0xf17fe77a6b59b78f
	.xword	0x9efd9912705b46c0
	.xword	0xd55aab524affc579
	.xword	0x9edcf8e13a474831
	.xword	0xaebe5d70aa835c08
	.xword	0x1fbcfcf8efb4d40a
	.xword	0x2bda3e3d7613aac4
	.xword	0x977303926decbf6d
	.xword	0x0d8d47ed6fce0af3
	.xword	0x457d8cd6db9a7965
	.xword	0x0ac3607ce60173ce
	.xword	0x1e9172762cc4721b
	.xword	0x1dd27a44bd191ee6
	.xword	0xc80b851779462b04
	.xword	0xff05df192dcf4488
	.xword	0xc19a018b4cbde922
	.xword	0x326cd44da596e380
	.xword	0xbb8cae9f30ab61eb
	.xword	0x4b948f9321cb1ebc
	.xword	0x5d9e083d14c2d22f
	.xword	0x5f17d13e2e6fb851
	.xword	0x50d48a3369e67d61
	.xword	0xef1741202e7977df
	.xword	0x701a4f2085bdc07d
	.xword	0xce3ae65f9ba73271
	.xword	0xc682a6a898ad0e67
	.xword	0x67dcf12777569fd8
	.xword	0x3896b8260e840f16
	.xword	0x393db6784e2a2402
	.xword	0xe619e317970095cd
	.xword	0xe7732c4813b64980
	.xword	0xd2088579bb072be5
	.xword	0x3145959134d21604
	.xword	0x6c6244f9e1ae8529
	.xword	0x55307ed49d476586
	.xword	0x61a03f899be11496
	.xword	0xa87ba282a56efef7
	.xword	0x6035deec4d794aa5
	.xword	0xfa4d8ebe68caa07c
	.xword	0x4efa27a787bda4fc
	.xword	0xb98fad97f45b146e
	.xword	0x7d740d58347c4040
	.xword	0x3384b77a8179cf3f
	.xword	0xa0a50474716faf17
	.xword	0x974a16b8c4d9ecd3
	.xword	0x31bdda5eb29a7432
	.xword	0x512abbc071346ccf
	.xword	0x19f30fc04d3eb06a
	.xword	0xa62efcb678324af0
	.xword	0x54196bb065db7daa
	.xword	0x9cfb8cc91886f2ef
	.xword	0x96c4d46342b39cde
	.xword	0xb2233991f341d960
	.xword	0xfbfb772244fbd11f
	.xword	0x70475f33d872ccfa
	.xword	0x56f5d34f825a69a7
	.xword	0x7e7b72d8b21fc83c
	.xword	0x1a45a9599651afc2
	.xword	0x1196772633797b4d
	.xword	0xc50a294699f89778
	.xword	0x5bb18c9af80387e3
	.xword	0x13681082b0607ba2
	.xword	0x1c94d26507078feb
	.xword	0x624f23f4c94e88bf
	.xword	0xd566ccdb434850cc
	.xword	0xdfa2aa4c3c473ee8
	.xword	0xe292c099cc4fc648
	.xword	0xb0b18e1a8ca57a27
	.xword	0x02982bb972660c17
	.xword	0xb12574542e0325df
	.xword	0xd3f0a88b6a2fb548
	.xword	0x7962b42832d39c80
	.xword	0xb4fc9ab369a6dafc
	.xword	0x1228221e3dc1b8a1
	.xword	0x8192be369fd66918
	.xword	0x11689364411e970d
	.xword	0xf208a4d02aa2cb79
	.xword	0x840f6feb5e432790
	.xword	0x47bc4f8d3d2c9824
	.xword	0x5d1a0d2d3a031615
	.xword	0x74a74fdac8902336
	.xword	0xf5eda6ae5adee203
	.xword	0x3998c06ee198ddcb
	.xword	0xf454519cb7beecb8
	.xword	0x123f9e824d28c994
	.xword	0x332ad30f8acc97c6
	.xword	0x01a45bdff805fb96
	.xword	0x19f55c60e6d1bd81
	.xword	0x5bd6713f27d52795
	.xword	0x53fbd58b2de69e81
	.xword	0x2fed200abf9a3a5f
	.xword	0x96fa0a0efff14d44
	.xword	0x8158c3e2209d5ca3
	.xword	0x6451cb311dac775a
	.xword	0x2aa2d00375e7c480
	.xword	0x0a0d1e1f49c99086
	.xword	0x2a97b7e88408ccc7
	.xword	0xe0156121c21b3ccd
	.xword	0x834059a5497337fa
	.xword	0xe599ce947e375ee0
	.xword	0x7feb43571b67cd9a
	.xword	0xb19658cd697a7fcf
	.xword	0x2f381697b13652fd
	.xword	0xc22421f89056bdd7
	.xword	0x224f6609365d6f82
	.xword	0xf7a87a814ce93dd7
	.xword	0x64984ec96153e8a0
	.xword	0xe757127d11ac88bb
	.xword	0xaa8daba5202d4ca5
	.xword	0xffa47b28d1e16c89
	.xword	0x6f1d23884ccb4151
	.xword	0xe4321baf9ce8ecf9
	.xword	0xfa2c265cbb89af70
	.xword	0x749c2e64d2a8912e
	.xword	0x941188475a0aa062
	.xword	0xf0985b2ac664ebc3
	.xword	0x1c1a7e32404b8b18
	.xword	0x157058adfd983c34
	.xword	0x246073617504d0d9
	.xword	0xc4a9c9cbab676214
	.xword	0xdd1b273f494f03c4
	.xword	0x1c34760359ba3fca
	.xword	0xa72bdbb3b72086e9
	.xword	0x5bdd99d4c90fdf87
	.xword	0xf2227ea067819114
	.xword	0xdd871dd56d23c636
	.xword	0x9639f512b523fabb
	.xword	0xff436e689f9f0996
	.xword	0x85209b80c54c882a
	.xword	0x7232f89177fd9e79
	.xword	0xb74ceff5a0bf3c7c
	.xword	0xf4094423d4e713c6
	.xword	0x3f287ce86445b70e
	.xword	0xaf8ddeddbf6e20dc
	.xword	0x5165683b56e2edfa
	.xword	0xb7f0df4f0edd4867
	.xword	0x1abdd92bcfb42340
	.xword	0x04c4683a8a97cecd
	.xword	0x4bd9f004ba2ee466
	.xword	0xb6e7c90ce3957e2e
	.xword	0xe7aa53147cb1f0a7
	.xword	0x4559aab667fa05a0
	.xword	0x696312a9db8cbb30



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
	.xword	0xc86d7bf0eac10a52
	.xword	0x127290df8009183b
	.xword	0x78f828852c76b299
	.xword	0xba8e4eafa7bb08f8
	.xword	0x5b81653c616ad7df
	.xword	0xc3654abf2198d298
	.xword	0xc48912ca562a0763
	.xword	0xa87516d85834e1da
	.xword	0xd73d6a8cd44c9b82
	.xword	0x73fd863bcf2bcb29
	.xword	0xf8ed71dca9841306
	.xword	0xe6026b03b28e06ce
	.xword	0x4cf9f6e3693ff1f7
	.xword	0x3cea8540e566cd0e
	.xword	0xb05efbfbb8924392
	.xword	0x333c11e49a54f5fb
	.xword	0x6386222c42b28d52
	.xword	0x046ede2340452fb7
	.xword	0x4f95620d0f12d585
	.xword	0x660883b520bb68d3
	.xword	0x52b337fe6900b5ed
	.xword	0x26b6692bd4415c4e
	.xword	0x6da562b6cc389f13
	.xword	0x9c0c10e54d69afd5
	.xword	0x9fdb27512336c648
	.xword	0x94b8509e87f38883
	.xword	0x9bc95e9f4fd5ef32
	.xword	0x4cfcd82d5e5aa467
	.xword	0xf719d84593e92610
	.xword	0xb8cac8330ee361d3
	.xword	0xb87f0377b03bbfa8
	.xword	0x70cc3fce1cc2465c
	.xword	0x2e7c8a9cb71acb6c
	.xword	0x27ed0a413665bf62
	.xword	0x6ced6b1183fc84e4
	.xword	0x4ed677c2240e0a4d
	.xword	0xb67e59175e491bc9
	.xword	0x99b0f1bc945f4c7c
	.xword	0xbc616e3579747e72
	.xword	0xeb4c109a51566d16
	.xword	0x7d2de4290273138b
	.xword	0x95596952b2c00be9
	.xword	0x1070de20e0964925
	.xword	0xc14d54e20d47b7b6
	.xword	0xdaade2af9887144e
	.xword	0xdc8aa39296c1bcd2
	.xword	0xb85a0850d8a73175
	.xword	0x3c7320fa269518e4
	.xword	0x801d08ec897a22b5
	.xword	0xfb148be595149004
	.xword	0xe4231e12e8b28c95
	.xword	0x227c90a4a70a626f
	.xword	0x2a0e2c2830323c83
	.xword	0x4e51254e7042c274
	.xword	0xc08e0ca310a4464f
	.xword	0x268e07206925dce5
	.xword	0x4e5c201eab73a2b7
	.xword	0x45a4ffae007b0c77
	.xword	0xcc487b55f63a222c
	.xword	0x77ce89a429bd4b69
	.xword	0x091b6a2d2beccad5
	.xword	0xe6e92b61f65c8d60
	.xword	0xe04a84322624b80d
	.xword	0x28d1916de307c8b9
	.xword	0x96d2bb928313e93e
	.xword	0x73f172f9fb699d45
	.xword	0x62b1da7f6672b646
	.xword	0x1810238ab551563e
	.xword	0x388f97233175139e
	.xword	0xa7b19dc7c9f19dfa
	.xword	0x9419ad6f207c4e9e
	.xword	0x7c067a6bcd995735
	.xword	0x91377dc4872e97e1
	.xword	0x385596df39c4ab1f
	.xword	0xa7cf24887f08957f
	.xword	0x134bded016e97961
	.xword	0x147a17d060b8aa39
	.xword	0xacd84348be436c79
	.xword	0xfcea0ce258890f04
	.xword	0x74a9d52f8c8b9ce2
	.xword	0x017969ba435eb522
	.xword	0x15d0aa61b41af9c6
	.xword	0x87063907e943592e
	.xword	0xf4553e8e435acdff
	.xword	0x11e39beb24b911a2
	.xword	0xb1c0b5e0ac6f5832
	.xword	0xbf62d8383dd1a4d2
	.xword	0x3a0b883777be6266
	.xword	0xa6e3d82c73fac9c6
	.xword	0x639accff61408eac
	.xword	0x969af19309e53708
	.xword	0xc0de2b38a2f28a76
	.xword	0xe24a25e2e38679f4
	.xword	0x906573c53ca27909
	.xword	0x4992be6d7a50f31e
	.xword	0x646976eed28c1aa9
	.xword	0x5210437cce415b61
	.xword	0xfdddeea4c98c3406
	.xword	0x4c286b50ea74c278
	.xword	0xc1f57088f4c2cb6b
	.xword	0x6c3c42224f5876d5
	.xword	0x85463e65abe32b56
	.xword	0x14fe888e75ddac95
	.xword	0x065a4efd3a43fdcb
	.xword	0xddbcb67773ab861a
	.xword	0x6b569d7913ff9aa6
	.xword	0xddbc42879cb01c98
	.xword	0x8d0a47ba19d2efd2
	.xword	0xaa61b4b4b86c9071
	.xword	0xe4ca659be3d5085b
	.xword	0x7bac95166c77336c
	.xword	0x4a59577df9dd583d
	.xword	0xb7dd857923ef3c6d
	.xword	0x074ea3240af64890
	.xword	0x0d864897bedd4231
	.xword	0x68dd8d9dcdb61267
	.xword	0xa4ceac94ffff229a
	.xword	0x586ab758ae313399
	.xword	0xc80e144ea022dcc4
	.xword	0xa04ef88cc59e76af
	.xword	0x0c9a079552cd0666
	.xword	0x7ea89b223f790b7b
	.xword	0x2ea2c0f844e44002
	.xword	0x4caa9716c629e0cc
	.xword	0xb4f308fe1c756e2e
	.xword	0x77c09b5d7076f4b9
	.xword	0x120c3a6d4edf8d38
	.xword	0x54ee6a4a755b19a6
	.xword	0x8fe73d29e0742a25
	.xword	0x7bf5b5e79b2b836b
	.xword	0x3cc31f02c454a0ed
	.xword	0x97610fca678f27a1
	.xword	0x00e27ad553c40aa8
	.xword	0xf11505e9128dbe40
	.xword	0x25116e586002b941
	.xword	0x9e3448ad1dce6f59
	.xword	0xc8357c693f7f91e3
	.xword	0x0c93179b2f06ef45
	.xword	0xb1e2e67429a02c65
	.xword	0x7ecfb4ddf304fca1
	.xword	0x7273f86637d14233
	.xword	0xaae5882f54fe4f18
	.xword	0x89602631160b6df0
	.xword	0x3ddc54cf68ab650c
	.xword	0xb2487fdb9ed80638
	.xword	0xaf95296e329edf40
	.xword	0x5d2af5d127d31d83
	.xword	0xae70b95b42448fcf
	.xword	0xa0e23934577e22b0
	.xword	0x2b99c89fb436368a
	.xword	0x03d9fafc79441d26
	.xword	0x1dc13f61329697c6
	.xword	0xa093b600c437786a
	.xword	0xcdf759b458ae7ffb
	.xword	0x230b2303304b8b4f
	.xword	0xc041b2035abf1f86
	.xword	0xfb07b0e0b6daf2ae
	.xword	0xa562f46f4a8998c6
	.xword	0x6249850d32533324
	.xword	0x7f117f5046b6b377
	.xword	0x928ec27261502163
	.xword	0x3ef3dff21aef6f27
	.xword	0x2a73208d72f4b005
	.xword	0x6589f0bf1e4847d5
	.xword	0x036f3d81c6e57ad6
	.xword	0xb253a76fe4dc60f8
	.xword	0x4804f39f7d216d31
	.xword	0xfbadd7cca8899487
	.xword	0x4d71ce9474c9459c
	.xword	0x2a11f0e606dda25f
	.xword	0x15a6285a2a3293c2
	.xword	0xd75a9a6f5f39775b
	.xword	0xde401b8d17f6c5f5
	.xword	0x56b1ab8f57ba3203
	.xword	0x6a495fb0081c8207
	.xword	0x39793747dd915c8b
	.xword	0x9b7295dfe80c1e22
	.xword	0xe15ff79c266d1f90
	.xword	0xaabfabcec0b21b90
	.xword	0xadee077d2fe94ead
	.xword	0x78befb1ef080bfa3
	.xword	0x346d20a8f3cbba4a
	.xword	0x113cf5653788528e
	.xword	0x2a208f6beb9a9b96
	.xword	0x7d9a464efeb9c3b3
	.xword	0x1e74acde44adbc27
	.xword	0xba65d7d949f85385
	.xword	0x743955806f2a6154
	.xword	0x12cb1941394a0191
	.xword	0x87e9c16b010d0d4c
	.xword	0x133b44d14cb4274b
	.xword	0xe6ed00ff751dea52
	.xword	0x1500646298d6ecfa
	.xword	0x0f90df93403cd7fc
	.xword	0xdcc6cd7cbefa860d
	.xword	0xd145e0ed0452fe63
	.xword	0x2a81828241fc3754
	.xword	0x16fb3b98d2cc3184
	.xword	0xbec4d4977a98a333
	.xword	0x368ed211270b402d
	.xword	0x65293077af1c6df1
	.xword	0x11cb7959c50e8676
	.xword	0x13e42f59afc70f84
	.xword	0x41256ea929496476
	.xword	0x2af119cf1f1fe4c1
	.xword	0xa477c9e374973d36
	.xword	0x0f1ce7489b5caf0a
	.xword	0x62fe7c9ada9616a2
	.xword	0xf85100d24c08a15e
	.xword	0x79323a16ff7b42f9
	.xword	0xb4a0c084f07ad479
	.xword	0x9aaa52113df84230
	.xword	0xa78e6c0e6319ba74
	.xword	0x4ada97f524f00c68
	.xword	0x4f717dbe2b87446e
	.xword	0x019a7fbdef8214c0
	.xword	0x4b8b1dcedd3530a5
	.xword	0x4e7ea89451a32b38
	.xword	0xd453caba18abd7c5
	.xword	0x0da7575d3b76182c
	.xword	0x2698cdaa6d49413e
	.xword	0xe7473c214b3d9c1a
	.xword	0x87c2b4d9d439c8ff
	.xword	0xda5ad58f419dff39
	.xword	0xbe24a9295925188f
	.xword	0xa6a1e55128a7e89f
	.xword	0x51bd26aa77ba3dd7
	.xword	0x9bb7995a2c6ba95f
	.xword	0xe8b94d438851cb96
	.xword	0xb36d43a91c954469
	.xword	0xc0a06eb1dbd509eb
	.xword	0x26d5c4cc31963c8d
	.xword	0xe5d58c35b1576868
	.xword	0xadcc2a7a6fe35e8e
	.xword	0x21c0612a4d55ab35
	.xword	0xa449a5682846df72
	.xword	0xefb19a3eecfa2a68
	.xword	0x91cce4e2dfb5a5fe
	.xword	0x485c75c780fd91a4
	.xword	0x301a57ea2da8261f
	.xword	0x0beaf9ea655dd986
	.xword	0xe2c35eb476b58e7a
	.xword	0x7a2ff0abf50556a6
	.xword	0xfc3fcb50e85c24eb
	.xword	0x09ae6691f7992226
	.xword	0xccb38f0b7fa97339
	.xword	0x8078d754b0e43258
	.xword	0x17663f15bfac9381
	.xword	0x45674a17eb775c19
	.xword	0x13b3c1bd30f4312d
	.xword	0x194a59c738516d86
	.xword	0xa534e561a5c8adc6
	.xword	0x3291ee05fcb585b0
	.xword	0xf8479028625a5758
	.xword	0x8b5f579796738aaa
	.xword	0x75c49ee99a29b13c



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
!!#   int addr_sel = 0;
!!#   int store_addr = 0;
!!#   int rnd_cnt = 0;
!!#   int invalid_config = 1;
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
!!# #define UDATA1	1
!!# #define MY_HYP_SEC	2
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
!!#   IJ_set_rvar ("diag.j", 103, rv_0, "{11}");
!!# 
!!#   IJ_set_rvar ("diag.j", 105, wt_ld, "{30}");
!!#   IJ_set_rvar ("diag.j", 106, wt_st, "{30}");
!!#   IJ_set_rvar ("diag.j", 107, wt_bl, "{15}");
!!#   IJ_set_rvar ("diag.j", 108, wt_alu, "{3}");
!!# 
!!#   IJ_set_rvar ("diag.j", 111, Rv_rand64, "64'hrrrr rrrr rrrr rrrr");
!!#   IJ_set_rvar ("diag.j", 112, Rv_Simm13, "13'b0 0000 rrrr r000");
!!#   IJ_set_rvar ("diag.j", 113, Rv_addr_sel, "3'brrr");
!!# 
!!#   IJ_set_rvar ("diag.j", 118, Rv_memaddr_pattern_dma,
!!#         "24'{0},"
!!# 
!!#         "20'b 000r rrrr rrrr rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rr00 0000,");
!!# 
!!#   ! only 60* or 61*
!!#   IJ_set_rvar ("diag.j", 127, Rv_memaddr_pattern_io,
!!#         "4'{0},"
!!# 
!!#         "20'b 0000 0000 0000 0000 0110,"
!!#         "20'b 000r rrrr rrrr rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rr00 0000,");
!!# 
!!#   IJ_set_rvar ("diag.j", 136, Rv_rand32, "32'hrrrr rrrr");
!!#   IJ_set_rvar ("diag.j", 137, Rv_rand_mask, "32'h0000 rrrr");
!!# 
!!#   IJ_set_rvar ("diag.j", 141, Rv_memaddr_pattern,
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
!!#   IJ_set_rvar ("diag.j", 157, Rv_jbiaddr_pattern0,
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
!!#   IJ_set_rvar ("diag.j", 171, Rv_jbiaddr_pattern1,
!!#         "24'{0},"
!!# 
!!#         "20'b 0000 0000 1101 0000 0010,"
!!#         "20'b 1110 1111 000r rr00 0000,");
!!#          ! init only till 7fff 
!!# 
!!#   ! 80_0F00_0000 - 80_0FFF_FFFF
!!#   IJ_set_rvar ("diag.j", 184, Rv_jbiaddr_pattern2,
!!#         "24'{0},"
!!# 
!!#         "20'b 0000 0000 1101 0000 0011,"
!!#         "20'b 1110 1111 000r rr00 0000,");
!!#          ! init only till 7fff 
!!# 
!!#   ! C0_0000_0000 - CF_FFFF_FFFF
!!#   IJ_set_rvar ("diag.j", 196, Rv_jbiaddr_pattern3,
!!#         "24'{0},"
!!# 
!!#         "20'b 0000 0000 1101 0000 0100,"
!!#         "20'b 1110 1111 000r rr00 0000,");
!!#          ! init only till 7fff 
!!# 
!!#   ! D0_0000_0000 - DF_FFFF_FFFF
!!#   IJ_set_rvar ("diag.j", 208, Rv_jbiaddr_pattern4,
!!#         "24'{0},"
!!# 
!!#         "20'b 0000 0000 1101 0000 0101,"
!!#         "20'b 1110 1111 000r rr00 0000,");
!!#          ! init only till 7fff 
!!# 
!!#   ! E0_0000_0000 - EF_FFFF_FFFF
!!#   IJ_set_rvar ("diag.j", 220, Rv_jbiaddr_pattern5,
!!#         "24'{0},"
!!# 
!!#         "20'b 0000 0000 1101 0000 0110,"
!!#         "20'b 1110 1111 000r rr00 0000,");
!!#          ! init only till 7fff 
!!# 
!!#   ! F0_0000_0000 - FE_FFFF_FFFF ( Should not be FF*)
!!#   IJ_set_rvar ("diag.j", 232, Rv_jbiaddr_pattern6,
!!#         "24'{0},"
!!# 
!!#         "20'b 0000 0000 1101 0000 0111,"
!!#         "20'b 1110 1111 000r rr00 0000,");
!!#          ! init only till 7fff 
!!# 
!!#   ! FF_F000_0000 - FF_FFFF_FFFF 
!!#   IJ_set_rvar ("diag.j", 244, Rv_ssiaddr_pattern,
!!#         "24'{0},"
!!# 
!!#         "20'b 1111 1111 1111 rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr r000,");
!!# 
!!#   ! Other  cases ?? when LOW TH and HG TH are random, HI>LO always (TBD)
!!# 
!!#   IJ_set_rvar ("diag.j", 255, Rv_jbi_fifo_wr0_config,
!!#         "24'{0},"
!!# 
!!#         "20'b 0000 0000 0rrr 0rrr 00rr,"
!!#         "20'b 00rr rrrr 0000 0000 rrrr,");
!!# 
!!#   IJ_set_rvar ("diag.j", 263, Rv_jbi_fifo_wr1_config,
!!#         "24'{0},"
!!# 
!!#         "20'b 0000 0000 0rrr 0rrr 00rr,"
!!#         "20'b 00rr rrrr 1rrr 0000 rrrr,");
!!# 
!!#   IJ_set_ropr_fld    ("diag.j", 271, ijdefault, Ft_Rs1, "{6,7,9,10,11,12,13}");  ! BASE
!!#   IJ_set_ropr_fld    ("diag.j", 272, ijdefault, Ft_Rs2, "{8}");
!!#   !IJ_set_ropr_fld    (ijdefault, Ft_Rd, "{16..23}");
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
!!#   IJ_printf ("diag.j", 307, th_M, "\tmov\t0, %%r8\n");
!!# 
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
!!#   IJ_printf ("diag.j", 347, sjm_4, "\n\nBA LABEL_0\n");
!!#   IJ_printf ("diag.j", 348, sjm_5, "\n\nBA LABEL_0\n");
!!# 
!!#   int i,j;
!!#   ! Do this else midas wont put any tsbs for the above.
!!#   for (i = 0; i < 16; i++) {
!!#     IJ_iseg_printf("diag.j", 353,ISEG, i, th_M, ".data\n");
!!#     for (j = 0; j < 256; j++) {
!!#     IJ_iseg_printf("diag.j", 355,ISEG, i, th_M, "\t.xword\t0x%016llrx\n", Rv_rand64);
!!#     }
!!#   }
!!# 
!!#   IJ_th_start ("diag.j", 360,Seq_Start, NULL, 2);
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
!!# 		IJ_generate ("diag.j", 804, th_M, $2);
!!# 	}
!!# ;
!!# 
!!# inst_type: set_addr  %rvar  wt_alu |
!!#            load      %rvar  wt_ld |
!!#            alu       %rvar  wt_alu |
!!#            block_ld  %rvar  wt_bl |
!!#            block_st  %rvar  wt_bl |
!!#            store     %rvar  wt_ld | sjm4 | sjm5
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
!!#                    IJ_printf ("diag.j", 841, sjm_4, "\n");
!!#                      sjm4_cnt++;
!!# 
!!#                      sj4_ad =  IJ_get_rvar_val64("diag.j", 844, Rv_memaddr_pattern_dma);
!!#                      sjm0_addr[sjm_wr0] = sj4_ad; 
!!#                      IJ_printf ("diag.j", 846, sjm_4, "WRITEBLK  0x%016llx +\n",sj4_ad);
!!#                      IJ_update_rvar("diag.j", 847, Rv_memaddr_pattern_dma);
!!# 
!!#                       for (i=0;i<16;i++) { 
!!#                          !IJ_printf (sjm_4, "# debug %d \n",i);
!!#                          sjm0_data[sjm_wr0][i] = IJ_get_rvar_val32("diag.j", 851, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 852, Rv_rand32);
!!#                          if (i%4 == 0) {IJ_printf ("diag.j", 853, sjm_4, "        "); }
!!#                          IJ_printf ("diag.j", 854, sjm_4, "0x%08x ",sjm0_data[sjm_wr0][i]);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 856, sjm_4, "\n"); else 
!!#                             IJ_printf ("diag.j", 857, sjm_4, "+\n");
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
!!#                    IJ_printf ("diag.j", 870, sjm_4, "\n");
!!#                      sjm4_cnt--;
!!# 
!!#                      sj4_ad = sjm0_addr[sjm_rd0];
!!#                      IJ_printf ("diag.j", 875, sjm_4, "READBLK  0x%016llx +\n",sj4_ad);
!!# 
!!#                       for (i=0;i<16;i++) { 
!!#                          sjm4_dat = sjm0_data[sjm_rd0][i];
!!#                          if (i%4 == 0) IJ_printf ("diag.j", 879, sjm_4, "        ");
!!#                          IJ_printf ("diag.j", 880, sjm_4, "0x%08x ",sjm4_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 882, sjm_4, "\n"); else 
!!#                             IJ_printf ("diag.j", 883, sjm_4, "+\n");
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
!!#                    IJ_printf ("diag.j", 897, sjm_4, "\n");
!!#                      !sjm4_cnt--;
!!# 
!!#  		     sjm0_w_mask =  IJ_get_rvar_val32("diag.j", 901, Rv_rand_mask);
!!#                      IJ_update_rvar("diag.j", 902, Rv_rand_mask);
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
!!#                      IJ_printf ("diag.j", 919, sjm_4, "WRITEMSK  0x%016llx 0x%016llx +\n",sj4_ad,mask);
!!# 
!!#                       m_tmp = sjm0_w_mask;
!!#                       for (i=0;i<16;i++) { 
!!#                        if (m_tmp & 0x1 ) {
!!#                          sjm0_data[sjm_rd0][i] = IJ_get_rvar_val32("diag.j", 924, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 925, Rv_rand32);
!!#                          sjm4_dat = sjm0_data[sjm_rd0][i];
!!#                          if (i%4 == 0) IJ_printf ("diag.j", 927, sjm_4, "        ");
!!#                          IJ_printf ("diag.j", 928, sjm_4, "0x%08x ",sjm4_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 930, sjm_4, "\n"); else 
!!#                             IJ_printf ("diag.j", 931, sjm_4, "+\n");
!!#                            }
!!#                         } else {
!!#                          !sjm4_dat = sjm0_data[sjm_rd0][i];
!!#                          sjm4_dat = 0;
!!#                          if (i%4 == 0) IJ_printf ("diag.j", 936, sjm_4, "        ");
!!#                          IJ_printf ("diag.j", 937, sjm_4, "0x%08x ",sjm4_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 939, sjm_4, "\n"); else 
!!#                             IJ_printf ("diag.j", 940, sjm_4, "+\n");
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
!!#                    IJ_printf ("diag.j", 957, sjm_4, "\n");
!!#                      sjm4_cnt_io++;
!!# 
!!#                      sj4_ad =  IJ_get_rvar_val64("diag.j", 960, Rv_memaddr_pattern_io);
!!#                      sjm0_addr_io[sjm_wr0_io] = sj4_ad; 
!!#                      IJ_printf ("diag.j", 962, sjm_4, "WRITEBLKIO  0x%016llx +\n",sj4_ad);
!!#                      IJ_update_rvar("diag.j", 963, Rv_memaddr_pattern_io);
!!# 
!!#                       for (i=0;i<16;i++) { 
!!#                          !IJ_printf (sjm_4, "# debug %d \n",i);
!!#                          sjm0_data_io[sjm_wr0_io][i] = IJ_get_rvar_val32("diag.j", 967, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 968, Rv_rand32);
!!#                          if (i%4 == 0) {IJ_printf ("diag.j", 969, sjm_4, "        "); }
!!#                          IJ_printf ("diag.j", 970, sjm_4, "0x%08x ",sjm0_data_io[sjm_wr0_io][i]);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 972, sjm_4, "\n"); else 
!!#                             IJ_printf ("diag.j", 973, sjm_4, "+\n");
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
!!#                    IJ_printf ("diag.j", 986, sjm_4, "\n");
!!#                      sjm4_cnt_io--;
!!# 
!!#                      sj4_ad = sjm0_addr_io[sjm_rd0_io];
!!#                      IJ_printf ("diag.j", 991, sjm_4, "READBLKIO  0x%016llx +\n",sj4_ad);
!!# 
!!#                       for (i=0;i<16;i++) { 
!!#                          sjm4_dat = sjm0_data_io[sjm_rd0_io][i];
!!#                          if (i%4 == 0) IJ_printf ("diag.j", 995, sjm_4, "        ");
!!#                          IJ_printf ("diag.j", 996, sjm_4, "0x%08x ",sjm4_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 998, sjm_4, "\n"); else 
!!#                             IJ_printf ("diag.j", 999, sjm_4, "+\n");
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
!!#                    IJ_printf ("diag.j", 1014, sjm_4, "\n");
!!#                      sjm4_cnt_io1++;
!!# 
!!#                      sj4_ad =  IJ_get_rvar_val64("diag.j", 1017, Rv_memaddr_pattern_io);
!!#                      sjm0_addr_io1[sjm_wr0_io1] = sj4_ad; 
!!#                      IJ_printf ("diag.j", 1019, sjm_4, "WRITEIO  0x%016llx ",sj4_ad);
!!#                      IJ_update_rvar("diag.j", 1020, Rv_memaddr_pattern_io);
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
!!#                       IJ_printf ("diag.j", 1035, sjm_4, "%d ",b_sz);
!!#                       for (i=0;i<4;i++) { 
!!#                          !IJ_printf (sjm_4, "# debug %d \n",i);
!!#                          sjm0_data_io1[sjm_wr0_io1][i] = IJ_get_rvar_val32("diag.j", 1038, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 1039, Rv_rand32);
!!#                          IJ_printf ("diag.j", 1040, sjm_4, "0x%08x ",sjm0_data_io1[sjm_wr0_io1][i]);
!!#                          if((i==0) && ((b_sz == 1) | (b_sz == 2) | (b_sz == 4)) ) break; 
!!#                          if((i==1) && (b_sz == 8)) break; 
!!#                       }
!!#                       if ( random()%2 == 0) {
!!#                       IJ_printf ("diag.j", 1045, sjm_4, "\n");
!!#                       } else {
!!#                       IJ_printf ("diag.j", 1047, sjm_4, "\n");
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
!!#                    IJ_printf ("diag.j", 1061, sjm_4, "\n");
!!#                      sjm4_cnt_io1--;
!!# 
!!#                      sj4_ad = sjm0_addr_io1[sjm_rd0_io1];
!!#                      b_sz   = sjm0_data_io1[sjm_rd0_io1][15];
!!#                      IJ_printf ("diag.j", 1067, sjm_4, "READIO  0x%016llx %d ",sj4_ad,b_sz);
!!# 
!!#                       for (i=0;i<4;i++) {
!!#                          sjm4_dat = sjm0_data_io1[sjm_rd0_io1][i];
!!#                          IJ_printf ("diag.j", 1071, sjm_4, "0x%08x ",sjm4_dat);
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
!!#                    IJ_printf ("diag.j", 1086, sjm_4, "\n");
!!# 
!!#                      sj4_ad =  IJ_get_rvar_val64("diag.j", 1088, Rv_memaddr_pattern_io);
!!#                      sjm0_addr_m_io[sjm_wr0_m_io] = sj4_ad; 
!!#                      IJ_update_rvar("diag.j", 1090, Rv_memaddr_pattern_io);
!!# 
!!#                      sjm4_cnt_m_io++;
!!# 
!!#  		     sjm0_w_mask_m_io =  IJ_get_rvar_val32("diag.j", 1096, Rv_rand_mask);
!!#                      IJ_update_rvar("diag.j", 1097, Rv_rand_mask);
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
!!#                      IJ_printf ("diag.j", 1124, sjm_4, "WRITEMSKIO  0x%016llx 0x%04x  ",sj4_ad,mask);
!!#                      sjm0_data_m_io[sjm_wr0_m_io][15] = mask; ! data fifo , 15 stores address
!!# 
!!#                       m_tmp = sjm0_w_mask_m_io & 0xf;
!!#                       for (i=0;i<4;i++) { 
!!#                        if (m_tmp & 0x1 ) {
!!#                          sjm0_data_m_io[sjm_wr0_m_io][i] = IJ_get_rvar_val32("diag.j", 1130, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 1131, Rv_rand32);
!!#                          sjm4_dat = sjm0_data_m_io[sjm_wr0_m_io][i];
!!#                          !if (i%4 == 0) IJ_printf (sjm_4, "        ");
!!#                          IJ_printf ("diag.j", 1134, sjm_4, "0x%08x ",sjm4_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                              IJ_printf ("diag.j", 1136, sjm_4, "\n"); 
!!#                             !if (i==15 ) IJ_printf (sjm_4, "\n"); else 
!!#                             !IJ_printf (sjm_4, "+\n");
!!#                            }
!!#                         } else {
!!#                          !sjm4_dat = sjm0_data[sjm_rd0][i];
!!#                          sjm4_dat = 0;
!!#                          sjm0_data_m_io[sjm_wr0_m_io][i] = sjm4_dat;
!!#                          !if (i%4 == 0) IJ_printf (sjm_4, "        ");
!!#                          IJ_printf ("diag.j", 1145, sjm_4, "0x%08x ",sjm4_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             IJ_printf ("diag.j", 1147, sjm_4, "\n"); 
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
!!#                    IJ_printf ("diag.j", 1165, sjm_4, "\n");
!!#                      sjm4_cnt_m_io--;
!!# 
!!#                      sj4_ad = sjm0_addr_m_io[sjm_rd0_m_io];
!!#                      mask   = sjm0_data_m_io[sjm_rd0_m_io][15];
!!#                      IJ_printf ("diag.j", 1171, sjm_4, "READMSKIO   0x%016llx 0x%04llx  ",sj4_ad,mask);
!!# 
!!#                       for (i=0;i<4;i++) { 
!!#                          sjm4_dat = sjm0_data_m_io[sjm_rd0_m_io][i];
!!#                          !if (i%4 == 0) IJ_printf (sjm_4, "        ");
!!#                          IJ_printf ("diag.j", 1176, sjm_4, "0x%08x ",sjm4_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             IJ_printf ("diag.j", 1178, sjm_4, "\n");
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
!!#                    IJ_printf ("diag.j", 1196, sjm_5, "\n");
!!#                      sjm5_cnt++;
!!# 
!!#                      sj5_ad =  IJ_get_rvar_val64("diag.j", 1199, Rv_memaddr_pattern_dma);
!!#                      sjm1_addr[sjm_wr1] = sj5_ad; 
!!#                      IJ_printf ("diag.j", 1201, sjm_5, "WRITEBLK  0x%016llx +\n",sj5_ad);
!!#                      IJ_update_rvar("diag.j", 1202, Rv_memaddr_pattern_dma);
!!# 
!!#                       for (i=0;i<16;i++) { 
!!#                          sjm1_data[sjm_wr1][i] = IJ_get_rvar_val32("diag.j", 1205, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 1206, Rv_rand32);
!!#                          if (i%4 == 0) IJ_printf ("diag.j", 1207, sjm_5, "        ");
!!#                          IJ_printf ("diag.j", 1208, sjm_5, "0x%08x ",sjm1_data[sjm_wr1][i]);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 1210, sjm_5, "\n"); else 
!!#                             IJ_printf ("diag.j", 1211, sjm_5, "+\n");
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
!!#                    IJ_printf ("diag.j", 1224, sjm_5, "\n");
!!#                      sjm5_cnt--;
!!# 
!!#                      sj5_ad = sjm1_addr[sjm_rd1];
!!#                      IJ_printf ("diag.j", 1229, sjm_5, "READBLK  0x%016llx +\n",sj5_ad);
!!# 
!!#                       for (i=0;i<16;i++) { 
!!#                          sjm5_dat = sjm1_data[sjm_rd1][i];
!!#                          if (i%4 == 0) IJ_printf ("diag.j", 1233, sjm_5, "        ");
!!#                          IJ_printf ("diag.j", 1234, sjm_5, "0x%08x ",sjm5_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 1236, sjm_5, "\n"); else 
!!#                             IJ_printf ("diag.j", 1237, sjm_5, "+\n");
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
!!#                    IJ_printf ("diag.j", 1251, sjm_5, "\n");
!!#                      !sjm4_cnt--;
!!# 
!!#  		     sjm1_w_mask =  IJ_get_rvar_val32("diag.j", 1255, Rv_rand_mask);
!!#                      IJ_update_rvar("diag.j", 1256, Rv_rand_mask);
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
!!#                      IJ_printf ("diag.j", 1273, sjm_5, "WRITEMSK  0x%016llx 0x%016llx +\n",sj5_ad,mask);
!!# 
!!#                       m_tmp = sjm1_w_mask;
!!#                       for (i=0;i<16;i++) { 
!!#                        if (m_tmp & 0x1 ) {
!!#                          sjm1_data[sjm_rd1][i] = IJ_get_rvar_val32("diag.j", 1278, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 1279, Rv_rand32);
!!#                          sjm5_dat = sjm1_data[sjm_rd1][i];
!!#                          if (i%4 == 0) IJ_printf ("diag.j", 1281, sjm_5, "        ");
!!#                          IJ_printf ("diag.j", 1282, sjm_5, "0x%08x ",sjm5_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 1284, sjm_5, "\n"); else 
!!#                             IJ_printf ("diag.j", 1285, sjm_5, "+\n");
!!#                            }
!!#                         } else {
!!#                          !sjm5_dat = sjm1_data[sjm_rd1][i];
!!#                          sjm5_dat = 0;
!!#                          if (i%4 == 0) IJ_printf ("diag.j", 1290, sjm_5, "        ");
!!#                          IJ_printf ("diag.j", 1291, sjm_5, "0x%08x ",sjm5_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 1293, sjm_5, "\n"); else 
!!#                             IJ_printf ("diag.j", 1294, sjm_5, "+\n");
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
!!#                    IJ_printf ("diag.j", 1311, sjm_5, "\n");
!!#                      sjm5_cnt_io++;
!!# 
!!#                      sj5_ad =  IJ_get_rvar_val64("diag.j", 1314, Rv_memaddr_pattern_io);
!!#                      sjm1_addr_io[sjm_wr1_io] = sj5_ad; 
!!#                      IJ_printf ("diag.j", 1316, sjm_5, "WRITEBLKIO  0x%016llx +\n",sj5_ad);
!!#                      IJ_update_rvar("diag.j", 1317, Rv_memaddr_pattern_io);
!!# 
!!#                       for (i=0;i<16;i++) { 
!!#                          !IJ_printf (sjm_5, "# debug %d \n",i);
!!#                          sjm1_data_io[sjm_wr1_io][i] = IJ_get_rvar_val32("diag.j", 1321, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 1322, Rv_rand32);
!!#                          if (i%4 == 0) {IJ_printf ("diag.j", 1323, sjm_5, "        "); }
!!#                          IJ_printf ("diag.j", 1324, sjm_5, "0x%08x ",sjm1_data_io[sjm_wr1_io][i]);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 1326, sjm_5, "\n"); else 
!!#                             IJ_printf ("diag.j", 1327, sjm_5, "+\n");
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
!!#                    IJ_printf ("diag.j", 1340, sjm_5, "\n");
!!#                      sjm5_cnt_io--;
!!# 
!!#                      sj5_ad = sjm1_addr_io[sjm_rd1_io];
!!#                      IJ_printf ("diag.j", 1345, sjm_5, "READBLKIO  0x%016llx +\n",sj5_ad);
!!# 
!!#                       for (i=0;i<16;i++) { 
!!#                          sjm5_dat = sjm1_data_io[sjm_rd1_io][i];
!!#                          if (i%4 == 0) IJ_printf ("diag.j", 1349, sjm_5, "        ");
!!#                          IJ_printf ("diag.j", 1350, sjm_5, "0x%08x ",sjm5_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 1352, sjm_5, "\n"); else 
!!#                             IJ_printf ("diag.j", 1353, sjm_5, "+\n");
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
!!#                    IJ_printf ("diag.j", 1369, sjm_5, "\n");
!!#                      sjm5_cnt_io1++;
!!# 
!!#                      sj5_ad =  IJ_get_rvar_val64("diag.j", 1372, Rv_memaddr_pattern_io);
!!#                      sjm1_addr_io1[sjm_wr1_io1] = sj5_ad; 
!!#                      IJ_printf ("diag.j", 1374, sjm_5, "WRITEIO  0x%016llx ",sj5_ad);
!!#                      IJ_update_rvar("diag.j", 1375, Rv_memaddr_pattern_io);
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
!!#                       IJ_printf ("diag.j", 1390, sjm_5, "%d ",b_sz);
!!#                       for (i=0;i<4;i++) { 
!!#                          !IJ_printf (sjm_5, "# debug %d \n",i);
!!#                          sjm1_data_io1[sjm_wr1_io1][i] = IJ_get_rvar_val32("diag.j", 1393, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 1394, Rv_rand32);
!!#                          IJ_printf ("diag.j", 1395, sjm_5, "0x%08x ",sjm1_data_io1[sjm_wr1_io1][i]);
!!#                          if((i==0) && ((b_sz == 1) | (b_sz == 2) | (b_sz == 4)) ) break; 
!!#                          if((i==1) && (b_sz == 8)) break; 
!!#                       }
!!#                       if ( random()%2 == 0) {
!!#                       IJ_printf ("diag.j", 1400, sjm_5, "\n");
!!#                       } else {
!!#                       IJ_printf ("diag.j", 1402, sjm_5, "\n");
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
!!#                    IJ_printf ("diag.j", 1416, sjm_5, "\n");
!!#                      sjm5_cnt_io1--;
!!# 
!!#                      sj5_ad = sjm1_addr_io1[sjm_rd1_io1];
!!#                      b_sz   = sjm1_data_io1[sjm_rd1_io1][15];
!!#                      IJ_printf ("diag.j", 1422, sjm_5, "READIO  0x%016llx %d ",sj5_ad,b_sz);
!!# 
!!#                       for (i=0;i<4;i++) {
!!#                          sjm5_dat = sjm1_data_io1[sjm_rd1_io1][i];
!!#                          IJ_printf ("diag.j", 1426, sjm_5, "0x%08x ",sjm5_dat);
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
!!#                    IJ_printf ("diag.j", 1441, sjm_5, "\n");
!!# 
!!#                      sj5_ad =  IJ_get_rvar_val64("diag.j", 1443, Rv_memaddr_pattern_io);
!!#                      sjm1_addr_m_io[sjm_wr1_m_io] = sj5_ad; 
!!#                      IJ_update_rvar("diag.j", 1445, Rv_memaddr_pattern_io);
!!# 
!!#                      sjm5_cnt_m_io++;
!!# 
!!#  		     sjm1_w_mask_m_io =  IJ_get_rvar_val32("diag.j", 1451, Rv_rand_mask);
!!#                      IJ_update_rvar("diag.j", 1452, Rv_rand_mask);
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
!!#                      IJ_printf ("diag.j", 1479, sjm_5, "WRITEMSKIO  0x%016llx 0x%04x  ",sj5_ad,mask);
!!#                      sjm1_data_m_io[sjm_wr1_m_io][15] = mask; ! data fifo , 15 stores address
!!# 
!!#                       m_tmp = sjm1_w_mask_m_io & 0xf;
!!#                       for (i=0;i<4;i++) { 
!!#                        if (m_tmp & 0x1 ) {
!!#                          sjm1_data_m_io[sjm_wr1_m_io][i] = IJ_get_rvar_val32("diag.j", 1485, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 1486, Rv_rand32);
!!#                          sjm5_dat = sjm1_data_m_io[sjm_wr1_m_io][i];
!!#                          !if (i%4 == 0) IJ_printf (sjm_5, "        ");
!!#                          IJ_printf ("diag.j", 1489, sjm_5, "0x%08x ",sjm5_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                              IJ_printf ("diag.j", 1491, sjm_5, "\n"); 
!!#                             !if (i==15 ) IJ_printf (sjm_5, "\n"); else 
!!#                             !IJ_printf (sjm_5, "+\n");
!!#                            }
!!#                         } else {
!!#                          !sjm5_dat = sjm1_data[sjm_rd1][i];
!!#                          sjm5_dat = 0;
!!#                          sjm1_data_m_io[sjm_wr1_m_io][i] = sjm5_dat;
!!#                          !if (i%4 == 0) IJ_printf (sjm_5, "        ");
!!#                          IJ_printf ("diag.j", 1500, sjm_5, "0x%08x ",sjm5_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             IJ_printf ("diag.j", 1502, sjm_5, "\n"); 
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
!!#                    IJ_printf ("diag.j", 1520, sjm_5, "\n");
!!#                      sjm5_cnt_m_io--;
!!# 
!!#                      sj5_ad = sjm1_addr_m_io[sjm_rd1_m_io];
!!#                      mask   = sjm1_data_m_io[sjm_rd1_m_io][15];
!!#                      IJ_printf ("diag.j", 1526, sjm_5, "READMSKIO   0x%016llx 0x%04llx  ",sj5_ad,mask);
!!# 
!!#                       for (i=0;i<4;i++) { 
!!#                          sjm5_dat = sjm1_data_m_io[sjm_rd1_m_io][i];
!!#                          !if (i%4 == 0) IJ_printf (sjm_5, "        ");
!!#                          IJ_printf ("diag.j", 1531, sjm_5, "0x%08x ",sjm5_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             IJ_printf ("diag.j", 1533, sjm_5, "\n");
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
!!#                         !invalid_config = 1;
!!#                         !while (invalid_config) {
!!#                         !if (random()%2) {
!!#                         !jbi_config = IJ_get_rvar_val64(Rv_jbi_fifo_wr0_config);
!!#                         !IJ_update_rvar(Rv_jbi_fifo_wr0_config);
!!#                         !} else {
!!#                         !jbi_config = IJ_get_rvar_val64(Rv_jbi_fifo_wr1_config);
!!#                         !IJ_update_rvar(Rv_jbi_fifo_wr1_config);
!!#                         !}
!!#                         !if (((jbi_config>>24) & 0x7) < ((jbi_config>>28) & 0x7)) {
!!#                         !invalid_config = 0;
!!#                         ! }
!!#                         !}
!!# 
!!#                         !IJ_printf (th_M, "\tsetx\t0x%016llx, %%r1, %%r6\n",
!!#                         !        jbi_config);
!!#                         !	IJ_printf (th_M, "\tsetx\t0x8000000008, %%r1, %%r10\n");
!!#                         !IJ_printf (th_M, "\tstx\t%%r6, [%%r10]\n");
!!# 
!!#                    if(random()%2 == 1) {
!!#                      if(random()%2 == 1) {
!!#                       IJ_printf ("diag.j", 1577, th_M, "\tsetx\t0x%016llrx, %%r1, %%r6\n",
!!#                               Rv_jbiaddr_pattern0);
!!#                       IJ_printf ("diag.j", 1579, th_M, "\tsetx\t0x%016llrx, %%r1, %%r7\n",
!!#                               Rv_memaddr_pattern);
!!#                       IJ_printf ("diag.j", 1581, th_M, "\tsetx\t0x%016llrx, %%r1, %%r9\n",
!!#                               Rv_jbiaddr_pattern2);
!!#                       IJ_printf ("diag.j", 1583, th_M, "\tsetx\t0x%016llrx, %%r1, %%r10\n",
!!#                               Rv_memaddr_pattern);
!!#                       IJ_printf ("diag.j", 1585, th_M, "\tsetx\t0x%016llrx, %%r1, %%r11\n",
!!#                               Rv_jbiaddr_pattern4);
!!#                       IJ_printf ("diag.j", 1587, th_M, "\tsetx\t0x%016llrx, %%r1, %%r12\n",
!!#                               Rv_memaddr_pattern);
!!#                       IJ_printf ("diag.j", 1589, th_M, "\tsetx\t0x%016llrx, %%r1, %%r13\n",
!!#                               Rv_jbiaddr_pattern6);
!!#                       } else { 
!!#                       IJ_printf ("diag.j", 1592, th_M, "\tsetx\t0x%016llrx, %%r1, %%r6\n",
!!#                               Rv_jbiaddr_pattern1);
!!#                       IJ_printf ("diag.j", 1594, th_M, "\tsetx\t0x%016llrx, %%r1, %%r7\n",
!!#                               Rv_memaddr_pattern);
!!#                       IJ_printf ("diag.j", 1596, th_M, "\tsetx\t0x%016llrx, %%r1, %%r9\n",
!!#                               Rv_jbiaddr_pattern3);
!!#                       IJ_printf ("diag.j", 1598, th_M, "\tsetx\t0x%016llrx, %%r1, %%r10\n",
!!#                               Rv_memaddr_pattern);
!!#                       IJ_printf ("diag.j", 1600, th_M, "\tsetx\t0x%016llrx, %%r1, %%r11\n",
!!#                               Rv_jbiaddr_pattern5);
!!#                       IJ_printf ("diag.j", 1602, th_M, "\tsetx\t0x%016llrx, %%r1, %%r12\n",
!!#                               Rv_memaddr_pattern);
!!#                       IJ_printf ("diag.j", 1604, th_M, "\tsetx\t0x%016llrx, %%r1, %%r13\n",
!!#                               Rv_memaddr_pattern);
!!# 
!!#                       }
!!# 
!!#                     } else { 
!!#                      if(random()%2 == 1) {
!!#                       IJ_printf ("diag.j", 1611, th_M, "\tsetx\t0x%016llrx, %%r1, %%r6\n",
!!#                               Rv_jbiaddr_pattern0);
!!#                       IJ_printf ("diag.j", 1613, th_M, "\tsetx\t0x%016llrx, %%r1, %%r7\n",
!!#                               Rv_jbiaddr_pattern1);
!!#                       IJ_printf ("diag.j", 1615, th_M, "\tsetx\t0x%016llrx, %%r1, %%r9\n",
!!#                               Rv_jbiaddr_pattern2);
!!#                       IJ_printf ("diag.j", 1617, th_M, "\tsetx\t0x%016llrx, %%r1, %%r10\n",
!!#                               Rv_jbiaddr_pattern3);
!!#                       IJ_printf ("diag.j", 1619, th_M, "\tsetx\t0x%016llrx, %%r1, %%r11\n",
!!#                               Rv_jbiaddr_pattern4);
!!#                       IJ_printf ("diag.j", 1621, th_M, "\tsetx\t0x%016llrx, %%r1, %%r12\n",
!!#                               Rv_jbiaddr_pattern5);
!!#                       IJ_printf ("diag.j", 1623, th_M, "\tsetx\t0x%016llrx, %%r1, %%r13\n",
!!#                               Rv_jbiaddr_pattern6);
!!#                       } else { 
!!#                       IJ_printf ("diag.j", 1626, th_M, "\tsetx\t0x%016llrx, %%r1, %%r6\n",
!!#                               Rv_memaddr_pattern);
!!#                       IJ_printf ("diag.j", 1628, th_M, "\tsetx\t0x%016llrx, %%r1, %%r7\n",
!!#                               Rv_memaddr_pattern);
!!#                       IJ_printf ("diag.j", 1630, th_M, "\tsetx\t0x%016llrx, %%r1, %%r9\n",
!!#                               Rv_memaddr_pattern);
!!#                       IJ_printf ("diag.j", 1632, th_M, "\tsetx\t0x%016llrx, %%r1, %%r10\n",
!!#                               Rv_memaddr_pattern);
!!#                       IJ_printf ("diag.j", 1634, th_M, "\tsetx\t0x%016llrx, %%r1, %%r11\n",
!!#                               Rv_memaddr_pattern);
!!#                       IJ_printf ("diag.j", 1636, th_M, "\tsetx\t0x%016llrx, %%r1, %%r12\n",
!!#                               Rv_memaddr_pattern);
!!#                       IJ_printf ("diag.j", 1638, th_M, "\tsetx\t0x%016llrx, %%r1, %%r13\n",
!!#                               Rv_memaddr_pattern);
!!#                       }
!!#                      }
!!#         }
!!# ;
!!# 
!!# block_ld :  set_block_ld   %rvar  wt_bl
!!# ;
!!# set_block_ld :  mSET_BLOCK_LD %rvar  wt_bl
!!#                 {
!!#                      rnd_cnt = random() %2;
!!#                      IJ_printf ("diag.j", 1650, th_M, "!DEBUG rnd_cnt = %d \n", rnd_cnt);
!!#                      printf ("!DEBUG: %d\n", rnd_cnt);
!!# 
!!#                      switch (rnd_cnt) {
!!#                       case 0 : {
!!#                        rnd_cnt = random() %7;
!!#                        switch (rnd_cnt) {
!!#                         case 0 : IJ_printf ("diag.j", 1657, th_M, "\tldda\t[%%r6]ASI_BLK_P, %%f0\n"); break;
!!#                         case 1 : IJ_printf ("diag.j", 1658, th_M, "\tldda\t[%%r7]ASI_BLK_P, %%f16\n"); break;
!!#                         case 2 : IJ_printf ("diag.j", 1659, th_M, "\tldda\t[%%r9]ASI_BLK_P, %%f0\n"); break;
!!#                         case 3 : IJ_printf ("diag.j", 1660, th_M, "\tldda\t[%%r10]ASI_BLK_P, %%f16\n"); break;
!!#                         case 4 : IJ_printf ("diag.j", 1661, th_M, "\tldda\t[%%r11]ASI_BLK_P, %%f0\n"); break;
!!#                         case 5 : IJ_printf ("diag.j", 1662, th_M, "\tldda\t[%%r12]ASI_BLK_P, %%f16\n"); break;
!!#                         case 6 : IJ_printf ("diag.j", 1663, th_M, "\tldda\t[%%r13]ASI_BLK_P, %%f0\n"); break;
!!#                         default : IJ_printf ("diag.j", 1664, th_M, "\tldda\t[%%r8]ASI_BLK_P, %%f16\n"); break;
!!#                         }
!!#                        } break;
!!#                       case 1 : {
!!#                        rnd_cnt = random() %7;
!!#                        switch (rnd_cnt) {
!!#                         case 0 : IJ_printf ("diag.j", 1670, th_M, "\tldda\t[%%r6]ASI_BLK_PL, %%f0\n"); break;
!!#                         case 1 : IJ_printf ("diag.j", 1671, th_M, "\tldda\t[%%r7]ASI_BLK_PL, %%f16\n"); break;
!!#                         case 2 : IJ_printf ("diag.j", 1672, th_M, "\tldda\t[%%r9]ASI_BLK_PL, %%f0\n"); break;
!!#                         case 3 : IJ_printf ("diag.j", 1673, th_M, "\tldda\t[%%r10]ASI_BLK_PL, %%f16\n"); break;
!!#                         case 4 : IJ_printf ("diag.j", 1674, th_M, "\tldda\t[%%r11]ASI_BLK_PL, %%f0\n"); break;
!!#                         case 5 : IJ_printf ("diag.j", 1675, th_M, "\tldda\t[%%r12]ASI_BLK_PL, %%f16\n"); break;
!!#                         case 6 : IJ_printf ("diag.j", 1676, th_M, "\tldda\t[%%r13]ASI_BLK_PL, %%f0\n"); break;
!!#                         default : IJ_printf ("diag.j", 1677, th_M, "\tldda\t[%%r8]ASI_BLK_PL, %%f16\n"); break;
!!#                         }
!!#                        }  break;
!!#                       case 2 : {
!!#                        rnd_cnt = random() %7;
!!#                        switch (rnd_cnt) {
!!#                         case 0 : IJ_printf ("diag.j", 1683, th_M, "\tldda\t[%%r6]ASI_BLK_AIUP, %%f0\n"); break;
!!#                         case 1 : IJ_printf ("diag.j", 1684, th_M, "\tldda\t[%%r7]ASI_BLK_AIUP, %%f16\n"); break;
!!#                         case 2 : IJ_printf ("diag.j", 1685, th_M, "\tldda\t[%%r9]ASI_BLK_AIUP, %%f0\n"); break;
!!#                         case 3 : IJ_printf ("diag.j", 1686, th_M, "\tldda\t[%%r10]ASI_BLK_AIUP, %%f16\n"); break;
!!#                         case 4 : IJ_printf ("diag.j", 1687, th_M, "\tldda\t[%%r11]ASI_BLK_AIUP, %%f0\n"); break;
!!#                         case 5 : IJ_printf ("diag.j", 1688, th_M, "\tldda\t[%%r12]ASI_BLK_AIUP, %%f16\n"); break;
!!#                         case 6 : IJ_printf ("diag.j", 1689, th_M, "\tldda\t[%%r13]ASI_BLK_AIUP, %%f0\n"); break;
!!#                         default : IJ_printf ("diag.j", 1690, th_M, "\tldda\t[%%r8]ASI_BLK_AIUP, %%f16\n"); break;
!!#                         }
!!#                        } break;
!!#                       case 3 : {
!!#                        rnd_cnt = random() %7;
!!#                        switch (rnd_cnt) {
!!#                         case 0 : IJ_printf ("diag.j", 1696, th_M, "\tldda\t[%%r6]ASI_BLK_AIUPL, %%f0\n"); break;
!!#                         case 1 : IJ_printf ("diag.j", 1697, th_M, "\tldda\t[%%r7]ASI_BLK_AIUPL, %%f0\n"); break;
!!#                         case 2 : IJ_printf ("diag.j", 1698, th_M, "\tldda\t[%%r9]ASI_BLK_AIUPL, %%f16\n"); break;
!!#                         case 3 : IJ_printf ("diag.j", 1699, th_M, "\tldda\t[%%r10]ASI_BLK_AIUPL, %%f0\n"); break;
!!#                         case 4 : IJ_printf ("diag.j", 1700, th_M, "\tldda\t[%%r11]ASI_BLK_AIUPL, %%f16\n"); break;
!!#                         case 5 : IJ_printf ("diag.j", 1701, th_M, "\tldda\t[%%r12]ASI_BLK_AIUPL, %%f0\n"); break;
!!#                         case 6 : IJ_printf ("diag.j", 1702, th_M, "\tldda\t[%%r13]ASI_BLK_AIUPL, %%f16\n"); break;
!!#                         default : IJ_printf ("diag.j", 1703, th_M, "\tldda\t[%%r8]ASI_BLK_AIUPL, %%f0\n"); break;
!!#                         }
!!#                        } break;
!!#                       case 4 : {
!!#                        rnd_cnt = random() %7;
!!#                        switch (rnd_cnt) {
!!#                         case 0 : IJ_printf ("diag.j", 1709, th_M, "\tldda\t[%%r6]ASI_AS_IF_USER_BLK_INIT_ST_QUAD_LDD_P, %%l0\n"); break;
!!#                         case 1 : IJ_printf ("diag.j", 1710, th_M, "\tldda\t[%%r7]ASI_AS_IF_USER_BLK_INIT_ST_QUAD_LDD_P, %%l0\n"); break;
!!#                         case 2 : IJ_printf ("diag.j", 1711, th_M, "\tldda\t[%%r9]ASI_AS_IF_USER_BLK_INIT_ST_QUAD_LDD_P, %%l0\n"); break;
!!#                         case 3 : IJ_printf ("diag.j", 1712, th_M, "\tldda\t[%%r10]ASI_AS_IF_USER_BLK_INIT_ST_QUAD_LDD_P, %%l0\n"); break;
!!#                         case 4 : IJ_printf ("diag.j", 1713, th_M, "\tldda\t[%%r11]ASI_AS_IF_USER_BLK_INIT_ST_QUAD_LDD_P, %%l0\n"); break;
!!#                         case 5 : IJ_printf ("diag.j", 1714, th_M, "\tldda\t[%%r12]ASI_AS_IF_USER_BLK_INIT_ST_QUAD_LDD_P, %%l0\n"); break;
!!#                         case 6 : IJ_printf ("diag.j", 1715, th_M, "\tldda\t[%%r13]ASI_AS_IF_USER_BLK_INIT_ST_QUAD_LDD_P, %%l0\n"); break;
!!#                         default : IJ_printf ("diag.j", 1716, th_M, "\tldda\t[%%r8]ASI_AS_IF_USER_BLK_INIT_ST_QUAD_LDD_P, %%l0\n"); break;
!!#                         }
!!#                        } break;
!!#                       case 5 : {
!!#                        rnd_cnt = random() %7;
!!#                        switch (rnd_cnt) {
!!#                         case 0 : IJ_printf ("diag.j", 1722, th_M, "\tldda\t[%%r6]ASI_AS_IF_USER_BLK_INIT_ST_QUAD_LDD_P_LITTLE, %%l0\n"); break;
!!#                         case 1 : IJ_printf ("diag.j", 1723, th_M, "\tldda\t[%%r7]ASI_AS_IF_USER_BLK_INIT_ST_QUAD_LDD_P_LITTLE, %%l0\n"); break;
!!#                         case 2 : IJ_printf ("diag.j", 1724, th_M, "\tldda\t[%%r9]ASI_AS_IF_USER_BLK_INIT_ST_QUAD_LDD_P_LITTLE, %%l0\n"); break;
!!#                         case 3 : IJ_printf ("diag.j", 1725, th_M, "\tldda\t[%%r10]ASI_AS_IF_USER_BLK_INIT_ST_QUAD_LDD_P_LITTLE, %%l0\n"); break;
!!#                         case 4 : IJ_printf ("diag.j", 1726, th_M, "\tldda\t[%%r11]ASI_AS_IF_USER_BLK_INIT_ST_QUAD_LDD_P_LITTLE, %%l0\n"); break;
!!#                         case 5 : IJ_printf ("diag.j", 1727, th_M, "\tldda\t[%%r12]ASI_AS_IF_USER_BLK_INIT_ST_QUAD_LDD_P_LITTLE, %%l0\n"); break;
!!#                         case 6 : IJ_printf ("diag.j", 1728, th_M, "\tldda\t[%%r13]ASI_AS_IF_USER_BLK_INIT_ST_QUAD_LDD_P_LITTLE, %%l0\n"); break;
!!#                         default : IJ_printf ("diag.j", 1729, th_M, "\tldda\t[%%r8]ASI_AS_IF_USER_BLK_INIT_ST_QUAD_LDD_P_LITTLE, %%l0\n"); break;
!!#                         }
!!#                        } break;
!!#                       default : {
!!#                        rnd_cnt = random() %7;
!!#                        switch (rnd_cnt) {
!!#                         case 0 : IJ_printf ("diag.j", 1735, th_M, "\tldda\t[%%r6]ASI_BLK_INIT_ST_QUAD_LDD_P, %%l0\n"); break;
!!#                         case 1 : IJ_printf ("diag.j", 1736, th_M, "\tldda\t[%%r7]ASI_BLK_INIT_ST_QUAD_LDD_P, %%l0\n"); break;
!!#                         case 2 : IJ_printf ("diag.j", 1737, th_M, "\tldda\t[%%r9]ASI_BLK_INIT_ST_QUAD_LDD_P, %%l0\n"); break;
!!#                         case 3 : IJ_printf ("diag.j", 1738, th_M, "\tldda\t[%%r10]ASI_BLK_INIT_ST_QUAD_LDD_P, %%l0\n"); break;
!!#                         case 4 : IJ_printf ("diag.j", 1739, th_M, "\tldda\t[%%r11]ASI_BLK_INIT_ST_QUAD_LDD_P, %%l0\n"); break;
!!#                         case 5 : IJ_printf ("diag.j", 1740, th_M, "\tldda\t[%%r12]ASI_BLK_INIT_ST_QUAD_LDD_P, %%l0\n"); break;
!!#                         case 6 : IJ_printf ("diag.j", 1741, th_M, "\tldda\t[%%r13]ASI_BLK_INIT_ST_QUAD_LDD_P, %%l0\n"); break;
!!#                         default : IJ_printf ("diag.j", 1742, th_M, "\tldda\t[%%r8]ASI_BLK_INIT_ST_QUAD_LDD_P, %%l0\n"); break;
!!#                         }
!!#                        } break;
!!# 
!!#                      }
!!#                         IJ_printf ("diag.j", 1747, th_M, "\tmembar\t 0x40\n");
!!#                  }
!!# 
!!# ;
!!# 
!!# block_st :  set_block_st   %rvar  wt_bl
!!# ;
!!# set_block_st :  mSET_BLOCK_ST   %rvar  wt_bl
!!#                 {
!!#                      rnd_cnt = random() %2;
!!#                      !IJ_printf (th_M, "! DEBUG1 \trnd_cnt = %d\t\n", rnd_cnt);
!!#                      switch (rnd_cnt) {
!!#                       case 0 : {
!!#                        rnd_cnt = random() %7;
!!#                        switch (rnd_cnt) {
!!# 
!!#                         case 0 : IJ_printf ("diag.j", 1763, th_M, "\tstda\t %%f0, [%%r6]ASI_BLK_P\n"); break;
!!#                         case 1 : IJ_printf ("diag.j", 1764, th_M, "\tstda\t %%f16, [%%r7]ASI_BLK_P\n"); break;
!!#                         case 2 : IJ_printf ("diag.j", 1765, th_M, "\tstda\t %%f0, [%%r9]ASI_BLK_P\n"); break;
!!#                         case 3 : IJ_printf ("diag.j", 1766, th_M, "\tstda\t %%f0, [%%r10]ASI_BLK_P\n"); break;
!!#                         case 4 : IJ_printf ("diag.j", 1767, th_M, "\tstda\t %%f16, [%%r11]ASI_BLK_P\n"); break;
!!#                         case 5 : IJ_printf ("diag.j", 1768, th_M, "\tstda\t %%f0, [%%r12]ASI_BLK_P\n"); break;
!!#                         case 6 : IJ_printf ("diag.j", 1769, th_M, "\tstda\t %%f0, [%%r13]ASI_BLK_P\n"); break;
!!#                         default  : IJ_printf ("diag.j", 1770, th_M, "\tstda\t %%f0, [%%r7]ASI_BLK_P\n"); break;
!!#                         }
!!#                         IJ_printf ("diag.j", 1772, th_M, "\tmembar\t 0x40\n");
!!#                        } break;
!!# 
!!#                       case 1 : {
!!#                        rnd_cnt = random() %7;
!!#                        switch (rnd_cnt) {
!!# 
!!#                         case 0 : IJ_printf ("diag.j", 1779, th_M, "\tstda\t %%f16, [%%r6]ASI_BLK_PL\n"); break;
!!#                         case 1 : IJ_printf ("diag.j", 1780, th_M, "\tstda\t %%f0, [%%r7]ASI_BLK_PL\n"); break;
!!#                         case 2 : IJ_printf ("diag.j", 1781, th_M, "\tstda\t %%f0, [%%r9]ASI_BLK_PL\n"); break;
!!#                         case 3 : IJ_printf ("diag.j", 1782, th_M, "\tstda\t %%f16, [%%r10]ASI_BLK_PL\n"); break;
!!#                         case 4 : IJ_printf ("diag.j", 1783, th_M, "\tstda\t %%f0, [%%r11]ASI_BLK_PL\n"); break;
!!#                         case 5 : IJ_printf ("diag.j", 1784, th_M, "\tstda\t %%f16, [%%r12]ASI_BLK_PL\n"); break;
!!#                         case 6 : IJ_printf ("diag.j", 1785, th_M, "\tstda\t %%f0, [%%r13]ASI_BLK_PL\n"); break;
!!#                         default  : IJ_printf ("diag.j", 1786, th_M, "\tstda\t %%f16, [%%r7]ASI_BLK_PL\n"); break;
!!#                         }
!!#                         IJ_printf ("diag.j", 1788, th_M, "\tmembar\t 0x40\n");
!!#                        } break;
!!#                       case 2 : {
!!#                        rnd_cnt = random() %7;
!!#                        switch (rnd_cnt) {
!!# 
!!#                         case 0 : IJ_printf ("diag.j", 1794, th_M, "\tstda\t %%f0, [%%r6]ASI_BLK_AIUP\n"); break;
!!#                         case 1 : IJ_printf ("diag.j", 1795, th_M, "\tstda\t %%f16, [%%r7]ASI_BLK_AIUP\n"); break;
!!#                         case 2 : IJ_printf ("diag.j", 1796, th_M, "\tstda\t %%f0, [%%r9]ASI_BLK_AIUP\n"); break;
!!#                         case 3 : IJ_printf ("diag.j", 1797, th_M, "\tstda\t %%f16, [%%r10]ASI_BLK_AIUP\n"); break;
!!#                         case 4 : IJ_printf ("diag.j", 1798, th_M, "\tstda\t %%f0, [%%r11]ASI_BLK_AIUP\n"); break;
!!#                         case 5 : IJ_printf ("diag.j", 1799, th_M, "\tstda\t %%f16, [%%r12]ASI_BLK_AIUP\n"); break;
!!#                         case 6 : IJ_printf ("diag.j", 1800, th_M, "\tstda\t %%f0, [%%r13]ASI_BLK_AIUP\n"); break;
!!#                         default  : IJ_printf ("diag.j", 1801, th_M, "\tstda\t %%f16, [%%r7]ASI_BLK_AIUP\n"); break;
!!#                         }
!!#                         IJ_printf ("diag.j", 1803, th_M, "\tmembar\t 0x40\n");
!!#                        } break;
!!#                       case 3 : {
!!#                        rnd_cnt = random() %7;
!!#                        switch (rnd_cnt) {
!!# 
!!#                         case 0 : IJ_printf ("diag.j", 1809, th_M, "\tstda\t %%f0, [%%r6]ASI_BLK_AIUPL\n"); break;
!!#                         case 1 : IJ_printf ("diag.j", 1810, th_M, "\tstda\t %%f16, [%%r7]ASI_BLK_AIUPL\n"); break;
!!#                         case 2 : IJ_printf ("diag.j", 1811, th_M, "\tstda\t %%f0, [%%r9]ASI_BLK_AIUPL\n"); break;
!!#                         case 3 : IJ_printf ("diag.j", 1812, th_M, "\tstda\t %%f16, [%%r10]ASI_BLK_AIUPL\n"); break;
!!#                         case 4 : IJ_printf ("diag.j", 1813, th_M, "\tstda\t %%f0, [%%r11]ASI_BLK_AIUPL\n"); break;
!!#                         case 5 : IJ_printf ("diag.j", 1814, th_M, "\tstda\t %%f16, [%%r12]ASI_BLK_AIUPL\n"); break;
!!#                         case 6 : IJ_printf ("diag.j", 1815, th_M, "\tstda\t %%f0, [%%r13]ASI_BLK_AIUPL\n"); break;
!!#                         default  : IJ_printf ("diag.j", 1816, th_M, "\tstda\t %%f16, [%%r7]ASI_BLK_AIUPL\n"); break;
!!#                         }
!!#                         IJ_printf ("diag.j", 1818, th_M, "\tmembar\t 0x40\n");
!!#                        } break;
!!#                       case 4 : {
!!#                        rnd_cnt = random() %7;
!!#                        switch (rnd_cnt) {
!!# 
!!#                         case 0 : IJ_printf ("diag.j", 1824, th_M, "\tstxa\t %%l0, [%%r6]ASI_AS_IF_USER_BLK_INIT_ST_QUAD_LDD_P\n"); break;
!!#                         case 1 : IJ_printf ("diag.j", 1825, th_M, "\tstxa\t %%l0, [%%r7]ASI_AS_IF_USER_BLK_INIT_ST_QUAD_LDD_P\n"); break;
!!#                         case 2 : IJ_printf ("diag.j", 1826, th_M, "\tstxa\t %%l0, [%%r9]ASI_AS_IF_USER_BLK_INIT_ST_QUAD_LDD_P\n"); break;
!!#                         case 3 : IJ_printf ("diag.j", 1827, th_M, "\tstxa\t %%l0, [%%r10]ASI_AS_IF_USER_BLK_INIT_ST_QUAD_LDD_P\n"); break;
!!#                         case 4 : IJ_printf ("diag.j", 1828, th_M, "\tstxa\t %%l0, [%%r11]ASI_AS_IF_USER_BLK_INIT_ST_QUAD_LDD_P\n"); break;
!!#                         case 5 : IJ_printf ("diag.j", 1829, th_M, "\tstxa\t %%l0, [%%r12]ASI_AS_IF_USER_BLK_INIT_ST_QUAD_LDD_P\n"); break;
!!#                         case 6 : IJ_printf ("diag.j", 1830, th_M, "\tstxa\t %%l0, [%%r13]ASI_AS_IF_USER_BLK_INIT_ST_QUAD_LDD_P\n"); break;
!!#                         default  : IJ_printf ("diag.j", 1831, th_M, "\tstxa\t %%l0, [%%r7]ASI_AS_IF_USER_BLK_INIT_ST_QUAD_LDD_P\n"); break;
!!#                         }
!!#                         IJ_printf ("diag.j", 1833, th_M, "\tmembar\t 0x40\n");
!!#                        } break;
!!#                       case 5 : {
!!#                        rnd_cnt = random() %7;
!!#                        switch (rnd_cnt) {
!!# 
!!#                         case 0 : IJ_printf ("diag.j", 1839, th_M, "\tstxa\t %%l0, [%%r6]ASI_AS_IF_USER_BLK_INIT_ST_QUAD_LDD_P_LITTLE\n"); break;
!!#                         case 1 : IJ_printf ("diag.j", 1840, th_M, "\tstxa\t %%l0, [%%r7]ASI_AS_IF_USER_BLK_INIT_ST_QUAD_LDD_P_LITTLE\n"); break;
!!#                         case 2 : IJ_printf ("diag.j", 1841, th_M, "\tstxa\t %%l0, [%%r9]ASI_AS_IF_USER_BLK_INIT_ST_QUAD_LDD_P_LITTLE\n"); break;
!!#                         case 3 : IJ_printf ("diag.j", 1842, th_M, "\tstxa\t %%l0, [%%r10]ASI_AS_IF_USER_BLK_INIT_ST_QUAD_LDD_P_LITTLE\n"); break;
!!#                         case 4 : IJ_printf ("diag.j", 1843, th_M, "\tstxa\t %%l0, [%%r11]ASI_AS_IF_USER_BLK_INIT_ST_QUAD_LDD_P_LITTLE\n"); break;
!!#                         case 5 : IJ_printf ("diag.j", 1844, th_M, "\tstxa\t %%l0, [%%r12]ASI_AS_IF_USER_BLK_INIT_ST_QUAD_LDD_P_LITTLE\n"); break;
!!#                         case 6 : IJ_printf ("diag.j", 1845, th_M, "\tstxa\t %%l0, [%%r13]ASI_AS_IF_USER_BLK_INIT_ST_QUAD_LDD_P_LITTLE\n"); break;
!!#                         default  : IJ_printf ("diag.j", 1846, th_M, "\tstxa\t %%l0, [%%r7]ASI_AS_IF_USER_BLK_INIT_ST_QUAD_LDD_P_LITTLE\n"); break;
!!#                         }
!!#                         IJ_printf ("diag.j", 1848, th_M, "\tmembar\t 0x40\n");
!!#                        } break;
!!#                       default : {
!!#                        rnd_cnt = random() %7;
!!#                        switch (rnd_cnt) {
!!# 
!!#                         case 0 : IJ_printf ("diag.j", 1854, th_M, "\tstxa\t %%l0, [%%r6]ASI_BLK_INIT_ST_QUAD_LDD_P\n"); break;
!!#                         case 1 : IJ_printf ("diag.j", 1855, th_M, "\tstxa\t %%l0, [%%r7]ASI_BLK_INIT_ST_QUAD_LDD_P\n"); break;
!!#                         case 2 : IJ_printf ("diag.j", 1856, th_M, "\tstxa\t %%l0, [%%r9]ASI_BLK_INIT_ST_QUAD_LDD_P\n"); break;
!!#                         case 3 : IJ_printf ("diag.j", 1857, th_M, "\tstxa\t %%l0, [%%r10]ASI_BLK_INIT_ST_QUAD_LDD_P\n"); break;
!!#                         case 4 : IJ_printf ("diag.j", 1858, th_M, "\tstxa\t %%l0, [%%r11]ASI_BLK_INIT_ST_QUAD_LDD_P\n"); break;
!!#                         case 5 : IJ_printf ("diag.j", 1859, th_M, "\tstxa\t %%l0, [%%r12]ASI_BLK_INIT_ST_QUAD_LDD_P\n"); break;
!!#                         case 6 : IJ_printf ("diag.j", 1860, th_M, "\tstxa\t %%l0, [%%r13]ASI_BLK_INIT_ST_QUAD_LDD_P\n"); break;
!!#                         default  : IJ_printf ("diag.j", 1861, th_M, "\tstxa\t %%l0, [%%r7]ASI_BLK_INIT_ST_QUAD_LDD_P\n"); break;
!!#                         }
!!#                         IJ_printf ("diag.j", 1863, th_M, "\tmembar\t 0x40\n");
!!#                        } break;
!!# 
!!#                     }
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
