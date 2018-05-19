// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: pio_rnd_basic3_mix_all_rand_0.s
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
   random seed:	978227018
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

	setx	0x0000000054228005, %r1, %r9
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



	setx	0x00000080709fb699, %r1, %r9
	setx	0xa9d389086e3af289, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e5e21c5, %r1, %r9
	setx	0xcd61d3e5ad8f5520, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f37e60f, %r1, %r9
	setx	0xc8c0a0415a8eed6c, %r1, %r10
	stb	%r10, [%r9]
	setx	0x0000001090100000, %r1, %r9
	setx	0xc8c0a0415a8eed6c, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c444c3bbe1, %r1, %r9
	setx	0x17fc80df36cc3b52, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000da1edad502, %r1, %r9
	setx	0x34eea6481f645c33, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e54ca3c1a8, %r1, %r9
	setx	0x3e9605f57372af94, %r1, %r10
	stb	%r10, [%r9]
	setx	0x0000001030100000, %r1, %r9
	setx	0x3e9605f57372af94, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000f403313601, %r1, %r9
	setx	0xc0cc8ce1e608fb49, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800ebbb828, %r1, %r9
	setx	0x8f3cbb9442a276d1, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f668588, %r1, %r9
	setx	0x01f19f7ef7a3f2e6, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c6d21989a6, %r1, %r9
	setx	0xddacff60ad3b09e4, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d2f7ee5342, %r1, %r9
	setx	0xb6f7f7dc83a2b1c9, %r1, %r10
	sth	%r10, [%r9]
	setx	0x00000010e0100000, %r1, %r9
	setx	0xb6f7f7dc83a2b1c9, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000eb1882f868, %r1, %r9
	setx	0x7356bb52ea4e5879, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f8a000a65e, %r1, %r9
	setx	0x27ccf4f20d0aa9b4, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e480c88, %r1, %r9
	setx	0x8ef09bdb29f5c6b4, %r1, %r10
	stw	%r10, [%r9]
	setx	0x0000001070100000, %r1, %r9
	setx	0x8ef09bdb29f5c6b4, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800ff1b364, %r1, %r9
	setx	0xcc3f01074b1770f3, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c025d72dbc, %r1, %r9
	setx	0x883e866bcc0f11eb, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d7d803625c, %r1, %r9
	setx	0xcd575bedd3174bda, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000ef43a2eaf4, %r1, %r9
	setx	0x701bc8031c0b894a, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f2c3a1480c, %r1, %r9
	setx	0xda616afb335b0a17, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800ea9bb70, %r1, %r9
	setx	0x0f3f06258019c2d9, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800fcbbf00, %r1, %r9
	setx	0x14e85c9a855d5027, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000001070100000, %r1, %r9
	setx	0x14e85c9a855d5027, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000ca0421ca00, %r1, %r9
	setx	0x61bc8e08b001c816, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000de23357358, %r1, %r9
	setx	0xc09c8b3af6ae9526, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e6a2f795b0, %r1, %r9
	setx	0x783cb60662432c2d, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f8a20297b0, %r1, %r9
	setx	0x8f1bd44ada09da35, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000008082b7fe83, %r1, %r9
	setx	0x9f9f4c414f209331, %r1, %r10
	stb	%r10, [%r9]
	setx	0x0000001010100000, %r1, %r9
	setx	0x9f9f4c414f209331, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800e140fae, %r1, %r9
	setx	0xbf3d050fbfa20ec2, %r1, %r10
	stb	%r10, [%r9]
	setx	0x00000010e0100000, %r1, %r9
	setx	0xbf3d050fbfa20ec2, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f18c96b, %r1, %r9
	setx	0x61c8b9d57d2027ab, %r1, %r10
	stb	%r10, [%r9]
	setx	0x0000001060100000, %r1, %r9
	setx	0x61c8b9d57d2027ab, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000c3d05ea576, %r1, %r9
	setx	0x7cd5f72a78529282, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d30c0da78a, %r1, %r9
	setx	0x2583f1dbf4847fa4, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e6641e3a52, %r1, %r9
	setx	0xa8b76b218b80fdea, %r1, %r10
	stb	%r10, [%r9]
	setx	0x0000001010100000, %r1, %r9
	setx	0xa8b76b218b80fdea, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000f3989862cf, %r1, %r9
	setx	0x17bdbfe232e9d97f, %r1, %r10
	stb	%r10, [%r9]
	setx	0x0000001070100000, %r1, %r9
	setx	0x17bdbfe232e9d97f, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800e119c72, %r1, %r9
	setx	0xfc73973545869f82, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f5563f6, %r1, %r9
	setx	0xd76a7a3ef68860aa, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c5c7a22886, %r1, %r9
	setx	0x4a9a6b1575cf62b3, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d1dc4ca20c, %r1, %r9
	setx	0x1dfe2edcd2311e8f, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e7b2db78a4, %r1, %r9
	setx	0x06e1165f8a1ae6b9, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f0077c3ae0, %r1, %r9
	setx	0x5cab278dc4b3980f, %r1, %r10
	sth	%r10, [%r9]
	setx	0x0000001020100000, %r1, %r9
	setx	0x5cab278dc4b3980f, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800e0a9e5c, %r1, %r9
	setx	0x4a6605b654f27472, %r1, %r10
	stw	%r10, [%r9]
	setx	0x0000001040100000, %r1, %r9
	setx	0x4a6605b654f27472, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f77f460, %r1, %r9
	setx	0xee3715cb635cd979, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000ca3cbe62b8, %r1, %r9
	setx	0x8b4434e4fbf8c82c, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d5fd89abc4, %r1, %r9
	setx	0x3c423bcf7f6c0b32, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000edf220f794, %r1, %r9
	setx	0x85fca75706ace3a1, %r1, %r10
	stw	%r10, [%r9]
	setx	0x0000001020100000, %r1, %r9
	setx	0x85fca75706ace3a1, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000fe8df98944, %r1, %r9
	setx	0x39800ebdfd2cfa12, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e4dcb40, %r1, %r9
	setx	0x083acb07d0c9e845, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800fd6a3d0, %r1, %r9
	setx	0xcbfe040cad7441ca, %r1, %r10
	stx	%r10, [%r9]
	setx	0x00000010e0100000, %r1, %r9
	setx	0xcbfe040cad7441ca, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000c48c3b26b8, %r1, %r9
	setx	0xfabfa8db62578323, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d957e833d0, %r1, %r9
	setx	0xcd3938757f952b47, %r1, %r10
	stx	%r10, [%r9]
	setx	0x00000010c0100000, %r1, %r9
	setx	0xcd3938757f952b47, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000eef028f8a8, %r1, %r9
	setx	0xf7ad26de5521f9f5, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f8a20297b0, %r1, %r9
	setx	0xc52f6b6e098b22d9, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f18c96b, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800e140fae, %r1, %r12
	ldub	[%r12], %r11
	setx	0x0000008082b7fe83, %r1, %r12
	ldub	[%r12], %r11
	setx	0x0000001010100000, %r1, %r9
	setx	0xc52f6b6e098b22d9, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f403313601, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000e54ca3c1a8, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000da1edad502, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000f8a000a65e, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000eb1882f868, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d2f7ee5342, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e0a9e5c, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000f2c3a1480c, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000ef43a2eaf4, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000d7d803625c, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800fd6a3d0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e4dcb40, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000f8a20297b0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000e6a2f795b0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000de23357358, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000ca0421ca00, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800fcbbf00, %r1, %r12
	ldx	[%r12], %r11
	setx	0x00000080ed5594bd, %r1, %r9
	setx	0x26343eab1ada1a48, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e0ac5a3, %r1, %r9
	setx	0xc3958669a02d0a9f, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f834944, %r1, %r9
	setx	0xcee35ddc2919ee4d, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c27f21f5cb, %r1, %r9
	setx	0x9de267146bcd00d5, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d3a3b8513e, %r1, %r9
	setx	0x2accc9bd0764cfdb, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ea2fd5e1b6, %r1, %r9
	setx	0x7b701039742144d8, %r1, %r10
	stb	%r10, [%r9]
	setx	0x0000001000100000, %r1, %r9
	setx	0x7b701039742144d8, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000f376504e8e, %r1, %r9
	setx	0xe7b9cef229f05118, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800efda98c, %r1, %r9
	setx	0xf64a5ec9c8d457bb, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f2500ca, %r1, %r9
	setx	0x87b0e524a6718598, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c69723046c, %r1, %r9
	setx	0x143bb21751102fab, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000dd21f742aa, %r1, %r9
	setx	0xb6844d7aa67076a5, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e3e0611966, %r1, %r9
	setx	0x843cc2aa31524fb6, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f0ec4df7c2, %r1, %r9
	setx	0xf18ffeae94e45160, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e2260b0, %r1, %r9
	setx	0x6366b0eef39e882b, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f80d9d4, %r1, %r9
	setx	0x23c0419615d9b9cd, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000cc163612a4, %r1, %r9
	setx	0x8fc234cfbe9735e4, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000df51e29eec, %r1, %r9
	setx	0x4cfee0c9e446b8b5, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000eb1f810d5c, %r1, %r9
	setx	0x4fad6f85256097dd, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f4f1f00528, %r1, %r9
	setx	0xf1665be9aeeb103e, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800eda9f20, %r1, %r9
	setx	0xd0f9eb29165a8f45, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f45b648, %r1, %r9
	setx	0x83790c886c169469, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c83a24ea60, %r1, %r9
	setx	0xc7c44541f32cdeeb, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000da1ee69630, %r1, %r9
	setx	0x591d12ff3d1ab540, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e94fc3b738, %r1, %r9
	setx	0x2910790a921780b6, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f8a20297b0, %r1, %r9
	setx	0x5191962100d0191c, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000001020100000, %r1, %r9
	setx	0x5191962100d0191c, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f834944, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800e0ac5a3, %r1, %r12
	ldub	[%r12], %r11
	setx	0x00000080ed5594bd, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000f3989862cf, %r1, %r12
	ldub	[%r12], %r11
	setx	0x0000001080100000, %r1, %r9
	setx	0x5191962100d0191c, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000e6641e3a52, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000d30c0da78a, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000c5c7a22886, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800f5563f6, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e119c72, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000f8a000a65e, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000eb1882f868, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d2f7ee5342, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000c6d21989a6, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e0a9e5c, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000f2c3a1480c, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000ef43a2eaf4, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000d7d803625c, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000c025d72dbc, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800ff1b364, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000eef028f8a8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000d957e833d0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000805c5bf811, %r1, %r9
	setx	0x499ee31ca2357d26, %r1, %r10
	stb	%r10, [%r9]
	setx	0x00000010e0100000, %r1, %r9
	setx	0x499ee31ca2357d26, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800e6a62bd, %r1, %r9
	setx	0x45de6b97899c6a58, %r1, %r10
	stb	%r10, [%r9]
	setx	0x00000010f0100000, %r1, %r9
	setx	0x45de6b97899c6a58, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800fb1dd60, %r1, %r9
	setx	0x91a024808516aa1b, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c48b8a779d, %r1, %r9
	setx	0x353769c968163814, %r1, %r10
	stb	%r10, [%r9]
	setx	0x0000001050100000, %r1, %r9
	setx	0x353769c968163814, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d5294faa1c, %r1, %r9
	setx	0xc334916abb284625, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e16484096e, %r1, %r9
	setx	0x1c2fb009c6e0a82f, %r1, %r10
	stb	%r10, [%r9]
	setx	0x0000001080100000, %r1, %r9
	setx	0x1c2fb009c6e0a82f, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000fa08ede5ee, %r1, %r9
	setx	0x04b73797eab0d361, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e5f3766, %r1, %r9
	setx	0xaaa139c050a95ef5, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f336aa6, %r1, %r9
	setx	0x116a268d516f410b, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c764eefea6, %r1, %r9
	setx	0x2a172c6123032fe9, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000ddc19797a0, %r1, %r9
	setx	0x9d0e62973d8be0c3, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e7908e39d6, %r1, %r9
	setx	0x7702c6ca67f0617e, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f7ea99ba90, %r1, %r9
	setx	0x128a007ae275a526, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e8d2bc4, %r1, %r9
	setx	0xa522dc5b80f29ace, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800fbaea1c, %r1, %r9
	setx	0xe6ca7a3dff55df4f, %r1, %r10
	stw	%r10, [%r9]
	setx	0x0000001070100000, %r1, %r9
	setx	0xe6ca7a3dff55df4f, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000cf08da4900, %r1, %r9
	setx	0xc96c7adf0ff89b27, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d4b9e89b1c, %r1, %r9
	setx	0xfd7fb0ae75786c56, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e05dcb1a84, %r1, %r9
	setx	0x11fdb26dd6702374, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f15ded27a0, %r1, %r9
	setx	0xce2f54f38faa5528, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800ec444d0, %r1, %r9
	setx	0x0d568d42ce89e862, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f4072b8, %r1, %r9
	setx	0xe82e19627aec92a8, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c2d5aa6a00, %r1, %r9
	setx	0x84651d3de836fd4c, %r1, %r10
	stx	%r10, [%r9]
	setx	0x00000010c0100000, %r1, %r9
	setx	0x84651d3de836fd4c, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000d368c13528, %r1, %r9
	setx	0x98a736bfd557934e, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e3a061a670, %r1, %r9
	setx	0x661e820b61de0a03, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f8a20297b0, %r1, %r9
	setx	0x9eaed8e123a924bb, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000001040100000, %r1, %r9
	setx	0x9eaed8e123a924bb, %r1, %r10
	ldx	[%r9], %r10
	setx	0x00000080ed5594bd, %r1, %r12
	ldub	[%r12], %r11
	setx	0x00000010d0100000, %r1, %r9
	setx	0x9eaed8e123a924bb, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000f3989862cf, %r1, %r12
	ldub	[%r12], %r11
	setx	0x0000001020100000, %r1, %r9
	setx	0x9eaed8e123a924bb, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000e6641e3a52, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000d30c0da78a, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000c3d05ea576, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800f18c96b, %r1, %r12
	ldub	[%r12], %r11
	setx	0x0000001000100000, %r1, %r9
	setx	0x9eaed8e123a924bb, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000c764eefea6, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800f336aa6, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e5f3766, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000f0ec4df7c2, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000e3e0611966, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000dd21f742aa, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800f77f460, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800e0a9e5c, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000f2c3a1480c, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000ef43a2eaf4, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000d957e833d0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000c48c3b26b8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800fd6a3d0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e4dcb40, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000f8a20297b0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000e6a2f795b0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000802a093863, %r1, %r9
	setx	0x02530b6f21152940, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800eeed292, %r1, %r9
	setx	0x5aa4d143b20e1d5a, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800fe2a16b, %r1, %r9
	setx	0xdba3768d05ec0a75, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c4f26ed121, %r1, %r9
	setx	0xc401b75c7520f463, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d0315d5f81, %r1, %r9
	setx	0x3ea5fdeba91c6c58, %r1, %r10
	stb	%r10, [%r9]
	setx	0x0000001050100000, %r1, %r9
	setx	0x3ea5fdeba91c6c58, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000ea02ca507b, %r1, %r9
	setx	0x92a311d437646114, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f0586742fc, %r1, %r9
	setx	0x3d5143fe7b42b426, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e6a45cc, %r1, %r9
	setx	0xfe92c54a661493b3, %r1, %r10
	sth	%r10, [%r9]
	setx	0x00000010f0100000, %r1, %r9
	setx	0xfe92c54a661493b3, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800fcf409e, %r1, %r9
	setx	0xe8ef875072521c7f, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c4bc9b0ca4, %r1, %r9
	setx	0xd84be1023b7b587a, %r1, %r10
	sth	%r10, [%r9]
	setx	0x00000010c0100000, %r1, %r9
	setx	0xd84be1023b7b587a, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d98a821cd4, %r1, %r9
	setx	0x3d60a5d2ce3c8233, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e812b071d2, %r1, %r9
	setx	0x90577f7463783283, %r1, %r10
	sth	%r10, [%r9]
	setx	0x0000001060100000, %r1, %r9
	setx	0x90577f7463783283, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000f8c1f7c55a, %r1, %r9
	setx	0x110a3701bdf1c212, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e56d118, %r1, %r9
	setx	0xbed7c6e233d98455, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f5af3ac, %r1, %r9
	setx	0x5886dd07a0c4278e, %r1, %r10
	stw	%r10, [%r9]
	setx	0x00000010c0100000, %r1, %r9
	setx	0x5886dd07a0c4278e, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000cc19f756b0, %r1, %r9
	setx	0x1ea4c5ce4430d504, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000da98c24c34, %r1, %r9
	setx	0x408bd328ea5aeae2, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e312232d08, %r1, %r9
	setx	0xd85fc793ffc1be82, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f6c03f9d40, %r1, %r9
	setx	0xc181f49c1e75e9b2, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e5be080, %r1, %r9
	setx	0x508f27b59119e651, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f4d91f8, %r1, %r9
	setx	0x9d8aee4570aa8e2d, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000cb720c9ee0, %r1, %r9
	setx	0xd9ece589e47ab753, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000da3f3fd118, %r1, %r9
	setx	0xd5fe5b9dc5d3cc56, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ef58c92128, %r1, %r9
	setx	0xabf98eb73886711b, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f8a20297b0, %r1, %r9
	setx	0xfc25078da52b40c1, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800e0ac5a3, %r1, %r12
	ldub	[%r12], %r11
	setx	0x00000080ed5594bd, %r1, %r12
	ldub	[%r12], %r11
	setx	0x0000001060100000, %r1, %r9
	setx	0xfc25078da52b40c1, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f3989862cf, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000e6641e3a52, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800efda98c, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000f0077c3ae0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000e7b2db78a4, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d1dc4ca20c, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000c5c7a22886, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800f5563f6, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e119c72, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800fbaea1c, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800e8d2bc4, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000f4f1f00528, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800fd6a3d0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e4dcb40, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000f8a20297b0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x00000080294a12ae, %r1, %r9
	setx	0xdfd5c398304e663d, %r1, %r10
	stb	%r10, [%r9]
	setx	0x00000010f0100000, %r1, %r9
	setx	0xdfd5c398304e663d, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800e201c42, %r1, %r9
	setx	0xc2a8163fda2b9134, %r1, %r10
	stb	%r10, [%r9]
	setx	0x0000001080100000, %r1, %r9
	setx	0xc2a8163fda2b9134, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f7af6ea, %r1, %r9
	setx	0x12247ec81db93e94, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ccbdf1606d, %r1, %r9
	setx	0xf61bba9c3edb8e4d, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d832f64480, %r1, %r9
	setx	0xd5062539dd6df6f6, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ef7c43f8b2, %r1, %r9
	setx	0x867f59bad4e06b96, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000fd9a434711, %r1, %r9
	setx	0x4092098c5cc13b8c, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e4e9898, %r1, %r9
	setx	0x2c20d16ed4ade2a1, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f7d11e2, %r1, %r9
	setx	0xaff106c3f658815c, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c41c8615b8, %r1, %r9
	setx	0x69c5a1cba93a2da3, %r1, %r10
	sth	%r10, [%r9]
	setx	0x00000010c0100000, %r1, %r9
	setx	0x69c5a1cba93a2da3, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000d015bb8e9e, %r1, %r9
	setx	0x8f248d4cfd149654, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e9521fd6fe, %r1, %r9
	setx	0xc217b8b0162dcfc8, %r1, %r10
	sth	%r10, [%r9]
	setx	0x0000001070100000, %r1, %r9
	setx	0xc217b8b0162dcfc8, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000f1592957ba, %r1, %r9
	setx	0x6c47e1035dedd2fe, %r1, %r10
	sth	%r10, [%r9]
	setx	0x0000001050100000, %r1, %r9
	setx	0x6c47e1035dedd2fe, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800e8b49c0, %r1, %r9
	setx	0xc6843a40739fabd3, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f136d1c, %r1, %r9
	setx	0x2583742172975aea, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000cd0ce6149c, %r1, %r9
	setx	0x18fc7c963e11c048, %r1, %r10
	stw	%r10, [%r9]
	setx	0x00000010d0100000, %r1, %r9
	setx	0x18fc7c963e11c048, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000dee4a5d074, %r1, %r9
	setx	0x0a681acaeb303a50, %r1, %r10
	stw	%r10, [%r9]
	setx	0x00000010a0100000, %r1, %r9
	setx	0x0a681acaeb303a50, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e7c8617b50, %r1, %r9
	setx	0x54d20f91370f24d9, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000fd9a621704, %r1, %r9
	setx	0xf9d5000c85944a5a, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e0f9eb8, %r1, %r9
	setx	0x241a717cd1b10c44, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f92f438, %r1, %r9
	setx	0x0cef1455529c9de5, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ccc08eaa20, %r1, %r9
	setx	0x7976479196213023, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000dd75994aa0, %r1, %r9
	setx	0xa438aa89d5c9cb52, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e20b175b70, %r1, %r9
	setx	0x8ea924acbb84a6c6, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f8a20297b0, %r1, %r9
	setx	0x94318ffc5602f69c, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000802a093863, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000c69723046c, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800f2500ca, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800efda98c, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000f0077c3ae0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000e7b2db78a4, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d1dc4ca20c, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000c5c7a22886, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e2260b0, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000da1ee69630, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000c83a24ea60, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800f45b648, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800eda9f20, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000f8a20297b0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x0000008019c6188e, %r1, %r9
	setx	0xa764febe9256f152, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800ed442fb, %r1, %r9
	setx	0x5c4f71a6c7485827, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f008da3, %r1, %r9
	setx	0xdd31fd70321fc7d9, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c82a74257a, %r1, %r9
	setx	0x7fde67871e3488a4, %r1, %r10
	stb	%r10, [%r9]
	setx	0x0000001000100000, %r1, %r9
	setx	0x7fde67871e3488a4, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000d568e412b8, %r1, %r9
	setx	0xa75913cee081bb70, %r1, %r10
	stb	%r10, [%r9]
	setx	0x0000001030100000, %r1, %r9
	setx	0xa75913cee081bb70, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e87bd24623, %r1, %r9
	setx	0x8c01fd849f80f540, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f4d300cb71, %r1, %r9
	setx	0x0036741d269ddda2, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e1c204a, %r1, %r9
	setx	0x7e49268ce16018cf, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f17c2d6, %r1, %r9
	setx	0x130508774e288e2d, %r1, %r10
	sth	%r10, [%r9]
	setx	0x00000010c0100000, %r1, %r9
	setx	0x130508774e288e2d, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c23c068f3c, %r1, %r9
	setx	0x8c05dede6a03aa32, %r1, %r10
	sth	%r10, [%r9]
	setx	0x00000010a0100000, %r1, %r9
	setx	0x8c05dede6a03aa32, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000dac9cc525e, %r1, %r9
	setx	0x739e4c37bd4397c8, %r1, %r10
	sth	%r10, [%r9]
	setx	0x0000001030100000, %r1, %r9
	setx	0x739e4c37bd4397c8, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000e3c412c222, %r1, %r9
	setx	0x26731d8147e23874, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f32745e7fe, %r1, %r9
	setx	0xc4b939b725367e52, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e384b14, %r1, %r9
	setx	0xdbfbdb4a9e0d7556, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f1c8fc0, %r1, %r9
	setx	0x76afef642a604d94, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c22e3d3fbc, %r1, %r9
	setx	0x24826dd77600b778, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d7e8dc7f5c, %r1, %r9
	setx	0xf4d91707b0c87cd2, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e0c0276864, %r1, %r9
	setx	0xd4546ef6d15d9b49, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f18d1dfbf4, %r1, %r9
	setx	0xc95bd350d451a728, %r1, %r10
	stw	%r10, [%r9]
	setx	0x0000001040100000, %r1, %r9
	setx	0xc95bd350d451a728, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800e407f08, %r1, %r9
	setx	0xed5785994d30a0a2, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000001060100000, %r1, %r9
	setx	0xed5785994d30a0a2, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f4dc4d8, %r1, %r9
	setx	0x4bc23fe57ef741a2, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000cdc9b45fd8, %r1, %r9
	setx	0xdf8a366977517ad3, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d81ca273f8, %r1, %r9
	setx	0x0f6085ffd095ba2d, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e06ce14e30, %r1, %r9
	setx	0x7c087e928a3d4ad1, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f8a20297b0, %r1, %r9
	setx	0xc0663ba98b39676c, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000fd9a434711, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000ef7c43f8b2, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000d832f64480, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000ccbdf1606d, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000eb1882f868, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d2f7ee5342, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000edf220f794, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000f8a20297b0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000e94fc3b738, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000da1ee69630, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000c83a24ea60, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000807ecd9f72, %r1, %r9
	setx	0xc12d0f6688d1a5c3, %r1, %r10
	stb	%r10, [%r9]
	setx	0x00000010b0100000, %r1, %r9
	setx	0xc12d0f6688d1a5c3, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800e1c53ec, %r1, %r9
	setx	0x5e283137788f7a1c, %r1, %r10
	stb	%r10, [%r9]
	setx	0x00000010b0100000, %r1, %r9
	setx	0x5e283137788f7a1c, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800fea548d, %r1, %r9
	setx	0x429e12be8573fcd4, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c23604c83b, %r1, %r9
	setx	0x596c44337098ff73, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000dec15892d0, %r1, %r9
	setx	0x36be8b996874044f, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e86003a141, %r1, %r9
	setx	0x9b27018a24efa85f, %r1, %r10
	stb	%r10, [%r9]
	setx	0x00000010e0100000, %r1, %r9
	setx	0x9b27018a24efa85f, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f2add2804e, %r1, %r9
	setx	0x88598bb54632948e, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e7d577a, %r1, %r9
	setx	0x948b22bf2e2f32ea, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f81935e, %r1, %r9
	setx	0xcd85eb4181079980, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000cdcbda2a08, %r1, %r9
	setx	0x8655bfdc21bb8298, %r1, %r10
	sth	%r10, [%r9]
	setx	0x00000010f0100000, %r1, %r9
	setx	0x8655bfdc21bb8298, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000d5857bac22, %r1, %r9
	setx	0xdbdd80b3ddb65506, %r1, %r10
	sth	%r10, [%r9]
	setx	0x0000001040100000, %r1, %r9
	setx	0xdbdd80b3ddb65506, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000eb00cff536, %r1, %r9
	setx	0xf2eb27108678df11, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f54db82878, %r1, %r9
	setx	0xc9a5ba2621b27283, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800ece4188, %r1, %r9
	setx	0xde5ebde3484a45fa, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f557aac, %r1, %r9
	setx	0xf41444ad6de5ff8b, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c6bd76dc58, %r1, %r9
	setx	0x747c73d170966700, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d5d8e47998, %r1, %r9
	setx	0x2b23257a2a6ef8be, %r1, %r10
	stw	%r10, [%r9]
	setx	0x0000001050100000, %r1, %r9
	setx	0x2b23257a2a6ef8be, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000e91672af9c, %r1, %r9
	setx	0x942d4bc52dde50f9, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000fb03d65298, %r1, %r9
	setx	0xec88bd7f5d219492, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800eb2fad8, %r1, %r9
	setx	0x29f30de2eca8c906, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000001010100000, %r1, %r9
	setx	0x29f30de2eca8c906, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800f6e5300, %r1, %r9
	setx	0x51aca3323b748f6a, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c4e579a850, %r1, %r9
	setx	0x7a60988d4a38da26, %r1, %r10
	stx	%r10, [%r9]
	setx	0x00000010d0100000, %r1, %r9
	setx	0x7a60988d4a38da26, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d83a7618f8, %r1, %r9
	setx	0x59ade271730dd16a, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e113e0edf8, %r1, %r9
	setx	0xf2e6a44caf7d25c0, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f8a20297b0, %r1, %r9
	setx	0x5014ee88c699916b, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c444c3bbe1, %r1, %r12
	ldub	[%r12], %r11
	setx	0x0000001050100000, %r1, %r9
	setx	0x5014ee88c699916b, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800f37e60f, %r1, %r12
	ldub	[%r12], %r11
	setx	0x0000001020100000, %r1, %r9
	setx	0x5014ee88c699916b, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800e5e21c5, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800f7d11e2, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e4e9898, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000f8c1f7c55a, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e8b49c0, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000f6c03f9d40, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000e312232d08, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000da98c24c34, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000cc19f756b0, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800f5af3ac, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800ec444d0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000f8a20297b0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x00000080edd81f65, %r1, %r9
	setx	0xc5aea0dc3ef278ef, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800ebd438f, %r1, %r9
	setx	0xf08448563a44afad, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f244ca5, %r1, %r9
	setx	0xd5a62d2df168c3be, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c0024f2d75, %r1, %r9
	setx	0x329b06392497f471, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d600a24eb3, %r1, %r9
	setx	0x01d986ba5d8e2f0c, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000eb78bb07e3, %r1, %r9
	setx	0x888c1900154e9e46, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000fc53044b0b, %r1, %r9
	setx	0x8c8f3bf0a68f2604, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e87679e, %r1, %r9
	setx	0x633c080656ef7b96, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800faa8fea, %r1, %r9
	setx	0x963f98fa7acd89da, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c91c0a1998, %r1, %r9
	setx	0x42980728cc47711a, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d5f8202570, %r1, %r9
	setx	0xef9f425633f4d8a3, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e34978a5b2, %r1, %r9
	setx	0xfb56be44c358634c, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f49bc08b9a, %r1, %r9
	setx	0x5e10b7cd4da468db, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e024af4, %r1, %r9
	setx	0xa09dcc4d0949913c, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f202588, %r1, %r9
	setx	0x56d640110282fff9, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c07c4164a8, %r1, %r9
	setx	0xa0d8cd98110520a8, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d7cfc5b3f8, %r1, %r9
	setx	0x3dc39506c8b6b0d2, %r1, %r10
	stw	%r10, [%r9]
	setx	0x0000001040100000, %r1, %r9
	setx	0x3dc39506c8b6b0d2, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000eb5e94d2f8, %r1, %r9
	setx	0x0b226d3801db0118, %r1, %r10
	stw	%r10, [%r9]
	setx	0x00000010a0100000, %r1, %r9
	setx	0x0b226d3801db0118, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f0d7079e0c, %r1, %r9
	setx	0x02e0ae38d63adc6e, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e5f4958, %r1, %r9
	setx	0xf0dcf1f6cebf827a, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000001050100000, %r1, %r9
	setx	0xf0dcf1f6cebf827a, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800f9f16c8, %r1, %r9
	setx	0xfa70adf17e58af9d, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000cae54f1ab0, %r1, %r9
	setx	0x85edce2102aa728d, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000dd2ee168c8, %r1, %r9
	setx	0xba8bf9ac2f810596, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e77141c518, %r1, %r9
	setx	0xe00a3793be3eb2ef, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f8a20297b0, %r1, %r9
	setx	0x4c3d569f0424571d, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000001000100000, %r1, %r9
	setx	0x4c3d569f0424571d, %r1, %r10
	ldx	[%r9], %r10
	setx	0x0000008082b7fe83, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000f403313601, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000e54ca3c1a8, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000cdcbda2a08, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800f81935e, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800f5af3ac, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800e56d118, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000f8a20297b0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000e6a2f795b0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000de23357358, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000808359ab82, %r1, %r9
	setx	0x5eab0c912c85139f, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e99a561, %r1, %r9
	setx	0x278212558723ade2, %r1, %r10
	stb	%r10, [%r9]
	setx	0x00000010b0100000, %r1, %r9
	setx	0x278212558723ade2, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800f5f38ad, %r1, %r9
	setx	0xef71e58fc3133211, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c58acd11fc, %r1, %r9
	setx	0xcac286748bf58293, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000dbc8ffa7cc, %r1, %r9
	setx	0x76e5463330d7229f, %r1, %r10
	stb	%r10, [%r9]
	setx	0x0000001020100000, %r1, %r9
	setx	0x76e5463330d7229f, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e6d4c89dd8, %r1, %r9
	setx	0x38b083c4564fe063, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f0eec60311, %r1, %r9
	setx	0x972c14ae81bb4171, %r1, %r10
	stb	%r10, [%r9]
	setx	0x0000001040100000, %r1, %r9
	setx	0x972c14ae81bb4171, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800e3e3c82, %r1, %r9
	setx	0xf4662caca1474692, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f969ca8, %r1, %r9
	setx	0x42f7bf17bab97c51, %r1, %r10
	sth	%r10, [%r9]
	setx	0x0000001070100000, %r1, %r9
	setx	0x42f7bf17bab97c51, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c6568c982c, %r1, %r9
	setx	0x0faf119370457659, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d02dce38ee, %r1, %r9
	setx	0xa9366eac51e138c2, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e4453ff36c, %r1, %r9
	setx	0xb5391ecbbb6add41, %r1, %r10
	sth	%r10, [%r9]
	setx	0x0000001030100000, %r1, %r9
	setx	0xb5391ecbbb6add41, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f45beb5040, %r1, %r9
	setx	0x55c3bb72838bab3a, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800edb091c, %r1, %r9
	setx	0xb61add6d20d237e7, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f332b24, %r1, %r9
	setx	0xba3988921486b645, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000ce63fe759c, %r1, %r9
	setx	0xe0a990cc3297dceb, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d06aa3f930, %r1, %r9
	setx	0x26610281ba9e1f67, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000ea3d5a8674, %r1, %r9
	setx	0x249a6c34e3df6674, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000fa6de96140, %r1, %r9
	setx	0x31e92d0165b7dc8e, %r1, %r10
	stw	%r10, [%r9]
	setx	0x0000001000100000, %r1, %r9
	setx	0x31e92d0165b7dc8e, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800e5f2568, %r1, %r9
	setx	0x401fb870e8627f37, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f558f70, %r1, %r9
	setx	0xf3d6a397967fa249, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c6442f9f40, %r1, %r9
	setx	0xf98e6ac0942099cf, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d67a4bf920, %r1, %r9
	setx	0x03a0d51b202e89ee, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e359848750, %r1, %r9
	setx	0xde196ab5e0ce1eb2, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f8a20297b0, %r1, %r9
	setx	0x1b6060f1595a672c, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e86003a141, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000dec15892d0, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000c23604c83b, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800fea548d, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800e1c53ec, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000807ecd9f72, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000f4d300cb71, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800f1c8fc0, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800e384b14, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000d83a7618f8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000c4e579a850, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800f6e5300, %r1, %r12
	ldx	[%r12], %r11
	setx	0x00000080cab0e239, %r1, %r9
	setx	0x1e1f7777bd66f9a8, %r1, %r10
	stb	%r10, [%r9]
	setx	0x0000001090100000, %r1, %r9
	setx	0x1e1f7777bd66f9a8, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800e38c07f, %r1, %r9
	setx	0xcd29a495dda9783c, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800fcfe2b6, %r1, %r9
	setx	0x3ede2535f696d1e7, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000cb8c8bfee8, %r1, %r9
	setx	0x3258d569b416007e, %r1, %r10
	stb	%r10, [%r9]
	setx	0x00000010a0100000, %r1, %r9
	setx	0x3258d569b416007e, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000dcfaa9c77c, %r1, %r9
	setx	0x8dbc63cb2eeed5aa, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ed05b9b95f, %r1, %r9
	setx	0x3f43e4a9d9b8f136, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000fef6be243e, %r1, %r9
	setx	0x99e618e34431d658, %r1, %r10
	stb	%r10, [%r9]
	setx	0x0000001080100000, %r1, %r9
	setx	0x99e618e34431d658, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800e25be3e, %r1, %r9
	setx	0x99d3b08287a4e7d8, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f38d3ac, %r1, %r9
	setx	0x5606cf9e5f1a79a6, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c080ca3220, %r1, %r9
	setx	0x92da8e789b19d10c, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d77882bb0c, %r1, %r9
	setx	0xee13c2fec08022b3, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e935aa91b8, %r1, %r9
	setx	0x6f506789370f17df, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f8befb04c8, %r1, %r9
	setx	0xbf5be62e8d7508a9, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e4d4824, %r1, %r9
	setx	0x7dbcaf03df8e205d, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f7fcd68, %r1, %r9
	setx	0x7cd6e348c91ab9a3, %r1, %r10
	stw	%r10, [%r9]
	setx	0x0000001080100000, %r1, %r9
	setx	0x7cd6e348c91ab9a3, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000c1327680c8, %r1, %r9
	setx	0x923dde79add787bd, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d012b81498, %r1, %r9
	setx	0x39fa28623a8396c6, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e5ef6ee2a8, %r1, %r9
	setx	0x546183ede10d1c1c, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f3cb7761cc, %r1, %r9
	setx	0xe1f9179c6a39c5a4, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800ecfab70, %r1, %r9
	setx	0x4234ed44941d0acb, %r1, %r10
	stx	%r10, [%r9]
	setx	0x00000010b0100000, %r1, %r9
	setx	0x4234ed44941d0acb, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800f172f58, %r1, %r9
	setx	0x65a1b0479ff30e3e, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c789067220, %r1, %r9
	setx	0x43a5452f205a8f3f, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d4fd411fd0, %r1, %r9
	setx	0xdd4ae71d0a9324ef, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e10b4d0628, %r1, %r9
	setx	0x299bb7dabeb9894c, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f8a20297b0, %r1, %r9
	setx	0x791d12a41ec198dd, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e87bd24623, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000d568e412b8, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000c82a74257a, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800f81935e, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e7d577a, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000f32745e7fe, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000f6c03f9d40, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000e312232d08, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000da98c24c34, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000cc19f756b0, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800f5af3ac, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000f8a20297b0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000e06ce14e30, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000d81ca273f8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x00000080f76cecf3, %r1, %r9
	setx	0x773fa5a63040609d, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e44c4e0, %r1, %r9
	setx	0xfbddb68379fd2443, %r1, %r10
	stb	%r10, [%r9]
	setx	0x0000001000100000, %r1, %r9
	setx	0xfbddb68379fd2443, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f2d11a0, %r1, %r9
	setx	0x5110e165e077acfa, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000cf2b654174, %r1, %r9
	setx	0x18cc7de1f9e5ea6b, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000db77604048, %r1, %r9
	setx	0x1ec630e8ded74766, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e70d2c0d61, %r1, %r9
	setx	0x1505f6c0dd707dca, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f9828372d2, %r1, %r9
	setx	0xce9304b10796cc77, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e9ad988, %r1, %r9
	setx	0x602fe2159429fe3c, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800fdc3bc2, %r1, %r9
	setx	0x3ca3dffb12205a60, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c31af88580, %r1, %r9
	setx	0xcc90e314debdf0dc, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d6ecc5620c, %r1, %r9
	setx	0x8156c2232fc2a92d, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e343ba6a3e, %r1, %r9
	setx	0x193856a6ef0ae369, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f6e8059cd8, %r1, %r9
	setx	0x0ece52ceb1489857, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e45d1e8, %r1, %r9
	setx	0xe8801ca716fd5905, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f2822f8, %r1, %r9
	setx	0x1ac1f0369a3319c9, %r1, %r10
	stw	%r10, [%r9]
	setx	0x00000010c0100000, %r1, %r9
	setx	0x1ac1f0369a3319c9, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000c717638974, %r1, %r9
	setx	0x1cbd44d305da3ef1, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d49cbc1418, %r1, %r9
	setx	0x07a0674d8d76dd2f, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000ee9a93de68, %r1, %r9
	setx	0xda023d063634db12, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f69152c928, %r1, %r9
	setx	0x4de4b04df3fcdeab, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e9cc608, %r1, %r9
	setx	0xa2212f15d13735ae, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800fe4bb40, %r1, %r9
	setx	0x70338351971f2a0d, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000cc498d9788, %r1, %r9
	setx	0x060bd39b377b146c, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d3762cbda0, %r1, %r9
	setx	0x5ec8d27079223e55, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000001020100000, %r1, %r9
	setx	0x5ec8d27079223e55, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000eaafacc5f8, %r1, %r9
	setx	0x8423b64857016989, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f8a20297b0, %r1, %r9
	setx	0xe4c71b4950dfdf31, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000dbc8ffa7cc, %r1, %r12
	ldub	[%r12], %r11
	setx	0x0000001020100000, %r1, %r9
	setx	0xe4c71b4950dfdf31, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c58acd11fc, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800f5f38ad, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800e99a561, %r1, %r12
	ldub	[%r12], %r11
	setx	0x0000001040100000, %r1, %r9
	setx	0xe4c71b4950dfdf31, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c6568c982c, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800f969ca8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e3e3c82, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000f49bc08b9a, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000e34978a5b2, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d5f8202570, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000ce63fe759c, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800f332b24, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800edb091c, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000f0d7079e0c, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800f45b648, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800eda9f20, %r1, %r12
	ldx	[%r12], %r11
	setx	0x00000080f72f1571, %r1, %r9
	setx	0x62e419f517d3f1e8, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e748ac0, %r1, %r9
	setx	0x4e6c6711a4319efa, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800fde90d4, %r1, %r9
	setx	0xf42abbd2141e4ab1, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c4438eb72d, %r1, %r9
	setx	0x81911b8c376495f4, %r1, %r10
	stb	%r10, [%r9]
	setx	0x0000001030100000, %r1, %r9
	setx	0x81911b8c376495f4, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000dccdf4ee3f, %r1, %r9
	setx	0x33319387fc57dfc9, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000eaca6c5691, %r1, %r9
	setx	0xaaa13bb6dbb6e83e, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000fbb606bf3d, %r1, %r9
	setx	0x92477f5ef622801a, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800ec9ecf2, %r1, %r9
	setx	0xe388f4501c76b8b4, %r1, %r10
	sth	%r10, [%r9]
	setx	0x0000001010100000, %r1, %r9
	setx	0xe388f4501c76b8b4, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f22b570, %r1, %r9
	setx	0xb8e8ee30d0a1cc62, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c2218c630c, %r1, %r9
	setx	0x0d8b259309048afc, %r1, %r10
	sth	%r10, [%r9]
	setx	0x0000001040100000, %r1, %r9
	setx	0x0d8b259309048afc, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000dbb9ea38ce, %r1, %r9
	setx	0xfa44a19749ae2b46, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e904f1b01c, %r1, %r9
	setx	0x35165abd709c9736, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f33300c3d4, %r1, %r9
	setx	0xb3dbfc7d69105358, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e3c6834, %r1, %r9
	setx	0xdf460962962a672b, %r1, %r10
	stw	%r10, [%r9]
	setx	0x00000010c0100000, %r1, %r9
	setx	0xdf460962962a672b, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f180bc8, %r1, %r9
	setx	0x939f0e9ed81c11e3, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000cc28148cd8, %r1, %r9
	setx	0x2211e7a70d9b9e5e, %r1, %r10
	stw	%r10, [%r9]
	setx	0x0000001090100000, %r1, %r9
	setx	0x2211e7a70d9b9e5e, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000da0bd7b970, %r1, %r9
	setx	0x90771e8474a7c347, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000ef9a297298, %r1, %r9
	setx	0x3f08d0cf38c88ad2, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f7c0189fa4, %r1, %r9
	setx	0x5d1b01686c1f1df4, %r1, %r10
	stw	%r10, [%r9]
	setx	0x0000001090100000, %r1, %r9
	setx	0x5d1b01686c1f1df4, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800e4957d0, %r1, %r9
	setx	0x4fbfdd72922f969c, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f84b520, %r1, %r9
	setx	0x6e50a93f4a6ecc40, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000cc97191570, %r1, %r9
	setx	0xd048509970a1d411, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000001000100000, %r1, %r9
	setx	0xd048509970a1d411, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000d81ad77580, %r1, %r9
	setx	0x15dfc3802583b653, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ea7ce9aba0, %r1, %r9
	setx	0xedeca39ca98dd87d, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f8a20297b0, %r1, %r9
	setx	0xbf47a38d1e608286, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000001060100000, %r1, %r9
	setx	0xbf47a38d1e608286, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800e201c42, %r1, %r12
	ldub	[%r12], %r11
	setx	0x00000080294a12ae, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000f0586742fc, %r1, %r12
	ldub	[%r12], %r11
	setx	0x0000001040100000, %r1, %r9
	setx	0xbf47a38d1e608286, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000ea02ca507b, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800e9ad988, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000f8befb04c8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e2260b0, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000fe8df98944, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000edf220f794, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000d5fd89abc4, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800f4d91f8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e5be080, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000f8a20297b0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000e3a061a670, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000807eeb4c90, %r1, %r9
	setx	0xce28461322fbca99, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e4e4ed7, %r1, %r9
	setx	0x977f966d7cfd333c, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800fd39555, %r1, %r9
	setx	0x7f96f79162954ffb, %r1, %r10
	stb	%r10, [%r9]
	setx	0x0000001080100000, %r1, %r9
	setx	0x7f96f79162954ffb, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000c59f3c745d, %r1, %r9
	setx	0x25191f4dfff98757, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d33cc291cf, %r1, %r9
	setx	0x039b3b95ab43836d, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e1058b60c3, %r1, %r9
	setx	0x268453754472d8d6, %r1, %r10
	stb	%r10, [%r9]
	setx	0x0000001090100000, %r1, %r9
	setx	0x268453754472d8d6, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000f9389d226e, %r1, %r9
	setx	0x55e2bbb000842410, %r1, %r10
	stb	%r10, [%r9]
	setx	0x00000010b0100000, %r1, %r9
	setx	0x55e2bbb000842410, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800e35eade, %r1, %r9
	setx	0x3104793e33275e86, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800fd72312, %r1, %r9
	setx	0xbd5785b2eab79a68, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c1f900f67e, %r1, %r9
	setx	0x230aafe5336757b5, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d5d42deb4c, %r1, %r9
	setx	0x0f174d561b3007cb, %r1, %r10
	sth	%r10, [%r9]
	setx	0x0000001090100000, %r1, %r9
	setx	0x0f174d561b3007cb, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000e7fb980c16, %r1, %r9
	setx	0x5f6f4b747bcb55d0, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000fd12327d92, %r1, %r9
	setx	0x67ec277a7d93cfc6, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800ec3c5c4, %r1, %r9
	setx	0xd2ce3b965ac17875, %r1, %r10
	stw	%r10, [%r9]
	setx	0x0000001010100000, %r1, %r9
	setx	0xd2ce3b965ac17875, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800f618ff8, %r1, %r9
	setx	0x895f4d6aeb126c8c, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c5e303b59c, %r1, %r9
	setx	0x89fd1c6ebe759208, %r1, %r10
	stw	%r10, [%r9]
	setx	0x0000001080100000, %r1, %r9
	setx	0x89fd1c6ebe759208, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ddc3964ec0, %r1, %r9
	setx	0x58df2ea09b7491b5, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000ee248633f4, %r1, %r9
	setx	0xb3ca7e7b84dcfb01, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000fb539dab6c, %r1, %r9
	setx	0xeebd571c00919211, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800ec6d5e0, %r1, %r9
	setx	0x657275e250ce8c92, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000001070100000, %r1, %r9
	setx	0x657275e250ce8c92, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800ff2ae70, %r1, %r9
	setx	0x97bddc3589e112ae, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c47dfa18f8, %r1, %r9
	setx	0xf30b0f189929ddaa, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d6f31ee1e0, %r1, %r9
	setx	0x70ec6d3237036751, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000efdee374c0, %r1, %r9
	setx	0xb972380f638e98f6, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f8a20297b0, %r1, %r9
	setx	0xd728f1e6400b62e8, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000807eeb4c90, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000fbb606bf3d, %r1, %r12
	ldub	[%r12], %r11
	setx	0x00000010f0100000, %r1, %r9
	setx	0xd728f1e6400b62e8, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000eaca6c5691, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000dccdf4ee3f, %r1, %r12
	ldub	[%r12], %r11
	setx	0x00000010b0100000, %r1, %r9
	setx	0xd728f1e6400b62e8, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800e6a45cc, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000f7ea99ba90, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000e7908e39d6, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d06aa3f930, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000ce63fe759c, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800f332b24, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000f8a20297b0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000e359848750, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000d67a4bf920, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000805586926c, %r1, %r9
	setx	0x5087f1a9960d0a41, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800eb7c045, %r1, %r9
	setx	0xd78e164bc0fd5fa1, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f6b559e, %r1, %r9
	setx	0x88655a76ac081c89, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000cdca432b22, %r1, %r9
	setx	0x1c3f02cd09ab82b2, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d4cc23444a, %r1, %r9
	setx	0xb0ed949e8298de39, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000eee90247c0, %r1, %r9
	setx	0x15b6fc399ccefb55, %r1, %r10
	stb	%r10, [%r9]
	setx	0x0000001010100000, %r1, %r9
	setx	0x15b6fc399ccefb55, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000fd998afced, %r1, %r9
	setx	0x427b304bf9d4f401, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e810d1e, %r1, %r9
	setx	0x0e4059ba71c15bfe, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f29d292, %r1, %r9
	setx	0xea545d65254dc369, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000ce99fe5eb8, %r1, %r9
	setx	0x764d934c01d96950, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d8e8c5f89e, %r1, %r9
	setx	0x127886802a529f20, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e84e683814, %r1, %r9
	setx	0xf469f7bf443effbb, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f0df4d57b8, %r1, %r9
	setx	0xdd8129817b0264c6, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e49e95c, %r1, %r9
	setx	0xb6ddbdb879ccc23f, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f4af47c, %r1, %r9
	setx	0x95f8dc6ed28adc09, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c770076528, %r1, %r9
	setx	0xb6528b9c0bc4c3f0, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000daa1520928, %r1, %r9
	setx	0x8e316e5356e8e6d1, %r1, %r10
	stw	%r10, [%r9]
	setx	0x0000001020100000, %r1, %r9
	setx	0x8e316e5356e8e6d1, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ee7952e050, %r1, %r9
	setx	0x41e1bbd996edc31e, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f38b1306f0, %r1, %r9
	setx	0xe5301c834ea7cf22, %r1, %r10
	stw	%r10, [%r9]
	setx	0x0000001010100000, %r1, %r9
	setx	0xe5301c834ea7cf22, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800edca748, %r1, %r9
	setx	0x261b6ad919bb973f, %r1, %r10
	stx	%r10, [%r9]
	setx	0x00000010d0100000, %r1, %r9
	setx	0x261b6ad919bb973f, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800ff800b0, %r1, %r9
	setx	0x168f36d78231fb78, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ccb531d760, %r1, %r9
	setx	0x1c48ae0d112846ae, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d486394518, %r1, %r9
	setx	0x048bb481d3ee1bad, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e4af458a58, %r1, %r9
	setx	0x3f7f6069907891c9, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f8a20297b0, %r1, %r9
	setx	0x30f8b03b5c61ddae, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ccbdf1606d, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800e3e3c82, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000f49bc08b9a, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800edb091c, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000f0d7079e0c, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000eb5e94d2f8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000d7cfc5b3f8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000c07c4164a8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800f202588, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800e024af4, %r1, %r12
	lduw	[%r12], %r11
	setx	0x00000080ce47e76c, %r1, %r9
	setx	0xecda0ecf8845df35, %r1, %r10
	stb	%r10, [%r9]
	setx	0x0000001020100000, %r1, %r9
	setx	0xecda0ecf8845df35, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800e843da0, %r1, %r9
	setx	0x8ef16fbb6bca8704, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800fa64901, %r1, %r9
	setx	0xf7eb83e8d51a2de9, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ce38c4de8c, %r1, %r9
	setx	0xf81c0f18b236bf1d, %r1, %r10
	stb	%r10, [%r9]
	setx	0x00000010c0100000, %r1, %r9
	setx	0xf81c0f18b236bf1d, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000d408af1d33, %r1, %r9
	setx	0x53e4de0f54c68c4a, %r1, %r10
	stb	%r10, [%r9]
	setx	0x00000010a0100000, %r1, %r9
	setx	0x53e4de0f54c68c4a, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000eb1d6a6a81, %r1, %r9
	setx	0x5fa1eeef8c53eaac, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000fd5a1a08c4, %r1, %r9
	setx	0xb4ace6b04e347a23, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e1c0104, %r1, %r9
	setx	0xe9815d7bca2a9ce9, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f6d1520, %r1, %r9
	setx	0x0c4569c154cd9b44, %r1, %r10
	sth	%r10, [%r9]
	setx	0x00000010c0100000, %r1, %r9
	setx	0x0c4569c154cd9b44, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000ca02655be8, %r1, %r9
	setx	0x788592cec59c365e, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d52cbfc61e, %r1, %r9
	setx	0xd1e5b67bde5cd450, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e4ecdbe6a4, %r1, %r9
	setx	0x9424055da413dbad, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000fb050784da, %r1, %r9
	setx	0xe515195ccac9486e, %r1, %r10
	sth	%r10, [%r9]
	setx	0x00000010a0100000, %r1, %r9
	setx	0xe515195ccac9486e, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800e56bb2c, %r1, %r9
	setx	0x750c1fe0631d957a, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800fcd896c, %r1, %r9
	setx	0xd91307102c41b036, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c8cba159ec, %r1, %r9
	setx	0xbb607d3c754d51eb, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d001e9a5bc, %r1, %r9
	setx	0x5d57c27ec2ee2fa3, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000eb3312a764, %r1, %r9
	setx	0x728ec7a6c559ca0b, %r1, %r10
	stw	%r10, [%r9]
	setx	0x0000001020100000, %r1, %r9
	setx	0x728ec7a6c559ca0b, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000f285056924, %r1, %r9
	setx	0x0ff34174be453eb4, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800ec070c0, %r1, %r9
	setx	0xc6f9c0bbe87e7fb0, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f1007b0, %r1, %r9
	setx	0xf9680914a8e89bf4, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c31f436298, %r1, %r9
	setx	0x181011947a8c97a3, %r1, %r10
	stx	%r10, [%r9]
	setx	0x00000010d0100000, %r1, %r9
	setx	0x181011947a8c97a3, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000d8aa1a6260, %r1, %r9
	setx	0x1da22edf329f08c7, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e20e1b5a98, %r1, %r9
	setx	0xae3edbd09837679a, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f8a20297b0, %r1, %r9
	setx	0x9dffaa41da6702d5, %r1, %r10
	stx	%r10, [%r9]
	setx	0x00000010e0100000, %r1, %r9
	setx	0x9dffaa41da6702d5, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000f4d300cb71, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000e87bd24623, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000d568e412b8, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000c82a74257a, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800f008da3, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800e9ad988, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000f8befb04c8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000e935aa91b8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d77882bb0c, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000c080ca3220, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800f38d3ac, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e25be3e, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000cf08da4900, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800fbaea1c, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800e8d2bc4, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800f9f16c8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e5f4958, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000f8a20297b0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000e113e0edf8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x00000080bf0fc3f0, %r1, %r9
	setx	0xcae7329e76fbf6a2, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e9e6222, %r1, %r9
	setx	0x1774bab65fa09d44, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800fe7177d, %r1, %r9
	setx	0x3639f00debc0eb6e, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c6b08da7b5, %r1, %r9
	setx	0xf8be09f71f8def53, %r1, %r10
	stb	%r10, [%r9]
	setx	0x00000010a0100000, %r1, %r9
	setx	0xf8be09f71f8def53, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000da117e9129, %r1, %r9
	setx	0x301daffcee42f8c6, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e9f463119a, %r1, %r9
	setx	0xa73d2746252a0aff, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f2630e7769, %r1, %r9
	setx	0x772f5bc2c3688cf7, %r1, %r10
	stb	%r10, [%r9]
	setx	0x00000010d0100000, %r1, %r9
	setx	0x772f5bc2c3688cf7, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800e03e9dc, %r1, %r9
	setx	0xa966dd91439e9f48, %r1, %r10
	sth	%r10, [%r9]
	setx	0x0000001020100000, %r1, %r9
	setx	0xa966dd91439e9f48, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f602276, %r1, %r9
	setx	0x7bb50941d1f2b474, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c7a95932c6, %r1, %r9
	setx	0x8e1a73dd3dc9dea7, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000dfde2f2c10, %r1, %r9
	setx	0x70740dd0c58b3d11, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e853614260, %r1, %r9
	setx	0xac4237815db886df, %r1, %r10
	sth	%r10, [%r9]
	setx	0x00000010c0100000, %r1, %r9
	setx	0xac4237815db886df, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000f020991fee, %r1, %r9
	setx	0xa6546819d65a7665, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e533bd4, %r1, %r9
	setx	0x5bf5cdafdf42ff40, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800fca4a90, %r1, %r9
	setx	0xca9eed4c0a48615c, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c6a30e7a18, %r1, %r9
	setx	0xb1cfe79dc6d951b4, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d447acc03c, %r1, %r9
	setx	0xf33d4be338ca3a4f, %r1, %r10
	stw	%r10, [%r9]
	setx	0x0000001010100000, %r1, %r9
	setx	0xf33d4be338ca3a4f, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ed6f80e178, %r1, %r9
	setx	0x80dcecf19b9bedee, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000faccab6480, %r1, %r9
	setx	0x4cb336dd21621fd9, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e75cad8, %r1, %r9
	setx	0x7e83388143228009, %r1, %r10
	stx	%r10, [%r9]
	setx	0x00000010f0100000, %r1, %r9
	setx	0x7e83388143228009, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800fb071f0, %r1, %r9
	setx	0xc5393c2b3f4da2c2, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c46cdbc108, %r1, %r9
	setx	0x6a0504423c40f79a, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d9e09707a0, %r1, %r9
	setx	0xe376acb99d1aeb48, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e859b58328, %r1, %r9
	setx	0x72a2e9cc15241cbc, %r1, %r10
	stx	%r10, [%r9]
	setx	0x00000010c0100000, %r1, %r9
	setx	0x72a2e9cc15241cbc, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000f8a20297b0, %r1, %r9
	setx	0x505fc63c555fb1dd, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c3d05ea576, %r1, %r12
	ldub	[%r12], %r11
	setx	0x0000001050100000, %r1, %r9
	setx	0x505fc63c555fb1dd, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800f18c96b, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800e140fae, %r1, %r12
	ldub	[%r12], %r11
	setx	0x0000008082b7fe83, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000f54db82878, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000eb00cff536, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800f4af47c, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800e49e95c, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000fb539dab6c, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000ee248633f4, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000ddc3964ec0, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800e0f9eb8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000f8a20297b0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000ef58c92128, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000da3f3fd118, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000cb720c9ee0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800f4d91f8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e5be080, %r1, %r12
	ldx	[%r12], %r11
	setx	0x00000080583a61cf, %r1, %r9
	setx	0x9db6fe99eebf0942, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e6c30f5, %r1, %r9
	setx	0xcde5821508643baa, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800ff08d85, %r1, %r9
	setx	0x97ec8f9e23384506, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c7c7366d12, %r1, %r9
	setx	0xa3d3ad6af19c175d, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d7c5e7b048, %r1, %r9
	setx	0x4956f5fd29e5f9db, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e7aa6b0b2c, %r1, %r9
	setx	0xd3771bc65235e51f, %r1, %r10
	stb	%r10, [%r9]
	setx	0x0000001080100000, %r1, %r9
	setx	0xd3771bc65235e51f, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f347172c9a, %r1, %r9
	setx	0x67aaa5586a2ba325, %r1, %r10
	stb	%r10, [%r9]
	setx	0x00000010b0100000, %r1, %r9
	setx	0x67aaa5586a2ba325, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800e298e92, %r1, %r9
	setx	0x1030ec7d8a9604b2, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f2b5e68, %r1, %r9
	setx	0x22833845afdb5741, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000cebe690e88, %r1, %r9
	setx	0x75edd024d26eb3db, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d9246b8578, %r1, %r9
	setx	0x75a3e6f35d48a13b, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000ef19310f9a, %r1, %r9
	setx	0xaed1a2062428df7f, %r1, %r10
	sth	%r10, [%r9]
	setx	0x0000001060100000, %r1, %r9
	setx	0xaed1a2062428df7f, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000f0a8df01ac, %r1, %r9
	setx	0xd511752886c917a4, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e677540, %r1, %r9
	setx	0xc836abd62b50d000, %r1, %r10
	stw	%r10, [%r9]
	setx	0x00000010b0100000, %r1, %r9
	setx	0xc836abd62b50d000, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f404998, %r1, %r9
	setx	0x69757a2ce1a645ad, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c72f67ca18, %r1, %r9
	setx	0xdf67a506c9b234bc, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d38c140fac, %r1, %r9
	setx	0x685edd9e6c4397c5, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000ea253cea68, %r1, %r9
	setx	0x097834284c63dfa6, %r1, %r10
	stw	%r10, [%r9]
	setx	0x0000001090100000, %r1, %r9
	setx	0x097834284c63dfa6, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f839f85e7c, %r1, %r9
	setx	0x70e084a709e3b8d1, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e5614a8, %r1, %r9
	setx	0xe47e992989e72d7b, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f703188, %r1, %r9
	setx	0xc5d6fdf801048d25, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c7bbcf2750, %r1, %r9
	setx	0x99efde2c920d43c6, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000001040100000, %r1, %r9
	setx	0x99efde2c920d43c6, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d786a9d140, %r1, %r9
	setx	0xb18a74feb38f1d4e, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e3407a6b48, %r1, %r9
	setx	0x7ceb42356539015b, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f8a20297b0, %r1, %r9
	setx	0x62cd9854d95c24f9, %r1, %r10
	stx	%r10, [%r9]
	setx	0x00000010e0100000, %r1, %r9
	setx	0x62cd9854d95c24f9, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000cdca432b22, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800f602276, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800ece4188, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000f18d1dfbf4, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000e0c0276864, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000d7e8dc7f5c, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000d83a7618f8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000c4e579a850, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800f6e5300, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800eb2fad8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000f8a20297b0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000804722638b, %r1, %r9
	setx	0xe13f1081d4d11c40, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800ee3a730, %r1, %r9
	setx	0x35786dc08e8e7995, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f77e1fe, %r1, %r9
	setx	0x3a9eb159196924f1, %r1, %r10
	stb	%r10, [%r9]
	setx	0x0000001010100000, %r1, %r9
	setx	0x3a9eb159196924f1, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000c58fc46098, %r1, %r9
	setx	0x576cc7bd569e61ca, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000dd9c3eeb55, %r1, %r9
	setx	0x000e4636662231a1, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000edcc04d487, %r1, %r9
	setx	0x6fe8694848d3fcd7, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f6c81ee5eb, %r1, %r9
	setx	0x496ede6ab413e366, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800ea0010e, %r1, %r9
	setx	0xaa7c42e41dbd84e2, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800fdde748, %r1, %r9
	setx	0xc2d22e1b216abe90, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000cdedde53e2, %r1, %r9
	setx	0x11e5ab8190f99618, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d15c131b8e, %r1, %r9
	setx	0xe9dbe65eb3d57d13, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000ef3f90a6d8, %r1, %r9
	setx	0xc290dad0cdc31657, %r1, %r10
	sth	%r10, [%r9]
	setx	0x00000010b0100000, %r1, %r9
	setx	0xc290dad0cdc31657, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f2b2e790ea, %r1, %r9
	setx	0x6b734f6658cd6d85, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e10e950, %r1, %r9
	setx	0x1d407e48c31f60d4, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f65924c, %r1, %r9
	setx	0x6248613a52a381c8, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c82062ae18, %r1, %r9
	setx	0x033c02ef97877019, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000dc3042d214, %r1, %r9
	setx	0xff3647f90a7c34d7, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e2223a2a10, %r1, %r9
	setx	0xdd8a31b96550ba1f, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f4372e9a24, %r1, %r9
	setx	0xf4f1a5975ef28b34, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e377398, %r1, %r9
	setx	0x958cfe56d71d6f16, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f71b890, %r1, %r9
	setx	0x96c458a62fb2d692, %r1, %r10
	stx	%r10, [%r9]
	setx	0x00000010c0100000, %r1, %r9
	setx	0x96c458a62fb2d692, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000c487c8c7d0, %r1, %r9
	setx	0x617155820c3e97d6, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000de7f3d8170, %r1, %r9
	setx	0xc75bae8f36ab7731, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e4cb939210, %r1, %r9
	setx	0x313ca9b135a757da, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f8a20297b0, %r1, %r9
	setx	0xfb1240a10034bc6b, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800e5f3766, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000f0ec4df7c2, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000e3e0611966, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000f8a20297b0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000e3407a6b48, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000d786a9d140, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000c7bbcf2750, %r1, %r12
	ldx	[%r12], %r11
	setx	0x00000080631415ef, %r1, %r9
	setx	0x3d291f275d6e5b04, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e9645c5, %r1, %r9
	setx	0xbc92b44df78f1cbd, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f06209a, %r1, %r9
	setx	0x2abb4ad34aaad611, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c09176e623, %r1, %r9
	setx	0xa95f1f1a1cf367ba, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000db99781f89, %r1, %r9
	setx	0x8d629128047980f8, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e9f19345dd, %r1, %r9
	setx	0x0a09ee7e02a0cdb9, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f47da1f51e, %r1, %r9
	setx	0xb5f7096ceb41d07c, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e5b6bb8, %r1, %r9
	setx	0x321a6d6cad5aafc9, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800fe72dd4, %r1, %r9
	setx	0xa65ca672dcf4af7a, %r1, %r10
	sth	%r10, [%r9]
	setx	0x00000010f0100000, %r1, %r9
	setx	0xa65ca672dcf4af7a, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000ccdc3e66d4, %r1, %r9
	setx	0xede88f0e78ce37a7, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d03309cd3e, %r1, %r9
	setx	0xda74f77c75a99d58, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e9720f15e0, %r1, %r9
	setx	0x93ff1ec8993526b5, %r1, %r10
	sth	%r10, [%r9]
	setx	0x00000010f0100000, %r1, %r9
	setx	0x93ff1ec8993526b5, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f98089d710, %r1, %r9
	setx	0x0b6198ecf8b47e69, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e862560, %r1, %r9
	setx	0xe21a163edaeb132c, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f5ceb98, %r1, %r9
	setx	0x668f5f5d800f0457, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c77d82a5a0, %r1, %r9
	setx	0xc3cdfe19692afcee, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d9e2905808, %r1, %r9
	setx	0xe5bce8e35bc1651e, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000ed6b0ca524, %r1, %r9
	setx	0x48bcb2ba736dc75b, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000fc01a3e960, %r1, %r9
	setx	0x8546c3a2b34ff556, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800ee731a8, %r1, %r9
	setx	0x3f10a703bfd33315, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800fda6be0, %r1, %r9
	setx	0x5a3dee0380ea56e8, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c3963f6738, %r1, %r9
	setx	0xd4edc9c80eddfc41, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d9f8565918, %r1, %r9
	setx	0xd12aed0d68a97fa4, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ecf8ce1c40, %r1, %r9
	setx	0xb2ab0898cd811767, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f8a20297b0, %r1, %r9
	setx	0xf28d34afa79f9d38, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800e44c4e0, %r1, %r12
	ldub	[%r12], %r11
	setx	0x0000001010100000, %r1, %r9
	setx	0xf28d34afa79f9d38, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000d8e8c5f89e, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000ce99fe5eb8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800f29d292, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e024af4, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000fb03d65298, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000e91672af9c, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000d5d8e47998, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000cc498d9788, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800fe4bb40, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e9cc608, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000f8a20297b0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x00000080c065a426, %r1, %r9
	setx	0x75507807e7d7bd39, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e252246, %r1, %r9
	setx	0x1bf4bfc4a362a8f6, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f52666c, %r1, %r9
	setx	0xa7dd4899997a8663, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c03fe74305, %r1, %r9
	setx	0x037427930f9c8774, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d5b828234c, %r1, %r9
	setx	0x653561395dd46378, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ec78fa4e0e, %r1, %r9
	setx	0x94b7fff86f56688c, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000fe5541a7d6, %r1, %r9
	setx	0x793178de6e7253de, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e92290c, %r1, %r9
	setx	0x7ec2709b2c1e42ff, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800fe44d82, %r1, %r9
	setx	0x650fbaa22e6c5b21, %r1, %r10
	sth	%r10, [%r9]
	setx	0x00000010f0100000, %r1, %r9
	setx	0x650fbaa22e6c5b21, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c4979cd5fe, %r1, %r9
	setx	0x5b58c98f90b742ef, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000dfe8ac1cba, %r1, %r9
	setx	0xbcbdc0668af58edb, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e0b46070c0, %r1, %r9
	setx	0x37806d9fc1c7649d, %r1, %r10
	sth	%r10, [%r9]
	setx	0x0000001010100000, %r1, %r9
	setx	0x37806d9fc1c7649d, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000f08389b8ee, %r1, %r9
	setx	0xaf0546fd0fa9170b, %r1, %r10
	sth	%r10, [%r9]
	setx	0x00000010a0100000, %r1, %r9
	setx	0xaf0546fd0fa9170b, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800e611730, %r1, %r9
	setx	0x264e4c190f251ccc, %r1, %r10
	stw	%r10, [%r9]
	setx	0x0000001000100000, %r1, %r9
	setx	0x264e4c190f251ccc, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800fbd0170, %r1, %r9
	setx	0x085cafe02569e16d, %r1, %r10
	stw	%r10, [%r9]
	setx	0x00000010d0100000, %r1, %r9
	setx	0x085cafe02569e16d, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000c57d41c654, %r1, %r9
	setx	0x652965869fa19645, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d6a53472ac, %r1, %r9
	setx	0x45f42fce5ff8689d, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000eb10ed6608, %r1, %r9
	setx	0x3185f04c837b3cd4, %r1, %r10
	stw	%r10, [%r9]
	setx	0x00000010e0100000, %r1, %r9
	setx	0x3185f04c837b3cd4, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f5800c7ad0, %r1, %r9
	setx	0x4275a697b63fd309, %r1, %r10
	stw	%r10, [%r9]
	setx	0x0000001070100000, %r1, %r9
	setx	0x4275a697b63fd309, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800e047550, %r1, %r9
	setx	0x85143913052295b8, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f27bc10, %r1, %r9
	setx	0xf21a3cd3b95aa220, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000cb58e13b30, %r1, %r9
	setx	0xa7b1e3bdf53cb3ad, %r1, %r10
	stx	%r10, [%r9]
	setx	0x00000010b0100000, %r1, %r9
	setx	0xa7b1e3bdf53cb3ad, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000d75fefaa70, %r1, %r9
	setx	0x656e0e2dbd7b827b, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000001090100000, %r1, %r9
	setx	0x656e0e2dbd7b827b, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ef069d4298, %r1, %r9
	setx	0xae16abf7f11866aa, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000001030100000, %r1, %r9
	setx	0xae16abf7f11866aa, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f8a20297b0, %r1, %r9
	setx	0x9bc3f0fa57fe1fff, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f6c81ee5eb, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000edcc04d487, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000dd9c3eeb55, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000e3e0611966, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000dd21f742aa, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d9e2905808, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000efdee374c0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000d6f31ee1e0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000c47dfa18f8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000801ee8562a, %r1, %r9
	setx	0xf3ef4ca79b2a77a6, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800ea5a8d4, %r1, %r9
	setx	0x83edfe8e2a142713, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f90cc9a, %r1, %r9
	setx	0x43d79df678653d03, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c6c3af51da, %r1, %r9
	setx	0xc6148d7413ba86d2, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000dc02e717ba, %r1, %r9
	setx	0xeaa6e3ecafbfece8, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ed5212be06, %r1, %r9
	setx	0xc05c298b2bce3a41, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f0d12b6ca2, %r1, %r9
	setx	0x7ec241ecfbfef756, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e150c14, %r1, %r9
	setx	0x2cca086603f036dc, %r1, %r10
	sth	%r10, [%r9]
	setx	0x0000001010100000, %r1, %r9
	setx	0x2cca086603f036dc, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800f7a0f6a, %r1, %r9
	setx	0xedb3abdf82c4e616, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c1d780bcb4, %r1, %r9
	setx	0xf4f5b2e80653a86c, %r1, %r10
	sth	%r10, [%r9]
	setx	0x00000010f0100000, %r1, %r9
	setx	0xf4f5b2e80653a86c, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000dcae42a9dc, %r1, %r9
	setx	0x18f550bbbde92bb4, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000ed9567e482, %r1, %r9
	setx	0xbe8cad1cac96d932, %r1, %r10
	sth	%r10, [%r9]
	setx	0x0000001040100000, %r1, %r9
	setx	0xbe8cad1cac96d932, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f5592e9220, %r1, %r9
	setx	0x91c062f7c1cd1cb5, %r1, %r10
	sth	%r10, [%r9]
	setx	0x00000010c0100000, %r1, %r9
	setx	0x91c062f7c1cd1cb5, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800e6bd5b0, %r1, %r9
	setx	0x03ccd1ff30e4298c, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800fc85334, %r1, %r9
	setx	0x9b737e0579e8915b, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c2f5266ba4, %r1, %r9
	setx	0xcfbffb476f0f175f, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d3dfd10a68, %r1, %r9
	setx	0x0ea5428271edf671, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e6940a61cc, %r1, %r9
	setx	0xa33b4e843f26ec61, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000fe7a9c3c44, %r1, %r9
	setx	0x071bade922c67bb5, %r1, %r10
	stw	%r10, [%r9]
	setx	0x00000010d0100000, %r1, %r9
	setx	0x071bade922c67bb5, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800eac4728, %r1, %r9
	setx	0x9d376d68e3c048d3, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f95a998, %r1, %r9
	setx	0xf308f390c8a9055e, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000cb50242630, %r1, %r9
	setx	0x22ecff199a40c50b, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d3c5a51008, %r1, %r9
	setx	0x928fa104a4304e86, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000001080100000, %r1, %r9
	setx	0x928fa104a4304e86, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e45cabe248, %r1, %r9
	setx	0x38fabbfe28744e77, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f8a20297b0, %r1, %r9
	setx	0x2e98a91faadd58a8, %r1, %r10
	stx	%r10, [%r9]
	setx	0x00000080edd81f65, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000dac9cc525e, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000cc28148cd8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800f180bc8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800e3c6834, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000f69152c928, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000ee9a93de68, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000808252365d, %r1, %r9
	setx	0xe1a8807c2c6e2a36, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e485932, %r1, %r9
	setx	0x8b1e3e51b490f9b7, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f5edf47, %r1, %r9
	setx	0xe5cf71b534b8dda8, %r1, %r10
	stb	%r10, [%r9]
	setx	0x0000001090100000, %r1, %r9
	setx	0xe5cf71b534b8dda8, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c44da47aec, %r1, %r9
	setx	0x61c539552ee67da6, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d620222233, %r1, %r9
	setx	0x5d599d738f4e13ed, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e92e5dba35, %r1, %r9
	setx	0x6936c9ac954c2323, %r1, %r10
	stb	%r10, [%r9]
	setx	0x0000001030100000, %r1, %r9
	setx	0x6936c9ac954c2323, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f9fb71a4f7, %r1, %r9
	setx	0xf1e8782747109499, %r1, %r10
	stb	%r10, [%r9]
	setx	0x0000001040100000, %r1, %r9
	setx	0xf1e8782747109499, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800ea64f9a, %r1, %r9
	setx	0xb4acbd25ba314d31, %r1, %r10
	sth	%r10, [%r9]
	setx	0x0000001090100000, %r1, %r9
	setx	0xb4acbd25ba314d31, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800f44f0f6, %r1, %r9
	setx	0x7e4679d46f645d6b, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c0bd59a1e6, %r1, %r9
	setx	0x865928eb18a83a18, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000dbba977e2a, %r1, %r9
	setx	0x5b528f6338eef32f, %r1, %r10
	sth	%r10, [%r9]
	setx	0x0000001000100000, %r1, %r9
	setx	0x5b528f6338eef32f, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e8728a88d8, %r1, %r9
	setx	0xa61419431345a3bd, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f2afff1806, %r1, %r9
	setx	0xba5e613c9591775e, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e9764bc, %r1, %r9
	setx	0xb5f585307d4eb5de, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800fa63eec, %r1, %r9
	setx	0x78a08fd488fffb92, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c1d02b099c, %r1, %r9
	setx	0xf583e005e84fce1f, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d19a02d23c, %r1, %r9
	setx	0x650664b1e905add6, %r1, %r10
	stw	%r10, [%r9]
	setx	0x00000010e0100000, %r1, %r9
	setx	0x650664b1e905add6, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000eee5e2a3d8, %r1, %r9
	setx	0x6c33a062212b981f, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f46d1e5a64, %r1, %r9
	setx	0xd87416700df86640, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e229c10, %r1, %r9
	setx	0xb14ad51c045d6801, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800fad6628, %r1, %r9
	setx	0xacc3014da428f9f3, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c500ab6c98, %r1, %r9
	setx	0xa653bee03a4c9e2e, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000da1916e868, %r1, %r9
	setx	0x67ff94a071b11859, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ed63156930, %r1, %r9
	setx	0x6b015d91fd97d9ff, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f8a20297b0, %r1, %r9
	setx	0xba2edd09d0df32d2, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000001030100000, %r1, %r9
	setx	0xba2edd09d0df32d2, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800f6b559e, %r1, %r12
	ldub	[%r12], %r11
	setx	0x00000010b0100000, %r1, %r9
	setx	0xba2edd09d0df32d2, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800eb7c045, %r1, %r12
	ldub	[%r12], %r11
	setx	0x0000001060100000, %r1, %r9
	setx	0xba2edd09d0df32d2, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000805586926c, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000f9389d226e, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000e1058b60c3, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800e4e9898, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000f8c1f7c55a, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000e812b071d2, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d98a821cd4, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000f285056924, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000e859b58328, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000d9e09707a0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000c46cdbc108, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800fb071f0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x00000080b7ea5aa8, %r1, %r9
	setx	0x5c0efef822833766, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800ee18f1c, %r1, %r9
	setx	0xf16bddb2e220d06f, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f22c5c7, %r1, %r9
	setx	0xc6e3a4bc8d0a5d56, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c666c02d22, %r1, %r9
	setx	0xd801236a85a19a5a, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d2c2365a1a, %r1, %r9
	setx	0x8f814d4a8469d033, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ef11b8c8d7, %r1, %r9
	setx	0xca2ede9e201b4190, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f09be87b9d, %r1, %r9
	setx	0x1318fea745c86bbd, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e070930, %r1, %r9
	setx	0xe1bc0f18dbc9ef38, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f5b5d78, %r1, %r9
	setx	0x0f114c4e96fbade8, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000ce53de9440, %r1, %r9
	setx	0xec37616cbbbbe9a4, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d1d04dc88c, %r1, %r9
	setx	0x74664808782079ef, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e58568ba84, %r1, %r9
	setx	0x44d1e5a79f5faa4e, %r1, %r10
	sth	%r10, [%r9]
	setx	0x0000001060100000, %r1, %r9
	setx	0x44d1e5a79f5faa4e, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f8a63eb644, %r1, %r9
	setx	0xd152b24f4a2c1684, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800ea420ec, %r1, %r9
	setx	0xac228e317a2d68eb, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f443a98, %r1, %r9
	setx	0x0cff78d73ea18986, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c21c119488, %r1, %r9
	setx	0xd4af4e0bb284cfb0, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000df7123ef08, %r1, %r9
	setx	0x2e0712f26b46a7b7, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000ec53af80fc, %r1, %r9
	setx	0xb211e5711691de63, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000fd2e84ac44, %r1, %r9
	setx	0xe4fd48ddf0bfea61, %r1, %r10
	stw	%r10, [%r9]
	setx	0x0000001050100000, %r1, %r9
	setx	0xe4fd48ddf0bfea61, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800e2a7048, %r1, %r9
	setx	0xd919e199927cddf2, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f06f580, %r1, %r9
	setx	0x44bcee47081c2725, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c45957a5b0, %r1, %r9
	setx	0x7ca23949e88c87b9, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000001050100000, %r1, %r9
	setx	0x7ca23949e88c87b9, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000d3e630ea30, %r1, %r9
	setx	0xd4c90989ac094f33, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e6ef7f61d0, %r1, %r9
	setx	0xa6285cef74240f9c, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f8a20297b0, %r1, %r9
	setx	0xdf493417e0e3862e, %r1, %r10
	stx	%r10, [%r9]
	setx	0x00000010e0100000, %r1, %r9
	setx	0xdf493417e0e3862e, %r1, %r10
	stx	%r10, [%r9]
	setx	0x00000080ed5594bd, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000f3989862cf, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000e6641e3a52, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000d30c0da78a, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000c3d05ea576, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000c2218c630c, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000f69152c928, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000ee9a93de68, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000d49cbc1418, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000c717638974, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800f2822f8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800e45d1e8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000f8a20297b0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x0000008060960694, %r1, %r9
	setx	0xfa0d6e542ad4c782, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e6d64a0, %r1, %r9
	setx	0x761d8abdd4de47ca, %r1, %r10
	stb	%r10, [%r9]
	setx	0x0000001060100000, %r1, %r9
	setx	0x761d8abdd4de47ca, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800fb5e465, %r1, %r9
	setx	0x31601008470b2653, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c7c3447f8f, %r1, %r9
	setx	0xe23ff1fedba84d77, %r1, %r10
	stb	%r10, [%r9]
	setx	0x0000001050100000, %r1, %r9
	setx	0xe23ff1fedba84d77, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d747771c6a, %r1, %r9
	setx	0x31c018c4ecf7bdf4, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e1ed7245db, %r1, %r9
	setx	0xc1f353926dbe87e5, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f261271391, %r1, %r9
	setx	0x1d70916a94159105, %r1, %r10
	stb	%r10, [%r9]
	setx	0x00000010d0100000, %r1, %r9
	setx	0x1d70916a94159105, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800e3d408a, %r1, %r9
	setx	0x707d38a83347ad67, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800fff23b2, %r1, %r9
	setx	0xbefdd8e7365e678b, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000ce708c08c8, %r1, %r9
	setx	0xc4c1b73494d7d9c9, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d1071b35d0, %r1, %r9
	setx	0xcb4950dd545c4c58, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e6fdcf16aa, %r1, %r9
	setx	0x38dbaacc14acee7c, %r1, %r10
	sth	%r10, [%r9]
	setx	0x0000001090100000, %r1, %r9
	setx	0x38dbaacc14acee7c, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f35fd4885a, %r1, %r9
	setx	0x48b0ee50331a4ec7, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e4ff250, %r1, %r9
	setx	0xa825278087ce0ec6, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f381ae4, %r1, %r9
	setx	0xe0c1e61e627ad1f7, %r1, %r10
	stw	%r10, [%r9]
	setx	0x00000010f0100000, %r1, %r9
	setx	0xe0c1e61e627ad1f7, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000c2dd835150, %r1, %r9
	setx	0x040787f02cd8b5a8, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d9b0c090dc, %r1, %r9
	setx	0x4b3c05ddbc8ee8ea, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e620b88830, %r1, %r9
	setx	0xd86b7d3eff1a51ba, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000fe7d02df4c, %r1, %r9
	setx	0x2d4675b061c135e2, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e684e28, %r1, %r9
	setx	0x274e2f2c112d0a6f, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f35aa18, %r1, %r9
	setx	0x3e2cfd294a2e41d6, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c85a998f50, %r1, %r9
	setx	0xc7e5beece838cde1, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000001010100000, %r1, %r9
	setx	0xc7e5beece838cde1, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000d578fc3cc0, %r1, %r9
	setx	0x68978e2dec906543, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000001050100000, %r1, %r9
	setx	0x68978e2dec906543, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000ec952c8490, %r1, %r9
	setx	0x36276e395bb085e2, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f8a20297b0, %r1, %r9
	setx	0x4519631a05080410, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800fe2a16b, %r1, %r12
	ldub	[%r12], %r11
	setx	0x0000001020100000, %r1, %r9
	setx	0x4519631a05080410, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800eeed292, %r1, %r12
	ldub	[%r12], %r11
	setx	0x00000010d0100000, %r1, %r9
	setx	0x4519631a05080410, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000802a093863, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000fa08ede5ee, %r1, %r12
	ldub	[%r12], %r11
	setx	0x0000001020100000, %r1, %r9
	setx	0x4519631a05080410, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e16484096e, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000d5294faa1c, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000d02dce38ee, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000c6568c982c, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800f969ca8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e3e3c82, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000f49bc08b9a, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000eee5e2a3d8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000d19a02d23c, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000c1d02b099c, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800f9f16c8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e5f4958, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000f8a20297b0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000e113e0edf8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000d83a7618f8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000808845f726, %r1, %r9
	setx	0xd9edd8a0ba44a160, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800eaa604f, %r1, %r9
	setx	0x6244f8205bd5ad56, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800fe59a5a, %r1, %r9
	setx	0xe7f38539a874b015, %r1, %r10
	stb	%r10, [%r9]
	setx	0x00000010c0100000, %r1, %r9
	setx	0xe7f38539a874b015, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000c1c9d8ff4d, %r1, %r9
	setx	0xdd2373363498f41e, %r1, %r10
	stb	%r10, [%r9]
	setx	0x00000010d0100000, %r1, %r9
	setx	0xdd2373363498f41e, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d707983ae4, %r1, %r9
	setx	0x7734a056b8c4b14d, %r1, %r10
	stb	%r10, [%r9]
	setx	0x00000010e0100000, %r1, %r9
	setx	0x7734a056b8c4b14d, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000e2092d4b5b, %r1, %r9
	setx	0x0831f7b3508b8cb2, %r1, %r10
	stb	%r10, [%r9]
	setx	0x0000001060100000, %r1, %r9
	setx	0x0831f7b3508b8cb2, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f84c95a368, %r1, %r9
	setx	0x2a20de81ffbaf3a4, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e9b4dd8, %r1, %r9
	setx	0xdff155814ec8e12c, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800fc0c5fa, %r1, %r9
	setx	0xe105defab89431c4, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000cfcc7a52ec, %r1, %r9
	setx	0xd6a0009120660fe6, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000dcb98cb128, %r1, %r9
	setx	0xe96c49788f08d2cb, %r1, %r10
	sth	%r10, [%r9]
	setx	0x0000001040100000, %r1, %r9
	setx	0xe96c49788f08d2cb, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ee598d1476, %r1, %r9
	setx	0x06c6178c951aeafd, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f5a1544952, %r1, %r9
	setx	0xb8fb4ca396075916, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800eedaca0, %r1, %r9
	setx	0xc14bfd1456613203, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f7ed308, %r1, %r9
	setx	0xa7b4c8f94319d26b, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c9e24dfe44, %r1, %r9
	setx	0xeb3c5f1eed929980, %r1, %r10
	stw	%r10, [%r9]
	setx	0x0000001060100000, %r1, %r9
	setx	0xeb3c5f1eed929980, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000d3995858b8, %r1, %r9
	setx	0xd539fc9a8cc21d28, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e7c8b07264, %r1, %r9
	setx	0x7b0eae479425f834, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000fb4488a490, %r1, %r9
	setx	0x1074881248fc7f81, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e35efe8, %r1, %r9
	setx	0x11062ec9faa3bac0, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f658380, %r1, %r9
	setx	0x317fe4ad63d105a1, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c1ddc4a4a8, %r1, %r9
	setx	0xfda03d52f9e7ef95, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d3f70b1b70, %r1, %r9
	setx	0x41413527a6737122, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e8b52c4430, %r1, %r9
	setx	0x2d537335cdf5bf12, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f8a20297b0, %r1, %r9
	setx	0x2cf026cbe7fce121, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f244ca5, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800ebd438f, %r1, %r12
	ldub	[%r12], %r11
	setx	0x00000080edd81f65, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000f2add2804e, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000e86003a141, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000c91c0a1998, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e10e950, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000f839f85e7c, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000ea253cea68, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000d38c140fac, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000c72f67ca18, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000c2d5aa6a00, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800f4072b8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800ec444d0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000f8a20297b0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000801108dd8c, %r1, %r9
	setx	0x50800625aeb4f7ec, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e0103c3, %r1, %r9
	setx	0x90f6e83c83ad9649, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800fa5be2f, %r1, %r9
	setx	0x750b2ab4abd6f171, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000cdfc0417df, %r1, %r9
	setx	0x67e1f6c0c49b9729, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000da9416f5fa, %r1, %r9
	setx	0xa3c845c5c46f1b99, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e2a67d1d13, %r1, %r9
	setx	0xd4e80926d5ceafb0, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f2e2826f82, %r1, %r9
	setx	0x158be7f48fc5e8b2, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e4b5dc2, %r1, %r9
	setx	0xf349b8a9e91f8546, %r1, %r10
	sth	%r10, [%r9]
	setx	0x00000010b0100000, %r1, %r9
	setx	0xf349b8a9e91f8546, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f7d695a, %r1, %r9
	setx	0x5043be15e35e4b96, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c0b74a41a2, %r1, %r9
	setx	0x1dbb845d4f64327f, %r1, %r10
	sth	%r10, [%r9]
	setx	0x00000010a0100000, %r1, %r9
	setx	0x1dbb845d4f64327f, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000def3b1582a, %r1, %r9
	setx	0xdfb8897a1b9b7eac, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e33c6599f0, %r1, %r9
	setx	0x8f8b629fca2f16de, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f6f0e09ef6, %r1, %r9
	setx	0x108245ff42d03d2f, %r1, %r10
	sth	%r10, [%r9]
	setx	0x00000010a0100000, %r1, %r9
	setx	0x108245ff42d03d2f, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800e4a0180, %r1, %r9
	setx	0x303b8d965cae3051, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f2b29d8, %r1, %r9
	setx	0x0e018260d1a693f1, %r1, %r10
	stw	%r10, [%r9]
	setx	0x0000001040100000, %r1, %r9
	setx	0x0e018260d1a693f1, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000c0ab1ca248, %r1, %r9
	setx	0x4aa107e26d457be2, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d3edd045c8, %r1, %r9
	setx	0x4e60702af183a94c, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e2645a8b30, %r1, %r9
	setx	0xf68a702956f4a4f5, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f34a217af0, %r1, %r9
	setx	0x901f7c9e3b61b282, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800ef31760, %r1, %r9
	setx	0x0d3dd05af1882ce6, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800ff23b10, %r1, %r9
	setx	0x43c1672bb42bbe82, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c8e22d3140, %r1, %r9
	setx	0x441ce9906eb4b710, %r1, %r10
	stx	%r10, [%r9]
	setx	0x00000010b0100000, %r1, %r9
	setx	0x441ce9906eb4b710, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d78ea8fb20, %r1, %r9
	setx	0xcdd9a6244d9fbc11, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e3ebabbcb0, %r1, %r9
	setx	0xa76551d473966869, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f8a20297b0, %r1, %r9
	setx	0xe3569ba788373e03, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800fb5e465, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800e6d64a0, %r1, %r12
	ldub	[%r12], %r11
	setx	0x0000001060100000, %r1, %r9
	setx	0xe3569ba788373e03, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000cdcbda2a08, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800edb091c, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000f0d7079e0c, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000c3963f6738, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800fda6be0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800ee731a8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000f8a20297b0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000e4cb939210, %r1, %r12
	ldx	[%r12], %r11
	setx	0x00000080b5b115e7, %r1, %r9
	setx	0xb63c08bb2fc27b1a, %r1, %r10
	stb	%r10, [%r9]
	setx	0x0000001040100000, %r1, %r9
	setx	0xb63c08bb2fc27b1a, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800ecdba6d, %r1, %r9
	setx	0xd42f5c39494339fa, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f7589ed, %r1, %r9
	setx	0x742b74d28be3edc2, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c7f10a07d8, %r1, %r9
	setx	0x66343f482fa94af6, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000dbf1a73afa, %r1, %r9
	setx	0x774418c9d0d2efb3, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e42837ec4e, %r1, %r9
	setx	0xa553df96c3d42d54, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f0fed3808b, %r1, %r9
	setx	0x71ff53b9066da450, %r1, %r10
	stb	%r10, [%r9]
	setx	0x0000001000100000, %r1, %r9
	setx	0x71ff53b9066da450, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800e1c0226, %r1, %r9
	setx	0xe6ec0eefde75a949, %r1, %r10
	sth	%r10, [%r9]
	setx	0x0000001060100000, %r1, %r9
	setx	0xe6ec0eefde75a949, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f821d14, %r1, %r9
	setx	0x01abdbb41b710bf9, %r1, %r10
	sth	%r10, [%r9]
	setx	0x00000010a0100000, %r1, %r9
	setx	0x01abdbb41b710bf9, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000c0605d843a, %r1, %r9
	setx	0xa9f389455afe8543, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d741651924, %r1, %r9
	setx	0x3e171173059f5ad6, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e5841cbad8, %r1, %r9
	setx	0x0dbe495ddcc05c71, %r1, %r10
	sth	%r10, [%r9]
	setx	0x0000001060100000, %r1, %r9
	setx	0x0dbe495ddcc05c71, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000f445abe86a, %r1, %r9
	setx	0x3a3d8f478164c326, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e5418cc, %r1, %r9
	setx	0x25074d6b29b27d28, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f012fdc, %r1, %r9
	setx	0xc1fdabed5d294bc8, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c4d0c498c8, %r1, %r9
	setx	0x0bf388631352a098, %r1, %r10
	stw	%r10, [%r9]
	setx	0x00000010e0100000, %r1, %r9
	setx	0x0bf388631352a098, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000d8bb6f7564, %r1, %r9
	setx	0x5f7b16bbf6da3fb5, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e82845b1e4, %r1, %r9
	setx	0x9b0ded455336d7ff, %r1, %r10
	stw	%r10, [%r9]
	setx	0x00000010d0100000, %r1, %r9
	setx	0x9b0ded455336d7ff, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000fb19acd578, %r1, %r9
	setx	0xa442e95314abe028, %r1, %r10
	stw	%r10, [%r9]
	setx	0x0000001080100000, %r1, %r9
	setx	0xa442e95314abe028, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800e059de0, %r1, %r9
	setx	0xac6e160f6c76a6ac, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f3ad428, %r1, %r9
	setx	0x1e86031cf03881f7, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c8f3660de8, %r1, %r9
	setx	0x1caedf890fade1e6, %r1, %r10
	stx	%r10, [%r9]
	setx	0x00000010b0100000, %r1, %r9
	setx	0x1caedf890fade1e6, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d1760d8938, %r1, %r9
	setx	0x9e0c5bcc6f242cf9, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000edceb14d38, %r1, %r9
	setx	0x1f2242f8562a22de, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f8a20297b0, %r1, %r9
	setx	0x4484dfab937b8d57, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d1dc4ca20c, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000c5c7a22886, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800f5563f6, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d7cfc5b3f8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000c07c4164a8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800f202588, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800e024af4, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000fb03d65298, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000e91672af9c, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000f8a20297b0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000e6a2f795b0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000de23357358, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000ca0421ca00, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000807b0d5a13, %r1, %r9
	setx	0xbfb5c49252a8ff07, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800edcd92e, %r1, %r9
	setx	0xbdbab4a45a9b8888, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f1ae068, %r1, %r9
	setx	0xde16d5f15b24f6f1, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c1b00582c8, %r1, %r9
	setx	0x8c627878e7aa3669, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000dad044efc2, %r1, %r9
	setx	0x7cf59e91b9db20a8, %r1, %r10
	stb	%r10, [%r9]
	setx	0x0000001020100000, %r1, %r9
	setx	0x7cf59e91b9db20a8, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e29becf5a3, %r1, %r9
	setx	0x01910a6da9b763f7, %r1, %r10
	stb	%r10, [%r9]
	setx	0x00000010b0100000, %r1, %r9
	setx	0x01910a6da9b763f7, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f3c371edac, %r1, %r9
	setx	0xc6da1d8f6a4174df, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e0cade6, %r1, %r9
	setx	0x0b783d38b63d5b19, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800fb4d1d8, %r1, %r9
	setx	0xe62e1fc2b6617caf, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000cf82fcbd82, %r1, %r9
	setx	0x2675ca4428158ea3, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d5116a5e10, %r1, %r9
	setx	0xdd9a35496e72cd92, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000ec41b4779a, %r1, %r9
	setx	0xbbed7882851bf224, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000fb2f2cc560, %r1, %r9
	setx	0xcfd37d848bf6e9b9, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800eab1128, %r1, %r9
	setx	0xcc8b5abfe400c252, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f04abb4, %r1, %r9
	setx	0xfbb7a13179febf3b, %r1, %r10
	stw	%r10, [%r9]
	setx	0x00000010a0100000, %r1, %r9
	setx	0xfbb7a13179febf3b, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c5bb8946a4, %r1, %r9
	setx	0x1afae74ca9ae9957, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000daaa560b38, %r1, %r9
	setx	0x64ca3d8363a22525, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000ec2d9ca50c, %r1, %r9
	setx	0xa155f34fde668db3, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f8b661d144, %r1, %r9
	setx	0xbf2ad5e8ee966d77, %r1, %r10
	stw	%r10, [%r9]
	setx	0x0000001030100000, %r1, %r9
	setx	0xbf2ad5e8ee966d77, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800e6e14d0, %r1, %r9
	setx	0xa69284da9f1c7c0b, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f495690, %r1, %r9
	setx	0x86da8c74b6f2f2ab, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c85a72c9d8, %r1, %r9
	setx	0x14fc91d86bfb6f57, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000dc3f3fe808, %r1, %r9
	setx	0x1be5eaa0aa69f8f3, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000001030100000, %r1, %r9
	setx	0x1be5eaa0aa69f8f3, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e1c1b3df60, %r1, %r9
	setx	0x24f960ddea7b493f, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f8a20297b0, %r1, %r9
	setx	0x5c7cb22ba5cbf803, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c1c9d8ff4d, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800fe59a5a, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800eaa604f, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000808845f726, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000f261271391, %r1, %r12
	ldub	[%r12], %r11
	setx	0x0000001050100000, %r1, %r9
	setx	0x5c7cb22ba5cbf803, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d02dce38ee, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000c6568c982c, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800f969ca8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d001e9a5bc, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000c8cba159ec, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800fcd896c, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800e56bb2c, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000f38b1306f0, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000f8a20297b0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000e4cb939210, %r1, %r12
	ldx	[%r12], %r11
	setx	0x00000080b9cb0696, %r1, %r9
	setx	0xd7d46da6475a8822, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e3fcbde, %r1, %r9
	setx	0x0cd7b00a1cb34e65, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f3858d3, %r1, %r9
	setx	0x2a7c0730b9258a90, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c510ecc06a, %r1, %r9
	setx	0x3d22ebd1acb29049, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d6e064c7fa, %r1, %r9
	setx	0x6a4f8b0a9b7b2a25, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e93a42788c, %r1, %r9
	setx	0x76e39a32980bff81, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000fb8d5e611c, %r1, %r9
	setx	0xe15f8d0c8a500481, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800eebce48, %r1, %r9
	setx	0x2cb2b1432ace70a5, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f758d7c, %r1, %r9
	setx	0x9d72ecdddc5ea9f8, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000ccf9a2c632, %r1, %r9
	setx	0xaa96d56b8137fbc4, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d4c4eb74d4, %r1, %r9
	setx	0xa116d3e1b54b1f53, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e8abcbf2c2, %r1, %r9
	setx	0xb98816309fdb547c, %r1, %r10
	sth	%r10, [%r9]
	setx	0x0000001080100000, %r1, %r9
	setx	0xb98816309fdb547c, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000fbef44d74e, %r1, %r9
	setx	0x73cff14d8afdfe89, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e98f304, %r1, %r9
	setx	0xb980cbfe665ff370, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f196e90, %r1, %r9
	setx	0x19fd543b2be4a93d, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000cd839b5218, %r1, %r9
	setx	0x5c8d6e3845ef312d, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d55c33b1ac, %r1, %r9
	setx	0x8916c33ecb97d92c, %r1, %r10
	stw	%r10, [%r9]
	setx	0x0000001010100000, %r1, %r9
	setx	0x8916c33ecb97d92c, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000e7fddc94ac, %r1, %r9
	setx	0x35f504705e00cc71, %r1, %r10
	stw	%r10, [%r9]
	setx	0x0000001090100000, %r1, %r9
	setx	0x35f504705e00cc71, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000fe900161f4, %r1, %r9
	setx	0xdccc4bc6d8a3e352, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800eb8fed0, %r1, %r9
	setx	0x3aa2046c51146cd0, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f9e9dc0, %r1, %r9
	setx	0x9a51419e1d4a6d2f, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000001030100000, %r1, %r9
	setx	0x9a51419e1d4a6d2f, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000c09f3312a8, %r1, %r9
	setx	0xa070f14c32c016de, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000da07638718, %r1, %r9
	setx	0x124d5e0902f360bc, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000001050100000, %r1, %r9
	setx	0x124d5e0902f360bc, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000ec72df18d0, %r1, %r9
	setx	0x36d2b7e7923e30db, %r1, %r10
	stx	%r10, [%r9]
	setx	0x00000010b0100000, %r1, %r9
	setx	0x36d2b7e7923e30db, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f8a20297b0, %r1, %r9
	setx	0x12721fa473bcd013, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000fbb606bf3d, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000eaca6c5691, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800f81935e, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e7d577a, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000f32745e7fe, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000e3c412c222, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000eb10ed6608, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000d6a53472ac, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000c57d41c654, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800fda6be0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800ee731a8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000f8a20297b0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000e4cb939210, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000de7f3d8170, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000c487c8c7d0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x00000080b2aa5ced, %r1, %r9
	setx	0x6237fb9eb470a2dd, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800ed873ca, %r1, %r9
	setx	0x167739a4e682627e, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800fae7ae4, %r1, %r9
	setx	0xa80e7a51fbdac32c, %r1, %r10
	stb	%r10, [%r9]
	setx	0x0000001080100000, %r1, %r9
	setx	0xa80e7a51fbdac32c, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000c74378f0f4, %r1, %r9
	setx	0x0c519d9a4783d25f, %r1, %r10
	stb	%r10, [%r9]
	setx	0x00000010c0100000, %r1, %r9
	setx	0x0c519d9a4783d25f, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000d1aa8f8269, %r1, %r9
	setx	0x4761130f4348a82b, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e3cca35146, %r1, %r9
	setx	0xe44c7debd8c09418, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f30a2bad95, %r1, %r9
	setx	0x6251032a7eebb430, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e720478, %r1, %r9
	setx	0x74f7cab30cb1285a, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f876cc4, %r1, %r9
	setx	0x3df9c1f14a3b628f, %r1, %r10
	sth	%r10, [%r9]
	setx	0x00000010d0100000, %r1, %r9
	setx	0x3df9c1f14a3b628f, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000cfc645eccc, %r1, %r9
	setx	0x0c9c4b33cdd14800, %r1, %r10
	sth	%r10, [%r9]
	setx	0x0000001060100000, %r1, %r9
	setx	0x0c9c4b33cdd14800, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000d1477bd31a, %r1, %r9
	setx	0xf6e1696992071199, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000ec179796b0, %r1, %r9
	setx	0x5b18e00c7ec7be60, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f25f679566, %r1, %r9
	setx	0x48adc760346a2aa5, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e41fc70, %r1, %r9
	setx	0x38b224ae95a71bec, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800fcfe9b8, %r1, %r9
	setx	0x9a7200eeeed5b2e3, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c1d6100128, %r1, %r9
	setx	0xbefe96a6f03aa22b, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d615ccf998, %r1, %r9
	setx	0x3b5c62edc4bf82b5, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e7633a8f54, %r1, %r9
	setx	0x221d2cd287ccc5d1, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000fc7f002890, %r1, %r9
	setx	0xee84812a2d7cab20, %r1, %r10
	stw	%r10, [%r9]
	setx	0x00000010b0100000, %r1, %r9
	setx	0xee84812a2d7cab20, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800ebd0d20, %r1, %r9
	setx	0xb7e582044e216d55, %r1, %r10
	stx	%r10, [%r9]
	setx	0x00000010f0100000, %r1, %r9
	setx	0xb7e582044e216d55, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f9a46b8, %r1, %r9
	setx	0xf96882d985d3f95b, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000cf7ca568f0, %r1, %r9
	setx	0x5f5af3498b07d5f4, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d7776c7fa0, %r1, %r9
	setx	0x0f206a4cbf99f52b, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e80631a790, %r1, %r9
	setx	0x3b15a7a114f41bb5, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f8a20297b0, %r1, %r9
	setx	0x0ae536ec2fa33d2c, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800ebd438f, %r1, %r12
	ldub	[%r12], %r11
	setx	0x00000080edd81f65, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000f2add2804e, %r1, %r12
	ldub	[%r12], %r11
	setx	0x00000010b0100000, %r1, %r9
	setx	0x0ae536ec2fa33d2c, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000e86003a141, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000dec15892d0, %r1, %r12
	ldub	[%r12], %r11
	setx	0x0000001070100000, %r1, %r9
	setx	0x0ae536ec2fa33d2c, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c23604c83b, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800fea548d, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800e3d408a, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000f8a63eb644, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000e58568ba84, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d1d04dc88c, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000ce53de9440, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800f5b5d78, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e4ff250, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000fd2e84ac44, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000ec53af80fc, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000d78ea8fb20, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000c8e22d3140, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800ff23b10, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800ef31760, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000f8a20297b0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000e8b52c4430, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000d3f70b1b70, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000801fa0d8c9, %r1, %r9
	setx	0xccaf5a424603d4e8, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800ebf99bf, %r1, %r9
	setx	0x0a473866c37b6fef, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f4f2c60, %r1, %r9
	setx	0x19430238cd08fb52, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c1bd4382a2, %r1, %r9
	setx	0x0c93e81988bdec5f, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000da14a1222f, %r1, %r9
	setx	0x6d4f64c23412705b, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000eb1fd6b7a7, %r1, %r9
	setx	0x93c2c58bd62f9f17, %r1, %r10
	stb	%r10, [%r9]
	setx	0x0000001090100000, %r1, %r9
	setx	0x93c2c58bd62f9f17, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000f7310eda6c, %r1, %r9
	setx	0xc7dbf613297dd95d, %r1, %r10
	stb	%r10, [%r9]
	setx	0x0000001010100000, %r1, %r9
	setx	0xc7dbf613297dd95d, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800ee6a974, %r1, %r9
	setx	0xe698f84817933389, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f9c259c, %r1, %r9
	setx	0xda1bb2926529de3e, %r1, %r10
	sth	%r10, [%r9]
	setx	0x00000010c0100000, %r1, %r9
	setx	0xda1bb2926529de3e, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c0ba6fc39e, %r1, %r9
	setx	0x0596e1aace01d9e4, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000df1c6307f2, %r1, %r9
	setx	0x54c703e5f3bc12b7, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e2551140f6, %r1, %r9
	setx	0x05cf9c380dcc1d44, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f5ff6d4d28, %r1, %r9
	setx	0x32725fa428cee04f, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e3d8768, %r1, %r9
	setx	0x42893e01b503b9be, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800fdc37e8, %r1, %r9
	setx	0x5ed1ac8a2ccaaf72, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000ccc38137b8, %r1, %r9
	setx	0x7effa48fd82501c1, %r1, %r10
	stw	%r10, [%r9]
	setx	0x0000001050100000, %r1, %r9
	setx	0x7effa48fd82501c1, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d38fe2ff50, %r1, %r9
	setx	0x4eaa3233b6f1e57d, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e706300ae0, %r1, %r9
	setx	0xca699a03ea9e0250, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f1b711abf0, %r1, %r9
	setx	0x039a5c488243a836, %r1, %r10
	stw	%r10, [%r9]
	setx	0x0000001000100000, %r1, %r9
	setx	0x039a5c488243a836, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800e1b0bb8, %r1, %r9
	setx	0xb6f6c2035e88118d, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000001050100000, %r1, %r9
	setx	0xb6f6c2035e88118d, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800f5c66f8, %r1, %r9
	setx	0xa314314e8f0d22f7, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c6cec31788, %r1, %r9
	setx	0x856c59640968c203, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d878285428, %r1, %r9
	setx	0x2779a7752de73089, %r1, %r10
	stx	%r10, [%r9]
	setx	0x00000010c0100000, %r1, %r9
	setx	0x2779a7752de73089, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e8a176a218, %r1, %r9
	setx	0x14e48d3f77233811, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000001000100000, %r1, %r9
	setx	0x14e48d3f77233811, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f8a20297b0, %r1, %r9
	setx	0xdce2ee1c6dde0ee0, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800fe59a5a, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800eaa604f, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000808845f726, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000f261271391, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000e1ed7245db, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000d747771c6a, %r1, %r12
	ldub	[%r12], %r11
	setx	0x0000001040100000, %r1, %r9
	setx	0xdce2ee1c6dde0ee0, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000c7c3447f8f, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000eb00cff536, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d5857bac22, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000cdcbda2a08, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e024af4, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000fb03d65298, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000e91672af9c, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000d5d8e47998, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000d3762cbda0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000cc498d9788, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800fe4bb40, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000809f005b2f, %r1, %r9
	setx	0x9713b3d3d6e1bfd2, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800ebf31ec, %r1, %r9
	setx	0x8fe6f77c35a93366, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f193cff, %r1, %r9
	setx	0x99d76dc0383e135e, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c88a7196a9, %r1, %r9
	setx	0x992efed6a4c2e34c, %r1, %r10
	stb	%r10, [%r9]
	setx	0x0000001070100000, %r1, %r9
	setx	0x992efed6a4c2e34c, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d33c26fc99, %r1, %r9
	setx	0x37a65a65b9eb62e6, %r1, %r10
	stb	%r10, [%r9]
	setx	0x00000010f0100000, %r1, %r9
	setx	0x37a65a65b9eb62e6, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ea66940844, %r1, %r9
	setx	0x01536b699b835b57, %r1, %r10
	stb	%r10, [%r9]
	setx	0x00000010f0100000, %r1, %r9
	setx	0x01536b699b835b57, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f4de29b28d, %r1, %r9
	setx	0x0c1e2af3854120f5, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800ed15dbc, %r1, %r9
	setx	0xd93055b783e760a2, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800fe67540, %r1, %r9
	setx	0xb53461fee06a30d0, %r1, %r10
	sth	%r10, [%r9]
	setx	0x0000001050100000, %r1, %r9
	setx	0xb53461fee06a30d0, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ce4cbfe9de, %r1, %r9
	setx	0xcff1527f1a00e587, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d11c2e81a0, %r1, %r9
	setx	0xc37bfc8631276b64, %r1, %r10
	sth	%r10, [%r9]
	setx	0x00000010c0100000, %r1, %r9
	setx	0xc37bfc8631276b64, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ea6f7355ec, %r1, %r9
	setx	0x38ec532f173d6c52, %r1, %r10
	sth	%r10, [%r9]
	setx	0x00000010d0100000, %r1, %r9
	setx	0x38ec532f173d6c52, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f7ba33e2d4, %r1, %r9
	setx	0x170b44b07f57e4da, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800edc90f4, %r1, %r9
	setx	0x43b42551b0e3c927, %r1, %r10
	stw	%r10, [%r9]
	setx	0x0000001060100000, %r1, %r9
	setx	0x43b42551b0e3c927, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800f6966d8, %r1, %r9
	setx	0x5f876af4a8c0027f, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c1b0f542ec, %r1, %r9
	setx	0xbadb38b3205554be, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d825a6bf24, %r1, %r9
	setx	0xee924f29b4b1a001, %r1, %r10
	stw	%r10, [%r9]
	setx	0x0000001000100000, %r1, %r9
	setx	0xee924f29b4b1a001, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000e9ab2decb4, %r1, %r9
	setx	0x5ed3cfd62eaa754b, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000fe2c26b190, %r1, %r9
	setx	0x2fc3630b3654cd93, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800ee973b8, %r1, %r9
	setx	0xe13b12a5fe213b6f, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f17e000, %r1, %r9
	setx	0xfcb36991eee66869, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000001010100000, %r1, %r9
	setx	0xfcb36991eee66869, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c552cb7e50, %r1, %r9
	setx	0x2cd7f8a11dfc4399, %r1, %r10
	stx	%r10, [%r9]
	setx	0x00000010f0100000, %r1, %r9
	setx	0x2cd7f8a11dfc4399, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d6c6c65678, %r1, %r9
	setx	0x62bd2e41215d0ab7, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ee5f515870, %r1, %r9
	setx	0xddc806fcc25cd102, %r1, %r10
	stx	%r10, [%r9]
	setx	0x00000010c0100000, %r1, %r9
	setx	0xddc806fcc25cd102, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f8a20297b0, %r1, %r9
	setx	0xf77e0154ccaa060a, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ea02ca507b, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000d0315d5f81, %r1, %r12
	ldub	[%r12], %r11
	setx	0x0000001040100000, %r1, %r9
	setx	0xf77e0154ccaa060a, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000c4f26ed121, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000e8abcbf2c2, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d4c4eb74d4, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000ccf9a2c632, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800f758d7c, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800eebce48, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800ec3c5c4, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000f7c0189fa4, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000ef9a297298, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000da0bd7b970, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000cc28148cd8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800f180bc8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800e3c6834, %r1, %r12
	lduw	[%r12], %r11
	setx	0x00000080c8aeff6a, %r1, %r9
	setx	0xfb4b4853d2510489, %r1, %r10
	stb	%r10, [%r9]
	setx	0x00000010d0100000, %r1, %r9
	setx	0xfb4b4853d2510489, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800e108508, %r1, %r9
	setx	0xe7239d95b80698e6, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f186001, %r1, %r9
	setx	0x625204e4917c796a, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c99f39dc76, %r1, %r9
	setx	0x0e5b41ef101488aa, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d2424f3483, %r1, %r9
	setx	0x3e754ebf8193169b, %r1, %r10
	stb	%r10, [%r9]
	setx	0x0000001020100000, %r1, %r9
	setx	0x3e754ebf8193169b, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000e2c53a5a79, %r1, %r9
	setx	0x35117bad6a9a31c8, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f83157c17a, %r1, %r9
	setx	0xf6bce8ddcabce591, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800eb24b6e, %r1, %r9
	setx	0x1e3232971f36c5d5, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f7c1800, %r1, %r9
	setx	0x389fa149d03f2c28, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c14af46e90, %r1, %r9
	setx	0x601fcc90f2f77b69, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d2ac377c78, %r1, %r9
	setx	0x8820f5829adcb55a, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e0fd0a684c, %r1, %r9
	setx	0x9bb4e686678b6c2f, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000fd02354030, %r1, %r9
	setx	0xf2053bdce9b1a5c4, %r1, %r10
	sth	%r10, [%r9]
	setx	0x0000001070100000, %r1, %r9
	setx	0xf2053bdce9b1a5c4, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800e388154, %r1, %r9
	setx	0x4230dfd5326dc854, %r1, %r10
	stw	%r10, [%r9]
	setx	0x00000010a0100000, %r1, %r9
	setx	0x4230dfd5326dc854, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800fa4c260, %r1, %r9
	setx	0xbcbf035970389726, %r1, %r10
	stw	%r10, [%r9]
	setx	0x0000001020100000, %r1, %r9
	setx	0xbcbf035970389726, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000c82c3d9800, %r1, %r9
	setx	0xc8ff78fa82cad2a4, %r1, %r10
	stw	%r10, [%r9]
	setx	0x0000001020100000, %r1, %r9
	setx	0xc8ff78fa82cad2a4, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000ddb34507a4, %r1, %r9
	setx	0xf1af35b21e48213f, %r1, %r10
	stw	%r10, [%r9]
	setx	0x0000001000100000, %r1, %r9
	setx	0xf1af35b21e48213f, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ee25028ef8, %r1, %r9
	setx	0xf2245026b3ef9f8a, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f4644a1cb0, %r1, %r9
	setx	0x98d44f36abd21720, %r1, %r10
	stw	%r10, [%r9]
	setx	0x00000010e0100000, %r1, %r9
	setx	0x98d44f36abd21720, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800e578070, %r1, %r9
	setx	0x9187399a6e5ceaa1, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f414de8, %r1, %r9
	setx	0xf898a9c1f17c6b42, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000001070100000, %r1, %r9
	setx	0xf898a9c1f17c6b42, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000cb3b437998, %r1, %r9
	setx	0x569c16f647bc4c71, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d062b0fd48, %r1, %r9
	setx	0xa5cfae1e313fb2d8, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000001040100000, %r1, %r9
	setx	0xa5cfae1e313fb2d8, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e308ffa880, %r1, %r9
	setx	0x302f33ef7dfff11b, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f8a20297b0, %r1, %r9
	setx	0x0d401754676e1aaa, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e9f19345dd, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800fe44d82, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e92290c, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000f98089d710, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000e9720f15e0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d03309cd3e, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e2260b0, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000e06ce14e30, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000d81ca273f8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000cdc9b45fd8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800f4dc4d8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e407f08, %r1, %r12
	ldx	[%r12], %r11
	setx	0x0000008021f4a676, %r1, %r9
	setx	0x4f98f2fe7ccc036a, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800eee561a, %r1, %r9
	setx	0x398efe21c01db055, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f711dc0, %r1, %r9
	setx	0xdd6582d507408688, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c6eb6f57d5, %r1, %r9
	setx	0x7e7a13c6fcd8b7ee, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000de721f9dfa, %r1, %r9
	setx	0xbec997415066b8c4, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e8167fb7e0, %r1, %r9
	setx	0xaaca1a16e7d8e831, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f8f111a8bd, %r1, %r9
	setx	0xd73494ca62b4c44d, %r1, %r10
	stb	%r10, [%r9]
	setx	0x00000010d0100000, %r1, %r9
	setx	0xd73494ca62b4c44d, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800e50bf02, %r1, %r9
	setx	0x5a083bce6803d56f, %r1, %r10
	sth	%r10, [%r9]
	setx	0x00000010b0100000, %r1, %r9
	setx	0x5a083bce6803d56f, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800f4f8542, %r1, %r9
	setx	0x187e6a784fe397ff, %r1, %r10
	sth	%r10, [%r9]
	setx	0x0000001070100000, %r1, %r9
	setx	0x187e6a784fe397ff, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c4b8954964, %r1, %r9
	setx	0x1092e62f76e84bb2, %r1, %r10
	sth	%r10, [%r9]
	setx	0x0000001050100000, %r1, %r9
	setx	0x1092e62f76e84bb2, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000d407ba6216, %r1, %r9
	setx	0xae715a7af4131439, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000ea0aa0b1e8, %r1, %r9
	setx	0x73028f4fb3b80ca3, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f034d34778, %r1, %r9
	setx	0xfe3b065d438d8f5a, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800efc0ce4, %r1, %r9
	setx	0xf55402fb80ae01b3, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f4371c8, %r1, %r9
	setx	0xeb3f724c0435b12b, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000cc42488438, %r1, %r9
	setx	0x2bd92e9f1ad48d85, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d33a125b30, %r1, %r9
	setx	0x2f510a4df4636667, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e30f64cc54, %r1, %r9
	setx	0x65d24ef1d58fa162, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000faaf9f93b0, %r1, %r9
	setx	0xf19f63a1ca4ba8bf, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800ec396b0, %r1, %r9
	setx	0x478fd8919ef2ccf5, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800fa868a0, %r1, %r9
	setx	0xc28471fc1e261973, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000001030100000, %r1, %r9
	setx	0xc28471fc1e261973, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000cb7c3b4e00, %r1, %r9
	setx	0xef0768923bcdf6e0, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000dea87a7760, %r1, %r9
	setx	0xddd769c1b3fc6023, %r1, %r10
	stx	%r10, [%r9]
	setx	0x00000010c0100000, %r1, %r9
	setx	0xddd769c1b3fc6023, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000e8567c14f8, %r1, %r9
	setx	0x96636475f65c7e9d, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f8a20297b0, %r1, %r9
	setx	0x632563e6fb1ccbec, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f6b559e, %r1, %r12
	ldub	[%r12], %r11
	setx	0x00000010b0100000, %r1, %r9
	setx	0x632563e6fb1ccbec, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800eb7c045, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000805586926c, %r1, %r12
	ldub	[%r12], %r11
	setx	0x0000001060100000, %r1, %r9
	setx	0x632563e6fb1ccbec, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000f9389d226e, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000e1058b60c3, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000d1477bd31a, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d9e09707a0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000c46cdbc108, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800fb071f0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e75cad8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000f8a20297b0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x00000080f8e4136a, %r1, %r9
	setx	0xc3339b0a06221d39, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800ee83276, %r1, %r9
	setx	0x3375cd2c55d4d6e6, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f45b711, %r1, %r9
	setx	0xb5c38c2c9328917e, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c4973af1d6, %r1, %r9
	setx	0x2616b1bb2a635429, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d2901b2db5, %r1, %r9
	setx	0x29488f3149922902, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e6dab859c7, %r1, %r9
	setx	0xa1e2951be866bb12, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f2164549df, %r1, %r9
	setx	0xd3af20073ca70a97, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e130faa, %r1, %r9
	setx	0x51a9b179aa770e53, %r1, %r10
	sth	%r10, [%r9]
	setx	0x00000010f0100000, %r1, %r9
	setx	0x51a9b179aa770e53, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800fad0270, %r1, %r9
	setx	0xfa330c8b96b1ffe1, %r1, %r10
	sth	%r10, [%r9]
	setx	0x00000010f0100000, %r1, %r9
	setx	0xfa330c8b96b1ffe1, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000c1134ef10a, %r1, %r9
	setx	0xb29d034d65468bf6, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000dd060e98b8, %r1, %r9
	setx	0xa1371b0c40c8babe, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e7d567cf50, %r1, %r9
	setx	0x1b3a34f96c795166, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f3f7f98ad2, %r1, %r9
	setx	0x421130e8983c8312, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800ee5afb0, %r1, %r9
	setx	0xfaa7fe5f465e0cce, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800fcf4718, %r1, %r9
	setx	0x71c6eda165a445e9, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c65f6c8c80, %r1, %r9
	setx	0x6d453c7bae3e5845, %r1, %r10
	stw	%r10, [%r9]
	setx	0x00000010e0100000, %r1, %r9
	setx	0x6d453c7bae3e5845, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d9499d8c84, %r1, %r9
	setx	0xe8061fe584e2dd18, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e5267cc608, %r1, %r9
	setx	0xeeb8bd8033fcdc06, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f98aaffefc, %r1, %r9
	setx	0xe412587f75517b93, %r1, %r10
	stw	%r10, [%r9]
	setx	0x0000001090100000, %r1, %r9
	setx	0xe412587f75517b93, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800e54fb50, %r1, %r9
	setx	0x4cf2d6f2099352e0, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800fcd8980, %r1, %r9
	setx	0x1f10902b578650dd, %r1, %r10
	stx	%r10, [%r9]
	setx	0x00000010b0100000, %r1, %r9
	setx	0x1f10902b578650dd, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c90ebca540, %r1, %r9
	setx	0x9fa534003e8401fd, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d336797320, %r1, %r9
	setx	0x04b50acfa68d5fa5, %r1, %r10
	stx	%r10, [%r9]
	setx	0x00000010a0100000, %r1, %r9
	setx	0x04b50acfa68d5fa5, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000eb762dc7a8, %r1, %r9
	setx	0x121a9ff052760255, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f8a20297b0, %r1, %r9
	setx	0x9811316158d3c071, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000001010100000, %r1, %r9
	setx	0x9811316158d3c071, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000801108dd8c, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000f84c95a368, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000e2092d4b5b, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000d707983ae4, %r1, %r12
	ldub	[%r12], %r11
	setx	0x0000001050100000, %r1, %r9
	setx	0x9811316158d3c071, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c1c9d8ff4d, %r1, %r12
	ldub	[%r12], %r11
	setx	0x00000010c0100000, %r1, %r9
	setx	0x9811316158d3c071, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800fe59a5a, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000f2afff1806, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000e8728a88d8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000dbba977e2a, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000f8a20297b0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000ecf8ce1c40, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000d9f8565918, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000c3963f6738, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800fda6be0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800ee731a8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x00000080d00fd4e0, %r1, %r9
	setx	0xfda4646437e1793d, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e79067f, %r1, %r9
	setx	0x18789fe81f735a54, %r1, %r10
	stb	%r10, [%r9]
	setx	0x0000001080100000, %r1, %r9
	setx	0x18789fe81f735a54, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f4fe265, %r1, %r9
	setx	0x6381a7c4cff4d181, %r1, %r10
	stb	%r10, [%r9]
	setx	0x0000001050100000, %r1, %r9
	setx	0x6381a7c4cff4d181, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000c98c04a366, %r1, %r9
	setx	0xeea41400185122d6, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d7702884a6, %r1, %r9
	setx	0xac50859fdb9475a1, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e73e123af5, %r1, %r9
	setx	0x4ef94708987d494d, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f8b4b52e0f, %r1, %r9
	setx	0xc2ca25db94d03e83, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e6a81a8, %r1, %r9
	setx	0x095c640f9d153ad7, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f8181fa, %r1, %r9
	setx	0xdae445d08286e346, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000caec95f67a, %r1, %r9
	setx	0xf6b921a6b1dd62e6, %r1, %r10
	sth	%r10, [%r9]
	setx	0x0000001020100000, %r1, %r9
	setx	0xf6b921a6b1dd62e6, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000d7b02089f8, %r1, %r9
	setx	0x976801d483357e39, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000efe9a2ba22, %r1, %r9
	setx	0x5b9c8fa20162f9e6, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000fdac87457c, %r1, %r9
	setx	0xfec49b7a9adc62c5, %r1, %r10
	sth	%r10, [%r9]
	setx	0x0000001060100000, %r1, %r9
	setx	0xfec49b7a9adc62c5, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800e536edc, %r1, %r9
	setx	0xd36aa50b34e5cfd9, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800fd43f08, %r1, %r9
	setx	0x2ade96ded28795a8, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c15f858530, %r1, %r9
	setx	0xd25af6241512c0e4, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d11d771120, %r1, %r9
	setx	0x05cd46b14916c59f, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000ed2d314b5c, %r1, %r9
	setx	0x1fa788081ddc197e, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f3eb394740, %r1, %r9
	setx	0x4e5ab268b2a51149, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800ed78758, %r1, %r9
	setx	0x33ecc04e728ebd21, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f04da30, %r1, %r9
	setx	0xbbd2351d03a1bdd9, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ca2c919e60, %r1, %r9
	setx	0x04e7a3f2226d28dd, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000001090100000, %r1, %r9
	setx	0x04e7a3f2226d28dd, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000dfcdfeacb0, %r1, %r9
	setx	0x08abcf5b360f5eed, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e4fa46a318, %r1, %r9
	setx	0xbb43a717dd07371e, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f8a20297b0, %r1, %r9
	setx	0xf55b94313f0dac3b, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f4d300cb71, %r1, %r12
	ldub	[%r12], %r11
	setx	0x00000010a0100000, %r1, %r9
	setx	0xf55b94313f0dac3b, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000e87bd24623, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000d568e412b8, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000c82a74257a, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800f008da3, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800ed442fb, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000ea6f7355ec, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d11c2e81a0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800eedaca0, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000fe7d02df4c, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000e620b88830, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000d9b0c090dc, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800e1b0bb8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000f8a20297b0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000e80631a790, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000d7776c7fa0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000cf7ca568f0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x0000008013d84100, %r1, %r9
	setx	0x346239169f75b5c3, %r1, %r10
	stb	%r10, [%r9]
	setx	0x00000010e0100000, %r1, %r9
	setx	0x346239169f75b5c3, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800e25e14b, %r1, %r9
	setx	0x60291f6f2989f0a6, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f3accc1, %r1, %r9
	setx	0x875d54507abedac2, %r1, %r10
	stb	%r10, [%r9]
	setx	0x00000010a0100000, %r1, %r9
	setx	0x875d54507abedac2, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ce9e73ae64, %r1, %r9
	setx	0x8c6276d83b84334b, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d6bcb0431a, %r1, %r9
	setx	0x770ea2fd5c77ea69, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ef84fbc591, %r1, %r9
	setx	0xa46a2b2de28a646e, %r1, %r10
	stb	%r10, [%r9]
	setx	0x0000001050100000, %r1, %r9
	setx	0xa46a2b2de28a646e, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000f92e5b75a7, %r1, %r9
	setx	0x058df4d730a778b4, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e5a6b50, %r1, %r9
	setx	0xa4dea2062dacfd9d, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f87b2c2, %r1, %r9
	setx	0xeb0ddcc5fa78db71, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c370fb7924, %r1, %r9
	setx	0xec8d64d8cb68f87a, %r1, %r10
	sth	%r10, [%r9]
	setx	0x0000001060100000, %r1, %r9
	setx	0xec8d64d8cb68f87a, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ddace989f0, %r1, %r9
	setx	0xc110fd6bf3beb711, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e625c55f38, %r1, %r9
	setx	0x4665a1104f3b71fe, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000fe40ee7c98, %r1, %r9
	setx	0x3fdfd758eac10ce7, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e1d0928, %r1, %r9
	setx	0xfd37ce776d417da7, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f2d2128, %r1, %r9
	setx	0x0b1e503b4431fcb8, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000cb5791e97c, %r1, %r9
	setx	0x13d3642481cafef2, %r1, %r10
	stw	%r10, [%r9]
	setx	0x0000001030100000, %r1, %r9
	setx	0x13d3642481cafef2, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000dcc431c01c, %r1, %r9
	setx	0xeeceacf7db4a54c4, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e945615274, %r1, %r9
	setx	0x13b2ea8c2b27a583, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f60a80d1dc, %r1, %r9
	setx	0xe4753e98d0b953c5, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e5272f8, %r1, %r9
	setx	0x47b010e19d9878e4, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800fcd6480, %r1, %r9
	setx	0x615638e69deb9818, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000001070100000, %r1, %r9
	setx	0x615638e69deb9818, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000ccf32dcb88, %r1, %r9
	setx	0x859071beeec0218b, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000dfbf34ebf0, %r1, %r9
	setx	0xee236245b26930bc, %r1, %r10
	stx	%r10, [%r9]
	setx	0x00000010d0100000, %r1, %r9
	setx	0xee236245b26930bc, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e84c1c2808, %r1, %r9
	setx	0xefc5d4d86eb44312, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f8a20297b0, %r1, %r9
	setx	0xa0bafb5014c1b907, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000eb78bb07e3, %r1, %r12
	ldub	[%r12], %r11
	setx	0x00000010f0100000, %r1, %r9
	setx	0xa0bafb5014c1b907, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000d600a24eb3, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000c0024f2d75, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800e3d408a, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000f8a63eb644, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000e58568ba84, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d1d04dc88c, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000ce53de9440, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800f5b5d78, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000c83a24ea60, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800f45b648, %r1, %r12
	ldx	[%r12], %r11
	setx	0x00000080942fe273, %r1, %r9
	setx	0xecea3237bd3b412f, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e98ce90, %r1, %r9
	setx	0xadff84e4b19312a5, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f7eac7f, %r1, %r9
	setx	0x82fce00fe20c7c56, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c5efa03039, %r1, %r9
	setx	0xf9d6274042b122e5, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d4bfc14de1, %r1, %r9
	setx	0x127f9bbee51d3827, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e777b52d87, %r1, %r9
	setx	0x7f8041b598f6fddd, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f2cbef0c12, %r1, %r9
	setx	0xc036c23cd83be6ef, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800ed647a2, %r1, %r9
	setx	0xbfeae00656ef38d1, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f8fd6b6, %r1, %r9
	setx	0xf0df41a7742f400e, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c68e0897fe, %r1, %r9
	setx	0xff48bb8606bebb3c, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000dceef93644, %r1, %r9
	setx	0x8269e3a850441a21, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000eea05f2c70, %r1, %r9
	setx	0x4c3b97b299ebe69d, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f321b2f864, %r1, %r9
	setx	0xa7569f49afe0c5a8, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e7b93f8, %r1, %r9
	setx	0xe7a6e2d966ba4360, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f5ee71c, %r1, %r9
	setx	0x94765116fc5e0cb4, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c06fb85dd8, %r1, %r9
	setx	0x07ee98edddf77020, %r1, %r10
	stw	%r10, [%r9]
	setx	0x0000001010100000, %r1, %r9
	setx	0x07ee98edddf77020, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d09807187c, %r1, %r9
	setx	0xafc38381125d4385, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000eb7b543da4, %r1, %r9
	setx	0x64cd6392670ef9e3, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f6590180cc, %r1, %r9
	setx	0xcfbabf8a62b7fe0d, %r1, %r10
	stw	%r10, [%r9]
	setx	0x00000010b0100000, %r1, %r9
	setx	0xcfbabf8a62b7fe0d, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800eafebb0, %r1, %r9
	setx	0xf3329e7ecd45908c, %r1, %r10
	stx	%r10, [%r9]
	setx	0x00000010d0100000, %r1, %r9
	setx	0xf3329e7ecd45908c, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800f9d4c28, %r1, %r9
	setx	0xcab7ff365b388723, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c13d78e698, %r1, %r9
	setx	0xd591cd1e4c903427, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000001030100000, %r1, %r9
	setx	0xd591cd1e4c903427, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000dafad1a690, %r1, %r9
	setx	0xa6a128bcb91a7027, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e70a3e9a88, %r1, %r9
	setx	0xa51e602cad198535, %r1, %r10
	stx	%r10, [%r9]
	setx	0x00000010e0100000, %r1, %r9
	setx	0xa51e602cad198535, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000f8a20297b0, %r1, %r9
	setx	0x3c72e75a78b96c2e, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f2164549df, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000e6dab859c7, %r1, %r12
	ldub	[%r12], %r11
	setx	0x0000001030100000, %r1, %r9
	setx	0x3c72e75a78b96c2e, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000e7b2db78a4, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d1dc4ca20c, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000c5c7a22886, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800f5563f6, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e119c72, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000f8a000a65e, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000c6a30e7a18, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000eaafacc5f8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000d3762cbda0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000cc498d9788, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800fe4bb40, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e9cc608, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000f8a20297b0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000802a5b92ce, %r1, %r9
	setx	0xe66f90564f41e118, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e6a3d88, %r1, %r9
	setx	0x8dcf4f2b65dfe63b, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f60df3d, %r1, %r9
	setx	0x1aa29c9a211b32d8, %r1, %r10
	stb	%r10, [%r9]
	setx	0x0000001090100000, %r1, %r9
	setx	0x1aa29c9a211b32d8, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000ca5f55715e, %r1, %r9
	setx	0xd261abc7825aa9e2, %r1, %r10
	stb	%r10, [%r9]
	setx	0x00000010f0100000, %r1, %r9
	setx	0xd261abc7825aa9e2, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000d04ff0b859, %r1, %r9
	setx	0x87d7e32a0b3126a0, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e9d520917a, %r1, %r9
	setx	0xc9bd362417d69c41, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f30c62dd40, %r1, %r9
	setx	0x63b5d71561f8ad5a, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800eeffdee, %r1, %r9
	setx	0xda2632d97c2b8a4b, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f5f537a, %r1, %r9
	setx	0xe15ce16c3ca9f5bb, %r1, %r10
	sth	%r10, [%r9]
	setx	0x0000001070100000, %r1, %r9
	setx	0xe15ce16c3ca9f5bb, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000c526da8d4c, %r1, %r9
	setx	0x91426745fe603fa2, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d6653c38cc, %r1, %r9
	setx	0xf494a590e506d3d6, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e980ed2f3a, %r1, %r9
	setx	0x89046936ae25a032, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f388716f1a, %r1, %r9
	setx	0xb2a789f4a49c7026, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e07c2b4, %r1, %r9
	setx	0xfc4db4562891607e, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f6ae9d4, %r1, %r9
	setx	0xa7726a5aa42ba362, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000cb7a03b494, %r1, %r9
	setx	0x1781176a795d15d1, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d44e3f50a4, %r1, %r9
	setx	0xa8b0cc4471d831ad, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000eccd1c7bd4, %r1, %r9
	setx	0xf4f93815fbe62ef3, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000fc4d524efc, %r1, %r9
	setx	0xa751fb768d18a016, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e3f0d28, %r1, %r9
	setx	0xfb7dce0dbfc27fca, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800fb9d578, %r1, %r9
	setx	0x0f3a924f41db6e7c, %r1, %r10
	stx	%r10, [%r9]
	setx	0x00000010f0100000, %r1, %r9
	setx	0x0f3a924f41db6e7c, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c94ea47458, %r1, %r9
	setx	0xc787c7efb2a6abf6, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000dd193dd120, %r1, %r9
	setx	0x7ebb8e755fcbc882, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000001080100000, %r1, %r9
	setx	0x7ebb8e755fcbc882, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000e7dd7ac170, %r1, %r9
	setx	0x429f794935a19ce0, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f8a20297b0, %r1, %r9
	setx	0xc2db7cef90e1d88d, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d3a3b8513e, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000c27f21f5cb, %r1, %r12
	ldub	[%r12], %r11
	setx	0x00000010d0100000, %r1, %r9
	setx	0xc2db7cef90e1d88d, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000c4979cd5fe, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800fe44d82, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e92290c, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000ee9a93de68, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000d49cbc1418, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000c717638974, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800f2822f8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000f8a20297b0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000ea7ce9aba0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000d81ad77580, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000809ab6a302, %r1, %r9
	setx	0x32d01d10b1c5768e, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e87f4d4, %r1, %r9
	setx	0x7730ebf7aec76ea2, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f82463a, %r1, %r9
	setx	0x791b518b692911e4, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c0ec66f23c, %r1, %r9
	setx	0x317bb0c619e7a2cd, %r1, %r10
	stb	%r10, [%r9]
	setx	0x00000010d0100000, %r1, %r9
	setx	0x317bb0c619e7a2cd, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000dc3e79ff94, %r1, %r9
	setx	0x3a9b84f15d7c4fae, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e12061bf0a, %r1, %r9
	setx	0x4a0ce7c58a16852a, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f39e93c937, %r1, %r9
	setx	0xb9ae8c6366adcfce, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e9cc9bc, %r1, %r9
	setx	0x28dd9366c2770dfb, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f67bf8a, %r1, %r9
	setx	0xc905d15fddbc981e, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c1905c174e, %r1, %r9
	setx	0x404d5b1f48fad697, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d70344321e, %r1, %r9
	setx	0x92f2e481021309ff, %r1, %r10
	sth	%r10, [%r9]
	setx	0x0000001090100000, %r1, %r9
	setx	0x92f2e481021309ff, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000e227593a16, %r1, %r9
	setx	0x7b64911217470460, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f7fc1cc11e, %r1, %r9
	setx	0x0484ce0e72776cf0, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e8aebcc, %r1, %r9
	setx	0xb8e8d7cb050fa4e3, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f0869ac, %r1, %r9
	setx	0x1d7b54e7e641a4e4, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c64547c1dc, %r1, %r9
	setx	0x570d1b2173f42bda, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000dabfb648e0, %r1, %r9
	setx	0x92137be883067732, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000ea9f96a7c8, %r1, %r9
	setx	0x0921f88701c6bcb9, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000fb85d93e88, %r1, %r9
	setx	0x1a3082cdeeac7a8f, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e6a0058, %r1, %r9
	setx	0xfb944e76d07bcdf0, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800ffee740, %r1, %r9
	setx	0x7f887d64efdec22b, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c339ad4a80, %r1, %r9
	setx	0x4469b3320439dba1, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000da893371e0, %r1, %r9
	setx	0x92d68c14a555b378, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ec54dc6170, %r1, %r9
	setx	0x0cb6cfee156c3497, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000001010100000, %r1, %r9
	setx	0x0cb6cfee156c3497, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000f8a20297b0, %r1, %r9
	setx	0xa71c85478ebfd2f3, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e70d2c0d61, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000db77604048, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000cf2b654174, %r1, %r12
	ldub	[%r12], %r11
	setx	0x0000001020100000, %r1, %r9
	setx	0xa71c85478ebfd2f3, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f2d11a0, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800e5a6b50, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000fd9a621704, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000e7c8617b50, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000dee4a5d074, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000cd0ce6149c, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000cb58e13b30, %r1, %r12
	ldx	[%r12], %r11
	setx	0x00000080a81d14cf, %r1, %r9
	setx	0x6eb53e1658a6b8de, %r1, %r10
	stb	%r10, [%r9]
	setx	0x0000001050100000, %r1, %r9
	setx	0x6eb53e1658a6b8de, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800e789818, %r1, %r9
	setx	0x00eacfa50b36f19c, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800fab48ee, %r1, %r9
	setx	0xc6bc3b2ffdba87c3, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ce0b43ff40, %r1, %r9
	setx	0x6be8b5de43c9cb39, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d2fd636ea3, %r1, %r9
	setx	0x992b3143cfa6adfd, %r1, %r10
	stb	%r10, [%r9]
	setx	0x00000010c0100000, %r1, %r9
	setx	0x992b3143cfa6adfd, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e1d0ca681a, %r1, %r9
	setx	0x542cbe69d328a1f0, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f62c818127, %r1, %r9
	setx	0x97ea9b02df523f51, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800ec7be28, %r1, %r9
	setx	0x6be9d3d263892e1c, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f10bcf6, %r1, %r9
	setx	0x880f1e18c76e1faa, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c74d43362e, %r1, %r9
	setx	0x4baf3585ed68bcd7, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000dc8b020ed2, %r1, %r9
	setx	0xa5577ed52ac5c413, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000ed46b15b68, %r1, %r9
	setx	0xd4a3094cdaa347b1, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000fed5693268, %r1, %r9
	setx	0x6e1e8dfbc8dd34ed, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e6f3a2c, %r1, %r9
	setx	0xd44b6f81d76c278b, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800fe37d50, %r1, %r9
	setx	0x443a828fb9a4ae66, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c821038358, %r1, %r9
	setx	0xf937782053e1a00d, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d16b4368b4, %r1, %r9
	setx	0x4b73fec44317d3dd, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e8d70e36b8, %r1, %r9
	setx	0x6be124e3d1dbc562, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f251fbf338, %r1, %r9
	setx	0x931162f9e49552a6, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800efe25a8, %r1, %r9
	setx	0xa46054e9f187b6a8, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f9d9440, %r1, %r9
	setx	0xece47e4d3252356e, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c170d79fa8, %r1, %r9
	setx	0x2ebfecfeb5c3cb1a, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d856999480, %r1, %r9
	setx	0xe68fed4e846891ef, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000efdf5fb938, %r1, %r9
	setx	0x664356640c74b4b2, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f8a20297b0, %r1, %r9
	setx	0x0b7b762756e0dc18, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f7310eda6c, %r1, %r12
	ldub	[%r12], %r11
	setx	0x00000010e0100000, %r1, %r9
	setx	0x0b7b762756e0dc18, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000eb1fd6b7a7, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000e935aa91b8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d77882bb0c, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000c080ca3220, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800f38d3ac, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e25be3e, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800f6e5300, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800eb2fad8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000f8a20297b0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000e06ce14e30, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000d81ca273f8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000cdc9b45fd8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x00000080ca9a2db1, %r1, %r9
	setx	0xb6d9d5de3f6f8f13, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e49dbd4, %r1, %r9
	setx	0x5a45cbbec731e16f, %r1, %r10
	stb	%r10, [%r9]
	setx	0x0000001020100000, %r1, %r9
	setx	0x5a45cbbec731e16f, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800fbcf045, %r1, %r9
	setx	0xedf8c3006501ddb4, %r1, %r10
	stb	%r10, [%r9]
	setx	0x0000001090100000, %r1, %r9
	setx	0xedf8c3006501ddb4, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c375d17130, %r1, %r9
	setx	0x22cc1d67f1c154be, %r1, %r10
	stb	%r10, [%r9]
	setx	0x00000010c0100000, %r1, %r9
	setx	0x22cc1d67f1c154be, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d8b3fd6e3c, %r1, %r9
	setx	0x409b903b79f5baf4, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ed28cfd290, %r1, %r9
	setx	0x9c41e1123bdce851, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f814c74751, %r1, %r9
	setx	0xdc0d0fbcc3b3a72d, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e9f49da, %r1, %r9
	setx	0x299ea9b1e85c9ad2, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800fd30f08, %r1, %r9
	setx	0xdb5523efaa9c854f, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000caa65c18e2, %r1, %r9
	setx	0xbc928a874c095d75, %r1, %r10
	sth	%r10, [%r9]
	setx	0x00000010c0100000, %r1, %r9
	setx	0xbc928a874c095d75, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000da0e55bf54, %r1, %r9
	setx	0x0fc715e440e70176, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e2fb6ac81e, %r1, %r9
	setx	0x0a4e173d41c37810, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f9ae462c4a, %r1, %r9
	setx	0x0703ec67cadaf98e, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e185080, %r1, %r9
	setx	0x8823615bda09c6cd, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f86bfb8, %r1, %r9
	setx	0x30270defbb46f900, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000ce7a28338c, %r1, %r9
	setx	0x7f408369407a3d49, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000dca97e8b54, %r1, %r9
	setx	0x40191263b227d0fa, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000ea67cca1f0, %r1, %r9
	setx	0xc5c503fe22b56a8e, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f7ba3672d0, %r1, %r9
	setx	0x3ee08f01141f1e5d, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800eebec58, %r1, %r9
	setx	0x7777732bda3a50d7, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800ff24b20, %r1, %r9
	setx	0xd8f23902021a8c05, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000cae2291e60, %r1, %r9
	setx	0x7fa6b4620ef9c106, %r1, %r10
	stx	%r10, [%r9]
	setx	0x00000010c0100000, %r1, %r9
	setx	0x7fa6b4620ef9c106, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d5c342d5f0, %r1, %r9
	setx	0xfe4557e256df0be9, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000001070100000, %r1, %r9
	setx	0xfe4557e256df0be9, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000eff4b66238, %r1, %r9
	setx	0x95f936d8771f6fca, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f8a20297b0, %r1, %r9
	setx	0x0fdd1f50216359d2, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e87bd24623, %r1, %r12
	ldub	[%r12], %r11
	setx	0x0000001000100000, %r1, %r9
	setx	0x0fdd1f50216359d2, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d568e412b8, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000dee4a5d074, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000cd0ce6149c, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800f136d1c, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800e8b49c0, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800f4dc4d8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e407f08, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000f8a20297b0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000e20b175b70, %r1, %r12
	ldx	[%r12], %r11
	setx	0x00000080a59ef54f, %r1, %r9
	setx	0x647ffa9d0ff69bdf, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e617dd2, %r1, %r9
	setx	0x9a63aea32510365b, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800fe23821, %r1, %r9
	setx	0xff5fe2a405003476, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000cad7e86a31, %r1, %r9
	setx	0xd7829b87aa7c9f1a, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d15ae3fca1, %r1, %r9
	setx	0x6cf1587dd5d8267a, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e6767c01bd, %r1, %r9
	setx	0x4e5ac746fe1075fa, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f57d773e0b, %r1, %r9
	setx	0x8568931238f05a50, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e76d91a, %r1, %r9
	setx	0x3abbee364b6aae50, %r1, %r10
	sth	%r10, [%r9]
	setx	0x00000010f0100000, %r1, %r9
	setx	0x3abbee364b6aae50, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800f24985e, %r1, %r9
	setx	0xcff73941bf586469, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000cb136800e6, %r1, %r9
	setx	0x6a0749bdc611c7d9, %r1, %r10
	sth	%r10, [%r9]
	setx	0x0000001040100000, %r1, %r9
	setx	0x6a0749bdc611c7d9, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000da73dace88, %r1, %r9
	setx	0x6ce5bbc7d633c21c, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000eb494a17e8, %r1, %r9
	setx	0x8d31407b51794404, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f0b3eca9e8, %r1, %r9
	setx	0xbb4bcb69f3d3efed, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e5d5ef4, %r1, %r9
	setx	0xefb141d6d561098b, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f0a0afc, %r1, %r9
	setx	0xc345858dfbd4bfad, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000cef666a394, %r1, %r9
	setx	0xcd3e5fdff65e5f23, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d4f7c07adc, %r1, %r9
	setx	0x6d0f572c71556369, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000ef7ef0c92c, %r1, %r9
	setx	0x633f85379316734a, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000fbd3216180, %r1, %r9
	setx	0xbe294ab8d20a7454, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e0f1f40, %r1, %r9
	setx	0x00e6f8d9bd50808d, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800fd1f390, %r1, %r9
	setx	0xf95852a16d025da4, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c8c6595f00, %r1, %r9
	setx	0xb419e045278b5923, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d5155356e0, %r1, %r9
	setx	0xa783afcefa4bb2b6, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e76c3c0c00, %r1, %r9
	setx	0x10678370f3453630, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f8a20297b0, %r1, %r9
	setx	0xd3603107da8373e2, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c7c3447f8f, %r1, %r12
	ldub	[%r12], %r11
	setx	0x0000001020100000, %r1, %r9
	setx	0xd3603107da8373e2, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800fb5e465, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000ddc3964ec0, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800f658380, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e35efe8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000f8a20297b0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000ec952c8490, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000804ed2af0b, %r1, %r9
	setx	0x8eb29b810ef5bf59, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800eaad75f, %r1, %r9
	setx	0xf7edbb4fedf3ae29, %r1, %r10
	stb	%r10, [%r9]
	setx	0x00000010a0100000, %r1, %r9
	setx	0xf7edbb4fedf3ae29, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f2b6890, %r1, %r9
	setx	0xae0614bd5642feee, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c91eed97db, %r1, %r9
	setx	0x6a841e2f89282d2d, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d2bec7319d, %r1, %r9
	setx	0x76b53ab448ea5bfc, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e38ac2c662, %r1, %r9
	setx	0x4d40a2b7ff2725a9, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000fda9da702d, %r1, %r9
	setx	0x450f6f743cf0cfe9, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e41f0c0, %r1, %r9
	setx	0x8f994c052c1a60b5, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800fe7299c, %r1, %r9
	setx	0x8ae8b80f3d7394d6, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c9cdbd6530, %r1, %r9
	setx	0x732fb3e2c4a6d3ae, %r1, %r10
	sth	%r10, [%r9]
	setx	0x0000001030100000, %r1, %r9
	setx	0x732fb3e2c4a6d3ae, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000de6cd1f4f4, %r1, %r9
	setx	0xc47ba840b9b6256d, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000eb61082b92, %r1, %r9
	setx	0x68c56a52667e8c7e, %r1, %r10
	sth	%r10, [%r9]
	setx	0x00000010f0100000, %r1, %r9
	setx	0x68c56a52667e8c7e, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000fbb41c2cea, %r1, %r9
	setx	0xe76fb073b0ecdf45, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800ee9b81c, %r1, %r9
	setx	0x9d05cc357235a607, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f0360b8, %r1, %r9
	setx	0xc22e11b0e19c5808, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c981e0401c, %r1, %r9
	setx	0x54b356e28b7623af, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000dea640d344, %r1, %r9
	setx	0xf2d00751c6a1f26b, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e37f794a00, %r1, %r9
	setx	0x7e575274907e3b01, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f48f2e62cc, %r1, %r9
	setx	0x9720b70dc063f0b5, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800ee41d78, %r1, %r9
	setx	0x2c099489580e1a14, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f142458, %r1, %r9
	setx	0xa2631b95f49bda35, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000cb88a555b8, %r1, %r9
	setx	0xdf289cdb98aea9e7, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d2aea70f50, %r1, %r9
	setx	0xa66ced917b8a3221, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e8bef6eb98, %r1, %r9
	setx	0x6f2ab52f06e639b6, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f8a20297b0, %r1, %r9
	setx	0x93267689d643e72e, %r1, %r10
	stx	%r10, [%r9]
	setx	0x00000010b0100000, %r1, %r9
	setx	0x93267689d643e72e, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000ca02655be8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800f6d1520, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d7cfc5b3f8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800e2a7048, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000f8a20297b0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000ed63156930, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000da1916e868, %r1, %r12
	ldx	[%r12], %r11
	setx	0x00000080c47cbc37, %r1, %r9
	setx	0x0ad57055ef7451fe, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e393d6e, %r1, %r9
	setx	0x9c83f0a656833966, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f6574c1, %r1, %r9
	setx	0x094527cdcb6e390e, %r1, %r10
	stb	%r10, [%r9]
	setx	0x0000001090100000, %r1, %r9
	setx	0x094527cdcb6e390e, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c0e3ee0dfc, %r1, %r9
	setx	0x1d0e31389653ab49, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000df7c505e6f, %r1, %r9
	setx	0x3a5a0ea8634a9e9f, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e51bbd1937, %r1, %r9
	setx	0x6fc2345de18e5121, %r1, %r10
	stb	%r10, [%r9]
	setx	0x0000001070100000, %r1, %r9
	setx	0x6fc2345de18e5121, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000f794adde8c, %r1, %r9
	setx	0xcc9c19bb18e31fb1, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800ebd0534, %r1, %r9
	setx	0x3823ebef61409a43, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f218d0a, %r1, %r9
	setx	0xc576239355c9ba86, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c9628174d6, %r1, %r9
	setx	0xe58b5a87b576f23f, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000df534a7480, %r1, %r9
	setx	0x9cca9c44cd74781a, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000eddfeef1a4, %r1, %r9
	setx	0x756c90131723b89a, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f3ba65145c, %r1, %r9
	setx	0xff603abbf06116a9, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e2da9c0, %r1, %r9
	setx	0x7ab39beecafd7fcc, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800fc4d40c, %r1, %r9
	setx	0xe4115d25cb74cfe9, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c6ebf79d68, %r1, %r9
	setx	0x9d76f0c6b3e9d719, %r1, %r10
	stw	%r10, [%r9]
	setx	0x0000001010100000, %r1, %r9
	setx	0x9d76f0c6b3e9d719, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000d444c1afd0, %r1, %r9
	setx	0xcebed47f686d5764, %r1, %r10
	stw	%r10, [%r9]
	setx	0x0000001020100000, %r1, %r9
	setx	0xcebed47f686d5764, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ef7db55a88, %r1, %r9
	setx	0xab67b620245151e7, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f820225b60, %r1, %r9
	setx	0x399cee23af782bf4, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e336a78, %r1, %r9
	setx	0x9e73bc30af74aeb6, %r1, %r10
	stx	%r10, [%r9]
	setx	0x00000010f0100000, %r1, %r9
	setx	0x9e73bc30af74aeb6, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800f9374b0, %r1, %r9
	setx	0x9888a35694bb3757, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c0888bf8b0, %r1, %r9
	setx	0x2f3ec0a2c8f13ec9, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000001040100000, %r1, %r9
	setx	0x2f3ec0a2c8f13ec9, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000dd2f772100, %r1, %r9
	setx	0x4998267f8f91fcc3, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e5ebf79a50, %r1, %r9
	setx	0x673f068c092f6579, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f8a20297b0, %r1, %r9
	setx	0xaa59c3fdcd45738d, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000001090100000, %r1, %r9
	setx	0xaa59c3fdcd45738d, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000f2630e7769, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000e9f463119a, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000da117e9129, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000c6b08da7b5, %r1, %r12
	ldub	[%r12], %r11
	setx	0x0000001060100000, %r1, %r9
	setx	0xaa59c3fdcd45738d, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f3f7f98ad2, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e98f304, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000f8b661d144, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000ec2d9ca50c, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800e0f1f40, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000f8a20297b0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000eff4b66238, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000d5c342d5f0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000cae2291e60, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000806c40c818, %r1, %r9
	setx	0xff64b1f5a73157ba, %r1, %r10
	stb	%r10, [%r9]
	setx	0x0000001090100000, %r1, %r9
	setx	0xff64b1f5a73157ba, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800e0c719c, %r1, %r9
	setx	0xa2ee545946cce806, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f65f560, %r1, %r9
	setx	0x48f0e5eeb6b27225, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000cc5dd86d8c, %r1, %r9
	setx	0x2faae7cce5ff0672, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d1b479a63d, %r1, %r9
	setx	0xd6c18ab1262d2bfd, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e780a26d4c, %r1, %r9
	setx	0xf9d64a5275d0a97d, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000fddd51cf12, %r1, %r9
	setx	0x79810263900f15d4, %r1, %r10
	stb	%r10, [%r9]
	setx	0x00000010e0100000, %r1, %r9
	setx	0x79810263900f15d4, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800e611368, %r1, %r9
	setx	0x91ea8407ebcc3f8c, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f1b5314, %r1, %r9
	setx	0x797078dfea3aaaee, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000cad72f7aba, %r1, %r9
	setx	0xbb2c97a7881a60e8, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d864850fb4, %r1, %r9
	setx	0x4d713c428f3a1335, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e263909e8e, %r1, %r9
	setx	0xcc7d57ac252dc4aa, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f72a90257e, %r1, %r9
	setx	0xc4e403f45ebba5c6, %r1, %r10
	sth	%r10, [%r9]
	setx	0x0000001080100000, %r1, %r9
	setx	0xc4e403f45ebba5c6, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800ead7ef4, %r1, %r9
	setx	0xe039c0cc414f1429, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800fa060d4, %r1, %r9
	setx	0xfe934544ac1788ef, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c9644de39c, %r1, %r9
	setx	0x288e3bad9adcbb4c, %r1, %r10
	stw	%r10, [%r9]
	setx	0x0000001050100000, %r1, %r9
	setx	0x288e3bad9adcbb4c, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d9814a0368, %r1, %r9
	setx	0x6dbbcea9f7eb5a6c, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000ed1955a9ac, %r1, %r9
	setx	0x672b5d82ac97f7eb, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000fbffda0334, %r1, %r9
	setx	0xcd830e4c9ffe7e30, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e6626f8, %r1, %r9
	setx	0x323fc01ab6375de5, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f3bb228, %r1, %r9
	setx	0x756a607b0eb25aad, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000cdb2954828, %r1, %r9
	setx	0x3cfb0de8c021d32f, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d93c939298, %r1, %r9
	setx	0x1424f6e71f8f4bce, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e8c049e2e8, %r1, %r9
	setx	0xa0fa8dd5e3ed46e2, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000001040100000, %r1, %r9
	setx	0xa0fa8dd5e3ed46e2, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f8a20297b0, %r1, %r9
	setx	0x7a6e41730183d949, %r1, %r10
	stx	%r10, [%r9]
	setx	0x00000010d0100000, %r1, %r9
	setx	0x7a6e41730183d949, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800e9645c5, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800f86bfb8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800e185080, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000f251fbf338, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000e8d70e36b8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000d16b4368b4, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000c821038358, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800fe37d50, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800e047550, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000f8a20297b0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x00000080c9aec7ed, %r1, %r9
	setx	0x8b6c3092ed7518cc, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e1691b6, %r1, %r9
	setx	0x7289fdab324c7d0b, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800fddfa38, %r1, %r9
	setx	0x048b42784a6f495e, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c3324e5d73, %r1, %r9
	setx	0x919d1482f21b98d3, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000dcff203a3c, %r1, %r9
	setx	0xd159fafc087e7a95, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e11b45a390, %r1, %r9
	setx	0x5009acfeccd7d190, %r1, %r10
	stb	%r10, [%r9]
	setx	0x00000010e0100000, %r1, %r9
	setx	0x5009acfeccd7d190, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f4cf2a6548, %r1, %r9
	setx	0x5c96564757548d88, %r1, %r10
	stb	%r10, [%r9]
	setx	0x00000010d0100000, %r1, %r9
	setx	0x5c96564757548d88, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800e5d84ec, %r1, %r9
	setx	0x0d6bd465780ac2a1, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800ffadb0e, %r1, %r9
	setx	0xc853e95febd1c4fc, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c254c4f60e, %r1, %r9
	setx	0x457d492deb95598c, %r1, %r10
	sth	%r10, [%r9]
	setx	0x0000001010100000, %r1, %r9
	setx	0x457d492deb95598c, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d558db121a, %r1, %r9
	setx	0xc6cf80b71f252687, %r1, %r10
	sth	%r10, [%r9]
	setx	0x0000001050100000, %r1, %r9
	setx	0xc6cf80b71f252687, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000e60471a80e, %r1, %r9
	setx	0x3780a04fe0db63e7, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000fada2e37a2, %r1, %r9
	setx	0x39467d5f562960cd, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e1cdf28, %r1, %r9
	setx	0xf70ccbc406b551f9, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f227654, %r1, %r9
	setx	0x8b0359fa169bd83d, %r1, %r10
	stw	%r10, [%r9]
	setx	0x0000001040100000, %r1, %r9
	setx	0x8b0359fa169bd83d, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000c9c8c9fd44, %r1, %r9
	setx	0xd5f28107b3f2be14, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000da07dfda4c, %r1, %r9
	setx	0x0b412a845c956882, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e5f482aa28, %r1, %r9
	setx	0x1bf12b12edde6acd, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f07758728c, %r1, %r9
	setx	0x73bb0d7a9a8e8751, %r1, %r10
	stw	%r10, [%r9]
	setx	0x0000001090100000, %r1, %r9
	setx	0x73bb0d7a9a8e8751, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800e2dd7d8, %r1, %r9
	setx	0xbb43f0d0743808d3, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f464c18, %r1, %r9
	setx	0xd79d5de98180a75d, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c43fe486f0, %r1, %r9
	setx	0x827ed12ef39a0399, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000001010100000, %r1, %r9
	setx	0x827ed12ef39a0399, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000d9c9a69458, %r1, %r9
	setx	0xc0407cedfb74c5f5, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000001000100000, %r1, %r9
	setx	0xc0407cedfb74c5f5, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000ef12d575a0, %r1, %r9
	setx	0x73c16b793db418bd, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000001070100000, %r1, %r9
	setx	0x73c16b793db418bd, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000f8a20297b0, %r1, %r9
	setx	0x2e37e99a4299e716, %r1, %r10
	stx	%r10, [%r9]
	setx	0x00000010f0100000, %r1, %r9
	setx	0x2e37e99a4299e716, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800e252246, %r1, %r12
	ldub	[%r12], %r11
	setx	0x00000080c065a426, %r1, %r12
	ldub	[%r12], %r11
	setx	0x00000010d0100000, %r1, %r9
	setx	0x2e37e99a4299e716, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f47da1f51e, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000e9f19345dd, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800e92290c, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000f98089d710, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000e9720f15e0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d03309cd3e, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000ccdc3e66d4, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d9b0c090dc, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000c2dd835150, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800f381ae4, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800e4ff250, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000fd2e84ac44, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000ec53af80fc, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000e359848750, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000d67a4bf920, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000c6442f9f40, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800f558f70, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000801375ed87, %r1, %r9
	setx	0x813179ee63c8909e, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800efae455, %r1, %r9
	setx	0x40e30520c653195b, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f93bc83, %r1, %r9
	setx	0x4f23b8b1abd30b9a, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c484df3013, %r1, %r9
	setx	0x2346d83aa2961f6e, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000dc6de18d19, %r1, %r9
	setx	0x0de0df8063ff67bf, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e245f37978, %r1, %r9
	setx	0x6f3fe9d80b89dcd8, %r1, %r10
	stb	%r10, [%r9]
	setx	0x0000001020100000, %r1, %r9
	setx	0x6f3fe9d80b89dcd8, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000f45b7ed74a, %r1, %r9
	setx	0x47a940022938e830, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800ecebefc, %r1, %r9
	setx	0x95d6e7943a0b92bd, %r1, %r10
	sth	%r10, [%r9]
	setx	0x0000001060100000, %r1, %r9
	setx	0x95d6e7943a0b92bd, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800f92d2d6, %r1, %r9
	setx	0x5737aeb42a95f3e3, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000cf25c11f94, %r1, %r9
	setx	0x48381b7c50f0cab0, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d93bdc58fc, %r1, %r9
	setx	0x65a58c70e80bea9b, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e9b58d0636, %r1, %r9
	setx	0x41f39e86a1ec5348, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f04e623f0a, %r1, %r9
	setx	0x73c114614d53c3f8, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800edc0224, %r1, %r9
	setx	0xb29615f6939a5631, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f3ea50c, %r1, %r9
	setx	0x4fa667f35a3f9ce0, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000cd48ed8128, %r1, %r9
	setx	0xbc5f71c106de1ca3, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d8b88e4504, %r1, %r9
	setx	0xbf70357bbca92614, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e6255feccc, %r1, %r9
	setx	0x382dfb0c5e534f15, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000fe674b0b90, %r1, %r9
	setx	0x97175e08898d8f19, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800ef07548, %r1, %r9
	setx	0x5e3a91f2e887eb80, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000001020100000, %r1, %r9
	setx	0x5e3a91f2e887eb80, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800fe94f40, %r1, %r9
	setx	0xc849fa7b26c3badd, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000001080100000, %r1, %r9
	setx	0xc849fa7b26c3badd, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000cce94a3f80, %r1, %r9
	setx	0x671b88dcb1b908ac, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000dbe13a3868, %r1, %r9
	setx	0xe1761eab66a2ff31, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e4a2b089f8, %r1, %r9
	setx	0xfaa0e2b805b4ef2f, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f8a20297b0, %r1, %r9
	setx	0x06704baaf8afd03b, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f6b559e, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800eb7c045, %r1, %r12
	ldub	[%r12], %r11
	setx	0x00000010e0100000, %r1, %r9
	setx	0x06704baaf8afd03b, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000805586926c, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000f9389d226e, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000f98089d710, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000e9720f15e0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d03309cd3e, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000ccdc3e66d4, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800fe72dd4, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e5b6bb8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000f2b2e790ea, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800fcd896c, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800e56bb2c, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000f38b1306f0, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000ee7952e050, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000daa1520928, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000c770076528, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800f4af47c, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000d81ad77580, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000cc97191570, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800f84b520, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e4957d0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000f8a20297b0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000eaafacc5f8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000d3762cbda0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000808f957e09, %r1, %r9
	setx	0x40bff6f501b7e213, %r1, %r10
	stb	%r10, [%r9]
	setx	0x0000001070100000, %r1, %r9
	setx	0x40bff6f501b7e213, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800e35fa64, %r1, %r9
	setx	0x3e57ea797ede1d86, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800fe78388, %r1, %r9
	setx	0x59939e526eb32a09, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c63cc3d039, %r1, %r9
	setx	0x4dddc4520eca7212, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d8841881d7, %r1, %r9
	setx	0x049ea3c1b334e991, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e784338d76, %r1, %r9
	setx	0xd7ae1f37d5c65ef9, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f8bb576e6c, %r1, %r9
	setx	0x5f60f0540fddd4e5, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e3756e4, %r1, %r9
	setx	0x2ffcdd342e305fe3, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f616b18, %r1, %r9
	setx	0xd0c0b31de9d89d56, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c79df16538, %r1, %r9
	setx	0x72470acce514f199, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d3c8656478, %r1, %r9
	setx	0x477434c931f3bb67, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e2b65bd8cc, %r1, %r9
	setx	0x94d9e154f46d12db, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f707238850, %r1, %r9
	setx	0x6d7c704ee6b0e29b, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800ed77468, %r1, %r9
	setx	0x645f5f68a3d946b8, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f2f6a14, %r1, %r9
	setx	0x9bedca7a82a79e9d, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c34d466654, %r1, %r9
	setx	0x07bfb9c57d308658, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d103978c38, %r1, %r9
	setx	0x40cd54e596924585, %r1, %r10
	stw	%r10, [%r9]
	setx	0x0000001010100000, %r1, %r9
	setx	0x40cd54e596924585, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e1c7f1821c, %r1, %r9
	setx	0xa3775cbc56aade50, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f724e6d2cc, %r1, %r9
	setx	0xbb5d63912f80c537, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e68bef8, %r1, %r9
	setx	0x274777a1649f8326, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f571820, %r1, %r9
	setx	0x44d2f9d9e390347e, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c3a0312eb0, %r1, %r9
	setx	0xc2e5ff42f89a2867, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d906792380, %r1, %r9
	setx	0x50bc0fa4dc707392, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e91af0b408, %r1, %r9
	setx	0x0e4bf498b4c32189, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f8a20297b0, %r1, %r9
	setx	0x7dfa3fcb69f650b5, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d33c26fc99, %r1, %r12
	ldub	[%r12], %r11
	setx	0x0000001000100000, %r1, %r9
	setx	0x7dfa3fcb69f650b5, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000c88a7196a9, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800f193cff, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800ebf31ec, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000809f005b2f, %r1, %r12
	ldub	[%r12], %r11
	setx	0x0000001060100000, %r1, %r9
	setx	0x7dfa3fcb69f650b5, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000f7310eda6c, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000e84e683814, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d11d771120, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800e5be080, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000f8a20297b0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000e3a061a670, %r1, %r12
	ldx	[%r12], %r11
	setx	0x0000008021ca01ae, %r1, %r9
	setx	0x54976c93cf13d35e, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e2c226b, %r1, %r9
	setx	0x117df32008c2cb57, %r1, %r10
	stb	%r10, [%r9]
	setx	0x0000001030100000, %r1, %r9
	setx	0x117df32008c2cb57, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f88d016, %r1, %r9
	setx	0x9b9367d7673f04d8, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c67fe90fd6, %r1, %r9
	setx	0xae94b89cb842e31a, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000df2ebe7337, %r1, %r9
	setx	0x8b6c3d21602f6242, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e68779ecdd, %r1, %r9
	setx	0x730e3935ea7d800a, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f03cf1d48b, %r1, %r9
	setx	0x1c994c0bac84255a, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800ed4448e, %r1, %r9
	setx	0x3739ceed299dbaae, %r1, %r10
	sth	%r10, [%r9]
	setx	0x00000010f0100000, %r1, %r9
	setx	0x3739ceed299dbaae, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800f68cf1e, %r1, %r9
	setx	0x2660536e09c68fed, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000cb5de892a8, %r1, %r9
	setx	0x9c85e10dfb34044d, %r1, %r10
	sth	%r10, [%r9]
	setx	0x0000001050100000, %r1, %r9
	setx	0x9c85e10dfb34044d, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d4b9eac212, %r1, %r9
	setx	0x9df57c33befd4be1, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000edba57f8c0, %r1, %r9
	setx	0x257e0542c7cf277c, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f9485160c2, %r1, %r9
	setx	0xcdc4047cac3ba563, %r1, %r10
	sth	%r10, [%r9]
	setx	0x0000001050100000, %r1, %r9
	setx	0xcdc4047cac3ba563, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800e9b0fa8, %r1, %r9
	setx	0x4fb4580f3da6db36, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f0f5130, %r1, %r9
	setx	0x94167be2bf66e8ae, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000cd7143b548, %r1, %r9
	setx	0x54cca317a3338c7b, %r1, %r10
	stw	%r10, [%r9]
	setx	0x0000001030100000, %r1, %r9
	setx	0x54cca317a3338c7b, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000d4fc49489c, %r1, %r9
	setx	0x43e5e6ac830d1af6, %r1, %r10
	stw	%r10, [%r9]
	setx	0x00000010e0100000, %r1, %r9
	setx	0x43e5e6ac830d1af6, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000eef0d51d9c, %r1, %r9
	setx	0x233fb9f6fbde783d, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f9aaeeb064, %r1, %r9
	setx	0xfa908e5505fd6116, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800eca3fb8, %r1, %r9
	setx	0x7f6247e37002b3c5, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000001080100000, %r1, %r9
	setx	0x7f6247e37002b3c5, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800f859bc0, %r1, %r9
	setx	0xff0d939b504236ab, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c062eec658, %r1, %r9
	setx	0x1de7b1677964152c, %r1, %r10
	stx	%r10, [%r9]
	setx	0x00000010b0100000, %r1, %r9
	setx	0x1de7b1677964152c, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000daced49e90, %r1, %r9
	setx	0xfafdac52b6a30722, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ed6a229f00, %r1, %r9
	setx	0x33a088860f5b792d, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f8a20297b0, %r1, %r9
	setx	0x817f3bc89d5ef908, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c91c0a1998, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800faa8fea, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d9814a0368, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000c9644de39c, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000e6a2f795b0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x00000080ec8547fe, %r1, %r9
	setx	0xb286b0849a4814e4, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800ea10967, %r1, %r9
	setx	0xbb77676c439bcba1, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f5e9555, %r1, %r9
	setx	0xe2a26763ba2e63da, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c2647b8fb7, %r1, %r9
	setx	0xb087951ca23456c9, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000dc5f065410, %r1, %r9
	setx	0xce47ec992ced6abb, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e36bf6fa9c, %r1, %r9
	setx	0xd6ba32299d1a5f98, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f083060b96, %r1, %r9
	setx	0x4353935675367119, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800ebe8cb2, %r1, %r9
	setx	0x75eee56aa242c895, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800fdf023c, %r1, %r9
	setx	0x564aeaa895590363, %r1, %r10
	sth	%r10, [%r9]
	setx	0x00000010e0100000, %r1, %r9
	setx	0x564aeaa895590363, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000c5699e75b0, %r1, %r9
	setx	0xba40c53713d74b3e, %r1, %r10
	sth	%r10, [%r9]
	setx	0x0000001090100000, %r1, %r9
	setx	0xba40c53713d74b3e, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000de88328862, %r1, %r9
	setx	0x80d766f0563755ad, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000ecfd0eb41c, %r1, %r9
	setx	0xe466343524309a04, %r1, %r10
	sth	%r10, [%r9]
	setx	0x0000001080100000, %r1, %r9
	setx	0xe466343524309a04, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f4606b289e, %r1, %r9
	setx	0x16cfb1982385cf6c, %r1, %r10
	sth	%r10, [%r9]
	setx	0x0000001020100000, %r1, %r9
	setx	0x16cfb1982385cf6c, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800e382114, %r1, %r9
	setx	0xbe27b2121cf9e7f7, %r1, %r10
	stw	%r10, [%r9]
	setx	0x0000001030100000, %r1, %r9
	setx	0xbe27b2121cf9e7f7, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f143bb4, %r1, %r9
	setx	0xf2fa93100c751ce5, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c921a6c024, %r1, %r9
	setx	0x7b925e8a196e89aa, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000de23e4bdb8, %r1, %r9
	setx	0x80fbe6d099ca7522, %r1, %r10
	stw	%r10, [%r9]
	setx	0x00000010b0100000, %r1, %r9
	setx	0x80fbe6d099ca7522, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ee5fd09a94, %r1, %r9
	setx	0x67d9198e875613e5, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000fb4d2b2320, %r1, %r9
	setx	0xdb50eaea8b074825, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e4a9ba0, %r1, %r9
	setx	0xb109b42cdc853663, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800fa8a0b8, %r1, %r9
	setx	0x8e4509004d2f2e51, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000cb2b4bdae0, %r1, %r9
	setx	0x0718f488e5ecc9bb, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000dc4b875e78, %r1, %r9
	setx	0x5056da3f73ad3b5b, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e1d73bdb88, %r1, %r9
	setx	0xda65e0863149d3d5, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f8a20297b0, %r1, %r9
	setx	0x9e0ec6a2bc82a5e5, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c91c0a1998, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000ea253cea68, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000d38c140fac, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000808f166560, %r1, %r9
	setx	0x7b0c7cad7600f094, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800ea33029, %r1, %r9
	setx	0xc1ee43e3c1a2bccc, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800fa2e665, %r1, %r9
	setx	0xcd8cbfccd8ec5567, %r1, %r10
	stb	%r10, [%r9]
	setx	0x0000001080100000, %r1, %r9
	setx	0xcd8cbfccd8ec5567, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c60dc7cc4b, %r1, %r9
	setx	0xd5be166381a85d58, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d533902b6d, %r1, %r9
	setx	0x1cca42b7df4fbb34, %r1, %r10
	stb	%r10, [%r9]
	setx	0x0000001000100000, %r1, %r9
	setx	0x1cca42b7df4fbb34, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e1113f7c59, %r1, %r9
	setx	0x719a6494fa96d5bc, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f356642d12, %r1, %r9
	setx	0x514d4fa978c81ac9, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800eb12722, %r1, %r9
	setx	0x3a8ac5be0a9ed1ba, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800fd1f472, %r1, %r9
	setx	0x0952db35f4017576, %r1, %r10
	sth	%r10, [%r9]
	setx	0x00000010b0100000, %r1, %r9
	setx	0x0952db35f4017576, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c21597c786, %r1, %r9
	setx	0x6310322b47e6f730, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d13d0af358, %r1, %r9
	setx	0x6921dc9c0c3d57c3, %r1, %r10
	sth	%r10, [%r9]
	setx	0x00000010b0100000, %r1, %r9
	setx	0x6921dc9c0c3d57c3, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e6beda147c, %r1, %r9
	setx	0x2b1a6613e734c694, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000fea1137b5c, %r1, %r9
	setx	0xcc5779d4368a8238, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e5d9ba8, %r1, %r9
	setx	0x5a03a8604c50d222, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f4995f8, %r1, %r9
	setx	0x14c566eea8da8ee1, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c2049b1010, %r1, %r9
	setx	0xc606f1d51319fa78, %r1, %r10
	stw	%r10, [%r9]
	setx	0x0000001080100000, %r1, %r9
	setx	0xc606f1d51319fa78, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000d1e1c8463c, %r1, %r9
	setx	0x524e6a5fd1572821, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e056f766c8, %r1, %r9
	setx	0xc5eb7a36b296646d, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f9486e0e24, %r1, %r9
	setx	0x94c61787410eb0a9, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e407a48, %r1, %r9
	setx	0xb56af94887bd5b7a, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f8627e0, %r1, %r9
	setx	0x9c2aef09d00f37e6, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c252eab9c0, %r1, %r9
	setx	0x7bb2de0ff93a8124, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000001040100000, %r1, %r9
	setx	0x7bb2de0ff93a8124, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d737777078, %r1, %r9
	setx	0x4ae1cd72ef863563, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000efd7bfe1d0, %r1, %r9
	setx	0xa86fad1a444974d1, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f8a20297b0, %r1, %r9
	setx	0xcd1711eae4543cea, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e36bf6fa9c, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000dc5f065410, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000c2647b8fb7, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000fb4488a490, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000e7c8b07264, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000d3995858b8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000c9e24dfe44, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800f7ed308, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800eedaca0, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000e3a061a670, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000d368c13528, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000c2d5aa6a00, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800f4072b8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800ec444d0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000f8a20297b0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000e94fc3b738, %r1, %r12
	ldx	[%r12], %r11
	setx	0x00000080baba4d99, %r1, %r9
	setx	0x1ce59d356dda60fb, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e922f7b, %r1, %r9
	setx	0x4f2f05b9cd41523a, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800fd495a2, %r1, %r9
	setx	0x006477444775268c, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c1dad71d71, %r1, %r9
	setx	0x5bf7c99823073b40, %r1, %r10
	stb	%r10, [%r9]
	setx	0x00000010b0100000, %r1, %r9
	setx	0x5bf7c99823073b40, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d94805033b, %r1, %r9
	setx	0x77c5f664b4ec91b1, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ef0a589c6b, %r1, %r9
	setx	0x9b228aa34c4c5624, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f0d0636e01, %r1, %r9
	setx	0x820d84f76813cb45, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e6de4a6, %r1, %r9
	setx	0x143229dc97a61408, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f9ef720, %r1, %r9
	setx	0x0822f46cd57c6808, %r1, %r10
	sth	%r10, [%r9]
	setx	0x0000001030100000, %r1, %r9
	setx	0x0822f46cd57c6808, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000cbad195bc0, %r1, %r9
	setx	0xff75779e7bf57ec7, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d7843d4a76, %r1, %r9
	setx	0xedb00dc3d7197c04, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000efb5d7b368, %r1, %r9
	setx	0xd0f42716a558cbcc, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000fb21feb7fc, %r1, %r9
	setx	0x83f584e5082ca33f, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e6b83d8, %r1, %r9
	setx	0xd03a53a5017f4270, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f293fec, %r1, %r9
	setx	0xb88f2300fc8aec6b, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c08a2460e4, %r1, %r9
	setx	0xf3581adcff0cc3c4, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000dc874e77b0, %r1, %r9
	setx	0x2c0827a5fa1d1b88, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e3a3400460, %r1, %r9
	setx	0x341adf42293f7023, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f4735bc814, %r1, %r9
	setx	0x5352fabf4074d80a, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800eb00090, %r1, %r9
	setx	0x5ef945dab80686f1, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f6427f8, %r1, %r9
	setx	0x8c5b8bb3de7cc621, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000caa8fba080, %r1, %r9
	setx	0x6078e930c8ea3441, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000001050100000, %r1, %r9
	setx	0x6078e930c8ea3441, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000d4008ce910, %r1, %r9
	setx	0xbabcbaf7c1165f3e, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e8005c1668, %r1, %r9
	setx	0x54d741b3b8511f7e, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f8a20297b0, %r1, %r9
	setx	0x28c65ec3d44ba9bf, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000001060100000, %r1, %r9
	setx	0x28c65ec3d44ba9bf, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000c57d41c654, %r1, %r12
	lduw	[%r12], %r11
	setx	0x0000008088dd7651, %r1, %r9
	setx	0xc251065bb47c68fa, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800eec9981, %r1, %r9
	setx	0x669eb24caacf0516, %r1, %r10
	stb	%r10, [%r9]
	setx	0x0000001090100000, %r1, %r9
	setx	0x669eb24caacf0516, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800f687d17, %r1, %r9
	setx	0xff291e71f98a337b, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c0b9d24203, %r1, %r9
	setx	0x48b392f651e19ad4, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d8acab4a0d, %r1, %r9
	setx	0xc319415047a5328c, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e6eb43c0c5, %r1, %r9
	setx	0x0cd8b39ce266a0b5, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f6f6af51c9, %r1, %r9
	setx	0x791a09b78c171b8e, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800eec47a4, %r1, %r9
	setx	0x535f64d1b59f9a6d, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800fbdc10c, %r1, %r9
	setx	0xd151a9885140869e, %r1, %r10
	sth	%r10, [%r9]
	setx	0x0000001060100000, %r1, %r9
	setx	0xd151a9885140869e, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000cf5a6e7552, %r1, %r9
	setx	0xc3ecdc2956f9fd6a, %r1, %r10
	sth	%r10, [%r9]
	setx	0x0000001010100000, %r1, %r9
	setx	0xc3ecdc2956f9fd6a, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d6c564b7ae, %r1, %r9
	setx	0x8c44168d67263119, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000eea03fdc1a, %r1, %r9
	setx	0xd3709b3036d48af1, %r1, %r10
	sth	%r10, [%r9]
	setx	0x0000001090100000, %r1, %r9
	setx	0xd3709b3036d48af1, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000f81d4fff3a, %r1, %r9
	setx	0x2e1571f5efa07eb8, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e853138, %r1, %r9
	setx	0x3fa5c6c82998be12, %r1, %r10
	stw	%r10, [%r9]
	setx	0x0000001020100000, %r1, %r9
	setx	0x3fa5c6c82998be12, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f45109c, %r1, %r9
	setx	0xc98b472814891582, %r1, %r10
	stw	%r10, [%r9]
	setx	0x00000010f0100000, %r1, %r9
	setx	0xc98b472814891582, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c812a9dba0, %r1, %r9
	setx	0x789832162dd1ba64, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d7faec9b5c, %r1, %r9
	setx	0x076ef71b47ba70d0, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000eac8bf1550, %r1, %r9
	setx	0x87f2917df49d07b4, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f294f99ec8, %r1, %r9
	setx	0xa0330533490791a4, %r1, %r10
	stw	%r10, [%r9]
	setx	0x00000010b0100000, %r1, %r9
	setx	0xa0330533490791a4, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800ef730a0, %r1, %r9
	setx	0x37c510a33bc4cdbd, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f7398e8, %r1, %r9
	setx	0xff9d68ad9880b3ff, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000cef9b10c30, %r1, %r9
	setx	0xae1a113fc38e36bc, %r1, %r10
	stx	%r10, [%r9]
	setx	0x00000010b0100000, %r1, %r9
	setx	0xae1a113fc38e36bc, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000d37c7b29f0, %r1, %r9
	setx	0xf6912689a0236cf5, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e3a0138608, %r1, %r9
	setx	0xa0319c38cb43a230, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f8a20297b0, %r1, %r9
	setx	0x272db077e8759446, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f2d11a0, %r1, %r12
	ldub	[%r12], %r11
	setx	0x0000001010100000, %r1, %r9
	setx	0x272db077e8759446, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800e44c4e0, %r1, %r12
	ldub	[%r12], %r11
	setx	0x00000080f76cecf3, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000fef6be243e, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000caa65c18e2, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800fd30f08, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800f1c8fc0, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800e384b14, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000fd9a621704, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000c45957a5b0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800f06f580, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e2a7048, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000f8a20297b0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000ed63156930, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000da1916e868, %r1, %r12
	ldx	[%r12], %r11
	setx	0x0000008084989180, %r1, %r9
	setx	0xbb85d0482ab31a4f, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e5da0cd, %r1, %r9
	setx	0x0f083d61e30d00b7, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f7d67ed, %r1, %r9
	setx	0x7b7a0906b9759a41, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c280988031, %r1, %r9
	setx	0xcb8f96627f99cc9f, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d94a17999d, %r1, %r9
	setx	0x76b8f03aca5f6319, %r1, %r10
	stb	%r10, [%r9]
	setx	0x0000001090100000, %r1, %r9
	setx	0x76b8f03aca5f6319, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e6442f68b0, %r1, %r9
	setx	0x1593c9ccba61a2c7, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f188da4e94, %r1, %r9
	setx	0x8555bd7b2a14e8c2, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800eaef012, %r1, %r9
	setx	0x331a7638cebebe1d, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f41a22e, %r1, %r9
	setx	0xe498938d3968af34, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c049381fd6, %r1, %r9
	setx	0xd6b55c7da9a3ffc6, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000ddc3e70482, %r1, %r9
	setx	0xad17b19357306c55, %r1, %r10
	sth	%r10, [%r9]
	setx	0x00000010c0100000, %r1, %r9
	setx	0xad17b19357306c55, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e9673206ea, %r1, %r9
	setx	0x7739985ffe55d8a7, %r1, %r10
	sth	%r10, [%r9]
	setx	0x0000001080100000, %r1, %r9
	setx	0x7739985ffe55d8a7, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000f2adbf1550, %r1, %r9
	setx	0xba2ff45e365912d6, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800eab9e70, %r1, %r9
	setx	0x27fec7d5bb149865, %r1, %r10
	stw	%r10, [%r9]
	setx	0x0000001060100000, %r1, %r9
	setx	0x27fec7d5bb149865, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800fa43f84, %r1, %r9
	setx	0xc1f9a8274a747dbe, %r1, %r10
	stw	%r10, [%r9]
	setx	0x0000001050100000, %r1, %r9
	setx	0xc1f9a8274a747dbe, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000c5c8c70978, %r1, %r9
	setx	0xe318988eaea7060c, %r1, %r10
	stw	%r10, [%r9]
	setx	0x0000001010100000, %r1, %r9
	setx	0xe318988eaea7060c, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000de304ada64, %r1, %r9
	setx	0x7bebde09807e55bb, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e15a7a41d0, %r1, %r9
	setx	0xbf53ae0830efb606, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f6ad142d24, %r1, %r9
	setx	0xcc2c8bb0090e35d8, %r1, %r10
	stw	%r10, [%r9]
	setx	0x00000010d0100000, %r1, %r9
	setx	0xcc2c8bb0090e35d8, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800e18c9f0, %r1, %r9
	setx	0x4d7a0c09c38d1678, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f481d10, %r1, %r9
	setx	0x04c61572e6d6304f, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000001040100000, %r1, %r9
	setx	0x04c61572e6d6304f, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c7d3264960, %r1, %r9
	setx	0x2fd47b05491544ae, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000dc73e74cf0, %r1, %r9
	setx	0xc81389487c253a98, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e5aa421738, %r1, %r9
	setx	0x2cbc96e54b75c5b6, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000001010100000, %r1, %r9
	setx	0x2cbc96e54b75c5b6, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000f8a20297b0, %r1, %r9
	setx	0x6979037ca7f25d76, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800e6a3d88, %r1, %r12
	ldub	[%r12], %r11
	setx	0x0000001020100000, %r1, %r9
	setx	0x6979037ca7f25d76, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000802a5b92ce, %r1, %r12
	ldub	[%r12], %r11
	setx	0x00000010c0100000, %r1, %r9
	setx	0x6979037ca7f25d76, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f2cbef0c12, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000e777b52d87, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000d4bfc14de1, %r1, %r12
	ldub	[%r12], %r11
	setx	0x0000001000100000, %r1, %r9
	setx	0x6979037ca7f25d76, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000c5efa03039, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000f2afff1806, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000e8728a88d8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000dbba977e2a, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000c0bd59a1e6, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800f44f0f6, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800ea64f9a, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000f5592e9220, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e41fc70, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000fe900161f4, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000e7fddc94ac, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000d55c33b1ac, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000cd839b5218, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800f196e90, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800e98f304, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800eb8fed0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000f8a20297b0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000e1c1b3df60, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000dc3f3fe808, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000c85a72c9d8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800f495690, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e6e14d0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x00000080e90f1500, %r1, %r9
	setx	0xe879848e110ca3f7, %r1, %r10
	stb	%r10, [%r9]
	setx	0x0000001010100000, %r1, %r9
	setx	0xe879848e110ca3f7, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800e9d3a47, %r1, %r9
	setx	0x18863bd9ab47653d, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f72f9a4, %r1, %r9
	setx	0x4ddfc7592b94498a, %r1, %r10
	stb	%r10, [%r9]
	setx	0x0000001090100000, %r1, %r9
	setx	0x4ddfc7592b94498a, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000cc0d6442f2, %r1, %r9
	setx	0x9cb4d049cd03ee0e, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d0fb5f8681, %r1, %r9
	setx	0x80c6594859ca0e2d, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e3fbeecfad, %r1, %r9
	setx	0x6ed69400c4ad47fb, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f3fec009bf, %r1, %r9
	setx	0x7dbc0c149e8de44a, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800ebc9db8, %r1, %r9
	setx	0x3f36b70d1bb19e70, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800fe5b754, %r1, %r9
	setx	0x37fb0df105621b8d, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000ced1d040c6, %r1, %r9
	setx	0x0eb3bae868804276, %r1, %r10
	sth	%r10, [%r9]
	setx	0x0000001030100000, %r1, %r9
	setx	0x0eb3bae868804276, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000dfceae2566, %r1, %r9
	setx	0x87621756cedca15f, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e644d18fe4, %r1, %r9
	setx	0x03d522057f6035cf, %r1, %r10
	sth	%r10, [%r9]
	setx	0x00000010c0100000, %r1, %r9
	setx	0x03d522057f6035cf, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000f157b3f2bc, %r1, %r9
	setx	0x0034bdb7e7b56791, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e6499ec, %r1, %r9
	setx	0xc5af87a58b27bafb, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f6d4534, %r1, %r9
	setx	0x5319b1d80d02b991, %r1, %r10
	stw	%r10, [%r9]
	setx	0x0000001000100000, %r1, %r9
	setx	0x5319b1d80d02b991, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000c8400fa28c, %r1, %r9
	setx	0xbcedf3eba3358f52, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000db8dc15b3c, %r1, %r9
	setx	0xf34a59fa75ed5bf9, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e2377a4df0, %r1, %r9
	setx	0x17a6e894537649e9, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000fd0a5d42e4, %r1, %r9
	setx	0x39972a6ae689405d, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800eee3068, %r1, %r9
	setx	0x555193a16dfaeca5, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800fe7ff70, %r1, %r9
	setx	0xf99666b6ba3ad7eb, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c51c016308, %r1, %r9
	setx	0xc70b2e7dcbd5e0cd, %r1, %r10
	stx	%r10, [%r9]
	setx	0x00000010c0100000, %r1, %r9
	setx	0xc70b2e7dcbd5e0cd, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000dbecf3cff0, %r1, %r9
	setx	0x79bbbdccbaa94321, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000eb67cf7b70, %r1, %r9
	setx	0x6827d8eef20e7f39, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000001070100000, %r1, %r9
	setx	0x6827d8eef20e7f39, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f8a20297b0, %r1, %r9
	setx	0xd920a1b3a24d4137, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000001070100000, %r1, %r9
	setx	0xd920a1b3a24d4137, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000c1c9d8ff4d, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800fe59a5a, %r1, %r12
	ldub	[%r12], %r11
	setx	0x0000001060100000, %r1, %r9
	setx	0xd920a1b3a24d4137, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800eaa604f, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000808845f726, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000f261271391, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000e1ed7245db, %r1, %r12
	ldub	[%r12], %r11
	setx	0x0000001060100000, %r1, %r9
	setx	0xd920a1b3a24d4137, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000f388716f1a, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000e980ed2f3a, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d6653c38cc, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800fa63eec, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800e9764bc, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000fe7a9c3c44, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000e6940a61cc, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000d3dfd10a68, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000c2f5266ba4, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000ca2c919e60, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800f04da30, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800ed78758, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000f8a20297b0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000eb762dc7a8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000d336797320, %r1, %r12
	ldx	[%r12], %r11
	setx	0x00000080c30b110b, %r1, %r9
	setx	0x0e279fec19f58c7e, %r1, %r10
	stb	%r10, [%r9]
	setx	0x0000001050100000, %r1, %r9
	setx	0x0e279fec19f58c7e, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800e4c5bac, %r1, %r9
	setx	0x5ba9854a0e82e2ed, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f1d358e, %r1, %r9
	setx	0x0cf315093a8d94ba, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000cd97776bbd, %r1, %r9
	setx	0x8151037641c30c0e, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000dec6407988, %r1, %r9
	setx	0xf1f954bfaed99e35, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e91d7822e6, %r1, %r9
	setx	0x26d66e3063affd7d, %r1, %r10
	stb	%r10, [%r9]
	setx	0x00000010f0100000, %r1, %r9
	setx	0x26d66e3063affd7d, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000fd98f40a69, %r1, %r9
	setx	0xea9e3c7146c3ba30, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e5b6106, %r1, %r9
	setx	0x1953aebf0df727fe, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800fe587f2, %r1, %r9
	setx	0xf81729325d1f8e97, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c974057ff6, %r1, %r9
	setx	0xb897aa234231542d, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d051025636, %r1, %r9
	setx	0x911aec8a79422ae9, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000ed2546ead4, %r1, %r9
	setx	0xffa3a88dbd849c74, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000fb86265756, %r1, %r9
	setx	0x08870e2b5c91ed60, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800ed22bc8, %r1, %r9
	setx	0xf09a19d9fb1bb120, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f800080, %r1, %r9
	setx	0x5b86ed6ac9d68da5, %r1, %r10
	stw	%r10, [%r9]
	setx	0x0000001060100000, %r1, %r9
	setx	0x5b86ed6ac9d68da5, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c989a83fb0, %r1, %r9
	setx	0xbdb4c2da03d6791b, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000dd89e7aed0, %r1, %r9
	setx	0x9a3451904062e465, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e5161f6a3c, %r1, %r9
	setx	0x29c24afa8feedb52, %r1, %r10
	stw	%r10, [%r9]
	setx	0x0000001060100000, %r1, %r9
	setx	0x29c24afa8feedb52, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000f1457533f8, %r1, %r9
	setx	0x139affd12f18e1f4, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e96c008, %r1, %r9
	setx	0xd9aacb43eaeaf455, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800fc31660, %r1, %r9
	setx	0xa4cf9266f2cdce3c, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000001040100000, %r1, %r9
	setx	0xa4cf9266f2cdce3c, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c9aa30b198, %r1, %r9
	setx	0xaf8df4ee6295bd85, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000001080100000, %r1, %r9
	setx	0xaf8df4ee6295bd85, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d878e3fed0, %r1, %r9
	setx	0xc41af478a1aa35a6, %r1, %r10
	stx	%r10, [%r9]
	setx	0x00000010b0100000, %r1, %r9
	setx	0xc41af478a1aa35a6, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000ea769b7f78, %r1, %r9
	setx	0x59209f159f3d58cb, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f8a20297b0, %r1, %r9
	setx	0x9f8d6b104332cc0a, %r1, %r10
	stx	%r10, [%r9]
	setx	0x00000010b0100000, %r1, %r9
	setx	0x9f8d6b104332cc0a, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ca02655be8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800f6d1520, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e1c0104, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000f0df4d57b8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000e84e683814, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e853138, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000f4735bc814, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000e3a3400460, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000dc874e77b0, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000c08a2460e4, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800f293fec, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000f8a20297b0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000e20b175b70, %r1, %r12
	ldx	[%r12], %r11
	setx	0x00000080a7c571f7, %r1, %r9
	setx	0xf65ddb2222f1c2c2, %r1, %r10
	stb	%r10, [%r9]
	setx	0x00000010b0100000, %r1, %r9
	setx	0xf65ddb2222f1c2c2, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800e6b00d1, %r1, %r9
	setx	0x47ed269d625352f7, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800fdc9764, %r1, %r9
	setx	0xf54b4434014236af, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000cd882a65c1, %r1, %r9
	setx	0x8ea506667ea7c43b, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000de436142df, %r1, %r9
	setx	0x1b86327740d8eb5e, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e271589610, %r1, %r9
	setx	0xcb7d6b83b2d7f08d, %r1, %r10
	stb	%r10, [%r9]
	setx	0x00000010b0100000, %r1, %r9
	setx	0xcb7d6b83b2d7f08d, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000f4576c88de, %r1, %r9
	setx	0xdbc0f38f6d6bbc08, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800ec81b94, %r1, %r9
	setx	0xfe5e59229ffcf899, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800fb6657c, %r1, %r9
	setx	0xfcded178f243a500, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c9120940b2, %r1, %r9
	setx	0x832f7326c57567f3, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d3157aa3f2, %r1, %r9
	setx	0xc53352e059b7d16e, %r1, %r10
	sth	%r10, [%r9]
	setx	0x0000001080100000, %r1, %r9
	setx	0xc53352e059b7d16e, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e1ba51cd88, %r1, %r9
	setx	0xf2fe39b9be2378a1, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000fcff24de2e, %r1, %r9
	setx	0x0471cebee6659f7a, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800eddfec4, %r1, %r9
	setx	0x3109a68934f57179, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f4d2218, %r1, %r9
	setx	0x0831b81f044c7c4e, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c68e4b3c00, %r1, %r9
	setx	0xd6e6fb224ca493c7, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d5921b06ec, %r1, %r9
	setx	0x25cb002c58348e23, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000efa9641fd4, %r1, %r9
	setx	0xd25f4fe35a7c2fc6, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f937b1c37c, %r1, %r9
	setx	0x5ef59c21a5b374c5, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800eec5af0, %r1, %r9
	setx	0xdc6e0de21abfb6e3, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f8ce308, %r1, %r9
	setx	0x3947590b7e8ca62f, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c88f2a8870, %r1, %r9
	setx	0x07b2fe6188549869, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d90ff78ba0, %r1, %r9
	setx	0x18ed5ffbb0065676, %r1, %r10
	stx	%r10, [%r9]
	setx	0x00000010d0100000, %r1, %r9
	setx	0x18ed5ffbb0065676, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e69e3e7a48, %r1, %r9
	setx	0xb523f7dfeddabfa3, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f8a20297b0, %r1, %r9
	setx	0x6ff8b66aa69d163c, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f376504e8e, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000ea2fd5e1b6, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000c79df16538, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800f616b18, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e3756e4, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000f04e623f0a, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000e9b58d0636, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000f15ded27a0, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000e05dcb1a84, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000d4b9e89b1c, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000cf08da4900, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800fbaea1c, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800f703188, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e5614a8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000f8a20297b0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000e859b58328, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000808258cd1f, %r1, %r9
	setx	0x4264d137f6872091, %r1, %r10
	stb	%r10, [%r9]
	setx	0x00000010b0100000, %r1, %r9
	setx	0x4264d137f6872091, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800e914c24, %r1, %r9
	setx	0x808f82aaee641605, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800fa93a2d, %r1, %r9
	setx	0x9876e900e57e1f0e, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c635529d46, %r1, %r9
	setx	0x4c159b345e4962b7, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000da2a3d1080, %r1, %r9
	setx	0x1d96af2aaf60d044, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e30e45804f, %r1, %r9
	setx	0x28a3f93e0b47b839, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f30d2c13ae, %r1, %r9
	setx	0x81b7072970bc3215, %r1, %r10
	stb	%r10, [%r9]
	setx	0x00000010f0100000, %r1, %r9
	setx	0x81b7072970bc3215, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800e84dc4a, %r1, %r9
	setx	0x6f5356b41a83127a, %r1, %r10
	sth	%r10, [%r9]
	setx	0x0000001010100000, %r1, %r9
	setx	0x6f5356b41a83127a, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f7a19e8, %r1, %r9
	setx	0xc4cb4dec3ec94858, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c72c7a1360, %r1, %r9
	setx	0x182aa4d0f68ff08f, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000da092fec50, %r1, %r9
	setx	0x56d982c457caa63d, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e7e6926386, %r1, %r9
	setx	0x7a95908536583f97, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f8fdc35338, %r1, %r9
	setx	0x9a5cb63be170891a, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800ed6a59c, %r1, %r9
	setx	0xd8943be297e3fffb, %r1, %r10
	stw	%r10, [%r9]
	setx	0x0000001060100000, %r1, %r9
	setx	0xd8943be297e3fffb, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f91fa4c, %r1, %r9
	setx	0x3b992705b27672e7, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c9f687ddfc, %r1, %r9
	setx	0x406a77d1f31ca098, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d84a40652c, %r1, %r9
	setx	0xbc44e50a4ebb654d, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e616438f08, %r1, %r9
	setx	0xb0a66f1ce8c1f248, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000fe00708d58, %r1, %r9
	setx	0xbb1b1e6005290bf6, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e90d948, %r1, %r9
	setx	0xa79df14874e8b676, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000001030100000, %r1, %r9
	setx	0xa79df14874e8b676, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800fb39d28, %r1, %r9
	setx	0xb515eac98b463839, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c442969e78, %r1, %r9
	setx	0x3923d5b2ef1e980c, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d45d42a2e8, %r1, %r9
	setx	0xdc7bdc95d073e841, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e2c79ec7c8, %r1, %r9
	setx	0x9b1a6e3cb78e8571, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f8a20297b0, %r1, %r9
	setx	0xb7de7f19bd4717c8, %r1, %r10
	stx	%r10, [%r9]
	setx	0x00000080c8aeff6a, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000f4de29b28d, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000ea66940844, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000d33c26fc99, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000c88a7196a9, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800f193cff, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800ebf31ec, %r1, %r12
	ldub	[%r12], %r11
	setx	0x00000010b0100000, %r1, %r9
	setx	0xb7de7f19bd4717c8, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000ea9f96a7c8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000dabfb648e0, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000c64547c1dc, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000c43fe486f0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800f464c18, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e2dd7d8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000f8a20297b0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000e8c049e2e8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000807fcfcea1, %r1, %r9
	setx	0x461d52c987a87cb0, %r1, %r10
	stb	%r10, [%r9]
	setx	0x00000010d0100000, %r1, %r9
	setx	0x461d52c987a87cb0, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800e33a69c, %r1, %r9
	setx	0xfc75e2cd66b08001, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f45908a, %r1, %r9
	setx	0xf94ea20084515c32, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ccabd99129, %r1, %r9
	setx	0x5ed1ba3b464eab04, %r1, %r10
	stb	%r10, [%r9]
	setx	0x00000010a0100000, %r1, %r9
	setx	0x5ed1ba3b464eab04, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000d7c6d6fab5, %r1, %r9
	setx	0x06c3996157462c64, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e2c74efec4, %r1, %r9
	setx	0xc9015dbda237d1dc, %r1, %r10
	stb	%r10, [%r9]
	setx	0x0000001040100000, %r1, %r9
	setx	0xc9015dbda237d1dc, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f9ef98317c, %r1, %r9
	setx	0x7ed7d51d60a8fc22, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800eea8396, %r1, %r9
	setx	0x6f4f94d7b701b71a, %r1, %r10
	sth	%r10, [%r9]
	setx	0x0000001010100000, %r1, %r9
	setx	0x6f4f94d7b701b71a, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800f814f3a, %r1, %r9
	setx	0x6af7fd997abe6148, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000cfed4e0230, %r1, %r9
	setx	0x7b7784175e035f86, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d5c4810024, %r1, %r9
	setx	0x446ddeca39272b59, %r1, %r10
	sth	%r10, [%r9]
	setx	0x00000010a0100000, %r1, %r9
	setx	0x446ddeca39272b59, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000edc1c53c02, %r1, %r9
	setx	0xdee26d5cb7991a9b, %r1, %r10
	sth	%r10, [%r9]
	setx	0x00000010a0100000, %r1, %r9
	setx	0xdee26d5cb7991a9b, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000f186ab78de, %r1, %r9
	setx	0xb68c4b5595aac7a8, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e441e78, %r1, %r9
	setx	0xd6e8f2946a402133, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f136f84, %r1, %r9
	setx	0x696e1737934aed95, %r1, %r10
	stw	%r10, [%r9]
	setx	0x00000010c0100000, %r1, %r9
	setx	0x696e1737934aed95, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000cb03deeb20, %r1, %r9
	setx	0x9fccc887a4a98c28, %r1, %r10
	stw	%r10, [%r9]
	setx	0x00000010f0100000, %r1, %r9
	setx	0x9fccc887a4a98c28, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000db9233a874, %r1, %r9
	setx	0x2df7898d7534a411, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e18af43a14, %r1, %r9
	setx	0xf239eb72cbbece3c, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f175ba3158, %r1, %r9
	setx	0xb1d54d16c21b2a61, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e2b02d0, %r1, %r9
	setx	0x4f393ac4e3e6c8ec, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f334760, %r1, %r9
	setx	0x109b162883821132, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c2273528e8, %r1, %r9
	setx	0xafeca168981a7e9c, %r1, %r10
	stx	%r10, [%r9]
	setx	0x00000010b0100000, %r1, %r9
	setx	0xafeca168981a7e9c, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000dbd80ba9c0, %r1, %r9
	setx	0xff032c29efa74c4a, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e140707c50, %r1, %r9
	setx	0xfacab6133ef68e7a, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000001000100000, %r1, %r9
	setx	0xfacab6133ef68e7a, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f8a20297b0, %r1, %r9
	setx	0xb578a633076536b0, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e30e45804f, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000da2a3d1080, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000c635529d46, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800fa93a2d, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800e914c24, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000c68e0897fe, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800f8fd6b6, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800ed647a2, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000fe40ee7c98, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000e625c55f38, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000ddace989f0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d615ccf998, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000c1d6100128, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800fcfe9b8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800e41fc70, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000fe900161f4, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000e7fddc94ac, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000d856999480, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000c170d79fa8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800f9d9440, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800efe25a8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x00000080f4f6d6ac, %r1, %r9
	setx	0xba24098e28cd9f1a, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e08bc0a, %r1, %r9
	setx	0x3c10db3f2ee7a87a, %r1, %r10
	stb	%r10, [%r9]
	setx	0x0000001040100000, %r1, %r9
	setx	0x3c10db3f2ee7a87a, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800fc3dcef, %r1, %r9
	setx	0x2acebb489a5cbc98, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c8c7f4f84a, %r1, %r9
	setx	0xe55e1989cb6661f1, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d66a644390, %r1, %r9
	setx	0x6b3fdaf13f1165b7, %r1, %r10
	stb	%r10, [%r9]
	setx	0x0000001090100000, %r1, %r9
	setx	0x6b3fdaf13f1165b7, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000eb747b7453, %r1, %r9
	setx	0x6a5b057d3aaaa4d0, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000fa5dc8d80c, %r1, %r9
	setx	0xc41e235c4ba07d8a, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e3e7cc2, %r1, %r9
	setx	0x32482546b87a7dca, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800fbd0d04, %r1, %r9
	setx	0x7e602d62eaf04c7c, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000cc99c19ab0, %r1, %r9
	setx	0x274f6f3526ec0011, %r1, %r10
	sth	%r10, [%r9]
	setx	0x00000010a0100000, %r1, %r9
	setx	0x274f6f3526ec0011, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000de74f8d2c6, %r1, %r9
	setx	0xe08ae5b00c0a9d70, %r1, %r10
	sth	%r10, [%r9]
	setx	0x0000001070100000, %r1, %r9
	setx	0xe08ae5b00c0a9d70, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000ee6a1f41f4, %r1, %r9
	setx	0x4dc9e7fd3be3441e, %r1, %r10
	sth	%r10, [%r9]
	setx	0x00000010b0100000, %r1, %r9
	setx	0x4dc9e7fd3be3441e, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000fc541e92b8, %r1, %r9
	setx	0x573b06ca277f2754, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e569ce8, %r1, %r9
	setx	0x2251e25dc7331fed, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f28fc4c, %r1, %r9
	setx	0x44dea6dac9065b28, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000cee5b55340, %r1, %r9
	setx	0x5115c133c011343e, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000da51a09350, %r1, %r9
	setx	0xab228f9fd095a152, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e0198d3800, %r1, %r9
	setx	0xa95beac43d139840, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000fbaadad1a8, %r1, %r9
	setx	0xfd3d00f3029f794c, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e320ca0, %r1, %r9
	setx	0x2cffbabbb42ae59a, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f40f800, %r1, %r9
	setx	0xbacf9d605e36f845, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000cda36c0528, %r1, %r9
	setx	0x4498da6e16b77fc7, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000001050100000, %r1, %r9
	setx	0x4498da6e16b77fc7, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d274239998, %r1, %r9
	setx	0x2ce791e9b5f2ef30, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e5a3c976f0, %r1, %r9
	setx	0x717b4b640ce356a0, %r1, %r10
	stx	%r10, [%r9]
	setx	0x00000010e0100000, %r1, %r9
	setx	0x717b4b640ce356a0, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f8a20297b0, %r1, %r9
	setx	0xa7098d0e49ee8585, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ef9a297298, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000da0bd7b970, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000cc28148cd8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800f180bc8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000c252eab9c0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800f8627e0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e407a48, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000f8a20297b0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000e1d73bdb88, %r1, %r12
	ldx	[%r12], %r11
	setx	0x0000008094243cdd, %r1, %r9
	setx	0xaf1069e9fc9e2664, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e3ac4c7, %r1, %r9
	setx	0xeff27707f667d3f2, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800ff4a148, %r1, %r9
	setx	0x8543a5037bed91c7, %r1, %r10
	stb	%r10, [%r9]
	setx	0x0000001010100000, %r1, %r9
	setx	0x8543a5037bed91c7, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000c64761ad5e, %r1, %r9
	setx	0x11463e10a6553b42, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d3cc266eea, %r1, %r9
	setx	0x5712a3e35be281e4, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e16b67ed39, %r1, %r9
	setx	0x21dd4f7ab69ade94, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000fbc88e032e, %r1, %r9
	setx	0x46733360259b6c0f, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e710534, %r1, %r9
	setx	0x91f4bf738598e4b5, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f3d0c80, %r1, %r9
	setx	0x1bdd666cba0f24c7, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c56808321a, %r1, %r9
	setx	0x017644f7c9855f8b, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000db773297d4, %r1, %r9
	setx	0x89a3587df09da364, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e40266321c, %r1, %r9
	setx	0x5b953c1d9bf190d0, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f04dfe93cc, %r1, %r9
	setx	0x46916da67e8991bc, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800ed1f6fc, %r1, %r9
	setx	0xd10fe562f90eba0b, %r1, %r10
	stw	%r10, [%r9]
	setx	0x0000001040100000, %r1, %r9
	setx	0xd10fe562f90eba0b, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800f4ce5e0, %r1, %r9
	setx	0x6e7ba9d02f084d01, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000cb484c5e18, %r1, %r9
	setx	0xbab0969fe25e9f26, %r1, %r10
	stw	%r10, [%r9]
	setx	0x00000010c0100000, %r1, %r9
	setx	0xbab0969fe25e9f26, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d5f33cfd1c, %r1, %r9
	setx	0xd3a6a8cc6868bbd5, %r1, %r10
	stw	%r10, [%r9]
	setx	0x0000001060100000, %r1, %r9
	setx	0xd3a6a8cc6868bbd5, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e0f8e1f80c, %r1, %r9
	setx	0x33cbf0cef15ca841, %r1, %r10
	stw	%r10, [%r9]
	setx	0x00000010e0100000, %r1, %r9
	setx	0x33cbf0cef15ca841, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000fcffe62f40, %r1, %r9
	setx	0x8e5d76d82ddbdb8a, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800ef23f70, %r1, %r9
	setx	0x810b92d6115bac34, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f9f0a98, %r1, %r9
	setx	0x535df86d7b76a799, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ce92628788, %r1, %r9
	setx	0x0b272988d2960dae, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000dba56c8628, %r1, %r9
	setx	0x89c7ac259721fceb, %r1, %r10
	stx	%r10, [%r9]
	setx	0x00000010a0100000, %r1, %r9
	setx	0x89c7ac259721fceb, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e376efa198, %r1, %r9
	setx	0xddb25ce80f712828, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f8a20297b0, %r1, %r9
	setx	0xd0303d54e951fada, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f3f7f98ad2, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000e7d567cf50, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000dd060e98b8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000c1134ef10a, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800fad0270, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e130faa, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000f034d34778, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d7cfc5b3f8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000c07c4164a8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800f202588, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800e024af4, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800f3ad428, %r1, %r12
	ldx	[%r12], %r11
	setx	0x00000080690b02bb, %r1, %r9
	setx	0xb67a64a73b622e7b, %r1, %r10
	stb	%r10, [%r9]
	setx	0x0000001070100000, %r1, %r9
	setx	0xb67a64a73b622e7b, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800e8079f2, %r1, %r9
	setx	0xb70703b2da42e03a, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f20ba3e, %r1, %r9
	setx	0x3e1415d23596f833, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c86f095599, %r1, %r9
	setx	0x77b7d1c38dc98d05, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d31b472ed8, %r1, %r9
	setx	0x880e37e15db14c44, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000eca53b0c99, %r1, %r9
	setx	0x71f2c1546f3a543d, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000fdf9944cda, %r1, %r9
	setx	0xaf7deee7e8ada196, %r1, %r10
	stb	%r10, [%r9]
	setx	0x00000010a0100000, %r1, %r9
	setx	0xaf7deee7e8ada196, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800e4fa0bc, %r1, %r9
	setx	0x397e29a370c70903, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f8c3552, %r1, %r9
	setx	0xe94c77ca8ab25c50, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000cf5e7557f8, %r1, %r9
	setx	0xe2a95f6af279d3fd, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d045cd54a0, %r1, %r9
	setx	0xfb6fcd8ddb6f8c51, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e6cf28908e, %r1, %r9
	setx	0xe69f53ded319108c, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f6ce9dddbc, %r1, %r9
	setx	0x99aef0fbb3097827, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800ebaf4fc, %r1, %r9
	setx	0x042475ebb4f23a24, %r1, %r10
	stw	%r10, [%r9]
	setx	0x00000010a0100000, %r1, %r9
	setx	0x042475ebb4f23a24, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800fba6a68, %r1, %r9
	setx	0x064d0a4668495992, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c75cdc8cc4, %r1, %r9
	setx	0x7aaa32e3f2b8c78f, %r1, %r10
	stw	%r10, [%r9]
	setx	0x0000001040100000, %r1, %r9
	setx	0x7aaa32e3f2b8c78f, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000d1d121cdf4, %r1, %r9
	setx	0xb913773fa5c6d6f1, %r1, %r10
	stw	%r10, [%r9]
	setx	0x0000001080100000, %r1, %r9
	setx	0xb913773fa5c6d6f1, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000e38918f5b4, %r1, %r9
	setx	0xfd8080081b0d3a15, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000fe99aaa634, %r1, %r9
	setx	0xa267cf60dcc5a3e0, %r1, %r10
	stw	%r10, [%r9]
	setx	0x0000001000100000, %r1, %r9
	setx	0xa267cf60dcc5a3e0, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800e844e08, %r1, %r9
	setx	0xdc4ee6ea0b305c7d, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000001090100000, %r1, %r9
	setx	0xdc4ee6ea0b305c7d, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800f3dd438, %r1, %r9
	setx	0xa8e491e2cc136ee3, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000cf40197740, %r1, %r9
	setx	0x43c87f67d605fe84, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000de6a3de350, %r1, %r9
	setx	0x1776814dc5ef5d35, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e31ce35670, %r1, %r9
	setx	0x138d684b936e537d, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f8a20297b0, %r1, %r9
	setx	0x862e2f3fa2b4dc10, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e92e5dba35, %r1, %r12
	ldub	[%r12], %r11
	setx	0x0000001050100000, %r1, %r9
	setx	0x862e2f3fa2b4dc10, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d620222233, %r1, %r12
	ldub	[%r12], %r11
	setx	0x00000010f0100000, %r1, %r9
	setx	0x862e2f3fa2b4dc10, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c44da47aec, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000dfde2f2c10, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000c7a95932c6, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800f602276, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e03e9dc, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000fb050784da, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000c981e0401c, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800f0360b8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800ee9b81c, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000fbd3216180, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000ef7ef0c92c, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000d4f7c07adc, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000cef666a394, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000ed6a229f00, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000daced49e90, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000c062eec658, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000808a3daabc, %r1, %r9
	setx	0x978991a83c1925dd, %r1, %r10
	stb	%r10, [%r9]
	setx	0x0000001060100000, %r1, %r9
	setx	0x978991a83c1925dd, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800eb15e74, %r1, %r9
	setx	0x12266419578abd18, %r1, %r10
	stb	%r10, [%r9]
	setx	0x00000010b0100000, %r1, %r9
	setx	0x12266419578abd18, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f508ee7, %r1, %r9
	setx	0xdc41d059b4203155, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c13ac36d54, %r1, %r9
	setx	0x08679ff491e76941, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ddeef45879, %r1, %r9
	setx	0xf0be0c4de4c99183, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e156881953, %r1, %r9
	setx	0x2e4dd69ca9940196, %r1, %r10
	stb	%r10, [%r9]
	setx	0x00000010e0100000, %r1, %r9
	setx	0x2e4dd69ca9940196, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000feb4a1d0a2, %r1, %r9
	setx	0x1f3253f3e1317c00, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800eca52d2, %r1, %r9
	setx	0x1cbab1d8c11dd5ae, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800fa97120, %r1, %r9
	setx	0x9e813ffa3287bf6c, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c1889c3dee, %r1, %r9
	setx	0x67cf4211913520ff, %r1, %r10
	sth	%r10, [%r9]
	setx	0x0000001080100000, %r1, %r9
	setx	0x67cf4211913520ff, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000d5afbaa72a, %r1, %r9
	setx	0x518e58c308357383, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e591e87df2, %r1, %r9
	setx	0xeae88a68c4e16500, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f1e28e161a, %r1, %r9
	setx	0x575941d47a923711, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800ea265c4, %r1, %r9
	setx	0x6b81afc4e218adec, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f57cd48, %r1, %r9
	setx	0x43c55e4e5d2f745c, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000cb20eabc78, %r1, %r9
	setx	0xd08e37d815b10061, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d65680c590, %r1, %r9
	setx	0xf6bed71a0c8055d8, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e348ad29cc, %r1, %r9
	setx	0xe9db68fa6851becc, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000fa8715c180, %r1, %r9
	setx	0x4f9af7b585a705e0, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e39ce80, %r1, %r9
	setx	0x8b568d32ce9fbb2d, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f5b42c0, %r1, %r9
	setx	0x742e9194e2c0846f, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ccaaf14620, %r1, %r9
	setx	0x0d175e535f504820, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000db2ac1d1d8, %r1, %r9
	setx	0xc547d4ba0fa76411, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e0b86b2e10, %r1, %r9
	setx	0x834687fa1f2757e9, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f8a20297b0, %r1, %r9
	setx	0x6861d6e9113b5bdb, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d2c2365a1a, %r1, %r12
	ldub	[%r12], %r11
	setx	0x0000001070100000, %r1, %r9
	setx	0x6861d6e9113b5bdb, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c666c02d22, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800f22c5c7, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800ee18f1c, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000d19a02d23c, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000c1d02b099c, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000f8a20297b0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000e3a0138608, %r1, %r12
	ldx	[%r12], %r11
	setx	0x00000080204ee3a0, %r1, %r9
	setx	0x7111ab0f07251082, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800ed1a74c, %r1, %r9
	setx	0x528c659bc8697b2a, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800fef0892, %r1, %r9
	setx	0xc4c685266e000d79, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c0d3372519, %r1, %r9
	setx	0xfdd2b2e67f19f819, %r1, %r10
	stb	%r10, [%r9]
	setx	0x00000010a0100000, %r1, %r9
	setx	0xfdd2b2e67f19f819, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000de99ea9beb, %r1, %r9
	setx	0x6be85c466986fe31, %r1, %r10
	stb	%r10, [%r9]
	setx	0x0000001090100000, %r1, %r9
	setx	0x6be85c466986fe31, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000ecae69888c, %r1, %r9
	setx	0x12edddd99f06e32f, %r1, %r10
	stb	%r10, [%r9]
	setx	0x0000001090100000, %r1, %r9
	setx	0x12edddd99f06e32f, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000fcb7a77300, %r1, %r9
	setx	0x5cfc33c6e8f4be13, %r1, %r10
	stb	%r10, [%r9]
	setx	0x00000010e0100000, %r1, %r9
	setx	0x5cfc33c6e8f4be13, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800eaad808, %r1, %r9
	setx	0x915742990bdaf15e, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f065f10, %r1, %r9
	setx	0xbc7ce360c4fdc05f, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000cc27cfc290, %r1, %r9
	setx	0xdd0414b7ec7b57ee, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000dd327cb0be, %r1, %r9
	setx	0xd8f76fac1241985d, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e73e37617e, %r1, %r9
	setx	0x0c7279178defc5de, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000fd1641b620, %r1, %r9
	setx	0x606c3a4f000a31e9, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e2638a4, %r1, %r9
	setx	0x58324b2dc60cc0c1, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f6c97a0, %r1, %r9
	setx	0x3fa34dea9d501774, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c2938883d4, %r1, %r9
	setx	0x1d6baed58517d3dc, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000dafda6bf2c, %r1, %r9
	setx	0x4ba735880ca9cd08, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e991954d9c, %r1, %r9
	setx	0xc797eed34524a8f3, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f978c85524, %r1, %r9
	setx	0x738cbc1f1db56718, %r1, %r10
	stw	%r10, [%r9]
	setx	0x00000010a0100000, %r1, %r9
	setx	0x738cbc1f1db56718, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800e11c2a8, %r1, %r9
	setx	0x72c23f8dfe20292a, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800fdefb40, %r1, %r9
	setx	0x333b3ab62e2b838f, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c806c90458, %r1, %r9
	setx	0xa135405a25f70ba2, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000df8164ba78, %r1, %r9
	setx	0xfd9f084858f4b0af, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e37565f7e8, %r1, %r9
	setx	0x8d0318dab0e292f6, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000001080100000, %r1, %r9
	setx	0x8d0318dab0e292f6, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f8a20297b0, %r1, %r9
	setx	0x1ebdad49f3a3c680, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000008021f4a676, %r1, %r12
	ldub	[%r12], %r11
	setx	0x0000001020100000, %r1, %r9
	setx	0x1ebdad49f3a3c680, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800faa8fea, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e87679e, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000f54db82878, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000eb00cff536, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d5857bac22, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000cdcbda2a08, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800f81935e, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800fdc37e8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800e3d8768, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000fc7f002890, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000e7633a8f54, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800fe94f40, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800ef07548, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000f8a20297b0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000ef12d575a0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000d9c9a69458, %r1, %r12
	ldx	[%r12], %r11
	setx	0x00000080a534cc8d, %r1, %r9
	setx	0xec7d050f0e949852, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800ea1e9f8, %r1, %r9
	setx	0x1bab6c3177ece82e, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f3a92ac, %r1, %r9
	setx	0xb939f94905b52ade, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c85bb5b7bb, %r1, %r9
	setx	0x7675a106962fdeb8, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d9032f6a0e, %r1, %r9
	setx	0x46a8e73a114956bd, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ec5b0de80a, %r1, %r9
	setx	0x7ead3f250890bb6c, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f90cb42f1a, %r1, %r9
	setx	0x7711eedd764e518d, %r1, %r10
	stb	%r10, [%r9]
	setx	0x00000010a0100000, %r1, %r9
	setx	0x7711eedd764e518d, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800e360690, %r1, %r9
	setx	0xe5f0d93953b0a6b9, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f8e0a4e, %r1, %r9
	setx	0x3184412ca860d573, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000ceba81d8f6, %r1, %r9
	setx	0x588ee4f24332e9c3, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d44f81c0ac, %r1, %r9
	setx	0x9d53afe15f2a8fac, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e67c35ab74, %r1, %r9
	setx	0xe4443ac562d5518c, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f326d355b2, %r1, %r9
	setx	0x1eaabeab5e521a01, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e8281e4, %r1, %r9
	setx	0xa6f9635625a98f17, %r1, %r10
	stw	%r10, [%r9]
	setx	0x00000010c0100000, %r1, %r9
	setx	0xa6f9635625a98f17, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f2d9eac, %r1, %r9
	setx	0xa4765d5c8fdeee1d, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000caf277b970, %r1, %r9
	setx	0x2097f8438b41bc24, %r1, %r10
	stw	%r10, [%r9]
	setx	0x0000001040100000, %r1, %r9
	setx	0x2097f8438b41bc24, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d44473046c, %r1, %r9
	setx	0x334b84cb6c977440, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000ee716fd92c, %r1, %r9
	setx	0xc934812d0ce0301c, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f01fcf6e04, %r1, %r9
	setx	0x859f1344fa827f19, %r1, %r10
	stw	%r10, [%r9]
	setx	0x0000001000100000, %r1, %r9
	setx	0x859f1344fa827f19, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800e4a8908, %r1, %r9
	setx	0x809d84e78c1c4e95, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f630868, %r1, %r9
	setx	0x2fd9244a5c11ef5a, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000cd53a5d058, %r1, %r9
	setx	0x0e21d5f4039bfd85, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000dee48cbb60, %r1, %r9
	setx	0x56525e7114765f37, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ea68776d28, %r1, %r9
	setx	0x9e27c03b0e304cb2, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000001060100000, %r1, %r9
	setx	0x9e27c03b0e304cb2, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f8a20297b0, %r1, %r9
	setx	0x7939a40458b46b84, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800e35fa64, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000808f957e09, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000f45b7ed74a, %r1, %r12
	ldub	[%r12], %r11
	setx	0x00000010f0100000, %r1, %r9
	setx	0x7939a40458b46b84, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f321b2f864, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d1e1c8463c, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000c2049b1010, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800f4995f8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800e5d9ba8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000fb4d2b2320, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800f8627e0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e407a48, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000f8a20297b0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000807f88ca98, %r1, %r9
	setx	0x6d7f4c2abcc3e77f, %r1, %r10
	stb	%r10, [%r9]
	setx	0x00000010a0100000, %r1, %r9
	setx	0x6d7f4c2abcc3e77f, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800e7ddda2, %r1, %r9
	setx	0xae43227d74a554e6, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f8e45c5, %r1, %r9
	setx	0x19746ea1dcb73efb, %r1, %r10
	stb	%r10, [%r9]
	setx	0x00000010f0100000, %r1, %r9
	setx	0x19746ea1dcb73efb, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000c8ddbb8065, %r1, %r9
	setx	0xe54b92847341ed24, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000da5a1b2276, %r1, %r9
	setx	0x2b2fec780a04841b, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000efbd6cce0a, %r1, %r9
	setx	0x0c3da83b4c1478a6, %r1, %r10
	stb	%r10, [%r9]
	setx	0x0000001060100000, %r1, %r9
	setx	0x0c3da83b4c1478a6, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000f81c70b22b, %r1, %r9
	setx	0x00e963955823525d, %r1, %r10
	stb	%r10, [%r9]
	setx	0x00000010f0100000, %r1, %r9
	setx	0x00e963955823525d, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800e88ee54, %r1, %r9
	setx	0xdfc51cdb1ccb46fc, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f6f101e, %r1, %r9
	setx	0x18f113577f45ebfe, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c15a0748c8, %r1, %r9
	setx	0x8a62041219748176, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d9f67c9e0c, %r1, %r9
	setx	0xce4297bec05af919, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000eebb060d84, %r1, %r9
	setx	0xb70529b64ffbb3e0, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f6f79b14ba, %r1, %r9
	setx	0xd19047adc5f5d5fe, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800eb61a88, %r1, %r9
	setx	0x081aa7088a6126d4, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f2e6290, %r1, %r9
	setx	0xbf59a46b4b406a3d, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c16f786228, %r1, %r9
	setx	0x3ea3d3daa8d210ee, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d521447ca0, %r1, %r9
	setx	0x987a4e4ba1f6e2ad, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e5c4c2df34, %r1, %r9
	setx	0x47cf47999d1fcc74, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f2b7741a74, %r1, %r9
	setx	0x62a34fb7012dc2ae, %r1, %r10
	stw	%r10, [%r9]
	setx	0x0000001030100000, %r1, %r9
	setx	0x62a34fb7012dc2ae, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800e29a6c0, %r1, %r9
	setx	0x956b5e574e1e3013, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800fa9a808, %r1, %r9
	setx	0x1a8d13d9aff8a2b7, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000cfd7136e48, %r1, %r9
	setx	0xf46fa0755ec2b1e4, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d4cd9e0610, %r1, %r9
	setx	0x19b53159cf3c4bfc, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ec61f53d40, %r1, %r9
	setx	0xa23ef35bf7382adf, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f8a20297b0, %r1, %r9
	setx	0x514abe14cf07f340, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e780a26d4c, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000d1b479a63d, %r1, %r12
	ldub	[%r12], %r11
	setx	0x0000001040100000, %r1, %r9
	setx	0x514abe14cf07f340, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000cc5dd86d8c, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800f65f560, %r1, %r12
	ldub	[%r12], %r11
	setx	0x0000001070100000, %r1, %r9
	setx	0x514abe14cf07f340, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800e810d1e, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000fd12327d92, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000e7fb980c16, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d5d42deb4c, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000c2938883d4, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800f6c97a0, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800e2638a4, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000fa8715c180, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000e348ad29cc, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000d65680c590, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000cb20eabc78, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000f8a20297b0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000ec952c8490, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000d578fc3cc0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000c85a998f50, %r1, %r12
	ldx	[%r12], %r11
	setx	0x00000080161e81e3, %r1, %r9
	setx	0x378722e2c854bfe3, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800ef461e8, %r1, %r9
	setx	0xc7021aea1533fb8d, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f30bc5d, %r1, %r9
	setx	0x5fc175af444d3cc4, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000cd8073fbc1, %r1, %r9
	setx	0x18f32b9e8cdd0e33, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000db294afa36, %r1, %r9
	setx	0xb4c2eced20ab6885, %r1, %r10
	stb	%r10, [%r9]
	setx	0x0000001070100000, %r1, %r9
	setx	0xb4c2eced20ab6885, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e323eb23a7, %r1, %r9
	setx	0xf91ae9e82ed57834, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f0b96b5fdb, %r1, %r9
	setx	0xcb6f399659d6ceb8, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e5b2d82, %r1, %r9
	setx	0x106a44123fcb02da, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800fecbc0c, %r1, %r9
	setx	0x63f694ad24739129, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c1c2b8b6d0, %r1, %r9
	setx	0xdc5e76ef749e2a8f, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d3d523bd58, %r1, %r9
	setx	0x292c1c8ea1ad7ffa, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e78a604d60, %r1, %r9
	setx	0xbcb508c5827d8b7b, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f9fec4dd74, %r1, %r9
	setx	0xc4c47499106afc4d, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e355f4c, %r1, %r9
	setx	0x0b2a641fdec6abf3, %r1, %r10
	stw	%r10, [%r9]
	setx	0x00000010c0100000, %r1, %r9
	setx	0x0b2a641fdec6abf3, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800fbe9830, %r1, %r9
	setx	0x8d55092146245195, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c845ba6000, %r1, %r9
	setx	0x1d519b71109bba9c, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000daa91dfa10, %r1, %r9
	setx	0xbae19b0ff6144886, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000eb86fc4888, %r1, %r9
	setx	0x202fdc2aaedeb362, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f73d210dd8, %r1, %r9
	setx	0x60a816dacaa9448c, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e1aada0, %r1, %r9
	setx	0xff937a4322c861ec, %r1, %r10
	stx	%r10, [%r9]
	setx	0x00000010b0100000, %r1, %r9
	setx	0xff937a4322c861ec, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800f0c9200, %r1, %r9
	setx	0xccbcdcfd29e5a07c, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000caaa023c78, %r1, %r9
	setx	0x35d9c481d03003ef, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d189c730a0, %r1, %r9
	setx	0x613ae8d91a8bdbde, %r1, %r10
	stx	%r10, [%r9]
	setx	0x00000010e0100000, %r1, %r9
	setx	0x613ae8d91a8bdbde, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e390cf33c8, %r1, %r9
	setx	0xd8a1c627e270ab9f, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f8a20297b0, %r1, %r9
	setx	0x7e3ef35f5795c8d8, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000001010100000, %r1, %r9
	setx	0x7e3ef35f5795c8d8, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800e6a45cc, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000f7ea99ba90, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000e7908e39d6, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000ddc19797a0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800fe37d50, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800e6f3a2c, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000d6c6c65678, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000c552cb7e50, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800f17e000, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800ee973b8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000f8a20297b0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000e8a176a218, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000d878285428, %r1, %r12
	ldx	[%r12], %r11
	setx	0x00000080983a147d, %r1, %r9
	setx	0xa123f0121521a214, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e6dcf64, %r1, %r9
	setx	0x15902aa8ea76163f, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800fd66cbd, %r1, %r9
	setx	0x5e3f2bd624252171, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000caefba4390, %r1, %r9
	setx	0x484e01661a24d1bb, %r1, %r10
	stb	%r10, [%r9]
	setx	0x0000001070100000, %r1, %r9
	setx	0x484e01661a24d1bb, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d610f5f7da, %r1, %r9
	setx	0x269e67bc63959397, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e7297be3bb, %r1, %r9
	setx	0x547a357b82768dbb, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f8609963a9, %r1, %r9
	setx	0x410d9e3f1ba14940, %r1, %r10
	stb	%r10, [%r9]
	setx	0x0000001020100000, %r1, %r9
	setx	0x410d9e3f1ba14940, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800e8793da, %r1, %r9
	setx	0x0b82341756287eaa, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800fae59b6, %r1, %r9
	setx	0x5576a10c75b53ddb, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c83f78227e, %r1, %r9
	setx	0xafea9af34a90ae1b, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000dea894308e, %r1, %r9
	setx	0xbf89e03e69283100, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000eeaebdb938, %r1, %r9
	setx	0x08ccbc004ef27db4, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000fe21d25d70, %r1, %r9
	setx	0x17129f9e09cf1630, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e327374, %r1, %r9
	setx	0xdd777d6e3fa1d9a2, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f4e5754, %r1, %r9
	setx	0x67693134644f10a0, %r1, %r10
	stw	%r10, [%r9]
	setx	0x00000010c0100000, %r1, %r9
	setx	0x67693134644f10a0, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000ce9f9b766c, %r1, %r9
	setx	0x41abfdec4062b0a0, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d8834b3a3c, %r1, %r9
	setx	0x1791f9b9bb66997f, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e6a5482830, %r1, %r9
	setx	0xd47472d93fd2dc8d, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f5c6045280, %r1, %r9
	setx	0x46b4266883694a60, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800ec5b978, %r1, %r9
	setx	0x3fce09e0260af1a6, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f74a530, %r1, %r9
	setx	0x23269328fe33a8fb, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c90c81f030, %r1, %r9
	setx	0x09b1fdd50f3e1994, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000db17f5e140, %r1, %r9
	setx	0x208df1f07f7d5c6d, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ebc6e74168, %r1, %r9
	setx	0xeeca9011a2688445, %r1, %r10
	stx	%r10, [%r9]
	setx	0x00000010a0100000, %r1, %r9
	setx	0xeeca9011a2688445, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f8a20297b0, %r1, %r9
	setx	0xc76f01e99be91bb4, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000802a093863, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800e6a81a8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800f8627e0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e407a48, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000f8a20297b0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000e1d73bdb88, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000dc4b875e78, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000cb2b4bdae0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800fa8a0b8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000802af70a32, %r1, %r9
	setx	0x1fbb351d9a2f7657, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e2b7367, %r1, %r9
	setx	0xbd50acff5039b28f, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f767d44, %r1, %r9
	setx	0x3963d362d5b7dd62, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c8683290a3, %r1, %r9
	setx	0x9af84b4ad647fb9a, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000dc6cdd1b1d, %r1, %r9
	setx	0xfc6f9d2900abe6f8, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e5d0c47139, %r1, %r9
	setx	0x88fe60c4bc7f35f7, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f93c81f206, %r1, %r9
	setx	0x825f0b683541b2b7, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e54d324, %r1, %r9
	setx	0x4702bbd2580aab11, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800fa63364, %r1, %r9
	setx	0xd5e7f3c0f2072cc1, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c48157e4f6, %r1, %r9
	setx	0xc1293e4f151399be, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d8b27eeb84, %r1, %r9
	setx	0xf9bef6700a886bf1, %r1, %r10
	sth	%r10, [%r9]
	setx	0x0000001050100000, %r1, %r9
	setx	0xf9bef6700a886bf1, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000ef5d7aaebc, %r1, %r9
	setx	0x4af0faf865d7c149, %r1, %r10
	sth	%r10, [%r9]
	setx	0x00000010d0100000, %r1, %r9
	setx	0x4af0faf865d7c149, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000fc8e92c73c, %r1, %r9
	setx	0x21b26a0cce76f125, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e50c4e8, %r1, %r9
	setx	0xe70762b70a35dc0a, %r1, %r10
	stw	%r10, [%r9]
	setx	0x0000001060100000, %r1, %r9
	setx	0xe70762b70a35dc0a, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800f7e1378, %r1, %r9
	setx	0x3b517d9a6d383657, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c8abccde3c, %r1, %r9
	setx	0xdf34acf91b780a9b, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000da55e9d508, %r1, %r9
	setx	0x695c6308d13d7056, %r1, %r10
	stw	%r10, [%r9]
	setx	0x0000001040100000, %r1, %r9
	setx	0x695c6308d13d7056, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e6e4ea5664, %r1, %r9
	setx	0x97cdfd94ab9d764d, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f7537e3d14, %r1, %r9
	setx	0x428251b28e331082, %r1, %r10
	stw	%r10, [%r9]
	setx	0x0000001050100000, %r1, %r9
	setx	0x428251b28e331082, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800e732530, %r1, %r9
	setx	0x3710d80760978777, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000001050100000, %r1, %r9
	setx	0x3710d80760978777, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f10a8e8, %r1, %r9
	setx	0xa9405fda3a251760, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c918b9edb0, %r1, %r9
	setx	0x3b376075fbbc357b, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d214f940b0, %r1, %r9
	setx	0xe8114403b5a0713a, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e18383b590, %r1, %r9
	setx	0x22c39135079d453f, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f8a20297b0, %r1, %r9
	setx	0xb2d3b5ce67f350fa, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d2ac377c78, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000c14af46e90, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800f7c1800, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800eb24b6e, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000f7ba33e2d4, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000ea6f7355ec, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000dd89e7aed0, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000c989a83fb0, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800f800080, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800ed22bc8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000fd0a5d42e4, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000e2377a4df0, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000db8dc15b3c, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000cc97191570, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800f84b520, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e4957d0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000f8a20297b0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000eaafacc5f8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x00000080dde046f7, %r1, %r9
	setx	0x7a0ac3b12f60acab, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e57600b, %r1, %r9
	setx	0x09ccfb2a250ce68a, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f872efd, %r1, %r9
	setx	0x72fad7fc7cd82e2b, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c4aeac0a34, %r1, %r9
	setx	0x78057cbbe2a737db, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000dc63dfc26c, %r1, %r9
	setx	0x672a8937724fc9fb, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ef3ea96630, %r1, %r9
	setx	0xd8efb133f8960430, %r1, %r10
	stb	%r10, [%r9]
	setx	0x0000001000100000, %r1, %r9
	setx	0xd8efb133f8960430, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000f9e93edbe5, %r1, %r9
	setx	0x6fd42c2c911fddbd, %r1, %r10
	stb	%r10, [%r9]
	setx	0x00000010a0100000, %r1, %r9
	setx	0x6fd42c2c911fddbd, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800e8c7348, %r1, %r9
	setx	0x4702e97f93b491f1, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f32fada, %r1, %r9
	setx	0xdb3bffaab4fe8d96, %r1, %r10
	sth	%r10, [%r9]
	setx	0x0000001050100000, %r1, %r9
	setx	0xdb3bffaab4fe8d96, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000c675501a2c, %r1, %r9
	setx	0x8e096273b2bf1e82, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d017c9e650, %r1, %r9
	setx	0x0f28c4f928bb6cd3, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000ec7d3cd05c, %r1, %r9
	setx	0x2613c84d635c54e4, %r1, %r10
	sth	%r10, [%r9]
	setx	0x00000010f0100000, %r1, %r9
	setx	0x2613c84d635c54e4, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f8a68e514e, %r1, %r9
	setx	0x53d1ce41081b04ff, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e416348, %r1, %r9
	setx	0x081d88ac4d2e8413, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800fda02a8, %r1, %r9
	setx	0xc420b4ec356efbdf, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c82da09004, %r1, %r9
	setx	0x33b008b81180800f, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d04369f2b8, %r1, %r9
	setx	0x31c9180c04b3d523, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e5fe0ada74, %r1, %r9
	setx	0x6275f6342d38ef62, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000fe67c065dc, %r1, %r9
	setx	0x6433a55437fea4d3, %r1, %r10
	stw	%r10, [%r9]
	setx	0x00000010d0100000, %r1, %r9
	setx	0x6433a55437fea4d3, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800e0a1ef8, %r1, %r9
	setx	0x42ec6529bc6054d3, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f8acc70, %r1, %r9
	setx	0x9da8881ec0874cd0, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000001070100000, %r1, %r9
	setx	0x9da8881ec0874cd0, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000c9f08e6da8, %r1, %r9
	setx	0x8cf2d4889f071dc7, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000001070100000, %r1, %r9
	setx	0x8cf2d4889f071dc7, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d8592494f8, %r1, %r9
	setx	0x18105af0ca3bcdde, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e10eccd5c0, %r1, %r9
	setx	0x65dc7caa7ca84e92, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f8a20297b0, %r1, %r9
	setx	0xe84e012ba1d6e152, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000fb21feb7fc, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000efb5d7b368, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d7843d4a76, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000cbad195bc0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800f9ef720, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e6de4a6, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000f5c6045280, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000e6a5482830, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000d8834b3a3c, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000ce9f9b766c, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800f4e5754, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800e327374, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800e5614a8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000f8a20297b0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000e859b58328, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000d9e09707a0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000c46cdbc108, %r1, %r12
	ldx	[%r12], %r11
	setx	0x00000080a1fea4ae, %r1, %r9
	setx	0x5aa8d1ab4f31b233, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e9eb365, %r1, %r9
	setx	0xd1382b4fd14b4f64, %r1, %r10
	stb	%r10, [%r9]
	setx	0x0000001060100000, %r1, %r9
	setx	0xd1382b4fd14b4f64, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800f690e91, %r1, %r9
	setx	0xaa55e9d1331513a0, %r1, %r10
	stb	%r10, [%r9]
	setx	0x0000001000100000, %r1, %r9
	setx	0xaa55e9d1331513a0, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000c3f5b59f7c, %r1, %r9
	setx	0x325e7f5f363fb923, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000dd06704e53, %r1, %r9
	setx	0xf84c188a0be11f05, %r1, %r10
	stb	%r10, [%r9]
	setx	0x0000001020100000, %r1, %r9
	setx	0xf84c188a0be11f05, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000ebf32abdd9, %r1, %r9
	setx	0x1899f39f6dd8a5cd, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f151ba59df, %r1, %r9
	setx	0x3b72d8d981275be0, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e83b338, %r1, %r9
	setx	0xf25e1289df2495a4, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f1d0ee6, %r1, %r9
	setx	0x73ea8932a1f0eb3f, %r1, %r10
	sth	%r10, [%r9]
	setx	0x0000001040100000, %r1, %r9
	setx	0x73ea8932a1f0eb3f, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000c02420e6da, %r1, %r9
	setx	0xfab588d081f54d08, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d24d692cf0, %r1, %r9
	setx	0x6a8ee8fcae6ef78b, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e6064ad5a8, %r1, %r9
	setx	0x3ec212a66822b761, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f89eb7d40c, %r1, %r9
	setx	0xe4eee9288d411964, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e6ccdf8, %r1, %r9
	setx	0x3fcf2032f0ec7044, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f15916c, %r1, %r9
	setx	0xcedf03113a8114d2, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c87a4196f4, %r1, %r9
	setx	0xd6e13117242267c9, %r1, %r10
	stw	%r10, [%r9]
	setx	0x0000001000100000, %r1, %r9
	setx	0xd6e13117242267c9, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d769dfc998, %r1, %r9
	setx	0x4b951e622b313e84, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e8418115f4, %r1, %r9
	setx	0x44725a8c4cd82a4e, %r1, %r10
	stw	%r10, [%r9]
	setx	0x0000001040100000, %r1, %r9
	setx	0x44725a8c4cd82a4e, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000fcb74a8894, %r1, %r9
	setx	0x3f0b3677d1f870b0, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800ebb9688, %r1, %r9
	setx	0xa64f7909fe8b479a, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000001030100000, %r1, %r9
	setx	0xa64f7909fe8b479a, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f990528, %r1, %r9
	setx	0x1b664daf090f45aa, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000cd237543e0, %r1, %r9
	setx	0xf64d312f8198e251, %r1, %r10
	stx	%r10, [%r9]
	setx	0x00000010b0100000, %r1, %r9
	setx	0xf64d312f8198e251, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d90638bf60, %r1, %r9
	setx	0xe374adaae6662f7c, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e0e56c2490, %r1, %r9
	setx	0xc80fa63f4109e2da, %r1, %r10
	stx	%r10, [%r9]
	setx	0x00000010d0100000, %r1, %r9
	setx	0xc80fa63f4109e2da, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f8a20297b0, %r1, %r9
	setx	0x850d27454b3b821f, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000001040100000, %r1, %r9
	setx	0x850d27454b3b821f, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800e485932, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000808252365d, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000f0d12b6ca2, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000ed5212be06, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000dc02e717ba, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800fd43f08, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800e536edc, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000f98aaffefc, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800eac4728, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000f8a20297b0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000801ea1f178, %r1, %r9
	setx	0xc041c97417364d4c, %r1, %r10
	stb	%r10, [%r9]
	setx	0x0000001010100000, %r1, %r9
	setx	0xc041c97417364d4c, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800e1edcdf, %r1, %r9
	setx	0x2a36e7025c98a253, %r1, %r10
	stb	%r10, [%r9]
	setx	0x00000010c0100000, %r1, %r9
	setx	0x2a36e7025c98a253, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800fbc9060, %r1, %r9
	setx	0x5927e6ac8fe7c6fe, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000cd48db9fc7, %r1, %r9
	setx	0x3ea2bffe3606f2c4, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d572829cd6, %r1, %r9
	setx	0x1323eaddf502a414, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e03b78c71c, %r1, %r9
	setx	0x58f34c35edac0a23, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f6de3b0c93, %r1, %r9
	setx	0xd558cef22207b4c4, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e20bc92, %r1, %r9
	setx	0x9a102d7ff74f7e79, %r1, %r10
	sth	%r10, [%r9]
	setx	0x00000010c0100000, %r1, %r9
	setx	0x9a102d7ff74f7e79, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800fc2cab2, %r1, %r9
	setx	0x516b5ff24a3c944e, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c4166edd18, %r1, %r9
	setx	0x6b7acf013ee25158, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d34b7a8250, %r1, %r9
	setx	0x51818b7aa43ef621, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e157e3629c, %r1, %r9
	setx	0xb5de445b7643b265, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f3734dad88, %r1, %r9
	setx	0xa995cc0d8f6c9a2d, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e2939e8, %r1, %r9
	setx	0x3126abd9b00598ae, %r1, %r10
	stw	%r10, [%r9]
	setx	0x0000001020100000, %r1, %r9
	setx	0x3126abd9b00598ae, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800f3e18d4, %r1, %r9
	setx	0x8c8b84723aea988d, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c9d55c6edc, %r1, %r9
	setx	0x1cfa64a249658532, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d747dcbec0, %r1, %r9
	setx	0xdc97a01830215652, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000ee974c6cc0, %r1, %r9
	setx	0x744ce66d28f64660, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000fa45b375e8, %r1, %r9
	setx	0x1a389e26d4b2ff8b, %r1, %r10
	stw	%r10, [%r9]
	setx	0x00000010e0100000, %r1, %r9
	setx	0x1a389e26d4b2ff8b, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800e07cdd0, %r1, %r9
	setx	0xfda2817d07a4d41c, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800fbe1910, %r1, %r9
	setx	0x640e5a90cb658bba, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ca85f195a0, %r1, %r9
	setx	0xb3d40b0ace6cb6f8, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000001010100000, %r1, %r9
	setx	0xb3d40b0ace6cb6f8, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000dc2e6e85d8, %r1, %r9
	setx	0xc074b74d59db9fb9, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e436656408, %r1, %r9
	setx	0xddc7b83f25282b6d, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f8a20297b0, %r1, %r9
	setx	0xb109923b8ac9405d, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000001090100000, %r1, %r9
	setx	0xb109923b8ac9405d, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e6eb43c0c5, %r1, %r12
	ldub	[%r12], %r11
	setx	0x0000001010100000, %r1, %r9
	setx	0xb109923b8ac9405d, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000d8acab4a0d, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800fae59b6, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e8793da, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d19a02d23c, %r1, %r12
	lduw	[%r12], %r11
	setx	0x00000080e6577df0, %r1, %r9
	setx	0x60ede71b7779446d, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800ee217d0, %r1, %r9
	setx	0xc05cde4421c0392c, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800fb61875, %r1, %r9
	setx	0x3c456c71aab9e097, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000cd91d55eb9, %r1, %r9
	setx	0xee86b9554c5959cb, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d7362ae17d, %r1, %r9
	setx	0x0ff858ae285f4a86, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e4663a870a, %r1, %r9
	setx	0x8ee165c0dd5f11f4, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f7ea1a11c1, %r1, %r9
	setx	0x053532013b957b8e, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e0f41a6, %r1, %r9
	setx	0xf938609d954d982b, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f9d4b42, %r1, %r9
	setx	0x91e9390e7d0f2170, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c51f6a7f36, %r1, %r9
	setx	0xa9b71d1a1ac04629, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d6ee69370a, %r1, %r9
	setx	0xef8f248e603108d2, %r1, %r10
	sth	%r10, [%r9]
	setx	0x0000001040100000, %r1, %r9
	setx	0xef8f248e603108d2, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000e24a94e9c6, %r1, %r9
	setx	0x37020ec0ab96000a, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000faa0873988, %r1, %r9
	setx	0xec1777188ee6bbff, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e7ca278, %r1, %r9
	setx	0x17cb5c5f4f2a5492, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800fa4d164, %r1, %r9
	setx	0xdc3c1a637f30d076, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000cd338e271c, %r1, %r9
	setx	0xc97b7939374253df, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d6fb8eca18, %r1, %r9
	setx	0xdbdde769a3109c19, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e5b5a877d4, %r1, %r9
	setx	0x7ff5a1ab1f979a91, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f61ec73d98, %r1, %r9
	setx	0xbbc1dd540391e2ff, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800ef49f78, %r1, %r9
	setx	0x814e1a2342935e43, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f9eb010, %r1, %r9
	setx	0xe63f038794de3a5b, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000cc9e773238, %r1, %r9
	setx	0xdcb43d6e4f67a4de, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000001020100000, %r1, %r9
	setx	0xdcb43d6e4f67a4de, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000d33b321818, %r1, %r9
	setx	0x0e6b0bc2b2c85916, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e190b1db78, %r1, %r9
	setx	0x0880e681b3649c24, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f8a20297b0, %r1, %r9
	setx	0x994e409a438d1cb5, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f3c371edac, %r1, %r12
	ldub	[%r12], %r11
	setx	0x00000010b0100000, %r1, %r9
	setx	0x994e409a438d1cb5, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000e29becf5a3, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000dad044efc2, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000c1b00582c8, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000f1b711abf0, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000e706300ae0, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000d38fe2ff50, %r1, %r12
	lduw	[%r12], %r11
	setx	0x0000008059d10455, %r1, %r9
	setx	0x013fb6cd43006a95, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800ea92d9e, %r1, %r9
	setx	0xc3d4b11f21bcbc2d, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f0e5104, %r1, %r9
	setx	0xe2035155d44e2159, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000cce4be8402, %r1, %r9
	setx	0x23fe00f92dabbe85, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000dfd9d6f2fc, %r1, %r9
	setx	0x7545d0c084dfab09, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ebfc201728, %r1, %r9
	setx	0x2a2bfd1f36796167, %r1, %r10
	stb	%r10, [%r9]
	setx	0x0000001030100000, %r1, %r9
	setx	0x2a2bfd1f36796167, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000f19d175d6a, %r1, %r9
	setx	0xb13459fe2d3e0d66, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e9eb9c8, %r1, %r9
	setx	0x152d0900074f8e3f, %r1, %r10
	sth	%r10, [%r9]
	setx	0x0000001090100000, %r1, %r9
	setx	0x152d0900074f8e3f, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800faed504, %r1, %r9
	setx	0x4cb81827d6e897a8, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000cda3b75ee8, %r1, %r9
	setx	0x46f4f8a4a356b501, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000dfb4765adc, %r1, %r9
	setx	0x2d2a4d17f445bc69, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e736c2a26a, %r1, %r9
	setx	0x7423f3867a281d05, %r1, %r10
	sth	%r10, [%r9]
	setx	0x0000001060100000, %r1, %r9
	setx	0x7423f3867a281d05, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000f98cde0186, %r1, %r9
	setx	0x99c4d9cd464c024b, %r1, %r10
	sth	%r10, [%r9]
	setx	0x00000010d0100000, %r1, %r9
	setx	0x99c4d9cd464c024b, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800e51e630, %r1, %r9
	setx	0x0322907c45e60c09, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800faccf74, %r1, %r9
	setx	0xa228370c00d194c3, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000cb9de9a774, %r1, %r9
	setx	0xead6393c51e57d87, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000de28d32f7c, %r1, %r9
	setx	0xd7bff3242eddef68, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000eec6d193a4, %r1, %r9
	setx	0x5503937e302ec549, %r1, %r10
	stw	%r10, [%r9]
	setx	0x00000010c0100000, %r1, %r9
	setx	0x5503937e302ec549, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000fadb96520c, %r1, %r9
	setx	0x238da84699d4625d, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800edd76b8, %r1, %r9
	setx	0x70e0004a4c8a7591, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f5a4618, %r1, %r9
	setx	0x082fa91a818ccb25, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ce80d7cb50, %r1, %r9
	setx	0xed3d9c8914efe9f2, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d2cf303828, %r1, %r9
	setx	0xc09d0113373fae81, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e3bffed200, %r1, %r9
	setx	0xd32dd2160b2f8194, %r1, %r10
	stx	%r10, [%r9]
	setx	0x00000010f0100000, %r1, %r9
	setx	0xd32dd2160b2f8194, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f8a20297b0, %r1, %r9
	setx	0x21e931c3374483fe, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000008019c6188e, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000fd9a434711, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000ef7c43f8b2, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000d832f64480, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000ccbdf1606d, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800f7af6ea, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800e201c42, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800fbdc10c, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000e3a3400460, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000dc874e77b0, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000c08a2460e4, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800f293fec, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800e6b83d8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000f8a20297b0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000eff4b66238, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000d5c342d5f0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000cae2291e60, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800ff24b20, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000807442f507, %r1, %r9
	setx	0x9c8d0b6f958a48c6, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e416247, %r1, %r9
	setx	0xacf1e2cc9354b257, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f7d9a61, %r1, %r9
	setx	0xb4497f57c2eff0f9, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c6e280ba08, %r1, %r9
	setx	0x913439648ae695e1, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d60c327c08, %r1, %r9
	setx	0x696e932c3502da0d, %r1, %r10
	stb	%r10, [%r9]
	setx	0x00000010e0100000, %r1, %r9
	setx	0x696e932c3502da0d, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000eee035ba9e, %r1, %r9
	setx	0x5900d9b565f2c9db, %r1, %r10
	stb	%r10, [%r9]
	setx	0x0000001000100000, %r1, %r9
	setx	0x5900d9b565f2c9db, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000fb5c866807, %r1, %r9
	setx	0x4c2f73a0a88d079f, %r1, %r10
	stb	%r10, [%r9]
	setx	0x00000010e0100000, %r1, %r9
	setx	0x4c2f73a0a88d079f, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800ea457c0, %r1, %r9
	setx	0x624128fc532b9611, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f0a7012, %r1, %r9
	setx	0x75ac2721629fe1cd, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c4009e1c50, %r1, %r9
	setx	0x41449f3db54de76a, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000dbfcf2f8ee, %r1, %r9
	setx	0x83cee3608d22bca7, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e847bce0de, %r1, %r9
	setx	0x409bcbeb88bfca84, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000fc9d1aac64, %r1, %r9
	setx	0x8bc28c8ec26e7734, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e5fff2c, %r1, %r9
	setx	0x8e4b3fe6a651ca8f, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f0b617c, %r1, %r9
	setx	0x5c30937605be92ea, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000cb59b353ec, %r1, %r9
	setx	0xa9fde2ec458aa2a3, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d412e14160, %r1, %r9
	setx	0xe8a38577d5eae080, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e50e0c6428, %r1, %r9
	setx	0x79b53aa63db47fcb, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f82657c3f0, %r1, %r9
	setx	0x3f19f4d13154dd35, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e9a6b08, %r1, %r9
	setx	0x4675b43b30f67fce, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f393e60, %r1, %r9
	setx	0x00da30d86ac2fe4c, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c041b5bce8, %r1, %r9
	setx	0x2c5128e0357fb940, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000de924c0000, %r1, %r9
	setx	0x2fd0977d9f9ca22b, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000eb906ed578, %r1, %r9
	setx	0x7ab7c96de2e3140e, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000001040100000, %r1, %r9
	setx	0x7ab7c96de2e3140e, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f8a20297b0, %r1, %r9
	setx	0xa3e3b08f5ee38ccd, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000cd97776bbd, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800f1d358e, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800e4c5bac, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800f8181fa, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e6a81a8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000f3f7f98ad2, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000e7d567cf50, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000e6e4ea5664, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000da55e9d508, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000c8abccde3c, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800f7e1378, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000f8a20297b0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000eb762dc7a8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000d336797320, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000c90ebca540, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800fcd8980, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e54fb50, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000f8a20297b0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x00000080dadcf3b9, %r1, %r9
	setx	0xd42cb7d73a0083b0, %r1, %r10
	stb	%r10, [%r9]
	setx	0x00000010e0100000, %r1, %r9
	setx	0xd42cb7d73a0083b0, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800e79403b, %r1, %r9
	setx	0x4b2ae2c3b4579d55, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800fed74cd, %r1, %r9
	setx	0x8f88540d518fb679, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000cda57f35b8, %r1, %r9
	setx	0xcf3584eeea68f859, %r1, %r10
	stb	%r10, [%r9]
	setx	0x00000010f0100000, %r1, %r9
	setx	0xcf3584eeea68f859, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000dc383f8e8d, %r1, %r9
	setx	0x3411060a764d6358, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000eb9a353105, %r1, %r9
	setx	0x15ccec204ace948d, %r1, %r10
	stb	%r10, [%r9]
	setx	0x00000010e0100000, %r1, %r9
	setx	0x15ccec204ace948d, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000f6fad8967e, %r1, %r9
	setx	0x1d76913851fff732, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800ebd5d98, %r1, %r9
	setx	0xfdd077d92f2d8756, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f652b0c, %r1, %r9
	setx	0x420e3cfe8115e1ec, %r1, %r10
	sth	%r10, [%r9]
	setx	0x0000001070100000, %r1, %r9
	setx	0x420e3cfe8115e1ec, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000cf84e59006, %r1, %r9
	setx	0x65f52ae870b41dd5, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000dbf4cbaca4, %r1, %r9
	setx	0x24a7494fbefc0f13, %r1, %r10
	sth	%r10, [%r9]
	setx	0x0000001020100000, %r1, %r9
	setx	0x24a7494fbefc0f13, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000e1e04174ce, %r1, %r9
	setx	0x6da4cda8942a3687, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f1c6da4524, %r1, %r9
	setx	0x3cb04e29634682e7, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e1bade4, %r1, %r9
	setx	0x45d625e366f5bd5b, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f07475c, %r1, %r9
	setx	0x4458246089587641, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c3cc324730, %r1, %r9
	setx	0x510c4273e1483577, %r1, %r10
	stw	%r10, [%r9]
	setx	0x00000010a0100000, %r1, %r9
	setx	0x510c4273e1483577, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000dfb552e818, %r1, %r9
	setx	0xc78fb552b5920ae5, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e5b70dbe9c, %r1, %r9
	setx	0x3ca369caabcc01a1, %r1, %r10
	stw	%r10, [%r9]
	setx	0x0000001070100000, %r1, %r9
	setx	0x3ca369caabcc01a1, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000f7480b1030, %r1, %r9
	setx	0x7486ced6c2faec63, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800eca7870, %r1, %r9
	setx	0x97ea5b664e5c8e40, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800faf8268, %r1, %r9
	setx	0xbe77a03b84256182, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c74c8e7490, %r1, %r9
	setx	0xcbf38a02b4317ca8, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000001060100000, %r1, %r9
	setx	0xcbf38a02b4317ca8, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000d790d59220, %r1, %r9
	setx	0xf27188ef01b3be24, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e5a5673bb8, %r1, %r9
	setx	0x3d4541562fb2971e, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000001020100000, %r1, %r9
	setx	0x3d4541562fb2971e, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000f8a20297b0, %r1, %r9
	setx	0x82aac69dd6f4714e, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000feb4a1d0a2, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000e156881953, %r1, %r12
	ldub	[%r12], %r11
	setx	0x0000001010100000, %r1, %r9
	setx	0x82aac69dd6f4714e, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ddeef45879, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000c13ac36d54, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800e25be3e, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000c08a2460e4, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800f293fec, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800e6b83d8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000f9486e0e24, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000e056f766c8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000d1e1c8463c, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000c2049b1010, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800f630868, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e4a8908, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000f8a20297b0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000e37565f7e8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x00000080dd1384c4, %r1, %r9
	setx	0x100624234f1a59dd, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800eed2b98, %r1, %r9
	setx	0x7271a32d060c3384, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f589ad0, %r1, %r9
	setx	0x46c74b2872d033bc, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000cc1363ce09, %r1, %r9
	setx	0x4a4f8bd3cb7bb7f6, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d4a35e001a, %r1, %r9
	setx	0x4dcb6056e8e146ce, %r1, %r10
	stb	%r10, [%r9]
	setx	0x00000010e0100000, %r1, %r9
	setx	0x4dcb6056e8e146ce, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e0d29431eb, %r1, %r9
	setx	0x03450f92539b4292, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f5070f9823, %r1, %r9
	setx	0x94339b38b9a4cbcc, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e182386, %r1, %r9
	setx	0x570bd211a782eddf, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f441d2a, %r1, %r9
	setx	0xdf64f3feacf7be07, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c607b4c480, %r1, %r9
	setx	0xbbe7e138fe372c96, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d3c3d10a20, %r1, %r9
	setx	0x07d0fb1baab71778, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e27bdbf070, %r1, %r9
	setx	0x1df805a2b21c6c02, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f53e1d403a, %r1, %r9
	setx	0x35a1958502c56468, %r1, %r10
	sth	%r10, [%r9]
	setx	0x00000010b0100000, %r1, %r9
	setx	0x35a1958502c56468, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800e8c6da0, %r1, %r9
	setx	0xf9cb0fb341854523, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f939114, %r1, %r9
	setx	0xe3af2c42d473dab4, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000cd4400f7e8, %r1, %r9
	setx	0xcd97022cc94566d8, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000de2cb71fb4, %r1, %r9
	setx	0x3520e8144ee9d781, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000eecea20fb8, %r1, %r9
	setx	0xae3f39c6285082be, %r1, %r10
	stw	%r10, [%r9]
	setx	0x0000001070100000, %r1, %r9
	setx	0xae3f39c6285082be, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000f6d94ae700, %r1, %r9
	setx	0xc7cb34ed96ac6778, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e98a8e8, %r1, %r9
	setx	0x74774aa7ab8175ef, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000001080100000, %r1, %r9
	setx	0x74774aa7ab8175ef, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800fcb5310, %r1, %r9
	setx	0x53dc460354bbb4ee, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000cd1d51eb30, %r1, %r9
	setx	0x0e03baa0e658de7c, %r1, %r10
	stx	%r10, [%r9]
	setx	0x00000010e0100000, %r1, %r9
	setx	0x0e03baa0e658de7c, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000d72a0a8b70, %r1, %r9
	setx	0xa2ce32f38efd0d08, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000eb3c47d578, %r1, %r9
	setx	0x6336316a6ed5fddc, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f8a20297b0, %r1, %r9
	setx	0x05b0cc6ca6c2875d, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f4fe265, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800e79067f, %r1, %r12
	ldub	[%r12], %r11
	setx	0x00000080d00fd4e0, %r1, %r12
	ldub	[%r12], %r11
	setx	0x0000001010100000, %r1, %r9
	setx	0x05b0cc6ca6c2875d, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f89eb7d40c, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000e6064ad5a8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d24d692cf0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000c02420e6da, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800f1d0ee6, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e83b338, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800eedaca0, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000fe7d02df4c, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000e620b88830, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000d9b0c090dc, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800fdefb40, %r1, %r12
	ldx	[%r12], %r11
	setx	0x00000080c2e3c473, %r1, %r9
	setx	0x04c0ae399a0ed528, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800ef1ec5d, %r1, %r9
	setx	0x78c62ad124f97f55, %r1, %r10
	stb	%r10, [%r9]
	setx	0x0000001060100000, %r1, %r9
	setx	0x78c62ad124f97f55, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f7d3db0, %r1, %r9
	setx	0x708654c3c1483cae, %r1, %r10
	stb	%r10, [%r9]
	setx	0x00000010f0100000, %r1, %r9
	setx	0x708654c3c1483cae, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000cbb2b2a022, %r1, %r9
	setx	0x8d145fd2661c748d, %r1, %r10
	stb	%r10, [%r9]
	setx	0x0000001050100000, %r1, %r9
	setx	0x8d145fd2661c748d, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000dcd0c66133, %r1, %r9
	setx	0x70d0d7b65151e8b0, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e8f8923ff2, %r1, %r9
	setx	0x5a668e6469731869, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000fc0e42ead6, %r1, %r9
	setx	0x0cbfca4be022b1fb, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e75de7e, %r1, %r9
	setx	0x4cda47eb8283f38d, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f82f0cc, %r1, %r9
	setx	0xeac2aed38e68a257, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000cfa6a5091a, %r1, %r9
	setx	0xb19863cc2e40568d, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d9129cdf56, %r1, %r9
	setx	0x2087b2eaee3784d2, %r1, %r10
	sth	%r10, [%r9]
	setx	0x0000001020100000, %r1, %r9
	setx	0x2087b2eaee3784d2, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000edb51d2576, %r1, %r9
	setx	0xcb0a7857956bdef3, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f0c1a4b928, %r1, %r9
	setx	0x95d26fa511f6b2b4, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e1f7ec8, %r1, %r9
	setx	0x36f48a036c5aa712, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f0b4c30, %r1, %r9
	setx	0x0fb92fe826b0ba94, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000cf865112f0, %r1, %r9
	setx	0x6b4fae067708ffb2, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000de11834a94, %r1, %r9
	setx	0x1a8c443b514cb83c, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000ef08f59990, %r1, %r9
	setx	0xef5292191d705046, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000fd8571181c, %r1, %r9
	setx	0x45775d4210f38972, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800ef36198, %r1, %r9
	setx	0xdbc46c5832ee6514, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f9dc0b0, %r1, %r9
	setx	0x5af9a07eabd2aee2, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000001030100000, %r1, %r9
	setx	0x5af9a07eabd2aee2, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000ca0ac986d0, %r1, %r9
	setx	0x6d5b4f8878ced3c3, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000001070100000, %r1, %r9
	setx	0x6d5b4f8878ced3c3, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d5b8aa9088, %r1, %r9
	setx	0xca1638f09088df89, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e1f11d2750, %r1, %r9
	setx	0x42b17fb34cf7ce13, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f8a20297b0, %r1, %r9
	setx	0xe9d25b92434d120a, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000001010100000, %r1, %r9
	setx	0xe9d25b92434d120a, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000c03fe74305, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000fb2f2cc560, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000ec41b4779a, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d5116a5e10, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000cf82fcbd82, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800fb4d1d8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e0cade6, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000f445abe86a, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e2638a4, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800fe7ff70, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800eee3068, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000f8a20297b0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x00000080d6409673, %r1, %r9
	setx	0x99f8226feb168f60, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e878e6e, %r1, %r9
	setx	0x40e8d3b88d055632, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f60fd00, %r1, %r9
	setx	0xda69dac732be1978, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000cf2716a99d, %r1, %r9
	setx	0x009a5c04e787eb2b, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000dd81a71282, %r1, %r9
	setx	0x62fbf667fe917817, %r1, %r10
	stb	%r10, [%r9]
	setx	0x0000001040100000, %r1, %r9
	setx	0x62fbf667fe917817, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ebcb8c42d3, %r1, %r9
	setx	0x3ee40a0365d6bf5c, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000fd433de512, %r1, %r9
	setx	0xd79ec257e83178c4, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e4224da, %r1, %r9
	setx	0xea5c469d4e6f0b36, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800fa4638a, %r1, %r9
	setx	0x7017515667889fb2, %r1, %r10
	sth	%r10, [%r9]
	setx	0x0000001010100000, %r1, %r9
	setx	0x7017515667889fb2, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000cb6676f51a, %r1, %r9
	setx	0x79c8df4b3b166acd, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d5523483a4, %r1, %r9
	setx	0x9e86ff745277ed37, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e5d0c1ba88, %r1, %r9
	setx	0xf43f97d0cb510953, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000fa783422e4, %r1, %r9
	setx	0xacd3eea0385ebf6c, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e9071dc, %r1, %r9
	setx	0xed02787c1934748e, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800ff21dc4, %r1, %r9
	setx	0x9bd1ab7f0f74e790, %r1, %r10
	stw	%r10, [%r9]
	setx	0x00000010e0100000, %r1, %r9
	setx	0x9bd1ab7f0f74e790, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c08ffd2da8, %r1, %r9
	setx	0xe0936b8809989611, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d9804c952c, %r1, %r9
	setx	0x5c249b52d9b3f8de, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e1df5f69f4, %r1, %r9
	setx	0x9b0ed1e8cf428982, %r1, %r10
	stw	%r10, [%r9]
	setx	0x0000001010100000, %r1, %r9
	setx	0x9b0ed1e8cf428982, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000fe7f85c434, %r1, %r9
	setx	0xa625366ad41c1654, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e6e37e0, %r1, %r9
	setx	0x9ab7f66638c8c882, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800fd74138, %r1, %r9
	setx	0xfbc06720008baaa9, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000cf0e453190, %r1, %r9
	setx	0x8bcab9a7933642a8, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000001040100000, %r1, %r9
	setx	0x8bcab9a7933642a8, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000d446df9638, %r1, %r9
	setx	0x8b9e3bbfb3f5ecb3, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e6d9bf0f58, %r1, %r9
	setx	0x0815313a439c00eb, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f8a20297b0, %r1, %r9
	setx	0xcf5ca5668d248305, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f0eec60311, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000e6d4c89dd8, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000dbc8ffa7cc, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800e1c0226, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000f6f0e09ef6, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000e33c6599f0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000def3b1582a, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800f136f84, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800e441e78, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000fe00708d58, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000e616438f08, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000d84a40652c, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000c2d5aa6a00, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800f4072b8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800ec444d0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000f8a20297b0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000e94fc3b738, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000da1ee69630, %r1, %r12
	ldx	[%r12], %r11
	setx	0x0000008020ce5665, %r1, %r9
	setx	0x170c124521a006bc, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800ef110da, %r1, %r9
	setx	0x394a952e25a81a7d, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800ffe61c3, %r1, %r9
	setx	0x00efb48f96e19558, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c2872b7ae4, %r1, %r9
	setx	0x7b0affcdb9c89da1, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d1669bb190, %r1, %r9
	setx	0x578306a4eea9b351, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000eb4f3622d8, %r1, %r9
	setx	0xbab89c43e05d4ad2, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000fe2dc49c8f, %r1, %r9
	setx	0xf4b6076165efaabb, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e8cd6ce, %r1, %r9
	setx	0xdec851371284520d, %r1, %r10
	sth	%r10, [%r9]
	setx	0x0000001060100000, %r1, %r9
	setx	0xdec851371284520d, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f8b8cf4, %r1, %r9
	setx	0x38914cb54ed7b21e, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c813cf5af0, %r1, %r9
	setx	0x7b7c992cd1b0f41e, %r1, %r10
	sth	%r10, [%r9]
	setx	0x00000010a0100000, %r1, %r9
	setx	0x7b7c992cd1b0f41e, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000db4450717c, %r1, %r9
	setx	0xfb67c80c46f595de, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000ef5044bae4, %r1, %r9
	setx	0x4198f5844a9d22de, %r1, %r10
	sth	%r10, [%r9]
	setx	0x0000001070100000, %r1, %r9
	setx	0x4198f5844a9d22de, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f3aa391dee, %r1, %r9
	setx	0x2323846a54645d6f, %r1, %r10
	sth	%r10, [%r9]
	setx	0x0000001050100000, %r1, %r9
	setx	0x2323846a54645d6f, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800e62193c, %r1, %r9
	setx	0x4eb9e85e4433a0ad, %r1, %r10
	stw	%r10, [%r9]
	setx	0x0000001000100000, %r1, %r9
	setx	0x4eb9e85e4433a0ad, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f2a4eec, %r1, %r9
	setx	0xb0bbe83f5b77c1e7, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c31d6ab104, %r1, %r9
	setx	0xa27045de35cb98bc, %r1, %r10
	stw	%r10, [%r9]
	setx	0x0000001010100000, %r1, %r9
	setx	0xa27045de35cb98bc, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d0b4c20e2c, %r1, %r9
	setx	0xa3987a8beaea22af, %r1, %r10
	stw	%r10, [%r9]
	setx	0x00000010a0100000, %r1, %r9
	setx	0xa3987a8beaea22af, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000eae0cb9f68, %r1, %r9
	setx	0xd2d119f8eb811f5d, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000fcb7dc3b18, %r1, %r9
	setx	0xf70b2103c4595644, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800ede5750, %r1, %r9
	setx	0x17b96173e2b98226, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f96ed78, %r1, %r9
	setx	0x74feb664570ea871, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ce2f534240, %r1, %r9
	setx	0xc18b483684323543, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000001060100000, %r1, %r9
	setx	0xc18b483684323543, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000d02f49f910, %r1, %r9
	setx	0x46088a764a368fd3, %r1, %r10
	stx	%r10, [%r9]
	setx	0x00000010e0100000, %r1, %r9
	setx	0x46088a764a368fd3, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e318d7bb00, %r1, %r9
	setx	0x0428db1f4d8d3ff5, %r1, %r10
	stx	%r10, [%r9]
	setx	0x00000010e0100000, %r1, %r9
	setx	0x0428db1f4d8d3ff5, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f8a20297b0, %r1, %r9
	setx	0x9c1cd2373e399a9e, %r1, %r10
	stx	%r10, [%r9]
	setx	0x00000010d0100000, %r1, %r9
	setx	0x9c1cd2373e399a9e, %r1, %r10
	stx	%r10, [%r9]
	setx	0x00000080ed5594bd, %r1, %r12
	ldub	[%r12], %r11
	setx	0x0000001080100000, %r1, %r9
	setx	0x9c1cd2373e399a9e, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000cf25c11f94, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800f92d2d6, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800ecebefc, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000fada2e37a2, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000e60471a80e, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000e308ffa880, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000d062b0fd48, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000cb3b437998, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800f414de8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e578070, %r1, %r12
	ldx	[%r12], %r11
	setx	0x00000080a36f52e2, %r1, %r9
	setx	0xe8b579b5fa416dc4, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800ebdec78, %r1, %r9
	setx	0x645a40531b08c448, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f101bac, %r1, %r9
	setx	0xe35f8b6a06e45b0d, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000cb8cac122a, %r1, %r9
	setx	0xe4bb42ed1a9b6a73, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d4f3db8171, %r1, %r9
	setx	0x8606d12003bf6e16, %r1, %r10
	stb	%r10, [%r9]
	setx	0x0000001040100000, %r1, %r9
	setx	0x8606d12003bf6e16, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e7ba38b2f7, %r1, %r9
	setx	0x2557dd7ca27cb312, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f02b483a1d, %r1, %r9
	setx	0x902b443a37df12a2, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800eb4dea6, %r1, %r9
	setx	0x6b08e3dafc107a5b, %r1, %r10
	sth	%r10, [%r9]
	setx	0x0000001050100000, %r1, %r9
	setx	0x6b08e3dafc107a5b, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f375988, %r1, %r9
	setx	0x25ec382e3b317e18, %r1, %r10
	sth	%r10, [%r9]
	setx	0x0000001060100000, %r1, %r9
	setx	0x25ec382e3b317e18, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000c8cfb9735c, %r1, %r9
	setx	0x85d4867c8276414b, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000dd8f430710, %r1, %r9
	setx	0x648ba4384a0bdf4d, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e54d775772, %r1, %r9
	setx	0x0f13cd4ceefe9bd9, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000fbe24a4578, %r1, %r9
	setx	0x25544ada083a3351, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e0ed388, %r1, %r9
	setx	0x7e8ef30ff411d839, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f59d218, %r1, %r9
	setx	0xc60cce9f50d90a03, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c203607374, %r1, %r9
	setx	0x9038763bb4b62d4c, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000db392af96c, %r1, %r9
	setx	0xda95344cc8189fb7, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e4dd3ed7f0, %r1, %r9
	setx	0x14f4a09d68bf31d2, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f8d2c69904, %r1, %r9
	setx	0x80ab2e4b8aa8d1de, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e68eb70, %r1, %r9
	setx	0x25a978c57f8dfe9a, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000001030100000, %r1, %r9
	setx	0x25a978c57f8dfe9a, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f7e74a8, %r1, %r9
	setx	0xedf3af4cc830aebf, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000001060100000, %r1, %r9
	setx	0xedf3af4cc830aebf, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ccc514d670, %r1, %r9
	setx	0x4c00679b4183a4a3, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d1f3158498, %r1, %r9
	setx	0x4af879986c9f8a22, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000001040100000, %r1, %r9
	setx	0x4af879986c9f8a22, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000eb6931ee20, %r1, %r9
	setx	0xdb400fd6ae278db9, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f8a20297b0, %r1, %r9
	setx	0x5858d192e6447229, %r1, %r10
	stx	%r10, [%r9]
	setx	0x00000010e0100000, %r1, %r9
	setx	0x5858d192e6447229, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f45908a, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800e33a69c, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000807fcfcea1, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000f30d2c13ae, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000e30e45804f, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000da2a3d1080, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000c635529d46, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800ebe8cb2, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800f07475c, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800e1bade4, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000f82657c3f0, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000e50e0c6428, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800f27bc10, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e047550, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000807ce22539, %r1, %r9
	setx	0x4c47169294901987, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800ee4c8be, %r1, %r9
	setx	0x9fe13ef6c4fa9ec7, %r1, %r10
	stb	%r10, [%r9]
	setx	0x00000010d0100000, %r1, %r9
	setx	0x9fe13ef6c4fa9ec7, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800fa4d26e, %r1, %r9
	setx	0x0109b9645852ceb0, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c281a28d6d, %r1, %r9
	setx	0x400cc8856c1df0f0, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d80f656098, %r1, %r9
	setx	0x0c7b34452ae80795, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e1a58d8cb1, %r1, %r9
	setx	0xadd72e5a47f8349e, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000fc271bced6, %r1, %r9
	setx	0x8f042c8e184ee058, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e52122e, %r1, %r9
	setx	0xea43ce418649faaf, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800fe73c12, %r1, %r9
	setx	0xfce807e7730bb621, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c1c858446c, %r1, %r9
	setx	0x78796342d605c2ac, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d23d65faa0, %r1, %r9
	setx	0x433fa1b1bbf0e404, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e424303dd8, %r1, %r9
	setx	0x198cd134554c0bf7, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f936b4314e, %r1, %r9
	setx	0x379e583da7dc6378, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e12dc68, %r1, %r9
	setx	0xedf5e1d0356416e3, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800fddd064, %r1, %r9
	setx	0x41a3234d08f88514, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c5f75f6ae0, %r1, %r9
	setx	0x755a83f7e4b15916, %r1, %r10
	stw	%r10, [%r9]
	setx	0x0000001090100000, %r1, %r9
	setx	0x755a83f7e4b15916, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d4a6a576a8, %r1, %r9
	setx	0xa9971331f6927da2, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000eaab21e6d4, %r1, %r9
	setx	0x0bb35c90846c148b, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000fb0e678c58, %r1, %r9
	setx	0xedf38a762c39e767, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e69cca0, %r1, %r9
	setx	0x9063fb1696b06e39, %r1, %r10
	stx	%r10, [%r9]
	setx	0x00000010c0100000, %r1, %r9
	setx	0x9063fb1696b06e39, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800fa7dec0, %r1, %r9
	setx	0x6c31a762620d9d41, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000001080100000, %r1, %r9
	setx	0x6c31a762620d9d41, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000cff036b438, %r1, %r9
	setx	0x950a5b3fb579dece, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d6e53a4780, %r1, %r9
	setx	0xb6a2fd863ff6ad9f, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e67c8681c8, %r1, %r9
	setx	0xdb15928a522ba6f0, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f8a20297b0, %r1, %r9
	setx	0x27db2d8b3d274527, %r1, %r10
	stx	%r10, [%r9]
	setx	0x00000010c0100000, %r1, %r9
	setx	0x27db2d8b3d274527, %r1, %r10
	ldx	[%r9], %r10
	setx	0x00000080a1fea4ae, %r1, %r12
	ldub	[%r12], %r11
	setx	0x00000010f0100000, %r1, %r9
	setx	0x27db2d8b3d274527, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f9e93edbe5, %r1, %r12
	ldub	[%r12], %r11
	setx	0x0000001080100000, %r1, %r9
	setx	0x27db2d8b3d274527, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000ef3ea96630, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000dc63dfc26c, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000c4aeac0a34, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800f872efd, %r1, %r12
	ldub	[%r12], %r11
	setx	0x0000001010100000, %r1, %r9
	setx	0x27db2d8b3d274527, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000d045cd54a0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000cf5e7557f8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800f8c3552, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e4fa0bc, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000f04dfe93cc, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000e3a3400460, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000dc874e77b0, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000c08a2460e4, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800f293fec, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000e436656408, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000807a407bd1, %r1, %r9
	setx	0x87b3bde7cef76e54, %r1, %r10
	stb	%r10, [%r9]
	setx	0x00000010e0100000, %r1, %r9
	setx	0x87b3bde7cef76e54, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800eeb4131, %r1, %r9
	setx	0x576b44e9c491eb9b, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800ff4f5f3, %r1, %r9
	setx	0xea0e3bf042f2f8dc, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c480439240, %r1, %r9
	setx	0x640fd4c116db6f41, %r1, %r10
	stb	%r10, [%r9]
	setx	0x0000001080100000, %r1, %r9
	setx	0x640fd4c116db6f41, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000daa2cfe52f, %r1, %r9
	setx	0x1fcc179c9b695614, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000eca115c113, %r1, %r9
	setx	0xf0bf1001a34adeb9, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f46040b13c, %r1, %r9
	setx	0xcd709454c61948f8, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e79b8ca, %r1, %r9
	setx	0x83af4059add66b59, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f664ff8, %r1, %r9
	setx	0x7df21d11bf4be122, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c0a2989c22, %r1, %r9
	setx	0x16b5c0c2533f5ab4, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d8727263e2, %r1, %r9
	setx	0x8d2c576256d305f5, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e17f2e3e34, %r1, %r9
	setx	0xa415a4cae7674959, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f6d1859600, %r1, %r9
	setx	0xbad4365ca6b16a8a, %r1, %r10
	sth	%r10, [%r9]
	setx	0x0000001000100000, %r1, %r9
	setx	0xbad4365ca6b16a8a, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800ec06f78, %r1, %r9
	setx	0xbda7d4f366dd534b, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f664980, %r1, %r9
	setx	0xaa57373fe5be6afb, %r1, %r10
	stw	%r10, [%r9]
	setx	0x0000001010100000, %r1, %r9
	setx	0xaa57373fe5be6afb, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c9f83ccfcc, %r1, %r9
	setx	0xbf4d356ac634ddf9, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000ddaba5650c, %r1, %r9
	setx	0xe522f70d7381142e, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000eaffceb1b8, %r1, %r9
	setx	0x332e24415f6e9478, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f4d6362348, %r1, %r9
	setx	0xdd134c0e8a10a642, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e642c90, %r1, %r9
	setx	0x3b4258f244914960, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800fc9f4e8, %r1, %r9
	setx	0xe9d149601d4cae68, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c01739fa58, %r1, %r9
	setx	0xe30c4cdb86336db4, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d510c8f328, %r1, %r9
	setx	0x2edc97ab21e5eaee, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000001070100000, %r1, %r9
	setx	0x2edc97ab21e5eaee, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e809d0f638, %r1, %r9
	setx	0xb5c030a857f85a50, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f8a20297b0, %r1, %r9
	setx	0x28c2893d1aa7a5dc, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000001020100000, %r1, %r9
	setx	0x28c2893d1aa7a5dc, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800e76d91a, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000f9ae462c4a, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000e2fb6ac81e, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000da0e55bf54, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000caa65c18e2, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800fd30f08, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e9f49da, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800f227654, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800e1cdf28, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000f8a20297b0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000e77141c518, %r1, %r12
	ldx	[%r12], %r11
	setx	0x0000008078fb87a8, %r1, %r9
	setx	0xd0eed9f9f9928c8c, %r1, %r10
	stb	%r10, [%r9]
	setx	0x0000001040100000, %r1, %r9
	setx	0xd0eed9f9f9928c8c, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800ef12bd0, %r1, %r9
	setx	0x6bb727c1d4ca8a5a, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800fe916c8, %r1, %r9
	setx	0x1ceac97a95c670c5, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000cbeff557f2, %r1, %r9
	setx	0xc2f37d36944dd4e5, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d7eb309409, %r1, %r9
	setx	0x6d872ad0b1c22994, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e822c983e1, %r1, %r9
	setx	0xf54a5cbbf8bdbab2, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f96879913c, %r1, %r9
	setx	0x433ce0a52c0e5c28, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e90f534, %r1, %r9
	setx	0x3b0b67da20a4b055, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f642b2c, %r1, %r9
	setx	0x3229b27867103e99, %r1, %r10
	sth	%r10, [%r9]
	setx	0x00000010c0100000, %r1, %r9
	setx	0x3229b27867103e99, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000cf48958402, %r1, %r9
	setx	0x84c3f57bffdf84f6, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d33b49ee1c, %r1, %r9
	setx	0xef8d56d9d347133c, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000efe462cb44, %r1, %r9
	setx	0xab4beb57e26e30b9, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000fbdc2d4916, %r1, %r9
	setx	0xcef00387d76fd419, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e7c0e78, %r1, %r9
	setx	0x502f72eec8ee7e8a, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f7dcbd8, %r1, %r9
	setx	0x9f71ab0c792c3783, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000ce939716e0, %r1, %r9
	setx	0xddcdc8362f65a583, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d4fecd5e10, %r1, %r9
	setx	0xa688be582d3f6c85, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e16ade2dc0, %r1, %r9
	setx	0x18329e661689edb9, %r1, %r10
	stw	%r10, [%r9]
	setx	0x0000001000100000, %r1, %r9
	setx	0x18329e661689edb9, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000fec88446b4, %r1, %r9
	setx	0xe1b6c0b1db0f4f70, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800ef74ed0, %r1, %r9
	setx	0x6824c2be89340008, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000001010100000, %r1, %r9
	setx	0x6824c2be89340008, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800f8613b0, %r1, %r9
	setx	0x43fde3e359750ea0, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000cf281d0368, %r1, %r9
	setx	0x71023251647dbf8b, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000daaea73770, %r1, %r9
	setx	0x5ee7c489da2e8511, %r1, %r10
	stx	%r10, [%r9]
	setx	0x00000010e0100000, %r1, %r9
	setx	0x5ee7c489da2e8511, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e37fc06140, %r1, %r9
	setx	0x6d93ef1be8c9ac7f, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f8a20297b0, %r1, %r9
	setx	0xcfa73e1c59dee076, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800e0c719c, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000806c40c818, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000f794adde8c, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000e51bbd1937, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000df7c505e6f, %r1, %r12
	ldub	[%r12], %r11
	setx	0x00000010e0100000, %r1, %r9
	setx	0xcfa73e1c59dee076, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000c0e3ee0dfc, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000f0df4d57b8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000e84e683814, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d8e8c5f89e, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000ce99fe5eb8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800f29d292, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000ee25028ef8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800e2dd7d8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000f8a20297b0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000e8c049e2e8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x00000080c8f321a7, %r1, %r9
	setx	0x2b905af27d62f790, %r1, %r10
	stb	%r10, [%r9]
	setx	0x0000001070100000, %r1, %r9
	setx	0x2b905af27d62f790, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800e235180, %r1, %r9
	setx	0x37281f69e71200f1, %r1, %r10
	stb	%r10, [%r9]
	setx	0x0000001030100000, %r1, %r9
	setx	0x37281f69e71200f1, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800fbf640f, %r1, %r9
	setx	0xf46092ad8d665bc3, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c443c1cc87, %r1, %r9
	setx	0x223ff504a08edb9e, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000dad9016d5c, %r1, %r9
	setx	0x2f1a35cd571395c8, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e10a1b8af8, %r1, %r9
	setx	0x9dd0f970efa6df2b, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f07179bd97, %r1, %r9
	setx	0x4e5e48a619569253, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800eca4522, %r1, %r9
	setx	0x181d015d3af3577e, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f834e34, %r1, %r9
	setx	0xfbe4fee75b22238f, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000ca551525c4, %r1, %r9
	setx	0x8688b46b1d22ab02, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000dbd4a4bb0e, %r1, %r9
	setx	0xa72ed8d537fe9ec5, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e51f071fb4, %r1, %r9
	setx	0xc7c152dd4736222e, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f41162e6c0, %r1, %r9
	setx	0xec973f121ea911ae, %r1, %r10
	sth	%r10, [%r9]
	setx	0x0000001000100000, %r1, %r9
	setx	0xec973f121ea911ae, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800e6dec84, %r1, %r9
	setx	0x86eb0fb69997b440, %r1, %r10
	stw	%r10, [%r9]
	setx	0x00000010a0100000, %r1, %r9
	setx	0x86eb0fb69997b440, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800fe44adc, %r1, %r9
	setx	0xc7dd9bbf783a2fdb, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c041991490, %r1, %r9
	setx	0xd34817589e32c9a6, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d7752e3b84, %r1, %r9
	setx	0x9d31d7fdf207de2f, %r1, %r10
	stw	%r10, [%r9]
	setx	0x00000010e0100000, %r1, %r9
	setx	0x9d31d7fdf207de2f, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000ef48b94da4, %r1, %r9
	setx	0x91369d1c5d3507f1, %r1, %r10
	stw	%r10, [%r9]
	setx	0x0000001030100000, %r1, %r9
	setx	0x91369d1c5d3507f1, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000f7186f43ac, %r1, %r9
	setx	0xf22e8a0bc06ad7a8, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800ed395d8, %r1, %r9
	setx	0x366cdb4248a3d730, %r1, %r10
	stx	%r10, [%r9]
	setx	0x00000010d0100000, %r1, %r9
	setx	0x366cdb4248a3d730, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800fc97048, %r1, %r9
	setx	0x3a99312b9ad1dfd3, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c05c3afa90, %r1, %r9
	setx	0xb295f108d5be35b1, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000dbf7933ff8, %r1, %r9
	setx	0x05e36626e1d05d99, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e4e1e675d8, %r1, %r9
	setx	0x874e7355f090f2b8, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000001070100000, %r1, %r9
	setx	0x874e7355f090f2b8, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f8a20297b0, %r1, %r9
	setx	0xccdd5a911e4b61b7, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000001060100000, %r1, %r9
	setx	0xccdd5a911e4b61b7, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000c13ac36d54, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800f508ee7, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800eb61a88, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000f01fcf6e04, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000ee716fd92c, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000f8a20297b0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000ec72df18d0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000da07638718, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000c09f3312a8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x00000080b5e83af8, %r1, %r9
	setx	0x9155e0d8a20b3aa3, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e625ce9, %r1, %r9
	setx	0xc942160db91c8b2e, %r1, %r10
	stb	%r10, [%r9]
	setx	0x0000001070100000, %r1, %r9
	setx	0xc942160db91c8b2e, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800fdb64ec, %r1, %r9
	setx	0xb66cbcf6a31e8610, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c026e8e173, %r1, %r9
	setx	0x6388aab66d535c97, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d736116ead, %r1, %r9
	setx	0x9773f442fbdc29fa, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000eeb2f1a632, %r1, %r9
	setx	0x5d735288f14af7ff, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f6aa4df1b6, %r1, %r9
	setx	0x833cf737b09117a2, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e0ea95e, %r1, %r9
	setx	0x9370f1372c59c43a, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800fa6b9a4, %r1, %r9
	setx	0x6ccc24d5c95c339f, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000ccd4c1e418, %r1, %r9
	setx	0x8f1c967e8730f162, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000dae14e7e74, %r1, %r9
	setx	0x676efbd23473d46c, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000ece4ca7ea8, %r1, %r9
	setx	0xbad539d6825d8897, %r1, %r10
	sth	%r10, [%r9]
	setx	0x0000001060100000, %r1, %r9
	setx	0xbad539d6825d8897, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000f001735208, %r1, %r9
	setx	0x873095753a5814cc, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e5a08a4, %r1, %r9
	setx	0x8728bebf98aca13a, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f425b8c, %r1, %r9
	setx	0xd403f83c6a0b6c3f, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c4c4bf2e9c, %r1, %r9
	setx	0xfad2f155ae46b202, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d35ab382e8, %r1, %r9
	setx	0x07f657f04a903dc4, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000efd6a55fb8, %r1, %r9
	setx	0x4f03f75e847b665c, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f6493eb630, %r1, %r9
	setx	0xd47228db20b7361b, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e5d1b68, %r1, %r9
	setx	0x8b6918e468c0eeb3, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f824228, %r1, %r9
	setx	0xac2a55ba321e589f, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c1c3bdd3a0, %r1, %r9
	setx	0x34470360dc44975a, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000df54ee12f0, %r1, %r9
	setx	0x0bbfa92fca3f250c, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000eee098cfd8, %r1, %r9
	setx	0x3d7ca8a1b14b8d49, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f8a20297b0, %r1, %r9
	setx	0xcedcceb5461b18e9, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f9e93edbe5, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000ef3ea96630, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000dc63dfc26c, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000c4aeac0a34, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800f872efd, %r1, %r12
	ldub	[%r12], %r11
	setx	0x00000010f0100000, %r1, %r9
	setx	0xcedcceb5461b18e9, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800e52122e, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000fe674b0b90, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000e6255feccc, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000d8b88e4504, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000cd48ed8128, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800f3ea50c, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800edc0224, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000f07758728c, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000ed6a229f00, %r1, %r12
	ldx	[%r12], %r11
	setx	0x00000080bb471737, %r1, %r9
	setx	0xc39ddd9aa3da6e04, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e514bb4, %r1, %r9
	setx	0x6f5300fdd3c833cd, %r1, %r10
	stb	%r10, [%r9]
	setx	0x0000001060100000, %r1, %r9
	setx	0x6f5300fdd3c833cd, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800fd4540f, %r1, %r9
	setx	0x12de941ba4118d8c, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c995f1e758, %r1, %r9
	setx	0x72d69582dda22ae5, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d06cb6eb9d, %r1, %r9
	setx	0x0d7e7b5582058d2c, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000eb79f68974, %r1, %r9
	setx	0xb2c1cd9ee838838a, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f4438a131d, %r1, %r9
	setx	0x83ec1647b525bd86, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e15c420, %r1, %r9
	setx	0xe222460bccf6c223, %r1, %r10
	sth	%r10, [%r9]
	setx	0x00000010a0100000, %r1, %r9
	setx	0xe222460bccf6c223, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800fdbc042, %r1, %r9
	setx	0xeabccc6ac4f0f0d3, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000cd1947bfde, %r1, %r9
	setx	0x6142f7a864319140, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d15bc2bd18, %r1, %r9
	setx	0x71a20cf2f6f55736, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000ea00ea9228, %r1, %r9
	setx	0x64b47bd652cbd195, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f04bbecc6e, %r1, %r9
	setx	0xc2b22611b538bcf2, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e85d978, %r1, %r9
	setx	0xa835aff9e7a664ef, %r1, %r10
	stw	%r10, [%r9]
	setx	0x00000010c0100000, %r1, %r9
	setx	0xa835aff9e7a664ef, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800f03a214, %r1, %r9
	setx	0x5c9622c54abfa17b, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000cad55322a8, %r1, %r9
	setx	0x8a5cda519c787635, %r1, %r10
	stw	%r10, [%r9]
	setx	0x0000001060100000, %r1, %r9
	setx	0x8a5cda519c787635, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000db73ef583c, %r1, %r9
	setx	0x1b6c495571fe2094, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000ec1decc790, %r1, %r9
	setx	0xd3ac6ddd5d32e9c0, %r1, %r10
	stw	%r10, [%r9]
	setx	0x0000001070100000, %r1, %r9
	setx	0xd3ac6ddd5d32e9c0, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000f31f923e78, %r1, %r9
	setx	0x3d1b0718ab1ae757, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800ef89f08, %r1, %r9
	setx	0x8315f393a19be767, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f957a90, %r1, %r9
	setx	0x5232b72bdf292f3c, %r1, %r10
	stx	%r10, [%r9]
	setx	0x00000010e0100000, %r1, %r9
	setx	0x5232b72bdf292f3c, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000cb691f7018, %r1, %r9
	setx	0xf8c702d940efed09, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000001080100000, %r1, %r9
	setx	0xf8c702d940efed09, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000de940e2da0, %r1, %r9
	setx	0x952bb47765f818c6, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ea6777dd28, %r1, %r9
	setx	0x5cc861ceeb01f714, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f8a20297b0, %r1, %r9
	setx	0x07446a17679bd19f, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800e84dc4a, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000fcff24de2e, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000e1ba51cd88, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d3157aa3f2, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000c9120940b2, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800fb6657c, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e536edc, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800f35aa18, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e684e28, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000f8a20297b0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000e6ef7f61d0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000d3e630ea30, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000801f80e321, %r1, %r9
	setx	0xc01126499bee3eca, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e86e76d, %r1, %r9
	setx	0xde92e499d76f1ca7, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800fa959b0, %r1, %r9
	setx	0x7dfdce6f94e0b7f3, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c5459f374a, %r1, %r9
	setx	0x96bbde7aa95fbbf7, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000dea09d49d2, %r1, %r9
	setx	0x4f811bb27db346bb, %r1, %r10
	stb	%r10, [%r9]
	setx	0x0000001020100000, %r1, %r9
	setx	0x4f811bb27db346bb, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e86bf97a24, %r1, %r9
	setx	0x2311623c7d7c102f, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f68ef31792, %r1, %r9
	setx	0x7fb8db1a1f5955f9, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e3df3a8, %r1, %r9
	setx	0x9fdeb481b7c69b26, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f4c669c, %r1, %r9
	setx	0x2fe311a3a056dff6, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c9066571f2, %r1, %r9
	setx	0x7b2259abe2efc1bb, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d6bd45dece, %r1, %r9
	setx	0x0021b8a8d8ee8a82, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e7bd760f82, %r1, %r9
	setx	0x5d6159dd95cfb966, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f202485898, %r1, %r9
	setx	0x0748ec6f0484e4d3, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e7178f0, %r1, %r9
	setx	0x8c262d5714d8f710, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800fbc78dc, %r1, %r9
	setx	0x533df0c177556a0f, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c4787c481c, %r1, %r9
	setx	0x0471a724e8b2b9d5, %r1, %r10
	stw	%r10, [%r9]
	setx	0x00000010d0100000, %r1, %r9
	setx	0x0471a724e8b2b9d5, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000dcae7539f0, %r1, %r9
	setx	0xc80404985e061c37, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000ee671db6fc, %r1, %r9
	setx	0xfcbdeadb5f1c0a73, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000fe28ad1180, %r1, %r9
	setx	0x4df00501a6bf3d8c, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800ef8f210, %r1, %r9
	setx	0xc600e3854b760555, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000001050100000, %r1, %r9
	setx	0xc600e3854b760555, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800f93c360, %r1, %r9
	setx	0xd0558559628e56ef, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c3aaafff00, %r1, %r9
	setx	0x3e39cb55308453e7, %r1, %r10
	stx	%r10, [%r9]
	setx	0x00000010a0100000, %r1, %r9
	setx	0x3e39cb55308453e7, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000def593e6e0, %r1, %r9
	setx	0xcd6c65e66eaa2bf0, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e806586d80, %r1, %r9
	setx	0xace58ba7a98053c3, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f8a20297b0, %r1, %r9
	setx	0x0fc463f3f441ef10, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f90cc9a, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000d6ecc5620c, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e07c2b4, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000f6590180cc, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000806a1dcdbc, %r1, %r9
	setx	0x0fb8265d56efd11d, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e22e702, %r1, %r9
	setx	0x4d8140d4a0d411d5, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800facda46, %r1, %r9
	setx	0xa02b8d67146fe484, %r1, %r10
	stb	%r10, [%r9]
	setx	0x00000010f0100000, %r1, %r9
	setx	0xa02b8d67146fe484, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000cd58328a3e, %r1, %r9
	setx	0x7469394fb4f11abc, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000dd50a8940a, %r1, %r9
	setx	0xb6bc730a637f7404, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e2d416a81f, %r1, %r9
	setx	0xbc47cf2d2ff5f02e, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000fcd85d52b6, %r1, %r9
	setx	0xa20429986e12fd40, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e8e0968, %r1, %r9
	setx	0x1131c4d70149affa, %r1, %r10
	sth	%r10, [%r9]
	setx	0x00000010a0100000, %r1, %r9
	setx	0x1131c4d70149affa, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f2a9dcc, %r1, %r9
	setx	0x07b9c2228a0db785, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000cafa58d7fe, %r1, %r9
	setx	0x9b946bf99fb1e564, %r1, %r10
	sth	%r10, [%r9]
	setx	0x00000010f0100000, %r1, %r9
	setx	0x9b946bf99fb1e564, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000d69d391992, %r1, %r9
	setx	0x1b34535e173c9283, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e0c7922bec, %r1, %r9
	setx	0xc5623f8c9d2fba36, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000fee02c1d6c, %r1, %r9
	setx	0x5a1fb74054169a76, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e9f75c0, %r1, %r9
	setx	0x2aefc7fca9e2b8d3, %r1, %r10
	stw	%r10, [%r9]
	setx	0x0000001090100000, %r1, %r9
	setx	0x2aefc7fca9e2b8d3, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800f6a5b24, %r1, %r9
	setx	0xafd2895cd650c648, %r1, %r10
	stw	%r10, [%r9]
	setx	0x00000010f0100000, %r1, %r9
	setx	0xafd2895cd650c648, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000c6d046520c, %r1, %r9
	setx	0xb212320c53f58db2, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d967d99594, %r1, %r9
	setx	0x8025a542db5a3799, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e799209d3c, %r1, %r9
	setx	0x95225a3b68ec93ed, %r1, %r10
	stw	%r10, [%r9]
	setx	0x0000001040100000, %r1, %r9
	setx	0x95225a3b68ec93ed, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000f152bc26c4, %r1, %r9
	setx	0x31e92506d070a26f, %r1, %r10
	stw	%r10, [%r9]
	setx	0x0000001020100000, %r1, %r9
	setx	0x31e92506d070a26f, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800e12a2a0, %r1, %r9
	setx	0xa27e6a70e0102e7d, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f7918e0, %r1, %r9
	setx	0xb255965adde160e6, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000001090100000, %r1, %r9
	setx	0xb255965adde160e6, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c766345d88, %r1, %r9
	setx	0xab4aed8c2fa4f6cc, %r1, %r10
	stx	%r10, [%r9]
	setx	0x00000010e0100000, %r1, %r9
	setx	0xab4aed8c2fa4f6cc, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000de7c06a4e0, %r1, %r9
	setx	0xe247f80939271bfb, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e63b448468, %r1, %r9
	setx	0x2106574f842e8693, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f8a20297b0, %r1, %r9
	setx	0x630a5f396f15566b, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ef84fbc591, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000d6bcb0431a, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000fcff24de2e, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000e1ba51cd88, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d3157aa3f2, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000c9120940b2, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800fb6657c, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000c1d6100128, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800fcfe9b8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800e41fc70, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000fe900161f4, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000e7fddc94ac, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800e54fb50, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000f8a20297b0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000e8567c14f8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000dea87a7760, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000cb7c3b4e00, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800fa868a0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800ec396b0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x0000008088039c95, %r1, %r9
	setx	0xe100cdf384ffad8c, %r1, %r10
	stb	%r10, [%r9]
	setx	0x0000001050100000, %r1, %r9
	setx	0xe100cdf384ffad8c, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800e8f7e8b, %r1, %r9
	setx	0x8dc4f67edd4c66c9, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f21bae3, %r1, %r9
	setx	0xe051790c4b14044b, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c867b39598, %r1, %r9
	setx	0x7fe33d8d6f25f4bd, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d169dd8959, %r1, %r9
	setx	0xe10320d20d65876e, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ed1db1c58f, %r1, %r9
	setx	0xad831a188de8408e, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f5389ac484, %r1, %r9
	setx	0xd18f658f8a5f22e3, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800ef26438, %r1, %r9
	setx	0x0025fbfd88998a74, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f537272, %r1, %r9
	setx	0x0161035145b33813, %r1, %r10
	sth	%r10, [%r9]
	setx	0x00000010a0100000, %r1, %r9
	setx	0x0161035145b33813, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000cd8c94116c, %r1, %r9
	setx	0x2fc793f54223eb24, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d081bc8822, %r1, %r9
	setx	0xe240f7fd7a39f4cc, %r1, %r10
	sth	%r10, [%r9]
	setx	0x0000001070100000, %r1, %r9
	setx	0xe240f7fd7a39f4cc, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000e50bb490d8, %r1, %r9
	setx	0x501d94c568208826, %r1, %r10
	sth	%r10, [%r9]
	setx	0x0000001040100000, %r1, %r9
	setx	0x501d94c568208826, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000fe0f69620c, %r1, %r9
	setx	0x3237d6b46157315e, %r1, %r10
	sth	%r10, [%r9]
	setx	0x00000010d0100000, %r1, %r9
	setx	0x3237d6b46157315e, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800e6c32b4, %r1, %r9
	setx	0xe4ccae6c6dba92c3, %r1, %r10
	stw	%r10, [%r9]
	setx	0x0000001070100000, %r1, %r9
	setx	0xe4ccae6c6dba92c3, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800fabd6a0, %r1, %r9
	setx	0xa8c8e0f9db1cf8ee, %r1, %r10
	stw	%r10, [%r9]
	setx	0x00000010f0100000, %r1, %r9
	setx	0xa8c8e0f9db1cf8ee, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ca14214948, %r1, %r9
	setx	0x4f7b755990d32623, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d71c5deb54, %r1, %r9
	setx	0xeb3a28449f21ac46, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000ee23559988, %r1, %r9
	setx	0x41124743c0860201, %r1, %r10
	stw	%r10, [%r9]
	setx	0x0000001030100000, %r1, %r9
	setx	0x41124743c0860201, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f4048baac8, %r1, %r9
	setx	0xd19e42d3ac522e79, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800eefec10, %r1, %r9
	setx	0x721c0afdb7801c19, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f41b200, %r1, %r9
	setx	0x859e2c46a8e06f69, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000cb0d66f7f0, %r1, %r9
	setx	0xeb4b7e68f4313e3e, %r1, %r10
	stx	%r10, [%r9]
	setx	0x00000010d0100000, %r1, %r9
	setx	0xeb4b7e68f4313e3e, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000dcf08b60f8, %r1, %r9
	setx	0xb1da07202561d3e2, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ea1fb3e0a0, %r1, %r9
	setx	0x4b35991d978b2542, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f8a20297b0, %r1, %r9
	setx	0x888e29a936914bab, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000001040100000, %r1, %r9
	setx	0x888e29a936914bab, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000c3324e5d73, %r1, %r12
	ldub	[%r12], %r11
	setx	0x0000001040100000, %r1, %r9
	setx	0x888e29a936914bab, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800fddfa38, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000e7e6926386, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000cb7c3b4e00, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800fa868a0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800ec396b0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000f8a20297b0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000e308ffa880, %r1, %r12
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
	.xword	0xf4a443518524414e
	.xword	0x508de3793054fa3d
	.xword	0x999fc222aecdb328
	.xword	0x4bcc43f40f8e250f
	.xword	0x70ddfe9921b3bf05
	.xword	0xa99cd52027e0adfc
	.xword	0x6717ad992fe0c94c
	.xword	0x061cafb7137869b7
	.xword	0x5e378d1bea4ecce9
	.xword	0xe4de9d8f2d6b8431
	.xword	0x1e8b928ca5ed27b9
	.xword	0x23c52daa11b0be33
	.xword	0xb56bedddc7188f8e
	.xword	0x1e18c9b95c2096fc
	.xword	0xfe76322782e07e76
	.xword	0x9998198ca738ed0e
	.xword	0x702d0fc089f5e643
	.xword	0x94bf2d2b9a9f1f05
	.xword	0xeedbbaf5cc2b1307
	.xword	0xfccbde27ca9b6899
	.xword	0x2ec2a920f6e43bbf
	.xword	0xe2ef8de333c5c8fc
	.xword	0x60d5560f3d58c9fc
	.xword	0x7cd9f886aec95c2b
	.xword	0x72703e16cffe25c0
	.xword	0x2a8eab3dcf2d309a
	.xword	0x7339efe4a525f15c
	.xword	0x237e8c86d20830f0
	.xword	0xea421cc9467c474a
	.xword	0x6025d3a799890fc4
	.xword	0x9acace3e41710b60
	.xword	0xb27f4e2b6d75eb1c
	.xword	0x9a6ff0c0836e0c37
	.xword	0x4db953a31d2b6f72
	.xword	0xf167a5e0e45ed1d4
	.xword	0x4fe44d069eae9ba7
	.xword	0xb950a353716b2074
	.xword	0x5e9a3d515d98ac3c
	.xword	0xb9c18f4a5a731da7
	.xword	0xab688eadbf85d64b
	.xword	0x7b4b442991b249c3
	.xword	0x0be0b5d440db5697
	.xword	0x82f8506d155ca975
	.xword	0xb898324ee2156b87
	.xword	0x3bf0acd39f5fe496
	.xword	0xb602bb7e1b91bb46
	.xword	0x7e78ba81d044f5cc
	.xword	0xf867d1aec1aa1d54
	.xword	0x51b8a0f774886b28
	.xword	0x82f81f95705ea28f
	.xword	0x23e1f156309917e0
	.xword	0x17811c642edcad92
	.xword	0x6a07c8bf12b3fb16
	.xword	0xcaa6fcb4fdb6c22a
	.xword	0x388c324a2ef2a28a
	.xword	0x1335ff2c4b31da87
	.xword	0x29285cdb5fbb8926
	.xword	0x3f1cb42b4541a8e4
	.xword	0x4073ed5ac72f7bcd
	.xword	0x431c1c952744b090
	.xword	0xa439e610d54b9956
	.xword	0xe64ea695d8212a3f
	.xword	0x062596c17fb7f0cb
	.xword	0x1b065e2aa23d8dd3



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
	.xword	0xaf09c89cd28d3123
	.xword	0xa948d5f5b626691b
	.xword	0x4beba40bbc505cc3
	.xword	0x003d26f8ffe466ad
	.xword	0x2c2a4720c72751c0
	.xword	0x4e89fa19140d584b
	.xword	0x99f7bc952c01fda9
	.xword	0x682d127af01716dd
	.xword	0x2080fe2888b82ebe
	.xword	0x6b1c5da7d224b807
	.xword	0xb076bedab9756b66
	.xword	0x5e0ba9f710033451
	.xword	0x9730ea39c66c5273
	.xword	0x29856963f0d2ab2d
	.xword	0xfdefe9c7e46dd606
	.xword	0xb886ab0fcb084f41
	.xword	0xd25e8acfa11ba843
	.xword	0x3520aed5d0d79426
	.xword	0x1579f4646304fb97
	.xword	0xb741bb72813013a3
	.xword	0xc205bd58e42c2b81
	.xword	0xd6a939f8e725416b
	.xword	0x75a124747c7b18d9
	.xword	0x57e32f5d5185a1a0
	.xword	0x2f79a9c572c97c07
	.xword	0x0b205536582c73f1
	.xword	0x10e9295145b451e4
	.xword	0xb828cdea399234fc
	.xword	0x3956811e54b2affd
	.xword	0x48920947e0ab1416
	.xword	0x264f5cf232d1338c
	.xword	0x0001b7b64fca2795
	.xword	0x010ad130ac30a9d2
	.xword	0x8f45bd6616795985
	.xword	0x50f6cc54f3e4ed92
	.xword	0x96b44400724c94fd
	.xword	0x40cf092974ba943e
	.xword	0x8c27f65797598354
	.xword	0x06849caeb2bb155b
	.xword	0x2e95fb4c44256ac5
	.xword	0x77f72f1496d56174
	.xword	0xab29718e1cc9e924
	.xword	0x0daf9008ac22a1cf
	.xword	0x2ecdea2dbc1414a8
	.xword	0xd2a1932deffc5763
	.xword	0x1d8259855ca06697
	.xword	0x5ce260a3dadfda7d
	.xword	0xded97a30c05286a0
	.xword	0x5a6b10f0a78f498b
	.xword	0xba20277c4432f839
	.xword	0x01b095bddf0dc205
	.xword	0x378172f3ec74f916
	.xword	0xd0ae584b70b25d48
	.xword	0x5eff916aeb7f4329
	.xword	0xd6b1c5a1adcebdf6
	.xword	0x95c5edcf5609fc1a
	.xword	0x1080837b69960c2a
	.xword	0xc9c5b084e75a498b
	.xword	0x4ddbf1664c65a5ec
	.xword	0x4e8bf451e5925d0b
	.xword	0x835bf265daab9403
	.xword	0xbe3c85e0fa573d26
	.xword	0x1b23c65466e15a79
	.xword	0x4658ba4cb8ec7ad8



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
	.xword	0xae7a5edeef111f5d
	.xword	0xddaec2f908b2c4f9
	.xword	0xb0eef308c80440c8
	.xword	0xa3d9f2715d440c39
	.xword	0x62bc9965422a62bf
	.xword	0x2304b29765ebaf8c
	.xword	0xeca15690f2287ea1
	.xword	0x27da268439dff6ea
	.xword	0xa86cef135351e53b
	.xword	0xe4be75155561e93d
	.xword	0x97a57b097b12709a
	.xword	0xe82ace123afa19b1
	.xword	0x3da848484c66f053
	.xword	0x72da4e3b006af13d
	.xword	0x3db55ec58a2aa9e2
	.xword	0x2c8deed71772269e
	.xword	0x47bae23be87f11dd
	.xword	0xf27ce0d2981aaae3
	.xword	0x44bbf8b5b3595cba
	.xword	0x304b8618c3771903
	.xword	0x5546c55693e01593
	.xword	0xa09c222a739b5efb
	.xword	0x95100a157353fca4
	.xword	0xc28115aebfa2c725
	.xword	0xc9a59225e79f3503
	.xword	0xe6dab6c636eb56d2
	.xword	0xaf42a6e858e42fa8
	.xword	0xd41e903f4a7b5853
	.xword	0xbd0f68e2f76dedb1
	.xword	0x47667d29f1611912
	.xword	0x5fc56b93c8b1de55
	.xword	0xa151466538a921b4
	.xword	0x362467fbf454e631
	.xword	0x7b1e89be0d3fe8f5
	.xword	0x909016846f1fb46e
	.xword	0x518337ff64d03922
	.xword	0x8af04dcc38d1c4aa
	.xword	0x97d45dc81c084511
	.xword	0x470910ad148daa92
	.xword	0x3fe0eea1043e5b8d
	.xword	0x9998017407bf219c
	.xword	0x1418d7f17fa57e5e
	.xword	0xf325691920977a1d
	.xword	0xe79a89a35de584c2
	.xword	0x6760e3987d2c53a8
	.xword	0xc8ee6638ee1320de
	.xword	0xf992d39ecb28ee98
	.xword	0xb3a197bd12d219a6
	.xword	0x707ad324e68a664c
	.xword	0x9738f211380d6617
	.xword	0xca2857d51da1d396
	.xword	0xaced1c080e3fb2f9
	.xword	0x1688d4bbab86c02c
	.xword	0x3b7d8b7b0c5dddb0
	.xword	0x5642f639fd8bee69
	.xword	0xdd4a583cb95ff48c
	.xword	0xde6ef06a70f4adce
	.xword	0x8e48ad8a26f216a5
	.xword	0xce5371b42825b034
	.xword	0x7193261dd9433d86
	.xword	0xf5916106f5575601
	.xword	0xd758ab80456a752f
	.xword	0x4b91f6f9c0be1670
	.xword	0x3aa58e3abf4db859



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
	.xword	0xb06acb8339df49d7
	.xword	0x65085efa3393403b
	.xword	0xd79262efe35f3d7b
	.xword	0x0d9b52a87e36e259
	.xword	0xff68e47facc373d3
	.xword	0x8397a62c35c5f0f7
	.xword	0x9ddc580f5b13fbdd
	.xword	0x52286f585ea90bcf
	.xword	0x2e693940526ed517
	.xword	0x09c2ebb571990dd1
	.xword	0x32488a47b89e3275
	.xword	0xda4ef9467cead7f8
	.xword	0x9b9d24a9ba09b19a
	.xword	0xcf8f6c5fee04507f
	.xword	0x3fcd9ebe6373b09b
	.xword	0x4e03b7b9c337b6a4
	.xword	0x1f5329796d1909a0
	.xword	0x41580db3c16c7357
	.xword	0x4b16f36ffa7c991d
	.xword	0x31e560e4c276815d
	.xword	0xc0aee3b95b8e4c4a
	.xword	0x92133400306be311
	.xword	0x111f7f67f6da3b5e
	.xword	0x6c3c0518d3bbbdb5
	.xword	0x93d0e6c025d0ed86
	.xword	0xa335f8f58972e22e
	.xword	0x7a1d73ba3d54f8a6
	.xword	0x9f7fd74688892d4d
	.xword	0x286885effe932a13
	.xword	0x6a522b9b466e9a9a
	.xword	0x52da80871d846bae
	.xword	0xe5e6a6fbf3158e47
	.xword	0x86034249f7cd3068
	.xword	0x4e8994a78cabe6b5
	.xword	0xcf5a867f7b896ce8
	.xword	0xeee33339a390bccb
	.xword	0xeceea3c206e6e37d
	.xword	0x64ac7bee80ea2175
	.xword	0xc5aa7370211a779b
	.xword	0x83dd186c18b47b55
	.xword	0xec1f15bbc7f21935
	.xword	0x1aa235d6f6c7c6a3
	.xword	0x31656d7af3638d87
	.xword	0x95fd4e398d0abc39
	.xword	0x605e58276c384e37
	.xword	0xeb65aef5d991e8d1
	.xword	0x071eecb2a1514db6
	.xword	0xa9ab3cb60783350f
	.xword	0x5c3ae4e2f00da1d2
	.xword	0xdc6e5a1473fe06df
	.xword	0x6bec0a8b5571c91c
	.xword	0x035624971042c39a
	.xword	0x4a667139907d5140
	.xword	0x71c9bd1017d8699a
	.xword	0x7f1b3905671b7abd
	.xword	0xd3a0ede484ec7155
	.xword	0x13efd2a1af4591ea
	.xword	0xda65acd3b0b83ff2
	.xword	0x830e6cfccd9c84f0
	.xword	0xc1d4ce07fbf4ac6b
	.xword	0xee2d79abeed4d4ec
	.xword	0x5cf831bfcd82dc1b
	.xword	0x1623a9049f438155
	.xword	0x759bf59e61efc978



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
	.xword	0xacf21852a2efc418
	.xword	0xc666ad2b9ee9adfa
	.xword	0xa3c7488f86099264
	.xword	0xec98d696341f6ed8
	.xword	0x58a992b17c3cff53
	.xword	0xf2f3a297fb13d39f
	.xword	0x4af1a3264cf35ef9
	.xword	0xc84fcf50f65adf2e
	.xword	0xd41f7fc9065bc768
	.xword	0x28a40f31a4cf3511
	.xword	0x6a82a512cb667b38
	.xword	0x9127ed38d5cf4f16
	.xword	0x9b73cc7d590d95ce
	.xword	0x6c07228439ad8670
	.xword	0xf8035c7974bfdb5f
	.xword	0x00fb3ecfa948b88c
	.xword	0x837234e18bac6765
	.xword	0xab61d462abb93f87
	.xword	0x5bd6d6fc6097dfac
	.xword	0x2c18d75b568baa3f
	.xword	0xdce647d5528da16f
	.xword	0x0a34df7e9f052c9c
	.xword	0x82b273c28602bf90
	.xword	0x9578b34fb22220ab
	.xword	0x7136da90e1be3ddc
	.xword	0x030180ee42ce0d5b
	.xword	0x7b794a4f0d5c0a29
	.xword	0x83179d64a2468b1c
	.xword	0xf70dac788e38134e
	.xword	0xb70ddb837e8944b2
	.xword	0xbe7d9cc3b16f9f9c
	.xword	0xd32b7f97b1014eab
	.xword	0x8f8aabe23ddb6694
	.xword	0x81f74fc5d466b0b2
	.xword	0xa8bee2b6db26f735
	.xword	0x9dd236f5b016e5d5
	.xword	0x89d29e2d24252cad
	.xword	0xe811d937d34c8da1
	.xword	0x4a7ee6cfd8534afb
	.xword	0x04af898ccd92b3e8
	.xword	0xab26988f32d71c59
	.xword	0x398bc27e71ae44c0
	.xword	0x49960399503f45d4
	.xword	0x01081874edbc1b6c
	.xword	0x344dddefcfef9689
	.xword	0x5aa67156ef964822
	.xword	0x9edc42609f89c61f
	.xword	0x4a7a2d12c1071724
	.xword	0x8b36e8eb6db19c16
	.xword	0x4e3d99ff5c893d25
	.xword	0x5a4b86db2e922934
	.xword	0x04164b1fe3959ab9
	.xword	0x2e335c5550fecafc
	.xword	0xe6dbc7c6039ac3c1
	.xword	0x12e3173c3a50905a
	.xword	0xc1518eeeed086427
	.xword	0xc26ac962b912c1eb
	.xword	0x432b3289f0ab43b3
	.xword	0x4b2a9849340f77c4
	.xword	0x720793993cf41451
	.xword	0x5edadd6045130059
	.xword	0x1bd879192fcdef58
	.xword	0x2b97aeda35b2ac39
	.xword	0xa2a4ad830d6d8ab7



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
	.xword	0xb3b8fd72fd5b1c41
	.xword	0x2997d6b3f6a298d9
	.xword	0xc84bfb6d726f7966
	.xword	0xa02b94b3548b5b34
	.xword	0xf78c4f891300255e
	.xword	0x4ab4137f685b22d1
	.xword	0x1e337ea77e712e14
	.xword	0xe79518cea10ec3d0
	.xword	0xd0e833cd7bb6ac07
	.xword	0xa8c8425575f1c195
	.xword	0xf5ae41971710d7d7
	.xword	0x6d8aa37b48930626
	.xword	0x2a73ce9d0671257f
	.xword	0xaffa790319a3b223
	.xword	0x29b3e30f28cdf39e
	.xword	0x2ab0f0017a8b8bb3
	.xword	0xca48a92ec57f8601
	.xword	0x1e0ff318e60b6825
	.xword	0x4e0068471922238d
	.xword	0x5f446b8e05564f19
	.xword	0x098f80954a81576b
	.xword	0x156fdee8e00ce9e1
	.xword	0xf004bd4d1eecf75f
	.xword	0xa939e29de1059ed8
	.xword	0xd785f58a28e06eb8
	.xword	0x69f0c66af3f32ed0
	.xword	0x7bb4c1feb2cde098
	.xword	0x5039fe5996e67c3f
	.xword	0x5b75d5ab1d4416e5
	.xword	0x7ccb210bcbb5f456
	.xword	0xb229284f263ba693
	.xword	0xac56a31c1af197a0
	.xword	0x9ca516fb34655216
	.xword	0x232e68aa096feb8b
	.xword	0x18eb9ad6b54117ab
	.xword	0x24b4e8fe7adc6469
	.xword	0xa358de3fa7edacea
	.xword	0xf696ecfce505e4f1
	.xword	0x3e6d6824cadbdbdf
	.xword	0x7f8c267d693fb7ba
	.xword	0x6290b326235bb1a6
	.xword	0xdeea36f9ec1efd2b
	.xword	0x11b4f46c6026388f
	.xword	0xefd42d81f6426aef
	.xword	0x63846f0fb964896e
	.xword	0x50f391e2c0bbcb29
	.xword	0x222ca3ba4debbf65
	.xword	0x0ac3621d29bd410c
	.xword	0xb51475af457d514a
	.xword	0xcc9649ca61476958
	.xword	0x3dba575640f0b5ac
	.xword	0xf0395ae7f20aba5e
	.xword	0x71dcdd5ed599ce9c
	.xword	0x06b76fb4e151ecf4
	.xword	0x7e50f9986dd2ff7e
	.xword	0x4899197031c5b63c
	.xword	0x8c604bc5d46fab46
	.xword	0xcbfc39faa065ded3
	.xword	0xf86816a71ef13da5
	.xword	0x5d996735448905de
	.xword	0xc320ea1fc37d3639
	.xword	0xb6a6723fd5e12ca0
	.xword	0xfa4857745da298a4
	.xword	0xff22928c03104b21



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
	.xword	0x61ffa6369d97d3d7
	.xword	0xe1f2f0b51f9bb167
	.xword	0xa16f237f72c3c008
	.xword	0x6598d1aa9e0823cf
	.xword	0x228ec9176c751bf6
	.xword	0x79b1702154c0bd60
	.xword	0x13ec49ffe339a664
	.xword	0x8923b30bb938eabc
	.xword	0x977329a29ef10472
	.xword	0x58ea1669bcddcb08
	.xword	0x92d15c005e8d61f4
	.xword	0x139c851470f77e15
	.xword	0x68b05a19e8cf0196
	.xword	0x58186ef33fc3a93e
	.xword	0x289d9a8596d5f9b5
	.xword	0x960433609a3f31c6
	.xword	0xb4914d9fe3564c97
	.xword	0xc0d98f83087814cf
	.xword	0x907524b799ff6e2c
	.xword	0x9d74f0a35c714137
	.xword	0xd4b8a9bdaf2e452b
	.xword	0x8ce647725b88f2b5
	.xword	0x7237964faeeb0e8d
	.xword	0x31b04dab1e42408f
	.xword	0xb2cf83d543a72c65
	.xword	0xcaee15de39256eda
	.xword	0x30eaed5faadd49f7
	.xword	0x15c2eed0b5069f7f
	.xword	0x262072123cdc3274
	.xword	0x235c4481c0d4ec8e
	.xword	0xfa6bf31d27321f6b
	.xword	0x1e1727880131485e
	.xword	0x70fa2ed1844e2e26
	.xword	0xcd58957616081596
	.xword	0x56c986e19664a016
	.xword	0x3a63b53e946acf44
	.xword	0x000fe0f4b075ab41
	.xword	0xb7c108ae4d9032b6
	.xword	0xb3b40c65e97bf319
	.xword	0xa33812ee77d5c163
	.xword	0x2fba99fbeabf8f28
	.xword	0x5e15800be422c681
	.xword	0xeb9fa9d84d3727d3
	.xword	0x6e23713de805248c
	.xword	0x23421f5c0088d1b1
	.xword	0x67a7a197fb3acf65
	.xword	0xa695c84f1c17b76d
	.xword	0x46ee8ac37fdd086e
	.xword	0xe9fc229b8064934b
	.xword	0xd254f0b680ff8392
	.xword	0x89c7ee8b32cd54fc
	.xword	0x1aba5e4fedc2f6fe
	.xword	0xf194a40b61850b8d
	.xword	0x41686f7c2fed335f
	.xword	0x903796f7a35218c8
	.xword	0x7389af03e1705fe4
	.xword	0x482bf8bf3c148c64
	.xword	0xcbd84436898431c9
	.xword	0xad8fec44d659b2aa
	.xword	0xb9cb414998edccfc
	.xword	0x59f0a19b2ccf74fd
	.xword	0x060bb4dcfb0f93e8
	.xword	0x60b5b3bea932f7e6
	.xword	0x4c463113e21d9601



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
	.xword	0x6a472f2da3c604df
	.xword	0x7f4dce586ceb78cb
	.xword	0x689495f014da36b8
	.xword	0xb8475a3a7bfa0ce5
	.xword	0xad5a7ba665b79cb4
	.xword	0xf62c0ffbf39a6997
	.xword	0x1d1643cffdc56d40
	.xword	0x65b1005dc0860aa0
	.xword	0x8e1a98d1583ca08b
	.xword	0x5ef46a88745fd707
	.xword	0x48154f156a29481e
	.xword	0x34999c12c04b12bf
	.xword	0x5be3b06d439ded43
	.xword	0xa4d834b5801f0b53
	.xword	0xa8e0394847d4d584
	.xword	0xd558e7c383658b15
	.xword	0xda3110a4c2e5efc6
	.xword	0xc5ea2994717aa7f8
	.xword	0xcb2d7026740fd173
	.xword	0xfcfd71926cb62b43
	.xword	0xa1c38b4ed6c1febb
	.xword	0x4fc35cd1818f16f3
	.xword	0x361e6d9f66644f52
	.xword	0xea124904639d8ddf
	.xword	0x816dec66108b44ca
	.xword	0x5e7ac8dec29af7ae
	.xword	0x12700257a53b26bc
	.xword	0x9a420067e8a067d8
	.xword	0xe4d1714f93afd4dd
	.xword	0xbecf4ed66c57104d
	.xword	0x5c8e1d8b2205369c
	.xword	0xc8e2d36ceb0875e0
	.xword	0x2e2cfeb07380b5d3
	.xword	0x60db9cf7ee855598
	.xword	0x0fd68c783e303928
	.xword	0x51380da45a611270
	.xword	0x7f4326feaba83532
	.xword	0xb3fc63d926f13ee8
	.xword	0xd0137aafecc49d76
	.xword	0xf4b8740df3ea94a5
	.xword	0xe85a9d4a7d454547
	.xword	0x260df2f030c96902
	.xword	0x447a4fdb8888c139
	.xword	0x110638938c7f1288
	.xword	0xd14581c3935b47ef
	.xword	0x7e4ccdba65331e1f
	.xword	0xea6a26e811e21d93
	.xword	0x3e6d5701d25cfd3c
	.xword	0xff8e143f8c03dc05
	.xword	0xa30c0ca767cc585b
	.xword	0x970073bc3bf88e92
	.xword	0x67faad554f73ce28
	.xword	0x40455fa3c16bd05e
	.xword	0x57ce68f84a5908d9
	.xword	0xbd6791f8ecfac18c
	.xword	0x940c43450a193cbf
	.xword	0x76424a651962f318
	.xword	0xfeafc473028c7350
	.xword	0x03c08cdba698d25d
	.xword	0x114263a5ef79def0
	.xword	0x34ffcd13ccca7f03
	.xword	0x54464352ae0b97bf
	.xword	0xb9e51445c3de56d4
	.xword	0x9c25d2543d4c5b15



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
	.xword	0x2596f4d5c2be5e22
	.xword	0x29b2b66abe2d7d83
	.xword	0xb81aa5bc29dd51a0
	.xword	0x3f6e64a3ecf5bdb1
	.xword	0x732975d8ae0ff385
	.xword	0x9d7121d409125dc2
	.xword	0x4fc803b69e56f6cc
	.xword	0xf036d93947947030
	.xword	0x28c74978fdd765f0
	.xword	0xb1338b8f31e6a6d4
	.xword	0xe9eb845d60286aa7
	.xword	0xc63bf8ddf1bfe4f5
	.xword	0x0e8d635724ebac94
	.xword	0x7c6025059c481508
	.xword	0x4e91e09d76d425a6
	.xword	0x5272634539ae8e2a
	.xword	0x1183046d52c62737
	.xword	0x483fc9780e512217
	.xword	0x1cd9c5d9818bebaa
	.xword	0x77e0f5ec66115177
	.xword	0x840309a09c2a3f68
	.xword	0x91e03428888edd12
	.xword	0xcfad9029e510f8e6
	.xword	0xbdd153bdb01900e6
	.xword	0x3f3e3988bb2fc915
	.xword	0x0cb55c103911feea
	.xword	0x6a074d96761f83b9
	.xword	0x46376d394c94c0b1
	.xword	0x5d2c2603f6d74b34
	.xword	0x34608a181eafbdce
	.xword	0xe38c085a90c4ead8
	.xword	0xd5eeb38774cc00ef
	.xword	0x82cb4ec17bd55466
	.xword	0x8290b771ed7a1264
	.xword	0xdb7ae1719d211cc5
	.xword	0x60ec61e3b77265fc
	.xword	0x973f09b441865009
	.xword	0x1db76eb973314139
	.xword	0x3d550da691ef67d4
	.xword	0x600d96c247d878ed
	.xword	0x4385775882593d65
	.xword	0x373437b366c4b287
	.xword	0x9ef9d9f9950d2324
	.xword	0x8669d83728a95009
	.xword	0xb9c668b8531dbd5e
	.xword	0x29e0a5b1d3244a07
	.xword	0x4d1cf9b9bcb5f5a0
	.xword	0x7790528d36cef37e
	.xword	0x2393829f7c704e3a
	.xword	0xb9ce87d4b4ecc092
	.xword	0xa9ae6fa322df29f4
	.xword	0xcfb8d9b4cf4eefda
	.xword	0x5ddbb66f5cbf9636
	.xword	0x6e33e80e8cf71069
	.xword	0x56b358e5288e3e32
	.xword	0xc7c8b2c72a2c1bef
	.xword	0x436e55c9f471ec94
	.xword	0xc0475a771b11a211
	.xword	0x040a531920e48ced
	.xword	0xf4b2c6b42196362f
	.xword	0xae7d661ed056a68c
	.xword	0xaae1f59bf56451e6
	.xword	0x9a161f5bc8e94fad
	.xword	0xfc6e951447c428fe



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
	.xword	0x6ef709fec53c9093
	.xword	0x018298b246bcc716
	.xword	0x426246ad13bddcc1
	.xword	0xfcd6afe580fee3e4
	.xword	0x1ce6b1b99cb0e713
	.xword	0x020f409598d8e744
	.xword	0x6a56346ab0b47043
	.xword	0x2bdc4117d09ff476
	.xword	0x30ed3a3864e7871e
	.xword	0x17fac0d3c1272b4f
	.xword	0x2b3d25f8b285d935
	.xword	0xe1233d883c3e69d6
	.xword	0xd72b48923a199fb4
	.xword	0xb4a48b3d171676db
	.xword	0xbedc926004664548
	.xword	0xe282a15b47e69722
	.xword	0x8a9b915eaca7d3ce
	.xword	0x808c5cf38f2c566b
	.xword	0x85794fd4a24fe1b8
	.xword	0xc794818c5fc01b3a
	.xword	0x645142dffd1a14e4
	.xword	0x7fa0af254218c6a6
	.xword	0xdd47af6d5dc35d9b
	.xword	0x49f1e70e18e91f30
	.xword	0xa821e3ee694f8049
	.xword	0x1dcd91fbd6ac3c5f
	.xword	0xb94088f05b7a5240
	.xword	0xee12e26ec4d3ad2b
	.xword	0xb59a8e301c842e6b
	.xword	0xca4d07f52c5e8dca
	.xword	0xbb1b5a8dba4961de
	.xword	0x04d01b6ceeef58f9
	.xword	0xc64ab49056f66a9d
	.xword	0xe0c8ddd4aab8119e
	.xword	0x2e0ec2ac31f722d9
	.xword	0x5dc06f737fbe05c0
	.xword	0x80f7ce1374cdd151
	.xword	0x33a8b772096e18b0
	.xword	0xfa1b4d6ed0cd37e0
	.xword	0xbbaf3870f79872b7
	.xword	0xb5d470916d34712d
	.xword	0x1bb81b39c99bed55
	.xword	0x8656d78c4d9e15a2
	.xword	0x2ab4bc84ceb7145c
	.xword	0x8b6a507e6bb4ea35
	.xword	0xcfda08ead2331b2a
	.xword	0x08f7eefa2fbf874b
	.xword	0xe252b5335f8c7cbb
	.xword	0xac3789d2437a2caa
	.xword	0xa788ab09d390a4df
	.xword	0x70f27174860d382a
	.xword	0xbc9ecdef49462032
	.xword	0x5658a78c2c9f8a65
	.xword	0xef369b7b40e443b3
	.xword	0x39912441c6fdd8cd
	.xword	0x6881a38d5a5b68ec
	.xword	0x4a2b5451de3a512f
	.xword	0x7cde50b943fdcd3e
	.xword	0xb68a0dc0d3196c4d
	.xword	0xd441befca69fbd75
	.xword	0x093e09428b3f40e6
	.xword	0x7990b2a777bc7868
	.xword	0xc8fd080bd781f4fa
	.xword	0xd42c04a576357693



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
	.xword	0xdd83c350f3cd3713
	.xword	0x48703411e9f3c193
	.xword	0x8d74790711cbfbf3
	.xword	0x9862d79aa20862d4
	.xword	0x1a208e56dda79b3b
	.xword	0xba438694b6b74a17
	.xword	0xaee41b34e6fdab95
	.xword	0x70983b1afd8d5449
	.xword	0x689e57449875108b
	.xword	0x0500066757b2ecaf
	.xword	0x591154ee1845539f
	.xword	0x11279ca222d49afc
	.xword	0x99fbfe028baebdb1
	.xword	0xa81e302832136c98
	.xword	0x5f9561d56ef465a9
	.xword	0x3cf60ba48552756a
	.xword	0x3a2f9bd952c701c2
	.xword	0x50b73c20daadba97
	.xword	0x1a7cea39e10796c4
	.xword	0x911c36aeb8c7780c
	.xword	0xada3c1675e12b380
	.xword	0x266a6e1dfdf1713e
	.xword	0xe5843f1f8f0c1acf
	.xword	0x4155cbe11ac99031
	.xword	0xfbfa945a2c7a1af6
	.xword	0xbf3c09eeaa5a20f0
	.xword	0xba64531d954eb27f
	.xword	0xa8142c4158faa861
	.xword	0x7acb4e94107153bf
	.xword	0xe2ce7f360ba0b886
	.xword	0x50d749fd068178e4
	.xword	0x759f1c50d1a92799
	.xword	0x0e33b21f0c6f0d7a
	.xword	0x46b379f4e8028b38
	.xword	0x9e209b7e71e9e8bc
	.xword	0x4963e52e86637945
	.xword	0x5f88c2c2f38b1bd6
	.xword	0x4f8ced0e2d2230bc
	.xword	0x69b55ca14e7acce7
	.xword	0x5801c156726a73a6
	.xword	0x24579444b2285b01
	.xword	0xc1ac7db0cdbadcc6
	.xword	0xa92e9226aa05a849
	.xword	0x24b9fa2a080a3251
	.xword	0x698f82acc072c992
	.xword	0x0454618ff6bd3c09
	.xword	0xffae40c4bda6e987
	.xword	0xeb7afc82f1c021dd
	.xword	0xd8af844711bc7ab6
	.xword	0x43db11233b36b359
	.xword	0x055d4ed4f5034f3c
	.xword	0x305da674ed291515
	.xword	0x053e41eee62cff61
	.xword	0x0a43f72d216ee9e2
	.xword	0x1c20f78719d8fc0b
	.xword	0x0c00c302e53bccf6
	.xword	0x3bdf6e8f19473686
	.xword	0xbb6f58a563699633
	.xword	0x240c5bea2ec84531
	.xword	0x0fc7a26d29bfbb2d
	.xword	0x865b9e91f76e084b
	.xword	0x4aa4091be7a174fc
	.xword	0xbe49700599e113b8
	.xword	0x2834d2970196cd37



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
	.xword	0xee53e9e6d81c8ad0
	.xword	0xda9351a5db8af3f5
	.xword	0x0950ba71ffaff9c9
	.xword	0x99740201e50d249b
	.xword	0x5a1cc102c7481ce8
	.xword	0xbed8d8a132a9c4b6
	.xword	0x446d99ebc3560bd4
	.xword	0xbcb52a703e44034d
	.xword	0x1e4011519a11e4ac
	.xword	0x8792846009fd79d8
	.xword	0x38afac527afab712
	.xword	0x1f102c85a46c448d
	.xword	0x95bce26c184eccde
	.xword	0xc9c72c63e8bcc9be
	.xword	0x9f8df436185f0973
	.xword	0x7ff65cc0c456746d
	.xword	0xdd01f7b7451a6e27
	.xword	0xf91f0b295c0fa16e
	.xword	0x1cd477ad1daace1a
	.xword	0x4a1d0e6c9396c740
	.xword	0x5872618f59237d6a
	.xword	0x67f694d9c05ef5bc
	.xword	0xa76747538e6e4d51
	.xword	0x433256d5db7bc958
	.xword	0xf295049d716907e8
	.xword	0x75ff66e9a33270da
	.xword	0xa9ad2103b428ebf7
	.xword	0x9a92f0200bddbd7c
	.xword	0xb9e423dc2194e277
	.xword	0x1bec7f7a8f118d13
	.xword	0x6c1e5e7cb16902a9
	.xword	0x72d340e44b59e643
	.xword	0xc0bd73316778a78a
	.xword	0xc223d488877ed2fc
	.xword	0xd17ebefee0072e71
	.xword	0x0974a8b8438d6936
	.xword	0xd60c236b19bb04de
	.xword	0xe5b82efb13274b98
	.xword	0xeb52dfad33a38d60
	.xword	0x6741050a827087e7
	.xword	0x982d121bb08aa9c9
	.xword	0xbe61cdc2c7798e48
	.xword	0x547f2c8be983ce33
	.xword	0x48115989a4c5fcb2
	.xword	0x41d8c7d82b3938e8
	.xword	0xb8d9fba1525b6a67
	.xword	0x3431b3b02e5bcffc
	.xword	0x654efc9de36bd893
	.xword	0xb2e7a63f28b9551c
	.xword	0x6c75df07904d01f2
	.xword	0xb2db340b1f0190d5
	.xword	0x1c7ac3867da852ab
	.xword	0x9ffbf4c43be9026f
	.xword	0xd8c089205df5b510
	.xword	0x5920fc361ddfd105
	.xword	0x8fc9b1ceee04e4e1
	.xword	0x5ef4351b37244382
	.xword	0xebbbaa05871bbaa3
	.xword	0x876236d805543721
	.xword	0x3578722e656f7318
	.xword	0x7b97363605371c41
	.xword	0x2d17b4d0f276c04f
	.xword	0xdfbaf417fe525f6b
	.xword	0x3a49474cd76d04b9



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
	.xword	0xd605c0be8237eb47
	.xword	0xf6bfae667ca56aca
	.xword	0xc7556aed49211f9f
	.xword	0x0df368b814b550f1
	.xword	0x21952cd6cb88b40a
	.xword	0xd32ab7edbb8b2909
	.xword	0xf2e6c74d6bec9854
	.xword	0x234e3c47f88e5b84
	.xword	0xe7bca60c83e67e31
	.xword	0x37bad22f24a07e05
	.xword	0x58304fe30e132f20
	.xword	0x2b3b3ca9ca4c989d
	.xword	0x2da27ff1167ae36f
	.xword	0xa1ab333c7d6d5af0
	.xword	0x06a7c172782234e9
	.xword	0x3640510ba9c56c05
	.xword	0xf50c2dcfd60bb2f3
	.xword	0x8ddb10bc3d803c77
	.xword	0x6ca72d762a2aecfc
	.xword	0x10a2e1e065b17bf8
	.xword	0xf8ac0da2de848509
	.xword	0x0509ab7c94819ca0
	.xword	0x9457e079ab2fb87c
	.xword	0xf04b64bc5aafccd2
	.xword	0xb070f9c3c27d51c1
	.xword	0x5e164d7beba59d9f
	.xword	0xd27dbad4764ffc0e
	.xword	0x96d23131f77f6631
	.xword	0xd9adb03fd3bfd85c
	.xword	0x1c3ac9a1f41f1ccd
	.xword	0xa6c3261ddda3d9e3
	.xword	0xe37de4cb7c7df9a5
	.xword	0x7354b1b323adc48e
	.xword	0x97d9330706d642dd
	.xword	0x195c35e06f1118dc
	.xword	0xdc1cdf04c47fc642
	.xword	0x2fc4fbbd2e42f21f
	.xword	0xb01eeb28d606202a
	.xword	0x5817d70dde120a41
	.xword	0x21b5f3e564073f6a
	.xword	0x3a09481cdb427049
	.xword	0xa200fd7d15d401e9
	.xword	0xb7c668d1c7c4a58b
	.xword	0x268f02b9225a5300
	.xword	0xcd8c035f62311a84
	.xword	0x9e035b7c02cdc5b9
	.xword	0x7237e5e10b30aa8e
	.xword	0x0f6568ebcaf28c1f
	.xword	0xeec381b14f4ab9d2
	.xword	0xebd9876b6e69c28c
	.xword	0xf54b9eac108356bc
	.xword	0x87ccd7d29b20b4c3
	.xword	0xb6c6bd83678e64b2
	.xword	0x686ccaf5fff194d1
	.xword	0xa5cf1fa3c92898bc
	.xword	0xd64d7c2efe2a0335
	.xword	0x6361a644ecf1f317
	.xword	0xdb110ad19bdd2b2b
	.xword	0x997c4018a4250779
	.xword	0xdb90f8d03f958545
	.xword	0x1901bd96075241b7
	.xword	0x91294452cbb51dc1
	.xword	0x071f081d67b7c421
	.xword	0x902e01c1360da020



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
	.xword	0xa6040504e2abdea6
	.xword	0xefe8e019e3222fdd
	.xword	0xc82cdee3631b7dbd
	.xword	0x44686f33f4b58280
	.xword	0xf7e8f6aba130f512
	.xword	0x2b1eb5dd09290efe
	.xword	0xb54452ee2d409d29
	.xword	0x941bbe07e8eaed14
	.xword	0x2f5f9c9b08da9a01
	.xword	0x12924f29ba8448cc
	.xword	0xbee3d2fcc3593ec2
	.xword	0x548da713377dd427
	.xword	0xa52073213d9beef8
	.xword	0x44eae1811137add8
	.xword	0xab1463405694f7f0
	.xword	0x2f9c62d2b74dd13a
	.xword	0x66edce6d3211f766
	.xword	0xb3f10b2b54abf0fe
	.xword	0x4f8bee62ac2e15a1
	.xword	0x8f219991cc0e81bf
	.xword	0x0be91b7828515b09
	.xword	0x2715c0434131a607
	.xword	0x22e73bafcf3df721
	.xword	0xbf7b51c7e31354fa
	.xword	0x9ecc27ac602ce179
	.xword	0x42736ee12910b316
	.xword	0x39d1d36003dace1c
	.xword	0xfa2ee06b94c067a6
	.xword	0xdaa7b9a1e54ceeb5
	.xword	0x56dc7a1d28eb17dd
	.xword	0xc8ce003521e213f1
	.xword	0x5da6eb5dcc757904
	.xword	0xb5cc8375f517bcbc
	.xword	0xf8fd8fc015480e75
	.xword	0xf8f909f6c5597e33
	.xword	0x496be9ff738fa0e4
	.xword	0x23b4199a2190500b
	.xword	0x1ba91db7a6b6919c
	.xword	0xf93e29906e6c6f12
	.xword	0xd837eafc54e07f5e
	.xword	0xdabc6b6ba4fc9a69
	.xword	0xa8b717b73c728cad
	.xword	0xbe001e98aed89ca7
	.xword	0x7b3ac6834565962e
	.xword	0xe3c63ec7a2bdec07
	.xword	0x1ed88287a76e73ad
	.xword	0x65066f7d68bea040
	.xword	0x63838b3283f23cf2
	.xword	0xf65e2b9c7c2e0cc4
	.xword	0x141a3d6a9528673e
	.xword	0xb4bf951449dde651
	.xword	0x0a15f3db09a9ba36
	.xword	0xbc0e00e02d90e3d1
	.xword	0xc9252c26bf3bbfb0
	.xword	0xca0dd67570ceaee4
	.xword	0x36142f95c18490b4
	.xword	0xe8e64e767d411c1a
	.xword	0xba7888ccd4544145
	.xword	0x979f8cf4fdb60952
	.xword	0x3a71a50390b0423b
	.xword	0x1ca05c38e73b9ff6
	.xword	0xdcb79fd4bdc51003
	.xword	0x7754177660f7eee2
	.xword	0x4a43fc392ed13d0d



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
	.xword	0x5a9da59cefe50ae7
	.xword	0xe5ed561fe6531342
	.xword	0x90e883bdc99e1017
	.xword	0x1f8fd3bb448055e8
	.xword	0x2f3b3f793cd707b6
	.xword	0xf13bcf8e2e9f25c4
	.xword	0xfc3f542f7144721c
	.xword	0x968167e3a89eded8
	.xword	0x5991d0036e47d3cd
	.xword	0x001078717d05ff08
	.xword	0x5e7ecc426fc1ca6f
	.xword	0x5715a1fa47b6d011
	.xword	0x4e936e36f7c38f7a
	.xword	0xdaf9369f1b71423c
	.xword	0xc47051b3a77b80cc
	.xword	0x0d087251d6549821
	.xword	0x8340a4d0462b681d
	.xword	0xd4682888d0513d0e
	.xword	0x69622c00e3a1682a
	.xword	0x178c9c131cd37f42
	.xword	0xeed8c5884450e5eb
	.xword	0x40a5953973658c7f
	.xword	0xe456935387283720
	.xword	0x29bbd4bcffc5a725
	.xword	0xaf1e4a7c53ef5135
	.xword	0xbea11d13c289c940
	.xword	0xc2eb99f7a7da4c3d
	.xword	0x3725ebe25ab55cb5
	.xword	0x66bc8fc6fd34b9cb
	.xword	0xf499ea303b3f6d4d
	.xword	0x6c55c848f3e7d86a
	.xword	0x060729f75d38107b
	.xword	0x3b091af103807958
	.xword	0x4dcf0e67df441bd8
	.xword	0xd34600c5b1900ffe
	.xword	0xddeb72898c41bd10
	.xword	0xd554a079236a34fa
	.xword	0x11d6963d43084279
	.xword	0xb6c43fcf23ef4da8
	.xword	0xc67957e5f081a4f5
	.xword	0xa900c01107415f85
	.xword	0x0004bbc2d4333165
	.xword	0x5a3fcba5c8add385
	.xword	0xe6b8b91c5dd3124a
	.xword	0x9a0924324bbab750
	.xword	0xf4513ac85ecf8bb8
	.xword	0x3604ca5f3de2310b
	.xword	0x9d1413000cbd65be
	.xword	0x61333df901b4aed7
	.xword	0x973b3b566cdea3d3
	.xword	0xd2d04f453fd52ecc
	.xword	0xbfd8da033694207a
	.xword	0xfc1405d40321ebc9
	.xword	0xbbea9b2d4e809736
	.xword	0x78ea9e6e518207fa
	.xword	0x577eecb02ba504a7
	.xword	0x259615c646de0767
	.xword	0x71424d985db737ef
	.xword	0xabb8574c6a112f9b
	.xword	0x5f8762c9803b433e
	.xword	0xc30ee4a84822c719
	.xword	0x704e4c17ed2fa098
	.xword	0x1da93b2ad697cf0a
	.xword	0x5aa04d11e0293d31



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
	.xword	0x49178a4f17a2bc2b
	.xword	0xbdbceace7d7c3668
	.xword	0x15bb31f6371f4714
	.xword	0x9d6d15ed728ed172
	.xword	0x1890584e42fbe768
	.xword	0x54b7e3eec79b31e8
	.xword	0x3c3e3cc3814e4571
	.xword	0xeeb7aa6ef18e0e59
	.xword	0xf398b1ca0eadc900
	.xword	0xf2939d7bd9497734
	.xword	0x11339cc6af4e0683
	.xword	0x6df9c730026c545b
	.xword	0x775cf41342c42e36
	.xword	0x0d862acb2a1f91e3
	.xword	0x7352514512ceb87a
	.xword	0xe33622f6a329407e
	.xword	0x8807c4216061b9b7
	.xword	0x71eccc5247a575ea
	.xword	0x7f1cf48e2250c19b
	.xword	0xc2e301a99d281d09
	.xword	0xeb81eba04c44680e
	.xword	0x4c1ca5e7294595d8
	.xword	0x913ca1c0f3279248
	.xword	0x207cc8f07a7b48af
	.xword	0xb9211b4798d269ad
	.xword	0xfad72c2912f7c3e9
	.xword	0xdeab9b3bb92142cf
	.xword	0x5697f282eef85912
	.xword	0x31a060390c980ce7
	.xword	0x3f90bf0360e819d6
	.xword	0xf21bbef809daff15
	.xword	0x9a788dc5e1efa6ca
	.xword	0xede29efc85699244
	.xword	0x58fb2eb4735c52f4
	.xword	0x38956f65a2cfa062
	.xword	0x0efdedb10f2d1041
	.xword	0x9b454c0a3f14d773
	.xword	0xd69ac9a33be01909
	.xword	0x3bb4aebc70598a11
	.xword	0xa1acbbd0fc3480a6
	.xword	0x6ffebcb77ace1817
	.xword	0xa75743ed62836ec9
	.xword	0xa1aacf85e77d33e6
	.xword	0x7e339b071c4bbe31
	.xword	0x831ca9eba099387e
	.xword	0xd47c81fb644370e8
	.xword	0x917e7b19c07ad32a
	.xword	0xc73a180435b5a564
	.xword	0xb825a2c38798407d
	.xword	0x926f0b2ad1b936b6
	.xword	0x3572f67a90a8565b
	.xword	0x67fed566bd039476
	.xword	0xab7756c688592f83
	.xword	0xed35763532b0e19a
	.xword	0xd7fc8f849905fc35
	.xword	0xd8ea2627fa5efca8
	.xword	0x6f56fe65924c3ab6
	.xword	0xee4ffac68090e636
	.xword	0xb7b67144325db4b2
	.xword	0xfc634ef0ccbcc3f5
	.xword	0x58cd5b8e2be9a1bc
	.xword	0xa642ffb2e8fed94a
	.xword	0x7c0c5b6d89751f76
	.xword	0x13f2ffb6dfcdfad3



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
