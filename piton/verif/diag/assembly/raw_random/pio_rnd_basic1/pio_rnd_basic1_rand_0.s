// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: pio_rnd_basic1_rand_0.s
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
   random seed:	137168242
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

	setx	0x000000c5d74ce460, %r1, %r9
	setx	0xf32a29a3cf613340, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f8b1cfb760, %r1, %r12
	setx	0xf32a29a3cf613340, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000800f47b9b8, %r1, %r12
	setx	0x0000000000000000, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000800f47b9b8, %r1, %r12
	setx	0x0000000000000000, %r1, %r13
	stx	%r13, [%r12]
	ldx	[%r9], %r11
	setx	0xf32a29a3cf613340, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
	setx	0x000000c71acdaf70, %r1, %r9
	setx	0x865db20420e553c8, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800ff7d650, %r1, %r12
	setx	0x0000000000000000, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000eaa9dbf250, %r1, %r12
	setx	0x0000000000000000, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000eaa9dbf250, %r1, %r12
	setx	0x0000000000000000, %r1, %r13
	stx	%r13, [%r12]
	ldx	[%r9], %r11
	setx	0x865db20420e553c8, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
	setx	0x000000f0f1022c10, %r1, %r9
	setx	0x403a3ac8d5ec88bb, %r1, %r10
	stx	%r10, [%r9]
	ldx	[%r9], %r11
	setx	0x403a3ac8d5ec88bb, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
	setx	0x000000c4a5ac7b18, %r1, %r9
	setx	0xccdc41bc78c81898, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f71fa30, %r1, %r12
	setx	0x403a3ac8d5ec88bb, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000800e2807e0, %r1, %r12
	setx	0x865db20420e553c8, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000fa825d28a0, %r1, %r12
	setx	0xf32a29a3cf613340, %r1, %r13
	stx	%r13, [%r12]
	ldx	[%r9], %r11
	setx	0xccdc41bc78c81898, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
	setx	0x000000df86ea05e8, %r1, %r9
	setx	0x24555c84a3497d7b, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ce36b32230, %r1, %r12
	setx	0xccdc41bc78c81898, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000fe8f2b6038, %r1, %r12
	setx	0xf32a29a3cf613340, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000800f6e98e8, %r1, %r12
	setx	0x403a3ac8d5ec88bb, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000e6cf79f988, %r1, %r12
	setx	0x0000000000000000, %r1, %r13
	stx	%r13, [%r12]
	ldx	[%r9], %r11
	setx	0x24555c84a3497d7b, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
	setx	0x000000800ee92fc0, %r1, %r9
	setx	0x041492c61700bdb0, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000faf3f174c8, %r1, %r12
	setx	0xf32a29a3cf613340, %r1, %r13
	stx	%r13, [%r12]
	ldx	[%r9], %r11
	setx	0x041492c61700bdb0, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
	setx	0x000000d6c097a4e0, %r1, %r9
	setx	0xd4a2749d116bf17e, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f8b4c50, %r1, %r12
	setx	0x403a3ac8d5ec88bb, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000e4e5cd4e70, %r1, %r12
	setx	0x041492c61700bdb0, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000e4e5cd4e70, %r1, %r12
	setx	0x0000000000000000, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000800ed25010, %r1, %r12
	setx	0x865db20420e553c8, %r1, %r13
	stx	%r13, [%r12]
	ldx	[%r9], %r11
	setx	0xd4a2749d116bf17e, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
	setx	0x000000800e8574a0, %r1, %r9
	setx	0x4aa42e936e0da7ad, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d714895b60, %r1, %r12
	setx	0x24555c84a3497d7b, %r1, %r13
	stx	%r13, [%r12]
	ldx	[%r9], %r11
	setx	0x4aa42e936e0da7ad, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
	setx	0x000000800e6ee3f0, %r1, %r9
	setx	0x820fed1d3a59e241, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000cd37f33d80, %r1, %r12
	setx	0xccdc41bc78c81898, %r1, %r13
	stx	%r13, [%r12]
	ldx	[%r9], %r11
	setx	0x820fed1d3a59e241, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
	setx	0x000000c699083820, %r1, %r9
	setx	0x0af8adf196aaf58e, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f8ebc30, %r1, %r12
	setx	0x403a3ac8d5ec88bb, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000ef838b6d68, %r1, %r12
	setx	0xd4a2749d116bf17e, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000d00f7bc800, %r1, %r12
	setx	0x24555c84a3497d7b, %r1, %r13
	stx	%r13, [%r12]
	ldx	[%r9], %r11
	setx	0x0af8adf196aaf58e, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
	setx	0x000000f8c6a04238, %r1, %r9
	setx	0xe70808e785cdb0ec, %r1, %r10
	stx	%r10, [%r9]
	ldx	[%r9], %r11
	setx	0xe70808e785cdb0ec, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
	setx	0x000000800ef98f68, %r1, %r9
	setx	0x32f8d035f6fab546, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f683048, %r1, %r12
	setx	0x403a3ac8d5ec88bb, %r1, %r13
	stx	%r13, [%r12]
	ldx	[%r9], %r11
	setx	0x32f8d035f6fab546, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
	setx	0x000000d3cbef0208, %r1, %r9
	setx	0xeb5656f1bfa62693, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000fe03d91e58, %r1, %r12
	setx	0xf32a29a3cf613340, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000800fddb430, %r1, %r12
	setx	0x403a3ac8d5ec88bb, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000800e638730, %r1, %r12
	setx	0x865db20420e553c8, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000ef208be880, %r1, %r12
	setx	0xd4a2749d116bf17e, %r1, %r13
	stx	%r13, [%r12]
	ldx	[%r9], %r11
	setx	0xeb5656f1bfa62693, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
	setx	0x000000c2671fedb8, %r1, %r9
	setx	0xfb35249b9720f541, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000fa760eb348, %r1, %r12
	setx	0xf32a29a3cf613340, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000e01a2ddad0, %r1, %r12
	setx	0x041492c61700bdb0, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000e01a2ddad0, %r1, %r12
	setx	0xd4a2749d116bf17e, %r1, %r13
	stx	%r13, [%r12]
	ldx	[%r9], %r11
	setx	0xfb35249b9720f541, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
	setx	0x000000d9dc5a95c8, %r1, %r9
	setx	0x151512a28df41466, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f0ed9ad6a0, %r1, %r12
	setx	0xf32a29a3cf613340, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000e6c9e03e08, %r1, %r12
	setx	0x4aa42e936e0da7ad, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000800ea92118, %r1, %r12
	setx	0x865db20420e553c8, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000e6c9e03e08, %r1, %r12
	setx	0xd4a2749d116bf17e, %r1, %r13
	stx	%r13, [%r12]
	ldx	[%r9], %r11
	setx	0x151512a28df41466, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
	setx	0x000000da93ba11a8, %r1, %r9
	setx	0x2fcbfcd0d1d064a2, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c2e4cfbd40, %r1, %r12
	setx	0xccdc41bc78c81898, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000f45e095450, %r1, %r12
	setx	0xf32a29a3cf613340, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000ee2a95b5d8, %r1, %r12
	setx	0x041492c61700bdb0, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000ee2a95b5d8, %r1, %r12
	setx	0x4aa42e936e0da7ad, %r1, %r13
	stx	%r13, [%r12]
	ldx	[%r9], %r11
	setx	0x2fcbfcd0d1d064a2, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
	setx	0x000000800e316a98, %r1, %r9
	setx	0xcf5efa5f9792f0b5, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c187abe318, %r1, %r12
	setx	0xccdc41bc78c81898, %r1, %r13
	stx	%r13, [%r12]
	ldx	[%r9], %r11
	setx	0xcf5efa5f9792f0b5, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
	setx	0x000000feaa789ac0, %r1, %r9
	setx	0xd62e437be23c48ab, %r1, %r10
	stx	%r10, [%r9]
	ldx	[%r9], %r11
	setx	0xd62e437be23c48ab, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
	setx	0x000000800efdfa40, %r1, %r9
	setx	0x07c0646dfdf8bfcd, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000dde61c06d0, %r1, %r12
	setx	0x24555c84a3497d7b, %r1, %r13
	stx	%r13, [%r12]
	ldx	[%r9], %r11
	setx	0x07c0646dfdf8bfcd, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
	setx	0x000000f009f0eed0, %r1, %r9
	setx	0x9478b10e179b7460, %r1, %r10
	stx	%r10, [%r9]
	ldx	[%r9], %r11
	setx	0x9478b10e179b7460, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
	setx	0x000000800e709638, %r1, %r9
	setx	0x5d416597e6bea905, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f117d60, %r1, %r12
	setx	0x403a3ac8d5ec88bb, %r1, %r13
	stx	%r13, [%r12]
	ldx	[%r9], %r11
	setx	0x5d416597e6bea905, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
	setx	0x000000800edaf2d0, %r1, %r9
	setx	0x5c08f087578bf164, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d510ed8e18, %r1, %r12
	setx	0x24555c84a3497d7b, %r1, %r13
	stx	%r13, [%r12]
	ldx	[%r9], %r11
	setx	0x5c08f087578bf164, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
	setx	0x000000cf540442c0, %r1, %r9
	setx	0xc443ac5e547791c3, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800fb72588, %r1, %r12
	setx	0x403a3ac8d5ec88bb, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000800e37c250, %r1, %r12
	setx	0x865db20420e553c8, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000800fb72588, %r1, %r12
	setx	0x403a3ac8d5ec88bb, %r1, %r13
	stx	%r13, [%r12]
	ldx	[%r9], %r11
	setx	0xc443ac5e547791c3, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
	setx	0x000000800e20c3d0, %r1, %r9
	setx	0xfc97cdc542820aa1, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d3c525f490, %r1, %r12
	setx	0x24555c84a3497d7b, %r1, %r13
	stx	%r13, [%r12]
	ldx	[%r9], %r11
	setx	0xfc97cdc542820aa1, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
	setx	0x000000f622a0de90, %r1, %r9
	setx	0xe3abc67282c27cc5, %r1, %r10
	stx	%r10, [%r9]
	ldx	[%r9], %r11
	setx	0xe3abc67282c27cc5, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
	setx	0x000000800fc20a18, %r1, %r9
	setx	0xc2465828eadeb20e, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f292108b20, %r1, %r12
	setx	0xf32a29a3cf613340, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000e50b342dd0, %r1, %r12
	setx	0x041492c61700bdb0, %r1, %r13
	stx	%r13, [%r12]
	ldx	[%r9], %r11
	setx	0xc2465828eadeb20e, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
	setx	0x000000800e910100, %r1, %r9
	setx	0xffcd388773203109, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800fb3b3f8, %r1, %r12
	setx	0x403a3ac8d5ec88bb, %r1, %r13
	stx	%r13, [%r12]
	ldx	[%r9], %r11
	setx	0xffcd388773203109, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
	setx	0x000000800eb8b848, %r1, %r9
	setx	0x2b43d512ef80be8e, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000fe90dc52c8, %r1, %r12
	setx	0xf32a29a3cf613340, %r1, %r13
	stx	%r13, [%r12]
	ldx	[%r9], %r11
	setx	0x2b43d512ef80be8e, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
	setx	0x000000dd863f50e8, %r1, %r9
	setx	0x467425fc2f32800a, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800e394310, %r1, %r12
	setx	0x865db20420e553c8, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000ea997489e8, %r1, %r12
	setx	0x4aa42e936e0da7ad, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000c7e57bdd30, %r1, %r12
	setx	0xccdc41bc78c81898, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000ea997489e8, %r1, %r12
	setx	0x041492c61700bdb0, %r1, %r13
	stx	%r13, [%r12]
	ldx	[%r9], %r11
	setx	0x467425fc2f32800a, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
	setx	0x000000800e96d000, %r1, %r9
	setx	0xbeafad04868f58ab, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800fd60ca0, %r1, %r12
	setx	0x403a3ac8d5ec88bb, %r1, %r13
	stx	%r13, [%r12]
	ldx	[%r9], %r11
	setx	0xbeafad04868f58ab, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
	setx	0x000000800fa05308, %r1, %r9
	setx	0x68d0284d12e38de4, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800ead3840, %r1, %r12
	setx	0x865db20420e553c8, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000dd916508d8, %r1, %r12
	setx	0x24555c84a3497d7b, %r1, %r13
	stx	%r13, [%r12]
	ldx	[%r9], %r11
	setx	0x68d0284d12e38de4, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
	setx	0x000000faa733e450, %r1, %r9
	setx	0x4e06a3de5bada2f8, %r1, %r10
	stx	%r10, [%r9]
	ldx	[%r9], %r11
	setx	0x4e06a3de5bada2f8, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
	setx	0x000000fe98047c10, %r1, %r9
	setx	0x1774ff99158db498, %r1, %r10
	stx	%r10, [%r9]
	ldx	[%r9], %r11
	setx	0x1774ff99158db498, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
	setx	0x000000dc80747ec8, %r1, %r9
	setx	0xf51b29eaff6d3e5c, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000fca2fb6498, %r1, %r12
	setx	0xf32a29a3cf613340, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000fca2fb6498, %r1, %r12
	setx	0xf32a29a3cf613340, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000800e1ef720, %r1, %r12
	setx	0x865db20420e553c8, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000ef9b8cee68, %r1, %r12
	setx	0x4aa42e936e0da7ad, %r1, %r13
	stx	%r13, [%r12]
	ldx	[%r9], %r11
	setx	0xf51b29eaff6d3e5c, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
	setx	0x000000dbdf691448, %r1, %r9
	setx	0x4dc90391430f875f, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f572ff8, %r1, %r12
	setx	0x403a3ac8d5ec88bb, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000e85c271868, %r1, %r12
	setx	0x041492c61700bdb0, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000e85c271868, %r1, %r12
	setx	0x041492c61700bdb0, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000f818a53428, %r1, %r12
	setx	0xf32a29a3cf613340, %r1, %r13
	stx	%r13, [%r12]
	ldx	[%r9], %r11
	setx	0x4dc90391430f875f, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
	setx	0x000000dc24f86e18, %r1, %r9
	setx	0x2f5e748e85804fcf, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000cc95ee0e68, %r1, %r12
	setx	0xccdc41bc78c81898, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000e783960dd0, %r1, %r12
	setx	0xd4a2749d116bf17e, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000fec23cce50, %r1, %r12
	setx	0xf32a29a3cf613340, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000cc95ee0e68, %r1, %r12
	setx	0xccdc41bc78c81898, %r1, %r13
	stx	%r13, [%r12]
	ldx	[%r9], %r11
	setx	0x2f5e748e85804fcf, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
	setx	0x000000800fa215c0, %r1, %r9
	setx	0x365dd28f0f10c7ce, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800e719e88, %r1, %r12
	setx	0x865db20420e553c8, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000800e719e88, %r1, %r12
	setx	0x865db20420e553c8, %r1, %r13
	stx	%r13, [%r12]
	ldx	[%r9], %r11
	setx	0x365dd28f0f10c7ce, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
	setx	0x000000800ee427f8, %r1, %r9
	setx	0x758d388e1af0d7e6, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f74c878, %r1, %r12
	setx	0x403a3ac8d5ec88bb, %r1, %r13
	stx	%r13, [%r12]
	ldx	[%r9], %r11
	setx	0x758d388e1af0d7e6, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
	setx	0x000000800e3485c0, %r1, %r9
	setx	0xa6b65efd228d188b, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f091b69d70, %r1, %r12
	setx	0xf32a29a3cf613340, %r1, %r13
	stx	%r13, [%r12]
	ldx	[%r9], %r11
	setx	0xa6b65efd228d188b, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
	setx	0x000000fefd22aa90, %r1, %r9
	setx	0xf11781f1c312cd95, %r1, %r10
	stx	%r10, [%r9]
	ldx	[%r9], %r11
	setx	0xf11781f1c312cd95, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
	setx	0x000000cf451e02b0, %r1, %r9
	setx	0x4988938d90e92924, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000fa5855a950, %r1, %r12
	setx	0xf32a29a3cf613340, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000800eb80270, %r1, %r12
	setx	0x865db20420e553c8, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000ee780ea428, %r1, %r12
	setx	0xd4a2749d116bf17e, %r1, %r13
	stx	%r13, [%r12]
	ldx	[%r9], %r11
	setx	0x4988938d90e92924, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
	setx	0x000000800f82f680, %r1, %r9
	setx	0xa6b0d3d50cba7108, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800e686b08, %r1, %r12
	setx	0x865db20420e553c8, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000ca2156ad60, %r1, %r12
	setx	0xccdc41bc78c81898, %r1, %r13
	stx	%r13, [%r12]
	ldx	[%r9], %r11
	setx	0xa6b0d3d50cba7108, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
	setx	0x000000f633d4bf88, %r1, %r9
	setx	0xfc764f46224b5299, %r1, %r10
	stx	%r10, [%r9]
	ldx	[%r9], %r11
	setx	0xfc764f46224b5299, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
	setx	0x000000c6a9806758, %r1, %r9
	setx	0x84b6f20ae76ee303, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f6680ab908, %r1, %r12
	setx	0xf32a29a3cf613340, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000e97b794218, %r1, %r12
	setx	0xd4a2749d116bf17e, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000f6680ab908, %r1, %r12
	setx	0xf32a29a3cf613340, %r1, %r13
	stx	%r13, [%r12]
	ldx	[%r9], %r11
	setx	0x84b6f20ae76ee303, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
	setx	0x000000800f319df0, %r1, %r9
	setx	0xf2cf7b64d43cb09f, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000dd74257da8, %r1, %r12
	setx	0x24555c84a3497d7b, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000c6ee954c10, %r1, %r12
	setx	0xccdc41bc78c81898, %r1, %r13
	stx	%r13, [%r12]
	ldx	[%r9], %r11
	setx	0xf2cf7b64d43cb09f, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
	setx	0x000000800e2c3c20, %r1, %r9
	setx	0x7f77bee09d20c452, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000cc8c920bc8, %r1, %r12
	setx	0xccdc41bc78c81898, %r1, %r13
	stx	%r13, [%r12]
	ldx	[%r9], %r11
	setx	0x7f77bee09d20c452, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
	setx	0x000000800f50f8c8, %r1, %r9
	setx	0xb85c64861e09f431, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c9b7c5be00, %r1, %r12
	setx	0xccdc41bc78c81898, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000fad8bec8b8, %r1, %r12
	setx	0xf32a29a3cf613340, %r1, %r13
	stx	%r13, [%r12]
	ldx	[%r9], %r11
	setx	0xb85c64861e09f431, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
	setx	0x000000c3ee30ac30, %r1, %r9
	setx	0x39804420da587438, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f4974e0, %r1, %r12
	setx	0x403a3ac8d5ec88bb, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000800e813790, %r1, %r12
	setx	0x865db20420e553c8, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000df87d23aa0, %r1, %r12
	setx	0x24555c84a3497d7b, %r1, %r13
	stx	%r13, [%r12]
	ldx	[%r9], %r11
	setx	0x39804420da587438, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
	setx	0x000000800eb23ac0, %r1, %r9
	setx	0x2d63a7fb1d3e91a6, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c26ebbbc20, %r1, %r12
	setx	0xccdc41bc78c81898, %r1, %r13
	stx	%r13, [%r12]
	ldx	[%r9], %r11
	setx	0x2d63a7fb1d3e91a6, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
	setx	0x000000cc66db5338, %r1, %r9
	setx	0xd3de4c0ce8f6e367, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800e25b3c0, %r1, %r12
	setx	0x865db20420e553c8, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000d9e7a51b88, %r1, %r12
	setx	0x24555c84a3497d7b, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000800e25b3c0, %r1, %r12
	setx	0x865db20420e553c8, %r1, %r13
	stx	%r13, [%r12]
	ldx	[%r9], %r11
	setx	0xd3de4c0ce8f6e367, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
	setx	0x000000c9301c2f58, %r1, %r9
	setx	0x18148c964ecf11a0, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f07db18, %r1, %r12
	setx	0x403a3ac8d5ec88bb, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000db14f108f0, %r1, %r12
	setx	0x24555c84a3497d7b, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000800f07db18, %r1, %r12
	setx	0x403a3ac8d5ec88bb, %r1, %r13
	stx	%r13, [%r12]
	ldx	[%r9], %r11
	setx	0x18148c964ecf11a0, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
	setx	0x000000800e961bb8, %r1, %r9
	setx	0x475eea0c522b7f47, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000fa9a04d4f8, %r1, %r12
	setx	0xf32a29a3cf613340, %r1, %r13
	stx	%r13, [%r12]
	ldx	[%r9], %r11
	setx	0x475eea0c522b7f47, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
	setx	0x000000d5b97a2b28, %r1, %r9
	setx	0xc3431ff5c67546b7, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f1eada8, %r1, %r12
	setx	0x403a3ac8d5ec88bb, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000800e812678, %r1, %r12
	setx	0x865db20420e553c8, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000800f1eada8, %r1, %r12
	setx	0x403a3ac8d5ec88bb, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000e46ac56438, %r1, %r12
	setx	0x4aa42e936e0da7ad, %r1, %r13
	stx	%r13, [%r12]
	ldx	[%r9], %r11
	setx	0xc3431ff5c67546b7, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
	setx	0x000000800f999848, %r1, %r9
	setx	0xd0129a58a922ea3e, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800ea23330, %r1, %r12
	setx	0x865db20420e553c8, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000f2a3fef528, %r1, %r12
	setx	0xf32a29a3cf613340, %r1, %r13
	stx	%r13, [%r12]
	ldx	[%r9], %r11
	setx	0xd0129a58a922ea3e, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
	setx	0x000000800ea889b0, %r1, %r9
	setx	0xc097f9921d7651e7, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000fc8c0daef8, %r1, %r12
	setx	0xf32a29a3cf613340, %r1, %r13
	stx	%r13, [%r12]
	ldx	[%r9], %r11
	setx	0xc097f9921d7651e7, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
	setx	0x000000d6773e4ff0, %r1, %r9
	setx	0x028538d653318f99, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800eff2c90, %r1, %r12
	setx	0x865db20420e553c8, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000800eff2c90, %r1, %r12
	setx	0x865db20420e553c8, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000eea27c3650, %r1, %r12
	setx	0xd4a2749d116bf17e, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000800fe9f800, %r1, %r12
	setx	0x403a3ac8d5ec88bb, %r1, %r13
	stx	%r13, [%r12]
	ldx	[%r9], %r11
	setx	0x028538d653318f99, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
	setx	0x000000f0fe693068, %r1, %r9
	setx	0x7c6f86db75cfffbe, %r1, %r10
	stx	%r10, [%r9]
	ldx	[%r9], %r11
	setx	0x7c6f86db75cfffbe, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
	setx	0x000000c0ce405790, %r1, %r9
	setx	0xb95b40cdf8681216, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800ff6eae0, %r1, %r12
	setx	0x403a3ac8d5ec88bb, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000800ff6eae0, %r1, %r12
	setx	0x403a3ac8d5ec88bb, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000dfa0737498, %r1, %r12
	setx	0x24555c84a3497d7b, %r1, %r13
	stx	%r13, [%r12]
	ldx	[%r9], %r11
	setx	0xb95b40cdf8681216, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
	setx	0x000000800faa4918, %r1, %r9
	setx	0x00c2870d2a6e2915, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c612ef81c0, %r1, %r12
	setx	0xccdc41bc78c81898, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000d6061d6e38, %r1, %r12
	setx	0x24555c84a3497d7b, %r1, %r13
	stx	%r13, [%r12]
	ldx	[%r9], %r11
	setx	0x00c2870d2a6e2915, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
	setx	0x000000800e0b5948, %r1, %r9
	setx	0x0122c5f6bb9f26c7, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ded0831970, %r1, %r12
	setx	0x24555c84a3497d7b, %r1, %r13
	stx	%r13, [%r12]
	ldx	[%r9], %r11
	setx	0x0122c5f6bb9f26c7, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
	setx	0x000000dc10ad01f8, %r1, %r9
	setx	0x1d54845d5d6891ff, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800e58a938, %r1, %r12
	setx	0x865db20420e553c8, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000800f9523c8, %r1, %r12
	setx	0x403a3ac8d5ec88bb, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000800e58a938, %r1, %r12
	setx	0x865db20420e553c8, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000e2bed592d0, %r1, %r12
	setx	0x4aa42e936e0da7ad, %r1, %r13
	stx	%r13, [%r12]
	ldx	[%r9], %r11
	setx	0x1d54845d5d6891ff, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
	setx	0x000000d83881f718, %r1, %r9
	setx	0x136886f5ca1667db, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800eae0320, %r1, %r12
	setx	0x865db20420e553c8, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000800fd7a288, %r1, %r12
	setx	0x403a3ac8d5ec88bb, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000f41d3edce8, %r1, %r12
	setx	0xf32a29a3cf613340, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000c27dfd4280, %r1, %r12
	setx	0xccdc41bc78c81898, %r1, %r13
	stx	%r13, [%r12]
	ldx	[%r9], %r11
	setx	0x136886f5ca1667db, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
	setx	0x000000d5e41fd2f8, %r1, %r9
	setx	0x05ca21163574d131, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c5fc14a968, %r1, %r12
	setx	0xccdc41bc78c81898, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000f00b24a8d8, %r1, %r12
	setx	0xf32a29a3cf613340, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000c5fc14a968, %r1, %r12
	setx	0xccdc41bc78c81898, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000c5fc14a968, %r1, %r12
	setx	0xccdc41bc78c81898, %r1, %r13
	stx	%r13, [%r12]
	ldx	[%r9], %r11
	setx	0x05ca21163574d131, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
	setx	0x000000800e9e5958, %r1, %r9
	setx	0xf09a362805b32d07, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f2353eaf58, %r1, %r12
	setx	0xf32a29a3cf613340, %r1, %r13
	stx	%r13, [%r12]
	ldx	[%r9], %r11
	setx	0xf09a362805b32d07, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
	setx	0x000000c36083b7b8, %r1, %r9
	setx	0xad8b996336d7359c, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800e2d73a0, %r1, %r12
	setx	0x865db20420e553c8, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000ef8b1f3b20, %r1, %r12
	setx	0x041492c61700bdb0, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000d2585d7400, %r1, %r12
	setx	0x24555c84a3497d7b, %r1, %r13
	stx	%r13, [%r12]
	ldx	[%r9], %r11
	setx	0xad8b996336d7359c, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
	setx	0x000000fae92fe398, %r1, %r9
	setx	0x1c9f513ad0d576cc, %r1, %r10
	stx	%r10, [%r9]
	ldx	[%r9], %r11
	setx	0x1c9f513ad0d576cc, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
	setx	0x000000800f2e22d0, %r1, %r9
	setx	0xe7f256dd9c6b8bba, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c66c4140e8, %r1, %r12
	setx	0xccdc41bc78c81898, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000fe334fb938, %r1, %r12
	setx	0xf32a29a3cf613340, %r1, %r13
	stx	%r13, [%r12]
	ldx	[%r9], %r11
	setx	0xe7f256dd9c6b8bba, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
	setx	0x000000dc2e8477a0, %r1, %r9
	setx	0x3f61b92e6f395c99, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f4eeb6e648, %r1, %r12
	setx	0xf32a29a3cf613340, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000f4eeb6e648, %r1, %r12
	setx	0xf32a29a3cf613340, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000ee9180fc28, %r1, %r12
	setx	0x4aa42e936e0da7ad, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000c327f252b0, %r1, %r12
	setx	0xccdc41bc78c81898, %r1, %r13
	stx	%r13, [%r12]
	ldx	[%r9], %r11
	setx	0x3f61b92e6f395c99, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
	setx	0x000000fef2152c78, %r1, %r9
	setx	0x747c29c582bec6fb, %r1, %r10
	stx	%r10, [%r9]
	ldx	[%r9], %r11
	setx	0x747c29c582bec6fb, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
	setx	0x000000d23acf0658, %r1, %r9
	setx	0x18d91806f5d79357, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800fc0aa48, %r1, %r12
	setx	0x403a3ac8d5ec88bb, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000f0ce19d0a0, %r1, %r12
	setx	0xf32a29a3cf613340, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000e71d1a5560, %r1, %r12
	setx	0x041492c61700bdb0, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000800fc0aa48, %r1, %r12
	setx	0x403a3ac8d5ec88bb, %r1, %r13
	stx	%r13, [%r12]
	ldx	[%r9], %r11
	setx	0x18d91806f5d79357, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
	setx	0x000000c49188d618, %r1, %r9
	setx	0x7a31ffc2c397f02f, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800e002370, %r1, %r12
	setx	0x865db20420e553c8, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000efd5e84988, %r1, %r12
	setx	0xd4a2749d116bf17e, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000dd55c44278, %r1, %r12
	setx	0x24555c84a3497d7b, %r1, %r13
	stx	%r13, [%r12]
	ldx	[%r9], %r11
	setx	0x7a31ffc2c397f02f, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
	setx	0x000000800ea2f620, %r1, %r9
	setx	0xb8ec0503acb07313, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000cf80924078, %r1, %r12
	setx	0xccdc41bc78c81898, %r1, %r13
	stx	%r13, [%r12]
	ldx	[%r9], %r11
	setx	0xb8ec0503acb07313, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
	setx	0x000000800f7d2820, %r1, %r9
	setx	0x7dd57973304b8078, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f2d143cd80, %r1, %r12
	setx	0xf32a29a3cf613340, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000e7e17a9b08, %r1, %r12
	setx	0xd4a2749d116bf17e, %r1, %r13
	stx	%r13, [%r12]
	ldx	[%r9], %r11
	setx	0x7dd57973304b8078, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
	setx	0x000000800f6cd758, %r1, %r9
	setx	0x6cb4d72cc7334579, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000cdb1669b78, %r1, %r12
	setx	0xccdc41bc78c81898, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000e4da17e4e0, %r1, %r12
	setx	0xd4a2749d116bf17e, %r1, %r13
	stx	%r13, [%r12]
	ldx	[%r9], %r11
	setx	0x6cb4d72cc7334579, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
	setx	0x000000c7f6fcd5e8, %r1, %r9
	setx	0x3ab45a52377cf2f0, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800e34c3e0, %r1, %r12
	setx	0x865db20420e553c8, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000d4d5816160, %r1, %r12
	setx	0x24555c84a3497d7b, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000ee164fd130, %r1, %r12
	setx	0x041492c61700bdb0, %r1, %r13
	stx	%r13, [%r12]
	ldx	[%r9], %r11
	setx	0x3ab45a52377cf2f0, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
	setx	0x000000ca05f63e60, %r1, %r9
	setx	0xd9dcdfa92b10f797, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800fce9b88, %r1, %r12
	setx	0x403a3ac8d5ec88bb, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000e510b5fec0, %r1, %r12
	setx	0x4aa42e936e0da7ad, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000dc91f39748, %r1, %r12
	setx	0x24555c84a3497d7b, %r1, %r13
	stx	%r13, [%r12]
	ldx	[%r9], %r11
	setx	0xd9dcdfa92b10f797, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
	setx	0x000000c659ea4c80, %r1, %r9
	setx	0x3c7e34142af2b401, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000df83749318, %r1, %r12
	setx	0x24555c84a3497d7b, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000e93ab6e5d8, %r1, %r12
	setx	0x4aa42e936e0da7ad, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000e93ab6e5d8, %r1, %r12
	setx	0xd4a2749d116bf17e, %r1, %r13
	stx	%r13, [%r12]
	ldx	[%r9], %r11
	setx	0x3c7e34142af2b401, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
	setx	0x000000f2b420c0c0, %r1, %r9
	setx	0x2cb445f2b6ad7ee9, %r1, %r10
	stx	%r10, [%r9]
	ldx	[%r9], %r11
	setx	0x2cb445f2b6ad7ee9, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
	setx	0x000000faf985db00, %r1, %r9
	setx	0x950c2512ac1010d6, %r1, %r10
	stx	%r10, [%r9]
	ldx	[%r9], %r11
	setx	0x950c2512ac1010d6, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
	setx	0x000000fc7f4e1968, %r1, %r9
	setx	0x82a2eab58b01d8de, %r1, %r10
	stx	%r10, [%r9]
	ldx	[%r9], %r11
	setx	0x82a2eab58b01d8de, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
	setx	0x000000800fecb2a0, %r1, %r9
	setx	0x85a412c8b55f4f89, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800e7ad108, %r1, %r12
	setx	0x865db20420e553c8, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000ca5fad60e0, %r1, %r12
	setx	0xccdc41bc78c81898, %r1, %r13
	stx	%r13, [%r12]
	ldx	[%r9], %r11
	setx	0x85a412c8b55f4f89, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
	setx	0x000000800e461028, %r1, %r9
	setx	0x897e8058b066eb48, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f4cdbfd4a8, %r1, %r12
	setx	0xf32a29a3cf613340, %r1, %r13
	stx	%r13, [%r12]
	ldx	[%r9], %r11
	setx	0x897e8058b066eb48, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
	setx	0x000000db0e42ff58, %r1, %r9
	setx	0xe06accb5a1de4acc, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800e44dc08, %r1, %r12
	setx	0x865db20420e553c8, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000f63e28bc58, %r1, %r12
	setx	0xf32a29a3cf613340, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000f63e28bc58, %r1, %r12
	setx	0xf32a29a3cf613340, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000ee4713ca30, %r1, %r12
	setx	0xd4a2749d116bf17e, %r1, %r13
	stx	%r13, [%r12]
	ldx	[%r9], %r11
	setx	0xe06accb5a1de4acc, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
	setx	0x000000800fa46b88, %r1, %r9
	setx	0x6b0dbeb92f6c649f, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d4a25f2c88, %r1, %r12
	setx	0x24555c84a3497d7b, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000f2e5ad24f8, %r1, %r12
	setx	0xf32a29a3cf613340, %r1, %r13
	stx	%r13, [%r12]
	ldx	[%r9], %r11
	setx	0x6b0dbeb92f6c649f, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
	setx	0x000000dd42d139f8, %r1, %r9
	setx	0xa809a6ab9dbcaf36, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000fc99be4730, %r1, %r12
	setx	0xf32a29a3cf613340, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000800f591ee8, %r1, %r12
	setx	0x403a3ac8d5ec88bb, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000fc99be4730, %r1, %r12
	setx	0xf32a29a3cf613340, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000cbe61058c0, %r1, %r12
	setx	0xccdc41bc78c81898, %r1, %r13
	stx	%r13, [%r12]
	ldx	[%r9], %r11
	setx	0xa809a6ab9dbcaf36, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
	setx	0x000000f0056185d8, %r1, %r9
	setx	0x40bc406b1b7b414d, %r1, %r10
	stx	%r10, [%r9]
	ldx	[%r9], %r11
	setx	0x40bc406b1b7b414d, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
	setx	0x000000d70d789128, %r1, %r9
	setx	0x316d9c4b173f692b, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f2117217b0, %r1, %r12
	setx	0xf32a29a3cf613340, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000f2117217b0, %r1, %r12
	setx	0xf32a29a3cf613340, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000800f954f88, %r1, %r12
	setx	0x403a3ac8d5ec88bb, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000800f954f88, %r1, %r12
	setx	0x403a3ac8d5ec88bb, %r1, %r13
	stx	%r13, [%r12]
	ldx	[%r9], %r11
	setx	0x316d9c4b173f692b, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
	setx	0x000000c6f6137478, %r1, %r9
	setx	0xa02435cfe4ddd688, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f42c630, %r1, %r12
	setx	0x403a3ac8d5ec88bb, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000800f42c630, %r1, %r12
	setx	0x403a3ac8d5ec88bb, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000f2c8b992d8, %r1, %r12
	setx	0xf32a29a3cf613340, %r1, %r13
	stx	%r13, [%r12]
	ldx	[%r9], %r11
	setx	0xa02435cfe4ddd688, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
	setx	0x000000f8e4e64168, %r1, %r9
	setx	0x3b2b2dfa908944b2, %r1, %r10
	stx	%r10, [%r9]
	ldx	[%r9], %r11
	setx	0x3b2b2dfa908944b2, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
	setx	0x000000cc82d89cf8, %r1, %r9
	setx	0x69d592cd0f4c5127, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000dd5fa889c0, %r1, %r12
	setx	0x24555c84a3497d7b, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000800eb02d58, %r1, %r12
	setx	0x865db20420e553c8, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000eba0a737e0, %r1, %r12
	setx	0x4aa42e936e0da7ad, %r1, %r13
	stx	%r13, [%r12]
	ldx	[%r9], %r11
	setx	0x69d592cd0f4c5127, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
	setx	0x000000c87b9baee8, %r1, %r9
	setx	0x81a221aa2ac548ac, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d415eea1c8, %r1, %r12
	setx	0x24555c84a3497d7b, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000eaa96a7520, %r1, %r12
	setx	0x4aa42e936e0da7ad, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000eaa96a7520, %r1, %r12
	setx	0x041492c61700bdb0, %r1, %r13
	stx	%r13, [%r12]
	ldx	[%r9], %r11
	setx	0x81a221aa2ac548ac, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
	setx	0x000000800f289e68, %r1, %r9
	setx	0x27b42e738bfb77b9, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000dde34f7a98, %r1, %r12
	setx	0x24555c84a3497d7b, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000faa7a47978, %r1, %r12
	setx	0xf32a29a3cf613340, %r1, %r13
	stx	%r13, [%r12]
	ldx	[%r9], %r11
	setx	0x27b42e738bfb77b9, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
	setx	0x000000f859cc51b8, %r1, %r9
	setx	0xb622974e7547ee4b, %r1, %r10
	stx	%r10, [%r9]
	ldx	[%r9], %r11
	setx	0xb622974e7547ee4b, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
	setx	0x000000fade4dc3b0, %r1, %r9
	setx	0x90f39b863a26d7ff, %r1, %r10
	stx	%r10, [%r9]
	ldx	[%r9], %r11
	setx	0x90f39b863a26d7ff, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
	setx	0x000000c376185e60, %r1, %r9
	setx	0x4f52bf226a51384e, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000fe58886398, %r1, %r12
	setx	0xf32a29a3cf613340, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000800ea92b60, %r1, %r12
	setx	0x865db20420e553c8, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000efb2c2fd38, %r1, %r12
	setx	0x4aa42e936e0da7ad, %r1, %r13
	stx	%r13, [%r12]
	ldx	[%r9], %r11
	setx	0x4f52bf226a51384e, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
	setx	0x000000c224e53a78, %r1, %r9
	setx	0x753686328910e931, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000dbfd6bae10, %r1, %r12
	setx	0x24555c84a3497d7b, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000e303c62908, %r1, %r12
	setx	0x4aa42e936e0da7ad, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000e303c62908, %r1, %r12
	setx	0xd4a2749d116bf17e, %r1, %r13
	stx	%r13, [%r12]
	ldx	[%r9], %r11
	setx	0x753686328910e931, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
	setx	0x000000800f2849f0, %r1, %r9
	setx	0x9e0013cecff2baf8, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800e279e38, %r1, %r12
	setx	0x865db20420e553c8, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000800e279e38, %r1, %r12
	setx	0x865db20420e553c8, %r1, %r13
	stx	%r13, [%r12]
	ldx	[%r9], %r11
	setx	0x9e0013cecff2baf8, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
	setx	0x000000d21c01fdf8, %r1, %r9
	setx	0xef8b383cd84e4e3a, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f408e50, %r1, %r12
	setx	0x403a3ac8d5ec88bb, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000800ea3df50, %r1, %r12
	setx	0x865db20420e553c8, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000c9b26723e0, %r1, %r12
	setx	0xccdc41bc78c81898, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000e499c25370, %r1, %r12
	setx	0x041492c61700bdb0, %r1, %r13
	stx	%r13, [%r12]
	ldx	[%r9], %r11
	setx	0xef8b383cd84e4e3a, %r1, %r10
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
