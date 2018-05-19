// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: pio_rnd_basic2_rand_1.s
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
   random seed:	788373969
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

	setx	0x000000ddc15ef178, %r1, %r9
	setx	0xf0df8ad7d9849426, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f29a7fa790, %r1, %r12
	setx	0xf0df8ad7d9849426, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000f29a7fa790, %r1, %r12
	setx	0xf0df8ad7d9849426, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000cbd2e4a138, %r1, %r12
	setx	0x0000000000000000, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000800f289dc0, %r1, %r12
	setx	0x0000000000000000, %r1, %r13
	stx	%r13, [%r12]
	ldx	[%r9], %r11
	setx	0xf0df8ad7d9849426, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
!	data_array 0 = 0x000000ddc15ef178 , rd_cntr = 1, wr_cntr = 1
!	data_array 1 = 0x0000000000000000 , rd_cntr = 1, wr_cntr = 1
!	data_array 2 = 0x0000000000000000 , rd_cntr = 1, wr_cntr = 1
!	data_array 3 = 0x0000000000000000 , rd_cntr = 1, wr_cntr = 1
	setx	0x000000f4a1106048, %r1, %r9
	setx	0x0f61191cdacd48db, %r1, %r10
	stx	%r10, [%r9]
	ldx	[%r9], %r11
	setx	0x0f61191cdacd48db, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
!	data_array 0 = 0x000000ddc15ef178 , rd_cntr = 2, wr_cntr = 2
!	data_array 1 = 0x000000f4a1106048 , rd_cntr = 2, wr_cntr = 2
!	data_array 2 = 0x0000000000000000 , rd_cntr = 2, wr_cntr = 2
!	data_array 3 = 0x0000000000000000 , rd_cntr = 2, wr_cntr = 2
	setx	0x000000800edcde00, %r1, %r9
	setx	0xc6a520c32589312c, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d5db65b908, %r1, %r12
	setx	0x0000000000000000, %r1, %r13
	stx	%r13, [%r12]
	ldx	[%r9], %r11
	setx	0xc6a520c32589312c, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
!	data_array 0 = 0x000000ddc15ef178 , rd_cntr = 3, wr_cntr = 3
!	data_array 1 = 0x000000f4a1106048 , rd_cntr = 3, wr_cntr = 3
!	data_array 2 = 0x000000800edcde00 , rd_cntr = 3, wr_cntr = 3
!	data_array 3 = 0x0000000000000000 , rd_cntr = 3, wr_cntr = 3
	setx	0x000000cbc7809278, %r1, %r9
	setx	0xc1ff420d3003b518, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f5c9898, %r1, %r12
	setx	0xc6a520c32589312c, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000800e1dedf0, %r1, %r12
	setx	0x0f61191cdacd48db, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000e3f039ae50, %r1, %r12
	setx	0x0000000000000000, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000800edcde00, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000f4a1106048, %r1, %r12
	ldx	[%r12], %r11
	ldx	[%r9], %r11
	setx	0xc1ff420d3003b518, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
!	data_array 0 = 0x000000ddc15ef178 , rd_cntr = 4, wr_cntr = 4
!	data_array 1 = 0x000000f4a1106048 , rd_cntr = 4, wr_cntr = 4
!	data_array 2 = 0x000000800edcde00 , rd_cntr = 4, wr_cntr = 4
!	data_array 3 = 0x000000cbc7809278 , rd_cntr = 4, wr_cntr = 4
	setx	0x000000f618905968, %r1, %r9
	setx	0x5b03c084e9b6d785, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f4a1106048, %r1, %r12
	ldx	[%r12], %r11
	ldx	[%r9], %r11
	setx	0x5b03c084e9b6d785, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
!	data_array 0 = 0x000000ddc15ef178 , rd_cntr = 5, wr_cntr = 5
!	data_array 1 = 0x000000f4a1106048 , rd_cntr = 5, wr_cntr = 5
!	data_array 2 = 0x000000800edcde00 , rd_cntr = 5, wr_cntr = 5
!	data_array 3 = 0x000000cbc7809278 , rd_cntr = 5, wr_cntr = 5
	setx	0x000000d1f8c4fa28, %r1, %r9
	setx	0x2d1fbe0e382ecc90, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f8ebd58588, %r1, %r12
	setx	0xf0df8ad7d9849426, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000800e68ea58, %r1, %r12
	setx	0x0f61191cdacd48db, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000e6a52991b0, %r1, %r12
	setx	0x0000000000000000, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000c123cab448, %r1, %r12
	setx	0xc1ff420d3003b518, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000800edcde00, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000f4a1106048, %r1, %r12
	ldx	[%r12], %r11
	ldx	[%r9], %r11
	setx	0x2d1fbe0e382ecc90, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
!	data_array 0 = 0x000000ddc15ef178 , rd_cntr = 6, wr_cntr = 6
!	data_array 1 = 0x000000f4a1106048 , rd_cntr = 6, wr_cntr = 6
!	data_array 2 = 0x000000800edcde00 , rd_cntr = 6, wr_cntr = 6
!	data_array 3 = 0x000000cbc7809278 , rd_cntr = 6, wr_cntr = 6
	setx	0x000000dff9fcf158, %r1, %r9
	setx	0x005b7a1cf545de24, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f63e74fc80, %r1, %r12
	setx	0xf0df8ad7d9849426, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000f63e74fc80, %r1, %r12
	setx	0xf0df8ad7d9849426, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000e89abf1138, %r1, %r12
	setx	0x0000000000000000, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000e89abf1138, %r1, %r12
	setx	0x005b7a1cf545de24, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000f618905968, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000cbc7809278, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800edcde00, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000f4a1106048, %r1, %r12
	ldx	[%r12], %r11
	ldx	[%r9], %r11
	setx	0x005b7a1cf545de24, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
!	data_array 0 = 0x000000ddc15ef178 , rd_cntr = 7, wr_cntr = 7
!	data_array 1 = 0x000000f4a1106048 , rd_cntr = 7, wr_cntr = 7
!	data_array 2 = 0x000000800edcde00 , rd_cntr = 7, wr_cntr = 7
!	data_array 3 = 0x000000cbc7809278 , rd_cntr = 7, wr_cntr = 7
	setx	0x000000800e0a42d0, %r1, %r9
	setx	0xf90b0efdc717e4d8, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f4d5cb0, %r1, %r12
	setx	0xc6a520c32589312c, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000f618905968, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000cbc7809278, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800edcde00, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000f4a1106048, %r1, %r12
	ldx	[%r12], %r11
	ldx	[%r9], %r11
	setx	0xf90b0efdc717e4d8, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
!	data_array 0 = 0x000000ddc15ef178 , rd_cntr = 8, wr_cntr = 8
!	data_array 1 = 0x000000f4a1106048 , rd_cntr = 8, wr_cntr = 8
!	data_array 2 = 0x000000800edcde00 , rd_cntr = 8, wr_cntr = 8
!	data_array 3 = 0x000000cbc7809278 , rd_cntr = 8, wr_cntr = 8
	setx	0x000000f28f193220, %r1, %r9
	setx	0xb49bdf8f92fb29cf, %r1, %r10
	stx	%r10, [%r9]
	ldx	[%r9], %r11
	setx	0xb49bdf8f92fb29cf, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
!	data_array 0 = 0x000000f28f193220 , rd_cntr = 9, wr_cntr = 9
!	data_array 1 = 0x000000f4a1106048 , rd_cntr = 9, wr_cntr = 9
!	data_array 2 = 0x000000800edcde00 , rd_cntr = 9, wr_cntr = 9
!	data_array 3 = 0x000000cbc7809278 , rd_cntr = 9, wr_cntr = 9
	setx	0x000000f4090da980, %r1, %r9
	setx	0xd714e5ddea5454d4, %r1, %r10
	stx	%r10, [%r9]
	ldx	[%r9], %r11
	setx	0xd714e5ddea5454d4, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
!	data_array 0 = 0x000000f28f193220 , rd_cntr = 10, wr_cntr = 10
!	data_array 1 = 0x000000f4090da980 , rd_cntr = 10, wr_cntr = 10
!	data_array 2 = 0x000000800edcde00 , rd_cntr = 10, wr_cntr = 10
!	data_array 3 = 0x000000cbc7809278 , rd_cntr = 10, wr_cntr = 10
	setx	0x000000800f7c03d0, %r1, %r9
	setx	0xd94a61cf2356899f, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000fef8f00768, %r1, %r12
	setx	0xf0df8ad7d9849426, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000fef8f00768, %r1, %r12
	setx	0xf0df8ad7d9849426, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000800f7c03d0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000f4090da980, %r1, %r12
	ldx	[%r12], %r11
	ldx	[%r9], %r11
	setx	0xd94a61cf2356899f, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
!	data_array 0 = 0x000000f28f193220 , rd_cntr = 11, wr_cntr = 11
!	data_array 1 = 0x000000f4090da980 , rd_cntr = 11, wr_cntr = 11
!	data_array 2 = 0x000000800f7c03d0 , rd_cntr = 11, wr_cntr = 11
!	data_array 3 = 0x000000cbc7809278 , rd_cntr = 11, wr_cntr = 11
	setx	0x000000800fe42790, %r1, %r9
	setx	0x837c8ab401ed7353, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d8056addd8, %r1, %r12
	setx	0x5b03c084e9b6d785, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000d8056addd8, %r1, %r12
	setx	0x5b03c084e9b6d785, %r1, %r13
	stx	%r13, [%r12]
	ldx	[%r9], %r11
	setx	0x837c8ab401ed7353, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
!	data_array 0 = 0x000000f28f193220 , rd_cntr = 12, wr_cntr = 12
!	data_array 1 = 0x000000f4090da980 , rd_cntr = 12, wr_cntr = 12
!	data_array 2 = 0x000000800f7c03d0 , rd_cntr = 12, wr_cntr = 12
!	data_array 3 = 0x000000800fe42790 , rd_cntr = 12, wr_cntr = 12
	setx	0x000000d7d9f22390, %r1, %r9
	setx	0xd7b075f0decef6eb, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f68b8c8, %r1, %r12
	setx	0xc6a520c32589312c, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000ec8ffe9400, %r1, %r12
	setx	0xf90b0efdc717e4d8, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000ec8ffe9400, %r1, %r12
	setx	0xf90b0efdc717e4d8, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000cbedd52bc8, %r1, %r12
	setx	0xc1ff420d3003b518, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000800f7c03d0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000f4090da980, %r1, %r12
	ldx	[%r12], %r11
	ldx	[%r9], %r11
	setx	0xd7b075f0decef6eb, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
