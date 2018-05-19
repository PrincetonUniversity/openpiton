// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: pio_rnd_basic3_mix_all_rand_1.s
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
   random seed:	661114636
   Jal pio_rnd_basic3_mix_all.j:	
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

SECTION .MY_HYP_SEC TEXT_VA = 0x1100000000, DATA_VA = 0x1100360000
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

	setx	0x000000005232b009, %r1, %r9
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



	setx	0x00000080275d7c1c, %r1, %r9
	setx	0x873ba88198fbaa0c, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800ea64e34, %r1, %r9
	setx	0x01e5664a0be343d3, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800fd062c6, %r1, %r9
	setx	0x48d73e1c66df686b, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c20244f498, %r1, %r9
	setx	0xfa896ade992cdc3f, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d501531d53, %r1, %r9
	setx	0x5ccc929f23e02616, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e384ff7224, %r1, %r9
	setx	0xc707ec7593398fe9, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f730f9b286, %r1, %r9
	setx	0x5d316b38bf31d7b6, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e394c60, %r1, %r9
	setx	0xb7b6610573fdc097, %r1, %r10
	sth	%r10, [%r9]
	setx	0x0000001010100000, %r1, %r9
	setx	0xb7b6610573fdc097, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f6dc7da, %r1, %r9
	setx	0x6631b37a2ecf78f6, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c53f499bae, %r1, %r9
	setx	0x739a9642b207b6a4, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d0f2bbe41c, %r1, %r9
	setx	0x1a3aec94d2296e41, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e5b2c0b0ee, %r1, %r9
	setx	0x67cc2292785e7611, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f31c6eec4e, %r1, %r9
	setx	0x4d31e18ef6c4daad, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e9e6abc, %r1, %r9
	setx	0xa2808d1c0d3b9138, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800fd51b1c, %r1, %r9
	setx	0xce49ab4273093120, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c2b25ba39c, %r1, %r9
	setx	0xf9c381f4bfaaa0f2, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d19f0990b0, %r1, %r9
	setx	0xdffe7a0e29138240, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000eb1c420cf4, %r1, %r9
	setx	0xb49c40326f2ba8df, %r1, %r10
	stw	%r10, [%r9]
	setx	0x0000001090100000, %r1, %r9
	setx	0xb49c40326f2ba8df, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000f891a1e2e8, %r1, %r9
	setx	0xa1b43506c534a58f, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800ec4b1a8, %r1, %r9
	setx	0xe745ed4645273f76, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800ffb3328, %r1, %r9
	setx	0xd90523f69bb43e0e, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000001040100000, %r1, %r9
	setx	0xd90523f69bb43e0e, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000c7321e3808, %r1, %r9
	setx	0xd7e46127f8816192, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d689fb4dc0, %r1, %r9
	setx	0xf9f872fe167a375b, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ebad2c6b10, %r1, %r9
	setx	0xe5f5f200ca1b7687, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f6fa4350b8, %r1, %r9
	setx	0xb74644cd0c90c98d, %r1, %r10
	stx	%r10, [%r9]
	setx	0x00000010c0100000, %r1, %r9
	setx	0xb74644cd0c90c98d, %r1, %r10
	ldx	[%r9], %r10
	setx	0x00000080974f3cd0, %r1, %r9
	setx	0x406a66c5cd1804e9, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e935a53, %r1, %r9
	setx	0x9097cf83a8e7c76a, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f868291, %r1, %r9
	setx	0x6d179f4ad1908b34, %r1, %r10
	stb	%r10, [%r9]
	setx	0x0000001000100000, %r1, %r9
	setx	0x6d179f4ad1908b34, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c450f6e741, %r1, %r9
	setx	0x5ef3d2936c37fa44, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d9b52ae588, %r1, %r9
	setx	0xeba08be5667e1c18, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e506b7bbac, %r1, %r9
	setx	0x64dada47a07f2bba, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000feae02dd8e, %r1, %r9
	setx	0x6ead917abebfe2a3, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e18a830, %r1, %r9
	setx	0x3a213c84c2f66e3e, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f508368, %r1, %r9
	setx	0xb33004a455db6926, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000cfef6bdd9c, %r1, %r9
	setx	0xdbc093230796eac2, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000db2f52104e, %r1, %r9
	setx	0xcde7752178ce964c, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000ebd2573220, %r1, %r9
	setx	0xce7d5061df1e5173, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f98fdcf760, %r1, %r9
	setx	0xbd7a36b5b181b0f4, %r1, %r10
	sth	%r10, [%r9]
	setx	0x00000010b0100000, %r1, %r9
	setx	0xbd7a36b5b181b0f4, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800ecc9298, %r1, %r9
	setx	0x279deea2dd8dbc84, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f32df70, %r1, %r9
	setx	0x9475dd8319be6264, %r1, %r10
	stw	%r10, [%r9]
	setx	0x0000001030100000, %r1, %r9
	setx	0x9475dd8319be6264, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000c96de33ab8, %r1, %r9
	setx	0xa51a3b5885ee4990, %r1, %r10
	stw	%r10, [%r9]
	setx	0x00000010c0100000, %r1, %r9
	setx	0xa51a3b5885ee4990, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d04f26ad80, %r1, %r9
	setx	0x92eb5ad252546019, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e5e04f1118, %r1, %r9
	setx	0x9f444ed8bef6beae, %r1, %r10
	stw	%r10, [%r9]
	setx	0x0000001010100000, %r1, %r9
	setx	0x9f444ed8bef6beae, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000f4a271139c, %r1, %r9
	setx	0xedd31173ec0e5802, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e2e0420, %r1, %r9
	setx	0x1b9920eb01a0a551, %r1, %r10
	stx	%r10, [%r9]
	setx	0x00000010f0100000, %r1, %r9
	setx	0x1b9920eb01a0a551, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800fac58b8, %r1, %r9
	setx	0x52bc534c6fa0e2b7, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c04ba20ac0, %r1, %r9
	setx	0x914f1ae56c090bb9, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d0fd983dd0, %r1, %r9
	setx	0x1a23b8f8e11a9a01, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e6691e1f38, %r1, %r9
	setx	0x862ba504b154dcba, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f6fa4350b8, %r1, %r9
	setx	0x96d2736b45d5e2e3, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000001010100000, %r1, %r9
	setx	0x96d2736b45d5e2e3, %r1, %r10
	stx	%r10, [%r9]
	setx	0x00000080974f3cd0, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000f730f9b286, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000e384ff7224, %r1, %r12
	ldub	[%r12], %r11
	setx	0x0000001040100000, %r1, %r9
	setx	0x96d2736b45d5e2e3, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000d501531d53, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000c20244f498, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800fd062c6, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800ea64e34, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800f508368, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e18a830, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000f31c6eec4e, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000e5b2c0b0ee, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d0f2bbe41c, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000c53f499bae, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800f6dc7da, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000c2b25ba39c, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800fd51b1c, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000ebad2c6b10, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000d689fb4dc0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000c7321e3808, %r1, %r12
	ldx	[%r12], %r11
	setx	0x00000080bbeb131e, %r1, %r9
	setx	0xa103b2fa45e893e2, %r1, %r10
	stb	%r10, [%r9]
	setx	0x00000010b0100000, %r1, %r9
	setx	0xa103b2fa45e893e2, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800e748326, %r1, %r9
	setx	0x496485e92dbf079b, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800fec3d53, %r1, %r9
	setx	0x306f1acf06292de5, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000cd717f7446, %r1, %r9
	setx	0x3b08cad16e3c40fa, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d2e9792354, %r1, %r9
	setx	0x44dd968b19d32a5b, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e16a0b67f9, %r1, %r9
	setx	0x7e58915dcc88b70a, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f46aae3041, %r1, %r9
	setx	0xa0a34ac29467d23c, %r1, %r10
	stb	%r10, [%r9]
	setx	0x0000001010100000, %r1, %r9
	setx	0xa0a34ac29467d23c, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800e4c30f2, %r1, %r9
	setx	0xbf93fd9d530da638, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800fc4cde0, %r1, %r9
	setx	0xcdfcc22216460730, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000cce286a590, %r1, %r9
	setx	0xdff604979e3b31a2, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000dcaa0d0886, %r1, %r9
	setx	0xc82d0f2b5d95196b, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e457af8688, %r1, %r9
	setx	0x992967a58b13ee0e, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000fbd363e002, %r1, %r9
	setx	0xf756e681323506a4, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e3c2840, %r1, %r9
	setx	0xf9e2f5c734f60435, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f090324, %r1, %r9
	setx	0x565b5c817a4edfcf, %r1, %r10
	stw	%r10, [%r9]
	setx	0x0000001030100000, %r1, %r9
	setx	0x565b5c817a4edfcf, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c743a2e7f4, %r1, %r9
	setx	0xbd5162dd9d8d66af, %r1, %r10
	stw	%r10, [%r9]
	setx	0x0000001050100000, %r1, %r9
	setx	0xbd5162dd9d8d66af, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000da5fac2570, %r1, %r9
	setx	0xe9bf71eb07a04130, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e8a52f2750, %r1, %r9
	setx	0x21aa0ce2c765a7dc, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000fcf82a26d8, %r1, %r9
	setx	0xc866120206cdf4f3, %r1, %r10
	stw	%r10, [%r9]
	setx	0x00000010a0100000, %r1, %r9
	setx	0xc866120206cdf4f3, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800ecfef48, %r1, %r9
	setx	0x59530e4c4d6fa86b, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800fc8fa98, %r1, %r9
	setx	0x47d4b3b05b8fce62, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c567cfa1c0, %r1, %r9
	setx	0xc87672dc902a8fdb, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d4b6b44788, %r1, %r9
	setx	0x8d76fa6729eb30e1, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e61c2144d8, %r1, %r9
	setx	0xb77a0bfc2c5a8873, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000001030100000, %r1, %r9
	setx	0xb77a0bfc2c5a8873, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f6fa4350b8, %r1, %r9
	setx	0xb16e092458564efc, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f868291, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800e935a53, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000cfef6bdd9c, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800f508368, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e18a830, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000f31c6eec4e, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000e5b2c0b0ee, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d0f2bbe41c, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000c53f499bae, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000eb1c420cf4, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000d19f0990b0, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000d0fd983dd0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000c04ba20ac0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x00000080c42341a6, %r1, %r9
	setx	0xd99930e2c595c625, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e86f372, %r1, %r9
	setx	0x9167d51a1e6a43f0, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f3d85d9, %r1, %r9
	setx	0xda0513243e5dbb48, %r1, %r10
	stb	%r10, [%r9]
	setx	0x0000001000100000, %r1, %r9
	setx	0xda0513243e5dbb48, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c8458b2fcd, %r1, %r9
	setx	0x7266be6c2b15e4e0, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d43d606cb9, %r1, %r9
	setx	0x42bd8ba021aa4030, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000eeedc28273, %r1, %r9
	setx	0x42f4fe5df5bbbcc5, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f0b088e50e, %r1, %r9
	setx	0xbbababbd88323364, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e8199c8, %r1, %r9
	setx	0x9a872883cc69b7ad, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f91e276, %r1, %r9
	setx	0x74eda9a3bfa77c5d, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c2b2e6249a, %r1, %r9
	setx	0xe69a68ff180e65bb, %r1, %r10
	sth	%r10, [%r9]
	setx	0x0000001030100000, %r1, %r9
	setx	0xe69a68ff180e65bb, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d3977f263c, %r1, %r9
	setx	0xc8e8ea6507a0c463, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e86ea97326, %r1, %r9
	setx	0xb40c9c927d836482, %r1, %r10
	sth	%r10, [%r9]
	setx	0x0000001030100000, %r1, %r9
	setx	0xb40c9c927d836482, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000f355d0b0cc, %r1, %r9
	setx	0x3f6f7dbf4a83a89c, %r1, %r10
	sth	%r10, [%r9]
	setx	0x00000010e0100000, %r1, %r9
	setx	0x3f6f7dbf4a83a89c, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800e74255c, %r1, %r9
	setx	0x1a233a4a5be96b8a, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f565ba0, %r1, %r9
	setx	0x74d1535ba591b75d, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c0ce64050c, %r1, %r9
	setx	0x0c9ea6a8577267d6, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000db893862c8, %r1, %r9
	setx	0x7d430e3f281f6834, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e91df164ec, %r1, %r9
	setx	0x382144cb41523f90, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000fa1d71cdfc, %r1, %r9
	setx	0x10f4d27397fbfd3f, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800ec9ec48, %r1, %r9
	setx	0x57df90d975d36459, %r1, %r10
	stx	%r10, [%r9]
	setx	0x00000010d0100000, %r1, %r9
	setx	0x57df90d975d36459, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800fdbd050, %r1, %r9
	setx	0x1762f57fa025907e, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c6d215c820, %r1, %r9
	setx	0x41724f7e46bf8847, %r1, %r10
	stx	%r10, [%r9]
	setx	0x00000010e0100000, %r1, %r9
	setx	0x41724f7e46bf8847, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000d274c25e40, %r1, %r9
	setx	0xb643d0df6fa95384, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ed9da97dd8, %r1, %r9
	setx	0x0cf15d493723d7dd, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000001010100000, %r1, %r9
	setx	0x0cf15d493723d7dd, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f6fa4350b8, %r1, %r9
	setx	0xfa95dfb5a30039a0, %r1, %r10
	stx	%r10, [%r9]
	setx	0x00000080c42341a6, %r1, %r12
	ldub	[%r12], %r11
	setx	0x0000001050100000, %r1, %r9
	setx	0xfa95dfb5a30039a0, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000f46aae3041, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000e16a0b67f9, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000d2e9792354, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000cd717f7446, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800fec3d53, %r1, %r12
	ldub	[%r12], %r11
	setx	0x0000001000100000, %r1, %r9
	setx	0xfa95dfb5a30039a0, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000cfef6bdd9c, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800f508368, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e3c2840, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000f4a271139c, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000e5e04f1118, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000d04f26ad80, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000c96de33ab8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800f32df70, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000f6fa4350b8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000ebad2c6b10, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000d689fb4dc0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x00000080607a0c92, %r1, %r9
	setx	0x6964a9e29962874c, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e412725, %r1, %r9
	setx	0x73ffe02b24f04c88, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f404e06, %r1, %r9
	setx	0x828737423909857e, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c1acba1f0f, %r1, %r9
	setx	0xc1a9629d40deeef9, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d6930d62ef, %r1, %r9
	setx	0x95a4ccf4f78fac5a, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e037869f08, %r1, %r9
	setx	0x1f7428a952e553c0, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000fc1a1918ea, %r1, %r9
	setx	0xd69a1109d9d0ef4e, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e3086d2, %r1, %r9
	setx	0xdc0f018398923fb5, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f0725a2, %r1, %r9
	setx	0x554f27740f360c47, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c99a5166c2, %r1, %r9
	setx	0x8b89e7a5bff33a9b, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d40a69c4b0, %r1, %r9
	setx	0x241e0401b0d316a2, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000ed064d3a48, %r1, %r9
	setx	0xde74671042179cdd, %r1, %r10
	sth	%r10, [%r9]
	setx	0x0000001010100000, %r1, %r9
	setx	0xde74671042179cdd, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000f263d30f3e, %r1, %r9
	setx	0x3abf32e3442c8039, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e2ba454, %r1, %r9
	setx	0x261409ba69d8e89d, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f04a83c, %r1, %r9
	setx	0x6684fc39983bd583, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000cd165a63ac, %r1, %r9
	setx	0xb80a20d6dad407da, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000de550efbc8, %r1, %r9
	setx	0x6931fb62d5144dcb, %r1, %r10
	stw	%r10, [%r9]
	setx	0x00000010f0100000, %r1, %r9
	setx	0x6931fb62d5144dcb, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000e880f72314, %r1, %r9
	setx	0x57c79845f6cedbd0, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f693ebcc5c, %r1, %r9
	setx	0xd6ed7fe58c0f4e1b, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800eb21290, %r1, %r9
	setx	0x8000f717286d78fd, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000001070100000, %r1, %r9
	setx	0x8000f717286d78fd, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f24ab98, %r1, %r9
	setx	0xb1410e8cb56f1a7a, %r1, %r10
	stx	%r10, [%r9]
	setx	0x00000010c0100000, %r1, %r9
	setx	0xb1410e8cb56f1a7a, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000cdc69c5f20, %r1, %r9
	setx	0x37fba79e389c847b, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000defded2c88, %r1, %r9
	setx	0x100b1f55328ee3f3, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000eff0c33868, %r1, %r9
	setx	0xe0d763165cdccc3e, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f6fa4350b8, %r1, %r9
	setx	0x4c1b81a1d006467e, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000eeedc28273, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000d43d606cb9, %r1, %r12
	ldub	[%r12], %r11
	setx	0x0000001090100000, %r1, %r9
	setx	0x4c1b81a1d006467e, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c8458b2fcd, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800f3d85d9, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000ebd2573220, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000db2f52104e, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000cfef6bdd9c, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800f508368, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e18a830, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000f31c6eec4e, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000e5b2c0b0ee, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d04f26ad80, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000c96de33ab8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800fdbd050, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000801c1c5551, %r1, %r9
	setx	0x29acba896e451c84, %r1, %r10
	stb	%r10, [%r9]
	setx	0x00000010b0100000, %r1, %r9
	setx	0x29acba896e451c84, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800e486584, %r1, %r9
	setx	0xc867fe5f3eeb09a1, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800fea039a, %r1, %r9
	setx	0x9e1f9d38c60e53d1, %r1, %r10
	stb	%r10, [%r9]
	setx	0x0000001010100000, %r1, %r9
	setx	0x9e1f9d38c60e53d1, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000cc4cd53503, %r1, %r9
	setx	0xebf14856ec714633, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d2f8b440e0, %r1, %r9
	setx	0xdfee6c4e61195e4a, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e4170904e5, %r1, %r9
	setx	0xe20a42049b81bf60, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000fba555f916, %r1, %r9
	setx	0xd7924214081a5479, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800efb03fa, %r1, %r9
	setx	0xe29b7bc92f470b2f, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f19dba2, %r1, %r9
	setx	0x9c6dec05da439799, %r1, %r10
	sth	%r10, [%r9]
	setx	0x0000001090100000, %r1, %r9
	setx	0x9c6dec05da439799, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000cdec5c6cbe, %r1, %r9
	setx	0x58c030e4e543beb7, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d4faa16c66, %r1, %r9
	setx	0x720c8ef73b5f39e5, %r1, %r10
	sth	%r10, [%r9]
	setx	0x00000010c0100000, %r1, %r9
	setx	0x720c8ef73b5f39e5, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000e731288e0e, %r1, %r9
	setx	0x9d11f6311caa02dd, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000fc170e488e, %r1, %r9
	setx	0x52df3b7184c37ab6, %r1, %r10
	sth	%r10, [%r9]
	setx	0x0000001070100000, %r1, %r9
	setx	0x52df3b7184c37ab6, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800eaae068, %r1, %r9
	setx	0x3b4aa58b3cd807ba, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f6cfe34, %r1, %r9
	setx	0x79c1ba9f7c4f7090, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c74f112aa0, %r1, %r9
	setx	0xbbec8ee5fb6bb724, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d451558114, %r1, %r9
	setx	0xacf624998fb91c82, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000ec88ac13a8, %r1, %r9
	setx	0x4c4dbf29dbf362a6, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000fad029afa8, %r1, %r9
	setx	0x10f135ad116486e2, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e699ae8, %r1, %r9
	setx	0xd595ddc1ece6d901, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800fbab7e8, %r1, %r9
	setx	0x296ee1f6c839a3f8, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000001060100000, %r1, %r9
	setx	0x296ee1f6c839a3f8, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000c2de7f5d20, %r1, %r9
	setx	0xe1eb2b0275d4b69b, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000001090100000, %r1, %r9
	setx	0xe1eb2b0275d4b69b, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000da266c67f0, %r1, %r9
	setx	0x9f375c3dbadff699, %r1, %r10
	stx	%r10, [%r9]
	setx	0x00000010d0100000, %r1, %r9
	setx	0x9f375c3dbadff699, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e7db5a72c0, %r1, %r9
	setx	0x660ecfead2b26bc0, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f6fa4350b8, %r1, %r9
	setx	0xff8fbe58d18065c5, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f730f9b286, %r1, %r12
	ldub	[%r12], %r11
	setx	0x00000010a0100000, %r1, %r9
	setx	0xff8fbe58d18065c5, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000e384ff7224, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000d501531d53, %r1, %r12
	ldub	[%r12], %r11
	setx	0x00000010a0100000, %r1, %r9
	setx	0xff8fbe58d18065c5, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800f0725a2, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000e8a52f2750, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000da5fac2570, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000c743a2e7f4, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000e6691e1f38, %r1, %r12
	ldx	[%r12], %r11
	setx	0x00000080b5c55bfd, %r1, %r9
	setx	0x55d20a003cb8acca, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e6f419c, %r1, %r9
	setx	0xb1e8f5cba6f197a4, %r1, %r10
	stb	%r10, [%r9]
	setx	0x0000001000100000, %r1, %r9
	setx	0xb1e8f5cba6f197a4, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800fa4b827, %r1, %r9
	setx	0x333ae0b4dc95c707, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c41c1799db, %r1, %r9
	setx	0xd76eab5ac073549b, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000dd39e08a4e, %r1, %r9
	setx	0x909a82c50f2c7ca3, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e07c44a5e0, %r1, %r9
	setx	0x7a0a384f2550af83, %r1, %r10
	stb	%r10, [%r9]
	setx	0x0000001040100000, %r1, %r9
	setx	0x7a0a384f2550af83, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000f97bf02070, %r1, %r9
	setx	0xdf8db51f1fb5311a, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800efdeaf6, %r1, %r9
	setx	0xe1cb8c3375a04950, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800fc5dee0, %r1, %r9
	setx	0x831d908964b86b80, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c4f9497bf8, %r1, %r9
	setx	0xcb63a35f550536c8, %r1, %r10
	sth	%r10, [%r9]
	setx	0x00000010d0100000, %r1, %r9
	setx	0xcb63a35f550536c8, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000da04a426dc, %r1, %r9
	setx	0xd595bf478904c349, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000effe99dc12, %r1, %r9
	setx	0x713194f91d5fe3ad, %r1, %r10
	sth	%r10, [%r9]
	setx	0x0000001070100000, %r1, %r9
	setx	0x713194f91d5fe3ad, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000f429441042, %r1, %r9
	setx	0x353cc2f0d7ad8010, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800ec117b8, %r1, %r9
	setx	0xbde8c3f5c2a7e945, %r1, %r10
	stw	%r10, [%r9]
	setx	0x0000001060100000, %r1, %r9
	setx	0xbde8c3f5c2a7e945, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800f5a201c, %r1, %r9
	setx	0xd86b4adc94c94a76, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000cd80487a50, %r1, %r9
	setx	0xdf429b036cd1bcb4, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000da165fd540, %r1, %r9
	setx	0xa9274e3e6196a197, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000ecb6577cc8, %r1, %r9
	setx	0x1657359d6236a46e, %r1, %r10
	stw	%r10, [%r9]
	setx	0x00000010c0100000, %r1, %r9
	setx	0x1657359d6236a46e, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000fb0ef11d8c, %r1, %r9
	setx	0x02ad49f631fbb87e, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e1bfce0, %r1, %r9
	setx	0x6b6cede7d541ad82, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f74e6a0, %r1, %r9
	setx	0x7b6aef6bc43b1653, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c25a7da4f8, %r1, %r9
	setx	0xd0903e0c174b46c1, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000001040100000, %r1, %r9
	setx	0xd0903e0c174b46c1, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000da1c922840, %r1, %r9
	setx	0xf93b984a1ac36bbf, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ed28a57b78, %r1, %r9
	setx	0x4edb89b78e9cf79b, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f6fa4350b8, %r1, %r9
	setx	0xbaff84cae7f4e984, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000001030100000, %r1, %r9
	setx	0xbaff84cae7f4e984, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000feae02dd8e, %r1, %r12
	ldub	[%r12], %r11
	setx	0x0000001020100000, %r1, %r9
	setx	0xbaff84cae7f4e984, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000e506b7bbac, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000d9b52ae588, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000c450f6e741, %r1, %r12
	ldub	[%r12], %r11
	setx	0x0000001010100000, %r1, %r9
	setx	0xbaff84cae7f4e984, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f868291, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800f508368, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e18a830, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000f31c6eec4e, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000cd165a63ac, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800f04a83c, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800e2ba454, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000fa1d71cdfc, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000e91df164ec, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000defded2c88, %r1, %r12
	ldx	[%r12], %r11
	setx	0x00000080d3538f46, %r1, %r9
	setx	0xe2e414654db4f700, %r1, %r10
	stb	%r10, [%r9]
	setx	0x0000001050100000, %r1, %r9
	setx	0xe2e414654db4f700, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800e270fee, %r1, %r9
	setx	0x77872076815a9dbf, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f2caee1, %r1, %r9
	setx	0x5c8450b995901f25, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000cf80f000f7, %r1, %r9
	setx	0xb727a0518ac3ec65, %r1, %r10
	stb	%r10, [%r9]
	setx	0x0000001070100000, %r1, %r9
	setx	0xb727a0518ac3ec65, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d59eb1e767, %r1, %r9
	setx	0xf5bd50bbce668d5a, %r1, %r10
	stb	%r10, [%r9]
	setx	0x0000001000100000, %r1, %r9
	setx	0xf5bd50bbce668d5a, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e61028f577, %r1, %r9
	setx	0xcff2ee9e979d25ba, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f34e29c41c, %r1, %r9
	setx	0x8b61f776d878671c, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800eb131cc, %r1, %r9
	setx	0x171066f1c64dff67, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800fb058a0, %r1, %r9
	setx	0x74989311c3baffac, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c5e72fc85a, %r1, %r9
	setx	0x31b5ff1a437fe719, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d7190e8260, %r1, %r9
	setx	0x409da0a04cfe13de, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000eb4da663ca, %r1, %r9
	setx	0x082570dda491fafc, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f4af11aafc, %r1, %r9
	setx	0x700f2e8b021d337d, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e2ce1e4, %r1, %r9
	setx	0xdb3f2c3139087892, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800ffeaa08, %r1, %r9
	setx	0x07c0f72703cf1651, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000cfa8039184, %r1, %r9
	setx	0x0479da715eaa27f8, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000db7ce5f4d8, %r1, %r9
	setx	0xa6d8719fd0a00dd3, %r1, %r10
	stw	%r10, [%r9]
	setx	0x00000010c0100000, %r1, %r9
	setx	0xa6d8719fd0a00dd3, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000e4fdc1741c, %r1, %r9
	setx	0x55535f7b53b42769, %r1, %r10
	stw	%r10, [%r9]
	setx	0x0000001020100000, %r1, %r9
	setx	0x55535f7b53b42769, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000f998e1a79c, %r1, %r9
	setx	0x3b55487fa668d0fe, %r1, %r10
	stw	%r10, [%r9]
	setx	0x0000001060100000, %r1, %r9
	setx	0x3b55487fa668d0fe, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800e2de148, %r1, %r9
	setx	0x158055ad5c33bd7b, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000001000100000, %r1, %r9
	setx	0x158055ad5c33bd7b, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800f5b1238, %r1, %r9
	setx	0xc0f67eaa733366f6, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ced6e06050, %r1, %r9
	setx	0x275b4563f8e4130c, %r1, %r10
	stx	%r10, [%r9]
	setx	0x00000010c0100000, %r1, %r9
	setx	0x275b4563f8e4130c, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000d2117b6610, %r1, %r9
	setx	0x77bae933a188be1f, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000eb5dc7e600, %r1, %r9
	setx	0x7e837d3f2a5755fd, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f6fa4350b8, %r1, %r9
	setx	0x239e2c5e990d3891, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000001080100000, %r1, %r9
	setx	0x239e2c5e990d3891, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800fec3d53, %r1, %r12
	ldub	[%r12], %r11
	setx	0x0000001020100000, %r1, %r9
	setx	0x239e2c5e990d3891, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800e748326, %r1, %r12
	ldub	[%r12], %r11
	setx	0x00000080bbeb131e, %r1, %r12
	ldub	[%r12], %r11
	setx	0x00000010f0100000, %r1, %r9
	setx	0x239e2c5e990d3891, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000feae02dd8e, %r1, %r12
	ldub	[%r12], %r11
	setx	0x00000010c0100000, %r1, %r9
	setx	0x239e2c5e990d3891, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000e506b7bbac, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800fb058a0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800eb131cc, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000f429441042, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000effe99dc12, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000da04a426dc, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000c4f9497bf8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800fbab7e8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e699ae8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x00000080bfd99fee, %r1, %r9
	setx	0xaee0c648b9c67eb9, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e764623, %r1, %r9
	setx	0x63c3dfa9a7a2f1ca, %r1, %r10
	stb	%r10, [%r9]
	setx	0x0000001090100000, %r1, %r9
	setx	0x63c3dfa9a7a2f1ca, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800fc64d94, %r1, %r9
	setx	0x1ef451116d4ea5b6, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c4ae1368a1, %r1, %r9
	setx	0xa3dbe507280643ff, %r1, %r10
	stb	%r10, [%r9]
	setx	0x00000010c0100000, %r1, %r9
	setx	0xa3dbe507280643ff, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d64503d2b5, %r1, %r9
	setx	0x052806da0bcabcbc, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e220c571ac, %r1, %r9
	setx	0x586d916967bc78e9, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f99ea7aa40, %r1, %r9
	setx	0x3cfe1e056cb68066, %r1, %r10
	stb	%r10, [%r9]
	setx	0x0000001080100000, %r1, %r9
	setx	0x3cfe1e056cb68066, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800e5157cc, %r1, %r9
	setx	0x1ce36e893f2a805e, %r1, %r10
	sth	%r10, [%r9]
	setx	0x0000001050100000, %r1, %r9
	setx	0x1ce36e893f2a805e, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800f20e2e8, %r1, %r9
	setx	0x15d3d193402a55fb, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c48ed12af6, %r1, %r9
	setx	0xd36663637501fce1, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000dab6efec5e, %r1, %r9
	setx	0xd45418b81d20826d, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000ebbaeeb6c2, %r1, %r9
	setx	0x63d12c75853ac68a, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f01cd69248, %r1, %r9
	setx	0x6e6c23a4c65534cd, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800ee4faac, %r1, %r9
	setx	0xe7e5c57b5ba28c1e, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800fae4fac, %r1, %r9
	setx	0x4a00f58ba1abb31d, %r1, %r10
	stw	%r10, [%r9]
	setx	0x00000010c0100000, %r1, %r9
	setx	0x4a00f58ba1abb31d, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ca27903c50, %r1, %r9
	setx	0x2865f51a0da7f00a, %r1, %r10
	stw	%r10, [%r9]
	setx	0x0000001060100000, %r1, %r9
	setx	0x2865f51a0da7f00a, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d17311b7a8, %r1, %r9
	setx	0x893abf12ed17dee4, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000eca9ea3e40, %r1, %r9
	setx	0xa60dd5e395e01dec, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f8f35f9024, %r1, %r9
	setx	0x5c79c0bf675082d5, %r1, %r10
	stw	%r10, [%r9]
	setx	0x0000001000100000, %r1, %r9
	setx	0x5c79c0bf675082d5, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800e9b0a70, %r1, %r9
	setx	0x676853bb0bae2dee, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f9d8bf0, %r1, %r9
	setx	0xa27d69ba7ceb6eb0, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000cbad342658, %r1, %r9
	setx	0xc07163834daaf81d, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d6af529260, %r1, %r9
	setx	0x08db0e648dc41e5b, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e83458b110, %r1, %r9
	setx	0x28d8171e58cc4ca8, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f6fa4350b8, %r1, %r9
	setx	0xe5ab309e3f8bcf59, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e07c44a5e0, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000dd39e08a4e, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800e8199c8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000fbd363e002, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d04f26ad80, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000c96de33ab8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800f32df70, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800ecc9298, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800ec9ec48, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000f6fa4350b8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x0000008076297fea, %r1, %r9
	setx	0xb9c6fdb38002edc0, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e27772b, %r1, %r9
	setx	0xcf4c90d3d63705d3, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800fad165b, %r1, %r9
	setx	0xbc23bbced2a4f6ee, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c298f642d2, %r1, %r9
	setx	0x900f36c4bcc0838d, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d40a980f65, %r1, %r9
	setx	0x94864db68e13193a, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e8fe74add4, %r1, %r9
	setx	0x7ee1b4f4c048a2c4, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000fc4666231b, %r1, %r9
	setx	0x876851e89fdf3c13, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e0259ec, %r1, %r9
	setx	0xd5d00c8f004e6c86, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800ff6828a, %r1, %r9
	setx	0xded9a800473cfe1d, %r1, %r10
	sth	%r10, [%r9]
	setx	0x0000001060100000, %r1, %r9
	setx	0xded9a800473cfe1d, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c6144e11c4, %r1, %r9
	setx	0xfc9251efc19318d6, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d2f4544c9e, %r1, %r9
	setx	0x241b0317c2366e10, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e4f8afa3a6, %r1, %r9
	setx	0x44750262c0ac5f6a, %r1, %r10
	sth	%r10, [%r9]
	setx	0x0000001020100000, %r1, %r9
	setx	0x44750262c0ac5f6a, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000fb54fc447c, %r1, %r9
	setx	0x13b1ad66af7a4dfa, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e5c6f74, %r1, %r9
	setx	0x5a486cb4a5b91303, %r1, %r10
	stw	%r10, [%r9]
	setx	0x0000001060100000, %r1, %r9
	setx	0x5a486cb4a5b91303, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800f36dd8c, %r1, %r9
	setx	0x7261450875121683, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c87ef7c35c, %r1, %r9
	setx	0xb7921f03729b539e, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000dc6df004a4, %r1, %r9
	setx	0x065ab3e7af67ca01, %r1, %r10
	stw	%r10, [%r9]
	setx	0x00000010f0100000, %r1, %r9
	setx	0x065ab3e7af67ca01, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000eb4dd4e3c4, %r1, %r9
	setx	0x54b51ab59a8458dc, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000fe3a2ca2d8, %r1, %r9
	setx	0xb1012937e439d619, %r1, %r10
	stw	%r10, [%r9]
	setx	0x00000010f0100000, %r1, %r9
	setx	0xb1012937e439d619, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800ea2a828, %r1, %r9
	setx	0x0886d39cfc8c47c0, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800fcf0280, %r1, %r9
	setx	0xa131e7fb05eb8118, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c6840d4218, %r1, %r9
	setx	0xbf31790acdbf1499, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d18ce4ec30, %r1, %r9
	setx	0x07cf33752acc67a1, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ee907aae98, %r1, %r9
	setx	0x90f024228576f841, %r1, %r10
	stx	%r10, [%r9]
	setx	0x00000010e0100000, %r1, %r9
	setx	0x90f024228576f841, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f6fa4350b8, %r1, %r9
	setx	0x8827a7409657b2b3, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000001020100000, %r1, %r9
	setx	0x8827a7409657b2b3, %r1, %r10
	ldx	[%r9], %r10
	setx	0x00000080607a0c92, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000f0b088e50e, %r1, %r12
	ldub	[%r12], %r11
	setx	0x0000001040100000, %r1, %r9
	setx	0x8827a7409657b2b3, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000eeedc28273, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000d43d606cb9, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000c8458b2fcd, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800e8199c8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000e880f72314, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800ec9ec48, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000f6fa4350b8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000e61c2144d8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000807965e878, %r1, %r9
	setx	0xb59b665a14f71cbf, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e471a9d, %r1, %r9
	setx	0x1f8aa168fccad0f9, %r1, %r10
	stb	%r10, [%r9]
	setx	0x0000001070100000, %r1, %r9
	setx	0x1f8aa168fccad0f9, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800fcf648a, %r1, %r9
	setx	0xc48b2c951e5c1068, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000cf8bf009e7, %r1, %r9
	setx	0x3725fe5463d1d385, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000dd47240be0, %r1, %r9
	setx	0x593822cac62f1206, %r1, %r10
	stb	%r10, [%r9]
	setx	0x00000010c0100000, %r1, %r9
	setx	0x593822cac62f1206, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e26611feb6, %r1, %r9
	setx	0x9e6e9a2db1c18d47, %r1, %r10
	stb	%r10, [%r9]
	setx	0x00000010b0100000, %r1, %r9
	setx	0x9e6e9a2db1c18d47, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f80316334a, %r1, %r9
	setx	0x7aba69403cc6997d, %r1, %r10
	stb	%r10, [%r9]
	setx	0x00000010c0100000, %r1, %r9
	setx	0x7aba69403cc6997d, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800ef1f39a, %r1, %r9
	setx	0x433461c25c740f01, %r1, %r10
	sth	%r10, [%r9]
	setx	0x0000001030100000, %r1, %r9
	setx	0x433461c25c740f01, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800fff58cc, %r1, %r9
	setx	0x1545c144e5dd27b7, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c34b671e6e, %r1, %r9
	setx	0x700217c2a6cab4c5, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d9d55f3426, %r1, %r9
	setx	0x498e9d1231f332c8, %r1, %r10
	sth	%r10, [%r9]
	setx	0x00000010a0100000, %r1, %r9
	setx	0x498e9d1231f332c8, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000e082076850, %r1, %r9
	setx	0x450333f513e9d191, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000fbe86b5d5c, %r1, %r9
	setx	0xa1345f3f0506d6fb, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e2ff84c, %r1, %r9
	setx	0xfcc435350829c22a, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f50ee30, %r1, %r9
	setx	0xa98212588168c4ad, %r1, %r10
	stw	%r10, [%r9]
	setx	0x0000001090100000, %r1, %r9
	setx	0xa98212588168c4ad, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000cae1d57170, %r1, %r9
	setx	0x9cb2e7743ffd6445, %r1, %r10
	stw	%r10, [%r9]
	setx	0x0000001030100000, %r1, %r9
	setx	0x9cb2e7743ffd6445, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d11c9e4e44, %r1, %r9
	setx	0xfc7a294c9bf2b2e7, %r1, %r10
	stw	%r10, [%r9]
	setx	0x00000010e0100000, %r1, %r9
	setx	0xfc7a294c9bf2b2e7, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e903a03d8c, %r1, %r9
	setx	0x2820df635ccfecbc, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000fad2dddce8, %r1, %r9
	setx	0x0cad364d79248626, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e094e50, %r1, %r9
	setx	0xf9f0e891c75a9392, %r1, %r10
	stx	%r10, [%r9]
	setx	0x00000010b0100000, %r1, %r9
	setx	0xf9f0e891c75a9392, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800fdaee48, %r1, %r9
	setx	0x513e84bb2f967751, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c8a6fb4938, %r1, %r9
	setx	0x21b3ee112491205d, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000dfeca5d810, %r1, %r9
	setx	0xd3f289f5b9c44bfd, %r1, %r10
	stx	%r10, [%r9]
	setx	0x00000010d0100000, %r1, %r9
	setx	0xd3f289f5b9c44bfd, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e82fced5b8, %r1, %r9
	setx	0x6a3b30e96d19b86f, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f6fa4350b8, %r1, %r9
	setx	0x316c0abcbd0d56c9, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000001000100000, %r1, %r9
	setx	0x316c0abcbd0d56c9, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c5e72fc85a, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800fb058a0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800eb131cc, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000f429441042, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000effe99dc12, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000fad029afa8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000ec88ac13a8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000d451558114, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000c74f112aa0, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800f6cfe34, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800eaae068, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000eff0c33868, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000defded2c88, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000cdc69c5f20, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800f24ab98, %r1, %r12
	ldx	[%r12], %r11
	setx	0x0000008013576371, %r1, %r9
	setx	0xc7da9697bdb9d702, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e284b84, %r1, %r9
	setx	0x0307441941f837d5, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800fcd1e15, %r1, %r9
	setx	0x8aba9069452e4664, %r1, %r10
	stb	%r10, [%r9]
	setx	0x00000010b0100000, %r1, %r9
	setx	0x8aba9069452e4664, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000cf5fc358e7, %r1, %r9
	setx	0x05e614ab7819f84b, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000dd37c0646c, %r1, %r9
	setx	0x6bdfaad934b4c1af, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e9c07e5648, %r1, %r9
	setx	0xd63ca173f44df626, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f186742235, %r1, %r9
	setx	0x5f7e4a6d7e2d4d02, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e0688fc, %r1, %r9
	setx	0xe4c4632aa6259109, %r1, %r10
	sth	%r10, [%r9]
	setx	0x0000001000100000, %r1, %r9
	setx	0xe4c4632aa6259109, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800f2061c6, %r1, %r9
	setx	0x9418b9cb21c3a58e, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c68e5d474e, %r1, %r9
	setx	0x4137ca00fe4f3623, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000daed9db81c, %r1, %r9
	setx	0x332e491c39b3c534, %r1, %r10
	sth	%r10, [%r9]
	setx	0x0000001010100000, %r1, %r9
	setx	0x332e491c39b3c534, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e5146aec18, %r1, %r9
	setx	0x18b654c7aafd553b, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f0004586f0, %r1, %r9
	setx	0x3538e764198fcd6c, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e221908, %r1, %r9
	setx	0x7e78cab599f76e5c, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f9235ec, %r1, %r9
	setx	0x47e316ac3cd2be2f, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000ca3bd2eb94, %r1, %r9
	setx	0x3dca6c8edfa02141, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000ddcb1aa530, %r1, %r9
	setx	0x0530a7460577b7f1, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e24b237974, %r1, %r9
	setx	0x6cf331d248bb0d06, %r1, %r10
	stw	%r10, [%r9]
	setx	0x0000001020100000, %r1, %r9
	setx	0x6cf331d248bb0d06, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000f8950ffee0, %r1, %r9
	setx	0xd4211975c594d278, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800eadce60, %r1, %r9
	setx	0x5888c3b0286de187, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800fd19d50, %r1, %r9
	setx	0x88178b70206fcc5a, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c959e6c8f8, %r1, %r9
	setx	0x0b7f9bd5ac42d05f, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d53629a750, %r1, %r9
	setx	0xbe26be04960070ae, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000eaff5c2b80, %r1, %r9
	setx	0xf49f6916851eb01a, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f6fa4350b8, %r1, %r9
	setx	0x959dc2ebc977e673, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f46aae3041, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000c99a5166c2, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800f0725a2, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e3086d2, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000f355d0b0cc, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000e86ea97326, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d3977f263c, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d17311b7a8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000ca27903c50, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800fae4fac, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800ee4faac, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000f998e1a79c, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000f6fa4350b8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000e7db5a72c0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000da266c67f0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000c2de7f5d20, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800fbab7e8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e699ae8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x00000080af2ad517, %r1, %r9
	setx	0xd8151424cb8565bc, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800ea3b069, %r1, %r9
	setx	0x1d38f814a585979c, %r1, %r10
	stb	%r10, [%r9]
	setx	0x0000001040100000, %r1, %r9
	setx	0x1d38f814a585979c, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800f2fa382, %r1, %r9
	setx	0x7d88b0c5be1fc17d, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c7eea4b062, %r1, %r9
	setx	0x59c76237cd1b49ca, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d0ab3b76fe, %r1, %r9
	setx	0xbec86d4c74668516, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e1e05e1a5d, %r1, %r9
	setx	0x24b62228762a0f9a, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f7bbce5847, %r1, %r9
	setx	0x70944d4cbbfa8c99, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e22b1de, %r1, %r9
	setx	0x9a7ff85c071a9636, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800fb4ff70, %r1, %r9
	setx	0x226d30f4782410d8, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000cd8c3b75de, %r1, %r9
	setx	0x6a4c8e7857f6cb4c, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d25d33b676, %r1, %r9
	setx	0xb967f7a9205037d0, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000ed802298aa, %r1, %r9
	setx	0x93f643ddea84433c, %r1, %r10
	sth	%r10, [%r9]
	setx	0x0000001090100000, %r1, %r9
	setx	0x93f643ddea84433c, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000feba14ba48, %r1, %r9
	setx	0x4814ef20926de400, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e2496d0, %r1, %r9
	setx	0xd67ddbf022ef176c, %r1, %r10
	stw	%r10, [%r9]
	setx	0x0000001050100000, %r1, %r9
	setx	0xd67ddbf022ef176c, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800fe15430, %r1, %r9
	setx	0xf47d0628d53cef2f, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c6f6683058, %r1, %r9
	setx	0xb64002bd5375b499, %r1, %r10
	stw	%r10, [%r9]
	setx	0x0000001040100000, %r1, %r9
	setx	0xb64002bd5375b499, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000d779d298bc, %r1, %r9
	setx	0x0afa14c7a3683ab7, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000ea30ce4060, %r1, %r9
	setx	0xab7f7176b42d6ce0, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000fc7f6b60ec, %r1, %r9
	setx	0x0edf71594d3d8c5c, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e1e6e08, %r1, %r9
	setx	0x6fa273220f352063, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f469e98, %r1, %r9
	setx	0x300c0bbac3a29218, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c44de100f8, %r1, %r9
	setx	0x46e7a7511d42406d, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000db19925120, %r1, %r9
	setx	0x1c4874dda00bb5a9, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ee8f09f4b8, %r1, %r9
	setx	0x90410b402b145e0b, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f6fa4350b8, %r1, %r9
	setx	0x6dc4dbda51ebe379, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000cc4cd53503, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800fea039a, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800e486584, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800f469e98, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e1e6e08, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000f6fa4350b8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000eaff5c2b80, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000d53629a750, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000c959e6c8f8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800fd19d50, %r1, %r12
	ldx	[%r12], %r11
	setx	0x00000080d0cbe8d2, %r1, %r9
	setx	0x1866ffec70bf0f68, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800ec41aa4, %r1, %r9
	setx	0x093f94b65d035c45, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800fc56df8, %r1, %r9
	setx	0x641d0de925396854, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c1bf2372c2, %r1, %r9
	setx	0x59e866c33773d9aa, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d62e32eb9a, %r1, %r9
	setx	0x5201ec12844f47d9, %r1, %r10
	stb	%r10, [%r9]
	setx	0x00000010c0100000, %r1, %r9
	setx	0x5201ec12844f47d9, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ec41917ebe, %r1, %r9
	setx	0xae7d98b26c9d2f02, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f44f4ece6e, %r1, %r9
	setx	0x66363e6da04ba254, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800ef8030e, %r1, %r9
	setx	0xe5a812b85311f35d, %r1, %r10
	sth	%r10, [%r9]
	setx	0x00000010c0100000, %r1, %r9
	setx	0xe5a812b85311f35d, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800fe6ecca, %r1, %r9
	setx	0xf6a78fe36c92289d, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c0e14868e0, %r1, %r9
	setx	0x5f5e6088a8f628da, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000dc88411450, %r1, %r9
	setx	0x81a93b712481ef01, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e4b42ef0ca, %r1, %r9
	setx	0xd54c7aac732c847a, %r1, %r10
	sth	%r10, [%r9]
	setx	0x0000001070100000, %r1, %r9
	setx	0xd54c7aac732c847a, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000f66290910e, %r1, %r9
	setx	0x39a2e5564057c170, %r1, %r10
	sth	%r10, [%r9]
	setx	0x00000010e0100000, %r1, %r9
	setx	0x39a2e5564057c170, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800e8c0c3c, %r1, %r9
	setx	0x30bb111f49f53b30, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800fa5fcac, %r1, %r9
	setx	0x4da69c920bbfefcd, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c7ec1c4d8c, %r1, %r9
	setx	0x19c5a9a8837c5a72, %r1, %r10
	stw	%r10, [%r9]
	setx	0x0000001000100000, %r1, %r9
	setx	0x19c5a9a8837c5a72, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d88ec444c4, %r1, %r9
	setx	0xfad1259df4440917, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e29d774ecc, %r1, %r9
	setx	0xbe22fb7bbb168995, %r1, %r10
	stw	%r10, [%r9]
	setx	0x0000001020100000, %r1, %r9
	setx	0xbe22fb7bbb168995, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000fda12f5c94, %r1, %r9
	setx	0x11a7251e4939dffc, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800ec70640, %r1, %r9
	setx	0x3339604a8e566e1c, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f5619b8, %r1, %r9
	setx	0x297399bb27055803, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c6724342d0, %r1, %r9
	setx	0x483746808e37b3af, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d921714748, %r1, %r9
	setx	0xddb8a663c5bc6cd1, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ebd038f338, %r1, %r9
	setx	0xc3e4d3584b74e092, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f6fa4350b8, %r1, %r9
	setx	0xf94bc0e76b24ad12, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000008076297fea, %r1, %r12
	ldub	[%r12], %r11
	setx	0x0000001060100000, %r1, %r9
	setx	0xf94bc0e76b24ad12, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f99ea7aa40, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000e220c571ac, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000d64503d2b5, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000f998e1a79c, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000e4fdc1741c, %r1, %r12
	lduw	[%r12], %r11
	setx	0x0000008061933fe4, %r1, %r9
	setx	0xb9dae5827d7f4882, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e532b8f, %r1, %r9
	setx	0x714eeabf0953dc20, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f9ad564, %r1, %r9
	setx	0x3e9e9dd24d3f19f0, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000cbef778539, %r1, %r9
	setx	0xed9372e75fc01e84, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d5f26539dd, %r1, %r9
	setx	0x254a67df14a5c47e, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ed2397a331, %r1, %r9
	setx	0x68225979a17af23d, %r1, %r10
	stb	%r10, [%r9]
	setx	0x0000001050100000, %r1, %r9
	setx	0x68225979a17af23d, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f8a3890b2c, %r1, %r9
	setx	0x9424bf3bf5b2ee4e, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e31c68a, %r1, %r9
	setx	0x3c920c5a9ecfbb90, %r1, %r10
	sth	%r10, [%r9]
	setx	0x00000010a0100000, %r1, %r9
	setx	0x3c920c5a9ecfbb90, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800ff3654a, %r1, %r9
	setx	0xee08ae9daf7eb0cf, %r1, %r10
	sth	%r10, [%r9]
	setx	0x00000010d0100000, %r1, %r9
	setx	0xee08ae9daf7eb0cf, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000c9a8309d8a, %r1, %r9
	setx	0xd2bd1ab37f7c2b25, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d21c33886e, %r1, %r9
	setx	0xadde10abf4d9b066, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e140ec8d0e, %r1, %r9
	setx	0x283fb48fdeff341a, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f1196368f4, %r1, %r9
	setx	0x95b3ce322f4d8bc3, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800ef6e630, %r1, %r9
	setx	0x52e7568ac598c75d, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f84ee90, %r1, %r9
	setx	0x70b96543649a862f, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000ceff6e0d8c, %r1, %r9
	setx	0x273f2b4100a05573, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000dcfe1a1ab8, %r1, %r9
	setx	0x11eb312fc457da43, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e3accca308, %r1, %r9
	setx	0x47f8bdabd37f0442, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f2ad69ccfc, %r1, %r9
	setx	0x3e5682f464b96203, %r1, %r10
	stw	%r10, [%r9]
	setx	0x0000001010100000, %r1, %r9
	setx	0x3e5682f464b96203, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800e49b520, %r1, %r9
	setx	0xacb7aaf15232de6e, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000001090100000, %r1, %r9
	setx	0xacb7aaf15232de6e, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800f524328, %r1, %r9
	setx	0x51ce0df11471da09, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c7e8863fd0, %r1, %r9
	setx	0xb792cd81470a7fb8, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d010280db8, %r1, %r9
	setx	0xfb27a641acb08c71, %r1, %r10
	stx	%r10, [%r9]
	setx	0x00000010e0100000, %r1, %r9
	setx	0xfb27a641acb08c71, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000e548052a50, %r1, %r9
	setx	0x218c9d26474754ef, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f6fa4350b8, %r1, %r9
	setx	0xc254bf489947a4c5, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000001070100000, %r1, %r9
	setx	0xc254bf489947a4c5, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000f186742235, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000e9c07e5648, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000f01cd69248, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000ebbaeeb6c2, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800ef6e630, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000fda12f5c94, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000e29d774ecc, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000d88ec444c4, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000c7ec1c4d8c, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800fa5fcac, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800e8c0c3c, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800e49b520, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000f6fa4350b8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000ebd038f338, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000d921714748, %r1, %r12
	ldx	[%r12], %r11
	setx	0x0000008085ee78d9, %r1, %r9
	setx	0xdfee2dbc2923b878, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e5b552b, %r1, %r9
	setx	0xbb5b1e798fbd48f2, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800fd2405d, %r1, %r9
	setx	0xb091f2d60054b0bb, %r1, %r10
	stb	%r10, [%r9]
	setx	0x0000001080100000, %r1, %r9
	setx	0xb091f2d60054b0bb, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c258d30500, %r1, %r9
	setx	0x4d58d593754c1288, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000dc48cbdb2a, %r1, %r9
	setx	0x516273b5d0c6cf19, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ef2b8ed1d0, %r1, %r9
	setx	0xc422d7e55ddbb0a4, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000fce39dd3e7, %r1, %r9
	setx	0x6351199ce317473d, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e3a7680, %r1, %r9
	setx	0x9d01752e35bdd4ac, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f8b9982, %r1, %r9
	setx	0x79512d5c6edb1e5e, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000cc9c494dec, %r1, %r9
	setx	0x94c18b6a439bd03a, %r1, %r10
	sth	%r10, [%r9]
	setx	0x00000010f0100000, %r1, %r9
	setx	0x94c18b6a439bd03a, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000dfedf5ed7e, %r1, %r9
	setx	0xae09d9b145032ba4, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e6adc696a4, %r1, %r9
	setx	0xbe9b754d064d490b, %r1, %r10
	sth	%r10, [%r9]
	setx	0x00000010d0100000, %r1, %r9
	setx	0xbe9b754d064d490b, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f7f7a17536, %r1, %r9
	setx	0x139576ecbf98c012, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e71ad68, %r1, %r9
	setx	0x5d9013bf85fd7694, %r1, %r10
	stw	%r10, [%r9]
	setx	0x00000010b0100000, %r1, %r9
	setx	0x5d9013bf85fd7694, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f25c948, %r1, %r9
	setx	0x4e47d9ae952e7531, %r1, %r10
	stw	%r10, [%r9]
	setx	0x0000001060100000, %r1, %r9
	setx	0x4e47d9ae952e7531, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000cad8d366a0, %r1, %r9
	setx	0x7fbbf2570bc68079, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000dc5a454a94, %r1, %r9
	setx	0x0b0a880d052c95a3, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e020e452e4, %r1, %r9
	setx	0xcf3739a28af470ca, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000fb29a644f8, %r1, %r9
	setx	0x6e9fb15e1808268e, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e1fa860, %r1, %r9
	setx	0xd4429219fc5f070b, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f505dc0, %r1, %r9
	setx	0xd067203cb0872927, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000001000100000, %r1, %r9
	setx	0xd067203cb0872927, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000c6ac328ca8, %r1, %r9
	setx	0x3cfecbef8f1f9b6a, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000dc4900a500, %r1, %r9
	setx	0x05228ecc3cc2dd49, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ede4507580, %r1, %r9
	setx	0xaf406f6ee4a13d15, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000001000100000, %r1, %r9
	setx	0xaf406f6ee4a13d15, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f6fa4350b8, %r1, %r9
	setx	0x6c309e50373beb0b, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800fa4b827, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800e6f419c, %r1, %r12
	ldub	[%r12], %r11
	setx	0x00000080b5c55bfd, %r1, %r12
	ldub	[%r12], %r11
	setx	0x0000001050100000, %r1, %r9
	setx	0x6c309e50373beb0b, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000fba555f916, %r1, %r12
	ldub	[%r12], %r11
	setx	0x0000001070100000, %r1, %r9
	setx	0x6c309e50373beb0b, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e4170904e5, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000d2f8b440e0, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000e731288e0e, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000ecb6577cc8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000da165fd540, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000cd80487a50, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800f5a201c, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800ec117b8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000807b2bc4b7, %r1, %r9
	setx	0x839d60a2c02e189f, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e507af7, %r1, %r9
	setx	0x2d4eae0c48a0f7ed, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f70e729, %r1, %r9
	setx	0xd0788d6fa31e6252, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c74d790aeb, %r1, %r9
	setx	0xdb124c0ce0bb5461, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d866e6a12e, %r1, %r9
	setx	0x1e7c356aef03b2f7, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e0385d0b8e, %r1, %r9
	setx	0x50b7e6bf9496b643, %r1, %r10
	stb	%r10, [%r9]
	setx	0x0000001040100000, %r1, %r9
	setx	0x50b7e6bf9496b643, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000fc9a4ca521, %r1, %r9
	setx	0xfece7d6e7e1b2afd, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e0b6902, %r1, %r9
	setx	0x5ff5f2d61659e467, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800ff2ba46, %r1, %r9
	setx	0x201fb9e414ebab8c, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000cb6957a84e, %r1, %r9
	setx	0x97ac5d9397def692, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d10415f5ce, %r1, %r9
	setx	0xf56cbdfb71af2c12, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000ed9163e386, %r1, %r9
	setx	0x41735f81777423f4, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f814762c06, %r1, %r9
	setx	0x13821cb51afd72af, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e38a314, %r1, %r9
	setx	0x3636def221cefc28, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f0ed2dc, %r1, %r9
	setx	0x2c555120e54c3e34, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c070690244, %r1, %r9
	setx	0x997c23439a25e355, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d03f1bdd3c, %r1, %r9
	setx	0x5b42c44801a9d488, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e544d98388, %r1, %r9
	setx	0xa7429abcf8cb59da, %r1, %r10
	stw	%r10, [%r9]
	setx	0x00000010e0100000, %r1, %r9
	setx	0xa7429abcf8cb59da, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000fb4a3af1c8, %r1, %r9
	setx	0xf41bea4931986060, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800eb1a420, %r1, %r9
	setx	0x48f79b2ca8caa2ee, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f22ade0, %r1, %r9
	setx	0x9274f38d353e7510, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ce1bf52730, %r1, %r9
	setx	0xcdfc6cad6131ac1c, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000001000100000, %r1, %r9
	setx	0xcdfc6cad6131ac1c, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000dc7d3ee748, %r1, %r9
	setx	0xb67c1e7fa5066915, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e6a2d4f998, %r1, %r9
	setx	0xe5435aecd22a1422, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f6fa4350b8, %r1, %r9
	setx	0xf3b0ef99ebb71625, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f97bf02070, %r1, %r12
	ldub	[%r12], %r11
	setx	0x0000001060100000, %r1, %r9
	setx	0xf3b0ef99ebb71625, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000e07c44a5e0, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000dd39e08a4e, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000c41c1799db, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800fa4b827, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000ed064d3a48, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d40a69c4b0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800f36dd8c, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800e5c6f74, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000f8f35f9024, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000eca9ea3e40, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000f6fa4350b8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x00000080afe2a339, %r1, %r9
	setx	0xd95451b12cd8cb0a, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800eb672dd, %r1, %r9
	setx	0x76f824251b355286, %r1, %r10
	stb	%r10, [%r9]
	setx	0x0000001000100000, %r1, %r9
	setx	0x76f824251b355286, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800fe167c0, %r1, %r9
	setx	0x90a682debae89b0c, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c00c85954b, %r1, %r9
	setx	0x578008106f1264e2, %r1, %r10
	stb	%r10, [%r9]
	setx	0x0000001000100000, %r1, %r9
	setx	0x578008106f1264e2, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000d6bbc6bed1, %r1, %r9
	setx	0x60b10e21d892c7fe, %r1, %r10
	stb	%r10, [%r9]
	setx	0x00000010f0100000, %r1, %r9
	setx	0x60b10e21d892c7fe, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000eddb7fe374, %r1, %r9
	setx	0x6a88e58219af9870, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f2ca0e799b, %r1, %r9
	setx	0x97b27c3c9a5ece02, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e9d0002, %r1, %r9
	setx	0x17509e0feac385a4, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f57493e, %r1, %r9
	setx	0x1e94b75ec21f4ed5, %r1, %r10
	sth	%r10, [%r9]
	setx	0x00000010a0100000, %r1, %r9
	setx	0x1e94b75ec21f4ed5, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000ca3855996c, %r1, %r9
	setx	0x2af373116c3bd38c, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d839c20f4c, %r1, %r9
	setx	0xc56e7130a7aec170, %r1, %r10
	sth	%r10, [%r9]
	setx	0x0000001030100000, %r1, %r9
	setx	0xc56e7130a7aec170, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e030d15986, %r1, %r9
	setx	0x0ed654bfe453dfba, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f4160ccf70, %r1, %r9
	setx	0xe9b8675605eb7113, %r1, %r10
	sth	%r10, [%r9]
	setx	0x00000010f0100000, %r1, %r9
	setx	0xe9b8675605eb7113, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800e275410, %r1, %r9
	setx	0xefa0b852fd33cba1, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f2a8d98, %r1, %r9
	setx	0x4f4a7b11e66d959c, %r1, %r10
	stw	%r10, [%r9]
	setx	0x00000010d0100000, %r1, %r9
	setx	0x4f4a7b11e66d959c, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ce139dd76c, %r1, %r9
	setx	0x6fe3be6bdbc07fb2, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d8a78bdd88, %r1, %r9
	setx	0xb332bc9191a5533f, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e455003290, %r1, %r9
	setx	0xec2626b13e34bb6a, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f0f6a2569c, %r1, %r9
	setx	0xe06d915a7104a722, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e3bad38, %r1, %r9
	setx	0x7b3636eb1e547364, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f557fa0, %r1, %r9
	setx	0x56aa20ddfd06027f, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000001030100000, %r1, %r9
	setx	0x56aa20ddfd06027f, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000cd90d1cb60, %r1, %r9
	setx	0xac1ac22e3678596c, %r1, %r10
	stx	%r10, [%r9]
	setx	0x00000010c0100000, %r1, %r9
	setx	0xac1ac22e3678596c, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d93ad00eb0, %r1, %r9
	setx	0x6e0f64b28e67f327, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ebaf894ed0, %r1, %r9
	setx	0x43dd34deadb8264d, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f6fa4350b8, %r1, %r9
	setx	0x884fba3c8f8b4ea9, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000001000100000, %r1, %r9
	setx	0x884fba3c8f8b4ea9, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000cbef778539, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800f9ad564, %r1, %r12
	ldub	[%r12], %r11
	setx	0x0000001070100000, %r1, %r9
	setx	0x884fba3c8f8b4ea9, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800e532b8f, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000fb54fc447c, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000e4f8afa3a6, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d2f4544c9e, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000c6144e11c4, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800ff6828a, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e0259ec, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000fb0ef11d8c, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000ecb6577cc8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800f505dc0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e1fa860, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000f6fa4350b8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000e548052a50, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000d010280db8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000c7e8863fd0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x0000008011bfab1a, %r1, %r9
	setx	0xa4ee0fb343739571, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e18e790, %r1, %r9
	setx	0x8f11be4c849b8c4c, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800ffe1698, %r1, %r9
	setx	0xaf6958f85d3e0ed1, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ccecc6b1b8, %r1, %r9
	setx	0x200b4f1736b18369, %r1, %r10
	stb	%r10, [%r9]
	setx	0x0000001050100000, %r1, %r9
	setx	0x200b4f1736b18369, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d7e4a0c960, %r1, %r9
	setx	0x044343fb91b12e78, %r1, %r10
	stb	%r10, [%r9]
	setx	0x0000001040100000, %r1, %r9
	setx	0x044343fb91b12e78, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000ea3cee8151, %r1, %r9
	setx	0x7b6e938ac454b98c, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000fbafa91f64, %r1, %r9
	setx	0xc53b72180aa52a8c, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e6b6a8e, %r1, %r9
	setx	0x2a4f83f15fbd6a57, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f36d4d2, %r1, %r9
	setx	0x3cf7e374ac9a88c2, %r1, %r10
	sth	%r10, [%r9]
	setx	0x0000001050100000, %r1, %r9
	setx	0x3cf7e374ac9a88c2, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000c3300d3356, %r1, %r9
	setx	0x2242463be2b4875c, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000dcfe7191dc, %r1, %r9
	setx	0xe03255e2ec1209d4, %r1, %r10
	sth	%r10, [%r9]
	setx	0x00000010c0100000, %r1, %r9
	setx	0xe03255e2ec1209d4, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000eeee9f70dc, %r1, %r9
	setx	0xe4cd3ebe48c549d5, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f39e761470, %r1, %r9
	setx	0x2de8d17fe147028d, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e3a35e0, %r1, %r9
	setx	0xcceee4e3530d8d8a, %r1, %r10
	stw	%r10, [%r9]
	setx	0x0000001050100000, %r1, %r9
	setx	0xcceee4e3530d8d8a, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800f416ff8, %r1, %r9
	setx	0x75ebaed600697c9e, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c43e506e90, %r1, %r9
	setx	0x59a5100ccf49c7ca, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000dfdd042a70, %r1, %r9
	setx	0xd7dc457040a085ee, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000eacd0db7fc, %r1, %r9
	setx	0x3033cca0b3471c5c, %r1, %r10
	stw	%r10, [%r9]
	setx	0x0000001010100000, %r1, %r9
	setx	0x3033cca0b3471c5c, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f2c0be20d4, %r1, %r9
	setx	0x6fea022e49c9834e, %r1, %r10
	stw	%r10, [%r9]
	setx	0x00000010a0100000, %r1, %r9
	setx	0x6fea022e49c9834e, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800e4f4ab8, %r1, %r9
	setx	0x8a49267165182f19, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f0f7750, %r1, %r9
	setx	0xdefff19e9d0cef83, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000001060100000, %r1, %r9
	setx	0xdefff19e9d0cef83, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c55ed38218, %r1, %r9
	setx	0x9cb88833c5dc5fb4, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d3ab157cb0, %r1, %r9
	setx	0xffde7daf900809cc, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ed6573c420, %r1, %r9
	setx	0x02cd066d4d01f443, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f6fa4350b8, %r1, %r9
	setx	0x1ea495d84fd3b57d, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800ffe1698, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800e18e790, %r1, %r12
	ldub	[%r12], %r11
	setx	0x0000008011bfab1a, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000f2ca0e799b, %r1, %r12
	ldub	[%r12], %r11
	setx	0x0000001070100000, %r1, %r9
	setx	0x1ea495d84fd3b57d, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000eddb7fe374, %r1, %r12
	ldub	[%r12], %r11
	setx	0x0000001000100000, %r1, %r9
	setx	0x1ea495d84fd3b57d, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000daed9db81c, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000c68e5d474e, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800f2061c6, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e0688fc, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000fb0ef11d8c, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000ecb6577cc8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000da165fd540, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000cd80487a50, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800f5a201c, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000c25a7da4f8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800f74e6a0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e1bfce0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x00000080ce5a2a68, %r1, %r9
	setx	0x96c4d7b9002a0771, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e71a653, %r1, %r9
	setx	0xb86f8d81e99d562f, %r1, %r10
	stb	%r10, [%r9]
	setx	0x0000001090100000, %r1, %r9
	setx	0xb86f8d81e99d562f, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f299b46, %r1, %r9
	setx	0x02a5fd847c3c1923, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000cbeeaa4052, %r1, %r9
	setx	0x794f119d0724a34d, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000dd8dd3b806, %r1, %r9
	setx	0xd2412e1b6ad280d4, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e861b85bbe, %r1, %r9
	setx	0xcd02eec29d4e1047, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000faefd94f5c, %r1, %r9
	setx	0xce92d18c59abd5f0, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e4502de, %r1, %r9
	setx	0x871065e0dd8e11d5, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f7f635a, %r1, %r9
	setx	0x17085b42fc16720b, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c933e93c50, %r1, %r9
	setx	0xec8dab09c71214b0, %r1, %r10
	sth	%r10, [%r9]
	setx	0x0000001090100000, %r1, %r9
	setx	0xec8dab09c71214b0, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d6b7db1ff8, %r1, %r9
	setx	0x824b11c7c27425e4, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e19dc4c97c, %r1, %r9
	setx	0xae91e46102f19dd8, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000fe17591f56, %r1, %r9
	setx	0x9426f1fdcbae35b3, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800eea4d34, %r1, %r9
	setx	0xdc8e7ce2dc8f9662, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800ffcf4b4, %r1, %r9
	setx	0xfaf23cd6e41ab6c1, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000cd5c79238c, %r1, %r9
	setx	0x94c44ec38bde06ae, %r1, %r10
	stw	%r10, [%r9]
	setx	0x00000010e0100000, %r1, %r9
	setx	0x94c44ec38bde06ae, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000dfe136b48c, %r1, %r9
	setx	0x07a0372c41d549cf, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e576446e3c, %r1, %r9
	setx	0x3c3ef00e9993ba72, %r1, %r10
	stw	%r10, [%r9]
	setx	0x00000010b0100000, %r1, %r9
	setx	0x3c3ef00e9993ba72, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f41e234888, %r1, %r9
	setx	0x8f3d5323bf5212e6, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e529e78, %r1, %r9
	setx	0xe3f30893e20c5486, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f272c10, %r1, %r9
	setx	0x4e754dab8916fa9c, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000cdf2132698, %r1, %r9
	setx	0xeb33ad7e720d625b, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d52deaff78, %r1, %r9
	setx	0x892f5c62a8080dba, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000001030100000, %r1, %r9
	setx	0x892f5c62a8080dba, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000e99b219a98, %r1, %r9
	setx	0xd6acbd22073b9dc2, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f6fa4350b8, %r1, %r9
	setx	0xa97644d018bcf026, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e384ff7224, %r1, %r12
	ldub	[%r12], %r11
	setx	0x0000001070100000, %r1, %r9
	setx	0xa97644d018bcf026, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f01cd69248, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800f5a201c, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800ec117b8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000fad029afa8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000ec88ac13a8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800ecfef48, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000f6fa4350b8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000e6691e1f38, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000806dda2668, %r1, %r9
	setx	0x9044cf38f54d8d7c, %r1, %r10
	stb	%r10, [%r9]
	setx	0x0000001050100000, %r1, %r9
	setx	0x9044cf38f54d8d7c, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800e62c2ad, %r1, %r9
	setx	0x79b70bf4a8c5e91c, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f6059b7, %r1, %r9
	setx	0x38ba7c6aa26da866, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c8dbe6d471, %r1, %r9
	setx	0xbaea19dc54521b5b, %r1, %r10
	stb	%r10, [%r9]
	setx	0x0000001050100000, %r1, %r9
	setx	0xbaea19dc54521b5b, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000dd05ea92c4, %r1, %r9
	setx	0x7dfe3eb8144d6729, %r1, %r10
	stb	%r10, [%r9]
	setx	0x0000001000100000, %r1, %r9
	setx	0x7dfe3eb8144d6729, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e75f44a43e, %r1, %r9
	setx	0x254b7bfb026479f2, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f7af7ed3ad, %r1, %r9
	setx	0x07fced49e2424516, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800ec46958, %r1, %r9
	setx	0x5649a6c5b39458cc, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f110882, %r1, %r9
	setx	0x84a5ba5ddf32de9b, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000cd6b151ad4, %r1, %r9
	setx	0xf5e1b43453ec9135, %r1, %r10
	sth	%r10, [%r9]
	setx	0x00000010e0100000, %r1, %r9
	setx	0xf5e1b43453ec9135, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000dd28efb178, %r1, %r9
	setx	0x504380448cbe6216, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000ec15a4d218, %r1, %r9
	setx	0x0ead1e1c707b1de8, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f4bca5840e, %r1, %r9
	setx	0x5ebc13584f55911f, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e1053a4, %r1, %r9
	setx	0xb46f12b133bc9927, %r1, %r10
	stw	%r10, [%r9]
	setx	0x0000001080100000, %r1, %r9
	setx	0xb46f12b133bc9927, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800f4a73ec, %r1, %r9
	setx	0x0ea0b64918162dff, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c26397b394, %r1, %r9
	setx	0xaed9196d0705643a, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000dee88fc98c, %r1, %r9
	setx	0xc19efe48cc64d363, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e5f68633e0, %r1, %r9
	setx	0xfc821450e32e012f, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f53750720c, %r1, %r9
	setx	0x8b9f720861493729, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800ea35338, %r1, %r9
	setx	0x288cd4121d2b4a12, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f231e30, %r1, %r9
	setx	0x0f724a7a245fdee3, %r1, %r10
	stx	%r10, [%r9]
	setx	0x00000010f0100000, %r1, %r9
	setx	0x0f724a7a245fdee3, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000c28d411540, %r1, %r9
	setx	0xe94955af5762a841, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000001040100000, %r1, %r9
	setx	0xe94955af5762a841, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000d16f2c24a8, %r1, %r9
	setx	0x127a7a2a8f8b4b97, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000001020100000, %r1, %r9
	setx	0x127a7a2a8f8b4b97, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e975be9048, %r1, %r9
	setx	0xa7981f52f2560263, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f6fa4350b8, %r1, %r9
	setx	0x9f7e73cab4da947e, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d6bbc6bed1, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000c00c85954b, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800fe167c0, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800eb672dd, %r1, %r12
	ldub	[%r12], %r11
	setx	0x0000001030100000, %r1, %r9
	setx	0x9f7e73cab4da947e, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e140ec8d0e, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d21c33886e, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000c9a8309d8a, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800ff3654a, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e31c68a, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000f66290910e, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d11c9e4e44, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000cae1d57170, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800f50ee30, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800e2ff84c, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000fe3a2ca2d8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000eb4dd4e3c4, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000dc6df004a4, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000d4b6b44788, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000c567cfa1c0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800fc8fa98, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800ecfef48, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000f6fa4350b8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000e6691e1f38, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000d0fd983dd0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x0000008050730bd7, %r1, %r9
	setx	0xfdad82eece50a802, %r1, %r10
	stb	%r10, [%r9]
	setx	0x00000010b0100000, %r1, %r9
	setx	0xfdad82eece50a802, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800e31c35c, %r1, %r9
	setx	0x5b44b74d98c485d1, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800fea8181, %r1, %r9
	setx	0x8d6484bd4205cfd7, %r1, %r10
	stb	%r10, [%r9]
	setx	0x0000001030100000, %r1, %r9
	setx	0x8d6484bd4205cfd7, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000cd8647f75c, %r1, %r9
	setx	0xc1b05e024ea0ec98, %r1, %r10
	stb	%r10, [%r9]
	setx	0x0000001020100000, %r1, %r9
	setx	0xc1b05e024ea0ec98, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000dd9c83bff6, %r1, %r9
	setx	0xad08be9cf65a596d, %r1, %r10
	stb	%r10, [%r9]
	setx	0x0000001010100000, %r1, %r9
	setx	0xad08be9cf65a596d, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e6c6da6aa3, %r1, %r9
	setx	0x01165d8d78b42b15, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000fec9649e27, %r1, %r9
	setx	0x477913f1aea10f22, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800ec0fe12, %r1, %r9
	setx	0x29aff25565db64b5, %r1, %r10
	sth	%r10, [%r9]
	setx	0x0000001010100000, %r1, %r9
	setx	0x29aff25565db64b5, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f68f9f0, %r1, %r9
	setx	0xcf397b6c8e91f71d, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c33a64992c, %r1, %r9
	setx	0x4ec53a354c6d6701, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000dd7deaa096, %r1, %r9
	setx	0x004df5cb804befc2, %r1, %r10
	sth	%r10, [%r9]
	setx	0x0000001030100000, %r1, %r9
	setx	0x004df5cb804befc2, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e5cf4139e8, %r1, %r9
	setx	0x834550125a59165f, %r1, %r10
	sth	%r10, [%r9]
	setx	0x00000010b0100000, %r1, %r9
	setx	0x834550125a59165f, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f28dc0f12e, %r1, %r9
	setx	0x037df10f9f78f094, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800eeb1248, %r1, %r9
	setx	0xf4f8627982d81140, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f944024, %r1, %r9
	setx	0x3a1ff923b7f20355, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c7199eea64, %r1, %r9
	setx	0x562c2f7f40398229, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d03d19e1dc, %r1, %r9
	setx	0x0e38fd1a4c3a95f9, %r1, %r10
	stw	%r10, [%r9]
	setx	0x0000001010100000, %r1, %r9
	setx	0x0e38fd1a4c3a95f9, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e14c6a446c, %r1, %r9
	setx	0x56820524f437d06e, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f54ea9c5a0, %r1, %r9
	setx	0x4e063f56c3c1d09b, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e875470, %r1, %r9
	setx	0xd6fde26a928bd316, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f280f98, %r1, %r9
	setx	0x4db9b06561fc58fb, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c37fc0ea98, %r1, %r9
	setx	0xc4683820e9924a85, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000dc130eedc0, %r1, %r9
	setx	0x31800dce457f009f, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000001030100000, %r1, %r9
	setx	0x31800dce457f009f, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000e3cd121168, %r1, %r9
	setx	0xf37826c612514618, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f6fa4350b8, %r1, %r9
	setx	0x46201048fa67cf1d, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c8458b2fcd, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800f3d85d9, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800e86f372, %r1, %r12
	ldub	[%r12], %r11
	setx	0x0000001070100000, %r1, %r9
	setx	0x46201048fa67cf1d, %r1, %r10
	ldx	[%r9], %r10
	setx	0x00000080c42341a6, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000f46aae3041, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000e16a0b67f9, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000d2e9792354, %r1, %r12
	ldub	[%r12], %r11
	setx	0x00000010f0100000, %r1, %r9
	setx	0x46201048fa67cf1d, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800f416ff8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800e3a35e0, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000f0f6a2569c, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000e455003290, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000d3ab157cb0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000c55ed38218, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800f0f7750, %r1, %r12
	ldx	[%r12], %r11
	setx	0x00000080c75de036, %r1, %r9
	setx	0xad4becb7ece81a33, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800efbaae2, %r1, %r9
	setx	0x76b86dc201f81924, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f9936e9, %r1, %r9
	setx	0xb50ac4bddc0b7c9b, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000cdc75861fa, %r1, %r9
	setx	0xaa0c8878508d9d99, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d3897a26a8, %r1, %r9
	setx	0xe20f9b7146d9f47e, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e934984d18, %r1, %r9
	setx	0xb005ebcfc0f26149, %r1, %r10
	stb	%r10, [%r9]
	setx	0x0000001020100000, %r1, %r9
	setx	0xb005ebcfc0f26149, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000fd8df894e3, %r1, %r9
	setx	0xc6b50bb8fa1965c2, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e3fb424, %r1, %r9
	setx	0x849fc33b7d286c92, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f9805a8, %r1, %r9
	setx	0x6588a5b507323003, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c5018e6c9e, %r1, %r9
	setx	0xec10aa5d3722eae8, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d0a2dbf066, %r1, %r9
	setx	0xfb39c15770f33744, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e1640961f6, %r1, %r9
	setx	0xbcc62862a9c44e49, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000fd7bdcce20, %r1, %r9
	setx	0x5ced6992d6c78366, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e060d10, %r1, %r9
	setx	0x0fbd5820daf2475a, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f6fd724, %r1, %r9
	setx	0x79413005f1395df7, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000cf5ca43ea4, %r1, %r9
	setx	0x16ca4b17eda820a2, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000dfadfa66c0, %r1, %r9
	setx	0x3f1e8f51642977db, %r1, %r10
	stw	%r10, [%r9]
	setx	0x0000001060100000, %r1, %r9
	setx	0x3f1e8f51642977db, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ec3229f5bc, %r1, %r9
	setx	0x2f9b56a031ab942e, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f688c729e8, %r1, %r9
	setx	0x1dc76fb0ede11178, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800ed0cf00, %r1, %r9
	setx	0x4335ed821ebf4799, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800fa5ed50, %r1, %r9
	setx	0x6b097a7f15914f2e, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000cd01a20500, %r1, %r9
	setx	0x354ce2e2568c5bdc, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000001090100000, %r1, %r9
	setx	0x354ce2e2568c5bdc, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000d2c96fdf88, %r1, %r9
	setx	0xf1a29bea69600d69, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ebe4adfc10, %r1, %r9
	setx	0x08ff01bdcb865afd, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f6fa4350b8, %r1, %r9
	setx	0x327672d23330ee1e, %r1, %r10
	stx	%r10, [%r9]
	setx	0x00000010f0100000, %r1, %r9
	setx	0x327672d23330ee1e, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000f46aae3041, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000e16a0b67f9, %r1, %r12
	ldub	[%r12], %r11
	setx	0x0000001020100000, %r1, %r9
	setx	0x327672d23330ee1e, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000d2e9792354, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000ec15a4d218, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000dd28efb178, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000cd6b151ad4, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000e3cd121168, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000dc130eedc0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000c37fc0ea98, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800f280f98, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e875470, %r1, %r12
	ldx	[%r12], %r11
	setx	0x00000080bf7ec585, %r1, %r9
	setx	0xfee9e563d7a8e809, %r1, %r10
	stb	%r10, [%r9]
	setx	0x0000001080100000, %r1, %r9
	setx	0xfee9e563d7a8e809, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800e416a3a, %r1, %r9
	setx	0xf11c239984670bf8, %r1, %r10
	stb	%r10, [%r9]
	setx	0x0000001000100000, %r1, %r9
	setx	0xf11c239984670bf8, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f07bad7, %r1, %r9
	setx	0x001666dac32e78cf, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c457e28b54, %r1, %r9
	setx	0x8d3cfd225ae183f4, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d215674908, %r1, %r9
	setx	0x08449a603039c3e2, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e77c753ce3, %r1, %r9
	setx	0x94b4ff6ab88ed641, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f59464dbcf, %r1, %r9
	setx	0xca5f6663c997269e, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e8e65f2, %r1, %r9
	setx	0x8afb3903e22e947d, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f11fe4e, %r1, %r9
	setx	0x05cedebad0f43405, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c217ef4994, %r1, %r9
	setx	0xaffa0728dc3f2105, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000dae00bbb4c, %r1, %r9
	setx	0xc3547099c9b8dfb2, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000ef37140b6a, %r1, %r9
	setx	0x946ef0ca3412d051, %r1, %r10
	sth	%r10, [%r9]
	setx	0x0000001020100000, %r1, %r9
	setx	0x946ef0ca3412d051, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000fb6b3b924c, %r1, %r9
	setx	0xc534e30daa26cfa7, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e8dea78, %r1, %r9
	setx	0x5944108149d8c14e, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f30f600, %r1, %r9
	setx	0xa3b3105f589fc2d8, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c95d360078, %r1, %r9
	setx	0xfcc75430cf2e377d, %r1, %r10
	stw	%r10, [%r9]
	setx	0x0000001050100000, %r1, %r9
	setx	0xfcc75430cf2e377d, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000de8c8ba400, %r1, %r9
	setx	0xa0647dba8313825e, %r1, %r10
	stw	%r10, [%r9]
	setx	0x0000001040100000, %r1, %r9
	setx	0xa0647dba8313825e, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e34714d918, %r1, %r9
	setx	0x7405101478a53fd0, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000fa96ee6bf8, %r1, %r9
	setx	0x721f0a905f2ed39b, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e0c5f68, %r1, %r9
	setx	0xc781281be1bab11b, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f2e3d10, %r1, %r9
	setx	0x71b33472a9cc1c98, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000001060100000, %r1, %r9
	setx	0x71b33472a9cc1c98, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c1fb3516a0, %r1, %r9
	setx	0x020678c7c09e5126, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d6835a32e8, %r1, %r9
	setx	0xeeded228d4d1fb5b, %r1, %r10
	stx	%r10, [%r9]
	setx	0x00000010f0100000, %r1, %r9
	setx	0xeeded228d4d1fb5b, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000e51cd698f0, %r1, %r9
	setx	0x171f4836fd994be8, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000001070100000, %r1, %r9
	setx	0x171f4836fd994be8, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f6fa4350b8, %r1, %r9
	setx	0xeaea944e6492eaca, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f868291, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000e24b237974, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000807ec023db, %r1, %r9
	setx	0xf410961bce34151b, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e5da3d9, %r1, %r9
	setx	0x0db12914b78f55d7, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f4c7602, %r1, %r9
	setx	0x127067b829ced939, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c19d776cbb, %r1, %r9
	setx	0x3b71e4a1756b99bb, %r1, %r10
	stb	%r10, [%r9]
	setx	0x0000001040100000, %r1, %r9
	setx	0x3b71e4a1756b99bb, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000dbb9e894ab, %r1, %r9
	setx	0x1adb45e60d4ddb5c, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ea3f1a4e27, %r1, %r9
	setx	0x9521ef36427c75ab, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000fb347295f1, %r1, %r9
	setx	0xb5409f31721f5e21, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e925068, %r1, %r9
	setx	0xa6dc037cc1a54ee8, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f43a38a, %r1, %r9
	setx	0xf6e1b9baf0e1fcda, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c29d994fdc, %r1, %r9
	setx	0x658987fd5bf26adc, %r1, %r10
	sth	%r10, [%r9]
	setx	0x0000001060100000, %r1, %r9
	setx	0x658987fd5bf26adc, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000d672693ed2, %r1, %r9
	setx	0x78fc0726ec666b27, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e9d292fc3a, %r1, %r9
	setx	0x7323d2cffa3e57c3, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f246bf4890, %r1, %r9
	setx	0x33c920056210268c, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e042334, %r1, %r9
	setx	0xfdca7960a54f10dc, %r1, %r10
	stw	%r10, [%r9]
	setx	0x0000001080100000, %r1, %r9
	setx	0xfdca7960a54f10dc, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800fc5ce50, %r1, %r9
	setx	0x90307ba03521ed57, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000cdf221d704, %r1, %r9
	setx	0xbded9e2ed41c9c79, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d9e3620408, %r1, %r9
	setx	0x0f7943009e074557, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e59f83c420, %r1, %r9
	setx	0xc7c30d173f858d7d, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f848d3d4ec, %r1, %r9
	setx	0xf0854f49d85fb74d, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e445cb0, %r1, %r9
	setx	0xe52e33325da0cf06, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f49a370, %r1, %r9
	setx	0xf22c29172e4c2c0b, %r1, %r10
	stx	%r10, [%r9]
	setx	0x00000010d0100000, %r1, %r9
	setx	0xf22c29172e4c2c0b, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000c98e60e808, %r1, %r9
	setx	0xa98350d3381ee2b3, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000dc8a3ce6f0, %r1, %r9
	setx	0x3fdbacb49266fa70, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ed03d6b8e0, %r1, %r9
	setx	0xcda5b2766bf79936, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f6fa4350b8, %r1, %r9
	setx	0xf569df26f0e4f12e, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ef2b8ed1d0, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800f57493e, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e9d0002, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000f688c729e8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000ec3229f5bc, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000dfadfa66c0, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000cf5ca43ea4, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800f6fd724, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800e060d10, %r1, %r12
	lduw	[%r12], %r11
	setx	0x00000080e67d0e30, %r1, %r9
	setx	0x6b1bea3f57cc3138, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e74225b, %r1, %r9
	setx	0x3310701a44dbaffe, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800fb63c9f, %r1, %r9
	setx	0xf16c1cd8c41c861e, %r1, %r10
	stb	%r10, [%r9]
	setx	0x00000010f0100000, %r1, %r9
	setx	0xf16c1cd8c41c861e, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c43f21986d, %r1, %r9
	setx	0xc4d6a0ba6c362916, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d61d33dc4f, %r1, %r9
	setx	0x7da04ba1c8e21c9d, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e155494098, %r1, %r9
	setx	0x5fdafc2b517ec929, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f54157c8e9, %r1, %r9
	setx	0xe61ca9d0773683b4, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e72cf5e, %r1, %r9
	setx	0x01eb7858fcdcddc0, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f1158b0, %r1, %r9
	setx	0x108203368a484b78, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c76d9bc620, %r1, %r9
	setx	0xf7f28f228a560fed, %r1, %r10
	sth	%r10, [%r9]
	setx	0x00000010e0100000, %r1, %r9
	setx	0xf7f28f228a560fed, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000d3604d95c4, %r1, %r9
	setx	0x1930d8d94972804a, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e321ea6f08, %r1, %r9
	setx	0x75e282e2bd4f9fe1, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000fae020034a, %r1, %r9
	setx	0x97829b0d5f2081c6, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e064670, %r1, %r9
	setx	0x3d7597bcf4b116df, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f10bebc, %r1, %r9
	setx	0x5542d28828baf4cf, %r1, %r10
	stw	%r10, [%r9]
	setx	0x0000001090100000, %r1, %r9
	setx	0x5542d28828baf4cf, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000c0d0cdbde4, %r1, %r9
	setx	0x26ca1956e1f17b7d, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000dc7fccc914, %r1, %r9
	setx	0x03419a12edf618cf, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e35140dad4, %r1, %r9
	setx	0xbc38bb45232f16d9, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f71d4db568, %r1, %r9
	setx	0x7cfc2b640fd8a070, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e655038, %r1, %r9
	setx	0x9aaa5fb6e9fcc71b, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f2fd4f8, %r1, %r9
	setx	0x04007cac4b9c4b9c, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c6b1ff3588, %r1, %r9
	setx	0x1838988f085fb64f, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d6a16c5cf8, %r1, %r9
	setx	0xc8801827d6d31d3d, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e4dbf597d0, %r1, %r9
	setx	0xa35954545a2a01c9, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f6fa4350b8, %r1, %r9
	setx	0xfedb975371ca369a, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800e5b552b, %r1, %r12
	ldub	[%r12], %r11
	setx	0x0000008085ee78d9, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000f8a3890b2c, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000ed2397a331, %r1, %r12
	ldub	[%r12], %r11
	setx	0x0000001050100000, %r1, %r9
	setx	0xfedb975371ca369a, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d5f26539dd, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800e9d0002, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000f814762c06, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000ed9163e386, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d10415f5ce, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000cb6957a84e, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800ff2ba46, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000eb4dd4e3c4, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000dc6df004a4, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000c87ef7c35c, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800f36dd8c, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800e5c6f74, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000f8f35f9024, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000e51cd698f0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000d6835a32e8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000c1fb3516a0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800f2e3d10, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e0c5f68, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000f6fa4350b8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x0000008097b1f3b4, %r1, %r9
	setx	0xf30f79471b43cbbe, %r1, %r10
	stb	%r10, [%r9]
	setx	0x00000010b0100000, %r1, %r9
	setx	0xf30f79471b43cbbe, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800ed66221, %r1, %r9
	setx	0x5ec9cc7e10435a44, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f594769, %r1, %r9
	setx	0xf816ef5e61eeeff1, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000cb7d38a926, %r1, %r9
	setx	0x95de940e7d01942c, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000da5b0e460d, %r1, %r9
	setx	0xad95c1544bd158b1, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ea1a3a5f10, %r1, %r9
	setx	0x89373dd56fee38d1, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f3807f6030, %r1, %r9
	setx	0x9f1f9cf43b312ec5, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e426e4c, %r1, %r9
	setx	0x89e3a6e79c335fa1, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f3aa284, %r1, %r9
	setx	0x8b72086aebb8fd7c, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000cd12031b2e, %r1, %r9
	setx	0x8048746ded1a5685, %r1, %r10
	sth	%r10, [%r9]
	setx	0x0000001000100000, %r1, %r9
	setx	0x8048746ded1a5685, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d1fdb3c98c, %r1, %r9
	setx	0xc6f4684907d4be1c, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000ebf7995404, %r1, %r9
	setx	0x7be8cbd081a6f5c0, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f81dc843c0, %r1, %r9
	setx	0x34dc8e044a771084, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800ed27c0c, %r1, %r9
	setx	0x895902e8b39845bf, %r1, %r10
	stw	%r10, [%r9]
	setx	0x0000001050100000, %r1, %r9
	setx	0x895902e8b39845bf, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800fe17018, %r1, %r9
	setx	0xc8cf340007fbc48c, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000ce642d182c, %r1, %r9
	setx	0x34bb3b6b5f7f4814, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d2fa58ec1c, %r1, %r9
	setx	0x61a49c7f3a309de3, %r1, %r10
	stw	%r10, [%r9]
	setx	0x0000001020100000, %r1, %r9
	setx	0x61a49c7f3a309de3, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e706fac58c, %r1, %r9
	setx	0xbc459ea51f78d2a1, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f50217d050, %r1, %r9
	setx	0xe78ed8768735e392, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e00caa0, %r1, %r9
	setx	0x8f1bb0c75519eec2, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800fd15f50, %r1, %r9
	setx	0xe72c6ada5ca47334, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000cde32bd430, %r1, %r9
	setx	0xe387ea43650d818d, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d591b015f0, %r1, %r9
	setx	0xde7125948a141af9, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e6264af3b8, %r1, %r9
	setx	0x929fe34cf16ee879, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f6fa4350b8, %r1, %r9
	setx	0x06f006c1830391fa, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e4170904e5, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000d2f8b440e0, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000cc4cd53503, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800fea039a, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800e3a7680, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000f1196368f4, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000e140ec8d0e, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d21c33886e, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000c9a8309d8a, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800ff3654a, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e3a35e0, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000f0f6a2569c, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000e455003290, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000d8a78bdd88, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000ce139dd76c, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000f6fa4350b8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000eb5dc7e600, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000d2117b6610, %r1, %r12
	ldx	[%r12], %r11
	setx	0x0000008060becbec, %r1, %r9
	setx	0x52b511ffb159694a, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e94850c, %r1, %r9
	setx	0x5b6af0e0d4bab72a, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f062bf3, %r1, %r9
	setx	0xdf14d180b2bbf761, %r1, %r10
	stb	%r10, [%r9]
	setx	0x00000010f0100000, %r1, %r9
	setx	0xdf14d180b2bbf761, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000c1bfb04937, %r1, %r9
	setx	0xfe3668d699b82d3a, %r1, %r10
	stb	%r10, [%r9]
	setx	0x00000010d0100000, %r1, %r9
	setx	0xfe3668d699b82d3a, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000d69243edee, %r1, %r9
	setx	0xcbb01fe5b215cb36, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e7ef3613d3, %r1, %r9
	setx	0xd3e9c0fb7cf58804, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000fdf7c67a31, %r1, %r9
	setx	0xb12880ee1b05519b, %r1, %r10
	stb	%r10, [%r9]
	setx	0x0000001000100000, %r1, %r9
	setx	0xb12880ee1b05519b, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800e000f0e, %r1, %r9
	setx	0x1546b0696f54dfb7, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f16f74c, %r1, %r9
	setx	0x120108dabb669c24, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c7922c17a4, %r1, %r9
	setx	0x175495bd6d4d5044, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000def5fd2b22, %r1, %r9
	setx	0xd90d8b30ddf9d175, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e914bb0e3c, %r1, %r9
	setx	0xac4c071b2041bc1b, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000fa9db9d322, %r1, %r9
	setx	0x4263e5a4beedce19, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e1c480c, %r1, %r9
	setx	0x30f4c74dca5aaa9b, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800fe6e690, %r1, %r9
	setx	0x9b1cf7a5ece3102a, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000ca696827f0, %r1, %r9
	setx	0x1603acba0c6fd82d, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d70c79997c, %r1, %r9
	setx	0x2a2fc3ae8129be8e, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e221e3874c, %r1, %r9
	setx	0xf580560660924cd9, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f7ca6c3af4, %r1, %r9
	setx	0x73cbb2ff9d6a701a, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e18f720, %r1, %r9
	setx	0x7a12581c6ac16369, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f822560, %r1, %r9
	setx	0x93cdef3c6157c5e0, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c204b1e388, %r1, %r9
	setx	0x5d369c7c44768bed, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000001080100000, %r1, %r9
	setx	0x5d369c7c44768bed, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d2969dcfe0, %r1, %r9
	setx	0xf1993ca43cd80b8e, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000001080100000, %r1, %r9
	setx	0xf1993ca43cd80b8e, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000e85fd2bcb8, %r1, %r9
	setx	0x8860e969204bf0c9, %r1, %r10
	stx	%r10, [%r9]
	setx	0x00000010a0100000, %r1, %r9
	setx	0x8860e969204bf0c9, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f6fa4350b8, %r1, %r9
	setx	0x9736861f1c85006d, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f4c7602, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800e5da3d9, %r1, %r12
	ldub	[%r12], %r11
	setx	0x00000010a0100000, %r1, %r9
	setx	0x9736861f1c85006d, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000807ec023db, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000f59464dbcf, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000d25d33b676, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000cd8c3b75de, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800fb4ff70, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800f5a201c, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800f5619b8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000802a9717f6, %r1, %r9
	setx	0x76aa9d8e0276b96c, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e5d2159, %r1, %r9
	setx	0x865f7a4d386158f1, %r1, %r10
	stb	%r10, [%r9]
	setx	0x0000001080100000, %r1, %r9
	setx	0x865f7a4d386158f1, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800f49265d, %r1, %r9
	setx	0x9a2f0e6bd8654fdc, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ce8946f2c7, %r1, %r9
	setx	0xc2cc6cca5039ae7d, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000dda7484f08, %r1, %r9
	setx	0x51f737ea06e8929f, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ecbc03b19a, %r1, %r9
	setx	0x43812bdcabe80daf, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f6333c6d9f, %r1, %r9
	setx	0x366113e42bf439e0, %r1, %r10
	stb	%r10, [%r9]
	setx	0x00000010d0100000, %r1, %r9
	setx	0x366113e42bf439e0, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800eb3102e, %r1, %r9
	setx	0x33869052083f29fe, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800fef973c, %r1, %r9
	setx	0x07fb174503d3f285, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000ce77c4e294, %r1, %r9
	setx	0x2eb10ab3b051717c, %r1, %r10
	sth	%r10, [%r9]
	setx	0x0000001070100000, %r1, %r9
	setx	0x2eb10ab3b051717c, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000db8705763a, %r1, %r9
	setx	0x7ccfc709cd5817fc, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e3688b2f9e, %r1, %r9
	setx	0x837cd8d11431349c, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f593c5843c, %r1, %r9
	setx	0xdb52a3e11ce33d48, %r1, %r10
	sth	%r10, [%r9]
	setx	0x00000010c0100000, %r1, %r9
	setx	0xdb52a3e11ce33d48, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800e12913c, %r1, %r9
	setx	0xa14275c5bdc817ab, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800feb8a78, %r1, %r9
	setx	0xd44784f6cb3d539a, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c8991a6640, %r1, %r9
	setx	0x5a1760440eae802a, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d2fd56bb74, %r1, %r9
	setx	0x50693d4739eacd89, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e6c1928534, %r1, %r9
	setx	0x7b26b09822142426, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000fc6ed54c04, %r1, %r9
	setx	0x9911ac8b3e27c42f, %r1, %r10
	stw	%r10, [%r9]
	setx	0x00000010c0100000, %r1, %r9
	setx	0x9911ac8b3e27c42f, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800e973d78, %r1, %r9
	setx	0xf97db1f338bd5d19, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800fbf83c8, %r1, %r9
	setx	0xcfa1481a76caeeef, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c6f150bb60, %r1, %r9
	setx	0xa9ed671a74d16ca5, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d2c2559050, %r1, %r9
	setx	0x4f5948fcf2a802c7, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ee69423360, %r1, %r9
	setx	0x3a649729e8f8751e, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f6fa4350b8, %r1, %r9
	setx	0xe31a28e4b4997494, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c1bf2372c2, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800fc56df8, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800ec41aa4, %r1, %r12
	ldub	[%r12], %r11
	setx	0x00000080d0cbe8d2, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000f7bbce5847, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800e5157cc, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000f4af11aafc, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000c8991a6640, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800feb8a78, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800e12913c, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000f7ca6c3af4, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000e221e3874c, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000d70c79997c, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000d2117b6610, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000ced6e06050, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800f5b1238, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e2de148, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000802271a680, %r1, %r9
	setx	0xd66ff6730dc9a836, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800ed15d96, %r1, %r9
	setx	0x887140872e5ac817, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f60bba5, %r1, %r9
	setx	0x504a7f8c90b9526a, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c5f6d99fe0, %r1, %r9
	setx	0x1255a38f6d79905a, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000de5515c80f, %r1, %r9
	setx	0x68e54d965ef2ccee, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e2cfac956c, %r1, %r9
	setx	0xbd2d4f89ef924095, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000fc3ada00b5, %r1, %r9
	setx	0x119c7bb07b160d17, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800ef24ed0, %r1, %r9
	setx	0x59940cffe9adc4f7, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f0404ee, %r1, %r9
	setx	0x10aebad01bea96bc, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c74bdd0ae4, %r1, %r9
	setx	0xaa3087af5f801e9f, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000db8fd397ae, %r1, %r9
	setx	0x88514bb9e3e7af14, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e346450844, %r1, %r9
	setx	0xd92d623bd39111c6, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f43679392c, %r1, %r9
	setx	0xf08532fcc2dd6a45, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800ede75e4, %r1, %r9
	setx	0x744282006063ba4f, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800fb05e4c, %r1, %r9
	setx	0x53f3d2f86998c8b9, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c00bb972b0, %r1, %r9
	setx	0x87a422e552ce5253, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d6e3909e30, %r1, %r9
	setx	0x4d7ed974d6e0e83f, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000eb3d85b4d8, %r1, %r9
	setx	0x074d37c015be869c, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000fd02051448, %r1, %r9
	setx	0x0ea846df23d376e3, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e547488, %r1, %r9
	setx	0xd6c8d1b6c9f09c82, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f4a3578, %r1, %r9
	setx	0x766bd77db5b71a1f, %r1, %r10
	stx	%r10, [%r9]
	setx	0x00000010d0100000, %r1, %r9
	setx	0x766bd77db5b71a1f, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000cf79240470, %r1, %r9
	setx	0x808d54a426cd1f8f, %r1, %r10
	stx	%r10, [%r9]
	setx	0x00000010e0100000, %r1, %r9
	setx	0x808d54a426cd1f8f, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d835a0b968, %r1, %r9
	setx	0xff88701e8012249c, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e73c12cda0, %r1, %r9
	setx	0x035355c100f874ca, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f6fa4350b8, %r1, %r9
	setx	0x9acc3cb58ec9f090, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ef37140b6a, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000dae00bbb4c, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000c217ef4994, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800f11fe4e, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000e8a52f2750, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000da5fac2570, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000c743a2e7f4, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800f090324, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800e3c2840, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000f4a271139c, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000e5e04f1118, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800f231e30, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800ea35338, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000803ae3d9c3, %r1, %r9
	setx	0xbf37a8e02c48d56f, %r1, %r10
	stb	%r10, [%r9]
	setx	0x00000010d0100000, %r1, %r9
	setx	0xbf37a8e02c48d56f, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800ee959a8, %r1, %r9
	setx	0x0511024dbc3af8ce, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800fd37bd4, %r1, %r9
	setx	0xd9714b9035f6cd5e, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000cc9e78fb9a, %r1, %r9
	setx	0xf27597efd7c26c02, %r1, %r10
	stb	%r10, [%r9]
	setx	0x0000001080100000, %r1, %r9
	setx	0xf27597efd7c26c02, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d8d51fa557, %r1, %r9
	setx	0x44eba0b04682220b, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ea56743574, %r1, %r9
	setx	0x371f98f443872c21, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000faa252e082, %r1, %r9
	setx	0xacbf12bade1cc9f5, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e7272a4, %r1, %r9
	setx	0x5d562328f755cf01, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f7e6114, %r1, %r9
	setx	0x702285fea312704a, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c515c6700c, %r1, %r9
	setx	0xc6e3621fa52cd3f7, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d1e80b58de, %r1, %r9
	setx	0xb36d6dec92c5e156, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e5aa4c0c9c, %r1, %r9
	setx	0xcf51b2b9cdd00d27, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000fbc9b1f1e0, %r1, %r9
	setx	0xe97f84695248127f, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e6378d0, %r1, %r9
	setx	0xc434117e45b0def3, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f9cbc40, %r1, %r9
	setx	0x7b6ab7bd5e255fab, %r1, %r10
	stw	%r10, [%r9]
	setx	0x0000001050100000, %r1, %r9
	setx	0x7b6ab7bd5e255fab, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000c7850be6cc, %r1, %r9
	setx	0x4af499768bac3731, %r1, %r10
	stw	%r10, [%r9]
	setx	0x0000001050100000, %r1, %r9
	setx	0x4af499768bac3731, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000d669f497f0, %r1, %r9
	setx	0x6aaac13c225fb014, %r1, %r10
	stw	%r10, [%r9]
	setx	0x00000010b0100000, %r1, %r9
	setx	0x6aaac13c225fb014, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000ef561a6a48, %r1, %r9
	setx	0xf3675bc9f1ac8704, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f65bc638e8, %r1, %r9
	setx	0xd26ba0c8e2130243, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800ed11600, %r1, %r9
	setx	0xecc701958cda4a62, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f2d2350, %r1, %r9
	setx	0x7ad266b4b60b2d53, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ce85015ba0, %r1, %r9
	setx	0x0d1812ff1e7eede5, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000001090100000, %r1, %r9
	setx	0x0d1812ff1e7eede5, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000d85d798748, %r1, %r9
	setx	0x92530669b5e2a4d8, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e834395cf8, %r1, %r9
	setx	0x0baf5513bdea05f5, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f6fa4350b8, %r1, %r9
	setx	0x3c637020be04ca69, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800fb63c9f, %r1, %r12
	ldub	[%r12], %r11
	setx	0x0000001030100000, %r1, %r9
	setx	0x3c637020be04ca69, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000cae1d57170, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800f50ee30, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800e2ff84c, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000fe3a2ca2d8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000e3cd121168, %r1, %r12
	ldx	[%r12], %r11
	setx	0x00000080ee7d5669, %r1, %r9
	setx	0x98c741cdd413afdd, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e429bf6, %r1, %r9
	setx	0xc3618182a98aaff9, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f88952c, %r1, %r9
	setx	0xbe4cf5feabc4a6ca, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c04dcf9e2b, %r1, %r9
	setx	0x26fe5c0cfdccd566, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000de5c6fff62, %r1, %r9
	setx	0xae72e34f38d33c0b, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e8a5c34450, %r1, %r9
	setx	0xd400c7ed24d05912, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f12f2f4177, %r1, %r9
	setx	0x242fd2f8ecdf38dd, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800eb9c684, %r1, %r9
	setx	0x3e9eca19050e58ef, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800faf48ba, %r1, %r9
	setx	0x34edef5a7d272dbe, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c380a04944, %r1, %r9
	setx	0x50f2f18f6a043f98, %r1, %r10
	sth	%r10, [%r9]
	setx	0x0000001070100000, %r1, %r9
	setx	0x50f2f18f6a043f98, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000db6007fc64, %r1, %r9
	setx	0xbf18410141a9a494, %r1, %r10
	sth	%r10, [%r9]
	setx	0x0000001060100000, %r1, %r9
	setx	0xbf18410141a9a494, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000e7348452ee, %r1, %r9
	setx	0x82b34d361f7184d2, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f09aeacd54, %r1, %r9
	setx	0x51a870dec67a4deb, %r1, %r10
	sth	%r10, [%r9]
	setx	0x0000001080100000, %r1, %r9
	setx	0x51a870dec67a4deb, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800e6dd894, %r1, %r9
	setx	0xe6353347cf111b83, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f4e2804, %r1, %r9
	setx	0x0745d0908560297f, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c7ea083208, %r1, %r9
	setx	0xafb89866d9023667, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000de34f29f30, %r1, %r9
	setx	0x77a0d67aee124601, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e6de2eb83c, %r1, %r9
	setx	0x95f8dc5216ab3445, %r1, %r10
	stw	%r10, [%r9]
	setx	0x0000001080100000, %r1, %r9
	setx	0x95f8dc5216ab3445, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f825b8c854, %r1, %r9
	setx	0x1cd8de29e4a3ef95, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e9ed148, %r1, %r9
	setx	0xc927dd67c7acaf7c, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800fdeb598, %r1, %r9
	setx	0xbe1107c620686413, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c5d15cc350, %r1, %r9
	setx	0xec8b6da455084b5d, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000001080100000, %r1, %r9
	setx	0xec8b6da455084b5d, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000df3a921388, %r1, %r9
	setx	0x17e22b6d32894c60, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e6dfcebea0, %r1, %r9
	setx	0xbd77d300fcff69d5, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f6fa4350b8, %r1, %r9
	setx	0xbc1b3a97f6dd8986, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000001030100000, %r1, %r9
	setx	0xbc1b3a97f6dd8986, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000cc9e78fb9a, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800fd37bd4, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800ee959a8, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000803ae3d9c3, %r1, %r12
	ldub	[%r12], %r11
	setx	0x0000001000100000, %r1, %r9
	setx	0xbc1b3a97f6dd8986, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f4bca5840e, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d669f497f0, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000c7850be6cc, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800f557fa0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e3bad38, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000f6fa4350b8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000e6a2d4f998, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000dc7d3ee748, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000ce1bf52730, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800f22ade0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x00000080f6dbfed6, %r1, %r9
	setx	0xf2ff747f34ca7c16, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800ecafed6, %r1, %r9
	setx	0xcbc54c35402d8f52, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f046fb7, %r1, %r9
	setx	0xccb0e77b32e175fb, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c1d2f68a6a, %r1, %r9
	setx	0xdf117e7276322546, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d1561844f0, %r1, %r9
	setx	0x233690d5e7ef7408, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e165a701ef, %r1, %r9
	setx	0x480c8447f5f5bada, %r1, %r10
	stb	%r10, [%r9]
	setx	0x00000010d0100000, %r1, %r9
	setx	0x480c8447f5f5bada, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000fc43f258a5, %r1, %r9
	setx	0xdcb02828275a97a6, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800ede2a00, %r1, %r9
	setx	0xb232408a4dd48f06, %r1, %r10
	sth	%r10, [%r9]
	setx	0x00000010c0100000, %r1, %r9
	setx	0xb232408a4dd48f06, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800fda435e, %r1, %r9
	setx	0x8d86298895e30a63, %r1, %r10
	sth	%r10, [%r9]
	setx	0x0000001090100000, %r1, %r9
	setx	0x8d86298895e30a63, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000cd6d13bcf0, %r1, %r9
	setx	0xde669e91d0895eaa, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d16e10b05e, %r1, %r9
	setx	0xcefc2b003a904f40, %r1, %r10
	sth	%r10, [%r9]
	setx	0x00000010d0100000, %r1, %r9
	setx	0xcefc2b003a904f40, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e2e02525c8, %r1, %r9
	setx	0xa3bdcafd7f6b0f1a, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f09b4440d4, %r1, %r9
	setx	0xa9dad7d6f84b5a73, %r1, %r10
	sth	%r10, [%r9]
	setx	0x0000001070100000, %r1, %r9
	setx	0xa9dad7d6f84b5a73, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800ec3281c, %r1, %r9
	setx	0x8a78955bb41c43e3, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f94e1a0, %r1, %r9
	setx	0x135b3f18a726eacb, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000cccc3ab8ec, %r1, %r9
	setx	0xa96d75b1f3f5ac22, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000dc3a934038, %r1, %r9
	setx	0xc6824704ea8e374c, %r1, %r10
	stw	%r10, [%r9]
	setx	0x00000010e0100000, %r1, %r9
	setx	0xc6824704ea8e374c, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000e0006d18e4, %r1, %r9
	setx	0xe9aaac3be01d8e63, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000fe17120448, %r1, %r9
	setx	0x4b30e6a98ba29ca3, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e1609f0, %r1, %r9
	setx	0xc81b15a47842c23a, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000001020100000, %r1, %r9
	setx	0xc81b15a47842c23a, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800f11fcd0, %r1, %r9
	setx	0x3b17b47276a8551c, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000001030100000, %r1, %r9
	setx	0x3b17b47276a8551c, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000c9a5ba6c78, %r1, %r9
	setx	0xcdf4ae764e001bbc, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000001090100000, %r1, %r9
	setx	0xcdf4ae764e001bbc, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000da2c6de520, %r1, %r9
	setx	0x9bc3031562309ea7, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e988f223b8, %r1, %r9
	setx	0x1b244d78460d9275, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f6fa4350b8, %r1, %r9
	setx	0xfafd17c49553181e, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000001050100000, %r1, %r9
	setx	0xfafd17c49553181e, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c41c1799db, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800fa4b827, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800e6f419c, %r1, %r12
	ldub	[%r12], %r11
	setx	0x00000080b5c55bfd, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000fba555f916, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000e030d15986, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d839c20f4c, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800ef6e630, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000fda12f5c94, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000e29d774ecc, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000d88ec444c4, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000c7ec1c4d8c, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800fa5fcac, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000f6fa4350b8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x0000008019d26c15, %r1, %r9
	setx	0x206878aa5dad8624, %r1, %r10
	stb	%r10, [%r9]
	setx	0x0000001000100000, %r1, %r9
	setx	0x206878aa5dad8624, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800efbb085, %r1, %r9
	setx	0x2b13a6db1b6e04de, %r1, %r10
	stb	%r10, [%r9]
	setx	0x0000001080100000, %r1, %r9
	setx	0x2b13a6db1b6e04de, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800f9417e9, %r1, %r9
	setx	0xf9ece30a144d405e, %r1, %r10
	stb	%r10, [%r9]
	setx	0x0000001020100000, %r1, %r9
	setx	0xf9ece30a144d405e, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c2aa63553b, %r1, %r9
	setx	0xc27314e6944f5aef, %r1, %r10
	stb	%r10, [%r9]
	setx	0x0000001090100000, %r1, %r9
	setx	0xc27314e6944f5aef, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000d7b81fb2f6, %r1, %r9
	setx	0x2e327f8ea0028518, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e89e2278a5, %r1, %r9
	setx	0x96875a3121088d3a, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000fb830ca203, %r1, %r9
	setx	0x58bd7272996b6ca7, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e83f076, %r1, %r9
	setx	0x1686d611fd60a579, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800ff5b6b0, %r1, %r9
	setx	0x11dfdc06734b8caf, %r1, %r10
	sth	%r10, [%r9]
	setx	0x0000001040100000, %r1, %r9
	setx	0x11dfdc06734b8caf, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000cee5adcf44, %r1, %r9
	setx	0xa04b588051702af8, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d77905b52e, %r1, %r9
	setx	0xfd89b4ff6352f8fc, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e6d1a0c208, %r1, %r9
	setx	0x564828486b54a2ee, %r1, %r10
	sth	%r10, [%r9]
	setx	0x00000010a0100000, %r1, %r9
	setx	0x564828486b54a2ee, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000fcb29e62fa, %r1, %r9
	setx	0xb04eb51cca364c54, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e2e4d0c, %r1, %r9
	setx	0xc04e929b43589183, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f5ec604, %r1, %r9
	setx	0x2204e01aa4c97482, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c13e43170c, %r1, %r9
	setx	0xda84b8289b5d04c6, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000dbd5f3aca4, %r1, %r9
	setx	0xb6f9f26feb0d6464, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e9eb44476c, %r1, %r9
	setx	0x1378ebe83e4fe4d8, %r1, %r10
	stw	%r10, [%r9]
	setx	0x0000001060100000, %r1, %r9
	setx	0x1378ebe83e4fe4d8, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000fadaa3d580, %r1, %r9
	setx	0x97e2660c0414a7bb, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e820b78, %r1, %r9
	setx	0xa0a183981384d5f2, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f4033e8, %r1, %r9
	setx	0x4a341f14053f0f95, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c8f3197508, %r1, %r9
	setx	0x627c845cb95102cf, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000001090100000, %r1, %r9
	setx	0x627c845cb95102cf, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d72c746bb0, %r1, %r9
	setx	0x854ad48613074956, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000001000100000, %r1, %r9
	setx	0x854ad48613074956, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000ed44435120, %r1, %r9
	setx	0xb7e7455b705b7ead, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f6fa4350b8, %r1, %r9
	setx	0xba61c23bde52ae05, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d9b52ae588, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000f98fdcf760, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000ebd2573220, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000db2f52104e, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000cfef6bdd9c, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800f508368, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e8c0c3c, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000fc7f6b60ec, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000ea30ce4060, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000d779d298bc, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000e83458b110, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000d6af529260, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000cbad342658, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800f9d8bf0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e9b0a70, %r1, %r12
	ldx	[%r12], %r11
	setx	0x00000080e57acace, %r1, %r9
	setx	0xfeecfd03c6628d41, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e52a57e, %r1, %r9
	setx	0xbb8cca136338d8e4, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800fb1852d, %r1, %r9
	setx	0xf883527953dc63b5, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c357327af2, %r1, %r9
	setx	0x228cfdc20c7e7be8, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000dde9bef7c1, %r1, %r9
	setx	0xf1d659d6c33fb8df, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e37d545fea, %r1, %r9
	setx	0x608840f30ebebba5, %r1, %r10
	stb	%r10, [%r9]
	setx	0x0000001020100000, %r1, %r9
	setx	0x608840f30ebebba5, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f65e427da9, %r1, %r9
	setx	0xe4ffe3cd24179f5c, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800eed8560, %r1, %r9
	setx	0x446e732e0c5846b8, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800fda5586, %r1, %r9
	setx	0xba75f3bbe24fd8e8, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000ca16240834, %r1, %r9
	setx	0x3a6b76e66425ba39, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000df0d1ed322, %r1, %r9
	setx	0xab9a01cc3fded2d3, %r1, %r10
	sth	%r10, [%r9]
	setx	0x00000010d0100000, %r1, %r9
	setx	0xab9a01cc3fded2d3, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ee58093a10, %r1, %r9
	setx	0x3f87206126edad4b, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f3b2c7899e, %r1, %r9
	setx	0xd5433b368bf6d402, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e84318c, %r1, %r9
	setx	0xc0a33a422165523c, %r1, %r10
	stw	%r10, [%r9]
	setx	0x00000010d0100000, %r1, %r9
	setx	0xc0a33a422165523c, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f81ea60, %r1, %r9
	setx	0xa4e9f41b80f90231, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000ceb0291ac4, %r1, %r9
	setx	0x1f93b786d7682238, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d1accaec6c, %r1, %r9
	setx	0x7d7ee67324d373a3, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000efc421402c, %r1, %r9
	setx	0x5fbb49f0e7e3e46d, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000fdd1de9a90, %r1, %r9
	setx	0x384dd945b1a2cc0a, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800ef02078, %r1, %r9
	setx	0x3301b1ff0059a460, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800fb02238, %r1, %r9
	setx	0x4df65a0155c75532, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c9fd30e6a8, %r1, %r9
	setx	0xf2f12e25215b29ee, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000001020100000, %r1, %r9
	setx	0xf2f12e25215b29ee, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000dfaf84d9d0, %r1, %r9
	setx	0x2bcf5615f22ee9ef, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e67c00fcd8, %r1, %r9
	setx	0xf1e3a71d1cceccf6, %r1, %r10
	stx	%r10, [%r9]
	setx	0x00000010e0100000, %r1, %r9
	setx	0xf1e3a71d1cceccf6, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000f6fa4350b8, %r1, %r9
	setx	0x50d5e095eb24533a, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000001000100000, %r1, %r9
	setx	0x50d5e095eb24533a, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f46aae3041, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000e16a0b67f9, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000d2e9792354, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000cd717f7446, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800fec3d53, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000ce139dd76c, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800f2a8d98, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800e275410, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000fb4a3af1c8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000e544d98388, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000d03f1bdd3c, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000c070690244, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000d921714748, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000c6724342d0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800f5619b8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x00000080109ce90b, %r1, %r9
	setx	0xe30866e221287af4, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e1eab43, %r1, %r9
	setx	0x626d98d1668ed0c6, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f1f83be, %r1, %r9
	setx	0x38bd696def3c356c, %r1, %r10
	stb	%r10, [%r9]
	setx	0x0000001070100000, %r1, %r9
	setx	0x38bd696def3c356c, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c1e11c40be, %r1, %r9
	setx	0x70bf805ff990c249, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000dff237b878, %r1, %r9
	setx	0x9163c0fa32d66773, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ef6f7d870c, %r1, %r9
	setx	0x07b75f89ead71502, %r1, %r10
	stb	%r10, [%r9]
	setx	0x00000010f0100000, %r1, %r9
	setx	0x07b75f89ead71502, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f453881773, %r1, %r9
	setx	0x65087e094ee25d64, %r1, %r10
	stb	%r10, [%r9]
	setx	0x00000010d0100000, %r1, %r9
	setx	0x65087e094ee25d64, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800e9ed5d6, %r1, %r9
	setx	0x24b002e3a49eae84, %r1, %r10
	sth	%r10, [%r9]
	setx	0x0000001090100000, %r1, %r9
	setx	0x24b002e3a49eae84, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800f680ba8, %r1, %r9
	setx	0xdf2ed6d18ec949fe, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000cda218cdac, %r1, %r9
	setx	0x76fb5dcaf0e8172f, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000dfed531488, %r1, %r9
	setx	0x686ea0c09cf78748, %r1, %r10
	sth	%r10, [%r9]
	setx	0x0000001010100000, %r1, %r9
	setx	0x686ea0c09cf78748, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e46e42ee52, %r1, %r9
	setx	0x4848aa30baf3ba38, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f4539191f2, %r1, %r9
	setx	0x2c3dcc741225f6aa, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800ed3c260, %r1, %r9
	setx	0x2b5e78b99dd18dc9, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f2682a8, %r1, %r9
	setx	0x05df45f70996b49e, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c587853144, %r1, %r9
	setx	0xd3dad0912d40bf90, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d5862d311c, %r1, %r9
	setx	0xd4678e924fc0de2d, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000ecaaab1454, %r1, %r9
	setx	0xc4a8e5d13dbc0766, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f4057cd4dc, %r1, %r9
	setx	0xf9f7d1bb01f46f01, %r1, %r10
	stw	%r10, [%r9]
	setx	0x00000010b0100000, %r1, %r9
	setx	0xf9f7d1bb01f46f01, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800e852e40, %r1, %r9
	setx	0x1e487a08502e13db, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800fb5e5b8, %r1, %r9
	setx	0xb80b899113e75b7b, %r1, %r10
	stx	%r10, [%r9]
	setx	0x00000010b0100000, %r1, %r9
	setx	0xb80b899113e75b7b, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c40c9ca328, %r1, %r9
	setx	0xeff1e6a9b323f90c, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000de60ba7128, %r1, %r9
	setx	0x41782bcd3fad7504, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000001030100000, %r1, %r9
	setx	0x41782bcd3fad7504, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000e5fb8a7998, %r1, %r9
	setx	0x59532b5e63134697, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f6fa4350b8, %r1, %r9
	setx	0x64e6f092a0b1f2f5, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d7b81fb2f6, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000c2aa63553b, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800f9417e9, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800efbb085, %r1, %r12
	ldub	[%r12], %r11
	setx	0x0000008019d26c15, %r1, %r12
	ldub	[%r12], %r11
	setx	0x0000001050100000, %r1, %r9
	setx	0x64e6f092a0b1f2f5, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000fc43f258a5, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000d3977f263c, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e6378d0, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000fd02051448, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000eb3d85b4d8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000d6e3909e30, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000c00bb972b0, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800fb05e4c, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800ede75e4, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800eadce60, %r1, %r12
	ldx	[%r12], %r11
	setx	0x00000080324a00f5, %r1, %r9
	setx	0xb447bd4fa8a1dff2, %r1, %r10
	stb	%r10, [%r9]
	setx	0x00000010a0100000, %r1, %r9
	setx	0xb447bd4fa8a1dff2, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800e0444ab, %r1, %r9
	setx	0xcdfe966035a6916e, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f2a126f, %r1, %r9
	setx	0xe376c515a309d582, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c7dc9b04a2, %r1, %r9
	setx	0xbbba52efef29d7b6, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ddb8ea78f6, %r1, %r9
	setx	0x0d75780d6e9e1a7f, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000eaa18b218b, %r1, %r9
	setx	0x7bb3e7bdbeb785f4, %r1, %r10
	stb	%r10, [%r9]
	setx	0x00000010c0100000, %r1, %r9
	setx	0x7bb3e7bdbeb785f4, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000fcafca4f10, %r1, %r9
	setx	0xc99ddf9625928236, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e79fdf0, %r1, %r9
	setx	0x0ebcebe8eb298716, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f043bb4, %r1, %r9
	setx	0xa3d19f1736a69936, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c1c504bf4a, %r1, %r9
	setx	0xda9c527a1bec453f, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000dd18ed76ba, %r1, %r9
	setx	0xab3c7559862029dd, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e54b691324, %r1, %r9
	setx	0x67e6f47a36342db4, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f918b8353a, %r1, %r9
	setx	0xbc016ae8006162a2, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e9fcdc8, %r1, %r9
	setx	0x76b736b552977798, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f961f50, %r1, %r9
	setx	0xc52f5f5a4bd62c92, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c849d4c0c0, %r1, %r9
	setx	0xed551d895eba2004, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d754ed2b14, %r1, %r9
	setx	0xe3c0b0155f604007, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e263a02ce4, %r1, %r9
	setx	0x9d5d37548eb254bd, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f84b871280, %r1, %r9
	setx	0x69de72289618a03e, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e00c480, %r1, %r9
	setx	0x33c487678ec62d69, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f02fa58, %r1, %r9
	setx	0xa9e51df1074b221b, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000cb9e7c4ec0, %r1, %r9
	setx	0xaabcc15bd817cd58, %r1, %r10
	stx	%r10, [%r9]
	setx	0x00000010d0100000, %r1, %r9
	setx	0xaabcc15bd817cd58, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000d99fe12f98, %r1, %r9
	setx	0x23776bbd7fd93bf6, %r1, %r10
	stx	%r10, [%r9]
	setx	0x00000010e0100000, %r1, %r9
	setx	0x23776bbd7fd93bf6, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000eea4eb3860, %r1, %r9
	setx	0x1e43251414985860, %r1, %r10
	stx	%r10, [%r9]
	setx	0x00000010b0100000, %r1, %r9
	setx	0x1e43251414985860, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000f6fa4350b8, %r1, %r9
	setx	0x4a41ff59e03b850f, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000001050100000, %r1, %r9
	setx	0x4a41ff59e03b850f, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e89e2278a5, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000d7b81fb2f6, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000c2aa63553b, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800f8b9982, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000fda12f5c94, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000e29d774ecc, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000d88ec444c4, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000c7ec1c4d8c, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800f557fa0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000802fd508a5, %r1, %r9
	setx	0x3d59552b2c632e9d, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800ec64bde, %r1, %r9
	setx	0xd1018ecf81fd78cb, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800fcdbf84, %r1, %r9
	setx	0xd3a22e9ea9f29c08, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c065ebfb7e, %r1, %r9
	setx	0x24149afb98cd1879, %r1, %r10
	stb	%r10, [%r9]
	setx	0x0000001070100000, %r1, %r9
	setx	0x24149afb98cd1879, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d5e88a0520, %r1, %r9
	setx	0x1413cdfd3b555dde, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000edf55053bf, %r1, %r9
	setx	0x786f07049d473323, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f722a992b7, %r1, %r9
	setx	0x37598c93e8735e5b, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e97a560, %r1, %r9
	setx	0xe0b9b34977a105f4, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800fd57b28, %r1, %r9
	setx	0xefaf3a8480a03820, %r1, %r10
	sth	%r10, [%r9]
	setx	0x0000001040100000, %r1, %r9
	setx	0xefaf3a8480a03820, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000c5414e06ba, %r1, %r9
	setx	0x4cd5da18bdf6084d, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000df5b74f3e0, %r1, %r9
	setx	0x4921616756b202c2, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000ed4dea35e4, %r1, %r9
	setx	0x9b8dd68b4d7e6085, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f2c8e508d2, %r1, %r9
	setx	0xbec7be8fd825a22e, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800ef18364, %r1, %r9
	setx	0xa2205b9066d854ba, %r1, %r10
	stw	%r10, [%r9]
	setx	0x0000001000100000, %r1, %r9
	setx	0xa2205b9066d854ba, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800fa386a8, %r1, %r9
	setx	0xc36f003d7e3df864, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c549162624, %r1, %r9
	setx	0xe8a6bec6fb755e1d, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000def02ed5e4, %r1, %r9
	setx	0x6eb06e3639a55267, %r1, %r10
	stw	%r10, [%r9]
	setx	0x0000001020100000, %r1, %r9
	setx	0x6eb06e3639a55267, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000eb370371e4, %r1, %r9
	setx	0xd10f809175cad176, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f7dfd44be8, %r1, %r9
	setx	0xe0a460734d5d36cf, %r1, %r10
	stw	%r10, [%r9]
	setx	0x00000010f0100000, %r1, %r9
	setx	0xe0a460734d5d36cf, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800eddc528, %r1, %r9
	setx	0xf53c5c1da1042f1c, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f9a4618, %r1, %r9
	setx	0xeb87eb384dc93898, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000cb66b5f230, %r1, %r9
	setx	0xe3302d77f13b6907, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d442768d50, %r1, %r9
	setx	0x470832c37947fe71, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ec4da9c260, %r1, %r9
	setx	0x99d1cd52d1aaa3a4, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f6fa4350b8, %r1, %r9
	setx	0x7ec45f13494caea9, %r1, %r10
	stx	%r10, [%r9]
	setx	0x00000010d0100000, %r1, %r9
	setx	0x7ec45f13494caea9, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800fe6ecca, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800ef8030e, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000feba14ba48, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000ed802298aa, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d25d33b676, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000cd8c3b75de, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d6e3909e30, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000c00bb972b0, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800fb05e4c, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800ede75e4, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000c6840d4218, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800fcf0280, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800ea2a828, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000f6fa4350b8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000e83458b110, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000d6af529260, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000cbad342658, %r1, %r12
	ldx	[%r12], %r11
	setx	0x0000008073f8cb9b, %r1, %r9
	setx	0xf0332ef30fcf823b, %r1, %r10
	stb	%r10, [%r9]
	setx	0x0000001070100000, %r1, %r9
	setx	0xf0332ef30fcf823b, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800e5335a0, %r1, %r9
	setx	0xb9e52dee5a02501a, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f508a4f, %r1, %r9
	setx	0xe14f6164fa4eecf7, %r1, %r10
	stb	%r10, [%r9]
	setx	0x0000001090100000, %r1, %r9
	setx	0xe14f6164fa4eecf7, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000c39a36f34e, %r1, %r9
	setx	0xfdfb52b63078cb98, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d7bcff3402, %r1, %r9
	setx	0x9515b8d70e2d55bf, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e6c2a65c54, %r1, %r9
	setx	0x2889058dc99e02b1, %r1, %r10
	stb	%r10, [%r9]
	setx	0x00000010b0100000, %r1, %r9
	setx	0x2889058dc99e02b1, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000fc1fe1631f, %r1, %r9
	setx	0x90085e2430f5f038, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800ea12360, %r1, %r9
	setx	0xafb5ed4582eb642c, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f3edeb6, %r1, %r9
	setx	0x11a38928fbc66777, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000ce6eb9f9d6, %r1, %r9
	setx	0x16160b2e60ed1567, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000dbe018b8de, %r1, %r9
	setx	0xe9d906286cad6e4d, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e5f357be70, %r1, %r9
	setx	0x2731c94f38ab091b, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f51d563f3e, %r1, %r9
	setx	0x9205c22e4cf10837, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e63c64c, %r1, %r9
	setx	0x922fffffcff8abeb, %r1, %r10
	stw	%r10, [%r9]
	setx	0x0000001000100000, %r1, %r9
	setx	0x922fffffcff8abeb, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800fa4e9b4, %r1, %r9
	setx	0xb35770a2727e602c, %r1, %r10
	stw	%r10, [%r9]
	setx	0x0000001010100000, %r1, %r9
	setx	0xb35770a2727e602c, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000c7091db5f8, %r1, %r9
	setx	0x1a8ab8fee4679184, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d795cb5310, %r1, %r9
	setx	0x9f5a74e7501b1e5b, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e87ca01e90, %r1, %r9
	setx	0xe0beb90798812a3c, %r1, %r10
	stw	%r10, [%r9]
	setx	0x0000001090100000, %r1, %r9
	setx	0xe0beb90798812a3c, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000f729f113e8, %r1, %r9
	setx	0xd6e607848b5e6538, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e6dd100, %r1, %r9
	setx	0x749e25e0abfb5f50, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000001070100000, %r1, %r9
	setx	0x749e25e0abfb5f50, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f8093f0, %r1, %r9
	setx	0xfcf3e2f6ad1a4f5a, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c76a636400, %r1, %r9
	setx	0xd57a68062779d687, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000001030100000, %r1, %r9
	setx	0xd57a68062779d687, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d9c50846a8, %r1, %r9
	setx	0x55bbeb6785b725cb, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e0745cc980, %r1, %r9
	setx	0xea2d5eacd49068a4, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f6fa4350b8, %r1, %r9
	setx	0x6f5d1f24ff84d972, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000cf5fc358e7, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800fcd1e15, %r1, %r12
	ldub	[%r12], %r11
	setx	0x0000001080100000, %r1, %r9
	setx	0x6f5d1f24ff84d972, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800e284b84, %r1, %r12
	ldub	[%r12], %r11
	setx	0x0000008013576371, %r1, %r12
	ldub	[%r12], %r11
	setx	0x0000001020100000, %r1, %r9
	setx	0x6f5d1f24ff84d972, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f80316334a, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000e26611feb6, %r1, %r12
	ldub	[%r12], %r11
	setx	0x0000001030100000, %r1, %r9
	setx	0x6f5d1f24ff84d972, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000dd47240be0, %r1, %r12
	ldub	[%r12], %r11
	setx	0x0000001040100000, %r1, %r9
	setx	0x6f5d1f24ff84d972, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000db8fd397ae, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000c74bdd0ae4, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800f0404ee, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800ef24ed0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800f565ba0, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800e74255c, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000fcf82a26d8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000e8a52f2750, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000da5fac2570, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000c743a2e7f4, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800f090324, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000c8f3197508, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800f4033e8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e820b78, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000f6fa4350b8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x00000080d2b5f554, %r1, %r9
	setx	0x386f78c820cdbb33, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800ecd8a7a, %r1, %r9
	setx	0x1886cc53f2bb71f0, %r1, %r10
	stb	%r10, [%r9]
	setx	0x00000010a0100000, %r1, %r9
	setx	0x1886cc53f2bb71f0, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800f1953b2, %r1, %r9
	setx	0x4baa2ed71e79cd63, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000cfd8476a71, %r1, %r9
	setx	0x98efedf0e13c978c, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d9d6f87f87, %r1, %r9
	setx	0x298257f5fe0b1754, %r1, %r10
	stb	%r10, [%r9]
	setx	0x0000001070100000, %r1, %r9
	setx	0x298257f5fe0b1754, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e8d28c4872, %r1, %r9
	setx	0x70babd3880057edf, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f8ed660b98, %r1, %r9
	setx	0x12faaed7e26b0daf, %r1, %r10
	stb	%r10, [%r9]
	setx	0x0000001070100000, %r1, %r9
	setx	0x12faaed7e26b0daf, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800e47109e, %r1, %r9
	setx	0xf1dd5f61b9f21a6c, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800fe7d432, %r1, %r9
	setx	0xabdf0d11cc395041, %r1, %r10
	sth	%r10, [%r9]
	setx	0x0000001070100000, %r1, %r9
	setx	0xabdf0d11cc395041, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000cc7aef33ca, %r1, %r9
	setx	0xbaa776e6ab3b9ae5, %r1, %r10
	sth	%r10, [%r9]
	setx	0x0000001040100000, %r1, %r9
	setx	0xbaa776e6ab3b9ae5, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d1b13fe16c, %r1, %r9
	setx	0x1accd00ebd1c66b5, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e9b39b94f8, %r1, %r9
	setx	0xdbbad1f91f8e11e1, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f50ee95474, %r1, %r9
	setx	0xde4b47e287188714, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e151bf4, %r1, %r9
	setx	0xff02a5e835e8e59d, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f4e79d8, %r1, %r9
	setx	0x8623087c1196199d, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c966144348, %r1, %r9
	setx	0x21f9460012f08f6a, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d15c915380, %r1, %r9
	setx	0x977dbd722bce229a, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000eb8d515870, %r1, %r9
	setx	0x24fb863420771a2d, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f6f0025f10, %r1, %r9
	setx	0x40fa7d67a19690e9, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e843158, %r1, %r9
	setx	0x37612ce1b42f7a25, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f8d1f90, %r1, %r9
	setx	0x1379c66d07edf91d, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000cb80e02d38, %r1, %r9
	setx	0xe7768ffeee258c3c, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d3c0105e20, %r1, %r9
	setx	0x36ea7720b7520a46, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000eeba429160, %r1, %r9
	setx	0xfcca558ee42bea96, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f6fa4350b8, %r1, %r9
	setx	0xc190f97386e837e7, %r1, %r10
	stx	%r10, [%r9]
	setx	0x00000080f6dbfed6, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000f12f2f4177, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000e8a5c34450, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000de5c6fff62, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000f4af11aafc, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000eb4da663ca, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d795cb5310, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000c7091db5f8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800fa4e9b4, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800e63c64c, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000f7dfd44be8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800fdbd050, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800ec9ec48, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000803a92b161, %r1, %r9
	setx	0xfb1482b8c0077e15, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800ede30d4, %r1, %r9
	setx	0x3b292fdb01605075, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800fe03661, %r1, %r9
	setx	0xc473abb91a75d128, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ccd50b151d, %r1, %r9
	setx	0xc03e9269fc4c670a, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d5dc920efe, %r1, %r9
	setx	0xc3889905a9957da3, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000eb3a1e4f6b, %r1, %r9
	setx	0xec288b86510d2bba, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f5e6ad591c, %r1, %r9
	setx	0x73e3073fa6cb5041, %r1, %r10
	stb	%r10, [%r9]
	setx	0x0000001070100000, %r1, %r9
	setx	0x73e3073fa6cb5041, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800e4c70aa, %r1, %r9
	setx	0x7f60f43d38d6b9d4, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f0daa2a, %r1, %r9
	setx	0x1fec6340d0f215f5, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c19294b12e, %r1, %r9
	setx	0x45a62db6879fe65d, %r1, %r10
	sth	%r10, [%r9]
	setx	0x00000010c0100000, %r1, %r9
	setx	0x45a62db6879fe65d, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000d372a1b41e, %r1, %r9
	setx	0xafcd1abb82e11895, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000eea41b0102, %r1, %r9
	setx	0x78ef0242d0ae8545, %r1, %r10
	sth	%r10, [%r9]
	setx	0x00000010f0100000, %r1, %r9
	setx	0x78ef0242d0ae8545, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f524103036, %r1, %r9
	setx	0xd06599775f283df4, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e822328, %r1, %r9
	setx	0x14593dd1e1cd43a6, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800fce96c4, %r1, %r9
	setx	0x9216078a3a2b4110, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000cfc4d13f30, %r1, %r9
	setx	0x621e58a6b2e8d5e8, %r1, %r10
	stw	%r10, [%r9]
	setx	0x00000010b0100000, %r1, %r9
	setx	0x621e58a6b2e8d5e8, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000d9d0801f84, %r1, %r9
	setx	0xd0d9c258170e1ea6, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e1b9815bc4, %r1, %r9
	setx	0xbd49375ce3e37bd8, %r1, %r10
	stw	%r10, [%r9]
	setx	0x00000010d0100000, %r1, %r9
	setx	0xbd49375ce3e37bd8, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f2facedb54, %r1, %r9
	setx	0xb5546a5e5f36c3a9, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800eb40a18, %r1, %r9
	setx	0x52a8b14a357e7594, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800fd48488, %r1, %r9
	setx	0xbc16cf6757726738, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c9dd875ce8, %r1, %r9
	setx	0x92ba213cb1feec41, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000da27581820, %r1, %r9
	setx	0x3da0e18210623e1b, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000eb17c3ceb8, %r1, %r9
	setx	0x1f7e022eaa7a006c, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f6fa4350b8, %r1, %r9
	setx	0x63de6967a600c4ea, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c1acba1f0f, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800f404e06, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800e412725, %r1, %r12
	ldub	[%r12], %r11
	setx	0x00000080607a0c92, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000f0b088e50e, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000eeedc28273, %r1, %r12
	ldub	[%r12], %r11
	setx	0x00000010c0100000, %r1, %r9
	setx	0x63de6967a600c4ea, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000d43d606cb9, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000f814762c06, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000ed9163e386, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000e5f68633e0, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800fcf0280, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800ea2a828, %r1, %r12
	ldx	[%r12], %r11
	setx	0x0000008010647fe0, %r1, %r9
	setx	0x21cbd94819507234, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e3cde13, %r1, %r9
	setx	0x14b846e7dffe58c3, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f35d09f, %r1, %r9
	setx	0xfea5a4479bb68694, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c806b07e38, %r1, %r9
	setx	0xee3bae12b1ced5fa, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d233b4d230, %r1, %r9
	setx	0x090a20d843d78f9f, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ee51110b2c, %r1, %r9
	setx	0x26245694bc2c4bbd, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f32a7bce89, %r1, %r9
	setx	0x4520d9c720e334d5, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e539ed6, %r1, %r9
	setx	0xd862c522a97e8f7d, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f8123b0, %r1, %r9
	setx	0x99ea054a744c4d52, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000ca200ff8ba, %r1, %r9
	setx	0x41f9e73528b438da, %r1, %r10
	sth	%r10, [%r9]
	setx	0x0000001070100000, %r1, %r9
	setx	0x41f9e73528b438da, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000daf40627a4, %r1, %r9
	setx	0xb8b69623e68c8928, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e46f22ca1a, %r1, %r9
	setx	0x5ff6f248391351fa, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f8b66b830a, %r1, %r9
	setx	0x42a6d8568ec0d864, %r1, %r10
	sth	%r10, [%r9]
	setx	0x0000001020100000, %r1, %r9
	setx	0x42a6d8568ec0d864, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800e2beef4, %r1, %r9
	setx	0xbbeb5a421549f1b3, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800ffb5f84, %r1, %r9
	setx	0x42ceb20b42f8c5ce, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000cad32375d4, %r1, %r9
	setx	0xc86f4c086cbe125d, %r1, %r10
	stw	%r10, [%r9]
	setx	0x0000001090100000, %r1, %r9
	setx	0xc86f4c086cbe125d, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000d4896ebd8c, %r1, %r9
	setx	0x6915481912db25ec, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e1f4157cb0, %r1, %r9
	setx	0xb7c072787e5bbec9, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000fb8ae37800, %r1, %r9
	setx	0xcc385849ac30b3a2, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e579440, %r1, %r9
	setx	0xf37654752a6333c4, %r1, %r10
	stx	%r10, [%r9]
	setx	0x00000010d0100000, %r1, %r9
	setx	0xf37654752a6333c4, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f7747e8, %r1, %r9
	setx	0x19b959550c57e27b, %r1, %r10
	stx	%r10, [%r9]
	setx	0x00000010f0100000, %r1, %r9
	setx	0x19b959550c57e27b, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000cdd4082ae8, %r1, %r9
	setx	0xe5de5b25cbc06b84, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000001020100000, %r1, %r9
	setx	0xe5de5b25cbc06b84, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d691acd5d0, %r1, %r9
	setx	0xcc57bc8c4aba3a37, %r1, %r10
	stx	%r10, [%r9]
	setx	0x00000010c0100000, %r1, %r9
	setx	0xcc57bc8c4aba3a37, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e128ce9c88, %r1, %r9
	setx	0x1bacb3042f87aa35, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f6fa4350b8, %r1, %r9
	setx	0xc807ef539db07844, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d7e4a0c960, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000ccecc6b1b8, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000e5cf4139e8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000dd7deaa096, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000c33a64992c, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800f68f9f0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800ec0fe12, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800f944024, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800eeb1248, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800e655038, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000f6fa4350b8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000ed03d6b8e0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000dc8a3ce6f0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000c98e60e808, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800f49a370, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000809c2570db, %r1, %r9
	setx	0x9ee3429b5c639fba, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e1eebaa, %r1, %r9
	setx	0x80280a3ab64fb6df, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f979aa6, %r1, %r9
	setx	0xdbc4ed8180838102, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ccbe8e2a3e, %r1, %r9
	setx	0xa10940332c0b899b, %r1, %r10
	stb	%r10, [%r9]
	setx	0x0000001030100000, %r1, %r9
	setx	0xa10940332c0b899b, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d67af0f48e, %r1, %r9
	setx	0x1210ea02141f7f5d, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e7cc76d001, %r1, %r9
	setx	0xaeb90604a79be157, %r1, %r10
	stb	%r10, [%r9]
	setx	0x0000001020100000, %r1, %r9
	setx	0xaeb90604a79be157, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000f99e17f382, %r1, %r9
	setx	0x6f9ae2c05a24cdcc, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e4071fa, %r1, %r9
	setx	0x5b15f3158b9d7ae8, %r1, %r10
	sth	%r10, [%r9]
	setx	0x0000001000100000, %r1, %r9
	setx	0x5b15f3158b9d7ae8, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800f23700e, %r1, %r9
	setx	0xd76243ed9160c567, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c0d7189094, %r1, %r9
	setx	0x341f40dad95dc036, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000dbc6a020f6, %r1, %r9
	setx	0x9fee56c39292ed14, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e548f0a236, %r1, %r9
	setx	0x97582efcc0f741f2, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000fa8b87130a, %r1, %r9
	setx	0x1e2e1397bbc62da6, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800ebf0254, %r1, %r9
	setx	0x21ecf2e290189ab6, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800fabba88, %r1, %r9
	setx	0xc6e8bc4456a07095, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c21156b5c4, %r1, %r9
	setx	0x0036d986914b7edd, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d77f724c94, %r1, %r9
	setx	0x3d48be196f4605f1, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e90b72e408, %r1, %r9
	setx	0x787976e64365f3ba, %r1, %r10
	stw	%r10, [%r9]
	setx	0x00000010c0100000, %r1, %r9
	setx	0x787976e64365f3ba, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000f5d3ad62a8, %r1, %r9
	setx	0xd67631d470be661e, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e007c68, %r1, %r9
	setx	0xf7712eb3d109bd0b, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000001070100000, %r1, %r9
	setx	0xf7712eb3d109bd0b, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f7132e8, %r1, %r9
	setx	0x269902d1ecf7a851, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c94f28a1f8, %r1, %r9
	setx	0xfcb87fb5202b21ef, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000df2b9d86e0, %r1, %r9
	setx	0xa2c3597db78ecced, %r1, %r10
	stx	%r10, [%r9]
	setx	0x00000010d0100000, %r1, %r9
	setx	0xa2c3597db78ecced, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000e24b3b6a48, %r1, %r9
	setx	0x899da53f0d6d8147, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000001040100000, %r1, %r9
	setx	0x899da53f0d6d8147, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f6fa4350b8, %r1, %r9
	setx	0x2eb004673565b005, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d2f8b440e0, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000cc4cd53503, %r1, %r12
	ldub	[%r12], %r11
	setx	0x0000001070100000, %r1, %r9
	setx	0x2eb004673565b005, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800fea039a, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800e486584, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000801c1c5551, %r1, %r12
	ldub	[%r12], %r11
	setx	0x0000001030100000, %r1, %r9
	setx	0x2eb004673565b005, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000f4bca5840e, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000ec15a4d218, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000dd28efb178, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000cd6b151ad4, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800f110882, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800ec46958, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000fe17591f56, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000c8f3197508, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800f4033e8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e820b78, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000f6fa4350b8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000e988f223b8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000da2c6de520, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000c9a5ba6c78, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000808bf89880, %r1, %r9
	setx	0x4adb17002571cb09, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e24835c, %r1, %r9
	setx	0x0b56eeb8d2bc595e, %r1, %r10
	stb	%r10, [%r9]
	setx	0x0000001030100000, %r1, %r9
	setx	0x0b56eeb8d2bc595e, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800fb13c60, %r1, %r9
	setx	0x4e5b726a07e29e00, %r1, %r10
	stb	%r10, [%r9]
	setx	0x0000001090100000, %r1, %r9
	setx	0x4e5b726a07e29e00, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000c075cd7305, %r1, %r9
	setx	0xecc4b1a636e4c9eb, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000dd84ec9250, %r1, %r9
	setx	0xa4fce9e019da261f, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e18f3de162, %r1, %r9
	setx	0xd4b556f71e4d2317, %r1, %r10
	stb	%r10, [%r9]
	setx	0x0000001040100000, %r1, %r9
	setx	0xd4b556f71e4d2317, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f49c4bde8f, %r1, %r9
	setx	0x8fadd93ee5cea8b7, %r1, %r10
	stb	%r10, [%r9]
	setx	0x0000001090100000, %r1, %r9
	setx	0x8fadd93ee5cea8b7, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800ef1715a, %r1, %r9
	setx	0x5586aae79113e384, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f538f5a, %r1, %r9
	setx	0xe0da5e96c3c04b7f, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000cd613ce2ca, %r1, %r9
	setx	0x030d413d53b0ba82, %r1, %r10
	sth	%r10, [%r9]
	setx	0x0000001080100000, %r1, %r9
	setx	0x030d413d53b0ba82, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000df99217da2, %r1, %r9
	setx	0xd0dcb051b66f0042, %r1, %r10
	sth	%r10, [%r9]
	setx	0x0000001050100000, %r1, %r9
	setx	0xd0dcb051b66f0042, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000e508a2c3da, %r1, %r9
	setx	0x5bc8712c136deefe, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f5a1b502a6, %r1, %r9
	setx	0xf371929d01e9a8d9, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e9d3600, %r1, %r9
	setx	0x230bb9b5514058a4, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800fd769b4, %r1, %r9
	setx	0xc03210a9e3bb3d1c, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c5bfc0f794, %r1, %r9
	setx	0x77a7c5f20e512b6f, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d0f288f56c, %r1, %r9
	setx	0x9a394ecda18d8d45, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e92932d000, %r1, %r9
	setx	0x970b67baf7c3707b, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f350e1cc64, %r1, %r9
	setx	0xc1dd201286ff1ed1, %r1, %r10
	stw	%r10, [%r9]
	setx	0x0000001050100000, %r1, %r9
	setx	0xc1dd201286ff1ed1, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800e634708, %r1, %r9
	setx	0x835b40da830fb391, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f1bb2e0, %r1, %r9
	setx	0x625d367780bc167b, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000cb9169d488, %r1, %r9
	setx	0x342174b78c6136b4, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ded9d93d50, %r1, %r9
	setx	0x9ba9b95b413029df, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e9733f62c8, %r1, %r9
	setx	0xf4dab83ec13e5822, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000001080100000, %r1, %r9
	setx	0xf4dab83ec13e5822, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f6fa4350b8, %r1, %r9
	setx	0x4eef94f3e68fe06c, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800fe167c0, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800eb672dd, %r1, %r12
	ldub	[%r12], %r11
	setx	0x00000080afe2a339, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000fc9a4ca521, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000e0385d0b8e, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000d9d55f3426, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000c34b671e6e, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800fff58cc, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800ef1f39a, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000fb4a3af1c8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000c44de100f8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x0000008067dbe0db, %r1, %r9
	setx	0xa1ba64189a0a9240, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e93b4e7, %r1, %r9
	setx	0x017360da0639ebef, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800fef0535, %r1, %r9
	setx	0x9dbf389e9ea06b36, %r1, %r10
	stb	%r10, [%r9]
	setx	0x00000010d0100000, %r1, %r9
	setx	0x9dbf389e9ea06b36, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000cce9028c8c, %r1, %r9
	setx	0xb1f3fd8755598948, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d96bce3ba5, %r1, %r9
	setx	0xc24b5617fb67c85e, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e0115e9518, %r1, %r9
	setx	0x3c2e030264be23ba, %r1, %r10
	stb	%r10, [%r9]
	setx	0x0000001080100000, %r1, %r9
	setx	0x3c2e030264be23ba, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000fb91846987, %r1, %r9
	setx	0xf4bdf21b9a5dda99, %r1, %r10
	stb	%r10, [%r9]
	setx	0x00000010e0100000, %r1, %r9
	setx	0xf4bdf21b9a5dda99, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800e0b1854, %r1, %r9
	setx	0x2256eb78df000480, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800ff19c90, %r1, %r9
	setx	0xd62d2f4f58e554ef, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000cee10a8664, %r1, %r9
	setx	0x139315851adc0708, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d6fc1fd01e, %r1, %r9
	setx	0x9fc1723d4ff654c8, %r1, %r10
	sth	%r10, [%r9]
	setx	0x0000001080100000, %r1, %r9
	setx	0x9fc1723d4ff654c8, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ed9c9c972c, %r1, %r9
	setx	0x75fd29f37d5bacaa, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f14a95459a, %r1, %r9
	setx	0x2f2d059873f431a3, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800ebb7ab4, %r1, %r9
	setx	0x36457afd9ffc18e3, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f034bac, %r1, %r9
	setx	0x08db3a78814c9473, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c3d679f1d0, %r1, %r9
	setx	0xb354a15ab82a3e49, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d9237db374, %r1, %r9
	setx	0x4da79518b0353ea5, %r1, %r10
	stw	%r10, [%r9]
	setx	0x0000001060100000, %r1, %r9
	setx	0x4da79518b0353ea5, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e39440cef0, %r1, %r9
	setx	0x62be31b4d1df61a3, %r1, %r10
	stw	%r10, [%r9]
	setx	0x00000010a0100000, %r1, %r9
	setx	0x62be31b4d1df61a3, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000fdde9348f0, %r1, %r9
	setx	0x4bd4830bd1ec75ce, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800edfea18, %r1, %r9
	setx	0x8e1c39b535e26c46, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000001090100000, %r1, %r9
	setx	0x8e1c39b535e26c46, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800f3cf6c8, %r1, %r9
	setx	0x6575f8304650f10d, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000cf8d0d6c78, %r1, %r9
	setx	0xd7e20886bf993e2e, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d3f1f4c028, %r1, %r9
	setx	0x5ec8f3f4b324b1d4, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000001050100000, %r1, %r9
	setx	0x5ec8f3f4b324b1d4, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000e4028edbb8, %r1, %r9
	setx	0x181ea9877584aa5b, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f6fa4350b8, %r1, %r9
	setx	0x0cc8fcb01064c384, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000001060100000, %r1, %r9
	setx	0x0cc8fcb01064c384, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000e384ff7224, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000d501531d53, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000c933e93c50, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800f7f635a, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e4502de, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000f39e761470, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000eeee9f70dc, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000dee88fc98c, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000c26397b394, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800f4a73ec, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800e1053a4, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000f41e234888, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000cde32bd430, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800fd15f50, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e00caa0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000f6fa4350b8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000e4dbf597d0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000d6a16c5cf8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000c6b1ff3588, %r1, %r12
	ldx	[%r12], %r11
	setx	0x0000008034fa6e03, %r1, %r9
	setx	0x8a2980c38fb5268b, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e5246c9, %r1, %r9
	setx	0x0fb88c6e0f525d17, %r1, %r10
	stb	%r10, [%r9]
	setx	0x00000010d0100000, %r1, %r9
	setx	0x0fb88c6e0f525d17, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800ffecfc6, %r1, %r9
	setx	0x60851851bb531cac, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000cc1b1b238e, %r1, %r9
	setx	0xc300f075cf15a26d, %r1, %r10
	stb	%r10, [%r9]
	setx	0x0000001090100000, %r1, %r9
	setx	0xc300f075cf15a26d, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d87e1851dc, %r1, %r9
	setx	0x3cf6d0f4b68137bf, %r1, %r10
	stb	%r10, [%r9]
	setx	0x00000010a0100000, %r1, %r9
	setx	0x3cf6d0f4b68137bf, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000ef7bc944b2, %r1, %r9
	setx	0x0e697d9ed6f0b0ae, %r1, %r10
	stb	%r10, [%r9]
	setx	0x0000001030100000, %r1, %r9
	setx	0x0e697d9ed6f0b0ae, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000faa8ba0472, %r1, %r9
	setx	0xb053fde65bb9e041, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e5e89b8, %r1, %r9
	setx	0x236189893b370a98, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f8e5d6c, %r1, %r9
	setx	0x73948477093055f9, %r1, %r10
	sth	%r10, [%r9]
	setx	0x0000001020100000, %r1, %r9
	setx	0x73948477093055f9, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c770e51f02, %r1, %r9
	setx	0x18088d74b446df3f, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d0fcfa37b6, %r1, %r9
	setx	0x7edb1b43cff3eb4c, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000ee8ea5f9a2, %r1, %r9
	setx	0x1a472d9c744eadbf, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f67c7a2fb6, %r1, %r9
	setx	0xb22320f3289b89bd, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e8c4b40, %r1, %r9
	setx	0xce78cb2b122184fa, %r1, %r10
	stw	%r10, [%r9]
	setx	0x00000010e0100000, %r1, %r9
	setx	0xce78cb2b122184fa, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800f05dc68, %r1, %r9
	setx	0xbaa9d2535e35d825, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c617558240, %r1, %r9
	setx	0x7db8de7782fce236, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d274aabb08, %r1, %r9
	setx	0x8b89b5054ab972e7, %r1, %r10
	stw	%r10, [%r9]
	setx	0x00000010e0100000, %r1, %r9
	setx	0x8b89b5054ab972e7, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ecadb0c390, %r1, %r9
	setx	0x5f8ef47e0b2e510d, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000fa861392f4, %r1, %r9
	setx	0xbc9fb5020c9824f8, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e8b5bb0, %r1, %r9
	setx	0xd63f5474ccd61087, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000001070100000, %r1, %r9
	setx	0xd63f5474ccd61087, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f513688, %r1, %r9
	setx	0xd7a0b68981d46a00, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c5e3aa5df0, %r1, %r9
	setx	0xc37496f71393e91b, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000dca6f62518, %r1, %r9
	setx	0x263755f1550fa774, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ed144f63a0, %r1, %r9
	setx	0x05c40f3fae43c57b, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f6fa4350b8, %r1, %r9
	setx	0x9f71a68364561ea4, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800efbb085, %r1, %r12
	ldub	[%r12], %r11
	setx	0x0000008019d26c15, %r1, %r12
	ldub	[%r12], %r11
	setx	0x00000010e0100000, %r1, %r9
	setx	0x9f71a68364561ea4, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000fc43f258a5, %r1, %r12
	ldub	[%r12], %r11
	setx	0x0000001030100000, %r1, %r9
	setx	0x9f71a68364561ea4, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e165a701ef, %r1, %r12
	ldub	[%r12], %r11
	setx	0x0000001030100000, %r1, %r9
	setx	0x9f71a68364561ea4, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000d1561844f0, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800e4502de, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000f39e761470, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000eeee9f70dc, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000dcfe7191dc, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000e6691e1f38, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000d0fd983dd0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000c04ba20ac0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800fac58b8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e2e0420, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000f6fa4350b8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000ebad2c6b10, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000804e172440, %r1, %r9
	setx	0xa780874d31109a41, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e09e60e, %r1, %r9
	setx	0x3bf9cbfd6fec7882, %r1, %r10
	stb	%r10, [%r9]
	setx	0x00000010b0100000, %r1, %r9
	setx	0x3bf9cbfd6fec7882, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800f751d01, %r1, %r9
	setx	0xd9b68f03edc5f62e, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c75e0fe610, %r1, %r9
	setx	0xdb82af01d0e755d5, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d69dd96c09, %r1, %r9
	setx	0x6c040a74dd3cb422, %r1, %r10
	stb	%r10, [%r9]
	setx	0x0000001060100000, %r1, %r9
	setx	0x6c040a74dd3cb422, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e6b3a65899, %r1, %r9
	setx	0xf2db3cd4e0dc4c91, %r1, %r10
	stb	%r10, [%r9]
	setx	0x0000001040100000, %r1, %r9
	setx	0xf2db3cd4e0dc4c91, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000fd5992b829, %r1, %r9
	setx	0x8b295091aa4430f0, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e4dc928, %r1, %r9
	setx	0x65f8b3824099bb9a, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800fc36e56, %r1, %r9
	setx	0x53a3931faf168c8f, %r1, %r10
	sth	%r10, [%r9]
	setx	0x00000010c0100000, %r1, %r9
	setx	0x53a3931faf168c8f, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000ca0df35306, %r1, %r9
	setx	0x940b80f7c71c5c19, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d3018a35d6, %r1, %r9
	setx	0x51e532b8eb883321, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000ebba4db9a2, %r1, %r9
	setx	0x9f403323cdf072a3, %r1, %r10
	sth	%r10, [%r9]
	setx	0x00000010c0100000, %r1, %r9
	setx	0x9f403323cdf072a3, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000fe154724d2, %r1, %r9
	setx	0xf384bb14fe2204e1, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e8007a4, %r1, %r9
	setx	0xbc7bfe55c55de60c, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f808980, %r1, %r9
	setx	0x92ff22f3509a28fe, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c30ec516e0, %r1, %r9
	setx	0xff1dfa28a43fd2b5, %r1, %r10
	stw	%r10, [%r9]
	setx	0x0000001060100000, %r1, %r9
	setx	0xff1dfa28a43fd2b5, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000db632e4fa8, %r1, %r9
	setx	0xa96c9c3ce76c0375, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000ea54e3e0a4, %r1, %r9
	setx	0xb600ddf83d8da079, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f3e539151c, %r1, %r9
	setx	0x753acfc404fa6d78, %r1, %r10
	stw	%r10, [%r9]
	setx	0x0000001080100000, %r1, %r9
	setx	0x753acfc404fa6d78, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800ee25278, %r1, %r9
	setx	0xbd582fed951632fe, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f0f8170, %r1, %r9
	setx	0xcccff2743a908e64, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c6681e9c20, %r1, %r9
	setx	0x6028a1fd286627dd, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d046591fe0, %r1, %r9
	setx	0x56ac42bc9fd77db0, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e27cc1bf98, %r1, %r9
	setx	0x6ab61afea2fef126, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f6fa4350b8, %r1, %r9
	setx	0xc1d944dda4e705ee, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000dda7484f08, %r1, %r12
	ldub	[%r12], %r11
	setx	0x0000001030100000, %r1, %r9
	setx	0xc1d944dda4e705ee, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ce8946f2c7, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800f49265d, %r1, %r12
	ldub	[%r12], %r11
	setx	0x00000010d0100000, %r1, %r9
	setx	0xc1d944dda4e705ee, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000c5e72fc85a, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800fb058a0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800eb131cc, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e00caa0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000f6fa4350b8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000e4dbf597d0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000d6a16c5cf8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000c6b1ff3588, %r1, %r12
	ldx	[%r12], %r11
	setx	0x00000080c3e32390, %r1, %r9
	setx	0x839bd1ba6622d8ae, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e9e3739, %r1, %r9
	setx	0xdc90c94893c95135, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800fd41965, %r1, %r9
	setx	0x0a2d117776899d6b, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c50c70befb, %r1, %r9
	setx	0x8d88062bfb620b72, %r1, %r10
	stb	%r10, [%r9]
	setx	0x00000010c0100000, %r1, %r9
	setx	0x8d88062bfb620b72, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d465331ede, %r1, %r9
	setx	0x444a6fad2b28787c, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e8462074ba, %r1, %r9
	setx	0xfaa8b92af59527d2, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f09e87b8d1, %r1, %r9
	setx	0x2d945c3de2281725, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e0a4edc, %r1, %r9
	setx	0xe5e6df179245937d, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800fa03180, %r1, %r9
	setx	0xe33ffaee310cf59c, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000cf58ed425e, %r1, %r9
	setx	0xf7ddd2d4fcf46c64, %r1, %r10
	sth	%r10, [%r9]
	setx	0x00000010d0100000, %r1, %r9
	setx	0xf7ddd2d4fcf46c64, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d803a5e882, %r1, %r9
	setx	0xbc515f121ad4af3e, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000ea2804d092, %r1, %r9
	setx	0xdb8716f13c2b9fe9, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f1b9e4b2ac, %r1, %r9
	setx	0x8a6128f723ed5ba2, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e4fb0a4, %r1, %r9
	setx	0x56c90c6710455f84, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f0a8548, %r1, %r9
	setx	0x5773039ceb5eb05e, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c23a2122f8, %r1, %r9
	setx	0x2302c24351e4b63c, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d649de2dc0, %r1, %r9
	setx	0xd6c232a480ad373c, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000ea0186eef0, %r1, %r9
	setx	0xdbda4eba9f20df79, %r1, %r10
	stw	%r10, [%r9]
	setx	0x0000001040100000, %r1, %r9
	setx	0xdbda4eba9f20df79, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000fbc1dc52b0, %r1, %r9
	setx	0x585476236202bbb8, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800eb927a0, %r1, %r9
	setx	0x0748858796315ab4, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000001060100000, %r1, %r9
	setx	0x0748858796315ab4, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800f3b44c8, %r1, %r9
	setx	0x5b883b1b5b529287, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c16571ca00, %r1, %r9
	setx	0xa14ef43e56fd3995, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d5981f5438, %r1, %r9
	setx	0x9619de88a18bb3bd, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e29eba4fb0, %r1, %r9
	setx	0xa078dc22f83903c6, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f6fa4350b8, %r1, %r9
	setx	0xb5602af0449ebd08, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f110882, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800ec46958, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000fe17591f56, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000e19dc4c97c, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d6b7db1ff8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000c933e93c50, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800f7f635a, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800ebf0254, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000f6fa4350b8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000eeba429160, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000d3c0105e20, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000cb80e02d38, %r1, %r12
	ldx	[%r12], %r11
	setx	0x0000008061824098, %r1, %r9
	setx	0xcf29a6089a8ffc9b, %r1, %r10
	stb	%r10, [%r9]
	setx	0x0000001050100000, %r1, %r9
	setx	0xcf29a6089a8ffc9b, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800ef94fb9, %r1, %r9
	setx	0x150b340355511e06, %r1, %r10
	stb	%r10, [%r9]
	setx	0x00000010a0100000, %r1, %r9
	setx	0x150b340355511e06, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800fdabe70, %r1, %r9
	setx	0xe0fe8db877d9b31e, %r1, %r10
	stb	%r10, [%r9]
	setx	0x0000001050100000, %r1, %r9
	setx	0xe0fe8db877d9b31e, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000c4d99529e1, %r1, %r9
	setx	0x4da76ef5d83f9ed6, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000dca404a386, %r1, %r9
	setx	0x6bbd81d8660e17a0, %r1, %r10
	stb	%r10, [%r9]
	setx	0x00000010f0100000, %r1, %r9
	setx	0x6bbd81d8660e17a0, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000e39e535791, %r1, %r9
	setx	0xf9dab3f541086945, %r1, %r10
	stb	%r10, [%r9]
	setx	0x00000010a0100000, %r1, %r9
	setx	0xf9dab3f541086945, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000fc6fb5359f, %r1, %r9
	setx	0x2ed014dfaac00cd1, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800ed25f62, %r1, %r9
	setx	0x2385390b15d075ff, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f068206, %r1, %r9
	setx	0xa3315fb842d158e0, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c5346bfdf6, %r1, %r9
	setx	0x545bee9b891aecef, %r1, %r10
	sth	%r10, [%r9]
	setx	0x0000001070100000, %r1, %r9
	setx	0x545bee9b891aecef, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000d92d41001a, %r1, %r9
	setx	0x8273d14251c83bc5, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e3ab31496a, %r1, %r9
	setx	0xcb5de8622f77d07b, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f4236df7c8, %r1, %r9
	setx	0xefc66033258e98f0, %r1, %r10
	sth	%r10, [%r9]
	setx	0x00000010a0100000, %r1, %r9
	setx	0xefc66033258e98f0, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800edccbcc, %r1, %r9
	setx	0x1218aecbbea55fab, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800fe968fc, %r1, %r9
	setx	0xdfcc4c94bfea94e8, %r1, %r10
	stw	%r10, [%r9]
	setx	0x00000010f0100000, %r1, %r9
	setx	0xdfcc4c94bfea94e8, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000c1feec9ea0, %r1, %r9
	setx	0x2c6018a726aa456b, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d47aa32a98, %r1, %r9
	setx	0xeb1daf4ccb7f01a1, %r1, %r10
	stw	%r10, [%r9]
	setx	0x0000001030100000, %r1, %r9
	setx	0xeb1daf4ccb7f01a1, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e79efb72a4, %r1, %r9
	setx	0xda42cd101b412a2b, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f28beeab10, %r1, %r9
	setx	0x3cd3f6f74eed8823, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800ec1f288, %r1, %r9
	setx	0x43871d407aa312a7, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000001050100000, %r1, %r9
	setx	0x43871d407aa312a7, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f455b90, %r1, %r9
	setx	0xa70f3ef82a71fd2a, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c3ea973cd0, %r1, %r9
	setx	0x8b673708755b6808, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000001030100000, %r1, %r9
	setx	0x8b673708755b6808, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d4e2d4f998, %r1, %r9
	setx	0x7ba22bb38ffa0011, %r1, %r10
	stx	%r10, [%r9]
	setx	0x00000010b0100000, %r1, %r9
	setx	0x7ba22bb38ffa0011, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000e38e140930, %r1, %r9
	setx	0x1c7ba7b6311c70da, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f6fa4350b8, %r1, %r9
	setx	0x9d6ab8f63fc4eee7, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000001010100000, %r1, %r9
	setx	0x9d6ab8f63fc4eee7, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000008076297fea, %r1, %r12
	ldub	[%r12], %r11
	setx	0x00000010a0100000, %r1, %r9
	setx	0x9d6ab8f63fc4eee7, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c23a2122f8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800f0a8548, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800e4fb0a4, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000f3e539151c, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000ea54e3e0a4, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000db632e4fa8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000d2c2559050, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000c6f150bb60, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800fbf83c8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e973d78, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000f6fa4350b8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000e85fd2bcb8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000808baa64e3, %r1, %r9
	setx	0x1af95e53f2491410, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e53233a, %r1, %r9
	setx	0x146c702c9f54b3b6, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f5493ff, %r1, %r9
	setx	0xc09f04daa57e70e3, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000cdacad1b87, %r1, %r9
	setx	0xd1368779bd0c0194, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d8ca82ad0f, %r1, %r9
	setx	0x0bf2dfcd57a20ef4, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ed04fbabfe, %r1, %r9
	setx	0xc7825f6ed366a5da, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f62791397e, %r1, %r9
	setx	0xe4be859b9ca09496, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e34abfc, %r1, %r9
	setx	0xc212317a7a661f69, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800fa4c07e, %r1, %r9
	setx	0xfbf042bc581723e9, %r1, %r10
	sth	%r10, [%r9]
	setx	0x0000001050100000, %r1, %r9
	setx	0xfbf042bc581723e9, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ce34bd5c1c, %r1, %r9
	setx	0xd0ecd4d5304a8e16, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000dd9f08cbb8, %r1, %r9
	setx	0x28af354d610fc154, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e368ffff8a, %r1, %r9
	setx	0xb63687ab763cbf7f, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f1091b7d46, %r1, %r9
	setx	0xf58914d41e529a1f, %r1, %r10
	sth	%r10, [%r9]
	setx	0x00000010f0100000, %r1, %r9
	setx	0xf58914d41e529a1f, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800e902290, %r1, %r9
	setx	0x23b18dd71554a504, %r1, %r10
	stw	%r10, [%r9]
	setx	0x00000010a0100000, %r1, %r9
	setx	0x23b18dd71554a504, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800fa476d0, %r1, %r9
	setx	0x7ebaa249e8e505c5, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000cb2ec2d574, %r1, %r9
	setx	0x95759af6874b1c27, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d758e41f24, %r1, %r9
	setx	0x3534df0c6ecc3eff, %r1, %r10
	stw	%r10, [%r9]
	setx	0x00000010c0100000, %r1, %r9
	setx	0x3534df0c6ecc3eff, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000ef73344bb8, %r1, %r9
	setx	0xf09e4aa76c886ea3, %r1, %r10
	stw	%r10, [%r9]
	setx	0x0000001020100000, %r1, %r9
	setx	0xf09e4aa76c886ea3, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000f165dd8bfc, %r1, %r9
	setx	0x0a7120b1407a5a81, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800eb1a180, %r1, %r9
	setx	0x093c63d1a4b17c6c, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000001020100000, %r1, %r9
	setx	0x093c63d1a4b17c6c, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f551238, %r1, %r9
	setx	0x26a26afe1c4fb854, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000001010100000, %r1, %r9
	setx	0x26a26afe1c4fb854, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c275bce700, %r1, %r9
	setx	0x2311a6835de81113, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000dc07186490, %r1, %r9
	setx	0xf7d2de23cd9ac587, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000001000100000, %r1, %r9
	setx	0xf7d2de23cd9ac587, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e3f2ae8f58, %r1, %r9
	setx	0x71f4c0820f2e9ffc, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f6fa4350b8, %r1, %r9
	setx	0xd41c69ba38054014, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800e74225b, %r1, %r12
	ldub	[%r12], %r11
	setx	0x00000080e67d0e30, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000fb347295f1, %r1, %r12
	ldub	[%r12], %r11
	setx	0x0000001010100000, %r1, %r9
	setx	0xd41c69ba38054014, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ea3f1a4e27, %r1, %r12
	ldub	[%r12], %r11
	setx	0x0000001020100000, %r1, %r9
	setx	0xd41c69ba38054014, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000df5b74f3e0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000c5414e06ba, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800fd57b28, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e97a560, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000f918b8353a, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000c74f112aa0, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000ed9da97dd8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000d274c25e40, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000c6d215c820, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800fdbd050, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800ec9ec48, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000f6fa4350b8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000e61c2144d8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000807eb184a1, %r1, %r9
	setx	0xcff6abfb273d4259, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e1073e0, %r1, %r9
	setx	0x2e8d7aad852f65ee, %r1, %r10
	stb	%r10, [%r9]
	setx	0x0000001040100000, %r1, %r9
	setx	0x2e8d7aad852f65ee, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f5161ba, %r1, %r9
	setx	0x53e67be8f84cafd9, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000cb70b2eac2, %r1, %r9
	setx	0xc28635fbddd28390, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000db5b5e6099, %r1, %r9
	setx	0x70efdbd8440d1148, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000efb615bcd9, %r1, %r9
	setx	0x7a1b7465b46be487, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f4baed45d6, %r1, %r9
	setx	0x0f22724875acdefe, %r1, %r10
	stb	%r10, [%r9]
	setx	0x0000001090100000, %r1, %r9
	setx	0x0f22724875acdefe, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800e140e62, %r1, %r9
	setx	0xdcbb337bc8aa0764, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f814044, %r1, %r9
	setx	0x0bf18e7d19cf53c8, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000cda791f716, %r1, %r9
	setx	0x0de16675f7ec5ba0, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d932449d6c, %r1, %r9
	setx	0x3cae94fe423ffac0, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e24ed988f6, %r1, %r9
	setx	0xe4b12d25d48afb7f, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f715947dd6, %r1, %r9
	setx	0x8a9f2f5e178a3818, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e022b90, %r1, %r9
	setx	0xd7dbcb314c9368fb, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f6e84e4, %r1, %r9
	setx	0x940d379a65b7678d, %r1, %r10
	stw	%r10, [%r9]
	setx	0x0000001030100000, %r1, %r9
	setx	0x940d379a65b7678d, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000ca590e7500, %r1, %r9
	setx	0x7aa52128d991cd60, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000dbe83b96ec, %r1, %r9
	setx	0xcee1b8096bcb2e69, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e23e14d5f8, %r1, %r9
	setx	0xabe225f8437f4801, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000fc5bcb6aa0, %r1, %r9
	setx	0x1bea6a3a657874b8, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e017c08, %r1, %r9
	setx	0x715af02f81752a8e, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f792680, %r1, %r9
	setx	0x94f24c2b868728ca, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c0dc722e20, %r1, %r9
	setx	0x746524529dbcd6df, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000dff506e080, %r1, %r9
	setx	0xccc445b28ea34673, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000001040100000, %r1, %r9
	setx	0xccc445b28ea34673, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000efeedaa9f8, %r1, %r9
	setx	0xbc82ec34c31591cc, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f6fa4350b8, %r1, %r9
	setx	0x8be111c621a89437, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d64503d2b5, %r1, %r12
	ldub	[%r12], %r11
	setx	0x00000010c0100000, %r1, %r9
	setx	0x8be111c621a89437, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c4ae1368a1, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800e72cf5e, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000f246bf4890, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000e9d292fc3a, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d672693ed2, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000c29d994fdc, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800f43a38a, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e925068, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000f8f35f9024, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000eca9ea3e40, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000d17311b7a8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000ca27903c50, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800fae4fac, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800ee4faac, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000f998e1a79c, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800e8b5bb0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000f6fa4350b8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000e4028edbb8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000d3f1f4c028, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000cf8d0d6c78, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800f3cf6c8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x00000080947e3e02, %r1, %r9
	setx	0x04a3e2dd0eb5c893, %r1, %r10
	stb	%r10, [%r9]
	setx	0x0000001030100000, %r1, %r9
	setx	0x04a3e2dd0eb5c893, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800e48ae5b, %r1, %r9
	setx	0x8491cdc869a422f3, %r1, %r10
	stb	%r10, [%r9]
	setx	0x00000010d0100000, %r1, %r9
	setx	0x8491cdc869a422f3, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800fbf7b9f, %r1, %r9
	setx	0x3410882a3380d9f9, %r1, %r10
	stb	%r10, [%r9]
	setx	0x0000001000100000, %r1, %r9
	setx	0x3410882a3380d9f9, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000cf5ed08404, %r1, %r9
	setx	0x9f3fc04592d3e237, %r1, %r10
	stb	%r10, [%r9]
	setx	0x0000001090100000, %r1, %r9
	setx	0x9f3fc04592d3e237, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000dd66d2d23c, %r1, %r9
	setx	0xbd972a02d1fefbba, %r1, %r10
	stb	%r10, [%r9]
	setx	0x0000001000100000, %r1, %r9
	setx	0xbd972a02d1fefbba, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e0bf2bc557, %r1, %r9
	setx	0xcd60017f8c942c97, %r1, %r10
	stb	%r10, [%r9]
	setx	0x00000010f0100000, %r1, %r9
	setx	0xcd60017f8c942c97, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f1e3e6228b, %r1, %r9
	setx	0x90e41f3f667270e3, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800eeebc2c, %r1, %r9
	setx	0xc7acae2ccddfa7fc, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f86975e, %r1, %r9
	setx	0xec2c321bf023cef0, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000cfcbca60d6, %r1, %r9
	setx	0xb6d51e6ae6149c57, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000de0aaa5748, %r1, %r9
	setx	0xcc9e73675c16a236, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e882b379ec, %r1, %r9
	setx	0xa5575c0957a190fa, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000fc63399a1a, %r1, %r9
	setx	0x7d6c1316f564c7e7, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800ecd95ec, %r1, %r9
	setx	0x2deff510d3586736, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f7628a0, %r1, %r9
	setx	0x1f8dea6815e71f4b, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c9f69ba660, %r1, %r9
	setx	0x913858a2ac1bd0ec, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d8e838dd24, %r1, %r9
	setx	0x6659a50b0feca00d, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000ed401113a4, %r1, %r9
	setx	0x29fca65fe23350ef, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f1e33dd0c8, %r1, %r9
	setx	0xa5a18604557adbb1, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e7cd330, %r1, %r9
	setx	0x0dd94cdabc9c005e, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f43bac8, %r1, %r9
	setx	0x0ca071ec66ab5072, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000cafbd9fcb0, %r1, %r9
	setx	0x1ac49339e5834c0d, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ded5b444f8, %r1, %r9
	setx	0x3f38bf425e888e2e, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ed10b0eb68, %r1, %r9
	setx	0xd59c1db3b4768631, %r1, %r10
	stx	%r10, [%r9]
	setx	0x00000010c0100000, %r1, %r9
	setx	0xd59c1db3b4768631, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f6fa4350b8, %r1, %r9
	setx	0x26e84c78b4ecfe9a, %r1, %r10
	stx	%r10, [%r9]
	setx	0x00000010d0100000, %r1, %r9
	setx	0x26e84c78b4ecfe9a, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000808bf89880, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000f99e17f382, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000e7cc76d001, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800fc36e56, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e4dc928, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000f67c7a2fb6, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e275410, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000d2117b6610, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000ced6e06050, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800f5b1238, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e2de148, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000f6fa4350b8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x00000080d88987de, %r1, %r9
	setx	0x68c96f980cef04f7, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800eefcf15, %r1, %r9
	setx	0x8557587d5d4a5186, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800ff0ac99, %r1, %r9
	setx	0x49feda654709e81e, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000cb243fabdd, %r1, %r9
	setx	0x6790c30e7cf0570c, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000de89532bab, %r1, %r9
	setx	0x37f0ecc96399c4ee, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e1033465ce, %r1, %r9
	setx	0x829aa696608d599c, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000fcee44dfc4, %r1, %r9
	setx	0x05b51513170afca3, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e94fc9e, %r1, %r9
	setx	0x7d698f79f994b32e, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800fa5c194, %r1, %r9
	setx	0xe3fc4382571dee1b, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c094b7c0ca, %r1, %r9
	setx	0x5a3d4faf1e08d34f, %r1, %r10
	sth	%r10, [%r9]
	setx	0x0000001020100000, %r1, %r9
	setx	0x5a3d4faf1e08d34f, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000d6817171b6, %r1, %r9
	setx	0xdd2bbeaebd515f4d, %r1, %r10
	sth	%r10, [%r9]
	setx	0x0000001000100000, %r1, %r9
	setx	0xdd2bbeaebd515f4d, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e325fb8d20, %r1, %r9
	setx	0xfd22da29f2bc1977, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f54b895cfa, %r1, %r9
	setx	0xff0f033109683f04, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800edd722c, %r1, %r9
	setx	0x1d01f95d376b3ff4, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800fbfcf10, %r1, %r9
	setx	0x90327b4623bd20f6, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000cbadcdfdc4, %r1, %r9
	setx	0x915bd237915b363e, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d1b9accb2c, %r1, %r9
	setx	0xd189a3418cff695a, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e4e5839720, %r1, %r9
	setx	0x63f2849aec76014c, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f14d0cc01c, %r1, %r9
	setx	0xc82af6c16b76412b, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e612228, %r1, %r9
	setx	0x46a9c880d259ec08, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f1bb0a0, %r1, %r9
	setx	0xc5051270538e3963, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c3b4014eb0, %r1, %r9
	setx	0x7d8d43e5025ee7ed, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d9d27969d8, %r1, %r9
	setx	0x0983e8bc20fa4d5a, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e7efbea420, %r1, %r9
	setx	0xde2dfc030da99b4c, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000001040100000, %r1, %r9
	setx	0xde2dfc030da99b4c, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f6fa4350b8, %r1, %r9
	setx	0x26a58debb4e8ede6, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800fcf648a, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000ce34bd5c1c, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800fa4c07e, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e34abfc, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000f4236df7c8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000ce139dd76c, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800f2a8d98, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800e275410, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000fb4a3af1c8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000e544d98388, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000d03f1bdd3c, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000c070690244, %r1, %r12
	lduw	[%r12], %r11
	setx	0x00000080b96f7c5b, %r1, %r9
	setx	0x7006f07f1b3f5797, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e8f87d3, %r1, %r9
	setx	0xf383547f4b44a8f7, %r1, %r10
	stb	%r10, [%r9]
	setx	0x0000001090100000, %r1, %r9
	setx	0xf383547f4b44a8f7, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800fb7b311, %r1, %r9
	setx	0x858ea08e79df95c7, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000cfdeeb870f, %r1, %r9
	setx	0x114eb57f1a52e726, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d3b2fffd7a, %r1, %r9
	setx	0x25d840adf6e6b0b3, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e1735e1671, %r1, %r9
	setx	0x5261fd44a2768287, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000fcbf84beb2, %r1, %r9
	setx	0x90dc3cfa7b30e821, %r1, %r10
	stb	%r10, [%r9]
	setx	0x0000001090100000, %r1, %r9
	setx	0x90dc3cfa7b30e821, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800e4ef268, %r1, %r9
	setx	0xef2fa2b94e33a8f0, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f80a232, %r1, %r9
	setx	0x0383b20fa1873ec9, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c0ac9b41cc, %r1, %r9
	setx	0x73df630903173a0a, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d29650e846, %r1, %r9
	setx	0x3f6c8b76082e9755, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e3268eb16e, %r1, %r9
	setx	0x6df43304111b06e1, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f4b290b9ba, %r1, %r9
	setx	0xa602d7789fb70077, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e88be6c, %r1, %r9
	setx	0xb0af8914caa2f0df, %r1, %r10
	stw	%r10, [%r9]
	setx	0x0000001020100000, %r1, %r9
	setx	0xb0af8914caa2f0df, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f24ce44, %r1, %r9
	setx	0x4790bd192856fe79, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000cfd5c9149c, %r1, %r9
	setx	0x512b991f8daa2c2e, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d46a9869d8, %r1, %r9
	setx	0x02aabc4fc741bb6c, %r1, %r10
	stw	%r10, [%r9]
	setx	0x00000010f0100000, %r1, %r9
	setx	0x02aabc4fc741bb6c, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e1fcfb8fb4, %r1, %r9
	setx	0xe43a8ff81b06ca74, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f7a9e422c4, %r1, %r9
	setx	0xae13a5e4d287ed35, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e4ac888, %r1, %r9
	setx	0xd9e234959702e905, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800fd30128, %r1, %r9
	setx	0x50fc57b47c5471b0, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000001020100000, %r1, %r9
	setx	0x50fc57b47c5471b0, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000c61ebdcca0, %r1, %r9
	setx	0x3eaaf91a8470a282, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d96e6196c8, %r1, %r9
	setx	0x726623aa2d2dc5fa, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e0d7046440, %r1, %r9
	setx	0x84fab35c2d043706, %r1, %r10
	stx	%r10, [%r9]
	setx	0x00000010a0100000, %r1, %r9
	setx	0x84fab35c2d043706, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f6fa4350b8, %r1, %r9
	setx	0xfb97ed10bc973659, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800fb13c60, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800e24835c, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800e151bf4, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000f729f113e8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000e87ca01e90, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000d795cb5310, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000c7091db5f8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800fa4e9b4, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800fdbd050, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800ec9ec48, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000f6fa4350b8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000e61c2144d8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000d4b6b44788, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000c567cfa1c0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800fc8fa98, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000804e569002, %r1, %r9
	setx	0xe5cb0b0df3cc5c54, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e8e6410, %r1, %r9
	setx	0xbda2137482fa2acd, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800fc3dd75, %r1, %r9
	setx	0x75835a5f5218c4c6, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c462cfbfb0, %r1, %r9
	setx	0x9ec103a4ce407b7f, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d5867a9a6c, %r1, %r9
	setx	0x8881ab55e6655f03, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e89ef7b3e5, %r1, %r9
	setx	0xd05e98d7c189c486, %r1, %r10
	stb	%r10, [%r9]
	setx	0x00000010d0100000, %r1, %r9
	setx	0xd05e98d7c189c486, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000f68b24653d, %r1, %r9
	setx	0x4a4df6bb03506fac, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e97958c, %r1, %r9
	setx	0x5c0e1c44ef7a2aa1, %r1, %r10
	sth	%r10, [%r9]
	setx	0x0000001060100000, %r1, %r9
	setx	0x5c0e1c44ef7a2aa1, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f368b3c, %r1, %r9
	setx	0xf99d4b4980b4902d, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c081e9d7a0, %r1, %r9
	setx	0xb3554908c0919c0c, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d8758ec604, %r1, %r9
	setx	0xea016fdb3d8c177e, %r1, %r10
	sth	%r10, [%r9]
	setx	0x00000010d0100000, %r1, %r9
	setx	0xea016fdb3d8c177e, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e0ec5758a2, %r1, %r9
	setx	0x8b6d07de71b0884e, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000faef2e549c, %r1, %r9
	setx	0xc0e4f0b5aa3df0b8, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800eefc580, %r1, %r9
	setx	0x1ce11790251ee5c1, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f159218, %r1, %r9
	setx	0xb4f99a49e82fe2b5, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000cd2f4960ac, %r1, %r9
	setx	0x0e4c1d4ccfba60aa, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d4c09c8b98, %r1, %r9
	setx	0x973f791e39a66ad3, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000ebdcaf947c, %r1, %r9
	setx	0x9910d13a1f2cecb1, %r1, %r10
	stw	%r10, [%r9]
	setx	0x0000001050100000, %r1, %r9
	setx	0x9910d13a1f2cecb1, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000fcc5818f6c, %r1, %r9
	setx	0x8208ecf1b9580853, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800ebad6d0, %r1, %r9
	setx	0xe4597c26e9eb1c46, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f8a0d48, %r1, %r9
	setx	0x4e3ed9546c1530ac, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c0240d9b10, %r1, %r9
	setx	0xc1856b4c55895f64, %r1, %r10
	stx	%r10, [%r9]
	setx	0x00000010c0100000, %r1, %r9
	setx	0xc1856b4c55895f64, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000dd2b1d8678, %r1, %r9
	setx	0xf04a7d20762800d1, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000eeb1187e68, %r1, %r9
	setx	0x65b28aefd6151ebd, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f6fa4350b8, %r1, %r9
	setx	0x6d20363710480462, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000807ec023db, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000f59464dbcf, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000f6fa4350b8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x00000080cffa11d4, %r1, %r9
	setx	0xbec0a8c6d0c851f0, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800eb6e5d4, %r1, %r9
	setx	0x2413cabdda2a4b61, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f4b5c39, %r1, %r9
	setx	0xd4509dd7ad913033, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000cf53ae9790, %r1, %r9
	setx	0xd5828e94ca61a88f, %r1, %r10
	stb	%r10, [%r9]
	setx	0x00000010a0100000, %r1, %r9
	setx	0xd5828e94ca61a88f, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000dea7c678d8, %r1, %r9
	setx	0x45f14a4c729506b0, %r1, %r10
	stb	%r10, [%r9]
	setx	0x0000001090100000, %r1, %r9
	setx	0x45f14a4c729506b0, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ee87240444, %r1, %r9
	setx	0x28758471488b98b7, %r1, %r10
	stb	%r10, [%r9]
	setx	0x00000010d0100000, %r1, %r9
	setx	0x28758471488b98b7, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000f7fb63b7a3, %r1, %r9
	setx	0xf4e425697ef4444b, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800ea45206, %r1, %r9
	setx	0xec9ffc8b14258290, %r1, %r10
	sth	%r10, [%r9]
	setx	0x0000001030100000, %r1, %r9
	setx	0xec9ffc8b14258290, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f112d40, %r1, %r9
	setx	0xeb0fbe82cc3a84ab, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c43cc68c6e, %r1, %r9
	setx	0x7e0d3a5910d8ec2f, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000dbe4679c8a, %r1, %r9
	setx	0xf545ede2bca62205, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e9630a18ac, %r1, %r9
	setx	0x9322a11264868dcf, %r1, %r10
	sth	%r10, [%r9]
	setx	0x00000010b0100000, %r1, %r9
	setx	0x9322a11264868dcf, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000f67ae08b00, %r1, %r9
	setx	0xe34799807c7ca23d, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800ef0b4f8, %r1, %r9
	setx	0x5ec17644d538cca0, %r1, %r10
	stw	%r10, [%r9]
	setx	0x00000010e0100000, %r1, %r9
	setx	0x5ec17644d538cca0, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f7e9304, %r1, %r9
	setx	0x3a9557bee4e9a852, %r1, %r10
	stw	%r10, [%r9]
	setx	0x00000010f0100000, %r1, %r9
	setx	0x3a9557bee4e9a852, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000cb1d4b23d8, %r1, %r9
	setx	0x57ecd80c2f804641, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000dab59c2a88, %r1, %r9
	setx	0x5c957c299d8024d6, %r1, %r10
	stw	%r10, [%r9]
	setx	0x0000001060100000, %r1, %r9
	setx	0x5c957c299d8024d6, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e714e4f8b0, %r1, %r9
	setx	0x46eb1a00576234b4, %r1, %r10
	stw	%r10, [%r9]
	setx	0x0000001000100000, %r1, %r9
	setx	0x46eb1a00576234b4, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000fbfe37e9e4, %r1, %r9
	setx	0x556210302faf2961, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e6df358, %r1, %r9
	setx	0xe5b92fb07cce0ecf, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000001060100000, %r1, %r9
	setx	0xe5b92fb07cce0ecf, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800f8a3458, %r1, %r9
	setx	0x7b03eda19558ea22, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c38062ad40, %r1, %r9
	setx	0xa63ebab78803783c, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000001080100000, %r1, %r9
	setx	0xa63ebab78803783c, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000d127547cb8, %r1, %r9
	setx	0x7244882259765581, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e4f4e28520, %r1, %r9
	setx	0xec5f06b6a6558dd2, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f6fa4350b8, %r1, %r9
	setx	0xfd2221a2f44d0f47, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000804e172440, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000faa8ba0472, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000ef7bc944b2, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000d87e1851dc, %r1, %r12
	ldub	[%r12], %r11
	setx	0x0000001030100000, %r1, %r9
	setx	0xfd2221a2f44d0f47, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e457af8688, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000dcaa0d0886, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000cce286a590, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800fc4cde0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e4c30f2, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000f98fdcf760, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800edccbcc, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000fbc1dc52b0, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000ea0186eef0, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000d649de2dc0, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000c23a2122f8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800f0a8548, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800e4fb0a4, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000e73c12cda0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000804aeb5606, %r1, %r9
	setx	0x77c4947665449362, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800ead73ed, %r1, %r9
	setx	0x4ffe15748d6cd2d0, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f924312, %r1, %r9
	setx	0x155386dd30de8a0f, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ccd6ce9244, %r1, %r9
	setx	0xcf8fb837a7c53696, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d5c9f419c2, %r1, %r9
	setx	0x5ba5813b021c29ac, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ef272f8a92, %r1, %r9
	setx	0xb3997168b01e0259, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f9e20f9433, %r1, %r9
	setx	0x38147f7af170659b, %r1, %r10
	stb	%r10, [%r9]
	setx	0x0000001070100000, %r1, %r9
	setx	0x38147f7af170659b, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800e1a19e0, %r1, %r9
	setx	0x25b40f74580d2190, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800fdd87f4, %r1, %r9
	setx	0x1a37bb2c5417e4fc, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000cd2c7d4058, %r1, %r9
	setx	0x98550b6a731cd948, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000dc944dcc1c, %r1, %r9
	setx	0x6773d8f7e247dccf, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e3b67cb39a, %r1, %r9
	setx	0xefa48cc1198b9ebd, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f5c4dae14e, %r1, %r9
	setx	0x713eafc5e72ca0ee, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800ee02d44, %r1, %r9
	setx	0x3e8981893f048c41, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f154140, %r1, %r9
	setx	0x659031c048270731, %r1, %r10
	stw	%r10, [%r9]
	setx	0x0000001090100000, %r1, %r9
	setx	0x659031c048270731, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000c897874928, %r1, %r9
	setx	0x84ff045ba2ef3ba4, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d941c92fec, %r1, %r9
	setx	0x85f2b5f5d8ec28e4, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e89949e098, %r1, %r9
	setx	0x2909b64fb69b952f, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f445913520, %r1, %r9
	setx	0xd9e2d3051b2ee066, %r1, %r10
	stw	%r10, [%r9]
	setx	0x0000001000100000, %r1, %r9
	setx	0xd9e2d3051b2ee066, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800e6180e0, %r1, %r9
	setx	0x89e7f3f421a8d79b, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f4ff868, %r1, %r9
	setx	0x860c0345c3d35e77, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c8661ddc70, %r1, %r9
	setx	0xe385cc09ea7a3716, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d25af54340, %r1, %r9
	setx	0x69b178aadf94f698, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e1de566868, %r1, %r9
	setx	0x36864e8fdf743ff7, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f6fa4350b8, %r1, %r9
	setx	0x62073ce4f47ed170, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000001020100000, %r1, %r9
	setx	0x62073ce4f47ed170, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000dda7484f08, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000ce8946f2c7, %r1, %r12
	ldub	[%r12], %r11
	setx	0x00000010e0100000, %r1, %r9
	setx	0x62073ce4f47ed170, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800f49265d, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800e5d2159, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000802a9717f6, %r1, %r12
	ldub	[%r12], %r11
	setx	0x0000001060100000, %r1, %r9
	setx	0x62073ce4f47ed170, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c4f9497bf8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800fc5dee0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800efdeaf6, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000fc170e488e, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000e731288e0e, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000e576446e3c, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000dfe136b48c, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000cd5c79238c, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800ffcf4b4, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800eea4d34, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000f2c0be20d4, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000eacd0db7fc, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000c6840d4218, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800fcf0280, %r1, %r12
	ldx	[%r12], %r11
	setx	0x0000008030cf2bb1, %r1, %r9
	setx	0x6c180fa8e0ac62b0, %r1, %r10
	stb	%r10, [%r9]
	setx	0x00000010c0100000, %r1, %r9
	setx	0x6c180fa8e0ac62b0, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800e09c4dd, %r1, %r9
	setx	0x06cc6102cb4531c8, %r1, %r10
	stb	%r10, [%r9]
	setx	0x0000001080100000, %r1, %r9
	setx	0x06cc6102cb4531c8, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800f019a06, %r1, %r9
	setx	0x6813781f738940a8, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000cb729db0ec, %r1, %r9
	setx	0x3bb9b119bdfcf51b, %r1, %r10
	stb	%r10, [%r9]
	setx	0x0000001060100000, %r1, %r9
	setx	0x3bb9b119bdfcf51b, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d2a7db4dab, %r1, %r9
	setx	0xb253420d2dee6bad, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000eb6a610e27, %r1, %r9
	setx	0xe79c93d3aab44d9d, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f7ee7a2b47, %r1, %r9
	setx	0x96e9b8163ce2e821, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e21b2ca, %r1, %r9
	setx	0x51ab13611bdb8668, %r1, %r10
	sth	%r10, [%r9]
	setx	0x0000001030100000, %r1, %r9
	setx	0x51ab13611bdb8668, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800fe6b228, %r1, %r9
	setx	0x3bfffd53559dbf25, %r1, %r10
	sth	%r10, [%r9]
	setx	0x0000001000100000, %r1, %r9
	setx	0x3bfffd53559dbf25, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000c1b597cee2, %r1, %r9
	setx	0x4c3101f7532d0f7d, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d38f3346fe, %r1, %r9
	setx	0x9151b34a0f8aec9a, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e341aaaa4e, %r1, %r9
	setx	0x0eddb89ccc1c458a, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000fddd9cd676, %r1, %r9
	setx	0x4b0d92dc02b0cbe4, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e90c8b8, %r1, %r9
	setx	0x2eb8e5e4c4b9d654, %r1, %r10
	stw	%r10, [%r9]
	setx	0x0000001050100000, %r1, %r9
	setx	0x2eb8e5e4c4b9d654, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f5158b4, %r1, %r9
	setx	0x446c5ba07a3b6aeb, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000cf9b42079c, %r1, %r9
	setx	0xc2263cdd99725d5a, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000dbf93e96d8, %r1, %r9
	setx	0x38e500a56bccee93, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e660fbfa2c, %r1, %r9
	setx	0xd679abe475896944, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000fba4bcb118, %r1, %r9
	setx	0x95887cfed414e030, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800eddb2b0, %r1, %r9
	setx	0x1a8af28aef639330, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f675bf8, %r1, %r9
	setx	0xf8d269fb55fd6cca, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c5f6fc68b8, %r1, %r9
	setx	0xf4b9775cd65ba264, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d70302be68, %r1, %r9
	setx	0x2d9c8c774ddf835e, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000edd7bf75d0, %r1, %r9
	setx	0xc270956631753950, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f6fa4350b8, %r1, %r9
	setx	0x543c22ffe3627701, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c065ebfb7e, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800fcdbf84, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800ec64bde, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000802fd508a5, %r1, %r12
	ldub	[%r12], %r11
	setx	0x00000010d0100000, %r1, %r9
	setx	0x543c22ffe3627701, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000fcafca4f10, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000eaa18b218b, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000ddb8ea78f6, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000ed802298aa, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800ede75e4, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000fc6ed54c04, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000e6c1928534, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000d2fd56bb74, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000c8991a6640, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800feb8a78, %r1, %r12
	lduw	[%r12], %r11
	setx	0x0000008017d23d84, %r1, %r9
	setx	0xbcfd16498aca1d0a, %r1, %r10
	stb	%r10, [%r9]
	setx	0x0000001070100000, %r1, %r9
	setx	0xbcfd16498aca1d0a, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800e64f1d2, %r1, %r9
	setx	0x4d7573d261694fd4, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f84d416, %r1, %r9
	setx	0xb7a53c4001e13c14, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c13b3b429f, %r1, %r9
	setx	0xa9860ef7d5f422e3, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d40bdf674e, %r1, %r9
	setx	0xd4f59c5552a71faa, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e657d1eb01, %r1, %r9
	setx	0x18ed63efb3830bb4, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000fc1e7830a3, %r1, %r9
	setx	0x1e4876458940e418, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e2c911a, %r1, %r9
	setx	0x688ef362a2a52664, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800fcca94e, %r1, %r9
	setx	0x238aa2f5bb6740c5, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000cc032676f2, %r1, %r9
	setx	0x40efcb6981f24262, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d8f2ee83ea, %r1, %r9
	setx	0x2202a6ee3ed303e5, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e72f03bb20, %r1, %r9
	setx	0x363fcd071b58baa9, %r1, %r10
	sth	%r10, [%r9]
	setx	0x0000001040100000, %r1, %r9
	setx	0x363fcd071b58baa9, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000fbb87483b2, %r1, %r9
	setx	0xd6c5186b2b8209ab, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800eca7250, %r1, %r9
	setx	0x4076a34a05e4b5f9, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800fd12dfc, %r1, %r9
	setx	0xe959e6baa5347a39, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000cc31c4f5bc, %r1, %r9
	setx	0x47a9f0d4c387ae7c, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d0c72e8530, %r1, %r9
	setx	0x8a59d0604be5f7bf, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000eecb54e6a8, %r1, %r9
	setx	0xfe586d1dd9c6d627, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f6b2e5549c, %r1, %r9
	setx	0xd801af3a7632159f, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800ecd0710, %r1, %r9
	setx	0xa2fb237b63795f33, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800feda530, %r1, %r9
	setx	0x4bcaf611c1c31207, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c3071faaf8, %r1, %r9
	setx	0xf27e7c0d6ebec630, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000001080100000, %r1, %r9
	setx	0xf27e7c0d6ebec630, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d2f6a4ece8, %r1, %r9
	setx	0xb18e41ff174cb79f, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e7365d6368, %r1, %r9
	setx	0x028c3bb4af85a74d, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f6fa4350b8, %r1, %r9
	setx	0xc917e2d52ea1bc61, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000fcee44dfc4, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000e1033465ce, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000de89532bab, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000cb243fabdd, %r1, %r12
	ldub	[%r12], %r11
	setx	0x0000001090100000, %r1, %r9
	setx	0xc917e2d52ea1bc61, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800fc36e56, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e4dc928, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000f67c7a2fb6, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000ee8ea5f9a2, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000f84b871280, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000e263a02ce4, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000d754ed2b14, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000c849d4c0c0, %r1, %r12
	lduw	[%r12], %r11
	setx	0x0000008043dafa38, %r1, %r9
	setx	0x08d1182483145f97, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e291b12, %r1, %r9
	setx	0xd1bbad1e41282cc9, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800ffe0e44, %r1, %r9
	setx	0x8c5f877e9494ffb4, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c8a1a0070c, %r1, %r9
	setx	0x1eee5a49c884281c, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d12c39716d, %r1, %r9
	setx	0x3dae6976febb3fc3, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e1fa7d71cc, %r1, %r9
	setx	0x80f5509d376bf7b8, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f20cbf3315, %r1, %r9
	setx	0x754f96f2e543054d, %r1, %r10
	stb	%r10, [%r9]
	setx	0x00000010a0100000, %r1, %r9
	setx	0x754f96f2e543054d, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800e2cf616, %r1, %r9
	setx	0x1cb252919dd79a01, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f13bc4c, %r1, %r9
	setx	0x368a805ca5207874, %r1, %r10
	sth	%r10, [%r9]
	setx	0x0000001050100000, %r1, %r9
	setx	0x368a805ca5207874, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000c5698908ae, %r1, %r9
	setx	0x88af04a0101c138b, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d42e88ce72, %r1, %r9
	setx	0x4873934f911988bd, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e4b4d910d0, %r1, %r9
	setx	0xf03d009756145c9e, %r1, %r10
	sth	%r10, [%r9]
	setx	0x00000010d0100000, %r1, %r9
	setx	0xf03d009756145c9e, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000fa6d48dd26, %r1, %r9
	setx	0xd0a6c30b78d42985, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e5d1a00, %r1, %r9
	setx	0x2b91fcce73172d71, %r1, %r10
	stw	%r10, [%r9]
	setx	0x0000001080100000, %r1, %r9
	setx	0x2b91fcce73172d71, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f295fa8, %r1, %r9
	setx	0x51a88818c6fc139d, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000ce099fb8f8, %r1, %r9
	setx	0xb4d8a826f7e0f701, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000dd5b2cf068, %r1, %r9
	setx	0x1373eeea705ae9db, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e87f9618c8, %r1, %r9
	setx	0x92519717cf53d235, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f9d3dd2404, %r1, %r9
	setx	0xa24b834f1282d256, %r1, %r10
	stw	%r10, [%r9]
	setx	0x0000001000100000, %r1, %r9
	setx	0xa24b834f1282d256, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800e14b6f0, %r1, %r9
	setx	0x02a205b5ac9357e9, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000001000100000, %r1, %r9
	setx	0x02a205b5ac9357e9, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f8254f0, %r1, %r9
	setx	0x75b9c4375f6c371c, %r1, %r10
	stx	%r10, [%r9]
	setx	0x00000010c0100000, %r1, %r9
	setx	0x75b9c4375f6c371c, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000cc11147438, %r1, %r9
	setx	0xd4b6c9e6e238d9b5, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d4e097c490, %r1, %r9
	setx	0x2696a839dfe53428, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e4c65dbdc0, %r1, %r9
	setx	0x20d3ba6fe9e1920d, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f6fa4350b8, %r1, %r9
	setx	0x492f95afb17151dc, %r1, %r10
	stx	%r10, [%r9]
	setx	0x00000010c0100000, %r1, %r9
	setx	0x492f95afb17151dc, %r1, %r10
	ldx	[%r9], %r10
	setx	0x0000008085ee78d9, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000f8a3890b2c, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000ed2397a331, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000f1b9e4b2ac, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000e3accca308, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000dcfe1a1ab8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000ceff6e0d8c, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800f84ee90, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000ce85015ba0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800f2d2350, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800ed11600, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000f6fa4350b8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x00000080a1a5f962, %r1, %r9
	setx	0x98ca38ab7d45b031, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800ecd974d, %r1, %r9
	setx	0x9a02f4a1e5e6fe90, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f17e155, %r1, %r9
	setx	0x3c83d1569f8d434d, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000cddbc929ec, %r1, %r9
	setx	0xe76c1ad55b0bb4e5, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000dc0d39a20d, %r1, %r9
	setx	0x4e33e077b2636e19, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e98eca18af, %r1, %r9
	setx	0xf43e1b8ca95bcb37, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000fb7c55880d, %r1, %r9
	setx	0x09170224be4791b0, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e86cba8, %r1, %r9
	setx	0xd09dac40b90bd7f0, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f6385fa, %r1, %r9
	setx	0xf585e05c459de717, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000cd888a1396, %r1, %r9
	setx	0xaea50d43dd110f62, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d3ffe199b8, %r1, %r9
	setx	0x520c5161621b8fe8, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e1782090ac, %r1, %r9
	setx	0xfa8194038f8f50c6, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000fe64d78446, %r1, %r9
	setx	0xbb8560044cd9f5eb, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e072d10, %r1, %r9
	setx	0x701fc3b799496d64, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800fce2610, %r1, %r9
	setx	0x4fed93429fadc676, %r1, %r10
	stw	%r10, [%r9]
	setx	0x0000001050100000, %r1, %r9
	setx	0x4fed93429fadc676, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c5464e2b5c, %r1, %r9
	setx	0x9e669cc4bb97ff7f, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000de4475648c, %r1, %r9
	setx	0x2c2da138085363b9, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e9c50f171c, %r1, %r9
	setx	0x43f4c722d87b4717, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000fb06cdc2b4, %r1, %r9
	setx	0x0d28e22808b15d5a, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800ebd8740, %r1, %r9
	setx	0x3bc42640f5ba7e54, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800fe92738, %r1, %r9
	setx	0x9fd67ac7e9894e63, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c3ae115248, %r1, %r9
	setx	0x80088dcb05b59556, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000db95253430, %r1, %r9
	setx	0xf78ccc0a2604d08c, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e1bf5e7e48, %r1, %r9
	setx	0xf545dbb61d58af76, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f6fa4350b8, %r1, %r9
	setx	0x065c945ded14e295, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f43679392c, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000e346450844, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000db8fd397ae, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000c74bdd0ae4, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800f0404ee, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800ef24ed0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800f1bb0a0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e612228, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000f6fa4350b8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000ed10b0eb68, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000ded5b444f8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000cafbd9fcb0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800f43bac8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000807d72f251, %r1, %r9
	setx	0x6b92f1f44d06c384, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e5a2f97, %r1, %r9
	setx	0xd1808a08a15e3b39, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f57cb14, %r1, %r9
	setx	0x33b58c9075b3f59b, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ced6bc133d, %r1, %r9
	setx	0x93877b40f54b3dda, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d0487f7482, %r1, %r9
	setx	0xae5c249e4083cd43, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ed42b0a2d8, %r1, %r9
	setx	0x2e212a6088cd165f, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f799b81237, %r1, %r9
	setx	0xc445186fa8412b1c, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800ee5e474, %r1, %r9
	setx	0x927f4c8f56c5e1ac, %r1, %r10
	sth	%r10, [%r9]
	setx	0x00000010b0100000, %r1, %r9
	setx	0x927f4c8f56c5e1ac, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f3e9cc8, %r1, %r9
	setx	0x5134c32a723a2059, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000cc64b1248c, %r1, %r9
	setx	0x6aa782e6150529d5, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d6b8d36f9e, %r1, %r9
	setx	0xba4be3af735b45b5, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000eafe296e90, %r1, %r9
	setx	0xd7ba64ec95642de6, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000fc500f403c, %r1, %r9
	setx	0x3a94fa64214d6c8e, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e1af1f8, %r1, %r9
	setx	0x664060ac07be50dd, %r1, %r10
	stw	%r10, [%r9]
	setx	0x0000001070100000, %r1, %r9
	setx	0x664060ac07be50dd, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f92b8d4, %r1, %r9
	setx	0x2a7086be783e8cf1, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c2ee32643c, %r1, %r9
	setx	0x82afeb910dcfad00, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000dc7ff0d124, %r1, %r9
	setx	0x9de61b89dd934d1e, %r1, %r10
	stw	%r10, [%r9]
	setx	0x0000001040100000, %r1, %r9
	setx	0x9de61b89dd934d1e, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000eff66b7fec, %r1, %r9
	setx	0xcce94c798a963151, %r1, %r10
	stw	%r10, [%r9]
	setx	0x00000010b0100000, %r1, %r9
	setx	0xcce94c798a963151, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f4e8510510, %r1, %r9
	setx	0x7bde710cb9aadba3, %r1, %r10
	stw	%r10, [%r9]
	setx	0x00000010a0100000, %r1, %r9
	setx	0x7bde710cb9aadba3, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800e15c0c0, %r1, %r9
	setx	0x8b57d0af670283e1, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000001090100000, %r1, %r9
	setx	0x8b57d0af670283e1, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800fa80478, %r1, %r9
	setx	0x8eed69550b711bae, %r1, %r10
	stx	%r10, [%r9]
	setx	0x00000010a0100000, %r1, %r9
	setx	0x8eed69550b711bae, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000c7494c72a8, %r1, %r9
	setx	0x2727f729420b2edd, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000dc354eb4b0, %r1, %r9
	setx	0x3883fb423bdfba89, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e513fc0438, %r1, %r9
	setx	0x548d83dae87f5925, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f6fa4350b8, %r1, %r9
	setx	0xa64bb9cd1b492c65, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d6930d62ef, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000c1acba1f0f, %r1, %r12
	ldub	[%r12], %r11
	setx	0x00000010f0100000, %r1, %r9
	setx	0xa64bb9cd1b492c65, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f404e06, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800e412725, %r1, %r12
	ldub	[%r12], %r11
	setx	0x00000080607a0c92, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000f0b088e50e, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000eeedc28273, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800eaae068, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000f693ebcc5c, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000e880f72314, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000de550efbc8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800e00c480, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000f6fa4350b8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000e5fb8a7998, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000de60ba7128, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000c40c9ca328, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800fb5e5b8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x0000008072893021, %r1, %r9
	setx	0xefb6e151a738bbbb, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e933df5, %r1, %r9
	setx	0x2e3a0796c46aa339, %r1, %r10
	stb	%r10, [%r9]
	setx	0x0000001050100000, %r1, %r9
	setx	0x2e3a0796c46aa339, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800f71f4d5, %r1, %r9
	setx	0x3bce015f66719c88, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000cbba3204de, %r1, %r9
	setx	0x226bf84176b54ebd, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d6ce21846c, %r1, %r9
	setx	0x9d71c5fc962233e7, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e0400e56a7, %r1, %r9
	setx	0x61dc4139aabbbaa4, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000fad788b646, %r1, %r9
	setx	0x0f38118e96ecf5eb, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e875b0e, %r1, %r9
	setx	0x9a5b1b8a1a24616c, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800faf65be, %r1, %r9
	setx	0xaf28b7e24eadb6d4, %r1, %r10
	sth	%r10, [%r9]
	setx	0x00000010e0100000, %r1, %r9
	setx	0xaf28b7e24eadb6d4, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c7d04e7abe, %r1, %r9
	setx	0x59a40551396bbba6, %r1, %r10
	sth	%r10, [%r9]
	setx	0x00000010a0100000, %r1, %r9
	setx	0x59a40551396bbba6, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000d2c4f2bc8e, %r1, %r9
	setx	0x94f46a35aa238a25, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e1244b269e, %r1, %r9
	setx	0x9633cf0b911dd8bf, %r1, %r10
	sth	%r10, [%r9]
	setx	0x00000010d0100000, %r1, %r9
	setx	0x9633cf0b911dd8bf, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000fce1e36e3c, %r1, %r9
	setx	0x5a52945771111708, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e835b10, %r1, %r9
	setx	0x2cfb8c75d48408a6, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800ffae1dc, %r1, %r9
	setx	0xec3002ca820b6e7d, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c7739dd41c, %r1, %r9
	setx	0x3228d7e16d4bb080, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d0b2d29db8, %r1, %r9
	setx	0xc890c56d943aacf4, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e79d9b7d7c, %r1, %r9
	setx	0x8e8f8fadd2c32912, %r1, %r10
	stw	%r10, [%r9]
	setx	0x00000010e0100000, %r1, %r9
	setx	0x8e8f8fadd2c32912, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000f15919db80, %r1, %r9
	setx	0xde6b0ac9810ef907, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e4f2320, %r1, %r9
	setx	0xad9a875165743268, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800fadda78, %r1, %r9
	setx	0x8b54e3adf1a92c51, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000001020100000, %r1, %r9
	setx	0x8b54e3adf1a92c51, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c78645c350, %r1, %r9
	setx	0x1d05467370dfa004, %r1, %r10
	stx	%r10, [%r9]
	setx	0x00000010b0100000, %r1, %r9
	setx	0x1d05467370dfa004, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000deb4174d78, %r1, %r9
	setx	0x1b0a9009a2f65d1e, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ecac0166b0, %r1, %r9
	setx	0xfa6b4d7f160e736b, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f6fa4350b8, %r1, %r9
	setx	0xce0ae48c3a9a7bc4, %r1, %r10
	stx	%r10, [%r9]
	setx	0x00000010d0100000, %r1, %r9
	setx	0xce0ae48c3a9a7bc4, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000f0b088e50e, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000eeedc28273, %r1, %r12
	ldub	[%r12], %r11
	setx	0x0000001000100000, %r1, %r9
	setx	0xce0ae48c3a9a7bc4, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000f54b895cfa, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000e325fb8d20, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d6817171b6, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000c094b7c0ca, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800fa5c194, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e94fc9e, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000fc63399a1a, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e9fcdc8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000f4057cd4dc, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000ecaaab1454, %r1, %r12
	lduw	[%r12], %r11
	setx	0x00000080ebf96012, %r1, %r9
	setx	0x6a0b2945963f17e7, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800efeff94, %r1, %r9
	setx	0x0f6f54880d08a279, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800fd79818, %r1, %r9
	setx	0x5c1867a0b06751eb, %r1, %r10
	stb	%r10, [%r9]
	setx	0x0000001010100000, %r1, %r9
	setx	0x5c1867a0b06751eb, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000c818162712, %r1, %r9
	setx	0x9b0770bf3c375c66, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d31eb48fa4, %r1, %r9
	setx	0x6eb7380a690eb35b, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e0a25147ae, %r1, %r9
	setx	0x241a372348831247, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f215ff0696, %r1, %r9
	setx	0x5b2b4b67cecf52fe, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e634462, %r1, %r9
	setx	0x217876898d70671b, %r1, %r10
	sth	%r10, [%r9]
	setx	0x00000010d0100000, %r1, %r9
	setx	0x217876898d70671b, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800fe66440, %r1, %r9
	setx	0xed1ac4028a848610, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000cafeffcee6, %r1, %r9
	setx	0x4f618e6c5aebd7eb, %r1, %r10
	sth	%r10, [%r9]
	setx	0x00000010f0100000, %r1, %r9
	setx	0x4f618e6c5aebd7eb, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000d635832298, %r1, %r9
	setx	0x85b705786a893f2e, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e5e500b00e, %r1, %r9
	setx	0xb24f01aa6324cc1c, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f8838fd6de, %r1, %r9
	setx	0xdc06627ae13e5c87, %r1, %r10
	sth	%r10, [%r9]
	setx	0x00000010d0100000, %r1, %r9
	setx	0xdc06627ae13e5c87, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800e43edfc, %r1, %r9
	setx	0x1424e28ea86811d1, %r1, %r10
	stw	%r10, [%r9]
	setx	0x0000001080100000, %r1, %r9
	setx	0x1424e28ea86811d1, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f581d90, %r1, %r9
	setx	0x1bea614fb983ffaa, %r1, %r10
	stw	%r10, [%r9]
	setx	0x0000001090100000, %r1, %r9
	setx	0x1bea614fb983ffaa, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c6596ac680, %r1, %r9
	setx	0x2de11bf4084643a1, %r1, %r10
	stw	%r10, [%r9]
	setx	0x0000001010100000, %r1, %r9
	setx	0x2de11bf4084643a1, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000dc2f9e7f14, %r1, %r9
	setx	0x5804ca74d036ce95, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e36ed73d44, %r1, %r9
	setx	0x09d909b3662fbf38, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f77128f5f4, %r1, %r9
	setx	0xf9e76a6a966c21a5, %r1, %r10
	stw	%r10, [%r9]
	setx	0x00000010b0100000, %r1, %r9
	setx	0xf9e76a6a966c21a5, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800eb20ec0, %r1, %r9
	setx	0x315a86d035458a63, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800fc029d8, %r1, %r9
	setx	0x4e6b3eb217ad0dab, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c025c43b58, %r1, %r9
	setx	0x1809501b3e340174, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000dd92cc9c90, %r1, %r9
	setx	0x71a4ba92271db045, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ed60f03d98, %r1, %r9
	setx	0xf93e42c8f2705165, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f6fa4350b8, %r1, %r9
	setx	0xde6258d7d632a665, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800e270fee, %r1, %r12
	ldub	[%r12], %r11
	setx	0x00000080d3538f46, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000f97bf02070, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000e07c44a5e0, %r1, %r12
	ldub	[%r12], %r11
	setx	0x0000001020100000, %r1, %r9
	setx	0xde6258d7d632a665, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800e47109e, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000f51d563f3e, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000e5f357be70, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000dbe018b8de, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000ce6eb9f9d6, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800f3edeb6, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000eeb1187e68, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000dd2b1d8678, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000c0240d9b10, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800f8a0d48, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800ebad6d0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000f6fa4350b8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000e0d7046440, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000806d281519, %r1, %r9
	setx	0x2decf45c8d61485e, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e733eab, %r1, %r9
	setx	0x2e46dfc8f88efc29, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f16f18b, %r1, %r9
	setx	0xeac2a55e8f5f1878, %r1, %r10
	stb	%r10, [%r9]
	setx	0x00000010d0100000, %r1, %r9
	setx	0xeac2a55e8f5f1878, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000c935e7a8ca, %r1, %r9
	setx	0x50e0075884ebca7a, %r1, %r10
	stb	%r10, [%r9]
	setx	0x00000010c0100000, %r1, %r9
	setx	0x50e0075884ebca7a, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d02ad04af9, %r1, %r9
	setx	0xfeb66e4021f00d77, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ecd7a40d71, %r1, %r9
	setx	0x4b01bdaea363b509, %r1, %r10
	stb	%r10, [%r9]
	setx	0x00000010a0100000, %r1, %r9
	setx	0x4b01bdaea363b509, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000f8e06a9ebf, %r1, %r9
	setx	0xa73422e9240f38ae, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e861fdc, %r1, %r9
	setx	0xad504df8725d2fa4, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f30f05e, %r1, %r9
	setx	0xce46795442a8bb97, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c9328bf8d6, %r1, %r9
	setx	0xcec717d9e0b9a6b3, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000dbb14fc754, %r1, %r9
	setx	0x003f144eda7f67e3, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e81536efea, %r1, %r9
	setx	0xc195fc406e902fd2, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f6f499e7ec, %r1, %r9
	setx	0xc997d250b2148525, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800eb43dfc, %r1, %r9
	setx	0xfed88594b8e8755e, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800fcdb1bc, %r1, %r9
	setx	0x5a211d95905bc3d1, %r1, %r10
	stw	%r10, [%r9]
	setx	0x0000001080100000, %r1, %r9
	setx	0x5a211d95905bc3d1, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ced1588b38, %r1, %r9
	setx	0xe67e2102cee5fd24, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000ddd40382f0, %r1, %r9
	setx	0xf8d628ea08db98af, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000ed405200c8, %r1, %r9
	setx	0x873a951422d23acc, %r1, %r10
	stw	%r10, [%r9]
	setx	0x0000001010100000, %r1, %r9
	setx	0x873a951422d23acc, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f7ccb8ba18, %r1, %r9
	setx	0x94a9effb2c1177bc, %r1, %r10
	stw	%r10, [%r9]
	setx	0x0000001000100000, %r1, %r9
	setx	0x94a9effb2c1177bc, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800e3833b8, %r1, %r9
	setx	0x6e9ee168e4f25183, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f431168, %r1, %r9
	setx	0xc4d79fe11bf71657, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c384a67018, %r1, %r9
	setx	0xa3f4b1a9b6c66ac2, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d3d0a3a840, %r1, %r9
	setx	0x34ee893616baafcb, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ec5df0a930, %r1, %r9
	setx	0xccd91607e4790924, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f6fa4350b8, %r1, %r9
	setx	0xa76777d5899664bd, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000807d72f251, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000fb7c55880d, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000d6fc1fd01e, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000cee10a8664, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800ff19c90, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e0b1854, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000f5a1b502a6, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800eca7250, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000fba4bcb118, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000e660fbfa2c, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000dbf93e96d8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000cf9b42079c, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000f6fa4350b8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000e3f2ae8f58, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000805fe83d76, %r1, %r9
	setx	0xca2e64a0512bfdf3, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800ec7f17e, %r1, %r9
	setx	0xd0279849acc28fd2, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800fea5de3, %r1, %r9
	setx	0x6661923fafb4edc6, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000cc3646509c, %r1, %r9
	setx	0xb16c4c22c8f978d2, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d2eb55af0f, %r1, %r9
	setx	0xbf6dafec001e9529, %r1, %r10
	stb	%r10, [%r9]
	setx	0x00000010f0100000, %r1, %r9
	setx	0xbf6dafec001e9529, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e176537b68, %r1, %r9
	setx	0x20b9f5f7545a3183, %r1, %r10
	stb	%r10, [%r9]
	setx	0x0000001010100000, %r1, %r9
	setx	0x20b9f5f7545a3183, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f3da259f37, %r1, %r9
	setx	0xecfb954d1dbecec2, %r1, %r10
	stb	%r10, [%r9]
	setx	0x00000010a0100000, %r1, %r9
	setx	0xecfb954d1dbecec2, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800ec407d8, %r1, %r9
	setx	0x6426fd475d2ac6c1, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f65ee38, %r1, %r9
	setx	0xd51b3f5b424eedf4, %r1, %r10
	sth	%r10, [%r9]
	setx	0x0000001030100000, %r1, %r9
	setx	0xd51b3f5b424eedf4, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000c1da34867a, %r1, %r9
	setx	0x8eef2d774cf0a723, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000ddf164ee32, %r1, %r9
	setx	0x2e39508f54bd10b1, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000ed692ef0d6, %r1, %r9
	setx	0x4190fcf327f78f6c, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f4377d5d28, %r1, %r9
	setx	0x7e78b722649a0712, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e356530, %r1, %r9
	setx	0x9d5c555d91a48b6f, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f220f60, %r1, %r9
	setx	0xbbd734aee23677c7, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c95320797c, %r1, %r9
	setx	0xb2213083fab5b768, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d8dc367a94, %r1, %r9
	setx	0xb6175e6846062190, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e9fa4efa58, %r1, %r9
	setx	0x98a0bd4dc4783e63, %r1, %r10
	stw	%r10, [%r9]
	setx	0x0000001000100000, %r1, %r9
	setx	0x98a0bd4dc4783e63, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000fd8b8a1b44, %r1, %r9
	setx	0x1b83f332f61b1963, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800ea92350, %r1, %r9
	setx	0x7c7b4f8864062408, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f5f5e48, %r1, %r9
	setx	0xf9aaaf8d2d528560, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c4bc3beda8, %r1, %r9
	setx	0x47434c787b92259c, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d150d4b820, %r1, %r9
	setx	0x3e1caaf0594bbc9b, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ecb2cdc0a8, %r1, %r9
	setx	0xfdbb4b2f2f46475e, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f6fa4350b8, %r1, %r9
	setx	0x03d15848cb7592c2, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f99ea7aa40, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000e220c571ac, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000d64503d2b5, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000c4ae1368a1, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800fc64d94, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800e764623, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000f263d30f3e, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000ed064d3a48, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d40a69c4b0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800fb05e4c, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800ede75e4, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000fc6ed54c04, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800fd48488, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800eb40a18, %r1, %r12
	ldx	[%r12], %r11
	setx	0x0000008016b1b424, %r1, %r9
	setx	0x9d4a2d3d9ec2c235, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e82fbb9, %r1, %r9
	setx	0x4f4fbd0602958f82, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f53c4cb, %r1, %r9
	setx	0xcd2b1cfaed5b6814, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c640252ff5, %r1, %r9
	setx	0xdf6a7bbf5ae62b43, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000dba3d1cae4, %r1, %r9
	setx	0x2f6a7be2ecbb81f3, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000eacd9ae198, %r1, %r9
	setx	0xdcf599a1ffcce711, %r1, %r10
	stb	%r10, [%r9]
	setx	0x00000010c0100000, %r1, %r9
	setx	0xdcf599a1ffcce711, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000fd8905ec2b, %r1, %r9
	setx	0xd396ce21bdd995f6, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e16276a, %r1, %r9
	setx	0x489418be460899c9, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800fb2439e, %r1, %r9
	setx	0xf9f8b578ec60d4f1, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000cc8ef751c2, %r1, %r9
	setx	0xf4848d22314ed6f9, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d48e3e91bc, %r1, %r9
	setx	0xf478884f5f491ca1, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000efeb899026, %r1, %r9
	setx	0x075084c008be88ac, %r1, %r10
	sth	%r10, [%r9]
	setx	0x0000001030100000, %r1, %r9
	setx	0x075084c008be88ac, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000fce9f6aab8, %r1, %r9
	setx	0xf9f4b10208882586, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e4f19e8, %r1, %r9
	setx	0x007fc9da11f51c97, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f491634, %r1, %r9
	setx	0x8507de8170cdc2c7, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c8e5d59ffc, %r1, %r9
	setx	0xe7e74b51571e4db3, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000db1e169cd0, %r1, %r9
	setx	0xad334b04e9228570, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000ee40545a74, %r1, %r9
	setx	0xfa70fa609114cc4b, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f186be3320, %r1, %r9
	setx	0xb928e0f966a8675d, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800ed11a20, %r1, %r9
	setx	0xea2630b499f32d26, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800fa28150, %r1, %r9
	setx	0xc69831cbd92f6a22, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000001090100000, %r1, %r9
	setx	0xc69831cbd92f6a22, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000c4d13e5970, %r1, %r9
	setx	0x042643d288bb23c4, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d3a95143f0, %r1, %r9
	setx	0x12bcad06ba51a9d5, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ebe2e49ea8, %r1, %r9
	setx	0x65219d3e086fb80f, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f6fa4350b8, %r1, %r9
	setx	0x4f3817486f674b73, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000fcee44dfc4, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000e1033465ce, %r1, %r12
	ldub	[%r12], %r11
	setx	0x0000001040100000, %r1, %r9
	setx	0x4f3817486f674b73, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000de89532bab, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000cb243fabdd, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000e5cf4139e8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000dd7deaa096, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000c33a64992c, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800f68f9f0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800ec0fe12, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000f4bca5840e, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e2beef4, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000f2facedb54, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000e1b9815bc4, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000d9d0801f84, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000cfc4d13f30, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800fce96c4, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800e822328, %r1, %r12
	lduw	[%r12], %r11
	setx	0x0000008038cdbeab, %r1, %r9
	setx	0x2a56046388f6fac1, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e6818ce, %r1, %r9
	setx	0x9125439a848cab10, %r1, %r10
	stb	%r10, [%r9]
	setx	0x00000010f0100000, %r1, %r9
	setx	0x9125439a848cab10, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800f78b82a, %r1, %r9
	setx	0x4788b4980b0a30bb, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c10adfbe21, %r1, %r9
	setx	0x62ee3765f6522b09, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000dd0288eaed, %r1, %r9
	setx	0xd2ba2461f5d3152b, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000eb62992bad, %r1, %r9
	setx	0xc0858bf687f3efec, %r1, %r10
	stb	%r10, [%r9]
	setx	0x00000010b0100000, %r1, %r9
	setx	0xc0858bf687f3efec, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000f00a745292, %r1, %r9
	setx	0x457ddaddd9f02f2a, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e1d4b64, %r1, %r9
	setx	0xd12f0b8307e0825c, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f216532, %r1, %r9
	setx	0x2d35019abe4c7986, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000cbd5139144, %r1, %r9
	setx	0xff6d4f98602dd074, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d67ef11416, %r1, %r9
	setx	0x76e24ef546ca8f71, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e95c669816, %r1, %r9
	setx	0x52e0f7ceac9c385f, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000fecb9c273c, %r1, %r9
	setx	0x4e2f33aa26f694be, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e0fecd4, %r1, %r9
	setx	0x52104ac1601778a2, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f1b27e0, %r1, %r9
	setx	0xfdd8785c33bfcf5a, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c310a284bc, %r1, %r9
	setx	0xc794e39730fc9422, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d6e887fce0, %r1, %r9
	setx	0xddbc7232827fb4df, %r1, %r10
	stw	%r10, [%r9]
	setx	0x00000010c0100000, %r1, %r9
	setx	0xddbc7232827fb4df, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ef74e91414, %r1, %r9
	setx	0x3bf90276a2b3e83c, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f557a0f3c8, %r1, %r9
	setx	0x3e1538adcf1007a1, %r1, %r10
	stw	%r10, [%r9]
	setx	0x0000001030100000, %r1, %r9
	setx	0x3e1538adcf1007a1, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800ea76128, %r1, %r9
	setx	0x1da761117a65fa41, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f840180, %r1, %r9
	setx	0xcce70f60592effa5, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c200113618, %r1, %r9
	setx	0x5fc2b2c93cd1ab51, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d0f11204e0, %r1, %r9
	setx	0xdb530367ea0f00c0, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e8c8c25088, %r1, %r9
	setx	0xca0d16acc4143692, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f6fa4350b8, %r1, %r9
	setx	0xb2cb7a73ce08944f, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f508a4f, %r1, %r12
	ldub	[%r12], %r11
	setx	0x00000010b0100000, %r1, %r9
	setx	0xb2cb7a73ce08944f, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800e5335a0, %r1, %r12
	ldub	[%r12], %r11
	setx	0x0000008073f8cb9b, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000f722a992b7, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000edf55053bf, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000e5f357be70, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000dbe018b8de, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000da2c6de520, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000809b0d27e8, %r1, %r9
	setx	0x6ed6ab2ce587c416, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800ef61a1a, %r1, %r9
	setx	0xafb52b0cfeb0f632, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f2206c4, %r1, %r9
	setx	0xd92abedfdc8ba101, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c829625d76, %r1, %r9
	setx	0x3810e20fefc886b6, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d9f97c41a6, %r1, %r9
	setx	0x6ae45b58e8d2d5f4, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e7a458700f, %r1, %r9
	setx	0x89cac8af4ed527ae, %r1, %r10
	stb	%r10, [%r9]
	setx	0x0000001030100000, %r1, %r9
	setx	0x89cac8af4ed527ae, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000fabc940e57, %r1, %r9
	setx	0x3bf0ce8713756e32, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800eb59748, %r1, %r9
	setx	0xf6eb2811571f80f6, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f5dcc50, %r1, %r9
	setx	0x3ed42abcc9f8bbdb, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c4348b979c, %r1, %r9
	setx	0xba4710d4033bb8ad, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d6eb21fdd6, %r1, %r9
	setx	0x091c7d7062430e1a, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000ebfc966826, %r1, %r9
	setx	0xfb71d85658ab680e, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f194cc2956, %r1, %r9
	setx	0x9274138e97241d7d, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800ee098a0, %r1, %r9
	setx	0xc076debecf8b130c, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800fba64d8, %r1, %r9
	setx	0x18c6c76852f1d00c, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c9dc4a8a20, %r1, %r9
	setx	0x9752943f25fb7c2a, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d05b2adab8, %r1, %r9
	setx	0x66a312881110fab9, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e6c76a09f4, %r1, %r9
	setx	0x96de36745a120fd0, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f1e86d31b4, %r1, %r9
	setx	0x5ed4d67f60cadc24, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800edbac78, %r1, %r9
	setx	0xf857c24ccf253e5b, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800ffee348, %r1, %r9
	setx	0x97fc51c4afb309f8, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c0d43a62b0, %r1, %r9
	setx	0xe921395630e59aeb, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000001030100000, %r1, %r9
	setx	0xe921395630e59aeb, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000dcbfc02150, %r1, %r9
	setx	0x3f95d1c49bbd2c94, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000001000100000, %r1, %r9
	setx	0x3f95d1c49bbd2c94, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e585d12620, %r1, %r9
	setx	0x52dd801c7bebc95c, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f6fa4350b8, %r1, %r9
	setx	0x816c1458a67f3d65, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d465331ede, %r1, %r12
	ldub	[%r12], %r11
	setx	0x00000010e0100000, %r1, %r9
	setx	0x816c1458a67f3d65, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c50c70befb, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800fd41965, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800e9e3739, %r1, %r12
	ldub	[%r12], %r11
	setx	0x00000010c0100000, %r1, %r9
	setx	0x816c1458a67f3d65, %r1, %r10
	ldx	[%r9], %r10
	setx	0x00000080c3e32390, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000fd5992b829, %r1, %r12
	ldub	[%r12], %r11
	setx	0x0000001080100000, %r1, %r9
	setx	0x816c1458a67f3d65, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e6b3a65899, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000e082076850, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800fdbd050, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800ec9ec48, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000804039e14b, %r1, %r9
	setx	0xc955e49951a3225a, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e3d6a93, %r1, %r9
	setx	0x542e43b183beefe3, %r1, %r10
	stb	%r10, [%r9]
	setx	0x00000010d0100000, %r1, %r9
	setx	0x542e43b183beefe3, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800ffb3ccb, %r1, %r9
	setx	0x34c856b5b51a1296, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c872ab9e53, %r1, %r9
	setx	0xa27f29184016b80c, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d1ad47de48, %r1, %r9
	setx	0xbf87a234c4aa33de, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e31bf4e1d7, %r1, %r9
	setx	0x870fc708a1cc1ff8, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f00f8b3874, %r1, %r9
	setx	0x0f034eb1b2affd10, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800ec8368c, %r1, %r9
	setx	0x1236482ff7dd0e04, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800ff6ca5e, %r1, %r9
	setx	0xbeaca75783b54841, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000ccbf552afe, %r1, %r9
	setx	0xd96cc68192800c28, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000dc5070968a, %r1, %r9
	setx	0x444031b02683a316, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e9cd62e828, %r1, %r9
	setx	0xa00920da94df314b, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000fcbe146e84, %r1, %r9
	setx	0x48c8e8e7430f0aa2, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800ec167e4, %r1, %r9
	setx	0x0b412765752d153d, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f1ce728, %r1, %r9
	setx	0x5de490fa7578b98a, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c30355ecac, %r1, %r9
	setx	0xc6c9866f2364f7ae, %r1, %r10
	stw	%r10, [%r9]
	setx	0x0000001080100000, %r1, %r9
	setx	0xc6c9866f2364f7ae, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000d136085fc8, %r1, %r9
	setx	0xb4ad44f1bd75be9c, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e73d32f2a4, %r1, %r9
	setx	0xe4bf7fb926ef215d, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f1c0c0aac4, %r1, %r9
	setx	0xbec1e4160fadfa9a, %r1, %r10
	stw	%r10, [%r9]
	setx	0x0000001040100000, %r1, %r9
	setx	0xbec1e4160fadfa9a, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800e4e8278, %r1, %r9
	setx	0xef9a7de4000673d3, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000001090100000, %r1, %r9
	setx	0xef9a7de4000673d3, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f121cd0, %r1, %r9
	setx	0x59137d7a6fad7cba, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000001090100000, %r1, %r9
	setx	0x59137d7a6fad7cba, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000c929d76320, %r1, %r9
	setx	0x1cf307bff21f60d2, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ddd08d9cb0, %r1, %r9
	setx	0x6a33ef7a97ce1157, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e06c00a528, %r1, %r9
	setx	0x9b22727223a34595, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f6fa4350b8, %r1, %r9
	setx	0xf83244487c61bc64, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c04dcf9e2b, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800f88952c, %r1, %r12
	ldub	[%r12], %r11
	setx	0x0000001070100000, %r1, %r9
	setx	0xf83244487c61bc64, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800e429bf6, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800e634462, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000fce1e36e3c, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000e1244b269e, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d2c4f2bc8e, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000c7d04e7abe, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800faf65be, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e875b0e, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e1053a4, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000f41e234888, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000e576446e3c, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000dfe136b48c, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000e3cd121168, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000dc130eedc0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000c37fc0ea98, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800f280f98, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e875470, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000f6fa4350b8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x0000008067cead23, %r1, %r9
	setx	0x8e6b1b428e3bf11d, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e288ac4, %r1, %r9
	setx	0x054a88935cdb0c56, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f163ed8, %r1, %r9
	setx	0x3d32f63ad40ccbf7, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c14fd1268a, %r1, %r9
	setx	0x22203b509941d33c, %r1, %r10
	stb	%r10, [%r9]
	setx	0x00000010f0100000, %r1, %r9
	setx	0x22203b509941d33c, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000dd5055dec6, %r1, %r9
	setx	0xaa360432d7f21379, %r1, %r10
	stb	%r10, [%r9]
	setx	0x0000001000100000, %r1, %r9
	setx	0xaa360432d7f21379, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000e6be7d9b07, %r1, %r9
	setx	0xaa42d051c00013cf, %r1, %r10
	stb	%r10, [%r9]
	setx	0x00000010e0100000, %r1, %r9
	setx	0xaa42d051c00013cf, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000fa5e502832, %r1, %r9
	setx	0x1b5cf2adf6a7b553, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e77b7ce, %r1, %r9
	setx	0x7ced40c2068871b2, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f28f532, %r1, %r9
	setx	0xf1f2c814eab7345d, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c3a57887da, %r1, %r9
	setx	0x2f1567995cf86d91, %r1, %r10
	sth	%r10, [%r9]
	setx	0x00000010c0100000, %r1, %r9
	setx	0x2f1567995cf86d91, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000da893604e4, %r1, %r9
	setx	0x5de422810685ad11, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e62db5433c, %r1, %r9
	setx	0x5fd2cbb09daf3002, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f38f495ede, %r1, %r9
	setx	0x968ac1e0f6c12cf9, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e67cfd4, %r1, %r9
	setx	0x3c5d4c5c25b03e0c, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f045138, %r1, %r9
	setx	0xcac71938a8202a05, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c702029d1c, %r1, %r9
	setx	0x30878e6d84501d86, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d9cf7b2d74, %r1, %r9
	setx	0xabb243d3c36e2af8, %r1, %r10
	stw	%r10, [%r9]
	setx	0x00000010b0100000, %r1, %r9
	setx	0xabb243d3c36e2af8, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000e8d5b41df4, %r1, %r9
	setx	0xca0bb67860079872, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f19bc113a0, %r1, %r9
	setx	0x072f5625e32e361f, %r1, %r10
	stw	%r10, [%r9]
	setx	0x0000001050100000, %r1, %r9
	setx	0x072f5625e32e361f, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800e921880, %r1, %r9
	setx	0x95c0e521c3cdc49f, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800ff49390, %r1, %r9
	setx	0xabe60f69d73cad7e, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c9b9a53068, %r1, %r9
	setx	0xf22abcc012e80d60, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000001010100000, %r1, %r9
	setx	0xf22abcc012e80d60, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d79986ebb8, %r1, %r9
	setx	0xd5e1b47ad238d121, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e89d2a8788, %r1, %r9
	setx	0xc09a0f0263386fb7, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000001060100000, %r1, %r9
	setx	0xc09a0f0263386fb7, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000f6fa4350b8, %r1, %r9
	setx	0xe24ca2225e07db65, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f68b24653d, %r1, %r12
	ldub	[%r12], %r11
	setx	0x00000010a0100000, %r1, %r9
	setx	0xe24ca2225e07db65, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e89ef7b3e5, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000d5867a9a6c, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000c462cfbfb0, %r1, %r12
	ldub	[%r12], %r11
	setx	0x00000010d0100000, %r1, %r9
	setx	0xe24ca2225e07db65, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800fc3dd75, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800e8e6410, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000e368ffff8a, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000dd9f08cbb8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000ce34bd5c1c, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800ecd95ec, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000fc5bcb6aa0, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000e23e14d5f8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x0000008095e18d2e, %r1, %r9
	setx	0x72095a4e243c2d7d, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800ed76da3, %r1, %r9
	setx	0xd25a8dbdffc34ba8, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f48bf17, %r1, %r9
	setx	0xe782c0b632d39faf, %r1, %r10
	stb	%r10, [%r9]
	setx	0x00000010f0100000, %r1, %r9
	setx	0xe782c0b632d39faf, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ce7b043071, %r1, %r9
	setx	0x2c006630cfe00290, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d27a9df578, %r1, %r9
	setx	0x77df95a3bb5471b1, %r1, %r10
	stb	%r10, [%r9]
	setx	0x0000001080100000, %r1, %r9
	setx	0x77df95a3bb5471b1, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e168492d00, %r1, %r9
	setx	0x1451e90cc8901161, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f247066978, %r1, %r9
	setx	0x108727bcdd4c3ecd, %r1, %r10
	stb	%r10, [%r9]
	setx	0x0000001090100000, %r1, %r9
	setx	0x108727bcdd4c3ecd, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800eb917d6, %r1, %r9
	setx	0x2167db93eae85cdc, %r1, %r10
	sth	%r10, [%r9]
	setx	0x00000010e0100000, %r1, %r9
	setx	0x2167db93eae85cdc, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800fe6265e, %r1, %r9
	setx	0x8b8fc5052cfd0fdf, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000cfc8fc8ee2, %r1, %r9
	setx	0xa965e1d9492e20ee, %r1, %r10
	sth	%r10, [%r9]
	setx	0x0000001000100000, %r1, %r9
	setx	0xa965e1d9492e20ee, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d1ba126266, %r1, %r9
	setx	0xffc2ced34d52bbe6, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e4a22a5ed4, %r1, %r9
	setx	0x7c9b6e53d3093774, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000fd44e01a32, %r1, %r9
	setx	0x9e67647e1b568bb4, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e7b0fbc, %r1, %r9
	setx	0x8e2a8dce32354b8e, %r1, %r10
	stw	%r10, [%r9]
	setx	0x0000001060100000, %r1, %r9
	setx	0x8e2a8dce32354b8e, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800feb5428, %r1, %r9
	setx	0x1fc9aff9b0336da1, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c59b6bac20, %r1, %r9
	setx	0x1dbfddf31f7b5ced, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d0d56c4c14, %r1, %r9
	setx	0xa368c6ab70e2697f, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000ef223010fc, %r1, %r9
	setx	0xa1dd843b82ec9a79, %r1, %r10
	stw	%r10, [%r9]
	setx	0x0000001090100000, %r1, %r9
	setx	0xa1dd843b82ec9a79, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f6105726b4, %r1, %r9
	setx	0x79f9b835ea83a6de, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800eb1ae08, %r1, %r9
	setx	0x74ef008dfd5d5653, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800fc9ea70, %r1, %r9
	setx	0xf2f052ed2056113e, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c725cc7898, %r1, %r9
	setx	0x9dac1ea77a3bf8c7, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000001040100000, %r1, %r9
	setx	0x9dac1ea77a3bf8c7, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d2a116ae58, %r1, %r9
	setx	0x1bfe57773c8384c7, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ea5fdf9fb0, %r1, %r9
	setx	0xc13a9282f2ef90f0, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000001090100000, %r1, %r9
	setx	0xc13a9282f2ef90f0, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f6fa4350b8, %r1, %r9
	setx	0x3162f6919c637d1b, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f13bc4c, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d127547cb8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000c38062ad40, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800f8a3458, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e6df358, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000f6fa4350b8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000eeb1187e68, %r1, %r12
	ldx	[%r12], %r11
	setx	0x00000080d42f800c, %r1, %r9
	setx	0xde8e6aab05b9245f, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e9931a9, %r1, %r9
	setx	0xafeefd625832a41c, %r1, %r10
	stb	%r10, [%r9]
	setx	0x00000010d0100000, %r1, %r9
	setx	0xafeefd625832a41c, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800f2c1eee, %r1, %r9
	setx	0xf3c4b5667c5181e6, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c6ed563b24, %r1, %r9
	setx	0xee387afa1c98ee48, %r1, %r10
	stb	%r10, [%r9]
	setx	0x0000001030100000, %r1, %r9
	setx	0xee387afa1c98ee48, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000d11da7a00a, %r1, %r9
	setx	0xbf19b133c971ae0a, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ea23e21246, %r1, %r9
	setx	0x673bc8585148f7d8, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f1d8362092, %r1, %r9
	setx	0xaa3fa16eb2fbff55, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e4e1cb2, %r1, %r9
	setx	0xbbe059091ff1ef24, %r1, %r10
	sth	%r10, [%r9]
	setx	0x0000001050100000, %r1, %r9
	setx	0xbbe059091ff1ef24, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f3d64bc, %r1, %r9
	setx	0x4b582cb600cffa80, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000cd0d42f770, %r1, %r9
	setx	0xfd7971272ea1833f, %r1, %r10
	sth	%r10, [%r9]
	setx	0x0000001000100000, %r1, %r9
	setx	0xfd7971272ea1833f, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000d4af9f6864, %r1, %r9
	setx	0xd0b3483d5c7782ec, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e9f1630a40, %r1, %r9
	setx	0xb843a68774458f79, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f5b53f26c6, %r1, %r9
	setx	0x95b468eea0cdebb1, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800eb08c20, %r1, %r9
	setx	0xa05598633f4a163f, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800feeefe4, %r1, %r9
	setx	0x895ee08dc29cbac9, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000cc28d00554, %r1, %r9
	setx	0xd9cdf0702b286d26, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d0f2c8c1a0, %r1, %r9
	setx	0x46f2a36e35e4b94c, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e7ea4dfa5c, %r1, %r9
	setx	0x6b161a42f2af4a57, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f5924328d4, %r1, %r9
	setx	0x061e5dd6080a07f2, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e96aa10, %r1, %r9
	setx	0xf095c8d49e1513f8, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000001090100000, %r1, %r9
	setx	0xf095c8d49e1513f8, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f60ba88, %r1, %r9
	setx	0xaa6ad50e04d80b13, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000001000100000, %r1, %r9
	setx	0xaa6ad50e04d80b13, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000c1b64d90c8, %r1, %r9
	setx	0xd91975b164da4889, %r1, %r10
	stx	%r10, [%r9]
	setx	0x00000010e0100000, %r1, %r9
	setx	0xd91975b164da4889, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000dbbeda3718, %r1, %r9
	setx	0x0d26092b9c45602b, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e1da7ea348, %r1, %r9
	setx	0x1befffeb5e0bf9da, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f6fa4350b8, %r1, %r9
	setx	0x8882b0871ad67a41, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000dba3d1cae4, %r1, %r12
	ldub	[%r12], %r11
	setx	0x0000001060100000, %r1, %r9
	setx	0x8882b0871ad67a41, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c640252ff5, %r1, %r12
	ldub	[%r12], %r11
	setx	0x00000010a0100000, %r1, %r9
	setx	0x8882b0871ad67a41, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800f53c4cb, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800e82fbb9, %r1, %r12
	ldub	[%r12], %r11
	setx	0x0000008016b1b424, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000f3da259f37, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000e176537b68, %r1, %r12
	ldub	[%r12], %r11
	setx	0x00000010b0100000, %r1, %r9
	setx	0x8882b0871ad67a41, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000cce286a590, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800f5ec604, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800ea2a828, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000f6fa4350b8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000e83458b110, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000d6af529260, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000cbad342658, %r1, %r12
	ldx	[%r12], %r11
	setx	0x00000080e5fd2bda, %r1, %r9
	setx	0x9756be4e7eb01a2b, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e6e4532, %r1, %r9
	setx	0x8c1cd55a9f0fe675, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f7861d4, %r1, %r9
	setx	0x51d6634eb3a266b7, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c25e4475fe, %r1, %r9
	setx	0x161eef522e048e65, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d79aa3e637, %r1, %r9
	setx	0x26bd0edce19b64ca, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e6fda0e411, %r1, %r9
	setx	0x8507ee61ec6be1bf, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000fbebc29404, %r1, %r9
	setx	0xc7f5f6ad686f914e, %r1, %r10
	stb	%r10, [%r9]
	setx	0x0000001080100000, %r1, %r9
	setx	0xc7f5f6ad686f914e, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800eec5ef6, %r1, %r9
	setx	0x73ba7c8b6198fdbc, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f5a15f4, %r1, %r9
	setx	0x2142afe50b493dad, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c958087872, %r1, %r9
	setx	0x67976524918b4701, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d5ed29d4fe, %r1, %r9
	setx	0xdfbee46b801fb2c3, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000ef2ef160e6, %r1, %r9
	setx	0x04999bb6d464fc79, %r1, %r10
	sth	%r10, [%r9]
	setx	0x00000010a0100000, %r1, %r9
	setx	0x04999bb6d464fc79, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000faac56e2c8, %r1, %r9
	setx	0x2a1af074b5c2c321, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e84911c, %r1, %r9
	setx	0x2bafe6ed1413e852, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f02e0a8, %r1, %r9
	setx	0x7368c41249f92f1a, %r1, %r10
	stw	%r10, [%r9]
	setx	0x0000001090100000, %r1, %r9
	setx	0x7368c41249f92f1a, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000c06730b6dc, %r1, %r9
	setx	0xbea164e9bc5e5a72, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000dde684a4c4, %r1, %r9
	setx	0x08fe925d77b2bc54, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e233da6dec, %r1, %r9
	setx	0xe37f0d039536f238, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f83cae6350, %r1, %r9
	setx	0xf4a9ba880837b3a6, %r1, %r10
	stw	%r10, [%r9]
	setx	0x00000010a0100000, %r1, %r9
	setx	0xf4a9ba880837b3a6, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800ea2b7a0, %r1, %r9
	setx	0x8015eddf00bb53d7, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000001010100000, %r1, %r9
	setx	0x8015eddf00bb53d7, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800f500bd8, %r1, %r9
	setx	0xf9adabe64eb03431, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000001010100000, %r1, %r9
	setx	0xf9adabe64eb03431, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000c6d2c21a00, %r1, %r9
	setx	0x8fe1f775e8ca45e4, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000dbdbb0cd38, %r1, %r9
	setx	0xcb52ef8572ddfa84, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e59e862c18, %r1, %r9
	setx	0xd82ba95167f26693, %r1, %r10
	stx	%r10, [%r9]
	setx	0x00000010e0100000, %r1, %r9
	setx	0xd82ba95167f26693, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f6fa4350b8, %r1, %r9
	setx	0x0d390e4c12fa0df7, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000001000100000, %r1, %r9
	setx	0x0d390e4c12fa0df7, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000eaa18b218b, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000ddb8ea78f6, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000eafe296e90, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d6b8d36f9e, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000cc64b1248c, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000def02ed5e4, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000c549162624, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800fa386a8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800ef18364, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000f84b871280, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000e975be9048, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000d16f2c24a8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000c28d411540, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800f231e30, %r1, %r12
	ldx	[%r12], %r11
	setx	0x00000080fa1d8820, %r1, %r9
	setx	0xebcca53559108fe2, %r1, %r10
	stb	%r10, [%r9]
	setx	0x0000001080100000, %r1, %r9
	setx	0xebcca53559108fe2, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800e2b2572, %r1, %r9
	setx	0x40dcfdb9698a81ad, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f1c7afd, %r1, %r9
	setx	0x1aa4aac53b7e5f95, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c39a58d69b, %r1, %r9
	setx	0x14c6cdbe2f4e2f22, %r1, %r10
	stb	%r10, [%r9]
	setx	0x0000001070100000, %r1, %r9
	setx	0x14c6cdbe2f4e2f22, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000dc213d7f1d, %r1, %r9
	setx	0xc560be22916f4c38, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ee16bc4ad4, %r1, %r9
	setx	0x4754b5ef59b63d3a, %r1, %r10
	stb	%r10, [%r9]
	setx	0x0000001070100000, %r1, %r9
	setx	0x4754b5ef59b63d3a, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f2755e72a6, %r1, %r9
	setx	0x5732e23d38af2050, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800ea85464, %r1, %r9
	setx	0x71e880f0ac9ad0aa, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800fc9b7de, %r1, %r9
	setx	0x895990a800ccb648, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c79658f68a, %r1, %r9
	setx	0x0e5d6f042a8d3619, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d228d2dbd8, %r1, %r9
	setx	0xa80dc9680bf6de96, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e8c2e73588, %r1, %r9
	setx	0x2668c669ac1d346c, %r1, %r10
	sth	%r10, [%r9]
	setx	0x00000010f0100000, %r1, %r9
	setx	0x2668c669ac1d346c, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f13cc2223c, %r1, %r9
	setx	0xf165ad144a5da420, %r1, %r10
	sth	%r10, [%r9]
	setx	0x0000001070100000, %r1, %r9
	setx	0xf165ad144a5da420, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800ec7bef8, %r1, %r9
	setx	0x06fdee088dab6943, %r1, %r10
	stw	%r10, [%r9]
	setx	0x00000010c0100000, %r1, %r9
	setx	0x06fdee088dab6943, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800fa7938c, %r1, %r9
	setx	0x16d3a4dd3f93678a, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000cd51327fc0, %r1, %r9
	setx	0xadced7c30630e32c, %r1, %r10
	stw	%r10, [%r9]
	setx	0x0000001090100000, %r1, %r9
	setx	0xadced7c30630e32c, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000defdda803c, %r1, %r9
	setx	0xb3159e10e6b76049, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000edf05905f0, %r1, %r9
	setx	0xa26dcf01f4bceddd, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f91cc33590, %r1, %r9
	setx	0x884fc4aee2139267, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800ead2cc0, %r1, %r9
	setx	0xf304bae875f07b42, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000001070100000, %r1, %r9
	setx	0xf304bae875f07b42, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800f776578, %r1, %r9
	setx	0x87bb5b7a621a8d05, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c15d820510, %r1, %r9
	setx	0x67f9323106b27726, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d949536b60, %r1, %r9
	setx	0x6ea9db233104b93f, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ea6c79b3a0, %r1, %r9
	setx	0x269824d28c2e2060, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f6fa4350b8, %r1, %r9
	setx	0xca3c234e3e12050c, %r1, %r10
	stx	%r10, [%r9]
	setx	0x00000010c0100000, %r1, %r9
	setx	0xca3c234e3e12050c, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800e18e790, %r1, %r12
	ldub	[%r12], %r11
	setx	0x0000008011bfab1a, %r1, %r12
	ldub	[%r12], %r11
	setx	0x00000010b0100000, %r1, %r9
	setx	0xca3c234e3e12050c, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000f2ca0e799b, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000eddb7fe374, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000d6bbc6bed1, %r1, %r12
	ldub	[%r12], %r11
	setx	0x00000010b0100000, %r1, %r9
	setx	0xca3c234e3e12050c, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800e0b6902, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000f7f7a17536, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d758e41f24, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000cb2ec2d574, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800fa476d0, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000d4e097c490, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000cc11147438, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800f8254f0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e14b6f0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000f6fa4350b8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000e7365d6368, %r1, %r12
	ldx	[%r12], %r11
	setx	0x00000080960c39ef, %r1, %r9
	setx	0x172e5e1fb042c54d, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e2fd00d, %r1, %r9
	setx	0x086d1051b69964b1, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f54e02f, %r1, %r9
	setx	0x6cc9761ad67aadad, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000cff91b8ae2, %r1, %r9
	setx	0x22ac52beda8ccdb2, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000dd5af09642, %r1, %r9
	setx	0x6c70c0e86154f583, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e7a53e6c42, %r1, %r9
	setx	0xbed414a0e449a050, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f3a43fca70, %r1, %r9
	setx	0x41048c9c987f96fc, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800ee2b0c4, %r1, %r9
	setx	0x288bd2416ecaf0f1, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f3b1db4, %r1, %r9
	setx	0xa482a9d542d901aa, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c0c943e974, %r1, %r9
	setx	0xc732162f75cc84fe, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d4356793a2, %r1, %r9
	setx	0x8773795720986418, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000ea20b4f11e, %r1, %r9
	setx	0x2f7f5efef6e3afa3, %r1, %r10
	sth	%r10, [%r9]
	setx	0x0000001050100000, %r1, %r9
	setx	0x2f7f5efef6e3afa3, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f3e340ee3c, %r1, %r9
	setx	0x201ffa3ebe50cfb3, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e20d820, %r1, %r9
	setx	0x3046e839bbedc242, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f5f4e74, %r1, %r9
	setx	0xc26340c26d0a9ce1, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c46125d41c, %r1, %r9
	setx	0x82f666bde6aeb4e5, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d9f075e2e8, %r1, %r9
	setx	0x4013865c9334b50b, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e25597ff04, %r1, %r9
	setx	0x85470a3eb9edd194, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f13ef8fc74, %r1, %r9
	setx	0xe3ce3975911d6998, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800eecd180, %r1, %r9
	setx	0x32e4e700676e0288, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000001000100000, %r1, %r9
	setx	0x32e4e700676e0288, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800f583040, %r1, %r9
	setx	0x4be479814ca3ad94, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000001020100000, %r1, %r9
	setx	0x4be479814ca3ad94, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000cfaa848a70, %r1, %r9
	setx	0x1cbdd5eddcd196f7, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000001050100000, %r1, %r9
	setx	0x1cbdd5eddcd196f7, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000d4a622ce30, %r1, %r9
	setx	0xb82fe997c39d499b, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000001080100000, %r1, %r9
	setx	0xb82fe997c39d499b, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e4c5a99850, %r1, %r9
	setx	0xfe4466d576ac7f2f, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f6fa4350b8, %r1, %r9
	setx	0x2fc54e55c11c8056, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000001020100000, %r1, %r9
	setx	0x2fc54e55c11c8056, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000e07c44a5e0, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000dd39e08a4e, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000c41c1799db, %r1, %r12
	ldub	[%r12], %r11
	setx	0x0000001010100000, %r1, %r9
	setx	0x2fc54e55c11c8056, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800fa4b827, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000e4f8afa3a6, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d2f4544c9e, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000c6144e11c4, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800ff6828a, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e0259ec, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800fe15430, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800e2496d0, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000f8950ffee0, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000e24b237974, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000ddcb1aa530, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000c275bce700, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800f551238, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800eb1a180, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000f6fa4350b8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000e38e140930, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000d4e2d4f998, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000801e7aab9c, %r1, %r9
	setx	0x70de6758ac554547, %r1, %r10
	stb	%r10, [%r9]
	setx	0x00000010d0100000, %r1, %r9
	setx	0x70de6758ac554547, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800e481f5c, %r1, %r9
	setx	0xddb7e1614a87f9bb, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f35fc67, %r1, %r9
	setx	0xcad43986ee0b107b, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000cea17977ca, %r1, %r9
	setx	0xb6258a40a3fa719c, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d7f646b7a3, %r1, %r9
	setx	0xcc9822ec6096d556, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e7cca55a58, %r1, %r9
	setx	0x126d7fb7ba416bf7, %r1, %r10
	stb	%r10, [%r9]
	setx	0x0000001010100000, %r1, %r9
	setx	0x126d7fb7ba416bf7, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f202b0fae1, %r1, %r9
	setx	0xffbce00aa344fb86, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e1943ca, %r1, %r9
	setx	0x3bb6e0e6fb22fb73, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f0a9ed4, %r1, %r9
	setx	0xa607f6e5cafedd6b, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c34410ca38, %r1, %r9
	setx	0xf1b5337e91ead965, %r1, %r10
	sth	%r10, [%r9]
	setx	0x00000010b0100000, %r1, %r9
	setx	0xf1b5337e91ead965, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d39b9672ec, %r1, %r9
	setx	0x072b3b62a3bf8ac2, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000efa3d9d324, %r1, %r9
	setx	0x7b5c5089467fe57c, %r1, %r10
	sth	%r10, [%r9]
	setx	0x00000010b0100000, %r1, %r9
	setx	0x7b5c5089467fe57c, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000f4f44dba5e, %r1, %r9
	setx	0xf75916a4561f9d4b, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800ebbe688, %r1, %r9
	setx	0x4526f146d19edb9f, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800fdfe8e4, %r1, %r9
	setx	0x7181979c35554a8b, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c1e22c0fb0, %r1, %r9
	setx	0x179e7fdb6da117c3, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d705dabc6c, %r1, %r9
	setx	0x46746535bf5738a8, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e5377f78ac, %r1, %r9
	setx	0xf6cb6cfaaec8638d, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f3d3c98dbc, %r1, %r9
	setx	0x4e2c3123bda9a109, %r1, %r10
	stw	%r10, [%r9]
	setx	0x00000010b0100000, %r1, %r9
	setx	0x4e2c3123bda9a109, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800ed75110, %r1, %r9
	setx	0x8da42d15756d2b6a, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f3cdef0, %r1, %r9
	setx	0x5aa7a017bba1c3e3, %r1, %r10
	stx	%r10, [%r9]
	setx	0x00000010f0100000, %r1, %r9
	setx	0x5aa7a017bba1c3e3, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000c85412e190, %r1, %r9
	setx	0x40aa89de8cec7c77, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d235410eb8, %r1, %r9
	setx	0xf0e45074692d3dfa, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000001010100000, %r1, %r9
	setx	0xf0e45074692d3dfa, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000e2d5509318, %r1, %r9
	setx	0xb28b749ff182ecf3, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000001010100000, %r1, %r9
	setx	0xb28b749ff182ecf3, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f6fa4350b8, %r1, %r9
	setx	0x0de9699e875a4df2, %r1, %r10
	stx	%r10, [%r9]
	setx	0x00000010e0100000, %r1, %r9
	setx	0x0de9699e875a4df2, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000dd84ec9250, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000c075cd7305, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000d6e3909e30, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000c00bb972b0, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800fb05e4c, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800ede75e4, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000fc6ed54c04, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000e6c1928534, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000f6fa4350b8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000e61c2144d8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000d4b6b44788, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000c567cfa1c0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800fc8fa98, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800ecfef48, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000f6fa4350b8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000802a89c4ce, %r1, %r9
	setx	0x385130d8f3da6e5e, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e979eac, %r1, %r9
	setx	0x741d2458ca33f042, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f7258b2, %r1, %r9
	setx	0xfc21cc51bc8da45f, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c15cafd468, %r1, %r9
	setx	0xb1cccc6f771b2339, %r1, %r10
	stb	%r10, [%r9]
	setx	0x0000001020100000, %r1, %r9
	setx	0xb1cccc6f771b2339, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d8c0673938, %r1, %r9
	setx	0x904b299f10b86014, %r1, %r10
	stb	%r10, [%r9]
	setx	0x0000001030100000, %r1, %r9
	setx	0x904b299f10b86014, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000e27acfec7b, %r1, %r9
	setx	0x1c95024a6d3f5457, %r1, %r10
	stb	%r10, [%r9]
	setx	0x00000010a0100000, %r1, %r9
	setx	0x1c95024a6d3f5457, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f2e6152629, %r1, %r9
	setx	0x532c7cc1b32a4ebc, %r1, %r10
	stb	%r10, [%r9]
	setx	0x0000001070100000, %r1, %r9
	setx	0x532c7cc1b32a4ebc, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800e0f06f6, %r1, %r9
	setx	0x09d64ffecb9a8044, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800fe80630, %r1, %r9
	setx	0x8859a50532775b29, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000ca8193430c, %r1, %r9
	setx	0xab889d863e52eede, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000db127a5d84, %r1, %r9
	setx	0x01165b1a4545614c, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e9b7667efa, %r1, %r9
	setx	0x6129ef40259449ee, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f0288b4c4c, %r1, %r9
	setx	0x950398772d71efa3, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800ea3a598, %r1, %r9
	setx	0xdec0e294cfe8d224, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f0bb6bc, %r1, %r9
	setx	0x29acb164e53373c2, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c2acf33a60, %r1, %r9
	setx	0x19af7cb73b7cf8f3, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d0859c460c, %r1, %r9
	setx	0x7190190c1b93d736, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e8fabbc1e0, %r1, %r9
	setx	0x2a2fbcf9f06027b2, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000fbfad6d784, %r1, %r9
	setx	0x51f477bbbc71ea6b, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e73bb20, %r1, %r9
	setx	0x29db1387540c2e04, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f106c20, %r1, %r9
	setx	0x81bf88c4ce9b5caf, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c6a613c140, %r1, %r9
	setx	0x834d27090d91b163, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d1c71eee50, %r1, %r9
	setx	0x6a5b2a38a8f54bab, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e27d60d4c0, %r1, %r9
	setx	0x4592b53e9d871f9d, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f6fa4350b8, %r1, %r9
	setx	0x3519d605b11ee6bf, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e18f3de162, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000fb8ae37800, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000e1f4157cb0, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000d4896ebd8c, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000ce85015ba0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800f2d2350, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800ed11600, %r1, %r12
	ldx	[%r12], %r11
	setx	0x0000008028edfe92, %r1, %r9
	setx	0x1dedd8dfe81e2f1e, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e14190c, %r1, %r9
	setx	0x9299fd26af3a3dac, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800ff18ad6, %r1, %r9
	setx	0x8d326ca9ba582f97, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ccf7a9e791, %r1, %r9
	setx	0x636611a94152aa84, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000df2e27d132, %r1, %r9
	setx	0xb3a4aa989d3a882f, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e14f7b4f28, %r1, %r9
	setx	0x96f807c2f98b4d8e, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f4ee7a0745, %r1, %r9
	setx	0x32c6e0e33edb227e, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e10932a, %r1, %r9
	setx	0x249699f65d121b6d, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800fa1eafa, %r1, %r9
	setx	0xbcbe14ffcf0feabb, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000cc438df410, %r1, %r9
	setx	0xb812e8735b0a646d, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000dce94e260c, %r1, %r9
	setx	0x7946f4381cf9b5dc, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000ea9b0aeaee, %r1, %r9
	setx	0x0ad8e7fa430195e0, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f189718988, %r1, %r9
	setx	0x51af5da320f4ba00, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e4c89ac, %r1, %r9
	setx	0xdcd1063d7c726a5d, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800fe2921c, %r1, %r9
	setx	0x39cd0ea6cf07c8eb, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000cc1bd066cc, %r1, %r9
	setx	0xa5e984eaa4f441bd, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d5cecea930, %r1, %r9
	setx	0xb897f1a4f4401c3d, %r1, %r10
	stw	%r10, [%r9]
	setx	0x00000010d0100000, %r1, %r9
	setx	0xb897f1a4f4401c3d, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e96be5852c, %r1, %r9
	setx	0xdd30ebae6f5865d0, %r1, %r10
	stw	%r10, [%r9]
	setx	0x0000001000100000, %r1, %r9
	setx	0xdd30ebae6f5865d0, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000f33e824680, %r1, %r9
	setx	0x9f15a658170a8383, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800ec2d880, %r1, %r9
	setx	0xb54f07986e4501ea, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f818d90, %r1, %r9
	setx	0xb473e9fdf8bafa9a, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000cddf668f20, %r1, %r9
	setx	0x014431a5fd1d9f6b, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000db031870c8, %r1, %r9
	setx	0x6dbaa4ef047bc48e, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000edd8a70810, %r1, %r9
	setx	0xbba3fc1420a468fe, %r1, %r10
	stx	%r10, [%r9]
	setx	0x00000010a0100000, %r1, %r9
	setx	0xbba3fc1420a468fe, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f6fa4350b8, %r1, %r9
	setx	0x1d3ea8fe17e63339, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d465331ede, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000c50c70befb, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800fd41965, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800e9e3739, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800ec117b8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000fad029afa8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000ec88ac13a8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000d451558114, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000f6fa4350b8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000e27d60d4c0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000d1c71eee50, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000c6a613c140, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800f106c20, %r1, %r12
	ldx	[%r12], %r11
	setx	0x00000080e8ef667f, %r1, %r9
	setx	0xd09f7eede02f003c, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e0b6706, %r1, %r9
	setx	0x3f7f3ee6e0c84a81, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f3eeed6, %r1, %r9
	setx	0xfd4297062ca3531c, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c165358647, %r1, %r9
	setx	0x5400ba2ccf871090, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d77816a888, %r1, %r9
	setx	0x4b0c0e14ba1e110f, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000eced30ca0c, %r1, %r9
	setx	0xe10f334703561326, %r1, %r10
	stb	%r10, [%r9]
	setx	0x0000001090100000, %r1, %r9
	setx	0xe10f334703561326, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000fd27ba0f91, %r1, %r9
	setx	0x902137b90ed33988, %r1, %r10
	stb	%r10, [%r9]
	setx	0x00000010e0100000, %r1, %r9
	setx	0x902137b90ed33988, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800e51c866, %r1, %r9
	setx	0xfcebf8c1e7d6f767, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f7fced2, %r1, %r9
	setx	0x33bdc588e6b00380, %r1, %r10
	sth	%r10, [%r9]
	setx	0x0000001020100000, %r1, %r9
	setx	0x33bdc588e6b00380, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c715977d06, %r1, %r9
	setx	0xbbacb0a184059673, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d7af727f3e, %r1, %r9
	setx	0x982a848cfb839d9b, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e16755954c, %r1, %r9
	setx	0x7403b36e7507d4db, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000fa692ee280, %r1, %r9
	setx	0x5476d47004c1eda5, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e919e24, %r1, %r9
	setx	0x3dc48a46af7b343f, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f5c0678, %r1, %r9
	setx	0xf26b16d3ddba4201, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000cce0d086b0, %r1, %r9
	setx	0x49ba62fd86833031, %r1, %r10
	stw	%r10, [%r9]
	setx	0x0000001050100000, %r1, %r9
	setx	0x49ba62fd86833031, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000dae9a94ed4, %r1, %r9
	setx	0x1a14866c9a2d29f3, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e8b270b924, %r1, %r9
	setx	0xdb1c1fb8970b4616, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f43a4082f8, %r1, %r9
	setx	0x720741f6b59d8c63, %r1, %r10
	stw	%r10, [%r9]
	setx	0x00000010e0100000, %r1, %r9
	setx	0x720741f6b59d8c63, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800e8de048, %r1, %r9
	setx	0xed0512607ba5ffc1, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000001010100000, %r1, %r9
	setx	0xed0512607ba5ffc1, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f0daa50, %r1, %r9
	setx	0xe45f0d8f96de73c8, %r1, %r10
	stx	%r10, [%r9]
	setx	0x00000010d0100000, %r1, %r9
	setx	0xe45f0d8f96de73c8, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000cfd4f1ba10, %r1, %r9
	setx	0xd42733f5e762c3c5, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d59bf308f0, %r1, %r9
	setx	0xdbf0d7c3bda84f98, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ee580fedf0, %r1, %r9
	setx	0x9cf0ef63b738b61b, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000001030100000, %r1, %r9
	setx	0x9cf0ef63b738b61b, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f6fa4350b8, %r1, %r9
	setx	0xfe2364be5c551f15, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800e8f87d3, %r1, %r12
	ldub	[%r12], %r11
	setx	0x00000080b96f7c5b, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000fcee44dfc4, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000e1033465ce, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000de89532bab, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000cb243fabdd, %r1, %r12
	ldub	[%r12], %r11
	setx	0x00000010a0100000, %r1, %r9
	setx	0xfe2364be5c551f15, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000df5b74f3e0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000c5414e06ba, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800fd57b28, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e97a560, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000f918b8353a, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000e54b691324, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000dd18ed76ba, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800fb05e4c, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800ede75e4, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800ecd0710, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000f6fa4350b8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x00000080b5b5b5fe, %r1, %r9
	setx	0x7607a2ad6690092b, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800ee90dbf, %r1, %r9
	setx	0xd148a084ab9d6528, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f9dcfb6, %r1, %r9
	setx	0xd6745b6a7cd4e69c, %r1, %r10
	stb	%r10, [%r9]
	setx	0x00000010e0100000, %r1, %r9
	setx	0xd6745b6a7cd4e69c, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ca78f2debc, %r1, %r9
	setx	0x184d2f1ea4343aea, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d669163df6, %r1, %r9
	setx	0xd217f6370f4e603b, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e378abb971, %r1, %r9
	setx	0x2f3d572c1faf4262, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f968e773b6, %r1, %r9
	setx	0x23812721ef6f7767, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800ec85bec, %r1, %r9
	setx	0x3388e4de464a75f5, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f5f3466, %r1, %r9
	setx	0x190d194a03c54877, %r1, %r10
	sth	%r10, [%r9]
	setx	0x00000010b0100000, %r1, %r9
	setx	0x190d194a03c54877, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000cf9883b7b0, %r1, %r9
	setx	0x0ea8d242b6d7ed6c, %r1, %r10
	sth	%r10, [%r9]
	setx	0x00000010e0100000, %r1, %r9
	setx	0x0ea8d242b6d7ed6c, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000dec367aa12, %r1, %r9
	setx	0x04da3b69c3d54391, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e45e61d97a, %r1, %r9
	setx	0x172c88e86910b22c, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f6b8cf1812, %r1, %r9
	setx	0xb1866817063773db, %r1, %r10
	sth	%r10, [%r9]
	setx	0x0000001010100000, %r1, %r9
	setx	0xb1866817063773db, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800e901ffc, %r1, %r9
	setx	0x974a1ce35ad1bbbf, %r1, %r10
	stw	%r10, [%r9]
	setx	0x0000001060100000, %r1, %r9
	setx	0x974a1ce35ad1bbbf, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f64f16c, %r1, %r9
	setx	0xf6ad5f9b34996925, %r1, %r10
	stw	%r10, [%r9]
	setx	0x00000010a0100000, %r1, %r9
	setx	0xf6ad5f9b34996925, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ce09a54ee8, %r1, %r9
	setx	0x96c6885835129d42, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d7a36bd624, %r1, %r9
	setx	0x303bb88b1dff6610, %r1, %r10
	stw	%r10, [%r9]
	setx	0x00000010c0100000, %r1, %r9
	setx	0x303bb88b1dff6610, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ecb32b1b34, %r1, %r9
	setx	0xe3691f0fdc6ca92d, %r1, %r10
	stw	%r10, [%r9]
	setx	0x0000001010100000, %r1, %r9
	setx	0xe3691f0fdc6ca92d, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000fbc0b14104, %r1, %r9
	setx	0x77efc76efa5b5cc4, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800ef76cf8, %r1, %r9
	setx	0xb48eff175dead118, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800fd300f8, %r1, %r9
	setx	0xfb3936b1a2634a7d, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c2d8c66470, %r1, %r9
	setx	0xb261525af95c7e9a, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000da0d0208c8, %r1, %r9
	setx	0x797692d60ab9cb14, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ed51196700, %r1, %r9
	setx	0xe62009eef097c0bd, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f6fa4350b8, %r1, %r9
	setx	0x3e3bd98be459da42, %r1, %r10
	stx	%r10, [%r9]
	setx	0x00000010d0100000, %r1, %r9
	setx	0x3e3bd98be459da42, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000ef6f7d870c, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000dff237b878, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000c1e11c40be, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800f1f83be, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800e1eab43, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000e3268eb16e, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d29650e846, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800f6e84e4, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800e022b90, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000f165dd8bfc, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000ef73344bb8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x0000008093b9d235, %r1, %r9
	setx	0xd5c48486c750e268, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e498d6f, %r1, %r9
	setx	0x65a0b86f5bab3044, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f9343d2, %r1, %r9
	setx	0x4399f1d89ac7971a, %r1, %r10
	stb	%r10, [%r9]
	setx	0x0000001090100000, %r1, %r9
	setx	0x4399f1d89ac7971a, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000cb111b8cc7, %r1, %r9
	setx	0x4ebb5a37608f8536, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d8613eec3f, %r1, %r9
	setx	0xe8746fc469450659, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ef0caafb50, %r1, %r9
	setx	0x2ac2a0d91d3265c8, %r1, %r10
	stb	%r10, [%r9]
	setx	0x00000010d0100000, %r1, %r9
	setx	0x2ac2a0d91d3265c8, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000f258b03447, %r1, %r9
	setx	0x341ae8a67bcecf45, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800ef7f95c, %r1, %r9
	setx	0xab3f95697179b05a, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f7731be, %r1, %r9
	setx	0x24ff08d1bd2e0f41, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000cdbfea7d36, %r1, %r9
	setx	0x04c50bb12f7cabef, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000dc1b01116e, %r1, %r9
	setx	0x4acdcfa6e0274cd8, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e2d2fa43f0, %r1, %r9
	setx	0xc1c9fcab7e91e5c4, %r1, %r10
	sth	%r10, [%r9]
	setx	0x0000001010100000, %r1, %r9
	setx	0xc1c9fcab7e91e5c4, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000f7325e041e, %r1, %r9
	setx	0x84fc85e88e5c37d4, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e0d2988, %r1, %r9
	setx	0x1ee7e8df240b634d, %r1, %r10
	stw	%r10, [%r9]
	setx	0x0000001050100000, %r1, %r9
	setx	0x1ee7e8df240b634d, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800fc0285c, %r1, %r9
	setx	0xf1375149685c621e, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000cd9cd71738, %r1, %r9
	setx	0x587eac6fd6abf99f, %r1, %r10
	stw	%r10, [%r9]
	setx	0x0000001070100000, %r1, %r9
	setx	0x587eac6fd6abf99f, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000deed037c70, %r1, %r9
	setx	0xfa59350551b105c1, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e3212ff4cc, %r1, %r9
	setx	0xb35872edb7d659e1, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f426137658, %r1, %r9
	setx	0x88a52d5260fdebdc, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e1c19f8, %r1, %r9
	setx	0x2393a267fd38deb8, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f651c58, %r1, %r9
	setx	0x5149068e36f03790, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c8619b56d0, %r1, %r9
	setx	0x064ac8dee27842e7, %r1, %r10
	stx	%r10, [%r9]
	setx	0x00000010f0100000, %r1, %r9
	setx	0x064ac8dee27842e7, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d6d89ecb28, %r1, %r9
	setx	0xe72037af0f183dad, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ec63cec4a0, %r1, %r9
	setx	0xf7b0885e40434529, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000001090100000, %r1, %r9
	setx	0xf7b0885e40434529, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f6fa4350b8, %r1, %r9
	setx	0xc1d93fcfcda62d62, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800e1073e0, %r1, %r12
	ldub	[%r12], %r11
	setx	0x00000010c0100000, %r1, %r9
	setx	0xc1d93fcfcda62d62, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000807eb184a1, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000f62791397e, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800f216532, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e1d4b64, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000fce9f6aab8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000efeb899026, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d48e3e91bc, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000cc8ef751c2, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800fb2439e, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000ecb6577cc8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800eddb2b0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000f6fa4350b8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000e1de566868, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000d25af54340, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000c8661ddc70, %r1, %r12
	ldx	[%r12], %r11
	setx	0x0000008058e7ce5b, %r1, %r9
	setx	0xafa8647b7073e7a6, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e702051, %r1, %r9
	setx	0xbbc48ec4a7fd16a6, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800fd536f2, %r1, %r9
	setx	0x351834a000710ec7, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000caa59c58e1, %r1, %r9
	setx	0xaba31895f49385db, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d9ca1a3d81, %r1, %r9
	setx	0x38ea5e1dcaa140fa, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e2dd4371e7, %r1, %r9
	setx	0x0c5bf82f42a92335, %r1, %r10
	stb	%r10, [%r9]
	setx	0x0000001080100000, %r1, %r9
	setx	0x0c5bf82f42a92335, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000f9a2d49945, %r1, %r9
	setx	0xe71358127669841c, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e0b8fa0, %r1, %r9
	setx	0xcba7d4819fc19ac1, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800fc5b810, %r1, %r9
	setx	0xd74a7d8934622e41, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c3536f9574, %r1, %r9
	setx	0xc48a5833b01d5126, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000da3786edd6, %r1, %r9
	setx	0xf23e0732539c4f6f, %r1, %r10
	sth	%r10, [%r9]
	setx	0x0000001000100000, %r1, %r9
	setx	0xf23e0732539c4f6f, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e3fdb24230, %r1, %r9
	setx	0xed413701805108cb, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f1f70bf1d0, %r1, %r9
	setx	0x3cfd4d2ada7d6d18, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e6e73ec, %r1, %r9
	setx	0x94b5cb37ece64087, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f39ac58, %r1, %r9
	setx	0xb7c10ec1a8fc8df1, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000cb8ac8b538, %r1, %r9
	setx	0x857e3e047038d6c4, %r1, %r10
	stw	%r10, [%r9]
	setx	0x00000010e0100000, %r1, %r9
	setx	0x857e3e047038d6c4, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d1412c2fd4, %r1, %r9
	setx	0x49f1606c8a3d06e7, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e4cbb9b410, %r1, %r9
	setx	0x6d1561008c97a010, %r1, %r10
	stw	%r10, [%r9]
	setx	0x0000001040100000, %r1, %r9
	setx	0x6d1561008c97a010, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000fb13a20778, %r1, %r9
	setx	0xa60e0c646fb828fd, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e8186f8, %r1, %r9
	setx	0xa4a6acb98604fb45, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000001040100000, %r1, %r9
	setx	0xa4a6acb98604fb45, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800faafba0, %r1, %r9
	setx	0x20a0dc3b440dd5bf, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000cbbcd0c670, %r1, %r9
	setx	0x94892b130f9163d9, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000de69085940, %r1, %r9
	setx	0x9b6339069c96b493, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e4f976a8f0, %r1, %r9
	setx	0xd7966d31dc433478, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f6fa4350b8, %r1, %r9
	setx	0xff865be0fd8bba97, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000001070100000, %r1, %r9
	setx	0xff865be0fd8bba97, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000cb7d38a926, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800f594769, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800ed66221, %r1, %r12
	ldub	[%r12], %r11
	setx	0x0000008097b1f3b4, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000f54157c8e9, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000e882b379ec, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d2fa58ec1c, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000ce642d182c, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800fe17018, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800ed27c0c, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000f71d4db568, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000e35140dad4, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000dc7fccc914, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800e1fa860, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000f6fa4350b8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000e548052a50, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000805c6c3d90, %r1, %r9
	setx	0xf3374544691186bb, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e6db914, %r1, %r9
	setx	0xccafbea28f6ac791, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f8348ea, %r1, %r9
	setx	0xf7105809008428e0, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000cf5c789f34, %r1, %r9
	setx	0x8fd4bf4b33ff9e1b, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d470085bf6, %r1, %r9
	setx	0xef9cda2e2ddd6574, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ee396421d9, %r1, %r9
	setx	0xe7c9e0f8a407e378, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f7569e92b5, %r1, %r9
	setx	0x8bd18bbd09f6223a, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e672f22, %r1, %r9
	setx	0x2b5e631bb1d26fdc, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f5efa8e, %r1, %r9
	setx	0xece3bf4286117305, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c5d7006ea0, %r1, %r9
	setx	0x2b87fff1cb634a99, %r1, %r10
	sth	%r10, [%r9]
	setx	0x00000010e0100000, %r1, %r9
	setx	0x2b87fff1cb634a99, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d56daf2dc0, %r1, %r9
	setx	0x61a51fd95b44cfb3, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000efd2776d2a, %r1, %r9
	setx	0x74518726d9fa891f, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f579e57782, %r1, %r9
	setx	0xf6828efa4f1c2d67, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800ef07720, %r1, %r9
	setx	0xec74715d3cd531d6, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800fbe0904, %r1, %r9
	setx	0xa61f756e0b45cdfa, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c6f91a95f0, %r1, %r9
	setx	0x0dc882fc64c14a59, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000db9e7bb5f4, %r1, %r9
	setx	0x3f426c5c7c6e4c2d, %r1, %r10
	stw	%r10, [%r9]
	setx	0x00000010f0100000, %r1, %r9
	setx	0x3f426c5c7c6e4c2d, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000edfc90d3ec, %r1, %r9
	setx	0xfdfa64aa1511ddff, %r1, %r10
	stw	%r10, [%r9]
	setx	0x0000001010100000, %r1, %r9
	setx	0xfdfa64aa1511ddff, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000f2a91e2e88, %r1, %r9
	setx	0x8ab330aa8767ccd4, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e61ba08, %r1, %r9
	setx	0x2eb44a55e9d07755, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000001030100000, %r1, %r9
	setx	0x2eb44a55e9d07755, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800f8a8b38, %r1, %r9
	setx	0x4c3f391a7b393ca2, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c024bcd0e8, %r1, %r9
	setx	0xf4ed148ed71cd81e, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000001050100000, %r1, %r9
	setx	0xf4ed148ed71cd81e, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000d6f8a5fae0, %r1, %r9
	setx	0x159e80836d41300a, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e99a6dc460, %r1, %r9
	setx	0xde6ff7c58a47f0e6, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f6fa4350b8, %r1, %r9
	setx	0xcea0d712f1abe32b, %r1, %r10
	stx	%r10, [%r9]
	setx	0x00000080f6dbfed6, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000f12f2f4177, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000e8a5c34450, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000de5c6fff62, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000c04dcf9e2b, %r1, %r12
	ldub	[%r12], %r11
	setx	0x0000001020100000, %r1, %r9
	setx	0xcea0d712f1abe32b, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800f88952c, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800e429bf6, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000f81dc843c0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000ebf7995404, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d1fdb3c98c, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000cd12031b2e, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800f3aa284, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e426e4c, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000fae020034a, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000f2c0be20d4, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000eacd0db7fc, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000dfdd042a70, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000c43e506e90, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000f6fa4350b8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000e85fd2bcb8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000d2969dcfe0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000c204b1e388, %r1, %r12
	ldx	[%r12], %r11
	setx	0x00000080aa65096a, %r1, %r9
	setx	0x58dfc8c79890b90f, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e56c55a, %r1, %r9
	setx	0xd9fbcf46508287b3, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f3fb6aa, %r1, %r9
	setx	0x7c527118c6c9a0ff, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c4b9418a42, %r1, %r9
	setx	0xf15fe4b64f2bd932, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ddc4df1b70, %r1, %r9
	setx	0x79ecf6a3a34d9222, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ea68fdf1d4, %r1, %r9
	setx	0xe6febf202530c45d, %r1, %r10
	stb	%r10, [%r9]
	setx	0x0000001000100000, %r1, %r9
	setx	0xe6febf202530c45d, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000f090eab7b7, %r1, %r9
	setx	0x4c9bb6d8ad8d2835, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e7bd552, %r1, %r9
	setx	0x72f39478edc53a4a, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f819880, %r1, %r9
	setx	0x3c36acc56eceb5dd, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c335cfa7e8, %r1, %r9
	setx	0xc94371d1e3237517, %r1, %r10
	sth	%r10, [%r9]
	setx	0x00000010f0100000, %r1, %r9
	setx	0xc94371d1e3237517, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000da729856ee, %r1, %r9
	setx	0x2516fbd4f7399489, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000eae5212edc, %r1, %r9
	setx	0x6beda8a4d9fd1618, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f2c3c5aed6, %r1, %r9
	setx	0x16706ad847ab02dc, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e2412d4, %r1, %r9
	setx	0x9dd7bc6f9204c8f1, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f83ef80, %r1, %r9
	setx	0x160b671f697a2a0d, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c782f0f764, %r1, %r9
	setx	0x9394c54bc14fe8db, %r1, %r10
	stw	%r10, [%r9]
	setx	0x00000010b0100000, %r1, %r9
	setx	0x9394c54bc14fe8db, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000d6590e46b4, %r1, %r9
	setx	0xdf6748f5e31a1f03, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000ecc9f92014, %r1, %r9
	setx	0x24a42132d5468e95, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f3bbc339c8, %r1, %r9
	setx	0x5edb12c0311c029c, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e11af18, %r1, %r9
	setx	0x2b1f06925fefaa98, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800fc52678, %r1, %r9
	setx	0xadcb933e64569005, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c74242f5f0, %r1, %r9
	setx	0x72f6fd0b0cf59cab, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000001000100000, %r1, %r9
	setx	0x72f6fd0b0cf59cab, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000d5ee06bdb0, %r1, %r9
	setx	0x4ce088a8af773036, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000001000100000, %r1, %r9
	setx	0x4ce088a8af773036, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ec9a70f008, %r1, %r9
	setx	0x8db7f55843b3aabd, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f6fa4350b8, %r1, %r9
	setx	0xdd8232bbb86e45b5, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d40a69c4b0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000c99a5166c2, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800f0725a2, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000ca3bd2eb94, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800f9235ec, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800e221908, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000fad2dddce8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000ed6573c420, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000d3ab157cb0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x0000008038a12e54, %r1, %r9
	setx	0xe3f90da91ae9ab90, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e1dae99, %r1, %r9
	setx	0xde995a67426e72a3, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800fe3ec41, %r1, %r9
	setx	0x56c266d5d83354c4, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000cf727d454d, %r1, %r9
	setx	0xb5d29ea0debf1beb, %r1, %r10
	stb	%r10, [%r9]
	setx	0x0000001010100000, %r1, %r9
	setx	0xb5d29ea0debf1beb, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000d026656cd1, %r1, %r9
	setx	0x1d5064945b31c6d3, %r1, %r10
	stb	%r10, [%r9]
	setx	0x00000010c0100000, %r1, %r9
	setx	0x1d5064945b31c6d3, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000e86c5b5aa5, %r1, %r9
	setx	0xdbe91ae9a31622e0, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000fca4bc5c86, %r1, %r9
	setx	0x1669efd7daf36a39, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e5fed52, %r1, %r9
	setx	0xd68cd053c4de8794, %r1, %r10
	sth	%r10, [%r9]
	setx	0x0000001090100000, %r1, %r9
	setx	0xd68cd053c4de8794, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800fd9f880, %r1, %r9
	setx	0x7a453475eb56dcb6, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c70c14a9f0, %r1, %r9
	setx	0xcbfe7ea320f6f7d4, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d40e63c4d6, %r1, %r9
	setx	0x83abfbfe0b920457, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000eeb99f6df6, %r1, %r9
	setx	0x2f08322c3cc1d228, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000fa8a3d38c8, %r1, %r9
	setx	0x9b1063a7d0b929a4, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800ea08ce4, %r1, %r9
	setx	0x2803456cbef51e9a, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f522958, %r1, %r9
	setx	0x5a434651803859e6, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000ce18dd15c8, %r1, %r9
	setx	0x16da5462ddaf9747, %r1, %r10
	stw	%r10, [%r9]
	setx	0x00000010d0100000, %r1, %r9
	setx	0x16da5462ddaf9747, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000d40577c72c, %r1, %r9
	setx	0xf6a5ed2ca4e27b12, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e9a38c242c, %r1, %r9
	setx	0xbae09a662fbf4990, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f3d8b592cc, %r1, %r9
	setx	0x1c2b667d6c51fcc1, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e775b60, %r1, %r9
	setx	0xae867993c7b83112, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f77b7b0, %r1, %r9
	setx	0x645e34cdc5155079, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c18a5eeea0, %r1, %r9
	setx	0x1a3e7f5ed8690255, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000001030100000, %r1, %r9
	setx	0x1a3e7f5ed8690255, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d483939538, %r1, %r9
	setx	0x167c602d39332e92, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000eb7b3fe8d8, %r1, %r9
	setx	0xdb0d98f59bb6eac7, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000001010100000, %r1, %r9
	setx	0xdb0d98f59bb6eac7, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f6fa4350b8, %r1, %r9
	setx	0x3c48bf5be5965e92, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f54157c8e9, %r1, %r12
	ldub	[%r12], %r11
	setx	0x0000001070100000, %r1, %r9
	setx	0x3c48bf5be5965e92, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000e155494098, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000d61d33dc4f, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000eeee9f70dc, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800f9cbc40, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800e6378d0, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000fd02051448, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000eb3d85b4d8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000d6e3909e30, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800fd300f8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x0000008082f03a5a, %r1, %r9
	setx	0x1a479bfdeee561b5, %r1, %r10
	stb	%r10, [%r9]
	setx	0x00000010e0100000, %r1, %r9
	setx	0x1a479bfdeee561b5, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800e0ca203, %r1, %r9
	setx	0xf4e4b47582a3d962, %r1, %r10
	stb	%r10, [%r9]
	setx	0x00000010d0100000, %r1, %r9
	setx	0xf4e4b47582a3d962, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800f6ef08b, %r1, %r9
	setx	0x4b9faf676972723b, %r1, %r10
	stb	%r10, [%r9]
	setx	0x00000010d0100000, %r1, %r9
	setx	0x4b9faf676972723b, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c6672f54d7, %r1, %r9
	setx	0x5d98ae01e6587198, %r1, %r10
	stb	%r10, [%r9]
	setx	0x0000001060100000, %r1, %r9
	setx	0x5d98ae01e6587198, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000deb5069fa4, %r1, %r9
	setx	0x5b2b75896ac262ae, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e3623dd1d0, %r1, %r9
	setx	0xe044af2e37eb9045, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f0954c7bfd, %r1, %r9
	setx	0xda629a1e707207a7, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800ec12992, %r1, %r9
	setx	0x71894d35b0419ff8, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f4a965e, %r1, %r9
	setx	0x6eb631f36fc1996c, %r1, %r10
	sth	%r10, [%r9]
	setx	0x0000001090100000, %r1, %r9
	setx	0x6eb631f36fc1996c, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000ce176d0f18, %r1, %r9
	setx	0xbb1e173c1340b9b8, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d473e856f8, %r1, %r9
	setx	0xdbc71646a3489abd, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e135c0cdba, %r1, %r9
	setx	0x9dab92b59dff643f, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f496eb8174, %r1, %r9
	setx	0x42b9a74713f7bee4, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800eaab544, %r1, %r9
	setx	0x6f304185a48c3e3f, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f218ac4, %r1, %r9
	setx	0xf604a6ada24e0575, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c48f075730, %r1, %r9
	setx	0x85d4af6492544e68, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000dfe46bc4ac, %r1, %r9
	setx	0x18505066323df1ab, %r1, %r10
	stw	%r10, [%r9]
	setx	0x00000010e0100000, %r1, %r9
	setx	0x18505066323df1ab, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ec277ba738, %r1, %r9
	setx	0x3c7da8e84304b876, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000fcea9b4b54, %r1, %r9
	setx	0x79df91821e4d158e, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800ec7e438, %r1, %r9
	setx	0xa11b6c7c26359572, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000001070100000, %r1, %r9
	setx	0xa11b6c7c26359572, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f5a0be8, %r1, %r9
	setx	0xe29c29e15a1269ab, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c687f47ba8, %r1, %r9
	setx	0xfebbde40fdad3790, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000df8a3097f0, %r1, %r9
	setx	0x310f93893c9e46c2, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e547f01568, %r1, %r9
	setx	0xa058fdeee4ff1d77, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000001050100000, %r1, %r9
	setx	0xa058fdeee4ff1d77, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000f6fa4350b8, %r1, %r9
	setx	0x25d88d2e0d507c07, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000804e172440, %r1, %r12
	ldub	[%r12], %r11
	setx	0x0000001070100000, %r1, %r9
	setx	0x25d88d2e0d507c07, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000faa8ba0472, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000ef7bc944b2, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000d87e1851dc, %r1, %r12
	ldub	[%r12], %r11
	setx	0x0000001000100000, %r1, %r9
	setx	0x25d88d2e0d507c07, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000cc1b1b238e, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800ffecfc6, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800fb2439e, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800fdbd050, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800ec9ec48, %r1, %r12
	ldx	[%r12], %r11
	setx	0x00000080dec108b2, %r1, %r9
	setx	0xa9ff7e9a17996521, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e4d2f3f, %r1, %r9
	setx	0x9dc610a98bc8a275, %r1, %r10
	stb	%r10, [%r9]
	setx	0x0000001060100000, %r1, %r9
	setx	0x9dc610a98bc8a275, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800f34ec87, %r1, %r9
	setx	0x81c74345e63360cd, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000cbe3ab3272, %r1, %r9
	setx	0x4bc59c01368fb391, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000dcda383b22, %r1, %r9
	setx	0xf5da5849f21ffa29, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000eb4a6bcc52, %r1, %r9
	setx	0x2de1b7ab84dc7026, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000fec8ad3b0c, %r1, %r9
	setx	0x228c478dd02c67c3, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e3f032e, %r1, %r9
	setx	0x2b605791a5a89928, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f17bfaa, %r1, %r9
	setx	0x6eecde411c989580, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c6388836f6, %r1, %r9
	setx	0x8c5b5b0b7885fff4, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000da1d0deb2e, %r1, %r9
	setx	0x076097e65303383a, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e5f450692e, %r1, %r9
	setx	0x9ec975b30e2a9ba4, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f7616efca0, %r1, %r9
	setx	0xeaa3cb6b13b1a10c, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e9baae8, %r1, %r9
	setx	0x6b9e29ecbea0faef, %r1, %r10
	stw	%r10, [%r9]
	setx	0x0000001000100000, %r1, %r9
	setx	0x6b9e29ecbea0faef, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800f8c6628, %r1, %r9
	setx	0x52ed7a958043cf46, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c4deebfef8, %r1, %r9
	setx	0xb80560614cf4ee56, %r1, %r10
	stw	%r10, [%r9]
	setx	0x0000001030100000, %r1, %r9
	setx	0xb80560614cf4ee56, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000dc7ce59858, %r1, %r9
	setx	0x05dbd06c93ea36a9, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e681c3ee18, %r1, %r9
	setx	0x75b3b9542274c910, %r1, %r10
	stw	%r10, [%r9]
	setx	0x0000001070100000, %r1, %r9
	setx	0x75b3b9542274c910, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000f6b27171a4, %r1, %r9
	setx	0x3e35603500afb944, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800ea07730, %r1, %r9
	setx	0x7c7fe64721298978, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f9ae108, %r1, %r9
	setx	0x0e1ad8e74528a8d0, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c32885af70, %r1, %r9
	setx	0xeccc62f13c6310c3, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000db5a51a558, %r1, %r9
	setx	0x7630c0035138cf17, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ed2e06baf8, %r1, %r9
	setx	0x5c9308dee797fc6b, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f6fa4350b8, %r1, %r9
	setx	0x5c859cb18920371d, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f32a7bce89, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000ee51110b2c, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000d233b4d230, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000c806b07e38, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000e548f0a236, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000dbc6a020f6, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000c0d7189094, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800f23700e, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000c46125d41c, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800f5f4e74, %r1, %r12
	lduw	[%r12], %r11
	setx	0x00000080c8ccb541, %r1, %r9
	setx	0x9ba47ea2242fc705, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e49629d, %r1, %r9
	setx	0x7dfbf42c16ac065f, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800fd6942a, %r1, %r9
	setx	0x42592ef775f7e911, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c981edcf89, %r1, %r9
	setx	0x54e21faa3cd4e427, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d36ed39279, %r1, %r9
	setx	0x9522673ef72e60b0, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ed344009e4, %r1, %r9
	setx	0x9eb2b94d53c7dffb, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000fcd5de919d, %r1, %r9
	setx	0x829ac5f313384cb8, %r1, %r10
	stb	%r10, [%r9]
	setx	0x0000001070100000, %r1, %r9
	setx	0x829ac5f313384cb8, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800ec16c34, %r1, %r9
	setx	0x6b2e2bc164d7f5f2, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f9fefe2, %r1, %r9
	setx	0xcd511045b4bbb5b0, %r1, %r10
	sth	%r10, [%r9]
	setx	0x0000001000100000, %r1, %r9
	setx	0xcd511045b4bbb5b0, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000cbd216d07e, %r1, %r9
	setx	0xed0c79170252aadc, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000df434df552, %r1, %r9
	setx	0x1f7a79f667abcc60, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e2c62fcff4, %r1, %r9
	setx	0x79fb546cd56e2671, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f4223c3160, %r1, %r9
	setx	0xf0f2b9afff548214, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800ec8be04, %r1, %r9
	setx	0x6cbd08e613884bb9, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800fc30c38, %r1, %r9
	setx	0x9c9f20647a14b5f9, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000cf492558f4, %r1, %r9
	setx	0xf96d4ae96618d4f1, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d5d9bf6f18, %r1, %r9
	setx	0x68df18a044fed40b, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000ec84f3c4f4, %r1, %r9
	setx	0xa2dd0534ca9e24aa, %r1, %r10
	stw	%r10, [%r9]
	setx	0x0000001010100000, %r1, %r9
	setx	0xa2dd0534ca9e24aa, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000f004f69ac4, %r1, %r9
	setx	0xa2bbb0b7afe62f1b, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e11c338, %r1, %r9
	setx	0x69567d698c518427, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800fecea98, %r1, %r9
	setx	0x59d45ba993094931, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c4f87fd7c8, %r1, %r9
	setx	0xb51b71134941f010, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d357467838, %r1, %r9
	setx	0x60ba6c3c7ec337bb, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e9f3bd0318, %r1, %r9
	setx	0x405c54548c26227a, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f6fa4350b8, %r1, %r9
	setx	0xe193aaa6f2839662, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e168492d00, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000d27a9df578, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000ce7b043071, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800f48bf17, %r1, %r12
	ldub	[%r12], %r11
	setx	0x0000001080100000, %r1, %r9
	setx	0xe193aaa6f2839662, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f216532, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000e0006d18e4, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000dc3a934038, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000c3ae115248, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800fe92738, %r1, %r12
	ldx	[%r12], %r11
	setx	0x00000080c63ad639, %r1, %r9
	setx	0xad7273b75866c7db, %r1, %r10
	stb	%r10, [%r9]
	setx	0x00000010f0100000, %r1, %r9
	setx	0xad7273b75866c7db, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800e8d3fd6, %r1, %r9
	setx	0x4893c4248f8aa234, %r1, %r10
	stb	%r10, [%r9]
	setx	0x0000001030100000, %r1, %r9
	setx	0x4893c4248f8aa234, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800fe608ce, %r1, %r9
	setx	0xd8911ab72cb945fe, %r1, %r10
	stb	%r10, [%r9]
	setx	0x0000001060100000, %r1, %r9
	setx	0xd8911ab72cb945fe, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c77cd2dd24, %r1, %r9
	setx	0x03a67d958c2d8211, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000dc05309639, %r1, %r9
	setx	0x7204d951f12550c2, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ea663f4064, %r1, %r9
	setx	0xf6cd2cb3b539690b, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000fe88092a39, %r1, %r9
	setx	0x1972348068e9ccc8, %r1, %r10
	stb	%r10, [%r9]
	setx	0x00000010e0100000, %r1, %r9
	setx	0x1972348068e9ccc8, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800e110a3c, %r1, %r9
	setx	0xc1de8a442557e233, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800fd01280, %r1, %r9
	setx	0x8252ec6d18de8a9c, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c06fbca15e, %r1, %r9
	setx	0x14a7635ae07fcf53, %r1, %r10
	sth	%r10, [%r9]
	setx	0x00000010a0100000, %r1, %r9
	setx	0x14a7635ae07fcf53, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000df2c5213b2, %r1, %r9
	setx	0x033e57c484accaba, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e33e66bc22, %r1, %r9
	setx	0x85d8ab67aaf41951, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f2b8b67a4c, %r1, %r9
	setx	0xa77d11b8273ee1fd, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e5d02d4, %r1, %r9
	setx	0xbed1a76624e3f127, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f55b4e0, %r1, %r9
	setx	0xe01b51c43c982885, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c20db97ab8, %r1, %r9
	setx	0x441f2e8d98ffab76, %r1, %r10
	stw	%r10, [%r9]
	setx	0x0000001090100000, %r1, %r9
	setx	0x441f2e8d98ffab76, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000d1e3c29de0, %r1, %r9
	setx	0x638df394fb8f5332, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e6a4fefa30, %r1, %r9
	setx	0x92de77a2be190d81, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000fc7019b718, %r1, %r9
	setx	0x1b1c69dae798b432, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e6e3170, %r1, %r9
	setx	0x5a350464d98d9e2c, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800ff5d638, %r1, %r9
	setx	0x95e2c4b54fc33944, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c1a2498f90, %r1, %r9
	setx	0x53ec6dce331a4c5a, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d3c26c4490, %r1, %r9
	setx	0x10c06785289d3b79, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e40be7f428, %r1, %r9
	setx	0xbb1acad7f87b67ce, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f6fa4350b8, %r1, %r9
	setx	0x00c24094c5498fa4, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ced6bc133d, %r1, %r12
	ldub	[%r12], %r11
	setx	0x0000001090100000, %r1, %r9
	setx	0x00c24094c5498fa4, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f57cb14, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800e5a2f97, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000807d72f251, %r1, %r12
	ldub	[%r12], %r11
	setx	0x00000010e0100000, %r1, %r9
	setx	0x00c24094c5498fa4, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ee58093a10, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000df0d1ed322, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800ee098a0, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000f557a0f3c8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000ef74e91414, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000d6e887fce0, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000c310a284bc, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000806d16d324, %r1, %r9
	setx	0x3b645fd77b027ebb, %r1, %r10
	stb	%r10, [%r9]
	setx	0x0000001060100000, %r1, %r9
	setx	0x3b645fd77b027ebb, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800edec989, %r1, %r9
	setx	0x0db621b251ab3ff5, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f6772af, %r1, %r9
	setx	0xf7c02d631dc6c220, %r1, %r10
	stb	%r10, [%r9]
	setx	0x00000010a0100000, %r1, %r9
	setx	0xf7c02d631dc6c220, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000c72d138bf2, %r1, %r9
	setx	0xebae6076655268f2, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000da7a8065e1, %r1, %r9
	setx	0xb217170a175ae829, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000eb3322a88c, %r1, %r9
	setx	0x0e4237f77e4ca77d, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f6a22f6092, %r1, %r9
	setx	0xbcb0fef6d58fc6f2, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800ec3fd46, %r1, %r9
	setx	0x0562773bd6cc9fe1, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f47b660, %r1, %r9
	setx	0x761fba9700feb315, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000cd9129b80e, %r1, %r9
	setx	0x0b53aacf17b1a238, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d2bba17e44, %r1, %r9
	setx	0xc19106d8d230aada, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e112b8a0d2, %r1, %r9
	setx	0x34bc0321c50b59a2, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000fafb372a2a, %r1, %r9
	setx	0xc2a64322c88a2eba, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800eeab5e0, %r1, %r9
	setx	0x93d2fade9205e4d7, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f7eddcc, %r1, %r9
	setx	0x494a7af31f1cb48a, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000cd70d4cd04, %r1, %r9
	setx	0xc61e5d5116377f98, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d0bd4c3a30, %r1, %r9
	setx	0xe9fc00cd6fcb571d, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e0db9c4a20, %r1, %r9
	setx	0x2dec18b4f40f59f4, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f1bec505e4, %r1, %r9
	setx	0x5cf991d07d669020, %r1, %r10
	stw	%r10, [%r9]
	setx	0x0000001090100000, %r1, %r9
	setx	0x5cf991d07d669020, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800eb75478, %r1, %r9
	setx	0x98b331fbffbdf216, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800fa447b8, %r1, %r9
	setx	0x51605c9e55e3cdd7, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000001030100000, %r1, %r9
	setx	0x51605c9e55e3cdd7, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000c78fda4a30, %r1, %r9
	setx	0x9e9d45a40cbae37b, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000dabcf37790, %r1, %r9
	setx	0x8086b70067fe9f1c, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e7d0fae7b0, %r1, %r9
	setx	0xb5702d2ccdeddf59, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000001000100000, %r1, %r9
	setx	0xb5702d2ccdeddf59, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f6fa4350b8, %r1, %r9
	setx	0xc94cd6b9fd38eacb, %r1, %r10
	stx	%r10, [%r9]
	setx	0x00000080ce5a2a68, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000fbafa91f64, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800f491634, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800e4f19e8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000fd8b8a1b44, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000e9fa4efa58, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000d8dc367a94, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000c95320797c, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800f220f60, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800fadda78, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e4f2320, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000f6fa4350b8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000e513fc0438, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000dc354eb4b0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000c7494c72a8, %r1, %r12
	ldx	[%r12], %r11


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
	.xword	0x9a1e046ea6c3e6e4
	.xword	0x775150cfb264998b
	.xword	0x8ba7447dc89c45b4
	.xword	0xe90a2550ac638062
	.xword	0xca1be022e58f07c6
	.xword	0x2def966852530294
	.xword	0xd8f65944b4db7114
	.xword	0x996c76daccfce773
	.xword	0x6d0e24a68c19d10a
	.xword	0x91736c87773e99e4
	.xword	0xb24d6c4151807b75
	.xword	0x47c5d334629e97f4
	.xword	0xc8bfee047c9040c0
	.xword	0x8b3e24ddf73356dc
	.xword	0x3d269a9b97ce577d
	.xword	0xbf7e3adbd47bfde3
	.xword	0x687a73eecbec6c13
	.xword	0x248f74ce95fb0f5f
	.xword	0x102f63e40a21f9c7
	.xword	0xfbb88e6baddd608c
	.xword	0xcb41f68c1987f5b4
	.xword	0x1f6de2d824158e8e
	.xword	0x3872cd37e4c41a81
	.xword	0x4e59bbf668dfda65
	.xword	0xb5ca34134f480e6f
	.xword	0xbe23131fd6beea9e
	.xword	0xdd811863ba572a37
	.xword	0x62340627ea348af1
	.xword	0x839f990c38d31539
	.xword	0x186b8e1e53955610
	.xword	0x3878fb7e6b12db21
	.xword	0xadb76bf7610c49e5
	.xword	0x6528c4c342bc0ee1
	.xword	0x0e0e9f6ffbf6a697
	.xword	0xda0c431ff602e273
	.xword	0x2af2f782f1951de0
	.xword	0xace54192725aa156
	.xword	0x493ecd9fc88dde89
	.xword	0x44edd0f14137c17f
	.xword	0xddf38a8483a1a0a3
	.xword	0x6f7c3351e50a485d
	.xword	0x49a37e8bb7b28705
	.xword	0xf0c42655fe04ce34
	.xword	0x0531f6a47f16cb30
	.xword	0x5b15552ed9b932ab
	.xword	0xe160b56b51653249
	.xword	0x9991cbf61bc9dde2
	.xword	0xa9710be6779af90e
	.xword	0xc099409d163b0d4b
	.xword	0x65ba82a32e8c02f1
	.xword	0x955fffcf0d90b5eb
	.xword	0x66b4950de5ddcaf5
	.xword	0xf5e95ea84844a461
	.xword	0x9b7e02bade0f9052
	.xword	0xeb7747213a71b76c
	.xword	0x3435276031013132
	.xword	0x30286cc6d0f7583a
	.xword	0x305c6afd601f4c24
	.xword	0x4440f66e8346c576
	.xword	0x56e44d09dc140cb2
	.xword	0x1cc41fd8e1cf75ee
	.xword	0x1fa8b59626ac7547
	.xword	0x6cb74fe5a4e688e4
	.xword	0x74f6877863f5a43f



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
	.xword	0x5e30dd6ad95303f0
	.xword	0x771b73150d23d4e8
	.xword	0x88b45b8f7442789e
	.xword	0x06d22177f6dd15bf
	.xword	0x2f7d40f8b776c9c8
	.xword	0xa3429dfe0084199c
	.xword	0xbf5d58bbe6936b3d
	.xword	0x77cbe1a3b3059a61
	.xword	0xe12b24a9f413cac1
	.xword	0xacc411fd854fe251
	.xword	0x66beb413727be1c2
	.xword	0x5a3727afd7a1ac5b
	.xword	0xa0c159609d969f1e
	.xword	0xa225ab205c366d54
	.xword	0xd940939eb17ab9c0
	.xword	0xb28b8164305d9260
	.xword	0x13b0c113b0ab5416
	.xword	0xd2945b1c4cf99a11
	.xword	0x202083800251ee9d
	.xword	0xe012b29282acddd0
	.xword	0x97886b5b8f49f6ae
	.xword	0x3d3a0c61261d3dac
	.xword	0x285bfb01acc12d44
	.xword	0xb3f34d2dd6ac2daf
	.xword	0x80e5e1f2f565139a
	.xword	0x0583810fe8eb79a6
	.xword	0xf1adc12bd1a12019
	.xword	0x5819509fb41a6f09
	.xword	0x05f75bc5d73bf0cd
	.xword	0x82bb4221627164ec
	.xword	0x81e51f9108509f7f
	.xword	0xdfcf595611b8b765
	.xword	0x261714f252e99acb
	.xword	0x05854c566d144484
	.xword	0xe9446157da534650
	.xword	0xd95191fb20fa2de1
	.xword	0x07e7613c389076f8
	.xword	0xcb266c70d822f869
	.xword	0xc965feb4e17b9935
	.xword	0xa0ed2251c7d310cf
	.xword	0xfbc4592a9d6b4d94
	.xword	0x8df84f73dace05c0
	.xword	0xe86436ad9e04f4b2
	.xword	0x917dd6ea3934efd3
	.xword	0x4e8681e93ea420c9
	.xword	0xe4ed3f8964346459
	.xword	0x6371b92c4b32b695
	.xword	0x06f996cc84a40acf
	.xword	0xfcfaee1e6a4daae6
	.xword	0x7b9e805c84dc2eb3
	.xword	0x57c664f1feb6aff0
	.xword	0x0828bc0bf7aa04e2
	.xword	0x6827bf5a57873dcd
	.xword	0xb579468a4ef60afc
	.xword	0x89584bc4f485851d
	.xword	0xd38f4b9c07a74401
	.xword	0x778a3dd4ef7683b7
	.xword	0x33579140f2c60d5e
	.xword	0x44615f95ff4d8abd
	.xword	0x2219978171a5752a
	.xword	0x94757960b2f2b2d0
	.xword	0x9277b5802e06f469
	.xword	0x8cb782d356ecfaf8
	.xword	0x63f914712874fa11



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
	.xword	0x73fd12ac88139fa9
	.xword	0x1bef00e2f0c9c943
	.xword	0xae3fbb0268334db6
	.xword	0x0c4a0d6e04c40f6a
	.xword	0x15ec61ce1d2221ae
	.xword	0x20de826a9519beea
	.xword	0x862b78d4a6679be3
	.xword	0x1cb0f0b9e02fa321
	.xword	0xc2b5d8cf22b678f1
	.xword	0x54787cfb3d52dab9
	.xword	0x8f9d8dc4a6d9b1ab
	.xword	0x6ed6fe257b61ca67
	.xword	0x5a18539bc675bc1e
	.xword	0x2adedf844b1ebf1c
	.xword	0x4f29b8d14ec1d164
	.xword	0x7895c64eff0cbfc5
	.xword	0x8e3b95c12fd3cfec
	.xword	0xe5a1d0a38f2a1f5e
	.xword	0xe00fd48f32202ea9
	.xword	0xa5628c3ca87f3311
	.xword	0x1ad915989eb6e4aa
	.xword	0xe4522d84f7c4d22a
	.xword	0xf63a46580bc9de2b
	.xword	0x6823018bea1e9774
	.xword	0x472dfe5b79a81a5d
	.xword	0xe39dae60dedbf78a
	.xword	0xea42a93acacccf1b
	.xword	0x95dc5002f53b6182
	.xword	0x97f803647b8cf1fe
	.xword	0x9f464c00e76a2d6e
	.xword	0xc4d39faa89808d94
	.xword	0x143e7ff6f053a012
	.xword	0x9512025e3fb2832d
	.xword	0x733cd0199c3ae969
	.xword	0xd161760724be7c23
	.xword	0x04f56e4299c03e32
	.xword	0x06e91b30d95a1d71
	.xword	0xd75a153eb2a6b216
	.xword	0x50307f513af2404e
	.xword	0x21439d0a2ace9a6c
	.xword	0x8a0c54f1237d9daf
	.xword	0xbf5e60308d16528b
	.xword	0xde447e5b14c9d550
	.xword	0xd772a9727002a2ad
	.xword	0xa6a37d4661ea0699
	.xword	0xfa8b2fe2178136ab
	.xword	0xce22a1e3875e650d
	.xword	0xde1d1de57dfeb265
	.xword	0x9404686f5a4d5e33
	.xword	0x8c0bc19443596c70
	.xword	0x1e05be8e1245bdb5
	.xword	0x5a7be115dce1e682
	.xword	0x65b2bd75729c5e6d
	.xword	0xf23e70ed00e05af9
	.xword	0xa2b7c8ed3db06cf0
	.xword	0xb06566608a90c904
	.xword	0x25438b3143be21c0
	.xword	0x0cba119ecc3641f4
	.xword	0x47a32a1dacc0fe67
	.xword	0xf68a27f87bc43a77
	.xword	0x7551302a1d777215
	.xword	0xb9d02ae6b84f56e9
	.xword	0x1a1381be989696de
	.xword	0x11c59198be6ca92a



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
	.xword	0x809b9bf569a8da41
	.xword	0xae096424b558d010
	.xword	0x654e840525817ccb
	.xword	0xb7035e888d78de8e
	.xword	0xf9bed30426273df2
	.xword	0xb9528045a61b2d79
	.xword	0x940d5caf979fc724
	.xword	0xaae7a24c2d298a1b
	.xword	0xe17dca45f75557f6
	.xword	0x85fd5e1ed46d5e5c
	.xword	0xee12f052c2f53d61
	.xword	0x3eb7f2f4b82ba249
	.xword	0x96add045e081ecac
	.xword	0x066e0152aae729ec
	.xword	0xbf52886598891c96
	.xword	0x29b8753d3039c6b8
	.xword	0xc4e6a63165b9709b
	.xword	0xae1e2152a8c07e77
	.xword	0xb8cb11af4bda5503
	.xword	0xe1d1a40a0153c69b
	.xword	0x68b1e63d1ff1e634
	.xword	0x7a8d123fac7e9a4a
	.xword	0x2d417e758ba168ca
	.xword	0x8b0b6fd66e024892
	.xword	0xb3e5eb8ac1003b61
	.xword	0x1eb5511dc2fdc045
	.xword	0x8690440ecbc92026
	.xword	0x13e70e88e59d1cbf
	.xword	0x6ec34997ba53ada8
	.xword	0x54e3c7b0827040d0
	.xword	0xa12c549de82affc0
	.xword	0x032fd23071301186
	.xword	0x1095af6fe5b62a24
	.xword	0x6aaaf2f33628ed06
	.xword	0x547274133b3ca91c
	.xword	0x30f1266e9dd91a26
	.xword	0x67e9249ad967f37f
	.xword	0x8a7c401cb63aa6cf
	.xword	0x092ca93a0f991152
	.xword	0x7e661f6ce7f974fe
	.xword	0x64e630bc6a66e7c9
	.xword	0xdf5f360e881ea338
	.xword	0x60f9ab58ab47dc63
	.xword	0x1654e5bcce29c4fe
	.xword	0xbc819c465915d5b9
	.xword	0xfae03109781de86d
	.xword	0xbcb3de238bf3bb76
	.xword	0x3b724ff26087f148
	.xword	0x01d0c4c4a87d1372
	.xword	0x7a10780c7acdcd63
	.xword	0xc0c86491922d696f
	.xword	0x30caca0bbbd3b6fa
	.xword	0xed74931323e72e95
	.xword	0x9cd5095b96ec46d2
	.xword	0xa7c1f6d253cc20fd
	.xword	0x9852daa147be03ff
	.xword	0xaf0b320605e9f523
	.xword	0x3566efeddd26b224
	.xword	0xabe668085b9c48c5
	.xword	0x07dafeb8f088f2eb
	.xword	0x57c805f7925d0bcb
	.xword	0x92132306e9c35544
	.xword	0xf23741ac2dc314ce
	.xword	0x54c3cfea0e72772d



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
	.xword	0xf8d314814d553d65
	.xword	0xfa968cc73229110b
	.xword	0xbb15d88c2ec5207a
	.xword	0x8eea49c0d36cf5be
	.xword	0xdb8844669c75be7c
	.xword	0xa6f52194f558e651
	.xword	0x8e5fb459d0f42e11
	.xword	0x829f04acd48ee74c
	.xword	0xdd5ccfb4254e597d
	.xword	0xa48c9e3317f8ba85
	.xword	0x94a7c452dd16f807
	.xword	0xc4be4259fa80e58d
	.xword	0x627a677e47786aab
	.xword	0xaa45a839d3efaf97
	.xword	0x999d5c0355ce49f5
	.xword	0xa2dc0a8530017584
	.xword	0x4d714babae030614
	.xword	0x028978a6e68d5913
	.xword	0x45794eebea915020
	.xword	0xdd452fd65a00c9a8
	.xword	0xe478ad5794801fa5
	.xword	0x40315193affdfd65
	.xword	0x12d01c5caca45b62
	.xword	0x7a8bc008a65a2dec
	.xword	0xc9923443c8fae350
	.xword	0xfa864b31e71832ec
	.xword	0xe96e400f0400b4b4
	.xword	0x5e9d58a17d04f8de
	.xword	0xbe60f516948eefbf
	.xword	0x54416a0f5005c7b7
	.xword	0x631956fa37d8ac15
	.xword	0xad6d92514ed8af74
	.xword	0x2fd2396bb2d27f71
	.xword	0xfd3c5273626e2392
	.xword	0xaa1d683a6aaff04f
	.xword	0x9f490794a8b4f25a
	.xword	0x1e58183d7a1412a2
	.xword	0x4f2e714e47c9e033
	.xword	0x0f4bb0854a8b6275
	.xword	0xf6fe6caeef31efc1
	.xword	0xf36193b10c407e44
	.xword	0xfd2aafd2a9f09202
	.xword	0x38bb0a566e533f37
	.xword	0xde020da2bea971bf
	.xword	0x678d04ab5cb03378
	.xword	0x1e72607940986673
	.xword	0xcd257fa0872ff393
	.xword	0x6811d1994dd23a54
	.xword	0x90ed6e43aef98d17
	.xword	0x67948c6146b9e0cb
	.xword	0x13f4cabd5c5b2f19
	.xword	0xfe847c9d31d487b2
	.xword	0xca501ecdfaa8fe7b
	.xword	0xf835b78ca2ebf620
	.xword	0x866a2f3da1693cf1
	.xword	0x2637ea814a234cce
	.xword	0xef3aa840bfa45be2
	.xword	0xdc23663663946d64
	.xword	0xa453dace134cf155
	.xword	0x5f3d4eb9db023b90
	.xword	0x2138655dca508f4d
	.xword	0xf438c0b436f29356
	.xword	0x491bc164e1f0f99a
	.xword	0x4af532e4f01089a9



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
	.xword	0x05f3be8c5d753af7
	.xword	0x3bb7e5447b64d794
	.xword	0xe07276a521e27018
	.xword	0x5bb8c5855e832d07
	.xword	0xb9f4bb2c40753550
	.xword	0x614bb88f7cbed5fd
	.xword	0xc4a867a4495bd0d7
	.xword	0xd78b635ecebb5b7a
	.xword	0x1cf302b2015094b1
	.xword	0xce1e7d8edbf040d4
	.xword	0xd8470d988444f92b
	.xword	0x040944e12346a37a
	.xword	0x742039175279a975
	.xword	0x0c9c00ec36c6d4d1
	.xword	0xa91c68ee1c88f24f
	.xword	0xe3db736421dc62d4
	.xword	0x7b11078f93b065ca
	.xword	0x4225afeee0f52292
	.xword	0x43c00ba49f2ea2f6
	.xword	0x9281d338d19adb00
	.xword	0xd2d64d09b6fadb4d
	.xword	0x782f39ca7fc81461
	.xword	0x5895ef43b956027e
	.xword	0x71713e80b31ae320
	.xword	0x8661c7538a870bca
	.xword	0x7283eb45aba4031b
	.xword	0x515630719af75d9d
	.xword	0x3d6f042e3398f671
	.xword	0x3d15f87d62c0075e
	.xword	0x7fc401cc6fcf1662
	.xword	0x732c266e0dc04736
	.xword	0x995408f6533b7faa
	.xword	0x3182ac8bd93988b4
	.xword	0xacee0e0a1e0824ae
	.xword	0xb1efc25ca853f3d9
	.xword	0x788f75d585491542
	.xword	0x0963cd3fe8ca9269
	.xword	0x923c5d8e910d5e44
	.xword	0xe1e1945ca51e13c5
	.xword	0xdf417e34fe9bc17b
	.xword	0x606fe948753676c7
	.xword	0xf35994a7ce7b1bfb
	.xword	0x4d25dc08b9358938
	.xword	0x425e3a2abfab08c3
	.xword	0xe2888719142c6844
	.xword	0x7d4cae9647ef5752
	.xword	0xac0078a44fe4123d
	.xword	0x7cd32c846f8c15f8
	.xword	0x15da2364d8533513
	.xword	0xe5024ead5ad33cd2
	.xword	0x8b1b1e114ccf9767
	.xword	0xcc33a7c40bf57750
	.xword	0xe64595451bbfa5ea
	.xword	0x53dece9d29318c40
	.xword	0x822b9b608587ce58
	.xword	0x70d26bb333c8e02a
	.xword	0x70e52802a3982c02
	.xword	0x183ce81c64cc2f13
	.xword	0x80c76fbe55d4b2a5
	.xword	0x34934cc625b23437
	.xword	0xc48adf9c0f066009
	.xword	0xf8f3920aef526aaa
	.xword	0x1fdf4ece59a76158
	.xword	0x8243eee304230214



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
	.xword	0xdf7f4e88f467430e
	.xword	0x5c9084ae4c9224a0
	.xword	0x493dd6ff978a3d5b
	.xword	0xf6a42748152c54a9
	.xword	0x94cbd6203e5629ee
	.xword	0x67cec6ae78ce4325
	.xword	0x52e17a91ee3af7bc
	.xword	0xab7cbe96bb28abb6
	.xword	0xbca6e125c519f803
	.xword	0xf059b7b25f924165
	.xword	0x751ecd38a8afb653
	.xword	0x435e4b50c58521e5
	.xword	0x2853a69855eeba16
	.xword	0x08aecd8c64d16971
	.xword	0xc42564faa4a4dea5
	.xword	0x7b9ca8f7556afdc2
	.xword	0x02b172d7026cc747
	.xword	0x2a0149e3589f3166
	.xword	0x9ad72b0894255452
	.xword	0x8ce18c6c4d6ac4f1
	.xword	0x1c92568fd141c49d
	.xword	0xf9edff45554b178c
	.xword	0x6bcfbda802d3f68b
	.xword	0x512ee44f14838a4c
	.xword	0x459e75f240f63f23
	.xword	0xc90e4f1764810d5c
	.xword	0x4aec36b9d8221148
	.xword	0x612d9a468fb8b419
	.xword	0xebac01773649e228
	.xword	0xcb2665b5cb5f203e
	.xword	0x17e50c7d4b56d3e4
	.xword	0x316d0fb774cbe242
	.xword	0xf2954f4f6fa5b276
	.xword	0x005aa925a11cd4dd
	.xword	0x142388ba13be4bc9
	.xword	0x891efeeb05264125
	.xword	0xf041b9589a8521ab
	.xword	0x8926c1027d2e216c
	.xword	0x837757faa9b6773d
	.xword	0xfbd5a3b2196fbf00
	.xword	0x522716b73ef47f38
	.xword	0xe17d4ec097faf4c7
	.xword	0x0a4eeb9472ff4d4c
	.xword	0xd2f5a86161dbce59
	.xword	0x98461acafe06ebc0
	.xword	0xf28f3c78edb7cc6f
	.xword	0xa3ea171dd5c3a9d0
	.xword	0x24f01b1672ba935f
	.xword	0x59d81b92d8a1a7fa
	.xword	0xc31dd47bf2bce970
	.xword	0x83170ef625638857
	.xword	0x71840f896290a6ff
	.xword	0x1e28369196ad9a53
	.xword	0x4fef1580a5cd554c
	.xword	0x34212e77933d942c
	.xword	0xef68dd38d21d4914
	.xword	0x6554de5a5dd3dc63
	.xword	0xbd987f194216487d
	.xword	0xd31387543d8d7654
	.xword	0x3e380ed0503bdaa0
	.xword	0x52486a904545f5f4
	.xword	0x3a8b04d9b85f4a33
	.xword	0x5ef7a861d302e280
	.xword	0xdef75bd6ec07d76f



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
	.xword	0x4ec6d527f30d1f9d
	.xword	0xa35c374795f94c5a
	.xword	0xdf15712bd2cf3947
	.xword	0xfac2d29fc09a755a
	.xword	0x79938dfe979322b3
	.xword	0x47079028b1409551
	.xword	0xd49ab27d398f7d68
	.xword	0xe2fc6682121bd663
	.xword	0xc158a9a596104731
	.xword	0x842e6824119f4d74
	.xword	0x0671eb99db1d44fa
	.xword	0xff31274637bf80fe
	.xword	0x24488c988075526d
	.xword	0x030e96b41adb8242
	.xword	0x42ff204e05b38db3
	.xword	0x20cf5dceee98ccb6
	.xword	0x71f3eef8bd18befa
	.xword	0x3504864fb1d7571c
	.xword	0x84de6e2dc07110f8
	.xword	0x8611ea63e9d5ed5d
	.xword	0xda2b0d47a075300d
	.xword	0x4124c3ff4155f591
	.xword	0xe72ffb7406dd4461
	.xword	0x8bb215f70777cae3
	.xword	0xf3ee56b9ba76d4c4
	.xword	0xc2b7a4bf24a487a6
	.xword	0x13e96b79b74ab91f
	.xword	0x4526170f73e26f1d
	.xword	0xd285b0b87349b223
	.xword	0xc2cf5f602c7b7c29
	.xword	0x5f773f0b79bfbff7
	.xword	0x293a19c0337c19f7
	.xword	0x0ea1020633b7ad1e
	.xword	0x1c122af57846fd10
	.xword	0xde43378c4012d183
	.xword	0xc756cf7bf1bfb24c
	.xword	0xff1b6c4ac8af1477
	.xword	0x73c44e1175b1c33e
	.xword	0xc48dcd6b2a8e7a5c
	.xword	0x3bdcbe51d6050e29
	.xword	0xd39da6dce573340d
	.xword	0xdcc18c65860de700
	.xword	0x094403d7cbaa9a99
	.xword	0xcef4910690d23474
	.xword	0x0213fc3558d19871
	.xword	0x11135f24671210e1
	.xword	0xc42cd6c71e1b91db
	.xword	0xa2f57e12bb4ace12
	.xword	0x83acb4b83d506f85
	.xword	0x7296b2117390e35b
	.xword	0x2c8368f5008578d8
	.xword	0x538ec43770643d07
	.xword	0x53a0d3283477b13d
	.xword	0xe865651958d75c2b
	.xword	0xa059a7c727358cca
	.xword	0x159866b6c8fefbbf
	.xword	0xd10f2903c6965df2
	.xword	0x424c5b71a8770bae
	.xword	0x3409ca57e33e794b
	.xword	0xb3864bb31843c69a
	.xword	0x93fe336090639103
	.xword	0x661c182d64267577
	.xword	0xc5b4343eeb6b05af
	.xword	0x512a8e0454250c20



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
	.xword	0xab7f7d69c3f9c27f
	.xword	0x714d4edf49c871a0
	.xword	0xe4ca4a44075b05a6
	.xword	0x4b447f0a0b35ac55
	.xword	0x5e503d659423a6d8
	.xword	0x402bc07929e2c7ca
	.xword	0x1f012b0445b9dc6a
	.xword	0xf68987561fb59688
	.xword	0x2ede4f817a71f43f
	.xword	0xdab8fce92da8b121
	.xword	0x6e27d5506efbd20f
	.xword	0x3b1a701cddaff8fe
	.xword	0x4e6b96aa60e012b6
	.xword	0x920ba99f5d19eb45
	.xword	0x05d4eebd31bc41f7
	.xword	0xcbb5aad1c3c5f6a1
	.xword	0xe0c128f08f6d4e98
	.xword	0x9b97b75e37652b03
	.xword	0xd3166a1d34b64bed
	.xword	0xab4cd8fd2073841d
	.xword	0xe75a26ac55412fa9
	.xword	0xb916435f4a4356b6
	.xword	0xf1b387db80a729f8
	.xword	0xdfef8b8ecd99bcc9
	.xword	0x3b32906d9164cd54
	.xword	0x7e65d7752d955da9
	.xword	0xeba645e06cac4522
	.xword	0xcddeba494e405205
	.xword	0x2a1170d237fd57dc
	.xword	0xd143b0eb70d715a2
	.xword	0x2de8644556e47dca
	.xword	0x30be099d8750afa7
	.xword	0x216af2e471f1701f
	.xword	0xafa340c4845f16be
	.xword	0x88835b017158d830
	.xword	0xabd8c72beea2d319
	.xword	0x0fc0b52ea5ca04c5
	.xword	0x29b9ee14f72bf237
	.xword	0xecf8791366acece8
	.xword	0x32d41ac95c11a09d
	.xword	0xc8acccab04dd5a33
	.xword	0xdc6d3aa473aefaa9
	.xword	0xad57ec9ce1a1b78f
	.xword	0x86168f02ecc91c13
	.xword	0x852e1977ebf7007e
	.xword	0x831033425534e26e
	.xword	0x5a317cfc3c318d02
	.xword	0x787223bf9b883155
	.xword	0xa6747f3e61500366
	.xword	0x2c91d6f9832d9266
	.xword	0x757029809a565cad
	.xword	0x60eaa627bbc3a2af
	.xword	0x834eb13bc37d1595
	.xword	0x467978fd014cbfd0
	.xword	0x57ccc1f575636878
	.xword	0x7327b6bf85976a42
	.xword	0xea87c9e95da1f014
	.xword	0x15849c842ec640de
	.xword	0xbb65822a2d9a0353
	.xword	0x3bce9d935c707551
	.xword	0x2e43c1079c2c3017
	.xword	0x68f6cc8671dac330
	.xword	0x15be330c527da6be
	.xword	0xa2e5d0e34852a708



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
	.xword	0xb67723f4bf194b6c
	.xword	0xd8f1a0e1f1dd2d3d
	.xword	0xa22a9d28b8324890
	.xword	0x80cf8ab1a633dc90
	.xword	0x87df5ac442a72230
	.xword	0xf0871e6c9214fe03
	.xword	0x14563afdc04f6236
	.xword	0x74ce971cb65fce88
	.xword	0x40b3a9929e7dce91
	.xword	0xf832dcc540ad8d8e
	.xword	0x0742a0deb1f5832f
	.xword	0xfd6e722b527ce0df
	.xword	0x578324ee394d4e48
	.xword	0x8743b036e3a77fba
	.xword	0x45ec3ca59cc47a03
	.xword	0xdac291583ac24aa5
	.xword	0x11272cb572ba1c31
	.xword	0xe909061c938be0bd
	.xword	0xc72be124625e0e30
	.xword	0x58fbae43870d0a11
	.xword	0xa74c0e44512c1891
	.xword	0x3e3179aece30a620
	.xword	0x6602e3482d29676c
	.xword	0xff7fbae32056b1ab
	.xword	0xc9880d39267b5465
	.xword	0x5c24d9fcf3a96ba3
	.xword	0xaf1977a14485dc5c
	.xword	0x2a84c610a985b4b0
	.xword	0x957863ed4e66783d
	.xword	0xf1a02b26bb59db5f
	.xword	0x27545fbba7029617
	.xword	0x6aa305fb450ef5e4
	.xword	0xbee5840807892d26
	.xword	0x62d91a4da83589cf
	.xword	0x5f18b31f52c1294c
	.xword	0xad7d31cf54269743
	.xword	0xa042726db21ee7b4
	.xword	0xcffbd91228782858
	.xword	0x9614e1faa087b563
	.xword	0x7ec0a2aa6259af33
	.xword	0x91ade278be9c904d
	.xword	0x62b5af0f877097da
	.xword	0x5581762a5d66576c
	.xword	0x08aa4c59c1490e65
	.xword	0x51d8ff046a80e830
	.xword	0x31cd3c726bbea047
	.xword	0xf9a1f8fd4755bb17
	.xword	0x925b66e7dbd530b8
	.xword	0xda81410562ba4036
	.xword	0x23eb1f9e80cc380b
	.xword	0xc2ec02faaba73e50
	.xword	0x770236caaf5593d3
	.xword	0xaa87986704b73206
	.xword	0x5be580012845f222
	.xword	0xb035830bfe672804
	.xword	0xeda6dde0a000b76e
	.xword	0xd17d50130294e356
	.xword	0x9cfc4f8feac04113
	.xword	0xea7bbf5dd4eccd52
	.xword	0x29e37568f1969619
	.xword	0x922de344a560e366
	.xword	0xb17e2cb697e3f44a
	.xword	0x25ff14ce86d67701
	.xword	0xedbebd5a1200b2c1



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
	.xword	0x47dd4383346a51dc
	.xword	0xe93d30d7284fe19f
	.xword	0x37ec20b096aa8939
	.xword	0xb5f1bfdcae2589d3
	.xword	0x5bc2046ec9ae2574
	.xword	0x169c903843e033d8
	.xword	0xeba8be5a549648c1
	.xword	0x0c57408484d4bdaa
	.xword	0x03f3a92b3c97a630
	.xword	0x18f014db92b149f1
	.xword	0xb0adcbb96d1f6bb9
	.xword	0x5e9018a4ee1b4dc5
	.xword	0xa34f6d2815336f85
	.xword	0x6d53e0d14edff446
	.xword	0x5a831e06a308dc2f
	.xword	0x6b12c2730cbf2c3d
	.xword	0x036d471f7170d7c7
	.xword	0xa603686adf18eee2
	.xword	0x1c1103bed4df8887
	.xword	0x52ca087097fc53ff
	.xword	0xb4464ca115eae55c
	.xword	0x6ea29daceae65299
	.xword	0x0a12608f89f268fd
	.xword	0xc8dee408192d4482
	.xword	0x302c76150d0fe872
	.xword	0xfefe5a9d52d3036a
	.xword	0x2c0e5e5abf896c1c
	.xword	0x4b158eda8d9a4ce2
	.xword	0x22fe0d9e71f6e41f
	.xword	0x5c4bb45feab85304
	.xword	0xd3a7316e73fc29cb
	.xword	0x9d60498b926d575d
	.xword	0x6bc86d52a05d0823
	.xword	0x9d280e1eb4dcd4f4
	.xword	0x99b391b79bacf6e1
	.xword	0x02cb2b5a97a55db9
	.xword	0xcc7c069b4e4ee4bc
	.xword	0x8ffe1582a9020ee9
	.xword	0xc48b77b50aad718e
	.xword	0xefa9ca512a8e8091
	.xword	0x6cde87a0091f7975
	.xword	0x5cad7fc841b71363
	.xword	0x85dea9029da7682e
	.xword	0x7556de48d782f685
	.xword	0xea2e09a6b0590abc
	.xword	0x8e404cac16ea9fab
	.xword	0xe678e3f0e3fa19ac
	.xword	0x9d0165e3ddbf3e2c
	.xword	0x4ead48746c0a697e
	.xword	0xd6ec0f5e3108a6b8
	.xword	0x730b45e8505ee3c7
	.xword	0xb0a4e3b2603a6163
	.xword	0x697094812559ee93
	.xword	0xdf05aed778579ef5
	.xword	0xa73f20d0d4071e84
	.xword	0xdbe182ef09efef25
	.xword	0x5af5f3e800aae8f8
	.xword	0xc62c3496534dcec5
	.xword	0xd7cbbaa156f5faac
	.xword	0x614806c05e040d57
	.xword	0x7de876da462602fc
	.xword	0x8cdd68e64b5fdc34
	.xword	0x4c29ca1b45eb044b
	.xword	0xc52b791f9fdf3c55



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
	.xword	0xfe8e9acdf4d9c081
	.xword	0x45676eeaa4d0757c
	.xword	0x6b85976e1b51262e
	.xword	0x7db47a5261f564e6
	.xword	0xeedac192b72dcb37
	.xword	0x263cd352dc2ee8f6
	.xword	0x7faa287220db5157
	.xword	0x925b736f7437ceca
	.xword	0xbc125e14d264e84b
	.xword	0x17ec6cb86587e6f8
	.xword	0xaa8034a6a1df2bf8
	.xword	0xca673465ce149ab8
	.xword	0xbd768072fab0850d
	.xword	0x00ef76b92f689f27
	.xword	0x6a822cafadfcc200
	.xword	0x93d63d19463f407b
	.xword	0x14a03474d33a4da0
	.xword	0x92893bf0c4add893
	.xword	0xa99d98d6b1702246
	.xword	0x4a33964f8d97186a
	.xword	0x1ec6276480f061fc
	.xword	0xf6a1ea036921ba92
	.xword	0x8b9cdb2d1c9e9719
	.xword	0xd282161b38d91f76
	.xword	0xded869bde21d5b55
	.xword	0x207642b07114c16e
	.xword	0x727fc1898c3ef0b7
	.xword	0x83ea14e0febef29e
	.xword	0xa6f67b7411eb2f95
	.xword	0x8f771800faee909c
	.xword	0xab620363e35df615
	.xword	0xd694feb1db399c43
	.xword	0x550c9f4468429baa
	.xword	0xca6ae7b1bf542c2b
	.xword	0xac65604056447429
	.xword	0x707e24ca41b015f4
	.xword	0x73429dca16c51734
	.xword	0xd072e31dad55a5d4
	.xword	0x8db62bbc4f30a98b
	.xword	0x4a81cb4bcdef69fd
	.xword	0xc0d6d61bec76baae
	.xword	0x93384d9fa8782f75
	.xword	0xee92e547d2677ee4
	.xword	0x99653648edb69c2e
	.xword	0x47705dc802b42c57
	.xword	0x5f16ada1f9050ea2
	.xword	0xc89cbe40741867d1
	.xword	0x435607f82b9822a3
	.xword	0x2df22a25cc6380dd
	.xword	0xe144a19e132b3470
	.xword	0x912fbde42fd9c7d2
	.xword	0xcf05919c2e2fec6d
	.xword	0x7853e489049a5224
	.xword	0x15e2e47e2a931a80
	.xword	0x98c3802c8c0ad095
	.xword	0xe8cb2580bcd0e53d
	.xword	0x579e1842e5659034
	.xword	0x02147f6c5773f0bf
	.xword	0x0b372856c1e38d51
	.xword	0x111aa545b3ae4cde
	.xword	0xcd2e4aacdcb8c228
	.xword	0x46f64c12152f4660
	.xword	0xf008ccfc2d1baf18
	.xword	0xb1af256172dc452f



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
	.xword	0xd9565e93e4989417
	.xword	0x0d02c623a7889275
	.xword	0x1f730c01d3645ca9
	.xword	0x1bc3cc1892e889f9
	.xword	0x0991f3b59fa9d28b
	.xword	0x4af30ee9e1973556
	.xword	0xed658277eeb0b8f8
	.xword	0x03f233d3d7de570b
	.xword	0xee92d3b8bdfcd57c
	.xword	0x204ab2495f123ca1
	.xword	0xb397d59a55b7ac7f
	.xword	0xc4a6cbf18ca66948
	.xword	0xe0e44402274e853b
	.xword	0x8f27e91393da4dba
	.xword	0x0974d10d67d0fad7
	.xword	0x54b6ab24139d7e8a
	.xword	0x39c4773ee6055f5e
	.xword	0x75c5c5e8270895f5
	.xword	0x394c58aa397ae2e0
	.xword	0x113ef9c29f4fb7af
	.xword	0xe81ba69da4d46d8a
	.xword	0xb3fe2e38de7a9763
	.xword	0x93180d2e19650152
	.xword	0xac78c3b1a6277c41
	.xword	0xf356a194648f9e6e
	.xword	0xd78fa41329a43f68
	.xword	0xcc5cedf3a40ade4e
	.xword	0x1717b1408bb4cd18
	.xword	0xc088bb1ad6276bae
	.xword	0xb45447d4873bd979
	.xword	0x34ef491308301338
	.xword	0xb50a97ff8a87edbb
	.xword	0x3538d90c73575240
	.xword	0x86d10a7b110109ea
	.xword	0xb0521273a7dbc1fe
	.xword	0x7a0fa8eff7be3340
	.xword	0xc66bf9fc2cf2a393
	.xword	0x05f24f0e261e6907
	.xword	0x13a73e6a79c24fc9
	.xword	0xb0b9d05f34ad686f
	.xword	0x16d0e89212642420
	.xword	0xcb60a62a5bb0ddab
	.xword	0x16cca5435b6bc49c
	.xword	0x522e6f6658f3f6bf
	.xword	0x5ecd3f0260ff6eb3
	.xword	0xea9a2de0250fbb83
	.xword	0xd690466f8f46629c
	.xword	0xf5e8f34f5bf1360f
	.xword	0x8b33b684993673e7
	.xword	0x2af7d9a3d2e79842
	.xword	0xe3a7220aac650898
	.xword	0x5104c9063ffe7251
	.xword	0xb787383ab394bc43
	.xword	0xa2930cef44866e06
	.xword	0x0d70b7f38f65aaa1
	.xword	0x8d1f9649117b20e4
	.xword	0x9b6276914114df58
	.xword	0x010c97f339354dae
	.xword	0xd0a769c8c422ff41
	.xword	0x64ccdf78eb904dc3
	.xword	0x9d8c59842ee65f20
	.xword	0xba6a0d37fae5fdb8
	.xword	0xb9f5591aa5ec76b6
	.xword	0x23497c469c817540



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
	.xword	0xdf4a3730bb43013b
	.xword	0x1ca8e708a48fa28d
	.xword	0x16bbdea29eb06b3f
	.xword	0x0389f804d5a3901a
	.xword	0x05a2f69577b66b4d
	.xword	0x9cf460d261555bdc
	.xword	0xbc42894c929a713d
	.xword	0xe29e5647d362a81a
	.xword	0xe164f79945c6f746
	.xword	0x3195682b91f91b96
	.xword	0xef63c198a25ffc7b
	.xword	0x1a54b187378b93df
	.xword	0x362709a40db4f6b0
	.xword	0x0312cb21cf6be33b
	.xword	0xc14238fb7bfcc6b4
	.xword	0x35c142412de7fbe0
	.xword	0xd83f8f15359aa4d4
	.xword	0x329adac4f4812e61
	.xword	0xb2804090105454db
	.xword	0xe460ad01b4e59171
	.xword	0x2fe5868e7cc9ce2b
	.xword	0x1115af721a4eb42e
	.xword	0xa3c50bc553f34277
	.xword	0x2feca790a6edd0f2
	.xword	0xf16e0fdcd293918a
	.xword	0x5963e4183ff51261
	.xword	0xc340c61458499bc7
	.xword	0x422dfab382a96fe1
	.xword	0x8f256116b7d76c99
	.xword	0xe4cb4f59c7e7e7ba
	.xword	0x8df3dbd9bde48ac4
	.xword	0x0de2e6c329c17cca
	.xword	0x339f0585ca24ae74
	.xword	0x66e63e244ba62fe1
	.xword	0x6b60919eed7dce82
	.xword	0x3f6ceb800db9eee3
	.xword	0x9350511283ec9496
	.xword	0xdf7d7cf8624fbe05
	.xword	0x8ff88820240f9001
	.xword	0x279e635df772d97d
	.xword	0xd3b40f95d00f9594
	.xword	0xd8c8c96b17ef08fc
	.xword	0x25ddfa9d08ac2542
	.xword	0x3f7dc3ea52146d20
	.xword	0x10e4b00d055bcc7a
	.xword	0xfc3cf327b47322a2
	.xword	0x4dfd7782711e9aa4
	.xword	0xc01d317b1e45f189
	.xword	0xec52f84d3a644460
	.xword	0x452a7e6ca9a14db7
	.xword	0x253ed935b9dd650e
	.xword	0x03e5ab121a7cb887
	.xword	0x607ee49157d7f3ca
	.xword	0xb7cbccbe4cc31f08
	.xword	0x8708865b64e35464
	.xword	0x2ab0a982bc4175fa
	.xword	0xfca085061699a983
	.xword	0xa71923f851d16f16
	.xword	0xb9fc6c3fb47b162c
	.xword	0xf350e287e52afe56
	.xword	0x8dbd53afc3b25c2e
	.xword	0xf92815b7c77d4b4c
	.xword	0x57c0b9a100b932aa
	.xword	0xb17d1b19e2499a1b



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
	.xword	0x844f08a806494a34
	.xword	0x2cf0244eb1a243af
	.xword	0x13a7b7e0df6ca906
	.xword	0x1b1be9d6998eca97
	.xword	0x12704f1400089047
	.xword	0x5a4774319854e79d
	.xword	0xd70f29beb6a12d71
	.xword	0x8b6d7cc5c3b6f7be
	.xword	0x2fc2363da0f72897
	.xword	0xa569807407986f59
	.xword	0x78ed5ea293b346f7
	.xword	0x4e7239ff60087c29
	.xword	0xa73e4f0dcd384211
	.xword	0x2f6148c697ea1928
	.xword	0xcef54c5953ef01da
	.xword	0x7a0fcc1e6990fe90
	.xword	0x3a44ac17e45224a1
	.xword	0xd383f6aed0d8dd70
	.xword	0xba666a313cb62648
	.xword	0x648f3d781e2713cb
	.xword	0xd898a037fea5fb9c
	.xword	0x480c3569683ddefe
	.xword	0xd8ef8499d836851e
	.xword	0xd82eea97f24dcb3b
	.xword	0x807af87745402783
	.xword	0x81c8743d271b83f9
	.xword	0x53aa39e7ba381640
	.xword	0xb96b60052559fa80
	.xword	0xeb81e75d5aa6d88f
	.xword	0xa02b4812f99a583c
	.xword	0x51595275f9c5a2fd
	.xword	0x5b2f18677c3846cd
	.xword	0x1e7a3130b8ab7237
	.xword	0x8d00ea07a4df15f5
	.xword	0x30904c18412deb61
	.xword	0xfb22665d1c870687
	.xword	0xb6ecd933031ec165
	.xword	0xac6d6dae3127b12b
	.xword	0x72f3166fe7166aba
	.xword	0x5c59fad5a48f45c9
	.xword	0x8a96dbec7bf2a52b
	.xword	0xce2c562503f9e3a5
	.xword	0xb3b93959850117b5
	.xword	0x6341043128ebc29f
	.xword	0xb40a212c7053b976
	.xword	0xb33d6cbc973ec2ad
	.xword	0x955368442f273e69
	.xword	0xed47999e0e9ba5e7
	.xword	0xffd4baba8ad57bec
	.xword	0x9b5cf2c7a4257930
	.xword	0x1c3e0b71d579bbe2
	.xword	0xd0f0fe0fc2df05ac
	.xword	0x53e9a0194896e7fa
	.xword	0x4dd08b024329ae9b
	.xword	0x06631f7b8e556dd0
	.xword	0x7103d1b76b479db7
	.xword	0x22e50246ab91819e
	.xword	0x438248b867335e79
	.xword	0x00a7eb245c848c13
	.xword	0x4a5a16bf24c0be71
	.xword	0x078682c45bf01813
	.xword	0x0e77d97d9ee10a61
	.xword	0xbdf6cf6019a2b26a
	.xword	0x248926db04258a7f



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
	.xword	0x13c3240dfeca3200
	.xword	0x36ae69107dc74b4a
	.xword	0xe945c5d545a90b44
	.xword	0x2318d4303093f5f1
	.xword	0x20224e458aad215f
	.xword	0x46c7ef073f7fb920
	.xword	0x57970622b4b5ac83
	.xword	0x7501d4014137a6df
	.xword	0xfe736adc4e4876ef
	.xword	0xa24197bb3de898a0
	.xword	0xce05fa9baf8cd2a7
	.xword	0xcfc1062bcc3fe1e9
	.xword	0x457a15d0b63ce437
	.xword	0x831c9e86a69e0368
	.xword	0xcfde95583fd791f2
	.xword	0xd4b19ff5031817d4
	.xword	0x6934588dc54be11f
	.xword	0x4cd5ba6ca842e346
	.xword	0xbcb8170204e36df5
	.xword	0x0a7ed8f50ca20925
	.xword	0xbf853477453572c0
	.xword	0xf645f1bbd3d027e8
	.xword	0x87f58b74349f8f37
	.xword	0xb6e6e9126218583d
	.xword	0x1a1f09b6fc3f68ad
	.xword	0x4dd2d810c98d262a
	.xword	0x6c527eb746eca242
	.xword	0x6fe0ac566c3e3fa0
	.xword	0xadd1a41585c74532
	.xword	0xc710b17b3dde8031
	.xword	0xafeab8415df8d30b
	.xword	0xa39b14f2a0c0964e
	.xword	0xf2b3f3b7063dc675
	.xword	0x62abf0d797c33088
	.xword	0xce45a049cdfd37b2
	.xword	0x7cb1f5d67209fb99
	.xword	0xb05df2e83ece09c9
	.xword	0x3e96d5f6d98502b5
	.xword	0xde346ec1dd0f2d48
	.xword	0x3151af8c4929002f
	.xword	0xe896503b5da82692
	.xword	0x0e52cc7bf213dc0e
	.xword	0xa5b901907b11dd5e
	.xword	0x89b1a331df1647ab
	.xword	0x0ef9929f72b27f3e
	.xword	0x0c7f43fecb8e6cb6
	.xword	0xfba5b7cfb6fb18bf
	.xword	0x87dec77068e50c04
	.xword	0x5224812f4aa27f58
	.xword	0xf26092bb5a4d0a0d
	.xword	0x2be61ed0d57eadc5
	.xword	0x7d4e638c38a5d07e
	.xword	0x58626d0b14efb39c
	.xword	0xe915a0e5ed8c3776
	.xword	0x55070fa1a15cd465
	.xword	0xbe2a6f0299a55d6e
	.xword	0xe9503e74ecfe1d77
	.xword	0xfb857437aa7f344b
	.xword	0x24c12aac93a4d2ad
	.xword	0xb9e8b85058fcaa6f
	.xword	0xd22bcb8028e5c0ee
	.xword	0xcb414a917bc20645
	.xword	0x9b8b5c619a4e94fc
	.xword	0x7a18ce49c9857242



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
!!# 
!!# %%
!!# %%section control
!!# 
!!# %%
!!# %%section init
!!# {
!!# 
!!# 
!!#   IJ_set_rvar ("diag.j", 106, rv_0, "{11}");
!!# 
!!#   IJ_set_rvar ("diag.j", 109, Rv_rand64, "64'hrrrr rrrr rrrr rrrr");
!!#   IJ_set_rvar ("diag.j", 110, Rv_Simm13, "13'b0 0000 00rr r000");
!!#   IJ_set_rvar ("diag.j", 111, Rv_addr_sel, "3'brrr");
!!# 
!!#   IJ_set_rvar ("diag.j", 115, Rv_memaddr_pattern_dma,
!!#         "24'{0},"
!!# 
!!#         "20'b 000r rrrr rrrr rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rr00 0000,");
!!# 
!!#   ! only 60* or 61*
!!#   IJ_set_rvar ("diag.j", 124, Rv_memaddr_pattern_io,
!!#         "4'{0},"
!!# 
!!#         "20'b 0000 0000 0000 0000 0110,"
!!#         "20'b 000r rrrr rrrr rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rr00 0000,");
!!# 
!!#   IJ_set_rvar ("diag.j", 133, Rv_rand32, "32'hrrrr rrrr");
!!#   IJ_set_rvar ("diag.j", 134, Rv_rand_mask, "32'h0000 rrrr");
!!# 
!!#   IJ_set_rvar ("diag.j", 137, Rv_memaddr_pattern,
!!#         "24'{0},"
!!# 
!!#         "20'b 0001 0000 rrrr 0000 0001,"
!!#         "20'{0}");
!!# 
!!#   ! Define address patterns for all the various address
!!#   ! spaces in JBI
!!# 
!!#   ! 80_1000_0000 - 80_FFFF_FFFF (Should not be 80_0*)
!!#   IJ_set_rvar ("diag.j", 148, Rv_jbiaddr_pattern0,
!!#         "24'{0},"
!!# 
!!#         "20'b 1000 0000 rrrr rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr r000,");
!!# 
!!#   ! 80_0E00_0000 - 80_0EFF_FFFF
!!#   IJ_set_rvar ("diag.j", 157, Rv_jbiaddr_pattern1,
!!#         "24'{0},"
!!# 
!!#         "20'b 1000 0000 0000 1110 rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr r000,");
!!# 
!!#   ! 80_0F00_0000 - 80_0FFF_FFFF
!!#   IJ_set_rvar ("diag.j", 167, Rv_jbiaddr_pattern2,
!!#         "24'{0},"
!!# 
!!#         "20'b 1000 0000 0000 1111 rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr r000,");
!!# 
!!#   ! C0_0000_0000 - CF_FFFF_FFFF
!!#   IJ_set_rvar ("diag.j", 177, Rv_jbiaddr_pattern3,
!!#         "24'{0},"
!!# 
!!#         "20'b 1100 rrrr rrrr rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr r000,");
!!# 
!!#   ! D0_0000_0000 - DF_FFFF_FFFF
!!#   IJ_set_rvar ("diag.j", 187, Rv_jbiaddr_pattern4,
!!#         "24'{0},"
!!# 
!!#         "20'b 1101 rrrr rrrr rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr r000,");
!!# 
!!#   ! E0_0000_0000 - EF_FFFF_FFFF
!!#   IJ_set_rvar ("diag.j", 197, Rv_jbiaddr_pattern5,
!!#         "24'{0},"
!!# 
!!#         "20'b 1110 rrrr rrrr rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr r000,");
!!# 
!!#   ! F0_0000_0000 - FE_FFFF_FFFF ( Should not be FF*)
!!#   IJ_set_rvar ("diag.j", 207, Rv_jbiaddr_pattern6,
!!#         "24'{0},"
!!# 
!!#         "20'b 1111 rrrr rrrr rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr r000,");
!!# 
!!#   ! FF_F000_0000 - FF_FFFF_FFFF 
!!#   IJ_set_rvar ("diag.j", 217, Rv_ssiaddr_pattern,
!!#         "24'{0},"
!!# 
!!#         "20'b 1111 1111 1111 rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr r000,");
!!# 
!!#   ! BYTE ALIGNED
!!# 
!!#   ! 80_1000_0000 - 80_FFFF_FFFF (Should not be 80_0*)
!!#   IJ_set_rvar ("diag.j", 228, Rv_jbi_b_addr_pattern0,
!!#         "24'{0},"
!!# 
!!#         "20'b 1000 0000 rrrr rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr rrrr,");
!!# 
!!#   ! 80_0E00_0000 - 80_0EFF_FFFF
!!#   IJ_set_rvar ("diag.j", 237, Rv_jbi_b_addr_pattern1,
!!#         "24'{0},"
!!# 
!!#         "20'b 1000 0000 0000 1110 rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr rrrr,");
!!# 
!!#   ! 80_0F00_0000 - 80_0FFF_FFFF
!!#   IJ_set_rvar ("diag.j", 247, Rv_jbi_b_addr_pattern2,
!!#         "24'{0},"
!!# 
!!#         "20'b 1000 0000 0000 1111 rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr rrrr,");
!!# 
!!#   ! C0_0000_0000 - CF_FFFF_FFFF
!!#   IJ_set_rvar ("diag.j", 257, Rv_jbi_b_addr_pattern3,
!!#         "24'{0},"
!!# 
!!#         "20'b 1100 rrrr rrrr rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr rrrr,");
!!# 
!!#   ! D0_0000_0000 - DF_FFFF_FFFF
!!#   IJ_set_rvar ("diag.j", 267, Rv_jbi_b_addr_pattern4,
!!#         "24'{0},"
!!# 
!!#         "20'b 1101 rrrr rrrr rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr rrrr,");
!!# 
!!#   ! E0_0000_0000 - EF_FFFF_FFFF
!!#   IJ_set_rvar ("diag.j", 277, Rv_jbi_b_addr_pattern5,
!!#         "24'{0},"
!!# 
!!#         "20'b 1110 rrrr rrrr rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr rrrr,");
!!# 
!!#   ! F0_0000_0000 - FE_FFFF_FFFF ( Should not be FF*)
!!#   IJ_set_rvar ("diag.j", 287, Rv_jbi_b_addr_pattern6,
!!#         "24'{0},"
!!# 
!!#         "20'b 1111 rrrr rrrr rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr rrrr,");
!!# 
!!#   ! FF_F000_0000 - FF_FFFF_FFFF 
!!#   IJ_set_rvar ("diag.j", 297, Rv_ssi_b_addr_pattern,
!!#         "24'{0},"
!!# 
!!#         "20'b 1111 1111 1111 rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr rrrr,");
!!# 
!!#   ! HWORD ADDRESS
!!# 
!!#   ! 80_1000_0000 - 80_FFFF_FFFF (Should not be 80_0*)
!!#   IJ_set_rvar ("diag.j", 309, Rv_jbi_h_addr_pattern0,
!!#         "24'{0},"
!!# 
!!#         "20'b 1000 0000 rrrr rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr rrr0,");
!!# 
!!#   ! 80_0E00_0000 - 80_0EFF_FFFF
!!#   IJ_set_rvar ("diag.j", 318, Rv_jbi_h_addr_pattern1,
!!#         "24'{0},"
!!# 
!!#         "20'b 1000 0000 0000 1110 rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr rrr0,");
!!# 
!!#   ! 80_0F00_0000 - 80_0FFF_FFFF
!!#   IJ_set_rvar ("diag.j", 328, Rv_jbi_h_addr_pattern2,
!!#         "24'{0},"
!!# 
!!#         "20'b 1000 0000 0000 1111 rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr rrr0,");
!!# 
!!#   ! C0_0000_0000 - CF_FFFF_FFFF
!!#   IJ_set_rvar ("diag.j", 338, Rv_jbi_h_addr_pattern3,
!!#         "24'{0},"
!!# 
!!#         "20'b 1100 rrrr rrrr rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr rrr0,");
!!# 
!!#   ! D0_0000_0000 - DF_FFFF_FFFF
!!#   IJ_set_rvar ("diag.j", 348, Rv_jbi_h_addr_pattern4,
!!#         "24'{0},"
!!# 
!!#         "20'b 1101 rrrr rrrr rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr rrr0,");
!!# 
!!#   ! E0_0000_0000 - EF_FFFF_FFFF
!!#   IJ_set_rvar ("diag.j", 358, Rv_jbi_h_addr_pattern5,
!!#         "24'{0},"
!!# 
!!#         "20'b 1110 rrrr rrrr rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr rrr0,");
!!# 
!!#   ! F0_0000_0000 - FE_FFFF_FFFF ( Should not be FF*)
!!#   IJ_set_rvar ("diag.j", 368, Rv_jbi_h_addr_pattern6,
!!#         "24'{0},"
!!# 
!!#         "20'b 1111 rrrr rrrr rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr rrr0,");
!!# 
!!#   ! FF_F000_0000 - FF_FFFF_FFFF 
!!#   IJ_set_rvar ("diag.j", 378, Rv_ssi_h_addr_pattern,
!!#         "24'{0},"
!!# 
!!#         "20'b 1111 1111 1111 rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr rrr0,");
!!# 
!!#   ! WORD Address
!!# 
!!#   ! 80_1000_0000 - 80_FFFF_FFFF (Should not be 80_0*)
!!#   IJ_set_rvar ("diag.j", 389, Rv_jbi_w_addr_pattern0,
!!#         "24'{0},"
!!# 
!!#         "20'b 1000 0000 rrrr rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr rr00,");
!!# 
!!#   ! 80_0E00_0000 - 80_0EFF_FFFF
!!#   IJ_set_rvar ("diag.j", 398, Rv_jbi_w_addr_pattern1,
!!#         "24'{0},"
!!# 
!!#         "20'b 1000 0000 0000 1110 rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr rr00,");
!!# 
!!#   ! 80_0F00_0000 - 80_0FFF_FFFF
!!#   IJ_set_rvar ("diag.j", 408, Rv_jbi_w_addr_pattern2,
!!#         "24'{0},"
!!# 
!!#         "20'b 1000 0000 0000 1111 rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr rr00,");
!!# 
!!#   ! C0_0000_0000 - CF_FFFF_FFFF
!!#   IJ_set_rvar ("diag.j", 418, Rv_jbi_w_addr_pattern3,
!!#         "24'{0},"
!!# 
!!#         "20'b 1100 rrrr rrrr rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr rr00,");
!!# 
!!#   ! D0_0000_0000 - DF_FFFF_FFFF
!!#   IJ_set_rvar ("diag.j", 428, Rv_jbi_w_addr_pattern4,
!!#         "24'{0},"
!!# 
!!#         "20'b 1101 rrrr rrrr rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr rr00,");
!!# 
!!#   ! E0_0000_0000 - EF_FFFF_FFFF
!!#   IJ_set_rvar ("diag.j", 438, Rv_jbi_w_addr_pattern5,
!!#         "24'{0},"
!!# 
!!#         "20'b 1110 rrrr rrrr rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr rr00,");
!!# 
!!#   ! F0_0000_0000 - FE_FFFF_FFFF ( Should not be FF*)
!!#   IJ_set_rvar ("diag.j", 448, Rv_jbi_w_addr_pattern6,
!!#         "24'{0},"
!!# 
!!#         "20'b 1111 rrrr rrrr rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr rr00,");
!!# 
!!#   ! FF_F000_0000 - FF_FFFF_FFFF 
!!#   IJ_set_rvar ("diag.j", 458, Rv_ssi_w_addr_pattern,
!!#         "24'{0},"
!!# 
!!#         "20'b 1111 1111 1111 rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr rr00,");
!!# 
!!#   ! Other  cases ?? when LOW TH and HG TH are random, HI>LO always (TBD)
!!# 
!!#   IJ_set_rvar ("diag.j", 467, Rv_jbi_fifo_wr0_config,
!!#         "24'{0},"
!!# 
!!#         "20'b 0000 0000 0rrr 0rrr 00rr,"
!!#         "20'b 00rr rrrr 0000 0000 rrrr,");
!!# 
!!#   IJ_set_rvar ("diag.j", 475, Rv_jbi_fifo_wr1_config,
!!#         "24'{0},"
!!# 
!!#         "20'b 0000 0000 0rrr 0rrr 00rr,"
!!#         "20'b 00rr rrrr 1rrr 0000 rrrr,");
!!# 
!!#   IJ_set_ropr_fld    ("diag.j", 483, ijdefault, Ft_Rs1, "{9}");  ! BASE
!!#   IJ_set_ropr_fld    ("diag.j", 484, ijdefault, Ft_Rs2, "{8}");
!!#   IJ_set_ropr_fld    ("diag.j", 485, ijdefault, Ft_Rd, "{16..23}");
!!# 
!!#   !IJ_set_ropr_fld    (ijdefault, Ft_Simm13, "13'b0 0000 0000 0000");
!!#   IJ_set_ropr_fld    ("diag.j", 488, ijdefault, Ft_Simm13, "13'b0 00rr 0000 0000");
!!# 
!!#   IJ_bind_file_group("diag.j", 492, sjm_4,"sjm_4.cmd", NULL);;
!!#   IJ_bind_file_group("diag.j", 493, sjm_5,"sjm_5.cmd", NULL);;
!!# 
!!#   IJ_bind_thread_group("diag.j", 496, th_M, 0x1);
!!# 
!!#   IJ_printf ("diag.j", 498, sjm_4, "CONFIG id=28 iosyncadr=0x7CF00BEEF00\n");
!!#   IJ_printf ("diag.j", 499, sjm_4, "TIMEOUT 10000000\n");
!!#   IJ_printf ("diag.j", 500, sjm_4, "IOSYNC\n");
!!# 
!!#   IJ_printf ("diag.j", 502, sjm_4, "#==================================================\n");
!!#   IJ_printf ("diag.j", 504, sjm_4, "#==================================================\n");
!!#   IJ_printf ("diag.j", 505, sjm_4, "\n\nLABEL_0:\n");
!!# 
!!#   IJ_printf ("diag.j", 507, sjm_5, "CONFIG id=30 iosyncadr=0x7EF00BEEF00\n");
!!#   IJ_printf ("diag.j", 508, sjm_5, "TIMEOUT 10000000\n");
!!#   IJ_printf ("diag.j", 509, sjm_5, "IOSYNC\n");
!!#   IJ_printf ("diag.j", 510, sjm_5, "#==================================================\n");
!!#   IJ_printf ("diag.j", 512, sjm_5, "#==================================================\n");
!!#   IJ_printf ("diag.j", 513, sjm_5, "\n\nLABEL_0:\n");
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
!!# 
!!#   IJ_printf ("diag.j", 546, sjm_4, "\n\nBA LABEL_0\n");
!!#   IJ_printf ("diag.j", 547, sjm_5, "\n\nBA LABEL_0\n");
!!#   int i,j;
!!#   ! Do this else midas wont put any tsbs for the above.
!!#   for (i = 0; i < 16; i++) {
!!#     IJ_iseg_printf("diag.j", 551,ISEG, i, th_M, ".data\n");
!!#     for (j = 0; j < 64; j++) {
!!#     IJ_iseg_printf("diag.j", 553,ISEG, i, th_M, "\t.xword\t0x%016llrx\n", Rv_rand64);
!!#     }
!!#   }
!!# 
!!#   IJ_th_start ("diag.j", 558,Seq_Start, NULL, 2);
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
!!# 		IJ_generate ("diag.j", 686, th_M, $2);
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
!!#                    IJ_printf ("diag.j", 714, sjm_4, "\n");
!!#                      sjm4_cnt++;
!!# 
!!#                      sj4_ad =  IJ_get_rvar_val64("diag.j", 717, Rv_memaddr_pattern_dma);
!!#                      sjm0_addr[sjm_wr0] = sj4_ad; 
!!#                      IJ_printf ("diag.j", 719, sjm_4, "WRITEBLK  0x%016llx +\n",sj4_ad);
!!#                      IJ_update_rvar("diag.j", 720, Rv_memaddr_pattern_dma);
!!# 
!!#                       for (i=0;i<16;i++) { 
!!#                          !IJ_printf (sjm_4, "# debug %d \n",i);
!!#                          sjm0_data[sjm_wr0][i] = IJ_get_rvar_val32("diag.j", 724, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 725, Rv_rand32);
!!#                          if (i%4 == 0) {IJ_printf ("diag.j", 726, sjm_4, "        "); }
!!#                          IJ_printf ("diag.j", 727, sjm_4, "0x%08x ",sjm0_data[sjm_wr0][i]);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 729, sjm_4, "\n"); else 
!!#                             IJ_printf ("diag.j", 730, sjm_4, "+\n");
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
!!#                    IJ_printf ("diag.j", 743, sjm_4, "\n");
!!#                      sjm4_cnt--;
!!# 
!!#                      sj4_ad = sjm0_addr[sjm_rd0];
!!#                      IJ_printf ("diag.j", 748, sjm_4, "READBLK  0x%016llx +\n",sj4_ad);
!!# 
!!#                       for (i=0;i<16;i++) { 
!!#                          sjm4_dat = sjm0_data[sjm_rd0][i];
!!#                          if (i%4 == 0) IJ_printf ("diag.j", 752, sjm_4, "        ");
!!#                          IJ_printf ("diag.j", 753, sjm_4, "0x%08x ",sjm4_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 755, sjm_4, "\n"); else 
!!#                             IJ_printf ("diag.j", 756, sjm_4, "+\n");
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
!!#                    IJ_printf ("diag.j", 770, sjm_4, "\n");
!!#                      !sjm4_cnt--;
!!# 
!!#  		     sjm0_w_mask =  IJ_get_rvar_val32("diag.j", 774, Rv_rand_mask);
!!#                      IJ_update_rvar("diag.j", 775, Rv_rand_mask);
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
!!#                      IJ_printf ("diag.j", 792, sjm_4, "WRITEMSK  0x%016llx 0x%016llx +\n",sj4_ad,mask);
!!# 
!!#                       m_tmp = sjm0_w_mask;
!!#                       for (i=0;i<16;i++) { 
!!#                        if (m_tmp & 0x1 ) {
!!#                          sjm0_data[sjm_rd0][i] = IJ_get_rvar_val32("diag.j", 797, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 798, Rv_rand32);
!!#                          sjm4_dat = sjm0_data[sjm_rd0][i];
!!#                          if (i%4 == 0) IJ_printf ("diag.j", 800, sjm_4, "        ");
!!#                          IJ_printf ("diag.j", 801, sjm_4, "0x%08x ",sjm4_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 803, sjm_4, "\n"); else 
!!#                             IJ_printf ("diag.j", 804, sjm_4, "+\n");
!!#                            }
!!#                         } else {
!!#                          !sjm4_dat = sjm0_data[sjm_rd0][i];
!!#                          sjm4_dat = 0;
!!#                          if (i%4 == 0) IJ_printf ("diag.j", 809, sjm_4, "        ");
!!#                          IJ_printf ("diag.j", 810, sjm_4, "0x%08x ",sjm4_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 812, sjm_4, "\n"); else 
!!#                             IJ_printf ("diag.j", 813, sjm_4, "+\n");
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
!!#                    IJ_printf ("diag.j", 830, sjm_4, "\n");
!!#                      sjm4_cnt_io++;
!!# 
!!#                      sj4_ad =  IJ_get_rvar_val64("diag.j", 833, Rv_memaddr_pattern_io);
!!#                      sjm0_addr_io[sjm_wr0_io] = sj4_ad; 
!!#                      IJ_printf ("diag.j", 835, sjm_4, "WRITEBLKIO  0x%016llx +\n",sj4_ad);
!!#                      IJ_update_rvar("diag.j", 836, Rv_memaddr_pattern_io);
!!# 
!!#                       for (i=0;i<16;i++) { 
!!#                          !IJ_printf (sjm_4, "# debug %d \n",i);
!!#                          sjm0_data_io[sjm_wr0_io][i] = IJ_get_rvar_val32("diag.j", 840, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 841, Rv_rand32);
!!#                          if (i%4 == 0) {IJ_printf ("diag.j", 842, sjm_4, "        "); }
!!#                          IJ_printf ("diag.j", 843, sjm_4, "0x%08x ",sjm0_data_io[sjm_wr0_io][i]);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 845, sjm_4, "\n"); else 
!!#                             IJ_printf ("diag.j", 846, sjm_4, "+\n");
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
!!#                    IJ_printf ("diag.j", 859, sjm_4, "\n");
!!#                      sjm4_cnt_io--;
!!# 
!!#                      sj4_ad = sjm0_addr_io[sjm_rd0_io];
!!#                      IJ_printf ("diag.j", 864, sjm_4, "READBLKIO  0x%016llx +\n",sj4_ad);
!!# 
!!#                       for (i=0;i<16;i++) { 
!!#                          sjm4_dat = sjm0_data_io[sjm_rd0_io][i];
!!#                          if (i%4 == 0) IJ_printf ("diag.j", 868, sjm_4, "        ");
!!#                          IJ_printf ("diag.j", 869, sjm_4, "0x%08x ",sjm4_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 871, sjm_4, "\n"); else 
!!#                             IJ_printf ("diag.j", 872, sjm_4, "+\n");
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
!!#                    IJ_printf ("diag.j", 887, sjm_4, "\n");
!!#                      sjm4_cnt_io1++;
!!# 
!!#                      sj4_ad =  IJ_get_rvar_val64("diag.j", 890, Rv_memaddr_pattern_io);
!!#                      sjm0_addr_io1[sjm_wr0_io1] = sj4_ad; 
!!#                      IJ_printf ("diag.j", 892, sjm_4, "WRITEIO  0x%016llx ",sj4_ad);
!!#                      IJ_update_rvar("diag.j", 893, Rv_memaddr_pattern_io);
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
!!#                       IJ_printf ("diag.j", 908, sjm_4, "%d ",b_sz);
!!#                       for (i=0;i<4;i++) { 
!!#                          !IJ_printf (sjm_4, "# debug %d \n",i);
!!#                          sjm0_data_io1[sjm_wr0_io1][i] = IJ_get_rvar_val32("diag.j", 911, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 912, Rv_rand32);
!!#                          IJ_printf ("diag.j", 913, sjm_4, "0x%08x ",sjm0_data_io1[sjm_wr0_io1][i]);
!!#                          if((i==0) && ((b_sz == 1) | (b_sz == 2) | (b_sz == 4)) ) break; 
!!#                          if((i==1) && (b_sz == 8)) break; 
!!#                       }
!!#                       if ( random()%2 == 0) {
!!#                       IJ_printf ("diag.j", 918, sjm_4, "\n");
!!#                       } else {
!!#                       IJ_printf ("diag.j", 920, sjm_4, "\n");
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
!!#                    IJ_printf ("diag.j", 934, sjm_4, "\n");
!!#                      sjm4_cnt_io1--;
!!# 
!!#                      sj4_ad = sjm0_addr_io1[sjm_rd0_io1];
!!#                      b_sz   = sjm0_data_io1[sjm_rd0_io1][15];
!!#                      IJ_printf ("diag.j", 940, sjm_4, "READIO  0x%016llx %d ",sj4_ad,b_sz);
!!# 
!!#                       for (i=0;i<4;i++) {
!!#                          sjm4_dat = sjm0_data_io1[sjm_rd0_io1][i];
!!#                          IJ_printf ("diag.j", 944, sjm_4, "0x%08x ",sjm4_dat);
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
!!#                    IJ_printf ("diag.j", 959, sjm_4, "\n");
!!# 
!!#                      sj4_ad =  IJ_get_rvar_val64("diag.j", 961, Rv_memaddr_pattern_io);
!!#                      sjm0_addr_m_io[sjm_wr0_m_io] = sj4_ad; 
!!#                      IJ_update_rvar("diag.j", 963, Rv_memaddr_pattern_io);
!!# 
!!#                      sjm4_cnt_m_io++;
!!# 
!!#  		     sjm0_w_mask_m_io =  IJ_get_rvar_val32("diag.j", 969, Rv_rand_mask);
!!#                      IJ_update_rvar("diag.j", 970, Rv_rand_mask);
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
!!#                      IJ_printf ("diag.j", 997, sjm_4, "WRITEMSKIO  0x%016llx 0x%04x  ",sj4_ad,mask);
!!#                      sjm0_data_m_io[sjm_wr0_m_io][15] = mask; ! data fifo , 15 stores address
!!# 
!!#                       m_tmp = sjm0_w_mask_m_io & 0xf;
!!#                       for (i=0;i<4;i++) { 
!!#                        if (m_tmp & 0x1 ) {
!!#                          sjm0_data_m_io[sjm_wr0_m_io][i] = IJ_get_rvar_val32("diag.j", 1003, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 1004, Rv_rand32);
!!#                          sjm4_dat = sjm0_data_m_io[sjm_wr0_m_io][i];
!!#                          !if (i%4 == 0) IJ_printf (sjm_4, "        ");
!!#                          IJ_printf ("diag.j", 1007, sjm_4, "0x%08x ",sjm4_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                              IJ_printf ("diag.j", 1009, sjm_4, "\n"); 
!!#                             !if (i==15 ) IJ_printf (sjm_4, "\n"); else 
!!#                             !IJ_printf (sjm_4, "+\n");
!!#                            }
!!#                         } else {
!!#                          !sjm4_dat = sjm0_data[sjm_rd0][i];
!!#                          sjm4_dat = 0;
!!#                          sjm0_data_m_io[sjm_wr0_m_io][i] = sjm4_dat;
!!#                          !if (i%4 == 0) IJ_printf (sjm_4, "        ");
!!#                          IJ_printf ("diag.j", 1018, sjm_4, "0x%08x ",sjm4_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             IJ_printf ("diag.j", 1020, sjm_4, "\n"); 
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
!!#                    IJ_printf ("diag.j", 1038, sjm_4, "\n");
!!#                      sjm4_cnt_m_io--;
!!# 
!!#                      sj4_ad = sjm0_addr_m_io[sjm_rd0_m_io];
!!#                      mask   = sjm0_data_m_io[sjm_rd0_m_io][15];
!!#                      IJ_printf ("diag.j", 1044, sjm_4, "READMSKIO   0x%016llx 0x%04llx  ",sj4_ad,mask);
!!# 
!!#                       for (i=0;i<4;i++) { 
!!#                          sjm4_dat = sjm0_data_m_io[sjm_rd0_m_io][i];
!!#                          !if (i%4 == 0) IJ_printf (sjm_4, "        ");
!!#                          IJ_printf ("diag.j", 1049, sjm_4, "0x%08x ",sjm4_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             IJ_printf ("diag.j", 1051, sjm_4, "\n");
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
!!#                    IJ_printf ("diag.j", 1069, sjm_5, "\n");
!!#                      sjm5_cnt++;
!!# 
!!#                      sj5_ad =  IJ_get_rvar_val64("diag.j", 1072, Rv_memaddr_pattern_dma);
!!#                      sjm1_addr[sjm_wr1] = sj5_ad; 
!!#                      IJ_printf ("diag.j", 1074, sjm_5, "WRITEBLK  0x%016llx +\n",sj5_ad);
!!#                      IJ_update_rvar("diag.j", 1075, Rv_memaddr_pattern_dma);
!!# 
!!#                       for (i=0;i<16;i++) { 
!!#                          sjm1_data[sjm_wr1][i] = IJ_get_rvar_val32("diag.j", 1078, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 1079, Rv_rand32);
!!#                          if (i%4 == 0) IJ_printf ("diag.j", 1080, sjm_5, "        ");
!!#                          IJ_printf ("diag.j", 1081, sjm_5, "0x%08x ",sjm1_data[sjm_wr1][i]);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 1083, sjm_5, "\n"); else 
!!#                             IJ_printf ("diag.j", 1084, sjm_5, "+\n");
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
!!#                    IJ_printf ("diag.j", 1097, sjm_5, "\n");
!!#                      sjm5_cnt--;
!!# 
!!#                      sj5_ad = sjm1_addr[sjm_rd1];
!!#                      IJ_printf ("diag.j", 1102, sjm_5, "READBLK  0x%016llx +\n",sj5_ad);
!!# 
!!#                       for (i=0;i<16;i++) { 
!!#                          sjm5_dat = sjm1_data[sjm_rd1][i];
!!#                          if (i%4 == 0) IJ_printf ("diag.j", 1106, sjm_5, "        ");
!!#                          IJ_printf ("diag.j", 1107, sjm_5, "0x%08x ",sjm5_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 1109, sjm_5, "\n"); else 
!!#                             IJ_printf ("diag.j", 1110, sjm_5, "+\n");
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
!!#                    IJ_printf ("diag.j", 1124, sjm_5, "\n");
!!#                      !sjm4_cnt--;
!!# 
!!#  		     sjm1_w_mask =  IJ_get_rvar_val32("diag.j", 1128, Rv_rand_mask);
!!#                      IJ_update_rvar("diag.j", 1129, Rv_rand_mask);
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
!!#                      IJ_printf ("diag.j", 1146, sjm_5, "WRITEMSK  0x%016llx 0x%016llx +\n",sj5_ad,mask);
!!# 
!!#                       m_tmp = sjm1_w_mask;
!!#                       for (i=0;i<16;i++) { 
!!#                        if (m_tmp & 0x1 ) {
!!#                          sjm1_data[sjm_rd1][i] = IJ_get_rvar_val32("diag.j", 1151, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 1152, Rv_rand32);
!!#                          sjm5_dat = sjm1_data[sjm_rd1][i];
!!#                          if (i%4 == 0) IJ_printf ("diag.j", 1154, sjm_5, "        ");
!!#                          IJ_printf ("diag.j", 1155, sjm_5, "0x%08x ",sjm5_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 1157, sjm_5, "\n"); else 
!!#                             IJ_printf ("diag.j", 1158, sjm_5, "+\n");
!!#                            }
!!#                         } else {
!!#                          !sjm5_dat = sjm1_data[sjm_rd1][i];
!!#                          sjm5_dat = 0;
!!#                          if (i%4 == 0) IJ_printf ("diag.j", 1163, sjm_5, "        ");
!!#                          IJ_printf ("diag.j", 1164, sjm_5, "0x%08x ",sjm5_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 1166, sjm_5, "\n"); else 
!!#                             IJ_printf ("diag.j", 1167, sjm_5, "+\n");
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
!!#                    IJ_printf ("diag.j", 1184, sjm_5, "\n");
!!#                      sjm5_cnt_io++;
!!# 
!!#                      sj5_ad =  IJ_get_rvar_val64("diag.j", 1187, Rv_memaddr_pattern_io);
!!#                      sjm1_addr_io[sjm_wr1_io] = sj5_ad; 
!!#                      IJ_printf ("diag.j", 1189, sjm_5, "WRITEBLKIO  0x%016llx +\n",sj5_ad);
!!#                      IJ_update_rvar("diag.j", 1190, Rv_memaddr_pattern_io);
!!# 
!!#                       for (i=0;i<16;i++) { 
!!#                          !IJ_printf (sjm_5, "# debug %d \n",i);
!!#                          sjm1_data_io[sjm_wr1_io][i] = IJ_get_rvar_val32("diag.j", 1194, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 1195, Rv_rand32);
!!#                          if (i%4 == 0) {IJ_printf ("diag.j", 1196, sjm_5, "        "); }
!!#                          IJ_printf ("diag.j", 1197, sjm_5, "0x%08x ",sjm1_data_io[sjm_wr1_io][i]);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 1199, sjm_5, "\n"); else 
!!#                             IJ_printf ("diag.j", 1200, sjm_5, "+\n");
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
!!#                    IJ_printf ("diag.j", 1213, sjm_5, "\n");
!!#                      sjm5_cnt_io--;
!!# 
!!#                      sj5_ad = sjm1_addr_io[sjm_rd1_io];
!!#                      IJ_printf ("diag.j", 1218, sjm_5, "READBLKIO  0x%016llx +\n",sj5_ad);
!!# 
!!#                       for (i=0;i<16;i++) { 
!!#                          sjm5_dat = sjm1_data_io[sjm_rd1_io][i];
!!#                          if (i%4 == 0) IJ_printf ("diag.j", 1222, sjm_5, "        ");
!!#                          IJ_printf ("diag.j", 1223, sjm_5, "0x%08x ",sjm5_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 1225, sjm_5, "\n"); else 
!!#                             IJ_printf ("diag.j", 1226, sjm_5, "+\n");
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
!!#                    IJ_printf ("diag.j", 1242, sjm_5, "\n");
!!#                      sjm5_cnt_io1++;
!!# 
!!#                      sj5_ad =  IJ_get_rvar_val64("diag.j", 1245, Rv_memaddr_pattern_io);
!!#                      sjm1_addr_io1[sjm_wr1_io1] = sj5_ad; 
!!#                      IJ_printf ("diag.j", 1247, sjm_5, "WRITEIO  0x%016llx ",sj5_ad);
!!#                      IJ_update_rvar("diag.j", 1248, Rv_memaddr_pattern_io);
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
!!#                       IJ_printf ("diag.j", 1263, sjm_5, "%d ",b_sz);
!!#                       for (i=0;i<4;i++) { 
!!#                          !IJ_printf (sjm_5, "# debug %d \n",i);
!!#                          sjm1_data_io1[sjm_wr1_io1][i] = IJ_get_rvar_val32("diag.j", 1266, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 1267, Rv_rand32);
!!#                          IJ_printf ("diag.j", 1268, sjm_5, "0x%08x ",sjm1_data_io1[sjm_wr1_io1][i]);
!!#                          if((i==0) && ((b_sz == 1) | (b_sz == 2) | (b_sz == 4)) ) break; 
!!#                          if((i==1) && (b_sz == 8)) break; 
!!#                       }
!!#                       if ( random()%2 == 0) {
!!#                       IJ_printf ("diag.j", 1273, sjm_5, "\n");
!!#                       } else {
!!#                       IJ_printf ("diag.j", 1275, sjm_5, "\n");
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
!!#                    IJ_printf ("diag.j", 1289, sjm_5, "\n");
!!#                      sjm5_cnt_io1--;
!!# 
!!#                      sj5_ad = sjm1_addr_io1[sjm_rd1_io1];
!!#                      b_sz   = sjm1_data_io1[sjm_rd1_io1][15];
!!#                      IJ_printf ("diag.j", 1295, sjm_5, "READIO  0x%016llx %d ",sj5_ad,b_sz);
!!# 
!!#                       for (i=0;i<4;i++) {
!!#                          sjm5_dat = sjm1_data_io1[sjm_rd1_io1][i];
!!#                          IJ_printf ("diag.j", 1299, sjm_5, "0x%08x ",sjm5_dat);
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
!!#                    IJ_printf ("diag.j", 1314, sjm_5, "\n");
!!# 
!!#                      sj5_ad =  IJ_get_rvar_val64("diag.j", 1316, Rv_memaddr_pattern_io);
!!#                      sjm1_addr_m_io[sjm_wr1_m_io] = sj5_ad; 
!!#                      IJ_update_rvar("diag.j", 1318, Rv_memaddr_pattern_io);
!!# 
!!#                      sjm5_cnt_m_io++;
!!# 
!!#  		     sjm1_w_mask_m_io =  IJ_get_rvar_val32("diag.j", 1324, Rv_rand_mask);
!!#                      IJ_update_rvar("diag.j", 1325, Rv_rand_mask);
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
!!#                      IJ_printf ("diag.j", 1352, sjm_5, "WRITEMSKIO  0x%016llx 0x%04x  ",sj5_ad,mask);
!!#                      sjm1_data_m_io[sjm_wr1_m_io][15] = mask; ! data fifo , 15 stores address
!!# 
!!#                       m_tmp = sjm1_w_mask_m_io & 0xf;
!!#                       for (i=0;i<4;i++) { 
!!#                        if (m_tmp & 0x1 ) {
!!#                          sjm1_data_m_io[sjm_wr1_m_io][i] = IJ_get_rvar_val32("diag.j", 1358, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 1359, Rv_rand32);
!!#                          sjm5_dat = sjm1_data_m_io[sjm_wr1_m_io][i];
!!#                          !if (i%4 == 0) IJ_printf (sjm_5, "        ");
!!#                          IJ_printf ("diag.j", 1362, sjm_5, "0x%08x ",sjm5_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                              IJ_printf ("diag.j", 1364, sjm_5, "\n"); 
!!#                             !if (i==15 ) IJ_printf (sjm_5, "\n"); else 
!!#                             !IJ_printf (sjm_5, "+\n");
!!#                            }
!!#                         } else {
!!#                          !sjm5_dat = sjm1_data[sjm_rd1][i];
!!#                          sjm5_dat = 0;
!!#                          sjm1_data_m_io[sjm_wr1_m_io][i] = sjm5_dat;
!!#                          !if (i%4 == 0) IJ_printf (sjm_5, "        ");
!!#                          IJ_printf ("diag.j", 1373, sjm_5, "0x%08x ",sjm5_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             IJ_printf ("diag.j", 1375, sjm_5, "\n"); 
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
!!#                    IJ_printf ("diag.j", 1393, sjm_5, "\n");
!!#                      sjm5_cnt_m_io--;
!!# 
!!#                      sj5_ad = sjm1_addr_m_io[sjm_rd1_m_io];
!!#                      mask   = sjm1_data_m_io[sjm_rd1_m_io][15];
!!#                      IJ_printf ("diag.j", 1399, sjm_5, "READMSKIO   0x%016llx 0x%04llx  ",sj5_ad,mask);
!!# 
!!#                       for (i=0;i<4;i++) { 
!!#                          sjm5_dat = sjm1_data_m_io[sjm_rd1_m_io][i];
!!#                          !if (i%4 == 0) IJ_printf (sjm_5, "        ");
!!#                          IJ_printf ("diag.j", 1404, sjm_5, "0x%08x ",sjm5_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             IJ_printf ("diag.j", 1406, sjm_5, "\n");
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
!!#                         ! Update the JBI-CONFIG FIFO parameters
!!#                         invalid_config = 1;
!!#                         while (invalid_config) {
!!#                         if (random()%2) {
!!#                         !if (config_cnt > 500) {
!!#                         jbi_config = IJ_get_rvar_val64("diag.j", 1431, Rv_jbi_fifo_wr0_config);
!!# 			IJ_update_rvar("diag.j", 1432, Rv_jbi_fifo_wr0_config);
!!#                         } else {
!!#                         jbi_config = IJ_get_rvar_val64("diag.j", 1434, Rv_jbi_fifo_wr1_config);
!!# 			IJ_update_rvar("diag.j", 1435, Rv_jbi_fifo_wr1_config);
!!#                         }
!!#                         if (((jbi_config>>24) & 0x7) < ((jbi_config>>28) & 0x7)) {
!!#                         invalid_config = 0;
!!#                          }
!!#                         } config_cnt++;
!!# 
!!#                         if (fr_done == 0) {
!!#                          fr_done = 1;
!!#                         IJ_printf ("diag.j", 1444, th_M, "\tsetx\t0x%016llx, %%r1, %%r9\n",
!!#                                 jbi_config);
!!#                         IJ_printf ("diag.j", 1446, th_M, "\tsetx\t0x8000000008, %%r1, %%r10\n");
!!#                         IJ_printf ("diag.j", 1447, th_M, "\tstx\t%%r9, [%%r10]\n");
!!#                         IJ_printf ("diag.j", 1448, th_M, "\n\n\n");
!!#                         IJ_printf ("diag.j", 1449, th_M, "!***********************************************************************\n");
!!#                         IJ_printf ("diag.j", 1450, th_M, "!IOSYNC cycles to start sjm\n");
!!#                         IJ_printf ("diag.j", 1451, th_M, "!***********************************************************************\n");
!!#                         IJ_printf ("diag.j", 1452, th_M, "\tsetx 0xdeadbeefdeadbeef, %%g1, %%g2\n");
!!#                         IJ_printf ("diag.j", 1453, th_M, "\tsetx 0xcf00beef00, %%g1, %%g3\n");
!!#                         IJ_printf ("diag.j", 1454, th_M, "\tstx %%g2, [%%g3]\n");
!!#                         IJ_printf ("diag.j", 1455, th_M, "!***********************************************************************\n");
!!#                         IJ_printf ("diag.j", 1456, th_M, "!IOSYNC cycles to start sjm\n");
!!#                         IJ_printf ("diag.j", 1457, th_M, "!***********************************************************************\n");
!!#                         IJ_printf ("diag.j", 1458, th_M, "\tsetx 0xdeadbeefdeadbeef, %%g1, %%g2\n");
!!#                         IJ_printf ("diag.j", 1459, th_M, "\tsetx 0xef00beef00, %%g1, %%g3\n");
!!#                         IJ_printf ("diag.j", 1460, th_M, "\tstx %%g2, [%%g3]\n");
!!#                         IJ_printf ("diag.j", 1461, th_M, "\n\n\n");
!!#                         } 
!!# 
!!#                         mem_ad = IJ_get_rvar_val64("diag.j", 1465, Rv_memaddr_pattern);
!!#                         IJ_update_rvar("diag.j", 1466, Rv_memaddr_pattern);
!!# 
!!#                         jbi0 = IJ_get_rvar_val64("diag.j", 1468, Rv_jbi_b_addr_pattern0);
!!# 
!!#                         ! to remove address not in dma-fake range
!!#                         while (jbi0 < 550024249344 ) {
!!#                         jbi0 = IJ_get_rvar_val64("diag.j", 1473, Rv_jbi_b_addr_pattern0);
!!# 			IJ_update_rvar("diag.j", 1474, Rv_jbi_b_addr_pattern0);
!!#                         }
!!# 
!!#                         jbi1 = IJ_get_rvar_val64("diag.j", 1477, Rv_jbi_b_addr_pattern1);
!!#                         jbi2 = IJ_get_rvar_val64("diag.j", 1478, Rv_jbi_b_addr_pattern2);
!!#                         jbi3 = IJ_get_rvar_val64("diag.j", 1479, Rv_jbi_b_addr_pattern3);
!!#                         jbi4 = IJ_get_rvar_val64("diag.j", 1480, Rv_jbi_b_addr_pattern4);
!!#                         jbi5 = IJ_get_rvar_val64("diag.j", 1481, Rv_jbi_b_addr_pattern5);
!!# 
!!#                         jbi6 = IJ_get_rvar_val64("diag.j", 1483, Rv_jbi_b_addr_pattern6);
!!#                         ! to remove address not in dma-fake range
!!#                         while (jbi6 > 1095216660479)  {
!!#                         jbi6 = IJ_get_rvar_val64("diag.j", 1486, Rv_jbi_b_addr_pattern6);
!!# 			IJ_update_rvar("diag.j", 1487, Rv_jbi_b_addr_pattern6);
!!#                         }
!!# 
!!# 			IJ_update_rvar("diag.j", 1490, Rv_jbi_b_addr_pattern0);
!!# 			IJ_update_rvar("diag.j", 1491, Rv_jbi_b_addr_pattern1);
!!# 			IJ_update_rvar("diag.j", 1492, Rv_jbi_b_addr_pattern2);
!!# 			IJ_update_rvar("diag.j", 1493, Rv_jbi_b_addr_pattern3);
!!# 			IJ_update_rvar("diag.j", 1494, Rv_jbi_b_addr_pattern4);
!!# 			IJ_update_rvar("diag.j", 1495, Rv_jbi_b_addr_pattern5);
!!# 			IJ_update_rvar("diag.j", 1496, Rv_jbi_b_addr_pattern6);
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
!!#                         b_DATA_ARRAY[b_wr_cntr] = IJ_get_rvar_val64("diag.j", 1522, Rv_rand64);
!!# 			IJ_update_rvar("diag.j", 1523, Rv_rand64);
!!#                         data_st = b_DATA_ARRAY[b_wr_cntr];
!!#                         addr_st = b_ADDR_ARRAY[b_a_wr_cntr -7 + i];
!!#                         IJ_printf ("diag.j", 1526, th_M, "\tsetx\t0x%016llx, %%r1, %%r9\n",
!!#                                 addr_st);
!!#                         IJ_printf ("diag.j", 1528, th_M, "\tsetx\t0x%016llx, %%r1, %%r10\n",
!!#                                 data_st);
!!#                         IJ_printf ("diag.j", 1530, th_M, "\tstb\t%%r10, [%%r9]\n");
!!# 
!!#  			! cache able store and load to main memory 
!!#                         if(random()%4 == 0) {
!!#                         IJ_printf ("diag.j", 1534, th_M, "\tsetx\t0x%016llx, %%r1, %%r9\n",
!!#                                 mem_ad);
!!#                         IJ_printf ("diag.j", 1536, th_M, "\tsetx\t0x%016llx, %%r1, %%r10\n",
!!#                                 data_st);
!!#                         if(random()%2) {
!!#                         IJ_printf ("diag.j", 1539, th_M, "\tstx\t%%r10, [%%r9]\n");
!!#                         } else {
!!#                         IJ_printf ("diag.j", 1541, th_M, "\tldx\t[%%r9], %%r10\n"); 
!!#                         }
!!#                         mem_ad = IJ_get_rvar_val64("diag.j", 1543, Rv_memaddr_pattern);
!!#                         IJ_update_rvar("diag.j", 1544, Rv_memaddr_pattern);
!!#                         }
!!# 
!!#                         b_wr_cntr++;
!!#                         } ! end for 
!!# 
!!#                         !IJ_printf (th_M, "\tsetx\t0x%016llx, %%r1, %%r9\n",
!!#                         !        jbi_config);
!!#                         !IJ_printf (th_M, "\tsetx\t0x8000000008, %%r1, %%r10\n");
!!#                         !IJ_printf (th_M, "\tstx\t%%r9, [%%r10]\n");
!!# 
!!#                         ! HALF WORD
!!#                         ! add a mechanism to control addr1, addr5 in range ??
!!#                         ! addr
!!# 
!!#                         while (jbi0 < 550024249344 ) {
!!#                         jbi0 = IJ_get_rvar_val64("diag.j", 1565, Rv_jbi_h_addr_pattern1);
!!#                         IJ_update_rvar("diag.j", 1566, Rv_jbi_h_addr_pattern0);
!!#                         }
!!# 
!!#                         jbi6 = IJ_get_rvar_val64("diag.j", 1569, Rv_jbi_h_addr_pattern6);
!!#                         ! to remove address not in dma-fake range
!!#                         while (jbi6 > 1095216660479)  {
!!#                         jbi6 = IJ_get_rvar_val64("diag.j", 1572, Rv_jbi_h_addr_pattern6);
!!#                         IJ_update_rvar("diag.j", 1573, Rv_jbi_h_addr_pattern6);
!!#                         }
!!# 
!!#                         jbi1 = IJ_get_rvar_val64("diag.j", 1576, Rv_jbi_h_addr_pattern1);
!!#                         jbi2 = IJ_get_rvar_val64("diag.j", 1577, Rv_jbi_h_addr_pattern2);
!!#                         jbi3 = IJ_get_rvar_val64("diag.j", 1578, Rv_jbi_h_addr_pattern3);
!!#                         jbi4 = IJ_get_rvar_val64("diag.j", 1579, Rv_jbi_h_addr_pattern4);
!!#                         jbi5 = IJ_get_rvar_val64("diag.j", 1580, Rv_jbi_h_addr_pattern5);
!!#                         !jbi6 = IJ_get_rvar_val64(Rv_jbi_h_addr_pattern6);
!!# 			IJ_update_rvar("diag.j", 1582, Rv_jbi_h_addr_pattern1);
!!# 			IJ_update_rvar("diag.j", 1583, Rv_jbi_h_addr_pattern2);
!!# 			IJ_update_rvar("diag.j", 1584, Rv_jbi_h_addr_pattern3);
!!# 			IJ_update_rvar("diag.j", 1585, Rv_jbi_h_addr_pattern4);
!!# 			IJ_update_rvar("diag.j", 1586, Rv_jbi_h_addr_pattern5);
!!# 			IJ_update_rvar("diag.j", 1587, Rv_jbi_h_addr_pattern6);
!!# 
!!#                         !addr_sel = random() % 5;
!!# 			!IJ_update_rvar(Rv_addr_sel);
!!# 	                !printf ("!DEBUG: %d, jbi1 = 0x%016llx, jbi2 = 0x%016llx, jbi3 = 0x%016llx, jbi4 = 0x%016llx, jbi5 = 0x%016llx, jbi6 = 0x%016llx \n", addr_sel, jbi1, jbi2,jbi3,jbi4,jbi5,jbi6); 
!!#                         !store_addr = addr_sel;
!!# 
!!#                         h_ADDR_ARRAY[h_a_wr_cntr] = jbi1; h_a_wr_cntr = h_a_wr_cntr + 1; ! store the stx address
!!#                         h_ADDR_ARRAY[h_a_wr_cntr] = jbi2; h_a_wr_cntr = h_a_wr_cntr + 1; ! store the stx address
!!#                         h_ADDR_ARRAY[h_a_wr_cntr] = jbi3; h_a_wr_cntr = h_a_wr_cntr + 1; ! store the stx address
!!#                         h_ADDR_ARRAY[h_a_wr_cntr] = jbi4; h_a_wr_cntr = h_a_wr_cntr + 1; ! store the stx address
!!#                         h_ADDR_ARRAY[h_a_wr_cntr] = jbi5; h_a_wr_cntr = h_a_wr_cntr + 1; ! store the stx address
!!#                         h_ADDR_ARRAY[h_a_wr_cntr] = jbi6; h_a_wr_cntr = h_a_wr_cntr + 1; ! store the stx address
!!# 
!!#                         for (i=0;i<6;i++) {
!!#                         h_DATA_ARRAY[h_wr_cntr] = IJ_get_rvar_val64("diag.j", 1603, Rv_rand64);
!!# 			IJ_update_rvar("diag.j", 1604, Rv_rand64);
!!#                         data_st = h_DATA_ARRAY[h_wr_cntr];
!!#                         addr_st = h_ADDR_ARRAY[h_a_wr_cntr -6 + i];
!!#                         IJ_printf ("diag.j", 1607, th_M, "\tsetx\t0x%016llx, %%r1, %%r9\n",
!!#                                 addr_st);
!!#                         IJ_printf ("diag.j", 1609, th_M, "\tsetx\t0x%016llx, %%r1, %%r10\n",
!!#                                 data_st);
!!#                         IJ_printf ("diag.j", 1611, th_M, "\tsth\t%%r10, [%%r9]\n");
!!# 
!!#                         ! cache able store and load to main memory
!!#                         if(random()%4 == 0) {
!!#                         IJ_printf ("diag.j", 1615, th_M, "\tsetx\t0x%016llx, %%r1, %%r9\n",
!!#                                 mem_ad);
!!#                         IJ_printf ("diag.j", 1617, th_M, "\tsetx\t0x%016llx, %%r1, %%r10\n",
!!#                                 data_st);
!!#                         if(random()%2) {
!!#                         IJ_printf ("diag.j", 1620, th_M, "\tstx\t%%r10, [%%r9]\n");
!!#                         } else {
!!#                         IJ_printf ("diag.j", 1622, th_M, "\tldx\t[%%r9], %%r10\n");
!!#                         }
!!#                         mem_ad = IJ_get_rvar_val64("diag.j", 1624, Rv_memaddr_pattern);
!!#                         IJ_update_rvar("diag.j", 1625, Rv_memaddr_pattern);
!!#                         }
!!# 
!!#                         h_wr_cntr++;
!!#                         } ! end for 
!!# 
!!#                         !  WORD
!!#                         ! add a mechanism to control addr1, addr5 in range ??
!!#                         ! addr
!!#                         while (jbi0 < 550024249344 ) {
!!#                         jbi0 = IJ_get_rvar_val64("diag.j", 1637, Rv_jbi_w_addr_pattern1);
!!#                         IJ_update_rvar("diag.j", 1638, Rv_jbi_w_addr_pattern0);
!!#                         }
!!# 
!!#                         jbi6 = IJ_get_rvar_val64("diag.j", 1641, Rv_jbi_w_addr_pattern6);
!!#                         ! to remove address not in dma-fake range
!!#                         while (jbi6 > 1095216660479)  {
!!#                         jbi6 = IJ_get_rvar_val64("diag.j", 1644, Rv_jbi_w_addr_pattern6);
!!#                         IJ_update_rvar("diag.j", 1645, Rv_jbi_w_addr_pattern6);
!!#                         }
!!# 
!!#                         jbi1 = IJ_get_rvar_val64("diag.j", 1648, Rv_jbi_w_addr_pattern1);
!!#                         jbi2 = IJ_get_rvar_val64("diag.j", 1649, Rv_jbi_w_addr_pattern2);
!!#                         jbi3 = IJ_get_rvar_val64("diag.j", 1650, Rv_jbi_w_addr_pattern3);
!!#                         jbi4 = IJ_get_rvar_val64("diag.j", 1651, Rv_jbi_w_addr_pattern4);
!!#                         jbi5 = IJ_get_rvar_val64("diag.j", 1652, Rv_jbi_w_addr_pattern5);
!!#                         !jbi6 = IJ_get_rvar_val64(Rv_jbi_w_addr_pattern6);
!!# 			IJ_update_rvar("diag.j", 1654, Rv_jbi_w_addr_pattern1);
!!# 			IJ_update_rvar("diag.j", 1655, Rv_jbi_w_addr_pattern2);
!!# 			IJ_update_rvar("diag.j", 1656, Rv_jbi_w_addr_pattern3);
!!# 			IJ_update_rvar("diag.j", 1657, Rv_jbi_w_addr_pattern4);
!!# 			IJ_update_rvar("diag.j", 1658, Rv_jbi_w_addr_pattern5);
!!# 			IJ_update_rvar("diag.j", 1659, Rv_jbi_w_addr_pattern6);
!!# 
!!#                         !addr_sel = random() % 5;
!!# 			!IJ_update_rvar(Rv_addr_sel);
!!# 	                !printf ("!DEBUG: %d, jbi1 = 0x%016llx, jbi2 = 0x%016llx, jbi3 = 0x%016llx, jbi4 = 0x%016llx, jbi5 = 0x%016llx, jbi6 = 0x%016llx \n", addr_sel, jbi1, jbi2,jbi3,jbi4,jbi5,jbi6); 
!!#                         !store_addr = addr_sel;
!!# 
!!#                         w_ADDR_ARRAY[w_a_wr_cntr] = jbi1; w_a_wr_cntr = w_a_wr_cntr + 1; ! store the stx address
!!#                         w_ADDR_ARRAY[w_a_wr_cntr] = jbi2; w_a_wr_cntr = w_a_wr_cntr + 1; ! store the stx address
!!#                         w_ADDR_ARRAY[w_a_wr_cntr] = jbi3; w_a_wr_cntr = w_a_wr_cntr + 1; ! store the stx address
!!#                         w_ADDR_ARRAY[w_a_wr_cntr] = jbi4; w_a_wr_cntr = w_a_wr_cntr + 1; ! store the stx address
!!#                         w_ADDR_ARRAY[w_a_wr_cntr] = jbi5; w_a_wr_cntr = w_a_wr_cntr + 1; ! store the stx address
!!#                         w_ADDR_ARRAY[w_a_wr_cntr] = jbi6; w_a_wr_cntr = w_a_wr_cntr + 1; ! store the stx address
!!# 
!!#                         for (i=0;i<6;i++) {
!!#                         w_DATA_ARRAY[w_wr_cntr] = IJ_get_rvar_val64("diag.j", 1675, Rv_rand64);
!!# 			IJ_update_rvar("diag.j", 1676, Rv_rand64);
!!#                         data_st = w_DATA_ARRAY[w_wr_cntr];
!!#                         addr_st = w_ADDR_ARRAY[w_a_wr_cntr -6 + i];
!!#                         IJ_printf ("diag.j", 1679, th_M, "\tsetx\t0x%016llx, %%r1, %%r9\n",
!!#                                 addr_st);
!!#                         IJ_printf ("diag.j", 1681, th_M, "\tsetx\t0x%016llx, %%r1, %%r10\n",
!!#                                 data_st);
!!#                         IJ_printf ("diag.j", 1683, th_M, "\tstw\t%%r10, [%%r9]\n");
!!# 
!!#                         ! cache able store and load to main memory
!!#                         if(random()%4 == 0) {
!!#                         IJ_printf ("diag.j", 1687, th_M, "\tsetx\t0x%016llx, %%r1, %%r9\n",
!!#                                 mem_ad);
!!#                         IJ_printf ("diag.j", 1689, th_M, "\tsetx\t0x%016llx, %%r1, %%r10\n",
!!#                                 data_st);
!!#                         if(random()%2) {
!!#                         IJ_printf ("diag.j", 1692, th_M, "\tstx\t%%r10, [%%r9]\n");
!!#                         } else {
!!#                         IJ_printf ("diag.j", 1694, th_M, "\tldx\t[%%r9], %%r10\n");
!!#                         }
!!#                         mem_ad = IJ_get_rvar_val64("diag.j", 1696, Rv_memaddr_pattern);
!!#                         IJ_update_rvar("diag.j", 1697, Rv_memaddr_pattern);
!!#                         }
!!# 
!!#                         w_wr_cntr++;
!!#                         } ! end for 
!!# 
!!#                         ! Double WORD (x-word)
!!#                         ! add a mechanism to control addr1, addr5 in range ??
!!#                         ! addr
!!#                         while (jbi0 < 550024249344 ) {
!!#                         jbi0 = IJ_get_rvar_val64("diag.j", 1708, Rv_jbiaddr_pattern1);
!!#                         IJ_update_rvar("diag.j", 1709, Rv_jbiaddr_pattern0);
!!#                         }
!!# 
!!#                         jbi6 = IJ_get_rvar_val64("diag.j", 1712, Rv_jbiaddr_pattern6);
!!#                         ! to remove address not in dma-fake range
!!#                         while (jbi6 > 1095216660479)  {
!!#                         jbi6 = IJ_get_rvar_val64("diag.j", 1715, Rv_jbiaddr_pattern6);
!!#                         IJ_update_rvar("diag.j", 1716, Rv_jbiaddr_pattern6);
!!#                         }
!!# 
!!#                         jbi1 = IJ_get_rvar_val64("diag.j", 1719, Rv_jbiaddr_pattern1);
!!#                         jbi2 = IJ_get_rvar_val64("diag.j", 1720, Rv_jbiaddr_pattern2);
!!#                         jbi3 = IJ_get_rvar_val64("diag.j", 1721, Rv_jbiaddr_pattern3);
!!#                         jbi4 = IJ_get_rvar_val64("diag.j", 1722, Rv_jbiaddr_pattern4);
!!#                         jbi5 = IJ_get_rvar_val64("diag.j", 1723, Rv_jbiaddr_pattern5);
!!#                         !jbi6 = IJ_get_rvar_val64(Rv_jbiaddr_pattern6);
!!# 			IJ_update_rvar("diag.j", 1725, Rv_jbiaddr_pattern1);
!!# 			IJ_update_rvar("diag.j", 1726, Rv_jbiaddr_pattern2);
!!# 			IJ_update_rvar("diag.j", 1727, Rv_jbiaddr_pattern3);
!!# 			IJ_update_rvar("diag.j", 1728, Rv_jbiaddr_pattern4);
!!# 			IJ_update_rvar("diag.j", 1729, Rv_jbiaddr_pattern5);
!!# 			!IJ_update_rvar(Rv_jbiaddr_pattern6);
!!# 
!!#                         !addr_sel = random() % 5;
!!# 			!IJ_update_rvar(Rv_addr_sel);
!!# 	                !printf ("!DEBUG: %d, jbi1 = 0x%016llx, jbi2 = 0x%016llx, jbi3 = 0x%016llx, jbi4 = 0x%016llx, jbi5 = 0x%016llx, jbi6 = 0x%016llx \n", addr_sel, jbi1, jbi2,jbi3,jbi4,jbi5,jbi6); 
!!#                         !store_addr = addr_sel;
!!# 
!!#                         x_ADDR_ARRAY[x_a_wr_cntr] = jbi1; x_a_wr_cntr = x_a_wr_cntr + 1; ! store the stx address
!!#                         x_ADDR_ARRAY[x_a_wr_cntr] = jbi2; x_a_wr_cntr = x_a_wr_cntr + 1; ! store the stx address
!!#                         x_ADDR_ARRAY[x_a_wr_cntr] = jbi3; x_a_wr_cntr = x_a_wr_cntr + 1; ! store the stx address
!!#                         x_ADDR_ARRAY[x_a_wr_cntr] = jbi4; x_a_wr_cntr = x_a_wr_cntr + 1; ! store the stx address
!!#                         x_ADDR_ARRAY[x_a_wr_cntr] = jbi5; x_a_wr_cntr = x_a_wr_cntr + 1; ! store the stx address
!!#                         x_ADDR_ARRAY[x_a_wr_cntr] = jbi6; x_a_wr_cntr = x_a_wr_cntr + 1; ! store the stx address
!!# 
!!#                         for (i=0;i<6;i++) {
!!#                         x_DATA_ARRAY[x_wr_cntr] = IJ_get_rvar_val64("diag.j", 1746, Rv_rand64);
!!# 			IJ_update_rvar("diag.j", 1747, Rv_rand64);
!!#                         data_st = x_DATA_ARRAY[x_wr_cntr];
!!#                         addr_st = x_ADDR_ARRAY[x_a_wr_cntr -6 + i];
!!#                         IJ_printf ("diag.j", 1750, th_M, "\tsetx\t0x%016llx, %%r1, %%r9\n",
!!#                                 addr_st);
!!#                         IJ_printf ("diag.j", 1752, th_M, "\tsetx\t0x%016llx, %%r1, %%r10\n",
!!#                                 data_st);
!!#                         IJ_printf ("diag.j", 1754, th_M, "\tstx\t%%r10, [%%r9]\n");
!!# 
!!#                         ! cache able store and load to main memory
!!#                         if(random()%4 == 0) {
!!#                         IJ_printf ("diag.j", 1759, th_M, "\tsetx\t0x%016llx, %%r1, %%r9\n",
!!#                                 mem_ad);
!!#                         IJ_printf ("diag.j", 1761, th_M, "\tsetx\t0x%016llx, %%r1, %%r10\n",
!!#                                 data_st);
!!#                         if(random()%2) {
!!#                         IJ_printf ("diag.j", 1764, th_M, "\tstx\t%%r10, [%%r9]\n");
!!#                         } else {
!!#                         IJ_printf ("diag.j", 1766, th_M, "\tldx\t[%%r9], %%r10\n");
!!#                         }
!!#                         mem_ad = IJ_get_rvar_val64("diag.j", 1768, Rv_memaddr_pattern);
!!#                         IJ_update_rvar("diag.j", 1769, Rv_memaddr_pattern);
!!#                         }
!!# 
!!#                         x_wr_cntr++;
!!#                         } ! end for 
!!# 
!!#                         ! EXTRA NOISE STX
!!#                         rnd_cnt =  addr_sel ;
!!#                         while(rnd_cnt > 0 ) {
!!#                         ! noise load and store
!!#                         while (addr_sel == store_addr ) {
!!#                         !addr_sel = IJ_get_rvar_val64(Rv_addr_sel);
!!# 			!IJ_update_rvar(Rv_addr_sel);
!!#                         addr_sel = random() % 5;
!!#                         }
!!# 	                !printf ("!DEBUG 2: %d\n", addr_sel); 
!!#                         switch (addr_sel) {
!!#                         case 1 : jbi_addr = jbi1; break;
!!#                         case 2 : jbi_addr = jbi2; break;
!!#                         case 3 : jbi_addr = jbi3; break;
!!#                         case 4 : jbi_addr = jbi4; break;
!!#                         case 5 : jbi_addr = jbi5; break;
!!#                         case 0 : jbi_addr = jbi6; break;
!!#                         default : jbi_addr = jbi5; break;
!!#                         }
!!# 
!!# 	                !printf ("!DEBUG 3: jbi_addr =  0x%016llx\n", jbi_addr); 
!!# 
!!#                         IJ_printf ("diag.j", 1797, th_M, "\tsetx\t0x%016llx, %%r1, %%r12\n",
!!#                                 jbi_addr);
!!#                         noise_data_st = b_DATA_ARRAY[addr_sel];
!!#                         IJ_printf ("diag.j", 1800, th_M, "\tsetx\t0x%016llx, %%r1, %%r13\n",
!!#                                 noise_data_st);
!!#                         IJ_printf ("diag.j", 1802, th_M, "\tstx\t%%r13, [%%r12]\n");
!!#                         rnd_cnt--;
!!#                         addr_sel = IJ_get_rvar_val64("diag.j", 1804, Rv_addr_sel);
!!# 			IJ_update_rvar("diag.j", 1805, Rv_addr_sel);
!!#                         }
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
!!#                         IJ_printf ("diag.j", 1824, th_M, "\tsetx\t0x%016llx, %%r1, %%r12\n",
!!#                                 b_ADDR_ARRAY[rnd_cnt+a_addr_sel]);
!!#                         IJ_printf ("diag.j", 1826, th_M, "\tldub\t[%%r12], %%r11\n");
!!#                         !data_ld = b_DATA_ARRAY[rnd_cnt+a_addr_sel];
!!#                         !IJ_printf (th_M, "\tsetx\t0x%016llx, %%r1, %%r10\n",
!!#                         !        data_ld);
!!#                         !IJ_printf (th_M, "\tsetx\t0x%016llx, %%r1, %%r14\n",
!!#                         !        0x00000000000000ff);
!!#                         !IJ_printf (th_M, "\tand\t%%r10, %%r14, %%r10\n");
!!#                         !IJ_printf (th_M, "\tcmp\t%%r10, %%r11\n");
!!#                         !IJ_printf (th_M, "\tbne h_bad_end\n");
!!#                         !IJ_printf (th_M, "\tnop\n");
!!# 
!!#  			! cache able store and load to main memory 
!!#                         if(random()%4 == 0) {
!!#                         IJ_printf ("diag.j", 1839, th_M, "\tsetx\t0x%016llx, %%r1, %%r9\n",
!!#                                 mem_ad);
!!#                         IJ_printf ("diag.j", 1841, th_M, "\tsetx\t0x%016llx, %%r1, %%r10\n",
!!#                                 data_st);
!!#                         if(random()%2) {
!!#                         IJ_printf ("diag.j", 1844, th_M, "\tstx\t%%r10, [%%r9]\n");
!!#                         } else {
!!#                         IJ_printf ("diag.j", 1846, th_M, "\tldx\t[%%r9], %%r10\n"); 
!!#                         }
!!#                         mem_ad = IJ_get_rvar_val64("diag.j", 1848, Rv_memaddr_pattern);
!!#                         IJ_update_rvar("diag.j", 1849, Rv_memaddr_pattern);
!!#                         }
!!# 
!!#                         rnd_cnt--;
!!#                          }
!!#                         } ! of if(b_a_wr_cntr >=10)
!!# 
!!#                         ! HALF WORD LOADS
!!#                         a_addr_sel = random() %500;
!!# 
!!#                         if(h_a_wr_cntr >= 10 ) {
!!#                         while (a_addr_sel + 9 >= h_a_wr_cntr ) {
!!#                         a_addr_sel = random() %500;
!!# 	                !IJ_printf (th_M, "!DEBUG 3: a_addr_sel =  0x%016llx, a_wr_cntr = %d\n", a_addr_sel, a_wr_cntr); 
!!#                          }
!!#                         rnd_cnt = random() % 8; ! 4 ld(.) from random loc which is already stored
!!# 	                !IJ_printf (th_M, "!DEBUG 4: rnd_cnt =  0x%016llx, h_a_wr_cntr= %d,a_addr_sel= %d\n", rnd_cnt,h_a_wr_cntr,a_addr_sel); 
!!#                         while(rnd_cnt > 0 ) {
!!#                         IJ_printf ("diag.j", 1869, th_M, "\tsetx\t0x%016llx, %%r1, %%r12\n",
!!#                                 h_ADDR_ARRAY[rnd_cnt+a_addr_sel]);
!!#                         IJ_printf ("diag.j", 1871, th_M, "\tlduh\t[%%r12], %%r11\n");
!!#                         !data_ld = h_DATA_ARRAY[rnd_cnt+a_addr_sel];
!!#                         !IJ_printf (th_M, "\tsetx\t0x%016llx, %%r1, %%r10\n",
!!#                         !        data_ld);
!!#                         !IJ_printf (th_M, "\tsetx\t0x%016llx, %%r1, %%r14\n",
!!#                         !        0x000000000000ffff);
!!#                         !IJ_printf (th_M, "\tand\t%%r10, %%r14, %%r10\n");
!!#                         !IJ_printf (th_M, "\tcmp\t%%r10, %%r11\n");
!!#                         !IJ_printf (th_M, "\tbne h_bad_end\n");
!!#                         !IJ_printf (th_M, "\tnop\n");
!!#                         rnd_cnt--;
!!#                          }
!!#                         } ! of if(h_a_wr_cntr >=10)
!!# 
!!#                         ! WORD LOADS
!!#                         a_addr_sel = random() %500;
!!# 
!!#                         if(w_a_wr_cntr >= 10 ) {
!!#                         while (a_addr_sel + 9 >= w_a_wr_cntr ) {
!!#                         a_addr_sel = random() %500;
!!# 	                !IJ_printf (th_M, "!DEBUG 3: a_addr_sel =  0x%016llx, a_wr_cntr = %d\n", a_addr_sel, a_wr_cntr); 
!!#                          }
!!#                         rnd_cnt = random() % 8; ! 4 ld(.) from random loc which is already stored
!!# 	                !IJ_printf (th_M, "!DEBUG 4: rnd_cnt =  0x%016llx, w_a_wr_cntr= %d,a_addr_sel= %d\n", rnd_cnt,w_a_wr_cntr,a_addr_sel); 
!!#                         while(rnd_cnt > 0 ) {
!!#                         IJ_printf ("diag.j", 1898, th_M, "\tsetx\t0x%016llx, %%r1, %%r12\n",
!!#                                 w_ADDR_ARRAY[rnd_cnt+a_addr_sel]);
!!#                         IJ_printf ("diag.j", 1900, th_M, "\tlduw\t[%%r12], %%r11\n");
!!#                         !data_ld = w_DATA_ARRAY[rnd_cnt+a_addr_sel];
!!#                         !IJ_printf (th_M, "\tsetx\t0x%016llx, %%r1, %%r10\n",
!!#                         !        data_ld);
!!#                         !IJ_printf (th_M, "\tsetx\t0x%016llx, %%r1, %%r14\n",
!!#                         !        0x00000000ffffffff);
!!#                         !IJ_printf (th_M, "\tand\t%%r10, %%r14, %%r10\n");
!!#                         !IJ_printf (th_M, "\tcmp\t%%r10, %%r11\n");
!!#                         !IJ_printf (th_M, "\tbne h_bad_end\n");
!!#                         !IJ_printf (th_M, "\tnop\n");
!!#                         rnd_cnt--;
!!#                          }
!!#                         } ! of if(w_a_wr_cntr >=10)
!!# 
!!#                         ! X-WORD LOADS
!!#                         a_addr_sel = random() %500;
!!# 
!!#                         if(x_a_wr_cntr >= 10 ) {
!!#                         while (a_addr_sel + 9 >= x_a_wr_cntr ) {
!!#                         a_addr_sel = random() %500;
!!# 	                !IJ_printf (th_M, "!DEBUG 3: a_addr_sel =  0x%016llx, a_wr_cntr = %d\n", a_addr_sel, a_wr_cntr); 
!!#                          }
!!#                         rnd_cnt = random() % 8; ! 4 ld(.) from random loc which is already stored
!!# 	                !IJ_printf (th_M, "!DEBUG 4: rnd_cnt =  0x%016llx, x_a_wr_cntr= %d,a_addr_sel= %d\n", rnd_cnt,x_a_wr_cntr,a_addr_sel); 
!!#                         while(rnd_cnt > 0 ) {
!!#                         IJ_printf ("diag.j", 1927, th_M, "\tsetx\t0x%016llx, %%r1, %%r12\n",
!!#                                 x_ADDR_ARRAY[rnd_cnt+a_addr_sel]);
!!#                         IJ_printf ("diag.j", 1929, th_M, "\tldx\t[%%r12], %%r11\n");
!!#                         !data_ld = x_DATA_ARRAY[rnd_cnt+a_addr_sel];
!!#                         !IJ_printf (th_M, "\tsetx\t0x%016llx, %%r1, %%r10\n",
!!#                         !        data_ld);
!!#                         !IJ_printf (th_M, "\tcmp\t%%r10, %%r11\n");
!!#                         !IJ_printf (th_M, "\tbne h_bad_end\n");
!!#                         !IJ_printf (th_M, "\tnop\n");
!!#                         rnd_cnt--;
!!#                          }
!!#                         } ! of if(x_a_wr_cntr >=10)
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
