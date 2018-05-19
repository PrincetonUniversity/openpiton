// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: pio_rnd_basic2_rand_0.s
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
   random seed:	184925698
   Jal pio_rnd_basic2.j:	
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

	setx	0x000000d817a33f40, %r1, %r9
	setx	0x61d327ab2ddd0360, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800ea2b7e8, %r1, %r12
	setx	0x0000000000000000, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000800f464f78, %r1, %r12
	setx	0x0000000000000000, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000800f464f78, %r1, %r12
	setx	0x0000000000000000, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000edceee7748, %r1, %r12
	setx	0x0000000000000000, %r1, %r13
	stx	%r13, [%r12]
	ldx	[%r9], %r11
	setx	0x61d327ab2ddd0360, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
!	data_array 0 = 0x000000d817a33f40 , rd_cntr = 1, wr_cntr = 1
!	data_array 1 = 0x0000000000000000 , rd_cntr = 1, wr_cntr = 1
!	data_array 2 = 0x0000000000000000 , rd_cntr = 1, wr_cntr = 1
!	data_array 3 = 0x0000000000000000 , rd_cntr = 1, wr_cntr = 1
	setx	0x000000800e06a148, %r1, %r9
	setx	0xcb07c9dcc8383e20, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ca26466bb0, %r1, %r12
	setx	0x0000000000000000, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000800e06a148, %r1, %r12
	ldx	[%r12], %r11
	ldx	[%r9], %r11
	setx	0xcb07c9dcc8383e20, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
!	data_array 0 = 0x000000d817a33f40 , rd_cntr = 2, wr_cntr = 2
!	data_array 1 = 0x000000800e06a148 , rd_cntr = 2, wr_cntr = 2
!	data_array 2 = 0x0000000000000000 , rd_cntr = 2, wr_cntr = 2
!	data_array 3 = 0x0000000000000000 , rd_cntr = 2, wr_cntr = 2
	setx	0x000000800f3d5d88, %r1, %r9
	setx	0x24f0eb6c0c800dc7, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f864935ee0, %r1, %r12
	setx	0x61d327ab2ddd0360, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000e374909ab8, %r1, %r12
	setx	0x0000000000000000, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000800f3d5d88, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e06a148, %r1, %r12
	ldx	[%r12], %r11
	ldx	[%r9], %r11
	setx	0x24f0eb6c0c800dc7, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
!	data_array 0 = 0x000000d817a33f40 , rd_cntr = 3, wr_cntr = 3
!	data_array 1 = 0x000000800e06a148 , rd_cntr = 3, wr_cntr = 3
!	data_array 2 = 0x000000800f3d5d88 , rd_cntr = 3, wr_cntr = 3
!	data_array 3 = 0x0000000000000000 , rd_cntr = 3, wr_cntr = 3
	setx	0x000000cca2257530, %r1, %r9
	setx	0xa09b135fa620d13a, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800e72b4f0, %r1, %r12
	setx	0xcb07c9dcc8383e20, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000faa8fd3140, %r1, %r12
	setx	0x61d327ab2ddd0360, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000dce52f3ef8, %r1, %r12
	setx	0x0000000000000000, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000800e06a148, %r1, %r12
	ldx	[%r12], %r11
	ldx	[%r9], %r11
	setx	0xa09b135fa620d13a, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
!	data_array 0 = 0x000000d817a33f40 , rd_cntr = 4, wr_cntr = 4
!	data_array 1 = 0x000000800e06a148 , rd_cntr = 4, wr_cntr = 4
!	data_array 2 = 0x000000800f3d5d88 , rd_cntr = 4, wr_cntr = 4
!	data_array 3 = 0x000000cca2257530 , rd_cntr = 4, wr_cntr = 4
	setx	0x000000800f4df580, %r1, %r9
	setx	0x8bc2f3a2afaa4ac1, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800eba6bb0, %r1, %r12
	setx	0xcb07c9dcc8383e20, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000c58547a4c8, %r1, %r12
	setx	0xa09b135fa620d13a, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000800f4df580, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000cca2257530, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800f3d5d88, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e06a148, %r1, %r12
	ldx	[%r12], %r11
	ldx	[%r9], %r11
	setx	0x8bc2f3a2afaa4ac1, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
!	data_array 0 = 0x000000d817a33f40 , rd_cntr = 5, wr_cntr = 5
!	data_array 1 = 0x000000800e06a148 , rd_cntr = 5, wr_cntr = 5
!	data_array 2 = 0x000000800f3d5d88 , rd_cntr = 5, wr_cntr = 5
!	data_array 3 = 0x000000cca2257530 , rd_cntr = 5, wr_cntr = 5
	setx	0x000000800fcad108, %r1, %r9
	setx	0xdc1550dec3f7a95e, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c2fb83fd40, %r1, %r12
	setx	0xa09b135fa620d13a, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000800eaa1fb8, %r1, %r12
	setx	0xcb07c9dcc8383e20, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000cca2257530, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800f3d5d88, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e06a148, %r1, %r12
	ldx	[%r12], %r11
	ldx	[%r9], %r11
	setx	0xdc1550dec3f7a95e, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
!	data_array 0 = 0x000000d817a33f40 , rd_cntr = 6, wr_cntr = 6
!	data_array 1 = 0x000000800e06a148 , rd_cntr = 6, wr_cntr = 6
!	data_array 2 = 0x000000800f3d5d88 , rd_cntr = 6, wr_cntr = 6
!	data_array 3 = 0x000000cca2257530 , rd_cntr = 6, wr_cntr = 6
	setx	0x000000f2340a70d0, %r1, %r9
	setx	0xff06c9b5be9f3f39, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f2340a70d0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800fcad108, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800f4df580, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000cca2257530, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800f3d5d88, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e06a148, %r1, %r12
	ldx	[%r12], %r11
	ldx	[%r9], %r11
	setx	0xff06c9b5be9f3f39, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
!	data_array 0 = 0x000000d817a33f40 , rd_cntr = 7, wr_cntr = 7
!	data_array 1 = 0x000000800e06a148 , rd_cntr = 7, wr_cntr = 7
!	data_array 2 = 0x000000800f3d5d88 , rd_cntr = 7, wr_cntr = 7
!	data_array 3 = 0x000000cca2257530 , rd_cntr = 7, wr_cntr = 7
	setx	0x000000c888e2d100, %r1, %r9
	setx	0xa0a96998313bee65, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f29b568, %r1, %r12
	setx	0x24f0eb6c0c800dc7, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000efaff4e4c0, %r1, %r12
	setx	0xff06c9b5be9f3f39, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000efaff4e4c0, %r1, %r12
	setx	0xdc1550dec3f7a95e, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000f2340a70d0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800fcad108, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800f4df580, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000cca2257530, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800f3d5d88, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e06a148, %r1, %r12
	ldx	[%r12], %r11
	ldx	[%r9], %r11
	setx	0xa0a96998313bee65, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
!	data_array 0 = 0x000000d817a33f40 , rd_cntr = 8, wr_cntr = 8
!	data_array 1 = 0x000000800e06a148 , rd_cntr = 8, wr_cntr = 8
!	data_array 2 = 0x000000800f3d5d88 , rd_cntr = 8, wr_cntr = 8
!	data_array 3 = 0x000000cca2257530 , rd_cntr = 8, wr_cntr = 8
	setx	0x000000800ec4e6b8, %r1, %r9
	setx	0x2af61ba1d5576171, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000db16988138, %r1, %r12
	setx	0x8bc2f3a2afaa4ac1, %r1, %r13
	stx	%r13, [%r12]
	ldx	[%r9], %r11
	setx	0x2af61ba1d5576171, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
!	data_array 0 = 0x000000800ec4e6b8 , rd_cntr = 9, wr_cntr = 9
!	data_array 1 = 0x000000800e06a148 , rd_cntr = 9, wr_cntr = 9
!	data_array 2 = 0x000000800f3d5d88 , rd_cntr = 9, wr_cntr = 9
!	data_array 3 = 0x000000cca2257530 , rd_cntr = 9, wr_cntr = 9
	setx	0x000000800f0783a0, %r1, %r9
	setx	0xfc0ee21b1d82bbf5, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c497ff2540, %r1, %r12
	setx	0xa09b135fa620d13a, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000eec4685380, %r1, %r12
	setx	0xa0a96998313bee65, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000800f0783a0, %r1, %r12
	ldx	[%r12], %r11
	ldx	[%r9], %r11
	setx	0xfc0ee21b1d82bbf5, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
!	data_array 0 = 0x000000800ec4e6b8 , rd_cntr = 10, wr_cntr = 10
!	data_array 1 = 0x000000800f0783a0 , rd_cntr = 10, wr_cntr = 10
!	data_array 2 = 0x000000800f3d5d88 , rd_cntr = 10, wr_cntr = 10
!	data_array 3 = 0x000000cca2257530 , rd_cntr = 10, wr_cntr = 10
	setx	0x000000800f027d18, %r1, %r9
	setx	0x59aa96c1e67b619e, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000cd049c0b78, %r1, %r12
	setx	0xa09b135fa620d13a, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000e630bb5930, %r1, %r12
	setx	0xa0a96998313bee65, %r1, %r13
	stx	%r13, [%r12]
	ldx	[%r9], %r11
	setx	0x59aa96c1e67b619e, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
!	data_array 0 = 0x000000800ec4e6b8 , rd_cntr = 11, wr_cntr = 11
!	data_array 1 = 0x000000800f0783a0 , rd_cntr = 11, wr_cntr = 11
!	data_array 2 = 0x000000800f027d18 , rd_cntr = 11, wr_cntr = 11
!	data_array 3 = 0x000000cca2257530 , rd_cntr = 11, wr_cntr = 11
	setx	0x000000800ec694b8, %r1, %r9
	setx	0x562c33817ca73a97, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c324f16760, %r1, %r12
	setx	0xa09b135fa620d13a, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000800ec694b8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800f027d18, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800f0783a0, %r1, %r12
	ldx	[%r12], %r11
	ldx	[%r9], %r11
	setx	0x562c33817ca73a97, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
!	data_array 0 = 0x000000800ec4e6b8 , rd_cntr = 12, wr_cntr = 12
!	data_array 1 = 0x000000800f0783a0 , rd_cntr = 12, wr_cntr = 12
!	data_array 2 = 0x000000800f027d18 , rd_cntr = 12, wr_cntr = 12
!	data_array 3 = 0x000000800ec694b8 , rd_cntr = 12, wr_cntr = 12
	setx	0x000000f258269b78, %r1, %r9
	setx	0x54569e096136c44d, %r1, %r10
	stx	%r10, [%r9]
	ldx	[%r9], %r11
	setx	0x54569e096136c44d, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
!	data_array 0 = 0x000000800ec4e6b8 , rd_cntr = 13, wr_cntr = 13
!	data_array 1 = 0x000000800f0783a0 , rd_cntr = 13, wr_cntr = 13
!	data_array 2 = 0x000000800f027d18 , rd_cntr = 13, wr_cntr = 13
!	data_array 3 = 0x000000800ec694b8 , rd_cntr = 13, wr_cntr = 13
	setx	0x000000800e1581c0, %r1, %r9
	setx	0x050e0e10b25ac96c, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f3f06d8, %r1, %r12
	setx	0x24f0eb6c0c800dc7, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000800f0783a0, %r1, %r12
	ldx	[%r12], %r11
	ldx	[%r9], %r11
	setx	0x050e0e10b25ac96c, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
!	data_array 0 = 0x000000800ec4e6b8 , rd_cntr = 14, wr_cntr = 14
!	data_array 1 = 0x000000800f0783a0 , rd_cntr = 14, wr_cntr = 14
!	data_array 2 = 0x000000800f027d18 , rd_cntr = 14, wr_cntr = 14
!	data_array 3 = 0x000000800ec694b8 , rd_cntr = 14, wr_cntr = 14
	setx	0x000000d1910ad210, %r1, %r9
	setx	0xe9ed53d0c1f1c73b, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800ea89e58, %r1, %r12
	setx	0xcb07c9dcc8383e20, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000fe04eca578, %r1, %r12
	setx	0x61d327ab2ddd0360, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000e993739a50, %r1, %r12
	setx	0xa0a96998313bee65, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000e993739a50, %r1, %r12
	setx	0xa0a96998313bee65, %r1, %r13
	stx	%r13, [%r12]
	ldx	[%r9], %r11
	setx	0xe9ed53d0c1f1c73b, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
!	data_array 0 = 0x000000800ec4e6b8 , rd_cntr = 15, wr_cntr = 15
!	data_array 1 = 0x000000800f0783a0 , rd_cntr = 15, wr_cntr = 15
!	data_array 2 = 0x000000800f027d18 , rd_cntr = 15, wr_cntr = 15
!	data_array 3 = 0x000000800ec694b8 , rd_cntr = 15, wr_cntr = 15
	setx	0x000000800f4a47f8, %r1, %r9
	setx	0xf849d3e003a16457, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000cdac3e9908, %r1, %r12
	setx	0xa09b135fa620d13a, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000e3ff481980, %r1, %r12
	setx	0xa0a96998313bee65, %r1, %r13
	stx	%r13, [%r12]
	ldx	[%r9], %r11
	setx	0xf849d3e003a16457, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
!	data_array 0 = 0x000000800ec4e6b8 , rd_cntr = 16, wr_cntr = 16
!	data_array 1 = 0x000000800f0783a0 , rd_cntr = 16, wr_cntr = 16
!	data_array 2 = 0x000000800f027d18 , rd_cntr = 16, wr_cntr = 16
!	data_array 3 = 0x000000800ec694b8 , rd_cntr = 16, wr_cntr = 16
	setx	0x000000d0ed104db8, %r1, %r9
	setx	0x49c431c31d0ffa1a, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f00e572738, %r1, %r12
	setx	0x61d327ab2ddd0360, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000eaea040208, %r1, %r12
	setx	0xff06c9b5be9f3f39, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000800f8e6bc8, %r1, %r12
	setx	0x24f0eb6c0c800dc7, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000800f8e6bc8, %r1, %r12
	setx	0x24f0eb6c0c800dc7, %r1, %r13
	stx	%r13, [%r12]
	ldx	[%r9], %r11
	setx	0x49c431c31d0ffa1a, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
!	data_array 0 = 0x000000d0ed104db8 , rd_cntr = 17, wr_cntr = 17
!	data_array 1 = 0x000000800f0783a0 , rd_cntr = 17, wr_cntr = 17
!	data_array 2 = 0x000000800f027d18 , rd_cntr = 17, wr_cntr = 17
!	data_array 3 = 0x000000800ec694b8 , rd_cntr = 17, wr_cntr = 17
	setx	0x000000800e4b66d0, %r1, %r9
	setx	0x979e7b21c855bbea, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000fee9d62620, %r1, %r12
	setx	0x61d327ab2ddd0360, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000800e4b66d0, %r1, %r12
	ldx	[%r12], %r11
	ldx	[%r9], %r11
	setx	0x979e7b21c855bbea, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
