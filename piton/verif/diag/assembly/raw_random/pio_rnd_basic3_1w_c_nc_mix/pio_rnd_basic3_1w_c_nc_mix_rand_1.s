// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: pio_rnd_basic3_1w_c_nc_mix_rand_1.s
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
   random seed:	593830239
   Jal pio_rnd_basic3_1w_c_nc_mix.j:	
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

	setx 0x2eb273e41f36b0c1, %g1, %g0
	setx 0x183c62fdefea5585, %g1, %g1
	setx 0x135ed3507ebc4ece, %g1, %g2
	setx 0x063b0a9fd4189b93, %g1, %g3
	setx 0x0509320e0e21687b, %g1, %g4
	setx 0x4d63ec074e41e9e1, %g1, %g5
	setx 0x7a446ec02c372a68, %g1, %g6
	setx 0x834ca6eaf85cd5a1, %g1, %g7
	setx 0x296fe60fe840a3c4, %g1, %r16
	setx 0x43c38aeba013206e, %g1, %r17
	setx 0xdb8be4192d820a48, %g1, %r18
	setx 0x0806509410d2b141, %g1, %r19
	setx 0x6e24c8c700dcaa48, %g1, %r20
	setx 0xdba5cd3a1f675fa3, %g1, %r21
	setx 0xbb5d0cccfd450faa, %g1, %r22
	setx 0xcefbf074bfeb2e22, %g1, %r23
	setx 0x016080c3a2093c81, %g1, %r24
	setx 0xa26cd169b624c58c, %g1, %r25
	setx 0x5a37f5307bd37dc2, %g1, %r26
	setx 0xd6b6faf35610baa7, %g1, %r27
	setx 0x32fd2c9fda5eb82d, %g1, %r28
	setx 0xe9550dfb5742f505, %g1, %r29
	setx 0xacb46f5d4e9e8c03, %g1, %r30
	setx 0xd881f11aa3029402, %g1, %r31
	save
	setx 0x571ebc340542b295, %g1, %r16
	setx 0x2c258ff901b25d7e, %g1, %r17
	setx 0x1841b12d7c001c37, %g1, %r18
	setx 0x9a0a7093170c9d46, %g1, %r19
	setx 0xc292aa15b2408f51, %g1, %r20
	setx 0x1f2705fda7e51866, %g1, %r21
	setx 0x12b6d7c10f8fce18, %g1, %r22
	setx 0xf786d398658df737, %g1, %r23
	setx 0x10ef1b6a5360a976, %g1, %r24
	setx 0x89613d759b8e1251, %g1, %r25
	setx 0xf678f7997c1e3c13, %g1, %r26
	setx 0xde246c07ecd6e119, %g1, %r27
	setx 0x357a30390d7061e1, %g1, %r28
	setx 0x1e863ba06576096f, %g1, %r29
	setx 0x79d4ca5d53961543, %g1, %r30
	setx 0x031ca19718c69348, %g1, %r31
	save
	setx 0x8080c525218f4e5f, %g1, %r16
	setx 0xd71b42fd18d8d710, %g1, %r17
	setx 0xb8044035f980a303, %g1, %r18
	setx 0xab4d04f30d21fda8, %g1, %r19
	setx 0x0e444935aa100958, %g1, %r20
	setx 0x5ed03060c1bb5207, %g1, %r21
	setx 0x062ac76b96548f24, %g1, %r22
	setx 0xadcd667fab6d173a, %g1, %r23
	setx 0x19a7c1862128b5bb, %g1, %r24
	setx 0x6a43a6d31003d1be, %g1, %r25
	setx 0xac4ab85834d0f834, %g1, %r26
	setx 0x9b041b6164bb9dca, %g1, %r27
	setx 0x53f329ddd9e4bf70, %g1, %r28
	setx 0x8831106bfdac1878, %g1, %r29
	setx 0xe271eb27d15a44e4, %g1, %r30
	setx 0xa5e5d74d9159d94f, %g1, %r31
	restore
	mov	0, %r8
	setx	0x000000004312f00a, %r1, %r9
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



	setx	0x000000807c5a4cbc, %r1, %r6
	setx	0x3db2fb0269a766d4, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800ebe30fc, %r1, %r6
	setx	0x1370096e3309e40a, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001040100000, %r1, %r6
	setx	0x1370096e3309e40a, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000800f45a8bc, %r1, %r6
	setx	0x451c31a76855863d, %r1, %r10
	sth	%r10, [%r6]
	setx	0x00000010c0100000, %r1, %r6
	setx	0x451c31a76855863d, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000ce2bc4e890, %r1, %r6
	setx	0x312fa720ade4a8e5, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000d0b58381bc, %r1, %r6
	setx	0x67a10acdf639f0a5, %r1, %r10
	sth	%r10, [%r6]
	setx	0x00000010f0100000, %r1, %r6
	setx	0x67a10acdf639f0a5, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000e281544bc8, %r1, %r6
	setx	0x46cb29f920865361, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001040100000, %r1, %r6
	setx	0x46cb29f920865361, %r1, %r10
	stx	%r10, [%r6]
	setx	0x000000fdf65413c4, %r1, %r6
	setx	0xe2099ea71d6b27b5, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001070100000, %r1, %r6
	.word 0xe8498008  ! 2: LDSB_R	ldsb	[%r6 + %r8], %r20
	.word 0xaca18008  ! 3: SUBcc_R	subcc 	%r6, %r8, %r22
	.word 0xe029a048  ! 4: STB_I	stb	%r16, [%r6 + 0x0048]
	setx	0x0000008087626194, %r1, %r6
	setx	0x14e05c5554b0933f, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800e1e6ef0, %r1, %r6
	setx	0x10578768c9063449, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800ff0a7c4, %r1, %r6
	setx	0xeeae696f4dec233e, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000cbd5ad65c0, %r1, %r6
	setx	0x1727ad2a817adb71, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000dc42043bac, %r1, %r6
	setx	0xaf77e69fd40b2c81, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000e9aa69c4dc, %r1, %r6
	setx	0xacf109edb508ecc2, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000f2cbc938c4, %r1, %r6
	setx	0xd3c56c2bc3b0fcb0, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000008087626194, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000fdf65413c4, %r1, %r12
	lduh	[%r12], %r11
	setx	0x0000001070100000, %r1, %r6
	setx	0xd3c56c2bc3b0fcb0, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000e281544bc8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d0b58381bc, %r1, %r12
	lduh	[%r12], %r11
	setx	0x00000010f0100000, %r1, %r6
	.word 0xe041a048  ! 9: LDSW_I	ldsw	[%r6 + 0x0048], %r16
	.word 0xa0b9a008  ! 10: XNORcc_I	xnorcc 	%r6, 0x0008, %r16
	.word 0xe0398008  ! 11: STD_R	std	%r16, [%r6 + %r8]
	setx	0x00000080d2bc74b0, %r1, %r6
	setx	0x570d9ddfa4ac1769, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800e866eec, %r1, %r6
	setx	0x58232219b4412cbc, %r1, %r10
	sth	%r10, [%r6]
	setx	0x00000010f0100000, %r1, %r6
	setx	0x58232219b4412cbc, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000800ff2c538, %r1, %r6
	setx	0xb267d603fab05d50, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000c7e88b3e50, %r1, %r6
	setx	0x2c5eddc52c7ec666, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000d8816f3cb8, %r1, %r6
	setx	0x0ab9f85e527e85f2, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000e07222abc0, %r1, %r6
	setx	0x6aca2136a1a2e737, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000f4cfee5144, %r1, %r6
	setx	0x0c3640680121a4cf, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001060100000, %r1, %r6
	.word 0xec09a008  ! 16: LDUB_I	ldub	[%r6 + 0x0008], %r22
	.word 0xae31a048  ! 17: ORN_I	orn 	%r6, 0x0048, %r23
	.word 0xe4718008  ! 18: STX_R	stx	%r18, [%r6 + %r8]
	setx	0x000000808fa79ac8, %r1, %r6
	setx	0x5ab88034b4c7dc6f, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800e4cd2c0, %r1, %r6
	setx	0xc5a39122e36de4c5, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800f0c4dcc, %r1, %r6
	setx	0xd477fb2d569e455f, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001060100000, %r1, %r6
	setx	0xd477fb2d569e455f, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000c0a7441400, %r1, %r6
	setx	0x3674c61885e352a3, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000dcbb680ef4, %r1, %r6
	setx	0x2aa56798432cee6b, %r1, %r10
	sth	%r10, [%r6]
	setx	0x00000010c0100000, %r1, %r6
	setx	0x2aa56798432cee6b, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000e8f6054b30, %r1, %r6
	setx	0x7dac4cd87eab1343, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000fb1459f4dc, %r1, %r6
	setx	0x0617e32b51ae2dfe, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001060100000, %r1, %r6
	.word 0xe001a048  ! 23: LDUW_I	lduw	[%r6 + 0x0048], %r16
	.word 0xaa298008  ! 24: ANDN_R	andn 	%r6, %r8, %r21
	.word 0xec218008  ! 25: STW_R	stw	%r22, [%r6 + %r8]
	setx	0x0000008034921ff0, %r1, %r6
	setx	0xc99a280e80b937a9, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800e432c4c, %r1, %r6
	setx	0x4aacb9308b4cd540, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001060100000, %r1, %r6
	setx	0x4aacb9308b4cd540, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000800f3ffa10, %r1, %r6
	setx	0x38391e6bd618267c, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000cae9c7315c, %r1, %r6
	setx	0x4ce6080331d8ada5, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000d9eac0cd38, %r1, %r6
	setx	0x2d753d6aa9e89668, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000e186e0e538, %r1, %r6
	setx	0x672c74139ac36993, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000f7993de420, %r1, %r6
	setx	0xe1b0e9d26099098b, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001040100000, %r1, %r6
	setx	0xe1b0e9d26099098b, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000fdf65413c4, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000e281544bc8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x0000001010100000, %r1, %r6
	setx	0xe1b0e9d26099098b, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000d0b58381bc, %r1, %r12
	lduh	[%r12], %r11
	setx	0x0000001080100000, %r1, %r6
	setx	0xe1b0e9d26099098b, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000ce2bc4e890, %r1, %r12
	lduh	[%r12], %r11
	setx	0x0000001000100000, %r1, %r6
	.word 0xe451a048  ! 30: LDSH_I	ldsh	[%r6 + 0x0048], %r18
	.word 0xa841a068  ! 31: ADDC_I	addc 	%r6, 0x0068, %r20
	.word 0xe471a068  ! 32: STX_I	stx	%r18, [%r6 + 0x0068]
	setx	0x00000080a5d68530, %r1, %r6
	setx	0x598fabc55dd4ce9c, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800e6030fc, %r1, %r6
	setx	0x8a9f100169ed7ab3, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001000100000, %r1, %r6
	setx	0x8a9f100169ed7ab3, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000800fa01d60, %r1, %r6
	setx	0x9b40b5a801445403, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000c15f603be8, %r1, %r6
	setx	0xe5e2ba5460d02bcd, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001010100000, %r1, %r6
	setx	0xe5e2ba5460d02bcd, %r1, %r10
	stx	%r10, [%r6]
	setx	0x000000d4117a80e4, %r1, %r6
	setx	0xb25fd672911d3c52, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001030100000, %r1, %r6
	setx	0xb25fd672911d3c52, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000e921d71fbc, %r1, %r6
	setx	0x988aa2968d3f764f, %r1, %r10
	sth	%r10, [%r6]
	setx	0x00000010c0100000, %r1, %r6
	setx	0x988aa2968d3f764f, %r1, %r10
	stx	%r10, [%r6]
	setx	0x000000f496c41870, %r1, %r6
	setx	0x536a04df6929deee, %r1, %r10
	sth	%r10, [%r6]
	setx	0x00000010c0100000, %r1, %r6
	.word 0xe4598008  ! 37: LDX_R	ldx	[%r6 + %r8], %r18
	.word 0xae41a0d0  ! 38: ADDC_I	addc 	%r6, 0x00d0, %r23
	.word 0xe431a0d0  ! 39: STH_I	sth	%r18, [%r6 + 0x00d0]
	setx	0x00000080cff818d0, %r1, %r6
	setx	0xcc12d525e2e65f37, %r1, %r10
	sth	%r10, [%r6]
	setx	0x00000010c0100000, %r1, %r6
	setx	0xcc12d525e2e65f37, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000800e6b9870, %r1, %r6
	setx	0xe63ceeeb5b2f0b7a, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800f855f60, %r1, %r6
	setx	0x7bb12d5cc2a4c0fe, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000c8c0259cbc, %r1, %r6
	setx	0xb954f8898aabb167, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000d29f034038, %r1, %r6
	setx	0x5bb99242f87a4bb5, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000e6ebadf248, %r1, %r6
	setx	0x5d753180738b438d, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000fb35771574, %r1, %r6
	setx	0x1df5d1f2320b87b8, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000cbd5ad65c0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800ff0a7c4, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e1e6ef0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x0000001060100000, %r1, %r6
	.word 0xec598008  ! 44: LDX_R	ldx	[%r6 + %r8], %r22
	.word 0xa499a008  ! 45: XORcc_I	xorcc 	%r6, 0x0008, %r18
	.word 0xe4718008  ! 46: STX_R	stx	%r18, [%r6 + %r8]
	setx	0x00000080cb449660, %r1, %r6
	setx	0x5411617bf9e06f27, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001060100000, %r1, %r6
	setx	0x5411617bf9e06f27, %r1, %r10
	stx	%r10, [%r6]
	setx	0x000000800e8f82bc, %r1, %r6
	setx	0x2cc548c3a2a9d780, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800f4d48d4, %r1, %r6
	setx	0x0d29b2f61f27cf37, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000cb9fd4bc00, %r1, %r6
	setx	0x46b2278fb49e9934, %r1, %r10
	sth	%r10, [%r6]
	setx	0x00000010f0100000, %r1, %r6
	setx	0x46b2278fb49e9934, %r1, %r10
	stx	%r10, [%r6]
	setx	0x000000dabdefc39c, %r1, %r6
	setx	0xd80030a6c45b2b64, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000eda5bc6c2c, %r1, %r6
	setx	0x2dc0dfb3ac3540b6, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000f09d0ab858, %r1, %r6
	setx	0xb32a0386c20329c2, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001060100000, %r1, %r6
	setx	0xb32a0386c20329c2, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000e07222abc0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d8816f3cb8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000c7e88b3e50, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800ff2c538, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e866eec, %r1, %r12
	lduh	[%r12], %r11
	setx	0x0000001070100000, %r1, %r6
	setx	0xb32a0386c20329c2, %r1, %r10
	ldx	[%r6], %r10
	setx	0x00000080d2bc74b0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000f2cbc938c4, %r1, %r12
	lduh	[%r12], %r11
	setx	0x00000010a0100000, %r1, %r6
	.word 0xe8598008  ! 51: LDX_R	ldx	[%r6 + %r8], %r20
	.word 0xa6a1a060  ! 52: SUBcc_I	subcc 	%r6, 0x0060, %r19
	.word 0xe4398008  ! 53: STD_R	std	%r18, [%r6 + %r8]
	setx	0x000000809d46d1b8, %r1, %r6
	setx	0x489b00e378d8405c, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800e7b1ef0, %r1, %r6
	setx	0x6ee55c19fdd4d741, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800f3361a4, %r1, %r6
	setx	0x62571ebaa259fdf1, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000c3ceb79b58, %r1, %r6
	setx	0x6659774a503726b4, %r1, %r10
	sth	%r10, [%r6]
	setx	0x00000010a0100000, %r1, %r6
	setx	0x6659774a503726b4, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000d4b3de92e0, %r1, %r6
	setx	0xcd8f24f479f30376, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000e215b6eec8, %r1, %r6
	setx	0xa0bbb7fcf216a065, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000fba04f6a64, %r1, %r6
	setx	0x6c14e69bdcd6fa37, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000808fa79ac8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000f4cfee5144, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000e07222abc0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x0000001080100000, %r1, %r6
	setx	0x6c14e69bdcd6fa37, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000d8816f3cb8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x0000001080100000, %r1, %r6
	setx	0x6c14e69bdcd6fa37, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000c7e88b3e50, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800ff2c538, %r1, %r12
	lduh	[%r12], %r11
	setx	0x00000010f0100000, %r1, %r6
	.word 0xe0098008  ! 58: LDUB_R	ldub	[%r6 + %r8], %r16
	.word 0xa2818008  ! 59: ADDcc_R	addcc 	%r6, %r8, %r17
	.word 0xe439a060  ! 60: STD_I	std	%r18, [%r6 + 0x0060]
	setx	0x00000080811bc4a0, %r1, %r6
	setx	0x7624d3633fcce726, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800eac24d4, %r1, %r6
	setx	0x49ca1b7b421d2be3, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800fcd5f88, %r1, %r6
	setx	0x8167057e41f1e036, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000cdfd476504, %r1, %r6
	setx	0x4456b86863f263e7, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000d607793b8c, %r1, %r6
	setx	0x2cb59dba9418d765, %r1, %r10
	sth	%r10, [%r6]
	setx	0x00000010f0100000, %r1, %r6
	setx	0x2cb59dba9418d765, %r1, %r10
	stx	%r10, [%r6]
	setx	0x000000e0d4144250, %r1, %r6
	setx	0xebf735daf5b22bcd, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000f1d328de0c, %r1, %r6
	setx	0x2d9c09463a2fcac1, %r1, %r10
	sth	%r10, [%r6]
	setx	0x00000010a0100000, %r1, %r6
	setx	0x2d9c09463a2fcac1, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000800e6030fc, %r1, %r12
	lduh	[%r12], %r11
	setx	0x00000080a5d68530, %r1, %r12
	lduh	[%r12], %r11
	setx	0x0000001060100000, %r1, %r6
	.word 0xe8118008  ! 65: LDUH_R	lduh	[%r6 + %r8], %r20
	.word 0xaa318008  ! 66: SUBC_R	orn 	%r6, %r8, %r21
	.word 0xe0398008  ! 67: STD_R	std	%r16, [%r6 + %r8]
	setx	0x00000080cfb2fcf0, %r1, %r6
	setx	0xfff55f2f5ae52d84, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800e022c3c, %r1, %r6
	setx	0x4a7dcc16f1825374, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001060100000, %r1, %r6
	setx	0x4a7dcc16f1825374, %r1, %r10
	stx	%r10, [%r6]
	setx	0x000000800f4c9e10, %r1, %r6
	setx	0xa4d20ca15dfa7097, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000c8c339d6fc, %r1, %r6
	setx	0x9497e77ee6cff47c, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000d4cc48bd88, %r1, %r6
	setx	0xb436262d6460de57, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000e5d0f4f07c, %r1, %r6
	setx	0x465ea894a44cab95, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000f3534c4944, %r1, %r6
	setx	0xe63b95d1348edd42, %r1, %r10
	sth	%r10, [%r6]
	setx	0x00000010c0100000, %r1, %r6
	setx	0xe63b95d1348edd42, %r1, %r10
	stx	%r10, [%r6]
	setx	0x000000d4117a80e4, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000c15f603be8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800fa01d60, %r1, %r12
	lduh	[%r12], %r11
	setx	0x0000001050100000, %r1, %r6
	setx	0xe63b95d1348edd42, %r1, %r10
	stx	%r10, [%r6]
	setx	0x000000800e6030fc, %r1, %r12
	lduh	[%r12], %r11
	setx	0x0000001010100000, %r1, %r6
	.word 0xe0018008  ! 72: LDUW_R	lduw	[%r6 + %r8], %r16
	.word 0xa8298008  ! 73: ANDN_R	andn 	%r6, %r8, %r20
	.word 0xec218008  ! 74: STW_R	stw	%r22, [%r6 + %r8]
	setx	0x00000080dcce3e10, %r1, %r6
	setx	0x208a9ea8b82e1e17, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800e39b38c, %r1, %r6
	setx	0x10413b20e1b9d5d4, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800f281134, %r1, %r6
	setx	0x16dbd6a9cb2d84ca, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000c6f1d4dfc0, %r1, %r6
	setx	0x6647ce40ac9efc0b, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000dc9d906534, %r1, %r6
	setx	0xdc7c2f504c495473, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000e512834420, %r1, %r6
	setx	0x4e1763ccb2385ae5, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000f1063daf40, %r1, %r6
	setx	0xca1927a97f1bba97, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800e7b1ef0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000809d46d1b8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x0000001010100000, %r1, %r6
	setx	0xca1927a97f1bba97, %r1, %r10
	stx	%r10, [%r6]
	setx	0x000000f09d0ab858, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000eda5bc6c2c, %r1, %r12
	lduh	[%r12], %r11
	setx	0x00000010c0100000, %r1, %r6
	setx	0xca1927a97f1bba97, %r1, %r10
	stx	%r10, [%r6]
	setx	0x000000dabdefc39c, %r1, %r12
	lduh	[%r12], %r11
	setx	0x00000010e0100000, %r1, %r6
	setx	0xca1927a97f1bba97, %r1, %r10
	stx	%r10, [%r6]
	setx	0x000000cb9fd4bc00, %r1, %r12
	lduh	[%r12], %r11
	setx	0x00000010c0100000, %r1, %r6
	.word 0xec41a060  ! 79: LDSW_I	ldsw	[%r6 + 0x0060], %r22
	.word 0xa0318008  ! 80: ORN_R	orn 	%r6, %r8, %r16
	.word 0xec318008  ! 81: STH_R	sth	%r22, [%r6 + %r8]
	setx	0x00000080feea7834, %r1, %r6
	setx	0x39cf2627f6b9b2dd, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800ed6e32c, %r1, %r6
	setx	0x62f5813c1cf64daa, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800f39956c, %r1, %r6
	setx	0x89ffd5a3e96277a6, %r1, %r10
	sth	%r10, [%r6]
	setx	0x00000010c0100000, %r1, %r6
	setx	0x89ffd5a3e96277a6, %r1, %r10
	stx	%r10, [%r6]
	setx	0x000000c74b4b6eac, %r1, %r6
	setx	0x2497c08d6e1bc5bd, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001030100000, %r1, %r6
	setx	0x2497c08d6e1bc5bd, %r1, %r10
	stx	%r10, [%r6]
	setx	0x000000d3a7eeb78c, %r1, %r6
	setx	0x5201fc76791abe16, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000e5195ec6b4, %r1, %r6
	setx	0xd8dd7d566b7da44c, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000fa65599e38, %r1, %r6
	setx	0x9df29b752149ee30, %r1, %r10
	sth	%r10, [%r6]
	setx	0x00000010b0100000, %r1, %r6
	setx	0x9df29b752149ee30, %r1, %r10
	ldx	[%r6], %r10
	setx	0x0000001030100000, %r1, %r6
	.word 0xe019a060  ! 86: LDD_I	ldd	[%r6 + 0x0060], %r16
	.word 0xa6a9a038  ! 87: ANDNcc_I	andncc 	%r6, 0x0038, %r19
	.word 0xe8218008  ! 88: STW_R	stw	%r20, [%r6 + %r8]
	setx	0x00000080df1f8d44, %r1, %r6
	setx	0x4e2697e5d3a17928, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800ed3bf24, %r1, %r6
	setx	0x5ae45f4afedf77bf, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001030100000, %r1, %r6
	setx	0x5ae45f4afedf77bf, %r1, %r10
	stx	%r10, [%r6]
	setx	0x000000800f5bef24, %r1, %r6
	setx	0x14f179a2c6bbd0d4, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000cf83b68680, %r1, %r6
	setx	0x2dff8eb557f65f0e, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001040100000, %r1, %r6
	setx	0x2dff8eb557f65f0e, %r1, %r10
	stx	%r10, [%r6]
	setx	0x000000dac9ac4a44, %r1, %r6
	setx	0x9cf6be3216e550b9, %r1, %r10
	sth	%r10, [%r6]
	setx	0x00000010a0100000, %r1, %r6
	setx	0x9cf6be3216e550b9, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000ea491595dc, %r1, %r6
	setx	0xe38bc5e680302ffa, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001090100000, %r1, %r6
	setx	0xe38bc5e680302ffa, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000f6147c3aa8, %r1, %r6
	setx	0x565f6a660cacfd04, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000f4cfee5144, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000e07222abc0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x00000010e0100000, %r1, %r6
	setx	0x565f6a660cacfd04, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000d8816f3cb8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000c7e88b3e50, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800ff2c538, %r1, %r12
	lduh	[%r12], %r11
	setx	0x0000001030100000, %r1, %r6
	.word 0xe009a038  ! 93: LDUB_I	ldub	[%r6 + 0x0038], %r16
	.word 0xaec1a0b8  ! 94: ADDCcc_I	addccc 	%r6, 0x00b8, %r23
	.word 0xe4218008  ! 95: STW_R	stw	%r18, [%r6 + %r8]
	setx	0x00000080a2175504, %r1, %r6
	setx	0x3bb4d2d8a4ade6e9, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800eddf818, %r1, %r6
	setx	0x4b065054c3c54012, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800f377b8c, %r1, %r6
	setx	0x63ee12039ba4c5f4, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000cf243457d0, %r1, %r6
	setx	0x4e3f0450a828b1c0, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000d9e1275254, %r1, %r6
	setx	0x9d0158d3e9944739, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000eaea92e3fc, %r1, %r6
	setx	0x4602565d7e68cd38, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001030100000, %r1, %r6
	setx	0x4602565d7e68cd38, %r1, %r10
	stx	%r10, [%r6]
	setx	0x000000fe748f81b8, %r1, %r6
	setx	0x032f848557484b9e, %r1, %r10
	sth	%r10, [%r6]
	setx	0x00000010e0100000, %r1, %r6
	setx	0x032f848557484b9e, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000cbd5ad65c0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800ff0a7c4, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e1e6ef0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x0000008087626194, %r1, %r12
	lduh	[%r12], %r11
	setx	0x0000001070100000, %r1, %r6
	.word 0xe0198008  ! 100: LDD_R	ldd	[%r6 + %r8], %r16
	.word 0xac31a0a0  ! 101: SUBC_I	orn 	%r6, 0x00a0, %r22
	.word 0xec398008  ! 102: STD_R	std	%r22, [%r6 + %r8]
	setx	0x0000008080441f08, %r1, %r6
	setx	0xe98345cf1de3523f, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800e263eb4, %r1, %r6
	setx	0xcf5a37a9805c87d4, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800f2caaf8, %r1, %r6
	setx	0x0d7a62bee449c92d, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000c7768bb864, %r1, %r6
	setx	0x6ce8b86eecf1ee19, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000dce5aa9800, %r1, %r6
	setx	0x648a0ed80ce81fe2, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000e729bad640, %r1, %r6
	setx	0x23177ca0cd1cf0ff, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001070100000, %r1, %r6
	setx	0x23177ca0cd1cf0ff, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000f6491cf9d4, %r1, %r6
	setx	0x049ed5f5318b5431, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000d8816f3cb8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000c7e88b3e50, %r1, %r12
	lduh	[%r12], %r11
	setx	0x0000001080100000, %r1, %r6
	.word 0xe8498008  ! 107: LDSB_R	ldsb	[%r6 + %r8], %r20
	.word 0xa2418008  ! 108: ADDC_R	addc 	%r6, %r8, %r17
	.word 0xe0318008  ! 109: STH_R	sth	%r16, [%r6 + %r8]
	setx	0x000000802ee0c7b8, %r1, %r6
	setx	0x9b5f081d25a6a997, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001080100000, %r1, %r6
	setx	0x9b5f081d25a6a997, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000800ea16c30, %r1, %r6
	setx	0xeffcab449f17b702, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800faa8f78, %r1, %r6
	setx	0x85567ab6e0fd4c81, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000c45eadfb5c, %r1, %r6
	setx	0x704b3f0cf61ea54a, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000d78f6200cc, %r1, %r6
	setx	0x2c2d7404846ba47a, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001000100000, %r1, %r6
	setx	0x2c2d7404846ba47a, %r1, %r10
	stx	%r10, [%r6]
	setx	0x000000e38e855314, %r1, %r6
	setx	0xb4f6738da660d754, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000fdcd03cfd0, %r1, %r6
	setx	0x068d56b0024625d3, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001070100000, %r1, %r6
	.word 0xec418008  ! 114: LDSW_R	ldsw	[%r6 + %r8], %r22
	.word 0xa2198008  ! 115: XOR_R	xor 	%r6, %r8, %r17
	.word 0xe821a0a0  ! 116: STW_I	stw	%r20, [%r6 + 0x00a0]
	setx	0x0000008034e8b9fc, %r1, %r6
	setx	0x516aa1813b3c667c, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800ed69104, %r1, %r6
	setx	0x9b1b10382ada08b1, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800fe47a90, %r1, %r6
	setx	0x5ee971086aeae73c, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001070100000, %r1, %r6
	setx	0x5ee971086aeae73c, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000cc7199cfec, %r1, %r6
	setx	0x2c1f2a68ff74b8e1, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000dfa81d5a94, %r1, %r6
	setx	0x762e09b2aa6c1b64, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000eb48bea03c, %r1, %r6
	setx	0xef7978cfd29b940d, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000fb97e0b5cc, %r1, %r6
	setx	0xdb8efdb65a4cc88a, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800eac24d4, %r1, %r12
	lduh	[%r12], %r11
	setx	0x00000010b0100000, %r1, %r6
	.word 0xe849a0a0  ! 121: LDSB_I	ldsb	[%r6 + 0x00a0], %r20
	.word 0xa8298008  ! 122: ANDN_R	andn 	%r6, %r8, %r20
	.word 0xe839a0a0  ! 123: STD_I	std	%r20, [%r6 + 0x00a0]
	setx	0x000000809915d64c, %r1, %r6
	setx	0xea08ad3c5402a5a7, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800e97ca08, %r1, %r6
	setx	0x00570d2cf08d7cf9, %r1, %r10
	sth	%r10, [%r6]
	setx	0x00000010b0100000, %r1, %r6
	setx	0x00570d2cf08d7cf9, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000800f4b3890, %r1, %r6
	setx	0xf9229c90088fda4e, %r1, %r10
	sth	%r10, [%r6]
	setx	0x00000010c0100000, %r1, %r6
	setx	0xf9229c90088fda4e, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000cc7507224c, %r1, %r6
	setx	0xec551ad8b5fe696b, %r1, %r10
	sth	%r10, [%r6]
	setx	0x00000010d0100000, %r1, %r6
	setx	0xec551ad8b5fe696b, %r1, %r10
	stx	%r10, [%r6]
	setx	0x000000d7ae3b6bdc, %r1, %r6
	setx	0xc9bfbd194ae9ea6a, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000e799513520, %r1, %r6
	setx	0x0221021d3cf4b35b, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000fde44c6264, %r1, %r6
	setx	0x11006e1ba8a6faea, %r1, %r10
	sth	%r10, [%r6]
	setx	0x00000010a0100000, %r1, %r6
	setx	0x11006e1ba8a6faea, %r1, %r10
	stx	%r10, [%r6]
	setx	0x000000fb97e0b5cc, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000eb48bea03c, %r1, %r12
	lduh	[%r12], %r11
	setx	0x00000010e0100000, %r1, %r6
	.word 0xec098008  ! 128: LDUB_R	ldub	[%r6 + %r8], %r22
	.word 0xa0898008  ! 129: ANDcc_R	andcc 	%r6, %r8, %r16
	.word 0xe029a0a0  ! 130: STB_I	stb	%r16, [%r6 + 0x00a0]
	setx	0x00000080202202fc, %r1, %r6
	setx	0xa9520a2022a5aa31, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800e06d8c0, %r1, %r6
	setx	0xa879a992d31ff3e3, %r1, %r10
	sth	%r10, [%r6]
	setx	0x00000010e0100000, %r1, %r6
	setx	0xa879a992d31ff3e3, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000800f0c861c, %r1, %r6
	setx	0x40f37e1dfa005925, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000c48020e2fc, %r1, %r6
	setx	0x79851d61b7a7d2e1, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001080100000, %r1, %r6
	setx	0x79851d61b7a7d2e1, %r1, %r10
	stx	%r10, [%r6]
	setx	0x000000debffd3650, %r1, %r6
	setx	0x3fc42481a8eeb6f2, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000e045836088, %r1, %r6
	setx	0x5ae5f3559824e2c9, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000f5f5a258a0, %r1, %r6
	setx	0x0325f40d43433b62, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000cb9fd4bc00, %r1, %r12
	lduh	[%r12], %r11
	setx	0x0000001000100000, %r1, %r6
	.word 0xec49a0a0  ! 135: LDSB_I	ldsb	[%r6 + 0x00a0], %r22
	.word 0xaa918008  ! 136: ORcc_R	orcc 	%r6, %r8, %r21
	.word 0xe0298008  ! 137: STB_R	stb	%r16, [%r6 + %r8]
	setx	0x00000080e5a84b68, %r1, %r6
	setx	0x24f9760697b07d8a, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001000100000, %r1, %r6
	setx	0x24f9760697b07d8a, %r1, %r10
	stx	%r10, [%r6]
	setx	0x000000800e736550, %r1, %r6
	setx	0xdacec2a3f2276671, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800fe6463c, %r1, %r6
	setx	0x9a2c1c197373294f, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000cfee4bd38c, %r1, %r6
	setx	0x7568d27a026a760c, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000d26a5da208, %r1, %r6
	setx	0x9d57aff2d214e6bd, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000ede04ee888, %r1, %r6
	setx	0x6bbc2dc5dc26a1fb, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000fe64576b38, %r1, %r6
	setx	0x869ccf3a010e91c5, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001080100000, %r1, %r6
	.word 0xec498008  ! 142: LDSB_R	ldsb	[%r6 + %r8], %r22
	.word 0xa6b18008  ! 143: SUBCcc_R	orncc 	%r6, %r8, %r19
	.word 0xe431a0a0  ! 144: STH_I	sth	%r18, [%r6 + 0x00a0]
	setx	0x00000080593fa25c, %r1, %r6
	setx	0xd4dd3cbe5c7d1d7e, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001080100000, %r1, %r6
	setx	0xd4dd3cbe5c7d1d7e, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000800e30d1d4, %r1, %r6
	setx	0x88ddc1c8bc3c21e4, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800fdfd464, %r1, %r6
	setx	0xb800ecf7e333fd65, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001040100000, %r1, %r6
	setx	0xb800ecf7e333fd65, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000c94e04a590, %r1, %r6
	setx	0xf79b0ac2376a12b6, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000d90d007514, %r1, %r6
	setx	0x6135a46bb691a8c7, %r1, %r10
	sth	%r10, [%r6]
	setx	0x00000010a0100000, %r1, %r6
	setx	0x6135a46bb691a8c7, %r1, %r10
	stx	%r10, [%r6]
	setx	0x000000ed9c39b428, %r1, %r6
	setx	0x16041edc2a2043c1, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001010100000, %r1, %r6
	setx	0x16041edc2a2043c1, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000fa28dbaef4, %r1, %r6
	setx	0x13e489b272e5489f, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000cfee4bd38c, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800fe6463c, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e736550, %r1, %r12
	lduh	[%r12], %r11
	setx	0x00000080e5a84b68, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000f5f5a258a0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x00000010a0100000, %r1, %r6
	.word 0xe049a0a0  ! 149: LDSB_I	ldsb	[%r6 + 0x00a0], %r16
	.word 0xae01a0d8  ! 150: ADD_I	add 	%r6, 0x00d8, %r23
	.word 0xe471a0d8  ! 151: STX_I	stx	%r18, [%r6 + 0x00d8]
	setx	0x000000805f8b1214, %r1, %r6
	setx	0xd8c8b11629a3c240, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800ee24454, %r1, %r6
	setx	0x1ff097d1aa92165e, %r1, %r10
	sth	%r10, [%r6]
	setx	0x00000010a0100000, %r1, %r6
	setx	0x1ff097d1aa92165e, %r1, %r10
	stx	%r10, [%r6]
	setx	0x000000800f231430, %r1, %r6
	setx	0x0b165996009d8e47, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000c65cc86d20, %r1, %r6
	setx	0xd9ab33d1c6754995, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000dd641c511c, %r1, %r6
	setx	0x4e796766e1a7ac7e, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000eab2393bf0, %r1, %r6
	setx	0x64b8dc7f8ca88e5d, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000fb3d891310, %r1, %r6
	setx	0x4d3f0eddfffeeaaa, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000eda5bc6c2c, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000dabdefc39c, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000cb9fd4bc00, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800f4d48d4, %r1, %r12
	lduh	[%r12], %r11
	setx	0x0000001030100000, %r1, %r6
	.word 0xec11a0d8  ! 156: LDUH_I	lduh	[%r6 + 0x00d8], %r22
	.word 0xa6318008  ! 157: SUBC_R	orn 	%r6, %r8, %r19
	.word 0xec29a0d8  ! 158: STB_I	stb	%r22, [%r6 + 0x00d8]
	setx	0x0000008029839edc, %r1, %r6
	setx	0xb3e9d82b558d42bf, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800e2879cc, %r1, %r6
	setx	0xb04366e7998aa407, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800f299384, %r1, %r6
	setx	0xcd7033384b545fab, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000cd5cec923c, %r1, %r6
	setx	0x670ded817caa4134, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000dd0c20228c, %r1, %r6
	setx	0xdbcab417550bf3cb, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000e9020a2038, %r1, %r6
	setx	0x9699ad0a6194f9b6, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000fb80f17d88, %r1, %r6
	setx	0x66a7f8b06272c061, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800ea16c30, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000802ee0c7b8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x0000001030100000, %r1, %r6
	setx	0x66a7f8b06272c061, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000f6491cf9d4, %r1, %r12
	lduh	[%r12], %r11
	setx	0x00000010c0100000, %r1, %r6
	setx	0x66a7f8b06272c061, %r1, %r10
	stx	%r10, [%r6]
	setx	0x000000e729bad640, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000dce5aa9800, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000c7768bb864, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800f2caaf8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x0000001000100000, %r1, %r6
	.word 0xe4498008  ! 163: LDSB_R	ldsb	[%r6 + %r8], %r18
	.word 0xaab1a0a0  ! 164: ORNcc_I	orncc 	%r6, 0x00a0, %r21
	.word 0xe8718008  ! 165: STX_R	stx	%r20, [%r6 + %r8]
	setx	0x000000804e647b68, %r1, %r6
	setx	0xa659283937567a08, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001000100000, %r1, %r6
	setx	0xa659283937567a08, %r1, %r10
	stx	%r10, [%r6]
	setx	0x000000800ed44880, %r1, %r6
	setx	0xb589ac0534607283, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001080100000, %r1, %r6
	setx	0xb589ac0534607283, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000800fe2ed24, %r1, %r6
	setx	0x73e174519d3072b4, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000ca53f2dec8, %r1, %r6
	setx	0xbcf529cc47a776a7, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001070100000, %r1, %r6
	setx	0xbcf529cc47a776a7, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000d59a273514, %r1, %r6
	setx	0x7586037c9b5432af, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000e0492a0bac, %r1, %r6
	setx	0xe456a0070460e266, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000fd16710f44, %r1, %r6
	setx	0x51ad627b69258867, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000f09d0ab858, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000eda5bc6c2c, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000dabdefc39c, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000cb9fd4bc00, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800f4d48d4, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e8f82bc, %r1, %r12
	lduh	[%r12], %r11
	setx	0x0000001010100000, %r1, %r6
	.word 0xe0518008  ! 170: LDSH_R	ldsh	[%r6 + %r8], %r16
	.word 0xacb98008  ! 171: XNORcc_R	xnorcc 	%r6, %r8, %r22
	.word 0xec218008  ! 172: STW_R	stw	%r22, [%r6 + %r8]
	setx	0x000000809093f220, %r1, %r6
	setx	0x9b7c6f1b8b0e6213, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001010100000, %r1, %r6
	setx	0x9b7c6f1b8b0e6213, %r1, %r10
	stx	%r10, [%r6]
	setx	0x000000800ed3f0e4, %r1, %r6
	setx	0xe6fb96d8a1cd438a, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800fef7bec, %r1, %r6
	setx	0xf2a7dd04b52dabc1, %r1, %r10
	sth	%r10, [%r6]
	setx	0x00000010c0100000, %r1, %r6
	setx	0xf2a7dd04b52dabc1, %r1, %r10
	stx	%r10, [%r6]
	setx	0x000000ca3186bef8, %r1, %r6
	setx	0x0a115ac6a9103e89, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000d1f22642a0, %r1, %r6
	setx	0xb9564fd667c5317c, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000ee612785f4, %r1, %r6
	setx	0x379bfada45011aa0, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000f1ded9a14c, %r1, %r6
	setx	0xdcaedee072b0906b, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000debffd3650, %r1, %r12
	lduh	[%r12], %r11
	setx	0x00000010e0100000, %r1, %r6
	setx	0xdcaedee072b0906b, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000c48020e2fc, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800f0c861c, %r1, %r12
	lduh	[%r12], %r11
	setx	0x0000001090100000, %r1, %r6
	.word 0xe001a0a0  ! 177: LDUW_I	lduw	[%r6 + 0x00a0], %r16
	.word 0xa4c18008  ! 178: ADDCcc_R	addccc 	%r6, %r8, %r18
	.word 0xe8298008  ! 179: STB_R	stb	%r20, [%r6 + %r8]
	setx	0x000000802ff6d860, %r1, %r6
	setx	0x922cda6bccc686d9, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800ec55c84, %r1, %r6
	setx	0xfa02113fddc92c86, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001090100000, %r1, %r6
	setx	0xfa02113fddc92c86, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000800fbf0420, %r1, %r6
	setx	0xbef49fd9b01738ee, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000ce4bfefb70, %r1, %r6
	setx	0x7ff8b13b061db3f2, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000d7ab2dbdd0, %r1, %r6
	setx	0x2f9149582040877d, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001020100000, %r1, %r6
	setx	0x2f9149582040877d, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000e3b03cbe9c, %r1, %r6
	setx	0x798662cb1e9b5e97, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000fdaccf4cb4, %r1, %r6
	setx	0x615e45344cbff813, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001050100000, %r1, %r6
	setx	0x615e45344cbff813, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000fdf65413c4, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000e281544bc8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d0b58381bc, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000ce2bc4e890, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800f45a8bc, %r1, %r12
	lduh	[%r12], %r11
	setx	0x0000001060100000, %r1, %r6
	setx	0x615e45344cbff813, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000800ebe30fc, %r1, %r12
	lduh	[%r12], %r11
	setx	0x00000010c0100000, %r1, %r6
	.word 0xec59a0a0  ! 184: LDX_I	ldx	[%r6 + 0x00a0], %r22
	.word 0xac418008  ! 185: ADDC_R	addc 	%r6, %r8, %r22
	.word 0xe039a0a0  ! 186: STD_I	std	%r16, [%r6 + 0x00a0]
	setx	0x0000008087144d40, %r1, %r6
	setx	0xe7d9c29882d174b6, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800e3f057c, %r1, %r6
	setx	0xe1ba950511f58a80, %r1, %r10
	sth	%r10, [%r6]
	setx	0x00000010c0100000, %r1, %r6
	setx	0xe1ba950511f58a80, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000800f1e9fdc, %r1, %r6
	setx	0x5ad0794f90921eba, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000c503cec43c, %r1, %r6
	setx	0xaaf6e025724fdbb3, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001090100000, %r1, %r6
	setx	0xaaf6e025724fdbb3, %r1, %r10
	stx	%r10, [%r6]
	setx	0x000000df2e70b858, %r1, %r6
	setx	0x9eb17bc2e3e9a77c, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000ec70716778, %r1, %r6
	setx	0x6b4831851620b123, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001020100000, %r1, %r6
	setx	0x6b4831851620b123, %r1, %r10
	stx	%r10, [%r6]
	setx	0x000000f126585a4c, %r1, %r6
	setx	0xd85484d5d814c2d9, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000f6491cf9d4, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000e729bad640, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000dce5aa9800, %r1, %r12
	lduh	[%r12], %r11
	setx	0x00000010f0100000, %r1, %r6
	setx	0xd85484d5d814c2d9, %r1, %r10
	stx	%r10, [%r6]
	setx	0x000000c7768bb864, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800f2caaf8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e263eb4, %r1, %r12
	lduh	[%r12], %r11
	setx	0x00000010b0100000, %r1, %r6
	setx	0xd85484d5d814c2d9, %r1, %r10
	stx	%r10, [%r6]
	setx	0x0000001040100000, %r1, %r6
	.word 0xe0198008  ! 191: LDD_R	ldd	[%r6 + %r8], %r16
	.word 0xa6b98008  ! 192: XNORcc_R	xnorcc 	%r6, %r8, %r19
	.word 0xe421a0a0  ! 193: STW_I	stw	%r18, [%r6 + 0x00a0]
	setx	0x000000807d7621cc, %r1, %r6
	setx	0x59d7221eb97fc617, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001040100000, %r1, %r6
	setx	0x59d7221eb97fc617, %r1, %r10
	stx	%r10, [%r6]
	setx	0x000000800eed74c8, %r1, %r6
	setx	0x59b06dfc6b74e25c, %r1, %r10
	sth	%r10, [%r6]
	setx	0x00000010c0100000, %r1, %r6
	setx	0x59b06dfc6b74e25c, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000800f513aa4, %r1, %r6
	setx	0x464b4201b069cc6f, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000c3192425dc, %r1, %r6
	setx	0x10bae7d04aefcb38, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000dc8e2e0544, %r1, %r6
	setx	0xc92a25158bb0b7b2, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001040100000, %r1, %r6
	setx	0xc92a25158bb0b7b2, %r1, %r10
	stx	%r10, [%r6]
	setx	0x000000eb97f9563c, %r1, %r6
	setx	0x5a4dcb85a6558347, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000f9f0aa356c, %r1, %r6
	setx	0x2933a57df21d2d13, %r1, %r10
	sth	%r10, [%r6]
	setx	0x00000080d2bc74b0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000f2cbc938c4, %r1, %r12
	lduh	[%r12], %r11
	setx	0x0000001060100000, %r1, %r6
	setx	0x2933a57df21d2d13, %r1, %r10
	stx	%r10, [%r6]
	setx	0x000000e9aa69c4dc, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000dc42043bac, %r1, %r12
	lduh	[%r12], %r11
	setx	0x0000001090100000, %r1, %r6
	setx	0x2933a57df21d2d13, %r1, %r10
	ldx	[%r6], %r10
	setx	0x0000001040100000, %r1, %r6
	.word 0xe409a0a0  ! 198: LDUB_I	ldub	[%r6 + 0x00a0], %r18
	.word 0xa6098008  ! 199: AND_R	and 	%r6, %r8, %r19
	.word 0xe829a0a0  ! 200: STB_I	stb	%r20, [%r6 + 0x00a0]
	setx	0x000000803b91ad3c, %r1, %r6
	setx	0x4715e58215811f8e, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800e7637b8, %r1, %r6
	setx	0x2c54399637206156, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800f91cfe8, %r1, %r6
	setx	0x1e14f6608a3029ba, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000c397efb6f4, %r1, %r6
	setx	0x2fc03598b55ea3a3, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001040100000, %r1, %r6
	setx	0x2fc03598b55ea3a3, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000d81c983bc8, %r1, %r6
	setx	0x91727b49bc45ad72, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000ecd5432204, %r1, %r6
	setx	0x75e69e922b3009a1, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000f50b4aa4bc, %r1, %r6
	setx	0x6e9b86dab1615fae, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001010100000, %r1, %r6
	.word 0xe8518008  ! 205: LDSH_R	ldsh	[%r6 + %r8], %r20
	.word 0xa891a0c0  ! 206: ORcc_I	orcc 	%r6, 0x00c0, %r20
	.word 0xe039a0c0  ! 207: STD_I	std	%r16, [%r6 + 0x00c0]
	setx	0x000000802a3f48d4, %r1, %r6
	setx	0x47679aa8a9eea135, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800e4e6214, %r1, %r6
	setx	0xd890db8760ce35b4, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800f85e45c, %r1, %r6
	setx	0x89e110bf1c634318, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000cd482c05f0, %r1, %r6
	setx	0x01de81afc80297ee, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001010100000, %r1, %r6
	setx	0x01de81afc80297ee, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000dd77e3ca14, %r1, %r6
	setx	0x40c22e4c80b915d4, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000edce8bfd10, %r1, %r6
	setx	0x6228b5eb4820130d, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000f0a4ceea88, %r1, %r6
	setx	0x0ddb88045907ab4b, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000eb97f9563c, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000dc8e2e0544, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000c3192425dc, %r1, %r12
	lduh	[%r12], %r11
	setx	0x0000001090100000, %r1, %r6
	.word 0xe459a0c0  ! 212: LDX_I	ldx	[%r6 + 0x00c0], %r18
	.word 0xae218008  ! 213: SUB_R	sub 	%r6, %r8, %r23
	.word 0xec39a0c0  ! 214: STD_I	std	%r22, [%r6 + 0x00c0]
	setx	0x00000080235fe680, %r1, %r6
	setx	0x21132b6cf905f183, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001090100000, %r1, %r6
	setx	0x21132b6cf905f183, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000800e5facf4, %r1, %r6
	setx	0xf8436c02d2165dc5, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800fa90ea4, %r1, %r6
	setx	0xf6899b37cc7f72ae, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000c32c8994b8, %r1, %r6
	setx	0x65ba8ee12c28b4a9, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000d61abc2da0, %r1, %r6
	setx	0x035619ef16af4e80, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000e74c3e91b4, %r1, %r6
	setx	0x3f38a214138dc4a2, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000f5cd8251a0, %r1, %r6
	setx	0xb39c7d9545fb1cf5, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000debffd3650, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000c48020e2fc, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800f0c861c, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e06d8c0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x0000001050100000, %r1, %r6
	setx	0xb39c7d9545fb1cf5, %r1, %r10
	ldx	[%r6], %r10
	setx	0x0000001050100000, %r1, %r6
	.word 0xe0498008  ! 219: LDSB_R	ldsb	[%r6 + %r8], %r16
	.word 0xa6b18008  ! 220: ORNcc_R	orncc 	%r6, %r8, %r19
	.word 0xe0218008  ! 221: STW_R	stw	%r16, [%r6 + %r8]
	setx	0x0000008053e78c90, %r1, %r6
	setx	0x94b0806eeb0026cc, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800e2c2800, %r1, %r6
	setx	0x366ec41871e0f743, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001050100000, %r1, %r6
	setx	0x366ec41871e0f743, %r1, %r10
	stx	%r10, [%r6]
	setx	0x000000800f58bfdc, %r1, %r6
	setx	0xd5f51218162141e7, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000cbab100d68, %r1, %r6
	setx	0xab43491d6a63b56e, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000d069641ab4, %r1, %r6
	setx	0x76caf435e7b1ab81, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000e7094fd408, %r1, %r6
	setx	0xef3a8e8126bfe7ce, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001050100000, %r1, %r6
	setx	0xef3a8e8126bfe7ce, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000f704641160, %r1, %r6
	setx	0x68266333df10f669, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000f50b4aa4bc, %r1, %r12
	lduh	[%r12], %r11
	setx	0x0000001020100000, %r1, %r6
	setx	0x68266333df10f669, %r1, %r10
	stx	%r10, [%r6]
	setx	0x000000ecd5432204, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d81c983bc8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x0000001030100000, %r1, %r6
	setx	0x68266333df10f669, %r1, %r10
	stx	%r10, [%r6]
	setx	0x00000010f0100000, %r1, %r6
	.word 0xe0598008  ! 226: LDX_R	ldx	[%r6 + %r8], %r16
	.word 0xa4b18008  ! 227: ORNcc_R	orncc 	%r6, %r8, %r18
	.word 0xe439a0c0  ! 228: STD_I	std	%r18, [%r6 + 0x00c0]
	setx	0x00000080e7b8ee14, %r1, %r6
	setx	0x0b153f8b8645a952, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800e4b70f0, %r1, %r6
	setx	0x6718aa42ca2dd692, %r1, %r10
	sth	%r10, [%r6]
	setx	0x00000010f0100000, %r1, %r6
	setx	0x6718aa42ca2dd692, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000800fbc9eb8, %r1, %r6
	setx	0xcf5972a04693a7ff, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000c73b000a78, %r1, %r6
	setx	0x40e79b1b22ee6532, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000d1520500a8, %r1, %r6
	setx	0xa7bffc2f41d73e18, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000e568f81cd0, %r1, %r6
	setx	0x4023bffbb50f34ba, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000fd11070dd0, %r1, %r6
	setx	0x30ae968031a76f88, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001080100000, %r1, %r6
	setx	0x30ae968031a76f88, %r1, %r10
	ldx	[%r6], %r10
	setx	0x0000001080100000, %r1, %r6
	.word 0xec498008  ! 233: LDSB_R	ldsb	[%r6 + %r8], %r22
	.word 0xa6b18008  ! 234: ORNcc_R	orncc 	%r6, %r8, %r19
	.word 0xe0318008  ! 235: STH_R	sth	%r16, [%r6 + %r8]
	setx	0x00000080daf9edec, %r1, %r6
	setx	0x92ea9e902d59b2ed, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800ea609a4, %r1, %r6
	setx	0x9a41a6d810741c2b, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800f6abe54, %r1, %r6
	setx	0x3e9896cc0a3ad37e, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000cfc5742c88, %r1, %r6
	setx	0x4c81f12db80ebe83, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000da2e3f851c, %r1, %r6
	setx	0x98d97fe8fb7d1b4f, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000e577f89318, %r1, %r6
	setx	0x55fa364e37a6f4ed, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000f8a91d81b0, %r1, %r6
	setx	0xc032d8229e272361, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001080100000, %r1, %r6
	setx	0xc032d8229e272361, %r1, %r10
	stx	%r10, [%r6]
	setx	0x000000800ed69104, %r1, %r12
	lduh	[%r12], %r11
	setx	0x00000010f0100000, %r1, %r6
	setx	0xc032d8229e272361, %r1, %r10
	stx	%r10, [%r6]
	setx	0x0000008034e8b9fc, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000fdcd03cfd0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x0000001070100000, %r1, %r6
	setx	0xc032d8229e272361, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000e38e855314, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d78f6200cc, %r1, %r12
	lduh	[%r12], %r11
	setx	0x0000001020100000, %r1, %r6
	.word 0xe851a0c0  ! 240: LDSH_I	ldsh	[%r6 + 0x00c0], %r20
	.word 0xaca1a018  ! 241: SUBcc_I	subcc 	%r6, 0x0018, %r22
	.word 0xe4218008  ! 242: STW_R	stw	%r18, [%r6 + %r8]
	setx	0x00000080a1a66e3c, %r1, %r6
	setx	0x3a643c5bf441a2ee, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800e6eea3c, %r1, %r6
	setx	0x789736b636841d45, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800f6fc9c0, %r1, %r6
	setx	0x17023e4cf5060b20, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000cf9ce48fb8, %r1, %r6
	setx	0xce9ef990c5afc694, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000d9357099e0, %r1, %r6
	setx	0x272ad7d2591071ce, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000e9466eb458, %r1, %r6
	setx	0x80798d57b5868b7b, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000fc1686e50c, %r1, %r6
	setx	0x93cb68a04f12d637, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800e5facf4, %r1, %r12
	lduh	[%r12], %r11
	setx	0x0000001020100000, %r1, %r6
	setx	0x93cb68a04f12d637, %r1, %r10
	stx	%r10, [%r6]
	setx	0x00000080235fe680, %r1, %r12
	lduh	[%r12], %r11
	setx	0x00000010c0100000, %r1, %r6
	.word 0xec598008  ! 247: LDX_R	ldx	[%r6 + %r8], %r22
	.word 0xae998008  ! 248: XORcc_R	xorcc 	%r6, %r8, %r23
	.word 0xe0298008  ! 249: STB_R	stb	%r16, [%r6 + %r8]
	setx	0x000000807a9e1a7c, %r1, %r6
	setx	0xb12244065f10a3fb, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800e231144, %r1, %r6
	setx	0x4fa49f8d25aa6ba1, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800f3ebb48, %r1, %r6
	setx	0xf8ec15a11ce681e7, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000c2722fc7dc, %r1, %r6
	setx	0x025e4e0d7ed0dd72, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000d58ff7b1a0, %r1, %r6
	setx	0x51a600273e72388a, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000e7c985d80c, %r1, %r6
	setx	0x777d4246a4704648, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000f16cd5104c, %r1, %r6
	setx	0x12e786d49c79c831, %r1, %r10
	sth	%r10, [%r6]
	setx	0x00000010a0100000, %r1, %r6
	.word 0xe041a018  ! 254: LDSW_I	ldsw	[%r6 + 0x0018], %r16
	.word 0xa4898008  ! 255: ANDcc_R	andcc 	%r6, %r8, %r18
	.word 0xe471a018  ! 256: STX_I	stx	%r18, [%r6 + 0x0018]
	setx	0x0000008097ad0058, %r1, %r6
	setx	0x5a8007a69ceba55b, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800eaa52a8, %r1, %r6
	setx	0x14a4403c73add06c, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800f334c0c, %r1, %r6
	setx	0xd3de1fb812492213, %r1, %r10
	sth	%r10, [%r6]
	setx	0x00000010a0100000, %r1, %r6
	setx	0xd3de1fb812492213, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000ca1c7c57a4, %r1, %r6
	setx	0x74f166625623c362, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000d973e68e90, %r1, %r6
	setx	0x910ebda10d2b7e52, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000e21e600980, %r1, %r6
	setx	0xce2c19a64926ab9e, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001080100000, %r1, %r6
	setx	0xce2c19a64926ab9e, %r1, %r10
	stx	%r10, [%r6]
	setx	0x000000fd0134255c, %r1, %r6
	setx	0x0380ecc96b3620f0, %r1, %r10
	sth	%r10, [%r6]
	setx	0x00000080feea7834, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000f1063daf40, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000e512834420, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000dc9d906534, %r1, %r12
	lduh	[%r12], %r11
	setx	0x0000001030100000, %r1, %r6
	.word 0xec018008  ! 261: LDUW_R	lduw	[%r6 + %r8], %r22
	.word 0xa4318008  ! 262: ORN_R	orn 	%r6, %r8, %r18
	.word 0xe021a018  ! 263: STW_I	stw	%r16, [%r6 + 0x0018]
	setx	0x00000080aa690bc4, %r1, %r6
	setx	0x31e8201e489bb02e, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800e6f8494, %r1, %r6
	setx	0xa78ee54f0cda7a5e, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800fb01fdc, %r1, %r6
	setx	0xc7fad6dbf5f74b03, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000cfbf04a918, %r1, %r6
	setx	0x01bcaef051f01724, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001030100000, %r1, %r6
	setx	0x01bcaef051f01724, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000dd4b4b8fc0, %r1, %r6
	setx	0x2258a09bd58f8c4a, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001020100000, %r1, %r6
	setx	0x2258a09bd58f8c4a, %r1, %r10
	stx	%r10, [%r6]
	setx	0x000000e4f9877c3c, %r1, %r6
	setx	0xf797312d67df4160, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000f3bfc21970, %r1, %r6
	setx	0x12b0b1e91431aad2, %r1, %r10
	sth	%r10, [%r6]
	setx	0x00000010d0100000, %r1, %r6
	setx	0x12b0b1e91431aad2, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000800fa01d60, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e6030fc, %r1, %r12
	lduh	[%r12], %r11
	setx	0x00000080a5d68530, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000f7993de420, %r1, %r12
	lduh	[%r12], %r11
	setx	0x0000001080100000, %r1, %r6
	setx	0x12b0b1e91431aad2, %r1, %r10
	stx	%r10, [%r6]
	setx	0x000000e186e0e538, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d9eac0cd38, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000cae9c7315c, %r1, %r12
	lduh	[%r12], %r11
	setx	0x0000001040100000, %r1, %r6
	.word 0xec11a018  ! 268: LDUH_I	lduh	[%r6 + 0x0018], %r22
	.word 0xaab1a028  ! 269: SUBCcc_I	orncc 	%r6, 0x0028, %r21
	.word 0xe071a028  ! 270: STX_I	stx	%r16, [%r6 + 0x0028]
	setx	0x000000807927530c, %r1, %r6
	setx	0xa927fec563df6fec, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800ed99648, %r1, %r6
	setx	0xea4e1dc1ab53b47b, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800f6530c4, %r1, %r6
	setx	0x5fecb177fa5d5a41, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000c92f47254c, %r1, %r6
	setx	0x1920c04d4ee81785, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000d98eda7cac, %r1, %r6
	setx	0xadc47f2403f8684e, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000e6e6297a9c, %r1, %r6
	setx	0xcc4c14741c2cee5b, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000f7089e8858, %r1, %r6
	setx	0x0f8c1eedaee04666, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000d8816f3cb8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000c7e88b3e50, %r1, %r12
	lduh	[%r12], %r11
	setx	0x0000001040100000, %r1, %r6
	setx	0x0f8c1eedaee04666, %r1, %r10
	stx	%r10, [%r6]
	setx	0x000000800ff2c538, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e866eec, %r1, %r12
	lduh	[%r12], %r11
	setx	0x00000080d2bc74b0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x0000001000100000, %r1, %r6
	setx	0x0f8c1eedaee04666, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000f2cbc938c4, %r1, %r12
	lduh	[%r12], %r11
	setx	0x0000001070100000, %r1, %r6
	.word 0xe4418008  ! 275: LDSW_R	ldsw	[%r6 + %r8], %r18
	.word 0xa231a078  ! 276: SUBC_I	orn 	%r6, 0x0078, %r17
	.word 0xe031a078  ! 277: STH_I	sth	%r16, [%r6 + 0x0078]
	setx	0x000000809d071d2c, %r1, %r6
	setx	0x2f66d572c696ee2e, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001070100000, %r1, %r6
	setx	0x2f66d572c696ee2e, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000800ee3f0ec, %r1, %r6
	setx	0xa6592dbf9f66dc0a, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800f0933b0, %r1, %r6
	setx	0x55ffc2f67eb580ae, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000c4d8001958, %r1, %r6
	setx	0x2c717fdded6957ce, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000d1ecea43d4, %r1, %r6
	setx	0x619a94f96bb802d9, %r1, %r10
	sth	%r10, [%r6]
	setx	0x00000010a0100000, %r1, %r6
	setx	0x619a94f96bb802d9, %r1, %r10
	stx	%r10, [%r6]
	setx	0x000000ea9bca0b8c, %r1, %r6
	setx	0xe7a73c62d6032fd5, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001080100000, %r1, %r6
	setx	0xe7a73c62d6032fd5, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000fe992d755c, %r1, %r6
	setx	0xa4c785e81e0c91e7, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001090100000, %r1, %r6
	setx	0xa4c785e81e0c91e7, %r1, %r10
	stx	%r10, [%r6]
	setx	0x000000800e231144, %r1, %r12
	lduh	[%r12], %r11
	setx	0x00000010d0100000, %r1, %r6
	.word 0xe809a078  ! 282: LDUB_I	ldub	[%r6 + 0x0078], %r20
	.word 0xa8818008  ! 283: ADDcc_R	addcc 	%r6, %r8, %r20
	.word 0xec398008  ! 284: STD_R	std	%r22, [%r6 + %r8]
	setx	0x00000080f75cc4c8, %r1, %r6
	setx	0xb1e053d559c226a3, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800ec50118, %r1, %r6
	setx	0xa01ecea5489abb37, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800f82317c, %r1, %r6
	setx	0x73eeed836b9d1e71, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000ca0b768364, %r1, %r6
	setx	0x70075747166896df, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000d525d01f84, %r1, %r6
	setx	0x14592abc0a0f1c2b, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000ed8ab9f688, %r1, %r6
	setx	0xc73881fccd2c8e7d, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000fe7546e688, %r1, %r6
	setx	0xd2f7b987372a7bb6, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000cae9c7315c, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800f3ffa10, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e432c4c, %r1, %r12
	lduh	[%r12], %r11
	setx	0x0000008034921ff0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000fb1459f4dc, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000e8f6054b30, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000dcbb680ef4, %r1, %r12
	lduh	[%r12], %r11
	setx	0x00000010c0100000, %r1, %r6
	.word 0xe011a078  ! 289: LDUH_I	lduh	[%r6 + 0x0078], %r16
	.word 0xa619a0f8  ! 290: XOR_I	xor 	%r6, 0x00f8, %r19
	.word 0xe871a0f8  ! 291: STX_I	stx	%r20, [%r6 + 0x00f8]
	setx	0x00000080128c6598, %r1, %r6
	setx	0x04dc71c61849104a, %r1, %r10
	sth	%r10, [%r6]
	setx	0x00000010c0100000, %r1, %r6
	setx	0x04dc71c61849104a, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000800e13eb14, %r1, %r6
	setx	0x99e370e10160076b, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001020100000, %r1, %r6
	setx	0x99e370e10160076b, %r1, %r10
	stx	%r10, [%r6]
	setx	0x000000800f2684d0, %r1, %r6
	setx	0x6aa5e757f9798c5a, %r1, %r10
	sth	%r10, [%r6]
	setx	0x00000010f0100000, %r1, %r6
	setx	0x6aa5e757f9798c5a, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000c6156a9428, %r1, %r6
	setx	0x58c5eb8609a187e4, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000de0f9df34c, %r1, %r6
	setx	0xe7a16809227ff9e0, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000e2f641dbb0, %r1, %r6
	setx	0x654b663784c9fde2, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000f4a639316c, %r1, %r6
	setx	0xdea150b28343c7bf, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000cd5cec923c, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800f299384, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e2879cc, %r1, %r12
	lduh	[%r12], %r11
	setx	0x0000008029839edc, %r1, %r12
	lduh	[%r12], %r11
	setx	0x0000001060100000, %r1, %r6
	setx	0xdea150b28343c7bf, %r1, %r10
	stx	%r10, [%r6]
	setx	0x000000fb3d891310, %r1, %r12
	lduh	[%r12], %r11
	setx	0x0000001030100000, %r1, %r6
	setx	0xdea150b28343c7bf, %r1, %r10
	stx	%r10, [%r6]
	setx	0x000000eab2393bf0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000dd641c511c, %r1, %r12
	lduh	[%r12], %r11
	setx	0x00000010f0100000, %r1, %r6


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
	.xword	0x8f45c3d36428b703
	.xword	0x097d895090aad61f
	.xword	0x285523d8c91c1391
	.xword	0x39236f7571caec05
	.xword	0x9b7fe58026656f9e
	.xword	0xc9525e4ee1495786
	.xword	0xca75b761ae464370
	.xword	0x796288934233198d
	.xword	0xa86a2fa6e5510211
	.xword	0xa49ef948831a2b91
	.xword	0x6dd94f7c48a3e5fd
	.xword	0x2ede0e6b1f1bc737
	.xword	0x60ecc734433c2a97
	.xword	0x902b2011655e1bb9
	.xword	0x34ce87033c0fdd18
	.xword	0xcf1ed62a8341c3ac
	.xword	0xc51fc439465421d2
	.xword	0x9552e1138910219e
	.xword	0x271f9f80a176892e
	.xword	0x0ba6be5ac6992563
	.xword	0xd28fbbd6db51cc29
	.xword	0xde925241f14ecb9c
	.xword	0x637ad28a7e568606
	.xword	0x553ffbb32a944d38
	.xword	0xd842439e09b32d04
	.xword	0x06cb3601d7d7c7e6
	.xword	0xd2649e70ebaf9e6a
	.xword	0xe92a505beb13a13d
	.xword	0xf9701f00e8173168
	.xword	0xb09b7a8d46c7cac0
	.xword	0x3f8f85eaf9590680
	.xword	0x8a2b6cfb583b3c5d
	.xword	0x8313a5c0cabc8b3d
	.xword	0x2c197737b6ba3f8c
	.xword	0x227aa32e794e088f
	.xword	0x2c07dc5433ea1043
	.xword	0x4d043a8253b36c4d
	.xword	0x44fe12306186facb
	.xword	0x879a66e03b777428
	.xword	0x8940fc136084c194
	.xword	0x026f88dad35785cb
	.xword	0xa8894d75ff252c47
	.xword	0x1511c4014212336b
	.xword	0x5a9fe6e6de7cedb1
	.xword	0x4f18e2ae4592323b
	.xword	0xea14cf6d71c63206
	.xword	0x82a349d30a7d58af
	.xword	0x35ff4014bdddb349
	.xword	0x96d0492a4a0ef5af
	.xword	0x98592cf2a7159da1
	.xword	0x1896aa1d23871e44
	.xword	0xb64ee615ff8b7c33
	.xword	0x2932d07164c2892d
	.xword	0x8806596f98a2bfb7
	.xword	0x33ef7fa41eb8f6b5
	.xword	0x12c236136fbb1763
	.xword	0x0598bf10ccbb27b1
	.xword	0xac493743b060e54e
	.xword	0x303b2bd78f368029
	.xword	0xbf351d65f0c42749
	.xword	0x9b00466084f80cd4
	.xword	0xd6fca6fb66696a38
	.xword	0x3894e792195a643e
	.xword	0x7f1b11779cb33cda
	.xword	0x7e12bb5892112495
	.xword	0xcdb12d09accbb1b3
	.xword	0x9cc119a1e6eaf004
	.xword	0x2a2925ccdf956c5f
	.xword	0x0f6565ae04d98fb4
	.xword	0x9e5bf1165e3d40f2
	.xword	0x4ae1abce1e2835ab
	.xword	0x93cf2d4df2edf446
	.xword	0x5c39fce1ef15d1b8
	.xword	0xecc3385ecccef355
	.xword	0xa628307b8aceede3
	.xword	0xb62ca6a400f9cc65
	.xword	0x7d319db3a9bcbebd
	.xword	0xaee5966fe3516e05
	.xword	0xb860a0b3d7c18d1c
	.xword	0x57b425789bdefd78
	.xword	0x03e17583e9241d7f
	.xword	0xa913de49b89f7fb7
	.xword	0x60ed158ac19e7440
	.xword	0xae885e210aca7c9b
	.xword	0x4da0948c924ca774
	.xword	0x6325a7410a1058f7
	.xword	0xd6dd2cc52aaae602
	.xword	0x9879379784632391
	.xword	0x5c7e01ce01df9901
	.xword	0x2dddeabbb3d24a4e
	.xword	0x190a21526a4080ad
	.xword	0xf7ce96559d2b5899
	.xword	0x17789e0a7ef08e08
	.xword	0x2eae2714e0f67372
	.xword	0xbdcd2ea9c33b73b6
	.xword	0x13e776bb661280e0
	.xword	0x235514c60bf8c6e1
	.xword	0xeb4979bb7dcb5846
	.xword	0xc8f7fea83f4acaef
	.xword	0x3ca3c4385547e8c3
	.xword	0xe9698a2161321f12
	.xword	0x592ee71f428fbb0e
	.xword	0x32039b60061f3fa9
	.xword	0xecaeacf9b4f2b87b
	.xword	0x0d3c7d2c28e05da5
	.xword	0xc122fbd0ab77e841
	.xword	0x5f4d66f0594a40df
	.xword	0x237bbc556475fade
	.xword	0x80bc9737364f4eb8
	.xword	0x343b6476a6d66208
	.xword	0x4a9216da0a85374e
	.xword	0x7509e2a8a28106e6
	.xword	0x09ea1e18ed24eb9d
	.xword	0x3f663006f3808729
	.xword	0x23fa0d3ba528808c
	.xword	0xa4a38c9591155cba
	.xword	0x1ab043fe8a8001be
	.xword	0x37e6ee15f3b0e845
	.xword	0x63a131d1ead5aab5
	.xword	0xf702cf37600df748
	.xword	0x124e192faa249023
	.xword	0xd7004fe5de559537
	.xword	0x63bf5de3ca8ce03c
	.xword	0xe23d5b926224bc2d
	.xword	0x1ab28c6b50a04a0e
	.xword	0xb4b87afcc6e9d8f6
	.xword	0x3cee2cc80eaf8bd8
	.xword	0xf6e505ad00182e65
	.xword	0x2fdd94ea47eb595e
	.xword	0x9bf18b604bce2a75
	.xword	0x371ec856de84d11a
	.xword	0x90791b345f24eaf5
	.xword	0x10452cb808a630ff
	.xword	0xa52a3ecf45f653af
	.xword	0x174b17a4eb62e75e
	.xword	0xf4092ba181e0782b
	.xword	0x7dc593d0a0ada76a
	.xword	0xe49f8aedcf99917d
	.xword	0x8412f62a13415f39
	.xword	0xaa636343876edcc1
	.xword	0x7e654617c8651add
	.xword	0x8633c801119cd3be
	.xword	0x0d9aa4a08fe3dca4
	.xword	0x43bf359b137a17bf
	.xword	0xa8f70e91ca45e2d9
	.xword	0xa6720b26064e0e1a
	.xword	0xba7cdd177ce56362
	.xword	0xeebb7b0ae8807fa1
	.xword	0x3bee49c10c1b8af2
	.xword	0xe92678da808d90b4
	.xword	0x91f93c44d02a57f2
	.xword	0x729e76dcbd0f7f0e
	.xword	0xa0be3159eda14801
	.xword	0x39c4edaf95062b99
	.xword	0x9c67876a8c900447
	.xword	0x9c5b951e2fd058f1
	.xword	0x66ac8928e61d1722
	.xword	0xc3ffc05708363fff
	.xword	0xd3fcdb7871b79756
	.xword	0x5002ecf92b889be8
	.xword	0xe7964919324ca1fe
	.xword	0x42135f7916f2a090
	.xword	0x8fea61462e576fe3
	.xword	0x42dc5fd8128f4363
	.xword	0xb41e4a59fb187bbf
	.xword	0x62b38c8b4e5b55a0
	.xword	0x0851777bc44e3db8
	.xword	0x2f71a4a97167db9e
	.xword	0x651c4df1a9016c75
	.xword	0xba6ef4180f13a4b1
	.xword	0xe02107108ef7b1b2
	.xword	0xe3318378e0fac76b
	.xword	0xe27cb1b0c3040e29
	.xword	0xcba91ac4d5b54903
	.xword	0x4bfe95d0e84eeffc
	.xword	0x7ffb2f2eebd2621f
	.xword	0x899d45727151030c
	.xword	0x83c03ffc08102c27
	.xword	0x6d7ebc100a8a49d6
	.xword	0x52a49d5e7b4bc6b7
	.xword	0x2c28d1aaf99a5e10
	.xword	0xc5aea4b1b9fd0311
	.xword	0x22d3a55b57c1f51c
	.xword	0xa49419c02ff24569
	.xword	0x3bc48f78b94683be
	.xword	0x8f9ace74599115a5
	.xword	0x81b50011ecd8972d
	.xword	0x9a1eaec9a94f8810
	.xword	0xb329394657001beb
	.xword	0xbef8de9b2f8a3b6a
	.xword	0xb72fad5cf687fdd6
	.xword	0x4ddbff89ba5d6202
	.xword	0x0680b96711b0e0c6
	.xword	0x6d9225ad62fe3f29
	.xword	0xb7a3314b930f4120
	.xword	0x901d1040997013b4
	.xword	0x92eb7b92e8533be7
	.xword	0x202c462b4238265a
	.xword	0x4b694ae8fdb14c48
	.xword	0xb03cde9223e749d7
	.xword	0xf464fa531b27aad1
	.xword	0xcf5f5954b3747325
	.xword	0x87a74fbf66a33af7
	.xword	0x09a060504e52236d
	.xword	0x39520973880fbe8c
	.xword	0xe2ce4668582ce111
	.xword	0x90ac268009723958
	.xword	0x55caa40f22ec4925
	.xword	0x8dcfce8333379007
	.xword	0x508cc887219468b7
	.xword	0x38a8afdaf09a76f1
	.xword	0xc8a49a5fa9810b72
	.xword	0x8145a0283e9f807d
	.xword	0x58e2ed47ccea261d
	.xword	0xc5acd1a569f5db42
	.xword	0x73200ba731f15156
	.xword	0xe61bbb78d6699dd5
	.xword	0xbfd79c6ac1d92b2d
	.xword	0xa8aa8a8d6d5e88a6
	.xword	0x83521f48014a217b
	.xword	0x64d30fbaf66cc198
	.xword	0x07c1eaa543af9665
	.xword	0x728a36b447b8c267
	.xword	0x8515f0cacc4cd2a2
	.xword	0xc3305f0553ebf0a6
	.xword	0x7dc517b5555d6faf
	.xword	0x13d64f64eada3d6b
	.xword	0x7b7ceca30cf1c17e
	.xword	0x5316584b1275e489
	.xword	0xef5e3c5e23145a3d
	.xword	0xb4c6ed5bb84c2857
	.xword	0xc993a74cf9e5d7b1
	.xword	0xbaa2a9a6b683d4b9
	.xword	0xf6e3bd8ab8e0f702
	.xword	0xe3b710cb55dc467b
	.xword	0xfdff4f76324f29e0
	.xword	0x1279e16f38102688
	.xword	0xf2034c3b9634e3d9
	.xword	0x303a3aad97cc121c
	.xword	0x8bc134cbb7dadff3
	.xword	0x15ea967295a6331c
	.xword	0x2dffd0e5ee0bd513
	.xword	0xa4342655b7bb37ab
	.xword	0x60fb8c34a499bf1d
	.xword	0x92c7eab1fa76849e
	.xword	0x4ee89abe962720d2
	.xword	0xe4cc3724f0d0fa99
	.xword	0xa5acd0dc9fa47dbb
	.xword	0x74e4d1de6fcd095f
	.xword	0xccc1a903270f9389
	.xword	0x3f28a57e5bdb595d
	.xword	0x6334299771db1a5d
	.xword	0x16550fdc8ea0cfc2
	.xword	0xdfdb1ae7043f9c2d
	.xword	0xa5432ea5834baa2e
	.xword	0x4c0ec3993856ef06



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
	.xword	0x76c81eaa19d2f1c6
	.xword	0xe1762ced094ff1b6
	.xword	0xc7199c3d570b1e2e
	.xword	0xf5d8ce6842507ece
	.xword	0x86064bbae225ecd4
	.xword	0xa351f295d434cea1
	.xword	0xaab318eb18137151
	.xword	0x40bd90440bc2cb75
	.xword	0x5b2f61e652f72cb3
	.xword	0xfd12d1bf476f18fd
	.xword	0x273965129aa42099
	.xword	0x7009dfd6a37f5b5b
	.xword	0x76d6097f21b1c367
	.xword	0xa9328b6e34d9533e
	.xword	0xb288f9ed6f0e4177
	.xword	0xf4903cb1c560c4c1
	.xword	0xb4252efe89f63681
	.xword	0x3677a2cc16d44562
	.xword	0x546a04baf55dacc1
	.xword	0xad72bef6a2b87010
	.xword	0x12189e9eb55abba6
	.xword	0x33fb41eb0f680eaa
	.xword	0x13d05f9306a8d9d3
	.xword	0xac835b747cdcd5f3
	.xword	0xd3f978af6a73abe2
	.xword	0x9a2c068a9f69b504
	.xword	0xed56740672d3a1eb
	.xword	0xd0f705b7fe6289d0
	.xword	0x6694dfbeb958bfe3
	.xword	0xd961ea2634285ce7
	.xword	0x37c14454311b7c8a
	.xword	0xdd9d0271ed406ce5
	.xword	0xd92460f30385b3d6
	.xword	0xed276d61fdc14bfa
	.xword	0xe65d18b7210295cc
	.xword	0x67888208a0da65a6
	.xword	0x599b150c5b34a3e1
	.xword	0xcfe2dc0d8d75a75b
	.xword	0x30c8f56a3263244f
	.xword	0x9cf54f980f938c5d
	.xword	0xdf6ad89998994ea7
	.xword	0xe86d50694de93b27
	.xword	0x14bc7515d9751c43
	.xword	0xcd1f0f76a585aaec
	.xword	0x3475c680f9ffe576
	.xword	0x5d8e81a56b36359c
	.xword	0x9e5280db4037bd8a
	.xword	0xabc8525d8c14b5e3
	.xword	0x3af11ba00b0a308a
	.xword	0x2e4ee8cbfdeb5bcd
	.xword	0xdc9404cf6642faeb
	.xword	0x99a429991d5989dc
	.xword	0xc48a14ece430cba0
	.xword	0x857806617715917f
	.xword	0x4872ee33738ecef0
	.xword	0x3f414b38c3223eb1
	.xword	0x95e49c834052a5dc
	.xword	0x160766733b78e014
	.xword	0x4c376071d5519b4b
	.xword	0x441341085d5670a8
	.xword	0xc03eaf6eebf779c2
	.xword	0x8325acb9cb505d4b
	.xword	0x0bcd89e792b30ed0
	.xword	0x5f66fbf2f9f27ef2
	.xword	0x1ecc510ae81785b0
	.xword	0x863a287935fa11cb
	.xword	0x01f46cc6619fa188
	.xword	0x94c892d1dd08c40b
	.xword	0xb51d6e22ca4151ba
	.xword	0x3716e8c47d7626f3
	.xword	0x18d92aa62e73a0b2
	.xword	0x03a50dcaeda59cf7
	.xword	0xa6ee3a9b76d04a57
	.xword	0x7a762908c93257d6
	.xword	0x8f623a74fd15de8f
	.xword	0xaa28d493d4a271a1
	.xword	0x0812588d717c9d19
	.xword	0x889de46f8feb0deb
	.xword	0xae49b46419cbf6b6
	.xword	0x2f6e83f80c975cc0
	.xword	0xa3b4c14aaf33241d
	.xword	0x64054a852e5781a0
	.xword	0x2b47a4e8ecc6183e
	.xword	0x5229214338d2840b
	.xword	0x208c47aa3af92c28
	.xword	0xf0b2054d995883dc
	.xword	0x4bb814a44fefce6a
	.xword	0x6e2a2dde306d754d
	.xword	0xa2839a148499c540
	.xword	0x6df3ad1f70b348f4
	.xword	0x2fe9de6004910108
	.xword	0x65bcffe21c629dd4
	.xword	0x1fae88a0cbb3d1ca
	.xword	0x5a3eec2a52b33512
	.xword	0xe3d6a7483b2dd559
	.xword	0x289d160d55cda57b
	.xword	0xca2262317e75dcf6
	.xword	0xe27544600acf1f0c
	.xword	0x591fcdf6b5a5a18c
	.xword	0xe1e217795cb77ecf
	.xword	0x9dc72e8d9f667261
	.xword	0xe1cb3fdf2ccf520f
	.xword	0xc2e5970faf982e98
	.xword	0x0d68ae35f163e2c7
	.xword	0x4230a470806b3e3c
	.xword	0x4d8825d803c9611e
	.xword	0xaca140a0e0611639
	.xword	0x4e45b6023c4cd74f
	.xword	0xa099290658380d50
	.xword	0xba71868b40ab8c01
	.xword	0x0050eb3fdd9a1d7c
	.xword	0x91c18439cf5b36d7
	.xword	0x600489df4a39727b
	.xword	0xdaddb6eb658874ac
	.xword	0xd61d2977e7610516
	.xword	0xeae80d707d981d79
	.xword	0xcc3258b6d21de236
	.xword	0xa5c3f8677c41aa64
	.xword	0x20cc608b960b4120
	.xword	0x3fe0f248f265bcd8
	.xword	0x1569eebb3020f86b
	.xword	0xfe1191f4e76a8aa1
	.xword	0xde3aa2e759d8d4a4
	.xword	0xf68b1f22194a929e
	.xword	0x0f8a45c891cc0d10
	.xword	0x44d80db3967933e9
	.xword	0xd68d47e173e0db12
	.xword	0xc84a6b760f94a0e3
	.xword	0xd2d07dee77f0a98b
	.xword	0xd8eecfd1019e7b77
	.xword	0x95682e064a99a1d4
	.xword	0x52c140cadd21b799
	.xword	0x2f8c257354727fe0
	.xword	0x90c5f608e1047786
	.xword	0x01d278d0655c6ccb
	.xword	0x64c719b7d1ba2b1d
	.xword	0x055479287d651282
	.xword	0xbc492313b048e703
	.xword	0x70b4572e36dfae9e
	.xword	0x09d4dee9682660f2
	.xword	0xce8cc686fd60bea0
	.xword	0xa40252fbcd3673d0
	.xword	0xe3def43e9e44f7c6
	.xword	0x867102a3b39603d5
	.xword	0x22764b08b02c4074
	.xword	0xaf688d5893c71669
	.xword	0x1bff398cb2549065
	.xword	0xcf79da559a2c7e9f
	.xword	0xe5c04a86f6f8d4e1
	.xword	0x6debaf80066fafe3
	.xword	0x224eb3af3bcfd5cd
	.xword	0xffac51ac0cf76330
	.xword	0x12edc4cad0bf9cd9
	.xword	0x0698a4a32c797036
	.xword	0x5818b7f35e727d91
	.xword	0xc4f01e53765159b1
	.xword	0x266399b101bb49e8
	.xword	0xa0afd1f0a2170169
	.xword	0x212b02a0f44bcf8d
	.xword	0x6a98a50ee300b5ce
	.xword	0x4507e8a49f22c036
	.xword	0x2d8e633cfc51a9ea
	.xword	0x9ee3f7db5f09e487
	.xword	0xc301be3c480c40c7
	.xword	0xf3d86286cbf1d717
	.xword	0xaf6158d727c688aa
	.xword	0x7e83f54ff9481f54
	.xword	0x3e05a49c021db073
	.xword	0xd7cb08e9a20c88f5
	.xword	0xcca09c8e21196342
	.xword	0x740e922c194f1fff
	.xword	0xd6a906f53995a437
	.xword	0x29cad844d2b975c1
	.xword	0x36568b0b5c3a7ffa
	.xword	0x990a4f6d4d837ca8
	.xword	0xba9ee31565eea19c
	.xword	0xf72a5a6130b9bc20
	.xword	0x8146df80386a6ba1
	.xword	0x08b3a8117c2de531
	.xword	0x57a3146a147aee39
	.xword	0xe299f318515ceb45
	.xword	0x9318ab130341d9bf
	.xword	0x797376cd65379ab4
	.xword	0x8f2bcfbbf2e09919
	.xword	0x8f8fdad2366077c7
	.xword	0x235d9c9c1058d415
	.xword	0xc76b8911537be144
	.xword	0xe18cdab79e7e5b66
	.xword	0x23c55c85b84ec92c
	.xword	0x2cc9e337308a4066
	.xword	0x0c701d22fbbd58e7
	.xword	0xac6d2883300061bc
	.xword	0x381afb3c671e25f7
	.xword	0xb82dfffb4f0065ea
	.xword	0x4527600464cac743
	.xword	0x7814218d86b2b9e3
	.xword	0x6065bff499f4cb83
	.xword	0x211de0fbeb1613eb
	.xword	0x3fa726d5c0d45e48
	.xword	0x52c795fd0962c0ee
	.xword	0x4a3fd00581d94e1a
	.xword	0xa80434fb53a7a3ea
	.xword	0xc2aa3881fbcea02a
	.xword	0xf2f0b16cd9ced936
	.xword	0xdb75bb04873cf560
	.xword	0x91d4d5ed1a3a1700
	.xword	0x42bdc658a6032c09
	.xword	0x5a04f56efd864801
	.xword	0xa5fc79b387000bde
	.xword	0x41f67a8245af091d
	.xword	0xf0b75023998c8b60
	.xword	0x0a74ed56c316fc94
	.xword	0x15822a8e3f654360
	.xword	0xff6337e450d92a45
	.xword	0x9ea3116a846a2d64
	.xword	0x6938617ce1db19db
	.xword	0x6d20fe50a9596f66
	.xword	0x62dd9576dd6afafc
	.xword	0x499f57d37c665335
	.xword	0x962ccb0a978503f5
	.xword	0x44fd325899fa122f
	.xword	0x771703779f226c09
	.xword	0x727e2647e16a0f05
	.xword	0xae9b078b434c3004
	.xword	0x955b006defa59f57
	.xword	0x35692033b4959351
	.xword	0x689df273e61e6350
	.xword	0x9dffdfacf4b8480e
	.xword	0xce1da20ccaf724e2
	.xword	0xe0797d616e2798d3
	.xword	0xc16a32cf847aeb75
	.xword	0x104c29c942c25b4d
	.xword	0x182fbae54c9c255e
	.xword	0x33e587c923ffae3b
	.xword	0xbdc649c13f77b192
	.xword	0x16625c75b2266581
	.xword	0xaa11b53807751a6b
	.xword	0xa755592fddc4c0cf
	.xword	0xc5af83d48d98964f
	.xword	0x2ebdc47f4d05351e
	.xword	0xe1f1523a6d8f491e
	.xword	0xb31772976e068347
	.xword	0x8f231e0a0f480050
	.xword	0xb25923e22726aa1e
	.xword	0x24982328cf69644d
	.xword	0xadd5721530f36e4b
	.xword	0x1d8e11626da46f8b
	.xword	0x2f2ffc23721ba8dc
	.xword	0x2f73e60e87dd1cab
	.xword	0xd89fd199536bb72e
	.xword	0x200ba1b85d75883e
	.xword	0xb7066232ef2a6165
	.xword	0xdf8f1fe90afe6ba4
	.xword	0x491af3febe47fd91
	.xword	0x6fe0fe175a8b99db
	.xword	0x50770d1601e732a0



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
	.xword	0x85526bea4839c364
	.xword	0xabcde8a7ee806bc3
	.xword	0x0a0e5e469777747b
	.xword	0x56ae6152fe53c495
	.xword	0xf2e4543090e748cd
	.xword	0xad6316a18ae28575
	.xword	0x4fc9f648d365c622
	.xword	0x0dd188430c4b8590
	.xword	0x5db004ca28b42608
	.xword	0xfb1c8c045cade727
	.xword	0x36c8d729ccd08b4e
	.xword	0xc8167a8d87980bf6
	.xword	0xe27900298b16dae3
	.xword	0x9e3703ba80f263c7
	.xword	0x587a742843897858
	.xword	0xd37e7e4dd480a6fd
	.xword	0xb365783adf992af7
	.xword	0xbc71e76a74fd0132
	.xword	0x7e3147112bbd2a87
	.xword	0xa98cc06fb8b055b8
	.xword	0xfa6aff325363bc28
	.xword	0xd801e065673e76aa
	.xword	0x4cfe84ff1b64d3e0
	.xword	0xaa38b380cc58687c
	.xword	0x3a160f95aa9aea71
	.xword	0x23d39ae04acf70eb
	.xword	0x749d722393f08024
	.xword	0x03ce42757875f0e3
	.xword	0x8e3e7476050fde57
	.xword	0xff76f94eb9ba9a3c
	.xword	0x86864067f3d37492
	.xword	0x638d24fcde16dc5d
	.xword	0x017afc70a4a4a4a4
	.xword	0x5908dbb81f3d84dc
	.xword	0xe9608d92e5e29c09
	.xword	0xc72d99fca14f8886
	.xword	0xb8ac5983849d0b37
	.xword	0x2e68d72129bb68ba
	.xword	0xa598c5fd0a83cb05
	.xword	0x6a9acb02de0e086a
	.xword	0x6115ac53e0b7e743
	.xword	0x589ee28603e5c6c3
	.xword	0x072d82cb17d68b92
	.xword	0xa5f672e24a80ce71
	.xword	0xfd7711277fa7241a
	.xword	0x059e8e8446c6297d
	.xword	0x21a2734c5be2f88b
	.xword	0x54228d133829d6dd
	.xword	0xf4de275bf3a466f7
	.xword	0x51707e78ea74b5e3
	.xword	0xc9682878ee49e6eb
	.xword	0x22fc1f375229e7de
	.xword	0x955aa8f65fe9cf0c
	.xword	0xa388e40e71cbff12
	.xword	0x06f038313ab4c5cf
	.xword	0x6e28b0ba088af2fc
	.xword	0x6e87da0e3a522368
	.xword	0x429b2aacabef77d4
	.xword	0x8c99ceb6c5f78cf9
	.xword	0xa7ef36c5916b477a
	.xword	0xac6689987e4f9f40
	.xword	0xfe933c106d00c47f
	.xword	0x967cc11df9b67d91
	.xword	0x3d00f78b363c810e
	.xword	0x77d80f9a0221fbd5
	.xword	0x4966a065032e79a1
	.xword	0x307047f905f0c1f0
	.xword	0x5fd794f66c8c3982
	.xword	0x2311ca407f85bb26
	.xword	0x0463d6d7d3876ee5
	.xword	0x2eb14b834413517a
	.xword	0xe2a69a565fe2d6bf
	.xword	0xb2d93a711271ea42
	.xword	0x665f2db4f4aff4e3
	.xword	0x2a9b0e3d88db7d23
	.xword	0xdfc9743e3e66250d
	.xword	0x14ff1ee4bcce2830
	.xword	0x06c8663ddc7493c6
	.xword	0x540f18ad85c70742
	.xword	0x9d37a9eef31d9454
	.xword	0xb0d75b8f833413aa
	.xword	0x55ada3ceb4a4cb05
	.xword	0x7f575596196b84c4
	.xword	0xcae081b8ca65b8e1
	.xword	0x1d0be4d2e2482684
	.xword	0x845deda4a2a77668
	.xword	0x2c112e9b40f5315f
	.xword	0xe3b06174f88b01ae
	.xword	0x8a47ae71eff2dba8
	.xword	0xab0ced7611d5fb8d
	.xword	0x9a350242b5970b52
	.xword	0x7e2c329c917d76fc
	.xword	0xfca5cafb21fb6478
	.xword	0x8dade3869f20ee1b
	.xword	0x6ba79f53c1241b40
	.xword	0x199f74f9b54e4498
	.xword	0x0543dee4f08830fc
	.xword	0xaf0efd5f7bc475cf
	.xword	0x6fe6f4155257bcc8
	.xword	0x838671e5b14deddc
	.xword	0xba90bb37dacbeb8d
	.xword	0x716ac85b5a38a4c1
	.xword	0x6a6f0aa353639fb2
	.xword	0x384108fd10875cb7
	.xword	0x6b685a3c3be648e4
	.xword	0x2ff9bd233d98553e
	.xword	0xe732d80980a1c34c
	.xword	0x1df4fbdee8afab1f
	.xword	0xce50e4cac48415d5
	.xword	0xa33f858680f780c6
	.xword	0xcde4500f1ba3487d
	.xword	0x566762b118a44594
	.xword	0x1e2cbad46ef48199
	.xword	0x450bfec252069e32
	.xword	0x6ca578a2c6d0ea5e
	.xword	0x540c66eef27d951a
	.xword	0x927e0d9ef1dc0943
	.xword	0xb52f2340e05af35a
	.xword	0xf1bfaa5116fcc39a
	.xword	0xfea86ca69cce2b1d
	.xword	0x56049dd7b46a27aa
	.xword	0x21ac8ab3563a1015
	.xword	0x9f3c7b96f72233e1
	.xword	0xde7ef8150cd5dd59
	.xword	0x5557b700403b5fb6
	.xword	0x12761d919d421d84
	.xword	0x40de820a88ceea47
	.xword	0xf51ffbf81a58ce6e
	.xword	0x32e1b38571c1907c
	.xword	0x8bf477fd09302369
	.xword	0xf1a0803945568c8f
	.xword	0x0e1c03dc36147232
	.xword	0x66732d96a8f0f94e
	.xword	0x7d3214f94dbc28f6
	.xword	0x6744509cd88df9b3
	.xword	0xe9e6d9069d37079b
	.xword	0xc82f6664c2b9f406
	.xword	0x04657164ca6872b2
	.xword	0x2b2e9871ff4ba600
	.xword	0x6a48f7a563c5e48e
	.xword	0x2ebaa3bfd5b4fc8b
	.xword	0xe7584ff6d3ddffc9
	.xword	0x1378d44c3979c151
	.xword	0x6d50b59d693c67a1
	.xword	0x20f1c3eea09aea01
	.xword	0x4493caacc484b75f
	.xword	0x69295b9b478b3b04
	.xword	0x4d98eb9787d6326f
	.xword	0x2c2c889ee6f40c53
	.xword	0x4838b432e19b60be
	.xword	0xb6ad22f86be6cedf
	.xword	0xfff8e9976dc5306b
	.xword	0xa912529b7bf90b54
	.xword	0x97bc7a5a9ce1def4
	.xword	0xe44db42c3cf0ebcb
	.xword	0x731e9c22eecac0b6
	.xword	0x7e604203d48b3367
	.xword	0xd6d77310a0f66056
	.xword	0x151b98d92f65084c
	.xword	0x5d2f035ff117f121
	.xword	0x24c580ad1c01d8d9
	.xword	0x1f3546740f8326f0
	.xword	0x40a5fe1ee454a841
	.xword	0x522fd6b6ede3189c
	.xword	0xb141b998011514e9
	.xword	0x9765df2a8ee5d00b
	.xword	0x9cf5df7c2b917d64
	.xword	0x9e8eb3209e992c1d
	.xword	0x1a2c986bdf156f68
	.xword	0xf2736b14bf734d17
	.xword	0xdd37a36f056e3057
	.xword	0x0bd602e14b7da15e
	.xword	0x11e8fa665e5a64be
	.xword	0xb64510c267c94f4d
	.xword	0x675a1e8a6f297d2f
	.xword	0x37f4ba4918857616
	.xword	0x6c5241894d594bfc
	.xword	0x674386e613ff61d8
	.xword	0x608b2a17af12c7f5
	.xword	0x584bb75eb12adec0
	.xword	0x3d77392aef89e599
	.xword	0xfce95e84ff324437
	.xword	0x2d3f40e2208695b7
	.xword	0x7aab999bfcd3c9a8
	.xword	0xabfd3241cc6bdbd9
	.xword	0x352ba42e2039bee0
	.xword	0x97cae8362733a61a
	.xword	0xe3ccb1f125021b51
	.xword	0x994b8728ac67ab5e
	.xword	0x65b8f52ce20fbc78
	.xword	0x8dc8753e3454c634
	.xword	0xc87cfb463e2ad4e1
	.xword	0x12dfd9f32d7ed924
	.xword	0xc397b47886c10fea
	.xword	0xfe09fdc252e7fc1d
	.xword	0x8194e08b1cbd3251
	.xword	0x2a9685987a4733c7
	.xword	0x9cb87a84165dedc1
	.xword	0x8731ff0253fed656
	.xword	0xa58825c7f77c27e0
	.xword	0xd7b8ca34539be861
	.xword	0x7f69c11e255a56f3
	.xword	0x673ca8592e8c0cef
	.xword	0x4c57c4113891d37e
	.xword	0x24759d0c56a3ab73
	.xword	0x754dd88f6e28f849
	.xword	0xf2a0987f79dc1721
	.xword	0xd0d1717a20914e3a
	.xword	0x0b6e05c30c7d44ea
	.xword	0x347289296563cfdb
	.xword	0x13ac4014880d165f
	.xword	0x88be5bd6d87fae6f
	.xword	0x3d935a6c47c05e61
	.xword	0x8fadff802cbb7ed2
	.xword	0xf2fb532256e3e0cf
	.xword	0x839d1061e719fa82
	.xword	0x742ed4f1c3b9f565
	.xword	0xa341d634d513b7d6
	.xword	0x644036df633f0906
	.xword	0xd787a9f326b1a796
	.xword	0xf685b17c2fb5b96c
	.xword	0xc197e2ab332beed7
	.xword	0xb46b1ca0c14bb225
	.xword	0x157a148b709288dc
	.xword	0xd5fd932bfa91284a
	.xword	0x9edc3d21f5d3e406
	.xword	0x7df9e723d2fecf45
	.xword	0xd413e03b5db0b1eb
	.xword	0x501d22a24125fd10
	.xword	0x4f92cb6123867679
	.xword	0x020e7efb5d5fffa9
	.xword	0x3030648f851b2abe
	.xword	0x0488f1d397b9ba0e
	.xword	0x7e93988c6a9edbe7
	.xword	0x0b50e38f69f1e94a
	.xword	0xd88e87bb70c23f1d
	.xword	0x70e62382ee7286ae
	.xword	0x3bead56ed6c7c6c5
	.xword	0x196a2d1255903dbb
	.xword	0x6ebc3045c6ebc0d1
	.xword	0xa42c059a541871ea
	.xword	0x229c5a038db64293
	.xword	0x466951ad7052d348
	.xword	0x986dbae19cb67648
	.xword	0x7e6a03e2a127f09b
	.xword	0x59c7af1b61513629
	.xword	0x6f677854e5d22fbf
	.xword	0x00f6de738195d916
	.xword	0x23db585d5156b709
	.xword	0xb4c6c0aff569a3b7
	.xword	0x405d4b7f75b097c2
	.xword	0x9c47b38ba46fce08
	.xword	0x3b40c3966b12fde1
	.xword	0x5667190b29492b2f
	.xword	0xb4b62721b972c899
	.xword	0xd08ac7a80d25a866



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
	.xword	0xf4f474352aa82e8d
	.xword	0x57165693d32d839c
	.xword	0x4d1c997495796402
	.xword	0x932f4a7e2457fd61
	.xword	0xcd135a61337c19c3
	.xword	0xff034dcfcd721fa0
	.xword	0x3b6e3137e97b21f4
	.xword	0x0a8f389cc4a106f2
	.xword	0x9e2214b0717594f5
	.xword	0x0b7d9cfce6564212
	.xword	0xddd245e3d23bcff0
	.xword	0xbfff532b25bf96a3
	.xword	0x272789dde1accf27
	.xword	0x1908a30b71322946
	.xword	0xec55bc07cefd01e3
	.xword	0xcea20ce014ec3360
	.xword	0x75c8a5b8a8215fad
	.xword	0x2e97fc4ee9ee2a94
	.xword	0xb3905df5c419d294
	.xword	0xc0383f5fafcb7134
	.xword	0xd8690abd1063fad1
	.xword	0xf2466f111bab89a3
	.xword	0x0b086b984384a6bd
	.xword	0x98d0e538d397fedf
	.xword	0x3a42c81bb62912d3
	.xword	0xce9e04a9f3a5a2b2
	.xword	0x3c61b828392152eb
	.xword	0x02147ee5451318b1
	.xword	0x8231f802f56ac0c8
	.xword	0x22fe22ef90d9d27a
	.xword	0xf87d64b5df034a00
	.xword	0x6b40360a5cc13580
	.xword	0x44cf84a4ee0c9935
	.xword	0xcd8b31401686ef35
	.xword	0x64c9cef959984682
	.xword	0x1c1428ba4dc620f5
	.xword	0x524a51e23eaf664f
	.xword	0x55b969588d30d2ad
	.xword	0x70914caf4e2c43e6
	.xword	0x081e985a59690b14
	.xword	0x3fae1e1b535474dc
	.xword	0x14f264b6e8384573
	.xword	0x2d0abb89ded3f805
	.xword	0x627fbf9efc6a2bd7
	.xword	0x1530e60ba19a8912
	.xword	0xb35ae1454bf0fffa
	.xword	0x3d6e85cb5a39eeb3
	.xword	0xc82ac55151869bea
	.xword	0x1448e7d40f237ca5
	.xword	0xb78329833c5dcd21
	.xword	0xa99fce06135e1d3c
	.xword	0xafb1b37efbbbe169
	.xword	0x3051debb390a3571
	.xword	0xedc84aeeb150b3cd
	.xword	0xf2831a0ab1836c9c
	.xword	0x3004b3558afb562a
	.xword	0xf337df9066e238ca
	.xword	0x304a04e30d9990c5
	.xword	0xcad04544417a6281
	.xword	0xfe9fd140bf87affa
	.xword	0xb1a919358e215ff8
	.xword	0x32f8281ba247659b
	.xword	0x175e623de7fea079
	.xword	0x7dbd6c7c7ebceb1e
	.xword	0x27aa0e12a5fa07c3
	.xword	0xe4fde9336a7c7610
	.xword	0x9a86a1155db79e05
	.xword	0x193c056ddcc73131
	.xword	0x36d5cc73936101fd
	.xword	0x50b8e134b772f9c2
	.xword	0xf20e8c475ade2105
	.xword	0xe9acc01a75034816
	.xword	0xc889bd818be5f50d
	.xword	0x5de7c4f74995df53
	.xword	0x3c0d271cd5a5fa05
	.xword	0x3c27782760418fa6
	.xword	0x6b555eec274c5ef5
	.xword	0xef8a62352dbf0c08
	.xword	0x152da4bc3d66e958
	.xword	0x285d5f6bc0bc2172
	.xword	0x37ae259cd95bedf7
	.xword	0xb0a6ba2dbe3fe5ef
	.xword	0x3e128903b6326fb1
	.xword	0xf4f597422d291b8f
	.xword	0x84319e562c325879
	.xword	0x366613c9d0fade82
	.xword	0x7a645ee6a81c8916
	.xword	0x0051d2adc7e643c0
	.xword	0xc0dc97fa320fab82
	.xword	0xbb1ab48fad1dabfb
	.xword	0x8d061fb20603097b
	.xword	0x26e2269a83e8d6d8
	.xword	0x1a9de7598b00eb9a
	.xword	0xc73d91d40b1ab938
	.xword	0xdad740df78096395
	.xword	0xd96747175e2d0c21
	.xword	0x9c5c2ead16b510de
	.xword	0x4d83731d54148449
	.xword	0xab0b737fe8fb6ac7
	.xword	0x0d871fdb4809f743
	.xword	0xdd566380bfe4d411
	.xword	0x027a48763573cbb6
	.xword	0xf58cf8d17a6aaecf
	.xword	0x36db6d3d4fff1978
	.xword	0x2f4d289a9482a173
	.xword	0xe7a2c0b670a38389
	.xword	0xc4c39e46a147f6ca
	.xword	0x76ba695a91e5fa60
	.xword	0x7fa3b562e78ab0c0
	.xword	0x7009d3796df6d139
	.xword	0x7ed2febebf830fe0
	.xword	0x1c1ed89b9a2a9600
	.xword	0x286b9f3b52c8226f
	.xword	0x522e051c24eee780
	.xword	0xd0768dc3da057b91
	.xword	0x2a1b4209a1d6d01c
	.xword	0x746775ffee451942
	.xword	0xc009574fa7da1fc0
	.xword	0xb58200680e2a1d8d
	.xword	0x3c56168529b2462b
	.xword	0x1d78df3ad3e83888
	.xword	0x0f7bcd630f54acdf
	.xword	0x7e94db9a3a935e67
	.xword	0xa149a5a0031618cd
	.xword	0xe47b76fdbd90a08a
	.xword	0x257cccbac4946a5c
	.xword	0x7266d5a98060672c
	.xword	0xc34b1b2652af06da
	.xword	0x6e24fc099f57ef8f
	.xword	0xda2b379002511aa3
	.xword	0x6a8f72e142bc7a63
	.xword	0x28b1150abb55ca20
	.xword	0xa0eaab51232acab6
	.xword	0x0d23d5a45496f5fe
	.xword	0xa8ccc352a608257e
	.xword	0x4b543d739b534845
	.xword	0x7e8a7b4631d67da7
	.xword	0x88f91f9c0c189fca
	.xword	0x011c8dc518038f09
	.xword	0xf55e26da898c292e
	.xword	0x0e1a1805499d738a
	.xword	0x94df370c992438fc
	.xword	0xa911a6d8b22f64d6
	.xword	0x91fa804068ae732d
	.xword	0x3efd909476af7c32
	.xword	0x1407b39f61578726
	.xword	0x2deb3bc0dbb19491
	.xword	0xe8efef1509fbe96b
	.xword	0x8116135ab042686d
	.xword	0xd7fe39e7b1edf465
	.xword	0x70c998845770981d
	.xword	0x0e783fa368a4282b
	.xword	0xab77fd0479030833
	.xword	0x7908780aa9ff559a
	.xword	0xf14c7c7b5823afe8
	.xword	0x1b132e2fee1d6e7f
	.xword	0xbad890c27b61ff88
	.xword	0x6abc9b001e97a2bf
	.xword	0xf065dcca55db492b
	.xword	0xf80d160ca3258ff9
	.xword	0x81734280b7d171a6
	.xword	0xacac8c3a92254180
	.xword	0xdd7faf3339ea02ac
	.xword	0x6466be9afbf730d6
	.xword	0xe832861daee1ef04
	.xword	0xcb21eb0ccf3d9c9e
	.xword	0xd2993f83961ef3f1
	.xword	0xf1f092e8071bc0c0
	.xword	0x947220f89b2d0a41
	.xword	0x83b7e60d09511f12
	.xword	0xdff516bc40e63cc7
	.xword	0x6c2433f9fb3982d4
	.xword	0x00171a9c244f4025
	.xword	0x2824b7a0da3a9be8
	.xword	0x9e83e2445955350f
	.xword	0xbcb2f73b225afa0c
	.xword	0x5fa5f69abde7202d
	.xword	0xb45470f25e1a31f1
	.xword	0x4275ff106efb629d
	.xword	0xcfd936161a5b76ea
	.xword	0x38db5b3e3ae49005
	.xword	0x114dd2dd20b19aab
	.xword	0x3e77d555677b1d1c
	.xword	0xcccb56a18cef4af2
	.xword	0x1839690b8a09affe
	.xword	0x3abe67b055a0dc37
	.xword	0x703642b11086725a
	.xword	0xdb1482e1c44808a7
	.xword	0xfe69994c8a37bc24
	.xword	0x11c164a40b2731fb
	.xword	0x3ff512b0ddafd402
	.xword	0x1b2b22fbdeb77659
	.xword	0xa0aab78510720619
	.xword	0x78df1d01e35813ac
	.xword	0x906bba32dd50bbaa
	.xword	0xc885b13db864ea8f
	.xword	0xb902c3ae50ef86f0
	.xword	0x3a58279625faeb9b
	.xword	0x21cc425905df8950
	.xword	0x6dec19b352dba762
	.xword	0xab3982697a6f51b0
	.xword	0x2b5dbc2f187174c9
	.xword	0x267a21a4fed3d86e
	.xword	0x9ab0e9ffaa57c352
	.xword	0x027240ce8ca18105
	.xword	0x217bcf9ae97a9f23
	.xword	0x98e743b9e80b9c4a
	.xword	0x896a3a5cb6329324
	.xword	0xe70816ea980cca7b
	.xword	0xc017b736653f4e39
	.xword	0x89613faac534cfbe
	.xword	0x44554a15270b974c
	.xword	0x447bdcb45a314b6e
	.xword	0xd48a0fec1283b203
	.xword	0x18a746d1c60ddba6
	.xword	0x8ae40891e33a8a83
	.xword	0xb0d11a5da6436917
	.xword	0x9b9969a44c70b215
	.xword	0x0a8c1203bfc8823e
	.xword	0x364cf52cc276056f
	.xword	0x92ee923a130bb4a9
	.xword	0xc463d9551680fede
	.xword	0xfd6fc2d4b4cd557c
	.xword	0xcadeacd6d6ab44ce
	.xword	0xfb3bf72f87cc802d
	.xword	0xe5c4629e630cede3
	.xword	0xefc89629f8f1db47
	.xword	0x8b77d762ac29a060
	.xword	0x089194356c821445
	.xword	0x5701aa00f27f4629
	.xword	0x98d7204536a9fde8
	.xword	0x4fa2f407a8f10bb0
	.xword	0x8e03b808e68e3fbc
	.xword	0x085b498106a4a595
	.xword	0x39f0d4a03155587b
	.xword	0x6e8e428470054d5e
	.xword	0x0a13f4bec9f1aa68
	.xword	0x373c6c2ac5d40c5b
	.xword	0x6b84457c758c09d2
	.xword	0x218fc8d9eff9b0b7
	.xword	0x535daf4263c82fac
	.xword	0xbe2c63e76aebc75e
	.xword	0xb484d73faf603d9f
	.xword	0x2dd73ece3a3f2eca
	.xword	0xf94cbc05b1c8e585
	.xword	0x5bf66bf338b10a47
	.xword	0xb42074b96add71c4
	.xword	0xcb1a2eca1bfebcc6
	.xword	0xb4c0f5bd9a87cf1c
	.xword	0x70bdae3f6cd77fda
	.xword	0x60d208618b876bad
	.xword	0xc6f1a4a67b33793b
	.xword	0x9aa55eb250f9973e
	.xword	0xe925c574ce4610b3
	.xword	0x1fc1c7ffdb09e02f
	.xword	0x519d89e49cea124c



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
	.xword	0x752607823adae1c5
	.xword	0x50a29fe34e75e670
	.xword	0x1c9d95c25e9e45c4
	.xword	0xb511d9bc7378ab54
	.xword	0x4c0f4d3f73615c2e
	.xword	0x762f7e30004fc71f
	.xword	0xe51def34150e340f
	.xword	0xfd654a60a3e7a387
	.xword	0x90b795f9b0ac38a6
	.xword	0xe21f3cf6addc802b
	.xword	0xd573a7bfa8d407b9
	.xword	0x98be60fdf28624b9
	.xword	0x580de425b1379ab1
	.xword	0xcf4615030b6e4f23
	.xword	0xea5b6b58da8bf0e9
	.xword	0x541bf9fc7d6f8bd6
	.xword	0x8149b9bd15687ab4
	.xword	0x78b4d153c9fdf8d0
	.xword	0xf233a250dec654ff
	.xword	0x73e8bcda90a11f09
	.xword	0xeacd150a0bacadb1
	.xword	0xf4d902dc2512b423
	.xword	0x5c4da823b91d175f
	.xword	0x5e8a8776b892941c
	.xword	0x54cc41dfa2660218
	.xword	0xda257fe628c6b90e
	.xword	0xd8ae694a67dd9fb9
	.xword	0xd86ce6dcf90848a2
	.xword	0x121dd737c00f63b6
	.xword	0x58d6a71af320acbb
	.xword	0x1d7482604338dc1a
	.xword	0xa26fdc83acb35e83
	.xword	0xc77bcdf058f10b8d
	.xword	0x0f1461469a863066
	.xword	0xe96db6d86c58667f
	.xword	0xf7b4d4207f96c97e
	.xword	0xa94452a3e58a0a7b
	.xword	0x5f2d1095da12e31a
	.xword	0xa13cc470d64ada22
	.xword	0xd9324f4912a4e3f2
	.xword	0xdde886ecbf80e261
	.xword	0x37a08cb923a20921
	.xword	0x1e8f28ead6b4efad
	.xword	0x139b7b1f61fa78d6
	.xword	0xda56fe1f3c393e96
	.xword	0x2abd0a2c66bce454
	.xword	0x8a6707c5b592330d
	.xword	0x3685ea7d07be0ebb
	.xword	0x8084f36107f289e2
	.xword	0xc5fa670927b9b121
	.xword	0x2654132c58adcc46
	.xword	0x70faa677754994e4
	.xword	0xb3d8079e178ae850
	.xword	0xd446a7877b40759f
	.xword	0x328eaee766764fc0
	.xword	0xcef047f51192a2b1
	.xword	0x46abe684ee3c6d9e
	.xword	0x13eda4aee61d41a9
	.xword	0x43d7d30e8f7d7ea7
	.xword	0x022f8b4d1f45db1d
	.xword	0x6a33ae4110b9a776
	.xword	0x7681fd307b586bb4
	.xword	0xe735e474dcf01780
	.xword	0xdb58fc95524394b3
	.xword	0xdf65728b95dda029
	.xword	0x153e9f145db7c21c
	.xword	0x0fe0021c4bc65bcf
	.xword	0x6b3176abfc4394b5
	.xword	0xdcba80b9aa27f0c4
	.xword	0x2bbef3b054580a1b
	.xword	0xcd6d60e12381bf4c
	.xword	0x3f14c649fe491d43
	.xword	0x9aed91f3a6c7230b
	.xword	0x58ab64a529fb2cb7
	.xword	0x3031f5a357aa5eae
	.xword	0xbafa061946e286c6
	.xword	0xf26447e4c0b84fd4
	.xword	0xf05372fcbdd3b90c
	.xword	0xa05144a6b2f5065f
	.xword	0x0f48aa5b606d2c56
	.xword	0x72a53f1151c36032
	.xword	0x6bbfb9a6eda685a3
	.xword	0xf8912d05eace7920
	.xword	0x123cebaac476e0a5
	.xword	0x14495d3d5328eab7
	.xword	0x91ced7c7b7391771
	.xword	0x4bc13b275a7c55d3
	.xword	0x08dafa8a92989b54
	.xword	0x366a0e122fad9c17
	.xword	0xc7273d64ac344966
	.xword	0x1f19e26c22746115
	.xword	0x93ab6d350a81adea
	.xword	0xea055b5ed6202662
	.xword	0xb874489d66cd7c2c
	.xword	0x60d118469011a382
	.xword	0x6a4bcd92d00c5893
	.xword	0x51280913f92b1154
	.xword	0x77c282a19119b7ba
	.xword	0x11aa86b5b7ca0d50
	.xword	0x08573ea3ba18be2c
	.xword	0x51d4a7cdb503c6e0
	.xword	0x98c40759c637b7b0
	.xword	0x8e01b88821be8455
	.xword	0x8f675b079c9d1dfb
	.xword	0x59f3f72bd516399e
	.xword	0x12721aa7cc3766e4
	.xword	0xae062635a3483d0e
	.xword	0x0f6d64c1256e79f8
	.xword	0x18f9b8f83a7b83f1
	.xword	0x2fe68c8dea713dd6
	.xword	0x19cad0bc91d67b76
	.xword	0xb262160010c1c73d
	.xword	0xe58630181f491f60
	.xword	0x3b259bbbc91bbed7
	.xword	0x68c142968aa35bcf
	.xword	0x18e438930a6f859a
	.xword	0xeefa1cee09f36fe0
	.xword	0x3ae32d2ee2762d07
	.xword	0x26ca90bee03c2fc7
	.xword	0xb05af83af4cc8393
	.xword	0xf396933b3efab2df
	.xword	0x26eb400f89e91e78
	.xword	0xe7a083fafd234175
	.xword	0x1bcc100d56b28288
	.xword	0xd1a2c7aaef39a7a4
	.xword	0xde9a15f845c51a62
	.xword	0x414a8c4b43ce2fc4
	.xword	0x604fe10dde00619a
	.xword	0x936b0a44922e6b88
	.xword	0xa9f1b6e82d4fb1d9
	.xword	0xf30a95e66d29f8e3
	.xword	0xfc7d1a5c95c8c0d1
	.xword	0x7c9cf6811b510789
	.xword	0x1e3e024e7860fc1c
	.xword	0x904d094aea06b9fe
	.xword	0x8936f28cbd50f7cf
	.xword	0x16a057615978d332
	.xword	0x83ed7753e2097e63
	.xword	0x37a7b39044d74fdd
	.xword	0x3741fcb4a39e8c8d
	.xword	0x4716844505b2b367
	.xword	0x38232ae7e711cb14
	.xword	0xfc40990de91705c2
	.xword	0x1ec045c683a2f577
	.xword	0x8b0fd104b1495d54
	.xword	0x2ff5b7294091968e
	.xword	0xd93279efa52582d3
	.xword	0x9ce7a4ae29d80f73
	.xword	0x5699a60670b684be
	.xword	0xa1e7eaee115ac645
	.xword	0x8346c29d6ad1c15a
	.xword	0x8660c26bfbbec103
	.xword	0x25db3558f9a5bd62
	.xword	0x199ef3655f1814d6
	.xword	0x9c839733864ff16b
	.xword	0x998595a6f16a0812
	.xword	0x9e35225cb68be412
	.xword	0x5dc9d564269bcf07
	.xword	0xa46691584b8528e2
	.xword	0xea8e2d8c1ab6eb5c
	.xword	0xfe6995b2c9978d95
	.xword	0xf17593bf38bb273c
	.xword	0xba055d0ff6b93ed4
	.xword	0x837a6c886cace581
	.xword	0xaa125fbba613f5fd
	.xword	0xd916ebe2e5037e96
	.xword	0xdb24e4c307d2bfa3
	.xword	0x148d68dc3957c272
	.xword	0x3602f328b419522b
	.xword	0x51718e16ba486144
	.xword	0x54720f2a33ef6f7d
	.xword	0x9b1292772d1ef361
	.xword	0x785db24b951a0407
	.xword	0xea77c477ff99dc72
	.xword	0xcc54028cf5ed3176
	.xword	0xf9a32b58c6ab7ef9
	.xword	0x69c7d8cc53f8c8f1
	.xword	0x7a6728dbc3a03479
	.xword	0xd7c33bfb46560d65
	.xword	0x0cec5c43a2fc8c62
	.xword	0x5cc0e3685821e757
	.xword	0x1834aafd3ad8d74f
	.xword	0xfc15f736aa9a118e
	.xword	0xf139e91bfc8372fa
	.xword	0x45faf3d95873af6e
	.xword	0xce10b8ea6a8d7237
	.xword	0x8eaa81026af939ce
	.xword	0xfeb67adb93927199
	.xword	0xaa20182a0205248f
	.xword	0x99dd00ca3c30cb2e
	.xword	0x054b87eec79bb42c
	.xword	0xc4a75352dde34dc3
	.xword	0xa9b31f8f072fa27a
	.xword	0x7e04a8effedbaf91
	.xword	0x84af3ff4f3039c3d
	.xword	0xf973c8d35a4c4463
	.xword	0x95b7cdb91c93edb9
	.xword	0xcb55e978f3be8a1f
	.xword	0x1565033bbb7b83dd
	.xword	0x3f2466c84c4d82a7
	.xword	0xffc3fb60dd4d5cd9
	.xword	0xc28ae63052584097
	.xword	0xac186a307720c4a7
	.xword	0x269d6ab03ca23397
	.xword	0x621fe4aa71d5b6a8
	.xword	0x8ba506dacfcf4514
	.xword	0x60eb48b32ba2248b
	.xword	0xeed585cad60ce17c
	.xword	0x23356109fefc1288
	.xword	0x80e49ab608cacbd1
	.xword	0x56ce074a0f20c8cd
	.xword	0x222c01b943f06592
	.xword	0x647e15fcf805418a
	.xword	0x7e9e756d40012ee0
	.xword	0x9a9aaf7d0148046a
	.xword	0x8472c12d3d2c223a
	.xword	0xbc6cf93a347b115e
	.xword	0x37dc233aef435974
	.xword	0x0c66c40982100d13
	.xword	0xc5b413a1e4036092
	.xword	0xe4a786d8c5b4c51d
	.xword	0x1551bb8de556d6ca
	.xword	0x2af34177a319e055
	.xword	0xd49793fa6b40113a
	.xword	0xbe2bf5a50715a993
	.xword	0x6bac46e16b423555
	.xword	0xc11f734e2c9c8a14
	.xword	0xb9ec930122ae58d2
	.xword	0x477d7dcfe9dd9e4c
	.xword	0x09048639129e5715
	.xword	0x3d1ee092faa03ace
	.xword	0x577cfcc7315c9652
	.xword	0xd74626e1e3097c40
	.xword	0xd9e07736069eab17
	.xword	0x073699229bb1a208
	.xword	0x1ce9838d988def1d
	.xword	0x9ba1ad1575bc4ae0
	.xword	0xfb2ca81e97cb6893
	.xword	0x201d4f852a4c9643
	.xword	0x770883f164bdd4f0
	.xword	0x466868bba93d0532
	.xword	0xdd1f9c709652556d
	.xword	0x27558f828d6e2ad8
	.xword	0x2fb29260edfb8591
	.xword	0x248cb609c74c2477
	.xword	0x20b10d014924dedc
	.xword	0x0bb54948a3f20a8b
	.xword	0x29a47ee71c5e468d
	.xword	0xbdf51d11fece14bf
	.xword	0x7cd21a7539a999af
	.xword	0xff08f8c0713eae3d
	.xword	0xcf95dbadaeb2ea17
	.xword	0xb7e09c35afeb1106
	.xword	0x948cf0be804a4032
	.xword	0x6d0b1e8b3e1586ef
	.xword	0x8162322308d001f8



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
	.xword	0x5c01a42ac0b5eef1
	.xword	0x7a996c17ce562be4
	.xword	0xeeb48f4aead1263f
	.xword	0x82ade32873b228a4
	.xword	0x44dd20320fdd9e57
	.xword	0x335e5172f0527b91
	.xword	0x82d3e5722188ff0e
	.xword	0xba72857020ce1354
	.xword	0xda592f074db751fe
	.xword	0x9d2987ba9edffc6b
	.xword	0x9bf0b9af406cbe45
	.xword	0x5840425d36b7a593
	.xword	0xdfea03ae1cdbd3bf
	.xword	0x2d1710c60af6f405
	.xword	0x9339f0578d7ec313
	.xword	0xe48fb2a5f89fc21a
	.xword	0xa2a308020494598c
	.xword	0x68d7a53257c52da0
	.xword	0xa452ee408137307b
	.xword	0x5189d6d9560e4c30
	.xword	0x47426cca0df67591
	.xword	0x6d2bd84e1a1ccd5e
	.xword	0x8cdf10d12a19337d
	.xword	0x499b580b46d5ee65
	.xword	0xd3ccfcbfe5257422
	.xword	0xa1fdb7e9d1fec32f
	.xword	0x7a39bf047a495a08
	.xword	0x6491296289a37ff1
	.xword	0x994b79ceca48b6b2
	.xword	0x49d72154be310e28
	.xword	0xbbd2852d1863a49d
	.xword	0x4b79c69f5af7bae3
	.xword	0x43de14ba630018ff
	.xword	0xa439b6ad26a48c59
	.xword	0x4c01304884f19c9b
	.xword	0x764c9c2630e5c9d5
	.xword	0xe9558a1c143f6044
	.xword	0xd0e735e8e27e10bf
	.xword	0x1526cb3f62123079
	.xword	0xb6fab04b8a7a22dc
	.xword	0x90fbd6395248c21d
	.xword	0xbcc716f17100e5b3
	.xword	0xc026f29e55811300
	.xword	0x5074db42c7cc503e
	.xword	0x6b95362b7d1747b0
	.xword	0x5b3783d50575e071
	.xword	0xb2b15dfb496a9b2a
	.xword	0x892c7a62c686e546
	.xword	0xdd09262bb0e97b8a
	.xword	0xac6b5c7c13d0cb19
	.xword	0x6cd3b1da056797b9
	.xword	0x0647d8424d5338e1
	.xword	0xa92d12a8451e6e24
	.xword	0x3e795af81d08a911
	.xword	0x977400e7d1f8cd12
	.xword	0x03e6a2c5a452d9d2
	.xword	0x38119eba52705348
	.xword	0x22eb31c8a91465e8
	.xword	0xf4b97dd6905ef54b
	.xword	0xfe75903c508c1b0a
	.xword	0x6251ce2541a932a8
	.xword	0xae95ddd87c278c58
	.xword	0x15a5007f9ad0df1d
	.xword	0x3fb4acfb449498f0
	.xword	0xdbf72d63936e7e77
	.xword	0x8c070fe10555316b
	.xword	0xde99bab064f32a1a
	.xword	0xe4c26acfba737d14
	.xword	0x62ed9a1f292c9aa6
	.xword	0xc168684f051e87fa
	.xword	0x946a127452f13feb
	.xword	0xda9bcf45176f064a
	.xword	0xfe84220b40bb4a92
	.xword	0xb249406964fc8523
	.xword	0x81bd984927925dc2
	.xword	0xed53fcfbddb5dc00
	.xword	0xba9be95ec8bf80c4
	.xword	0xf2979ad78794f0e9
	.xword	0x0cd4d026966bb1b6
	.xword	0xc30de92a0b64ce0f
	.xword	0x0f50845d0a52d238
	.xword	0x23b36f471b42bc49
	.xword	0x420f59c201a6efc9
	.xword	0x72b839b4ea4aa91c
	.xword	0xf31ea53e726589f2
	.xword	0x6517b25f502d4733
	.xword	0xaa2784651d46c4fc
	.xword	0x66570732d9b06d0b
	.xword	0x1652de19b5e409a9
	.xword	0x7f7ae4b055fd4f5b
	.xword	0xa3e00e4fae33c89d
	.xword	0xa27905030b71565e
	.xword	0xc871756019630181
	.xword	0x796acecbf8871fe2
	.xword	0x5e8646e2ff0816ed
	.xword	0xe5a203b265f05d31
	.xword	0xc914f3d1bd8d657a
	.xword	0xbba04b5641c5b8e7
	.xword	0xc7dbc01fd134f145
	.xword	0xfa72895a2e2e66c7
	.xword	0x83f1fa564c5d15ec
	.xword	0x464897538e6d5d18
	.xword	0xb913e66422a84cc9
	.xword	0xdb7e33fd666672bd
	.xword	0x8b54d260fbdb9b99
	.xword	0x8f86c6d907ca5704
	.xword	0x7b57505d6bbf3231
	.xword	0xf8a861bea06d4397
	.xword	0x4557d24d8611e001
	.xword	0xc73f1855b94931d7
	.xword	0xe762b234dd17daeb
	.xword	0xc4ecde2a83b8dd69
	.xword	0xda44ac3c67681369
	.xword	0xc08ba2c8748c6cc1
	.xword	0xf10b1f18c41e6b0a
	.xword	0x80bca4153ac1154a
	.xword	0xa127c3d9ab8e8d4a
	.xword	0x0603f7fa03f04d63
	.xword	0x700f4e39aa7d79d6
	.xword	0xdfb66f189d76cbf0
	.xword	0x3f2bec1fcdf45670
	.xword	0xca24c2456f01ce2e
	.xword	0x8d6c4f3ffda6fdf9
	.xword	0x55c241a0882e8040
	.xword	0xe484fc1e72136099
	.xword	0xbb6db0f463956e3d
	.xword	0x8babce96d0be9071
	.xword	0x3c5af9ca6687368e
	.xword	0xd35a1ca46554b0a4
	.xword	0x0c1ee5ce2bb39441
	.xword	0x8b285a50e5c491aa
	.xword	0xd7519510ae894dca
	.xword	0x1b095e64ea49819d
	.xword	0xc71143ee43ee25a3
	.xword	0xd1023dda33072423
	.xword	0xa2908db9dc1fd844
	.xword	0x3e6595e36a678288
	.xword	0x70bf25d1fca31296
	.xword	0x611cbb76f832a99a
	.xword	0xe2e0167d5b1c891a
	.xword	0x98d928f243fc69b7
	.xword	0x30031111317e7162
	.xword	0x21b7cca491560764
	.xword	0xcc882040d367051c
	.xword	0xdbb9974d7e9e8a03
	.xword	0x9103e030477fdc05
	.xword	0x02635b1c26977c3a
	.xword	0x3f4a370fbff178bd
	.xword	0xadfd737c22679b33
	.xword	0xc08870db53b6660e
	.xword	0x34ee051ebce3c5d9
	.xword	0x7f4c81717448fda3
	.xword	0x2580e66e72b71955
	.xword	0xd719d5a007e33e20
	.xword	0x90da32dd9532867f
	.xword	0x40599ffe18f06cba
	.xword	0x907aaa0cd9ce8260
	.xword	0x79575ff9ced5406d
	.xword	0x33a5dcc95cef6c0b
	.xword	0xe33be40a63cd26d1
	.xword	0xc6789eee28afa5c0
	.xword	0x0db8e50f470ed445
	.xword	0xfe1557a6b4bfd8f2
	.xword	0xe2932b09ecdd29b4
	.xword	0xf287cf8c8f09ad2c
	.xword	0x974d4b472c717796
	.xword	0x8895b1211a655a88
	.xword	0x75ae606352b7cfe0
	.xword	0x7d4c8ae8ca757f17
	.xword	0xe82c07f649d1d064
	.xword	0x17f5546c357c408d
	.xword	0xe733130b0e87d6d3
	.xword	0x3c931f4b6ebffc0c
	.xword	0x989447424828721a
	.xword	0xad1f4b1a44fe2696
	.xword	0x460210c02c41feb1
	.xword	0xfba7fc2faba2bb05
	.xword	0xc55e515777b8d12b
	.xword	0x6b94b2db357556a9
	.xword	0x3cdfddf769e2d63f
	.xword	0xc809dd55268c517e
	.xword	0xd11c6689ad115669
	.xword	0x70f9bbadc0a428e4
	.xword	0xc6e7c7d67d371a53
	.xword	0x1892dab06e20a502
	.xword	0xc32039c02ca1b0a9
	.xword	0xb3b0508c9dd682bb
	.xword	0x05f1203fab349398
	.xword	0x406ba97d9e6481d0
	.xword	0xb56347370abb9a06
	.xword	0x21268cf7e09562a3
	.xword	0x7edbcb7209b5cece
	.xword	0x1ce304838370acdc
	.xword	0x87cd459b3f651efe
	.xword	0xd4fb3463d1cb7fa7
	.xword	0x197e294b56a98220
	.xword	0x04f2ca5aac75aa84
	.xword	0x364538d7f1526f6f
	.xword	0x5f1707157646a52c
	.xword	0x3fd2978ec1b95a20
	.xword	0x453e1638886e11d5
	.xword	0xe25561652e261064
	.xword	0xe357d70b4e157ca3
	.xword	0x407e396933d039c9
	.xword	0xe2f33d50545bb9a4
	.xword	0xebed5800360e031f
	.xword	0x8b16e1011e931b7d
	.xword	0x050b76cfd3e62a5d
	.xword	0x5b66b92c945384ef
	.xword	0xf777dbcb7db79bbb
	.xword	0x5d998fac7ff99c57
	.xword	0x2e9ad17c6d05b5f3
	.xword	0x03fa894b873dcc01
	.xword	0x116e0423541bb667
	.xword	0xb7d841e81a3fe692
	.xword	0x9956e638c215e0bf
	.xword	0xb1e901539017325b
	.xword	0x58d5ea03d6abbac2
	.xword	0x4089aa75c11c1c6b
	.xword	0x84154f11c41cb606
	.xword	0x30dbcb730feb73d7
	.xword	0x2d39f6979b83a1b8
	.xword	0xd9d43229be863943
	.xword	0x025fca6dd3b1847c
	.xword	0xcf5bf3848e7825c7
	.xword	0xbc75f83bb9cfff19
	.xword	0x0f479d4cbf8ec267
	.xword	0x4bd86214cd95a419
	.xword	0xc98501d5e1afea1d
	.xword	0xca80ddaf04e951f0
	.xword	0xf6e84a0ae66fafed
	.xword	0x62a8eb738e086f7c
	.xword	0x4de434b184ecb510
	.xword	0xa2df07aadc1e9e53
	.xword	0x705f17cd78334b88
	.xword	0x6b7708faaa0b2fa2
	.xword	0x16b23b99cb8db239
	.xword	0x733525ae7778d6bb
	.xword	0xbc3cc392568c27b5
	.xword	0xde728d128319a4c9
	.xword	0x0d02f1dacc2d2f23
	.xword	0x7fda082333edacf3
	.xword	0x4a625d4df57c9f0c
	.xword	0xf76fca75b8bd2705
	.xword	0xf2bcab4a6e6120a4
	.xword	0xf2f8019cf16e1307
	.xword	0xb440af427ef11c6d
	.xword	0x00fe5035272ac044
	.xword	0x0d4938b54e0e356b
	.xword	0x7696f5b84c12c492
	.xword	0x69be0b15581e606a
	.xword	0xcca46f19f847a8e7
	.xword	0x4091dc78bea4492f
	.xword	0x927786f3d0285a5a
	.xword	0x0e8ad3331b19b3ca
	.xword	0x0a26d0ce0c9384a9



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
	.xword	0xcdd569ff74fa68c6
	.xword	0xc7c4731c25caa525
	.xword	0xf143118db49405c1
	.xword	0x6faf83842433623e
	.xword	0xe1b6502aac87a861
	.xword	0x06d335aaa64a098a
	.xword	0x1e886adbf75531c2
	.xword	0x8698901070ea0eae
	.xword	0x1148920d73ad1fbd
	.xword	0x5ed2f3d83ae33ea8
	.xword	0x8569c04ac90714f3
	.xword	0x9ff0858fff4652a7
	.xword	0x3d0760f831d2235b
	.xword	0x2d4251fb8c9dd671
	.xword	0x0cfa0b53fd4c43f3
	.xword	0xdfbc936a551e71f1
	.xword	0x1a4e134c5ebcc7a4
	.xword	0x44b2dd9d28dd6903
	.xword	0x4e7ebc1dabf44912
	.xword	0x3150989b7cdc262c
	.xword	0xf3efd81c720d448a
	.xword	0x4a229513861f89ea
	.xword	0xaae836fbb4d84174
	.xword	0x17fb9d8200058720
	.xword	0x74a38dff1f81ae6b
	.xword	0x4f31b6414798986b
	.xword	0x31fce6fd88e6c94b
	.xword	0xc503c21a2300ebea
	.xword	0x9f99122c436ec016
	.xword	0x0eaf7c28aa5371b6
	.xword	0x0ad45dc9c047336a
	.xword	0xdadbf6a1e55f7068
	.xword	0x04ab7a288cee5393
	.xword	0x255dd61574c668c7
	.xword	0x6d73f284ffe7b154
	.xword	0x1e315f5d9866c597
	.xword	0x19458c08fb12324f
	.xword	0x8215c5a9ed5469ad
	.xword	0xde3348798f9e1520
	.xword	0xe9716ae7a7db3db1
	.xword	0x66301069debfd3da
	.xword	0xaf14b0cdbeb6ea88
	.xword	0x3c3895b5df0743a8
	.xword	0xf2e54f439a180f7c
	.xword	0xb74a42b00320cb51
	.xword	0xe458696a3174686d
	.xword	0x0143da75b5eff02f
	.xword	0x5d008239abc12753
	.xword	0xfddb8b6a83621962
	.xword	0x77395793ccc233f2
	.xword	0x86d59a346758a569
	.xword	0x77273cc4795e2527
	.xword	0xf6b9e9318eafd8af
	.xword	0x1700308b0f94dbe5
	.xword	0xc1c3640cf1c6d5f6
	.xword	0x9d84aa00dbc99406
	.xword	0x7575a86c96c3754f
	.xword	0xb78d2e1c270f1a53
	.xword	0x52a1d3242199390e
	.xword	0x24f99e6f294f2233
	.xword	0x1a50936e8c580ac7
	.xword	0xc466ad7c3f36b9c9
	.xword	0x435d62d03aa5cb98
	.xword	0x461bf28715360e1c
	.xword	0x4d9577f447b84ab2
	.xword	0xc7842d4234114524
	.xword	0x7f3b3d6f5462c076
	.xword	0x3116d6d86b79d1a7
	.xword	0xa3356c4510b224d2
	.xword	0x4ed5488225285683
	.xword	0x8747b427b8854f5c
	.xword	0x1cd5d38a75e18f9a
	.xword	0x67d9fa71821918bc
	.xword	0x3f892dc30de27cbd
	.xword	0x845340e8301a68d3
	.xword	0x6c24d6436e78e75d
	.xword	0x025d33e56878812c
	.xword	0x7c90dd7a02bfdee3
	.xword	0x0ebda538aa80ea89
	.xword	0x50c083141b645648
	.xword	0xabba07377ad91f0a
	.xword	0x83c2d4a93b803e84
	.xword	0xb2bd1d71a94c487b
	.xword	0xd2db5dc0153dcba7
	.xword	0x1d42dca282b1fb78
	.xword	0x659084b88935649b
	.xword	0x500826446127ae66
	.xword	0x478b6b501fd1c6fe
	.xword	0x6ad60333ea249b05
	.xword	0x458b9a77aed50593
	.xword	0x541ade7f0386c04b
	.xword	0x7dc7938027ea8cfc
	.xword	0xdd0cbe0b2dbf24b3
	.xword	0x536e61a751c8d555
	.xword	0x9c2cfa5e3c6f1c3d
	.xword	0x37d3d06c7f96cae4
	.xword	0xba42f706338d2a6b
	.xword	0x48160b121e0f17d7
	.xword	0x6edfe5a2081a753d
	.xword	0xa7c90c4f4875d234
	.xword	0x4e3e9a48a5320fd1
	.xword	0xfa346bfa6aa24d02
	.xword	0xc2c4cc369dfb019d
	.xword	0x3ba72595e21d525d
	.xword	0xb493bda071c300fa
	.xword	0x14c7170036314f13
	.xword	0xa287e2c2e45dd16f
	.xword	0x5daa2b0f5f65e339
	.xword	0x5536f285f06231b4
	.xword	0xb58f76cf1bbea53e
	.xword	0xa2659781a6d181d8
	.xword	0xec2b9b4b0fb0343d
	.xword	0xa14291c549d362cc
	.xword	0xcc1fbaeced4e84c0
	.xword	0x0da0e0c31c7aceb1
	.xword	0x0c3ab5887421100c
	.xword	0x4553123675452d2b
	.xword	0xe8c5254c06f0f3a6
	.xword	0xceff4364e208763e
	.xword	0x6e0a919d5dd481df
	.xword	0xb9c24e8ce7993c52
	.xword	0xe04f99236dfb4bec
	.xword	0x7416cd80494fffea
	.xword	0x41d0b64ec34674b7
	.xword	0xafd8ee239d9368e5
	.xword	0xd07276c2cb0ac7c1
	.xword	0x506cb2cee30fb63d
	.xword	0x066d3dc4d23fc512
	.xword	0x11b95d89fea62758
	.xword	0x91a81ca49bf7daf8
	.xword	0x51c172f073140a1d
	.xword	0x70f2646e593f49b3
	.xword	0x52e97c5dd1e8cc79
	.xword	0xa95d824ae9b4b8da
	.xword	0x2ea8e66c94ba8624
	.xword	0x434e4f5854a16867
	.xword	0xc54ef7759bc722c4
	.xword	0x7716da3fc9d9c359
	.xword	0x6d5ba52b19b556a8
	.xword	0xadbb34b48e3a38f4
	.xword	0xd48f04552ded29c9
	.xword	0xf88fa143fbcf64a0
	.xword	0x95d17694d3bea8bc
	.xword	0x86ebc6911a93be8e
	.xword	0x72af538542715c4c
	.xword	0x73c970505c622127
	.xword	0x5a72ffc68f1f030b
	.xword	0x456d7e160db57634
	.xword	0x05c266daf7312918
	.xword	0x80e998808383f6e8
	.xword	0x39379762381e17e3
	.xword	0x491f9508266a5650
	.xword	0x72428f936ad77474
	.xword	0xa52139770ab13fe7
	.xword	0x091dfe96b0c1a082
	.xword	0xa98601f2c6660d35
	.xword	0xe86d6cf5bfb32a91
	.xword	0x21d0a57e9b493077
	.xword	0xaf7b0670b6085434
	.xword	0xecbdede2032585ed
	.xword	0x712c53a85527cb14
	.xword	0x1da0f44e2fb6e178
	.xword	0x1c343f384764f98d
	.xword	0x7047739883b0932a
	.xword	0xe04299d40d164686
	.xword	0xeb13421138edb408
	.xword	0x75ece5671ef6fb8b
	.xword	0xff45a220895474ec
	.xword	0xcf56ee2d6c8741e0
	.xword	0x4969114dbf163d15
	.xword	0x2e2385493410e4ed
	.xword	0x047ba2109a0d5738
	.xword	0x8db2fff716f41fe7
	.xword	0x465b43911c9df3a5
	.xword	0x8872c00b7ad13338
	.xword	0x5af954f5cdf02f94
	.xword	0x0e33ab06750d2115
	.xword	0x1ee4fc0bbfa724bc
	.xword	0xbad84c859a473bfd
	.xword	0x90b3e01f7759c698
	.xword	0x6a6d5554839ff48f
	.xword	0x553be73ac2e5e371
	.xword	0x094db547de27cbc0
	.xword	0x17966e327d1695b0
	.xword	0xa212fbd391b86b2f
	.xword	0xe1dba96a6e31f36e
	.xword	0xba1eddc941ac972d
	.xword	0xf86fd2c711a112ac
	.xword	0xb39d0dafc4bcd230
	.xword	0xf6e570694007cd6d
	.xword	0x58f2ec1c28042dcc
	.xword	0x4a9b55c45338af2b
	.xword	0xd09c45f1e0d9d0a9
	.xword	0x39c9621a211915d9
	.xword	0x4546fddac8beb13c
	.xword	0x0638db0a81ee6872
	.xword	0xaa4873f4b265331d
	.xword	0xa302b8c6942438fc
	.xword	0x9d8d423095603600
	.xword	0x6149051bfc3d2b5a
	.xword	0x2d12850afcc884b9
	.xword	0x0da75ae8fe7a6b8d
	.xword	0x845d5a1f258a375a
	.xword	0x599242c2fbe9dcdf
	.xword	0x78dac47c2eefc2fd
	.xword	0x6c02fafafc8e0c3e
	.xword	0x413d3e5d1ab9ccfa
	.xword	0xac1d519db0a90dff
	.xword	0x0ffe7397ba5e6bc9
	.xword	0x1c813ef0f23c03e1
	.xword	0xa84a867711566e1d
	.xword	0xadbb84cfcf5f9914
	.xword	0x89207bc36ce5f6fd
	.xword	0x3109b206f64c8f6e
	.xword	0xc0975e664e0651b4
	.xword	0x9e3722f927e70a9e
	.xword	0x408cd72b5c715857
	.xword	0x039473f8540df74e
	.xword	0xe42d569172d0cc68
	.xword	0x39841c4374a00059
	.xword	0x5c9bb9f4dcea781d
	.xword	0x876038b644dc8f42
	.xword	0xacdcdea1c35060cd
	.xword	0x0844459e69754925
	.xword	0xf87dd61fb1c46f98
	.xword	0x2beb2490e17d07a9
	.xword	0xf1ff34455dd60d8c
	.xword	0x6a6fbc6e85fade50
	.xword	0x01d452d2123627a8
	.xword	0x5d9fd99ba628a444
	.xword	0xbba1c3976a1579c8
	.xword	0x37239446ee063b8a
	.xword	0xaff17f05b4a77c5d
	.xword	0xeabe56b97f446c9e
	.xword	0xca095bcd5a29db1a
	.xword	0xae88c5068ff3b5d7
	.xword	0xc81b294de91d8233
	.xword	0x94fb9c3bc8f40c21
	.xword	0x5924c38f1b6f0196
	.xword	0x977b057aed0e3807
	.xword	0xc9937d25c3800700
	.xword	0x91273898333e54a7
	.xword	0xa4404a3faf116aee
	.xword	0x2eef37bbc98485ae
	.xword	0xa83d988b42be1c77
	.xword	0x168c4acb848f9a77
	.xword	0xd1f656f5d5cb99ba
	.xword	0x3771528511026c75
	.xword	0x502f5b9d54449b1e
	.xword	0xc372a3f028df8e1b
	.xword	0x3971ed837c9bcf90
	.xword	0xe9611dcc034438cd
	.xword	0xf3f041804fc3f368
	.xword	0xf45c82b0867b70df
	.xword	0xfe45684d180e7c30
	.xword	0xb3dc251362da96bf



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
	.xword	0xe6b1eea78f683af6
	.xword	0x98bd0cd8f8ceab20
	.xword	0x2488c52e3ec082a3
	.xword	0xbeac1dffe18db55c
	.xword	0xbaca18d28da1ab16
	.xword	0x084fc439f34949c5
	.xword	0xbc746e8f73d4135d
	.xword	0xf50cdc922608dab2
	.xword	0x9df48306575a7d41
	.xword	0xe490ba6258724e11
	.xword	0xe00fa18035c33ee4
	.xword	0x7b3ace7e81e2b42f
	.xword	0x951badd4fd137862
	.xword	0x1050f46129aa838d
	.xword	0x1adf5f220902347a
	.xword	0x76939ebbc8b32964
	.xword	0x64ba50f58dfea545
	.xword	0xd56d0d3e4e7a5a16
	.xword	0xcd990b788db2cf5c
	.xword	0xf2d325293034ad00
	.xword	0xa93afb56cfa8f168
	.xword	0x3d4d71003665cbfb
	.xword	0x8f6a72f94ab54718
	.xword	0x69e718ceee4f0e17
	.xword	0x66876e082c30e3cf
	.xword	0xd1e582547a2ed5bb
	.xword	0x0bbdf8e7a4f5adc7
	.xword	0xe3ddb5c900b0f550
	.xword	0x82d5e250d42375e2
	.xword	0xe5a53afa90b62a11
	.xword	0x5577576a3891bbc6
	.xword	0xf7f20abcc056b1d8
	.xword	0x0d6a177f2638c34e
	.xword	0x5fa61095d17eaaab
	.xword	0xb2ae510c2f4b5aa5
	.xword	0x87c8fb6d6c404e2b
	.xword	0x888ff99bfcfa9505
	.xword	0x28a5bd92f6d29674
	.xword	0x0cb573fec7293b9f
	.xword	0xd02922ce395a83e6
	.xword	0x88166822edc76bb5
	.xword	0x056d3b424097ce45
	.xword	0xbead32a0266a3166
	.xword	0x55f9afa52675969c
	.xword	0x72261cfa097499f1
	.xword	0x4c3e50e1531133ca
	.xword	0x5ed893b55e5a7ef3
	.xword	0x5e8e6248e768d5c3
	.xword	0x578cdaedb66f3bf4
	.xword	0x56a460bbe3908e74
	.xword	0x353e640bc350a88b
	.xword	0xdaf3defe32ba2de1
	.xword	0xfbaf8054c30beeea
	.xword	0x0434cf3b53ecce91
	.xword	0xccb9536ca626cb51
	.xword	0x6ae640bf2df709de
	.xword	0x179071ff4572ee6d
	.xword	0xe259cab6338b33fd
	.xword	0xc02c2844f57239e0
	.xword	0x6ec0dd899b8d0acf
	.xword	0x167d53aa919a8aad
	.xword	0x26c2c56c41e57901
	.xword	0x44304c7b65d65e3b
	.xword	0x40b76be099918602
	.xword	0x3fdcbd82f680ffd1
	.xword	0xc29a5dda235ef7dc
	.xword	0x6b8b400f62589689
	.xword	0x8815995c4b03f7fc
	.xword	0x4b4061b80b45b62c
	.xword	0xe33c362ea13bb713
	.xword	0x05687b9eadb064b2
	.xword	0x1d16577dbb3cf408
	.xword	0xef3d6bc6bcfadfb8
	.xword	0xfbb5031d80938f55
	.xword	0xec578b9d947eb0e5
	.xword	0x7f8121fe57223f45
	.xword	0xeb638360256fbafe
	.xword	0x5787dd84c00b7fb3
	.xword	0xa1345f0b5994b27d
	.xword	0x2e96666cdf44faf3
	.xword	0x614dcd62681b5f66
	.xword	0x64b0daa9a3f0c239
	.xword	0xb39af112e7ace61d
	.xword	0x3728a2293c117e69
	.xword	0x0ae61b1770bd4fe2
	.xword	0x34a285906d31f008
	.xword	0x9b9c3c27ebccf7ce
	.xword	0x6dd0bf49a011dcbb
	.xword	0x62ac1f1ce64de5e0
	.xword	0xf221cd9d19c58cdc
	.xword	0x4f1bb26dd0e7fd39
	.xword	0x9c9f3c882d32dd61
	.xword	0xd0e623aac15ed9d3
	.xword	0x05db0bd6dccf97bb
	.xword	0xff8f2d07386297a2
	.xword	0x0f7b8eeddebdf0c6
	.xword	0x9acd29d7fec4c530
	.xword	0x730b4631df800f7c
	.xword	0x3359bbc736abb23c
	.xword	0x60aedc4d794361d0
	.xword	0x5d73ac132076ea4e
	.xword	0x1c292d795e78cdec
	.xword	0xcb2a48bbc585734b
	.xword	0x0ee89de630624335
	.xword	0xe100c082258f3549
	.xword	0xda690e1319246cb9
	.xword	0x945571f2516f955b
	.xword	0x0805fc7e1d8adad8
	.xword	0x1debc167534fd726
	.xword	0x825d20e04cf1409d
	.xword	0xedd4fffcd5762d85
	.xword	0xef997a7c57ccd55d
	.xword	0x27a5f8e03d84c8ed
	.xword	0xea0d49840ea2a14d
	.xword	0x6167439d9272da8b
	.xword	0x4fde9ce2c927afd4
	.xword	0xb3cc186341e528a7
	.xword	0xf0aac3c9ab266bf8
	.xword	0x244e4511cfdef2e1
	.xword	0x29b7b1915927953a
	.xword	0x6d6deab264bfde05
	.xword	0x5a17ed4b250639d3
	.xword	0x8b71c14b5c26a08c
	.xword	0x1570a7e4a8301c7b
	.xword	0x49d593524dead5ef
	.xword	0xa445ad3ea5590757
	.xword	0x6d9b21e17b2c1103
	.xword	0x6dce40d498b9fc9d
	.xword	0x4f032be2d6e92c5e
	.xword	0x37612cad111c967e
	.xword	0x0540fba7c477328c
	.xword	0x83de665a1b1db9e5
	.xword	0x61523568d2a331da
	.xword	0x3da2ae1add09dc24
	.xword	0x16bc483eb533db7f
	.xword	0xb09b4cd017e5cd44
	.xword	0xd19ad2c71dfb7141
	.xword	0x4749463ffd15c71c
	.xword	0xe1c8499f73fee1ee
	.xword	0x8c6e5c9c225cdf6c
	.xword	0x6428b32e542e6917
	.xword	0x8008bbfc80e187e0
	.xword	0xaec3bc7ae9a38326
	.xword	0x7ddc3882bc413cc9
	.xword	0x78c13cff9fb1db26
	.xword	0x3a5514f206fcd82b
	.xword	0xb5369c3186420c60
	.xword	0x6d0cbff8057ea2a7
	.xword	0xb9d0a4f9b766ad20
	.xword	0x94f1b3f374202dae
	.xword	0x0139e3e2128d174d
	.xword	0xddc2ac375df778fb
	.xword	0x516264bcd0b5df8b
	.xword	0x4592def784f9d213
	.xword	0xb9dbf318b889ebce
	.xword	0x5446b46dcdc24722
	.xword	0xb878aca0007502de
	.xword	0x279ee52afb8a0577
	.xword	0xe5db0e341e8382be
	.xword	0x3fd5ad50061c0e66
	.xword	0xd5b5f27dc03b3c09
	.xword	0x94ab3620af534f40
	.xword	0x566aec3d5445d68b
	.xword	0x4f832e22863bec9f
	.xword	0xc0853f50b399cb82
	.xword	0xbd15c50d2a0928d7
	.xword	0x1877d6ff000a3edd
	.xword	0xf16a0fd04a36dbb4
	.xword	0x81d3f8e5fd547ca4
	.xword	0xb69e89e160a9c477
	.xword	0x0caa3971b0554346
	.xword	0x6f632d5270fbca02
	.xword	0x3964177b0e58ea48
	.xword	0xf49ca2c1ba31e745
	.xword	0x835d7ce2a5aa62d4
	.xword	0xaaefadfa13f90470
	.xword	0x3fe9a4fc8b5bec45
	.xword	0x66064f94da618fea
	.xword	0x9c0951aa99d48e2c
	.xword	0x63a43f0b0d4bbdee
	.xword	0xfe932a034826923b
	.xword	0x8f3920e68f474c5c
	.xword	0x66905da4d857beaa
	.xword	0xd746acf7c22beff2
	.xword	0x8b2643f7d03be908
	.xword	0xca503882d76fa95e
	.xword	0x6c6f82dfda2727ca
	.xword	0x7d3cde828022a852
	.xword	0xbcaec8aadccd4602
	.xword	0x41cb3fb9aa6c5ea6
	.xword	0xb2f5ee4fa94ffa08
	.xword	0x0e7c5d9b8971005c
	.xword	0x7f8afc992a7aefd2
	.xword	0x70333159c572bed0
	.xword	0x04475602264d2152
	.xword	0x2e2f6c9dcad5031a
	.xword	0xac3af4d5f1c563be
	.xword	0xa5925c06f66150fb
	.xword	0x98646945f67b827d
	.xword	0xa146927b6a43458d
	.xword	0x0adbcbb38004f887
	.xword	0xe660d03ad9bc5075
	.xword	0x81472a43f56e85a1
	.xword	0xf1edf035ceab1116
	.xword	0x2c6b5a4420cb7f7d
	.xword	0xfa0cb7ac7ae81544
	.xword	0xfa335fe56d591239
	.xword	0x52f353d9120a490b
	.xword	0xa2897aca07bcf928
	.xword	0x474bceba88ebd581
	.xword	0xa14eb2b13f73ed53
	.xword	0xfe1c80c9bcacb3bd
	.xword	0x1025aac1d5a3bfa5
	.xword	0xff4bc4ebbe09ebe2
	.xword	0x1b98a46b09b53dcf
	.xword	0x69a093a68f3f7400
	.xword	0x9609783508315dea
	.xword	0x77cec23afb7f28e7
	.xword	0x7beb9f503523039f
	.xword	0xb3abd0a9c73accad
	.xword	0xc51495728781e575
	.xword	0x94b851ed41ceabe4
	.xword	0x5752382bfef0dc32
	.xword	0x3c45dd2811c06757
	.xword	0x0e9fe920936dfa4a
	.xword	0x63ac31c62c9a2bc9
	.xword	0x1f40d4a32893ecd6
	.xword	0x7b2bbfdab9bbe047
	.xword	0x0ed3325b1ae5b410
	.xword	0x25a49ea591d57a38
	.xword	0xc213edbf30f2d1dd
	.xword	0xee7a8b66f27b1bd7
	.xword	0xb55fbb6eda8ca197
	.xword	0xdc2c9592ba88f650
	.xword	0x04749cba8cb57960
	.xword	0x3912a703e98367e2
	.xword	0xc1c5d6ad3ec98365
	.xword	0xb666ed3e41d2f924
	.xword	0x3e9917bdf060e8a1
	.xword	0x0abe514df8c3fdd5
	.xword	0x97e1bd5c5a38362d
	.xword	0x29bd5c614d4216eb
	.xword	0xb8c3b9c5ac868c26
	.xword	0x709e11fee55affbe
	.xword	0xea814cb075efb797
	.xword	0x30c2977fd3affc72
	.xword	0x0258d0c59813932f
	.xword	0xea0399e9f7c614a0
	.xword	0xc840a89911f357ca
	.xword	0x3c14f39ee4aab8b9
	.xword	0x099bf2803bc023af
	.xword	0x992831bc19b3a630
	.xword	0xcf81a784bfdc85d3
	.xword	0x480265c368cc3a3e
	.xword	0x003a365033378377
	.xword	0x6ce3502700596efb



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
	.xword	0x3a1bf1a59c9a8e9b
	.xword	0xf027e64c911e065a
	.xword	0x33aff0a929ecae6b
	.xword	0xd97338fa8ad2de54
	.xword	0xe2266d73f2aa4d37
	.xword	0x14425e900a9876fb
	.xword	0xbf0dca717c8e34f7
	.xword	0x241a1c19beacd443
	.xword	0x624182b623e1d53c
	.xword	0xb4b56a78877d3e60
	.xword	0x29bd9d82b987c22d
	.xword	0x8864ebcdcb1022c8
	.xword	0x89bf0368f4ad3218
	.xword	0x052fb93c798d93eb
	.xword	0x04f792eb4e3732ef
	.xword	0x4be22fefb67579d4
	.xword	0xfec27c39f9528c41
	.xword	0x18b018b41e726e71
	.xword	0xd1b916325ca8952a
	.xword	0x104a3411d8758a86
	.xword	0xf61c8d5964ade85a
	.xword	0x28564627f944bca8
	.xword	0xc58dd0bdf77b8414
	.xword	0x1b3c6a31dd99be4d
	.xword	0x10fa59d7659bf08e
	.xword	0x57ea6e8cd77932ff
	.xword	0x4ee63db8de807091
	.xword	0x6b6fbb925dcdbac3
	.xword	0x2020d27a59b6a735
	.xword	0x900c4a88312d7005
	.xword	0xe959ab5e3ed14b3f
	.xword	0x903455f1ac6e0236
	.xword	0xd3438303bf72a853
	.xword	0x3583421912a86a0c
	.xword	0xd6399a924e383323
	.xword	0xa887e73dc8bb4d47
	.xword	0xff5913432ea78abc
	.xword	0x4a84be97c84db1ac
	.xword	0x6b430c72485f3137
	.xword	0x738ad86bfc018723
	.xword	0xbfe8e45644293fe2
	.xword	0xf9e4d8ab9018040c
	.xword	0x2c83e5b2a575fd10
	.xword	0xb5c759d48682d0bc
	.xword	0xe6ea2fcd24921d7f
	.xword	0x8e06664c6ac31d31
	.xword	0x459e57151bed06ed
	.xword	0xf8408336faa294e6
	.xword	0x18899547303c3030
	.xword	0x078648983316dcf5
	.xword	0x7001d35951da094b
	.xword	0xb52c5838da71a56e
	.xword	0x7241bb4b0527ba3f
	.xword	0xc14bb3c483bc9b34
	.xword	0x5c5e4471a41af241
	.xword	0x474f34733d83f898
	.xword	0x548cfbc500c08380
	.xword	0x9ed9a9e17224d026
	.xword	0xc7c928b092b8b705
	.xword	0x01af896859ca51eb
	.xword	0x8cf576e7e2638f62
	.xword	0xed0ee1717cb4d780
	.xword	0x32f07ba10671d06e
	.xword	0xf83842a9bbc2386f
	.xword	0xf236d19b9cdbc4fd
	.xword	0x5fcaf519f59ebc2c
	.xword	0xfc7f08d8cba7f2a2
	.xword	0xd90ef1c2c3677bf6
	.xword	0xb424c53498059efd
	.xword	0xff0e9d416591ef04
	.xword	0xf76fcea11b8eaa7d
	.xword	0x80856ef29fbef22e
	.xword	0x86baa607cc77f4e6
	.xword	0xf0fc4618525727b7
	.xword	0x7dfba6aa2de0ac2c
	.xword	0xb4078e7ce5c94913
	.xword	0x54b0aca6d3234e61
	.xword	0xee1b55b645155c7a
	.xword	0xbea7e6eefdf63d89
	.xword	0xf84997f13710da85
	.xword	0x401e142095ede38f
	.xword	0x689cc711e29fff27
	.xword	0xf6fa193f97cf3c21
	.xword	0x8a0ca5d07e24cfb6
	.xword	0x8b31f34960b23468
	.xword	0x86b703381067d95f
	.xword	0xd7b4526a00efea8a
	.xword	0x984bee32367d3e7a
	.xword	0xfdec6a6367ca6046
	.xword	0xd153d8fb77f0a08d
	.xword	0xc23d82a168ea2eb0
	.xword	0x40e0d2bbf5516cdd
	.xword	0x016dae75f83e440f
	.xword	0xcca9007187ebdc82
	.xword	0x107c9a98e6c9a853
	.xword	0xfcfc28cc640fbff3
	.xword	0xcb0e031a8af15055
	.xword	0x4d23ba2661791d99
	.xword	0x6c1385ed42fe4ea9
	.xword	0xae01d37622c8a4e9
	.xword	0x13ab04a973fe783c
	.xword	0x179d113ba039721e
	.xword	0xac2c9cce1d3c5e7b
	.xword	0x8b040f1faf17055d
	.xword	0x1f7c651b676c3388
	.xword	0x9b92e6e657fbddc2
	.xword	0x48f5674bd245727b
	.xword	0x633437e422b7f054
	.xword	0xdfd9b05be269b71b
	.xword	0xe514835f7a42c985
	.xword	0xafc9d23697dd6353
	.xword	0x22a419aad3ae3a6d
	.xword	0xaf77c0e2e1a17a12
	.xword	0xa7839c78c2e53fa3
	.xword	0x0c253318301e5b6e
	.xword	0xeab974ad6dd6c9b5
	.xword	0xe53b9634d27c31e3
	.xword	0xc26634ea49655aa3
	.xword	0xeec28acf427021d1
	.xword	0xafa2436d5af8862d
	.xword	0xd4e1c9925e9d33fd
	.xword	0x2c60319d2938848f
	.xword	0xccb597e9b3eb5b09
	.xword	0xa94e5179b19bcfbb
	.xword	0x8721a35afbcaa7e3
	.xword	0xba64fab9afac7f8b
	.xword	0x031d9fd8b53a1e97
	.xword	0x7ee5d9ba649e1af4
	.xword	0xf5db1f49f9d448b2
	.xword	0x363abd677bf6a8e0
	.xword	0x9edb02cbb2108a54
	.xword	0xad12a1de0a998c86
	.xword	0xa7958aae851bd72f
	.xword	0x2123ed2f646e5774
	.xword	0x4a00f21c839edfc1
	.xword	0x9fd5324ef5ce442f
	.xword	0x7d7116210163130b
	.xword	0x7e0d5c25ee3f8599
	.xword	0xb8fb5542d1f87e81
	.xword	0x0df4e0dd915f8e14
	.xword	0x8d221bc23eb0c1de
	.xword	0x74d4ba83e78b54ae
	.xword	0x30de488ccd6fc1d5
	.xword	0x3124a3fd2a4084b0
	.xword	0xcb244a5e71679d1a
	.xword	0x119bb4b5359b1578
	.xword	0xf53ca102cb6dd2cd
	.xword	0x223efe2373e1ee27
	.xword	0x98fe5734e8338474
	.xword	0x4d7e040b0ba1a98e
	.xword	0xa13054ffc921dbf4
	.xword	0x55cf0dc29c70af25
	.xword	0xab413d365408a083
	.xword	0x9d2546fa7060d964
	.xword	0x192af0b13f8d234f
	.xword	0x888aa43757b42df2
	.xword	0x51ed25fe733603e3
	.xword	0xfe68b1695b768ebb
	.xword	0x0821305179dc90ab
	.xword	0x0bcc09e9d2691984
	.xword	0x478f7516fd585f82
	.xword	0x63a2e6022e29dfe2
	.xword	0x50edbb63535d39f9
	.xword	0xab88c31034d777bc
	.xword	0xf06a3d4617f80218
	.xword	0xdd28bf7ded78338a
	.xword	0x11dcb76974418599
	.xword	0x3a73e576a5915be6
	.xword	0x936d5415fe6a1fd8
	.xword	0x290020b3949c27f0
	.xword	0x078b35aa733d8388
	.xword	0xba490857a2c6e0ba
	.xword	0xa30d51f3e571eb6d
	.xword	0x74a74000e98548f1
	.xword	0x844c3917c90c0244
	.xword	0xdd04f0009348297f
	.xword	0x30f593798ac81740
	.xword	0x891afd1e71825a9a
	.xword	0x15142e8a1e27c3ae
	.xword	0x3560e81bcdeae94d
	.xword	0xe4a5caa3ec31de22
	.xword	0xb52dbadd53e7fe71
	.xword	0x7fe5667fb5fb428a
	.xword	0xc2dba50bb97bd629
	.xword	0x77af3d65b587c980
	.xword	0x9e40ddfdf107a52d
	.xword	0xa961690ea9732387
	.xword	0xa008776462b88070
	.xword	0xc4ac40f992298c87
	.xword	0xc2cd30f3cf71aafa
	.xword	0x27838d7a0192da7c
	.xword	0xdc6a5145ee731672
	.xword	0xfc4a2970db84d330
	.xword	0x7ed3a7473d06b57b
	.xword	0x70408c916d839418
	.xword	0xc0db32dd8a7b24dc
	.xword	0xc74ee2e3080bc0bd
	.xword	0x319aa8cf7c6a47d0
	.xword	0x4026e00f4baf099f
	.xword	0x3799385914bb9120
	.xword	0x7297ca848c7dd705
	.xword	0x5d35f1a6f3befa68
	.xword	0x9d1623380d4106e8
	.xword	0x2cd6342467aa8db1
	.xword	0xfa69e9d95508da0e
	.xword	0x3744f167c727fd81
	.xword	0x2dfbfb40e26293d8
	.xword	0x5873b430c8b5924c
	.xword	0x91435f42749f526c
	.xword	0x0739be9b7341df68
	.xword	0xc76ac5aae0c0bff3
	.xword	0xce3cbb161f9b884c
	.xword	0xc82782b9508005ea
	.xword	0x42c882a15762a325
	.xword	0x4fc905930aad4394
	.xword	0xa1f1e1d63967b307
	.xword	0x57b2d026236d14f9
	.xword	0x7366aab15d2353ab
	.xword	0x8511962926e31b00
	.xword	0xcacd8b6ef7932759
	.xword	0x99926875e49de66b
	.xword	0xc2736e457d72db44
	.xword	0xb0f6a6117f493d7a
	.xword	0xd1b5be69ece9cce5
	.xword	0xc27a30618806d39f
	.xword	0x669545a0109ad0e8
	.xword	0x05448b57d97b7cb3
	.xword	0xad287d37ca7aa06a
	.xword	0xd25a9f108a958ff3
	.xword	0x646051de50018c0f
	.xword	0x30fc023d7d6d0483
	.xword	0x174894a0572e7cca
	.xword	0xdeca9c01398439e4
	.xword	0xe7950e0ec51b8242
	.xword	0x2ad07374133b27ae
	.xword	0x140df9036235b992
	.xword	0xcace8d0bee48ff14
	.xword	0x72a8a004bcfaae7c
	.xword	0x8e5c136f852d2b1e
	.xword	0xd0e4bd9960f1b28a
	.xword	0xdcc2a2e81e24919c
	.xword	0x93f1fd6ac6f10ae7
	.xword	0xfa4a12b21904973c
	.xword	0x654899d3f3660bb8
	.xword	0xb785d87f59aaa89c
	.xword	0x549ff99e67bbe14f
	.xword	0x01fb3ac42b23d02d
	.xword	0x093d0ec486c37985
	.xword	0x907e257b5358ac04
	.xword	0xb342325c3428015e
	.xword	0x8e8a43ec19a8ecb8
	.xword	0x933c0fdb56cf6919
	.xword	0x1ead613714c30992
	.xword	0x83fafe8259b5a3af
	.xword	0x9693b4ea7d90a7d2
	.xword	0x75290dc746495f28



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
	.xword	0x067051dba45ad085
	.xword	0x9ce5b968244885e1
	.xword	0xb00713fa5c2f0acf
	.xword	0xf081377afaf6689c
	.xword	0xe39f174a3380c7b1
	.xword	0x6c2bebdf1319f133
	.xword	0xb03ad50d96d589fa
	.xword	0x9c5c8bb902dd38f4
	.xword	0x4a130c4fcd381286
	.xword	0xc41f0774997aa74c
	.xword	0x297ffd99091328e3
	.xword	0x8dead748cce5d805
	.xword	0xf24085d8de285830
	.xword	0x44353924215c8241
	.xword	0x46b5c8e87bdda3d0
	.xword	0x2374536ed8d9966d
	.xword	0xb057e2d1ff0c1dce
	.xword	0x07d7853cf205daf2
	.xword	0x69481051f07725ee
	.xword	0x27d665de5fed3e55
	.xword	0xa0a5e9e502f8cd84
	.xword	0xd39a01a9ff7b178e
	.xword	0x4224776a1ed120ec
	.xword	0x4fff6715e0818bce
	.xword	0x9c434b13673d7251
	.xword	0x6eb475297efff372
	.xword	0x818875c27cba1ad4
	.xword	0x50664089daaeb070
	.xword	0xee3639b093436d34
	.xword	0x5560cee91832949c
	.xword	0xb33d76d52dee8db3
	.xword	0x540b2801802aca5c
	.xword	0x5f2f8439d9b5f027
	.xword	0x38a9f12445e07eca
	.xword	0x75cd060a40f639bc
	.xword	0xeeb8579c4152a17d
	.xword	0xd774d8f3044c3a83
	.xword	0xfeb7d6dcd39b3964
	.xword	0x2af86ba155310f18
	.xword	0xbfd35b6473e3d482
	.xword	0x6d4d22b9b103a16f
	.xword	0xfd3085a669987270
	.xword	0xc7eb7771b03377c8
	.xword	0x6739752ca3a343a1
	.xword	0x7300764d48aace89
	.xword	0x5edf7e95b619f2f4
	.xword	0x298b6be3c220429d
	.xword	0x20a15ebbc9c45b04
	.xword	0x8f9f86768d0017de
	.xword	0x2356411fddcf5483
	.xword	0xa36d9628844d6a39
	.xword	0xdbcc871358c3433c
	.xword	0x5c37c8f357d42fec
	.xword	0xdcd262ff3de769e5
	.xword	0x53d86c6c6ab69ed3
	.xword	0x392ae6d939a15872
	.xword	0x530a2731641ba8d4
	.xword	0x374844912ec3ef5c
	.xword	0x373bd628fc58155d
	.xword	0x175736031ebb59a1
	.xword	0x65e6c9b6d91d394d
	.xword	0xc49da402872ce66d
	.xword	0x8fbdecd88d1ab845
	.xword	0x4f77381f28e40cbe
	.xword	0xcdfeacd4f96d56ed
	.xword	0x9c493fa9f974e3a0
	.xword	0x7d2b07596dd18131
	.xword	0x4a0915cf045203c2
	.xword	0x14bc801e7efbc257
	.xword	0x51c80a2c64873062
	.xword	0x8b630a93cdd96f22
	.xword	0x5fc89f0b970da0cb
	.xword	0xabd53c35b6e9557a
	.xword	0xa1923b70e47f827b
	.xword	0x4cab49baf0426b79
	.xword	0xbbbde033aaf25fe0
	.xword	0x865f130ac6fb25f5
	.xword	0x843c506c23ce3d91
	.xword	0x061974ba60f43fe4
	.xword	0x8bc4f335c53529ea
	.xword	0xa275359691c33b01
	.xword	0x03b5e8c4e6595bac
	.xword	0xacc1859e9e709290
	.xword	0xb581bf43d1346ab9
	.xword	0xdbd6f5888d9cbd0a
	.xword	0xa49f9bdef8107540
	.xword	0xc979c6e8ebb4fc7e
	.xword	0x775e9daf6222578d
	.xword	0xe9a626dd52b0309f
	.xword	0x7c0c2de3b1dd8a5b
	.xword	0x14f39792b21608c1
	.xword	0xf9fcccc443ec936e
	.xword	0x9d9f6aa2248a1302
	.xword	0x05f924004916f6e6
	.xword	0x971a0a71524e2653
	.xword	0x208324e0e67b73ba
	.xword	0x969c7f4643d619b5
	.xword	0x539718666998db50
	.xword	0xd594553c63d67c47
	.xword	0x3db289c36292e07b
	.xword	0x13d1212f5cb10251
	.xword	0x028383958c3ee463
	.xword	0xae80b13e35be8990
	.xword	0xf2c49b7b34d0c5ad
	.xword	0x73b409597f331069
	.xword	0x79db86124b3bec21
	.xword	0xb311b79c6ae67212
	.xword	0xdd9c7def590dfd09
	.xword	0xcb8f7e2e49793dd5
	.xword	0xcf1c6b958a499dc6
	.xword	0xef5603148bd36bc7
	.xword	0x166ab3c48934244f
	.xword	0x14e33721bdbefe01
	.xword	0x5dcef61cf7c69fc8
	.xword	0x029a4c0d10e2c288
	.xword	0xce90049a11fbdecd
	.xword	0xd74d0502566b3819
	.xword	0x93f7e31b0f7ef8af
	.xword	0xb0eca4b4229d9e51
	.xword	0xa26b3f58ae44848c
	.xword	0x420bef490eeaf470
	.xword	0x46ae9a3c22fc1668
	.xword	0xa2336002f79238c3
	.xword	0x07d22ef26748d520
	.xword	0x800f689f9748b0da
	.xword	0x18cc2a88427ecac2
	.xword	0x07495132c185a67a
	.xword	0xca595f58b4d55202
	.xword	0x833d1a4f4ee126b2
	.xword	0x36d3575e00862887
	.xword	0xe3f763a12f20d66e
	.xword	0x89a823b187f287c8
	.xword	0xe69cac657fbf761e
	.xword	0x0b3401c0f31e36ab
	.xword	0x4246307be53a3df2
	.xword	0x6aa57d793fc8ec78
	.xword	0x661428c4259f0618
	.xword	0x83a724962edb9b57
	.xword	0x96113dd88f119354
	.xword	0x5d731bcae64c23f0
	.xword	0xefdcd0754ca714ec
	.xword	0x54f71b5ca7255204
	.xword	0x3d824290317b047a
	.xword	0xeda6ca45762e75e4
	.xword	0x3f3062841ca77c0e
	.xword	0x5396754242f69193
	.xword	0xfaea52de6497be83
	.xword	0x80816d964e274a57
	.xword	0x8b0fba778de4e042
	.xword	0x0576daaf839e8ac6
	.xword	0xfd482f8ac2595ca4
	.xword	0x4b141fdfd00af35e
	.xword	0x8a0fa6b440313bae
	.xword	0x130933ac7b5beef1
	.xword	0x4b9b6845ed130821
	.xword	0xc3ce553e743f95b0
	.xword	0x0d7c3f45a3b58eac
	.xword	0xcc741b927bfcbb30
	.xword	0x91987076666e6124
	.xword	0x5c4fc3ee0cbe5fe5
	.xword	0x398485af242e055a
	.xword	0xbe4a6cce692d5df3
	.xword	0xcd887c955ea295b4
	.xword	0x660af23cbb97dd3d
	.xword	0x8558841dabe82ae3
	.xword	0x0b6ee1ccfbb22983
	.xword	0xa1608c9d96407ffa
	.xword	0x4114b75220dbcb2f
	.xword	0x5f64ed992669ba8d
	.xword	0x3623659d5420e85f
	.xword	0x1605216d9b8fd52d
	.xword	0xe682d24d7e230ae6
	.xword	0xe9c439a3a40a3d06
	.xword	0x5dffac6630e47af2
	.xword	0x5b5cd12323ecaec7
	.xword	0x86afe480621de459
	.xword	0x0cde7c884389ad93
	.xword	0x3a4939d9b4c7132d
	.xword	0x352a9e951ab6206f
	.xword	0xa70a7d95aac7ce76
	.xword	0x8010c06e7116b9b8
	.xword	0x85828e6fa61d6b75
	.xword	0xfbf37b41f13313d2
	.xword	0xcdbee780c0ccab5e
	.xword	0x44194214f3885a9c
	.xword	0x1758fe73505c2622
	.xword	0x03ab41f4ece1ebfb
	.xword	0x4ea35334872dffc1
	.xword	0x82e45ef354fcf1e6
	.xword	0x50802355106937d4
	.xword	0xb60475896eba4020
	.xword	0x963249551fb9b199
	.xword	0x5469082aa8013fd9
	.xword	0xdb34e094c2e09e97
	.xword	0xc0856615541d12b8
	.xword	0x702417945290b2c5
	.xword	0xc22ff26108967e53
	.xword	0xdc97735338b6ed5d
	.xword	0xa2b89cf42864d84a
	.xword	0xdca8eac1622a2122
	.xword	0x967dc13e7565d21d
	.xword	0xf16d695571b74aad
	.xword	0xd6c8aa9613cbd6bd
	.xword	0x9d15985537dfbb82
	.xword	0x71403a43fe392ba6
	.xword	0x729179b956cfd0f7
	.xword	0xf53a5dc9530e4236
	.xword	0x3e72d8dea1ae1f01
	.xword	0xc86f6f68292e8eec
	.xword	0x8d8a3b7da05d3634
	.xword	0x791cce38f026701d
	.xword	0x40a7fcdda3b00691
	.xword	0xda0c426d4a917501
	.xword	0x25de7883f1855685
	.xword	0x2428293fa3de3f60
	.xword	0xbacc62f6910634e2
	.xword	0x15d711b01a93f6f3
	.xword	0xa46168cf47784307
	.xword	0x6b0fbc59b9847757
	.xword	0x2ad942dfbc206843
	.xword	0x58a49ce3d87f39bb
	.xword	0xb613168bcdd94546
	.xword	0x1ea05844e0a95e43
	.xword	0x80d1ecceeddfcebd
	.xword	0x6c4dbcfdef82bc88
	.xword	0x9e97d7a4724b0b41
	.xword	0x7f21a56251f631a7
	.xword	0x9f1657765255300e
	.xword	0x9a201f90f5e7c59e
	.xword	0x1029bd70efabd532
	.xword	0x2baaabda85db74b7
	.xword	0xa623fe80721d6065
	.xword	0xebd24a73653a8431
	.xword	0x5dad3aa401060ea6
	.xword	0x4423eb3b185942e3
	.xword	0xf4cb788961975372
	.xword	0x85945458dca074e6
	.xword	0xd1c30abf6d528d14
	.xword	0x242be51c88ca335b
	.xword	0x59a969e99448172c
	.xword	0xad8aebdea79517c8
	.xword	0xc9c50c54c7c57b48
	.xword	0xfa83691c32f439db
	.xword	0x70a9ac7068af06aa
	.xword	0x71dacb2e03a14d6e
	.xword	0xd4654d07ad6d4fc2
	.xword	0xbb06421069192c87
	.xword	0x132fae40db4b4fe0
	.xword	0xfaba95ccf32fda05
	.xword	0xe4a8b73d02ef1455
	.xword	0xf8eb9b5f7d910dd7
	.xword	0x1cc96b8136a34e3c
	.xword	0x2ff02eb5696723a7
	.xword	0xe7f9905aaf0fa1af
	.xword	0x760ecdc82620a3ab
	.xword	0xb409f0cddfacc5b3



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
	.xword	0x8b9005d4e519e8d2
	.xword	0x7971d3d43008cfa1
	.xword	0x72d36a46ff20dd23
	.xword	0x9c61a9c30f5d50de
	.xword	0x6b1ed1020a92d7bc
	.xword	0x6bafc118adb8c22c
	.xword	0x6f62f2d3c7690036
	.xword	0x3cdb94c8506758cb
	.xword	0xd989741619db23a2
	.xword	0x1901b251fc25d969
	.xword	0x78d534194ceab63b
	.xword	0x418f422c2f7ff5b7
	.xword	0x73503e9d61867006
	.xword	0x99a3b364791c12d9
	.xword	0x639a163ea033f911
	.xword	0xa71a14d7fbdb368e
	.xword	0x6faff2e9e44cda9a
	.xword	0x22edef34cb81ae6c
	.xword	0xe27996b866fe02c4
	.xword	0x48824a16b388f7bb
	.xword	0xf6b872fa23ee1cf8
	.xword	0x0e7b984bfb7cf965
	.xword	0x0139273cbb7b6720
	.xword	0xa695bc8542e1c4ee
	.xword	0x253619a86c25effb
	.xword	0xc07352295449890c
	.xword	0xaa6898f3fc7d7f44
	.xword	0x353f7d74488dbfab
	.xword	0xbb260641df97ff75
	.xword	0xfbfe4675eb5b9cf1
	.xword	0x0c2d9e680ff8a59b
	.xword	0x6449d008f336135c
	.xword	0x32767111f1da3880
	.xword	0xd5a0a1a954560f56
	.xword	0x00f2666eea23909e
	.xword	0x0d03db685d8c05ff
	.xword	0x27d7d73a5d199351
	.xword	0x7b94dbfe2b74627c
	.xword	0xca1899bfde168315
	.xword	0x9c5f8c4b6374e844
	.xword	0x33889683c3a8c810
	.xword	0xd1d1065a606b46a5
	.xword	0xa06624802fc230ac
	.xword	0x22221c241ff150b7
	.xword	0x12fe85ac1dccee45
	.xword	0x433f27d70a1bea07
	.xword	0xe5826f9685e66082
	.xword	0xf30837e423d8ffd2
	.xword	0x38f77cbd2b15522d
	.xword	0x2151d423176f5a1e
	.xword	0xb07e6bc2247d02a0
	.xword	0x76d90d60916d1226
	.xword	0x35dd9a352749b8ad
	.xword	0xbc0479087fc4e8f0
	.xword	0x8ea2cd46b21c48f6
	.xword	0xfb7aefc9d4ee1880
	.xword	0x6e1024c8a6937c17
	.xword	0x9e16b4896f0c32a0
	.xword	0xb8ec82d3dc59931a
	.xword	0x40a798c1f9d14a7c
	.xword	0xd2e6c1180ca6b983
	.xword	0xedd832a165f87d6e
	.xword	0x59a1bc790125a295
	.xword	0xb53b1b38c0325839
	.xword	0x2dd821bb4c192bb8
	.xword	0xdff456aec013f8ff
	.xword	0xb825a199824f17bb
	.xword	0x7fed4a9fd95f64e7
	.xword	0x997ff7ef88e7381d
	.xword	0x74ea19b6ec72c4ef
	.xword	0xefab5d4608fab86b
	.xword	0x26be1566ce2cfd11
	.xword	0xd9a676b682882ab2
	.xword	0xf024a91e9844ac37
	.xword	0x7b3e2bf97ae79543
	.xword	0xbb78e422629d08d8
	.xword	0x73333053654e8157
	.xword	0xfce1fd6a2c10d74e
	.xword	0x573f03d438eaab6b
	.xword	0xe0a0c973ceb6fd9e
	.xword	0xc3526a6dd18394bc
	.xword	0x486d35f1715d8dd0
	.xword	0x07f6b5430c03f5d4
	.xword	0x07fbeb5649ff27b8
	.xword	0x7879cc7a5cadf72b
	.xword	0x8c7f883b9b16db6a
	.xword	0x55998f93bc147c0a
	.xword	0x5e8499ab818c1d71
	.xword	0xdc5964be672efb6e
	.xword	0x1fde60a4d618f7da
	.xword	0x40b386611a64d8e4
	.xword	0x3f437b1cb8180788
	.xword	0x339fcecfb046b580
	.xword	0xcd0b935561693a13
	.xword	0xe0164377428104a8
	.xword	0x7c50cb7ad52617a6
	.xword	0x2bee82a30f0a3142
	.xword	0xc7b2ef8ec5b6a845
	.xword	0xbf0adf1cdb2a924f
	.xword	0xc7415658b50a58f8
	.xword	0x45369962fd248596
	.xword	0xb8fa818a3ffa8529
	.xword	0x2be0c7f36bbc6015
	.xword	0xb71d45acdc714826
	.xword	0x9310a24eb208ecab
	.xword	0x8544bcf52074fe54
	.xword	0x92bf363484ce0a76
	.xword	0xa6d3a84e4b26d191
	.xword	0x42458fee1883f8a3
	.xword	0x969b734959c52b08
	.xword	0xd6f5f847fe5f5948
	.xword	0xdb40e6eefc157664
	.xword	0x0b66320aa7222bb9
	.xword	0x4fea26777e8f190f
	.xword	0xb627d794269a4d58
	.xword	0xbb62531327ad94e1
	.xword	0xd82dd1cc817cd66a
	.xword	0x7b2cbab595304df1
	.xword	0xd8dbaea4c165e8ab
	.xword	0x325965b9e377ed77
	.xword	0xd648a8a464fe2b7c
	.xword	0xb77a9b81988f78ac
	.xword	0xafb3202151dd012f
	.xword	0x05f56d8199555f2b
	.xword	0x54dd9289870dc7f7
	.xword	0x4eab0e663da4e992
	.xword	0x7318b24f4a6a48d2
	.xword	0xb8b99f0d24023034
	.xword	0x962bc8a6b38fd21e
	.xword	0x3a48bc48818d552d
	.xword	0x23ab0e7240b1155c
	.xword	0x43063b304eae89bb
	.xword	0xcfd850aa0043f782
	.xword	0xdb37660e25346182
	.xword	0x459b94cd67c381b6
	.xword	0x8a028324805f69bc
	.xword	0xc6f9d6d3d7ec681c
	.xword	0xf45e981c4c428561
	.xword	0x1fb24e38cffc1a62
	.xword	0x20d3cbe2b50b5473
	.xword	0xda57a8befaf53dfc
	.xword	0xa7a36bcf1eaa139f
	.xword	0xdad4440c6406d301
	.xword	0xd5bd93dc4f8c3f19
	.xword	0xf39ce166f1eb7d84
	.xword	0x78be4518fa01fc94
	.xword	0x0199aaf3dcd572ce
	.xword	0xd7da46559513a684
	.xword	0x0c1140241806964e
	.xword	0xc9cf505d71a874b7
	.xword	0x65debd43f377e241
	.xword	0x93cbe01f723a57de
	.xword	0xaf029c405537705d
	.xword	0xc8ef4e7ad5ef2020
	.xword	0x9c2b0ca98970bb23
	.xword	0xeeff0735a283b377
	.xword	0xf60e056fb265c041
	.xword	0x55e3631e69f1bf59
	.xword	0xb7851b74a5e24a27
	.xword	0xd2358a7a83e28e53
	.xword	0x33038c963d114672
	.xword	0xc3cf2789c56a60e5
	.xword	0x5eaf0b556b99fa22
	.xword	0xa057c7ec466f0ff4
	.xword	0x70831bc2d08b0ffa
	.xword	0x40141efe150fcf3f
	.xword	0xad7d261452c97aa8
	.xword	0xa1a0f01da7dd55aa
	.xword	0xdbfe1ea6e4966e45
	.xword	0xe527a9a5461b36d6
	.xword	0x9a6d85a90d25e654
	.xword	0xe5c36fa49b9ec41d
	.xword	0x35a602ee6c3dbdd9
	.xword	0x0834bbe660ac20a2
	.xword	0xccf1dd0bf630af10
	.xword	0x021248ac682f7198
	.xword	0xe1e4414cfdf713e3
	.xword	0x8b4fbd014b27fc93
	.xword	0xee9fc24265e26475
	.xword	0x5f4294c4f0c0e797
	.xword	0x8598c63928374965
	.xword	0x121c940ce7bbc492
	.xword	0x037f7695c5cc26ba
	.xword	0x3ef2b6aa5c32c7c8
	.xword	0xe75224d3c42454ce
	.xword	0x76643d253b144dcf
	.xword	0xf49bfa041fa7cef8
	.xword	0x93b27aedf959abd0
	.xword	0x6800bddef47c3031
	.xword	0x32b0c63cdafdd8e0
	.xword	0x19a3ce52f40ce304
	.xword	0xb0cba8d7204b1b50
	.xword	0x533f6062a6b8ff9d
	.xword	0x817048fb89d1212a
	.xword	0xdef6824b83f74163
	.xword	0x90545b92e5fbfdeb
	.xword	0x1a9072ca00870211
	.xword	0x2763a8e692b2aff4
	.xword	0x140ceaaabf225af1
	.xword	0xd3bbb401b60282a5
	.xword	0x6368c55936d7e2cc
	.xword	0x9742f6418636804f
	.xword	0x8b876baf70df7da9
	.xword	0x2bc71618708af477
	.xword	0x40bd717fcea3f445
	.xword	0xe6732064605a15f8
	.xword	0x6d971b9ac0d33c84
	.xword	0xa1a2184ce844bde7
	.xword	0x93cb2ad868af59d1
	.xword	0xb6df7088a2a597fe
	.xword	0xc714d9abec5d191e
	.xword	0x7c2baccc3270ade4
	.xword	0x3d1196abe695de20
	.xword	0x174423f93021d9fc
	.xword	0xd9bf7ac926216852
	.xword	0x2c958c08bcd01034
	.xword	0x3218d3777b851774
	.xword	0x275aeba60cf8717c
	.xword	0xc9af4331608c6504
	.xword	0x7332a695fad8e68c
	.xword	0xd4ed9f69d357c4f3
	.xword	0xbea3f14538c57e87
	.xword	0xcd3fd25454f426f3
	.xword	0x34192e7597fb5257
	.xword	0x12833bcd37d6c0b1
	.xword	0xd7bbc36cf9fca70b
	.xword	0x6232aac730800a62
	.xword	0x36746846e5daca9e
	.xword	0xaf39f5cbe196efae
	.xword	0xa37f370a8f690d00
	.xword	0x7eab5e1eb3f949d0
	.xword	0xcaa78d949e48693c
	.xword	0x32bdc50ce0a214e5
	.xword	0xbbe26e8854f0fd6a
	.xword	0xa733a6c31af1f6f3
	.xword	0x5d9e560f52cb4b98
	.xword	0x5cd6fd53e12fb86f
	.xword	0x439f90bdd00fa9a1
	.xword	0x8497a140339ae238
	.xword	0xfb1957fb3c386c09
	.xword	0x2165697fc5620a5b
	.xword	0x83495f983382e2c1
	.xword	0xdb649744f7d06c54
	.xword	0x70d7e7e4a96496a1
	.xword	0x95bf8a90732f9a97
	.xword	0x664bcd75bcffd307
	.xword	0x997f0e75b05df1b8
	.xword	0xa13a055bf465c968
	.xword	0x30a6a37ec4a2793b
	.xword	0xd188a85a8e577e01
	.xword	0xc199dc29a9d7af2f
	.xword	0x513d6457f6925473
	.xword	0xe2b76bb9ae9129c2
	.xword	0x07741beb5427faa6
	.xword	0x20f4b17f471f0757
	.xword	0x4fca22b8e454c020



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
	.xword	0x3b69a8d49bdc27d4
	.xword	0xd23d14487f4f39b5
	.xword	0xfc6aa86478879651
	.xword	0xe816b70914712c94
	.xword	0xd48ea4898ea2777d
	.xword	0x19119740840db56a
	.xword	0x7d74b28bbcd10d67
	.xword	0xd27ee70537d26cac
	.xword	0x79ed4e8335a98d18
	.xword	0xe7820fb3ddee08dc
	.xword	0x18855471fb3b59fb
	.xword	0x482e147f72cf1dd6
	.xword	0xc05087b35aba2c23
	.xword	0xf9eec812229fcc22
	.xword	0x9259b2099be9ecf3
	.xword	0x97abaa660876f8cf
	.xword	0x2de7f73f41f34441
	.xword	0x2ccd559002b75735
	.xword	0xdea64ae93717ba3d
	.xword	0x328953799d8190dc
	.xword	0x9997e81d28543b91
	.xword	0xdf248cafa3ab59fc
	.xword	0xb4dab7f069226136
	.xword	0x156a5cc54f8468e4
	.xword	0x8ac3ff85b5671744
	.xword	0x10278567a7de0a3e
	.xword	0x69441dff8737ca81
	.xword	0x30ec5bf32f282a5e
	.xword	0xa95dad5d519e975a
	.xword	0xed3e29012cb99a7e
	.xword	0xc1b841d4674d8250
	.xword	0x289d9a527c60ee07
	.xword	0x40e60baa85f20fdd
	.xword	0xc176de60e5db57e4
	.xword	0xdf0e50d12225744b
	.xword	0xa3798be04a21fbd1
	.xword	0xc53be9ec8e853b70
	.xword	0x3b263595c49dfec8
	.xword	0x26df619122b3e3a2
	.xword	0xc283bef2ba682efd
	.xword	0x3c907348823a0cfa
	.xword	0x8a5f10ea798f4971
	.xword	0x9c7e3ea56697c22b
	.xword	0xeb305eabf281ccc0
	.xword	0x6dbf3f5427d1560a
	.xword	0xa6d65d6c123f0185
	.xword	0xa627b0e38d08b20c
	.xword	0x11a678ee2dbcf42a
	.xword	0xff3b273e32c012b3
	.xword	0xd3faabc32e9ed2db
	.xword	0xd501e8cd858600c8
	.xword	0x3effff0e2ec1118a
	.xword	0xbf5e7fcbad2f5481
	.xword	0x84c2789c432db9f3
	.xword	0x1567ddf62e53f61f
	.xword	0x12fd814e1caf2810
	.xword	0x4e228f4259ca024e
	.xword	0x4c15c490343ac117
	.xword	0xc792ca7e237213fe
	.xword	0xa1b3f49845a6d9b4
	.xword	0xda8294023543ea36
	.xword	0x20fd393046f231a9
	.xword	0x2de3a8a1d50f724a
	.xword	0x59c0126cf8c35a10
	.xword	0xff69c68203ddb158
	.xword	0x64bcc6d549d3a1d6
	.xword	0xe7b6cdac9af93853
	.xword	0xe9faf7016fb32bfc
	.xword	0x1c4cbb3a8d733099
	.xword	0xf7b1667b1edb7ebf
	.xword	0x697e50539dd990a0
	.xword	0xfbd5ea4d923c3698
	.xword	0x31bf3b60c9db4c1e
	.xword	0xf44459781b2039d2
	.xword	0x597a34292ad626e9
	.xword	0xc3b362e7f02b7967
	.xword	0x19c8bcec7c7b0e6d
	.xword	0x3164bbcfb32a3c8a
	.xword	0xfdfbd0979689ce09
	.xword	0xfc37f2eec4e7bf44
	.xword	0x381c309dd20dbb04
	.xword	0xf47181d8f1b31f1a
	.xword	0x589dc4b0a5c2650e
	.xword	0x8350879ed8be6143
	.xword	0x89e10b015f12ccab
	.xword	0x10fa5ff736ecee64
	.xword	0x7016dc8c8d15f692
	.xword	0xfac2067a93baba05
	.xword	0x6de071cd58feb2eb
	.xword	0xbc667a023262b579
	.xword	0xef051509de2f3e01
	.xword	0x1de55f43f26b4b36
	.xword	0x82e1e4a92ce4bf3d
	.xword	0xd2e56d133e6f5386
	.xword	0x56869ce93cb1e43f
	.xword	0x9879ada00fa7981b
	.xword	0x4af81c2920625e42
	.xword	0x9f7d07e87e91a61e
	.xword	0x8492b8109c6b5902
	.xword	0x9ddba2e114b93f45
	.xword	0x626937fafa0fabe0
	.xword	0x52405a3dc276d483
	.xword	0x1f35f5e33ea3babc
	.xword	0x778cfd828500b4ae
	.xword	0xca0be697c2fd8c28
	.xword	0x678218e2307252bf
	.xword	0x56300f0a62d8eb23
	.xword	0x2d8323d05ba652e7
	.xword	0x8642dde050dc514e
	.xword	0x1daf52d440040473
	.xword	0x940905f8a9f90e64
	.xword	0xd7b4c21cc26e8b76
	.xword	0xe20165d102c92469
	.xword	0x8997da5af4c8fe84
	.xword	0xad8716681739f801
	.xword	0x31db66720ca7f1b0
	.xword	0xb7d370dc92b41952
	.xword	0x423a09b9d0a6de59
	.xword	0xc0c77cb04bd554fa
	.xword	0x108d076309a9edcc
	.xword	0xf085bfc4694da303
	.xword	0x83ff777822f9b8fd
	.xword	0x9fb6c608f74def55
	.xword	0xd83a9c03f8969a79
	.xword	0x7576912f58d7ea70
	.xword	0x826b813eb916b959
	.xword	0x9b59a9ab92e39a1d
	.xword	0x3cece96a681c3cac
	.xword	0xba9d9c016133c2fc
	.xword	0x55474a23ef9e11f8
	.xword	0xa769d8a72bf72e05
	.xword	0x5e0760b6b4dd4848
	.xword	0x1b45b8eb375920f0
	.xword	0xb0ce6cebf21e8296
	.xword	0x9b9d81a0ef6e523b
	.xword	0x515998d56580ac54
	.xword	0x23fb0e4d20b5c349
	.xword	0xfc7d962d4eb52c46
	.xword	0xfbbdc407ee13c3be
	.xword	0x88da73dff92c0e0f
	.xword	0x4456bafb335d2551
	.xword	0x91e17e78437186f3
	.xword	0x4e2742747c0da33c
	.xword	0x9067ada497daafab
	.xword	0xa9d3f24f8ddba044
	.xword	0x9940d0a32aacd833
	.xword	0x70edf5a44a14574c
	.xword	0x233f5512e2afacda
	.xword	0x874f52449bb96f18
	.xword	0x60986477770ae6f7
	.xword	0xe1bb4cc47ba5a4e5
	.xword	0xf6832180fc519594
	.xword	0x2cc13671a9e8e403
	.xword	0x2830deb9e5ccf500
	.xword	0xfe5ef4f249f5a527
	.xword	0x15128053377db6bd
	.xword	0x9022c2c935641653
	.xword	0xec5f21a74ab6532e
	.xword	0xd829c962cbc58d9c
	.xword	0x87df71ce1090bec5
	.xword	0x33e7bb662bed39ef
	.xword	0xf028bcb1859204dd
	.xword	0xb8d038131caf0465
	.xword	0x877b05bcfd43008e
	.xword	0x474ad9f68f4a0558
	.xword	0xe8575114877f281b
	.xword	0x13a117021054e59b
	.xword	0xa23d01c792dfa3f9
	.xword	0xc1b0e089dfc6b915
	.xword	0x5e00bada3abf8ef6
	.xword	0x9103fd2a460319e7
	.xword	0xf8d551ebadef67e5
	.xword	0x37941e555e8f53d0
	.xword	0x8b69884cfcf97f5d
	.xword	0x4d0b4db0a65b0540
	.xword	0x743b69fa72904f85
	.xword	0x318dd670e73aa8d9
	.xword	0xa4181e96f7897825
	.xword	0x57864f97684c016a
	.xword	0xfef95a48f3cb4113
	.xword	0x772d59304416a5d4
	.xword	0x664d205c3685e845
	.xword	0x0ca4b391e3434dd4
	.xword	0xd85e8331ae000183
	.xword	0x23d2496e9ff72da1
	.xword	0xfc5e14b8f99de976
	.xword	0xbfef8dc497ec758a
	.xword	0x88d0f3f3482e05a0
	.xword	0x627febd50ec8a840
	.xword	0x9b0cacb27f34e838
	.xword	0x974e29615bc055c8
	.xword	0xb013ef18ef034482
	.xword	0xa26691dd851eb955
	.xword	0xe5067069c1858d59
	.xword	0x028b0711d362cd94
	.xword	0x600dee29fb084578
	.xword	0x5cf41b29c9d91183
	.xword	0xf69572ae7318cf47
	.xword	0x6ed6f5e226ef5722
	.xword	0xde540eda119d8b04
	.xword	0x80c595f89444dfe0
	.xword	0xe5d59f45d8f6e4f5
	.xword	0x175659f41500e686
	.xword	0x12eb47e60e8fe4f8
	.xword	0x53da942babc67cb7
	.xword	0xe3236209f81e95b5
	.xword	0xc095558835f08ff9
	.xword	0xe253c9edeeb4c0ba
	.xword	0xfa122eded7a8a4b2
	.xword	0x77e73b050ea7db4c
	.xword	0xec0a2d06695128a7
	.xword	0xe3b2414d219b6f61
	.xword	0x07f51661f6e601f5
	.xword	0x2c6fb1c8fcc6edad
	.xword	0x6a511e1c4aa4df18
	.xword	0xa082324e6027b239
	.xword	0x017c555e793aea3e
	.xword	0x4203e4808e5bf9b3
	.xword	0x9ef1126c29fac3ba
	.xword	0x53028c465a50cd90
	.xword	0x3a0efdc2d4804b9a
	.xword	0xfd0376930233a1cd
	.xword	0x28a3f0d3813a3b9c
	.xword	0x0ec8422d10130b1a
	.xword	0x5f1a8d6a70aab570
	.xword	0x6b8609047ac18dd1
	.xword	0xe7536733d0b75b29
	.xword	0x28d4f95d5e53d6ae
	.xword	0x54523eb1a1fa9fdc
	.xword	0xe10f4d43c3fbcb0e
	.xword	0xe430ef7579d76ff6
	.xword	0x6c7eeefd405bf48a
	.xword	0x8f01c38153cc0b66
	.xword	0x8101b0e78ae7be9e
	.xword	0x2d9da23e4c6b608d
	.xword	0x854b2d9ea8d273ae
	.xword	0x752a68eae8ab40d2
	.xword	0x53392a8335788067
	.xword	0xcd3059dcba673f2d
	.xword	0x07e8228ca748a44e
	.xword	0xac99760d314c318f
	.xword	0x1971caf3fde728a0
	.xword	0xb80b9d74e1c3ef3b
	.xword	0x7056a995bf7ba860
	.xword	0x32257ebfd1e65c62
	.xword	0x87548d828b98a3ab
	.xword	0x899891225f47e415
	.xword	0x92cb35477c37d285
	.xword	0x2a73d1a420a2fd06
	.xword	0x9f06179695e77186
	.xword	0xf7fc7a091046d5c3
	.xword	0x9a780dff5527d058
	.xword	0x9aaaaba83b0560bf
	.xword	0x7ad5b5ec38ab54b6
	.xword	0x24b5e56b0fd43b29
	.xword	0x94a8fd9083bff0a9



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
	.xword	0x72d6b5d747553b7f
	.xword	0x50e3aa605e7253c2
	.xword	0xcae7c7e799c1cd35
	.xword	0xfb8bfde6215f7ffd
	.xword	0x7dcf52375085a036
	.xword	0xf559237b5ae44840
	.xword	0xa321669f41e72a6b
	.xword	0x89d312b29a040b65
	.xword	0x5f092036e615fa0c
	.xword	0xd4b8cdf80b4bb313
	.xword	0xd6a029c9d0e42207
	.xword	0xa1b5148446fd71f1
	.xword	0xa60f84e98c378821
	.xword	0x95dd2071d87f2ddb
	.xword	0x6e9013a673956a70
	.xword	0xb592446bfee0cac7
	.xword	0xc2d7441ffc27c6fc
	.xword	0x85a263c5b9d08195
	.xword	0x66c53ef2efc739c6
	.xword	0x13b38488ac6f935b
	.xword	0x2595d1ffc8ba80bd
	.xword	0xfb1e6c19bf653a11
	.xword	0x5f8ccb2ddeea2192
	.xword	0xc2581e3d7c0fa85a
	.xword	0x2f24bb275bad4ea6
	.xword	0xd49146f2b80a59a7
	.xword	0x1fd92855cb4066c8
	.xword	0xd3f7f5f379a23f3d
	.xword	0x3a41c02bb802c279
	.xword	0x7f4f72636e37498b
	.xword	0xe0624f32277e0bb8
	.xword	0x6699c921f853cfbb
	.xword	0x55c591e134cda082
	.xword	0xfc164b7943495e18
	.xword	0x6a0e70387fa5b048
	.xword	0x0f0f3d4daaf0acc7
	.xword	0x74cc6bd2f33ec10c
	.xword	0x0891d5be8f94e027
	.xword	0x2c788216f2346c5b
	.xword	0x207a416b526cbea8
	.xword	0xbebb3d3aa57fd60d
	.xword	0xc7fdce390a7bf1da
	.xword	0xcc0d6b2e4e6c762c
	.xword	0x0574b70023ecc197
	.xword	0x75ab7a8b3502bdb7
	.xword	0xd2ded08d02f6b5d4
	.xword	0x26ebff75e8efd6cb
	.xword	0xb7787b7276abc14f
	.xword	0xf31fe1549d940b78
	.xword	0x781379e7aaebbc5f
	.xword	0x94751c45f15e5c92
	.xword	0x2bdf2320ad8b3a5e
	.xword	0x1ca4658a074f628d
	.xword	0x61680b3a07b76ba4
	.xword	0xc96a661001ba964f
	.xword	0x6ecdd7a2904b7569
	.xword	0x4c35942877f8c69a
	.xword	0x3e6531b50321b7e2
	.xword	0x6b7c0892d8f2a5fd
	.xword	0x0f539a8bf28188ba
	.xword	0xe1648c070b9cea51
	.xword	0xfa724a6f270cdc50
	.xword	0x7961092fbf4ad530
	.xword	0x99955920bb629847
	.xword	0xe86db016503a030c
	.xword	0xff3c6a6b6b104b31
	.xword	0x9c52354dbca740ac
	.xword	0xe4845348c36c0001
	.xword	0xbd5f32e6375798a1
	.xword	0xba454effd4b9642d
	.xword	0x8cfff380b0dc0af0
	.xword	0x57db25049dc4998a
	.xword	0x6eba23dce911f2e8
	.xword	0xe7c46fb509b54129
	.xword	0xf48d9da93fc6fabb
	.xword	0xb6d4886931e9c18f
	.xword	0x4a225917cdee2165
	.xword	0x68aca073cb58909a
	.xword	0x679a394ba3a6d2ae
	.xword	0x571b7f633219df52
	.xword	0x8735c096e5e6bddb
	.xword	0x005b795991178e5e
	.xword	0x5dae7523272f9212
	.xword	0x957afc06c37a7914
	.xword	0xe111d35591157282
	.xword	0x2ff280a52ffd094f
	.xword	0xa9acd4ab30980030
	.xword	0xf38ed39b3228714e
	.xword	0xcefbd34ee5bc3911
	.xword	0x61305e511cb365db
	.xword	0x4aed3c7fe9c3dfbc
	.xword	0x979ed65b80913568
	.xword	0x11ed9201196a16ee
	.xword	0x690ed602e97ffc88
	.xword	0xf478eff7b2cc09a7
	.xword	0x9204cc9424eab76f
	.xword	0xde18826eff25ddd9
	.xword	0xdc745527370f567e
	.xword	0xd715f00d0bb645b8
	.xword	0x9aca7543c7111a07
	.xword	0x57f63483d6ae13dc
	.xword	0xc52b38c98c7f7618
	.xword	0xfe939ec89ee2c9a8
	.xword	0x84f7ef0afa4f46db
	.xword	0xa162e1527290203d
	.xword	0x0c26f97c00509421
	.xword	0xc9e0570e5a8a1148
	.xword	0x4538381ef9d5b9f1
	.xword	0x1dcf695ed683bfb9
	.xword	0x9447752a3f7b21ff
	.xword	0x7fcab3a5e821a391
	.xword	0x8e017e5c128ee0d5
	.xword	0x23362dd6de541250
	.xword	0x3eb967adac6118ea
	.xword	0x83ed3ef9618b4b68
	.xword	0x788249bf552cde38
	.xword	0x8702ab3f67b55305
	.xword	0x55017db3db6730db
	.xword	0xf58b2d7b1a3f77ca
	.xword	0x1c4b6ff659dd8324
	.xword	0x1eba0d0803885dfc
	.xword	0x01fe82e0ed5e7852
	.xword	0x903edd07811f00b5
	.xword	0x2f23be9ecb60601a
	.xword	0xbab4474a8e0d7483
	.xword	0xebe17a5ca5403456
	.xword	0x5ab414390cd6dd19
	.xword	0x13ac9864b1128f58
	.xword	0x86e66fd367c7cfde
	.xword	0xf5c95e8f4bda0451
	.xword	0x7127dbd005f901ee
	.xword	0x4ede5616b223c614
	.xword	0x831b5af6d79f17bf
	.xword	0xce8d22ac8b997985
	.xword	0xb0e64e2f25a2cfc6
	.xword	0x7179ba1bc571495a
	.xword	0xe35d168a84401213
	.xword	0x09d3304d416d3240
	.xword	0xbbcbb6df48e0f2d9
	.xword	0x9acc86c5e1d4396e
	.xword	0xfd9043156f486f47
	.xword	0x1445e411d8e9f034
	.xword	0x5b276c13cca8d81c
	.xword	0x4815354f2f922586
	.xword	0xb9372f7d43b8ea10
	.xword	0xa16c0647019b3df4
	.xword	0xc9d6cf4908c33d92
	.xword	0x694c4e8a7e8cd575
	.xword	0xb66041c102c54d6c
	.xword	0xea9e9183f4780b40
	.xword	0x0601e1d761789834
	.xword	0xc5314d3ad0b0bffc
	.xword	0xf097fb41696cd440
	.xword	0xc7c994a7863b71e0
	.xword	0xecde76dea4873b2e
	.xword	0x4d46328e73720899
	.xword	0x5b9122b9e5ef47d1
	.xword	0x854bb9aaef6a78b6
	.xword	0xfbb9d9ebf9c765f4
	.xword	0xe6506493850459d5
	.xword	0x1dee2c427f463736
	.xword	0x64d26bfde54f9741
	.xword	0xfab4202d5116d97f
	.xword	0xe4ec3c98b702e3e1
	.xword	0x24827b079880076f
	.xword	0x4660d5ae7d450b76
	.xword	0x8cb95bccd1ba3bb8
	.xword	0x1bd94575243e1079
	.xword	0x597615c206f80014
	.xword	0x0fc5943c24d55ef4
	.xword	0xb0cf0cef4de5146d
	.xword	0xd3893fffdd0c9d4e
	.xword	0xee80b7f41f2df707
	.xword	0x4b81395f69793dfd
	.xword	0x26ad9ff65497671d
	.xword	0x90011a71990c793b
	.xword	0xb0e821fe5b97b25e
	.xword	0xcc0281d9f24af03e
	.xword	0xd55db6e64aaf0e7f
	.xword	0xe0261b1585c17735
	.xword	0x505a92b7aac579ce
	.xword	0x53e18ff99e743ad0
	.xword	0x8689283bcc666a95
	.xword	0xbb2cef37ce3bf268
	.xword	0x98bded6ac670c717
	.xword	0xb69ceda29fab0fe1
	.xword	0x966e8e603de1e48a
	.xword	0x14ba331815180dd4
	.xword	0xa7dcc53c70faf09d
	.xword	0xefd60b29c8580308
	.xword	0xc2484753d6d43673
	.xword	0x749d2ba3742d9963
	.xword	0x45e1c7c0db065359
	.xword	0x1634a819e907d924
	.xword	0xde401e6e2dee036c
	.xword	0x372528a0b7e6151f
	.xword	0x16c33ea2b87e3bc5
	.xword	0x7749a696c4136ea3
	.xword	0x92bc3c8a5351c312
	.xword	0x543512d1e271bdef
	.xword	0x5fa88731ca962bc8
	.xword	0x53b331eae07f0783
	.xword	0xd446e1ff4fb6f98c
	.xword	0x3f718307d63aa656
	.xword	0xa8beb07da39641d6
	.xword	0xc6d31a26e20f25f1
	.xword	0x0ea1643b0dcd34e6
	.xword	0xb1e5ee8573b8569e
	.xword	0x52176a86a700f5f4
	.xword	0x5e26018b88327a01
	.xword	0xc5bc41552c92c98b
	.xword	0xff1e4879e9556f81
	.xword	0x0ca3713f9cadc061
	.xword	0x6123f3aa2809e0ad
	.xword	0xd2c79849764789c2
	.xword	0x78cdf660e0eddf13
	.xword	0xa4fb593c18d9f8e4
	.xword	0xa5bc965f5861bbb2
	.xword	0x4015fad4a13d967e
	.xword	0xf3f37232f2b86c84
	.xword	0x1f034c1416a1767e
	.xword	0x2d6745feb07ae2e4
	.xword	0x0d5581f3adf8bd02
	.xword	0x9bbae97a1aaec807
	.xword	0x9001049bfba21cfd
	.xword	0xb4890677c7ff4c64
	.xword	0x49ba64526aeeddce
	.xword	0x5543ab91a03888a1
	.xword	0x3ac7c0ab85d06968
	.xword	0x6b22c668bb845d18
	.xword	0xdb6803f68a904a58
	.xword	0x35713c0d8490fd59
	.xword	0xde49a3e3a1c22630
	.xword	0x87b4d52f4706380e
	.xword	0x135634de2fd3bb92
	.xword	0x492a78559265e9f8
	.xword	0xc4e4cf1736e7b4b2
	.xword	0x364e431cfc86e4ab
	.xword	0x995b1e677d33d70a
	.xword	0x396b9e80f871de51
	.xword	0x7e2d8dec57528621
	.xword	0x006977f014dd8138
	.xword	0xb8157e105cbd40e6
	.xword	0x212e0c38dcf6e9c0
	.xword	0xf71d187ce73a12c5
	.xword	0x1f6a81db608636ca
	.xword	0x05fa077a6b45ad37
	.xword	0xacd1908f0b414199
	.xword	0x186cb4aa58a02d6a
	.xword	0x10d6783e3517a12e
	.xword	0x4b134ad128b30db4
	.xword	0x14c74f61739a903e
	.xword	0x6a187d52daf3bc9c
	.xword	0x05fd5f0142516e6a
	.xword	0xd244137fbff31301
	.xword	0x391b4589350ebbf9



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
	.xword	0x3e2424eff850d75e
	.xword	0x72501bdb2bc6ac70
	.xword	0xd55f6a0ff059ac38
	.xword	0x8170db282fc9183e
	.xword	0xa37fe8992e814a3b
	.xword	0xc1a75350994ace13
	.xword	0xfcfaccfece3f2d5e
	.xword	0x083c3f3699991184
	.xword	0xb5cabac2b28c50c1
	.xword	0x23f9b35c3beb9a84
	.xword	0xccfa001fe929999b
	.xword	0x9cbffd0a018e591a
	.xword	0x2ef32ca99333b503
	.xword	0xc0c6fe8097d1b715
	.xword	0xc4ad57e09515965c
	.xword	0xa6b08edc2beced01
	.xword	0xb42e1a9492cf8281
	.xword	0x5c01428dfeb3ca72
	.xword	0xc8693e70ea1efad8
	.xword	0x7527ef7a348ec14f
	.xword	0xfe5b914df7cfcff1
	.xword	0x467ed5f8b13e4c51
	.xword	0xdaa704506a5014b8
	.xword	0x7869b7ce8de60163
	.xword	0x79ce198c2ef15e63
	.xword	0x540b05ab4f19d177
	.xword	0xd5b36750b8895f4b
	.xword	0xa1815abab5c3561d
	.xword	0x55abcc97accfe75f
	.xword	0x32809ceef6cafe77
	.xword	0xd75314e993bd0206
	.xword	0x5caf6ae0a1880367
	.xword	0x503eed90f0de1b74
	.xword	0x740059246dd6f913
	.xword	0x11ecf131fe7a60c9
	.xword	0x7a749c300476511d
	.xword	0x84d2f7d9843653f5
	.xword	0xc7f4ca96015d715c
	.xword	0x620cbc60e4b7ffd9
	.xword	0x6170b35c97732111
	.xword	0xa5d4184b6d8108d6
	.xword	0x8b921829ada775b6
	.xword	0x51b61b2a8432880c
	.xword	0xba71aa46ee0794a3
	.xword	0x9cb1a16ded142085
	.xword	0x7e6f77c5f873568a
	.xword	0x23433c21eee108e5
	.xword	0xeb1943389c044840
	.xword	0x0c03322b96a23bb8
	.xword	0x43c2c4c21a490f33
	.xword	0x1e0346479f7d1650
	.xword	0xfbe26e6c79f684d1
	.xword	0x5987323152739a43
	.xword	0xfcb6cb8ead6c8563
	.xword	0xb1cc388e4904cb24
	.xword	0xb789ef0670e5efc4
	.xword	0xa97450db3a9ebd93
	.xword	0x64acc68a4371c4da
	.xword	0xe5879d5d3c48859f
	.xword	0x704a8225a423006f
	.xword	0x1991ab5aafd153f8
	.xword	0x69195a52cac146c9
	.xword	0x0afe170f4450b63a
	.xword	0xeb5c3e6916891a2d
	.xword	0x059d70d7f2116ca9
	.xword	0x5781ce6e29b1e32f
	.xword	0xb886423162d21cf4
	.xword	0xfbb3e6732c01f879
	.xword	0xcdbd09f96bc66b4f
	.xword	0xec13117a51218437
	.xword	0x6b8de125e0d62851
	.xword	0xdd1fe6f8404840a5
	.xword	0x35c91a3e0d178c74
	.xword	0x4e1b1046d1872741
	.xword	0xac367456c6101fe0
	.xword	0x3735eea54234c0c0
	.xword	0x9bf620408f1585cc
	.xword	0x0e08d2cada9a60e0
	.xword	0x5425df0cda7372ea
	.xword	0x4475c58ab73abc86
	.xword	0x2a35bce3bebee1d9
	.xword	0xb5a6fab1a100b2b1
	.xword	0x4e337e01759f2d98
	.xword	0x4e8ce44ac83ce5c4
	.xword	0xe6afbed7957c28b8
	.xword	0x6068df9ae93eaee3
	.xword	0x501323bc4c1ac39f
	.xword	0x237ec63371f3892f
	.xword	0xd112876f22417bb2
	.xword	0x64d257ce162a9f48
	.xword	0xb51a9ae97ba01620
	.xword	0x95b38d454adb0534
	.xword	0x66c3479e30a70f85
	.xword	0xaff6c4408ea7bfb4
	.xword	0x2794713237c21aed
	.xword	0x1e5659b5513c5fd4
	.xword	0xcda6c73fe3cc1b58
	.xword	0x92e3edd0d9617127
	.xword	0xc118279435f4c7ff
	.xword	0x116e0225de3e0c6c
	.xword	0xd4372c4ec27434dd
	.xword	0x25f916e214812957
	.xword	0x2d47a8f902dd9ead
	.xword	0xee87d27d4e5bae0d
	.xword	0xfb3d4d63da7b7505
	.xword	0x04cd1627ac313609
	.xword	0x21bb6374f0c74bbc
	.xword	0xb1022edebb665507
	.xword	0x0c80d401383041f1
	.xword	0xf19c8b16789e09b5
	.xword	0x0607c598ca8b63e4
	.xword	0x6a40229c9912ee08
	.xword	0x0e8cc83a43563d5f
	.xword	0xa9ddd6b4047a91fe
	.xword	0xc8fca85dddb52456
	.xword	0x4e2b66d8e1fcc926
	.xword	0x7126eff1d01d05fa
	.xword	0xcf4694713d6ac7c6
	.xword	0xb43bed38755bb358
	.xword	0x7fb1ae661968d21e
	.xword	0x009a49878760cdba
	.xword	0xeab127e3412433ac
	.xword	0x3df6fc7699119636
	.xword	0xfbe87b4a56d1cfb2
	.xword	0xc1d98c32aad7dce9
	.xword	0x8f5b6b19d6e1ba3d
	.xword	0x6d9bde319f13a913
	.xword	0x97553172a5fa5600
	.xword	0x8b4f2e221354aa76
	.xword	0xb0f24003d0ae5247
	.xword	0xae814f133472d05e
	.xword	0x95ada8e050b582a9
	.xword	0xd60249657e84ee27
	.xword	0xf31025a5e286dbbd
	.xword	0x5f5133ff07f7e736
	.xword	0x65d3918d0d4146ec
	.xword	0x12783c3dfc304906
	.xword	0x3fcda543418cc82f
	.xword	0x80219b774829d26c
	.xword	0xd26e0105f1b0c8a6
	.xword	0xef0c22176c1fbbdf
	.xword	0xba8e2f54d042130d
	.xword	0xfb3ab7a4e49f7087
	.xword	0x9b9629afd1cf3776
	.xword	0xbaad683b77b9e820
	.xword	0x5d56cd4acfa948e2
	.xword	0x7fff91f0523b9ed4
	.xword	0x70d27d657f59c0f2
	.xword	0x1adadc597c162dbe
	.xword	0xafc21eac7750964f
	.xword	0x958023e7ec7a5603
	.xword	0x438faaff83d4f76a
	.xword	0x681de38d93532cef
	.xword	0x48f3d7a5355b207e
	.xword	0xb08f5b605cfb2ace
	.xword	0xa85bc00d6bd233d5
	.xword	0x636af8ec82faa6b9
	.xword	0xbcd9995a88ba477d
	.xword	0xc4b46fd80d5abe6b
	.xword	0x629cd05f27db875e
	.xword	0xe8d2ee313cffa6ed
	.xword	0x838ce7e5791fb857
	.xword	0xc121b70f5ca77d65
	.xword	0x77fd338433192135
	.xword	0x4fea434dda021831
	.xword	0xb9702e45b2a9a4f9
	.xword	0x77273d3e39facdda
	.xword	0x4da98a5d536a7d50
	.xword	0xecbf38f4a86fd17c
	.xword	0x13bb29e4a7f0e86c
	.xword	0x6e7de52c031453f6
	.xword	0x72907e30ed2f6d95
	.xword	0xe5b273cb00ffaf25
	.xword	0xe081f86649d41401
	.xword	0x1f73d5a692776f7c
	.xword	0xe8694cb321a8e1f2
	.xword	0x4e817e1c334c6bb1
	.xword	0x8e05d71782e9b686
	.xword	0xa27218ed1f819060
	.xword	0x09fda3ae07830aa7
	.xword	0x0573fa8f68d1ca69
	.xword	0xbd647c3374a56861
	.xword	0x7d4b5229eaf9a10c
	.xword	0x3b51de0852cb5d70
	.xword	0x5169c31a515af9e4
	.xword	0x33e38a735f69ce77
	.xword	0x8a22e2f16117048d
	.xword	0xf1fd9f2c179ee929
	.xword	0x4ea3da53c4a8d1a1
	.xword	0x1914014af27a2cf0
	.xword	0x29524ff372ad9351
	.xword	0xdcaca6fea62b2336
	.xword	0xbb5d85832faf0cb2
	.xword	0x83ccce02278dd63e
	.xword	0x2980524d0ecc7ae0
	.xword	0xa40287aed9af8202
	.xword	0x7f8220f1b7711ee3
	.xword	0x54a5c87708488657
	.xword	0x06c8058dd6fa5bba
	.xword	0x6eec98cd55d3e360
	.xword	0xff5d056d528dae40
	.xword	0xe3fba7b1b14d4846
	.xword	0x226ce5cb2d710435
	.xword	0xe1410b21422c66f2
	.xword	0xc3bf4fe35556bd15
	.xword	0x1a4865eaae0efedd
	.xword	0xb009f64e5db1c2b2
	.xword	0x95194609c355fefe
	.xword	0x4b1c53a16b48f100
	.xword	0x1eeff088f1c10353
	.xword	0x5566cb4f32ece83c
	.xword	0x6f0c45a3e7bd9cd3
	.xword	0x44950c29d28ff22f
	.xword	0x300e9b58af080cae
	.xword	0xcc4c81f3fa031a78
	.xword	0x442eb5e0c022dad7
	.xword	0xde81447bb815db02
	.xword	0x83fdaa0ab3b4691d
	.xword	0x2bab1acf2dd8af1f
	.xword	0xe1a9be0f80614340
	.xword	0x8ab3848a04e23892
	.xword	0xc6b743b83a9a97be
	.xword	0x5e2c58be32570641
	.xword	0xe7487f41ffa8e094
	.xword	0xcf994b0d487b1652
	.xword	0x89f803ef5e6818c0
	.xword	0xe3ba7be1088ad7f2
	.xword	0xb8bc2192eaf23b57
	.xword	0xcbdf878a5ba63d49
	.xword	0x51267b472bb8baa4
	.xword	0xc4b3f2aa59b14137
	.xword	0x86a74d1659070b21
	.xword	0x515c36e03a288686
	.xword	0x752d49a82a257272
	.xword	0xcd98a1f06deae98e
	.xword	0x6afbdcf5a8c317b1
	.xword	0x330b546da3292e59
	.xword	0x20b189ab7ba120c4
	.xword	0xe4a7383d3b0d5fa2
	.xword	0x91c712a951f72ffd
	.xword	0xbb8c05c75291e4ee
	.xword	0x6698dced4d242204
	.xword	0xe59920d45a213b81
	.xword	0xabf67b2652bd0658
	.xword	0xc2fbb12c0d92c86a
	.xword	0x4e34e97ac6a1987b
	.xword	0x9d16492e50eb1d77
	.xword	0xa37e1d3da3d33f09
	.xword	0x53e2a3ef9ac5a447
	.xword	0xc94d3738b76c050b
	.xword	0xcc5b800be493971d
	.xword	0x73ece0e19b0e26a5
	.xword	0x882cc39b1ed8c82c
	.xword	0x4af74806962f46d0
	.xword	0x2c43dd6ae2fcb9a7
	.xword	0x5e6c1267a0da08fa



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
	.xword	0x2ec72c9797856bd6
	.xword	0xb80fc81ab56fcc73
	.xword	0xa13b9a6aab3ee899
	.xword	0x9ce74e0f1f4d5864
	.xword	0x1463595a969a0847
	.xword	0x4610553d95aa3e94
	.xword	0xa7db737a0accd78f
	.xword	0xff46782d9dec73a5
	.xword	0x8466c9b1c41bbe47
	.xword	0x562a5f6620973116
	.xword	0x301eb633ecda786c
	.xword	0x28e9d4237b60b93b
	.xword	0xc90c9c2a9877883d
	.xword	0x895e94901b47287d
	.xword	0x780c0a9ac2482694
	.xword	0x3a27057e35bd827d
	.xword	0x26a4f10070809745
	.xword	0x365bff6347146c41
	.xword	0x285fd22eaf5c9e29
	.xword	0x6a0b4fefddd1ed74
	.xword	0x2b2b212d1eddb645
	.xword	0x2d7285ee2ea3bc9a
	.xword	0xcd96f999cfffaf51
	.xword	0x3e38bd3fd1be61d2
	.xword	0x5363aa4b9072058c
	.xword	0x3031b8d386da9a50
	.xword	0x9b27e627cb4acee7
	.xword	0x31dd9dfb7cfba689
	.xword	0xa80840d606f743d0
	.xword	0x3a95b72a6857d9cb
	.xword	0x7700c40e80848239
	.xword	0xb7c9d452e6eae469
	.xword	0x21b06edf12de2418
	.xword	0x604bbbf6e5dbefc4
	.xword	0x3564f484c688b4fa
	.xword	0x1cfb333b0ee0e3f0
	.xword	0xbb6bc106cf166822
	.xword	0x765034d3e5edc95b
	.xword	0xc811d622fcc7150e
	.xword	0xb2e847ef043ce8c1
	.xword	0xbb3c3cf505be3d49
	.xword	0xb9385f03bf5a67de
	.xword	0xe9d431ff70154ff7
	.xword	0x5671ca54aea54237
	.xword	0x76e1808ef52043e0
	.xword	0xd4925c3ec2ccbe17
	.xword	0xa166fbfae3457f18
	.xword	0xd1792e5cc1b89543
	.xword	0xb0b59307422a319a
	.xword	0xe5f6596095eb5f3e
	.xword	0x97098a5e49c0281c
	.xword	0xbbc50249e21fbd2d
	.xword	0xcfa696fe89f7407b
	.xword	0x2e68c2d666e27051
	.xword	0x7538e5e5e145fba0
	.xword	0x858c5c96bb2c7f0a
	.xword	0x0a50286d10f1a2ac
	.xword	0xc350be4edcab9946
	.xword	0xcc29dfe5853dd169
	.xword	0x011e03e141b953d0
	.xword	0xa25ac928641cda25
	.xword	0xec8ab608e470a35b
	.xword	0xad13df5f51fbbd0d
	.xword	0x5a3e92b90345beb6
	.xword	0xc0f8c50f9c2937ab
	.xword	0xaa58e262e80b2ff2
	.xword	0xc0ea49634c247c40
	.xword	0xcef1c49c56c2ec9d
	.xword	0xf464302854503ac2
	.xword	0x3011360cc8eac12b
	.xword	0xc48fc2627bdf22c0
	.xword	0xe598ecffed17846a
	.xword	0x1c2970ce42acfb36
	.xword	0xd13cdae19a0dc0d5
	.xword	0xfb2c9a09867a4022
	.xword	0xdbdf3e755d3d52bf
	.xword	0x4d434eb64d53c3d0
	.xword	0x18952cf95d34953d
	.xword	0x05e18468cbed38a1
	.xword	0xa95faad2de537f95
	.xword	0x35e81024aff17df5
	.xword	0x14a723797b634a80
	.xword	0x27052022a5a3b787
	.xword	0x19e995aab39d3ee5
	.xword	0x1cca962085ea0653
	.xword	0xfbfd4f01367a2f97
	.xword	0xb93d8dca98907ae3
	.xword	0xa9e4e76757a43ab0
	.xword	0xe1b8ea0b2dc1bb7f
	.xword	0x9a5c5a6000d2e764
	.xword	0xcfb2d00d56f009ab
	.xword	0x281ed53f019a91e6
	.xword	0x9c01862fff473bc0
	.xword	0x2ad8a8f3725b0f84
	.xword	0xb9b3307a2f0696a8
	.xword	0x0e111654b0884537
	.xword	0x9c31a89367b7841e
	.xword	0x053c6c5cb2a2874b
	.xword	0xa6e9c2caf9ca6427
	.xword	0x8b2b43a570ac4faf
	.xword	0x2247d9bd960c885a
	.xword	0x6525846bad982edc
	.xword	0x837047db51df1b80
	.xword	0xb943765a8d1216b5
	.xword	0x1f9126fcf98dac8c
	.xword	0xa9075a813b903d9f
	.xword	0x5aade05f0b0788ea
	.xword	0xb4db12233258c408
	.xword	0x01dac75da65799b8
	.xword	0xe9ce9e06d5db7975
	.xword	0x63411bd515724ad2
	.xword	0x500796e04aabb191
	.xword	0x5d2fafad6237bab9
	.xword	0xa8732ac00810b833
	.xword	0xd290d40c2f747135
	.xword	0x0ea603070638d1ea
	.xword	0xb645a46d26909976
	.xword	0x7c688b75a910b63d
	.xword	0x98d288ff97ebcd3b
	.xword	0x45047a88cbf61581
	.xword	0x6c94626c51a4f497
	.xword	0x92dab8172af696ac
	.xword	0xcc0126d6bffe5652
	.xword	0x74f0a1d90fc38510
	.xword	0x23de9438a09ec36d
	.xword	0x5f2c948b2f115241
	.xword	0xee5cb4548e9d761b
	.xword	0x0b08527085cb97a3
	.xword	0x3f0adf8b49dd3e8e
	.xword	0xf0a545ac9b7e6735
	.xword	0x321096a5002639bd
	.xword	0x5e87f7b5255324b5
	.xword	0xcc0d5db5818671f5
	.xword	0x2658d6d9cbbf252b
	.xword	0x6abafed534aca7ae
	.xword	0xa43a0965457f56e8
	.xword	0xf89602784cab90c7
	.xword	0xc285461f40d96a0b
	.xword	0x621c38cfb05d253f
	.xword	0xb410f9cb2adf30e4
	.xword	0x5a8a9b0f82431ead
	.xword	0xfbd84cd5e0b032ec
	.xword	0x42eb168e2548ae97
	.xword	0xe4eeda500a9a7ae2
	.xword	0x404c1873c2268bda
	.xword	0x6a7e5ad5c3232201
	.xword	0xd2f2c10460acd54b
	.xword	0x0f834168ecd80a36
	.xword	0x911b84d0976f8188
	.xword	0x0a40c6ed643b463a
	.xword	0x4e6fe58a07117a8a
	.xword	0x28fb560ec1cf652e
	.xword	0x6b373efbd737b94f
	.xword	0xc8af99118d19eab0
	.xword	0xdf65ba154e4e5fb6
	.xword	0xd49176b2990885c3
	.xword	0xc8eea9268bda4b50
	.xword	0xe9492504c5b13f7b
	.xword	0x0565f28aad90968f
	.xword	0xb3b6ae14d50f4965
	.xword	0x0b963344368926e1
	.xword	0xb9511fc789ef4c2f
	.xword	0xac10f539713b889a
	.xword	0xe84d81aaaebc05d7
	.xword	0x45c9ac6563db5abd
	.xword	0xf4e17df03479dab9
	.xword	0x747f7fca9cdaa3e9
	.xword	0xc3863e68fc76882c
	.xword	0x76fa39bb6c8f1773
	.xword	0xbb424d91242b2a60
	.xword	0x538fa2a872888d6a
	.xword	0x01bc6d0811386401
	.xword	0x1ad689c142aeee27
	.xword	0xcf7bb0686aa240e9
	.xword	0x1fca9633917d325d
	.xword	0xe328d5267a661ffa
	.xword	0x534644aa6b53f7a4
	.xword	0x84a0db0b28610db5
	.xword	0x07446db5d6f63fef
	.xword	0x8f53f246ae9ed109
	.xword	0x20283bdfea458d2b
	.xword	0x37004633e80f7ad1
	.xword	0x5a4d6b20786e8612
	.xword	0xabd4bef9e2737bf8
	.xword	0x9cdabea4c6eff450
	.xword	0x1069d023a9265dc7
	.xword	0xc53456503a2850f0
	.xword	0x019d64d217914675
	.xword	0xed0d344660eec3de
	.xword	0x767fe0aa5fcb1e7e
	.xword	0x12cddae397914c6b
	.xword	0x686843314b57079c
	.xword	0x4b6c02169d9ba30f
	.xword	0xd1821d62e860e146
	.xword	0xf4d8e6d3fec6af5b
	.xword	0xe0c6fe9fb440ad02
	.xword	0x7611ce6d003896cb
	.xword	0x671f3198b56f76a9
	.xword	0x65e2541d91ebf40b
	.xword	0xa6bc2452b8581cbb
	.xword	0x7e9b44a2fa5dde0d
	.xword	0xf55767e300b54c7b
	.xword	0x39026c97e06654f3
	.xword	0x0d9f63cf08367e0c
	.xword	0xc23c1d20bc4d4cab
	.xword	0x414835768c13b662
	.xword	0xb41c9c3fe4e7498b
	.xword	0x9897b8966010c41e
	.xword	0x2d2daee0b9d14026
	.xword	0x0f07a6ce8b3039e4
	.xword	0x6a8ac8e0562f5da0
	.xword	0x5ea7ee4ad09b43da
	.xword	0xaa5760cfc109fb3a
	.xword	0x94118fe998df7461
	.xword	0x33f15663d5970e8e
	.xword	0x8ba966e848f90298
	.xword	0xe3d6711b62759a5e
	.xword	0xd50086245ab6127d
	.xword	0x9882f6b41f1e2d55
	.xword	0x3db2185d48b7f383
	.xword	0xdede029bb8b064f2
	.xword	0x75fea956fa566ac2
	.xword	0x6f0249572db01f57
	.xword	0x7979a135ba2a084f
	.xword	0xf0bb4bbfd52ff2f1
	.xword	0x66f26cecef0533cc
	.xword	0x6ced957c2f43203a
	.xword	0x273a931b84eecab3
	.xword	0xc585d4c08c72db00
	.xword	0xc1dff26e599b1bc9
	.xword	0x7f1c1199f081bf80
	.xword	0x46610e2b915024cf
	.xword	0xe736325a00e20fb4
	.xword	0xe39c35fedaea34bd
	.xword	0x466489455f4cedee
	.xword	0xc9a1dce63ddc4fee
	.xword	0xadada52339f8ad75
	.xword	0xd65cbb2804e444af
	.xword	0x5021f222d7ede1f9
	.xword	0xe3a439adb6e60950
	.xword	0x6fc095ab39b23f3c
	.xword	0xb3a3cb455541e788
	.xword	0xc96343b8178c86a5
	.xword	0x8563645b7fe88416
	.xword	0xabe5083222dace07
	.xword	0xb47132b35aabe920
	.xword	0x0cecf61d6040bebf
	.xword	0x1161436f135dbedd
	.xword	0x3394c1229a4a146d
	.xword	0x21c95454c544b52a
	.xword	0x96fb8bfca5ffe835
	.xword	0xfd4109c22d86a0b3
	.xword	0xf6d6e10b86abda15
	.xword	0x9a52dd84c1b7649a
	.xword	0xfe4a9bcefb245d35
	.xword	0xaa19df6acc5d7c39



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
	.xword	0xa40ea9205cf48d1e
	.xword	0x06428aa453e43b9a
	.xword	0x23f97deccb1de990
	.xword	0x9a3fb0cca0b45f8d
	.xword	0x5c8c17e7c2503892
	.xword	0x230fdeaebfbd901d
	.xword	0x8fcf704174803547
	.xword	0xd9d96ad0df09a0b0
	.xword	0x6909e004d9aaabfd
	.xword	0x408540e4d9c103f2
	.xword	0x84ffd965929fcd00
	.xword	0xdeba4c4071fe4f2a
	.xword	0x518d8d6177fd2d89
	.xword	0x3530908a7f8514ad
	.xword	0xf9822892c545c7a7
	.xword	0x04e3e45eff109227
	.xword	0x8cb0dd6922446c9f
	.xword	0x843f1d773c0196f1
	.xword	0x3ac4c93651c02508
	.xword	0xa0a68ac978f2ff5b
	.xword	0x5b5af0880aa21294
	.xword	0xa960c4423b0bd3b9
	.xword	0xcdacba8a3f653dff
	.xword	0x6a196fd6a4716fe4
	.xword	0x5eb364f5666d3ae4
	.xword	0x82e9e915ae7534df
	.xword	0x8d0d7ad14aae341d
	.xword	0x46ce54fec7ddb293
	.xword	0xa772a8792aeb5768
	.xword	0xfff70d50fa849e82
	.xword	0x3298f4105875eed0
	.xword	0x051ade9176e6fa37
	.xword	0xbd43c4db0a6b8afd
	.xword	0xe0399a591185cdfa
	.xword	0x559329899b86271e
	.xword	0xbbecdf59550bb4bf
	.xword	0x9f5142fb64d4254a
	.xword	0x021911cff214d7a9
	.xword	0x70484c25b840a599
	.xword	0x558156d859ce682f
	.xword	0xdc678edb633ba52f
	.xword	0x62eefd1e3de6329f
	.xword	0xb46dd902e34d053b
	.xword	0x2d6474d05b462228
	.xword	0xe36414d5f05ffbd9
	.xword	0xad80f50bde017535
	.xword	0x8a6e0ce1e43db878
	.xword	0xca9d3d38f19dab2a
	.xword	0x351ee9808bbda5ea
	.xword	0x1d43e4fc8de791f6
	.xword	0x07f8d210f9eb1f43
	.xword	0xed7d059f302aaf7d
	.xword	0xb6392c805f05b097
	.xword	0x92fe29237e76dadb
	.xword	0x35672e390bee4718
	.xword	0x1e927ca6c49c86ee
	.xword	0x2f80f4b2aa3130f6
	.xword	0x493dd568b15694f8
	.xword	0x0ec19c31e187fb38
	.xword	0x17c6c4dcffee0b14
	.xword	0xee547349fdec1ec8
	.xword	0x3b2637ea21c7d2f7
	.xword	0x8f37093cda4d6573
	.xword	0x7ac0df5d16cc2469
	.xword	0x325fff469b728f07
	.xword	0x5e79190871f18dc3
	.xword	0x66eee8982f518dcc
	.xword	0xbb4e022c0162bfae
	.xword	0x782b39a55ed67cbb
	.xword	0x05266a5a34222e9f
	.xword	0x07350f732256af60
	.xword	0x8af72fd54fe0f165
	.xword	0x2711798ad196f711
	.xword	0x436d4c7ce6fd29af
	.xword	0x399684362788fa4b
	.xword	0x72788fd8105af4fb
	.xword	0x9ac22e8fea86624c
	.xword	0x852531ca11dbca62
	.xword	0x173dc18d9ffeb579
	.xword	0x7a87951fa83f290c
	.xword	0x8a9bf39a56b61eee
	.xword	0xc0f23d7cf6d23155
	.xword	0xd2d297ea6cc4570d
	.xword	0x85b4118f0afd8ffc
	.xword	0xdf7fa945876e4eae
	.xword	0xc39786ed649d6309
	.xword	0xceb801b225e7979e
	.xword	0xe81e68eb4452d2b5
	.xword	0x028e8f463fb89fdb
	.xword	0x07565dc50cc191d7
	.xword	0xc12811d240c8cc43
	.xword	0x05d020a887cf5800
	.xword	0x1d67df0c03d0f535
	.xword	0xf6fb7ba35a672dab
	.xword	0x9e13c64f4be8ff95
	.xword	0xda38c66f1ee1fab5
	.xword	0xdbcbc91610ebba3a
	.xword	0xa342d85c7111699a
	.xword	0x95838ee10448628c
	.xword	0xc51b2f0acbff3aef
	.xword	0xc456289eddf578df
	.xword	0xc00d2a3b59da17f3
	.xword	0x1d20141acd2b3049
	.xword	0xea6c391dc3323e31
	.xword	0x41e05b3c94b96b27
	.xword	0x560bbad94c1e2ccb
	.xword	0x08c44f25d72dc36a
	.xword	0x195327186e9f00f9
	.xword	0x79c6a50567cbf3d8
	.xword	0x1d7ca862fb8850db
	.xword	0x075a1293d815b1a5
	.xword	0x137f5b2e158da501
	.xword	0xffc1c51499cb681e
	.xword	0x767db4963d04e52c
	.xword	0x0df1cdc28aafd685
	.xword	0x19b817de67fad9b9
	.xword	0x434b21d26749f75c
	.xword	0xb005a85e0a3b300f
	.xword	0x1c1eb8c28f58dbf2
	.xword	0x0309702980dd4958
	.xword	0x3f6af64884e92fe9
	.xword	0xe40205818932b648
	.xword	0x8d9d34ef445e554a
	.xword	0x6546853c29703f13
	.xword	0x367c598a08f46fd1
	.xword	0x5a6685120753cbea
	.xword	0x862032dccc955d5c
	.xword	0x6aba7b5b8351b935
	.xword	0xfb4d5b8296b40317
	.xword	0xaf08fa7ef4872701
	.xword	0x73726f26be5d3248
	.xword	0x875ddb73ffaabd4d
	.xword	0xe90da489903a13be
	.xword	0x7e32dc2c95f7f9c9
	.xword	0xaa88b712c9b449c7
	.xword	0xb7be0064f2b5de68
	.xword	0x6025c96ec6b41e7e
	.xword	0xf9c79a61e0b50e44
	.xword	0x7c67b8b540033b24
	.xword	0xb3a6e7b94a34e9b0
	.xword	0x805c6c584c98af3f
	.xword	0x32b66fb51a283fd8
	.xword	0x560814cfa917d1ac
	.xword	0x437bac670c81bc24
	.xword	0xb014f6760df14211
	.xword	0x9ed8d01bfb4a39eb
	.xword	0x35f5aec4af278b60
	.xword	0xcf28b831a6c709cd
	.xword	0xc0f19710844aed60
	.xword	0x6f7a8bceb8def640
	.xword	0xa5a1afdb05636a83
	.xword	0x56fdd3fd658afb34
	.xword	0xafc6bf63a7c42d71
	.xword	0x5b583af4dec99f9b
	.xword	0xc8e69f70fa78992a
	.xword	0x0ed241569f0c62c7
	.xword	0xae9c6adae324efa7
	.xword	0x8d96c14aa0e59a64
	.xword	0x4bf854d602b02d20
	.xword	0xfc39d069b143a2f4
	.xword	0xbc5ede96f081b5d2
	.xword	0xc50ef6020dacf0f5
	.xword	0xb0cc13fef782b843
	.xword	0x279cd2d57a3d5f6b
	.xword	0xd2b61a28d8223081
	.xword	0xbfc805b2a4d725bf
	.xword	0x4a4ff9899deb8cbf
	.xword	0x802accb0ddfa6700
	.xword	0x3faa1799def0f1a9
	.xword	0x3a26c12a641a6c75
	.xword	0xccb0f8d9b8438ff9
	.xword	0xaa622d037bced880
	.xword	0x2e583d054369620c
	.xword	0x66c4266f1f8751c1
	.xword	0xa4873993b35c2a5d
	.xword	0x4bded68cdebcbe7c
	.xword	0xcbe5de3183777eee
	.xword	0x900db8b0484d5745
	.xword	0xde95bc68939d623e
	.xword	0x542da714d773a722
	.xword	0x9e145fcd2b13f430
	.xword	0xf7047fc956ffd44b
	.xword	0x7442db41c584e654
	.xword	0xb3871ecc70a91c1d
	.xword	0xa748f1469be56a1a
	.xword	0x3d2d11cdbe53d6b8
	.xword	0xf6c9829233fb255e
	.xword	0x8473f8439377f608
	.xword	0x8e3f7e201d9e50f5
	.xword	0x5378c5c8f5425961
	.xword	0x70fdad35ec4cac22
	.xword	0x842726a035a69c5c
	.xword	0xee3c37e979f8abef
	.xword	0x8e5757c446d1fe5c
	.xword	0xcaae74ba2c1d9630
	.xword	0x89bc411fd93b36d8
	.xword	0x8f5ea44c999d65bd
	.xword	0x762e032d340f56a3
	.xword	0xbd0563fb47c0bfda
	.xword	0x3e55fd2a4bef7dd4
	.xword	0xba2b8700c5705740
	.xword	0x9defb002f6c5ae8d
	.xword	0x26e12ddd8c024bdf
	.xword	0xa821d3ff3c066781
	.xword	0x874f27bc73fe5323
	.xword	0x7c4bc047fb4d4f85
	.xword	0xfe6b465fdd56d2e5
	.xword	0x32783e5e943ab9ce
	.xword	0xe510041c246bf498
	.xword	0x91cb2b0bacf2ec86
	.xword	0x78bd2f044a44d2a4
	.xword	0xe65b3991dca1a4a5
	.xword	0xb13fab92334dd7b4
	.xword	0x10fd49eefbbbbe50
	.xword	0xd3fcef60ab1dd989
	.xword	0x9f1f26f45d42ff95
	.xword	0x20e64a1c15cee768
	.xword	0x59c168d8623f4342
	.xword	0x30c9c02e0b5c0f42
	.xword	0xb070fcb5c5714b97
	.xword	0xf8cf6eb9611b1f59
	.xword	0x7b2d8dc6ff387bb3
	.xword	0xd4a878350fc7c42d
	.xword	0x3daf8ea36e06b728
	.xword	0x23f3bb7ce30d4c3d
	.xword	0xb460a3293f7ffe93
	.xword	0x4481ce78d1c817da
	.xword	0x504949b221fe3e8a
	.xword	0x23914952d559e899
	.xword	0xeeef87cd74eff738
	.xword	0x4454f338806fcf41
	.xword	0x1c581fbbd530ccc9
	.xword	0xa35a9e2c8eb4ed7a
	.xword	0x454095e115da0fc1
	.xword	0xa785b720a31f3d32
	.xword	0x4dce03c0f486ab41
	.xword	0x146e3c2cbe116166
	.xword	0xed614d2cb111035b
	.xword	0xf312361a9f365662
	.xword	0x05d4a8cea72d491e
	.xword	0x051700963c5c2eb3
	.xword	0x95edea46ba939da2
	.xword	0x4375f1443fab2224
	.xword	0x84fc4abcae71aae3
	.xword	0x55055571a4d64cd8
	.xword	0x84afa5044bef0380
	.xword	0x1e9c9c85f5fdbec8
	.xword	0xf74c07743f899f52
	.xword	0x2c6d4c0b3455abce
	.xword	0x5c33ef3c3098c1b8
	.xword	0xd0e88ed08bef4839
	.xword	0x688b6f76ee5c67f5
	.xword	0x16b9e64db9358a54
	.xword	0x9baaeb3a5e8ee3c1
	.xword	0x3e4824b4a376691a
	.xword	0xf8c4dbc3c7e1fd08



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
!!#   IJ_set_rvar ("diag.j", 107, rv_0, "{11}");
!!# 
!!#   IJ_set_rvar ("diag.j", 110, Rv_rand64, "64'hrrrr rrrr rrrr rrrr");
!!#   IJ_set_rvar ("diag.j", 111, Rv_Simm13, "13'b0 0000 00rr r000");
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
!!#         "20'b 0001 0000 rrrr 0000 0001,"
!!#         "20'{0}");
!!# 
!!#   ! Define address patterns for all the various address
!!#   ! spaces in JBI
!!# 
!!#   ! 80_1000_0000 - 80_FFFF_FFFF (Should not be 80_0*)
!!#   IJ_set_rvar ("diag.j", 149, Rv_jbiaddr_pattern0,
!!#         "24'{0},"
!!# 
!!#         "20'b 1000 0000 rrrr rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr r000,");
!!# 
!!#   ! 80_0E00_0000 - 80_0EFF_FFFF
!!#   IJ_set_rvar ("diag.j", 158, Rv_jbiaddr_pattern1,
!!#         "24'{0},"
!!# 
!!#         "20'b 1000 0000 0000 1110 rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr r000,");
!!# 
!!#   ! 80_0F00_0000 - 80_0FFF_FFFF
!!#   IJ_set_rvar ("diag.j", 168, Rv_jbiaddr_pattern2,
!!#         "24'{0},"
!!# 
!!#         "20'b 1000 0000 0000 1111 rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr r000,");
!!# 
!!#   ! C0_0000_0000 - CF_FFFF_FFFF
!!#   IJ_set_rvar ("diag.j", 178, Rv_jbiaddr_pattern3,
!!#         "24'{0},"
!!# 
!!#         "20'b 1100 rrrr rrrr rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr r000,");
!!# 
!!#   ! D0_0000_0000 - DF_FFFF_FFFF
!!#   IJ_set_rvar ("diag.j", 188, Rv_jbiaddr_pattern4,
!!#         "24'{0},"
!!# 
!!#         "20'b 1101 rrrr rrrr rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr r000,");
!!# 
!!#   ! E0_0000_0000 - EF_FFFF_FFFF
!!#   IJ_set_rvar ("diag.j", 198, Rv_jbiaddr_pattern5,
!!#         "24'{0},"
!!# 
!!#         "20'b 1110 rrrr rrrr rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr r000,");
!!# 
!!#   ! F0_0000_0000 - FE_FFFF_FFFF ( Should not be FF*)
!!#   IJ_set_rvar ("diag.j", 208, Rv_jbiaddr_pattern6,
!!#         "24'{0},"
!!# 
!!#         "20'b 1111 rrrr rrrr rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr r000,");
!!# 
!!#   ! FF_F000_0000 - FF_FFFF_FFFF 
!!#   IJ_set_rvar ("diag.j", 218, Rv_ssiaddr_pattern,
!!#         "24'{0},"
!!# 
!!#         "20'b 1111 1111 1111 rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr r000,");
!!# 
!!#   ! BYTE ALIGNED
!!# 
!!#   ! 80_1000_0000 - 80_FFFF_FFFF (Should not be 80_0*)
!!#   IJ_set_rvar ("diag.j", 229, Rv_jbi_b_addr_pattern0,
!!#         "24'{0},"
!!# 
!!#         "20'b 1000 0000 rrrr rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr rrrr,");
!!# 
!!#   ! 80_0E00_0000 - 80_0EFF_FFFF
!!#   IJ_set_rvar ("diag.j", 238, Rv_jbi_b_addr_pattern1,
!!#         "24'{0},"
!!# 
!!#         "20'b 1000 0000 0000 1110 rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr rrrr,");
!!# 
!!#   ! 80_0F00_0000 - 80_0FFF_FFFF
!!#   IJ_set_rvar ("diag.j", 248, Rv_jbi_b_addr_pattern2,
!!#         "24'{0},"
!!# 
!!#         "20'b 1000 0000 0000 1111 rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr rrrr,");
!!# 
!!#   ! C0_0000_0000 - CF_FFFF_FFFF
!!#   IJ_set_rvar ("diag.j", 258, Rv_jbi_b_addr_pattern3,
!!#         "24'{0},"
!!# 
!!#         "20'b 1100 rrrr rrrr rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr rrrr,");
!!# 
!!#   ! D0_0000_0000 - DF_FFFF_FFFF
!!#   IJ_set_rvar ("diag.j", 268, Rv_jbi_b_addr_pattern4,
!!#         "24'{0},"
!!# 
!!#         "20'b 1101 rrrr rrrr rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr rrrr,");
!!# 
!!#   ! E0_0000_0000 - EF_FFFF_FFFF
!!#   IJ_set_rvar ("diag.j", 278, Rv_jbi_b_addr_pattern5,
!!#         "24'{0},"
!!# 
!!#         "20'b 1110 rrrr rrrr rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr rrrr,");
!!# 
!!#   ! F0_0000_0000 - FE_FFFF_FFFF ( Should not be FF*)
!!#   IJ_set_rvar ("diag.j", 288, Rv_jbi_b_addr_pattern6,
!!#         "24'{0},"
!!# 
!!#         "20'b 1111 rrrr rrrr rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr rrrr,");
!!# 
!!#   ! FF_F000_0000 - FF_FFFF_FFFF 
!!#   IJ_set_rvar ("diag.j", 298, Rv_ssi_b_addr_pattern,
!!#         "24'{0},"
!!# 
!!#         "20'b 1111 1111 1111 rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr rrrr,");
!!# 
!!#   ! HWORD ADDRESS
!!# 
!!#   ! 80_1000_0000 - 80_FFFF_FFFF (Should not be 80_0*)
!!#   IJ_set_rvar ("diag.j", 310, Rv_jbi_h_addr_pattern0,
!!#         "24'{0},"
!!# 
!!#         "20'b 1000 0000 rrrr rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr rrr0,");
!!# 
!!#   ! 80_0E00_0000 - 80_0EFF_FFFF
!!#   IJ_set_rvar ("diag.j", 319, Rv_jbi_h_addr_pattern1,
!!#         "24'{0},"
!!# 
!!#         "20'b 1000 0000 0000 1110 rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr rrr0,");
!!# 
!!#   ! 80_0F00_0000 - 80_0FFF_FFFF
!!#   IJ_set_rvar ("diag.j", 329, Rv_jbi_h_addr_pattern2,
!!#         "24'{0},"
!!# 
!!#         "20'b 1000 0000 0000 1111 rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr rrr0,");
!!# 
!!#   ! C0_0000_0000 - CF_FFFF_FFFF
!!#   IJ_set_rvar ("diag.j", 339, Rv_jbi_h_addr_pattern3,
!!#         "24'{0},"
!!# 
!!#         "20'b 1100 rrrr rrrr rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr rrr0,");
!!# 
!!#   ! D0_0000_0000 - DF_FFFF_FFFF
!!#   IJ_set_rvar ("diag.j", 349, Rv_jbi_h_addr_pattern4,
!!#         "24'{0},"
!!# 
!!#         "20'b 1101 rrrr rrrr rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr rrr0,");
!!# 
!!#   ! E0_0000_0000 - EF_FFFF_FFFF
!!#   IJ_set_rvar ("diag.j", 359, Rv_jbi_h_addr_pattern5,
!!#         "24'{0},"
!!# 
!!#         "20'b 1110 rrrr rrrr rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr rrr0,");
!!# 
!!#   ! F0_0000_0000 - FE_FFFF_FFFF ( Should not be FF*)
!!#   IJ_set_rvar ("diag.j", 369, Rv_jbi_h_addr_pattern6,
!!#         "24'{0},"
!!# 
!!#         "20'b 1111 rrr0 rrrr rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr rrr0,");
!!# 
!!#   ! FF_F000_0000 - FF_FFFF_FFFF 
!!#   IJ_set_rvar ("diag.j", 379, Rv_ssi_h_addr_pattern,
!!#         "24'{0},"
!!# 
!!#         "20'b 1111 1111 1111 rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr rrr0,");
!!# 
!!#   ! WORD Address
!!# 
!!#   ! 80_1000_0000 - 80_FFFF_FFFF (Should not be 80_0*)
!!#   IJ_set_rvar ("diag.j", 390, Rv_jbi_w_addr_pattern0,
!!#         "24'{0},"
!!# 
!!#         "20'b 1000 0000 rrrr rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr rr00,");
!!# 
!!#   ! 80_0E00_0000 - 80_0EFF_FFFF
!!#   IJ_set_rvar ("diag.j", 399, Rv_jbi_w_addr_pattern1,
!!#         "24'{0},"
!!# 
!!#         "20'b 1000 0000 0000 1110 rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr rr00,");
!!# 
!!#   ! 80_0F00_0000 - 80_0FFF_FFFF
!!#   IJ_set_rvar ("diag.j", 409, Rv_jbi_w_addr_pattern2,
!!#         "24'{0},"
!!# 
!!#         "20'b 1000 0000 0000 1111 rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr rr00,");
!!# 
!!#   ! C0_0000_0000 - CF_FFFF_FFFF
!!#   IJ_set_rvar ("diag.j", 419, Rv_jbi_w_addr_pattern3,
!!#         "24'{0},"
!!# 
!!#         "20'b 1100 rrrr rrrr rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr rr00,");
!!# 
!!#   ! D0_0000_0000 - DF_FFFF_FFFF
!!#   IJ_set_rvar ("diag.j", 429, Rv_jbi_w_addr_pattern4,
!!#         "24'{0},"
!!# 
!!#         "20'b 1101 rrrr rrrr rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr rr00,");
!!# 
!!#   ! E0_0000_0000 - EF_FFFF_FFFF
!!#   IJ_set_rvar ("diag.j", 439, Rv_jbi_w_addr_pattern5,
!!#         "24'{0},"
!!# 
!!#         "20'b 1110 rrrr rrrr rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr rr00,");
!!# 
!!#   ! F0_0000_0000 - FE_FFFF_FFFF ( Should not be FF*)
!!#   IJ_set_rvar ("diag.j", 449, Rv_jbi_w_addr_pattern6,
!!#         "24'{0},"
!!# 
!!#         "20'b 1111 rrrr rrrr rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr rr00,");
!!# 
!!#   ! FF_F000_0000 - FF_FFFF_FFFF 
!!#   IJ_set_rvar ("diag.j", 459, Rv_ssi_w_addr_pattern,
!!#         "24'{0},"
!!# 
!!#         "20'b 1111 1111 1111 rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr rr00,");
!!# 
!!#   ! Other  cases ?? when LOW TH and HG TH are random, HI>LO always (TBD)
!!# 
!!#   IJ_set_rvar ("diag.j", 468, Rv_jbi_fifo_wr0_config,
!!#         "24'{0},"
!!# 
!!#         "20'b 0000 0000 0rrr 0rrr 00rr,"
!!#         "20'b 00rr rrrr 0000 0000 rrrr,");
!!# 
!!#   IJ_set_rvar ("diag.j", 476, Rv_jbi_fifo_wr1_config,
!!#         "24'{0},"
!!# 
!!#         "20'b 0000 0000 0rrr 0rrr 00rr,"
!!#         "20'b 00rr rrrr 1rrr 0000 rrrr,");
!!# 
!!#   IJ_set_ropr_fld    ("diag.j", 484, ijdefault, Ft_Rs1, "{6}");  ! BASE
!!#   IJ_set_ropr_fld    ("diag.j", 485, ijdefault, Ft_Rs2, "{8}");
!!#   IJ_set_ropr_fld    ("diag.j", 486, ijdefault, Ft_Rd, "{16..23}");
!!#   IJ_set_ropr_fld    ("diag.j", 487, Rv_ldstD, Ft_Rd, "{16,18,20,22}");
!!#   IJ_set_ropr_fld    ("diag.j", 488, ijdefault, Ft_Imm_Asi, "{16,17}");
!!# 
!!#   !IJ_set_ropr_fld    (ijdefault, Ft_Simm13, "13'b0 0000 0000 0000");
!!#   IJ_set_ropr_fld    ("diag.j", 493, ijdefault, Ft_Simm13, "13'b0 0000 rrrr r000");
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
!!#   IJ_init_regs_by_setx ("diag.j", 521, th_M, 3, 1, Rv_rand64);
!!# 
!!#   IJ_printf ("diag.j", 525, th_M, "\tmov\t0, %%r8\n");
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
!!# 
!!#   IJ_printf ("diag.j", 554, sjm_4, "\n\nBA LABEL_0\n");
!!#   IJ_printf ("diag.j", 555, sjm_5, "\n\nBA LABEL_0\n");
!!#   int i,j;
!!#   ! Do this else midas wont put any tsbs for the above.
!!#   for (i = 0; i < 16; i++) {
!!#     IJ_iseg_printf("diag.j", 559,ISEG, i, th_M, ".data\n");
!!#     for (j = 0; j < 256; j++) {
!!#     IJ_iseg_printf("diag.j", 561,ISEG, i, th_M, "\t.xword\t0x%016llrx\n", Rv_rand64);
!!#     }
!!#   }
!!# 
!!#   IJ_th_start ("diag.j", 566,Seq_Start, NULL, 2);
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
!!# 		IJ_generate ("diag.j", 694, th_M, $2);
!!# 	}
!!# ;
!!# 
!!# inst_type: set_reg9 set_addr load alu store sjm4 sjm5
!!# !inst_type: set_reg9 set_addr load atomics alu store atomics_asi barier
!!# {
!!# 		IJ_generate ("diag.j", 701, th_M, $3);
!!# 		IJ_generate ("diag.j", 702, th_M, $4);
!!# 		IJ_generate ("diag.j", 703, th_M, $5);
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
!!#                    IJ_printf ("diag.j", 721, sjm_4, "\n");
!!#                      sjm4_cnt++;
!!# 
!!#                      sj4_ad =  IJ_get_rvar_val64("diag.j", 724, Rv_memaddr_pattern_dma);
!!#                      sjm0_addr[sjm_wr0] = sj4_ad; 
!!#                      IJ_printf ("diag.j", 726, sjm_4, "WRITEBLK  0x%016llx +\n",sj4_ad);
!!#                      IJ_update_rvar("diag.j", 727, Rv_memaddr_pattern_dma);
!!# 
!!#                       for (i=0;i<16;i++) { 
!!#                          !IJ_printf (sjm_4, "# debug %d \n",i);
!!#                          sjm0_data[sjm_wr0][i] = IJ_get_rvar_val32("diag.j", 731, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 732, Rv_rand32);
!!#                          if (i%4 == 0) {IJ_printf ("diag.j", 733, sjm_4, "        "); }
!!#                          IJ_printf ("diag.j", 734, sjm_4, "0x%08x ",sjm0_data[sjm_wr0][i]);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 736, sjm_4, "\n"); else 
!!#                             IJ_printf ("diag.j", 737, sjm_4, "+\n");
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
!!#                    IJ_printf ("diag.j", 750, sjm_4, "\n");
!!#                      sjm4_cnt--;
!!# 
!!#                      sj4_ad = sjm0_addr[sjm_rd0];
!!#                      IJ_printf ("diag.j", 755, sjm_4, "READBLK  0x%016llx +\n",sj4_ad);
!!# 
!!#                       for (i=0;i<16;i++) { 
!!#                          sjm4_dat = sjm0_data[sjm_rd0][i];
!!#                          if (i%4 == 0) IJ_printf ("diag.j", 759, sjm_4, "        ");
!!#                          IJ_printf ("diag.j", 760, sjm_4, "0x%08x ",sjm4_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 762, sjm_4, "\n"); else 
!!#                             IJ_printf ("diag.j", 763, sjm_4, "+\n");
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
!!#                    IJ_printf ("diag.j", 777, sjm_4, "\n");
!!#                      !sjm4_cnt--;
!!# 
!!#  		     sjm0_w_mask =  IJ_get_rvar_val32("diag.j", 781, Rv_rand_mask);
!!#                      IJ_update_rvar("diag.j", 782, Rv_rand_mask);
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
!!#                      IJ_printf ("diag.j", 799, sjm_4, "WRITEMSK  0x%016llx 0x%016llx +\n",sj4_ad,mask);
!!# 
!!#                       m_tmp = sjm0_w_mask;
!!#                       for (i=0;i<16;i++) { 
!!#                        if (m_tmp & 0x1 ) {
!!#                          sjm0_data[sjm_rd0][i] = IJ_get_rvar_val32("diag.j", 804, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 805, Rv_rand32);
!!#                          sjm4_dat = sjm0_data[sjm_rd0][i];
!!#                          if (i%4 == 0) IJ_printf ("diag.j", 807, sjm_4, "        ");
!!#                          IJ_printf ("diag.j", 808, sjm_4, "0x%08x ",sjm4_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 810, sjm_4, "\n"); else 
!!#                             IJ_printf ("diag.j", 811, sjm_4, "+\n");
!!#                            }
!!#                         } else {
!!#                          !sjm4_dat = sjm0_data[sjm_rd0][i];
!!#                          sjm4_dat = 0;
!!#                          if (i%4 == 0) IJ_printf ("diag.j", 816, sjm_4, "        ");
!!#                          IJ_printf ("diag.j", 817, sjm_4, "0x%08x ",sjm4_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 819, sjm_4, "\n"); else 
!!#                             IJ_printf ("diag.j", 820, sjm_4, "+\n");
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
!!#                    IJ_printf ("diag.j", 837, sjm_4, "\n");
!!#                      sjm4_cnt_io++;
!!# 
!!#                      sj4_ad =  IJ_get_rvar_val64("diag.j", 840, Rv_memaddr_pattern_io);
!!#                      sjm0_addr_io[sjm_wr0_io] = sj4_ad; 
!!#                      IJ_printf ("diag.j", 842, sjm_4, "WRITEBLKIO  0x%016llx +\n",sj4_ad);
!!#                      IJ_update_rvar("diag.j", 843, Rv_memaddr_pattern_io);
!!# 
!!#                       for (i=0;i<16;i++) { 
!!#                          !IJ_printf (sjm_4, "# debug %d \n",i);
!!#                          sjm0_data_io[sjm_wr0_io][i] = IJ_get_rvar_val32("diag.j", 847, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 848, Rv_rand32);
!!#                          if (i%4 == 0) {IJ_printf ("diag.j", 849, sjm_4, "        "); }
!!#                          IJ_printf ("diag.j", 850, sjm_4, "0x%08x ",sjm0_data_io[sjm_wr0_io][i]);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 852, sjm_4, "\n"); else 
!!#                             IJ_printf ("diag.j", 853, sjm_4, "+\n");
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
!!#                    IJ_printf ("diag.j", 866, sjm_4, "\n");
!!#                      sjm4_cnt_io--;
!!# 
!!#                      sj4_ad = sjm0_addr_io[sjm_rd0_io];
!!#                      IJ_printf ("diag.j", 871, sjm_4, "READBLKIO  0x%016llx +\n",sj4_ad);
!!# 
!!#                       for (i=0;i<16;i++) { 
!!#                          sjm4_dat = sjm0_data_io[sjm_rd0_io][i];
!!#                          if (i%4 == 0) IJ_printf ("diag.j", 875, sjm_4, "        ");
!!#                          IJ_printf ("diag.j", 876, sjm_4, "0x%08x ",sjm4_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 878, sjm_4, "\n"); else 
!!#                             IJ_printf ("diag.j", 879, sjm_4, "+\n");
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
!!#                    IJ_printf ("diag.j", 894, sjm_4, "\n");
!!#                      sjm4_cnt_io1++;
!!# 
!!#                      sj4_ad =  IJ_get_rvar_val64("diag.j", 897, Rv_memaddr_pattern_io);
!!#                      sjm0_addr_io1[sjm_wr0_io1] = sj4_ad; 
!!#                      IJ_printf ("diag.j", 899, sjm_4, "WRITEIO  0x%016llx ",sj4_ad);
!!#                      IJ_update_rvar("diag.j", 900, Rv_memaddr_pattern_io);
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
!!#                       IJ_printf ("diag.j", 915, sjm_4, "%d ",b_sz);
!!#                       for (i=0;i<4;i++) { 
!!#                          !IJ_printf (sjm_4, "# debug %d \n",i);
!!#                          sjm0_data_io1[sjm_wr0_io1][i] = IJ_get_rvar_val32("diag.j", 918, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 919, Rv_rand32);
!!#                          IJ_printf ("diag.j", 920, sjm_4, "0x%08x ",sjm0_data_io1[sjm_wr0_io1][i]);
!!#                          if((i==0) && ((b_sz == 1) | (b_sz == 2) | (b_sz == 4)) ) break; 
!!#                          if((i==1) && (b_sz == 8)) break; 
!!#                       }
!!#                       if ( random()%2 == 0) {
!!#                       IJ_printf ("diag.j", 925, sjm_4, "\n");
!!#                       } else {
!!#                       IJ_printf ("diag.j", 927, sjm_4, "\n");
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
!!#                    IJ_printf ("diag.j", 941, sjm_4, "\n");
!!#                      sjm4_cnt_io1--;
!!# 
!!#                      sj4_ad = sjm0_addr_io1[sjm_rd0_io1];
!!#                      b_sz   = sjm0_data_io1[sjm_rd0_io1][15];
!!#                      IJ_printf ("diag.j", 947, sjm_4, "READIO  0x%016llx %d ",sj4_ad,b_sz);
!!# 
!!#                       for (i=0;i<4;i++) {
!!#                          sjm4_dat = sjm0_data_io1[sjm_rd0_io1][i];
!!#                          IJ_printf ("diag.j", 951, sjm_4, "0x%08x ",sjm4_dat);
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
!!#                    IJ_printf ("diag.j", 966, sjm_4, "\n");
!!# 
!!#                      sj4_ad =  IJ_get_rvar_val64("diag.j", 968, Rv_memaddr_pattern_io);
!!#                      sjm0_addr_m_io[sjm_wr0_m_io] = sj4_ad; 
!!#                      IJ_update_rvar("diag.j", 970, Rv_memaddr_pattern_io);
!!# 
!!#                      sjm4_cnt_m_io++;
!!# 
!!#  		     sjm0_w_mask_m_io =  IJ_get_rvar_val32("diag.j", 976, Rv_rand_mask);
!!#                      IJ_update_rvar("diag.j", 977, Rv_rand_mask);
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
!!#                      IJ_printf ("diag.j", 1004, sjm_4, "WRITEMSKIO  0x%016llx 0x%04x  ",sj4_ad,mask);
!!#                      sjm0_data_m_io[sjm_wr0_m_io][15] = mask; ! data fifo , 15 stores address
!!# 
!!#                       m_tmp = sjm0_w_mask_m_io & 0xf;
!!#                       for (i=0;i<4;i++) { 
!!#                        if (m_tmp & 0x1 ) {
!!#                          sjm0_data_m_io[sjm_wr0_m_io][i] = IJ_get_rvar_val32("diag.j", 1010, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 1011, Rv_rand32);
!!#                          sjm4_dat = sjm0_data_m_io[sjm_wr0_m_io][i];
!!#                          !if (i%4 == 0) IJ_printf (sjm_4, "        ");
!!#                          IJ_printf ("diag.j", 1014, sjm_4, "0x%08x ",sjm4_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                              IJ_printf ("diag.j", 1016, sjm_4, "\n"); 
!!#                             !if (i==15 ) IJ_printf (sjm_4, "\n"); else 
!!#                             !IJ_printf (sjm_4, "+\n");
!!#                            }
!!#                         } else {
!!#                          !sjm4_dat = sjm0_data[sjm_rd0][i];
!!#                          sjm4_dat = 0;
!!#                          sjm0_data_m_io[sjm_wr0_m_io][i] = sjm4_dat;
!!#                          !if (i%4 == 0) IJ_printf (sjm_4, "        ");
!!#                          IJ_printf ("diag.j", 1025, sjm_4, "0x%08x ",sjm4_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             IJ_printf ("diag.j", 1027, sjm_4, "\n"); 
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
!!#                    IJ_printf ("diag.j", 1045, sjm_4, "\n");
!!#                      sjm4_cnt_m_io--;
!!# 
!!#                      sj4_ad = sjm0_addr_m_io[sjm_rd0_m_io];
!!#                      mask   = sjm0_data_m_io[sjm_rd0_m_io][15];
!!#                      IJ_printf ("diag.j", 1051, sjm_4, "READMSKIO   0x%016llx 0x%04llx  ",sj4_ad,mask);
!!# 
!!#                       for (i=0;i<4;i++) { 
!!#                          sjm4_dat = sjm0_data_m_io[sjm_rd0_m_io][i];
!!#                          !if (i%4 == 0) IJ_printf (sjm_4, "        ");
!!#                          IJ_printf ("diag.j", 1056, sjm_4, "0x%08x ",sjm4_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             IJ_printf ("diag.j", 1058, sjm_4, "\n");
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
!!#                    IJ_printf ("diag.j", 1076, sjm_5, "\n");
!!#                      sjm5_cnt++;
!!# 
!!#                      sj5_ad =  IJ_get_rvar_val64("diag.j", 1079, Rv_memaddr_pattern_dma);
!!#                      sjm1_addr[sjm_wr1] = sj5_ad; 
!!#                      IJ_printf ("diag.j", 1081, sjm_5, "WRITEBLK  0x%016llx +\n",sj5_ad);
!!#                      IJ_update_rvar("diag.j", 1082, Rv_memaddr_pattern_dma);
!!# 
!!#                       for (i=0;i<16;i++) { 
!!#                          sjm1_data[sjm_wr1][i] = IJ_get_rvar_val32("diag.j", 1085, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 1086, Rv_rand32);
!!#                          if (i%4 == 0) IJ_printf ("diag.j", 1087, sjm_5, "        ");
!!#                          IJ_printf ("diag.j", 1088, sjm_5, "0x%08x ",sjm1_data[sjm_wr1][i]);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 1090, sjm_5, "\n"); else 
!!#                             IJ_printf ("diag.j", 1091, sjm_5, "+\n");
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
!!#                    IJ_printf ("diag.j", 1104, sjm_5, "\n");
!!#                      sjm5_cnt--;
!!# 
!!#                      sj5_ad = sjm1_addr[sjm_rd1];
!!#                      IJ_printf ("diag.j", 1109, sjm_5, "READBLK  0x%016llx +\n",sj5_ad);
!!# 
!!#                       for (i=0;i<16;i++) { 
!!#                          sjm5_dat = sjm1_data[sjm_rd1][i];
!!#                          if (i%4 == 0) IJ_printf ("diag.j", 1113, sjm_5, "        ");
!!#                          IJ_printf ("diag.j", 1114, sjm_5, "0x%08x ",sjm5_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 1116, sjm_5, "\n"); else 
!!#                             IJ_printf ("diag.j", 1117, sjm_5, "+\n");
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
!!#                    IJ_printf ("diag.j", 1131, sjm_5, "\n");
!!#                      !sjm4_cnt--;
!!# 
!!#  		     sjm1_w_mask =  IJ_get_rvar_val32("diag.j", 1135, Rv_rand_mask);
!!#                      IJ_update_rvar("diag.j", 1136, Rv_rand_mask);
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
!!#                      IJ_printf ("diag.j", 1153, sjm_5, "WRITEMSK  0x%016llx 0x%016llx +\n",sj5_ad,mask);
!!# 
!!#                       m_tmp = sjm1_w_mask;
!!#                       for (i=0;i<16;i++) { 
!!#                        if (m_tmp & 0x1 ) {
!!#                          sjm1_data[sjm_rd1][i] = IJ_get_rvar_val32("diag.j", 1158, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 1159, Rv_rand32);
!!#                          sjm5_dat = sjm1_data[sjm_rd1][i];
!!#                          if (i%4 == 0) IJ_printf ("diag.j", 1161, sjm_5, "        ");
!!#                          IJ_printf ("diag.j", 1162, sjm_5, "0x%08x ",sjm5_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 1164, sjm_5, "\n"); else 
!!#                             IJ_printf ("diag.j", 1165, sjm_5, "+\n");
!!#                            }
!!#                         } else {
!!#                          !sjm5_dat = sjm1_data[sjm_rd1][i];
!!#                          sjm5_dat = 0;
!!#                          if (i%4 == 0) IJ_printf ("diag.j", 1170, sjm_5, "        ");
!!#                          IJ_printf ("diag.j", 1171, sjm_5, "0x%08x ",sjm5_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 1173, sjm_5, "\n"); else 
!!#                             IJ_printf ("diag.j", 1174, sjm_5, "+\n");
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
!!#                    IJ_printf ("diag.j", 1191, sjm_5, "\n");
!!#                      sjm5_cnt_io++;
!!# 
!!#                      sj5_ad =  IJ_get_rvar_val64("diag.j", 1194, Rv_memaddr_pattern_io);
!!#                      sjm1_addr_io[sjm_wr1_io] = sj5_ad; 
!!#                      IJ_printf ("diag.j", 1196, sjm_5, "WRITEBLKIO  0x%016llx +\n",sj5_ad);
!!#                      IJ_update_rvar("diag.j", 1197, Rv_memaddr_pattern_io);
!!# 
!!#                       for (i=0;i<16;i++) { 
!!#                          !IJ_printf (sjm_5, "# debug %d \n",i);
!!#                          sjm1_data_io[sjm_wr1_io][i] = IJ_get_rvar_val32("diag.j", 1201, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 1202, Rv_rand32);
!!#                          if (i%4 == 0) {IJ_printf ("diag.j", 1203, sjm_5, "        "); }
!!#                          IJ_printf ("diag.j", 1204, sjm_5, "0x%08x ",sjm1_data_io[sjm_wr1_io][i]);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 1206, sjm_5, "\n"); else 
!!#                             IJ_printf ("diag.j", 1207, sjm_5, "+\n");
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
!!#                    IJ_printf ("diag.j", 1220, sjm_5, "\n");
!!#                      sjm5_cnt_io--;
!!# 
!!#                      sj5_ad = sjm1_addr_io[sjm_rd1_io];
!!#                      IJ_printf ("diag.j", 1225, sjm_5, "READBLKIO  0x%016llx +\n",sj5_ad);
!!# 
!!#                       for (i=0;i<16;i++) { 
!!#                          sjm5_dat = sjm1_data_io[sjm_rd1_io][i];
!!#                          if (i%4 == 0) IJ_printf ("diag.j", 1229, sjm_5, "        ");
!!#                          IJ_printf ("diag.j", 1230, sjm_5, "0x%08x ",sjm5_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 1232, sjm_5, "\n"); else 
!!#                             IJ_printf ("diag.j", 1233, sjm_5, "+\n");
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
!!#                    IJ_printf ("diag.j", 1249, sjm_5, "\n");
!!#                      sjm5_cnt_io1++;
!!# 
!!#                      sj5_ad =  IJ_get_rvar_val64("diag.j", 1252, Rv_memaddr_pattern_io);
!!#                      sjm1_addr_io1[sjm_wr1_io1] = sj5_ad; 
!!#                      IJ_printf ("diag.j", 1254, sjm_5, "WRITEIO  0x%016llx ",sj5_ad);
!!#                      IJ_update_rvar("diag.j", 1255, Rv_memaddr_pattern_io);
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
!!#                       IJ_printf ("diag.j", 1270, sjm_5, "%d ",b_sz);
!!#                       for (i=0;i<4;i++) { 
!!#                          !IJ_printf (sjm_5, "# debug %d \n",i);
!!#                          sjm1_data_io1[sjm_wr1_io1][i] = IJ_get_rvar_val32("diag.j", 1273, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 1274, Rv_rand32);
!!#                          IJ_printf ("diag.j", 1275, sjm_5, "0x%08x ",sjm1_data_io1[sjm_wr1_io1][i]);
!!#                          if((i==0) && ((b_sz == 1) | (b_sz == 2) | (b_sz == 4)) ) break; 
!!#                          if((i==1) && (b_sz == 8)) break; 
!!#                       }
!!#                       if ( random()%2 == 0) {
!!#                       IJ_printf ("diag.j", 1280, sjm_5, "\n");
!!#                       } else {
!!#                       IJ_printf ("diag.j", 1282, sjm_5, "\n");
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
!!#                    IJ_printf ("diag.j", 1296, sjm_5, "\n");
!!#                      sjm5_cnt_io1--;
!!# 
!!#                      sj5_ad = sjm1_addr_io1[sjm_rd1_io1];
!!#                      b_sz   = sjm1_data_io1[sjm_rd1_io1][15];
!!#                      IJ_printf ("diag.j", 1302, sjm_5, "READIO  0x%016llx %d ",sj5_ad,b_sz);
!!# 
!!#                       for (i=0;i<4;i++) {
!!#                          sjm5_dat = sjm1_data_io1[sjm_rd1_io1][i];
!!#                          IJ_printf ("diag.j", 1306, sjm_5, "0x%08x ",sjm5_dat);
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
!!#                    IJ_printf ("diag.j", 1321, sjm_5, "\n");
!!# 
!!#                      sj5_ad =  IJ_get_rvar_val64("diag.j", 1323, Rv_memaddr_pattern_io);
!!#                      sjm1_addr_m_io[sjm_wr1_m_io] = sj5_ad; 
!!#                      IJ_update_rvar("diag.j", 1325, Rv_memaddr_pattern_io);
!!# 
!!#                      sjm5_cnt_m_io++;
!!# 
!!#  		     sjm1_w_mask_m_io =  IJ_get_rvar_val32("diag.j", 1331, Rv_rand_mask);
!!#                      IJ_update_rvar("diag.j", 1332, Rv_rand_mask);
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
!!#                      IJ_printf ("diag.j", 1359, sjm_5, "WRITEMSKIO  0x%016llx 0x%04x  ",sj5_ad,mask);
!!#                      sjm1_data_m_io[sjm_wr1_m_io][15] = mask; ! data fifo , 15 stores address
!!# 
!!#                       m_tmp = sjm1_w_mask_m_io & 0xf;
!!#                       for (i=0;i<4;i++) { 
!!#                        if (m_tmp & 0x1 ) {
!!#                          sjm1_data_m_io[sjm_wr1_m_io][i] = IJ_get_rvar_val32("diag.j", 1365, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 1366, Rv_rand32);
!!#                          sjm5_dat = sjm1_data_m_io[sjm_wr1_m_io][i];
!!#                          !if (i%4 == 0) IJ_printf (sjm_5, "        ");
!!#                          IJ_printf ("diag.j", 1369, sjm_5, "0x%08x ",sjm5_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                              IJ_printf ("diag.j", 1371, sjm_5, "\n"); 
!!#                             !if (i==15 ) IJ_printf (sjm_5, "\n"); else 
!!#                             !IJ_printf (sjm_5, "+\n");
!!#                            }
!!#                         } else {
!!#                          !sjm5_dat = sjm1_data[sjm_rd1][i];
!!#                          sjm5_dat = 0;
!!#                          sjm1_data_m_io[sjm_wr1_m_io][i] = sjm5_dat;
!!#                          !if (i%4 == 0) IJ_printf (sjm_5, "        ");
!!#                          IJ_printf ("diag.j", 1380, sjm_5, "0x%08x ",sjm5_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             IJ_printf ("diag.j", 1382, sjm_5, "\n"); 
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
!!#                    IJ_printf ("diag.j", 1400, sjm_5, "\n");
!!#                      sjm5_cnt_m_io--;
!!# 
!!#                      sj5_ad = sjm1_addr_m_io[sjm_rd1_m_io];
!!#                      mask   = sjm1_data_m_io[sjm_rd1_m_io][15];
!!#                      IJ_printf ("diag.j", 1406, sjm_5, "READMSKIO   0x%016llx 0x%04llx  ",sj5_ad,mask);
!!# 
!!#                       for (i=0;i<4;i++) { 
!!#                          sjm5_dat = sjm1_data_m_io[sjm_rd1_m_io][i];
!!#                          !if (i%4 == 0) IJ_printf (sjm_5, "        ");
!!#                          IJ_printf ("diag.j", 1411, sjm_5, "0x%08x ",sjm5_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             IJ_printf ("diag.j", 1413, sjm_5, "\n");
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
!!#                         jbi_config = IJ_get_rvar_val64("diag.j", 1441, Rv_jbi_fifo_wr0_config);
!!# 			IJ_update_rvar("diag.j", 1442, Rv_jbi_fifo_wr0_config);
!!#                         } else {
!!#                         jbi_config = IJ_get_rvar_val64("diag.j", 1444, Rv_jbi_fifo_wr1_config);
!!# 			IJ_update_rvar("diag.j", 1445, Rv_jbi_fifo_wr1_config);
!!#                         }
!!#                         if (((jbi_config>>24) & 0x7) < ((jbi_config>>28) & 0x7)) {
!!#                         invalid_config = 0;
!!#                          }
!!#                         } config_cnt++;
!!# 
!!#                         if (fr_done == 0) {
!!#                          fr_done = 1;
!!#                         IJ_printf ("diag.j", 1455, th_M, "\tsetx\t0x%016llx, %%r1, %%r9\n",
!!#                                 jbi_config);
!!#                         IJ_printf ("diag.j", 1457, th_M, "\tsetx\t0x8000000008, %%r1, %%r10\n");
!!#                         IJ_printf ("diag.j", 1458, th_M, "\tstx\t%%r9, [%%r10]\n");
!!#                         IJ_printf ("diag.j", 1459, th_M, "\n\n\n");
!!#                         IJ_printf ("diag.j", 1460, th_M, "!***********************************************************************\n");
!!#                         IJ_printf ("diag.j", 1461, th_M, "!IOSYNC cycles to start sjm\n");
!!#                         IJ_printf ("diag.j", 1462, th_M, "!***********************************************************************\n");
!!#                         IJ_printf ("diag.j", 1463, th_M, "\tsetx 0xdeadbeefdeadbeef, %%g1, %%g2\n");
!!#                         IJ_printf ("diag.j", 1464, th_M, "\tsetx 0xcf00beef00, %%g1, %%g3\n");
!!#                         IJ_printf ("diag.j", 1465, th_M, "\tstx %%g2, [%%g3]\n");
!!#                         IJ_printf ("diag.j", 1466, th_M, "!***********************************************************************\n");
!!#                         IJ_printf ("diag.j", 1467, th_M, "!IOSYNC cycles to start sjm\n");
!!#                         IJ_printf ("diag.j", 1468, th_M, "!***********************************************************************\n");
!!#                         IJ_printf ("diag.j", 1469, th_M, "\tsetx 0xdeadbeefdeadbeef, %%g1, %%g2\n");
!!#                         IJ_printf ("diag.j", 1470, th_M, "\tsetx 0xef00beef00, %%g1, %%g3\n");
!!#                         IJ_printf ("diag.j", 1471, th_M, "\tstx %%g2, [%%g3]\n");
!!#                         IJ_printf ("diag.j", 1472, th_M, "\n\n\n");
!!# 
!!#                         }
!!# 
!!#                         mem_ad = IJ_get_rvar_val64("diag.j", 1476, Rv_memaddr_pattern);
!!#                         IJ_update_rvar("diag.j", 1477, Rv_memaddr_pattern);
!!# 
!!#                         jbi0 = IJ_get_rvar_val64("diag.j", 1479, Rv_jbi_w_addr_pattern0);
!!# 
!!#                         ! to remove address not in dma-fake range
!!#                         while (jbi0 < 550024249344 ) {
!!#                         jbi0 = IJ_get_rvar_val64("diag.j", 1484, Rv_jbi_w_addr_pattern0);
!!# 			IJ_update_rvar("diag.j", 1485, Rv_jbi_w_addr_pattern0);
!!#                         }
!!# 
!!#                         jbi1 = IJ_get_rvar_val64("diag.j", 1488, Rv_jbi_w_addr_pattern1);
!!#                         jbi2 = IJ_get_rvar_val64("diag.j", 1489, Rv_jbi_w_addr_pattern2);
!!#                         jbi3 = IJ_get_rvar_val64("diag.j", 1490, Rv_jbi_w_addr_pattern3);
!!#                         jbi4 = IJ_get_rvar_val64("diag.j", 1491, Rv_jbi_w_addr_pattern4);
!!#                         jbi5 = IJ_get_rvar_val64("diag.j", 1492, Rv_jbi_w_addr_pattern5);
!!# 
!!#                         jbi6 = IJ_get_rvar_val64("diag.j", 1494, Rv_jbi_w_addr_pattern6);
!!#                         ! to remove address not in dma-fake range
!!#                         while (jbi6 > 1095216660479)  {
!!#                         jbi6 = IJ_get_rvar_val64("diag.j", 1497, Rv_jbi_w_addr_pattern6);
!!# 			IJ_update_rvar("diag.j", 1498, Rv_jbi_w_addr_pattern6);
!!#                         }
!!# 
!!# 			IJ_update_rvar("diag.j", 1501, Rv_jbi_w_addr_pattern0);
!!# 			IJ_update_rvar("diag.j", 1502, Rv_jbi_w_addr_pattern1);
!!# 			IJ_update_rvar("diag.j", 1503, Rv_jbi_w_addr_pattern2);
!!# 			IJ_update_rvar("diag.j", 1504, Rv_jbi_w_addr_pattern3);
!!# 			IJ_update_rvar("diag.j", 1505, Rv_jbi_w_addr_pattern4);
!!# 			IJ_update_rvar("diag.j", 1506, Rv_jbi_w_addr_pattern5);
!!# 			IJ_update_rvar("diag.j", 1507, Rv_jbi_w_addr_pattern6);
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
!!#                         w_ADDR_ARRAY[w_a_wr_cntr] = jbi0; w_a_wr_cntr = w_a_wr_cntr + 1; ! store the stx address
!!#                         w_ADDR_ARRAY[w_a_wr_cntr] = jbi1; w_a_wr_cntr = w_a_wr_cntr + 1; ! store the stx address
!!#                         w_ADDR_ARRAY[w_a_wr_cntr] = jbi2; w_a_wr_cntr = w_a_wr_cntr + 1; ! store the stx address
!!#                         w_ADDR_ARRAY[w_a_wr_cntr] = jbi3; w_a_wr_cntr = w_a_wr_cntr + 1; ! store the stx address
!!#                         w_ADDR_ARRAY[w_a_wr_cntr] = jbi4; w_a_wr_cntr = w_a_wr_cntr + 1; ! store the stx address
!!#                         w_ADDR_ARRAY[w_a_wr_cntr] = jbi5; w_a_wr_cntr = w_a_wr_cntr + 1; ! store the stx address
!!#                         w_ADDR_ARRAY[w_a_wr_cntr] = jbi6; w_a_wr_cntr = w_a_wr_cntr + 1; ! store the stx address
!!# 
!!#                         for (i=0;i<7;i++) {
!!#                         w_DATA_ARRAY[w_wr_cntr] = IJ_get_rvar_val64("diag.j", 1533, Rv_rand64);
!!# 			IJ_update_rvar("diag.j", 1534, Rv_rand64);
!!#                         data_st = w_DATA_ARRAY[w_wr_cntr];
!!#                         addr_st = w_ADDR_ARRAY[w_a_wr_cntr -7 + i];
!!#                         IJ_printf ("diag.j", 1537, th_M, "\tsetx\t0x%016llx, %%r1, %%r6\n",
!!#                                 addr_st);
!!#                         IJ_printf ("diag.j", 1539, th_M, "\tsetx\t0x%016llx, %%r1, %%r10\n",
!!#                                 data_st);
!!#                         IJ_printf ("diag.j", 1541, th_M, "\tsth\t%%r10, [%%r6]\n");
!!# 
!!#  			! cache able store and load to main memory 
!!#                         if(random()%4 == 0) {
!!#                         IJ_printf ("diag.j", 1545, th_M, "\tsetx\t0x%016llx, %%r1, %%r6\n",
!!#                                 mem_ad);
!!#                         IJ_printf ("diag.j", 1547, th_M, "\tsetx\t0x%016llx, %%r1, %%r10\n",
!!#                                 data_st);
!!#                         if(random()%2) {
!!#                         IJ_printf ("diag.j", 1550, th_M, "\tstx\t%%r10, [%%r6]\n");
!!#                         } else {
!!#                         IJ_printf ("diag.j", 1552, th_M, "\tldx\t[%%r6], %%r10\n"); 
!!#                         }
!!#                         mem_ad = IJ_get_rvar_val64("diag.j", 1554, Rv_memaddr_pattern);
!!#                         IJ_update_rvar("diag.j", 1555, Rv_memaddr_pattern);
!!#                         }
!!# 
!!#                         w_wr_cntr++;
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
!!#                         if(w_a_wr_cntr >= 10 ) {
!!#                         while (a_addr_sel + 9 >= w_a_wr_cntr ) {
!!#                         a_addr_sel = random() %500;
!!# 	                !IJ_printf (th_M, "!DEBUG 3: a_addr_sel =  0x%016llx, a_wr_cntr = %d\n", a_addr_sel, a_wr_cntr); 
!!#                          }
!!#                         rnd_cnt = random() % 8; ! 4 ld(.) from random loc which is already stored
!!# 	                !IJ_printf (th_M, "!DEBUG 4: rnd_cnt =  0x%016llx, h_a_wr_cntr= %d,a_addr_sel= %d\n", rnd_cnt,h_a_wr_cntr,a_addr_sel); 
!!#                         while(rnd_cnt > 0 ) {
!!#                         IJ_printf ("diag.j", 1589, th_M, "\tsetx\t0x%016llx, %%r1, %%r12\n",
!!#                                 w_ADDR_ARRAY[rnd_cnt+a_addr_sel]);
!!#                         IJ_printf ("diag.j", 1591, th_M, "\tlduh\t[%%r12], %%r11\n");
!!#                         !data_ld = w_DATA_ARRAY[rnd_cnt+a_addr_sel];
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
