// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: pio_rnd_basic3_rand_1.s
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
   random seed:	886135673
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

	setx	0x000000800e2d9050, %r1, %r9
	setx	0xb154c70ba217a4f6, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f2bd920, %r1, %r9
	setx	0x7c49d508d150b1f7, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c9fdea2418, %r1, %r9
	setx	0xea2838b0d5b7bd7a, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d2331f0ab8, %r1, %r9
	setx	0xa8108fc84818252f, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ec9d7b8668, %r1, %r9
	setx	0x715a7af485e4ae10, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f26037cd10, %r1, %r9
	setx	0xd3da91cd940a6593, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e221f38, %r1, %r9
	setx	0x2744d96f421839ae, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f454f28, %r1, %r9
	setx	0xbfad963b70ffa03b, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c1538bf340, %r1, %r9
	setx	0x3da9b8dd8d36d7ad, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000dc32a31500, %r1, %r9
	setx	0x404a59a3d5ff6ed9, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e0988fe2d8, %r1, %r9
	setx	0x46ca5c8e6d813f56, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000fc2c93c908, %r1, %r9
	setx	0x74e16d30dd04ad7b, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e7e0638, %r1, %r9
	setx	0xac0708d203d75a13, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800fbcd1f0, %r1, %r9
	setx	0x908f90021ecc23ee, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000cc06b3b6c0, %r1, %r9
	setx	0x305a4bd3fb2acbb5, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000dfb969d848, %r1, %r9
	setx	0xbe7fa229a63268af, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e616b05190, %r1, %r9
	setx	0xf4535d25725c7bb1, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000fed9a1e308, %r1, %r9
	setx	0xe310ad0f8c444f13, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800edd5040, %r1, %r9
	setx	0x28d24cc78d6bec49, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f4aa180, %r1, %r9
	setx	0xabd1a8da17acd97a, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c4d0928668, %r1, %r9
	setx	0x5fa2fd0d8fd286ee, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d30ada5f30, %r1, %r9
	setx	0x07431eec364fee80, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e4e9133bd8, %r1, %r9
	setx	0x95e12e41c2fa5e75, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f8bcb07d48, %r1, %r9
	setx	0xc7a9838b3ff4b158, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800ea97168, %r1, %r9
	setx	0xd14d0ccf303a2c8c, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800fa06e58, %r1, %r9
	setx	0xc7022768f064a4e1, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c54d454f90, %r1, %r9
	setx	0x9dd6519adbc1a8f2, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d7233180e0, %r1, %r9
	setx	0x9e71140ce77b853a, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e74dedb3a0, %r1, %r9
	setx	0x345c8343017ac069, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f6d4776530, %r1, %r9
	setx	0x0dc804d2c1570eef, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e6c1928, %r1, %r9
	setx	0x7d07b2a2b3017438, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f7df0c0, %r1, %r9
	setx	0x6180c5b1b6504496, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000ca9aeea710, %r1, %r9
	setx	0xab54c00408b6464e, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d3b8d2f238, %r1, %r9
	setx	0x2af4b31fdcd4c6df, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e47c961dd8, %r1, %r9
	setx	0x2bf5346520cee648, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f633f0b8d8, %r1, %r9
	setx	0x2d984d3c5c61c7fe, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800ecf0d70, %r1, %r9
	setx	0x78c0e166100e79c1, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f6fca50, %r1, %r9
	setx	0x1c34b501333c3fe3, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c70296f318, %r1, %r9
	setx	0x3509dd3d06bc527e, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d1fb08d750, %r1, %r9
	setx	0x3a4366b5b125eee2, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e2f398c3d0, %r1, %r9
	setx	0xccf2c35e2dad0d2f, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000fa8cf1a1d0, %r1, %r9
	setx	0x1b42e9f92eb96c87, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e9d3b08, %r1, %r9
	setx	0x62d36cc5c18a6954, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800fdbae60, %r1, %r9
	setx	0xd29cd4814c568fa4, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c44aa1de28, %r1, %r9
	setx	0x0221f0e61cd59780, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d3f0975ac8, %r1, %r9
	setx	0x913fb770773862a1, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e3a5829fd0, %r1, %r9
	setx	0x33024811eb23f5c2, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000fc22069ae0, %r1, %r9
	setx	0x019c20ad24c83818, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ec9d7b8668, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000d2331f0ab8, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000c9fdea2418, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800f2bd920, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000ca9aeea710, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800f7df0c0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e6c1928, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000fc2c93c908, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000e0988fe2d8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000dc32a31500, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000c1538bf340, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000e4e9133bd8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000d30ada5f30, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e3340d0, %r1, %r9
	setx	0x798b90401f4a7e59, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f249aa0, %r1, %r9
	setx	0x1dbb8671ca4b1449, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c24846fa18, %r1, %r9
	setx	0xa90308c8562c9b90, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000dcb73a58c0, %r1, %r9
	setx	0x48312ef284446dfd, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e760a8f6d0, %r1, %r9
	setx	0xdba7bbd6bc595593, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f01382cdb0, %r1, %r9
	setx	0x14803f957906491f, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e579198, %r1, %r9
	setx	0x37f9969338e13822, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800fd4a938, %r1, %r9
	setx	0x13a0a68831d9afaf, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c2d4415720, %r1, %r9
	setx	0x097cab8605c824b8, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000de1e58ade8, %r1, %r9
	setx	0x680f6868be8bbe70, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000ee33251510, %r1, %r9
	setx	0xf7800b3141bdb287, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000fe6fc6daf0, %r1, %r9
	setx	0x241de93bd83553be, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e01d0e0, %r1, %r9
	setx	0x9358c564e9f794b4, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800fc33eb0, %r1, %r9
	setx	0xe2ca3cfa22ee114d, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c96cc7d780, %r1, %r9
	setx	0x833da4ecaf86f0d9, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000dfbd2575d8, %r1, %r9
	setx	0xa60c9764c5c7384d, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e03491de20, %r1, %r9
	setx	0x96d8c453718bf72d, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f2868a7200, %r1, %r9
	setx	0x2a2f281f065b809e, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e6dd210, %r1, %r9
	setx	0x5cc44a7c7e576156, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f25a388, %r1, %r9
	setx	0x66fdf4e8c1a097b0, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000cc5b1d8da8, %r1, %r9
	setx	0xe0f9ebf8335710cc, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000df8063f3e8, %r1, %r9
	setx	0x9fb470c60983243e, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ee97b79040, %r1, %r9
	setx	0xcb0602c3f9e701aa, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000fa847cd520, %r1, %r9
	setx	0xcf6d4615b3794e8b, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e74dedb3a0, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000d7233180e0, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800ecf0d70, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000fed9a1e308, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000e616b05190, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000f8bcb07d48, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000e4e9133bd8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000d30ada5f30, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000c4d0928668, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800ed3c430, %r1, %r9
	setx	0xd68ab4e1f058032f, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f06a1b8, %r1, %r9
	setx	0x3ff4a86af1601bac, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c56f48ba38, %r1, %r9
	setx	0xaced6a69e2f0a09e, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000dfad3da8d0, %r1, %r9
	setx	0x0102ca96b736b360, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e41b1bf3a8, %r1, %r9
	setx	0x62ca8218292d3fb7, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f4816a7798, %r1, %r9
	setx	0x4dde7d9177912935, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800ee4f048, %r1, %r9
	setx	0xc51bd6dcc1ff59de, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f40b920, %r1, %r9
	setx	0xf503308023d7bb6e, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c15fcd4058, %r1, %r9
	setx	0xf54daf22e1d2cb21, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d800400a90, %r1, %r9
	setx	0xab31f2723c7683cf, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e78306afa8, %r1, %r9
	setx	0x91acfb7cc0683ae8, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f680341580, %r1, %r9
	setx	0xcb706da1177b9f0d, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e0e1ef0, %r1, %r9
	setx	0x9355e1f381bb6e18, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800fd150e8, %r1, %r9
	setx	0x0680cad7f0451269, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c9437fc848, %r1, %r9
	setx	0x2b097af23af94eca, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000db4745ada8, %r1, %r9
	setx	0xf464299aff8c7942, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e2585ef490, %r1, %r9
	setx	0x49bb83b421c3ef1b, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f46e1eea60, %r1, %r9
	setx	0xa50ca6e8e6fc578c, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800eeddb98, %r1, %r9
	setx	0x34703cc09023f123, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f657d18, %r1, %r9
	setx	0x158baf46654cd322, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000cea6986300, %r1, %r9
	setx	0x7f4550428d792a2b, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d0cce2fbc0, %r1, %r9
	setx	0x21af2a5f6f56aeaa, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e6c8295380, %r1, %r9
	setx	0xfbf102bdb6102364, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f42f7595a0, %r1, %r9
	setx	0xdb57ac2696d8bc05, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800ed3c430, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000f01382cdb0, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000e760a8f6d0, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000dcb73a58c0, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800fd4a938, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e579198, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000fa8cf1a1d0, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000e2f398c3d0, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000d1fb08d750, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000c70296f318, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800ea5a600, %r1, %r9
	setx	0x5d551e8b087c13d3, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f30dab0, %r1, %r9
	setx	0x1514c406ca6de886, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c7ee3b1f00, %r1, %r9
	setx	0xf723dc1227019fc5, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d2960b0ad8, %r1, %r9
	setx	0xee82640082c95a15, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e2a893af80, %r1, %r9
	setx	0xa0e49d023ec4e475, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f0ceec28b0, %r1, %r9
	setx	0xf8aaf3cc40b87720, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e99bcc8, %r1, %r9
	setx	0xe4b27502bfc5c9b0, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f962528, %r1, %r9
	setx	0x9af78c20f10f3008, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000cd2612c5d8, %r1, %r9
	setx	0x7e4141cfbc47bb62, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d48f2f7ca0, %r1, %r9
	setx	0x9a6a05ad5e13bd4a, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e7c2c600c8, %r1, %r9
	setx	0xccb8ce80d2e279d7, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000feb74f1e00, %r1, %r9
	setx	0x1ce190375adad887, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e353fd0, %r1, %r9
	setx	0xb256e9e3729f5851, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f48b1e0, %r1, %r9
	setx	0x64c31f6d337ff86e, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c9e5b142a8, %r1, %r9
	setx	0x93f57fe4d495eb72, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d4a8dd07c0, %r1, %r9
	setx	0xccce36eb8cb0590c, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000ef251bf970, %r1, %r9
	setx	0x767bf8a819178365, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000fa5ff69970, %r1, %r9
	setx	0x8e4a49456a832e3a, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e5025e0, %r1, %r9
	setx	0xdc3decb16a2aa416, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f7c6278, %r1, %r9
	setx	0x542b6ffb6ffacf2e, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c1d918c730, %r1, %r9
	setx	0x17fcdce12934915d, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000dd65c39490, %r1, %r9
	setx	0x935b845681a8f69f, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e6f11505c8, %r1, %r9
	setx	0x268ff0ced3797034, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f0540df0f0, %r1, %r9
	setx	0x698435b782bfb548, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f06a1b8, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800ed3c430, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000f01382cdb0, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000e760a8f6d0, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000dcb73a58c0, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800f40b920, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000db4745ada8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000fc22069ae0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000e3a5829fd0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000d3f0975ac8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000c44aa1de28, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800fdbae60, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e042180, %r1, %r9
	setx	0x91cb0da8545b8074, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f04a358, %r1, %r9
	setx	0xca7fbb064ed0e080, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c0ec7956e8, %r1, %r9
	setx	0xc04647317ad0606c, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000db4c950440, %r1, %r9
	setx	0x4abd74e06bc8612d, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000edf08aa408, %r1, %r9
	setx	0xbd3668af2980e5ea, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f8766ae7c0, %r1, %r9
	setx	0x8ab3c636d788ca83, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e4127f8, %r1, %r9
	setx	0x8e5f35cd09c433b3, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f13a0c0, %r1, %r9
	setx	0xbd3e82d92dca9a62, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000ce98ad2de0, %r1, %r9
	setx	0x978775b919436245, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d8145d4508, %r1, %r9
	setx	0xb17cc2ea749c4acf, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e1a5cd2678, %r1, %r9
	setx	0x0537eeecb66ea211, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f443c022c8, %r1, %r9
	setx	0x5871458ff2ca9704, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800ecee658, %r1, %r9
	setx	0xbbebed2d9ca847cd, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f13f740, %r1, %r9
	setx	0xb5384cd50939576c, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000cc9c6afe58, %r1, %r9
	setx	0x7288894ed44a4ec0, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000df0d687368, %r1, %r9
	setx	0x42d25ac03cb49514, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e3d878ef90, %r1, %r9
	setx	0x1b937bb7b77cc9ee, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000fc7f0dbfe0, %r1, %r9
	setx	0x92c225d55d695a2b, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e4ad498, %r1, %r9
	setx	0x956e61a991793951, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800fe04d40, %r1, %r9
	setx	0xd1ce8a893a83e669, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c42220d460, %r1, %r9
	setx	0xdf150960b5b1cafe, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000dd40b73660, %r1, %r9
	setx	0x6300f05f92294b43, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e30c7a7018, %r1, %r9
	setx	0x209a56af93880544, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f4a9f3f0f0, %r1, %r9
	setx	0x54447a7b0e15640b, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f249aa0, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800e3340d0, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000f6d4776530, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800e579198, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000f633f0b8d8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000e47c961dd8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d3b8d2f238, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000ca9aeea710, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800f7df0c0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e6c1928, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000c9e5b142a8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800f48b1e0, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000cc5b1d8da8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800f25a388, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e6dd210, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000fc22069ae0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000e3a5829fd0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000d3f0975ac8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e3073b0, %r1, %r9
	setx	0x2b0f3e2e5c929a89, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f0d3570, %r1, %r9
	setx	0xbf6ae43eb7c76bf0, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ce018595b0, %r1, %r9
	setx	0xb179216634163d8e, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000daa369d0a8, %r1, %r9
	setx	0xedd560773941f567, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e2ba25be88, %r1, %r9
	setx	0x22cb5bd8294aaa14, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f4eafeebc0, %r1, %r9
	setx	0x5292f5864b6d4d28, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e2a6218, %r1, %r9
	setx	0x7c4ecfcb65040033, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f1a5b68, %r1, %r9
	setx	0xc8d41eed18cf232f, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c1c6b4dd18, %r1, %r9
	setx	0x41cfdb7b74a1437f, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000df1a5fe278, %r1, %r9
	setx	0xc932ce22b1a8128a, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000edd609a610, %r1, %r9
	setx	0x8fc5ddb842361c25, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f6536b2e68, %r1, %r9
	setx	0xb115c8397b2059a5, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e8344b8, %r1, %r9
	setx	0x3e0cc76c82333055, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800fe656b8, %r1, %r9
	setx	0xde3d763e4b9c4214, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c9c31ac630, %r1, %r9
	setx	0x26a8c2c98268c190, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d4b2bc65a0, %r1, %r9
	setx	0x0747b882018afc61, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000eb1e923240, %r1, %r9
	setx	0x3ddbebe859d879f9, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f26aae8ce8, %r1, %r9
	setx	0x0d50609524cf4abc, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800ead9be8, %r1, %r9
	setx	0x6af501d582bc2045, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800ff48e40, %r1, %r9
	setx	0x10c2dc303bc13679, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000cc5d0c08e8, %r1, %r9
	setx	0xc48640408ebd3473, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000da1e586d20, %r1, %r9
	setx	0x61780ba788b0f690, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e6cbe45328, %r1, %r9
	setx	0xe12b96b1fa52dea2, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000fc1d80d778, %r1, %r9
	setx	0xf281a540f00288bf, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f30dab0, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800ea5a600, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000f4816a7798, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000e41b1bf3a8, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000dfad3da8d0, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000c56f48ba38, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800f06a1b8, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800f962528, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e99bcc8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e0e1ef0, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000f2868a7200, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000e03491de20, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000dfbd2575d8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000e30c7a7018, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000dd40b73660, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e68dcd8, %r1, %r9
	setx	0x660aaece9751c261, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f4b80d8, %r1, %r9
	setx	0x6718e375dc9260f6, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c2abdd1468, %r1, %r9
	setx	0x718eed832266e40c, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000db0a9cc220, %r1, %r9
	setx	0x097aad977455972e, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e40e4fc240, %r1, %r9
	setx	0x0b7570bc9934519e, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f6414a00d8, %r1, %r9
	setx	0xa6b62030e385a56f, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e41bea8, %r1, %r9
	setx	0xbaa6576d9a5bc2ea, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800fce73a8, %r1, %r9
	setx	0xa676b33214603956, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000ce29e1c558, %r1, %r9
	setx	0x760968a2921adcc3, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d929d0ea10, %r1, %r9
	setx	0xe3e4f6409d9dd61d, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000ec23a69480, %r1, %r9
	setx	0xe26eb725089a4e53, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f045560e98, %r1, %r9
	setx	0xc20a0ec8b55779c3, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800ef3bf70, %r1, %r9
	setx	0x3bc9924f038876d2, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800fba8058, %r1, %r9
	setx	0x8b48fb311b46e089, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000cc7e043460, %r1, %r9
	setx	0x8d1191b07b2322f4, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000db3a58cca0, %r1, %r9
	setx	0xe204e0d65200c302, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e46639bd10, %r1, %r9
	setx	0x2bb914eea8f2353d, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000feb39ffaf0, %r1, %r9
	setx	0x0e30eef6b01d6c2b, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e5f9e48, %r1, %r9
	setx	0xb635ab4871861d8d, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f9c0fd8, %r1, %r9
	setx	0x1d59128f65ae68f4, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000cfbb890db0, %r1, %r9
	setx	0x6990b8abdcce157f, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000dbbe6304b0, %r1, %r9
	setx	0xf69d1676672b2819, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e13d5589f0, %r1, %r9
	setx	0x8109754aaeaf5c94, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f069921fb8, %r1, %r9
	setx	0x4f2f5bb20e901e15, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800ea5a600, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000f4816a7798, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000e41b1bf3a8, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000dfad3da8d0, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000c56f48ba38, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800f06a1b8, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800ed3c430, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000f633f0b8d8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000db4745ada8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000c9437fc848, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000c42220d460, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800fe04d40, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e4ad498, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800ed32950, %r1, %r9
	setx	0xb1cb69f02c8c8e19, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f5fb5f8, %r1, %r9
	setx	0x82c86b7489c3c2ea, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c5423eccd0, %r1, %r9
	setx	0x435d7a1a00c269e5, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000de6cfbd920, %r1, %r9
	setx	0x88fb50ca0564da58, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e346ad3d50, %r1, %r9
	setx	0xb16669f17037a9d8, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f4804a1cd0, %r1, %r9
	setx	0x346630683eae2f93, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e28aad0, %r1, %r9
	setx	0x54ff7fc48f1634d4, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800fe9b710, %r1, %r9
	setx	0x2ea4bcba6464d6bb, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c2a8176030, %r1, %r9
	setx	0xd9e71b43fbf6917a, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d69a938400, %r1, %r9
	setx	0x1072c318fe23d659, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000ee1d65f960, %r1, %r9
	setx	0xbdd96cf7d2738d89, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f0767d9e40, %r1, %r9
	setx	0x76b09caaa6f54356, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800ee9fd30, %r1, %r9
	setx	0x91aa8d952bb530c8, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f5cd3e0, %r1, %r9
	setx	0x854ae5db2bb91446, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c2d4a2f4d8, %r1, %r9
	setx	0xf18d63c343f8f30c, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d3082fe6d8, %r1, %r9
	setx	0x4a468c890432ae0c, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000eecd3a68b0, %r1, %r9
	setx	0x568d4358567c2fbc, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000fa204b7230, %r1, %r9
	setx	0xbbcbeb53e52ad78b, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800eabb2e8, %r1, %r9
	setx	0x65780b227675ee9e, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f055990, %r1, %r9
	setx	0x366ea3280ecb3d6c, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c70e6a3c28, %r1, %r9
	setx	0x78b8061ae89fe2c9, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d260f9e880, %r1, %r9
	setx	0x11b310ed7cdba60e, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ef2ed7ac70, %r1, %r9
	setx	0x097b9400aa9967c6, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000fe17257658, %r1, %r9
	setx	0x27359b255fdd517f, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800e68dcd8, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000f4eafeebc0, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000e2ba25be88, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000daa369d0a8, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000ce018595b0, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800e6c1928, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000fc2c93c908, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000e0988fe2d8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000dc32a31500, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000c1538bf340, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800f454f28, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000e46639bd10, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000db3a58cca0, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000cc7e043460, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800fba8058, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800ef3bf70, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000f26aae8ce8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800edbd020, %r1, %r9
	setx	0x85a7e92e517dd88a, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f354a98, %r1, %r9
	setx	0x6d9ad4e5355d6d22, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c6b4aee2a8, %r1, %r9
	setx	0x66f9ab76da8cdf52, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d1c666af28, %r1, %r9
	setx	0x8cd3823a8fb8d832, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e7960401b8, %r1, %r9
	setx	0xa389638210b14e35, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000fc4c3e1ed0, %r1, %r9
	setx	0xadcad391d08bc62d, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e6730e0, %r1, %r9
	setx	0x4a14b9bfeb898287, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f6cda70, %r1, %r9
	setx	0x70b781a84af3913b, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c93e7bafe8, %r1, %r9
	setx	0xff790a6d398e2f8e, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000da5ea2f8a8, %r1, %r9
	setx	0x545f2b14bc8da244, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e68c21db30, %r1, %r9
	setx	0x3ef9f2b9c78d226e, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f8b9108600, %r1, %r9
	setx	0x32563e2b9ff0a2ed, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e2a7370, %r1, %r9
	setx	0x07fad32f34a1f172, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f98d550, %r1, %r9
	setx	0xb286d47fa0e5ea12, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c733ce2bf0, %r1, %r9
	setx	0x45afb9f27aec5b4f, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d856eab7c0, %r1, %r9
	setx	0x506a330b5dc68578, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e737e574f0, %r1, %r9
	setx	0xc7c77a60a1245769, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f666e4fe60, %r1, %r9
	setx	0xe6e3b4a1dd6824a0, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800ef24c00, %r1, %r9
	setx	0x9753f68647987601, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f88f328, %r1, %r9
	setx	0x3f447547028aff63, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c38de797b8, %r1, %r9
	setx	0x37ef03d6ae623583, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d86e9639a8, %r1, %r9
	setx	0xbfcbbcc308cb301d, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e40b0c99f8, %r1, %r9
	setx	0x23d225256a453716, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f2b13a07c8, %r1, %r9
	setx	0xdfeaf3d4c8f6970e, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800e68dcd8, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000f4eafeebc0, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000e2ba25be88, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000daa369d0a8, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000e7c2c600c8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d48f2f7ca0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000cd2612c5d8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800f962528, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e99bcc8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000f680341580, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000db4745ada8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000c9437fc848, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800fd150e8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800e0e1ef0, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000f2868a7200, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000e03491de20, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000dfbd2575d8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000c44aa1de28, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e9023f0, %r1, %r9
	setx	0x754f0dc1d78e2083, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800fc53900, %r1, %r9
	setx	0xb23f2cb8b5216431, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c58fd34360, %r1, %r9
	setx	0xe72bcc82b098fe45, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d81daa2448, %r1, %r9
	setx	0x274d1e428f338474, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e21c2bd138, %r1, %r9
	setx	0x058c0d920f6a2222, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000fcca1653d0, %r1, %r9
	setx	0x67461bf0cd6f7797, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e5d7850, %r1, %r9
	setx	0xe1ba461389febcf7, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800fe5dca8, %r1, %r9
	setx	0xc8eecd60b08fbcd2, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000cbccd7f918, %r1, %r9
	setx	0xf693c7e4e1d89a31, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d37b0d5460, %r1, %r9
	setx	0x000fb9c4719becd7, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000ec4cddbdb0, %r1, %r9
	setx	0x2d7f3794b4307feb, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000fadb4a2d00, %r1, %r9
	setx	0xcfb3fe8c16c51de4, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e800c70, %r1, %r9
	setx	0x92b6ed4f76a57e9c, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800ff66968, %r1, %r9
	setx	0x93a082c25323c59b, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c4f5571eb8, %r1, %r9
	setx	0x29ab4a13d28529de, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d14091b1a0, %r1, %r9
	setx	0xb3963d148ffaa069, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e0d2ae0088, %r1, %r9
	setx	0xc21349cfd77dcf3b, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000fc26d611d8, %r1, %r9
	setx	0x7a7714d259872d4c, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e43ee08, %r1, %r9
	setx	0x287c7d0cfd015cc7, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f07bb98, %r1, %r9
	setx	0x099ccc3356ec5caf, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c443e2dc38, %r1, %r9
	setx	0x0d119e6adeec5c47, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000da67dfc2f8, %r1, %r9
	setx	0xe519b59501864a49, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e9eba66050, %r1, %r9
	setx	0xf4d839096f25e208, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f6bb97e1c0, %r1, %r9
	setx	0xe5421af8762f0a63, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f4804a1cd0, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000e346ad3d50, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000f2868a7200, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800e9d3b08, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000f8bcb07d48, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000e4e9133bd8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000d30ada5f30, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e2a4d60, %r1, %r9
	setx	0x12fdc225a8a69283, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800fc8d4a8, %r1, %r9
	setx	0x01e2da3df6b3bbb8, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000cb097764b8, %r1, %r9
	setx	0x04a269d4da58c758, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000dd2ce55ba0, %r1, %r9
	setx	0x5081492f91f8e494, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ef8c1393d8, %r1, %r9
	setx	0x726e7530a7136f47, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f8ef441dc0, %r1, %r9
	setx	0x3a46a7090871c755, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800ea12638, %r1, %r9
	setx	0x9ed0f76ec926f11a, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f041450, %r1, %r9
	setx	0x1c9b4d93cac8001a, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c210939920, %r1, %r9
	setx	0xc11aaa882c4cbadc, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d41b9501d0, %r1, %r9
	setx	0x80ee89a4aab6391a, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e18d6ee428, %r1, %r9
	setx	0x5649c261722847a1, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000fef2ab38a8, %r1, %r9
	setx	0xd499b8e37b217b9e, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e497a30, %r1, %r9
	setx	0xce7eedd13e7801c7, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f453568, %r1, %r9
	setx	0xca754014c219f96f, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000cf7009d668, %r1, %r9
	setx	0x3fb09fa3a3b53cf6, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d478ee1d00, %r1, %r9
	setx	0x0f9d2a31ef2405be, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000ec6f755218, %r1, %r9
	setx	0xb8a9c4eee8e33d59, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f2e140ff78, %r1, %r9
	setx	0x0b44e7c75302e59a, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e54ce90, %r1, %r9
	setx	0xe18e4b262271611b, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f73c3f0, %r1, %r9
	setx	0x59465f53322b6fff, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ca3a23d520, %r1, %r9
	setx	0xd898f77819790101, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d2122e0e20, %r1, %r9
	setx	0x9f34e758ac40a8dd, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ea7fe1d1c8, %r1, %r9
	setx	0xa2beebfa90463ef8, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f41f77ff18, %r1, %r9
	setx	0x349e445edae273d3, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ee1d65f960, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d69a938400, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000c2a8176030, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800fe9b710, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e28aad0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000c9e5b142a8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800f48b1e0, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000c38de797b8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800f88f328, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800ef24c00, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000fe17257658, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000ef2ed7ac70, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e717888, %r1, %r9
	setx	0x92167c85c7568a78, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f13c660, %r1, %r9
	setx	0xf94d3b6da9c7c8f9, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c354e618a8, %r1, %r9
	setx	0xad98256dd9cc2e29, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d669ab83a8, %r1, %r9
	setx	0x9521bb96b11a2718, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e77a4b1c10, %r1, %r9
	setx	0x04e56d5dd64b5e28, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f48f80efd8, %r1, %r9
	setx	0x30e4de1fb21dbad4, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e47d070, %r1, %r9
	setx	0x8943639f1d1cc188, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f59ef08, %r1, %r9
	setx	0x488ece4e7c16cc9e, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000cb8028fdf0, %r1, %r9
	setx	0xe90ec9d694c01571, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000ddd4b99fe0, %r1, %r9
	setx	0xfc272f7c0c6c7a0f, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e91aa36380, %r1, %r9
	setx	0x8381bcbf91b2aa5e, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000feddeb6a38, %r1, %r9
	setx	0x1e01ac1a270de33f, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800ef17968, %r1, %r9
	setx	0x1a7484559872b298, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f61df98, %r1, %r9
	setx	0xdd93418d60adbcf2, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c7615acbe8, %r1, %r9
	setx	0xb0d067c3852a8876, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d90445d378, %r1, %r9
	setx	0x27b86b1159b0ce21, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000ec80ba0ea8, %r1, %r9
	setx	0x6e71a52a76e0a33d, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f0f630e000, %r1, %r9
	setx	0xa47e538bd25cdcec, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e3d1088, %r1, %r9
	setx	0x093937d3c0943cbb, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800fc98c20, %r1, %r9
	setx	0x833caefa12b6aa5a, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c1480fafa0, %r1, %r9
	setx	0x833dcfd647715b47, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000db62937460, %r1, %r9
	setx	0x990d064f15de6e68, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e3ee78ac90, %r1, %r9
	setx	0xa609fb3166ab54d8, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f207d07060, %r1, %r9
	setx	0x3d0efefbff0bab7a, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e2ba25be88, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000daa369d0a8, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000ce018595b0, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800f13a0c0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e4127f8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000feb74f1e00, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000e7c2c600c8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d48f2f7ca0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000cd2612c5d8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800f962528, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d3082fe6d8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000c2d4a2f4d8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800f5cd3e0, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800ee9fd30, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000fe17257658, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000ef2ed7ac70, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e976dd0, %r1, %r9
	setx	0xb280b9a115242a71, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800fd48e80, %r1, %r9
	setx	0xe72d7fddbe14eae2, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c09b7607c0, %r1, %r9
	setx	0x502d825c26a3e240, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000dd104a2088, %r1, %r9
	setx	0x96de4a7819145a75, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ea6e713c58, %r1, %r9
	setx	0xf8ca9a1ae426249c, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000fcf20b3498, %r1, %r9
	setx	0xd09950ab71a2b3b5, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800ed94900, %r1, %r9
	setx	0xcceccae168acf43e, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f1e7ef8, %r1, %r9
	setx	0x7b2e0e72aa8dd35f, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c2dd5f55b8, %r1, %r9
	setx	0xc18b1052797266a4, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d5903af110, %r1, %r9
	setx	0xab4dc259c0db84ed, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e1c48ba860, %r1, %r9
	setx	0xe528bf6e382311ea, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f2c19fb070, %r1, %r9
	setx	0x3921736e19acc977, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e233db0, %r1, %r9
	setx	0x95181447748d612c, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f128da8, %r1, %r9
	setx	0xf763ddeadc227fac, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c60964c668, %r1, %r9
	setx	0xd763284d91b21eac, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d09d7a2248, %r1, %r9
	setx	0x3d2767ee298d8cc4, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000ec62b18738, %r1, %r9
	setx	0x64327c7ec41011d3, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f8ebfc30a8, %r1, %r9
	setx	0x5ac49603962bb5ca, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800eefa6d8, %r1, %r9
	setx	0x447a6d3b2353c8c6, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800ffcce38, %r1, %r9
	setx	0x4e00e0834f335af0, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000cb84c52010, %r1, %r9
	setx	0xa6f443af1a57515e, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d5ec782078, %r1, %r9
	setx	0x5f593a6410c519f2, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e965ed9c28, %r1, %r9
	setx	0x1990f79fca0f4710, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f0520acdd0, %r1, %r9
	setx	0x6a3b66c423bec241, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800e717888, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000f8ef441dc0, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000ef8c1393d8, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000dd2ce55ba0, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000cb097764b8, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000c2d4415720, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800fd4a938, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e579198, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000f633f0b8d8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000e2f398c3d0, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000d1fb08d750, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000c70296f318, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800f6fca50, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800ecf0d70, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000fed9a1e308, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000e616b05190, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000db62937460, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000c1480fafa0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800fc98c20, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e6a9990, %r1, %r9
	setx	0x0054398c91cc4319, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f592e78, %r1, %r9
	setx	0xce3780952099e207, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000cee68cc518, %r1, %r9
	setx	0xa84afd6dfbc1d62b, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d080c19c08, %r1, %r9
	setx	0x9eea8329cebdfddb, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e1a58dff20, %r1, %r9
	setx	0xbea100c00e1f3d3e, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f6ceb51288, %r1, %r9
	setx	0xc371bad0b4f54cb0, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e2c12d8, %r1, %r9
	setx	0x9671f12bccf9589a, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800fae1428, %r1, %r9
	setx	0xf5a1dcf4c0c98a62, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c78937a6c8, %r1, %r9
	setx	0x586f63c29eaf89ab, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000db0ac92598, %r1, %r9
	setx	0x401a7fda5bfc913d, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e7a65a7980, %r1, %r9
	setx	0x2ced3da425754093, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f8e0ebfe68, %r1, %r9
	setx	0x92946382aecfe7b6, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e33c1f0, %r1, %r9
	setx	0x3ecd79942b9b4949, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f829d38, %r1, %r9
	setx	0x8d5594005c14329d, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c881fa7178, %r1, %r9
	setx	0x46a1240f392f6165, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d05c864218, %r1, %r9
	setx	0xeebee13d0159c9fa, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e89c3fd880, %r1, %r9
	setx	0xc3c21f4755d92b6d, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000fac55ceba0, %r1, %r9
	setx	0xcdc47bc59f4e1bb4, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800ea7a230, %r1, %r9
	setx	0x24079746560bd7da, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f5f3190, %r1, %r9
	setx	0xeeb3366dc97ea4f0, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c980da6490, %r1, %r9
	setx	0x69bb12794e3a8cfb, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d68e6a9c40, %r1, %r9
	setx	0x5f971ee97b8c5a9e, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e5a2273918, %r1, %r9
	setx	0x86236de74700e103, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f483284cd8, %r1, %r9
	setx	0x42ba55d59861da4b, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e7960401b8, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000d1c666af28, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000c6b4aee2a8, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800f354a98, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800edbd020, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800e4127f8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000feb74f1e00, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000e7c2c600c8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d48f2f7ca0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000ec6f755218, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000d478ee1d00, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000f41f77ff18, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000ea7fe1d1c8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000d2122e0e20, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000ca3a23d520, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e5775c0, %r1, %r9
	setx	0x14d2456f8ff8a2bd, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f1cfb68, %r1, %r9
	setx	0x6059aa2675b7209d, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ce758ac478, %r1, %r9
	setx	0xa7c4afcbeb424e4c, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000dda2ae1ed8, %r1, %r9
	setx	0xcaae52b906f2f7a6, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ecd0d109e8, %r1, %r9
	setx	0x1495fa311de0ed8c, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f4c60dadb8, %r1, %r9
	setx	0x4ea221bba8777646, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e984ed0, %r1, %r9
	setx	0x4aa8edebb79ee614, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f28ca58, %r1, %r9
	setx	0x39377154ad2798c9, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c8d2d58f48, %r1, %r9
	setx	0x7557a316dc628307, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d125969cb0, %r1, %r9
	setx	0x91ac6cf4d33799e2, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000ec0e04adf8, %r1, %r9
	setx	0x092367790e925350, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f2aa45fc08, %r1, %r9
	setx	0xc267a90eb7e67ff6, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800ee62308, %r1, %r9
	setx	0x7db73405f4a97b75, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f2ed3d8, %r1, %r9
	setx	0xa0636b97ff001c78, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000cad7baafe8, %r1, %r9
	setx	0xadef1f53ba924c18, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000ddbbb7d4e8, %r1, %r9
	setx	0xd54d80e8cf4786d7, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e24a2c9ae0, %r1, %r9
	setx	0x24bd0df932145965, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000fe0f203fe8, %r1, %r9
	setx	0xa8e574f245b8b0fd, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e7ae0e0, %r1, %r9
	setx	0x2f0c709d52e87540, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f629708, %r1, %r9
	setx	0x6f3f976002453656, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000cedd86af28, %r1, %r9
	setx	0xe278cf053528917a, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000da59900fb0, %r1, %r9
	setx	0xfb694c55ae68f568, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e24ce833d8, %r1, %r9
	setx	0x8ae00dc0ae6bcd3d, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f6b5b793a8, %r1, %r9
	setx	0x4fa7b6bd873d83ca, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f354a98, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800edbd020, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000f4804a1cd0, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000e346ad3d50, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000de6cfbd920, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000c5423eccd0, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800f5fb5f8, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000fc2c93c908, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000e0988fe2d8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800ff48e40, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800ead9be8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000f4a9f3f0f0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800ecef308, %r1, %r9
	setx	0x7322cc6f81b93948, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800ff08188, %r1, %r9
	setx	0xad01de3f42cb3fa9, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c59d20ad78, %r1, %r9
	setx	0xb8b660dab87616cc, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000dc2358a038, %r1, %r9
	setx	0xd909b9886a5d683d, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e1c7ae88b0, %r1, %r9
	setx	0x9bad4280d3fff668, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f6c0bc9ed0, %r1, %r9
	setx	0x947c089df56ed2a4, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e910788, %r1, %r9
	setx	0x3ebde6429c403878, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f6c82f8, %r1, %r9
	setx	0xcd6f6facfe556957, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c195875f00, %r1, %r9
	setx	0x4d34d09dd1e11f00, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000dac68b1588, %r1, %r9
	setx	0x69a2de3c78ae193d, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e3631df518, %r1, %r9
	setx	0x0be0b4506a730b2f, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f8dd7c1ea0, %r1, %r9
	setx	0x36894c318c90acd7, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800ecae0b0, %r1, %r9
	setx	0x74a1deb82d268304, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800fc68420, %r1, %r9
	setx	0xc7e80bd965721c74, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c7656bc908, %r1, %r9
	setx	0x9bf69cf4cac62548, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d66bacbe48, %r1, %r9
	setx	0xf1d5430fa9dddc65, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e4458dad60, %r1, %r9
	setx	0xcb5c8f64552e7488, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f0a1ea1de0, %r1, %r9
	setx	0xaa54972c46707572, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800eda2658, %r1, %r9
	setx	0x28f0e64f3e8c0eff, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f413aa8, %r1, %r9
	setx	0x221b821402681c6a, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c3824cab08, %r1, %r9
	setx	0x52f2a0ef24838ad3, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d9f3689958, %r1, %r9
	setx	0x5f65577c8a4f7283, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000edf928fbf0, %r1, %r9
	setx	0x62609a767cbcc53e, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f80fe58ff0, %r1, %r9
	setx	0x357836008c1d1ab9, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800fc53900, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800e9023f0, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000fc4c3e1ed0, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000e7960401b8, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000d1c666af28, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000c6b4aee2a8, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000ca9aeea710, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800f7df0c0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000feb39ffaf0, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000e46639bd10, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000db3a58cca0, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000cc7e043460, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800fba8058, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800ef3bf70, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000f26aae8ce8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000f6bb97e1c0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e154c10, %r1, %r9
	setx	0x9324dad90cf24198, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f404d58, %r1, %r9
	setx	0xb2ffbd18272788dc, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000cd9322a9c0, %r1, %r9
	setx	0xc521d6f61df1aa03, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d91bcd5540, %r1, %r9
	setx	0x60fad96c962fbb48, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e034f474e8, %r1, %r9
	setx	0x47dda01f7c362a30, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f2b27ed2a0, %r1, %r9
	setx	0x304bb5f702ff8d47, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e366da0, %r1, %r9
	setx	0x2c6f6746e3698452, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f3136d8, %r1, %r9
	setx	0x8ea179713b5c97b7, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c42fcd4aa0, %r1, %r9
	setx	0x3e9d18b20e157241, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000dcfc4a4268, %r1, %r9
	setx	0x98f597265897b0f7, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e3fc3d6950, %r1, %r9
	setx	0xa08aedec666c6332, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f6243a27e0, %r1, %r9
	setx	0x54d09fbbaf6b878e, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e0950c0, %r1, %r9
	setx	0x233ca4b2277dad08, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f13c870, %r1, %r9
	setx	0xe83081c800c0c17c, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c969977528, %r1, %r9
	setx	0x54fc3ef055d2db79, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000de12c6a450, %r1, %r9
	setx	0x5330682954dbc785, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000ef74d7ac78, %r1, %r9
	setx	0x77607e45a3e018fe, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f47ac614f0, %r1, %r9
	setx	0xd6f08e751d8552f1, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800ee49090, %r1, %r9
	setx	0xd8c2cd1866707a62, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f0ad0f8, %r1, %r9
	setx	0x42219e68e442ade9, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000cc9631c3c8, %r1, %r9
	setx	0x6c382d29495711fe, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000da0bf72608, %r1, %r9
	setx	0x4fcc4756421801aa, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e2236703c8, %r1, %r9
	setx	0xc84a759932f6019d, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f2694ecc40, %r1, %r9
	setx	0x325700ea5ba63a64, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800e9023f0, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000fc4c3e1ed0, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000e7960401b8, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000d1c666af28, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000c6b4aee2a8, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800f354a98, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800edbd020, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000d8145d4508, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000ce98ad2de0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800f13a0c0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000c9437fc848, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800fd150e8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800e0e1ef0, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000f2868a7200, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000e03491de20, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000dfbd2575d8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800eeddb98, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000fa847cd520, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e77e5c8, %r1, %r9
	setx	0xe709aa6530c91530, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f314cc8, %r1, %r9
	setx	0xe14d51203e982132, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c35a50c580, %r1, %r9
	setx	0x78aa456f633c8cd9, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d4d313a200, %r1, %r9
	setx	0x39eb6313027d1f37, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ee64cd44b8, %r1, %r9
	setx	0xe4a9e7c35ae3e121, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000fc2b539b80, %r1, %r9
	setx	0x20466c2c07d6f496, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e451828, %r1, %r9
	setx	0xc44fec16b03509d8, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800fe97a50, %r1, %r9
	setx	0xe81b0ca55e5ce8f8, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c11f03e2d0, %r1, %r9
	setx	0x0679be55cebb4cf1, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d1f2493c20, %r1, %r9
	setx	0x05541275bb207b61, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000ec8f173358, %r1, %r9
	setx	0x9d51661d4f9ea705, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000fc4f371808, %r1, %r9
	setx	0x600d61c3685a8bcc, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800eedf270, %r1, %r9
	setx	0x8ab0313132c09f7e, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800fb64550, %r1, %r9
	setx	0xb1e35e3d9306a695, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c6a6da7cb8, %r1, %r9
	setx	0x208abfeab2e5bb1c, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000dedc96bcd0, %r1, %r9
	setx	0x7505867601a4bf69, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000ec3f97fd48, %r1, %r9
	setx	0xd1f81798b7bbc529, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000fad8123548, %r1, %r9
	setx	0x198f83569d14639e, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e361b70, %r1, %r9
	setx	0x848524e330f05a72, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800fa8c560, %r1, %r9
	setx	0xec97d68b60c366eb, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000cac5566628, %r1, %r9
	setx	0x6206f5b894da164b, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d3bc9119b0, %r1, %r9
	setx	0x025f3c5e3c30fe8f, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ea92481b90, %r1, %r9
	setx	0x6e26ca39eb3d4061, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000fe6d425c08, %r1, %r9
	setx	0xadb78a7196f996b4, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f30dab0, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800ea5a600, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000f4816a7798, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000e41b1bf3a8, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000dfad3da8d0, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000c56f48ba38, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800f06a1b8, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800f40b920, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800ee4f048, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000fe6fc6daf0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000ee33251510, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000de1e58ade8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000c2d4415720, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000e03491de20, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000dfbd2575d8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000c96cc7d780, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800fc33eb0, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800e01d0e0, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800e9c8828, %r1, %r9
	setx	0x680656199567505d, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f408fa8, %r1, %r9
	setx	0xc320db04d6a3c60b, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ce1253a2b8, %r1, %r9
	setx	0x6a0010dfee42d141, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d7ca3a83b0, %r1, %r9
	setx	0x33d1ae44433629cd, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000eb68594a38, %r1, %r9
	setx	0x5b6153312aaf911d, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f0750a1510, %r1, %r9
	setx	0x312932c13b99a5e1, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e882c88, %r1, %r9
	setx	0x2e22e5a0ef3a66db, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f834d10, %r1, %r9
	setx	0x88949e2734e18d9e, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000cd49477628, %r1, %r9
	setx	0xf3f32c9ed4eaee53, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000dfcc989768, %r1, %r9
	setx	0x61fa94f12827962b, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000ebbe3b3248, %r1, %r9
	setx	0xa2c9b669b6617611, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f0a5f4b968, %r1, %r9
	setx	0xf40fc06cc034aa6c, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800eb5b188, %r1, %r9
	setx	0x4179376754b98f29, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f5bc820, %r1, %r9
	setx	0xa58d3f6cc6feed5d, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000cda4d903d8, %r1, %r9
	setx	0xcf440477e97ded0b, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000dc910a5230, %r1, %r9
	setx	0x2c149aab83720bfe, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e844f60dc0, %r1, %r9
	setx	0x539276ca5658aac8, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f2e2526298, %r1, %r9
	setx	0xe7c783e8a43bbe41, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800edeb660, %r1, %r9
	setx	0x3adb05bc00555f12, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f633de0, %r1, %r9
	setx	0x0d7a3ce31e1ed567, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c9b60056b0, %r1, %r9
	setx	0xdae2f5ebd39b758f, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d944511a80, %r1, %r9
	setx	0xcde6944f8c5091ee, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000eff65ba460, %r1, %r9
	setx	0xf8c917e1b867339d, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000fcb10ef490, %r1, %r9
	setx	0x26b1b8953044e0b4, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d669ab83a8, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000c354e618a8, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800f13c660, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800e717888, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000fc4f371808, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000ec8f173358, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d1f2493c20, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000c11f03e2d0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800fe97a50, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e800c70, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000f666e4fe60, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000e737e574f0, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000d856eab7c0, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000c733ce2bf0, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800f98d550, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800e2a7370, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000d3f0975ac8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000c44aa1de28, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800fdbae60, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800ed171b8, %r1, %r9
	setx	0x2b6736f39c104d2c, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800fe2a9e0, %r1, %r9
	setx	0x675aff15393f7a22, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c62f5e28a0, %r1, %r9
	setx	0x539ec46039d49b3f, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d47bfb2048, %r1, %r9
	setx	0x0dd2967faadc9cfd, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e9e91a2ba0, %r1, %r9
	setx	0x78c12846c39d516b, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000fa88427b80, %r1, %r9
	setx	0xba42a055d5772149, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e859088, %r1, %r9
	setx	0x21f037f15e8ad345, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f3fdb58, %r1, %r9
	setx	0xb7a5b24dd3af2631, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000cdbde57300, %r1, %r9
	setx	0x68cce8fe7e65b46b, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d3e9269028, %r1, %r9
	setx	0x5170422b592354eb, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e9bebc5f70, %r1, %r9
	setx	0xdf63e6039943dae8, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000fe8adf3760, %r1, %r9
	setx	0xeb37f324d7467a3f, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e8e5ab8, %r1, %r9
	setx	0x9162c0bab8abb27f, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800feafb88, %r1, %r9
	setx	0x6792b5e0138c7b0e, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c39a17d568, %r1, %r9
	setx	0x3d95b36c5e2d9c65, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000df1b450c68, %r1, %r9
	setx	0x6450c12db2cfc79f, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000ee1c3a3f78, %r1, %r9
	setx	0x10561273c75b9c51, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000feab538228, %r1, %r9
	setx	0x6dd84c3177539d65, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800ef4c8e8, %r1, %r9
	setx	0x33d1fc31161197d3, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f7955d8, %r1, %r9
	setx	0xea7dfd07da9b9cc3, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000cc11876ec0, %r1, %r9
	setx	0x381a65a74a19c91d, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d88c189ef8, %r1, %r9
	setx	0xcae7a60db96ac8fe, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000eaa7e72ec0, %r1, %r9
	setx	0x0756561c19d1f35d, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f87274ebd8, %r1, %r9
	setx	0x51432fb6dd27a535, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000dac68b1588, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000c195875f00, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800f6c82f8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000e737e574f0, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000d856eab7c0, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000c733ce2bf0, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800f98d550, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800e2a7370, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000fa204b7230, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000eecd3a68b0, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000ef2ed7ac70, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000d260f9e880, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000c70e6a3c28, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800f055990, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800eabb2e8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000f069921fb8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800ebe4820, %r1, %r9
	setx	0x983d54c2c48147e1, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f48b808, %r1, %r9
	setx	0xb996c9b5753f4766, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ce93629c00, %r1, %r9
	setx	0xe3bf62270902a094, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d599cc6000, %r1, %r9
	setx	0xd5493ecc6d3445e7, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e31d17ed60, %r1, %r9
	setx	0x82f7d6c5bc0f22f3, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f067d07de8, %r1, %r9
	setx	0x1791881aa3d63984, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e5810b0, %r1, %r9
	setx	0x45b2c1fb481d5433, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800fb076b8, %r1, %r9
	setx	0xe506e632e62c28fd, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c8b41936b8, %r1, %r9
	setx	0x97af33a5a79fe466, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000dc9bbebf68, %r1, %r9
	setx	0x61eca4415e589abd, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e43a3bf418, %r1, %r9
	setx	0x7d3a46e874c84067, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000faca322c88, %r1, %r9
	setx	0xda5d99243cb4a3d4, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e6fbbd0, %r1, %r9
	setx	0xe61169f5340317dd, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f8f9638, %r1, %r9
	setx	0x4ec143ded3874ecf, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000cf4cd7aa60, %r1, %r9
	setx	0x867f43d96ee90608, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000df94d427a8, %r1, %r9
	setx	0xd05b0b7c4724c0a5, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000ecfb3cb788, %r1, %r9
	setx	0x1496821d43e8699d, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f48465aeb0, %r1, %r9
	setx	0xb07548df373b19b2, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e520108, %r1, %r9
	setx	0xeac25b68ff6ebd04, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800fb2af50, %r1, %r9
	setx	0xcd65ca87a3e43a6b, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000cfc7726ae8, %r1, %r9
	setx	0xf2985b6912824406, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000da8e5b6ef0, %r1, %r9
	setx	0xef38a1ee9dfef95a, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e61883d920, %r1, %r9
	setx	0x049824893a81a042, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f65857d5a8, %r1, %r9
	setx	0x03b85202741096f8, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e1c7ae88b0, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000dc2358a038, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000c59d20ad78, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800f13a0c0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e4127f8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e8344b8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000fc7f0dbfe0, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000e3d878ef90, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000e6cbe45328, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000da1e586d20, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000cc5d0c08e8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800ff48e40, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800ead9be8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000f4a9f3f0f0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800eb83d00, %r1, %r9
	setx	0xdde4636d690d4306, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f799808, %r1, %r9
	setx	0xaf7458887ce7ed43, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000cdc77c2c90, %r1, %r9
	setx	0x9d94b8e47f620817, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000db5e58aa78, %r1, %r9
	setx	0x00336b7e1f65e00d, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e143b54540, %r1, %r9
	setx	0x5b99f754dc1689ad, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000fa4fcd9940, %r1, %r9
	setx	0x0504e8c4307660ba, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e775fc0, %r1, %r9
	setx	0xea881b512420c73b, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800fd53020, %r1, %r9
	setx	0xea3fb04110a5875f, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000ca852ade38, %r1, %r9
	setx	0xe0be5ba7dd7a6a92, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000dcfce99760, %r1, %r9
	setx	0x7c98bbeda9de188a, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e1d25653a0, %r1, %r9
	setx	0x67378b9754a6c242, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f6c0c5ea28, %r1, %r9
	setx	0x33df6c3b324e269a, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800ea4cb18, %r1, %r9
	setx	0xa65056b4f1fe86e2, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800ff251c0, %r1, %r9
	setx	0xc9595f31d62285e3, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000cea4949348, %r1, %r9
	setx	0xc54e2f1aabe50f4b, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d1fc493e98, %r1, %r9
	setx	0x05f4de37676824a6, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e1a37480a8, %r1, %r9
	setx	0x784b6ad78e8679ba, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f087edb668, %r1, %r9
	setx	0x4033d6d2b775dd91, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800ec40cf0, %r1, %r9
	setx	0x043fc850560a4f2d, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f0c62e8, %r1, %r9
	setx	0xe2ede45d142fed0e, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c3acf05e50, %r1, %r9
	setx	0x922d514e52e01efd, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000da355e1cc0, %r1, %r9
	setx	0x2992f4236b6f04cb, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ef961ed740, %r1, %r9
	setx	0xe282f2bf4277a501, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f4b46fcfc0, %r1, %r9
	setx	0xc0bfe10c413e789c, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000feb74f1e00, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000e7c2c600c8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e3149b0, %r1, %r9
	setx	0x09e2c20176aaa98e, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800fcee360, %r1, %r9
	setx	0x41375cfe6ed5476e, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c3f375b8a8, %r1, %r9
	setx	0xe6b1f17077afe180, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000dfaeba83d8, %r1, %r9
	setx	0x293cf7615f83db9a, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e6632c9520, %r1, %r9
	setx	0x339b31e1aadfbedd, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f023b7eb68, %r1, %r9
	setx	0xe166751fa6885aac, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800eaaba78, %r1, %r9
	setx	0xc33fe22c38f41b1e, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f6ec7f0, %r1, %r9
	setx	0x8a57a0197e67d76c, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c3505a85e0, %r1, %r9
	setx	0xa170d45cc41b4b69, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000db70258ed8, %r1, %r9
	setx	0x6916ae79a96b218e, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e87ba4eaa0, %r1, %r9
	setx	0xa7fde4b0f437fac6, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000fa01e85ca8, %r1, %r9
	setx	0x06d440171e070879, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e7056d0, %r1, %r9
	setx	0xba116897e5f1412b, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f3a51f0, %r1, %r9
	setx	0x2c90338acd1c6dee, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c995027ef0, %r1, %r9
	setx	0x63cc5f0ec8584d2e, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d95c46c0a0, %r1, %r9
	setx	0x97f4c7c2a73f3c71, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000eb78ed7548, %r1, %r9
	setx	0x8798c0e9f7c0d8f9, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000fedcef94b8, %r1, %r9
	setx	0xf852a3644be14b0e, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800eb86d28, %r1, %r9
	setx	0x3dbe51ea5d35b90f, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800fe54140, %r1, %r9
	setx	0xef8d5efb7e99cdce, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c01e4afa10, %r1, %r9
	setx	0x4c86cc3e0ab96daa, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d5e25f6ea8, %r1, %r9
	setx	0xb1863f789f47dbe7, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e4363d1d60, %r1, %r9
	setx	0x24a73878475971b7, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f23b94b7f8, %r1, %r9
	setx	0xabd84710279d4a70, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f8766ae7c0, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000edf08aa408, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000db4c950440, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000c0ec7956e8, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800f04a358, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000fef2ab38a8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000e18d6ee428, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d41b9501d0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000db4745ada8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000c9437fc848, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000e61883d920, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000da8e5b6ef0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000cfc7726ae8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800fb2af50, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e520108, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000f87274ebd8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000eaa7e72ec0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800ec56018, %r1, %r9
	setx	0xe9834922753c153c, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f4c7ce8, %r1, %r9
	setx	0xe7fab647c50dc99c, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c853eeefe8, %r1, %r9
	setx	0xcc27bc7d65cdaed1, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d014baee58, %r1, %r9
	setx	0x8fdaed9b28a302a9, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e09278cfc0, %r1, %r9
	setx	0x3caf47d19e0a6196, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f808ad9040, %r1, %r9
	setx	0x37023ddc69e36cec, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e9978b8, %r1, %r9
	setx	0x2416357cb8b4dc5b, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f1068d8, %r1, %r9
	setx	0x7c7991b48f309f04, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c5d9d0b4b8, %r1, %r9
	setx	0x5af9bdeab69bf5c4, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d71ab75b10, %r1, %r9
	setx	0x82aeba52c3b6c1ae, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000ee427bf3f0, %r1, %r9
	setx	0x16b54d462c254479, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f4fbaec108, %r1, %r9
	setx	0xb1a96e98918ccc05, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e3cfb40, %r1, %r9
	setx	0x9ffce899f7f0804e, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800fd00a08, %r1, %r9
	setx	0x0ee344ba15820e5b, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c938acb960, %r1, %r9
	setx	0xb7e8fee467ec4ef9, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d8f73a3fa0, %r1, %r9
	setx	0x5b4aad9cf6ea61a2, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000ef086e3fc0, %r1, %r9
	setx	0xb090f6e211dd72cb, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000fe9d4f59b8, %r1, %r9
	setx	0x0fad59f1f3cd69d5, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800efd8620, %r1, %r9
	setx	0x47417a3ec0f06fe2, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f66f310, %r1, %r9
	setx	0x8d4eb5108861da61, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c324fa0ad0, %r1, %r9
	setx	0xc6d206655c013316, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d71335c9d8, %r1, %r9
	setx	0x1ad43d0bcd3c7fc1, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e0766e9570, %r1, %r9
	setx	0x464e12450739dd60, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f47ce11130, %r1, %r9
	setx	0x7858d88664a82514, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f408fa8, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800e9c8828, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000fc2b539b80, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000ee64cd44b8, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000d4d313a200, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800e2c12d8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000f2c19fb070, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000e1c48ba860, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d5903af110, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000c2dd5f55b8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800f1e7ef8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000f2e140ff78, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000ec6f755218, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000d478ee1d00, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000cf7009d668, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800f453568, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800e7ae0e0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000f483284cd8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000e5a2273918, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e560968, %r1, %r9
	setx	0xc8d7e1baf8c90558, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f569048, %r1, %r9
	setx	0xd8bba2accf946601, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c0161fe578, %r1, %r9
	setx	0x891cf73c7dac695b, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000da0289ad40, %r1, %r9
	setx	0x517efdd2221b311a, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e4da247e90, %r1, %r9
	setx	0xc25cfc6988f17148, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000fafb30c878, %r1, %r9
	setx	0x5617ac5cf351b3d5, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e0905e8, %r1, %r9
	setx	0x2b0752e775e2f5fe, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f5db058, %r1, %r9
	setx	0x0aa27f2ee86a3366, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000cbae63ebd0, %r1, %r9
	setx	0xd22dbc44e8f12f5a, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000db254ccea8, %r1, %r9
	setx	0x760d2b036ad703ad, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000ef9366ad30, %r1, %r9
	setx	0x5165dd362e36738f, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f2c30625c8, %r1, %r9
	setx	0x4790a54d1dabcd8c, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e859370, %r1, %r9
	setx	0xdd3f58f4f98ee302, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f070020, %r1, %r9
	setx	0xe6c6334e30558f76, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c7a726e8a8, %r1, %r9
	setx	0x00191b9c9f2462eb, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d75aed2b98, %r1, %r9
	setx	0x4ea591032396d3d4, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e337981498, %r1, %r9
	setx	0x643b0921ec5628f5, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f446686bd8, %r1, %r9
	setx	0x7dcf6a7d3cd4aebd, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e9d0fc8, %r1, %r9
	setx	0x9b0804648bcf7eb6, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f36b240, %r1, %r9
	setx	0xa0a26305b597adf5, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c8410d3180, %r1, %r9
	setx	0x029b5aff3e08321f, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d2728ec940, %r1, %r9
	setx	0x4bc6d449a9440fde, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e96b378268, %r1, %r9
	setx	0x4eccc48f9a8c51f6, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000fa89dca150, %r1, %r9
	setx	0x05d49e86c50f3343, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e9e91a2ba0, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000e7a65a7980, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000db0ac92598, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000ef251bf970, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000d4a8dd07c0, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000c9e5b142a8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800ee6ddd8, %r1, %r9
	setx	0xc5a555949196c859, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800fc88088, %r1, %r9
	setx	0x32d1088cb8d3a5f4, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000cae64ccba0, %r1, %r9
	setx	0xef0f94231a6bbd13, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d2e4a86848, %r1, %r9
	setx	0xd20e83bec5d2d5b7, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e39518fad0, %r1, %r9
	setx	0x400b8e823320f995, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f6d92a70a8, %r1, %r9
	setx	0x4ac0ab452b373b2b, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e5f4840, %r1, %r9
	setx	0x569cb09a3dc112d7, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f450d28, %r1, %r9
	setx	0x1f0e42490ee7cb60, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c7093ff210, %r1, %r9
	setx	0xda3533a4f56e8c2c, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d8618bf618, %r1, %r9
	setx	0xce82654f9837c7b1, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e2f542ac08, %r1, %r9
	setx	0xeb83313e5e78c1d2, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000fae621b620, %r1, %r9
	setx	0xc2723b31d4bd27f4, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e91ba38, %r1, %r9
	setx	0xd7a9615e87ff5716, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f8d3768, %r1, %r9
	setx	0x468ba00e7ee7393b, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c041fe3708, %r1, %r9
	setx	0x120f918a4d624e78, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d8fa1adf70, %r1, %r9
	setx	0xbcb23d3c4baa6b7c, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e397553378, %r1, %r9
	setx	0xa595a09af27d4c42, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f2623d49a8, %r1, %r9
	setx	0x7e88a381ec419f6e, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800ee462f8, %r1, %r9
	setx	0x4e0735b41d7e7261, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800ffcce98, %r1, %r9
	setx	0x353af9851984ff93, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000cdafbda3c0, %r1, %r9
	setx	0x34cc600a44e0bc17, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000da6ae7fd08, %r1, %r9
	setx	0xb331993f7bdd7db2, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ed5c340f08, %r1, %r9
	setx	0x5acadb2f8b4e9b6a, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000fe1b948a68, %r1, %r9
	setx	0x857d8dcfd323140e, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f06a1b8, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800ed3c430, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000f01382cdb0, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000e760a8f6d0, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000dcb73a58c0, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000fad8123548, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000ec3f97fd48, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000dedc96bcd0, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000c6a6da7cb8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800fb64550, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800eedf270, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000c8410d3180, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800ed14860, %r1, %r9
	setx	0x8cee1564f8df340f, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f3e92b8, %r1, %r9
	setx	0x33d9a53b258fecfa, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c9d1cf97d0, %r1, %r9
	setx	0x1abe97d0a325796f, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000de0e245fb8, %r1, %r9
	setx	0x73e1af1fcdc9cc59, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e736757cd0, %r1, %r9
	setx	0x96d8b1ff47b57655, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f430b16818, %r1, %r9
	setx	0x4d80b1a9386e8909, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e8d5248, %r1, %r9
	setx	0x597774096871f5b6, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f552eb0, %r1, %r9
	setx	0x516efcb730fd1bcd, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000cc08050540, %r1, %r9
	setx	0x3a13590a37c8add7, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d13cb42770, %r1, %r9
	setx	0xe9868acbd3748e82, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e0dd051a28, %r1, %r9
	setx	0x6374b606a4151c6f, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f85e8bbf28, %r1, %r9
	setx	0xde74e902135b4390, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800ed29ee8, %r1, %r9
	setx	0xb00ca750d2bf886d, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f7a33b0, %r1, %r9
	setx	0xa75e86fb92cc5c15, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c2a2bbde60, %r1, %r9
	setx	0xeb25502705670673, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d0bef97d60, %r1, %r9
	setx	0xdf86536ea2676e7a, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e23f1a9550, %r1, %r9
	setx	0xfba4f795dc1f0e39, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000fe3ed15270, %r1, %r9
	setx	0x75827f8f080c6287, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e957410, %r1, %r9
	setx	0xac94bc96a1ee99b2, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800ff378e8, %r1, %r9
	setx	0x6ed58f2be7f29508, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c9bf085e28, %r1, %r9
	setx	0x2c7f6e9b03f95ca6, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000da6a36a440, %r1, %r9
	setx	0x3433d22d8c58c854, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ef98d9cd10, %r1, %r9
	setx	0x32c38f90e5352520, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000fee47f4d60, %r1, %r9
	setx	0x39dacbb267517eb9, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e40e4fc240, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000db0a9cc220, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800e28aad0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000f045560e98, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000ec23a69480, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d929d0ea10, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d8f73a3fa0, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000c938acb960, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000e6f11505c8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000dd65c39490, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e8770e0, %r1, %r9
	setx	0x7bb5b5fec8b72d30, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f96fe58, %r1, %r9
	setx	0x0e190d596877b407, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000cfd76a7328, %r1, %r9
	setx	0x6f0c08cab0aa7443, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d28634a668, %r1, %r9
	setx	0x3e0b4421e6aab3d9, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e277196eb8, %r1, %r9
	setx	0x4c04b7098072cf7f, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f8c214a0c0, %r1, %r9
	setx	0x6671c7248ed623a0, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e724c60, %r1, %r9
	setx	0xf882e9813e8e6ba7, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f006778, %r1, %r9
	setx	0x757d5ac5b1d8f082, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c29b7aeb18, %r1, %r9
	setx	0x783fc59d2bb4171b, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000dab2c2af20, %r1, %r9
	setx	0xe69546d50dcb418f, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000edd4754940, %r1, %r9
	setx	0x498013e24880e288, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f23b6a9700, %r1, %r9
	setx	0xc8794503db524c68, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800ebf8ae0, %r1, %r9
	setx	0xb59b4bc5f12483e6, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800fcdf490, %r1, %r9
	setx	0x62ec4b3aefb52595, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c63a5f28d8, %r1, %r9
	setx	0x0e499efb0b101eaa, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d63b8cb898, %r1, %r9
	setx	0x94084aecf3a41e77, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000ea0d1cbd90, %r1, %r9
	setx	0x615c1d6bad34d3c0, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000fe48fbea18, %r1, %r9
	setx	0x27979a4e8996ba14, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e4e5da8, %r1, %r9
	setx	0xfd5676e912894bd9, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f4ec930, %r1, %r9
	setx	0x74fd46976f60dd5c, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c022638888, %r1, %r9
	setx	0x4d4a8214b1814db5, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000dcbcf4c588, %r1, %r9
	setx	0x9d4747fef84ceb7a, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e876762860, %r1, %r9
	setx	0xc8c72680dd4bc8a9, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000fa05766920, %r1, %r9
	setx	0x37bda567610b86ef, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d1c666af28, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000c6b4aee2a8, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800f354a98, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800edbd020, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000f4804a1cd0, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000e346ad3d50, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800e0905e8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000f4fbaec108, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000ee427bf3f0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d71ab75b10, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000c5d9d0b4b8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000cea4949348, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800fb2af50, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e8cce40, %r1, %r9
	setx	0x1db3da062882c722, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800ffb59f8, %r1, %r9
	setx	0x2cde25b05f28e304, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c0e1e85d58, %r1, %r9
	setx	0x65e1dbfdfe9637e1, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000daa8b7a7d8, %r1, %r9
	setx	0x8abe4889d7f79ad1, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e10e27d9c0, %r1, %r9
	setx	0x4ce2de3dae845401, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f49bd85e90, %r1, %r9
	setx	0x0c560dd4a44d6ba2, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800ebbcbc8, %r1, %r9
	setx	0x38c95f54067271c3, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800fc87bf0, %r1, %r9
	setx	0x3583c80e1e174282, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c635262d08, %r1, %r9
	setx	0xef47df87f1a14f27, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000df6695b578, %r1, %r9
	setx	0x5d21d60d682ff07c, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e81b42b350, %r1, %r9
	setx	0xd12a75f6a8393e12, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000fe47d513c0, %r1, %r9
	setx	0xe506a94effe35850, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800ec14318, %r1, %r9
	setx	0xe7f2e463183d9ef9, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800fdf56c0, %r1, %r9
	setx	0xfcf0e27f61514469, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000cf9ce8ab18, %r1, %r9
	setx	0xb2ca585569c0ece7, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d37d96a118, %r1, %r9
	setx	0xc2a8a4848be69ff8, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e00dae68a8, %r1, %r9
	setx	0xd9c63d76871f03b5, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000fcf5d3a2c0, %r1, %r9
	setx	0xcfc8f66ffe3c70aa, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e0ff758, %r1, %r9
	setx	0x932886926a315e32, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f8dd300, %r1, %r9
	setx	0x7b6b0927d943ba0c, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c3fc277ae0, %r1, %r9
	setx	0x8e8a7c0d73179c95, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d7a1949558, %r1, %r9
	setx	0xf051e4c5eb4723d8, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e84771e8d8, %r1, %r9
	setx	0xa716300164ca707c, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000fed1109538, %r1, %r9
	setx	0x834acca49576aba3, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800ea5a600, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000f4816a7798, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000e41b1bf3a8, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000dfad3da8d0, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800fe9b710, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e28aad0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000f045560e98, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000ec23a69480, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d929d0ea10, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000ce29e1c558, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000f0a1ea1de0, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000e4458dad60, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000d66bacbe48, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000c7656bc908, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800fc68420, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800e237f50, %r1, %r9
	setx	0x35ca720dea71a485, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f5c6470, %r1, %r9
	setx	0x573a7eefb80b856d, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c47e6938c0, %r1, %r9
	setx	0x2b7b1e99a8df6053, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d610d9db88, %r1, %r9
	setx	0x7a41e5a2af330fcd, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e8e76c9dd0, %r1, %r9
	setx	0x94ba469182b246e4, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f2c892d290, %r1, %r9
	setx	0x0c68fc059623560a, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e29d198, %r1, %r9
	setx	0x0f9a0f84743c47e8, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f3538c8, %r1, %r9
	setx	0xf23c1492083fb85a, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c272a96680, %r1, %r9
	setx	0x4983c4dc1e568e6f, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d429591e70, %r1, %r9
	setx	0x84b7c75075a8a840, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e804a764d8, %r1, %r9
	setx	0x8392dca2aed3e882, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000fab4bd1138, %r1, %r9
	setx	0x72ee45e24c5899e2, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e059c20, %r1, %r9
	setx	0x1026f5086a2a35f3, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f446bc8, %r1, %r9
	setx	0x051c779e5f6c3666, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c588180ce0, %r1, %r9
	setx	0x6e95be9b715f6e24, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d854edbb18, %r1, %r9
	setx	0x819a39317b5cdf1b, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000ea4bc43230, %r1, %r9
	setx	0x0f57c1e3a1afb458, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000fa0533fe80, %r1, %r9
	setx	0x3e07ce5caf3734e9, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800eb149f0, %r1, %r9
	setx	0x93dc6c6619fd9ec9, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f32b6d0, %r1, %r9
	setx	0xeca237e803003d98, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c056521748, %r1, %r9
	setx	0x22311991b2d2bb82, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d8b10a3388, %r1, %r9
	setx	0x5aa53477c3dd4ddd, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e144bbf368, %r1, %r9
	setx	0x6c36262edeecf243, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000fa9221a7f8, %r1, %r9
	setx	0x6c74d51456a3950d, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000dac68b1588, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000c195875f00, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800f6c82f8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e910788, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000f2aa45fc08, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000ec0e04adf8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d125969cb0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000c63a5f28d8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800fcdf490, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800ebf8ae0, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000fe3ed15270, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000c443e2dc38, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800f07bb98, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e43ee08, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000f2b13a07c8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000e40b0c99f8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800ef03098, %r1, %r9
	setx	0x782e7ad30f400bc0, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f3981b8, %r1, %r9
	setx	0x041cf737e47320cb, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c71cf105e0, %r1, %r9
	setx	0xdd520bf4180e2055, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d7d7853b00, %r1, %r9
	setx	0x193b542ba7a9446c, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ee7e8d97a0, %r1, %r9
	setx	0xcfc550c6318612e4, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000fe14bb6480, %r1, %r9
	setx	0xd055dfce37e22222, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e0586b8, %r1, %r9
	setx	0x264b7ec6818e0523, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f17b458, %r1, %r9
	setx	0xf2c67e0f3ae6b2b4, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c1d3f60338, %r1, %r9
	setx	0xe75513cd5daaaf18, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000dec0b26af8, %r1, %r9
	setx	0xed60f156542e3ef0, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e3547dbf68, %r1, %r9
	setx	0xd8748d860b5341bd, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000fc9ca4a1e8, %r1, %r9
	setx	0x2fa099bfac6f862b, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800ec27d58, %r1, %r9
	setx	0xa4421a6950830654, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800fb69548, %r1, %r9
	setx	0xaa1fff3884023e87, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c12b9f2958, %r1, %r9
	setx	0xb704e940ced46b42, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d8e8a78ed0, %r1, %r9
	setx	0x41fffaa05bb42b81, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000eeaec526b8, %r1, %r9
	setx	0xd71879ecd96d4aa6, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f62bf50020, %r1, %r9
	setx	0x306a2d5f6980ea47, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e3d4688, %r1, %r9
	setx	0xe4b4d294f1ed44b0, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f5c5750, %r1, %r9
	setx	0xc8b2311d217cf37c, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c31a487020, %r1, %r9
	setx	0x7971b29513adc7ad, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d82480ef70, %r1, %r9
	setx	0xc3e07e40b4915ba2, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ec57b24df0, %r1, %r9
	setx	0x08275973795e13bb, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000fe408982b8, %r1, %r9
	setx	0x016f1ca807db60d5, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000fae621b620, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000e2f542ac08, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d8618bf618, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000c7093ff210, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800f450d28, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e5f4840, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000f2623d49a8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000e397553378, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000d8fa1adf70, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000c041fe3708, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800f8d3768, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800e91ba38, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000f446686bd8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000f6b5b793a8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e012b00, %r1, %r9
	setx	0x0cb97bef56e54c87, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f6a3cc8, %r1, %r9
	setx	0x002ff3ed28693dcd, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c506cbaba0, %r1, %r9
	setx	0xc60e748caf08e3d7, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000dbb3cf78c0, %r1, %r9
	setx	0x5a37129d023810d4, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ebbc7f4128, %r1, %r9
	setx	0x811167bb00021f68, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000fa03603b80, %r1, %r9
	setx	0x644b2a7c3d518a5d, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800efba940, %r1, %r9
	setx	0x824b8908653e90e4, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800fc60668, %r1, %r9
	setx	0x512190adeea1f1e4, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c8266e4ab8, %r1, %r9
	setx	0x717530d1bd0d92d3, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d03c327208, %r1, %r9
	setx	0x8815c5c5dc54d272, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e7f309f800, %r1, %r9
	setx	0x87b6137224faea62, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f43a5a0eb8, %r1, %r9
	setx	0x1810b8860a651f64, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800edb5040, %r1, %r9
	setx	0x35971a5c34bf2afa, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800fe4ee48, %r1, %r9
	setx	0xd2e7f631b4dd175f, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000cc661d0198, %r1, %r9
	setx	0x5124cd595c280fec, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d6c646a758, %r1, %r9
	setx	0x966622cb6ab18c09, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e9635aacf0, %r1, %r9
	setx	0x0409ea8677384862, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000fca1aa2078, %r1, %r9
	setx	0x051f67a3ff5ec501, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800eea3b30, %r1, %r9
	setx	0x260bf14cfdc15957, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800fdce690, %r1, %r9
	setx	0x135b14d3e8b5a2a0, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c8e5046ed8, %r1, %r9
	setx	0x83e8a301a7fba748, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d979dc5d00, %r1, %r9
	setx	0x86b4359faa480dbb, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e77b54bad0, %r1, %r9
	setx	0x1de08f64e00b80a2, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f09f3b0510, %r1, %r9
	setx	0x5174df3503fdfccd, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e40e4fc240, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000db0a9cc220, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000c2abdd1468, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800f4b80d8, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800e68dcd8, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000f4eafeebc0, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800e6730e0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000f0767d9e40, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000ee1d65f960, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d69a938400, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000c2a8176030, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800fe9b710, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800ee9fd30, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000feb39ffaf0, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000e46639bd10, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000db3a58cca0, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000cc7e043460, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800fba8058, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800ef3bf70, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000e6c8295380, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e780118, %r1, %r9
	setx	0x16958a003d3d4986, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800fd582a8, %r1, %r9
	setx	0xb00f9886fcddd99c, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000cfcf09b640, %r1, %r9
	setx	0x1ea363cd47d4b482, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d976e7bbe0, %r1, %r9
	setx	0x0cd67caf68824d21, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ed62e513d8, %r1, %r9
	setx	0x6b501ab20d932c61, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000fc9e4a8a20, %r1, %r9
	setx	0xe50dc89b8bbd84ce, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e2fc188, %r1, %r9
	setx	0x2baebc91320f3dc3, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f3d2050, %r1, %r9
	setx	0x48691ab8f60daf4e, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c701760928, %r1, %r9
	setx	0x74134ffd02177fd8, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000da3a9cefc8, %r1, %r9
	setx	0x344a46f03c0581d7, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000ee81896dc8, %r1, %r9
	setx	0xd864fcf3aacaf9b1, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f6d83b8078, %r1, %r9
	setx	0x69116d5fa8a2c169, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e061358, %r1, %r9
	setx	0x46de0c1006e214eb, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f09dc50, %r1, %r9
	setx	0x6f1e54ba36b9e084, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c3ffe38648, %r1, %r9
	setx	0x5b17de6311549fc4, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d0b9979e30, %r1, %r9
	setx	0x10de4cc95d263b2c, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000eb4c38d028, %r1, %r9
	setx	0xed2c19b2cbc8d4f7, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f4ca624230, %r1, %r9
	setx	0x81ad94395043fc7d, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e8c6658, %r1, %r9
	setx	0x3682d5efdb153dbe, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f18e400, %r1, %r9
	setx	0x5102772134b183e4, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ce537206e8, %r1, %r9
	setx	0x946bb116e4401ad5, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000de95007298, %r1, %r9
	setx	0x7e956d6449ea9db1, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ef148b2c90, %r1, %r9
	setx	0x414db138226889a6, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f64909a580, %r1, %r9
	setx	0x28ee1b1faa61392b, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e277196eb8, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000d28634a668, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000cfd76a7328, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000dab2c2af20, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000c29b7aeb18, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800f006778, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e724c60, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d37d96a118, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000cf9ce8ab18, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800fdf56c0, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800ec14318, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000fe48fbea18, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000cb84c52010, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800ffcce38, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800eefa6d8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e895da0, %r1, %r9
	setx	0xede32b2bb6e8cc3b, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800ff4ba30, %r1, %r9
	setx	0xcf033e22d43cb3ff, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000cca36b8da8, %r1, %r9
	setx	0x69a6b5495abbd3fe, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d3c4365b38, %r1, %r9
	setx	0x6ed752de8adb4587, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e525fa05d0, %r1, %r9
	setx	0x45b5de8a8a291114, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f0ca38d1c0, %r1, %r9
	setx	0x552991fa1ad760d8, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e035fd0, %r1, %r9
	setx	0x83ee4bf8956dc4f7, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f830dd0, %r1, %r9
	setx	0x01b3934bcfb449cb, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c395449a30, %r1, %r9
	setx	0x4dde37137fde43f2, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d38cce3cc8, %r1, %r9
	setx	0x90bb62050d4ff69d, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e0cd609548, %r1, %r9
	setx	0x78f5a0592be6fd34, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000febe70c680, %r1, %r9
	setx	0xe104e699211b7352, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800eed05e8, %r1, %r9
	setx	0x3d7665e52b23a22b, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f065c08, %r1, %r9
	setx	0x29e7a665fcec3afe, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c5bb991688, %r1, %r9
	setx	0x34a812bc5586e2ee, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000dd241b7880, %r1, %r9
	setx	0x4313c55b8b907dea, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e85e2d3068, %r1, %r9
	setx	0x08d6f2cf6481f7cf, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f0232f5ae8, %r1, %r9
	setx	0x092c112079c3b9db, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e617710, %r1, %r9
	setx	0xfcdadff8ba23b29e, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800fdd5240, %r1, %r9
	setx	0xc493135e441bb578, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c6181a7318, %r1, %r9
	setx	0xb34d4cf06b6fa40b, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d6338dfd90, %r1, %r9
	setx	0xd24eaa208d71f15a, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e086ced140, %r1, %r9
	setx	0x040a993f617dcdc9, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f66a264cc8, %r1, %r9
	setx	0xbbc1c2147a95ed87, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e7960401b8, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000d1c666af28, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000c6b4aee2a8, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800f354a98, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800edbd020, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000feddeb6a38, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000de12c6a450, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000c969977528, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800f13c870, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800e0950c0, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000f0a1ea1de0, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000e4458dad60, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000ea92481b90, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000d3bc9119b0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000cac5566628, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800fa8c560, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e361b70, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000f2694ecc40, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000e2236703c8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e6e35f0, %r1, %r9
	setx	0xeea8eaec7fa38dd6, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f323f18, %r1, %r9
	setx	0x3990207fe61ac353, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000cdcc679ae0, %r1, %r9
	setx	0x4b778b7cc4a24a96, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d825970c50, %r1, %r9
	setx	0x5ca3d2c9b66eae7f, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ecd289d478, %r1, %r9
	setx	0xa4d36318f3511dbc, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000fc78347e90, %r1, %r9
	setx	0x4721ad61afb88f55, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e209c38, %r1, %r9
	setx	0x0d34e1c2cee8c1e3, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800fd90b90, %r1, %r9
	setx	0xa4993c8c27d29809, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c374804e48, %r1, %r9
	setx	0x5f69fdfce9ef59ce, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000dd5e3bfa20, %r1, %r9
	setx	0xc95b784b9ba5d16e, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e75c7e75a8, %r1, %r9
	setx	0xac57b8e74e7d4c30, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f8443bb0d0, %r1, %r9
	setx	0xbe320b9c0c6a956f, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800ea56928, %r1, %r9
	setx	0x9e2574cf075158b3, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f53cb78, %r1, %r9
	setx	0xd9770db8c3de7d59, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c3825ddd70, %r1, %r9
	setx	0x93b87bc31727b008, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d765e166e0, %r1, %r9
	setx	0x96cd7e37f5bf3d05, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000ee503fb350, %r1, %r9
	setx	0x0c46f5490636e9b2, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000fc6f830340, %r1, %r9
	setx	0x25005deec4b42d91, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800ead7730, %r1, %r9
	setx	0xe66957fc53e16c19, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f23c420, %r1, %r9
	setx	0xd8dcb73a3ddd3606, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000cefec90a48, %r1, %r9
	setx	0x92ba31dfaa961466, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000dcec892bc0, %r1, %r9
	setx	0x77225eb055d2df14, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000eb45260638, %r1, %r9
	setx	0x22a99d28b84027c8, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f28623d328, %r1, %r9
	setx	0x4bff8fd7150bdb40, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c47e6938c0, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800f5c6470, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800e237f50, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000f49bd85e90, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000e9bebc5f70, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000f2623d49a8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000e397553378, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000d8fa1adf70, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000c041fe3708, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800f8d3768, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000f80fe58ff0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800ee54a68, %r1, %r9
	setx	0x151d0f69fa411fe5, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f0823b8, %r1, %r9
	setx	0xc20c7b5b9c034501, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c2974da9f0, %r1, %r9
	setx	0xb6a7b227a311639e, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000de85de04d8, %r1, %r9
	setx	0xce83ffff1ade5d28, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e581b5bd30, %r1, %r9
	setx	0xe52e7861e795f7a4, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f4e17b6ce0, %r1, %r9
	setx	0x621ed765b0f2a9be, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e144460, %r1, %r9
	setx	0xba05990e09f4e94e, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800fbe23f8, %r1, %r9
	setx	0x10648dfc51e34da6, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c2e59fc218, %r1, %r9
	setx	0xd8c9ce18e9768e32, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d1221f39c8, %r1, %r9
	setx	0xbf9db4b8eaaa3356, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e440f874f0, %r1, %r9
	setx	0xe429a86172494aa6, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f8db2192c8, %r1, %r9
	setx	0x42a73a718d4bf29c, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e7c2b28, %r1, %r9
	setx	0x98aba30dbc02bdd7, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f6621a8, %r1, %r9
	setx	0xda7a5bf329145208, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c0505bad78, %r1, %r9
	setx	0x9968140f0b722501, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000dfdf794fd0, %r1, %r9
	setx	0xd2bb3746177b539b, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000ee2d53c3e8, %r1, %r9
	setx	0x0e2b3b7811ec3266, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f0748af848, %r1, %r9
	setx	0xfc275c4211603b90, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e770c88, %r1, %r9
	setx	0xbb25bfff02aa21c8, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800ff26fc8, %r1, %r9
	setx	0xd2c8e065ee4987f7, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c2376ef590, %r1, %r9
	setx	0xa53137f2d8049219, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d746849230, %r1, %r9
	setx	0xd4ecd8577f2d5efc, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e1ff748fb8, %r1, %r9
	setx	0x385c0436938c60dd, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000fe0326f068, %r1, %r9
	setx	0xb5e0d6e45b3d8818, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f6414a00d8, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000e40e4fc240, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000db0a9cc220, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000c2abdd1468, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800f4b80d8, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800e68dcd8, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000f4eafeebc0, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800fd4a938, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000c733ce2bf0, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800f98d550, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800e2a7370, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000cfc7726ae8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e153d08, %r1, %r9
	setx	0x1e03fec4fbad25a5, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f4d0c88, %r1, %r9
	setx	0x78d28d6895e616d5, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c8892fbb50, %r1, %r9
	setx	0xe8ad06a0e5edb2fd, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d5c1247680, %r1, %r9
	setx	0x6b025749f12b46d8, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e0c3122888, %r1, %r9
	setx	0x0027a98786e52688, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f0e00078f0, %r1, %r9
	setx	0xc07558523b39ee37, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800ec041f0, %r1, %r9
	setx	0x3ed8698ed2cb1564, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800fbc2e08, %r1, %r9
	setx	0xe04c784b6f9a7f4f, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c0d2c31e80, %r1, %r9
	setx	0x9c75f07518d1f6f9, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d09fb4fc18, %r1, %r9
	setx	0xeb93599b2bfd4d2b, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e5561789e0, %r1, %r9
	setx	0x77e02d9e06e4a341, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f0b3280090, %r1, %r9
	setx	0x70538a557e5570ff, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800eb30a90, %r1, %r9
	setx	0x5f3fc12db9aeadd3, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800fea3e60, %r1, %r9
	setx	0x510f1033715c5daa, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c4da64bba8, %r1, %r9
	setx	0x61f3dd24ffaf2f71, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000dbefc87a10, %r1, %r9
	setx	0x1a504fd1a728105d, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e7a9598f50, %r1, %r9
	setx	0x23730803be7bc7ff, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f6f8154b10, %r1, %r9
	setx	0xd01cf22f878e23c3, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e03fd98, %r1, %r9
	setx	0x412580de6c2f0287, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f8c4168, %r1, %r9
	setx	0xaf1ea6e8ad227a48, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c69b244428, %r1, %r9
	setx	0xb2cb60cca026475c, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d190939ae0, %r1, %r9
	setx	0xfcb52a27deefaebe, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e147179900, %r1, %r9
	setx	0x99b234b0565f7640, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f0677d6690, %r1, %r9
	setx	0x01dc7f5099b28ade, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c58fd34360, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800fc53900, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800e9023f0, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000fc4c3e1ed0, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800e29d198, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000fe47d513c0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000e81b42b350, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000df6695b578, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000c635262d08, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800fc87bf0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d4b2bc65a0, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000c9c31ac630, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800fe656b8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800e8344b8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000fc7f0dbfe0, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000e3d878ef90, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000df0d687368, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000fc22069ae0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000e3a5829fd0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000d3f0975ac8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000c44aa1de28, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800fdbae60, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e9d3b08, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000f8bcb07d48, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e019b58, %r1, %r9
	setx	0x7da48bcac41b4df9, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800ff41fc8, %r1, %r9
	setx	0xef25307f76614e03, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c38e1049e0, %r1, %r9
	setx	0x64fe1734167ddf9e, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000df14dafe10, %r1, %r9
	setx	0x4123f96d0ad83a91, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ee60ab8478, %r1, %r9
	setx	0x5b06846cb170d144, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f664d95278, %r1, %r9
	setx	0xacfc67235dfa86d1, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e30f380, %r1, %r9
	setx	0xdad804811cff03c8, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800face120, %r1, %r9
	setx	0xc4a3e4b7eb7dc4e0, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000cb1251aec8, %r1, %r9
	setx	0x9f76eace8fd3de39, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000de61b1ce38, %r1, %r9
	setx	0x0510c86c6524154a, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e58ad61e58, %r1, %r9
	setx	0x42790a9a758383b7, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000fc98756950, %r1, %r9
	setx	0x059d077d3a7cfb7b, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e6847d0, %r1, %r9
	setx	0x4ab08bf82a50f2ff, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f2201a8, %r1, %r9
	setx	0x90eaaf40f7a33326, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000cde2f518a8, %r1, %r9
	setx	0x76d086c897a9e84d, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d1ef34bd30, %r1, %r9
	setx	0x4cc883d87bf79398, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e51f7d3f18, %r1, %r9
	setx	0x52dc4faf0b987376, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000fe2942eee0, %r1, %r9
	setx	0x2c97768724d6d471, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e732eb8, %r1, %r9
	setx	0xf56a07df5911f1fd, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f801148, %r1, %r9
	setx	0x4eb0b6ae4ac028ca, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c515c60a58, %r1, %r9
	setx	0x9e5476e6c8683425, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000db8e720e50, %r1, %r9
	setx	0x3e0d4dea3feb289b, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000eb2ea77d98, %r1, %r9
	setx	0xc663459c26c09dd5, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000fadca75ba8, %r1, %r9
	setx	0x13ea1760f3b301f9, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800e8cce40, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000f8c214a0c0, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000e277196eb8, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000e7c2c600c8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d75aed2b98, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000c7a726e8a8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800f070020, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800e859370, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000fe9d4f59b8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000ce537206e8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800ee58b90, %r1, %r9
	setx	0xbaa076be955735cf, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800fb1b080, %r1, %r9
	setx	0x177b7592dcfd9093, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c18d3aa8c0, %r1, %r9
	setx	0x470ed0dfc9c684fb, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d25a2a5738, %r1, %r9
	setx	0x962ecf6ffa1f76b6, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ef1d8a7fc8, %r1, %r9
	setx	0x94e0a8690eb07b1c, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000fc3f0097e8, %r1, %r9
	setx	0xaa0da6c1afdfe9c0, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800ef16990, %r1, %r9
	setx	0x3f24d5171f513ea1, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f725cd8, %r1, %r9
	setx	0x7d1f28b8ef8e0e3c, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000ca4e73fd58, %r1, %r9
	setx	0x022e493372ab7af0, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000dfbd47f410, %r1, %r9
	setx	0x4b84fc5c76a0553f, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e63a93cda8, %r1, %r9
	setx	0x4df128bfe1637c3e, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000faaea30f70, %r1, %r9
	setx	0xee0f3a0485043505, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800eb9bca8, %r1, %r9
	setx	0x7cb60464c29e940b, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800fc67118, %r1, %r9
	setx	0x9550efc7a2b59df6, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000ca375e5198, %r1, %r9
	setx	0x3090c522b34cdf00, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d7f59ea928, %r1, %r9
	setx	0x548088ddb825deeb, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e318218f08, %r1, %r9
	setx	0xe557b3a2848d0a3c, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000fe160de918, %r1, %r9
	setx	0xe8f417bb0d00f7be, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800ef265d0, %r1, %r9
	setx	0xd04edbb0193f0771, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f4c8800, %r1, %r9
	setx	0xfc6934d2e5a943a8, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000cea2eb57c0, %r1, %r9
	setx	0x8e6277692b381656, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ddc4585d18, %r1, %r9
	setx	0xf9e12ee69886d53f, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e27e723878, %r1, %r9
	setx	0x2716ee30e125db06, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000fe6f75f470, %r1, %r9
	setx	0xf398e09c83f85099, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c195875f00, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800f6c82f8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800ee462f8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800ef59390, %r1, %r9
	setx	0x63a68823ffc42b8e, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f7f0760, %r1, %r9
	setx	0xa36d30fac3e29950, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000cbbb82ed10, %r1, %r9
	setx	0x0d71ea7d441af5dc, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000dbab15a200, %r1, %r9
	setx	0xc765034546fb66a1, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e023b4e978, %r1, %r9
	setx	0x216a622b9ec11983, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f48da801f8, %r1, %r9
	setx	0x09d9ef15d44113aa, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800ec9a9e0, %r1, %r9
	setx	0x8be991f4661700fb, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800ff23908, %r1, %r9
	setx	0xf613c8e05c977368, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c200283ee8, %r1, %r9
	setx	0xdc75eb2b40c50641, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d717214e58, %r1, %r9
	setx	0x6c492416701fabe1, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000eed9257088, %r1, %r9
	setx	0x288b13df9dd24845, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f8f08d5178, %r1, %r9
	setx	0x0ba7bb5288da1867, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800efb9300, %r1, %r9
	setx	0x1299042f9bdcafd1, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800fae4c78, %r1, %r9
	setx	0x18ed63a11bc7e047, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000ceb6d51208, %r1, %r9
	setx	0x8aa3fff55dffcba2, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000dedaa1c4e8, %r1, %r9
	setx	0xa892698eabe70e33, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e5044677f8, %r1, %r9
	setx	0x1728df3e4655c220, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000faca2f1b40, %r1, %r9
	setx	0x9c1c84e7a0d1ed7f, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800eba73b0, %r1, %r9
	setx	0x56564364b0b70d2a, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f1cf358, %r1, %r9
	setx	0x0f12b3847075ba04, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c4bedcc9a8, %r1, %r9
	setx	0x1ac3d8924d022297, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000dfd924bf30, %r1, %r9
	setx	0x8147b27ab31ad59c, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e87edfe480, %r1, %r9
	setx	0xc5c6873955299360, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f2c7a6c1a0, %r1, %r9
	setx	0xcfed9bf145e29ffe, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c38e1049e0, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800ff41fc8, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800e019b58, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000fadb4a2d00, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000ec4cddbdb0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d37b0d5460, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000c3ffe38648, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800f09dc50, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800e061358, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000fca1aa2078, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000e9635aacf0, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800e5f9e48, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000fc1d80d778, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000e6cbe45328, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000da1e586d20, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000cc5d0c08e8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800eaa4640, %r1, %r9
	setx	0xd744508874ed4fd0, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800ff35920, %r1, %r9
	setx	0xb1ab966ce7898723, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c857c756a0, %r1, %r9
	setx	0xb7d242804b14f718, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d2b98a5718, %r1, %r9
	setx	0xb3db58929ce9a1b5, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e534a230e8, %r1, %r9
	setx	0x0220cee97f916f77, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000fe175c7ef8, %r1, %r9
	setx	0x540c1ab17cc98704, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e33a100, %r1, %r9
	setx	0x238276cdfb396950, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800fbe8a70, %r1, %r9
	setx	0xa20283375598064a, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000cd3cadf610, %r1, %r9
	setx	0x210b434f0d12e274, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000dd3ac11e90, %r1, %r9
	setx	0x45b9da8b4514cc69, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e930a05368, %r1, %r9
	setx	0xbc40ee25c88a6e42, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f82c37cba0, %r1, %r9
	setx	0x0eaef9ee0f1dcac0, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800ee08b80, %r1, %r9
	setx	0xaf3dadababca6ef2, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800fcc5b68, %r1, %r9
	setx	0x438f9955d6a47c68, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000cc4292cf08, %r1, %r9
	setx	0xe8a7eaecd339e1a3, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000dca997c968, %r1, %r9
	setx	0x5ae11e2ccded7e6e, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000ec827e2e50, %r1, %r9
	setx	0x3d625ff0a69687b7, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f0ab264d40, %r1, %r9
	setx	0x19e49d980a69ab4c, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e60ef78, %r1, %r9
	setx	0xdb69643ddfee6f61, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f505bf0, %r1, %r9
	setx	0xb044248cb7224da9, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c926498e50, %r1, %r9
	setx	0x8e1e77a4c1ba2426, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d9161b2488, %r1, %r9
	setx	0x1f1405e375da3ad8, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e7116b41e8, %r1, %r9
	setx	0x07d4c602e2435d77, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000fc2fa15388, %r1, %r9
	setx	0x62bf7d70cde50fee, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800e2a4d60, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000fcca1653d0, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000feab538228, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000ee1c3a3f78, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000df1b450c68, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000c39a17d568, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800edefef8, %r1, %r9
	setx	0x42907325ed2fd533, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800fabb8a8, %r1, %r9
	setx	0x6437334749a80bac, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c182f80628, %r1, %r9
	setx	0xca25847542306fdc, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d9484b8a20, %r1, %r9
	setx	0x17633395735593df, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e1e7a0d300, %r1, %r9
	setx	0x0c7e1b3fb06834c6, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000fe259bfba0, %r1, %r9
	setx	0x0eeda05b5c7f89f8, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e1585a0, %r1, %r9
	setx	0x1f06d54f3f3c303e, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800fc6f068, %r1, %r9
	setx	0x0a7684af060728db, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c3898e5d08, %r1, %r9
	setx	0x467da3fc38d75864, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d634daa2b0, %r1, %r9
	setx	0xbe4b0174c71666ad, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e4502a95c8, %r1, %r9
	setx	0xd05f6253f3d8c4c8, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000fcdaa22840, %r1, %r9
	setx	0x054999757e82bd8e, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e9b0c28, %r1, %r9
	setx	0x572afce6e950f3e6, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f766a20, %r1, %r9
	setx	0xc1e71b9ca5485e89, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c134b31848, %r1, %r9
	setx	0x70dc2ac51430878a, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d268224800, %r1, %r9
	setx	0xd7683203bd5ac8ff, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e96e3cd9a0, %r1, %r9
	setx	0x3cfdf488ef5ffc95, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f02e0b17c8, %r1, %r9
	setx	0xaa4fbc9f2a1c9707, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e0fc600, %r1, %r9
	setx	0x0c0bd3d83d98f6f2, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f1a9230, %r1, %r9
	setx	0x9db88932feda3669, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000cdf9fc6ca0, %r1, %r9
	setx	0x3532f6275ade15ac, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000dc7cf871f8, %r1, %r9
	setx	0x28c522292709d600, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e763caf110, %r1, %r9
	setx	0xa66da50906ff631a, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f06c29f590, %r1, %r9
	setx	0xaebcbad975f9e7cb, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800fcee360, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800e3149b0, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000fa4fcd9940, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000e143b54540, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000db5e58aa78, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000cdc77c2c90, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000e68c21db30, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000da5ea2f8a8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000c93e7bafe8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800f6cda70, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800ec14318, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000fe48fbea18, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000ea0d1cbd90, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000d63b8cb898, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000c63a5f28d8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800e9428a8, %r1, %r9
	setx	0x3ad298a716431d8e, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f235f30, %r1, %r9
	setx	0xff0a46d130ae9c78, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c7e404cd08, %r1, %r9
	setx	0x331478ab57548605, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d3bed8cf90, %r1, %r9
	setx	0x8adcfbd65530c3b5, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000eeb4699590, %r1, %r9
	setx	0xff5bc2b6439630c9, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f2fe54fc98, %r1, %r9
	setx	0x0bc65f2203b79e87, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800efe9828, %r1, %r9
	setx	0x29bb9bf3f2ba4831, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f5e48b0, %r1, %r9
	setx	0x33a55865bd80d723, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c02b20c3c0, %r1, %r9
	setx	0xf4b3d919ef50c0b8, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d9e16df2f8, %r1, %r9
	setx	0x13c0e9afe625969a, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e4bfa57648, %r1, %r9
	setx	0xaa09c31a4ec285d8, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f4e8eb83e0, %r1, %r9
	setx	0x17c84e7cf0698087, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800ea22178, %r1, %r9
	setx	0x49832e0655a00c4e, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f0d01a8, %r1, %r9
	setx	0xab172e806a006c51, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c51c5d7080, %r1, %r9
	setx	0x8e8ca69c077b418e, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000dfb4e8b208, %r1, %r9
	setx	0x1bb92e3778b498e8, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000ec2f439148, %r1, %r9
	setx	0xe842d59cdfadd729, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f6a1445770, %r1, %r9
	setx	0xe18c072a2efdd9cd, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e54fdc0, %r1, %r9
	setx	0x3eef1dc66956c147, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800fe4d5a0, %r1, %r9
	setx	0x695da169c7a4100d, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ce3572a400, %r1, %r9
	setx	0xd4c84b5d024f1f5d, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000dabffa4ef0, %r1, %r9
	setx	0xa1be79e2cf468f20, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e3b4da4d40, %r1, %r9
	setx	0xa32dbf1241f07208, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f464980b30, %r1, %r9
	setx	0xf7c1574576d8f9c3, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f4b80d8, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800e68dcd8, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000f4eafeebc0, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800f041450, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800ea12638, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000fadb4a2d00, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000ec4cddbdb0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d37b0d5460, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800f3a51f0, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800e7056d0, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000f087edb668, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000c42220d460, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800fe04d40, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e4ad498, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e9d00d8, %r1, %r9
	setx	0xe0eabd1c4ed9d626, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800faaa790, %r1, %r9
	setx	0x207b3384dd25e05f, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000cfe1976368, %r1, %r9
	setx	0x7525678fe763f5c0, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d0f0696cc0, %r1, %r9
	setx	0x7ee1dd8a0c938811, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e323374330, %r1, %r9
	setx	0x165a1ce95f89325a, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000fce3cd96f0, %r1, %r9
	setx	0x697348aa163c0938, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e48d058, %r1, %r9
	setx	0xad97faded08da034, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f03c180, %r1, %r9
	setx	0x00285a298cab2642, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c34de8c168, %r1, %r9
	setx	0x88f68195eac19ca6, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d687f75cc0, %r1, %r9
	setx	0xa5f2031d599b0994, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e6be5f67c0, %r1, %r9
	setx	0xf620561c5505d884, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000fe53908828, %r1, %r9
	setx	0xc5f6d96cf942a388, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e5907d0, %r1, %r9
	setx	0x06c31b1cdb36b764, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f5df6f8, %r1, %r9
	setx	0x27b90fcadea30741, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000cc08bb41e8, %r1, %r9
	setx	0xe907fd2ae689b734, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d07734b6c0, %r1, %r9
	setx	0x724d759c5d7af042, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e44fa10e78, %r1, %r9
	setx	0x660d5885879cf685, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000feddd41f88, %r1, %r9
	setx	0x81b2df4414529374, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e5ac8b8, %r1, %r9
	setx	0xcd81339ebb6237a5, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f6bd468, %r1, %r9
	setx	0xccf03dfa977b488c, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000cc71f74678, %r1, %r9
	setx	0xec4425ab575f4b68, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000db7517d708, %r1, %r9
	setx	0x22fa7889f8acb6df, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e3fff4d1d0, %r1, %r9
	setx	0x47cc2a75cc91d5fc, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f49b9c9c38, %r1, %r9
	setx	0x0a24d52eb4ee78e2, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e023b4e978, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000f2aa45fc08, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000ec0e04adf8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e6fbbd0, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000feab538228, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000ee1c3a3f78, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000df1b450c68, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800efd8620, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e000438, %r1, %r9
	setx	0x65e8c33f9187b725, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800febef30, %r1, %r9
	setx	0xb65fc823a8dbf5db, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000cfef29cd98, %r1, %r9
	setx	0x2351268ecde989c9, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d663ec7100, %r1, %r9
	setx	0x5a1393ff854019cf, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e486b41a10, %r1, %r9
	setx	0x33c3d38071b60d95, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f24c28f710, %r1, %r9
	setx	0xbc2386eccad5a984, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800ecf06f0, %r1, %r9
	setx	0xea41ec37e9749757, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f327930, %r1, %r9
	setx	0x4aa4884900d8c21a, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c53e09c050, %r1, %r9
	setx	0x670b1e9cbc1c42cb, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d71622cb38, %r1, %r9
	setx	0x62876e0377e4bb7f, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000ebb86c3a60, %r1, %r9
	setx	0xa7cbae88ee8ce77a, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000fe221416d8, %r1, %r9
	setx	0x38dd2d54d62b6aee, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e0dbb48, %r1, %r9
	setx	0xd84afd8ed817e772, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f3342d8, %r1, %r9
	setx	0x75d65e9e5b350fd3, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c54e08f338, %r1, %r9
	setx	0x33cbb20838d8021d, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d132a4dd70, %r1, %r9
	setx	0xe1f2ddf99c3d7c03, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e98199b248, %r1, %r9
	setx	0x4239d104414c4d09, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f2a499a748, %r1, %r9
	setx	0x2b94c9b39a4fa759, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800ea9f9d8, %r1, %r9
	setx	0x099416bb6e5f38cc, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f031730, %r1, %r9
	setx	0xb494081bd20cdbe9, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000cbff55ccf8, %r1, %r9
	setx	0x932c3d06146bb435, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d7f3af2188, %r1, %r9
	setx	0x7521673304f29287, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ece0f60498, %r1, %r9
	setx	0x6bafc94dc43da435, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000fc75985070, %r1, %r9
	setx	0xf9449a8a24314300, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f4804a1cd0, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000e346ad3d50, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000de6cfbd920, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000c5423eccd0, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800f5fb5f8, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800ed32950, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000f6414a00d8, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800eea3b30, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000fe408982b8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e410540, %r1, %r9
	setx	0x3b1b169cd98fd952, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800fc74ed8, %r1, %r9
	setx	0x172a230907fd248e, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c7c7dc3a08, %r1, %r9
	setx	0x388a3c9834d24ad1, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000da8c99d328, %r1, %r9
	setx	0x9a7328571d7f2bf0, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e617ff9438, %r1, %r9
	setx	0xce383c780156890c, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000faa1c16140, %r1, %r9
	setx	0xd8f31a8a20b2136a, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800ee34e60, %r1, %r9
	setx	0xecc70021f3251d38, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800fe14100, %r1, %r9
	setx	0xc3b011c5d9b91d05, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c0dae5a000, %r1, %r9
	setx	0xf4c07c4e6f04199d, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000daae5d5168, %r1, %r9
	setx	0x9b2adc2ff9b83f06, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000eb812fc9c0, %r1, %r9
	setx	0xa865bb36306687fd, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000fe0a0a0670, %r1, %r9
	setx	0x2f10b6e07090c7b1, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e6c74b8, %r1, %r9
	setx	0x2e8c84be4601ad8c, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f943620, %r1, %r9
	setx	0x7fd0ca9eeeee2068, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c699b526c0, %r1, %r9
	setx	0x973806d3355460ff, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d604d78388, %r1, %r9
	setx	0xf1a0675f30a4fc2a, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000ee9a95f878, %r1, %r9
	setx	0xcefe6dde65eac5cd, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f6c02fa2c0, %r1, %r9
	setx	0x42896253fa1c4495, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e09c330, %r1, %r9
	setx	0xe882c8caf3b4c0e6, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f79b918, %r1, %r9
	setx	0x2df34835e7ae6ff1, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000cafbbc8168, %r1, %r9
	setx	0x9a4257a197ce484c, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000db609b2870, %r1, %r9
	setx	0x614549db4c260ba4, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ec5d2993a8, %r1, %r9
	setx	0x4f3420afff52e407, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f6884f69c0, %r1, %r9
	setx	0xeb932721b247938f, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d7d7853b00, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800f041450, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800ea12638, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000fadb4a2d00, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000ec4cddbdb0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d37b0d5460, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000cbccd7f918, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800fe5dca8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e6847d0, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800f801148, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e732eb8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000f0677d6690, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000e147179900, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000d190939ae0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000c69b244428, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800f8c4168, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800ed97138, %r1, %r9
	setx	0x36abeeeb2418f875, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f320b80, %r1, %r9
	setx	0x64d80d5865a53862, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000cac326e4b8, %r1, %r9
	setx	0x44653b588e7acfac, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d5f21ce920, %r1, %r9
	setx	0xe2c74ec22dd9b237, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e1d8026680, %r1, %r9
	setx	0x83048bc318895412, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000fe1f1ad6e0, %r1, %r9
	setx	0x4027124d44f2ff9e, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800ea16728, %r1, %r9
	setx	0x846382d5c30dcf63, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800ff85020, %r1, %r9
	setx	0xa9bf717c95067b50, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c507bcf050, %r1, %r9
	setx	0x81d90a7a4cbf4ffa, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d6963e0290, %r1, %r9
	setx	0xcf854a587d9f1850, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000ee78e4f370, %r1, %r9
	setx	0x2f0c63b5cc7ca088, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f8331b0588, %r1, %r9
	setx	0x6828f62401bba104, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e6c3d10, %r1, %r9
	setx	0x4683ae6683b63780, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f46dc58, %r1, %r9
	setx	0xc4cab8486825bc45, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c236748dd8, %r1, %r9
	setx	0xa8ef4c8c54aae151, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d0ff7c3528, %r1, %r9
	setx	0xd4a1ad0ff29abae8, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000ef00c154f0, %r1, %r9
	setx	0x28b111976f9fe9be, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f899bc7cd0, %r1, %r9
	setx	0xe5acd7093ff00a31, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e2a9438, %r1, %r9
	setx	0x9e689497c8025784, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f8337e8, %r1, %r9
	setx	0x375a5c2676ac95db, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000cd321dcd88, %r1, %r9
	setx	0x695f381532adc530, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d6e951ba40, %r1, %r9
	setx	0xb46764de09455673, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e0aa54d8b8, %r1, %r9
	setx	0xb2e7cc8c45a64d4d, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000fea84f6290, %r1, %r9
	setx	0x353d97829c8bddb0, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f0d3570, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800eed05e8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000f4ca624230, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000eb4c38d028, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000d0b9979e30, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000c3ffe38648, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800f09dc50, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800e061358, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000fe1b948a68, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000ed5c340f08, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000da6ae7fd08, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000cdafbda3c0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800ffcce98, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e1bf388, %r1, %r9
	setx	0xef85e99ceccbc9cd, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f6b4078, %r1, %r9
	setx	0xa703a39dc457be7b, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c939a4fb68, %r1, %r9
	setx	0x1577bfabb28d3fdb, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d6f4897610, %r1, %r9
	setx	0x51ee17731241c0bb, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e55f7c3448, %r1, %r9
	setx	0xef1e3bc71c353db3, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f8564d4770, %r1, %r9
	setx	0xcde7411e9e5fbb88, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e2a8820, %r1, %r9
	setx	0x3f263ee1b139ae32, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f885460, %r1, %r9
	setx	0x88b83a312a93b0c6, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000cbb6a02208, %r1, %r9
	setx	0x8852172b5fb31236, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d7abe98c20, %r1, %r9
	setx	0xbec2acce2540a8b9, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000eb4ef68f28, %r1, %r9
	setx	0xa2790306721917c3, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f07226bf08, %r1, %r9
	setx	0xc46780cb43087c6d, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e26f6e8, %r1, %r9
	setx	0xcebdf69559c8a429, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f7fdec0, %r1, %r9
	setx	0xd718c94bf901cd00, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000cf6db90078, %r1, %r9
	setx	0x0fadcfc1551a1d2c, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d690ff3398, %r1, %r9
	setx	0xe452d73b3c5b40ad, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000ea0007c410, %r1, %r9
	setx	0x54ca209f85a09018, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f8114195e0, %r1, %r9
	setx	0x323008ae882ba647, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e339d28, %r1, %r9
	setx	0xee7d820b990e5281, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800fc1ac58, %r1, %r9
	setx	0x5482e8eae844285f, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000cca0f639c8, %r1, %r9
	setx	0x921bf64d135eef77, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d2bc6d9780, %r1, %r9
	setx	0x6bfa2710ed313173, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e38e11ec48, %r1, %r9
	setx	0x1f88a34cfa55eb4d, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000fa70879458, %r1, %r9
	setx	0x87e1cea91d993e83, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800e28aad0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000f045560e98, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000ec23a69480, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000f899bc7cd0, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000ef00c154f0, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000d0ff7c3528, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000c236748dd8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800f46dc58, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800f8337e8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e2a9438, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000f6884f69c0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000ec5d2993a8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000db609b2870, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000cafbbc8168, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800ecf3900, %r1, %r9
	setx	0xcaa406e0635594d9, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f767530, %r1, %r9
	setx	0x0af5ebe3ade3d29f, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c1b06fbdf8, %r1, %r9
	setx	0x962a7b6c89d7d691, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d0fcbeaf20, %r1, %r9
	setx	0x1298105ad5c8ff9f, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ee445eb728, %r1, %r9
	setx	0x9cc53913c4949853, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f26ee505d8, %r1, %r9
	setx	0xb2f51ea470c20e14, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e29d780, %r1, %r9
	setx	0x92e4121604e5c78b, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f7ebca0, %r1, %r9
	setx	0xc9111e67c20a8026, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c4c9408720, %r1, %r9
	setx	0x180855b15f100cd8, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000dd5a44db38, %r1, %r9
	setx	0x7d960d0c9c752582, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e2f8872418, %r1, %r9
	setx	0x5282bd762cb5ef03, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f46e5a3b88, %r1, %r9
	setx	0x3019b1b5e5aad9f9, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800ea8b290, %r1, %r9
	setx	0xa5586114479daeae, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f1ae300, %r1, %r9
	setx	0x20f06a4dbe1e1f12, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c1f3c5cba8, %r1, %r9
	setx	0x1e20113e56612584, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d3777c36d8, %r1, %r9
	setx	0x8ae20bfba9e873f1, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000ee1305a348, %r1, %r9
	setx	0x5dcfec8157b03197, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000fefc807f78, %r1, %r9
	setx	0xe8c3b0115649c69c, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800ec91788, %r1, %r9
	setx	0xbb07fcf8b82c88c3, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f7d7550, %r1, %r9
	setx	0xe980e5db8f73743c, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c0efd79210, %r1, %r9
	setx	0x8539d1374ee0ee9a, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d6d71a0190, %r1, %r9
	setx	0x6c7994397c03c331, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e6f711fe38, %r1, %r9
	setx	0xb2ec7ff8a8649105, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f25f7f6418, %r1, %r9
	setx	0x59282ce7120a8fe6, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800e9023f0, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000fc4c3e1ed0, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000e7960401b8, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800f7df0c0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e6c1928, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000fc2c93c908, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000e0988fe2d8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e0dbb48, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000feddd41f88, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000cea6986300, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800f657d18, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800eeddb98, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000fa847cd520, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e61c430, %r1, %r9
	setx	0x95185e0535bfb31b, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800feb8490, %r1, %r9
	setx	0xc6d24b69d64477f0, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c9897840f8, %r1, %r9
	setx	0x0f96ddb7147bf835, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000dce8363d90, %r1, %r9
	setx	0xbda7d70afb5ab9a9, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ecd25ded98, %r1, %r9
	setx	0xeb06bff5c05caf89, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f675aa7648, %r1, %r9
	setx	0xb0e5f99c74dae3d3, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800ea53f38, %r1, %r9
	setx	0xa009782895283b67, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800fbbd7d0, %r1, %r9
	setx	0xd7ec78319c7748b6, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c0b23ae298, %r1, %r9
	setx	0xcec0fbc21fc818ee, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000dae5ef1bb0, %r1, %r9
	setx	0x06709d624596a296, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e4e24c36e8, %r1, %r9
	setx	0x836358edb01421cb, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f0f0b75c88, %r1, %r9
	setx	0x9c26858385406ab0, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e314ac0, %r1, %r9
	setx	0x32d271a7af0495d8, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f432ab0, %r1, %r9
	setx	0x470d8d1648320f69, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c16f3c61e0, %r1, %r9
	setx	0xb0af28515ca58f6e, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000de6a90bb70, %r1, %r9
	setx	0x9445f742163f9db3, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000eddae97cb0, %r1, %r9
	setx	0x14250ffc99140ffc, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f82e1ae8b0, %r1, %r9
	setx	0x787339fa150afd19, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e74d8f0, %r1, %r9
	setx	0xf1a15bcb2526dd0f, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f02a570, %r1, %r9
	setx	0x835db69ac56df519, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000cbac8b4738, %r1, %r9
	setx	0x49e95e996003b620, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d707f67d68, %r1, %r9
	setx	0xc43f9d605c068909, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e29df48e70, %r1, %r9
	setx	0x215a35b88f752e61, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000fc9ed0aaa0, %r1, %r9
	setx	0xa35add64d7a5af06, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800ecf3900, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000f8564d4770, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000e55f7c3448, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000d6f4897610, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000c939a4fb68, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800f6b4078, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800e1bf388, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800fc6f068, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000ea0007c410, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000d690ff3398, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000cf6db90078, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800f413aa8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800eda2658, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000f6b5b793a8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000e24ce833d8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e48cca8, %r1, %r9
	setx	0xd392d32dc8719dcf, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800fcce910, %r1, %r9
	setx	0xdb606477c2d0ccc0, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ce0b7f88e8, %r1, %r9
	setx	0x1d1cff97d8445edd, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d3c87ab728, %r1, %r9
	setx	0x0bc39cbd11c72e10, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e791adaa68, %r1, %r9
	setx	0x38052cfcade8ee37, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000fae933b9c8, %r1, %r9
	setx	0x6cb58abd46b75fa2, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e2d9500, %r1, %r9
	setx	0x766ba9f70eb7aeb6, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f2545e8, %r1, %r9
	setx	0xe0240080db09732d, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c4f51e2eb0, %r1, %r9
	setx	0xdc50dd52dbcfc9e2, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d62b9fc000, %r1, %r9
	setx	0xf02a57afe491b83b, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e6635185d8, %r1, %r9
	setx	0xd304a0dd63597b58, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f6211a72b8, %r1, %r9
	setx	0xa6a0b103b4d28f11, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e452918, %r1, %r9
	setx	0x09ae47c9bbd31038, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f118328, %r1, %r9
	setx	0x1e723944b2a1c84c, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c24a1c3330, %r1, %r9
	setx	0x6f5efe3233c4d995, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000dd44c70958, %r1, %r9
	setx	0x2b843d6a5d83a3e9, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000ebe3af74c8, %r1, %r9
	setx	0xb97b55a086088d55, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000feb0ff80d8, %r1, %r9
	setx	0x45e3553353807ce1, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e3ece90, %r1, %r9
	setx	0x72ef5014f28343d1, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800fb5bda0, %r1, %r9
	setx	0xc0580a5317cee2bd, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c887af82f0, %r1, %r9
	setx	0xf3e8708fe558ccba, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000dce7cdd040, %r1, %r9
	setx	0xb09a8f66458149fd, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e67dd16b40, %r1, %r9
	setx	0x287c86ca0f451a68, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f2cee287e8, %r1, %r9
	setx	0xb6e24c396668c8a4, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000de0e245fb8, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000c9d1cf97d0, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000eed9257088, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d717214e58, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000c200283ee8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800ff23908, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800ec9a9e0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000faaea30f70, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800ff66968, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800e800c70, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000f666e4fe60, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000e737e574f0, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000d856eab7c0, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000c733ce2bf0, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800eabb2e8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000f069921fb8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000e13d5589f0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000dbbe6304b0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800ea381e0, %r1, %r9
	setx	0xafff0349de20af35, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f9f3950, %r1, %r9
	setx	0x595aa623a8af6bc3, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000cedd8da550, %r1, %r9
	setx	0xdf80dfd728ef8b02, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d47046e7f0, %r1, %r9
	setx	0xb72817030e282af2, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ed5849b128, %r1, %r9
	setx	0x75cce689b50bbb83, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000faf8057310, %r1, %r9
	setx	0xbcea48c670db0f0f, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e2fa8d0, %r1, %r9
	setx	0xca87cb76580ead8a, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f8e5c28, %r1, %r9
	setx	0x2f52adf7551c2e29, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000ce2c4643c8, %r1, %r9
	setx	0x1829e29dde87cec5, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d728582068, %r1, %r9
	setx	0xe064c93f995b78ef, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000ef0995f260, %r1, %r9
	setx	0xbb8491112d5bc951, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f6fce67aa8, %r1, %r9
	setx	0xe1f0159e89929159, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800ef68558, %r1, %r9
	setx	0x9c01813323110577, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800fb989f8, %r1, %r9
	setx	0x6935c3fe4027d4b5, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c798843980, %r1, %r9
	setx	0xe293f7a85fde0bb2, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d246cfab50, %r1, %r9
	setx	0x09304db57fb89ca6, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e141ab6280, %r1, %r9
	setx	0x02d583b7ca759236, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f84b3bf158, %r1, %r9
	setx	0x70ec1476c99c505e, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800ec26a20, %r1, %r9
	setx	0x60f4ae69aa257359, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f5bcff0, %r1, %r9
	setx	0x14482cc8f4f70f24, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ccdbc0dfa8, %r1, %r9
	setx	0x7c27406691918875, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000dab563cb00, %r1, %r9
	setx	0xeb0dea48e56d8ccc, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e56f5e9fb0, %r1, %r9
	setx	0x6d9acaf6ffcf7a2f, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f6f09031c8, %r1, %r9
	setx	0x694cfdc650312d3b, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f323f18, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800e6e35f0, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800e910788, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000f2aa45fc08, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000ec0e04adf8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d125969cb0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000c8d2d58f48, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000eb78ed7548, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000d95c46c0a0, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000c995027ef0, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800f3a51f0, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000f069921fb8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e50e2f0, %r1, %r9
	setx	0xe1f229ca7bd1a4df, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f6704e8, %r1, %r9
	setx	0x4e58d8beac37a571, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c2c40187b8, %r1, %r9
	setx	0x689e4964257d4d28, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000de5d874dc0, %r1, %r9
	setx	0xcc8437d50f39b22c, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e67382eae8, %r1, %r9
	setx	0x8704542ddb67104b, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f836bffbe8, %r1, %r9
	setx	0xd8eb5111d1dc08ce, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800ec67d88, %r1, %r9
	setx	0xc2fea74f64516b4a, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f5e2378, %r1, %r9
	setx	0x9a8b90c1c3382ef0, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c1fa212ea8, %r1, %r9
	setx	0x2c136b5ae648547e, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d6e484d140, %r1, %r9
	setx	0x2c83806f3749f0cc, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e808c76e18, %r1, %r9
	setx	0x1dca193426e3ffef, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000fe139c64c0, %r1, %r9
	setx	0x0afa2d6e8c844e4f, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e69e390, %r1, %r9
	setx	0x7cea284aff40f5d1, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f887030, %r1, %r9
	setx	0x64c01de2255cdf5c, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c1b80acd30, %r1, %r9
	setx	0x22d28d638fc6c758, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d6d02b5ca0, %r1, %r9
	setx	0x500fadf129cd6c7a, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e7eb1a2b48, %r1, %r9
	setx	0x109cf591034e90be, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f44253c0d0, %r1, %r9
	setx	0x57da06985fab207c, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800eb1e648, %r1, %r9
	setx	0x9357deb249522f2b, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f0fef68, %r1, %r9
	setx	0xcb126caa5210dec2, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c0748c7d48, %r1, %r9
	setx	0x1cbb003c61932da9, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d8a35f1190, %r1, %r9
	setx	0xe2c2bd699d4662c3, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e2638d8e88, %r1, %r9
	setx	0x656270d9d97672bd, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f24a45b508, %r1, %r9
	setx	0x777afc5aa6ece799, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f664d95278, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000ee60ab8478, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000df14dafe10, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000c38e1049e0, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800ff41fc8, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800ff85020, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800ea16728, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000fe0a0a0670, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000eb812fc9c0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000e737e574f0, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000d856eab7c0, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800ec40cf0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000f65857d5a8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000e61883d920, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000da8e5b6ef0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e9128b8, %r1, %r9
	setx	0x4919e87ba4b95c04, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800fdb07c0, %r1, %r9
	setx	0x627208ef8385efc6, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c5f6b495b0, %r1, %r9
	setx	0x357a8eb066b384fc, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d75d99af20, %r1, %r9
	setx	0x1a7fa18f2ce81293, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ecb429c448, %r1, %r9
	setx	0x24b64954a7161484, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000fc848eb628, %r1, %r9
	setx	0xbb1b06998c60e67a, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e459568, %r1, %r9
	setx	0x1c4cb3e9dc4a6049, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800fc75c18, %r1, %r9
	setx	0xc1d1a79ff467b11f, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000cff4676b08, %r1, %r9
	setx	0xef595764f6113c08, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000db26dfabe0, %r1, %r9
	setx	0xad1b41d06e177629, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e74c537be0, %r1, %r9
	setx	0xc706bf93cebe3949, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f075e13628, %r1, %r9
	setx	0xf9f27f67fbc97b14, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e5d2f40, %r1, %r9
	setx	0x7b11f813a481a6bd, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f6def18, %r1, %r9
	setx	0x8bc0b11ae643c7e9, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c887943720, %r1, %r9
	setx	0xcd6862570813e90c, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d190553e10, %r1, %r9
	setx	0xaa6495ec0cd02963, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e241316300, %r1, %r9
	setx	0x3c13c08272d5af4b, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000fc3e41e470, %r1, %r9
	setx	0x55213186d3abe378, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e232748, %r1, %r9
	setx	0x283082477e2af0c5, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f4228c8, %r1, %r9
	setx	0x8dd6043480f7ca90, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000cb8fbfaab0, %r1, %r9
	setx	0x542f1b4f1cfc0aeb, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d2d91ac5e0, %r1, %r9
	setx	0xf2a643f47b7a3ccc, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e826e4be88, %r1, %r9
	setx	0x257bbe3b0d985f65, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f6b4f504c0, %r1, %r9
	setx	0x6728d217ac29013a, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d0f0696cc0, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000cfe1976368, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800faaa790, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800e9d00d8, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000f2fe54fc98, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000eeb4699590, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000d3bed8cf90, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000c195875f00, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800f6c82f8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e910788, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000f2aa45fc08, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800fcc5b68, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800ee08b80, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000cd321dcd88, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e9f8a10, %r1, %r9
	setx	0x4f1d88c1fa1d5ef2, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f36aef8, %r1, %r9
	setx	0x3aebd0b87fafcbc8, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000cde4de0f28, %r1, %r9
	setx	0xda6fb4121c64b6d5, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d0b110ab48, %r1, %r9
	setx	0x013a354ed4291f21, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ed6c61a9a0, %r1, %r9
	setx	0xb750119d1af63b2e, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000fa8e9013f0, %r1, %r9
	setx	0x418082d6d847a4ea, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e7549d8, %r1, %r9
	setx	0x2eb971120b415780, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f703790, %r1, %r9
	setx	0x6c3e8de01654cd31, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000cdee7fba00, %r1, %r9
	setx	0x81c15896eef3bab1, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d8235f4390, %r1, %r9
	setx	0xfc8b82ce7be0127e, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000ef296852c8, %r1, %r9
	setx	0xb8e8395f87e7bcdb, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f04b8c3078, %r1, %r9
	setx	0x77adf6a5f9e09ca4, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800ed4aab0, %r1, %r9
	setx	0xd13c57f395a4f1fe, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800fb97d18, %r1, %r9
	setx	0x20be3328d44fc2b6, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c58396b078, %r1, %r9
	setx	0xa53393b2bf99524a, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000de5d884938, %r1, %r9
	setx	0x95f1b145dc65be38, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e149e22cf0, %r1, %r9
	setx	0x51c31f6d0e447c7a, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f62de8bd98, %r1, %r9
	setx	0x7e8b7abcb27074b1, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e8d1c40, %r1, %r9
	setx	0x12e66bf13f74985d, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f381900, %r1, %r9
	setx	0x77382d348dd7d868, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c19bc2ffd8, %r1, %r9
	setx	0xd0659c28c9f1851e, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000db55145a30, %r1, %r9
	setx	0x2e6dde8290694e0f, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e8a1965fa8, %r1, %r9
	setx	0x298e31d8ee0a0c45, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f646e265a8, %r1, %r9
	setx	0xda148d5d1e48c6a3, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c18d3aa8c0, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800fb1b080, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800ee58b90, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000f664d95278, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000ee60ab8478, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800fbc2e08, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800ec041f0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000f8db2192c8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000e440f874f0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d1221f39c8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000c2e59fc218, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000cbff55ccf8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800f031730, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800ea9f9d8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000f49b9c9c38, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000e3fff4d1d0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800ec89ee0, %r1, %r9
	setx	0x26f28b213e0a193d, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800fbd3dd8, %r1, %r9
	setx	0x9acc47f7781cb406, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c276ec6ca8, %r1, %r9
	setx	0x042a1554dac6e1f1, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000dbe57fc378, %r1, %r9
	setx	0xe06fb131f4b14587, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e725ab4828, %r1, %r9
	setx	0x53b11b18186e0fbd, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000fa9e89e4b0, %r1, %r9
	setx	0x6f3b95c045433485, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800eee5158, %r1, %r9
	setx	0xf7d1493cd0b5c3c0, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f93a4c8, %r1, %r9
	setx	0xf3e09fe2722027e2, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c61a503e18, %r1, %r9
	setx	0x9aef6f0620bb43e9, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000dab25c4468, %r1, %r9
	setx	0x0dbc7850ad85f80a, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e845f5f438, %r1, %r9
	setx	0xbffe18800fcf4f4b, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f03993c650, %r1, %r9
	setx	0x80279269b1b788a8, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e3856d0, %r1, %r9
	setx	0x46a5db93a6ee9397, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f431770, %r1, %r9
	setx	0x0bf405368e2dbbd6, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c9df8ddc08, %r1, %r9
	setx	0xe20433768f9d3ae0, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000db4c6fafe8, %r1, %r9
	setx	0xf9fb3c320f58f4a5, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000ef7ff65bf0, %r1, %r9
	setx	0xf763deb320fa9f1f, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f4bb5bf4e0, %r1, %r9
	setx	0xdeecdcecd24617cb, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e0aa5b8, %r1, %r9
	setx	0xb4c507cda77e7cc1, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f1d5100, %r1, %r9
	setx	0x2ef32949d6f67185, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000caff5e3dd8, %r1, %r9
	setx	0x153f835536f3bc2c, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d99b259600, %r1, %r9
	setx	0x758af5c4864ac4e0, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e2f0a9a968, %r1, %r9
	setx	0xfdd058215f586aea, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000fe5c4dfde8, %r1, %r9
	setx	0x5d919812585fdaf9, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000cfe1976368, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800faaa790, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800e9d00d8, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000e318218f08, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000d7f59ea928, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000ca375e5198, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800fc67118, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800eb9bca8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000fe2942eee0, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000e51f7d3f18, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800ef597a0, %r1, %r9
	setx	0x57200b05a6e65ec4, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f5e67f0, %r1, %r9
	setx	0x364b17ebdea32355, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c1f804c9d0, %r1, %r9
	setx	0x3a49b81e2ff10c60, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d3320b1bd0, %r1, %r9
	setx	0xd58d578598908945, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e358b5d0d8, %r1, %r9
	setx	0x4ac6a53e8b94c238, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000faa50d2950, %r1, %r9
	setx	0xca68bb66e65ace84, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e24fb30, %r1, %r9
	setx	0x5525b08af238f7d6, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f091bd0, %r1, %r9
	setx	0x3f80d9e9728b88b7, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c1f5a2ac98, %r1, %r9
	setx	0xbbebff535f2f4267, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d8146db510, %r1, %r9
	setx	0xa7ac9804be3cecad, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e1b8e098a0, %r1, %r9
	setx	0xaab888ddce9120dd, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000fc5158e3d8, %r1, %r9
	setx	0x302b30f64823d54d, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e99e2a8, %r1, %r9
	setx	0x516bdd0e488d43a0, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f7576f8, %r1, %r9
	setx	0x1b5afd21ab21c908, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c2ff041640, %r1, %r9
	setx	0x2f171ecc61cd483e, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d8bb9a9ee0, %r1, %r9
	setx	0x33cf833c3520ce24, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000eef5682430, %r1, %r9
	setx	0x8508b67b714b1a0b, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000fc2f876a40, %r1, %r9
	setx	0xc4ea678f84443233, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800ee76790, %r1, %r9
	setx	0xb070da96ec765f99, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f844030, %r1, %r9
	setx	0xd7d26d1d57bd3f6b, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000cef0f0ec60, %r1, %r9
	setx	0xcda5fbfbe1691375, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000db0ee51820, %r1, %r9
	setx	0x8e2227f938a09e86, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e80f95a7f0, %r1, %r9
	setx	0x4e3dbfbcf0a24e20, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f852c88aa0, %r1, %r9
	setx	0x9135cc31a79697ae, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e534a230e8, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000d2b98a5718, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000c857c756a0, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800f59ef08, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e47d070, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000fef2ab38a8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000e18d6ee428, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d41b9501d0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e99e2a8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000f4bb5bf4e0, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000ef7ff65bf0, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000db4c6fafe8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000cd321dcd88, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800f8337e8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e2a9438, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000f6884f69c0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000ec5d2993a8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800ec0e768, %r1, %r9
	setx	0xc4b87d2a25fb718c, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f1eacc8, %r1, %r9
	setx	0xf7b3329a18aedb7a, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ce68b11af8, %r1, %r9
	setx	0x2b78fec50a409931, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000df29801c08, %r1, %r9
	setx	0xfa1f347fc27ae0be, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000eac3136620, %r1, %r9
	setx	0xea58e0a81389c0bb, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f007a05818, %r1, %r9
	setx	0x164b031b48885a7a, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e753e48, %r1, %r9
	setx	0x063ab71022216b97, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f16a220, %r1, %r9
	setx	0x78f84d905ab7516d, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000cea54a3100, %r1, %r9
	setx	0xbdd04f339ff98b4d, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d443924520, %r1, %r9
	setx	0xd8118f277c5faa56, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e6eebea200, %r1, %r9
	setx	0x375bbf4b87fbbba0, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f2e21074a8, %r1, %r9
	setx	0xd4fb919a20b5f2f8, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e1293e0, %r1, %r9
	setx	0x7877e68195b3aac3, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800fa71180, %r1, %r9
	setx	0x862d4d9fac8dbada, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c66f6a7f00, %r1, %r9
	setx	0x60108a60744b1c8f, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d0cd35f1f0, %r1, %r9
	setx	0xa71ac46087f95d54, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000ed4bd20b30, %r1, %r9
	setx	0x05ccd22f95f62d82, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000fc84756680, %r1, %r9
	setx	0x917ceaac6e365c7b, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e3c38b8, %r1, %r9
	setx	0xde0dc72cb04160de, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800fb13a88, %r1, %r9
	setx	0x29f900e4ead84ec9, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c33b003688, %r1, %r9
	setx	0xe60dc4f6f54377e7, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000dcc74de9a8, %r1, %r9
	setx	0xbde7f7ef4b6d831a, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000eb31a233a8, %r1, %r9
	setx	0x344571e471298a52, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000fce47949d8, %r1, %r9
	setx	0x7a7808e1119d9bb5, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f6b4078, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800e1bf388, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000fe1f1ad6e0, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000e1d8026680, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800e2a6218, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000f443c022c8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000e1a5cd2678, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d8145d4508, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000ce98ad2de0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800f13a0c0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e4127f8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d1fb08d750, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000c70296f318, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800f6fca50, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800ecf0d70, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000fed9a1e308, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000e616b05190, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000f47ce11130, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000e0766e9570, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000d71335c9d8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000c324fa0ad0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e93aa50, %r1, %r9
	setx	0xe7c865a8ae068e77, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f4aee98, %r1, %r9
	setx	0x7c6afc90cfd3af3b, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c89e002400, %r1, %r9
	setx	0x87d62b85d530c0be, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d064cf1528, %r1, %r9
	setx	0xc8f80a85346b125e, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e360ae2698, %r1, %r9
	setx	0xd9872091a104e5aa, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f8407058e8, %r1, %r9
	setx	0x4239a938291a4590, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e475be8, %r1, %r9
	setx	0xfd58b29e353f05b2, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800fd7e810, %r1, %r9
	setx	0x8040aa9ccb5ba9ed, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c47c997f90, %r1, %r9
	setx	0x22afcea8acee7b3f, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d128a492d8, %r1, %r9
	setx	0x436b657b5e943e0d, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e9142f0af8, %r1, %r9
	setx	0x3644df9c8b6cfc27, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f8132e5b28, %r1, %r9
	setx	0xfbb6fda4bab134d5, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800ee31fd8, %r1, %r9
	setx	0x3067ed3fa54e5bc1, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f379538, %r1, %r9
	setx	0x90bcd9ff785d2ec7, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c9d9aab108, %r1, %r9
	setx	0xee270cf8d8d90b35, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000df9b23af78, %r1, %r9
	setx	0x02f4d36023dc1cbc, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000ef329db748, %r1, %r9
	setx	0x29f88b6d34221a9c, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f6691be800, %r1, %r9
	setx	0x0db8db83cf00cc91, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e317e40, %r1, %r9
	setx	0x5d8559e0015f831a, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f627cd0, %r1, %r9
	setx	0x69c9936f2d465bb9, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c175c43798, %r1, %r9
	setx	0xc3253c1eb17d51b4, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d337a5de58, %r1, %r9
	setx	0x1b2bb6e04a021542, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e15bb8f000, %r1, %r9
	setx	0x72c52025ca27147d, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000fcd46e16a8, %r1, %r9
	setx	0x7fc6c5c907b8cfc3, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f6c0bc9ed0, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000e1c7ae88b0, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000dc2358a038, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000c59d20ad78, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800ff08188, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800ecef308, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000f4c60dadb8, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000cbb6a02208, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800f885460, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e2a8820, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000f8331b0588, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000ee78e4f370, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e8e5ab8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000f2e2526298, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000eb45260638, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000dcec892bc0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000cefec90a48, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800f23c420, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800edf86e0, %r1, %r9
	setx	0xa425558b04c4ca4d, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f56bbe0, %r1, %r9
	setx	0x114803dc10825bdc, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000cd3165b9e0, %r1, %r9
	setx	0x2208148556042653, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000de76b30838, %r1, %r9
	setx	0xf20fd1f4c31a4852, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ec9c7c4250, %r1, %r9
	setx	0x8763ca000eb597f2, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f257300f20, %r1, %r9
	setx	0x475892a7f017f25d, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e4425c8, %r1, %r9
	setx	0x5066ad94fb09a39b, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f95b128, %r1, %r9
	setx	0xc33befcf0e1d21d5, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000ca72205208, %r1, %r9
	setx	0x08e35f011b18f5ec, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d10a54b238, %r1, %r9
	setx	0xcb28e4e203cab6cc, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000ed646912c8, %r1, %r9
	setx	0xf6494f5ae140425d, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f6f77da2f0, %r1, %r9
	setx	0xd08b1ff3a17bae26, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e2bfed0, %r1, %r9
	setx	0x7203d8c94e935669, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800fe4fd88, %r1, %r9
	setx	0x92475adf28e45d12, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c1a63690d8, %r1, %r9
	setx	0xc0252aa7e1d9bfe5, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d83c2ada20, %r1, %r9
	setx	0xe8a97653f3d87fd9, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e35eef0348, %r1, %r9
	setx	0x4bf0629015396f14, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f865e7a558, %r1, %r9
	setx	0x90a9c652c1a944f6, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e575fc8, %r1, %r9
	setx	0x51400406a23379c3, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800fb754e0, %r1, %r9
	setx	0xf451a07c48a8f801, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ccfe564e48, %r1, %r9
	setx	0xdf90975dbff70e2d, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000dd9ebe9b90, %r1, %r9
	setx	0xb08ab18a97e353ba, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e0ed2a18d0, %r1, %r9
	setx	0xc011c97596305916, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f0c492c0d0, %r1, %r9
	setx	0xc32e0e2a10f50e7b, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800e895da0, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000fc9e4a8a20, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000ed62e513d8, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000d976e7bbe0, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000cfcf09b640, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800fd582a8, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000d09fb4fc18, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000c0d2c31e80, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800ee08b80, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000faca2f1b40, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000e5044677f8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800e3cf0b8, %r1, %r9
	setx	0xe715fba7b8a2708a, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f34c220, %r1, %r9
	setx	0x80dce3be678fffd7, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000cd2e8576f0, %r1, %r9
	setx	0x135951df7dfd50f0, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d4e383d638, %r1, %r9
	setx	0x29b27ccdd748134b, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e328125220, %r1, %r9
	setx	0x71daf0ea8ba7bb8c, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000fe82597f98, %r1, %r9
	setx	0x3f1ff03a181265f6, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800eab3cc8, %r1, %r9
	setx	0x6be05e035f623247, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f3ae6d8, %r1, %r9
	setx	0x2ef2db36b8fd8cc9, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c80eed87c0, %r1, %r9
	setx	0x7429231422f8d732, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000da1e67e160, %r1, %r9
	setx	0xc958e9af115d3af8, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e9b94be028, %r1, %r9
	setx	0x3086d7addcc7abb0, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f2251786f8, %r1, %r9
	setx	0x61b86babcb1310d9, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800efdda28, %r1, %r9
	setx	0x41e150039a81d479, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800fe3b728, %r1, %r9
	setx	0xc8853cb6ed5348f4, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c174b9ef08, %r1, %r9
	setx	0x8a8c4f01802bd3f0, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000dbfb3b28a0, %r1, %r9
	setx	0xe9f9f16a1f2f7e68, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000eb2effcb28, %r1, %r9
	setx	0x1824d34efeff7bbb, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f27ffe41d8, %r1, %r9
	setx	0xd2d2a575c8afc92e, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e128b50, %r1, %r9
	setx	0xeb7a8179fcc9afda, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f1d6de0, %r1, %r9
	setx	0x19bc952763575c90, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c5ed279490, %r1, %r9
	setx	0xe38a99f5ec2f378f, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d91cf983e8, %r1, %r9
	setx	0x435bf15b36ac2503, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ecd7f5da40, %r1, %r9
	setx	0x9416d1d88966a59f, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f0604b0860, %r1, %r9
	setx	0x139cd9938435ab34, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d28634a668, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000cfd76a7328, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000daae5d5168, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000c0dae5a000, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800fe14100, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800ee34e60, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000fe221416d8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000ebb86c3a60, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000f47ac614f0, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000c44aa1de28, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800fdbae60, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e9d3b08, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000f8bcb07d48, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e1759f8, %r1, %r9
	setx	0x0e9f0f67ee50131a, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800ff251c0, %r1, %r9
	setx	0x9245f152ae7e3322, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c62094ca88, %r1, %r9
	setx	0x5dac290e7ba84c7e, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d4f41bd7b8, %r1, %r9
	setx	0xf731ea2702c209b9, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e67a9a6440, %r1, %r9
	setx	0x11fcedf3faf95f6f, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000fef1105730, %r1, %r9
	setx	0x6ce4a5b1430a035b, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800ef981c0, %r1, %r9
	setx	0x0171125a2c7286d8, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f9723c0, %r1, %r9
	setx	0xc4d20f479998d8d5, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c82488f378, %r1, %r9
	setx	0x5f1be15d7f2a77e4, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d37eee3b60, %r1, %r9
	setx	0x6c91fd036f03ead5, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e01bc8f780, %r1, %r9
	setx	0x9ef98cf9cefdeeeb, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f8db610900, %r1, %r9
	setx	0x42baf22e396f6128, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800efb36a8, %r1, %r9
	setx	0xc2b57f3702b40547, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f864048, %r1, %r9
	setx	0x600761fcf355d743, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000ca15ecb520, %r1, %r9
	setx	0x5d2f38984644921c, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000dbacad0eb0, %r1, %r9
	setx	0x2c7d8a9f7b1173a1, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e8990340f8, %r1, %r9
	setx	0x80c53d6cb2471b2d, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f6cea5a778, %r1, %r9
	setx	0x7b0c403951d13b7f, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800eb12d28, %r1, %r9
	setx	0xe6dc774880b67940, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f5b03f0, %r1, %r9
	setx	0xb81762a5c76dc914, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c248aeda78, %r1, %r9
	setx	0xb60524d82dcb93eb, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d087c4eb20, %r1, %r9
	setx	0xb2cbd69bf9c00ba7, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e65b13ec18, %r1, %r9
	setx	0x4a89e1f6b8729b86, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f297f0a9c8, %r1, %r9
	setx	0x956ef98cf29fda47, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800eb83d00, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000f067d07de8, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000e31d17ed60, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000e5561789e0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d09fb4fc18, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000c0d2c31e80, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800fbc2e08, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000ec3f97fd48, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000dedc96bcd0, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000c6a6da7cb8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800f73c3f0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e54ce90, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000f6bb97e1c0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000e9eba66050, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000da67dfc2f8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800efb2140, %r1, %r9
	setx	0x5465609d4e7259b0, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f151448, %r1, %r9
	setx	0xada82be71049df71, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c4e39b4028, %r1, %r9
	setx	0x0ff9ab83436dc4ae, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000dbba19f7b0, %r1, %r9
	setx	0x2e79925dc2cfec2a, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e5d00c0678, %r1, %r9
	setx	0xf040d06a39409b82, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f28118f0e8, %r1, %r9
	setx	0xadd6547a0495caed, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800ef26848, %r1, %r9
	setx	0xcbd4e331471966c6, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f40bf08, %r1, %r9
	setx	0x7f52feee0d6ed9b5, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000ca87362a70, %r1, %r9
	setx	0xe29d7f0a62dd6250, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d70168e030, %r1, %r9
	setx	0xbbfc6dc62ecf949d, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000ea8e0160d0, %r1, %r9
	setx	0x44557e823e507117, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f07ce3bb38, %r1, %r9
	setx	0x5f0fd0baa3fe7101, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e22edf0, %r1, %r9
	setx	0x1f5280e0f9534462, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800fefbd98, %r1, %r9
	setx	0xaadca54a4e715ee1, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c1fe0cc7f8, %r1, %r9
	setx	0xfaacf961d0a01496, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d214b512e8, %r1, %r9
	setx	0x342cbde927291559, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000eb6ac1f4a8, %r1, %r9
	setx	0x885aa2b003cde819, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f004db63f8, %r1, %r9
	setx	0x5ab04d21c366c153, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e2a0ad0, %r1, %r9
	setx	0xb1b148ae56f8bd4e, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800fbe97d8, %r1, %r9
	setx	0x1a9be343fe05253b, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ca8fcb29b8, %r1, %r9
	setx	0xc6dff62e88d0a9bd, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d7b91c4958, %r1, %r9
	setx	0x294ec9548622a1a9, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e52db5bc80, %r1, %r9
	setx	0x94cdcd12408da5ce, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f2cc9c6988, %r1, %r9
	setx	0x41b76968c30e8254, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000eeb4699590, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000cbae63ebd0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800f5db058, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e0905e8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000f4fbaec108, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000ee427bf3f0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d71ab75b10, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000c5d9d0b4b8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800fc33eb0, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000e826e4be88, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000d2d91ac5e0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000cb8fbfaab0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800f4228c8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e232748, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000f24a45b508, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e9428a0, %r1, %r9
	setx	0x872a5ee4e4509ba2, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800fe2f678, %r1, %r9
	setx	0x9c9401e24d62e451, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c9ef55c678, %r1, %r9
	setx	0x1d0ade425d50e9fc, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d91b4ed690, %r1, %r9
	setx	0xe5bba51cc5acacce, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ea68c10990, %r1, %r9
	setx	0xb02e23a1d6839b3f, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000fa94d0d058, %r1, %r9
	setx	0x5c11f62e7662bf0c, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e03f6a8, %r1, %r9
	setx	0x28a9a130b7079ce0, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f4dd578, %r1, %r9
	setx	0x5646bd1b642cc90e, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c4db430ac8, %r1, %r9
	setx	0x18bd10e245dabcf8, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d76363a7a8, %r1, %r9
	setx	0x882f34dd403a3316, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e2e3c57200, %r1, %r9
	setx	0xea760951cb75e2a5, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000fe9af735a8, %r1, %r9
	setx	0x8e3310fc6b2e462d, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e8c0b08, %r1, %r9
	setx	0x68ef0644c5a706f7, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800ffdf580, %r1, %r9
	setx	0xed64151ef8b411dc, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000cb1a2c76e8, %r1, %r9
	setx	0x93415ad97bc9ca85, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000ddf432c808, %r1, %r9
	setx	0x1d31ee5af7b96670, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e1a0d95eb0, %r1, %r9
	setx	0x2020ac03c55a9ce5, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000fe3160f470, %r1, %r9
	setx	0xf5481ae44c5ff658, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e9585e8, %r1, %r9
	setx	0x1ba1948991548ae7, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f870000, %r1, %r9
	setx	0x520c474044265bf7, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000cb1a567a80, %r1, %r9
	setx	0xb23c4f8eccda5c0c, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d7c826dec0, %r1, %r9
	setx	0x51ec634df86b06b5, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000edd9573160, %r1, %r9
	setx	0xded18fd972f45cb1, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f05b4efb40, %r1, %r9
	setx	0x6502e00bbb8342db, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000dda2ae1ed8, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000ce758ac478, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000d03c327208, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000c8266e4ab8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800fc60668, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800efba940, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000fc9ca4a1e8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000e3547dbf68, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000dec0b26af8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000ef00c154f0, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000d0ff7c3528, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000c236748dd8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800f46dc58, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800e6c3d10, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000f6c02fa2c0, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000ee9a95f878, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000ec5d2993a8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000db609b2870, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000cafbbc8168, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800f79b918, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800ec58410, %r1, %r9
	setx	0x714d70ad433b9440, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f281a10, %r1, %r9
	setx	0xc27f9ea01285f3b3, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000cb68542e48, %r1, %r9
	setx	0x20826eedada00fb4, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d7a7d882f0, %r1, %r9
	setx	0x21982b250dcbcc23, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000eab1ca5418, %r1, %r9
	setx	0x04876fc2a19903a0, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f47eb0f168, %r1, %r9
	setx	0x529ad666499dce2c, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e14b800, %r1, %r9
	setx	0x3a40fbb5dead82a8, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f64a1a8, %r1, %r9
	setx	0x8e5c629765d28cf6, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000cdbff2e238, %r1, %r9
	setx	0x30e760159f03cd93, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d1bad52bc8, %r1, %r9
	setx	0xfa3ca8fb9e1811a9, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e2cd7f6fe8, %r1, %r9
	setx	0xdd452d4a66b3f990, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f212be0d90, %r1, %r9
	setx	0xe6d32ca139e79ee9, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e30f098, %r1, %r9
	setx	0x94e699fa226d1682, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800fb73b48, %r1, %r9
	setx	0x4d8cbf2f772c78e0, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c707f4da78, %r1, %r9
	setx	0x1645230ded505c53, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d79ea1b010, %r1, %r9
	setx	0x6401c8a4e1302c24, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e0843dea88, %r1, %r9
	setx	0x9a41ced86344e56d, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f47ece9d78, %r1, %r9
	setx	0x144a31a0e507caa7, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800ecf5a18, %r1, %r9
	setx	0xf9ec9653b74c6a99, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f66e9a8, %r1, %r9
	setx	0x70450c6ce05b70e2, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c99f2398f8, %r1, %r9
	setx	0x25f579c71f06ea61, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d88a2e15a0, %r1, %r9
	setx	0x9241985505594a30, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e987388ac0, %r1, %r9
	setx	0xcf6c55d467eee2ad, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f276a0d970, %r1, %r9
	setx	0x0d931dc184a33b6b, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f4c60dadb8, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000f8132e5b28, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000dfbd2575d8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000fe6d425c08, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000ea92481b90, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e39cf70, %r1, %r9
	setx	0x22636ace8bd24aba, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f1d7650, %r1, %r9
	setx	0x915f72d172e27f27, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c482a218a0, %r1, %r9
	setx	0x2153715f8f624282, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d470659800, %r1, %r9
	setx	0x910ca6eb71428c21, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e5d0a7b318, %r1, %r9
	setx	0xbbbde009fc608c88, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f00c588778, %r1, %r9
	setx	0x55e07984492d58bf, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e6445e0, %r1, %r9
	setx	0xf4bc9e80511780d5, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f123e70, %r1, %r9
	setx	0x4aafc6d117997aab, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c0b8db3248, %r1, %r9
	setx	0xd0f1bb2701534125, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000de3c5cfd80, %r1, %r9
	setx	0xf9d8cfb504873463, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e47ec61a18, %r1, %r9
	setx	0xe706d7d83f372633, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f46ff76780, %r1, %r9
	setx	0x7351786ae7e957e2, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800eed2df8, %r1, %r9
	setx	0xc9294d97a97d3706, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800fdbcd88, %r1, %r9
	setx	0x4338101c44335ff9, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000cbe99d5858, %r1, %r9
	setx	0x526a1aa23b8d7b7c, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d3f3a82d98, %r1, %r9
	setx	0xf75afab053abb46a, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e5c4c3f9d0, %r1, %r9
	setx	0x13eaaf7d89f88c02, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f0443d93b0, %r1, %r9
	setx	0x17c4d9f08bc0d664, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e2ad698, %r1, %r9
	setx	0x699b8d783f50059f, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f0f8bd8, %r1, %r9
	setx	0x7598ef83043be9e3, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c18d8be970, %r1, %r9
	setx	0x3cecc0a2e860f343, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d1342c1dc0, %r1, %r9
	setx	0xb6cfe03c55937375, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e61ca2ab38, %r1, %r9
	setx	0x36d398717170e3c0, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f2b2eb95e8, %r1, %r9
	setx	0xe9ee447b1dad99eb, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f6ceb51288, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000dab25c4468, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000e141ab6280, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000d246cfab50, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000e96b378268, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000d2728ec940, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000c8410d3180, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800f36b240, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e9d0fc8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000f47ce11130, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000e0766e9570, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e0555f8, %r1, %r9
	setx	0x655acb1a86310910, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800ffbaf40, %r1, %r9
	setx	0x971a6ebb0848fbbf, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000cba7d38080, %r1, %r9
	setx	0x75702fe45ae8c692, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d333e2fca0, %r1, %r9
	setx	0x9a35810b4b24cf8c, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e0630222c8, %r1, %r9
	setx	0xc58512bfb3c19bfb, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f8f05b4458, %r1, %r9
	setx	0x30ca2fae74994d82, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800ed6da70, %r1, %r9
	setx	0x918399e81df8e5be, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f479ba0, %r1, %r9
	setx	0xa573563db746bffd, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000cace363c98, %r1, %r9
	setx	0x21a968796f6de64c, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d5b27ebae0, %r1, %r9
	setx	0xc2acdf923e4b20df, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e29fbd9bd8, %r1, %r9
	setx	0x4678732a66a1ee79, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000fcda931e30, %r1, %r9
	setx	0xdd91f1ba28b177cd, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e0a7d70, %r1, %r9
	setx	0x29e1eb8c0735478c, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f1a2078, %r1, %r9
	setx	0x35c338a9bfefa78c, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c7f31faa70, %r1, %r9
	setx	0xcf4d9639375150fb, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d5200347c8, %r1, %r9
	setx	0x75575682aac414ab, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e3bd242388, %r1, %r9
	setx	0xb755e9a22075f84e, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f64f7cc130, %r1, %r9
	setx	0x496d9b4968d5942e, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800ed35fa8, %r1, %r9
	setx	0xbd175d579d996f91, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800fd7aaf8, %r1, %r9
	setx	0x954c21ee51901a71, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000cafcb62e68, %r1, %r9
	setx	0x606e1880b8d6d35f, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d8e1ae9ad8, %r1, %r9
	setx	0x9ec038ce926f2f6c, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e974e56978, %r1, %r9
	setx	0xfb0357e394b32e41, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000fc73e63d10, %r1, %r9
	setx	0xacae5644937d1a54, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c24846fa18, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000ddd4b99fe0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800f48b1e0, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800e353fd0, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000f46e1eea60, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800e09c330, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000fc75985070, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000ece0f60498, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000d7f3af2188, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000cbff55ccf8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800f031730, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800ee0c9e8, %r1, %r9
	setx	0xc64d349620e9a643, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800fd8e1d8, %r1, %r9
	setx	0x7ef8e30c9a2af1e7, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c1a9d93280, %r1, %r9
	setx	0xf67db92b355e3d07, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d157e40f98, %r1, %r9
	setx	0xa9f67ba7df3b99f4, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000eb42537b78, %r1, %r9
	setx	0x3080b13f69040d0b, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f8150dbdc8, %r1, %r9
	setx	0x10d855119ed7a14b, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e404808, %r1, %r9
	setx	0x9e14df14ad27117c, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f267d80, %r1, %r9
	setx	0x252314bf4b4ee8cb, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c93a8f8fb8, %r1, %r9
	setx	0xd5dc5009cffad570, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d810f4b698, %r1, %r9
	setx	0x8e7e233fa8c178f1, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000eeadf75080, %r1, %r9
	setx	0xf4043b21dae44596, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000fc8ba6a630, %r1, %r9
	setx	0xc9ea6983b80152a2, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800ea27330, %r1, %r9
	setx	0xc0645648a2bffb1e, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f03a500, %r1, %r9
	setx	0x40be6ec1601f62eb, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c0fc4ec9d8, %r1, %r9
	setx	0x821bdc349b7cc1c4, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000dc24d05ec8, %r1, %r9
	setx	0xf102ae06350f2827, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e200827090, %r1, %r9
	setx	0x4b9d799919f112b0, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000fa2b04c968, %r1, %r9
	setx	0x624289e88bbc9aa3, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e3b6ff8, %r1, %r9
	setx	0x5524c10d35edc35f, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800fdfd4d0, %r1, %r9
	setx	0x8d4358ae71cc3702, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c9061a8d18, %r1, %r9
	setx	0x37e5341e12de4d1d, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d144a45e90, %r1, %r9
	setx	0x841a35045fb96715, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000eefc6d7f78, %r1, %r9
	setx	0xaabe7f8ff2b2c20d, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000fe60abedb0, %r1, %r9
	setx	0x90150f50c1c74ac8, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f257300f20, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000ec9c7c4250, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000de76b30838, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000cd3165b9e0, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800f56bbe0, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000e7f309f800, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d03c327208, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000c8266e4ab8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800fc60668, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800efba940, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000f47ac614f0, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000ef74d7ac78, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000de12c6a450, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000c969977528, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800f8c4168, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e03fd98, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000fe0326f068, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000e1ff748fb8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000d746849230, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000c2376ef590, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800ff26fc8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e0b9690, %r1, %r9
	setx	0x368c8025eaf0706c, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f464a28, %r1, %r9
	setx	0x719001e8a5ffd3ac, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000cf29646100, %r1, %r9
	setx	0xf0d3ff7801215777, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000da72334378, %r1, %r9
	setx	0x25656f5e50fc00fe, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e9122b7418, %r1, %r9
	setx	0x2aa07f17c0788e1e, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000fe193db730, %r1, %r9
	setx	0x372b326a4edfb63d, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e491e80, %r1, %r9
	setx	0x4edb0466af648e19, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f33c410, %r1, %r9
	setx	0xc8e46e1bedfd27a2, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c431296ee0, %r1, %r9
	setx	0x8a11596f0c4f4c77, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d7dfc2f7e0, %r1, %r9
	setx	0xffec162f51b7c5f5, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e13cb4c098, %r1, %r9
	setx	0x88c28338ec3fbc7a, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000fa31229f30, %r1, %r9
	setx	0x37cc6c8357d54ddc, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e60d978, %r1, %r9
	setx	0xb575139a484ccbd4, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800fdc5ff8, %r1, %r9
	setx	0x0d023ab171b37d53, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c0bcb73498, %r1, %r9
	setx	0x00ec3b9c10faa49d, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000dbadbce908, %r1, %r9
	setx	0x2b605323dad1cf1f, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000ee0136ce98, %r1, %r9
	setx	0xc91f021025010cd1, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f2c01942b8, %r1, %r9
	setx	0x8e3ddb59cd89146f, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e8f4e18, %r1, %r9
	setx	0x18392584a37c4653, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f3fbd28, %r1, %r9
	setx	0xf5839f384cbf15cc, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000caf376a710, %r1, %r9
	setx	0xb6e6cabb7630e3eb, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d88c170590, %r1, %r9
	setx	0x2d5238cb289d989f, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e0e21bd580, %r1, %r9
	setx	0x83c763b05462464b, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000fc0052f5e0, %r1, %r9
	setx	0xfd87d77576061ca0, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d91bcd5540, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000cd9322a9c0, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800f404d58, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800e154c10, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800fbc2e08, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800ec041f0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000f8db2192c8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000e616b05190, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800f801148, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e5e9e10, %r1, %r9
	setx	0xe2668f27621ae086, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f752510, %r1, %r9
	setx	0x8f9f6df272153aec, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c977694018, %r1, %r9
	setx	0x7678639ce62812fa, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000df9ac24160, %r1, %r9
	setx	0x6c43749d1262ba27, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ee3d60c3d0, %r1, %r9
	setx	0xd4edd7192be477bf, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000fe52590488, %r1, %r9
	setx	0xb3e12f09833ecc65, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e6b3560, %r1, %r9
	setx	0x6d8ec12fe0a07240, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f51b968, %r1, %r9
	setx	0xa8d9c3e961e58c56, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c037ae5d60, %r1, %r9
	setx	0x8a8bf079e69a2bec, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d2d397a570, %r1, %r9
	setx	0x53c3ba837cfbfad1, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000edfa297750, %r1, %r9
	setx	0x61294b5552bb7255, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f28bf09030, %r1, %r9
	setx	0xba08c8393dc215de, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800eefda28, %r1, %r9
	setx	0x7b272cbcb5a1be22, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800fee3be8, %r1, %r9
	setx	0x9d7a12102888a75a, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c7d7a29d30, %r1, %r9
	setx	0xbf039a94c9a5cead, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d933de3038, %r1, %r9
	setx	0x1dfdfa5f1b633438, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e029afb9f8, %r1, %r9
	setx	0xba041adb1806644d, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f89bd82968, %r1, %r9
	setx	0x31be2a02f45651aa, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e46ad68, %r1, %r9
	setx	0xd485481c9e639514, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f7a39d8, %r1, %r9
	setx	0x5abdf8056804c1d3, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c2b9d6a5c0, %r1, %r9
	setx	0x207c659940711f10, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000dcd65ea338, %r1, %r9
	setx	0xada500cc6cd58522, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ef04b43e70, %r1, %r9
	setx	0xf2fe02d1766e56cf, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f48b9b2e28, %r1, %r9
	setx	0x214a37948c065a4d, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000fcdaa22840, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000e4502a95c8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d5200347c8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000c7f31faa70, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800ec46288, %r1, %r9
	setx	0xb06a3f1de967d477, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f6619c0, %r1, %r9
	setx	0x551ee7381ceb2153, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c17535c9e8, %r1, %r9
	setx	0x819d33ee0dc9ec3d, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000da2fa7c9e0, %r1, %r9
	setx	0x76d3062b01cd3792, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e1f8c83330, %r1, %r9
	setx	0xe9ad12e0bbfff91b, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f626d31c70, %r1, %r9
	setx	0xf455c5a9ea556ae1, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e1e28a8, %r1, %r9
	setx	0x67074bf0de5eeb9b, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800fccf300, %r1, %r9
	setx	0x58dc5950fee32058, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c6c59b53f0, %r1, %r9
	setx	0xe3290f63db8b2f4f, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d5886fa380, %r1, %r9
	setx	0xc462f4bcda96e318, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000ebededc528, %r1, %r9
	setx	0xba2eed3097d341b0, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f863930dc8, %r1, %r9
	setx	0xcc425b64b16f0c63, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e7e4288, %r1, %r9
	setx	0xb85cdcd3b883aa57, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f28cfe8, %r1, %r9
	setx	0xe557dcb6f328c5ab, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c5f36c73b8, %r1, %r9
	setx	0xc205e241ebb4ecf9, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d531a141c0, %r1, %r9
	setx	0x462a53907349ed70, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000ea87c84c58, %r1, %r9
	setx	0xc0cdf52b942bc71f, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f8cbab14d8, %r1, %r9
	setx	0x3b839c124c78ae42, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800ee781e0, %r1, %r9
	setx	0x339c2523ea9ec1af, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800fec1f48, %r1, %r9
	setx	0x3949a111e39fea10, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c982dbdaa0, %r1, %r9
	setx	0x19b0f672a1766d85, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d0902b0c48, %r1, %r9
	setx	0x70c6e7d00d8feec5, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000eac4231680, %r1, %r9
	setx	0x23261955a6848b18, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f03f62b398, %r1, %r9
	setx	0x197dafffaa8c6959, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f4aee98, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800e93aa50, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000f007a05818, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000eac3136620, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000df29801c08, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000ce68b11af8, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800f1eacc8, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000dd3ac11e90, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000cd3cadf610, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800fbe8a70, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e33a100, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000f8f08d5178, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000eed9257088, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d717214e58, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d6d02b5ca0, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800f633de0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800edeb660, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000fe6d425c08, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000ea92481b90, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000d3bc9119b0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000cac5566628, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800eb8d2a8, %r1, %r9
	setx	0x35b9e0f53ec46b0c, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f93aa40, %r1, %r9
	setx	0xcb0f0474dfd90248, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c619229b60, %r1, %r9
	setx	0xee73b40a9340e140, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d3377850e0, %r1, %r9
	setx	0x2adbc2e4b5286e96, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e90f736b48, %r1, %r9
	setx	0xcf005bb87e76c97c, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000fab39eecf8, %r1, %r9
	setx	0x30a90dd67f2dede6, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e793670, %r1, %r9
	setx	0x1ed2ff13e3b68482, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f3d4040, %r1, %r9
	setx	0x26b91114edf8a47e, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000cd883fc5f0, %r1, %r9
	setx	0x621c756b6f303a3b, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000dba6a17ea0, %r1, %r9
	setx	0xa4901f80a590dc5e, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000ead1e25a88, %r1, %r9
	setx	0x38004281625de0b1, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f2cc258120, %r1, %r9
	setx	0xeefb0d2e3f3265a0, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e7d91b0, %r1, %r9
	setx	0x994dd1ca1eec2bc1, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f4449f0, %r1, %r9
	setx	0x5fd826d9e9337dee, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c8e37f85a0, %r1, %r9
	setx	0x98a9fcaf6993e9e5, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000db4f5c41c8, %r1, %r9
	setx	0xae1fd9c0cc6b48fa, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e591cef928, %r1, %r9
	setx	0x5d462c6071c1de0f, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000fcb8ca8ad0, %r1, %r9
	setx	0xe953d3e881bc8636, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e024320, %r1, %r9
	setx	0x599f39bfb6f2201a, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f9a03f8, %r1, %r9
	setx	0xae3ef4ad62c1999c, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ca7d2ff240, %r1, %r9
	setx	0xc944468d6669f2bc, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d192168808, %r1, %r9
	setx	0xe4b70d2156041dba, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e6085b0e78, %r1, %r9
	setx	0x5d0b74319f02f3ef, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000fc93160668, %r1, %r9
	setx	0x0eb5ae2ff85a7e85, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f8766ae7c0, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000edf08aa408, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000db4c950440, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000c0ec7956e8, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000d190553e10, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800e02c748, %r1, %r9
	setx	0x7104dc843dfd6e60, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f149b50, %r1, %r9
	setx	0xa359dd0b238a1734, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c2964f5fa0, %r1, %r9
	setx	0xa038e8030ac9237c, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000db5f2fdf50, %r1, %r9
	setx	0xb1d0caaa3684efd7, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ec77131de8, %r1, %r9
	setx	0x96f2f838063e0625, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f225df3878, %r1, %r9
	setx	0x5515e2080141bbce, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800ede9550, %r1, %r9
	setx	0x18891832a3cb492a, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800facd2c8, %r1, %r9
	setx	0x0946109c031ee63e, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c6f607e0d8, %r1, %r9
	setx	0xbfcd83ec7bb77576, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d156a4b638, %r1, %r9
	setx	0x448370fa020fb601, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000ee643f0e60, %r1, %r9
	setx	0xbe96c5268552a128, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000fc07949510, %r1, %r9
	setx	0x36d935e29d5c1f85, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800ed5b3e0, %r1, %r9
	setx	0x2704b0ca3126ce3d, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f2664b0, %r1, %r9
	setx	0xd70949eb34557f2d, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000cb0bc9d240, %r1, %r9
	setx	0x2967e1bb0e346777, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d8e88986c8, %r1, %r9
	setx	0x1b96e3b29833a0d3, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e138018eb8, %r1, %r9
	setx	0x9c2c2efda6a08a54, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f22e0070e0, %r1, %r9
	setx	0x81288a6574caa49f, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800ee65948, %r1, %r9
	setx	0xad81c287ca8a19ee, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f561020, %r1, %r9
	setx	0x9da96cf9b4f6464e, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c18bce9108, %r1, %r9
	setx	0xc5d1db830ca31ed0, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000df38515508, %r1, %r9
	setx	0x26c90273da7b7f5a, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ecdf48cfc8, %r1, %r9
	setx	0x643b9b6c5e810ce6, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f2d42da288, %r1, %r9
	setx	0x6a64697dd5d4e84b, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d663ec7100, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000cfef29cd98, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800febef30, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800e000438, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000fce3cd96f0, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000e47c961dd8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d3b8d2f238, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000ca9aeea710, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800f7df0c0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e6c1928, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000fc2c93c908, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000c3acf05e50, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800f0c62e8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800ec40cf0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800ec5ef48, %r1, %r9
	setx	0x4e7e7416ae6daa0a, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800fe99e80, %r1, %r9
	setx	0x2844c05767bbf683, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c4fe965f70, %r1, %r9
	setx	0x953d02eed3361b5c, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000dd67ad4c80, %r1, %r9
	setx	0x78aeee1c6adb9df3, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e74525dad0, %r1, %r9
	setx	0x8cd0a37c8660de8e, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f296349018, %r1, %r9
	setx	0xcc363e51e392c9eb, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e90d228, %r1, %r9
	setx	0xaad1b937b0ddccf0, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f0e3380, %r1, %r9
	setx	0x1c420c609fbf13ba, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000cb905b09d8, %r1, %r9
	setx	0x1e5aa7a5bf1c8e7a, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000dee4510c90, %r1, %r9
	setx	0xada6f56daadb6811, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000ed289497f0, %r1, %r9
	setx	0xb1a423b70ef313a2, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f6155fea10, %r1, %r9
	setx	0xf29c4c682038fcd3, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800eb89fa0, %r1, %r9
	setx	0xe07a91bd278e2a8d, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f821d68, %r1, %r9
	setx	0x0a9647a611c5263a, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000cbdcfe49e8, %r1, %r9
	setx	0x0adb7b5f7112cf7d, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000df88c18cb8, %r1, %r9
	setx	0xb5a20d9be4cb286e, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e9134c86c0, %r1, %r9
	setx	0x8fd48bbff43688dd, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f01caf6ae8, %r1, %r9
	setx	0xad4fbcb26f0b93de, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e9f7530, %r1, %r9
	setx	0x87f6028efd217823, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f61fe10, %r1, %r9
	setx	0xa208ff49bfa529f6, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000caddf20898, %r1, %r9
	setx	0xdd099fb3a06b615c, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d6160b8828, %r1, %r9
	setx	0x5e74255e7f6fcf52, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ef55a261a0, %r1, %r9
	setx	0x448d56aea400daf1, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f04d835df8, %r1, %r9
	setx	0x5fcffedb02a81e78, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ed6c61a9a0, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000d0b110ab48, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000cde4de0f28, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800f36aef8, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800e9f8a10, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000fc848eb628, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000ecb429c448, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000c395449a30, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800f830dd0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e035fd0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000f6d83b8078, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000e149e22cf0, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000de5d884938, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000c58396b078, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800fb97d18, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800ed4aab0, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800f66e9a8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e430ac8, %r1, %r9
	setx	0xaba9c10f93b90b57, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f73bab0, %r1, %r9
	setx	0xdb9f317e1a5eadac, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c371d35c50, %r1, %r9
	setx	0xe45a28e6a7823fa1, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000dabb118e40, %r1, %r9
	setx	0x31cefccec6172c77, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e71a5c1758, %r1, %r9
	setx	0x7ff158dfe410a882, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f6ddc32618, %r1, %r9
	setx	0x027b7dcdc543bf23, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800eec5798, %r1, %r9
	setx	0x0a7ef08015166c86, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f381d60, %r1, %r9
	setx	0x72b8d26157bd4eee, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000cc42fd4348, %r1, %r9
	setx	0xc2b42fb559636c1d, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d45a8d6ab0, %r1, %r9
	setx	0xf8212792ce02e00f, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000ef074a2b78, %r1, %r9
	setx	0x0d180d04494de804, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f813cbf9d0, %r1, %r9
	setx	0xa537b125e93ccfc7, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e8c7ca8, %r1, %r9
	setx	0x02beb00aa2abf19e, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f16d258, %r1, %r9
	setx	0x2ed91e75876ddeb5, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000ccadf99bb8, %r1, %r9
	setx	0x95a1f067df290f6f, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000dcbaaa1488, %r1, %r9
	setx	0xa225230e31ba86e6, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e8a6a92df0, %r1, %r9
	setx	0xe996d5b9367c77a5, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f01365a2e0, %r1, %r9
	setx	0x62f23dc26d361638, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e91da00, %r1, %r9
	setx	0x283a9b0b3cf3314c, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800ff1e498, %r1, %r9
	setx	0xa038558aa634d426, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c7d35e88b0, %r1, %r9
	setx	0xa572d5100c1a880a, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ddd79f7740, %r1, %r9
	setx	0x25ac52cb838c5097, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e62da62980, %r1, %r9
	setx	0xc3d010466a691780, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000fc47495488, %r1, %r9
	setx	0x8d58ba23e2ea9f17, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800e780118, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000fa03603b80, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000ebbc7f4128, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000dbb3cf78c0, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000c506cbaba0, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000c58396b078, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800fb97d18, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800ed4aab0, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000fc3e41e470, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000e96b378268, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000d2728ec940, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000c8410d3180, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800f36b240, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e9d0fc8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e83d188, %r1, %r9
	setx	0xf041f6f14ca69537, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f491518, %r1, %r9
	setx	0x7720d405c43402cd, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c71f378648, %r1, %r9
	setx	0x8ec30f33ee2980c6, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d8910b10e8, %r1, %r9
	setx	0xba29100fdf0560b2, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e6a07c1028, %r1, %r9
	setx	0x1e1ad4bef51ca9e1, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000fcc19eb6d8, %r1, %r9
	setx	0x6543b47d33b8b175, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e1571e8, %r1, %r9
	setx	0x9283472438430350, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800ff30c30, %r1, %r9
	setx	0xffd398bd25410389, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c5274f52c0, %r1, %r9
	setx	0xe7792830172b7381, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d6f8ce5890, %r1, %r9
	setx	0x0fdbdddc287c7c19, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e6b36b4398, %r1, %r9
	setx	0x29c8983dd9729932, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000fcb4e4acc8, %r1, %r9
	setx	0x9d1ba136e43a7f46, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e9a8af0, %r1, %r9
	setx	0x00dba10c3317b9e3, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800fb71ee8, %r1, %r9
	setx	0x007b02cbf554340d, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000cc9dd17498, %r1, %r9
	setx	0x4332b19b4efc8a99, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d1c45cb480, %r1, %r9
	setx	0x2c1086e7e3443384, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e53d9cdeb0, %r1, %r9
	setx	0x87c5fde463aa899c, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f47cecd468, %r1, %r9
	setx	0xd9bfe42273bd1c08, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e40cc20, %r1, %r9
	setx	0x5f9664f49a55c18a, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800ff94cb8, %r1, %r9
	setx	0x2638d37be005b226, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000cf7a841078, %r1, %r9
	setx	0xf2f97301b1a80d17, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d0fd065ca0, %r1, %r9
	setx	0x91d6464c5d147e8a, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e8ee63e7e0, %r1, %r9
	setx	0x82daefffa13ec100, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f4e0f7e648, %r1, %r9
	setx	0xc2d970061e0c37e1, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e39518fad0, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000d2e4a86848, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000cae64ccba0, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800fc88088, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800ee6ddd8, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000fafb30c878, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800f40bf08, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800ef26848, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000f8db610900, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000e01bc8f780, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d37eee3b60, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000fe3160f470, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000e1a0d95eb0, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000ddf432c808, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800fb2af50, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e520108, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000f87274ebd8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000eaa7e72ec0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000d88c189ef8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800ed3d7a8, %r1, %r9
	setx	0x1e8fb6cf08a33d95, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f026988, %r1, %r9
	setx	0x76902f31c9089018, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000cacc979cc0, %r1, %r9
	setx	0xab2a24a1377ffe6a, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000deca01ab88, %r1, %r9
	setx	0xdab61bcc36a9280f, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000eb48abba90, %r1, %r9
	setx	0xeb8ed1ac5ec94214, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f80b731d88, %r1, %r9
	setx	0x6206e093be32db04, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800ecc4270, %r1, %r9
	setx	0x05a86abfdcedaef8, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f0047b0, %r1, %r9
	setx	0xb9ee625db9973ecf, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c56cee9900, %r1, %r9
	setx	0xca86d7864283b4f6, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d6eff2aa20, %r1, %r9
	setx	0x65c044e237fc8729, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e1116bcc40, %r1, %r9
	setx	0x913388f7a64f10ba, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000fa02c7add0, %r1, %r9
	setx	0x1fa736b654115aeb, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800ee1bf70, %r1, %r9
	setx	0x639e430d43362c06, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f87ac10, %r1, %r9
	setx	0xa5b771356380151b, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c81628dde8, %r1, %r9
	setx	0xe95d87b439fffd26, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d37d686eb8, %r1, %r9
	setx	0xa20cf1272801cf35, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e3b5ac9ec0, %r1, %r9
	setx	0x643a5bac1d906aa2, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f0538cd950, %r1, %r9
	setx	0x0d441219d2336a2f, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800ec69118, %r1, %r9
	setx	0x16900b260ca66f83, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f6cdf20, %r1, %r9
	setx	0xa510047c3d84b9c4, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c7ca53c838, %r1, %r9
	setx	0x0460461142eaa821, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d5bbc877a0, %r1, %r9
	setx	0xc4729e3269b65539, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e156dfa6f0, %r1, %r9
	setx	0xf9aa5d8563ffc053, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f8f50e1e80, %r1, %r9
	setx	0x474024dc1697f4b1, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800e83d188, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000f6ddc32618, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000e71a5c1758, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000dabb118e40, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000c371d35c50, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800f73bab0, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800e430ac8, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000f07ce3bb38, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000ea8e0160d0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d70168e030, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800f98d550, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800e2a7370, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000fa204b7230, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000f09f3b0510, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e111f50, %r1, %r9
	setx	0x46cba6963d7afac9, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800fcae390, %r1, %r9
	setx	0xa59ca1bb9cfc47a3, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c298eefef8, %r1, %r9
	setx	0x3d75599d43bdedca, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d73a0094c0, %r1, %r9
	setx	0x7053eb6e31e1d94f, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e1a5b71468, %r1, %r9
	setx	0x60ee06a24df13871, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000fe534881c8, %r1, %r9
	setx	0x9b42937bb4cd8c76, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e5cf620, %r1, %r9
	setx	0x1e93b24d5151fe51, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f3a29e0, %r1, %r9
	setx	0x20250599083be0ca, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000cdb2491010, %r1, %r9
	setx	0x34234b07bd6149e8, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000de9101f6f8, %r1, %r9
	setx	0xbaefc1fcea0e51c5, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000ee7bba56f0, %r1, %r9
	setx	0xfe6aaddd193dea08, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000fcbf9e59d8, %r1, %r9
	setx	0x9ad54750afbbfdf6, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e63bf48, %r1, %r9
	setx	0x61abf65d36dd623f, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f04ed48, %r1, %r9
	setx	0x484b24a867482cdd, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c7858283d0, %r1, %r9
	setx	0xf1647317131f97c2, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d1cc9e19e0, %r1, %r9
	setx	0xf50bf71f9cccbea1, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000ed872dbbe8, %r1, %r9
	setx	0xe24804bd19f5059b, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000fe88b5d740, %r1, %r9
	setx	0xc46c43c56f317e30, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e5b67a8, %r1, %r9
	setx	0x7cda168578dd65a1, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f9301a0, %r1, %r9
	setx	0xccd5f4424e1e7a61, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c013e442b0, %r1, %r9
	setx	0xb718f0b9f8509063, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d59a374e60, %r1, %r9
	setx	0xc8dfb1dc6912400a, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e1b4290460, %r1, %r9
	setx	0xa7f8dbcbde7174c1, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f259a00940, %r1, %r9
	setx	0x5187d91252742632, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e74dedb3a0, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000d7233180e0, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000c54d454f90, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800fa06e58, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800ea97168, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000f26037cd10, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000f04b8c3078, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000ef296852c8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d8235f4390, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000cdee7fba00, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800f703790, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e7549d8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000f2868a7200, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000e03491de20, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000dfbd2575d8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000c96cc7d780, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800fc33eb0, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800e886d88, %r1, %r9
	setx	0x579c11bfff1d577d, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f48f180, %r1, %r9
	setx	0xd1895c340ea8fff7, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c23c4c9e00, %r1, %r9
	setx	0x13ad31700381a601, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d7279158a0, %r1, %r9
	setx	0xc5657bdd6c6c47e2, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e603c12080, %r1, %r9
	setx	0xe0a3b87a38c124ff, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f69edae830, %r1, %r9
	setx	0x48cebe554616d36c, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800eb6a638, %r1, %r9
	setx	0x63a78b777b0ef7b2, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800fa24360, %r1, %r9
	setx	0x1b3ff63f2e3aeaa5, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000ca1c5ab0c0, %r1, %r9
	setx	0x9fe3f1be53560caa, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000db02f608e8, %r1, %r9
	setx	0x0ce2f24c57323702, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e2a14c42e0, %r1, %r9
	setx	0x0c2e5a2a0982a1df, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f44add49d0, %r1, %r9
	setx	0x5981e2fc7aed1c48, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e26a960, %r1, %r9
	setx	0xa1a00aaec859b72d, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f951a20, %r1, %r9
	setx	0xf40aa94d1803014c, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c49e5e27e8, %r1, %r9
	setx	0x92f450174056b33b, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d07f6ce150, %r1, %r9
	setx	0x01382b2ec29ff767, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e3bb826870, %r1, %r9
	setx	0x80a8480df77c6a00, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f86c4515f8, %r1, %r9
	setx	0x687030938f25bf87, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800eab71f8, %r1, %r9
	setx	0xc1e9536f5ef0b079, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f589328, %r1, %r9
	setx	0x962f790f53e79c15, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c2612bcab8, %r1, %r9
	setx	0x924d5216ccc641b0, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d3297d8d00, %r1, %r9
	setx	0x8ee99cfc03872355, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ec69807fd8, %r1, %r9
	setx	0x7efe72654330940d, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000faefc69170, %r1, %r9
	setx	0x4936fbe2a30da888, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000fc4c3e1ed0, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000e7960401b8, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000d1c666af28, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800f267d80, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d66bacbe48, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000c7656bc908, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000c01e4afa10, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800fe54140, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800eb86d28, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000f4b46fcfc0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000ef961ed740, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000da355e1cc0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000c3acf05e50, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e5f0c80, %r1, %r9
	setx	0x018e94c36dce1d43, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f795ab0, %r1, %r9
	setx	0x115e51a39f2403c0, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c8c15782e0, %r1, %r9
	setx	0x6f1d428df0b0b8b2, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d7712c5b80, %r1, %r9
	setx	0x8a3935f529e607cb, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e6bf168578, %r1, %r9
	setx	0x7d486d997335de78, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f60b0180d8, %r1, %r9
	setx	0x4c6922c5b3837a32, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e46c460, %r1, %r9
	setx	0x2108253efceda459, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800fdb8c30, %r1, %r9
	setx	0x45bebddbb4841d6c, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c84bceecd8, %r1, %r9
	setx	0x73e949aca2ebd3a7, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d9b7513fc8, %r1, %r9
	setx	0xb57b861f72599b53, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e38095ae40, %r1, %r9
	setx	0x2880555748eda325, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f0a93ec3c0, %r1, %r9
	setx	0x6d8d20b931ec49e8, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800ec67fe0, %r1, %r9
	setx	0x1261070042e7990a, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800fc35de8, %r1, %r9
	setx	0x328ae0c02bae7893, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c077f5bf20, %r1, %r9
	setx	0x249ae395698df233, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000dded3ba1d0, %r1, %r9
	setx	0x7dbc784567284195, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000ec1dbfea00, %r1, %r9
	setx	0x11fcb7bc65e08b58, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000fe84ba7a10, %r1, %r9
	setx	0xbd98b800a4da649c, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e2afbf0, %r1, %r9
	setx	0x2ba9b93d8d15b5b6, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800faec1b8, %r1, %r9
	setx	0x49967880ac3e9cbf, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c57985b760, %r1, %r9
	setx	0xa3fb6447b1b58ff3, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d03f5f0cb8, %r1, %r9
	setx	0x03c8a9e84150989d, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e26a587540, %r1, %r9
	setx	0xbe80baafe384a22d, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000fa4c63e040, %r1, %r9
	setx	0xca62d210c5aaffd8, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c276ec6ca8, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800fbd3dd8, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800ec89ee0, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000fa8e9013f0, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000ed6c61a9a0, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800f3a29e0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e5cf620, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000cc661d0198, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800fe4ee48, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800edb5040, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000f47ce11130, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000e0766e9570, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000d71335c9d8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e0c6120, %r1, %r9
	setx	0x4c098275aacfadee, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f33f028, %r1, %r9
	setx	0xf457e3b184b7bb7c, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ce7cd1e400, %r1, %r9
	setx	0xa9c195650ec89520, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d78f8889d8, %r1, %r9
	setx	0x72449ae2d6c3d599, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ea4814c0c0, %r1, %r9
	setx	0x638f380a2e8ea145, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f4734175f0, %r1, %r9
	setx	0x1374e9cd02f5f7ff, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e4037a0, %r1, %r9
	setx	0xfb47593ac3d1caf8, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f6c5260, %r1, %r9
	setx	0xf45218bf957da8e8, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c02a1f48c0, %r1, %r9
	setx	0xf228b3be8aead870, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000df85c01120, %r1, %r9
	setx	0xc1fb9ec473d962f5, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e0dd3a50f8, %r1, %r9
	setx	0x0e9108927e375976, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000fe0193dd70, %r1, %r9
	setx	0xb095942f244bd872, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e577e68, %r1, %r9
	setx	0xe9baa4ab11b8b084, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f7baa78, %r1, %r9
	setx	0x018cb272eb927632, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c8505850d8, %r1, %r9
	setx	0x4364778da9dbdcfe, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d9d04ac5b8, %r1, %r9
	setx	0x00c6d3af561563f3, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e7e9f1b6b8, %r1, %r9
	setx	0xc9346928d0b5d480, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000fa7f7cbb28, %r1, %r9
	setx	0x1d298de06108a31f, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e376118, %r1, %r9
	setx	0xe526c2a435bbb4f7, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800fc35ed0, %r1, %r9
	setx	0xe9d46b9c65a17b02, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c70c6ac5d8, %r1, %r9
	setx	0x5d31d198b5519270, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d348ae23c0, %r1, %r9
	setx	0x611b54a80f76a3d9, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000edf939faf8, %r1, %r9
	setx	0x54a701bceb0393e0, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f6cc70fde0, %r1, %r9
	setx	0x3ec81b738ade4216, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800fd582a8, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800e780118, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000fa03603b80, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000ebbc7f4128, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000dbb3cf78c0, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000fcda931e30, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000e29fbd9bd8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d5b27ebae0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000cace363c98, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800f479ba0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800ed6da70, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000f46ff76780, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000c733ce2bf0, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800f98d550, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800e2a7370, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000fa204b7230, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000eecd3a68b0, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800f02a570, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e74d8f0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000f25f7f6418, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800eb2bb98, %r1, %r9
	setx	0x816205db8f6e44a3, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f43d590, %r1, %r9
	setx	0xd8917529095b18b3, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c8e3954600, %r1, %r9
	setx	0x9588d2d87e56eb08, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d17c4891e0, %r1, %r9
	setx	0xb3738b0b25b968f6, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000edfce3b028, %r1, %r9
	setx	0x37493e9d32d4b470, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000fa13295a48, %r1, %r9
	setx	0x7cc4d99179e15f84, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e323b20, %r1, %r9
	setx	0x886d74dca85916c8, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f392bd0, %r1, %r9
	setx	0x427f8720165dface, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c2ab674588, %r1, %r9
	setx	0x44c0a3873b5355fc, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000de0c9b1518, %r1, %r9
	setx	0x245f8949582e6171, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000ee2288f858, %r1, %r9
	setx	0x8194e4128e448b14, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000fe79013228, %r1, %r9
	setx	0x89c8c1aeebf70978, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800efef250, %r1, %r9
	setx	0x33f4fadcd7fa69b2, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800fe685e8, %r1, %r9
	setx	0x6d8a4b675d2358ee, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c02d4c55c8, %r1, %r9
	setx	0xff7f549e9b6afadc, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000df5d5b7870, %r1, %r9
	setx	0x107d82b16f09b4b8, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e867ca7520, %r1, %r9
	setx	0xb7995ead83a3539c, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f434fb3c88, %r1, %r9
	setx	0xdca8d21c16832311, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e1dea88, %r1, %r9
	setx	0x400987cd140e7e88, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800feeb378, %r1, %r9
	setx	0x984135af6d55ef20, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c2f47f9480, %r1, %r9
	setx	0xd05a9f1d1011042c, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d50f9d3410, %r1, %r9
	setx	0x2b71465743df89bf, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e9062eb148, %r1, %r9
	setx	0xd117c7c5472c79cc, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f462077710, %r1, %r9
	setx	0x617c141c79557c10, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000da2fa7c9e0, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000c17535c9e8, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800f6619c0, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800f33c410, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e491e80, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000fc8ba6a630, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000eeadf75080, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d810f4b698, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000feb39ffaf0, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000e46639bd10, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000db3a58cca0, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000cc7e043460, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800fba8058, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800ef13c78, %r1, %r9
	setx	0x0edea31e7a54ecf2, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800fbb6748, %r1, %r9
	setx	0x3b84287a574f0950, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ce5a325830, %r1, %r9
	setx	0xdcbd64c7c8da867a, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d97b0f96f0, %r1, %r9
	setx	0x131dadd0e7fe049e, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e59b825eb0, %r1, %r9
	setx	0x5c950efa001bc376, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000fe0d9d18d0, %r1, %r9
	setx	0x4eb4b679bc801e45, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800ec28260, %r1, %r9
	setx	0x0e99beec3bda91c0, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800fdf2418, %r1, %r9
	setx	0x156ee39b10bd4754, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c197e02328, %r1, %r9
	setx	0xb0afb145d390b611, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000decd03e078, %r1, %r9
	setx	0xc29e94a9a290e57a, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000ef91eab690, %r1, %r9
	setx	0x05fc4781ea825116, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f810663740, %r1, %r9
	setx	0x53b97fa3c1104cf1, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e664e48, %r1, %r9
	setx	0xa259a13bc892178d, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f47f770, %r1, %r9
	setx	0xa8020a899251605f, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c96b247bd0, %r1, %r9
	setx	0xfe538dd64491d3a4, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000dc83dd6dd8, %r1, %r9
	setx	0x774964249b64fd82, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e45860c970, %r1, %r9
	setx	0xd33eef98b611fe17, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000fef12a87c8, %r1, %r9
	setx	0xe394039c8e158db8, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800ead0aa8, %r1, %r9
	setx	0xf8b05d19d1155511, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f9b5bb8, %r1, %r9
	setx	0xa6bc7a3fa2b260e3, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000cb673608e0, %r1, %r9
	setx	0xc64ebda7c8782907, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d020daa050, %r1, %r9
	setx	0x200154c0539323f5, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e494688048, %r1, %r9
	setx	0x721b88cf26fc6218, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f855e36678, %r1, %r9
	setx	0xf4b08f25a2ca32a0, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800ec5ef48, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000fc8ba6a630, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000eeadf75080, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d810f4b698, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000c93a8f8fb8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d4b2bc65a0, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000fe408982b8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000ec57b24df0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000d82480ef70, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800efef230, %r1, %r9
	setx	0xa35d432ce7cc124f, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f8ed298, %r1, %r9
	setx	0x3f97352e8c0f5bc2, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000cec6228650, %r1, %r9
	setx	0xa993b04da483c182, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d717eb3e80, %r1, %r9
	setx	0xe66588db10fd2613, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ecbd5060e8, %r1, %r9
	setx	0x6eb6cc5da4aa45ea, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f09ecbc5f8, %r1, %r9
	setx	0x7cbac1d02810d26d, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800ecb2498, %r1, %r9
	setx	0x629be2299b54a75e, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f8e1ae8, %r1, %r9
	setx	0x419554dbf4796e85, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000cee8db6320, %r1, %r9
	setx	0x2842633fc4368fc4, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d2c88eabc0, %r1, %r9
	setx	0x26b516ec5a09ca2f, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000ed67935f00, %r1, %r9
	setx	0x3b976fc2c4576e0e, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f4befa7bd8, %r1, %r9
	setx	0x094fa182fb54307d, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e77b9a8, %r1, %r9
	setx	0xba29b03ba864ab4b, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f2feb50, %r1, %r9
	setx	0x83518f2e24f85a02, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000cc165c4708, %r1, %r9
	setx	0xe17469c22eacd4fc, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d0c5a34398, %r1, %r9
	setx	0x3d6c42be14da7892, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000eee8026190, %r1, %r9
	setx	0x3e8b53f057305bc6, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f066ecc288, %r1, %r9
	setx	0xb904660c0dee09c6, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800ebe6de0, %r1, %r9
	setx	0x8d3f430d1d9a6ba3, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f064800, %r1, %r9
	setx	0x34eb00f37b0aa433, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000cc2987bec8, %r1, %r9
	setx	0x3209a0c18f264871, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d465263e88, %r1, %r9
	setx	0xd9eec4dc42f8bcc9, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e5613dfc58, %r1, %r9
	setx	0xa713550f391ed31a, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000fa9ea3a778, %r1, %r9
	setx	0xf90576421a289056, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f4fbaec108, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000ee427bf3f0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d71ab75b10, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000c5d9d0b4b8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e024320, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000f03f62b398, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000eac4231680, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000d0902b0c48, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000c982dbdaa0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800fec1f48, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800eef3e90, %r1, %r9
	setx	0x0affcf34e52f658f, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f2cbd10, %r1, %r9
	setx	0x74df622435ee64a0, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c79ba39b70, %r1, %r9
	setx	0xc87ce9dc9d92c07e, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000db0b0fe7f0, %r1, %r9
	setx	0xa298919e39921e55, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e921348310, %r1, %r9
	setx	0xe3f6f077a72a7ebe, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000fadc927d18, %r1, %r9
	setx	0xafbfaf5ef6f9a5e5, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e4b3348, %r1, %r9
	setx	0x4bf4fa420e6d13ff, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f897fc8, %r1, %r9
	setx	0xe523b34f91d6d532, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c4be119160, %r1, %r9
	setx	0xc13b5df700ed5ace, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000de66e9f358, %r1, %r9
	setx	0x2a3213679384bcb6, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000ec54715b18, %r1, %r9
	setx	0x2f7dbaeee98159ed, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f481b9e900, %r1, %r9
	setx	0xe65624e9f95dddcb, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e8de2c8, %r1, %r9
	setx	0xe4c68410da2d47f3, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f953c50, %r1, %r9
	setx	0xfd538837e5a8b933, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000cb5b3d73d0, %r1, %r9
	setx	0x2221700994cf86ae, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000dab05dcf38, %r1, %r9
	setx	0xd6d4fa3e4e761477, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e247783460, %r1, %r9
	setx	0x858f7213639eed7f, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000fe25350a00, %r1, %r9
	setx	0xa1741d35536b5a0a, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e8c1ff8, %r1, %r9
	setx	0x5c7d5e7de7aa7180, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f20b038, %r1, %r9
	setx	0x72676cf0a39d012c, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000cc5b46c780, %r1, %r9
	setx	0x5601856103ac9a4b, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d112ce9250, %r1, %r9
	setx	0xb139194123a6f0ce, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e3a61ef3d8, %r1, %r9
	setx	0x1fc27cd779ac8d25, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000fab9567bf0, %r1, %r9
	setx	0x07933494bff0ca07, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c62f5e28a0, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800fe2a9e0, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800ed171b8, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000f0750a1510, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000eb68594a38, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000d7ca3a83b0, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000ce1253a2b8, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000db254ccea8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000cbae63ebd0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800f5db058, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e0905e8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000f4fbaec108, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000ee427bf3f0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d71ab75b10, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e6847d0, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000f6f8154b10, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000e7a9598f50, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000e30c7a7018, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000dd40b73660, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000c42220d460, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800fe04d40, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e4ad498, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000f0540df0f0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000e6f11505c8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e1034a0, %r1, %r9
	setx	0x050479e3309c01d3, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800ff00678, %r1, %r9
	setx	0xc15037aeb6e478b4, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c950d70870, %r1, %r9
	setx	0x9802fad2e08f4584, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d9a3bad1e0, %r1, %r9
	setx	0x4b0e1b671a1c41f2, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e9bdbe3a38, %r1, %r9
	setx	0x08e95b4db23dc10a, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f046ec89b8, %r1, %r9
	setx	0x6d31262c3cc097ec, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800eafd210, %r1, %r9
	setx	0xf642cab2d058a021, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800fc6cdf0, %r1, %r9
	setx	0x6f3833101af4f82b, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000ca7d8ee840, %r1, %r9
	setx	0x5c1a87e34b34302c, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000da44735460, %r1, %r9
	setx	0x3fe5050c40a7a380, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000ecb9cfc388, %r1, %r9
	setx	0x94bbc1d9f397ae01, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000fc433b2220, %r1, %r9
	setx	0x4dd49d8fc67b46e3, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800edd94a0, %r1, %r9
	setx	0x52d5c6c1def7ebe3, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f5709c0, %r1, %r9
	setx	0xf2d2a259253fe333, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000cdca587040, %r1, %r9
	setx	0x02d41eccd65ae376, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d0dab9b690, %r1, %r9
	setx	0xae7df3a55e96d698, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000efa0984808, %r1, %r9
	setx	0xc831ddb7b12d8178, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f2590b7190, %r1, %r9
	setx	0xd55c60ad73e15ca4, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e755190, %r1, %r9
	setx	0x335a6930c84e867b, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800ffcf1f8, %r1, %r9
	setx	0xeb059c4160e62a9b, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c17915a5a0, %r1, %r9
	setx	0x2735e1bcca8acc45, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d1648d4460, %r1, %r9
	setx	0x42649af21fc212c8, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ef70d3f730, %r1, %r9
	setx	0xea9bf0a8eab0a51d, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f261c4d238, %r1, %r9
	setx	0x6cc0aad95213c349, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c298eefef8, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800fcae390, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000e5044677f8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000dedaa1c4e8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000ceb6d51208, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800fae4c78, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800efb9300, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000fe160de918, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000dce7cdd040, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000c887af82f0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800fb5bda0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e5d5b18, %r1, %r9
	setx	0x779303cd6dd51778, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f2dd660, %r1, %r9
	setx	0xc4397f737c01340d, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c803907140, %r1, %r9
	setx	0x6d0a0629f48a380c, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000df536d6d80, %r1, %r9
	setx	0x8d96c08234f246d6, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e3e84d4830, %r1, %r9
	setx	0x1f568c33e0be5b15, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f07b047e58, %r1, %r9
	setx	0xd8676d8ba4c2caeb, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e026178, %r1, %r9
	setx	0x7866c1230a614602, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f4e1618, %r1, %r9
	setx	0xfcec1e9ca279c746, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c50643ea90, %r1, %r9
	setx	0x942b788d3f318110, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d290cb7540, %r1, %r9
	setx	0x1b2086291ec484af, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e9066a6750, %r1, %r9
	setx	0x010450c07a825e11, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000fe82505380, %r1, %r9
	setx	0x1a63c3481ad2fd1f, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e9cbf78, %r1, %r9
	setx	0xc0aab9344b402e71, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f939c00, %r1, %r9
	setx	0xb3514a6d020e418c, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c3db5cd0f8, %r1, %r9
	setx	0x54ee821fe24d9d37, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000dc00a75908, %r1, %r9
	setx	0x27b77c1f610a6e74, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e81a17d6c0, %r1, %r9
	setx	0x4ea2d10f7476b0d0, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000fe5990f738, %r1, %r9
	setx	0x21c58c40fdde9954, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800edef6d8, %r1, %r9
	setx	0x74ecbb7008317423, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f7ecec0, %r1, %r9
	setx	0xb502b71a03cd2e99, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c9cc8f6780, %r1, %r9
	setx	0x85ccb0ec3332cd9a, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d77842abe0, %r1, %r9
	setx	0x476ee376f7ec6274, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e4b689ad68, %r1, %r9
	setx	0x8c634ec6f43999d9, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f62fce9488, %r1, %r9
	setx	0xb9cdcb73480c6b9b, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c1b06fbdf8, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800f767530, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800ecf3900, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000f8564d4770, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000d75aed2b98, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000f66a264cc8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000e086ced140, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000d6338dfd90, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000c6181a7318, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800fdd5240, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800eb354a0, %r1, %r9
	setx	0x133cc08303aa1a97, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800ff34960, %r1, %r9
	setx	0x82fed757d13e2ac7, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c270d263c8, %r1, %r9
	setx	0x1ff21eb6bd33b463, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000df92316148, %r1, %r9
	setx	0x2268cce917daf272, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ed6f90bd10, %r1, %r9
	setx	0xfa906dd8ae2ab489, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f02af04ee0, %r1, %r9
	setx	0x3ec9eaa5441c64cd, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e2b28d0, %r1, %r9
	setx	0xe500c75f4cfb729a, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f4304e8, %r1, %r9
	setx	0xa999403047220f4e, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c77351a140, %r1, %r9
	setx	0xd6d3c96459b581f8, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000dbb2353a88, %r1, %r9
	setx	0xab365130840cc3ee, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e91e00cb60, %r1, %r9
	setx	0x281d49f1a7b8ffd3, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f671b45a68, %r1, %r9
	setx	0xb867b0506e180a36, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800eb3f108, %r1, %r9
	setx	0xd85d0bd086658894, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f0abca8, %r1, %r9
	setx	0x89efe6933be79d16, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c19ea49848, %r1, %r9
	setx	0x5ed2c5998e7e6a26, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d35c5ea238, %r1, %r9
	setx	0xeaeff1e31b452054, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000ee44ed49f8, %r1, %r9
	setx	0xbdd733adf198429e, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000fe486e3268, %r1, %r9
	setx	0xa0d745e70c26b0fa, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800eadcd58, %r1, %r9
	setx	0xff42db876d3a8383, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800fc658e8, %r1, %r9
	setx	0x53ddebad0a3eba36, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000cdd7f321f0, %r1, %r9
	setx	0x6021d0be0957f1df, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d93a169550, %r1, %r9
	setx	0x34e4170c0da43b9f, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e27e138b68, %r1, %r9
	setx	0x414aa44c318ee7af, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f6f38e8408, %r1, %r9
	setx	0x4151b9335f10daf8, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d81daa2448, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000c58fd34360, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800ee34e60, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000fe221416d8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000c60964c668, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800f128da8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800e233db0, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000f0f630e000, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000ec80ba0ea8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000d90445d378, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000c7615acbe8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000c38de797b8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800f88f328, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800ef24c00, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e407970, %r1, %r9
	setx	0xd3df2a2299edd181, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f5f1ca0, %r1, %r9
	setx	0xc16e568f9d6f2429, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c0b0205a98, %r1, %r9
	setx	0xfecb0add0a801949, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000dca91299e8, %r1, %r9
	setx	0x72b7ea3bc449cbdf, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e8f8d04a80, %r1, %r9
	setx	0xc7d96ff255d7e144, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f414ec4200, %r1, %r9
	setx	0xd97c136a5a1f66ff, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800ef78aa0, %r1, %r9
	setx	0x3ae96799dce25fe1, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800fe0e5d8, %r1, %r9
	setx	0x563a34cf3d91c588, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000cf67d0d180, %r1, %r9
	setx	0x2183c231fe9e18cf, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000dc5d1b0898, %r1, %r9
	setx	0x5e1c1d502e087d2a, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e395ec3630, %r1, %r9
	setx	0xce2f58d4ffa427b5, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000fc13f35728, %r1, %r9
	setx	0x68cf3776e9ef08a7, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e175c20, %r1, %r9
	setx	0x21dd9306ecf3c83b, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800fce2208, %r1, %r9
	setx	0xb4e691a478076909, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000cefd37c450, %r1, %r9
	setx	0xcc60033c34adb5f5, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d3f54bb4c0, %r1, %r9
	setx	0xee3b75df5e064a5b, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e3f7859db8, %r1, %r9
	setx	0x68f94ae1d0a3ca35, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000fe6fc2a750, %r1, %r9
	setx	0x7fc76b0d55610ac3, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e6abf68, %r1, %r9
	setx	0x2f10301595f3d9f2, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800fe46690, %r1, %r9
	setx	0xd2222dd66abb5d63, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c211612bc0, %r1, %r9
	setx	0x7f4a4ddf377f2ddf, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d1d3f67510, %r1, %r9
	setx	0x397396986c08b127, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e55004d908, %r1, %r9
	setx	0xb2667ceeb20f0829, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f8cc4d4160, %r1, %r9
	setx	0xd3abbd9f79f8ce58, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800ed171b8, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000f0750a1510, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000eb68594a38, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000f8db2192c8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000e440f874f0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d1221f39c8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000c2e59fc218, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800fbe23f8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e144460, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000f8443bb0d0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000f86c4515f8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800fe4d5a0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e54fdc0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000f06c29f590, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e7698d0, %r1, %r9
	setx	0x2a59138ab6118825, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f4225f8, %r1, %r9
	setx	0xa00d1de19dcd7a02, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000cef8cf1b78, %r1, %r9
	setx	0xa93fc32d8c6d7a11, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d8ec7b6f80, %r1, %r9
	setx	0xe1856c24b5f79512, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ecb5eb4270, %r1, %r9
	setx	0xfeb1a3c0556368f8, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f0c72d1a10, %r1, %r9
	setx	0x67d2179b5b688ee8, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e4ad6b0, %r1, %r9
	setx	0x77f6dcfe11326c4c, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800fed7cc8, %r1, %r9
	setx	0x426d1c79391cc411, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000cedb311248, %r1, %r9
	setx	0x387e66b646159b48, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d98bb05008, %r1, %r9
	setx	0x109e7beb6b040ec8, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e2005ee438, %r1, %r9
	setx	0xed45cb1b43b3bdbb, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f6bd51de68, %r1, %r9
	setx	0x61186ede5e81e769, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800efed548, %r1, %r9
	setx	0xbd5651e53aa4c9a3, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f1d3a18, %r1, %r9
	setx	0xdc8093f4bc46c2b2, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c69c7bb670, %r1, %r9
	setx	0xe4f74ed14298666d, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d00aaad070, %r1, %r9
	setx	0x22a1ebc8fc602286, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e665eda1b8, %r1, %r9
	setx	0x0ebe39a29a8386e1, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f0ff8fe7f8, %r1, %r9
	setx	0xc877b1f5aa376472, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e980c08, %r1, %r9
	setx	0xf9f5644d4afe6fbc, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f021028, %r1, %r9
	setx	0x647a8538725eb034, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c13002d8b0, %r1, %r9
	setx	0xecf744a7bc9bc9bf, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d6f5900998, %r1, %r9
	setx	0x13e69dcc2df4c273, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ee940eaa18, %r1, %r9
	setx	0x262876f00cea853d, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f888b239b8, %r1, %r9
	setx	0xe9090c0a774566af, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f408fa8, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800e9c8828, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000fc2b539b80, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000feab538228, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000ee1c3a3f78, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000df1b450c68, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000c39a17d568, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800feafb88, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800e8e5ab8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000f0604b0860, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000ecd7f5da40, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000d91cf983e8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000c5ed279490, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800f1d6de0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e128b50, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000f0c492c0d0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800ec3fac8, %r1, %r9
	setx	0x812d02e58154fb8d, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f16a788, %r1, %r9
	setx	0x2bf6e7d58ad59343, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c6428c1b08, %r1, %r9
	setx	0xbdc5eefb4578c2a8, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d1c8287238, %r1, %r9
	setx	0x1d92fcd030382659, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e5eeab4678, %r1, %r9
	setx	0xbba6f43a4a76eae1, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000faaaeab640, %r1, %r9
	setx	0x6c5a2f973e528605, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e5c3780, %r1, %r9
	setx	0x14d869e760dd78f6, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800fd21b60, %r1, %r9
	setx	0x7ef74e000c69db3f, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c2a2232d30, %r1, %r9
	setx	0x74a650c7a7cad73f, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d503345320, %r1, %r9
	setx	0x93727dc90dff4442, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e3530f6f68, %r1, %r9
	setx	0xf6e12bbc0d57d9ff, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000fe52467188, %r1, %r9
	setx	0x7efe0cc13bb326f1, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800eb40950, %r1, %r9
	setx	0x81a59a159cf5dd19, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f7e32f0, %r1, %r9
	setx	0xd6ae792cc47cc3f7, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c231084b88, %r1, %r9
	setx	0x6e9dd0c87f13250a, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000df829fefd0, %r1, %r9
	setx	0x75c4e7ebdf190063, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000ef696a2210, %r1, %r9
	setx	0x2a4e46f6d31d06ba, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f446b037a0, %r1, %r9
	setx	0x34a49a2774e3ba9d, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e406468, %r1, %r9
	setx	0xa2c611466ae80afe, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f5cd4b0, %r1, %r9
	setx	0x3a3c459a66bc027f, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ce95a5c048, %r1, %r9
	setx	0xf1fe753d28a0b8a3, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000dc5b1840c0, %r1, %r9
	setx	0x042fb0ae359bcec5, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000eeefaea428, %r1, %r9
	setx	0xef806eb52c04c04e, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f623739dd0, %r1, %r9
	setx	0x069d97dc6854794a, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f0e00078f0, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000e0c3122888, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000d5c1247680, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000c8892fbb50, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800f4d0c88, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800e153d08, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800f091bd0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e24fb30, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000f03993c650, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000e845f5f438, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000dab25c4468, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000c61a503e18, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d79ea1b010, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000c707f4da78, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000d68e6a9c40, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000c980da6490, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800f5f3190, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800ea7a230, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000f0520acdd0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000e965ed9c28, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800eb03f10, %r1, %r9
	setx	0x730a744eeb611780, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800faa3280, %r1, %r9
	setx	0x84ae07befa36b5d9, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000cfb590d7d8, %r1, %r9
	setx	0x2feadf31e8c7d43e, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d0253f5400, %r1, %r9
	setx	0x88c7194dab0c4eb4, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000eb1d1021e0, %r1, %r9
	setx	0x1b61bfd852f6008e, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000fc3f7c4660, %r1, %r9
	setx	0x0a06358c4b99e336, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e9b40c0, %r1, %r9
	setx	0xe975a2c603d599bd, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800fe06210, %r1, %r9
	setx	0x94573dea668d0aad, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000cb756d9d58, %r1, %r9
	setx	0x4c1018af4467cb38, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d75abc8670, %r1, %r9
	setx	0x7b8d2a72fa55b94a, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000ecfadab230, %r1, %r9
	setx	0x940ca6cbe8113ee1, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f09b346908, %r1, %r9
	setx	0xc09132e955b3c578, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800eff0ef0, %r1, %r9
	setx	0x5eeaba8cc6822259, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800fe73d00, %r1, %r9
	setx	0xa994014010eb56d2, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000cf907d5500, %r1, %r9
	setx	0x65dbc5f6160e84a5, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d688362a40, %r1, %r9
	setx	0xdbdf743fcc70d73d, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e67aa20be0, %r1, %r9
	setx	0x72bb60c24af4abbb, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000fa3db298a0, %r1, %r9
	setx	0x8f9441d9abfd32b3, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e3f76e0, %r1, %r9
	setx	0x9796741dd4c6a235, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f324c80, %r1, %r9
	setx	0xf0bc91328fd02d3e, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000caa4a08ca0, %r1, %r9
	setx	0xe73d50339664ba24, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000dfeb7b8878, %r1, %r9
	setx	0xb42b1fe2551b03bc, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e463efecb8, %r1, %r9
	setx	0xede5850b65a278a7, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f0cb49afb8, %r1, %r9
	setx	0x9ec7bf9bcbdff853, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f80b731d88, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000eb48abba90, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000deca01ab88, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000cacc979cc0, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000d70168e030, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000ca87362a70, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800f40bf08, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800ef26848, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000f8db610900, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e22edf0, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000f6cea5a778, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000f80fe58ff0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800edc8570, %r1, %r9
	setx	0xf22fefc4b5a37484, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800ffc89c0, %r1, %r9
	setx	0x9b535c3f8b9f4ef8, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c889b4cbe0, %r1, %r9
	setx	0x97447135bdf3d18e, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d63541eaf0, %r1, %r9
	setx	0xfe4a0c856602a8bb, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e58a8da228, %r1, %r9
	setx	0x3b0591e0a5143183, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f455a11fb0, %r1, %r9
	setx	0x06671a01d93032ac, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800eb8a108, %r1, %r9
	setx	0xda3ce4ec140c6c91, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800ff6a268, %r1, %r9
	setx	0xc60609a6ce2dbf82, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c2460abb70, %r1, %r9
	setx	0xcc84eb95cf116703, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000de858f0128, %r1, %r9
	setx	0x9ab89667efd8e7e9, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000ef296a9410, %r1, %r9
	setx	0xe318a666950c1d61, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f818760948, %r1, %r9
	setx	0x8dc98a14fac4f969, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e861190, %r1, %r9
	setx	0x383ed23a476c09cf, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f8fc4e0, %r1, %r9
	setx	0x34ad4876a47075e3, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000cdcb7d40d8, %r1, %r9
	setx	0x1feff6fa22534feb, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d0ae923328, %r1, %r9
	setx	0xe8a4b04cc1a3e27e, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000eee2bac2c0, %r1, %r9
	setx	0xc47424a1bf575884, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f2fa424e28, %r1, %r9
	setx	0xc2a1bc50ac73f9dc, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e31b858, %r1, %r9
	setx	0x0f47589bb3d4b7db, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800fe23a70, %r1, %r9
	setx	0x25ad6b3225b37285, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000cc7f969830, %r1, %r9
	setx	0xe576b908965afe34, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d75e049638, %r1, %r9
	setx	0xefe26c20fc882352, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e7cd1602f0, %r1, %r9
	setx	0xe2125618e2e0a100, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000fe00c080e8, %r1, %r9
	setx	0x5c9ed714803e24e9, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f26ee505d8, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800ee34e60, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000fe221416d8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000ddbbb7d4e8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000cad7baafe8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800f2ed3d8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800ee62308, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000fac55ceba0, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000e89c3fd880, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800e2d8d08, %r1, %r9
	setx	0x37ecfab3193ebe4f, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f536be0, %r1, %r9
	setx	0xe861a4d5726dc30b, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ca52db4eb0, %r1, %r9
	setx	0x6b12f8bf02882644, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d9696decb8, %r1, %r9
	setx	0xe529407fee7f237d, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000eb971d5398, %r1, %r9
	setx	0xb74a8ace8bf5503e, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000fc2a6faff0, %r1, %r9
	setx	0x6ab6b4127b9b1696, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e134fa0, %r1, %r9
	setx	0x7bdf30e08dc91221, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800fe77070, %r1, %r9
	setx	0x4a276382b2e3a0e4, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c6be0ed018, %r1, %r9
	setx	0x91d75707d7b3494f, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d43c335d58, %r1, %r9
	setx	0xf13f3081ff0cc0bc, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e787f8ffe0, %r1, %r9
	setx	0x3fb27fe1b9c582f6, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f0179835f0, %r1, %r9
	setx	0x3e9819db0e2d7be6, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e42c178, %r1, %r9
	setx	0xf8d931a47fa86e4c, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f36c670, %r1, %r9
	setx	0x55bbcde019f3db50, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000ca6b921aa0, %r1, %r9
	setx	0x1e3aad60126345d2, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d947997c20, %r1, %r9
	setx	0x5d1ba02ae2518d55, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e843b704e8, %r1, %r9
	setx	0x20a08125122ec29b, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f6f42da5e8, %r1, %r9
	setx	0xa065da2e856bed2b, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e8e8718, %r1, %r9
	setx	0xe22a62195bd92bcf, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800faa2c50, %r1, %r9
	setx	0x8832e6264595d772, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c698ef9c20, %r1, %r9
	setx	0xb5f6d00f694c9e4a, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d885d4f810, %r1, %r9
	setx	0x491a878fcf41acab, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e7ac007c90, %r1, %r9
	setx	0x3d688992d4832508, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f8583bc818, %r1, %r9
	setx	0x39337d66a202538f, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800edbd020, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000f4804a1cd0, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000e346ad3d50, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000de6cfbd920, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000c5423eccd0, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800f5fb5f8, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800ed32950, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000c29b7aeb18, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800f006778, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e724c60, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000f85e8bbf28, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000e0dd051a28, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000ea87c84c58, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000d531a141c0, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000c5f36c73b8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800f28cfe8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000ee97b79040, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000df8063f3e8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000cc5b1d8da8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800f25a388, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e6dd210, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000fc22069ae0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800ee4f070, %r1, %r9
	setx	0x1161aa4d7e61cc27, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800fbb9b40, %r1, %r9
	setx	0x07162cb3b01258f2, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ce56033ae8, %r1, %r9
	setx	0x3fccc67592f03bff, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000decdcc1ae8, %r1, %r9
	setx	0x5916cc2f52fcde10, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ef98aa6cc0, %r1, %r9
	setx	0xe2f59914878dd7cd, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f42ec2a3c8, %r1, %r9
	setx	0x2c79f4b1d5d49f28, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800eb7dc98, %r1, %r9
	setx	0xb2d4de74da443403, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f37beb0, %r1, %r9
	setx	0xedaaca88d7b50e2b, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000cb43fa4b68, %r1, %r9
	setx	0x96708f4002f19286, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d3ebb79d88, %r1, %r9
	setx	0xe6ead218555b3994, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e9a0860b20, %r1, %r9
	setx	0xb6dfe82bd0a7d7da, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f0c8bb63e8, %r1, %r9
	setx	0x192e8ff2b928ea57, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e560468, %r1, %r9
	setx	0x42f53ba402c0ef90, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f4e9198, %r1, %r9
	setx	0x917529fa038edf0f, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c9b41c33f0, %r1, %r9
	setx	0x2b984396c2706ac1, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d2b1b9bcd8, %r1, %r9
	setx	0xe5de2cce7cca5c3d, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000ece2f5a5f0, %r1, %r9
	setx	0x22d618ffe15b5956, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000fe01325c98, %r1, %r9
	setx	0x3e33df6b3d0f877e, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e143a08, %r1, %r9
	setx	0x2e02a4ed0e35fb50, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800fc72790, %r1, %r9
	setx	0x9e67c98909f2b88b, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ca2d72b3c0, %r1, %r9
	setx	0xe0b3ae1c0268c745, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000df297f9de0, %r1, %r9
	setx	0x5e8c8a337a7a3213, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ea3d195978, %r1, %r9
	setx	0xdda7774d3d7ec0f7, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f8493f2e98, %r1, %r9
	setx	0xfc06efff85902be3, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f296349018, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000e74525dad0, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000dd67ad4c80, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000c4fe965f70, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800fe99e80, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800ec5ef48, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000d717214e58, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000c200283ee8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800ff23908, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800ec9a9e0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000faaea30f70, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000e63a93cda8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000dfbd47f410, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000ed872dbbe8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000d1cc9e19e0, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000c7858283d0, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800f04ed48, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800e63bf48, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000f0538cd950, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000e3b5ac9ec0, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800eb7df98, %r1, %r9
	setx	0xf64160b6d2c2dd3d, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f81e4e8, %r1, %r9
	setx	0xe664cbf3032a3c8d, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c82e13a1b8, %r1, %r9
	setx	0xd96fa76da373610a, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000db491583b0, %r1, %r9
	setx	0x83050cffe8db7740, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e419c23c70, %r1, %r9
	setx	0x8678f1047102dd3b, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f493d243e0, %r1, %r9
	setx	0xb667ca88867cee7b, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e9b2520, %r1, %r9
	setx	0x261c4652e006def5, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800fcc2310, %r1, %r9
	setx	0xee14d535c7562209, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c37ce44578, %r1, %r9
	setx	0xc303bb53e51afdc0, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d2b039fb18, %r1, %r9
	setx	0x0987bf027764193c, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000eb0c423ee8, %r1, %r9
	setx	0xa7aa5597322b771a, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f0e0c85288, %r1, %r9
	setx	0x8905d0f27ef3f337, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800eb67a18, %r1, %r9
	setx	0x524260ad881c7a75, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800ff595e0, %r1, %r9
	setx	0xad724f4d6b16fe12, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c3ca474c08, %r1, %r9
	setx	0x78aa964c04e364e9, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000dd16b29088, %r1, %r9
	setx	0xda9b1805c42f0065, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e6f79c0e18, %r1, %r9
	setx	0x2251a66318b233d1, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000faa5831580, %r1, %r9
	setx	0x13bd28884d874c11, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e96b010, %r1, %r9
	setx	0x5ee7e156c66298f5, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f2f90b0, %r1, %r9
	setx	0x2b47daa55f69b224, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c3fd834728, %r1, %r9
	setx	0x03161e50d9b46be1, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d1189cc0d0, %r1, %r9
	setx	0x4314da708003ecaa, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ecd98f6620, %r1, %r9
	setx	0x43d17acacaf948f2, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f2eeca0fd0, %r1, %r9
	setx	0xa6cae16f11d7895b, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d8910b10e8, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000c71f378648, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800f491518, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800e83d188, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800f041450, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800ea12638, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000eef5682430, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000d8bb9a9ee0, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000c2ff041640, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800f7576f8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800e99e2a8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000f4bb5bf4e0, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000ef7ff65bf0, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000cafbbc8168, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800f79b918, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e09c330, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000fc75985070, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000ece0f60498, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800ebab510, %r1, %r9
	setx	0x560c5f8afbc17acc, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800fe1b040, %r1, %r9
	setx	0x68d6a25ff7b53fb7, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000cfab6542f0, %r1, %r9
	setx	0xfd1c78bf9d8b36d9, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000daf18c90f8, %r1, %r9
	setx	0xaa82aafe85fdb416, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e31b21ee98, %r1, %r9
	setx	0xe119f438145ba688, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f0693607e0, %r1, %r9
	setx	0x48320724eab27985, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800edc3980, %r1, %r9
	setx	0xce9705fcde1887c5, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f467608, %r1, %r9
	setx	0x5127224dbb0e9e63, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c6dfcc7428, %r1, %r9
	setx	0x1b623acae91f9965, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d7caaa2d18, %r1, %r9
	setx	0x0411aa2ab00a3c71, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000efe8f738d0, %r1, %r9
	setx	0x1fc32c725f3c7c3c, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000fcf0400838, %r1, %r9
	setx	0x5058c3ee8af332bc, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e964ed0, %r1, %r9
	setx	0xc07c8930092ff832, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f551b40, %r1, %r9
	setx	0x5a7f3cde7bee3999, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c027c209c0, %r1, %r9
	setx	0xe418bad9689bb26c, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d645725a20, %r1, %r9
	setx	0x04aba84c80e2023f, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e0d2ce28d0, %r1, %r9
	setx	0x783b5222a6af77ac, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f040f02b48, %r1, %r9
	setx	0xd6087e810321291d, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800eee81f0, %r1, %r9
	setx	0xdf04a576adb1dd2d, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800fb99b40, %r1, %r9
	setx	0x0e4736a0d6002780, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c079cd8c48, %r1, %r9
	setx	0x43ddc48eeec3102c, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000dadbd6ca70, %r1, %r9
	setx	0xed653546f1bce016, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ee02cdc9c0, %r1, %r9
	setx	0xdd0623f4725dcb80, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f66de23fe8, %r1, %r9
	setx	0x9f1e1a05376c77ef, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800e0b9690, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000f8150dbdc8, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000eb42537b78, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000d157e40f98, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000c1a9d93280, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800fd8e1d8, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800ee0c9e8, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800f267d80, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e404808, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000fcda931e30, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000e29fbd9bd8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d5b27ebae0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000cace363c98, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d8fa1adf70, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000c041fe3708, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800f8d3768, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800e91ba38, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000f446686bd8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000e337981498, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800e6ba170, %r1, %r9
	setx	0xde55be34b2ea2941, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f3d5d20, %r1, %r9
	setx	0x3675d50a8debced8, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c6e1b01f50, %r1, %r9
	setx	0xbd7fc5bbda09d28f, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d8eec05f80, %r1, %r9
	setx	0xa55612ebac52e924, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000edff150008, %r1, %r9
	setx	0x4579aca1d8b30645, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f8bd3b53a0, %r1, %r9
	setx	0xa9127018f4fd2c6c, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e1ab6d8, %r1, %r9
	setx	0xb8ffe9965c294e1a, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f4ebff0, %r1, %r9
	setx	0xb670cebfed564406, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000cfc8d00398, %r1, %r9
	setx	0x239a822eaf113a2e, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d3d1008568, %r1, %r9
	setx	0xed30d29823247be1, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e2761c6e10, %r1, %r9
	setx	0x13b08c8df3f10676, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f4914f1ca0, %r1, %r9
	setx	0x8b402810f1abc5db, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800edb8c98, %r1, %r9
	setx	0xa73e9c84373c6d5a, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f119c30, %r1, %r9
	setx	0x4ee5526d5a3dfe0b, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c603c3ba20, %r1, %r9
	setx	0x8583e4d0b9139f78, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d2146c8da0, %r1, %r9
	setx	0x67fde2979eea8c99, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e257127418, %r1, %r9
	setx	0xc1d430cc3ff811fc, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f2d49d8700, %r1, %r9
	setx	0x1aeadc40cf5a62e5, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e4de858, %r1, %r9
	setx	0x1ea4feaea3b83ab7, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f67d350, %r1, %r9
	setx	0xa88fa5626ac0bad1, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c98ab83868, %r1, %r9
	setx	0x84e697e435908ce4, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000dd99b14ba8, %r1, %r9
	setx	0x700653538e4d5a7d, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000efc2c63888, %r1, %r9
	setx	0x2d2acf41e388d0d0, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f4ebfb05d8, %r1, %r9
	setx	0x218736e207aa2dce, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000fc4c3e1ed0, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000e7960401b8, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000d1c666af28, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000c6b4aee2a8, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800f354a98, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800edbd020, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800ebbcbc8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000f23b6a9700, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000edd4754940, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000dab2c2af20, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000c29b7aeb18, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800f006778, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e724c60, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800eb9bca8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000fe2942eee0, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000e51f7d3f18, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000d1ef34bd30, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000cde2f518a8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800f2201a8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800e6847d0, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000e26a587540, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000d03f5f0cb8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000c57985b760, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800faec1b8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e2afbf0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e0adc08, %r1, %r9
	setx	0xb4959885676385db, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800fa56b60, %r1, %r9
	setx	0x1f484559b8b900b5, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c5b05e50a0, %r1, %r9
	setx	0x244ee4a569a18ed1, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d186eb7038, %r1, %r9
	setx	0xfa37473c62404b5a, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e2854161b0, %r1, %r9
	setx	0x21c48adb0948da9b, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f448936d90, %r1, %r9
	setx	0x943089bc55663d3f, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e621cf8, %r1, %r9
	setx	0x088b40fd132b5958, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800fcfe380, %r1, %r9
	setx	0x0a13ce9b0b7dd143, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000cdee707670, %r1, %r9
	setx	0x408f55ac08f47d41, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000dc0bc7ff68, %r1, %r9
	setx	0x7b44fd69b3fb1b04, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e12aa9faa0, %r1, %r9
	setx	0x75d70828fb9d0685, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f65b90d708, %r1, %r9
	setx	0xc79eb36c54c1bf8b, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800ec678b8, %r1, %r9
	setx	0xa042cc075c2d3271, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f3cd670, %r1, %r9
	setx	0x9a9a5c87d8ba2498, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c38bd390a0, %r1, %r9
	setx	0x522669faba6153d2, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d8938bac70, %r1, %r9
	setx	0xc6f8a34d86637e70, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e92e59ee80, %r1, %r9
	setx	0x81c23503d2a1a52a, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f04ba5c1f0, %r1, %r9
	setx	0xe2247773fb3f4772, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e1cbf08, %r1, %r9
	setx	0x05a7bef392698c6c, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800fd3eb40, %r1, %r9
	setx	0x7b51ef7dd4217b3d, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c8eab4e908, %r1, %r9
	setx	0xd8fd7f43b92d46a9, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000daba8112e8, %r1, %r9
	setx	0xada06fbb55267b9f, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e5c9b67e00, %r1, %r9
	setx	0x0187aa3a49d0b3fa, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000fc738c8e28, %r1, %r9
	setx	0x57d11182e728e428, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800fcee360, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000c34de8c168, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800f03c180, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000c3ffe38648, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800f09dc50, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800e061358, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000fca1aa2078, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000f47ce11130, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000e0766e9570, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000d71335c9d8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000c324fa0ad0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800f66f310, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800efd8620, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000f23b94b7f8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e618580, %r1, %r9
	setx	0xeec527b6f5339832, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f560008, %r1, %r9
	setx	0xc3b6ee52a0785235, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000cd4ad63028, %r1, %r9
	setx	0x1abb261be73176cc, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000dd8b65db48, %r1, %r9
	setx	0x142799f3414d0d93, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e1b1092cb8, %r1, %r9
	setx	0x046809c99d41c917, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f857b8fe50, %r1, %r9
	setx	0x34635cb03531d778, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e9a1c28, %r1, %r9
	setx	0x885b0f36f52f47b9, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f976b58, %r1, %r9
	setx	0xc3278f24dbd40562, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000ccd2b27268, %r1, %r9
	setx	0x51cc6f372b573dd6, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000dc3a966af8, %r1, %r9
	setx	0x29fcaf1b6e486462, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e955cf41b8, %r1, %r9
	setx	0x63cb2d2fe7fdc04b, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f265906d18, %r1, %r9
	setx	0xc90dde5ca6cfb606, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e9fbfd0, %r1, %r9
	setx	0xfeceed13502839e9, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f5761c8, %r1, %r9
	setx	0x28276be9be537025, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c817d8be38, %r1, %r9
	setx	0xe39707ed7361cfd1, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d24cf50248, %r1, %r9
	setx	0x8da01c3234f794ef, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000efe48d4540, %r1, %r9
	setx	0x85fe1aa299921074, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f4d70f1af0, %r1, %r9
	setx	0x5c2fd19cd0ec90b6, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800ef9e8c8, %r1, %r9
	setx	0xcc271c9a6f243dfd, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f078ce0, %r1, %r9
	setx	0x8dff54be649ad17c, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000cde05f3c40, %r1, %r9
	setx	0x899997e016dbd132, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d1f0d470c8, %r1, %r9
	setx	0xbf65a2cf9e843d92, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ee917f65c8, %r1, %r9
	setx	0x1a5c62d704106b5f, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f6394432d8, %r1, %r9
	setx	0xcf7bdc9528b604e7, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d333e2fca0, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000cba7d38080, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800ffbaf40, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800e0555f8, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000f00c588778, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000e5d0a7b318, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000d470659800, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800fe5dca8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e5d7850, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000f8b9108600, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000e68c21db30, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800f379538, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800ee31fd8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800f0c62e8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800ec40cf0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000f65857d5a8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000e61883d920, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000da8e5b6ef0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800efd1578, %r1, %r9
	setx	0xaa159953b2710075, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800fe752e0, %r1, %r9
	setx	0x51063051482fbfa9, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c106dea6f0, %r1, %r9
	setx	0x5ea087a293b0a482, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000dfe96ea548, %r1, %r9
	setx	0xa344da4403adaf29, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ec97f8d458, %r1, %r9
	setx	0x8f735ab759f95f32, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000fa75a4ef00, %r1, %r9
	setx	0x7b6ca4f57380a43c, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e6dce98, %r1, %r9
	setx	0x51fdd8205b3e1207, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800fc9c670, %r1, %r9
	setx	0x9b7a42e758907e9e, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000cd72ebf6c0, %r1, %r9
	setx	0x501a1db79244d1cc, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000ddb6508410, %r1, %r9
	setx	0x318d730830f5ff87, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000ebc2a3a4b8, %r1, %r9
	setx	0x975f4135435dbfa7, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f8667c7190, %r1, %r9
	setx	0x2aa81a709da5f663, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800ef253e0, %r1, %r9
	setx	0x7dbe195d531ba7ea, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f078228, %r1, %r9
	setx	0x0745d247591bfc4c, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c403117c28, %r1, %r9
	setx	0x9e5735f9aa18e2be, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000db53e5cf10, %r1, %r9
	setx	0x12523ce0e6947b4e, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e80dfbb490, %r1, %r9
	setx	0x1bbc2e31a1ad095a, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f06273e2d8, %r1, %r9
	setx	0x5fb9f34d200c2d13, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800ed9ef30, %r1, %r9
	setx	0x321f87298ee4b43e, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800fabb2e8, %r1, %r9
	setx	0xa80cc591d66449f9, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c2d6428860, %r1, %r9
	setx	0x2284eb7afe13e801, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000db04d24030, %r1, %r9
	setx	0xf62a0ad50be7e074, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ebf59e0288, %r1, %r9
	setx	0x4b610097cc0c4d3e, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000fef5a74af8, %r1, %r9
	setx	0xa01af9c500a71630, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800ea5a600, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000f4816a7798, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000da5ea2f8a8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000c93e7bafe8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800f6cda70, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e6730e0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800ee31fd8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000fc84756680, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000ed4bd20b30, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000d0cd35f1f0, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000c056521748, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800f32b6d0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e4f1890, %r1, %r9
	setx	0x5a83d80d1519d98d, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800fadc218, %r1, %r9
	setx	0x0c1e4a4bc7e66667, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c773491dc0, %r1, %r9
	setx	0xa0c60f6a6e68627b, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000da8021c9a8, %r1, %r9
	setx	0x790af9bc24fe01b5, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ec15e13820, %r1, %r9
	setx	0x5208d4fabb13c77e, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000fac592d9d8, %r1, %r9
	setx	0x796afac3b59b7647, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e6ada48, %r1, %r9
	setx	0x97641a3da6da4f01, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800fbd3188, %r1, %r9
	setx	0x30793cae6ccde563, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000cf25046fa8, %r1, %r9
	setx	0x5b742f82a3f5ce89, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000dd9e57a7b8, %r1, %r9
	setx	0x43efb70a76b993df, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e84b605928, %r1, %r9
	setx	0xda8f7c6dfccecf19, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000fc3e845068, %r1, %r9
	setx	0xf3ccf8a01bde7519, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e030e38, %r1, %r9
	setx	0x0fed285bcb304919, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f2c4010, %r1, %r9
	setx	0xd492066a24d54988, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000cdf09b76d8, %r1, %r9
	setx	0x3b711242a0f49c04, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d8bfa17580, %r1, %r9
	setx	0xe1a300d9481d4411, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e0ab63e0e0, %r1, %r9
	setx	0xfe5171de57decc9e, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000fa2621c6a0, %r1, %r9
	setx	0x05886c51bcfa7c3b, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e0dd9b0, %r1, %r9
	setx	0xb5f98b67ad45eacc, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f9ed488, %r1, %r9
	setx	0x577737f8687f4e9b, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c0e9152368, %r1, %r9
	setx	0x507aa8503b76b24b, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d61149f560, %r1, %r9
	setx	0xe72ab81beff7c533, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e68ad06c38, %r1, %r9
	setx	0xae359f4b5f2e5992, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000fa492e3878, %r1, %r9
	setx	0xce92220ccda2241c, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800e1bf388, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000fe1f1ad6e0, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000e2a14c42e0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000db02f608e8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000ca1c5ab0c0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800fa24360, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000df94d427a8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000cf4cd7aa60, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800f8f9638, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800e6fbbd0, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000eaa7e72ec0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000d88c189ef8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000cc11876ec0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800f7955d8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800ef4c8e8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000fcb10ef490, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e50d6c0, %r1, %r9
	setx	0x8d22c9e0c1ca8efa, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f898650, %r1, %r9
	setx	0xe9f2f9fd2a2c52be, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c0d6f9d6f0, %r1, %r9
	setx	0xc1809f0c5fe99392, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d477b04988, %r1, %r9
	setx	0x1aeb6abb52d7bcb0, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e857191cf8, %r1, %r9
	setx	0x16ddff34a183cfc6, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f4fb8a9700, %r1, %r9
	setx	0x37752ddfde24f00f, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e1c3830, %r1, %r9
	setx	0x7af04447e98fd658, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f4f01d8, %r1, %r9
	setx	0x568fcbc708ecaad3, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c2efdaef48, %r1, %r9
	setx	0x0ae8a6afc8f15cfa, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000dafbe074f0, %r1, %r9
	setx	0xf8da912da9d88225, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000eaaf6720e0, %r1, %r9
	setx	0x89c76acf231fdce9, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f4fb398098, %r1, %r9
	setx	0x31bc3de783c13e17, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800ea03768, %r1, %r9
	setx	0xdd8bd27aaeac484d, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f971a60, %r1, %r9
	setx	0x421e94d648483060, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000cc6badee18, %r1, %r9
	setx	0x63758a16546d14a7, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000dee4d63a48, %r1, %r9
	setx	0x51c6932471e0dbd2, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e5920357c0, %r1, %r9
	setx	0xaa5ce73e1d366633, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f0c14f86c0, %r1, %r9
	setx	0x9a0820f577484eec, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800ebc5b00, %r1, %r9
	setx	0x6b4b5937c9575635, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800fd06040, %r1, %r9
	setx	0x94d9a4581d50dc28, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c426acb1d8, %r1, %r9
	setx	0x6c5e0823b1e9c094, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000da91daaa78, %r1, %r9
	setx	0x6524f56722ccf4fc, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e27c798b18, %r1, %r9
	setx	0x31ccea5ed69ce020, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000fca7c469a0, %r1, %r9
	setx	0x08e0894a8587b5ad, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e034f474e8, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000d91bcd5540, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800f04ed48, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800e63bf48, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000f0538cd950, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000e3b5ac9ec0, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000d37d686eb8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000c81628dde8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800f87ac10, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800e633b00, %r1, %r9
	setx	0x86d9bedeede18662, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f933b48, %r1, %r9
	setx	0xc40e2541342c5610, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ce61f1d2a0, %r1, %r9
	setx	0x0cf7d4e22c3c4c05, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ded0adc858, %r1, %r9
	setx	0x4a6f0776c44d2a26, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000eb119a2e70, %r1, %r9
	setx	0x40b8f78ccc8a5e26, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000fe00d66190, %r1, %r9
	setx	0x512e317b731c2fd6, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e1d8660, %r1, %r9
	setx	0xedf25b285d4df287, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800fbe7e80, %r1, %r9
	setx	0xbd049c6157e69dd8, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000cac208bd28, %r1, %r9
	setx	0x6b9caa9034731962, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d1bbd23f28, %r1, %r9
	setx	0x8e498fe23722b734, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e127c3ea08, %r1, %r9
	setx	0x19721c6fd41bb888, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f4cd78b0f8, %r1, %r9
	setx	0xf2469fbbbf91fec0, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800ee3c0b0, %r1, %r9
	setx	0x62360e0b8b5d41ab, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f7b2568, %r1, %r9
	setx	0x9a3ce80b8502aabd, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000cdcea431e0, %r1, %r9
	setx	0x22b3b56b5648346c, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d64e3f9ca8, %r1, %r9
	setx	0xe7de32e59604d080, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e863f8b3f8, %r1, %r9
	setx	0xe4d3c38b1f9daa32, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f25c112c18, %r1, %r9
	setx	0x3546492fe87b8a4d, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e151bf0, %r1, %r9
	setx	0xbaf04fa6eaf70547, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800fb0bfc0, %r1, %r9
	setx	0xc10637698f0bc23a, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c18b8a0f80, %r1, %r9
	setx	0x5a3d975b0a537009, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d7d08895d0, %r1, %r9
	setx	0x5954a53ed9a2e25a, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e8b9733098, %r1, %r9
	setx	0x760900e5c89d970b, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f4047a48a8, %r1, %r9
	setx	0x2549fe0ef305029c, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c35a50c580, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800f314cc8, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800e77e5c8, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000f2b27ed2a0, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000e034f474e8, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000cd2612c5d8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800f962528, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e99bcc8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000f680341580, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000e78306afa8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d800400a90, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000c15fcd4058, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000dbfb3b28a0, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000c174b9ef08, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000d2122e0e20, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000ca3a23d520, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800f73c3f0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e251838, %r1, %r9
	setx	0xbdf7987885f85ce4, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800fe6bd50, %r1, %r9
	setx	0xf23c9fcff06b13e2, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c791731db8, %r1, %r9
	setx	0x16fac2be35cfa633, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d7950e4268, %r1, %r9
	setx	0x13e63ae526790984, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e11ee72818, %r1, %r9
	setx	0xd50743dc0b3b7d77, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000fc701e7270, %r1, %r9
	setx	0xc595067ddb3002cc, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e79f350, %r1, %r9
	setx	0x49f6534fe2df8f53, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800fc6eb60, %r1, %r9
	setx	0xfbcd5f85f666ee62, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000ce3ce41468, %r1, %r9
	setx	0x26b1a6918d661830, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000de0fc86208, %r1, %r9
	setx	0x2384c1040a9913c7, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000eacf7e2680, %r1, %r9
	setx	0xd2c7b4cbfa8ef839, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000fef6478ac0, %r1, %r9
	setx	0x2abfa9300ef64fca, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800eafaee8, %r1, %r9
	setx	0x29461eb8ea90ad63, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f2ed260, %r1, %r9
	setx	0x1f3fdab07bf8aa26, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c32a9c0e40, %r1, %r9
	setx	0x9447e615f38f3397, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000dc1e98bee8, %r1, %r9
	setx	0x0ab70b47f47dd357, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e595d9f2a8, %r1, %r9
	setx	0x3d98a3d3ca1617c9, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f4ca859698, %r1, %r9
	setx	0xa46bc73586069da3, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e42bfb0, %r1, %r9
	setx	0x13257eab981e54b0, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f23d650, %r1, %r9
	setx	0xeaafd0d9c21aeabf, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ca0cc7b3b8, %r1, %r9
	setx	0xcb2e6eea7ed53416, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d6f247ede8, %r1, %r9
	setx	0xf43426962520aec5, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ec887e8e40, %r1, %r9
	setx	0xd738c7d7a6cdb131, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f253b24658, %r1, %r9
	setx	0xb2c2dab464d0a1bb, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800fd582a8, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800e780118, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000fa03603b80, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000ebbc7f4128, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800e323b20, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000fe0193dd70, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000e0dd3a50f8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000df85c01120, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000c02a1f48c0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000c9b60056b0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800f633de0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800edeb660, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000fe6d425c08, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000ea92481b90, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800ea5b7b0, %r1, %r9
	setx	0x8ab04a0ee7b583ad, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800ff51290, %r1, %r9
	setx	0x442709a70f1ba1de, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000cd537e3388, %r1, %r9
	setx	0x5e14197045a89c5b, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d284105978, %r1, %r9
	setx	0xe8abf57b476d9774, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e3dd385b10, %r1, %r9
	setx	0xe61eebd0217ba533, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f66bd19f58, %r1, %r9
	setx	0x41aed1f1136741e5, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e3f03c8, %r1, %r9
	setx	0xec73a7cf616367e9, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800fff7de8, %r1, %r9
	setx	0x1b50c00f6277a61d, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c0ffcc5e48, %r1, %r9
	setx	0x2215a1eae7269cd4, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d0c92d4da8, %r1, %r9
	setx	0x9e1163deeabb1bf6, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e8049c6a78, %r1, %r9
	setx	0x2dd4f508b1afab3e, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f8bffc4710, %r1, %r9
	setx	0xdb2c86a6d0ba1d7f, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e537750, %r1, %r9
	setx	0xc652d5bb8d23dabe, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800fddf7a0, %r1, %r9
	setx	0x08b3465928c7d2cd, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c781fbf7e0, %r1, %r9
	setx	0x1c1b4151cd654006, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000dbeaa657b0, %r1, %r9
	setx	0x1990636d4b2d381c, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000ee4c138f08, %r1, %r9
	setx	0x9a552f2ac17b6397, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000fa29fb6ad0, %r1, %r9
	setx	0xb841e1fb04027300, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800ee84b90, %r1, %r9
	setx	0x9b9c5b286ae4fcff, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800fad1a18, %r1, %r9
	setx	0x3db7ba1f28f1eccc, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c1e3bc7950, %r1, %r9
	setx	0xa1822124f0c9eba7, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000dbdd3e06c0, %r1, %r9
	setx	0x11780311daaa0398, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ea22a329e0, %r1, %r9
	setx	0xa2592d9b5808441c, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f2970c46d0, %r1, %r9
	setx	0xc8ba512612b7fef0, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f045560e98, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000ec23a69480, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d929d0ea10, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000ce29e1c558, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800fce73a8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e41bea8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800f1a2078, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800e0a7d70, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000f0443d93b0, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000e5c4c3f9d0, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000d3f3a82d98, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000cbe99d5858, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800fdbcd88, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000c515c60a58, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800f801148, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e732eb8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800eb92410, %r1, %r9
	setx	0x76792aea98d49f74, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f9e66a8, %r1, %r9
	setx	0x6b554777c19b9786, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c8ba26b208, %r1, %r9
	setx	0xf9be8cb1b6e6e6e9, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000dd6a833700, %r1, %r9
	setx	0xc6eaef11de0cd506, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e730a336c8, %r1, %r9
	setx	0x41668269a396a36b, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f2f0c0f568, %r1, %r9
	setx	0x51af587148196cd1, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e6ed340, %r1, %r9
	setx	0xec2eb4b082f58342, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f1f90e8, %r1, %r9
	setx	0xe82149c7894605ab, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c243220b78, %r1, %r9
	setx	0xf5d94875615fec01, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d5b24cd9d0, %r1, %r9
	setx	0x359d8be7df5fcd64, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e6b6f92f50, %r1, %r9
	setx	0xe214b00c7b075e36, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f0cabcf580, %r1, %r9
	setx	0xfc3d35e15c63f281, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e43d990, %r1, %r9
	setx	0x5836a37311388494, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f231b48, %r1, %r9
	setx	0xdfccaec337556fc2, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c68ae1ba50, %r1, %r9
	setx	0x37ca30cfcd633163, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d88c5b0ce0, %r1, %r9
	setx	0x525da80e2258c766, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e7cd127748, %r1, %r9
	setx	0x72662ac3e4a9e98d, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000fe30928428, %r1, %r9
	setx	0x97037e26b96ac2ea, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e600aa0, %r1, %r9
	setx	0xcc550f36212b0ccd, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800fb133d8, %r1, %r9
	setx	0xcef62e3745551f09, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000cac5645968, %r1, %r9
	setx	0x7cebfe0012b4bbf4, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000dd1c5f0418, %r1, %r9
	setx	0x59c325702f2ba899, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000eb2abb2f20, %r1, %r9
	setx	0xf2005b8d962b4fa1, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f810bf6a20, %r1, %r9
	setx	0x49b6e9e87ff029e1, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f2bd920, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800ff23908, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800ec9a9e0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000faaea30f70, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000e63a93cda8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000dfbd47f410, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e5ac8b8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000f464980b30, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000e3b4da4d40, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000dabffa4ef0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e7a72b0, %r1, %r9
	setx	0x009339ce2251ba46, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800fe2fad0, %r1, %r9
	setx	0x7079a42ba0f222ec, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c9e3035a30, %r1, %r9
	setx	0xa3dc5a1cec9450e3, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000db8cd59140, %r1, %r9
	setx	0x5a74ca33b8565111, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e6d6516410, %r1, %r9
	setx	0xd844093afb206e88, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f4736a8868, %r1, %r9
	setx	0x0d2912ca529957bf, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e8ec0a0, %r1, %r9
	setx	0x3593a6521603663c, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f42cec8, %r1, %r9
	setx	0x6ea8045e516288f4, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000ca11809760, %r1, %r9
	setx	0x987f02fb3f8cdb4f, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d7b1fad5c8, %r1, %r9
	setx	0xb729e48b988caa70, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000ed887ba9b0, %r1, %r9
	setx	0x23f3aa865e480852, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000fcbebcdd30, %r1, %r9
	setx	0xcb0723dc1c5195de, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800ea5be58, %r1, %r9
	setx	0xab08f7206b405acb, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f0672a8, %r1, %r9
	setx	0xc6166dacac72c0d7, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c5df7223f8, %r1, %r9
	setx	0x822380c4de3e7f2f, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d0b5011490, %r1, %r9
	setx	0x4a6b8626432571a6, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e2e558bdb8, %r1, %r9
	setx	0x23aeff25ac4f808b, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000fcfb1264c0, %r1, %r9
	setx	0xa43173d3099e413d, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800ed3bde8, %r1, %r9
	setx	0x7e69d44e3e6387b6, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f417e50, %r1, %r9
	setx	0xc33b645f6d618063, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000cb7304af48, %r1, %r9
	setx	0x98b6344d961ec154, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000dd9b882c58, %r1, %r9
	setx	0xceb14b333639b495, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ebd351ba00, %r1, %r9
	setx	0x391d39e326086d79, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f259746c30, %r1, %r9
	setx	0xb682abe4b6dce57d, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f26ee505d8, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000ee445eb728, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000d0fcbeaf20, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800e323b20, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000fe0193dd70, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000e0dd3a50f8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000df85c01120, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000c02a1f48c0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800fe4fd88, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800e2bfed0, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000f6691be800, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000ef329db748, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800fd7aaf8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800ed35fa8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000f2b2eb95e8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000e61ca2ab38, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e9b0d20, %r1, %r9
	setx	0xcf8500bb2f28b4a8, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800fda8be8, %r1, %r9
	setx	0x005b4d0487799043, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c3835e6218, %r1, %r9
	setx	0xabb221eed217375f, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d4e3b17da0, %r1, %r9
	setx	0x370c4ad43e742381, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e69a1f2f68, %r1, %r9
	setx	0x102bdc0f6cafd452, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000fa1df3eba0, %r1, %r9
	setx	0x4d3ae8c87b23de46, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e1388e8, %r1, %r9
	setx	0xdd2f9231c78b494a, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f6be040, %r1, %r9
	setx	0x52cb92b55b1f1c1e, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c0976ac718, %r1, %r9
	setx	0x8cf1f2deca305f21, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000df34107530, %r1, %r9
	setx	0x59548a909c04140e, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e7fa11d248, %r1, %r9
	setx	0x9a36a019e8496de7, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f0781f9fd0, %r1, %r9
	setx	0x1c69b0883d4dc160, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e1a3ce8, %r1, %r9
	setx	0x1b11e709f821ae6c, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f3af638, %r1, %r9
	setx	0x437db61a08fbd5de, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000cdcfb6afe0, %r1, %r9
	setx	0x1b93e939dbf6eb9d, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000de912c41d0, %r1, %r9
	setx	0xabde43ed44ce2939, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e7572ecad8, %r1, %r9
	setx	0x9e179fcc37734072, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f0849c2e60, %r1, %r9
	setx	0xc910488f00337cb7, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800eb058b0, %r1, %r9
	setx	0xf7d759a00f0a265f, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800fc21180, %r1, %r9
	setx	0x71a2cfce67465c66, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c7967ce9f0, %r1, %r9
	setx	0x6cfd6b8edbf91caf, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d7b57584e8, %r1, %r9
	setx	0x1e52c5a0ed2dd800, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ec5211c878, %r1, %r9
	setx	0x627efc1d1408a27c, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000fed69f0ba8, %r1, %r9
	setx	0x33113673a3bb63f8, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e9122b7418, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000da72334378, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000cf29646100, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800f464a28, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800e0b9690, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000f8150dbdc8, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000eb42537b78, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000fef2ab38a8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000e18d6ee428, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000db62937460, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000c1480fafa0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800fc98c20, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e3d1088, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e9b7fa0, %r1, %r9
	setx	0x96df52d623bee34f, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f3ac440, %r1, %r9
	setx	0xeebe7bf283c8539e, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000cb83bbfbe8, %r1, %r9
	setx	0x8cd21f54eb432745, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d68627d3b8, %r1, %r9
	setx	0xdbe1d6d666761d9b, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e6a4ed8ba8, %r1, %r9
	setx	0x9ce1677a489ee64f, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f896ef1730, %r1, %r9
	setx	0x28858d69b75a7490, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e660b88, %r1, %r9
	setx	0x21573fbe64920231, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f3c3530, %r1, %r9
	setx	0x351025ea1427aec8, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c23a4ca750, %r1, %r9
	setx	0x2b6e6f56b734fd0d, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000df9030b020, %r1, %r9
	setx	0x431e82683ea149df, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000ed13d0fce0, %r1, %r9
	setx	0x4d4809531cd2ef85, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000fed4d62368, %r1, %r9
	setx	0xc6a667e8d2b5ae3a, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800ed8b688, %r1, %r9
	setx	0xb14294ebcb7ee46d, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f0db820, %r1, %r9
	setx	0x62c7ad871c5f014f, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000cdc907ab90, %r1, %r9
	setx	0x2e8c8a305faa0409, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000df270b2a28, %r1, %r9
	setx	0x215568386563766c, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e3bcdb00a0, %r1, %r9
	setx	0x05ea2d69952c2127, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000fc5f6f8b18, %r1, %r9
	setx	0xff889a160696179a, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e0f52e8, %r1, %r9
	setx	0xfcfcc2d5ce84fd29, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f83cee8, %r1, %r9
	setx	0x021a3a63a924f3ef, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c09815c060, %r1, %r9
	setx	0xff9da6982772d825, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d8cb507118, %r1, %r9
	setx	0xf240bc9fa9b2a033, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ef65cc7b90, %r1, %r9
	setx	0x153657419dd9a9a7, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000fa11ea5900, %r1, %r9
	setx	0x72992f079d307bed, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d333e2fca0, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000cba7d38080, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800ffbaf40, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800e0555f8, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000f00c588778, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000e5d0a7b318, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000d470659800, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000da5ea2f8a8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000c93e7bafe8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800f6cda70, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e6730e0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800eefda28, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000f2c01942b8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000ee0136ce98, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000dbadbce908, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000c0bcb73498, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800fdc5ff8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000c3fc277ae0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800f8dd300, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e0ff758, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000fa05766920, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000e876762860, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800eb964c0, %r1, %r9
	setx	0x4d6749f710c8e55a, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800ff97390, %r1, %r9
	setx	0x6902be7dc2d08f72, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000cbc6c2b6c0, %r1, %r9
	setx	0x49e266ad5b206db6, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000daac5b27a8, %r1, %r9
	setx	0xc4c16e9cf8d59d0b, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ed13ac4d58, %r1, %r9
	setx	0x4c5609e4ceff0ab2, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000fcf20c82a8, %r1, %r9
	setx	0x15d8c34d3fa9fa57, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e728e60, %r1, %r9
	setx	0x3607453ae1489219, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f62c990, %r1, %r9
	setx	0x85549659ad58ab33, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c07020a250, %r1, %r9
	setx	0xd5011330bbd0a2f5, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d6b9951480, %r1, %r9
	setx	0x4b2d45f9c3b392d7, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000ea483e21a8, %r1, %r9
	setx	0xb925686a25eccac7, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f685bc75d8, %r1, %r9
	setx	0xf9e4a0c5f28d8bde, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800ef96500, %r1, %r9
	setx	0x76c90dd18600ea86, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f5bac58, %r1, %r9
	setx	0x377da12b02e9bdcf, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000cdfaecddb0, %r1, %r9
	setx	0xb1d4d863cb72ca5b, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000dd84e67dd8, %r1, %r9
	setx	0xdf171dd01c3ec88a, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000ecf6e04818, %r1, %r9
	setx	0xd0a5fa99197c2131, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000fc54285d30, %r1, %r9
	setx	0xba78416113f1731d, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800eb73290, %r1, %r9
	setx	0x52bd62c7c2332e68, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f548820, %r1, %r9
	setx	0x3e77c9f7f445d6ca, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c596e6fe78, %r1, %r9
	setx	0xc9d559c0e0f8ce55, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d783812bc0, %r1, %r9
	setx	0xe884036e112dec23, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e016ca24b0, %r1, %r9
	setx	0x5ae76afe7ffb9448, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000fc92d2e668, %r1, %r9
	setx	0x40abe604fb8a4b00, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800ed171b8, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000f0750a1510, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000eb68594a38, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000d7ca3a83b0, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000dcfce99760, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000ca852ade38, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800fd53020, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e775fc0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000faca322c88, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e7c2b28, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000cafcb62e68, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800fd7aaf8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800ed35fa8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000f2b2eb95e8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000e61ca2ab38, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800ea58b28, %r1, %r9
	setx	0x30f7b3b9e2d04ed0, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f0c2b88, %r1, %r9
	setx	0xf371cd6fbe4c0091, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c69edcfcc8, %r1, %r9
	setx	0x939758fa13719f3c, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000dbf25c89a0, %r1, %r9
	setx	0x40c1d41a362ae07c, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e11fd89c90, %r1, %r9
	setx	0x41ebc1c4511c1a2a, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000fed6965950, %r1, %r9
	setx	0x3d69d3be712f8bc7, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e378b78, %r1, %r9
	setx	0xf346d4a8ebe4f176, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800ff23e50, %r1, %r9
	setx	0x38c97bc255134647, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c367661118, %r1, %r9
	setx	0x1e13eb5a5006714e, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d189d778d8, %r1, %r9
	setx	0xc397ced628d5a211, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e92167bc80, %r1, %r9
	setx	0x31e863093ca4e036, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f0b6f19ea8, %r1, %r9
	setx	0x6abcd9bc2dc4e42f, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e664f20, %r1, %r9
	setx	0x3c7986011eac6df8, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f59ceb0, %r1, %r9
	setx	0x7191a96d066802f1, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c29b802300, %r1, %r9
	setx	0x587c5782a1925481, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d7294e8b58, %r1, %r9
	setx	0x47595ec37680fa1a, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000ebd69b0088, %r1, %r9
	setx	0xf17fe7cafc449f06, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000fa38cb8d60, %r1, %r9
	setx	0xa4fb38fea6189b1f, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e640360, %r1, %r9
	setx	0x6a8d7a357d6844d8, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f90e298, %r1, %r9
	setx	0x198a26b2545e45b1, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ce1cf45920, %r1, %r9
	setx	0xae2ea36feec4fdbc, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000dc0b531948, %r1, %r9
	setx	0x8b46ba10c6bf7e69, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ecf0e4f800, %r1, %r9
	setx	0x8083c52988570110, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f238093aa8, %r1, %r9
	setx	0x57436c28046165a4, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000dbba19f7b0, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800e2fc188, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000f43a5a0eb8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000e7f309f800, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d03c327208, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000c8266e4ab8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000e397553378, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000d8fa1adf70, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000c041fe3708, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800f8d3768, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800e91ba38, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000f446686bd8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000ece0f60498, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000d7f3af2188, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e3e46d8, %r1, %r9
	setx	0x77d0d5d6fad2119d, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f5eb1b8, %r1, %r9
	setx	0x8f80f6829ccd956a, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c32b174550, %r1, %r9
	setx	0xc7dc4fc4106cfc0f, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000dea33c3ad8, %r1, %r9
	setx	0x7250b9243c5f88f6, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e6d14550a0, %r1, %r9
	setx	0xfe1400dc853a98da, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f4ceb54118, %r1, %r9
	setx	0xcc6362fb0087310e, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800ebf8800, %r1, %r9
	setx	0x95eb77fe052a55b6, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f10a5e8, %r1, %r9
	setx	0x82d55071c111cfa0, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c1e5e6fcb8, %r1, %r9
	setx	0x721623a3c934380c, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d029ca1670, %r1, %r9
	setx	0x116fa83a11f79423, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e519a8fce8, %r1, %r9
	setx	0x14dd0d5589bac80e, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000fa86122f78, %r1, %r9
	setx	0x5f6375885045e055, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800eb56a60, %r1, %r9
	setx	0x838438fb639170b1, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f5ce840, %r1, %r9
	setx	0xab69ae4b6941d2fc, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c47dfd4660, %r1, %r9
	setx	0x6c861cadfd5993f3, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d2cca7ccb0, %r1, %r9
	setx	0x25943d93cecf75b5, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e212488340, %r1, %r9
	setx	0x434c49bd2005ca27, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f4ebbfa4e8, %r1, %r9
	setx	0x0a9c0f5e01269dc3, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800ecd88a8, %r1, %r9
	setx	0x8d7dd57e2c25672d, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800fdc1068, %r1, %r9
	setx	0x24a3063e4d8a6371, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c3c8347bd8, %r1, %r9
	setx	0x97627fbd806e204b, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d6adc4ab68, %r1, %r9
	setx	0x4781e9ca05e04b42, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e0b5bb1ad0, %r1, %r9
	setx	0x5eb99c8891987299, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f0d53c8c60, %r1, %r9
	setx	0xc202ae02283bd238, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000fe259bfba0, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000e1e7a0d300, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000d9484b8a20, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000c182f80628, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800fabb8a8, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800edefef8, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000fe175c7ef8, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800ffcce98, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800ee462f8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000fa89dca150, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000e96b378268, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000d2728ec940, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000c8410d3180, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800f36b240, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e072658, %r1, %r9
	setx	0x145687af2ac0573a, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f2acf00, %r1, %r9
	setx	0xd8af858677e674a3, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c3ec5c46a8, %r1, %r9
	setx	0xbc3dc4650db97980, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d3549a4bd8, %r1, %r9
	setx	0xf981b685e20d6588, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e1e64a3300, %r1, %r9
	setx	0xc39b0a5999e9b1f7, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f429956bf8, %r1, %r9
	setx	0x76c330a589bb1d6a, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e1b0720, %r1, %r9
	setx	0xd3e8bc033e5c940a, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f69ee08, %r1, %r9
	setx	0x00eb8da66793046d, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000cbceee2fb8, %r1, %r9
	setx	0x63e57980f0dd7fb8, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000dd60768518, %r1, %r9
	setx	0x1f40ab24b8df1f46, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000ec35f20398, %r1, %r9
	setx	0x52dd07ea246488a4, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000fa01beaba8, %r1, %r9
	setx	0xf013be8e7b4a8d7e, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800ea1bb60, %r1, %r9
	setx	0xc70d0d3e44087ed2, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800fec02b0, %r1, %r9
	setx	0xf1f909e38e2ca971, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000cfa34545e0, %r1, %r9
	setx	0x97da075f6616792f, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d768546040, %r1, %r9
	setx	0x1a5628b5a2e9ce24, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000eb8982a5f0, %r1, %r9
	setx	0x9ceae1f0ddcf45bc, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f877bdbe38, %r1, %r9
	setx	0x316a394ed2a4f105, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e87e330, %r1, %r9
	setx	0xd073270e22057791, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800fc4efe0, %r1, %r9
	setx	0x648ba54d3d947aa0, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000cc30b358f8, %r1, %r9
	setx	0x665f54fb2b78a489, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d697ceaee0, %r1, %r9
	setx	0x519607aa5b94dec1, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e0bfd08420, %r1, %r9
	setx	0x2178a95e15b6e5a9, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f20c43e1c8, %r1, %r9
	setx	0x10c9c23530cbd7c8, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800e0905e8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000f4fbaec108, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000ee427bf3f0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d71ab75b10, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000c5d9d0b4b8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800f1068d8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000c5bb991688, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000d82480ef70, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e8f7fa0, %r1, %r9
	setx	0x733698235a8dd52d, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800fafdc80, %r1, %r9
	setx	0x56a52161d7b15b8c, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000cf05a595c8, %r1, %r9
	setx	0xe48a6fab35b07aaf, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d6737d3430, %r1, %r9
	setx	0x414cc183c4b66026, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e5aef07ec8, %r1, %r9
	setx	0x7b5cf76fcaa6126b, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000fcf86be8d0, %r1, %r9
	setx	0xbf752f2382705b43, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e21c670, %r1, %r9
	setx	0x8082baf2e44a2ac9, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f526e70, %r1, %r9
	setx	0x1329336f204ce243, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c85deed3c0, %r1, %r9
	setx	0x271351ba6eddb2e4, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000da8d329038, %r1, %r9
	setx	0xec6ed64768c5dbae, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000ea637b5220, %r1, %r9
	setx	0x653f78090c6b862d, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f0face7340, %r1, %r9
	setx	0xbedbee13f3539106, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e2462f8, %r1, %r9
	setx	0x5574bf7c1871fa89, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f780318, %r1, %r9
	setx	0x9a0a9d9b4eb24852, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c9c0c6e588, %r1, %r9
	setx	0x9175dadc0acb8ef1, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d6f01f4008, %r1, %r9
	setx	0xe9a27d212a2b58c4, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e933ec4d90, %r1, %r9
	setx	0x0af3ad97248488f0, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000fe81e13ff0, %r1, %r9
	setx	0x5e6dc0387df770d5, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800eafdea8, %r1, %r9
	setx	0x904dd0f2628184ed, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f9cfd88, %r1, %r9
	setx	0x7774a1d6fbea5afd, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c1324659b8, %r1, %r9
	setx	0x4f1d9d56cd7889b2, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d19e5bebb8, %r1, %r9
	setx	0x903557e06d62c9fa, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e867aee428, %r1, %r9
	setx	0x5e141e60608e9929, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000fc8e658e90, %r1, %r9
	setx	0x5c647b67f0ef05e0, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000cacc979cc0, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800f026988, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800ed3d7a8, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000fcc19eb6d8, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000e6a07c1028, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000d8910b10e8, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000c71f378648, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000ee81896dc8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000da3a9cefc8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000c701760928, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000c236748dd8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800f46dc58, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800e6c3d10, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000da1e586d20, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000cc5d0c08e8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800ff48e40, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800ead9be8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000f4a9f3f0f0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000e30c7a7018, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000dd40b73660, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e235c50, %r1, %r9
	setx	0xa69857c54a2a1745, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800fe84628, %r1, %r9
	setx	0x810b410c34e87893, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ca7669f920, %r1, %r9
	setx	0x49c4abce0876c5ba, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000da86f44818, %r1, %r9
	setx	0x02a569291f21ee47, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000eb1f71a028, %r1, %r9
	setx	0xc2869f13382dc088, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000fc4e0551a8, %r1, %r9
	setx	0x4f991756af226233, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e5d14e0, %r1, %r9
	setx	0xbc300d4daa60d029, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f306818, %r1, %r9
	setx	0x9427f0be3b0ca9cf, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c11734ca88, %r1, %r9
	setx	0xb1c809380bdf3fc9, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000dd2afcbf18, %r1, %r9
	setx	0xf7276f5b6fe5c8ef, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e1db055428, %r1, %r9
	setx	0xee05eec6e09bafe8, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f4d88acfa8, %r1, %r9
	setx	0x71d02e8b0f796ec7, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e97eb80, %r1, %r9
	setx	0x8f66f2b89924b4a0, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800fe5cc80, %r1, %r9
	setx	0x069e1c2ccfb75df5, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c77c713ec8, %r1, %r9
	setx	0xe00c6d120fbec831, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d1e1483488, %r1, %r9
	setx	0xd044ff93a29a59f3, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e259c83128, %r1, %r9
	setx	0x6a8ff373efd109f6, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f48edeadf8, %r1, %r9
	setx	0x673d24c31401c64c, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e28b350, %r1, %r9
	setx	0x828187f88e3eeddf, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f86d8e0, %r1, %r9
	setx	0xb0b2df6c3e8bf33a, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c6d8706b50, %r1, %r9
	setx	0xfcac6daf0404e7fd, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d2830087d8, %r1, %r9
	setx	0x8b9f3f00cf08ec18, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e5926a5ad0, %r1, %r9
	setx	0x390b36dc827a3797, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000fa2cd896b8, %r1, %r9
	setx	0x12a7ccb1bfd5b957, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e1f8c83330, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000da2fa7c9e0, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000c17535c9e8, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800f6619c0, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800ec46288, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000fe52590488, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800f327930, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d9d04ac5b8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000c8505850d8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800ea53a18, %r1, %r9
	setx	0xd97600f2dc29b252, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800fada620, %r1, %r9
	setx	0xcd1fc374f81dd28c, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ccc424b590, %r1, %r9
	setx	0x54a72af267ebe4b1, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d8a93035d8, %r1, %r9
	setx	0x7ef38e2432c995ef, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ef7dc80360, %r1, %r9
	setx	0x5c8e58dea72bc17f, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f08023a2e0, %r1, %r9
	setx	0x9d1a6f2ce4c7543a, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e73c6b0, %r1, %r9
	setx	0x730c19b3890ecaf9, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800feaab48, %r1, %r9
	setx	0x9c5f82a6c49ac3d4, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c9dadaa990, %r1, %r9
	setx	0x939de1bec63a2f30, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000dc36b7ea40, %r1, %r9
	setx	0x6b91b4afc0b0d804, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e6d4e1a168, %r1, %r9
	setx	0xa48163fec494b790, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f0fb28f070, %r1, %r9
	setx	0xc12f785feb281572, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800efde4b8, %r1, %r9
	setx	0x061de427e7e23786, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f3659f0, %r1, %r9
	setx	0xbe0eae0496cbd5b1, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c88c6017e8, %r1, %r9
	setx	0x14841a7ae940448e, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d4292a3ee8, %r1, %r9
	setx	0x6ee314e85cf4a8a6, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e2fa394f38, %r1, %r9
	setx	0xf705184889ee1ad1, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000fc11de3790, %r1, %r9
	setx	0x026ec372570ab69e, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800ef72930, %r1, %r9
	setx	0xa763a9eab2799b88, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f72ebc0, %r1, %r9
	setx	0xf0917c626c178fcd, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000cbe8ee3e68, %r1, %r9
	setx	0x412d9510562188d5, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000dadaba7920, %r1, %r9
	setx	0x8e345f8049c8e6cd, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ef74301578, %r1, %r9
	setx	0x4036f21dca3eb52a, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f2830a4330, %r1, %r9
	setx	0x45c357de642b6dc3, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800eec5798, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000f6155fea10, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000ed289497f0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000dee4510c90, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000cb905b09d8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800f0e3380, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e90d228, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d90445d378, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000c7615acbe8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800f61df98, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800ef17968, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000f2e140ff78, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000e156dfa6f0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000d5bbc877a0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800eb0e010, %r1, %r9
	setx	0xfb6fa28ab600f822, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f692d78, %r1, %r9
	setx	0x2576626083686016, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ca903ee3e8, %r1, %r9
	setx	0x94d416159d9ce782, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000deb45650a0, %r1, %r9
	setx	0xfb720fdc4782679f, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ea7afd08e0, %r1, %r9
	setx	0x6018f196f21475a6, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000feb57ec708, %r1, %r9
	setx	0xa3c4b65faf8b3d34, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e02a450, %r1, %r9
	setx	0xdd5fe63b45e1db4c, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800fb326f0, %r1, %r9
	setx	0x1f5bf1fa1715e9a6, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000cb150900f8, %r1, %r9
	setx	0x80a04b69aa66efc8, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d3eb11dbb8, %r1, %r9
	setx	0x311321a0c78b7afc, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000ed3cb9c2a8, %r1, %r9
	setx	0x4be2d298baa98d80, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f2284c6ed0, %r1, %r9
	setx	0x0f9f25babcb0497d, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800eb2c390, %r1, %r9
	setx	0x8265a0ff04298cd5, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f488e28, %r1, %r9
	setx	0x22fabc5af267b6d2, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c4afdde248, %r1, %r9
	setx	0x8610359c89db8408, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000db3d771c20, %r1, %r9
	setx	0x2ae90f152e363ded, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000ee407051a0, %r1, %r9
	setx	0xd31975f82b36b685, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000fc9080a7b0, %r1, %r9
	setx	0x2bf3dce935d8ada1, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e5d9e08, %r1, %r9
	setx	0x62a40027f546cbc0, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f4a71a0, %r1, %r9
	setx	0xd19b330ba0c5ab00, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c175d16cb0, %r1, %r9
	setx	0x236f1812b3b66c90, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d313c1b2b0, %r1, %r9
	setx	0x8ccb452299a6b7ea, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000eb8a8db910, %r1, %r9
	setx	0x99c59114d48c5a9d, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000fa97e9b480, %r1, %r9
	setx	0xc6ceb1e295bb4a5f, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f1d7650, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800e39cf70, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000f47eb0f168, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800f59ef08, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e47d070, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000fef2ab38a8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000e18d6ee428, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d41b9501d0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000c210939920, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800f041450, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000fe0f203fe8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000e24a2c9ae0, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000ddbbb7d4e8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000cad7baafe8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800f2ed3d8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800ee62308, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000c7d35e88b0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800ff1e498, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e91da00, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000f04d835df8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000ef55a261a0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000d6160b8828, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800ed023c0, %r1, %r9
	setx	0x3fb8bf56f9c3d330, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f2fe950, %r1, %r9
	setx	0x91876cad5705e171, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c013d6f538, %r1, %r9
	setx	0xc3587b1bd375af98, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d577499a10, %r1, %r9
	setx	0xce4bfaad11699954, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ee03a9b020, %r1, %r9
	setx	0xcbc480231f9b7ba2, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f23e7285c8, %r1, %r9
	setx	0xaf896165be3058de, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e74fe50, %r1, %r9
	setx	0x9c189e822dacf85e, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800fe6f4a8, %r1, %r9
	setx	0xc9b47ccd321e58a9, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000cc367cdbd0, %r1, %r9
	setx	0x1e7d2b6d177de096, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000db13aa2a30, %r1, %r9
	setx	0x6ae3dcf15f1649f5, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e2f4fe9988, %r1, %r9
	setx	0xb782fca3dbe30c72, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f2c8964b68, %r1, %r9
	setx	0xb775d6b01c5abbcf, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e6498a0, %r1, %r9
	setx	0x882fa50f0aa915fe, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f38e608, %r1, %r9
	setx	0x4fafb534a0bc8ba0, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c6022873b8, %r1, %r9
	setx	0x108a4bccd75b2101, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d8e9b1a728, %r1, %r9
	setx	0xf296a10d9f124d51, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e043e50258, %r1, %r9
	setx	0x0b6aac05e17cc3ed, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000fcf81b8320, %r1, %r9
	setx	0xb12a6ed2e42d09ac, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e8a1318, %r1, %r9
	setx	0x52d7d1db9466e802, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f506160, %r1, %r9
	setx	0xcbb0c3148e0212d1, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000cd364fba98, %r1, %r9
	setx	0x5a9f4b71481c04f7, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d3c5618700, %r1, %r9
	setx	0x1f75e628c488d9a5, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e41d920f78, %r1, %r9
	setx	0x1dd0344e8c23ea5b, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f09c6f7238, %r1, %r9
	setx	0x6eda4e607597c2c6, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000feb74f1e00, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000e7c2c600c8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d48f2f7ca0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000cd2612c5d8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800f962528, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e99bcc8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000df94d427a8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000cf4cd7aa60, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800f8f9638, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800e6fbbd0, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000feab538228, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000ee1c3a3f78, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000df1b450c68, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000f6cc70fde0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000edf939faf8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000d348ae23c0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000c70c6ac5d8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800fc35ed0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e376118, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000fa4c63e040, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e92f2b0, %r1, %r9
	setx	0xd0fa5819100f409b, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f4d2268, %r1, %r9
	setx	0x7f3b52c38c7d9f9b, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c02d6f0130, %r1, %r9
	setx	0x25018ed6ce6cc8ec, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d2d7636968, %r1, %r9
	setx	0xce2f45d048a938da, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ecb28d5000, %r1, %r9
	setx	0x37025bb75d642024, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f2d3aa5060, %r1, %r9
	setx	0xf21406aa1ceb18a4, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e3745f0, %r1, %r9
	setx	0xad30b7f9e5c47322, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f176328, %r1, %r9
	setx	0x346725260773fa6e, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000cda5ddd948, %r1, %r9
	setx	0x22421ef57c46268b, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d16c396198, %r1, %r9
	setx	0x90ef127612bb54b4, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000ee25d4f980, %r1, %r9
	setx	0x48ae07023da5ddf3, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000fa85ac0c08, %r1, %r9
	setx	0x97fecad09c0b65f5, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e878018, %r1, %r9
	setx	0x7f5851e265803c80, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800fd5f458, %r1, %r9
	setx	0x93562f528493e50b, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c9cabb1798, %r1, %r9
	setx	0xa5bf2727d06aff01, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d73c0c47f0, %r1, %r9
	setx	0x09c1c3f005d8a9f9, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000ea72dfca90, %r1, %r9
	setx	0x437ba82310e923ba, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f02c031680, %r1, %r9
	setx	0xd1723f1b3a558651, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800eead708, %r1, %r9
	setx	0x92a16f46a1a9526c, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f70d880, %r1, %r9
	setx	0x8e3a4710175c2924, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c8ba41a668, %r1, %r9
	setx	0x9afdb41f26ac9028, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d3e56c0880, %r1, %r9
	setx	0xb79533cfde4166e5, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e8d5e08f30, %r1, %r9
	setx	0xda178a35a21d842f, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f2a87bbcd8, %r1, %r9
	setx	0x43fb0c2fcdc7b7c2, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800e451828, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800f9b5bb8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800ead0aa8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000f462077710, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000e9062eb148, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800ee2c628, %r1, %r9
	setx	0x8edc8e1833d8e8e6, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800fb67c28, %r1, %r9
	setx	0x453c276b92ce5be2, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c754ed0898, %r1, %r9
	setx	0x72417a0d794c0763, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000dcdf246eb0, %r1, %r9
	setx	0x50e6f6aada6f1b86, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e0d5ba32a8, %r1, %r9
	setx	0x7f77cd71d2c68f43, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000fee9b7aae8, %r1, %r9
	setx	0x07ab315262cbe607, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e02a058, %r1, %r9
	setx	0x3605f8a9a087c4ac, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800fa0f610, %r1, %r9
	setx	0xce9d8db079ed1c34, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000cc024872b8, %r1, %r9
	setx	0xe5f748884e94bf5a, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d5d1aa6308, %r1, %r9
	setx	0xb19b17ec96215094, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e6fcd53c78, %r1, %r9
	setx	0x275036eea1b3ea1e, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f65dd0fe98, %r1, %r9
	setx	0x8c7530303ae267e4, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e69e198, %r1, %r9
	setx	0x75b0cc0d4bf2a49a, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800fd7cc30, %r1, %r9
	setx	0xd14296c7b7d67dee, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000ce83ed2488, %r1, %r9
	setx	0x8b3a6be4b0ae1150, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000dc3ffc5310, %r1, %r9
	setx	0x515f07b494ce463f, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e34edd6810, %r1, %r9
	setx	0x51f7be2e4ee08add, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f4182a64a8, %r1, %r9
	setx	0xbd58739ed004cc73, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800ecb2e20, %r1, %r9
	setx	0x4709338fdc922cfe, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f8ea860, %r1, %r9
	setx	0x86cf9dd2588d06ae, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c637c1cf50, %r1, %r9
	setx	0x02f2f340a45a5767, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000dc82e51058, %r1, %r9
	setx	0x85e2c18cf9bcf901, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e5e8c6de38, %r1, %r9
	setx	0x4a05e7dc29b069f7, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f634216060, %r1, %r9
	setx	0x40e8622fdf084c27, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f0d3570, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800e3073b0, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000f8766ae7c0, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000d3b8d2f238, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000ca9aeea710, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800f7df0c0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e317e40, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000fce47949d8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000eb31a233a8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000dcc74de9a8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e8f4690, %r1, %r9
	setx	0x16c420768bf90786, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800fbc9630, %r1, %r9
	setx	0xae9ea8e797cd1c08, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000cedde0e0e0, %r1, %r9
	setx	0x26d181bef834c2a9, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000dac052e6a8, %r1, %r9
	setx	0x82f2d649c6266812, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e4d2b008f8, %r1, %r9
	setx	0xcda4c5eeaf674240, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000fe005615c8, %r1, %r9
	setx	0x7a62f7197a42f2e4, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800eec4600, %r1, %r9
	setx	0x768ea8a8caef57a0, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f692710, %r1, %r9
	setx	0x4c51d69b3208b062, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000ccb03610e0, %r1, %r9
	setx	0xf549d5d9f334a385, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d3b22783f0, %r1, %r9
	setx	0xe2b04eb2d5eaaa38, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000ea8d1083f0, %r1, %r9
	setx	0x8db5201a05a63b0e, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000fe9d835238, %r1, %r9
	setx	0xc8f55d5354e7de2e, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e871d80, %r1, %r9
	setx	0xbfc160f93720fb21, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f927c40, %r1, %r9
	setx	0x2cafce1088620797, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c8059fbaa8, %r1, %r9
	setx	0x1d5b32418e8b974c, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d58e50e458, %r1, %r9
	setx	0xf2ad4d961e6c2efd, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000edf5eec2f8, %r1, %r9
	setx	0xbc8c9f1a21e76345, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000feb1360060, %r1, %r9
	setx	0x3fc9d27abc0c25ed, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e43c758, %r1, %r9
	setx	0x4a19f953ec823c70, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f951798, %r1, %r9
	setx	0x8aef5ec843c4be2c, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c6926374b0, %r1, %r9
	setx	0x71a32ba923ab8463, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000dc0a6a6d68, %r1, %r9
	setx	0x6c682b80468ea9c2, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e9f18d2e20, %r1, %r9
	setx	0xb882acadade054b7, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f4d6d16640, %r1, %r9
	setx	0x1185c7ea0c5a3683, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000de85de04d8, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000c2974da9f0, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000ead1e25a88, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000dba6a17ea0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000cd883fc5f0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800f3d4040, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e793670, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000dfbd2575d8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000c96cc7d780, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800fc33eb0, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000cac5566628, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800fa8c560, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e3ba988, %r1, %r9
	setx	0xd98699d060256686, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f793508, %r1, %r9
	setx	0x97007859920a61f4, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000cae3890d10, %r1, %r9
	setx	0x9ed0ef3dd640d57a, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d070824098, %r1, %r9
	setx	0x0f4893cbde63d716, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e74e50f618, %r1, %r9
	setx	0x0f42ef19dee3797b, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f41458b3c8, %r1, %r9
	setx	0x2a8754edef5e9ecb, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e9d31a0, %r1, %r9
	setx	0xf9eada1b68053aba, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f34e3f8, %r1, %r9
	setx	0x5ab00655ba695142, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000cc3ff8dc78, %r1, %r9
	setx	0x696aa006740cae2d, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d49ec84b58, %r1, %r9
	setx	0x1a47936833c4e4c5, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e7f1b78b58, %r1, %r9
	setx	0x8327d7a09af907bf, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f08b587ab8, %r1, %r9
	setx	0xc08d15a3537df4cb, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e15d898, %r1, %r9
	setx	0x8d15188c4ee06d74, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f57cbc0, %r1, %r9
	setx	0x1f2085aeae97c874, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000cfe12ad270, %r1, %r9
	setx	0xcaaef5c828f0e74e, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000ddf3308520, %r1, %r9
	setx	0x455f235a55b7ed2e, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e7e76b57a0, %r1, %r9
	setx	0xd18bdafbe2ae9a8c, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f433f31498, %r1, %r9
	setx	0x840f15b7952ac473, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800efda320, %r1, %r9
	setx	0x4ca0677583d3e43a, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f2fb5d8, %r1, %r9
	setx	0x72b9ae911609fdde, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c3d004a2b0, %r1, %r9
	setx	0x443130e4b14a2faa, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000dde3a53f40, %r1, %r9
	setx	0xe06364f6f60e8e32, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ee0bb38838, %r1, %r9
	setx	0x48bf8a0462e6cdfb, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f2a6b999b8, %r1, %r9
	setx	0x6c25b528cb6d60ce, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000db5f2fdf50, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000c2964f5fa0, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800f149b50, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000cbae63ebd0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800f5db058, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d1cc9e19e0, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000c7858283d0, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800f04ed48, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800e63bf48, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000f0538cd950, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000e3b5ac9ec0, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000ca8fcb29b8, %r1, %r12
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
