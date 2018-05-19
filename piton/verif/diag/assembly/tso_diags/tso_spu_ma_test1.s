// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: tso_spu_ma_test1.s
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
/***************************************************************************
***
***  Program File: tso_spu_ma_test1.s
***
***  Description : one thread performs SPU loads and stores to an address
***  Other threads perfrom normal loads and stores to this address.
***
**********************************************************************/

#include "spu_diag.h"
#include "enable_traps.h"

! These *Trap_Instruction* defines redefine macros in the boot code.

#define H_HT0_HTrap_Instruction_0 user_spu_load_mamem_sub
#define H_HT0_HTrap_Instruction_1 user_spu_store_mamem_sub

#define DATA_SRC_RA 0x0000000170000080
#define DATA_SRC_PA ra2pa(DATA_SRC_RA, 0)
#define DATA_DEST_RA 0x0000000170000800
#define DATA_DEST_PA ra2pa(DATA_DEST_RA, 0)
	
#define MAIN_PAGE_HV_ALSO
#include "boot.s"

! This macro will initiate an SPU Load MA Memory operation.
! The Load MA Memory operation moves data from main memory to
! MA Memory.
! This trap will go to hypervisor. The arguments to the trap
! are as follows:
! %i0: Size of load minus one (in xwords)
! %i1: Value for the MPA register, which is the main memory physical adr
! %i2: Xword offset into MA memory for the load data to be written.
! %i3: Thread id of the thread calling this trap.
! The result of the ldxa from MASync is returned in %i0. This value
! will be zero if the operation completed. If the operation was aborted,
! the value will be 1.
! Note that the size of MA Memory is 160 xwords, so the values
! provided for the size of the load and the offset must be within
! the bounds of 160 xwords.
! The T_HTRAP_INST0 will go to H_T0_Trap_Instruction_0 above to
! supervisor code, then trap to hypervisor.

