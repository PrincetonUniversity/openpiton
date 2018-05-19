// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: pio_rnd_basic4_usr_mode_sas2_rand_1.s
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
   random seed:	105842301
   Jal pio_rnd_basic4_usr_mode_sas2.j:	
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
add 0x020, %g0, %g5
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

! Register init code

	setx 0x721817946eb1e946, %g1, %g0
	setx 0x4c17063d7d20ac24, %g1, %g1
	setx 0x796efbce723d160f, %g1, %g2
	setx 0xc6bb278b28ff8a7f, %g1, %g3
	setx 0xd04fa71264609e55, %g1, %g4
	setx 0x32ea4554b379bffb, %g1, %g5
	setx 0xb0f8f55b28c0420d, %g1, %g6
	setx 0x6b2d0f3d740f8ec0, %g1, %g7
	setx 0x2f865f24e53125c3, %g1, %r16
	setx 0x153b99767620194d, %g1, %r17
	setx 0xdf207bea6c3c69ba, %g1, %r18
	setx 0xe7b1a3854f3d1064, %g1, %r19
	setx 0xc84704685ca8d19c, %g1, %r20
	setx 0x8dbdb088c1929f24, %g1, %r21
	setx 0x93ac06c9f942599c, %g1, %r22
	setx 0xfb9dfb8890a3eedb, %g1, %r23
	setx 0xe99a7e51b05d2162, %g1, %r24
	setx 0x5c505a66b6bc25e8, %g1, %r25
	setx 0x2b2ff5b50b48fd58, %g1, %r26
	setx 0x3be92f00975b7e3b, %g1, %r27
	setx 0xd4f3013dd72f1cd4, %g1, %r28
	setx 0x445f5551062d0f88, %g1, %r29
	setx 0x34c5d92209987d4f, %g1, %r30
	setx 0xe90969e83de091da, %g1, %r31
	save
	setx 0x32d521d7b5331d3e, %g1, %r16
	setx 0x53e4521ed3788c31, %g1, %r17
	setx 0x66b0466661235c62, %g1, %r18
	setx 0x024eb66dcaa2f235, %g1, %r19
	setx 0xf48a0285d7e9a3b9, %g1, %r20
	setx 0x55487ba72d703294, %g1, %r21
	setx 0xd870c6f10cf61b95, %g1, %r22
	setx 0x20d3b50c07d8b0b5, %g1, %r23
	setx 0xfe2447fe99b877b0, %g1, %r24
	setx 0xb6521d41ca0827d9, %g1, %r25
	setx 0x6dac6e19e5f0e5a3, %g1, %r26
	setx 0xd16e3ff4996e67c8, %g1, %r27
	setx 0xb45bbdf5c269dbc6, %g1, %r28
	setx 0x9a0ade3db3d07de3, %g1, %r29
	setx 0x7a2661c6cd26425e, %g1, %r30
	setx 0x226df22ac158aab4, %g1, %r31
	save
	setx 0x7bac793caf484a9d, %g1, %r16
	setx 0x9315c988ffea840a, %g1, %r17
	setx 0x5d753524d6a3bd3e, %g1, %r18
	setx 0x5918dbe551abf1c9, %g1, %r19
	setx 0xeb9351813a8479c3, %g1, %r20
	setx 0xc53c33a55ed44ec7, %g1, %r21
	setx 0x3b353250496aaa97, %g1, %r22
	setx 0x769f53f0fe85e9af, %g1, %r23
	setx 0xd1607cb9c0217735, %g1, %r24
	setx 0x2b19681379c0471d, %g1, %r25
	setx 0xfc4a2e8ae106ae86, %g1, %r26
	setx 0xb8e06eb63cb00b6b, %g1, %r27
	setx 0x26a41222b1c9f708, %g1, %r28
	setx 0x058668b8833a8d5d, %g1, %r29
	setx 0xaae2a35116540b60, %g1, %r30
	setx 0x8a9cd5629c779ba3, %g1, %r31
	restore
	mov	0, %r8
	setx	0x00000000d01ef180, %r1, %r6
	setx	0x00000000d02ef140, %r1, %r7
	setx	0x00000000d03ef180, %r1, %r9
	setx	0x00000000d04ef040, %r1, %r10
	setx	0x00000000d05ef080, %r1, %r11
	setx	0x00000000d06ef0c0, %r1, %r12
	setx	0x00000000d07ef000, %r1, %r13
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe822a038  ! 3: STW_I	stw	%r20, [%r10 + 0x0038]
	.word 0xe4336030  ! 5: STH_I	sth	%r18, [%r13 + 0x0030]
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	.word 0xe4298008  ! 7: STB_R	stb	%r18, [%r6 + %r8]
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	ldda	[%r9]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xe452c008  ! 13: LDSH_R	ldsh	[%r11 + %r8], %r18
	ldda	[%r9]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe002e028  ! 15: LDUW_I	lduw	[%r11 + 0x0028], %r16
	.word 0xe42a4008  ! 16: STB_R	stb	%r18, [%r9 + %r8]
	.word 0xec424008  ! 17: LDSW_R	ldsw	[%r9 + %r8], %r22
	.word 0xe4498008  ! 19: LDSB_R	ldsb	[%r6 + %r8], %r18
	.word 0xe0032000  ! 20: LDUW_I	lduw	[%r12 + 0x0000], %r16
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe81b0008  ! 22: LDD_R	ldd	[%r12 + %r8], %r20
	stda	 %f0, [%r9]ASI_BLK_P
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe442e038  ! 25: LDSW_I	ldsw	[%r11 + 0x0038], %r18
	.word 0xe03ac008  ! 26: STD_R	std	%r16, [%r11 + %r8]
	.word 0xe04a6010  ! 27: LDSB_I	ldsb	[%r9 + 0x0010], %r16
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe01a6030  ! 31: LDD_I	ldd	[%r9 + 0x0030], %r16
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	.word 0xe04ac008  ! 36: LDSB_R	ldsb	[%r11 + %r8], %r16
	stda	 %f0, [%r9]ASI_BLK_P
	membar	 0x40
	.word 0xa8330008  ! 38: SUBC_R	orn 	%r12, %r8, %r20
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	.word 0xe8428008  ! 41: LDSW_R	ldsw	[%r10 + %r8], %r20
	.word 0xec330008  ! 42: STH_R	sth	%r22, [%r12 + %r8]
	.word 0xe83a6020  ! 43: STD_I	std	%r20, [%r9 + 0x0020]
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe812c008  ! 47: LDUH_R	lduh	[%r11 + %r8], %r20
	.word 0xe071c008  ! 48: STX_R	stx	%r16, [%r7 + %r8]
	.word 0xa0b1a008  ! 49: SUBCcc_I	orncc 	%r6, 0x0008, %r16
	.word 0xac0ac008  ! 50: AND_R	and 	%r11, %r8, %r22
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe41b2028  ! 53: LDD_I	ldd	[%r12 + 0x0028], %r18
	.word 0xec526030  ! 54: LDSH_I	ldsh	[%r9 + 0x0030], %r22
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	.word 0xe02ac008  ! 56: STB_R	stb	%r16, [%r11 + %r8]
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r9]ASI_BLK_P
	membar	 0x40
	.word 0xe43b6018  ! 61: STD_I	std	%r18, [%r13 + 0x0018]
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	.word 0xe4398008  ! 63: STD_R	std	%r18, [%r6 + %r8]
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe021a028  ! 66: STW_I	stw	%r16, [%r6 + 0x0028]
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe401c008  ! 68: LDUW_R	lduw	[%r7 + %r8], %r18
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xec2aa038  ! 70: STB_I	stb	%r22, [%r10 + 0x0038]
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec09a028  ! 72: LDUB_I	ldub	[%r6 + 0x0028], %r22
	.word 0xe849e000  ! 73: LDSB_I	ldsb	[%r7 + 0x0000], %r20
	.word 0xe822a038  ! 74: STW_I	stw	%r20, [%r10 + 0x0038]
	.word 0xe019a018  ! 75: LDD_I	ldd	[%r6 + 0x0018], %r16
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r9]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r9]ASI_BLK_P
	membar	 0x40
	.word 0xe0234008  ! 82: STW_R	stw	%r16, [%r13 + %r8]
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	.word 0xe849a028  ! 84: LDSB_I	ldsb	[%r6 + 0x0028], %r20
	.word 0xe4036000  ! 85: LDUW_I	lduw	[%r13 + 0x0000], %r18
	.word 0xec0ac008  ! 86: LDUB_R	ldub	[%r11 + %r8], %r22
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	ldda	[%r9]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe8318008  ! 89: STH_R	sth	%r20, [%r6 + %r8]
	.word 0xe831a000  ! 90: STH_I	sth	%r20, [%r6 + 0x0000]
	.word 0xec5a8008  ! 91: LDX_R	ldx	[%r10 + %r8], %r22
	.word 0xe049e030  ! 92: LDSB_I	ldsb	[%r7 + 0x0030], %r16
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	.word 0xe83ac008  ! 94: STD_R	std	%r20, [%r11 + %r8]
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	.word 0xec736018  ! 99: STX_I	stx	%r22, [%r13 + 0x0018]
	.word 0xe8024008  ! 100: LDUW_R	lduw	[%r9 + %r8], %r20
	.word 0xec22e028  ! 101: STW_I	stw	%r22, [%r11 + 0x0028]
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe02b0008  ! 103: STB_R	stb	%r16, [%r12 + %r8]
	.word 0xe4424008  ! 104: LDSW_R	ldsw	[%r9 + %r8], %r18
	.word 0xec02a008  ! 105: LDUW_I	lduw	[%r10 + 0x0008], %r22
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe4132000  ! 108: LDUH_I	lduh	[%r12 + 0x0000], %r18
	setx	0x00000000d08e1180, %r1, %r6
	setx	0x00000000d08e1080, %r1, %r7
	setx	0x00000000d08e11c0, %r1, %r9
	setx	0x00000000d08e1040, %r1, %r10
	setx	0x00000000d08e1000, %r1, %r11
	setx	0x00000000d08e11c0, %r1, %r12
	setx	0x00000000d08e1100, %r1, %r13
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xe4336010  ! 112: STH_I	sth	%r18, [%r13 + 0x0010]
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe001a008  ! 114: LDUW_I	lduw	[%r6 + 0x0008], %r16
	.word 0xe021a038  ! 115: STW_I	stw	%r16, [%r6 + 0x0038]
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe45aa028  ! 117: LDX_I	ldx	[%r10 + 0x0028], %r18
	.word 0xe439a020  ! 118: STD_I	std	%r18, [%r6 + 0x0020]
	.word 0xe439c008  ! 119: STD_R	std	%r18, [%r7 + %r8]
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec11a008  ! 121: LDUH_I	lduh	[%r6 + 0x0008], %r22
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe43b0008  ! 124: STD_R	std	%r18, [%r12 + %r8]
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe01b0008  ! 127: LDD_R	ldd	[%r12 + %r8], %r16
	.word 0xec4b4008  ! 128: LDSB_R	ldsb	[%r13 + %r8], %r22
	.word 0xe0136008  ! 129: LDUH_I	lduh	[%r13 + 0x0008], %r16
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe81a8008  ! 133: LDD_R	ldd	[%r10 + %r8], %r20
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe839e008  ! 135: STD_I	std	%r20, [%r7 + 0x0008]
	.word 0xe0228008  ! 136: STW_R	stw	%r16, [%r10 + %r8]
	.word 0xec31a030  ! 137: STH_I	sth	%r22, [%r6 + 0x0030]
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r9]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xe4524008  ! 141: LDSH_R	ldsh	[%r9 + %r8], %r18
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe009c008  ! 143: LDUB_R	ldub	[%r7 + %r8], %r16
	.word 0xe02b4008  ! 144: STB_R	stb	%r16, [%r13 + %r8]
	ldda	[%r9]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe4218008  ! 146: STW_R	stw	%r18, [%r6 + %r8]
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe429a008  ! 148: STB_I	stb	%r18, [%r6 + 0x0008]
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	ldda	[%r9]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe4224008  ! 151: STW_R	stw	%r18, [%r9 + %r8]
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe4324008  ! 153: STH_R	sth	%r18, [%r9 + %r8]
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe83ae018  ! 155: STD_I	std	%r20, [%r11 + 0x0018]
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe839a010  ! 157: STD_I	std	%r20, [%r6 + 0x0010]
	.word 0xe442c008  ! 158: LDSW_R	ldsw	[%r11 + %r8], %r18
	.word 0xe84b2018  ! 159: LDSB_I	ldsb	[%r12 + 0x0018], %r20
	.word 0xec498008  ! 160: LDSB_R	ldsb	[%r6 + %r8], %r22
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec430008  ! 162: LDSW_R	ldsw	[%r12 + %r8], %r22
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec3a8008  ! 164: STD_R	std	%r22, [%r10 + %r8]
	.word 0xe029c008  ! 165: STB_R	stb	%r16, [%r7 + %r8]
	stda	 %f0, [%r9]ASI_BLK_P
	membar	 0x40
	.word 0xe84b4008  ! 167: LDSB_R	ldsb	[%r13 + %r8], %r20
	.word 0xe801c008  ! 168: LDUW_R	lduw	[%r7 + %r8], %r20
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe841c008  ! 170: LDSW_R	ldsw	[%r7 + %r8], %r20
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe8318008  ! 172: STH_R	sth	%r20, [%r6 + %r8]
	ldda	[%r9]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec41a020  ! 174: LDSW_I	ldsw	[%r6 + 0x0020], %r22
	.word 0xec318008  ! 175: STH_R	sth	%r22, [%r6 + %r8]
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe822e008  ! 177: STW_I	stw	%r20, [%r11 + 0x0008]
	stda	 %f0, [%r9]ASI_BLK_P
	membar	 0x40
	.word 0xec19a028  ! 179: LDD_I	ldd	[%r6 + 0x0028], %r22
	.word 0xe85b2000  ! 180: LDX_I	ldx	[%r12 + 0x0000], %r20
	.word 0xe001e020  ! 181: LDUW_I	lduw	[%r7 + 0x0020], %r16
	.word 0xec018008  ! 182: LDUW_R	lduw	[%r6 + %r8], %r22
	ldda	[%r9]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe059c008  ! 184: LDX_R	ldx	[%r7 + %r8], %r16
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r9]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xac3a8008  ! 187: XNOR_R	xnor 	%r10, %r8, %r22
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe0228008  ! 189: STW_R	stw	%r16, [%r10 + %r8]
	.word 0xe4536018  ! 190: LDSH_I	ldsh	[%r13 + 0x0018], %r18
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	.word 0xe029c008  ! 192: STB_R	stb	%r16, [%r7 + %r8]
	.word 0xac936000  ! 193: ORcc_I	orcc 	%r13, 0x0000, %r22
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe439a030  ! 195: STD_I	std	%r18, [%r6 + 0x0030]
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xec332000  ! 200: STH_I	sth	%r22, [%r12 + 0x0000]
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xe072e030  ! 205: STX_I	stx	%r16, [%r11 + 0x0030]
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r9]ASI_BLK_P, %f0
	membar	 0x40
	setx	0x00000000d01ef180, %r1, %r6
	setx	0x00000000d08e1100, %r1, %r7
	setx	0x00000000d03ef000, %r1, %r9
	setx	0x00000000d08e1180, %r1, %r10
	setx	0x00000000d05ef080, %r1, %r11
	setx	0x00000000d08e1140, %r1, %r12
	setx	0x00000000d07ef100, %r1, %r13
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec2b4008  ! 210: STB_R	stb	%r22, [%r13 + %r8]
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r9]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	.word 0xec3a4008  ! 214: STD_R	std	%r22, [%r9 + %r8]
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xe041e020  ! 218: LDSW_I	ldsw	[%r7 + 0x0020], %r16
	.word 0xe059a000  ! 219: LDX_I	ldx	[%r6 + 0x0000], %r16
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xe039a038  ! 221: STD_I	std	%r16, [%r6 + 0x0038]
	.word 0xe401a000  ! 222: LDUW_I	lduw	[%r6 + 0x0000], %r18
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe009e038  ! 224: LDUB_I	ldub	[%r7 + 0x0038], %r16
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	setx	0x00000000d02ef180, %r1, %r6
	setx	0x00000000d08e1080, %r1, %r7
	setx	0x00000000d04ef100, %r1, %r9
	setx	0x00000000d08e1180, %r1, %r10
	setx	0x00000000d06ef180, %r1, %r11
	setx	0x00000000d08e1100, %r1, %r12
	setx	0x00000000d08e1100, %r1, %r13
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r9]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xa4118008  ! 233: OR_R	or 	%r6, %r8, %r18
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe032c008  ! 235: STH_R	sth	%r16, [%r11 + %r8]
	.word 0xe439a018  ! 236: STD_I	std	%r18, [%r6 + 0x0018]
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec0a8008  ! 240: LDUB_R	ldub	[%r10 + %r8], %r22
	.word 0xe442c008  ! 241: LDSW_R	ldsw	[%r11 + %r8], %r18
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe072c008  ! 246: STX_R	stx	%r16, [%r11 + %r8]
	.word 0xe0424008  ! 247: LDSW_R	ldsw	[%r9 + %r8], %r16
	stda	 %f0, [%r9]ASI_BLK_P
	membar	 0x40
	.word 0xec72c008  ! 249: STX_R	stx	%r22, [%r11 + %r8]
	.word 0xe0598008  ! 250: LDX_R	ldx	[%r6 + %r8], %r16
	.word 0xe05a6028  ! 251: LDX_I	ldx	[%r9 + 0x0028], %r16
	.word 0xe071c008  ! 252: STX_R	stx	%r16, [%r7 + %r8]
	ldda	[%r9]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe82ae028  ! 254: STB_I	stb	%r20, [%r11 + 0x0028]
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xe021c008  ! 256: STW_R	stw	%r16, [%r7 + %r8]
	.word 0xe001c008  ! 257: LDUW_R	lduw	[%r7 + %r8], %r16
	.word 0xe4718008  ! 258: STX_R	stx	%r18, [%r6 + %r8]
	.word 0xa439a030  ! 260: XNOR_I	xnor 	%r6, 0x0030, %r18
	.word 0xe871e028  ! 261: STX_I	stx	%r20, [%r7 + 0x0028]
	.word 0xe0536028  ! 262: LDSH_I	ldsh	[%r13 + 0x0028], %r16
	.word 0xec71c008  ! 263: STX_R	stx	%r22, [%r7 + %r8]
	.word 0xe412a008  ! 264: LDUH_I	lduh	[%r10 + 0x0008], %r18
	.word 0xe45a6000  ! 265: LDX_I	ldx	[%r9 + 0x0000], %r18
	.word 0xe83b0008  ! 266: STD_R	std	%r20, [%r12 + %r8]
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe409c008  ! 268: LDUB_R	ldub	[%r7 + %r8], %r18
	.word 0xe4726038  ! 269: STX_I	stx	%r18, [%r9 + 0x0038]
	.word 0xec098008  ! 270: LDUB_R	ldub	[%r6 + %r8], %r22
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	setx	0x00000000d01ef180, %r1, %r6
	setx	0x00000000d08e11c0, %r1, %r7
	setx	0x00000000d03ef080, %r1, %r9
	setx	0x00000000d08e1040, %r1, %r10
	setx	0x00000000d05ef0c0, %r1, %r11
	setx	0x00000000d08e1180, %r1, %r12
	setx	0x00000000d07ef180, %r1, %r13
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	.word 0xe022c008  ! 277: STW_R	stw	%r16, [%r11 + %r8]
	.word 0xe82b4008  ! 278: STB_R	stb	%r20, [%r13 + %r8]
	.word 0xec236038  ! 279: STW_I	stw	%r22, [%r13 + 0x0038]
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xe429a030  ! 282: STB_I	stb	%r18, [%r6 + 0x0030]
	.word 0xe81b2030  ! 283: LDD_I	ldd	[%r12 + 0x0030], %r20
	.word 0xec730008  ! 284: STX_R	stx	%r22, [%r12 + %r8]
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r9]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r9]ASI_BLK_P
	membar	 0x40
	.word 0xe872c008  ! 288: STX_R	stx	%r20, [%r11 + %r8]
	.word 0xe042c008  ! 289: LDSW_R	ldsw	[%r11 + %r8], %r16
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec234008  ! 291: STW_R	stw	%r22, [%r13 + %r8]
	.word 0xe4418008  ! 292: LDSW_R	ldsw	[%r6 + %r8], %r18
	ldda	[%r9]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xe851a008  ! 296: LDSH_I	ldsh	[%r6 + 0x0008], %r20
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe41b0008  ! 298: LDD_R	ldd	[%r12 + %r8], %r18



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
	.xword	0xc7a585278653edb5
	.xword	0xd1130d423c7346e1
	.xword	0xd7bb076baa9f41c2
	.xword	0xf3eb7ff62225bed8
	.xword	0x0f12a7c3abf683a2
	.xword	0x7b646ea7062377ec
	.xword	0x69471824ab0770de
	.xword	0x7d275044e975c55d
	.xword	0x2157aa77abd705b2
	.xword	0xd1458cacba14f926
	.xword	0x2651bd9a5a151a6e
	.xword	0x9e682233f94f3d4c
	.xword	0xbc91e11f0ff57f57
	.xword	0x2b75c5ea0e06b9d2
	.xword	0x62d7f4859fd06305
	.xword	0x9e49e862524c5dc4
	.xword	0x97c7596cd18b35ef
	.xword	0x20366614a631bd6d
	.xword	0xdb199b24967eb332
	.xword	0x43dca1086bd2cac9
	.xword	0x9a871a875adc4d73
	.xword	0x8a3b3dd34755ecf8
	.xword	0x2010428e5980b7f2
	.xword	0xe26474bf69c3931e
	.xword	0x6495c611e8c530b2
	.xword	0xc2e92d5b30b16c33
	.xword	0x2658b4bb36bc6d92
	.xword	0x84e30d89bf60e5a1
	.xword	0x6ac83546469abc3e
	.xword	0x742b95519a1f5d16
	.xword	0x9ba772356d9b6349
	.xword	0x8a67076c0c289930
	.xword	0x0e262f063a82c32d
	.xword	0xc2c6d00c78f9e060
	.xword	0x31c80b79d661c016
	.xword	0xdcc19f1b24822e4c
	.xword	0x9a725a679de9f1b5
	.xword	0x0f1dadc78240f0a9
	.xword	0x088e557b733c0d62
	.xword	0x5fa360a6519aa02a
	.xword	0x0d9f0f37a4a410c0
	.xword	0xf6c904de99d000f8
	.xword	0xe1464a06edb7269f
	.xword	0x424108c99bed0086
	.xword	0x04eb06891fbe9979
	.xword	0x4c8eb86e9373513e
	.xword	0x7d44572df4e0fa5f
	.xword	0xc65172b570a174ed
	.xword	0x6373cd8920002da6
	.xword	0xfc517bb3599fcf78
	.xword	0x8e8fed1b68f22970
	.xword	0x3c6a12bce631a2d4
	.xword	0x1c3bbeaeed31ce84
	.xword	0x38be6fc745d5a862
	.xword	0xc7271c5a1a209e59
	.xword	0x49ad77a3e53328fe
	.xword	0x21cc0626eab4110d
	.xword	0x77450ea45f07d0c9
	.xword	0xb6821307810a6b9c
	.xword	0xe8de926ada596dea
	.xword	0x117fda0788b1f4af
	.xword	0xff69631d0a66a3ee
	.xword	0xaa2d48938c26790f
	.xword	0xbeb4292a0d80118b
	.xword	0xabd89f4019ad07b3
	.xword	0xc6a9a141d814c00d
	.xword	0x9a23b6c0ff150886
	.xword	0xe5fcd637ed06d94e
	.xword	0xa5d95568107edf72
	.xword	0x8689746698e09cd9
	.xword	0xc7ed2821c273d488
	.xword	0x7ad4cd05654740d7
	.xword	0xc67662fcbc7a751e
	.xword	0xce2e17f0f11d780b
	.xword	0xea8f41eb7f19d860
	.xword	0x411288227bd4bfea
	.xword	0xd03714838dbcffc6
	.xword	0x95ab4ccb808eaa77
	.xword	0x5b3bbc31a8b1f204
	.xword	0x014ae69215776cd9
	.xword	0x6e4e15c83d4e40f9
	.xword	0xf06ee512fc7c3adc
	.xword	0xef15a343254d034a
	.xword	0x284579149ca5ae3a
	.xword	0x26e17c1ca282efca
	.xword	0x0a697add679ac162
	.xword	0xf26b0faec8ec51e3
	.xword	0x1b389ea82fb65968
	.xword	0x12fdfc347ea99c8c
	.xword	0x23e2aec2f13453dc
	.xword	0xc2a1ed42100ea3cd
	.xword	0xf774fcbed49737de
	.xword	0x845d638a1caa5da5
	.xword	0x2e67092361e58619
	.xword	0xac0468e2bf143cee
	.xword	0x79e6dde8d1525d17
	.xword	0x96ab940af343be08
	.xword	0xd7c8a368a5a3a466
	.xword	0xed981bd334109fd4
	.xword	0xf22b4cf2c0b8a115
	.xword	0x781d5bcd1225e924
	.xword	0xa1a7d02c2498a12f
	.xword	0x694aa5c8856becd6
	.xword	0xa7964dfa3d457fee
	.xword	0x60b6a89af3dbdc9c
	.xword	0xe862b70b5129d082
	.xword	0x9f8c10826c321bc5
	.xword	0x40797c5e92f088da
	.xword	0xebfd8c75fa95b6b5
	.xword	0x0e0620bfde6ef3de
	.xword	0xaca66656aa7277a9
	.xword	0xd59a3337f30cffa6
	.xword	0x690eaa4fe1070ae1
	.xword	0xe91b73a7891edabe
	.xword	0xaefa3d35212c05dd
	.xword	0xa7caa5d9f7dba301
	.xword	0xbb53d95498e2d3f1
	.xword	0x931c6d79f38f06c4
	.xword	0xb0510e3d4f4079b3
	.xword	0x0fab16b41df7bc1d
	.xword	0xed5c83030d99e6e5
	.xword	0x96e60265e8c3313b
	.xword	0x668d296a446bf16f
	.xword	0xbc921c37c8d7e81e
	.xword	0x5d5ea28ba801ffe2
	.xword	0xad2e2cfef3adc52b
	.xword	0xdec6a680cda6a956
	.xword	0xcdacfa903e313cb2
	.xword	0x8a3abd838da4391c
	.xword	0xfa85cb663984b28e
	.xword	0x51a87cca095d9eba
	.xword	0x82a7208cd3e2754a
	.xword	0xe7890a3149092217
	.xword	0x6b163bd419997ea4
	.xword	0x26aa4e730b085ef8
	.xword	0xe9aff76c059b7ac6
	.xword	0xce1ee556d4cf5e1a
	.xword	0x17a79b4b012f0cd5
	.xword	0x0085db1587f318b3
	.xword	0xe5c958b9bcc6960c
	.xword	0x400d0229e1a2b5d8
	.xword	0x2b6409a8489ed755
	.xword	0x9b43a59a38b723f3
	.xword	0x20938e32d8777570
	.xword	0x63e8f9d900d3f555
	.xword	0x21d7b7b34c0494ed
	.xword	0xde4e11f379f9e1f4
	.xword	0xd6babcbc02ad0b0d
	.xword	0x9860ef97c6c270cc
	.xword	0x9d407a702020a3ab
	.xword	0x4f00042970339ef1
	.xword	0x404732b4208edaf8
	.xword	0x84e5dfc4363e9809
	.xword	0x6ed199a3bec38175
	.xword	0x5349d34e4d955eb6
	.xword	0x19146f43bc16b940
	.xword	0xc408225c1c2d08e7
	.xword	0xe5061530d8d16dbe
	.xword	0x924bd91f8dfcb567
	.xword	0x622da13d3e992525
	.xword	0x5409d45efd2cd5c7
	.xword	0x1ce4d3e0520efd73
	.xword	0xb62e118c1659831a
	.xword	0x3d83df718f9a638a
	.xword	0xa7ab24062e1f0429
	.xword	0x6a5f39acd59d21fc
	.xword	0xf1d59886ebb97d47
	.xword	0x14ba4fd75db61848
	.xword	0x0dad935a252e065d
	.xword	0xf97d2580a22ca537
	.xword	0x0b0d36db1bd09fc5
	.xword	0xf04b42c313bb7e6f
	.xword	0x1b39878105ce9844
	.xword	0xd25a9abd27b27b7a
	.xword	0x19e571759243f267
	.xword	0x543b0a54eddaabcc
	.xword	0x70463a3c574eae9c
	.xword	0xd09fb91e68dd07dd
	.xword	0xbd3255c1d6598a92
	.xword	0x81b320284ab0e91c
	.xword	0x9c4ff6cb2ac5ef64
	.xword	0xf2a56a886d172419
	.xword	0x1ca1ce1523e70f77
	.xword	0x2472dfed6f7119e7
	.xword	0x15658e8fc39280fd
	.xword	0xbc514a6e2de2c398
	.xword	0x7c6c7910977e0117
	.xword	0x5aecd0a979d20046
	.xword	0x8c91e459ce9cc1ea
	.xword	0x329ceb7fded7fc1e
	.xword	0x29c9f8f51e17abc4
	.xword	0xa66e1ddf2703934c
	.xword	0x56a7fbbd01daa68c
	.xword	0xd84053ec38869db3
	.xword	0x05a4140e4e2ee4b5
	.xword	0xc2d080a0e688e55b
	.xword	0x5042d3e036868267
	.xword	0xd79b093e39771b00
	.xword	0x70d551a37b45facd
	.xword	0x4f4c90d2eca064a3
	.xword	0x62b6cfe0b077b807
	.xword	0xb47de9ad3b5f08cb
	.xword	0x50c0c44bc16836f8
	.xword	0x72c68ec661745116
	.xword	0x0a674e54c4d1d43b
	.xword	0x388d8f39d3b5f4f8
	.xword	0x555da1ebf67b04ed
	.xword	0x9d5d3db9117873f9
	.xword	0x181c9a52b139d2ba
	.xword	0x6934bf2a0ef6354d
	.xword	0xcb3caab74d1ff9a1
	.xword	0x8d1d2443377b32ab
	.xword	0x942bf2e57a8cf805
	.xword	0x65d9ffa7926d6107
	.xword	0xe8a4d1d4c19e39ea
	.xword	0x3e8d192061268189
	.xword	0xa881ac710a4c78be
	.xword	0xf755e1987c8072a4
	.xword	0x616e28792587b8ea
	.xword	0x7319ac47a43dee0d
	.xword	0x3dcafcd766609d1c
	.xword	0xbc8f0a5ebfba6636
	.xword	0xc5d02a301f007649
	.xword	0xa5ee524beb457db5
	.xword	0x772a48bba71a03df
	.xword	0xd0fb525171ce6c8f
	.xword	0xd63d2d3e2643ff34
	.xword	0x6a7d9e320689fb8c
	.xword	0x7d18c22f092c0080
	.xword	0x1b83473d693656b5
	.xword	0xd116ff141aa7da9d
	.xword	0xde0e638dae6ebf4a
	.xword	0xf2bd811d74d7811e
	.xword	0x4de961726640d027
	.xword	0xfcba2f298ab080b0
	.xword	0x63dd98859b0fc3c8
	.xword	0xa1f9a15760e62adb
	.xword	0xe3b08caed5ba84e7
	.xword	0x4d80b741482675eb
	.xword	0x631c3b1683c32297
	.xword	0xb4d0d5e2e3373b9e
	.xword	0xcc43d25cc199babf
	.xword	0xc2081d4f67ca8a7c
	.xword	0xf01b4e4811b888db
	.xword	0x9a6008ae4e44e7ba
	.xword	0xe5e46e051aa3bb06
	.xword	0x23dea66451be13f4
	.xword	0xb82de7a37dd4ec1b
	.xword	0x18117822da38c5f9
	.xword	0xe192e5c351b3880e
	.xword	0xcc84625ccd19df68
	.xword	0x0e7046746b712644
	.xword	0xd09d31405c19290c
	.xword	0x58b6a5a55cab79c8
	.xword	0x5eaf209ed4ed7f91
	.xword	0x687e68eeec524887



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
	.xword	0xd8bbcabefc869d70
	.xword	0x606eef5b6a82d488
	.xword	0x40ebd56dbfb17267
	.xword	0xda9bf34353305dc6
	.xword	0x1bd1199de193f311
	.xword	0x03cb0ace5bf42a91
	.xword	0x255b0e8976b9ebf6
	.xword	0x405f8a484e86cf17
	.xword	0x3f60d6c40a1b3637
	.xword	0x9580a800c776071e
	.xword	0xe4780e81fce6abce
	.xword	0x367feb3e7c035c1f
	.xword	0x4f763040d483be57
	.xword	0xbea54a57f07557fb
	.xword	0x141937fa6a135d98
	.xword	0x7a8147ef64ea168a
	.xword	0x31ed1a47ec705ee1
	.xword	0x57df3d52bcd08e9c
	.xword	0x24ff49f275d73801
	.xword	0x6520b1f0f4b43440
	.xword	0x3ea5ed5af83faf04
	.xword	0xade323b6d8e50bdf
	.xword	0x880dd5cb586c0d01
	.xword	0x92ced61c6fb62e6b
	.xword	0x2283e476753c9eb4
	.xword	0x3aac4e30e2ab3ef9
	.xword	0x3e0270675b439a30
	.xword	0x1fe21966bf90077c
	.xword	0x6b3de3c2aa6d20b1
	.xword	0xf01b47b71dfbb5b4
	.xword	0x54b161635d1fd012
	.xword	0xf85d074566c5b91c
	.xword	0x42105702ea1fb0a7
	.xword	0x251328d4492e0be8
	.xword	0x536d3e60d5a4f4f9
	.xword	0x37a8835ac897dddd
	.xword	0xd41bce6135522281
	.xword	0x9caddb79cc7b77fe
	.xword	0x59c1cbe91bd51de2
	.xword	0xbc88a897c83c44f9
	.xword	0xa2a30393c16571e3
	.xword	0x057b01bcf6c7bd7d
	.xword	0xb5ecddd97624a748
	.xword	0xc7ebc29e891df7a7
	.xword	0x0478b70ae1cd57b6
	.xword	0x22392559da1a3aea
	.xword	0x46b76cba49093053
	.xword	0xc98ec36aa98f5130
	.xword	0xcccd05b0810b538f
	.xword	0xe29bf90d25046db4
	.xword	0xd9c944bfd40ea8d4
	.xword	0xd692494f1b6b4eb5
	.xword	0x2a06728ffad12ff6
	.xword	0x3ca31ca264830c2d
	.xword	0x8c0b513f698ceaaf
	.xword	0xb6fa06ee3ddfbeec
	.xword	0x7be10e81a973d1d5
	.xword	0x1f02a200a989b073
	.xword	0x921a55a03264b470
	.xword	0xeb011eaf65ba6489
	.xword	0xb3b3938f69929076
	.xword	0x5b8dfa5e965344a3
	.xword	0x8444ed734971e222
	.xword	0x8ca4b401c7331700
	.xword	0x4aaa18efed211a52
	.xword	0x837df8702fab8099
	.xword	0xd8fa43e3e3e4ce55
	.xword	0x5c5ebdb19b12c7f0
	.xword	0x5ca91aab33e70067
	.xword	0x0ff6b295b8e99e9a
	.xword	0x473532b6d35f4b47
	.xword	0xc4fe9316435a03d8
	.xword	0xb54e97662dd41f62
	.xword	0x7565d561efec172f
	.xword	0x25c1076a0dfa8a90
	.xword	0xe31dc6b60d79e181
	.xword	0xea8c27b6f6282474
	.xword	0x74637eda568c6128
	.xword	0xc30effbd9c6f5881
	.xword	0x7be3c79cbec50981
	.xword	0x370a30b5c066806b
	.xword	0x1b2f50c75705a733
	.xword	0x47efc4096ff9378e
	.xword	0xb6be76481c10a12c
	.xword	0xea559e3072bcb789
	.xword	0x3f7769748ea3f900
	.xword	0xbb448f53a1ba3071
	.xword	0x8b32dc7437860acf
	.xword	0xd1c8efb6129fc51d
	.xword	0x115eb6f0734f162d
	.xword	0xa488ca032b25cb28
	.xword	0x1b21d7892b5f7a1d
	.xword	0xb27896a550746759
	.xword	0xf8a8716397018589
	.xword	0x84a523574e589615
	.xword	0x9fb383651158fee7
	.xword	0x399d36656ddd3050
	.xword	0x238ac200384d591d
	.xword	0xd0cdb0be6ccf4a28
	.xword	0x7f50262f752b6081
	.xword	0x5e7fcc895fb9b210
	.xword	0xb016d96b3f304332
	.xword	0x5ba4fee774630fe6
	.xword	0x297906b4f8d117ca
	.xword	0x51e0e2215eeee6db
	.xword	0x96b4cca9d2250022
	.xword	0x25e9bc95c4400460
	.xword	0xf5dfe7098ff6cc08
	.xword	0x4416487d3944e441
	.xword	0xf512adcfcb0c0249
	.xword	0xcc6916fe185caa63
	.xword	0xd91937af18047f44
	.xword	0x18575a647d0da10e
	.xword	0xafa806b143de3b1c
	.xword	0x385902887e45a1e8
	.xword	0x5c70601352f11922
	.xword	0x5cce4e4d731b29dc
	.xword	0xa2b69ebff1787514
	.xword	0xdf618210e194deb1
	.xword	0x075dc6cd6f05b77a
	.xword	0x2ced10a68cea5ac4
	.xword	0x64cd31d4437e94cc
	.xword	0xfc09fc65a5b625d8
	.xword	0xc975105da5506382
	.xword	0x4345de746815a93b
	.xword	0x66b1a7a6cb8de973
	.xword	0xa77e3a1b573a5778
	.xword	0x0c34f4703e574abc
	.xword	0xa3c39ced5aa73c79
	.xword	0xda16e241907081ac
	.xword	0xfc2f5823da8b437d
	.xword	0x44cfb98ebfff1d18
	.xword	0x53c951a1918655ff
	.xword	0x5bb1c6d99a01f78c
	.xword	0x529b60560835c607
	.xword	0x848a8a4c8839912b
	.xword	0x8238f1c1e2e20775
	.xword	0x2e740c0300a26639
	.xword	0x13158282ece957db
	.xword	0x2bac23d5f34a3179
	.xword	0xcccdec63c7cb4706
	.xword	0x31eefc78aeac0431
	.xword	0x9b8d10d4d997b469
	.xword	0x82a4ad61decf0a47
	.xword	0x43fda15d391fff99
	.xword	0x3bfcd5a51ab47b33
	.xword	0x9248fe11e03e4c3d
	.xword	0x0c7dcd4755fdbeff
	.xword	0xd21cc08bfd552f0d
	.xword	0x6bfa8b37a2f4fcaf
	.xword	0xc8606881f27e9b13
	.xword	0x93c3c5d44e9ea7ee
	.xword	0x46b5660674978392
	.xword	0x3c84e2f3d6b7df26
	.xword	0x55cccb9c2d396c40
	.xword	0x082a2dba5c42dfcc
	.xword	0xd6180b32671d1ab6
	.xword	0x8bad79d655f6cb9d
	.xword	0x7335b4e43e75d6a6
	.xword	0x0445ad563cd47f88
	.xword	0x8c4cee22f7800844
	.xword	0x80d80c779f050241
	.xword	0x0b38faa3d00c6c2b
	.xword	0xfbcccbe4844ec359
	.xword	0xb86b83e6f19529b7
	.xword	0xa27d78b3b5bf7451
	.xword	0xbed6ee50f37e4933
	.xword	0xa94f5b9c7c2f823f
	.xword	0x277750782e381e96
	.xword	0xff917c93cd07b8eb
	.xword	0x87b0a5d106e08aa8
	.xword	0x83c3e9fc2475d14b
	.xword	0xe13d18dd01b38e52
	.xword	0x6e798d958709e470
	.xword	0x7d116b086c62b16d
	.xword	0x4d49c784ff68c4df
	.xword	0x961caa8a91a39eb6
	.xword	0x09acacca5badcafc
	.xword	0xfd648bcb0dbeddf6
	.xword	0xe669d767d5d07a3d
	.xword	0xc4c51490658bc00c
	.xword	0xa6a5c69a54026bcd
	.xword	0x919cf0638b3e67a7
	.xword	0x1c8691ad17538dec
	.xword	0xabc4c654568a8684
	.xword	0x15e0fb46ec033ab2
	.xword	0xad34d86a513ca817
	.xword	0xe945790b8ad047ed
	.xword	0x0cd298c908429e31
	.xword	0xbf468fe19f1ea50f
	.xword	0x5de88806bfe34abd
	.xword	0x16b958b844fd0845
	.xword	0xe83761146e29ee5d
	.xword	0x61f68bd350f3c315
	.xword	0x449273e168ae6ab8
	.xword	0xd0b5f5077760b989
	.xword	0xdda33808e81f29e1
	.xword	0x282580b556fc124d
	.xword	0xdb4af9f49b487911
	.xword	0x7c80dfb68c9fa389
	.xword	0x0c55d6c427c244c4
	.xword	0x3aafb23e466ea3ae
	.xword	0x097027d93a3d2783
	.xword	0x6507a31a49017903
	.xword	0x838d5bb0be683071
	.xword	0x30e8b06dbaddc149
	.xword	0x1742431e6b6f8c68
	.xword	0x1cfd4a9b4fcfd18f
	.xword	0x688fc5b86ca3c5f3
	.xword	0x1699468df1524987
	.xword	0xdd533370dd75b7a2
	.xword	0x8b8868bd8e7ddd0a
	.xword	0x7a5ee2ae0a09dbd8
	.xword	0x6d0e82248c1374b8
	.xword	0x7c1023f2436f578a
	.xword	0xb2bf560b140bdb6d
	.xword	0x0ab7d6ac2284e4a0
	.xword	0x279f0bab86b93835
	.xword	0x58183777795acfba
	.xword	0xd615dfb8fce2822e
	.xword	0x922c4a17675f7eac
	.xword	0x883600bc1a8ff509
	.xword	0xaa0c9d71973aba5e
	.xword	0x5dd42a9a01913f50
	.xword	0x582bdac2f1ae46f9
	.xword	0xf01ddf9d5746e672
	.xword	0x4fa813bd7309a86d
	.xword	0xae907dab8598c71d
	.xword	0x8f3f5d3e946b2986
	.xword	0xa10ff1824bb8818e
	.xword	0x8cf23f9405c188da
	.xword	0xa9fa5edf0fb98e25
	.xword	0xc5f686b5162ebe76
	.xword	0x675bc4c90e49d520
	.xword	0x58d10d858428215f
	.xword	0x66ee906c6d38800d
	.xword	0x17a6acc80ef03be7
	.xword	0xaa7ab0b22b5c36b6
	.xword	0x2914faa7fb569520
	.xword	0xf87ae38e125cc6b8
	.xword	0x58348d66aa351b1e
	.xword	0xdd15d79f3e43fcb3
	.xword	0x12975710f093a397
	.xword	0xb2b5409396b46bce
	.xword	0xb9f23cc7ca7cdeb3
	.xword	0x180392187954b820
	.xword	0x781d123f2d44b9de
	.xword	0x048d385dcef09c30
	.xword	0x40271c8b1e45947c
	.xword	0x331266b02650f3ec
	.xword	0x679dc776608a85ad
	.xword	0xdc3c85098a4d4c1b
	.xword	0x3162103d290cd4d6
	.xword	0x16db98f0a307c924
	.xword	0x4b6d5049ca55cd44
	.xword	0xc9aa8dff09a177a1



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
	.xword	0xdf947eb1b03261b1
	.xword	0x21c950f59d41b562
	.xword	0x03becd67c43e6177
	.xword	0x2c0ad6fb1790f3db
	.xword	0xde5427769c814b3b
	.xword	0x90ce27d831f85419
	.xword	0x6910ce5ce1bea0cc
	.xword	0xa3028f06e5454d98
	.xword	0x18b79feeb2007e35
	.xword	0x3184db41a3fa1026
	.xword	0x1f73ae62df569b61
	.xword	0x5ed4238fbd4e9dfc
	.xword	0x306351be305dab3a
	.xword	0x30e44601bb8b5c51
	.xword	0xa215db9cb1a41718
	.xword	0x7f8782f52cafabab
	.xword	0x106c46d3c303a6f7
	.xword	0xe7467a685ab65503
	.xword	0x86affd4ae5c5092d
	.xword	0x914cebd5f4060538
	.xword	0x80c2377acfb05bdf
	.xword	0xeccc62d937ee984d
	.xword	0xcc1c5a7a6baf01af
	.xword	0x656223c6e46a452d
	.xword	0x257425eddc6330d5
	.xword	0xd354db37bed56515
	.xword	0x6fbe72dd8336c35b
	.xword	0x2b962a8920b1a8fd
	.xword	0xadaebc9d8a218e37
	.xword	0x66542c1588711e67
	.xword	0xb8546ced31e76d40
	.xword	0x15a6c811202df639
	.xword	0xca65c365a40d8aa5
	.xword	0x6b1c6ce7ed1870ab
	.xword	0x72f9d1436b8f40da
	.xword	0x0a86b3c05f9090f8
	.xword	0x623a3fe1302191f7
	.xword	0x5af5a93d7c8419e0
	.xword	0x70300f68bf649eaf
	.xword	0x5bd35bd86137e627
	.xword	0x7ffa3068c6835977
	.xword	0xb0655b51a0be4d3b
	.xword	0xd6654bef34e7ad7e
	.xword	0x4261cfd058b2d283
	.xword	0x9d6389483ef5ee7f
	.xword	0x6b41af20d90bb702
	.xword	0x302d69885cfc981a
	.xword	0xe623c9565fd26ee6
	.xword	0x3dc1d9125d63e1bf
	.xword	0x53ddd73ce8e21b60
	.xword	0x5f2b438c6e358549
	.xword	0x825af6141db7ba2c
	.xword	0x420282777eff2b22
	.xword	0x5583bc84bf4532c6
	.xword	0x8acab57f5793e3a4
	.xword	0x8ebb87886b213609
	.xword	0x2fbb56dbfca62255
	.xword	0xe8a57fcf944a59e9
	.xword	0xa6cbfa0d8a067f9f
	.xword	0xb28865e43673e9ad
	.xword	0xb0612e4fb1ec982b
	.xword	0x4016cf2b30d41a96
	.xword	0x059d5f8cc336b2a9
	.xword	0x2a9c3f60003e1353
	.xword	0x96458427766789d8
	.xword	0xba768e53aad6f243
	.xword	0x884110f6ab5e13e3
	.xword	0xd17b7bf015a716cc
	.xword	0x5f9b8cf577067793
	.xword	0x9ad68e8792004273
	.xword	0x90d2fbd20c700a77
	.xword	0x2dd9e3db7bd77655
	.xword	0x11d1a817e2ec8cdb
	.xword	0x72e4c93504e2f0fa
	.xword	0x47a22b92526af4af
	.xword	0x6ca6c03a74b1d26a
	.xword	0x999053b244fd107c
	.xword	0xb1353991842dbead
	.xword	0x5da109afb6dcdae8
	.xword	0xda80268afa902bb1
	.xword	0x3eac3b2c6950a964
	.xword	0xb48616165ab696d0
	.xword	0xc09f73371a17bd1c
	.xword	0xa1563904f638291e
	.xword	0xf8e9caa56caf8219
	.xword	0x75777dc16490e77a
	.xword	0x0933d11a4dc6cbcb
	.xword	0x59f93a042e33bf2d
	.xword	0xc0e3ef838ce458c8
	.xword	0xad6ed5d4c774982e
	.xword	0x326d8be1917c9fae
	.xword	0x0432a00e3d48501d
	.xword	0x36453a85f16eb37f
	.xword	0x4466fa8eef559c56
	.xword	0x1a4aa815eb0a52af
	.xword	0xc7a27c6c5003f39d
	.xword	0x1765b44432e886e1
	.xword	0x22d39c758caf5d48
	.xword	0xf1d876e5f71e9b28
	.xword	0x5fc05da3910b0ad3
	.xword	0x2fc86970262a20de
	.xword	0x11bd11c0c942de90
	.xword	0xe6e0379c690069c8
	.xword	0xb0c8743bedc497fb
	.xword	0x68ad181fd237d35f
	.xword	0x53282f1bf665a81d
	.xword	0x7595bea9783289d0
	.xword	0x00d895e2ee10a270
	.xword	0xe46279151f32a433
	.xword	0x289c785365a3e494
	.xword	0x65d91793dd9cb17d
	.xword	0xe11c66c58c2bba34
	.xword	0x5d16c1c2a0d94f9b
	.xword	0x64abf439523738f3
	.xword	0xe6841e861147eced
	.xword	0xb94680bbe28354d7
	.xword	0x0e1369c172f470c7
	.xword	0x876042169e5cdd34
	.xword	0x1dbb9c1c3cad1f60
	.xword	0x7afb5280c55b3a95
	.xword	0x46755d991287bf05
	.xword	0xa06537cb002c297e
	.xword	0x88ecfd3ebd2c1f28
	.xword	0x24e5059ad1d99924
	.xword	0x07850be38a67eb28
	.xword	0x976d5f8c2b0476a3
	.xword	0x44071968e0b916ab
	.xword	0x05c1fc70a7df4cb5
	.xword	0x1e69b302b7c8f8e5
	.xword	0x11ddb6f1e78ede40
	.xword	0xc334915a17bf0bde
	.xword	0xd5dc07fc208d5c82
	.xword	0xa874e5054bcebc74
	.xword	0x60a51549afda6c14
	.xword	0x23eb0db8f7f2e478
	.xword	0x4ff322bbb5f76d3c
	.xword	0x7ecfbea43784a1c6
	.xword	0xaeba0f53efa4c104
	.xword	0x4521c6368bd53b85
	.xword	0xf4008a9f75635b85
	.xword	0xb4a841fb7a695c03
	.xword	0x3769c9cc923334a2
	.xword	0x37f277cfe96d2863
	.xword	0x11b5af964dc1e8a6
	.xword	0x0fbf7b4836cd2277
	.xword	0xf3a492d4534220fc
	.xword	0xabbef743a81c8b33
	.xword	0x40aa3f86f221a6d0
	.xword	0xbe89620a8387b354
	.xword	0xa405fc7b64345642
	.xword	0x09e1869e04168ca8
	.xword	0xe8a8d2209c4441b3
	.xword	0x313fec3c744758ed
	.xword	0xff76560cf5e2d5e3
	.xword	0x54e759a41dbdb75e
	.xword	0xf71cde9f82395bff
	.xword	0xebd954573a716495
	.xword	0x18c4ad44af9a8632
	.xword	0x9938bbe692ba0643
	.xword	0x2bcf50e6faaa18cd
	.xword	0xa5a113400358f5c5
	.xword	0x8793cf788bd31aa1
	.xword	0x6fbc72d6534c1370
	.xword	0x7def58edcf6a9d90
	.xword	0x8e566053ec238542
	.xword	0x901787fa8be06f25
	.xword	0xc81791ebbc84b72d
	.xword	0x33137d188decbdf7
	.xword	0x956d591bcaf3daaf
	.xword	0x89df623a0d6f5296
	.xword	0xf263f1989dac128b
	.xword	0xdedcb0f3dcf1d488
	.xword	0xcc529711b4ada08e
	.xword	0x489db468d362d5a8
	.xword	0x9c74e27f1aebec94
	.xword	0x6f7e9b1d0108e2f0
	.xword	0x1f1cd107e36fec51
	.xword	0xa014d8501c080ce0
	.xword	0x17d5b263fecb2c63
	.xword	0x13432157b5a87693
	.xword	0xd5512829cdf96dae
	.xword	0x1998089cfc1069e0
	.xword	0x9df63adafe47e3c7
	.xword	0x770f32a75feace49
	.xword	0x2ba3aaf17c558bc1
	.xword	0xcd9a05606d27ea7f
	.xword	0x85df2ebde9714534
	.xword	0xb573c841c3ec0fef
	.xword	0xf88e3bfc6e7676ba
	.xword	0x3da19e2bcf079086
	.xword	0x746f377d714f48ea
	.xword	0x8bd9ddb39a815365
	.xword	0xb0b85e7a530bdc51
	.xword	0x01726485a3b6a946
	.xword	0x8eff04f4b0513ba9
	.xword	0x96aa153d43847f05
	.xword	0x78b9a4312936980d
	.xword	0xf38523c4a369df2e
	.xword	0x63d8539504b49dbe
	.xword	0xcb507b725bbbae50
	.xword	0x18176f7ad1d6b962
	.xword	0x725eee8bf9c83bc0
	.xword	0x126265e691c41d8b
	.xword	0xd722855ce8c1abf8
	.xword	0x5f40bd04ec2abc5d
	.xword	0x2c8612f6fabe0f47
	.xword	0x9cbfe458adc9c87f
	.xword	0xb93ad4b1066166f8
	.xword	0x99e4e3e34562d166
	.xword	0x0fc396a3bbb3cfd2
	.xword	0xb6e3b56c32e3c303
	.xword	0xd751f45e30646a29
	.xword	0xebb88238be970a31
	.xword	0x6002688d524074e4
	.xword	0x034ea47e6396048d
	.xword	0x1d190b76ac8043b9
	.xword	0x191f9a69ea338215
	.xword	0x9e920dacd3d5c4fc
	.xword	0x1b1902ea5a5f6a7f
	.xword	0xf47d9b25d4566d0f
	.xword	0x7de29d7bf35adeaf
	.xword	0xd941b2873363c8e0
	.xword	0xc270928d03d9fa34
	.xword	0x5dcda55e66b6069e
	.xword	0xb0f2f8d39500ee09
	.xword	0x8f6c218b1caae6d9
	.xword	0x8b1ff7d248e4e95b
	.xword	0xf2336dc92a9b7907
	.xword	0x57729821cd7393b5
	.xword	0xba1489bc919a7480
	.xword	0xf75742dc7360f8c1
	.xword	0x0c1e504be3a6bdfc
	.xword	0xfd9193f94ac5bdf4
	.xword	0x584e4c5a86fc646a
	.xword	0x5faba8408197259c
	.xword	0x78c130e33c1495b0
	.xword	0x3c9e77573c894105
	.xword	0x1f29da24fa46ee8d
	.xword	0xffac4258c9a4ca3b
	.xword	0xd5426a44b0aca895
	.xword	0x3c65b3a8b3cb8d15
	.xword	0xe4b8f61a34f842e8
	.xword	0x66ed51dc8216b7ee
	.xword	0xe90bd284681eddd9
	.xword	0x00c0a529a6db60af
	.xword	0x25ba0286599ac328
	.xword	0x12c1b6342a3977c3
	.xword	0x23ef863bdd3d6310
	.xword	0xbaa83077096729aa
	.xword	0xa4fe36653e25f6e6
	.xword	0xcffa814fae32bb7f
	.xword	0x2c7717c257e34b2b
	.xword	0x4e9bb26575cbfb5c
	.xword	0xf111d1ee345c071f
	.xword	0x6d5fc1d7ac309200
	.xword	0x7573ec3c9abc05be



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
	.xword	0x3eb636d30f621c1c
	.xword	0x63af181cffc4b8d2
	.xword	0x7123c4db84f543ec
	.xword	0x23a5ac6618173596
	.xword	0x4846cb7a0c6b5aee
	.xword	0x9c879cab37a8cda9
	.xword	0x1c648a0852a7d617
	.xword	0x51e8916661b09e45
	.xword	0x3b6634e167f51d9a
	.xword	0xbcfcee49e2a4f5a0
	.xword	0x9ef899aaa242066c
	.xword	0x11b1d8596b966865
	.xword	0xff15075f883c80c6
	.xword	0xd48ff6284673026e
	.xword	0xd6f9d7d2ad253702
	.xword	0x26f9a91e45271c9b
	.xword	0xf0723af6c01db795
	.xword	0xda1823b38057efa3
	.xword	0xc35310d8dc7e84bd
	.xword	0xf25456992b0e97a0
	.xword	0x671815742b1534e6
	.xword	0xeb9ce9d3a8e2ca57
	.xword	0x14cffa9a4bf42152
	.xword	0x1bdf2a068ab267bd
	.xword	0x4be2448d5b9111e9
	.xword	0x74417f5bbeb2740a
	.xword	0x82b54194543f5d75
	.xword	0x29b8dda94c572380
	.xword	0x532ac606f626861b
	.xword	0x182ff4960757dfa4
	.xword	0xa549657299c8fb73
	.xword	0x1726aa894f5cf758
	.xword	0x825f7327ea374bde
	.xword	0x803462c9812e5fb0
	.xword	0xa2b3da9ff3a599ec
	.xword	0x92d44b2d10335c1d
	.xword	0xca0de19cdc6360a1
	.xword	0x2ffd3d52cbebc20b
	.xword	0x7970488c816e4bdb
	.xword	0x4e0aaab4a5ab240f
	.xword	0x6cdd2f6fb76d9a5d
	.xword	0xce3000a93cab630f
	.xword	0x0a8c85fd1eaa82bd
	.xword	0x3251e678432da1ea
	.xword	0x0d8b729d8baf33d7
	.xword	0x05c575e25f974127
	.xword	0x03b2d0e06522b4c0
	.xword	0x33cf35da286d6800
	.xword	0x2f54d28e6b6f0971
	.xword	0xb0c43399360b01fb
	.xword	0x0c0a2cb0b8a88b99
	.xword	0x74362125f506104a
	.xword	0xbea4605c6fddea57
	.xword	0x524c64f7c2b24bea
	.xword	0x5b53cdccbf043c7b
	.xword	0x2581e6c93f3e9c45
	.xword	0x0e10dc4024b5e26f
	.xword	0xf5c998ecd80ac013
	.xword	0x19c0d8e78122501d
	.xword	0x272d9cd600e2c1ee
	.xword	0xdada8190be412739
	.xword	0xda3c50afd41ae4f8
	.xword	0x54d9a1f3dca8ba62
	.xword	0x2b21c170b133fa18
	.xword	0x1e840d37d8c242c1
	.xword	0xd25c32697a6b564d
	.xword	0x2bf08898ff5081e9
	.xword	0xbb4eb50f64f15425
	.xword	0x66fb15b21502046b
	.xword	0xb8795041e52a3e42
	.xword	0x2a3cb8f42024fc91
	.xword	0xcb7c09adaea8f2f9
	.xword	0x22433f98d54f66e0
	.xword	0x9cd3dc3abe466ce7
	.xword	0x6ce903512325a0f0
	.xword	0xe50f2dcc310c7064
	.xword	0x11830bdb302be42d
	.xword	0xe26d31c7a31e202d
	.xword	0x8d6e77badd3dde40
	.xword	0x4e1ea169de763ffc
	.xword	0x0201c1c76e4de2b2
	.xword	0x6bc28597f3ba77cd
	.xword	0x125b3d42756a7e5d
	.xword	0x58f9620cbdb70f9b
	.xword	0x97cba6fbb9825060
	.xword	0xe67f3f142699fd99
	.xword	0x9444d8dff3c14134
	.xword	0x873d83661a7abeb9
	.xword	0x0667b0428e7e862d
	.xword	0x0f0e5fdba89ed649
	.xword	0x4e339d32cbaff058
	.xword	0xd4ee1164c7a201db
	.xword	0x9f97051b7540fe31
	.xword	0x5529723af6c37bf4
	.xword	0x0127b09e4c3eae58
	.xword	0x870d7aec433775ea
	.xword	0x1f9e641a96fb246e
	.xword	0xa14ba11bb3372951
	.xword	0xe5f1d6b99112c062
	.xword	0xaf4a8d650c7a0d8b
	.xword	0xbe29e47c8bd493b8
	.xword	0x7fae55e37dd76f71
	.xword	0xfb7ad4fe213ff069
	.xword	0xa9c6f647d96c930e
	.xword	0xf88dcfc2accaa3ba
	.xword	0xdb7fdba69d8d3d4e
	.xword	0x05a69e80c765ce70
	.xword	0xfa0ebc299f20e592
	.xword	0x23b2f440c37e9c41
	.xword	0xa90df3c3b4272108
	.xword	0x80737d83b79ac32d
	.xword	0x8db0f3eba4ad609f
	.xword	0xde779ab72f461c36
	.xword	0x744e624ec0588871
	.xword	0x18818f89d2009988
	.xword	0xa95954a644f329a3
	.xword	0x9772778f157a74e1
	.xword	0x8dbfa77399f305eb
	.xword	0xa2f3dd81ac8ca1b2
	.xword	0xa9634486fe3eb03b
	.xword	0xa5892e59b0bb09c5
	.xword	0x743233d73eb92622
	.xword	0xf4a34eb16f819598
	.xword	0xadb37a6bbda90b95
	.xword	0x96f8da22990b56b7
	.xword	0x6383289c7652ebbb
	.xword	0xbb1fe2dfe9d77faa
	.xword	0xad05e2e3d54259fa
	.xword	0x1256f0d2f98da672
	.xword	0x3a280b8932749d86
	.xword	0xa3d95d0e2d11a8b6
	.xword	0x0f1b8c8470b83ab1
	.xword	0x7b86e2f74fc4f075
	.xword	0xa228a0970ff4778e
	.xword	0x7e1276eadced2b4f
	.xword	0xd916a5aa8681cb2a
	.xword	0x991c7ef154d0f7e4
	.xword	0xe1c7bfadf771faf3
	.xword	0x8219bdbed7886c1d
	.xword	0x6f0cff8918ddf422
	.xword	0xe12d0f88e70c210e
	.xword	0xb58657bafa2619ce
	.xword	0x037b02d033aa2317
	.xword	0xb33a8b828d08f352
	.xword	0x634530438d0de803
	.xword	0x12513ce7d93267a9
	.xword	0x72fc34aa5bc86fab
	.xword	0x0cbb36af9733d0d0
	.xword	0x8f8c31ef14d9b3c4
	.xword	0xa3b3fbc7cd8abe67
	.xword	0xe0d0a75b42b5941e
	.xword	0xb15149a6ee134bec
	.xword	0x4f325558b83be5c0
	.xword	0xb73ada83f2ecd10c
	.xword	0x3eb683b07280921c
	.xword	0xd3e08756c86d8341
	.xword	0x41ef9255bcc16202
	.xword	0x5c4a5dd8ba58299e
	.xword	0xb2a4292675d8db25
	.xword	0xfde7978e817d28e8
	.xword	0xc523ac5ecdc2ce72
	.xword	0x497d2944ac928107
	.xword	0x04dd69cfcebce9ac
	.xword	0xdb018ca75d836d4c
	.xword	0x48939c20b8cb7afd
	.xword	0x048c8f6fb52ac394
	.xword	0xccfc7de4b9cf7e20
	.xword	0x589af019eb2852bf
	.xword	0x24cc0d197f6109ee
	.xword	0xb15dc502bdc93dc8
	.xword	0x70f37ca5b24b8783
	.xword	0xdef73791c2793de0
	.xword	0x72c1f5bd13db17ce
	.xword	0xd6265fe7cec6713f
	.xword	0xa85e55eaffe316c1
	.xword	0xa20c4c3a09e8da82
	.xword	0x77e46f3d829b01bb
	.xword	0xc03572042a92c4d9
	.xword	0x2ea7e8b6c0857d95
	.xword	0xf8cce92dfe881d47
	.xword	0xb04ac89081827852
	.xword	0xdf2fef0763f2a996
	.xword	0x6fb57e90d3943e8b
	.xword	0xb43916f49097d12c
	.xword	0x660f95ee91de530c
	.xword	0x77ab1dcfa0262196
	.xword	0x823b0c659f0c01e2
	.xword	0xbacdb03560a2d459
	.xword	0xa7ccabc80602faf1
	.xword	0xc2f57fdbb5e12516
	.xword	0xce40dd8bc32eae44
	.xword	0xe49873175969b9cf
	.xword	0xafacd2340cc208c7
	.xword	0x5896e7d81d37c0d7
	.xword	0x4f466867b60eff8b
	.xword	0xf05fd5ebe5fa35e8
	.xword	0x1571c39ee8a6fe2c
	.xword	0xdd4c1fc04272bb40
	.xword	0x9cc17c4d55982981
	.xword	0xc4cdc2a7d8023fbe
	.xword	0xe065689cd4131022
	.xword	0xc9d62f2c389ea95b
	.xword	0x62c7c0a31ad24ab1
	.xword	0x9d3c00b803880681
	.xword	0x0f7cef8b6125ff94
	.xword	0x0b89c81cb580dda7
	.xword	0xed52c6414faf08c3
	.xword	0xfcb41128266de097
	.xword	0x77cdad7e5f1861a7
	.xword	0x86fa5d26ea6b8624
	.xword	0xb83116cb5db6dca9
	.xword	0x9deb1a20359bc1a0
	.xword	0x537a80585b8375b7
	.xword	0xf969da1f437c5f80
	.xword	0x1d44d4c84351fbde
	.xword	0xdd35d055c4387be6
	.xword	0x1df4bd4d4a151a27
	.xword	0xbadea838cadb2949
	.xword	0xaa1c7876e2a84f84
	.xword	0x788d76682d6d0e94
	.xword	0xb20623aa838c5d1b
	.xword	0xe77d97565a8b6601
	.xword	0x8aa37581b15cf095
	.xword	0x965d79f17fbccf5e
	.xword	0x145d22d73a65017d
	.xword	0x082c026dde0fe8d2
	.xword	0x3f65229ebe22a366
	.xword	0xa609e38e255b671c
	.xword	0x183edded3db7283f
	.xword	0x21b06d15bf78510d
	.xword	0x9c4e516fba0ba5d9
	.xword	0x3f36c786ead4e2c5
	.xword	0x89a4ef0212eb5762
	.xword	0x1a796cd1cd0fb1c5
	.xword	0xd888c2320ac4dd7d
	.xword	0x324a80dd405824cf
	.xword	0xe2a8923a054552dc
	.xword	0xb6b3de827c5b9003
	.xword	0x3f15f7afe852e29b
	.xword	0xd3c80d0b6641699c
	.xword	0x0b38afe899731025
	.xword	0x625f5a3f86ef3826
	.xword	0x7db9524c78ebbd49
	.xword	0x094f39d9701a2a1f
	.xword	0xd8d5b7fe86c852a9
	.xword	0x160e15fc976fad93
	.xword	0x6477912c989cbf51
	.xword	0xa67461c05eb035fc
	.xword	0x8007168daaf55df1
	.xword	0x011205e79090c42b
	.xword	0x79dcc848ba7520fa
	.xword	0xd4444ea00dc2e170
	.xword	0x6288391f12238508
	.xword	0xd36055faefed4e56
	.xword	0x58ac0b254b54a944
	.xword	0x00db690739e3a7f1



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
	.xword	0x0055f4b619b8be99
	.xword	0xcba8055cb85a6ef2
	.xword	0x98e82050fc2f3cec
	.xword	0x7ee930fdd2eb8d85
	.xword	0x85ce531e8b4cdd7f
	.xword	0xe37c297715d5927a
	.xword	0x0d33d68ed8710e58
	.xword	0x70a13df12ee13ad8
	.xword	0x57f65282ff6196df
	.xword	0x1419157d45d88df3
	.xword	0x2c244dc1e6bc5c46
	.xword	0xd70e9f1d42e9ec6a
	.xword	0xe4adc190567a3364
	.xword	0x3f0adec92b949c08
	.xword	0x682d5b364bbe1baa
	.xword	0x301525b269effab3
	.xword	0x49a5103347df7e23
	.xword	0x08678c5ccfa15624
	.xword	0x05366a7fb2d5a554
	.xword	0x41839ad923dc8912
	.xword	0x50cb36f7b7496a0a
	.xword	0xcc9d0e1e457b1c67
	.xword	0x725cc4053d44e2bc
	.xword	0x3c5b92ec0da9b2bd
	.xword	0x9a14270d7a7e8ede
	.xword	0x3207f315856f8da9
	.xword	0xa83df0a9cbfe47ec
	.xword	0xc5c4f10920e1ca38
	.xword	0x6f1626ae5e1602d0
	.xword	0x41e1b235f414a66f
	.xword	0x14c9ffde43909797
	.xword	0x17c2fee9e8f9c0e8
	.xword	0xe99d848af9249dbf
	.xword	0x04c8098fbf95735b
	.xword	0x1e7b307ad59500c1
	.xword	0x060e69d10b10e6c8
	.xword	0xf5b1b65aca2fa71b
	.xword	0xb7867f249d1ae3d0
	.xword	0xa88d574a5fb150b9
	.xword	0x8ea480b5205f9efc
	.xword	0x999848d8710b9de9
	.xword	0xefbdd34d45aaf79c
	.xword	0x8f1fc0f19bab271d
	.xword	0x6a34ee3f2a10649c
	.xword	0xaf9c2f79be708112
	.xword	0x6cd72de0dc1097e6
	.xword	0xc61847b742d764b8
	.xword	0xf83f9c2313e4346d
	.xword	0x6616614d3d29c308
	.xword	0x1731e4d375b5291d
	.xword	0xc76339286cf5fb8b
	.xword	0x165bc0e18476ba4e
	.xword	0xd446ee5b154dd7af
	.xword	0x2d1564a6a7b10363
	.xword	0xcdf653a6886ad522
	.xword	0x07ec501b122b33a5
	.xword	0x75fffdf4924ed962
	.xword	0x8539f63830acfa31
	.xword	0x15ba708059819a60
	.xword	0x4fc989cabf9b5391
	.xword	0xf2f2e600559a4bc8
	.xword	0x314b8785e1639106
	.xword	0xfe213b9065d6c095
	.xword	0xd7f0224ce3cc43e6
	.xword	0x2505523c9b260b6f
	.xword	0xe4e2e4a63b973eaf
	.xword	0xfe3dd4552ba1a08a
	.xword	0x352f80fcbcb2a805
	.xword	0x3a4c94448dfdd437
	.xword	0x8f26e6c35cf98cab
	.xword	0x880f841cc5ff8c15
	.xword	0xcfedae9784b05e6f
	.xword	0x3ee4596dbae73ea0
	.xword	0xf0d5c4d9f7d47a21
	.xword	0x7866bfcc9bbd4cf6
	.xword	0x454fc3bf065ae219
	.xword	0x863da43c2a1e26a5
	.xword	0x6d968ccb907f7f69
	.xword	0x75865b1dd76a3a81
	.xword	0x78001daceaade496
	.xword	0xefd6bd6faf9c819f
	.xword	0x66ac14bd8739f174
	.xword	0x1942a2c437ba8241
	.xword	0x22596981becee1ba
	.xword	0xee8385bcb2c6f348
	.xword	0xfcd6c8d66d0b3a10
	.xword	0x6df7cb9c915868bd
	.xword	0xd3bd50556f4a6f48
	.xword	0x8298c057a44968a2
	.xword	0x76adae94b6ea2de3
	.xword	0xf119dde090b76cc5
	.xword	0x7a5421e2e1837935
	.xword	0x948995d5308cd09c
	.xword	0xe255ad545a43f265
	.xword	0x3133f7623577f10f
	.xword	0xf2685743c4b96510
	.xword	0x4cf792bfb5f82caf
	.xword	0xdaed88fa6a92e642
	.xword	0x8aa01b97ebf3dd5d
	.xword	0x850abe0971ce3645
	.xword	0x796a861d3d40096a
	.xword	0x5241833fbb6d94e3
	.xword	0xb81bbf5d3d5441b2
	.xword	0x1b97399c96ac4535
	.xword	0xbcc913a9da688fca
	.xword	0xcc595fd678d032e1
	.xword	0x6a6b00cd1b5df8eb
	.xword	0x6f83ca58adb263e7
	.xword	0x30cc36d412371832
	.xword	0x49ea8e5f03403dc9
	.xword	0x1895819e069187a8
	.xword	0xfc051d577cf78d1f
	.xword	0x20e4c44694bc369f
	.xword	0x98b793ae22114927
	.xword	0xe5056c5207c98187
	.xword	0x09b539b559ee2ef3
	.xword	0xa68adbf25d95ef73
	.xword	0x6680c01a25b8c049
	.xword	0x962e9d8fb21554c1
	.xword	0x436faefa1efcb3ef
	.xword	0xfaeebdfcfae7f68e
	.xword	0x33c8816ce57c8073
	.xword	0xd351c469fad5f03b
	.xword	0xca0d60e6d02c2f72
	.xword	0xf1fd9740f875651c
	.xword	0x3a40bf9e32d374d3
	.xword	0x6a6658caebde60dc
	.xword	0x35af232a8e3e6ff5
	.xword	0x5283e5bcf1bc49db
	.xword	0x24d3524d32e05fe9
	.xword	0x4b2ea98fe3151f90
	.xword	0x73dd2c02ba00452e
	.xword	0x42d2dbbaba5c184f
	.xword	0x573559472e06a364
	.xword	0xec9f35f8a8089a7e
	.xword	0xe6c944f1d045eee5
	.xword	0xb625b003807e4a0e
	.xword	0x2d24469cc9476488
	.xword	0xc2988872d1de2db3
	.xword	0xc3c77e204d4da7b5
	.xword	0xbfbd9ef19cd28db9
	.xword	0x3c12dbdbd8a565e4
	.xword	0x068a58308a1f2c58
	.xword	0x5a173048c1d6059b
	.xword	0x4cb8aa006b072315
	.xword	0x07b61ef5f5f0212c
	.xword	0x94b84e046506ee9a
	.xword	0xa8c97bf909d12ffa
	.xword	0xb170816fd267b26f
	.xword	0xff956d66730bee66
	.xword	0x97e8bfcba0f43b3c
	.xword	0xbf659a4113946ecc
	.xword	0xeacc7c5749ded65a
	.xword	0x6356c9a42de11031
	.xword	0xd0374266c0040817
	.xword	0xad5cb015ae893a1e
	.xword	0x3bcc5038baf4919c
	.xword	0xc425b65041963b37
	.xword	0xc183a94d4d8f900c
	.xword	0xa4ba082a416f39bc
	.xword	0xbaa681f965c098d4
	.xword	0xfd1363eb7c972858
	.xword	0x8f69bea58234d05a
	.xword	0xa4bf239f70a0f7da
	.xword	0x7555387debb88e1c
	.xword	0x32adeb7b330cc133
	.xword	0x2b157b7ee4f75a1b
	.xword	0xaab5ab6490bf72e5
	.xword	0xd9a27357e2f6d8d3
	.xword	0x67d88641296376a6
	.xword	0xad5486d3ace0bf3f
	.xword	0xa72be419f497994e
	.xword	0xf73dff2cdc8653ed
	.xword	0x0052eb70f45bf0dc
	.xword	0x0a84dfbb6c48c39f
	.xword	0x96dcc517c795b42c
	.xword	0xdb700897a4075563
	.xword	0x91927f685618d34a
	.xword	0xe8eb738bc484bd7a
	.xword	0x6e8ec2169d8ce974
	.xword	0xa4a3664df990e2ad
	.xword	0x61f1b09a305d44cf
	.xword	0xa369ef1a20037601
	.xword	0x60e6768b6f803683
	.xword	0xc48b0803429cd657
	.xword	0xfeb93dbe84e429bf
	.xword	0x9515ba35e5cd0952
	.xword	0x407e978e0f1ffcd1
	.xword	0x3829c5d95fc76c2f
	.xword	0x9360ab3cd09119fc
	.xword	0xcf24a122fd166136
	.xword	0xec341d96d2ac2b6a
	.xword	0x1136d1ee0487cb30
	.xword	0x3b1ef4622865aa24
	.xword	0x5d5aecb30e5d9c00
	.xword	0x40f44f3a6d2fc38e
	.xword	0x58ce14cbab91d3f6
	.xword	0x4494502d0172c4aa
	.xword	0xd1ed492af721a6c6
	.xword	0xadaf35aeff9a3af0
	.xword	0x2ecbb0c72fe8d25e
	.xword	0xe0bbf604e3642139
	.xword	0x0a202b3bb89b467a
	.xword	0xe94145a9f8f6831b
	.xword	0xc4d0cce4a972d854
	.xword	0xc2a5d9e2f0b38379
	.xword	0x440080b13909d3f3
	.xword	0xbf9a1c859c1ee6b0
	.xword	0xc440fd399bb3ced0
	.xword	0x77711d73b6668e55
	.xword	0x3bb70d0093dceead
	.xword	0xf4dc312239ab925a
	.xword	0xbb223528a058ac3d
	.xword	0xa21e4714e535eff0
	.xword	0x073f1958c79b8d61
	.xword	0x00ef55f2681ed471
	.xword	0xf869f859ca157d58
	.xword	0xa37e61195781f15a
	.xword	0x8a51e970b59df319
	.xword	0xc23a674709b6dfbf
	.xword	0xd5873f78288963a7
	.xword	0xcbbd758e29405464
	.xword	0x6c9a2bbc449d7135
	.xword	0xa3c7140329a6a393
	.xword	0x562733480ef35086
	.xword	0x017eb802b49aaffd
	.xword	0xaf09f9560c6bdcef
	.xword	0xf694952a144ab63b
	.xword	0x39c86d318dd45ced
	.xword	0xadbf2fad2273cd4a
	.xword	0xf5c98ed3ce294207
	.xword	0xc66210ab63d6292f
	.xword	0x010560b3d0481b8e
	.xword	0x113cd5b2c0652d29
	.xword	0xc604eda74a37f19a
	.xword	0x83d7880680865f05
	.xword	0x4b476cd264537ffb
	.xword	0x5d3e96028b27b005
	.xword	0xafe586c239112deb
	.xword	0x84404e69a6090468
	.xword	0x1a82d3629ea19bcb
	.xword	0x5f29c43cbcff05bf
	.xword	0x39e912f2171fa636
	.xword	0x25fd86978a58811e
	.xword	0xc536e7ed0dcde3cf
	.xword	0xa1bc184d9ad75030
	.xword	0xb47235c942ad5144
	.xword	0x1b4e62025d5123cf
	.xword	0xc740c45aa2a19dae
	.xword	0x1cd95fc332c47a3f
	.xword	0x9736e6c7a441d1e5
	.xword	0x43c51da0082e5508
	.xword	0xa83466e4627ec24a
	.xword	0x9e7bb3511b5f9a95
	.xword	0x23b433c936387fab
	.xword	0x623333a167971516



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
	.xword	0x63934ccf912de42a
	.xword	0x0f87f2379ba3307a
	.xword	0x90d7657de68baad7
	.xword	0x16d70c840616b003
	.xword	0xe0014929fd1026ae
	.xword	0xd6df52cc40ff3b2e
	.xword	0xa199a0c863b62f7a
	.xword	0xe3c1bc7eaca0ea63
	.xword	0xc7038c518291b2e4
	.xword	0x27147c01c0c2af01
	.xword	0x8bb75535909a9a8b
	.xword	0x6ab8825de8c7c43a
	.xword	0x0fa56d06ada1f5a2
	.xword	0x95c39961b9ea1231
	.xword	0x676dcd2052f2d16e
	.xword	0x32815f1f1e7c10a0
	.xword	0xa68b86794870d153
	.xword	0x15d0e47b38065701
	.xword	0x0d391fdde9b4465c
	.xword	0x8a5a23f1fe6c88c2
	.xword	0xf0d28df89837dcbf
	.xword	0x82297796b43c3e05
	.xword	0xc98e03f475174120
	.xword	0x082168e338a93696
	.xword	0x02ca8d4edeb2d03a
	.xword	0x628f40d6a1d0bc80
	.xword	0x6ef66581f9ecc763
	.xword	0xd816a6aeb2ce9784
	.xword	0xa3ed3cc01659be48
	.xword	0xbaad62d78ff67077
	.xword	0x0d58aec707eaea50
	.xword	0x05cda27cddad6978
	.xword	0x017a2786c21b704c
	.xword	0x895630095e7787c2
	.xword	0x6ef9fe50332feab9
	.xword	0x27523cf76d187d26
	.xword	0xd97e31d000f81dd5
	.xword	0x3d2ef2c86c0ad290
	.xword	0xa922fa02a52be7f5
	.xword	0xc3dc26cb016f8ab1
	.xword	0x602c9c818c57456f
	.xword	0x4c336c6cd5169801
	.xword	0xeb8f277d7840d2d5
	.xword	0xbd35197fad81db0c
	.xword	0x432865847032a9a1
	.xword	0xd5e37ffa066dcb0d
	.xword	0x4c2aebeb52ea41d1
	.xword	0xe418facc517e37de
	.xword	0x6133e4d5b6e8c8ff
	.xword	0x9ea77ef8bacfa327
	.xword	0xe18de70d66a38785
	.xword	0xe4f8fba991a564f1
	.xword	0x23c53f76ff675a89
	.xword	0x2c28430a28b84437
	.xword	0xc3d394e7b8cd2004
	.xword	0x01d8b9546e6d797a
	.xword	0x5a97a6d616ce24f8
	.xword	0x798ab26e24963f08
	.xword	0x78474b8faf50fc7c
	.xword	0x798375129f15b003
	.xword	0x6a7337f8f8df5662
	.xword	0x370ad2de4826298c
	.xword	0xf5d2af88ff06fb9b
	.xword	0x599ec6102b867454
	.xword	0x9540ec2847247dc2
	.xword	0x7a8780cfdd909cc9
	.xword	0xb759448bd7762a8e
	.xword	0x36dd67d1b9a39326
	.xword	0x66f55bffbc01efd9
	.xword	0xc9cf4bd293db58cd
	.xword	0x3e429df9f727a4e8
	.xword	0x4f82ca4b565eca2f
	.xword	0xe885199493d7103a
	.xword	0xb4d541e2cf5eed6e
	.xword	0x03e21a5d220c8a93
	.xword	0x5733d37993440495
	.xword	0x1a75c336cc5bcae3
	.xword	0xcc6ccdf69d0c400e
	.xword	0xe2a8f3b45f7d5482
	.xword	0xc52c7d971f55e81e
	.xword	0x55f93476fada74df
	.xword	0xbb2d17bae7a2dc99
	.xword	0x7c910c8ed06520d4
	.xword	0xdd795df583ffd749
	.xword	0xd57802278e5e8c24
	.xword	0xe80d33e77e9f7d8b
	.xword	0x1beedd74d58591a5
	.xword	0x0bb0bffa43236367
	.xword	0x8926d0036a09b5b6
	.xword	0xdaf9ca24801d7705
	.xword	0x0665a8049b0edd35
	.xword	0xc01e7d2dd05b571d
	.xword	0xd8054c9567777f48
	.xword	0xfaa2ba796cd2d9f0
	.xword	0xab6eae4153ac32a4
	.xword	0x58a707683b5f80c0
	.xword	0x80f5407205430f83
	.xword	0xbbd65933468e2670
	.xword	0x780332356e067717
	.xword	0x26e1301428f7015e
	.xword	0x80c1fd56f6f99401
	.xword	0xcc0bd81e25241a85
	.xword	0x2c158ecedcf8a9cf
	.xword	0xc5115071776f2920
	.xword	0x159e947035a95109
	.xword	0xdfab6f0c36c56127
	.xword	0x565cddc21f93c1ba
	.xword	0x280c27ce70c1d6d1
	.xword	0xe61e0200632a01da
	.xword	0x95a5243c0bc9b8c7
	.xword	0x5e393f61f4c1769e
	.xword	0x2c84e8d8270f0dd7
	.xword	0xbee90f26517ef080
	.xword	0x7fca7302542ed8f6
	.xword	0xdc995c2b42dadd1d
	.xword	0x1258a6f9e3275260
	.xword	0xc2be33d45ad1aa7c
	.xword	0xb2b128e07d9dcb76
	.xword	0x38e362aa98b1900b
	.xword	0x03f3cdeaf0f3d93d
	.xword	0xf739dc28a98f9159
	.xword	0x73a1fbf5b3741b6f
	.xword	0xcc57680337b3c637
	.xword	0xf94d5e12cc4f8c56
	.xword	0x874a189bc312dc5c
	.xword	0x7a4f678bd0cf5fbb
	.xword	0x4889d93cb2f13d37
	.xword	0x3f9b0ca3095c7b3e
	.xword	0x49da5687ab50579f
	.xword	0xccca05daa1eca986
	.xword	0x3470f84505e1cfae
	.xword	0xc5c6c4cf4979d0a3
	.xword	0x847caa5140fcc272
	.xword	0x08b71170a9f36a29
	.xword	0x1b1ab3be28076987
	.xword	0x92ab7f0b0f1d832c
	.xword	0xf8f8556847950880
	.xword	0x76d77b55643fef39
	.xword	0x4d32cbdc1e8a4ab1
	.xword	0x1c1a6f81791d0686
	.xword	0x3c467d652c13e107
	.xword	0xeecd147214420f8f
	.xword	0xe9ff889e288bd474
	.xword	0x127747f9b3f88ca8
	.xword	0x608d0d28e35c52bb
	.xword	0x062f4dd27d551530
	.xword	0xc1823635e502bb3b
	.xword	0xef3695cd26b5ca6a
	.xword	0xfe5277dfc789c52a
	.xword	0x484f239bfe2aeab3
	.xword	0x3b43e47f83aa3883
	.xword	0x625b05618e41b42d
	.xword	0xb1ac28fdc81d6d6c
	.xword	0x6a63c8a4677cd3f1
	.xword	0xc78a6e4ce47fde1b
	.xword	0x7e761b2f7f9a0cee
	.xword	0x1ef07a1965b2611c
	.xword	0x3ba9c5ec8ce9c697
	.xword	0xf7135722c1a7ba11
	.xword	0xa2aeecf527687216
	.xword	0x5f681e24d3bc2b82
	.xword	0xb8c1cbb4c4bf92fe
	.xword	0xb6e47e4ca2eee0e2
	.xword	0xdb688ac76b722a98
	.xword	0x1ac460bfea47891a
	.xword	0xc9c626d33126aa86
	.xword	0x004bd41d09d93fbf
	.xword	0x4695deaca3cebdbb
	.xword	0x55c542fa7be0c055
	.xword	0x44df9426175faa5c
	.xword	0x45d807314f8a2f0d
	.xword	0x7bb748d5def32deb
	.xword	0x34dff52c66124a0b
	.xword	0x38d817ffdd5146d4
	.xword	0x60458c3b54f81647
	.xword	0xba47904b2d03ae28
	.xword	0x37bde612eaefa234
	.xword	0xa2d7e1aa1b1a5e1f
	.xword	0xa0c3f371cf89fba0
	.xword	0x557b47ac8d0109d7
	.xword	0xe607c20180a09819
	.xword	0x32ca78100755c0a0
	.xword	0x8610c9501b333f74
	.xword	0x9222e922625d5f03
	.xword	0x098604a26748aca8
	.xword	0x8dcbc9f9d5b97e03
	.xword	0xfd4b287c4cda0c0c
	.xword	0x5f5a928962bc58ee
	.xword	0xa1c1f7e19526e846
	.xword	0xf6c1a63c29110308
	.xword	0xd7d3b054d483f44d
	.xword	0x81a3a266c7ee7cc6
	.xword	0xf1f3596a657f63f8
	.xword	0xdb2f9ca2bb3fdfdb
	.xword	0xa47d0552c1dcde16
	.xword	0xe485d8a541489c82
	.xword	0xe776dd7cee868e98
	.xword	0xc9257239b145c1de
	.xword	0xd5f8b4997b863e28
	.xword	0xd1493404945c5f09
	.xword	0x379b9cd2bdfafdd3
	.xword	0x613df1b3efb41777
	.xword	0xf9d131ca4cb43c31
	.xword	0xfb6bbec409ff8908
	.xword	0x88a993e7e27eb7c4
	.xword	0xdbdb589cad8c631c
	.xword	0x0f6cd9a2b15662aa
	.xword	0x044592a8b4483b01
	.xword	0x41d6eae50a0b27dc
	.xword	0x5c08ecdafd7472de
	.xword	0xa1ea3da31a7a652b
	.xword	0xffac9f1449af84b5
	.xword	0x55029bff9cbb0b34
	.xword	0x45d8f252d0b04543
	.xword	0x0e6d42fa2701b776
	.xword	0xe322c4e55ef0592c
	.xword	0x7c558eef1656f4ef
	.xword	0xf2a4521c16bb28af
	.xword	0x1ce9bb8a70e9d830
	.xword	0x31df01d69dc0b74a
	.xword	0x93e09edfec5d47ae
	.xword	0xc0889e6f90fdf0d8
	.xword	0x5cd0e27138fa48c4
	.xword	0x4c6ca8a654f62a02
	.xword	0xa6a591affd1bd90c
	.xword	0x7f9f8524f8245fc7
	.xword	0x6d3b5ca360670537
	.xword	0x966f31fa33c10dae
	.xword	0xec5509785fe7626c
	.xword	0x6bbc7c35237f6414
	.xword	0x05d6f2582c6026f9
	.xword	0x84d99ec606e15ba2
	.xword	0x1d6da26ad362aeda
	.xword	0x6ed365783ddd90bb
	.xword	0x8b8fca1991e73d31
	.xword	0xd95ea1acc0ee41ee
	.xword	0x44b2eda384f26409
	.xword	0xd7aba83bdf391f29
	.xword	0x773dfb5563c9a00a
	.xword	0x2bddc13ff615aaee
	.xword	0x636e6cfdd7ed3de1
	.xword	0x6c0a120e0747c330
	.xword	0x7cfda473ba3a7b4d
	.xword	0xb73bbbe26168f83d
	.xword	0x5aa76975868bf719
	.xword	0x0cb44417e1478f55
	.xword	0xc7ca2d25644f55ad
	.xword	0x1b86f6e7212744ef
	.xword	0xa3d4f2559191b16d
	.xword	0xcdee72914c7376c0
	.xword	0xf6726d1b2491dad0
	.xword	0x14af23506b932f43
	.xword	0xd79d02be20289eb5
	.xword	0x489672d14eef89f5
	.xword	0xe94f49c67963b514
	.xword	0x4da6ba709732eeb7



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
	.xword	0x8809aa134cacbe47
	.xword	0xa230c3e028ae286f
	.xword	0xaa2bb891021aa31e
	.xword	0x622d1b30f4516259
	.xword	0x5a942cc788664b47
	.xword	0xbc3598c3bfd27962
	.xword	0x2a27696abd9c3167
	.xword	0x053ca42d7bbc9f27
	.xword	0x776a26c60f9ef75c
	.xword	0xaef8ee1214fdc4b7
	.xword	0x24b43e3609e20326
	.xword	0x6f52485e02571794
	.xword	0x10633a9cc00b1610
	.xword	0x0ee2365a179b479a
	.xword	0x570aec106a153af7
	.xword	0x86de0c2c8f69b61c
	.xword	0x44666b0f146956d4
	.xword	0x37fcf59571a2aa07
	.xword	0x1ee26d3aeb0e57a4
	.xword	0x7ff1bef914398f2b
	.xword	0x3198a5480544093d
	.xword	0xb1ac3800ffc8a034
	.xword	0x356b6fbc05d36253
	.xword	0xf57e9aa5ff3023ef
	.xword	0x6749bce08be1fef2
	.xword	0x87c3b964c1c8b59f
	.xword	0xe077233b27921e9b
	.xword	0x1ce37f55f91761c2
	.xword	0xf260406ce302f992
	.xword	0xc5a40eabfef757ee
	.xword	0xf92e78b8bf4ea63e
	.xword	0x39b432fc015f3ad0
	.xword	0xeb5f352bc01783b9
	.xword	0x1b7813c23c17acba
	.xword	0x278f2e888fbd6a04
	.xword	0x21cf19b092d3f48b
	.xword	0x057d9d95912cb7d4
	.xword	0xb1db9045ce2daecc
	.xword	0x00aa2f5551a4ed75
	.xword	0x268a0296ce3f2e6b
	.xword	0x42bc0fc82b7d54c0
	.xword	0x6b786fad7c338358
	.xword	0xf21b63ef880f68f6
	.xword	0xd23aa5cd8d5dd1ce
	.xword	0x22e8c9f531b9a8d9
	.xword	0xa868c2c20c643789
	.xword	0x620bcfb93c59fb7d
	.xword	0x8fe68b82aeec5117
	.xword	0xdf9ed9f2dd1a3148
	.xword	0xa6e497f7ef56e425
	.xword	0x5d9d6421a0c9e196
	.xword	0x206e3e9b42af5375
	.xword	0x6d9edbc8b7f29903
	.xword	0x0400679c14a63ad3
	.xword	0xbf7f5de8ba4245cb
	.xword	0x3287208e40a0766c
	.xword	0xf4fee4e4eabf40ee
	.xword	0xe6bd28a5c246e42d
	.xword	0xc5defc2d5a96ac43
	.xword	0xacbd3ac5d19eb0e3
	.xword	0x20940e137dc2a5dc
	.xword	0x257a0b28d6e0a9e9
	.xword	0x066a7daad8fc9d5a
	.xword	0x69682bb7e19fb00d
	.xword	0xb0928e32766fa10d
	.xword	0xa8160774db12df9d
	.xword	0xf1c95ff64e8e74ca
	.xword	0xcea4aa44f809b033
	.xword	0xbaec6c1c4fffb1ef
	.xword	0xc047236a3a8ae30e
	.xword	0x2d547dad8c7302e9
	.xword	0x325d5ca48a84d00e
	.xword	0x76946fa31b6c5df1
	.xword	0xa5f963c019ead387
	.xword	0xd228bee36ad0dbdc
	.xword	0xfd1a710c756a2724
	.xword	0xb507fa5c039af4a8
	.xword	0x0fe05a75442f7074
	.xword	0xdb197937704b377e
	.xword	0xcaa12ec6bc42ec50
	.xword	0x8edc7c69608621b7
	.xword	0x27e212b026d4d5b5
	.xword	0xabdbcbf4062df018
	.xword	0x2ec67a341f85faba
	.xword	0x1151cb8dc07cbca0
	.xword	0x711ca77b35ce8d79
	.xword	0xc99f658ef4b74c44
	.xword	0x21ac74203f502d36
	.xword	0x68d00b41e855bd61
	.xword	0x55a63a8784f73196
	.xword	0xb8cf3b8ebebef5b0
	.xword	0x4c6144c7d480b02d
	.xword	0xfc544bbf837104be
	.xword	0xe5fe96a69d16a388
	.xword	0x33cd7888dafd7dc8
	.xword	0xe331690c41928f4b
	.xword	0xa8de164b830a44fc
	.xword	0xdf3e513b4368dbc4
	.xword	0xadee8a9ae3f1285e
	.xword	0x1098db04016ab0aa
	.xword	0xf83282e8ddb87c1a
	.xword	0xb767893f01c815cd
	.xword	0x69f3c26c4ade591f
	.xword	0xc4388ea0e2b3d8c1
	.xword	0xdb12677789502f40
	.xword	0xf78340f4a34c3620
	.xword	0x3b262aa62b09de00
	.xword	0x4b3157a362dd4f06
	.xword	0x6fecfbe8d0111ad6
	.xword	0x2eacf9aecf668a79
	.xword	0x8771e7e94f521c00
	.xword	0xcf3fc8cbd32dc5f4
	.xword	0x97e16df13330431c
	.xword	0x04af0858c05737a1
	.xword	0x15a8097c928284bb
	.xword	0x4ddc78a56953f4b5
	.xword	0xb321550882788876
	.xword	0x5235dadf937969e9
	.xword	0xb7907e32489baf4c
	.xword	0xc0104dfde5856249
	.xword	0x68b8b5e79df7c47b
	.xword	0xcdaaf8a69ea02613
	.xword	0xa22821537bab744f
	.xword	0x6b89167c3b4f83b4
	.xword	0x3b4abfcc9ec308aa
	.xword	0x34cdb5527936800b
	.xword	0xa2f9600f606afa75
	.xword	0x0242180333f8d86f
	.xword	0xf5b47e0866d32151
	.xword	0x4c67294d69f38e29
	.xword	0x57efba2fc080e357
	.xword	0xfac98abf3091e08a
	.xword	0x04cb0928dc8dc5c2
	.xword	0x1153f3ff80f7ecb3
	.xword	0xd4cc09cfeb2b492d
	.xword	0x7701c124ef21d86f
	.xword	0xc063ee79ab29d60e
	.xword	0x9e01b3e8433850d5
	.xword	0x8b8ca7d61fb4dd1d
	.xword	0x6ca5d6cbc6436825
	.xword	0x3398e6653b4eba78
	.xword	0x971979c476bf8051
	.xword	0x325a0e73b037346b
	.xword	0x0731fc451dd7369b
	.xword	0xbbfd195d83923ffa
	.xword	0x9c1d73095a20959c
	.xword	0xbbed6b862b7fa1c3
	.xword	0x5f0229993fd6f772
	.xword	0x58862b40af480574
	.xword	0xa2f4b0d65732776a
	.xword	0xf1a80221da91a403
	.xword	0xfbe0cb915e4cfe5f
	.xword	0xeb465c2b83934c39
	.xword	0x4c5d9d568ed4907b
	.xword	0x797951a3808bc834
	.xword	0xb51132b2227bd977
	.xword	0xdda3ae3cc693662d
	.xword	0xf630cb869ee90821
	.xword	0x581573d08aaf1008
	.xword	0x0d002345189068bb
	.xword	0x0ac9f6eb53130205
	.xword	0x21faa78169564afc
	.xword	0xf991f031a5f4ce29
	.xword	0x422481e72a9bfb83
	.xword	0x5d22db27db6cb88a
	.xword	0xd31fe2327f9bb8f3
	.xword	0x81929dd05d81a8b4
	.xword	0x6a942342908728bf
	.xword	0x4dcb17865f584270
	.xword	0xe42d1cae2da9503d
	.xword	0x7ad333a6f684e79d
	.xword	0xda9253a8c5cae03e
	.xword	0x9f7b7b13875ad40f
	.xword	0xc1d1f4a9e71eb6be
	.xword	0x84a0773dd9b11e5b
	.xword	0xc77dc8aa61c66b66
	.xword	0x1ad615f49d42f0f5
	.xword	0xc51871318319f1b0
	.xword	0x50bea6938c428a89
	.xword	0xa78fb1ca53752cf8
	.xword	0x745dea1512aae39c
	.xword	0xedf54821133d74c3
	.xword	0x6b85c987674e130e
	.xword	0x4f69ad01ec0dc71a
	.xword	0x4ce612cbda75f29f
	.xword	0x62f17f6abdb09131
	.xword	0xe54982638bbace9f
	.xword	0xa006205eb860b4d7
	.xword	0x4f098c2422b0aab5
	.xword	0xd0e307145055c6f3
	.xword	0x0b213f379fed369c
	.xword	0x6154443f011dca62
	.xword	0xbd6fe1e97d68cacd
	.xword	0x554577b55dff987f
	.xword	0x19697c9107f7bdb1
	.xword	0x36e5ca6acab36191
	.xword	0x060e7f66d30c60dc
	.xword	0xda205b8471142cc5
	.xword	0x862533a749976699
	.xword	0xb12289d8e3fc79d1
	.xword	0x4521121e48f6911b
	.xword	0x569732846daa8efc
	.xword	0x707003991877dc12
	.xword	0x70e59d1b63917fca
	.xword	0x3fadbe57f5f321dd
	.xword	0x218b88ebe9bfc927
	.xword	0xd1f84232683e596f
	.xword	0xcd24a2f8957a8f12
	.xword	0x528902a637581df4
	.xword	0xb2c839e3959dc2e2
	.xword	0xe65bec5e78151c0a
	.xword	0x796bf67d2c5f22b2
	.xword	0xcff7df3a0f6a3c17
	.xword	0x9500ac5598cea69f
	.xword	0xa504d2d0827196c2
	.xword	0xbba1d1b9bf1325a9
	.xword	0x5be4084fe00acb79
	.xword	0x687690d92b44d750
	.xword	0xf7c74f06618e44fb
	.xword	0xa453e542458e5442
	.xword	0x5180e3455e49ab6c
	.xword	0x1b721f8707233d7b
	.xword	0xf497e8e9d80747d9
	.xword	0x8ba1173cbd05dc41
	.xword	0xe1b9bfdc94d49282
	.xword	0x4813b7be2a565341
	.xword	0x9bc3cb478f9c6aa1
	.xword	0x495ca32793ff787c
	.xword	0xc7df566c1e437ffa
	.xword	0x4fbad71fcd36dffb
	.xword	0xb7b0f9c67e75f0af
	.xword	0xda3d38a91cedef2d
	.xword	0x784ffd9c12f6be9f
	.xword	0x2f50b500c4569819
	.xword	0x8e7b7dfc85ea890a
	.xword	0x8d9342f2518a0744
	.xword	0x80607af383d47778
	.xword	0x14f6ccaacbd908c1
	.xword	0xb9d8d3e7fd8810ef
	.xword	0x3e72cc4c22718ca3
	.xword	0xebbd31be53035f6e
	.xword	0xdab706bd8082fa97
	.xword	0xa5cac1ee7d675009
	.xword	0xc8d1065940575b88
	.xword	0x0d6899aa1fb87279
	.xword	0x0045bd32b2830b07
	.xword	0x73860d8e46aab70d
	.xword	0xd8a5cfefe786f862
	.xword	0x81cbedf98541c1fd
	.xword	0xfd6d7e2cc854c7cc
	.xword	0xee98b425214749f2
	.xword	0x6fcde5bd5601f699
	.xword	0x84795de5a8a2d9d7
	.xword	0x62157b9b17b5567b
	.xword	0xd8026d9f529893f4
	.xword	0x3949d843e1bd72e4



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
	.xword	0x11428db5653d7265
	.xword	0xe232b6d71f04daf0
	.xword	0xeb98f14381216d44
	.xword	0x60fa06c9ce4343c0
	.xword	0xb4151d990cef076b
	.xword	0x26d5e29a8e012772
	.xword	0xd0485f33d6412381
	.xword	0xb415ba9801c19040
	.xword	0xf928767046b9b4ea
	.xword	0xe78fdea45c17ffbc
	.xword	0xb4b2538fad955541
	.xword	0x598d83a16fdbe87f
	.xword	0x2371d36d6baf25b5
	.xword	0xea45e9fb20a8dac5
	.xword	0xae31b276a4bb8663
	.xword	0x33043dae024105ce
	.xword	0x0cd839f4c6692cc7
	.xword	0x652b53dc5de92002
	.xword	0xf9d516a2f63684fe
	.xword	0x1169644fe264fd51
	.xword	0x7b0b0d8d4e5dbcf5
	.xword	0xb266f6fd9a64a4cc
	.xword	0x070439e5108eaa77
	.xword	0x0e70e38734133a45
	.xword	0xc6848c14df229d4e
	.xword	0xa153a6a90d31c102
	.xword	0xb179a8470e8822c7
	.xword	0xbaf06ba7c7988553
	.xword	0x2d3c02b6fb9f6f23
	.xword	0x078e6382e2024f43
	.xword	0x6c24777964e8a233
	.xword	0xa6549436fdbf1537
	.xword	0xad03c244a01c74e7
	.xword	0xac37ece9ba30ad24
	.xword	0x268a8bf836073ca8
	.xword	0xf0a06cc7b9a9be14
	.xword	0x69c9691195dc10e0
	.xword	0x3ecbe005a996ae22
	.xword	0x8c962d664f53ddad
	.xword	0x9577c5fe97c08ce8
	.xword	0x03308f88a758b600
	.xword	0x0b326443b2e7ab2e
	.xword	0x40e9ea10eeb9a370
	.xword	0x3cf1c8a7f5ff38fe
	.xword	0x3e76907646617d67
	.xword	0x7af5a02e1b6e2886
	.xword	0xaeb108ea0beb2f83
	.xword	0x323f77b5a31e6cc8
	.xword	0x8d3844f020b4b392
	.xword	0xe7c6d0ad731c8305
	.xword	0xdf22b6207a08427c
	.xword	0x0af7872223d489c7
	.xword	0x04c1014968edfb0c
	.xword	0x1a79c05b7da2f6dd
	.xword	0xa6c22442837e7284
	.xword	0x12db4c044afc66ff
	.xword	0xc1dc85696319f36f
	.xword	0xc327b73a9a820d01
	.xword	0x5fb89047f0c45a03
	.xword	0x5c0c05a2385894af
	.xword	0xf05751317b2dc643
	.xword	0x582d5972a8a7cdb5
	.xword	0x32ea8ba7ccc3062d
	.xword	0x7bcc6bca4e81e50d
	.xword	0xd99f843f47a136c5
	.xword	0x17a76160a1575de2
	.xword	0x5a0117df48180eb0
	.xword	0x9988202a3225e3b3
	.xword	0x5c54596f2e27dff6
	.xword	0xbdf92c0c5a7a273b
	.xword	0x77f183928c6245f0
	.xword	0xe5630af9a5998a98
	.xword	0xf59144f61fad1e8c
	.xword	0x25b7beeac1009051
	.xword	0x3feba51029cd5609
	.xword	0xfcbebd8876d8c7b0
	.xword	0x4361968b2cf946ce
	.xword	0x607a8cf147cb1e60
	.xword	0xb77d62ff9398bbea
	.xword	0x345b2dcde8689467
	.xword	0x3d1f2b1ba6c2deb5
	.xword	0xe6efeebb04519e38
	.xword	0xa0a1842c1be2166e
	.xword	0x1510d27219d4b558
	.xword	0x1245f348d446f6fd
	.xword	0xc029c0847f62a8c0
	.xword	0x59ec83236d12d066
	.xword	0xf51de3cc3689e1de
	.xword	0x0b6a65f1ed4be9e2
	.xword	0xe825fe33bbab99a3
	.xword	0x84e9a09bca3148ca
	.xword	0xc69ffe88aa8a06ff
	.xword	0x92262860b9cd3f4e
	.xword	0x8e6211c7804641c5
	.xword	0x48fb0c76cfbbbf10
	.xword	0x710dfeda4acaed06
	.xword	0xac651f44baea16d8
	.xword	0xc632a72cfb4c5831
	.xword	0x1b342deb2a1b0dce
	.xword	0x1b5554a77c923872
	.xword	0xb6544180a314c265
	.xword	0x5e442ea403143161
	.xword	0xbffab04aadac8ec3
	.xword	0x7b2c847bf7af6faa
	.xword	0x222e3b40e4d05142
	.xword	0x3b9708b08687674c
	.xword	0xa92b27bcfe4b17fd
	.xword	0xf470c5c887463345
	.xword	0xe695e6b7c325112c
	.xword	0x7e79a5a49c8132b6
	.xword	0x2a660500bebf5d25
	.xword	0x4eb6197efcb11045
	.xword	0x66ed5fa66c2884ab
	.xword	0x9c615ec74ca93c20
	.xword	0xd810b19070446104
	.xword	0x87495a8c4856583f
	.xword	0xf41fbbdc95ff2591
	.xword	0x6391e80cc0140835
	.xword	0x6e1bfeef09736800
	.xword	0x46017041e5bd7658
	.xword	0x004e812fe22604c0
	.xword	0x079c7e98ad6e28ce
	.xword	0xd5eac0a17578bf79
	.xword	0x66d003d5b1ffde59
	.xword	0xfaef9e5780bd2536
	.xword	0xb612bb23c1d1c47d
	.xword	0x7ee0854b29cbcd8e
	.xword	0x7f1fca8a3c3c4139
	.xword	0x7135d2f028aeaacf
	.xword	0xe338fa816ed2c7d4
	.xword	0x8d002fe38e3eabd7
	.xword	0x4ed14711cb57f0be
	.xword	0xd051dccdcd99ea23
	.xword	0xe9651aa30f2fce0a
	.xword	0x7439f3638f581067
	.xword	0x239132b608834a5c
	.xword	0x4885366b8b7fb3b5
	.xword	0xf96835a2fb0f6e86
	.xword	0x9cc08e5af7a54778
	.xword	0x5131200ae3ed4d4e
	.xword	0xfd47e88a0e3d86e7
	.xword	0x206fb79a7378a037
	.xword	0xa457db01fd549f15
	.xword	0xd4370c467b88bf61
	.xword	0x1a0f7199a1cab70a
	.xword	0x789aa970c6c399ac
	.xword	0x9990303e3f3023f9
	.xword	0xb37658fdf71fc099
	.xword	0x7ed097cc64e9b631
	.xword	0xe0b5cce9830800b9
	.xword	0x6246af737e9aff09
	.xword	0x5177f4246ad44f7d
	.xword	0x0d68af866aab54ec
	.xword	0xd512db8f9e80d5d1
	.xword	0x04f14f782bb43fd3
	.xword	0xd63b734d5daeef2c
	.xword	0x68df77b5583bc4a3
	.xword	0xa6fc297e59540b91
	.xword	0xa2f452dd561eb26e
	.xword	0xe030eedd84e7804c
	.xword	0x67b0f9f0be5846ed
	.xword	0xb7f20d0d077fe496
	.xword	0x960817dc03cc2da5
	.xword	0x61b28a37fd9e3877
	.xword	0x34d9adb6c49f1c81
	.xword	0x7c43001deef9cfa5
	.xword	0x614ce7ca1162dfa9
	.xword	0xb59b3e6b22c162a4
	.xword	0x0a8921cef845b9fe
	.xword	0x560587a554019a21
	.xword	0xe739258bd98e8c43
	.xword	0xb5f4cd7d9c67733c
	.xword	0xd0b69f3d9a4f0860
	.xword	0x7854902cb6f069f3
	.xword	0x564f871c2e6c945f
	.xword	0x6445c27fecc94775
	.xword	0xbcf9e963a62b0248
	.xword	0x2008504877c18c92
	.xword	0x8bd8be7f39d43e16
	.xword	0xd3ce85383f2592a8
	.xword	0xe953ceb34ead0e3a
	.xword	0xb4bbb631ff847fd5
	.xword	0x0315c5e2d12a8896
	.xword	0x750b00a15c1e6894
	.xword	0x7ea8972c5b72e20f
	.xword	0xbc58de9826a8a0b1
	.xword	0x9c108dd3890b8fba
	.xword	0x9e8f1a67f010d300
	.xword	0x7f142add47b25fcf
	.xword	0x42a80f854cdfe819
	.xword	0x79d98edd6249aead
	.xword	0x2ba799cac11ceb15
	.xword	0x7506c00ee55d92e5
	.xword	0x08ca48def861a172
	.xword	0xe7ab75adceb0a01b
	.xword	0xc2e94a4f871f89d1
	.xword	0x427a6635fb1655b6
	.xword	0xd4cab6d7ebb30855
	.xword	0x0269d58f657d4253
	.xword	0x67af636a868b7256
	.xword	0x3d900d17f9a220e7
	.xword	0xeab1fb9ab09b567c
	.xword	0xf8305c322d786564
	.xword	0x70b2964cacfa4b34
	.xword	0x572137b13e525459
	.xword	0xd65e14b882e08a47
	.xword	0x96c0557bdf0e1bf2
	.xword	0xe5e00aa9a7e9655e
	.xword	0x0ba4815340fe2349
	.xword	0x8e536d380473d0a1
	.xword	0x651bcccaeb1ab0d4
	.xword	0x74ea9483b035e7f8
	.xword	0xee986ab2c2983418
	.xword	0xe93453cc306ab555
	.xword	0x45c5bf3e99b2593e
	.xword	0x5ba7198ff2772091
	.xword	0xb709d385d5277176
	.xword	0x9881e82d245048ef
	.xword	0xec738f8ef84c0c72
	.xword	0x741d5d14e7a79a30
	.xword	0xf7f22ce64dcbed46
	.xword	0x2f721cb6483c467c
	.xword	0x6b91b51280e2a063
	.xword	0x5cd496580a71a9d8
	.xword	0xbc1353bf61ae6682
	.xword	0x5f6e877e2d36de68
	.xword	0xf29c3ab30cde8e39
	.xword	0x38a6afdf1672d357
	.xword	0x7280b7ea1613df4b
	.xword	0x52eb8191912f71e7
	.xword	0xc27a999a3a502d53
	.xword	0x9280f06134ca99ab
	.xword	0xf270ec0cf9de4da3
	.xword	0xb5a63ec6040819d8
	.xword	0xbacc5c29196a66bb
	.xword	0x3086d10b6c221deb
	.xword	0xbea6fc6204345da4
	.xword	0x3448e10b754b2dd0
	.xword	0x5e388f37e4c64beb
	.xword	0x72b105e22d0c8c17
	.xword	0xd98643c11323e037
	.xword	0x2aff4f924e8715d7
	.xword	0xd3876389037114da
	.xword	0x060c86cadc140607
	.xword	0x1a4d120ef3759a39
	.xword	0x28e37050618cbb41
	.xword	0xd4fccd2e485ae5b2
	.xword	0x88f16a88abd5cf3a
	.xword	0xff226bd8bb7e3650
	.xword	0x64dc173b1345b0c0
	.xword	0x9b7a1c5b5f48b85d
	.xword	0x0cd57af53c7210e5
	.xword	0x30173f4f981f5296
	.xword	0x577c3393050d622e
	.xword	0x7d70af6bf590f67a
	.xword	0xf50d20b2eabb78af



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
	.xword	0x37e0a670d6951532
	.xword	0x9758f096301cd977
	.xword	0x774d2a51fb96a1a2
	.xword	0x85ef2dad0763aeef
	.xword	0x48495fc5cedb772b
	.xword	0x3c46934e94ed9f60
	.xword	0x30a0eab0dcb03ac7
	.xword	0xe846a2493b667b04
	.xword	0x49ae655f592a9146
	.xword	0xaaf6cdce25d0624c
	.xword	0x6b48499cd8c1c103
	.xword	0xae7e3940ebd06ecc
	.xword	0xeb3786dcc59337e5
	.xword	0x3ae38c88e70697ce
	.xword	0x168192cf236cf889
	.xword	0xb2d5b2a49d1d47a0
	.xword	0xbe97a17c5aa943f5
	.xword	0xadd3d008583512c4
	.xword	0xa85c68881bf63ef2
	.xword	0xfc7f9c7fdef8fb4a
	.xword	0x12329716c5c06e2e
	.xword	0x6a3a0fa8739e18d6
	.xword	0x15b4f0ce004bbf79
	.xword	0x7b6eea17e51ec4b2
	.xword	0x5b5541799a71fde0
	.xword	0x3f2eb7529996dd2a
	.xword	0xa6e8eebbc530df43
	.xword	0xe67101bb91a45c80
	.xword	0x84ec35dea28bd319
	.xword	0x3e5c697a664458f6
	.xword	0xad92df6e1aae8cea
	.xword	0x8d6c7151f050ef59
	.xword	0xe74ae4cb87ab1d9a
	.xword	0x46de417460b795c7
	.xword	0x4b2479bd6b113bf7
	.xword	0x8168e1b941a1c049
	.xword	0xd9c14ff97130d3f9
	.xword	0xd9d903ec4dcc5f33
	.xword	0x5136c6345853e1c0
	.xword	0x70d495e717926677
	.xword	0xa62831664d9562ab
	.xword	0x03629f0b501f5320
	.xword	0x290f4e9d860d00bb
	.xword	0x3ae74af37858b79c
	.xword	0xa2030b6245c02668
	.xword	0x71a579e44824c7f1
	.xword	0x7e23a12576ae92c3
	.xword	0xbbe157c5a8299d2e
	.xword	0xa66f23d192327649
	.xword	0x16c2ec41e9688c27
	.xword	0xea630f49c265237f
	.xword	0xb556560f1bfc1b07
	.xword	0xd1555c55b5272a03
	.xword	0xbe9ea2b5b1a2c7c0
	.xword	0x5e58820a94f18599
	.xword	0xf955b0f141c9b55e
	.xword	0xa1f27e7e7273b1fc
	.xword	0xe33924ac787d614e
	.xword	0x845188bf6e957046
	.xword	0xadbc6fa2a28e52ac
	.xword	0xe573ef55b86a28fe
	.xword	0x56e36d46bef49f0d
	.xword	0xe3dfe1bc1132c0d5
	.xword	0x19e63b6c933e3bfe
	.xword	0x7ab28ceb287b77d2
	.xword	0x63c982812c516bb6
	.xword	0x73521c8da09d11ca
	.xword	0x0996a029474d1ab3
	.xword	0xf905e47d03cd1c05
	.xword	0x9bf33e560912c7a6
	.xword	0xca8f94d4480c0148
	.xword	0xbc3402cbf809007c
	.xword	0xfc6ad8ed4aa37f56
	.xword	0x9044ea5d27044a3e
	.xword	0x2eaedd3e5967ab83
	.xword	0x41926a218b418404
	.xword	0xd8813fd0e0258c12
	.xword	0x4a71d35f6adc1fcc
	.xword	0xe457924a6f5bd888
	.xword	0x2486df84dd1a2f2d
	.xword	0x7a66d78a046be49d
	.xword	0x180ae3424652f120
	.xword	0x29c9d9001b21a446
	.xword	0x053084684ff7c167
	.xword	0x486e4641fd9b9e67
	.xword	0x46f758c2c30914f2
	.xword	0x04b0eaa1d55bd191
	.xword	0x0b39f956ab4f21ca
	.xword	0xd873d40441167908
	.xword	0xaff6571361ac9c77
	.xword	0x4923b886d0d511d2
	.xword	0xac3aacfae96ce386
	.xword	0x3fd57989638d6796
	.xword	0x552a03dfd3d072d7
	.xword	0x97b12f9655480b84
	.xword	0x810494e5cf1e4c61
	.xword	0x03e62713e749ee70
	.xword	0x5ce96c8f843f3a29
	.xword	0xfe7119b7f9f03eb4
	.xword	0xad84529c908baefc
	.xword	0x330765ebca5e1c63
	.xword	0xc8e9d9e50f8ce1ab
	.xword	0xbc475e6fae6c95ed
	.xword	0xca41edced8fce340
	.xword	0x90800f51fab22008
	.xword	0xa0d863b2a86ee716
	.xword	0x46eba7efa8d84c7d
	.xword	0x15353022430fd7d8
	.xword	0x0e816776b92d72d4
	.xword	0x24ee9d57c18e0811
	.xword	0x72edc28c6462a9f8
	.xword	0x46e3468ba5cd2928
	.xword	0x4c4455b4ebe9b378
	.xword	0xdcfdc4571192dfd7
	.xword	0x2a681487f425dbfa
	.xword	0x43afc6d0788ae78e
	.xword	0x1863a1df4bc6a77e
	.xword	0xc20197d86d2ba705
	.xword	0x548b49e8dc03d074
	.xword	0x820ed617677b28dd
	.xword	0x61cc367db7dcb899
	.xword	0xae4b1861eb735eb1
	.xword	0xf2092001aacfd1f9
	.xword	0x7d8725102a47f065
	.xword	0x1523f849400a37f6
	.xword	0x0fe1174c175f9da0
	.xword	0x1d52a8956ef38cdc
	.xword	0xed7a77223baf886e
	.xword	0x390c20101fe2b411
	.xword	0x0462f86765aeada2
	.xword	0x0a65e6a09940972c
	.xword	0xe75e61a866504b7b
	.xword	0xe891ea0e4bc7febc
	.xword	0x17890f406f9cc29b
	.xword	0x4db1402faa3f01ab
	.xword	0x7560855a175b33fd
	.xword	0x078b0ed27576cd0b
	.xword	0x0ceb5f388920cc20
	.xword	0x95c02227846093ef
	.xword	0x7077e339afaf0390
	.xword	0x5440502aa9f63425
	.xword	0xd0679dc02fff74d4
	.xword	0x83d671a08d2b5182
	.xword	0x9167665857552007
	.xword	0xa7a3d343e0bb681d
	.xword	0xf93a152685d994af
	.xword	0x759d39f3a53f156c
	.xword	0x21d9b6cb1582e27d
	.xword	0xd1008aaa3d9cc0d6
	.xword	0xd29dfb83c27ae694
	.xword	0x0328e2394a0dacad
	.xword	0xbd2e48d62b16d87e
	.xword	0x054849eba1b10169
	.xword	0x5eaa257f0218824d
	.xword	0xbe9c46cd34f37bba
	.xword	0xd9fcb8b500960877
	.xword	0xbc0ce72f10a878d3
	.xword	0x7cdc54a93d37c1ae
	.xword	0xb75586a9839f3f49
	.xword	0x4dc58f60c80005f3
	.xword	0x87665198c239e3dc
	.xword	0xb88d26fae9546586
	.xword	0x02b713d1f7f87ac6
	.xword	0xd4d51ea5835348c3
	.xword	0x2f38c80b6f78ad77
	.xword	0x97c163b960fb5430
	.xword	0x1c2d613b36bf6831
	.xword	0xfba0a8ead4750e78
	.xword	0x9519c0ae77b81a96
	.xword	0x2819de904a176c6c
	.xword	0xf28654788bb0fe7f
	.xword	0x6137d339f4e8c1e2
	.xword	0x787a43da0da8a8ed
	.xword	0x0e383fa50395b4dd
	.xword	0x443f96fca484710a
	.xword	0x6489596aac0b5fc8
	.xword	0x0928cb34d753d8e7
	.xword	0xa668c33e569f185e
	.xword	0xef2d0adefb762ede
	.xword	0xad7480e1a0b8496f
	.xword	0x23a5d9b85a0ad296
	.xword	0xbc347f5abf047e5e
	.xword	0x37ccf5e73c02d75e
	.xword	0x5e1107ac07c7c4f3
	.xword	0x792411008ff2f9c1
	.xword	0xe6f4f93ed73da2a6
	.xword	0x6b515b9931d5c01b
	.xword	0xa26087c85ef74142
	.xword	0x7204474526a0ebfd
	.xword	0x327556bde4459290
	.xword	0x2bc7d7045325c613
	.xword	0x3a5025196b6e85e9
	.xword	0x4a850454bd6a0a14
	.xword	0x43552cd6bd8a803c
	.xword	0xd27c8d2a5c945975
	.xword	0x7f1c5d5f04acc80b
	.xword	0xe7272db31ab14d20
	.xword	0xe7d428b04ac148b7
	.xword	0xf6ab473f36a91769
	.xword	0x274e7294b19bc900
	.xword	0x75b44bea55162115
	.xword	0xa6df1c2ef9a2484c
	.xword	0x35984c9e7e88beb9
	.xword	0x28bc541b1823900c
	.xword	0x68c017bb32ac51f8
	.xword	0x4abc8724277daa62
	.xword	0xd746e675afc9ae63
	.xword	0xa2a41e01c2c717f3
	.xword	0x08131c3200d6e65c
	.xword	0xf42971f4baf64c62
	.xword	0x4208caf2e6f4c929
	.xword	0xdbb75625668f4395
	.xword	0x1dfecaab33def0eb
	.xword	0x3602c546a594fc46
	.xword	0xd0927da040a9f350
	.xword	0xc2fba9924af4a260
	.xword	0xf8566b64fa5b797b
	.xword	0x131edb8a5f22927f
	.xword	0xf03d7f6186382a0b
	.xword	0x25996b5d4698032a
	.xword	0x1e568cb4d53504e8
	.xword	0x040918486abfe445
	.xword	0xcc11e2486d2e6883
	.xword	0xf06e479b03fb64b1
	.xword	0x318a9e37914e23bb
	.xword	0xef4923f1f8c2f40b
	.xword	0x9aa4410de75237da
	.xword	0x125c2ef0608582b9
	.xword	0x1592d67b55606fde
	.xword	0x3cb2f85a269883c1
	.xword	0xc2caa20f5a6508b1
	.xword	0x71fb55935d73c909
	.xword	0x29a192f3c4969d79
	.xword	0x9ee281b08daaa49d
	.xword	0xf69d7e4fad824120
	.xword	0xaaab8c3fe07ace8d
	.xword	0x8203c1ba8e0cf55a
	.xword	0x8fbe51b0f23450f8
	.xword	0x38b2e07754c2bcca
	.xword	0x493dbae7b1811f99
	.xword	0xb6e4bf1549c2781b
	.xword	0xe3b56e67f9ed86c5
	.xword	0xdffa814210de21d1
	.xword	0x43573dee39809549
	.xword	0xd3d2e3f62b937c0d
	.xword	0x9b39377a783267c2
	.xword	0xe990ad8c7cbe31b2
	.xword	0xd178c9f3339e66f2
	.xword	0xb8b480b1f25a883c
	.xword	0xbc272c0df4d3f7bc
	.xword	0x694b5ef323bf5276
	.xword	0xb5fe28f2716d03d0
	.xword	0x47b27b0e1a629595
	.xword	0xc6ada693fa5df08f
	.xword	0xc69daa58caab2f10
	.xword	0xeffc426acbea7e51



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
	.xword	0x2739f078a6bbe264
	.xword	0xb4591a51881ece7a
	.xword	0x16bc00d1b169c4bc
	.xword	0x525d87ae20fac3f1
	.xword	0xf52b6ad2aa03123c
	.xword	0x279e55470c368496
	.xword	0x0e7320a2a3b8f5f8
	.xword	0x4e4fa7dfd6c5156b
	.xword	0x16629f6ce50b9579
	.xword	0x45ab13fabd5a5352
	.xword	0xbee7ff569f343f2e
	.xword	0x5678db7ce9fe5ca3
	.xword	0x9b10765459afe339
	.xword	0x69c0c026a3b1bee0
	.xword	0xeef1ac901922c284
	.xword	0xef162cd65ca82167
	.xword	0xac696ef4ccc0a68c
	.xword	0x0bda97f54b6bd5ec
	.xword	0x941a83234fbef5af
	.xword	0xc21f006ce170d642
	.xword	0xff546ed2120d0161
	.xword	0x6db6b8136e75bd6a
	.xword	0xc86fd81c0a76e26b
	.xword	0xffeb498f1fbd7ba5
	.xword	0xf9ceda026f0eba84
	.xword	0xc686aa9a1d32e9ed
	.xword	0x399c7ef30c3c5118
	.xword	0x812c621d41d061bb
	.xword	0x40e38f3dc4278a12
	.xword	0xf81863776f316861
	.xword	0x9473b93003bacdaf
	.xword	0x30b72c76d00996b7
	.xword	0x7aca6bbd25325d6d
	.xword	0xc8c41dfd615139af
	.xword	0x8dd4aea3e42eb16f
	.xword	0x930a1b03d1dde8b3
	.xword	0x832db5ace866ee7c
	.xword	0xbbd310c8bebc7830
	.xword	0x988b8cc495ac05ef
	.xword	0x130fb4218d431838
	.xword	0xf85a7b54ce4213ef
	.xword	0x563a957641e175d7
	.xword	0x4c53855a7613d5ae
	.xword	0x0cd9e1cbf3446a7f
	.xword	0xba28ca3b97a35d3f
	.xword	0x834201bf9e07cbed
	.xword	0xf552ac8e7c128eef
	.xword	0x708514b1f00ea95f
	.xword	0xa95dfb37ea3244d7
	.xword	0xb72a6a6c8291381d
	.xword	0x0b68ed37147fce89
	.xword	0xc44e9c54e57bdba1
	.xword	0x25c02aa71f9da42f
	.xword	0xaab75477bce30919
	.xword	0xaacfeb2090cef18f
	.xword	0x18d216063a8ce8c9
	.xword	0x61677d5197e42c9d
	.xword	0x6f3f63e5ec09880d
	.xword	0xb13ea7abed29ed04
	.xword	0xe3101d5b0a5b570c
	.xword	0xa548cf97c08ba90e
	.xword	0x83fbffc43081f674
	.xword	0xac92774e1e745a9e
	.xword	0x60ca0c4827139162
	.xword	0xa926739f724b879a
	.xword	0xb919f56d3d700462
	.xword	0x60125bca3e8b1411
	.xword	0xd7712d7c86439a9b
	.xword	0x3bff406082449f21
	.xword	0xe0c416c1eb2f9806
	.xword	0xb3ed2a5f2fb93fe2
	.xword	0x2f4d2592d2e32af9
	.xword	0x20759ed754982955
	.xword	0x398bdccb4b6aba0d
	.xword	0xf969a87a8bfa3b75
	.xword	0x14c3f5c81793caf0
	.xword	0xfd9fbee630c67cc8
	.xword	0x80270c1764799ae3
	.xword	0xfc6f26598b456541
	.xword	0xbc915fefcdf75625
	.xword	0x81b8c5f0c975e820
	.xword	0x83a4871fcc3bfaf0
	.xword	0x52a55bf70cda4330
	.xword	0xf2545ecd9d4d03d7
	.xword	0x71dafd81fdb0cffb
	.xword	0x1e1a5e1a4c42ec91
	.xword	0x192c86eaaf4299ab
	.xword	0x331eb81ead885b70
	.xword	0x7bd91bfc96f5750d
	.xword	0x4d61389f1012783f
	.xword	0xe63ba8942ec6ffb9
	.xword	0x06e91b9959e2fa95
	.xword	0xb89a762784315596
	.xword	0x37b248b28bbbb9e0
	.xword	0xdbf16846c88ff215
	.xword	0xa8379b11dc3918d5
	.xword	0x79ae264253c7c52f
	.xword	0x68c41951df2315f5
	.xword	0x588f611466815704
	.xword	0xcdea02f6990c8ea5
	.xword	0xcb4ca9fbc4ce1380
	.xword	0x9e3ef465bb496c74
	.xword	0xc9634f87005afbf4
	.xword	0xfc666383b7dd58fd
	.xword	0xa96b788c38d752b0
	.xword	0x1e4d3722015c6655
	.xword	0x2a282188fd71cb85
	.xword	0xf8862a954819c1d7
	.xword	0xf48c49f0fc7b4dfe
	.xword	0x21f13ad152015537
	.xword	0x9bc3ab63ba8aa069
	.xword	0x79b45f2d31453cbc
	.xword	0x1555ac5fc65eab36
	.xword	0xe75c9720636d2494
	.xword	0x7469de869bffb722
	.xword	0x84352360b26c3b12
	.xword	0xd74a622920956a22
	.xword	0xf71542c36da74e18
	.xword	0x397d683564240456
	.xword	0xba6fc9ee88854c61
	.xword	0x3b6c1301d0d97035
	.xword	0x9f3905aa342d369b
	.xword	0x3f0956184560c551
	.xword	0x57c097cfa812e0b5
	.xword	0x7653c5f035e934dd
	.xword	0xc0acbb1b2e32d767
	.xword	0xfeed632aa434282f
	.xword	0xa3319cb3ed6f8e1f
	.xword	0x35552010e869f7cb
	.xword	0x5caa1da41895608e
	.xword	0x5d3ae25b1a7e93b1
	.xword	0xb0256b9193acdd69
	.xword	0x391d9b05d96408fd
	.xword	0xa061d81854467329
	.xword	0x3d9b99f1a9f53691
	.xword	0x7383caaedea56328
	.xword	0x013244a78c080376
	.xword	0x713410979399214c
	.xword	0x5c3f5e58aac8927f
	.xword	0x57f5694687adfe03
	.xword	0x7e1e5726d7d19098
	.xword	0x25875d11177e832e
	.xword	0xfaf2d327c4e2c4bb
	.xword	0xbe800dc17a2e275f
	.xword	0xa5982b18e5c83ec3
	.xword	0xabe18f6c5adf92c4
	.xword	0x960c5657567d5089
	.xword	0x68c5b9d0341844bf
	.xword	0x5c7b169c9dd2b9ad
	.xword	0x7d0db85bdd9a95cc
	.xword	0x1dfbb70333978f98
	.xword	0x7365c53a56254d59
	.xword	0xf7aefaf4da58d734
	.xword	0xebada985b8abf2be
	.xword	0x8ba304bb54390e12
	.xword	0xc05dcebf4c916c81
	.xword	0x66eb68ff6a64d94c
	.xword	0xf1283cdbad7d0ecb
	.xword	0x2666b0a82e70496c
	.xword	0x224a930ace73a69b
	.xword	0x6d3f1047408872e5
	.xword	0x1c289cc3d9eb129a
	.xword	0xd08f23a4ef6bbcb4
	.xword	0x9752fa9d3c445c3d
	.xword	0x9780b5506732412a
	.xword	0x94a2da1951e48662
	.xword	0x3e9f0c017cf5a616
	.xword	0x85ddeab0850a3366
	.xword	0x9522b14ab0c04b48
	.xword	0xa05a54ed7f5518b8
	.xword	0x51798dee758c75a1
	.xword	0x0970e9f658ec2627
	.xword	0x94f5ff4d03351c84
	.xword	0x66595c7e86638fc1
	.xword	0xc3ef28c1a1884a00
	.xword	0x20decaea44fb6fcf
	.xword	0x95e2be56b0fe7845
	.xword	0x8e0981900e1e3d42
	.xword	0x8ecf25f89b597a21
	.xword	0x2fecd863192317c5
	.xword	0xcee6d916db1e5cf3
	.xword	0x254c345fe1a3a2b8
	.xword	0xe7896f2f69c95c79
	.xword	0xc626469ed0d3fc2b
	.xword	0xb623719b7d6634d8
	.xword	0xc356e445e26d7432
	.xword	0x19a55c1cef5f22e3
	.xword	0x6d6bb99ff55ab4f5
	.xword	0x6964ff64793734f8
	.xword	0xc0f9a6818e836deb
	.xword	0x233d3f42fc65c8ff
	.xword	0x51bd9bdc04826043
	.xword	0x8c0124fcfa6ec2cd
	.xword	0x8e66f6f3d018f838
	.xword	0xb6103cc47c3303cb
	.xword	0x6710e74277af756f
	.xword	0x736ba0725fffe737
	.xword	0x99fb02debb4c70f3
	.xword	0x010c528f257f7003
	.xword	0xfa7f65245b75cc07
	.xword	0x3645c98967524971
	.xword	0x4c113266ba5d8603
	.xword	0xf39c1564d68ae98d
	.xword	0x06234d91820a6018
	.xword	0x89b8ebb1e2c49624
	.xword	0xfdbffcb4616d3796
	.xword	0x109b49a2be7bab2e
	.xword	0xf91bed6f1817e112
	.xword	0x813de78dc351386b
	.xword	0x6e74ebe1843466e7
	.xword	0xa2f0ad81ed4ecd0e
	.xword	0xcba4118817d00a08
	.xword	0xf9befc683d99b488
	.xword	0x33bab6ba94aebb0c
	.xword	0x78f1dde4b7e5fc8b
	.xword	0xf789dbd9b3bb45e3
	.xword	0x1a50083f0168ef7d
	.xword	0xd92bfb1dd0a40b22
	.xword	0x743da837af514b5b
	.xword	0x6747155efa5477cd
	.xword	0x2be5f7be6e97890e
	.xword	0xb85501d83f22c117
	.xword	0xf698abdd694e5580
	.xword	0x2436b5174395f4d1
	.xword	0x8add50761069f08a
	.xword	0x7a5978c0106b86c6
	.xword	0x12c43b758583c169
	.xword	0x3b64d44c4b3debf9
	.xword	0x834cdd8773cd9ea8
	.xword	0xf071cc84d60a8f72
	.xword	0x6aea64a15cc3368b
	.xword	0x96961127e21a518f
	.xword	0xefd7648b89dcd183
	.xword	0x1e035e01e57b2e2c
	.xword	0x789c049f07ef8727
	.xword	0xcb33bfe90edda17f
	.xword	0xe40098154039048a
	.xword	0xf2c41c8776dbfa7f
	.xword	0x6f5899def721a110
	.xword	0xa252c331e5ad8f7d
	.xword	0x0968ae4323ae949b
	.xword	0x37a76e85775d6b82
	.xword	0xc18d62fe34e2d4dd
	.xword	0x45aa233a6b486eaf
	.xword	0x816bb2c65a08a724
	.xword	0x0695a1af21da1be5
	.xword	0xf3d15f0de6cabd9e
	.xword	0x65f6ab81aaa04cfc
	.xword	0x06e2fd6cd7443564
	.xword	0xb0e9f07574bde5c1
	.xword	0x8d6ffd8a41ac6922
	.xword	0x3507b9efd83fcb70
	.xword	0x89444c2e89734b21
	.xword	0x5ee6542bd94faa06
	.xword	0xef4a3a625149edff
	.xword	0x57a32f0cb0c945e5



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
	.xword	0x1d15ebeee94605dd
	.xword	0x0c429690187a1852
	.xword	0x3ab2012f778843d4
	.xword	0xd4b151dd5424c41e
	.xword	0xcb1e2e3766c8388d
	.xword	0x5c8dd2b764a89225
	.xword	0x56a8e6c3e735cca4
	.xword	0xaaa5196bd8bef513
	.xword	0xc501e95d3b1a0ccf
	.xword	0xb7bae13475680323
	.xword	0xe9067f63e563392f
	.xword	0x33011abdea925d56
	.xword	0x62704ae0c20c8eae
	.xword	0xff72db8bcaa9da9e
	.xword	0x90ad5de5526c26ac
	.xword	0xa3b6e1b28d39fba2
	.xword	0x518339d484b9283d
	.xword	0xb9970de4da7b51e2
	.xword	0x6535184b4d1c106d
	.xword	0xe1aee3abab8533b3
	.xword	0x532c359a975c0cf3
	.xword	0xfc174b339ef698c3
	.xword	0xbdc21c9a27a7b9b5
	.xword	0xe2787bb52fa86528
	.xword	0x7314cad03939f5f1
	.xword	0x7c345c9dcf92ad42
	.xword	0x3b21b0847b2d0ded
	.xword	0x9b72cc4c6efd6e25
	.xword	0x1ea1434bfb7d53d2
	.xword	0x31a60776cd40e2b8
	.xword	0xe3c815af065b9851
	.xword	0x34a376806f617db2
	.xword	0x17a3494489f4a1d0
	.xword	0xac6d47ef129cea45
	.xword	0x3735c0f997193cd5
	.xword	0xda46c6608c491cb9
	.xword	0x59890702509482be
	.xword	0x789e29a93b67e0d5
	.xword	0x4e24d3024c636b67
	.xword	0x2858009d653d5eb3
	.xword	0xfe0ca40acf78b7b3
	.xword	0x054c028d0f9d6ed6
	.xword	0xfc5af0778a7fc648
	.xword	0x48da9dec82377fb2
	.xword	0x22806816c0a216b7
	.xword	0x5a31ba55a9d91277
	.xword	0xef5b3415d7d0549f
	.xword	0xa09a5a28c81bd7ec
	.xword	0x5da2382e9a6d1eba
	.xword	0xde121c986d5b5f27
	.xword	0xb6351fb6315147cf
	.xword	0x1a271747c5fb7e76
	.xword	0x89ab092f1d7164e8
	.xword	0x002febb6f780a396
	.xword	0x9da316e267bf840e
	.xword	0xd110ae175e7b6b67
	.xword	0x764f19cb0e14b1cb
	.xword	0x1ac426558a1c68c2
	.xword	0xf89c4317aed9baa0
	.xword	0xbd4d80b470bac3c4
	.xword	0xe602f242364a3a54
	.xword	0x30c8b7e0efb68dec
	.xword	0x9661e27557a874e9
	.xword	0xdaa2bcb1eb60e373
	.xword	0x2f8cc937b9db2695
	.xword	0x72ac256c77484972
	.xword	0x19dfefa5008548ee
	.xword	0x5e7f3a0ce5fdda8d
	.xword	0x17c795b8586a7825
	.xword	0x94d14dbee47747a2
	.xword	0x8ac5475349a873fb
	.xword	0x327bf8d0f2b29599
	.xword	0x74c5fa5188e4ec72
	.xword	0x84ba3a0410779c42
	.xword	0x34b137bc538d685d
	.xword	0x9ec670b421b2bbb4
	.xword	0x473965f955aba11d
	.xword	0x27ae8a753c792daa
	.xword	0x4b2f948117932b58
	.xword	0x227a02dfce4e1ec3
	.xword	0x11980a976a3f8388
	.xword	0xd151c51942610cbb
	.xword	0x22d8e77307076b2b
	.xword	0x78af2dbb33fa98dd
	.xword	0xb42d17a185520194
	.xword	0x4a50a771deec4318
	.xword	0x54b5b352eb0a3da7
	.xword	0x8801c7a85a85dc48
	.xword	0x76111dbd001d0eae
	.xword	0x09370445d4d285ea
	.xword	0x6048dab6b5684785
	.xword	0x3e42f862a98e2546
	.xword	0x7ad65f775f9ceb20
	.xword	0x9a8ea06b1c1ad644
	.xword	0x07d4750e5a3ca23a
	.xword	0xa4c2ace5cdbf091d
	.xword	0x7d5d6c54fbd50506
	.xword	0x63d76f44acb48774
	.xword	0x58123eb9a77ec66d
	.xword	0x2f0238e310f2fc6d
	.xword	0x848eccb1af7d7e3e
	.xword	0xfcb46dcf6e9cc895
	.xword	0x28d157de548413cb
	.xword	0xea855d64da2ddf83
	.xword	0x353a53c44a335027
	.xword	0x22558a64937d79e2
	.xword	0xaab75d0afbfcf4dc
	.xword	0x709af26c4bd03146
	.xword	0x718489913a819656
	.xword	0x080e0d5adf1f6c9c
	.xword	0x6e9a1e33ed4c6104
	.xword	0x517598f215f5518a
	.xword	0x5b1f09a6075441fa
	.xword	0x55123145cabd64f1
	.xword	0x71d8396b9e294cc4
	.xword	0x1f3dbbefc1740bb2
	.xword	0x1e1cedf27185dff3
	.xword	0x76f9f248301144fa
	.xword	0x67cdb97dc6ed071e
	.xword	0x0af239582b844db5
	.xword	0x637c3d8e86125fed
	.xword	0xba803a76bd896495
	.xword	0xd78d1ea9a3d82054
	.xword	0xd3157b30ad1132c7
	.xword	0x3054a7a346e58471
	.xword	0xce4a7a70ac44a6b4
	.xword	0x2e3d46b59242e66e
	.xword	0xfbb62cad68f8087d
	.xword	0x219c4414d3a901d6
	.xword	0xfda03f023dab11f2
	.xword	0xf5c753362f6e198d
	.xword	0x941a7962131a87ad
	.xword	0x88c431523aadc62e
	.xword	0xed5e12cb1a6a05e1
	.xword	0x52e82fc14aea8465
	.xword	0x580286b3644d9c1e
	.xword	0xaba50b1a0ae100d9
	.xword	0x71831060d327525c
	.xword	0xc66cfef70bdc4ef3
	.xword	0x51231be25565b798
	.xword	0x32351f70bc3a068b
	.xword	0x5bc34bc07b8cf58a
	.xword	0xe82250a5b63604bf
	.xword	0x503179ce508ecc81
	.xword	0x252f53d7c8bb5001
	.xword	0xc77b345eb1b7077b
	.xword	0x54ad1b3c185b5155
	.xword	0x1cc920daf6bdbfb8
	.xword	0x74cc5c13e83dc351
	.xword	0xbad379cdcc3d9434
	.xword	0xb4cebb9a1eca6848
	.xword	0x0d500ab1053c67ba
	.xword	0xd433451c58d9bc23
	.xword	0xe1787a3e87146541
	.xword	0x0a98414266841dc9
	.xword	0x5c88b294498164c6
	.xword	0x21eba31dc3906b51
	.xword	0xc11d57333ba0b48f
	.xword	0x0db2f4c1c51c9e3c
	.xword	0x7e5b27bdfe91ecd3
	.xword	0x2b651b5fe2d279fe
	.xword	0xb5fb2a022e713fe0
	.xword	0x7ae5343ebf9bb21b
	.xword	0x0dfe69a91c2677dc
	.xword	0xb3d253b7a6f2f7ed
	.xword	0x5aaf99dee112b701
	.xword	0x4ac0b37b0fd350c1
	.xword	0x7a55264242ff37d0
	.xword	0xcf1bf5a2315334a2
	.xword	0x91ec7582dadd0358
	.xword	0x41e60e0c05c70b67
	.xword	0x408ce3d058ba5261
	.xword	0x4abc6b08641446c4
	.xword	0x1ca7bd79e9979619
	.xword	0x7c162eb1812183dc
	.xword	0xf9a3651912c459fa
	.xword	0x2a93ae63945344ab
	.xword	0xdd49ae485f9cd350
	.xword	0x0078943e40153745
	.xword	0x44b4b63fefe5ecdc
	.xword	0x6de48127a3c6eedf
	.xword	0xe6b574877fb66a19
	.xword	0x4e2d358f40fa163d
	.xword	0x83b5f0d0f556cc43
	.xword	0x02652e5e66ed8d3a
	.xword	0x2958508adffb2d2e
	.xword	0xd8b67006d23db241
	.xword	0x05880fb766122139
	.xword	0x4b92c6b11c471532
	.xword	0x8e75a03a61c642e8
	.xword	0x663a408c67ab6b2a
	.xword	0xc4b602304c33b4cd
	.xword	0x6fc40df2c5857b1b
	.xword	0x7d4c174aa46fa3d6
	.xword	0x5b1d4daaed4057bc
	.xword	0xd1668edfb8105620
	.xword	0xfb68b30109ea8b88
	.xword	0x094e3ba33958ab8f
	.xword	0xe0f7828e98964268
	.xword	0xa4ebe0773ebcef95
	.xword	0x3baffcf5610a3992
	.xword	0x97e0e63e50a189a1
	.xword	0x8abbb5cef2a004f5
	.xword	0xe05d5f181aded87f
	.xword	0x6c96289a016ee4e6
	.xword	0xd49f6dd502b74c5a
	.xword	0x390b27a15085f9e3
	.xword	0x785bd1fca7afa51d
	.xword	0xc62752ef2bd88f04
	.xword	0x5ac8ae7b84f0ba4c
	.xword	0xec241892b766d2f8
	.xword	0xb591645a00fc96f1
	.xword	0x2205ba34e05fa633
	.xword	0xce8c7752c28b0ac8
	.xword	0xb5dc4263104a9740
	.xword	0x431bb01f445aa586
	.xword	0xaf62b76c94bb0ed4
	.xword	0x8f12f100b3d34094
	.xword	0x16883d0508fa1f24
	.xword	0x0ab9e7cc7946c0eb
	.xword	0x2de7620d88cc1bc2
	.xword	0xc10c69288387e1fe
	.xword	0xf2e1ad7275974f64
	.xword	0x6096185b0da6a043
	.xword	0x12367da267427db5
	.xword	0x8ad987825dc928b9
	.xword	0xd88d8b2f78a6ace7
	.xword	0x86070dadcb6e244c
	.xword	0x2246e4ec96199730
	.xword	0xfef465620229a950
	.xword	0x28400aff9e64ff93
	.xword	0xf1f09f0b197af252
	.xword	0x4d274c1b494a6793
	.xword	0x4dc4d4ab153be8df
	.xword	0xb5137f05d7bbea88
	.xword	0x759032792bb8fd6f
	.xword	0x292a03842fa64f42
	.xword	0xdbb63cf0d9749a9d
	.xword	0x9f836dd7497d6327
	.xword	0xed17a831cc9a864e
	.xword	0xebbbae9b67816e45
	.xword	0xcdd6c97c04e97389
	.xword	0xf46c9a5ff1d6bf48
	.xword	0x34a1add811bba4cd
	.xword	0x2ffda681bef6817b
	.xword	0x308c04c185a0d933
	.xword	0x5e2701e868656ba3
	.xword	0xec976cc5a429fcd5
	.xword	0x41a2e8e26cae6a26
	.xword	0xa478a9b1a4e8a5bd
	.xword	0x27d34c860d057e93
	.xword	0x4723a4730c414f06
	.xword	0xaadf079b6c5403e0
	.xword	0x3f0c7b4a1334f86a
	.xword	0xfedc195a8d931b3d
	.xword	0x3f97b2b2997d96f0



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
	.xword	0xabf2922b88ebb9ea
	.xword	0x7c082305c2c8e1b5
	.xword	0x738cf78eca429501
	.xword	0x9b51c3c48c141cdf
	.xword	0xe01da780a66e9d3c
	.xword	0x41fb9f29a67d17c8
	.xword	0xbd3d2600e6762c30
	.xword	0x8122ba9f5316054d
	.xword	0x42942478334c182f
	.xword	0xfcd13219142f157c
	.xword	0xba9875e6dbcb39f0
	.xword	0x98d7b9451cd10bb8
	.xword	0x81dfc81e05a503fd
	.xword	0x042458ace6cf3f75
	.xword	0xa14ed260641b2cb4
	.xword	0x8d389e141cf9866e
	.xword	0xec0f8e1f34745b58
	.xword	0xa5aea59328f917ae
	.xword	0x6611f9e8f78648bc
	.xword	0xe62688b377e0b269
	.xword	0xba07660c109902e3
	.xword	0x4fc506752f697975
	.xword	0x748f9ab9945c0844
	.xword	0x0c195cd819ed2146
	.xword	0x626418d2d22f412b
	.xword	0xc755afe6a4a7ffdc
	.xword	0x1a7da9839a53d9cb
	.xword	0xb6ef67adb134decc
	.xword	0x118cb7c146d8375a
	.xword	0x35eb82bfb24325c0
	.xword	0x04145de4ff0f44a4
	.xword	0x2d8457d52c007acd
	.xword	0x02ceedea93e8305f
	.xword	0x13e91885a1d663d0
	.xword	0x651d20648f4be6a3
	.xword	0xa1310949ca1646e6
	.xword	0xb10599ecf5974675
	.xword	0x213f96437ab95e34
	.xword	0x39b6fb5f57b1f7c6
	.xword	0x418647e860e71857
	.xword	0xa80f774513ccff90
	.xword	0x69203667681996b3
	.xword	0x808110b270215e86
	.xword	0xca4ada4cebffdea7
	.xword	0x2c0fe831dcf30ae1
	.xword	0xa66aa3a2cceb6d01
	.xword	0x5df7fb99fd08d901
	.xword	0x6f26f71b5d8372a3
	.xword	0x9f7332964767ec1e
	.xword	0x997f52279d4589f0
	.xword	0x29061e7494435d17
	.xword	0xcc27ba38301d1643
	.xword	0xa1f00b929ec3e1a1
	.xword	0xa9c351970dd4bd4c
	.xword	0xa43143a07d2b30da
	.xword	0x9f25c751b22ed75c
	.xword	0x37c043027718321d
	.xword	0x853d2acebe45e86a
	.xword	0xd8f75ed1d257ec1d
	.xword	0x69652a487e75c8f7
	.xword	0x7015389447b3429d
	.xword	0x8df31c1838a418ea
	.xword	0x729ffbd320d940a5
	.xword	0xfff8f6961bc61fe4
	.xword	0xaf5dbd63f99d6086
	.xword	0xae1690c21ff4443a
	.xword	0x79cfaa8789a52bb5
	.xword	0x8d0b6b28d3bc276b
	.xword	0x29aaad47660cdb31
	.xword	0x639a0dd120244f5b
	.xword	0xb5256bde4e163295
	.xword	0xca9935cfa5922c5b
	.xword	0x6ea7b61de5c72c16
	.xword	0x23d01a87e6677196
	.xword	0xfdbba68b18720867
	.xword	0xf6c1cb0d4a9cdd92
	.xword	0x98a6dbb7594e51d6
	.xword	0x1fff2c8ac0935c6d
	.xword	0xdb401133402941bf
	.xword	0x98cbc346921effd2
	.xword	0x0e696df9a80979b3
	.xword	0x2ddbf2a4b1675203
	.xword	0x3de96c203c02453a
	.xword	0x925823c0627d3e97
	.xword	0x7d96b458c2046737
	.xword	0x8718bd8ed3e950bc
	.xword	0x669755cc588e52ea
	.xword	0x2ae065506374f77e
	.xword	0xfe100f97af9adf70
	.xword	0x2c7081c7b084b6a0
	.xword	0x356f6859a251b17a
	.xword	0x935809b5e6fe3be8
	.xword	0x54d8ec76287a4b82
	.xword	0xc300fac9da174937
	.xword	0x782df98f13c15463
	.xword	0x1f1185176735bd9a
	.xword	0x24c385884c62f8bd
	.xword	0x26f2e3362000cd1d
	.xword	0x22ad99c49071e938
	.xword	0x42adb47c08a8370e
	.xword	0x7cfc859f55231371
	.xword	0xf5ec2e0ec0cd698e
	.xword	0x1f08cbf1adc0f5a4
	.xword	0xdee84e8e0cc38742
	.xword	0x183ae966accc947c
	.xword	0x2f0a178f47057e0a
	.xword	0xd7fd045ee40a55dc
	.xword	0xe81a01bb8115927e
	.xword	0x942eb02e64366a3a
	.xword	0x42ba1ac0f921877f
	.xword	0x31e45093c0cb50fe
	.xword	0x3242cb2de75e3f4c
	.xword	0xd4e67e23fb101ca3
	.xword	0xd2a1e94b6c0c6fc7
	.xword	0xa018696c33c7622f
	.xword	0xd04ed832a1a499b5
	.xword	0xd9d3951efc6faaac
	.xword	0xd408a201decdc396
	.xword	0xf9b599d21f981c2b
	.xword	0x3568cc12c5b182ef
	.xword	0xe4a64e7bde0c785e
	.xword	0xd8fc64e2cf0d82aa
	.xword	0x526208a2776f69e8
	.xword	0xdc5ee492a4185a96
	.xword	0x2da380cad1e0e2b6
	.xword	0xfe218216067b05ca
	.xword	0xb15a2dd2035623be
	.xword	0xdf7370ad4478bca7
	.xword	0xb50e4af7f7ae913c
	.xword	0x484ebfbef4272c8a
	.xword	0x7e9291dcde060bc8
	.xword	0xe430c584ab6135d5
	.xword	0xdc3794ede774c374
	.xword	0xc3e7a89cde84b0e8
	.xword	0x6c3262131c222622
	.xword	0x7b778679e0243d3e
	.xword	0x37b939d7313867dc
	.xword	0xd432e2e0b20920d3
	.xword	0xcbbd0f0229ced4c9
	.xword	0xe9758ccba017b7c2
	.xword	0x5c4930eb82990e2f
	.xword	0x854fa3eeb38e3bcc
	.xword	0x6f7159fbce1f56c0
	.xword	0x0a5e28b8cf999865
	.xword	0x30c0ab48200499bd
	.xword	0xb94db85d8855204d
	.xword	0xc1daa080d2809d41
	.xword	0x51718df37f47ad46
	.xword	0xcb2a0c0021d723f7
	.xword	0xaa77cd0d38ea055d
	.xword	0x4dbbb63ac4569a75
	.xword	0x18ea4d4441ef948b
	.xword	0x2ef28cf97d06995e
	.xword	0xbaa2852ca33406a1
	.xword	0x6b9807f0dae4e918
	.xword	0xa6eb4ca937106d8a
	.xword	0xa69ddc780b6b5302
	.xword	0xd938381bb7967f16
	.xword	0x363b565d7d9dfd24
	.xword	0xe5b513ee3881427a
	.xword	0xae8c04127ad77c0b
	.xword	0x5b735b0325ae491b
	.xword	0x8e5989407611ee23
	.xword	0xd036adab442a1c3f
	.xword	0x11389037f6c8551f
	.xword	0xad1ca3a7119586e4
	.xword	0x8323b98c4676aa37
	.xword	0x64d7a00a0e9ca014
	.xword	0xe00e69c18c8a5dbc
	.xword	0xf38f36df81ba546c
	.xword	0x3b49bf3c4bd9004a
	.xword	0x75b9b12acdfa5886
	.xword	0x7bb4d98aa0d2d890
	.xword	0x805a98390ccfeba1
	.xword	0x6b6d4412bca8b252
	.xword	0xf3fe80e054ed1945
	.xword	0xfc53cf4938cf25e0
	.xword	0x80fc7462f1dacdb1
	.xword	0xf9fb4b55c185b0c9
	.xword	0x1e39ac64ac9f9491
	.xword	0xc98a0a6fa22c1cd1
	.xword	0xd6b8ff0968e4cac8
	.xword	0x109e0a7d01283c39
	.xword	0x4826a0ab7d2772cb
	.xword	0x629d5c192ba2b813
	.xword	0x8f61eca5709e4edc
	.xword	0x58bafe5eb69784c3
	.xword	0x6953abf272366453
	.xword	0x5ec54950b410e91e
	.xword	0xe23b4481803e986e
	.xword	0x847f5f54219c115e
	.xword	0x9cfa02d32dc3cbef
	.xword	0xbc0c981845d2bbcc
	.xword	0x5c2ced51c06bd7ae
	.xword	0x6726a45b4b6b700c
	.xword	0x25c034f02b84bc3f
	.xword	0x3fcdc8f8453c8362
	.xword	0x8c468006baea23a2
	.xword	0x60fb997a06e2fe5a
	.xword	0x168024f03a16e19c
	.xword	0x8b9b833807f92a9d
	.xword	0xe0f36b10c7678318
	.xword	0x71ec5643e8164ebb
	.xword	0xd0724e831c5d68b0
	.xword	0xa9783eb067edb690
	.xword	0x0add912776b47e4f
	.xword	0x63d033e5f28b3ec2
	.xword	0xcd3a4083e3434e03
	.xword	0x2322621b332f6f29
	.xword	0xa74d6dbe9afc63b9
	.xword	0xb3c47186bb4b556c
	.xword	0x0730c1ebf2260c66
	.xword	0x7be7187551802ef8
	.xword	0x4f76fa0998b1e53d
	.xword	0x96f80d6bb0ba00e1
	.xword	0x0e47253b4485ed66
	.xword	0x3f328a117267fb71
	.xword	0x37599b6ce9ace18f
	.xword	0x3e89c7c60d7cbc18
	.xword	0xaf9931faf9106a52
	.xword	0x3109cce4ea82231e
	.xword	0x02cadae342b15b17
	.xword	0x7b7c3b7b4c841e3b
	.xword	0x7e73b600fa4c6e7d
	.xword	0xf0d2bbbf08339257
	.xword	0x08187e2ecac12fd0
	.xword	0xd8954bf103011246
	.xword	0x2fee7a1fd9d22ff8
	.xword	0xe36901616b3f07c6
	.xword	0x0b8a3fc35382300a
	.xword	0x7e20b4e8283cf783
	.xword	0xeae61f33c84ceeb8
	.xword	0x0ef8a843188e3aa5
	.xword	0xded63e17f2151261
	.xword	0xb637f9c0c45cf74d
	.xword	0xf52a6956bdbccbea
	.xword	0x3273f47d9c5bec8f
	.xword	0xf59ad737e4605606
	.xword	0x641e49c0372de832
	.xword	0x1369cf2a8ef2c73f
	.xword	0x6609385c7ac86a0b
	.xword	0xf432fcc2878f9d13
	.xword	0xf74df27d3276c9e6
	.xword	0xab32cfbfc44f5779
	.xword	0xb7593a983fa5f3dd
	.xword	0x2d3a68485a81744c
	.xword	0x5ce05320f9c39721
	.xword	0x20116017a3a90a28
	.xword	0x5c736f3223be05b0
	.xword	0x2b4318e7b24f6187
	.xword	0xfa0c91ae9b9d1033
	.xword	0x09cefe52ac4774e9
	.xword	0x5bd71225c4301091
	.xword	0x84c1c3697e02a1cc
	.xword	0x26dd54d07495a9b0
	.xword	0xc718e20747fa45d2



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
	.xword	0x73d743b8c2032f93
	.xword	0x5bdbf689516b1ba3
	.xword	0xc7dfe42a103e24fa
	.xword	0xfe9d00f18954ba52
	.xword	0x02d8162f28aa06cb
	.xword	0x24f03ebc076e2469
	.xword	0xe9823afed3a0ade7
	.xword	0x9f35c917b02b84ed
	.xword	0x364469fc1be684f0
	.xword	0x3a2980ae7466bd0a
	.xword	0xc0ede53ad6d9ab2b
	.xword	0x7e634ae93a0fd431
	.xword	0xa6fa6517a1fdee4f
	.xword	0x4826cc839c30e0d5
	.xword	0x3093cb4ca2d947ee
	.xword	0xa012ba5dbff074a5
	.xword	0x2c43143accf7c8c4
	.xword	0xef5b4d6677235b2e
	.xword	0xf433001ee2800eee
	.xword	0x9cf9a8855b27ff35
	.xword	0xd42464ff34c65c26
	.xword	0x04018ae172780e41
	.xword	0x88f69da332d38e6f
	.xword	0x4b6ee44103309270
	.xword	0xb0ca231ab38ab407
	.xword	0x36939d07cb33b275
	.xword	0x1fb345841b937a4c
	.xword	0xb06e1b9319b27829
	.xword	0x52a283594d85b545
	.xword	0x18251697f733851b
	.xword	0xf295c4b5654aeafd
	.xword	0xd26e1a17f7d90b98
	.xword	0x5da235cb86b94f13
	.xword	0xfcb3b4b57379fcd7
	.xword	0x68785c7703a94e05
	.xword	0x917e8f604e3f77d2
	.xword	0x3cc6b36fe663ee57
	.xword	0xde1bbaaba2e6504f
	.xword	0xff4ed1033d3cd4c8
	.xword	0x4177866365c30de4
	.xword	0xb014edd84c1dd268
	.xword	0xd245479d0c6b4bbf
	.xword	0xcdd30ec642d0db80
	.xword	0xd131fdd4f479db6b
	.xword	0xad2e133634f33e56
	.xword	0x59aa1986b8cfaedf
	.xword	0xa1e472bfed16f443
	.xword	0xa17a6b1026bc1b70
	.xword	0x10b81d43ac1526eb
	.xword	0x203f19fbd1b431a1
	.xword	0x8e72b0057daeaf85
	.xword	0x9dd3f6de15e57384
	.xword	0xb55bd8b523c00c90
	.xword	0x068657611cb70000
	.xword	0xfd66d4a1c09e58b3
	.xword	0x200ad469c06aaee7
	.xword	0xd46813ac753047fd
	.xword	0x3baa71b05e7c2c7f
	.xword	0xf2efb9d79b05fdc7
	.xword	0x0df2225e362c020a
	.xword	0x19eff5fbce521c72
	.xword	0x934d25f5272aed46
	.xword	0xa6381e68196c4a4f
	.xword	0x66b35891ef05b48a
	.xword	0x13774ecbace182d0
	.xword	0x2678a509cd363445
	.xword	0xd0f92bb1f162b94e
	.xword	0xe062c390949225e5
	.xword	0x123c869c89d403c7
	.xword	0x127c200ad12f046e
	.xword	0x923eea78efc97863
	.xword	0x1aaa28d96c0942fd
	.xword	0x04381c999d0e6fc8
	.xword	0x4db1b7697ed5486b
	.xword	0x544ae2eb8039051a
	.xword	0xa49af78d8804ce78
	.xword	0xcc0eaba55966ea0a
	.xword	0x98f54179f28fbf8d
	.xword	0xd9ed2332ffcc446d
	.xword	0xe3c7e9da9d782a20
	.xword	0xb565fe10bf6bd94a
	.xword	0x2cc7ec49ab13c493
	.xword	0xa6f3c82fcc49b2dd
	.xword	0x3e196b3c8825bcf6
	.xword	0xc4737f4b5c538d03
	.xword	0xd7475f844ae7be8d
	.xword	0xbb135308368e4d3a
	.xword	0xffb0cf3fe489992a
	.xword	0x0c784611604be0d7
	.xword	0x8877bcce6b637c7a
	.xword	0xdeef1dcbf8204e0f
	.xword	0x6529053a2f57a301
	.xword	0x157956b973d1fb72
	.xword	0x68822cc356fbacb7
	.xword	0xa25681856c40f1f6
	.xword	0x231e43dc8beeb54a
	.xword	0xb3de5257af655a77
	.xword	0x2b67ef4231e3fd93
	.xword	0x6ce129bad4eb5757
	.xword	0xc8cf3e621537dd88
	.xword	0x8b5fd03e0c5b57b6
	.xword	0x8258178547d9430b
	.xword	0x8137460ae4b128db
	.xword	0xfca25353f8430d6f
	.xword	0xd578511b42d79810
	.xword	0x950467a58a29d211
	.xword	0x84128eff589bda6c
	.xword	0xf73153704c30a880
	.xword	0x4bab32802834ae48
	.xword	0xba9fff3424e6c021
	.xword	0x10c5971fddb0337b
	.xword	0xf3ae9c4302daf64a
	.xword	0x94839c7cd1416e22
	.xword	0xafa18f931791abf3
	.xword	0x6de39e4748fe43d7
	.xword	0xc9e637f708b03b55
	.xword	0x2f21daf3935c6c6e
	.xword	0xc3d60bce70053b4a
	.xword	0xeeb30481ca7a130f
	.xword	0xfcfa1454d5effe18
	.xword	0x88ab82ff67fc420d
	.xword	0x41217dc67ea648a4
	.xword	0xe4c38f683fc6a268
	.xword	0xadb4859f1e1dfbf3
	.xword	0x58a58a70087601ef
	.xword	0xffe0983b56e964a9
	.xword	0x21b22b4f788e8a92
	.xword	0x07738173b8f01c97
	.xword	0x6f8a4187b2314f7e
	.xword	0x4de85e1084c44753
	.xword	0x263f280f03fb31c2
	.xword	0xfb90b08c52af72be
	.xword	0xf132d84c298dab70
	.xword	0x91d84375442aa68e
	.xword	0x1b4962526728db8b
	.xword	0xd0da9108085c1504
	.xword	0x3d1c4b5f2ceae02a
	.xword	0x9ab0f658b9a8c749
	.xword	0xcebf4c7fc6f8e02b
	.xword	0x4836cc226ce828f9
	.xword	0x07081e77fea10e34
	.xword	0xf76780e31ed6457d
	.xword	0x2e15f2adaba456db
	.xword	0xf2a85a358f3de871
	.xword	0x0b0e8312e14ac546
	.xword	0x46804f3acbdc02cf
	.xword	0x864138817a246273
	.xword	0xb5c537043ac18248
	.xword	0x34bf40738d40cad5
	.xword	0x4e1917b7b25e626f
	.xword	0x01503e7dc8f30abf
	.xword	0xa457f4b626169021
	.xword	0xb43d35449a043710
	.xword	0xc883209b6d12506f
	.xword	0x6faa0af93028ec38
	.xword	0x1158ab6cf9f5fd94
	.xword	0xcf971ad222c60c9b
	.xword	0x839111ade2147bb4
	.xword	0x6fb6e5badddf2914
	.xword	0x59a95e8c36548e08
	.xword	0x0f057f9d8eb3bc6c
	.xword	0x2fa2864118db531c
	.xword	0x1cf2db71fc227d9b
	.xword	0x0558c9d97e1bb153
	.xword	0x11a84c485d5e4660
	.xword	0xd9d52a13653633e6
	.xword	0x16ea0b3004f3b6b1
	.xword	0xff38a47f15707442
	.xword	0x5e3a07acba8ecdb7
	.xword	0xa5f7dde46385d946
	.xword	0x66f1a38904b76b69
	.xword	0x7a1183127390eabe
	.xword	0xa3aa7756181ddf6d
	.xword	0x96a0b888ef05f393
	.xword	0xb79de7a764d2cb75
	.xword	0xccfc13c779d939c3
	.xword	0xd71d438bf6696a93
	.xword	0xd8192d1609cca79d
	.xword	0x82e58bb75282a9a7
	.xword	0xe33f0bfb02c2a5bf
	.xword	0xcb8b0f0b5605f46e
	.xword	0x088a30d924a61a37
	.xword	0x662e7076a755182e
	.xword	0xb60979906cefc3a4
	.xword	0xdea131a9e99f1fa7
	.xword	0xf1e7307ac39a41e5
	.xword	0x3f4ee2e2373d7aa5
	.xword	0xea8824b0f83e4a28
	.xword	0x6903d75b0e613540
	.xword	0x472c7cc994284950
	.xword	0x8b6d49b416d70d0a
	.xword	0xe26a7d61e86bf4d5
	.xword	0xb18244c36d4be4ea
	.xword	0xc9a5cbc40d6006dc
	.xword	0x441d20c684be81b6
	.xword	0x1d638d060036c155
	.xword	0x8490d5c3f66c6231
	.xword	0xe2c141deb294f041
	.xword	0xbb8a84cca72fd9fb
	.xword	0x8217481571009a98
	.xword	0x216a5084c5c6c065
	.xword	0xdcc82f938716b5bb
	.xword	0x65617625437599b3
	.xword	0xb550083732973199
	.xword	0x97b6ca97960642b1
	.xword	0x0e88050d93fe2aa5
	.xword	0x50fc17ea130ada23
	.xword	0x24c580ca5754d655
	.xword	0xedf1d97942fa5052
	.xword	0xe449a26c0eeef872
	.xword	0x1b9359fe188f6bf3
	.xword	0xe850f33d88ca8b80
	.xword	0x24d666460f667f2e
	.xword	0x16a4cb0a1810f958
	.xword	0xc8d62b8c9f8bfed5
	.xword	0xac281f0e8b475347
	.xword	0x4a87ffd2d0f63da5
	.xword	0xc8fdfc567652af92
	.xword	0x11ee0ad41f6c84bd
	.xword	0x36b71f7fe209fc34
	.xword	0xa140d97d3b8bbcd1
	.xword	0x754ec93eeda5dfcf
	.xword	0xaa8d05ca79059c84
	.xword	0xd746cc57c2fe7f71
	.xword	0x9505e817d9a6cf3d
	.xword	0x8feee06ecd0a3bcf
	.xword	0xc24aeb21f92c7f86
	.xword	0xf76bbcafc70f169a
	.xword	0x34785d48c9005372
	.xword	0xa73452822bfecd98
	.xword	0x0e0b320ed7ccc184
	.xword	0xb4d101e063206af4
	.xword	0xe5c0a3134a1f7183
	.xword	0x68ad60b945c517eb
	.xword	0x833176c111af490a
	.xword	0x17db0d29ce4b5b64
	.xword	0x98fe0b0a444206bd
	.xword	0x23399d7cbc4c6f77
	.xword	0x16d7ef93ccecd88f
	.xword	0x0d3c956523f21814
	.xword	0x84ad9aa756febeea
	.xword	0xf8abf24c5bcaf5ca
	.xword	0x5176cf34e4efae2a
	.xword	0xd33a10230f4c81b3
	.xword	0x9b7ed982886f768e
	.xword	0xc19f060f69189ba7
	.xword	0x4fec31a32fc2275d
	.xword	0x6445155d549f0236
	.xword	0xf28178aab50cfced
	.xword	0xd5498aad28ea6708
	.xword	0x42551e62ba8902dd
	.xword	0xfbb87b1f5b6d351c
	.xword	0x3021cd8078cc8e4e
	.xword	0x58c20f4e64ac8f90
	.xword	0x82e3c0bb15635b3c
	.xword	0xeb963b3235a75567



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
	.xword	0x10039825cd0f7c86
	.xword	0x333ea82c94fe6fef
	.xword	0x080bb5b9e62fe230
	.xword	0x9b94ed7ea75a6102
	.xword	0x057542746377b4fa
	.xword	0x6e0b9bb86d7f2186
	.xword	0xaa51839a5f5f01ba
	.xword	0xe1c3d04555131ff8
	.xword	0xfaf4d178c74398e5
	.xword	0xddfe9df80b33f205
	.xword	0x41d651145b50f85b
	.xword	0xaa0f06935ae40f45
	.xword	0x92ac34b0c53c869b
	.xword	0xe1da4992fe1d7bec
	.xword	0xb85c5d7cb05d5d04
	.xword	0x04e6d257c3c49211
	.xword	0xfbd9c8d4b335433d
	.xword	0xe0a1cc4df05d824d
	.xword	0x6872e3b505112856
	.xword	0x4ebe258735146635
	.xword	0x3888693acb7cc117
	.xword	0x587b13ed54c08a45
	.xword	0x54922b0e3a654481
	.xword	0x3f172a39708c5f70
	.xword	0x54328c18a4cd731c
	.xword	0x78586ab2e5d26d8e
	.xword	0x6a62087f270dd7ff
	.xword	0x7d88cd6898c7c8d5
	.xword	0xee206cb1350a413f
	.xword	0xb5a671b2f32388ca
	.xword	0xd24deda9505bd7fe
	.xword	0xf085a84cc695b4e2
	.xword	0x7ca0766f69cc0bc7
	.xword	0x1ccf2b24ad4067ca
	.xword	0x4a9fe504afda347c
	.xword	0xf20aed6d84f6b406
	.xword	0xf1ef1be5abb95dc5
	.xword	0xc1716ebd0fc612c4
	.xword	0x86459478a154dccf
	.xword	0x8f72fbc101fca053
	.xword	0xdbeef7d52578a550
	.xword	0xdcd714b994949ac1
	.xword	0xbdf5fe2fa38a56e7
	.xword	0xa57e2f8413a72349
	.xword	0x1dd6caf3db58189a
	.xword	0xa87e31fb3789d52b
	.xword	0x2348c1fe7de87f26
	.xword	0x9d51c69c3ee9aef3
	.xword	0x0bb9954993ec006d
	.xword	0x79cb60012fd9b0b4
	.xword	0x59a34ce0a1cb76ed
	.xword	0xedda9c097b68fffb
	.xword	0xb8cfae4681eeb2df
	.xword	0xa96f847e8a49358c
	.xword	0xb32a58644c229428
	.xword	0xc17031e6fb9fa74f
	.xword	0xa9a6e69bda6dfd47
	.xword	0x008ea194ee0f4508
	.xword	0xa62e5d18ab90cc84
	.xword	0xbdf727cd1ca228df
	.xword	0xaf6605b39166e393
	.xword	0xbabb46cf435de936
	.xword	0x84b0e558a0a62177
	.xword	0x9fa33793a362a03f
	.xword	0xf3e37e70a35716d0
	.xword	0x76bcd150275c138c
	.xword	0xa476f5132f14c911
	.xword	0x3679736549c31e23
	.xword	0x94b49238a7d53c59
	.xword	0x9912f484826f3fed
	.xword	0xf966a7dfdd6ffd6b
	.xword	0x5e3d585db814b390
	.xword	0x802012c77edc6fa9
	.xword	0xe8d03d4cf46bb7a0
	.xword	0x5a66a0a9ae3903da
	.xword	0xe5a92f01c8482e93
	.xword	0x0010c5ba58d45d68
	.xword	0x1d9d3ad267e741c8
	.xword	0x6d9dac677464185d
	.xword	0xb3d95bf517d60f4c
	.xword	0x9f6de765b0e9d249
	.xword	0xc9933d3da29a876a
	.xword	0xd0b00ada9d6bf6fe
	.xword	0x116e8c79d08237e9
	.xword	0x8099f4b0ebdd68b4
	.xword	0x00fea820aa82fd06
	.xword	0xdaea162407dcf23b
	.xword	0xb8ec8b37c75224f0
	.xword	0xbad6b9e45bb0bb58
	.xword	0xe47fc4f7c9f5b1cc
	.xword	0x8a8b90e08afb0d38
	.xword	0xa85c0ef9656444d9
	.xword	0x8fed930172bf662c
	.xword	0x0bbf4db211bf2827
	.xword	0x6b9cc7e122266367
	.xword	0x956e1c5da629cba2
	.xword	0xb505c4f0dda7b7d3
	.xword	0x1cc6fa47300d793d
	.xword	0x168f7170ae8f407e
	.xword	0x080157ae11ec5f35
	.xword	0xb995f38a11fee25b
	.xword	0x8954da96a7eb5377
	.xword	0x5084af4603a87346
	.xword	0x02ac0a46c5245efb
	.xword	0xda6ceb4aa9ad82d7
	.xword	0x8ecc69105c7aa6bd
	.xword	0xc9a3b358a0492ceb
	.xword	0x2ff548950cb25ac3
	.xword	0x8f7e8e43543a8098
	.xword	0xf4e4e756e4be59a9
	.xword	0xd866ee3251caf7be
	.xword	0x717bb15c0229b0dd
	.xword	0x3d15b2cba64fde1b
	.xword	0x2b3fb02592f0a39b
	.xword	0xc31234cf1ab75e76
	.xword	0xccb937cfb6d2e2eb
	.xword	0x41c9d27043212b62
	.xword	0x2b3a7b3e313e2ed5
	.xword	0xd8c075a176b84888
	.xword	0xcc0ad8804503b441
	.xword	0x1c915a5e860fd3ce
	.xword	0x27c3f3549fab5488
	.xword	0x82e388cf388fd1d8
	.xword	0x689b8dd242df7377
	.xword	0xe21f35ec1cb9eb76
	.xword	0x61d95bbcc3822605
	.xword	0xf424cb07def041bf
	.xword	0xc512da7985d598d1
	.xword	0x1e9d7ce793ee4034
	.xword	0x85bb95a657e70e41
	.xword	0x31a4e90a348c22f9
	.xword	0xb38680cab01349d7
	.xword	0x77ebafdb36481ba7
	.xword	0x1e5935f7d4630ed2
	.xword	0x55c7df76974f3f83
	.xword	0xd8c52076dff47757
	.xword	0x7c51868defe0d0d2
	.xword	0xe222868c6044e45b
	.xword	0xa0e031de148df73a
	.xword	0xba234675166e9084
	.xword	0xd1dcb3676975f446
	.xword	0xf1bbcac7bc11829b
	.xword	0x81be63c3990d01e8
	.xword	0xd1012fae5d2c4160
	.xword	0xb14084acd636f38c
	.xword	0x2a6c9900fbcc1015
	.xword	0x276d7e31884215df
	.xword	0xf35a88004b73b0cb
	.xword	0x22384341b0f8c958
	.xword	0xb745dbd4756eb87a
	.xword	0x47544dbe5de0166b
	.xword	0x962b3d50699b0c07
	.xword	0x1013eab766890af2
	.xword	0x3e13bb95b7e3b53c
	.xword	0xe8625e1b9c822df0
	.xword	0x3e378d5551f10ba0
	.xword	0xa93eea151a71f65d
	.xword	0xd99f72d0993b0e56
	.xword	0x717e2a92f07b73b1
	.xword	0x7d1f2b7e2cce8ec3
	.xword	0xf46c060e3f8dcbe8
	.xword	0x58c7963479dfb114
	.xword	0x4f16f6e3be396dd6
	.xword	0xef5f68bc4a2a9e29
	.xword	0xa43dcb9d0f7c3087
	.xword	0x045bc5f62922e841
	.xword	0x119c90ad7ae535e5
	.xword	0x4d40f8bcdf81e579
	.xword	0x168921480308a443
	.xword	0x2db0b5bc4cc2edb9
	.xword	0x2bca21fc9775bc07
	.xword	0x1f1a172626d3c183
	.xword	0x22550dfba0991419
	.xword	0xa9e0086afcfd8540
	.xword	0x3fcd80ad21e0fb2a
	.xword	0x90b570286750d288
	.xword	0x8584ed5bcc95b2c7
	.xword	0x7f3da32bde1a85e4
	.xword	0x022a9fa4a8ccfffa
	.xword	0x200d35c3c962cbe7
	.xword	0x26be16b4ec8bc443
	.xword	0x26585cf5c54ed22c
	.xword	0x274eded4d27b935d
	.xword	0xa9cddaccf7401d6c
	.xword	0x989099da723f7e3d
	.xword	0xa81a7910650a1ee0
	.xword	0xfe4d63c8e2809625
	.xword	0x228ca373c60439dd
	.xword	0x9bac995f8d0b8d9f
	.xword	0x29210e31b447c2f2
	.xword	0x4dd5e0b9aaa96628
	.xword	0x48c1ffde1c51e72f
	.xword	0xd88afc26eaf8ff38
	.xword	0x141229a09ffc9055
	.xword	0xe263bf4799e063b6
	.xword	0x9454a5146f22d814
	.xword	0xee74bb0d6f9796b2
	.xword	0x5e023e75b91b95d3
	.xword	0x9e33dfde345724d7
	.xword	0x0f65e48445377ad2
	.xword	0x00e64fd7bf0a1b95
	.xword	0x664b367b25cb01a1
	.xword	0xaf455197ae395f18
	.xword	0xa71df4d87195596d
	.xword	0x736fb4eba5e71daa
	.xword	0x1bb07e5515b3a824
	.xword	0x2b3cbe3703427e57
	.xword	0x0a4557d2bb0ddef5
	.xword	0x0c6730a4df329b72
	.xword	0x2c15185273864899
	.xword	0x8c9d3ada3d5972df
	.xword	0x1a7853e6c038f7fe
	.xword	0xe2f345d1677c321a
	.xword	0xcdf8e1cb300ad27a
	.xword	0xc09bf3412e7eec2b
	.xword	0x2457b214eb341667
	.xword	0x8fa56865789db534
	.xword	0x1a0a678c88a4a50b
	.xword	0x858ba6cd85cf6ded
	.xword	0xb43b68b5bd68c349
	.xword	0x73629fc87b0f88fd
	.xword	0x7cd2c992c5aedd2f
	.xword	0xa8597025fae07486
	.xword	0xd6a7206348afc9d6
	.xword	0xd1096f6af8104bbd
	.xword	0x4864d099c22fe280
	.xword	0x78782189fa67f333
	.xword	0x95feeb53d6debf3f
	.xword	0x23d17bc107191be2
	.xword	0x510a0cb8ff999b99
	.xword	0x7fe26a5bce26b75f
	.xword	0x45fa552b39c9e99e
	.xword	0x67f0b3d994de8b31
	.xword	0xe2098572120599ff
	.xword	0x3cace4e82223013a
	.xword	0xe2073481ab589010
	.xword	0xf8700d8df0390005
	.xword	0x1d55bdf027e3bd29
	.xword	0x4fa01bd138845cb4
	.xword	0xe872be80fe98f297
	.xword	0xdef27dd3fdfac07a
	.xword	0xc35996f1ea03d66a
	.xword	0xb7aff7cd64cf7f5c
	.xword	0x668ff3ac9f1c6b3a
	.xword	0xc1a7dafa6547278d
	.xword	0x0bfee03db671155b
	.xword	0x2979071c21b9cf48
	.xword	0x909a4ee5f22aeb19
	.xword	0x9a4b4f13daf526a0
	.xword	0x7e5b03d6faf6488a
	.xword	0xf284e5a70fc6b1cd
	.xword	0xfea25c962377c83d
	.xword	0xf1c9cee68bcabff9
	.xword	0xfaa5797c2445d43b
	.xword	0xaa44c4725e99e2f5
	.xword	0x7544c366aea02f99



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
	.xword	0x51f0d3886cf5e916
	.xword	0x58ba3b2133c745a2
	.xword	0x6029cfa6ef8b5d5b
	.xword	0xaac81d1d1e211829
	.xword	0x38f38cf49e44563b
	.xword	0x8a7e5317c95a58c1
	.xword	0x09a49c76028a33c0
	.xword	0xe9b920761ccca201
	.xword	0xf2b4a0a838b7bb3b
	.xword	0x4d4d34ef8af8ac85
	.xword	0xa3f280f6fa92c6c4
	.xword	0x1e4788bdc386a337
	.xword	0xf05bb448c8049686
	.xword	0x6125c2df9fb5c2fe
	.xword	0x69d53dd8e48fa9fd
	.xword	0xe1cfe0ce9901de72
	.xword	0xa187c550fefa1d3e
	.xword	0x18426ed22e7d4d89
	.xword	0xca66b13cfe42f684
	.xword	0x602a8aa679e402a9
	.xword	0xef26f68f7a9d7cc9
	.xword	0xa2d556c64efd9a7e
	.xword	0xe7fedc25a2838d43
	.xword	0x001d82326a89e072
	.xword	0x47aef4dd5c82338d
	.xword	0x8aab235cae151a29
	.xword	0x4b42d0ebbe8cc06a
	.xword	0x079865dd4f7182cc
	.xword	0x9aef49ebffc6d51e
	.xword	0x691d50712d867318
	.xword	0x171581f26e53264d
	.xword	0xca3b7a4d2227c789
	.xword	0xcf6f49927e34863a
	.xword	0x2c4048c54abff390
	.xword	0xb462e354e0e768f2
	.xword	0xac9acbf0deb3c7fc
	.xword	0xc1ab6666191f87e9
	.xword	0xdf7df71e81f8a3c0
	.xword	0x3d04fe2cc2e2fae2
	.xword	0x005fca3f678ed38b
	.xword	0x15bb577af5e55cc3
	.xword	0x7816f78ba49e7fc1
	.xword	0x1e080e5ab05a264f
	.xword	0x0f6728360d46b830
	.xword	0x0432660e0835d221
	.xword	0xeb619f374cb5e53f
	.xword	0x1c9a274e6079bf0e
	.xword	0x4ea52c574d11d321
	.xword	0x4dd6a89c9c67103f
	.xword	0xb78f1c3ba8efc192
	.xword	0xb51878ed8fd42b62
	.xword	0x072e61592cdef814
	.xword	0x95e9c628808be8e6
	.xword	0xfd461a93855efdce
	.xword	0x10c3380431db431d
	.xword	0x4207b7db6f0dd0f4
	.xword	0x53b6f3b30bf6b306
	.xword	0x58b1597fb8c5f4bc
	.xword	0x2f9c0074795c32f2
	.xword	0x9f1dbbf946665909
	.xword	0xeb16da630eb78da2
	.xword	0xa495ff0ee3d300ac
	.xword	0x6cba1d5b00e98cb6
	.xword	0xdbd29281166618ad
	.xword	0x8f9b4f6b5133e5b0
	.xword	0x170ecf0b742b4090
	.xword	0x13c55649e1999f59
	.xword	0x32ddb06bc21ce1f3
	.xword	0x35af7282ca2fa35d
	.xword	0x2d25f24c3a3ea6da
	.xword	0x1f380ed791439762
	.xword	0x7683c0ea71f4bd9b
	.xword	0x520d6c4aaf1aa628
	.xword	0xc8945233aa213410
	.xword	0x917c42d7c9f2116c
	.xword	0x5a9e2216af8b9807
	.xword	0x3522f700b9f8e893
	.xword	0xee0078008b2976fe
	.xword	0x8ef26bfcc5d8f279
	.xword	0xb817e24dce41e0e2
	.xword	0x5610c7056cded5e8
	.xword	0xc4fff67e5e8670a0
	.xword	0x9b484a1dfcdc5423
	.xword	0xcfed132e3799840e
	.xword	0xf19d2437cf783d76
	.xword	0x2f57292b70b6883f
	.xword	0xec4b217af9da78e0
	.xword	0x0b6a6b977ad4c158
	.xword	0xafe3de512711b76e
	.xword	0xa4198466d3178ed7
	.xword	0xfcb698f3fb369e47
	.xword	0x41f7ac1344959404
	.xword	0xb93e3500f598b9bf
	.xword	0x9c030555a212ad4c
	.xword	0xfc06998fcdd5c3d0
	.xword	0xfe31e013f3e427c9
	.xword	0x89ee6399ed63d46e
	.xword	0xba857978881dfeda
	.xword	0x814d1865f3a1f292
	.xword	0xbb8a6e444ec811c0
	.xword	0x5714232b1ebeecd0
	.xword	0x9d1c54a333f2978c
	.xword	0x3fe8646ac0f53162
	.xword	0x8b75582be4562e5e
	.xword	0xe0f98c9c9c883717
	.xword	0xa2e1a74b57752b20
	.xword	0xe9ea621f66b41aab
	.xword	0xe1f0d3e2bd4c6d81
	.xword	0x629ee4ca4f8e8ed3
	.xword	0x19bc8c6377256cf2
	.xword	0xba59bb941173ee7b
	.xword	0xf3732676b5fe273b
	.xword	0x67c22554e7df96cb
	.xword	0xd7aacbcde33aba3b
	.xword	0xa579f0c1047752ad
	.xword	0xf33ff45c624bc57f
	.xword	0x1cffae098f400db2
	.xword	0x6b03c08a04b9438d
	.xword	0x330e666bd0bc966e
	.xword	0x690930a5e80cbbae
	.xword	0xa7afd16c8811ed3a
	.xword	0x451da43c8fd8bcac
	.xword	0xfe106a7d2a4f3c8c
	.xword	0xa3e3e85b5e2cc6eb
	.xword	0xb2936e4e15248e49
	.xword	0x1cbf700e24a2ecab
	.xword	0x48d61081ab1ad2f2
	.xword	0x3200eb5faab20644
	.xword	0xe69be818f10670e7
	.xword	0x438782fda10cf518
	.xword	0x8490deb20229bef1
	.xword	0x991ebc403263b9da
	.xword	0x2494ed399500a859
	.xword	0x06715085025faf55
	.xword	0xd90fdab9e3304980
	.xword	0xfa2de47910183a80
	.xword	0xf055c22255aa7232
	.xword	0xd3c63b679172fbee
	.xword	0xc3a09e51e92c99c9
	.xword	0xbaa0c20a31356360
	.xword	0x209bd8032ceb25a2
	.xword	0xcde1d115556db7a1
	.xword	0xf208cc085692b76e
	.xword	0xb991c9ee6a511184
	.xword	0xb0636d35de976d03
	.xword	0x9d7077ad83a04b28
	.xword	0x67fe74b9fd8c620d
	.xword	0x5fc1fa85a9006063
	.xword	0x3b0b1e8101e79031
	.xword	0x40c4a29d4a506f2a
	.xword	0x1963b3d119e20105
	.xword	0xf3c0b0b2850d58e1
	.xword	0x65b1433c6ae3f4ba
	.xword	0x408c70c865701fe7
	.xword	0xf7ff7c3aa7c561b8
	.xword	0xa7638502877cb5b6
	.xword	0xfb6640998997feda
	.xword	0xb25d76045452b370
	.xword	0x237f793f443cda33
	.xword	0x9522221c660bceb0
	.xword	0x35f851c455c04efb
	.xword	0x05e7f3077217fdab
	.xword	0x0ad51244c20f60d9
	.xword	0xc6ca4ef67b9cc0ea
	.xword	0xbaf18714a6bfc7e1
	.xword	0x23979759c93db97f
	.xword	0x268ad55e1a7f8ee8
	.xword	0x2ec709b6150f46d3
	.xword	0x4be4e77511dda24d
	.xword	0x68c8b597eea5c671
	.xword	0x7e83f5885acf411e
	.xword	0x832883dea17853cc
	.xword	0x80bb45899d8f2048
	.xword	0x8423eacd954a6699
	.xword	0xfe5b2b2cd6dfd1a6
	.xword	0x72066ea3398e3eb8
	.xword	0xf9fd5732c15c9629
	.xword	0x04089b26dff61f21
	.xword	0xa78f9a1dbfe2f543
	.xword	0x1e218ab4bce36ac0
	.xword	0x07f965bec1b967be
	.xword	0x2b850698939cd990
	.xword	0x49f0a89cbb8a8705
	.xword	0xa3fa7ff644043e1a
	.xword	0xbc01851763e46a8d
	.xword	0x98321012af569efa
	.xword	0xb6cbfe88199830af
	.xword	0x0f93d57601241c19
	.xword	0xece5895577c71315
	.xword	0x42eb0c26f7f27cc0
	.xword	0x887da07610da6c13
	.xword	0x92acb1d4e5c72289
	.xword	0x7ebdd88cea62a679
	.xword	0x5e0b332ed0fb2a87
	.xword	0xc04c2ebcd8bbeb35
	.xword	0xd9d1ed5ffc46d19d
	.xword	0x5ed0a2ccd7150670
	.xword	0x064b5d50f3170664
	.xword	0x608ee2ce65562a4b
	.xword	0xf22d481801e5410e
	.xword	0x21d4f06df1bcc214
	.xword	0xfee5ab2552e432f5
	.xword	0x277c96e4800c710c
	.xword	0x1effe59df771ac09
	.xword	0xd29d629b1cf26968
	.xword	0x781ab6087d64e78c
	.xword	0x509c8087a1d78e5f
	.xword	0xd65cfbe07548521a
	.xword	0xab446648f543f7c6
	.xword	0xab694babaea90ab4
	.xword	0x170867171f917f63
	.xword	0xeba50ccb51beaf49
	.xword	0xa7589977c7286013
	.xword	0xeeff2222d0219181
	.xword	0x0400d89a24dbe9f9
	.xword	0x0b2e450408630517
	.xword	0x0eef8272991d13cd
	.xword	0xb75b3db7d216b0b5
	.xword	0x5899e06e48967a2e
	.xword	0xd9e7e14735f4465d
	.xword	0xefd48554f1138986
	.xword	0x62a9c2e1b4daeab8
	.xword	0xf51a62b098325254
	.xword	0x3a5b2bec7e391cec
	.xword	0xf6e5d8d223c4b694
	.xword	0xe136635510f24a68
	.xword	0x170d3d0586fd9950
	.xword	0x266366b000d7e1aa
	.xword	0xf47ff4ebe37c1b9f
	.xword	0x29b6bb1250ed9639
	.xword	0x669e9ff25e6be9ee
	.xword	0x94e340c560dc169f
	.xword	0x8f9c9477915eb96f
	.xword	0x880b513f6c844478
	.xword	0xf3b1ac2fad325d05
	.xword	0x3c7ca2abe5513618
	.xword	0x5acd111f7407e4bd
	.xword	0xf8a295b544ac0012
	.xword	0x48c4f103da995c0a
	.xword	0x51417869e61c326f
	.xword	0xde23985a0a10d3f5
	.xword	0xa760a3b3a95b53b9
	.xword	0xc9645f08e0fdf685
	.xword	0xf8ed3d6c946a2e9b
	.xword	0x1034af32e172507d
	.xword	0x03532eea869a154b
	.xword	0x09bf326c6c6e8ec6
	.xword	0x4f58d8c0aae2a0b4
	.xword	0xd4d56cf787e1a474
	.xword	0x03eeba271b538e37
	.xword	0x244b09b28f3b4b19
	.xword	0x3d7cb67efac5f17d
	.xword	0x4844abef00916edd
	.xword	0xc6a67616d876f538
	.xword	0x75716d1b7e34f24e
	.xword	0x276f0acdf4d1e662



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
	.xword	0xe49b5f9f526e34ab
	.xword	0x571694dd919ecdbb
	.xword	0x68836c604ce382ce
	.xword	0x0177abfbc9f21624
	.xword	0x593f80a511812f5b
	.xword	0xce87bdd0fded8d3f
	.xword	0x28b87cdf862609ea
	.xword	0xb3d115139ad75cd2
	.xword	0xbf98212637c675df
	.xword	0xb77702b1a3af5448
	.xword	0x108c37facfda298a
	.xword	0xb328719eabe4b831
	.xword	0xca39fc8c4e0def6c
	.xword	0x7d946fea97d95203
	.xword	0xde5042ff58e6bd4d
	.xword	0x94d4ebe9d62aecdc
	.xword	0x779a74c22c7440d2
	.xword	0x7de718c3b195b6ae
	.xword	0x83571392a2bb5e75
	.xword	0xe58f4d0372e1acd9
	.xword	0xf30395a5338a0752
	.xword	0x14f386e1848a12e6
	.xword	0x9d545e21614eebe8
	.xword	0x6babf78e14dfcebe
	.xword	0xd2ca09faf270dfc3
	.xword	0x41ff9acce67acdd0
	.xword	0x1026b2c3a3b50671
	.xword	0x3e9aeefb1ef1c1ff
	.xword	0xe8105f918bb12681
	.xword	0x55ab9af8591206b3
	.xword	0xc9d149c07a00ae21
	.xword	0x7e7b9290732a61e8
	.xword	0x1c769d3886786cc7
	.xword	0x4c8121cedddb87d5
	.xword	0xf08e983fa2cf0b03
	.xword	0x8b93826a82a28cbf
	.xword	0x9ee67a778f245229
	.xword	0x808fc9d6e3b4a365
	.xword	0x87ecc365edd30723
	.xword	0xfac20332575f4f59
	.xword	0xa8af1278c6338590
	.xword	0x265008f22d1ddc09
	.xword	0xe004b0dcefe8180e
	.xword	0xa4c7fbfdbb799e47
	.xword	0xc8e3ea3a0ec5245c
	.xword	0xbe03d838b7e93020
	.xword	0xe8eeed94e13850ae
	.xword	0xaf53a306b2c214a8
	.xword	0xc25c2ab03389883b
	.xword	0x3243f96ac3c54dab
	.xword	0xf7e1fe7f55840baf
	.xword	0x6f534bd34c1ff2ac
	.xword	0x33a2ae493573d9cd
	.xword	0x2cd2a9d823e3cf7b
	.xword	0x50bc38ad7e48a850
	.xword	0xa1fc818914f8a83e
	.xword	0x15f11fad776b0029
	.xword	0x1080267792154eca
	.xword	0x22efbbd386d5481a
	.xword	0x20410d67101b0175
	.xword	0x306b87b37773cf65
	.xword	0xac4d88fb4e0919a6
	.xword	0x4ac7619bf9d66845
	.xword	0x4e2a1d471749ba79
	.xword	0xcb421a6c635917c9
	.xword	0x11fdbd88d56a3552
	.xword	0xfd4f75520dc0d9d2
	.xword	0x1b847fc236345448
	.xword	0x2df89e0a06548ea3
	.xword	0x412428d67a60a106
	.xword	0x05d7ac88462785e3
	.xword	0x5d3c5e4ec9ff1f54
	.xword	0xc19eff593ed48954
	.xword	0xd864f65e0df0b6e0
	.xword	0x25a327eb631b8452
	.xword	0xb26efb5c1603f1ed
	.xword	0xa5f23c8dcaf607dd
	.xword	0xf2831a50fd759a52
	.xword	0x811b1702c468e213
	.xword	0x46433ac58f124e9b
	.xword	0x3eaf2f2c4baa7a80
	.xword	0xe72d7aae822f6761
	.xword	0xca62b49a81596b1a
	.xword	0x85137c5a2363f9ae
	.xword	0xd281180942110ca0
	.xword	0xd925f55e0eb050eb
	.xword	0x049c4b20c9b58d7f
	.xword	0x22ed2503dc21cd43
	.xword	0x092e7432836a1211
	.xword	0x78f4278af235497d
	.xword	0xd4a6fbd361f171ba
	.xword	0x1eff7cfd49f457b4
	.xword	0x8394f44dbb915a5d
	.xword	0x0a5c8ca9b9a93196
	.xword	0xa814d9b785af609d
	.xword	0xfb5df5299ffce205
	.xword	0xfdca92abf31cc6b9
	.xword	0x9a6496dbf3dfb964
	.xword	0xb5c680c5d7b8d61e
	.xword	0xafdf9be8461b7715
	.xword	0x91f535983cf67600
	.xword	0x0e2400441569cf68
	.xword	0xa2e3b21a47bd0a82
	.xword	0xc16b336661078522
	.xword	0x3f33f03975829e87
	.xword	0x2b05612071848bd5
	.xword	0x2cbd2e9e78bd62ae
	.xword	0xd818e17665effd0d
	.xword	0xc91a63cefb93fa5d
	.xword	0x0ec7d60a9dfe6470
	.xword	0xbda1d35b116638fe
	.xword	0xffe8e624ed89df34
	.xword	0x1662635bc5f5a913
	.xword	0x71b8c1541df5e9e1
	.xword	0x7ed4dabcae016167
	.xword	0xa590e38847266753
	.xword	0xd556ef362efcec7e
	.xword	0x64e173405e41da9c
	.xword	0xa513d3938618ccb0
	.xword	0x28d9bcebb6e0a28e
	.xword	0x3179f63709538637
	.xword	0x718168bc490912b0
	.xword	0x455ea20db96320b0
	.xword	0xf1c1b0882e8ce711
	.xword	0x99cb14faa3bf01b5
	.xword	0x47ef5b068976c839
	.xword	0xbaf8b86e7487b6e9
	.xword	0xffc37c8153c351d3
	.xword	0x4c9bdb9885fe4989
	.xword	0xa4661a76fd866686
	.xword	0x0bdedd86eb33215a
	.xword	0x2643c6fdc0d102d7
	.xword	0xe5d584443a083902
	.xword	0x5841db45c1597976
	.xword	0x831f0208611c1bcd
	.xword	0x3337a9137b883a27
	.xword	0x1dbf45087e92f650
	.xword	0xffc0948e4bed9866
	.xword	0xdac9de312da4f569
	.xword	0x73d563dbdce4525c
	.xword	0x9b2e44b872dd1313
	.xword	0xbd5dd8dc4844d3dc
	.xword	0x2107de0fb6dd4805
	.xword	0x643d5e3113cd9147
	.xword	0x938fe78be86055e3
	.xword	0x964b2b5c64d77588
	.xword	0xfc2b0d904e85ac74
	.xword	0x725374bbc3e98c96
	.xword	0xb05bc2734c1d617a
	.xword	0x1f8a7103c2ab9269
	.xword	0x8058f9a32bb27ddd
	.xword	0x85d0a72e52807527
	.xword	0x728c6f58fbf79e25
	.xword	0x7a79c696d7e4be6e
	.xword	0xe6ae7835c148b12a
	.xword	0xd02265759eafb48c
	.xword	0xdf29ff46f7991bb8
	.xword	0x736562e42eaa4b08
	.xword	0x7e40a3e29c2e0a97
	.xword	0xc8fe1f3f9d298301
	.xword	0xe12d4bd7b629bbe1
	.xword	0xa7654cde743d6f9a
	.xword	0x024b4bfa6b3d960d
	.xword	0xee2d492011fe198b
	.xword	0x7f173092488a0be7
	.xword	0x5d8b56037ff48cd9
	.xword	0xe79b9ee2723c2d7c
	.xword	0xfe41189423200614
	.xword	0x653dd452852fafb4
	.xword	0x10b96bb457b58156
	.xword	0xf63d3892bd61bc14
	.xword	0xb957da3b1b90918f
	.xword	0x192c761dddd9e7d1
	.xword	0xb99003ccfee9c593
	.xword	0x536f48bd4d96ed06
	.xword	0x9a21c52dc4081725
	.xword	0x8086f774cf5bef21
	.xword	0x8f9c29e727c75efd
	.xword	0x110d01cad2052be1
	.xword	0xdf5f3e79afd94d17
	.xword	0xe192de339fd8b79b
	.xword	0x875bdbb231034863
	.xword	0x3dd6c679dfec8b61
	.xword	0x4aa962cd7274bd6a
	.xword	0x72da08781d3dba4c
	.xword	0x66c5929f52e49282
	.xword	0xe2d9b0bcbf41ffbc
	.xword	0xcf89124aab780548
	.xword	0x42eb6c5396802ee6
	.xword	0xa860ad2990215433
	.xword	0xdb0f8946e8f319aa
	.xword	0xa6388efd058fedb6
	.xword	0x82c48530a945c174
	.xword	0x985219aa483e1285
	.xword	0xe8e50b9911605c19
	.xword	0xf5e5cc6ae173a4d3
	.xword	0x37246a848ac0d64e
	.xword	0x2b6f14fb2c1a1b1e
	.xword	0x12c4ba7e2398a4c2
	.xword	0x03d4920f23931e4c
	.xword	0xb9dc528eb652d483
	.xword	0xee55160dff98eb1e
	.xword	0x7d232cec92e4b17a
	.xword	0x640d5c51cd0e91e0
	.xword	0x4cc18e1dbe4ac9fa
	.xword	0xaab6194ec0245c90
	.xword	0xfbfb2c0b2fbf2d7d
	.xword	0x8ba64986615abb2f
	.xword	0xa1b71cb15c95776a
	.xword	0x68a6c4232ba1ecfb
	.xword	0xc9ae604e15dd3d0a
	.xword	0x74e543c311a7d598
	.xword	0x3d6ff821a4a25d06
	.xword	0xc8aee67ed41bd877
	.xword	0x063870c43546724d
	.xword	0xbf7e34c34789c372
	.xword	0xc055e9bfc971eff5
	.xword	0x81097b00d384f59d
	.xword	0x359f4eb50a533b00
	.xword	0xa6e6dfb0a8bc0beb
	.xword	0x3bfc50bedde74a32
	.xword	0xf1b088c6a486b847
	.xword	0xb0490c6921a82364
	.xword	0xa4eaad25aab11711
	.xword	0x954145d9fe70bd61
	.xword	0xaeab00f35bc79a37
	.xword	0x5af0e338d685c689
	.xword	0xadaa607db39ad28b
	.xword	0x14b08f2cb29db300
	.xword	0xf9fd2f9c8398ad76
	.xword	0xd0fcd0508e257f65
	.xword	0x165d982fabc42e39
	.xword	0x54ea6d7bdb38eee5
	.xword	0x63d167c1bce77e6d
	.xword	0xb8f7095425378bad
	.xword	0xc0174a81b3193491
	.xword	0xe09e7faab040364d
	.xword	0x9add679ea93f89de
	.xword	0x28ebb5f9bf386b7a
	.xword	0xd78db52f607f9cab
	.xword	0x1a4136d15f1cb393
	.xword	0x28eea116b4a8c428
	.xword	0x9bac5c0ae619062a
	.xword	0xb707531e214e25d4
	.xword	0xcb9aa5d506f92377
	.xword	0x9b0819b7a11d6c64
	.xword	0x0b99072048c79458
	.xword	0xdc54f3bc1e450e7b
	.xword	0x7c2fd1eef02b853b
	.xword	0x959c34a64a3bef61
	.xword	0x65120222243bfdf0
	.xword	0x7e4a717fea8ad34c
	.xword	0x94bbb191fb621b9e
	.xword	0x9d163a2b515aeff8
	.xword	0x268edb25b0109d56
	.xword	0x3e499707a713dae0



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
!!#   IJ_set_rvar ("diag.j", 102, rv_0, "{11}");
!!# 
!!#   IJ_set_rvar ("diag.j", 104, wt_ld, "{30}");
!!#   IJ_set_rvar ("diag.j", 105, wt_st, "{30}");
!!#   IJ_set_rvar ("diag.j", 106, wt_bl, "{30}");
!!#   IJ_set_rvar ("diag.j", 107, wt_alu, "{3}");
!!# 
!!#   IJ_set_rvar ("diag.j", 110, Rv_rand64, "64'hrrrr rrrr rrrr rrrr");
!!#   IJ_set_rvar ("diag.j", 111, Rv_Simm13, "13'b0 0000 rrrr r000");
!!#   IJ_set_rvar ("diag.j", 112, Rv_addr_sel, "3'brrr");
!!# 
!!#   IJ_set_rvar ("diag.j", 116, Rv_memaddr_pattern_dma,
!!#         "24'{0},"
!!# 
!!#         "20'b 000r rrrr rrrr rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rr00 0000,");
!!# 
!!#   ! only 60* or 61*
!!#   IJ_set_rvar ("diag.j", 125, Rv_memaddr_pattern_io,
!!#         "4'{0},"
!!# 
!!#         "20'b 0000 0000 0000 0000 0110,"
!!#         "20'b 000r rrrr rrrr rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rr00 0000,");
!!# 
!!#   IJ_set_rvar ("diag.j", 134, Rv_rand32, "32'hrrrr rrrr");
!!#   IJ_set_rvar ("diag.j", 135, Rv_rand_mask, "32'h0000 rrrr");
!!# 
!!#   IJ_set_rvar ("diag.j", 138, Rv_memaddr_pattern,
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
!!#   IJ_set_rvar ("diag.j", 154, Rv_jbiaddr_pattern0,
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
!!#   IJ_set_rvar ("diag.j", 168, Rv_jbiaddr_pattern1,
!!#         "24'{0},"
!!# 
!!#         "20'b 0000 0000 1101 0000 0010,"
!!#         "20'b 1110 1111 000r rr00 0000,");
!!#          ! init only till 7fff 
!!# 
!!#   ! 80_0F00_0000 - 80_0FFF_FFFF
!!#   IJ_set_rvar ("diag.j", 181, Rv_jbiaddr_pattern2,
!!#         "24'{0},"
!!# 
!!#         "20'b 0000 0000 1101 0000 0011,"
!!#         "20'b 1110 1111 000r rr00 0000,");
!!#          ! init only till 7fff 
!!# 
!!#   ! C0_0000_0000 - CF_FFFF_FFFF
!!#   IJ_set_rvar ("diag.j", 193, Rv_jbiaddr_pattern3,
!!#         "24'{0},"
!!# 
!!#         "20'b 0000 0000 1101 0000 0100,"
!!#         "20'b 1110 1111 000r rr00 0000,");
!!#          ! init only till 7fff 
!!# 
!!#   ! D0_0000_0000 - DF_FFFF_FFFF
!!#   IJ_set_rvar ("diag.j", 205, Rv_jbiaddr_pattern4,
!!#         "24'{0},"
!!# 
!!#         "20'b 0000 0000 1101 0000 0101,"
!!#         "20'b 1110 1111 000r rr00 0000,");
!!#          ! init only till 7fff 
!!# 
!!#   ! E0_0000_0000 - EF_FFFF_FFFF
!!#   IJ_set_rvar ("diag.j", 217, Rv_jbiaddr_pattern5,
!!#         "24'{0},"
!!# 
!!#         "20'b 0000 0000 1101 0000 0110,"
!!#         "20'b 1110 1111 000r rr00 0000,");
!!#          ! init only till 7fff 
!!# 
!!#   ! F0_0000_0000 - FE_FFFF_FFFF ( Should not be FF*)
!!#   IJ_set_rvar ("diag.j", 229, Rv_jbiaddr_pattern6,
!!#         "24'{0},"
!!# 
!!#         "20'b 0000 0000 1101 0000 0111,"
!!#         "20'b 1110 1111 000r rr00 0000,");
!!#          ! init only till 7fff 
!!# 
!!#   ! FF_F000_0000 - FF_FFFF_FFFF 
!!#   IJ_set_rvar ("diag.j", 239, Rv_ssiaddr_pattern,
!!#         "24'{0},"
!!# 
!!#         "20'b 1111 1111 1111 rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr r000,");
!!# 
!!#   ! Other  cases ?? when LOW TH and HG TH are random, HI>LO always (TBD)
!!# 
!!#   IJ_set_rvar ("diag.j", 250, Rv_jbi_fifo_wr0_config,
!!#         "24'{0},"
!!# 
!!#         "20'b 0000 0000 0rrr 0rrr 00rr,"
!!#         "20'b 00rr rrrr 0000 0000 rrrr,");
!!# 
!!#   IJ_set_rvar ("diag.j", 258, Rv_jbi_fifo_wr1_config,
!!#         "24'{0},"
!!# 
!!#         "20'b 0000 0000 0rrr 0rrr 00rr,"
!!#         "20'b 00rr rrrr 1rrr 0000 rrrr,");
!!# 
!!#   IJ_set_ropr_fld    ("diag.j", 266, ijdefault, Ft_Rs1, "{6,7,9,10,11,12,13}");  ! BASE
!!#   IJ_set_ropr_fld    ("diag.j", 267, ijdefault, Ft_Rs2, "{8}");
!!#   !IJ_set_ropr_fld    (ijdefault, Ft_Rd, "{16..23}");
!!#   !IJ_set_ropr_fld    (Rv_ldstD, Ft_Rd, "{16,18,20,22}");
!!#   IJ_set_ropr_fld    ("diag.j", 270, ijdefault, Ft_Rd, "{16,18,20,22}");
!!# 
!!#   !IJ_set_ropr_fld    (ijdefault, Ft_Simm13, "13'b0 0000 0000 0000");
!!#   IJ_set_ropr_fld    ("diag.j", 273, ijdefault, Ft_Simm13, "13'b0 0000 00rr r000");
!!#   IJ_set_ropr_fld    ("diag.j", 274, ijdefault, Ft_Imm_Asi, "{0}");
!!# 
!!#   IJ_bind_file_group("diag.j", 278, sjm_4,"sjm_4.cmd", NULL);;
!!#   IJ_bind_file_group("diag.j", 279, sjm_5,"sjm_5.cmd", NULL);;
!!# 
!!#   IJ_bind_thread_group("diag.j", 282, th_M, 0x1);
!!# 
!!#   IJ_printf ("diag.j", 284, sjm_4, "CONFIG id=28 iosyncadr=0x7CF00BEEF00\n");
!!#   IJ_printf ("diag.j", 285, sjm_4, "TIMEOUT 10000000\n");
!!#   IJ_printf ("diag.j", 286, sjm_4, "IOSYNC\n");
!!# 
!!#   IJ_printf ("diag.j", 288, sjm_4, "#==================================================\n");
!!#   IJ_printf ("diag.j", 290, sjm_4, "#==================================================\n");
!!#   IJ_printf ("diag.j", 291, sjm_4, "\n\nLABEL_0:\n");
!!# 
!!#   IJ_printf ("diag.j", 293, sjm_5, "CONFIG id=30 iosyncadr=0x7EF00BEEF00\n");
!!#   IJ_printf ("diag.j", 294, sjm_5, "TIMEOUT 10000000\n");
!!#   IJ_printf ("diag.j", 295, sjm_5, "IOSYNC\n");
!!#   IJ_printf ("diag.j", 296, sjm_5, "#==================================================\n");
!!#   IJ_printf ("diag.j", 298, sjm_5, "#==================================================\n");
!!#   IJ_printf ("diag.j", 299, sjm_5, "\n\nLABEL_0:\n");
!!# 
!!#   IJ_init_regs_by_setx ("diag.j", 302, th_M, 3, 1, Rv_rand64);
!!#   IJ_printf ("diag.j", 303, th_M, "\tmov\t0, %%r8\n");
!!# 
!!#   IJ_printf ("diag.j", 305, th_M, "\tsetx\t0x%016llrx, %%r1, %%r6\n", Rv_jbiaddr_pattern0);
!!#   IJ_printf ("diag.j", 306, th_M, "\tsetx\t0x%016llrx, %%r1, %%r7\n", Rv_jbiaddr_pattern1);
!!#   IJ_printf ("diag.j", 307, th_M, "\tsetx\t0x%016llrx, %%r1, %%r9\n", Rv_jbiaddr_pattern2);
!!#   IJ_printf ("diag.j", 308, th_M, "\tsetx\t0x%016llrx, %%r1, %%r10\n", Rv_jbiaddr_pattern3);
!!#   IJ_printf ("diag.j", 309, th_M, "\tsetx\t0x%016llrx, %%r1, %%r11\n", Rv_jbiaddr_pattern4);
!!#   IJ_printf ("diag.j", 310, th_M, "\tsetx\t0x%016llrx, %%r1, %%r12\n", Rv_jbiaddr_pattern5);
!!#   IJ_printf ("diag.j", 311, th_M, "\tsetx\t0x%016llrx, %%r1, %%r13\n", Rv_jbiaddr_pattern6);
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
!!#   IJ_printf ("diag.j", 343, sjm_4, "\n\nBA LABEL_0\n");
!!#   IJ_printf ("diag.j", 344, sjm_5, "\n\nBA LABEL_0\n");
!!# 
!!#   int i,j;
!!#   ! Do this else midas wont put any tsbs for the above.
!!#   for (i = 0; i < 16; i++) {
!!#     IJ_iseg_printf("diag.j", 349,ISEG, i, th_M, ".data\n");
!!#     for (j = 0; j < 256; j++) {
!!#     IJ_iseg_printf("diag.j", 351,ISEG, i, th_M, "\t.xword\t0x%016llrx\n", Rv_rand64);
!!#     }
!!#   }
!!# 
!!#   IJ_th_start ("diag.j", 356,Seq_Start, NULL, 2);
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
!!# 		IJ_generate ("diag.j", 802, th_M, $2);
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
!!#                    IJ_printf ("diag.j", 838, sjm_4, "\n");
!!#                      sjm4_cnt++;
!!# 
!!#                      sj4_ad =  IJ_get_rvar_val64("diag.j", 841, Rv_memaddr_pattern_dma);
!!#                      sjm0_addr[sjm_wr0] = sj4_ad; 
!!#                      IJ_printf ("diag.j", 843, sjm_4, "WRITEBLK  0x%016llx +\n",sj4_ad);
!!#                      IJ_update_rvar("diag.j", 844, Rv_memaddr_pattern_dma);
!!# 
!!#                       for (i=0;i<16;i++) { 
!!#                          !IJ_printf (sjm_4, "# debug %d \n",i);
!!#                          sjm0_data[sjm_wr0][i] = IJ_get_rvar_val32("diag.j", 848, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 849, Rv_rand32);
!!#                          if (i%4 == 0) {IJ_printf ("diag.j", 850, sjm_4, "        "); }
!!#                          IJ_printf ("diag.j", 851, sjm_4, "0x%08x ",sjm0_data[sjm_wr0][i]);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 853, sjm_4, "\n"); else 
!!#                             IJ_printf ("diag.j", 854, sjm_4, "+\n");
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
!!#                    IJ_printf ("diag.j", 867, sjm_4, "\n");
!!#                      sjm4_cnt--;
!!# 
!!#                      sj4_ad = sjm0_addr[sjm_rd0];
!!#                      IJ_printf ("diag.j", 872, sjm_4, "READBLK  0x%016llx +\n",sj4_ad);
!!# 
!!#                       for (i=0;i<16;i++) { 
!!#                          sjm4_dat = sjm0_data[sjm_rd0][i];
!!#                          if (i%4 == 0) IJ_printf ("diag.j", 876, sjm_4, "        ");
!!#                          IJ_printf ("diag.j", 877, sjm_4, "0x%08x ",sjm4_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 879, sjm_4, "\n"); else 
!!#                             IJ_printf ("diag.j", 880, sjm_4, "+\n");
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
!!#                    IJ_printf ("diag.j", 894, sjm_4, "\n");
!!#                      !sjm4_cnt--;
!!# 
!!#  		     sjm0_w_mask =  IJ_get_rvar_val32("diag.j", 898, Rv_rand_mask);
!!#                      IJ_update_rvar("diag.j", 899, Rv_rand_mask);
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
!!#                      IJ_printf ("diag.j", 916, sjm_4, "WRITEMSK  0x%016llx 0x%016llx +\n",sj4_ad,mask);
!!# 
!!#                       m_tmp = sjm0_w_mask;
!!#                       for (i=0;i<16;i++) { 
!!#                        if (m_tmp & 0x1 ) {
!!#                          sjm0_data[sjm_rd0][i] = IJ_get_rvar_val32("diag.j", 921, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 922, Rv_rand32);
!!#                          sjm4_dat = sjm0_data[sjm_rd0][i];
!!#                          if (i%4 == 0) IJ_printf ("diag.j", 924, sjm_4, "        ");
!!#                          IJ_printf ("diag.j", 925, sjm_4, "0x%08x ",sjm4_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 927, sjm_4, "\n"); else 
!!#                             IJ_printf ("diag.j", 928, sjm_4, "+\n");
!!#                            }
!!#                         } else {
!!#                          !sjm4_dat = sjm0_data[sjm_rd0][i];
!!#                          sjm4_dat = 0;
!!#                          if (i%4 == 0) IJ_printf ("diag.j", 933, sjm_4, "        ");
!!#                          IJ_printf ("diag.j", 934, sjm_4, "0x%08x ",sjm4_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 936, sjm_4, "\n"); else 
!!#                             IJ_printf ("diag.j", 937, sjm_4, "+\n");
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
!!#                    IJ_printf ("diag.j", 954, sjm_4, "\n");
!!#                      sjm4_cnt_io++;
!!# 
!!#                      sj4_ad =  IJ_get_rvar_val64("diag.j", 957, Rv_memaddr_pattern_io);
!!#                      sjm0_addr_io[sjm_wr0_io] = sj4_ad; 
!!#                      IJ_printf ("diag.j", 959, sjm_4, "WRITEBLKIO  0x%016llx +\n",sj4_ad);
!!#                      IJ_update_rvar("diag.j", 960, Rv_memaddr_pattern_io);
!!# 
!!#                       for (i=0;i<16;i++) { 
!!#                          !IJ_printf (sjm_4, "# debug %d \n",i);
!!#                          sjm0_data_io[sjm_wr0_io][i] = IJ_get_rvar_val32("diag.j", 964, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 965, Rv_rand32);
!!#                          if (i%4 == 0) {IJ_printf ("diag.j", 966, sjm_4, "        "); }
!!#                          IJ_printf ("diag.j", 967, sjm_4, "0x%08x ",sjm0_data_io[sjm_wr0_io][i]);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 969, sjm_4, "\n"); else 
!!#                             IJ_printf ("diag.j", 970, sjm_4, "+\n");
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
!!#                    IJ_printf ("diag.j", 983, sjm_4, "\n");
!!#                      sjm4_cnt_io--;
!!# 
!!#                      sj4_ad = sjm0_addr_io[sjm_rd0_io];
!!#                      IJ_printf ("diag.j", 988, sjm_4, "READBLKIO  0x%016llx +\n",sj4_ad);
!!# 
!!#                       for (i=0;i<16;i++) { 
!!#                          sjm4_dat = sjm0_data_io[sjm_rd0_io][i];
!!#                          if (i%4 == 0) IJ_printf ("diag.j", 992, sjm_4, "        ");
!!#                          IJ_printf ("diag.j", 993, sjm_4, "0x%08x ",sjm4_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 995, sjm_4, "\n"); else 
!!#                             IJ_printf ("diag.j", 996, sjm_4, "+\n");
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
!!#                    IJ_printf ("diag.j", 1011, sjm_4, "\n");
!!#                      sjm4_cnt_io1++;
!!# 
!!#                      sj4_ad =  IJ_get_rvar_val64("diag.j", 1014, Rv_memaddr_pattern_io);
!!#                      sjm0_addr_io1[sjm_wr0_io1] = sj4_ad; 
!!#                      IJ_printf ("diag.j", 1016, sjm_4, "WRITEIO  0x%016llx ",sj4_ad);
!!#                      IJ_update_rvar("diag.j", 1017, Rv_memaddr_pattern_io);
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
!!#                       IJ_printf ("diag.j", 1032, sjm_4, "%d ",b_sz);
!!#                       for (i=0;i<4;i++) { 
!!#                          !IJ_printf (sjm_4, "# debug %d \n",i);
!!#                          sjm0_data_io1[sjm_wr0_io1][i] = IJ_get_rvar_val32("diag.j", 1035, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 1036, Rv_rand32);
!!#                          IJ_printf ("diag.j", 1037, sjm_4, "0x%08x ",sjm0_data_io1[sjm_wr0_io1][i]);
!!#                          if((i==0) && ((b_sz == 1) | (b_sz == 2) | (b_sz == 4)) ) break; 
!!#                          if((i==1) && (b_sz == 8)) break; 
!!#                       }
!!#                       if ( random()%2 == 0) {
!!#                       IJ_printf ("diag.j", 1042, sjm_4, "\n");
!!#                       } else {
!!#                       IJ_printf ("diag.j", 1044, sjm_4, "\n");
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
!!#                    IJ_printf ("diag.j", 1058, sjm_4, "\n");
!!#                      sjm4_cnt_io1--;
!!# 
!!#                      sj4_ad = sjm0_addr_io1[sjm_rd0_io1];
!!#                      b_sz   = sjm0_data_io1[sjm_rd0_io1][15];
!!#                      IJ_printf ("diag.j", 1064, sjm_4, "READIO  0x%016llx %d ",sj4_ad,b_sz);
!!# 
!!#                       for (i=0;i<4;i++) {
!!#                          sjm4_dat = sjm0_data_io1[sjm_rd0_io1][i];
!!#                          IJ_printf ("diag.j", 1068, sjm_4, "0x%08x ",sjm4_dat);
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
!!#                    IJ_printf ("diag.j", 1083, sjm_4, "\n");
!!# 
!!#                      sj4_ad =  IJ_get_rvar_val64("diag.j", 1085, Rv_memaddr_pattern_io);
!!#                      sjm0_addr_m_io[sjm_wr0_m_io] = sj4_ad; 
!!#                      IJ_update_rvar("diag.j", 1087, Rv_memaddr_pattern_io);
!!# 
!!#                      sjm4_cnt_m_io++;
!!# 
!!#  		     sjm0_w_mask_m_io =  IJ_get_rvar_val32("diag.j", 1093, Rv_rand_mask);
!!#                      IJ_update_rvar("diag.j", 1094, Rv_rand_mask);
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
!!#                      IJ_printf ("diag.j", 1121, sjm_4, "WRITEMSKIO  0x%016llx 0x%04x  ",sj4_ad,mask);
!!#                      sjm0_data_m_io[sjm_wr0_m_io][15] = mask; ! data fifo , 15 stores address
!!# 
!!#                       m_tmp = sjm0_w_mask_m_io & 0xf;
!!#                       for (i=0;i<4;i++) { 
!!#                        if (m_tmp & 0x1 ) {
!!#                          sjm0_data_m_io[sjm_wr0_m_io][i] = IJ_get_rvar_val32("diag.j", 1127, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 1128, Rv_rand32);
!!#                          sjm4_dat = sjm0_data_m_io[sjm_wr0_m_io][i];
!!#                          !if (i%4 == 0) IJ_printf (sjm_4, "        ");
!!#                          IJ_printf ("diag.j", 1131, sjm_4, "0x%08x ",sjm4_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                              IJ_printf ("diag.j", 1133, sjm_4, "\n"); 
!!#                             !if (i==15 ) IJ_printf (sjm_4, "\n"); else 
!!#                             !IJ_printf (sjm_4, "+\n");
!!#                            }
!!#                         } else {
!!#                          !sjm4_dat = sjm0_data[sjm_rd0][i];
!!#                          sjm4_dat = 0;
!!#                          sjm0_data_m_io[sjm_wr0_m_io][i] = sjm4_dat;
!!#                          !if (i%4 == 0) IJ_printf (sjm_4, "        ");
!!#                          IJ_printf ("diag.j", 1142, sjm_4, "0x%08x ",sjm4_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             IJ_printf ("diag.j", 1144, sjm_4, "\n"); 
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
!!#                    IJ_printf ("diag.j", 1162, sjm_4, "\n");
!!#                      sjm4_cnt_m_io--;
!!# 
!!#                      sj4_ad = sjm0_addr_m_io[sjm_rd0_m_io];
!!#                      mask   = sjm0_data_m_io[sjm_rd0_m_io][15];
!!#                      IJ_printf ("diag.j", 1168, sjm_4, "READMSKIO   0x%016llx 0x%04llx  ",sj4_ad,mask);
!!# 
!!#                       for (i=0;i<4;i++) { 
!!#                          sjm4_dat = sjm0_data_m_io[sjm_rd0_m_io][i];
!!#                          !if (i%4 == 0) IJ_printf (sjm_4, "        ");
!!#                          IJ_printf ("diag.j", 1173, sjm_4, "0x%08x ",sjm4_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             IJ_printf ("diag.j", 1175, sjm_4, "\n");
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
!!#                    IJ_printf ("diag.j", 1193, sjm_5, "\n");
!!#                      sjm5_cnt++;
!!# 
!!#                      sj5_ad =  IJ_get_rvar_val64("diag.j", 1196, Rv_memaddr_pattern_dma);
!!#                      sjm1_addr[sjm_wr1] = sj5_ad; 
!!#                      IJ_printf ("diag.j", 1198, sjm_5, "WRITEBLK  0x%016llx +\n",sj5_ad);
!!#                      IJ_update_rvar("diag.j", 1199, Rv_memaddr_pattern_dma);
!!# 
!!#                       for (i=0;i<16;i++) { 
!!#                          sjm1_data[sjm_wr1][i] = IJ_get_rvar_val32("diag.j", 1202, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 1203, Rv_rand32);
!!#                          if (i%4 == 0) IJ_printf ("diag.j", 1204, sjm_5, "        ");
!!#                          IJ_printf ("diag.j", 1205, sjm_5, "0x%08x ",sjm1_data[sjm_wr1][i]);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 1207, sjm_5, "\n"); else 
!!#                             IJ_printf ("diag.j", 1208, sjm_5, "+\n");
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
!!#                    IJ_printf ("diag.j", 1221, sjm_5, "\n");
!!#                      sjm5_cnt--;
!!# 
!!#                      sj5_ad = sjm1_addr[sjm_rd1];
!!#                      IJ_printf ("diag.j", 1226, sjm_5, "READBLK  0x%016llx +\n",sj5_ad);
!!# 
!!#                       for (i=0;i<16;i++) { 
!!#                          sjm5_dat = sjm1_data[sjm_rd1][i];
!!#                          if (i%4 == 0) IJ_printf ("diag.j", 1230, sjm_5, "        ");
!!#                          IJ_printf ("diag.j", 1231, sjm_5, "0x%08x ",sjm5_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 1233, sjm_5, "\n"); else 
!!#                             IJ_printf ("diag.j", 1234, sjm_5, "+\n");
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
!!#                    IJ_printf ("diag.j", 1248, sjm_5, "\n");
!!#                      !sjm4_cnt--;
!!# 
!!#  		     sjm1_w_mask =  IJ_get_rvar_val32("diag.j", 1252, Rv_rand_mask);
!!#                      IJ_update_rvar("diag.j", 1253, Rv_rand_mask);
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
!!#                      IJ_printf ("diag.j", 1270, sjm_5, "WRITEMSK  0x%016llx 0x%016llx +\n",sj5_ad,mask);
!!# 
!!#                       m_tmp = sjm1_w_mask;
!!#                       for (i=0;i<16;i++) { 
!!#                        if (m_tmp & 0x1 ) {
!!#                          sjm1_data[sjm_rd1][i] = IJ_get_rvar_val32("diag.j", 1275, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 1276, Rv_rand32);
!!#                          sjm5_dat = sjm1_data[sjm_rd1][i];
!!#                          if (i%4 == 0) IJ_printf ("diag.j", 1278, sjm_5, "        ");
!!#                          IJ_printf ("diag.j", 1279, sjm_5, "0x%08x ",sjm5_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 1281, sjm_5, "\n"); else 
!!#                             IJ_printf ("diag.j", 1282, sjm_5, "+\n");
!!#                            }
!!#                         } else {
!!#                          !sjm5_dat = sjm1_data[sjm_rd1][i];
!!#                          sjm5_dat = 0;
!!#                          if (i%4 == 0) IJ_printf ("diag.j", 1287, sjm_5, "        ");
!!#                          IJ_printf ("diag.j", 1288, sjm_5, "0x%08x ",sjm5_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 1290, sjm_5, "\n"); else 
!!#                             IJ_printf ("diag.j", 1291, sjm_5, "+\n");
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
!!#                    IJ_printf ("diag.j", 1308, sjm_5, "\n");
!!#                      sjm5_cnt_io++;
!!# 
!!#                      sj5_ad =  IJ_get_rvar_val64("diag.j", 1311, Rv_memaddr_pattern_io);
!!#                      sjm1_addr_io[sjm_wr1_io] = sj5_ad; 
!!#                      IJ_printf ("diag.j", 1313, sjm_5, "WRITEBLKIO  0x%016llx +\n",sj5_ad);
!!#                      IJ_update_rvar("diag.j", 1314, Rv_memaddr_pattern_io);
!!# 
!!#                       for (i=0;i<16;i++) { 
!!#                          !IJ_printf (sjm_5, "# debug %d \n",i);
!!#                          sjm1_data_io[sjm_wr1_io][i] = IJ_get_rvar_val32("diag.j", 1318, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 1319, Rv_rand32);
!!#                          if (i%4 == 0) {IJ_printf ("diag.j", 1320, sjm_5, "        "); }
!!#                          IJ_printf ("diag.j", 1321, sjm_5, "0x%08x ",sjm1_data_io[sjm_wr1_io][i]);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 1323, sjm_5, "\n"); else 
!!#                             IJ_printf ("diag.j", 1324, sjm_5, "+\n");
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
!!#                    IJ_printf ("diag.j", 1337, sjm_5, "\n");
!!#                      sjm5_cnt_io--;
!!# 
!!#                      sj5_ad = sjm1_addr_io[sjm_rd1_io];
!!#                      IJ_printf ("diag.j", 1342, sjm_5, "READBLKIO  0x%016llx +\n",sj5_ad);
!!# 
!!#                       for (i=0;i<16;i++) { 
!!#                          sjm5_dat = sjm1_data_io[sjm_rd1_io][i];
!!#                          if (i%4 == 0) IJ_printf ("diag.j", 1346, sjm_5, "        ");
!!#                          IJ_printf ("diag.j", 1347, sjm_5, "0x%08x ",sjm5_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 1349, sjm_5, "\n"); else 
!!#                             IJ_printf ("diag.j", 1350, sjm_5, "+\n");
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
!!#                    IJ_printf ("diag.j", 1366, sjm_5, "\n");
!!#                      sjm5_cnt_io1++;
!!# 
!!#                      sj5_ad =  IJ_get_rvar_val64("diag.j", 1369, Rv_memaddr_pattern_io);
!!#                      sjm1_addr_io1[sjm_wr1_io1] = sj5_ad; 
!!#                      IJ_printf ("diag.j", 1371, sjm_5, "WRITEIO  0x%016llx ",sj5_ad);
!!#                      IJ_update_rvar("diag.j", 1372, Rv_memaddr_pattern_io);
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
!!#                       IJ_printf ("diag.j", 1387, sjm_5, "%d ",b_sz);
!!#                       for (i=0;i<4;i++) { 
!!#                          !IJ_printf (sjm_5, "# debug %d \n",i);
!!#                          sjm1_data_io1[sjm_wr1_io1][i] = IJ_get_rvar_val32("diag.j", 1390, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 1391, Rv_rand32);
!!#                          IJ_printf ("diag.j", 1392, sjm_5, "0x%08x ",sjm1_data_io1[sjm_wr1_io1][i]);
!!#                          if((i==0) && ((b_sz == 1) | (b_sz == 2) | (b_sz == 4)) ) break; 
!!#                          if((i==1) && (b_sz == 8)) break; 
!!#                       }
!!#                       if ( random()%2 == 0) {
!!#                       IJ_printf ("diag.j", 1397, sjm_5, "\n");
!!#                       } else {
!!#                       IJ_printf ("diag.j", 1399, sjm_5, "\n");
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
!!#                    IJ_printf ("diag.j", 1413, sjm_5, "\n");
!!#                      sjm5_cnt_io1--;
!!# 
!!#                      sj5_ad = sjm1_addr_io1[sjm_rd1_io1];
!!#                      b_sz   = sjm1_data_io1[sjm_rd1_io1][15];
!!#                      IJ_printf ("diag.j", 1419, sjm_5, "READIO  0x%016llx %d ",sj5_ad,b_sz);
!!# 
!!#                       for (i=0;i<4;i++) {
!!#                          sjm5_dat = sjm1_data_io1[sjm_rd1_io1][i];
!!#                          IJ_printf ("diag.j", 1423, sjm_5, "0x%08x ",sjm5_dat);
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
!!#                    IJ_printf ("diag.j", 1438, sjm_5, "\n");
!!# 
!!#                      sj5_ad =  IJ_get_rvar_val64("diag.j", 1440, Rv_memaddr_pattern_io);
!!#                      sjm1_addr_m_io[sjm_wr1_m_io] = sj5_ad; 
!!#                      IJ_update_rvar("diag.j", 1442, Rv_memaddr_pattern_io);
!!# 
!!#                      sjm5_cnt_m_io++;
!!# 
!!#  		     sjm1_w_mask_m_io =  IJ_get_rvar_val32("diag.j", 1448, Rv_rand_mask);
!!#                      IJ_update_rvar("diag.j", 1449, Rv_rand_mask);
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
!!#                      IJ_printf ("diag.j", 1476, sjm_5, "WRITEMSKIO  0x%016llx 0x%04x  ",sj5_ad,mask);
!!#                      sjm1_data_m_io[sjm_wr1_m_io][15] = mask; ! data fifo , 15 stores address
!!# 
!!#                       m_tmp = sjm1_w_mask_m_io & 0xf;
!!#                       for (i=0;i<4;i++) { 
!!#                        if (m_tmp & 0x1 ) {
!!#                          sjm1_data_m_io[sjm_wr1_m_io][i] = IJ_get_rvar_val32("diag.j", 1482, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 1483, Rv_rand32);
!!#                          sjm5_dat = sjm1_data_m_io[sjm_wr1_m_io][i];
!!#                          !if (i%4 == 0) IJ_printf (sjm_5, "        ");
!!#                          IJ_printf ("diag.j", 1486, sjm_5, "0x%08x ",sjm5_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                              IJ_printf ("diag.j", 1488, sjm_5, "\n"); 
!!#                             !if (i==15 ) IJ_printf (sjm_5, "\n"); else 
!!#                             !IJ_printf (sjm_5, "+\n");
!!#                            }
!!#                         } else {
!!#                          !sjm5_dat = sjm1_data[sjm_rd1][i];
!!#                          sjm5_dat = 0;
!!#                          sjm1_data_m_io[sjm_wr1_m_io][i] = sjm5_dat;
!!#                          !if (i%4 == 0) IJ_printf (sjm_5, "        ");
!!#                          IJ_printf ("diag.j", 1497, sjm_5, "0x%08x ",sjm5_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             IJ_printf ("diag.j", 1499, sjm_5, "\n"); 
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
!!#                    IJ_printf ("diag.j", 1517, sjm_5, "\n");
!!#                      sjm5_cnt_m_io--;
!!# 
!!#                      sj5_ad = sjm1_addr_m_io[sjm_rd1_m_io];
!!#                      mask   = sjm1_data_m_io[sjm_rd1_m_io][15];
!!#                      IJ_printf ("diag.j", 1523, sjm_5, "READMSKIO   0x%016llx 0x%04llx  ",sj5_ad,mask);
!!# 
!!#                       for (i=0;i<4;i++) { 
!!#                          sjm5_dat = sjm1_data_m_io[sjm_rd1_m_io][i];
!!#                          !if (i%4 == 0) IJ_printf (sjm_5, "        ");
!!#                          IJ_printf ("diag.j", 1528, sjm_5, "0x%08x ",sjm5_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             IJ_printf ("diag.j", 1530, sjm_5, "\n");
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
!!#                       IJ_printf ("diag.j", 1574, th_M, "\tsetx\t0x%016llrx, %%r1, %%r6\n",
!!#                               Rv_jbiaddr_pattern0);
!!#                       IJ_printf ("diag.j", 1576, th_M, "\tsetx\t0x%016llrx, %%r1, %%r7\n",
!!#                               Rv_memaddr_pattern);
!!#                       IJ_printf ("diag.j", 1578, th_M, "\tsetx\t0x%016llrx, %%r1, %%r9\n",
!!#                               Rv_jbiaddr_pattern2);
!!#                       IJ_printf ("diag.j", 1580, th_M, "\tsetx\t0x%016llrx, %%r1, %%r10\n",
!!#                               Rv_memaddr_pattern);
!!#                       IJ_printf ("diag.j", 1582, th_M, "\tsetx\t0x%016llrx, %%r1, %%r11\n",
!!#                               Rv_jbiaddr_pattern4);
!!#                       IJ_printf ("diag.j", 1584, th_M, "\tsetx\t0x%016llrx, %%r1, %%r12\n",
!!#                               Rv_memaddr_pattern);
!!#                       IJ_printf ("diag.j", 1586, th_M, "\tsetx\t0x%016llrx, %%r1, %%r13\n",
!!#                               Rv_jbiaddr_pattern6);
!!#                       } else { 
!!#                       IJ_printf ("diag.j", 1589, th_M, "\tsetx\t0x%016llrx, %%r1, %%r6\n",
!!#                               Rv_jbiaddr_pattern1);
!!#                       IJ_printf ("diag.j", 1591, th_M, "\tsetx\t0x%016llrx, %%r1, %%r7\n",
!!#                               Rv_memaddr_pattern);
!!#                       IJ_printf ("diag.j", 1593, th_M, "\tsetx\t0x%016llrx, %%r1, %%r9\n",
!!#                               Rv_jbiaddr_pattern3);
!!#                       IJ_printf ("diag.j", 1595, th_M, "\tsetx\t0x%016llrx, %%r1, %%r10\n",
!!#                               Rv_memaddr_pattern);
!!#                       IJ_printf ("diag.j", 1597, th_M, "\tsetx\t0x%016llrx, %%r1, %%r11\n",
!!#                               Rv_jbiaddr_pattern5);
!!#                       IJ_printf ("diag.j", 1599, th_M, "\tsetx\t0x%016llrx, %%r1, %%r12\n",
!!#                               Rv_memaddr_pattern);
!!#                       IJ_printf ("diag.j", 1601, th_M, "\tsetx\t0x%016llrx, %%r1, %%r13\n",
!!#                               Rv_memaddr_pattern);
!!# 
!!#                       }
!!# 
!!#                     } else { 
!!#                      if(random()%2 == 1) {
!!#                       IJ_printf ("diag.j", 1608, th_M, "\tsetx\t0x%016llrx, %%r1, %%r6\n",
!!#                               Rv_jbiaddr_pattern0);
!!#                       IJ_printf ("diag.j", 1610, th_M, "\tsetx\t0x%016llrx, %%r1, %%r7\n",
!!#                               Rv_jbiaddr_pattern1);
!!#                       IJ_printf ("diag.j", 1612, th_M, "\tsetx\t0x%016llrx, %%r1, %%r9\n",
!!#                               Rv_jbiaddr_pattern2);
!!#                       IJ_printf ("diag.j", 1614, th_M, "\tsetx\t0x%016llrx, %%r1, %%r10\n",
!!#                               Rv_jbiaddr_pattern3);
!!#                       IJ_printf ("diag.j", 1616, th_M, "\tsetx\t0x%016llrx, %%r1, %%r11\n",
!!#                               Rv_jbiaddr_pattern4);
!!#                       IJ_printf ("diag.j", 1618, th_M, "\tsetx\t0x%016llrx, %%r1, %%r12\n",
!!#                               Rv_jbiaddr_pattern5);
!!#                       IJ_printf ("diag.j", 1620, th_M, "\tsetx\t0x%016llrx, %%r1, %%r13\n",
!!#                               Rv_jbiaddr_pattern6);
!!#                       } else { 
!!#                       IJ_printf ("diag.j", 1623, th_M, "\tsetx\t0x%016llrx, %%r1, %%r6\n",
!!#                               Rv_memaddr_pattern);
!!#                       IJ_printf ("diag.j", 1625, th_M, "\tsetx\t0x%016llrx, %%r1, %%r7\n",
!!#                               Rv_memaddr_pattern);
!!#                       IJ_printf ("diag.j", 1627, th_M, "\tsetx\t0x%016llrx, %%r1, %%r9\n",
!!#                               Rv_memaddr_pattern);
!!#                       IJ_printf ("diag.j", 1629, th_M, "\tsetx\t0x%016llrx, %%r1, %%r10\n",
!!#                               Rv_memaddr_pattern);
!!#                       IJ_printf ("diag.j", 1631, th_M, "\tsetx\t0x%016llrx, %%r1, %%r11\n",
!!#                               Rv_memaddr_pattern);
!!#                       IJ_printf ("diag.j", 1633, th_M, "\tsetx\t0x%016llrx, %%r1, %%r12\n",
!!#                               Rv_memaddr_pattern);
!!#                       IJ_printf ("diag.j", 1635, th_M, "\tsetx\t0x%016llrx, %%r1, %%r13\n",
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
!!#                         rnd_cnt = random() %7;
!!#                         switch (rnd_cnt) {
!!#                         case 0 : IJ_printf ("diag.j", 1648, th_M, "\tldda\t[%%r6]ASI_BLK_P, %%f0\n"); break;
!!#                         case 1 : IJ_printf ("diag.j", 1649, th_M, "\tldda\t[%%r7]ASI_BLK_P, %%f0\n"); break;
!!#                         case 2 : IJ_printf ("diag.j", 1650, th_M, "\tldda\t[%%r9]ASI_BLK_P, %%f0\n"); break;
!!#                         case 3 : IJ_printf ("diag.j", 1651, th_M, "\tldda\t[%%r10]ASI_BLK_P, %%f0\n"); break;
!!#                         case 4 : IJ_printf ("diag.j", 1652, th_M, "\tldda\t[%%r11]ASI_BLK_P, %%f0\n"); break;
!!#                         case 5 : IJ_printf ("diag.j", 1653, th_M, "\tldda\t[%%r12]ASI_BLK_P, %%f0\n"); break;
!!#                         case 6 : IJ_printf ("diag.j", 1654, th_M, "\tldda\t[%%r13]ASI_BLK_P, %%f0\n"); break;
!!#                         default : IJ_printf ("diag.j", 1655, th_M, "\tldda\t[%%r8]ASI_BLK_P, %%f0\n"); break;
!!#                         }
!!#                         IJ_printf ("diag.j", 1657, th_M, "\tmembar\t 0x40\n");
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
!!#                         case 0 : IJ_printf ("diag.j", 1668, th_M, "\tstda\t %%f0, [%%r6]ASI_BLK_P\n"); break;
!!#                         case 1 : IJ_printf ("diag.j", 1669, th_M, "\tstda\t %%f0, [%%r7]ASI_BLK_P\n"); break;
!!#                         case 2 : IJ_printf ("diag.j", 1670, th_M, "\tstda\t %%f0, [%%r9]ASI_BLK_P\n"); break;
!!#                         case 3 : IJ_printf ("diag.j", 1671, th_M, "\tstda\t %%f0, [%%r10]ASI_BLK_P\n"); break;
!!#                         case 4 : IJ_printf ("diag.j", 1672, th_M, "\tstda\t %%f0, [%%r11]ASI_BLK_P\n"); break;
!!#                         case 5 : IJ_printf ("diag.j", 1673, th_M, "\tstda\t %%f0, [%%r12]ASI_BLK_P\n"); break;
!!#                         case 6 : IJ_printf ("diag.j", 1674, th_M, "\tstda\t %%f0, [%%r13]ASI_BLK_P\n"); break;
!!#                         default  : IJ_printf ("diag.j", 1675, th_M, "\tstda\t %%f0, [%%r7]ASI_BLK_P\n"); break;
!!#                         }
!!#                         IJ_printf ("diag.j", 1677, th_M, "\tmembar\t 0x40\n");
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
