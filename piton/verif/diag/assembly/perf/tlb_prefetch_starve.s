// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: tlb_prefetch_starve.s
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
#define THREAD_COUNT  4
#define THREAD_STRIDE 1
#define MAIN_PAGE_HV_ALSO
#include "boot.s"

!sims -vcs_run -nosas -sys=ciop tlb_prefetch_starve.s -finish_mask=8 -fast_boot

.text
.global main
main:
        setx l1_hit_0, %l1, %l3
        setx l1_tlb_miss1, %l1, %l2

th_fork(th_main)
th_main_0:
next_load0:
        ldx [%l3], %l1
        ldx [%l3], %l1
        ldx [%l3], %l1
        ldx [%l3], %l1
        ldx [%l3], %l1
        ldx [%l3], %l1
        ldx [%l3], %l1
        ldx [%l3], %l1
        ldx [%l3], %l1
th_main_1:
        ldx [%l3], %l1
        ldx [%l3], %l1
        ldx [%l3], %l1
        ldx [%l3], %l1
        ldx [%l3], %l1
        ldx [%l3], %l1
        ldx [%l3], %l1
        ldx [%l3], %l1
        ldx [%l3], %l1
        ldx [%l3], %l1
        ldx [%l3], %l1
        ldx [%l3], %l1
th_main_2:
        ldx [%l3], %l1
        ldx [%l3], %l1
        ldx [%l3], %l1
        ldx [%l3], %l1
        ldx [%l3], %l1
        ldx [%l3], %l1
        ldx [%l3], %l1
        ldx [%l3], %l1
        ba  next_load0
        ldx [%l3], %l1

        ta T_GOOD_TRAP
        nop

th_main_3:
        setx l1_hit_3,   %l1, %l2
        ld  [%l2], %g1

        setx l1_hit_3_1, %l1, %l2
        ld  [%l2], %g1

        setx l1_tlb_miss, %l1, %l2
	ta   T_CHANGE_HPRIV
	wrpr %g0, %g0, %tick
	ta   T_CHANGE_NONHPRIV
        ld  [%l2], %g1

	rd  %tick, %l7
	set 0x1000, %l6
	cmp %l7, %l6
	ble pass
        nop

	ta T_BAD_TRAP
	nop

pass:
        ta T_GOOD_TRAP
        nop

.data
l1_hit_0:
.xword 0x12345678

.align 64
l1_hit_1:
.xword 0x12345678

.align 64
l1_hit_2:
.xword 0x12345678

.align 64
l1_hit_3:
.xword 0x12345678

.align 64
l1_hit_3_1:
.xword 0x12345678


.align 8192
l1_tlb_miss:
.xword 0x12345678

.align 8192
l1_tlb_miss1:
.xword 0x12345678
