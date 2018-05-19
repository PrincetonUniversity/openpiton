// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: tr_immumiss0.s
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
/***********************************************************************
 * Name:   tr_immumiss0.s
 * Date:   02/14/02
 *
 *
 *  Description:
 *	- MMU miss traps followed by illegal instructions.
 *
 **********************************************************************/

/*******************************************************
 * My handler externsions
 *******************************************************/

#define	H_T0_fast_instr_access_MMU_miss immu_miss

#define	H_HT0_Illegal_instruction_0x10

#define	My_HT0_Illegal_instruction_0x10	done;

/*******************************************************/

#include "boot.s"

#define	SET_TAG_DATA_IN_REG(addr_reg, mask, reg1, reg2)	\
		setx	mask, reg1, reg2;		\
		set	0x1fff, reg1;			\
		andn	addr_reg, reg1, reg1;		\
		or	reg1, reg2, reg2;


.global sam_fast_immu_miss
.global sam_fast_dmmu_miss
.global	immu_miss

.text
.global main  

main:
	ta	T_CHANGE_PRIV

	setx	test_inst0, %l0, %l1	
	SET_TAG_DATA_IN_REG(%l1, 0x8000000100000001, %l4, %l5)
	mov	0x1, %o0
	call	%l1			! This take immumiss trap
	set	1, %l1

	setx	test_inst1, %l0, %l1	
	SET_TAG_DATA_IN_REG(%l1, 0xa000000100000005, %l4, %l5)
	add	%o0, 0x1, %o0
	call	%l1			! Check if Demap happens correctly
	set	2, %l1

	setx	test_inst0, %l0, %l1	! Check for multiple hit ?
	SET_TAG_DATA_IN_REG(%l1, 0x8000000100000001, %l4, %l5)
	mov	0x1, %o0
	call	%l1			! This take immumiss trap
	set	3, %l1


/*******************************************************
 * Exit code
 *******************************************************/

test_pass:
	ta		T_GOOD_TRAP

test_fail:
	ta		T_BAD_TRAP

/*******************************************************
 * My handler externsions
 *******************************************************/
immu_miss:

	brnz	%o0, insert_test_entry
	nop

standard_trap:

        ldxa [%g0] 0x51, %g1    ! 8k ptr
        ! ldxa [%g0] 0x52, %g2    ! 64k ptr

        ldda [%g1] 0x24, %g4
        mov  0x30, %g3
        stxa  %g4, [ %g3 ] 0x50
        stxa  %g5, [ %g0 ] 0x54
        retry
        nop

insert_test_entry:
	mov	0x30, %g6
	ldxa	[%g6] 0x50, %g3		! Check what is in there

	sub	%o0, 0x1, %g7
	sllx	%g7, 0x4, %g7
#if GET_FROM_FIX_TABLE			/*bad idea*/
	setx	tlb_entry0, %g1, %g2
	or	%g2, %g7, %g2
	ldda	[%g2] 0x24, %g4		! Both tag and data
#endif

	mov	0x30, %g6
	mov	0x18, %g7		! Insert at entry 3
	stxa	%l4, [%g6] 0x50		! IMMU Tag access register
!	stxa	%l5, [%g7] 0x55		! IMMU Data access register
 	stxa	%l5, [%g0] 0x54		! IMMU Data in register
	
	retry

.align 8192

test_inst0:
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x81c3e008		! retl
	.word	0x01000000

.align 8192
test_inst1:
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x81c3e008		! retl
	.word	0x01000000

/*******************************************************
 * Data section 
 *******************************************************/
.data

tlb_entry0:
	! Just make an entry with with priv mode
	! PRIV=1, G=1
	.xword 	0x0000000002402000		!test_inst0
	.xword	0x8000000102402001		!test_inst0 | 0x8000000100000001

	! with no priv, as for 64k page
	.xword 	0x0000000002404000
	.xword	0xa000000102404005		!test_inst1 | 0xa000000100000005

