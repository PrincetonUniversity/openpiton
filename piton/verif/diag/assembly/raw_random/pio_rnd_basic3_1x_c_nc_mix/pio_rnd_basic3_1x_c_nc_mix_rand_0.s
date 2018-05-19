// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: pio_rnd_basic3_1x_c_nc_mix_rand_0.s
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
   random seed:	204213840
   Jal pio_rnd_basic3_1x_c_nc_mix.j:	
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

#include "boot.s"

.text
.global main

main:

th_fork(th_main, %l0)

th_main_0:
	ta	0x30

	setx	user_data_start, %l0, %l1
	setx	0xf0, %l0, %l2
!loop0:	
!	ldub	[%l1 + 0x7f], %l3
!	subcc	%l3, %l2, %g0
!	bnz	loop0
!	nop
!	prefetch [%l1 + 0x3f], #n_writes

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

	setx 0x48f6a941e31806b4, %g1, %g0
	setx 0x6c41c6f49ce1ad05, %g1, %g1
	setx 0x3c6ab1ab878b3072, %g1, %g2
	setx 0xecabc3771c579241, %g1, %g3
	setx 0x15d02449bce6d9e1, %g1, %g4
	setx 0x9fe2c53392159255, %g1, %g5
	setx 0xe7bf7bcf5a6021f2, %g1, %g6
	setx 0x03248125e7bd78dd, %g1, %g7
	setx 0xd79fe2fc2ce5dbda, %g1, %r16
	setx 0x033bbfa28d7cd5be, %g1, %r17
	setx 0x5c113d52ead179a7, %g1, %r18
	setx 0x38eadfee8db3e47e, %g1, %r19
	setx 0x7b4ce08100192f80, %g1, %r20
	setx 0x248f2b1a9be22a4d, %g1, %r21
	setx 0xb2d52f44eeccbbd0, %g1, %r22
	setx 0x2f2c20be857925ad, %g1, %r23
	setx 0x629807cecede1e8f, %g1, %r24
	setx 0x4c26658e2e1380e1, %g1, %r25
	setx 0x07ba0d02c5737a65, %g1, %r26
	setx 0xfd090c99bd5fc403, %g1, %r27
	setx 0x96e55196be424ffc, %g1, %r28
	setx 0xc1f0262adec1b0c3, %g1, %r29
	setx 0xa91db28e94463f4a, %g1, %r30
	setx 0xf8762d553b63aa18, %g1, %r31
	save
	setx 0xe2eb01dd5a61fd0c, %g1, %r16
	setx 0xdc2945e618fcd899, %g1, %r17
	setx 0xe36ee85bf77b815d, %g1, %r18
	setx 0xc670d77cb6bc6bb7, %g1, %r19
	setx 0x8603f6caca4889ef, %g1, %r20
	setx 0x66be6ae2b9136600, %g1, %r21
	setx 0x71375f6a5e27dbf3, %g1, %r22
	setx 0xab13cce08781d32e, %g1, %r23
	setx 0x940c41d994538af4, %g1, %r24
	setx 0x866ecfe24473b23d, %g1, %r25
	setx 0x09367bece5e4e42c, %g1, %r26
	setx 0x4ff6049a16ae4e0e, %g1, %r27
	setx 0x8cd724aae1b857a7, %g1, %r28
	setx 0x7783ba82c4f554d3, %g1, %r29
	setx 0xb3f00f648ec1df71, %g1, %r30
	setx 0x90ddb5a79467c41f, %g1, %r31
	save
	setx 0x95e287b5b6adcb27, %g1, %r16
	setx 0x3d0ea3f14e1cca11, %g1, %r17
	setx 0x8e5ab518dc265361, %g1, %r18
	setx 0x537d8a59cbeaf14c, %g1, %r19
	setx 0x1aa2d502740566a7, %g1, %r20
	setx 0xde23daf890cf3061, %g1, %r21
	setx 0x4ed712cb56aced2b, %g1, %r22
	setx 0x10131f11900498e2, %g1, %r23
	setx 0xd8a9c3512fa0611e, %g1, %r24
	setx 0x5886780971b097b8, %g1, %r25
	setx 0x33c4a4c07fe1f0c7, %g1, %r26
	setx 0x022ac33263334ac4, %g1, %r27
	setx 0x01932dba8589334e, %g1, %r28
	setx 0x8fe2358bfda0dc71, %g1, %r29
	setx 0xeec98a382ae6f497, %g1, %r30
	setx 0xd25198f6316df5cb, %g1, %r31
	restore
	mov	0, %r8
	setx	0x000000004230200c, %r1, %r9
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



	setx	0x000000804e232610, %r1, %r6
	setx	0x70e116ea892a7e00, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001080100000, %r1, %r6
	setx	0x70e116ea892a7e00, %r1, %r10
	stx	%r10, [%r6]
	setx	0x000000800e179a60, %r1, %r6
	setx	0x7912f503c6d672aa, %r1, %r10
	sth	%r10, [%r6]
	setx	0x00000010c0100000, %r1, %r6
	setx	0x7912f503c6d672aa, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000800fc1f850, %r1, %r6
	setx	0xfd0034901fbed8d4, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000c5eb7d3ed0, %r1, %r6
	setx	0x6bffd080db806dde, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000d6e4ff53c0, %r1, %r6
	setx	0x419c29941eba98a7, %r1, %r10
	sth	%r10, [%r6]
	setx	0x00000010a0100000, %r1, %r6
	setx	0x419c29941eba98a7, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000e42ccb6250, %r1, %r6
	setx	0xce30b41c9e89c495, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000fa4650a988, %r1, %r6
	setx	0x0edefdbc36b41d7c, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001030100000, %r1, %r6
	.word 0xe8598008  ! 2: LDX_R	ldx	[%r6 + %r8], %r20
	.word 0xa801a0f0  ! 3: ADD_I	add 	%r6, 0x00f0, %r20
	.word 0xe821a0f0  ! 4: STW_I	stw	%r20, [%r6 + 0x00f0]
	setx	0x00000080568678c0, %r1, %r6
	setx	0xf630dabb4001c8f0, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800e3dcb40, %r1, %r6
	setx	0x88c3d498a120c345, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800f62b6f8, %r1, %r6
	setx	0xbe32033325441f0d, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001030100000, %r1, %r6
	setx	0xbe32033325441f0d, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000cf6fab3af8, %r1, %r6
	setx	0xa20360983aec69ee, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000d656577640, %r1, %r6
	setx	0xc01032d05dce23f5, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000ed2f4ee2e8, %r1, %r6
	setx	0xe005666e23008714, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001090100000, %r1, %r6
	setx	0xe005666e23008714, %r1, %r10
	stx	%r10, [%r6]
	setx	0x000000f8c12a88b8, %r1, %r6
	setx	0xbdaa1718ddd743cc, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001070100000, %r1, %r6
	setx	0xbdaa1718ddd743cc, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000800e3dcb40, %r1, %r12
	lduh	[%r12], %r11
	setx	0x00000080568678c0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000fa4650a988, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000e42ccb6250, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d6e4ff53c0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x0000001030100000, %r1, %r6
	.word 0xe0098008  ! 9: LDUB_R	ldub	[%r6 + %r8], %r16
	.word 0xaa218008  ! 10: SUB_R	sub 	%r6, %r8, %r21
	.word 0xe4398008  ! 11: STD_R	std	%r18, [%r6 + %r8]
	setx	0x00000080bee3edd0, %r1, %r6
	setx	0xeef14ee43886e3f0, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800e341b58, %r1, %r6
	setx	0xbda8c9c7e2b38431, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800facc4a0, %r1, %r6
	setx	0xfe92543bbbcd8148, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000ccaac6a6d8, %r1, %r6
	setx	0x3998d1b6a5e0aaa3, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000d715e549e8, %r1, %r6
	setx	0x0eaa4972f2856649, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000e4760a8640, %r1, %r6
	setx	0xfde7f9149c4100c0, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001030100000, %r1, %r6
	setx	0xfde7f9149c4100c0, %r1, %r10
	stx	%r10, [%r6]
	setx	0x000000f76b0eb120, %r1, %r6
	setx	0x84c5101a25c302f1, %r1, %r10
	sth	%r10, [%r6]
	setx	0x00000080bee3edd0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000f8c12a88b8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x0000001030100000, %r1, %r6
	setx	0x84c5101a25c302f1, %r1, %r10
	stx	%r10, [%r6]
	setx	0x000000ed2f4ee2e8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x0000001050100000, %r1, %r6
	setx	0x84c5101a25c302f1, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000d656577640, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000cf6fab3af8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800f62b6f8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x0000001020100000, %r1, %r6
	.word 0xe0018008  ! 16: LDUW_R	lduw	[%r6 + %r8], %r16
	.word 0xa0a18008  ! 17: SUBcc_R	subcc 	%r6, %r8, %r16
	.word 0xe4318008  ! 18: STH_R	sth	%r18, [%r6 + %r8]
	setx	0x0000008091660838, %r1, %r6
	setx	0x442c974aefa2de41, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800ef1bbe8, %r1, %r6
	setx	0xcfbf22bed82e32b6, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800f582ce8, %r1, %r6
	setx	0x40df931dcd201d81, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000c568c0b640, %r1, %r6
	setx	0xb79b0028824b4a94, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001020100000, %r1, %r6
	setx	0xb79b0028824b4a94, %r1, %r10
	stx	%r10, [%r6]
	setx	0x000000d235ddb3c8, %r1, %r6
	setx	0xb400b0e26fc85a6c, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000ef14fd3c80, %r1, %r6
	setx	0xcca427cf9131d937, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000f0eee5bec8, %r1, %r6
	setx	0x0f0dd0833139b126, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001090100000, %r1, %r6
	setx	0x0f0dd0833139b126, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000800e341b58, %r1, %r12
	lduh	[%r12], %r11
	setx	0x00000080bee3edd0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x0000001090100000, %r1, %r6
	setx	0x0f0dd0833139b126, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000f8c12a88b8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x0000001050100000, %r1, %r6
	.word 0xe4518008  ! 23: LDSH_R	ldsh	[%r6 + %r8], %r18
	.word 0xa831a0e8  ! 24: ORN_I	orn 	%r6, 0x00e8, %r20
	.word 0xec298008  ! 25: STB_R	stb	%r22, [%r6 + %r8]
	setx	0x000000807205f9e8, %r1, %r6
	setx	0x16929c92940c9254, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800e3eba38, %r1, %r6
	setx	0xb628a4769c216a8f, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800f300d48, %r1, %r6
	setx	0xd644b538d7a5a773, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000c44e7d2be8, %r1, %r6
	setx	0x7f41cbcef3e4ba0a, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000dd520091c0, %r1, %r6
	setx	0x452276985c67ffe2, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000eb2e422f48, %r1, %r6
	setx	0x2f32411cfe832da8, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000f65c26d130, %r1, %r6
	setx	0x066ef41d38a82267, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001060100000, %r1, %r6
	.word 0xe0418008  ! 30: LDSW_R	ldsw	[%r6 + %r8], %r16
	.word 0xa829a070  ! 31: ANDN_I	andn 	%r6, 0x0070, %r20
	.word 0xe0318008  ! 32: STH_R	sth	%r16, [%r6 + %r8]
	setx	0x00000080c8a83910, %r1, %r6
	setx	0x60437e3f152afa55, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800e3ea9d8, %r1, %r6
	setx	0x42efeea747bd35ec, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800f6ea3e8, %r1, %r6
	setx	0xaf5486aa4054d840, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000c154d97430, %r1, %r6
	setx	0xf440d0b50b554768, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000dc56342f10, %r1, %r6
	setx	0x19a0a9c478386c8f, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000e78797e140, %r1, %r6
	setx	0xe0acaca7bfe9b303, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000f4e3315148, %r1, %r6
	setx	0xf21392b05255df41, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001060100000, %r1, %r6
	setx	0xf21392b05255df41, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000c5eb7d3ed0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x0000001030100000, %r1, %r6
	.word 0xe809a070  ! 37: LDUB_I	ldub	[%r6 + 0x0070], %r20
	.word 0xa4a1a0f8  ! 38: SUBcc_I	subcc 	%r6, 0x00f8, %r18
	.word 0xe0298008  ! 39: STB_R	stb	%r16, [%r6 + %r8]
	setx	0x000000802731e3c8, %r1, %r6
	setx	0xd6e38e399f9731d3, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800e32e4f0, %r1, %r6
	setx	0xb3fc3204fca400a0, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800f1f5010, %r1, %r6
	setx	0x7ada0ef76dfe35a1, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000c34b19c9d0, %r1, %r6
	setx	0x9ffca9be73a8a615, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000d69e0544d0, %r1, %r6
	setx	0xfd8d9b3c0c5538b7, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000e58cf7d890, %r1, %r6
	setx	0x37e9e73f489a5f3c, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001030100000, %r1, %r6
	setx	0x37e9e73f489a5f3c, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000f950b75c58, %r1, %r6
	setx	0x40c5dee6cdf288e5, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000c568c0b640, %r1, %r12
	lduh	[%r12], %r11
	setx	0x0000001060100000, %r1, %r6
	setx	0x40c5dee6cdf288e5, %r1, %r10
	stx	%r10, [%r6]
	setx	0x000000800f582ce8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800ef1bbe8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x00000010b0100000, %r1, %r6
	setx	0x40c5dee6cdf288e5, %r1, %r10
	stx	%r10, [%r6]
	setx	0x0000008091660838, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000f76b0eb120, %r1, %r12
	lduh	[%r12], %r11
	setx	0x00000010a0100000, %r1, %r6
	.word 0xec098008  ! 44: LDUB_R	ldub	[%r6 + %r8], %r22
	.word 0xa639a050  ! 45: XNOR_I	xnor 	%r6, 0x0050, %r19
	.word 0xe071a050  ! 46: STX_I	stx	%r16, [%r6 + 0x0050]
	setx	0x00000080bcf581a0, %r1, %r6
	setx	0x4fb61d2d03dafd3f, %r1, %r10
	sth	%r10, [%r6]
	setx	0x00000010a0100000, %r1, %r6
	setx	0x4fb61d2d03dafd3f, %r1, %r10
	stx	%r10, [%r6]
	setx	0x000000800eddda20, %r1, %r6
	setx	0x0c2d6193bb3685a2, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800f8a09a8, %r1, %r6
	setx	0x4682c2a3a8950e1a, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000c63d2e3eb0, %r1, %r6
	setx	0x6df6b4214a4614a7, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000dac9720598, %r1, %r6
	setx	0x90fe0fca24031329, %r1, %r10
	sth	%r10, [%r6]
	setx	0x00000010d0100000, %r1, %r6
	setx	0x90fe0fca24031329, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000eab8c62878, %r1, %r6
	setx	0x93c144030d43fd7c, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000f6d02dba60, %r1, %r6
	setx	0x51519daaeade0e72, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800f582ce8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x0000001080100000, %r1, %r6
	setx	0x51519daaeade0e72, %r1, %r10
	stx	%r10, [%r6]
	setx	0x000000800ef1bbe8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x0000008091660838, %r1, %r12
	lduh	[%r12], %r11
	setx	0x0000001020100000, %r1, %r6
	setx	0x51519daaeade0e72, %r1, %r10
	ldx	[%r6], %r10
	setx	0x0000001000100000, %r1, %r6
	.word 0xe4498008  ! 51: LDSB_R	ldsb	[%r6 + %r8], %r18
	.word 0xaea1a010  ! 52: SUBcc_I	subcc 	%r6, 0x0010, %r23
	.word 0xe031a010  ! 53: STH_I	sth	%r16, [%r6 + 0x0010]
	setx	0x0000008018fa0b20, %r1, %r6
	setx	0x2d4f71c9837e0a83, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800e235248, %r1, %r6
	setx	0x83f429daed347c3e, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800ff4db40, %r1, %r6
	setx	0x65e6909375d612f0, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000c3bd0a82c0, %r1, %r6
	setx	0x04079de5d98a870a, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001000100000, %r1, %r6
	setx	0x04079de5d98a870a, %r1, %r10
	stx	%r10, [%r6]
	setx	0x000000d355faa140, %r1, %r6
	setx	0xdc9c1909b666db08, %r1, %r10
	sth	%r10, [%r6]
	setx	0x00000010e0100000, %r1, %r6
	setx	0xdc9c1909b666db08, %r1, %r10
	stx	%r10, [%r6]
	setx	0x000000e044c6dd48, %r1, %r6
	setx	0x140f1fc6a993e0de, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000f148013770, %r1, %r6
	setx	0x83aab5657027f6ec, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800f300d48, %r1, %r12
	lduh	[%r12], %r11
	setx	0x0000001070100000, %r1, %r6
	setx	0x83aab5657027f6ec, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000800e3eba38, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000807205f9e8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000f0eee5bec8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x0000001000100000, %r1, %r6
	setx	0x83aab5657027f6ec, %r1, %r10
	ldx	[%r6], %r10
	setx	0x0000001090100000, %r1, %r6
	.word 0xe0518008  ! 58: LDSH_R	ldsh	[%r6 + %r8], %r16
	.word 0xa029a078  ! 59: ANDN_I	andn 	%r6, 0x0078, %r16
	.word 0xe421a078  ! 60: STW_I	stw	%r18, [%r6 + 0x0078]
	setx	0x00000080588bc380, %r1, %r6
	setx	0xaf4407a51a3defca, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800e962a18, %r1, %r6
	setx	0xc762d56c377731cb, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001090100000, %r1, %r6
	setx	0xc762d56c377731cb, %r1, %r10
	stx	%r10, [%r6]
	setx	0x000000800fda02d0, %r1, %r6
	setx	0x48f28eefcdcc1179, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001010100000, %r1, %r6
	setx	0x48f28eefcdcc1179, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000c7dba7ccf0, %r1, %r6
	setx	0x2c20caab8aa46996, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000d51fe3d7b0, %r1, %r6
	setx	0x0c5e16c7058d64c2, %r1, %r10
	sth	%r10, [%r6]
	setx	0x00000010a0100000, %r1, %r6
	setx	0x0c5e16c7058d64c2, %r1, %r10
	stx	%r10, [%r6]
	setx	0x000000efc12bdc18, %r1, %r6
	setx	0x530e8cfa86a73ff0, %r1, %r10
	sth	%r10, [%r6]
	setx	0x00000010f0100000, %r1, %r6
	setx	0x530e8cfa86a73ff0, %r1, %r10
	stx	%r10, [%r6]
	setx	0x000000fc37c273f0, %r1, %r6
	setx	0xd9c4d9a11528e785, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000f950b75c58, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000e58cf7d890, %r1, %r12
	lduh	[%r12], %r11
	setx	0x00000010a0100000, %r1, %r6
	.word 0xec49a078  ! 65: LDSB_I	ldsb	[%r6 + 0x0078], %r22
	.word 0xa2c1a080  ! 66: ADDCcc_I	addccc 	%r6, 0x0080, %r17
	.word 0xe039a080  ! 67: STD_I	std	%r16, [%r6 + 0x0080]
	setx	0x00000080cd439c10, %r1, %r6
	setx	0x940eb1cdf0256169, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800e9a9350, %r1, %r6
	setx	0x4b21d21805cfd3c1, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800f4cad38, %r1, %r6
	setx	0x7ef83daefe304f80, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000ca5eca8a10, %r1, %r6
	setx	0x59dcfd21027ecc00, %r1, %r10
	sth	%r10, [%r6]
	setx	0x00000010a0100000, %r1, %r6
	setx	0x59dcfd21027ecc00, %r1, %r10
	stx	%r10, [%r6]
	setx	0x000000dddf94ad38, %r1, %r6
	setx	0x775e976fe37d8899, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001040100000, %r1, %r6
	setx	0x775e976fe37d8899, %r1, %r10
	stx	%r10, [%r6]
	setx	0x000000e1c8fce238, %r1, %r6
	setx	0xaa06207d13e52cd5, %r1, %r10
	sth	%r10, [%r6]
	setx	0x00000010a0100000, %r1, %r6
	setx	0xaa06207d13e52cd5, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000f2c1fd9298, %r1, %r6
	setx	0x4f1ee6ad8cf0a5aa, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001010100000, %r1, %r6
	setx	0x4f1ee6ad8cf0a5aa, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000c34b19c9d0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x00000010d0100000, %r1, %r6
	setx	0x4f1ee6ad8cf0a5aa, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000800f1f5010, %r1, %r12
	lduh	[%r12], %r11
	setx	0x00000010f0100000, %r1, %r6
	setx	0x4f1ee6ad8cf0a5aa, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000800e32e4f0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000802731e3c8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x0000001000100000, %r1, %r6
	setx	0x4f1ee6ad8cf0a5aa, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000f4e3315148, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000e78797e140, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000dc56342f10, %r1, %r12
	lduh	[%r12], %r11
	setx	0x00000010a0100000, %r1, %r6
	.word 0xe0118008  ! 72: LDUH_R	lduh	[%r6 + %r8], %r16
	.word 0xa001a050  ! 73: ADD_I	add 	%r6, 0x0050, %r16
	.word 0xe071a050  ! 74: STX_I	stx	%r16, [%r6 + 0x0050]
	setx	0x00000080cb62f5b8, %r1, %r6
	setx	0xf0068ff2421d7844, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800e035f20, %r1, %r6
	setx	0x8849f995e0c68ff6, %r1, %r10
	sth	%r10, [%r6]
	setx	0x00000010a0100000, %r1, %r6
	setx	0x8849f995e0c68ff6, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000800fc34620, %r1, %r6
	setx	0xb69b4c4aec3660a0, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001020100000, %r1, %r6
	setx	0xb69b4c4aec3660a0, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000c6aa95b0a0, %r1, %r6
	setx	0x5c193a0549f3e95f, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000df37a87440, %r1, %r6
	setx	0x01f8b256e3b12a7e, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000e712423e80, %r1, %r6
	setx	0x04a915becf4176e2, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000fb1afd57b8, %r1, %r6
	setx	0x0408a319ede4a762, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800e9a9350, %r1, %r12
	lduh	[%r12], %r11
	setx	0x0000001030100000, %r1, %r6
	.word 0xe8518008  ! 79: LDSH_R	ldsh	[%r6 + %r8], %r20
	.word 0xaa29a0d0  ! 80: ANDN_I	andn 	%r6, 0x00d0, %r21
	.word 0xe831a0d0  ! 81: STH_I	sth	%r20, [%r6 + 0x00d0]
	setx	0x00000080a12bf3a0, %r1, %r6
	setx	0xabc549b4e268aa3e, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800e1fd520, %r1, %r6
	setx	0xb623b809d9ccc733, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800f68f260, %r1, %r6
	setx	0x6c112ab3006f5efb, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000cb98199e00, %r1, %r6
	setx	0xde08e5dd456ad178, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001030100000, %r1, %r6
	setx	0xde08e5dd456ad178, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000de22857ac0, %r1, %r6
	setx	0x2cf430170dc78c7d, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000e8aec9dbd0, %r1, %r6
	setx	0x91b8b73a3818334c, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000f04ef932c0, %r1, %r6
	setx	0x85e95d6b78625d3a, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000e4760a8640, %r1, %r12
	lduh	[%r12], %r11
	setx	0x00000010d0100000, %r1, %r6
	.word 0xe8198008  ! 86: LDD_R	ldd	[%r6 + %r8], %r20
	.word 0xa4118008  ! 87: OR_R	or 	%r6, %r8, %r18
	.word 0xe031a0d0  ! 88: STH_I	sth	%r16, [%r6 + 0x00d0]
	setx	0x000000805e2f8308, %r1, %r6
	setx	0x37a17d8cd448687e, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800efed3d0, %r1, %r6
	setx	0x2077fa52481cd483, %r1, %r10
	sth	%r10, [%r6]
	setx	0x00000010d0100000, %r1, %r6
	setx	0x2077fa52481cd483, %r1, %r10
	stx	%r10, [%r6]
	setx	0x000000800f281210, %r1, %r6
	setx	0x87e1fe56040c53e5, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000c61fd4e598, %r1, %r6
	setx	0x40ea8f370d89d2cb, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001020100000, %r1, %r6
	setx	0x40ea8f370d89d2cb, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000d63e410ed0, %r1, %r6
	setx	0x5e53decac8267ddb, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000e57e601540, %r1, %r6
	setx	0x5ac91d30f4efd603, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001090100000, %r1, %r6
	setx	0x5ac91d30f4efd603, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000f63ff718b0, %r1, %r6
	setx	0x542a169d730e02b2, %r1, %r10
	sth	%r10, [%r6]
	setx	0x00000010c0100000, %r1, %r6
	.word 0xe409a0d0  ! 93: LDUB_I	ldub	[%r6 + 0x00d0], %r18
	.word 0xa231a048  ! 94: ORN_I	orn 	%r6, 0x0048, %r17
	.word 0xe831a048  ! 95: STH_I	sth	%r20, [%r6 + 0x0048]
	setx	0x000000805472f5b8, %r1, %r6
	setx	0xc99c37e2099e738f, %r1, %r10
	sth	%r10, [%r6]
	setx	0x00000010c0100000, %r1, %r6
	setx	0xc99c37e2099e738f, %r1, %r10
	stx	%r10, [%r6]
	setx	0x000000800ed38350, %r1, %r6
	setx	0x0c57136bc8eda0d7, %r1, %r10
	sth	%r10, [%r6]
	setx	0x00000010f0100000, %r1, %r6
	setx	0x0c57136bc8eda0d7, %r1, %r10
	stx	%r10, [%r6]
	setx	0x000000800f3cb0e0, %r1, %r6
	setx	0x2d5c90258e97b45d, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000c40402d500, %r1, %r6
	setx	0x294bf0bf0cda2174, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000d9a86eb940, %r1, %r6
	setx	0xf765e160890cde41, %r1, %r10
	sth	%r10, [%r6]
	setx	0x00000010c0100000, %r1, %r6
	setx	0xf765e160890cde41, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000ee53557e50, %r1, %r6
	setx	0xd9930a4aa0f82f74, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000f3c0d852c8, %r1, %r6
	setx	0x5288aacb7bb05409, %r1, %r10
	sth	%r10, [%r6]
	setx	0x00000010d0100000, %r1, %r6
	.word 0xe4498008  ! 100: LDSB_R	ldsb	[%r6 + %r8], %r18
	.word 0xac19a0d8  ! 101: XOR_I	xor 	%r6, 0x00d8, %r22
	.word 0xe0718008  ! 102: STX_R	stx	%r16, [%r6 + %r8]
	setx	0x000000805c8c4450, %r1, %r6
	setx	0xbaad17615d91a308, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800e4ae768, %r1, %r6
	setx	0x444e5cfa39ded276, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800fdc7e18, %r1, %r6
	setx	0x0f237ab3e1f39e05, %r1, %r10
	sth	%r10, [%r6]
	setx	0x00000010d0100000, %r1, %r6
	setx	0x0f237ab3e1f39e05, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000c2334df2d0, %r1, %r6
	setx	0x4d73f7114e6774f3, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000dca2c70fc0, %r1, %r6
	setx	0x39c90ed39a2c731a, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000e931a3a6a0, %r1, %r6
	setx	0x510c00f9641bdcff, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001070100000, %r1, %r6
	setx	0x510c00f9641bdcff, %r1, %r10
	stx	%r10, [%r6]
	setx	0x000000fcc584b0d8, %r1, %r6
	setx	0x1650393eefd69289, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000d69e0544d0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000c34b19c9d0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x0000001090100000, %r1, %r6
	setx	0x1650393eefd69289, %r1, %r10
	stx	%r10, [%r6]
	setx	0x00000010b0100000, %r1, %r6
	.word 0xe8098008  ! 107: LDUB_R	ldub	[%r6 + %r8], %r20
	.word 0xac398008  ! 108: XNOR_R	xnor 	%r6, %r8, %r22
	.word 0xe0398008  ! 109: STD_R	std	%r16, [%r6 + %r8]
	setx	0x00000080b3c2cae0, %r1, %r6
	setx	0x5e32e08263aa603b, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800e102b30, %r1, %r6
	setx	0xc283a5678ea6a644, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800ff5b4e0, %r1, %r6
	setx	0x1baef89db370609d, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000cc7dcbf218, %r1, %r6
	setx	0x548dbcb2681faa06, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000d069453c30, %r1, %r6
	setx	0xef7598cfaaff6f6a, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000ea41e77230, %r1, %r6
	setx	0xeb17713e5a6e2823, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000f365edec00, %r1, %r6
	setx	0xa50c2137d750c9d5, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000c568c0b640, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800f582ce8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x00000010b0100000, %r1, %r6
	setx	0xa50c2137d750c9d5, %r1, %r10
	stx	%r10, [%r6]
	setx	0x000000800ef1bbe8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x0000008091660838, %r1, %r12
	lduh	[%r12], %r11
	setx	0x00000010b0100000, %r1, %r6
	.word 0xe0418008  ! 114: LDSW_R	ldsw	[%r6 + %r8], %r16
	.word 0xa601a018  ! 115: ADD_I	add 	%r6, 0x0018, %r19
	.word 0xe0318008  ! 116: STH_R	sth	%r16, [%r6 + %r8]
	setx	0x00000080e6d685a0, %r1, %r6
	setx	0x5ac47eac565fbb27, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800ee14c48, %r1, %r6
	setx	0xcea4eb1e1d9f49fb, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800f9ff208, %r1, %r6
	setx	0x593a0501cf53fbc2, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000c08b570e90, %r1, %r6
	setx	0x71b430b62a166db6, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000dd1fd13920, %r1, %r6
	setx	0x1fa523d2f2dbfcc1, %r1, %r10
	sth	%r10, [%r6]
	setx	0x00000010b0100000, %r1, %r6
	setx	0x1fa523d2f2dbfcc1, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000ed6ea8c0a0, %r1, %r6
	setx	0x6640b565f5e93f8a, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000fc6bd0d220, %r1, %r6
	setx	0x0a297ded0cfa7ef2, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000c34b19c9d0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800f1f5010, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e32e4f0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000802731e3c8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x0000001030100000, %r1, %r6
	.word 0xe8418008  ! 121: LDSW_R	ldsw	[%r6 + %r8], %r20
	.word 0xa8818008  ! 122: ADDcc_R	addcc 	%r6, %r8, %r20
	.word 0xe831a018  ! 123: STH_I	sth	%r20, [%r6 + 0x0018]
	setx	0x0000008060da9380, %r1, %r6
	setx	0x22df5215a0a9d50f, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800e7524d8, %r1, %r6
	setx	0xe33118adaffd6168, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800f85f1f0, %r1, %r6
	setx	0xae2358d56aa0ba5f, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001030100000, %r1, %r6
	setx	0xae2358d56aa0ba5f, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000cc43c0cdb0, %r1, %r6
	setx	0xaa7e129477886781, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000ded2e584a8, %r1, %r6
	setx	0x3c736190582f0ce7, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001020100000, %r1, %r6
	setx	0x3c736190582f0ce7, %r1, %r10
	stx	%r10, [%r6]
	setx	0x000000e48a08da30, %r1, %r6
	setx	0x915c9a8162f8e671, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000f221a478a8, %r1, %r6
	setx	0x41954fc630e4da6a, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001030100000, %r1, %r6
	.word 0xe0518008  ! 128: LDSH_R	ldsh	[%r6 + %r8], %r16
	.word 0xa609a028  ! 129: AND_I	and 	%r6, 0x0028, %r19
	.word 0xe0218008  ! 130: STW_R	stw	%r16, [%r6 + %r8]
	setx	0x00000080dfa53d10, %r1, %r6
	setx	0x872813674a73ca2f, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800efad3b0, %r1, %r6
	setx	0x2d90c1b4533d717b, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001030100000, %r1, %r6
	setx	0x2d90c1b4533d717b, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000800ff8ce48, %r1, %r6
	setx	0x3f57da2dff63a859, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000c61e450e40, %r1, %r6
	setx	0x5c25cfc2b470dd04, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000dcf076a5c0, %r1, %r6
	setx	0x1daf2e6f9b96e21d, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001000100000, %r1, %r6
	setx	0x1daf2e6f9b96e21d, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000e4bee53608, %r1, %r6
	setx	0xe7b24ab5afa1cfcf, %r1, %r10
	sth	%r10, [%r6]
	setx	0x00000010e0100000, %r1, %r6
	setx	0xe7b24ab5afa1cfcf, %r1, %r10
	stx	%r10, [%r6]
	setx	0x000000f3559dfdc8, %r1, %r6
	setx	0x0e0d492a91565f98, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800f281210, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800efed3d0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000805e2f8308, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000f04ef932c0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000e8aec9dbd0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000de22857ac0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000cb98199e00, %r1, %r12
	lduh	[%r12], %r11
	setx	0x0000001060100000, %r1, %r6
	setx	0x0e0d492a91565f98, %r1, %r10
	ldx	[%r6], %r10
	setx	0x0000001010100000, %r1, %r6
	.word 0xe4518008  ! 135: LDSH_R	ldsh	[%r6 + %r8], %r18
	.word 0xac118008  ! 136: OR_R	or 	%r6, %r8, %r22
	.word 0xe4318008  ! 137: STH_R	sth	%r18, [%r6 + %r8]
	setx	0x00000080c1c8ad58, %r1, %r6
	setx	0x8277851801d4b045, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800e6b2af0, %r1, %r6
	setx	0x63849adec2b1822c, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001010100000, %r1, %r6
	setx	0x63849adec2b1822c, %r1, %r10
	stx	%r10, [%r6]
	setx	0x000000800fcb1790, %r1, %r6
	setx	0x382ec533e4042112, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000c2d54b4550, %r1, %r6
	setx	0x340bf47356833225, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000d22a14bf78, %r1, %r6
	setx	0xfa3b82baa68f0e52, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000e550d6b0b8, %r1, %r6
	setx	0xfd510e1023a45a5c, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000fa54feec28, %r1, %r6
	setx	0xae452f1ab059ed24, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000c61fd4e598, %r1, %r12
	lduh	[%r12], %r11
	setx	0x0000001050100000, %r1, %r6
	setx	0xae452f1ab059ed24, %r1, %r10
	stx	%r10, [%r6]
	setx	0x000000800f281210, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800efed3d0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x0000001050100000, %r1, %r6
	setx	0xae452f1ab059ed24, %r1, %r10
	stx	%r10, [%r6]
	setx	0x000000805e2f8308, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000f04ef932c0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x0000001050100000, %r1, %r6
	.word 0xec118008  ! 142: LDUH_R	lduh	[%r6 + %r8], %r22
	.word 0xa831a070  ! 143: ORN_I	orn 	%r6, 0x0070, %r20
	.word 0xe829a070  ! 144: STB_I	stb	%r20, [%r6 + 0x0070]
	setx	0x00000080bdd9c480, %r1, %r6
	setx	0xfd925ffa33fd158c, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800ee91c08, %r1, %r6
	setx	0xf6447edbe1d2a57f, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001050100000, %r1, %r6
	setx	0xf6447edbe1d2a57f, %r1, %r10
	stx	%r10, [%r6]
	setx	0x000000800fc9b628, %r1, %r6
	setx	0xed9185c376a30f39, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000c59dbc40b0, %r1, %r6
	setx	0xa506b48d8ba6203d, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001000100000, %r1, %r6
	setx	0xa506b48d8ba6203d, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000d66f486d60, %r1, %r6
	setx	0x6a2be0ca0d19333c, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000e88d04a710, %r1, %r6
	setx	0x66f702c3468f4e0d, %r1, %r10
	sth	%r10, [%r6]
	setx	0x00000010a0100000, %r1, %r6
	setx	0x66f702c3468f4e0d, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000fd4a646680, %r1, %r6
	setx	0xcc92658e295735fc, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000fcc584b0d8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000e931a3a6a0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x0000001010100000, %r1, %r6
	setx	0xcc92658e295735fc, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000dca2c70fc0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000c2334df2d0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x0000001050100000, %r1, %r6
	setx	0xcc92658e295735fc, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000800fdc7e18, %r1, %r12
	lduh	[%r12], %r11
	setx	0x00000010b0100000, %r1, %r6
	.word 0xe009a070  ! 149: LDUB_I	ldub	[%r6 + 0x0070], %r16
	.word 0xacc1a0d0  ! 150: ADDCcc_I	addccc 	%r6, 0x00d0, %r22
	.word 0xec29a0d0  ! 151: STB_I	stb	%r22, [%r6 + 0x00d0]
	setx	0x00000080d8bfab28, %r1, %r6
	setx	0xd4d69b8a163dd66d, %r1, %r10
	sth	%r10, [%r6]
	setx	0x00000010b0100000, %r1, %r6
	setx	0xd4d69b8a163dd66d, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000800e358710, %r1, %r6
	setx	0xd8939f1808016b2c, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800f6170a8, %r1, %r6
	setx	0xf4aff1cfb19ad298, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000cdbe1f6910, %r1, %r6
	setx	0xe104146f2b8eab07, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000d15a449b78, %r1, %r6
	setx	0x68b45c38e79f2bee, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000eccb915808, %r1, %r6
	setx	0xfcd0e4e236b1b4cf, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000f2c9481368, %r1, %r6
	setx	0x5bea1877cd87ccae, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000f3559dfdc8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x00000010f0100000, %r1, %r6
	.word 0xe0418008  ! 156: LDSW_R	ldsw	[%r6 + %r8], %r16
	.word 0xa009a0c8  ! 157: AND_I	and 	%r6, 0x00c8, %r16
	.word 0xe0298008  ! 158: STB_R	stb	%r16, [%r6 + %r8]
	setx	0x00000080c24ba788, %r1, %r6
	setx	0x8220f06be19944d2, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800efa8468, %r1, %r6
	setx	0x3c98ddc1bd95c1ff, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800ff26df8, %r1, %r6
	setx	0x8a72c4317768ec68, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000c6774f1990, %r1, %r6
	setx	0x1c8fb1689339209b, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000d59c93ba58, %r1, %r6
	setx	0x28d1d8ddeedf1b35, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000e2a6931480, %r1, %r6
	setx	0x66627c48e37c97de, %r1, %r10
	sth	%r10, [%r6]
	setx	0x00000010f0100000, %r1, %r6
	setx	0x66627c48e37c97de, %r1, %r10
	stx	%r10, [%r6]
	setx	0x000000fadae38740, %r1, %r6
	setx	0x961ac91ae6b7cf7d, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800f3cb0e0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800ed38350, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000805472f5b8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000f63ff718b0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000e57e601540, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d63e410ed0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x0000001050100000, %r1, %r6
	setx	0x961ac91ae6b7cf7d, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000c61fd4e598, %r1, %r12
	lduh	[%r12], %r11
	setx	0x0000001020100000, %r1, %r6
	.word 0xec498008  ! 163: LDSB_R	ldsb	[%r6 + %r8], %r22
	.word 0xa6998008  ! 164: XORcc_R	xorcc 	%r6, %r8, %r19
	.word 0xe8318008  ! 165: STH_R	sth	%r20, [%r6 + %r8]
	setx	0x000000805abb6c28, %r1, %r6
	setx	0x0a8b0c54308add19, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800e91b468, %r1, %r6
	setx	0xa02b63c100503102, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800f63afc0, %r1, %r6
	setx	0x98b97583a6735f29, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001020100000, %r1, %r6
	setx	0x98b97583a6735f29, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000cd537a3300, %r1, %r6
	setx	0x1ff1c918b47597ce, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000db22fa1308, %r1, %r6
	setx	0x6abc325ecf14abf9, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000eb278667f0, %r1, %r6
	setx	0x6308b55d30ac94f6, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000f881670318, %r1, %r6
	setx	0x94aebda88577f954, %r1, %r10
	sth	%r10, [%r6]
	setx	0x00000080cb62f5b8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000f2c1fd9298, %r1, %r12
	lduh	[%r12], %r11
	setx	0x0000001050100000, %r1, %r6
	setx	0x94aebda88577f954, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000e1c8fce238, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000dddf94ad38, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000ca5eca8a10, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800f4cad38, %r1, %r12
	lduh	[%r12], %r11
	setx	0x00000010f0100000, %r1, %r6
	.word 0xe451a0c8  ! 170: LDSH_I	ldsh	[%r6 + 0x00c8], %r18
	.word 0xae99a028  ! 171: XORcc_I	xorcc 	%r6, 0x0028, %r23
	.word 0xec318008  ! 172: STH_R	sth	%r22, [%r6 + %r8]
	setx	0x000000805e79eb10, %r1, %r6
	setx	0x0e3816e0f37dd48d, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800e8e2350, %r1, %r6
	setx	0x282dc3c7eac0b811, %r1, %r10
	sth	%r10, [%r6]
	setx	0x00000010f0100000, %r1, %r6
	setx	0x282dc3c7eac0b811, %r1, %r10
	stx	%r10, [%r6]
	setx	0x000000800fc389f0, %r1, %r6
	setx	0xe6e67275c5667adf, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000c5a84e7998, %r1, %r6
	setx	0x8571eb72bd8782f6, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000d5692268a8, %r1, %r6
	setx	0x8760cd85b3963a2e, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001030100000, %r1, %r6
	setx	0x8760cd85b3963a2e, %r1, %r10
	stx	%r10, [%r6]
	setx	0x000000eb4690e3e0, %r1, %r6
	setx	0xf350757eb9d928f2, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000f1c3c2aa80, %r1, %r6
	setx	0x72989511ebce525e, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000d355faa140, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000c3bd0a82c0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x0000001000100000, %r1, %r6
	setx	0x72989511ebce525e, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000800ff4db40, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e235248, %r1, %r12
	lduh	[%r12], %r11
	setx	0x00000010a0100000, %r1, %r6
	setx	0x72989511ebce525e, %r1, %r10
	ldx	[%r6], %r10
	setx	0x0000008018fa0b20, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000f6d02dba60, %r1, %r12
	lduh	[%r12], %r11
	setx	0x0000001070100000, %r1, %r6
	.word 0xe801a028  ! 177: LDUW_I	lduw	[%r6 + 0x0028], %r20
	.word 0xa6298008  ! 178: ANDN_R	andn 	%r6, %r8, %r19
	.word 0xe8718008  ! 179: STX_R	stx	%r20, [%r6 + %r8]
	setx	0x00000080ecd3daf8, %r1, %r6
	setx	0x031530734fe18387, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800e76f560, %r1, %r6
	setx	0x375beea34ba024ab, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800f9e9250, %r1, %r6
	setx	0x2550aeaf60c20084, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000c5f76ca7c0, %r1, %r6
	setx	0xa59f07a00b38120d, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001070100000, %r1, %r6
	setx	0xa59f07a00b38120d, %r1, %r10
	stx	%r10, [%r6]
	setx	0x000000de61ecfba0, %r1, %r6
	setx	0x8099eb15ce857f3a, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000eb806fe6c8, %r1, %r6
	setx	0x7644b52fc20bb2bd, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001020100000, %r1, %r6
	setx	0x7644b52fc20bb2bd, %r1, %r10
	stx	%r10, [%r6]
	setx	0x000000f0afefdc48, %r1, %r6
	setx	0x625d069eff29fb09, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000dd1fd13920, %r1, %r12
	lduh	[%r12], %r11
	setx	0x0000001060100000, %r1, %r6
	setx	0x625d069eff29fb09, %r1, %r10
	stx	%r10, [%r6]
	setx	0x0000001030100000, %r1, %r6
	.word 0xe8418008  ! 184: LDSW_R	ldsw	[%r6 + %r8], %r20
	.word 0xa0c18008  ! 185: ADDCcc_R	addccc 	%r6, %r8, %r16
	.word 0xec31a028  ! 186: STH_I	sth	%r22, [%r6 + 0x0028]
	setx	0x0000008086a8faa8, %r1, %r6
	setx	0xaf8d69ce888c3b85, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800e1ff8f8, %r1, %r6
	setx	0x94255ced70c8865d, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001030100000, %r1, %r6
	setx	0x94255ced70c8865d, %r1, %r10
	stx	%r10, [%r6]
	setx	0x000000800f361838, %r1, %r6
	setx	0x0761dddff0687e8a, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000cf9a4238f0, %r1, %r6
	setx	0x28f3726b92135465, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000d016fb6498, %r1, %r6
	setx	0x6c540693cec5d5eb, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000e13b0499b0, %r1, %r6
	setx	0xe975712aaa8693e2, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000fbb39aca80, %r1, %r6
	setx	0x733d8938bb44d601, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000fc6bd0d220, %r1, %r12
	lduh	[%r12], %r11
	setx	0x00000010b0100000, %r1, %r6
	.word 0xe419a028  ! 191: LDD_I	ldd	[%r6 + 0x0028], %r18
	.word 0xa4c1a018  ! 192: ADDCcc_I	addccc 	%r6, 0x0018, %r18
	.word 0xe4718008  ! 193: STX_R	stx	%r18, [%r6 + %r8]
	setx	0x0000008042c82f00, %r1, %r6
	setx	0xc27b90b7d1cdcf40, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800ea974b0, %r1, %r6
	setx	0x5b0a8577dabbd133, %r1, %r10
	sth	%r10, [%r6]
	setx	0x00000010b0100000, %r1, %r6
	setx	0x5b0a8577dabbd133, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000800f59b718, %r1, %r6
	setx	0x30413f1fc7fecab4, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000cb71b21a58, %r1, %r6
	setx	0x4712c70f4ef614c1, %r1, %r10
	sth	%r10, [%r6]
	setx	0x00000010d0100000, %r1, %r6
	setx	0x4712c70f4ef614c1, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000dd79837a28, %r1, %r6
	setx	0xa8d3a13a3d2dc217, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000ee7017fe28, %r1, %r6
	setx	0x517dd2b54cd743ce, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000f050aced58, %r1, %r6
	setx	0xa9ab9fdd5e247998, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000d9a86eb940, %r1, %r12
	lduh	[%r12], %r11
	setx	0x00000010e0100000, %r1, %r6
	.word 0xe0598008  ! 198: LDX_R	ldx	[%r6 + %r8], %r16
	.word 0xa2c1a0b8  ! 199: ADDCcc_I	addccc 	%r6, 0x00b8, %r17
	.word 0xe029a0b8  ! 200: STB_I	stb	%r16, [%r6 + 0x00b8]
	setx	0x000000806a606730, %r1, %r6
	setx	0x03cf8c20f553cd9f, %r1, %r10
	sth	%r10, [%r6]
	setx	0x00000010e0100000, %r1, %r6
	setx	0x03cf8c20f553cd9f, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000800e8773c8, %r1, %r6
	setx	0x444eb002b77d4a69, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001030100000, %r1, %r6
	setx	0x444eb002b77d4a69, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000800f2d4620, %r1, %r6
	setx	0xd8a3303e0b6ae2a6, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000cdef639dc8, %r1, %r6
	setx	0x47c0c08bdbb2745f, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001090100000, %r1, %r6
	setx	0x47c0c08bdbb2745f, %r1, %r10
	stx	%r10, [%r6]
	setx	0x000000d60272c310, %r1, %r6
	setx	0xc0c6dbc3b18c84eb, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000e698274e50, %r1, %r6
	setx	0x11991ec7abdfadd6, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000f722e47910, %r1, %r6
	setx	0x32bda851627af0eb, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000dd520091c0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x00000010f0100000, %r1, %r6
	setx	0x32bda851627af0eb, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000c44e7d2be8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800f300d48, %r1, %r12
	lduh	[%r12], %r11
	setx	0x0000001000100000, %r1, %r6
	setx	0x32bda851627af0eb, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000800e3eba38, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000807205f9e8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000f0eee5bec8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000ef14fd3c80, %r1, %r12
	lduh	[%r12], %r11
	setx	0x0000001040100000, %r1, %r6
	.word 0xe041a0b8  ! 205: LDSW_I	ldsw	[%r6 + 0x00b8], %r16
	.word 0xac198008  ! 206: XOR_R	xor 	%r6, %r8, %r22
	.word 0xec398008  ! 207: STD_R	std	%r22, [%r6 + %r8]
	setx	0x000000804beb5060, %r1, %r6
	setx	0xeafaaedef36c05f6, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800ef9a6f0, %r1, %r6
	setx	0x6763b4911343e4c4, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001040100000, %r1, %r6
	setx	0x6763b4911343e4c4, %r1, %r10
	stx	%r10, [%r6]
	setx	0x000000800faa9620, %r1, %r6
	setx	0xfe0ac83c38ac8454, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000c27ac66450, %r1, %r6
	setx	0x63fa3fc909a9d44b, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000d38c0f9308, %r1, %r6
	setx	0x00298e13ae37582f, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000e2d3859a18, %r1, %r6
	setx	0xca93c3b8a3873480, %r1, %r10
	sth	%r10, [%r6]
	setx	0x00000010b0100000, %r1, %r6
	setx	0xca93c3b8a3873480, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000f6f2c28a20, %r1, %r6
	setx	0x56834d54da4789d6, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000e044c6dd48, %r1, %r12
	lduh	[%r12], %r11
	setx	0x00000010a0100000, %r1, %r6
	setx	0x56834d54da4789d6, %r1, %r10
	stx	%r10, [%r6]
	setx	0x000000d355faa140, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000c3bd0a82c0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x0000001070100000, %r1, %r6
	setx	0x56834d54da4789d6, %r1, %r10
	ldx	[%r6], %r10
	setx	0x00000010e0100000, %r1, %r6
	.word 0xe4098008  ! 212: LDUB_R	ldub	[%r6 + %r8], %r18
	.word 0xa439a0a8  ! 213: XNOR_I	xnor 	%r6, 0x00a8, %r18
	.word 0xe821a0a8  ! 214: STW_I	stw	%r20, [%r6 + 0x00a8]
	setx	0x00000080915f32a0, %r1, %r6
	setx	0x6813ee0945f40c87, %r1, %r10
	sth	%r10, [%r6]
	setx	0x00000010e0100000, %r1, %r6
	setx	0x6813ee0945f40c87, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000800ee12a38, %r1, %r6
	setx	0xff314daa532a08ab, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800f3bc5c8, %r1, %r6
	setx	0x723a78bf67e1be60, %r1, %r10
	sth	%r10, [%r6]
	setx	0x00000010a0100000, %r1, %r6
	setx	0x723a78bf67e1be60, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000c7dc147aa8, %r1, %r6
	setx	0xd89e2d04c7f11d2c, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000d9c18680e8, %r1, %r6
	setx	0x91a3afc4e26748d6, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000eb78229778, %r1, %r6
	setx	0xe83b40fa0089b39b, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000f736a0c328, %r1, %r6
	setx	0x55208980ddd3d120, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000fd4a646680, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000e88d04a710, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d66f486d60, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000c59dbc40b0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x0000001000100000, %r1, %r6
	setx	0x55208980ddd3d120, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000800fc9b628, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800ee91c08, %r1, %r12
	lduh	[%r12], %r11
	setx	0x00000010d0100000, %r1, %r6
	setx	0x55208980ddd3d120, %r1, %r10
	ldx	[%r6], %r10
	setx	0x00000010d0100000, %r1, %r6
	.word 0xe8498008  ! 219: LDSB_R	ldsb	[%r6 + %r8], %r20
	.word 0xa699a0b0  ! 220: XORcc_I	xorcc 	%r6, 0x00b0, %r19
	.word 0xec31a0b0  ! 221: STH_I	sth	%r22, [%r6 + 0x00b0]
	setx	0x0000008011460640, %r1, %r6
	setx	0x2d89f484a7c9de49, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800e5f97b8, %r1, %r6
	setx	0x11c3fb01740334af, %r1, %r10
	sth	%r10, [%r6]
	setx	0x00000010d0100000, %r1, %r6
	setx	0x11c3fb01740334af, %r1, %r10
	stx	%r10, [%r6]
	setx	0x000000800f2a5868, %r1, %r6
	setx	0xa9e6584412313f26, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000c0e902b870, %r1, %r6
	setx	0x837c886ea2d6f8c8, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001010100000, %r1, %r6
	setx	0x837c886ea2d6f8c8, %r1, %r10
	stx	%r10, [%r6]
	setx	0x000000dfe2057840, %r1, %r6
	setx	0xdacd62c158815deb, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000e4bbddc6c8, %r1, %r6
	setx	0xf117bb1d13882675, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000f2bdaf80e0, %r1, %r6
	setx	0x73f309081af30e6c, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001000100000, %r1, %r6
	setx	0x73f309081af30e6c, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000800e962a18, %r1, %r12
	lduh	[%r12], %r11
	setx	0x00000080588bc380, %r1, %r12
	lduh	[%r12], %r11
	setx	0x00000010c0100000, %r1, %r6
	.word 0xe4098008  ! 226: LDUB_R	ldub	[%r6 + %r8], %r18
	.word 0xa6b9a040  ! 227: XNORcc_I	xnorcc 	%r6, 0x0040, %r19
	.word 0xe831a040  ! 228: STH_I	sth	%r20, [%r6 + 0x0040]
	setx	0x0000008086febd18, %r1, %r6
	setx	0xd343512e386cf51b, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800e8a8da8, %r1, %r6
	setx	0x23e3d096123b8ad6, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800f5c8de8, %r1, %r6
	setx	0x4f597c0ea4ad70be, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000ced6a4ff98, %r1, %r6
	setx	0x8a2760303caea504, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000d51be904d8, %r1, %r6
	setx	0xa53f48e476f9bd10, %r1, %r10
	sth	%r10, [%r6]
	setx	0x00000010c0100000, %r1, %r6
	setx	0xa53f48e476f9bd10, %r1, %r10
	stx	%r10, [%r6]
	setx	0x000000e155be9910, %r1, %r6
	setx	0x7500ac8632abde43, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000f031ce29c8, %r1, %r6
	setx	0x85ab51b4dc8224ae, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001070100000, %r1, %r6
	setx	0x85ab51b4dc8224ae, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000dcf076a5c0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x0000001090100000, %r1, %r6
	setx	0x85ab51b4dc8224ae, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000c61e450e40, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800ff8ce48, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800efad3b0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x00000080dfa53d10, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000f221a478a8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000e48a08da30, %r1, %r12
	lduh	[%r12], %r11
	setx	0x0000001050100000, %r1, %r6
	.word 0xe851a040  ! 233: LDSH_I	ldsh	[%r6 + 0x0040], %r20
	.word 0xa021a028  ! 234: SUB_I	sub 	%r6, 0x0028, %r16
	.word 0xe4218008  ! 235: STW_R	stw	%r18, [%r6 + %r8]
	setx	0x00000080fbdfa398, %r1, %r6
	setx	0x1764b3b26e6ca0f8, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800ed029e8, %r1, %r6
	setx	0x016005b41e23d556, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001050100000, %r1, %r6
	setx	0x016005b41e23d556, %r1, %r10
	stx	%r10, [%r6]
	setx	0x000000800f166e70, %r1, %r6
	setx	0x2a56c9f450c000a7, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000cc8963ff30, %r1, %r6
	setx	0xa9f7c96caf41186b, %r1, %r10
	sth	%r10, [%r6]
	setx	0x00000010b0100000, %r1, %r6
	setx	0xa9f7c96caf41186b, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000d799bf2ca0, %r1, %r6
	setx	0x84ad516987a126d6, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000e507a63200, %r1, %r6
	setx	0xec0aa4971a3343f3, %r1, %r10
	sth	%r10, [%r6]
	setx	0x00000010f0100000, %r1, %r6
	setx	0xec0aa4971a3343f3, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000fb77e30da0, %r1, %r6
	setx	0x1721343ea4b8ed46, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001090100000, %r1, %r6
	setx	0x1721343ea4b8ed46, %r1, %r10
	ldx	[%r6], %r10
	setx	0x00000010a0100000, %r1, %r6
	.word 0xe011a028  ! 240: LDUH_I	lduh	[%r6 + 0x0028], %r16
	.word 0xa4318008  ! 241: SUBC_R	orn 	%r6, %r8, %r18
	.word 0xe029a028  ! 242: STB_I	stb	%r16, [%r6 + 0x0028]
	setx	0x00000080908bf3b0, %r1, %r6
	setx	0xbe518d9a95dc356c, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800e8a5198, %r1, %r6
	setx	0x3adb18cd38021b24, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800fb24640, %r1, %r6
	setx	0x3922e8c7d30c9bfc, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000c451979360, %r1, %r6
	setx	0x5a78382599a9b656, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000df78403b78, %r1, %r6
	setx	0xea62e4c2a62d2cc7, %r1, %r10
	sth	%r10, [%r6]
	setx	0x00000010a0100000, %r1, %r6
	setx	0xea62e4c2a62d2cc7, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000ede4a98c78, %r1, %r6
	setx	0xcb51cea894141477, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000f714082fd8, %r1, %r6
	setx	0xd864d90dcfcba5cc, %r1, %r10
	sth	%r10, [%r6]
	setx	0x00000010f0100000, %r1, %r6
	setx	0xd864d90dcfcba5cc, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000de22857ac0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000cb98199e00, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800f68f260, %r1, %r12
	lduh	[%r12], %r11
	setx	0x00000010b0100000, %r1, %r6
	.word 0xec498008  ! 247: LDSB_R	ldsb	[%r6 + %r8], %r22
	.word 0xa4398008  ! 248: XNOR_R	xnor 	%r6, %r8, %r18
	.word 0xe8398008  ! 249: STD_R	std	%r20, [%r6 + %r8]
	setx	0x0000008030bacb28, %r1, %r6
	setx	0x876baf064d06ab09, %r1, %r10
	sth	%r10, [%r6]
	setx	0x00000010b0100000, %r1, %r6
	setx	0x876baf064d06ab09, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000800e73a668, %r1, %r6
	setx	0x8b09f68dbc26cde3, %r1, %r10
	sth	%r10, [%r6]
	setx	0x00000010b0100000, %r1, %r6
	setx	0x8b09f68dbc26cde3, %r1, %r10
	stx	%r10, [%r6]
	setx	0x000000800fca9998, %r1, %r6
	setx	0x305a042cb35203fa, %r1, %r10
	sth	%r10, [%r6]
	setx	0x00000010e0100000, %r1, %r6
	setx	0x305a042cb35203fa, %r1, %r10
	stx	%r10, [%r6]
	setx	0x000000c3f7f80ab0, %r1, %r6
	setx	0xc98be2da42c4e92b, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000d8960f9058, %r1, %r6
	setx	0x81e5b514fa216c19, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001040100000, %r1, %r6
	setx	0x81e5b514fa216c19, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000ed470cb418, %r1, %r6
	setx	0x15c5ed83f48b5efd, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000f0d1b60478, %r1, %r6
	setx	0x7a4309946586e65c, %r1, %r10
	sth	%r10, [%r6]
	setx	0x00000010d0100000, %r1, %r6
	setx	0x7a4309946586e65c, %r1, %r10
	stx	%r10, [%r6]
	setx	0x000000800ef9a6f0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x0000001030100000, %r1, %r6
	setx	0x7a4309946586e65c, %r1, %r10
	stx	%r10, [%r6]
	setx	0x000000804beb5060, %r1, %r12
	lduh	[%r12], %r11
	setx	0x00000010e0100000, %r1, %r6
	.word 0xe4498008  ! 254: LDSB_R	ldsb	[%r6 + %r8], %r18
	.word 0xa2b9a068  ! 255: XNORcc_I	xnorcc 	%r6, 0x0068, %r17
	.word 0xe431a068  ! 256: STH_I	sth	%r18, [%r6 + 0x0068]
	setx	0x0000008030a0b3f8, %r1, %r6
	setx	0xa7432fb096f645c7, %r1, %r10
	sth	%r10, [%r6]
	setx	0x00000010e0100000, %r1, %r6
	setx	0xa7432fb096f645c7, %r1, %r10
	stx	%r10, [%r6]
	setx	0x000000800e56e298, %r1, %r6
	setx	0x93e35b5334795f81, %r1, %r10
	sth	%r10, [%r6]
	setx	0x00000010a0100000, %r1, %r6
	setx	0x93e35b5334795f81, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000800f4e4a50, %r1, %r6
	setx	0x801fb96a58a8c3f5, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000c5024cb308, %r1, %r6
	setx	0x47f66050dca8002f, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001000100000, %r1, %r6
	setx	0x47f66050dca8002f, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000d0b033e218, %r1, %r6
	setx	0x662643fb34cd9f58, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001040100000, %r1, %r6
	setx	0x662643fb34cd9f58, %r1, %r10
	stx	%r10, [%r6]
	setx	0x000000eb71cd2758, %r1, %r6
	setx	0xc8edda149f5440eb, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001050100000, %r1, %r6
	setx	0xc8edda149f5440eb, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000f2392c72b0, %r1, %r6
	setx	0x677909f27ae23476, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000fc6bd0d220, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000ed6ea8c0a0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000dd1fd13920, %r1, %r12
	lduh	[%r12], %r11
	setx	0x00000010e0100000, %r1, %r6
	setx	0x677909f27ae23476, %r1, %r10
	stx	%r10, [%r6]
	setx	0x000000c08b570e90, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800f9ff208, %r1, %r12
	lduh	[%r12], %r11
	setx	0x00000010b0100000, %r1, %r6
	.word 0xe849a068  ! 261: LDSB_I	ldsb	[%r6 + 0x0068], %r20
	.word 0xa401a010  ! 262: ADD_I	add 	%r6, 0x0010, %r18
	.word 0xe0298008  ! 263: STB_R	stb	%r16, [%r6 + %r8]
	setx	0x0000008011c37e40, %r1, %r6
	setx	0xeb5ed3d73fa104be, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800e8c4860, %r1, %r6
	setx	0xc5948b31cf179706, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800ff7b5e0, %r1, %r6
	setx	0x7f2a9e523618af27, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000c5fa386f08, %r1, %r6
	setx	0xf6c529b946abb659, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000df482a8ea0, %r1, %r6
	setx	0x1198f20dd44afb44, %r1, %r10
	sth	%r10, [%r6]
	setx	0x00000010b0100000, %r1, %r6
	setx	0x1198f20dd44afb44, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000ea2c473c80, %r1, %r6
	setx	0x3601b2c2be5e8b22, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000fe3f68dcf8, %r1, %r6
	setx	0xace4cf55cb7246c9, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800efad3b0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x00000080dfa53d10, %r1, %r12
	lduh	[%r12], %r11
	setx	0x0000001030100000, %r1, %r6
	.word 0xe0418008  ! 268: LDSW_R	ldsw	[%r6 + %r8], %r16
	.word 0xaac18008  ! 269: ADDCcc_R	addccc 	%r6, %r8, %r21
	.word 0xe0318008  ! 270: STH_R	sth	%r16, [%r6 + %r8]
	setx	0x0000008017ddd2e0, %r1, %r6
	setx	0xf97af993542e32a7, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800e9a60f8, %r1, %r6
	setx	0x77c3e83b721722e9, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800f1d13b0, %r1, %r6
	setx	0xe471e2e81b0e7893, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001030100000, %r1, %r6
	setx	0xe471e2e81b0e7893, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000ccd1c97ed8, %r1, %r6
	setx	0x890369d221d404f6, %r1, %r10
	sth	%r10, [%r6]
	setx	0x00000010e0100000, %r1, %r6
	setx	0x890369d221d404f6, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000d2e8957958, %r1, %r6
	setx	0x0225bde610d4ba43, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000eb193d6ff8, %r1, %r6
	setx	0x7cb99eb6948305a3, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000fbe527e058, %r1, %r6
	setx	0x185fcec4b1ead589, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000ed6ea8c0a0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x00000010c0100000, %r1, %r6
	setx	0x185fcec4b1ead589, %r1, %r10
	stx	%r10, [%r6]
	setx	0x000000dd1fd13920, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000c08b570e90, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800f9ff208, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800ee14c48, %r1, %r12
	lduh	[%r12], %r11
	setx	0x0000001000100000, %r1, %r6
	setx	0x185fcec4b1ead589, %r1, %r10
	ldx	[%r6], %r10
	setx	0x00000080e6d685a0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000f365edec00, %r1, %r12
	lduh	[%r12], %r11
	setx	0x0000001080100000, %r1, %r6
	.word 0xe001a010  ! 275: LDUW_I	lduw	[%r6 + 0x0010], %r16
	.word 0xa241a0c8  ! 276: ADDC_I	addc 	%r6, 0x00c8, %r17
	.word 0xe071a0c8  ! 277: STX_I	stx	%r16, [%r6 + 0x00c8]
	setx	0x000000808a0e00e0, %r1, %r6
	setx	0xc4066fa3538091b0, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800efbe340, %r1, %r6
	setx	0xf1823fcb90815f15, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800fdc49a0, %r1, %r6
	setx	0xa065488b5a8d90b9, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000cb1fd44a70, %r1, %r6
	setx	0x86e492021bd8eb62, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000dcef4c1ef0, %r1, %r6
	setx	0xb018b869264ea9ec, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000ef5258b790, %r1, %r6
	setx	0xc47f2f4c2e4bfe77, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000fa6263bfb0, %r1, %r6
	setx	0x29100e030c196884, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800fdc7e18, %r1, %r12
	lduh	[%r12], %r11
	setx	0x0000001080100000, %r1, %r6
	setx	0x29100e030c196884, %r1, %r10
	stx	%r10, [%r6]
	setx	0x000000800e4ae768, %r1, %r12
	lduh	[%r12], %r11
	setx	0x0000001050100000, %r1, %r6
	.word 0xe0198008  ! 282: LDD_R	ldd	[%r6 + %r8], %r16
	.word 0xa6198008  ! 283: XOR_R	xor 	%r6, %r8, %r19
	.word 0xe8298008  ! 284: STB_R	stb	%r20, [%r6 + %r8]
	setx	0x000000805e2d8a48, %r1, %r6
	setx	0x0816a70e13331f39, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800e5f9038, %r1, %r6
	setx	0x50e934f9ed1af9e3, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800fe36d50, %r1, %r6
	setx	0xd7a87f6fb44d3d42, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000cbb2563ef8, %r1, %r6
	setx	0x57e810747c19dbb2, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000ddd2ac6ea0, %r1, %r6
	setx	0xc4cc1e3f8ca703fb, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000e3d99cf3a8, %r1, %r6
	setx	0xdc9be4aa6490af36, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000f80b474088, %r1, %r6
	setx	0x15258cebbcf54d8b, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000fc37c273f0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x0000001050100000, %r1, %r6
	setx	0x15258cebbcf54d8b, %r1, %r10
	stx	%r10, [%r6]
	setx	0x000000efc12bdc18, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d51fe3d7b0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000c7dba7ccf0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800fda02d0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x00000010b0100000, %r1, %r6
	.word 0xec518008  ! 289: LDSH_R	ldsh	[%r6 + %r8], %r22
	.word 0xac418008  ! 290: ADDC_R	addc 	%r6, %r8, %r22
	.word 0xe4218008  ! 291: STW_R	stw	%r18, [%r6 + %r8]
	setx	0x000000802950dec0, %r1, %r6
	setx	0xf2fcc00c2de1adac, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800e55f578, %r1, %r6
	setx	0x8520b542378c557b, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800fa89b28, %r1, %r6
	setx	0x58276f935c4cf408, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000c731167de8, %r1, %r6
	setx	0xf5d3b10a10b77c5f, %r1, %r10
	sth	%r10, [%r6]
	setx	0x00000010b0100000, %r1, %r6
	setx	0xf5d3b10a10b77c5f, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000dedaa3fb10, %r1, %r6
	setx	0xd9725ddda4460915, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000ed96f4ed50, %r1, %r6
	setx	0xd3cf23bcf19b0483, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001050100000, %r1, %r6
	setx	0xd3cf23bcf19b0483, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000fb82c2e230, %r1, %r6
	setx	0x1e038f2267b7e1e1, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800fe36d50, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e5f9038, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000805e2d8a48, %r1, %r12
	lduh	[%r12], %r11
	setx	0x0000001030100000, %r1, %r6
	setx	0x1e038f2267b7e1e1, %r1, %r10
	stx	%r10, [%r6]
	setx	0x000000fa6263bfb0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000ef5258b790, %r1, %r12
	lduh	[%r12], %r11
	setx	0x00000010e0100000, %r1, %r6


