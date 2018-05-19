// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: ctraps.s
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
.text

#define ASI_AS_IF_USER_BLK_INIT_ST_QUAD_LDD_S 0x22
	
#ifdef SPILL_RMO
.align 4
.global spill_trap
spill_trap:
	wr	%g0, ASI_AS_IF_USER_BLK_INIT_ST_QUAD_LDD_S, %asi
        stxa    %l0, [%sp + STACK_BIAS + 0x00] %asi
        stxa    %l1, [%sp + STACK_BIAS + 0x08] %asi
        stxa    %l2, [%sp + STACK_BIAS + 0x10] %asi
        stxa    %l3, [%sp + STACK_BIAS + 0x18] %asi
        stxa    %l4, [%sp + STACK_BIAS + 0x20] %asi
        stxa    %l5, [%sp + STACK_BIAS + 0x28] %asi
        stxa    %l6, [%sp + STACK_BIAS + 0x30] %asi
        stxa    %l7, [%sp + STACK_BIAS + 0x38] %asi
        stxa    %i0, [%sp + STACK_BIAS + 0x40] %asi
	wr	%g0, ASI_AS_IF_USER_PRIMARY, %asi
        stxa    %i1, [%sp + STACK_BIAS + 0x48] %asi
        stxa    %i2, [%sp + STACK_BIAS + 0x50] %asi
        stxa    %i3, [%sp + STACK_BIAS + 0x58] %asi
        stxa    %i4, [%sp + STACK_BIAS + 0x60] %asi
        stxa    %i5, [%sp + STACK_BIAS + 0x68] %asi
        stxa    %i6, [%sp + STACK_BIAS + 0x70] %asi
        stxa    %i7, [%sp + STACK_BIAS + 0x78] %asi
        saved
	membar #Sync
	retry
	nop

	
#else
.align 4
.global spill_trap
spill_trap:
	wr	%g0, ASI_AS_IF_USER_PRIMARY, %asi
        stxa    %l0, [%sp + STACK_BIAS + 0x00] %asi
        stxa    %l1, [%sp + STACK_BIAS + 0x08] %asi
        stxa    %l2, [%sp + STACK_BIAS + 0x10] %asi
        stxa    %l3, [%sp + STACK_BIAS + 0x18] %asi
        stxa    %l4, [%sp + STACK_BIAS + 0x20] %asi
        stxa    %l5, [%sp + STACK_BIAS + 0x28] %asi
        stxa    %l6, [%sp + STACK_BIAS + 0x30] %asi
        stxa    %l7, [%sp + STACK_BIAS + 0x38] %asi
        stxa    %i0, [%sp + STACK_BIAS + 0x40] %asi
        stxa    %i1, [%sp + STACK_BIAS + 0x48] %asi
        stxa    %i2, [%sp + STACK_BIAS + 0x50] %asi
        stxa    %i3, [%sp + STACK_BIAS + 0x58] %asi
        stxa    %i4, [%sp + STACK_BIAS + 0x60] %asi
        stxa    %i5, [%sp + STACK_BIAS + 0x68] %asi
        stxa    %i6, [%sp + STACK_BIAS + 0x70] %asi
        stxa    %i7, [%sp + STACK_BIAS + 0x78] %asi
        saved
	retry
	nop
#endif

.align 4
.global fill_trap

fill_trap:
	wr	%g0, ASI_AS_IF_USER_PRIMARY, %asi	
        ldxa    [%sp + STACK_BIAS + 0x00] %asi, %l0
        ldxa    [%sp + STACK_BIAS + 0x08] %asi, %l1
        ldxa    [%sp + STACK_BIAS + 0x10] %asi, %l2
        ldxa    [%sp + STACK_BIAS + 0x18] %asi, %l3
        ldxa    [%sp + STACK_BIAS + 0x20] %asi, %l4
        ldxa    [%sp + STACK_BIAS + 0x28] %asi, %l5
        ldxa    [%sp + STACK_BIAS + 0x30] %asi, %l6
        ldxa    [%sp + STACK_BIAS + 0x38] %asi, %l7
        ldxa    [%sp + STACK_BIAS + 0x40] %asi, %i0
        ldxa    [%sp + STACK_BIAS + 0x48] %asi, %i1
        ldxa    [%sp + STACK_BIAS + 0x50] %asi, %i2
        ldxa    [%sp + STACK_BIAS + 0x58] %asi, %i3
        ldxa    [%sp + STACK_BIAS + 0x60] %asi, %i4
        ldxa    [%sp + STACK_BIAS + 0x68] %asi, %i5
        ldxa    [%sp + STACK_BIAS + 0x70] %asi, %i6
        ldxa    [%sp + STACK_BIAS + 0x78] %asi, %i7
        restored
	retry
	nop

.data
	.word 0        