!	data_array 0 = 0x000000d0ed104db8 , rd_cntr = 18, wr_cntr = 18
!	data_array 1 = 0x000000800e4b66d0 , rd_cntr = 18, wr_cntr = 18
!	data_array 2 = 0x000000800f027d18 , rd_cntr = 18, wr_cntr = 18
!	data_array 3 = 0x000000800ec694b8 , rd_cntr = 18, wr_cntr = 18
	setx	0x000000800e7a5510, %r1, %r9
	setx	0xa7fcaf2a7cf8ccd5, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f10a970, %r1, %r12
	setx	0x24f0eb6c0c800dc7, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000800e7a5510, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e4b66d0, %r1, %r12
	ldx	[%r12], %r11
	ldx	[%r9], %r11
	setx	0xa7fcaf2a7cf8ccd5, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
!	data_array 0 = 0x000000d0ed104db8 , rd_cntr = 19, wr_cntr = 19
!	data_array 1 = 0x000000800e4b66d0 , rd_cntr = 19, wr_cntr = 19
!	data_array 2 = 0x000000800e7a5510 , rd_cntr = 19, wr_cntr = 19
!	data_array 3 = 0x000000800ec694b8 , rd_cntr = 19, wr_cntr = 19
	setx	0x000000f27bb50ff0, %r1, %r9
	setx	0x604a40874d59fff5, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f27bb50ff0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e7a5510, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e4b66d0, %r1, %r12
	ldx	[%r12], %r11
	ldx	[%r9], %r11
	setx	0x604a40874d59fff5, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
!	data_array 0 = 0x000000d0ed104db8 , rd_cntr = 20, wr_cntr = 20
!	data_array 1 = 0x000000800e4b66d0 , rd_cntr = 20, wr_cntr = 20
!	data_array 2 = 0x000000800e7a5510 , rd_cntr = 20, wr_cntr = 20
!	data_array 3 = 0x000000f27bb50ff0 , rd_cntr = 20, wr_cntr = 20
	setx	0x000000c2686258c0, %r1, %r9
	setx	0x354e6086f7cc0898, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000fe123a1000, %r1, %r12
	setx	0x61d327ab2ddd0360, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000fe123a1000, %r1, %r12
	setx	0x61d327ab2ddd0360, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000fe123a1000, %r1, %r12
	setx	0x61d327ab2ddd0360, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000800e4b66d0, %r1, %r12
	ldx	[%r12], %r11
	ldx	[%r9], %r11
	setx	0x354e6086f7cc0898, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
!	data_array 0 = 0x000000d0ed104db8 , rd_cntr = 21, wr_cntr = 21
!	data_array 1 = 0x000000800e4b66d0 , rd_cntr = 21, wr_cntr = 21
!	data_array 2 = 0x000000800e7a5510 , rd_cntr = 21, wr_cntr = 21
!	data_array 3 = 0x000000f27bb50ff0 , rd_cntr = 21, wr_cntr = 21
	setx	0x000000cfc8c3dc70, %r1, %r9
	setx	0x350aa4b00171b687, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000fe43df40a0, %r1, %r12
	setx	0x61d327ab2ddd0360, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000800e40ef20, %r1, %r12
	setx	0xcb07c9dcc8383e20, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000e6b26c3270, %r1, %r12
	setx	0xdc1550dec3f7a95e, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000c2686258c0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000f27bb50ff0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e7a5510, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e4b66d0, %r1, %r12
	ldx	[%r12], %r11
	ldx	[%r9], %r11
	setx	0x350aa4b00171b687, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
!	data_array 0 = 0x000000d0ed104db8 , rd_cntr = 22, wr_cntr = 22
!	data_array 1 = 0x000000800e4b66d0 , rd_cntr = 22, wr_cntr = 22
!	data_array 2 = 0x000000800e7a5510 , rd_cntr = 22, wr_cntr = 22
!	data_array 3 = 0x000000f27bb50ff0 , rd_cntr = 22, wr_cntr = 22
	setx	0x000000800fa89ea8, %r1, %r9
	setx	0x0f80536c1e1b3bfe, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000db8dcd73e8, %r1, %r12
	setx	0x8bc2f3a2afaa4ac1, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000e234ac7d00, %r1, %r12
	setx	0xff06c9b5be9f3f39, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000800fa89ea8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000cfc8c3dc70, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000c2686258c0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000f27bb50ff0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e7a5510, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e4b66d0, %r1, %r12
	ldx	[%r12], %r11
	ldx	[%r9], %r11
	setx	0x0f80536c1e1b3bfe, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
!	data_array 0 = 0x000000d0ed104db8 , rd_cntr = 23, wr_cntr = 23
!	data_array 1 = 0x000000800e4b66d0 , rd_cntr = 23, wr_cntr = 23
!	data_array 2 = 0x000000800e7a5510 , rd_cntr = 23, wr_cntr = 23
!	data_array 3 = 0x000000f27bb50ff0 , rd_cntr = 23, wr_cntr = 23
	setx	0x000000c9c5e9ba20, %r1, %r9
	setx	0x0dce059a50b0abaf, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800fd65960, %r1, %r12
	setx	0x24f0eb6c0c800dc7, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000800e41a6c8, %r1, %r12
	setx	0xcb07c9dcc8383e20, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000d644019238, %r1, %r12
	setx	0x8bc2f3a2afaa4ac1, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000f27bb50ff0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e7a5510, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e4b66d0, %r1, %r12
	ldx	[%r12], %r11
	ldx	[%r9], %r11
	setx	0x0dce059a50b0abaf, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
!	data_array 0 = 0x000000d0ed104db8 , rd_cntr = 24, wr_cntr = 24
!	data_array 1 = 0x000000800e4b66d0 , rd_cntr = 24, wr_cntr = 24
!	data_array 2 = 0x000000800e7a5510 , rd_cntr = 24, wr_cntr = 24
!	data_array 3 = 0x000000f27bb50ff0 , rd_cntr = 24, wr_cntr = 24
	setx	0x000000dea18646d0, %r1, %r9
	setx	0x9229320f60299a4c, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000cf56149bf0, %r1, %r12
	setx	0xa09b135fa620d13a, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000800f53d188, %r1, %r12
	setx	0x24f0eb6c0c800dc7, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000f0dc4e6828, %r1, %r12
	setx	0x61d327ab2ddd0360, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000800e44f8d0, %r1, %r12
	setx	0xcb07c9dcc8383e20, %r1, %r13
	stx	%r13, [%r12]
	ldx	[%r9], %r11
	setx	0x9229320f60299a4c, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
!	data_array 0 = 0x000000dea18646d0 , rd_cntr = 25, wr_cntr = 25
!	data_array 1 = 0x000000800e4b66d0 , rd_cntr = 25, wr_cntr = 25
!	data_array 2 = 0x000000800e7a5510 , rd_cntr = 25, wr_cntr = 25
!	data_array 3 = 0x000000f27bb50ff0 , rd_cntr = 25, wr_cntr = 25
	setx	0x000000800f8f1ff0, %r1, %r9
	setx	0xe4ab0f37eb3e9a7e, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c6c84718b0, %r1, %r12
	setx	0xa09b135fa620d13a, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000da6dc26290, %r1, %r12
	setx	0x8bc2f3a2afaa4ac1, %r1, %r13
	stx	%r13, [%r12]
	ldx	[%r9], %r11
	setx	0xe4ab0f37eb3e9a7e, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
!	data_array 0 = 0x000000dea18646d0 , rd_cntr = 26, wr_cntr = 26
!	data_array 1 = 0x000000800f8f1ff0 , rd_cntr = 26, wr_cntr = 26
!	data_array 2 = 0x000000800e7a5510 , rd_cntr = 26, wr_cntr = 26
!	data_array 3 = 0x000000f27bb50ff0 , rd_cntr = 26, wr_cntr = 26
	setx	0x000000800f1d6238, %r1, %r9
	setx	0x74fbf9dab14e94c7, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800eb64c38, %r1, %r12
	setx	0xcb07c9dcc8383e20, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000800eb64c38, %r1, %r12
	setx	0xcb07c9dcc8383e20, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000800f8f1ff0, %r1, %r12
	ldx	[%r12], %r11
	ldx	[%r9], %r11
	setx	0x74fbf9dab14e94c7, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
!	data_array 0 = 0x000000dea18646d0 , rd_cntr = 27, wr_cntr = 27
!	data_array 1 = 0x000000800f8f1ff0 , rd_cntr = 27, wr_cntr = 27
!	data_array 2 = 0x000000800f1d6238 , rd_cntr = 27, wr_cntr = 27
!	data_array 3 = 0x000000f27bb50ff0 , rd_cntr = 27, wr_cntr = 27
	setx	0x000000800eb5cdc8, %r1, %r9
	setx	0x5138f06563df0288, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000dcd77fab58, %r1, %r12
	setx	0x8bc2f3a2afaa4ac1, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000800f1d6238, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800f8f1ff0, %r1, %r12
	ldx	[%r12], %r11
	ldx	[%r9], %r11
	setx	0x5138f06563df0288, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
!	data_array 0 = 0x000000dea18646d0 , rd_cntr = 28, wr_cntr = 28
!	data_array 1 = 0x000000800f8f1ff0 , rd_cntr = 28, wr_cntr = 28
!	data_array 2 = 0x000000800f1d6238 , rd_cntr = 28, wr_cntr = 28
!	data_array 3 = 0x000000800eb5cdc8 , rd_cntr = 28, wr_cntr = 28
	setx	0x000000800ef4e6e0, %r1, %r9
	setx	0x262554e6de06c835, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000dacae8a9f8, %r1, %r12
	setx	0x8bc2f3a2afaa4ac1, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000800ef4e6e0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800eb5cdc8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800f1d6238, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800f8f1ff0, %r1, %r12
	ldx	[%r12], %r11
	ldx	[%r9], %r11
	setx	0x262554e6de06c835, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
!	data_array 0 = 0x000000dea18646d0 , rd_cntr = 29, wr_cntr = 29
!	data_array 1 = 0x000000800f8f1ff0 , rd_cntr = 29, wr_cntr = 29
!	data_array 2 = 0x000000800f1d6238 , rd_cntr = 29, wr_cntr = 29
!	data_array 3 = 0x000000800eb5cdc8 , rd_cntr = 29, wr_cntr = 29
	setx	0x000000800ef06770, %r1, %r9
	setx	0x4d31145f8955bb82, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000fc6cfcfd10, %r1, %r12
	setx	0x61d327ab2ddd0360, %r1, %r13
	stx	%r13, [%r12]
	ldx	[%r9], %r11
	setx	0x4d31145f8955bb82, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
!	data_array 0 = 0x000000dea18646d0 , rd_cntr = 30, wr_cntr = 30
!	data_array 1 = 0x000000800f8f1ff0 , rd_cntr = 30, wr_cntr = 30
!	data_array 2 = 0x000000800f1d6238 , rd_cntr = 30, wr_cntr = 30
!	data_array 3 = 0x000000800eb5cdc8 , rd_cntr = 30, wr_cntr = 30
	setx	0x000000f8b2a5fba8, %r1, %r9
	setx	0x8d40ddca209a2307, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800ef06770, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800ef4e6e0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800eb5cdc8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800f1d6238, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800f8f1ff0, %r1, %r12
	ldx	[%r12], %r11
	ldx	[%r9], %r11
	setx	0x8d40ddca209a2307, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
!	data_array 0 = 0x000000dea18646d0 , rd_cntr = 31, wr_cntr = 31
!	data_array 1 = 0x000000800f8f1ff0 , rd_cntr = 31, wr_cntr = 31
!	data_array 2 = 0x000000800f1d6238 , rd_cntr = 31, wr_cntr = 31
!	data_array 3 = 0x000000800eb5cdc8 , rd_cntr = 31, wr_cntr = 31
	setx	0x000000800fe3ef08, %r1, %r9
	setx	0xbedf3a768e0b3d82, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f0e1c1b620, %r1, %r12
	setx	0x61d327ab2ddd0360, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000e570d5ddf8, %r1, %r12
	setx	0xa0a96998313bee65, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000800fe3ef08, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000f8b2a5fba8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800ef06770, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800ef4e6e0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800eb5cdc8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800f1d6238, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800f8f1ff0, %r1, %r12
	ldx	[%r12], %r11
	ldx	[%r9], %r11
	setx	0xbedf3a768e0b3d82, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
!	data_array 0 = 0x000000dea18646d0 , rd_cntr = 32, wr_cntr = 32
!	data_array 1 = 0x000000800f8f1ff0 , rd_cntr = 32, wr_cntr = 32
!	data_array 2 = 0x000000800f1d6238 , rd_cntr = 32, wr_cntr = 32
!	data_array 3 = 0x000000800eb5cdc8 , rd_cntr = 32, wr_cntr = 32
	setx	0x000000d927c79628, %r1, %r9
	setx	0x38a03260621ccbcf, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000cc99ef8080, %r1, %r12
	setx	0xa09b135fa620d13a, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000cc99ef8080, %r1, %r12
	setx	0xa09b135fa620d13a, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000cc99ef8080, %r1, %r12
	setx	0xa09b135fa620d13a, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000eef6fb18d8, %r1, %r12
	setx	0xa0a96998313bee65, %r1, %r13
	stx	%r13, [%r12]
	ldx	[%r9], %r11
	setx	0x38a03260621ccbcf, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
!	data_array 0 = 0x000000d927c79628 , rd_cntr = 33, wr_cntr = 33
!	data_array 1 = 0x000000800f8f1ff0 , rd_cntr = 33, wr_cntr = 33
!	data_array 2 = 0x000000800f1d6238 , rd_cntr = 33, wr_cntr = 33
!	data_array 3 = 0x000000800eb5cdc8 , rd_cntr = 33, wr_cntr = 33
	setx	0x000000800e0286f8, %r1, %r9
	setx	0xe2c0ffdd2d60fa6f, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d0393ab288, %r1, %r12
	setx	0x8bc2f3a2afaa4ac1, %r1, %r13
	stx	%r13, [%r12]
	ldx	[%r9], %r11
	setx	0xe2c0ffdd2d60fa6f, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
!	data_array 0 = 0x000000d927c79628 , rd_cntr = 34, wr_cntr = 34
!	data_array 1 = 0x000000800e0286f8 , rd_cntr = 34, wr_cntr = 34
!	data_array 2 = 0x000000800f1d6238 , rd_cntr = 34, wr_cntr = 34
!	data_array 3 = 0x000000800eb5cdc8 , rd_cntr = 34, wr_cntr = 34
	setx	0x000000c1d795c2b0, %r1, %r9
	setx	0x4f71a5f02a9eb371, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f960b30, %r1, %r12
	setx	0x24f0eb6c0c800dc7, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000800eb39430, %r1, %r12
	setx	0xcb07c9dcc8383e20, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000ea93b12d08, %r1, %r12
	setx	0xff06c9b5be9f3f39, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000800e0286f8, %r1, %r12
	ldx	[%r12], %r11
	ldx	[%r9], %r11
	setx	0x4f71a5f02a9eb371, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