done;

h_bad_end:
        ta T_BAD_TRAP

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
	.xword	0x204d97771f57cf45
	.xword	0xd4d99325c6e97e90
	.xword	0xaa0e12647bcec8f5
	.xword	0xe362a7571ab13ced
	.xword	0x3bd7879d12a1006a
	.xword	0x0ec4e9a5cbc947dd
	.xword	0x538b26ebb40accdd
	.xword	0x20c6b4513a878993
	.xword	0xdbeaf5da8a7de860
	.xword	0x7857618e6c2fad98
	.xword	0x65b1295c189bea8c
	.xword	0x2698e97c603e546d
	.xword	0x11aa9b862e6ff658
	.xword	0x5a73dc9ac4f32587
	.xword	0xe0ae8dffd50a679b
	.xword	0x0fb16eb5be58516c
	.xword	0x71a2f08cd2c80703
	.xword	0xc060cce2c623039d
	.xword	0xf9efe3ceec10f6af
	.xword	0x887aa2af9c72ace8
	.xword	0xbdaf24bc8c30c51f
	.xword	0xfb0b51d211177491
	.xword	0x0a03946c1bdd46a9
	.xword	0x80bfce42631a34a3
	.xword	0x8096dfce1016d2dc
	.xword	0xd230bf64a3872048
	.xword	0x1660a6ad92bf3c78
	.xword	0xae8bd5a1495a0d09
	.xword	0x55453f54966f3b6e
	.xword	0x2606468f32ca1e6a
	.xword	0xe4b267d35bff1978
	.xword	0xe2f685e5b867f054
	.xword	0xf80d893c1839b4b9
	.xword	0x3caad3c2da99194f
	.xword	0xb8a977c4cf6b0299
	.xword	0x0741abaab7a47a32
	.xword	0x6b994c30ccad1722
	.xword	0x1c2a4c75a5ef16fd
	.xword	0x6504fe0907f8f7a2
	.xword	0x94a1490e80ee99ba
	.xword	0x6c778f7c2eb0d45b
	.xword	0x0ce8110223e8e71a
	.xword	0xcffcf714ef6f48a4
	.xword	0xc79796a8f04c60f8
	.xword	0x93fdb2612ed90fe3
	.xword	0x54920de462e7995a
	.xword	0xb7d67b97e3068963
	.xword	0x877925ca3e1971bb
	.xword	0xb4563c049c6bdc40
	.xword	0xd1036f980d42619e
	.xword	0x3488c1b40e84d0c7
	.xword	0xdddcdc0d2262e32c
	.xword	0xd75cd03dead474d1
	.xword	0x13ce5601edb635f7
	.xword	0x6703dfe1750491ab
	.xword	0xd9cc9c1542b4beda
	.xword	0x603de4055b86ce92
	.xword	0xaf2685458b33476d
	.xword	0xd55ce657616cb283
	.xword	0xcae32e3853b419ae
	.xword	0xfdf51e9c95d558ec
	.xword	0x44ee89025cc8fe99
	.xword	0x93264eff565384d2
	.xword	0x42e6919b173f18eb
	.xword	0x93a91314ce9fcca9
	.xword	0x96216de59562bb2e
	.xword	0x21379ac5ac708736
	.xword	0x61f6421e6d27183b
	.xword	0xcdf0205f0d92580a
	.xword	0x9ef51e13db1ea197
	.xword	0xde11fb066b694710
	.xword	0xc5d052c5a7e5f355
	.xword	0xf024d1d9cb9f9954
	.xword	0x28a3d233ec4316c9
	.xword	0x3f9284530dc799bb
	.xword	0x235cf648c0b428fb
	.xword	0xbb92c1d1764c768a
	.xword	0x22201efb50d6fb6a
	.xword	0x81867b91fb68bcca
	.xword	0x5d3d8a2a33730661
	.xword	0x325e537d6603b50b
	.xword	0x9a4905e942df65cb
	.xword	0xdf6e9016abf55291
	.xword	0x3a7187a35d3a31dc
	.xword	0xd91cdefac605938a
	.xword	0xec5eb9cecd253938
	.xword	0x96a5d362095f2fe0
	.xword	0x688007e7d6b7ab81
	.xword	0xaa75ab05193d2b5f
	.xword	0x64abb6ecea42271c
	.xword	0x758bae8c76efc60b
	.xword	0xce5c06886f5f8b42
	.xword	0x907e36cbf1957aee
	.xword	0x259daddc55ca2b44
	.xword	0x77862d4539ae7384
	.xword	0x3a55e8b65b4817a2
	.xword	0x3ff2db2b35f92054
	.xword	0xfc068b6a030e8f5b
	.xword	0xf1098758d1c3b7f1
	.xword	0x215bc334d4cfad0c
	.xword	0x5e7bb6b5bab8d9dc
	.xword	0x72592fe95983a489
	.xword	0xa833ec61b43838f9
	.xword	0x304bd7d86f2ec099
	.xword	0x30d066826c5397e3
	.xword	0x9804a9e4e346837c
	.xword	0x090154a6d0e89469
	.xword	0x2c55338327666928
	.xword	0x6593e1c77a83902a
	.xword	0x8f8fdbb49a9fa891
	.xword	0xbf8af68c732cf232
	.xword	0xfd8b54bd9f6cd5a0
	.xword	0xd5060a92d9bf65b5
	.xword	0xa9058be7f28eaabd
	.xword	0xd7ea21359e600d63
	.xword	0x7928e46de1fa2adb
	.xword	0x275bfe336e939eee
	.xword	0x3c6f0e0e55c93689
	.xword	0x0e9ac7f057a51246
	.xword	0x549b38c58a94f87f
	.xword	0xad7bb1a67019e09a
	.xword	0xdf51960b2d11b1bf
	.xword	0xe33ebaebe590b153
	.xword	0x88a29d80c795e075
	.xword	0xf0eee7861877ed87
	.xword	0x450deb2c15c7a157
	.xword	0xa5f3871c031566f6
	.xword	0x842e165cf8e3a44e
	.xword	0x7395aeafe848aa4a
	.xword	0x6c5f13219ce812c6
	.xword	0x54c99ec17350926e
	.xword	0x6616b59e28b3963a
	.xword	0x00b27ecff00e757e
	.xword	0xac7091e1b96c4565
	.xword	0x5b2ed9484fb91aae
	.xword	0xc82a3055249d7b67
	.xword	0x2f87c70a85ed7205
	.xword	0x5f7523fae3ce2a94
	.xword	0x5d578d328125bf6d
	.xword	0x3a65575d742cc520
	.xword	0x025b8728f07701b6
	.xword	0xc8864dc7aa9d7b8e
	.xword	0x0272559cc924641b
	.xword	0xb958683962185492
	.xword	0x3413615cfb758709
	.xword	0xd82fb51f67f2460a
	.xword	0x107dd71998c7cad2
	.xword	0x95816fe5ff86a917
	.xword	0x131445a747a95929
	.xword	0x531cab23f6fd8138
	.xword	0x687561839ee04ae6
	.xword	0x1128c6ff32714a72
	.xword	0x229616295c23968c
	.xword	0x87a3179ff1f358cd
	.xword	0x8f48c292dc5f8d00
	.xword	0x1cbd235d14b65b18
	.xword	0xb335ea6c958b1db3
	.xword	0x8e633b5833fbc50b
	.xword	0xf98a6274cd9539c0
	.xword	0x7e8a4c025c9d5fd2
	.xword	0x19c6806f69d8a172
	.xword	0x7bf85e21d468729f
	.xword	0xb93066dae0e37da7
	.xword	0x96fcf0a8c643f837
	.xword	0xf503c4205e5d1cb8
	.xword	0xfe80644c03ddec0e
	.xword	0x54cb12186436f0c4
	.xword	0xa70d3cbe3cb9f97b
	.xword	0x750f946e9bbd6687
	.xword	0x1b5fd5345cbec99d
	.xword	0xa41d2249f53ccc5a
	.xword	0x0ef2fc4a6135ea87
	.xword	0x50df54220a3c4a9a
	.xword	0xbd41f1246d11a00a
	.xword	0xb0272f25e8fd7d44
	.xword	0x01c36856d6a342d0
	.xword	0x03cfd1582002f99d
	.xword	0x3dd5a25c87cdf80f
	.xword	0xeb67f245d169580a
	.xword	0xc256423efa73b793
	.xword	0xf9305f8ed0687943
	.xword	0x58e3529192c48437
	.xword	0xdef860ad5ce5a024
	.xword	0x9e5846e2979d60e1
	.xword	0xed78afb1cfcf8fde
	.xword	0x43c6c3031c0322bb
	.xword	0x9b1c9c6641eb97f9
	.xword	0xe4cd27ca1335d24b
	.xword	0x94af2c06fb86223b
	.xword	0xf3b8a6fcc06b5e9d
	.xword	0x0f4afe847642a9d2
	.xword	0x7209b09d9b2681b3
	.xword	0xe85f09aac08f338e
	.xword	0x3954d8ee96b5d0b1
	.xword	0x38e41bb65fe0c783
	.xword	0x7568a57406aa6a32
	.xword	0x298448f8d79d7317
	.xword	0x046a90ad35630ae8
	.xword	0x51412781fe5e6c36
	.xword	0xc0b1e8ec2bf47575
	.xword	0x41da74809acf407a
	.xword	0x901c9dac72871050
	.xword	0xf8406df68227c89a
	.xword	0xdd3a33ab35b91738
	.xword	0x38ecb7f882c5035c
	.xword	0x16963c0cf22d5541
	.xword	0xfe805c4d05d1884e
	.xword	0xe3186ccd01e2ba66
	.xword	0x783e6202ad026273
	.xword	0x16f786eac4c9e793
	.xword	0x7ad1e36324bd6240
	.xword	0x3fb94c91ecd0c41e
	.xword	0xd458864b361be785
	.xword	0x9ef6b46e55305c9c
	.xword	0x976264de37f01289
	.xword	0x81142ccb3d26fe86
	.xword	0x62391bd476a5e959
	.xword	0x0a0a2ae8cd50fb90
	.xword	0xe23b5201e41cc6f5
	.xword	0xbd9e66a401d0cadb
	.xword	0xdcf41a17d93e51ab
	.xword	0xb9f73f86c0f5516a
	.xword	0x4feb5a9586b21315
	.xword	0xfdc604064b746a0d
	.xword	0x883a82be26e145a3
	.xword	0x8499dbb3eba1d365
	.xword	0x2808294195aea44c
	.xword	0xe59858ddfc2c6a93
	.xword	0xad94e84c292dc631
	.xword	0xe6e9c7da65331b10
	.xword	0xd113f95407fd8006
	.xword	0x6e70a907b0dc7ba3
	.xword	0x95bfaf8f70809689
	.xword	0x7c03513ccf9f65b5
	.xword	0x42e258a3c1a9d21c
	.xword	0x7669020ca2c282a8
	.xword	0xf7c47c040b65cb05
	.xword	0xd888d90c036e17f8
	.xword	0xbb5bc309a888e969
	.xword	0x24270370fa8974b5
	.xword	0x7efc734da0c4fcca
	.xword	0x3a1e6f24774bfdfc
	.xword	0x37a5f832301769bc
	.xword	0xd288c424454f799c
	.xword	0x1dadf290060da606
	.xword	0x8912bb8a27f2ea57
	.xword	0x2840ae8c99b5e08d
	.xword	0x853d2a0db19e5164
	.xword	0x626436e064c02c2c
	.xword	0x6bfeeaec6dd9a41a
	.xword	0x70e5ef73ead395fe
	.xword	0xfa3fc7ea8eaef281
	.xword	0xf32e3a3a1f491f1e
	.xword	0x938ad4ba15442975
	.xword	0x18dfa7d1472d6d0d
	.xword	0x8e8b00414bd052ca



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
	.xword	0xbb97672dfa424df6
	.xword	0x95f987fce97bc8dc
	.xword	0xdfc785f2bdf56a45
	.xword	0xaabed6e9d63f1194
	.xword	0x78ef2d752c55a788
	.xword	0x97d62af98caf1bbd
	.xword	0x03743ba928cc81e6
	.xword	0xdac7d70e1bf0c721
	.xword	0x60eceab260744966
	.xword	0x603d73e3fa86abc4
	.xword	0xf1099a4a99451f6f
	.xword	0xaa78511cc643a67f
	.xword	0xfba408f8cc891043
	.xword	0x45602f3d2eded2d1
	.xword	0x6399a7177e89302a
	.xword	0x271a813e180a877f
	.xword	0x9e71de5622a561d5
	.xword	0xec883d8640ca42ae
	.xword	0xe80c30a8338cdf8f
	.xword	0x868e2295f8eb3ee3
	.xword	0xf7d96e58fcc366fc
	.xword	0x4a7d1bbdd33d676a
	.xword	0x7aa463bcf110cf20
	.xword	0x66506551e14786a0
	.xword	0x06ef18a0e9c3aafb
	.xword	0x2b9c3ca52edc3912
	.xword	0x1bfe8b7e61d6040a
	.xword	0x8ceb1ef1e99c9a2a
	.xword	0x897ea224db55396d
	.xword	0xb7ed43560ad9a1a0
	.xword	0x9a0799e1c1a5541f
	.xword	0x6d98ae3682527632
	.xword	0xff3cc7b736c29b83
	.xword	0x2380626a5a984367
	.xword	0xd95a3d14456bd2ed
	.xword	0x87932698b714776e
	.xword	0x4204d30ac57df667
	.xword	0xb7e0f3e1b978b1e0
	.xword	0xeca16d41dd44d4e3
	.xword	0x2bcf26bad7fed31a
	.xword	0xb73b1012a30ebc4b
	.xword	0x23618944e0ea665a
	.xword	0x8fccde7e448cc589
	.xword	0x7f0c076e5a2262dd
	.xword	0xfd93098dfdd0eb3e
	.xword	0x2f0c87f1e8e3dbb4
	.xword	0x32b8e02c8c92c0ce
	.xword	0x30e3273c7c3420fd
	.xword	0x3cbc40e363d57c48
	.xword	0x5894ad44077ab3fe
	.xword	0xa64b822f3cf79ace
	.xword	0xe265612700f58755
	.xword	0xacff4ada2f25a774
	.xword	0x96882b5257890f7d
	.xword	0x5929b4f9bb13ced5
	.xword	0xd3be4abd85e5c23c
	.xword	0xe15fae441a8d0a69
	.xword	0x13a90fd7abef912b
	.xword	0x948efe95c2f6f029
	.xword	0x8b8ba615cbc6badf
	.xword	0x150dbcfacb63c55c
	.xword	0x2555b2fb824249f6
	.xword	0x5529c81863dbf7ce
	.xword	0x12d01e3cf37e13e2
	.xword	0x22db9adf00defed9
	.xword	0x6bad8e745b760796
	.xword	0x963a8d75380302bd
	.xword	0x1cee08e94e051d93
	.xword	0x8db2962e5faa697d
	.xword	0x3d5e3bb9ea7bef47
	.xword	0x92ebe513abbac3f6
	.xword	0xb2dc42a2c522ddf7
	.xword	0xc78cc09cd673dfa3
	.xword	0x481874c485a7b68a
	.xword	0xe688b31ad0aabec6
	.xword	0xcc5bf0a35c3f18b1
	.xword	0x825d953a515a77d5
	.xword	0xb85c2db268723080
	.xword	0xc19a01fd118b1410
	.xword	0x0694552886ba8099
	.xword	0xd0a8dfd765409ee3
	.xword	0x679760719d5fa227
	.xword	0x9436c9856b37d708
	.xword	0x1ce0db6fc49cbc58
	.xword	0x8dac533732c2d9aa
	.xword	0x64019c9dedc81adc
	.xword	0x67cd89e50d88b89d
	.xword	0x8a6e65f615a7e55c
	.xword	0x119e9a75eea713e4
	.xword	0x18a0eac97cb9fdc1
	.xword	0x4a76c6bcef54202a
	.xword	0xcb8600309c04b7fc
	.xword	0x9bde45c099131b31
	.xword	0x25c80ea6aee3a6b5
	.xword	0xba655b311593e55e
	.xword	0x462934bdd6816f8d
	.xword	0xf2d3a909e6cd027f
	.xword	0xb5fac4617f96ba86
	.xword	0x8c85d0be6aba1096
	.xword	0x2901eeb1a66d363e
	.xword	0x36aa97bf91427601
	.xword	0xdd3c2c98862da872
	.xword	0xc9e070c707c2f18e
	.xword	0x3d8096391c3b0f69
	.xword	0x360248fcd9104a00
	.xword	0xaa0bcd0c35ed616c
	.xword	0x24b278f7b9ff503d
	.xword	0xdf733a22b06ecbd3
	.xword	0x276640b06557910e
	.xword	0x651fbac5bca0d77e
	.xword	0x2b7f182e563eb8fd
	.xword	0xd9a79d82879ca9bd
	.xword	0x7a6c3ae7488e78dc
	.xword	0xe63bfdcce504fa97
	.xword	0x0a3a1389053e9956
	.xword	0x46424f76d18cd422
	.xword	0x351f0a1c6f29659c
	.xword	0x2e413be2e4434e34
	.xword	0xe2a807bc97d5af0f
	.xword	0x0d790aa440d0f9c2
	.xword	0xaf955f20031c5525
	.xword	0xa4869a8e53072e8e
	.xword	0x80cb31a2a66676df
	.xword	0xaea75c0879aa19f8
	.xword	0x5bc9751dfe577e8d
	.xword	0xb3c473140517d280
	.xword	0x34a1274a48997e7d
	.xword	0xd71c4183d84b98bb
	.xword	0xd09a9e2058bf5247
	.xword	0x555f20f78818e63b
	.xword	0xbd1ec6485cd57aba
	.xword	0x495da039da3dd31c
	.xword	0x73089649418fd493
	.xword	0xc6bf92e82c2622b1
	.xword	0xc1ec044eff575b52
	.xword	0xe9172c3c19fc1dc3
	.xword	0x4ca68b7ac9bb2688
	.xword	0xdbe73f64f1912dab
	.xword	0x3db68345d5166c27
	.xword	0xa52a05f191baa14b
	.xword	0xdf12ac0c5900cbc8
	.xword	0x7091a148972f42a8
	.xword	0xa22cfc207d103ea9
	.xword	0x6f745c65e9087305
	.xword	0x89b0a25a0d763475
	.xword	0x07e7bf33366696c2
	.xword	0x00c27a27d8dc8441
	.xword	0x031b632bd8c0aeaa
	.xword	0x59dc596f8ee3353d
	.xword	0x09d49832eb7cac13
	.xword	0xd249a29d2e3ba12e
	.xword	0xb7beb583554d0f1c
	.xword	0xef3ba0a8567f0c12
	.xword	0xae6446cbfaa85ea4
	.xword	0x4e56510052d14cef
	.xword	0x5bfe4566ba23b863
	.xword	0x73a4e14e61c27369
	.xword	0x8ae7f43a54801c61
	.xword	0xfc8bc32eb08ed38c
	.xword	0xe352bc67631a9523
	.xword	0x66fa74a506efb0f8
	.xword	0x5b90257c98e210eb
	.xword	0xabe946157f257743
	.xword	0x74e8210d3714a854
	.xword	0xb0744bb0f1c596a1
	.xword	0x0be0702a7e208dbb
	.xword	0xe5f6544ad107aed5
	.xword	0xc64cff59c43ee0ed
	.xword	0x25acb4328647cd48
	.xword	0x3c07f4e1ed4621cd
	.xword	0xdaf10b2d680163db
	.xword	0x22914a09bbe0f45c
	.xword	0x134214026fa54599
	.xword	0x0d46abd481f451b4
	.xword	0xc3f078fcfdbfa3ff
	.xword	0x694fb09b9955b55a
	.xword	0xecea3ca39f660b7d
	.xword	0xc881c87f1cd82d2e
	.xword	0xa6c8f910204f7db3
	.xword	0xd743c68e527b9379
	.xword	0x1b403c64a57639e1
	.xword	0x54b63f7d5187a391
	.xword	0xdf39528b4c9a7569
	.xword	0x35fc92908700c078
	.xword	0x5d3facda9ce31270
	.xword	0xcd4f6622e78605d2
	.xword	0xb96c9270e536633f
	.xword	0x602e7cc548f3fafd
	.xword	0x3ce0230e8793570d
	.xword	0x0bb84d15e55777d4
	.xword	0x21733761a4468017
	.xword	0xb6fe5253a42716a9
	.xword	0xfd312f60df42ca07
	.xword	0x36eaebe396763e03
	.xword	0x68e1b0f976ab5571
	.xword	0x0af56699e7f6b212
	.xword	0xa31a8df27888c8df
	.xword	0x7e49f057f130ec24
	.xword	0x95fbeb1b15827f9b
	.xword	0x8bd383ab0d744432
	.xword	0x6bbe8195af5e1e2b
	.xword	0xe7599de85223ea00
	.xword	0xea07c34645e5267c
	.xword	0x6cde9843232f57a8
	.xword	0x4212c08328efa0b1
	.xword	0x11f74e0ce652b917
	.xword	0xf4575d6bdc71df79
	.xword	0x7faa6bf91df1946d
	.xword	0x8ff5e4de3c5456c1
	.xword	0x9c89febf0e240f58
	.xword	0x25b519a71132ac59
	.xword	0x60c722f5fdcd64e6
	.xword	0xe76e6037bdfc822f
	.xword	0x7931d776bc7209c7
	.xword	0x03a81c86a762ce93
	.xword	0xe48473ed32cff0bb
	.xword	0xf91828f2e2c46a38
	.xword	0x1b8d02c12f78a59f
	.xword	0x253f8202ec8f70e9
	.xword	0xab25d8742b76747e
	.xword	0xc19eea99d568ac69
	.xword	0x3dd835516f7c746f
	.xword	0x668fbd092ff79aaf
	.xword	0xff4268aef44c5b65
	.xword	0x39959d0bc5cff905
	.xword	0xb899932154061665
	.xword	0xdd7d7aa47fb8f121
	.xword	0xd4782416bc6a59f3
	.xword	0x1394f76474768b99
	.xword	0xad3c493bf666d3a8
	.xword	0x7b420db7e21745d4
	.xword	0x0f0e97a6d49178a6
	.xword	0x1c6d6cf9b37a9c86
	.xword	0x667afc22f4c9c110
	.xword	0x9c416a4284eefac1
	.xword	0x12a2497c30586070
	.xword	0xd666614d50fc0849
	.xword	0xb55e25fc60804493
	.xword	0x3e19bebf5258d702
	.xword	0x918b232b60605d15
	.xword	0x8dddb4bd3559e7fb
	.xword	0xc9f2eca94f406f66
	.xword	0x2401eaed47eb693f
	.xword	0xfe25812140a1977f
	.xword	0xf0c61be11d685e8b
	.xword	0x8a87cca33de3fb5b
	.xword	0x1abad0f3600e9f75
	.xword	0xe102bd67034d22af
	.xword	0xab73aab52b08793a
	.xword	0x8890fc000bee0541
	.xword	0x2c7b6551b5a59c4a
	.xword	0xd442f1ee687dcad6
	.xword	0xf360aa6067c2c41e
	.xword	0x6eccc2143a1bcae5
	.xword	0xf6f9da7e9d5d2975
	.xword	0x4ee43e3e84727c67



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
	.xword	0xbaee4f5d5161336c
	.xword	0x027dd64ff74616ae
	.xword	0xe6ca654ee382799b
	.xword	0xe6f99adf15118fb5
	.xword	0x3119a83a7d129077
	.xword	0x63a03ca99ce885a2
	.xword	0x596e44df848750c3
	.xword	0x7d73974863eecc36
	.xword	0x9884ed44a80dc278
	.xword	0x78b93e4f037a0e97
	.xword	0x7128942c2fbac6f3
	.xword	0xf058cea12f3c1d12
	.xword	0x95b38f461c31b9d8
	.xword	0xaf7a3f545ca16121
	.xword	0xfae6bcc5e83a1ebe
	.xword	0xe2ebaebb8480c2f2
	.xword	0x5028e1a9becb32b9
	.xword	0x3a5b2da116c7e7e2
	.xword	0x817e3b36f2aa2aae
	.xword	0xaa02f882206f3960
	.xword	0x224dc75442bffe1d
	.xword	0xa7980cdc22140d14
	.xword	0xa404c9df307d9d9a
	.xword	0xc94b24bf8a53d175
	.xword	0x6800dba4089489f3
	.xword	0x93c80b55f929380b
	.xword	0x7eb3d17adb07a683
	.xword	0xeef628f260dcc6fb
	.xword	0xb1595eba8f56614c
	.xword	0x59820399dc9543f5
	.xword	0xd93b67c6989f9a66
	.xword	0x9128475de6ddada6
	.xword	0x245685d7e9ad8b8c
	.xword	0xbe703eace7c2b292
	.xword	0x1f3131704013c255
	.xword	0xbd4629e8a912bf9d
	.xword	0xcc965fcf19cda8e9
	.xword	0x2fe5d99600fa61d0
	.xword	0x77c05bda8c7f52ed
	.xword	0x30788fa5e0fbe15d
	.xword	0x4460e7b1155dd906
	.xword	0xa65c09e48eceb1f6
	.xword	0xa938fbe9ce757aeb
	.xword	0xd68e475b5dbaf2ea
	.xword	0x44240d91724358b6
	.xword	0xa5dff09d0eb89155
	.xword	0x77e049d3505a8a39
	.xword	0xca599d46b0b1584c
	.xword	0x0f30039e67cfa975
	.xword	0x0ef81699683829f6
	.xword	0x5f8f41c142c74523
	.xword	0xc0f8c2be393bdae4
	.xword	0x594ffcf6bcf9bf1e
	.xword	0x2c8fd05f3fbbb260
	.xword	0xa4c8b70f7e0359a0
	.xword	0xd69ce4b19cfd0e3c
	.xword	0x9c3f6fde1834bb30
	.xword	0x7942b99fd206808f
	.xword	0xac8cef3781950436
	.xword	0xba7286073eccb0b6
	.xword	0x0667de5768455af2
	.xword	0xa6568b107f4041fa
	.xword	0xdc29648e53b68084
	.xword	0x8054bc810e0b86aa
	.xword	0x340ffd683926ad48
	.xword	0x2a7c788a1f8c9391
	.xword	0x16bcb39be7cc3895
	.xword	0x30bd69f1c5e7aeeb
	.xword	0x50a135e6794e0032
	.xword	0x6503b39a1c0418a9
	.xword	0xb874dfbe042bde5d
	.xword	0x5757d70b17894abf
	.xword	0xfcf46521a98043e2
	.xword	0xa278f5bfac8ce9df
	.xword	0x05fd942be2005d24
	.xword	0x153545746d24a309
	.xword	0xa339257fc8ce2dbe
	.xword	0xa3eb07d00522c6da
	.xword	0xb0497803cd2761fa
	.xword	0xfa343db8da1fa76b
	.xword	0xa26cf23e60c689f8
	.xword	0x40705295faef851e
	.xword	0xe7c9ec97cfc23e61
	.xword	0x117488f9b1907fbc
	.xword	0xd8b923b19cea7674
	.xword	0x76a8c9b8bede5355
	.xword	0x88cfad662ce2e51b
	.xword	0xb13d064b067e5f8e
	.xword	0x2fc23353bcffa34a
	.xword	0xe174d961fbfc4819
	.xword	0xe74c84d1d4f7bc67
	.xword	0x4d9bb31750f6ea67
	.xword	0xda561a379842064b
	.xword	0xe99e15b05738b6a2
	.xword	0xc1e67e1842c997bb
	.xword	0xc52b3bd2f100bac7
	.xword	0x59728d6dd9f58f02
	.xword	0x83c270637c838726
	.xword	0x0fe7c9699d9f7c00
	.xword	0x104ea2692ce0bedc
	.xword	0xea439669bc352c07
	.xword	0xf17c701a00686578
	.xword	0x7301c3ea1d458a0d
	.xword	0xc96844fad53eae05
	.xword	0xbe7ad10f5c03ee5a
	.xword	0x913a01f5cf33851b
	.xword	0x6c86ea29b762b7be
	.xword	0xcee4f368e6b58bdb
	.xword	0x9824260f8fda2181
	.xword	0x9f8d0760c5ab1af0
	.xword	0x416005b5845f834c
	.xword	0x982c2bc621cb1dbc
	.xword	0x208f4adff4eba6e8
	.xword	0x53a356e4fc05258a
	.xword	0x6f3bb27936828daa
	.xword	0xace17edb26a8d476
	.xword	0x91f4174e2b12a00b
	.xword	0x527284d7c0006993
	.xword	0x9e3fffe45c18d2ed
	.xword	0xdc06fe3914ccb4c0
	.xword	0x19a6aeb835e6a4ae
	.xword	0x93d5b433fed0d1e8
	.xword	0x43057992c053a312
	.xword	0x5f01440fdafdd554
	.xword	0x27bb7c038ae7974d
	.xword	0xabcd445714c52ded
	.xword	0x4de0677dbac87694
	.xword	0x5b486b23802633e4
	.xword	0xcee09d6626775d9e
	.xword	0xc8ed7606d7379c82
	.xword	0xa6843d2b271162dd
	.xword	0x315956d122da52e3
	.xword	0x77d90ede8cdd6ebc
	.xword	0x9674e1e191c2c853
	.xword	0x110588bab4c37fd5
	.xword	0xbd3e28b81570aa28
	.xword	0xff03a894556e8e7a
	.xword	0x3aff087d83b44a9a
	.xword	0x5b2a2e22847af2ce
	.xword	0x2906635174d27ca5
	.xword	0xe9f4539922626e34
	.xword	0x936fa6e488d36c9f
	.xword	0xf3ccc9d7361c59a5
	.xword	0x4d46c092c326e97e
	.xword	0x2a8c1697bd5db671
	.xword	0xe99ceb9326ece7df
	.xword	0xc9e0760096da04d4
	.xword	0x997cab0bb15a4bd8
	.xword	0xe5510002472b1641
	.xword	0x8e75ea8b436803c9
	.xword	0x1c3b94e08543d5c8
	.xword	0x0007850ee3767c68
	.xword	0x907919a20f2458d0
	.xword	0x9a33d596018ef573
	.xword	0x596a13d3fae1c650
	.xword	0xd5d970e86ecba9bf
	.xword	0x9e7ce9f7bedaa8bf
	.xword	0x14f492591eed2da9
	.xword	0x02e1f8220ecc7471
	.xword	0xb9e09f5420fd94e7
	.xword	0xb7f1c9b3d7b96030
	.xword	0x41dfed8a6cbf3046
	.xword	0x34b05b81cd40f301
	.xword	0x0edb8fd7fba86b79
	.xword	0x99b098bfdb746d18
	.xword	0x50ffd4bb30958d5d
	.xword	0xc2a259b749206df3
	.xword	0xa330e5901b4b683a
	.xword	0x1c2fa1cbb066a630
	.xword	0xbff0396390c3fb18
	.xword	0xf181af8adf5eba43
	.xword	0x63357bf3032c4b61
	.xword	0xd01387018bdb0b7f
	.xword	0x58281dc0a80fe47a
	.xword	0xdf95827249ac691d
	.xword	0x39c07daecd9ff868
	.xword	0x0584a6e6ef25699c
	.xword	0x4ced41e08a79d6a3
	.xword	0xe3be24e10897f677
	.xword	0xbde96e772fb53641
	.xword	0x4ccf2e19752816bf
	.xword	0x449e8e488bcd1569
	.xword	0xc4561314515d2365
	.xword	0xede8e590d1ce2b0b
	.xword	0xefc947021a2ba1a3
	.xword	0xca0c95774aef2051
	.xword	0x2b548f89961cd466
	.xword	0xfcd54cd940c1bbe2
	.xword	0x5617a2efec917a8e
	.xword	0xb52b72d1fe1bf2da
	.xword	0xd20f02af522aea8f
	.xword	0xc9ecc059502db499
	.xword	0xe64c10cc4785a5e9
	.xword	0xf96d06f6e045f13d
	.xword	0x7e1bdd156b2447e2
	.xword	0x7e22afa78802db2a
	.xword	0xc50ea6dff9b01ff0
	.xword	0x56718b8821def4ee
	.xword	0x32cceecce6533151
	.xword	0x1db9833f64f14f49
	.xword	0x5fdc9ef498d28c8b
	.xword	0x7b2789f7bd1ed506
	.xword	0x56c155f2708df385
	.xword	0x4edde6718cdf94c3
	.xword	0x11475d403b2d0be8
	.xword	0x5bd5c0e4af8b75b8
	.xword	0x94739e0be48b575e
	.xword	0x31c123a001ee7fad
	.xword	0xa487196e04063fc2
	.xword	0x3173d795a8e2a0b4
	.xword	0x276a4ec907f5355f
	.xword	0xfd19382d59d43a52
	.xword	0x94d2a8c5e31f133d
	.xword	0x47f917e39e839bbf
	.xword	0xb2d9d4c1671565e8
	.xword	0x2daa8d9594bf1d38
	.xword	0x540288710d868005
	.xword	0xb913bf91b2cca25f
	.xword	0xf06dffdcb17953b4
	.xword	0x1380f70fa55b70d0
	.xword	0xffa5e63d354ef634
	.xword	0x344b9dfe5437a504
	.xword	0x879b46251797d2ed
	.xword	0xc7587b678c6c1c52
	.xword	0x2c6cb9529e1874a7
	.xword	0x39bc31b8acbec63d
	.xword	0xd84bb6d2812fa4e1
	.xword	0x1c41d9645b841f4e
	.xword	0xec64fbdfd909c116
	.xword	0xdbc6f94e6eed0141
	.xword	0x84faf40dea48fb86
	.xword	0x0116d74290e82180
	.xword	0x9f6da1924e51c563
	.xword	0x718f592c5e456b1b
	.xword	0x4292edaf3f006713
	.xword	0xe07d5a4e1133617a
	.xword	0xb59642992c024814
	.xword	0x63a4b7995aaf3660
	.xword	0x432a72e9351a22b1
	.xword	0x852bcaea3c49e592
	.xword	0x16e8bfc032c8ee29
	.xword	0x3e8794286ed93e36
	.xword	0x48a02d6c8f6adb2f
	.xword	0x30077f2d1dda5c07
	.xword	0x8bebad20a71c1212
	.xword	0x34900b590f1f52ec
	.xword	0x5fc72d1a2b1b1eb9
	.xword	0xad03c51aa54bc06c
	.xword	0x5d7952ded90f74fc
	.xword	0xdb333422875085a9
	.xword	0xe9cbb8cca6429acb
	.xword	0x631c3c8f8b452859
	.xword	0xa2f421de10757913
	.xword	0x51f464aa9b91371e
	.xword	0xc6fd8184dc33d7e2
	.xword	0x2329917f94d218a6



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
	.xword	0x3829b3e893bc2253
	.xword	0xd335d7c192661fd5
	.xword	0x372f01466a1776f1
	.xword	0x51dd292c5507a208
	.xword	0x13cef6beb0476a28
	.xword	0xa41d2b1411bb9015
	.xword	0x62b9b74e8bee34df
	.xword	0x6bca644fcf52adc6
	.xword	0x7a32e93b6ef8bb0b
	.xword	0x5a7ed2beb57c8e2e
	.xword	0x7a156415b315f3cf
	.xword	0x73f6964d6ef25fac
	.xword	0x0ad535d167cf38bb
	.xword	0x11af656663681935
	.xword	0xc522e676c63d8269
	.xword	0xa5a00d975ab4ac78
	.xword	0x22237c53982f23d7
	.xword	0x6f6025e0c66c3e59
	.xword	0xd85b16b547f7c4f5
	.xword	0x200a1d9b096235b3
	.xword	0xdb93126aa9441b20
	.xword	0x556d6613870fa393
	.xword	0x802b76ea1ef2b7fd
	.xword	0x66818db55798afae
	.xword	0xa77e8428e5d170f0
	.xword	0x8fc463dbca644b09
	.xword	0x9a29404728f0415b
	.xword	0x14b49982b7af9240
	.xword	0x007644e97f6a1173
	.xword	0xb0c5214c5309f39c
	.xword	0x686e1b8d595dd822
	.xword	0x41c3c6ffe4826ddb
	.xword	0x3783aa373ab85876
	.xword	0x580edbe7a6ed5777
	.xword	0xdc9a410c049e37aa
	.xword	0x1c99691288d48d57
	.xword	0x9af30222a0f2945d
	.xword	0x827ba851fd9a5b41
	.xword	0x0169e743950e48ae
	.xword	0xcbdc3a36913776c1
	.xword	0xffe1bbf37ad75325
	.xword	0x9df0a3215d738a82
	.xword	0x933fdf0c9102c9da
	.xword	0xa2c52b40e53b6cd0
	.xword	0x323989d020a16d3d
	.xword	0x570eaa4fe55c91f8
	.xword	0xf7a9df69c7cfa890
	.xword	0xc9a7df264b07c9e6
	.xword	0xe89ec2d1582f2bbe
	.xword	0xf730d58a6669c453
	.xword	0xc25122a052cdf9a4
	.xword	0xd860a2c33315f1fe
	.xword	0x184a2e86cabe8211
	.xword	0x832145ec860dba4a
	.xword	0xc53496302ac0b6f0
	.xword	0x55a7fc356a2d731a
	.xword	0xb46754da79a18105
	.xword	0xcc49f5c182b9b9f6
	.xword	0x8c12a0280d73c2df
	.xword	0x0cfcd1afee6128a6
	.xword	0x2970b295cf5f74c5
	.xword	0x4ef805032e8bf42a
	.xword	0x689b8f4cd666511f
	.xword	0x9340048c72d5dc3e
	.xword	0x63425561bc4a06cf
	.xword	0x2f2594445653401d
	.xword	0xa3b6309040fe433d
	.xword	0x6ecece9bb684f0c8
	.xword	0x663578a3100c7992
	.xword	0xa3d90dd0122a03c7
	.xword	0x67583f6337da9fc0
	.xword	0xdb5709803282ed31
	.xword	0x95f8b0af572cb9b4
	.xword	0x4cdd4c29c7e4f7d5
	.xword	0x698e80c1c010227a
	.xword	0x24011ed21c247572
	.xword	0x235aec59b1d6e293
	.xword	0xf239a80fdd50aa94
	.xword	0xcc4e71da5adbeaf8
	.xword	0xc51adbeee6ba6162
	.xword	0x90baacb445eb33f1
	.xword	0xdeef727a9ee07fa4
	.xword	0x56e2b3fb09b7e093
	.xword	0x0854e2d4bb98f97a
	.xword	0x818c54998adf7f55
	.xword	0xf333e6a3062dc5b5
	.xword	0x4a8af3ef9652c5f4
	.xword	0x2a3d2fdf597c6ba0
	.xword	0x94c51f4418e8eeaf
	.xword	0x1da982ee357db685
	.xword	0x3ab0c027525a2400
	.xword	0x139b31b44896aff7
	.xword	0x2ea25db253ac0bfe
	.xword	0x37c5036ded9a9434
	.xword	0xdc136fdfabb053ff
	.xword	0x0cb0102533c265be
	.xword	0x8c9fadcc02736738
	.xword	0xace34c38e7871d77
	.xword	0x1fd8a16ed7fcc4d0
	.xword	0x4479cc60a6af69e9
	.xword	0xeb1809dcf4c0775d
	.xword	0x82bd946e32cc1084
	.xword	0x49de33b6f9a7c011
	.xword	0x39ae7a8f02564de5
	.xword	0xe47d878c38ae8cae
	.xword	0xdd10ba6df8e10247
	.xword	0xd8b548f816e38dcc
	.xword	0xee5eb71e3408755b
	.xword	0x2fe850141a7978ad
	.xword	0xba5dbc2b1722d592
	.xword	0x523034494c2f7292
	.xword	0xf6040cd4e648f0d2
	.xword	0xeb20ec674ec3ae22
	.xword	0xf705d817e1a6dc02
	.xword	0xee09877ce3a9c3dc
	.xword	0x0d74db2aa54dee8a
	.xword	0xcfd47be0835ad7b1
	.xword	0x3aa2fc7af013d528
	.xword	0x332ec7472a8ced90
	.xword	0x42ebdb13179b9749
	.xword	0x24b0a2434bbe6cba
	.xword	0x63d15077861f61e9
	.xword	0x53dbb23edc613943
	.xword	0x4d01d691c4b3f2e2
	.xword	0xfded4471ed74630d
	.xword	0x042a9e38e293544a
	.xword	0xf7fe190923b323aa
	.xword	0xd59e137de99e5329
	.xword	0xe19d4f3f769c18c2
	.xword	0x7bf791bbe1d90dba
	.xword	0xafc37756b64b39e7
	.xword	0xdd28f712d3e20359
	.xword	0xd2e9ac910ed6b271
	.xword	0xd46b406440c8d9e8
	.xword	0x5dad41bb01d345b5
	.xword	0xec1da9e5eead0ee2
	.xword	0x54179c181f642fc5
	.xword	0x8446852f1b32e683
	.xword	0xbaa2df4dc4ba467e
	.xword	0xec47991bf15b6807
	.xword	0x71049fa0d0e93c02
	.xword	0xe740105ad8eb34c6
	.xword	0x8a85d964b8b8d497
	.xword	0xd9a12978687f3b81
	.xword	0xc5a05234bace11d8
	.xword	0xa84c1185f32b5eeb
	.xword	0x9ea78722ff8c1383
	.xword	0xd77eff970148a4f7
	.xword	0xfb8f896913157589
	.xword	0x2cacd79ae3de255d
	.xword	0x838998d93f3eb7bd
	.xword	0x7510e8cf00d81fde
	.xword	0x478479a0eb35cd0c
	.xword	0x6a4544487b6c2a55
	.xword	0xa5eee887b1ae6e0a
	.xword	0x80ebc679f7896710
	.xword	0x3f6d67ff963a82ce
	.xword	0x57a162c150090bc7
	.xword	0xa981f5c96ca64940
	.xword	0x10ef32b4a728f852
	.xword	0xf45dcdb98c9b67cb
	.xword	0x123ceb172f89d404
	.xword	0x73a69d3c59702a01
	.xword	0x5e191d0b727ffe84
	.xword	0x71a9b0cfc062d22a
	.xword	0xbecb0c4359aa8498
	.xword	0x01a9e786bda2497c
	.xword	0xc137fccc61552efc
	.xword	0x23179aa4e71cfab0
	.xword	0xe6c90c9c73c47d01
	.xword	0x15daab1c9858c03c
	.xword	0x374a96175a0f1dda
	.xword	0x45b66466e5743f98
	.xword	0xd9104a640ffd6fe5
	.xword	0xa6758a13005b1af2
	.xword	0x29e4c4f645d1e5c3
	.xword	0x35ce929124801549
	.xword	0x1326e747971f8595
	.xword	0xa2427e586686c38d
	.xword	0xd2ab1409823e4e07
	.xword	0x4ecb7ca41ef68b67
	.xword	0x07797c12e7463543
	.xword	0x12201aeca229fe82
	.xword	0x49789249dabfeed1
	.xword	0x414b6db25c183640
	.xword	0x81d866e2e348d240
	.xword	0xc7a7e783c933736c
	.xword	0xf7985b45b688f468
	.xword	0xb894a6301458b4c1
	.xword	0xf2c19d716061cd05
	.xword	0x995ab1f7f866af2c
	.xword	0x60b4a76541e89dd7
	.xword	0xa8e4f8a7b3d211b6
	.xword	0x3baed09832feab3d
	.xword	0x3c7e06ffdf2af33c
	.xword	0xd6eaf1237abc24d4
	.xword	0xf36d3e0f3467ceb4
	.xword	0xb6490f4fdc365728
	.xword	0x6fe4fe3aae36f502
	.xword	0x5803a102f5763080
	.xword	0x12289e06b4be75a9
	.xword	0xcdfaf9f45e64f97d
	.xword	0x2d64c30ca44776a0
	.xword	0xf436563aa0fd05d1
	.xword	0xf5edcf1dc6fe735b
	.xword	0x36a2b00f43239701
	.xword	0x8e2abfe20751f458
	.xword	0x030a6332732aef7a
	.xword	0x407ded4f0325a21f
	.xword	0xaf84c5fe4a42e00e
	.xword	0x009cdbc78c15d944
	.xword	0x69b31cad15b1e439
	.xword	0x9b8587a75126420f
	.xword	0x8816a8e8e7584674
	.xword	0x5f89bcd5070c8b29
	.xword	0x7b2e6b420f90d778
	.xword	0x42a42ffb14de51ba
	.xword	0xe40de39af830decf
	.xword	0xfd771bd582f46e4b
	.xword	0x3c626c31a4e660f5
	.xword	0x524336543866dc08
	.xword	0xde401c9ce9b0e330
	.xword	0xa7f674b94d3b7548
	.xword	0x3e77e9471f5dfea2
	.xword	0x976f85fbca0b0468
	.xword	0x06e04c0b78793f1c
	.xword	0x3bb868e1d91ca8ba
	.xword	0xaf68be0a2a0f3b15
	.xword	0xcf4a4f0c5aa29291
	.xword	0x1488b980b2bb05b8
	.xword	0x8b39a2d92e9e8c9a
	.xword	0x5b5abc6350e41c54
	.xword	0x6338c5d7e509689f
	.xword	0x64f016a5ff136fed
	.xword	0x73c0170a7dba7683
	.xword	0x424ae7397b4849d0
	.xword	0x1332427c817baca1
	.xword	0xfc40fd3537e04061
	.xword	0x32ec7708ed57eafd
	.xword	0x396a667032ead0b1
	.xword	0x270b4c6f8ead1f51
	.xword	0xce9ea8180be362f8
	.xword	0x245cf69522928473
	.xword	0x8e16a3ef0e1e26f4
	.xword	0xe724b2abeb06c3c2
	.xword	0x5d892209cdb0cb88
	.xword	0xdc5204c5c6eb4b8c
	.xword	0x6edbfc7f82044fb2
	.xword	0x4a6246a476ff65c0
	.xword	0x3c70237761279d91
	.xword	0xe4621c311ea47dd7
	.xword	0x64c90d66a22cced3
	.xword	0x2194763e116aa530
	.xword	0xc75ab5be473b983e
	.xword	0x264b5de8c115f2b1
	.xword	0xcf6f1416b62f2e92



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
	.xword	0x1d5812df5dd4a198
	.xword	0x5d6639428c1a68cd
	.xword	0xc63eaae996a1967d
	.xword	0xb79e12aa30a2851a
	.xword	0x7a526b3876936881
	.xword	0x6b29010d8406abb4
	.xword	0xf44943f0e3b3af40
	.xword	0xb20f21f06996550a
	.xword	0x9c60e12d84fffa99
	.xword	0x203ba414612e547a
	.xword	0xfe6cbd26b063bf0c
	.xword	0x03b1d435a1f87386
	.xword	0xa1ac49eb3bb77440
	.xword	0x139e32b40519709d
	.xword	0x5541ecfce811f4f2
	.xword	0x917f1059faaa3fb1
	.xword	0xe3a469eee95886c7
	.xword	0x43fa4f0bcf3b6cf8
	.xword	0x18cab9bd025ed633
	.xword	0x52004afdd80dbd0e
	.xword	0x79c591faf0b20430
	.xword	0xf36e0737ed9745d3
	.xword	0xa49b3f5e48fc0bb1
	.xword	0x462321d5ec27d07b
	.xword	0x916db3873ece5fd0
	.xword	0xa641b25a6a5b7c27
	.xword	0xe53c81b1891a79d1
	.xword	0xda8e2dd9f37a60e0
	.xword	0xe208f2bff1e3164e
	.xword	0x2534de4ae21e9d3a
	.xword	0x47a6dda2212669ae
	.xword	0x6369a8f6fc0adb6a
	.xword	0x75da2fd228f63d09
	.xword	0xb1aba3d36751a8b9
	.xword	0xb19276963be74796
	.xword	0x83a4525092ab488f
	.xword	0x1f6d64e696828048
	.xword	0x5e5c8d1cf2c8a705
	.xword	0xf0daaf349240b3df
	.xword	0x5d00d8d9f91b4d18
	.xword	0xb04253e414131613
	.xword	0x5663e24636dc66e8
	.xword	0x7e07f401bfe2e784
	.xword	0x1e919eca82c491fb
	.xword	0xe5641a70e4b697ae
	.xword	0x8aededec7cd7bb79
	.xword	0x215f2cea2edf9476
	.xword	0xe3e8844f91182188
	.xword	0x1407fde2d09fb3d5
	.xword	0xe2a6e6576f33d909
	.xword	0x6ab9eff82623d079
	.xword	0x9856df9e37859b9a
	.xword	0x81250946ea37f0e2
	.xword	0xd93f27d3394eaf73
	.xword	0xf9db3e4c9bcf9681
	.xword	0x203d9834bcbb58bb
	.xword	0x2e24e7b44d77924b
	.xword	0x9ab152fc0ead7348
	.xword	0x59e9f14b0a72ad1d
	.xword	0x1622f08097c9adb6
	.xword	0xecf1f6596d294f79
	.xword	0x34df8843f99451c5
	.xword	0x125fcef92954568e
	.xword	0x3e62641c70317f6d
	.xword	0xf879c0283607551e
	.xword	0x3f4023028bfd407b
	.xword	0x1c854f5bc2e9cf2b
	.xword	0xe965fb4e806175d8
	.xword	0x101b11d813104118
	.xword	0xa8937c2e612535b2
	.xword	0x4399fdd75154ec18
	.xword	0x03f2ef6b0148d4c6
	.xword	0x66c832a16367622e
	.xword	0x8b045a0c0a8ed540
	.xword	0xb71bc7b126000779
	.xword	0x09dfb9fcfb8e7ab9
	.xword	0x3a92f512112f92cc
	.xword	0x3d3e4035a98a0769
	.xword	0xefae6af508d037a5
	.xword	0x1525896fd00d5de4
	.xword	0x1eda89810dc69801
	.xword	0xa17623c0a57b1d94
	.xword	0x2fc50ae0e5034040
	.xword	0xf99f7d34522b62fc
	.xword	0x2349816f1d1df90e
	.xword	0x33d87e73dd94b305
	.xword	0x1d83a0caea1a9fa3
	.xword	0x5150add8a5c599e9
	.xword	0x6def10d8115a6391
	.xword	0x660e56414206595a
	.xword	0x2ddc17b376b85d64
	.xword	0xf5c12fb44e39c2b4
	.xword	0x58218b6b791da60d
	.xword	0xd4d880a75568ba8c
	.xword	0x1a1bd83ff6f18b22
	.xword	0x3944bc30389b3e62
	.xword	0xd88044b1a13f1ceb
	.xword	0xe88e6e9f36bb9e24
	.xword	0x163c3d7759c611e0
	.xword	0xf4dcb80bdec6e74e
	.xword	0xee1d2afe7b8e6c0f
	.xword	0xf96ddf7a1fc9962b
	.xword	0xa57826f01aaab386
	.xword	0xc749c30b7ab6138d
	.xword	0x615a3d59c0524c9b
	.xword	0x92cc6a44760422ec
	.xword	0x77519befd393ded8
	.xword	0x903c59fde24f5021
	.xword	0xd95a16723b95e9ca
	.xword	0x244ad6d44dd4f51d
	.xword	0xe5a4334b00c5f045
	.xword	0x6364c9392875df36
	.xword	0x93d16fb75b9495fc
	.xword	0x785393f24707c267
	.xword	0xdd27163ad7d6ef1c
	.xword	0x72417d020d72f4cf
	.xword	0xc75a40c9c5d6db5d
	.xword	0x86a59c30473f5ffb
	.xword	0xaa7020985ec524ef
	.xword	0x9dbedf1c79743448
	.xword	0xfea163dc04c27882
	.xword	0x462e818a95ff8f9f
	.xword	0x774b758c5cc823df
	.xword	0xa6aa7abbd6d59539
	.xword	0x6eaf87d4678fa17a
	.xword	0xfde2d174fdbf2557
	.xword	0x9e4acc8a46ca5970
	.xword	0x280e58f4f0c2f6a2
	.xword	0x045dbe5e741d8dc5
	.xword	0x93e27ddcc17c142d
	.xword	0xf4e38b6e9031e06f
	.xword	0xf82bdd45c7c43f1f
	.xword	0xd0d3d0c666340fa4
	.xword	0x88c28f387154c47f
	.xword	0xd055acf8af3ca08f
	.xword	0x6d9a016da96f69c0
	.xword	0x3e1ab3afd75e752b
	.xword	0xeba1d722cef893e7
	.xword	0xaac2d7d2a8a68c4c
	.xword	0xa4adc64f9ec5878d
	.xword	0x32aa8aed85144f25
	.xword	0x3f639fa68e4e64eb
	.xword	0xbce34d59a6d97a97
	.xword	0xf898691a08bea1b3
	.xword	0x0aed0e4d6534782b
	.xword	0x80fb9fe459cb8d33
	.xword	0xf9cbe2ef9636acc3
	.xword	0xe6a1e0408fb40e52
	.xword	0xce10c3897c5fccb4
	.xword	0x1d7943ffc784be0b
	.xword	0xd0251423ef03678d
	.xword	0xf1053062943f2b2e
	.xword	0x8a5938ee75865e32
	.xword	0x656a06c3a6601659
	.xword	0x97093e5f1f3e2ab7
	.xword	0x658f8d68e7ddb8cb
	.xword	0xaf7a8a40f9e9ee76
	.xword	0x22e2d782eb9d22c4
	.xword	0xe5b05ef4552a2b7a
	.xword	0x561f206717b65112
	.xword	0xa5ad120d0708cb71
	.xword	0x33c57c1ab6c55fd2
	.xword	0x12a0f39633081bcd
	.xword	0xb4729726317fdf3c
	.xword	0xb66f846796650b2b
	.xword	0xdb64aa11e1f7de77
	.xword	0x7d6ff4f2e16d7c87
	.xword	0x10d315dd84ac3ea7
	.xword	0x024938bea9b59c16
	.xword	0x656e6f577f13a2cc
	.xword	0x7ee1a2c7c165f825
	.xword	0x9c86e90dff558447
	.xword	0xa7d86e432e52e15d
	.xword	0x664e830f8bda5515
	.xword	0x337d02dbb501a64b
	.xword	0x46d1fdc917e1b30b
	.xword	0xd36cd34f44d0f912
	.xword	0xdaac8596acc893d2
	.xword	0xb60968290e729bd2
	.xword	0xf9dc57825c99161c
	.xword	0x20126d98d85f005a
	.xword	0x16847510a27b1ee9
	.xword	0x1dd22eef14311984
	.xword	0x8646a0758f205047
	.xword	0x314e30b37346e480
	.xword	0xf7f0c04fa6ecf9ed
	.xword	0xb5a4581c2bffe5ef
	.xword	0x1f3d6e3baf582965
	.xword	0x5d32407d604074e0
	.xword	0x9c8e253bd65d5413
	.xword	0x8867be1d5037140b
	.xword	0xb7a637d1f069a2e1
	.xword	0xe871857054b6bc0d
	.xword	0x1349ca0460a6f120
	.xword	0xdb5a29c5504ce70b
	.xword	0x9e3ff53bb85083c8
	.xword	0xeac80fbce1c41805
	.xword	0x5ae3d80dc89e5915
	.xword	0x7aa661c75edbe9ab
	.xword	0x26e427d481a28fb2
	.xword	0x95e1608985a4b6c8
	.xword	0xa3abf4a2a7732ae2
	.xword	0x40fb3846e7d234ae
	.xword	0xfc410275d3d0ca49
	.xword	0x40f1d581f80d5236
	.xword	0x5e809e019b55fef3
	.xword	0xa1f41677d94cc513
	.xword	0x51751d6275ce40b8
	.xword	0x71eba9ca4cacab47
	.xword	0xb80c16915df15402
	.xword	0x7870cc2f2aba95b8
	.xword	0xc22de968bf26ed7c
	.xword	0x1d01cceb3805a337
	.xword	0xa91500af09760df4
	.xword	0xa644ec8183ca7b97
	.xword	0x739f35fd8fbe4352
	.xword	0x65ed737f8c8e45ca
	.xword	0x94517cb2ccbeaeae
	.xword	0xe2c1658c73619c60
	.xword	0x0cd69955a3e716a5
	.xword	0xe89bd138bd592b4c
	.xword	0x3337769df90929d0
	.xword	0x00ff27039aa90550
	.xword	0xd4ab06242e2b1760
	.xword	0x1a0bde0647455ace
	.xword	0x13b0bc3c37588002
	.xword	0x202767625bb1592d
	.xword	0xa862a2c662f2d220
	.xword	0xbd7b2e478d597673
	.xword	0x9da0cb0e8b455fa7
	.xword	0x7be56cd61dbc9910
	.xword	0x09a261687c9d9d43
	.xword	0x7539c6ca1ffa57d8
	.xword	0x6dac7d4ebc5b99a8
	.xword	0x71d7ec43ec56229a
	.xword	0x04a273c234389b85
	.xword	0x5b3f50259d31a861
	.xword	0x106af814a1fc288b
	.xword	0xcd4298e2da00852f
	.xword	0xd3e7f7487a8e16ba
	.xword	0x09e0dcb4f7d55282
	.xword	0xff09415bcf3ac4b8
	.xword	0x3b1666cf6aa72c3a
	.xword	0x1e26eb14123a300a
	.xword	0xf37a8e816bf3ebae
	.xword	0x7679991e4ba5892c
	.xword	0x042becb937ecaf35
	.xword	0x06ebf97d9b160828
	.xword	0xd47f2deb3e16109c
	.xword	0xfd86fc78ac00043f
	.xword	0xb9bf9baa476343b4
	.xword	0x45def33c99a2706c
	.xword	0x2eb24e9dac370d07
	.xword	0xcabb0fd733fbacdb
	.xword	0x380d7c34253c849b
	.xword	0x406aef44afd83ba0



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
	.xword	0xa8f9798b5ecac7bc
	.xword	0x5cda489987b35760
	.xword	0x90371d88384de58b
	.xword	0x8fa30ea661fa1064
	.xword	0x5aaed1c1c93d1dab
	.xword	0x706ef4e3fd1beca4
	.xword	0xaf990d8866cb9b59
	.xword	0x8bdc0f6964152a3e
	.xword	0x3cac8b80cc977af4
	.xword	0x503063c82465907b
	.xword	0xa42cc53dade8f132
	.xword	0x82ced422b0f6a1ab
	.xword	0xa82b2f23eea3a5c6
	.xword	0xa447f768cea659c7
	.xword	0x05431472ef7f52e3
	.xword	0xea78e87752725496
	.xword	0xd14e46ecbf6f97e5
	.xword	0xeee01bad56cb2f36
	.xword	0x3416021fd9a7dcba
	.xword	0x8366f79abe684140
	.xword	0xed883ff07bc88ea2
	.xword	0x05329c81b4b38858
	.xword	0x68d4d7a0814ece99
	.xword	0x393ce6be5bda3a77
	.xword	0xdf341659e8dcdb89
	.xword	0xa33ef7dcf3352580
	.xword	0x45adb8c363e65e00
	.xword	0xa6347c73ae31f239
	.xword	0xf99451c9ea25bf85
	.xword	0xa924754f00dbe896
	.xword	0xf0a0984908a50d5e
	.xword	0x8e881654990506b5
	.xword	0x49c4212252b728ea
	.xword	0x01bb8312e878f7da
	.xword	0x87781c701f4dda14
	.xword	0xd7d7bcb8955cf0f6
	.xword	0xe06f6977c6004404
	.xword	0x80334bfcb4fc23bf
	.xword	0xecfc69919c8a203f
	.xword	0xe7665b2edb6e9e58
	.xword	0x79ee5701a1d78adc
	.xword	0x82d61e62a5386911
	.xword	0x786e93de7b11c2d4
	.xword	0x5b5697909bf1a741
	.xword	0xca00851bf7af59f0
	.xword	0xe5e8cd912bf69485
	.xword	0xa248f0b182d28746
	.xword	0xa21e64d49aaa0a74
	.xword	0x7cf8cc292dca55bb
	.xword	0xa0cb4774ebfab6c8
	.xword	0x24a80a13a11ed9a8
	.xword	0x91e806eac6efe6da
	.xword	0xd6e713680ee26e39
	.xword	0x9db7321439377642
	.xword	0xc567c56a5f1b53f4
	.xword	0xc608a94b17c33079
	.xword	0xce155c7354d1bcfb
	.xword	0x702118f88d926697
	.xword	0x16704037772ba450
	.xword	0x3adc1da8e0f8780d
	.xword	0x1bd1f48baa26baca
	.xword	0x58d5a7260ca687e4
	.xword	0xab11d8689048ae11
	.xword	0x61d40faef5e7b6d3
	.xword	0xb13629ab5db74e03
	.xword	0xa995cdbb550de7ae
	.xword	0x48ccd8f0a391c8ce
	.xword	0x30f5c7c4b29aa385
	.xword	0x50afee86236fcb4f
	.xword	0x6a63157fca530cbc
	.xword	0xa94de3659da31195
	.xword	0xc9673c3006b19a78
	.xword	0x8fb45fece0de726b
	.xword	0xa4e9a02000df0772
	.xword	0x7ad7ebc9eb3cebdf
	.xword	0x56550e70d6866bc6
	.xword	0xc9eee8783dc3f964
	.xword	0xb1af8e8e887b9141
	.xword	0x57db8730f54ff3f3
	.xword	0x45176cbd412cd59e
	.xword	0x733bd01a2eb13d62
	.xword	0x8fc5ce35935585d3
	.xword	0xd850d1a2412def7e
	.xword	0x817c057384dd2899
	.xword	0xbda0cc983676195d
	.xword	0x9e155d73a2d4f494
	.xword	0x8d5fe711f264d43e
	.xword	0x19c2167fcb013dff
	.xword	0x5b4bf3b0a8e2e0e0
	.xword	0x0336e8b9cbb97b55
	.xword	0x69d0aa177d45a9cb
	.xword	0x47d6cd19467cbd20
	.xword	0x32aaa1d6219c550f
	.xword	0x4bc8aaad7932de9d
	.xword	0xed9c8ef90b36ef74
	.xword	0xe7d05d698bc55d52
	.xword	0xdee34bdfcdcefb31
	.xword	0x1f9eba7e1df5c229
	.xword	0xb953e482a2a67f6b
	.xword	0x4b7516bb3063947a
	.xword	0xe651c971c5c39da6
	.xword	0x32c4eb5d59d0511b
	.xword	0x1bc64d7c9b47d4ce
	.xword	0xf38e6438e05e2d5f
	.xword	0xef752e41ecc72b71
	.xword	0xeb391707c9609b24
	.xword	0x794a267a8f717f38
	.xword	0xfa0a5ed716cce729
	.xword	0x3f3c4155240d4765
	.xword	0x33ac2820ce2883fd
	.xword	0x96b7c38716878c50
	.xword	0xa5104b02db9b93c8
	.xword	0xeb175b34d7190ea6
	.xword	0x2bd2041407477e05
	.xword	0xeda0728d68df5e63
	.xword	0x963b5b2095521460
	.xword	0x25f79acea8d1116a
	.xword	0xe8b9d077676f0e23
	.xword	0x4d10bfff90657e83
	.xword	0x9d1895d1d24f9772
	.xword	0x0f4511caf27a304c
	.xword	0xe6ddabc2207cbf66
	.xword	0x6e6a47302602e4fb
	.xword	0xa7a5a03b797aa926
	.xword	0x37f000f275eaf376
	.xword	0x732859481525b45a
	.xword	0xba1b30740a37790d
	.xword	0x184fe4e014446361
	.xword	0xe9e384fa19f33836
	.xword	0x31003a78ce6ed9d6
	.xword	0xe1da0e4e707fc0cb
	.xword	0x973e52ed1a3540b1
	.xword	0x804d9af58b535954
	.xword	0x8736455a065d7519
	.xword	0x173cf28f7ffd7069
	.xword	0xf48dfc29b61a9b4c
	.xword	0xd1f886d19601f473
	.xword	0x68261175b03c03e2
	.xword	0x5d320943c63d73a5
	.xword	0x025d722438b205cb
	.xword	0x8143116b52e2e284
	.xword	0x42c4cac59e88937a
	.xword	0x0f5958daebdaa037
	.xword	0xa21cee6bbd4c5700
	.xword	0xfc61ffcc3f047695
	.xword	0xb7e25cb02a50fe7d
	.xword	0x587c613dff8c1607
	.xword	0x7274a31ec8882f9d
	.xword	0x09ea48731f4f266f
	.xword	0x151069e70f0991d0
	.xword	0x5be1393aa6200aca
	.xword	0x6b5ee4e97f2c5d14
	.xword	0x50a9e5a06e4e773e
	.xword	0x7e6c2642af696ac7
	.xword	0x2514ae861f61017a
	.xword	0x6731932e50446da8
	.xword	0xc7a85add32f8f0bc
	.xword	0x29f259ee5eb1376c
	.xword	0xa929ba89728dfad8
	.xword	0x494f93731e978326
	.xword	0x7c50c066e1f3db70
	.xword	0xc17413a9c93c7b1d
	.xword	0x9372ffeb4e94cb65
	.xword	0x35843a80268b350b
	.xword	0x6a6ed6c426e0c48c
	.xword	0xc0bc1fd90af1791e
	.xword	0x2d648d23f0f8b25c
	.xword	0x125df991c2b42e3a
	.xword	0xf7ac802e3cada377
	.xword	0x3132c35a1713b7b1
	.xword	0xb8b372e4241098ae
	.xword	0xf54d661959588ea7
	.xword	0xa1cff47a3fa3f4c0
	.xword	0x77db6e91b3070326
	.xword	0x385515db0cc01851
	.xword	0x6f98f58a5dda530e
	.xword	0x77e56056336f5b1a
	.xword	0xe3b3eed324f0e9ad
	.xword	0x90804c07f9797a3d
	.xword	0x10092a3e4b909a0b
	.xword	0x1d2c361a1fd15054
	.xword	0x018187633bc016f0
	.xword	0xa1051a38033fe9ca
	.xword	0xc488302ba13d09c8
	.xword	0xb67312583a51be14
	.xword	0x2345d3503bd9963f
	.xword	0xb2edb693bd6d639b
	.xword	0xca8db0cc3914853d
	.xword	0x3f9f4fb7953d7881
	.xword	0xbe3bde389f9923b4
	.xword	0x0f9ceae9a3e96a90
	.xword	0x64f23ba2fdfcb04a
	.xword	0xe1ffb038c225a54a
	.xword	0xbbb35d08675a7c3a
	.xword	0x76c85e850543f1df
	.xword	0xf10be576d3a20852
	.xword	0x525336a2570ecd03
	.xword	0x654128b2a1105ffa
	.xword	0xd24676516ac2a222
	.xword	0xccb70c73562362b9
	.xword	0x25a2070b9b56083b
	.xword	0x2570d35f5cc74118
	.xword	0x3289b80b48a8ce1a
	.xword	0xe21ddb5868274dc7
	.xword	0xce395a9c5d04f274
	.xword	0xcd8cc1c3b6b84b8f
	.xword	0x5d22f35002b6db20
	.xword	0x8a7525167b6767fd
	.xword	0x480909ad1f12b796
	.xword	0x5552a0df8977cc6a
	.xword	0xa38d4ef9baee90e1
	.xword	0x86f4c6f80d67f70d
	.xword	0x8e4cb15635064928
	.xword	0x79c08afddb1b6fe4
	.xword	0x40ac8b32b8a16299
	.xword	0x12a10f6420abc6e8
	.xword	0xe3387fcd607e5219
	.xword	0xc767c6cf946e9e91
	.xword	0x26893ae9a13bab1d
	.xword	0xd7a42eae785c2e2d
	.xword	0x886246ae98b4ed9c
	.xword	0xec15f26f144fb62e
	.xword	0x37e419eb16776b6f
	.xword	0x159885ee0926af1d
	.xword	0x34d885091d462b32
	.xword	0x1c520d075659a218
	.xword	0xe1ceae7481d68a8a
	.xword	0xc4a04ea572bc623c
	.xword	0x209e0a94a9046415
	.xword	0x5ca9d20081aa5b91
	.xword	0x0ff1fcf5d91f2307
	.xword	0x66637ed07d7e3ac8
	.xword	0x86e9d7f5ef354b65
	.xword	0xce689365daf03046
	.xword	0xaa53963ffe7276f6
	.xword	0xd114f53614631714
	.xword	0xe8a9afdecd844013
	.xword	0x125bcf7fb781a86f
	.xword	0xc5180c63a88b6670
	.xword	0xe9555a7370474018
	.xword	0x109e7b73a567560a
	.xword	0x0434f2287d454c2d
	.xword	0xc21e9bb29cf0266a
	.xword	0x9bacd22ffc15b814
	.xword	0x6aa2af23335032aa
	.xword	0x2d379079986c4c57
	.xword	0xc64fc998abbdd6b5
	.xword	0x82fb5e06aed6813c
	.xword	0xfdde3b6508aaac1f
	.xword	0x2ff11899d465053c
	.xword	0x15328ba8324572c3
	.xword	0xa5c392970b3902a4
	.xword	0xf0b50e960fa4d366
	.xword	0x6453e5571a926a2c
	.xword	0xfc4e9a1abfbdc9b2
	.xword	0x8f5be775c982a84a



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
	.xword	0x82fe86d8fa6e1a6c
	.xword	0x9e8057f0e3cb33c8
	.xword	0xbd8d470f96d766f0
	.xword	0xae1d56b927e8eb89
	.xword	0xa902e38cdb5bd0a9
	.xword	0x03d6e7ae6cca777a
	.xword	0x1980a092d76a0742
	.xword	0x9eef97c3023e788e
	.xword	0x091b3523894a8ef7
	.xword	0xf2d41931161c9a7c
	.xword	0x2b3f24b9e0eb064f
	.xword	0xa3914a06486153e2
	.xword	0x512fb68d2be4b991
	.xword	0xa8f39e5aa917c51f
	.xword	0x0d6b20191ef48ea8
	.xword	0x9009356f21dd0b4b
	.xword	0x366e56408e8ded84
	.xword	0x8e6dc21c3923c6b6
	.xword	0xb48ce1f1fcad2367
	.xword	0xef5db83500b85e15
	.xword	0xf7e4d6c0d3ad8da4
	.xword	0xb555c89aafc968a8
	.xword	0xee6ca2414f495ec1
	.xword	0x5e4b4b055ef6ad09
	.xword	0x486ecbd94d13de87
	.xword	0x41a996a77ca4bf28
	.xword	0xc8474abf79e37797
	.xword	0xefa37dae8633b048
	.xword	0xae10a767719dc971
	.xword	0xbe823b7bbcb678a0
	.xword	0xcec4ed9acb39fab2
	.xword	0xf38f1beb6cfaaa45
	.xword	0xc4b1da6c4b89334f
	.xword	0xaa3a91985468b9d0
	.xword	0x92f7b337333e5fd8
	.xword	0x6ed21608e21f281e
	.xword	0x01403de932359c34
	.xword	0xa0120407555f8337
	.xword	0xa3b15614a6d7013d
	.xword	0x103223f4b1ad8ea5
	.xword	0x074caabc8231cd79
	.xword	0xe9e70fe4532d20e8
	.xword	0xd72c133e452468b3
	.xword	0xa2219f0ce8d1935a
	.xword	0x0928ac1cba1041f2
	.xword	0xfdced42c7baa40d8
	.xword	0x7f96f7d0e4f6b175
	.xword	0x679fd8af1898dbff
	.xword	0xfe560d6502a33972
	.xword	0x354ce269bd9ed1b9
	.xword	0xe6f9eedc477986d9
	.xword	0x427536cffc94cfce
	.xword	0x1129d703d27af1b5
	.xword	0xc411be591c69fe32
	.xword	0xc5808eaffd86f98a
	.xword	0x6a1723933d82fe7e
	.xword	0xc9cbbe6d9c2900f8
	.xword	0x5622310e8acf65f1
	.xword	0x79f43b31fb300b64
	.xword	0x2ede9ad4c3598354
	.xword	0xb3bd38d4dc53ff70
	.xword	0x4199b14db77692d3
	.xword	0x15cecf42cd788f52
	.xword	0x04c28f9cbd164b13
	.xword	0x6adb68304e683283
	.xword	0x796ae1281a05d985
	.xword	0xb55702eae8c2e460
	.xword	0xe9ea4f467f4f682d
	.xword	0x929b31d74e4949a0
	.xword	0x7b31f9cf35a28231
	.xword	0xb00ca73dd2e4c8d6
	.xword	0x20dad1af8152ed10
	.xword	0xce301c5efaedede3
	.xword	0x67cc3259adfcda7b
	.xword	0x0c3a6061ca4c19d0
	.xword	0xed27061cb30106b5
	.xword	0x07f2de483598e80e
	.xword	0xe1e8cc2948ca28f2
	.xword	0x99f07ec6f4396677
	.xword	0x5c3ce830665610c8
	.xword	0xd78153d707b767ba
	.xword	0xcf8cf3d91ce39d4f
	.xword	0x731a2174c4d306e0
	.xword	0xd513ddc87f52d57f
	.xword	0x147c4267fe80f4bd
	.xword	0xfebdcac97e35ed4e
	.xword	0x42aec0412de71db9
	.xword	0xae6cd8b12ddfbff6
	.xword	0xe143342c8393f7ce
	.xword	0x72cb89ba0c908500
	.xword	0x55009a17d03f182a
	.xword	0xe3b42e341386c8b0
	.xword	0x34aa69389ea10ac2
	.xword	0x340d0daef0caf0df
	.xword	0xc658f45b4d9d55b9
	.xword	0x6e12217cf095bcd2
	.xword	0x412e72d71910fa3d
	.xword	0x74dfd81e09c1c4fe
	.xword	0x19c5d566334f782f
	.xword	0x7835217edf7975ff
	.xword	0x6d8c69d173d461cf
	.xword	0x7adfd18227b4f405
	.xword	0xc67ef7bc9c44c1c2
	.xword	0x83c40beb4641c3d4
	.xword	0x14db0415b478c977
	.xword	0xe65afa101f893d78
	.xword	0x4546a2c8fd8c741a
	.xword	0x4f1ce15c9ca74812
	.xword	0xeeb8363374730510
	.xword	0xea784c9853c9068d
	.xword	0x9239de698c28395a
	.xword	0xa8913bffb4dc0a30
	.xword	0xddaa12a8cd7780e4
	.xword	0xb789fa9098756524
	.xword	0x171f4f10cdd4de49
	.xword	0x8c9c9331b91cd4ec
	.xword	0x198e4c7001e613a8
	.xword	0xdd401b5cd4866b23
	.xword	0xff1c68e7f09dce4b
	.xword	0x7e677cb77756c460
	.xword	0x208b907a62b684e6
	.xword	0x46c92645c5ba1628
	.xword	0x793940cdb8752bd5
	.xword	0x014edd36787c446f
	.xword	0x35ebc25bee883b1b
	.xword	0x4a5a0841b3b9ee93
	.xword	0xfddfe05061d71713
	.xword	0xd699312b92217011
	.xword	0x5d6c447268642953
	.xword	0x48ef568fabf4ac59
	.xword	0xe2bd1b916a4f1cf0
	.xword	0x3d904f4067692f36
	.xword	0x93db9d40ccbbc1ca
	.xword	0xafcd36c7dfe499a3
	.xword	0x07b6d5f55f101760
	.xword	0xd7ad9b35baa8a130
	.xword	0x2b5662a6eb7fd161
	.xword	0x39023966978f5c4e
	.xword	0x5111374c50278a58
	.xword	0x81b88dbc0515f826
	.xword	0xd61a5b4c4cd8c369
	.xword	0xd29e7cc59b16fef9
	.xword	0x2476b428927b3711
	.xword	0xba0dc5301eb3a292
	.xword	0x67149d1f58e4b765
	.xword	0x56cf8834577b3d2f
	.xword	0xd938cc677c7caac0
	.xword	0xa661011dde1406d7
	.xword	0x9169d8647f855602
	.xword	0x4fe0d9c0a3ebf2d5
	.xword	0x5403168538e6259c
	.xword	0x23975bc84ef8767d
	.xword	0x193b14725417ff57
	.xword	0xc2630ee053659255
	.xword	0xba84fc1fb5acd7d2
	.xword	0x993e653ff68a31bf
	.xword	0xcad0556560f3cc03
	.xword	0xd3466e386894cd1b
	.xword	0xc02514fdd7011f60
	.xword	0x4b409be6ecec7e16
	.xword	0xcbf4af9fca80d08c
	.xword	0x551866b44c469287
	.xword	0xab187b972e32140f
	.xword	0x0b279f86eb9ec0dc
	.xword	0xeceb31f9b98ffa2d
	.xword	0x83519f3d11979786
	.xword	0xe21d9967f5bc923c
	.xword	0xf9a82089b49eba14
	.xword	0xfb5ba1a6db4f88e2
	.xword	0x987d1b5098801b68
	.xword	0x287deeefcfc8b0d7
	.xword	0x7d822edcaca7ea96
	.xword	0x0ab4deaca32e1c7e
	.xword	0xad6b0e2524fe1ef9
	.xword	0x88620969fd3e7dcf
	.xword	0xc790f9f954060b7a
	.xword	0xed2deec5069cb7cc
	.xword	0xab5dc949f3013c5b
	.xword	0x3ca31bb9c0d1fe6a
	.xword	0xb72089ba988ea956
	.xword	0x6f1f7170f2690b2b
	.xword	0x12ba0651da830b76
	.xword	0xd8c5922c54a73f39
	.xword	0x4bb587a78b794cfe
	.xword	0x7188de7a91178acf
	.xword	0x2d8fee221881d8f6
	.xword	0x6927f12899a859dc
	.xword	0x08077e690ea994b6
	.xword	0xbbdb5e1ccc4e4713
	.xword	0x90279fd59e8cc2d9
	.xword	0xece2896aeb13a2cd
	.xword	0xb78db557bf68c7a6
	.xword	0x1e29ef4f973df489
	.xword	0x6c0ab31eaaef647e
	.xword	0x089f4b4394b6c447
	.xword	0x1ef6514764fabe1d
	.xword	0x40cd075d9ccf3e98
	.xword	0x792763c592ca3343
	.xword	0x8b27e8768e48d6a8
	.xword	0x24c4ca59ea329373
	.xword	0x2c6fd1a95454baa7
	.xword	0xf1029f859c206afd
	.xword	0x2fbe5c0f7c6116ff
	.xword	0xfc7b857a2166dffc
	.xword	0x0f83d626c25e2c5e
	.xword	0x33f362e22d720e32
	.xword	0x9f3069cf5e14e142
	.xword	0xd00ce20364b816eb
	.xword	0xd065f2f19669eccb
	.xword	0x81014c684c0c6062
	.xword	0x10839803a8617bce
	.xword	0xdbbea4302cbbca55
	.xword	0xfe3f656ed6de24ab
	.xword	0x61fbd6c13d7362ff
	.xword	0xa3d762feafcd03bb
	.xword	0x6a0a9264d79ddab3
	.xword	0xdf2859d118fe832e
	.xword	0x32b03c0f0f94a855
	.xword	0x4dff69aa3bddded5
	.xword	0x251d452bd07d5b49
	.xword	0xd7eae22449bcb805
	.xword	0x8c1be04891b75d4e
	.xword	0x9a496e2f566dfc2c
	.xword	0x5a8f9a7a13886ccc
	.xword	0xac270ab282390036
	.xword	0xafc4cfe13bbd3044
	.xword	0xf33c361f629e298e
	.xword	0x578d718472f10e75
	.xword	0xe82b5bebf4e33029
	.xword	0xde2be4627beb22d5
	.xword	0x9646cdbb2a27384f
	.xword	0x3b4ab778b4749c84
	.xword	0x09cea390af4670c0
	.xword	0xda4c41bf3a8927bf
	.xword	0x96f9a7b998a6a059
	.xword	0x193fc22f2b6eb8de
	.xword	0x5ad0b8031cc5bc60
	.xword	0xa9fe08e21222d1d1
	.xword	0x3916edadfdfe8391
	.xword	0xdd8448ffc0c4feff
	.xword	0x7b5681d4f268582a
	.xword	0x78c580ca5f1ac7a7
	.xword	0x1072431067bb1928
	.xword	0x271b60edbd4123a2
	.xword	0xcceabeaebdec8995
	.xword	0xc523260540c3e5ce
	.xword	0xa7e6d7ac9aba10a5
	.xword	0x6966deacf9e3edb3
	.xword	0xa363a322229503b5
	.xword	0xe07a8544fcfc082b
	.xword	0x1ef5a3433facfd35
	.xword	0xe515e431cb737242
	.xword	0xe60b0769a0114c4d
	.xword	0x24f67e92b2468449
	.xword	0x05193d07c0ca7a4d
	.xword	0xd41c92100a353eff



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
	.xword	0x7e5758849e603f82
	.xword	0x50b48295b5823735
	.xword	0xc92b39608bb617cf
	.xword	0xfec3b36eb2ba76da
	.xword	0x447d067ff142926e
	.xword	0x882a3d29ea58a848
	.xword	0x7266a0f9c5cc57ca
	.xword	0xa4af1d1fe9c00400
	.xword	0xd2e5a72115781e7d
	.xword	0xc65628f7df69cf28
	.xword	0xc14a0f98b87558c2
	.xword	0xadd1fed56e8892a1
	.xword	0x3f58457ba7c7f9fc
	.xword	0x7428f5064b476be8
	.xword	0xc5e3f376739bcc49
	.xword	0x562147310e611ca0
	.xword	0xa637016acba2cd21
	.xword	0xe5bfd30b9f298ae6
	.xword	0x0775823b2a9da789
	.xword	0x94bf1d6cb022c9bc
	.xword	0x5291c19d7e521209
	.xword	0x9424bf02f5dfa867
	.xword	0x3e3577c04dc85204
	.xword	0x6c3987a642c17f2b
	.xword	0xdfd34cfe8c56be56
	.xword	0x49860488abc0a107
	.xword	0x8ba7abb78db57d9a
	.xword	0xe41a6086ef546d2b
	.xword	0x0cba2fb72cbb7531
	.xword	0xb01f6a704e7e3a86
	.xword	0x9bff1a24d5d1c23f
	.xword	0x5ddf261fc85612c5
	.xword	0x4682e7974b8ffc45
	.xword	0xebbac5432d45315a
	.xword	0xddb566da090d62b1
	.xword	0x13957e7cc6f32343
	.xword	0xfc76520d4a667548
	.xword	0x85e5bdafd11d6f19
	.xword	0x191cb6e9b2685ffd
	.xword	0xdf45d993a42988ae
	.xword	0x75ed9a1206580201
	.xword	0x96d7a27f97aabafe
	.xword	0x3b29489de57a1f64
	.xword	0x6205241e8ef33319
	.xword	0x2d2c46e1e6749667
	.xword	0xd8249efdab98fcdc
	.xword	0x88a5299ef2dbb693
	.xword	0x0df759928687255a
	.xword	0xace9bf7be0b6e8a3
	.xword	0xe6dc2e47c5814740
	.xword	0x1ddc0b2afa5e3c1b
	.xword	0xefbc4d40064e36a4
	.xword	0xd65e9363cb1657a9
	.xword	0x3e57607733baf4d7
	.xword	0x3d7adfda9332a14c
	.xword	0xdb04186f38046a5f
	.xword	0x3fd7f6a2a458e65c
	.xword	0x15bac85ea6932452
	.xword	0x1e2f4ef91c644601
	.xword	0x593715ea2de9ec1b
	.xword	0x4e217725e4413d34
	.xword	0xbc1d393342e54314
	.xword	0x4d9da2654b35653e
	.xword	0x8f51e7bb7a6366ee
	.xword	0xe44153ce06c3e204
	.xword	0x85c57dbdd3620819
	.xword	0xde23fa9ef3463295
	.xword	0xdb261c02c2cb20fe
	.xword	0xb3590e2b081e9350
	.xword	0x0d1fe1e525670bc7
	.xword	0xded705c12c1b41f9
	.xword	0x19d1ebd1c847a42c
	.xword	0x6b867d804dc35c45
	.xword	0x02ff0409a471c73c
	.xword	0x31b1e7e0eec6ca84
	.xword	0xdfb17fa403fef88c
	.xword	0x2bff45d60f6d2862
	.xword	0x30f9f6a0c139fd7e
	.xword	0x13ad51f864bb8d39
	.xword	0x4007181540967e59
	.xword	0xd760426c40d27513
	.xword	0x921e4f81f5065916
	.xword	0x597565b2fb4821b7
	.xword	0x35687afe7e63fc3f
	.xword	0x7c262eb62eedef84
	.xword	0x700860dddef2dcec
	.xword	0x8d5676d537bb4e39
	.xword	0x8a40025a8bd1f1a3
	.xword	0x372eb2af3011cf90
	.xword	0x6b8cb949cc4999d5
	.xword	0xa2c774b3e35508cf
	.xword	0xd1767e2ff41f3437
	.xword	0x8e1fea6eaa9d1149
	.xword	0xfb08a0d77c98f4ee
	.xword	0x68dbb3b703a53a67
	.xword	0xa0daad409d487943
	.xword	0x5ffd887295faa972
	.xword	0x2eb411887f6b34a7
	.xword	0x9608b186aa87a478
	.xword	0x1a7f76a3973d6b4f
	.xword	0xc38ca8fa7fb81dfd
	.xword	0x4a719e065d09a04d
	.xword	0x5e4704a0ecd8845c
	.xword	0x16d37120b3bd4a53
	.xword	0x4756a44fa8033647
	.xword	0xd700aa329124a52d
	.xword	0x6db94bb6b8056e44
	.xword	0x4be55101478c0a17
	.xword	0x21de62f9631b520b
	.xword	0xcb649bfd6aa17070
	.xword	0x86a2154f7a936209
	.xword	0xff6156bbdfed9e7d
	.xword	0xa6058e618dcf64e9
	.xword	0x83317606aaa298a5
	.xword	0x4229c8cd0fc8b740
	.xword	0xe07c844d9aec6b98
	.xword	0x48c500d7b82d9e89
	.xword	0x2bff9128542d3378
	.xword	0xc183a9289b1b202b
	.xword	0xddf2c8185457154d
	.xword	0x36eb40cb7a8ca9f5
	.xword	0x86dc6a91eb719d9f
	.xword	0xb1043b2335024115
	.xword	0xf93ba41188ad23c2
	.xword	0x93dcc2ca56aa44e4
	.xword	0x7639f5a9fbede93c
	.xword	0xa56f19b23fbc6e96
	.xword	0xdd8780cce120d7ea
	.xword	0xa65ffd8a3109f700
	.xword	0x2799803a522b6280
	.xword	0xa48f1f98db39dcf3
	.xword	0x53dfe4b9ef4e972a
	.xword	0xde0672bc8611ee2b
	.xword	0xa71dc00023f45daa
	.xword	0x766b94457898364e
	.xword	0x9df4f73a14421b35
	.xword	0xf5c2c5b478cc1b14
	.xword	0x741fdb8747ec9285
	.xword	0x31b7e70ce8b45cbf
	.xword	0xcbab277d9786fce8
	.xword	0x5a756f59d6a76630
	.xword	0x8627a75ae8383552
	.xword	0x4f523fbdd26cab69
	.xword	0x345521ef97cd781c
	.xword	0x7a74ecad04490156
	.xword	0xa1ebde96cd1112dd
	.xword	0x2546125bb72559fe
	.xword	0x5c65186da0a75896
	.xword	0x658a3ba1d77f4ca6
	.xword	0x0104848b07670cde
	.xword	0xa1b71f663e1ed014
	.xword	0xf6173297d942836d
	.xword	0xf833d6ab395c799a
	.xword	0x4eabfc098175e467
	.xword	0x57827dcb4811e3ad
	.xword	0x0180b016c264f734
	.xword	0x4d155c765e9bc1fa
	.xword	0x14b260000166d004
	.xword	0x1f07ee335f53c1e9
	.xword	0x0e72632dd03de365
	.xword	0xdecbfa98e8752436
	.xword	0x403ac15ec51d7b3c
	.xword	0x10d34ad95bff51bf
	.xword	0x17a562ac89e16df9
	.xword	0x480df0f7daa35fb9
	.xword	0xa3463f776eb678dd
	.xword	0x2b5ba7f34efbc042
	.xword	0x5a8b2018b23fdc93
	.xword	0xaac7634ee4892a9b
	.xword	0x9d990e73320338a7
	.xword	0xce365d8cf65be3b0
	.xword	0xda884bde113de3a8
	.xword	0xa14b2c228152d198
	.xword	0x7023a3b3f55ef0db
	.xword	0x312bd2c0ae96c41d
	.xword	0x6df80fdfcf288737
	.xword	0xae6e0a24d16c4687
	.xword	0xd5ed42e01ffac942
	.xword	0x10808d344bd99ad1
	.xword	0x4735800fc6a75513
	.xword	0x860837d4db046b7d
	.xword	0x5cb3fa61af8efe65
	.xword	0xbe5b9ec0a745ac6e
	.xword	0xc23b6fb578d56027
	.xword	0xb4afa09f2efb2d2f
	.xword	0x8195374c79d2bc68
	.xword	0xf0f6f924f0234703
	.xword	0x12a2b87aed4bc33c
	.xword	0xdcf2294953edbc9a
	.xword	0x5ac6a09b4ba5bd6a
	.xword	0x8c42e386fc1611e7
	.xword	0xf63bfa82df106350
	.xword	0x31a36ea5404a0ffa
	.xword	0x138b1213f28c620f
	.xword	0xe61781b048274025
	.xword	0x4d6fc809868e119a
	.xword	0xce1b84bb8dc20ec2
	.xword	0x13e1e73853a2cecb
	.xword	0x888951ede4c3b437
	.xword	0xfc86f5c74d2475b7
	.xword	0x9dbd87bf491e232e
	.xword	0x104ad0a65998de9a
	.xword	0xa91ef13ab1d5aad8
	.xword	0x2489f8f3e9133114
	.xword	0xee0421bc469f297f
	.xword	0x89dc351bb0da2c89
	.xword	0x73be6cbc2245e787
	.xword	0xe0efb69df55b542e
	.xword	0x1b7ed8423f1abdcf
	.xword	0xec18d40f2279978e
	.xword	0x2481643f54e2322d
	.xword	0x239acc5b7758aca4
	.xword	0xbf0f3d8a0befb14c
	.xword	0xb07d68f194773b3e
	.xword	0xa6d1de83b2ef0cd5
	.xword	0x5d782cf7dcaecb2b
	.xword	0x07767cb219136b3d
	.xword	0x12b0c1f900fb1a45
	.xword	0xe94331e181e08077
	.xword	0x23e0efebf0893a56
	.xword	0x91bb591303d94fa2
	.xword	0x150b940c83950a5a
	.xword	0x8a433bcc2bb377ad
	.xword	0x02dbeb7e3964e31c
	.xword	0x86005e9c9a06cf60
	.xword	0x17fcfde74e7eef03
	.xword	0xc0577a62269e4b18
	.xword	0xcd47bebb1669cdd4
	.xword	0x0ae6a56c3b13b275
	.xword	0x85c2b80c33760584
	.xword	0x89e8968b7c6df8a2
	.xword	0xbbb220dae05e1eac
	.xword	0x6e39f12c80c5d022
	.xword	0x0ee97e44cf738ee4
	.xword	0x2da954a01704fc2a
	.xword	0x90450f16026fab59
	.xword	0xd1d1d6d95031f315
	.xword	0x648917c7f1f65f08
	.xword	0xda6942ae3937baa2
	.xword	0xdef5e80c7dbfeef5
	.xword	0x4960ac246d8b4c29
	.xword	0x544a404b44db3f9e
	.xword	0xf60da23ae470458f
	.xword	0xe3ed0c524c59b200
	.xword	0x9fff7b12e1f83d79
	.xword	0xe8adada122e30cf1
	.xword	0xac0261b06e044b48
	.xword	0x8d806c78fca2e5ca
	.xword	0xe90a6abde0ca5cc4
	.xword	0x1248f992a5cc2ded
	.xword	0x9f1159ad10c008f3
	.xword	0xc8960216da8509a5
	.xword	0x1ebd43bccd54d24e
	.xword	0xa3a8dd36058528db
	.xword	0xfad0e9c436603866
	.xword	0xd52ae897ee5063c4



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
	.xword	0xa2d6d0d908882c88
	.xword	0xccaa318bb9aca522
	.xword	0xbf7697cdfededd80
	.xword	0xa501e01f5835faeb
	.xword	0x0e0521937692e6fc
	.xword	0xb5414cfda81e60af
	.xword	0x636e96bedaa43a91
	.xword	0xe6539af3e022e5e1
	.xword	0x9274a66021fd655f
	.xword	0x4f316f60f275b0fd
	.xword	0xef47885fe015da31
	.xword	0x033b2e289a6aa8a7
	.xword	0xa95c8fe7c1c2bb18
	.xword	0xce87cb26f13acf56
	.xword	0xea0fdb380590a342
	.xword	0x41989d97cceaffcd
	.xword	0xfcba92c86abc4000
	.xword	0xd6476c79779d5225
	.xword	0x9e87f4d134aea984
	.xword	0xf81e4cf916212f69
	.xword	0x87a7895487cae246
	.xword	0x7711fb89c65e4756
	.xword	0xa4a6870263eb88f7
	.xword	0x3240faecdefed7a5
	.xword	0x0b7a453e4a18b13c
	.xword	0x4e3697e73931863c
	.xword	0x328471171bec1f2e
	.xword	0x751964582873b180
	.xword	0x50f9277af5acccbf
	.xword	0xf5ef2af477cdde97
	.xword	0xd938a838c6e17f53
	.xword	0x5dbf1a9e6fe3ee32
	.xword	0x840df180a3d209cf
	.xword	0x6671e7408339966a
	.xword	0xbfcc4736839b7570
	.xword	0x1ad459706c889fea
	.xword	0x3d4a24c97939272f
	.xword	0x6c320b23ec8e961e
	.xword	0xe5c253d1e5062920
	.xword	0x9f6f5ee2b91602df
	.xword	0x9358f533a9c41eba
	.xword	0xc34dad4fcd4f1f27
	.xword	0xc12191189c9342fc
	.xword	0x7a39acd944f9eb02
	.xword	0x7f4b6466750a260d
	.xword	0x3d220d06d57cf278
	.xword	0xf48dd29ad9791263
	.xword	0x1c5f8f02e3d872e2
	.xword	0x071a1c2543ec226b
	.xword	0xc29b18741ce231ff
	.xword	0x26de629bd8918d0c
	.xword	0x904526cc4cf969a8
	.xword	0x96c580d98631bac8
	.xword	0x5a3fe71a190f7327
	.xword	0xda6c1a79677948d7
	.xword	0x6baff454141c30df
	.xword	0xfb36af8b6dc730c8
	.xword	0x2eb8fbe85e052900
	.xword	0x54744a734c4bebbc
	.xword	0x43e9479edb280ae1
	.xword	0xc2ba00368eadc918
	.xword	0x4f9648a4ce0ee88d
	.xword	0x118e55d026ec82b9
	.xword	0x9220cceb5496f9d0
	.xword	0xb5f6f6cdb3405fa4
	.xword	0xfadf516d9e2a1a95
	.xword	0x91e8059a207cd736
	.xword	0x63f0e06edab06ac3
	.xword	0xa32c28eea13ab64b
	.xword	0xe59d515ca6b24db8
	.xword	0xc44103c2128df414
	.xword	0x9cf3b48fed3ecd06
	.xword	0xd1345a5f1ee51bd6
	.xword	0x3d4273604b2c49c1
	.xword	0x8b48a2bfb058ed15
	.xword	0x9c62ac4bb7fa6341
	.xword	0x4738180a85dc14df
	.xword	0xd873014e0eadfe04
	.xword	0x767a51e213204de3
	.xword	0x66e733b1cc596cda
	.xword	0xccddc043b81965c0
	.xword	0x40f25d1fb82798c6
	.xword	0x257bf928aaebfd07
	.xword	0x37a769e118458b0d
	.xword	0x08bfae250626bb3a
	.xword	0x0430e2d488ad99e0
	.xword	0xf23a21d71fcb739a
	.xword	0xd9cc6e8d1e1c378f
	.xword	0x833d40d7b61c533d
	.xword	0xd5f50fb877236b97
	.xword	0x8a42fbc9814e6182
	.xword	0xf91f2141851a40d7
	.xword	0x81c093493e0c7560
	.xword	0xc354f67d1fb31bbb
	.xword	0xc5690165f037cc25
	.xword	0xbcee6b283b862549
	.xword	0x8441608897417e91
	.xword	0x956b4a2f72c46879
	.xword	0x301d461c706044b0
	.xword	0x52d73ea4fb89fdae
	.xword	0x6e5f5987c2bede22
	.xword	0x97d4f9aa91ec2143
	.xword	0xf49122328f5ced98
	.xword	0x00b839edc64f88b4
	.xword	0xb7f35aa1b3b58619
	.xword	0x4df14a4bdf830554
	.xword	0x361e867f246bba84
	.xword	0x9e43f803fd82d08a
	.xword	0x7414c03367a0b9e9
	.xword	0x572abb1431a77547
	.xword	0xce9d9b6083991b94
	.xword	0x011390952398a236
	.xword	0x68a5825213f61a3b
	.xword	0x8fe14ee8059e0ed6
	.xword	0x3553e84053f4b8aa
	.xword	0xd425b41163499479
	.xword	0x737b6ff57e53643c
	.xword	0xf4d524630be30386
	.xword	0x0ee352e893913e4e
	.xword	0xec8cbbddac25c45c
	.xword	0xf6bebdbbbf0c61ba
	.xword	0x4f7ce58f8875d5e7
	.xword	0xf61458ab5e02d100
	.xword	0x838f4efaaeed558d
	.xword	0x0f2268843755ae66
	.xword	0x4b13848ca1fa1bae
	.xword	0x4c116bd496aa8727
	.xword	0xcca276f69b7b6e60
	.xword	0x2b1e1029df339170
	.xword	0x21660eb0ce37ef92
	.xword	0xace2269fad3631fb
	.xword	0x6e5569c5d09dd599
	.xword	0x527eec6f89535778
	.xword	0x0d2b847ccddcac9f
	.xword	0x5efa183ff171d158
	.xword	0xcbe4b90a8d599fa3
	.xword	0x86b8add8c29788da
	.xword	0xb209348cff90dd42
	.xword	0x3bfd617bf5d8f569
	.xword	0x95ad4a1ca86c8b86
	.xword	0xc37fffc31c5c938e
	.xword	0x1974aee3684db577
	.xword	0x53ee590024ab894e
	.xword	0x50f461bb7d258b12
	.xword	0x743948e4cd7c6d7b
	.xword	0xb4d52e6ca9315892
	.xword	0xe0a9f523bafb5ef7
	.xword	0x5ba4c64d720ce1c5
	.xword	0xb89d12f52ef508d3
	.xword	0xef2f617ea269562d
	.xword	0x112cba2b6cc0ac4e
	.xword	0x10e23c76cd33c013
	.xword	0x593624659151ff95
	.xword	0x1b6d1b91b1eb5748
	.xword	0xc236975e0124ab83
	.xword	0x455dac1f11a87bf2
	.xword	0xa687212dc89b7127
	.xword	0xc88f96c5f652c690
	.xword	0x7da5dc73717bbf13
	.xword	0xc3431937b4696968
	.xword	0xdd7f448e0d41a29c
	.xword	0x2aaad69c43904dec
	.xword	0x1f0d2001c86d7c62
	.xword	0xa9ec0351057a39a4
	.xword	0xe277a9826de6c24d
	.xword	0x30e8505786cc6349
	.xword	0x484d1fbc3de756fc
	.xword	0x67c2f0356dc0dc72
	.xword	0x90ecc0da70182fd6
	.xword	0x7bc44fa9b6898b8b
	.xword	0x276104d216512c29
	.xword	0xea33aea09d567765
	.xword	0x0ce8a2622588b436
	.xword	0xe146b8efe0cc410e
	.xword	0xfe4788926d7095d2
	.xword	0xf7a88f10cb5f7135
	.xword	0xac4c053a182d0624
	.xword	0x0043c26c6e9ac7f5
	.xword	0x325550251496c984
	.xword	0xf98cfd52f745a415
	.xword	0xc777a924590377ef
	.xword	0x81c6b7a8922f6803
	.xword	0x99d1104e0d9112f4
	.xword	0x91c6cd236df1928f
	.xword	0x975cd7e0d9e869a5
	.xword	0x57feb91e300834b7
	.xword	0x6d87b36e6d116ab7
	.xword	0xd6b749557126b76c
	.xword	0xbe29b1e48f4807e9
	.xword	0x54c2906d47250b15
	.xword	0xe70586a18e7c4220
	.xword	0x12a84fb20ae140cd
	.xword	0xd9a9a5ede18286f9
	.xword	0x15f3e4928504b8fe
	.xword	0x6d6a73b9a2f597c5
	.xword	0x961929ff7d9db2c6
	.xword	0xcc196d0aa931d8fe
	.xword	0x2a045663bc94375e
	.xword	0x9c991107e928827a
	.xword	0x3a6f602f357313de
	.xword	0x58e91a2bc0a02135
	.xword	0x1bbadc84d247f661
	.xword	0x8629b51f5c0edb9f
	.xword	0xad61c548462cb0ff
	.xword	0x7a59fa50b1024c21
	.xword	0xf69d4ad0d048de79
	.xword	0x87fa18c8fe09fbb9
	.xword	0x980fb2a260c76f04
	.xword	0xf46d37ef721023a2
	.xword	0x566e397a8189db22
	.xword	0x42b6b261ce883b06
	.xword	0x8814b487d5784fae
	.xword	0x1bd82fced34c05bf
	.xword	0xcf59ccabc843e822
	.xword	0xce5e8a60b8aac8b2
	.xword	0x372db2786d3fb852
	.xword	0x8e4039b717a9e066
	.xword	0x96feb62c7d227506
	.xword	0x1df1aebfbb4d3cac
	.xword	0x61fea393a2243048
	.xword	0x50dc393881b70cb6
	.xword	0x6cd269e2d242d934
	.xword	0xf05897457280ad09
	.xword	0x5d3c65ed913c3cde
	.xword	0xd3f7abee490afc69
	.xword	0xa30f953c94abf1e1
	.xword	0x0a44af64263b4186
	.xword	0x004547d0828e4478
	.xword	0x843ad7c8908a34ab
	.xword	0x1d5efae2cb357015
	.xword	0xf77da6a5f9256e96
	.xword	0x0cb5720e864793d5
	.xword	0xa02434bdd086728b
	.xword	0x224a75b79ba7115a
	.xword	0xb14a6b398f9b2066
	.xword	0xa50637c7fffe6718
	.xword	0x1eb82bfadfbc7612
	.xword	0xce9857f4defc94b1
	.xword	0xd8815b1b5b0d5fdb
	.xword	0xd59496d67b4a282c
	.xword	0x47c7413decebbdbd
	.xword	0xc18124792600476d
	.xword	0xd3b38824e2f7ebd0
	.xword	0x04ffab975481af31
	.xword	0x328f5d5d13c76a27
	.xword	0xbdfbbdd429db5e1a
	.xword	0x15ed84188ae5c1d9
	.xword	0x181b480e89fa1644
	.xword	0xd06d2d4c58cd622f
	.xword	0xd23bf1957a53ae26
	.xword	0x23cce5a2a3a2a5fb
	.xword	0xd79312b8db7fa402
	.xword	0xb9b954568b3f5acc
	.xword	0x2d0f28fef68082ae
	.xword	0x34fd5bdd35752cf9
	.xword	0x0cbc58ad6a74d9b8



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
	.xword	0x062f92ca247ca5e6
	.xword	0x9c906a291b303525
	.xword	0x2a8b4aa70bb1572b
	.xword	0xa878d40298846e2d
	.xword	0xbef35d4ab8397861
	.xword	0x976f0f5502a18828
	.xword	0xfe49f069f23a2580
	.xword	0xca1abb1822f85381
	.xword	0xed7f98ad40f11999
	.xword	0xc33337e94f420de3
	.xword	0x6918a11b6ebe92c5
	.xword	0xc170da3423b8ade5
	.xword	0x1344685d197626e1
	.xword	0x1bccd926519f9b73
	.xword	0x6343d96f82a159d8
	.xword	0xfe412c71051d0c30
	.xword	0x78b1bd0f769b3acc
	.xword	0x1e7e059b16e184b8
	.xword	0x3add9daec86a1b40
	.xword	0x2b5a86d1aba3a003
	.xword	0xaff1aa1bed60ac4f
	.xword	0xa349f4f4a71f0370
	.xword	0x6ba29ddffcb96e4a
	.xword	0x412e61fc750f5fa6
	.xword	0x4d911ae1ffa30306
	.xword	0x3326a3c0ff716d6a
	.xword	0x67f58234d8ff863b
	.xword	0x0e07ac031bcf54cf
	.xword	0x740042c374a2f7c6
	.xword	0xed6467a03504fc6e
	.xword	0xed621aaf91d848c6
	.xword	0x5997c34d6e158864
	.xword	0x387ee41044421cf7
	.xword	0xf542fdf2b29ef163
	.xword	0x4f6378f2d5ccbb27
	.xword	0x4cb862cd40df9e45
	.xword	0x6956357ff20c2215
	.xword	0x7cb1480166b03e16
	.xword	0x0375a5afedce5078
	.xword	0x5a1f3e9f34c6ac71
	.xword	0x8f32370cbc884507
	.xword	0x750b1394779d45dc
	.xword	0x24ccc8e6532fb6df
	.xword	0xd2ea061a50eaad42
	.xword	0x1edcb36f9eb807db
	.xword	0x906ab10d0787b735
	.xword	0xc39d6d8f09d8ff03
	.xword	0x48b6b8f0f627c387
	.xword	0xf27d0947f2d88bcb
	.xword	0x854909df50ef8462
	.xword	0x03d6275c9b89ce90
	.xword	0x33dbc74e3f0cfd10
	.xword	0x2b1f60fd70e04d2d
	.xword	0x92fccf1e80c4ce63
	.xword	0x18ad78280d91e08a
	.xword	0x1d7c9e65f476784e
	.xword	0x2c99bb2b6a314a56
	.xword	0x78d3ef8e6837f733
	.xword	0xbaa854def8997027
	.xword	0xe9f82c1984e0b105
	.xword	0x28911840ae457d94
	.xword	0x58b38301423d7751
	.xword	0x79e3706be597610c
	.xword	0x51df3f91041a370b
	.xword	0x4f6394ff07d16592
	.xword	0xc74494a2a6c20eba
	.xword	0x9b2a1453177f2f7c
	.xword	0x55da643cebf71b4d
	.xword	0x8587a1ad790c5da3
	.xword	0x8a0149025ce939d4
	.xword	0x224a0c18a0264a44
	.xword	0x7cc32c17cf639eb3
	.xword	0xfcc8ac11ca76dbad
	.xword	0xcc1e24772b8b10b1
	.xword	0x7424d919ed044c36
	.xword	0xe939471992679f84
	.xword	0x3cf39329556eff36
	.xword	0x803bfecfed3bd6c1
	.xword	0xb71ed6e37fa048f6
	.xword	0xe77cad4866adb5ca
	.xword	0xf0630b1a69020ee2
	.xword	0xfef06f12f9f9bf1e
	.xword	0x8ab72c56b024c039
	.xword	0xb98afd040d03b139
	.xword	0x7fc8b99175752f30
	.xword	0xb54272ce0ea60d34
	.xword	0xd13622b5f6882c28
	.xword	0xf18bfe7ec1f1b4ae
	.xword	0x1ff309bd42fe0300
	.xword	0x8b8af94e70d40665
	.xword	0x0a02311448432f78
	.xword	0xd88d3e7a0313d245
	.xword	0xdc65d3dd4d964aec
	.xword	0xe24b7aea0d24fbfe
	.xword	0x9a7a2ae1fb0b085a
	.xword	0x5b5e10d9c3a84d7f
	.xword	0x707d36cf7ff7b8f9
	.xword	0xf5f405e90f7c9f0f
	.xword	0x45a1fa91d394b39f
	.xword	0xfd9ca42a84ed7057
	.xword	0x7f71eada486f565f
	.xword	0x87227403a37de356
	.xword	0x9bfacce958a88ea9
	.xword	0x46997c31daa8b8eb
	.xword	0x89ce174cdd7d4a4d
	.xword	0x229ce4b5cab250a8
	.xword	0x37e8f5bae78c380e
	.xword	0xaecf22ea2e5525f5
	.xword	0x8efef2e8e49522f2
	.xword	0x5b433c3e3f203e68
	.xword	0xa3fe1c221b3476fe
	.xword	0x2faadc07b6ab62e4
	.xword	0xf44881aacae43b1f
	.xword	0xe3b3806a04c84506
	.xword	0xcbfb83b42bad087a
	.xword	0x180a17eb5ff0f926
	.xword	0x169472502f7823ab
	.xword	0xff4afb916e0ed926
	.xword	0xe4e0e78baebffeb9
	.xword	0x870c0e5448be0fd8
	.xword	0x540def15d6e28241
	.xword	0x86a7621730416b99
	.xword	0x60167efd0fd0a6ed
	.xword	0xe49dbb077a8c33c6
	.xword	0x2aba02a15eee8e86
	.xword	0x23873f85bde76a30
	.xword	0x425d93a8a4a4b658
	.xword	0x6e06d897b6c795aa
	.xword	0xac9a54a97f2f3ebc
	.xword	0x2a2541931f21d791
	.xword	0xab3e4dcf81005c3e
	.xword	0xbef53ea4a96791ee
	.xword	0xb9e6c02c00ef5857
	.xword	0x095f48fca8d6e8bb
	.xword	0xc0af1fdd6abea077
	.xword	0x86936c0c50b54f9f
	.xword	0x5dcdb53564f9d5d1
	.xword	0x60f1b57836adf494
	.xword	0xca2cc86c59095ed0
	.xword	0xe1ef8d40b2d1f4e6
	.xword	0x6cb6ca98b9025021
	.xword	0x65a4f3cb78469e10
	.xword	0x32c59acb33165198
	.xword	0x0d6697ec2ae10ba6
	.xword	0xbc1d603ecc453f5f
	.xword	0xcd9c2d38902a8cee
	.xword	0x2ffd9f8824eacaf4
	.xword	0x0eb6be8754b22e0f
	.xword	0x92e882b871e8f80c
	.xword	0x97d52fcb90e290c5
	.xword	0x1d96e8cbe25d9a65
	.xword	0x8fe784f02710b186
	.xword	0xf465067a37f5f9e5
	.xword	0xe926a4a0ac0a013a
	.xword	0x5aa8f326a25879e2
	.xword	0x334f783595915c88
	.xword	0x408445b3f0ad6761
	.xword	0x680d5b4af562ec9c
	.xword	0x26fc7b49ea79c2f4
	.xword	0x2cb3862a2391d17c
	.xword	0x267a236db9ff0d60
	.xword	0x4374b59dcfee3323
	.xword	0x7f40fdf2902bb78a
	.xword	0xcb0fdac37c4060ee
	.xword	0xf25306fb0ae84192
	.xword	0x87ac0878734138c8
	.xword	0xbe0fdaf1b70866db
	.xword	0xb4ee473728f3526e
	.xword	0x0d601c5d9288ad03
	.xword	0x1bdf5b98153d11f1
	.xword	0x86a2216d8cf695ee
	.xword	0xfa49879d4619983f
	.xword	0x9badb1bffe9c5b3f
	.xword	0x9483f6c11ea62fa2
	.xword	0x68f7115900594cb4
	.xword	0xce0329833d9e44b8
	.xword	0x7e3741b917db32b6
	.xword	0xe8fa0fcfc64b5ea6
	.xword	0x2270e875e37d6bdd
	.xword	0xb41fddedd18ec842
	.xword	0x4469d72cfcdd3f61
	.xword	0x9d67d483eef6e414
	.xword	0x4d1af8dcddf36883
	.xword	0x6f474bad3643bbaf
	.xword	0x84d9c1c6617563ee
	.xword	0xaf9616db402c5280
	.xword	0x6747e580c06f2d61
	.xword	0x899f33e02baa7f3d
	.xword	0x16ffbecc605a5a59
	.xword	0x41c6ffb57f122537
	.xword	0x3a54f6710a3334a2
	.xword	0x0b03a4657ff99268
	.xword	0xbe6b263ed6f5bc80
	.xword	0xa6045d8ddd5aba05
	.xword	0x873595205eaa1272
	.xword	0xb347b50db26fdee0
	.xword	0x236aab63c3775311
	.xword	0x358a6d01bb06a19a
	.xword	0xf0c1faddb27942c6
	.xword	0xdafd9b9bb9b36649
	.xword	0xb6ca5c40f58c6f99
	.xword	0x1473b5496e6be2d1
	.xword	0x2f527e978bb520f9
	.xword	0x346aa31b7169f845
	.xword	0x1463da3e192dea4b
	.xword	0x272cf5302b281e6d
	.xword	0x06763d0340b0b85f
	.xword	0xb45e118201e0d00e
	.xword	0x170fc27d0d450d9e
	.xword	0xf00e6b93eab0e94c
	.xword	0x0285dd4ca4910db0
	.xword	0x70cfc585da4de1de
	.xword	0xaedde2a3d8065ca0
	.xword	0xadc129b07d3a7289
	.xword	0x303c262fd2cfe97e
	.xword	0x0191af410e0e5821
	.xword	0xbc8aa61c8b610daa
	.xword	0x144ab235d682ffc1
	.xword	0x4de70fada9f12a20
	.xword	0x864b19a2223e58e4
	.xword	0x19a3d37956534a14
	.xword	0x30c6dd3e6bb41a48
	.xword	0xf4d5f52dd9db4d4e
	.xword	0x506125e9bf859979
	.xword	0x3d4d42a2b9dc5742
	.xword	0xe43fc40595d52493
	.xword	0x67cdb3bdc0a64894
	.xword	0xfeb53a778fca552a
	.xword	0x3a919ef03f556b9f
	.xword	0xd8cdbc401e4e1f10
	.xword	0x9785ecedc8dc5f1e
	.xword	0xbdc9e97d983d4c08
	.xword	0x53026bd6ed0b7c4f
	.xword	0xc944be1736297469
	.xword	0x655b2bf5c11f47b2
	.xword	0xed4f7007e9f4f560
	.xword	0x930438c9b66c4ca6
	.xword	0x600d56b701eaed4b
	.xword	0xbb67070fdde8fdd1
	.xword	0xd77ee5cd508335ed
	.xword	0x012f45c5b06a0fdc
	.xword	0xbad13f9ac5cb8045
	.xword	0x73dc755d9ea58025
	.xword	0x13af03b6b5f17103
	.xword	0x8adace872e94a14a
	.xword	0x915a54625cf94df8
	.xword	0x6ddd7d38d34ff511
	.xword	0x3a1ae210179882a0
	.xword	0x9c53d37e9b5888c3
	.xword	0x731c33f68ad51863
	.xword	0xfb6271e6e94558b3
	.xword	0x1c25ae1ea2f00a50
	.xword	0x409809f5ec0b26a5
	.xword	0x41f809d700ba62f0
	.xword	0xb1b304766e1b8678
	.xword	0x6b76ea826e928301



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
	.xword	0x4f42d89a15c922e0
	.xword	0xd647d296d9ebe2b2
	.xword	0x9b9e5653a5f1b13d
	.xword	0xcaffd9f3ef7b77e2
	.xword	0x1ba92bbf04525205
	.xword	0x74878aecc4c9a3db
	.xword	0x1660dc0d5cc30cf4
	.xword	0x5b2bbd58fa858e43
	.xword	0xd302913a365e1233
	.xword	0x8e4fac3ce2b83d4f
	.xword	0x54f1e2dbbdd1c632
	.xword	0x79255c53ea42c089
	.xword	0xe7bc0247d3066210
	.xword	0x26604d9a3e6c3bf4
	.xword	0xb279efae1399dea1
	.xword	0x778be2314cddcbc9
	.xword	0x638f47bfa4e43005
	.xword	0x63e9f67c8d307e65
	.xword	0xcb6ccb0dcfbe0a42
	.xword	0x2b9fb3748f98c6dd
	.xword	0x22c1d85401c79274
	.xword	0x31af6c3ed0316d35
	.xword	0xf8b512ac2bd6ba9e
	.xword	0x98853147267b200c
	.xword	0xcf1eaf2352cf5e2d
	.xword	0x43c2fe2490fd8409
	.xword	0xc38c753449c4d8fd
	.xword	0xed5899f09eccc63d
	.xword	0x231a095fab9a2cdf
	.xword	0xaac3c7e1c1c55164
	.xword	0x3de391912008774b
	.xword	0x3d53053ea668ef8f
	.xword	0x75ab045aef08c633
	.xword	0xdc15b77ea7ba24dc
	.xword	0x8ddc869581e86bd3
	.xword	0x49beb96e3e03c6a2
	.xword	0xc77a4a3769e4c1fa
	.xword	0x85213f79b60a4c69
	.xword	0xa9d7681081122ee4
	.xword	0xa9170e5b2e942b97
	.xword	0xd325e2b8a3dd3d3a
	.xword	0xa7d5a1ef9f7b9552
	.xword	0xb88c24c3b8e893b8
	.xword	0x38737b541b2356c5
	.xword	0xe9cb27f659cdf600
	.xword	0x4f03b60d79fb2ba0
	.xword	0x3e01cb97c465ffca
	.xword	0x089f5dbafac7d431
	.xword	0x0d9997cae8ff419c
	.xword	0xc6b58b5f6b59151c
	.xword	0x93900218d3b823ce
	.xword	0x36148faaccc62e8c
	.xword	0xfef1b81d4eb63220
	.xword	0x27864715034a01f5
	.xword	0xdb996f9f179911b7
	.xword	0x68eedf756e2637b6
	.xword	0xf9365392d27fbd68
	.xword	0xddeec813c75dc55e
	.xword	0xf1007abbe985ff0d
	.xword	0x39df089c0062a463
	.xword	0x9d26e764cd0b347e
	.xword	0x9c77d07fab00f88c
	.xword	0x53148f6e85f32de9
	.xword	0x65bf81653acbf5b5
	.xword	0x7e678ad4d5cf49c8
	.xword	0xd6928c6c6bde9937
	.xword	0x24af2d4be884c116
	.xword	0x19651ae401340b37
	.xword	0x3ab0d8339bda08dd
	.xword	0x43d46d9f6b77f32c
	.xword	0xbe022ecc37177055
	.xword	0xe2fec3b2c4b23bc7
	.xword	0x9947c09617cc60a5
	.xword	0xf2a47b72cb91f1ff
	.xword	0xcdbd25154b3f3249
	.xword	0x58814818ee4dbbc3
	.xword	0x7340760c1441b0da
	.xword	0x296f2f6af93b6482
	.xword	0x66d0be9e7bd0044d
	.xword	0xdc6876a0289a67fb
	.xword	0xe117c0f23189ad35
	.xword	0x4ed5254e0eb3a395
	.xword	0x10c4b93cc7dbb1be
	.xword	0x668b621c8b9953da
	.xword	0x6ba87bae8a760c6b
	.xword	0x7e65d96362e7600f
	.xword	0x8eaffc5c33a5db92
	.xword	0xadff02209e3e65e1
	.xword	0x5a32e0d935e86e96
	.xword	0xad6f434be0905bd7
	.xword	0x204841775f40f00e
	.xword	0x007e66715de2aa4f
	.xword	0xeaffe8bffda2b6ab
	.xword	0x426381d54d6b3a4e
	.xword	0xedaede428166eeae
	.xword	0xf6a7544a2f16ab22
	.xword	0x8f337878a1426fd8
	.xword	0xaaf5724edce4efcd
	.xword	0x5bab2488645060f7
	.xword	0x1d73844ddcbb27db
	.xword	0x091953598343c76e
	.xword	0x7c4b975bc1d78817
	.xword	0x4d0c00457e092747
	.xword	0x306e99e8f986b48c
	.xword	0x1aff193a98522d5f
	.xword	0xa4155d660ae50ab0
	.xword	0x46cf9ba739f59515
	.xword	0x2dcac02e17eab65e
	.xword	0x713dbd1455765d30
	.xword	0x384917f5ec609e43
	.xword	0xaa28a296495263f3
	.xword	0xe040dbde8e0214df
	.xword	0x5118316e5aed8da1
	.xword	0xfe848ae8110a7cd6
	.xword	0x87df85c435a6ecac
	.xword	0x18e3ee4eec01e4cd
	.xword	0x038179fda00ddd37
	.xword	0x1c35a5513ce3a464
	.xword	0x9dfba13386fc9cf0
	.xword	0x6f0b003587f3e696
	.xword	0x16385803c02fecbf
	.xword	0x1bd4a70fb8407a8b
	.xword	0x4c99d98433afdccb
	.xword	0xc63d33d94b6f745b
	.xword	0x41d2c0f908d7505b
	.xword	0xddf653cf23fe646d
	.xword	0x67e9dd356d10fb3e
	.xword	0x432a0374d644d796
	.xword	0x3edfbf6ebc1da8a8
	.xword	0x17cb75db703588b5
	.xword	0xdc9c5063d8455ade
	.xword	0xb0d7d1f057d0a9aa
	.xword	0x486df5d8bb55e936
	.xword	0x1984c2b3173b0271
	.xword	0x0bfa962f48b663e0
	.xword	0x88a6509d096f8817
	.xword	0x3cdc38e1c26ac9ef
	.xword	0xcfbdae61d028ef42
	.xword	0x69082376e5bf81d6
	.xword	0xcd1bd7235b9b36e8
	.xword	0xf1226078df2185f4
	.xword	0x1410ae591ea1abf4
	.xword	0x4ab30d2f36159a89
	.xword	0xd67573bea096c166
	.xword	0x9bc73a6e8f12963c
	.xword	0x954dd264760fb40a
	.xword	0xe04e5b053436353e
	.xword	0x746eca94b8df721b
	.xword	0xafcc7c6405dbfa30
	.xword	0xbe1d76eb5ab01bbd
	.xword	0x106de6b467b7617f
	.xword	0x5b182f12e886ed52
	.xword	0x4c565ec47a5f146e
	.xword	0x35dc43da191142c9
	.xword	0xd479b647e185b199
	.xword	0x44c8ac76af77acba
	.xword	0xbcf0903117c3aef5
	.xword	0xe60590a4665e4b4d
	.xword	0x9e22260e005311b9
	.xword	0x5978d7c19d245c28
	.xword	0xd05474fb9728ceb8
	.xword	0xb8534bd3f1dd0ccb
	.xword	0xf6d9b1efbf51ead4
	.xword	0xa5c3c2dd04c5fe5a
	.xword	0xe1d7d8d147c99335
	.xword	0x776637f8d64a7066
	.xword	0xa4a89e206b9fd13b
	.xword	0xf12d32e178467d2c
	.xword	0x13b5b9078aabbef3
	.xword	0x8c6b8e4d763e48fa
	.xword	0x950bad9488268e23
	.xword	0xb8169b6b80063e55
	.xword	0x1d0f0ccf5b4f4fda
	.xword	0xa0413ffca45e03b6
	.xword	0x7e3021cd65fc03cd
	.xword	0x7527354840cd5632
	.xword	0x537f7a86d85c6dc0
	.xword	0x884b4543d59f78e6
	.xword	0x09c6e987cd76aa7e
	.xword	0xf18348b6a90f11dc
	.xword	0x5e0b8b7f13fa70df
	.xword	0xa689f17bd0d839d8
	.xword	0xf04dc97dd8f26768
	.xword	0xaf78959239f9a51a
	.xword	0x606afeae61152f54
	.xword	0x8f112426058bd0a4
	.xword	0xdea372c4f7280969
	.xword	0xcef1a455bebcf06d
	.xword	0x7b12c600ccb6d5d6
	.xword	0xd9dd2d3a63db4136
	.xword	0xf161aa7fcd1213d2
	.xword	0x287a0d26c894ff5d
	.xword	0xb02c78798bc314e7
	.xword	0x3ab3cea437759227
	.xword	0xf46c8725ad973267
	.xword	0x4551585fec8eb8b1
	.xword	0xfbe06c543fcdc960
	.xword	0xebc85fe5f0689821
	.xword	0x3240219ad478d7e1
	.xword	0x7d11d9b1dc4b7cd0
	.xword	0x9ae30942f58a1326
	.xword	0xf6873e13ae40d377
	.xword	0xec6a02529e5733f7
	.xword	0x525f2ea52f22d0a0
	.xword	0x0afdf4d2c7b530c6
	.xword	0xebe910050bf4c357
	.xword	0xb8653ba79da5c99f
	.xword	0x7194e741453dc2a6
	.xword	0x2600c83b84b792d5
	.xword	0x0f6b19f4f2ae1fe4
	.xword	0x8eabfa3ac3e9d8d8
	.xword	0x4e6a73d207ac516a
	.xword	0x90da8901001bc758
	.xword	0xed13d420a2d47c94
	.xword	0xc2c9d1e9dc5cbf44
	.xword	0x3858ac4a13468980
	.xword	0x1017e29bb79581df
	.xword	0x9a0d1ee6e72a9593
	.xword	0x069d39428bf3d976
	.xword	0x6db0e81221ed9460
	.xword	0x5c8fee565150f76e
	.xword	0xac8ea2a2f8b9263a
	.xword	0xf7a7ec32566b3f1c
	.xword	0x3f500f5555f6afff
	.xword	0x347ce2c469361947
	.xword	0xc4f35ce6104cb44d
	.xword	0xa202390f84d729bf
	.xword	0xd1b24174ac80c1bd
	.xword	0xfec8a536a37db871
	.xword	0x87caa514fd694357
	.xword	0x5b9adbb8aa7a8255
	.xword	0x4677d4d7155028d8
	.xword	0x4475bb8a0a337693
	.xword	0x3ed2490ddc078d40
	.xword	0x2f26e02122dfebbe
	.xword	0xd84626dc45ca32cf
	.xword	0x757398ae4c734e50
	.xword	0xdfe696dcca589bf7
	.xword	0x401fe3c74b73a269
	.xword	0x55bcacecff784e13
	.xword	0x4192b156fb05a1f0
	.xword	0xd74a050d8b86f779
	.xword	0x60d2ba6f124512a0
	.xword	0xd110fa5323e1b1fe
	.xword	0x0ff43198219877a7
	.xword	0x9d1a94618f38f4b0
	.xword	0x45619123a8cfa196
	.xword	0xa6455f84446c9054
	.xword	0x8ad39a451e145724
	.xword	0x55915addff8e57c6
	.xword	0x3cfd5f5353fb1b10
	.xword	0x990432f796676f99
	.xword	0xb4a206ec86dc97d9
	.xword	0x1abc225995820947
	.xword	0xc6e63a647623baf9
	.xword	0xdfd8d8bb0b6e196c



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
	.xword	0xc49f38d141c72a16
	.xword	0x4889e2b4b02ca561
	.xword	0x62feb6fbdc2571df
	.xword	0xb4623d5e2fa2c078
	.xword	0x187179ea471a436b
	.xword	0xf6dacb2f162f503f
	.xword	0x891e67d7f7e416b3
	.xword	0xe208d18d23fa68cd
	.xword	0x6d1efe7a760e327e
	.xword	0xee517caa3bfeccf3
	.xword	0x61f6ae868c54a78b
	.xword	0xa5197d21aa8afb1e
	.xword	0xc4ae570f459285fb
	.xword	0xaa9d8008c55308d6
	.xword	0x74d13861f54f242b
	.xword	0xe351728a686ccb77
	.xword	0x95abfa11776db464
	.xword	0xaa75b41e1057da85
	.xword	0x38667203c8950c28
	.xword	0x155244954da8e453
	.xword	0xb773757137cbb319
	.xword	0x74f9e35ac2636b12
	.xword	0xc027bf8c641cd8f3
	.xword	0x85699e5c9562c975
	.xword	0x8d220ccdc19cbffc
	.xword	0x110693545dcaf2d7
	.xword	0x7569e492a7badb79
	.xword	0x9ea97ac7f0ae73a9
	.xword	0xac8470db7fd717be
	.xword	0x765d5d91e8a6236e
	.xword	0xb2dcb90afbae3735
	.xword	0x64882678d1ea2858
	.xword	0xb0bd07db58f64a60
	.xword	0x748542d78db62724
	.xword	0x543f835ade12d96a
	.xword	0xf8e73901e0c1df44
	.xword	0xb28620d02b3eaf1e
	.xword	0x8441b1fed5413619
	.xword	0x3beec64a5a56f8bb
	.xword	0x0e15ceaf1bf7ffca
	.xword	0xe9fe677fd9780d3f
	.xword	0xc7f229e4eb12d0c9
	.xword	0x1c3cdbf3f1a84dd9
	.xword	0xf4d1d70909807a67
	.xword	0x0cebe34f5b8f2752
	.xword	0x56aa39026e51cfd9
	.xword	0x32bfeb9967cf3a8f
	.xword	0x312fcc9eb26dced5
	.xword	0x887bbb54eeb18d90
	.xword	0x6a73f922b5eeea52
	.xword	0x3cfb1139abb92595
	.xword	0x7a08fb67347c8e52
	.xword	0x63c4342a5b8034fb
	.xword	0xbe675b04adb6f76a
	.xword	0x104390cf39c0a21b
	.xword	0x62b473c6e4649852
	.xword	0x80da9e05d2d35298
	.xword	0xc1cb53f55345943a
	.xword	0x0c875547c9de6bcd
	.xword	0x68224df40f12fedc
	.xword	0xdb6510dd4ed89ce1
	.xword	0x176eb338e24c140c
	.xword	0xd4841adad61795d7
	.xword	0x1e56669659a7eabf
	.xword	0xd7bfc5262a9d01a4
	.xword	0xc5e4a18d18f8e7d1
	.xword	0x3b6e61f991181530
	.xword	0xbc98c47a14bfe10b
	.xword	0xcb38793b4ca85a74
	.xword	0x9e1ba0449fc80b9a
	.xword	0xf84bf607bc557310
	.xword	0x174f17f6bac2443d
	.xword	0x58db5332513a7b2d
	.xword	0xa4eb99b93ef72a27
	.xword	0x8e813c3a05f72104
	.xword	0x819c19aad75352ca
	.xword	0x8ab658d55638f812
	.xword	0xf651b772e2e5c468
	.xword	0xc8ea179f5a6e5598
	.xword	0x21b81cb97ee2ecbb
	.xword	0x666ddbb622b8da9a
	.xword	0x3190a09963e64257
	.xword	0x583ecc9be595c26b
	.xword	0x8bf52f1762062874
	.xword	0xd3235867336cdc7a
	.xword	0x8c50bc0a18c1eacd
	.xword	0x57b6d5a9f65db815
	.xword	0xd0c9d6b1fe1ec98b
	.xword	0xa31846f0b01c5342
	.xword	0xec64b627f487a7b1
	.xword	0xc0634eb83cfa59fa
	.xword	0xc83378841e2a1752
	.xword	0xdfd7229880302687
	.xword	0xaeecc5ea67eb74c6
	.xword	0xf875997203e58ff2
	.xword	0x6634fd1d117d5e46
	.xword	0xb956f3719002c6d6
	.xword	0xdda7b61af152c3f2
	.xword	0x67acaeacb915054b
	.xword	0x2f44a6a3abbcde75
	.xword	0xd687f8fda2e4e104
	.xword	0x963eee5d0f7346fa
	.xword	0xb345fef64ed66e8f
	.xword	0xf57686a75c25c9ef
	.xword	0x3caabc9f52565bc5
	.xword	0x5a8331355545ffa0
	.xword	0xfce781265b9e5669
	.xword	0x4d22c8f06223e785
	.xword	0x9cd317526a4cd31a
	.xword	0x3dc8713adfd76aa4
	.xword	0x806b9bb398dcda49
	.xword	0x26a509e8d41a661f
	.xword	0x24c96a83121b617f
	.xword	0x136578f2e99b8ade
	.xword	0xc664d28aceaa2f49
	.xword	0x34be693f37e8e6f1
	.xword	0x2a1892bf03600e16
	.xword	0x565623fa594e3cb2
	.xword	0xd39074d40b348160
	.xword	0x73bc2e0753be448c
	.xword	0x08500f044232e373
	.xword	0x6a35b79e90eceb9c
	.xword	0x6b3084390bef2223
	.xword	0x59caf76b2ae630f1
	.xword	0x8419997c468ffcf5
	.xword	0x109831fe8a71a1f0
	.xword	0x55927b146927068c
	.xword	0x4f4cf8562821a52f
	.xword	0x46339103c5f3da13
	.xword	0x55d29d2b07108c9a
	.xword	0x40dfbbd33590a68e
	.xword	0x2975111aef46f14f
	.xword	0x108f57871ebc9082
	.xword	0x43d3278db66ee18f
	.xword	0x80e6cfa4ca2e9549
	.xword	0x8c6ab1e07fdab32d
	.xword	0x3f23403d16a93676
	.xword	0x70becf413e532b1a
	.xword	0xb6ec8e8f470f365d
	.xword	0x28ab39ad351ad7a8
	.xword	0x11e81f439e3a1dd1
	.xword	0xc7f5b570d30384de
	.xword	0x1188e483e031184c
	.xword	0xe5e60f80918335eb
	.xword	0x46b93c9acf6ee66e
	.xword	0x8c598b7582a46281
	.xword	0x5e91e438f5682f3e
	.xword	0xf3421e5868747303
	.xword	0xb537a8f14c32ef12
	.xword	0x1d11a7b8383056db
	.xword	0x691eed06660f14a4
	.xword	0x133344492b0c32b2
	.xword	0x523dfaaff15c86d2
	.xword	0x691eb27574c979c1
	.xword	0x1d621a87075854b4
	.xword	0x8d037831c80fcfca
	.xword	0x2aac7560d77b7769
	.xword	0x4537fe03cb920968
	.xword	0x5db63516279f6b89
	.xword	0x124355254b0e5fae
	.xword	0xc5a09515ec749ccf
	.xword	0x47ef283d562c514f
	.xword	0x9f6f59f308bf2775
	.xword	0x576f2ad3eaa3f024
	.xword	0xabb52d14cd09b380
	.xword	0x1c7bc72e938752ba
	.xword	0xc3e66118187b812f
	.xword	0x30ca65e184f14adc
	.xword	0x9c26ec78d0c71e1c
	.xword	0xb6ea476ba2afd9d7
	.xword	0x2e4d04906edff39f
	.xword	0x3a8acedea6635298
	.xword	0x8e25b1797a6c992e
	.xword	0x40d0a97661d37da0
	.xword	0x60122452255ac2a2
	.xword	0xdda27482e29a062e
	.xword	0x42268d96c9353a9b
	.xword	0xd1e4cf902ae588ff
	.xword	0x133efbd302b1878b
	.xword	0x6a537c2ac112c4f4
	.xword	0x5c281bde25697e60
	.xword	0x0dec96842ed1c33f
	.xword	0x360e8a34e7ecf180
	.xword	0x96797c14139a9ffd
	.xword	0x2cb4631183431218
	.xword	0x33045ef8e2b904cd
	.xword	0xd7fb9c41f89c6ead
	.xword	0xfdcdd16333c43471
	.xword	0x04787647dba08755
	.xword	0xf1d05cbe4608041d
	.xword	0xeda618082126cbe8
	.xword	0xe67c189f23739afe
	.xword	0x789dcebcd4f1063b
	.xword	0x3ced003f73ffc747
	.xword	0xbb02cc20e02a92d9
	.xword	0xf593d159aaf57770
	.xword	0xea1f6a73fa8d2154
	.xword	0x7d5dbaabbc427ead
	.xword	0x319894057d70fd2a
	.xword	0xabc70aac18b67a95
	.xword	0x0ca7e03e5064f9e3
	.xword	0xc5cdbb7081f90d52
	.xword	0x6b3ce48b9e985fd5
	.xword	0x5024f210322dc85e
	.xword	0x085c4afb484d8d2e
	.xword	0x5db071d06d6d5cf2
	.xword	0x07b4ff8e640b6ab7
	.xword	0x60673af5725e2cbd
	.xword	0x1711fc9c32e82130
	.xword	0xf82a4028886b15f0
	.xword	0x07280e7200b131d5
	.xword	0xd912bf9075538605
	.xword	0xfe71401ce20efb68
	.xword	0x0ea78765d1ec8a57
	.xword	0x600ff27720f5dac7
	.xword	0xb2b9d3bb44b4d622
	.xword	0x1f9008b574530951
	.xword	0xf6d0df83bb2d65f4
	.xword	0x70c7613a82c14aad
	.xword	0xbd419e4c50e994b1
	.xword	0xb11f9b782611d90c
	.xword	0x4944ad2eb60b03d2
	.xword	0x7c87319fcd983c13
	.xword	0x262c32263d7b7bc7
	.xword	0x4d5ada2665f9b5e2
	.xword	0xaf99f91d7de9df4f
	.xword	0xb9d950d0e3e2b5fc
	.xword	0xad9f53c609d73e25
	.xword	0x3bd8d33456ec7db2
	.xword	0xe6247ea4d81e7239
	.xword	0xc4a2217af30cb82b
	.xword	0x0167b6d51dd601ca
	.xword	0x1fe1f779a57378e6
	.xword	0x9c635bcdc996020e
	.xword	0x9038a7b62fa76c19
	.xword	0x2d606fbdab4919d7
	.xword	0x16a61b5d7e0a18a4
	.xword	0x9b530788d41e1e1c
	.xword	0x406a17ddb68f6171
	.xword	0xf775194b142fd1b4
	.xword	0x6d92075f8c8eed02
	.xword	0xdd8d7ac4fa87dba2
	.xword	0x92cfd166d587cd23
	.xword	0xdd48232635bb4697
	.xword	0xb09e8790fda3973c
	.xword	0xb63e68da347acac5
	.xword	0x41af9183f9bbd42a
	.xword	0x0a246f53948befb3
	.xword	0xe311790de1df847d
	.xword	0xce26f7ba93bbe285
	.xword	0xf7b9de397af2ede2
	.xword	0x1647ae5fb535eef0
	.xword	0x81fc621354636a8a
	.xword	0x021ee7b0cd29ab84
	.xword	0xe72d9a886ebe3484
	.xword	0xf51145f2128a4dd6



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
	.xword	0x8afe1aacb8fe68de
	.xword	0xbfa1ca9e7a2e2cf7
	.xword	0x1c4c671c9c4fe95e
	.xword	0x1d6ab05da547f5f5
	.xword	0xc73be71260f2eefd
	.xword	0x73ba7ee1423aacf9
	.xword	0x1a0e4168432d73b9
	.xword	0xe9b4f85cb696aeea
	.xword	0x5bfc5ecf390a9cee
	.xword	0x6bb616e085f176b8
	.xword	0x1324ef19305d6ddb
	.xword	0x1cc4f911aad0acc0
	.xword	0x1f436be52c1ca17f
	.xword	0xe731407742a82dc8
	.xword	0x8c359437424d9ae3
	.xword	0x8d8a012482c70842
	.xword	0x1af36a0e13318988
	.xword	0x35eec3992f2ef131
	.xword	0xd7d6fb8e9bdce0ea
	.xword	0x5511cd2351edb0db
	.xword	0xa129de59c1efc970
	.xword	0x668dfacd18632b63
	.xword	0x72f99cf5ba47e633
	.xword	0xa781ef452ee6fc9f
	.xword	0xc1682caa246e36d4
	.xword	0x6ed824ae8c1a4e15
	.xword	0x872482a74f0b8e98
	.xword	0x0035c0d30a898210
	.xword	0xf5e8554481665630
	.xword	0x5b6895f9b30e8b1e
	.xword	0xcbaba5b12f1d4cb8
	.xword	0x8dd47e8e97c14210
	.xword	0x2453860d98879ea7
	.xword	0xf3c97a5e675401f5
	.xword	0x82d975042829b5a1
	.xword	0xdbc309a1c917b41f
	.xword	0x2b3a41a6d80c848e
	.xword	0xd4452d30947f350d
	.xword	0x03a57304eb9b41a1
	.xword	0x629df1c82c1cc2cb
	.xword	0x691023031d6bb9cb
	.xword	0x4f050676a1dc4cd7
	.xword	0xd11daeb86694fa9a
	.xword	0x21b60e320d9dd925
	.xword	0x2a680f0d273177af
	.xword	0xc1dc0ab3ce5910b3
	.xword	0x873752008c9a4cc0
	.xword	0x104262197e046063
	.xword	0xc44b16c4baecde6a
	.xword	0xc006e1a146ec4d60
	.xword	0xca2566a827d1baf4
	.xword	0x685149025a627ca6
	.xword	0xde314704611043cf
	.xword	0x4af6c5c335f946ff
	.xword	0x19701f0ef78eb0a6
	.xword	0xba45b577e924d50f
	.xword	0x85f5263d42aaea07
	.xword	0xac16e241ff2aa2b6
	.xword	0x5dfd2c279122c169
	.xword	0x3993d012c2fc95e3
	.xword	0x9a1d4fd2776537f7
	.xword	0x09a61e55b675e60c
	.xword	0x5b479c8fe9bca7ac
	.xword	0x5b2f2033afb75dc1
	.xword	0xd293cf0b290bbdc4
	.xword	0x354434f7772f56e9
	.xword	0x27a6b9af5bf9ae48
	.xword	0xba4dcb554ad7bbfb
	.xword	0x3a8d720697b3f729
	.xword	0x0a990eb344d6522c
	.xword	0xc4d63be2002a1cd4
	.xword	0x8f2ed22d1d26e906
	.xword	0x3199ee4633f79d65
	.xword	0xb0b97d0803f59f32
	.xword	0xbb11263468ca6457
	.xword	0x0d059e90a6eb635b
	.xword	0x8ad87ebf16643563
	.xword	0x67468804e05f5e05
	.xword	0xe983641cb7225634
	.xword	0x82622f5d94a726bb
	.xword	0x94fde9f1591c1075
	.xword	0x1300d93598d6d434
	.xword	0xea825cb2975584d0
	.xword	0xb3414f5a45c3ac0e
	.xword	0x559be98d8e7ec08c
	.xword	0xcdec13383e8f71cf
	.xword	0xe930a9b4ef1a1faa
	.xword	0x067e34706f787046
	.xword	0x78e559eb13b356c6
	.xword	0x25590fdcf243395b
	.xword	0x71d8409ede04bb56
	.xword	0x0acfc53a4f04de22
	.xword	0xa06cd2f2c3d58917
	.xword	0xf4a2f980bfe40fe8
	.xword	0x110d128805b0b4dd
	.xword	0x92db8a3b20058338
	.xword	0xf5de51d4da5264fa
	.xword	0xe3bf03e29dd85481
	.xword	0xc2356bd370796604
	.xword	0xb2689f5fd4774b43
	.xword	0xfb9e3f3bbd2d24cd
	.xword	0xb712f8326365a159
	.xword	0x88c506c9cf26d5aa
	.xword	0x7ae7078f7aa02aa0
	.xword	0x5a372d71d45b4fcb
	.xword	0x562fc5c5aaa7f302
	.xword	0xb12f2378a220d37c
	.xword	0x93938f622bafa8e9
	.xword	0xc6c9be89e2b1d13d
	.xword	0x518aeef31f9b606c
	.xword	0x6d7dfe4f57e65f9e
	.xword	0xb4a62456f1932983
	.xword	0x862fb41c4a31852b
	.xword	0xd11dea46f176bc52
	.xword	0x1754cce93bc88341
	.xword	0xad2cf3441321a111
	.xword	0x42cae1a211246663
	.xword	0xfd23c257135dab23
	.xword	0x04e8e1a2fe5d8b48
	.xword	0xbcbcc52d7e12a47c
	.xword	0x38a7d88d3f45ed3f
	.xword	0xc44e7bf4771b8b8c
	.xword	0xd2efa31a8d59a8b0
	.xword	0x0e927b2e3d1865f0
	.xword	0x84363c1f71bdf988
	.xword	0xcec904a9183cade8
	.xword	0x951498db9ae1f603
	.xword	0x63e35b7f7867f101
	.xword	0x1a55d94c77c8c96f
	.xword	0xd3e522840e5b2274
	.xword	0x82a2db9b367e5120
	.xword	0x41a48297cc625a09
	.xword	0xfcfc18316cc92c4f
	.xword	0x11214412ba983859
	.xword	0x9fb97b15b0a1010d
	.xword	0xe99f342dd1be7aaf
	.xword	0xc33c2f1989a70fe6
	.xword	0x93f39ba231a66f05
	.xword	0x4c8c3eeee259c8dd
	.xword	0xf6d030d322270c0e
	.xword	0xa2610b4998e83f09
	.xword	0xe545b295827b930d
	.xword	0xf8f2ff21bf4b2bfe
	.xword	0x043e95e959667577
	.xword	0x110a2cba7d7928ca
	.xword	0x2ebedccffb8bb7b2
	.xword	0x11d58ce82a4bb0ad
	.xword	0xd84c702aac93bdc8
	.xword	0x807e0321d8d4d3f7
	.xword	0x5c2ac40eeac1db46
	.xword	0xd44975a0acc1b321
	.xword	0xa41197de519fda3d
	.xword	0xcbe789dda0188906
	.xword	0xb93058367aa87aa8
	.xword	0x03ae28721df716ca
	.xword	0x86c9214f8bf4ce36
	.xword	0x2f0ebf3561ef85fa
	.xword	0x5d279e237b91f2ba
	.xword	0x054db3aca686dfb5
	.xword	0xd37786e8384dc152
	.xword	0xd3c5751b696f320e
	.xword	0x2713a15d6b13409d
	.xword	0x2f3944b4f2be722e
	.xword	0x48f0c71dc92988a0
	.xword	0x17742fb76a0b5575
	.xword	0x112fdf61e7da2a5e
	.xword	0xb296a1b5b1e42b5d
	.xword	0x10cb6731dae31f3b
	.xword	0x3322c0e49f1f823c
	.xword	0x9c64b36dcc8f607c
	.xword	0x65eb205d68831ce4
	.xword	0x69571bae73422dc6
	.xword	0x097ff066dcd9e2f7
	.xword	0xba6a5be61c024125
	.xword	0x416ea67b754b195c
	.xword	0x1a4e60a9fd38d54d
	.xword	0x242188d4d8eea5b2
	.xword	0x4b77895652c892d4
	.xword	0x1fc2418df943b30b
	.xword	0x996677cfa863af6b
	.xword	0x093808df4572f53c
	.xword	0xbcc33a614323c6ce
	.xword	0x67506f06a13f5c4b
	.xword	0xfbdcdfdf9af05cd7
	.xword	0x02291f8f6a584f4a
	.xword	0x1a0324d030444f6f
	.xword	0xd6a141cba1ddcb8d
	.xword	0xcbb2ce33fbe9597a
	.xword	0xa61b58adedb293e5
	.xword	0xece26ae7d8b97a90
	.xword	0x573172d9c3e856af
	.xword	0xab9fef0d0d537376
	.xword	0x90b15dab56290feb
	.xword	0x7483b876d171d829
	.xword	0x925ee7867c99daab
	.xword	0x75572d36f8f053c1
	.xword	0x7ee3cd7f08d055ab
	.xword	0xbaf9e7da4d8621d7
	.xword	0xed86ac504cc28571
	.xword	0xac3f9c6c5ac22007
	.xword	0xe67f2c36ec05f5df
	.xword	0x9e0aa099c05747ae
	.xword	0x7df82d04620dc81a
	.xword	0xc968a488915edad1
	.xword	0xbf8984f23ce5953a
	.xword	0x4bfea07f4ba35e2b
	.xword	0x3ca14abe9f847fab
	.xword	0xa3e91ee3edf0555e
	.xword	0x6f41a67fe869db47
	.xword	0xa59298cb9f16b760
	.xword	0x5785a454af2416cb
	.xword	0xd6176b1bd8ef4af6
	.xword	0x0c42acc5a730a207
	.xword	0xe034d977b6ef10db
	.xword	0xbcec6084e075263c
	.xword	0xbdcbe7b637a28ac0
	.xword	0x044065fe74c53760
	.xword	0x7699748a991be5da
	.xword	0x94b316a64b7cb100
	.xword	0x41e3c85c18c47722
	.xword	0x22e9005e9646926e
	.xword	0x4bbbb7e8c3e2e158
	.xword	0xa5e7ccab0c62fece
	.xword	0x5c8458a32e308239
	.xword	0x19cc4c67dfd0b8ac
	.xword	0xd13b44e037719162
	.xword	0xf72273c36d4f0010
	.xword	0xd3243b7cc6876001
	.xword	0x94973c0ba8037726
	.xword	0x0e22bd35ad8dad90
	.xword	0x6212a36e74e2f734
	.xword	0x399ae84a150b2a6d
	.xword	0x7751e696dfb2264a
	.xword	0x0aede3a020224690
	.xword	0x6b71a94bf6ebfd17
	.xword	0x8f48a49e7991fb2a
	.xword	0xe02692b8dddda17d
	.xword	0x7e1f5cf3ee1f6c16
	.xword	0x49afdea99edde09b
	.xword	0xf1fadfe1e2c768d9
	.xword	0xbc8c6b896c81395f
	.xword	0xa326ee06fb9881cd
	.xword	0xbaeecc764f907ae1
	.xword	0xaff2a41fba882e8b
	.xword	0x9c7d31a2fbb045cf
	.xword	0xc2c711e9450b4e43
	.xword	0xfb0bc6badf118944
	.xword	0x5ae6378b3c8c7ffc
	.xword	0x6f02d9628b69769b
	.xword	0x8acde3f57387fa46
	.xword	0x3cd18a56eef1451c
	.xword	0xf6ac12a25284ccda
	.xword	0xc7a68b8dd1da7bcb
	.xword	0xbdb575a82b2e7d4a
	.xword	0x1fba1df3964e8df0
	.xword	0xb36fc95d24bd4f68



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
	.xword	0xcea973e24d07f184
	.xword	0x8b3c5f7c2966b375
	.xword	0xd225b0aa87f9b38c
	.xword	0x04817221ff533d38
	.xword	0x427b7692c0a860b8
	.xword	0x7ef046042f0a4815
	.xword	0xee52f50f7d0dee1e
	.xword	0xef8b38e42d5ae25e
	.xword	0xfce0fa1816266aff
	.xword	0xe7abe15da7eb6e73
	.xword	0x01eb4c3396185d2a
	.xword	0x678b844cec73e6fb
	.xword	0xaa817d7dc2ca3251
	.xword	0x7bf38759b9a555ae
	.xword	0x904992c34017c0b2
	.xword	0x7784df8c46e898d1
	.xword	0x0bde1cb39e2c7dd4
	.xword	0x7d6b480fe438d144
	.xword	0xe73347c70d47d801
	.xword	0x59bfc8cc3db22463
	.xword	0x2f5f7e2685628e61
	.xword	0x690e80bafd4e7040
	.xword	0x511a2b09606daa50
	.xword	0x4efddc6c14877e3e
	.xword	0x39e446d287d153dc
	.xword	0x488db85e00526bc6
	.xword	0x744739911020041c
	.xword	0xc5c9b4abc7d64de0
	.xword	0xdc5cbb4e317384fb
	.xword	0xd5c54df0cd9d0086
	.xword	0x0925e1d71e0fa620
	.xword	0x35e4b3b4d4c44668
	.xword	0x18d0795f71f602e0
	.xword	0x27e8f0f1252ec248
	.xword	0x53053b779f59807b
	.xword	0xc18fb21db63288a9
	.xword	0x1762d8a421954a85
	.xword	0x87a23c8394e2c7a1
	.xword	0xcc6735f9f6f1a10e
	.xword	0xde6f714b8d993882
	.xword	0x2811cf5a5f57c965
	.xword	0xa6e1672222c3b42e
	.xword	0x47fc39b415ee0a5b
	.xword	0x2d4ec5076177f0b6
	.xword	0x437a7b8efbdb2162
	.xword	0xd86932e9305ed16c
	.xword	0x8133a17e40264ca1
	.xword	0x6596c0c9f49ba795
	.xword	0x695820dc061a44ce
	.xword	0xbe61ab42d499676f
	.xword	0x2dcbb8f580559052
	.xword	0xf3bed0a51afc0708
	.xword	0xde738a7044486c02
	.xword	0x2a80a76a7b9d9284
	.xword	0x20a6143193979c46
	.xword	0xebabb49ccef88d60
	.xword	0xb910fadaf36e2d3e
	.xword	0xb0600f1d33315cfb
	.xword	0x0b85a8df6ad46355
	.xword	0xac2bc9c22963c092
	.xword	0x55a9f198d82d3d6f
	.xword	0xa75aeeb9edb69658
	.xword	0xf2c50c603d3ce304
	.xword	0xe2bb67be0d5547e6
	.xword	0xe1d9c32ebb87cd14
	.xword	0x8694522eb98967a1
	.xword	0x6d503f9e8f4c9f90
	.xword	0x15ea964dcf69f90a
	.xword	0x8b8e706907f1df50
	.xword	0xafda45dc27f6834f
	.xword	0x7ce11dddddfaf51b
	.xword	0xa40e9713ebfd4589
	.xword	0x7c5ffe32257c910f
	.xword	0xf7f0c972fd7d348a
	.xword	0xf97e433151c7ed08
	.xword	0x1e94cbaa2f7b93b2
	.xword	0x2e81d70b294e94b2
	.xword	0x913b278962d2d9fa
	.xword	0xea9f06bfa416f82c
	.xword	0x8d17d6ac52d51922
	.xword	0xd8db8933d5b6d682
	.xword	0x3e1fa8c93e081831
	.xword	0x5c8145c3f68d0b4d
	.xword	0x7584d26cae754757
	.xword	0x0d279d91653b1a9a
	.xword	0x7dc1ffdfdeb11cc9
	.xword	0xbcc6f01a38760789
	.xword	0x25ab0fb91f2dfb27
	.xword	0x7bc80e9f7860de60
	.xword	0x6082411f5ffae517
	.xword	0x0ad2dc878bd2cf96
	.xword	0xbc1499ec83640aac
	.xword	0xee0370a09e581896
	.xword	0xa1b7b164f558286b
	.xword	0x28e09cf3f50a5520
	.xword	0x8e4e1fe0ff3b1dac
	.xword	0xc1efc0d3dcbe8994
	.xword	0xb72199e7d0ea5406
	.xword	0x40f7b98048435a8f
	.xword	0xf69382889f83f7f4
	.xword	0xb25a5b7f5b2d09a4
	.xword	0x49bbeb4e634da408
	.xword	0x1ff8ca82df898503
	.xword	0x6c5627fc335fe812
	.xword	0xeb7302bd1999cec3
	.xword	0xdaefa532986f0c8c
	.xword	0x04722caf56d56eb6
	.xword	0x776fc4454d06e73a
	.xword	0xdb2f89692d7dbf01
	.xword	0x9712f40572dfe4a8
	.xword	0x233de69066a73717
	.xword	0xedf71f64066360e9
	.xword	0x037615ff424caa7f
	.xword	0x29d1b1271fadd0e6
	.xword	0x57f6f169c1a4698c
	.xword	0x1143d2a9362d2445
	.xword	0xbba65e615e7f78ed
	.xword	0xd42f296d6317d47b
	.xword	0x0c7601c22452bee8
	.xword	0x9f1da4fb5e770e1a
	.xword	0xb9b3eb7f61ff0812
	.xword	0x5bbababe89f5d75a
	.xword	0xa22544b5fd1803da
	.xword	0xf82effa574905343
	.xword	0x31fa5ad3e44a0a40
	.xword	0x8d1701f35499e522
	.xword	0xbe8cee827ade7171
	.xword	0xff2aa9eee33bb833
	.xword	0x59809743b463b3af
	.xword	0x91c0b62c5311ae0a
	.xword	0x7dbcb18874adbb0f
	.xword	0xbe90f8143531ae8b
	.xword	0x9b6f879875f9b611
	.xword	0x2ea32f5cb7955ba1
	.xword	0xc001c3c3f4fede74
	.xword	0xdd8c040264fdfd78
	.xword	0x2ea68b801253248e
	.xword	0xf693be9ff141374d
	.xword	0x706adf205162083e
	.xword	0xbe5243f283e7901d
	.xword	0x093ed00b805b3a29
	.xword	0x99778d26d6a8db97
	.xword	0x8a7b5d4be0acc67b
	.xword	0x789931c46d43d8fd
	.xword	0x5bd4292ad62a6a26
	.xword	0xb124eca72993e15e
	.xword	0xfb4ae62e2202c06b
	.xword	0x5c889bfadec6169e
	.xword	0x5a1a7773978803b3
	.xword	0x2b297f186b1230ee
	.xword	0xf6aff0afa0d31043
	.xword	0x7d8ba83a09020eb0
	.xword	0x4db5ae3aff0e0b37
	.xword	0xb472ab712db7f54d
	.xword	0x6a62fcb413ae0c56
	.xword	0xe28485d59408f7c1
	.xword	0x45dfcdafc116a4a1
	.xword	0xb0773c9de7063c63
	.xword	0x07a51dec41ab8eee
	.xword	0x9b00361dab7991c5
	.xword	0xc01ec8c490f9df62
	.xword	0xbee682686964c203
	.xword	0x029fc70fc6405d52
	.xword	0x3e36505a6f0b6edd
	.xword	0xd219277d60d751a9
	.xword	0xef0d4607aa79ff53
	.xword	0xa884cc16eb56ad83
	.xword	0x305c68e7584aad0d
	.xword	0x86dedf08ef95a708
	.xword	0x24749416fc63180f
	.xword	0x1f222df34ab6b62f
	.xword	0xaf4aee5212b4dd09
	.xword	0xae60dd608e11a02e
	.xword	0x1f2a4fd2a4df3b63
	.xword	0x290ad720170829b0
	.xword	0xe89011cc4838d267
	.xword	0xc26ae3c3148fe1ad
	.xword	0x5863a8c056d49534
	.xword	0xa9a99d7b005ef60c
	.xword	0xdcde3e719ec5d17e
	.xword	0xfec3d1b10d9c8018
	.xword	0x1d2ed03fafd5c454
	.xword	0x17fef3aab8b7538f
	.xword	0x58b9fc83ac2667c8
	.xword	0x4e54c34a3a91c5f9
	.xword	0x2730a349b9536cf4
	.xword	0x0a345666ec89b695
	.xword	0x6b0da0756758fdb4
	.xword	0x739c3537a6cb52dc
	.xword	0x936fbc07b68254cd
	.xword	0x02aa77196f7caef5
	.xword	0xe377f0d89664ef9e
	.xword	0x81e5ea6a9660aa1c
	.xword	0xaaed4f689c59e195
	.xword	0xad6e86f0869bf0fc
	.xword	0xf042b12e85724787
	.xword	0xa84e068592b7ff54
	.xword	0x08e7724c341b4613
	.xword	0x3bc56227f8e6f5a7
	.xword	0x4b97c928acdd3488
	.xword	0x2caeae8ac36b916a
	.xword	0x1518bfdb21a34fd7
	.xword	0xbd81b5b9c3f3b0b1
	.xword	0x4e35f34fc3d41879
	.xword	0x8d00cf02392f72d4
	.xword	0x71d207cf254a29f9
	.xword	0x529d439558e542fa
	.xword	0x20fe0d1ba797c224
	.xword	0xb7128bdd44fd2f81
	.xword	0xb570931db79e86b6
	.xword	0xa0f6815149eaf6e8
	.xword	0x9093e741ed1a2c82
	.xword	0x9482fcbc8871d170
	.xword	0x26a4b25f5c6f3ee1
	.xword	0xc79a4db0612c6de1
	.xword	0x28d6ed29c3d652c7
	.xword	0x69482d714a233a13
	.xword	0xd9f149e779c736ea
	.xword	0xe415edf157fa2a12
	.xword	0xc42c91139c1cdee4
	.xword	0xd2f90190efdabb77
	.xword	0x9a748b12e581d861
	.xword	0x058a82fe9fd41441
	.xword	0x02128d30c9dfd94d
	.xword	0xd85bf4f7336fbaea
	.xword	0x471fbaa03ac3da3d
	.xword	0xaed8c5dab1ac08ed
	.xword	0xb1355c87d465bfdc
	.xword	0x7e4087ef0d25fa23
	.xword	0x3426f5316655eca5
	.xword	0xe6d40423ed83f763
	.xword	0x9e3ec9f5380e3962
	.xword	0x55b6675ccb91ebac
	.xword	0x48afc1ef70f89656
	.xword	0xd94174455888332c
	.xword	0xfd7a98c7a6cb980f
	.xword	0x03d2166b01427eeb
	.xword	0xa44cff055e34dc50
	.xword	0x9d44e29bb7896f7b
	.xword	0x22ffb2d8ffb28471
	.xword	0x987d3f927f782682
	.xword	0xebcf999ae64d0bcd
	.xword	0x7fa874ef80786f9f
	.xword	0xeb69b8fd97ed318c
	.xword	0xf3cc594e04f79542
	.xword	0x37823488ee852ccb
	.xword	0x93e6f60803d54a4b
	.xword	0x09e607852a566136
	.xword	0x78e52dda53e8b327
	.xword	0x683cbd4aa7dd1ebf
	.xword	0xcebbdf584f0b91ba
	.xword	0x7b9da5f9e1f2c7a6
	.xword	0xb7a6c832cafaa805
	.xword	0x5387433abb73b74e
	.xword	0xec0825c0181a4184
	.xword	0x2dec90b2bacd5f80



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
	.xword	0xa25c2af06b5a2413
	.xword	0x68d540e5b906737d
	.xword	0xcdb6156662ed909e
	.xword	0xb1fd9caf3e81b990
	.xword	0x57b57e51bacfa65e
	.xword	0xd2963fdf7669b3f7
	.xword	0x08315751be161f54
	.xword	0xd08cf16f570bd900
	.xword	0x9f11c4103775c5f8
	.xword	0xa2f35e6bfd1b8261
	.xword	0x6c2afd5f61d1fed6
	.xword	0x5d614083ed26edc0
	.xword	0xbcf11c9dada82cfb
	.xword	0x0ce61deaf4c47c26
	.xword	0xc542432624b28c77
	.xword	0x1dc6e1421084556c
	.xword	0xbf28c0b1a7acd5b7
	.xword	0xc2857b04d707da2f
	.xword	0xe3806999ec175633
	.xword	0xf9fa52269c002342
	.xword	0xc3bfd98768504b4f
	.xword	0x9ab4b8b41ea1591b
	.xword	0xec55d2a75e6a7876
	.xword	0x9f58fd78c7c593e3
	.xword	0x70b7a8b17b8845d5
	.xword	0xa02fc27ced864cdd
	.xword	0x1643e5f751775d0c
	.xword	0xa4482b44ba56f3a3
	.xword	0xbc6c8f91af5be126
	.xword	0x3c6589551d6be017
	.xword	0xc3150bfad7f4c460
	.xword	0x32f02afcaca5a76d
	.xword	0xba9b6fad6becf01c
	.xword	0x3b38b6200a9a9d27
	.xword	0x4159c542845e3b92
	.xword	0xc75426996a40b211
	.xword	0x8faccf2e7177814b
	.xword	0x6d3f235c71510104
	.xword	0xe84d7d250d924af7
	.xword	0xa66aaa0877ebf5c9
	.xword	0x3fdf82160dd24121
	.xword	0x246b16eab34fdd8f
	.xword	0x33f3eb7c0337c0c6
	.xword	0x21a9dd1d29d313dd
	.xword	0x0fba28bac56aae43
	.xword	0x74a7d43b92402976
	.xword	0x0aed2e3e075b51e3
	.xword	0xfa08055168d04be0
	.xword	0x105b4bf1a186635e
	.xword	0xd88db6d5756ff014
	.xword	0x67393b908d6c41ed
	.xword	0xc3ef8ab41653bb15
	.xword	0x96cfef7af5cf1db0
	.xword	0x8bfcd8cf8893e236
	.xword	0xf9e7962232cacc6c
	.xword	0x87552cb4a85c14de
	.xword	0xcb7035c567523754
	.xword	0x57f7025724d66a14
	.xword	0x2a5fbb8c269a5c68
	.xword	0xfd82e40e873e460f
	.xword	0x1349dd0abae7d34e
	.xword	0x6d0864f2e6466e8e
	.xword	0x67d00e32b360171a
	.xword	0xf880cdfc0b4e3ce5
	.xword	0x4406febd9921b6dd
	.xword	0x6298040bd8c94718
	.xword	0x0ce2e91d0d9a8eae
	.xword	0x6ca4232ae54e2b05
	.xword	0xcbeb1565d4d94e61
	.xword	0x12bea072cb096fac
	.xword	0x6fe9de3835825c25
	.xword	0xb236c4f8d336c98c
	.xword	0x1469b414930d21c4
	.xword	0xb0cd1f8f26307dc7
	.xword	0xe9d1337fc68c332b
	.xword	0x6406e9c019d91460
	.xword	0xbd242b850ada2a4f
	.xword	0xf1dcdc502207a8eb
	.xword	0xb34f8463b37fe80f
	.xword	0xd516b16d27fbb5af
	.xword	0xef0c1a98d77ffaa9
	.xword	0x1b8935c1cead2744
	.xword	0x41887ae023075fc8
	.xword	0x87a5b60536888fb4
	.xword	0x87d22f62f761f96f
	.xword	0xc42719e2f2b6c6b1
	.xword	0xd1aaae1e32355f83
	.xword	0x3c980d1ee1f1a6ac
	.xword	0xfc1e157693f4bce0
	.xword	0x34d58d9467221e9a
	.xword	0xfee6e233603459b9
	.xword	0x74caa6fcbda32611
	.xword	0x694d2c7e2a440cca
	.xword	0xcec3e6d7a1c73e8f
	.xword	0x59cc19e6cf1a1114
	.xword	0xca94c4df63c8a8c3
	.xword	0x5be66d855119d7aa
	.xword	0xb8baa25d7b692d74
	.xword	0x1fcf33f12026a060
	.xword	0xc2afd8a902c8ed0b
	.xword	0x345e8350e5800e16
	.xword	0xf6dc5cf209cf2329
	.xword	0xca20fab50e29df84
	.xword	0xeecc5c6055ef9e9a
	.xword	0x646f9c93cb7d2d8d
	.xword	0xe9dfa4660425e6d7
	.xword	0x52a405756d5727f6
	.xword	0x0acde6a6b6ef33d6
	.xword	0x5fd6aab690de9814
	.xword	0x73c37eb1d3f98b4d
	.xword	0x14609b492a939f7a
	.xword	0x8b6f70dc5026265f
	.xword	0x45f8236a60579fe6
	.xword	0x8efd297da4117734
	.xword	0x785bdd5dc51952f6
	.xword	0xe9fb12f616c17f8f
	.xword	0x943bec6b49909dab
	.xword	0x415c3d8b2989e330
	.xword	0x2bcb5da7dd921407
	.xword	0x405e0aefa247f567
	.xword	0xaf4ff87dc099635f
	.xword	0x1f0d77bed935393c
	.xword	0xa10f112d5aed8695
	.xword	0x0324c06603f0c2e7
	.xword	0x859ae8237f3ca488
	.xword	0x7b5f0ce2841016b1
	.xword	0x1c63eb8994afa27b
	.xword	0x3ff793790052e913
	.xword	0x3df0a4a62f59d201
	.xword	0xcacdfe860598335f
	.xword	0x79559c00a51c0894
	.xword	0xb3b7e771ee68e16c
	.xword	0x01b69e6ecf325cc4
	.xword	0x8684a1f8554b9e4a
	.xword	0x9247037282b008d4
	.xword	0xde9fc01c6c4b1d69
	.xword	0xbf9c26092997f80c
	.xword	0xfd380eaffc6a57ef
	.xword	0x69b0e190e8922c8e
	.xword	0xb53604a0cd81f844
	.xword	0xa6bc0a62be12c69e
	.xword	0xdbebd6018c0873ec
	.xword	0x724e52b6b03bcd63
	.xword	0xc51a67c93b6905d4
	.xword	0x3145c83df693ceb2
	.xword	0x4453676322dc3880
	.xword	0xd78a7fced54dbbe3
	.xword	0xe5f436826c3b877a
	.xword	0xea019c361d3a6148
	.xword	0xeb6f61fddf8600de
	.xword	0xb893a0631c98548f
	.xword	0x5cc642c1a728ba89
	.xword	0xf993b813b0380135
	.xword	0x537d3c06839b4f0c
	.xword	0x98ec3312e4133537
	.xword	0xeb69000d08eb7935
	.xword	0xa4c48ee8b05156d7
	.xword	0x3714c655e34bd6ee
	.xword	0x640bbf97efb30e09
	.xword	0x7a0d06b74f82ea1c
	.xword	0x266ea99b1d5d3c8e
	.xword	0x9c2618d03bb784eb
	.xword	0xb2e492819d967d45
	.xword	0x4e4184f828eefbc5
	.xword	0x15ef1005d88e332b
	.xword	0x0429e104eac731e0
	.xword	0x5fddfd0e2e82b394
	.xword	0x4b5294683ecc3f77
	.xword	0x5f07b4273a5dabbb
	.xword	0x43c9fc6b8354b104
	.xword	0xbe0cca2d286d294d
	.xword	0x598a6d84a6d50723
	.xword	0x535a669cfee6f5dc
	.xword	0x26b85eda0ab5bd0d
	.xword	0x4eb88d0afec43c9d
	.xword	0xa93e2871f99ca158
	.xword	0x8ce50846355ddd0c
	.xword	0x8e137c718517a699
	.xword	0xf1b21d8dc16963d0
	.xword	0x2ed286d5fb674514
	.xword	0xcfb61812a6e5382d
	.xword	0x60f1f23e7ce39b35
	.xword	0xe5561998aad250bf
	.xword	0xfafd4be29e6a0248
	.xword	0x796ec2ef17efebc0
	.xword	0xc37faeb59b3ca351
	.xword	0xdc03953a950e93b6
	.xword	0xea306b7b5fcbb697
	.xword	0x3c85e9e1c7010991
	.xword	0x431ae87989e49b92
	.xword	0x6cbbc23a6a0db54e
	.xword	0x249d380be56d6661
	.xword	0xb8901478c5541e5f
	.xword	0x0f6dcee59b45dbaa
	.xword	0xa81072dd75ea34ee
	.xword	0x2dad460e12b1cbcd
	.xword	0x38c21036e765b2a2
	.xword	0x6084090b49c19b9a
	.xword	0x64fa93e6a50f99f4
	.xword	0x53ae341db63d6c6c
	.xword	0x43baeb6e8399b76c
	.xword	0xc370f0b6dd499d18
	.xword	0x950f8ad2b86a5cdb
	.xword	0x73338953d032114d
	.xword	0x9e1cd502aeff901e
	.xword	0x6865c706206c640b
	.xword	0x250f047f3e13e1a6
	.xword	0x6921c84df789e101
	.xword	0xad5e799a8b63f603
	.xword	0x62f285f6586535a9
	.xword	0xc7aee022eba3de60
	.xword	0x4e0e52d2b7f542e3
	.xword	0x062f8d36ee9fce00
	.xword	0x0dec6117fa2f2b0b
	.xword	0x4142d013021912a9
	.xword	0x6bcf33e24c90898f
	.xword	0x5300c46987da6e60
	.xword	0xab9d4325fe48503d
	.xword	0xc828c20944935172
	.xword	0x00cff4fd4a994395
	.xword	0x789fec9f53a9adc9
	.xword	0x4a2a8a365fe6221c
	.xword	0x32a2b3b768d99928
	.xword	0x38663128c64f17d3
	.xword	0x9594b5635316c8de
	.xword	0xefdb3b8fdf7ca8a7
	.xword	0x7e3f4ce2b20c5223
	.xword	0x9de47c35ed545736
	.xword	0xfb1758706bc61fe1
	.xword	0xf94699528330f78a
	.xword	0xa585475964b3579c
	.xword	0x6f146569319a6bd2
	.xword	0x11029046cd3d3e93
	.xword	0x40b89e930aa9c6ce
	.xword	0x6e832c93ad71246a
	.xword	0xee49f459cab2f9da
	.xword	0x830a6071cc27a19f
	.xword	0x758c48326ccd9588
	.xword	0xf04729a32722d453
	.xword	0xeeabba8c373234e6
	.xword	0x0744c42850b40655
	.xword	0x2e24678eb97bcd78
	.xword	0x3f86c15eb14ebd25
	.xword	0xf6a034c532757354
	.xword	0xe89efae492604464
	.xword	0x93bd471c5b68055b
	.xword	0x709b145b664d3f37
	.xword	0xad936a274e7e1e4f
	.xword	0xbdcbc54fae952058
	.xword	0x3387dd3e26bdfae3
	.xword	0x52cf7f8d613f757e
	.xword	0x2f82f618a3c5c377
	.xword	0x0b9ffe02c1bd5797
	.xword	0xdbfdd79323bbbb89
	.xword	0xe700b90aab256bc6
	.xword	0xa363ee0a6c3ccf89



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
	.xword	0x1faeac2c2dfec975
	.xword	0x371fc56b250bd37a
	.xword	0x7a7b01b05729820d
	.xword	0xc3df0637989d74b4
	.xword	0x07b151f76483eeca
	.xword	0x2f164be922c88345
	.xword	0x6c879b02f5a46e6b
	.xword	0x6d90aad855bcb878
	.xword	0x99c7ea476db2f659
	.xword	0x2a5882f31376c649
	.xword	0xe1a66c91b97f8a00
	.xword	0xe628f13e0ee7c554
	.xword	0x993c53bab5585108
	.xword	0xd54e222ee02e7019
	.xword	0xee1e8f1b23c2fad3
	.xword	0x5c0dabaa86b9b1cd
	.xword	0xb02d5e87ae587de1
	.xword	0x58795689b40f8358
	.xword	0x297db30eca65cb0a
	.xword	0xcd6d908aa77f9b2d
	.xword	0xd7451b502b3911cf
	.xword	0xfffafea4d0cfb9ad
	.xword	0x513bde4d8114d3f6
	.xword	0xdb128834ee72163c
	.xword	0x8d875a60ec5279f9
	.xword	0x9a6a9b43e76cd283
	.xword	0xa841ea3134fbf3e4
	.xword	0xebc2a712877b8dcb
	.xword	0xeb2071e287d948cd
	.xword	0xd4b307a347a223a6
	.xword	0xf22caced731d2ca3
	.xword	0xbda3bc61e3a97b91
	.xword	0xa1ba57b9766de5bb
	.xword	0xe0a4261a933af882
	.xword	0x55853b03a28bae3a
	.xword	0xc83926f69d4ec311
	.xword	0xdad7a402d722e540
	.xword	0xe46665d31206867f
	.xword	0x2787a39a9c9e8783
	.xword	0x86394e92e6f8fa3b
	.xword	0xf77712f90680ab1c
	.xword	0x0a0935c36429405f
	.xword	0x78fae43a5a31e058
	.xword	0x763603a9a7aa4ccf
	.xword	0x5f8b4cc2791d2c92
	.xword	0x4f25cb2a5fe34991
	.xword	0x42088dc4dda15e0b
	.xword	0x1c09e75a61a9dc11
	.xword	0x9265ccd181c2fbf0
	.xword	0x8f019628311d4c96
	.xword	0x711920b0f1928941
	.xword	0x4e5966e65c958930
	.xword	0x1114d88616303e04
	.xword	0xb138f21277b25a60
	.xword	0x06f4fb8552fcbc51
	.xword	0xfb4e6af23e7b932b
	.xword	0x3e63991ad7ecf1d1
	.xword	0xbee24fc7a0f63a8b
	.xword	0xfe260891ffa89675
	.xword	0x257bd6995f684f5b
	.xword	0x41efd4c31ed24c6e
	.xword	0xfbd83fa20aadc02a
	.xword	0xd9a629844fc75d56
	.xword	0x075273979a66b289
	.xword	0x8f826e91d96e4b19
	.xword	0x00f2b9f963716276
	.xword	0xce9572a894e4c646
	.xword	0x5eadc0b8e319a52e
	.xword	0xcbc6f14d9a307c76
	.xword	0x21e725cc7c5367dc
	.xword	0x585d777c46f45624
	.xword	0x9df44bbb1f4daa0e
	.xword	0xda6b0ef0a284a1d7
	.xword	0x29d7971749636cea
	.xword	0xec78a3a3e916805e
	.xword	0xf496978e3f4a6195
	.xword	0x7532eb7ae197627b
	.xword	0xeeaf3f315d4e8356
	.xword	0xf389261d97dbd4b3
	.xword	0x10f5f252ed57fd65
	.xword	0xa1b2878dbaea795b
	.xword	0xb874354627248bdc
	.xword	0xc8bb4376063dc7cb
	.xword	0x30841da262af685e
	.xword	0xb67c0e2bb9344627
	.xword	0xe2c228ebc36735d0
	.xword	0x1c631515f351a2a5
	.xword	0xd71d60ad0ce8ac46
	.xword	0xd41438b2c4c53d25
	.xword	0x788e832151a92981
	.xword	0xebc4d804a1e334cf
	.xword	0xf8ec852a0fe23c45
	.xword	0xf93deaccbafebe2b
	.xword	0x0a25ef99bd39f291
	.xword	0xfc56ad08f25f40ee
	.xword	0xc5da9de3d66d5d62
	.xword	0x4e518c5922a3d183
	.xword	0xe04cc6348deb094a
	.xword	0x0037dc1d8c85b102
	.xword	0x03f981698df50b4d
	.xword	0x32a220ca8a09111d
	.xword	0x0fb6014542ce1ed5
	.xword	0xfbef9cb93fcd55a1
	.xword	0xaa5d22e0ecb8bd46
	.xword	0x3ebaedf9eb36d2d8
	.xword	0xbaaca8c11f4f5478
	.xword	0x0b510be3b9fd5048
	.xword	0xc31c56aee9472962
	.xword	0x329e76ff34ee0bec
	.xword	0x594c89e1d85f1f19
	.xword	0x3567a148c626bd69
	.xword	0x4c1e06455ee9a5a2
	.xword	0xe641d39986db69bc
	.xword	0x4e4adc542939f3a5
	.xword	0xbf3b05ef20d5a4db
	.xword	0x43fd43456fe0cff7
	.xword	0xe6df7e3106460d04
	.xword	0x5a18b00edb532ad3
	.xword	0x645b598cadd7adbe
	.xword	0xf45bbc8ddce606a4
	.xword	0xe4fc1daa192365c7
	.xword	0x363ee4ee8e57b899
	.xword	0x38038d976fd5a814
	.xword	0x9fa791ac236c5fc3
	.xword	0xb6a6cc0c6a32f3a9
	.xword	0x36a1ba1203d52f85
	.xword	0xa2f36446b0a925d3
	.xword	0x6059d6e16f54f977
	.xword	0xedbeb5c7798750dc
	.xword	0x93d450213bc316de
	.xword	0xaa8e468e742432a9
	.xword	0xf53612b7dcdef9ef
	.xword	0x42834cb07bcf1a6f
	.xword	0x4b632d5b4db372ba
	.xword	0x29b8ad8e1e836103
	.xword	0x914222cb4cadeacb
	.xword	0xeeb267490eebf37d
	.xword	0x9b7699b3186b71a7
	.xword	0xdbbab8d1ea391974
	.xword	0x133e220c85b908de
	.xword	0xf6a42ea51f02c0cb
	.xword	0x53c68fa94c6b9155
	.xword	0x6cbbd6f86a611b8a
	.xword	0xf7ebb1d16679e86a
	.xword	0x4184704549c5b8a3
	.xword	0x3af683e914c401ef
	.xword	0xc7bee6a918c74c57
	.xword	0x7f78f87f625b4a5c
	.xword	0xd9cb79f6791b4a1b
	.xword	0xe4522a5f9ded6b1f
	.xword	0x2054cfc70a846f32
	.xword	0x51fe8465c0f7f4d3
	.xword	0xe589598585d3a292
	.xword	0x366026e4b1e4c9f8
	.xword	0xba468dfff9c4453f
	.xword	0xaf11aebd4fa173bb
	.xword	0xea4f6fe606060cc2
	.xword	0xb68b3c60e56aa580
	.xword	0x3d6cbc70618ab3a6
	.xword	0xef066df1c9f5d582
	.xword	0x9a27740930cbdfda
	.xword	0xc3dbe4a68f33175b
	.xword	0xd588b43af0c6e931
	.xword	0x6e04b7d33673ada2
	.xword	0x9332d14ed12c5485
	.xword	0xef782533b35a0041
	.xword	0x7937b115ba10448f
	.xword	0xed29e1cca4c7f387
	.xword	0xd5f3ee96c802e2d5
	.xword	0x36f76e85244ee7c5
	.xword	0x34fc3687d1349291
	.xword	0xc24d984e49794334
	.xword	0x55da5af165f0d099
	.xword	0x4b437306b62f26d1
	.xword	0xcfe48bef91b17c30
	.xword	0xb1b74f8c1ce71211
	.xword	0xbb266b2d0cffd174
	.xword	0xecff1f23d605bb69
	.xword	0xd027e288d38085dd
	.xword	0x6cc9f0bb53d0a6bd
	.xword	0x9b8f71fa6a84057f
	.xword	0x998e444bfe1e1018
	.xword	0xc6755c27bb416fad
	.xword	0xfab51d39ecd754c9
	.xword	0xf85049c26b7b76a1
	.xword	0x96e5aa1a1f9451de
	.xword	0x14526e3573fbcc0f
	.xword	0xb39787b05bf13896
	.xword	0xffebdd9e2ebb8b91
	.xword	0xc7a07255707aea12
	.xword	0x9d38c080668aa86e
	.xword	0x49e0e28e4bdf24c5
	.xword	0x5e0bb44e43d6addc
	.xword	0xd4c97c9c4deb2147
	.xword	0xdeb071a1a13cf46b
	.xword	0xde5c652e25cebfca
	.xword	0x6463910839e8afaa
	.xword	0x89d20f7a9a8b3a1d
	.xword	0xd8488e733b459e5a
	.xword	0x028e2a126249844c
	.xword	0xc230386b70d8b200
	.xword	0x05456574ed18a7de
	.xword	0xd71c54e250c2c713
	.xword	0xb9e61fb4a085316c
	.xword	0xa68dbf27c403329c
	.xword	0x746408c977e05b31
	.xword	0x624d7371ebdae8d4
	.xword	0x0b2cc6009e318f43
	.xword	0x8a2a6aee274f6c2d
	.xword	0xf0ff5706cf712e61
	.xword	0x8c29cac3e3dbd16e
	.xword	0x7e9943e37c4ee785
	.xword	0x74fd0b5fc918b0d0
	.xword	0x81c00cb9dbf08cf1
	.xword	0x5127c3a43be9b31a
	.xword	0x068842b834dffb29
	.xword	0xf584240690dc8594
	.xword	0x8b5ec2143c6139ff
	.xword	0xb0238dfc097f0360
	.xword	0x1742d538ce36c76a
	.xword	0xea4de260b72a55b4
	.xword	0x2faac79856ed097e
	.xword	0x98dbdf7644a87c7a
	.xword	0x5e490d0d229f67b3
	.xword	0x20c0ee6f2967e6b5
	.xword	0x9b5e4490bb36a78e
	.xword	0x1ac252cce4b4efc2
	.xword	0xb773f83688d38a16
	.xword	0x9ea22ffa21fa94a5
	.xword	0xd542bdcfbb3bed43
	.xword	0x0fe21d427b01a78e
	.xword	0x85a208d54c008a14
	.xword	0x86b7561167e1b4a1
	.xword	0x327c864fb49bde3c
	.xword	0xc637bc15c200fb2e
	.xword	0xa4ee0ff2d0ecdcd4
	.xword	0x9b920ddec4aaf2cf
	.xword	0xd8a7443a104a6da1
	.xword	0x824f919c1ae765f4
	.xword	0x4fac3cddd0f417cd
	.xword	0x487951dd6a9d8eb0
	.xword	0x69caf1ae544e509a
	.xword	0x7532210abb1d1078
	.xword	0x93b7bf6197fe0815
	.xword	0x8ff7d0668f991a92
	.xword	0x39dcaad1a6335b18
	.xword	0xd6b81213f3ecf98f
	.xword	0xcce2fc26df521113
	.xword	0x1e2744cd13f5fef6
	.xword	0xf23482b3d7f45f13
	.xword	0x3b6159411c305a62
	.xword	0x05dc5cae283a15e1
	.xword	0xda230859b402aa94
	.xword	0x3330e153c2c5e2d9
	.xword	0xd97db7f8aea91a60
	.xword	0x6145c06fc8e4ad86



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
!!#   int sjm0_w_mask_m_io = 0, sjm1_w_mask_m_io = 0;
!!#   int sjm_rd0_m_io = 0, sjm_wr0_m_io = 0, sjm_rd1_m_io = 0, sjm_wr1_m_io = 0;
!!#   int sjm4_cnt_m_io = 0, sjm5_cnt_m_io = 0;
!!#   int sjm0_data_m_io[8][16];
!!#   int sjm1_data_m_io[8][16];
!!#   uint64 sjm0_addr_m_io[8];
!!#   uint64 sjm1_addr_m_io[8];
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
!!#   int     rnd_n,b_sz;
!!# 
!!# #define ISEG	0
!!# #define MY_HYP_SEC	1
!!# 
!!# %%
!!# %%section control
!!# 
!!# %%
!!# %%section init
!!# {
!!# 
!!# 
!!#   IJ_set_rvar ("diag.j", 108, rv_0, "{11}");
!!# 
!!#   IJ_set_rvar ("diag.j", 111, Rv_rand64, "64'hrrrr rrrr rrrr rrrr");
!!#   IJ_set_rvar ("diag.j", 112, Rv_Simm13, "13'b0 0000 00rr r000");
!!#   IJ_set_rvar ("diag.j", 113, Rv_addr_sel, "3'brrr");
!!# 
!!#   IJ_set_rvar ("diag.j", 117, Rv_memaddr_pattern_dma,
!!#         "24'{0},"
!!# 
!!#         "20'b 000r rrrr rrrr rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rr00 0000,");
!!# 
!!#   ! only 60* or 61*
!!#   IJ_set_rvar ("diag.j", 126, Rv_memaddr_pattern_io,
!!#         "4'{0},"
!!# 
!!#         "20'b 0000 0000 0000 0000 0110,"
!!#         "20'b 000r rrrr rrrr rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rr00 0000,");
!!# 
!!#   IJ_set_rvar ("diag.j", 135, Rv_rand32, "32'hrrrr rrrr");
!!#   IJ_set_rvar ("diag.j", 136, Rv_rand_mask, "32'h0000 rrrr");
!!# 
!!#   IJ_set_rvar ("diag.j", 139, Rv_memaddr_pattern,
!!#         "24'{0},"
!!# 
!!#         "20'b 0001 0000 rrrr 0000 0001,"
!!#         "20'{0}");
!!# 
!!#   ! Define address patterns for all the various address
!!#   ! spaces in JBI
!!# 
!!#   ! 80_1000_0000 - 80_FFFF_FFFF (Should not be 80_0*)
!!#   IJ_set_rvar ("diag.j", 150, Rv_jbiaddr_pattern0,
!!#         "24'{0},"
!!# 
!!#         "20'b 1000 0000 rrrr rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr r000,");
!!# 
!!#   ! 80_0E00_0000 - 80_0EFF_FFFF
!!#   IJ_set_rvar ("diag.j", 159, Rv_jbiaddr_pattern1,
!!#         "24'{0},"
!!# 
!!#         "20'b 1000 0000 0000 1110 rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr r000,");
!!# 
!!#   ! 80_0F00_0000 - 80_0FFF_FFFF
!!#   IJ_set_rvar ("diag.j", 169, Rv_jbiaddr_pattern2,
!!#         "24'{0},"
!!# 
!!#         "20'b 1000 0000 0000 1111 rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr r000,");
!!# 
!!#   ! C0_0000_0000 - CF_FFFF_FFFF
!!#   IJ_set_rvar ("diag.j", 179, Rv_jbiaddr_pattern3,
!!#         "24'{0},"
!!# 
!!#         "20'b 1100 rrrr rrrr rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr r000,");
!!# 
!!#   ! D0_0000_0000 - DF_FFFF_FFFF
!!#   IJ_set_rvar ("diag.j", 189, Rv_jbiaddr_pattern4,
!!#         "24'{0},"
!!# 
!!#         "20'b 1101 rrrr rrrr rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr r000,");
!!# 
!!#   ! E0_0000_0000 - EF_FFFF_FFFF
!!#   IJ_set_rvar ("diag.j", 199, Rv_jbiaddr_pattern5,
!!#         "24'{0},"
!!# 
!!#         "20'b 1110 rrrr rrrr rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr r000,");
!!# 
!!#   ! F0_0000_0000 - FE_FFFF_FFFF ( Should not be FF*)
!!#   IJ_set_rvar ("diag.j", 209, Rv_jbiaddr_pattern6,
!!#         "24'{0},"
!!# 
!!#         "20'b 1111 rrrr rrrr rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr r000,");
!!# 
!!#   ! FF_F000_0000 - FF_FFFF_FFFF 
!!#   IJ_set_rvar ("diag.j", 219, Rv_ssiaddr_pattern,
!!#         "24'{0},"
!!# 
!!#         "20'b 1111 1111 1111 rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr r000,");
!!# 
!!#   ! BYTE ALIGNED
!!# 
!!#   ! 80_1000_0000 - 80_FFFF_FFFF (Should not be 80_0*)
!!#   IJ_set_rvar ("diag.j", 230, Rv_jbi_b_addr_pattern0,
!!#         "24'{0},"
!!# 
!!#         "20'b 1000 0000 rrrr rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr rrrr,");
!!# 
!!#   ! 80_0E00_0000 - 80_0EFF_FFFF
!!#   IJ_set_rvar ("diag.j", 239, Rv_jbi_b_addr_pattern1,
!!#         "24'{0},"
!!# 
!!#         "20'b 1000 0000 0000 1110 rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr rrrr,");
!!# 
!!#   ! 80_0F00_0000 - 80_0FFF_FFFF
!!#   IJ_set_rvar ("diag.j", 249, Rv_jbi_b_addr_pattern2,
!!#         "24'{0},"
!!# 
!!#         "20'b 1000 0000 0000 1111 rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr rrrr,");
!!# 
!!#   ! C0_0000_0000 - CF_FFFF_FFFF
!!#   IJ_set_rvar ("diag.j", 259, Rv_jbi_b_addr_pattern3,
!!#         "24'{0},"
!!# 
!!#         "20'b 1100 rrrr rrrr rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr rrrr,");
!!# 
!!#   ! D0_0000_0000 - DF_FFFF_FFFF
!!#   IJ_set_rvar ("diag.j", 269, Rv_jbi_b_addr_pattern4,
!!#         "24'{0},"
!!# 
!!#         "20'b 1101 rrrr rrrr rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr rrrr,");
!!# 
!!#   ! E0_0000_0000 - EF_FFFF_FFFF
!!#   IJ_set_rvar ("diag.j", 279, Rv_jbi_b_addr_pattern5,
!!#         "24'{0},"
!!# 
!!#         "20'b 1110 rrrr rrrr rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr rrrr,");
!!# 
!!#   ! F0_0000_0000 - FE_FFFF_FFFF ( Should not be FF*)
!!#   IJ_set_rvar ("diag.j", 289, Rv_jbi_b_addr_pattern6,
!!#         "24'{0},"
!!# 
!!#         "20'b 1111 rrrr rrrr rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr rrrr,");
!!# 
!!#   ! FF_F000_0000 - FF_FFFF_FFFF 
!!#   IJ_set_rvar ("diag.j", 299, Rv_ssi_b_addr_pattern,
!!#         "24'{0},"
!!# 
!!#         "20'b 1111 1111 1111 rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr rrrr,");
!!# 
!!#   ! HWORD ADDRESS
!!# 
!!#   ! 80_1000_0000 - 80_FFFF_FFFF (Should not be 80_0*)
!!#   IJ_set_rvar ("diag.j", 311, Rv_jbi_h_addr_pattern0,
!!#         "24'{0},"
!!# 
!!#         "20'b 1000 0000 rrrr rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr rrr0,");
!!# 
!!#   ! 80_0E00_0000 - 80_0EFF_FFFF
!!#   IJ_set_rvar ("diag.j", 320, Rv_jbi_h_addr_pattern1,
!!#         "24'{0},"
!!# 
!!#         "20'b 1000 0000 0000 1110 rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr rrr0,");
!!# 
!!#   ! 80_0F00_0000 - 80_0FFF_FFFF
!!#   IJ_set_rvar ("diag.j", 330, Rv_jbi_h_addr_pattern2,
!!#         "24'{0},"
!!# 
!!#         "20'b 1000 0000 0000 1111 rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr rrr0,");
!!# 
!!#   ! C0_0000_0000 - CF_FFFF_FFFF
!!#   IJ_set_rvar ("diag.j", 340, Rv_jbi_h_addr_pattern3,
!!#         "24'{0},"
!!# 
!!#         "20'b 1100 rrrr rrrr rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr rrr0,");
!!# 
!!#   ! D0_0000_0000 - DF_FFFF_FFFF
!!#   IJ_set_rvar ("diag.j", 350, Rv_jbi_h_addr_pattern4,
!!#         "24'{0},"
!!# 
!!#         "20'b 1101 rrrr rrrr rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr rrr0,");
!!# 
!!#   ! E0_0000_0000 - EF_FFFF_FFFF
!!#   IJ_set_rvar ("diag.j", 360, Rv_jbi_h_addr_pattern5,
!!#         "24'{0},"
!!# 
!!#         "20'b 1110 rrrr rrrr rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr rrr0,");
!!# 
!!#   ! F0_0000_0000 - FE_FFFF_FFFF ( Should not be FF*)
!!#   IJ_set_rvar ("diag.j", 370, Rv_jbi_h_addr_pattern6,
!!#         "24'{0},"
!!# 
!!#         "20'b 1111 rrr0 rrrr rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr rrr0,");
!!# 
!!#   ! FF_F000_0000 - FF_FFFF_FFFF 
!!#   IJ_set_rvar ("diag.j", 380, Rv_ssi_h_addr_pattern,
!!#         "24'{0},"
!!# 
!!#         "20'b 1111 1111 1111 rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr rrr0,");
!!# 
!!#   ! WORD Address
!!# 
!!#   ! 80_1000_0000 - 80_FFFF_FFFF (Should not be 80_0*)
!!#   IJ_set_rvar ("diag.j", 391, Rv_jbi_w_addr_pattern0,
!!#         "24'{0},"
!!# 
!!#         "20'b 1000 0000 rrrr rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr rr00,");
!!# 
!!#   ! 80_0E00_0000 - 80_0EFF_FFFF
!!#   IJ_set_rvar ("diag.j", 400, Rv_jbi_w_addr_pattern1,
!!#         "24'{0},"
!!# 
!!#         "20'b 1000 0000 0000 1110 rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr rr00,");
!!# 
!!#   ! 80_0F00_0000 - 80_0FFF_FFFF
!!#   IJ_set_rvar ("diag.j", 410, Rv_jbi_w_addr_pattern2,
!!#         "24'{0},"
!!# 
!!#         "20'b 1000 0000 0000 1111 rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr rr00,");
!!# 
!!#   ! C0_0000_0000 - CF_FFFF_FFFF
!!#   IJ_set_rvar ("diag.j", 420, Rv_jbi_w_addr_pattern3,
!!#         "24'{0},"
!!# 
!!#         "20'b 1100 rrrr rrrr rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr rr00,");
!!# 
!!#   ! D0_0000_0000 - DF_FFFF_FFFF
!!#   IJ_set_rvar ("diag.j", 430, Rv_jbi_w_addr_pattern4,
!!#         "24'{0},"
!!# 
!!#         "20'b 1101 rrrr rrrr rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr rr00,");
!!# 
!!#   ! E0_0000_0000 - EF_FFFF_FFFF
!!#   IJ_set_rvar ("diag.j", 440, Rv_jbi_w_addr_pattern5,
!!#         "24'{0},"
!!# 
!!#         "20'b 1110 rrrr rrrr rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr rr00,");
!!# 
!!#   ! F0_0000_0000 - FE_FFFF_FFFF ( Should not be FF*)
!!#   IJ_set_rvar ("diag.j", 450, Rv_jbi_w_addr_pattern6,
!!#         "24'{0},"
!!# 
!!#         "20'b 1111 rrrr rrrr rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr rr00,");
!!# 
!!#   ! FF_F000_0000 - FF_FFFF_FFFF 
!!#   IJ_set_rvar ("diag.j", 460, Rv_ssi_w_addr_pattern,
!!#         "24'{0},"
!!# 
!!#         "20'b 1111 1111 1111 rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr rr00,");
!!# 
!!#   ! Other  cases ?? when LOW TH and HG TH are random, HI>LO always (TBD)
!!# 
!!#   IJ_set_rvar ("diag.j", 469, Rv_jbi_fifo_wr0_config,
!!#         "24'{0},"
!!# 
!!#         "20'b 0000 0000 0rrr 0rrr 00rr,"
!!#         "20'b 00rr rrrr 0000 0000 rrrr,");
!!# 
!!#   IJ_set_rvar ("diag.j", 477, Rv_jbi_fifo_wr1_config,
!!#         "24'{0},"
!!# 
!!#         "20'b 0000 0000 0rrr 0rrr 00rr,"
!!#         "20'b 00rr rrrr 1rrr 0000 rrrr,");
!!# 
!!#   IJ_set_ropr_fld    ("diag.j", 485, ijdefault, Ft_Rs1, "{6}");  ! BASE
!!#   IJ_set_ropr_fld    ("diag.j", 486, ijdefault, Ft_Rs2, "{8}");
!!#   IJ_set_ropr_fld    ("diag.j", 487, ijdefault, Ft_Rd, "{16..23}");
!!#   IJ_set_ropr_fld    ("diag.j", 488, Rv_ldstD, Ft_Rd, "{16,18,20,22}");
!!#   IJ_set_ropr_fld    ("diag.j", 489, ijdefault, Ft_Imm_Asi, "{16,17}");
!!# 
!!#   !IJ_set_ropr_fld    (ijdefault, Ft_Simm13, "13'b0 0000 0000 0000");
!!#   IJ_set_ropr_fld    ("diag.j", 494, ijdefault, Ft_Simm13, "13'b0 0000 rrrr r000");
!!# 
!!#   IJ_bind_file_group("diag.j", 497, sjm_4,"sjm_4.cmd", NULL);;
!!#   IJ_bind_file_group("diag.j", 498, sjm_5,"sjm_5.cmd", NULL);;
!!# 
!!#   IJ_bind_thread_group("diag.j", 501, th_M, 0x1);
!!# 
!!#   IJ_printf ("diag.j", 503, sjm_4, "CONFIG id=28 iosyncadr=0x7CF00BEEF00\n");
!!#   IJ_printf ("diag.j", 504, sjm_4, "TIMEOUT 10000000\n");
!!#   IJ_printf ("diag.j", 505, sjm_4, "IOSYNC\n");
!!# 
!!#   IJ_printf ("diag.j", 507, sjm_4, "#==================================================\n");
!!#   IJ_printf ("diag.j", 509, sjm_4, "#==================================================\n");
!!#   IJ_printf ("diag.j", 510, sjm_4, "\n\nLABEL_0:\n");
!!# 
!!#   IJ_printf ("diag.j", 512, sjm_5, "CONFIG id=30 iosyncadr=0x7EF00BEEF00\n");
!!#   IJ_printf ("diag.j", 513, sjm_5, "TIMEOUT 10000000\n");
!!#   IJ_printf ("diag.j", 514, sjm_5, "IOSYNC\n");
!!#   IJ_printf ("diag.j", 515, sjm_5, "#==================================================\n");
!!#   IJ_printf ("diag.j", 517, sjm_5, "#==================================================\n");
!!#   IJ_printf ("diag.j", 518, sjm_5, "\n\nLABEL_0:\n");
!!# 
!!#   IJ_init_regs_by_setx ("diag.j", 522, th_M, 3, 1, Rv_rand64);
!!#   IJ_printf ("diag.j", 523, th_M, "\tmov\t0, %%r8\n");
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
!!#   IJ_printf ("diag.j", 555, sjm_4, "\n\nBA LABEL_0\n");
!!#   IJ_printf ("diag.j", 556, sjm_5, "\n\nBA LABEL_0\n");
!!# 
!!#   int i,j;
!!#   ! Do this else midas wont put any tsbs for the above.
!!#   for (i = 0; i < 16; i++) {
!!#     IJ_iseg_printf("diag.j", 561,ISEG, i, th_M, ".data\n");
!!#     for (j = 0; j < 256; j++) {
!!#     IJ_iseg_printf("diag.j", 563,ISEG, i, th_M, "\t.xword\t0x%016llrx\n", Rv_rand64);
!!#     }
!!#   }
!!# 
!!#   IJ_th_start ("diag.j", 568,Seq_Start, NULL, 2);
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
!!# 		IJ_generate ("diag.j", 696, th_M, $2);
!!# 	}
!!# ;
!!# 
!!# inst_type: set_reg9 set_addr load alu store sjm4 sjm5
!!# !inst_type: set_reg9 set_addr load atomics alu store atomics_asi barier
!!# {
!!# 		IJ_generate ("diag.j", 703, th_M, $3);
!!# 		IJ_generate ("diag.j", 704, th_M, $4);
!!# 		IJ_generate ("diag.j", 705, th_M, $5);
!!# 		!IJ_generate (th_M, $6);
!!# 		!IJ_generate (th_M, $7);
!!# 		!IJ_generate (th_M, $8);
!!# }
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
!!#                    IJ_printf ("diag.j", 723, sjm_4, "\n");
!!#                      sjm4_cnt++;
!!# 
!!#                      sj4_ad =  IJ_get_rvar_val64("diag.j", 726, Rv_memaddr_pattern_dma);
!!#                      sjm0_addr[sjm_wr0] = sj4_ad; 
!!#                      IJ_printf ("diag.j", 728, sjm_4, "WRITEBLK  0x%016llx +\n",sj4_ad);
!!#                      IJ_update_rvar("diag.j", 729, Rv_memaddr_pattern_dma);
!!# 
!!#                       for (i=0;i<16;i++) { 
!!#                          !IJ_printf (sjm_4, "# debug %d \n",i);
!!#                          sjm0_data[sjm_wr0][i] = IJ_get_rvar_val32("diag.j", 733, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 734, Rv_rand32);
!!#                          if (i%4 == 0) {IJ_printf ("diag.j", 735, sjm_4, "        "); }
!!#                          IJ_printf ("diag.j", 736, sjm_4, "0x%08x ",sjm0_data[sjm_wr0][i]);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 738, sjm_4, "\n"); else 
!!#                             IJ_printf ("diag.j", 739, sjm_4, "+\n");
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
!!#                    IJ_printf ("diag.j", 752, sjm_4, "\n");
!!#                      sjm4_cnt--;
!!# 
!!#                      sj4_ad = sjm0_addr[sjm_rd0];
!!#                      IJ_printf ("diag.j", 757, sjm_4, "READBLK  0x%016llx +\n",sj4_ad);
!!# 
!!#                       for (i=0;i<16;i++) { 
!!#                          sjm4_dat = sjm0_data[sjm_rd0][i];
!!#                          if (i%4 == 0) IJ_printf ("diag.j", 761, sjm_4, "        ");
!!#                          IJ_printf ("diag.j", 762, sjm_4, "0x%08x ",sjm4_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 764, sjm_4, "\n"); else 
!!#                             IJ_printf ("diag.j", 765, sjm_4, "+\n");
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
!!#                    IJ_printf ("diag.j", 779, sjm_4, "\n");
!!#                      !sjm4_cnt--;
!!# 
!!#  		     sjm0_w_mask =  IJ_get_rvar_val32("diag.j", 783, Rv_rand_mask);
!!#                      IJ_update_rvar("diag.j", 784, Rv_rand_mask);
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
!!#                      IJ_printf ("diag.j", 801, sjm_4, "WRITEMSK  0x%016llx 0x%016llx +\n",sj4_ad,mask);
!!# 
!!#                       m_tmp = sjm0_w_mask;
!!#                       for (i=0;i<16;i++) { 
!!#                        if (m_tmp & 0x1 ) {
!!#                          sjm0_data[sjm_rd0][i] = IJ_get_rvar_val32("diag.j", 806, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 807, Rv_rand32);
!!#                          sjm4_dat = sjm0_data[sjm_rd0][i];
!!#                          if (i%4 == 0) IJ_printf ("diag.j", 809, sjm_4, "        ");
!!#                          IJ_printf ("diag.j", 810, sjm_4, "0x%08x ",sjm4_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 812, sjm_4, "\n"); else 
!!#                             IJ_printf ("diag.j", 813, sjm_4, "+\n");
!!#                            }
!!#                         } else {
!!#                          !sjm4_dat = sjm0_data[sjm_rd0][i];
!!#                          sjm4_dat = 0;
!!#                          if (i%4 == 0) IJ_printf ("diag.j", 818, sjm_4, "        ");
!!#                          IJ_printf ("diag.j", 819, sjm_4, "0x%08x ",sjm4_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 821, sjm_4, "\n"); else 
!!#                             IJ_printf ("diag.j", 822, sjm_4, "+\n");
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
!!#                    IJ_printf ("diag.j", 839, sjm_4, "\n");
!!#                      sjm4_cnt_io++;
!!# 
!!#                      sj4_ad =  IJ_get_rvar_val64("diag.j", 842, Rv_memaddr_pattern_io);
!!#                      sjm0_addr_io[sjm_wr0_io] = sj4_ad; 
!!#                      IJ_printf ("diag.j", 844, sjm_4, "WRITEBLKIO  0x%016llx +\n",sj4_ad);
!!#                      IJ_update_rvar("diag.j", 845, Rv_memaddr_pattern_io);
!!# 
!!#                       for (i=0;i<16;i++) { 
!!#                          !IJ_printf (sjm_4, "# debug %d \n",i);
!!#                          sjm0_data_io[sjm_wr0_io][i] = IJ_get_rvar_val32("diag.j", 849, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 850, Rv_rand32);
!!#                          if (i%4 == 0) {IJ_printf ("diag.j", 851, sjm_4, "        "); }
!!#                          IJ_printf ("diag.j", 852, sjm_4, "0x%08x ",sjm0_data_io[sjm_wr0_io][i]);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 854, sjm_4, "\n"); else 
!!#                             IJ_printf ("diag.j", 855, sjm_4, "+\n");
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
!!#                    IJ_printf ("diag.j", 868, sjm_4, "\n");
!!#                      sjm4_cnt_io--;
!!# 
!!#                      sj4_ad = sjm0_addr_io[sjm_rd0_io];
!!#                      IJ_printf ("diag.j", 873, sjm_4, "READBLKIO  0x%016llx +\n",sj4_ad);
!!# 
!!#                       for (i=0;i<16;i++) { 
!!#                          sjm4_dat = sjm0_data_io[sjm_rd0_io][i];
!!#                          if (i%4 == 0) IJ_printf ("diag.j", 877, sjm_4, "        ");
!!#                          IJ_printf ("diag.j", 878, sjm_4, "0x%08x ",sjm4_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 880, sjm_4, "\n"); else 
!!#                             IJ_printf ("diag.j", 881, sjm_4, "+\n");
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
!!#                    IJ_printf ("diag.j", 896, sjm_4, "\n");
!!#                      sjm4_cnt_io1++;
!!# 
!!#                      sj4_ad =  IJ_get_rvar_val64("diag.j", 899, Rv_memaddr_pattern_io);
!!#                      sjm0_addr_io1[sjm_wr0_io1] = sj4_ad; 
!!#                      IJ_printf ("diag.j", 901, sjm_4, "WRITEIO  0x%016llx ",sj4_ad);
!!#                      IJ_update_rvar("diag.j", 902, Rv_memaddr_pattern_io);
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
!!#                       IJ_printf ("diag.j", 917, sjm_4, "%d ",b_sz);
!!#                       for (i=0;i<4;i++) { 
!!#                          !IJ_printf (sjm_4, "# debug %d \n",i);
!!#                          sjm0_data_io1[sjm_wr0_io1][i] = IJ_get_rvar_val32("diag.j", 920, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 921, Rv_rand32);
!!#                          IJ_printf ("diag.j", 922, sjm_4, "0x%08x ",sjm0_data_io1[sjm_wr0_io1][i]);
!!#                          if((i==0) && ((b_sz == 1) | (b_sz == 2) | (b_sz == 4)) ) break; 
!!#                          if((i==1) && (b_sz == 8)) break; 
!!#                       }
!!#                       if ( random()%2 == 0) {
!!#                       IJ_printf ("diag.j", 927, sjm_4, "\n");
!!#                       } else {
!!#                       IJ_printf ("diag.j", 929, sjm_4, "\n");
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
!!#                    IJ_printf ("diag.j", 943, sjm_4, "\n");
!!#                      sjm4_cnt_io1--;
!!# 
!!#                      sj4_ad = sjm0_addr_io1[sjm_rd0_io1];
!!#                      b_sz   = sjm0_data_io1[sjm_rd0_io1][15];
!!#                      IJ_printf ("diag.j", 949, sjm_4, "READIO  0x%016llx %d ",sj4_ad,b_sz);
!!# 
!!#                       for (i=0;i<4;i++) {
!!#                          sjm4_dat = sjm0_data_io1[sjm_rd0_io1][i];
!!#                          IJ_printf ("diag.j", 953, sjm_4, "0x%08x ",sjm4_dat);
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
!!#                    IJ_printf ("diag.j", 968, sjm_4, "\n");
!!# 
!!#                      sj4_ad =  IJ_get_rvar_val64("diag.j", 970, Rv_memaddr_pattern_io);
!!#                      sjm0_addr_m_io[sjm_wr0_m_io] = sj4_ad; 
!!#                      IJ_update_rvar("diag.j", 972, Rv_memaddr_pattern_io);
!!# 
!!#                      sjm4_cnt_m_io++;
!!# 
!!#  		     sjm0_w_mask_m_io =  IJ_get_rvar_val32("diag.j", 978, Rv_rand_mask);
!!#                      IJ_update_rvar("diag.j", 979, Rv_rand_mask);
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
!!#                      IJ_printf ("diag.j", 1006, sjm_4, "WRITEMSKIO  0x%016llx 0x%04x  ",sj4_ad,mask);
!!#                      sjm0_data_m_io[sjm_wr0_m_io][15] = mask; ! data fifo , 15 stores address
!!# 
!!#                       m_tmp = sjm0_w_mask_m_io & 0xf;
!!#                       for (i=0;i<4;i++) { 
!!#                        if (m_tmp & 0x1 ) {
!!#                          sjm0_data_m_io[sjm_wr0_m_io][i] = IJ_get_rvar_val32("diag.j", 1012, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 1013, Rv_rand32);
!!#                          sjm4_dat = sjm0_data_m_io[sjm_wr0_m_io][i];
!!#                          !if (i%4 == 0) IJ_printf (sjm_4, "        ");
!!#                          IJ_printf ("diag.j", 1016, sjm_4, "0x%08x ",sjm4_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                              IJ_printf ("diag.j", 1018, sjm_4, "\n"); 
!!#                             !if (i==15 ) IJ_printf (sjm_4, "\n"); else 
!!#                             !IJ_printf (sjm_4, "+\n");
!!#                            }
!!#                         } else {
!!#                          !sjm4_dat = sjm0_data[sjm_rd0][i];
!!#                          sjm4_dat = 0;
!!#                          sjm0_data_m_io[sjm_wr0_m_io][i] = sjm4_dat;
!!#                          !if (i%4 == 0) IJ_printf (sjm_4, "        ");
!!#                          IJ_printf ("diag.j", 1027, sjm_4, "0x%08x ",sjm4_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             IJ_printf ("diag.j", 1029, sjm_4, "\n"); 
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
!!#                    IJ_printf ("diag.j", 1047, sjm_4, "\n");
!!#                      sjm4_cnt_m_io--;
!!# 
!!#                      sj4_ad = sjm0_addr_m_io[sjm_rd0_m_io];
!!#                      mask   = sjm0_data_m_io[sjm_rd0_m_io][15];
!!#                      IJ_printf ("diag.j", 1053, sjm_4, "READMSKIO   0x%016llx 0x%04llx  ",sj4_ad,mask);
!!# 
!!#                       for (i=0;i<4;i++) { 
!!#                          sjm4_dat = sjm0_data_m_io[sjm_rd0_m_io][i];
!!#                          !if (i%4 == 0) IJ_printf (sjm_4, "        ");
!!#                          IJ_printf ("diag.j", 1058, sjm_4, "0x%08x ",sjm4_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             IJ_printf ("diag.j", 1060, sjm_4, "\n");
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
!!#                    IJ_printf ("diag.j", 1078, sjm_5, "\n");
!!#                      sjm5_cnt++;
!!# 
!!#                      sj5_ad =  IJ_get_rvar_val64("diag.j", 1081, Rv_memaddr_pattern_dma);
!!#                      sjm1_addr[sjm_wr1] = sj5_ad; 
!!#                      IJ_printf ("diag.j", 1083, sjm_5, "WRITEBLK  0x%016llx +\n",sj5_ad);
!!#                      IJ_update_rvar("diag.j", 1084, Rv_memaddr_pattern_dma);
!!# 
!!#                       for (i=0;i<16;i++) { 
!!#                          sjm1_data[sjm_wr1][i] = IJ_get_rvar_val32("diag.j", 1087, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 1088, Rv_rand32);
!!#                          if (i%4 == 0) IJ_printf ("diag.j", 1089, sjm_5, "        ");
!!#                          IJ_printf ("diag.j", 1090, sjm_5, "0x%08x ",sjm1_data[sjm_wr1][i]);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 1092, sjm_5, "\n"); else 
!!#                             IJ_printf ("diag.j", 1093, sjm_5, "+\n");
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
!!#                    IJ_printf ("diag.j", 1106, sjm_5, "\n");
!!#                      sjm5_cnt--;
!!# 
!!#                      sj5_ad = sjm1_addr[sjm_rd1];
!!#                      IJ_printf ("diag.j", 1111, sjm_5, "READBLK  0x%016llx +\n",sj5_ad);
!!# 
!!#                       for (i=0;i<16;i++) { 
!!#                          sjm5_dat = sjm1_data[sjm_rd1][i];
!!#                          if (i%4 == 0) IJ_printf ("diag.j", 1115, sjm_5, "        ");
!!#                          IJ_printf ("diag.j", 1116, sjm_5, "0x%08x ",sjm5_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 1118, sjm_5, "\n"); else 
!!#                             IJ_printf ("diag.j", 1119, sjm_5, "+\n");
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
!!#                    IJ_printf ("diag.j", 1133, sjm_5, "\n");
!!#                      !sjm4_cnt--;
!!# 
!!#  		     sjm1_w_mask =  IJ_get_rvar_val32("diag.j", 1137, Rv_rand_mask);
!!#                      IJ_update_rvar("diag.j", 1138, Rv_rand_mask);
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
!!#                      IJ_printf ("diag.j", 1155, sjm_5, "WRITEMSK  0x%016llx 0x%016llx +\n",sj5_ad,mask);
!!# 
!!#                       m_tmp = sjm1_w_mask;
!!#                       for (i=0;i<16;i++) { 
!!#                        if (m_tmp & 0x1 ) {
!!#                          sjm1_data[sjm_rd1][i] = IJ_get_rvar_val32("diag.j", 1160, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 1161, Rv_rand32);
!!#                          sjm5_dat = sjm1_data[sjm_rd1][i];
!!#                          if (i%4 == 0) IJ_printf ("diag.j", 1163, sjm_5, "        ");
!!#                          IJ_printf ("diag.j", 1164, sjm_5, "0x%08x ",sjm5_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 1166, sjm_5, "\n"); else 
!!#                             IJ_printf ("diag.j", 1167, sjm_5, "+\n");
!!#                            }
!!#                         } else {
!!#                          !sjm5_dat = sjm1_data[sjm_rd1][i];
!!#                          sjm5_dat = 0;
!!#                          if (i%4 == 0) IJ_printf ("diag.j", 1172, sjm_5, "        ");
!!#                          IJ_printf ("diag.j", 1173, sjm_5, "0x%08x ",sjm5_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 1175, sjm_5, "\n"); else 
!!#                             IJ_printf ("diag.j", 1176, sjm_5, "+\n");
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
!!#                    IJ_printf ("diag.j", 1193, sjm_5, "\n");
!!#                      sjm5_cnt_io++;
!!# 
!!#                      sj5_ad =  IJ_get_rvar_val64("diag.j", 1196, Rv_memaddr_pattern_io);
!!#                      sjm1_addr_io[sjm_wr1_io] = sj5_ad; 
!!#                      IJ_printf ("diag.j", 1198, sjm_5, "WRITEBLKIO  0x%016llx +\n",sj5_ad);
!!#                      IJ_update_rvar("diag.j", 1199, Rv_memaddr_pattern_io);
!!# 
!!#                       for (i=0;i<16;i++) { 
!!#                          !IJ_printf (sjm_5, "# debug %d \n",i);
!!#                          sjm1_data_io[sjm_wr1_io][i] = IJ_get_rvar_val32("diag.j", 1203, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 1204, Rv_rand32);
!!#                          if (i%4 == 0) {IJ_printf ("diag.j", 1205, sjm_5, "        "); }
!!#                          IJ_printf ("diag.j", 1206, sjm_5, "0x%08x ",sjm1_data_io[sjm_wr1_io][i]);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 1208, sjm_5, "\n"); else 
!!#                             IJ_printf ("diag.j", 1209, sjm_5, "+\n");
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
!!#                    IJ_printf ("diag.j", 1222, sjm_5, "\n");
!!#                      sjm5_cnt_io--;
!!# 
!!#                      sj5_ad = sjm1_addr_io[sjm_rd1_io];
!!#                      IJ_printf ("diag.j", 1227, sjm_5, "READBLKIO  0x%016llx +\n",sj5_ad);
!!# 
!!#                       for (i=0;i<16;i++) { 
!!#                          sjm5_dat = sjm1_data_io[sjm_rd1_io][i];
!!#                          if (i%4 == 0) IJ_printf ("diag.j", 1231, sjm_5, "        ");
!!#                          IJ_printf ("diag.j", 1232, sjm_5, "0x%08x ",sjm5_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 1234, sjm_5, "\n"); else 
!!#                             IJ_printf ("diag.j", 1235, sjm_5, "+\n");
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
!!#                    IJ_printf ("diag.j", 1251, sjm_5, "\n");
!!#                      sjm5_cnt_io1++;
!!# 
!!#                      sj5_ad =  IJ_get_rvar_val64("diag.j", 1254, Rv_memaddr_pattern_io);
!!#                      sjm1_addr_io1[sjm_wr1_io1] = sj5_ad; 
!!#                      IJ_printf ("diag.j", 1256, sjm_5, "WRITEIO  0x%016llx ",sj5_ad);
!!#                      IJ_update_rvar("diag.j", 1257, Rv_memaddr_pattern_io);
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
!!#                       IJ_printf ("diag.j", 1272, sjm_5, "%d ",b_sz);
!!#                       for (i=0;i<4;i++) { 
!!#                          !IJ_printf (sjm_5, "# debug %d \n",i);
!!#                          sjm1_data_io1[sjm_wr1_io1][i] = IJ_get_rvar_val32("diag.j", 1275, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 1276, Rv_rand32);
!!#                          IJ_printf ("diag.j", 1277, sjm_5, "0x%08x ",sjm1_data_io1[sjm_wr1_io1][i]);
!!#                          if((i==0) && ((b_sz == 1) | (b_sz == 2) | (b_sz == 4)) ) break; 
!!#                          if((i==1) && (b_sz == 8)) break; 
!!#                       }
!!#                       if ( random()%2 == 0) {
!!#                       IJ_printf ("diag.j", 1282, sjm_5, "\n");
!!#                       } else {
!!#                       IJ_printf ("diag.j", 1284, sjm_5, "\n");
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
!!#                    IJ_printf ("diag.j", 1298, sjm_5, "\n");
!!#                      sjm5_cnt_io1--;
!!# 
!!#                      sj5_ad = sjm1_addr_io1[sjm_rd1_io1];
!!#                      b_sz   = sjm1_data_io1[sjm_rd1_io1][15];
!!#                      IJ_printf ("diag.j", 1304, sjm_5, "READIO  0x%016llx %d ",sj5_ad,b_sz);
!!# 
!!#                       for (i=0;i<4;i++) {
!!#                          sjm5_dat = sjm1_data_io1[sjm_rd1_io1][i];
!!#                          IJ_printf ("diag.j", 1308, sjm_5, "0x%08x ",sjm5_dat);
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
!!#                    IJ_printf ("diag.j", 1324, sjm_5, "\n");
!!# 
!!#                      sj5_ad =  IJ_get_rvar_val64("diag.j", 1326, Rv_memaddr_pattern_io);
!!#                      sjm1_addr_m_io[sjm_wr1_m_io] = sj5_ad; 
!!#                      IJ_update_rvar("diag.j", 1328, Rv_memaddr_pattern_io);
!!# 
!!#                      sjm5_cnt_m_io++;
!!# 
!!#  		     sjm1_w_mask_m_io =  IJ_get_rvar_val32("diag.j", 1334, Rv_rand_mask);
!!#                      IJ_update_rvar("diag.j", 1335, Rv_rand_mask);
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
!!#                      IJ_printf ("diag.j", 1362, sjm_5, "WRITEMSKIO  0x%016llx 0x%04x  ",sj5_ad,mask);
!!#                      sjm1_data_m_io[sjm_wr1_m_io][15] = mask; ! data fifo , 15 stores address
!!# 
!!#                       m_tmp = sjm1_w_mask_m_io & 0xf;
!!#                       for (i=0;i<4;i++) { 
!!#                        if (m_tmp & 0x1 ) {
!!#                          sjm1_data_m_io[sjm_wr1_m_io][i] = IJ_get_rvar_val32("diag.j", 1368, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 1369, Rv_rand32);
!!#                          sjm5_dat = sjm1_data_m_io[sjm_wr1_m_io][i];
!!#                          !if (i%4 == 0) IJ_printf (sjm_5, "        ");
!!#                          IJ_printf ("diag.j", 1372, sjm_5, "0x%08x ",sjm5_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                              IJ_printf ("diag.j", 1374, sjm_5, "\n"); 
!!#                             !if (i==15 ) IJ_printf (sjm_5, "\n"); else 
!!#                             !IJ_printf (sjm_5, "+\n");
!!#                            }
!!#                         } else {
!!#                          !sjm5_dat = sjm1_data[sjm_rd1][i];
!!#                          sjm5_dat = 0;
!!#                          sjm1_data_m_io[sjm_wr1_m_io][i] = sjm5_dat;
!!#                          !if (i%4 == 0) IJ_printf (sjm_5, "        ");
!!#                          IJ_printf ("diag.j", 1383, sjm_5, "0x%08x ",sjm5_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             IJ_printf ("diag.j", 1385, sjm_5, "\n"); 
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
!!#                    IJ_printf ("diag.j", 1403, sjm_5, "\n");
!!#                      sjm5_cnt_m_io--;
!!# 
!!#                      sj5_ad = sjm1_addr_m_io[sjm_rd1_m_io];
!!#                      mask   = sjm1_data_m_io[sjm_rd1_m_io][15];
!!#                      IJ_printf ("diag.j", 1409, sjm_5, "READMSKIO   0x%016llx 0x%04llx  ",sj5_ad,mask);
!!# 
!!#                       for (i=0;i<4;i++) { 
!!#                          sjm5_dat = sjm1_data_m_io[sjm_rd1_m_io][i];
!!#                          !if (i%4 == 0) IJ_printf (sjm_5, "        ");
!!#                          IJ_printf ("diag.j", 1414, sjm_5, "0x%08x ",sjm5_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             IJ_printf ("diag.j", 1416, sjm_5, "\n");
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
!!# set_reg9:  set_memaddr9
!!# ;
!!# set_addr:  set_memaddr
!!# ;
!!# 
!!# set_memaddr9: mSET_MEMADDR9
!!#                 {
!!#                         ! add a mechanism to control addr1, addr5 in range ??
!!#                         ! addr
!!#                         ! Update the JBI-CONFIG FIFO parameters
!!#                         invalid_config = 1;
!!#                         while (invalid_config) {
!!#                         if (random()%2) {
!!#                         !if (config_cnt > 500) {
!!#                         jbi_config = IJ_get_rvar_val64("diag.j", 1443, Rv_jbi_fifo_wr0_config);
!!# 			IJ_update_rvar("diag.j", 1444, Rv_jbi_fifo_wr0_config);
!!#                         } else {
!!#                         jbi_config = IJ_get_rvar_val64("diag.j", 1446, Rv_jbi_fifo_wr1_config);
!!# 			IJ_update_rvar("diag.j", 1447, Rv_jbi_fifo_wr1_config);
!!#                         }
!!#                         if (((jbi_config>>24) & 0x7) < ((jbi_config>>28) & 0x7)) {
!!#                         invalid_config = 0;
!!#                          }
!!#                         } config_cnt++;
!!# 
!!#                         if (fr_done == 0) {
!!#                          fr_done = 1;
!!#                         IJ_printf ("diag.j", 1457, th_M, "\tsetx\t0x%016llx, %%r1, %%r9\n",
!!#                                 jbi_config);
!!#                         IJ_printf ("diag.j", 1459, th_M, "\tsetx\t0x8000000008, %%r1, %%r10\n");
!!#                         IJ_printf ("diag.j", 1460, th_M, "\tstx\t%%r9, [%%r10]\n");
!!#                         IJ_printf ("diag.j", 1461, th_M, "\n\n\n");
!!#                         IJ_printf ("diag.j", 1462, th_M, "!***********************************************************************\n");
!!#                         IJ_printf ("diag.j", 1463, th_M, "!IOSYNC cycles to start sjm\n");
!!#                         IJ_printf ("diag.j", 1464, th_M, "!***********************************************************************\n");
!!#                         IJ_printf ("diag.j", 1465, th_M, "\tsetx 0xdeadbeefdeadbeef, %%g1, %%g2\n");
!!#                         IJ_printf ("diag.j", 1466, th_M, "\tsetx 0xcf00beef00, %%g1, %%g3\n");
!!#                         IJ_printf ("diag.j", 1467, th_M, "\tstx %%g2, [%%g3]\n");
!!#                         IJ_printf ("diag.j", 1468, th_M, "!***********************************************************************\n");
!!#                         IJ_printf ("diag.j", 1469, th_M, "!IOSYNC cycles to start sjm\n");
!!#                         IJ_printf ("diag.j", 1470, th_M, "!***********************************************************************\n");
!!#                         IJ_printf ("diag.j", 1471, th_M, "\tsetx 0xdeadbeefdeadbeef, %%g1, %%g2\n");
!!#                         IJ_printf ("diag.j", 1472, th_M, "\tsetx 0xef00beef00, %%g1, %%g3\n");
!!#                         IJ_printf ("diag.j", 1473, th_M, "\tstx %%g2, [%%g3]\n");
!!#                         IJ_printf ("diag.j", 1474, th_M, "\n\n\n");
!!# 
!!#                         }
!!# 
!!#                         mem_ad = IJ_get_rvar_val64("diag.j", 1478, Rv_memaddr_pattern);
!!#                         IJ_update_rvar("diag.j", 1479, Rv_memaddr_pattern);
!!# 
!!#                         jbi0 = IJ_get_rvar_val64("diag.j", 1481, Rv_jbiaddr_pattern0);
!!# 
!!#                         ! to remove address not in dma-fake range
!!#                         while (jbi0 < 550024249344 ) {
!!#                         jbi0 = IJ_get_rvar_val64("diag.j", 1486, Rv_jbiaddr_pattern0);
!!# 			IJ_update_rvar("diag.j", 1487, Rv_jbiaddr_pattern0);
!!#                         }
!!# 
!!#                         jbi1 = IJ_get_rvar_val64("diag.j", 1490, Rv_jbiaddr_pattern1);
!!#                         jbi2 = IJ_get_rvar_val64("diag.j", 1491, Rv_jbiaddr_pattern2);
!!#                         jbi3 = IJ_get_rvar_val64("diag.j", 1492, Rv_jbiaddr_pattern3);
!!#                         jbi4 = IJ_get_rvar_val64("diag.j", 1493, Rv_jbiaddr_pattern4);
!!#                         jbi5 = IJ_get_rvar_val64("diag.j", 1494, Rv_jbiaddr_pattern5);
!!# 
!!#                         jbi6 = IJ_get_rvar_val64("diag.j", 1496, Rv_jbiaddr_pattern6);
!!#                         ! to remove address not in dma-fake range
!!#                         while (jbi6 > 1095216660479)  {
!!#                         jbi6 = IJ_get_rvar_val64("diag.j", 1499, Rv_jbiaddr_pattern6);
!!# 			IJ_update_rvar("diag.j", 1500, Rv_jbiaddr_pattern6);
!!#                         }
!!# 
!!# 			IJ_update_rvar("diag.j", 1503, Rv_jbiaddr_pattern0);
!!# 			IJ_update_rvar("diag.j", 1504, Rv_jbiaddr_pattern1);
!!# 			IJ_update_rvar("diag.j", 1505, Rv_jbiaddr_pattern2);
!!# 			IJ_update_rvar("diag.j", 1506, Rv_jbiaddr_pattern3);
!!# 			IJ_update_rvar("diag.j", 1507, Rv_jbiaddr_pattern4);
!!# 			IJ_update_rvar("diag.j", 1508, Rv_jbiaddr_pattern5);
!!# 			IJ_update_rvar("diag.j", 1509, Rv_jbiaddr_pattern6);
!!# 
!!#                         !addr_sel = random() % 5;
!!# 			!IJ_update_rvar(Rv_addr_sel);
!!# 	                !printf ("!DEBUG: %d, jbi1 = 0x%016llx, jbi2 = 0x%016llx, jbi3 = 0x%016llx, jbi4 = 0x%016llx, jbi5 = 0x%016llx, jbi6 = 0x%016llx \n", addr_sel, jbi1, jbi2,jbi3,jbi4,jbi5,jbi6); 
!!#                         !store_addr = addr_sel;
!!# 
!!#                         !switch (addr_sel) {
!!#                         !case 1 : jbi_addr = jbi1; break;
!!#                         !case 2 : jbi_addr = jbi2; break;
!!#                         !case 3 : jbi_addr = jbi3; break;
!!#                         !case 4 : jbi_addr = jbi4; break;
!!#                         !case 5 : jbi_addr = jbi5; break;
!!#                         !case 0 : jbi_addr = jbi6; break;
!!#                         !default : jbi_addr = jbi5; break;
!!#                         !}
!!# 
!!#                         x_ADDR_ARRAY[x_a_wr_cntr] = jbi0; x_a_wr_cntr = x_a_wr_cntr + 1; ! store the stx address
!!#                         x_ADDR_ARRAY[x_a_wr_cntr] = jbi1; x_a_wr_cntr = x_a_wr_cntr + 1; ! store the stx address
!!#                         x_ADDR_ARRAY[x_a_wr_cntr] = jbi2; x_a_wr_cntr = x_a_wr_cntr + 1; ! store the stx address
!!#                         x_ADDR_ARRAY[x_a_wr_cntr] = jbi3; x_a_wr_cntr = x_a_wr_cntr + 1; ! store the stx address
!!#                         x_ADDR_ARRAY[x_a_wr_cntr] = jbi4; x_a_wr_cntr = x_a_wr_cntr + 1; ! store the stx address
!!#                         x_ADDR_ARRAY[x_a_wr_cntr] = jbi5; x_a_wr_cntr = x_a_wr_cntr + 1; ! store the stx address
!!#                         x_ADDR_ARRAY[x_a_wr_cntr] = jbi6; x_a_wr_cntr = x_a_wr_cntr + 1; ! store the stx address
!!# 
!!#                         for (i=0;i<7;i++) {
!!#                         x_DATA_ARRAY[x_wr_cntr] = IJ_get_rvar_val64("diag.j", 1535, Rv_rand64);
!!# 			IJ_update_rvar("diag.j", 1536, Rv_rand64);
!!#                         data_st = x_DATA_ARRAY[x_wr_cntr];
!!#                         addr_st = x_ADDR_ARRAY[x_a_wr_cntr -7 + i];
!!#                         IJ_printf ("diag.j", 1539, th_M, "\tsetx\t0x%016llx, %%r1, %%r6\n",
!!#                                 addr_st);
!!#                         IJ_printf ("diag.j", 1541, th_M, "\tsetx\t0x%016llx, %%r1, %%r10\n",
!!#                                 data_st);
!!#                         IJ_printf ("diag.j", 1543, th_M, "\tsth\t%%r10, [%%r6]\n");
!!# 
!!#  			! cache able store and load to main memory 
!!#                         if(random()%4 == 0) {
!!#                         IJ_printf ("diag.j", 1547, th_M, "\tsetx\t0x%016llx, %%r1, %%r6\n",
!!#                                 mem_ad);
!!#                         IJ_printf ("diag.j", 1549, th_M, "\tsetx\t0x%016llx, %%r1, %%r10\n",
!!#                                 data_st);
!!#                         if(random()%2) {
!!#                         IJ_printf ("diag.j", 1552, th_M, "\tstx\t%%r10, [%%r6]\n");
!!#                         } else {
!!#                         IJ_printf ("diag.j", 1554, th_M, "\tldx\t[%%r6], %%r10\n"); 
!!#                         }
!!#                         mem_ad = IJ_get_rvar_val64("diag.j", 1556, Rv_memaddr_pattern);
!!#                         IJ_update_rvar("diag.j", 1557, Rv_memaddr_pattern);
!!#                         }
!!# 
!!#                         x_wr_cntr++;
!!#                         } ! end for 
!!# 
!!#                         !IJ_printf (th_M, "\tsetx\t0x%016llx, %%r1, %%r6\n",
!!#                         !        jbi_config);
!!#                         !IJ_printf (th_M, "\tsetx\t0x8000000008, %%r1, %%r10\n");
!!#                         !IJ_printf (th_M, "\tstx\t%%r6, [%%r10]\n");
!!# 
!!#                         ! Loads (1/2/4/8)
!!#                         !for(i=0; i <60; i++){
!!#                         !IJ_printf (th_M, "!\tdata_array = 0x%016llx, addr_array %d = 0x%016llx  \n",b_DATA_ARRAY[i], i,b_ADDR_ARRAY[i]);
!!#                         !}
!!# 
!!#                         ! BYTE LOADS
!!#                         a_addr_sel = random() %500;
!!# 
!!#                         if(x_a_wr_cntr >= 10 ) {
!!#                         while (a_addr_sel + 9 >= x_a_wr_cntr ) {
!!#                         a_addr_sel = random() %500;
!!# 	                !IJ_printf (th_M, "!DEBUG 3: a_addr_sel =  0x%016llx, a_wr_cntr = %d\n", a_addr_sel, a_wr_cntr); 
!!#                          }
!!#                         rnd_cnt = random() % 8; ! 4 ld(.) from random loc which is already stored
!!# 	                !IJ_printf (th_M, "!DEBUG 4: rnd_cnt =  0x%016llx, h_a_wr_cntr= %d,a_addr_sel= %d\n", rnd_cnt,h_a_wr_cntr,a_addr_sel); 
!!#                         while(rnd_cnt > 0 ) {
!!#                         IJ_printf ("diag.j", 1589, th_M, "\tsetx\t0x%016llx, %%r1, %%r12\n",
!!#                                 x_ADDR_ARRAY[rnd_cnt+a_addr_sel]);
!!#                         IJ_printf ("diag.j", 1591, th_M, "\tlduh\t[%%r12], %%r11\n");
!!#                         !data_ld = x_DATA_ARRAY[rnd_cnt+a_addr_sel];
!!#                         !IJ_printf (th_M, "\tsetx\t0x%016llx, %%r1, %%r10\n",
!!#                         !        data_ld);
!!#                         !IJ_printf (th_M, "\tsetx\t0x%016llx, %%r1, %%r14\n",
!!#                         !        0x000000000000ffff);
!!#                         !IJ_printf (th_M, "\tand\t%%r10, %%r14, %%r10\n");
!!#                         !IJ_printf (th_M, "\tcmp\t%%r10, %%r11\n");
!!#                         !IJ_printf (th_M, "\tbne h_bad_end\n");
!!#                         !IJ_printf (th_M, "\tnop\n");
!!# 
!!#  			! cache able store and load to main memory 
!!#                         if(random()%4 == 0) {
!!#                         IJ_printf ("diag.j", 1604, th_M, "\tsetx\t0x%016llx, %%r1, %%r6\n",
!!#                                 mem_ad);
!!#                         IJ_printf ("diag.j", 1606, th_M, "\tsetx\t0x%016llx, %%r1, %%r10\n",
!!#                                 data_st);
!!#                         if(random()%2) {
!!#                         IJ_printf ("diag.j", 1609, th_M, "\tstx\t%%r10, [%%r6]\n");
!!#                         } else {
!!#                         IJ_printf ("diag.j", 1611, th_M, "\tldx\t[%%r6], %%r10\n"); 
!!#                         }
!!#                         mem_ad = IJ_get_rvar_val64("diag.j", 1613, Rv_memaddr_pattern);
!!#                         IJ_update_rvar("diag.j", 1614, Rv_memaddr_pattern);
!!#                         }
!!# 
!!#                         rnd_cnt--;
!!#                          }
!!#                         } ! of if(h_a_wr_cntr >=10)
!!# 
!!#                 }
!!# ;
!!# 
!!# set_memaddr: mSET_MEMADDR
!!#                 {
!!#                       IJ_printf ("diag.j", 1629, th_M, "\tsetx\t0x%016llrx, %%r1, %%r6\n",
!!#                               Rv_memaddr_pattern);
!!#                 }
!!# ;
!!# 
!!# !load: gLOAD 
!!# load: gLOAD  %ropr  Rv_ldstD
!!# ;
!!# 
!!# !store: gSTORE 
!!# store: gSTORE  %ropr  Rv_ldstD
!!# ;
!!# 
!!# alu: gALU 
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
