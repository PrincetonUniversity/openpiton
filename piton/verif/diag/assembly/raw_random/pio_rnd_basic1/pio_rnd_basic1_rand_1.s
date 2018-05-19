// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: pio_rnd_basic1_rand_1.s
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
   random seed:	605859977
   Jal pio_rnd_basic1.j:	
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

	setx	0x000000d5ae9c7d38, %r1, %r9
	setx	0xe316c15393913316, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f2c7b3b610, %r1, %r12
	setx	0xe316c15393913316, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000ca67e35ed8, %r1, %r12
	setx	0x0000000000000000, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000f2c7b3b610, %r1, %r12
	setx	0xe316c15393913316, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000e6ebf3c068, %r1, %r12
	setx	0x0000000000000000, %r1, %r13
	stx	%r13, [%r12]
	ldx	[%r9], %r11
	setx	0xe316c15393913316, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
	setx	0x000000800eac9038, %r1, %r9
	setx	0x19518400c6814c2f, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d8dc2bdcc0, %r1, %r12
	setx	0x0000000000000000, %r1, %r13
	stx	%r13, [%r12]
	ldx	[%r9], %r11
	setx	0x19518400c6814c2f, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
	setx	0x000000800e658488, %r1, %r9
	setx	0x3ef2a709db078fb7, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000fa8637eee8, %r1, %r12
	setx	0xe316c15393913316, %r1, %r13
	stx	%r13, [%r12]
	ldx	[%r9], %r11
	setx	0x3ef2a709db078fb7, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
	setx	0x000000cf8a2125a8, %r1, %r9
	setx	0x548a63d863a21e03, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f01c7c6220, %r1, %r12
	setx	0xe316c15393913316, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000f01c7c6220, %r1, %r12
	setx	0xe316c15393913316, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000e8ab2be510, %r1, %r12
	setx	0x0000000000000000, %r1, %r13
	stx	%r13, [%r12]
	ldx	[%r9], %r11
	setx	0x548a63d863a21e03, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
	setx	0x000000800e9da378, %r1, %r9
	setx	0x8cbd979227b68543, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000fecc17fb50, %r1, %r12
	setx	0xe316c15393913316, %r1, %r13
	stx	%r13, [%r12]
	ldx	[%r9], %r11
	setx	0x8cbd979227b68543, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
	setx	0x000000f2c6458490, %r1, %r9
	setx	0x0012e51698cbe5e2, %r1, %r10
	stx	%r10, [%r9]
	ldx	[%r9], %r11
	setx	0x0012e51698cbe5e2, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
	setx	0x000000de23e1f6a8, %r1, %r9
	setx	0xf68d1283878db30a, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800fda8f80, %r1, %r12
	setx	0x3ef2a709db078fb7, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000e9d1d13b90, %r1, %r12
	setx	0xf68d1283878db30a, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000c04c589ea0, %r1, %r12
	setx	0x548a63d863a21e03, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000800e010f30, %r1, %r12
	setx	0x19518400c6814c2f, %r1, %r13
	stx	%r13, [%r12]
	ldx	[%r9], %r11
	setx	0xf68d1283878db30a, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
	setx	0x000000c5571b2f88, %r1, %r9
	setx	0xb8921f0e2e58ff1b, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000fee028bd68, %r1, %r12
	setx	0xe316c15393913316, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000edfce72a30, %r1, %r12
	setx	0xb8921f0e2e58ff1b, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000edfce72a30, %r1, %r12
	setx	0xb8921f0e2e58ff1b, %r1, %r13
	stx	%r13, [%r12]
	ldx	[%r9], %r11
	setx	0xb8921f0e2e58ff1b, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
	setx	0x000000f03fcfe0e8, %r1, %r9
	setx	0x6de63e29985efb03, %r1, %r10
	stx	%r10, [%r9]
	ldx	[%r9], %r11
	setx	0x6de63e29985efb03, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
	setx	0x000000c0a6e45058, %r1, %r9
	setx	0x3343729534e6dcc5, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d478156fe0, %r1, %r12
	setx	0x8cbd979227b68543, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000f8fcb67540, %r1, %r12
	setx	0xe316c15393913316, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000f8fcb67540, %r1, %r12
	setx	0xe316c15393913316, %r1, %r13
	stx	%r13, [%r12]
	ldx	[%r9], %r11
	setx	0x3343729534e6dcc5, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
	setx	0x000000c501f35018, %r1, %r9
	setx	0xaa738b52996b9895, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f220a33ec8, %r1, %r12
	setx	0xe316c15393913316, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000800e627088, %r1, %r12
	setx	0x19518400c6814c2f, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000800e627088, %r1, %r12
	setx	0x19518400c6814c2f, %r1, %r13
	stx	%r13, [%r12]
	ldx	[%r9], %r11
	setx	0xaa738b52996b9895, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
	setx	0x000000ca7bb6f5b0, %r1, %r9
	setx	0x5c3e5c27cdf2e172, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000fc4bed6ae0, %r1, %r12
	setx	0xe316c15393913316, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000800e2b9ca0, %r1, %r12
	setx	0x19518400c6814c2f, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000d326e316b0, %r1, %r12
	setx	0x8cbd979227b68543, %r1, %r13
	stx	%r13, [%r12]
	ldx	[%r9], %r11
	setx	0x5c3e5c27cdf2e172, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
	setx	0x000000c38419de80, %r1, %r9
	setx	0x843ae2ea623438de, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d757b13d40, %r1, %r12
	setx	0x8cbd979227b68543, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000e05199fd10, %r1, %r12
	setx	0xb8921f0e2e58ff1b, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000d757b13d40, %r1, %r12
	setx	0x8cbd979227b68543, %r1, %r13
	stx	%r13, [%r12]
	ldx	[%r9], %r11
	setx	0x843ae2ea623438de, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
	setx	0x000000f46c489d30, %r1, %r9
	setx	0x2f3b4adc2abc55ce, %r1, %r10
	stx	%r10, [%r9]
	ldx	[%r9], %r11
	setx	0x2f3b4adc2abc55ce, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
	setx	0x000000c1b4351e30, %r1, %r9
	setx	0x95441513ff9f6d10, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800ee40850, %r1, %r12
	setx	0x19518400c6814c2f, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000f0c194b480, %r1, %r12
	setx	0xe316c15393913316, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000800fed6a48, %r1, %r12
	setx	0x3ef2a709db078fb7, %r1, %r13
	stx	%r13, [%r12]
	ldx	[%r9], %r11
	setx	0x95441513ff9f6d10, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
	setx	0x000000800f979950, %r1, %r9
	setx	0x62dd38900ff03c0b, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f2114654e0, %r1, %r12
	setx	0xe316c15393913316, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000f2114654e0, %r1, %r12
	setx	0xe316c15393913316, %r1, %r13
	stx	%r13, [%r12]
	ldx	[%r9], %r11
	setx	0x62dd38900ff03c0b, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
	setx	0x000000800e447af0, %r1, %r9
	setx	0xd65ba6eccb01f9b8, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f002a00, %r1, %r12
	setx	0x3ef2a709db078fb7, %r1, %r13
	stx	%r13, [%r12]
	ldx	[%r9], %r11
	setx	0xd65ba6eccb01f9b8, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
	setx	0x000000d731b1f500, %r1, %r9
	setx	0xe2f9d6c37c4bce8c, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800e0f7938, %r1, %r12
	setx	0x19518400c6814c2f, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000800e0f7938, %r1, %r12
	setx	0x19518400c6814c2f, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000800e0f7938, %r1, %r12
	setx	0x19518400c6814c2f, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000cb61331850, %r1, %r12
	setx	0x548a63d863a21e03, %r1, %r13
	stx	%r13, [%r12]
	ldx	[%r9], %r11
	setx	0xe2f9d6c37c4bce8c, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
	setx	0x000000f0a5d5c6e0, %r1, %r9
	setx	0xbe224e2de9e97051, %r1, %r10
	stx	%r10, [%r9]
	ldx	[%r9], %r11
	setx	0xbe224e2de9e97051, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
	setx	0x000000800e54c930, %r1, %r9
	setx	0xe5e05b0917cc60e4, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d9cfbbfef0, %r1, %r12
	setx	0x8cbd979227b68543, %r1, %r13
	stx	%r13, [%r12]
	ldx	[%r9], %r11
	setx	0xe5e05b0917cc60e4, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
	setx	0x000000c723b83af8, %r1, %r9
	setx	0xb9a4c7442fd45a99, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800e44ed40, %r1, %r12
	setx	0x19518400c6814c2f, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000800f580b28, %r1, %r12
	setx	0x3ef2a709db078fb7, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000800f580b28, %r1, %r12
	setx	0x3ef2a709db078fb7, %r1, %r13
	stx	%r13, [%r12]
	ldx	[%r9], %r11
	setx	0xb9a4c7442fd45a99, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
	setx	0x000000d81f9a6008, %r1, %r9
	setx	0xc986e833833e2674, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f479b31cf8, %r1, %r12
	setx	0xe316c15393913316, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000ee82134a20, %r1, %r12
	setx	0xb8921f0e2e58ff1b, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000f479b31cf8, %r1, %r12
	setx	0xe316c15393913316, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000800fc7f058, %r1, %r12
	setx	0x3ef2a709db078fb7, %r1, %r13
	stx	%r13, [%r12]
	ldx	[%r9], %r11
	setx	0xc986e833833e2674, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
	setx	0x000000800f576cc8, %r1, %r9
	setx	0xa506d206db98d4ae, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800efb4f60, %r1, %r12
	setx	0x19518400c6814c2f, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000f2c7de38c8, %r1, %r12
	setx	0xe316c15393913316, %r1, %r13
	stx	%r13, [%r12]
	ldx	[%r9], %r11
	setx	0xa506d206db98d4ae, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
	setx	0x000000daf8e51288, %r1, %r9
	setx	0x3cba35171cc08a50, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000fa0cfc9598, %r1, %r12
	setx	0xe316c15393913316, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000e3003124c8, %r1, %r12
	setx	0xb8921f0e2e58ff1b, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000c082dca258, %r1, %r12
	setx	0x548a63d863a21e03, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000e3003124c8, %r1, %r12
	setx	0x0012e51698cbe5e2, %r1, %r13
	stx	%r13, [%r12]
	ldx	[%r9], %r11
	setx	0x3cba35171cc08a50, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
	setx	0x000000d6e38ff588, %r1, %r9
	setx	0x31d0c818b766837c, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800fee3280, %r1, %r12
	setx	0x3ef2a709db078fb7, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000c7c40aa9d8, %r1, %r12
	setx	0x548a63d863a21e03, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000fc531e92c8, %r1, %r12
	setx	0xe316c15393913316, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000800fee3280, %r1, %r12
	setx	0x3ef2a709db078fb7, %r1, %r13
	stx	%r13, [%r12]
	ldx	[%r9], %r11
	setx	0x31d0c818b766837c, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
	setx	0x000000d907b2dd00, %r1, %r9
	setx	0xd86824d291dbfa49, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c4c6f008c8, %r1, %r12
	setx	0x548a63d863a21e03, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000ef4e7bb078, %r1, %r12
	setx	0xb8921f0e2e58ff1b, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000800e7d1170, %r1, %r12
	setx	0x19518400c6814c2f, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000c4c6f008c8, %r1, %r12
	setx	0x548a63d863a21e03, %r1, %r13
	stx	%r13, [%r12]
	ldx	[%r9], %r11
	setx	0xd86824d291dbfa49, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
	setx	0x000000cb75f38440, %r1, %r9
	setx	0xfd8cbb9ed61ddeee, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f881140bc8, %r1, %r12
	setx	0xe316c15393913316, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000800e6c3670, %r1, %r12
	setx	0x19518400c6814c2f, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000e8babb1148, %r1, %r12
	setx	0x0012e51698cbe5e2, %r1, %r13
	stx	%r13, [%r12]
	ldx	[%r9], %r11
	setx	0xfd8cbb9ed61ddeee, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
	setx	0x000000d03b36d188, %r1, %r9
	setx	0xd6c35da6632fe1aa, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000fa9011a9e0, %r1, %r12
	setx	0xe316c15393913316, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000fa9011a9e0, %r1, %r12
	setx	0xe316c15393913316, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000fa9011a9e0, %r1, %r12
	setx	0xe316c15393913316, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000eb29a16088, %r1, %r12
	setx	0xf68d1283878db30a, %r1, %r13
	stx	%r13, [%r12]
	ldx	[%r9], %r11
	setx	0xd6c35da6632fe1aa, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
	setx	0x000000f2d4bcb778, %r1, %r9
	setx	0x2d0a7880aed95a5c, %r1, %r10
	stx	%r10, [%r9]
	ldx	[%r9], %r11
	setx	0x2d0a7880aed95a5c, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
	setx	0x000000f2b0d64150, %r1, %r9
	setx	0x269a365c95d0257a, %r1, %r10
	stx	%r10, [%r9]
	ldx	[%r9], %r11
	setx	0x269a365c95d0257a, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
	setx	0x000000fe92a20700, %r1, %r9
	setx	0xc27917ab262b7166, %r1, %r10
	stx	%r10, [%r9]
	ldx	[%r9], %r11
	setx	0xc27917ab262b7166, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
	setx	0x000000c4dcf14890, %r1, %r9
	setx	0xd23ae3b6b0f643e4, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800edbbc70, %r1, %r12
	setx	0x19518400c6814c2f, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000e70bd35f90, %r1, %r12
	setx	0x0012e51698cbe5e2, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000800edbbc70, %r1, %r12
	setx	0x19518400c6814c2f, %r1, %r13
	stx	%r13, [%r12]
	ldx	[%r9], %r11
	setx	0xd23ae3b6b0f643e4, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
	setx	0x000000800eeca498, %r1, %r9
	setx	0x2227288ed25fa124, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800fc6a4a0, %r1, %r12
	setx	0x3ef2a709db078fb7, %r1, %r13
	stx	%r13, [%r12]
	ldx	[%r9], %r11
	setx	0x2227288ed25fa124, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
	setx	0x000000dc18c5d360, %r1, %r9
	setx	0x7cac284d39101f7b, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f2ccbc0, %r1, %r12
	setx	0x3ef2a709db078fb7, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000800ea864f8, %r1, %r12
	setx	0x19518400c6814c2f, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000cdfcffd990, %r1, %r12
	setx	0x548a63d863a21e03, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000e1a70d68a8, %r1, %r12
	setx	0xf68d1283878db30a, %r1, %r13
	stx	%r13, [%r12]
	ldx	[%r9], %r11
	setx	0x7cac284d39101f7b, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
	setx	0x000000800eaa7300, %r1, %r9
	setx	0x4f6ba580e5a59332, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f42edf1518, %r1, %r12
	setx	0xe316c15393913316, %r1, %r13
	stx	%r13, [%r12]
	ldx	[%r9], %r11
	setx	0x4f6ba580e5a59332, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
	setx	0x000000cb01323e58, %r1, %r9
	setx	0xc09ceb757a4e3ed6, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f8b3581c00, %r1, %r12
	setx	0xe316c15393913316, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000dc1785dd08, %r1, %r12
	setx	0x8cbd979227b68543, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000dc1785dd08, %r1, %r12
	setx	0x8cbd979227b68543, %r1, %r13
	stx	%r13, [%r12]
	ldx	[%r9], %r11
	setx	0xc09ceb757a4e3ed6, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
	setx	0x000000800fbd9300, %r1, %r9
	setx	0x06467b8bdb17f5a5, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d34c31c8a0, %r1, %r12
	setx	0x8cbd979227b68543, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000f20c35c958, %r1, %r12
	setx	0xe316c15393913316, %r1, %r13
	stx	%r13, [%r12]
	ldx	[%r9], %r11
	setx	0x06467b8bdb17f5a5, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
	setx	0x000000800ebf75f0, %r1, %r9
	setx	0xedc0a1e9e8d7646d, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f810db1bc8, %r1, %r12
	setx	0xe316c15393913316, %r1, %r13
	stx	%r13, [%r12]
	ldx	[%r9], %r11
	setx	0xedc0a1e9e8d7646d, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
	setx	0x000000800e3edc50, %r1, %r9
	setx	0xaf361eb06acb8c9d, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000dba03102d8, %r1, %r12
	setx	0x8cbd979227b68543, %r1, %r13
	stx	%r13, [%r12]
	ldx	[%r9], %r11
	setx	0xaf361eb06acb8c9d, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
	setx	0x000000f6f7a2f218, %r1, %r9
	setx	0xfdd74aa04fde4ca1, %r1, %r10
	stx	%r10, [%r9]
	ldx	[%r9], %r11
	setx	0xfdd74aa04fde4ca1, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
	setx	0x000000f244b776c0, %r1, %r9
	setx	0x2bea6d96736e8839, %r1, %r10
	stx	%r10, [%r9]
	ldx	[%r9], %r11
	setx	0x2bea6d96736e8839, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
	setx	0x000000800fd97f38, %r1, %r9
	setx	0x395730c8e4db2877, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d12621c708, %r1, %r12
	setx	0x8cbd979227b68543, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000e19be816e8, %r1, %r12
	setx	0xb8921f0e2e58ff1b, %r1, %r13
	stx	%r13, [%r12]
	ldx	[%r9], %r11
	setx	0x395730c8e4db2877, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
	setx	0x000000d252b2d7c8, %r1, %r9
	setx	0x35a11f02916f7cbd, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c21a4c31b0, %r1, %r12
	setx	0x548a63d863a21e03, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000e9d7360ae0, %r1, %r12
	setx	0x0012e51698cbe5e2, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000e9d7360ae0, %r1, %r12
	setx	0xf68d1283878db30a, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000e9d7360ae0, %r1, %r12
	setx	0xb8921f0e2e58ff1b, %r1, %r13
	stx	%r13, [%r12]
	ldx	[%r9], %r11
	setx	0x35a11f02916f7cbd, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
	setx	0x000000f408aca4a0, %r1, %r9
	setx	0xdf59065c94e4e1e1, %r1, %r10
	stx	%r10, [%r9]
	ldx	[%r9], %r11
	setx	0xdf59065c94e4e1e1, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
	setx	0x000000d717659728, %r1, %r9
	setx	0xd583eaee58e646f8, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800e43d858, %r1, %r12
	setx	0x19518400c6814c2f, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000f60cf2c6b0, %r1, %r12
	setx	0xe316c15393913316, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000e262dd60c8, %r1, %r12
	setx	0xf68d1283878db30a, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000e262dd60c8, %r1, %r12
	setx	0x0012e51698cbe5e2, %r1, %r13
	stx	%r13, [%r12]
	ldx	[%r9], %r11
	setx	0xd583eaee58e646f8, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
	setx	0x000000800eb94a50, %r1, %r9
	setx	0xb6f555dc8b2802c7, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000dc12e1e8b8, %r1, %r12
	setx	0x8cbd979227b68543, %r1, %r13
	stx	%r13, [%r12]
	ldx	[%r9], %r11
	setx	0xb6f555dc8b2802c7, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
	setx	0x000000f20001c198, %r1, %r9
	setx	0x9c4924a73bc4aa56, %r1, %r10
	stx	%r10, [%r9]
	ldx	[%r9], %r11
	setx	0x9c4924a73bc4aa56, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
	setx	0x000000de1068b7a0, %r1, %r9
	setx	0xb7a6b14255bff0b1, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f2aea04578, %r1, %r12
	setx	0xe316c15393913316, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000f2aea04578, %r1, %r12
	setx	0xe316c15393913316, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000e887ae4e90, %r1, %r12
	setx	0xf68d1283878db30a, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000800fdb4260, %r1, %r12
	setx	0x3ef2a709db078fb7, %r1, %r13
	stx	%r13, [%r12]
	ldx	[%r9], %r11
	setx	0xb7a6b14255bff0b1, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
	setx	0x000000800f3fc1b8, %r1, %r9
	setx	0xae7a8a2f3d147bd9, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800ef477f8, %r1, %r12
	setx	0x19518400c6814c2f, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000c68e017150, %r1, %r12
	setx	0x548a63d863a21e03, %r1, %r13
	stx	%r13, [%r12]
	ldx	[%r9], %r11
	setx	0xae7a8a2f3d147bd9, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
	setx	0x000000d3cae543b8, %r1, %r9
	setx	0xa350b70c3418fdb3, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f8eebd6c10, %r1, %r12
	setx	0xe316c15393913316, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000c5e7c66cc8, %r1, %r12
	setx	0x548a63d863a21e03, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000e8b80250c0, %r1, %r12
	setx	0xf68d1283878db30a, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000e8b80250c0, %r1, %r12
	setx	0xf68d1283878db30a, %r1, %r13
	stx	%r13, [%r12]
	ldx	[%r9], %r11
	setx	0xa350b70c3418fdb3, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
	setx	0x000000fe88665cb0, %r1, %r9
	setx	0xaa00f37fa9db0f40, %r1, %r10
	stx	%r10, [%r9]
	ldx	[%r9], %r11
	setx	0xaa00f37fa9db0f40, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
	setx	0x000000c1a6923418, %r1, %r9
	setx	0xee2e7a6a091a525c, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f6a0e68e28, %r1, %r12
	setx	0xe316c15393913316, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000dd27174aa8, %r1, %r12
	setx	0x8cbd979227b68543, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000800e6d3928, %r1, %r12
	setx	0x19518400c6814c2f, %r1, %r13
	stx	%r13, [%r12]
	ldx	[%r9], %r11
	setx	0xee2e7a6a091a525c, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
	setx	0x000000f68f966da0, %r1, %r9
	setx	0x1a2e6b1e6f1e836d, %r1, %r10
	stx	%r10, [%r9]
	ldx	[%r9], %r11
	setx	0x1a2e6b1e6f1e836d, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
	setx	0x000000c92c0f3fe0, %r1, %r9
	setx	0x9f5f99cc72f085fa, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800e8067f8, %r1, %r12
	setx	0x19518400c6814c2f, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000e765416500, %r1, %r12
	setx	0xb8921f0e2e58ff1b, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000800fcf1778, %r1, %r12
	setx	0x3ef2a709db078fb7, %r1, %r13
	stx	%r13, [%r12]
	ldx	[%r9], %r11
	setx	0x9f5f99cc72f085fa, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
	setx	0x000000800e656358, %r1, %r9
	setx	0x667bf27fa91a8709, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000dc2e33bb28, %r1, %r12
	setx	0x8cbd979227b68543, %r1, %r13
	stx	%r13, [%r12]
	ldx	[%r9], %r11
	setx	0x667bf27fa91a8709, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
	setx	0x000000fa63d4c710, %r1, %r9
	setx	0x4b36671cb0499350, %r1, %r10
	stx	%r10, [%r9]
	ldx	[%r9], %r11
	setx	0x4b36671cb0499350, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
	setx	0x000000800f88ed90, %r1, %r9
	setx	0xe1d7f733117a044a, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000df30d99240, %r1, %r12
	setx	0x8cbd979227b68543, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000800e3619d0, %r1, %r12
	setx	0x19518400c6814c2f, %r1, %r13
	stx	%r13, [%r12]
	ldx	[%r9], %r11
	setx	0xe1d7f733117a044a, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
	setx	0x000000d05ad8d650, %r1, %r9
	setx	0x063c9b1fec2c7d0a, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c862fa69b8, %r1, %r12
	setx	0x548a63d863a21e03, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000c862fa69b8, %r1, %r12
	setx	0x548a63d863a21e03, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000e5dfdbaad8, %r1, %r12
	setx	0xf68d1283878db30a, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000800efb4318, %r1, %r12
	setx	0x19518400c6814c2f, %r1, %r13
	stx	%r13, [%r12]
	ldx	[%r9], %r11
	setx	0x063c9b1fec2c7d0a, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
	setx	0x000000da0249b1a8, %r1, %r9
	setx	0x11990399dabf85e3, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800e13bb98, %r1, %r12
	setx	0x19518400c6814c2f, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000fcad661458, %r1, %r12
	setx	0xe316c15393913316, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000eb0058d628, %r1, %r12
	setx	0xf68d1283878db30a, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000c5ac156848, %r1, %r12
	setx	0x548a63d863a21e03, %r1, %r13
	stx	%r13, [%r12]
	ldx	[%r9], %r11
	setx	0x11990399dabf85e3, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
	setx	0x000000f636226500, %r1, %r9
	setx	0x3d415643d1a015f1, %r1, %r10
	stx	%r10, [%r9]
	ldx	[%r9], %r11
	setx	0x3d415643d1a015f1, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
	setx	0x000000f6f72d9318, %r1, %r9
	setx	0xef4085ad9b805aa1, %r1, %r10
	stx	%r10, [%r9]
	ldx	[%r9], %r11
	setx	0xef4085ad9b805aa1, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
	setx	0x000000d10948e550, %r1, %r9
	setx	0xb2274fa4f2c296dd, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000cd54fe2070, %r1, %r12
	setx	0x548a63d863a21e03, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000800f4fcb70, %r1, %r12
	setx	0x3ef2a709db078fb7, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000cd54fe2070, %r1, %r12
	setx	0x548a63d863a21e03, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000800eb10f18, %r1, %r12
	setx	0x19518400c6814c2f, %r1, %r13
	stx	%r13, [%r12]
	ldx	[%r9], %r11
	setx	0xb2274fa4f2c296dd, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
	setx	0x000000d235f7e3f0, %r1, %r9
	setx	0xf3cadbe7d04266cd, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f857035768, %r1, %r12
	setx	0xe316c15393913316, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000e545e5bab0, %r1, %r12
	setx	0xf68d1283878db30a, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000800e8c1758, %r1, %r12
	setx	0x19518400c6814c2f, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000f857035768, %r1, %r12
	setx	0xe316c15393913316, %r1, %r13
	stx	%r13, [%r12]
	ldx	[%r9], %r11
	setx	0xf3cadbe7d04266cd, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
	setx	0x000000fcda151bd8, %r1, %r9
	setx	0xb492126cacc09a6a, %r1, %r10
	stx	%r10, [%r9]
	ldx	[%r9], %r11
	setx	0xb492126cacc09a6a, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
	setx	0x000000fa246131a8, %r1, %r9
	setx	0xdff0f422f0ef47de, %r1, %r10
	stx	%r10, [%r9]
	ldx	[%r9], %r11
	setx	0xdff0f422f0ef47de, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
	setx	0x000000d8e2bc0d50, %r1, %r9
	setx	0x63236bb5617112fe, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f446fa8, %r1, %r12
	setx	0x3ef2a709db078fb7, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000ee6d6532c0, %r1, %r12
	setx	0xf68d1283878db30a, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000800f446fa8, %r1, %r12
	setx	0x3ef2a709db078fb7, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000ee6d6532c0, %r1, %r12
	setx	0xb8921f0e2e58ff1b, %r1, %r13
	stx	%r13, [%r12]
	ldx	[%r9], %r11
	setx	0x63236bb5617112fe, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
	setx	0x000000c6029aa548, %r1, %r9
	setx	0x03fae4fc2f21b54c, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d3570adda0, %r1, %r12
	setx	0x8cbd979227b68543, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000800e500ae0, %r1, %r12
	setx	0x19518400c6814c2f, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000ed2f329228, %r1, %r12
	setx	0xf68d1283878db30a, %r1, %r13
	stx	%r13, [%r12]
	ldx	[%r9], %r11
	setx	0x03fae4fc2f21b54c, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
	setx	0x000000dd738ccbb8, %r1, %r9
	setx	0xefbe99377c7b2cdb, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800fd74030, %r1, %r12
	setx	0x3ef2a709db078fb7, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000fcd1a15188, %r1, %r12
	setx	0xe316c15393913316, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000e88ab2b6a8, %r1, %r12
	setx	0xb8921f0e2e58ff1b, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000e88ab2b6a8, %r1, %r12
	setx	0xf68d1283878db30a, %r1, %r13
	stx	%r13, [%r12]
	ldx	[%r9], %r11
	setx	0xefbe99377c7b2cdb, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
	setx	0x000000800fde1730, %r1, %r9
	setx	0x94cca49be6635ebe, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ccfd41c4e8, %r1, %r12
	setx	0x548a63d863a21e03, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000800ea89390, %r1, %r12
	setx	0x19518400c6814c2f, %r1, %r13
	stx	%r13, [%r12]
	ldx	[%r9], %r11
	setx	0x94cca49be6635ebe, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
	setx	0x000000f68b41c200, %r1, %r9
	setx	0xb0924b6607fa2057, %r1, %r10
	stx	%r10, [%r9]
	ldx	[%r9], %r11
	setx	0xb0924b6607fa2057, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
	setx	0x000000f2ba7e7370, %r1, %r9
	setx	0x134b868e84e2333d, %r1, %r10
	stx	%r10, [%r9]
	ldx	[%r9], %r11
	setx	0x134b868e84e2333d, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
	setx	0x000000fcfd539a60, %r1, %r9
	setx	0x68baa3a4b9411a37, %r1, %r10
	stx	%r10, [%r9]
	ldx	[%r9], %r11
	setx	0x68baa3a4b9411a37, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
	setx	0x000000d2827e4ff0, %r1, %r9
	setx	0xfaae9cb0c34cb664, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000fc75a364d8, %r1, %r12
	setx	0xe316c15393913316, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000c63bf52a48, %r1, %r12
	setx	0x548a63d863a21e03, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000fc75a364d8, %r1, %r12
	setx	0xe316c15393913316, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000ed803ecd18, %r1, %r12
	setx	0x0012e51698cbe5e2, %r1, %r13
	stx	%r13, [%r12]
	ldx	[%r9], %r11
	setx	0xfaae9cb0c34cb664, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
	setx	0x000000c7b65a87f8, %r1, %r9
	setx	0xb23c3c5be51a7cf2, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800e1c3260, %r1, %r12
	setx	0x19518400c6814c2f, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000e158d727f8, %r1, %r12
	setx	0xf68d1283878db30a, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000d5ff5f3c10, %r1, %r12
	setx	0x8cbd979227b68543, %r1, %r13
	stx	%r13, [%r12]
	ldx	[%r9], %r11
	setx	0xb23c3c5be51a7cf2, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
	setx	0x000000cffd53b900, %r1, %r9
	setx	0x410de23f7dc48ea2, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800e674f50, %r1, %r12
	setx	0x19518400c6814c2f, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000e625994ca8, %r1, %r12
	setx	0xb8921f0e2e58ff1b, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000fe38635e18, %r1, %r12
	setx	0xe316c15393913316, %r1, %r13
	stx	%r13, [%r12]
	ldx	[%r9], %r11
	setx	0x410de23f7dc48ea2, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
	setx	0x000000800e68d8f0, %r1, %r9
	setx	0xdfb079b799cbd991, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f5a2260, %r1, %r12
	setx	0x3ef2a709db078fb7, %r1, %r13
	stx	%r13, [%r12]
	ldx	[%r9], %r11
	setx	0xdfb079b799cbd991, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
	setx	0x000000c6c5df1410, %r1, %r9
	setx	0x56a585b6b80516cd, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000dd885879b0, %r1, %r12
	setx	0x8cbd979227b68543, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000dd885879b0, %r1, %r12
	setx	0x8cbd979227b68543, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000dd885879b0, %r1, %r12
	setx	0x8cbd979227b68543, %r1, %r13
	stx	%r13, [%r12]
	ldx	[%r9], %r11
	setx	0x56a585b6b80516cd, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
	setx	0x000000cf8da77f10, %r1, %r9
	setx	0x4a40b561c5987379, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000dd6805aaa8, %r1, %r12
	setx	0x8cbd979227b68543, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000800ff706c8, %r1, %r12
	setx	0x3ef2a709db078fb7, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000800ff706c8, %r1, %r12
	setx	0x3ef2a709db078fb7, %r1, %r13
	stx	%r13, [%r12]
	ldx	[%r9], %r11
	setx	0x4a40b561c5987379, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
	setx	0x000000800ebb61b8, %r1, %r9
	setx	0xed2f4ad459ccc3ea, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d5a5fed630, %r1, %r12
	setx	0x8cbd979227b68543, %r1, %r13
	stx	%r13, [%r12]
	ldx	[%r9], %r11
	setx	0xed2f4ad459ccc3ea, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
	setx	0x000000d74430fe68, %r1, %r9
	setx	0x36a3e749e1b57ced, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800e14eec0, %r1, %r12
	setx	0x19518400c6814c2f, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000eb439d3c78, %r1, %r12
	setx	0xb8921f0e2e58ff1b, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000eb439d3c78, %r1, %r12
	setx	0xb8921f0e2e58ff1b, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000eb439d3c78, %r1, %r12
	setx	0xf68d1283878db30a, %r1, %r13
	stx	%r13, [%r12]
	ldx	[%r9], %r11
	setx	0x36a3e749e1b57ced, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
	setx	0x000000800f4f1a08, %r1, %r9
	setx	0x74a5e5527c7c5951, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d508696bb8, %r1, %r12
	setx	0x8cbd979227b68543, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000f2db7083c0, %r1, %r12
	setx	0xe316c15393913316, %r1, %r13
	stx	%r13, [%r12]
	ldx	[%r9], %r11
	setx	0x74a5e5527c7c5951, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
	setx	0x000000ce47339a18, %r1, %r9
	setx	0xb06fe4b245cbad60, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800e1ba270, %r1, %r12
	setx	0x19518400c6814c2f, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000f68b6af058, %r1, %r12
	setx	0xe316c15393913316, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000800f6c1a50, %r1, %r12
	setx	0x3ef2a709db078fb7, %r1, %r13
	stx	%r13, [%r12]
	ldx	[%r9], %r11
	setx	0xb06fe4b245cbad60, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
	setx	0x000000f21930ac58, %r1, %r9
	setx	0x624271f84aa427a6, %r1, %r10
	stx	%r10, [%r9]
	ldx	[%r9], %r11
	setx	0x624271f84aa427a6, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop


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
!!#   uint64 DATA_ARRAY[12000];
!!#   uint64 data_st = 0;
!!#   uint64 noise_data_st = 0;
!!#   uint64 data_ld = 0;
!!#   int wr_cntr = 0;
!!#   int rd_cntr = 0;
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
!!#   IJ_set_rvar ("diag.j", 74, rv_0, "{11}");
!!# 
!!#   IJ_set_rvar ("diag.j", 77, Rv_rand64, "64'hrrrr rrrr rrrr rrrr");
!!#   IJ_set_rvar ("diag.j", 78, Rv_Simm13, "13'b0 0000 00rr r000");
!!#   IJ_set_rvar ("diag.j", 79, Rv_addr_sel, "3'brrr");
!!# 
!!#   IJ_set_rvar ("diag.j", 83, Rv_memaddr_pattern_dma,
!!#         "24'{0},"
!!# 
!!#         "20'b 000r rrrr rrrr rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rr00 0000,");
!!# 
!!#   ! only 60* or 61*
!!#   IJ_set_rvar ("diag.j", 92, Rv_memaddr_pattern_io,
!!#         "4'{0},"
!!# 
!!#         "20'b 0000 0000 0000 0000 0110,"
!!#         "20'b 000r rrrr rrrr rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rr00 0000,");
!!# 
!!#   IJ_set_rvar ("diag.j", 101, Rv_rand32, "32'hrrrr rrrr");
!!#   IJ_set_rvar ("diag.j", 102, Rv_rand_mask, "32'h0000 rrrr");
!!# 
!!#   ! Define address patterns for all the various address
!!#   ! spaces in JBI
!!# 
!!#   ! 80_1000_0000 - 80_FFFF_FFFF (Should not be 80_0*)
!!#   IJ_set_rvar ("diag.j", 108, Rv_jbiaddr_pattern0,
!!#         "24'{0},"
!!# 
!!#         "20'b 1000 rrr1 rrrr rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr r000,");
!!# 
!!#   ! 80_0E00_0000 - 80_0EFF_FFFF
!!#   IJ_set_rvar ("diag.j", 117, Rv_jbiaddr_pattern1,
!!#         "24'{0},"
!!# 
!!#         "20'b 1000 0000 0000 1110 rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr r000,");
!!# 
!!#   ! 80_0F00_0000 - 80_0FFF_FFFF
!!#   IJ_set_rvar ("diag.j", 127, Rv_jbiaddr_pattern2,
!!#         "24'{0},"
!!# 
!!#         "20'b 1000 0000 0000 1111 rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr r000,");
!!# 
!!#   ! C0_0000_0000 - CF_FFFF_FFFF
!!#   IJ_set_rvar ("diag.j", 137, Rv_jbiaddr_pattern3,
!!#         "24'{0},"
!!# 
!!#         "20'b 1100 rrrr rrrr rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr r000,");
!!# 
!!#   ! D0_0000_0000 - DF_FFFF_FFFF
!!#   IJ_set_rvar ("diag.j", 147, Rv_jbiaddr_pattern4,
!!#         "24'{0},"
!!# 
!!#         "20'b 1101 rrrr rrrr rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr r000,");
!!# 
!!#   ! E0_0000_0000 - EF_FFFF_FFFF
!!#   IJ_set_rvar ("diag.j", 157, Rv_jbiaddr_pattern5,
!!#         "24'{0},"
!!# 
!!#         "20'b 1110 rrrr rrrr rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr r000,");
!!# 
!!#   ! F0_0000_0000 - FE_FFFF_FFFF ( Should not be FF*)
!!#   IJ_set_rvar ("diag.j", 167, Rv_jbiaddr_pattern6,
!!#         "24'{0},"
!!# 
!!#         "20'b 1111 rrr0 rrrr rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr r000,");
!!# 
!!#   ! FF_F000_0000 - FF_FFFF_FFFF 
!!#   IJ_set_rvar ("diag.j", 177, Rv_ssiaddr_pattern,
!!#         "24'{0},"
!!# 
!!#         "20'b 1111 1111 1111 rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr r000,");
!!# 
!!#   IJ_set_ropr_fld    ("diag.j", 185, ijdefault, Ft_Rs1, "{9}");  ! BASE
!!#   IJ_set_ropr_fld    ("diag.j", 186, ijdefault, Ft_Rs2, "{8}");
!!#   IJ_set_ropr_fld    ("diag.j", 187, ijdefault, Ft_Rd, "{16..23}");
!!# 
!!#   !IJ_set_ropr_fld    (ijdefault, Ft_Simm13, "13'b0 0000 0000 0000");
!!#   IJ_set_ropr_fld    ("diag.j", 190, ijdefault, Ft_Simm13, "13'b0 00rr 0000 0000");
!!# 
!!#   IJ_bind_file_group("diag.j", 194, sjm_4,"sjm_4.cmd", NULL);;
!!#   IJ_bind_file_group("diag.j", 195, sjm_5,"sjm_5.cmd", NULL);;
!!# 
!!#   IJ_bind_thread_group("diag.j", 198, th_M, 0x1);
!!# 
!!#   IJ_printf ("diag.j", 200, sjm_4, "CONFIG id=28 iosyncadr=0x7CF00BEEF00\n");
!!#   IJ_printf ("diag.j", 201, sjm_4, "TIMEOUT 10000000\n");
!!#   IJ_printf ("diag.j", 202, sjm_4, "IOSYNC\n");
!!# 
!!#   IJ_printf ("diag.j", 204, sjm_4, "#==================================================\n");
!!#   IJ_printf ("diag.j", 206, sjm_4, "#==================================================\n");
!!# 
!!#   IJ_printf ("diag.j", 208, sjm_5, "CONFIG id=30 iosyncadr=0x7EF00BEEF00\n");
!!#   IJ_printf ("diag.j", 209, sjm_5, "TIMEOUT 10000000\n");
!!#   IJ_printf ("diag.j", 210, sjm_5, "IOSYNC\n");
!!#   IJ_printf ("diag.j", 211, sjm_5, "#==================================================\n");
!!#   IJ_printf ("diag.j", 213, sjm_5, "#==================================================\n");
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
!!#   IJ_th_start ("diag.j", 231,Seq_Start, NULL, 2);
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
!!# 		IJ_generate ("diag.j", 359, th_M, $2);
!!# 	}
!!# ;
!!# 
!!# inst_type: set_reg9  |
!!#            sjm4      |
!!#            sjm5
!!# 
!!# {
!!#                 !IJ_generate (th_all, $2);
!!#                 !IJ_generate (th_all, $3);
!!#                 !IJ_generate (th_all, $4);
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
!!#                    IJ_printf ("diag.j", 386, sjm_4, "\n");
!!#                      sjm4_cnt++;
!!# 
!!#                      sj4_ad =  IJ_get_rvar_val64("diag.j", 389, Rv_memaddr_pattern_dma);
!!#                      sjm0_addr[sjm_wr0] = sj4_ad; 
!!#                      IJ_printf ("diag.j", 391, sjm_4, "WRITEBLK  0x%016llx +\n",sj4_ad);
!!#                      IJ_update_rvar("diag.j", 392, Rv_memaddr_pattern_dma);
!!# 
!!#                       for (i=0;i<16;i++) { 
!!#                          !IJ_printf (sjm_4, "# debug %d \n",i);
!!#                          sjm0_data[sjm_wr0][i] = IJ_get_rvar_val32("diag.j", 396, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 397, Rv_rand32);
!!#                          if (i%4 == 0) {IJ_printf ("diag.j", 398, sjm_4, "        "); }
!!#                          IJ_printf ("diag.j", 399, sjm_4, "0x%08x ",sjm0_data[sjm_wr0][i]);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 401, sjm_4, "\n"); else 
!!#                             IJ_printf ("diag.j", 402, sjm_4, "+\n");
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
!!#                    IJ_printf ("diag.j", 415, sjm_4, "\n");
!!#                      sjm4_cnt--;
!!# 
!!#                      sj4_ad = sjm0_addr[sjm_rd0];
!!#                      IJ_printf ("diag.j", 420, sjm_4, "READBLK  0x%016llx +\n",sj4_ad);
!!# 
!!#                       for (i=0;i<16;i++) { 
!!#                          sjm4_dat = sjm0_data[sjm_rd0][i];
!!#                          if (i%4 == 0) IJ_printf ("diag.j", 424, sjm_4, "        ");
!!#                          IJ_printf ("diag.j", 425, sjm_4, "0x%08x ",sjm4_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 427, sjm_4, "\n"); else 
!!#                             IJ_printf ("diag.j", 428, sjm_4, "+\n");
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
!!#                    IJ_printf ("diag.j", 442, sjm_4, "\n");
!!#                      !sjm4_cnt--;
!!# 
!!#  		     sjm0_w_mask =  IJ_get_rvar_val32("diag.j", 446, Rv_rand_mask);
!!#                      IJ_update_rvar("diag.j", 447, Rv_rand_mask);
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
!!#                      IJ_printf ("diag.j", 464, sjm_4, "WRITEMSK  0x%016llx 0x%016llx +\n",sj4_ad,mask);
!!# 
!!#                       m_tmp = sjm0_w_mask;
!!#                       for (i=0;i<16;i++) { 
!!#                        if (m_tmp & 0x1 ) {
!!#                          sjm0_data[sjm_rd0][i] = IJ_get_rvar_val32("diag.j", 469, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 470, Rv_rand32);
!!#                          sjm4_dat = sjm0_data[sjm_rd0][i];
!!#                          if (i%4 == 0) IJ_printf ("diag.j", 472, sjm_4, "        ");
!!#                          IJ_printf ("diag.j", 473, sjm_4, "0x%08x ",sjm4_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 475, sjm_4, "\n"); else 
!!#                             IJ_printf ("diag.j", 476, sjm_4, "+\n");
!!#                            }
!!#                         } else {
!!#                          !sjm4_dat = sjm0_data[sjm_rd0][i];
!!#                          sjm4_dat = 0;
!!#                          if (i%4 == 0) IJ_printf ("diag.j", 481, sjm_4, "        ");
!!#                          IJ_printf ("diag.j", 482, sjm_4, "0x%08x ",sjm4_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 484, sjm_4, "\n"); else 
!!#                             IJ_printf ("diag.j", 485, sjm_4, "+\n");
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
!!#                    IJ_printf ("diag.j", 502, sjm_4, "\n");
!!#                      sjm4_cnt_io++;
!!# 
!!#                      sj4_ad =  IJ_get_rvar_val64("diag.j", 505, Rv_memaddr_pattern_io);
!!#                      sjm0_addr_io[sjm_wr0_io] = sj4_ad; 
!!#                      IJ_printf ("diag.j", 507, sjm_4, "WRITEBLKIO  0x%016llx +\n",sj4_ad);
!!#                      IJ_update_rvar("diag.j", 508, Rv_memaddr_pattern_io);
!!# 
!!#                       for (i=0;i<16;i++) { 
!!#                          !IJ_printf (sjm_4, "# debug %d \n",i);
!!#                          sjm0_data_io[sjm_wr0_io][i] = IJ_get_rvar_val32("diag.j", 512, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 513, Rv_rand32);
!!#                          if (i%4 == 0) {IJ_printf ("diag.j", 514, sjm_4, "        "); }
!!#                          IJ_printf ("diag.j", 515, sjm_4, "0x%08x ",sjm0_data_io[sjm_wr0_io][i]);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 517, sjm_4, "\n"); else 
!!#                             IJ_printf ("diag.j", 518, sjm_4, "+\n");
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
!!#                    IJ_printf ("diag.j", 531, sjm_4, "\n");
!!#                      sjm4_cnt_io--;
!!# 
!!#                      sj4_ad = sjm0_addr_io[sjm_rd0_io];
!!#                      IJ_printf ("diag.j", 536, sjm_4, "READBLKIO  0x%016llx +\n",sj4_ad);
!!# 
!!#                       for (i=0;i<16;i++) { 
!!#                          sjm4_dat = sjm0_data_io[sjm_rd0_io][i];
!!#                          if (i%4 == 0) IJ_printf ("diag.j", 540, sjm_4, "        ");
!!#                          IJ_printf ("diag.j", 541, sjm_4, "0x%08x ",sjm4_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 543, sjm_4, "\n"); else 
!!#                             IJ_printf ("diag.j", 544, sjm_4, "+\n");
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
!!#                    IJ_printf ("diag.j", 559, sjm_4, "\n");
!!#                      sjm4_cnt_io1++;
!!# 
!!#                      sj4_ad =  IJ_get_rvar_val64("diag.j", 562, Rv_memaddr_pattern_io);
!!#                      sjm0_addr_io1[sjm_wr0_io1] = sj4_ad; 
!!#                      IJ_printf ("diag.j", 564, sjm_4, "WRITEIO  0x%016llx ",sj4_ad);
!!#                      IJ_update_rvar("diag.j", 565, Rv_memaddr_pattern_io);
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
!!#                       IJ_printf ("diag.j", 580, sjm_4, "%d ",b_sz);
!!#                       for (i=0;i<4;i++) { 
!!#                          !IJ_printf (sjm_4, "# debug %d \n",i);
!!#                          sjm0_data_io1[sjm_wr0_io1][i] = IJ_get_rvar_val32("diag.j", 583, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 584, Rv_rand32);
!!#                          IJ_printf ("diag.j", 585, sjm_4, "0x%08x ",sjm0_data_io1[sjm_wr0_io1][i]);
!!#                          if((i==0) && ((b_sz == 1) | (b_sz == 2) | (b_sz == 4)) ) break; 
!!#                          if((i==1) && (b_sz == 8)) break; 
!!#                       }
!!#                       if ( random()%2 == 0) {
!!#                       IJ_printf ("diag.j", 590, sjm_4, "\n");
!!#                       } else {
!!#                       IJ_printf ("diag.j", 592, sjm_4, "\n");
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
!!#                    IJ_printf ("diag.j", 606, sjm_4, "\n");
!!#                      sjm4_cnt_io1--;
!!# 
!!#                      sj4_ad = sjm0_addr_io1[sjm_rd0_io1];
!!#                      b_sz   = sjm0_data_io1[sjm_rd0_io1][15];
!!#                      IJ_printf ("diag.j", 612, sjm_4, "READIO  0x%016llx %d ",sj4_ad,b_sz);
!!# 
!!#                       for (i=0;i<4;i++) {
!!#                          sjm4_dat = sjm0_data_io1[sjm_rd0_io1][i];
!!#                          IJ_printf ("diag.j", 616, sjm_4, "0x%08x ",sjm4_dat);
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
!!#                    IJ_printf ("diag.j", 631, sjm_4, "\n");
!!# 
!!#                      sj4_ad =  IJ_get_rvar_val64("diag.j", 633, Rv_memaddr_pattern_io);
!!#                      sjm0_addr_m_io[sjm_wr0_m_io] = sj4_ad; 
!!#                      IJ_update_rvar("diag.j", 635, Rv_memaddr_pattern_io);
!!# 
!!#                      sjm4_cnt_m_io++;
!!# 
!!#  		     sjm0_w_mask_m_io =  IJ_get_rvar_val32("diag.j", 641, Rv_rand_mask);
!!#                      IJ_update_rvar("diag.j", 642, Rv_rand_mask);
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
!!#                      IJ_printf ("diag.j", 669, sjm_4, "WRITEMSKIO  0x%016llx 0x%04x  ",sj4_ad,mask);
!!#                      sjm0_data_m_io[sjm_wr0_m_io][15] = mask; ! data fifo , 15 stores address
!!# 
!!#                       m_tmp = sjm0_w_mask_m_io & 0xf;
!!#                       for (i=0;i<4;i++) { 
!!#                        if (m_tmp & 0x1 ) {
!!#                          sjm0_data_m_io[sjm_wr0_m_io][i] = IJ_get_rvar_val32("diag.j", 675, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 676, Rv_rand32);
!!#                          sjm4_dat = sjm0_data_m_io[sjm_wr0_m_io][i];
!!#                          !if (i%4 == 0) IJ_printf (sjm_4, "        ");
!!#                          IJ_printf ("diag.j", 679, sjm_4, "0x%08x ",sjm4_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                              IJ_printf ("diag.j", 681, sjm_4, "\n"); 
!!#                             !if (i==15 ) IJ_printf (sjm_4, "\n"); else 
!!#                             !IJ_printf (sjm_4, "+\n");
!!#                            }
!!#                         } else {
!!#                          !sjm4_dat = sjm0_data[sjm_rd0][i];
!!#                          sjm4_dat = 0;
!!#                          sjm0_data_m_io[sjm_wr0_m_io][i] = sjm4_dat;
!!#                          !if (i%4 == 0) IJ_printf (sjm_4, "        ");
!!#                          IJ_printf ("diag.j", 690, sjm_4, "0x%08x ",sjm4_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             IJ_printf ("diag.j", 692, sjm_4, "\n"); 
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
!!#                    IJ_printf ("diag.j", 710, sjm_4, "\n");
!!#                      sjm4_cnt_m_io--;
!!# 
!!#                      sj4_ad = sjm0_addr_m_io[sjm_rd0_m_io];
!!#                      mask   = sjm0_data_m_io[sjm_rd0_m_io][15];
!!#                      IJ_printf ("diag.j", 716, sjm_4, "READMSKIO   0x%016llx 0x%04llx  ",sj4_ad,mask);
!!# 
!!#                       for (i=0;i<4;i++) { 
!!#                          sjm4_dat = sjm0_data_m_io[sjm_rd0_m_io][i];
!!#                          !if (i%4 == 0) IJ_printf (sjm_4, "        ");
!!#                          IJ_printf ("diag.j", 721, sjm_4, "0x%08x ",sjm4_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             IJ_printf ("diag.j", 723, sjm_4, "\n");
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
!!#                    IJ_printf ("diag.j", 741, sjm_5, "\n");
!!#                      sjm5_cnt++;
!!# 
!!#                      sj5_ad =  IJ_get_rvar_val64("diag.j", 744, Rv_memaddr_pattern_dma);
!!#                      sjm1_addr[sjm_wr1] = sj5_ad; 
!!#                      IJ_printf ("diag.j", 746, sjm_5, "WRITEBLK  0x%016llx +\n",sj5_ad);
!!#                      IJ_update_rvar("diag.j", 747, Rv_memaddr_pattern_dma);
!!# 
!!#                       for (i=0;i<16;i++) { 
!!#                          sjm1_data[sjm_wr1][i] = IJ_get_rvar_val32("diag.j", 750, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 751, Rv_rand32);
!!#                          if (i%4 == 0) IJ_printf ("diag.j", 752, sjm_5, "        ");
!!#                          IJ_printf ("diag.j", 753, sjm_5, "0x%08x ",sjm1_data[sjm_wr1][i]);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 755, sjm_5, "\n"); else 
!!#                             IJ_printf ("diag.j", 756, sjm_5, "+\n");
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
!!#                    IJ_printf ("diag.j", 769, sjm_5, "\n");
!!#                      sjm5_cnt--;
!!# 
!!#                      sj5_ad = sjm1_addr[sjm_rd1];
!!#                      IJ_printf ("diag.j", 774, sjm_5, "READBLK  0x%016llx +\n",sj5_ad);
!!# 
!!#                       for (i=0;i<16;i++) { 
!!#                          sjm5_dat = sjm1_data[sjm_rd1][i];
!!#                          if (i%4 == 0) IJ_printf ("diag.j", 778, sjm_5, "        ");
!!#                          IJ_printf ("diag.j", 779, sjm_5, "0x%08x ",sjm5_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 781, sjm_5, "\n"); else 
!!#                             IJ_printf ("diag.j", 782, sjm_5, "+\n");
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
!!#                    IJ_printf ("diag.j", 796, sjm_5, "\n");
!!#                      !sjm4_cnt--;
!!# 
!!#  		     sjm1_w_mask =  IJ_get_rvar_val32("diag.j", 800, Rv_rand_mask);
!!#                      IJ_update_rvar("diag.j", 801, Rv_rand_mask);
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
!!#                      IJ_printf ("diag.j", 818, sjm_5, "WRITEMSK  0x%016llx 0x%016llx +\n",sj5_ad,mask);
!!# 
!!#                       m_tmp = sjm1_w_mask;
!!#                       for (i=0;i<16;i++) { 
!!#                        if (m_tmp & 0x1 ) {
!!#                          sjm1_data[sjm_rd1][i] = IJ_get_rvar_val32("diag.j", 823, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 824, Rv_rand32);
!!#                          sjm5_dat = sjm1_data[sjm_rd1][i];
!!#                          if (i%4 == 0) IJ_printf ("diag.j", 826, sjm_5, "        ");
!!#                          IJ_printf ("diag.j", 827, sjm_5, "0x%08x ",sjm5_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 829, sjm_5, "\n"); else 
!!#                             IJ_printf ("diag.j", 830, sjm_5, "+\n");
!!#                            }
!!#                         } else {
!!#                          !sjm5_dat = sjm1_data[sjm_rd1][i];
!!#                          sjm5_dat = 0;
!!#                          if (i%4 == 0) IJ_printf ("diag.j", 835, sjm_5, "        ");
!!#                          IJ_printf ("diag.j", 836, sjm_5, "0x%08x ",sjm5_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 838, sjm_5, "\n"); else 
!!#                             IJ_printf ("diag.j", 839, sjm_5, "+\n");
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
!!#                    IJ_printf ("diag.j", 856, sjm_5, "\n");
!!#                      sjm5_cnt_io++;
!!# 
!!#                      sj5_ad =  IJ_get_rvar_val64("diag.j", 859, Rv_memaddr_pattern_io);
!!#                      sjm1_addr_io[sjm_wr1_io] = sj5_ad; 
!!#                      IJ_printf ("diag.j", 861, sjm_5, "WRITEBLKIO  0x%016llx +\n",sj5_ad);
!!#                      IJ_update_rvar("diag.j", 862, Rv_memaddr_pattern_io);
!!# 
!!#                       for (i=0;i<16;i++) { 
!!#                          !IJ_printf (sjm_5, "# debug %d \n",i);
!!#                          sjm1_data_io[sjm_wr1_io][i] = IJ_get_rvar_val32("diag.j", 866, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 867, Rv_rand32);
!!#                          if (i%4 == 0) {IJ_printf ("diag.j", 868, sjm_5, "        "); }
!!#                          IJ_printf ("diag.j", 869, sjm_5, "0x%08x ",sjm1_data_io[sjm_wr1_io][i]);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 871, sjm_5, "\n"); else 
!!#                             IJ_printf ("diag.j", 872, sjm_5, "+\n");
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
!!#                    IJ_printf ("diag.j", 885, sjm_5, "\n");
!!#                      sjm5_cnt_io--;
!!# 
!!#                      sj5_ad = sjm1_addr_io[sjm_rd1_io];
!!#                      IJ_printf ("diag.j", 890, sjm_5, "READBLKIO  0x%016llx +\n",sj5_ad);
!!# 
!!#                       for (i=0;i<16;i++) { 
!!#                          sjm5_dat = sjm1_data_io[sjm_rd1_io][i];
!!#                          if (i%4 == 0) IJ_printf ("diag.j", 894, sjm_5, "        ");
!!#                          IJ_printf ("diag.j", 895, sjm_5, "0x%08x ",sjm5_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 897, sjm_5, "\n"); else 
!!#                             IJ_printf ("diag.j", 898, sjm_5, "+\n");
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
!!#                    IJ_printf ("diag.j", 914, sjm_5, "\n");
!!#                      sjm5_cnt_io1++;
!!# 
!!#                      sj5_ad =  IJ_get_rvar_val64("diag.j", 917, Rv_memaddr_pattern_io);
!!#                      sjm1_addr_io1[sjm_wr1_io1] = sj5_ad; 
!!#                      IJ_printf ("diag.j", 919, sjm_5, "WRITEIO  0x%016llx ",sj5_ad);
!!#                      IJ_update_rvar("diag.j", 920, Rv_memaddr_pattern_io);
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
!!#                       IJ_printf ("diag.j", 935, sjm_5, "%d ",b_sz);
!!#                       for (i=0;i<4;i++) { 
!!#                          !IJ_printf (sjm_5, "# debug %d \n",i);
!!#                          sjm1_data_io1[sjm_wr1_io1][i] = IJ_get_rvar_val32("diag.j", 938, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 939, Rv_rand32);
!!#                          IJ_printf ("diag.j", 940, sjm_5, "0x%08x ",sjm1_data_io1[sjm_wr1_io1][i]);
!!#                          if((i==0) && ((b_sz == 1) | (b_sz == 2) | (b_sz == 4)) ) break; 
!!#                          if((i==1) && (b_sz == 8)) break; 
!!#                       }
!!#                       if ( random()%2 == 0) {
!!#                       IJ_printf ("diag.j", 945, sjm_5, "\n");
!!#                       } else {
!!#                       IJ_printf ("diag.j", 947, sjm_5, "\n");
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
!!#                    IJ_printf ("diag.j", 961, sjm_5, "\n");
!!#                      sjm5_cnt_io1--;
!!# 
!!#                      sj5_ad = sjm1_addr_io1[sjm_rd1_io1];
!!#                      b_sz   = sjm1_data_io1[sjm_rd1_io1][15];
!!#                      IJ_printf ("diag.j", 967, sjm_5, "READIO  0x%016llx %d ",sj5_ad,b_sz);
!!# 
!!#                       for (i=0;i<4;i++) {
!!#                          sjm5_dat = sjm1_data_io1[sjm_rd1_io1][i];
!!#                          IJ_printf ("diag.j", 971, sjm_5, "0x%08x ",sjm5_dat);
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
!!#                    IJ_printf ("diag.j", 987, sjm_5, "\n");
!!# 
!!#                      sj5_ad =  IJ_get_rvar_val64("diag.j", 989, Rv_memaddr_pattern_io);
!!#                      sjm1_addr_m_io[sjm_wr1_m_io] = sj5_ad; 
!!#                      IJ_update_rvar("diag.j", 991, Rv_memaddr_pattern_io);
!!# 
!!#                      sjm5_cnt_m_io++;
!!# 
!!#  		     sjm1_w_mask_m_io =  IJ_get_rvar_val32("diag.j", 997, Rv_rand_mask);
!!#                      IJ_update_rvar("diag.j", 998, Rv_rand_mask);
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
!!#                      IJ_printf ("diag.j", 1025, sjm_5, "WRITEMSKIO  0x%016llx 0x%04x  ",sj5_ad,mask);
!!#                      sjm1_data_m_io[sjm_wr1_m_io][15] = mask; ! data fifo , 15 stores address
!!# 
!!#                       m_tmp = sjm1_w_mask_m_io & 0xf;
!!#                       for (i=0;i<4;i++) { 
!!#                        if (m_tmp & 0x1 ) {
!!#                          sjm1_data_m_io[sjm_wr1_m_io][i] = IJ_get_rvar_val32("diag.j", 1031, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 1032, Rv_rand32);
!!#                          sjm5_dat = sjm1_data_m_io[sjm_wr1_m_io][i];
!!#                          !if (i%4 == 0) IJ_printf (sjm_5, "        ");
!!#                          IJ_printf ("diag.j", 1035, sjm_5, "0x%08x ",sjm5_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                              IJ_printf ("diag.j", 1037, sjm_5, "\n"); 
!!#                             !if (i==15 ) IJ_printf (sjm_5, "\n"); else 
!!#                             !IJ_printf (sjm_5, "+\n");
!!#                            }
!!#                         } else {
!!#                          !sjm5_dat = sjm1_data[sjm_rd1][i];
!!#                          sjm5_dat = 0;
!!#                          sjm1_data_m_io[sjm_wr1_m_io][i] = sjm5_dat;
!!#                          !if (i%4 == 0) IJ_printf (sjm_5, "        ");
!!#                          IJ_printf ("diag.j", 1046, sjm_5, "0x%08x ",sjm5_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             IJ_printf ("diag.j", 1048, sjm_5, "\n"); 
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
!!#                    IJ_printf ("diag.j", 1066, sjm_5, "\n");
!!#                      sjm5_cnt_m_io--;
!!# 
!!#                      sj5_ad = sjm1_addr_m_io[sjm_rd1_m_io];
!!#                      mask   = sjm1_data_m_io[sjm_rd1_m_io][15];
!!#                      IJ_printf ("diag.j", 1072, sjm_5, "READMSKIO   0x%016llx 0x%04llx  ",sj5_ad,mask);
!!# 
!!#                       for (i=0;i<4;i++) { 
!!#                          sjm5_dat = sjm1_data_m_io[sjm_rd1_m_io][i];
!!#                          !if (i%4 == 0) IJ_printf (sjm_5, "        ");
!!#                          IJ_printf ("diag.j", 1077, sjm_5, "0x%08x ",sjm5_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             IJ_printf ("diag.j", 1079, sjm_5, "\n");
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
!!#                         jbi1 = IJ_get_rvar_val64("diag.j", 1099, Rv_jbiaddr_pattern1);
!!#                         jbi2 = IJ_get_rvar_val64("diag.j", 1100, Rv_jbiaddr_pattern2);
!!#                         jbi3 = IJ_get_rvar_val64("diag.j", 1101, Rv_jbiaddr_pattern3);
!!#                         jbi4 = IJ_get_rvar_val64("diag.j", 1102, Rv_jbiaddr_pattern4);
!!#                         jbi5 = IJ_get_rvar_val64("diag.j", 1103, Rv_jbiaddr_pattern5);
!!#                         jbi6 = IJ_get_rvar_val64("diag.j", 1104, Rv_jbiaddr_pattern6);
!!# 			IJ_update_rvar("diag.j", 1105, Rv_jbiaddr_pattern1);
!!# 			IJ_update_rvar("diag.j", 1106, Rv_jbiaddr_pattern2);
!!# 			IJ_update_rvar("diag.j", 1107, Rv_jbiaddr_pattern3);
!!# 			IJ_update_rvar("diag.j", 1108, Rv_jbiaddr_pattern4);
!!# 			IJ_update_rvar("diag.j", 1109, Rv_jbiaddr_pattern5);
!!# 			IJ_update_rvar("diag.j", 1110, Rv_jbiaddr_pattern6);
!!# 
!!#                         addr_sel = random() % 5;
!!# 			IJ_update_rvar("diag.j", 1113, Rv_addr_sel);
!!# 	                !printf ("!DEBUG: %d, jbi1 = 0x%016llx, jbi2 = 0x%016llx, jbi3 = 0x%016llx, jbi4 = 0x%016llx, jbi5 = 0x%016llx, jbi6 = 0x%016llx \n", addr_sel, jbi1, jbi2,jbi3,jbi4,jbi5,jbi6); 
!!#                         store_addr = addr_sel;
!!# 
!!#                         switch (addr_sel) {
!!#                         case 1 : jbi_addr = jbi1; break;
!!#                         case 2 : jbi_addr = jbi2; break;
!!#                         case 3 : jbi_addr = jbi3; break;
!!#                         case 4 : jbi_addr = jbi4; break;
!!#                         case 5 : jbi_addr = jbi5; break;
!!#                         case 0 : jbi_addr = jbi6; break;
!!#                         default : jbi_addr = jbi5; break;
!!#                         }
!!# 	                !printf ("!DEBUG 2: jbi_addr =  0x%016llx,d\n", jbi_addr); 
!!# 
!!#                         IJ_printf ("diag.j", 1128, th_M, "\tsetx\t0x%016llx, %%r1, %%r9\n",
!!#                                 jbi_addr);
!!#                         !IJ_printf (th_M, "\tsetx\t0x%016llrx, %%r1, %%r9\n",
!!#                         !        Rv_jbiaddr_pattern1);
!!#                         ! data
!!# 	                ! printf ("!DEBUG: %d\n", wr_cntr); fflush(stdout);
!!# 
!!#                         DATA_ARRAY[wr_cntr] = IJ_get_rvar_val64("diag.j", 1135, Rv_rand64);
!!# 	                !IJ_printf (th_M, "!DEBUG: wr_cntr = %d,  %016llx\n",  wr_cntr , DATA_ARRAY[wr_cntr]);
!!# 			IJ_update_rvar("diag.j", 1137, Rv_rand64);
!!#                         data_st = DATA_ARRAY[wr_cntr];
!!#                         IJ_printf ("diag.j", 1139, th_M, "\tsetx\t0x%016llx, %%r1, %%r10\n",
!!#                                 data_st);
!!#                         IJ_printf ("diag.j", 1141, th_M, "\tstx\t%%r10, [%%r9]\n");
!!# 
!!#                         wr_cntr++;
!!# 
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
!!#                         IJ_printf ("diag.j", 1166, th_M, "\tsetx\t0x%016llx, %%r1, %%r12\n",
!!#                                 jbi_addr);
!!#                         noise_data_st = DATA_ARRAY[addr_sel];
!!#                         IJ_printf ("diag.j", 1169, th_M, "\tsetx\t0x%016llx, %%r1, %%r13\n",
!!#                                 noise_data_st);
!!#                         IJ_printf ("diag.j", 1171, th_M, "\tstx\t%%r13, [%%r12]\n");
!!#                         rnd_cnt--;
!!#                         addr_sel = IJ_get_rvar_val64("diag.j", 1173, Rv_addr_sel);
!!# 			IJ_update_rvar("diag.j", 1174, Rv_addr_sel);
!!#                         }
!!# 
!!#                         data_ld = DATA_ARRAY[rd_cntr];
!!#                         rd_cntr++;
!!#                         IJ_printf ("diag.j", 1181, th_M, "\tldx\t[%%r9], %%r11\n");
!!#                         IJ_printf ("diag.j", 1182, th_M, "\tsetx\t0x%016llx, %%r1, %%r10\n",
!!#                                 data_ld);
!!#                         IJ_printf ("diag.j", 1184, th_M, "\tcmp\t%%r10, %%r11\n");
!!#                         IJ_printf ("diag.j", 1185, th_M, "\tbne h_bad_end\n");
!!#                         IJ_printf ("diag.j", 1186, th_M, "\tnop\n");
!!# 
!!#                         !i=0;
!!#                         !IJ_printf (th_M, "!\tdata_array %d = 0x%016llx , rd_cntr = %d, wr_cntr = %d\n", i,DATA_ARRAY[i],rd_cntr, wr_cntr);
!!#                         !i=1;
!!#                         !IJ_printf (th_M, "!\tdata_array %d = 0x%016llx , rd_cntr = %d, wr_cntr = %d\n", i,DATA_ARRAY[i],rd_cntr, wr_cntr);
!!#                         !i=2;
!!#                         !IJ_printf (th_M, "!\tdata_array %d = 0x%016llx , rd_cntr = %d, wr_cntr = %d\n", i,DATA_ARRAY[i],rd_cntr, wr_cntr);
!!#                         !i=3;
!!#                         !IJ_printf (th_M, "!\tdata_array %d = 0x%016llx , rd_cntr = %d, wr_cntr = %d\n", i,DATA_ARRAY[i],rd_cntr, wr_cntr);
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
