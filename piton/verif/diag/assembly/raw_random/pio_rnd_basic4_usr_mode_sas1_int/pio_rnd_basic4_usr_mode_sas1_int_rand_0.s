// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: pio_rnd_basic4_usr_mode_sas1_int_rand_0.s
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
   random seed:	33367975
   Jal pio_rnd_basic4_usr_mode_sas1_int.j:	
********************************************************************************/



#define JBI_CONFIG
#define ASI_SWVR_INTR_RECEIVE		0x72
#define ASI_SWVR_UDB_INTR_W		0x73
#define ASI_SWVR_UDB_INTR_R		0x74

#define  tmp0 %l0
#define  tmp1 %l1
#define  tmp2 %l2
#define  tmp3 %l3
#define  flagr %g5

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

	setx 0x323cefe23ca5a795, %g1, %g0
	setx 0x14f060a355077aa2, %g1, %g1
	setx 0xe7af0c8d309ff550, %g1, %g2
	setx 0x5fa035b8d9cc58c4, %g1, %g3
	setx 0x95d3b4973c2a002c, %g1, %g4
	setx 0x73e7b0973ae7a075, %g1, %g5
	setx 0x0e7a0fb7ef32654d, %g1, %g6
	setx 0x8c185c88419d6dfa, %g1, %g7
	setx 0x24db48d846642503, %g1, %r16
	setx 0x23cedf72e88739c9, %g1, %r17
	setx 0xf644fa06b77c6d33, %g1, %r18
	setx 0x6c380eb6d6144d40, %g1, %r19
	setx 0xfd34ea64ef10bdeb, %g1, %r20
	setx 0xd09826c3d80470eb, %g1, %r21
	setx 0x040f907281c79dbc, %g1, %r22
	setx 0x2d0050acb024956a, %g1, %r23
	setx 0xdfb61b703493bb7e, %g1, %r24
	setx 0x3f6dde98f7649d57, %g1, %r25
	setx 0xa6185fb2883e6731, %g1, %r26
	setx 0x37ee146d1e27481e, %g1, %r27
	setx 0xdfca2e01f01db053, %g1, %r28
	setx 0x478474ed029c8aab, %g1, %r29
	setx 0xe963feaaa6f4be16, %g1, %r30
	setx 0x3d86f2498bc21fa5, %g1, %r31
	save
	setx 0xf90dcd605ca6e716, %g1, %r16
	setx 0x24acac347b64484b, %g1, %r17
	setx 0x836cea3304ad97aa, %g1, %r18
	setx 0x1a336cfd50ee2804, %g1, %r19
	setx 0xd3a3b99feb8eff9e, %g1, %r20
	setx 0x14d17f0933791381, %g1, %r21
	setx 0x7972ec1146909a16, %g1, %r22
	setx 0xf8fd2e8f64727d81, %g1, %r23
	setx 0x113edb4d608204fa, %g1, %r24
	setx 0xd78811aa430ad388, %g1, %r25
	setx 0xda3baaca8a0d30b3, %g1, %r26
	setx 0xdf70cf064391e732, %g1, %r27
	setx 0x424020a935d5a4a7, %g1, %r28
	setx 0xbc4acabb273d287c, %g1, %r29
	setx 0xe5762689b2155a64, %g1, %r30
	setx 0x7c4566a75fffe5ce, %g1, %r31
	save
	setx 0x04d1059b7c082121, %g1, %r16
	setx 0x15c6dbc84437c5ad, %g1, %r17
	setx 0x1ef87062acd0bd08, %g1, %r18
	setx 0x400bdee72df03c3d, %g1, %r19
	setx 0x4e61b7508f249f17, %g1, %r20
	setx 0x1945fb8673830568, %g1, %r21
	setx 0xf696933e71773503, %g1, %r22
	setx 0x8d9736e7545a27e7, %g1, %r23
	setx 0xcd304d35af013499, %g1, %r24
	setx 0x832dad2f3bf1afbf, %g1, %r25
	setx 0xb1da5bc26b5f496c, %g1, %r26
	setx 0xbf5db26c834eda66, %g1, %r27
	setx 0x9a15e38ef3efa1ca, %g1, %r28
	setx 0x21710779e96d0a34, %g1, %r29
	setx 0x8a9c82f35f647dfc, %g1, %r30
	setx 0x8406dcfb41950c69, %g1, %r31
	restore
	mov	0, %r8
	setx	0x00000000d01ef140, %r1, %r6
	setx	0x00000000d02ef180, %r1, %r7
	setx	0x00000000d03ef180, %r1, %r9
	setx	0x00000000d04ef0c0, %r1, %r10
	setx	0x00000000d05ef100, %r1, %r11
	setx	0x00000000d06ef140, %r1, %r12
	setx	0x00000000d07ef140, %r1, %r13
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xe0332000  ! 3: STH_I	sth	%r16, [%r12 + 0x0000]
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xee430008  ! 5: LDSW_R	ldsw	[%r12 + %r8], %r23
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe241c008  ! 11: LDSW_R	ldsw	[%r7 + %r8], %r17
	.word 0xe232c008  ! 12: STH_R	sth	%r17, [%r11 + %r8]
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe80b2028  ! 16: LDUB_I	ldub	[%r12 + 0x0028], %r20
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe6228008  ! 19: STW_R	stw	%r19, [%r10 + %r8]
	.word 0xaec1a018  ! 20: ADDCcc_I	addccc 	%r6, 0x0018, %r23
	ldda	[%r9]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe611c008  ! 27: LDUH_R	lduh	[%r7 + %r8], %r19
	.word 0xe032c008  ! 29: STH_R	sth	%r16, [%r11 + %r8]
	.word 0xec2b6008  ! 30: STB_I	stb	%r22, [%r13 + 0x0008]
	.word 0xee39e008  ! 31: STD_I	std	%r23, [%r7 + 0x0008]
	.word 0xec324008  ! 32: STH_R	sth	%r22, [%r9 + %r8]
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	.word 0xea3b0008  ! 35: STD_R	std	%r21, [%r12 + %r8]
	.word 0xe009a028  ! 36: LDUB_I	ldub	[%r6 + 0x0028], %r16
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r9]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xe6218008  ! 42: STW_R	stw	%r19, [%r6 + %r8]
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r9]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xec2b2038  ! 49: STB_I	stb	%r22, [%r12 + 0x0038]
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	.word 0xec218008  ! 58: STW_R	stw	%r22, [%r6 + %r8]
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r9]ASI_BLK_P
	membar	 0x40
	.word 0xee42e030  ! 64: LDSW_I	ldsw	[%r11 + 0x0030], %r23
	.word 0xe84ac008  ! 65: LDSB_R	ldsb	[%r11 + %r8], %r20
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r9]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r9]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	setx	0x00000000d01ef140, %r1, %r6
	setx	0x00000000d02ef100, %r1, %r7
	setx	0x00000000d03ef1c0, %r1, %r9
	setx	0x00000000d04ef040, %r1, %r10
	setx	0x00000000d05ef040, %r1, %r11
	setx	0x00000000d06ef180, %r1, %r12
	setx	0x00000000d07ef0c0, %r1, %r13
	.word 0xea2b0008  ! 78: STB_R	stb	%r21, [%r12 + %r8]
	.word 0xec39c008  ! 79: STD_R	std	%r22, [%r7 + %r8]
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r9]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe021a038  ! 82: STW_I	stw	%r16, [%r6 + 0x0038]
	setx	0x00000000d01ef0c0, %r1, %r6
	setx	0x00000000d02ef040, %r1, %r7
	setx	0x00000000d03ef100, %r1, %r9
	setx	0x00000000d04ef0c0, %r1, %r10
	setx	0x00000000d05ef0c0, %r1, %r11
	setx	0x00000000d06ef040, %r1, %r12
	setx	0x00000000d07ef1c0, %r1, %r13
	.word 0xec22e018  ! 87: STW_I	stw	%r22, [%r11 + 0x0018]
	.word 0xe04aa008  ! 88: LDSB_I	ldsb	[%r10 + 0x0008], %r16
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xee018008  ! 91: LDUW_R	lduw	[%r6 + %r8], %r23
	.word 0xe0098008  ! 92: LDUB_R	ldub	[%r6 + %r8], %r16
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe612a018  ! 96: LDUH_I	lduh	[%r10 + 0x0018], %r19
	.word 0xe022c008  ! 98: STW_R	stw	%r16, [%r11 + %r8]
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r9]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xea3a8008  ! 103: STD_R	std	%r21, [%r10 + %r8]
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	.word 0xe2434008  ! 108: LDSW_R	ldsw	[%r13 + %r8], %r17
	.word 0xea4b2008  ! 109: LDSB_I	ldsb	[%r12 + 0x0008], %r21
	.word 0xa601c008  ! 111: ADD_R	add 	%r7, %r8, %r19
	stda	 %f0, [%r9]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	.word 0xec036028  ! 114: LDUW_I	lduw	[%r13 + 0x0028], %r22
	.word 0xec3b0008  ! 116: STD_R	std	%r22, [%r12 + %r8]
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xee728008  ! 119: STX_R	stx	%r23, [%r10 + %r8]
	.word 0xe601a038  ! 121: LDUW_I	lduw	[%r6 + 0x0038], %r19
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r9]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xee59a038  ! 124: LDX_I	ldx	[%r6 + 0x0038], %r23
	.word 0xe819e000  ! 125: LDD_I	ldd	[%r7 + 0x0000], %r20
	.word 0xe659a008  ! 127: LDX_I	ldx	[%r6 + 0x0008], %r19
	.word 0xe032c008  ! 129: STH_R	sth	%r16, [%r11 + %r8]
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	ldda	[%r9]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe0232008  ! 134: STW_I	stw	%r16, [%r12 + 0x0008]
	.word 0xea398008  ! 135: STD_R	std	%r21, [%r6 + %r8]
	.word 0xe84b0008  ! 136: LDSB_R	ldsb	[%r12 + %r8], %r20
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xee436000  ! 138: LDSW_I	ldsw	[%r13 + 0x0000], %r23
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe83b6030  ! 142: STD_I	std	%r20, [%r13 + 0x0030]
	.word 0xec136030  ! 146: LDUH_I	lduh	[%r13 + 0x0030], %r22
	stda	 %f0, [%r9]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xe6334008  ! 151: STH_R	sth	%r19, [%r13 + %r8]
	stda	 %f0, [%r9]ASI_BLK_P
	membar	 0x40
	.word 0xe629e018  ! 154: STB_I	stb	%r19, [%r7 + 0x0018]
	.word 0xe20b4008  ! 155: LDUB_R	ldub	[%r13 + %r8], %r17
	.word 0xe821a010  ! 156: STW_I	stw	%r20, [%r6 + 0x0010]
	.word 0xea230008  ! 158: STW_R	stw	%r21, [%r12 + %r8]
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xa6a1a028  ! 164: SUBcc_I	subcc 	%r6, 0x0028, %r19
	ldda	[%r9]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe4424008  ! 170: LDSW_R	ldsw	[%r9 + %r8], %r18
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe4532008  ! 172: LDSH_I	ldsh	[%r12 + 0x0008], %r18
	.word 0xe8536008  ! 173: LDSH_I	ldsh	[%r13 + 0x0008], %r20
	.word 0xe231a000  ! 174: STH_I	sth	%r17, [%r6 + 0x0000]
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r9]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xea21c008  ! 180: STW_R	stw	%r21, [%r7 + %r8]
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	ldda	[%r9]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe42b6028  ! 183: STB_I	stb	%r18, [%r13 + 0x0028]
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xe011a030  ! 186: LDUH_I	lduh	[%r6 + 0x0030], %r16
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xee528008  ! 196: LDSH_R	ldsh	[%r10 + %r8], %r23
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec29a018  ! 213: STB_I	stb	%r22, [%r6 + 0x0018]
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xee5ac008  ! 218: LDX_R	ldx	[%r11 + %r8], %r23
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xea226030  ! 222: STW_I	stw	%r21, [%r9 + 0x0030]
	.word 0xe0730008  ! 223: STX_R	stx	%r16, [%r12 + %r8]
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xee018008  ! 225: LDUW_R	lduw	[%r6 + %r8], %r23
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe02b2008  ! 228: STB_I	stb	%r16, [%r12 + 0x0008]
	.word 0xee026008  ! 230: LDUW_I	lduw	[%r9 + 0x0008], %r23
	.word 0xec518008  ! 231: LDSH_R	ldsh	[%r6 + %r8], %r22
	.word 0xea42c008  ! 232: LDSW_R	ldsw	[%r11 + %r8], %r21
	.word 0xe031e028  ! 233: STH_I	sth	%r16, [%r7 + 0x0028]
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xee2a6028  ! 236: STB_I	stb	%r23, [%r9 + 0x0028]
	.word 0xea736008  ! 241: STX_I	stx	%r21, [%r13 + 0x0008]
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	ldda	[%r9]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xae026028  ! 248: ADD_I	add 	%r9, 0x0028, %r23
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe2436010  ! 250: LDSW_I	ldsw	[%r13 + 0x0010], %r17
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	.word 0xe64ae018  ! 258: LDSB_I	ldsb	[%r11 + 0x0018], %r19
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe822a028  ! 264: STW_I	stw	%r20, [%r10 + 0x0028]
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xe449e000  ! 270: LDSB_I	ldsb	[%r7 + 0x0000], %r18
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r9]ASI_BLK_P
	membar	 0x40
	.word 0xe0234008  ! 275: STW_R	stw	%r16, [%r13 + %r8]
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe6718008  ! 277: STX_R	stx	%r19, [%r6 + %r8]
	.word 0xec736038  ! 278: STX_I	stx	%r22, [%r13 + 0x0038]
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	.word 0xe801c008  ! 281: LDUW_R	lduw	[%r7 + %r8], %r20
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec49c008  ! 283: LDSB_R	ldsb	[%r7 + %r8], %r22
	.word 0xe2028008  ! 284: LDUW_R	lduw	[%r10 + %r8], %r17
	.word 0xe811e028  ! 286: LDUH_I	lduh	[%r7 + 0x0028], %r20
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe812e030  ! 295: LDUH_I	lduh	[%r11 + 0x0030], %r20
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r9]ASI_BLK_P
	membar	 0x40
	.word 0xee198008  ! 298: LDD_R	ldd	[%r6 + %r8], %r23
	setx	0x0000000000000007, %r1, %r6
	setx	 page1a, %r1, %r26
	ldx	[%r26], flagr
	cmp	%r6, flagr
	bne	bad_end
	nop



normal_end:
        ta      T_GOOD_TRAP

bad_end:
        ta      T_BAD_TRAP

user_text_end:

!***********************************************************************
!  Test case data start
!***********************************************************************
.data
user_data_start:
	.skip 1000
user_data_end:

SECTION .MY_HYP_SEC TEXT_VA = 0x1100000000, DATA_VA = 0x1100160000
attr_text {
        Name=.MY_HYP_SEC,
        hypervisor
	}

.global intr0x60_custom_trap
intr0x60_custom_trap:
	ldxa	[%g0] ASI_SWVR_INTR_RECEIVE, %g2;
	ldxa	[%g0] ASI_SWVR_UDB_INTR_R, %g1;	
        ! Check the correct vector is logged in the ASI interrupt registers.
        ldxa    [%g0] ASI_SWVR_UDB_INTR_R,     tmp0

       ! Read data J_INT_ADATA0
        !setx    0x0000009f00000600,     %l7,    tmp1
        !ldx     [tmp1], tmp2

       ! Read data J_INT_ADATA1
        !setx    0x0000009f00000700,     %l7,    tmp1
        !ldx     [tmp1], tmp2

       ! Clear interrupt busy bit.
        setx    0x0000009f00000b00,     %l7,    tmp1
        !ldx     [tmp1], tmp2
        stx     %g0,    [tmp1]

        setx   page1a,%l0,  %l7       ! set the data
        ldx   [%l7], tmp1
        inc     tmp1
        stx   tmp1, [%l7]

        !inc     flagr
	retry;

.global intr0x190_custom_trap
intr0x190_custom_trap:

       ! Clear interrupt busy bit.
        setx    0x0000009f00000b00,     %l7,    tmp1
        stx     %g0,    [tmp1]

! Initialize jbi interrupt vector.
        setx    0x0000009800000a00,     %l7,    tmp1
        set     0x4,        tmp2
        stx     tmp2,    [tmp1]

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

#define PAGE1A_ADDR 0x86660000
#define PAGE1A_ADDR_RA 0x86660000

SECTION .PAGE1A DATA_VA=PAGE1A_ADDR
attr_data {
        Name = .PAGE1A,
        VA=PAGE1A_ADDR, PA=PAGE1A_ADDR_RA, RA=PAGE1A_ADDR_RA,
        part_0_d_ctx_nonzero_ps0_tsb,
        TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=0, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=1
        }

.data
.global page1a