!	data_array 0 = 0x000000f28f193220 , rd_cntr = 13, wr_cntr = 13
!	data_array 1 = 0x000000f4090da980 , rd_cntr = 13, wr_cntr = 13
!	data_array 2 = 0x000000800f7c03d0 , rd_cntr = 13, wr_cntr = 13
!	data_array 3 = 0x000000800fe42790 , rd_cntr = 13, wr_cntr = 13
	setx	0x000000ca07163358, %r1, %r9
	setx	0x5aa78fb2b3b14fbd, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000dd99501600, %r1, %r12
	setx	0x5b03c084e9b6d785, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000ea1c8269c8, %r1, %r12
	setx	0x2d1fbe0e382ecc90, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000dd99501600, %r1, %r12
	setx	0x5b03c084e9b6d785, %r1, %r13
	stx	%r13, [%r12]
	ldx	[%r9], %r11
	setx	0x5aa78fb2b3b14fbd, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
!	data_array 0 = 0x000000f28f193220 , rd_cntr = 14, wr_cntr = 14
!	data_array 1 = 0x000000f4090da980 , rd_cntr = 14, wr_cntr = 14
!	data_array 2 = 0x000000800f7c03d0 , rd_cntr = 14, wr_cntr = 14
!	data_array 3 = 0x000000800fe42790 , rd_cntr = 14, wr_cntr = 14
	setx	0x000000800fe9afe8, %r1, %r9
	setx	0x10723ae6093576b7, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800e9a8e88, %r1, %r12
	setx	0x0f61191cdacd48db, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000c25734ed08, %r1, %r12
	setx	0xc1ff420d3003b518, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000800fe42790, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800f7c03d0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000f4090da980, %r1, %r12
	ldx	[%r12], %r11
	ldx	[%r9], %r11
	setx	0x10723ae6093576b7, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
!	data_array 0 = 0x000000f28f193220 , rd_cntr = 15, wr_cntr = 15
!	data_array 1 = 0x000000f4090da980 , rd_cntr = 15, wr_cntr = 15
!	data_array 2 = 0x000000800f7c03d0 , rd_cntr = 15, wr_cntr = 15
!	data_array 3 = 0x000000800fe42790 , rd_cntr = 15, wr_cntr = 15
	setx	0x000000800e28a570, %r1, %r9
	setx	0x7f191f9b2859261f, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f293490, %r1, %r12
	setx	0xc6a520c32589312c, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000800fe9afe8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000ca07163358, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000d7d9f22390, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800fe42790, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800f7c03d0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000f4090da980, %r1, %r12
	ldx	[%r12], %r11
	ldx	[%r9], %r11
	setx	0x7f191f9b2859261f, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
!	data_array 0 = 0x000000f28f193220 , rd_cntr = 16, wr_cntr = 16
!	data_array 1 = 0x000000f4090da980 , rd_cntr = 16, wr_cntr = 16
!	data_array 2 = 0x000000800f7c03d0 , rd_cntr = 16, wr_cntr = 16
!	data_array 3 = 0x000000800fe42790 , rd_cntr = 16, wr_cntr = 16
	setx	0x000000d6368f1a88, %r1, %r9
	setx	0x896cd8c07f6966d2, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800e48d128, %r1, %r12
	setx	0x0f61191cdacd48db, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000e1d1208e88, %r1, %r12
	setx	0x2d1fbe0e382ecc90, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000800ff140e0, %r1, %r12
	setx	0xc6a520c32589312c, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000800ff140e0, %r1, %r12
	setx	0xc6a520c32589312c, %r1, %r13
	stx	%r13, [%r12]
	ldx	[%r9], %r11
	setx	0x896cd8c07f6966d2, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
!	data_array 0 = 0x000000d6368f1a88 , rd_cntr = 17, wr_cntr = 17
!	data_array 1 = 0x000000f4090da980 , rd_cntr = 17, wr_cntr = 17
!	data_array 2 = 0x000000800f7c03d0 , rd_cntr = 17, wr_cntr = 17
!	data_array 3 = 0x000000800fe42790 , rd_cntr = 17, wr_cntr = 17
	setx	0x000000db6780c258, %r1, %r9
	setx	0x25535b870fb8628c, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800eaf1a10, %r1, %r12
	setx	0x0f61191cdacd48db, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000800fa498b8, %r1, %r12
	setx	0xc6a520c32589312c, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000e53e3038c8, %r1, %r12
	setx	0xf90b0efdc717e4d8, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000e53e3038c8, %r1, %r12
	setx	0x2d1fbe0e382ecc90, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000db6780c258, %r1, %r12
	ldx	[%r12], %r11
	ldx	[%r9], %r11
	setx	0x25535b870fb8628c, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
!	data_array 0 = 0x000000d6368f1a88 , rd_cntr = 18, wr_cntr = 18
!	data_array 1 = 0x000000db6780c258 , rd_cntr = 18, wr_cntr = 18
!	data_array 2 = 0x000000800f7c03d0 , rd_cntr = 18, wr_cntr = 18
!	data_array 3 = 0x000000800fe42790 , rd_cntr = 18, wr_cntr = 18
	setx	0x000000de79d8f598, %r1, %r9
	setx	0xb1cd349a892cc0a3, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800fecad88, %r1, %r12
	setx	0xc6a520c32589312c, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000eec28c2d60, %r1, %r12
	setx	0x2d1fbe0e382ecc90, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000800e0b5920, %r1, %r12
	setx	0x0f61191cdacd48db, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000eec28c2d60, %r1, %r12
	setx	0x2d1fbe0e382ecc90, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000db6780c258, %r1, %r12
	ldx	[%r12], %r11
	ldx	[%r9], %r11
	setx	0xb1cd349a892cc0a3, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
!	data_array 0 = 0x000000d6368f1a88 , rd_cntr = 19, wr_cntr = 19
!	data_array 1 = 0x000000db6780c258 , rd_cntr = 19, wr_cntr = 19
!	data_array 2 = 0x000000de79d8f598 , rd_cntr = 19, wr_cntr = 19
!	data_array 3 = 0x000000800fe42790 , rd_cntr = 19, wr_cntr = 19
	setx	0x000000800f766768, %r1, %r9
	setx	0xdaba08a6214c52f1, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f2014a4490, %r1, %r12
	setx	0xf0df8ad7d9849426, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000e4f4dddee8, %r1, %r12
	setx	0x2d1fbe0e382ecc90, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000db6780c258, %r1, %r12
	ldx	[%r12], %r11
	ldx	[%r9], %r11
	setx	0xdaba08a6214c52f1, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
!	data_array 0 = 0x000000d6368f1a88 , rd_cntr = 20, wr_cntr = 20
!	data_array 1 = 0x000000db6780c258 , rd_cntr = 20, wr_cntr = 20
!	data_array 2 = 0x000000de79d8f598 , rd_cntr = 20, wr_cntr = 20
!	data_array 3 = 0x000000800f766768 , rd_cntr = 20, wr_cntr = 20
	setx	0x000000800f611c68, %r1, %r9
	setx	0xe0ae2ed8ea3a61ef, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800ea252d8, %r1, %r12
	setx	0x0f61191cdacd48db, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000c99d275318, %r1, %r12
	setx	0xc1ff420d3003b518, %r1, %r13
	stx	%r13, [%r12]
	ldx	[%r9], %r11
	setx	0xe0ae2ed8ea3a61ef, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
!	data_array 0 = 0x000000d6368f1a88 , rd_cntr = 21, wr_cntr = 21
!	data_array 1 = 0x000000db6780c258 , rd_cntr = 21, wr_cntr = 21
!	data_array 2 = 0x000000de79d8f598 , rd_cntr = 21, wr_cntr = 21
!	data_array 3 = 0x000000800f766768 , rd_cntr = 21, wr_cntr = 21
	setx	0x000000800ff2ec50, %r1, %r9
	setx	0x9cd1c2be1471044f, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c9810d4bc8, %r1, %r12
	setx	0xc1ff420d3003b518, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000800e072a48, %r1, %r12
	setx	0x0f61191cdacd48db, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000800f611c68, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800f766768, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000de79d8f598, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000db6780c258, %r1, %r12
	ldx	[%r12], %r11
	ldx	[%r9], %r11
	setx	0x9cd1c2be1471044f, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
!	data_array 0 = 0x000000d6368f1a88 , rd_cntr = 22, wr_cntr = 22
!	data_array 1 = 0x000000db6780c258 , rd_cntr = 22, wr_cntr = 22
!	data_array 2 = 0x000000de79d8f598 , rd_cntr = 22, wr_cntr = 22
!	data_array 3 = 0x000000800f766768 , rd_cntr = 22, wr_cntr = 22
	setx	0x000000d27307fef8, %r1, %r9
	setx	0xb10976d58b196461, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800ebcc7a0, %r1, %r12
	setx	0x0f61191cdacd48db, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000800ebcc7a0, %r1, %r12
	setx	0x0f61191cdacd48db, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000c928097fa0, %r1, %r12
	setx	0xc1ff420d3003b518, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000fe822b2ee8, %r1, %r12
	setx	0xf0df8ad7d9849426, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000d27307fef8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800ff2ec50, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800f611c68, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800f766768, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000de79d8f598, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000db6780c258, %r1, %r12
	ldx	[%r12], %r11
	ldx	[%r9], %r11
	setx	0xb10976d58b196461, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
!	data_array 0 = 0x000000d6368f1a88 , rd_cntr = 23, wr_cntr = 23
!	data_array 1 = 0x000000db6780c258 , rd_cntr = 23, wr_cntr = 23
!	data_array 2 = 0x000000de79d8f598 , rd_cntr = 23, wr_cntr = 23
!	data_array 3 = 0x000000800f766768 , rd_cntr = 23, wr_cntr = 23
	setx	0x000000800ff79f48, %r1, %r9
	setx	0x9950ed2cac2a7771, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800e16b2f0, %r1, %r12
	setx	0x0f61191cdacd48db, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000e1ebe74580, %r1, %r12
	setx	0xf90b0efdc717e4d8, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000800ff79f48, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000d27307fef8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800ff2ec50, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800f611c68, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800f766768, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000de79d8f598, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000db6780c258, %r1, %r12
	ldx	[%r12], %r11
	ldx	[%r9], %r11
	setx	0x9950ed2cac2a7771, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
