// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: pio_rnd_basic3_rand_0.s
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
   random seed:	105081081
   Jal pio_rnd_basic3.j:	
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

SECTION .MY_HYP_SEC TEXT_VA = 0x1100000000, DATA_VA = 0x1100260000
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

	setx	0x000000800e297650, %r1, %r9
	setx	0x1caa17cbd6f8c9f6, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f2a0f20, %r1, %r9
	setx	0x2e27a0c80b68cfb7, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c6edebba18, %r1, %r9
	setx	0x7a2c69d8de257ef3, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000df571ddeb8, %r1, %r9
	setx	0x1c6ffc8d1cda5957, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ef217bf668, %r1, %r9
	setx	0xe6749a2586d88c14, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f204331510, %r1, %r9
	setx	0x4e44a27321cc8484, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e23a738, %r1, %r9
	setx	0xaa8c840592f65552, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f4eeb28, %r1, %r9
	setx	0x969dcf2504fcde41, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c36f8f6140, %r1, %r9
	setx	0x6f617b34d03beff4, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d3beaefb00, %r1, %r9
	setx	0x76149ec86d060146, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e9508e2cd8, %r1, %r9
	setx	0xb7958f33c5912343, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000fce49e9d08, %r1, %r9
	setx	0x4a3cf13175d6e639, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e5456d8, %r1, %r9
	setx	0x91aa7e9c88c2c3ba, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f2dd520, %r1, %r9
	setx	0x0b249c7b09fb397e, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000cde6f8a9a8, %r1, %r9
	setx	0xae90923d8d1c62ee, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d5a8f0b9d0, %r1, %r9
	setx	0x652bdd883c801aad, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e390081f98, %r1, %r9
	setx	0xa049f33735abad0a, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f8828662c0, %r1, %r9
	setx	0x7e321125414f30a6, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800eb70f38, %r1, %r9
	setx	0xbac303bacb072b19, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800ff4c130, %r1, %r9
	setx	0xba9425a2bf65d7ce, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c15dc2a378, %r1, %r9
	setx	0xca77150a1e880216, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d848e11fc0, %r1, %r9
	setx	0xa84aba29846a08e3, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e828a71220, %r1, %r9
	setx	0x28c7a2b30f600730, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000fa4d972098, %r1, %r9
	setx	0x66d1901c1e8913d0, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800ec28480, %r1, %r9
	setx	0x1f23b1fab2cc788c, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f056ec0, %r1, %r9
	setx	0x37beeecd72fd890f, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c11fa14e80, %r1, %r9
	setx	0x457e7256683b145c, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d68fa8aed8, %r1, %r9
	setx	0xa28ab83deece3b0f, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000efaf3cbf38, %r1, %r9
	setx	0x33851a5c4c6b1f2e, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f8c141a2a8, %r1, %r9
	setx	0xd0b1c7c3c089d3a7, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e38e170, %r1, %r9
	setx	0xae32e80b9b828a46, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f682b80, %r1, %r9
	setx	0xd0cdd8e34a0e9740, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000cdc959ba30, %r1, %r9
	setx	0x0e5dd704e9b985eb, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d7929eeed8, %r1, %r9
	setx	0x63f2e2f6f82a3bc5, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000ebb97187d8, %r1, %r9
	setx	0xb8c813b2ab7d0f0d, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f60de2b9b0, %r1, %r9
	setx	0x7c7fdd67c92c3a80, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e4fb910, %r1, %r9
	setx	0xece449136681b98a, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800fe185a8, %r1, %r9
	setx	0xc97c8577bb3f6ad4, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000ca693d7f18, %r1, %r9
	setx	0xf5014ae5e546316a, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d496d0d040, %r1, %r9
	setx	0xfc179b4b8f543db4, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e57bc0f698, %r1, %r9
	setx	0x21a39208fbf8d2c4, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f8c8316e18, %r1, %r9
	setx	0x1f80daf8c2854f24, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e0d8f00, %r1, %r9
	setx	0xa7762a14b6e5baa2, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f996178, %r1, %r9
	setx	0xab844696dcd4f746, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c84b3b1478, %r1, %r9
	setx	0xbe91c15b8e3324e4, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000dc602f97a8, %r1, %r9
	setx	0x2adc0e469f4ac020, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000eb05e998a8, %r1, %r9
	setx	0x0283e5f73f3e97a6, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000fa6ab0b798, %r1, %r9
	setx	0x5fe06ddee2dc63cd, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c11fa14e80, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800f056ec0, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800ec28480, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000f204331510, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000ef217bf668, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000df571ddeb8, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000f8828662c0, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000e390081f98, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000d5a8f0b9d0, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000cde6f8a9a8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800f2dd520, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000e828a71220, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000d848e11fc0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000c15dc2a378, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e6d1ed0, %r1, %r9
	setx	0xf5de73cfd68806ee, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f3b1050, %r1, %r9
	setx	0x8956e6ce0737c037, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c75573cbf8, %r1, %r9
	setx	0xafba8155c1f721e9, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000daf89165f0, %r1, %r9
	setx	0x385cc2420a47a1f9, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e463892918, %r1, %r9
	setx	0x3e270bc7e1d103d2, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000fc82cb2af0, %r1, %r9
	setx	0x9b4e131acfc395d6, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e57f6a0, %r1, %r9
	setx	0xae5e8d7e5fee49fb, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f5d1e40, %r1, %r9
	setx	0x00b50174aeac6d08, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000cd6cf7e990, %r1, %r9
	setx	0xcd73917a4e770f03, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000da8f9da0a0, %r1, %r9
	setx	0xf0868d8a7004a89a, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e7b9dd2520, %r1, %r9
	setx	0xb35e3591662062db, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000fa5b4666a8, %r1, %r9
	setx	0xc530eded9aa09473, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e0ca208, %r1, %r9
	setx	0x9725b975bb9228ac, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f794cd0, %r1, %r9
	setx	0xf30d318d1b81648c, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c2e2f68d40, %r1, %r9
	setx	0x6d7d2fca7bfb8c1a, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000de05bf4298, %r1, %r9
	setx	0x1b310dbda3be027b, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e6d0f29358, %r1, %r9
	setx	0xe2c047b2715aeb69, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f03aab0938, %r1, %r9
	setx	0x8e79d9be1846ee2b, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e4e6fe8, %r1, %r9
	setx	0xa849dd95bc665733, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f0e8b10, %r1, %r9
	setx	0x6f76f05ebbc763d5, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c3fd94b230, %r1, %r9
	setx	0x3c53362bf4d4c9f3, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000db948c6800, %r1, %r9
	setx	0x17ace601485f9e38, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ee12ed1560, %r1, %r9
	setx	0x7e30878b4c1aa136, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000fa6b38bf18, %r1, %r9
	setx	0x9b3e09591f6aa250, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f8c141a2a8, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000efaf3cbf38, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000d68fa8aed8, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000cdc959ba30, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e0d8f00, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000fa4d972098, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000e828a71220, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000d848e11fc0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e5823c0, %r1, %r9
	setx	0x756acd176df50777, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800fc41ad8, %r1, %r9
	setx	0x9618df056e26e0a7, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c55e03a1d8, %r1, %r9
	setx	0x7bfd19f0b6c7c87f, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000dc2091d410, %r1, %r9
	setx	0x8fa4c7f6dd40bca5, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e94f2514e0, %r1, %r9
	setx	0x3e22137713e3c409, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f2091a8580, %r1, %r9
	setx	0x22e1cec660f7dcd2, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800effa1f0, %r1, %r9
	setx	0x65e145760d173fc3, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f37f140, %r1, %r9
	setx	0xa16156cf695084ac, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000cd7b9af0d8, %r1, %r9
	setx	0xf8af7d0238ecdfc3, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000da2725c308, %r1, %r9
	setx	0x0e11d2ba4792bf9e, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e037b792f8, %r1, %r9
	setx	0x941ae915d3a7ca68, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f0e3f2c5d8, %r1, %r9
	setx	0x3c9cc32d64bdab83, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800ecc5118, %r1, %r9
	setx	0xc80200642aa838fb, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800fc51758, %r1, %r9
	setx	0xe31f4c37199129ca, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000caa2a3d7b8, %r1, %r9
	setx	0xea7ddeb39971cb39, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d71ad9def8, %r1, %r9
	setx	0xd78326946838cca4, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e8508f1550, %r1, %r9
	setx	0x03e37f09f6bfd44f, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f07a09bc38, %r1, %r9
	setx	0xb146a34200a2c457, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800eddcc00, %r1, %r9
	setx	0x82dd5af963b698c2, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800fa839a0, %r1, %r9
	setx	0x112e13fce363b298, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c942b39e60, %r1, %r9
	setx	0x7163c6c3c9c49a10, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d205abb610, %r1, %r9
	setx	0xd4525a2cb5a6b5d2, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e43faad820, %r1, %r9
	setx	0x34115f7377014813, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000fa43d31fc8, %r1, %r9
	setx	0xceb0147f81cc4ed3, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800fc41ad8, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800e5823c0, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000fc82cb2af0, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000e463892918, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000daf89165f0, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000f60de2b9b0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000e6d0f29358, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000de05bf4298, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000eb05e998a8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000dc602f97a8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000c84b3b1478, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800f996178, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e0d8f00, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000fa4d972098, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e11b4a8, %r1, %r9
	setx	0x275ed9106b78b303, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800ff67560, %r1, %r9
	setx	0x66b3014eb1f555a3, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c4fb81c168, %r1, %r9
	setx	0xd6f45453e9706e69, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d3b5f9b648, %r1, %r9
	setx	0x24c7b14a43d3836d, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e4e8442798, %r1, %r9
	setx	0xb21a1c667005a705, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000fe2eddaef8, %r1, %r9
	setx	0x5875185209d8c44c, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e72ea40, %r1, %r9
	setx	0x80fca3be7afffcb9, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800fcbf290, %r1, %r9
	setx	0x789166900e0e49a3, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000cb97da1030, %r1, %r9
	setx	0x752116be9398eed9, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d5cb8868e8, %r1, %r9
	setx	0x7fdc0261a15a5c1e, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e1e1871c98, %r1, %r9
	setx	0x841a7e05afa9efc0, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000febea67848, %r1, %r9
	setx	0xbe8b4c7c958cfee2, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e6ec540, %r1, %r9
	setx	0x7bec05ff6eee94b4, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f0bc478, %r1, %r9
	setx	0x9f9269f1723acd78, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000ce7d7e9338, %r1, %r9
	setx	0x7940564cc1324987, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000dca89ca470, %r1, %r9
	setx	0x4bfd8a02196e0397, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000ed9d7cdae0, %r1, %r9
	setx	0xa0398674c37fea98, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f81e89cbc8, %r1, %r9
	setx	0x637b73a89791fc60, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800edf61a0, %r1, %r9
	setx	0x7e9151bd632258a4, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f5666f8, %r1, %r9
	setx	0x5ae22c5ee2bf421b, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c23006f708, %r1, %r9
	setx	0x8ae47dbddb4c99ce, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d789cbd030, %r1, %r9
	setx	0xd46d055f347c6e8a, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e1e053e660, %r1, %r9
	setx	0xacce7f34eb28d576, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000fadf6b4510, %r1, %r9
	setx	0x3c13434dab88e816, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e94f2514e0, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000dc2091d410, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000c55e03a1d8, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800fc41ad8, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800e5823c0, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000fc82cb2af0, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000e463892918, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000cd6cf7e990, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800f5d1e40, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e57f6a0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000f60de2b9b0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000ebb97187d8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d7929eeed8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000cdc959ba30, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e4fb910, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000f8828662c0, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000e390081f98, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000d5a8f0b9d0, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800f0e8b10, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e4e6fe8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000fa6ab0b798, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000eb05e998a8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000dc602f97a8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e94a9b8, %r1, %r9
	setx	0xd0ba5e1670a13160, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800fca5530, %r1, %r9
	setx	0x71c7750221d3de2f, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c168676610, %r1, %r9
	setx	0x70c3c80ccc46807e, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d0dfe66ff8, %r1, %r9
	setx	0xb40660d4edb9cbed, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000eeb50d6468, %r1, %r9
	setx	0x4e30ac86581eb329, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f85bfcf080, %r1, %r9
	setx	0x1f9b5b86bfb19b44, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e4d20b8, %r1, %r9
	setx	0x83001c94246ad083, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f997490, %r1, %r9
	setx	0x50e89d9d8387ce66, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c7c4af1208, %r1, %r9
	setx	0xeda3abfb3467a5a7, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d13168f100, %r1, %r9
	setx	0x685db112f6f9ad5d, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000ec2a816e28, %r1, %r9
	setx	0x2a4f94eb5b7d46b9, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f4acac6d10, %r1, %r9
	setx	0xf9b02c4441c1675e, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800ef81e68, %r1, %r9
	setx	0x23a02a30966d1a55, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f412ab8, %r1, %r9
	setx	0x9c5b33ed7636dbf9, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c56f6b95b8, %r1, %r9
	setx	0x4e2b8671ec72c895, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d4751be160, %r1, %r9
	setx	0xf11fb91a75d58eac, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e7de1688b8, %r1, %r9
	setx	0xbbd0cf7c36b1d58f, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f412a1b1f0, %r1, %r9
	setx	0xef343afa4efa8bcd, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e181318, %r1, %r9
	setx	0x922455aeeb20d05a, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f7d9380, %r1, %r9
	setx	0x17d2dfce599b816a, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c9b26a0268, %r1, %r9
	setx	0x8eb087cb4abfaef6, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d7766b92c8, %r1, %r9
	setx	0xa9f76099ff66c3d3, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ec6f44b960, %r1, %r9
	setx	0x69a071dcaae2d94f, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f458d90ab0, %r1, %r9
	setx	0x55464d14c1c95cf8, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000efaf3cbf38, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800f682b80, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e38e170, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000fce49e9d08, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000f03aab0938, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000e6d0f29358, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000de05bf4298, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000c2e2f68d40, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800f794cd0, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800ed6ddb8, %r1, %r9
	setx	0x1fa9cd48e35688c9, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800fe4e560, %r1, %r9
	setx	0x840f24ece88e08d9, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c19be26ae8, %r1, %r9
	setx	0xd4698733bb92ab41, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ddcbf1c898, %r1, %r9
	setx	0x51c25af5258d77ee, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e8e2e9f500, %r1, %r9
	setx	0x61f22a680f200245, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f0e55d2d88, %r1, %r9
	setx	0x889f5e5e43fd153c, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e1b38e0, %r1, %r9
	setx	0x7984be88f4ea43c1, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f99d078, %r1, %r9
	setx	0xaf0ee6206ecc172d, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c7ff858180, %r1, %r9
	setx	0x76689effccd3f902, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d19718a610, %r1, %r9
	setx	0x68d8603ff92bd3d7, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e279aa9b50, %r1, %r9
	setx	0x42a04106404f44c1, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f0fe445660, %r1, %r9
	setx	0x71e86403d75c3e8e, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e3536e0, %r1, %r9
	setx	0x19141aa31d82b1ce, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f2867d0, %r1, %r9
	setx	0x490f1a23f40a9512, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c4e65317a0, %r1, %r9
	setx	0x2c3280a133b1a90c, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d7b644b5b8, %r1, %r9
	setx	0x6e018e50883eb82a, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e7a6e3a178, %r1, %r9
	setx	0x743e3cea03974d10, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f6022bd458, %r1, %r9
	setx	0x1da360d9b0895bac, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e1b03c0, %r1, %r9
	setx	0xc490afac246456d6, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f0d0250, %r1, %r9
	setx	0x3daa5565d60ee8e6, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c59099c740, %r1, %r9
	setx	0x33badafa2001bd05, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d8589420a0, %r1, %r9
	setx	0xd4a2079740e398e1, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e31030af08, %r1, %r9
	setx	0x87c903cebb65ba57, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f6015997e8, %r1, %r9
	setx	0xde1c301e3e05cdb1, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f8c141a2a8, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800effa1f0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000fa5b4666a8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000e7b9dd2520, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000da8f9da0a0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000cd6cf7e990, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800f5d1e40, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e57f6a0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000f8c8316e18, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000e57bc0f698, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000d496d0d040, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000ca693d7f18, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800fe185a8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800e4fb910, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000f8828662c0, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800ec208f8, %r1, %r9
	setx	0x29e2bd20a4a33665, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f4d8f38, %r1, %r9
	setx	0x54e90f745e4e4989, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c6cc9da128, %r1, %r9
	setx	0x02a1b458c86c4012, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d472fe5a98, %r1, %r9
	setx	0x4c3e7369b7d085f9, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ef8165b888, %r1, %r9
	setx	0x780769857dcb812c, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f6b9642358, %r1, %r9
	setx	0xdf54c5d5a807fa4c, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e68cfd8, %r1, %r9
	setx	0x581fd67a2fc7a7d4, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f1c1b28, %r1, %r9
	setx	0x89f7de81237af4da, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c872fea3e0, %r1, %r9
	setx	0xb6a62d930dd03d82, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d402207730, %r1, %r9
	setx	0xcdb51a6898bd56a2, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e0e1c20aa8, %r1, %r9
	setx	0xa6eec4c49bcf1d8c, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f8468ec1d0, %r1, %r9
	setx	0xe339ccb87692238c, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800ef424c0, %r1, %r9
	setx	0xc9e370f48db48b12, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f817570, %r1, %r9
	setx	0x62d76f3dae22205d, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c070323598, %r1, %r9
	setx	0x1674affdd696d458, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d92f474020, %r1, %r9
	setx	0xafb6d657e7568018, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e007d31808, %r1, %r9
	setx	0x176b77ad1c6c1c72, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f0caec1808, %r1, %r9
	setx	0xedad91db285237e8, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e84b0b0, %r1, %r9
	setx	0x3c50ecb94ef13675, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800fcf4128, %r1, %r9
	setx	0xfd733f4be19799c4, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c821db4410, %r1, %r9
	setx	0x53ae02279489aa60, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d659678848, %r1, %r9
	setx	0x193521c9966b4d64, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e0a11301b8, %r1, %r9
	setx	0x8ed5f1abe0e0efa2, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f419c0a370, %r1, %r9
	setx	0x302e6298c3cc6627, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f8c141a2a8, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000efaf3cbf38, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000d68fa8aed8, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000c11fa14e80, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000f4acac6d10, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000ec2a816e28, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d13168f100, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000c7c4af1208, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e0ca208, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000f8c8316e18, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000e57bc0f698, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000d496d0d040, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000ca693d7f18, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800fe185a8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000f458d90ab0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000ec6f44b960, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000d7766b92c8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000c9b26a0268, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800f7d9380, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e1239d8, %r1, %r9
	setx	0xc8500e80109bc650, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f4bae10, %r1, %r9
	setx	0x85a96cd2d2b9baa9, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000cdb4cba930, %r1, %r9
	setx	0x90020f996c676891, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d5c2481e20, %r1, %r9
	setx	0xe92dee1b020e7bff, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ef268b9e60, %r1, %r9
	setx	0x4f5f79f0e8d0d7f9, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000fa0cac2f08, %r1, %r9
	setx	0x49a21e2818c0b8d2, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e064090, %r1, %r9
	setx	0xc08ad803f962b377, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800ff59b70, %r1, %r9
	setx	0xd5bbcb003ba09df3, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c68b40a998, %r1, %r9
	setx	0x0c8fcab7b74226f4, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d4fc2b9c68, %r1, %r9
	setx	0xd6a0757c6a615540, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e193931860, %r1, %r9
	setx	0x40e3376b5a147d00, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000fe642c50d0, %r1, %r9
	setx	0x2a9d40f0d3a7beba, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800ea7b308, %r1, %r9
	setx	0x66a1a88b8dd97289, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f58f348, %r1, %r9
	setx	0x17c473930bd7f8f1, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c9e635df58, %r1, %r9
	setx	0x4c9ab7fd36379805, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d49dc69958, %r1, %r9
	setx	0x27081c1ea44cf507, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e75b9fe0d0, %r1, %r9
	setx	0x6df0dfccd14e20e4, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f6f6128be0, %r1, %r9
	setx	0xf51b1cf8571998b5, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e103988, %r1, %r9
	setx	0xbd85d120b546acbc, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800fdc4c98, %r1, %r9
	setx	0x2aabefcd610dce72, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c0cb3acb10, %r1, %r9
	setx	0x525a6d655d8bd602, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d0133f32e8, %r1, %r9
	setx	0xecb34feb0f8db421, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e6f634a758, %r1, %r9
	setx	0x9a9ba9c4396b3ee5, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f0fec27810, %r1, %r9
	setx	0xf7135211264357ca, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800fe4e560, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800ed6ddb8, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000d5cb8868e8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000cb97da1030, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800fcbf290, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e72ea40, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000f0e3f2c5d8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000e037b792f8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000da2725c308, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000ed9d7cdae0, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000c59099c740, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800f0d0250, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e1b03c0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000f458d90ab0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e563428, %r1, %r9
	setx	0xbab640d34d70daca, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f91e330, %r1, %r9
	setx	0xfc5953aeac33283f, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c5601b67f8, %r1, %r9
	setx	0x20d74b8b2d0a874a, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000dab8a3b920, %r1, %r9
	setx	0xf7fdade3e5ce43a6, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ebd2387b60, %r1, %r9
	setx	0xf882bc15646d3ad1, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f0764054d0, %r1, %r9
	setx	0x838dfdebd8f7b6fd, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e408c20, %r1, %r9
	setx	0x4fc36911c72fdef7, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f0c7720, %r1, %r9
	setx	0xe51d9a7678b20fa0, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000cff6ac2220, %r1, %r9
	setx	0x17803bbc4bed5f41, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d1654a58c0, %r1, %r9
	setx	0x42ae3ed7b05dde8a, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e565fbf3e8, %r1, %r9
	setx	0x0988be0ea266fa53, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000fa9bf4b2e8, %r1, %r9
	setx	0x3e80efc26f983924, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e35e430, %r1, %r9
	setx	0x1df0f888cf017cca, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800ffb1570, %r1, %r9
	setx	0x5edc435c247b80d1, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c141350988, %r1, %r9
	setx	0xdc3d933aa0331bd0, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000dbbf8a2120, %r1, %r9
	setx	0x3d18d3baec98ee27, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e739c140d0, %r1, %r9
	setx	0xe58a794ce6bbfb8e, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f810ad3098, %r1, %r9
	setx	0x5cb932b425ac7824, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e2a2da0, %r1, %r9
	setx	0x8c90f910417dd645, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f39bc70, %r1, %r9
	setx	0x960969108c9cc51b, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c103497a90, %r1, %r9
	setx	0x12b95332cfe3652b, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ddd8924b90, %r1, %r9
	setx	0x054fb2bdc4cc7ac8, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e25bfa7658, %r1, %r9
	setx	0x3fbe67deddb0bb1f, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000fe8b4433c8, %r1, %r9
	setx	0x09fcb81dcef668ca, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c5601b67f8, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800f91e330, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800e563428, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000fa0cac2f08, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000ef268b9e60, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000d5c2481e20, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000d3beaefb00, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000caa2a3d7b8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800fc51758, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800ecc5118, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000f03aab0938, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000e6d0f29358, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000de05bf4298, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000c2e2f68d40, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800ebe1208, %r1, %r9
	setx	0x82437e8b281f8bb5, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f8900e8, %r1, %r9
	setx	0x83205c5c51b64884, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ccd35f8a50, %r1, %r9
	setx	0x9102edbf0eef8c0e, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d0133c5190, %r1, %r9
	setx	0x55c4150e39a9342d, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ef58442a28, %r1, %r9
	setx	0x907c366c69dde118, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000fe7aef0180, %r1, %r9
	setx	0x0adcf1a9770379b5, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e7d20a0, %r1, %r9
	setx	0x1761815b6d227b59, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f4042a0, %r1, %r9
	setx	0xc3020198abb84c10, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c22a8dd5a8, %r1, %r9
	setx	0x42a6fdbde2196110, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d85c62cd10, %r1, %r9
	setx	0xe56e117e968793e9, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000ed3e2fcdd8, %r1, %r9
	setx	0x02a04ac2282ac8f6, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000fc029cc758, %r1, %r9
	setx	0x6299d8f2751aa08a, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800eb8fc30, %r1, %r9
	setx	0x108503f08b15f3cc, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f83f148, %r1, %r9
	setx	0x6926cb087e277493, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000cdd21417b0, %r1, %r9
	setx	0xa50653b655671812, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000da830dfec8, %r1, %r9
	setx	0xc674957af80a9572, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000eff65865c0, %r1, %r9
	setx	0x773cfb828b49a6f5, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f81367e0d8, %r1, %r9
	setx	0x1286c6512f4d1eed, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e46ff10, %r1, %r9
	setx	0x8b7f23ff7a43e547, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f74f0a8, %r1, %r9
	setx	0xafcd812807cbf93b, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000cf70368460, %r1, %r9
	setx	0xda70192d08225cce, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000dc05a6c770, %r1, %r9
	setx	0x96e0c7d4185b6e84, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000eb52f28ad0, %r1, %r9
	setx	0x9e7c3a39836526ae, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f6aa85b990, %r1, %r9
	setx	0xa3c0322b87ba1bad, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000efaf3cbf38, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000f0fe445660, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e3536e0, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000f412a1b1f0, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000e25bfa7658, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000ddd8924b90, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000c103497a90, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e281d70, %r1, %r9
	setx	0x16353aef9edc75b2, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f96a150, %r1, %r9
	setx	0xa3d3753f60084712, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c557caa7f0, %r1, %r9
	setx	0xe827ae8067d5ef09, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d652ef09c0, %r1, %r9
	setx	0x76d8696f0f3470e8, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e7a3e04cf0, %r1, %r9
	setx	0x75962f91757305e2, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f612edcc60, %r1, %r9
	setx	0x2427910e9f2b35ed, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800eff7000, %r1, %r9
	setx	0x112bcec2374755c5, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f869328, %r1, %r9
	setx	0xfdea6242e9e7f2f4, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c739ed3fb8, %r1, %r9
	setx	0xeb4a20e324e6dd7d, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d89a99dfa8, %r1, %r9
	setx	0x68570720f7aeafeb, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e33b0293f8, %r1, %r9
	setx	0x3997a70a4ba1d491, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f2a13d27c8, %r1, %r9
	setx	0x88bee8bb38f73079, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e55e210, %r1, %r9
	setx	0x519a79a49a2e7371, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f73c418, %r1, %r9
	setx	0x8c07b904f040f5d7, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000cc7aa63370, %r1, %r9
	setx	0x482cc5c4e6a40f8e, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000dc6584d470, %r1, %r9
	setx	0xaca8d6029fb7c883, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000eec1f54568, %r1, %r9
	setx	0x777042fbdc1e0f17, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000fa85702dd0, %r1, %r9
	setx	0x27842ee451492d74, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e63f380, %r1, %r9
	setx	0xf50a6e5356296ede, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f3dd3b8, %r1, %r9
	setx	0x66ee94d4c678c929, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ce11250528, %r1, %r9
	setx	0xe4871b37a1c3c8f9, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d8334bf208, %r1, %r9
	setx	0x42ba0362bd6db7b4, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ed56025998, %r1, %r9
	setx	0x63fd408575de340e, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000fc007eafc8, %r1, %r9
	setx	0x4193d82f9a2c7a6a, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c6cc9da128, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800f4d8f38, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800ec208f8, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000f0e55d2d88, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000e8e2e9f500, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000ddcbf1c898, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000c872fea3e0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800f1c1b28, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e68cfd8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000f0fe445660, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000e279aa9b50, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d49dc69958, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000c9e635df58, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800f58f348, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800ea7b308, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000f0caec1808, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800e4e6fe8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800eeade60, %r1, %r9
	setx	0x6ba78c6aaae68507, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800ffbb4e0, %r1, %r9
	setx	0xf38ecc15f81c4d49, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c175b588e8, %r1, %r9
	setx	0x7d4cfb0673b62b0e, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000dc6e28d160, %r1, %r9
	setx	0x1dcdcbec04f76e5c, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ed86c91aa8, %r1, %r9
	setx	0xfaa5c783cfdebbbb, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000fe0976e200, %r1, %r9
	setx	0xf467f7a79266f908, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e0b1090, %r1, %r9
	setx	0x18a0c035d2dc03ee, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800fc49a38, %r1, %r9
	setx	0xab67edbfd1468283, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c1cefbf418, %r1, %r9
	setx	0x4c65e21b1be8ffe7, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000dfeeaa4638, %r1, %r9
	setx	0x396804fe3dc86767, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e8f3034050, %r1, %r9
	setx	0xcaff42e33ce05c92, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f2764f1148, %r1, %r9
	setx	0x4901dd7f16149796, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e6e9868, %r1, %r9
	setx	0x469b3d44f5ac9101, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f6d9418, %r1, %r9
	setx	0x42a793c00b36d2b0, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000cd0bb3c558, %r1, %r9
	setx	0xe9b0017262ef0ea0, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d1c0e17790, %r1, %r9
	setx	0x6de3c3f7656d65b4, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e8eec6be60, %r1, %r9
	setx	0x4f7f43ab9cf49b92, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f2f9953d28, %r1, %r9
	setx	0xba1d51aafaf0fcbf, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e1801f8, %r1, %r9
	setx	0x6de19c3af6dca2cb, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f3e1100, %r1, %r9
	setx	0x4776613c0959e685, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c8f32a7c90, %r1, %r9
	setx	0x2db471bdd7a23f82, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d565f4e848, %r1, %r9
	setx	0xb46e5729d5d80edb, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ed8657c3c8, %r1, %r9
	setx	0xc949e3a2344f0f46, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f276f9acf0, %r1, %r9
	setx	0x425dbe95a09e7f4c, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800e563428, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000fa0cac2f08, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000ef268b9e60, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000d5c2481e20, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000cdb4cba930, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000c872fea3e0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800f1c1b28, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e68cfd8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d71ad9def8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000caa2a3d7b8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800fc51758, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800ecc5118, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000f03aab0938, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000e6d0f29358, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800fcf4128, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e84b0b0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000f6015997e8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800ed7c9a8, %r1, %r9
	setx	0x9244a928f469b1df, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800fe75580, %r1, %r9
	setx	0x2e3ffdb4a34d4009, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c6e8a3c110, %r1, %r9
	setx	0x65fe76194e32ff10, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d1e6b13d80, %r1, %r9
	setx	0x05ae31e3f3801d0f, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000eeb1cfae30, %r1, %r9
	setx	0x9bea463d5eb73443, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f2b7c9e738, %r1, %r9
	setx	0xc2e1b7ff05ab6ff3, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e6a5178, %r1, %r9
	setx	0xef5b5910941c9892, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800ffae0b0, %r1, %r9
	setx	0x1ff4274814b676df, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c97920e0c0, %r1, %r9
	setx	0x56735f26b96ef928, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d5df1ccec8, %r1, %r9
	setx	0xe0226665db775cd0, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e83fe46a40, %r1, %r9
	setx	0x388ff875ca73522c, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000fae40332e0, %r1, %r9
	setx	0xffc7cd62c5b3117c, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800ef3cee0, %r1, %r9
	setx	0x5595df696a6b5aa0, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800fdbb308, %r1, %r9
	setx	0x16a7a8d4b0d5b44f, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000cda679a678, %r1, %r9
	setx	0x347b197c10dbdb35, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d1b208d9a0, %r1, %r9
	setx	0x4c0f078a4b2de359, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000eca588db50, %r1, %r9
	setx	0x00c49ba76435696e, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000fe173afc98, %r1, %r9
	setx	0x53ce2073aa9e3e93, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e3f4448, %r1, %r9
	setx	0x5d66d1fd37c021d2, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f836f40, %r1, %r9
	setx	0xafe803893092b138, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000cf965ab018, %r1, %r9
	setx	0xb181698bc7cfa34d, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000de7945adc0, %r1, %r9
	setx	0x7a508421e40553dd, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ed8c429b28, %r1, %r9
	setx	0x06c0b51bc829e344, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000fa12bc09a8, %r1, %r9
	setx	0x1323f585bd5811c9, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f817570, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800ef424c0, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000c821db4410, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800fcf4128, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e84b0b0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000f6015997e8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000e31030af08, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e89d450, %r1, %r9
	setx	0xc768fdba0bb31894, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f7f2890, %r1, %r9
	setx	0x36a0b62522a6a3ce, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c09b4edf68, %r1, %r9
	setx	0x03a3b2e0ca2dcf8b, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d43de35c20, %r1, %r9
	setx	0x3badbdf3b767234f, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e9fb0e27c0, %r1, %r9
	setx	0x76b00db1b18042d4, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f6e4beabc8, %r1, %r9
	setx	0x783fd95dab4422fa, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800ea5d9a0, %r1, %r9
	setx	0xa55e375d1512495a, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f0ea838, %r1, %r9
	setx	0x8f3a713d1901371b, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c2612694b0, %r1, %r9
	setx	0xef69fe85237e8afe, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d0eaea4438, %r1, %r9
	setx	0xe627dbbb4172147f, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e68c2e3fb0, %r1, %r9
	setx	0x1cd2ad442c090062, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f871ee4b20, %r1, %r9
	setx	0x8d8d86373a86b713, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e5a8730, %r1, %r9
	setx	0xb88c3589de71c407, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800fac4510, %r1, %r9
	setx	0x0c04d7d571409eca, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c333790d98, %r1, %r9
	setx	0x3b03a7114a54844e, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000dfd37ec358, %r1, %r9
	setx	0x2d0b8f5051bda3eb, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000eb9a899ea8, %r1, %r9
	setx	0x61d133b0b2cf5393, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000fac4431720, %r1, %r9
	setx	0xa5d73f9521c82e9b, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e263d68, %r1, %r9
	setx	0x4bad85880e81cab2, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800fecbda8, %r1, %r9
	setx	0xc9b1c3e99ef6b5b4, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c0e21d14e0, %r1, %r9
	setx	0x1e17a6dd1dc14d04, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d952205718, %r1, %r9
	setx	0x8bec1cd033d8e8de, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e68f81f610, %r1, %r9
	setx	0x0a29013d3a84fa25, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000fc4c16e088, %r1, %r9
	setx	0xe97eeb957e1ffe8c, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d5c2481e20, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000cdb4cba930, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800f4bae10, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800e1239d8, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000f6b9642358, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000ef8165b888, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000c070323598, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800f817570, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800ef424c0, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000f6022bd458, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000e7a6e3a178, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800e51af38, %r1, %r9
	setx	0x527009f1e20f1383, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f49bbf0, %r1, %r9
	setx	0x7fb052b46cec9b49, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000cae5697ca8, %r1, %r9
	setx	0x6ddd9a78259b656e, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000dd43de7490, %r1, %r9
	setx	0x09b0ff33a3a8e9fe, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e1eb76c9e0, %r1, %r9
	setx	0xd64c19fd85517583, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000faea3e6970, %r1, %r9
	setx	0xb7ff3081d2708fbb, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e044fb8, %r1, %r9
	setx	0x18169a3d6d1eebc3, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f5ccaf8, %r1, %r9
	setx	0xd24fbb2a7c363f92, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000ce08347fe8, %r1, %r9
	setx	0xedc45af16133c624, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000dfbcea0ce0, %r1, %r9
	setx	0x3488d9814421251f, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e94374f780, %r1, %r9
	setx	0x3aa8bd7e09869a04, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f6701eb108, %r1, %r9
	setx	0x2572a8d7d0244a0c, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e63b1e0, %r1, %r9
	setx	0xc78c4ea7d6c18c95, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f591d90, %r1, %r9
	setx	0xd919a75e41ac6f0b, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000cd405fcf38, %r1, %r9
	setx	0x17c326cc166d1239, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d399a5acc8, %r1, %r9
	setx	0x120b2f908f2f5a71, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000eb8693d0f0, %r1, %r9
	setx	0x4e182e3dcfd70095, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f2f4d0bd60, %r1, %r9
	setx	0xfea29b2dfabdba2b, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e7605c0, %r1, %r9
	setx	0x638e4ca9cf2bafdb, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f85a4e8, %r1, %r9
	setx	0x30d21e00393e64fe, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c958a0e1d0, %r1, %r9
	setx	0xb481a3fe0aa4e5cb, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000dec7d4b020, %r1, %r9
	setx	0xeb3c2823ca8de696, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e8f1f65108, %r1, %r9
	setx	0x1cc5fdaa64de0772, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000fa72f95cf0, %r1, %r9
	setx	0xfcaf7e022b72b6ab, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d43de35c20, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000c09b4edf68, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800f73c418, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800e55e210, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000f81367e0d8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000ce11250528, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800f3dd3b8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e63f380, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000f6aa85b990, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000eb52f28ad0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e4e57b8, %r1, %r9
	setx	0xbdaba41aa59c41bd, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800fe1c5e0, %r1, %r9
	setx	0xb8bbcca4cb700a53, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c7c8c07c98, %r1, %r9
	setx	0x494ee8979044c21a, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000de704fb540, %r1, %r9
	setx	0xc24d52c8d2e1e2dd, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e346f8def8, %r1, %r9
	setx	0x587d1f4230854cd6, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f44487b818, %r1, %r9
	setx	0x6b01275723bf8452, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800efde558, %r1, %r9
	setx	0x030a8d52525fd265, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f46f310, %r1, %r9
	setx	0xfe9315c0595027a7, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c1775b3950, %r1, %r9
	setx	0xa667e0c8dd53b951, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d5d73375a8, %r1, %r9
	setx	0xba4cbc0685a886a1, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e713729068, %r1, %r9
	setx	0x4105974964712e43, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000fc2a633440, %r1, %r9
	setx	0xb9438759bc86f3f1, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e58fcc0, %r1, %r9
	setx	0xea3b8d3568cb6aa4, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800ffccd08, %r1, %r9
	setx	0x0a5848eff0f3456c, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000cd7f8960a0, %r1, %r9
	setx	0x2a4ec5934fe5ce83, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000daf6790148, %r1, %r9
	setx	0x75d7033df4842085, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e6e76f40f8, %r1, %r9
	setx	0x857292fb10e5f79d, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000fa4c7468a8, %r1, %r9
	setx	0xbaeeb8b4d177ace2, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800eb1f298, %r1, %r9
	setx	0xca9f0187f1c87aa9, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f6f2f50, %r1, %r9
	setx	0x2eb574723df137fd, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c3fafaa5f0, %r1, %r9
	setx	0xecc244bbca48e0bc, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000da369b1270, %r1, %r9
	setx	0x31133b65602f91f1, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e70a20cb70, %r1, %r9
	setx	0x903f4959778eeb76, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f21021e5a0, %r1, %r9
	setx	0xb4e056745c5eef8e, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000fc82cb2af0, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000fa9bf4b2e8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000e565fbf3e8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800ecc5118, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000f03aab0938, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000e6d0f29358, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000de05bf4298, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000c2e2f68d40, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800f794cd0, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000fa6ab0b798, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800eab5030, %r1, %r9
	setx	0x4a0e13080cd138ff, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f02ce50, %r1, %r9
	setx	0x8601e5db0b7fd835, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ced2d25aa8, %r1, %r9
	setx	0x36aeade18c2c2602, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000dbfc46c1f0, %r1, %r9
	setx	0x396717fa4606902a, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e391bb06f0, %r1, %r9
	setx	0x7cf3b02345f3aa79, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000faff269dd8, %r1, %r9
	setx	0x42e537965803a57c, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e9fd530, %r1, %r9
	setx	0x3c5b2b8c2d61aa04, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800fc0c468, %r1, %r9
	setx	0xbed973fe07328b16, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000cac245a958, %r1, %r9
	setx	0x04ca05c2a5921c38, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d9e5425448, %r1, %r9
	setx	0xa0566d6c735c84d7, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000ed9c1ad838, %r1, %r9
	setx	0xd62c1bc879aa03ab, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000fcae6a3108, %r1, %r9
	setx	0x60d9910b6e36c383, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800ef451e8, %r1, %r9
	setx	0x506b92f4b7998255, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800ff94a40, %r1, %r9
	setx	0x2e1e88c5199777e4, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000ca2e98c010, %r1, %r9
	setx	0x39a76c78c701bb84, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000dd554d6a08, %r1, %r9
	setx	0x386ec4194ec53eb4, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000ed98c80e68, %r1, %r9
	setx	0x190214ed178ec931, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f8299e0ae0, %r1, %r9
	setx	0xc5dfab822249072c, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800ea54e48, %r1, %r9
	setx	0x4d77c60482e3426b, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f8c2160, %r1, %r9
	setx	0xc7d86516413cf072, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c9440a3ef0, %r1, %r9
	setx	0xc72d710fe8adffbf, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d464ce1550, %r1, %r9
	setx	0x9d0066146348fe6a, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ea610ab200, %r1, %r9
	setx	0x52f894f0752c2e70, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000fa0e428778, %r1, %r9
	setx	0xd4a60eb4d25b0e05, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e8e2e9f500, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000ddcbf1c898, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000c19be26ae8, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800fe4e560, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800ed6ddb8, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000c22a8dd5a8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800f4042a0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e7d20a0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000fa9bf4b2e8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000e565fbf3e8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000f8828662c0, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000e390081f98, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000d789cbd030, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000c23006f708, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800f5666f8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800edf61a0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e67f758, %r1, %r9
	setx	0x1f1017135b48551b, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f24d9f0, %r1, %r9
	setx	0xbb8f213857fcbc7c, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c0a5c067f0, %r1, %r9
	setx	0x64cf41b02726f91f, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d684028698, %r1, %r9
	setx	0x3474b13d100af9e3, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ef0e35f280, %r1, %r9
	setx	0x6accc4bfed517cfc, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f2e573d568, %r1, %r9
	setx	0x089496c14e0437ed, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800ec39b40, %r1, %r9
	setx	0x52771ff64a177e39, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800ffda0e8, %r1, %r9
	setx	0xe3c74e85fe3c5ca9, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000cca19a3338, %r1, %r9
	setx	0x29e5e9432890a459, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d5688cc670, %r1, %r9
	setx	0x2c8e9bb642980f25, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000ec63590720, %r1, %r9
	setx	0x0d4e8ddf169c2f81, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f8f72c7ee0, %r1, %r9
	setx	0xd5f8960068ed382d, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e3fbd20, %r1, %r9
	setx	0x4eff7ccc103bfb97, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f57aaf8, %r1, %r9
	setx	0xc54ce18432da892e, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c827757038, %r1, %r9
	setx	0x3ecc6a0e7175a14a, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d62928abc8, %r1, %r9
	setx	0x7e72e3d445693970, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000ef67a711b8, %r1, %r9
	setx	0xd9a925190a07f321, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f462f6a1a0, %r1, %r9
	setx	0x667ff1048e31789c, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e1488c0, %r1, %r9
	setx	0x89da6671b5787ceb, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800fa8bb60, %r1, %r9
	setx	0xc2a08331a5145f86, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c383b07c70, %r1, %r9
	setx	0x124f27a9f3985135, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000dce8826868, %r1, %r9
	setx	0x5f0cac622ec40fb6, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000eec6a883c8, %r1, %r9
	setx	0x7185a113105a4f2e, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f219aeefb0, %r1, %r9
	setx	0xc36444cb151f9ecf, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000eeb1cfae30, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000d1e6b13d80, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000c6e8a3c110, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800fe75580, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800ffae0b0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e6a5178, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000f2764f1148, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000e8f3034050, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000dfeeaa4638, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000c1cefbf418, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000f6022bd458, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000e7a6e3a178, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000d7b644b5b8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000c4e65317a0, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000c8f32a7c90, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800f3e1100, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e9bfa40, %r1, %r9
	setx	0xaea1a7d39d3306c4, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f6aae28, %r1, %r9
	setx	0xa9efaf1cb9229e6a, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c7eb59e588, %r1, %r9
	setx	0x07373f111ce11c8d, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000debe2b0b00, %r1, %r9
	setx	0x5fa6488df4605d9f, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000eae91fd4d0, %r1, %r9
	setx	0x8d2f0e5097779931, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000fad8417ed8, %r1, %r9
	setx	0x4b549b339ca05d16, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800ee8c990, %r1, %r9
	setx	0x6140d35e85ba0c01, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f61e2c8, %r1, %r9
	setx	0x99d57c2051199481, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000cc32a04920, %r1, %r9
	setx	0xe1fb626aba5385e5, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000da070ade38, %r1, %r9
	setx	0x20bc7aed64678197, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e7e1576228, %r1, %r9
	setx	0x062bcf1969dd1bc9, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000fa0422d830, %r1, %r9
	setx	0xb18545251c5185d5, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e436e70, %r1, %r9
	setx	0x37e750a954348fcf, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f8b8070, %r1, %r9
	setx	0x6b14746d6554ab41, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c4a2657028, %r1, %r9
	setx	0x4d7a3eecf90260d8, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d72ec7abb8, %r1, %r9
	setx	0xb4ee2755010cdcc5, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e6c4faa408, %r1, %r9
	setx	0x2da2f7ae411cd9c9, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f2470d0aa0, %r1, %r9
	setx	0xbc8b6648a907389c, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e9012a8, %r1, %r9
	setx	0x965bb43281fee5aa, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f691868, %r1, %r9
	setx	0xd45e103f7a408e94, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c494b03fc8, %r1, %r9
	setx	0x35336e355cca8660, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000dc907c9eb0, %r1, %r9
	setx	0x870f3825fa575817, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000eca0d847a8, %r1, %r9
	setx	0xb9b684a7e611f863, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f4b31edbd8, %r1, %r9
	setx	0x26a29848df8d025c, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f49bbf0, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000ec2a816e28, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000f462f6a1a0, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000ef67a711b8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000d62928abc8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000c827757038, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800f57aaf8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800e3fbd20, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000f8299e0ae0, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000c3fd94b230, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800f0e8b10, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e4e6fe8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000fa6ab0b798, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000eb05e998a8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000dc602f97a8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800ea31498, %r1, %r9
	setx	0xae1a1147c12e45bc, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f38d308, %r1, %r9
	setx	0xd8d27358d4b9e390, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c19961ff70, %r1, %r9
	setx	0x7fc51e63eb2f2149, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d5afdacf28, %r1, %r9
	setx	0x4572952b128b0d78, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e8406e50b0, %r1, %r9
	setx	0x1e7b9b6dcf8fd5b8, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000fcb404ded0, %r1, %r9
	setx	0xec2f03424743761e, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e8587a8, %r1, %r9
	setx	0xb29fdacd4d722279, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800fd46828, %r1, %r9
	setx	0xa49ea157dfedb071, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c600ce9800, %r1, %r9
	setx	0xcae8bfa6594ee141, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000daec653be8, %r1, %r9
	setx	0xfcc73998577192ff, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000ed79cf4998, %r1, %r9
	setx	0xbb48ca91bc5a3b29, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f690fc5d20, %r1, %r9
	setx	0x86a253f2a7570d50, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e2485e8, %r1, %r9
	setx	0x9dc7a01d45487a29, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f94bdc0, %r1, %r9
	setx	0x9450ed34ff85ade7, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000cbdd1ba260, %r1, %r9
	setx	0x0eea53333c00e1b1, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d1622c7370, %r1, %r9
	setx	0x70b9148cd06b6b09, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000eee05fdfa0, %r1, %r9
	setx	0xa18f453c24c98dd2, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000fa01197398, %r1, %r9
	setx	0xac576afed1b37db9, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800edede68, %r1, %r9
	setx	0x8116402530bb7058, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f21cef8, %r1, %r9
	setx	0x9f53b340cf8f17df, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c007a32028, %r1, %r9
	setx	0x2d09f34c8a222307, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d81ad65880, %r1, %r9
	setx	0xc49cb3568c7774d1, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e42b1d68e0, %r1, %r9
	setx	0x373e96a4cbc8f613, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000fa977dc790, %r1, %r9
	setx	0x56dda0dbed673230, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e8e2e9f500, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000ddcbf1c898, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000c19be26ae8, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800fe4e560, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000d89a99dfa8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000c739ed3fb8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800f869328, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000e31030af08, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800eb303a0, %r1, %r9
	setx	0x391320496dec8b26, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f7634d0, %r1, %r9
	setx	0xc581150f098f7606, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000cf09c894d0, %r1, %r9
	setx	0x3b4fd0ea531759d1, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d83d5d00c0, %r1, %r9
	setx	0xb71a89da4769f84b, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e15b79a108, %r1, %r9
	setx	0xc20cb1b42f57c5fa, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f849f768a8, %r1, %r9
	setx	0xa239f49af3494fdd, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e8b2468, %r1, %r9
	setx	0x826452635f6093a5, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800faadbe8, %r1, %r9
	setx	0x2feb4d3a9af47f7b, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c68025cd28, %r1, %r9
	setx	0x578f840d88a7b324, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d0ba64eea0, %r1, %r9
	setx	0xcb4606ee59ab3e35, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e63ee97620, %r1, %r9
	setx	0xbed7e82bebff4db6, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f029f0fcb8, %r1, %r9
	setx	0x0d1a02520d3ba908, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e993bf0, %r1, %r9
	setx	0xf297b43d8f720097, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f5cc158, %r1, %r9
	setx	0x2be7871a4e1b5292, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c7e6b0aa38, %r1, %r9
	setx	0xfda4df8345e1082f, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000de9d979700, %r1, %r9
	setx	0xcd40279d938a9247, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000ea294eaa80, %r1, %r9
	setx	0xf6d54645f0fc2060, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000fc16242168, %r1, %r9
	setx	0x1f90f2250a39fc3f, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e894110, %r1, %r9
	setx	0x6a76a7319d69ac06, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800face458, %r1, %r9
	setx	0xa5af10f9ca194cd5, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c63c2d0d18, %r1, %r9
	setx	0x2b7faa7eeaf403d8, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d01e982168, %r1, %r9
	setx	0xe4cc1a7ac2565bdc, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000efc1bd0f00, %r1, %r9
	setx	0x8a27433be3029f3e, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f8899c41e0, %r1, %r9
	setx	0x7d98568d8423be6b, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c5601b67f8, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800f91e330, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800e563428, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000fa0cac2f08, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000ef268b9e60, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000d5c2481e20, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000cdb4cba930, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000e9508e2cd8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d3beaefb00, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000e6e76f40f8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000daf6790148, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000cd7f8960a0, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800ffccd08, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800f21cef8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800edede68, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000f4b31edbd8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000eca0d847a8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000dc907c9eb0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000c494b03fc8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e78e7e8, %r1, %r9
	setx	0x99e0f39db19a2983, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f6afef8, %r1, %r9
	setx	0x4492c854fe7a33a4, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000cad971bbc0, %r1, %r9
	setx	0x2480270df5a7a531, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d83f12f630, %r1, %r9
	setx	0x81fe18f1797e0971, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ece2d3a758, %r1, %r9
	setx	0x678f785637c0fd47, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000fae676a8a0, %r1, %r9
	setx	0x79e2f65f28c77997, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e584c80, %r1, %r9
	setx	0x0225e98533625216, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800fd9e530, %r1, %r9
	setx	0x0d310c806033a56b, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c8e9dd57c8, %r1, %r9
	setx	0x1ed20bef89865276, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d41bb67380, %r1, %r9
	setx	0x7752d2e565090ec2, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e71d89e638, %r1, %r9
	setx	0x9d3630a83b16fa35, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000feeb326750, %r1, %r9
	setx	0xcef99c8d4524dd7e, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e64da00, %r1, %r9
	setx	0x7b7012a41b87c6d8, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800fc9cc00, %r1, %r9
	setx	0x07fc3fe6273575d6, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c699157f60, %r1, %r9
	setx	0x35bc217237d4e782, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d5de8ca7e8, %r1, %r9
	setx	0xb05b2cf5792671b0, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e62e5e8940, %r1, %r9
	setx	0x0f948373b246c631, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000fadb385e88, %r1, %r9
	setx	0xe649e60c5590646a, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e1c66b8, %r1, %r9
	setx	0x2e1b86d69c8ec1e7, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800fb40968, %r1, %r9
	setx	0xcb70bd874d57e90c, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c23a373a18, %r1, %r9
	setx	0x5544fb1cd7b889e8, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d1d75a2318, %r1, %r9
	setx	0x2b25589e0aac6cb4, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e08dd78dd8, %r1, %r9
	setx	0x3bef5808383f6aa4, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000fe8dc960e8, %r1, %r9
	setx	0x8770496759e345ab, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e9fb0e27c0, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000d43de35c20, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000c09b4edf68, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800f0ea838, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800ea5d9a0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000fae40332e0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000e83fe46a40, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d5df1ccec8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e6e9868, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000fa85702dd0, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000eec1f54568, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000dc6584d470, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000cc7aa63370, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800eb1f298, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000fa72f95cf0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000e8f1f65108, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000dec7d4b020, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000c958a0e1d0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800eb957a0, %r1, %r9
	setx	0x523149755ff07fe5, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800fb914f8, %r1, %r9
	setx	0x04aa467927bb26c1, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000cb90bc2970, %r1, %r9
	setx	0x212b73b97ffdaf05, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d5a018ef30, %r1, %r9
	setx	0x683cf3d4c232a4d3, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e8450f83c0, %r1, %r9
	setx	0x77bb391c30d6bdc3, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f244d34060, %r1, %r9
	setx	0xcccaf9b8ea75a13e, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e3a0c30, %r1, %r9
	setx	0xdbbdf681a50f305c, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f90cdd8, %r1, %r9
	setx	0x16b56e5f5cf8e169, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c22f2367e8, %r1, %r9
	setx	0x0eefec3151fce23a, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000df50dc2628, %r1, %r9
	setx	0xbb2a7e3001b458f6, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e1a4645a58, %r1, %r9
	setx	0x3f5456a013296364, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000febf73a6e8, %r1, %r9
	setx	0xdffd9e7493f354a5, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e17f380, %r1, %r9
	setx	0x482f38d0bff0fd2c, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800fbbf878, %r1, %r9
	setx	0x08d6d326572819a8, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c42a497298, %r1, %r9
	setx	0x3486662e667dcb3b, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d4120a37c0, %r1, %r9
	setx	0xf079c5c9380752df, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000edb448bee0, %r1, %r9
	setx	0xd99b632eb9d1bf19, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f8cf6245a0, %r1, %r9
	setx	0x9226efc947fd569d, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e900b30, %r1, %r9
	setx	0x2b04ac6077e6b8eb, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f01a5d0, %r1, %r9
	setx	0x700cda3ff3b4ca3a, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c5df67e680, %r1, %r9
	setx	0x3e4dc939aa6384d7, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d8da44ae08, %r1, %r9
	setx	0xe0c4fd6ed43a7d7a, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e48f9f2a58, %r1, %r9
	setx	0x5e11110140afca64, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f4d643cb18, %r1, %r9
	setx	0xe8fa10d0dd5fd3b4, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800eab5030, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000f44487b818, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000e346f8def8, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000de704fb540, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000c1cefbf418, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800fc49a38, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e0b1090, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e58fcc0, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000f2f4d0bd60, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000eb8693d0f0, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000d399a5acc8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000cd405fcf38, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800f591d90, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800e63b1e0, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800e1c66b8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000f8899c41e0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800eee6700, %r1, %r9
	setx	0xb973013af55c51c8, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f10f8e0, %r1, %r9
	setx	0x31156cff50e2c196, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000cacd55a550, %r1, %r9
	setx	0x7272820ba35f7b5f, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d13c072a10, %r1, %r9
	setx	0xdeaaa1a492a3a160, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e80a7a4198, %r1, %r9
	setx	0xa533d0f8b39ff4d8, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f87ea59e20, %r1, %r9
	setx	0x6e70345fc74d71e7, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e9c7fe0, %r1, %r9
	setx	0x9022136358bf5168, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f577e00, %r1, %r9
	setx	0x254da5feb5b1a70b, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c8aa760398, %r1, %r9
	setx	0x5a8e4742a612b8e2, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000df5acdcb38, %r1, %r9
	setx	0x54ef240ebc75466f, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000ec1a6addc8, %r1, %r9
	setx	0x7f5fda0f2d79c1bd, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f0b7a4ed98, %r1, %r9
	setx	0xf65f6e2a80984853, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800ec7d358, %r1, %r9
	setx	0x8279126d55508018, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f26b978, %r1, %r9
	setx	0xf9fb6124ccb6024d, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c460b021f8, %r1, %r9
	setx	0x0c209efc3828f6ad, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d2280416d0, %r1, %r9
	setx	0x308d511f78198dee, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e35fe9f370, %r1, %r9
	setx	0xa2f497fd3297e67f, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f4936a1ad8, %r1, %r9
	setx	0xa1d506a6910e6736, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e443e30, %r1, %r9
	setx	0xf56e4200b157a4cd, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f504aa0, %r1, %r9
	setx	0x467d948c3ad9e800, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000cb43501338, %r1, %r9
	setx	0x84d756254697693d, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d14a238a28, %r1, %r9
	setx	0xde585a17956aed72, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000eb722516b8, %r1, %r9
	setx	0xb59883ea0f43fe33, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f66b1bd900, %r1, %r9
	setx	0x332fbdfa787a1cde, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c7ff858180, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800f99d078, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e1b38e0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000f4acac6d10, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000ec2a816e28, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d13168f100, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000cd405fcf38, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800f591d90, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800e63b1e0, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000fac4431720, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800f836f40, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e3f4448, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000f276f9acf0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e853270, %r1, %r9
	setx	0xfdff0f82da1f8558, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800fb14130, %r1, %r9
	setx	0x67f413ca5613e19f, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c0e8d5c0f8, %r1, %r9
	setx	0x6eabfae0af95771c, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d7f4a68920, %r1, %r9
	setx	0x6eb39fe2ee3cae4e, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e698968b60, %r1, %r9
	setx	0xb828a14f891e061a, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000fe151e5d90, %r1, %r9
	setx	0xd5fdb5a8d902a4b3, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800ede3780, %r1, %r9
	setx	0xa11e957daad0f707, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f79c770, %r1, %r9
	setx	0xf61eca6e584e2a15, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000cf28c0d658, %r1, %r9
	setx	0x892efb26d4d2bdb9, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d3e91a1d30, %r1, %r9
	setx	0xf7326589ccd42ebf, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000ec3ae9db98, %r1, %r9
	setx	0x3a6c74a1c292b4ef, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f4fe575928, %r1, %r9
	setx	0x8a593c666e437168, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e7c97e8, %r1, %r9
	setx	0xb20595e2a3d63b01, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800fb50948, %r1, %r9
	setx	0x831d9dd204679cb4, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000cdf16bf3a0, %r1, %r9
	setx	0x9fee69565be394e5, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000db397bd7e0, %r1, %r9
	setx	0x2af5ca0b310d8beb, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e55b482820, %r1, %r9
	setx	0xc4a45de6e9095afa, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f874f25020, %r1, %r9
	setx	0x4a8022ca0d59ea94, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e6b3150, %r1, %r9
	setx	0x57465754c94aa709, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f2bd970, %r1, %r9
	setx	0x9b3325a6524b451f, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ca2f996e10, %r1, %r9
	setx	0x4b715eab57687c5e, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000dae5aadac8, %r1, %r9
	setx	0xc96b486514569549, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000eb27a2fed8, %r1, %r9
	setx	0x6ae2997d000b022e, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f2285d2968, %r1, %r9
	setx	0x1b116e2637fe796d, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800eeade60, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000f612edcc60, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000e7a3e04cf0, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000d652ef09c0, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000c557caa7f0, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800effa1f0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000fa5b4666a8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000e7b9dd2520, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000da8f9da0a0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000cd6cf7e990, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000cd0bb3c558, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800f6d9418, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800e6e9868, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000fa85702dd0, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000f276f9acf0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000ed8657c3c8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800efbbd20, %r1, %r9
	setx	0xf19969df828b7549, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800fc2f710, %r1, %r9
	setx	0x445792e780c1a464, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c988b38a88, %r1, %r9
	setx	0x4ca68cea0b1da344, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d0fcfdb5f0, %r1, %r9
	setx	0x71e89c74d73a0703, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ec89074d08, %r1, %r9
	setx	0x14150bfb1a2db036, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f84601d1e8, %r1, %r9
	setx	0x6feae0074744990d, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e9ad528, %r1, %r9
	setx	0x6065a5dfb4600c34, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800fb02e08, %r1, %r9
	setx	0x1e10a196d54cf24e, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000ce6a05cc48, %r1, %r9
	setx	0xcf2e02950639bf1c, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d37dbbd9d0, %r1, %r9
	setx	0x5f16b824adaf3503, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000eb22c01e08, %r1, %r9
	setx	0x61fa4ecdd625d921, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000fc979b5f28, %r1, %r9
	setx	0x2550418bd7dc073d, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e1f4e48, %r1, %r9
	setx	0x9b55b291a3c05fa4, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800feccb18, %r1, %r9
	setx	0x411887e65abf6945, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000cfd9f5f480, %r1, %r9
	setx	0x6400ab84825362ff, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000ded9089740, %r1, %r9
	setx	0xdef16680e78d3e09, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e3a873b398, %r1, %r9
	setx	0x6432d6baf2f04fcf, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000fe1c545ae8, %r1, %r9
	setx	0x5c90a16b8d691d86, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800ee81070, %r1, %r9
	setx	0xbb83976dd16f1694, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f19ac60, %r1, %r9
	setx	0x4f0cbc3ecd3b1ecc, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c04bbc2f20, %r1, %r9
	setx	0x1241931d19d75e9e, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ded45bce50, %r1, %r9
	setx	0x5044d4cfef77d961, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e52e840888, %r1, %r9
	setx	0xf454fc0968239505, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f8e3b45c90, %r1, %r9
	setx	0x29af978076c03850, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800fe75580, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800ed7c9a8, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000fe0976e200, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000ed86c91aa8, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000dc6e28d160, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000c175b588e8, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800ffbb4e0, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800ff59b70, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e064090, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000f8468ec1d0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000e0e1c20aa8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d402207730, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000c872fea3e0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000e55b482820, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000db397bd7e0, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000cdf16bf3a0, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800fb50948, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800e7c97e8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800eb1f298, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000fa72f95cf0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e2ce7a8, %r1, %r9
	setx	0x889df954f6e175cf, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800ffbd020, %r1, %r9
	setx	0xf21adf2d708916df, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c2c0361098, %r1, %r9
	setx	0xc1b2e99f7e2eabc9, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000dfdbbfc4c0, %r1, %r9
	setx	0x539ee93273da6a29, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e1917fa4a0, %r1, %r9
	setx	0x11f4782862de863d, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f01bdc8310, %r1, %r9
	setx	0x1a11c15f86d2e4ed, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e07cc50, %r1, %r9
	setx	0xe0658da486caa5e8, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f03ac70, %r1, %r9
	setx	0x72120f55dee4c7c0, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c8e3e2a350, %r1, %r9
	setx	0x139c9654a334a6ed, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000db1d5f80d0, %r1, %r9
	setx	0x50b48a1d1fda3bb7, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e7d7697f40, %r1, %r9
	setx	0x6542453f1624bc54, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f48782edc8, %r1, %r9
	setx	0xc733d3db1dbc470f, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800ec79368, %r1, %r9
	setx	0x872df92d93f17db0, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800ff3d3c8, %r1, %r9
	setx	0xfa45da46b79f88a1, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c04b59a400, %r1, %r9
	setx	0x158fd7843d060998, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d34caf85d8, %r1, %r9
	setx	0x18077deb1ccf3121, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e38d284410, %r1, %r9
	setx	0x4e149f2573f7ce12, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f03b04f348, %r1, %r9
	setx	0x001e6048524102ea, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e333920, %r1, %r9
	setx	0x20ec50b5d9674f9a, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f0e87d0, %r1, %r9
	setx	0x2914643ecfd5968f, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c8cfe82588, %r1, %r9
	setx	0x5aff5fb41a3ac626, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d8566d3898, %r1, %r9
	setx	0x393d012e5793dff9, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e0b684d8f8, %r1, %r9
	setx	0x969434346dc46c0f, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000fc4ee5c588, %r1, %r9
	setx	0xe27f10af4fc41949, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f7f2890, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800fb02e08, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e9ad528, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000f4fe575928, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000ec3ae9db98, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d3e91a1d30, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000edb448bee0, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000fa4d972098, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000e828a71220, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e4a8140, %r1, %r9
	setx	0x4286a09326f4b386, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f9e0930, %r1, %r9
	setx	0x4719f7715338123f, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c5d8b2c500, %r1, %r9
	setx	0x8efca401ec9ae633, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000dda1a23348, %r1, %r9
	setx	0x34cabe029c3fb217, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e3dad39f78, %r1, %r9
	setx	0x6dca9bfa0cdd4bd5, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f21b38d5a0, %r1, %r9
	setx	0x7dd7af765d79cd45, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e441068, %r1, %r9
	setx	0x8c02e01b3c031cac, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800fe233b8, %r1, %r9
	setx	0x40fc6823eed67387, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c03f2150f0, %r1, %r9
	setx	0xd7f9632ef7669971, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000da972e5e28, %r1, %r9
	setx	0x0f7865cce1ea52ab, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000ebdec19b60, %r1, %r9
	setx	0xa55fe96d0999548e, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000fc9ea30f98, %r1, %r9
	setx	0x714440efde00ced7, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e166d28, %r1, %r9
	setx	0xbf3ff55928dfcf8a, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f64f550, %r1, %r9
	setx	0xa715b355ce25647e, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c7664307b0, %r1, %r9
	setx	0x9c60c0450288604d, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d26ec2b450, %r1, %r9
	setx	0x74d19c7fc8711808, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e57566d840, %r1, %r9
	setx	0x100507475a7ed66c, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000fc45516e18, %r1, %r9
	setx	0xeacadc57bc31eb69, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e6e33d8, %r1, %r9
	setx	0x0349b7c201e6c24b, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800fcf63f0, %r1, %r9
	setx	0xe0b438efac1cf876, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c544d5a2e8, %r1, %r9
	setx	0x7ccb798684ec1ab1, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d86578c3b0, %r1, %r9
	setx	0xf9cbc34f3ff0d71f, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e5c6b45260, %r1, %r9
	setx	0xb3080721174f9ad8, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000fea6c23e18, %r1, %r9
	setx	0x746b243392b6cfa9, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f38d308, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800ea31498, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000fad8417ed8, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000eae91fd4d0, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000debe2b0b00, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000c7eb59e588, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800f6aae28, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800e064090, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000f8468ec1d0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000dbbf8a2120, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000c141350988, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800ffb1570, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800e35e430, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000f6f6128be0, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000e75b9fe0d0, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000d49dc69958, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800f19ac60, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e9b01b0, %r1, %r9
	setx	0x7fb04d7ae7371ccb, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800fdf5bd8, %r1, %r9
	setx	0x1e476079095306c6, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000cd1e9ba610, %r1, %r9
	setx	0xae3e7cabd7d837a7, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000dc55fb46e8, %r1, %r9
	setx	0xb8c57700f2eecffd, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e227089628, %r1, %r9
	setx	0xd1250674dd0fb570, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f6f8802008, %r1, %r9
	setx	0xb69846dff5977379, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e02e968, %r1, %r9
	setx	0x24825af4fe6fbbe4, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f576570, %r1, %r9
	setx	0x97836dacf1242e2f, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c3468390e0, %r1, %r9
	setx	0x5e0f7256525d97d0, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d4519cd858, %r1, %r9
	setx	0xdd0c581959cce4c8, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e7f76add28, %r1, %r9
	setx	0x15602e2b133bfb5c, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f654d0c188, %r1, %r9
	setx	0x551ca4273fa5357c, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800ec07408, %r1, %r9
	setx	0x1c39fa97028d3aa5, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f37bb68, %r1, %r9
	setx	0xb32b899b9835c292, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000cd5db02938, %r1, %r9
	setx	0x654039ca8d16c7c5, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d27de77f98, %r1, %r9
	setx	0xc45c266a427a96ee, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000ed0f720cf0, %r1, %r9
	setx	0xe619f7d4198be735, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f2ad8abf40, %r1, %r9
	setx	0xbd9104d6c3ccfa24, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800ef85ad0, %r1, %r9
	setx	0x4e8a3fcf860bd206, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f201660, %r1, %r9
	setx	0x0cccff111890fb88, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c4bdad9458, %r1, %r9
	setx	0xc2478873e5df217a, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000db73a5d6b0, %r1, %r9
	setx	0xe793a26f5a969f59, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e82c8c4598, %r1, %r9
	setx	0x2797662887f0dd08, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f640455148, %r1, %r9
	setx	0x5294191364f9282f, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ef268b9e60, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000d5c2481e20, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000cdb4cba930, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000d5688cc670, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000cca19a3338, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800ffda0e8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800ec39b40, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000fcae6a3108, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800fbbf878, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800e17f380, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000c23a373a18, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800fb40968, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800ebb7578, %r1, %r9
	setx	0x57efaa493cce3243, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f025f10, %r1, %r9
	setx	0xa130276b7dc4ab54, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c25c37a850, %r1, %r9
	setx	0x37f182d52fa1fb4f, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000df661e8ec8, %r1, %r9
	setx	0xd0e6ec2f2423e129, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e883f87fc8, %r1, %r9
	setx	0xf19c6947777ac62e, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f84c127538, %r1, %r9
	setx	0x6d876d1c46556615, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800eaa4530, %r1, %r9
	setx	0x2da36b6e84d8d2a4, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800ff72aa0, %r1, %r9
	setx	0xc41301d5fe160de7, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c86a4574e8, %r1, %r9
	setx	0x7e9ee7f2b7852a1c, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000daad533c78, %r1, %r9
	setx	0xc8af952f2a36a930, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000ede48d6bd0, %r1, %r9
	setx	0x8854ab37a4c06f6c, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f02050a330, %r1, %r9
	setx	0x80627f9c08ed1d25, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e3071f0, %r1, %r9
	setx	0x96094a9a116e57fa, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f08eb48, %r1, %r9
	setx	0x22cace7d3db61849, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000ced6fc8f08, %r1, %r9
	setx	0x5fe97e749a8472c0, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000ded92c9d80, %r1, %r9
	setx	0x5ac3ab66ce15ab5b, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000edf4ef6d28, %r1, %r9
	setx	0x5c4660638e39f87a, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f0b40e46d0, %r1, %r9
	setx	0xfcc804ec0813e2d6, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800eaac360, %r1, %r9
	setx	0xa76f25f501fca8ee, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f77faf0, %r1, %r9
	setx	0xa622d17b10b8fb1a, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c0b3f3dc60, %r1, %r9
	setx	0x3ff86bbb19a34e44, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d0386ca378, %r1, %r9
	setx	0xf786c30ed72026ef, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e0253381f8, %r1, %r9
	setx	0xf56c4a39190391e4, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000fa7af36dc0, %r1, %r9
	setx	0x89d8c0480477e9c0, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f01bdc8310, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000e1917fa4a0, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000dfdbbfc4c0, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000c2c0361098, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800ffbd020, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800e2ce7a8, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000f84601d1e8, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800e1b38e0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000f4acac6d10, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000ec2a816e28, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d13168f100, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000c7c4af1208, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800f997490, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000dec7d4b020, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000c958a0e1d0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800f85a4e8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800efee250, %r1, %r9
	setx	0x9180281dad514211, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f712738, %r1, %r9
	setx	0xfd32491e2fe7d834, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000caecd0e550, %r1, %r9
	setx	0xfc06b546274986ff, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000dab20420f8, %r1, %r9
	setx	0x6207d09a852eb292, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000eabae5c3e0, %r1, %r9
	setx	0x7c1114d096918344, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000fa8bc19eb8, %r1, %r9
	setx	0xf40b16150c7f0d94, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e4d41d8, %r1, %r9
	setx	0x235361586f56f7f7, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800ff50ff0, %r1, %r9
	setx	0xcee80f9c1e742f78, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000cb5f1c1d58, %r1, %r9
	setx	0xdc8ea639d1c4ab12, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d6d63005c0, %r1, %r9
	setx	0x3e6f0299ede4b921, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e090d8ed68, %r1, %r9
	setx	0xc2aaed4b44159f7e, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000fccbf87fc8, %r1, %r9
	setx	0x5b31e825b9ae0713, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800ed930a8, %r1, %r9
	setx	0x19dbf41d1ba7fff2, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f84fcd0, %r1, %r9
	setx	0xd6174929a11b7ad3, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000cab4e31d20, %r1, %r9
	setx	0x1636e2bd12363e9e, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000dcb8daee28, %r1, %r9
	setx	0xc03d7b8ef40457c1, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e042d98c18, %r1, %r9
	setx	0x1d5319bf7a175513, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f681cbd308, %r1, %r9
	setx	0xb856d0144b5e1ec3, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e5c3fc0, %r1, %r9
	setx	0x237cb8bab23b54ca, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800fd27dd0, %r1, %r9
	setx	0x5b5a2cfc6be388e0, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c57d0788c8, %r1, %r9
	setx	0xfd71f2c2b85a0428, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d5f22f8668, %r1, %r9
	setx	0x5f08af34d134bc40, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e95245ac28, %r1, %r9
	setx	0xe3a421e00f1b3857, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000fc84476140, %r1, %r9
	setx	0xbc5e2232a1544561, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800e563428, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000fa0cac2f08, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000ef268b9e60, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000fc979b5f28, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000eb22c01e08, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d37dbbd9d0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000ce6a05cc48, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800fb02e08, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e9ad528, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000f4fe575928, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000c7664307b0, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800f64f550, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800e166d28, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000f03b04f348, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000e38d284410, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000d34caf85d8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000c23a373a18, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800fb40968, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e1c66b8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000f8899c41e0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e5a8100, %r1, %r9
	setx	0xaa9dd35e860382ff, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f113598, %r1, %r9
	setx	0x273c26a765c36b31, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c9e3fed0e0, %r1, %r9
	setx	0x2925c4271c22be8e, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000de310f1600, %r1, %r9
	setx	0x2f40f1c4b72fbcbe, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e4fc2f5c28, %r1, %r9
	setx	0xfe2b60fcc55b1c35, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000fa788b0b98, %r1, %r9
	setx	0x1ce6746efc5ad5f5, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e3105d8, %r1, %r9
	setx	0x996d77fd7e79dc0b, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f3ac0e0, %r1, %r9
	setx	0xa687fbbcd87dfcb1, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c6b50c94d8, %r1, %r9
	setx	0xeeb94242c4925444, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000dbbb1d14d8, %r1, %r9
	setx	0xab68a17d93f9ed8b, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000effd8b9470, %r1, %r9
	setx	0x71ded9793bf4bce5, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f486634e48, %r1, %r9
	setx	0x4a6ae89b4e467848, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e2d6370, %r1, %r9
	setx	0x079312ee9bc17362, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f420668, %r1, %r9
	setx	0x129638f4caffec5e, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000cf940b86f0, %r1, %r9
	setx	0xefc8805922e03f10, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d362816360, %r1, %r9
	setx	0x8be927c163589602, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e0016ffeb8, %r1, %r9
	setx	0x5e909be640f763ad, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f4e2d46d50, %r1, %r9
	setx	0x77d2950f7b9ac401, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800eb933c8, %r1, %r9
	setx	0x80cae53224154af0, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800fa59be8, %r1, %r9
	setx	0x20943aece93a98a3, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c9b9dddd78, %r1, %r9
	setx	0x064c736d0559041f, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000df436bba30, %r1, %r9
	setx	0x4b313842a43970ae, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000eef00115e8, %r1, %r9
	setx	0x78f2025b2541b64e, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000fca269cb38, %r1, %r9
	setx	0x790a5598e41c0d54, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c168676610, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800fca5530, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800e94a9b8, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000fe2eddaef8, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000e4e8442798, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000d3b5f9b648, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000c4fb81c168, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800ecc5118, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000f03aab0938, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000e6d0f29358, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000de05bf4298, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000c2e2f68d40, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000dce8826868, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000c383b07c70, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e566228, %r1, %r9
	setx	0xe0754dfcfa4db6d4, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f0524d0, %r1, %r9
	setx	0xee8c2af4b3c85aa1, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000cbf7be1690, %r1, %r9
	setx	0x890a999e26bb94ac, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000dc71e4cbf0, %r1, %r9
	setx	0xcf8b4aed7745d0ad, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e13784d8d0, %r1, %r9
	setx	0x820072b9ce265640, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000faaf17b160, %r1, %r9
	setx	0xf0924809d9db4c03, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800eeaeb90, %r1, %r9
	setx	0x08ecb2a141faaf33, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f524808, %r1, %r9
	setx	0xcd83f0c4ff60da64, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c565c7f7a0, %r1, %r9
	setx	0x2a4f63247e3f1450, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d269d28dc8, %r1, %r9
	setx	0xaa98334ef0f811ce, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e816e78aa0, %r1, %r9
	setx	0xb95f55a73c71daa9, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000fe10bdc800, %r1, %r9
	setx	0x9f8ee7929e105130, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e184790, %r1, %r9
	setx	0xbd6710d048448b1b, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800fb6ff10, %r1, %r9
	setx	0xc5933ba44058855d, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000caaedf1438, %r1, %r9
	setx	0xa05e3f1f1fd42630, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d099fdc658, %r1, %r9
	setx	0x9ef4d05174594257, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e8dc84ad70, %r1, %r9
	setx	0x46bff9f398672222, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000fc6d126ac8, %r1, %r9
	setx	0xee2488d5c974467b, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e5fd4f0, %r1, %r9
	setx	0xcf673570af79ce08, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f64b8d0, %r1, %r9
	setx	0xb74f0a66bee8e42e, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c0ad750198, %r1, %r9
	setx	0x33f5c82051e6bd7e, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d8d28d4bd8, %r1, %r9
	setx	0x9e7a8e15d55ca982, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e69fc608e8, %r1, %r9
	setx	0x8adac21a86131f8b, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f87e48e768, %r1, %r9
	setx	0xa6b3658a0d4430f8, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e15b79a108, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000d83d5d00c0, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000cf09c894d0, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800f7634d0, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800eb303a0, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000fcb404ded0, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800fc9cc00, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000d81ad65880, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000c007a32028, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e5c9ed0, %r1, %r9
	setx	0x671e485718a35865, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f864398, %r1, %r9
	setx	0xd0d46cc7df91d969, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c36d3f70b0, %r1, %r9
	setx	0x5c71f2041f38bad0, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000dcb109eb90, %r1, %r9
	setx	0x3fbe4f6e6a88a8a7, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e41866ef20, %r1, %r9
	setx	0x53714b49e68f711a, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f41a29c588, %r1, %r9
	setx	0x944c1c141a51161a, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800ee835d8, %r1, %r9
	setx	0x013db58e9f3f3b80, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f675520, %r1, %r9
	setx	0x27ec2b294da84128, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c95eccae38, %r1, %r9
	setx	0x4110af0a5b62416a, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d99b494430, %r1, %r9
	setx	0xd1a4eeace1af8310, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000ea7a30d408, %r1, %r9
	setx	0x11ffd3907b0bfaca, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000feb9321a98, %r1, %r9
	setx	0xc85a7aa9698ac576, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e88ac88, %r1, %r9
	setx	0x8b56d4079e112c15, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800fdc2f20, %r1, %r9
	setx	0xb28449d5139f9495, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c5b3560068, %r1, %r9
	setx	0x264b84ec3837b20e, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000dd54673448, %r1, %r9
	setx	0xbb422c51f0ed9cc8, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e9970a57b8, %r1, %r9
	setx	0x27ff055adefc432c, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000fc56fd1648, %r1, %r9
	setx	0xe61df60e73a47b96, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800ea22e58, %r1, %r9
	setx	0xc37c4decf8786585, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800ffced18, %r1, %r9
	setx	0xc608db67f0332670, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c9330da620, %r1, %r9
	setx	0xc189b9b688ed1972, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d9d58d1640, %r1, %r9
	setx	0x0fbbe449561765d4, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ec80181f20, %r1, %r9
	setx	0x36c3655a4d5b6d13, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f6ff0c9dc0, %r1, %r9
	setx	0x5f86ac9485b603af, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f24d9f0, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800e67f758, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000faff269dd8, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000e391bb06f0, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000d1654a58c0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000f2f9953d28, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000e8eec6be60, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000d1c0e17790, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000cd0bb3c558, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800f6d9418, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800e6e9868, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000fa85702dd0, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000e6f634a758, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000d0133f32e8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e7faf40, %r1, %r9
	setx	0x2f640d23adbd2103, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800fd8c988, %r1, %r9
	setx	0x6c90d8e329da7327, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c7c4a1ddc0, %r1, %r9
	setx	0x216cdf831a8ff392, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d545cf7e80, %r1, %r9
	setx	0x8110cfeebb044df8, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e843bd1248, %r1, %r9
	setx	0x20044c2a8a949877, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f43a936e00, %r1, %r9
	setx	0x1d0553cfbc5ecfe2, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e424970, %r1, %r9
	setx	0x01f7015b566978f0, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f2dd0d8, %r1, %r9
	setx	0x1147d1de96a0bdad, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000cd09eb1470, %r1, %r9
	setx	0xe665a103b43ea95a, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000de64a93460, %r1, %r9
	setx	0x2870e10b1fc147f9, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000ed7d366530, %r1, %r9
	setx	0x5f9ed01a738ed09c, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f40f14fe18, %r1, %r9
	setx	0x40026409029ebb10, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e11f100, %r1, %r9
	setx	0xe7f9c2074bf5a836, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800fc59ff8, %r1, %r9
	setx	0x7be1de16aff82ca4, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c6810df800, %r1, %r9
	setx	0x47b894d5900e83d5, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000de64f89ee8, %r1, %r9
	setx	0xd33e005ef39dba85, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e5c7a2c848, %r1, %r9
	setx	0xa0afd101ae0c3ac1, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f48c8854b0, %r1, %r9
	setx	0x27d7c947aabba525, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e9eb430, %r1, %r9
	setx	0xddda12c3f23a05a7, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800fe5fb58, %r1, %r9
	setx	0xe9afbe81959fa78d, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ce0a68c2e0, %r1, %r9
	setx	0x0a4e7defcedc7947, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000daabbf5800, %r1, %r9
	setx	0x59eb4c7571bd84fd, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e0141dd478, %r1, %r9
	setx	0x2c957a64d2648199, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000fa026b56e0, %r1, %r9
	setx	0x304f8165f7f8ed8d, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800eeade60, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000ec1a6addc8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000df5acdcb38, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000c8aa760398, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800f577e00, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e9c7fe0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000ded92c9d80, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000ced6fc8f08, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800f08eb48, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800e3071f0, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800ef85ad0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000fea6c23e18, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000e5c6b45260, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000d86578c3b0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000c544d5a2e8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800fcf63f0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e6e33d8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e116028, %r1, %r9
	setx	0x97457ccb6ac8c1b4, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800fef2ae8, %r1, %r9
	setx	0xb9d23a06a130f5d1, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c36a368a48, %r1, %r9
	setx	0xfd7a6904ac3e7a9b, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000da4c0f1738, %r1, %r9
	setx	0xab703346c0044631, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e8d82110a8, %r1, %r9
	setx	0xef6ffcf58134b88f, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f84e42d208, %r1, %r9
	setx	0xfb2dfc716dd2ad24, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e7e88d8, %r1, %r9
	setx	0x78f302c5d3883d54, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800ff57090, %r1, %r9
	setx	0x981efa75e013ac49, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000cdb6b13fd0, %r1, %r9
	setx	0x113c8a7fa98918fe, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000da2c2b23d8, %r1, %r9
	setx	0x237658ab0b382b16, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000ed3f836690, %r1, %r9
	setx	0x84ea0babf14a2dda, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000faee77da88, %r1, %r9
	setx	0x490182606d92edaf, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800ebb5fd8, %r1, %r9
	setx	0xeb1804d81ec95485, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f964cf8, %r1, %r9
	setx	0x77eae71f44c65e6d, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c6ff044aa0, %r1, %r9
	setx	0x8230967897c84cc8, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000db288088b8, %r1, %r9
	setx	0x2ebeddc8b308a2c0, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e6cd4b0748, %r1, %r9
	setx	0xb6c5d86df53ce4a5, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f6d41d7790, %r1, %r9
	setx	0x5471f510825ce244, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e3e9ac0, %r1, %r9
	setx	0x5b9af1e2491bc647, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800fb1b510, %r1, %r9
	setx	0xd14dc994641bda50, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c37f469098, %r1, %r9
	setx	0x800e90a56197110e, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d40e99cea8, %r1, %r9
	setx	0xc3011431e7c919cf, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ee9ad3aed8, %r1, %r9
	setx	0xb1177b15dec8a5f6, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f4ab12fa48, %r1, %r9
	setx	0x5142fe747c84c403, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c6e8a3c110, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800fe75580, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800ed7c9a8, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000fe0976e200, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000c8e9dd57c8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800fd9e530, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d4751be160, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000c56f6b95b8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800f412ab8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800ef81e68, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000f81e89cbc8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000f640455148, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000e82c8c4598, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000db73a5d6b0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000c4bdad9458, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800eab3e70, %r1, %r9
	setx	0xd3fc98c4cbf6a944, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f0c7e48, %r1, %r9
	setx	0x757d9203bbf8e11c, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000cbe4f13400, %r1, %r9
	setx	0xd31a61090bb3a3c3, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d29fdb1298, %r1, %r9
	setx	0x31a6087e04270bcf, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ecf9916a20, %r1, %r9
	setx	0xdb2fd450d5ae5485, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f482075868, %r1, %r9
	setx	0xb4553c9ba56d3212, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e7374e8, %r1, %r9
	setx	0x5d9728543d62155e, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f0c40d8, %r1, %r9
	setx	0x0390af40b6ae4b8a, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c0ca98bba0, %r1, %r9
	setx	0xe545bac5d178128e, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d4b65898a8, %r1, %r9
	setx	0x544a9dccbdffa48b, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e497227060, %r1, %r9
	setx	0xc5d829113412df40, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000fa6fc4e438, %r1, %r9
	setx	0x490c53f0b0c4c9f3, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e0d3190, %r1, %r9
	setx	0xe26ec42b4c0d6908, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f9d5b00, %r1, %r9
	setx	0x2affae874d737707, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000cda9f99fb0, %r1, %r9
	setx	0x78e216c855b717ed, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d12e4156c0, %r1, %r9
	setx	0xa8950bb0144218b3, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000ef8e5f8660, %r1, %r9
	setx	0xe9be752f2e944d68, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f0858a17f0, %r1, %r9
	setx	0xc3d2459008f037eb, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e64abe0, %r1, %r9
	setx	0x592643dfc03ca77f, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800fcbe0a8, %r1, %r9
	setx	0xac0ba89a5a2b7860, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000cbc70b3d58, %r1, %r9
	setx	0xa645cfffdc12065e, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d88a0a8be8, %r1, %r9
	setx	0x3aa5f35f692c1a68, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ea6d81d0c8, %r1, %r9
	setx	0xb3164d7440ab0bb3, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f6b9226fb8, %r1, %r9
	setx	0x3ab8abd37cabc730, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000df571ddeb8, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800e4d41d8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e6ec540, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000f07a09bc38, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000e8508f1550, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000d71ad9def8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000caa2a3d7b8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000d40e99cea8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000c37f469098, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800fb1b510, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e3e9ac0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800ebaea48, %r1, %r9
	setx	0x90979212c8a2481a, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f206f88, %r1, %r9
	setx	0x357c06e0d9c01136, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c6363bf740, %r1, %r9
	setx	0x5b59d01f065130ce, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000db0b5fcbc8, %r1, %r9
	setx	0xaabd827a9ede926a, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e87ab69c60, %r1, %r9
	setx	0x97baa645d3341cd4, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000fa555d89f8, %r1, %r9
	setx	0xdb1f2ecca76d071e, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e6cb668, %r1, %r9
	setx	0x68b5f06d42f3287d, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f835450, %r1, %r9
	setx	0x052267f886a59013, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000ccc35c2218, %r1, %r9
	setx	0x3f4be095d7dc2f89, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000ddda4f9d88, %r1, %r9
	setx	0x976bb4a03148d6a8, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e659de6678, %r1, %r9
	setx	0x498f0f7ccb31ba33, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f29af79418, %r1, %r9
	setx	0xc4be38b92591c85f, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e70cff0, %r1, %r9
	setx	0x5644d08bdadae207, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f0eebe8, %r1, %r9
	setx	0x499c8c714996ad31, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c6b265e650, %r1, %r9
	setx	0xbabf0b49b872de2f, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d53ff8e818, %r1, %r9
	setx	0xe38770cd08209c41, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e88e1c7ff0, %r1, %r9
	setx	0x9ff49f297fed0913, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000fe69e704b8, %r1, %r9
	setx	0x3a53e806869a4fa7, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e0553a8, %r1, %r9
	setx	0x7e212e4e3bd74418, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800fe89bf0, %r1, %r9
	setx	0x0df95c88427ee139, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c9c094aac8, %r1, %r9
	setx	0x353c517b6b102432, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000db357b5038, %r1, %r9
	setx	0x5b6d89a2f71f3702, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e4536a9cc8, %r1, %r9
	setx	0x032db608aab0e872, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000fc565a6500, %r1, %r9
	setx	0xf2365838d09ffed6, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e227089628, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000dc55fb46e8, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000cd1e9ba610, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800fdf5bd8, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800e9b01b0, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000f21b38d5a0, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000e3dad39f78, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000fae40332e0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000e83fe46a40, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d5df1ccec8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000c97920e0c0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800ffae0b0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e6a5178, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800ec7d358, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000f8cf6245a0, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000edb448bee0, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800eb1f298, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000fa72f95cf0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000e8f1f65108, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800ed92250, %r1, %r9
	setx	0x700d1fcc7c9e359b, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f629ec8, %r1, %r9
	setx	0xe39511706d107b93, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c860a454c8, %r1, %r9
	setx	0x5013903ea618e71f, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d8b352d448, %r1, %r9
	setx	0x42ec4d893deea2ef, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e01fcd8e38, %r1, %r9
	setx	0xdf0fc5d5d1448d9e, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f6634ceb98, %r1, %r9
	setx	0x361418100cd145fb, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e587210, %r1, %r9
	setx	0x0c51e1926a23c388, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f6f1b18, %r1, %r9
	setx	0x481db5abab291db9, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c636079378, %r1, %r9
	setx	0x0244b8b83c2ca234, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000da49f812f8, %r1, %r9
	setx	0xe2c7717c54fd4762, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e8f4926da8, %r1, %r9
	setx	0x29f8d4879e786a21, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000febfa4c8e0, %r1, %r9
	setx	0xe43bb36f4aea1722, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800eeab5e8, %r1, %r9
	setx	0x8139503b7a554ee9, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800fed5e68, %r1, %r9
	setx	0x3ab056cf98dbf3b8, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c55f02bfc8, %r1, %r9
	setx	0x33673ceb015f58a1, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000dd7884e918, %r1, %r9
	setx	0xf71d22a19596af54, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e1005e6c28, %r1, %r9
	setx	0x151bb0871b76bce0, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f60d9f9000, %r1, %r9
	setx	0xf438fd1f37728abb, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800eb30e48, %r1, %r9
	setx	0x4be5f46f96feb2f6, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800fb945a8, %r1, %r9
	setx	0xd4779029117dc61c, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c34683cba0, %r1, %r9
	setx	0xc74524e793343c9d, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ddeba05800, %r1, %r9
	setx	0xb659f3cf4b15a94e, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ee1685d288, %r1, %r9
	setx	0x7f5f48876122e5f7, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f21895ff58, %r1, %r9
	setx	0x5d2d9b3347206630, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c9e3fed0e0, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800f113598, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800e5a8100, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000fa8bc19eb8, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000fae40332e0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000e83fe46a40, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d5df1ccec8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000fadb385e88, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000e62e5e8940, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000d5de8ca7e8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000c699157f60, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800fc9cc00, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800e64da00, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000fc16242168, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000f276f9acf0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800ed01d78, %r1, %r9
	setx	0xf974df1cbd49a1bf, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f9a6538, %r1, %r9
	setx	0xcbb66dbf089e213e, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c72cbfcdd8, %r1, %r9
	setx	0xbe96739c93d81542, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d0e1e73ae0, %r1, %r9
	setx	0xc2e2aefd64ed7bc0, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ee6817b3a8, %r1, %r9
	setx	0x8df7199ea23ad538, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f609909928, %r1, %r9
	setx	0x7b4bc41f2cb5946d, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e3262b8, %r1, %r9
	setx	0xa939a1c2a1564888, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f8207e0, %r1, %r9
	setx	0xf9ad067047cf39a0, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c1d49e8ff8, %r1, %r9
	setx	0x203cf81298deb2d0, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000da683765a0, %r1, %r9
	setx	0xa10c241f5aca4a1f, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000eab44c6b70, %r1, %r9
	setx	0x0140bed827febde0, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f270596718, %r1, %r9
	setx	0xce93f23d00807621, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e07f9b0, %r1, %r9
	setx	0x6cbcf4795f634933, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800fe5dac0, %r1, %r9
	setx	0xacd2ca1fdfe821d1, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000ce7775cba0, %r1, %r9
	setx	0x90f5678609594eef, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000ddc2fc8b58, %r1, %r9
	setx	0x3228a1192da4fbe8, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e3ba729ec0, %r1, %r9
	setx	0x2fd8af792b114757, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000fc3ab3d580, %r1, %r9
	setx	0xb97817bcf533a596, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e251aa0, %r1, %r9
	setx	0x0be5fab7923bd0dc, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800fb469d8, %r1, %r9
	setx	0x2c7e9e7b0fa05eb7, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000cec22f7a30, %r1, %r9
	setx	0x696f53363da457c8, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d733939358, %r1, %r9
	setx	0xf655921a53487b1e, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e62084d148, %r1, %r9
	setx	0xe6053be537371a00, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f4d6b4f770, %r1, %r9
	setx	0x1555a55533997ca9, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e843bd1248, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000d545cf7e80, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000fccbf87fc8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000e090d8ed68, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d6d63005c0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000cb5f1c1d58, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800ff50ff0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000ded9089740, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000cfd9f5f480, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800feccb18, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800e1f4e48, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000f874f25020, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000e55b482820, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000db397bd7e0, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000e0a11301b8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000d659678848, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000c821db4410, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800fcf4128, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e6c9dc0, %r1, %r9
	setx	0x0dd8566ce031c0f2, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f0a6998, %r1, %r9
	setx	0x10ebe76277e6db41, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c0cc8c1610, %r1, %r9
	setx	0x036844d2eb2026f5, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d9f80cce68, %r1, %r9
	setx	0xa2b751f95af43e15, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000eb29da9ac0, %r1, %r9
	setx	0x98be28fd36c9ac5c, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000fad5f2d5c8, %r1, %r9
	setx	0x0145a84855e7caa1, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e2fb098, %r1, %r9
	setx	0x1277d3bd6010917f, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800ff87c48, %r1, %r9
	setx	0x99123ff49bd91f79, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c4e84b74a0, %r1, %r9
	setx	0x1a7ade10bd38a111, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d9aea40fa0, %r1, %r9
	setx	0x5d98ba446d8c4ecc, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000ee5df79c10, %r1, %r9
	setx	0x5c76be8b7d6c2dea, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f2b80134e8, %r1, %r9
	setx	0xdf549cd7968edb79, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e46a7b0, %r1, %r9
	setx	0x4ac0ad8022e19ff0, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f35ce08, %r1, %r9
	setx	0xa50e4275577706d7, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c5e1e367b8, %r1, %r9
	setx	0x140b64121fda26b5, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d314bb1c48, %r1, %r9
	setx	0x83fc3169f1ef9577, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000eb9665feb8, %r1, %r9
	setx	0x30b833717727c604, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f4581c6130, %r1, %r9
	setx	0x2cf7b00d73b2bd50, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e455de8, %r1, %r9
	setx	0xb57aaef78174dcca, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800fce0b60, %r1, %r9
	setx	0x78931da76adbca86, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c7cc925400, %r1, %r9
	setx	0x8c8c5ecbe2d395e9, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d999e5bfa0, %r1, %r9
	setx	0x1a6ecce5a1583202, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000eeab6e4170, %r1, %r9
	setx	0x05fd2f6eaae4b900, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f4ac811678, %r1, %r9
	setx	0x326d82ebb1de82b2, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d29fdb1298, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000cbe4f13400, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800f0c7e48, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800eab3e70, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800e9fd530, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000fc2a633440, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000eff65865c0, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000da830dfec8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000cdd21417b0, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800f83f148, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800eb8fc30, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000f21895ff58, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000ee1685d288, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000ddeba05800, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000c34683cba0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e501860, %r1, %r9
	setx	0xe2318a15254b39e8, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f6ec948, %r1, %r9
	setx	0xe16b631bb55086c1, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c1ebd1c2c8, %r1, %r9
	setx	0x6bc72adcc9b7678d, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000de41440938, %r1, %r9
	setx	0x695e47e1dc78e8f4, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ef6e7fc400, %r1, %r9
	setx	0x2a49b88dade2c016, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f0218d4c78, %r1, %r9
	setx	0x7923e7246bace3c2, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800ec1ba28, %r1, %r9
	setx	0xa3433cc4f6c87bdc, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f5ef120, %r1, %r9
	setx	0xd970f3ea50d39808, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000ca9b4a9708, %r1, %r9
	setx	0xd402de1133f7159a, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d8f15974b0, %r1, %r9
	setx	0x92aed576bc749de9, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000ed81248db0, %r1, %r9
	setx	0x026b9aba63ef62c0, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000fe0f44e490, %r1, %r9
	setx	0xbf769d44bc3eee8c, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800ec24370, %r1, %r9
	setx	0xe0db7ecb2ba0c709, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f745528, %r1, %r9
	setx	0x0dff867dfd296082, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c57c2c0fe8, %r1, %r9
	setx	0xbc0b011bf4ba83e4, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000de14c48748, %r1, %r9
	setx	0xf293583beed57a80, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000ec0c2b3988, %r1, %r9
	setx	0x5383b28d7a6ffbc1, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000fc9dc00a68, %r1, %r9
	setx	0x4681df46ae93d976, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e39b2c0, %r1, %r9
	setx	0x3b43585ff1845e94, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f7407a0, %r1, %r9
	setx	0x8e28b3b6c126154f, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ca89d3f928, %r1, %r9
	setx	0x3cc8018920103c31, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000daf47daf60, %r1, %r9
	setx	0x7469edf1958240a9, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e7cab90f98, %r1, %r9
	setx	0x32906656e8162171, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f8e81643f0, %r1, %r9
	setx	0x31b962264cf83dd3, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800ed01d78, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000f6634ceb98, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000e01fcd8e38, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000d8b352d448, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000de05bf4298, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000c2e2f68d40, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800f794cd0, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800e0ca208, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000f8c8316e18, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000e57bc0f698, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000cbc70b3d58, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800fcbe0a8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e303da0, %r1, %r9
	setx	0x9346d70096a82c61, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f0cf100, %r1, %r9
	setx	0xe4a1ec041798826d, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c94dcd7388, %r1, %r9
	setx	0x9bb15ce0f18e3b60, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d53a65c7f8, %r1, %r9
	setx	0x8933f14feebf30aa, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000eed5be21c0, %r1, %r9
	setx	0xe411bd92aed7600a, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000fc8d197778, %r1, %r9
	setx	0x1592af320125fe3a, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800ece4d10, %r1, %r9
	setx	0x4ef14d2142ba75a2, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f012610, %r1, %r9
	setx	0x585560ea130fdd21, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000cb7a4b9288, %r1, %r9
	setx	0x75bdb7c23352dcac, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d0f9102898, %r1, %r9
	setx	0xa1b21f272eb34089, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000ebf757ba70, %r1, %r9
	setx	0x1184dcb7ac43435f, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000fc824160e0, %r1, %r9
	setx	0xd62eb9b0f995096a, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e316cb0, %r1, %r9
	setx	0x97fd08d9d3f28dc6, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f017988, %r1, %r9
	setx	0x009e2a793b77849b, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c41bbb84b0, %r1, %r9
	setx	0x6421f68aa26b5c9b, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d662328868, %r1, %r9
	setx	0x5c69982e19b7bd2b, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000ed44c54500, %r1, %r9
	setx	0xa0f8b8e049a38056, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000fc9a87e4d0, %r1, %r9
	setx	0xa1ec296bce564e36, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800ee686f8, %r1, %r9
	setx	0xfed4b9fb5b4e96a2, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800ff07278, %r1, %r9
	setx	0x1e42f9fc033a6a33, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c791472f28, %r1, %r9
	setx	0xba09afb1f0f7af8a, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d20899a328, %r1, %r9
	setx	0x6d0ed8a6f4001f19, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ead7d70648, %r1, %r9
	setx	0x4e8bc7794bde3faf, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f496dc0b40, %r1, %r9
	setx	0xb6dae96b9e60039a, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000fad8417ed8, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000c68b40a998, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800ff59b70, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e064090, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800fb50948, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800e7c97e8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000f4936a1ad8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000c37f469098, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800fb1b510, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e3e9ac0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e65e3f8, %r1, %r9
	setx	0xdf80ea1e7f69b27c, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800fa8d978, %r1, %r9
	setx	0xc62e80ce9a0812c6, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c3480b23a8, %r1, %r9
	setx	0xa30b5d1130854914, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ddf0535e80, %r1, %r9
	setx	0xccad27daee44b23b, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ec00eff208, %r1, %r9
	setx	0x16881fb8e86fb0e5, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f816914c00, %r1, %r9
	setx	0x7994a87433603c32, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e37a350, %r1, %r9
	setx	0xa67059c275f042ed, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f51cdc0, %r1, %r9
	setx	0xb3918d4cb2bd84e5, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c546ef6ba0, %r1, %r9
	setx	0x9b7c50941d715bc8, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d7f17cb200, %r1, %r9
	setx	0x5758f004cb5060ba, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000eb5ff592f0, %r1, %r9
	setx	0x4a491a88ef420741, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000fa868d52b0, %r1, %r9
	setx	0xdf613fe47659a05b, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e5d74f8, %r1, %r9
	setx	0x0e016081c548c7a5, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800fb7c5e8, %r1, %r9
	setx	0xd65fa1c1911e4560, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000cf7f3deec0, %r1, %r9
	setx	0xe805208234879e33, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000dbe3afce78, %r1, %r9
	setx	0xfc941c059ba6aa3d, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000ec81748ce8, %r1, %r9
	setx	0x8de75ab46c80f308, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f033656c50, %r1, %r9
	setx	0x58364225545d7bbd, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e60d468, %r1, %r9
	setx	0xc3d4814cdad547c6, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800ffd3478, %r1, %r9
	setx	0x46da69fe5e0a0bec, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c6691c5908, %r1, %r9
	setx	0x5b61d71f2555c209, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000dcabffc5d0, %r1, %r9
	setx	0x5ef562fc8abc7101, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e864a28bc8, %r1, %r9
	setx	0x50292722f16beffc, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000fc7477a0e8, %r1, %r9
	setx	0x1e2f16e58b41d896, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e41866ef20, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000e94374f780, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000dfbcea0ce0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000cfd9f5f480, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800feccb18, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800ee1d930, %r1, %r9
	setx	0x7bab63dbf1361c26, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f25e998, %r1, %r9
	setx	0xed5f92113e68f84a, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c0fbe13900, %r1, %r9
	setx	0xabf2da18a3d3127f, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ddeab19010, %r1, %r9
	setx	0x0853dc27bae37793, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000eaaf936610, %r1, %r9
	setx	0xe56cd8aae47032ee, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f8df24eee0, %r1, %r9
	setx	0xdfc926a99a60eed9, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e305930, %r1, %r9
	setx	0xff510bdccd555884, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f0cd450, %r1, %r9
	setx	0x82d7fcc92246bda9, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000cfde27cf38, %r1, %r9
	setx	0x82789bb7e3a59b3d, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d7a06fc860, %r1, %r9
	setx	0xa1853cdf41c6abb5, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000ee8a7e9108, %r1, %r9
	setx	0x26fd597a03545071, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f02d8f6a48, %r1, %r9
	setx	0x592a37485214e28f, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e7a4b30, %r1, %r9
	setx	0x43120405479388ce, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f078290, %r1, %r9
	setx	0xbce3e059312e9f0e, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c8fef9ad20, %r1, %r9
	setx	0x4f254baa1f6d9707, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d3252009f0, %r1, %r9
	setx	0xd0a84641763de569, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e1ffa42380, %r1, %r9
	setx	0xae40bf4926e366e5, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f8d23612d8, %r1, %r9
	setx	0x81bb807b0b9601bf, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800efa5c78, %r1, %r9
	setx	0xc255bd1662e18d9c, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f5e1420, %r1, %r9
	setx	0x4e7b2c9c9800e928, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000cd60217db8, %r1, %r9
	setx	0x6c4d844ecb51473c, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000dfd895d2d0, %r1, %r9
	setx	0x82ea9d00b4d9e60c, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e0f8990050, %r1, %r9
	setx	0x1ea5d22525c2c76d, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f68a013d30, %r1, %r9
	setx	0xc656820819b10a92, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c3480b23a8, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800fa8d978, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800e65e3f8, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000fc8d197778, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000eed5be21c0, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000d5df1ccec8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e5a8730, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000fe173afc98, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000eca588db50, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000d1b208d9a0, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000cda679a678, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800e3395f8, %r1, %r9
	setx	0x7886f3ca609b57a1, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800fa4a858, %r1, %r9
	setx	0x47629220517614ce, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ceff63d870, %r1, %r9
	setx	0xa129d2bc0b0ae7ff, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d819ef8a98, %r1, %r9
	setx	0xadce5ca3cc4f3c76, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e2accabda0, %r1, %r9
	setx	0x03686a02bb98082e, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f8cdcc32d8, %r1, %r9
	setx	0xb6ff68e981e45f8e, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e950218, %r1, %r9
	setx	0x6033e04ae74fac0f, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f97e688, %r1, %r9
	setx	0x851bdc5d7f0f52eb, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c3a2c8b7d8, %r1, %r9
	setx	0x847b799a29eddd6c, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000dccdbcd348, %r1, %r9
	setx	0xe9e07a554cb070cd, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e2633b92f0, %r1, %r9
	setx	0xdb736391d5f05f63, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f405e4e700, %r1, %r9
	setx	0xc173f3f489862c70, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e0518f8, %r1, %r9
	setx	0x16ab0cd2cf038f44, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f377968, %r1, %r9
	setx	0xec4215269d497625, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000cbe02d7a78, %r1, %r9
	setx	0x77126a086ea392cd, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d67b007be0, %r1, %r9
	setx	0x33b2b802c99c2553, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e1dcfe93f0, %r1, %r9
	setx	0x6c7e9f17c931dbb4, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f032ce4268, %r1, %r9
	setx	0x8a141673791f3edc, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800ed9c4a0, %r1, %r9
	setx	0xe164dad7c1276078, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f1a33b0, %r1, %r9
	setx	0x1cdfb5d5b3ed5ec8, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c1bf877ff8, %r1, %r9
	setx	0x89c078becdb4cb2d, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000dbd08e5a68, %r1, %r9
	setx	0x21dd9697e525cb3b, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ea68525978, %r1, %r9
	setx	0xfee501f1efdd4d1e, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f691e18020, %r1, %r9
	setx	0x839c88ee6e6e718a, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000db0b5fcbc8, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000c6363bf740, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800f206f88, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800ebaea48, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000f81e89cbc8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000ed9d7cdae0, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000dca89ca470, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000ce7d7e9338, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800f0bc478, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800e6ec540, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000f07a09bc38, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800fb469d8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e251aa0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000f21895ff58, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e727ec8, %r1, %r9
	setx	0xe5243e7238ccabf1, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f4c41b0, %r1, %r9
	setx	0x665da0aeb3b1464d, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c89749eb50, %r1, %r9
	setx	0xb27697e1cd4830cc, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000da3925a7c0, %r1, %r9
	setx	0xc984e49b9c824fa4, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ef65a0aa08, %r1, %r9
	setx	0x33496f2f488a41c7, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000fe64141768, %r1, %r9
	setx	0x084705a18e1f74cf, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e58a430, %r1, %r9
	setx	0x8e0985eb39b9fab5, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f9aa860, %r1, %r9
	setx	0x63762dd87e7211e2, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c6952b3e10, %r1, %r9
	setx	0x713af9013d47bed6, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000dc4d9a6458, %r1, %r9
	setx	0x7e84bb23832a6a04, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000ec3f5343a8, %r1, %r9
	setx	0x84dc6e8bd00748f2, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f258c80368, %r1, %r9
	setx	0x59a23a67f533e13b, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800ea5db28, %r1, %r9
	setx	0x8e9e1d4bf0f856f7, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800ff0e420, %r1, %r9
	setx	0xfc8c726cb59d27d4, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c45bb48a50, %r1, %r9
	setx	0xe9b48a7642c2fb32, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000dde635c890, %r1, %r9
	setx	0x4c193a328990f29d, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e3a0ecc170, %r1, %r9
	setx	0x5ab10d3dc76be55a, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f8bb1ac188, %r1, %r9
	setx	0x765fc7a14b20c271, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e83b7f8, %r1, %r9
	setx	0x6c592fcee6e26895, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800fc06a38, %r1, %r9
	setx	0xb105001ec8c2f483, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ca43712328, %r1, %r9
	setx	0xe73e6831fc926f91, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d96628fa70, %r1, %r9
	setx	0x165cc7f4114e2ddf, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e6d30d8308, %r1, %r9
	setx	0x6d6d308fd0cdd8ac, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f889bd5f90, %r1, %r9
	setx	0xbe0ab5da3ad227ad, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f49bbf0, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000e497227060, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d4b65898a8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000c0ca98bba0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800f0c40d8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000dbbf8a2120, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000c141350988, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800ffb1570, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800e35e430, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000ce0a68c2e0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800fe5fb58, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e5be5a0, %r1, %r9
	setx	0x4eaa2bb2e4f3efc8, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f87e360, %r1, %r9
	setx	0x044386a207ed3988, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000cebb74def8, %r1, %r9
	setx	0xd9cf224b251dabe4, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d0f2e51468, %r1, %r9
	setx	0x3986db8f89022d45, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e1e9537f18, %r1, %r9
	setx	0xe5da25f2011ad552, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f01671b218, %r1, %r9
	setx	0xd645476e188180fb, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e7d36f8, %r1, %r9
	setx	0xce351bac6754f613, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800fab4dd0, %r1, %r9
	setx	0xc59f85adfdb87d79, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c4d1058c90, %r1, %r9
	setx	0x7e76db64c67689e7, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d1e92a5120, %r1, %r9
	setx	0xb58fd24658cf7048, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e6fe65f200, %r1, %r9
	setx	0x9d8263a0fcd2e498, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000fa1fc35940, %r1, %r9
	setx	0x2e9db065d3be2ff1, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800eb69968, %r1, %r9
	setx	0x255e6e37b74c7c59, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f9d7bd0, %r1, %r9
	setx	0xc2edfe7301323ea0, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000cd9e95f668, %r1, %r9
	setx	0x9a6cba9859cab5f3, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d81a0f64a0, %r1, %r9
	setx	0x715e673b56510ffd, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000ed0269ade8, %r1, %r9
	setx	0xd8f79043d176c6ca, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000fe16027d30, %r1, %r9
	setx	0x67666598681cfe39, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800eefc038, %r1, %r9
	setx	0x18ae0e8175aa09a2, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f161e78, %r1, %r9
	setx	0x4214eb96c17dfe19, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c2fd0a2d10, %r1, %r9
	setx	0xb6bfe4a2b5593f30, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d0cb0be0b0, %r1, %r9
	setx	0x74d74d59277bdddf, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e9ad413b80, %r1, %r9
	setx	0x88f0802c223b6203, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f8a663a418, %r1, %r9
	setx	0x5c021e80977fdd69, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e346f8def8, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000de704fb540, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000c7c8c07c98, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000c7ff858180, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800f99d078, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e1b38e0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000f4acac6d10, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000ec2a816e28, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d13168f100, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000c7c4af1208, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800f9d5b00, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800e904e18, %r1, %r9
	setx	0x1cf77effad4b5038, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f989268, %r1, %r9
	setx	0x1a8c1f57d6474cd0, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000cb4bcc9740, %r1, %r9
	setx	0x909f2c151a410026, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d2125e84a8, %r1, %r9
	setx	0xf5e1fe93572c4dcc, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ef74be3498, %r1, %r9
	setx	0xe0889ce00ff6482c, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f4a6b38928, %r1, %r9
	setx	0xbf4b80a368c4b067, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800ec15f90, %r1, %r9
	setx	0x74c23b5e6c79ec20, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f1f04f0, %r1, %r9
	setx	0x2e4f7487b73923f9, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000ce4ba61300, %r1, %r9
	setx	0xd1b5ba4006b34943, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000dc8b01f2e8, %r1, %r9
	setx	0x3f1790c086990a7c, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e72df01cd8, %r1, %r9
	setx	0x7d56d04300a7453d, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f4abb66030, %r1, %r9
	setx	0x35806b4ca9cca3a8, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800edcfaf8, %r1, %r9
	setx	0x90df6b8943ff1c41, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f4f85b0, %r1, %r9
	setx	0x17d73689c69c3b44, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c4b4459918, %r1, %r9
	setx	0xc52d374acfd7fa69, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d85e819d00, %r1, %r9
	setx	0x45113775047c2489, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000ea8bab78f0, %r1, %r9
	setx	0x649a225c1fa861d3, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000fc97c951d0, %r1, %r9
	setx	0xa41ceea8d6c47327, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800eeed850, %r1, %r9
	setx	0x8a8e2431d52e0df6, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800fd0a210, %r1, %r9
	setx	0x3a3b8a1d343ff23a, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c661ebd620, %r1, %r9
	setx	0xa3f1f8a2cd229156, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d2c29cc7a0, %r1, %r9
	setx	0xe2547dad6bd2ed4b, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ebd775b4b8, %r1, %r9
	setx	0xe859e183f4f4bdb0, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f84a912450, %r1, %r9
	setx	0xd4c45b67a70245d8, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e1eb76c9e0, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000cd09eb1470, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800f2dd0d8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e424970, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000feb9321a98, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000ea7a30d408, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d99b494430, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000f03b04f348, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000e38d284410, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800e0d8f00, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000fa4d972098, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800ed560a0, %r1, %r9
	setx	0x7967049652983fa9, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f623798, %r1, %r9
	setx	0x47fe34dbbceac0be, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c31944db48, %r1, %r9
	setx	0x0504665985218265, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d1f5f71170, %r1, %r9
	setx	0x9c5afb276a2f43e2, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e967fdcd20, %r1, %r9
	setx	0xe5b9ce5bf9901cef, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000fed7578db8, %r1, %r9
	setx	0x4830403d5cf4a25d, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e177500, %r1, %r9
	setx	0xda361dd15293c156, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f5e9840, %r1, %r9
	setx	0xdcf4941dfafdb6f9, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000ce0cd733f8, %r1, %r9
	setx	0xc4118b80905c4617, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d88438b4f8, %r1, %r9
	setx	0x3d74d7ac965bf501, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000efe7cccb70, %r1, %r9
	setx	0xb3e83fc48670c9e7, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f47ee78520, %r1, %r9
	setx	0x01a6e9bb428dfed3, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800ea0d268, %r1, %r9
	setx	0x6ffc5424cad923cf, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f501e98, %r1, %r9
	setx	0x2d34876a80f9b23e, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c10ae56d68, %r1, %r9
	setx	0xc84666e3f9750831, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000dde66b31e0, %r1, %r9
	setx	0xf1de2bf1bc816861, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000ea13a5e0c8, %r1, %r9
	setx	0xb0e2721691f25021, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000fefd512ad0, %r1, %r9
	setx	0xc82951fd6f5c7b25, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e555bd8, %r1, %r9
	setx	0xf573f1d73b149288, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f389e88, %r1, %r9
	setx	0xfa107c29189ac705, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c75e0af8f8, %r1, %r9
	setx	0x779cbcf7a30f2f65, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000dc14f8fbc0, %r1, %r9
	setx	0x44234d180e71c073, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e0ba480230, %r1, %r9
	setx	0x0038adb725092d75, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000fe0ce311b8, %r1, %r9
	setx	0x747220e6801bb815, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f44487b818, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000e346f8def8, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000de704fb540, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800effa1f0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000fa5b4666a8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000e7b9dd2520, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000da8f9da0a0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000fc9dc00a68, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000ec0c2b3988, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000de14c48748, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000ed56025998, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000d8334bf208, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000ce11250528, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800f3dd3b8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e63f380, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000f6aa85b990, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e1644a0, %r1, %r9
	setx	0x30881399aa410856, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f780f30, %r1, %r9
	setx	0x71ecc724143a9d3b, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000cd8aeee5d0, %r1, %r9
	setx	0x2f0f1ef104fcb569, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d616699da0, %r1, %r9
	setx	0x44f54b73e2bd9fca, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e438cc47e8, %r1, %r9
	setx	0x93398d8d60fb51c8, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f2efb21838, %r1, %r9
	setx	0x4ca3d7b5bc0e2517, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e88b4a8, %r1, %r9
	setx	0x9b76de55bd993ab4, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f380268, %r1, %r9
	setx	0x55d373ec0afe31e3, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c7f998bc60, %r1, %r9
	setx	0x7b3185ff9193a3fc, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000dd260a6128, %r1, %r9
	setx	0xd35fdaae138037c3, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e403759180, %r1, %r9
	setx	0xc0622400486ac8af, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f60438b1e8, %r1, %r9
	setx	0xc8281937ce6c5bcf, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800eee06d0, %r1, %r9
	setx	0x8d0a59aae6eb4cdf, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800fc0ac88, %r1, %r9
	setx	0x773a32fb4bc59a5f, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c1e250fa58, %r1, %r9
	setx	0x7a5a34e3064acf35, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d7e07eaad8, %r1, %r9
	setx	0x01cc7829fd52434b, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000ebedc98e48, %r1, %r9
	setx	0xcdb605ae7d7db172, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f00a0cb728, %r1, %r9
	setx	0xa2a3b053cc3a99c7, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e747f60, %r1, %r9
	setx	0xf736c6b96a34f3f4, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f847610, %r1, %r9
	setx	0xa321d4103042e9eb, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000cf48e7dc88, %r1, %r9
	setx	0x53558f97658dd633, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d8192fd268, %r1, %r9
	setx	0x4df66e237d1c3133, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000eebcfd18b0, %r1, %r9
	setx	0x5095efc74ccab6f7, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000fcd9e86248, %r1, %r9
	setx	0xf433755e689938ab, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d0dfe66ff8, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000c168676610, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800fca5530, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800e4d20b8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000febea67848, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000e1e1871c98, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d5cb8868e8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000cb97da1030, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800fcbf290, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e72ea40, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000ddc2fc8b58, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800e63f380, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e15f2c8, %r1, %r9
	setx	0x5b1c71c11afd4b53, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f787e00, %r1, %r9
	setx	0x7a8c3881c91299a7, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c484c3cb68, %r1, %r9
	setx	0xe7274455d8957ad3, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000de0406b608, %r1, %r9
	setx	0xe405bbd19c1814a8, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000eb13eef608, %r1, %r9
	setx	0x80ffae61c875863a, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000fa93dc3968, %r1, %r9
	setx	0x84ce57d44580335c, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e463ca8, %r1, %r9
	setx	0xc2b1666a2fa4bb5b, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f8ce278, %r1, %r9
	setx	0xd76987c65e9f88ca, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000cdd39e1eb0, %r1, %r9
	setx	0x3fc0dc735f49e8c8, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d4bbb5e3b8, %r1, %r9
	setx	0x9c7942a80cad4014, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e82b5f3df8, %r1, %r9
	setx	0x808f73d0844ea84e, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f4645c0d28, %r1, %r9
	setx	0x50a8de04ddf7496a, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e5b0d48, %r1, %r9
	setx	0xba92a76b6c908fef, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f2d7828, %r1, %r9
	setx	0x600095b09d64e1c1, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000cfb5c9c508, %r1, %r9
	setx	0x0cde8e1503022d09, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000dd8b687e80, %r1, %r9
	setx	0x190176aefd10c226, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e990c1ef78, %r1, %r9
	setx	0xe5660649fdaf34fd, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f2098dbbc8, %r1, %r9
	setx	0x2a447a47f5796d28, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e1e5d58, %r1, %r9
	setx	0xcd0f66c8bd3e84a7, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800fce62d8, %r1, %r9
	setx	0xad64174686d63a8f, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c4f7c4b1b8, %r1, %r9
	setx	0xd21ed3395982d6bf, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d8136be4e0, %r1, %r9
	setx	0x612d40951b46a24b, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ecb9193ff8, %r1, %r9
	setx	0x81f394cece5029e8, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f872abb418, %r1, %r9
	setx	0x6480407706dfef13, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000efaf3cbf38, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000d68fa8aed8, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000c11fa14e80, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800f056ec0, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800ec28480, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000f204331510, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000c3a2c8b7d8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800f97e688, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e950218, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000f02d8f6a48, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000db948c6800, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000c3fd94b230, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800f0e8b10, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e4e6fe8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000fa6ab0b798, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000eb05e998a8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e0f8cb0, %r1, %r9
	setx	0x3f5e130b8847f816, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f481f48, %r1, %r9
	setx	0xef94b062582ff0fd, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c4c5d23c20, %r1, %r9
	setx	0xeb858f2e3a81cf47, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d5b6d59a38, %r1, %r9
	setx	0xafa52daca5565718, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e243aa5410, %r1, %r9
	setx	0xd7359b4fb2a4ef14, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f41f09efe8, %r1, %r9
	setx	0x644a24860285513a, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e4055d8, %r1, %r9
	setx	0x2cb8fad09dd5fe78, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800ffc3308, %r1, %r9
	setx	0xc12aa9dc70b75a31, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c2b6a19650, %r1, %r9
	setx	0x95729691719cdb8d, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000dbdd1cdb00, %r1, %r9
	setx	0xae7ff71eb8808e46, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000eb18f66680, %r1, %r9
	setx	0x66aac1a2967ea81d, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000fe36249d30, %r1, %r9
	setx	0x791919a88a09aac4, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800ef59c20, %r1, %r9
	setx	0xaa116e132350b7ae, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f9a3a50, %r1, %r9
	setx	0x918eb63a56f2b5b9, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000cceb40b9d8, %r1, %r9
	setx	0xf42abf021f18458f, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d3a1ce5028, %r1, %r9
	setx	0x1b5b92b3011e49c6, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000ee750a3c78, %r1, %r9
	setx	0xb5df5a7f1ef9b87b, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f00398bbd0, %r1, %r9
	setx	0x7a4529ddf4e5d862, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e9e17c0, %r1, %r9
	setx	0x90601ed52ae32564, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f289138, %r1, %r9
	setx	0x54ff89f49822f606, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c1a9dccb80, %r1, %r9
	setx	0xec02750c0eb6f021, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000de250e7588, %r1, %r9
	setx	0x3a6b58cb2876715e, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ec7e605de0, %r1, %r9
	setx	0xbfc6e6ba04b265c0, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000faf6378f30, %r1, %r9
	setx	0xbe98451befd8c087, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f690fc5d20, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000ed79cf4998, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000daec653be8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000c600ce9800, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800fd46828, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e8587a8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000fa0422d830, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000dca89ca470, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000ce7d7e9338, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800f0bc478, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000ec80181f20, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000d9d58d1640, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000c9330da620, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800ffced18, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800ea22e58, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e8807f8, %r1, %r9
	setx	0x7ef2a05ab4cede61, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f154270, %r1, %r9
	setx	0xbc8cb902abd38c26, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c1c5328b58, %r1, %r9
	setx	0x9c77a97ea515b8d7, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d9bed19770, %r1, %r9
	setx	0xf413db412d39cdac, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e0be8607e8, %r1, %r9
	setx	0xfc0104ab8d6e3342, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000fab3a4bb78, %r1, %r9
	setx	0x04114592ade79706, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e607970, %r1, %r9
	setx	0x5b0c59b0374fc407, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800fd875c0, %r1, %r9
	setx	0x1111f20adc137eb4, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000cc3b4d96e8, %r1, %r9
	setx	0x8db7ea0fce345d4f, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000de886f30e8, %r1, %r9
	setx	0xf2f81738431b2b74, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000eda8f76578, %r1, %r9
	setx	0x8203413ae8c2497b, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f8d760a1c0, %r1, %r9
	setx	0x84caba34d219b597, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e641f48, %r1, %r9
	setx	0x490bc613b3de0d01, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f571a98, %r1, %r9
	setx	0x2327e81be73b1a78, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c2a6bbf468, %r1, %r9
	setx	0x896eeff76ea8e7d6, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d1d6122488, %r1, %r9
	setx	0x64269847c10315de, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000eb861e8230, %r1, %r9
	setx	0xb51684646559aa24, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000fe02553f48, %r1, %r9
	setx	0x72ec95c051c5b72d, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e49a6b8, %r1, %r9
	setx	0xbe823118ab305eb9, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800fc618b8, %r1, %r9
	setx	0xd8b731f8a2c30855, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ca26776d38, %r1, %r9
	setx	0x4cfc3cdff6d51556, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d31420dda8, %r1, %r9
	setx	0x491ecda7f29df660, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e3c60592b0, %r1, %r9
	setx	0x24892e70505b01cd, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f6cb8965c0, %r1, %r9
	setx	0x9dabaf575192f932, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ccd35f8a50, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800f8900e8, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800ebe1208, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000f0764054d0, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000eb5ff592f0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d7f17cb200, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000c546ef6ba0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800f51cdc0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e37a350, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000fc824160e0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000ebf757ba70, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000cf940b86f0, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800f420668, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800f201660, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800ea17340, %r1, %r9
	setx	0x82c55b7f69fe586f, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800febb850, %r1, %r9
	setx	0x7ef1c9e4d56c3f4a, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000cbe6a76dd0, %r1, %r9
	setx	0x82265d7ecaf00a28, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d6b2116f98, %r1, %r9
	setx	0x23f366964b6f8439, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ef10f94030, %r1, %r9
	setx	0x81ac2f82f7d33f01, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f85893c240, %r1, %r9
	setx	0x25c7f79aae0cd9d2, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800ee6f160, %r1, %r9
	setx	0xd60166d9f65e354a, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f421618, %r1, %r9
	setx	0xf0c4988ae54f7ae3, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c9da2bfa78, %r1, %r9
	setx	0x94cabfcbbdcdf7fd, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000dca9653060, %r1, %r9
	setx	0x28c970bc23553031, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000eed0823dd8, %r1, %r9
	setx	0x2a7de9a1fbd7f3ed, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f803f3eb20, %r1, %r9
	setx	0xe910fecf7e78fbf6, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e31c1e0, %r1, %r9
	setx	0x074ecc9206ddb66e, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f3d6ce8, %r1, %r9
	setx	0xcfb3b6eafa4a6a7e, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c217f6af70, %r1, %r9
	setx	0x557c29fb8e151222, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d94274aa48, %r1, %r9
	setx	0xa77b55f1e1c38058, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000ec755535f8, %r1, %r9
	setx	0xdf3b6937217a4279, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000fc632df368, %r1, %r9
	setx	0x45b82a46b94c5267, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800eb5d1f8, %r1, %r9
	setx	0x80c9c92e4506bc5d, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f650300, %r1, %r9
	setx	0x350c064643fdd0a2, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c7097b7fd8, %r1, %r9
	setx	0xa428bcc4bf523220, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000dbe794d558, %r1, %r9
	setx	0x5d55057d3f4a41fb, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e05356c6f0, %r1, %r9
	setx	0x3fc926d3e1db8e70, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f6c248c520, %r1, %r9
	setx	0xd27a84dd99954241, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f01671b218, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000e1e9537f18, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000d0f2e51468, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000cebb74def8, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800f87e360, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800e07cc50, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000c10ae56d68, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800f501e98, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800ea0d268, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000fc97c951d0, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000ea8bab78f0, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000d85e819d00, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000e82c8c4598, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000db73a5d6b0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000c4bdad9458, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800f201660, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800ef85ad0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e785da0, %r1, %r9
	setx	0xd9b84db6a2868298, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f30b148, %r1, %r9
	setx	0xfacb198864e1eee9, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000caf8839be8, %r1, %r9
	setx	0x49a57a426837931a, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000dfd603dfc8, %r1, %r9
	setx	0x9d0ef4a2b082597d, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e81bebe978, %r1, %r9
	setx	0x2586d93dd9b9a269, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000fe47e8ca30, %r1, %r9
	setx	0x4e7e1ae01daff856, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e5ef1f8, %r1, %r9
	setx	0x244a9695e9290a65, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800ffdf060, %r1, %r9
	setx	0xaef5e47f5ff164ec, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000cb1a0f0ac8, %r1, %r9
	setx	0xebc55c8f8741a6eb, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d7c98419d0, %r1, %r9
	setx	0x0ade3d6ca45c04ba, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000ecbbde2808, %r1, %r9
	setx	0x756948f0b93d9f87, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f0a5b258c0, %r1, %r9
	setx	0x9337bbec4a0bb69b, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e5ae188, %r1, %r9
	setx	0x0ce1d648c0a40a17, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f05df00, %r1, %r9
	setx	0x910b7fdad84c2c59, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c7fb0ba2d8, %r1, %r9
	setx	0x78a52b6610fb3422, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000dad84d1b60, %r1, %r9
	setx	0xda62ff6fb1af6a61, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e9b07c2608, %r1, %r9
	setx	0x86b50b07ae67466e, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f6b5de44d8, %r1, %r9
	setx	0x73e52784124e6bad, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e1969e0, %r1, %r9
	setx	0x6ecc3ca36b68abaf, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f7ddf40, %r1, %r9
	setx	0xc5c170891488a11d, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c1470c58b8, %r1, %r9
	setx	0x6c4a188f1f3d5636, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000dc57f2fe80, %r1, %r9
	setx	0x38bd0613f2978231, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e2f039e8a0, %r1, %r9
	setx	0xac6b3db9ba6a0c86, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f87dff9948, %r1, %r9
	setx	0xe78a844ec84593b3, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800e4e57b8, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000faea3e6970, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000e1eb76c9e0, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000dd43de7490, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000e7d7697f40, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d362816360, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000cf940b86f0, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800e47d580, %r1, %r9
	setx	0xc34f322a70480494, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f278df8, %r1, %r9
	setx	0x5c35b34801cb91f2, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c261d48ef8, %r1, %r9
	setx	0xf57fb7331b65b898, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d3eeff26b8, %r1, %r9
	setx	0xf81c1e1947d6a64f, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e0f95677d0, %r1, %r9
	setx	0x0cbab6eb43271096, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000fc61618240, %r1, %r9
	setx	0x0b9a66e20cdeb0e7, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800ececc50, %r1, %r9
	setx	0x98ef0d46b7953d61, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800fc97440, %r1, %r9
	setx	0x2b3225c4e6de116a, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c8ac590ca8, %r1, %r9
	setx	0xa52784eee35050c5, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d1d8ab9058, %r1, %r9
	setx	0x39aecacc59cbdd72, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000ebf0776310, %r1, %r9
	setx	0x35b8f27a4c22900a, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f4b3645120, %r1, %r9
	setx	0xc7606960e1223bd6, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e6fd388, %r1, %r9
	setx	0x5d97a7242e4f2eac, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800ff05a18, %r1, %r9
	setx	0xbb62e68bc189c33b, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c620bc4630, %r1, %r9
	setx	0xb9e1441a4a8b1b5f, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d8a83e4c60, %r1, %r9
	setx	0x1371cd4d69f8adb9, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e903ce5320, %r1, %r9
	setx	0xd3b2f425432df03a, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f6bac4d878, %r1, %r9
	setx	0x12c0d652a0fedc0c, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e356170, %r1, %r9
	setx	0x9a721803082f8438, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f78cbf0, %r1, %r9
	setx	0xf9c3bd20e8d498c9, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000cd5ccad9a8, %r1, %r9
	setx	0xbcfa7814695e4df1, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000da85549dd8, %r1, %r9
	setx	0x5e6b1af9c79d3c06, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ea079af030, %r1, %r9
	setx	0x636cba55304a704b, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f05338b788, %r1, %r9
	setx	0x8acaa8bbb891f10c, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c0fbe13900, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000c565c7f7a0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800f524808, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800fb6ff10, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800e184790, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000f4e2d46d50, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000e0016ffeb8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000d362816360, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000cf940b86f0, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800f420668, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000c63c2d0d18, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800face458, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e894110, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000fa977dc790, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000e42b1d68e0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000d81ad65880, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000c007a32028, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e1bf0c0, %r1, %r9
	setx	0xc037da67316d1ada, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f651970, %r1, %r9
	setx	0xaed51cf03da22b0d, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c4d9c5b758, %r1, %r9
	setx	0xf38fdd38690c206c, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d4838a95c0, %r1, %r9
	setx	0xd37e0eb9208c952c, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e5b04dea18, %r1, %r9
	setx	0x6a8178e7cee28b24, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000fc537ca590, %r1, %r9
	setx	0x99bdd0d8cd1dfae0, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800ec3d710, %r1, %r9
	setx	0xcb525614fb5bdb7d, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800fb5f830, %r1, %r9
	setx	0x24c58d8442474ecd, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c7aa7357d0, %r1, %r9
	setx	0x31e39f88694c6861, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d73fac8830, %r1, %r9
	setx	0xed18b98b01549628, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e312bf18a8, %r1, %r9
	setx	0x2929906735edc2d0, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f4d73fb6f0, %r1, %r9
	setx	0xa6f3cf16f8d33fec, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e0b0800, %r1, %r9
	setx	0x2fc6b6ae22014f4c, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800fcefd28, %r1, %r9
	setx	0x4a407507f3fa1032, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c0f8aa8c98, %r1, %r9
	setx	0x3bde2d4bef82d966, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000db71478838, %r1, %r9
	setx	0x6562ec0dd3309c57, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e6b4f946e0, %r1, %r9
	setx	0x6cc770dc08eefdbf, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f8c2f2ec10, %r1, %r9
	setx	0xf5d1c905c3c9f50a, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e90f990, %r1, %r9
	setx	0xb97fc80a6c8d7e7f, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800fa096d8, %r1, %r9
	setx	0x28fe8940460b82da, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c2ac2f3af8, %r1, %r9
	setx	0x096367b19a5a6b1b, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d3af424190, %r1, %r9
	setx	0x9c37e27004495c66, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ed66778ef0, %r1, %r9
	setx	0xb48e53f77531b97c, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000fa7e422290, %r1, %r9
	setx	0x449f16b312d7027e, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d68fa8aed8, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000c11fa14e80, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800f056ec0, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800ec28480, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000f204331510, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000ef217bf668, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000df571ddeb8, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800e1b38e0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000f4acac6d10, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000ec2a816e28, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d13168f100, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000c7c4af1208, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800f997490, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e4d20b8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000f07a09bc38, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000e8508f1550, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000d71ad9def8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000caa2a3d7b8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800fc51758, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800ecc5118, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000cbc70b3d58, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800fcbe0a8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e64abe0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000f4ab12fa48, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000ee9ad3aed8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800eccc840, %r1, %r9
	setx	0x9222b9145f8066c5, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f153de0, %r1, %r9
	setx	0xa3f9cb8092948cff, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ccdd1ec9e8, %r1, %r9
	setx	0xcafbfa72b15cbb16, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d3d3cf7048, %r1, %r9
	setx	0x1a28fe770672abdd, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000eff39947e0, %r1, %r9
	setx	0xc7f513ceffca17a0, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f8f508d0e8, %r1, %r9
	setx	0xd618309a05b82e6f, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800ec1fa20, %r1, %r9
	setx	0xd8141158b69301cf, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800fb2bb30, %r1, %r9
	setx	0x0fe893bdcf52a9dd, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c1fe5e35b8, %r1, %r9
	setx	0x2803656b977773de, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d71adf58b0, %r1, %r9
	setx	0xbb9314a860145917, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e39c88e898, %r1, %r9
	setx	0x2d39c68aef83b476, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f62e4c44d0, %r1, %r9
	setx	0x71d37639b69acd16, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800eb467a0, %r1, %r9
	setx	0x63bc188e19651251, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800fbe4f98, %r1, %r9
	setx	0x45b25cfcbeb73d82, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c22e3cc790, %r1, %r9
	setx	0x266f03164eeb8536, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000de4cb4e418, %r1, %r9
	setx	0x5eba6726ce726360, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e9b05ba518, %r1, %r9
	setx	0x49832acfaa4936bb, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f45f1f3aa8, %r1, %r9
	setx	0x1e255da252716476, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e02dbf8, %r1, %r9
	setx	0x69c687f261588b68, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f5f24c8, %r1, %r9
	setx	0xf0b7498393914a73, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c000358580, %r1, %r9
	setx	0xb92f373dc04d20be, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d28100ab98, %r1, %r9
	setx	0x03e1a16aa315f56f, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e88202ca50, %r1, %r9
	setx	0x98d5e708bf770dd2, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000fcf1ac8538, %r1, %r9
	setx	0x79f0c7b2ba2c44c3, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000eb29da9ac0, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000d9f80cce68, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000c0cc8c1610, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800f0a6998, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000dbbb1d14d8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000c6b50c94d8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800f3ac0e0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800f9a3a50, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800ef59c20, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000f2098dbbc8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000e990c1ef78, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800e4e6fe8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000fa6ab0b798, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000eb05e998a8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800ed80fc0, %r1, %r9
	setx	0xa5b86cab0cf9f50c, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f6d1ca0, %r1, %r9
	setx	0xd79e1a9857292ead, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c2f233c350, %r1, %r9
	setx	0xb3b963194610d82d, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d3f410b068, %r1, %r9
	setx	0x894953be0636d804, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e479f80618, %r1, %r9
	setx	0x916f67a0cb280935, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f0aff18320, %r1, %r9
	setx	0x3fe7cb7ac1a0d827, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e36bfc0, %r1, %r9
	setx	0x4c12974ea150c7e8, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800ff94358, %r1, %r9
	setx	0xe8ed4b307feb6245, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c245124ce0, %r1, %r9
	setx	0xf7cd7c998352edec, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d5ba9fd3b8, %r1, %r9
	setx	0x24cc4b26c74e1153, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e7e871bdd0, %r1, %r9
	setx	0x0d481b127dc65c04, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f4ce11bf00, %r1, %r9
	setx	0x69798508d3b7b92c, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e5ac558, %r1, %r9
	setx	0x34df434d4166e431, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800fe5a9b0, %r1, %r9
	setx	0xfba34059bb9ca58c, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000cb49a44928, %r1, %r9
	setx	0x6cd8c7c0ab61179b, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000db4663f708, %r1, %r9
	setx	0x1d1e857bdb067eb6, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e6308b1728, %r1, %r9
	setx	0xc3c4f3d5317d3da7, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f277bb1e48, %r1, %r9
	setx	0x19ce31fffc7a3f93, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e091f80, %r1, %r9
	setx	0x9c4d9d480b83946f, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f394f50, %r1, %r9
	setx	0x31177c5fb747804b, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c2b955a1b0, %r1, %r9
	setx	0x12360ae32a843579, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000dd6135a6d8, %r1, %r9
	setx	0x5c80daae1046baaf, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ebd3019798, %r1, %r9
	setx	0x362386a112c5dcf8, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000fa446d5518, %r1, %r9
	setx	0x810da2caf6bfa0d4, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ec00eff208, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000ddf0535e80, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000c3480b23a8, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800f0cd450, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e305930, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000de14c48748, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000fcd9e86248, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800ef764d8, %r1, %r9
	setx	0x1bd10c6848ae386e, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f48b330, %r1, %r9
	setx	0xcdede7223349098c, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c2a9f7e188, %r1, %r9
	setx	0x4df647e55df0c279, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d29df71d58, %r1, %r9
	setx	0x92319e064251e4da, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e9564ccee0, %r1, %r9
	setx	0x3f76404fa265e310, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f48c64cb70, %r1, %r9
	setx	0xdd9fcbd19439ef88, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e3dd4e0, %r1, %r9
	setx	0x165a0bdea67d4c37, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800ffcc9f8, %r1, %r9
	setx	0xe5f0f0d5aad27c28, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c145c11b70, %r1, %r9
	setx	0x605b080659b342a9, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d3f57bfb78, %r1, %r9
	setx	0x23c2a2b6c29d0c96, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e2153dcba0, %r1, %r9
	setx	0xf3ca0772e854c545, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000fc169509c8, %r1, %r9
	setx	0x19031eace039d987, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800ebb50f8, %r1, %r9
	setx	0x02a1db70e95bd5ba, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f5b3290, %r1, %r9
	setx	0x05491fcc465f65db, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c0bbf08450, %r1, %r9
	setx	0x57032061ed75bcd3, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d88e7dce10, %r1, %r9
	setx	0xdcbf5516284dd8d0, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e1b4c457e8, %r1, %r9
	setx	0x30559a5bd0a3457a, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f8e47b5548, %r1, %r9
	setx	0x5730a2755aa20221, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e97b778, %r1, %r9
	setx	0x1e2be181c7d4d2fe, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800fc34988, %r1, %r9
	setx	0x0c812bf6c19d54fb, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000cfcfc13fe8, %r1, %r9
	setx	0x968b1d833cb7006b, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d87219c8c8, %r1, %r9
	setx	0xf8d93d686e869151, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000eb681fbd90, %r1, %r9
	setx	0x92475dde11dd06a7, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000fecbcc8b50, %r1, %r9
	setx	0xaa4aa7af24dbd095, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ee6817b3a8, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000d0e1e73ae0, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000c72cbfcdd8, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800f9a6538, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800ed01d78, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000f6634ceb98, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000e01fcd8e38, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000c7c4af1208, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800f997490, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e4d20b8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000febea67848, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000e1e1871c98, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d5cb8868e8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d53ff8e818, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800eab2870, %r1, %r9
	setx	0x0101a6228a505e38, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800fba9ec8, %r1, %r9
	setx	0x1e1bec47ccad9af8, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ce3797e8e0, %r1, %r9
	setx	0x582b84bf8c0dd060, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000dbe0e1ef98, %r1, %r9
	setx	0x90fb54ebe70ce30e, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e871646968, %r1, %r9
	setx	0xa020bb078ea1745b, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f2c55ab908, %r1, %r9
	setx	0x07bf3ef9c6d7c9c2, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e7e9548, %r1, %r9
	setx	0x9b526465886abd5b, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f3c6510, %r1, %r9
	setx	0x4aaf0e5fd9e0dc96, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c5acdb38f8, %r1, %r9
	setx	0x937744e0797c4769, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000dbea0b8398, %r1, %r9
	setx	0x27dcaddf03ca2391, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e6fa317eb8, %r1, %r9
	setx	0x4da8f9816bf60364, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f64bf87948, %r1, %r9
	setx	0xa669b59b9f85d175, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e22b638, %r1, %r9
	setx	0x1867e8c37b105711, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800ff54650, %r1, %r9
	setx	0x5af2acc8616a9a35, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c45929bb08, %r1, %r9
	setx	0xfde9abcb64dbd8d3, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d31a4d8138, %r1, %r9
	setx	0x4a71759466b9128e, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e8729e7250, %r1, %r9
	setx	0xc66dfa64bbeaef50, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000fcd0586960, %r1, %r9
	setx	0xb79bcd85b9ca02a9, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800ecc9dd0, %r1, %r9
	setx	0xeeda5a1f83592061, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f9aad28, %r1, %r9
	setx	0xbd64e86a2bc639d5, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c20ae796c0, %r1, %r9
	setx	0x02e77d06bd3f6921, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d0ee6d1800, %r1, %r9
	setx	0xb59f71567cdc0a2c, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e50f231378, %r1, %r9
	setx	0x07c7b7c8466422b4, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f2854176d8, %r1, %r9
	setx	0xdff693048ab399f1, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c261d48ef8, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800f278df8, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800e47d580, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000fe47e8ca30, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000d89a99dfa8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000c739ed3fb8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800f869328, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800eff7000, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000fc029cc758, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000ed3e2fcdd8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000eb05e998a8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000dc602f97a8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000c84b3b1478, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800ed48be8, %r1, %r9
	setx	0xfa4719028d47c653, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f8a3dd0, %r1, %r9
	setx	0xc6a19e3f57cc6771, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c319f8b000, %r1, %r9
	setx	0x61b6841d11982a6a, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d5dfa40fe8, %r1, %r9
	setx	0x754f5d6adfee16c2, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ebf365ea78, %r1, %r9
	setx	0x219edcbaa91eab2d, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f6f9609b10, %r1, %r9
	setx	0xe872c131557cbc06, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e7b0938, %r1, %r9
	setx	0x5be48f2e0362e375, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800fdeef48, %r1, %r9
	setx	0x740006e9885f6854, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c6a0245910, %r1, %r9
	setx	0x186f2cc6d9f29f9d, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000de7cb9bab8, %r1, %r9
	setx	0xd96eb982f78af697, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e137afb328, %r1, %r9
	setx	0x2fadd13af11b67c1, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000fa8436ec68, %r1, %r9
	setx	0x1015b8a0ef347ee2, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800ecc56f0, %r1, %r9
	setx	0xa52d6bca6a0e16a1, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f394f00, %r1, %r9
	setx	0xb70aafbe77a45d2b, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c95f620c58, %r1, %r9
	setx	0xa1f70029681aa559, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d3bd91bf60, %r1, %r9
	setx	0x93e3aef0b59e5799, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e53127b000, %r1, %r9
	setx	0xc7addb6148d9b2d3, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f6d6e1d360, %r1, %r9
	setx	0x386ed12e52f785ce, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800ef4d5d8, %r1, %r9
	setx	0xe3869603d2ca7cfb, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f8111e0, %r1, %r9
	setx	0x8aabc380762bf049, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c69abb6e88, %r1, %r9
	setx	0xf53a5d54dd88e0e9, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d0f8e898d8, %r1, %r9
	setx	0x4923311220ac5cce, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e822b43cc8, %r1, %r9
	setx	0x27f607e8508e3994, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f4d108e878, %r1, %r9
	setx	0x87b12e24f359a2a2, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000fad8417ed8, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000eae91fd4d0, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000debe2b0b00, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000c7eb59e588, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800f6aae28, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800e9bfa40, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000ea7a30d408, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d99b494430, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000fc3ab3d580, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000cec22f7a30, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800fb469d8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e251aa0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000f21895ff58, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000ee1685d288, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000ddeba05800, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800ec18b70, %r1, %r9
	setx	0xae68ffa202e2fd91, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800fbefda8, %r1, %r9
	setx	0x241de52558380d61, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c3da03c9a0, %r1, %r9
	setx	0x02729200f61691ec, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000dfb5e77a60, %r1, %r9
	setx	0xb65695f3d6089740, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ed03638c28, %r1, %r9
	setx	0x44a9ae58eef58db7, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f2d568e738, %r1, %r9
	setx	0xd781908c3cd4079a, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800ee07ca0, %r1, %r9
	setx	0xa28675438449da76, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f03d3a0, %r1, %r9
	setx	0x6c39209290b9179c, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c6815525b0, %r1, %r9
	setx	0xc5a17abec66b247d, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000dce000efe0, %r1, %r9
	setx	0x4cef6f0c23490474, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e330ff68f8, %r1, %r9
	setx	0x45a2c7d29ea6d04a, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000fc33de8828, %r1, %r9
	setx	0x46f57a39aeee1225, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e9377b0, %r1, %r9
	setx	0x43eb8ecdc876e78d, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800fde2630, %r1, %r9
	setx	0xcd5f95c824e8c495, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c89abc5790, %r1, %r9
	setx	0x77e62bc5150bfdc2, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000db5b3ce468, %r1, %r9
	setx	0xc59e164a06e6847a, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000ec71914b88, %r1, %r9
	setx	0xf8270a5a3ebfa00c, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f68dfea968, %r1, %r9
	setx	0xac1263fde29b1888, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800ec33030, %r1, %r9
	setx	0xadd03d09d77b9081, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800fd7a598, %r1, %r9
	setx	0xef38ff673c810c22, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c509153f28, %r1, %r9
	setx	0x35395e636aff90f2, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d8f669f170, %r1, %r9
	setx	0xb2fee5bd8f3efdc3, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e9b733c0b8, %r1, %r9
	setx	0x1f822ed7151df37a, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f46cf93a58, %r1, %r9
	setx	0x7ae02b0e72abbf6c, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c5d8b2c500, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800f9e0930, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800e4a8140, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000f01bdc8310, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000e1917fa4a0, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000dfdbbfc4c0, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000c2c0361098, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800fd46828, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e8587a8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000fa0422d830, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000e7e1576228, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000da070ade38, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800ef4d5d8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000f2854176d8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000e50f231378, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000d0ee6d1800, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000c20ae796c0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800f9aad28, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800ecc9dd0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800ebbe578, %r1, %r9
	setx	0xa2032241500ec3df, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f78f998, %r1, %r9
	setx	0x0b1edf635845dc9f, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000cd836d17f0, %r1, %r9
	setx	0xd4dc58cdf97e9c85, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ddfdc62e88, %r1, %r9
	setx	0x4bf578a15d68b257, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e451294b30, %r1, %r9
	setx	0x31d14bae7165fe97, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000fc1bd8bea8, %r1, %r9
	setx	0x29ac563d5a3ed7c0, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800efcb8d0, %r1, %r9
	setx	0x2a73f5cf4679723b, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f56e010, %r1, %r9
	setx	0x4c528410dc6616a4, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c9d2b29648, %r1, %r9
	setx	0xcfb20dd69eceafee, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d8a4aa37c8, %r1, %r9
	setx	0x41c255fd7433cfcc, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e8e7dd6cf0, %r1, %r9
	setx	0xa52a75587b74edd8, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000fcc21097d0, %r1, %r9
	setx	0xa54c3186ed718695, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800eba4f58, %r1, %r9
	setx	0xb885bdcb4e1b5d43, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f666f00, %r1, %r9
	setx	0x11e54a670e8a55a0, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c8557ca578, %r1, %r9
	setx	0x9a2735cf638a57a2, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000da24f64a98, %r1, %r9
	setx	0x252066abc75ed8c9, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000ed31079868, %r1, %r9
	setx	0x8ee751682ded2c50, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f27c3ecac8, %r1, %r9
	setx	0x615cfb39b8107ca4, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800ebc4d50, %r1, %r9
	setx	0xc3474c920e42f415, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f8a5490, %r1, %r9
	setx	0x1d705085d17968d5, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c3a4abb558, %r1, %r9
	setx	0x965ad3960b959c1f, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000de671dd310, %r1, %r9
	setx	0x3292754690a6af5b, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ef117d1a90, %r1, %r9
	setx	0x02dd52714dce23ff, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f60e79cd88, %r1, %r9
	setx	0xb56f72fbe9ce0730, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800e904e18, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000f01671b218, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000e1e9537f18, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000d0f2e51468, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000eb22c01e08, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d37dbbd9d0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000ce6a05cc48, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800fb02e08, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e9ad528, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000f4fe575928, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000ec3ae9db98, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000f8e47b5548, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000e1b4c457e8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000d88e7dce10, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000c0bbf08450, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800f5b3290, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800edf61a0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000fa43d31fc8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000e43faad820, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000d205abb610, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000c942b39e60, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800fa839a0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800eddcc00, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e8b5b58, %r1, %r9
	setx	0x491d731b0c32a223, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f4a7870, %r1, %r9
	setx	0x6a29b092472acb4e, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c9b1bd5d10, %r1, %r9
	setx	0x46d4acda6b4703f1, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d2ccee0608, %r1, %r9
	setx	0x49bb9ce91f833238, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000eec8953168, %r1, %r9
	setx	0x78390b0656edff8c, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f271798510, %r1, %r9
	setx	0xba7edd873b81586a, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e0103d0, %r1, %r9
	setx	0x380bb8bdb117847f, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f562da0, %r1, %r9
	setx	0x66dc3ecc7116cee0, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c518434928, %r1, %r9
	setx	0x972dd77bcd9a6bbf, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000dc6c235898, %r1, %r9
	setx	0xf968a9055be4a9d5, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e829341418, %r1, %r9
	setx	0xce98b5399b8b9892, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f61dc69ad8, %r1, %r9
	setx	0x28506248133bb6f8, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e7224b0, %r1, %r9
	setx	0x25eabbffb8a713fd, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f66cf08, %r1, %r9
	setx	0x2e4baabc9473b1db, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000ca16924278, %r1, %r9
	setx	0x013869f64cff9980, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d8284fe528, %r1, %r9
	setx	0xe645c2f652002c9f, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e0e1adcc58, %r1, %r9
	setx	0xcbc6bc40d8bf339d, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000fc1808a7e0, %r1, %r9
	setx	0x8c3893214d84b5b5, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800ec9f3b8, %r1, %r9
	setx	0x29c4c9c335d14d9f, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800fa6f1e0, %r1, %r9
	setx	0xc5fa1ab63bc3f50e, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ce7174da78, %r1, %r9
	setx	0xf29bbdc18d644a59, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d2859dfee0, %r1, %r9
	setx	0x46b92ebc46386a35, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e1496791a0, %r1, %r9
	setx	0xd5b2fd09d74cf513, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000fc1ee10218, %r1, %r9
	setx	0xdb0067c82bd69bed, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800e303da0, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000f0218d4c78, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000c3468390e0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800f6d9418, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800e6e9868, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000fa85702dd0, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000eec1f54568, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800fb1b510, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e3e9ac0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000fa026b56e0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000e0141dd478, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000daabbf5800, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000ce0a68c2e0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e04a7e0, %r1, %r9
	setx	0xd4e74d46f6481c19, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f7bc280, %r1, %r9
	setx	0xed5b6902599f01f3, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ced2577010, %r1, %r9
	setx	0x30f99c3f1f310f8b, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d025a4a7a0, %r1, %r9
	setx	0xcfa4d243d239cfbe, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e130e646b8, %r1, %r9
	setx	0xa1b0511bdb4e9d85, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f826b5d6a8, %r1, %r9
	setx	0x0b7094ce9b6c45ef, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e51f218, %r1, %r9
	setx	0x547838c0c404f756, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800fb83150, %r1, %r9
	setx	0x3ec227e20f0e8d39, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000cf32bb3d50, %r1, %r9
	setx	0x952d2bc75ac0e89d, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d13c69bbd0, %r1, %r9
	setx	0x461f6f9279cd2276, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e2700c3fe8, %r1, %r9
	setx	0xa887a4b3b56894a8, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000fc32509138, %r1, %r9
	setx	0x0a86446559316eef, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800eca72d8, %r1, %r9
	setx	0xb7e0d9d48bb7356c, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f353f70, %r1, %r9
	setx	0xae270ff9cdf7d8b9, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c4a28c8ff0, %r1, %r9
	setx	0x785b2282c91492e8, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d4e3d50fb0, %r1, %r9
	setx	0x7c8a320e0770036f, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000ee5ed1b3a8, %r1, %r9
	setx	0x04fe39d356254684, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000fabdf3cfa8, %r1, %r9
	setx	0x6ab13e1f844c6750, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800ef031d0, %r1, %r9
	setx	0xd0c3e0e7ba51d5b6, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f30add0, %r1, %r9
	setx	0xc345364621fc6a00, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c260cb6c60, %r1, %r9
	setx	0x0bcb1948b7d3db8d, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d0d4c98280, %r1, %r9
	setx	0x255daf84c681c30d, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ef8aec87e8, %r1, %r9
	setx	0xee1f96b85607d5fb, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000fac3b1cfc0, %r1, %r9
	setx	0xf3352fd09b6f5935, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f871ee4b20, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000e68c2e3fb0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d0eaea4438, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000c2612694b0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800f0ea838, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800ea5d9a0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e7224b0, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000f27c3ecac8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000ed31079868, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000da24f64a98, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000c8557ca578, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800f666f00, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800eba4f58, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000fa026b56e0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000e0141dd478, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800ebe41f8, %r1, %r9
	setx	0x79cbec03b75ac1ef, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800fea1a48, %r1, %r9
	setx	0x7cfc44ae4c77daac, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c8d170d488, %r1, %r9
	setx	0x6fa9117e853a6b4e, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000dd3f10c788, %r1, %r9
	setx	0x4f1002d89e196da1, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e2144eba08, %r1, %r9
	setx	0xd6fdb54abf568450, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f4970b21c8, %r1, %r9
	setx	0x1646dbc2cfb0ee70, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800ec110a8, %r1, %r9
	setx	0x1c9d77af42daf25d, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f214c20, %r1, %r9
	setx	0xe2850a757dba549d, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c005631618, %r1, %r9
	setx	0xea75fe7b0489486b, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000dfaa7f3080, %r1, %r9
	setx	0x8a08d39f34b0deea, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000ef3eb6ff30, %r1, %r9
	setx	0x672a5c56ccbe23bf, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f0c25c2658, %r1, %r9
	setx	0x1c61f6e6abb219c8, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e23df48, %r1, %r9
	setx	0xd9dd3e6852de640c, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800fa6f4e0, %r1, %r9
	setx	0x782e5b43a620e1a0, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000cf7d3c78c0, %r1, %r9
	setx	0xbe17b8a0a300bf4e, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d3e4b53988, %r1, %r9
	setx	0x6bf06be3be2fe04e, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000edb7e8e940, %r1, %r9
	setx	0x51fbfe6f643de8c8, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f47efd33b0, %r1, %r9
	setx	0x65cb7b6d8ef19c7f, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e723f48, %r1, %r9
	setx	0x5f77e8d3216359cb, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f74f290, %r1, %r9
	setx	0x4894c42c4494b0e0, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c9597f8738, %r1, %r9
	setx	0x240c145bb6db41e2, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d8b4109990, %r1, %r9
	setx	0x5502dc96284c70c0, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000efcc9c9e00, %r1, %r9
	setx	0x4d9241c324ae7bcf, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f281d6c530, %r1, %r9
	setx	0x4d54a643ffb0efe5, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f849f768a8, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000e15b79a108, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000e739c140d0, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000dbbf8a2120, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000c141350988, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800ffb1570, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000f8a663a418, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e972700, %r1, %r9
	setx	0x99d25f3cabb5feb7, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f85e6c0, %r1, %r9
	setx	0x61c0ebd66c48f5d8, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ccde1e9940, %r1, %r9
	setx	0xc1135b1c3b777f21, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000dbd7951528, %r1, %r9
	setx	0xa7739d942594fdb5, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ecbba09560, %r1, %r9
	setx	0x640ec42e93d54d5b, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f6e8f7d350, %r1, %r9
	setx	0x5fa849a26d7149a3, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800eab2e98, %r1, %r9
	setx	0x15d910a5373380fd, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800fed9d88, %r1, %r9
	setx	0x28c1a1e7c8cf4c7b, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c8fb8e2db8, %r1, %r9
	setx	0x5893097d883b72ba, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d93feda870, %r1, %r9
	setx	0xa803c2249ae7b05c, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000ef399d2d50, %r1, %r9
	setx	0x15e0ac9f9c854a51, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000fc0d9ae360, %r1, %r9
	setx	0xc9678e30bf884e57, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e12f118, %r1, %r9
	setx	0xf7cf36ae513a6cc4, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800ffa3880, %r1, %r9
	setx	0x610367b2f2828fcd, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c1b44c3cd8, %r1, %r9
	setx	0xb1ab9804084efd6a, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d3de6f8208, %r1, %r9
	setx	0x6b88d732c7ee486a, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000ec5f359240, %r1, %r9
	setx	0x250f0c858333f011, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f44b188fe8, %r1, %r9
	setx	0x5283d2ae09b903fd, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800efe8038, %r1, %r9
	setx	0x251bdbcedcc793fa, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f1f5cf8, %r1, %r9
	setx	0x95fe88090e4d0119, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000cba2c47838, %r1, %r9
	setx	0x7d4589e9191ade16, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d04b8ef0f0, %r1, %r9
	setx	0x4b9778a7e8312276, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e88b3a3f28, %r1, %r9
	setx	0x1d497ead68683322, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f2074ee3b0, %r1, %r9
	setx	0x7a6bd487b2281efb, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f21b38d5a0, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000e3dad39f78, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000dda1a23348, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000c5d8b2c500, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800f9e0930, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800e4a8140, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000f01bdc8310, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000ecbbde2808, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d7c98419d0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000cb1a0f0ac8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800ffdf060, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e5d74f8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000fc9a87e4d0, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000ed44c54500, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000d8f669f170, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000c509153f28, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800fd7a598, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800eb49500, %r1, %r9
	setx	0xd9546e115caa4d5d, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f5d2c20, %r1, %r9
	setx	0x3e48246f528ce195, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c897cbef68, %r1, %r9
	setx	0x23010fac7ad83f31, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d01bcb4bf8, %r1, %r9
	setx	0xdd9bb651ff1c6792, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e7502384e8, %r1, %r9
	setx	0x967cdea013227c38, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f671042e48, %r1, %r9
	setx	0x7d6be4d9adfa487e, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800ed2ecd0, %r1, %r9
	setx	0xd61ea7c5c87b7a46, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800ff6a560, %r1, %r9
	setx	0x76827fc7123e91cf, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000ca5dcc19d0, %r1, %r9
	setx	0x250af1d7196c35cf, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d3627d03c0, %r1, %r9
	setx	0x42e38fd48909a2a0, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000ec50dbaa48, %r1, %r9
	setx	0x4eed4a1e6155f53f, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000fea8010b70, %r1, %r9
	setx	0xb2cbead841da0942, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e81e118, %r1, %r9
	setx	0x326b0f70ad67f693, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f4f4b68, %r1, %r9
	setx	0x6eb06c7ecca47405, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c1578ba928, %r1, %r9
	setx	0xbb54d1da53249476, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d93d426210, %r1, %r9
	setx	0x75fc53f5f4a2bc6d, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e011c21aa0, %r1, %r9
	setx	0x632411f878c846be, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f6a698cac0, %r1, %r9
	setx	0x724877fc1ea198cb, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e5ec9e0, %r1, %r9
	setx	0x87e45d86318428bc, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f9c6e80, %r1, %r9
	setx	0xe596b91be51dc1ee, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c24e2e7798, %r1, %r9
	setx	0xb6eb9087570f7ced, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000dc052caaa0, %r1, %r9
	setx	0xe7a30ec81db40c0d, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e7a9d081b8, %r1, %r9
	setx	0x6e1f26494680fd72, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f6b818e740, %r1, %r9
	setx	0x773db2c2cc4190d0, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800ea17340, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000fab3a4bb78, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000e0be8607e8, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000d9bed19770, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000c1c5328b58, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800f154270, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800e8807f8, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800fb83150, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e51f218, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000f61dc69ad8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000e829341418, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000cf965ab018, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800f836f40, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e3f4448, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000f276f9acf0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000ed8657c3c8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000d565f4e848, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e16df18, %r1, %r9
	setx	0xd2b04f1d1271e840, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800fe7de38, %r1, %r9
	setx	0xa8f70b73bbb139e3, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c4a6b39c70, %r1, %r9
	setx	0x1a31a808b46ddb2e, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d5e9a65508, %r1, %r9
	setx	0x26b8c757fbb64cf8, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e2a17e7e88, %r1, %r9
	setx	0x4f8a1de204820641, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f4c7d78158, %r1, %r9
	setx	0x54745e339dc89718, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e2b79e0, %r1, %r9
	setx	0x809511179e9d58b6, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f0def48, %r1, %r9
	setx	0x2fc07581848234e4, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000ccd30d56d8, %r1, %r9
	setx	0xbfe81e4203aff196, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d49584e568, %r1, %r9
	setx	0xa080068e9fb9aad3, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e78de6cde0, %r1, %r9
	setx	0xcf69db18f216c894, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000fcc290e8c8, %r1, %r9
	setx	0x6ddf01e268cb858e, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800eef9a88, %r1, %r9
	setx	0x7ad943b09e724fa4, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f13d410, %r1, %r9
	setx	0x81096e5c344c13a9, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000cb285f2a60, %r1, %r9
	setx	0xbd7fd05345c0406e, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d70fabd6a8, %r1, %r9
	setx	0x8b04f51efb16a70a, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e82ff198c8, %r1, %r9
	setx	0x5200e8ff027cec99, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f89bb363a0, %r1, %r9
	setx	0x1c71118e3f978f8b, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e7e69a0, %r1, %r9
	setx	0xd1fc0cd0e3fe07a9, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f5359c8, %r1, %r9
	setx	0xde8bb3b71c25cef1, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000cc9dc2ab28, %r1, %r9
	setx	0xe372e1669a794ba8, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d1506efc60, %r1, %r9
	setx	0x19035497ac9dbc3f, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e66c0771d8, %r1, %r9
	setx	0xc8a721a7b0f652ed, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000fa7788d7e0, %r1, %r9
	setx	0xc0a2e0994078219a, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000eb5ff592f0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d7f17cb200, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000c546ef6ba0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800f51cdc0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000c24e2e7798, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800f9c6e80, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e5ec9e0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e270a40, %r1, %r9
	setx	0x0aad761d220d18ea, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f11dc08, %r1, %r9
	setx	0x4aeea9950fb5847a, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c6b8507478, %r1, %r9
	setx	0x433dbfdaa4446a07, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d54ce02788, %r1, %r9
	setx	0x12b86be5dbbaf2d6, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e833bcb3d0, %r1, %r9
	setx	0x2fa31072113f28e7, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000fe4814ed88, %r1, %r9
	setx	0xae7772ccf8c58d1e, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e48c5a0, %r1, %r9
	setx	0xa5fc656dc11b0b3c, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f2a8d50, %r1, %r9
	setx	0xa31ea375e32e10c2, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000ca9315ade8, %r1, %r9
	setx	0xc217cf34d502fc08, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d143933ae8, %r1, %r9
	setx	0x1ad9efd75b8da0f2, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000eb5253efb0, %r1, %r9
	setx	0x3e40f5143f71555c, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000feb60ff278, %r1, %r9
	setx	0xcaa081422ad683c2, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800ef63420, %r1, %r9
	setx	0x6d0f450e8eee2f29, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f80b590, %r1, %r9
	setx	0x9ad017b0dff10335, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c9302c4248, %r1, %r9
	setx	0x3985c378e8bfc062, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d6bcce5308, %r1, %r9
	setx	0xd70a96cb5cc3a80a, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000ef93207670, %r1, %r9
	setx	0x9064465a1f791c6b, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000fc3fda2490, %r1, %r9
	setx	0xe8de43f383426436, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800ec91a40, %r1, %r9
	setx	0xd64b0cac7e429ee9, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f8440c8, %r1, %r9
	setx	0xbf98c9eaea7168ce, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c4b401f2b8, %r1, %r9
	setx	0x1967bd3a3def0325, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d36c9fa900, %r1, %r9
	setx	0x4ea3b4691143d847, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ea1fc6f730, %r1, %r9
	setx	0x8bad77e485b536f9, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f0678edb28, %r1, %r9
	setx	0x16c5a6393e4fccef, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e82b5f3df8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d4bbb5e3b8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000cdd39e1eb0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800f8ce278, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e463ca8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000f60438b1e8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d3252009f0, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000c8fef9ad20, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800f078290, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800e7a4b30, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000f033656c50, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000d40e99cea8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000c37f469098, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800fb1b510, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800ec8bb08, %r1, %r9
	setx	0x4e7f7039b415fb85, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f561108, %r1, %r9
	setx	0xd21e014b4e427e40, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ce7f4475c8, %r1, %r9
	setx	0x7a2c5199c4862a74, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d79e1f4010, %r1, %r9
	setx	0xbc04956d648d098b, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e3b36faff0, %r1, %r9
	setx	0xe243df612fb22eb9, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000fe3a67b740, %r1, %r9
	setx	0xf11d7c6ec5af31cc, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e9ce970, %r1, %r9
	setx	0xc7d9fc8607c32538, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800fa7ca80, %r1, %r9
	setx	0x5b0979c600ce59e1, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000caed2342d0, %r1, %r9
	setx	0x8b838006993edfd3, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d07f194318, %r1, %r9
	setx	0x19aef41eab792459, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e0037cba80, %r1, %r9
	setx	0xe0a978db8bdf958d, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000fe93dc2ca0, %r1, %r9
	setx	0x56e4f9970c3037ac, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e059de0, %r1, %r9
	setx	0xe06d803a9c430cf7, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f810c88, %r1, %r9
	setx	0x3e917408422fde55, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c628b8f820, %r1, %r9
	setx	0xa0b8211d5171948a, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000db0edc0288, %r1, %r9
	setx	0x43a0f700e1c0246a, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e6be3b0d20, %r1, %r9
	setx	0x1c404a73eed2319c, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f2b20bbe78, %r1, %r9
	setx	0x59ca270236e42534, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e49bc00, %r1, %r9
	setx	0xa05ecd3d55814ddc, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f5122a0, %r1, %r9
	setx	0x43a65463b8e43b1a, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000cf7922b5c8, %r1, %r9
	setx	0x04c6ff1ee21181f5, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d9a7ad34a0, %r1, %r9
	setx	0x52de334aff973dbc, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e4e39db158, %r1, %r9
	setx	0x143992a1ef26fd87, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000fe2d5201b0, %r1, %r9
	setx	0x5979b8a57b211583, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d616699da0, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000cd8aeee5d0, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800f780f30, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000f6701eb108, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000e94374f780, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000dfbcea0ce0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800eca72d8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000fc1808a7e0, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000e0e1adcc58, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000c544d5a2e8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800fcf63f0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e6e33d8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000fc4ee5c588, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e37f6b8, %r1, %r9
	setx	0x51d151151906e7e3, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800fb19cd8, %r1, %r9
	setx	0x154b654a0d21a64b, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c80cb8b028, %r1, %r9
	setx	0x407722cc68305985, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d8dd9ddc88, %r1, %r9
	setx	0x085e49f7f92ea85b, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e7e6276330, %r1, %r9
	setx	0x3454cdea76c3977a, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f6a634f688, %r1, %r9
	setx	0x39f7ea7e36060b9e, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e0dfe90, %r1, %r9
	setx	0x015315eaa1d04361, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800fdc4a80, %r1, %r9
	setx	0x853f328523be0e9c, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c562182260, %r1, %r9
	setx	0xd3154b2ab6f451c2, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d090d76890, %r1, %r9
	setx	0x114a9cfac31eb337, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000ee3272e548, %r1, %r9
	setx	0xc664446358b64484, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f4d90e5358, %r1, %r9
	setx	0x8455eca2f860d031, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e66a2b0, %r1, %r9
	setx	0xb09f81bfe3adac37, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f70dea0, %r1, %r9
	setx	0xfe4f2a45c61935e0, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c024fc6ea8, %r1, %r9
	setx	0x84385ada29bb5e25, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d18e861388, %r1, %r9
	setx	0x7e6ef4ccfd129063, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e4f8f0bbf0, %r1, %r9
	setx	0x828826f9dc40559e, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f89592c528, %r1, %r9
	setx	0x9c6ad95ececa749b, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800ed52ba8, %r1, %r9
	setx	0xd7b9fb422a1beecd, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f8a2c28, %r1, %r9
	setx	0x7720d0931d16c2e5, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c0faac9ae8, %r1, %r9
	setx	0xbcd48576a0252cfd, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000df34d80e00, %r1, %r9
	setx	0xba5335bffa7f7c30, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e100797998, %r1, %r9
	setx	0x3fa34424acde1e04, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f44e9aa3f8, %r1, %r9
	setx	0x528021709ac8d10f, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800ff50ff0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e4d41d8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000f02050a330, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000ede48d6bd0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e11f100, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000fc56fd1648, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000e9970a57b8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000dd54673448, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000c5b3560068, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800fdc2f20, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000c9597f8738, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800f74f290, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800ed6ae30, %r1, %r9
	setx	0x8d3c3c49d0484061, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f542978, %r1, %r9
	setx	0x93402e0f2196b03f, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000cd1cdbad70, %r1, %r9
	setx	0xd9ed890a6c425fb7, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d703b1e120, %r1, %r9
	setx	0xa7c724909d386906, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ee0d074048, %r1, %r9
	setx	0x6ea9005d9d3c366a, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f8b9c01768, %r1, %r9
	setx	0xaf7a362309c2d744, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e5cd080, %r1, %r9
	setx	0xfcaa9f3d93241806, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800fda9bb8, %r1, %r9
	setx	0x0c9e19c9a2550fb2, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c340d58f98, %r1, %r9
	setx	0xb016cc101b805d6a, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000de6cf9df90, %r1, %r9
	setx	0xe1b4590cea44c388, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e21e1f56a0, %r1, %r9
	setx	0xe9a50e647909f142, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000fede43b280, %r1, %r9
	setx	0x71d6f72b63055274, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e30b480, %r1, %r9
	setx	0x89d34d04a8ef8002, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f130938, %r1, %r9
	setx	0xd734d10a0248e4aa, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c50947fef8, %r1, %r9
	setx	0x723094952a1f1bc7, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000dbd6105808, %r1, %r9
	setx	0x56d8b688873be2ce, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e1bbc19ba8, %r1, %r9
	setx	0xdbfa7742e72e86ec, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f21a7e8018, %r1, %r9
	setx	0x8d74169fc3742aa3, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800edd2df8, %r1, %r9
	setx	0x4d054046b9ff9e6f, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f06ad68, %r1, %r9
	setx	0xb88dcf5487b1b776, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000cfcd00a8c8, %r1, %r9
	setx	0x05b4b6b7e2fd0152, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d2d635f180, %r1, %r9
	setx	0x088596c739dbf0a3, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e543ba24d0, %r1, %r9
	setx	0xf944bd4c9d9cec20, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000fa448e65a0, %r1, %r9
	setx	0x20fda3b7a1f7ec88, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000fc1bd8bea8, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800f9aa860, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e58a430, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000f405e4e700, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000e2633b92f0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000dccdbcd348, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000c3a2c8b7d8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800f97e688, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800feccb18, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000d8da44ae08, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000c5df67e680, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800f01a5d0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e900b30, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000fe8dc960e8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800edc82a8, %r1, %r9
	setx	0xca941d2a291af0d0, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f55fff8, %r1, %r9
	setx	0x801d894f3f414373, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c24713dfe0, %r1, %r9
	setx	0x2fad2bea43c73537, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d38ebf5940, %r1, %r9
	setx	0x6431e07ca271ad72, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e898fc6ce8, %r1, %r9
	setx	0x9f4edb6ed82bd18e, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f41c857d98, %r1, %r9
	setx	0x46ac0fda00d7660f, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e9a2470, %r1, %r9
	setx	0x91050e18df2a07f3, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f5bb588, %r1, %r9
	setx	0xc76ed6dbbb73030d, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000ccaf93bb30, %r1, %r9
	setx	0x6f8ecfc461841627, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d4b064ed30, %r1, %r9
	setx	0x167d2d331f1c30bc, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e81a583240, %r1, %r9
	setx	0xe5b188e22e87eda4, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000fa37d188a0, %r1, %r9
	setx	0xae4ee672ad7f7cf5, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e0aa680, %r1, %r9
	setx	0xef1f769f09587707, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f82fb10, %r1, %r9
	setx	0x4597e77bf2a6e25e, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000cd777ce9d0, %r1, %r9
	setx	0x1aab1f21da7d8bf5, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000dbcab1e9a0, %r1, %r9
	setx	0x12e1ac6315fef6cd, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000ed6bd839a8, %r1, %r9
	setx	0x17bf6f5b4d4035c4, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f812d16f08, %r1, %r9
	setx	0x509218691023e796, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e4c0dc8, %r1, %r9
	setx	0xfbb80281b00a58b3, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f438d38, %r1, %r9
	setx	0x313b84a9e1cc089f, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c42ac6a510, %r1, %r9
	setx	0xdb9d79b6c2b99b5d, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d6c2f83ce0, %r1, %r9
	setx	0x796c75110269faab, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e448e53be0, %r1, %r9
	setx	0x6ac8394ac06429c0, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f45ac3dc28, %r1, %r9
	setx	0x42aa09bae89f5c25, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d01bcb4bf8, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000c897cbef68, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800f5d2c20, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800eb49500, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000f6e8f7d350, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000ecbba09560, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000d7929eeed8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000cdc959ba30, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800f682b80, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e38e170, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000fce49e9d08, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000e9508e2cd8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800fc51758, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000f872abb418, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000ecb9193ff8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e9f11d8, %r1, %r9
	setx	0x1700679874b8c841, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f12e990, %r1, %r9
	setx	0xe31bfcf49d27bf30, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ca08598098, %r1, %r9
	setx	0xefcec3f16b07d5ec, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000dac714cb80, %r1, %r9
	setx	0xc7da007470ca92b0, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e09904a5d8, %r1, %r9
	setx	0xbe914b839eacd084, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000fea4b9cd58, %r1, %r9
	setx	0x9c71deb99f23370c, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800ed8a718, %r1, %r9
	setx	0xd53d0654412ab212, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800fcf84c0, %r1, %r9
	setx	0x93e87cfca9b863d0, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c9839ce480, %r1, %r9
	setx	0xb652efc79f1d53d9, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d32e8620e8, %r1, %r9
	setx	0xbb9855bab1b2002c, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000ebe2ecfe78, %r1, %r9
	setx	0xb90ed26abfc44385, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f2f2fb2fd8, %r1, %r9
	setx	0x0eb067523c95ba15, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800eaf0740, %r1, %r9
	setx	0x6413ef5deb6c8969, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f0b5fe0, %r1, %r9
	setx	0x43a52e546bc9879c, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000cc09d0ec40, %r1, %r9
	setx	0xf4550c5f8859e0c2, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d0b763b428, %r1, %r9
	setx	0xb9507785f2ee5ce6, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e5de884140, %r1, %r9
	setx	0x55f825a8d63a54b2, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f4951f4540, %r1, %r9
	setx	0x7a3b796d681211d0, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800ed5e630, %r1, %r9
	setx	0x6b1c740446918c77, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f7e5ef8, %r1, %r9
	setx	0x869f7ea5b72dd4bd, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c783db5cd8, %r1, %r9
	setx	0x62cd6032ba48d67c, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d7f708db98, %r1, %r9
	setx	0x147757657fffcaa9, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e13147a610, %r1, %r9
	setx	0xc455b77c243facea, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000fe9cde6358, %r1, %r9
	setx	0x0944ba885bb74dd6, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f0e55d2d88, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000e8e2e9f500, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000ddcbf1c898, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000f4645c0d28, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000e82b5f3df8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d4bbb5e3b8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000cdd39e1eb0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800f8ce278, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e463ca8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000f60438b1e8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000fa72f95cf0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000e8f1f65108, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000dec7d4b020, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000c958a0e1d0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800ed911d0, %r1, %r9
	setx	0xd127f965ceb8c2e5, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f926ee0, %r1, %r9
	setx	0x4a6c8f521e1e44d7, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000cba0b01a08, %r1, %r9
	setx	0x937418388113a62f, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ded328c328, %r1, %r9
	setx	0x9737a908c1015bf0, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e526a62fa0, %r1, %r9
	setx	0xbe82e817665e32b1, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000fc76e5af68, %r1, %r9
	setx	0x2a2c4da5a924fbaa, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800eae84f8, %r1, %r9
	setx	0x5063997943e2f54d, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800fe10120, %r1, %r9
	setx	0xeb0ea60079b1c51b, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c54c4193f8, %r1, %r9
	setx	0x38fd07cac0be92c1, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000dd90c930e8, %r1, %r9
	setx	0x82fe3f388d840a2d, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000edefae59f8, %r1, %r9
	setx	0xd4202ed8c2db15ab, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f82ac3fbb8, %r1, %r9
	setx	0xe39c5067be897e8a, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800ed14610, %r1, %r9
	setx	0x3a149defbc5e29b3, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f65b818, %r1, %r9
	setx	0x1482c5d7cbddc145, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000cdfe2e7e60, %r1, %r9
	setx	0x6990bf65bbd5428f, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d909e99e98, %r1, %r9
	setx	0xf5f2faead4c1bc1f, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e130b892d8, %r1, %r9
	setx	0x057314da9c2a92a6, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f8681b7f68, %r1, %r9
	setx	0xc31c3f2738dcf140, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e47fd30, %r1, %r9
	setx	0x23d00d9fb801e5af, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f442c18, %r1, %r9
	setx	0xedc0ea81d382c02f, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000cdae7e83f8, %r1, %r9
	setx	0xa8ed8e21806fedb1, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d120eebc70, %r1, %r9
	setx	0xe783570f14c62069, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000efb20260a8, %r1, %r9
	setx	0x51dc86ad5683b809, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f6334b0728, %r1, %r9
	setx	0x92cdaeef09f7a17b, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d0dfe66ff8, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000f81367e0d8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000eff65865c0, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000da830dfec8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800f6f2f50, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800eb1f298, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000fa72f95cf0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e0513d8, %r1, %r9
	setx	0xe1c0e42c0a7085a9, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f1f26c0, %r1, %r9
	setx	0xdccb05e241f3fb0e, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c6c4e3a2b8, %r1, %r9
	setx	0x8bd89e576a27d1fb, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d4296d65a0, %r1, %r9
	setx	0x7ab55024495b093c, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e1846e76d8, %r1, %r9
	setx	0xc4f1224fb4c6e8f6, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f89a840008, %r1, %r9
	setx	0xb629b15623ee8670, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e9c5df8, %r1, %r9
	setx	0x57588e74212e81a4, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f1d0548, %r1, %r9
	setx	0x7f5b0b05803afbe6, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c2a406b1b0, %r1, %r9
	setx	0x544d33d5d08f54a6, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d38c8ab600, %r1, %r9
	setx	0x1ca6bf1cb5ad598d, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000eaacc10270, %r1, %r9
	setx	0xc45c7ff372bae985, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f406846a90, %r1, %r9
	setx	0x22571a2f52ba4eea, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800ebd3228, %r1, %r9
	setx	0x1bbc92e72adb5297, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f1288e0, %r1, %r9
	setx	0x63866010f86c57cc, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c1538a00f8, %r1, %r9
	setx	0xd41906a22b161699, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d61fb34428, %r1, %r9
	setx	0xc3d0398a482aa185, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e013d61688, %r1, %r9
	setx	0xfe69bd4d28b799ff, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f2cd8b61a8, %r1, %r9
	setx	0x534ca47a70a2c5f8, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e4825a8, %r1, %r9
	setx	0x8324f1bfd1d3ece8, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800ffc2210, %r1, %r9
	setx	0xd53a39f8d627d151, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ca1d6e5948, %r1, %r9
	setx	0x1762f284c0d4c075, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d31dfdc7f8, %r1, %r9
	setx	0x8fdc0212f532e7b6, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e6e5572508, %r1, %r9
	setx	0x234cd1af2ac05c72, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f0ccbf2678, %r1, %r9
	setx	0x48fb326ba113d004, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800fd8c988, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800e7faf40, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000f41a29c588, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000f803f3eb20, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000eed0823dd8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000e7de1688b8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000d4751be160, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000c56f6b95b8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800f412ab8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000c37f469098, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800fb1b510, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e3e9ac0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000fa026b56e0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800ede60b8, %r1, %r9
	setx	0x5c282b72ce8fc672, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f751428, %r1, %r9
	setx	0xfbbc97109923b785, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000cd57771020, %r1, %r9
	setx	0xe81f8084bb30ffc0, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d52fbeeef8, %r1, %r9
	setx	0x157a3a7d1d1566d9, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e813dd6da8, %r1, %r9
	setx	0x70bc9a236e0408ed, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000fae2041740, %r1, %r9
	setx	0x039116db79729b8a, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e3efce0, %r1, %r9
	setx	0xc2a8e145647b1711, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f8fe830, %r1, %r9
	setx	0xe6d035604d1451dd, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c2ca7fde50, %r1, %r9
	setx	0xb1354acbe3ea5b05, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d9cb50a298, %r1, %r9
	setx	0x3cb7b640005afd27, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000eebdcc8b98, %r1, %r9
	setx	0xbba76bb553527279, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000fc5f0a7ef0, %r1, %r9
	setx	0x4ada345ddf34e27c, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800ea38a28, %r1, %r9
	setx	0xe8bc58e996df14e7, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f20d0d8, %r1, %r9
	setx	0x90881b54c311b2ad, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c1e755bb20, %r1, %r9
	setx	0x19041534f19f4c19, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d36bc07f70, %r1, %r9
	setx	0x44a820fed6e92f15, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e85dbe6018, %r1, %r9
	setx	0x90cab6f187248251, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000fab2ea7258, %r1, %r9
	setx	0x51956f19a7bc3220, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800ef07b60, %r1, %r9
	setx	0x125bd39b173a3f1e, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f206cc8, %r1, %r9
	setx	0x9d8a6e7168b9379e, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c53b734190, %r1, %r9
	setx	0xffef4fa24d9ebe9f, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000dc2845ee90, %r1, %r9
	setx	0xcfdb1821a81c1f79, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ee75bc7528, %r1, %r9
	setx	0x3decb20813de8d7d, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f207b63538, %r1, %r9
	setx	0xafbb7b383190cf0b, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ecbba09560, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000dbd7951528, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000ccde1e9940, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800f85e6c0, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800e972700, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000d7f17cb200, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000fc16242168, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000ea294eaa80, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000de9d979700, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000c7e6b0aa38, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800f5cc158, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000e62084d148, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000d733939358, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000cec22f7a30, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800fb469d8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e522690, %r1, %r9
	setx	0x56ed01c4a0158957, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f062ba0, %r1, %r9
	setx	0xb0d5a808bf1fe8a6, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c9b2c0a8d0, %r1, %r9
	setx	0xfee54888a8b32950, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d7299309d8, %r1, %r9
	setx	0xdd4ac15c1848d185, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e0728a52c8, %r1, %r9
	setx	0x852d0ad2f9128b2a, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f2e6e86a08, %r1, %r9
	setx	0x7b4da83c9d8a1c46, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e9996c0, %r1, %r9
	setx	0x3c71805d4dc7176c, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f25ba18, %r1, %r9
	setx	0xfdbdb617dd23e77f, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c95978c038, %r1, %r9
	setx	0x32517ef61695677b, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d410277a60, %r1, %r9
	setx	0x5a6a652c3c12b241, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e6eb3551c8, %r1, %r9
	setx	0x934f76ed9a0071de, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f2242c4a20, %r1, %r9
	setx	0xabea6da4e26dab9c, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800ebc18e0, %r1, %r9
	setx	0xdd79238262c422fc, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800fde3440, %r1, %r9
	setx	0x53d983b3f1e4f863, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c8b209cb48, %r1, %r9
	setx	0xe5493f4c01eff5fa, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000dd3dc22060, %r1, %r9
	setx	0x6894ebb6d66cec8e, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000eff1d2d018, %r1, %r9
	setx	0xe41654b79c6e58b8, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000fc5a58edc8, %r1, %r9
	setx	0xc0de122e8fa95f9a, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e8f38e0, %r1, %r9
	setx	0xae462f257d8bf4ab, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800fe7af90, %r1, %r9
	setx	0xe3a7bc0ae32f75e0, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c8d104e6b8, %r1, %r9
	setx	0x9f948d901466d9bb, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d60a5fa2c0, %r1, %r9
	setx	0x90aaf861570bc3c0, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000eceaf15320, %r1, %r9
	setx	0xc7a3de9a5aa33483, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f486b56a18, %r1, %r9
	setx	0x0e58086626999b85, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c6363bf740, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800f206f88, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800ebaea48, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000f482075868, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000ecf9916a20, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000d29fdb1298, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800f97e688, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e950218, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000c41bbb84b0, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800f017988, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800ebd0188, %r1, %r9
	setx	0x82bd5f7d77cf02bd, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800fdbd0d0, %r1, %r9
	setx	0x46e39185d822c752, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c9ced31f58, %r1, %r9
	setx	0x20e433aeac06fbf4, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d83fdb8970, %r1, %r9
	setx	0x74ab4b3510415727, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e5fd5b8160, %r1, %r9
	setx	0x103c23bc8456fe2a, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000fa26487960, %r1, %r9
	setx	0x7ffc3b132ab2a1f0, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e3ab808, %r1, %r9
	setx	0xff83a147f364f73f, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f73bc28, %r1, %r9
	setx	0x67f3fa9d7aed6871, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c99fc6a718, %r1, %r9
	setx	0xc64470d8d71fe4af, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d6881a8c48, %r1, %r9
	setx	0x288c9c9e5a5d12f0, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e455b86948, %r1, %r9
	setx	0xf6055d1c80d39aa1, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f0c201c8e0, %r1, %r9
	setx	0xd6d4155e8d9dadf4, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e28ba78, %r1, %r9
	setx	0xa8e2e72699d1542a, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f922018, %r1, %r9
	setx	0xc29d85e3fe627262, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000ca7c609368, %r1, %r9
	setx	0xe23938314cd58016, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d1d5847818, %r1, %r9
	setx	0x97178c2e5a6a6250, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000ecf9320898, %r1, %r9
	setx	0x89687e65ea7a05e9, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000fe95455430, %r1, %r9
	setx	0x38af81a3b3605deb, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e9dfb30, %r1, %r9
	setx	0x5658f946314895c6, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800fd7e7c0, %r1, %r9
	setx	0x019bb98f95c95d46, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000cbd485bda0, %r1, %r9
	setx	0x15c9e8fd91b9c223, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d2dc4186e8, %r1, %r9
	setx	0x87f217bbaba11214, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e851c55c00, %r1, %r9
	setx	0x12cb678cbf3720a1, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000faa08d05b8, %r1, %r9
	setx	0x3e1c3d9783293c36, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f30b148, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800e2b79e0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000fea8010b70, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000ec50dbaa48, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d3627d03c0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000ca5dcc19d0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800ff6a560, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e0b2d80, %r1, %r9
	setx	0xe661bc2f272e561f, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800ff6eb58, %r1, %r9
	setx	0xc0a1f93506c6f648, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c7d2606068, %r1, %r9
	setx	0xcd5a5dcb4af6a444, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000da00256ca8, %r1, %r9
	setx	0x4b3dc77378468b66, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e7f1d97270, %r1, %r9
	setx	0xb338be731d7d4906, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f472dbd4e8, %r1, %r9
	setx	0x4451bc3f74b58f81, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e43e578, %r1, %r9
	setx	0x63c665144d96c91c, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800fece238, %r1, %r9
	setx	0x692895cf59b12428, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000cbb36930f8, %r1, %r9
	setx	0x48ea1f4aebb135d9, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d9354df528, %r1, %r9
	setx	0x15d9d840155661c1, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e3965d7868, %r1, %r9
	setx	0xaf3253ec10074253, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f69f4c4408, %r1, %r9
	setx	0xb06949df4ca13f5a, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800eb3a5c0, %r1, %r9
	setx	0x6c124df962be4ab0, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f3229e8, %r1, %r9
	setx	0xf058c6fe571722ae, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c89ba13400, %r1, %r9
	setx	0x7eabe187b352c483, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d897e189b8, %r1, %r9
	setx	0xaf8c7d936c70a24f, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e5e67745b0, %r1, %r9
	setx	0xb1da46b4a27f3b39, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000fab308b748, %r1, %r9
	setx	0x4dc9e307799d7b33, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800ebc3e10, %r1, %r9
	setx	0x5d64b6c8bcb1dfae, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f5d6cf0, %r1, %r9
	setx	0xac13e5abca057329, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000cb5f46bb98, %r1, %r9
	setx	0xdde2b1d701afb6c3, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000dc9f748a48, %r1, %r9
	setx	0xc47a1a27e25d305f, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e48fe643b8, %r1, %r9
	setx	0x140c0ec8e2324af1, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000fe66f289a8, %r1, %r9
	setx	0xb8275d17492ddaa3, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000eaaf936610, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000ddeab19010, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000c0fbe13900, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800f25e998, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800ee1d930, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000cc3b4d96e8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800fd875c0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e607970, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000fe36249d30, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000e8dc84ad70, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000d099fdc658, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000caaedf1438, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800fb6ff10, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800e184790, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000f4e2d46d50, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000d7766b92c8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000c9b26a0268, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800f7d9380, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800ebd8728, %r1, %r9
	setx	0x0e2d4f8a72cc19fc, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f9f4168, %r1, %r9
	setx	0x17c3574ca70a4125, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000cc76157bf0, %r1, %r9
	setx	0x5d234e8537abe799, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d074434108, %r1, %r9
	setx	0x87ee1b514f0041cf, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e4401d4c70, %r1, %r9
	setx	0x815d7075e88dce41, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000fad201b0a0, %r1, %r9
	setx	0x61d94348642b1819, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e64ab38, %r1, %r9
	setx	0x0403f9e4f5790b15, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800fb900b8, %r1, %r9
	setx	0x17ca4775e11d2023, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000cd2dba3e50, %r1, %r9
	setx	0x4be07555c09c6cb7, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d48e43ecf8, %r1, %r9
	setx	0xd9e4359e2001876d, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000efe9464c48, %r1, %r9
	setx	0xb5f89424eaf6e170, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000fa4253e178, %r1, %r9
	setx	0x9388bc4e6b89ef01, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800ef3a600, %r1, %r9
	setx	0x0418267fbcb2a5de, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f45de20, %r1, %r9
	setx	0x583634c0fb5815af, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c450c7cd50, %r1, %r9
	setx	0xcbda79d17f6eeb68, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000dd1a664f88, %r1, %r9
	setx	0x74a77b46b7d28919, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000ef7dc32038, %r1, %r9
	setx	0x7cca323aaea243cd, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f6c0caf000, %r1, %r9
	setx	0xbff177cadac03bf3, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800ecec8c8, %r1, %r9
	setx	0x868401b58a4d272a, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f8b0378, %r1, %r9
	setx	0x88a9de5629b73113, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c4030b6d10, %r1, %r9
	setx	0x85630a6dc2e68455, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000dbac688a40, %r1, %r9
	setx	0x7de601dbd25b66cc, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ef0f05bc58, %r1, %r9
	setx	0x8ee186c34758b459, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000fc065034c0, %r1, %r9
	setx	0xff7efa566a489ead, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000cbf7be1690, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800f0524d0, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800e566228, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800eaa4530, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000f654d0c188, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000e7f76add28, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d4519cd858, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000cd777ce9d0, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800f82fb10, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800e0aa680, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800e3de990, %r1, %r9
	setx	0xdb5141baed8c4230, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f2e5660, %r1, %r9
	setx	0xf131ef77fbc323be, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c68e86dd10, %r1, %r9
	setx	0x36b479f0782ad93d, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000df66aeb540, %r1, %r9
	setx	0x0d38a6983c82b836, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e2065ad380, %r1, %r9
	setx	0xb0c245b0ae75b775, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000fe0b2b6e40, %r1, %r9
	setx	0xa42c4be4f84db65a, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e359308, %r1, %r9
	setx	0xa55b75dc75fc6c25, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f215460, %r1, %r9
	setx	0xd937c364af412880, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c906d94860, %r1, %r9
	setx	0x8d6b85609646785f, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d4900d59e8, %r1, %r9
	setx	0x4e6fabd2d981d7d0, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e591cf3488, %r1, %r9
	setx	0x7b6005604ec37e09, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f2650ae800, %r1, %r9
	setx	0x9a66b2b8a0b33f2f, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e93b3f8, %r1, %r9
	setx	0xe13e1a7782a2decc, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800fe35670, %r1, %r9
	setx	0xc4b831b79229c6ef, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000cf7e10a2c0, %r1, %r9
	setx	0x9efd89204e6745c5, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d8d1042538, %r1, %r9
	setx	0x981b6952b3e9530e, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e7faaea118, %r1, %r9
	setx	0xcd40aabff1f4d505, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000fad5d4e120, %r1, %r9
	setx	0x675652571ab3d246, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e906a50, %r1, %r9
	setx	0x5494aef6f6ab62a3, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800fe07118, %r1, %r9
	setx	0x6c16ffe930bfcff2, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000cd2391a2f8, %r1, %r9
	setx	0x74f35d90a343a0e1, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d5d24ff010, %r1, %r9
	setx	0x852cce40b68e1b82, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e0802beb18, %r1, %r9
	setx	0xc250112d0bded021, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f0d8779be0, %r1, %r9
	setx	0xd068c6b36f92f4b8, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f864398, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000f4b3645120, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000ebf0776310, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d1d8ab9058, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000cbe02d7a78, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800f377968, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800e0518f8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800efda940, %r1, %r9
	setx	0x912ab16486d0eb78, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800fc95ca8, %r1, %r9
	setx	0xb19fa8b038123e2e, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c24bcad268, %r1, %r9
	setx	0xd649bd7ea120f166, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000daf5babd08, %r1, %r9
	setx	0x050bf063b70686ed, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e9320298a8, %r1, %r9
	setx	0xf2d25eff2140aa44, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f434941448, %r1, %r9
	setx	0x28adcd5d294834f2, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e75f128, %r1, %r9
	setx	0x8c1ea1ce54bcf5ed, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800fff14d0, %r1, %r9
	setx	0xd8743fbbd073c127, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c848e22f18, %r1, %r9
	setx	0xa00918e329bf257a, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000defaa39158, %r1, %r9
	setx	0xc3da5e2a11b0f2e2, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e9d0c116e8, %r1, %r9
	setx	0xd30f1be12dc7736c, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000fecbe80920, %r1, %r9
	setx	0xc04df42619cf7927, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800eaaae18, %r1, %r9
	setx	0xf7180d6e2dc8050a, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f26f500, %r1, %r9
	setx	0x18032150f8acb95f, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000cefa4dc580, %r1, %r9
	setx	0x2a5dfbbd50f84c3b, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d74bb6be88, %r1, %r9
	setx	0x0afe6823db6fe552, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000ef89b3b278, %r1, %r9
	setx	0x851319894fcd34f1, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f22c53e258, %r1, %r9
	setx	0x4f960f5d22cec967, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800ee2eff0, %r1, %r9
	setx	0x8436950e1694be90, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f17c348, %r1, %r9
	setx	0xc661833ad5b5bdbc, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c6944c9628, %r1, %r9
	setx	0x5ea652099911fae8, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d80d3ac788, %r1, %r9
	setx	0xb3b992e24bb167c5, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e74412b760, %r1, %r9
	setx	0xfe56494be521d39e, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000fa757cea00, %r1, %r9
	setx	0x420a68e27d6b0649, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000fae2041740, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000e813dd6da8, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000d52fbeeef8, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000cd57771020, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800f751428, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800ede60b8, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000f89a840008, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000e6eb3551c8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d410277a60, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000c95978c038, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800f25ba18, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e9996c0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000fc5f0a7ef0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000eebdcc8b98, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800efd4598, %r1, %r9
	setx	0x64a0b8402c10d4df, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800fcb1b00, %r1, %r9
	setx	0xccb907dd6a15d99e, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c500864058, %r1, %r9
	setx	0x4e455dc2e1d454fc, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000dfe950daa0, %r1, %r9
	setx	0xe756fa29c85d6f9f, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e8beca56f8, %r1, %r9
	setx	0xb4262bb5cbfce7e1, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f250241110, %r1, %r9
	setx	0x1b921803343d980d, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e76bba8, %r1, %r9
	setx	0x030164693746c215, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f3188c0, %r1, %r9
	setx	0xfc171de8f2a24556, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000cd8d5379b8, %r1, %r9
	setx	0xec9ae2cd9705149f, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d29662e070, %r1, %r9
	setx	0x15eb61db261a1cd8, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000eff93851b0, %r1, %r9
	setx	0x0fd40b880ee8356e, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f2d6b377a8, %r1, %r9
	setx	0xd52b55c771d91f5f, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e920db8, %r1, %r9
	setx	0x7c91b1541d8ccc0a, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800fae7520, %r1, %r9
	setx	0x05ee1af6152a55a1, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c08dc40860, %r1, %r9
	setx	0xa07b4e29a5858fec, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d156aa2e38, %r1, %r9
	setx	0xe53abf6c820d1c56, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e3bd9f36f0, %r1, %r9
	setx	0x3d1d792e78fd7686, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f097841b90, %r1, %r9
	setx	0x8679f514a3593711, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800efa93a0, %r1, %r9
	setx	0x4e94c2af3ef31ce6, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800ffaf5f0, %r1, %r9
	setx	0x1426bdce57bfc8ec, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000cd72c6c398, %r1, %r9
	setx	0x83fc66dfde540369, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d82bf611d8, %r1, %r9
	setx	0x63241f2209aa5671, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e00f57bc28, %r1, %r9
	setx	0x8836100eaf62f78b, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f4e73982a8, %r1, %r9
	setx	0x0ca38a4e14046a13, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800eab3e70, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800e737dc8, %r1, %r9
	setx	0x2e60a1aa5aaee78e, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800fcb43d8, %r1, %r9
	setx	0xa477e040399478de, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c407e04930, %r1, %r9
	setx	0x524015d3450e99fa, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d4cb2ec770, %r1, %r9
	setx	0x6cca3fcb68ebff37, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e486ca1df0, %r1, %r9
	setx	0xb93fad0809da6767, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f0f5fbf1e0, %r1, %r9
	setx	0xe3c833c85a8a9818, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e33fe70, %r1, %r9
	setx	0x72290ebb111a9980, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f64bc28, %r1, %r9
	setx	0xc184bb6908f69591, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c722d79910, %r1, %r9
	setx	0x9d83ab3354c50284, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d671c1f928, %r1, %r9
	setx	0x89b4d32ea7eb1f48, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e1a03709a8, %r1, %r9
	setx	0x30bcfbade6cbaac3, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000fa4c8a0648, %r1, %r9
	setx	0x07eeff468e8b79eb, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e9a6288, %r1, %r9
	setx	0xf1448b61de94e9dd, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800fcfeac8, %r1, %r9
	setx	0x90b64b3270526918, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000ceeebdcf00, %r1, %r9
	setx	0x683ff1b7c4aa86e1, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000de1d860e00, %r1, %r9
	setx	0xe3f3f16405492af1, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000ec80ccf2c8, %r1, %r9
	setx	0xe455f8bf39563cd5, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f0bc056018, %r1, %r9
	setx	0x779b66f366ba65fc, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e452190, %r1, %r9
	setx	0xeecc6dfd0881d4c2, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800fd8ede0, %r1, %r9
	setx	0xfb10a82f4179034a, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c80ac88d08, %r1, %r9
	setx	0x73f55466e5a2689a, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d3f1dd1b40, %r1, %r9
	setx	0x11d11cf8c2543158, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e158583010, %r1, %r9
	setx	0xefba0b391edc21bc, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000fa86af0c78, %r1, %r9
	setx	0xcf8fe538c658f83c, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d83d5d00c0, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000cf09c894d0, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800f7634d0, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800eb303a0, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000fcb404ded0, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000e8406e50b0, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000f40f14fe18, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000ed7d366530, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800f745528, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800ec24370, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000f4581c6130, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000fa72f95cf0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000e8f1f65108, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000dec7d4b020, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000c958a0e1d0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800f85a4e8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e85d1a0, %r1, %r9
	setx	0xcea6ecbb1249a47b, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f07b1a8, %r1, %r9
	setx	0xab8cf980b22c81bb, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c93ee2df68, %r1, %r9
	setx	0x9db6e37a9a904310, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d5e57a1110, %r1, %r9
	setx	0x107ef18508ef0c99, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e3012e7b98, %r1, %r9
	setx	0x03543041eb2c21c0, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f8db097568, %r1, %r9
	setx	0xc0ab51401672fd18, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e594618, %r1, %r9
	setx	0x59826d11104c24bc, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f00b6b0, %r1, %r9
	setx	0xdf023a402a43d93e, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c015cd9c88, %r1, %r9
	setx	0xdffe77ce6ca24d42, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d66718c0f0, %r1, %r9
	setx	0xf86adda99d0addd6, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000ed4e2b7500, %r1, %r9
	setx	0xdf1146a10d28a574, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f62a659f90, %r1, %r9
	setx	0x314f89ce35bc0ffd, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800efd7688, %r1, %r9
	setx	0x52c1d62dda615f86, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f4467e0, %r1, %r9
	setx	0xfab3a702fc0dac38, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000cb0413bf88, %r1, %r9
	setx	0x2d817639de969697, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d9419331f8, %r1, %r9
	setx	0x380aba804aa1bcea, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e3cb7901a8, %r1, %r9
	setx	0x2d9a6f02178eeaa1, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f45418f280, %r1, %r9
	setx	0xf6aa2c94d3fdb5a4, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800eab5370, %r1, %r9
	setx	0x386816c87f9bbcfe, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f69d1b0, %r1, %r9
	setx	0xdfdedc58fa143d12, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c6427a84e8, %r1, %r9
	setx	0xe78d0b7febd6005e, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d0c3e2aa10, %r1, %r9
	setx	0x5cfac0928e08a87e, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e0d5f85100, %r1, %r9
	setx	0x7fae89e164997bbd, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f0151a95a8, %r1, %r9
	setx	0x412ffee063cbf793, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f85e6c0, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800e972700, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000f4970b21c8, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000e2144eba08, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000dd3f10c788, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000c8d170d488, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000d49584e568, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000ccd30d56d8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800f0def48, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800fb7c5e8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800e5d74f8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000fc9a87e4d0, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000ed44c54500, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000d662328868, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000fa12bc09a8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000ed8c429b28, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000de7945adc0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e3cbe00, %r1, %r9
	setx	0xddc88783292385c8, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f7643a8, %r1, %r9
	setx	0xbb5545f2930dce6a, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c965c92650, %r1, %r9
	setx	0xa3700252ee2ec918, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000dc38015628, %r1, %r9
	setx	0xff2150be17a903d8, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ec43a95eb0, %r1, %r9
	setx	0x8db08c222562b338, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000fc5ba723e0, %r1, %r9
	setx	0x09f2019d09547359, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e6536e8, %r1, %r9
	setx	0xd7adad2bd0c52f70, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800facae28, %r1, %r9
	setx	0x2231bedfec53f7a1, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c3650173a8, %r1, %r9
	setx	0xec44671ceeda318a, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000dc82d95588, %r1, %r9
	setx	0x84ddc5ec77a17bdd, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e321820938, %r1, %r9
	setx	0x2f153ecfd918085f, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f401596648, %r1, %r9
	setx	0x91081052b2fc6620, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e0924e8, %r1, %r9
	setx	0xd8a96342bf6cee1d, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f9496c0, %r1, %r9
	setx	0x3ec3aaeb640a3412, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000cb494abd08, %r1, %r9
	setx	0xf0f32fa6822b3031, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000da489f8fb8, %r1, %r9
	setx	0x9818bf20f26a2d8b, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000ede26242d8, %r1, %r9
	setx	0x2d816991cc7debd5, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f48c93b9b0, %r1, %r9
	setx	0x3ac6548806dc6876, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e980a48, %r1, %r9
	setx	0x3fb620540cf7954f, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800ff4fa98, %r1, %r9
	setx	0xe255e4c31917ad4a, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000cd3c2c3e00, %r1, %r9
	setx	0x7fa7af28ba1d1eb2, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000dfa484ac08, %r1, %r9
	setx	0xfb56a1638c5bb3f8, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e12e822d48, %r1, %r9
	setx	0xd996c63a64d18810, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000fe738356c8, %r1, %r9
	setx	0x5afd8e5b644196dd, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c897cbef68, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000fc824160e0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000ebf757ba70, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d0f9102898, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000cb7a4b9288, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e55e210, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000e448e53be0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000d6c2f83ce0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000c42ac6a510, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800f438d38, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e3c78d8, %r1, %r9
	setx	0xddfab569604b31a5, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f322888, %r1, %r9
	setx	0x452b1d0ff1ad30ab, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c7dc600fb8, %r1, %r9
	setx	0x529a97018dfda1e0, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d02182a9d0, %r1, %r9
	setx	0x684789e617d20b59, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e07b00bff0, %r1, %r9
	setx	0xb57b0a5e4ee5e3f4, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000fa9132e1d0, %r1, %r9
	setx	0x2a59a3875c555d8c, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800ea8e988, %r1, %r9
	setx	0x93d818158b7c9803, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800fd8ff88, %r1, %r9
	setx	0x96981ae76f8d6d69, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c257c18660, %r1, %r9
	setx	0x7fceeeaa41c7dc16, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000db8e31d918, %r1, %r9
	setx	0x304ba2c9d3b9b05f, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e92a8f8c30, %r1, %r9
	setx	0xc1f8e7b3c12587d3, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f617873468, %r1, %r9
	setx	0x1eb7a016109acba6, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e850608, %r1, %r9
	setx	0xb158dafacfa5f0eb, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800fc83c88, %r1, %r9
	setx	0xfffc6c0c64ef877e, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000cae8251c80, %r1, %r9
	setx	0x99a06259297ce043, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d730335a58, %r1, %r9
	setx	0x8d8481892ef45f43, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e979ec8e70, %r1, %r9
	setx	0xa6027dbc1aa0c860, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f23067fed0, %r1, %r9
	setx	0x7ec5d5a09ca858f9, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800ecd2ea0, %r1, %r9
	setx	0xad827e08b8043c74, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800faef678, %r1, %r9
	setx	0xe48b57e0a11f6392, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000cdfe314b20, %r1, %r9
	setx	0x882fc1ff310bbb80, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000db442cef08, %r1, %r9
	setx	0xc2cc4f54b7e3d835, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ee6e5fffe0, %r1, %r9
	setx	0x44acbd09c9adbbd6, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000fa3d6269b8, %r1, %r9
	setx	0x461fc9e302ab299f, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d3b5f9b648, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000c4fb81c168, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800eff7000, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000fc029cc758, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000ed3e2fcdd8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800f65b818, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800ed14610, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000c20ae796c0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800f9aad28, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800ecc9dd0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000fecbcc8b50, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000eb681fbd90, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e8b9a80, %r1, %r9
	setx	0x718107ddc7746c5a, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800fb1e0d8, %r1, %r9
	setx	0x70e026f7a5625b4a, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ce48523908, %r1, %r9
	setx	0xfb7bd40e8624d50d, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d4f115d7a0, %r1, %r9
	setx	0xcd13d787adefb51b, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e1a3e3ce70, %r1, %r9
	setx	0xec12a5e3519a7407, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f0b03535a0, %r1, %r9
	setx	0xcfc70bca4516fd11, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800ee61ca0, %r1, %r9
	setx	0x5ec265700564d704, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f327478, %r1, %r9
	setx	0x93033f38d4a42ac6, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000cc00bf5690, %r1, %r9
	setx	0xfc182f5dafe2a895, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d99e62b580, %r1, %r9
	setx	0xc524ec13e5596142, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000eefb0dc3c8, %r1, %r9
	setx	0x1a7d257f2431bbc4, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f2d6289bd0, %r1, %r9
	setx	0x0c7f22bfd5e32ebd, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e852ed0, %r1, %r9
	setx	0x5fd4cc0e2e77fafe, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f83e388, %r1, %r9
	setx	0x0c2946d2ee515016, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000cab0b91d30, %r1, %r9
	setx	0xd608b9929549c707, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d81b5c0b70, %r1, %r9
	setx	0x4b2cc7444f0d87c3, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000ee1c79ca20, %r1, %r9
	setx	0xb4227587c71f1c4f, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f6ec1b7dd8, %r1, %r9
	setx	0xe6718a811c5b937c, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e5a4038, %r1, %r9
	setx	0x82fff1e14c585cf6, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800fcc5a40, %r1, %r9
	setx	0x3764bf9b4c34ae66, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ce501501b8, %r1, %r9
	setx	0x7b47a798fdd7bbc0, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d134592be8, %r1, %r9
	setx	0xe9f1087a61d5d2ac, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e937999ab0, %r1, %r9
	setx	0xcf1125e0c663b8d2, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f6aa2d1bd8, %r1, %r9
	setx	0x13fd3daa7e174fd5, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000cd57771020, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000e68c2e3fb0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d0eaea4438, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000c2612694b0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800f0ea838, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800ea5d9a0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000fae40332e0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000e83fe46a40, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000f6d41d7790, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000e6cd4b0748, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000db288088b8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000c6ff044aa0, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000e05356c6f0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000dbe794d558, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000c7097b7fd8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800f650300, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800eb5d1f8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000f6cb8965c0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800ec63c10, %r1, %r9
	setx	0x0135ffa5d68e909b, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f4b01a8, %r1, %r9
	setx	0x3009be6e5e4301eb, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000cfd9f17838, %r1, %r9
	setx	0xe482057e54abc10f, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000dadf16ea28, %r1, %r9
	setx	0x49a180cf5ab24353, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e7f24ec9a8, %r1, %r9
	setx	0xc7609f75939eefbf, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f85530b400, %r1, %r9
	setx	0x249ccd2f5608a890, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800eb9af00, %r1, %r9
	setx	0xe505f0945c5ade8d, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f26a160, %r1, %r9
	setx	0xd4546971b7596228, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000cfb3b0b898, %r1, %r9
	setx	0xaa20a96fea43b463, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d595149928, %r1, %r9
	setx	0x47c038347866a8d3, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e8af1276f0, %r1, %r9
	setx	0xee6ae20075ec1186, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f66fdf5850, %r1, %r9
	setx	0xdb5db5d832bd88d4, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e797df0, %r1, %r9
	setx	0x0d42dfeb5346eeda, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800fe1cb38, %r1, %r9
	setx	0x6adb5ef24dab7397, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c4e0b3de88, %r1, %r9
	setx	0x1dccf48e88c0b085, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d6c9e42f60, %r1, %r9
	setx	0xe3007dfa44c61d7d, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e77af689d0, %r1, %r9
	setx	0x8560d35674261fc1, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f688f06578, %r1, %r9
	setx	0xcb6e1b0e297e593d, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800efac440, %r1, %r9
	setx	0xd3b2277f16ac7516, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f56eff0, %r1, %r9
	setx	0x417cdb6ba68333be, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000cc10b22050, %r1, %r9
	setx	0x89bd46ddf63dacb5, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000dd0bbcf600, %r1, %r9
	setx	0x72599240d4d876cc, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e6e7971b50, %r1, %r9
	setx	0x493c5b9c347f8b85, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f0b52dd688, %r1, %r9
	setx	0xf2f3997320861493, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000fe7aef0180, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000ef58442a28, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000d0133c5190, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000ccd35f8a50, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800f8900e8, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800ebe1208, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000dccdbcd348, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000c3a2c8b7d8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800f97e688, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e950218, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000f02d8f6a48, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e0518f8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000f8d23612d8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000e1ffa42380, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000d3252009f0, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000c8fef9ad20, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800f078290, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000f281d6c530, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000efcc9c9e00, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000d8b4109990, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800ec09bd0, %r1, %r9
	setx	0xa507394dcf66c437, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800ffeaee0, %r1, %r9
	setx	0x0dad1a7f9eba1f23, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c9c0f71928, %r1, %r9
	setx	0xc4dec5daa5bfacdb, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d83ec1c290, %r1, %r9
	setx	0x7925ff0ee660e784, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e91563e4d0, %r1, %r9
	setx	0x4aca87d0b5146fa1, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f6d3409ee0, %r1, %r9
	setx	0xbd5b20303b69c0ea, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e914648, %r1, %r9
	setx	0x12eb1cca4d6e9372, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f3470e8, %r1, %r9
	setx	0x4fa9a06f1ce430db, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c21a4c2760, %r1, %r9
	setx	0xc36e3b4e6a9cbdc7, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000de297a6620, %r1, %r9
	setx	0x386698895a77eb92, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000ea66110730, %r1, %r9
	setx	0xa24b4482195d1e2b, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f8217eb620, %r1, %r9
	setx	0x2f97b1a196a1224e, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e541f28, %r1, %r9
	setx	0xd7478e845f73f961, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f5f9000, %r1, %r9
	setx	0x27b792b7ab6b5fc7, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c2b3bd5aa8, %r1, %r9
	setx	0xd9a6ccef93bda5d6, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000db8465d960, %r1, %r9
	setx	0xa479e5dcd261469b, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000ed0b23ad10, %r1, %r9
	setx	0x4b911392effc46dd, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000fa9eae7678, %r1, %r9
	setx	0x7df486d7c5beba7e, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e700ef8, %r1, %r9
	setx	0x7d6ff22c08a33a2f, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f433590, %r1, %r9
	setx	0xb44e98b461c217e9, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000cb4469f530, %r1, %r9
	setx	0xa3b2b2c09a7b7378, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d067f96b70, %r1, %r9
	setx	0xe0a5c1641c83006a, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e7a8ea76d8, %r1, %r9
	setx	0xedd31cc932bec9e6, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000fa91bf08c0, %r1, %r9
	setx	0xe8e8b91b24c0e8a4, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f56e010, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800efcb8d0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000fc33de8828, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000e330ff68f8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000dce000efe0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000c6815525b0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800f03d3a0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d34caf85d8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000c04b59a400, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800ff3d3c8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800ec79368, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000fe1c545ae8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000e3a873b398, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000ded9089740, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800f5e1420, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800efa5c78, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000fc7477a0e8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e9f1fc8, %r1, %r9
	setx	0x5f6a4bded6e920b6, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800fed3a88, %r1, %r9
	setx	0x7282d5f3eb0896d1, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000cea3ec0710, %r1, %r9
	setx	0xa3aab002b4a75cfd, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d634812fa0, %r1, %r9
	setx	0x812a0ff2a21ffc14, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e55e686818, %r1, %r9
	setx	0xadc365ce1951776c, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000fcd3e05fb0, %r1, %r9
	setx	0xf0e927c682d77616, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800eb69a88, %r1, %r9
	setx	0x7d36c6743ef9a680, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f2ae598, %r1, %r9
	setx	0x60b36245aad4bfef, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c4e0fd9680, %r1, %r9
	setx	0xaea0d06eeee4995c, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d245e9a870, %r1, %r9
	setx	0x7e3cdfe6b6a2c22f, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000ec74a61668, %r1, %r9
	setx	0x5ef3ff0d0c92c705, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f49fb52aa8, %r1, %r9
	setx	0xa5f17113c5060100, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e0bbb00, %r1, %r9
	setx	0x0367df1f03899be0, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800fd9c580, %r1, %r9
	setx	0x6903f49f1fecca5f, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c45bc5d2f8, %r1, %r9
	setx	0x334ec18759b9c5cc, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d7b2386ce8, %r1, %r9
	setx	0x0e3e724536aa5f59, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000ec73c41fb8, %r1, %r9
	setx	0x3a80eb6bb064a207, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000fa20a9c508, %r1, %r9
	setx	0x9bf7be0941d910ed, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e1e7050, %r1, %r9
	setx	0x9d98fbf16458baca, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800fff9e70, %r1, %r9
	setx	0x5ba19bfb8ad38e2d, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c61e01e408, %r1, %r9
	setx	0x94f6281f61de9422, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000dad49a1890, %r1, %r9
	setx	0xc473a4cd1b8e4167, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e88898ffa8, %r1, %r9
	setx	0xfdf9469953010032, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000fc6db98778, %r1, %r9
	setx	0x9bbb5f2cbed8f694, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800eb957a0, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000fae676a8a0, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000ece2d3a758, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000d83f12f630, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000cad971bbc0, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800eb467a0, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000f8c2f2ec10, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000e6b4f946e0, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000db71478838, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000c0f8aa8c98, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800fcefd28, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000fc4c16e088, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000e68f81f610, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000d952205718, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000c0e21d14e0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800fecbda8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e0ed598, %r1, %r9
	setx	0x69141b4f1ec309fb, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f6a92c0, %r1, %r9
	setx	0x53a0a525a23bb99b, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000cad1a88738, %r1, %r9
	setx	0x6a3c87b5c9a1bad9, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000da3424ca10, %r1, %r9
	setx	0x1f97a47ccf337416, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e7050c84d0, %r1, %r9
	setx	0x4693731fba9b634d, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000fc5edf5f20, %r1, %r9
	setx	0x9baecfe338a72f87, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e9cec48, %r1, %r9
	setx	0x19084df3d2dd9c43, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f7a9fe8, %r1, %r9
	setx	0xc6948b372fdb6abb, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c5f9583c48, %r1, %r9
	setx	0x317461b9d4cd67b6, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000dd92c871d0, %r1, %r9
	setx	0x2a1ee7b70347fb55, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e750792130, %r1, %r9
	setx	0xa2d54c6d971410c9, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f6a2170de8, %r1, %r9
	setx	0x741e8ce46d4842ef, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800ec2c488, %r1, %r9
	setx	0xfe535fc1087f8bf3, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800fb39af0, %r1, %r9
	setx	0xb13fb0b6e0c9eecc, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c8ee184b20, %r1, %r9
	setx	0x13bc115031f22db7, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000dd4d38e3e8, %r1, %r9
	setx	0x5a770948427c6cfa, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e3f90c9ef0, %r1, %r9
	setx	0x594a6ea531ead891, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000fcfc5c1cd8, %r1, %r9
	setx	0x2fc02cbc4070a85a, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e6c9340, %r1, %r9
	setx	0xaebb3a1b6a01eddb, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f301870, %r1, %r9
	setx	0xe768267ce787c9ff, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000cc41e832d8, %r1, %r9
	setx	0x410aa6c00d63d6bf, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d5ae38bd68, %r1, %r9
	setx	0xf6fecc76505dd678, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e923fc0d50, %r1, %r9
	setx	0xc4eaf0ac45a6a981, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f22a21b428, %r1, %r9
	setx	0x551415a97e01d684, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000dfdbbfc4c0, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000c2c0361098, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800ffbd020, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800e2ce7a8, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000f84601d1e8, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000ec89074d08, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000d0fcfdb5f0, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000ec2a816e28, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800ef451e8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000fa4c7468a8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000e6e76f40f8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000c4b401f2b8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800f8440c8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800ec91a40, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000fa7788d7e0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000e66c0771d8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000d1506efc60, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000cc9dc2ab28, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800ed309e8, %r1, %r9
	setx	0xb514e2a899662985, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800fe878a8, %r1, %r9
	setx	0x3931b9ac8a07564b, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c4669fad00, %r1, %r9
	setx	0x6a7f87809080dd2d, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000deef4184c8, %r1, %r9
	setx	0xdb084fa36ceaff69, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e1632108a8, %r1, %r9
	setx	0xe327a2b322227dfa, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000fe164ed928, %r1, %r9
	setx	0xec912b08df06942e, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e1f9ad8, %r1, %r9
	setx	0x13bffd2f41cfd576, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800ff72830, %r1, %r9
	setx	0xd130d6af530abcd5, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c86e072768, %r1, %r9
	setx	0x0c62b43029f24e55, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000dd7bcbc700, %r1, %r9
	setx	0x286bf6446264993e, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e2c809f6a0, %r1, %r9
	setx	0xfd7e603b33513396, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f4621a68d8, %r1, %r9
	setx	0xd6ca6ff73ff58870, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800efa40a8, %r1, %r9
	setx	0xea4b31cfde5a3cd6, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f0e21e0, %r1, %r9
	setx	0xd162041b7e784d2e, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000ce050bfc68, %r1, %r9
	setx	0xb2e5eea8e7899cb8, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000daca097e08, %r1, %r9
	setx	0xcecea13ae21c4bb0, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e178831580, %r1, %r9
	setx	0xef1b481b54e7384c, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f824e2e7b8, %r1, %r9
	setx	0xa05cd7f31389b6d3, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800ece5d78, %r1, %r9
	setx	0xe94ec94956501c97, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800fba3388, %r1, %r9
	setx	0x0b4ae07093c2ff78, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ce28a98050, %r1, %r9
	setx	0x069a2cb9001bf77b, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000df9d5c29d8, %r1, %r9
	setx	0xc719021b033f0094, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000eb5526eeb8, %r1, %r9
	setx	0x5dfb56f76b29f956, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f8ab3824f8, %r1, %r9
	setx	0x808212dbd06a7422, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f41c857d98, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000e898fc6ce8, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000d38ebf5940, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000de886f30e8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000c56f6b95b8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800f412ab8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800ef81e68, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000f81e89cbc8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000f6cb8965c0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800eedec48, %r1, %r9
	setx	0x6d97b1efe044920b, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f768608, %r1, %r9
	setx	0xc0a9341c9f699c86, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c41ef3fdd8, %r1, %r9
	setx	0xb3fa090bb53db36d, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d422862068, %r1, %r9
	setx	0x9370751941f33478, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e08eb1a5b0, %r1, %r9
	setx	0xfe15156fb88a7d74, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000fa01eb1a40, %r1, %r9
	setx	0xb60bcdd47492f52c, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800ecd2520, %r1, %r9
	setx	0xde71ae35bf5dd94e, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f876438, %r1, %r9
	setx	0xf357ee0fbde88c0c, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000cce4ccf988, %r1, %r9
	setx	0x09dd2db900e4fc5c, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d9aca8a0e0, %r1, %r9
	setx	0x1d662df55cee6a34, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e2afc756c8, %r1, %r9
	setx	0xa161d7a4d7290bea, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f08b2e9cb8, %r1, %r9
	setx	0x206d05cef9fd0ed7, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800ee00cd8, %r1, %r9
	setx	0x814729fbfcd2f428, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f44cc78, %r1, %r9
	setx	0x2631f923d518f74a, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c6172bc038, %r1, %r9
	setx	0xd8b970d4e2e53772, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d02e9185e0, %r1, %r9
	setx	0x42c394e9242dfb52, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e6aa297050, %r1, %r9
	setx	0x161d34d09523c2ee, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000fe879fa870, %r1, %r9
	setx	0xa69b2146331a5d4e, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e895440, %r1, %r9
	setx	0xe9d2b804043f8e72, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f2a76a0, %r1, %r9
	setx	0xc13a29b211def33f, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c7e30a88b0, %r1, %r9
	setx	0x621de2586101f9bb, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000dbee22b6d8, %r1, %r9
	setx	0x5c53494bba54812a, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ea59d50af8, %r1, %r9
	setx	0xc11c94811778968b, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000faa469fa08, %r1, %r9
	setx	0x3534af4fc3e2a827, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ef58442a28, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000d0133c5190, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000ccd35f8a50, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800f8900e8, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800ebe1208, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000f0764054d0, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000ebd2387b60, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800eab2e98, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000f0c25c2658, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000ef3eb6ff30, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000dfaa7f3080, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000e543ba24d0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000d2d635f180, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e1edaa0, %r1, %r9
	setx	0x5e7373527133adae, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f58b3c0, %r1, %r9
	setx	0xff9c7669a02c4bba, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c27538b7c8, %r1, %r9
	setx	0x6b5c1446493aaced, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d17db07048, %r1, %r9
	setx	0x93aba734d3ec1ad2, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e365f74750, %r1, %r9
	setx	0x58761088bb04e08a, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000fe84652be8, %r1, %r9
	setx	0xb790db5301358595, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e00a8b8, %r1, %r9
	setx	0x900b7cf82548d7a9, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f3e8f70, %r1, %r9
	setx	0x5a4199c24d4367f5, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c762c91300, %r1, %r9
	setx	0x840c67c4c30bdec7, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000defa6d01f0, %r1, %r9
	setx	0xd55cefc61e28fb49, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e49c49a5b0, %r1, %r9
	setx	0x3e9194fef972ac1b, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000fec8c410c0, %r1, %r9
	setx	0x7665ef0945a56eed, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e1d1ec8, %r1, %r9
	setx	0xb0332a754df53de5, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800fa994f8, %r1, %r9
	setx	0x9e5b8c25c172c9b7, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c340399c40, %r1, %r9
	setx	0x423878b445a32132, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000ddbb5def38, %r1, %r9
	setx	0x8b982bc4c419bc72, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e81a352ec8, %r1, %r9
	setx	0xc460016544ef2885, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f6e07f0260, %r1, %r9
	setx	0xa85aa64fc5461d43, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e498188, %r1, %r9
	setx	0xe98bb5d22b27cbea, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f9eebd8, %r1, %r9
	setx	0x98e7b92926847920, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ce72ff8700, %r1, %r9
	setx	0x8c2ef839940a6836, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d8ff13dcd0, %r1, %r9
	setx	0x1c8ef9fb9ee21c24, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000eb213087e0, %r1, %r9
	setx	0x3c4d5d9e9ac531ca, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f4291ba1c8, %r1, %r9
	setx	0xc333628e6e80e178, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c11fa14e80, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800f056ec0, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800ec28480, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000f204331510, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000ef217bf668, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000df571ddeb8, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000c99fc6a718, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800f73bc28, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800ec07408, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000fc45516e18, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000e57566d840, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000d26ec2b450, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800fb469d8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e569f70, %r1, %r9
	setx	0x4732f4358e36e58c, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f859a68, %r1, %r9
	setx	0xd360bef35c6f64b4, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000caf570faa8, %r1, %r9
	setx	0xe995ca41dd15a9d0, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000da5d7cf7f0, %r1, %r9
	setx	0x8ec91f955994106d, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e6bb0ae1a8, %r1, %r9
	setx	0x0dbf10110e0600d0, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f69cb8f138, %r1, %r9
	setx	0xefa3a5919eaea1ed, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e1cee20, %r1, %r9
	setx	0xba50a1967d5afd94, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800ffeeb58, %r1, %r9
	setx	0xaa89b72d4b7d0aae, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c074c6e060, %r1, %r9
	setx	0x338a9b2bc24d6b35, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d76d029318, %r1, %r9
	setx	0xc3c73dab6992056d, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000efc6e2de48, %r1, %r9
	setx	0x6c7b5e8a058e9366, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f80352d828, %r1, %r9
	setx	0xdd19caefb06cb0de, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e471128, %r1, %r9
	setx	0x85131ec6cf44247b, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800fa84bd8, %r1, %r9
	setx	0xdc4e4798c106da05, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c9a754c468, %r1, %r9
	setx	0xd4afe8a3e6c873e1, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000dc7afa7a18, %r1, %r9
	setx	0x89f4cd9e54de0822, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000ea57df3e08, %r1, %r9
	setx	0x79650abb26246863, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f66ed76650, %r1, %r9
	setx	0x45ea3e3d250e61e9, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e7dde28, %r1, %r9
	setx	0xd703f6ad71a532fe, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f2e3448, %r1, %r9
	setx	0x3a846f3c4bc2b365, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000cbd1fb7ac8, %r1, %r9
	setx	0x2493d5b4fc9de704, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000daf94fbd00, %r1, %r9
	setx	0xb0bd5b841ea87790, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e1fdb998c8, %r1, %r9
	setx	0x879c1b5639a0e1c9, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f02fce7d68, %r1, %r9
	setx	0x331d589380117aae, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000cae5697ca8, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000d5cb8868e8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000cb97da1030, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800fcbf290, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e72ea40, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000c50947fef8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800f130938, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000eb722516b8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000d14a238a28, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000cb43501338, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800f504aa0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e443e30, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000f4d643cb18, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000e48f9f2a58, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800ebb2dd0, %r1, %r9
	setx	0x0660f4cdf08c4bf4, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f256220, %r1, %r9
	setx	0x368f89969a27513c, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c3ad1a4688, %r1, %r9
	setx	0xda12d9b548b814cb, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d2eb71c488, %r1, %r9
	setx	0x58d406606e1ffa02, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000eee672cc60, %r1, %r9
	setx	0x6bdfaa08a8f7c808, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f6c12e4198, %r1, %r9
	setx	0x54a1956ab7a7383b, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e92a290, %r1, %r9
	setx	0x8d34455f145cc69d, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f0e0c58, %r1, %r9
	setx	0xd2a9cc89abe02d0c, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c18336fdd0, %r1, %r9
	setx	0xb8747cf9c4dc66f6, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000db0039be60, %r1, %r9
	setx	0x3a83e1876b548fa0, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e05e0d5fd0, %r1, %r9
	setx	0x2301f62973681d22, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000fcdde6c210, %r1, %r9
	setx	0xa0a7129fb4a03954, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e618040, %r1, %r9
	setx	0x597d20b802e7844a, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800fc75490, %r1, %r9
	setx	0x65d688226b1bedcb, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000ce67008368, %r1, %r9
	setx	0x3b0914fa4c8df651, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000df1382f6f8, %r1, %r9
	setx	0x2a9a7db34f7f6779, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e47073f4c0, %r1, %r9
	setx	0x498dda5065824169, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f6e973e8b8, %r1, %r9
	setx	0xf0606da026fee925, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800efd3730, %r1, %r9
	setx	0x7f85ebc09def18fd, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800ff171d0, %r1, %r9
	setx	0x0e31e9d14064ed68, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c1d65ce650, %r1, %r9
	setx	0x0ccdb04815405ebf, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d0b078f738, %r1, %r9
	setx	0xe9e42dffa5151d93, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000eb4baf4e68, %r1, %r9
	setx	0x4594942d6bb3134c, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f0fbe217b0, %r1, %r9
	setx	0x2e120f6cd34fee80, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000fc76e5af68, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000e526a62fa0, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000fae40332e0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000e83fe46a40, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d5df1ccec8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000c97920e0c0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800ffae0b0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e6a5178, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000f2764f1148, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000ec0c2b3988, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000de14c48748, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000d96628fa70, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000ca43712328, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800fc06a38, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e83b7f8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800efc1cb8, %r1, %r9
	setx	0x9e1089de8d3b1fd6, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f628b38, %r1, %r9
	setx	0xbf0ef31d3874a327, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c3912cc218, %r1, %r9
	setx	0xa7137e48d8ebf192, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d7a8fd87a8, %r1, %r9
	setx	0x5da5adef94414d17, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e5ef78efa8, %r1, %r9
	setx	0xb937e56a25011459, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f01ced0be0, %r1, %r9
	setx	0xdf0f37d77d0cfe37, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e21fbd0, %r1, %r9
	setx	0x17aecc41acb0e790, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f3412a0, %r1, %r9
	setx	0xdf6bbc2f03ed0d4e, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c26fca0dd8, %r1, %r9
	setx	0x1778d9fee2e37fe7, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d654ed7450, %r1, %r9
	setx	0xe35a3f314259e9cc, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000ef85e3d510, %r1, %r9
	setx	0xa548cc2c5d30d84e, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f09447d1d0, %r1, %r9
	setx	0xa94b9b8e6d1c314d, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e1b3a50, %r1, %r9
	setx	0xdcd3c03738d85ebc, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f021910, %r1, %r9
	setx	0xc16c9006f10b25a7, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c617435708, %r1, %r9
	setx	0xa442ec9fdb9dad0a, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d4e4c099d8, %r1, %r9
	setx	0x5a66102489f788ec, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e2c8b9a358, %r1, %r9
	setx	0x4ab0ababd86b76c7, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000faf66b7d28, %r1, %r9
	setx	0x1b269e545801b41c, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e8f6af0, %r1, %r9
	setx	0x909fa13b6a423484, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800fbcaf60, %r1, %r9
	setx	0xe8aa0b5b74c8b9b8, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000cb880b0450, %r1, %r9
	setx	0x0f8c376486ab76d8, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000dc74b2b378, %r1, %r9
	setx	0x41a29699f99d428f, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e25a693e38, %r1, %r9
	setx	0xbfdd27ac6d1feeb2, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f441d536e8, %r1, %r9
	setx	0xcc354bb355f4c4c5, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f654d0c188, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000e7f76add28, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000e0e1adcc58, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000d8284fe528, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000ca16924278, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800f66cf08, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800e7224b0, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000ee12ed1560, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000db948c6800, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000c3fd94b230, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e6d5238, %r1, %r9
	setx	0x3a2f490070829648, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800fbd9a48, %r1, %r9
	setx	0x39c6e418a36cbbe9, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000cfbda1d378, %r1, %r9
	setx	0xfe8c32cb5acb1849, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000de7a31e670, %r1, %r9
	setx	0x09015ea4b172bdfe, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e9d7873320, %r1, %r9
	setx	0x72c904b058513444, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f482132068, %r1, %r9
	setx	0xe5751d82631dd0c1, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e011660, %r1, %r9
	setx	0xda54bc8f04c2b13e, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f3ac1f8, %r1, %r9
	setx	0x0842bf7aa0043204, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000cd601d29a8, %r1, %r9
	setx	0x223cddb80e940399, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d5e6666220, %r1, %r9
	setx	0x90e699c80904ea1c, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000ef99c95448, %r1, %r9
	setx	0x6ae90e70e6be9ffe, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000fa01f2ca80, %r1, %r9
	setx	0x8d56af630371b933, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800ec9af68, %r1, %r9
	setx	0xc025a662325cc6a9, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f4a1440, %r1, %r9
	setx	0xf3a2213220cc949b, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c544ec0868, %r1, %r9
	setx	0xea1449813448cd45, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d098c5c038, %r1, %r9
	setx	0xed029d3d95d7228f, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000ec29ef7940, %r1, %r9
	setx	0x6d70801ed39775c3, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f6e9002a18, %r1, %r9
	setx	0x89dd8e12230162af, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e16d158, %r1, %r9
	setx	0xa2de3e9ec2681105, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f285260, %r1, %r9
	setx	0x16327b13be80e7f8, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c87aa5dd18, %r1, %r9
	setx	0x8b5c61e04dd4148a, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d03a071e18, %r1, %r9
	setx	0xa8856804f90fc858, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e9c9278c40, %r1, %r9
	setx	0x40ac9f6269a46976, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f217cada98, %r1, %r9
	setx	0xfd2303c2a022f85c, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000cdb4cba930, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800f4bae10, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800f380268, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e88b4a8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000f47ee78520, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000efe7cccb70, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d88438b4f8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000ce0cd733f8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800f5e9840, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e25b938, %r1, %r9
	setx	0xd6cc04485db9a841, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f6b2640, %r1, %r9
	setx	0xe2ceb2539cba4ce7, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c2297d1660, %r1, %r9
	setx	0x01840a56a110d929, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000da08a26df8, %r1, %r9
	setx	0x7494a2ab36bfbb25, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ea819cf448, %r1, %r9
	setx	0x5019f06bd2ce8098, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f2a3a2a6f0, %r1, %r9
	setx	0x1cdc6ccdb7a8e16e, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e92d518, %r1, %r9
	setx	0x55fd5593c0da485f, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f4debd0, %r1, %r9
	setx	0x1d235970c6c0cb56, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000cfd935de40, %r1, %r9
	setx	0xf56a28c176cebd81, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000dfb2440768, %r1, %r9
	setx	0xbf697c55befaa2f5, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e5d52468a0, %r1, %r9
	setx	0x1a3e8295f1896e0d, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000faa3088348, %r1, %r9
	setx	0xaeca274677e8aa9b, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800ec45638, %r1, %r9
	setx	0x9b4c649caba53af5, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f7bb440, %r1, %r9
	setx	0x18b6fd5f4a2e41ad, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000ce20ebcf00, %r1, %r9
	setx	0xa4ae804c480edfab, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d6e00b3048, %r1, %r9
	setx	0xac77b6608194bb63, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e21d58e0a0, %r1, %r9
	setx	0xd1cf07c6f2e5d864, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f2c0f18ba0, %r1, %r9
	setx	0x4ab8895e18d7be7a, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e678760, %r1, %r9
	setx	0x7a96dd0003cc3c57, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f156e08, %r1, %r9
	setx	0xe4f1b3ff87b85fbb, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c9176f94c8, %r1, %r9
	setx	0x5c52a166ed5c1b8c, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d28f305350, %r1, %r9
	setx	0xe3b57623b06d6ee8, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000eb3cf45898, %r1, %r9
	setx	0x5072142dad520175, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000fa7ece6588, %r1, %r9
	setx	0x722cf7a0cad8e335, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c6363bf740, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800f206f88, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800ebaea48, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800e7e9548, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000fc169509c8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000e2153dcba0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d3f57bfb78, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000c145c11b70, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800ffcc9f8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e3dd4e0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d3e4b53988, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000cf7d3c78c0, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800fa6f4e0, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800e23df48, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000f84a912450, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000ebd775b4b8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000d2c29cc7a0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000c661ebd620, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800ead77a8, %r1, %r9
	setx	0xcdc37baeee7e8623, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800ff4f8a0, %r1, %r9
	setx	0xa7ee138a3a488386, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ca40a709d0, %r1, %r9
	setx	0xaeb06213a7a09fb3, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d1a0a76480, %r1, %r9
	setx	0x1c3e478b15483f04, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e3ba212218, %r1, %r9
	setx	0x436f93412ebc39a3, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000fcb52899e8, %r1, %r9
	setx	0x367de6e47998389f, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e7af910, %r1, %r9
	setx	0x4114083686fafab1, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800fc694f0, %r1, %r9
	setx	0x7e9bf28189d5d19d, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c1676624f8, %r1, %r9
	setx	0xa7561fa9b0f5f60c, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d0a08f6b48, %r1, %r9
	setx	0xf9c60a3673c0814d, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e3616cd830, %r1, %r9
	setx	0xa4a20ae35a2a3959, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000fc53b02fb0, %r1, %r9
	setx	0x6f4c48a67dc02742, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e7dd758, %r1, %r9
	setx	0xc3923c0d3762b98a, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800fab5e30, %r1, %r9
	setx	0xe090ee2aa92acb9e, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000cb6d336dd8, %r1, %r9
	setx	0xbb4c2979f408f816, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d22fa8e4b0, %r1, %r9
	setx	0x073ca72b20a2c666, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e78ce74a28, %r1, %r9
	setx	0xfc188d34c90e68b0, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f0aab82f20, %r1, %r9
	setx	0xdc3c489910da86af, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e3ca410, %r1, %r9
	setx	0x6ae7d421c2e2a87c, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f7f1138, %r1, %r9
	setx	0x3d2581a1f4c7eaed, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c690f9f770, %r1, %r9
	setx	0x11efb61fb90d595c, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d2564f1380, %r1, %r9
	setx	0xdb3c099ac84b8a75, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ed6fbada68, %r1, %r9
	setx	0x4040ab9deac81b45, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000fcb65d6c10, %r1, %r9
	setx	0xa22dcd1c804658b0, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e1917fa4a0, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000dfdbbfc4c0, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000c2c0361098, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800ffbd020, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800e2ce7a8, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000f84601d1e8, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000ec89074d08, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800e3a0c30, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000feeb326750, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000e71d89e638, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d41bb67380, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e0d3190, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000f6d41d7790, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000c1a9dccb80, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800f289138, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e9e17c0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000f872abb418, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000ecb9193ff8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000d8136be4e0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000c4f7c4b1b8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e715648, %r1, %r9
	setx	0x6670d444074a225c, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f6a8dc0, %r1, %r9
	setx	0x8358c9c05dcc58e2, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ce21544a20, %r1, %r9
	setx	0xfdd39a9c3f5587de, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d0df5cb8c0, %r1, %r9
	setx	0x66c2c620fea4540b, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ec9098eaf8, %r1, %r9
	setx	0x0cf7886c74abca17, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f6387b45b0, %r1, %r9
	setx	0x28689e8987d31bfd, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800eb7cb60, %r1, %r9
	setx	0xfcaff224643534be, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f583280, %r1, %r9
	setx	0x20a9d7cdeaf35a3d, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c7f8e0db28, %r1, %r9
	setx	0xdeb33a53437ed63d, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d2fce299b0, %r1, %r9
	setx	0xa8f6154eefcf47f6, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e029d6afd8, %r1, %r9
	setx	0x4ca39f1fdbc1a5e3, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000fc7036dad8, %r1, %r9
	setx	0x8d3f9dfd06984d98, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e97d470, %r1, %r9
	setx	0x2d7b901d5b3a0072, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800fbaade0, %r1, %r9
	setx	0x29b22076c6c4a308, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000ccc00efb00, %r1, %r9
	setx	0x61ef59a4bc2f83bd, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d399748630, %r1, %r9
	setx	0xb01c44fb424e2d68, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000eafb533e58, %r1, %r9
	setx	0x81552584c17cbe83, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000fc85221ab8, %r1, %r9
	setx	0xd9554d2348173eb5, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e354ff8, %r1, %r9
	setx	0xc4240d9451565b02, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f4417a0, %r1, %r9
	setx	0xe1fb10f807bc892f, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c5e2d13938, %r1, %r9
	setx	0x718c18babff995d6, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d0f1f19da0, %r1, %r9
	setx	0x053382c753306bab, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ecce8b8b30, %r1, %r9
	setx	0x01944a6d2ea12ce4, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000fa28b15760, %r1, %r9
	setx	0x45731da3c8eaee6c, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c175b588e8, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800ffbb4e0, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800eeade60, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000e6fa317eb8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000dbea0b8398, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000c5acdb38f8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800f3c6510, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e7e9548, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000f032ce4268, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000e1dcfe93f0, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000d67b007be0, %r1, %r12
	lduw	[%r12], %r11


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
!!#   uint64 jbi1, jbi2, jbi3, jbi4, jbi5, jbi6, jbi_addr;
!!#   int addr_sel = 0;
!!#   int store_addr = 0;
!!#   int rnd_cnt = 0;
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
!!#   IJ_set_rvar ("diag.j", 99, rv_0, "{11}");
!!# 
!!#   IJ_set_rvar ("diag.j", 102, Rv_rand64, "64'hrrrr rrrr rrrr rrrr");
!!#   IJ_set_rvar ("diag.j", 103, Rv_Simm13, "13'b0 0000 00rr r000");
!!#   IJ_set_rvar ("diag.j", 104, Rv_addr_sel, "3'brrr");
!!# 
!!#   IJ_set_rvar ("diag.j", 108, Rv_memaddr_pattern_dma,
!!#         "24'{0},"
!!# 
!!#         "20'b 000r rrrr rrrr rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rr00 0000,");
!!# 
!!#   ! only 60* or 61*
!!#   IJ_set_rvar ("diag.j", 117, Rv_memaddr_pattern_io,
!!#         "4'{0},"
!!# 
!!#         "20'b 0000 0000 0000 0000 0110,"
!!#         "20'b 000r rrrr rrrr rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rr00 0000,");
!!# 
!!#   IJ_set_rvar ("diag.j", 126, Rv_rand32, "32'hrrrr rrrr");
!!#   IJ_set_rvar ("diag.j", 127, Rv_rand_mask, "32'h0000 rrrr");
!!# 
!!#   ! Define address patterns for all the various address
!!#   ! spaces in JBI
!!# 
!!#   ! 80_1000_0000 - 80_FFFF_FFFF (Should not be 80_0*)
!!#   IJ_set_rvar ("diag.j", 133, Rv_jbiaddr_pattern0,
!!#         "24'{0},"
!!# 
!!#         "20'b 1000 rrr1 rrrr rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr r000,");
!!# 
!!#   ! 80_0E00_0000 - 80_0EFF_FFFF
!!#   IJ_set_rvar ("diag.j", 142, Rv_jbiaddr_pattern1,
!!#         "24'{0},"
!!# 
!!#         "20'b 1000 0000 0000 1110 rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr r000,");
!!# 
!!#   ! 80_0F00_0000 - 80_0FFF_FFFF
!!#   IJ_set_rvar ("diag.j", 152, Rv_jbiaddr_pattern2,
!!#         "24'{0},"
!!# 
!!#         "20'b 1000 0000 0000 1111 rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr r000,");
!!# 
!!#   ! C0_0000_0000 - CF_FFFF_FFFF
!!#   IJ_set_rvar ("diag.j", 162, Rv_jbiaddr_pattern3,
!!#         "24'{0},"
!!# 
!!#         "20'b 1100 rrrr rrrr rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr r000,");
!!# 
!!#   ! D0_0000_0000 - DF_FFFF_FFFF
!!#   IJ_set_rvar ("diag.j", 172, Rv_jbiaddr_pattern4,
!!#         "24'{0},"
!!# 
!!#         "20'b 1101 rrrr rrrr rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr r000,");
!!# 
!!#   ! E0_0000_0000 - EF_FFFF_FFFF
!!#   IJ_set_rvar ("diag.j", 182, Rv_jbiaddr_pattern5,
!!#         "24'{0},"
!!# 
!!#         "20'b 1110 rrrr rrrr rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr r000,");
!!# 
!!#   ! F0_0000_0000 - FE_FFFF_FFFF ( Should not be FF*)
!!#   IJ_set_rvar ("diag.j", 192, Rv_jbiaddr_pattern6,
!!#         "24'{0},"
!!# 
!!#         "20'b 1111 rrr0 rrrr rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr r000,");
!!# 
!!#   ! FF_F000_0000 - FF_FFFF_FFFF 
!!#   IJ_set_rvar ("diag.j", 202, Rv_ssiaddr_pattern,
!!#         "24'{0},"
!!# 
!!#         "20'b 1111 1111 1111 rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr r000,");
!!# 
!!#   IJ_set_ropr_fld    ("diag.j", 210, ijdefault, Ft_Rs1, "{9}");  ! BASE
!!#   IJ_set_ropr_fld    ("diag.j", 211, ijdefault, Ft_Rs2, "{8}");
!!#   IJ_set_ropr_fld    ("diag.j", 212, ijdefault, Ft_Rd, "{16..23}");
!!# 
!!#   !IJ_set_ropr_fld    (ijdefault, Ft_Simm13, "13'b0 0000 0000 0000");
!!#   IJ_set_ropr_fld    ("diag.j", 215, ijdefault, Ft_Simm13, "13'b0 00rr 0000 0000");
!!# 
!!#   IJ_bind_file_group("diag.j", 218, sjm_4,"sjm_4.cmd", NULL);;
!!#   IJ_bind_file_group("diag.j", 219, sjm_5,"sjm_5.cmd", NULL);;
!!# 
!!#   IJ_bind_thread_group("diag.j", 222, th_M, 0x1);
!!# 
!!#   IJ_printf ("diag.j", 224, sjm_4, "CONFIG id=28 iosyncadr=0x7CF00BEEF00\n");
!!#   IJ_printf ("diag.j", 225, sjm_4, "TIMEOUT 10000000\n");
!!#   IJ_printf ("diag.j", 226, sjm_4, "IOSYNC\n");
!!# 
!!#   IJ_printf ("diag.j", 228, sjm_4, "#==================================================\n");
!!#   IJ_printf ("diag.j", 230, sjm_4, "#==================================================\n");
!!#   IJ_printf ("diag.j", 231, sjm_4, "\n\nLABEL_0:\n");
!!# 
!!#   IJ_printf ("diag.j", 234, sjm_5, "CONFIG id=30 iosyncadr=0x7EF00BEEF00\n");
!!#   IJ_printf ("diag.j", 235, sjm_5, "TIMEOUT 10000000\n");
!!#   IJ_printf ("diag.j", 236, sjm_5, "IOSYNC\n");
!!#   IJ_printf ("diag.j", 237, sjm_5, "#==================================================\n");
!!#   IJ_printf ("diag.j", 239, sjm_5, "#==================================================\n");
!!#   IJ_printf ("diag.j", 240, sjm_5, "\n\nLABEL_0:\n");
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
!!#   IJ_printf ("diag.j", 256, sjm_4, "\n\nBA LABEL_0\n");
!!#   IJ_printf ("diag.j", 257, sjm_5, "\n\nBA LABEL_0\n");
!!#   IJ_th_start ("diag.j", 258,Seq_Start, NULL, 2);
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
!!# 		IJ_generate ("diag.j", 386, th_M, $2);
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
!!#                    IJ_printf ("diag.j", 414, sjm_4, "\n");
!!#                      sjm4_cnt++;
!!# 
!!#                      sj4_ad =  IJ_get_rvar_val64("diag.j", 417, Rv_memaddr_pattern_dma);
!!#                      sjm0_addr[sjm_wr0] = sj4_ad; 
!!#                      IJ_printf ("diag.j", 419, sjm_4, "WRITEBLK  0x%016llx +\n",sj4_ad);
!!#                      IJ_update_rvar("diag.j", 420, Rv_memaddr_pattern_dma);
!!# 
!!#                       for (i=0;i<16;i++) { 
!!#                          !IJ_printf (sjm_4, "# debug %d \n",i);
!!#                          sjm0_data[sjm_wr0][i] = IJ_get_rvar_val32("diag.j", 424, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 425, Rv_rand32);
!!#                          if (i%4 == 0) {IJ_printf ("diag.j", 426, sjm_4, "        "); }
!!#                          IJ_printf ("diag.j", 427, sjm_4, "0x%08x ",sjm0_data[sjm_wr0][i]);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 429, sjm_4, "\n"); else 
!!#                             IJ_printf ("diag.j", 430, sjm_4, "+\n");
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
!!#                    IJ_printf ("diag.j", 443, sjm_4, "\n");
!!#                      sjm4_cnt--;
!!# 
!!#                      sj4_ad = sjm0_addr[sjm_rd0];
!!#                      IJ_printf ("diag.j", 448, sjm_4, "READBLK  0x%016llx +\n",sj4_ad);
!!# 
!!#                       for (i=0;i<16;i++) { 
!!#                          sjm4_dat = sjm0_data[sjm_rd0][i];
!!#                          if (i%4 == 0) IJ_printf ("diag.j", 452, sjm_4, "        ");
!!#                          IJ_printf ("diag.j", 453, sjm_4, "0x%08x ",sjm4_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 455, sjm_4, "\n"); else 
!!#                             IJ_printf ("diag.j", 456, sjm_4, "+\n");
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
!!#                    IJ_printf ("diag.j", 470, sjm_4, "\n");
!!#                      !sjm4_cnt--;
!!# 
!!#  		     sjm0_w_mask =  IJ_get_rvar_val32("diag.j", 474, Rv_rand_mask);
!!#                      IJ_update_rvar("diag.j", 475, Rv_rand_mask);
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
!!#                      IJ_printf ("diag.j", 492, sjm_4, "WRITEMSK  0x%016llx 0x%016llx +\n",sj4_ad,mask);
!!# 
!!#                       m_tmp = sjm0_w_mask;
!!#                       for (i=0;i<16;i++) { 
!!#                        if (m_tmp & 0x1 ) {
!!#                          sjm0_data[sjm_rd0][i] = IJ_get_rvar_val32("diag.j", 497, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 498, Rv_rand32);
!!#                          sjm4_dat = sjm0_data[sjm_rd0][i];
!!#                          if (i%4 == 0) IJ_printf ("diag.j", 500, sjm_4, "        ");
!!#                          IJ_printf ("diag.j", 501, sjm_4, "0x%08x ",sjm4_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 503, sjm_4, "\n"); else 
!!#                             IJ_printf ("diag.j", 504, sjm_4, "+\n");
!!#                            }
!!#                         } else {
!!#                          !sjm4_dat = sjm0_data[sjm_rd0][i];
!!#                          sjm4_dat = 0;
!!#                          if (i%4 == 0) IJ_printf ("diag.j", 509, sjm_4, "        ");
!!#                          IJ_printf ("diag.j", 510, sjm_4, "0x%08x ",sjm4_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 512, sjm_4, "\n"); else 
!!#                             IJ_printf ("diag.j", 513, sjm_4, "+\n");
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
!!#                    IJ_printf ("diag.j", 530, sjm_4, "\n");
!!#                      sjm4_cnt_io++;
!!# 
!!#                      sj4_ad =  IJ_get_rvar_val64("diag.j", 533, Rv_memaddr_pattern_io);
!!#                      sjm0_addr_io[sjm_wr0_io] = sj4_ad; 
!!#                      IJ_printf ("diag.j", 535, sjm_4, "WRITEBLKIO  0x%016llx +\n",sj4_ad);
!!#                      IJ_update_rvar("diag.j", 536, Rv_memaddr_pattern_io);
!!# 
!!#                       for (i=0;i<16;i++) { 
!!#                          !IJ_printf (sjm_4, "# debug %d \n",i);
!!#                          sjm0_data_io[sjm_wr0_io][i] = IJ_get_rvar_val32("diag.j", 540, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 541, Rv_rand32);
!!#                          if (i%4 == 0) {IJ_printf ("diag.j", 542, sjm_4, "        "); }
!!#                          IJ_printf ("diag.j", 543, sjm_4, "0x%08x ",sjm0_data_io[sjm_wr0_io][i]);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 545, sjm_4, "\n"); else 
!!#                             IJ_printf ("diag.j", 546, sjm_4, "+\n");
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
!!#                    IJ_printf ("diag.j", 559, sjm_4, "\n");
!!#                      sjm4_cnt_io--;
!!# 
!!#                      sj4_ad = sjm0_addr_io[sjm_rd0_io];
!!#                      IJ_printf ("diag.j", 564, sjm_4, "READBLKIO  0x%016llx +\n",sj4_ad);
!!# 
!!#                       for (i=0;i<16;i++) { 
!!#                          sjm4_dat = sjm0_data_io[sjm_rd0_io][i];
!!#                          if (i%4 == 0) IJ_printf ("diag.j", 568, sjm_4, "        ");
!!#                          IJ_printf ("diag.j", 569, sjm_4, "0x%08x ",sjm4_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 571, sjm_4, "\n"); else 
!!#                             IJ_printf ("diag.j", 572, sjm_4, "+\n");
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
!!#                    IJ_printf ("diag.j", 587, sjm_4, "\n");
!!#                      sjm4_cnt_io1++;
!!# 
!!#                      sj4_ad =  IJ_get_rvar_val64("diag.j", 590, Rv_memaddr_pattern_io);
!!#                      sjm0_addr_io1[sjm_wr0_io1] = sj4_ad; 
!!#                      IJ_printf ("diag.j", 592, sjm_4, "WRITEIO  0x%016llx ",sj4_ad);
!!#                      IJ_update_rvar("diag.j", 593, Rv_memaddr_pattern_io);
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
!!#                       IJ_printf ("diag.j", 608, sjm_4, "%d ",b_sz);
!!#                       for (i=0;i<4;i++) { 
!!#                          !IJ_printf (sjm_4, "# debug %d \n",i);
!!#                          sjm0_data_io1[sjm_wr0_io1][i] = IJ_get_rvar_val32("diag.j", 611, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 612, Rv_rand32);
!!#                          IJ_printf ("diag.j", 613, sjm_4, "0x%08x ",sjm0_data_io1[sjm_wr0_io1][i]);
!!#                          if((i==0) && ((b_sz == 1) | (b_sz == 2) | (b_sz == 4)) ) break; 
!!#                          if((i==1) && (b_sz == 8)) break; 
!!#                       }
!!#                       if ( random()%2 == 0) {
!!#                       IJ_printf ("diag.j", 618, sjm_4, "\n");
!!#                       } else {
!!#                       IJ_printf ("diag.j", 620, sjm_4, "\n");
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
!!#                    IJ_printf ("diag.j", 634, sjm_4, "\n");
!!#                      sjm4_cnt_io1--;
!!# 
!!#                      sj4_ad = sjm0_addr_io1[sjm_rd0_io1];
!!#                      b_sz   = sjm0_data_io1[sjm_rd0_io1][15];
!!#                      IJ_printf ("diag.j", 640, sjm_4, "READIO  0x%016llx %d ",sj4_ad,b_sz);
!!# 
!!#                       for (i=0;i<4;i++) {
!!#                          sjm4_dat = sjm0_data_io1[sjm_rd0_io1][i];
!!#                          IJ_printf ("diag.j", 644, sjm_4, "0x%08x ",sjm4_dat);
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
!!#                    IJ_printf ("diag.j", 659, sjm_4, "\n");
!!# 
!!#                      sj4_ad =  IJ_get_rvar_val64("diag.j", 661, Rv_memaddr_pattern_io);
!!#                      sjm0_addr_m_io[sjm_wr0_m_io] = sj4_ad; 
!!#                      IJ_update_rvar("diag.j", 663, Rv_memaddr_pattern_io);
!!# 
!!#                      sjm4_cnt_m_io++;
!!# 
!!#  		     sjm0_w_mask_m_io =  IJ_get_rvar_val32("diag.j", 669, Rv_rand_mask);
!!#                      IJ_update_rvar("diag.j", 670, Rv_rand_mask);
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
!!#                      IJ_printf ("diag.j", 697, sjm_4, "WRITEMSKIO  0x%016llx 0x%04x  ",sj4_ad,mask);
!!#                      sjm0_data_m_io[sjm_wr0_m_io][15] = mask; ! data fifo , 15 stores address
!!# 
!!#                       m_tmp = sjm0_w_mask_m_io & 0xf;
!!#                       for (i=0;i<4;i++) { 
!!#                        if (m_tmp & 0x1 ) {
!!#                          sjm0_data_m_io[sjm_wr0_m_io][i] = IJ_get_rvar_val32("diag.j", 703, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 704, Rv_rand32);
!!#                          sjm4_dat = sjm0_data_m_io[sjm_wr0_m_io][i];
!!#                          !if (i%4 == 0) IJ_printf (sjm_4, "        ");
!!#                          IJ_printf ("diag.j", 707, sjm_4, "0x%08x ",sjm4_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                              IJ_printf ("diag.j", 709, sjm_4, "\n"); 
!!#                             !if (i==15 ) IJ_printf (sjm_4, "\n"); else 
!!#                             !IJ_printf (sjm_4, "+\n");
!!#                            }
!!#                         } else {
!!#                          !sjm4_dat = sjm0_data[sjm_rd0][i];
!!#                          sjm4_dat = 0;
!!#                          sjm0_data_m_io[sjm_wr0_m_io][i] = sjm4_dat;
!!#                          !if (i%4 == 0) IJ_printf (sjm_4, "        ");
!!#                          IJ_printf ("diag.j", 718, sjm_4, "0x%08x ",sjm4_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             IJ_printf ("diag.j", 720, sjm_4, "\n"); 
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
!!#                    IJ_printf ("diag.j", 738, sjm_4, "\n");
!!#                      sjm4_cnt_m_io--;
!!# 
!!#                      sj4_ad = sjm0_addr_m_io[sjm_rd0_m_io];
!!#                      mask   = sjm0_data_m_io[sjm_rd0_m_io][15];
!!#                      IJ_printf ("diag.j", 744, sjm_4, "READMSKIO   0x%016llx 0x%04llx  ",sj4_ad,mask);
!!# 
!!#                       for (i=0;i<4;i++) { 
!!#                          sjm4_dat = sjm0_data_m_io[sjm_rd0_m_io][i];
!!#                          !if (i%4 == 0) IJ_printf (sjm_4, "        ");
!!#                          IJ_printf ("diag.j", 749, sjm_4, "0x%08x ",sjm4_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             IJ_printf ("diag.j", 751, sjm_4, "\n");
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
!!#                    IJ_printf ("diag.j", 769, sjm_5, "\n");
!!#                      sjm5_cnt++;
!!# 
!!#                      sj5_ad =  IJ_get_rvar_val64("diag.j", 772, Rv_memaddr_pattern_dma);
!!#                      sjm1_addr[sjm_wr1] = sj5_ad; 
!!#                      IJ_printf ("diag.j", 774, sjm_5, "WRITEBLK  0x%016llx +\n",sj5_ad);
!!#                      IJ_update_rvar("diag.j", 775, Rv_memaddr_pattern_dma);
!!# 
!!#                       for (i=0;i<16;i++) { 
!!#                          sjm1_data[sjm_wr1][i] = IJ_get_rvar_val32("diag.j", 778, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 779, Rv_rand32);
!!#                          if (i%4 == 0) IJ_printf ("diag.j", 780, sjm_5, "        ");
!!#                          IJ_printf ("diag.j", 781, sjm_5, "0x%08x ",sjm1_data[sjm_wr1][i]);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 783, sjm_5, "\n"); else 
!!#                             IJ_printf ("diag.j", 784, sjm_5, "+\n");
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
!!#                    IJ_printf ("diag.j", 797, sjm_5, "\n");
!!#                      sjm5_cnt--;
!!# 
!!#                      sj5_ad = sjm1_addr[sjm_rd1];
!!#                      IJ_printf ("diag.j", 802, sjm_5, "READBLK  0x%016llx +\n",sj5_ad);
!!# 
!!#                       for (i=0;i<16;i++) { 
!!#                          sjm5_dat = sjm1_data[sjm_rd1][i];
!!#                          if (i%4 == 0) IJ_printf ("diag.j", 806, sjm_5, "        ");
!!#                          IJ_printf ("diag.j", 807, sjm_5, "0x%08x ",sjm5_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 809, sjm_5, "\n"); else 
!!#                             IJ_printf ("diag.j", 810, sjm_5, "+\n");
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
!!#                    IJ_printf ("diag.j", 824, sjm_5, "\n");
!!#                      !sjm4_cnt--;
!!# 
!!#  		     sjm1_w_mask =  IJ_get_rvar_val32("diag.j", 828, Rv_rand_mask);
!!#                      IJ_update_rvar("diag.j", 829, Rv_rand_mask);
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
!!#                      IJ_printf ("diag.j", 846, sjm_5, "WRITEMSK  0x%016llx 0x%016llx +\n",sj5_ad,mask);
!!# 
!!#                       m_tmp = sjm1_w_mask;
!!#                       for (i=0;i<16;i++) { 
!!#                        if (m_tmp & 0x1 ) {
!!#                          sjm1_data[sjm_rd1][i] = IJ_get_rvar_val32("diag.j", 851, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 852, Rv_rand32);
!!#                          sjm5_dat = sjm1_data[sjm_rd1][i];
!!#                          if (i%4 == 0) IJ_printf ("diag.j", 854, sjm_5, "        ");
!!#                          IJ_printf ("diag.j", 855, sjm_5, "0x%08x ",sjm5_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 857, sjm_5, "\n"); else 
!!#                             IJ_printf ("diag.j", 858, sjm_5, "+\n");
!!#                            }
!!#                         } else {
!!#                          !sjm5_dat = sjm1_data[sjm_rd1][i];
!!#                          sjm5_dat = 0;
!!#                          if (i%4 == 0) IJ_printf ("diag.j", 863, sjm_5, "        ");
!!#                          IJ_printf ("diag.j", 864, sjm_5, "0x%08x ",sjm5_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 866, sjm_5, "\n"); else 
!!#                             IJ_printf ("diag.j", 867, sjm_5, "+\n");
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
!!#                    IJ_printf ("diag.j", 884, sjm_5, "\n");
!!#                      sjm5_cnt_io++;
!!# 
!!#                      sj5_ad =  IJ_get_rvar_val64("diag.j", 887, Rv_memaddr_pattern_io);
!!#                      sjm1_addr_io[sjm_wr1_io] = sj5_ad; 
!!#                      IJ_printf ("diag.j", 889, sjm_5, "WRITEBLKIO  0x%016llx +\n",sj5_ad);
!!#                      IJ_update_rvar("diag.j", 890, Rv_memaddr_pattern_io);
!!# 
!!#                       for (i=0;i<16;i++) { 
!!#                          !IJ_printf (sjm_5, "# debug %d \n",i);
!!#                          sjm1_data_io[sjm_wr1_io][i] = IJ_get_rvar_val32("diag.j", 894, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 895, Rv_rand32);
!!#                          if (i%4 == 0) {IJ_printf ("diag.j", 896, sjm_5, "        "); }
!!#                          IJ_printf ("diag.j", 897, sjm_5, "0x%08x ",sjm1_data_io[sjm_wr1_io][i]);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 899, sjm_5, "\n"); else 
!!#                             IJ_printf ("diag.j", 900, sjm_5, "+\n");
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
!!#                    IJ_printf ("diag.j", 913, sjm_5, "\n");
!!#                      sjm5_cnt_io--;
!!# 
!!#                      sj5_ad = sjm1_addr_io[sjm_rd1_io];
!!#                      IJ_printf ("diag.j", 918, sjm_5, "READBLKIO  0x%016llx +\n",sj5_ad);
!!# 
!!#                       for (i=0;i<16;i++) { 
!!#                          sjm5_dat = sjm1_data_io[sjm_rd1_io][i];
!!#                          if (i%4 == 0) IJ_printf ("diag.j", 922, sjm_5, "        ");
!!#                          IJ_printf ("diag.j", 923, sjm_5, "0x%08x ",sjm5_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 925, sjm_5, "\n"); else 
!!#                             IJ_printf ("diag.j", 926, sjm_5, "+\n");
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
!!#                    IJ_printf ("diag.j", 942, sjm_5, "\n");
!!#                      sjm5_cnt_io1++;
!!# 
!!#                      sj5_ad =  IJ_get_rvar_val64("diag.j", 945, Rv_memaddr_pattern_io);
!!#                      sjm1_addr_io1[sjm_wr1_io1] = sj5_ad; 
!!#                      IJ_printf ("diag.j", 947, sjm_5, "WRITEIO  0x%016llx ",sj5_ad);
!!#                      IJ_update_rvar("diag.j", 948, Rv_memaddr_pattern_io);
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
!!#                       IJ_printf ("diag.j", 963, sjm_5, "%d ",b_sz);
!!#                       for (i=0;i<4;i++) { 
!!#                          !IJ_printf (sjm_5, "# debug %d \n",i);
!!#                          sjm1_data_io1[sjm_wr1_io1][i] = IJ_get_rvar_val32("diag.j", 966, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 967, Rv_rand32);
!!#                          IJ_printf ("diag.j", 968, sjm_5, "0x%08x ",sjm1_data_io1[sjm_wr1_io1][i]);
!!#                          if((i==0) && ((b_sz == 1) | (b_sz == 2) | (b_sz == 4)) ) break; 
!!#                          if((i==1) && (b_sz == 8)) break; 
!!#                       }
!!#                       if ( random()%2 == 0) {
!!#                       IJ_printf ("diag.j", 973, sjm_5, "\n");
!!#                       } else {
!!#                       IJ_printf ("diag.j", 975, sjm_5, "\n");
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
!!#                    IJ_printf ("diag.j", 989, sjm_5, "\n");
!!#                      sjm5_cnt_io1--;
!!# 
!!#                      sj5_ad = sjm1_addr_io1[sjm_rd1_io1];
!!#                      b_sz   = sjm1_data_io1[sjm_rd1_io1][15];
!!#                      IJ_printf ("diag.j", 995, sjm_5, "READIO  0x%016llx %d ",sj5_ad,b_sz);
!!# 
!!#                       for (i=0;i<4;i++) {
!!#                          sjm5_dat = sjm1_data_io1[sjm_rd1_io1][i];
!!#                          IJ_printf ("diag.j", 999, sjm_5, "0x%08x ",sjm5_dat);
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
!!#                    IJ_printf ("diag.j", 1014, sjm_5, "\n");
!!# 
!!#                      sj5_ad =  IJ_get_rvar_val64("diag.j", 1016, Rv_memaddr_pattern_io);
!!#                      sjm1_addr_m_io[sjm_wr1_m_io] = sj5_ad; 
!!#                      IJ_update_rvar("diag.j", 1018, Rv_memaddr_pattern_io);
!!# 
!!#                      sjm5_cnt_m_io++;
!!# 
!!#  		     sjm1_w_mask_m_io =  IJ_get_rvar_val32("diag.j", 1024, Rv_rand_mask);
!!#                      IJ_update_rvar("diag.j", 1025, Rv_rand_mask);
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
!!#                      IJ_printf ("diag.j", 1052, sjm_5, "WRITEMSKIO  0x%016llx 0x%04x  ",sj5_ad,mask);
!!#                      sjm1_data_m_io[sjm_wr1_m_io][15] = mask; ! data fifo , 15 stores address
!!# 
!!#                       m_tmp = sjm1_w_mask_m_io & 0xf;
!!#                       for (i=0;i<4;i++) { 
!!#                        if (m_tmp & 0x1 ) {
!!#                          sjm1_data_m_io[sjm_wr1_m_io][i] = IJ_get_rvar_val32("diag.j", 1058, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 1059, Rv_rand32);
!!#                          sjm5_dat = sjm1_data_m_io[sjm_wr1_m_io][i];
!!#                          !if (i%4 == 0) IJ_printf (sjm_5, "        ");
!!#                          IJ_printf ("diag.j", 1062, sjm_5, "0x%08x ",sjm5_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                              IJ_printf ("diag.j", 1064, sjm_5, "\n"); 
!!#                             !if (i==15 ) IJ_printf (sjm_5, "\n"); else 
!!#                             !IJ_printf (sjm_5, "+\n");
!!#                            }
!!#                         } else {
!!#                          !sjm5_dat = sjm1_data[sjm_rd1][i];
!!#                          sjm5_dat = 0;
!!#                          sjm1_data_m_io[sjm_wr1_m_io][i] = sjm5_dat;
!!#                          !if (i%4 == 0) IJ_printf (sjm_5, "        ");
!!#                          IJ_printf ("diag.j", 1073, sjm_5, "0x%08x ",sjm5_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             IJ_printf ("diag.j", 1075, sjm_5, "\n"); 
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
!!#                    IJ_printf ("diag.j", 1093, sjm_5, "\n");
!!#                      sjm5_cnt_m_io--;
!!# 
!!#                      sj5_ad = sjm1_addr_m_io[sjm_rd1_m_io];
!!#                      mask   = sjm1_data_m_io[sjm_rd1_m_io][15];
!!#                      IJ_printf ("diag.j", 1099, sjm_5, "READMSKIO   0x%016llx 0x%04llx  ",sj5_ad,mask);
!!# 
!!#                       for (i=0;i<4;i++) { 
!!#                          sjm5_dat = sjm1_data_m_io[sjm_rd1_m_io][i];
!!#                          !if (i%4 == 0) IJ_printf (sjm_5, "        ");
!!#                          IJ_printf ("diag.j", 1104, sjm_5, "0x%08x ",sjm5_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             IJ_printf ("diag.j", 1106, sjm_5, "\n");
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
!!#                         jbi1 = IJ_get_rvar_val64("diag.j", 1127, Rv_jbiaddr_pattern1);
!!#                         jbi2 = IJ_get_rvar_val64("diag.j", 1128, Rv_jbiaddr_pattern2);
!!#                         jbi3 = IJ_get_rvar_val64("diag.j", 1129, Rv_jbiaddr_pattern3);
!!#                         jbi4 = IJ_get_rvar_val64("diag.j", 1130, Rv_jbiaddr_pattern4);
!!#                         jbi5 = IJ_get_rvar_val64("diag.j", 1131, Rv_jbiaddr_pattern5);
!!#                         jbi6 = IJ_get_rvar_val64("diag.j", 1132, Rv_jbiaddr_pattern6);
!!# 			IJ_update_rvar("diag.j", 1133, Rv_jbiaddr_pattern1);
!!# 			IJ_update_rvar("diag.j", 1134, Rv_jbiaddr_pattern2);
!!# 			IJ_update_rvar("diag.j", 1135, Rv_jbiaddr_pattern3);
!!# 			IJ_update_rvar("diag.j", 1136, Rv_jbiaddr_pattern4);
!!# 			IJ_update_rvar("diag.j", 1137, Rv_jbiaddr_pattern5);
!!# 			IJ_update_rvar("diag.j", 1138, Rv_jbiaddr_pattern6);
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
!!#                         b_ADDR_ARRAY[b_a_wr_cntr] = jbi1; b_a_wr_cntr = b_a_wr_cntr + 1; ! store the stx address
!!#                         b_ADDR_ARRAY[b_a_wr_cntr] = jbi2; b_a_wr_cntr = b_a_wr_cntr + 1; ! store the stx address
!!#                         b_ADDR_ARRAY[b_a_wr_cntr] = jbi3; b_a_wr_cntr = b_a_wr_cntr + 1; ! store the stx address
!!#                         b_ADDR_ARRAY[b_a_wr_cntr] = jbi4; b_a_wr_cntr = b_a_wr_cntr + 1; ! store the stx address
!!#                         b_ADDR_ARRAY[b_a_wr_cntr] = jbi5; b_a_wr_cntr = b_a_wr_cntr + 1; ! store the stx address
!!#                         b_ADDR_ARRAY[b_a_wr_cntr] = jbi6; b_a_wr_cntr = b_a_wr_cntr + 1; ! store the stx address
!!# 
!!#                         for (i=0;i<6;i++) {
!!#                         b_DATA_ARRAY[b_wr_cntr] = IJ_get_rvar_val64("diag.j", 1163, Rv_rand64);
!!# 			IJ_update_rvar("diag.j", 1164, Rv_rand64);
!!#                         data_st = b_DATA_ARRAY[b_wr_cntr];
!!#                         addr_st = b_ADDR_ARRAY[b_a_wr_cntr -6 + i];
!!#                         IJ_printf ("diag.j", 1167, th_M, "\tsetx\t0x%016llx, %%r1, %%r9\n",
!!#                                 addr_st);
!!#                         IJ_printf ("diag.j", 1169, th_M, "\tsetx\t0x%016llx, %%r1, %%r10\n",
!!#                                 data_st);
!!#                         IJ_printf ("diag.j", 1171, th_M, "\tstb\t%%r10, [%%r9]\n");
!!# 
!!#                         b_wr_cntr++;
!!#                         } ! end for 
!!# 
!!#                         ! HALF WORD
!!#                         ! add a mechanism to control addr1, addr5 in range ??
!!#                         ! addr
!!#                         jbi1 = IJ_get_rvar_val64("diag.j", 1180, Rv_jbiaddr_pattern1);
!!#                         jbi2 = IJ_get_rvar_val64("diag.j", 1181, Rv_jbiaddr_pattern2);
!!#                         jbi3 = IJ_get_rvar_val64("diag.j", 1182, Rv_jbiaddr_pattern3);
!!#                         jbi4 = IJ_get_rvar_val64("diag.j", 1183, Rv_jbiaddr_pattern4);
!!#                         jbi5 = IJ_get_rvar_val64("diag.j", 1184, Rv_jbiaddr_pattern5);
!!#                         jbi6 = IJ_get_rvar_val64("diag.j", 1185, Rv_jbiaddr_pattern6);
!!# 			IJ_update_rvar("diag.j", 1186, Rv_jbiaddr_pattern1);
!!# 			IJ_update_rvar("diag.j", 1187, Rv_jbiaddr_pattern2);
!!# 			IJ_update_rvar("diag.j", 1188, Rv_jbiaddr_pattern3);
!!# 			IJ_update_rvar("diag.j", 1189, Rv_jbiaddr_pattern4);
!!# 			IJ_update_rvar("diag.j", 1190, Rv_jbiaddr_pattern5);
!!# 			IJ_update_rvar("diag.j", 1191, Rv_jbiaddr_pattern6);
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
!!#                         h_DATA_ARRAY[h_wr_cntr] = IJ_get_rvar_val64("diag.j", 1207, Rv_rand64);
!!# 			IJ_update_rvar("diag.j", 1208, Rv_rand64);
!!#                         data_st = h_DATA_ARRAY[h_wr_cntr];
!!#                         addr_st = h_ADDR_ARRAY[h_a_wr_cntr -6 + i];
!!#                         IJ_printf ("diag.j", 1211, th_M, "\tsetx\t0x%016llx, %%r1, %%r9\n",
!!#                                 addr_st);
!!#                         IJ_printf ("diag.j", 1213, th_M, "\tsetx\t0x%016llx, %%r1, %%r10\n",
!!#                                 data_st);
!!#                         IJ_printf ("diag.j", 1215, th_M, "\tsth\t%%r10, [%%r9]\n");
!!# 
!!#                         h_wr_cntr++;
!!#                         } ! end for 
!!# 
!!#                         !  WORD
!!#                         ! add a mechanism to control addr1, addr5 in range ??
!!#                         ! addr
!!#                         jbi1 = IJ_get_rvar_val64("diag.j", 1224, Rv_jbiaddr_pattern1);
!!#                         jbi2 = IJ_get_rvar_val64("diag.j", 1225, Rv_jbiaddr_pattern2);
!!#                         jbi3 = IJ_get_rvar_val64("diag.j", 1226, Rv_jbiaddr_pattern3);
!!#                         jbi4 = IJ_get_rvar_val64("diag.j", 1227, Rv_jbiaddr_pattern4);
!!#                         jbi5 = IJ_get_rvar_val64("diag.j", 1228, Rv_jbiaddr_pattern5);
!!#                         jbi6 = IJ_get_rvar_val64("diag.j", 1229, Rv_jbiaddr_pattern6);
!!# 			IJ_update_rvar("diag.j", 1230, Rv_jbiaddr_pattern1);
!!# 			IJ_update_rvar("diag.j", 1231, Rv_jbiaddr_pattern2);
!!# 			IJ_update_rvar("diag.j", 1232, Rv_jbiaddr_pattern3);
!!# 			IJ_update_rvar("diag.j", 1233, Rv_jbiaddr_pattern4);
!!# 			IJ_update_rvar("diag.j", 1234, Rv_jbiaddr_pattern5);
!!# 			IJ_update_rvar("diag.j", 1235, Rv_jbiaddr_pattern6);
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
!!#                         w_DATA_ARRAY[w_wr_cntr] = IJ_get_rvar_val64("diag.j", 1251, Rv_rand64);
!!# 			IJ_update_rvar("diag.j", 1252, Rv_rand64);
!!#                         data_st = w_DATA_ARRAY[w_wr_cntr];
!!#                         addr_st = w_ADDR_ARRAY[w_a_wr_cntr -6 + i];
!!#                         IJ_printf ("diag.j", 1255, th_M, "\tsetx\t0x%016llx, %%r1, %%r9\n",
!!#                                 addr_st);
!!#                         IJ_printf ("diag.j", 1257, th_M, "\tsetx\t0x%016llx, %%r1, %%r10\n",
!!#                                 data_st);
!!#                         IJ_printf ("diag.j", 1259, th_M, "\tstw\t%%r10, [%%r9]\n");
!!# 
!!#                         w_wr_cntr++;
!!#                         } ! end for 
!!# 
!!#                         ! Double WORD (x-word)
!!#                         ! add a mechanism to control addr1, addr5 in range ??
!!#                         ! addr
!!#                         jbi1 = IJ_get_rvar_val64("diag.j", 1267, Rv_jbiaddr_pattern1);
!!#                         jbi2 = IJ_get_rvar_val64("diag.j", 1268, Rv_jbiaddr_pattern2);
!!#                         jbi3 = IJ_get_rvar_val64("diag.j", 1269, Rv_jbiaddr_pattern3);
!!#                         jbi4 = IJ_get_rvar_val64("diag.j", 1270, Rv_jbiaddr_pattern4);
!!#                         jbi5 = IJ_get_rvar_val64("diag.j", 1271, Rv_jbiaddr_pattern5);
!!#                         jbi6 = IJ_get_rvar_val64("diag.j", 1272, Rv_jbiaddr_pattern6);
!!# 			IJ_update_rvar("diag.j", 1273, Rv_jbiaddr_pattern1);
!!# 			IJ_update_rvar("diag.j", 1274, Rv_jbiaddr_pattern2);
!!# 			IJ_update_rvar("diag.j", 1275, Rv_jbiaddr_pattern3);
!!# 			IJ_update_rvar("diag.j", 1276, Rv_jbiaddr_pattern4);
!!# 			IJ_update_rvar("diag.j", 1277, Rv_jbiaddr_pattern5);
!!# 			IJ_update_rvar("diag.j", 1278, Rv_jbiaddr_pattern6);
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
!!#                         x_DATA_ARRAY[x_wr_cntr] = IJ_get_rvar_val64("diag.j", 1294, Rv_rand64);
!!# 			IJ_update_rvar("diag.j", 1295, Rv_rand64);
!!#                         data_st = x_DATA_ARRAY[x_wr_cntr];
!!#                         addr_st = x_ADDR_ARRAY[x_a_wr_cntr -6 + i];
!!#                         IJ_printf ("diag.j", 1298, th_M, "\tsetx\t0x%016llx, %%r1, %%r9\n",
!!#                                 addr_st);
!!#                         IJ_printf ("diag.j", 1300, th_M, "\tsetx\t0x%016llx, %%r1, %%r10\n",
!!#                                 data_st);
!!#                         IJ_printf ("diag.j", 1302, th_M, "\tstx\t%%r10, [%%r9]\n");
!!# 
!!#                         x_wr_cntr++;
!!#                         } ! end for 
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
!!#                         IJ_printf ("diag.j", 1356, th_M, "\tsetx\t0x%016llx, %%r1, %%r12\n",
!!#                                 b_ADDR_ARRAY[rnd_cnt+a_addr_sel]);
!!#                         IJ_printf ("diag.j", 1358, th_M, "\tldub\t[%%r12], %%r11\n");
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
!!#                         IJ_printf ("diag.j", 1385, th_M, "\tsetx\t0x%016llx, %%r1, %%r12\n",
!!#                                 h_ADDR_ARRAY[rnd_cnt+a_addr_sel]);
!!#                         IJ_printf ("diag.j", 1387, th_M, "\tlduh\t[%%r12], %%r11\n");
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
!!#                         IJ_printf ("diag.j", 1414, th_M, "\tsetx\t0x%016llx, %%r1, %%r12\n",
!!#                                 w_ADDR_ARRAY[rnd_cnt+a_addr_sel]);
!!#                         IJ_printf ("diag.j", 1416, th_M, "\tlduw\t[%%r12], %%r11\n");
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
!!#                         IJ_printf ("diag.j", 1443, th_M, "\tsetx\t0x%016llx, %%r1, %%r12\n",
!!#                                 x_ADDR_ARRAY[rnd_cnt+a_addr_sel]);
!!#                         IJ_printf ("diag.j", 1445, th_M, "\tldx\t[%%r12], %%r11\n");
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