page1a :   .skip    256

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
	.xword	0x1b061c5bdef82225
	.xword	0x293b52f3960fd3a0
	.xword	0xe7cc40c0f834d4da
	.xword	0x7fd4552c673e8b1b
	.xword	0x4ecf3c9425b26d53
	.xword	0xd0727dedf469881b
	.xword	0xf7d4a03488adcd97
	.xword	0xee0c39b43851ba69
	.xword	0xa70292f1372eaf84
	.xword	0x70a30d958d49ab55
	.xword	0xab6637489d86fce1
	.xword	0x3da176a62900cf86
	.xword	0x7833fdb824f41522
	.xword	0x8f87a81d98f071fc
	.xword	0x6582c53294f3a874
	.xword	0xa1dd5e2c7e2cf19b
	.xword	0x602c9bcf8a445160
	.xword	0x8a9809aabef29729
	.xword	0x97d8cb4d4d0d4af4
	.xword	0x9a57c3ff422fcf70
	.xword	0x6ef3b41ce215f92a
	.xword	0x52cd6c3b522d788b
	.xword	0xb61788cebab52c65
	.xword	0x5d70ebb54fee8f27
	.xword	0xea672d21ef78883b
	.xword	0xee194e721adbdc5c
	.xword	0x701f3454b5963d12
	.xword	0x3ed6536c98ebf8fc
	.xword	0x079bed0060921796
	.xword	0xfc5d1bc7e358a101
	.xword	0xb1db1040da1d9e9e
	.xword	0x45deafa30173b5b2
	.xword	0xc63f1f07cd7711d6
	.xword	0xe49b0ee68b1b83bb
	.xword	0x8b8e594073e27529
	.xword	0xfae7d603ff18400c
	.xword	0x1fc1e99495f627ef
	.xword	0x3b0097d4011d5372
	.xword	0xa65776c178b64a43
	.xword	0x5076ad27b17f82ec
	.xword	0x2fc8c40ad16a13d1
	.xword	0xa55140f29016b2c1
	.xword	0xd316f444fc5182d8
	.xword	0x4f0d66c85a7ac773
	.xword	0x9fe0cca8f8b852bd
	.xword	0x752990925ebc965e
	.xword	0xd23465b3809b4f6a
	.xword	0xfdc135ed8ac62b6c
	.xword	0xeb73cb60829ce2fb
	.xword	0x8daa318bdca11bcc
	.xword	0x55b1b60d9ac9593f
	.xword	0x3bc49925dc0ec63e
	.xword	0x21b50fa0095476f6
	.xword	0xc873208048912e56
	.xword	0x359b8e1b28d0fbdf
	.xword	0xed0a308fdb16481b
	.xword	0xc5a5eeec3dcedd23
	.xword	0xb4b4c2eae145e714
	.xword	0x344bd2824b27e70e
	.xword	0xc938b96017264779
	.xword	0x6a514b9b38f0bd1d
	.xword	0x9824bb14315aa87b
	.xword	0xf59071142525986d
	.xword	0x63b59bea02d814da
	.xword	0x40bb73a7c9c50128
	.xword	0xaeb3d98d99d463bf
	.xword	0x34e72774ead3467f
	.xword	0x1ca9802b6379440c
	.xword	0x3cc44ac5df869d16
	.xword	0xcbc77ef30aefb685
	.xword	0xd41bcf8099b6f4bf
	.xword	0x227039e8d5cde085
	.xword	0xdc79d108735f7951
	.xword	0x18947c6c8e10459c
	.xword	0x64d6d7908f915f39
	.xword	0x6a42ffa2d00d0d9b
	.xword	0x2b4a98493a55de16
	.xword	0xb1c7a5b74efa7def
	.xword	0x85d3ea7a7ecad34b
	.xword	0x17bf767516077e8f
	.xword	0xa28dcf41eb7f502e
	.xword	0x50590f4bd2eb6803
	.xword	0xaa5f307e66153f57
	.xword	0xd72ab8a9f9405ad7
	.xword	0x336b54f00cde5ed8
	.xword	0x3cf074ddb5ebc6d9
	.xword	0xec62757814723bd8
	.xword	0xb426a97cc71f6f56
	.xword	0xa5954214f24c5bc6
	.xword	0x762d6e9aac8c22c1
	.xword	0xe681656a98cbedae
	.xword	0x1cab721f41cd9c83
	.xword	0xfdac3bab2ba79414
	.xword	0x6486b7c2aba229c9
	.xword	0xca931799e02c1af0
	.xword	0x2ef5e209850dcd53
	.xword	0x9ab37ab3cf66c792
	.xword	0x96c3f6024c3f7e1b
	.xword	0x90fbe8a1a137b7ba
	.xword	0x7f2d2948ae5ff99d
	.xword	0x310fb2eba48be4ec
	.xword	0x18c9318d703c71bb
	.xword	0x2636c47fd681db66
	.xword	0x13055553c4c99071
	.xword	0x5672b173e657d4fa
	.xword	0x3429059882d1ec8a
	.xword	0x055d2e18bff28187
	.xword	0x61ffd86f906ceee6
	.xword	0x25119c47ce4fa696
	.xword	0x61cead4248b0f546
	.xword	0xb50b22d1637ebeab
	.xword	0x5fe330337e57ef95
	.xword	0xa7fe4d68cbd16b39
	.xword	0x5e28e78470c094f5
	.xword	0xbb36ef2dea987942
	.xword	0xd13b9ff68dbdc77c
	.xword	0x7c8fce13d16616c1
	.xword	0x8fde813fb729ef05
	.xword	0x660a132f21c59569
	.xword	0xe651ae360cb47e19
	.xword	0xaec1f47b815f70f5
	.xword	0x1183b492856a6edd
	.xword	0x9f2b2e5f64208558
	.xword	0xf38c8de7fe1c1b5c
	.xword	0xf65ec4e9fea95196
	.xword	0x630de7f91ec077da
	.xword	0x80ed4cded0a4506b
	.xword	0xd9bebf728d8df9bf
	.xword	0xc0fc68923cd02eb3
	.xword	0x9dd9fa8896761725
	.xword	0xdeb529837bc768eb
	.xword	0x5fee60cf9dc2e16e
	.xword	0x99e8c4e8b51b34ba
	.xword	0x493e16a1816399b5
	.xword	0x2b8aab3525a9e6a2
	.xword	0x0dadb75d73712129
	.xword	0xb7ba96236b54dc84
	.xword	0x27bdb287351b3136
	.xword	0xaf1d4b055bdb7b40
	.xword	0xcc8c143170b3d3e0
	.xword	0x9b85fb25911f8eba
	.xword	0x16befd1d0ddf15e2
	.xword	0x06a7c7e5f87a9e29
	.xword	0xffdf0cfded327578
	.xword	0xbf201d09c88756a5
	.xword	0xd49f22fdf7e2c5c9
	.xword	0x889842767bee1edd
	.xword	0x8e49e2cac3942930
	.xword	0x71d3e3ebbfbadc53
	.xword	0xc1163e0f149e8101
	.xword	0x1234e14c5434adce
	.xword	0xf244f3d76653c01a
	.xword	0x58117f50f0b5d09b
	.xword	0x5c1fad27d3e73637
	.xword	0x3ac0891430390054
	.xword	0xeb8b96a3f8c48f6d
	.xword	0xa1314dff234d78a8
	.xword	0xbe8aaf01a74184a4
	.xword	0x6d072347b50852db
	.xword	0xae05021fcd19f082
	.xword	0xf5ff77e5870ef33c
	.xword	0xa24721f26bce3535
	.xword	0xea29ecf3f5d3421e
	.xword	0x717c5bd9f196d890
	.xword	0x6b2198ab38713822
	.xword	0xb2c8a87e96826886
	.xword	0x97187118a49b387f
	.xword	0x69bf402fcc2967ea
	.xword	0x48f88da98210f936
	.xword	0xf789aad8b634cc44
	.xword	0x8a3da485c30e14dd
	.xword	0xb464b15e22d72683
	.xword	0xea9493518c6dfa62
	.xword	0xd9d71537e99150fb
	.xword	0xd24985bbedbdeb80
	.xword	0x5bf10f0db41619c8
	.xword	0x0d3e5dfa9df4c8cb
	.xword	0x82eb25efcd4ac451
	.xword	0x8eae447cfce4815b
	.xword	0xa264a49817a0d13b
	.xword	0xd80f0286ede1ec5d
	.xword	0x3f01c84c200f1998
	.xword	0x7204ab5e7044184c
	.xword	0x6df4d2d9a37a432e
	.xword	0x844042dbc6bcff4e
	.xword	0x22acefd099a87b04
	.xword	0xa4002e7897037406
	.xword	0x9f6caaa2f3a26e3c
	.xword	0x2b6b2fefef0d38a0
	.xword	0xbb85873784803857
	.xword	0x96311ea810e64b3d
	.xword	0x2c915acd3065ca53
	.xword	0x2feeca2e148185c3
	.xword	0xc195629bbd4e2b8a
	.xword	0x6ab22413c193533f
	.xword	0x39804adaae57d65c
	.xword	0xcd3e189253bfd44b
	.xword	0xeeb4d929bc5ebed6
	.xword	0x86b1f0af62ac2aaf
	.xword	0x89e8c090e66296fa
	.xword	0x5581d12d5a22057f
	.xword	0x86c50ad084bc2c55
	.xword	0x64ab18fc56a8442e
	.xword	0x7d95bb9dbd80cb65
	.xword	0x32459b8ddc70daf1
	.xword	0x5382a2c0299e5182
	.xword	0x16dc2393e452ed4f
	.xword	0xaa112612f45a2551
	.xword	0xc62f5f8cbc644d94
	.xword	0x006fa3bba3fd8989
	.xword	0x75ef447152fd5d5b
	.xword	0xeda47d9a0f92b3ad
	.xword	0x629128959aec72c3
	.xword	0x3ff37229db001167
	.xword	0xc501993b525dff40
	.xword	0x154a7d8956602ea5
	.xword	0x4155b4800e2ac93c
	.xword	0x2352b2c758a575e8
	.xword	0xe856a74900b738a5
	.xword	0xdfbb902d0043b8bc
	.xword	0xcd8f9068b82151c8
	.xword	0xc01ffc7c59203695
	.xword	0x7de893899435b165
	.xword	0x45910d82f639e37f
	.xword	0x02cf4d325f194258
	.xword	0x97a651776bd39c6f
	.xword	0xf28974599ac8da58
	.xword	0xec8cc0e92954c325
	.xword	0xaff003e5c725a087
	.xword	0xb310f9aadf73bc70
	.xword	0x8a6f8d115dbd0fda
	.xword	0xb8ee9904e8e60122
	.xword	0xe444d297f6886a1f
	.xword	0x6a1feb068beeeb5a
	.xword	0xce85be126a7fe127
	.xword	0x04faf3cce8fe2ffa
	.xword	0x00529e0f612e094c
	.xword	0xc3ae8f6637dc37cd
	.xword	0x79573e71cf9f0a9b
	.xword	0xc978903c31302d92
	.xword	0x86d42cd06be1d269
	.xword	0xe853dc319ae0f027
	.xword	0x4fcbde2d604c380a
	.xword	0x8b4f6f14b941fed3
	.xword	0x22768971e5354e9e
	.xword	0xfaeb24384a7c8c7c
	.xword	0xac85c7d0a0aac0a2
	.xword	0x813573759559ef10
	.xword	0xb0995062467d84f0
	.xword	0x0ee0c6e5d2eeedf6
	.xword	0x3a7948a2ea0096f0
	.xword	0xef5c691d15934c10
	.xword	0x8e6c0ad5c27314c8
	.xword	0xa0cb0705d904c6a6
	.xword	0x8f9a13f30c48724b
	.xword	0x7035fbcc90230390



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
	.xword	0x83e5ff646b43ac73
	.xword	0x9362e649289ce4ab
	.xword	0x72a7a886cbb62518
	.xword	0x55cb1cd539533b08
	.xword	0xbb75c001fb8f8d95
	.xword	0xe1cb92f3fc9d66de
	.xword	0xd46b43b3f650bfd8
	.xword	0x953516a652a511b8
	.xword	0x37eb2fdda795710b
	.xword	0xb153b46b68bc1791
	.xword	0xfc916384121557d0
	.xword	0xd0ec47bac8dd09c4
	.xword	0xca306e31b884e42c
	.xword	0x800735a2fbe8bd79
	.xword	0x3d1b5815c382bd0c
	.xword	0x7bbe733dcf794049
	.xword	0x09c449ba85997419
	.xword	0x61017c2cc0d8dd9e
	.xword	0x6184f70020247cc5
	.xword	0x276f8af3c4bc1110
	.xword	0xeee1fa403826754c
	.xword	0x6e9626214701d60a
	.xword	0xd843d592a1bd990a
	.xword	0x86db90342a8863b0
	.xword	0xa9f5d4d79a898c29
	.xword	0xeb6e0aebb06c7d51
	.xword	0x7c09dbcd0cc8798a
	.xword	0x7c408ab9d2357768
	.xword	0x7140bbe0932d16b2
	.xword	0x84c32ec33aedf7a1
	.xword	0xc6be5c028a40a503
	.xword	0xfa5205ec4e126dd9
	.xword	0xf99f5c5258018306
	.xword	0x2dbc62d8661cfffd
	.xword	0xf616320b1d597da3
	.xword	0x3a8d942ef9264399
	.xword	0xca56275f8168f7f5
	.xword	0xad226b0664e0bc16
	.xword	0x855d6bcc6d92440a
	.xword	0x4d54b8ae9a4e5373
	.xword	0x762c46993d0192b9
	.xword	0x0962fe536b553385
	.xword	0x20109a397592137c
	.xword	0x38a8a36ff6e70642
	.xword	0xc14fcececf0f4480
	.xword	0xa26401fe7cb72191
	.xword	0x04d2fca114069492
	.xword	0x43ddf19fccbdadf8
	.xword	0x144de337b82fa6bc
	.xword	0xb995207d4d4edacd
	.xword	0x1fa213c781a86787
	.xword	0x7edd78225931d093
	.xword	0x442c2ed64be3440b
	.xword	0x437471ab326544bb
	.xword	0xd5bfc52c604c2dfb
	.xword	0x0186079fc108012c
	.xword	0x8e9c7602481ac56c
	.xword	0x05203c1970aa72bb
	.xword	0x067bf858086fd687
	.xword	0x317e150fb863007b
	.xword	0x305e5c8754ac2fcf
	.xword	0xbd0d86264e01444f
	.xword	0xceff429fafb3d5c0
	.xword	0xcc11502101343d61
	.xword	0xb06770ab14cbf178
	.xword	0x76f53ae78bbb0f2d
	.xword	0xd132621d6a34a750
	.xword	0x68daa718252475cb
	.xword	0xa318a16c55f41490
	.xword	0x008c187488f761b2
	.xword	0xa2a07d8f01cfef1f
	.xword	0xe2bde18a89008f50
	.xword	0x2cbd0ba464602e8c
	.xword	0x223bbe5132530c6f
	.xword	0xaa881dc4fcbe76bf
	.xword	0xa6aea7340569ff5e
	.xword	0xee5f82b836d3189f
	.xword	0x768321769a15a07d
	.xword	0xac021148ff6c4273
	.xword	0x19a1edaa6c0256f5
	.xword	0xd0beb39c22d5f2d5
	.xword	0x3886917a9108d737
	.xword	0xf5266fb32109c0fc
	.xword	0x9842de8b6ef1a845
	.xword	0xc701e5e83b9e0ae8
	.xword	0xe8e72aeb7c0030c0
	.xword	0xe2154ba907943c4b
	.xword	0xe7f0e04f4fb8a2b5
	.xword	0xfcacdf13f1ca57f3
	.xword	0x1c92765ea1eb76d4
	.xword	0x1ce04ec9f037eaef
	.xword	0x86934f3b20b554f5
	.xword	0x8717d354224d0b5d
	.xword	0x6aeb7cc9678e01d5
	.xword	0xfd8c83db87c7876c
	.xword	0xf55a84f3ab311511
	.xword	0x0ebe8d973320689a
	.xword	0x09b2935c9cd8c40b
	.xword	0x262dbc75ffcf6117
	.xword	0x6ddaf39641a06796
	.xword	0x09646dfb20be4339
	.xword	0xaaa4324520e1dd63
	.xword	0x186979ba795125ab
	.xword	0x45188aed2ea99962
	.xword	0xe9d000d4e73ee5b7
	.xword	0x423f9a7dadef0b3a
	.xword	0xa29ea6be5d441d4e
	.xword	0x01b57a671f59a8af
	.xword	0xc144ee0d6d962c85
	.xword	0x9221176756f4fcbb
	.xword	0xcab00735ce388567
	.xword	0x60a370d0ed0c0a4e
	.xword	0x61f249c6c99b29a3
	.xword	0xd0a81146f2f1f61d
	.xword	0x4b6241a02aef6ca1
	.xword	0xa0c7381f5c6ca7ea
	.xword	0x8156cd9e2388513a
	.xword	0xfe99dc300ba37cb5
	.xword	0xd22254cddb99b4ca
	.xword	0x82d537ef77334304
	.xword	0x94d7cfb7110640e6
	.xword	0x262f6864d30c4f1c
	.xword	0x9e9f6522a65ac065
	.xword	0x5acf7730a8555716
	.xword	0x084fdfb79ef627e4
	.xword	0x33c5820637b8a409
	.xword	0xa73ed98e7e6e9c99
	.xword	0x115051c06d55fd60
	.xword	0x82f50db09109ceab
	.xword	0x7705d3739ab51bf6
	.xword	0x47f58b2f07c803d7
	.xword	0x941d117a127f09e5
	.xword	0x72723db0999479c6
	.xword	0xed0a0ea7fed2c58a
	.xword	0xd0c6834b47f470fb
	.xword	0x597c9b843113fba0
	.xword	0x10867347011f2605
	.xword	0x90d1eca85d56728e
	.xword	0x93157677fb6ac2c3
	.xword	0xea4c9c186363b3e7
	.xword	0x1e63c26d3ed7e55c
	.xword	0xc6716c91f3fd102c
	.xword	0x25cc2028e9c0151d
	.xword	0x6831abe7f5d55ff5
	.xword	0xd3670a4776cc9423
	.xword	0x2ef4e7795efe77a2
	.xword	0xfc6aaf7c65b156d2
	.xword	0xdbbed4cdd37d7729
	.xword	0xad0ad3bfb0c1133e
	.xword	0x9351a1bb5388b554
	.xword	0xc2b2745ea0b39e36
	.xword	0x141b2bbfb11c46e2
	.xword	0xd9c2f6e2148aa9b5
	.xword	0x47588cfc3b23bf05
	.xword	0x2a9582a829850159
	.xword	0xc58920fbf97d96ca
	.xword	0x4e89515d9cf20e7b
	.xword	0xf74b5d4f0af1fe87
	.xword	0xa19be166b386ed04
	.xword	0xfab6b16f691b75b4
	.xword	0x1e321a25a2462b89
	.xword	0x790793dbe2c05afd
	.xword	0x0315f73a0a270345
	.xword	0xf2a1f3e78696d653
	.xword	0xb400f3a2b7fc70fd
	.xword	0xc56addb5f5667a44
	.xword	0x3395f61378e6cec7
	.xword	0x1297d6b80b5ebff6
	.xword	0x858be77b9ea2afd4
	.xword	0x002896f341117b6f
	.xword	0xa5d1a6b32e2b004e
	.xword	0x17addbcf02d74f2c
	.xword	0x59f4f86d057e97bd
	.xword	0xb8a384ed1de1dcd2
	.xword	0x31718f8c3835b918
	.xword	0xbcfa8d28c7a7b9a2
	.xword	0xec931376151afad2
	.xword	0x1491fc42dbd03c3e
	.xword	0x47c7e57b26997eda
	.xword	0xbd382ae286dd28d2
	.xword	0x6191fead9f036760
	.xword	0x89acc6eff7edc0cf
	.xword	0xb1d85d85973815e7
	.xword	0x8e96375ae4c10482
	.xword	0x90b278f1ecc2668a
	.xword	0x88d2f8ba350afcd0
	.xword	0x96773f8a798b07c2
	.xword	0x6dd4c9bea1914802
	.xword	0x2daaa483f303361d
	.xword	0x0df22e7d49071f70
	.xword	0x428e9a01b53efc47
	.xword	0xe982f65fb919b359
	.xword	0x05d7048b8e1ac022
	.xword	0x4ad4d9f88aba30b4
	.xword	0xcffd20c348e5381a
	.xword	0xe7d28ec14364d081
	.xword	0xc3535f39066cb1e3
	.xword	0xa5aebff5d9c3b080
	.xword	0x568c83fe82f4b2f9
	.xword	0xa5afacc8c56f01bf
	.xword	0x57bc44a3187acf13
	.xword	0xccfe902152bca7d9
	.xword	0x64e61f5750281b9c
	.xword	0x6140277abf93b48d
	.xword	0xbea25f8922186974
	.xword	0x45f08028ecb322a9
	.xword	0x480a4d42a9c0d6ea
	.xword	0xb609dd881643ae30
	.xword	0x8643cc7cff53fb19
	.xword	0x4598a320b2267c1c
	.xword	0x514c705b87c054b0
	.xword	0x0b3106b9379c0d32
	.xword	0x9357a1b665afcd85
	.xword	0x724e9b8bca4600e7
	.xword	0xa1ce732351e4fc13
	.xword	0x241bd53c7e5dcab0
	.xword	0xdee250d5c05cd96f
	.xword	0xdb1033b7a0669d1e
	.xword	0xb5c21f0d247f08fa
	.xword	0x99d5f51556345f45
	.xword	0xf65b1cd5eb0d3916
	.xword	0xd109c635178b8943
	.xword	0xc94accff8cc70766
	.xword	0xc8bc52b4916426f7
	.xword	0x4263cee5afb74ebf
	.xword	0x442a7f939e747d25
	.xword	0xab9b2982b4d50a28
	.xword	0x815ef8a8b100af16
	.xword	0xe9f889bf9a0b6533
	.xword	0xb2b87038782de01b
	.xword	0x4e3d8c93bc4e604d
	.xword	0x2fc199846847f006
	.xword	0x4685ebe85e8e26fd
	.xword	0xa33fed1c80d60b53
	.xword	0xe9b672cce84aa28e
	.xword	0xaab040a8ba206f19
	.xword	0xdbe0de051f06de5d
	.xword	0x1722c18ed75692f8
	.xword	0xe5973361fe994758
	.xword	0x18bc69f29c262d2c
	.xword	0xd359894aa6201b99
	.xword	0x4ccabab529f597de
	.xword	0xb314f5e2ccc4cf19
	.xword	0xfacfe34bdc67fe56
	.xword	0xead7ab3953978bda
	.xword	0x490c5f5e232c92f0
	.xword	0x781be008253a4901
	.xword	0x4ee1da4f002c1bed
	.xword	0x5acc4bf2932f7a8e
	.xword	0x083e667aafe02dda
	.xword	0x702cdebd1afdfa63
	.xword	0xae41d2bb22ba3ea4
	.xword	0x743d464c1dbc75b2
	.xword	0xe9a2594e76e98752
	.xword	0x40a1fbd7f3941b8c
	.xword	0xd36ee66b99970547



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
	.xword	0x14b71dbf31b7e0a6
	.xword	0xa5e1b95d7259f66b
	.xword	0x0ea844e4bf9f3d62
	.xword	0xed49c5f8444ae575
	.xword	0xa2a7079f22946797
	.xword	0xf2a0149024b0e31d
	.xword	0x429bce00b961d0c3
	.xword	0xd1e4e162b30e3478
	.xword	0x8bfca63b2a54134b
	.xword	0x49f9d7f91c762464
	.xword	0x5a8ec87552761085
	.xword	0xc0620c44692b32d9
	.xword	0xb61abdb69b575fce
	.xword	0x86af923c913bd75c
	.xword	0xb0f00432d0aebf5a
	.xword	0x3c8ac9c3f55dde73
	.xword	0x3c45eef935dc546c
	.xword	0x7739a1e43fdc280f
	.xword	0x65d52c6473b5d4e8
	.xword	0x373a11bb47cecc98
	.xword	0x63ee8d7408bbe827
	.xword	0x3ae3e5b72c6b92d3
	.xword	0x0016c3e716d28ca8
	.xword	0x52dcee44587cdadb
	.xword	0xc940a8214d8ccc3b
	.xword	0x0cf6faf798881d1e
	.xword	0x2de10102e6992d7e
	.xword	0xafb4a5e05d1ac0c0
	.xword	0x3bbf9f4dbf2fcc01
	.xword	0xb24f9ea33b00b5b2
	.xword	0x190976015bb308fd
	.xword	0x3fc2ddc19f410612
	.xword	0xb94f3d8cdc3479cb
	.xword	0x4e8bdd53db66b2ce
	.xword	0xc838bdf141680f70
	.xword	0x1f26fb900d16e46d
	.xword	0xa76f0911d0d782c0
	.xword	0x45837b064746d1d0
	.xword	0x9135442ce12b85f0
	.xword	0x6c8e2f897ebeed61
	.xword	0x04362d14c90c0044
	.xword	0x6703365ec1b03688
	.xword	0x6fdf3ad680efd817
	.xword	0x87df9ca9307a4c0e
	.xword	0x8ce4ec718f9c3434
	.xword	0x97d8d83c36a1b822
	.xword	0x9415d26eabad098c
	.xword	0x683be7f742c5e506
	.xword	0x4c7c26b7f6e71b06
	.xword	0x00317e6f2c577351
	.xword	0xa52668d6f565bcbb
	.xword	0x0db29c97a49a8bda
	.xword	0x7eca94514dfb9e0a
	.xword	0xd71adb57b2c8e2a8
	.xword	0x838bbb65cff957a3
	.xword	0x57565b5be667b621
	.xword	0x6eea8f4a3671486a
	.xword	0x41d91e03ca165464
	.xword	0xaa185ceb952feaeb
	.xword	0x9435643119b6da84
	.xword	0x5a5a6c50a2fc7db9
	.xword	0xe7c33a1880be005d
	.xword	0xbe13e72522989a51
	.xword	0x6bcd58fea9a9a62c
	.xword	0x03ce3be1932e1d71
	.xword	0xa10df0a883464b84
	.xword	0x55f0060adc80897c
	.xword	0x79f0bbae1687dd6a
	.xword	0xca1b6db2a030c9e3
	.xword	0xc9dea572cbd6a41f
	.xword	0xd6723d68309f2f56
	.xword	0x7a178b2817544ce8
	.xword	0xe50931654c5fbe6b
	.xword	0x45c712b19f9bfcd6
	.xword	0xda3644ee722fa842
	.xword	0x1a1633285e8a7002
	.xword	0x32890b114d75bce8
	.xword	0x33e21b98f1dac605
	.xword	0xa975a7a529674470
	.xword	0xef1bea401140cc5c
	.xword	0xc619770880f9420b
	.xword	0x9a270caa7f034184
	.xword	0x1d868eea7c6c4a12
	.xword	0xc5848330c6196f48
	.xword	0xe9c07b7d94b7f617
	.xword	0x5582fee9ba8c9787
	.xword	0x13a6a30814eb678c
	.xword	0x5c792b0468bb900c
	.xword	0x944e22b3358595d0
	.xword	0xd5fccb44acd0e9f2
	.xword	0xd2c354bef4f1ba72
	.xword	0x63a5a78e8fa5f779
	.xword	0x2f1219a235e411ba
	.xword	0x3ca6c891373b81a4
	.xword	0xfb55082baa204b9c
	.xword	0xc04271fcd88625c0
	.xword	0x9722bceef15f9d3e
	.xword	0xcb6d5b0d0f32e820
	.xword	0xed3d4de69ceec4b9
	.xword	0x1e7782c488111ed0
	.xword	0x33ed70ba1f6bd41f
	.xword	0x15d75e95c5644794
	.xword	0x7a212d40f97a581d
	.xword	0x27df3a0bcc6f5825
	.xword	0x78ce68b79689850f
	.xword	0x2e3dfbef15f232cc
	.xword	0xdbebca498bef090f
	.xword	0x111a03b4476e0cfe
	.xword	0x5fae7032b63627e0
	.xword	0x1ca139243aa2d961
	.xword	0x81a2df22331052e1
	.xword	0xe8c659459ffdd8c4
	.xword	0xdf0e8ca5f754d062
	.xword	0xeec2e5376fd6d86c
	.xword	0x0ea157eee5af6032
	.xword	0xb068caaba9d3928d
	.xword	0xe924761cfd95abdd
	.xword	0x3fe9c6ab353d01f4
	.xword	0xe07193066d629675
	.xword	0xed182657a537aa0b
	.xword	0x502ef4611717a6ee
	.xword	0x8e98706fd1068695
	.xword	0xad381512a9b7d94f
	.xword	0x0c9d473b33e1588c
	.xword	0xfb684c5f0b18a61e
	.xword	0x9dfa3cd63085d377
	.xword	0xd1d553e3824debbf
	.xword	0x250a911794d8b30e
	.xword	0xa398bde806784a69
	.xword	0xce0a3c037b5bc927
	.xword	0xa901f4ef471eb1a0
	.xword	0xeb89fa9410729dd7
	.xword	0x39660635b5c36338
	.xword	0x95d8b10cb9731114
	.xword	0xb15e53c2dc80523b
	.xword	0xfa8282c443f5421c
	.xword	0x7be3beb9a7769eee
	.xword	0xb0904e974e45797a
	.xword	0x121b251f6f279924
	.xword	0x885eff8b40f88463
	.xword	0x7f60340fc4b1229a
	.xword	0x810e78eedcf7bed2
	.xword	0x570cbeed105f62ad
	.xword	0x984e68c22edb61f1
	.xword	0x778ce768a2d6fa9f
	.xword	0x027f7e23b3e5cd75
	.xword	0xbd3a9a115613e1b1
	.xword	0x471d9f689c46ad1e
	.xword	0xc64d101e344130b0
	.xword	0xefb5d42fb9b5ec53
	.xword	0x2fe73c173cbcf2ce
	.xword	0x822d10c43f44023d
	.xword	0x7918c9228a184d70
	.xword	0x27831d7092aca1a1
	.xword	0xd8b9708461076e5b
	.xword	0x51437331ab232448
	.xword	0x0a537e2ebe3f2133
	.xword	0x7b84e19379b389ae
	.xword	0x62535862e363daac
	.xword	0x47f757fe2e7490b7
	.xword	0x67382a2151423718
	.xword	0x26b99d7ea5ec9e1e
	.xword	0xbfee55e59d67dd55
	.xword	0x10c2cff25a9ed69f
	.xword	0x6d8381e826a50bfd
	.xword	0x1accff73510b97bf
	.xword	0xd75fcb9483bf1e7f
	.xword	0xa41ad97b595deac6
	.xword	0x2cc2b932a2026158
	.xword	0x283b9e4dd4d1c8d3
	.xword	0xf61db6bf39670e0f
	.xword	0xde6db566b99956fc
	.xword	0x8d0439c6677e024f
	.xword	0xf113340a56c09b91
	.xword	0xca21333a253baba9
	.xword	0x996fd05639cc252b
	.xword	0x7e2696052cd5590d
	.xword	0xbee680ec14cc9043
	.xword	0x32b4110213190a26
	.xword	0xc090fdecc75faeba
	.xword	0x780a68ee13211cde
	.xword	0xf10907038da8c996
	.xword	0xd05dfd13428f1d55
	.xword	0xce3101695d644a3f
	.xword	0x8515ed89066cc513
	.xword	0x44a98ce7cd0c1a92
	.xword	0xc60de85d154131d9
	.xword	0x6a22e03d4c7cb3e5
	.xword	0x65953de0f365c916
	.xword	0xd07326d32b805a9e
	.xword	0xea353a85158c3cab
	.xword	0x3129bc03f3d890dc
	.xword	0x60cf48062f227f75
	.xword	0xd2ecc657a5fdb847
	.xword	0x6673a7f2ad4c0faa
	.xword	0x1b6fe79d82920a03
	.xword	0x1af3014ae668685d
	.xword	0x68d1accedda074e8
	.xword	0x1f9acded09f461f6
	.xword	0xc23502e8be7c7bf5
	.xword	0x49c647555728de28
	.xword	0x65da926318c47655
	.xword	0x3bbcb0f4f49a6895
	.xword	0x9e24ef6b94184098
	.xword	0xd4a7069d9555aea1
	.xword	0xb8a5de46b843e25a
	.xword	0x91bc8bb4d9a167db
	.xword	0xd8e8ec0ba6522a14
	.xword	0xcf60f0339616d3f0
	.xword	0x5061113767a001ec
	.xword	0xe8dd648032f7a16a
	.xword	0x85c9818f10fb0203
	.xword	0x1ceaed23adeda635
	.xword	0x63e55d0b8071b79f
	.xword	0x7ef523fd879b96c6
	.xword	0xf4e137f22bbfa045
	.xword	0x12064b820f3d72bd
	.xword	0xd0a4e32742ae8f16
	.xword	0xc08ed0c1b1138e6d
	.xword	0xeada2b0c3dc491a6
	.xword	0xdd601b95df194638
	.xword	0xded103b283ae16bd
	.xword	0xca78f89c7879052c
	.xword	0xb1ae9323117bd0e8
	.xword	0xe65f1ce6e04abc93
	.xword	0xe3a0ce9bc3bd1741
	.xword	0xa12391fe1aaf64ec
	.xword	0x0c0ae7f727e619dc
	.xword	0xda2b1d37bfd719dd
	.xword	0x8d24bfe65d8b34bc
	.xword	0x3faa88032a2190a2
	.xword	0x6c3cacfb07be7d84
	.xword	0xefab1ec0ce09f803
	.xword	0xf1a4d978f441ae06
	.xword	0x770d99231c070e44
	.xword	0xe2a7831d556924bc
	.xword	0xfcccfe425ce10386
	.xword	0x0b16b94c9b4c660d
	.xword	0xeb77aec3b030e458
	.xword	0x8f856e3457b87c51
	.xword	0x50e5244275b70797
	.xword	0xb4e3a5711928cfd6
	.xword	0xac139b7d4ac2abbf
	.xword	0xe33cd1b197b9b638
	.xword	0xdb9d69f38259c107
	.xword	0x5abf4146de8a8356
	.xword	0xe69b582f7416d323
	.xword	0x3c9857c91b73f48b
	.xword	0xac2b49307fb77d64
	.xword	0xa561fb7724806f08
	.xword	0xf486abdeb99ea512
	.xword	0x28bc3adf4789e67e
	.xword	0xee083883c38b1696
	.xword	0xe358947577b8d2c0
	.xword	0xa2d7da25e7250131
	.xword	0x5a79823970d9fea4



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
	.xword	0x20b69d23019388c8
	.xword	0x9b99886eac346e01
	.xword	0x0a91e4fff90deb95
	.xword	0xae323f1f9dc9e3a2
	.xword	0xed959e981994e1e0
	.xword	0xa366f11ba13269f3
	.xword	0xc473a7bc09d8d11f
	.xword	0xf900b230bc3bb7f1
	.xword	0x2f739f85dcbdb20f
	.xword	0xecf2e8c9c20f8015
	.xword	0x049ae58b4aa7a86e
	.xword	0xe3c50c76744cca2d
	.xword	0x6b18da0b247ce463
	.xword	0xc333baa1fefd94b7
	.xword	0x5e2b0dc6ea9d7e26
	.xword	0x202adecb948f58a1
	.xword	0x05fb4cb8610d91da
	.xword	0xbf4c5506c1463a3a
	.xword	0x22ceb6af22573b7c
	.xword	0xc171baa1d8b4ca3b
	.xword	0x0a3fa075afb66f73
	.xword	0x54e5116d1938bdba
	.xword	0x79f8f021ec3cf84e
	.xword	0xbbd62c4c8d6b4547
	.xword	0xc3eda5e70b9928d8
	.xword	0xe8008b04b559c050
	.xword	0x7bd9a8cbefa4b8be
	.xword	0xb62e4becd034dda8
	.xword	0x2e62ebdd8d7b107a
	.xword	0xe88776a0727bd809
	.xword	0x051b1e27ce23e06c
	.xword	0xca06b0a2ad603a1d
	.xword	0x8f393e384421b0fd
	.xword	0x963dba026d430cf2
	.xword	0x15cc9a55f4653a4d
	.xword	0x41ec09ee93545c19
	.xword	0x7bb32818b2b5ad04
	.xword	0x457f8aaa82692502
	.xword	0x4c14eaf8a792523f
	.xword	0x59e18c27984461b1
	.xword	0xb0188975949dc8bc
	.xword	0x382f15a81fc9c27e
	.xword	0x1806335195d2b0fc
	.xword	0xeabc102d4747ef35
	.xword	0x46a2deb44e962bbd
	.xword	0x274078d99051e624
	.xword	0xe197d432f68ee4a5
	.xword	0x8eb55c42b766c023
	.xword	0x447327a53e2f7d91
	.xword	0x3615c6f9c5dec0d5
	.xword	0x0bef304fe27cd46d
	.xword	0xa911c4bc0dff58cf
	.xword	0xa27b698880e304d4
	.xword	0x1702bdd17473373e
	.xword	0x4957baea9c0c20e4
	.xword	0x3eeab2a7a4fa30c3
	.xword	0x4c3afe173e4fd5fb
	.xword	0x7af696ff0de52d69
	.xword	0xa4c3aff65b5f8c1a
	.xword	0x9e2f213bc046514f
	.xword	0x92500c369a5aa989
	.xword	0x3456c0503da3aee5
	.xword	0x34546d3c692bd3a7
	.xword	0x37b0606429d94408
	.xword	0xee8c360f6ad14a59
	.xword	0x5ec6356395f7d03c
	.xword	0xa217641db6db8fb6
	.xword	0x5f410d7c5716b4d4
	.xword	0x881521829ec0300e
	.xword	0xd43cc0edbfcb8c32
	.xword	0x9fc1183604264af8
	.xword	0x2f491c41ea48d758
	.xword	0x23b24d9dce7e831a
	.xword	0x4abe3cc7363c5f46
	.xword	0x042d1f4f4c49afa2
	.xword	0x2812904c34fa14bd
	.xword	0x877d6184c50ca820
	.xword	0x75b0db971615af70
	.xword	0x86bef80f99b2ad74
	.xword	0x60cce221dea442ab
	.xword	0x7805f2d940843c85
	.xword	0x8cf78cd68386179c
	.xword	0x063a04b8d7e2c4e0
	.xword	0x0daadc69e3b14c2a
	.xword	0x74b3588e24f48df4
	.xword	0x5bdc47377e21b12e
	.xword	0x111e895cbc079100
	.xword	0xe1ce82476dc9f3a5
	.xword	0x6d7f31c97443cbb2
	.xword	0xb6b20d1aa92d363a
	.xword	0xd5a6cc42f885c4b3
	.xword	0x936e86deec7c388a
	.xword	0x8b107fee98938dec
	.xword	0x75069f4026187b82
	.xword	0x95907e0037010d0a
	.xword	0x230d1e74ed5644bc
	.xword	0xaaed294bebc196c9
	.xword	0x1cd2939c08a5ab1a
	.xword	0xa03c09f36ddc2a3a
	.xword	0xabf3524c55a74eb3
	.xword	0x48c3ae1ffd1c94d8
	.xword	0xab9db5a8840fa99f
	.xword	0x1f3e5f00a211d332
	.xword	0x99cf9b87de5ed8ab
	.xword	0x7c075d8bb47aba9c
	.xword	0x70af621bedc14466
	.xword	0xbe8b75e73e41a271
	.xword	0x5432f76069ad8ede
	.xword	0xd2d004b1ac9b95be
	.xword	0x34527578ef01a428
	.xword	0x8c70a99bf769e47c
	.xword	0x62e0b98f926a2daf
	.xword	0x7a8a888a9feafd3e
	.xword	0x4ebf880561661428
	.xword	0x154c21b89d100778
	.xword	0x55fe3dd3da68776b
	.xword	0xe41a9341c6cd0417
	.xword	0x65c578cf6b50a8b8
	.xword	0x7d783a447602bf80
	.xword	0x61189768662a994a
	.xword	0xffc204e54cde92ff
	.xword	0xdb87242692278c12
	.xword	0xc113187c7147689f
	.xword	0x7343dc99a267740c
	.xword	0x4f294133d5c843fc
	.xword	0x0eaa3eada45edb58
	.xword	0xfb4111dd9f24475a
	.xword	0x2b2fb3b361b0eaed
	.xword	0x9dd71d15093d159d
	.xword	0x57e13f79806e9484
	.xword	0x37d1d5b5825b8aa9
	.xword	0x5a277e1e57af21aa
	.xword	0x68b4d6bcaa243ea8
	.xword	0xedc70adc47b93195
	.xword	0xbabe572ffe0134e1
	.xword	0xe2f9c488c5345b98
	.xword	0xfff482b09b17b122
	.xword	0x9321c00e4fdb896c
	.xword	0x5e9547b8bcb45b82
	.xword	0x258202aea3da3b98
	.xword	0x5a4a66cddf42fb07
	.xword	0x5279ecd4c65d7af5
	.xword	0xf13f783c8c3cbaa0
	.xword	0xf4450cae7d4061f6
	.xword	0xfcb9c4c1fbe5454c
	.xword	0xd4a825cf566cbe90
	.xword	0xb1aaa6cd6cb07460
	.xword	0x2292af3fd5131374
	.xword	0xc413b7aceb105a0a
	.xword	0x0a0c0e1ce7dc9590
	.xword	0xc3fa093ba0cc6ca2
	.xword	0x0c6a8c8ca3027da0
	.xword	0xca4e05773ae486ab
	.xword	0x77682c3ec321ee43
	.xword	0xb12f7c66775c2d5c
	.xword	0x505198b9598d0a39
	.xword	0xecb1c7227bc9b08e
	.xword	0x4382fed114fed834
	.xword	0xbd4d63cd81d3c223
	.xword	0xb9c6bca80f6312ff
	.xword	0x6fda294f95caa736
	.xword	0x5ab92eb510072c9c
	.xword	0x39d42b742c1ab12d
	.xword	0xc60b6b7ec47ac1d9
	.xword	0x5de400b41f0a0c59
	.xword	0x4535daa8a50c31a5
	.xword	0x7e0ef8414a3fd5a2
	.xword	0xef1430fe85f544a6
	.xword	0xa495183fe6694584
	.xword	0xb64fc05e4983e349
	.xword	0x770816dade563f5d
	.xword	0x67e57741be966925
	.xword	0x7e52e5e70da1d91c
	.xword	0x5aa0d3b494217037
	.xword	0x9865391a41c0ad66
	.xword	0x84c5903757881d09
	.xword	0xe4c04cc26df74cd2
	.xword	0x499f0846ed989577
	.xword	0x6b034345ba0e1660
	.xword	0x274308eaf3a76059
	.xword	0xc1ea9fe415b78179
	.xword	0x2a0bbe6af598edb2
	.xword	0x789381e221147dbb
	.xword	0xad3be01d789aa6da
	.xword	0x4b4305c321f53c28
	.xword	0x8f9a59f019cd026e
	.xword	0x57eb38866e4df0f5
	.xword	0x7c189584878ff9c4
	.xword	0xf4124e1851975234
	.xword	0xac137b477672bcad
	.xword	0xd053f1be0fa4d295
	.xword	0x0e2ff3edcadb7b65
	.xword	0x866d0db4558f91ea
	.xword	0xbf1f28f2ca16e1a0
	.xword	0x38b8cbc262709241
	.xword	0xaccf0a1e6e64ec7d
	.xword	0xeb5ce65baf227a81
	.xword	0x06d3e4def36ad9c0
	.xword	0x6a1402978f3804fa
	.xword	0xed6cf9b6fb6c5f5a
	.xword	0x83b70776b37dc6ae
	.xword	0x462588a710990886
	.xword	0xe3e9f7ee56606594
	.xword	0x6a8a3417020c9fdc
	.xword	0x86d062c1de5b6d75
	.xword	0xa2d53bf0e6ad426c
	.xword	0xc63eaf52655a47c2
	.xword	0xc8eda033840fdec1
	.xword	0x4d68142eef6c3507
	.xword	0x41f038b2177bbd78
	.xword	0x26e861b828dd9873
	.xword	0xad5d3abea6437451
	.xword	0xb229ccaaadfadca5
	.xword	0xae95ec9d8c6a8f2b
	.xword	0x30f05d99a6b69c7e
	.xword	0xc17ee655bc1b3f1a
	.xword	0x1c2b691fc43d93f5
	.xword	0xdf3031c55fb431e5
	.xword	0xc6be261e51153d65
	.xword	0x39bd3fbe54bf256b
	.xword	0x32eb50319dc57b1a
	.xword	0xd134e15922aa8378
	.xword	0x2f5022e2798d568e
	.xword	0x97df82858401e894
	.xword	0xe371e6e27f64354a
	.xword	0x32eb8e94ed7f1072
	.xword	0x86681450dd558f4f
	.xword	0x3d9663668713cb33
	.xword	0x451e7bdfb507189f
	.xword	0x22adb0e6e824ca9b
	.xword	0x95f9aca426034751
	.xword	0xc315488f0e546418
	.xword	0x9c67a9c51fbfa0b7
	.xword	0x743c9143f300eebb
	.xword	0x917f6e70991908fb
	.xword	0x19081021792517cc
	.xword	0xaf79caebb3612d4d
	.xword	0x330e7e298b10e7a4
	.xword	0x2ec73b5f4240c259
	.xword	0x150e06cc2b6900fd
	.xword	0x9f955088ebd5489c
	.xword	0x4f4e0619e46923ca
	.xword	0xed6002935e7e3799
	.xword	0xdb510116febe8dc3
	.xword	0xa20d6a988f615e94
	.xword	0xc80ac797f2b3e4de
	.xword	0x26183bdf3ce0da5a
	.xword	0x9f388a304a510750
	.xword	0xb133b74e3db88d50
	.xword	0xee68a6c6a5306bff
	.xword	0x8606bcfb2af6a751
	.xword	0x63c74757423840cd
	.xword	0x635b172a70dde8e1
	.xword	0x6bffdfa366b0d3bf
	.xword	0x0170603667612fbb
	.xword	0xf943c4590fd0c440



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
	.xword	0x96d46dbd8116cae3
	.xword	0x7e1a53c70a256ac7
	.xword	0xee5688161ca85ebd
	.xword	0x0243f226df5f16fb
	.xword	0x973e3c9be6b1107f
	.xword	0xbb3a523635375017
	.xword	0x6ddaaaefa095e3d4
	.xword	0xc992e8f9521f6934
	.xword	0xa710621f3aebff75
	.xword	0xaebf94f2bdbbd1f0
	.xword	0x690a7810e0565a37
	.xword	0x2b9984b97a097767
	.xword	0xc6ef09007cf01da6
	.xword	0x6f17315def4f03ab
	.xword	0x19f539285b19d643
	.xword	0x5bfb3bfeb4582783
	.xword	0x3cc83e594e960f5b
	.xword	0xb32b6e34954da8e8
	.xword	0x67979fa726eb38dc
	.xword	0x91fe3afc2f74b786
	.xword	0x7416a0975a67a8f4
	.xword	0xff90796144170e2c
	.xword	0xf5c7f6e185753a58
	.xword	0xbc36123c8ef4090a
	.xword	0x7b2c0568d762e906
	.xword	0xa88e590b9591457c
	.xword	0xd25b60849b1542b5
	.xword	0x1254c4d3a725050d
	.xword	0xf24bd13ee1ce9f15
	.xword	0x85c5d38ce94fbd85
	.xword	0xe5a075142f461c26
	.xword	0x5fb7b8dcddf82e83
	.xword	0x8a132f3154535f0d
	.xword	0x77bf1634894f8d98
	.xword	0x782ed530768e57da
	.xword	0xeba983b7135e2c3c
	.xword	0x5d39bf414bedc86e
	.xword	0x425b8e7498659708
	.xword	0x335de296840db63a
	.xword	0x0f8bbe73f364ea86
	.xword	0xbb5b32bb62935f38
	.xword	0x7985582363ef8c1b
	.xword	0xb2e31c930b924081
	.xword	0xe77ecfb6b6ed878a
	.xword	0x0edb0573cc8b615c
	.xword	0x33f8bb579e072600
	.xword	0x8dcbf5922ab3e549
	.xword	0x46a36e23af842d81
	.xword	0x6e1aabf04eda6037
	.xword	0x12036d3d5b67eea4
	.xword	0x11062e04ccca0caa
	.xword	0x331b8d38d6c7fb7d
	.xword	0x0e7ab4b4c7742439
	.xword	0xca4ef4077aa4f818
	.xword	0xf7ab120bc116d242
	.xword	0xe71c74e8e7c5cb3b
	.xword	0x25741f24c9f62c2c
	.xword	0x2aee68fb106a6b4e
	.xword	0xff1c22ea98994f3d
	.xword	0x6cf048ad1cf3818f
	.xword	0xf2c40ee3437ad0a5
	.xword	0x81483e41ff176ae0
	.xword	0x7e9f8bd1334c3b2c
	.xword	0xeffc4b2ddd14464f
	.xword	0xae24b3326493d0a3
	.xword	0x140306712a4da5d9
	.xword	0x23071f2589928d30
	.xword	0x3a740439cafe44ca
	.xword	0xff7750dfe91de702
	.xword	0x3b17f603d4ca0a06
	.xword	0xe5c99ec86196cb8a
	.xword	0x284c5b14d44f27a2
	.xword	0x9ae842c47c329577
	.xword	0x4c83e9e8dddf2809
	.xword	0x6e376f38e7fe4762
	.xword	0x124f0d1dcd8c9131
	.xword	0xf724e2bdfdc880c4
	.xword	0x46aa8a0bbae6ee81
	.xword	0x3a6efc4324ce1821
	.xword	0x6c37454988d65f12
	.xword	0x93b931a4f91afb9c
	.xword	0x2c4698f685e18395
	.xword	0x1881162942f6ed5f
	.xword	0x1862c2336f5db9a5
	.xword	0x4097efcd8adc27d1
	.xword	0x1f684c93538a83c0
	.xword	0x626b3b450322ebf8
	.xword	0x8e5998229c657f66
	.xword	0xb19e4868654e5e07
	.xword	0xda1d6c4c23e1bbbe
	.xword	0xdd501b2085d595ab
	.xword	0x4dfa844696bef53e
	.xword	0xaf8858395babb117
	.xword	0xc2fb2334fdddfef1
	.xword	0x7f5194a17fed8515
	.xword	0x37f158f2d31a1a9a
	.xword	0xace80f57e5212e46
	.xword	0xa3ce7ae4f43254de
	.xword	0x55dd08d646510615
	.xword	0x5bba46c3ed8d933a
	.xword	0x95f05ae74fb02dd6
	.xword	0xcf5d97470ed0457a
	.xword	0xbee3651e6b2262cb
	.xword	0xedbe7b0ba1e05738
	.xword	0x7c6fa98a7aec9493
	.xword	0x2204fc9d15c84171
	.xword	0x73013e89b6209e24
	.xword	0x5f34bd91ed76648d
	.xword	0x41dde383d67f1dd7
	.xword	0x3a7145d14f164519
	.xword	0xf32ea295eadb2ad7
	.xword	0xc916f3660f951db9
	.xword	0x6ff6493996f00dbb
	.xword	0xcdc3d67ed2d3e4c1
	.xword	0x48099974425355fe
	.xword	0x8f35b95a73790a0c
	.xword	0x1c110366d40dd709
	.xword	0x408e064a2500cd56
	.xword	0xf367106e6c4d2dc0
	.xword	0x5a2f9cca29671666
	.xword	0x3c703e6f1e10e99a
	.xword	0x189c3d5262d77b66
	.xword	0xb5b57b6b0b11f866
	.xword	0x95b4a09b673555fd
	.xword	0xa617501da5e245c2
	.xword	0x76495b710aefc131
	.xword	0xd6d7d5d805742eb3
	.xword	0x14d94017470a0133
	.xword	0xabce76e882f53da7
	.xword	0xb99d85bb92d932d3
	.xword	0x077cc8ba74f060aa
	.xword	0xc0c05b3336b064a9
	.xword	0x0462a3256a26d6ac
	.xword	0xcba4eff7bbb6dfe8
	.xword	0x4465de6e6fac8eb3
	.xword	0xf59838114c770ac3
	.xword	0xf996655c7e18ed62
	.xword	0xcbb918f36f87d65c
	.xword	0xcd0fdfbd6ba24fc3
	.xword	0x13c104e4c8b35698
	.xword	0x1779eb9215ee252d
	.xword	0x7811834b18f6a929
	.xword	0x4554f0f96efc1f8b
	.xword	0xeae08f71ce26148c
	.xword	0x478cbc4457f1321e
	.xword	0x55801ae9711f0a32
	.xword	0xd39282303c363b8b
	.xword	0xc4caae5947f113df
	.xword	0x91a8f3e5e3aaa174
	.xword	0x43225278df1ae2d6
	.xword	0x5f78ea2ef15e351d
	.xword	0xe9fe2fc92f140efb
	.xword	0x9db620e8af89f779
	.xword	0x090852738ffd2e3c
	.xword	0x745f113a81a9f76c
	.xword	0x8324df8104a01042
	.xword	0xe98ba5dc2433a53f
	.xword	0x5981699e58d9bcb9
	.xword	0x677ed63ade54cfaa
	.xword	0x885cffd12242252b
	.xword	0x17367878f1d79ba0
	.xword	0xc01fb29ac38acd8e
	.xword	0x20e41152d7db4947
	.xword	0x7898e26bdfe7c31a
	.xword	0x7968a94ce2a1153a
	.xword	0xea91c46e0323d1e6
	.xword	0xfe0eaf59f338f4eb
	.xword	0xd13c31fe25bfd8cb
	.xword	0x9f5cc615294fe0c2
	.xword	0xefff62fd8d436391
	.xword	0x66be7b7e9ea17a64
	.xword	0xdb47b09743dc9fde
	.xword	0x6470422f5e882bf8
	.xword	0xb0abd03c910b63e6
	.xword	0x6bcbad98716ac666
	.xword	0xf0726101e58d2092
	.xword	0x5d954f4104137662
	.xword	0x1d33ac797ff8fa48
	.xword	0x69cdd483d93903af
	.xword	0x6b94986992316648
	.xword	0xaef515147d7c149a
	.xword	0x30bb4f54af49d5db
	.xword	0xb2df2464344b92c7
	.xword	0x5c462bf52c09a3d4
	.xword	0x6c1d5b09ddf424e3
	.xword	0xaf89c42382e81010
	.xword	0x39d45cd58a2a197b
	.xword	0xebb1f5f35533a19f
	.xword	0x2f9502a2087d3a53
	.xword	0xe22a568550d12f45
	.xword	0x3ffd538af97c8eb4
	.xword	0x02f677808b07e128
	.xword	0x270e0dabb08824a0
	.xword	0x0469d7cbcfb44f4a
	.xword	0x2dae366e3f29fdfd
	.xword	0xa1557afeb8ce2dcf
	.xword	0xcbdc1a16e88ac267
	.xword	0x71f7b9001c3a0d49
	.xword	0x54cdcd5b33933435
	.xword	0xd34686a400463764
	.xword	0x2113b18e4c8e5d16
	.xword	0x5c65c47ebe8b0c68
	.xword	0x856873a34459f8db
	.xword	0xbd6e1ebab405291b
	.xword	0xdb93c321382dcf92
	.xword	0x494c69c6d66c260d
	.xword	0x14e23cc33c68a553
	.xword	0xaad472efcf3bfbec
	.xword	0x4ba53fe8b1a92a22
	.xword	0x26d5edbb8e195563
	.xword	0xfa138f4e9535cb49
	.xword	0x964c6738486c38f6
	.xword	0x9b6373d3bddff4ee
	.xword	0xa32a35d1978bf3ae
	.xword	0x40b7ac0c0d5319b8
	.xword	0x48810b5ebf500156
	.xword	0x9ef2bde808ce95c5
	.xword	0x687b02ae91a595fc
	.xword	0x719441e6e533ac80
	.xword	0x79c39566debd882f
	.xword	0x5a4d1cc316fa0523
	.xword	0x60953e0ec2f17355
	.xword	0x09e867551ebeb2a9
	.xword	0x3d34e0f4de677630
	.xword	0x5b5e3866ad74fc5e
	.xword	0x928dc2c057c67025
	.xword	0x4f1f1c1bd2367792
	.xword	0x833c6fbe0ce4cf62
	.xword	0x42e2cc9bb47af6b0
	.xword	0x3ea8b2ac39c17052
	.xword	0xcdfb67754ed764ad
	.xword	0xa6b4ef12f53213cd
	.xword	0xf36bfe30facda98a
	.xword	0xb796e018fe8067b4
	.xword	0x8d2d61961218ed10
	.xword	0x59d62e9e7c764f1d
	.xword	0xf9f46349008da02c
	.xword	0x621b3668102ee6e6
	.xword	0x016fb417605218e7
	.xword	0x3035a612ae897947
	.xword	0xdc66ead0adfb25cd
	.xword	0x2419119cddaa75cf
	.xword	0x666e06d33f7ac5ae
	.xword	0x08e1b28303dbdd19
	.xword	0xfb52c59cfab3e982
	.xword	0xd05f602a028bbca1
	.xword	0x7b9f28e42ff3d4be
	.xword	0x469bcb1b3fcf30eb
	.xword	0x5a285e1151819f8b
	.xword	0x6b551abe2d61c25a
	.xword	0xa6e71d3ba5c7e9b0
	.xword	0x220fa51f88936a7d
	.xword	0x11fc3dae60b896dd
	.xword	0xaf7b7b124d129d97
	.xword	0x6161fc773a1edc57
	.xword	0x35e1632f047a7d04



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
	.xword	0x64187eff3419148e
	.xword	0x3053ff90741725b0
	.xword	0xc04e0b0e334f4a62
	.xword	0x7864349feb4d9c49
	.xword	0x06c7d59f757ff25a
	.xword	0xd65e5e1ae41e5d7d
	.xword	0x72d76ac21b61ba38
	.xword	0x4f53d04302118028
	.xword	0xaff7a194fd611bad
	.xword	0x258957910fb4c4cc
	.xword	0xd1899d27405898c7
	.xword	0xe68b615f0c88e8dd
	.xword	0xea1cceb7b6de3a4c
	.xword	0xfa05716fce621553
	.xword	0x186ef469fa8f1855
	.xword	0x69b3009f62273556
	.xword	0xfa169618afdddc74
	.xword	0x31cc0f3bf231e1ef
	.xword	0xf941c7cf2570dccc
	.xword	0x75cb70f650a3f1c8
	.xword	0x11a7c7242c65aa92
	.xword	0xa59536f6225a265a
	.xword	0x2245f39a2ccb30fa
	.xword	0x060dddddf09468c0
	.xword	0x119cb54a88efec16
	.xword	0xc17e562c1471c4fe
	.xword	0xb5eb94fc0437112a
	.xword	0x0e7cfe85f2e48965
	.xword	0xc6e8a5750afcc938
	.xword	0xfa9a325bec345a75
	.xword	0x374506fc6edd2b23
	.xword	0x6b478c92ba70a87f
	.xword	0x9ef62f0fa94b6a10
	.xword	0x8d0b2db4d40198ec
	.xword	0x61a15e5025306ea2
	.xword	0x9f687d6796a70ab3
	.xword	0xc4a982489feb7488
	.xword	0xdfb7a601e292cd9e
	.xword	0xa5a2f572d149a09d
	.xword	0xb0a88260454a1e26
	.xword	0x426fa1d7e491abda
	.xword	0x650e95a9193b6910
	.xword	0x9bf40d6ac88df9b0
	.xword	0x1080b9ab0320b46c
	.xword	0x149daf04b9809b55
	.xword	0xbbf8a85d7671c55f
	.xword	0x493b1874b464a9ec
	.xword	0xd59245a6d55dc961
	.xword	0x009e805b72659abd
	.xword	0xa8beb4e86c296588
	.xword	0xd74e67cd30d427f0
	.xword	0xfa7dc056fc53d7bd
	.xword	0x70c5b0e9df22c2c1
	.xword	0xdc1e7cd8c7ce0ced
	.xword	0xf9594f1f7a5731c9
	.xword	0xd97ad741cf9b0d6e
	.xword	0xc94d3c93af413424
	.xword	0x341ac79a585835ef
	.xword	0xbda89a1d13eb8da8
	.xword	0xc6d4f0bb88ace034
	.xword	0x671598c22875ac31
	.xword	0x0cf010e7df4a0cda
	.xword	0xc79540627d4cda29
	.xword	0xa207a13038c4a54d
	.xword	0xd16c631359718793
	.xword	0xae977a93223635d9
	.xword	0x4d2f1a567e0962b6
	.xword	0x41ef9f56512eafb3
	.xword	0xa8d1fd97f3ec2a0f
	.xword	0x956db51d72a9b77a
	.xword	0x8d1a38768c05e72c
	.xword	0x5da5bf8df1a18577
	.xword	0x061e30231bc312b2
	.xword	0x72547eb8557d1935
	.xword	0x1d6cb00f2fa2b73d
	.xword	0x7818593b6a948039
	.xword	0x575975bd1d43fc46
	.xword	0x55de1e6793f696f3
	.xword	0x5f376d5dfe3357ad
	.xword	0x20d969a282cd36f7
	.xword	0x41c5f4a0ae81df15
	.xword	0xbd542bcec02e4954
	.xword	0x5ccbebfe629927ca
	.xword	0xce03936d8e11ca57
	.xword	0x219e24aeeda5fd5c
	.xword	0xde8a3410d57a399d
	.xword	0x2b0acdb3c5eecb84
	.xword	0x996fed65798bfaa8
	.xword	0xbeddc65b9847a564
	.xword	0x5fe7685d2471e7b5
	.xword	0xf2af7e2166bf8a67
	.xword	0x05aeb989da7e95da
	.xword	0x3a8218405ecb69e2
	.xword	0x24b079e098a15337
	.xword	0xeeb21f288877bf0f
	.xword	0xacc7605494787a80
	.xword	0xae1d230cb19be7f1
	.xword	0x10367efd2353d719
	.xword	0xdc8b393ddf2f29ff
	.xword	0xa568e791212ff645
	.xword	0x4510314709fc1d2d
	.xword	0xfb169e1736c876ef
	.xword	0x8bf83da2cc518656
	.xword	0xc849c6222875e66f
	.xword	0x6728c94dbc7098aa
	.xword	0x29e5572ab67bd1dd
	.xword	0xb3b220f97cf914e6
	.xword	0x2269af131edd73f7
	.xword	0xf2318fb472414ba1
	.xword	0x9b23f61c07282af4
	.xword	0x2cd453c077ab4760
	.xword	0x1866e6d89f901e4a
	.xword	0x5024cfb70554733d
	.xword	0xbb52032391b55a4c
	.xword	0xd17727278c0894ed
	.xword	0x0ecb8cb257b9200a
	.xword	0x8d929b042393e0fa
	.xword	0xe17d321803318278
	.xword	0x49c33222680a6051
	.xword	0xc6b0e01d3e21cd32
	.xword	0xd5f145a9b09cedad
	.xword	0x2197ec3009241a3b
	.xword	0x23ea535b8faa5516
	.xword	0xa1bb3fbe39c6d287
	.xword	0xdd0cd9aa0bdeadae
	.xword	0x386311fd520512b6
	.xword	0x90f362e20c7c113a
	.xword	0xf200714acf08f947
	.xword	0xff602b8dd1b4a40a
	.xword	0x630b430c53584e49
	.xword	0x5456804bd8fcc573
	.xword	0xe16bde50457960cc
	.xword	0x0ffd7e6fa39646a7
	.xword	0xfba37c25d1817982
	.xword	0xd6946d52e1336d34
	.xword	0xcbcb46a5d22687a7
	.xword	0x18c37fa7955b521e
	.xword	0x4c00e6881b47db0e
	.xword	0x36fec51edfddf316
	.xword	0x27a90966b584d192
	.xword	0xe0e74b59d2254469
	.xword	0x96d94bcac756389e
	.xword	0x913a99f90aa8f857
	.xword	0x33cc6763792bc4e1
	.xword	0x0b9d887090eb2a91
	.xword	0x610c600b92d1c210
	.xword	0x65c02770d181722c
	.xword	0xcb97ef7aa2a3a0bf
	.xword	0x87489ffb5047faa9
	.xword	0x6740adf4730f8a09
	.xword	0xa206916c1dcfb92d
	.xword	0xd6ba71cf5b942026
	.xword	0xcc176ef5341f9444
	.xword	0x61d5676a3f46d8dd
	.xword	0x9313e40160f1149c
	.xword	0x257c99294face6ab
	.xword	0xafbbc18341408b2e
	.xword	0x934dabd29971e59b
	.xword	0xa18a95bdbbfc05b1
	.xword	0x1b66a6279426b061
	.xword	0x49ad3221b7437b3d
	.xword	0x8896fd7888ab59f0
	.xword	0x5ff468765612adde
	.xword	0xe71d31cabb4e3914
	.xword	0xbc7525d2851c62fc
	.xword	0x4d3582c4715586d4
	.xword	0xa6d28249d825d456
	.xword	0xf5e9a82d94ec8411
	.xword	0x46027a273d48540a
	.xword	0xb5d7ccfb0c50e48c
	.xword	0x181a155ba1c15e1c
	.xword	0x43460f0b9362bf2d
	.xword	0xcd25468ca1748e7c
	.xword	0xc307293c72f0d6be
	.xword	0x848e16e62c04fa03
	.xword	0x4fbf65ade7f53cd7
	.xword	0x1a40f842aefd172c
	.xword	0x4d984019b40fd6a9
	.xword	0x123cb39519468843
	.xword	0xff656a0a2e5b64f6
	.xword	0xfcd151e19854712e
	.xword	0xc2da8a1571047e4e
	.xword	0x5a6fd685ae99aef8
	.xword	0xd380d69905035345
	.xword	0x6d55cf33eb844922
	.xword	0xfef629c50045a5b7
	.xword	0x5c60bd949be110ce
	.xword	0x0a0589bf5feb03bf
	.xword	0xa9f52cc8b906e468
	.xword	0x8b9857ae96ca3016
	.xword	0x626f9387939c88cc
	.xword	0xdb78dfffdc62a5d8
	.xword	0x4679add722c66e20
	.xword	0xa0ab8f3f1d3686e3
	.xword	0x14f8edb1b61cd92a
	.xword	0x2520cdb96a0e750c
	.xword	0xd5ea8b05b25e099f
	.xword	0xd696f6702e7ec4cc
	.xword	0x6312b5ee0f7a8c0f
	.xword	0x317a5637ddda9b63
	.xword	0x6e01118acfaa513f
	.xword	0x88f1cd794806f98e
	.xword	0x7279ae473841a6de
	.xword	0xe87ec1f444843883
	.xword	0x4d5bd7cdb313a857
	.xword	0x41dd17dfb9ac4c96
	.xword	0x268569fda07e047f
	.xword	0xfd6bff86c8b5b8e9
	.xword	0x291a9c9d262b4bb2
	.xword	0x00ff0b1533fff8f3
	.xword	0x79e6a71fc6cff7a8
	.xword	0x481821b524254b1c
	.xword	0x20482940594bcdb3
	.xword	0xaf9abbc0e2d2b0bc
	.xword	0xbd9d81a13cd07f0d
	.xword	0x3f5b185c83badc9d
	.xword	0xf02d5762beb23857
	.xword	0xdfc109f3a3e03a6b
	.xword	0xa17959dc1fe9694b
	.xword	0x1ef354de7f7e0a4f
	.xword	0x8ca809313df3f010
	.xword	0xc49074725fb45931
	.xword	0xeb076eff8dc828c0
	.xword	0x403f412fd266b293
	.xword	0x611f96ddf78a7f9b
	.xword	0xfd0644d5b3a53599
	.xword	0x44b358a406f93f1e
	.xword	0x9c8a3dcd6a3d1b35
	.xword	0x7bdf8fd08004a5e8
	.xword	0x49907d1ab39d2b65
	.xword	0xf836063af6237d88
	.xword	0x9a58f255e1bc6f3e
	.xword	0x0514ab1be14e8e58
	.xword	0xbdcdf979fab49056
	.xword	0xadc703e00e526846
	.xword	0x5592225b32aa3312
	.xword	0x13e76f3e49020ed4
	.xword	0x07d1a6c70d1dc052
	.xword	0x29bb3c901f555149
	.xword	0x880e29ae6f03dff1
	.xword	0x54c1e875a1450efa
	.xword	0x3a05501191a5a069
	.xword	0xdcc6592a2ac8466f
	.xword	0x60f4076a7613f16b
	.xword	0x208d390b955bc823
	.xword	0x6c6efaed16fc2f61
	.xword	0x1055251f369ffa91
	.xword	0x9afcf8365c458b0f
	.xword	0x3219954701663e04
	.xword	0x0e1d27f92b548bc4
	.xword	0x362d124137cab17f
	.xword	0xfee2ce05ebd7c742
	.xword	0xbe8153c3b811f88c
	.xword	0x51e7e6e3074c5c44
	.xword	0xce36107423ba4947
	.xword	0x024550b7be9355ac



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
	.xword	0x6d6bae0f229f509d
	.xword	0x389792c3e86fdcc3
	.xword	0x969919f3e1aceb73
	.xword	0xcf450750d704b2d9
	.xword	0xa289336ac3e8de12
	.xword	0x6f4ffbd375dc50a6
	.xword	0xd6f75435763b104f
	.xword	0x79ecf3a1d9e2a162
	.xword	0x1a87d666f2c516cd
	.xword	0x98b02edccbcc9b74
	.xword	0x9d1c532766bed650
	.xword	0xc107aa76fbde7c80
	.xword	0x1155502c54f7c4f5
	.xword	0xd2353b24f4b1651c
	.xword	0x40ef850e142f0c0d
	.xword	0xb911e9063c877fc8
	.xword	0x8b9b5c25d8251d7e
	.xword	0x23e1c1674ba1b4dc
	.xword	0xe0d20feeb5abdd0a
	.xword	0x2b43a06ab0680ef8
	.xword	0xc310eec83be0a2f5
	.xword	0x6d1866413b3006dc
	.xword	0xb6bc33034c9f7160
	.xword	0x70e504570ddf2cf4
	.xword	0xa0d0360c1e7ca13d
	.xword	0xb98687771dd4dc61
	.xword	0x4c0f6d02532e16ce
	.xword	0x67824ff6ba4e90f3
	.xword	0x94895d8fda1b6608
	.xword	0x1af38dc4f7d0fcaa
	.xword	0xbdb1deee4717a26c
	.xword	0xd71d268d379ccb88
	.xword	0x80c254b0a589fab7
	.xword	0x3cc100c2dd51a7ef
	.xword	0x5d5e876755bb6bff
	.xword	0xe7e4d0c1cf6f808b
	.xword	0x184a5528c3b1540c
	.xword	0xd1ea8f56d6d440e2
	.xword	0xec0f1c85d9c1a6bc
	.xword	0xd6f57c5d5fcab330
	.xword	0x98d51b26eed2068a
	.xword	0x27c493ec078b3740
	.xword	0x69cea6d4ae96f5b9
	.xword	0x9f20d856cffca29c
	.xword	0xb0f2da4fe3d428ce
	.xword	0x0757f535760ac74e
	.xword	0x592f4b6e15600e63
	.xword	0xe689e58c034f5c37
	.xword	0xf54e849fd7ef6dd2
	.xword	0x3449dfd48f9c8fa9
	.xword	0x01758598b7743f3c
	.xword	0x5df22c7b42d71e94
	.xword	0x22d97a0063b8878c
	.xword	0xdc4f049228cb67eb
	.xword	0x6101d6032424a0b6
	.xword	0xd5ca8c9ce6d925f3
	.xword	0x22f72fe219b89a53
	.xword	0x4905105c4900be4b
	.xword	0x95ca8a1015298ec9
	.xword	0x02c966dd449383b0
	.xword	0x947858eecfeb36db
	.xword	0x29b0085ec316f526
	.xword	0x60d8142aa66d2f88
	.xword	0x93376a777b96ceab
	.xword	0x19e3e1eb30603f5c
	.xword	0xa2a8d195c8c46216
	.xword	0xf98fa5835d1f001e
	.xword	0x339a5c00acf566d0
	.xword	0x2160bfd8285492af
	.xword	0x98263b2df1ced553
	.xword	0x73ff34f57633929c
	.xword	0x7401a9a5378a0bf5
	.xword	0x293455bd0f467318
	.xword	0xdfd4b75d98cd4506
	.xword	0x7a5ff6571d7bc388
	.xword	0x56995c5b06714ec1
	.xword	0x08dba150d9a47ec2
	.xword	0xbe6f3ae7e8509528
	.xword	0x14d97e62dc2956c7
	.xword	0x5d946d83f2314552
	.xword	0xecac07aec7c3a005
	.xword	0xb2d274101c65bfaa
	.xword	0xa60890c0331e6edb
	.xword	0xd9e5d164ebb45182
	.xword	0x6d1c3b01440e31a7
	.xword	0xf620c1bc66f7da43
	.xword	0x2690f99e140acf09
	.xword	0x383b74b5fe008d01
	.xword	0x8a438588e11bdd30
	.xword	0x61f9353408e50117
	.xword	0x872f0c1be38ceb36
	.xword	0x1fdecb9ddd21c4d2
	.xword	0x1539be2f2e646c33
	.xword	0x69782068b5049929
	.xword	0x94a2455bb4d921aa
	.xword	0xac11b43a78ad62b0
	.xword	0xb83746a5a78d5683
	.xword	0xbcd191dbc52e668c
	.xword	0x57672adb0c8710f2
	.xword	0xc04d2f66b6b86679
	.xword	0x97975f5745a67497
	.xword	0xda64fd4293ec8e3b
	.xword	0x1240cc9bf688f377
	.xword	0x238e331b270ad0ac
	.xword	0x86b51c8928389de5
	.xword	0x72071485cebef7b9
	.xword	0xb3979517d17c281e
	.xword	0x77b34653f22ca0c4
	.xword	0x5c54d0493ae6e44d
	.xword	0x4dfdfdf9ece03630
	.xword	0xc2239c18f8e9e762
	.xword	0x82c89c5a582c2b7c
	.xword	0xd2ce40f5d2f0d6de
	.xword	0xdea3feb5f7a8dc05
	.xword	0xca741b36f97dc5eb
	.xword	0xc22ee9e49108ceb7
	.xword	0xc41bb504665c6158
	.xword	0xb632eee0aa331e17
	.xword	0x1493b82263f41239
	.xword	0xd296391a0d091148
	.xword	0x1a2b5a7c9bbb1ac6
	.xword	0xbc3c56874ed46a39
	.xword	0x7f3bc5adcefcf8ce
	.xword	0x6ea451e187fa7070
	.xword	0x846672474bc6f473
	.xword	0xb22f26d2e3720e8e
	.xword	0xe67b4a93592b0c50
	.xword	0x92ebc6fee104c5d7
	.xword	0xa5e5abf12668f90c
	.xword	0xb5a78380ead881cb
	.xword	0x77638db2b4117fde
	.xword	0xbcf193750e119cbb
	.xword	0x55b31b71bcc871dd
	.xword	0x1d58aa0845847d07
	.xword	0x5c79b8e3ad22febe
	.xword	0x3d74fcedae8a8cad
	.xword	0xb02c85fc8ac23923
	.xword	0xc9baddfd7d2bc1c3
	.xword	0x7093dce3857039cc
	.xword	0x72cb9819a176cd2a
	.xword	0xa62c6b5420d8b112
	.xword	0x2833856838049ce3
	.xword	0x3a171cb81a19cb35
	.xword	0x3fd64023797f7d70
	.xword	0xbc35e7a2ce22baa0
	.xword	0xbfe73262e2d2a19d
	.xword	0x7b345ef4c2ff5fb9
	.xword	0x469bb433e97a74dd
	.xword	0x62a89c2e6cbb34a6
	.xword	0x31cedcded811e760
	.xword	0x29fb94af1e92fee7
	.xword	0x919b9ac2d5a70b6e
	.xword	0x23a4ded00503293d
	.xword	0xbb5f2bfe044b5820
	.xword	0xe7ed50aa3bc1bdc6
	.xword	0x0c6ab86d1bf079e9
	.xword	0xa3ba3d836617d77c
	.xword	0x4f53b80a1a3b4a45
	.xword	0x5bccafe5b930f7ef
	.xword	0x6221b018f0d26754
	.xword	0x73d236866de9d3f3
	.xword	0x2cbddf80c0f8308c
	.xword	0x53c6227bd883498f
	.xword	0xb8c4d9d3e3b0dbac
	.xword	0x821ee42d3665a029
	.xword	0xad3360eefc187bc4
	.xword	0xff0044d9897bb9a8
	.xword	0x537d809316997b4c
	.xword	0xc2d62e90dbe64fef
	.xword	0x3fb178eac4551e2d
	.xword	0xf6e0bbf4d5efd547
	.xword	0x1f1aebf53cea7156
	.xword	0x24052ca3a9322428
	.xword	0xfe09272a0e144ec8
	.xword	0x62d9c8537d8694cd
	.xword	0x1a0697efcc1a2043
	.xword	0x1a78f095cfe77114
	.xword	0x6a472e74f192138c
	.xword	0x317ae3e3bfb5d42b
	.xword	0xbd8a7fd70a9c4c8e
	.xword	0x8ccb84351bc9a876
	.xword	0xc823315fb6219499
	.xword	0xb295422afbca0430
	.xword	0x53dd3cf9988592b2
	.xword	0x202bc4752e48e394
	.xword	0x78a9c2a4338a5a0b
	.xword	0x942b2d7f35f67493
	.xword	0x9fa64603c14a2bca
	.xword	0xcad1965784035012
	.xword	0xcd20a0b345f08f0a
	.xword	0xbf11be87d5769838
	.xword	0x75e6ed3f0425a67b
	.xword	0x24644ef65149878f
	.xword	0x5e12661ed1299053
	.xword	0x5c725943516c35ef
	.xword	0xc383bc4411c327cb
	.xword	0x3108ebfe0ff458ef
	.xword	0x0f063f021ac938e8
	.xword	0x6730c4dee82fc6a2
	.xword	0x61d228b0e6423aaa
	.xword	0x6d872c02ee4eb67c
	.xword	0xdf8dcc9ac1bdde39
	.xword	0xfa0f55746166ea9f
	.xword	0x7843f415cdd1c08c
	.xword	0x0275e68d1e7c0d5c
	.xword	0x6c409b5fb7ee35df
	.xword	0x64f9aa9ef525378f
	.xword	0xe3d32728bde5b7c3
	.xword	0x974d9036b9dd337d
	.xword	0x8852eaadced08188
	.xword	0x7964b985557a04a3
	.xword	0xfb88da645e7c7af4
	.xword	0x317de31bb0c4aae8
	.xword	0x484ca390e04190ce
	.xword	0x40a49fc7be36a3b6
	.xword	0x151351d4767dffd9
	.xword	0x904914e5a592007f
	.xword	0x1ed4cd3ed9413d99
	.xword	0x1272d44fa7e90630
	.xword	0xce7e6ce9ad58da72
	.xword	0x58033ae7ca85f5b9
	.xword	0x693b8e55cbef93d2
	.xword	0x08cf51f44a1bc7c3
	.xword	0x32fd7a36e8a26c2d
	.xword	0xac22d2416118fd88
	.xword	0x0b0bc7469270271e
	.xword	0x3f5b4df3e147f29c
	.xword	0xf0db050a05797011
	.xword	0x8e22b13d3c52f4e3
	.xword	0xfe495bb1e70a9078
	.xword	0x40a1bf332469e83b
	.xword	0xf48b108ce91ca59a
	.xword	0xd40873e0caa0020a
	.xword	0x2a2a9d846a508e7e
	.xword	0x2a1a1af844472a59
	.xword	0x55a5fd3e7e73fe62
	.xword	0x5c202d015f73a754
	.xword	0x9774f4bb9d76380f
	.xword	0xb314e786b0ebd31c
	.xword	0x034a078713abc49e
	.xword	0x01fd47037aa4c8f8
	.xword	0xd0386f9760fe7af7
	.xword	0x80888118c0209a33
	.xword	0x4e03bc1681432a16
	.xword	0xc3ce4307556b2273
	.xword	0x26370c67027f56b6
	.xword	0xbcaf83a144483f7a
	.xword	0xbefb180da6bcdc80
	.xword	0x1b1b9a826647e361
	.xword	0x7b49c2f936e55398
	.xword	0xc4cad76189ffb9db
	.xword	0xc3db1e97eba8ad94
	.xword	0x2d87b4b03113b4f4
	.xword	0xb4724736babe1cd3
	.xword	0xe20fd0d8268c57b5
	.xword	0xdc29d861e2029311



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
	.xword	0x4f2ff40818903474
	.xword	0xcd806f347c558f95
	.xword	0x399ad561b28157a6
	.xword	0x92045f05b0eddfa3
	.xword	0x027cfb1ae1ed68a2
	.xword	0xbae9bd4e419c4ea9
	.xword	0x8fc56711b58ee7fa
	.xword	0xfab03ed3ee0d9b32
	.xword	0xa16cc7112cbcbaa6
	.xword	0xa53bdeae041c2854
	.xword	0x9433b433ec3b6984
	.xword	0x1e52a31ebcae84fb
	.xword	0xdb013a1baf11c2e9
	.xword	0x17ddc5e5f0f72da7
	.xword	0xe038b7b0ec52e27a
	.xword	0xb64175c4905991fd
	.xword	0x680c7d5ed496c797
	.xword	0xe15c23c286cbfb03
	.xword	0xba2a2b4ac1a843e8
	.xword	0xd71a17dd7792ac75
	.xword	0x2569ae8b25aa5557
	.xword	0xae67393285dc4b04
	.xword	0x50f9d495d0579e7d
	.xword	0xe8659aadff8276d1
	.xword	0xe674b0658e4541b2
	.xword	0xe6f6ffb701194f8f
	.xword	0xcd88215c229343af
	.xword	0x07d25f046cd32422
	.xword	0x1c286825838e4df9
	.xword	0x649496b169c5db2a
	.xword	0x818888f25c98c521
	.xword	0x86e4c97a676e47e9
	.xword	0x292daaf97e4ce33b
	.xword	0xc2442f3c98e077a0
	.xword	0x89d33178574fa083
	.xword	0xf6edb11a7fe19a47
	.xword	0x22376f5fa2ac473b
	.xword	0x8b897df09e6c99c1
	.xword	0x7ae51e12fc4f0012
	.xword	0x10a8ada261fc32a8
	.xword	0xa7d6dbb750318ba9
	.xword	0xe754be8a7ebabfca
	.xword	0x42052c214304fdb4
	.xword	0x32db6df9dc6de79a
	.xword	0x82919e50cbc804be
	.xword	0x3fd07f68517a66c8
	.xword	0x7d8150967ab31412
	.xword	0xda7b259b939c49fd
	.xword	0xcfb93ac86c63c740
	.xword	0x14a478b2974ff10c
	.xword	0x2015dcaed7fe278d
	.xword	0x659b93f31673522d
	.xword	0x90de211603f91872
	.xword	0x68656dc9e8f8e4c5
	.xword	0x3cece0e73587fdb8
	.xword	0x979a5ab5e8d5f7b7
	.xword	0xc3b4a1cabfd5bf47
	.xword	0x7487bf1e4c6be159
	.xword	0x531f364f38ec165c
	.xword	0x5500994a37a6558d
	.xword	0x63f818b6268699be
	.xword	0xab5c3139a1bbcf7c
	.xword	0xb70979b37ddfd010
	.xword	0x450dec6a616c894b
	.xword	0xbac1291243391a7a
	.xword	0x892a027d5625603e
	.xword	0x8a4f2b8ff66f95f5
	.xword	0x258506d70f50a152
	.xword	0x66a5d1500a7bf9dc
	.xword	0xb6eadc92d2ae6748
	.xword	0x351ba98fe1acb9fa
	.xword	0xfa413e0ae23552f8
	.xword	0x3357a5a58162b1b3
	.xword	0x729214a703a66903
	.xword	0x2843d901d58978bd
	.xword	0xa39740cfd06b1c75
	.xword	0x13e1e4f6ab157fc0
	.xword	0x9c855fa23d016a38
	.xword	0x76a8fd3339a4ea16
	.xword	0xd52c76a6c1ecf9df
	.xword	0x68cb610ee05c8623
	.xword	0xe65f600ef9f93e3b
	.xword	0x710c319e54908923
	.xword	0xb4732fdd55235487
	.xword	0xe636505503518a4b
	.xword	0x99cfb67e896ec641
	.xword	0x2753819b3a10070f
	.xword	0x8b654bf3234c2711
	.xword	0x978a357845356302
	.xword	0x2e0356708e88c879
	.xword	0xb310ec09edcaf5cb
	.xword	0x9f6f85e7800be22f
	.xword	0x386751a5d9d1836b
	.xword	0xa529e83e2b3f5f51
	.xword	0x2e4d75136d080b91
	.xword	0x602def4f4fd6afee
	.xword	0x532468c0b95caf26
	.xword	0x802257553bc5acba
	.xword	0xf2f53fc804123787
	.xword	0xf6681367f44a7b3c
	.xword	0xea45be72ae074cb1
	.xword	0xc11e66d52863c40b
	.xword	0xb1136e4a34838ba0
	.xword	0xc58dfcc18fc62a85
	.xword	0xff52bb7a568cc1dd
	.xword	0x469354a90aebfe8f
	.xword	0x7be289d4d3a42194
	.xword	0xfae2ddd304c415ac
	.xword	0xd09126561cbe9dc2
	.xword	0xf1d9dd14637478ba
	.xword	0xc12e5c8068dc82ed
	.xword	0x7679fc6a82174578
	.xword	0x8ad0ec0c74b1c34c
	.xword	0x41bd3dd498ca24f4
	.xword	0x5e54dfb96fbadec8
	.xword	0x95a9a80e2866b35e
	.xword	0xf0c264bb660f46d6
	.xword	0x610762d0b873a1a5
	.xword	0xdf7aff5c28b42a43
	.xword	0x26d5c52141613674
	.xword	0xd6671fc0933e5e7d
	.xword	0x69a2ac5f70a284f0
	.xword	0x64b513f11b16a666
	.xword	0xfcd69807e45c6d90
	.xword	0xc88fa72c1b8b00c5
	.xword	0x83c2ecb907b77b99
	.xword	0xad7b68b8e80ec51c
	.xword	0x84d144d5fba75e92
	.xword	0x7349d9b4c22f644d
	.xword	0xa19d980237354e35
	.xword	0x3d0efef8f8a76911
	.xword	0xffe2f2ff4c20360b
	.xword	0x21cb9c7b0670c8af
	.xword	0x010f4a6e78730387
	.xword	0x7b65c1a456da5128
	.xword	0x041d4464ba891350
	.xword	0xcf13a0ec74627727
	.xword	0xe989b6fd3546e5fb
	.xword	0x8ac1f03c7afc3f40
	.xword	0x611efb0d79864d84
	.xword	0xd0e5b46de5f73e44
	.xword	0xce55bdad6e76e90f
	.xword	0x894a235c5e474cdd
	.xword	0x59839fc3b13984ff
	.xword	0x8db9e3ac7706da6a
	.xword	0xed1c26786641772f
	.xword	0xdb1ec15ef26f1e4f
	.xword	0xac3710f7610d21d9
	.xword	0xfbefb8f3e9182a36
	.xword	0x45a9eb8d4671ff24
	.xword	0xf95bbfc91b3dbac8
	.xword	0x38e8a5f9f1cdea02
	.xword	0xb111f1ff87f14b9f
	.xword	0xd94a2752c7544e3a
	.xword	0x42d9e15e231c0b2a
	.xword	0x7c7637abfe4bc6df
	.xword	0x76912b3ac53d6fe5
	.xword	0x4851f69eb57ab18c
	.xword	0x496330f0c29be676
	.xword	0x7cd4450ebfe64ea6
	.xword	0x2ac034e997cfb76b
	.xword	0x19e2ede3917857f3
	.xword	0xfa0f67a56ea3df06
	.xword	0x6eba6b11a660297b
	.xword	0xff8ed177bec7cf71
	.xword	0xae51f782e1ea8c76
	.xword	0x76b20d57b9e50da7
	.xword	0x5da91b5001701128
	.xword	0x08caf5979454a2a4
	.xword	0x334f8191e2e13bc3
	.xword	0xca5ca5c84fe1aa3b
	.xword	0xb347eed814ab8091
	.xword	0x8104982f950de010
	.xword	0xbd4d0a9671858d99
	.xword	0xdaa91d9e92ddc10a
	.xword	0x9b19386de8a9c2b0
	.xword	0xf3e5a25db7e6ef69
	.xword	0x21c921c4a788dee1
	.xword	0xa44a9c21bb318e1e
	.xword	0x2d072848c90f6068
	.xword	0xb3f411f693c9ea52
	.xword	0x264163ef526ece19
	.xword	0x2e0de24e52107625
	.xword	0x183c93433d6ad8f7
	.xword	0x2e878dbb6a3d30f2
	.xword	0xd339851d3e4dc1fc
	.xword	0x7d45b62890b6cf21
	.xword	0x7f9d9819732f2c73
	.xword	0xc116d4ea8d7eb233
	.xword	0x3a5ad83fb989dd21
	.xword	0x9bc4a4f9d43f0424
	.xword	0xbdc97a0db1c253b9
	.xword	0x4abbae76dcdb831e
	.xword	0xe28a43fc3b7baf62
	.xword	0x944a39dd229e21b7
	.xword	0xc96f37f685868d2c
	.xword	0x1e1e2431eec2abf4
	.xword	0xabb0e4df6dcd63c1
	.xword	0xc51138c5ad1fb2de
	.xword	0xd06f54060265a147
	.xword	0x658ea78022a01ddb
	.xword	0x2c076460350def70
	.xword	0x4bb3e0eb5da4b897
	.xword	0x888bc3f8a1a5c593
	.xword	0xc83b184a7c2e3dd6
	.xword	0xd7e2d95e71be4ca9
	.xword	0x9a712d780ada0d57
	.xword	0xbd7570a961c84b0a
	.xword	0x9c3141872774e66e
	.xword	0x094cd0e8a906753d
	.xword	0x4aaa2d7a9c2643bd
	.xword	0xa74365133b6282b8
	.xword	0x4a6e62b3b4ce7d98
	.xword	0x563cc457b76b9fe6
	.xword	0x20964fe0f76862e3
	.xword	0x2fad7d9a9cd0cd7b
	.xword	0x0e0470d278a6727b
	.xword	0xc1bece856756b4bd
	.xword	0x2b2621b1d2fd2a9f
	.xword	0x4d90d2870fb0c844
	.xword	0xe0879833627fdaa8
	.xword	0x9089ece66caff6f0
	.xword	0x48bfa5ca276e4a52
	.xword	0xb29e0d2aeb7c65c9
	.xword	0x8e8500d02cf34f05
	.xword	0x1a44d125ea366096
	.xword	0xc5cb7db0752f39f5
	.xword	0x31fb8af702f78880
	.xword	0xc8738c038b46b12c
	.xword	0xb8be9fac90fb0e8f
	.xword	0xa7bf34e9c5be2e74
	.xword	0x56c7fbfc68bb2ca0
	.xword	0x25227349751f5e01
	.xword	0x987d95cf7660aa16
	.xword	0x4ab65065eb39d349
	.xword	0xbcfc17a4444577ca
	.xword	0x2073cf1f0bdf34ac
	.xword	0x2b1ea64cfe5aaf46
	.xword	0xd751273c125ff57d
	.xword	0x856e3ce9bc76727e
	.xword	0xc37856a199e46a87
	.xword	0x83a7fd8ffbd74bf5
	.xword	0x0724f1b119d3509d
	.xword	0x879a0bd72b2613e0
	.xword	0x5937883d92802ecd
	.xword	0x3c95a261c32b2d4c
	.xword	0x60058f50f3fdd111
	.xword	0xb24fe4ea7c636f31
	.xword	0x75a265860b646a34
	.xword	0x78e3c542244c1210
	.xword	0x885bfce25840d26d
	.xword	0x04e2565d6f44f552
	.xword	0xc7d68aa1653b50a1
	.xword	0x44182bbfbabfe457
	.xword	0x2dd90180505a556c
	.xword	0x6c4eed07c14ef927



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
	.xword	0x9b0d28a4d18a10b4
	.xword	0xf9269b0701c6cbe9
	.xword	0x64415241ef0cc37d
	.xword	0xb9f87a04976f11a8
	.xword	0xa029feb9e0a4d666
	.xword	0xc88697be25f0ef80
	.xword	0x19940f6447f5cba7
	.xword	0x887329150b9b9253
	.xword	0x0c1823ecbbf4c694
	.xword	0x473472ca2a6dd52f
	.xword	0x82a7faf4a702789d
	.xword	0x8d48f2b056a8d334
	.xword	0xe97d8c1ccb11b324
	.xword	0x519a80e32e2e5eba
	.xword	0x5b2e600e7160807e
	.xword	0x147bdbdae273c1eb
	.xword	0xc40f5cec5f92b04f
	.xword	0x0c7c40ccbe0ab666
	.xword	0x305a0a95362f1783
	.xword	0x9f3befde50db942e
	.xword	0x7ba8c06b8b7dcec8
	.xword	0x4278d382e5ecb880
	.xword	0x1d9ba2f2d73319d2
	.xword	0x7981ec17488d78b3
	.xword	0xe367540713cfb744
	.xword	0x1517b8f61b309068
	.xword	0x4e7b8552a63ce8f2
	.xword	0xb1f513b5ade227c5
	.xword	0xccd2aa796ee383a9
	.xword	0xc7d16b9a08c9b4ae
	.xword	0x3d251ce829482467
	.xword	0x13d00e1fba0d97da
	.xword	0x7903c9a78326f0c4
	.xword	0x641a444024fa6df9
	.xword	0xf66d560637c71402
	.xword	0x45d5ceb29928c2f3
	.xword	0xb82991016564d49b
	.xword	0x9315367a041140ef
	.xword	0xa303e0c297b6b423
	.xword	0x346c3885eb1bb3a4
	.xword	0x9ee6a6460fe9ed54
	.xword	0xe60924f07447485c
	.xword	0x66c382fd523f341e
	.xword	0xc3a88c917407b4c0
	.xword	0x99fabf73cab6951b
	.xword	0xf5d3863fa37a9527
	.xword	0x74cefc93ad4c3d89
	.xword	0x1e70613a00900ce0
	.xword	0xef28db578157e681
	.xword	0x27a44a42a907445f
	.xword	0xcc7a391dbdf3d2a6
	.xword	0x69b1c57b0d1a3c28
	.xword	0x3ec1a6bc313bafde
	.xword	0xd6018b24dda42c0c
	.xword	0x7dcfd29a13f87788
	.xword	0x74b1acd98ad2be14
	.xword	0xc3ce49478b927ae9
	.xword	0x299a67746b5b7bfb
	.xword	0x8cb7cd56225f03cf
	.xword	0x12f6506caa10826c
	.xword	0xc301c28337ffbc82
	.xword	0x9555f525ac46a869
	.xword	0xb8dd36136ff36ac1
	.xword	0x3532f417480814b3
	.xword	0x11b6ef84b3b875ee
	.xword	0xcce8123922e8d81f
	.xword	0x0d540e0cac7d75df
	.xword	0x7d4c983cc4bc0d59
	.xword	0x5fd93fb6057fa651
	.xword	0x03b774bd45c289e2
	.xword	0x71587eed3de9ad5c
	.xword	0xecd0c9072f66507e
	.xword	0xe9588978b6a9f8b4
	.xword	0xc15d17a3d5e23d60
	.xword	0x544f1fb9933719c6
	.xword	0x3b5bcfc1e7ac636b
	.xword	0x755f9c974465828d
	.xword	0xb0d89fe53b2b0831
	.xword	0xcb7ef03fdc9c52c2
	.xword	0xbd0643418d876509
	.xword	0xe77e7c04f7ac3830
	.xword	0xa68fab85178045c3
	.xword	0x1b24702bb74c8244
	.xword	0x015521c2b3ca5783
	.xword	0xf0379b3b3e800519
	.xword	0x295f1aeae8df0e50
	.xword	0xa8e71d30cf391cda
	.xword	0x61a14e7bd96a7c6b
	.xword	0x5d3def1181d6ce32
	.xword	0xed310f5ff902e30b
	.xword	0x8eff7e4def305059
	.xword	0xca1f69671ae6a44e
	.xword	0x9d4029e13fc2c657
	.xword	0x7f72635b854fb865
	.xword	0x989cdb635f4a4a6b
	.xword	0xa414e476b994788f
	.xword	0x7c7fe068c0000014
	.xword	0x7daaa20b071553ac
	.xword	0x4177407757866bd1
	.xword	0xb415ff474aed8620
	.xword	0x96ac5322719b41cc
	.xword	0x73ea5f1b1229ca67
	.xword	0xaee32a028b3ed40c
	.xword	0x22c48b7468655f65
	.xword	0x7df2c8d6b2f48567
	.xword	0x78fd507e28780051
	.xword	0xf26f811873a89378
	.xword	0x537bf800dc1812c1
	.xword	0x2a630b2f97510e31
	.xword	0xb59f14e89008d07b
	.xword	0x4967b7c9b1f10663
	.xword	0x5958ee620971bcae
	.xword	0x367aa1ea0b26e6d5
	.xword	0xa820a6405ecc826f
	.xword	0xbdd5eedc88556f60
	.xword	0xff7e8575b529f2f2
	.xword	0xe90bac743faba03e
	.xword	0x30c5fb1205ca8650
	.xword	0x738e796fb96f4e69
	.xword	0x5a47d17b5af66611
	.xword	0x70a22b159ca7ee6b
	.xword	0xfe4450dbc40f7b55
	.xword	0x6a7b66d09f610bc1
	.xword	0xa13dc2352ec88b1d
	.xword	0x988171af8900443b
	.xword	0x4882e8b320a410b9
	.xword	0xdadf945d9bb53353
	.xword	0x6e8d865887cf65f8
	.xword	0xb91580301e6f792d
	.xword	0x9f4ffb346019014c
	.xword	0xa8aa91a61cb54042
	.xword	0x6bb0eff40ebc5e49
	.xword	0x2d19fa7c4d5a174e
	.xword	0x02320897176ff27b
	.xword	0x9476de1cfc7deb59
	.xword	0x17b86ce4e3678c5c
	.xword	0xc300628707df119d
	.xword	0x272ed27b3234f048
	.xword	0xfecac2bcdbda72a0
	.xword	0x0750cfa9a86228e8
	.xword	0x222a80a4012cd9b8
	.xword	0x3a1c8bd7383b4854
	.xword	0xde32233a3a14f770
	.xword	0x4d44c3c7ee7a59ca
	.xword	0x968b1f5108fe8af1
	.xword	0x5e41ee2e73589e78
	.xword	0x41bc7432c4f34739
	.xword	0x35a0580a0ad9772d
	.xword	0x58e661ecd9bab27c
	.xword	0x7f18ca1e8b5b995e
	.xword	0x3c4ae621c0893eb5
	.xword	0x11cdf93f79fe9339
	.xword	0x68dd9376c5f4ca36
	.xword	0x911bcd9a5fb94e6b
	.xword	0x6e088c4e1f7e2a86
	.xword	0x25dcac349930ed72
	.xword	0xbe0b057dd42283dc
	.xword	0xa18150886e91d93f
	.xword	0x8d71a45cf8b8c7b0
	.xword	0x986931b8be38c078
	.xword	0xcbf5da341259ef6d
	.xword	0x629c0ffd9cb543f8
	.xword	0xbdff06913a5d2f4a
	.xword	0x91898b1257b986c4
	.xword	0x86fdfc87c9f295c3
	.xword	0xc731f3598c8de5ee
	.xword	0x187d2a2236d79d1e
	.xword	0x4090e6d8d6b8b490
	.xword	0x894ea40d214964f4
	.xword	0xb4d25166d9623b6e
	.xword	0xf88982f768b8db92
	.xword	0xa65ecfbe8a431406
	.xword	0x7a9c0297973707fb
	.xword	0x4e2571dbb1f20115
	.xword	0x237617adddfcb75f
	.xword	0x60fd6f5993b0bd08
	.xword	0xf5dd6e09b36e444b
	.xword	0x89ef58f8d2aef20c
	.xword	0x12e77d52450aa377
	.xword	0xa50db026b29623a8
	.xword	0x7cc838343226d429
	.xword	0x272627d5841e68bb
	.xword	0x16e849b99df052cb
	.xword	0xf055d06990dae7de
	.xword	0x79cdb46d78fbff29
	.xword	0x0176eae3979ef7a0
	.xword	0x398d32d7560ef9a0
	.xword	0x43b3e999f7cb2532
	.xword	0xb8f4c97cf9e9ed14
	.xword	0x2f51827f5f252d8d
	.xword	0xa81f3180f304111a
	.xword	0x5d4709733c3ef6aa
	.xword	0xd1ac6dd1602d164a
	.xword	0xfc7fb94ec83261b7
	.xword	0xacaeceb90f35d53b
	.xword	0x1020bdd07215975c
	.xword	0x80681eb245ad96df
	.xword	0xab25c92a4869b367
	.xword	0x574725c0d4e4e73e
	.xword	0x85b45c3990e8dc34
	.xword	0x638c90ff4bfed269
	.xword	0xf66787768d2ab3e1
	.xword	0x9c48151c3ed438c7
	.xword	0x6ec0e7909a447a34
	.xword	0x3880bf273068e5af
	.xword	0xa8cd3902821db5b1
	.xword	0x07353be6da71063b
	.xword	0x9bd1266309d38cab
	.xword	0xaaadc8b1a39b920d
	.xword	0xb500b46be9a550f7
	.xword	0x5b80105ae4948143
	.xword	0x53d2ea48890590be
	.xword	0x3b91375abed614a7
	.xword	0xce31bfda81cb7c04
	.xword	0xf642593550c435a5
	.xword	0xf5c56a523fed3f06
	.xword	0xb808a4d356640125
	.xword	0xa2760d956166feff
	.xword	0x5f0cf05b6b26e9f2
	.xword	0x60da88881bfb7a9c
	.xword	0x55d4fc8a150f97c0
	.xword	0x3b59934a4e9db78f
	.xword	0x0084a868d92f6ee8
	.xword	0xe7a387477e509e63
	.xword	0xb334cc23d9d0e38d
	.xword	0xfebfcf4893495b28
	.xword	0xf6ab258c6454a093
	.xword	0x5d0230693ef12659
	.xword	0xbce2c59a7149c709
	.xword	0x4d34f6b32b5b31bb
	.xword	0x4b2918b26f7ad0ab
	.xword	0x40efce7f9c1244b0
	.xword	0xd8f76306416218a7
	.xword	0x2fd1e13b6c1d620e
	.xword	0xaa2ef55ae030fef2
	.xword	0x3ce9ec442ce96dff
	.xword	0xd6a747d8a827c511
	.xword	0xa34f456f8829febe
	.xword	0x1a0703a66ca35774
	.xword	0x5cc79daa1cc46392
	.xword	0x53cb02699e19f1c6
	.xword	0xf713c972298d7c13
	.xword	0xce95ea06c978316b
	.xword	0xf66fcbb0ff8d16e4
	.xword	0x0598394e1da68b4a
	.xword	0x3dbcfb4b129a0f39
	.xword	0x817416eec93af653
	.xword	0x8c31d04d523cf7a5
	.xword	0xe20d5123d66c160a
	.xword	0xbb0fc76a9c482917
	.xword	0x3cdb61fdc0042cf1
	.xword	0x8ab0574119f0db86
	.xword	0xb2e9835964028399
	.xword	0xe26bf2da988be4dc
	.xword	0x027af5102b6e6f16
	.xword	0x52c234e76b425fb9



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
	.xword	0x3daa2924b55b0f48
	.xword	0xda64032ff7e12947
	.xword	0xa11e574bd3c00408
	.xword	0xa24a4d21834e4c68
	.xword	0x11879a59cdd020c9
	.xword	0xb95e9f34d224ba85
	.xword	0x9dc6ca8dceb46bf4
	.xword	0x76aacaea155e2a22
	.xword	0xa77fb3362a958f34
	.xword	0xe1f0acf01a1bd38d
	.xword	0xa9f37c9f7e8d9d13
	.xword	0xa711a71c78a196f1
	.xword	0x565d17de41d7657d
	.xword	0x54f0708c6814d3b4
	.xword	0x9678404618192b76
	.xword	0x1be259010e81c12a
	.xword	0x52d74be62165ab28
	.xword	0x0462879196365988
	.xword	0xe10cd006817b3a6e
	.xword	0xc010ef83d7c74d66
	.xword	0x8df6fa0f9259e95f
	.xword	0xb92b7b9400804afe
	.xword	0xe67d2f6725227088
	.xword	0x660635d7addb22a0
	.xword	0xce283767a79a75fc
	.xword	0x4fc1c3d0506502f5
	.xword	0x9a6ed530bbd3dc2d
	.xword	0x16dcd31a0de5f8de
	.xword	0xe50951d99dd26463
	.xword	0xc10c76e46002dc89
	.xword	0x800a3f505e682c14
	.xword	0x6fd8a933d34e1266
	.xword	0x293c9a95c36d4a9d
	.xword	0x1525bcc9695eea21
	.xword	0x6a21f9d974e40fd0
	.xword	0xd84ac08184704af1
	.xword	0x8213f4d92b4f9cb4
	.xword	0xfaa769358193870e
	.xword	0x42c763d679182332
	.xword	0xc8a623dcf21009f5
	.xword	0x9d180bd5f937705c
	.xword	0xbf363551e65ec5b0
	.xword	0x156748316d8e301e
	.xword	0xde9f1bf3b32447f1
	.xword	0xc6ba98e032bfe03f
	.xword	0x9d23a1060c5bd77b
	.xword	0x822ec4609be6ebec
	.xword	0x2c916b450c3ccfda
	.xword	0x4b74b4be1568ad69
	.xword	0xd61534c2d0dce1ea
	.xword	0xfe11c8aea510c685
	.xword	0x410cd4f84bfbf743
	.xword	0x3303904cdad862cd
	.xword	0x22fa61168206787a
	.xword	0x0912ab4bf6be5de7
	.xword	0x445eedaa651903a6
	.xword	0x4485b36aa4b9bcf1
	.xword	0x8703830dbbe62102
	.xword	0x17dd1e741d54da7c
	.xword	0x17c0f8cfd4a0a4d4
	.xword	0x5f5fe8da9f93e2e0
	.xword	0xff7c6fbccd7c2904
	.xword	0x44e95fe40978ac75
	.xword	0xc9f65d3667880296
	.xword	0xca5b5079ec9b2667
	.xword	0x711b71f10b942527
	.xword	0xf8f53e18494b4879
	.xword	0x78383a435480673e
	.xword	0xb17e66123626cf98
	.xword	0x718e06290396c8f3
	.xword	0x0392018256b43e15
	.xword	0x7675f5d4b55aef7f
	.xword	0xd585ae7324c34473
	.xword	0xb5609d0396e18aed
	.xword	0x9565fe0afe52b61a
	.xword	0x7a88261c42a4e82c
	.xword	0xffcf795ef88d11aa
	.xword	0x6a45c02d74de330c
	.xword	0xc3524eae980986e4
	.xword	0xdf45456bddac1878
	.xword	0x849e767816136d9a
	.xword	0x834a39dcad912315
	.xword	0x4bf994a194c2d6e5
	.xword	0x4c5d2c040b55f13f
	.xword	0xf2339c72cb5cf72f
	.xword	0x48ec0e8254bb7a8f
	.xword	0x00b02ed2c21a76fc
	.xword	0x7e1c37cb3994bfaf
	.xword	0xf89f6098867d3aae
	.xword	0xe2b2f9aaa7881aad
	.xword	0x4b7f3bb3eaba168b
	.xword	0x012179aaa13b3e67
	.xword	0xd3edce962a88529f
	.xword	0x15bbe015ee47a5d8
	.xword	0x57c7daec3ce99248
	.xword	0x208064c29dde47f1
	.xword	0x57eb1560714c70a8
	.xword	0x1c67ad4aa5046eeb
	.xword	0xc0a6c3e35bdd85e2
	.xword	0x7c91d21aa363bf3b
	.xword	0xf3ae496ece405207
	.xword	0x56d4c693b8fc2c96
	.xword	0x55e2afd0546b7d82
	.xword	0x38de6dfe1def2e24
	.xword	0x0ed451da68406bf1
	.xword	0x9cbeff4db5c27de0
	.xword	0x9768d74d9ed15f4b
	.xword	0x1a25daec01e1770f
	.xword	0x70c0b5dfcf76a1c6
	.xword	0x0abc20f0db7db991
	.xword	0x751ee8903f26ea3a
	.xword	0x7165884edd657d44
	.xword	0x23782919eed07a49
	.xword	0x62f0af01a4e153d6
	.xword	0x2ee48ca68e99d58c
	.xword	0x8982b52e0bbfed94
	.xword	0xf58e31c6956662be
	.xword	0xccc699b1d670274a
	.xword	0xbc5ae483244d526e
	.xword	0x178992fddb3e0a48
	.xword	0xe024e0d201ed7624
	.xword	0xc792fef9a495bb40
	.xword	0xd920a035f66c69b5
	.xword	0x90dab61482475426
	.xword	0x71c4ab2d96b42f0d
	.xword	0x5c9ce9bb8923d6f7
	.xword	0x4d050903ff6fa0a9
	.xword	0x769bf0ca8e4ce037
	.xword	0x4f381ecc92d5676e
	.xword	0xa51ff239ec662667
	.xword	0xb24d5fb1b6c79de1
	.xword	0x92f23d35ac83df74
	.xword	0x6969fe7eb6b57a95
	.xword	0xb4cfedfe262226de
	.xword	0xd24d1ff8b85691bc
	.xword	0x15dde38a5645930c
	.xword	0xd3a87e1af4cd8bc9
	.xword	0x791c2bf057f5dfda
	.xword	0x123460ad61eccd30
	.xword	0x31b5f8e1bce83051
	.xword	0x166094a495fd34a8
	.xword	0x7fff9cb1e3a38fd7
	.xword	0x35eff34ebd50b966
	.xword	0x0e0cbae71b5c889b
	.xword	0x6bd1022ca8db65be
	.xword	0x019d4d72b9b565a1
	.xword	0x0a212590c28412ef
	.xword	0x45175deec44ba854
	.xword	0x19305ace29cb1e82
	.xword	0x8c5328610ad85365
	.xword	0xbd3261d282443818
	.xword	0x781ca38e7895faf0
	.xword	0x759bd4ceaa29e69b
	.xword	0xaf1721e0809602ae
	.xword	0x9c7ebbe56d3f7b64
	.xword	0x434cc2ef897d8596
	.xword	0x4c725112c000db00
	.xword	0x49aa1f512cc74f96
	.xword	0xc40ea33d60933f32
	.xword	0xb99c925eff1c79e0
	.xword	0x530a7ea7ab95b170
	.xword	0xcb39c460976851e6
	.xword	0x0367b3a42d98f452
	.xword	0xf486055890f6fce3
	.xword	0xcbffe1dbf5f4f2bf
	.xword	0x0d83308a19b0d914
	.xword	0x955973fefb130838
	.xword	0x912eee89555ea8c5
	.xword	0x9d7b6d0eb8bb234a
	.xword	0x43bf22c8ceeb8cf1
	.xword	0xddea67f9dd0e7dc4
	.xword	0xca41070a3cfbfcb8
	.xword	0x1e8b2a7972f3d530
	.xword	0x0c850850328ac109
	.xword	0x2ecfc90898048c3a
	.xword	0xc32e0f01e1d973b6
	.xword	0xca42a5a4b864d4ce
	.xword	0x474a13affa8858d5
	.xword	0x661b0079bb13647b
	.xword	0x6715d0b740aced7b
	.xword	0x6d345ced1fff81bd
	.xword	0x6f4efaef7f0a9fcd
	.xword	0xf7291383b5be84d8
	.xword	0x72f5fde9098baada
	.xword	0x3565fffb6b8b5b38
	.xword	0xf862511e7725a585
	.xword	0x95b7df8baf239ed3
	.xword	0xb69e5ec7aaf37a40
	.xword	0xec285950ac973f85
	.xword	0xdf8545c720cbfc3f
	.xword	0xdeff19cd3f317bb0
	.xword	0x0dc78ec494043154
	.xword	0x5fb6ef0aa80ad1f5
	.xword	0xc7f1ab089eae8253
	.xword	0x5ccc873b87cb2440
	.xword	0x6ce49acb596a1324
	.xword	0x04d5bdce60fecbaa
	.xword	0xce11229525e873e4
	.xword	0x9033e85986b52473
	.xword	0x4ba15aa9ffe08cfd
	.xword	0x7c3062140c1254da
	.xword	0x60fb9ef22a2414cf
	.xword	0x2b28f14f3830d812
	.xword	0x189ee8c7465322eb
	.xword	0x4ac070b6bb1914d1
	.xword	0x2b8d26d083854e74
	.xword	0xe5f53e95345a18f7
	.xword	0xfae19150d3575f81
	.xword	0x699806a40c51e3ad
	.xword	0x9ef0b2a0ed9f7136
	.xword	0x00d11f9e800d428e
	.xword	0xe4738d59dcfb580d
	.xword	0x32f6d769ff030d06
	.xword	0x653c168d465de75c
	.xword	0xa8595840782627a3
	.xword	0x45bf2ec7f6986b29
	.xword	0xc91205cafb33740a
	.xword	0x8cb81a7a5e0bf19a
	.xword	0xa21eaf4d8ba5b7e3
	.xword	0x4189a8fe1fd8235f
	.xword	0xd1f825d7b70eabec
	.xword	0x30dd38e7960503b6
	.xword	0xd4d6189460cba0f3
	.xword	0xeb4de6f3ca671bab
	.xword	0xc0fb43e7c3cd4c85
	.xword	0xa29e0b156345d0f3
	.xword	0xf523733eb6f2311d
	.xword	0xe63c6ca50da5ffbc
	.xword	0x8293385840754bf3
	.xword	0xea46dfc32c253678
	.xword	0xab290ee9d7aaf345
	.xword	0xcd90c3970ef7c8e3
	.xword	0xd72dce2c2fbc8b30
	.xword	0x74ab8dba07c1ba24
	.xword	0xe4b99a7bfad1b74f
	.xword	0x8b431b96f4df5bf4
	.xword	0xf5fb71f42410ea90
	.xword	0x10f92fc7c90e4609
	.xword	0x34745578a750467f
	.xword	0x2e0948fab5d31719
	.xword	0x6a3d2251e0cfaba0
	.xword	0xe57e97084316641f
	.xword	0x157b282aae87f96a
	.xword	0xebc37c6baadfc33e
	.xword	0xba4148b5ba357902
	.xword	0xb2f2784ef1812c0e
	.xword	0x5613a8fa498480be
	.xword	0x65500d90401b6458
	.xword	0x853960425b5daa60
	.xword	0x93f58b434af95c72
	.xword	0x7e927dba953c8bc2
	.xword	0x6e33740cb16fa3f6
	.xword	0xecbcf11a5267cbcf
	.xword	0x5d631caa29663174
	.xword	0x6688b77efb3b1481
	.xword	0x6dbae9793b1543fe



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
	.xword	0x1beb603bc470ac52
	.xword	0xd1b44bb77f840ab3
	.xword	0xd291acf22b98dcbb
	.xword	0xbe52b2ffb7bff8a9
	.xword	0xff424558a649499e
	.xword	0x2f31001a7c17bcfa
	.xword	0xfe402be6b0ff49f2
	.xword	0x1dde1bef2b86d9b2
	.xword	0xb96d27cb68404bbe
	.xword	0x02b842ca1fffc522
	.xword	0x78ed18464f65c411
	.xword	0x69a93df2f1fc9968
	.xword	0xf9eebc9a6c278795
	.xword	0x92d63b06f8849b02
	.xword	0xac6477780ff041e7
	.xword	0x40386f462ce8540c
	.xword	0x46b5220131b5cbd9
	.xword	0x77f732f678451880
	.xword	0x560189b0b0ab2786
	.xword	0xb51c2473e53c96d9
	.xword	0x4f80d5ffdb275faf
	.xword	0x178e2fda6254c44f
	.xword	0x0383ceb1d4721347
	.xword	0xe9a5548ebe473369
	.xword	0xe1e9ae3790a30505
	.xword	0x0c5b9319f181a554
	.xword	0xfc75d7fef73daa5b
	.xword	0x1b33d8bcd7f082ec
	.xword	0xd0dc87306126650b
	.xword	0x76e8af74579d9ad5
	.xword	0xe54fc5b3179c8906
	.xword	0x921af24f251e1226
	.xword	0x26725b03a98f13aa
	.xword	0x96765e7ae7d860b0
	.xword	0x503ddad4d490d694
	.xword	0x0076679f7710d179
	.xword	0x744d4566ac591458
	.xword	0x0defd8cde000c5bd
	.xword	0xbbe0cf1dc0f46cf4
	.xword	0xef196fccf0804fb2
	.xword	0x3f415bfae470df4b
	.xword	0xb395ebc5858c7e95
	.xword	0x0dfaf9e9331c8796
	.xword	0xd624e307283fae83
	.xword	0xce2657bcb06b506a
	.xword	0x37d1d58c63549ea9
	.xword	0x9d5811f8c13a84d8
	.xword	0x33b38dc23f8b3c35
	.xword	0x7c6578d0feddce6c
	.xword	0xd0ad40884255dfc7
	.xword	0xea806e7c16aa6218
	.xword	0x48f1d523c1ea3e4f
	.xword	0x4abf0e1ce8e85b6e
	.xword	0xac767d1336ae9c5b
	.xword	0x00816e3385a75a41
	.xword	0xa458b0a453990d5c
	.xword	0xc67f6d359b558a0b
	.xword	0x5303b906ff026640
	.xword	0x68276f4631908beb
	.xword	0x47cc1b9207687175
	.xword	0x2b233665b89f2068
	.xword	0x6438e8c10dedd0c6
	.xword	0x38801090f65e567a
	.xword	0x1668fd36ca9b2411
	.xword	0x3df7e8e58cfe275d
	.xword	0xe637b133f25be924
	.xword	0xb2f882592f16fc6f
	.xword	0x0fc5b2aad762f47e
	.xword	0x16dcb6e116e8b075
	.xword	0xea3ee3570d550498
	.xword	0x3033ea3342e7cccb
	.xword	0x7ced80ee46230237
	.xword	0x3a0ca1394aa577bd
	.xword	0x592deefe35e97d0b
	.xword	0x661bc3f8e22adba9
	.xword	0xadf281d0f96f2714
	.xword	0xea1ff0e5592ed842
	.xword	0xbe7a7bae773920e5
	.xword	0x32cbec84cf35a28d
	.xword	0xe6d6c28f310c6791
	.xword	0xd3fd6fa5249e70b9
	.xword	0x97aa01d0b84b3bb2
	.xword	0xfa0b87c1360cdd7d
	.xword	0x0b00593629275f6e
	.xword	0x2ae7f21f2ea0ed5b
	.xword	0x5aa7905c2d5af694
	.xword	0xab18db94b9416efa
	.xword	0x71949a9918e476dc
	.xword	0x848fa495e0e84909
	.xword	0xc31b52738ca31849
	.xword	0xb49f90868f5b0460
	.xword	0x5319ac27daa9d70f
	.xword	0xe9ed1fa594fb5c84
	.xword	0x1655b302031675ec
	.xword	0x1ce35b2c4f6296b1
	.xword	0x2fb8485001219603
	.xword	0x20c7a89fbc2bc7d1
	.xword	0xe300130f7ce4c3eb
	.xword	0x17f8df808aa804c0
	.xword	0x7918ef3c6ac046a3
	.xword	0xbc2789d262b641bf
	.xword	0x4c39543d5df9466d
	.xword	0x00041ed07c848869
	.xword	0xf8a374966e076e4f
	.xword	0x43cb9bdee745c569
	.xword	0x41fae8af7635748c
	.xword	0x0260cf99b313babf
	.xword	0x7424bdc681c9ecfd
	.xword	0xf381d562bb05c353
	.xword	0xd7bbf637db94efdf
	.xword	0x6073d384d6413c86
	.xword	0x075d81b673064966
	.xword	0x3c624c7c44eaf510
	.xword	0x315f07d19f342b76
	.xword	0xd684b0df45a89b3c
	.xword	0xa812f8c1f7486823
	.xword	0x9bee2fa77816bf5f
	.xword	0x35be5ea932c2f746
	.xword	0x02042edadbb73916
	.xword	0x6063bf134354aa02
	.xword	0xf2be3dc8daa4ce7c
	.xword	0x798799b7efba0542
	.xword	0x48de574e89ebc465
	.xword	0x997df17934e123f8
	.xword	0x52b0dba807e1ad96
	.xword	0xcbd809983f7efaa2
	.xword	0xfe992180b6ebc425
	.xword	0x336edb80370251f6
	.xword	0xaa71dbfb15b8c1ce
	.xword	0x86708093f56cf1f7
	.xword	0x6b3c1ba486707f6b
	.xword	0x664ce3f6768488a4
	.xword	0xe66f5465c4f06c90
	.xword	0xee944328735f253d
	.xword	0x0d859d97ca77738a
	.xword	0x9690934b866b116c
	.xword	0xfbe9420afbb5669f
	.xword	0x083974fa74f27a08
	.xword	0xc13aa18554480956
	.xword	0x37bbedb1637d6989
	.xword	0x014c615aad16ad06
	.xword	0x2f2e3dc444443aea
	.xword	0x72fc20b7eedce302
	.xword	0x9897c822a58bc8cd
	.xword	0xbe98b69793b9ffa5
	.xword	0x5082f43ea9287b6c
	.xword	0xfe2b5479249fc3a7
	.xword	0x09999a5f433146d4
	.xword	0xb771dd769ffc2047
	.xword	0x8ffb5c01fb6e4cc5
	.xword	0xb4921291bd8048d5
	.xword	0x12a756c24af3f451
	.xword	0x437b3f71cc4608a0
	.xword	0x33f64d81f797add8
	.xword	0xc99825be0c2b58ca
	.xword	0xe0d08113fc615a02
	.xword	0x9937e90aee5e46f9
	.xword	0x62e89de10d89d8ef
	.xword	0x7597793cd87a10af
	.xword	0xc43205f12bc94bdd
	.xword	0xb9ec0fe27d9be339
	.xword	0x30fa5ac5a865cb23
	.xword	0xafe86f230814f2e3
	.xword	0x3bf4728fa4e87e41
	.xword	0x93b56174bb6a5c32
	.xword	0xea72d32ddd382c8b
	.xword	0x32f780eccb915675
	.xword	0x3509076aab3b5852
	.xword	0xf2942dbeb1b2641e
	.xword	0x47a1305a80cf63df
	.xword	0x13e43f390284ab1c
	.xword	0x0664671832c90209
	.xword	0x55d73b007e1cd90c
	.xword	0x24e581f468d72b26
	.xword	0xffe9c660004ffcf1
	.xword	0x92f3692cab3a3611
	.xword	0xd40558a882dd0347
	.xword	0x2dfcaa73d6170d72
	.xword	0x331d4a491236bd5f
	.xword	0x4f15a08150642026
	.xword	0x673970452e171639
	.xword	0xb54487bc1a410408
	.xword	0x6a2c02bab27b13b9
	.xword	0x8722dee693dc6162
	.xword	0xe05341cb326f48e3
	.xword	0xb2cc8d84f5ec384f
	.xword	0xbc2f53b2f821072f
	.xword	0xadf41ed4546c1fdd
	.xword	0x0db0cbb97a830487
	.xword	0xe8a3d0c75e10552b
	.xword	0xbd76bd66369a865b
	.xword	0x7dca9731d7791408
	.xword	0xbe3b4a9549ef6aa2
	.xword	0xfc43128814c95245
	.xword	0x0e9378f88005bbf4
	.xword	0xda8ea0247ec2f804
	.xword	0x1889a8eccc267d95
	.xword	0xa1caf57c926d2453
	.xword	0x18b92b97452b54ea
	.xword	0xa6e17923532d3479
	.xword	0x4c613f899d42ef9a
	.xword	0xe45db6606f2d054d
	.xword	0x998f1078029fe997
	.xword	0x831bd19e14064ae6
	.xword	0x55def1d63ec2a344
	.xword	0xbea4ad2df83d91a5
	.xword	0x85d6cff2a6461d87
	.xword	0xc6def97f58038cab
	.xword	0x17b32b1911c6be7f
	.xword	0x956162d83e406405
	.xword	0x5d2b2ece64c0fe35
	.xword	0xa825576c6ab2fc48
	.xword	0x6d3939af6f9731a1
	.xword	0x444efc13fa8303f8
	.xword	0x970657d3783e6f53
	.xword	0xd576ec98333c1b8f
	.xword	0xedbeec84624a334b
	.xword	0x863a91ddefe07e87
	.xword	0x829fd31bb6573648
	.xword	0x77e4148ec14a2df8
	.xword	0x52e16d9bcb6a47a6
	.xword	0x229165773ce730f8
	.xword	0x632ea95b33ad413d
	.xword	0xc3295c6d194b5bb8
	.xword	0x8e2c3a59cf4baddf
	.xword	0x658b6249532621e2
	.xword	0xa229bb69ecc9c8ac
	.xword	0xf951aa3c8a92d130
	.xword	0x0b40a7324124f898
	.xword	0xc3479895775f5ed1
	.xword	0xaba16dd18c762436
	.xword	0xbba30ab879026013
	.xword	0xf3f2d143e757bb26
	.xword	0x0a8bc2b22ead2128
	.xword	0xff2a9cd0bf7a8c3b
	.xword	0x89f441a0997b8c85
	.xword	0x8a5a2a4f810df6b1
	.xword	0x02be1cb1e63cf914
	.xword	0x52c6b838f58db177
	.xword	0x16e707d54ccc0056
	.xword	0x8bf7cbb4a1b26a94
	.xword	0xfb61d1ef32742b21
	.xword	0xe7e337ad57e6cd11
	.xword	0xdd282935f8e8fffe
	.xword	0x0d68329078c2ed03
	.xword	0xae5cf8634ae6c70c
	.xword	0x35b7de755213cb30
	.xword	0xfe62559eec03da18
	.xword	0xe85735ee13f780d8
	.xword	0xf6679c159e4a3ba5
	.xword	0x7e5eb5b80a1a3b9c
	.xword	0x49c35f929b408768
	.xword	0x0bff41f66fd2e512
	.xword	0x99920732a0b629e1
	.xword	0x16b34166cae35aae
	.xword	0x3fd80029d474ef9c



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
	.xword	0xbb1ec268ced4e871
	.xword	0xd98a650f4e6493c6
	.xword	0xf63b540928d84136
	.xword	0x431f1de129f91fc5
	.xword	0xa38c78cc8c4defe2
	.xword	0x2f8666fcf5ae8f91
	.xword	0x0b606bb2f680e84e
	.xword	0xec0e563fcbaf221f
	.xword	0x33d7e5a861b36dec
	.xword	0x5046777d4d81740f
	.xword	0x88bf47071f0e6f1e
	.xword	0xd3f18b76e3937585
	.xword	0xe26abf4298d1bf19
	.xword	0xb8ea40ad29838cbc
	.xword	0xd50bdba2f6217dfc
	.xword	0x4ca82f0c9b094515
	.xword	0xe8e500fcc9491998
	.xword	0x07ada2acf8d8490c
	.xword	0x4146aad8c8b6ee23
	.xword	0x734c3a6a467e714a
	.xword	0xd6789970c66d8a43
	.xword	0x5f1bfbb4d68745cc
	.xword	0xf79f29c72cb66447
	.xword	0x5efeb6e75df609a5
	.xword	0x7bc8bd3a2a7ae105
	.xword	0x28df3287b14c1257
	.xword	0x4ac34c38c7fadb65
	.xword	0xa5ae3da55a2f35ef
	.xword	0xf258b0ab67b56089
	.xword	0x12151734120cac8d
	.xword	0x2f90f1d20b665557
	.xword	0xfccbd30aa7543202
	.xword	0xe072531c3c691912
	.xword	0x7d33150304e2a6f8
	.xword	0x8a64dd5a35c3c3d6
	.xword	0x64dfb4d9791768ae
	.xword	0xc5704633225031cc
	.xword	0xd0a3a3b4c7e40540
	.xword	0x17669410f4da575d
	.xword	0xce5cdf6a9e6f867a
	.xword	0xa006fb0faa6aa653
	.xword	0x0ee29f57ebfc1bcc
	.xword	0x8bc12d970d2018bc
	.xword	0x39ee50f185b8c961
	.xword	0xec97645f67fdad2b
	.xword	0xf3c5b157a1c79dd6
	.xword	0xd3d02aed0047c31f
	.xword	0x411157d0fd3f3a6b
	.xword	0x029fe31a3b901fd9
	.xword	0x3ca5dbcd65d9ad93
	.xword	0xee9eeee5130957b7
	.xword	0x30038cac79d3b97c
	.xword	0xa3e1079ef2e8f6a6
	.xword	0x9cb32e74416182d9
	.xword	0xe13ea6ff1aba8c09
	.xword	0x873bd7c7eb08c5f3
	.xword	0x202d20549a490bd7
	.xword	0xcafe55f62b2f4d8b
	.xword	0xb04d8fec92f324c2
	.xword	0x3c426a57a5be60c7
	.xword	0x384b490a9be4126f
	.xword	0xae16ba858389d270
	.xword	0xc7fc6e5e03114622
	.xword	0x8d1cde5bd40c45ec
	.xword	0x62eb1d7c6dc1a895
	.xword	0x4be1508d1704abe8
	.xword	0x4f2cddeeac8ec8f5
	.xword	0xc06074f8c9f746cd
	.xword	0x244c735f0b4d0fd0
	.xword	0x87e4cb6cc61673f1
	.xword	0x8abef19c830ebb73
	.xword	0x3b24c5392968adc1
	.xword	0x52c6fad43901c40b
	.xword	0xfa1bf7223a6b4e52
	.xword	0x273b4f07714426ac
	.xword	0x07fb06c5f1593bf8
	.xword	0x8f40aab0aa6f0c68
	.xword	0xdadb6d49d9b4b6ea
	.xword	0xb11645cef2aa1c29
	.xword	0xd3151c29ba9ba72a
	.xword	0xaed3cba9e7afe258
	.xword	0xb86c07cb3d390dd5
	.xword	0x7eb1ff195446488e
	.xword	0x1bd17aae5278eb60
	.xword	0x1174afca8be74c7f
	.xword	0x0347b298ddef874a
	.xword	0xe7160622ff29d8db
	.xword	0xe051971f1dc0149b
	.xword	0x14a122a33f9cfb1c
	.xword	0x4e5f5f5f47d7f1c4
	.xword	0x044d93681de466b9
	.xword	0x5fa1ad645b30d928
	.xword	0x5d379f66c75365f3
	.xword	0xd35038265995339e
	.xword	0x34deb2f51b98cb70
	.xword	0x75e74273bd9659ae
	.xword	0x943152c8b08db356
	.xword	0x5a2871d917de405e
	.xword	0x581a0f6e9df14642
	.xword	0xabb2cb1fb7adc2ae
	.xword	0xc88c6dd2cc2c12cd
	.xword	0x399c5f09184a9e4c
	.xword	0xd69cbf6959527397
	.xword	0x8f5809169ecd5621
	.xword	0xde9f2510c082b15a
	.xword	0xc87d3e6086b0c310
	.xword	0x70840837869351fb
	.xword	0xe60f6d921c268b97
	.xword	0x23fadc3a8672c8f3
	.xword	0xfa8f7fdeab8ebb37
	.xword	0x78b25aa434e896aa
	.xword	0xa66b7836ec841738
	.xword	0x3cb5a4b5e0c6ce27
	.xword	0x68fc46d2920987d4
	.xword	0xcad3e19459b557f7
	.xword	0x546f385b2abe3fe8
	.xword	0x6f248edb52043e6b
	.xword	0x9e413c9e1674acdf
	.xword	0x90fb6210a7716df4
	.xword	0x1ac54dd90a1bfcc8
	.xword	0x54342c19e3ecf3a2
	.xword	0x39095367d5769f8f
	.xword	0x7027dea6d07f2d59
	.xword	0x70bddc3ad061ece5
	.xword	0x31e733cd43846d23
	.xword	0xb569590148e5b577
	.xword	0xf7a014d030062ade
	.xword	0x2d03a91148f2c226
	.xword	0xfaa43ed8177b67f7
	.xword	0x91f96bbfa52622e9
	.xword	0x89ec06420937a660
	.xword	0x88e2779f1a831eab
	.xword	0xbe4e7aa899723d88
	.xword	0xf659d49503280073
	.xword	0x490a3087d8a9fc42
	.xword	0x19339e69edb6d4bc
	.xword	0xcb4565f45f3cb11e
	.xword	0x5a0da54d9c9b22c0
	.xword	0x72ee307e7f8541f0
	.xword	0x1fb2831d5ae947d4
	.xword	0x6f8b292fba9391ae
	.xword	0x86aca7e847c6f4ec
	.xword	0x4cd75aa5997aac2c
	.xword	0x9838c7b190992bf7
	.xword	0xf63596244bc0ae17
	.xword	0x58c07c80465d3fb9
	.xword	0xbe06c98b45733e7d
	.xword	0x76246e8f80685301
	.xword	0xf6243b6be6a15aac
	.xword	0xf1534d2e4693d6f7
	.xword	0x91f10229ce47166e
	.xword	0xf6e4979cb97cfaf3
	.xword	0xc929193ae70b03a3
	.xword	0xf33408a265b0c8d3
	.xword	0xfc29671213cf5a2b
	.xword	0x06254404aaf0d457
	.xword	0x8e78753ec43cbf9b
	.xword	0x75071a430da6e838
	.xword	0xd6dfe431225a9be9
	.xword	0xfb857bd238a28019
	.xword	0xd91edcdfc94675ec
	.xword	0xf8ec2e221fd68439
	.xword	0x94bc2c3f5fd18fff
	.xword	0x78b58e137fbf3628
	.xword	0x8f8d6136a5bd76d3
	.xword	0x4fc128ee38858f96
	.xword	0x20a50c9780e64c8f
	.xword	0x89ea08d08f7ed1de
	.xword	0x5f3dc4dab9045c9f
	.xword	0x0c28f787deb3ea8d
	.xword	0xd996d704fc0eeeea
	.xword	0x698a3d5e91cc5da6
	.xword	0x0b28bf7ba7dacf90
	.xword	0xd759d76f340ccaec
	.xword	0xba476e1b655f69a9
	.xword	0x7d7667e5f480c4a9
	.xword	0xc9ce076eab613fa3
	.xword	0x9e8763802ea3a7b8
	.xword	0x0ec9e0bc0b688427
	.xword	0x2a92f650c471165d
	.xword	0x3df949c3b0dc0f43
	.xword	0x8a471b5ed4b3b0c0
	.xword	0xcd6a1aa7dcfae421
	.xword	0xdb518f6a8a4f355f
	.xword	0x80e8df383aefc706
	.xword	0xc4a61d54a9b895cf
	.xword	0x8baccdd9b74c0079
	.xword	0x5ede90249850d4ea
	.xword	0xf0207e76b103f857
	.xword	0xf9dfcb72c569c112
	.xword	0xf65f7660202bb442
	.xword	0x40c33cf4c9f7d10c
	.xword	0x6d1e9fdfca61e66f
	.xword	0x0660b11b007e72f3
	.xword	0x8ef8a6c8a380aacd
	.xword	0x75b45eb3176eabdf
	.xword	0x018aafee690e1a6c
	.xword	0x1666961c3e0dafcb
	.xword	0xd7b733088830fb0f
	.xword	0x8162d9a761c88476
	.xword	0xd3cff19801768332
	.xword	0x9c0898e80c4a4d51
	.xword	0xde35681600926d1f
	.xword	0x5969b3cbc715e26a
	.xword	0xdd9159543753899e
	.xword	0x3dfd1bd626fadd42
	.xword	0x6d484c507312a994
	.xword	0xdfbecdaac0e936e4
	.xword	0x6cc38279c478390f
	.xword	0x8ec685fb77a98321
	.xword	0x6d0ca317f2ff785b
	.xword	0xf38792b631ba1836
	.xword	0xad20d091802e07a9
	.xword	0xdfb009a4579c75b2
	.xword	0xc01959805ae60d0f
	.xword	0xff004f2b84ae13cb
	.xword	0xcdf42d2b5dd6068f
	.xword	0x119aa54d0ae847c1
	.xword	0x93c47a8f176cb40a
	.xword	0x7c1d24472fa3c46d
	.xword	0xc63bd9f8f3cd5c34
	.xword	0xe487b8e1ad40f2ee
	.xword	0x8a66c264b3fc6545
	.xword	0x3ae481defa0b08ee
	.xword	0x77b5ebc64f0f6ba2
	.xword	0x16b604987e2b07b3
	.xword	0x19d6ff1ae4a05947
	.xword	0x21bc89f117df6026
	.xword	0x869ad49f481f1ecf
	.xword	0xfe14b7b6ae6f06b0
	.xword	0xd403beb641ef6f9f
	.xword	0x64f715d9732defbf
	.xword	0x9bc818b12c68b487
	.xword	0xd1449c0a1363afeb
	.xword	0x62ee010563f7f7b3
	.xword	0xcc4c77a135add7af
	.xword	0xdebd0246a0bc7c87
	.xword	0x428bcacfbb9f7b2b
	.xword	0x235635a144cb7cae
	.xword	0x5e6433115efa81c1
	.xword	0xe1203fbad6ec3a81
	.xword	0x5d1d3bd023f7b584
	.xword	0x9ba547d7157866a3
	.xword	0xf841a310d71e4a1b
	.xword	0x583f977c0765af44
	.xword	0xc36c7edcb20f418e
	.xword	0x042e436b6744feef
	.xword	0xddfde29a03f82533
	.xword	0x31da6f2f1953d1a5
	.xword	0xf1c2383754992155
	.xword	0x1a136b0cd5d12b6a
	.xword	0x023d16d50e4ad9be
	.xword	0x9435cb0e8f237a88
	.xword	0x065af435223b77ff
	.xword	0xbaaa2fefbb0c2921
	.xword	0x31f9d3eebfd526e6



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
	.xword	0x2ce4c3ed803bb10e
	.xword	0x4bc9e7eb4f78c1ca
	.xword	0x97ab20a7801f8c0c
	.xword	0x0526eab1e0018d79
	.xword	0x2a07c6083829ee41
	.xword	0x8efdf293cfeccd0f
	.xword	0x2822c4e859d4785a
	.xword	0x3e38fb7e5500148c
	.xword	0x766349c1a80e3547
	.xword	0x0bf97b6292858f88
	.xword	0x36f0cb59cf27ac16
	.xword	0x9adb8c467701f016
	.xword	0xb89d04691be260df
	.xword	0x19c92f30f542ac1d
	.xword	0x1b4d5730d414b939
	.xword	0xf5e73839f71a5a60
	.xword	0x5b5114f8928ad125
	.xword	0x90aef4a5dda0ee48
	.xword	0x569eea01b92b278f
	.xword	0x07f7337dd5f99401
	.xword	0x23d8dd6ae350cc56
	.xword	0x2296ec58faeae8ec
	.xword	0xeda97ffd4a30f5b3
	.xword	0x1bda6710cee7b5df
	.xword	0x049aa00f67e1224d
	.xword	0x6d7c9997a75abe05
	.xword	0xc2fc16fcc53fd9dd
	.xword	0x95ca74f3c82ae4fe
	.xword	0x66a84597b390683d
	.xword	0x47502b3da893fa69
	.xword	0x9c2c5776ae13fcea
	.xword	0x6d0e77c80e08b5e1
	.xword	0x64504f50f068de9b
	.xword	0xa39a1493e4e7f5ad
	.xword	0x026548753001d2cf
	.xword	0x0e26b36306218017
	.xword	0x7546c9a6c5b4115d
	.xword	0x8256583fbfa43804
	.xword	0xb3b9c33e7d41e9e2
	.xword	0x405c72230f6f7983
	.xword	0x7b2111cabf9d528c
	.xword	0xb1885ef6c56b040a
	.xword	0x2be53f6320ab9dfd
	.xword	0x4d760f263ddb73e0
	.xword	0x16f988d52d2aebbf
	.xword	0x7dd7e1cd33d3cac3
	.xword	0x41f5d45886668f0a
	.xword	0x0670d48edd212538
	.xword	0x03f35d385945a618
	.xword	0x8bdcd8ae9c0eeb42
	.xword	0x18e2faf44d6ca6af
	.xword	0x59a333635ab01ab0
	.xword	0xcf97ccefedf383d3
	.xword	0x687d1f70284bb48e
	.xword	0x4745f4dcf68973c6
	.xword	0x4fdc4192558d7714
	.xword	0xe103e07ec1ea5b9a
	.xword	0xf66ca2f7a2c51ffe
	.xword	0xb3ffdae0f1bd00af
	.xword	0x30a8049d1a9d0789
	.xword	0x0ba0c9fa860d9160
	.xword	0x4ad0dfc9e33ba4dd
	.xword	0x9a3f54f1869b0337
	.xword	0x4f0c180944501b2e
	.xword	0xdb814786712af722
	.xword	0x23cb211296ce8c34
	.xword	0xefb18b573b564089
	.xword	0xb7c41c57c8a24680
	.xword	0xb91e00d041415193
	.xword	0xcdee41a0101ea2cf
	.xword	0x39b4cf3583905edc
	.xword	0xaf23bf104c0a9969
	.xword	0x08efa3e2da9163d9
	.xword	0x7f22f50435544462
	.xword	0x8b6156597be93d4c
	.xword	0xedc61d893b983960
	.xword	0x2689ad9b6c109962
	.xword	0x8a74d8666045c04c
	.xword	0xf15ed71001c7132a
	.xword	0x63717f0e0560f375
	.xword	0x4630d2087da9496c
	.xword	0xee4d042d36948b5b
	.xword	0xdd62c45481c837ff
	.xword	0x731d2ce3c7bfcd9f
	.xword	0xd3496ead224a562b
	.xword	0x7b16d8d17acf511b
	.xword	0x3a7802914d2ea49c
	.xword	0x4fcf9db80ab040c8
	.xword	0x6cea506d9cd76079
	.xword	0xfe6a4d2debb51fdf
	.xword	0xd138e5c621cb4901
	.xword	0x831d17d079efd638
	.xword	0xa934e5bb75b6e691
	.xword	0x25098f63972a5293
	.xword	0x30767cc2c1757f10
	.xword	0x796b2de5e00a96f0
	.xword	0x8e50ba8c6012d66d
	.xword	0xbe45641f06ea698b
	.xword	0x9856f579658a5a4d
	.xword	0x729c2737df373bb2
	.xword	0x7e7c9d3fc1d632ba
	.xword	0x20d170d5e6eee71d
	.xword	0x0dab8882d1452e33
	.xword	0x4368169a30cd4ebe
	.xword	0x5efec250a9971fb8
	.xword	0x2a831a559437dc8b
	.xword	0x191f6ad456ea235b
	.xword	0x4975a35450f36abf
	.xword	0x18e186cf3c11819f
	.xword	0xcc2a0f4f8aea81f8
	.xword	0x67fe8696a7a96f57
	.xword	0xd135d15e6f4b13b8
	.xword	0x7d0607d6ad727064
	.xword	0x68e199a85fe33fb7
	.xword	0xefdcfd8f4be671e3
	.xword	0x6839ec582523f77b
	.xword	0x1b368d3dca02b2fc
	.xword	0x1a0917abf7f35ad8
	.xword	0x09b358a05d4e9c38
	.xword	0x38db46dc046fa800
	.xword	0x196b2f847256de5b
	.xword	0xf6bb55a149fa473c
	.xword	0xc1291985417b2e74
	.xword	0x1ce5821e8eebc966
	.xword	0xa5fda8949a0e9570
	.xword	0x099efd7ffcb12771
	.xword	0xa1435c78b2ccd9e9
	.xword	0xfb7c79897cd54145
	.xword	0xe0276336e4a0c59e
	.xword	0xf303f1483a76f032
	.xword	0x627fd42587252fd8
	.xword	0x31fb2a4d88d29372
	.xword	0xa2d8b0e74d2847bc
	.xword	0x11fd7f66be9dd724
	.xword	0x853a07aee665476d
	.xword	0xa66be07ceeb4c873
	.xword	0x496b38c8338147b6
	.xword	0x89a11b57f7484d43
	.xword	0xd13a95cc1b271e9c
	.xword	0x5c239857134ad02d
	.xword	0xcc314d4d13932a2d
	.xword	0xdf9f74b9caa1c30c
	.xword	0xef7d6f879c8e3d8c
	.xword	0xc66ad717fd980d13
	.xword	0x3d8cc2fbc914d529
	.xword	0xef98220447c5245b
	.xword	0x15605f88bf37a139
	.xword	0x29663fed8d86fb4c
	.xword	0xe44c55d515e718b8
	.xword	0x7a5eda48af71c169
	.xword	0x0d2feb7555d4a678
	.xword	0x15ad9e56ab826a3f
	.xword	0xe21077c77b6db314
	.xword	0xafa38b1875de677c
	.xword	0xb13c0efd6ef2383d
	.xword	0x1ac50180a5d8ddaf
	.xword	0x6d9218f0ae22e050
	.xword	0x8000e026fbf89eaf
	.xword	0xb3532178ef0e8f72
	.xword	0x787379a3bebb8e45
	.xword	0x29fe1774ec268857
	.xword	0x208a213f92bd1554
	.xword	0x1a867ce8a80c4d1d
	.xword	0x1c3b33c5de5d5b6c
	.xword	0x942907975f37d822
	.xword	0x6196eab90ed5cfc2
	.xword	0x281ce84356736a36
	.xword	0xb11bb5adca6dea60
	.xword	0xa2f364e460faca7f
	.xword	0xd2a262814119b333
	.xword	0x98455d3dac8b5caf
	.xword	0xe602af63ffbfb6b6
	.xword	0x083cbce113ed8e92
	.xword	0x9b07a5f6f4bcf609
	.xword	0xf9e3922542d43dec
	.xword	0x82cf41ff0cb88699
	.xword	0x89d65eaa4f25e353
	.xword	0xc02b47c151cf10cf
	.xword	0xa54a996f390d0d22
	.xword	0xa58e491796c3316b
	.xword	0x12273ed9189c0a68
	.xword	0x64b471bfe3a51804
	.xword	0x86f0dfc5dea0ec09
	.xword	0x54ebd2fa0a570379
	.xword	0x29783e4a2603b1df
	.xword	0xa76a59202d2cf2f9
	.xword	0x4346e9dd90712119
	.xword	0xb836dc3f6b5e1815
	.xword	0xcc1d8fbec8b1a468
	.xword	0xd31cec799243df62
	.xword	0x53a2b52c35cda9f5
	.xword	0xe39e4d91b1bcd255
	.xword	0x6cf71311b34d250e
	.xword	0xa367169d4c8f206e
	.xword	0x24349136dec70a8d
	.xword	0xfdc32e9043261ec1
	.xword	0x63e243ca4a6e92e4
	.xword	0xe22e48e6a6a2e267
	.xword	0x1548c6ddc76f1168
	.xword	0xeb6cac9c48932a40
	.xword	0x1ab27518625af45e
	.xword	0x659123e61d123da4
	.xword	0x5aaacec91aa63812
	.xword	0x122a91181a04343a
	.xword	0x734bf48163e9f4c0
	.xword	0x7dbfc28a9a7b9f5e
	.xword	0x208fe6e121941550
	.xword	0xe0330140a83dde53
	.xword	0x1f2160034cc5cc92
	.xword	0xcd51b017d3221074
	.xword	0xc292ea46969c7f2d
	.xword	0x8265d61638f6fcda
	.xword	0x896b0b1547130fac
	.xword	0x7d452094ac03b04f
	.xword	0xdafa207ca45635fe
	.xword	0x3e78187c698287bc
	.xword	0x993f3ef28ed7ed16
	.xword	0xac2d0e83f07980fc
	.xword	0x53d610d03cd5d84c
	.xword	0xe224981e6ebcbb02
	.xword	0x22073edddfdf6ae4
	.xword	0x8fd322b9a4cb389d
	.xword	0xaf295aa0f3d9f0af
	.xword	0x71ea1fb8037903bd
	.xword	0xaddb4d507011b939
	.xword	0x037c98c2265c29ad
	.xword	0xc7881a442c6c7af5
	.xword	0x83b8935463cc50eb
	.xword	0xd8e25cb80c2fd5c2
	.xword	0xdd272372cb5505f9
	.xword	0x31c70030371a0e55
	.xword	0xe43bcd7d4738cad9
	.xword	0x944a5f2960491897
	.xword	0xd08e26d25a4261a7
	.xword	0x373bb3fb21223fe8
	.xword	0x45f2503d4170f63f
	.xword	0x7019293c496b78b9
	.xword	0x0055e0ee3ba89fdd
	.xword	0x1bef50783fb188f6
	.xword	0x815434de1578c7d3
	.xword	0xd6e467a9a53168a8
	.xword	0xe89d9a8a7e6d2966
	.xword	0x1b2db554ae296a1f
	.xword	0x8c0c1dbfd2a5b57b
	.xword	0xaf9876ea04134bd0
	.xword	0x360a126ba58463c6
	.xword	0xb4df3a943db044b9
	.xword	0x09bd5a086cd56783
	.xword	0xb473ac8bc9cb36ed
	.xword	0x7615f02f1ce73e1c
	.xword	0x886df5db10c2530f
	.xword	0xb7642f0361c501d5
	.xword	0x9eb0c864d1ff2c4f
	.xword	0x72ee014cdfa8bc7f
	.xword	0x067b160f5d16db55
	.xword	0x97f2bc844534590c



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
	.xword	0x8aa1ccd03c5cfb4a
	.xword	0x7a5ca67540bba38b
	.xword	0x075a3dc32d6d971e
	.xword	0x9f8ee4085cb7e80a
	.xword	0x6bae0661f9d00dbf
	.xword	0xdddf3b66188cd755
	.xword	0x24cd61477cd2d48b
	.xword	0x0d2b242962272360
	.xword	0x6c8f57b44a36ed53
	.xword	0x1536ca86af819d7f
	.xword	0x4e5fbbfddd491945
	.xword	0x16979fa0b29a7a0a
	.xword	0x5f93b29b7715ed9f
	.xword	0xd77397a5ce0a4437
	.xword	0x90593aefaeef7964
	.xword	0x13485d287d67cbe2
	.xword	0xd6463cc22929a14e
	.xword	0x092a9fefb8ffd20e
	.xword	0x198449dd5a39250a
	.xword	0xadf2edc18d6d47ff
	.xword	0xf21f474d7182b542
	.xword	0xfcf13cec2cf9f647
	.xword	0x7e65ecaba357153f
	.xword	0xfe8000bbf1cbea3d
	.xword	0xbc867018c0a1e2bf
	.xword	0x0e3ad32985387b94
	.xword	0x23788010432543bd
	.xword	0x43fc070d0e7233af
	.xword	0xfb271151711fe81b
	.xword	0x5217ff9d3b76fe5e
	.xword	0x9b2852bb5eff0dcc
	.xword	0xc681bfc76be729a2
	.xword	0x284232144cfe9253
	.xword	0xedafe26225fb0f0f
	.xword	0x5ab9e149c938883a
	.xword	0xcaff994eb2480865
	.xword	0xf1f4271b497e5c71
	.xword	0xc4c9962a24373b5a
	.xword	0x460b67a199dbb22b
	.xword	0x0011fb10fe875a77
	.xword	0x3ab90bd508dba9f6
	.xword	0x723aea96b0012017
	.xword	0x6ddb0a371e20ce7d
	.xword	0xf7ba4d630d4c5550
	.xword	0xfc23a66083cc6ac8
	.xword	0xb3522921d90194c6
	.xword	0x3573c38bc7084671
	.xword	0xd045f8a2ef355e3b
	.xword	0xcd44da9c91f1b68b
	.xword	0xe794d2ccd081f03c
	.xword	0xaaa9d4ac3b273719
	.xword	0x065a421015dbe6f7
	.xword	0xb0709d424ff113f3
	.xword	0xeb1553af8fa7e8db
	.xword	0xf9fc00ce06f00943
	.xword	0xe2285a4a64a09f6c
	.xword	0x7f1f5230bd4f8432
	.xword	0xd7fbe11214638aa9
	.xword	0xfc051a33624fee4d
	.xword	0xa26b67d621045512
	.xword	0xc587d270fffcc5b7
	.xword	0x844c43960c0f0d7c
	.xword	0x7d8b6eb62b24e4c5
	.xword	0x338677e45e8a4649
	.xword	0x57d5717301812710
	.xword	0xfa41cb3b7bda87c5
	.xword	0x6d41f31c02c8554b
	.xword	0x2091f55700706134
	.xword	0x481f73c44b3ba9de
	.xword	0xcf7c89538ab071bf
	.xword	0x9633b8498f35c4f8
	.xword	0xd661d386b65c0430
	.xword	0x0e69b3a96c6eaec7
	.xword	0x700792955ff20958
	.xword	0x4e367b06a628b6f3
	.xword	0xa35318c9ebc77b96
	.xword	0x93c4ecaa61ae8d06
	.xword	0xde819e8b7fc64eaa
	.xword	0xb135cbc0fad1bbe2
	.xword	0x591d435ce3cd830c
	.xword	0xdd7360f695d7599c
	.xword	0x3e489935bccd2df8
	.xword	0x4c0a2f48454cf7b8
	.xword	0x3673ccf6f0bc8001
	.xword	0x34e234365310b03c
	.xword	0x065c3632caf46491
	.xword	0xdc989dc54402f49b
	.xword	0x0dfef2295a7ed35f
	.xword	0x477e1f4463d6e8c6
	.xword	0xcc69c1c992b9066a
	.xword	0x67cf217f2a024f11
	.xword	0xa72ff279e34f1f0d
	.xword	0xd2be03ccdc4b1c90
	.xword	0x3fcf345608ff1c16
	.xword	0x543bc7f64edbb6ea
	.xword	0x30f0341bc7d1051b
	.xword	0xf7f761f0d5ec7edf
	.xword	0xa9db821071f8d05d
	.xword	0xc676a4404ac7df3c
	.xword	0xfbd38cec0e328626
	.xword	0x8c121d495c59bf43
	.xword	0x84eefc373188091b
	.xword	0x1bd5a8e0923bf791
	.xword	0xd328012098bc8360
	.xword	0x677296f9faf27de3
	.xword	0x1ad105648a172fd8
	.xword	0xf852e25a1c0e0f00
	.xword	0x963a394d0f326ea6
	.xword	0x48abd4c3e813619d
	.xword	0xa229bafaa19c2400
	.xword	0x46ecfeedffde3426
	.xword	0x4b8affe12e5a14c5
	.xword	0x58a459d40472d4bb
	.xword	0x8cc52164a9bb6c5c
	.xword	0xa58e234ab058a4af
	.xword	0x79827f782775312d
	.xword	0x79831fa0a61b0e98
	.xword	0x482c02e6192755c4
	.xword	0xd247aa9465fdd68c
	.xword	0xbecc27b1cfc38349
	.xword	0x2edd582c67a14ee7
	.xword	0x4e75582fb2ad709d
	.xword	0x416a1756d537db9c
	.xword	0x0f44df512dc40428
	.xword	0x1f7b5d73251fce15
	.xword	0xc6ca29f74ff49d38
	.xword	0x3bf454f89e58fb22
	.xword	0xe02d5468e35ae87e
	.xword	0x7d5f5d84e639eb76
	.xword	0xc702b95eaf3690e6
	.xword	0x77543535d2cfefc4
	.xword	0x6e08d17baac75ae1
	.xword	0x0b01272add088302
	.xword	0x8a06c60822393a0f
	.xword	0x3e255d6c5d8f63eb
	.xword	0x9d24aa3165440d6c
	.xword	0x7263cd29224be71a
	.xword	0x51a8bad10af2f7d4
	.xword	0x30f9458b696f9085
	.xword	0x6d8d059dea86e2d1
	.xword	0xa3a1d57928801956
	.xword	0xd20f268df6657a78
	.xword	0xcc7ddeca3ae6c1c9
	.xword	0x1816c889d1b29f7c
	.xword	0x05b9055a5a20d0a0
	.xword	0x9beef34460e58b15
	.xword	0x9eec856c2992267f
	.xword	0x9682d7a13e0a90d8
	.xword	0x72b3a5d9d8e05e83
	.xword	0x796cc29edd1bb87b
	.xword	0x3a6c40099170e89b
	.xword	0xa6157cc517bd895e
	.xword	0x1566ea08f38d4ad6
	.xword	0x62f0cb91dbda0b8e
	.xword	0x41b916556ca3baa5
	.xword	0x4838f46e70dc9fa0
	.xword	0xc21945c8fd485761
	.xword	0x9818b00c8e8cf419
	.xword	0xa12afaf9a7949ab0
	.xword	0x28fb432c25e321dc
	.xword	0xa2aa1593c758c16d
	.xword	0xe190f0ce1e1ea0fb
	.xword	0x201e4d5b1323428f
	.xword	0x18c5121471e5987d
	.xword	0x3730743c3e70e78a
	.xword	0xa0eac3887e0bd36b
	.xword	0x9c04cabfc7c5beb6
	.xword	0xa22691fca5cbd9c5
	.xword	0xb331654a9617f9af
	.xword	0xe6bf12a9d40ab77d
	.xword	0xfaada54746557d2f
	.xword	0xaf0bec9ed82871b9
	.xword	0x6636feacceebe5cb
	.xword	0x272b40f753781c25
	.xword	0x3061429616042caa
	.xword	0x2e8dfbf0e4b79e13
	.xword	0xc511fbd5541540cf
	.xword	0xb669417bde4f2c2c
	.xword	0x3a2f8094f332bf28
	.xword	0xfe9c932c7df39cb6
	.xword	0xfb6460f10d421a0b
	.xword	0xa1b05ad65dff5faa
	.xword	0xc79afcad6de1ef4d
	.xword	0xce006ef7035a2ec7
	.xword	0x25c5e8cac6dd334a
	.xword	0x2b9de0b69b18120b
	.xword	0xc1cb35152a256e91
	.xword	0x64812125fde1ee67
	.xword	0x57f19a095cd2bd89
	.xword	0x0d6f261f8e305ab0
	.xword	0xbadd98a4ae711a52
	.xword	0x4b36690adab769b5
	.xword	0x6f42e532d70e96c7
	.xword	0x22c26237cf5ed970
	.xword	0xbc3220c086bc5c2a
	.xword	0x8cdf35f942ff0266
	.xword	0x0359050b34b3e273
	.xword	0x6b1b184159acae69
	.xword	0x690a4c5132e68012
	.xword	0x1ee3518977233236
	.xword	0xc97e76e0bf1ea440
	.xword	0x328d501946108e57
	.xword	0xb599e27f577bfeb2
	.xword	0x230ba5f9a977fffb
	.xword	0xd23ae041afe9711d
	.xword	0x5985a5f9451b4519
	.xword	0x329720e81c7a15bf
	.xword	0x135a628aa5a7d9c4
	.xword	0xc3865d20f1cf5e8c
	.xword	0x92c1b62f545e2282
	.xword	0x3f57cfa2fd357ff8
	.xword	0x23b31852eda63ec6
	.xword	0x186db9fb85901185
	.xword	0x56204757e72afdad
	.xword	0xac36b1e6067b6508
	.xword	0xc41b708dbc39a0dc
	.xword	0xd9a70739e41766a4
	.xword	0xeb92baf5a3a3da4d
	.xword	0x18082f57ea8e694a
	.xword	0x0dc3192fbf5029bc
	.xword	0xcd358375205ebce7
	.xword	0xd6a1910687ee29ce
	.xword	0x5695225ee1c64035
	.xword	0xac8feddfd9bffd1e
	.xword	0xd5678894ac82d45c
	.xword	0x15152429f0b80040
	.xword	0x5e6682c267375296
	.xword	0x5715cf3d65eeb9e9
	.xword	0x10e30f91dd99587e
	.xword	0xae4bd40173cbd0a2
	.xword	0xbf4386ad01686d7a
	.xword	0xda0dd563866024a1
	.xword	0xc5e1b79ea69eba54
	.xword	0xe7b026408d38b0db
	.xword	0xdb9fcec89bb4e187
	.xword	0xcdd9881e33cf4052
	.xword	0xa16fb6daf3af58ca
	.xword	0x379fa1d72978e193
	.xword	0xce5a19838ac4b4f1
	.xword	0x97aa9e4502f15faf
	.xword	0xb9d05ac529c98e66
	.xword	0x5a83bd85b0fad988
	.xword	0xdf5826d7277e71ae
	.xword	0x4b03002c41c09bd4
	.xword	0x7c5306fed2eb1a00
	.xword	0x8171f3ca3c60fe27
	.xword	0xcbebc32e5e1123c6
	.xword	0x9163d5729d2ee890
	.xword	0x116a6479af38ab7b
	.xword	0x7cb4c73b652e8fbd
	.xword	0x5aadb518dffbcd73
	.xword	0xf6eb2238063f9074
	.xword	0x3e6fbf0e4b2f02ef
	.xword	0x89968f6aa84e3ef3
	.xword	0x80a991bfbcdfe83d
	.xword	0x6242406a0127beaa



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
	.xword	0x92ed1f0f9d5d4f50
	.xword	0xb152828ae414d532
	.xword	0xbedb673c5a720a70
	.xword	0x17e78250a7bba59f
	.xword	0xc48d17546b0180f8
	.xword	0xe0309b5cdccca2af
	.xword	0xad990d3412f8c67c
	.xword	0x0028555263b41d9e
	.xword	0x81718f75fbdd6d57
	.xword	0xbcdc392ba1060002
	.xword	0xd3dc199b2b10e941
	.xword	0x34a72ec142c8f560
	.xword	0x32b8c2dd9e8fde78
	.xword	0x47beda1e1f947f9d
	.xword	0x9afa22dd7a5af9d1
	.xword	0x9cdf0c79e8b89311
	.xword	0xf90cb7c508682a69
	.xword	0x80fef8131bdf3233
	.xword	0x7ed88f3ec3e0ba5b
	.xword	0x97641750491e5dec
	.xword	0xb533741c6035b51a
	.xword	0xe4ffe34014c920a9
	.xword	0xe554a8ee97d26ed0
	.xword	0xb64cac879940e479
	.xword	0xbba946a866d092b9
	.xword	0xa652ebba220ef2ed
	.xword	0x5e71224d62a66f74
	.xword	0xc1ea37bc3594c39e
	.xword	0xf39629c15506be03
	.xword	0xa54c35de68ca8e7d
	.xword	0xc818e506e24a90b8
	.xword	0x62e5d35ac9c4d94a
	.xword	0x716bef15f450cc7f
	.xword	0x74961495f3c7a3ed
	.xword	0xb9d14f0844d7714f
	.xword	0x92a64452a4647c0d
	.xword	0x747ec60b14e96e4a
	.xword	0x1d522b13a737120c
	.xword	0x93090035aab51034
	.xword	0xde86fb7cd40fb581
	.xword	0xd4e35d15bf1f3ac1
	.xword	0xd6b541782034978a
	.xword	0xea4e8d18a107e48f
	.xword	0xe929db445a871446
	.xword	0x6f447f1b85c52ead
	.xword	0x77c9f3129be2a08a
	.xword	0x7a8659f5cbf3624b
	.xword	0xf7c721113a6909e6
	.xword	0xe7442ee07c07e8df
	.xword	0x3446a65c1e545ced
	.xword	0x2ea61184f23c8193
	.xword	0x66cc1093d45f94db
	.xword	0xa9085b75de8fdf28
	.xword	0x325d50e404847b1a
	.xword	0x6fe3974caf63fa5c
	.xword	0xc4075ee878401d84
	.xword	0xcbf84dc7b4274b7c
	.xword	0x2fe4b470d2610d5a
	.xword	0x77938aa0ebc81c0a
	.xword	0x1adb71b0fff211d6
	.xword	0x16d2b49b06806fb5
	.xword	0xfd4f078e4f8c6608
	.xword	0xa1573415892e6732
	.xword	0x2e294dd99095eafd
	.xword	0x36af3385c1485132
	.xword	0x81412caf3f32ec0f
	.xword	0x3c67b5b9f8b2dee2
	.xword	0x07419aec32e4a921
	.xword	0x9295a993688639f4
	.xword	0x531bac7adb245a5d
	.xword	0xf296a181a7d153fc
	.xword	0xe6b6c04559896c64
	.xword	0x05ff1b38bca75ff4
	.xword	0x7fc37e8403ca66b0
	.xword	0xcbea69a1f392d321
	.xword	0x8d50291ddadb989e
	.xword	0xc34e41421ae98e4b
	.xword	0xe933df607a125b20
	.xword	0xf438ac2112301901
	.xword	0x40f0b257c830b711
	.xword	0x0808491162549536
	.xword	0x8ff76c882b805561
	.xword	0xa9e901f4d7557d88
	.xword	0x8be6319319641b3f
	.xword	0x561e2fe8354333dd
	.xword	0xe264f6d548149a97
	.xword	0xf07c6b0d26e1a373
	.xword	0xa56a99570aa6351f
	.xword	0xd3c95651068d13c5
	.xword	0x4efa20a6f2852466
	.xword	0x61b03497c54a3b23
	.xword	0xc8890cb2c11cdba9
	.xword	0x56e1e70feb9e3d24
	.xword	0x25824338ea940b90
	.xword	0x1c684c0f86d392a0
	.xword	0xc64b271a49e845e3
	.xword	0x43084bdfa10f5ca0
	.xword	0xc0033d4ddba8fa51
	.xword	0x4f2f739a364ed899
	.xword	0xe5697b36eeb8e7d9
	.xword	0x48cbb9561857a3f0
	.xword	0xf40041dc9f74c76d
	.xword	0x85c90329db4ae529
	.xword	0x86d6908f279ae3fa
	.xword	0x058ccb169e85ccff
	.xword	0x203620c846bb6369
	.xword	0xec2034eee0b9d9a6
	.xword	0x054ad50703343090
	.xword	0x1fbab2e5e1ce51d7
	.xword	0xc0f742ad5484aec3
	.xword	0x20e96b83e91d5dba
	.xword	0x9c76df4452134875
	.xword	0x0c21eda647c8927f
	.xword	0x070e96cdeec79996
	.xword	0x856b3b4634ed3e22
	.xword	0xe8df4566fdb435eb
	.xword	0x4d56e7d2706905bc
	.xword	0xad8b4dddfe15d929
	.xword	0xdea06f0ff4ae6a73
	.xword	0x980abdc6da7e9ebf
	.xword	0x5cd32e7bb29a7dc3
	.xword	0x4676d9c3e477e9f6
	.xword	0x8129e637785e0d47
	.xword	0x41a0eefc4da857db
	.xword	0x26cf664a335bb60b
	.xword	0xf4651d680a65365c
	.xword	0x713afefe409d8627
	.xword	0xa1629ff73b38d291
	.xword	0x85259281fef9ae32
	.xword	0x194e86d4261ff713
	.xword	0x0d0dd08909136647
	.xword	0x7a9b4436e7c11f67
	.xword	0x29d38062736c2c41
	.xword	0x392f1c1e78854d42
	.xword	0xfe3d30ff75519f08
	.xword	0xd6ac621336cc8a42
	.xword	0x5689bef0fb12402a
	.xword	0x599fabdfd05bd590
	.xword	0x551a84fcf256963c
	.xword	0x5985e9d6819b1578
	.xword	0xeea856cf52983831
	.xword	0x3ef437316e05c654
	.xword	0xec1b32a50dd904a9
	.xword	0xea836ddb96852557
	.xword	0x7c4db087f4c46a43
	.xword	0x934a80bfe94d10c7
	.xword	0x35778568feb5b233
	.xword	0x8e51b0c94add846c
	.xword	0xf8921aac5edeb264
	.xword	0x17f53cd95bf67a6b
	.xword	0x4ce48c20df01fd16
	.xword	0x613edb3c2322c395
	.xword	0x51864717312abee4
	.xword	0xccc30c45d2a27fae
	.xword	0x79ec40aee3f67fb9
	.xword	0x58c6eeaa9e761cab
	.xword	0x9a69c3cd9dfaed85
	.xword	0xd2a10afd61a1ff88
	.xword	0x1b30994409df3e98
	.xword	0x1cefb3d288891d15
	.xword	0xfdf0361e6c47a065
	.xword	0xda018ecd494a073f
	.xword	0x2d20fe140825c7fa
	.xword	0xfeacad4fe54bd229
	.xword	0x9db03809f4aa95de
	.xword	0x577ee644dbf695ce
	.xword	0xd1bc6976c3647f48
	.xword	0x25637a37201272d2
	.xword	0x35907d48459bae8f
	.xword	0x4bcbbfb69b343649
	.xword	0x5c53b2752288350b
	.xword	0x6e23ed807cd3b9dd
	.xword	0x1fd1853e5ba97065
	.xword	0xf883a6ef6a08f07b
	.xword	0x90e77a9119ff34b7
	.xword	0xb207b6657046cb2d
	.xword	0x55f1a3f609ffec30
	.xword	0x8289a97a56eb132b
	.xword	0xff3951b1e5315c29
	.xword	0x5d5dd0f920339538
	.xword	0x6809e351677bed7a
	.xword	0xf42a59b31ac9be68
	.xword	0x5f606726978145f4
	.xword	0xe5280357315819ff
	.xword	0x64aee8aec58387f8
	.xword	0x07ab6a9c897a693c
	.xword	0x3eb927376b589fcf
	.xword	0x72b2b4e615d92e69
	.xword	0x3631167dbff208cf
	.xword	0x0fb51cf840864449
	.xword	0x6bbae3dfb951ae6f
	.xword	0x88572f0699a2c748
	.xword	0xb82f2cec88bc38e1
	.xword	0x615242d23e89e1fb
	.xword	0x04767f3136ccf9cb
	.xword	0xa43cfcad80acf951
	.xword	0xa391f2e797f57249
	.xword	0x8bc5cdba4148af1d
	.xword	0x8f03ae763ac8261c
	.xword	0xbea8bddd6423cf5a
	.xword	0x0d3d0078b803cbef
	.xword	0x5e2b6ef3196e8af3
	.xword	0x276124f4f0d42714
	.xword	0xe99b47cf0ebc93a0
	.xword	0x91fecdf298f60492
	.xword	0x15dbb6f98bc70cf7
	.xword	0x87be13478086cc9a
	.xword	0x7433f957f5bbb6ef
	.xword	0xad4c226db77a89fb
	.xword	0x0dfd7b5f796e1d1c
	.xword	0x907f677f56961ce2
	.xword	0xae1fca83016526f6
	.xword	0x19b5fbe66defe3b9
	.xword	0x8a151e082d98e8d3
	.xword	0xfcfe0a79be3ed805
	.xword	0xa76e70415f377e6d
	.xword	0x0600ea26312bef67
	.xword	0xbd6ba063b74ad3e3
	.xword	0x242d1e8b539df33d
	.xword	0x1133f761bb21b78f
	.xword	0x3bbff92bda3db212
	.xword	0xcb08143658600896
	.xword	0x5c338307bcf873ef
	.xword	0x74fddfa49b80c8b1
	.xword	0xa33f715ffb23476b
	.xword	0xca9f60bf83e9faaa
	.xword	0x4306f52c0dbea037
	.xword	0x9fc18cd21bfe0848
	.xword	0x2ca09f757e4f6510
	.xword	0x399e5f07eff35880
	.xword	0xf6ec069cb64b2b09
	.xword	0xaf3f4744de3455d4
	.xword	0xe357857ad948a9b7
	.xword	0x7d06946172a6e25a
	.xword	0x842fd432b606ab42
	.xword	0x0096f0bac85cd097
	.xword	0xa5874d77d7e7d9ab
	.xword	0x4bc24a1d6a160eb3
	.xword	0x421f33caaa13af04
	.xword	0x50593f23b52d728e
	.xword	0x2bfa886a8b344fe0
	.xword	0x4565f8fcabbd2770
	.xword	0xb4567e56aac067c5
	.xword	0xfaff388354267fab
	.xword	0xa7df8c3dfb8473a8
	.xword	0xac2fc6b4c7172276
	.xword	0x39556c439e1d557c
	.xword	0xdfcbc2c2d24f0d6c
	.xword	0x3b2cfde760e7825b
	.xword	0x9d80c61aeee24011
	.xword	0xbdef827cf9c29080
	.xword	0x9b186d085ca95dc8
	.xword	0x90b2b08113d32e54
	.xword	0x3b9ca5ecf33b1ded
	.xword	0x31d800e48f8181d8
	.xword	0x3e2b5d7103a8129b



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
	.xword	0xe3584b5745c1ee31
	.xword	0xa5c9fe9381898054
	.xword	0x2a822816a806020f
	.xword	0x0bc35737b79b1c3f
	.xword	0xed405db7cfd8375c
	.xword	0x145204d7ea764d92
	.xword	0x74516459cfe97a69
	.xword	0xff6d50abbf2abac9
	.xword	0x5d79189c0b940fd9
	.xword	0xcee6040b483621fa
	.xword	0x1fe17c22240afdd8
	.xword	0x1c454261a4ba15c0
	.xword	0x971f773e3c56663f
	.xword	0xef9b8cdfe1bfa4b2
	.xword	0xf3c37b09abfe6603
	.xword	0x01a86a29f1109c77
	.xword	0x8d65923ba2150dac
	.xword	0x41af4298b75c3980
	.xword	0xb0bf977cc3e6b5a2
	.xword	0xbbe6c96eea5e5bc3
	.xword	0xd4bad84bd385e552
	.xword	0xb76518409b3cbc4d
	.xword	0xacf8c3a484be111f
	.xword	0x41bfd0f8cf16c1ce
	.xword	0x12b96987b4222395
	.xword	0x5a47270c6664e9c5
	.xword	0xedd4b9551c5db42b
	.xword	0x3a89bbb1a6a2e17c
	.xword	0xdecb5fd725d90c0f
	.xword	0x5dea92328c369a09
	.xword	0xfd7484b8b468e100
	.xword	0x0f3577078e542ee8
	.xword	0x3eac30fb0de3543c
	.xword	0x00bb245f56a0f757
	.xword	0x22f74f94fd4abe05
	.xword	0x74a086dd7f88173b
	.xword	0x3c87bb710a29e98e
	.xword	0x126c86d1e7bbabbd
	.xword	0x88e086d347419385
	.xword	0x7d53192e1d83ddb3
	.xword	0x084ff6266fbcd59a
	.xword	0x016571c4da55c17a
	.xword	0x81ee6d1fe3272063
	.xword	0x14f93b0af546ba26
	.xword	0xa9b9b5e26d9458ca
	.xword	0x8f07e5d0cc7c36fc
	.xword	0x9d45d8405c49f926
	.xword	0xd8d852cca72bc764
	.xword	0x7e6494fde0701a72
	.xword	0x400935d14e598ee7
	.xword	0x43213fb0ee4c36b7
	.xword	0xcbe3e8fe5bb92754
	.xword	0xfe941fd959461189
	.xword	0x93d2ab7fdfde9341
	.xword	0xe93d02cf51089745
	.xword	0x28d7a35a48994956
	.xword	0x1776913c5e952cdb
	.xword	0xde504bcf1079dfb4
	.xword	0x7774dba9d85b52b6
	.xword	0x1dec490d9dfb7dec
	.xword	0x2e526dffa87e818a
	.xword	0xe2ffbd2e4c6dbf41
	.xword	0x3c6d4ce38c7f0439
	.xword	0x6b99e755d7549215
	.xword	0x42ee5b7c48fd6643
	.xword	0xfea5827b841d66d6
	.xword	0xd2c1cd54632101e2
	.xword	0x4ab5e43e3ca9d02a
	.xword	0x4338d07fc79457fe
	.xword	0x85a7dce9f485b9de
	.xword	0x09f978d5dac555ae
	.xword	0xa93da841d5028aa7
	.xword	0x2160a1e2414a2cd4
	.xword	0x6656d66cf431b4c8
	.xword	0xf5203e0120ac0774
	.xword	0xb06187f6e22b95f7
	.xword	0xaaaf5800d7ef7b04
	.xword	0x75bcba64505e3091
	.xword	0x86f9ed6c9f0bea1a
	.xword	0x86cbc04c358f5db4
	.xword	0xbea731f8efe9d907
	.xword	0x49b0873b95b75018
	.xword	0xc64a08b33f32d3c3
	.xword	0x693d846a300ea105
	.xword	0xf5d20846278b08a8
	.xword	0xc66e9ace44998a02
	.xword	0xbe1cf7adc2363e7c
	.xword	0x804e4c31547cccba
	.xword	0x4a59e33a5d02323c
	.xword	0x79a2729d57c5785f
	.xword	0xa7f9737843ee6839
	.xword	0xf12b54b2575de975
	.xword	0xc7bc19576cb4f05e
	.xword	0x61388b5639587f1c
	.xword	0x47e4f1fa692cf352
	.xword	0xceb85e91a1d00134
	.xword	0xf553fa04bb20338d
	.xword	0x1e87f4690ed9a2ee
	.xword	0x4e2ce477e3082a95
	.xword	0x09c3c11fa7a597d2
	.xword	0x46e4d0f5cbd45cd2
	.xword	0x1bf60f330c692582
	.xword	0x0f5b6295580fdd37
	.xword	0x190399007256dabc
	.xword	0x9095c482880ffbb7
	.xword	0x46ed8973fbe51e61
	.xword	0xd07ce64662fdf9b5
	.xword	0xd99619599fa41b28
	.xword	0x44e9f79eb6719879
	.xword	0x4a4722184f913eb6
	.xword	0x91e8a51b7621317a
	.xword	0x11b9c21d8c945ebb
	.xword	0x0435a5f4b96e7e85
	.xword	0x9cebca314c6affbe
	.xword	0xb0f7d54a764dc3d4
	.xword	0x4382c16d40a745fa
	.xword	0xd1fef0395f061173
	.xword	0xf0910259983d6fbb
	.xword	0x7907faa8ffa1655b
	.xword	0x341594fe35261fe7
	.xword	0xfc7294d96e76f695
	.xword	0x00112d4780cf56a3
	.xword	0x904241b6dc8cf166
	.xword	0x9da3097dc6ed1996
	.xword	0x4227dffd40444735
	.xword	0xad28b6fdc359989b
	.xword	0x8abdef6f7bf72008
	.xword	0xe708450d0b505b20
	.xword	0x12216120e0699087
	.xword	0x058a8b1f9fdda003
	.xword	0xebc6f5e5b009ed7c
	.xword	0xe5c9f14e70e191dc
	.xword	0x27feeece2aaf8db0
	.xword	0xb585c6a6f191e1db
	.xword	0x2cc1038bc69521d1
	.xword	0xe821c929dc20322b
	.xword	0x98764206b0c58ac6
	.xword	0xedb20e86ca398b12
	.xword	0xb7b413055ce90291
	.xword	0x736225e0ae279dfd
	.xword	0x3a87a869b3d7eb76
	.xword	0xc3a091f6db8f6e14
	.xword	0xb58fa4997c6e23ce
	.xword	0xd5562215f5a774b9
	.xword	0xe4b16e56dcec55e0
	.xword	0x6b918753e74ec6ea
	.xword	0xb48227b701ed53de
	.xword	0x3322084d0604f5e3
	.xword	0x091402c43336e360
	.xword	0x0598e7f42e89b094
	.xword	0x8b5e6d3d85122825
	.xword	0xc41b064884d58d5f
	.xword	0x36902e83c94107f0
	.xword	0x04a4d1e5e730f8c7
	.xword	0xcd522b9807e80027
	.xword	0x23e9ce255cff4638
	.xword	0x058e75b1a9bc53e5
	.xword	0x5ce8a2a32374e92d
	.xword	0x11d9ac0d99a2850e
	.xword	0x569f13400cd8cb81
	.xword	0xc5ee5e1d207c6bbe
	.xword	0x37c5798819ee5e4e
	.xword	0x6b8cc2d033694fb6
	.xword	0xa144dea1a9011ec3
	.xword	0x79337f36e8f644db
	.xword	0x3fce433975cd9e4a
	.xword	0x00b75dba83fd6523
	.xword	0xd6eb78c9259a5700
	.xword	0xa80b47b16184af24
	.xword	0x65faee2fc0e5eaee
	.xword	0xff1c5fd2155c3c56
	.xword	0x51540f32b3f3e3de
	.xword	0xdddc3175e1a331aa
	.xword	0xb7f1e8391a105c93
	.xword	0xd1732726f34d2cc3
	.xword	0xfcfe857073aa9f51
	.xword	0xc166afec8a58bf41
	.xword	0xba411d9f4ef23ea5
	.xword	0x2d5e4cc7f06c6491
	.xword	0x62fdac02a89f9706
	.xword	0x81a3b73b6eea27e3
	.xword	0xfb44d690329136ad
	.xword	0xd9b9d5179251916b
	.xword	0xf44304bf762255f2
	.xword	0xe3b5e3c4b9aa9b32
	.xword	0x9ae48a8e7a4a6d71
	.xword	0x868b43904f41dba8
	.xword	0x4325309f9d08afcf
	.xword	0xa92203e45d375b4f
	.xword	0xd5a192fd2717d2bf
	.xword	0x3d18dc20e11e42f7
	.xword	0xa9b33c283bb0ccf2
	.xword	0x1c1132f4027a26e6
	.xword	0x6b5db8a6e538a8da
	.xword	0xc5fbeadce03243b1
	.xword	0x593d5e989386337f
	.xword	0x84acb81c106d32ad
	.xword	0x901c7a063f4092f5
	.xword	0xcc81d88eaa80f6c4
	.xword	0x4c1fa24c220c3350
	.xword	0x1b301e874512c098
	.xword	0x4a67513d3a6118eb
	.xword	0x44798fadba4b99da
	.xword	0x713837350ec62349
	.xword	0x01aaabd67e6ae197
	.xword	0x5f6563faba8a5390
	.xword	0x2029ae90235c15ac
	.xword	0x3cead16366d23de6
	.xword	0xde1483ac89c907ff
	.xword	0xf155285007b6a1f4
	.xword	0xdb139b975b416028
	.xword	0x768c7837ee51ac40
	.xword	0xb65d909979d06d58
	.xword	0x7b24a613a5bcfad7
	.xword	0xa3e648f6ba4e9306
	.xword	0x94f93aedb1f25083
	.xword	0xd80ce74b85e6e2ef
	.xword	0x8f00b00064567384
	.xword	0x0e6dcb359f7d76b4
	.xword	0x227290896b5902db
	.xword	0x37bf2e47cacb6c78
	.xword	0x9339c9dbdc952601
	.xword	0x18855d1297e04f60
	.xword	0x97ad1da55e494e4b
	.xword	0x2605c29993b59e75
	.xword	0xde7fae33d1032788
	.xword	0x38be24555fc85c0e
	.xword	0xd473ed038ded6f16
	.xword	0xff915c8844a745a4
	.xword	0x2eea3598578a965b
	.xword	0x65653c4ef68c0f71
	.xword	0xd8c20cac890b106d
	.xword	0x3328e42d6cdb197a
	.xword	0xb369c5159024f24b
	.xword	0x71fdc74d8ad82a6e
	.xword	0x2596648c13d426c7
	.xword	0x804ff5a789719772
	.xword	0x112ab120edb7ab13
	.xword	0x92be1d3b5d1b1808
	.xword	0x68521e961b389473
	.xword	0xfd604f451b2716ef
	.xword	0x47d6c297a8f306c3
	.xword	0xdc0e226a1ab6a0b6
	.xword	0xdef2a0070c5d4ba1
	.xword	0xdcba538a1e7ccd24
	.xword	0x2ae7e2c80924fd32
	.xword	0x174dc0224d2d123e
	.xword	0x0222a19b9194141c
	.xword	0xf38d337a936f0dfa
	.xword	0x35785e304e0edc27
	.xword	0x0ce5e171fe519218
	.xword	0x86b98ad7445985b0
	.xword	0xf2cad61312a95a1b
	.xword	0xc98e116629d57e53
	.xword	0xfae952064fb61b6c
	.xword	0xbbba518a9c17b2b2



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
!!#   int int_cnt = 0;
!!#   int total_int =0;
!!# #define ISEG	0
!!# #define MY_HYP_SEC	1
!!# #define NCDATA0	2
!!# #define NCDATA1	3
!!# #define NCDATA2	4
!!# #define NCDATA3	5
!!# #define NCDATA4	6
!!# #define NCDATA5	7
!!# #define NCDATA6	8
!!# #define PAGE1A	9
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
!!#   IJ_set_rvar ("diag.j", 107, wt_bl, "{30}");
!!#   IJ_set_rvar ("diag.j", 108, wt_alu, "{3}");
!!# 
!!#   IJ_set_rvar ("diag.j", 111, Rv_rand64, "64'hrrrr rrrr rrrr rrrr");
!!#   IJ_set_rvar ("diag.j", 112, Rv_Simm13, "13'b0 0000 rrrr r000");
!!#   IJ_set_rvar ("diag.j", 113, Rv_addr_sel, "3'brrr");
!!# 
!!#   ! keeping CPU ID 0, Agent 0-15 ??
!!#   IJ_set_rvar ("diag.j", 118, Rv_memaddr_pattern_int,
!!#         "24'{0},"
!!# 
!!#         "20'b 0000 1110 0000 0000 0000,"
!!#         "20'b 0000 0000 0000 0000 0000,");
!!# 
!!#   ! keeping CPU ID 0, Agent 0-15 ??
!!#   IJ_set_rvar ("diag.j", 126, Rv_memaddr_pattern_int1,
!!#         "24'{0},"
!!# 
!!#         "20'b 0000 1111 0000 0000 0000,"
!!#         "20'b 0000 0000 0000 0000 0000,");
!!# 
!!#   IJ_set_rvar ("diag.j", 135, Rv_memaddr_pattern_dma,
!!#         "24'{0},"
!!# 
!!#         "20'b 000r rrrr rrrr rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rr00 0000,");
!!# 
!!#   ! only 60* or 61*
!!#   IJ_set_rvar ("diag.j", 144, Rv_memaddr_pattern_io,
!!#         "4'{0},"
!!# 
!!#         "20'b 0000 0000 0000 0000 0110,"
!!#         "20'b 000r rrrr rrrr rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rr00 0000,");
!!# 
!!#   IJ_set_rvar ("diag.j", 153, Rv_rand32, "32'hrrrr rrrr");
!!#   IJ_set_rvar ("diag.j", 154, Rv_rand_mask, "32'h0000 rrrr");
!!# 
!!#   IJ_set_rvar ("diag.j", 157, Rv_memaddr_pattern,
!!#         "24'{0},"
!!# 
!!#         "20'b 0001 0000 rrrr 0000 0001,"
!!#         "20'{0}");
!!# 
!!#   ! Define address patterns for all the various address
!!#   ! spaces in JBI
!!# 
!!#   ! 80_1000_0000 - 80_FFFF_FFFF (Should not be 80_0*)
!!#   IJ_set_rvar ("diag.j", 169, Rv_jbiaddr_pattern0,
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
!!#   IJ_set_rvar ("diag.j", 183, Rv_jbiaddr_pattern1,
!!#         "24'{0},"
!!# 
!!#         "20'b 0000 0000 1101 0000 0010,"
!!#         "20'b 1110 1111 000r rr00 0000,");
!!#          ! init only till 7fff 
!!# 
!!#   ! 80_0F00_0000 - 80_0FFF_FFFF
!!#   IJ_set_rvar ("diag.j", 196, Rv_jbiaddr_pattern2,
!!#         "24'{0},"
!!# 
!!#         "20'b 0000 0000 1101 0000 0011,"
!!#         "20'b 1110 1111 000r rr00 0000,");
!!#          ! init only till 7fff 
!!# 
!!#   ! C0_0000_0000 - CF_FFFF_FFFF
!!#   IJ_set_rvar ("diag.j", 208, Rv_jbiaddr_pattern3,
!!#         "24'{0},"
!!# 
!!#         "20'b 0000 0000 1101 0000 0100,"
!!#         "20'b 1110 1111 000r rr00 0000,");
!!#          ! init only till 7fff 
!!# 
!!#   ! D0_0000_0000 - DF_FFFF_FFFF
!!#   IJ_set_rvar ("diag.j", 220, Rv_jbiaddr_pattern4,
!!#         "24'{0},"
!!# 
!!#         "20'b 0000 0000 1101 0000 0101,"
!!#         "20'b 1110 1111 000r rr00 0000,");
!!#          ! init only till 7fff 
!!# 
!!#   ! E0_0000_0000 - EF_FFFF_FFFF
!!#   IJ_set_rvar ("diag.j", 232, Rv_jbiaddr_pattern5,
!!#         "24'{0},"
!!# 
!!#         "20'b 0000 0000 1101 0000 0110,"
!!#         "20'b 1110 1111 000r rr00 0000,");
!!#          ! init only till 7fff 
!!# 
!!#   ! F0_0000_0000 - FE_FFFF_FFFF ( Should not be FF*)
!!#   IJ_set_rvar ("diag.j", 244, Rv_jbiaddr_pattern6,
!!#         "24'{0},"
!!# 
!!#         "20'b 0000 0000 1101 0000 0111,"
!!#         "20'b 1110 1111 000r rr00 0000,");
!!#          ! init only till 7fff 
!!# 
!!#   ! FF_F000_0000 - FF_FFFF_FFFF 
!!#   IJ_set_rvar ("diag.j", 254, Rv_ssiaddr_pattern,
!!#         "24'{0},"
!!# 
!!#         "20'b 1111 1111 1111 rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr r000,");
!!# 
!!#   ! Other  cases ?? when LOW TH and HG TH are random, HI>LO always (TBD)
!!# 
!!#   IJ_set_rvar ("diag.j", 265, Rv_jbi_fifo_wr0_config,
!!#         "24'{0},"
!!# 
!!#         "20'b 0000 0000 0rrr 0rrr 00rr,"
!!#         "20'b 00rr rrrr 0000 0000 rrrr,");
!!# 
!!#   IJ_set_rvar ("diag.j", 273, Rv_jbi_fifo_wr1_config,
!!#         "24'{0},"
!!# 
!!#         "20'b 0000 0000 0rrr 0rrr 00rr,"
!!#         "20'b 00rr rrrr 1rrr 0000 rrrr,");
!!# 
!!#   IJ_set_ropr_fld    ("diag.j", 281, ijdefault, Ft_Rs1, "{6,7,9,10,11,12,13}");  ! BASE
!!#   IJ_set_ropr_fld    ("diag.j", 282, ijdefault, Ft_Rs2, "{8}");
!!#   IJ_set_ropr_fld    ("diag.j", 283, ijdefault, Ft_Rd, "{16..23}");
!!#   IJ_set_ropr_fld    ("diag.j", 284, Rv_ldstD, Ft_Rd, "{16,18,20,22}");
!!# 
!!#   !IJ_set_ropr_fld    (ijdefault, Ft_Simm13, "13'b0 0000 0000 0000");
!!#   IJ_set_ropr_fld    ("diag.j", 287, ijdefault, Ft_Simm13, "13'b0 0000 00rr r000");
!!#   IJ_set_ropr_fld    ("diag.j", 288, ijdefault, Ft_Imm_Asi, "{0}");
!!# 
!!#   IJ_bind_file_group("diag.j", 292, sjm_4,"sjm_4.cmd", NULL);;
!!#   IJ_bind_file_group("diag.j", 293, sjm_5,"sjm_5.cmd", NULL);;
!!# 
!!#   IJ_bind_thread_group("diag.j", 296, th_M, 0x1);
!!# 
!!#   IJ_printf ("diag.j", 298, sjm_4, "CONFIG id=28 iosyncadr=0x7CF00BEEF00\n");
!!#   IJ_printf ("diag.j", 299, sjm_4, "TIMEOUT 10000000\n");
!!#   IJ_printf ("diag.j", 300, sjm_4, "IOSYNC\n");
!!# 
!!#   IJ_printf ("diag.j", 302, sjm_4, "#==================================================\n");
!!#   IJ_printf ("diag.j", 304, sjm_4, "#==================================================\n");
!!#   IJ_printf ("diag.j", 305, sjm_4, "\n\nLABEL_0:\n");
!!# 
!!#   IJ_printf ("diag.j", 307, sjm_5, "CONFIG id=30 iosyncadr=0x7EF00BEEF00\n");
!!#   IJ_printf ("diag.j", 308, sjm_5, "TIMEOUT 10000000\n");
!!#   IJ_printf ("diag.j", 309, sjm_5, "IOSYNC\n");
!!#   IJ_printf ("diag.j", 310, sjm_5, "#==================================================\n");
!!#   IJ_printf ("diag.j", 312, sjm_5, "#==================================================\n");
!!#   IJ_printf ("diag.j", 313, sjm_5, "\n\nLABEL_0:\n");
!!# 
!!#   IJ_init_regs_by_setx ("diag.j", 316, th_M, 3, 1, Rv_rand64);
!!# 
!!#   IJ_printf ("diag.j", 318, th_M, "\tmov\t0, %%r8\n");
!!#   IJ_printf ("diag.j", 319, th_M, "\tsetx\t0x%016llrx, %%r1, %%r6\n", Rv_jbiaddr_pattern0);
!!#   IJ_printf ("diag.j", 320, th_M, "\tsetx\t0x%016llrx, %%r1, %%r7\n", Rv_jbiaddr_pattern1);
!!#   IJ_printf ("diag.j", 321, th_M, "\tsetx\t0x%016llrx, %%r1, %%r9\n", Rv_jbiaddr_pattern2);
!!#   IJ_printf ("diag.j", 322, th_M, "\tsetx\t0x%016llrx, %%r1, %%r10\n", Rv_jbiaddr_pattern3);
!!#   IJ_printf ("diag.j", 323, th_M, "\tsetx\t0x%016llrx, %%r1, %%r11\n", Rv_jbiaddr_pattern4);
!!#   IJ_printf ("diag.j", 324, th_M, "\tsetx\t0x%016llrx, %%r1, %%r12\n", Rv_jbiaddr_pattern5);
!!#   IJ_printf ("diag.j", 325, th_M, "\tsetx\t0x%016llrx, %%r1, %%r13\n", Rv_jbiaddr_pattern6);
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
!!#   !IJ_printf (sjm_4, "\n\nBA LABEL_0\n");
!!#   !IJ_printf (sjm_5, "\n\nBA LABEL_0\n");
!!# 
!!#   int i,j;
!!#   ! Do this else midas wont put any tsbs for the above.
!!#   for (i = 0; i < 16; i++) {
!!#     IJ_iseg_printf("diag.j", 362,ISEG, i, th_M, ".data\n");
!!#     for (j = 0; j < 256; j++) {
!!#     IJ_iseg_printf("diag.j", 364,ISEG, i, th_M, "\t.xword\t0x%016llrx\n", Rv_rand64);
!!#     }
!!#   }
!!# 
!!#   IJ_printf ("diag.j", 369, th_M, "\tsetx\t0x%016llx, %%r1, %%r6\n",total_int);
!!#   IJ_printf ("diag.j", 370, th_M, "\tsetx\t page1a, %%r1, %%r26\n");
!!#   IJ_printf ("diag.j", 371, th_M, "\tldx\t[%%r26], flagr\n");
!!#   IJ_printf ("diag.j", 372, th_M, "\tcmp\t%%r6, flagr\n");
!!#   IJ_printf ("diag.j", 373, th_M, "\tbne\tbad_end\n");
!!#   IJ_printf ("diag.j", 374, th_M, "\tnop\n");
!!#   IJ_th_start ("diag.j", 375,Seq_Start, NULL, 2);
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
!!# 		IJ_generate ("diag.j", 842, th_M, $2);
!!# 	}
!!# ;
!!# 
!!# inst_type: set_addr  %rvar  wt_alu |
!!#            load      %rvar  wt_ld |
!!#            alu       %rvar  wt_alu |
!!#            block_ld  %rvar  wt_bl |
!!#            block_st  %rvar  wt_bl |
!!#            store     %rvar  wt_ld | sjm4 %rvar  wt_ld | sjm5   %rvar  wt_ld
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
!!# sjm4: set_sjm4_wr_b | set_sjm4_rd_b |  set_sjm4_wr_b_io | set_sjm4_rd_b_io | set_sjm4_wr_io | set_sjm4_rd_io | set_sjm4_wr_m | set_sjm4_wr_m_io | set_sjm4_rd_m_io | set_sjm4_int  
!!# ;
!!# 
!!# set_sjm4_int : mSET_SJM4_INT   
!!#                 {
!!# 
!!#                  if (random()%1 == 0) {
!!#                    total_int++;
!!#                    IJ_printf ("diag.j", 879, sjm_4, "\n");
!!# 
!!#                      sj4_ad =  IJ_get_rvar_val64("diag.j", 881, Rv_memaddr_pattern_int);
!!#                      IJ_printf ("diag.j", 882, sjm_4, "INT  0x%016llx +\n",sj4_ad);
!!#                      IJ_update_rvar("diag.j", 883, Rv_memaddr_pattern_int);
!!# 
!!#                       for (i=0;i<16;i++) { 
!!#                         if(i==2) int_cnt++;
!!#                          !IJ_printf (sjm_4, "# debug %d \n",i);
!!#                          data_st = int_cnt;
!!#                          !data_st = IJ_get_rvar_val32(Rv_rand32);
!!# 			 !IJ_update_rvar(Rv_rand32);
!!#                          if (i%4 == 0) {IJ_printf ("diag.j", 891, sjm_4, "        "); }
!!#                          IJ_printf ("diag.j", 892, sjm_4, "0x%08x ",data_st);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 894, sjm_4, "\n"); else 
!!#                             IJ_printf ("diag.j", 895, sjm_4, "+\n");
!!#                           }
!!#                         }
!!#                          int_cnt++;
!!#                   }
!!#                 }
!!# 
!!# ;  
!!# set_sjm4_wr_b : mSET_SJM4_WR_B
!!#                 {
!!# 
!!#                   if (sjm4_cnt < 8) { 
!!#                    IJ_printf ("diag.j", 907, sjm_4, "\n");
!!#                      sjm4_cnt++;
!!# 
!!#                      sj4_ad =  IJ_get_rvar_val64("diag.j", 910, Rv_memaddr_pattern_dma);
!!#                      sjm0_addr[sjm_wr0] = sj4_ad; 
!!#                      IJ_printf ("diag.j", 912, sjm_4, "WRITEBLK  0x%016llx +\n",sj4_ad);
!!#                      IJ_update_rvar("diag.j", 913, Rv_memaddr_pattern_dma);
!!# 
!!#                       for (i=0;i<16;i++) { 
!!#                          !IJ_printf (sjm_4, "# debug %d \n",i);
!!#                          sjm0_data[sjm_wr0][i] = IJ_get_rvar_val32("diag.j", 917, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 918, Rv_rand32);
!!#                          if (i%4 == 0) {IJ_printf ("diag.j", 919, sjm_4, "        "); }
!!#                          IJ_printf ("diag.j", 920, sjm_4, "0x%08x ",sjm0_data[sjm_wr0][i]);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 922, sjm_4, "\n"); else 
!!#                             IJ_printf ("diag.j", 923, sjm_4, "+\n");
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
!!#                    IJ_printf ("diag.j", 936, sjm_4, "\n");
!!#                      sjm4_cnt--;
!!# 
!!#                      sj4_ad = sjm0_addr[sjm_rd0];
!!#                      IJ_printf ("diag.j", 941, sjm_4, "READBLK  0x%016llx +\n",sj4_ad);
!!# 
!!#                       for (i=0;i<16;i++) { 
!!#                          sjm4_dat = sjm0_data[sjm_rd0][i];
!!#                          if (i%4 == 0) IJ_printf ("diag.j", 945, sjm_4, "        ");
!!#                          IJ_printf ("diag.j", 946, sjm_4, "0x%08x ",sjm4_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 948, sjm_4, "\n"); else 
!!#                             IJ_printf ("diag.j", 949, sjm_4, "+\n");
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
!!#                    IJ_printf ("diag.j", 963, sjm_4, "\n");
!!#                      !sjm4_cnt--;
!!# 
!!#  		     sjm0_w_mask =  IJ_get_rvar_val32("diag.j", 967, Rv_rand_mask);
!!#                      IJ_update_rvar("diag.j", 968, Rv_rand_mask);
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
!!#                      IJ_printf ("diag.j", 985, sjm_4, "WRITEMSK  0x%016llx 0x%016llx +\n",sj4_ad,mask);
!!# 
!!#                       m_tmp = sjm0_w_mask;
!!#                       for (i=0;i<16;i++) { 
!!#                        if (m_tmp & 0x1 ) {
!!#                          sjm0_data[sjm_rd0][i] = IJ_get_rvar_val32("diag.j", 990, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 991, Rv_rand32);
!!#                          sjm4_dat = sjm0_data[sjm_rd0][i];
!!#                          if (i%4 == 0) IJ_printf ("diag.j", 993, sjm_4, "        ");
!!#                          IJ_printf ("diag.j", 994, sjm_4, "0x%08x ",sjm4_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 996, sjm_4, "\n"); else 
!!#                             IJ_printf ("diag.j", 997, sjm_4, "+\n");
!!#                            }
!!#                         } else {
!!#                          !sjm4_dat = sjm0_data[sjm_rd0][i];
!!#                          sjm4_dat = 0;
!!#                          if (i%4 == 0) IJ_printf ("diag.j", 1002, sjm_4, "        ");
!!#                          IJ_printf ("diag.j", 1003, sjm_4, "0x%08x ",sjm4_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 1005, sjm_4, "\n"); else 
!!#                             IJ_printf ("diag.j", 1006, sjm_4, "+\n");
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
!!#                    IJ_printf ("diag.j", 1023, sjm_4, "\n");
!!#                      sjm4_cnt_io++;
!!# 
!!#                      sj4_ad =  IJ_get_rvar_val64("diag.j", 1026, Rv_memaddr_pattern_io);
!!#                      sjm0_addr_io[sjm_wr0_io] = sj4_ad; 
!!#                      IJ_printf ("diag.j", 1028, sjm_4, "WRITEBLKIO  0x%016llx +\n",sj4_ad);
!!#                      IJ_update_rvar("diag.j", 1029, Rv_memaddr_pattern_io);
!!# 
!!#                       for (i=0;i<16;i++) { 
!!#                          !IJ_printf (sjm_4, "# debug %d \n",i);
!!#                          sjm0_data_io[sjm_wr0_io][i] = IJ_get_rvar_val32("diag.j", 1033, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 1034, Rv_rand32);
!!#                          if (i%4 == 0) {IJ_printf ("diag.j", 1035, sjm_4, "        "); }
!!#                          IJ_printf ("diag.j", 1036, sjm_4, "0x%08x ",sjm0_data_io[sjm_wr0_io][i]);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 1038, sjm_4, "\n"); else 
!!#                             IJ_printf ("diag.j", 1039, sjm_4, "+\n");
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
!!#                    IJ_printf ("diag.j", 1052, sjm_4, "\n");
!!#                      sjm4_cnt_io--;
!!# 
!!#                      sj4_ad = sjm0_addr_io[sjm_rd0_io];
!!#                      IJ_printf ("diag.j", 1057, sjm_4, "READBLKIO  0x%016llx +\n",sj4_ad);
!!# 
!!#                       for (i=0;i<16;i++) { 
!!#                          sjm4_dat = sjm0_data_io[sjm_rd0_io][i];
!!#                          if (i%4 == 0) IJ_printf ("diag.j", 1061, sjm_4, "        ");
!!#                          IJ_printf ("diag.j", 1062, sjm_4, "0x%08x ",sjm4_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 1064, sjm_4, "\n"); else 
!!#                             IJ_printf ("diag.j", 1065, sjm_4, "+\n");
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
!!#                    IJ_printf ("diag.j", 1080, sjm_4, "\n");
!!#                      sjm4_cnt_io1++;
!!# 
!!#                      sj4_ad =  IJ_get_rvar_val64("diag.j", 1083, Rv_memaddr_pattern_io);
!!#                      sjm0_addr_io1[sjm_wr0_io1] = sj4_ad; 
!!#                      IJ_printf ("diag.j", 1085, sjm_4, "WRITEIO  0x%016llx ",sj4_ad);
!!#                      IJ_update_rvar("diag.j", 1086, Rv_memaddr_pattern_io);
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
!!#                       IJ_printf ("diag.j", 1101, sjm_4, "%d ",b_sz);
!!#                       for (i=0;i<4;i++) { 
!!#                          !IJ_printf (sjm_4, "# debug %d \n",i);
!!#                          sjm0_data_io1[sjm_wr0_io1][i] = IJ_get_rvar_val32("diag.j", 1104, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 1105, Rv_rand32);
!!#                          IJ_printf ("diag.j", 1106, sjm_4, "0x%08x ",sjm0_data_io1[sjm_wr0_io1][i]);
!!#                          if((i==0) && ((b_sz == 1) | (b_sz == 2) | (b_sz == 4)) ) break; 
!!#                          if((i==1) && (b_sz == 8)) break; 
!!#                       }
!!#                       if ( random()%2 == 0) {
!!#                       IJ_printf ("diag.j", 1111, sjm_4, "\n");
!!#                       } else {
!!#                       IJ_printf ("diag.j", 1113, sjm_4, "\n");
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
!!#                    IJ_printf ("diag.j", 1127, sjm_4, "\n");
!!#                      sjm4_cnt_io1--;
!!# 
!!#                      sj4_ad = sjm0_addr_io1[sjm_rd0_io1];
!!#                      b_sz   = sjm0_data_io1[sjm_rd0_io1][15];
!!#                      IJ_printf ("diag.j", 1133, sjm_4, "READIO  0x%016llx %d ",sj4_ad,b_sz);
!!# 
!!#                       for (i=0;i<4;i++) {
!!#                          sjm4_dat = sjm0_data_io1[sjm_rd0_io1][i];
!!#                          IJ_printf ("diag.j", 1137, sjm_4, "0x%08x ",sjm4_dat);
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
!!#                    IJ_printf ("diag.j", 1152, sjm_4, "\n");
!!# 
!!#                      sj4_ad =  IJ_get_rvar_val64("diag.j", 1154, Rv_memaddr_pattern_io);
!!#                      sjm0_addr_m_io[sjm_wr0_m_io] = sj4_ad; 
!!#                      IJ_update_rvar("diag.j", 1156, Rv_memaddr_pattern_io);
!!# 
!!#                      sjm4_cnt_m_io++;
!!# 
!!#  		     sjm0_w_mask_m_io =  IJ_get_rvar_val32("diag.j", 1162, Rv_rand_mask);
!!#                      IJ_update_rvar("diag.j", 1163, Rv_rand_mask);
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
!!#                      IJ_printf ("diag.j", 1190, sjm_4, "WRITEMSKIO  0x%016llx 0x%04x  ",sj4_ad,mask);
!!#                      sjm0_data_m_io[sjm_wr0_m_io][15] = mask; ! data fifo , 15 stores address
!!# 
!!#                       m_tmp = sjm0_w_mask_m_io & 0xf;
!!#                       for (i=0;i<4;i++) { 
!!#                        if (m_tmp & 0x1 ) {
!!#                          sjm0_data_m_io[sjm_wr0_m_io][i] = IJ_get_rvar_val32("diag.j", 1196, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 1197, Rv_rand32);
!!#                          sjm4_dat = sjm0_data_m_io[sjm_wr0_m_io][i];
!!#                          !if (i%4 == 0) IJ_printf (sjm_4, "        ");
!!#                          IJ_printf ("diag.j", 1200, sjm_4, "0x%08x ",sjm4_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                              IJ_printf ("diag.j", 1202, sjm_4, "\n"); 
!!#                             !if (i==15 ) IJ_printf (sjm_4, "\n"); else 
!!#                             !IJ_printf (sjm_4, "+\n");
!!#                            }
!!#                         } else {
!!#                          !sjm4_dat = sjm0_data[sjm_rd0][i];
!!#                          sjm4_dat = 0;
!!#                          sjm0_data_m_io[sjm_wr0_m_io][i] = sjm4_dat;
!!#                          !if (i%4 == 0) IJ_printf (sjm_4, "        ");
!!#                          IJ_printf ("diag.j", 1211, sjm_4, "0x%08x ",sjm4_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             IJ_printf ("diag.j", 1213, sjm_4, "\n"); 
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
!!#                    IJ_printf ("diag.j", 1231, sjm_4, "\n");
!!#                      sjm4_cnt_m_io--;
!!# 
!!#                      sj4_ad = sjm0_addr_m_io[sjm_rd0_m_io];
!!#                      mask   = sjm0_data_m_io[sjm_rd0_m_io][15];
!!#                      IJ_printf ("diag.j", 1237, sjm_4, "READMSKIO   0x%016llx 0x%04llx  ",sj4_ad,mask);
!!# 
!!#                       for (i=0;i<4;i++) { 
!!#                          sjm4_dat = sjm0_data_m_io[sjm_rd0_m_io][i];
!!#                          !if (i%4 == 0) IJ_printf (sjm_4, "        ");
!!#                          IJ_printf ("diag.j", 1242, sjm_4, "0x%08x ",sjm4_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             IJ_printf ("diag.j", 1244, sjm_4, "\n");
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
!!# sjm5: set_sjm5_wr_b | set_sjm5_rd_b |  set_sjm5_wr_b_io | set_sjm5_rd_b_io | set_sjm5_wr_io | set_sjm5_rd_io | set_sjm5_wr_m | set_sjm5_wr_m_io | set_sjm5_rd_m_io | set_sjm5_int
!!# ;
!!# 
!!# set_sjm5_int : mSET_SJM5_INT   
!!#                 {
!!# 
!!#                  if (random()%1 == 0) {
!!#                    total_int++;
!!#                    IJ_printf ("diag.j", 1263, sjm_5, "\n");
!!# 
!!#                      sj5_ad =  IJ_get_rvar_val64("diag.j", 1265, Rv_memaddr_pattern_int1);
!!#                      IJ_printf ("diag.j", 1266, sjm_5, "INT  0x%016llx +\n",sj5_ad);
!!#                      IJ_update_rvar("diag.j", 1267, Rv_memaddr_pattern_int1);
!!# 
!!#                       for (i=0;i<16;i++) { 
!!#                          !IJ_printf (sjm_5, "# debug %d \n",i);
!!#                          data_st = IJ_get_rvar_val32("diag.j", 1271, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 1272, Rv_rand32);
!!#                          if (i%4 == 0) {IJ_printf ("diag.j", 1273, sjm_5, "        "); }
!!#                          IJ_printf ("diag.j", 1274, sjm_5, "0x%08x ",data_st);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 1276, sjm_5, "\n"); else 
!!#                             IJ_printf ("diag.j", 1277, sjm_5, "+\n");
!!#                           }
!!#                         }
!!#                   }
!!#                 }
!!# 
!!# ;  
!!# set_sjm5_wr_b : mSET_SJM5_WR_B
!!#                 {
!!# 
!!#                   if (sjm5_cnt < 8) { 
!!#                    IJ_printf ("diag.j", 1288, sjm_5, "\n");
!!#                      sjm5_cnt++;
!!# 
!!#                      sj5_ad =  IJ_get_rvar_val64("diag.j", 1291, Rv_memaddr_pattern_dma);
!!#                      sjm1_addr[sjm_wr1] = sj5_ad; 
!!#                      IJ_printf ("diag.j", 1293, sjm_5, "WRITEBLK  0x%016llx +\n",sj5_ad);
!!#                      IJ_update_rvar("diag.j", 1294, Rv_memaddr_pattern_dma);
!!# 
!!#                       for (i=0;i<16;i++) { 
!!#                          sjm1_data[sjm_wr1][i] = IJ_get_rvar_val32("diag.j", 1297, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 1298, Rv_rand32);
!!#                          if (i%4 == 0) IJ_printf ("diag.j", 1299, sjm_5, "        ");
!!#                          IJ_printf ("diag.j", 1300, sjm_5, "0x%08x ",sjm1_data[sjm_wr1][i]);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 1302, sjm_5, "\n"); else 
!!#                             IJ_printf ("diag.j", 1303, sjm_5, "+\n");
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
!!#                    IJ_printf ("diag.j", 1316, sjm_5, "\n");
!!#                      sjm5_cnt--;
!!# 
!!#                      sj5_ad = sjm1_addr[sjm_rd1];
!!#                      IJ_printf ("diag.j", 1321, sjm_5, "READBLK  0x%016llx +\n",sj5_ad);
!!# 
!!#                       for (i=0;i<16;i++) { 
!!#                          sjm5_dat = sjm1_data[sjm_rd1][i];
!!#                          if (i%4 == 0) IJ_printf ("diag.j", 1325, sjm_5, "        ");
!!#                          IJ_printf ("diag.j", 1326, sjm_5, "0x%08x ",sjm5_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 1328, sjm_5, "\n"); else 
!!#                             IJ_printf ("diag.j", 1329, sjm_5, "+\n");
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
!!#                    IJ_printf ("diag.j", 1343, sjm_5, "\n");
!!#                      !sjm4_cnt--;
!!# 
!!#  		     sjm1_w_mask =  IJ_get_rvar_val32("diag.j", 1347, Rv_rand_mask);
!!#                      IJ_update_rvar("diag.j", 1348, Rv_rand_mask);
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
!!#                      IJ_printf ("diag.j", 1365, sjm_5, "WRITEMSK  0x%016llx 0x%016llx +\n",sj5_ad,mask);
!!# 
!!#                       m_tmp = sjm1_w_mask;
!!#                       for (i=0;i<16;i++) { 
!!#                        if (m_tmp & 0x1 ) {
!!#                          sjm1_data[sjm_rd1][i] = IJ_get_rvar_val32("diag.j", 1370, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 1371, Rv_rand32);
!!#                          sjm5_dat = sjm1_data[sjm_rd1][i];
!!#                          if (i%4 == 0) IJ_printf ("diag.j", 1373, sjm_5, "        ");
!!#                          IJ_printf ("diag.j", 1374, sjm_5, "0x%08x ",sjm5_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 1376, sjm_5, "\n"); else 
!!#                             IJ_printf ("diag.j", 1377, sjm_5, "+\n");
!!#                            }
!!#                         } else {
!!#                          !sjm5_dat = sjm1_data[sjm_rd1][i];
!!#                          sjm5_dat = 0;
!!#                          if (i%4 == 0) IJ_printf ("diag.j", 1382, sjm_5, "        ");
!!#                          IJ_printf ("diag.j", 1383, sjm_5, "0x%08x ",sjm5_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 1385, sjm_5, "\n"); else 
!!#                             IJ_printf ("diag.j", 1386, sjm_5, "+\n");
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
!!#                    IJ_printf ("diag.j", 1403, sjm_5, "\n");
!!#                      sjm5_cnt_io++;
!!# 
!!#                      sj5_ad =  IJ_get_rvar_val64("diag.j", 1406, Rv_memaddr_pattern_io);
!!#                      sjm1_addr_io[sjm_wr1_io] = sj5_ad; 
!!#                      IJ_printf ("diag.j", 1408, sjm_5, "WRITEBLKIO  0x%016llx +\n",sj5_ad);
!!#                      IJ_update_rvar("diag.j", 1409, Rv_memaddr_pattern_io);
!!# 
!!#                       for (i=0;i<16;i++) { 
!!#                          !IJ_printf (sjm_5, "# debug %d \n",i);
!!#                          sjm1_data_io[sjm_wr1_io][i] = IJ_get_rvar_val32("diag.j", 1413, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 1414, Rv_rand32);
!!#                          if (i%4 == 0) {IJ_printf ("diag.j", 1415, sjm_5, "        "); }
!!#                          IJ_printf ("diag.j", 1416, sjm_5, "0x%08x ",sjm1_data_io[sjm_wr1_io][i]);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 1418, sjm_5, "\n"); else 
!!#                             IJ_printf ("diag.j", 1419, sjm_5, "+\n");
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
!!#                    IJ_printf ("diag.j", 1432, sjm_5, "\n");
!!#                      sjm5_cnt_io--;
!!# 
!!#                      sj5_ad = sjm1_addr_io[sjm_rd1_io];
!!#                      IJ_printf ("diag.j", 1437, sjm_5, "READBLKIO  0x%016llx +\n",sj5_ad);
!!# 
!!#                       for (i=0;i<16;i++) { 
!!#                          sjm5_dat = sjm1_data_io[sjm_rd1_io][i];
!!#                          if (i%4 == 0) IJ_printf ("diag.j", 1441, sjm_5, "        ");
!!#                          IJ_printf ("diag.j", 1442, sjm_5, "0x%08x ",sjm5_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 1444, sjm_5, "\n"); else 
!!#                             IJ_printf ("diag.j", 1445, sjm_5, "+\n");
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
!!#                    IJ_printf ("diag.j", 1461, sjm_5, "\n");
!!#                      sjm5_cnt_io1++;
!!# 
!!#                      sj5_ad =  IJ_get_rvar_val64("diag.j", 1464, Rv_memaddr_pattern_io);
!!#                      sjm1_addr_io1[sjm_wr1_io1] = sj5_ad; 
!!#                      IJ_printf ("diag.j", 1466, sjm_5, "WRITEIO  0x%016llx ",sj5_ad);
!!#                      IJ_update_rvar("diag.j", 1467, Rv_memaddr_pattern_io);
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
!!#                       IJ_printf ("diag.j", 1482, sjm_5, "%d ",b_sz);
!!#                       for (i=0;i<4;i++) { 
!!#                          !IJ_printf (sjm_5, "# debug %d \n",i);
!!#                          sjm1_data_io1[sjm_wr1_io1][i] = IJ_get_rvar_val32("diag.j", 1485, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 1486, Rv_rand32);
!!#                          IJ_printf ("diag.j", 1487, sjm_5, "0x%08x ",sjm1_data_io1[sjm_wr1_io1][i]);
!!#                          if((i==0) && ((b_sz == 1) | (b_sz == 2) | (b_sz == 4)) ) break; 
!!#                          if((i==1) && (b_sz == 8)) break; 
!!#                       }
!!#                       if ( random()%2 == 0) {
!!#                       IJ_printf ("diag.j", 1492, sjm_5, "\n");
!!#                       } else {
!!#                       IJ_printf ("diag.j", 1494, sjm_5, "\n");
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
!!#                    IJ_printf ("diag.j", 1508, sjm_5, "\n");
!!#                      sjm5_cnt_io1--;
!!# 
!!#                      sj5_ad = sjm1_addr_io1[sjm_rd1_io1];
!!#                      b_sz   = sjm1_data_io1[sjm_rd1_io1][15];
!!#                      IJ_printf ("diag.j", 1514, sjm_5, "READIO  0x%016llx %d ",sj5_ad,b_sz);
!!# 
!!#                       for (i=0;i<4;i++) {
!!#                          sjm5_dat = sjm1_data_io1[sjm_rd1_io1][i];
!!#                          IJ_printf ("diag.j", 1518, sjm_5, "0x%08x ",sjm5_dat);
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
!!#                    IJ_printf ("diag.j", 1533, sjm_5, "\n");
!!# 
!!#                      sj5_ad =  IJ_get_rvar_val64("diag.j", 1535, Rv_memaddr_pattern_io);
!!#                      sjm1_addr_m_io[sjm_wr1_m_io] = sj5_ad; 
!!#                      IJ_update_rvar("diag.j", 1537, Rv_memaddr_pattern_io);
!!# 
!!#                      sjm5_cnt_m_io++;
!!# 
!!#  		     sjm1_w_mask_m_io =  IJ_get_rvar_val32("diag.j", 1543, Rv_rand_mask);
!!#                      IJ_update_rvar("diag.j", 1544, Rv_rand_mask);
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
!!#                      IJ_printf ("diag.j", 1571, sjm_5, "WRITEMSKIO  0x%016llx 0x%04x  ",sj5_ad,mask);
!!#                      sjm1_data_m_io[sjm_wr1_m_io][15] = mask; ! data fifo , 15 stores address
!!# 
!!#                       m_tmp = sjm1_w_mask_m_io & 0xf;
!!#                       for (i=0;i<4;i++) { 
!!#                        if (m_tmp & 0x1 ) {
!!#                          sjm1_data_m_io[sjm_wr1_m_io][i] = IJ_get_rvar_val32("diag.j", 1577, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 1578, Rv_rand32);
!!#                          sjm5_dat = sjm1_data_m_io[sjm_wr1_m_io][i];
!!#                          !if (i%4 == 0) IJ_printf (sjm_5, "        ");
!!#                          IJ_printf ("diag.j", 1581, sjm_5, "0x%08x ",sjm5_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                              IJ_printf ("diag.j", 1583, sjm_5, "\n"); 
!!#                             !if (i==15 ) IJ_printf (sjm_5, "\n"); else 
!!#                             !IJ_printf (sjm_5, "+\n");
!!#                            }
!!#                         } else {
!!#                          !sjm5_dat = sjm1_data[sjm_rd1][i];
!!#                          sjm5_dat = 0;
!!#                          sjm1_data_m_io[sjm_wr1_m_io][i] = sjm5_dat;
!!#                          !if (i%4 == 0) IJ_printf (sjm_5, "        ");
!!#                          IJ_printf ("diag.j", 1592, sjm_5, "0x%08x ",sjm5_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             IJ_printf ("diag.j", 1594, sjm_5, "\n"); 
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
!!#                    IJ_printf ("diag.j", 1612, sjm_5, "\n");
!!#                      sjm5_cnt_m_io--;
!!# 
!!#                      sj5_ad = sjm1_addr_m_io[sjm_rd1_m_io];
!!#                      mask   = sjm1_data_m_io[sjm_rd1_m_io][15];
!!#                      IJ_printf ("diag.j", 1618, sjm_5, "READMSKIO   0x%016llx 0x%04llx  ",sj5_ad,mask);
!!# 
!!#                       for (i=0;i<4;i++) { 
!!#                          sjm5_dat = sjm1_data_m_io[sjm_rd1_m_io][i];
!!#                          !if (i%4 == 0) IJ_printf (sjm_5, "        ");
!!#                          IJ_printf ("diag.j", 1623, sjm_5, "0x%08x ",sjm5_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             IJ_printf ("diag.j", 1625, sjm_5, "\n");
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
!!#                       IJ_printf ("diag.j", 1667, th_M, "\tsetx\t0x%016llrx, %%r1, %%r6\n",
!!#                               Rv_jbiaddr_pattern0);
!!#                       IJ_printf ("diag.j", 1669, th_M, "\tsetx\t0x%016llrx, %%r1, %%r7\n",
!!#                               Rv_jbiaddr_pattern1);
!!#                       IJ_printf ("diag.j", 1671, th_M, "\tsetx\t0x%016llrx, %%r1, %%r9\n",
!!#                               Rv_jbiaddr_pattern2);
!!#                       IJ_printf ("diag.j", 1673, th_M, "\tsetx\t0x%016llrx, %%r1, %%r10\n",
!!#                               Rv_jbiaddr_pattern3);
!!#                       IJ_printf ("diag.j", 1675, th_M, "\tsetx\t0x%016llrx, %%r1, %%r11\n",
!!#                               Rv_jbiaddr_pattern4);
!!#                       IJ_printf ("diag.j", 1677, th_M, "\tsetx\t0x%016llrx, %%r1, %%r12\n",
!!#                               Rv_jbiaddr_pattern5);
!!#                       IJ_printf ("diag.j", 1679, th_M, "\tsetx\t0x%016llrx, %%r1, %%r13\n",
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
!!#                         case 0 : IJ_printf ("diag.j", 1690, th_M, "\tldda\t[%%r6]ASI_BLK_P, %%f0\n"); break;
!!#                         case 1 : IJ_printf ("diag.j", 1691, th_M, "\tldda\t[%%r7]ASI_BLK_P, %%f0\n"); break;
!!#                         case 2 : IJ_printf ("diag.j", 1692, th_M, "\tldda\t[%%r9]ASI_BLK_P, %%f0\n"); break;
!!#                         case 3 : IJ_printf ("diag.j", 1693, th_M, "\tldda\t[%%r10]ASI_BLK_P, %%f0\n"); break;
!!#                         case 4 : IJ_printf ("diag.j", 1694, th_M, "\tldda\t[%%r11]ASI_BLK_P, %%f0\n"); break;
!!#                         case 5 : IJ_printf ("diag.j", 1695, th_M, "\tldda\t[%%r12]ASI_BLK_P, %%f0\n"); break;
!!#                         case 6 : IJ_printf ("diag.j", 1696, th_M, "\tldda\t[%%r13]ASI_BLK_P, %%f0\n"); break;
!!#                         default : IJ_printf ("diag.j", 1697, th_M, "\tldda\t[%%r8]ASI_BLK_P, %%f0\n"); break;
!!#                         }
!!#                         IJ_printf ("diag.j", 1699, th_M, "\tmembar\t 0x40\n");
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
!!#                         case 0 : IJ_printf ("diag.j", 1710, th_M, "\tstda\t %%f0, [%%r6]ASI_BLK_P\n"); break;
!!#                         case 1 : IJ_printf ("diag.j", 1711, th_M, "\tstda\t %%f0, [%%r7]ASI_BLK_P\n"); break;
!!#                         case 2 : IJ_printf ("diag.j", 1712, th_M, "\tstda\t %%f0, [%%r9]ASI_BLK_P\n"); break;
!!#                         case 3 : IJ_printf ("diag.j", 1713, th_M, "\tstda\t %%f0, [%%r10]ASI_BLK_P\n"); break;
!!#                         case 4 : IJ_printf ("diag.j", 1714, th_M, "\tstda\t %%f0, [%%r11]ASI_BLK_P\n"); break;
!!#                         case 5 : IJ_printf ("diag.j", 1715, th_M, "\tstda\t %%f0, [%%r12]ASI_BLK_P\n"); break;
!!#                         case 6 : IJ_printf ("diag.j", 1716, th_M, "\tstda\t %%f0, [%%r13]ASI_BLK_P\n"); break;
!!#                         default  : IJ_printf ("diag.j", 1717, th_M, "\tstda\t %%f0, [%%r7]ASI_BLK_P\n"); break;
!!#                         }
!!#                         IJ_printf ("diag.j", 1719, th_M, "\tmembar\t 0x40\n");
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