!	data_array 0 = 0x000000d927c79628 , rd_cntr = 35, wr_cntr = 35
!	data_array 1 = 0x000000800e0286f8 , rd_cntr = 35, wr_cntr = 35
!	data_array 2 = 0x000000c1d795c2b0 , rd_cntr = 35, wr_cntr = 35
!	data_array 3 = 0x000000800eb5cdc8 , rd_cntr = 35, wr_cntr = 35
	setx	0x000000f0686b9a80, %r1, %r9
	setx	0x3cdebd4ea8da9949, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f0686b9a80, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000c1d795c2b0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e0286f8, %r1, %r12
	ldx	[%r12], %r11
	ldx	[%r9], %r11
	setx	0x3cdebd4ea8da9949, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
!	data_array 0 = 0x000000d927c79628 , rd_cntr = 36, wr_cntr = 36
!	data_array 1 = 0x000000800e0286f8 , rd_cntr = 36, wr_cntr = 36
!	data_array 2 = 0x000000c1d795c2b0 , rd_cntr = 36, wr_cntr = 36
!	data_array 3 = 0x000000f0686b9a80 , rd_cntr = 36, wr_cntr = 36
	setx	0x000000d8a0b6bab0, %r1, %r9
	setx	0x0dcd94df7c1c77f0, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f8aaa925c8, %r1, %r12
	setx	0x61d327ab2ddd0360, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000800e859910, %r1, %r12
	setx	0xcb07c9dcc8383e20, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000eea7549bc0, %r1, %r12
	setx	0xff06c9b5be9f3f39, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000800e859910, %r1, %r12
	setx	0xcb07c9dcc8383e20, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000c1d795c2b0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e0286f8, %r1, %r12
	ldx	[%r12], %r11
	ldx	[%r9], %r11
	setx	0x0dcd94df7c1c77f0, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
!	data_array 0 = 0x000000d927c79628 , rd_cntr = 37, wr_cntr = 37
!	data_array 1 = 0x000000800e0286f8 , rd_cntr = 37, wr_cntr = 37
!	data_array 2 = 0x000000c1d795c2b0 , rd_cntr = 37, wr_cntr = 37
!	data_array 3 = 0x000000f0686b9a80 , rd_cntr = 37, wr_cntr = 37
	setx	0x000000800f121b78, %r1, %r9
	setx	0xc915bf02307f7f79, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d30d7f09d0, %r1, %r12
	setx	0x8bc2f3a2afaa4ac1, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000ca1a0e4a98, %r1, %r12
	setx	0xa09b135fa620d13a, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000f0686b9a80, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000c1d795c2b0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e0286f8, %r1, %r12
	ldx	[%r12], %r11
	ldx	[%r9], %r11
	setx	0xc915bf02307f7f79, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
!	data_array 0 = 0x000000d927c79628 , rd_cntr = 38, wr_cntr = 38
!	data_array 1 = 0x000000800e0286f8 , rd_cntr = 38, wr_cntr = 38
!	data_array 2 = 0x000000c1d795c2b0 , rd_cntr = 38, wr_cntr = 38
!	data_array 3 = 0x000000f0686b9a80 , rd_cntr = 38, wr_cntr = 38
	setx	0x000000800f0d9888, %r1, %r9
	setx	0x9b799ca61a6f9ad7, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800ee03700, %r1, %r12
	setx	0xcb07c9dcc8383e20, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000e21d0284e8, %r1, %r12
	setx	0xdc1550dec3f7a95e, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000800f121b78, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000d8a0b6bab0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000f0686b9a80, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000c1d795c2b0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e0286f8, %r1, %r12
	ldx	[%r12], %r11
	ldx	[%r9], %r11
	setx	0x9b799ca61a6f9ad7, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
!	data_array 0 = 0x000000d927c79628 , rd_cntr = 39, wr_cntr = 39
!	data_array 1 = 0x000000800e0286f8 , rd_cntr = 39, wr_cntr = 39
!	data_array 2 = 0x000000c1d795c2b0 , rd_cntr = 39, wr_cntr = 39
!	data_array 3 = 0x000000f0686b9a80 , rd_cntr = 39, wr_cntr = 39
	setx	0x000000800f242188, %r1, %r9
	setx	0xa5a97eaf4028325d, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800e656b70, %r1, %r12
	setx	0xcb07c9dcc8383e20, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000ef59cf4af8, %r1, %r12
	setx	0xdc1550dec3f7a95e, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000800f0d9888, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800f121b78, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000d8a0b6bab0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000f0686b9a80, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000c1d795c2b0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e0286f8, %r1, %r12
	ldx	[%r12], %r11
	ldx	[%r9], %r11
	setx	0xa5a97eaf4028325d, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
!	data_array 0 = 0x000000d927c79628 , rd_cntr = 40, wr_cntr = 40
!	data_array 1 = 0x000000800e0286f8 , rd_cntr = 40, wr_cntr = 40
!	data_array 2 = 0x000000c1d795c2b0 , rd_cntr = 40, wr_cntr = 40
!	data_array 3 = 0x000000f0686b9a80 , rd_cntr = 40, wr_cntr = 40
	setx	0x000000fca8f12fd0, %r1, %r9
	setx	0x6fc3602697986ff0, %r1, %r10
	stx	%r10, [%r9]
	ldx	[%r9], %r11
	setx	0x6fc3602697986ff0, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
!	data_array 0 = 0x000000fca8f12fd0 , rd_cntr = 41, wr_cntr = 41
!	data_array 1 = 0x000000800e0286f8 , rd_cntr = 41, wr_cntr = 41
!	data_array 2 = 0x000000c1d795c2b0 , rd_cntr = 41, wr_cntr = 41
!	data_array 3 = 0x000000f0686b9a80 , rd_cntr = 41, wr_cntr = 41
	setx	0x000000c61bf8c728, %r1, %r9
	setx	0x38b899a79eb6f37f, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f6547c0, %r1, %r12
	setx	0x24f0eb6c0c800dc7, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000800f6547c0, %r1, %r12
	setx	0x24f0eb6c0c800dc7, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000800e4c6d60, %r1, %r12
	setx	0xcb07c9dcc8383e20, %r1, %r13
	stx	%r13, [%r12]
	ldx	[%r9], %r11
	setx	0x38b899a79eb6f37f, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
!	data_array 0 = 0x000000fca8f12fd0 , rd_cntr = 42, wr_cntr = 42
!	data_array 1 = 0x000000c61bf8c728 , rd_cntr = 42, wr_cntr = 42
!	data_array 2 = 0x000000c1d795c2b0 , rd_cntr = 42, wr_cntr = 42
!	data_array 3 = 0x000000f0686b9a80 , rd_cntr = 42, wr_cntr = 42
	setx	0x000000800f4500e8, %r1, %r9
	setx	0x0d8547871e4fb14f, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800e2d15f0, %r1, %r12
	setx	0xcb07c9dcc8383e20, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000800e2d15f0, %r1, %r12
	setx	0xcb07c9dcc8383e20, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000800f4500e8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000c61bf8c728, %r1, %r12
	ldx	[%r12], %r11
	ldx	[%r9], %r11
	setx	0x0d8547871e4fb14f, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
!	data_array 0 = 0x000000fca8f12fd0 , rd_cntr = 43, wr_cntr = 43
!	data_array 1 = 0x000000c61bf8c728 , rd_cntr = 43, wr_cntr = 43
!	data_array 2 = 0x000000800f4500e8 , rd_cntr = 43, wr_cntr = 43
!	data_array 3 = 0x000000f0686b9a80 , rd_cntr = 43, wr_cntr = 43
	setx	0x000000800f6160c8, %r1, %r9
	setx	0x410a96df84355231, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000fa6d7846d8, %r1, %r12
	setx	0x61d327ab2ddd0360, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000e4bd5fa388, %r1, %r12
	setx	0xa0a96998313bee65, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000800f4500e8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000c61bf8c728, %r1, %r12
	ldx	[%r12], %r11
	ldx	[%r9], %r11
	setx	0x410a96df84355231, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
!	data_array 0 = 0x000000fca8f12fd0 , rd_cntr = 44, wr_cntr = 44
!	data_array 1 = 0x000000c61bf8c728 , rd_cntr = 44, wr_cntr = 44
!	data_array 2 = 0x000000800f4500e8 , rd_cntr = 44, wr_cntr = 44
!	data_array 3 = 0x000000800f6160c8 , rd_cntr = 44, wr_cntr = 44
	setx	0x000000fa61ec0d08, %r1, %r9
	setx	0xa695d597f125d5c8, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000fa61ec0d08, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800f6160c8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800f4500e8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000c61bf8c728, %r1, %r12
	ldx	[%r12], %r11
	ldx	[%r9], %r11
	setx	0xa695d597f125d5c8, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
!	data_array 0 = 0x000000fca8f12fd0 , rd_cntr = 45, wr_cntr = 45
!	data_array 1 = 0x000000c61bf8c728 , rd_cntr = 45, wr_cntr = 45
!	data_array 2 = 0x000000800f4500e8 , rd_cntr = 45, wr_cntr = 45
!	data_array 3 = 0x000000800f6160c8 , rd_cntr = 45, wr_cntr = 45
	setx	0x000000c777399ac0, %r1, %r9
	setx	0x1ac1772200ba647d, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f233f1fcc8, %r1, %r12
	setx	0x61d327ab2ddd0360, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000f233f1fcc8, %r1, %r12
	setx	0x61d327ab2ddd0360, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000800f801488, %r1, %r12
	setx	0x24f0eb6c0c800dc7, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000800f6160c8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800f4500e8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000c61bf8c728, %r1, %r12
	ldx	[%r12], %r11
	ldx	[%r9], %r11
	setx	0x1ac1772200ba647d, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
!	data_array 0 = 0x000000fca8f12fd0 , rd_cntr = 46, wr_cntr = 46
!	data_array 1 = 0x000000c61bf8c728 , rd_cntr = 46, wr_cntr = 46
!	data_array 2 = 0x000000800f4500e8 , rd_cntr = 46, wr_cntr = 46
!	data_array 3 = 0x000000800f6160c8 , rd_cntr = 46, wr_cntr = 46
	setx	0x000000f4a6e6f028, %r1, %r9
	setx	0xd8647b91c508b674, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f4a6e6f028, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000c777399ac0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000fa61ec0d08, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800f6160c8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800f4500e8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000c61bf8c728, %r1, %r12
	ldx	[%r12], %r11
	ldx	[%r9], %r11
	setx	0xd8647b91c508b674, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
!	data_array 0 = 0x000000fca8f12fd0 , rd_cntr = 47, wr_cntr = 47
!	data_array 1 = 0x000000c61bf8c728 , rd_cntr = 47, wr_cntr = 47
!	data_array 2 = 0x000000800f4500e8 , rd_cntr = 47, wr_cntr = 47
!	data_array 3 = 0x000000800f6160c8 , rd_cntr = 47, wr_cntr = 47
	setx	0x000000fca8dab218, %r1, %r9
	setx	0xb63a80db97f2e94d, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000fa61ec0d08, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800f6160c8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800f4500e8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000c61bf8c728, %r1, %r12
	ldx	[%r12], %r11
	ldx	[%r9], %r11
	setx	0xb63a80db97f2e94d, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
!	data_array 0 = 0x000000fca8f12fd0 , rd_cntr = 48, wr_cntr = 48
!	data_array 1 = 0x000000c61bf8c728 , rd_cntr = 48, wr_cntr = 48
!	data_array 2 = 0x000000800f4500e8 , rd_cntr = 48, wr_cntr = 48
!	data_array 3 = 0x000000800f6160c8 , rd_cntr = 48, wr_cntr = 48
	setx	0x000000c7ab783b18, %r1, %r9
	setx	0xe55e8a80d6bdbc1d, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800e8a9dd0, %r1, %r12
	setx	0xcb07c9dcc8383e20, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000f0228cfef8, %r1, %r12
	setx	0x61d327ab2ddd0360, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000800f0e41d0, %r1, %r12
	setx	0x24f0eb6c0c800dc7, %r1, %r13
	stx	%r13, [%r12]
	ldx	[%r9], %r11
	setx	0xe55e8a80d6bdbc1d, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
!	data_array 0 = 0x000000c7ab783b18 , rd_cntr = 49, wr_cntr = 49
!	data_array 1 = 0x000000c61bf8c728 , rd_cntr = 49, wr_cntr = 49
!	data_array 2 = 0x000000800f4500e8 , rd_cntr = 49, wr_cntr = 49
!	data_array 3 = 0x000000800f6160c8 , rd_cntr = 49, wr_cntr = 49
	setx	0x000000800e44de30, %r1, %r9
	setx	0x89f3ac330392fa09, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800fd92f10, %r1, %r12
	setx	0x24f0eb6c0c800dc7, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000800e44de30, %r1, %r12
	ldx	[%r12], %r11
	ldx	[%r9], %r11
	setx	0x89f3ac330392fa09, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
!	data_array 0 = 0x000000c7ab783b18 , rd_cntr = 50, wr_cntr = 50
!	data_array 1 = 0x000000800e44de30 , rd_cntr = 50, wr_cntr = 50
!	data_array 2 = 0x000000800f4500e8 , rd_cntr = 50, wr_cntr = 50
!	data_array 3 = 0x000000800f6160c8 , rd_cntr = 50, wr_cntr = 50
	setx	0x000000fce755bf00, %r1, %r9
	setx	0xfdbcabf41daababe, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000fce755bf00, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e44de30, %r1, %r12
	ldx	[%r12], %r11
	ldx	[%r9], %r11
	setx	0xfdbcabf41daababe, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
!	data_array 0 = 0x000000c7ab783b18 , rd_cntr = 51, wr_cntr = 51
!	data_array 1 = 0x000000800e44de30 , rd_cntr = 51, wr_cntr = 51
!	data_array 2 = 0x000000fce755bf00 , rd_cntr = 51, wr_cntr = 51
!	data_array 3 = 0x000000800f6160c8 , rd_cntr = 51, wr_cntr = 51
	setx	0x000000fc8890bd38, %r1, %r9
	setx	0x5b700845727eb5b0, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000fc8890bd38, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000fce755bf00, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e44de30, %r1, %r12
	ldx	[%r12], %r11
	ldx	[%r9], %r11
	setx	0x5b700845727eb5b0, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
!	data_array 0 = 0x000000c7ab783b18 , rd_cntr = 52, wr_cntr = 52
!	data_array 1 = 0x000000800e44de30 , rd_cntr = 52, wr_cntr = 52
!	data_array 2 = 0x000000fce755bf00 , rd_cntr = 52, wr_cntr = 52
!	data_array 3 = 0x000000fc8890bd38 , rd_cntr = 52, wr_cntr = 52
	setx	0x000000800ef1cdf0, %r1, %r9
	setx	0xbee577eabb357dce, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f5de218, %r1, %r12
	setx	0x24f0eb6c0c800dc7, %r1, %r13
	stx	%r13, [%r12]
	ldx	[%r9], %r11
	setx	0xbee577eabb357dce, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
