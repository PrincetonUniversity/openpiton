// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: tr_iaccexc0.s
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
 * Name:   tr_iaccexc0.s
 * Date:   02/12/02
 *
 *
 *  Description:
 *	- Generate inst. access exception.  	
 *
 **********************************************************************/

/*******************************************************
 * My handler externsions
 *******************************************************/

#define	H_HT0_Instruction_access_exception_0x08 iacc_exc


/*******************************************************/
#define MAIN_PAGE_HV_ALSO
#include "boot.s"

#define	SET_TAG_DATA_IN_REG(addr_reg, mask, reg1, reg2)	\
		setx	mask, reg1, reg2;		\
		set	0x1fff, reg1;			\
		andn	addr_reg, reg1, reg1;		\
		or	reg1, reg2, reg2;

.global sam_fast_immu_miss
.global sam_fast_dmmu_miss
.global	immu_miss
.global	iacc_exc

.text
.global main  

main:
	ta	T_CHANGE_NONPRIV

	setx	test_inst0, %l0, %l1	
	SET_TAG_DATA_IN_REG(%l1, 0x8000000100000001, %l4, %l5)

	mov	0x1, %o0

	call	%l1			! This will cause 0x64/0x8
	nop


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

#if 0
	setx	tlb_entry0, %g1, %g2
	ldda	[%g2] 0x24, %g4		! Both tag and data
#endif

	mov	0x30, %g6
	mov	0x18, %g7		! Insert at entry 3
	stxa	%l4, [%g6] 0x50		! IMMU Tag acess register
!	stxa	%l5, [%g7] 0x55		! IMMU Data acess register
 	stxa	%l5, [%g0] 0x54		! IMMU Data acess register
	
	retry

iacc_exc:
	rdpr	%tstate, %g1
        mov	1, %g2
        sll	%g2, 10, %g2
        or	%g1, %g2, %g1
        wrpr	%g0, %g1, %tstate
	retry

/*******************************************************
 * Data section 
 *******************************************************/
.data

tlb_entry0:
	! Just make an entry with with priv mode
	! PRIV=1, G=1
	.xword 	0x0000000000162000,	0x8000000100162005


SECTION .MYPRIV  TEXT_VA=0x20008000

attr_text {
        Name = .MYPRIV,
        VA= 0x20008000,
        RA= 0x20008000,
        PA= ra2pa(0x20008000,0),
        part_0_i_ctx_nonzero_ps0_tsb,
        TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=0, TTE_CV=0, TTE_E=0, TTE_P=1, TTE_W=1
        }
.text
.align 8192
.global test_inst0
test_inst0:
	.word	0x01000000
	.word	0x01000000
	.word	0x01000000
	.word	0x01000000
	.word	0x01000000
	.word	0x01000000
	.word	0x81c3e008
	.word	0x01000000