!	data_array 0 = 0x000000d6368f1a88 , rd_cntr = 24, wr_cntr = 24
!	data_array 1 = 0x000000db6780c258 , rd_cntr = 24, wr_cntr = 24
!	data_array 2 = 0x000000de79d8f598 , rd_cntr = 24, wr_cntr = 24
!	data_array 3 = 0x000000800f766768 , rd_cntr = 24, wr_cntr = 24
	setx	0x000000fadb206790, %r1, %r9
	setx	0x453621a8d5007206, %r1, %r10
	stx	%r10, [%r9]
	ldx	[%r9], %r11
	setx	0x453621a8d5007206, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
!	data_array 0 = 0x000000fadb206790 , rd_cntr = 25, wr_cntr = 25
!	data_array 1 = 0x000000db6780c258 , rd_cntr = 25, wr_cntr = 25
!	data_array 2 = 0x000000de79d8f598 , rd_cntr = 25, wr_cntr = 25
!	data_array 3 = 0x000000800f766768 , rd_cntr = 25, wr_cntr = 25
	setx	0x000000f6fda29bf8, %r1, %r9
	setx	0x42cf2b0e76f264da, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f6fda29bf8, %r1, %r12
	ldx	[%r12], %r11
	ldx	[%r9], %r11
	setx	0x42cf2b0e76f264da, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
!	data_array 0 = 0x000000fadb206790 , rd_cntr = 26, wr_cntr = 26
!	data_array 1 = 0x000000f6fda29bf8 , rd_cntr = 26, wr_cntr = 26
!	data_array 2 = 0x000000de79d8f598 , rd_cntr = 26, wr_cntr = 26
!	data_array 3 = 0x000000800f766768 , rd_cntr = 26, wr_cntr = 26
	setx	0x000000f6de4b4680, %r1, %r9
	setx	0x06f2460a43ec4ad4, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f6de4b4680, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000f6fda29bf8, %r1, %r12
	ldx	[%r12], %r11
	ldx	[%r9], %r11
	setx	0x06f2460a43ec4ad4, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
!	data_array 0 = 0x000000fadb206790 , rd_cntr = 27, wr_cntr = 27
!	data_array 1 = 0x000000f6fda29bf8 , rd_cntr = 27, wr_cntr = 27
!	data_array 2 = 0x000000f6de4b4680 , rd_cntr = 27, wr_cntr = 27
!	data_array 3 = 0x000000800f766768 , rd_cntr = 27, wr_cntr = 27
	setx	0x000000fe13be77e8, %r1, %r9
	setx	0xa108b11d9684ae8c, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f6de4b4680, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000f6fda29bf8, %r1, %r12
	ldx	[%r12], %r11
	ldx	[%r9], %r11
	setx	0xa108b11d9684ae8c, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
!	data_array 0 = 0x000000fadb206790 , rd_cntr = 28, wr_cntr = 28
!	data_array 1 = 0x000000f6fda29bf8 , rd_cntr = 28, wr_cntr = 28
!	data_array 2 = 0x000000f6de4b4680 , rd_cntr = 28, wr_cntr = 28
!	data_array 3 = 0x000000fe13be77e8 , rd_cntr = 28, wr_cntr = 28
	setx	0x000000800f6c81e8, %r1, %r9
	setx	0x1b302d1f1a898071, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800efa07f8, %r1, %r12
	setx	0x0f61191cdacd48db, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000e6ee3cc708, %r1, %r12
	setx	0x005b7a1cf545de24, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000800f6c81e8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000fe13be77e8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000f6de4b4680, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000f6fda29bf8, %r1, %r12
	ldx	[%r12], %r11
	ldx	[%r9], %r11
	setx	0x1b302d1f1a898071, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
!	data_array 0 = 0x000000fadb206790 , rd_cntr = 29, wr_cntr = 29
!	data_array 1 = 0x000000f6fda29bf8 , rd_cntr = 29, wr_cntr = 29
!	data_array 2 = 0x000000f6de4b4680 , rd_cntr = 29, wr_cntr = 29
!	data_array 3 = 0x000000fe13be77e8 , rd_cntr = 29, wr_cntr = 29
	setx	0x000000f495eb4f48, %r1, %r9
	setx	0xe5be53b7ef046706, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f6fda29bf8, %r1, %r12
	ldx	[%r12], %r11
	ldx	[%r9], %r11
	setx	0xe5be53b7ef046706, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
!	data_array 0 = 0x000000fadb206790 , rd_cntr = 30, wr_cntr = 30
!	data_array 1 = 0x000000f6fda29bf8 , rd_cntr = 30, wr_cntr = 30
!	data_array 2 = 0x000000f6de4b4680 , rd_cntr = 30, wr_cntr = 30
!	data_array 3 = 0x000000fe13be77e8 , rd_cntr = 30, wr_cntr = 30
	setx	0x000000fee653c420, %r1, %r9
	setx	0x51c99ed48247d8ca, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f6de4b4680, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000f6fda29bf8, %r1, %r12
	ldx	[%r12], %r11
	ldx	[%r9], %r11
	setx	0x51c99ed48247d8ca, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
!	data_array 0 = 0x000000fadb206790 , rd_cntr = 31, wr_cntr = 31
!	data_array 1 = 0x000000f6fda29bf8 , rd_cntr = 31, wr_cntr = 31
!	data_array 2 = 0x000000f6de4b4680 , rd_cntr = 31, wr_cntr = 31
!	data_array 3 = 0x000000fe13be77e8 , rd_cntr = 31, wr_cntr = 31
	setx	0x000000800f7b0950, %r1, %r9
	setx	0x975dd364d7dbd606, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000fee73300c8, %r1, %r12
	setx	0xf0df8ad7d9849426, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000c7fa617460, %r1, %r12
	setx	0xc1ff420d3003b518, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000fe13be77e8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000f6de4b4680, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000f6fda29bf8, %r1, %r12
	ldx	[%r12], %r11
	ldx	[%r9], %r11
	setx	0x975dd364d7dbd606, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
!	data_array 0 = 0x000000fadb206790 , rd_cntr = 32, wr_cntr = 32
!	data_array 1 = 0x000000f6fda29bf8 , rd_cntr = 32, wr_cntr = 32
!	data_array 2 = 0x000000f6de4b4680 , rd_cntr = 32, wr_cntr = 32
!	data_array 3 = 0x000000fe13be77e8 , rd_cntr = 32, wr_cntr = 32
	setx	0x000000c7fc7cb928, %r1, %r9
	setx	0x271cd52583661a59, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d867478728, %r1, %r12
	setx	0x5b03c084e9b6d785, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000e676dec608, %r1, %r12
	setx	0x2d1fbe0e382ecc90, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000e676dec608, %r1, %r12
	setx	0x2d1fbe0e382ecc90, %r1, %r13
	stx	%r13, [%r12]
	ldx	[%r9], %r11
	setx	0x271cd52583661a59, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
!	data_array 0 = 0x000000c7fc7cb928 , rd_cntr = 33, wr_cntr = 33
!	data_array 1 = 0x000000f6fda29bf8 , rd_cntr = 33, wr_cntr = 33
!	data_array 2 = 0x000000f6de4b4680 , rd_cntr = 33, wr_cntr = 33
!	data_array 3 = 0x000000fe13be77e8 , rd_cntr = 33, wr_cntr = 33
	setx	0x000000800ed2ccc8, %r1, %r9
	setx	0x53179846c645c13f, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c8a50afa48, %r1, %r12
	setx	0xc1ff420d3003b518, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000800ed2ccc8, %r1, %r12
	ldx	[%r12], %r11
	ldx	[%r9], %r11
	setx	0x53179846c645c13f, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
!	data_array 0 = 0x000000c7fc7cb928 , rd_cntr = 34, wr_cntr = 34
!	data_array 1 = 0x000000800ed2ccc8 , rd_cntr = 34, wr_cntr = 34
!	data_array 2 = 0x000000f6de4b4680 , rd_cntr = 34, wr_cntr = 34
!	data_array 3 = 0x000000fe13be77e8 , rd_cntr = 34, wr_cntr = 34
	setx	0x000000800f8d88d0, %r1, %r9
	setx	0x5dcb0b50a84281ad, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800e262b98, %r1, %r12
	setx	0x0f61191cdacd48db, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000e2b51897f8, %r1, %r12
	setx	0x005b7a1cf545de24, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000800f8d88d0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800ed2ccc8, %r1, %r12
	ldx	[%r12], %r11
	ldx	[%r9], %r11
	setx	0x5dcb0b50a84281ad, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
!	data_array 0 = 0x000000c7fc7cb928 , rd_cntr = 35, wr_cntr = 35
!	data_array 1 = 0x000000800ed2ccc8 , rd_cntr = 35, wr_cntr = 35
!	data_array 2 = 0x000000800f8d88d0 , rd_cntr = 35, wr_cntr = 35
!	data_array 3 = 0x000000fe13be77e8 , rd_cntr = 35, wr_cntr = 35
	setx	0x000000800f7cb280, %r1, %r9
	setx	0x042b436ea31b8399, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800ed35a38, %r1, %r12
	setx	0x0f61191cdacd48db, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000e1a66e9960, %r1, %r12
	setx	0xf90b0efdc717e4d8, %r1, %r13
	stx	%r13, [%r12]
	ldx	[%r9], %r11
	setx	0x042b436ea31b8399, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
!	data_array 0 = 0x000000c7fc7cb928 , rd_cntr = 36, wr_cntr = 36
!	data_array 1 = 0x000000800ed2ccc8 , rd_cntr = 36, wr_cntr = 36
!	data_array 2 = 0x000000800f8d88d0 , rd_cntr = 36, wr_cntr = 36
!	data_array 3 = 0x000000800f7cb280 , rd_cntr = 36, wr_cntr = 36
	setx	0x000000800fd9f418, %r1, %r9
	setx	0xa40d4842a35d4d9a, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d481aeb3d0, %r1, %r12
	setx	0x5b03c084e9b6d785, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000ca3672a180, %r1, %r12
	setx	0xc1ff420d3003b518, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000800f8d88d0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800ed2ccc8, %r1, %r12
	ldx	[%r12], %r11
	ldx	[%r9], %r11
	setx	0xa40d4842a35d4d9a, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