!	data_array 0 = 0x000000c7ab783b18 , rd_cntr = 53, wr_cntr = 53
!	data_array 1 = 0x000000800e44de30 , rd_cntr = 53, wr_cntr = 53
!	data_array 2 = 0x000000fce755bf00 , rd_cntr = 53, wr_cntr = 53
!	data_array 3 = 0x000000fc8890bd38 , rd_cntr = 53, wr_cntr = 53
	setx	0x000000f0abc19728, %r1, %r9
	setx	0x7dd020a328b48794, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000fc8890bd38, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000fce755bf00, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e44de30, %r1, %r12
	ldx	[%r12], %r11
	ldx	[%r9], %r11
	setx	0x7dd020a328b48794, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
!	data_array 0 = 0x000000c7ab783b18 , rd_cntr = 54, wr_cntr = 54
!	data_array 1 = 0x000000800e44de30 , rd_cntr = 54, wr_cntr = 54
!	data_array 2 = 0x000000fce755bf00 , rd_cntr = 54, wr_cntr = 54
!	data_array 3 = 0x000000fc8890bd38 , rd_cntr = 54, wr_cntr = 54
	setx	0x000000c622de9268, %r1, %r9
	setx	0x23898bdecd68ae42, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800eef3388, %r1, %r12
	setx	0xcb07c9dcc8383e20, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000800eef3388, %r1, %r12
	setx	0xcb07c9dcc8383e20, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000e48f822318, %r1, %r12
	setx	0xdc1550dec3f7a95e, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000800e44de30, %r1, %r12
	ldx	[%r12], %r11
	ldx	[%r9], %r11
	setx	0x23898bdecd68ae42, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
!	data_array 0 = 0x000000c7ab783b18 , rd_cntr = 55, wr_cntr = 55
!	data_array 1 = 0x000000800e44de30 , rd_cntr = 55, wr_cntr = 55
!	data_array 2 = 0x000000fce755bf00 , rd_cntr = 55, wr_cntr = 55
!	data_array 3 = 0x000000fc8890bd38 , rd_cntr = 55, wr_cntr = 55
	setx	0x000000de412bf608, %r1, %r9
	setx	0x55697a2626657910, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f0b496dc60, %r1, %r12
	setx	0x61d327ab2ddd0360, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000800e80a480, %r1, %r12
	setx	0xcb07c9dcc8383e20, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000c4a9656598, %r1, %r12
	setx	0xa09b135fa620d13a, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000e9fa4415b8, %r1, %r12
	setx	0xa0a96998313bee65, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000fce755bf00, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e44de30, %r1, %r12
	ldx	[%r12], %r11
	ldx	[%r9], %r11
	setx	0x55697a2626657910, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
!	data_array 0 = 0x000000c7ab783b18 , rd_cntr = 56, wr_cntr = 56
!	data_array 1 = 0x000000800e44de30 , rd_cntr = 56, wr_cntr = 56
!	data_array 2 = 0x000000fce755bf00 , rd_cntr = 56, wr_cntr = 56
!	data_array 3 = 0x000000fc8890bd38 , rd_cntr = 56, wr_cntr = 56
	setx	0x000000fc8bf335c8, %r1, %r9
	setx	0xf0d4624a47cfc90a, %r1, %r10
	stx	%r10, [%r9]
	ldx	[%r9], %r11
	setx	0xf0d4624a47cfc90a, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
!	data_array 0 = 0x000000fc8bf335c8 , rd_cntr = 57, wr_cntr = 57
!	data_array 1 = 0x000000800e44de30 , rd_cntr = 57, wr_cntr = 57
!	data_array 2 = 0x000000fce755bf00 , rd_cntr = 57, wr_cntr = 57
!	data_array 3 = 0x000000fc8890bd38 , rd_cntr = 57, wr_cntr = 57
	setx	0x000000f2fd8bff38, %r1, %r9
	setx	0xed7dbe8c48dcceb3, %r1, %r10
	stx	%r10, [%r9]
	ldx	[%r9], %r11
	setx	0xed7dbe8c48dcceb3, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
!	data_array 0 = 0x000000fc8bf335c8 , rd_cntr = 58, wr_cntr = 58
!	data_array 1 = 0x000000f2fd8bff38 , rd_cntr = 58, wr_cntr = 58
!	data_array 2 = 0x000000fce755bf00 , rd_cntr = 58, wr_cntr = 58
!	data_array 3 = 0x000000fc8890bd38 , rd_cntr = 58, wr_cntr = 58
	setx	0x000000800e2344e0, %r1, %r9
	setx	0x369e66c5d20b33bb, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800fdff708, %r1, %r12
	setx	0x24f0eb6c0c800dc7, %r1, %r13
	stx	%r13, [%r12]
	ldx	[%r9], %r11
	setx	0x369e66c5d20b33bb, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
!	data_array 0 = 0x000000fc8bf335c8 , rd_cntr = 59, wr_cntr = 59
!	data_array 1 = 0x000000f2fd8bff38 , rd_cntr = 59, wr_cntr = 59
!	data_array 2 = 0x000000800e2344e0 , rd_cntr = 59, wr_cntr = 59
!	data_array 3 = 0x000000fc8890bd38 , rd_cntr = 59, wr_cntr = 59
	setx	0x000000800e17ed80, %r1, %r9
	setx	0x277f88fe9867f54a, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d34bac7eb0, %r1, %r12
	setx	0x8bc2f3a2afaa4ac1, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000800e17ed80, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e2344e0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000f2fd8bff38, %r1, %r12
	ldx	[%r12], %r11
	ldx	[%r9], %r11
	setx	0x277f88fe9867f54a, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
!	data_array 0 = 0x000000fc8bf335c8 , rd_cntr = 60, wr_cntr = 60
!	data_array 1 = 0x000000f2fd8bff38 , rd_cntr = 60, wr_cntr = 60
!	data_array 2 = 0x000000800e2344e0 , rd_cntr = 60, wr_cntr = 60
!	data_array 3 = 0x000000800e17ed80 , rd_cntr = 60, wr_cntr = 60
	setx	0x000000800e963158, %r1, %r9
	setx	0x2d59307fbd430e7c, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f965ed0, %r1, %r12
	setx	0x24f0eb6c0c800dc7, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000800e2344e0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000f2fd8bff38, %r1, %r12
	ldx	[%r12], %r11
	ldx	[%r9], %r11
	setx	0x2d59307fbd430e7c, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
!	data_array 0 = 0x000000fc8bf335c8 , rd_cntr = 61, wr_cntr = 61
!	data_array 1 = 0x000000f2fd8bff38 , rd_cntr = 61, wr_cntr = 61
!	data_array 2 = 0x000000800e2344e0 , rd_cntr = 61, wr_cntr = 61
!	data_array 3 = 0x000000800e17ed80 , rd_cntr = 61, wr_cntr = 61
	setx	0x000000feb5ed2de0, %r1, %r9
	setx	0x0dbbbb49e41653c7, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f2fd8bff38, %r1, %r12
	ldx	[%r12], %r11
	ldx	[%r9], %r11
	setx	0x0dbbbb49e41653c7, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
!	data_array 0 = 0x000000fc8bf335c8 , rd_cntr = 62, wr_cntr = 62
!	data_array 1 = 0x000000f2fd8bff38 , rd_cntr = 62, wr_cntr = 62
!	data_array 2 = 0x000000800e2344e0 , rd_cntr = 62, wr_cntr = 62
!	data_array 3 = 0x000000800e17ed80 , rd_cntr = 62, wr_cntr = 62
	setx	0x000000800e10e6b0, %r1, %r9
	setx	0x4f07c179d006b07a, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ca1df7be80, %r1, %r12
	setx	0xa09b135fa620d13a, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000f2fd8bff38, %r1, %r12
	ldx	[%r12], %r11
	ldx	[%r9], %r11
	setx	0x4f07c179d006b07a, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
!	data_array 0 = 0x000000fc8bf335c8 , rd_cntr = 63, wr_cntr = 63
!	data_array 1 = 0x000000f2fd8bff38 , rd_cntr = 63, wr_cntr = 63
!	data_array 2 = 0x000000800e2344e0 , rd_cntr = 63, wr_cntr = 63
!	data_array 3 = 0x000000800e17ed80 , rd_cntr = 63, wr_cntr = 63
	setx	0x000000800f870c18, %r1, %r9
	setx	0xe7ec844f8035dfe5, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c3276a9270, %r1, %r12
	setx	0xa09b135fa620d13a, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000f0f7907d50, %r1, %r12
	setx	0x61d327ab2ddd0360, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000800f870c18, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e10e6b0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000feb5ed2de0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e963158, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e17ed80, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e2344e0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000f2fd8bff38, %r1, %r12
	ldx	[%r12], %r11
	ldx	[%r9], %r11
	setx	0xe7ec844f8035dfe5, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
!	data_array 0 = 0x000000fc8bf335c8 , rd_cntr = 64, wr_cntr = 64
!	data_array 1 = 0x000000f2fd8bff38 , rd_cntr = 64, wr_cntr = 64
!	data_array 2 = 0x000000800e2344e0 , rd_cntr = 64, wr_cntr = 64
!	data_array 3 = 0x000000800e17ed80 , rd_cntr = 64, wr_cntr = 64
	setx	0x000000dee95586a0, %r1, %r9
	setx	0x8ea6136a9cdbb12c, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f42797c330, %r1, %r12
	setx	0x61d327ab2ddd0360, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000efdf211158, %r1, %r12
	setx	0xa0a96998313bee65, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000c2ee494e18, %r1, %r12
	setx	0xa09b135fa620d13a, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000efdf211158, %r1, %r12
	setx	0xa0a96998313bee65, %r1, %r13
	stx	%r13, [%r12]
	ldx	[%r9], %r11
	setx	0x8ea6136a9cdbb12c, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
!	data_array 0 = 0x000000dee95586a0 , rd_cntr = 65, wr_cntr = 65
!	data_array 1 = 0x000000f2fd8bff38 , rd_cntr = 65, wr_cntr = 65
!	data_array 2 = 0x000000800e2344e0 , rd_cntr = 65, wr_cntr = 65
!	data_array 3 = 0x000000800e17ed80 , rd_cntr = 65, wr_cntr = 65
	setx	0x000000800ec16728, %r1, %r9
	setx	0xc1e48fac0b9eb91b, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ca141be628, %r1, %r12
	setx	0xa09b135fa620d13a, %r1, %r13
	stx	%r13, [%r12]
	ldx	[%r9], %r11
	setx	0xc1e48fac0b9eb91b, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
!	data_array 0 = 0x000000dee95586a0 , rd_cntr = 66, wr_cntr = 66
!	data_array 1 = 0x000000800ec16728 , rd_cntr = 66, wr_cntr = 66
!	data_array 2 = 0x000000800e2344e0 , rd_cntr = 66, wr_cntr = 66
!	data_array 3 = 0x000000800e17ed80 , rd_cntr = 66, wr_cntr = 66
	setx	0x000000800f4fa828, %r1, %r9
	setx	0x831aab504a7347d7, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000faa8232988, %r1, %r12
	setx	0x61d327ab2ddd0360, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000e3a5446638, %r1, %r12
	setx	0xdc1550dec3f7a95e, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000800f4fa828, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800ec16728, %r1, %r12
	ldx	[%r12], %r11
	ldx	[%r9], %r11
	setx	0x831aab504a7347d7, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
!	data_array 0 = 0x000000dee95586a0 , rd_cntr = 67, wr_cntr = 67
!	data_array 1 = 0x000000800ec16728 , rd_cntr = 67, wr_cntr = 67
!	data_array 2 = 0x000000800f4fa828 , rd_cntr = 67, wr_cntr = 67
!	data_array 3 = 0x000000800e17ed80 , rd_cntr = 67, wr_cntr = 67
	setx	0x000000cc20fe6458, %r1, %r9
	setx	0x57fea8a146d861c3, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d427d09098, %r1, %r12
	setx	0x8bc2f3a2afaa4ac1, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000d427d09098, %r1, %r12
	setx	0x8bc2f3a2afaa4ac1, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000800e2ea9d8, %r1, %r12
	setx	0xcb07c9dcc8383e20, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000cc20fe6458, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800f4fa828, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800ec16728, %r1, %r12
	ldx	[%r12], %r11
	ldx	[%r9], %r11
	setx	0x57fea8a146d861c3, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
!	data_array 0 = 0x000000dee95586a0 , rd_cntr = 68, wr_cntr = 68
!	data_array 1 = 0x000000800ec16728 , rd_cntr = 68, wr_cntr = 68
!	data_array 2 = 0x000000800f4fa828 , rd_cntr = 68, wr_cntr = 68
!	data_array 3 = 0x000000cc20fe6458 , rd_cntr = 68, wr_cntr = 68
	setx	0x000000800efbe870, %r1, %r9
	setx	0xf5d67becd19e022b, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800faaece0, %r1, %r12
	setx	0x24f0eb6c0c800dc7, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000800ec16728, %r1, %r12
	ldx	[%r12], %r11
	ldx	[%r9], %r11
	setx	0xf5d67becd19e022b, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
!	data_array 0 = 0x000000dee95586a0 , rd_cntr = 69, wr_cntr = 69
!	data_array 1 = 0x000000800ec16728 , rd_cntr = 69, wr_cntr = 69
!	data_array 2 = 0x000000800f4fa828 , rd_cntr = 69, wr_cntr = 69
!	data_array 3 = 0x000000cc20fe6458 , rd_cntr = 69, wr_cntr = 69
	setx	0x000000800ef178d8, %r1, %r9
	setx	0xe35821961dc4b537, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d39eb57330, %r1, %r12
	setx	0x8bc2f3a2afaa4ac1, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000800ec16728, %r1, %r12
	ldx	[%r12], %r11
	ldx	[%r9], %r11
	setx	0xe35821961dc4b537, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
!	data_array 0 = 0x000000dee95586a0 , rd_cntr = 70, wr_cntr = 70
!	data_array 1 = 0x000000800ec16728 , rd_cntr = 70, wr_cntr = 70
!	data_array 2 = 0x000000800f4fa828 , rd_cntr = 70, wr_cntr = 70
!	data_array 3 = 0x000000cc20fe6458 , rd_cntr = 70, wr_cntr = 70
	setx	0x000000f46b65ab68, %r1, %r9
	setx	0x1c22792d1e5655c0, %r1, %r10
	stx	%r10, [%r9]
	ldx	[%r9], %r11
	setx	0x1c22792d1e5655c0, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
!	data_array 0 = 0x000000dee95586a0 , rd_cntr = 71, wr_cntr = 71
!	data_array 1 = 0x000000800ec16728 , rd_cntr = 71, wr_cntr = 71
!	data_array 2 = 0x000000800f4fa828 , rd_cntr = 71, wr_cntr = 71
!	data_array 3 = 0x000000cc20fe6458 , rd_cntr = 71, wr_cntr = 71
	setx	0x000000800fb20700, %r1, %r9
	setx	0xff602025c8b20457, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800ec98ea8, %r1, %r12
	setx	0xcb07c9dcc8383e20, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000ec5c269e58, %r1, %r12
	setx	0xdc1550dec3f7a95e, %r1, %r13
	stx	%r13, [%r12]
	ldx	[%r9], %r11
	setx	0xff602025c8b20457, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
