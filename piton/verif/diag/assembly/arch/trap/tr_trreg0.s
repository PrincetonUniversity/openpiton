// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: tr_trreg0.s
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
 * Name:   tr_trreg0.s
 * Date:   02/15/02
 *
 *
 *  Description:
 * 	-  Here we try to change TBA
 *
 **********************************************************************/

/*******************************************************
 * My handler externsions
 *******************************************************/

#define H_T0_Fp_disabled_0x20 my_privileged_opcode 

/*******************************************************/

#include "boot.s"

.text
.global main  

main:
	ta	T_CHANGE_PRIV

	! Save tba first

	rdpr	%tba, %g1		!save %tba

	! Need to move code from one place to other

	setx	my_privileged_opcode, %l0, %g5		! org trap handler is here
	setx	my_copied_privileged_opcode, %l0, %g4	! new trap handler is here
	mov	0x400, %l0
	or	%g4, %l0, %g4

	! cause a trap with org tba
	mov 	%g0, %l7
	.word   0x81a00000		! This should cause trap
	cmp	%l7, %g5
	bne	test_fail
	nop


	! Move 32 lines for code from one place to the other

	mov	0x1f, %l1
	mov	0x0, %l2

relocate_loop:

	sll	%l2, 0x2, %l3

	ld	[%g5+%l3], %l4		!source page at insert_test_entry
	st	%l4, [%g4+%l3]		! relocate code at tba (%g4)
	
	add	%l2, 0x1, %l2
	brnz,a	%l1, relocate_loop
	subcc	%l1, 0x1, %l1


	! Write tba

	wrpr	%g4, %tba
	mov 	%g0, %l7
	.word   0x81a00000		! This should cause trap
	nop				! new tba will be used
	! Write the original tba back

	wrpr	%g1, %tba

	cmp	%l7, %g4
	bne	test_fail
	nop


/*******************************************************
 * Exit code
 *******************************************************/

test_pass:
	ta		T_GOOD_TRAP

bad_trap:
test_fail:
	ta		T_BAD_TRAP

/*******************************************************
 * My handler externsions
 *******************************************************/
SECTION .USER_TRAP_FOR_SUP TEXT_VA=0x2000c000
attr_text {
        Name = .USER_TRAP_FOR_SUP,
        RA=0x2000c000,
        PA=ra2pa(0x2000c000,0),
        part_0_i_ctx_zero_ps0_tsb,
        TTE_G=1, TTE_Context=0, TTE_V=1, TTE_Size=0x0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=1, TTE_CV=0, TTE_E=0, TTE_P=1, TTE_W=0
        }
attr_text {
        Name = .USER_TRAP_FOR_SUP,
        VA=0x2000c000,
        RA=0x2000c000,
	part_0_d_ctx_nonzero_ps0_tsb
	tsbonly,
	TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0x0, TTE_NFO=0,
	TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
	TTE_L=0, TTE_CP=1, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=0
	}

.global my_privileged_opcode
my_privileged_opcode:
        rd %pc, %l7
	nop
        done
        nop;nop;nop;nop;nop;nop;nop;nop;
        nop;nop;nop;nop;nop;nop;nop;nop;
        nop;nop;nop;nop;nop;nop;nop;nop;
        nop;nop;nop;nop;nop;nop;nop;nop;



SECTION .USER_LOCAL_TRAP TEXT_VA=0x20008000
attr_text {
        Name = .USER_LOCAL_TRAP,
        RA=0x20008000,
        PA=ra2pa(0x20008000,0),
        part_0_i_ctx_zero_ps0_tsb,
        TTE_G=1, TTE_Context=0, TTE_V=1, TTE_Size=0x0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=1, TTE_CV=0, TTE_E=0, TTE_P=1, TTE_W=0
        }
attr_text {
        Name = .USER_LOCAL_TRAP,
        VA=0x20008000,
        RA=0x20008000,
	part_0_d_ctx_nonzero_ps0_tsb
	tsbonly,
	TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0x0, TTE_NFO=0,
	TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
	TTE_L=0, TTE_CP=1, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=1
	}

.global my_copied_privileged_opcode
my_copied_privileged_opcode:
	nop
	nop
	nop
	nop