!	data_array 0 = 0x000000c7fc7cb928 , rd_cntr = 37, wr_cntr = 37
!	data_array 1 = 0x000000800ed2ccc8 , rd_cntr = 37, wr_cntr = 37
!	data_array 2 = 0x000000800f8d88d0 , rd_cntr = 37, wr_cntr = 37
!	data_array 3 = 0x000000800f7cb280 , rd_cntr = 37, wr_cntr = 37
	setx	0x000000800e5f56c8, %r1, %r9
	setx	0xc39f61d4e47e3551, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c30cbd1470, %r1, %r12
	setx	0xc1ff420d3003b518, %r1, %r13
	stx	%r13, [%r12]
	ldx	[%r9], %r11
	setx	0xc39f61d4e47e3551, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
!	data_array 0 = 0x000000c7fc7cb928 , rd_cntr = 38, wr_cntr = 38
!	data_array 1 = 0x000000800ed2ccc8 , rd_cntr = 38, wr_cntr = 38
!	data_array 2 = 0x000000800f8d88d0 , rd_cntr = 38, wr_cntr = 38
!	data_array 3 = 0x000000800f7cb280 , rd_cntr = 38, wr_cntr = 38
	setx	0x000000d614a8fee0, %r1, %r9
	setx	0x40d7cd5856d0c786, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000fcb4bf5398, %r1, %r12
	setx	0xf0df8ad7d9849426, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000800eb56100, %r1, %r12
	setx	0x0f61191cdacd48db, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000800f572a68, %r1, %r12
	setx	0xc6a520c32589312c, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000fcb4bf5398, %r1, %r12
	setx	0xf0df8ad7d9849426, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000800ed2ccc8, %r1, %r12
	ldx	[%r12], %r11
	ldx	[%r9], %r11
	setx	0x40d7cd5856d0c786, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
!	data_array 0 = 0x000000c7fc7cb928 , rd_cntr = 39, wr_cntr = 39
!	data_array 1 = 0x000000800ed2ccc8 , rd_cntr = 39, wr_cntr = 39
!	data_array 2 = 0x000000800f8d88d0 , rd_cntr = 39, wr_cntr = 39
!	data_array 3 = 0x000000800f7cb280 , rd_cntr = 39, wr_cntr = 39
	setx	0x000000f834d766f0, %r1, %r9
	setx	0xc70d0e87757a9a7e, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f7cb280, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800f8d88d0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800ed2ccc8, %r1, %r12
	ldx	[%r12], %r11
	ldx	[%r9], %r11
	setx	0xc70d0e87757a9a7e, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
!	data_array 0 = 0x000000c7fc7cb928 , rd_cntr = 40, wr_cntr = 40
!	data_array 1 = 0x000000800ed2ccc8 , rd_cntr = 40, wr_cntr = 40
!	data_array 2 = 0x000000800f8d88d0 , rd_cntr = 40, wr_cntr = 40
!	data_array 3 = 0x000000800f7cb280 , rd_cntr = 40, wr_cntr = 40
	setx	0x000000f6f9a56fb8, %r1, %r9
	setx	0x529afb862c35bfc1, %r1, %r10
	stx	%r10, [%r9]
	ldx	[%r9], %r11
	setx	0x529afb862c35bfc1, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
!	data_array 0 = 0x000000f6f9a56fb8 , rd_cntr = 41, wr_cntr = 41
!	data_array 1 = 0x000000800ed2ccc8 , rd_cntr = 41, wr_cntr = 41
!	data_array 2 = 0x000000800f8d88d0 , rd_cntr = 41, wr_cntr = 41
!	data_array 3 = 0x000000800f7cb280 , rd_cntr = 41, wr_cntr = 41
	setx	0x000000800f20a140, %r1, %r9
	setx	0xf3bda03fd58fb373, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d6f66c0d28, %r1, %r12
	setx	0x5b03c084e9b6d785, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000ccda7c9278, %r1, %r12
	setx	0xc1ff420d3003b518, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000800f20a140, %r1, %r12
	ldx	[%r12], %r11
	ldx	[%r9], %r11
	setx	0xf3bda03fd58fb373, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
!	data_array 0 = 0x000000f6f9a56fb8 , rd_cntr = 42, wr_cntr = 42
!	data_array 1 = 0x000000800f20a140 , rd_cntr = 42, wr_cntr = 42
!	data_array 2 = 0x000000800f8d88d0 , rd_cntr = 42, wr_cntr = 42
!	data_array 3 = 0x000000800f7cb280 , rd_cntr = 42, wr_cntr = 42
	setx	0x000000f6e4d3c940, %r1, %r9
	setx	0x689b8d88923917ca, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f6e4d3c940, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800f20a140, %r1, %r12
	ldx	[%r12], %r11
	ldx	[%r9], %r11
	setx	0x689b8d88923917ca, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
!	data_array 0 = 0x000000f6f9a56fb8 , rd_cntr = 43, wr_cntr = 43
!	data_array 1 = 0x000000800f20a140 , rd_cntr = 43, wr_cntr = 43
!	data_array 2 = 0x000000f6e4d3c940 , rd_cntr = 43, wr_cntr = 43
!	data_array 3 = 0x000000800f7cb280 , rd_cntr = 43, wr_cntr = 43
	setx	0x000000800fd0e7a8, %r1, %r9
	setx	0x3e64184c1da2667c, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800eab1c08, %r1, %r12
	setx	0x0f61191cdacd48db, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000800eab1c08, %r1, %r12
	setx	0x0f61191cdacd48db, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000f6e4d3c940, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800f20a140, %r1, %r12
	ldx	[%r12], %r11
	ldx	[%r9], %r11
	setx	0x3e64184c1da2667c, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
!	data_array 0 = 0x000000f6f9a56fb8 , rd_cntr = 44, wr_cntr = 44
!	data_array 1 = 0x000000800f20a140 , rd_cntr = 44, wr_cntr = 44
!	data_array 2 = 0x000000f6e4d3c940 , rd_cntr = 44, wr_cntr = 44
!	data_array 3 = 0x000000800fd0e7a8 , rd_cntr = 44, wr_cntr = 44
	setx	0x000000800e4dcc28, %r1, %r9
	setx	0xd4de64aceb571193, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c9022e3ad0, %r1, %r12
	setx	0xc1ff420d3003b518, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000800f20a140, %r1, %r12
	ldx	[%r12], %r11
	ldx	[%r9], %r11
	setx	0xd4de64aceb571193, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
!	data_array 0 = 0x000000f6f9a56fb8 , rd_cntr = 45, wr_cntr = 45
!	data_array 1 = 0x000000800f20a140 , rd_cntr = 45, wr_cntr = 45
!	data_array 2 = 0x000000f6e4d3c940 , rd_cntr = 45, wr_cntr = 45
!	data_array 3 = 0x000000800fd0e7a8 , rd_cntr = 45, wr_cntr = 45
	setx	0x000000800f3cf418, %r1, %r9
	setx	0x395db4773b4687b4, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000fed54a3870, %r1, %r12
	setx	0xf0df8ad7d9849426, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000ec6a5d5a20, %r1, %r12
	setx	0xf90b0efdc717e4d8, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000800f3cf418, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e4dcc28, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800fd0e7a8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000f6e4d3c940, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800f20a140, %r1, %r12
	ldx	[%r12], %r11
	ldx	[%r9], %r11
	setx	0x395db4773b4687b4, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
!	data_array 0 = 0x000000f6f9a56fb8 , rd_cntr = 46, wr_cntr = 46
!	data_array 1 = 0x000000800f20a140 , rd_cntr = 46, wr_cntr = 46
!	data_array 2 = 0x000000f6e4d3c940 , rd_cntr = 46, wr_cntr = 46
!	data_array 3 = 0x000000800fd0e7a8 , rd_cntr = 46, wr_cntr = 46
	setx	0x000000d9e19c8098, %r1, %r9
	setx	0x0e8a244bda9f38f3, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000fe5ac85a08, %r1, %r12
	setx	0xf0df8ad7d9849426, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000800e3a5cb8, %r1, %r12
	setx	0x0f61191cdacd48db, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000ef4d8eb4c0, %r1, %r12
	setx	0x2d1fbe0e382ecc90, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000ef4d8eb4c0, %r1, %r12
	setx	0x005b7a1cf545de24, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000800fd0e7a8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000f6e4d3c940, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800f20a140, %r1, %r12
	ldx	[%r12], %r11
	ldx	[%r9], %r11
	setx	0x0e8a244bda9f38f3, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
!	data_array 0 = 0x000000f6f9a56fb8 , rd_cntr = 47, wr_cntr = 47
!	data_array 1 = 0x000000800f20a140 , rd_cntr = 47, wr_cntr = 47
!	data_array 2 = 0x000000f6e4d3c940 , rd_cntr = 47, wr_cntr = 47
!	data_array 3 = 0x000000800fd0e7a8 , rd_cntr = 47, wr_cntr = 47
	setx	0x000000f64629fc90, %r1, %r9
	setx	0xde5ef4d21e49a055, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f3cf418, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e4dcc28, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800fd0e7a8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000f6e4d3c940, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800f20a140, %r1, %r12
	ldx	[%r12], %r11
	ldx	[%r9], %r11
	setx	0xde5ef4d21e49a055, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
!	data_array 0 = 0x000000f6f9a56fb8 , rd_cntr = 48, wr_cntr = 48
!	data_array 1 = 0x000000800f20a140 , rd_cntr = 48, wr_cntr = 48
!	data_array 2 = 0x000000f6e4d3c940 , rd_cntr = 48, wr_cntr = 48
!	data_array 3 = 0x000000800fd0e7a8 , rd_cntr = 48, wr_cntr = 48
	setx	0x000000f2667eb058, %r1, %r9
	setx	0x286c67582ff23ea9, %r1, %r10
	stx	%r10, [%r9]
	ldx	[%r9], %r11
	setx	0x286c67582ff23ea9, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