!	data_array 0 = 0x000000dee95586a0 , rd_cntr = 72, wr_cntr = 72
!	data_array 1 = 0x000000800ec16728 , rd_cntr = 72, wr_cntr = 72
!	data_array 2 = 0x000000800f4fa828 , rd_cntr = 72, wr_cntr = 72
!	data_array 3 = 0x000000cc20fe6458 , rd_cntr = 72, wr_cntr = 72
	setx	0x000000d35e69bbc0, %r1, %r9
	setx	0x1719ce8ab879d2b0, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800fa38008, %r1, %r12
	setx	0x24f0eb6c0c800dc7, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000800e8e52d0, %r1, %r12
	setx	0xcb07c9dcc8383e20, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000e2d2f20a68, %r1, %r12
	setx	0xa0a96998313bee65, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000800fa38008, %r1, %r12
	setx	0x24f0eb6c0c800dc7, %r1, %r13
	stx	%r13, [%r12]
	ldx	[%r9], %r11
	setx	0x1719ce8ab879d2b0, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
!	data_array 0 = 0x000000d35e69bbc0 , rd_cntr = 73, wr_cntr = 73
!	data_array 1 = 0x000000800ec16728 , rd_cntr = 73, wr_cntr = 73
!	data_array 2 = 0x000000800f4fa828 , rd_cntr = 73, wr_cntr = 73
!	data_array 3 = 0x000000cc20fe6458 , rd_cntr = 73, wr_cntr = 73
	setx	0x000000f8312585a0, %r1, %r9
	setx	0x0f87d0479cb53735, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f8312585a0, %r1, %r12
	ldx	[%r12], %r11
	ldx	[%r9], %r11
	setx	0x0f87d0479cb53735, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
!	data_array 0 = 0x000000d35e69bbc0 , rd_cntr = 74, wr_cntr = 74
!	data_array 1 = 0x000000f8312585a0 , rd_cntr = 74, wr_cntr = 74
!	data_array 2 = 0x000000800f4fa828 , rd_cntr = 74, wr_cntr = 74
!	data_array 3 = 0x000000cc20fe6458 , rd_cntr = 74, wr_cntr = 74
	setx	0x000000f62d83d7e0, %r1, %r9
	setx	0x580b4617a9a7f4b8, %r1, %r10
	stx	%r10, [%r9]
	ldx	[%r9], %r11
	setx	0x580b4617a9a7f4b8, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
!	data_array 0 = 0x000000d35e69bbc0 , rd_cntr = 75, wr_cntr = 75
!	data_array 1 = 0x000000f8312585a0 , rd_cntr = 75, wr_cntr = 75
!	data_array 2 = 0x000000f62d83d7e0 , rd_cntr = 75, wr_cntr = 75
!	data_array 3 = 0x000000cc20fe6458 , rd_cntr = 75, wr_cntr = 75
	setx	0x000000800f8166a0, %r1, %r9
	setx	0xb7ab819b21d07fd3, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c64c0fcba0, %r1, %r12
	setx	0xa09b135fa620d13a, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000ed86ec8ea8, %r1, %r12
	setx	0xdc1550dec3f7a95e, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000f62d83d7e0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000f8312585a0, %r1, %r12
	ldx	[%r12], %r11
	ldx	[%r9], %r11
	setx	0xb7ab819b21d07fd3, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
!	data_array 0 = 0x000000d35e69bbc0 , rd_cntr = 76, wr_cntr = 76
!	data_array 1 = 0x000000f8312585a0 , rd_cntr = 76, wr_cntr = 76
!	data_array 2 = 0x000000f62d83d7e0 , rd_cntr = 76, wr_cntr = 76
!	data_array 3 = 0x000000800f8166a0 , rd_cntr = 76, wr_cntr = 76
	setx	0x000000d6e44fa0e0, %r1, %r9
	setx	0x761f3a2a01a9802b, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f69e442d88, %r1, %r12
	setx	0x61d327ab2ddd0360, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000e709261608, %r1, %r12
	setx	0xa0a96998313bee65, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000c1d9468710, %r1, %r12
	setx	0xa09b135fa620d13a, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000f69e442d88, %r1, %r12
	setx	0x61d327ab2ddd0360, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000800f8166a0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000f62d83d7e0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000f8312585a0, %r1, %r12
	ldx	[%r12], %r11
	ldx	[%r9], %r11
	setx	0x761f3a2a01a9802b, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
!	data_array 0 = 0x000000d35e69bbc0 , rd_cntr = 77, wr_cntr = 77
!	data_array 1 = 0x000000f8312585a0 , rd_cntr = 77, wr_cntr = 77
!	data_array 2 = 0x000000f62d83d7e0 , rd_cntr = 77, wr_cntr = 77
!	data_array 3 = 0x000000800f8166a0 , rd_cntr = 77, wr_cntr = 77
	setx	0x000000800ef9c010, %r1, %r9
	setx	0x1bcc198171dbb37d, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000fc682b99b0, %r1, %r12
	setx	0x61d327ab2ddd0360, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000800ef9c010, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000d6e44fa0e0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800f8166a0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000f62d83d7e0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000f8312585a0, %r1, %r12
	ldx	[%r12], %r11
	ldx	[%r9], %r11
	setx	0x1bcc198171dbb37d, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
!	data_array 0 = 0x000000d35e69bbc0 , rd_cntr = 78, wr_cntr = 78
!	data_array 1 = 0x000000f8312585a0 , rd_cntr = 78, wr_cntr = 78
!	data_array 2 = 0x000000f62d83d7e0 , rd_cntr = 78, wr_cntr = 78
!	data_array 3 = 0x000000800f8166a0 , rd_cntr = 78, wr_cntr = 78
	setx	0x000000800fe1b030, %r1, %r9
	setx	0x3b12fe2ae0a93678, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d6b3e02370, %r1, %r12
	setx	0x8bc2f3a2afaa4ac1, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000e89cd3ebd8, %r1, %r12
	setx	0xa0a96998313bee65, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000f8312585a0, %r1, %r12
	ldx	[%r12], %r11
	ldx	[%r9], %r11
	setx	0x3b12fe2ae0a93678, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
!	data_array 0 = 0x000000d35e69bbc0 , rd_cntr = 79, wr_cntr = 79
!	data_array 1 = 0x000000f8312585a0 , rd_cntr = 79, wr_cntr = 79
!	data_array 2 = 0x000000f62d83d7e0 , rd_cntr = 79, wr_cntr = 79
!	data_array 3 = 0x000000800f8166a0 , rd_cntr = 79, wr_cntr = 79
	setx	0x000000de3916a1b0, %r1, %r9
	setx	0x14b15696771c63b0, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f46d799f78, %r1, %r12
	setx	0x61d327ab2ddd0360, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000f46d799f78, %r1, %r12
	setx	0x61d327ab2ddd0360, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000f46d799f78, %r1, %r12
	setx	0x61d327ab2ddd0360, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000800f0502d0, %r1, %r12
	setx	0x24f0eb6c0c800dc7, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000d6e44fa0e0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800f8166a0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000f62d83d7e0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000f8312585a0, %r1, %r12
	ldx	[%r12], %r11
	ldx	[%r9], %r11
	setx	0x14b15696771c63b0, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
!	data_array 0 = 0x000000d35e69bbc0 , rd_cntr = 80, wr_cntr = 80
!	data_array 1 = 0x000000f8312585a0 , rd_cntr = 80, wr_cntr = 80
!	data_array 2 = 0x000000f62d83d7e0 , rd_cntr = 80, wr_cntr = 80
!	data_array 3 = 0x000000800f8166a0 , rd_cntr = 80, wr_cntr = 80
	setx	0x000000f87b0bf340, %r1, %r9
	setx	0xe594fa4cac0d7045, %r1, %r10
	stx	%r10, [%r9]
	ldx	[%r9], %r11
	setx	0xe594fa4cac0d7045, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
!	data_array 0 = 0x000000f87b0bf340 , rd_cntr = 81, wr_cntr = 81
!	data_array 1 = 0x000000f8312585a0 , rd_cntr = 81, wr_cntr = 81
!	data_array 2 = 0x000000f62d83d7e0 , rd_cntr = 81, wr_cntr = 81
!	data_array 3 = 0x000000800f8166a0 , rd_cntr = 81, wr_cntr = 81
	setx	0x000000f6bd584ad0, %r1, %r9
	setx	0x47fdf850fb9cece2, %r1, %r10
	stx	%r10, [%r9]
	ldx	[%r9], %r11
	setx	0x47fdf850fb9cece2, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
!	data_array 0 = 0x000000f87b0bf340 , rd_cntr = 82, wr_cntr = 82
!	data_array 1 = 0x000000f6bd584ad0 , rd_cntr = 82, wr_cntr = 82
!	data_array 2 = 0x000000f62d83d7e0 , rd_cntr = 82, wr_cntr = 82
!	data_array 3 = 0x000000800f8166a0 , rd_cntr = 82, wr_cntr = 82
	setx	0x000000c791581270, %r1, %r9
	setx	0xdd47f301510a07e5, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f63013af60, %r1, %r12
	setx	0x61d327ab2ddd0360, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000800ee918d8, %r1, %r12
	setx	0xcb07c9dcc8383e20, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000eda4ca72c8, %r1, %r12
	setx	0xa0a96998313bee65, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000c791581270, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000f6bd584ad0, %r1, %r12
	ldx	[%r12], %r11
	ldx	[%r9], %r11
	setx	0xdd47f301510a07e5, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
!	data_array 0 = 0x000000f87b0bf340 , rd_cntr = 83, wr_cntr = 83
!	data_array 1 = 0x000000f6bd584ad0 , rd_cntr = 83, wr_cntr = 83
!	data_array 2 = 0x000000c791581270 , rd_cntr = 83, wr_cntr = 83
!	data_array 3 = 0x000000800f8166a0 , rd_cntr = 83, wr_cntr = 83
	setx	0x000000800f3cf210, %r1, %r9
	setx	0x802deb4c558d4326, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f249617510, %r1, %r12
	setx	0x61d327ab2ddd0360, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000ea14760480, %r1, %r12
	setx	0xa0a96998313bee65, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000800f3cf210, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000c791581270, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000f6bd584ad0, %r1, %r12
	ldx	[%r12], %r11
	ldx	[%r9], %r11
	setx	0x802deb4c558d4326, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
!	data_array 0 = 0x000000f87b0bf340 , rd_cntr = 84, wr_cntr = 84
!	data_array 1 = 0x000000f6bd584ad0 , rd_cntr = 84, wr_cntr = 84
!	data_array 2 = 0x000000c791581270 , rd_cntr = 84, wr_cntr = 84
!	data_array 3 = 0x000000800f3cf210 , rd_cntr = 84, wr_cntr = 84
	setx	0x000000f8f8a05600, %r1, %r9
	setx	0xb8e41659bfe5c105, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c791581270, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000f6bd584ad0, %r1, %r12
	ldx	[%r12], %r11
	ldx	[%r9], %r11
	setx	0xb8e41659bfe5c105, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
!	data_array 0 = 0x000000f87b0bf340 , rd_cntr = 85, wr_cntr = 85
!	data_array 1 = 0x000000f6bd584ad0 , rd_cntr = 85, wr_cntr = 85
!	data_array 2 = 0x000000c791581270 , rd_cntr = 85, wr_cntr = 85
!	data_array 3 = 0x000000800f3cf210 , rd_cntr = 85, wr_cntr = 85
	setx	0x000000800fcb7458, %r1, %r9
	setx	0x30459028528105ce, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f46c82ffa8, %r1, %r12
	setx	0x61d327ab2ddd0360, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000df2e26d248, %r1, %r12
	setx	0x8bc2f3a2afaa4ac1, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000c791581270, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000f6bd584ad0, %r1, %r12
	ldx	[%r12], %r11
	ldx	[%r9], %r11
	setx	0x30459028528105ce, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
!	data_array 0 = 0x000000f87b0bf340 , rd_cntr = 86, wr_cntr = 86
!	data_array 1 = 0x000000f6bd584ad0 , rd_cntr = 86, wr_cntr = 86
!	data_array 2 = 0x000000c791581270 , rd_cntr = 86, wr_cntr = 86
!	data_array 3 = 0x000000800f3cf210 , rd_cntr = 86, wr_cntr = 86
	setx	0x000000800eb84aa8, %r1, %r9
	setx	0xa397bed92d0a6088, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d83673e778, %r1, %r12
	setx	0x8bc2f3a2afaa4ac1, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000800eb84aa8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800fcb7458, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000f8f8a05600, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800f3cf210, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000c791581270, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000f6bd584ad0, %r1, %r12
	ldx	[%r12], %r11
	ldx	[%r9], %r11
	setx	0xa397bed92d0a6088, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
!	data_array 0 = 0x000000f87b0bf340 , rd_cntr = 87, wr_cntr = 87
!	data_array 1 = 0x000000f6bd584ad0 , rd_cntr = 87, wr_cntr = 87
!	data_array 2 = 0x000000c791581270 , rd_cntr = 87, wr_cntr = 87
!	data_array 3 = 0x000000800f3cf210 , rd_cntr = 87, wr_cntr = 87
	setx	0x000000fee9537c40, %r1, %r9
	setx	0x924e240c9c03d90a, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f3cf210, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000c791581270, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000f6bd584ad0, %r1, %r12
	ldx	[%r12], %r11
	ldx	[%r9], %r11
	setx	0x924e240c9c03d90a, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
!	data_array 0 = 0x000000f87b0bf340 , rd_cntr = 88, wr_cntr = 88
!	data_array 1 = 0x000000f6bd584ad0 , rd_cntr = 88, wr_cntr = 88
!	data_array 2 = 0x000000c791581270 , rd_cntr = 88, wr_cntr = 88
!	data_array 3 = 0x000000800f3cf210 , rd_cntr = 88, wr_cntr = 88
	setx	0x000000fc25a872a8, %r1, %r9
	setx	0x5068490026ca9501, %r1, %r10
	stx	%r10, [%r9]
	ldx	[%r9], %r11
	setx	0x5068490026ca9501, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
!	data_array 0 = 0x000000fc25a872a8 , rd_cntr = 89, wr_cntr = 89
!	data_array 1 = 0x000000f6bd584ad0 , rd_cntr = 89, wr_cntr = 89
!	data_array 2 = 0x000000c791581270 , rd_cntr = 89, wr_cntr = 89
!	data_array 3 = 0x000000800f3cf210 , rd_cntr = 89, wr_cntr = 89
	setx	0x000000fadbba7cd0, %r1, %r9
	setx	0x6c3ff2aa56cd4262, %r1, %r10
	stx	%r10, [%r9]
	ldx	[%r9], %r11
	setx	0x6c3ff2aa56cd4262, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