define(user_spu_load_mamem, `
        ta T_HTRAP_INST0
')dnl

! This macro will initiate an SPU Store MA Memory operation.
! The Store MA Memory operation moves data from MA Memory to
! main memory.
! This trap will go to hypervisor. The arguments to the trap
! are as follows:
! %i0: Size of store minus one (in xwords)
! %i1: Value for the MPA register, which is the main memory physical adr
! %i2: Xword offset into MA memory for the store data to be read.
! %i3: Thread id of the thread calling this trap.
! The result of the ldxa from MASync is returned in %i0. This value
! will be zero if the operation completed. If the operation was aborted,
! the value will be 1.
! Note that the size of MA Memory is 160 xwords, so the values
! provided for the size of the store and the offset must be within
! the bounds of 160 xwords.
! The T_HTRAP_INST0 will go to H_T0_Trap_Instruction_1 above to
! supervisor code, then trap to hypervisor.

define(user_spu_store_mamem, `
        ta T_HTRAP_INST1
')dnl

!-------------------------------------------------------------------

.global main
.global th_main_0
.global th_main_1
.global th_main_2
.global th_main_3
.global th_main_4
.global th_main_5
.global th_main_6
.global th_main_7
.global user_spu_load_mamem_sub
.global user_spu_store_mamem_sub

.text
main:
	th_fork(th_main,%l0)

	
th_main_0:

	set	0x8, 	%o1
	setx	DATA_SRC, %g1, %o0

loop0:

! preload the data
	ldx	[%o0 + 0x0],  %l0
	ldx	[%o0 + 0x8],  %l1
	ldx	[%o0 + 0x10], %l2
	ldx	[%o0 + 0x18], %l3
	ldx	[%o0 + 0x20], %l4
	ldx	[%o0 + 0x28], %l5
	ldx	[%o0 + 0x30], %l6
	ldx	[%o0 + 0x38], %l7

! prepare the data
	inc	%l0
	inc	%l1
	inc	%l2
	inc	%l3
	inc	%l4
	inc	%l5
	inc	%l6
	inc	%l7
	
! store the data
	stx	%l0, [%o0 + 0x0] 
	stx	%l1, [%o0 + 0x8]  
	stx	%l2, [%o0 + 0x10] 
	stx	%l3, [%o0 + 0x18] 
	stx	%l4, [%o0 + 0x20] 
	stx	%l5, [%o0 + 0x28] 
	stx	%l6, [%o0 + 0x30] 
	stx	%l7, [%o0 + 0x38]

! load the SPU	
	set	7, %i0
	setx	DATA_SRC_PA, %g1, %i1
	set	1, %i2
	set     0, %i3
	user_spu_load_mamem

! store the SPU	
	set	7, %i0
	setx	DATA_DEST_PA, %g1, %i1
	set	1, %i2
	set     0, %i3
	user_spu_store_mamem

	dec	%o1
	brnz	%o1, loop0
	nop

	ba	diag_pass
	nop

th_main_1:
th_main_2:
th_main_3:
th_main_4:
th_main_5:
th_main_6:
th_main_7:

	set	DATA_DEST, %o0

! read until flag is set.
loop1:
	ldx	[%o0 + 0x38], %i0
	sub	%i0, 8, %i0
	brnz	%i0, loop1
#ifdef PREFETCH	
	prefetch [%o0 + 0x38], #n_reads
#else
	ldx	[%o0 + 0x38], %i0
#endif

! Compare the bytes in DATA_SRC vs DATA_DEST.
! Compare all of mamem in case the logic overwrites
! its bounds.
compare_results:		
	set	DATA_SRC, %i0 
	set	DATA_DEST, %i1
 	set	8, %i2
	
cmp_label:
	!! Compare extended words (length in %i2) from [%i0] and [%i1]
	ldx	[%i0], %l3		
	ldx	[%i1], %l4
	cmp	%l3, %l4
	bne,pn	%xcc, diag_fail
	nop
	add	%i0, 8, %i0
	add	%i1, 8, %i1
	sub	%i2, 1, %i2
	cmp	%i2, 0
	bg,a	cmp_label
	nop

	ba	diag_pass
	nop

diag_pass:
        set     0xc001dea1,     %l0
        ta T_GOOD_TRAP
        nop

/*
 ********************************
 *      Diag FAILED !           *
 ********************************
 */

diag_fail:
        set     0xdeadcafe,     %l7
        ta T_BAD_TRAP
        nop
	
user_spu_load_mamem_sub:
	rd      %asi, %g3
	wr	%g0, SPU_ASI, %asi
	set	REG_MA_ADDR_ADDR, %g1
        stxa %i2, [%g0 + %g1] SPU_ASI
	set	REG_MPA_ADDR, %g1
        stxa %i1, [%g0 + %g1] SPU_ASI
	and	%i0, 0x3f, %i0
	sll     %i3, 11, %i3
	or      %i0, %i3, %i0
	set	REG_MA_CTL_ADDR, %g1
        stxa %i0, [%g0 + %g1] SPU_ASI
	set     1, %i0
	set	MASync_ADDR, %g1
        ldxa [%g0 + %g1] SPU_ASI, %i0
	wr      %g0, %g3, %asi
	done

user_spu_store_mamem_sub:		
	rd      %asi, %g3
	wr	%g0, SPU_ASI, %asi
	set	REG_MA_ADDR_ADDR, %g1
        stxa %i2, [%g0 + %g1] SPU_ASI
	set	REG_MPA_ADDR, %g1
        stxa %i1, [%g0 + %g1] SPU_ASI
	and	%i0, 0x3f, %i0
	sll     %i3, 11, %i3
	or      %i0, %i3, %i0
	or      %i0, 0x40, %i0
	set	REG_MA_CTL_ADDR, %g1
        stxa %i0, [%g0 + %g1] SPU_ASI
	set     1, %i0
	set	MASync_ADDR, %g1
        ldxa [%g0 + %g1] SPU_ASI, %i0
	wr      %g0, %g3, %asi
	done

!========================================
.data
.align 64
DATA_START:
	.word	0xdeadbeef
 ! align to the L2 cache line size
.align  128
DATA_SRC:
	.skip 0x200

.align 2048
DATA_DEST:
	.skip 0x200
	.xword 0x1234567890abcdef
.align 2048
.section .bss
BSS_DATA:
	.word	0x12345678
	
.end
