// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: pio_rnd_basic3_1b_rand_1.s
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
   random seed:	348313776
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

	setx	0x000000007100d005, %r1, %r9
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



	setx	0x000000805f1a51ea, %r1, %r9
	setx	0x43ac059751920a06, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e1b3a66, %r1, %r9
	setx	0xe777a7c3c3fde2c7, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f143a14, %r1, %r9
	setx	0x64b9c3f9eaf4fc4e, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c88d101ec1, %r1, %r9
	setx	0x27c115c7dab2b810, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d146794e65, %r1, %r9
	setx	0x58951e5778bbcfd3, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e8452b9891, %r1, %r9
	setx	0xbf00c3c45d5afd2f, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000fa585d67df, %r1, %r9
	setx	0x4d73e84a93e4f9f0, %r1, %r10
	stb	%r10, [%r9]
	setx	0x0000008063a73f28, %r1, %r9
	setx	0x512f03e72e9573aa, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e39529a, %r1, %r9
	setx	0x0f88b5e05f008dff, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f9b1398, %r1, %r9
	setx	0x483e8740bbc74bf5, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c7fd1d5a3a, %r1, %r9
	setx	0xd8de0c5fed3417fc, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000da97baa70b, %r1, %r9
	setx	0xe4621f158a5118f3, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e453063573, %r1, %r9
	setx	0x1fe5beb6558f6428, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000fa0f336468, %r1, %r9
	setx	0xc0ce506caf30f6d5, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c88d101ec1, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000803987598d, %r1, %r9
	setx	0xadb2e1e4c908ba2a, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e38d23b, %r1, %r9
	setx	0x8c5ac5725f86103c, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f7f3554, %r1, %r9
	setx	0xe4a7603abf8b8702, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000cdd12c02ab, %r1, %r9
	setx	0xd0b61ab63bae17cc, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000dbcc423c65, %r1, %r9
	setx	0x567810f667e4842a, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ee6cbd63b1, %r1, %r9
	setx	0xec5bbec5a926c30a, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000fdcbfa9909, %r1, %r9
	setx	0x81e135a3077ec192, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000fa0f336468, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000e453063573, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000da97baa70b, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000c7fd1d5a3a, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800f9b1398, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800e39529a, %r1, %r12
	ldub	[%r12], %r11
	setx	0x00000080a92a7f0e, %r1, %r9
	setx	0x5247e35cd0484884, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e5fb81b, %r1, %r9
	setx	0xbda9bf3f2d8826a7, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f4496a2, %r1, %r9
	setx	0xfb56475a712f9c01, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000cd98c2ef52, %r1, %r9
	setx	0x4cbccadddd77cf25, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d3b5fbd9d1, %r1, %r9
	setx	0x78285ee6bbae45cf, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e26684214a, %r1, %r9
	setx	0xc2eeef3a39810872, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000fdcc8f1e92, %r1, %r9
	setx	0xd4b849a2aa62b7fa, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e5fb81b, %r1, %r12
	ldub	[%r12], %r11
	setx	0x00000080a92a7f0e, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000fdcbfa9909, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000ee6cbd63b1, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000dbcc423c65, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000cdd12c02ab, %r1, %r12
	ldub	[%r12], %r11
	setx	0x00000080de984299, %r1, %r9
	setx	0x1bf1e850e1aade8f, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e9fc1e8, %r1, %r9
	setx	0x868ef11e70baeaba, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800fb13b4c, %r1, %r9
	setx	0x37320b6cb946de00, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ca2ea109df, %r1, %r9
	setx	0x676318c181b11d9d, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d839011196, %r1, %r9
	setx	0x3fcb1ea0b5099094, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e9fefecfe0, %r1, %r9
	setx	0x9c7a9154ac8493c1, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000fa64974084, %r1, %r9
	setx	0xd48c034759ddcef4, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000803987598d, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000fa0f336468, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000e453063573, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000da97baa70b, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000c7fd1d5a3a, %r1, %r12
	ldub	[%r12], %r11
	setx	0x00000080714991e0, %r1, %r9
	setx	0x3c6ee394d60bd48b, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e0662f7, %r1, %r9
	setx	0xbff377e9a0ba8938, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f4a78ec, %r1, %r9
	setx	0x4fb21a42eb545912, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c51613c1bb, %r1, %r9
	setx	0x2d8d930513e93c01, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d845844e67, %r1, %r9
	setx	0xeb7a1a5abeb84228, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000efa1bbae8b, %r1, %r9
	setx	0x9069c44747ad6976, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f8a4ac8563, %r1, %r9
	setx	0x37f55a7f7dfbf380, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ca2ea109df, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800fb13b4c, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800e9fc1e8, %r1, %r12
	ldub	[%r12], %r11
	setx	0x00000080de984299, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000fdcc8f1e92, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000e26684214a, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000d3b5fbd9d1, %r1, %r12
	ldub	[%r12], %r11
	setx	0x00000080a99a20a6, %r1, %r9
	setx	0x841815ef5a416b8a, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e772df4, %r1, %r9
	setx	0x314cedb6876f66b5, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800faf6b48, %r1, %r9
	setx	0x883ccb6ce8c40a93, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c7c8031df4, %r1, %r9
	setx	0xe47eb126b71c502f, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d210775839, %r1, %r9
	setx	0xb8bf32e2621ce3e4, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ecae47fe4a, %r1, %r9
	setx	0xcc7b63ccb355cf49, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f12c4f347e, %r1, %r9
	setx	0xa891672d139c1fd9, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000fa64974084, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000e9fefecfe0, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000802a8b0fa9, %r1, %r9
	setx	0x176129aca37a3fad, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e0125e1, %r1, %r9
	setx	0xd617def5b0f041cb, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f6d79eb, %r1, %r9
	setx	0x1eba1789b47c6263, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000cf5afd6472, %r1, %r9
	setx	0x0735c88094d4f364, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d14251c5c8, %r1, %r9
	setx	0x8e6bb608f19dd9a5, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e002243ead, %r1, %r9
	setx	0x432f4b0a3212b1ad, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000fe6cb0fae7, %r1, %r9
	setx	0x2ea1091349e3cd14, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e0662f7, %r1, %r12
	ldub	[%r12], %r11
	setx	0x00000080a1a5da17, %r1, %r9
	setx	0x25ccf04184769ff6, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e001929, %r1, %r9
	setx	0x40e3104e4911a2c9, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f7d66d4, %r1, %r9
	setx	0x37c1fb58c777d22b, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ccb0cf8873, %r1, %r9
	setx	0x9929e86bc040ac72, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ddd8eb4e96, %r1, %r9
	setx	0xb5a0768259d91cd9, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000eac1aa87d3, %r1, %r9
	setx	0x154c0704fd74a349, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f326be6af0, %r1, %r9
	setx	0x15502bdef8ebb6ba, %r1, %r10
	stb	%r10, [%r9]
	setx	0x00000080406777ca, %r1, %r9
	setx	0x82dc2a1f791d4119, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e9511fe, %r1, %r9
	setx	0xe021d410f3cb8de4, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f6a0638, %r1, %r9
	setx	0x8868527a63e9af8f, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c7f6dfa4d7, %r1, %r9
	setx	0x6bca5cbdbccf882d, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000dd02cd5279, %r1, %r9
	setx	0x320a8080e9f7c815, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e8d2d867a9, %r1, %r9
	setx	0xf40cd9157aa7057d, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000fdf2bf96a7, %r1, %r9
	setx	0xc5d4602d648eedda, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ee6cbd63b1, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000dbcc423c65, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000cdd12c02ab, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800f7f3554, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800e38d23b, %r1, %r12
	ldub	[%r12], %r11
	setx	0x00000080f4d7c545, %r1, %r9
	setx	0x5fa62f1bedce70a0, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e739f58, %r1, %r9
	setx	0xdf3f7228a5098662, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f96f45f, %r1, %r9
	setx	0x824dac5dc0fa4034, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000cab1dfde1b, %r1, %r9
	setx	0x1062a6573aa5980c, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000de4085dcce, %r1, %r9
	setx	0xf7b91dd1c5f911e0, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e23c974eeb, %r1, %r9
	setx	0x1282bc00ffeb558e, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f29c6612eb, %r1, %r9
	setx	0x9ae361c175dc2b25, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e9511fe, %r1, %r12
	ldub	[%r12], %r11
	setx	0x00000080406777ca, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000f326be6af0, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000eac1aa87d3, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000ddd8eb4e96, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000ccb0cf8873, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800f7d66d4, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000804b9b2f30, %r1, %r9
	setx	0xdc10792974fd309e, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800ea42556, %r1, %r9
	setx	0x1b07af80c126a016, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800fd2c38a, %r1, %r9
	setx	0x9f50fac5d43d15e2, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c5906c681f, %r1, %r9
	setx	0xff60e6f7ca1cd0c9, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000de0e9a5fad, %r1, %r9
	setx	0x37a5457f6d9b8a58, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e90b9052dd, %r1, %r9
	setx	0xdb59407abba9c719, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f0cde8ff8c, %r1, %r9
	setx	0x2481068958885bbe, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e001929, %r1, %r12
	ldub	[%r12], %r11
	setx	0x00000080735f1f6e, %r1, %r9
	setx	0x7ead018b4f197113, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800eb3bab7, %r1, %r9
	setx	0x780d7ed7c368fff6, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f36172b, %r1, %r9
	setx	0x549e1cbdbc5334d1, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ca4948db7d, %r1, %r9
	setx	0x3c6f67c2db2fc893, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d8b729c034, %r1, %r9
	setx	0x4f21e900102b23f8, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e26d5db000, %r1, %r9
	setx	0x3a3972128de608aa, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f1470c01b8, %r1, %r9
	setx	0x76856471ddc62caa, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f6a0638, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800e9511fe, %r1, %r12
	ldub	[%r12], %r11
	setx	0x00000080406777ca, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000f326be6af0, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000eac1aa87d3, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000ddd8eb4e96, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000ccb0cf8873, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000805deb31c9, %r1, %r9
	setx	0xfea9e76318719720, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800edfac81, %r1, %r9
	setx	0xaa0c7c53a2c4a368, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f22f2ed, %r1, %r9
	setx	0xb873cce8e4984b33, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c410cab497, %r1, %r9
	setx	0xa372fa73e6412b22, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d31867b65c, %r1, %r9
	setx	0xc48dd5b4116319a6, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e4872e7b36, %r1, %r9
	setx	0xacaa14249d9e3cb8, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f887de78a9, %r1, %r9
	setx	0xf2ef345233fe99f4, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000cf5afd6472, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800f6d79eb, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800e0125e1, %r1, %r12
	ldub	[%r12], %r11
	setx	0x0000008027fce69d, %r1, %r9
	setx	0x4c7e3472a1c1a4c3, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e788192, %r1, %r9
	setx	0x558b7a95401d2aac, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f7129c5, %r1, %r9
	setx	0x8aa359b9135867df, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c4de1ef45d, %r1, %r9
	setx	0xf03df0aef5c952da, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000dedc844c8b, %r1, %r9
	setx	0x9010307adc2e6072, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e2a174dce6, %r1, %r9
	setx	0x58695a39b5a2eeee, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f610c0c0ef, %r1, %r9
	setx	0x5a903ca6b024858d, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800fd2c38a, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800ea42556, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000802cc2d66f, %r1, %r9
	setx	0x79731e422abd4999, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800ef2e9b1, %r1, %r9
	setx	0x6379bc27e01bc0a3, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f2649b6, %r1, %r9
	setx	0x5347c5fa9e1b6a19, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c44c69dcac, %r1, %r9
	setx	0x702ee601c59aab34, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000dcc66f1a99, %r1, %r9
	setx	0xf7117c9c0b5b8a48, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e2a2e9e225, %r1, %r9
	setx	0x5b830d0253a8a0ad, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000fa3db84ec4, %r1, %r9
	setx	0x6eeb73853b1c3603, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f0cde8ff8c, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000e90b9052dd, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000de0e9a5fad, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000c5906c681f, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000806523a125, %r1, %r9
	setx	0x72be91aac303215b, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800ee12473, %r1, %r9
	setx	0xa3c17346dd5dc144, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f12f295, %r1, %r9
	setx	0xd166f3c6cb8ea4ab, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000cf16190e26, %r1, %r9
	setx	0x78aee79ec47ba128, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d01b7cfa3f, %r1, %r9
	setx	0x105fafbbd5daef63, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000eafea38d1b, %r1, %r9
	setx	0x24ca76ad984bb63c, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000fd35d4b4fb, %r1, %r9
	setx	0x6ef88ee0aab7c0fe, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800faf6b48, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800e772df4, %r1, %r12
	ldub	[%r12], %r11
	setx	0x00000080a99a20a6, %r1, %r12
	ldub	[%r12], %r11
	setx	0x00000080e07734ff, %r1, %r9
	setx	0x9a86885072c53054, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e007214, %r1, %r9
	setx	0xe05e9d0e0838463a, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f4aee93, %r1, %r9
	setx	0x76d7081411a6c7c3, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000cc09ae383a, %r1, %r9
	setx	0xeca64c9cfcf50b96, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d97848784b, %r1, %r9
	setx	0x7afd582fe59476fd, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000eea49379ab, %r1, %r9
	setx	0x6a11d40d7a75ffff, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f45bb665a5, %r1, %r9
	setx	0x35f4f83e8c82d920, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f326be6af0, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000eac1aa87d3, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000ddd8eb4e96, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000802fe7a2e6, %r1, %r9
	setx	0x0b24e18179e93f6e, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e7b457d, %r1, %r9
	setx	0x5bb46bd33ba680f2, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f24ec9b, %r1, %r9
	setx	0x5188901176cd1c0b, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c19de6dd88, %r1, %r9
	setx	0xe600877a1af7d0d2, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d27ab03556, %r1, %r9
	setx	0xdece993e62ede601, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e20a8ff09b, %r1, %r9
	setx	0x9aad2591e5f438fe, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f62be5e76e, %r1, %r9
	setx	0x407e895fb8f39375, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d01b7cfa3f, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000cf16190e26, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800f12f295, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000803db28e69, %r1, %r9
	setx	0x258d42c34ed6b90d, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e3ebb23, %r1, %r9
	setx	0xf70e8289a29f5d1e, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f6237fa, %r1, %r9
	setx	0x78160a22e3b84f1a, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c8b715017b, %r1, %r9
	setx	0x9a8f24a059270220, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d64303e3e1, %r1, %r9
	setx	0x548694b46ad1a8f6, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ebc297109e, %r1, %r9
	setx	0xe757f0ab1607a82b, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f48db174b8, %r1, %r9
	setx	0xafb9aab7999fdf8e, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e788192, %r1, %r12
	ldub	[%r12], %r11
	setx	0x0000008027fce69d, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000f887de78a9, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000e4872e7b36, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000d31867b65c, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000c410cab497, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000809e1ee75c, %r1, %r9
	setx	0xc7e7289e2b21c6a0, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800ec4f414, %r1, %r9
	setx	0xe0bc9d976911eed3, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800fc6d1d1, %r1, %r9
	setx	0x5f4c28581872107b, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c0009fe340, %r1, %r9
	setx	0x3491169d6d08c313, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000df253417ec, %r1, %r9
	setx	0xdb30932623dfe216, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e396e33552, %r1, %r9
	setx	0x322a6947ff1d1093, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f37959f694, %r1, %r9
	setx	0x2b5f64618911793f, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000dcc66f1a99, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000c44c69dcac, %r1, %r12
	ldub	[%r12], %r11
	setx	0x00000080a139e92c, %r1, %r9
	setx	0x78c80dc3aea20007, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800ec25a0d, %r1, %r9
	setx	0x163c9a3f4ea6b683, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800fdf27cc, %r1, %r9
	setx	0xd95fc63820b8160d, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c25bbfea75, %r1, %r9
	setx	0xc8a66dd56afce728, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d9e46aa377, %r1, %r9
	setx	0x11bbc033fd90d9ab, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e0b9982789, %r1, %r9
	setx	0x55f3555fcedc7694, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f4b3e6a66f, %r1, %r9
	setx	0x1902ce82a9d0629b, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d97848784b, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000cc09ae383a, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800f4aee93, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800e007214, %r1, %r12
	ldub	[%r12], %r11
	setx	0x00000080e07734ff, %r1, %r12
	ldub	[%r12], %r11
	setx	0x00000080f2f67bae, %r1, %r9
	setx	0xe196603bcf073761, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e427512, %r1, %r9
	setx	0xde1113d54962d401, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f12bca1, %r1, %r9
	setx	0xf7be433827a6b97c, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c61e2fd156, %r1, %r9
	setx	0xc390b772452a8baf, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000db040ee54a, %r1, %r9
	setx	0xcc7d3e5c34a533b4, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e3d73eebcf, %r1, %r9
	setx	0x44558de1f9ad2e27, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f5de9dba8b, %r1, %r9
	setx	0x29e33b2f319c8c58, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000804f5a070c, %r1, %r9
	setx	0x9dcd6ff12b0c89ba, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e4785fe, %r1, %r9
	setx	0xf192f2ee80349cb0, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f3aff94, %r1, %r9
	setx	0xf7bc5231a11699b2, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000cdf2a185f0, %r1, %r9
	setx	0xfb16ed9e0bb1eefd, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d34429de20, %r1, %r9
	setx	0xee2a9a5d10679cc0, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e55609bd83, %r1, %r9
	setx	0xa520601aa8537b58, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000faa79715fa, %r1, %r9
	setx	0xc3aec14ce35a18d7, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000fd35d4b4fb, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000eafea38d1b, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000d01b7cfa3f, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000805409d92f, %r1, %r9
	setx	0xd3788b72edbf5b7a, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e1ff3d5, %r1, %r9
	setx	0xe1227dbb4c3493e7, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f9d92f2, %r1, %r9
	setx	0x78896a1fb25d8c73, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000cb99e7ffc4, %r1, %r9
	setx	0xd1e5caa1dc8e45ee, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000dc0a3ed0dd, %r1, %r9
	setx	0xc5662ba10174736d, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ef412f5da0, %r1, %r9
	setx	0xeb8b1e2a0d7713a4, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f5dc956ea8, %r1, %r9
	setx	0x6d8e0df2915e20eb, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f0cde8ff8c, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000e90b9052dd, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000de0e9a5fad, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000c5906c681f, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800fd2c38a, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000807aeaee23, %r1, %r9
	setx	0x0570ce34d98f92f9, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e6f0a1c, %r1, %r9
	setx	0xf9528b4a07059ba5, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800ff4cf7b, %r1, %r9
	setx	0x1686f012056c548a, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c26965f683, %r1, %r9
	setx	0xcefe6bfcfdb1e744, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000de2c549e8b, %r1, %r9
	setx	0x5464af7d2172428d, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e2d3bfbb6e, %r1, %r9
	setx	0xf959096ef6fcba8e, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000fc381737d4, %r1, %r9
	setx	0xcc5a8c3ec126e4c9, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000fa3db84ec4, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000e2a2e9e225, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000dcc66f1a99, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000802772a328, %r1, %r9
	setx	0x974ed256b024d209, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800ea91e35, %r1, %r9
	setx	0x6c45aca3b7c30605, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f7001c6, %r1, %r9
	setx	0x150bdfe7899061a1, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c733bb5b90, %r1, %r9
	setx	0xa6008277185497a9, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d180be87eb, %r1, %r9
	setx	0x1778698f70e6f501, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000efa6493643, %r1, %r9
	setx	0xfc18cadac5cf188b, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000fb9f50445b, %r1, %r9
	setx	0x02861ca90ea0fa14, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800ee12473, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000806523a125, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000fa3db84ec4, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000e2a2e9e225, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000dcc66f1a99, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000807f1a6bcc, %r1, %r9
	setx	0x6de57f85e8dcfe54, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800eeccdb3, %r1, %r9
	setx	0x4dfc33d66e968373, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800fa65ad0, %r1, %r9
	setx	0x5ad40592715e3ec1, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000cb95af18d9, %r1, %r9
	setx	0x3c2f1c94d26086f6, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d31301db4f, %r1, %r9
	setx	0x0af1fc8833592e5a, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e4fc983b3a, %r1, %r9
	setx	0x52fe74afcd7122a1, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000fde00ccecd, %r1, %r9
	setx	0xa2f4cfd80e7ff6dc, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000806e1f7337, %r1, %r9
	setx	0x526322c9557bed8d, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e41bb9e, %r1, %r9
	setx	0x89a2499881af8805, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800fa7fa35, %r1, %r9
	setx	0x1c4baa0589b50381, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c7c342948e, %r1, %r9
	setx	0x91f37084d83dd731, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d1397e5363, %r1, %r9
	setx	0xbd85baad624b3e2a, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e2d652ed28, %r1, %r9
	setx	0x49cf27ff6e5ea1b3, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f557c934c1, %r1, %r9
	setx	0x32ef821ae3259063, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f12f295, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000804d5730a4, %r1, %r9
	setx	0xf3bfbb22b72770b9, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e1f79f5, %r1, %r9
	setx	0x41258462e63c0eff, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f9d41d1, %r1, %r9
	setx	0x91f74daea36abf4b, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c5e845b2ed, %r1, %r9
	setx	0xf93ddfbc24ba731f, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ddbf4144f9, %r1, %r9
	setx	0x43bf78cb18923a87, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e9f3ad6766, %r1, %r9
	setx	0x384aa88221789124, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000fa5d61f383, %r1, %r9
	setx	0xf4ccaa90e7d72222, %r1, %r10
	stb	%r10, [%r9]
	setx	0x0000008093acb5cf, %r1, %r9
	setx	0x5743bb87803bddfd, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e608213, %r1, %r9
	setx	0x272bd9424996fc4f, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f26f93e, %r1, %r9
	setx	0x05e3362e46a04726, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c70b347c0d, %r1, %r9
	setx	0x73568675e821ad31, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d182968983, %r1, %r9
	setx	0x3d285b3c2ea04d87, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e14010f38c, %r1, %r9
	setx	0xf83bf9552f75e3ad, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f1d5d9f031, %r1, %r9
	setx	0x5535392321ae49aa, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e6f0a1c, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000807aeaee23, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000f5dc956ea8, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000802a231913, %r1, %r9
	setx	0xc881b520a3843363, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e3289f7, %r1, %r9
	setx	0x1a0ee10163920fd9, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800fbd137c, %r1, %r9
	setx	0x847f161e4342e387, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c9f7b09424, %r1, %r9
	setx	0x628c055ca717c23f, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000dcbd0fee5b, %r1, %r9
	setx	0xfd579bcd76af62e7, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ef2c2e7782, %r1, %r9
	setx	0x3d088b310bcc8ed1, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f9a7da9d0b, %r1, %r9
	setx	0xe6a75a43e87fa3ba, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000eac1aa87d3, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000ddd8eb4e96, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000ccb0cf8873, %r1, %r12
	ldub	[%r12], %r11
	setx	0x0000008044c1bfda, %r1, %r9
	setx	0xbb4079ae4c9dca11, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800ef3e87b, %r1, %r9
	setx	0x90f7fbf891a1a670, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f756f25, %r1, %r9
	setx	0x3788a83ca3893f8a, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c19a4dda34, %r1, %r9
	setx	0xd5c214a93f098cc9, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000df5e7654a6, %r1, %r9
	setx	0x147103749900e572, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e3fd012b82, %r1, %r9
	setx	0xb09edeb5c217e410, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f79b322c88, %r1, %r9
	setx	0x9fb1f950a97ee309, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f24ec9b, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800e7b457d, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000806ce5de80, %r1, %r9
	setx	0xa3d96c8ee36a1890, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e34fd0b, %r1, %r9
	setx	0xe3aa8b5ca1a8d6ac, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800fbbd429, %r1, %r9
	setx	0x25e44cddc772d3d2, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000cbd0d26f0b, %r1, %r9
	setx	0xa877f54b05acd6d5, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000db9137a251, %r1, %r9
	setx	0x54beb98b53a64f33, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ed3a36b04f, %r1, %r9
	setx	0xbe9b88b6228ba9e7, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f18db3d78f, %r1, %r9
	setx	0x773d5b837a836099, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000cb95af18d9, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800fa65ad0, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800eeccdb3, %r1, %r12
	ldub	[%r12], %r11
	setx	0x00000080dbe2f007, %r1, %r9
	setx	0x84498aebb6fe184a, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800ed9a8cd, %r1, %r9
	setx	0x7e85c80e88d928e9, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f32ecaa, %r1, %r9
	setx	0xc6f5ce5e9b711dd4, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c20772c1da, %r1, %r9
	setx	0x0cac2649b10075fb, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d9713fa422, %r1, %r9
	setx	0x680a3d3cc46ce755, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e923c3f7e5, %r1, %r9
	setx	0x7e88c5141af5c895, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f8d92dce92, %r1, %r9
	setx	0x59bca95d9c96d1a0, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c19a4dda34, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800f756f25, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800ef3e87b, %r1, %r12
	ldub	[%r12], %r11
	setx	0x0000008044c1bfda, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000f9a7da9d0b, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000ef2c2e7782, %r1, %r12
	ldub	[%r12], %r11
	setx	0x00000080c3518577, %r1, %r9
	setx	0x827538ab32d1d4c7, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e3377a5, %r1, %r9
	setx	0xb503ed37aa2d290d, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800fac6410, %r1, %r9
	setx	0xc2c67ed705ebbfac, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c0eaa90f9f, %r1, %r9
	setx	0x6c6c12f3f2029092, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000df658f90dc, %r1, %r9
	setx	0x1dbb37f1fce0a734, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e70e995f5f, %r1, %r9
	setx	0x8f53cad470e6b7b0, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000fcfc17dd76, %r1, %r9
	setx	0x8761ecb5f517ef97, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000805deb31c9, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000f1470c01b8, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000e26d5db000, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000d8b729c034, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000805353f02e, %r1, %r9
	setx	0xb668fedb5b9af062, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e2e23a9, %r1, %r9
	setx	0x24cce5836062397a, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f18e76e, %r1, %r9
	setx	0x4844f7994d15432b, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ce909c4704, %r1, %r9
	setx	0x13f56452ac5aaacb, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ddf003e6d4, %r1, %r9
	setx	0xec74e344e640e8e8, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e63e183ff9, %r1, %r9
	setx	0xd5f9c08c666d8122, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f322670aea, %r1, %r9
	setx	0xd29715119e352ec6, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f12c4f347e, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000ecae47fe4a, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000803945951e, %r1, %r9
	setx	0x72b0f8df924b5707, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800ee645be, %r1, %r9
	setx	0x16701cf7bda588f0, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800fbc5d25, %r1, %r9
	setx	0x808fdf32aa1cee9f, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000cf694f18df, %r1, %r9
	setx	0xff2dc8caac80286d, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d66cac2d9b, %r1, %r9
	setx	0xa7bf0bb56d0b282e, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e0415b356b, %r1, %r9
	setx	0xea6c1e66db59207d, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f71fb3924c, %r1, %r9
	setx	0xdc73c69d86393f28, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000fa5d61f383, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000e9f3ad6766, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000ddbf4144f9, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000c5e845b2ed, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800f9d41d1, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800e1f79f5, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000804d5730a4, %r1, %r12
	ldub	[%r12], %r11
	setx	0x00000080c2392664, %r1, %r9
	setx	0x202add4874d04bf9, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e51824d, %r1, %r9
	setx	0x180d3c0ddb8887e8, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800fc5ebcf, %r1, %r9
	setx	0x1bd99ad8c9269600, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c9a26adcb0, %r1, %r9
	setx	0xa2b765bb774a29d6, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000df14dba436, %r1, %r9
	setx	0x1a6e7034d842dde9, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e0278da789, %r1, %r9
	setx	0x854599b051ce6778, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f05622a832, %r1, %r9
	setx	0x8920adf44ffa8e85, %r1, %r10
	stb	%r10, [%r9]
	setx	0x0000008079566908, %r1, %r9
	setx	0x07daf994207d641e, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e838b82, %r1, %r9
	setx	0x1a464ec4f787beb7, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800ff56e21, %r1, %r9
	setx	0x2f43baf52ef1a38c, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000cc465a6636, %r1, %r9
	setx	0xb7a9f8ca501463c6, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000de7607f390, %r1, %r9
	setx	0x95ab25c62593e711, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e36aa79d86, %r1, %r9
	setx	0xbbab744122f572eb, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f6ff9b0a1d, %r1, %r9
	setx	0x9fecc8c9872f737a, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000eac1aa87d3, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000ddd8eb4e96, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000ccb0cf8873, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800f7d66d4, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800e001929, %r1, %r12
	ldub	[%r12], %r11
	setx	0x0000008085aa24b4, %r1, %r9
	setx	0x325585b2a528108e, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e02e7ae, %r1, %r9
	setx	0x347315098cb7e4d2, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f7cfefe, %r1, %r9
	setx	0xa09d97973d767637, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ca329b3bc0, %r1, %r9
	setx	0xcf9020488f1f4f1a, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000df748ad4be, %r1, %r9
	setx	0x9b1c7581ee3627b0, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e0dc618426, %r1, %r9
	setx	0xce0de56b725d44f2, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000fde6ab8ecb, %r1, %r9
	setx	0x45206a0a4cb3d3d0, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000803db28e69, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000f62be5e76e, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000e20a8ff09b, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000d27ab03556, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000c19de6dd88, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800f24ec9b, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800e7b457d, %r1, %r12
	ldub	[%r12], %r11
	setx	0x00000080458fe950, %r1, %r9
	setx	0x07ee117ef16a4d3a, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800ebb939d, %r1, %r9
	setx	0xb4926a153338fada, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800ffc5d20, %r1, %r9
	setx	0xe911f91afb57a293, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000cfe6864b8f, %r1, %r9
	setx	0x7602b1cfe4606731, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d5ecebb073, %r1, %r9
	setx	0x56c73112f7f740f8, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000efa460bb9d, %r1, %r9
	setx	0x22f0a9b161e8ef85, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f8b543a214, %r1, %r9
	setx	0xdf3d4f9ba2f5fbf6, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ca329b3bc0, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800f7cfefe, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000805edc5011, %r1, %r9
	setx	0xef4452ec4f464935, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800eac1c8c, %r1, %r9
	setx	0x1e183ecbbb71c191, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f2159f5, %r1, %r9
	setx	0x829ea5312603e3d6, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000cfb6907299, %r1, %r9
	setx	0x506c650155cda2c4, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d3ebc48e5f, %r1, %r9
	setx	0x4ef77a1b61f1947b, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000eb45e2b7e0, %r1, %r9
	setx	0x910a58fd6450d518, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f5aad2d342, %r1, %r9
	setx	0x9b1abbc9d9624a9f, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f6ff9b0a1d, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000e36aa79d86, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000de7607f390, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000cc465a6636, %r1, %r12
	ldub	[%r12], %r11
	setx	0x0000008061642e70, %r1, %r9
	setx	0xc422bc7879ad7128, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e995813, %r1, %r9
	setx	0xfe5bfa80cd64a8b8, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f176abe, %r1, %r9
	setx	0x5a4d89f91ddc961b, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000cd23a90748, %r1, %r9
	setx	0x960ac2e59135be09, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000dcbbd3974a, %r1, %r9
	setx	0xe0d7dd4c94b12be9, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e6bb83ec84, %r1, %r9
	setx	0xded28f2d410af723, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000fb6cbdaff0, %r1, %r9
	setx	0x1ec9bff21f88dfeb, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f6ff9b0a1d, %r1, %r12
	ldub	[%r12], %r11
	setx	0x00000080711b2208, %r1, %r9
	setx	0xf7e7697c63093dd0, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e5af2ec, %r1, %r9
	setx	0x77ebbb787493edd2, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800fccd549, %r1, %r9
	setx	0x3000aaf0926548aa, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ced784987c, %r1, %r9
	setx	0x5debde16e6812ea0, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000dbd6444cca, %r1, %r9
	setx	0x2bfe84bb1c127c32, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e75c019188, %r1, %r9
	setx	0x8cc42968b43019c8, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f514285af3, %r1, %r9
	setx	0x012ce7ce415332a9, %r1, %r10
	stb	%r10, [%r9]
	setx	0x0000008018f8612c, %r1, %r9
	setx	0x9168161e9f48c0b8, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e2aa7ea, %r1, %r9
	setx	0x95dd1e2fe39d71fb, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f0a7198, %r1, %r9
	setx	0x5c2cf3dd56bc5dba, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c77891f786, %r1, %r9
	setx	0x154b810130d93daf, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d80a7a2ae5, %r1, %r9
	setx	0x76ae33027ed7537b, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e5a3ea68b7, %r1, %r9
	setx	0x89a7df790140d60f, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f511b62962, %r1, %r9
	setx	0x8ffc11602eaf2bc5, %r1, %r10
	stb	%r10, [%r9]
	setx	0x00000080d3a80ff2, %r1, %r9
	setx	0xe6d596d3867fa60a, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e26d97e, %r1, %r9
	setx	0xb51428340d45b893, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f123131, %r1, %r9
	setx	0x3cdfa5d3e0a0892f, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000cdb97cdd0c, %r1, %r9
	setx	0xc06a89d13d58597b, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d885db5c5f, %r1, %r9
	setx	0xde838b43b4c4b10c, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e28798c903, %r1, %r9
	setx	0x603ce705d824f201, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000fa1a12d049, %r1, %r9
	setx	0x1854a47787061b1e, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d845844e67, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000808e4bc1f0, %r1, %r9
	setx	0x7e58759df8072300, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e77ec78, %r1, %r9
	setx	0x59ca208dfb4f5593, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f837e04, %r1, %r9
	setx	0x375df434383a7ce8, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000cedf30e79d, %r1, %r9
	setx	0xadec76b3baacd421, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d942eb4ece, %r1, %r9
	setx	0xf9ba7881b14c7d50, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e1c805190d, %r1, %r9
	setx	0x69db143d2ab347e0, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f0c489b3c3, %r1, %r9
	setx	0xd4ddea756ce8137e, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e001929, %r1, %r12
	ldub	[%r12], %r11
	setx	0x00000080a1a5da17, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000fe6cb0fae7, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000e002243ead, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000d14251c5c8, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000cf5afd6472, %r1, %r12
	ldub	[%r12], %r11
	setx	0x0000008046ff5521, %r1, %r9
	setx	0x59d7553fa38956ef, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e4917aa, %r1, %r9
	setx	0xe80dc0512c17ddf8, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800fce6bd1, %r1, %r9
	setx	0xd0323ae15cf2f5c8, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c36a534d41, %r1, %r9
	setx	0xcffcf4026d9723c9, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d8e8c0e95c, %r1, %r9
	setx	0x5f8832849ba0e960, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ecde0f889d, %r1, %r9
	setx	0x6a69210459184858, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f1fba28c45, %r1, %r9
	setx	0x361f7e6491dc8e3d, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800fa65ad0, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800eeccdb3, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000807f1a6bcc, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000fb9f50445b, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000efa6493643, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000d180be87eb, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000c733bb5b90, %r1, %r12
	ldub	[%r12], %r11
	setx	0x00000080ebb82952, %r1, %r9
	setx	0x58a7cab7ce3408d3, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e306105, %r1, %r9
	setx	0x493373c49d73976f, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800fb50ae1, %r1, %r9
	setx	0x7b81d1663ab6a64d, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000cf701eae80, %r1, %r9
	setx	0x6cded5c464a5b122, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000dbc3bd264d, %r1, %r9
	setx	0x28a77bd559e8d859, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e669c73d33, %r1, %r9
	setx	0x855dc9a256197e47, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f2a8a16626, %r1, %r9
	setx	0xbd32953317db41c7, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000cdf2a185f0, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800f3aff94, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800e4785fe, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000804f5a070c, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000f5de9dba8b, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000e3d73eebcf, %r1, %r12
	ldub	[%r12], %r11
	setx	0x00000080d516d8f9, %r1, %r9
	setx	0x21d8cb8c88621e62, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800ec8fd39, %r1, %r9
	setx	0x48f268103c31de93, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f0f5320, %r1, %r9
	setx	0x84c5afbb56432389, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000cd182a5cfc, %r1, %r9
	setx	0xc55a366ed4028810, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d9ad03c4e9, %r1, %r9
	setx	0xfefa9b9f2d9235f2, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e69111e997, %r1, %r9
	setx	0xe5ba945d3262d773, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f88e1a31b0, %r1, %r9
	setx	0xaacbb9175221693f, %r1, %r10
	stb	%r10, [%r9]
	setx	0x0000008079566908, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000f05622a832, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000e0278da789, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000df14dba436, %r1, %r12
	ldub	[%r12], %r11
	setx	0x00000080b5eec22a, %r1, %r9
	setx	0x2131ea48ad4263cb, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800efb8213, %r1, %r9
	setx	0x7f0c60b84a4bb25c, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f8cccac, %r1, %r9
	setx	0x45cbecb99890ad7a, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c3f76ffd39, %r1, %r9
	setx	0xc4309ad80495d9c9, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d42918497d, %r1, %r9
	setx	0xc1f05f059d1815bb, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e9b2415912, %r1, %r9
	setx	0x9cdb25022f3423d1, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f33125aafe, %r1, %r9
	setx	0x2b22e1458b6a4e25, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e90b9052dd, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000de0e9a5fad, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000c5906c681f, %r1, %r12
	ldub	[%r12], %r11
	setx	0x00000080bba27dcb, %r1, %r9
	setx	0xcd38b61415e7d447, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800eee0a95, %r1, %r9
	setx	0xad14bc24cee7de82, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f9a1f4e, %r1, %r9
	setx	0xab5f09a7550f25af, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c6cb488d5d, %r1, %r9
	setx	0x769fbd70a9d5b6d6, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d3c148f3b8, %r1, %r9
	setx	0x17a7c2d6500d8ba6, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e34fbacd73, %r1, %r9
	setx	0x5ff70d92c279ae08, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000fe13f2cf43, %r1, %r9
	setx	0xc575b1ce4b7c1035, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000df253417ec, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000c0009fe340, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800fc6d1d1, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800ec4f414, %r1, %r12
	ldub	[%r12], %r11
	setx	0x0000008012bb6852, %r1, %r9
	setx	0x1bbf5c344222f000, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e4bd6d0, %r1, %r9
	setx	0xa7e928064cd13789, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f314168, %r1, %r9
	setx	0xadbcd4378b4b8d5f, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c47b7450db, %r1, %r9
	setx	0x358a9a42623fb214, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000dff5d06dd5, %r1, %r9
	setx	0x2cad4cdcbcdf6d19, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e29a36e9b6, %r1, %r9
	setx	0xf1c7bbc52dfd9db9, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f5869fb351, %r1, %r9
	setx	0x10d7f3532d8acfa3, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f33125aafe, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000e9b2415912, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000d42918497d, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000c3f76ffd39, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800f8cccac, %r1, %r12
	ldub	[%r12], %r11
	setx	0x00000080bb5d0949, %r1, %r9
	setx	0xd98cd3509ede0936, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e43d24a, %r1, %r9
	setx	0x5f101574bdb724e7, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f2d2d59, %r1, %r9
	setx	0x81cdb872c9847155, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c301aed5d3, %r1, %r9
	setx	0xd4dff607a5995f07, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000dc3a24fc57, %r1, %r9
	setx	0xe82d12ab880c36c5, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ef44b0ee2b, %r1, %r9
	setx	0x6bbe83c64e5dd05b, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000facd84d059, %r1, %r9
	setx	0xc1139ce9f1955599, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f5aad2d342, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000eb45e2b7e0, %r1, %r12
	ldub	[%r12], %r11
	setx	0x00000080e9e282a0, %r1, %r9
	setx	0xb8f6f650abdda1de, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e79b833, %r1, %r9
	setx	0xb92fddc627fa28eb, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f915de3, %r1, %r9
	setx	0x83e0406b6baca0a9, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c294549f95, %r1, %r9
	setx	0x7c7ed2c9acd1d2f5, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d05f66610b, %r1, %r9
	setx	0x83789c0ea447615d, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000efa493485a, %r1, %r9
	setx	0x7d82f6dc9b6c2d23, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f1cba9458f, %r1, %r9
	setx	0x49fe02b61c6acbbf, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000804934a08a, %r1, %r9
	setx	0xaa20cf37a445bcf9, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e20df12, %r1, %r9
	setx	0x759a5d92bb0de211, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800fd48f45, %r1, %r9
	setx	0x199a1787bdb6075e, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000cbba9fd7ab, %r1, %r9
	setx	0xfb009a16b0adefa6, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d24d875b5d, %r1, %r9
	setx	0x4054eb0846d36018, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e3b4921d40, %r1, %r9
	setx	0x528356bb49aa97db, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f5a7018cae, %r1, %r9
	setx	0x5699d5efd8b08ecd, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000806e1f7337, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000fde00ccecd, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000e4fc983b3a, %r1, %r12
	ldub	[%r12], %r11
	setx	0x00000080fc5e2521, %r1, %r9
	setx	0x2e2442dcf74fbc99, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800efe7ddb, %r1, %r9
	setx	0xd896fa98f2bc4266, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f2bd5bf, %r1, %r9
	setx	0xf64e23361df2e04c, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000cfa175d638, %r1, %r9
	setx	0x5e065bcde557a2af, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d73b4f140d, %r1, %r9
	setx	0xa49ff960d2f15a1e, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ee270ef83d, %r1, %r9
	setx	0x1640622881d5f089, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f5f5633ff2, %r1, %r9
	setx	0xbcc64a566fc05a41, %r1, %r10
	stb	%r10, [%r9]
	setx	0x00000080882c12e6, %r1, %r9
	setx	0xca086979ae772fb2, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e321c79, %r1, %r9
	setx	0xa95727db94a18212, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800fccefa5, %r1, %r9
	setx	0x22835b4e419bf141, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c701367eff, %r1, %r9
	setx	0xca201f3514ab2267, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d8396080ec, %r1, %r9
	setx	0x378f422ee47809f5, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ee30f7a25e, %r1, %r9
	setx	0xe9b723913a8d15fa, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000fb49cc1101, %r1, %r9
	setx	0x63e6ee192128db76, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f9b1398, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800e39529a, %r1, %r12
	ldub	[%r12], %r11
	setx	0x0000008093ce9b96, %r1, %r9
	setx	0x9cd04f4193e8414a, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800ea5d0ce, %r1, %r9
	setx	0x18f2fd9d3a15a243, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f8ff55f, %r1, %r9
	setx	0x3e0286dd74766e0a, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c14d098179, %r1, %r9
	setx	0x83f830438e9ad94d, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d071e04bb7, %r1, %r9
	setx	0x9f7d45581ae4a6da, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ecef7961a4, %r1, %r9
	setx	0x69613211aa2c5436, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f1f5a2948f, %r1, %r9
	setx	0x59bc4e74092b035c, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d839011196, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000804a4e4188, %r1, %r9
	setx	0x4bb2645502518dba, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800ee9f56a, %r1, %r9
	setx	0x125de04d986f25a8, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f729fb7, %r1, %r9
	setx	0xa4c93bab0bab0eaa, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c8f11e10a9, %r1, %r9
	setx	0xaad0a83dfbe92ebe, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d0cff0fdb0, %r1, %r9
	setx	0x1e237b2d1dc5d7db, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ef29ab1c6c, %r1, %r9
	setx	0x88f7a054110e6955, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f874a0beb6, %r1, %r9
	setx	0x44322b8ed8dd290d, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e34fbacd73, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000d3c148f3b8, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000c6cb488d5d, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800f9a1f4e, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800eee0a95, %r1, %r12
	ldub	[%r12], %r11
	setx	0x00000080bba27dcb, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000f33125aafe, %r1, %r12
	ldub	[%r12], %r11
	setx	0x00000080287f3c92, %r1, %r9
	setx	0x2150cc30faa9cea6, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800eb0e48c, %r1, %r9
	setx	0xc9a3609e25b17a5e, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800fdba812, %r1, %r9
	setx	0x1bfb5ae6faa7b94d, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000cba7453093, %r1, %r9
	setx	0xf3949fa2759539b3, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000de95af80b7, %r1, %r9
	setx	0x6b9297c23b04800b, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e8638b561d, %r1, %r9
	setx	0xec6bf79280e91e98, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f404e53632, %r1, %r9
	setx	0x05fc5dff679a092f, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d839011196, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000ca2ea109df, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800fb13b4c, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800e9fc1e8, %r1, %r12
	ldub	[%r12], %r11
	setx	0x00000080de984299, %r1, %r12
	ldub	[%r12], %r11
	setx	0x00000080a2ae6c62, %r1, %r9
	setx	0x3c04eec242289e61, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e380959, %r1, %r9
	setx	0x5ba694e856c89206, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800fa6cedf, %r1, %r9
	setx	0x52c6be02a921b0a5, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000cc9559100a, %r1, %r9
	setx	0xb349eef767447751, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d191df27a2, %r1, %r9
	setx	0x280746a64130681a, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e66df998fb, %r1, %r9
	setx	0xcf0a9ea123a1469c, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f915945542, %r1, %r9
	setx	0xd2b727c9aaff4e4b, %r1, %r10
	stb	%r10, [%r9]
	setx	0x0000008052e404e6, %r1, %r9
	setx	0xe2a069f62baaca6c, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e547ac0, %r1, %r9
	setx	0x893ba84a02b6eaeb, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800faf55ec, %r1, %r9
	setx	0x6c016f5f5a05a9d6, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c5ec804c1c, %r1, %r9
	setx	0x906bd50c579dbfd9, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d9d8577be5, %r1, %r9
	setx	0xbf7c116a68d62479, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e5446232ea, %r1, %r9
	setx	0xe134fa8f25706a69, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f67733233c, %r1, %r9
	setx	0x1de5014ab5a50b8d, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000fdcbfa9909, %r1, %r12
	ldub	[%r12], %r11
	setx	0x00000080173b97a1, %r1, %r9
	setx	0x3aecc14d8d54271c, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e97c785, %r1, %r9
	setx	0xe026923bc5664cc2, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f95438d, %r1, %r9
	setx	0x687b4942bcdcba1f, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c27fd6f7aa, %r1, %r9
	setx	0x48e69768df51fbb1, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d18138a463, %r1, %r9
	setx	0x264ea9aae1345708, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e1afce750c, %r1, %r9
	setx	0x1e8b1bfe89236b10, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f6bface8d8, %r1, %r9
	setx	0xc1bb2984e5bc253b, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f511b62962, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000e5a3ea68b7, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000d80a7a2ae5, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000c77891f786, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800f0a7198, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800e2aa7ea, %r1, %r12
	ldub	[%r12], %r11
	setx	0x0000008018f8612c, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000803572d7ce, %r1, %r9
	setx	0xfbbc00ac4e5a14ee, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e370d04, %r1, %r9
	setx	0x39583ba41c8c4875, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f97c446, %r1, %r9
	setx	0x1307b4fb5a0caae4, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c8d14b63e1, %r1, %r9
	setx	0x90236afc0e3ee3eb, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d70ac31b60, %r1, %r9
	setx	0xc5c2ff55ee1a8fc2, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e5bcc2f37b, %r1, %r9
	setx	0x130dc41994563896, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f648bce250, %r1, %r9
	setx	0x179d6a898db47196, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c19de6dd88, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800f24ec9b, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800e7b457d, %r1, %r12
	ldub	[%r12], %r11
	setx	0x00000080abc0568d, %r1, %r9
	setx	0xcb7a00cfa8c6499e, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e712014, %r1, %r9
	setx	0x8c32703820a7b209, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800fe6dc89, %r1, %r9
	setx	0xbfbca24e983a78e4, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c2221f7019, %r1, %r9
	setx	0xe208df4aedbfc961, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d47cb9ef5f, %r1, %r9
	setx	0x256ca453b0db1025, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ea7502dc59, %r1, %r9
	setx	0xd4f38bd49cefc59f, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000fc1247f36d, %r1, %r9
	setx	0xa5ed6e7d38073740, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e788192, %r1, %r12
	ldub	[%r12], %r11
	setx	0x0000008027fce69d, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000f887de78a9, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000e4872e7b36, %r1, %r12
	ldub	[%r12], %r11
	setx	0x0000008095f268ad, %r1, %r9
	setx	0xee8aab6018a37b85, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800ec3b272, %r1, %r9
	setx	0x98b4a7c7e4fd4405, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f65af06, %r1, %r9
	setx	0x8c02db0858abdfbc, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000cfe0d505c0, %r1, %r9
	setx	0xf94c28f870ede43c, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d2e5c3522f, %r1, %r9
	setx	0xd96fbaa77974a91f, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000eca6383b21, %r1, %r9
	setx	0x84f49cddf74c53b6, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f88f24e43e, %r1, %r9
	setx	0x4a02e4b14b7c2072, %r1, %r10
	stb	%r10, [%r9]
	setx	0x00000080910cba14, %r1, %r9
	setx	0x850b41b2c66d7fa4, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e8648ff, %r1, %r9
	setx	0x593516b9103767d4, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f3769f6, %r1, %r9
	setx	0xa673e8d789532b56, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c79ed20def, %r1, %r9
	setx	0xbb006cc7c42a8093, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d4c8215ca8, %r1, %r9
	setx	0xd5c4f98bb71efc68, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e78ba962cb, %r1, %r9
	setx	0xa1ff89df42dc286a, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f7cafc7b7c, %r1, %r9
	setx	0xbdfe582290e53191, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d3ebc48e5f, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000cfb6907299, %r1, %r12
	ldub	[%r12], %r11
	setx	0x00000080523f399c, %r1, %r9
	setx	0xe813569ef979f83e, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e85bb47, %r1, %r9
	setx	0xdd6099e20f30a3e6, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800fec0e18, %r1, %r9
	setx	0x41646bffff690369, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c90cc98f6e, %r1, %r9
	setx	0x45b1dac41f6769b0, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000df287957db, %r1, %r9
	setx	0xb72c89bfd1450c19, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000eccbe56d09, %r1, %r9
	setx	0xad84a948f4ed0c29, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000fbb79841af, %r1, %r9
	setx	0xfddd7a94c736815b, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ddbf4144f9, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000c5e845b2ed, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000801bde5c4f, %r1, %r9
	setx	0xa73915fad7a784a6, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800ec0c218, %r1, %r9
	setx	0xf8d1ec0b5a24ddba, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f7417a0, %r1, %r9
	setx	0x7a9ae7094e94ba28, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c1d00b1f37, %r1, %r9
	setx	0xa2e8fc6876a7d76c, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d4c03d6c69, %r1, %r9
	setx	0xcb3ed284e79cd3df, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e3059f8f50, %r1, %r9
	setx	0x484e2439d907f179, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f05e973a00, %r1, %r9
	setx	0xc00f549b7408bc56, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000cdf2a185f0, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800f3aff94, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800e4785fe, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000804f5a070c, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000f5de9dba8b, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000e3d73eebcf, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000db040ee54a, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000802ccac089, %r1, %r9
	setx	0x401aa619c8a41e32, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e7f80e1, %r1, %r9
	setx	0x4a353a49c638e6d8, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f926927, %r1, %r9
	setx	0x07610f91be349e95, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000cd7609d06e, %r1, %r9
	setx	0x03ffcaaa107eea89, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000dee56635f9, %r1, %r9
	setx	0x73fbd2d9d953c651, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ecdc8de489, %r1, %r9
	setx	0x9cf0eb2afb009570, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f8918f21f8, %r1, %r9
	setx	0x5e96d8a1ca633e8f, %r1, %r10
	stb	%r10, [%r9]
	setx	0x00000080a92a7f0e, %r1, %r12
	ldub	[%r12], %r11
	setx	0x00000080af4d7b2f, %r1, %r9
	setx	0x0379448d7d3acda3, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e25f301, %r1, %r9
	setx	0x242b1d0c1f8b0ac0, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800fa1ba79, %r1, %r9
	setx	0xf6ad225694e583f4, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c0c52677a0, %r1, %r9
	setx	0x202e7ceba79bc765, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d45e546337, %r1, %r9
	setx	0x41b506d6d7e8f45f, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e0adbe1604, %r1, %r9
	setx	0x967c5993a44af818, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f00b8d5faa, %r1, %r9
	setx	0x9be59846a9c7ec05, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000fc381737d4, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000e2d3bfbb6e, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000de2c549e8b, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000c26965f683, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800ff4cf7b, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800e6f0a1c, %r1, %r12
	ldub	[%r12], %r11
	setx	0x00000080f79c94aa, %r1, %r9
	setx	0x9ff91262d639c282, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e1fd63f, %r1, %r9
	setx	0x130db980a339ed56, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800feee985, %r1, %r9
	setx	0x1823644caeb8c511, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000cca90dc7e4, %r1, %r9
	setx	0x8431a5f1fb193ee2, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000df10bd48b2, %r1, %r9
	setx	0x85a9e8f5303cf8d3, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e5bdb357a9, %r1, %r9
	setx	0xd933c922ddc759b9, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f390bf1db5, %r1, %r9
	setx	0xe4de6782b40a0faa, %r1, %r10
	stb	%r10, [%r9]
	setx	0x00000080355912b0, %r1, %r9
	setx	0x1d249e9a4ed0ab99, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800ee63ee3, %r1, %r9
	setx	0x1329f115241b93a0, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800fb1ccff, %r1, %r9
	setx	0x3295e1d5f59400ae, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c063bff976, %r1, %r9
	setx	0x82fcf10d2eadc1da, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000dd3038b18b, %r1, %r9
	setx	0xe7ea8e45889f8fce, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e1480398c0, %r1, %r9
	setx	0x16758de33f48c15f, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f161ce4ade, %r1, %r9
	setx	0xddfd232bbe0493f9, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e4872e7b36, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000d31867b65c, %r1, %r12
	ldub	[%r12], %r11
	setx	0x0000008042b3302b, %r1, %r9
	setx	0xdb7fd9acad9181e0, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e0d0e31, %r1, %r9
	setx	0x0ff6d92148041c76, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f6c550b, %r1, %r9
	setx	0x8cae77e4d5d9890c, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000cbdd64e099, %r1, %r9
	setx	0xf46ad682840db7fd, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d8967c528f, %r1, %r9
	setx	0x7830fca1737002fe, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ec0da603c2, %r1, %r9
	setx	0xf9feb76bed78c86f, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f87125b09d, %r1, %r9
	setx	0x6d266cae6f00b97f, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800fe6dc89, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800e712014, %r1, %r12
	ldub	[%r12], %r11
	setx	0x00000080ae778418, %r1, %r9
	setx	0x743a654ada4baa55, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e6f6792, %r1, %r9
	setx	0x1cc4333efd4739d2, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f35ce42, %r1, %r9
	setx	0x2bdd6752754199fb, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c07eeba1a9, %r1, %r9
	setx	0x3eb5eb81b84cdb88, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d9c544f57b, %r1, %r9
	setx	0xafd1e49ea5b516a7, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ecb1faab30, %r1, %r9
	setx	0xe8f5ab6a3bd9032c, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000fc2adb7e4f, %r1, %r9
	setx	0x1b56696e358f8517, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e2a174dce6, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000dedc844c8b, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000c4de1ef45d, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800f7129c5, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800e788192, %r1, %r12
	ldub	[%r12], %r11
	setx	0x0000008027fce69d, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000f887de78a9, %r1, %r12
	ldub	[%r12], %r11
	setx	0x00000080154fdfae, %r1, %r9
	setx	0xb9ab6dbab3087218, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e9ddff9, %r1, %r9
	setx	0xc6358477dbdeb5a4, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f307b2f, %r1, %r9
	setx	0x879a79f4cef9f5d7, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c49d806a4b, %r1, %r9
	setx	0x9526c2d8a5b98e6c, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d9c7abbc46, %r1, %r9
	setx	0x94b262930b38b003, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e20d6dbc35, %r1, %r9
	setx	0x7218d7c473cf5925, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f21566decc, %r1, %r9
	setx	0x3f493779049cc17f, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e669c73d33, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000dbc3bd264d, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000cf701eae80, %r1, %r12
	ldub	[%r12], %r11
	setx	0x00000080fd238c63, %r1, %r9
	setx	0x6372a3c5dbf9ac72, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e221d5a, %r1, %r9
	setx	0x2a55d358965981e7, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f563a67, %r1, %r9
	setx	0x7dd1db8998ea5ddf, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c21047ac47, %r1, %r9
	setx	0xc4fea2da82da2bc8, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d4c0867f21, %r1, %r9
	setx	0xf116ba163819a75c, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000eab0dd0347, %r1, %r9
	setx	0x21fb7c0ffb84f8e0, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f3ae1ef266, %r1, %r9
	setx	0x5ff64403459b0824, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e0662f7, %r1, %r12
	ldub	[%r12], %r11
	setx	0x00000080714991e0, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000fa64974084, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000e9fefecfe0, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000d839011196, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000ca2ea109df, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800fb13b4c, %r1, %r12
	ldub	[%r12], %r11
	setx	0x00000080a1e88fc2, %r1, %r9
	setx	0x3d325baf610dc673, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e5e96f1, %r1, %r9
	setx	0xb1217623aaf6e94b, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800fa679df, %r1, %r9
	setx	0xf1c6a816695caa96, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c2153eec14, %r1, %r9
	setx	0x867f799d979b33b3, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d53f36e2be, %r1, %r9
	setx	0x02feabc7196f372e, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e454ea9403, %r1, %r9
	setx	0x11b6e068623d6cba, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f0e12e3e91, %r1, %r9
	setx	0x817fb93420f435a7, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f67733233c, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000e5446232ea, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000d9d8577be5, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000c5ec804c1c, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800faf55ec, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800e547ac0, %r1, %r12
	ldub	[%r12], %r11
	setx	0x00000080d11ee91a, %r1, %r9
	setx	0x61554d34ccddfadb, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800eac67cf, %r1, %r9
	setx	0xfd5f765e1a52686b, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800faa8935, %r1, %r9
	setx	0xe419ac07a2fb5bc7, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c88cc190d6, %r1, %r9
	setx	0x48f4c4b421f4608d, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d17ac10910, %r1, %r9
	setx	0x3abf5ebc2b2c564d, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e2a3ae78b5, %r1, %r9
	setx	0xd8ba0cadd4b516e9, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f8c5211441, %r1, %r9
	setx	0x667ffabdd755466e, %r1, %r10
	stb	%r10, [%r9]
	setx	0x00000080dbe2f007, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000f18db3d78f, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000ed3a36b04f, %r1, %r12
	ldub	[%r12], %r11
	setx	0x00000080f9648ff4, %r1, %r9
	setx	0x3ae20e4b73a2e560, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e7237b7, %r1, %r9
	setx	0xcad1a0ccee52335f, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800fa926c5, %r1, %r9
	setx	0x16e7097bca20f773, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c200bf7a4d, %r1, %r9
	setx	0x5ff156b02e73f8b5, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d423acc03e, %r1, %r9
	setx	0xadaca5762f78a6a7, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e2bd918719, %r1, %r9
	setx	0xe804e2ac2a5f6b17, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000fd04121988, %r1, %r9
	setx	0x6d81614c18d8b006, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c7f6dfa4d7, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000805682576d, %r1, %r9
	setx	0x0ffced5c5dd288ee, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800ef9f5e5, %r1, %r9
	setx	0x5554286ffbe576da, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f3a1781, %r1, %r9
	setx	0x76ee5fa960d037f3, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000cc361bae32, %r1, %r9
	setx	0xd7009b982eab786c, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000dca346f8f5, %r1, %r9
	setx	0x6a90f7d6081e48f1, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e040e3ab9c, %r1, %r9
	setx	0x424c7c72b62641c1, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f9578bf076, %r1, %r9
	setx	0xf2e5b6dc74450797, %r1, %r10
	stb	%r10, [%r9]
	setx	0x00000080c4d048aa, %r1, %r9
	setx	0x38410aed2db0fb77, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e7ec2ad, %r1, %r9
	setx	0x8a8848b06fdba206, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f32bb0e, %r1, %r9
	setx	0x7e125a7448245924, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ca9290668d, %r1, %r9
	setx	0x6d7713a8150f0ac9, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000dfe0623f45, %r1, %r9
	setx	0xfb956d9227611f0a, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e30465b84a, %r1, %r9
	setx	0xe1f7bbd2ee70eae2, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f7cff05395, %r1, %r9
	setx	0xa9544966ead6f0b4, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000cc465a6636, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800ff56e21, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800e838b82, %r1, %r12
	ldub	[%r12], %r11
	setx	0x0000008079566908, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000805ceea2d8, %r1, %r9
	setx	0xb769e2ba524b45e5, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e7f1b2e, %r1, %r9
	setx	0x18024e6bb958ae76, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800fb82ac8, %r1, %r9
	setx	0xe066013547afb8f5, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000cbff19abac, %r1, %r9
	setx	0xfd2c6efa6a7381f9, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d344f235ba, %r1, %r9
	setx	0x0498ad9e53c017f3, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ef2c2f7a87, %r1, %r9
	setx	0xf1cf945c1dd40a66, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f69e333777, %r1, %r9
	setx	0xea53d2e9c44e877b, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e41bb9e, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000806e1f7337, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000fde00ccecd, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000e4fc983b3a, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000d31301db4f, %r1, %r12
	ldub	[%r12], %r11
	setx	0x00000080d9fd71c2, %r1, %r9
	setx	0x0d3d3ecaae94fb6b, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800efd025f, %r1, %r9
	setx	0x96ebbb6e46eb7f13, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800fcb3fe8, %r1, %r9
	setx	0x7c9564d141b3af4c, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ccaf015298, %r1, %r9
	setx	0x5ac55c7d752a2f63, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000de84e3626e, %r1, %r9
	setx	0x2b58399ca31928d1, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e2544c084e, %r1, %r9
	setx	0x4021f57a5bbca810, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f69ae73007, %r1, %r9
	setx	0x5047ae34e4815626, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f0f5320, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800ec8fd39, %r1, %r12
	ldub	[%r12], %r11
	setx	0x00000080d516d8f9, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000f2a8a16626, %r1, %r12
	ldub	[%r12], %r11
	setx	0x0000008057dacf15, %r1, %r9
	setx	0x23a849b7c1f91cb3, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e91f131, %r1, %r9
	setx	0x6c6dcd6fc7738139, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f10a14d, %r1, %r9
	setx	0x8353ac9c2abafa42, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c3e4e0e8b8, %r1, %r9
	setx	0x1b1dae6b64f1f9fa, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000dcfcdccd99, %r1, %r9
	setx	0xb901163ce879e7d7, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e36312ea1f, %r1, %r9
	setx	0x8484c7623769050f, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000fbd96c0262, %r1, %r9
	setx	0xb493b31cfe3cba56, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c8b715017b, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800f6237fa, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800e3ebb23, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000803db28e69, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000f62be5e76e, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000e20a8ff09b, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000d27ab03556, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000801e0c4715, %r1, %r9
	setx	0xcb6476e6e43fc06b, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e498484, %r1, %r9
	setx	0x1684439bb960aeef, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f7176fb, %r1, %r9
	setx	0xd2f3f197628c1c2e, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c249acd72f, %r1, %r9
	setx	0x9745e4cd2bc64afe, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d17a6fae56, %r1, %r9
	setx	0x3e1034260902b78d, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e0adefbd23, %r1, %r9
	setx	0x014f0f47fd7a8291, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000fc6850875b, %r1, %r9
	setx	0x5cbc78d9476a7d9c, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000df658f90dc, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000c0eaa90f9f, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800fac6410, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800e3377a5, %r1, %r12
	ldub	[%r12], %r11
	setx	0x00000080c3518577, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000809564de47, %r1, %r9
	setx	0xc84c9e28f4a97dac, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e5a22e1, %r1, %r9
	setx	0xd8deaf85dc476283, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f0e8fce, %r1, %r9
	setx	0x909cd8c5d438ca7e, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ccef55e660, %r1, %r9
	setx	0x4f478796958de9c9, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d36f0451a3, %r1, %r9
	setx	0x8320e223cfac9373, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e563f1853a, %r1, %r9
	setx	0x443201d725ec30f2, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000fb8fdb8bdb, %r1, %r9
	setx	0x4d9833c9fb85aaac, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e453063573, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000da97baa70b, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000c7fd1d5a3a, %r1, %r12
	ldub	[%r12], %r11
	setx	0x00000080b3a88ea7, %r1, %r9
	setx	0x8cc6bdb9c85fe2d4, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800ed0f2d0, %r1, %r9
	setx	0xe5c6c9b705e34f3a, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f44f83a, %r1, %r9
	setx	0xef7025bec5d56249, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000cb2b1e0dc0, %r1, %r9
	setx	0x0a35d7ef49ffd7bc, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000dbfc345426, %r1, %r9
	setx	0x9b368030b31e049c, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ec6fffe4c2, %r1, %r9
	setx	0x592e764bd396bdd7, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f47b41ce5a, %r1, %r9
	setx	0x42ca98dcd83b6082, %r1, %r10
	stb	%r10, [%r9]
	setx	0x00000080f951f12f, %r1, %r9
	setx	0x03af39711bded3c0, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800ec875b1, %r1, %r9
	setx	0x682321797df08bd5, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800ff14fd8, %r1, %r9
	setx	0xb4c2fc383d44f018, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c65fc78972, %r1, %r9
	setx	0xb211680491ce0c12, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d7ee9d4cca, %r1, %r9
	setx	0x7e34e91379d9f7f8, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e0e0b55775, %r1, %r9
	setx	0x8b33d8275b4aa4d4, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f568961ef3, %r1, %r9
	setx	0x2dd6cdcbf2d1be59, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ecef7961a4, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000d071e04bb7, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000c14d098179, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800f8ff55f, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800ea5d0ce, %r1, %r12
	ldub	[%r12], %r11
	setx	0x0000008093ce9b96, %r1, %r12
	ldub	[%r12], %r11
	setx	0x0000008088146b4e, %r1, %r9
	setx	0x4552e88f20a0f666, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800ed23ba8, %r1, %r9
	setx	0x24cc54fb1e771305, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f598531, %r1, %r9
	setx	0x90fa6c1ee319aa20, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000cd3cec4766, %r1, %r9
	setx	0x892ff6a09c16fb48, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000dca5e90477, %r1, %r9
	setx	0xf8e5e1ccc49043c9, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e9e1be9d38, %r1, %r9
	setx	0x48ad24f95f390ad7, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000fab270cc3e, %r1, %r9
	setx	0x120fb3066ed7a34e, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000807aeaee23, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000f5dc956ea8, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000ef412f5da0, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000dc0a3ed0dd, %r1, %r12
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