!	data_array 0 = 0x000000fc25a872a8 , rd_cntr = 90, wr_cntr = 90
!	data_array 1 = 0x000000fadbba7cd0 , rd_cntr = 90, wr_cntr = 90
!	data_array 2 = 0x000000c791581270 , rd_cntr = 90, wr_cntr = 90
!	data_array 3 = 0x000000800f3cf210 , rd_cntr = 90, wr_cntr = 90
	setx	0x000000800fc1d2e0, %r1, %r9
	setx	0x990fbcd9d4559591, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f49f507e40, %r1, %r12
	setx	0x61d327ab2ddd0360, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000f49f507e40, %r1, %r12
	setx	0x61d327ab2ddd0360, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000fadbba7cd0, %r1, %r12
	ldx	[%r12], %r11
	ldx	[%r9], %r11
	setx	0x990fbcd9d4559591, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
!	data_array 0 = 0x000000fc25a872a8 , rd_cntr = 91, wr_cntr = 91
!	data_array 1 = 0x000000fadbba7cd0 , rd_cntr = 91, wr_cntr = 91
!	data_array 2 = 0x000000800fc1d2e0 , rd_cntr = 91, wr_cntr = 91
!	data_array 3 = 0x000000800f3cf210 , rd_cntr = 91, wr_cntr = 91
	setx	0x000000c9d95290f8, %r1, %r9
	setx	0x2012140fe284a4c2, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800e8bac48, %r1, %r12
	setx	0xcb07c9dcc8383e20, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000800e8bac48, %r1, %r12
	setx	0xcb07c9dcc8383e20, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000800f213bd0, %r1, %r12
	setx	0x24f0eb6c0c800dc7, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000c9d95290f8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800fc1d2e0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000fadbba7cd0, %r1, %r12
	ldx	[%r12], %r11
	ldx	[%r9], %r11
	setx	0x2012140fe284a4c2, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
!	data_array 0 = 0x000000fc25a872a8 , rd_cntr = 92, wr_cntr = 92
!	data_array 1 = 0x000000fadbba7cd0 , rd_cntr = 92, wr_cntr = 92
!	data_array 2 = 0x000000800fc1d2e0 , rd_cntr = 92, wr_cntr = 92
!	data_array 3 = 0x000000c9d95290f8 , rd_cntr = 92, wr_cntr = 92
	setx	0x000000800e26ce00, %r1, %r9
	setx	0x29978ff14a567650, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f1197a8, %r1, %r12
	setx	0x24f0eb6c0c800dc7, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000fadbba7cd0, %r1, %r12
	ldx	[%r12], %r11
	ldx	[%r9], %r11
	setx	0x29978ff14a567650, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
!	data_array 0 = 0x000000fc25a872a8 , rd_cntr = 93, wr_cntr = 93
!	data_array 1 = 0x000000fadbba7cd0 , rd_cntr = 93, wr_cntr = 93
!	data_array 2 = 0x000000800fc1d2e0 , rd_cntr = 93, wr_cntr = 93
!	data_array 3 = 0x000000c9d95290f8 , rd_cntr = 93, wr_cntr = 93
	setx	0x000000f662244da0, %r1, %r9
	setx	0x82fef88eb858913f, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c9d95290f8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800fc1d2e0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000fadbba7cd0, %r1, %r12
	ldx	[%r12], %r11
	ldx	[%r9], %r11
	setx	0x82fef88eb858913f, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
!	data_array 0 = 0x000000fc25a872a8 , rd_cntr = 94, wr_cntr = 94
!	data_array 1 = 0x000000fadbba7cd0 , rd_cntr = 94, wr_cntr = 94
!	data_array 2 = 0x000000800fc1d2e0 , rd_cntr = 94, wr_cntr = 94
!	data_array 3 = 0x000000c9d95290f8 , rd_cntr = 94, wr_cntr = 94
	setx	0x000000fe206eaff8, %r1, %r9
	setx	0xb8d68bca7d8e1529, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800fc1d2e0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000fadbba7cd0, %r1, %r12
	ldx	[%r12], %r11
	ldx	[%r9], %r11
	setx	0xb8d68bca7d8e1529, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
!	data_array 0 = 0x000000fc25a872a8 , rd_cntr = 95, wr_cntr = 95
!	data_array 1 = 0x000000fadbba7cd0 , rd_cntr = 95, wr_cntr = 95
!	data_array 2 = 0x000000800fc1d2e0 , rd_cntr = 95, wr_cntr = 95
!	data_array 3 = 0x000000c9d95290f8 , rd_cntr = 95, wr_cntr = 95
	setx	0x000000800f41bba0, %r1, %r9
	setx	0xfcc7b4a14b28033b, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800e642a70, %r1, %r12
	setx	0xcb07c9dcc8383e20, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000e01cc6ca08, %r1, %r12
	setx	0xa0a96998313bee65, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000c9d95290f8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800fc1d2e0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000fadbba7cd0, %r1, %r12
	ldx	[%r12], %r11
	ldx	[%r9], %r11
	setx	0xfcc7b4a14b28033b, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
!	data_array 0 = 0x000000fc25a872a8 , rd_cntr = 96, wr_cntr = 96
!	data_array 1 = 0x000000fadbba7cd0 , rd_cntr = 96, wr_cntr = 96
!	data_array 2 = 0x000000800fc1d2e0 , rd_cntr = 96, wr_cntr = 96
!	data_array 3 = 0x000000c9d95290f8 , rd_cntr = 96, wr_cntr = 96
	setx	0x000000fe28fb0f20, %r1, %r9
	setx	0xc956bfa41d575470, %r1, %r10
	stx	%r10, [%r9]
	ldx	[%r9], %r11
	setx	0xc956bfa41d575470, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
!	data_array 0 = 0x000000fe28fb0f20 , rd_cntr = 97, wr_cntr = 97
!	data_array 1 = 0x000000fadbba7cd0 , rd_cntr = 97, wr_cntr = 97
!	data_array 2 = 0x000000800fc1d2e0 , rd_cntr = 97, wr_cntr = 97
!	data_array 3 = 0x000000c9d95290f8 , rd_cntr = 97, wr_cntr = 97
	setx	0x000000cd5a084028, %r1, %r9
	setx	0x7d2ff67e933724d8, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800fb9ffc8, %r1, %r12
	setx	0x24f0eb6c0c800dc7, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000d1cb0c9f48, %r1, %r12
	setx	0x8bc2f3a2afaa4ac1, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000ed9a20b798, %r1, %r12
	setx	0xff06c9b5be9f3f39, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000cd5a084028, %r1, %r12
	ldx	[%r12], %r11
	ldx	[%r9], %r11
	setx	0x7d2ff67e933724d8, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
!	data_array 0 = 0x000000fe28fb0f20 , rd_cntr = 98, wr_cntr = 98
!	data_array 1 = 0x000000cd5a084028 , rd_cntr = 98, wr_cntr = 98
!	data_array 2 = 0x000000800fc1d2e0 , rd_cntr = 98, wr_cntr = 98
!	data_array 3 = 0x000000c9d95290f8 , rd_cntr = 98, wr_cntr = 98
	setx	0x000000f650ec2f50, %r1, %r9
	setx	0x85ced734a42ae1a5, %r1, %r10
	stx	%r10, [%r9]
	ldx	[%r9], %r11
	setx	0x85ced734a42ae1a5, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
!	data_array 0 = 0x000000fe28fb0f20 , rd_cntr = 99, wr_cntr = 99
!	data_array 1 = 0x000000cd5a084028 , rd_cntr = 99, wr_cntr = 99
!	data_array 2 = 0x000000f650ec2f50 , rd_cntr = 99, wr_cntr = 99
!	data_array 3 = 0x000000c9d95290f8 , rd_cntr = 99, wr_cntr = 99
	setx	0x000000f29de6df98, %r1, %r9
	setx	0x6299b561bf1fd61b, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f29de6df98, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000f650ec2f50, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000cd5a084028, %r1, %r12
	ldx	[%r12], %r11
	ldx	[%r9], %r11
	setx	0x6299b561bf1fd61b, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
!	data_array 0 = 0x000000fe28fb0f20 , rd_cntr = 100, wr_cntr = 100
!	data_array 1 = 0x000000cd5a084028 , rd_cntr = 100, wr_cntr = 100
!	data_array 2 = 0x000000f650ec2f50 , rd_cntr = 100, wr_cntr = 100
!	data_array 3 = 0x000000f29de6df98 , rd_cntr = 100, wr_cntr = 100
	setx	0x000000d1f696f580, %r1, %r9
	setx	0xc4be4534f1e7e7f0, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c7681106d0, %r1, %r12
	setx	0xa09b135fa620d13a, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000fedb2ca910, %r1, %r12
	setx	0x61d327ab2ddd0360, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000fedb2ca910, %r1, %r12
	setx	0x61d327ab2ddd0360, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000eda9a34c50, %r1, %r12
	setx	0xa0a96998313bee65, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000cd5a084028, %r1, %r12
	ldx	[%r12], %r11
	ldx	[%r9], %r11
	setx	0xc4be4534f1e7e7f0, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
