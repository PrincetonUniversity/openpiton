// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: pio_rnd_basic3_1b_rand_0.s
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
   random seed:	350497639
   Jal pio_rnd_basic3_1b.j:	
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
loop0:	
	ldub	[%l1 + 0x7f], %l3
        deccc   %l2
	bnz	loop0
	nop
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
!!setx 0xdeadbeefdeadbeef, %g1, %g2
!!setx 0xcf00beef00, %g1, %g3
!!stx %g2, [%g3]
!!=====================
!!setx 0xdeadbeefdeadbeef, %g1, %g2
!!setx 0xef00beef00, %g1, %g3
!!stx %g2, [%g3]
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

	setx	0x0000000060304d00, %r1, %r9
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



	setx	0x000000808d432eab, %r1, %r9
	setx	0xb071aa2e0eedf2f5, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e23dddb, %r1, %r9
	setx	0xc7af9a64ae05571e, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800fd3a286, %r1, %r9
	setx	0x0d179996978589e9, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000cd8fa49282, %r1, %r9
	setx	0xac16dfa1152835cb, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000dd9959d0b2, %r1, %r9
	setx	0xa276f19a71a64a4c, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ea3ae54b09, %r1, %r9
	setx	0x109b16686196d7e0, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f76457abae, %r1, %r9
	setx	0xd8ed4553cbb795b8, %r1, %r10
	stb	%r10, [%r9]
	setx	0x00000080f0896fd1, %r1, %r9
	setx	0x618acf125cb04cc6, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e69e5b5, %r1, %r9
	setx	0x22e69367109acc8f, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f8df070, %r1, %r9
	setx	0xc5ae7a912199207b, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c052d7e1a0, %r1, %r9
	setx	0xc9e1638cee50049d, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d57d90f789, %r1, %r9
	setx	0xeede56b144ae7ea7, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e922fac2f4, %r1, %r9
	setx	0x1379eba5fe77a544, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f58bdcb831, %r1, %r9
	setx	0x7ea65fa19bb17623, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ea3ae54b09, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000dd9959d0b2, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000cd8fa49282, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000806a96162a, %r1, %r9
	setx	0xbb615151d6a90ba6, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e943665, %r1, %r9
	setx	0xb20cc3ea65d819eb, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f684199, %r1, %r9
	setx	0xae43ef5af967a385, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c74b7d2f13, %r1, %r9
	setx	0xe87418ce7e235cde, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000db61dd4804, %r1, %r9
	setx	0x189478cf436f0fa4, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e3c9e4c7dd, %r1, %r9
	setx	0x255afa6b83d3b5d6, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f72027b4cc, %r1, %r9
	setx	0x65a6caf69a035dcf, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f684199, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800e943665, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000806a96162a, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000f58bdcb831, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000e922fac2f4, %r1, %r12
	ldub	[%r12], %r11
	setx	0x00000080fa678c32, %r1, %r9
	setx	0xdefbd3d3588920da, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e929679, %r1, %r9
	setx	0x440d10203e542fe0, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f33c33c, %r1, %r9
	setx	0xd4f6228c4623d6d7, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c3109bf053, %r1, %r9
	setx	0xcd46e501b13f55cb, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d96fea2a7b, %r1, %r9
	setx	0x091d98d895fa82f1, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e29e81bf8d, %r1, %r9
	setx	0xeb84f95ec3ffb403, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f07ad40674, %r1, %r9
	setx	0x03d1cd9cee80651a, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e922fac2f4, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000d57d90f789, %r1, %r12
	ldub	[%r12], %r11
	setx	0x00000080d71a45ee, %r1, %r9
	setx	0xecf6d6862922f6fe, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e0fe1af, %r1, %r9
	setx	0xf00a71453825de5d, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f1ac8b5, %r1, %r9
	setx	0xe6c215e6a19aca03, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000cf8035d582, %r1, %r9
	setx	0x30e28b9693c2cdc8, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000dc68cf0bda, %r1, %r9
	setx	0xf5be11c37b2d0243, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ec0c8264d9, %r1, %r9
	setx	0x31430aab9ef4e622, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f55f356f44, %r1, %r9
	setx	0xa09cabac5b8f4408, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000807769dc90, %r1, %r9
	setx	0x756500fdd4421196, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e8ede53, %r1, %r9
	setx	0xc10f6b8f82b5e1b3, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800ff32b7e, %r1, %r9
	setx	0xc804a63619ed002a, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ca4a5cafb0, %r1, %r9
	setx	0xb6fb5a64c67d51cf, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d095dae9f9, %r1, %r9
	setx	0xcfe0c95246b69078, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e2c66b9863, %r1, %r9
	setx	0x67d0119f31adc1e8, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f78e390a65, %r1, %r9
	setx	0x0f7d824cb9116489, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000806a96162a, %r1, %r12
	ldub	[%r12], %r11
	setx	0x0000008049d51150, %r1, %r9
	setx	0x91a9ea99670ab7f1, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e0e2664, %r1, %r9
	setx	0x4cd821760d0cfc81, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f1942a5, %r1, %r9
	setx	0x954bab40ff983bb3, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c7deee048b, %r1, %r9
	setx	0x3a76e44820cfc4e2, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d5057bf3f2, %r1, %r9
	setx	0xacb1ce7628f13961, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ec55259a58, %r1, %r9
	setx	0x83241079de865c3a, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f2334ad7f8, %r1, %r9
	setx	0xa61f730937317298, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c3109bf053, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800f33c33c, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800e929679, %r1, %r12
	ldub	[%r12], %r11
	setx	0x00000080fa678c32, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000f72027b4cc, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000e3c9e4c7dd, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000803fa925be, %r1, %r9
	setx	0xfe90772116f8eda6, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e5ad4b2, %r1, %r9
	setx	0x45830c90c1bbc849, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f0a642e, %r1, %r9
	setx	0x45976e1bef4bff75, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c2e9f90948, %r1, %r9
	setx	0xe4b3c3d55cf119bc, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000da05d5fcd0, %r1, %r9
	setx	0xd1fba74e7295032c, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e2f949c673, %r1, %r9
	setx	0x3a0a5b3057c27bff, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000fc76faa2cd, %r1, %r9
	setx	0xb3504ba9e12f3975, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ea3ae54b09, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000dd9959d0b2, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000804e3dce01, %r1, %r9
	setx	0xe7ff885daaadb174, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800ee85abc, %r1, %r9
	setx	0x12fca14d71d7c761, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800fd423ec, %r1, %r9
	setx	0x50be923664461669, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c88c10fb58, %r1, %r9
	setx	0x1af89152a6cb7a70, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000de52ac1ee7, %r1, %r9
	setx	0x8fa49f4ab51f4d80, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000eec3a2a7af, %r1, %r9
	setx	0xe83144edd24874bc, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000fc01624cd4, %r1, %r9
	setx	0xba8df15cd80d0758, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f58bdcb831, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000e922fac2f4, %r1, %r12
	ldub	[%r12], %r11
	setx	0x00000080c9c21ce6, %r1, %r9
	setx	0x7d370ae535def43f, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e9d4472, %r1, %r9
	setx	0xdd5d6b2ed85c1cdd, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800fb5c172, %r1, %r9
	setx	0xe64c13e67eaa40dd, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c5dce576d6, %r1, %r9
	setx	0x7e415cbaff5f8edd, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000da7014a0a9, %r1, %r9
	setx	0x3843c8c6154d9280, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e0ac6dd6b4, %r1, %r9
	setx	0xcb7a731266de3cc3, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f4f4e8c096, %r1, %r9
	setx	0x500abb4472b4cf77, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e0fe1af, %r1, %r12
	ldub	[%r12], %r11
	setx	0x00000080d71a45ee, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000f07ad40674, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000e29e81bf8d, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000d96fea2a7b, %r1, %r12
	ldub	[%r12], %r11
	setx	0x00000080e2721e9a, %r1, %r9
	setx	0x07c442e3f9b864b4, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e1adb63, %r1, %r9
	setx	0x6ac4e629e487f493, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f26cab9, %r1, %r9
	setx	0xdde35579e0270f92, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c36f3bf257, %r1, %r9
	setx	0x4e226b41bdae3c16, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d0f181911b, %r1, %r9
	setx	0x446bbce1c247d105, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000eebeedc6af, %r1, %r9
	setx	0x10f10c32db782d11, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000feddf75e2f, %r1, %r9
	setx	0x67bbf9fe23f0d0c1, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c052d7e1a0, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800f8df070, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800e69e5b5, %r1, %r12
	ldub	[%r12], %r11
	setx	0x00000080f0896fd1, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000f76457abae, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000ea3ae54b09, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000804daba96a, %r1, %r9
	setx	0x940f21468188369c, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e20f214, %r1, %r9
	setx	0x30a12a5246dd56bc, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f759951, %r1, %r9
	setx	0x182b310e42a6668e, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000cdc6ec695b, %r1, %r9
	setx	0x780a5ba7dafde648, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d8d31371e9, %r1, %r9
	setx	0x79ee6755382cbd78, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ef4accdc68, %r1, %r9
	setx	0xadc35a9c574e765e, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f6d9123785, %r1, %r9
	setx	0x0dcaac2c4e82c119, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e2c66b9863, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000d095dae9f9, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000ca4a5cafb0, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800ff32b7e, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800e8ede53, %r1, %r12
	ldub	[%r12], %r11
	setx	0x00000080fa98d495, %r1, %r9
	setx	0xe39fd930a7d0e8d4, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e131e82, %r1, %r9
	setx	0xf46dc96e18030452, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f823145, %r1, %r9
	setx	0x3ac18d4e34f325bc, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c204cc3cb8, %r1, %r9
	setx	0x58b199aec291c3b5, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d44d4c52f8, %r1, %r9
	setx	0x013b21d35265cce4, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ee0fea6694, %r1, %r9
	setx	0x88beea30155bf0b1, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f05cb9a2d9, %r1, %r9
	setx	0xaed00b6a3dcc2d21, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f759951, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800e20f214, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000804daba96a, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000feddf75e2f, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000802c496c2c, %r1, %r9
	setx	0x180b855799b0fa19, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800ed40d71, %r1, %r9
	setx	0x36b10be47d0a8758, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800fe404fe, %r1, %r9
	setx	0x5d5b99ab332723d1, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c639cabf12, %r1, %r9
	setx	0x0eb526dff1c21d45, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d65873d4f7, %r1, %r9
	setx	0xaff47d2f3587c4a1, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e80be39274, %r1, %r9
	setx	0x0a641bfb86a1b835, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f31935181b, %r1, %r9
	setx	0x2585c42a75317019, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000806a96162a, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000f58bdcb831, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000e922fac2f4, %r1, %r12
	ldub	[%r12], %r11
	setx	0x00000080a71e5569, %r1, %r9
	setx	0xf5bbd7d4328cfe6b, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e5c77ca, %r1, %r9
	setx	0xc674996ec33219cc, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f8cc16e, %r1, %r9
	setx	0x7103e4e4358ed5d0, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000cae275ccf4, %r1, %r9
	setx	0x0fc386bceb089b83, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d0e64a9579, %r1, %r9
	setx	0x0f84b1926cd9a091, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ee2485eb41, %r1, %r9
	setx	0xb6a1f485ff50f95d, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f676ce4859, %r1, %r9
	setx	0xf437d2a3f203b369, %r1, %r10
	stb	%r10, [%r9]
	setx	0x00000080dc9ca1ca, %r1, %r9
	setx	0xd6b5a79b2d00d336, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e062238, %r1, %r9
	setx	0x8a6b5fdf49d0066e, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f7ed9a3, %r1, %r9
	setx	0x2847c5c223d4a670, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c97ab79968, %r1, %r9
	setx	0x2a5631664552deb8, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d5259a9c59, %r1, %r9
	setx	0x26409d576c6dce00, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e842df4729, %r1, %r9
	setx	0x76a18660a70ec6f8, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000fbb9b97e50, %r1, %r9
	setx	0x4a99de65178ebf9a, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c2e9f90948, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800f0a642e, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800e5ad4b2, %r1, %r12
	ldub	[%r12], %r11
	setx	0x00000080915d5694, %r1, %r9
	setx	0xaa5a1dad1e897226, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800ef227a9, %r1, %r9
	setx	0xf8112f06a04189e6, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800fcb75ae, %r1, %r9
	setx	0x59994fb77c2bb28e, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000cc0387cb84, %r1, %r9
	setx	0xb36f96b7fb8372da, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d50bf65277, %r1, %r9
	setx	0x921e868f8164f1aa, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e21efdddab, %r1, %r9
	setx	0x8e9bd47b72612721, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f7bacd4d70, %r1, %r9
	setx	0x6d1f52bca5c37aec, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800ed40d71, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000802c496c2c, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000f05cb9a2d9, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000ee0fea6694, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000d44d4c52f8, %r1, %r12
	ldub	[%r12], %r11
	setx	0x00000080d4c7a6da, %r1, %r9
	setx	0x880d43baa787f6af, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e1b99ee, %r1, %r9
	setx	0x3c91ebd921a3c236, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800fff870f, %r1, %r9
	setx	0x7b2bf456f590a4a0, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c63a027d98, %r1, %r9
	setx	0xf6c2132cc5094447, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000df87f7d1be, %r1, %r9
	setx	0x7ab80082d8b83200, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e52056c38f, %r1, %r9
	setx	0xe579c7a52074130e, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f675715b7a, %r1, %r9
	setx	0x60120f68e1beb3d2, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800fd423ec, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800ee85abc, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000804e3dce01, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000806778abb4, %r1, %r9
	setx	0x805f6d3bb577dd11, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e5de842, %r1, %r9
	setx	0x83dd71e43748452d, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f31007e, %r1, %r9
	setx	0xc0d03481e7dfd4da, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c344b68d73, %r1, %r9
	setx	0x9975b7fbb8fe6afe, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d7ba55dfa1, %r1, %r9
	setx	0x7d9c46d6325f7d19, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ec009130fc, %r1, %r9
	setx	0xc5dd0a82d9f6d6f8, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000fb992cf8c2, %r1, %r9
	setx	0xfbd64b27d978dd2f, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d5057bf3f2, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000c7deee048b, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800f1942a5, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800e0e2664, %r1, %r12
	ldub	[%r12], %r11
	setx	0x0000008049d51150, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000f78e390a65, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000807233f77b, %r1, %r9
	setx	0xed0213bde6c64c63, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e7902c0, %r1, %r9
	setx	0x3ef6694ab32f59de, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f958487, %r1, %r9
	setx	0xe9d240269c1deed4, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c697b22c98, %r1, %r9
	setx	0xbdb636978408ba74, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d0c92338df, %r1, %r9
	setx	0xbfdd3debbd7208df, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ea4d92d939, %r1, %r9
	setx	0x83d2d7327f7dcc09, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f390742b8b, %r1, %r9
	setx	0xb36787129b947699, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d44d4c52f8, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000c204cc3cb8, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800f823145, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800e131e82, %r1, %r12
	ldub	[%r12], %r11
	setx	0x00000080fa98d495, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000f6d9123785, %r1, %r12
	ldub	[%r12], %r11
	setx	0x00000080b420aa8b, %r1, %r9
	setx	0x9328c9ab4c5575d4, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e161bc4, %r1, %r9
	setx	0x8d2acfea20a9c914, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800fc6fbe9, %r1, %r9
	setx	0x8934cca7af7ab3f8, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c032aa2218, %r1, %r9
	setx	0x6fd167f43917d1e3, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d0e69a2695, %r1, %r9
	setx	0x9ee9c0c531342007, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e01f5a8de4, %r1, %r9
	setx	0x84cbcfeb192dfc8d, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f489aef31c, %r1, %r9
	setx	0xdebcd9522639b5c9, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c344b68d73, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800f31007e, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800e5de842, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000806778abb4, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000f675715b7a, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000e52056c38f, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000807ab04db2, %r1, %r9
	setx	0x534222bb7400a8d9, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e7f5138, %r1, %r9
	setx	0x3627e35d5bc38186, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800fca623a, %r1, %r9
	setx	0x2483d2f4744fc4ee, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000cab6693fe6, %r1, %r9
	setx	0x1c04abfd573612fd, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d99db9f043, %r1, %r9
	setx	0x02c5ccef37f3701c, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ea06cd88aa, %r1, %r9
	setx	0xdf81ce8dc3582fdb, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f4364100b5, %r1, %r9
	setx	0x755c1608f0c44a52, %r1, %r10
	stb	%r10, [%r9]
	setx	0x00000080e2721e9a, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000f4f4e8c096, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000e0ac6dd6b4, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000da7014a0a9, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000c5dce576d6, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800fb5c172, %r1, %r12
	ldub	[%r12], %r11
	setx	0x00000080f4981483, %r1, %r9
	setx	0x3f0cc9f52667742b, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e2c5877, %r1, %r9
	setx	0xdbb4b1e21345ccef, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f2460f6, %r1, %r9
	setx	0x9539dcdf28808c30, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c9df80e572, %r1, %r9
	setx	0x4c88c69654d9bf49, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000de25cda06c, %r1, %r9
	setx	0x2ae613f4fc4f843a, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e3effc0a5a, %r1, %r9
	setx	0xe09eb2cde99c1210, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f4c4949853, %r1, %r9
	setx	0x9ded31dab9de96d6, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e922fac2f4, %r1, %r12
	ldub	[%r12], %r11
	setx	0x00000080f884fab9, %r1, %r9
	setx	0x7738c2e10119a786, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e32b5bf, %r1, %r9
	setx	0xb2475a2a59b0e038, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f37fc2e, %r1, %r9
	setx	0x1a6eff3c48e5c735, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c6b8d11621, %r1, %r9
	setx	0xeb3cdf3a17fd2a35, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d045b9b0f4, %r1, %r9
	setx	0xf5ffa95b66eba93d, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e428205938, %r1, %r9
	setx	0x7ea03108b95f4ac0, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f1b1669688, %r1, %r9
	setx	0x0be872796d0a0474, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d5057bf3f2, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000c7deee048b, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800f1942a5, %r1, %r12
	ldub	[%r12], %r11
	setx	0x0000008017096fee, %r1, %r9
	setx	0x3997f517c291faf6, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800ef44146, %r1, %r9
	setx	0x102096de970831fe, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f5ab711, %r1, %r9
	setx	0x8fa9699117cc76df, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c4c8e06399, %r1, %r9
	setx	0xcc43c0d08c50e417, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d73e69dd39, %r1, %r9
	setx	0xe42723a85b3e353f, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ee906273a7, %r1, %r9
	setx	0x27936ea959771d0e, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f1d9ba4a36, %r1, %r9
	setx	0x906c87693a477cba, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f2460f6, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800e2c5877, %r1, %r12
	ldub	[%r12], %r11
	setx	0x00000080f4981483, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000f4364100b5, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000ea06cd88aa, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000d99db9f043, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000802d29a309, %r1, %r9
	setx	0xdff46659aafdd12e, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800eec9f45, %r1, %r9
	setx	0x10428642aa25a33c, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f9a778b, %r1, %r9
	setx	0x453b102809bb52a2, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c7ee32c89b, %r1, %r9
	setx	0xa79a63f581ac3c58, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000dcb506e257, %r1, %r9
	setx	0xdda8b74793eb7f84, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e79ee9aa87, %r1, %r9
	setx	0x6c4975be4490ced1, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000fd325c5f41, %r1, %r9
	setx	0x647bf308d4f3e87f, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e01f5a8de4, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000d0e69a2695, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000c032aa2218, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800fc6fbe9, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800e161bc4, %r1, %r12
	ldub	[%r12], %r11
	setx	0x00000080b420aa8b, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000f390742b8b, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000808f9bb249, %r1, %r9
	setx	0xdf2ad808d8e6128d, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e0f0f4e, %r1, %r9
	setx	0xb84f73506babbbb7, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f6cda5c, %r1, %r9
	setx	0x26f831cb08e56237, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c87b7e3f79, %r1, %r9
	setx	0xc6464a66f55a1bb8, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d0b76df92d, %r1, %r9
	setx	0x79982aa90c40e253, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000efa529e3c7, %r1, %r9
	setx	0x544ccda5964772c6, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f09ae18097, %r1, %r9
	setx	0xed7c1f29444a2278, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000806a96162a, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000f58bdcb831, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000e922fac2f4, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000d57d90f789, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000c052d7e1a0, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000807af163a5, %r1, %r9
	setx	0xe1f0870378f80646, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e4e5058, %r1, %r9
	setx	0x5d27a6ee38289b69, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800fece9e4, %r1, %r9
	setx	0xb3eca72fc2935338, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c9fadbc214, %r1, %r9
	setx	0x8d1472ddef2a9aa4, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d2b1429faf, %r1, %r9
	setx	0x2d47d8b4ce9641b5, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e324579127, %r1, %r9
	setx	0xf7080e4a804524ca, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f41f852cb4, %r1, %r9
	setx	0x3070bbdc92850ddf, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000df87f7d1be, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000c63a027d98, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800fff870f, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000805be9827a, %r1, %r9
	setx	0x5b21f8cf53aa6fe3, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800ec83857, %r1, %r9
	setx	0x39fb52458dbbbdeb, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f782736, %r1, %r9
	setx	0x20546823cc755c9c, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000caee07298c, %r1, %r9
	setx	0x32c2b5e9d91883ca, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d88d78b266, %r1, %r9
	setx	0xabc54323b56097be, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e5c476f28f, %r1, %r9
	setx	0x3ef50aa8dbd9c332, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000fb98ade978, %r1, %r9
	setx	0xef52e618c2fb3eb8, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f489aef31c, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000e01f5a8de4, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000d0e69a2695, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000c032aa2218, %r1, %r12
	ldub	[%r12], %r11
	setx	0x00000080aaa0da5e, %r1, %r9
	setx	0x12d339e6a816b77f, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e424a1e, %r1, %r9
	setx	0x50774dbff9aa3ffd, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800fe9a847, %r1, %r9
	setx	0x233f9ae397d1052b, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c6fba49965, %r1, %r9
	setx	0xea4615bd5e95abb5, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d1c95112c8, %r1, %r9
	setx	0x91924ed08f9099a9, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e920599aac, %r1, %r9
	setx	0x0cf9f41bb64e5ceb, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f0c5376c4b, %r1, %r9
	setx	0x3ab25aaebce67796, %r1, %r10
	stb	%r10, [%r9]
	setx	0x00000080aaa0da5e, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000fb98ade978, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000e5c476f28f, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000d88d78b266, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000caee07298c, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800f782736, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000803a526844, %r1, %r9
	setx	0x74dc4e4e86c21ae3, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e989db5, %r1, %r9
	setx	0x07be2774b66bba6e, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800fe11854, %r1, %r9
	setx	0xd7e0e28771193f94, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c638090c60, %r1, %r9
	setx	0x5567aedb8ca65d53, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d1701821fd, %r1, %r9
	setx	0xe24ea3b4097f0056, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e65d9deb46, %r1, %r9
	setx	0xb4c2834af9d52f99, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000fb29926da7, %r1, %r9
	setx	0xde2e3824098ec258, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000807233f77b, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000fb992cf8c2, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000ec009130fc, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000d7ba55dfa1, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000c344b68d73, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000803a745eca, %r1, %r9
	setx	0xa711baf7a1fc7907, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800eceea82, %r1, %r9
	setx	0x276d6a7109207af3, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f645c3b, %r1, %r9
	setx	0x0528b29a9ac20192, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000cbab402420, %r1, %r9
	setx	0x7679e27aadd2ccdb, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000de0a7c8aef, %r1, %r9
	setx	0xe33eb7baa4049cee, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e9b189918a, %r1, %r9
	setx	0x5ee037344765907c, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f19af9a4c6, %r1, %r9
	setx	0x1ceb6bddf4e41879, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e929679, %r1, %r12
	ldub	[%r12], %r11
	setx	0x00000080fa678c32, %r1, %r12
	ldub	[%r12], %r11
	setx	0x00000080e49bfe60, %r1, %r9
	setx	0x2fac669c66883b5c, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800ed9ac7a, %r1, %r9
	setx	0xd74b5fccfa7e4494, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f689c60, %r1, %r9
	setx	0xed00f4d0bafa7140, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000cc2c392492, %r1, %r9
	setx	0xd11f3100b498027f, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d060d516d4, %r1, %r9
	setx	0xc81b6b0fdcf86789, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000eb3d29abcd, %r1, %r9
	setx	0x4e3652e334270509, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000fc5723a0ee, %r1, %r9
	setx	0x5fe63012e498db15, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000806779d412, %r1, %r9
	setx	0xd5023d8c420e3ad0, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e6c8eed, %r1, %r9
	setx	0x64132817d4ac44a1, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f4bab89, %r1, %r9
	setx	0x23871e24432fadc5, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c8f73b512c, %r1, %r9
	setx	0x1c21e8332ef6c7b0, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d28c8642fe, %r1, %r9
	setx	0x91e61ec7b48c1a1b, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ecc5f43ee2, %r1, %r9
	setx	0xa2e707c9ffb4cb4f, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f7e1df2a1a, %r1, %r9
	setx	0x7698fe62d9766746, %r1, %r10
	stb	%r10, [%r9]
	setx	0x00000080aed8faaf, %r1, %r9
	setx	0x5cd152a0253f7e5f, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e4efc13, %r1, %r9
	setx	0x92433e903794174e, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f6b430a, %r1, %r9
	setx	0xb7a3a8da8e515468, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000cabba3603a, %r1, %r9
	setx	0x2d39a0c5a7d240a1, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d03c22fcf3, %r1, %r9
	setx	0x1a0cd4a194dc2139, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ef428d8033, %r1, %r9
	setx	0xe1479f810386fe40, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f9ffc94277, %r1, %r9
	setx	0x6fb95d8fc789792e, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d96fea2a7b, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000c3109bf053, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800f33c33c, %r1, %r12
	ldub	[%r12], %r11
	setx	0x0000008068831d9b, %r1, %r9
	setx	0x92aa7f19e93d2e63, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e5d251c, %r1, %r9
	setx	0x127d6d3bc5127d87, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800fc48f4a, %r1, %r9
	setx	0x4196f95b753dc501, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c6f2557776, %r1, %r9
	setx	0xb55daeb78578fb0e, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d81f934678, %r1, %r9
	setx	0x3b4502e9d5ebf6be, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e59b5ac896, %r1, %r9
	setx	0x5de893e46352830a, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f3a8a988f0, %r1, %r9
	setx	0x569126f563683fb5, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f684199, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800e943665, %r1, %r12
	ldub	[%r12], %r11
	setx	0x00000080b27801a9, %r1, %r9
	setx	0x36caef81202efa78, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e363fb3, %r1, %r9
	setx	0xb489bc86e6683b82, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f557474, %r1, %r9
	setx	0xc662893363407ab3, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ce039ed791, %r1, %r9
	setx	0x7f709c1d468a47cf, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d8a6e1bcf2, %r1, %r9
	setx	0x1b7c1f2600d3ef11, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e894c73b43, %r1, %r9
	setx	0x9d7d36ba5d67de20, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f2c3759884, %r1, %r9
	setx	0xa83d43daec281252, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d50bf65277, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000cc0387cb84, %r1, %r12
	ldub	[%r12], %r11
	setx	0x00000080c2861aba, %r1, %r9
	setx	0x2581282b559bf9f2, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e678372, %r1, %r9
	setx	0x25d02cb20114347f, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f34ab0d, %r1, %r9
	setx	0x6419f54109dee394, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c20e627a13, %r1, %r9
	setx	0xd7adf4ac2f2e9e2a, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000dbaa06bcba, %r1, %r9
	setx	0x2066d67775e75347, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e21dbea9ec, %r1, %r9
	setx	0x1d33d9e7d208f82d, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000fae4fbaa2d, %r1, %r9
	setx	0x912bbda9795b6ad4, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800fca623a, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800e7f5138, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000807ab04db2, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000f489aef31c, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000e01f5a8de4, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000d0e69a2695, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000808cabdfd7, %r1, %r9
	setx	0x65eafbe45bf2e80b, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e9ad3f0, %r1, %r9
	setx	0xa1ea5e90fd9f2325, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800fd8030d, %r1, %r9
	setx	0x614caa2e9bb64b71, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ce29f6f3d0, %r1, %r9
	setx	0xefba1bd4b264fd6f, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d68f1358c2, %r1, %r9
	setx	0xc616059f67870f97, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e5b54ccddf, %r1, %r9
	setx	0xcdad253b4eea814c, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000fa492b05dc, %r1, %r9
	setx	0x5111b25b2a647e73, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e920599aac, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000d1c95112c8, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000c6fba49965, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000806e0d8476, %r1, %r9
	setx	0xdfccc9839f5dc621, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800ef7d743, %r1, %r9
	setx	0x9131f60b074e4b81, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800fccdb2c, %r1, %r9
	setx	0x24de04a730c74ef6, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c230a76c54, %r1, %r9
	setx	0xe48e662214ab27a6, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000dd22e46529, %r1, %r9
	setx	0x9de56a915913b84b, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ed12b1789b, %r1, %r9
	setx	0x613d669352d63595, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000fb3145de5b, %r1, %r9
	setx	0xb3069108187afb59, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c8f73b512c, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800f4bab89, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800e6c8eed, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000806779d412, %r1, %r12
	ldub	[%r12], %r11
	setx	0x00000080ddf8bb43, %r1, %r9
	setx	0x690d19445543b075, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800ef2c081, %r1, %r9
	setx	0x61ebd9edd8ef3c62, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800fee40ed, %r1, %r9
	setx	0x5a201ad620b24c8d, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c45bbb0da6, %r1, %r9
	setx	0xe3730bcf8c9c05aa, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000dd669e2c9e, %r1, %r9
	setx	0x5e9d84249613fb8d, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e022d25ffc, %r1, %r9
	setx	0x1f3e9f31b2fd03ee, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f3ce189992, %r1, %r9
	setx	0xb2377911763d7189, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ecc5f43ee2, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000d28c8642fe, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000c8f73b512c, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800f4bab89, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800e6c8eed, %r1, %r12
	ldub	[%r12], %r11
	setx	0x00000080b9dfbfab, %r1, %r9
	setx	0xbc59b960f1ba24aa, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800ed7632d, %r1, %r9
	setx	0xa1915afb0400f2eb, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800ff3f7a6, %r1, %r9
	setx	0xc14cbce776729d2c, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c4ab19d94c, %r1, %r9
	setx	0xb0c6434548017b62, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d8fdcbd238, %r1, %r9
	setx	0x54b8b041e631bb2c, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e693802627, %r1, %r9
	setx	0xc0ad000b2c1cda27, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f2bc67c8ac, %r1, %r9
	setx	0xd4485d17f59dca6f, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f9a778b, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000805919961f, %r1, %r9
	setx	0x19d2a70140ac2358, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e9d133c, %r1, %r9
	setx	0x82254d0994dbefb0, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f4d8d3e, %r1, %r9
	setx	0xd2ed1cc49bcf3fe6, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c1f13d68f1, %r1, %r9
	setx	0xc201e3b9451991c1, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000da12d92f6c, %r1, %r9
	setx	0xa32cb5dd3567a8a5, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e0356fabd7, %r1, %r9
	setx	0xf9244c9faa262d6c, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f0b841a54f, %r1, %r9
	setx	0xc7287e0e241c9293, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000da7014a0a9, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000c5dce576d6, %r1, %r12
	ldub	[%r12], %r11
	setx	0x0000008048a1eab2, %r1, %r9
	setx	0x9de126bd9dbe7f2a, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e76d389, %r1, %r9
	setx	0x5523b3025e7ea6dd, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f768868, %r1, %r9
	setx	0xef17029a271982f9, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c8d85ab450, %r1, %r9
	setx	0xf89a6acc6970c37e, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ddb3b2c5a9, %r1, %r9
	setx	0x3b561860eb9f3985, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e49b80efaf, %r1, %r9
	setx	0xac25c83308fa6570, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f604918963, %r1, %r9
	setx	0xd048b1e050c14c0c, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800fb5c172, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800e9d4472, %r1, %r12
	ldub	[%r12], %r11
	setx	0x00000080c9c21ce6, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000fc01624cd4, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000eec3a2a7af, %r1, %r12
	ldub	[%r12], %r11
	setx	0x00000080ab8b60dc, %r1, %r9
	setx	0x6f7af7e1f442f70a, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e915d3e, %r1, %r9
	setx	0xd06d2e727d14ad2a, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f707b62, %r1, %r9
	setx	0xf73c08ad40db5d2b, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000cfee00fb08, %r1, %r9
	setx	0x12c063c436cb238f, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ddb84cfdfd, %r1, %r9
	setx	0x9146238e14ad5ce3, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e38a13ff0d, %r1, %r9
	setx	0x64b98d15f842e0a9, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f85422211d, %r1, %r9
	setx	0x907884521bc91a9b, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000807233f77b, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000fb992cf8c2, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000ec009130fc, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000d7ba55dfa1, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000c344b68d73, %r1, %r12
	ldub	[%r12], %r11
	setx	0x0000008089146fea, %r1, %r9
	setx	0x881a0113fe3bd067, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e1ca88b, %r1, %r9
	setx	0x00acebd072d6301e, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f403c30, %r1, %r9
	setx	0x86ff36fb3c8faf79, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c5e04be86f, %r1, %r9
	setx	0x9d330665ddf4ba43, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d85558e102, %r1, %r9
	setx	0xd4cf325a6d00352b, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ee715703cc, %r1, %r9
	setx	0x8ec18b2d7c5e5b42, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f806913ada, %r1, %r9
	setx	0x6abb825426dc9997, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000fb3145de5b, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000ed12b1789b, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000dd22e46529, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000c230a76c54, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800fccdb2c, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800ef7d743, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000806e0d8476, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000801830bd53, %r1, %r9
	setx	0x63f27d5d5b163d1a, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800eb8a0a3, %r1, %r9
	setx	0x2df94ade87d9a9ee, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f67fb00, %r1, %r9
	setx	0x3317bbe7d710218a, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c6582c2397, %r1, %r9
	setx	0xf0cb224bda013fdb, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d5bccc3b99, %r1, %r9
	setx	0xb5a7c2c4af82e7e0, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000eeea26bb4a, %r1, %r9
	setx	0xf44c97e7a7592245, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000fe84d0ff0c, %r1, %r9
	setx	0x977606e867d1ee0e, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d0f181911b, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000805b5b23a1, %r1, %r9
	setx	0x82107cd715d18c23, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800ec554a9, %r1, %r9
	setx	0xdb661ab8a297ffc7, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800fb71a6c, %r1, %r9
	setx	0x5ccec3d0fa99a291, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c8a5184a3f, %r1, %r9
	setx	0x388c0b4d74cc115a, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000db0b2f329c, %r1, %r9
	setx	0xd6e910d91cc80e0a, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ea2d5d5ed7, %r1, %r9
	setx	0x40cd15ea1f10e8be, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f49c6ac3b2, %r1, %r9
	setx	0xf9cc01e3e470f943, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e693802627, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000d8fdcbd238, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000c4ab19d94c, %r1, %r12
	ldub	[%r12], %r11
	setx	0x00000080f24fc64d, %r1, %r9
	setx	0x9fdf857214b547fd, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e5deb0e, %r1, %r9
	setx	0xde436cf6a941ae81, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f0c4d20, %r1, %r9
	setx	0xa83925c9db061774, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c448b9fa3d, %r1, %r9
	setx	0x50009d284e2e15e9, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d136ffdbcf, %r1, %r9
	setx	0xfa8776a23ab65dea, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e247a2f1e5, %r1, %r9
	setx	0x062a0de8dbb61770, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f5462c5dac, %r1, %r9
	setx	0xbc41eedc8130c079, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000807233f77b, %r1, %r12
	ldub	[%r12], %r11
	setx	0x00000080d48e7802, %r1, %r9
	setx	0xb7c767e076e7f51c, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e285385, %r1, %r9
	setx	0x82ba1efbe4760750, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f6696db, %r1, %r9
	setx	0x3a6858736a55db68, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c9f427de12, %r1, %r9
	setx	0x41d9ed321e84d272, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000de3c068e7e, %r1, %r9
	setx	0x1ab36bba7d2ec287, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e3647e53a5, %r1, %r9
	setx	0x0b28cbd9a867d41a, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f4fbae08e2, %r1, %r9
	setx	0xea98e1e110c8600d, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e0f0f4e, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000803671f5c3, %r1, %r9
	setx	0xd19f11ce63b67671, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e411835, %r1, %r9
	setx	0xd5066a97a603ec09, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800fe652f9, %r1, %r9
	setx	0xd075b3777366fe2e, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000cb13f4c621, %r1, %r9
	setx	0x0c8ba2b0289d047c, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d02bcaa461, %r1, %r9
	setx	0xc6509e4cd0267e1a, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e7937082dc, %r1, %r9
	setx	0x5d6d705f23f7d165, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000fc2ed8d585, %r1, %r9
	setx	0xd87be876968cc294, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ddb3b2c5a9, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000c8d85ab450, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800f768868, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800e76d389, %r1, %r12
	ldub	[%r12], %r11
	setx	0x0000008048a1eab2, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000f0b841a54f, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000807a500863, %r1, %r9
	setx	0x93610a108079fab7, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e12465e, %r1, %r9
	setx	0x94fc0b74a548f7c3, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800ffce9e4, %r1, %r9
	setx	0x7c84d57bf2a9d5b8, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ce3b3afd68, %r1, %r9
	setx	0xc55c4112f5676371, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d6e7e6f565, %r1, %r9
	setx	0xa323ab508dd1ab9e, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e0f139ce2b, %r1, %r9
	setx	0xe416f0f1afbac337, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000fd57da55aa, %r1, %r9
	setx	0x73b13daa918cd249, %r1, %r10
	stb	%r10, [%r9]
	setx	0x0000008076e21402, %r1, %r9
	setx	0x2d11d7beaab8b96f, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800ee0cb89, %r1, %r9
	setx	0xe9631045239f994b, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800fb208d9, %r1, %r9
	setx	0x87f8c80d13fbe9a1, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c1ee5efe47, %r1, %r9
	setx	0xe1c84d2acd0719f2, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ddc2a6edd2, %r1, %r9
	setx	0x6583c972c9bf75ef, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ed4d83ed4c, %r1, %r9
	setx	0xf098defe7a52ac49, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000fa3199b263, %r1, %r9
	setx	0xd041a593fa35cb70, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e3effc0a5a, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000de25cda06c, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000c9df80e572, %r1, %r12
	ldub	[%r12], %r11
	setx	0x00000080830444e3, %r1, %r9
	setx	0xc731befbc7a2ed4b, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800ed22ca4, %r1, %r9
	setx	0x0df6cfba4494e999, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f9fcbb4, %r1, %r9
	setx	0x79ac0e460ea9fa76, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c1ed910747, %r1, %r9
	setx	0xfbc8c3aa43eeaa48, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d0a05a8824, %r1, %r9
	setx	0x6a4186a5c3eafc49, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e901ec32cc, %r1, %r9
	setx	0x7703f1b2a491ab1e, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000fe6a578376, %r1, %r9
	setx	0x6793539c0c04a2d4, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c45bbb0da6, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800fee40ed, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000801c59b8a6, %r1, %r9
	setx	0x3839dbcafcb26522, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800ea119e0, %r1, %r9
	setx	0x122ae88974dc742f, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f312e04, %r1, %r9
	setx	0x0f638869dbdba340, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c26f43158c, %r1, %r9
	setx	0xd25c0db66150a99f, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d62a450d63, %r1, %r9
	setx	0xcdecb9c712d5ccb1, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000eaa266ede0, %r1, %r9
	setx	0x51976ec6fa9adbc3, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f733e1d19b, %r1, %r9
	setx	0x526d7c476d9d3437, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d28c8642fe, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000c8f73b512c, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800f4bab89, %r1, %r12
	ldub	[%r12], %r11
	setx	0x00000080bd52291b, %r1, %r9
	setx	0x03a372bcafe08e62, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e90d2f9, %r1, %r9
	setx	0x97e76c4890dea18c, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f63cadf, %r1, %r9
	setx	0xae5b1f0e8d6fd9ec, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c9e570e013, %r1, %r9
	setx	0x82a2418c739eafa1, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000dad581a18e, %r1, %r9
	setx	0x0771aeb3a0062f47, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ef19c7e3e4, %r1, %r9
	setx	0xa73f1f1cf1749c0e, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000fa435bcbd5, %r1, %r9
	setx	0xb1d3a856b1eeb409, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e915d3e, %r1, %r12
	ldub	[%r12], %r11
	setx	0x00000080ab8b60dc, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000f604918963, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000e49b80efaf, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000ddb3b2c5a9, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000c8d85ab450, %r1, %r12
	ldub	[%r12], %r11
	setx	0x00000080c972a6de, %r1, %r9
	setx	0xdf282c66b5295ba8, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e310fdf, %r1, %r9
	setx	0xf1931621de939af7, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f5af350, %r1, %r9
	setx	0x591eb02eeef0134c, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ca585b81eb, %r1, %r9
	setx	0x9a120200bb9bb6c2, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000dd29c3068b, %r1, %r9
	setx	0x59c95bc081eccb4a, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e67b9e5947, %r1, %r9
	setx	0xe4ff3534eb6d1c7c, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f044a34fe7, %r1, %r9
	setx	0xd79ac04be456f5c9, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800fe404fe, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800ed40d71, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000802c496c2c, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000f05cb9a2d9, %r1, %r12
	ldub	[%r12], %r11
	setx	0x00000080ba4d641d, %r1, %r9
	setx	0x7c3374dc7dc4221a, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e5356bc, %r1, %r9
	setx	0x22f53b53e0a93a3a, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800fe28dc1, %r1, %r9
	setx	0xc02149a0348fb35c, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c51592bf72, %r1, %r9
	setx	0x93e6498a58da4294, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d1b7b2d567, %r1, %r9
	setx	0x2a57df9fab1ab128, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e1b2bc4698, %r1, %r9
	setx	0xc263bb727ad7edba, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f3f63b1c3a, %r1, %r9
	setx	0x417a2adf72a824e6, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f9a778b, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800eec9f45, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000802d29a309, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000f1d9ba4a36, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000ee906273a7, %r1, %r12
	ldub	[%r12], %r11
	setx	0x00000080e0a57bdb, %r1, %r9
	setx	0xcfbb6cec522a79f7, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e008eb7, %r1, %r9
	setx	0x2a2fd97c3eddd3f0, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800fcd3d40, %r1, %r9
	setx	0xaedabe143e967f02, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000cf0656505e, %r1, %r9
	setx	0x1d613ac9c3d7cb26, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d83852bdba, %r1, %r9
	setx	0xb92dcdcdfd3918a5, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e9ac249153, %r1, %r9
	setx	0x4248c0e91f5ad12a, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000fae04ef3a4, %r1, %r9
	setx	0x53bd6ac78ac013a4, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f1ac8b5, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800e0fe1af, %r1, %r12
	ldub	[%r12], %r11
	setx	0x00000080d71a45ee, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000f07ad40674, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000e29e81bf8d, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000809acbf8bb, %r1, %r9
	setx	0xba6bcf32253d0b2a, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800ef12b4f, %r1, %r9
	setx	0xf380f95cf4414f42, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800fe9708b, %r1, %r9
	setx	0x39de875b271a56a1, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ca9193de98, %r1, %r9
	setx	0xc35685be6f1a1260, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000db3f303eeb, %r1, %r9
	setx	0x4add09f7f875a29a, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e2dd720111, %r1, %r9
	setx	0xd226b6f63e3bfeba, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000fbb5189c01, %r1, %r9
	setx	0xa432d956f7ca9fae, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f557474, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800e363fb3, %r1, %r12
	ldub	[%r12], %r11
	setx	0x00000080b27801a9, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000f3a8a988f0, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000e59b5ac896, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000d81f934678, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000c6f2557776, %r1, %r12
	ldub	[%r12], %r11
	setx	0x0000008041e22446, %r1, %r9
	setx	0x21a7f8c732276886, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e4cdb25, %r1, %r9
	setx	0x4c78076e153c0e14, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800fdd807a, %r1, %r9
	setx	0x3cedec374a0aad9d, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000cf08179445, %r1, %r9
	setx	0x5064362e9d4bba5b, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000db65c9a6dd, %r1, %r9
	setx	0x480f6af69ff584ce, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e60f5fd75a, %r1, %r9
	setx	0xcb462c6cb737e807, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f5537a66c9, %r1, %r9
	setx	0xaf508205807c3baa, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000803448e364, %r1, %r9
	setx	0xb889dd1d4b85929d, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800ef7c3c7, %r1, %r9
	setx	0xa1cef49b16c6327e, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800fe05575, %r1, %r9
	setx	0x31d110dbceed798e, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c9a050d7c5, %r1, %r9
	setx	0x9d0fbf9296582dc6, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d17f9caf72, %r1, %r9
	setx	0xf0568effb2d7b41b, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ed742f81a1, %r1, %r9
	setx	0xc55dcf2a12a446d7, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000fb3fd13c15, %r1, %r9
	setx	0xabc9ae22dc9f76ea, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ddb3b2c5a9, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000c8d85ab450, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800f768868, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800e76d389, %r1, %r12
	ldub	[%r12], %r11
	setx	0x00000080c041a157, %r1, %r9
	setx	0x0471470bfce8e263, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e449f51, %r1, %r9
	setx	0x1395181c087cb8d6, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f72e6c4, %r1, %r9
	setx	0xf856abc92dd90938, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000cb2d2a37f4, %r1, %r9
	setx	0x37c795760c359797, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000dd61ea4526, %r1, %r9
	setx	0x7c32c39045f8c105, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e39404095a, %r1, %r9
	setx	0x856c455aee7d53b2, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f442a62417, %r1, %r9
	setx	0x3a863c2244542260, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e285385, %r1, %r12
	ldub	[%r12], %r11
	setx	0x00000080d48e7802, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000f5462c5dac, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000e247a2f1e5, %r1, %r12
	ldub	[%r12], %r11
	setx	0x00000080c8c4d63d, %r1, %r9
	setx	0x45d517ff7c50cb6d, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800ec02300, %r1, %r9
	setx	0xec0879da12be2324, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800fecbcd3, %r1, %r9
	setx	0x5a0cdcfaf6950af9, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c2e16cd003, %r1, %r9
	setx	0xc5fea58a8efb74ff, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000dbd74758a4, %r1, %r9
	setx	0x5c0640d3f3c77343, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e3971ee59f, %r1, %r9
	setx	0xf9b9dea74f6784a8, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f4ab089690, %r1, %r9
	setx	0xe0db4e2f3102cbb4, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c9a050d7c5, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800fe05575, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800ef7c3c7, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000803448e364, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000f5537a66c9, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000e60f5fd75a, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000db65c9a6dd, %r1, %r12
	ldub	[%r12], %r11
	setx	0x00000080d516e3e3, %r1, %r9
	setx	0xd40e36e9cda86d64, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e2435a6, %r1, %r9
	setx	0xba2b9638d5bd9428, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800fa07106, %r1, %r9
	setx	0x220a8f8aba85511e, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c2dd5f026b, %r1, %r9
	setx	0x16fcd3da9a93504b, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000de503399dd, %r1, %r9
	setx	0x9052a357ae17b52a, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000eac840d52d, %r1, %r9
	setx	0xa1799c8343abdcdd, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f4ab938346, %r1, %r9
	setx	0xeefb643df94f7d89, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e989db5, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000803a526844, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000f0c5376c4b, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000e920599aac, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000d1c95112c8, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000c6fba49965, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000807cab88fd, %r1, %r9
	setx	0xeff3d4d2f7aa2031, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800efb602e, %r1, %r9
	setx	0xac477bedaec35163, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f92ae41, %r1, %r9
	setx	0x21e09ae954475263, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000cf6317b68c, %r1, %r9
	setx	0x77271624ade992eb, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d8defcc6eb, %r1, %r9
	setx	0x75afcb5115bfee53, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ebeb813111, %r1, %r9
	setx	0xe9868876f0987510, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f124568c90, %r1, %r9
	setx	0x91e65a91b9cae3ee, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f3a8a988f0, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000e59b5ac896, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000d81f934678, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000c6f2557776, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800fc48f4a, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800e5d251c, %r1, %r12
	ldub	[%r12], %r11
	setx	0x0000008068831d9b, %r1, %r12
	ldub	[%r12], %r11
	setx	0x00000080974aeb91, %r1, %r9
	setx	0x991c1f7438131e36, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e55a41e, %r1, %r9
	setx	0x17a28ce7f9dfb282, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800fec7777, %r1, %r9
	setx	0x5c922dac48857c2a, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ce6641c09e, %r1, %r9
	setx	0xe34ab282a6b09184, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d0cf5f7a1c, %r1, %r9
	setx	0x053f9ae3c41a6b7c, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e90ae26d27, %r1, %r9
	setx	0xb7657de9981f37ee, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f9f676de1a, %r1, %r9
	setx	0x64205b96598e607c, %r1, %r10
	stb	%r10, [%r9]
	setx	0x0000008026c4a2c4, %r1, %r9
	setx	0xb875760e0dd35b25, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e831477, %r1, %r9
	setx	0xbe8dbd0ea45232c2, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f59bd79, %r1, %r9
	setx	0x41d622ab6cc94721, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c9e2f831bc, %r1, %r9
	setx	0x2d71c742c17a3647, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d686941e94, %r1, %r9
	setx	0xf76fad3dc8ddbb1d, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e25fc15e58, %r1, %r9
	setx	0x9fd5f5897b401017, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f3cf85f33d, %r1, %r9
	setx	0xc4ca419a569e85b8, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c9e570e013, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800f63cadf, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800e90d2f9, %r1, %r12
	ldub	[%r12], %r11
	setx	0x00000080bd52291b, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000f733e1d19b, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000eaa266ede0, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000d62a450d63, %r1, %r12
	ldub	[%r12], %r11
	setx	0x00000080f8b0664e, %r1, %r9
	setx	0x7ec3fdcbb7c05c43, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800ee5fab6, %r1, %r9
	setx	0x6501b9e37658a1aa, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f88a784, %r1, %r9
	setx	0xd1edede34abb182a, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c3655b32fa, %r1, %r9
	setx	0xa41f92b1fda97a4f, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d1f61607d2, %r1, %r9
	setx	0xb3d7f2099ad77f63, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ef70d27297, %r1, %r9
	setx	0x52c6478eb7f16b12, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f4b9acd06f, %r1, %r9
	setx	0xda06788edd917aa3, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000fa435bcbd5, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000ef19c7e3e4, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000802b60ab4e, %r1, %r9
	setx	0xce266bd5bfa5a1e9, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800edb00e5, %r1, %r9
	setx	0x67cebd86ad468c31, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f2612e5, %r1, %r9
	setx	0xd23ab251f06ac4ff, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000cf137f9366, %r1, %r9
	setx	0x11eae2a8d05c7401, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000da0255c35b, %r1, %r9
	setx	0x8ca440613b4fc413, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e30578e65a, %r1, %r9
	setx	0x88c01d7b2ec1c51a, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f2919a7b81, %r1, %r9
	setx	0x9e214c7e66c4e5bd, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e131e82, %r1, %r12
	ldub	[%r12], %r11
	setx	0x00000080fa98d495, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000f6d9123785, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000ef4accdc68, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000d8d31371e9, %r1, %r12
	ldub	[%r12], %r11
	setx	0x00000080dd02f82b, %r1, %r9
	setx	0x8d472d7b36a3167b, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e42a682, %r1, %r9
	setx	0x412bb112098dfb22, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f53e07f, %r1, %r9
	setx	0x69fa1e6aeeb5ff55, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c0008ed43c, %r1, %r9
	setx	0x8b5aaa5dac5b6672, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d7e258fde8, %r1, %r9
	setx	0x54b4912c377d445a, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e322c953ec, %r1, %r9
	setx	0xce2aa32d1589c8ed, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f0f2bbfb27, %r1, %r9
	setx	0x91529c4a8bde9a5a, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f6d9123785, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000802bdc797f, %r1, %r9
	setx	0xa849a51a4108c612, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800ecf653d, %r1, %r9
	setx	0xa5579278a55f13a7, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f088cfb, %r1, %r9
	setx	0xbbfc4d62ba2fbc0f, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c346892a08, %r1, %r9
	setx	0x7391806d03bfbfa5, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000dae30eb9e9, %r1, %r9
	setx	0x9e30a64028468252, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e8f1219b69, %r1, %r9
	setx	0x74557b66022ad7e5, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f8fd8c656d, %r1, %r9
	setx	0x818c7a722ce3fc67, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e9ad3f0, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000808cabdfd7, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000fae4fbaa2d, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000e21dbea9ec, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000dbaa06bcba, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000c20e627a13, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800f34ab0d, %r1, %r12
	ldub	[%r12], %r11
	setx	0x0000008030e513e2, %r1, %r9
	setx	0xabb490ddd8a97ea8, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800edec28a, %r1, %r9
	setx	0xfd7e187282eb839e, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800fdbb101, %r1, %r9
	setx	0x9eae5f29105df0ea, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c0610da8f3, %r1, %r9
	setx	0x5e4ddccbc4ef06cf, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000df9541e021, %r1, %r9
	setx	0xd1233a9bc9dfa9df, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e1db4c5861, %r1, %r9
	setx	0x33dc73876b6b72cb, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f0d63e22f8, %r1, %r9
	setx	0x5cac8c200cdb98b8, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800eec9f45, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000802d29a309, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000f1d9ba4a36, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000ee906273a7, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000d73e69dd39, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000c4c8e06399, %r1, %r12
	ldub	[%r12], %r11
	setx	0x0000008025ed1b07, %r1, %r9
	setx	0x66eb0d01a538c549, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800ee34dc0, %r1, %r9
	setx	0x1326dd2d177d4460, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800fce4682, %r1, %r9
	setx	0x00b10caefccafc17, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000cdf0a66007, %r1, %r9
	setx	0x2cfa1c25259a049f, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000dbe6afe063, %r1, %r9
	setx	0x46c26fbb3694c4d1, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e752b39a8b, %r1, %r9
	setx	0x3db5a00a22822979, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f7470380ac, %r1, %r9
	setx	0xfe14cdcf667bb4e5, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e2dd720111, %r1, %r12
	ldub	[%r12], %r11
	setx	0x00000080d48646f8, %r1, %r9
	setx	0xa8f9096c65e32610, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800edb25e3, %r1, %r9
	setx	0xc5daac1ab20ebd2e, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800fce10a7, %r1, %r9
	setx	0x26581287f3aeac73, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000cffc4965a7, %r1, %r9
	setx	0x9d527de11d2657dc, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d2d7be129b, %r1, %r9
	setx	0xc9c64cb3319fe13e, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000eba13e88b4, %r1, %r9
	setx	0xaf7e0d28cdbc6fb1, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f9ecb00e95, %r1, %r9
	setx	0x9deae93963a00992, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000cb13f4c621, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800fe652f9, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800e411835, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000803671f5c3, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000f4fbae08e2, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000e3647e53a5, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000de3c068e7e, %r1, %r12
	ldub	[%r12], %r11
	setx	0x00000080e9993325, %r1, %r9
	setx	0xb6b16dea3bc8dbbf, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e2ef9fa, %r1, %r9
	setx	0x49ea4cc3353c35cf, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f39c594, %r1, %r9
	setx	0x83c6e202c8966698, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c0d5f344ff, %r1, %r9
	setx	0xb5480cb6d58be052, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000dfe68a9ec2, %r1, %r9
	setx	0x55f0de121c956a13, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ef62ecc9c7, %r1, %r9
	setx	0xdf5299275ede3498, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000fb7bf7ebf8, %r1, %r9
	setx	0x10262198f413f223, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e4e5058, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000807af163a5, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000f09ae18097, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000efa529e3c7, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000d0b76df92d, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000c87b7e3f79, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800f6cda5c, %r1, %r12
	ldub	[%r12], %r11
	setx	0x0000008036e76402, %r1, %r9
	setx	0x1ff077170d8a695d, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e3ade88, %r1, %r9
	setx	0x2fd09b71183ee1b5, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f63a1f5, %r1, %r9
	setx	0xe1df6fd4b21a0a32, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c2120c1993, %r1, %r9
	setx	0xdb1b93d406809fae, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d2fbc7e587, %r1, %r9
	setx	0x51b78861a8e582a0, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ef589df49c, %r1, %r9
	setx	0xb013e48c9c1354cd, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f778242b57, %r1, %r9
	setx	0x63d4d5c2a0958af4, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c9f427de12, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800f6696db, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800e285385, %r1, %r12
	ldub	[%r12], %r11
	setx	0x00000080d48e7802, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000f5462c5dac, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000e247a2f1e5, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000806ce9bc04, %r1, %r9
	setx	0x4bb0f3755e8518bc, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e2b9893, %r1, %r9
	setx	0x9b14b4f8c8a1f311, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800fcd85c4, %r1, %r9
	setx	0x86b912d180a5804a, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c1092cad4a, %r1, %r9
	setx	0xe899ef5885b35fa5, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000da7dadc416, %r1, %r9
	setx	0xfdb639aef7b33863, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e8202b358d, %r1, %r9
	setx	0x4cbfcc440dbc15bc, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f14af0b3e9, %r1, %r9
	setx	0x962062102294b712, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000805919961f, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000f2bc67c8ac, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000e693802627, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000d8fdcbd238, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000c4ab19d94c, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800ff3f7a6, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800ed7632d, %r1, %r12
	ldub	[%r12], %r11
	setx	0x00000080b999f150, %r1, %r9
	setx	0x5cdf26b7f815a5da, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e5e5281, %r1, %r9
	setx	0x3e921855a37ce9f1, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f846623, %r1, %r9
	setx	0x136435b2c209ef7e, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c7e82ef8cf, %r1, %r9
	setx	0x9049f853594ce19e, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d553aba721, %r1, %r9
	setx	0x244f1b300f7a43e1, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e5976b2cc3, %r1, %r9
	setx	0xd8fcb065a9521625, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f988b9e419, %r1, %r9
	setx	0x30910678217ac359, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f1942a5, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800e0e2664, %r1, %r12
	ldub	[%r12], %r11
	setx	0x0000008049d51150, %r1, %r12
	ldub	[%r12], %r11
	setx	0x00000080b67aedec, %r1, %r9
	setx	0x18147164b795524f, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800edd932a, %r1, %r9
	setx	0x1d85f42e92d49bfc, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800fb41038, %r1, %r9
	setx	0x07a99767e5379ae7, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c11f48def9, %r1, %r9
	setx	0xf612480059a360e5, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d483711470, %r1, %r9
	setx	0xf7ea073f7cb614c1, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e1cb887c71, %r1, %r9
	setx	0xdc6d9363c5f5aa9d, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f61a778bd4, %r1, %r9
	setx	0x12ed365b6d46715c, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f4f4e8c096, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000e0ac6dd6b4, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000da7014a0a9, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000c5dce576d6, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800fb5c172, %r1, %r12
	ldub	[%r12], %r11
	setx	0x0000008023394a90, %r1, %r9
	setx	0xdfa71ccc49fefb24, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800eb45d3f, %r1, %r9
	setx	0xe23f67c79c5920ab, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f5d4315, %r1, %r9
	setx	0x92567963da65396b, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000cad4e816cd, %r1, %r9
	setx	0x5f22433799a9f2ae, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000dd26f71d78, %r1, %r9
	setx	0x033970954708ddb6, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ef30cad9ab, %r1, %r9
	setx	0x3c844a7fd4507259, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f5d301791d, %r1, %r9
	setx	0x2e8dc4eac8018730, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e6c8eed, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000806779d412, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000fc5723a0ee, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000eb3d29abcd, %r1, %r12
	ldub	[%r12], %r11
	setx	0x0000008069f9c457, %r1, %r9
	setx	0x956d04998bceaad2, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e832930, %r1, %r9
	setx	0x531da515baa420f4, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f6cfa04, %r1, %r9
	setx	0xc8688ee881a77664, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c042248c6c, %r1, %r9
	setx	0x77205b118dfd8175, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d570bbab89, %r1, %r9
	setx	0x572788eaaba13d6a, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ec27ddfa8c, %r1, %r9
	setx	0xebd31b34affdcac1, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000fe4c94e18b, %r1, %r9
	setx	0xe8f6642e6d0f2cfa, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e915d3e, %r1, %r12
	ldub	[%r12], %r11
	setx	0x00000080ab8b60dc, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000f604918963, %r1, %r12
	ldub	[%r12], %r11
	setx	0x0000008020d92eb3, %r1, %r9
	setx	0x90b74ca474969e19, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e4b9035, %r1, %r9
	setx	0x9d4f4ba88bef7587, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f3525a8, %r1, %r9
	setx	0x7858e8d32f378c7b, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c71e88fd04, %r1, %r9
	setx	0x654121eca4c2effa, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000de1a2cddef, %r1, %r9
	setx	0x3dff108037ee9aea, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e683567634, %r1, %r9
	setx	0x35c1fb048b12365e, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000fb22c8cfc4, %r1, %r9
	setx	0xc964af98efc7d199, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e322c953ec, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000d7e258fde8, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000c0008ed43c, %r1, %r12
	ldub	[%r12], %r11
	setx	0x00000080cdde9e11, %r1, %r9
	setx	0xa3193c3ec80e3702, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800ef1eef7, %r1, %r9
	setx	0x8eb696e1dd9a0fb4, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f3852af, %r1, %r9
	setx	0xe2c2ce83d9ef2e6b, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000cdd3b717dc, %r1, %r9
	setx	0xd8feb4f6856501b4, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d9d380450a, %r1, %r9
	setx	0xf29a736aee68f748, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000eaaeb5a50e, %r1, %r9
	setx	0x03561676667dbb69, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000fc5c6aa1f7, %r1, %r9
	setx	0xb3a94e3a2ee574ec, %r1, %r10
	stb	%r10, [%r9]
	setx	0x00000080e52de65b, %r1, %r9
	setx	0xecce067d9fbff9b1, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e19e636, %r1, %r9
	setx	0xb71e27a86db0a997, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f1b9c28, %r1, %r9
	setx	0x31e90070834233eb, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c0bbee425d, %r1, %r9
	setx	0xf6bab3f64c38ef96, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d56f6122aa, %r1, %r9
	setx	0x9842127d11e44132, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e989dddd43, %r1, %r9
	setx	0x1fdfeec15fb91193, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f2eb8dba99, %r1, %r9
	setx	0x36c9fb78a152d9db, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000dae30eb9e9, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000c346892a08, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800f088cfb, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800ecf653d, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000802bdc797f, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000f0f2bbfb27, %r1, %r12
	ldub	[%r12], %r11
	setx	0x00000080a2ce1072, %r1, %r9
	setx	0x8d025cc7116ee0c6, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e1af945, %r1, %r9
	setx	0xc947a06fa0d9cc7d, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f074339, %r1, %r9
	setx	0x30515a1762d605ae, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c7d9426924, %r1, %r9
	setx	0x9e7c0a04d9b526af, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d4e5034a09, %r1, %r9
	setx	0x695beda9dda5d33a, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e692d741e8, %r1, %r9
	setx	0x50da6d391fadfc7b, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f27cdbaaee, %r1, %r9
	setx	0x9bb752ce2806b7a0, %r1, %r10
	stb	%r10, [%r9]
	setx	0x00000080a71e5569, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000f31935181b, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000e80be39274, %r1, %r12
	ldub	[%r12], %r11
	setx	0x00000080cd1d4872, %r1, %r9
	setx	0x23ff5ca5cf79bdc7, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e566aaf, %r1, %r9
	setx	0x5f55085697667971, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f43c635, %r1, %r9
	setx	0x0f5fc7a054c3f6c6, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c6f8db2352, %r1, %r9
	setx	0x066db555bc13653a, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d472b51890, %r1, %r9
	setx	0xc93668e8158d21a7, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ee02ebafcc, %r1, %r9
	setx	0xe5a63ca73387fa1c, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f673504b20, %r1, %r9
	setx	0xb36ca612de170b91, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e7f5138, %r1, %r12
	ldub	[%r12], %r11
	setx	0x00000080387da6eb, %r1, %r9
	setx	0xd503d935776f8ceb, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e4029fb, %r1, %r9
	setx	0xd86ec90a08753840, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800fbff315, %r1, %r9
	setx	0x4a687d7bd3fe0ff9, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c265063555, %r1, %r9
	setx	0x65b8786762a3b077, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d474ee782d, %r1, %r9
	setx	0x92f5dbb58b847584, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e8e8d293dc, %r1, %r9
	setx	0x7972bef0c86a6014, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000fdef4a59f7, %r1, %r9
	setx	0x47d755195f10e1bb, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800eec9f45, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000802d29a309, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000f1d9ba4a36, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000ee906273a7, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000d73e69dd39, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000c4c8e06399, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800f5ab711, %r1, %r12
	ldub	[%r12], %r11
	setx	0x00000080e91be48c, %r1, %r9
	setx	0x82c5c6272f1bdb8c, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800ed9d3b0, %r1, %r9
	setx	0x38d9a9b036130fdd, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f975e8b, %r1, %r9
	setx	0xea85b95305185406, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000cdb4f95098, %r1, %r9
	setx	0xe036c879f40dd9a9, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000de5c22095e, %r1, %r9
	setx	0xdce26e3b129a1b0f, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ea49307d11, %r1, %r9
	setx	0xc83028704ba014c1, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f808e52fd9, %r1, %r9
	setx	0xbcc1bf93882c2574, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e7902c0, %r1, %r12
	ldub	[%r12], %r11
	setx	0x00000080bbf81fe5, %r1, %r9
	setx	0x5716c2ec0a32c7ff, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e6d34f9, %r1, %r9
	setx	0x3fe44f22b2b8cb01, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800fefa38c, %r1, %r9
	setx	0x9f592617476456f4, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000cdf665d7d6, %r1, %r9
	setx	0xc60a1f2ec9bffdf2, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000da5887700f, %r1, %r9
	setx	0xd141334c139df400, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e8671f0b57, %r1, %r9
	setx	0xa53f0baf419ecddd, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f0d0e52bd8, %r1, %r9
	setx	0xdafe7f396761d9ee, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e20f214, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000804daba96a, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000feddf75e2f, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000eebeedc6af, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000d0f181911b, %r1, %r12
	ldub	[%r12], %r11
	setx	0x00000080a4febfa6, %r1, %r9
	setx	0x60e2f0fabea15f03, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800ec70c4a, %r1, %r9
	setx	0x336632aa29147f83, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800fe109a2, %r1, %r9
	setx	0x5f069769a5d1c474, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c6ca85da69, %r1, %r9
	setx	0x499cacfce6ff5d60, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d9965d7c2e, %r1, %r9
	setx	0xe12c53092a39c081, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e344cc16ba, %r1, %r9
	setx	0x7247162f952996b6, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f0472a8be9, %r1, %r9
	setx	0x20edf7e5dc4d8a69, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ddb3b2c5a9, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000c8d85ab450, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800f768868, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800e76d389, %r1, %r12
	ldub	[%r12], %r11
	setx	0x00000080a54b1cfe, %r1, %r9
	setx	0x213dfac449e69baa, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800ea9c8a4, %r1, %r9
	setx	0x9904137f1240f8cc, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f6846a6, %r1, %r9
	setx	0x1f0b8e2df9f505b6, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c09fc001e7, %r1, %r9
	setx	0xc70366b22076a28d, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000df69dead6c, %r1, %r9
	setx	0x7b73e561b479bdff, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e214fa5c47, %r1, %r9
	setx	0x08b75657d384c46c, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000fa2a19bcbd, %r1, %r9
	setx	0x9139d3cc6b4f1c4e, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e131e82, %r1, %r12
	ldub	[%r12], %r11
	setx	0x00000080f900eb13, %r1, %r9
	setx	0xfc79a9670dc6f89e, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e51e84a, %r1, %r9
	setx	0x31598f3402f0274a, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f0b3965, %r1, %r9
	setx	0x89ec5cd62c820842, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c2536db443, %r1, %r9
	setx	0xb1fe6e137a161092, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000de3cb982b7, %r1, %r9
	setx	0x83fd3e5f3e7781b7, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ecfc3f29ac, %r1, %r9
	setx	0x0e9848b394142e07, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f4bef659d6, %r1, %r9
	setx	0xd86fc7cfcf9fd536, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f823145, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800e131e82, %r1, %r12
	ldub	[%r12], %r11
	setx	0x00000080fa98d495, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000f6d9123785, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000ef4accdc68, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000d8d31371e9, %r1, %r12
	ldub	[%r12], %r11
	setx	0x00000080fb2ec1d1, %r1, %r9
	setx	0x44e9feb0f9ed3b32, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e74f8c0, %r1, %r9
	setx	0x7b2996841e6d0e95, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800fdcae15, %r1, %r9
	setx	0xc940bb98560b79c7, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ce4e386d10, %r1, %r9
	setx	0x6ef32c0f62fc5bed, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d126a71ef1, %r1, %r9
	setx	0xfb3d055532a06884, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ea7344c2a4, %r1, %r9
	setx	0xcf66cb3c64bdf865, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000feadc07722, %r1, %r9
	setx	0xae4f02965c565eac, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000801830bd53, %r1, %r12
	ldub	[%r12], %r11
	setx	0x0000008099cc6fe4, %r1, %r9
	setx	0xb8aa58c6c02aa1a5, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800eaee3d8, %r1, %r9
	setx	0x4c11d3efbc2fed99, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f230a3a, %r1, %r9
	setx	0xfb5aa70dd5b3a3a1, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000cf54c4e68f, %r1, %r9
	setx	0xa6aea34697e50ab7, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000dc286a0baf, %r1, %r9
	setx	0x6c7eca24f0f017c5, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000eba294d85e, %r1, %r9
	setx	0x9966d94e7682cf1f, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000fa4680b1f7, %r1, %r9
	setx	0xf3760e16b4ae8f81, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e8ede53, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000807769dc90, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000f55f356f44, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000ec0c8264d9, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000dc68cf0bda, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000cf8035d582, %r1, %r12
	ldub	[%r12], %r11
	setx	0x00000080f97edbb8, %r1, %r9
	setx	0x1ea8373b2db09764, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e080c72, %r1, %r9
	setx	0xf8c02199da246445, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f809aad, %r1, %r9
	setx	0x7bd5eed427e34cf2, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000cc5d4c7b5a, %r1, %r9
	setx	0xdaf69a60d60f9187, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000db8904d2b7, %r1, %r9
	setx	0xb364bdc9251aaf99, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000efd8149250, %r1, %r9
	setx	0xc72dc15680cc4522, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f64d348a39, %r1, %r9
	setx	0x8da1bd5b60b0a2e7, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e90ae26d27, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000d0cf5f7a1c, %r1, %r12
	ldub	[%r12], %r11
	setx	0x0000008068c3353f, %r1, %r9
	setx	0xf2537a16530a739f, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e9bad12, %r1, %r9
	setx	0x5fbf5dd54831b8db, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f17b65d, %r1, %r9
	setx	0x7595abba81c2582b, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c6eed29e1c, %r1, %r9
	setx	0xf36b690edfba7d66, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000dbd1e3b6dc, %r1, %r9
	setx	0x74357774f6d48bf2, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e2055e4f03, %r1, %r9
	setx	0x673b78fd2cb245bc, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f36f9e71c6, %r1, %r9
	setx	0xf4335c08314876df, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c052d7e1a0, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800f8df070, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800e69e5b5, %r1, %r12
	ldub	[%r12], %r11
	setx	0x00000080f0896fd1, %r1, %r12
	ldub	[%r12], %r11


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
!!#   uint64 jbi0, jbi1, jbi2, jbi3, jbi4, jbi5, jbi6, jbi_addr,jbi_config;
!!#   int addr_sel = 0;
!!#   int store_addr = 0;
!!#   int rnd_cnt = 0;
!!#   int invalid_config = 1;
!!#   int config_cnt = 0;
!!#   int fr_done = 0;
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
!!# 
!!#   int     rnd_n,b_sz;
!!# 
!!# #define MY_HYP_SEC	0
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
!!#   ! Define address patterns for all the various address
!!#   ! spaces in JBI
!!# 
!!#   ! 80_1000_0000 - 80_FFFF_FFFF (Should not be 80_0*)
!!#   IJ_set_rvar ("diag.j", 142, Rv_jbiaddr_pattern0,
!!#         "24'{0},"
!!# 
!!#         "20'b 1000 0000 rrr1 rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr r000,");
!!# 
!!#   ! 80_0E00_0000 - 80_0EFF_FFFF
!!#   IJ_set_rvar ("diag.j", 151, Rv_jbiaddr_pattern1,
!!#         "24'{0},"
!!# 
!!#         "20'b 1000 0000 0000 1110 rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr r000,");
!!# 
!!#   ! 80_0F00_0000 - 80_0FFF_FFFF
!!#   IJ_set_rvar ("diag.j", 161, Rv_jbiaddr_pattern2,
!!#         "24'{0},"
!!# 
!!#         "20'b 1000 0000 0000 1111 rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr r000,");
!!# 
!!#   ! C0_0000_0000 - CF_FFFF_FFFF
!!#   IJ_set_rvar ("diag.j", 171, Rv_jbiaddr_pattern3,
!!#         "24'{0},"
!!# 
!!#         "20'b 1100 rrrr rrrr rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr r000,");
!!# 
!!#   ! D0_0000_0000 - DF_FFFF_FFFF
!!#   IJ_set_rvar ("diag.j", 181, Rv_jbiaddr_pattern4,
!!#         "24'{0},"
!!# 
!!#         "20'b 1101 rrrr rrrr rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr r000,");
!!# 
!!#   ! E0_0000_0000 - EF_FFFF_FFFF
!!#   IJ_set_rvar ("diag.j", 191, Rv_jbiaddr_pattern5,
!!#         "24'{0},"
!!# 
!!#         "20'b 1110 rrrr rrrr rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr r000,");
!!# 
!!#   ! F0_0000_0000 - FE_FFFF_FFFF ( Should not be FF*)
!!#   IJ_set_rvar ("diag.j", 201, Rv_jbiaddr_pattern6,
!!#         "24'{0},"
!!# 
!!#         "20'b 1111 rrr0 rrrr rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr r000,");
!!# 
!!#   ! FF_F000_0000 - FF_FFFF_FFFF 
!!#   IJ_set_rvar ("diag.j", 211, Rv_ssiaddr_pattern,
!!#         "24'{0},"
!!# 
!!#         "20'b 1111 1111 1111 rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr r000,");
!!# 
!!#   ! BYTE ALIGNED
!!# 
!!#   ! 80_1000_0000 - 80_FFFF_FFFF (Should not be 80_0*)
!!#   IJ_set_rvar ("diag.j", 222, Rv_jbi_b_addr_pattern0,
!!#         "24'{0},"
!!# 
!!#         "20'b 1000 0000 rrrr rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr rrrr,");
!!# 
!!#   ! 80_0E00_0000 - 80_0EFF_FFFF
!!#   IJ_set_rvar ("diag.j", 231, Rv_jbi_b_addr_pattern1,
!!#         "24'{0},"
!!# 
!!#         "20'b 1000 0000 0000 1110 rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr rrrr,");
!!# 
!!#   ! 80_0F00_0000 - 80_0FFF_FFFF
!!#   IJ_set_rvar ("diag.j", 241, Rv_jbi_b_addr_pattern2,
!!#         "24'{0},"
!!# 
!!#         "20'b 1000 0000 0000 1111 rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr rrrr,");
!!# 
!!#   ! C0_0000_0000 - CF_FFFF_FFFF
!!#   IJ_set_rvar ("diag.j", 251, Rv_jbi_b_addr_pattern3,
!!#         "24'{0},"
!!# 
!!#         "20'b 1100 rrrr rrrr rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr rrrr,");
!!# 
!!#   ! D0_0000_0000 - DF_FFFF_FFFF
!!#   IJ_set_rvar ("diag.j", 261, Rv_jbi_b_addr_pattern4,
!!#         "24'{0},"
!!# 
!!#         "20'b 1101 rrrr rrrr rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr rrrr,");
!!# 
!!#   ! E0_0000_0000 - EF_FFFF_FFFF
!!#   IJ_set_rvar ("diag.j", 271, Rv_jbi_b_addr_pattern5,
!!#         "24'{0},"
!!# 
!!#         "20'b 1110 rrrr rrrr rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr rrrr,");
!!# 
!!#   ! F0_0000_0000 - FE_FFFF_FFFF ( Should not be FF*)
!!#   IJ_set_rvar ("diag.j", 281, Rv_jbi_b_addr_pattern6,
!!#         "24'{0},"
!!# 
!!#         "20'b 1111 rrrr rrrr rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr rrrr,");
!!# 
!!#   ! FF_F000_0000 - FF_FFFF_FFFF 
!!#   IJ_set_rvar ("diag.j", 291, Rv_ssi_b_addr_pattern,
!!#         "24'{0},"
!!# 
!!#         "20'b 1111 1111 1111 rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr rrrr,");
!!# 
!!#   ! HWORD ADDRESS
!!# 
!!#   ! 80_1000_0000 - 80_FFFF_FFFF (Should not be 80_0*)
!!#   IJ_set_rvar ("diag.j", 303, Rv_jbi_h_addr_pattern0,
!!#         "24'{0},"
!!# 
!!#         "20'b 1000 0000 rrr1 rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr rrr0,");
!!# 
!!#   ! 80_0E00_0000 - 80_0EFF_FFFF
!!#   IJ_set_rvar ("diag.j", 312, Rv_jbi_h_addr_pattern1,
!!#         "24'{0},"
!!# 
!!#         "20'b 1000 0000 0000 1110 rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr rrr0,");
!!# 
!!#   ! 80_0F00_0000 - 80_0FFF_FFFF
!!#   IJ_set_rvar ("diag.j", 322, Rv_jbi_h_addr_pattern2,
!!#         "24'{0},"
!!# 
!!#         "20'b 1000 0000 0000 1111 rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr rrr0,");
!!# 
!!#   ! C0_0000_0000 - CF_FFFF_FFFF
!!#   IJ_set_rvar ("diag.j", 332, Rv_jbi_h_addr_pattern3,
!!#         "24'{0},"
!!# 
!!#         "20'b 1100 rrrr rrrr rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr rrr0,");
!!# 
!!#   ! D0_0000_0000 - DF_FFFF_FFFF
!!#   IJ_set_rvar ("diag.j", 342, Rv_jbi_h_addr_pattern4,
!!#         "24'{0},"
!!# 
!!#         "20'b 1101 rrrr rrrr rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr rrr0,");
!!# 
!!#   ! E0_0000_0000 - EF_FFFF_FFFF
!!#   IJ_set_rvar ("diag.j", 352, Rv_jbi_h_addr_pattern5,
!!#         "24'{0},"
!!# 
!!#         "20'b 1110 rrrr rrrr rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr rrr0,");
!!# 
!!#   ! F0_0000_0000 - FE_FFFF_FFFF ( Should not be FF*)
!!#   IJ_set_rvar ("diag.j", 362, Rv_jbi_h_addr_pattern6,
!!#         "24'{0},"
!!# 
!!#         "20'b 1111 rrr0 rrrr rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr rrr0,");
!!# 
!!#   ! FF_F000_0000 - FF_FFFF_FFFF 
!!#   IJ_set_rvar ("diag.j", 372, Rv_ssi_h_addr_pattern,
!!#         "24'{0},"
!!# 
!!#         "20'b 1111 1111 1111 rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr rrr0,");
!!# 
!!#   ! WORD Address
!!# 
!!#   ! 80_1000_0000 - 80_FFFF_FFFF (Should not be 80_0*)
!!#   IJ_set_rvar ("diag.j", 383, Rv_jbi_w_addr_pattern0,
!!#         "24'{0},"
!!# 
!!#         "20'b 1000 0000 rrr1 rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr rr00,");
!!# 
!!#   ! 80_0E00_0000 - 80_0EFF_FFFF
!!#   IJ_set_rvar ("diag.j", 392, Rv_jbi_w_addr_pattern1,
!!#         "24'{0},"
!!# 
!!#         "20'b 1000 0000 0000 1110 rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr rr00,");
!!# 
!!#   ! 80_0F00_0000 - 80_0FFF_FFFF
!!#   IJ_set_rvar ("diag.j", 402, Rv_jbi_w_addr_pattern2,
!!#         "24'{0},"
!!# 
!!#         "20'b 1000 0000 0000 1111 rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr rr00,");
!!# 
!!#   ! C0_0000_0000 - CF_FFFF_FFFF
!!#   IJ_set_rvar ("diag.j", 412, Rv_jbi_w_addr_pattern3,
!!#         "24'{0},"
!!# 
!!#         "20'b 1100 rrrr rrrr rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr rr00,");
!!# 
!!#   ! D0_0000_0000 - DF_FFFF_FFFF
!!#   IJ_set_rvar ("diag.j", 422, Rv_jbi_w_addr_pattern4,
!!#         "24'{0},"
!!# 
!!#         "20'b 1101 rrrr rrrr rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr rr00,");
!!# 
!!#   ! E0_0000_0000 - EF_FFFF_FFFF
!!#   IJ_set_rvar ("diag.j", 432, Rv_jbi_w_addr_pattern5,
!!#         "24'{0},"
!!# 
!!#         "20'b 1110 rrrr rrrr rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr rr00,");
!!# 
!!#   ! F0_0000_0000 - FE_FFFF_FFFF ( Should not be FF*)
!!#   IJ_set_rvar ("diag.j", 442, Rv_jbi_w_addr_pattern6,
!!#         "24'{0},"
!!# 
!!#         "20'b 1111 rrr0 rrrr rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr rr00,");
!!# 
!!#   ! FF_F000_0000 - FF_FFFF_FFFF 
!!#   IJ_set_rvar ("diag.j", 452, Rv_ssi_w_addr_pattern,
!!#         "24'{0},"
!!# 
!!#         "20'b 1111 1111 1111 rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr rr00,");
!!# 
!!#   ! Other  cases ?? when LOW TH and HG TH are random, HI>LO always (TBD)
!!# 
!!#   IJ_set_rvar ("diag.j", 461, Rv_jbi_fifo_wr0_config,
!!#         "24'{0},"
!!# 
!!#         "20'b 0000 0000 0rrr 0rrr 00rr,"
!!#         "20'b 00rr rrrr 0000 0000 rrrr,");
!!# 
!!#   IJ_set_rvar ("diag.j", 469, Rv_jbi_fifo_wr1_config,
!!#         "24'{0},"
!!# 
!!#         "20'b 0000 0000 0rrr 0rrr 00rr,"
!!#         "20'b 00rr rrrr 1rrr 0000 rrrr,");
!!# 
!!#   IJ_set_ropr_fld    ("diag.j", 477, ijdefault, Ft_Rs1, "{9}");  ! BASE
!!#   IJ_set_ropr_fld    ("diag.j", 478, ijdefault, Ft_Rs2, "{8}");
!!#   IJ_set_ropr_fld    ("diag.j", 479, ijdefault, Ft_Rd, "{16..23}");
!!# 
!!#   !IJ_set_ropr_fld    (ijdefault, Ft_Simm13, "13'b0 0000 0000 0000");
!!#   IJ_set_ropr_fld    ("diag.j", 482, ijdefault, Ft_Simm13, "13'b0 00rr 0000 0000");
!!# 
!!#   IJ_bind_file_group("diag.j", 486, sjm_4,"sjm_4.cmd", NULL);;
!!#   IJ_bind_file_group("diag.j", 487, sjm_5,"sjm_5.cmd", NULL);;
!!# 
!!#   IJ_bind_thread_group("diag.j", 490, th_M, 0x1);
!!# 
!!#   IJ_printf ("diag.j", 492, sjm_4, "CONFIG id=28 iosyncadr=0x7CF00BEEF00\n");
!!#   IJ_printf ("diag.j", 493, sjm_4, "TIMEOUT 10000000\n");
!!#   IJ_printf ("diag.j", 494, sjm_4, "IOSYNC\n");
!!# 
!!#   IJ_printf ("diag.j", 496, sjm_4, "#==================================================\n");
!!#   IJ_printf ("diag.j", 498, sjm_4, "#==================================================\n");
!!#   IJ_printf ("diag.j", 499, sjm_4, "\n\nLABEL_0:\n");
!!# 
!!#   IJ_printf ("diag.j", 501, sjm_5, "CONFIG id=30 iosyncadr=0x7EF00BEEF00\n");
!!#   IJ_printf ("diag.j", 502, sjm_5, "TIMEOUT 10000000\n");
!!#   IJ_printf ("diag.j", 503, sjm_5, "IOSYNC\n");
!!#   IJ_printf ("diag.j", 504, sjm_5, "#==================================================\n");
!!#   IJ_printf ("diag.j", 506, sjm_5, "#==================================================\n");
!!#   IJ_printf ("diag.j", 507, sjm_5, "\n\nLABEL_0:\n");
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
!!#   IJ_printf ("diag.j", 525, sjm_4, "\n\nBA LABEL_0\n");
!!#   IJ_printf ("diag.j", 526, sjm_5, "\n\nBA LABEL_0\n");
!!#   IJ_th_start ("diag.j", 527,Seq_Start, NULL, 2);
!!# 
!!# }
!!# 
!!# 
!!# 
!!# %%
!!# %%section map
!!# 
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
!!# 		IJ_generate ("diag.j", 655, th_M, $2);
!!# 	}
!!# ;
!!# 
!!# inst_type: set_reg9  |
!!#            sjm4      |
!!#            sjm5
!!# 
!!# {
!!# 		!IJ_generate (th_all, $2);
!!# 		!IJ_generate (th_all, $3);
!!# 		!IJ_generate (th_all, $4);
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
!!#                    IJ_printf ("diag.j", 683, sjm_4, "\n");
!!#                      sjm4_cnt++;
!!# 
!!#                      sj4_ad =  IJ_get_rvar_val64("diag.j", 686, Rv_memaddr_pattern_dma);
!!#                      sjm0_addr[sjm_wr0] = sj4_ad; 
!!#                      IJ_printf ("diag.j", 688, sjm_4, "WRITEBLK  0x%016llx +\n",sj4_ad);
!!#                      IJ_update_rvar("diag.j", 689, Rv_memaddr_pattern_dma);
!!# 
!!#                       for (i=0;i<16;i++) { 
!!#                          !IJ_printf (sjm_4, "# debug %d \n",i);
!!#                          sjm0_data[sjm_wr0][i] = IJ_get_rvar_val32("diag.j", 693, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 694, Rv_rand32);
!!#                          if (i%4 == 0) {IJ_printf ("diag.j", 695, sjm_4, "        "); }
!!#                          IJ_printf ("diag.j", 696, sjm_4, "0x%08x ",sjm0_data[sjm_wr0][i]);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 698, sjm_4, "\n"); else 
!!#                             IJ_printf ("diag.j", 699, sjm_4, "+\n");
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
!!#                    IJ_printf ("diag.j", 712, sjm_4, "\n");
!!#                      sjm4_cnt--;
!!# 
!!#                      sj4_ad = sjm0_addr[sjm_rd0];
!!#                      IJ_printf ("diag.j", 717, sjm_4, "READBLK  0x%016llx +\n",sj4_ad);
!!# 
!!#                       for (i=0;i<16;i++) { 
!!#                          sjm4_dat = sjm0_data[sjm_rd0][i];
!!#                          if (i%4 == 0) IJ_printf ("diag.j", 721, sjm_4, "        ");
!!#                          IJ_printf ("diag.j", 722, sjm_4, "0x%08x ",sjm4_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 724, sjm_4, "\n"); else 
!!#                             IJ_printf ("diag.j", 725, sjm_4, "+\n");
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
!!#                    IJ_printf ("diag.j", 739, sjm_4, "\n");
!!#                      !sjm4_cnt--;
!!# 
!!#  		     sjm0_w_mask =  IJ_get_rvar_val32("diag.j", 743, Rv_rand_mask);
!!#                      IJ_update_rvar("diag.j", 744, Rv_rand_mask);
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
!!#                      IJ_printf ("diag.j", 761, sjm_4, "WRITEMSK  0x%016llx 0x%016llx +\n",sj4_ad,mask);
!!# 
!!#                       m_tmp = sjm0_w_mask;
!!#                       for (i=0;i<16;i++) { 
!!#                        if (m_tmp & 0x1 ) {
!!#                          sjm0_data[sjm_rd0][i] = IJ_get_rvar_val32("diag.j", 766, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 767, Rv_rand32);
!!#                          sjm4_dat = sjm0_data[sjm_rd0][i];
!!#                          if (i%4 == 0) IJ_printf ("diag.j", 769, sjm_4, "        ");
!!#                          IJ_printf ("diag.j", 770, sjm_4, "0x%08x ",sjm4_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 772, sjm_4, "\n"); else 
!!#                             IJ_printf ("diag.j", 773, sjm_4, "+\n");
!!#                            }
!!#                         } else {
!!#                          !sjm4_dat = sjm0_data[sjm_rd0][i];
!!#                          sjm4_dat = 0;
!!#                          if (i%4 == 0) IJ_printf ("diag.j", 778, sjm_4, "        ");
!!#                          IJ_printf ("diag.j", 779, sjm_4, "0x%08x ",sjm4_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 781, sjm_4, "\n"); else 
!!#                             IJ_printf ("diag.j", 782, sjm_4, "+\n");
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
!!#                    IJ_printf ("diag.j", 799, sjm_4, "\n");
!!#                      sjm4_cnt_io++;
!!# 
!!#                      sj4_ad =  IJ_get_rvar_val64("diag.j", 802, Rv_memaddr_pattern_io);
!!#                      sjm0_addr_io[sjm_wr0_io] = sj4_ad; 
!!#                      IJ_printf ("diag.j", 804, sjm_4, "WRITEBLKIO  0x%016llx +\n",sj4_ad);
!!#                      IJ_update_rvar("diag.j", 805, Rv_memaddr_pattern_io);
!!# 
!!#                       for (i=0;i<16;i++) { 
!!#                          !IJ_printf (sjm_4, "# debug %d \n",i);
!!#                          sjm0_data_io[sjm_wr0_io][i] = IJ_get_rvar_val32("diag.j", 809, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 810, Rv_rand32);
!!#                          if (i%4 == 0) {IJ_printf ("diag.j", 811, sjm_4, "        "); }
!!#                          IJ_printf ("diag.j", 812, sjm_4, "0x%08x ",sjm0_data_io[sjm_wr0_io][i]);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 814, sjm_4, "\n"); else 
!!#                             IJ_printf ("diag.j", 815, sjm_4, "+\n");
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
!!#                    IJ_printf ("diag.j", 828, sjm_4, "\n");
!!#                      sjm4_cnt_io--;
!!# 
!!#                      sj4_ad = sjm0_addr_io[sjm_rd0_io];
!!#                      IJ_printf ("diag.j", 833, sjm_4, "READBLKIO  0x%016llx +\n",sj4_ad);
!!# 
!!#                       for (i=0;i<16;i++) { 
!!#                          sjm4_dat = sjm0_data_io[sjm_rd0_io][i];
!!#                          if (i%4 == 0) IJ_printf ("diag.j", 837, sjm_4, "        ");
!!#                          IJ_printf ("diag.j", 838, sjm_4, "0x%08x ",sjm4_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 840, sjm_4, "\n"); else 
!!#                             IJ_printf ("diag.j", 841, sjm_4, "+\n");
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
!!#                    IJ_printf ("diag.j", 856, sjm_4, "\n");
!!#                      sjm4_cnt_io1++;
!!# 
!!#                      sj4_ad =  IJ_get_rvar_val64("diag.j", 859, Rv_memaddr_pattern_io);
!!#                      sjm0_addr_io1[sjm_wr0_io1] = sj4_ad; 
!!#                      IJ_printf ("diag.j", 861, sjm_4, "WRITEIO  0x%016llx ",sj4_ad);
!!#                      IJ_update_rvar("diag.j", 862, Rv_memaddr_pattern_io);
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
!!#                       IJ_printf ("diag.j", 877, sjm_4, "%d ",b_sz);
!!#                       for (i=0;i<4;i++) { 
!!#                          !IJ_printf (sjm_4, "# debug %d \n",i);
!!#                          sjm0_data_io1[sjm_wr0_io1][i] = IJ_get_rvar_val32("diag.j", 880, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 881, Rv_rand32);
!!#                          IJ_printf ("diag.j", 882, sjm_4, "0x%08x ",sjm0_data_io1[sjm_wr0_io1][i]);
!!#                          if((i==0) && ((b_sz == 1) | (b_sz == 2) | (b_sz == 4)) ) break; 
!!#                          if((i==1) && (b_sz == 8)) break; 
!!#                       }
!!#                       if ( random()%2 == 0) {
!!#                       IJ_printf ("diag.j", 887, sjm_4, "\n");
!!#                       } else {
!!#                       IJ_printf ("diag.j", 889, sjm_4, "\n");
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
!!#                    IJ_printf ("diag.j", 903, sjm_4, "\n");
!!#                      sjm4_cnt_io1--;
!!# 
!!#                      sj4_ad = sjm0_addr_io1[sjm_rd0_io1];
!!#                      b_sz   = sjm0_data_io1[sjm_rd0_io1][15];
!!#                      IJ_printf ("diag.j", 909, sjm_4, "READIO  0x%016llx %d ",sj4_ad,b_sz);
!!# 
!!#                       for (i=0;i<4;i++) {
!!#                          sjm4_dat = sjm0_data_io1[sjm_rd0_io1][i];
!!#                          IJ_printf ("diag.j", 913, sjm_4, "0x%08x ",sjm4_dat);
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
!!#                    IJ_printf ("diag.j", 928, sjm_4, "\n");
!!# 
!!#                      sj4_ad =  IJ_get_rvar_val64("diag.j", 930, Rv_memaddr_pattern_io);
!!#                      sjm0_addr_m_io[sjm_wr0_m_io] = sj4_ad; 
!!#                      IJ_update_rvar("diag.j", 932, Rv_memaddr_pattern_io);
!!# 
!!#                      sjm4_cnt_m_io++;
!!# 
!!#  		     sjm0_w_mask_m_io =  IJ_get_rvar_val32("diag.j", 938, Rv_rand_mask);
!!#                      IJ_update_rvar("diag.j", 939, Rv_rand_mask);
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
!!#                      IJ_printf ("diag.j", 966, sjm_4, "WRITEMSKIO  0x%016llx 0x%04x  ",sj4_ad,mask);
!!#                      sjm0_data_m_io[sjm_wr0_m_io][15] = mask; ! data fifo , 15 stores address
!!# 
!!#                       m_tmp = sjm0_w_mask_m_io & 0xf;
!!#                       for (i=0;i<4;i++) { 
!!#                        if (m_tmp & 0x1 ) {
!!#                          sjm0_data_m_io[sjm_wr0_m_io][i] = IJ_get_rvar_val32("diag.j", 972, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 973, Rv_rand32);
!!#                          sjm4_dat = sjm0_data_m_io[sjm_wr0_m_io][i];
!!#                          !if (i%4 == 0) IJ_printf (sjm_4, "        ");
!!#                          IJ_printf ("diag.j", 976, sjm_4, "0x%08x ",sjm4_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                              IJ_printf ("diag.j", 978, sjm_4, "\n"); 
!!#                             !if (i==15 ) IJ_printf (sjm_4, "\n"); else 
!!#                             !IJ_printf (sjm_4, "+\n");
!!#                            }
!!#                         } else {
!!#                          !sjm4_dat = sjm0_data[sjm_rd0][i];
!!#                          sjm4_dat = 0;
!!#                          sjm0_data_m_io[sjm_wr0_m_io][i] = sjm4_dat;
!!#                          !if (i%4 == 0) IJ_printf (sjm_4, "        ");
!!#                          IJ_printf ("diag.j", 987, sjm_4, "0x%08x ",sjm4_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             IJ_printf ("diag.j", 989, sjm_4, "\n"); 
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
!!#                    IJ_printf ("diag.j", 1007, sjm_4, "\n");
!!#                      sjm4_cnt_m_io--;
!!# 
!!#                      sj4_ad = sjm0_addr_m_io[sjm_rd0_m_io];
!!#                      mask   = sjm0_data_m_io[sjm_rd0_m_io][15];
!!#                      IJ_printf ("diag.j", 1013, sjm_4, "READMSKIO   0x%016llx 0x%04llx  ",sj4_ad,mask);
!!# 
!!#                       for (i=0;i<4;i++) { 
!!#                          sjm4_dat = sjm0_data_m_io[sjm_rd0_m_io][i];
!!#                          !if (i%4 == 0) IJ_printf (sjm_4, "        ");
!!#                          IJ_printf ("diag.j", 1018, sjm_4, "0x%08x ",sjm4_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             IJ_printf ("diag.j", 1020, sjm_4, "\n");
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
!!#                    IJ_printf ("diag.j", 1038, sjm_5, "\n");
!!#                      sjm5_cnt++;
!!# 
!!#                      sj5_ad =  IJ_get_rvar_val64("diag.j", 1041, Rv_memaddr_pattern_dma);
!!#                      sjm1_addr[sjm_wr1] = sj5_ad; 
!!#                      IJ_printf ("diag.j", 1043, sjm_5, "WRITEBLK  0x%016llx +\n",sj5_ad);
!!#                      IJ_update_rvar("diag.j", 1044, Rv_memaddr_pattern_dma);
!!# 
!!#                       for (i=0;i<16;i++) { 
!!#                          sjm1_data[sjm_wr1][i] = IJ_get_rvar_val32("diag.j", 1047, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 1048, Rv_rand32);
!!#                          if (i%4 == 0) IJ_printf ("diag.j", 1049, sjm_5, "        ");
!!#                          IJ_printf ("diag.j", 1050, sjm_5, "0x%08x ",sjm1_data[sjm_wr1][i]);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 1052, sjm_5, "\n"); else 
!!#                             IJ_printf ("diag.j", 1053, sjm_5, "+\n");
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
!!#                    IJ_printf ("diag.j", 1066, sjm_5, "\n");
!!#                      sjm5_cnt--;
!!# 
!!#                      sj5_ad = sjm1_addr[sjm_rd1];
!!#                      IJ_printf ("diag.j", 1071, sjm_5, "READBLK  0x%016llx +\n",sj5_ad);
!!# 
!!#                       for (i=0;i<16;i++) { 
!!#                          sjm5_dat = sjm1_data[sjm_rd1][i];
!!#                          if (i%4 == 0) IJ_printf ("diag.j", 1075, sjm_5, "        ");
!!#                          IJ_printf ("diag.j", 1076, sjm_5, "0x%08x ",sjm5_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 1078, sjm_5, "\n"); else 
!!#                             IJ_printf ("diag.j", 1079, sjm_5, "+\n");
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
!!#                    IJ_printf ("diag.j", 1093, sjm_5, "\n");
!!#                      !sjm4_cnt--;
!!# 
!!#  		     sjm1_w_mask =  IJ_get_rvar_val32("diag.j", 1097, Rv_rand_mask);
!!#                      IJ_update_rvar("diag.j", 1098, Rv_rand_mask);
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
!!#                      IJ_printf ("diag.j", 1115, sjm_5, "WRITEMSK  0x%016llx 0x%016llx +\n",sj5_ad,mask);
!!# 
!!#                       m_tmp = sjm1_w_mask;
!!#                       for (i=0;i<16;i++) { 
!!#                        if (m_tmp & 0x1 ) {
!!#                          sjm1_data[sjm_rd1][i] = IJ_get_rvar_val32("diag.j", 1120, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 1121, Rv_rand32);
!!#                          sjm5_dat = sjm1_data[sjm_rd1][i];
!!#                          if (i%4 == 0) IJ_printf ("diag.j", 1123, sjm_5, "        ");
!!#                          IJ_printf ("diag.j", 1124, sjm_5, "0x%08x ",sjm5_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 1126, sjm_5, "\n"); else 
!!#                             IJ_printf ("diag.j", 1127, sjm_5, "+\n");
!!#                            }
!!#                         } else {
!!#                          !sjm5_dat = sjm1_data[sjm_rd1][i];
!!#                          sjm5_dat = 0;
!!#                          if (i%4 == 0) IJ_printf ("diag.j", 1132, sjm_5, "        ");
!!#                          IJ_printf ("diag.j", 1133, sjm_5, "0x%08x ",sjm5_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 1135, sjm_5, "\n"); else 
!!#                             IJ_printf ("diag.j", 1136, sjm_5, "+\n");
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
!!#                    IJ_printf ("diag.j", 1153, sjm_5, "\n");
!!#                      sjm5_cnt_io++;
!!# 
!!#                      sj5_ad =  IJ_get_rvar_val64("diag.j", 1156, Rv_memaddr_pattern_io);
!!#                      sjm1_addr_io[sjm_wr1_io] = sj5_ad; 
!!#                      IJ_printf ("diag.j", 1158, sjm_5, "WRITEBLKIO  0x%016llx +\n",sj5_ad);
!!#                      IJ_update_rvar("diag.j", 1159, Rv_memaddr_pattern_io);
!!# 
!!#                       for (i=0;i<16;i++) { 
!!#                          !IJ_printf (sjm_5, "# debug %d \n",i);
!!#                          sjm1_data_io[sjm_wr1_io][i] = IJ_get_rvar_val32("diag.j", 1163, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 1164, Rv_rand32);
!!#                          if (i%4 == 0) {IJ_printf ("diag.j", 1165, sjm_5, "        "); }
!!#                          IJ_printf ("diag.j", 1166, sjm_5, "0x%08x ",sjm1_data_io[sjm_wr1_io][i]);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 1168, sjm_5, "\n"); else 
!!#                             IJ_printf ("diag.j", 1169, sjm_5, "+\n");
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
!!#                    IJ_printf ("diag.j", 1182, sjm_5, "\n");
!!#                      sjm5_cnt_io--;
!!# 
!!#                      sj5_ad = sjm1_addr_io[sjm_rd1_io];
!!#                      IJ_printf ("diag.j", 1187, sjm_5, "READBLKIO  0x%016llx +\n",sj5_ad);
!!# 
!!#                       for (i=0;i<16;i++) { 
!!#                          sjm5_dat = sjm1_data_io[sjm_rd1_io][i];
!!#                          if (i%4 == 0) IJ_printf ("diag.j", 1191, sjm_5, "        ");
!!#                          IJ_printf ("diag.j", 1192, sjm_5, "0x%08x ",sjm5_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 1194, sjm_5, "\n"); else 
!!#                             IJ_printf ("diag.j", 1195, sjm_5, "+\n");
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
!!#                    IJ_printf ("diag.j", 1211, sjm_5, "\n");
!!#                      sjm5_cnt_io1++;
!!# 
!!#                      sj5_ad =  IJ_get_rvar_val64("diag.j", 1214, Rv_memaddr_pattern_io);
!!#                      sjm1_addr_io1[sjm_wr1_io1] = sj5_ad; 
!!#                      IJ_printf ("diag.j", 1216, sjm_5, "WRITEIO  0x%016llx ",sj5_ad);
!!#                      IJ_update_rvar("diag.j", 1217, Rv_memaddr_pattern_io);
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
!!#                       IJ_printf ("diag.j", 1232, sjm_5, "%d ",b_sz);
!!#                       for (i=0;i<4;i++) { 
!!#                          !IJ_printf (sjm_5, "# debug %d \n",i);
!!#                          sjm1_data_io1[sjm_wr1_io1][i] = IJ_get_rvar_val32("diag.j", 1235, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 1236, Rv_rand32);
!!#                          IJ_printf ("diag.j", 1237, sjm_5, "0x%08x ",sjm1_data_io1[sjm_wr1_io1][i]);
!!#                          if((i==0) && ((b_sz == 1) | (b_sz == 2) | (b_sz == 4)) ) break; 
!!#                          if((i==1) && (b_sz == 8)) break; 
!!#                       }
!!#                       if ( random()%2 == 0) {
!!#                       IJ_printf ("diag.j", 1242, sjm_5, "\n");
!!#                       } else {
!!#                       IJ_printf ("diag.j", 1244, sjm_5, "\n");
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
!!#                    IJ_printf ("diag.j", 1258, sjm_5, "\n");
!!#                      sjm5_cnt_io1--;
!!# 
!!#                      sj5_ad = sjm1_addr_io1[sjm_rd1_io1];
!!#                      b_sz   = sjm1_data_io1[sjm_rd1_io1][15];
!!#                      IJ_printf ("diag.j", 1264, sjm_5, "READIO  0x%016llx %d ",sj5_ad,b_sz);
!!# 
!!#                       for (i=0;i<4;i++) {
!!#                          sjm5_dat = sjm1_data_io1[sjm_rd1_io1][i];
!!#                          IJ_printf ("diag.j", 1268, sjm_5, "0x%08x ",sjm5_dat);
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
!!#                    IJ_printf ("diag.j", 1283, sjm_5, "\n");
!!# 
!!#                      sj5_ad =  IJ_get_rvar_val64("diag.j", 1285, Rv_memaddr_pattern_io);
!!#                      sjm1_addr_m_io[sjm_wr1_m_io] = sj5_ad; 
!!#                      IJ_update_rvar("diag.j", 1287, Rv_memaddr_pattern_io);
!!# 
!!#                      sjm5_cnt_m_io++;
!!# 
!!#  		     sjm1_w_mask_m_io =  IJ_get_rvar_val32("diag.j", 1293, Rv_rand_mask);
!!#                      IJ_update_rvar("diag.j", 1294, Rv_rand_mask);
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
!!#                      IJ_printf ("diag.j", 1321, sjm_5, "WRITEMSKIO  0x%016llx 0x%04x  ",sj5_ad,mask);
!!#                      sjm1_data_m_io[sjm_wr1_m_io][15] = mask; ! data fifo , 15 stores address
!!# 
!!#                       m_tmp = sjm1_w_mask_m_io & 0xf;
!!#                       for (i=0;i<4;i++) { 
!!#                        if (m_tmp & 0x1 ) {
!!#                          sjm1_data_m_io[sjm_wr1_m_io][i] = IJ_get_rvar_val32("diag.j", 1327, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 1328, Rv_rand32);
!!#                          sjm5_dat = sjm1_data_m_io[sjm_wr1_m_io][i];
!!#                          !if (i%4 == 0) IJ_printf (sjm_5, "        ");
!!#                          IJ_printf ("diag.j", 1331, sjm_5, "0x%08x ",sjm5_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                              IJ_printf ("diag.j", 1333, sjm_5, "\n"); 
!!#                             !if (i==15 ) IJ_printf (sjm_5, "\n"); else 
!!#                             !IJ_printf (sjm_5, "+\n");
!!#                            }
!!#                         } else {
!!#                          !sjm5_dat = sjm1_data[sjm_rd1][i];
!!#                          sjm5_dat = 0;
!!#                          sjm1_data_m_io[sjm_wr1_m_io][i] = sjm5_dat;
!!#                          !if (i%4 == 0) IJ_printf (sjm_5, "        ");
!!#                          IJ_printf ("diag.j", 1342, sjm_5, "0x%08x ",sjm5_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             IJ_printf ("diag.j", 1344, sjm_5, "\n"); 
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
!!#                    IJ_printf ("diag.j", 1362, sjm_5, "\n");
!!#                      sjm5_cnt_m_io--;
!!# 
!!#                      sj5_ad = sjm1_addr_m_io[sjm_rd1_m_io];
!!#                      mask   = sjm1_data_m_io[sjm_rd1_m_io][15];
!!#                      IJ_printf ("diag.j", 1368, sjm_5, "READMSKIO   0x%016llx 0x%04llx  ",sj5_ad,mask);
!!# 
!!#                       for (i=0;i<4;i++) { 
!!#                          sjm5_dat = sjm1_data_m_io[sjm_rd1_m_io][i];
!!#                          !if (i%4 == 0) IJ_printf (sjm_5, "        ");
!!#                          IJ_printf ("diag.j", 1373, sjm_5, "0x%08x ",sjm5_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             IJ_printf ("diag.j", 1375, sjm_5, "\n");
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
!!# 
!!# set_memaddr9: mSET_MEMADDR9
!!#                 {
!!#                         ! add a mechanism to control addr1, addr5 in range ??
!!#                         ! addr
!!# 
!!#                         ! Update the JBI-CONFIG FIFO parameters
!!#                         invalid_config = 1;
!!#                         while (invalid_config) {
!!#                         if (random()%2) {
!!#                         !if (config_cnt > 500 ) {
!!#                         jbi_config = IJ_get_rvar_val64("diag.j", 1402, Rv_jbi_fifo_wr0_config);
!!# 			IJ_update_rvar("diag.j", 1403, Rv_jbi_fifo_wr0_config);
!!#                         } else {
!!#                         jbi_config = IJ_get_rvar_val64("diag.j", 1405, Rv_jbi_fifo_wr1_config);
!!# 			IJ_update_rvar("diag.j", 1406, Rv_jbi_fifo_wr1_config);
!!#                         }
!!#                         if (((jbi_config>>24) & 0x7) < ((jbi_config>>28) & 0x7)) {
!!#                         invalid_config = 0;
!!#                          }
!!#                         }
!!#                         config_cnt = config_cnt + 1;
!!# 
!!#                         if (fr_done == 0) {
!!#                          fr_done = 1;
!!#                         IJ_printf ("diag.j", 1416, th_M, "\tsetx\t0x%016llx, %%r1, %%r9\n",
!!#                                 jbi_config);
!!#                         IJ_printf ("diag.j", 1418, th_M, "\tsetx\t0x8000000008, %%r1, %%r10\n");
!!#                         IJ_printf ("diag.j", 1419, th_M, "\tstx\t%%r9, [%%r10]\n");
!!#                         IJ_printf ("diag.j", 1420, th_M, "\n\n\n");
!!#                         IJ_printf ("diag.j", 1421, th_M, "!***********************************************************************\n");
!!#                         IJ_printf ("diag.j", 1422, th_M, "!IOSYNC cycles to start sjm\n");
!!#                         IJ_printf ("diag.j", 1423, th_M, "!***********************************************************************\n");
!!#                         IJ_printf ("diag.j", 1424, th_M, "\tsetx 0xdeadbeefdeadbeef, %%g1, %%g2\n");
!!#                         IJ_printf ("diag.j", 1425, th_M, "\tsetx 0xcf00beef00, %%g1, %%g3\n");
!!#                         IJ_printf ("diag.j", 1426, th_M, "\tstx %%g2, [%%g3]\n");
!!#                         IJ_printf ("diag.j", 1427, th_M, "!***********************************************************************\n");
!!#                         IJ_printf ("diag.j", 1428, th_M, "!IOSYNC cycles to start sjm\n");
!!#                         IJ_printf ("diag.j", 1429, th_M, "!***********************************************************************\n");
!!#                         IJ_printf ("diag.j", 1430, th_M, "\tsetx 0xdeadbeefdeadbeef, %%g1, %%g2\n");
!!#                         IJ_printf ("diag.j", 1431, th_M, "\tsetx 0xef00beef00, %%g1, %%g3\n");
!!#                         IJ_printf ("diag.j", 1432, th_M, "\tstx %%g2, [%%g3]\n");
!!#                         IJ_printf ("diag.j", 1433, th_M, "\n\n\n");
!!# 
!!#                         }
!!# 
!!#                         jbi0 = IJ_get_rvar_val64("diag.j", 1438, Rv_jbi_b_addr_pattern0);
!!# 
!!#                         ! to remove address not in dma-fake range
!!#                         while (jbi0 < 550024249344 ) {
!!#                         jbi0 = IJ_get_rvar_val64("diag.j", 1443, Rv_jbi_b_addr_pattern0);
!!# 			IJ_update_rvar("diag.j", 1444, Rv_jbi_b_addr_pattern0);
!!#                         }
!!# 
!!#                         jbi1 = IJ_get_rvar_val64("diag.j", 1447, Rv_jbi_b_addr_pattern1);
!!#                         jbi2 = IJ_get_rvar_val64("diag.j", 1448, Rv_jbi_b_addr_pattern2);
!!#                         jbi3 = IJ_get_rvar_val64("diag.j", 1449, Rv_jbi_b_addr_pattern3);
!!#                         jbi4 = IJ_get_rvar_val64("diag.j", 1450, Rv_jbi_b_addr_pattern4);
!!#                         jbi5 = IJ_get_rvar_val64("diag.j", 1451, Rv_jbi_b_addr_pattern5);
!!# 
!!#                         jbi6 = IJ_get_rvar_val64("diag.j", 1453, Rv_jbi_b_addr_pattern6);
!!#                         ! to remove address not in dma-fake range
!!#                         while (jbi6 > 1095216660479)  {
!!#                         jbi6 = IJ_get_rvar_val64("diag.j", 1456, Rv_jbi_b_addr_pattern6);
!!# 			IJ_update_rvar("diag.j", 1457, Rv_jbi_b_addr_pattern6);
!!#                         }
!!# 
!!# 			IJ_update_rvar("diag.j", 1460, Rv_jbi_b_addr_pattern0);
!!# 			IJ_update_rvar("diag.j", 1461, Rv_jbi_b_addr_pattern1);
!!# 			IJ_update_rvar("diag.j", 1462, Rv_jbi_b_addr_pattern2);
!!# 			IJ_update_rvar("diag.j", 1463, Rv_jbi_b_addr_pattern3);
!!# 			IJ_update_rvar("diag.j", 1464, Rv_jbi_b_addr_pattern4);
!!# 			IJ_update_rvar("diag.j", 1465, Rv_jbi_b_addr_pattern5);
!!# 			IJ_update_rvar("diag.j", 1466, Rv_jbi_b_addr_pattern6);
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
!!#                         b_ADDR_ARRAY[b_a_wr_cntr] = jbi0; b_a_wr_cntr = b_a_wr_cntr + 1; ! store the stx address
!!#                         b_ADDR_ARRAY[b_a_wr_cntr] = jbi1; b_a_wr_cntr = b_a_wr_cntr + 1; ! store the stx address
!!#                         b_ADDR_ARRAY[b_a_wr_cntr] = jbi2; b_a_wr_cntr = b_a_wr_cntr + 1; ! store the stx address
!!#                         b_ADDR_ARRAY[b_a_wr_cntr] = jbi3; b_a_wr_cntr = b_a_wr_cntr + 1; ! store the stx address
!!#                         b_ADDR_ARRAY[b_a_wr_cntr] = jbi4; b_a_wr_cntr = b_a_wr_cntr + 1; ! store the stx address
!!#                         b_ADDR_ARRAY[b_a_wr_cntr] = jbi5; b_a_wr_cntr = b_a_wr_cntr + 1; ! store the stx address
!!#                         b_ADDR_ARRAY[b_a_wr_cntr] = jbi6; b_a_wr_cntr = b_a_wr_cntr + 1; ! store the stx address
!!# 
!!#                         for (i=0;i<7;i++) {
!!#                         b_DATA_ARRAY[b_wr_cntr] = IJ_get_rvar_val64("diag.j", 1492, Rv_rand64);
!!# 			IJ_update_rvar("diag.j", 1493, Rv_rand64);
!!#                         data_st = b_DATA_ARRAY[b_wr_cntr];
!!#                         addr_st = b_ADDR_ARRAY[b_a_wr_cntr -7 + i];
!!#                         IJ_printf ("diag.j", 1496, th_M, "\tsetx\t0x%016llx, %%r1, %%r9\n",
!!#                                 addr_st);
!!#                         IJ_printf ("diag.j", 1498, th_M, "\tsetx\t0x%016llx, %%r1, %%r10\n",
!!#                                 data_st);
!!#                         IJ_printf ("diag.j", 1500, th_M, "\tstb\t%%r10, [%%r9]\n");
!!# 
!!#                         b_wr_cntr++;
!!#                         } ! end for 
!!# 
!!#                         !IJ_printf (th_M, "\tsetx\t0x%016llx, %%r1, %%r9\n",
!!#                         !        jbi_config);
!!#                         !IJ_printf (th_M, "\tsetx\t0x8000000008, %%r1, %%r10\n");
!!#                         !IJ_printf (th_M, "\tldx\t[%%r10], %%r15\n");
!!#                         !IJ_printf (th_M, "\tsetx\t0x0000000000000f00, %%r1, %%r5\n");
!!#                         !IJ_printf (th_M, "\tand\t%%r15, %%r5, %%r15\n");
!!#                         !IJ_printf (th_M, "\tnot\t%%r5\n");
!!#                         !IJ_printf (th_M, "\tand\t%%r9, %%r5, %%r5\n");
!!#                         !IJ_printf (th_M, "\tor\t%%r5, %%r15, %%r9\n");
!!#                         !IJ_printf (th_M, "\tstx\t%%r9, [%%r10]\n");
!!# 
!!#                         !}
!!# 
!!# !                        // HALF WORD
!!# !                        // add a mechanism to control addr1, addr5 in range ??
!!# !                        // addr
!!# !                        jbi1 = IJ_get_rvar_val64(Rv_jbi_h_addr_pattern1);
!!# !                        jbi2 = IJ_get_rvar_val64(Rv_jbi_h_addr_pattern2);
!!# !                        jbi3 = IJ_get_rvar_val64(Rv_jbi_h_addr_pattern3);
!!# !                        jbi4 = IJ_get_rvar_val64(Rv_jbi_h_addr_pattern4);
!!# !                        jbi5 = IJ_get_rvar_val64(Rv_jbi_h_addr_pattern5);
!!# !                        jbi6 = IJ_get_rvar_val64(Rv_jbi_h_addr_pattern6);
!!# !			IJ_update_rvar(Rv_jbi_h_addr_pattern1);
!!# !			IJ_update_rvar(Rv_jbi_h_addr_pattern2);
!!# !			IJ_update_rvar(Rv_jbi_h_addr_pattern3);
!!# !			IJ_update_rvar(Rv_jbi_h_addr_pattern4);
!!# !			IJ_update_rvar(Rv_jbi_h_addr_pattern5);
!!# !			IJ_update_rvar(Rv_jbi_h_addr_pattern6);
!!# !
!!# !                        //addr_sel = random() % 5;
!!# !			//IJ_update_rvar(Rv_addr_sel);
!!# !	                //printf ("!DEBUG: %d, jbi1 = 0x%016llx, jbi2 = 0x%016llx, jbi3 = 0x%016llx, jbi4 = 0x%016llx, jbi5 = 0x%016llx, jbi6 = 0x%016llx \n", addr_sel, jbi1, jbi2,jbi3,jbi4,jbi5,jbi6); 
!!# !                        //store_addr = addr_sel;
!!# !
!!# !
!!# !                        h_ADDR_ARRAY[h_a_wr_cntr] = jbi1; h_a_wr_cntr = h_a_wr_cntr + 1; // store the stx address
!!# !                        h_ADDR_ARRAY[h_a_wr_cntr] = jbi2; h_a_wr_cntr = h_a_wr_cntr + 1; // store the stx address
!!# !                        h_ADDR_ARRAY[h_a_wr_cntr] = jbi3; h_a_wr_cntr = h_a_wr_cntr + 1; // store the stx address
!!# !                        h_ADDR_ARRAY[h_a_wr_cntr] = jbi4; h_a_wr_cntr = h_a_wr_cntr + 1; // store the stx address
!!# !                        h_ADDR_ARRAY[h_a_wr_cntr] = jbi5; h_a_wr_cntr = h_a_wr_cntr + 1; // store the stx address
!!# !                        h_ADDR_ARRAY[h_a_wr_cntr] = jbi6; h_a_wr_cntr = h_a_wr_cntr + 1; // store the stx address
!!# !
!!# !                        for (i=0;i<6;i++) {
!!# !                        h_DATA_ARRAY[h_wr_cntr] = IJ_get_rvar_val64(Rv_rand64);
!!# !			IJ_update_rvar(Rv_rand64);
!!# !                        data_st = h_DATA_ARRAY[h_wr_cntr];
!!# !                        addr_st = h_ADDR_ARRAY[h_a_wr_cntr -6 + i];
!!# !                        IJ_printf (th_M, "\tsetx\t0x%016llx, %%r1, %%r9\n",
!!# !                                addr_st);
!!# !                        IJ_printf (th_M, "\tsetx\t0x%016llx, %%r1, %%r10\n",
!!# !                                data_st);
!!# !                        IJ_printf (th_M, "\tsth\t%%r10, [%%r9]\n");
!!# !
!!# !                        h_wr_cntr++;
!!# !                        } // end for 
!!# !
!!# !
!!# !                        //  WORD
!!# !                        // add a mechanism to control addr1, addr5 in range ??
!!# !                        // addr
!!# !                        jbi1 = IJ_get_rvar_val64(Rv_jbi_w_addr_pattern1);
!!# !                        jbi2 = IJ_get_rvar_val64(Rv_jbi_w_addr_pattern2);
!!# !                        jbi3 = IJ_get_rvar_val64(Rv_jbi_w_addr_pattern3);
!!# !                        jbi4 = IJ_get_rvar_val64(Rv_jbi_w_addr_pattern4);
!!# !                        jbi5 = IJ_get_rvar_val64(Rv_jbi_w_addr_pattern5);
!!# !                        jbi6 = IJ_get_rvar_val64(Rv_jbi_w_addr_pattern6);
!!# !			IJ_update_rvar(Rv_jbi_w_addr_pattern1);
!!# !			IJ_update_rvar(Rv_jbi_w_addr_pattern2);
!!# !			IJ_update_rvar(Rv_jbi_w_addr_pattern3);
!!# !			IJ_update_rvar(Rv_jbi_w_addr_pattern4);
!!# !			IJ_update_rvar(Rv_jbi_w_addr_pattern5);
!!# !			IJ_update_rvar(Rv_jbi_w_addr_pattern6);
!!# !
!!# !                        //addr_sel = random() % 5;
!!# !			//IJ_update_rvar(Rv_addr_sel);
!!# !	                //printf ("!DEBUG: %d, jbi1 = 0x%016llx, jbi2 = 0x%016llx, jbi3 = 0x%016llx, jbi4 = 0x%016llx, jbi5 = 0x%016llx, jbi6 = 0x%016llx \n", addr_sel, jbi1, jbi2,jbi3,jbi4,jbi5,jbi6); 
!!# !                        //store_addr = addr_sel;
!!# !
!!# !
!!# !                        w_ADDR_ARRAY[w_a_wr_cntr] = jbi1; w_a_wr_cntr = w_a_wr_cntr + 1; // store the stx address
!!# !                        w_ADDR_ARRAY[w_a_wr_cntr] = jbi2; w_a_wr_cntr = w_a_wr_cntr + 1; // store the stx address
!!# !                        w_ADDR_ARRAY[w_a_wr_cntr] = jbi3; w_a_wr_cntr = w_a_wr_cntr + 1; // store the stx address
!!# !                        w_ADDR_ARRAY[w_a_wr_cntr] = jbi4; w_a_wr_cntr = w_a_wr_cntr + 1; // store the stx address
!!# !                        w_ADDR_ARRAY[w_a_wr_cntr] = jbi5; w_a_wr_cntr = w_a_wr_cntr + 1; // store the stx address
!!# !                        w_ADDR_ARRAY[w_a_wr_cntr] = jbi6; w_a_wr_cntr = w_a_wr_cntr + 1; // store the stx address
!!# !
!!# !                        for (i=0;i<6;i++) {
!!# !                        w_DATA_ARRAY[w_wr_cntr] = IJ_get_rvar_val64(Rv_rand64);
!!# !			IJ_update_rvar(Rv_rand64);
!!# !                        data_st = w_DATA_ARRAY[w_wr_cntr];
!!# !                        addr_st = w_ADDR_ARRAY[w_a_wr_cntr -6 + i];
!!# !                        IJ_printf (th_M, "\tsetx\t0x%016llx, %%r1, %%r9\n",
!!# !                                addr_st);
!!# !                        IJ_printf (th_M, "\tsetx\t0x%016llx, %%r1, %%r10\n",
!!# !                                data_st);
!!# !                        IJ_printf (th_M, "\tstw\t%%r10, [%%r9]\n");
!!# !
!!# !                        w_wr_cntr++;
!!# !                        } // end for 
!!# !
!!# !                        // Double WORD (x-word)
!!# !                        // add a mechanism to control addr1, addr5 in range ??
!!# !                        // addr
!!# !                        jbi1 = IJ_get_rvar_val64(Rv_jbiaddr_pattern1);
!!# !                        jbi2 = IJ_get_rvar_val64(Rv_jbiaddr_pattern2);
!!# !                        jbi3 = IJ_get_rvar_val64(Rv_jbiaddr_pattern3);
!!# !                        jbi4 = IJ_get_rvar_val64(Rv_jbiaddr_pattern4);
!!# !                        jbi5 = IJ_get_rvar_val64(Rv_jbiaddr_pattern5);
!!# !                        jbi6 = IJ_get_rvar_val64(Rv_jbiaddr_pattern6);
!!# !			IJ_update_rvar(Rv_jbiaddr_pattern1);
!!# !			IJ_update_rvar(Rv_jbiaddr_pattern2);
!!# !			IJ_update_rvar(Rv_jbiaddr_pattern3);
!!# !			IJ_update_rvar(Rv_jbiaddr_pattern4);
!!# !			IJ_update_rvar(Rv_jbiaddr_pattern5);
!!# !			IJ_update_rvar(Rv_jbiaddr_pattern6);
!!# !
!!# !                        //addr_sel = random() % 5;
!!# !			//IJ_update_rvar(Rv_addr_sel);
!!# !	                //printf ("!DEBUG: %d, jbi1 = 0x%016llx, jbi2 = 0x%016llx, jbi3 = 0x%016llx, jbi4 = 0x%016llx, jbi5 = 0x%016llx, jbi6 = 0x%016llx \n", addr_sel, jbi1, jbi2,jbi3,jbi4,jbi5,jbi6); 
!!# !                        //store_addr = addr_sel;
!!# !
!!# !
!!# !                        x_ADDR_ARRAY[x_a_wr_cntr] = jbi1; x_a_wr_cntr = x_a_wr_cntr + 1; // store the stx address
!!# !                        x_ADDR_ARRAY[x_a_wr_cntr] = jbi2; x_a_wr_cntr = x_a_wr_cntr + 1; // store the stx address
!!# !                        x_ADDR_ARRAY[x_a_wr_cntr] = jbi3; x_a_wr_cntr = x_a_wr_cntr + 1; // store the stx address
!!# !                        x_ADDR_ARRAY[x_a_wr_cntr] = jbi4; x_a_wr_cntr = x_a_wr_cntr + 1; // store the stx address
!!# !                        x_ADDR_ARRAY[x_a_wr_cntr] = jbi5; x_a_wr_cntr = x_a_wr_cntr + 1; // store the stx address
!!# !                        x_ADDR_ARRAY[x_a_wr_cntr] = jbi6; x_a_wr_cntr = x_a_wr_cntr + 1; // store the stx address
!!# !
!!# !                        for (i=0;i<6;i++) {
!!# !                        x_DATA_ARRAY[x_wr_cntr] = IJ_get_rvar_val64(Rv_rand64);
!!# !			IJ_update_rvar(Rv_rand64);
!!# !                        data_st = x_DATA_ARRAY[x_wr_cntr];
!!# !                        addr_st = x_ADDR_ARRAY[x_a_wr_cntr -6 + i];
!!# !                        IJ_printf (th_M, "\tsetx\t0x%016llx, %%r1, %%r9\n",
!!# !                                addr_st);
!!# !                        IJ_printf (th_M, "\tsetx\t0x%016llx, %%r1, %%r10\n",
!!# !                                data_st);
!!# !                        IJ_printf (th_M, "\tstx\t%%r10, [%%r9]\n");
!!# !
!!# !                        x_wr_cntr++;
!!# !                        } // end for 
!!# 
!!# !                        // EXTRA NOISE STX
!!# !                        rnd_cnt =  addr_sel ;
!!# !                        while(rnd_cnt > 0 ) {
!!# !                        // noise load and store
!!# !                        while (addr_sel == store_addr ) {
!!# !                        //addr_sel = IJ_get_rvar_val64(Rv_addr_sel);
!!# !			//IJ_update_rvar(Rv_addr_sel);
!!# !                        addr_sel = random() % 5;
!!# !                        }
!!# !	                //printf ("!DEBUG 2: %d\n", addr_sel); 
!!# !                        switch (addr_sel) {
!!# !                        case 1 : jbi_addr = jbi1; break;
!!# !                        case 2 : jbi_addr = jbi2; break;
!!# !                        case 3 : jbi_addr = jbi3; break;
!!# !                        case 4 : jbi_addr = jbi4; break;
!!# !                        case 5 : jbi_addr = jbi5; break;
!!# !                        case 0 : jbi_addr = jbi6; break;
!!# !                        default : jbi_addr = jbi5; break;
!!# !                        }
!!# !
!!# !	                //printf ("!DEBUG 3: jbi_addr =  0x%016llx\n", jbi_addr); 
!!# !
!!# !                        IJ_printf (th_M, "\tsetx\t0x%016llx, %%r1, %%r12\n",
!!# !                                jbi_addr);
!!# !                        noise_data_st = b_DATA_ARRAY[addr_sel];
!!# !                        IJ_printf (th_M, "\tsetx\t0x%016llx, %%r1, %%r13\n",
!!# !                                noise_data_st);
!!# !                        IJ_printf (th_M, "\tstx\t%%r13, [%%r12]\n");
!!# !                        rnd_cnt--;
!!# !                        addr_sel = IJ_get_rvar_val64(Rv_addr_sel);
!!# !			IJ_update_rvar(Rv_addr_sel);
!!# !                        }
!!# 
!!#                         ! Loads (1/2/4/8)
!!#                         !for(i=0; i <60; i++){
!!#                         !IJ_printf (th_M, "!\tdata_array = 0x%016llx, addr_array %d = 0x%016llx  \n",b_DATA_ARRAY[i], i,b_ADDR_ARRAY[i]);
!!#                         !}
!!# 
!!#                         ! BYTE LOADS
!!#                         a_addr_sel = random() %500;
!!# 
!!#                         if(b_a_wr_cntr >= 10 ) {
!!#                         while (a_addr_sel + 9 >= b_a_wr_cntr ) {
!!#                         a_addr_sel = random() %500;
!!# 	                !IJ_printf (th_M, "!DEBUG 3: a_addr_sel =  0x%016llx, a_wr_cntr = %d\n", a_addr_sel, a_wr_cntr); 
!!#                          }
!!#                         rnd_cnt = random() % 8; ! 4 ld(.) from random loc which is already stored
!!# 	                !IJ_printf (th_M, "!DEBUG 4: rnd_cnt =  0x%016llx, b_a_wr_cntr= %d,a_addr_sel= %d\n", rnd_cnt,b_a_wr_cntr,a_addr_sel); 
!!#                         while(rnd_cnt > 0 ) {
!!#                         IJ_printf ("diag.j", 1700, th_M, "\tsetx\t0x%016llx, %%r1, %%r12\n",
!!#                                 b_ADDR_ARRAY[rnd_cnt+a_addr_sel]);
!!#                         IJ_printf ("diag.j", 1702, th_M, "\tldub\t[%%r12], %%r11\n");
!!#                         !data_ld = b_DATA_ARRAY[rnd_cnt+a_addr_sel];
!!#                         !IJ_printf (th_M, "\tsetx\t0x%016llx, %%r1, %%r10\n",
!!#                         !        data_ld);
!!#                         !IJ_printf (th_M, "\tsetx\t0x%016llx, %%r1, %%r14\n",
!!#                         !        0x00000000000000ff);
!!#                         !IJ_printf (th_M, "\tand\t%%r10, %%r14, %%r10\n");
!!#                         !IJ_printf (th_M, "\tcmp\t%%r10, %%r11\n");
!!#                         !IJ_printf (th_M, "\tbne h_bad_end\n");
!!#                         !IJ_printf (th_M, "\tnop\n");
!!#                         rnd_cnt--;
!!#                          }
!!#                         } ! of if(b_a_wr_cntr >=10)
!!# 
!!# !                        // HALF WORD LOADS
!!# !                        a_addr_sel = random() %500;
!!# !
!!# !                        if(h_a_wr_cntr >= 10 ) {
!!# !                        while (a_addr_sel + 9 >= h_a_wr_cntr ) {
!!# !                        a_addr_sel = random() %500;
!!# !	                //IJ_printf (th_M, "!DEBUG 3: a_addr_sel =  0x%016llx, a_wr_cntr = %d\n", a_addr_sel, a_wr_cntr); 
!!# !                         }
!!# !                        rnd_cnt = random() % 8; // 4 ld(.) from random loc which is already stored
!!# !	                //IJ_printf (th_M, "!DEBUG 4: rnd_cnt =  0x%016llx, h_a_wr_cntr= %d,a_addr_sel= %d\n", rnd_cnt,h_a_wr_cntr,a_addr_sel); 
!!# !                        while(rnd_cnt > 0 ) {
!!# !                        IJ_printf (th_M, "\tsetx\t0x%016llx, %%r1, %%r12\n",
!!# !                                h_ADDR_ARRAY[rnd_cnt+a_addr_sel]);
!!# !                        IJ_printf (th_M, "\tlduh\t[%%r12], %%r11\n");
!!# !                        data_ld = h_DATA_ARRAY[rnd_cnt+a_addr_sel];
!!# !                        IJ_printf (th_M, "\tsetx\t0x%016llx, %%r1, %%r10\n",
!!# !                                data_ld);
!!# !                        IJ_printf (th_M, "\tsetx\t0x%016llx, %%r1, %%r14\n",
!!# !                                0x000000000000ffff);
!!# !                        IJ_printf (th_M, "\tand\t%%r10, %%r14, %%r10\n");
!!# !                        IJ_printf (th_M, "\tcmp\t%%r10, %%r11\n");
!!# !                        IJ_printf (th_M, "\tbne h_bad_end\n");
!!# !                        IJ_printf (th_M, "\tnop\n");
!!# !                        rnd_cnt--;
!!# !                         }
!!# !                        } // of if(h_a_wr_cntr >=10)
!!# !
!!# !
!!# !
!!# !                        // WORD LOADS
!!# !                        a_addr_sel = random() %500;
!!# !
!!# !                        if(w_a_wr_cntr >= 10 ) {
!!# !                        while (a_addr_sel + 9 >= w_a_wr_cntr ) {
!!# !                        a_addr_sel = random() %500;
!!# !	                //IJ_printf (th_M, "!DEBUG 3: a_addr_sel =  0x%016llx, a_wr_cntr = %d\n", a_addr_sel, a_wr_cntr); 
!!# !                         }
!!# !                        rnd_cnt = random() % 8; // 4 ld(.) from random loc which is already stored
!!# !	                //IJ_printf (th_M, "!DEBUG 4: rnd_cnt =  0x%016llx, w_a_wr_cntr= %d,a_addr_sel= %d\n", rnd_cnt,w_a_wr_cntr,a_addr_sel); 
!!# !                        while(rnd_cnt > 0 ) {
!!# !                        IJ_printf (th_M, "\tsetx\t0x%016llx, %%r1, %%r12\n",
!!# !                                w_ADDR_ARRAY[rnd_cnt+a_addr_sel]);
!!# !                        IJ_printf (th_M, "\tlduw\t[%%r12], %%r11\n");
!!# !                        data_ld = w_DATA_ARRAY[rnd_cnt+a_addr_sel];
!!# !                        IJ_printf (th_M, "\tsetx\t0x%016llx, %%r1, %%r10\n",
!!# !                                data_ld);
!!# !                        IJ_printf (th_M, "\tsetx\t0x%016llx, %%r1, %%r14\n",
!!# !                                0x00000000ffffffff);
!!# !                        IJ_printf (th_M, "\tand\t%%r10, %%r14, %%r10\n");
!!# !                        IJ_printf (th_M, "\tcmp\t%%r10, %%r11\n");
!!# !                        IJ_printf (th_M, "\tbne h_bad_end\n");
!!# !                        IJ_printf (th_M, "\tnop\n");
!!# !                        rnd_cnt--;
!!# !                         }
!!# !                        } // of if(w_a_wr_cntr >=10)
!!# !
!!# !
!!# !
!!# !                        // X-WORD LOADS
!!# !                        a_addr_sel = random() %500;
!!# !
!!# !                        if(x_a_wr_cntr >= 10 ) {
!!# !                        while (a_addr_sel + 9 >= x_a_wr_cntr ) {
!!# !                        a_addr_sel = random() %500;
!!# !	                //IJ_printf (th_M, "!DEBUG 3: a_addr_sel =  0x%016llx, a_wr_cntr = %d\n", a_addr_sel, a_wr_cntr); 
!!# !                         }
!!# !                        rnd_cnt = random() % 8; // 4 ld(.) from random loc which is already stored
!!# !	                //IJ_printf (th_M, "!DEBUG 4: rnd_cnt =  0x%016llx, x_a_wr_cntr= %d,a_addr_sel= %d\n", rnd_cnt,x_a_wr_cntr,a_addr_sel); 
!!# !                        while(rnd_cnt > 0 ) {
!!# !                        IJ_printf (th_M, "\tsetx\t0x%016llx, %%r1, %%r12\n",
!!# !                                x_ADDR_ARRAY[rnd_cnt+a_addr_sel]);
!!# !                        IJ_printf (th_M, "\tldx\t[%%r12], %%r11\n");
!!# !                        data_ld = x_DATA_ARRAY[rnd_cnt+a_addr_sel];
!!# !                        IJ_printf (th_M, "\tsetx\t0x%016llx, %%r1, %%r10\n",
!!# !                                data_ld);
!!# !                        IJ_printf (th_M, "\tcmp\t%%r10, %%r11\n");
!!# !                        IJ_printf (th_M, "\tbne h_bad_end\n");
!!# !                        IJ_printf (th_M, "\tnop\n");
!!# !                        rnd_cnt--;
!!# !                         }
!!# !                        } // of if(x_a_wr_cntr >=10)
!!# 
!!#                         !i=0;
!!#                         !IJ_printf (th_M, "!\tdata_array %d = 0x%016llx , rd_cntr = %d, wr_cntr = %d\n", i,ADDR_ARRAY[i],rd_cntr, wr_cntr);
!!#                         !i=1;
!!#                         !IJ_printf (th_M, "!\tdata_array %d = 0x%016llx , rd_cntr = %d, wr_cntr = %d\n", i,ADDR_ARRAY[i],rd_cntr, wr_cntr);
!!#                         !i=2;
!!#                         !IJ_printf (th_M, "!\tdata_array %d = 0x%016llx , rd_cntr = %d, wr_cntr = %d\n", i,ADDR_ARRAY[i],rd_cntr, wr_cntr);
!!#                         !i=3;
!!#                         !IJ_printf (th_M, "!\tdata_array %d = 0x%016llx , rd_cntr = %d, wr_cntr = %d\n", i,ADDR_ARRAY[i],rd_cntr, wr_cntr);
!!# 
!!#                 }
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