!	data_array 0 = 0x000000f2667eb058 , rd_cntr = 49, wr_cntr = 49
!	data_array 1 = 0x000000800f20a140 , rd_cntr = 49, wr_cntr = 49
!	data_array 2 = 0x000000f6e4d3c940 , rd_cntr = 49, wr_cntr = 49
!	data_array 3 = 0x000000800fd0e7a8 , rd_cntr = 49, wr_cntr = 49
	setx	0x000000800ff86480, %r1, %r9
	setx	0x422e9df1ffc33c5d, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c624486728, %r1, %r12
	setx	0xc1ff420d3003b518, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000c624486728, %r1, %r12
	setx	0xc1ff420d3003b518, %r1, %r13
	stx	%r13, [%r12]
	ldx	[%r9], %r11
	setx	0x422e9df1ffc33c5d, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
!	data_array 0 = 0x000000f2667eb058 , rd_cntr = 50, wr_cntr = 50
!	data_array 1 = 0x000000800ff86480 , rd_cntr = 50, wr_cntr = 50
!	data_array 2 = 0x000000f6e4d3c940 , rd_cntr = 50, wr_cntr = 50
!	data_array 3 = 0x000000800fd0e7a8 , rd_cntr = 50, wr_cntr = 50
	setx	0x000000cf12e91e80, %r1, %r9
	setx	0x0e442ef2c62620c8, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000da76492b00, %r1, %r12
	setx	0x5b03c084e9b6d785, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000f66be28e68, %r1, %r12
	setx	0xf0df8ad7d9849426, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000da76492b00, %r1, %r12
	setx	0x5b03c084e9b6d785, %r1, %r13
	stx	%r13, [%r12]
	ldx	[%r9], %r11
	setx	0x0e442ef2c62620c8, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
!	data_array 0 = 0x000000f2667eb058 , rd_cntr = 51, wr_cntr = 51
!	data_array 1 = 0x000000800ff86480 , rd_cntr = 51, wr_cntr = 51
!	data_array 2 = 0x000000cf12e91e80 , rd_cntr = 51, wr_cntr = 51
!	data_array 3 = 0x000000800fd0e7a8 , rd_cntr = 51, wr_cntr = 51
	setx	0x000000faee6726f8, %r1, %r9
	setx	0x84703d8192e98329, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800ff86480, %r1, %r12
	ldx	[%r12], %r11
	ldx	[%r9], %r11
	setx	0x84703d8192e98329, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
!	data_array 0 = 0x000000f2667eb058 , rd_cntr = 52, wr_cntr = 52
!	data_array 1 = 0x000000800ff86480 , rd_cntr = 52, wr_cntr = 52
!	data_array 2 = 0x000000cf12e91e80 , rd_cntr = 52, wr_cntr = 52
!	data_array 3 = 0x000000faee6726f8 , rd_cntr = 52, wr_cntr = 52
	setx	0x000000f8da6f8148, %r1, %r9
	setx	0x0469578b4ba1567f, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800ff86480, %r1, %r12
	ldx	[%r12], %r11
	ldx	[%r9], %r11
	setx	0x0469578b4ba1567f, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
!	data_array 0 = 0x000000f2667eb058 , rd_cntr = 53, wr_cntr = 53
!	data_array 1 = 0x000000800ff86480 , rd_cntr = 53, wr_cntr = 53
!	data_array 2 = 0x000000cf12e91e80 , rd_cntr = 53, wr_cntr = 53
!	data_array 3 = 0x000000faee6726f8 , rd_cntr = 53, wr_cntr = 53
	setx	0x000000df9dfd66a8, %r1, %r9
	setx	0xb3057ab1cd0d1577, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800e5baf00, %r1, %r12
	setx	0x0f61191cdacd48db, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000800f7b7ee0, %r1, %r12
	setx	0xc6a520c32589312c, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000800f7b7ee0, %r1, %r12
	setx	0xc6a520c32589312c, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000eeb4fe2ee8, %r1, %r12
	setx	0x005b7a1cf545de24, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000faee6726f8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000cf12e91e80, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800ff86480, %r1, %r12
	ldx	[%r12], %r11
	ldx	[%r9], %r11
	setx	0xb3057ab1cd0d1577, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
!	data_array 0 = 0x000000f2667eb058 , rd_cntr = 54, wr_cntr = 54
!	data_array 1 = 0x000000800ff86480 , rd_cntr = 54, wr_cntr = 54
!	data_array 2 = 0x000000cf12e91e80 , rd_cntr = 54, wr_cntr = 54
!	data_array 3 = 0x000000faee6726f8 , rd_cntr = 54, wr_cntr = 54
	setx	0x000000800e40dbf8, %r1, %r9
	setx	0x09c0262c883deb6a, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d539f56c18, %r1, %r12
	setx	0x5b03c084e9b6d785, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000faee6726f8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000cf12e91e80, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800ff86480, %r1, %r12
	ldx	[%r12], %r11
	ldx	[%r9], %r11
	setx	0x09c0262c883deb6a, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
!	data_array 0 = 0x000000f2667eb058 , rd_cntr = 55, wr_cntr = 55
!	data_array 1 = 0x000000800ff86480 , rd_cntr = 55, wr_cntr = 55
!	data_array 2 = 0x000000cf12e91e80 , rd_cntr = 55, wr_cntr = 55
!	data_array 3 = 0x000000faee6726f8 , rd_cntr = 55, wr_cntr = 55
	setx	0x000000c85dfa5788, %r1, %r9
	setx	0x944826e8229f3faa, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000fe7e662298, %r1, %r12
	setx	0xf0df8ad7d9849426, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000800ec14910, %r1, %r12
	setx	0x0f61191cdacd48db, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000ebc5285810, %r1, %r12
	setx	0x2d1fbe0e382ecc90, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000f8da6f8148, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000faee6726f8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000cf12e91e80, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800ff86480, %r1, %r12
	ldx	[%r12], %r11
	ldx	[%r9], %r11
	setx	0x944826e8229f3faa, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
!	data_array 0 = 0x000000f2667eb058 , rd_cntr = 56, wr_cntr = 56
!	data_array 1 = 0x000000800ff86480 , rd_cntr = 56, wr_cntr = 56
!	data_array 2 = 0x000000cf12e91e80 , rd_cntr = 56, wr_cntr = 56
!	data_array 3 = 0x000000faee6726f8 , rd_cntr = 56, wr_cntr = 56
	setx	0x000000d34a802828, %r1, %r9
	setx	0x4c01fbc0e9130c3c, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000fe97598cd0, %r1, %r12
	setx	0xf0df8ad7d9849426, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000e53b04dd10, %r1, %r12
	setx	0xf90b0efdc717e4d8, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000e53b04dd10, %r1, %r12
	setx	0xf90b0efdc717e4d8, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000e53b04dd10, %r1, %r12
	setx	0xf90b0efdc717e4d8, %r1, %r13
	stx	%r13, [%r12]
	ldx	[%r9], %r11
	setx	0x4c01fbc0e9130c3c, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
!	data_array 0 = 0x000000d34a802828 , rd_cntr = 57, wr_cntr = 57
!	data_array 1 = 0x000000800ff86480 , rd_cntr = 57, wr_cntr = 57
!	data_array 2 = 0x000000cf12e91e80 , rd_cntr = 57, wr_cntr = 57
!	data_array 3 = 0x000000faee6726f8 , rd_cntr = 57, wr_cntr = 57
	setx	0x000000800e56acb8, %r1, %r9
	setx	0x7d8a65dd5aaf22fd, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c1b9ae41a8, %r1, %r12
	setx	0xc1ff420d3003b518, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000800e56acb8, %r1, %r12
	ldx	[%r12], %r11
	ldx	[%r9], %r11
	setx	0x7d8a65dd5aaf22fd, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
!	data_array 0 = 0x000000d34a802828 , rd_cntr = 58, wr_cntr = 58
!	data_array 1 = 0x000000800e56acb8 , rd_cntr = 58, wr_cntr = 58
!	data_array 2 = 0x000000cf12e91e80 , rd_cntr = 58, wr_cntr = 58
!	data_array 3 = 0x000000faee6726f8 , rd_cntr = 58, wr_cntr = 58
	setx	0x000000d0ba58a5c8, %r1, %r9
	setx	0x8b5c4e2a8cedc865, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f3bda10, %r1, %r12
	setx	0xc6a520c32589312c, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000800f3bda10, %r1, %r12
	setx	0xc6a520c32589312c, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000c53b5fcd78, %r1, %r12
	setx	0xc1ff420d3003b518, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000800f3bda10, %r1, %r12
	setx	0xc6a520c32589312c, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000d0ba58a5c8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e56acb8, %r1, %r12
	ldx	[%r12], %r11
	ldx	[%r9], %r11
	setx	0x8b5c4e2a8cedc865, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
!	data_array 0 = 0x000000d34a802828 , rd_cntr = 59, wr_cntr = 59
!	data_array 1 = 0x000000800e56acb8 , rd_cntr = 59, wr_cntr = 59
!	data_array 2 = 0x000000d0ba58a5c8 , rd_cntr = 59, wr_cntr = 59
!	data_array 3 = 0x000000faee6726f8 , rd_cntr = 59, wr_cntr = 59
	setx	0x000000800f6831b8, %r1, %r9
	setx	0x84f4b4d86bb77bf6, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d2ce7ea268, %r1, %r12
	setx	0x5b03c084e9b6d785, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000ec0663a6a0, %r1, %r12
	setx	0x2d1fbe0e382ecc90, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000800f6831b8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000d0ba58a5c8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e56acb8, %r1, %r12
	ldx	[%r12], %r11
	ldx	[%r9], %r11
	setx	0x84f4b4d86bb77bf6, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
!	data_array 0 = 0x000000d34a802828 , rd_cntr = 60, wr_cntr = 60
!	data_array 1 = 0x000000800e56acb8 , rd_cntr = 60, wr_cntr = 60
!	data_array 2 = 0x000000d0ba58a5c8 , rd_cntr = 60, wr_cntr = 60
!	data_array 3 = 0x000000800f6831b8 , rd_cntr = 60, wr_cntr = 60
	setx	0x000000f4ab7c8c40, %r1, %r9
	setx	0x629a3785ff7fb3f4, %r1, %r10
	stx	%r10, [%r9]
	ldx	[%r9], %r11
	setx	0x629a3785ff7fb3f4, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