!	data_array 0 = 0x000000fe28fb0f20 , rd_cntr = 101, wr_cntr = 101
!	data_array 1 = 0x000000cd5a084028 , rd_cntr = 101, wr_cntr = 101
!	data_array 2 = 0x000000f650ec2f50 , rd_cntr = 101, wr_cntr = 101
!	data_array 3 = 0x000000f29de6df98 , rd_cntr = 101, wr_cntr = 101


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
!!#   uint64 ADDR_ARRAY[12000];
!!#   uint64 data_st = 0;
!!#   uint64 noise_data_st = 0;
!!#   uint64 data_ld = 0;
!!#   int wr_cntr = 0;
!!#   int rd_cntr = 0;
!!#   int a_addr_sel = 0;
!!#   int a_wr_cntr = 0;
!!#   int a_rd_cntr = 0;
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
!!#   IJ_set_rvar ("diag.j", 80, rv_0, "{11}");
!!# 
!!#   IJ_set_rvar ("diag.j", 83, Rv_rand64, "64'hrrrr rrrr rrrr rrrr");
!!#   IJ_set_rvar ("diag.j", 84, Rv_Simm13, "13'b0 0000 00rr r000");
!!#   IJ_set_rvar ("diag.j", 85, Rv_addr_sel, "3'brrr");
!!# 
!!#   IJ_set_rvar ("diag.j", 89, Rv_memaddr_pattern_dma,
!!#         "24'{0},"
!!# 
!!#         "20'b 000r rrrr rrrr rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rr00 0000,");
!!# 
!!#   ! only 60* or 61*
!!#   IJ_set_rvar ("diag.j", 98, Rv_memaddr_pattern_io,
!!#         "4'{0},"
!!# 
!!#         "20'b 0000 0000 0000 0000 0110,"
!!#         "20'b 000r rrrr rrrr rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rr00 0000,");
!!# 
!!#   IJ_set_rvar ("diag.j", 107, Rv_rand32, "32'hrrrr rrrr");
!!#   IJ_set_rvar ("diag.j", 108, Rv_rand_mask, "32'h0000 rrrr");
!!# 
!!#   ! Define address patterns for all the various address
!!#   ! spaces in JBI
!!# 
!!#   ! 80_1000_0000 - 80_FFFF_FFFF (Should not be 80_0*)
!!#   IJ_set_rvar ("diag.j", 114, Rv_jbiaddr_pattern0,
!!#         "24'{0},"
!!# 
!!#         "20'b 1000 rrr1 rrrr rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr r000,");
!!# 
!!#   ! 80_0E00_0000 - 80_0EFF_FFFF
!!#   IJ_set_rvar ("diag.j", 123, Rv_jbiaddr_pattern1,
!!#         "24'{0},"
!!# 
!!#         "20'b 1000 0000 0000 1110 rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr r000,");
!!# 
!!#   ! 80_0F00_0000 - 80_0FFF_FFFF
!!#   IJ_set_rvar ("diag.j", 133, Rv_jbiaddr_pattern2,
!!#         "24'{0},"
!!# 
!!#         "20'b 1000 0000 0000 1111 rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr r000,");
!!# 
!!#   ! C0_0000_0000 - CF_FFFF_FFFF
!!#   IJ_set_rvar ("diag.j", 143, Rv_jbiaddr_pattern3,
!!#         "24'{0},"
!!# 
!!#         "20'b 1100 rrrr rrrr rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr r000,");
!!# 
!!#   ! D0_0000_0000 - DF_FFFF_FFFF
!!#   IJ_set_rvar ("diag.j", 153, Rv_jbiaddr_pattern4,
!!#         "24'{0},"
!!# 
!!#         "20'b 1101 rrrr rrrr rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr r000,");
!!# 
!!#   ! E0_0000_0000 - EF_FFFF_FFFF
!!#   IJ_set_rvar ("diag.j", 163, Rv_jbiaddr_pattern5,
!!#         "24'{0},"
!!# 
!!#         "20'b 1110 rrrr rrrr rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr r000,");
!!# 
!!#   ! F0_0000_0000 - FE_FFFF_FFFF ( Should not be FF*)
!!#   IJ_set_rvar ("diag.j", 173, Rv_jbiaddr_pattern6,
!!#         "24'{0},"
!!# 
!!#         "20'b 1111 rrr0 rrrr rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr r000,");
!!# 
!!#   ! FF_F000_0000 - FF_FFFF_FFFF 
!!#   IJ_set_rvar ("diag.j", 183, Rv_ssiaddr_pattern,
!!#         "24'{0},"
!!# 
!!#         "20'b 1111 1111 1111 rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr r000,");
!!# 
!!#   IJ_set_ropr_fld    ("diag.j", 191, ijdefault, Ft_Rs1, "{9}");  ! BASE
!!#   IJ_set_ropr_fld    ("diag.j", 192, ijdefault, Ft_Rs2, "{8}");
!!#   IJ_set_ropr_fld    ("diag.j", 193, ijdefault, Ft_Rd, "{16..23}");
!!# 
!!#   !IJ_set_ropr_fld    (ijdefault, Ft_Simm13, "13'b0 0000 0000 0000");
!!#   IJ_set_ropr_fld    ("diag.j", 196, ijdefault, Ft_Simm13, "13'b0 00rr 0000 0000");
!!# 
!!#   IJ_bind_file_group("diag.j", 200, sjm_4,"sjm_4.cmd", NULL);;
!!#   IJ_bind_file_group("diag.j", 201, sjm_5,"sjm_5.cmd", NULL);;
!!# 
!!#   IJ_bind_thread_group("diag.j", 204, th_M, 0x1);
!!# 
!!#   IJ_printf ("diag.j", 206, sjm_4, "CONFIG id=28 iosyncadr=0x7CF00BEEF00\n");
!!#   IJ_printf ("diag.j", 207, sjm_4, "TIMEOUT 10000000\n");
!!#   IJ_printf ("diag.j", 208, sjm_4, "IOSYNC\n");
!!# 
!!#   IJ_printf ("diag.j", 210, sjm_4, "#==================================================\n");
!!#   IJ_printf ("diag.j", 212, sjm_4, "#==================================================\n");
!!# 
!!#   IJ_printf ("diag.j", 214, sjm_5, "CONFIG id=30 iosyncadr=0x7EF00BEEF00\n");
!!#   IJ_printf ("diag.j", 215, sjm_5, "TIMEOUT 10000000\n");
!!#   IJ_printf ("diag.j", 216, sjm_5, "IOSYNC\n");
!!#   IJ_printf ("diag.j", 217, sjm_5, "#==================================================\n");
!!#   IJ_printf ("diag.j", 219, sjm_5, "#==================================================\n");
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
!!#   IJ_th_start ("diag.j", 237,Seq_Start, NULL, 2);
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
!!# 		IJ_generate ("diag.j", 365, th_M, $2);
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
!!#                    IJ_printf ("diag.j", 392, sjm_4, "\n");
!!#                      sjm4_cnt++;
!!# 
!!#                      sj4_ad =  IJ_get_rvar_val64("diag.j", 395, Rv_memaddr_pattern_dma);
!!#                      sjm0_addr[sjm_wr0] = sj4_ad; 
!!#                      IJ_printf ("diag.j", 397, sjm_4, "WRITEBLK  0x%016llx +\n",sj4_ad);
!!#                      IJ_update_rvar("diag.j", 398, Rv_memaddr_pattern_dma);
!!# 
!!#                       for (i=0;i<16;i++) { 
!!#                          !IJ_printf (sjm_4, "# debug %d \n",i);
!!#                          sjm0_data[sjm_wr0][i] = IJ_get_rvar_val32("diag.j", 402, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 403, Rv_rand32);
!!#                          if (i%4 == 0) {IJ_printf ("diag.j", 404, sjm_4, "        "); }
!!#                          IJ_printf ("diag.j", 405, sjm_4, "0x%08x ",sjm0_data[sjm_wr0][i]);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 407, sjm_4, "\n"); else 
!!#                             IJ_printf ("diag.j", 408, sjm_4, "+\n");
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
!!#                    IJ_printf ("diag.j", 421, sjm_4, "\n");
!!#                      sjm4_cnt--;
!!# 
!!#                      sj4_ad = sjm0_addr[sjm_rd0];
!!#                      IJ_printf ("diag.j", 426, sjm_4, "READBLK  0x%016llx +\n",sj4_ad);
!!# 
!!#                       for (i=0;i<16;i++) { 
!!#                          sjm4_dat = sjm0_data[sjm_rd0][i];
!!#                          if (i%4 == 0) IJ_printf ("diag.j", 430, sjm_4, "        ");
!!#                          IJ_printf ("diag.j", 431, sjm_4, "0x%08x ",sjm4_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 433, sjm_4, "\n"); else 
!!#                             IJ_printf ("diag.j", 434, sjm_4, "+\n");
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
!!#                    IJ_printf ("diag.j", 448, sjm_4, "\n");
!!#                      !sjm4_cnt--;
!!# 
!!#  		     sjm0_w_mask =  IJ_get_rvar_val32("diag.j", 452, Rv_rand_mask);
!!#                      IJ_update_rvar("diag.j", 453, Rv_rand_mask);
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
!!#                      IJ_printf ("diag.j", 470, sjm_4, "WRITEMSK  0x%016llx 0x%016llx +\n",sj4_ad,mask);
!!# 
!!#                       m_tmp = sjm0_w_mask;
!!#                       for (i=0;i<16;i++) { 
!!#                        if (m_tmp & 0x1 ) {
!!#                          sjm0_data[sjm_rd0][i] = IJ_get_rvar_val32("diag.j", 475, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 476, Rv_rand32);
!!#                          sjm4_dat = sjm0_data[sjm_rd0][i];
!!#                          if (i%4 == 0) IJ_printf ("diag.j", 478, sjm_4, "        ");
!!#                          IJ_printf ("diag.j", 479, sjm_4, "0x%08x ",sjm4_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 481, sjm_4, "\n"); else 
!!#                             IJ_printf ("diag.j", 482, sjm_4, "+\n");
!!#                            }
!!#                         } else {
!!#                          !sjm4_dat = sjm0_data[sjm_rd0][i];
!!#                          sjm4_dat = 0;
!!#                          if (i%4 == 0) IJ_printf ("diag.j", 487, sjm_4, "        ");
!!#                          IJ_printf ("diag.j", 488, sjm_4, "0x%08x ",sjm4_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 490, sjm_4, "\n"); else 
!!#                             IJ_printf ("diag.j", 491, sjm_4, "+\n");
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
!!#                    IJ_printf ("diag.j", 508, sjm_4, "\n");
!!#                      sjm4_cnt_io++;
!!# 
!!#                      sj4_ad =  IJ_get_rvar_val64("diag.j", 511, Rv_memaddr_pattern_io);
!!#                      sjm0_addr_io[sjm_wr0_io] = sj4_ad; 
!!#                      IJ_printf ("diag.j", 513, sjm_4, "WRITEBLKIO  0x%016llx +\n",sj4_ad);
!!#                      IJ_update_rvar("diag.j", 514, Rv_memaddr_pattern_io);
!!# 
!!#                       for (i=0;i<16;i++) { 
!!#                          !IJ_printf (sjm_4, "# debug %d \n",i);
!!#                          sjm0_data_io[sjm_wr0_io][i] = IJ_get_rvar_val32("diag.j", 518, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 519, Rv_rand32);
!!#                          if (i%4 == 0) {IJ_printf ("diag.j", 520, sjm_4, "        "); }
!!#                          IJ_printf ("diag.j", 521, sjm_4, "0x%08x ",sjm0_data_io[sjm_wr0_io][i]);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 523, sjm_4, "\n"); else 
!!#                             IJ_printf ("diag.j", 524, sjm_4, "+\n");
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
!!#                    IJ_printf ("diag.j", 537, sjm_4, "\n");
!!#                      sjm4_cnt_io--;
!!# 
!!#                      sj4_ad = sjm0_addr_io[sjm_rd0_io];
!!#                      IJ_printf ("diag.j", 542, sjm_4, "READBLKIO  0x%016llx +\n",sj4_ad);
!!# 
!!#                       for (i=0;i<16;i++) { 
!!#                          sjm4_dat = sjm0_data_io[sjm_rd0_io][i];
!!#                          if (i%4 == 0) IJ_printf ("diag.j", 546, sjm_4, "        ");
!!#                          IJ_printf ("diag.j", 547, sjm_4, "0x%08x ",sjm4_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 549, sjm_4, "\n"); else 
!!#                             IJ_printf ("diag.j", 550, sjm_4, "+\n");
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
!!#                    IJ_printf ("diag.j", 565, sjm_4, "\n");
!!#                      sjm4_cnt_io1++;
!!# 
!!#                      sj4_ad =  IJ_get_rvar_val64("diag.j", 568, Rv_memaddr_pattern_io);
!!#                      sjm0_addr_io1[sjm_wr0_io1] = sj4_ad; 
!!#                      IJ_printf ("diag.j", 570, sjm_4, "WRITEIO  0x%016llx ",sj4_ad);
!!#                      IJ_update_rvar("diag.j", 571, Rv_memaddr_pattern_io);
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
!!#                       IJ_printf ("diag.j", 586, sjm_4, "%d ",b_sz);
!!#                       for (i=0;i<4;i++) { 
!!#                          !IJ_printf (sjm_4, "# debug %d \n",i);
!!#                          sjm0_data_io1[sjm_wr0_io1][i] = IJ_get_rvar_val32("diag.j", 589, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 590, Rv_rand32);
!!#                          IJ_printf ("diag.j", 591, sjm_4, "0x%08x ",sjm0_data_io1[sjm_wr0_io1][i]);
!!#                          if((i==0) && ((b_sz == 1) | (b_sz == 2) | (b_sz == 4)) ) break; 
!!#                          if((i==1) && (b_sz == 8)) break; 
!!#                       }
!!#                       if ( random()%2 == 0) {
!!#                       IJ_printf ("diag.j", 596, sjm_4, "\n");
!!#                       } else {
!!#                       IJ_printf ("diag.j", 598, sjm_4, " \n");
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
!!#                    IJ_printf ("diag.j", 612, sjm_4, "\n");
!!#                      sjm4_cnt_io1--;
!!# 
!!#                      sj4_ad = sjm0_addr_io1[sjm_rd0_io1];
!!#                      b_sz   = sjm0_data_io1[sjm_rd0_io1][15];
!!#                      IJ_printf ("diag.j", 618, sjm_4, "READIO  0x%016llx %d ",sj4_ad,b_sz);
!!# 
!!#                       for (i=0;i<4;i++) {
!!#                          sjm4_dat = sjm0_data_io1[sjm_rd0_io1][i];
!!#                          IJ_printf ("diag.j", 622, sjm_4, "0x%08x ",sjm4_dat);
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
!!#                    IJ_printf ("diag.j", 637, sjm_4, "\n");
!!# 
!!#                      sj4_ad =  IJ_get_rvar_val64("diag.j", 639, Rv_memaddr_pattern_io);
!!#                      sjm0_addr_m_io[sjm_wr0_m_io] = sj4_ad; 
!!#                      IJ_update_rvar("diag.j", 641, Rv_memaddr_pattern_io);
!!# 
!!#                      sjm4_cnt_m_io++;
!!# 
!!#  		     sjm0_w_mask_m_io =  IJ_get_rvar_val32("diag.j", 647, Rv_rand_mask);
!!#                      IJ_update_rvar("diag.j", 648, Rv_rand_mask);
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
!!#                      IJ_printf ("diag.j", 675, sjm_4, "WRITEMSKIO  0x%016llx 0x%04x  ",sj4_ad,mask);
!!#                      sjm0_data_m_io[sjm_wr0_m_io][15] = mask; ! data fifo , 15 stores address
!!# 
!!#                       m_tmp = sjm0_w_mask_m_io & 0xf;
!!#                       for (i=0;i<4;i++) { 
!!#                        if (m_tmp & 0x1 ) {
!!#                          sjm0_data_m_io[sjm_wr0_m_io][i] = IJ_get_rvar_val32("diag.j", 681, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 682, Rv_rand32);
!!#                          sjm4_dat = sjm0_data_m_io[sjm_wr0_m_io][i];
!!#                          !if (i%4 == 0) IJ_printf (sjm_4, "        ");
!!#                          IJ_printf ("diag.j", 685, sjm_4, "0x%08x ",sjm4_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                              IJ_printf ("diag.j", 687, sjm_4, "\n"); 
!!#                             !if (i==15 ) IJ_printf (sjm_4, "\n"); else 
!!#                             !IJ_printf (sjm_4, "+\n");
!!#                            }
!!#                         } else {
!!#                          !sjm4_dat = sjm0_data[sjm_rd0][i];
!!#                          sjm4_dat = 0;
!!#                          sjm0_data_m_io[sjm_wr0_m_io][i] = sjm4_dat;
!!#                          !if (i%4 == 0) IJ_printf (sjm_4, "        ");
!!#                          IJ_printf ("diag.j", 696, sjm_4, "0x%08x ",sjm4_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             IJ_printf ("diag.j", 698, sjm_4, "\n"); 
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
!!#                    IJ_printf ("diag.j", 716, sjm_4, "\n");
!!#                      sjm4_cnt_m_io--;
!!# 
!!#                      sj4_ad = sjm0_addr_m_io[sjm_rd0_m_io];
!!#                      mask   = sjm0_data_m_io[sjm_rd0_m_io][15];
!!#                      IJ_printf ("diag.j", 722, sjm_4, "READMSKIO   0x%016llx 0x%04llx  ",sj4_ad,mask);
!!# 
!!#                       for (i=0;i<4;i++) { 
!!#                          sjm4_dat = sjm0_data_m_io[sjm_rd0_m_io][i];
!!#                          !if (i%4 == 0) IJ_printf (sjm_4, "        ");
!!#                          IJ_printf ("diag.j", 727, sjm_4, "0x%08x ",sjm4_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             IJ_printf ("diag.j", 729, sjm_4, "\n");
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
!!#                    IJ_printf ("diag.j", 747, sjm_5, "\n");
!!#                      sjm5_cnt++;
!!# 
!!#                      sj5_ad =  IJ_get_rvar_val64("diag.j", 750, Rv_memaddr_pattern_dma);
!!#                      sjm1_addr[sjm_wr1] = sj5_ad; 
!!#                      IJ_printf ("diag.j", 752, sjm_5, "WRITEBLK  0x%016llx +\n",sj5_ad);
!!#                      IJ_update_rvar("diag.j", 753, Rv_memaddr_pattern_dma);
!!# 
!!#                       for (i=0;i<16;i++) { 
!!#                          sjm1_data[sjm_wr1][i] = IJ_get_rvar_val32("diag.j", 756, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 757, Rv_rand32);
!!#                          if (i%4 == 0) IJ_printf ("diag.j", 758, sjm_5, "        ");
!!#                          IJ_printf ("diag.j", 759, sjm_5, "0x%08x ",sjm1_data[sjm_wr1][i]);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 761, sjm_5, "\n"); else 
!!#                             IJ_printf ("diag.j", 762, sjm_5, "+\n");
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
!!#                    IJ_printf ("diag.j", 775, sjm_5, "\n");
!!#                      sjm5_cnt--;
!!# 
!!#                      sj5_ad = sjm1_addr[sjm_rd1];
!!#                      IJ_printf ("diag.j", 780, sjm_5, "READBLK  0x%016llx +\n",sj5_ad);
!!# 
!!#                       for (i=0;i<16;i++) { 
!!#                          sjm5_dat = sjm1_data[sjm_rd1][i];
!!#                          if (i%4 == 0) IJ_printf ("diag.j", 784, sjm_5, "        ");
!!#                          IJ_printf ("diag.j", 785, sjm_5, "0x%08x ",sjm5_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 787, sjm_5, "\n"); else 
!!#                             IJ_printf ("diag.j", 788, sjm_5, "+\n");
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
!!#                    IJ_printf ("diag.j", 802, sjm_5, "\n");
!!#                      !sjm4_cnt--;
!!# 
!!#  		     sjm1_w_mask =  IJ_get_rvar_val32("diag.j", 806, Rv_rand_mask);
!!#                      IJ_update_rvar("diag.j", 807, Rv_rand_mask);
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
!!#                      IJ_printf ("diag.j", 824, sjm_5, "WRITEMSK  0x%016llx 0x%016llx +\n",sj5_ad,mask);
!!# 
!!#                       m_tmp = sjm1_w_mask;
!!#                       for (i=0;i<16;i++) { 
!!#                        if (m_tmp & 0x1 ) {
!!#                          sjm1_data[sjm_rd1][i] = IJ_get_rvar_val32("diag.j", 829, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 830, Rv_rand32);
!!#                          sjm5_dat = sjm1_data[sjm_rd1][i];
!!#                          if (i%4 == 0) IJ_printf ("diag.j", 832, sjm_5, "        ");
!!#                          IJ_printf ("diag.j", 833, sjm_5, "0x%08x ",sjm5_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 835, sjm_5, "\n"); else 
!!#                             IJ_printf ("diag.j", 836, sjm_5, "+\n");
!!#                            }
!!#                         } else {
!!#                          !sjm5_dat = sjm1_data[sjm_rd1][i];
!!#                          sjm5_dat = 0;
!!#                          if (i%4 == 0) IJ_printf ("diag.j", 841, sjm_5, "        ");
!!#                          IJ_printf ("diag.j", 842, sjm_5, "0x%08x ",sjm5_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 844, sjm_5, "\n"); else 
!!#                             IJ_printf ("diag.j", 845, sjm_5, "+\n");
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
!!#                    IJ_printf ("diag.j", 862, sjm_5, "\n");
!!#                      sjm5_cnt_io++;
!!# 
!!#                      sj5_ad =  IJ_get_rvar_val64("diag.j", 865, Rv_memaddr_pattern_io);
!!#                      sjm1_addr_io[sjm_wr1_io] = sj5_ad; 
!!#                      IJ_printf ("diag.j", 867, sjm_5, "WRITEBLKIO  0x%016llx +\n",sj5_ad);
!!#                      IJ_update_rvar("diag.j", 868, Rv_memaddr_pattern_io);
!!# 
!!#                       for (i=0;i<16;i++) { 
!!#                          !IJ_printf (sjm_5, "# debug %d \n",i);
!!#                          sjm1_data_io[sjm_wr1_io][i] = IJ_get_rvar_val32("diag.j", 872, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 873, Rv_rand32);
!!#                          if (i%4 == 0) {IJ_printf ("diag.j", 874, sjm_5, "        "); }
!!#                          IJ_printf ("diag.j", 875, sjm_5, "0x%08x ",sjm1_data_io[sjm_wr1_io][i]);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 877, sjm_5, "\n"); else 
!!#                             IJ_printf ("diag.j", 878, sjm_5, "+\n");
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
!!#                    IJ_printf ("diag.j", 891, sjm_5, "\n");
!!#                      sjm5_cnt_io--;
!!# 
!!#                      sj5_ad = sjm1_addr_io[sjm_rd1_io];
!!#                      IJ_printf ("diag.j", 896, sjm_5, "READBLKIO  0x%016llx +\n",sj5_ad);
!!# 
!!#                       for (i=0;i<16;i++) { 
!!#                          sjm5_dat = sjm1_data_io[sjm_rd1_io][i];
!!#                          if (i%4 == 0) IJ_printf ("diag.j", 900, sjm_5, "        ");
!!#                          IJ_printf ("diag.j", 901, sjm_5, "0x%08x ",sjm5_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 903, sjm_5, "\n"); else 
!!#                             IJ_printf ("diag.j", 904, sjm_5, "+\n");
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
!!#                    IJ_printf ("diag.j", 920, sjm_5, "\n");
!!#                      sjm5_cnt_io1++;
!!# 
!!#                      sj5_ad =  IJ_get_rvar_val64("diag.j", 923, Rv_memaddr_pattern_io);
!!#                      sjm1_addr_io1[sjm_wr1_io1] = sj5_ad; 
!!#                      IJ_printf ("diag.j", 925, sjm_5, "WRITEIO  0x%016llx ",sj5_ad);
!!#                      IJ_update_rvar("diag.j", 926, Rv_memaddr_pattern_io);
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
!!#                       IJ_printf ("diag.j", 941, sjm_5, "%d ",b_sz);
!!#                       for (i=0;i<4;i++) { 
!!#                          !IJ_printf (sjm_5, "# debug %d \n",i);
!!#                          sjm1_data_io1[sjm_wr1_io1][i] = IJ_get_rvar_val32("diag.j", 944, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 945, Rv_rand32);
!!#                          IJ_printf ("diag.j", 946, sjm_5, "0x%08x ",sjm1_data_io1[sjm_wr1_io1][i]);
!!#                          if((i==0) && ((b_sz == 1) | (b_sz == 2) | (b_sz == 4)) ) break; 
!!#                          if((i==1) && (b_sz == 8)) break; 
!!#                       }
!!#                       if ( random()%2 == 0) {
!!#                       IJ_printf ("diag.j", 951, sjm_5, "\n");
!!#                       } else {
!!#                       IJ_printf ("diag.j", 953, sjm_5, " \n");
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
!!#                    IJ_printf ("diag.j", 967, sjm_5, "\n");
!!#                      sjm5_cnt_io1--;
!!# 
!!#                      sj5_ad = sjm1_addr_io1[sjm_rd1_io1];
!!#                      b_sz   = sjm1_data_io1[sjm_rd1_io1][15];
!!#                      IJ_printf ("diag.j", 973, sjm_5, "READIO  0x%016llx %d ",sj5_ad,b_sz);
!!# 
!!#                       for (i=0;i<4;i++) {
!!#                          sjm5_dat = sjm1_data_io1[sjm_rd1_io1][i];
!!#                          IJ_printf ("diag.j", 977, sjm_5, "0x%08x ",sjm5_dat);
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
!!#                    IJ_printf ("diag.j", 991, sjm_5, "\n");
!!# 
!!#                      sj5_ad =  IJ_get_rvar_val64("diag.j", 993, Rv_memaddr_pattern_io);
!!#                      sjm1_addr_m_io[sjm_wr1_m_io] = sj5_ad; 
!!#                      IJ_update_rvar("diag.j", 995, Rv_memaddr_pattern_io);
!!# 
!!#                      sjm5_cnt_m_io++;
!!# 
!!#  		     sjm1_w_mask_m_io =  IJ_get_rvar_val32("diag.j", 1001, Rv_rand_mask);
!!#                      IJ_update_rvar("diag.j", 1002, Rv_rand_mask);
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
!!#                      IJ_printf ("diag.j", 1029, sjm_5, "WRITEMSKIO  0x%016llx 0x%04x  ",sj5_ad,mask);
!!#                      sjm1_data_m_io[sjm_wr1_m_io][15] = mask; ! data fifo , 15 stores address
!!# 
!!#                       m_tmp = sjm1_w_mask_m_io & 0xf;
!!#                       for (i=0;i<4;i++) { 
!!#                        if (m_tmp & 0x1 ) {
!!#                          sjm1_data_m_io[sjm_wr1_m_io][i] = IJ_get_rvar_val32("diag.j", 1035, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 1036, Rv_rand32);
!!#                          sjm5_dat = sjm1_data_m_io[sjm_wr1_m_io][i];
!!#                          !if (i%4 == 0) IJ_printf (sjm_5, "        ");
!!#                          IJ_printf ("diag.j", 1039, sjm_5, "0x%08x ",sjm5_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                              IJ_printf ("diag.j", 1041, sjm_5, "\n"); 
!!#                             !if (i==15 ) IJ_printf (sjm_5, "\n"); else 
!!#                             !IJ_printf (sjm_5, "+\n");
!!#                            }
!!#                         } else {
!!#                          !sjm5_dat = sjm1_data[sjm_rd1][i];
!!#                          sjm5_dat = 0;
!!#                          sjm1_data_m_io[sjm_wr1_m_io][i] = sjm5_dat;
!!#                          !if (i%4 == 0) IJ_printf (sjm_5, "        ");
!!#                          IJ_printf ("diag.j", 1050, sjm_5, "0x%08x ",sjm5_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             IJ_printf ("diag.j", 1052, sjm_5, "\n"); 
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
!!#                    IJ_printf ("diag.j", 1070, sjm_5, "\n");
!!#                      sjm5_cnt_m_io--;
!!# 
!!#                      sj5_ad = sjm1_addr_m_io[sjm_rd1_m_io];
!!#                      mask   = sjm1_data_m_io[sjm_rd1_m_io][15];
!!#                      IJ_printf ("diag.j", 1076, sjm_5, "READMSKIO   0x%016llx 0x%04llx  ",sj5_ad,mask);
!!# 
!!#                       for (i=0;i<4;i++) { 
!!#                          sjm5_dat = sjm1_data_m_io[sjm_rd1_m_io][i];
!!#                          !if (i%4 == 0) IJ_printf (sjm_5, "        ");
!!#                          IJ_printf ("diag.j", 1081, sjm_5, "0x%08x ",sjm5_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             IJ_printf ("diag.j", 1083, sjm_5, "\n");
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
!!#                         jbi1 = IJ_get_rvar_val64("diag.j", 1103, Rv_jbiaddr_pattern1);
!!#                         jbi2 = IJ_get_rvar_val64("diag.j", 1104, Rv_jbiaddr_pattern2);
!!#                         jbi3 = IJ_get_rvar_val64("diag.j", 1105, Rv_jbiaddr_pattern3);
!!#                         jbi4 = IJ_get_rvar_val64("diag.j", 1106, Rv_jbiaddr_pattern4);
!!#                         jbi5 = IJ_get_rvar_val64("diag.j", 1107, Rv_jbiaddr_pattern5);
!!#                         jbi6 = IJ_get_rvar_val64("diag.j", 1108, Rv_jbiaddr_pattern6);
!!# 			IJ_update_rvar("diag.j", 1109, Rv_jbiaddr_pattern1);
!!# 			IJ_update_rvar("diag.j", 1110, Rv_jbiaddr_pattern2);
!!# 			IJ_update_rvar("diag.j", 1111, Rv_jbiaddr_pattern3);
!!# 			IJ_update_rvar("diag.j", 1112, Rv_jbiaddr_pattern4);
!!# 			IJ_update_rvar("diag.j", 1113, Rv_jbiaddr_pattern5);
!!# 			IJ_update_rvar("diag.j", 1114, Rv_jbiaddr_pattern6);
!!# 
!!#                         addr_sel = random() % 5;
!!# 			IJ_update_rvar("diag.j", 1117, Rv_addr_sel);
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
!!# 
!!#                         ADDR_ARRAY[a_wr_cntr] = jbi_addr; a_wr_cntr = a_wr_cntr + 1; ! store the stx address
!!#                         if(a_wr_cntr > 7) { a_wr_cntr = 0; } 
!!# 
!!#                         IJ_printf ("diag.j", 1134, th_M, "\tsetx\t0x%016llx, %%r1, %%r9\n",
!!#                                 jbi_addr);
!!#                         !IJ_printf (th_M, "\tsetx\t0x%016llrx, %%r1, %%r9\n",
!!#                         !        Rv_jbiaddr_pattern1);
!!#                         ! data
!!# 	                ! printf ("!DEBUG: %d\n", wr_cntr); fflush(stdout);
!!# 
!!#                         DATA_ARRAY[wr_cntr] = IJ_get_rvar_val64("diag.j", 1141, Rv_rand64);
!!# 	                !IJ_printf (th_M, "!DEBUG: wr_cntr = %d,  %016llx\n",  wr_cntr , DATA_ARRAY[wr_cntr]);
!!# 			IJ_update_rvar("diag.j", 1143, Rv_rand64);
!!#                         data_st = DATA_ARRAY[wr_cntr];
!!#                         IJ_printf ("diag.j", 1145, th_M, "\tsetx\t0x%016llx, %%r1, %%r10\n",
!!#                                 data_st);
!!#                         IJ_printf ("diag.j", 1147, th_M, "\tstx\t%%r10, [%%r9]\n");
!!# 
!!#                         wr_cntr++;
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
!!#                         IJ_printf ("diag.j", 1173, th_M, "\tsetx\t0x%016llx, %%r1, %%r12\n",
!!#                                 jbi_addr);
!!#                         noise_data_st = DATA_ARRAY[addr_sel];
!!#                         IJ_printf ("diag.j", 1176, th_M, "\tsetx\t0x%016llx, %%r1, %%r13\n",
!!#                                 noise_data_st);
!!#                         IJ_printf ("diag.j", 1178, th_M, "\tstx\t%%r13, [%%r12]\n");
!!#                         rnd_cnt--;
!!#                         addr_sel = IJ_get_rvar_val64("diag.j", 1180, Rv_addr_sel);
!!# 			IJ_update_rvar("diag.j", 1181, Rv_addr_sel);
!!#                         }
!!# 
!!#                         ! EXTRA NOISE LDX
!!#                         a_addr_sel = random() %8;
!!#                         if(a_wr_cntr != 0 ) {
!!#                         while (a_addr_sel >= a_wr_cntr ) {
!!#                         a_addr_sel = random() %8;
!!# 	                !printf ("!DEBUG 3: a_addr_sel =  0x%016llx, a_wr_cntr = %d\n", a_addr_sel, a_wr_cntr); 
!!#                          }
!!#                         }
!!#                         rnd_cnt = a_addr_sel;
!!# 	                !printf ("!DEBUG 4: rnd_cnt =  0x%016llx, a_wr_cntr= %d\n", rnd_cnt,a_wr_cntr); 
!!#                         while(rnd_cnt > 0 ) {
!!#                         IJ_printf ("diag.j", 1195, th_M, "\tsetx\t0x%016llx, %%r1, %%r12\n",
!!#                                 ADDR_ARRAY[rnd_cnt]);
!!#                         IJ_printf ("diag.j", 1197, th_M, "\tldx\t[%%r12], %%r11\n");
!!#                         rnd_cnt--;
!!#                          }
!!# 
!!#                         data_ld = DATA_ARRAY[rd_cntr];
!!#                         rd_cntr++;
!!#                         IJ_printf ("diag.j", 1204, th_M, "\tldx\t[%%r9], %%r11\n");
!!#                         IJ_printf ("diag.j", 1205, th_M, "\tsetx\t0x%016llx, %%r1, %%r10\n",
!!#                                 data_ld);
!!#                         IJ_printf ("diag.j", 1207, th_M, "\tcmp\t%%r10, %%r11\n");
!!#                         IJ_printf ("diag.j", 1208, th_M, "\tbne h_bad_end\n");
!!#                         IJ_printf ("diag.j", 1209, th_M, "\tnop\n");
!!# 
!!#                         i=0;
!!#                         IJ_printf ("diag.j", 1212, th_M, "!\tdata_array %d = 0x%016llx , rd_cntr = %d, wr_cntr = %d\n", i,ADDR_ARRAY[i],rd_cntr, wr_cntr);
!!#                         i=1;
!!#                         IJ_printf ("diag.j", 1214, th_M, "!\tdata_array %d = 0x%016llx , rd_cntr = %d, wr_cntr = %d\n", i,ADDR_ARRAY[i],rd_cntr, wr_cntr);
!!#                         i=2;
!!#                         IJ_printf ("diag.j", 1216, th_M, "!\tdata_array %d = 0x%016llx , rd_cntr = %d, wr_cntr = %d\n", i,ADDR_ARRAY[i],rd_cntr, wr_cntr);
!!#                         i=3;
!!#                         IJ_printf ("diag.j", 1218, th_M, "!\tdata_array %d = 0x%016llx , rd_cntr = %d, wr_cntr = %d\n", i,ADDR_ARRAY[i],rd_cntr, wr_cntr);
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