!	data_array 0 = 0x000000d34a802828 , rd_cntr = 61, wr_cntr = 61
!	data_array 1 = 0x000000800e56acb8 , rd_cntr = 61, wr_cntr = 61
!	data_array 2 = 0x000000d0ba58a5c8 , rd_cntr = 61, wr_cntr = 61
!	data_array 3 = 0x000000800f6831b8 , rd_cntr = 61, wr_cntr = 61
	setx	0x000000f898804128, %r1, %r9
	setx	0xc6401b31dc41f26b, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f6831b8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000d0ba58a5c8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e56acb8, %r1, %r12
	ldx	[%r12], %r11
	ldx	[%r9], %r11
	setx	0xc6401b31dc41f26b, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
!	data_array 0 = 0x000000d34a802828 , rd_cntr = 62, wr_cntr = 62
!	data_array 1 = 0x000000800e56acb8 , rd_cntr = 62, wr_cntr = 62
!	data_array 2 = 0x000000d0ba58a5c8 , rd_cntr = 62, wr_cntr = 62
!	data_array 3 = 0x000000800f6831b8 , rd_cntr = 62, wr_cntr = 62
	setx	0x000000c07ca8e948, %r1, %r9
	setx	0xe22c43d6fec79ddb, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f80d614c60, %r1, %r12
	setx	0xf0df8ad7d9849426, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000e944cf9c10, %r1, %r12
	setx	0x005b7a1cf545de24, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000dd2fcb3ea0, %r1, %r12
	setx	0x5b03c084e9b6d785, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000f898804128, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000f4ab7c8c40, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800f6831b8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000d0ba58a5c8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e56acb8, %r1, %r12
	ldx	[%r12], %r11
	ldx	[%r9], %r11
	setx	0xe22c43d6fec79ddb, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
!	data_array 0 = 0x000000d34a802828 , rd_cntr = 63, wr_cntr = 63
!	data_array 1 = 0x000000800e56acb8 , rd_cntr = 63, wr_cntr = 63
!	data_array 2 = 0x000000d0ba58a5c8 , rd_cntr = 63, wr_cntr = 63
!	data_array 3 = 0x000000800f6831b8 , rd_cntr = 63, wr_cntr = 63
	setx	0x000000ced6cea6a0, %r1, %r9
	setx	0xb388a6f9ab133f51, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800e0c3f78, %r1, %r12
	setx	0x0f61191cdacd48db, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000dda1de2200, %r1, %r12
	setx	0x5b03c084e9b6d785, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000e5d03455b0, %r1, %r12
	setx	0xf90b0efdc717e4d8, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000c07ca8e948, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000f898804128, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000f4ab7c8c40, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800f6831b8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000d0ba58a5c8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e56acb8, %r1, %r12
	ldx	[%r12], %r11
	ldx	[%r9], %r11
	setx	0xb388a6f9ab133f51, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
!	data_array 0 = 0x000000d34a802828 , rd_cntr = 64, wr_cntr = 64
!	data_array 1 = 0x000000800e56acb8 , rd_cntr = 64, wr_cntr = 64
!	data_array 2 = 0x000000d0ba58a5c8 , rd_cntr = 64, wr_cntr = 64
!	data_array 3 = 0x000000800f6831b8 , rd_cntr = 64, wr_cntr = 64
	setx	0x000000c72231e510, %r1, %r9
	setx	0xf7c835a31d60f85f, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f2f4210, %r1, %r12
	setx	0xc6a520c32589312c, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000e15a7404c0, %r1, %r12
	setx	0x005b7a1cf545de24, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000e15a7404c0, %r1, %r12
	setx	0x005b7a1cf545de24, %r1, %r13
	stx	%r13, [%r12]
	ldx	[%r9], %r11
	setx	0xf7c835a31d60f85f, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
!	data_array 0 = 0x000000c72231e510 , rd_cntr = 65, wr_cntr = 65
!	data_array 1 = 0x000000800e56acb8 , rd_cntr = 65, wr_cntr = 65
!	data_array 2 = 0x000000d0ba58a5c8 , rd_cntr = 65, wr_cntr = 65
!	data_array 3 = 0x000000800f6831b8 , rd_cntr = 65, wr_cntr = 65
	setx	0x000000fcca8d6b80, %r1, %r9
	setx	0x9678aa8cf3a6a116, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000fcca8d6b80, %r1, %r12
	ldx	[%r12], %r11
	ldx	[%r9], %r11
	setx	0x9678aa8cf3a6a116, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
!	data_array 0 = 0x000000c72231e510 , rd_cntr = 66, wr_cntr = 66
!	data_array 1 = 0x000000fcca8d6b80 , rd_cntr = 66, wr_cntr = 66
!	data_array 2 = 0x000000d0ba58a5c8 , rd_cntr = 66, wr_cntr = 66
!	data_array 3 = 0x000000800f6831b8 , rd_cntr = 66, wr_cntr = 66
	setx	0x000000fc2e15e030, %r1, %r9
	setx	0x04bef2691e57031b, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000fc2e15e030, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000fcca8d6b80, %r1, %r12
	ldx	[%r12], %r11
	ldx	[%r9], %r11
	setx	0x04bef2691e57031b, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
!	data_array 0 = 0x000000c72231e510 , rd_cntr = 67, wr_cntr = 67
!	data_array 1 = 0x000000fcca8d6b80 , rd_cntr = 67, wr_cntr = 67
!	data_array 2 = 0x000000fc2e15e030 , rd_cntr = 67, wr_cntr = 67
!	data_array 3 = 0x000000800f6831b8 , rd_cntr = 67, wr_cntr = 67
	setx	0x000000800f9c32a8, %r1, %r9
	setx	0xbb39c1b90eebb986, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d7ca1d1af0, %r1, %r12
	setx	0x5b03c084e9b6d785, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000e71c5f8520, %r1, %r12
	setx	0x005b7a1cf545de24, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000fcca8d6b80, %r1, %r12
	ldx	[%r12], %r11
	ldx	[%r9], %r11
	setx	0xbb39c1b90eebb986, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
!	data_array 0 = 0x000000c72231e510 , rd_cntr = 68, wr_cntr = 68
!	data_array 1 = 0x000000fcca8d6b80 , rd_cntr = 68, wr_cntr = 68
!	data_array 2 = 0x000000fc2e15e030 , rd_cntr = 68, wr_cntr = 68
!	data_array 3 = 0x000000800f9c32a8 , rd_cntr = 68, wr_cntr = 68
	setx	0x000000800ecd1c40, %r1, %r9
	setx	0x4ba6e15c04e4ddcf, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000fe2d63bd20, %r1, %r12
	setx	0xf0df8ad7d9849426, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000fc2e15e030, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000fcca8d6b80, %r1, %r12
	ldx	[%r12], %r11
	ldx	[%r9], %r11
	setx	0x4ba6e15c04e4ddcf, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
!	data_array 0 = 0x000000c72231e510 , rd_cntr = 69, wr_cntr = 69
!	data_array 1 = 0x000000fcca8d6b80 , rd_cntr = 69, wr_cntr = 69
!	data_array 2 = 0x000000fc2e15e030 , rd_cntr = 69, wr_cntr = 69
!	data_array 3 = 0x000000800f9c32a8 , rd_cntr = 69, wr_cntr = 69
	setx	0x000000fe0732e670, %r1, %r9
	setx	0xaa0b3e5805261865, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800ecd1c40, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800f9c32a8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000fc2e15e030, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000fcca8d6b80, %r1, %r12
	ldx	[%r12], %r11
	ldx	[%r9], %r11
	setx	0xaa0b3e5805261865, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
!	data_array 0 = 0x000000c72231e510 , rd_cntr = 70, wr_cntr = 70
!	data_array 1 = 0x000000fcca8d6b80 , rd_cntr = 70, wr_cntr = 70
!	data_array 2 = 0x000000fc2e15e030 , rd_cntr = 70, wr_cntr = 70
!	data_array 3 = 0x000000800f9c32a8 , rd_cntr = 70, wr_cntr = 70
	setx	0x000000800fd6ce70, %r1, %r9
	setx	0x9125aa2f277cce96, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000dd831d6ab0, %r1, %r12
	setx	0x5b03c084e9b6d785, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000c4f148b928, %r1, %r12
	setx	0xc1ff420d3003b518, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000800f9c32a8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000fc2e15e030, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000fcca8d6b80, %r1, %r12
	ldx	[%r12], %r11
	ldx	[%r9], %r11
	setx	0x9125aa2f277cce96, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
!	data_array 0 = 0x000000c72231e510 , rd_cntr = 71, wr_cntr = 71
!	data_array 1 = 0x000000fcca8d6b80 , rd_cntr = 71, wr_cntr = 71
!	data_array 2 = 0x000000fc2e15e030 , rd_cntr = 71, wr_cntr = 71
!	data_array 3 = 0x000000800f9c32a8 , rd_cntr = 71, wr_cntr = 71
	setx	0x000000f4f4164ec8, %r1, %r9
	setx	0x9cb7b779e1e550df, %r1, %r10
	stx	%r10, [%r9]
	ldx	[%r9], %r11
	setx	0x9cb7b779e1e550df, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
!	data_array 0 = 0x000000c72231e510 , rd_cntr = 72, wr_cntr = 72
!	data_array 1 = 0x000000fcca8d6b80 , rd_cntr = 72, wr_cntr = 72
!	data_array 2 = 0x000000fc2e15e030 , rd_cntr = 72, wr_cntr = 72
!	data_array 3 = 0x000000800f9c32a8 , rd_cntr = 72, wr_cntr = 72
	setx	0x000000d89ad4ea00, %r1, %r9
	setx	0x24b00868f69822c9, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800fa8c6e8, %r1, %r12
	setx	0xc6a520c32589312c, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000c6103ede48, %r1, %r12
	setx	0xc1ff420d3003b518, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000800e5056b8, %r1, %r12
	setx	0x0f61191cdacd48db, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000800e5056b8, %r1, %r12
	setx	0x0f61191cdacd48db, %r1, %r13
	stx	%r13, [%r12]
	ldx	[%r9], %r11
	setx	0x24b00868f69822c9, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
!	data_array 0 = 0x000000d89ad4ea00 , rd_cntr = 73, wr_cntr = 73
!	data_array 1 = 0x000000fcca8d6b80 , rd_cntr = 73, wr_cntr = 73
!	data_array 2 = 0x000000fc2e15e030 , rd_cntr = 73, wr_cntr = 73
!	data_array 3 = 0x000000800f9c32a8 , rd_cntr = 73, wr_cntr = 73
	setx	0x000000f6f7b756d8, %r1, %r9
	setx	0x1fe15ff70267762e, %r1, %r10
	stx	%r10, [%r9]
	ldx	[%r9], %r11
	setx	0x1fe15ff70267762e, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
!	data_array 0 = 0x000000d89ad4ea00 , rd_cntr = 74, wr_cntr = 74
!	data_array 1 = 0x000000f6f7b756d8 , rd_cntr = 74, wr_cntr = 74
!	data_array 2 = 0x000000fc2e15e030 , rd_cntr = 74, wr_cntr = 74
!	data_array 3 = 0x000000800f9c32a8 , rd_cntr = 74, wr_cntr = 74
	setx	0x000000d0e1e71440, %r1, %r9
	setx	0xe8708262bdd6b63f, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800e662cd0, %r1, %r12
	setx	0x0f61191cdacd48db, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000ca0ea3ceb8, %r1, %r12
	setx	0xc1ff420d3003b518, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000800e662cd0, %r1, %r12
	setx	0x0f61191cdacd48db, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000800fd12f70, %r1, %r12
	setx	0xc6a520c32589312c, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000d0e1e71440, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000f6f7b756d8, %r1, %r12
	ldx	[%r12], %r11
	ldx	[%r9], %r11
	setx	0xe8708262bdd6b63f, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
!	data_array 0 = 0x000000d89ad4ea00 , rd_cntr = 75, wr_cntr = 75
!	data_array 1 = 0x000000f6f7b756d8 , rd_cntr = 75, wr_cntr = 75
!	data_array 2 = 0x000000d0e1e71440 , rd_cntr = 75, wr_cntr = 75
!	data_array 3 = 0x000000800f9c32a8 , rd_cntr = 75, wr_cntr = 75
	setx	0x000000f4f66d2bc8, %r1, %r9
	setx	0xdbe00e77e302ebc1, %r1, %r10
	stx	%r10, [%r9]
	ldx	[%r9], %r11
	setx	0xdbe00e77e302ebc1, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
!	data_array 0 = 0x000000d89ad4ea00 , rd_cntr = 76, wr_cntr = 76
!	data_array 1 = 0x000000f6f7b756d8 , rd_cntr = 76, wr_cntr = 76
!	data_array 2 = 0x000000d0e1e71440 , rd_cntr = 76, wr_cntr = 76
!	data_array 3 = 0x000000f4f66d2bc8 , rd_cntr = 76, wr_cntr = 76
	setx	0x000000d79a7496f8, %r1, %r9
	setx	0x03cfa48c3ab6b30d, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c31b8848f8, %r1, %r12
	setx	0xc1ff420d3003b518, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000c31b8848f8, %r1, %r12
	setx	0xc1ff420d3003b518, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000800ff70978, %r1, %r12
	setx	0xc6a520c32589312c, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000800e8b3798, %r1, %r12
	setx	0x0f61191cdacd48db, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000f4f66d2bc8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000d0e1e71440, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000f6f7b756d8, %r1, %r12
	ldx	[%r12], %r11
	ldx	[%r9], %r11
	setx	0x03cfa48c3ab6b30d, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
!	data_array 0 = 0x000000d89ad4ea00 , rd_cntr = 77, wr_cntr = 77
!	data_array 1 = 0x000000f6f7b756d8 , rd_cntr = 77, wr_cntr = 77
!	data_array 2 = 0x000000d0e1e71440 , rd_cntr = 77, wr_cntr = 77
!	data_array 3 = 0x000000f4f66d2bc8 , rd_cntr = 77, wr_cntr = 77
	setx	0x000000800f4e18e8, %r1, %r9
	setx	0x6b786196843eb212, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ceb1a9dc98, %r1, %r12
	setx	0xc1ff420d3003b518, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000fa17981408, %r1, %r12
	setx	0xf0df8ad7d9849426, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000800f4e18e8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000d79a7496f8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000f4f66d2bc8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000d0e1e71440, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000f6f7b756d8, %r1, %r12
	ldx	[%r12], %r11
	ldx	[%r9], %r11
	setx	0x6b786196843eb212, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
!	data_array 0 = 0x000000d89ad4ea00 , rd_cntr = 78, wr_cntr = 78
!	data_array 1 = 0x000000f6f7b756d8 , rd_cntr = 78, wr_cntr = 78
!	data_array 2 = 0x000000d0e1e71440 , rd_cntr = 78, wr_cntr = 78
!	data_array 3 = 0x000000f4f66d2bc8 , rd_cntr = 78, wr_cntr = 78
	setx	0x000000d825468a60, %r1, %r9
	setx	0x03b011f840e6d2b1, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c9dcfafc38, %r1, %r12
	setx	0xc1ff420d3003b518, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000800f4bc170, %r1, %r12
	setx	0xc6a520c32589312c, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000c9dcfafc38, %r1, %r12
	setx	0xc1ff420d3003b518, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000800f4bc170, %r1, %r12
	setx	0xc6a520c32589312c, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000f4f66d2bc8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000d0e1e71440, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000f6f7b756d8, %r1, %r12
	ldx	[%r12], %r11
	ldx	[%r9], %r11
	setx	0x03b011f840e6d2b1, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
!	data_array 0 = 0x000000d89ad4ea00 , rd_cntr = 79, wr_cntr = 79
!	data_array 1 = 0x000000f6f7b756d8 , rd_cntr = 79, wr_cntr = 79
!	data_array 2 = 0x000000d0e1e71440 , rd_cntr = 79, wr_cntr = 79
!	data_array 3 = 0x000000f4f66d2bc8 , rd_cntr = 79, wr_cntr = 79
	setx	0x000000800f5a1768, %r1, %r9
	setx	0xe1e7e250cf1c669a, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c2f781d358, %r1, %r12
	setx	0xc1ff420d3003b518, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000e883a8a608, %r1, %r12
	setx	0x2d1fbe0e382ecc90, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000800f5a1768, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000d825468a60, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800f4e18e8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000d79a7496f8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000f4f66d2bc8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000d0e1e71440, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000f6f7b756d8, %r1, %r12
	ldx	[%r12], %r11
	ldx	[%r9], %r11
	setx	0xe1e7e250cf1c669a, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
!	data_array 0 = 0x000000d89ad4ea00 , rd_cntr = 80, wr_cntr = 80
!	data_array 1 = 0x000000f6f7b756d8 , rd_cntr = 80, wr_cntr = 80
!	data_array 2 = 0x000000d0e1e71440 , rd_cntr = 80, wr_cntr = 80
!	data_array 3 = 0x000000f4f66d2bc8 , rd_cntr = 80, wr_cntr = 80
	setx	0x000000deb1ff4ff0, %r1, %r9
	setx	0x46c2f1a249e5d70a, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f7dc050, %r1, %r12
	setx	0xc6a520c32589312c, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000eb2f5147f8, %r1, %r12
	setx	0xf90b0efdc717e4d8, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000800f7dc050, %r1, %r12
	setx	0xc6a520c32589312c, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000800f7dc050, %r1, %r12
	setx	0xc6a520c32589312c, %r1, %r13
	stx	%r13, [%r12]
	ldx	[%r9], %r11
	setx	0x46c2f1a249e5d70a, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
!	data_array 0 = 0x000000deb1ff4ff0 , rd_cntr = 81, wr_cntr = 81
!	data_array 1 = 0x000000f6f7b756d8 , rd_cntr = 81, wr_cntr = 81
!	data_array 2 = 0x000000d0e1e71440 , rd_cntr = 81, wr_cntr = 81
!	data_array 3 = 0x000000f4f66d2bc8 , rd_cntr = 81, wr_cntr = 81
	setx	0x000000c08eca80b8, %r1, %r9
	setx	0x67774d181b12189e, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800eaa3508, %r1, %r12
	setx	0x0f61191cdacd48db, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000fcb8c514b0, %r1, %r12
	setx	0xf0df8ad7d9849426, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000e151817790, %r1, %r12
	setx	0xf90b0efdc717e4d8, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000c08eca80b8, %r1, %r12
	ldx	[%r12], %r11
	ldx	[%r9], %r11
	setx	0x67774d181b12189e, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
!	data_array 0 = 0x000000deb1ff4ff0 , rd_cntr = 82, wr_cntr = 82
!	data_array 1 = 0x000000c08eca80b8 , rd_cntr = 82, wr_cntr = 82
!	data_array 2 = 0x000000d0e1e71440 , rd_cntr = 82, wr_cntr = 82
!	data_array 3 = 0x000000f4f66d2bc8 , rd_cntr = 82, wr_cntr = 82
	setx	0x000000c2305fcb60, %r1, %r9
	setx	0xe3e431d505a60a0c, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800eca5b08, %r1, %r12
	setx	0x0f61191cdacd48db, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000d133f86148, %r1, %r12
	setx	0x5b03c084e9b6d785, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000ecf0025a50, %r1, %r12
	setx	0x2d1fbe0e382ecc90, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000c2305fcb60, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000c08eca80b8, %r1, %r12
	ldx	[%r12], %r11
	ldx	[%r9], %r11
	setx	0xe3e431d505a60a0c, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
!	data_array 0 = 0x000000deb1ff4ff0 , rd_cntr = 83, wr_cntr = 83
!	data_array 1 = 0x000000c08eca80b8 , rd_cntr = 83, wr_cntr = 83
!	data_array 2 = 0x000000c2305fcb60 , rd_cntr = 83, wr_cntr = 83
!	data_array 3 = 0x000000f4f66d2bc8 , rd_cntr = 83, wr_cntr = 83
	setx	0x000000800fbc5300, %r1, %r9
	setx	0x9f9ed4b17f59064c, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000cc49a05e50, %r1, %r12
	setx	0xc1ff420d3003b518, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000e226b24cb8, %r1, %r12
	setx	0x005b7a1cf545de24, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000c2305fcb60, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000c08eca80b8, %r1, %r12
	ldx	[%r12], %r11
	ldx	[%r9], %r11
	setx	0x9f9ed4b17f59064c, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
!	data_array 0 = 0x000000deb1ff4ff0 , rd_cntr = 84, wr_cntr = 84
!	data_array 1 = 0x000000c08eca80b8 , rd_cntr = 84, wr_cntr = 84
!	data_array 2 = 0x000000c2305fcb60 , rd_cntr = 84, wr_cntr = 84
!	data_array 3 = 0x000000800fbc5300 , rd_cntr = 84, wr_cntr = 84
	setx	0x000000d80258a748, %r1, %r9
	setx	0x0d9b6ed07cd87385, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f83b51c990, %r1, %r12
	setx	0xf0df8ad7d9849426, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000800e1ca330, %r1, %r12
	setx	0x0f61191cdacd48db, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000ca72369040, %r1, %r12
	setx	0xc1ff420d3003b518, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000800f075208, %r1, %r12
	setx	0xc6a520c32589312c, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000c08eca80b8, %r1, %r12
	ldx	[%r12], %r11
	ldx	[%r9], %r11
	setx	0x0d9b6ed07cd87385, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
!	data_array 0 = 0x000000deb1ff4ff0 , rd_cntr = 85, wr_cntr = 85
!	data_array 1 = 0x000000c08eca80b8 , rd_cntr = 85, wr_cntr = 85
!	data_array 2 = 0x000000c2305fcb60 , rd_cntr = 85, wr_cntr = 85
!	data_array 3 = 0x000000800fbc5300 , rd_cntr = 85, wr_cntr = 85
	setx	0x000000800fe926d0, %r1, %r9
	setx	0x796b8f4ee1ce3385, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f0f41a7b80, %r1, %r12
	setx	0xf0df8ad7d9849426, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000e9428ab8f8, %r1, %r12
	setx	0x005b7a1cf545de24, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000800fe926d0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000d80258a748, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800fbc5300, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000c2305fcb60, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000c08eca80b8, %r1, %r12
	ldx	[%r12], %r11
	ldx	[%r9], %r11
	setx	0x796b8f4ee1ce3385, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
!	data_array 0 = 0x000000deb1ff4ff0 , rd_cntr = 86, wr_cntr = 86
!	data_array 1 = 0x000000c08eca80b8 , rd_cntr = 86, wr_cntr = 86
!	data_array 2 = 0x000000c2305fcb60 , rd_cntr = 86, wr_cntr = 86
!	data_array 3 = 0x000000800fbc5300 , rd_cntr = 86, wr_cntr = 86
	setx	0x000000800fbcfae0, %r1, %r9
	setx	0xa6e948b07bd79b43, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c48bd2b9b0, %r1, %r12
	setx	0xc1ff420d3003b518, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000e00c77bc18, %r1, %r12
	setx	0x005b7a1cf545de24, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000800fe926d0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000d80258a748, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800fbc5300, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000c2305fcb60, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000c08eca80b8, %r1, %r12
	ldx	[%r12], %r11
	ldx	[%r9], %r11
	setx	0xa6e948b07bd79b43, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
!	data_array 0 = 0x000000deb1ff4ff0 , rd_cntr = 87, wr_cntr = 87
!	data_array 1 = 0x000000c08eca80b8 , rd_cntr = 87, wr_cntr = 87
!	data_array 2 = 0x000000c2305fcb60 , rd_cntr = 87, wr_cntr = 87
!	data_array 3 = 0x000000800fbc5300 , rd_cntr = 87, wr_cntr = 87
	setx	0x000000f866d0b6f0, %r1, %r9
	setx	0x12283bc3b2ee479c, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800fe926d0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000d80258a748, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800fbc5300, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000c2305fcb60, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000c08eca80b8, %r1, %r12
	ldx	[%r12], %r11
	ldx	[%r9], %r11
	setx	0x12283bc3b2ee479c, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
!	data_array 0 = 0x000000deb1ff4ff0 , rd_cntr = 88, wr_cntr = 88
!	data_array 1 = 0x000000c08eca80b8 , rd_cntr = 88, wr_cntr = 88
!	data_array 2 = 0x000000c2305fcb60 , rd_cntr = 88, wr_cntr = 88
!	data_array 3 = 0x000000800fbc5300 , rd_cntr = 88, wr_cntr = 88
	setx	0x000000800fce9378, %r1, %r9
	setx	0x72171efefe88fa86, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000dcb6dee148, %r1, %r12
	setx	0x5b03c084e9b6d785, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000f8759cb8b8, %r1, %r12
	setx	0xf0df8ad7d9849426, %r1, %r13
	stx	%r13, [%r12]
	ldx	[%r9], %r11
	setx	0x72171efefe88fa86, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
!	data_array 0 = 0x000000800fce9378 , rd_cntr = 89, wr_cntr = 89
!	data_array 1 = 0x000000c08eca80b8 , rd_cntr = 89, wr_cntr = 89
!	data_array 2 = 0x000000c2305fcb60 , rd_cntr = 89, wr_cntr = 89
!	data_array 3 = 0x000000800fbc5300 , rd_cntr = 89, wr_cntr = 89
	setx	0x000000800f7886c0, %r1, %r9
	setx	0xcdc4ed321e23fc8e, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800e7bfc50, %r1, %r12
	setx	0x0f61191cdacd48db, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000f60db4f788, %r1, %r12
	setx	0xf0df8ad7d9849426, %r1, %r13
	stx	%r13, [%r12]
	ldx	[%r9], %r11
	setx	0xcdc4ed321e23fc8e, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
!	data_array 0 = 0x000000800fce9378 , rd_cntr = 90, wr_cntr = 90
!	data_array 1 = 0x000000800f7886c0 , rd_cntr = 90, wr_cntr = 90
!	data_array 2 = 0x000000c2305fcb60 , rd_cntr = 90, wr_cntr = 90
!	data_array 3 = 0x000000800fbc5300 , rd_cntr = 90, wr_cntr = 90
	setx	0x000000f04f987c58, %r1, %r9
	setx	0x80861cd9d52d461f, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f7886c0, %r1, %r12
	ldx	[%r12], %r11
	ldx	[%r9], %r11
	setx	0x80861cd9d52d461f, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
!	data_array 0 = 0x000000800fce9378 , rd_cntr = 91, wr_cntr = 91
!	data_array 1 = 0x000000800f7886c0 , rd_cntr = 91, wr_cntr = 91
!	data_array 2 = 0x000000f04f987c58 , rd_cntr = 91, wr_cntr = 91
!	data_array 3 = 0x000000800fbc5300 , rd_cntr = 91, wr_cntr = 91
	setx	0x000000d9efbb1008, %r1, %r9
	setx	0x054d9b851e559e95, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c2c8cd06c0, %r1, %r12
	setx	0xc1ff420d3003b518, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000800e7f7868, %r1, %r12
	setx	0x0f61191cdacd48db, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000efb9f18ae8, %r1, %r12
	setx	0xf90b0efdc717e4d8, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000c2c8cd06c0, %r1, %r12
	setx	0xc1ff420d3003b518, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000f04f987c58, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800f7886c0, %r1, %r12
	ldx	[%r12], %r11
	ldx	[%r9], %r11
	setx	0x054d9b851e559e95, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
!	data_array 0 = 0x000000800fce9378 , rd_cntr = 92, wr_cntr = 92
!	data_array 1 = 0x000000800f7886c0 , rd_cntr = 92, wr_cntr = 92
!	data_array 2 = 0x000000f04f987c58 , rd_cntr = 92, wr_cntr = 92
!	data_array 3 = 0x000000d9efbb1008 , rd_cntr = 92, wr_cntr = 92
	setx	0x000000c2a3eb1198, %r1, %r9
	setx	0x742ff8f0c4cdb2f8, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800e2a1f28, %r1, %r12
	setx	0x0f61191cdacd48db, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000800f53f980, %r1, %r12
	setx	0xc6a520c32589312c, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000dd93803b58, %r1, %r12
	setx	0x5b03c084e9b6d785, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000c2a3eb1198, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000d9efbb1008, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000f04f987c58, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800f7886c0, %r1, %r12
	ldx	[%r12], %r11
	ldx	[%r9], %r11
	setx	0x742ff8f0c4cdb2f8, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
!	data_array 0 = 0x000000800fce9378 , rd_cntr = 93, wr_cntr = 93
!	data_array 1 = 0x000000800f7886c0 , rd_cntr = 93, wr_cntr = 93
!	data_array 2 = 0x000000f04f987c58 , rd_cntr = 93, wr_cntr = 93
!	data_array 3 = 0x000000d9efbb1008 , rd_cntr = 93, wr_cntr = 93
	setx	0x000000c60d9c5f20, %r1, %r9
	setx	0x7e34fe4350e4bf0d, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000dfafa2c1d8, %r1, %r12
	setx	0x5b03c084e9b6d785, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000e4914507d8, %r1, %r12
	setx	0xf90b0efdc717e4d8, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000e4914507d8, %r1, %r12
	setx	0x2d1fbe0e382ecc90, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000800f7886c0, %r1, %r12
	ldx	[%r12], %r11
	ldx	[%r9], %r11
	setx	0x7e34fe4350e4bf0d, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
!	data_array 0 = 0x000000800fce9378 , rd_cntr = 94, wr_cntr = 94
!	data_array 1 = 0x000000800f7886c0 , rd_cntr = 94, wr_cntr = 94
!	data_array 2 = 0x000000f04f987c58 , rd_cntr = 94, wr_cntr = 94
!	data_array 3 = 0x000000d9efbb1008 , rd_cntr = 94, wr_cntr = 94
	setx	0x000000d0c6cd8bd0, %r1, %r9
	setx	0x465c2d5db07a40f9, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800ff61f10, %r1, %r12
	setx	0xc6a520c32589312c, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000c305f9f098, %r1, %r12
	setx	0xc1ff420d3003b518, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000800ec833e0, %r1, %r12
	setx	0x0f61191cdacd48db, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000f47154c8e0, %r1, %r12
	setx	0xf0df8ad7d9849426, %r1, %r13
	stx	%r13, [%r12]
	setx	0x000000800f7886c0, %r1, %r12
	ldx	[%r12], %r11
	ldx	[%r9], %r11
	setx	0x465c2d5db07a40f9, %r1, %r10
	cmp	%r10, %r11
	bne h_bad_end
	nop
!	data_array 0 = 0x000000800fce9378 , rd_cntr = 95, wr_cntr = 95
!	data_array 1 = 0x000000800f7886c0 , rd_cntr = 95, wr_cntr = 95
!	data_array 2 = 0x000000f04f987c58 , rd_cntr = 95, wr_cntr = 95
!	data_array 3 = 0x000000d9efbb1008 , rd_cntr = 95, wr_cntr = 95


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
