// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: ssi_ldst.s
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
 * Name:   
 * Date:   
 *
 *
 *  Description:
 *
 **********************************************************************/
	
#include "boot.s"

.text
.global main  
	
main:
	setx ssi_data, %l1, %l0
	ldx [%l0], %i0
	setx 0xffffffffffffffff, %o1, %o0
	cmp %o0, %i0
	bne fail
	nop

	setx 0xa5a5a5a5a5a5a5a5, %o1, %i0
	stx %i0, [%l0]
	ldx [%l0], %i0
	setx 0xa5a5a5a5a5a5a5a5, %o1, %o0
	cmp %o0, %i0
	bne fail
	nop

	mov  0, %i1
try_byte_writes_ff:
	setx 0xff, %o1, %i0
	stub %i0, [%l0+%i1]
	ldub [%l0+%i1], %i0
	setx 0xff, %o1, %o0
	cmp %o0, %i0                       ! check that each byte write was ok.
	bne fail
	nop
	inc %i1
	cmp %i1, 8
      	bne try_byte_writes_ff
	nop
	ldx [%l0], %i0                     ! Now check that all bytes were written
	setx 0xffffffffffffffff, %o1, %o0
	cmp %o0, %i0
	bne fail
	nop

	mov  0, %i1
try_byte_writes_a5:
	setx 0xa5, %o1, %i0
	stub %i0, [%l0+%i1]
	ldub [%l0+%i1], %i0
	setx 0xa5, %o1, %o0
	cmp %o0, %i0                       ! check that each byte write was ok.
	bne fail
	nop
	inc %i1
	cmp %i1, 8
      	bne try_byte_writes_a5
	nop
	ldx [%l0], %i0                     ! Now check that all bytes were written
	setx 0xa5a5a5a5a5a5a5a5, %o1, %o0
	cmp %o0, %i0
	bne fail
	nop


	mov  0, %i1
try_halfword_writes_ff:
	setx 0xffff, %o1, %i0
	stuh %i0, [%l0+%i1]
	lduh [%l0+%i1], %i0
	setx 0xffff, %o1, %o0
	cmp %o0, %i0                       ! check that each byte write was ok.
	bne fail
	nop
	add %i1,2,%i1
	cmp %i1, 8
      	bne try_halfword_writes_ff
	nop
	ldx [%l0], %i0                     ! Now check that all bytes were written
	setx 0xffffffffffffffff, %o1, %o0
	cmp %o0, %i0
	bne fail
	nop

	mov  0, %i1
try_halfword_writes_a5:
	setx 0xa5a5, %o1, %i0
	stuh %i0, [%l0+%i1]
	lduh [%l0+%i1], %i0
	setx 0xa5a5, %o1, %o0
	cmp %o0, %i0                       ! check that each byte write was ok.
	bne fail
	nop
	add %i1,2,%i1
	cmp %i1, 8
      	bne try_halfword_writes_a5
	nop
	ldx [%l0], %i0                     ! Now check that all bytes were written
	setx 0xa5a5a5a5a5a5a5a5, %o1, %o0
	cmp %o0, %i0
	bne fail
	nop


	mov  0, %i1
try_word_writes_ff:
	setx 0xffffffff, %o1, %i0
	stuw %i0, [%l0+%i1]
	lduw [%l0+%i1], %i0
	setx 0xffffffff, %o1, %o0
	cmp %o0, %i0                       ! check that each byte write was ok.
	bne fail
	nop
	add %i1,4,%i1
	cmp %i1, 8
      	bne try_word_writes_ff
	nop
	ldx [%l0], %i0                     ! Now check that all bytes were written
	setx 0xffffffffffffffff, %o1, %o0
	cmp %o0, %i0
	bne fail
	nop

	mov  0, %i1
try_word_writes_a5:
	setx 0xa5a5a5a5, %o1, %i0
	stuw %i0, [%l0+%i1]
	lduw [%l0+%i1], %i0
	setx 0xa5a5a5a5, %o1, %o0
	cmp %o0, %i0                       ! check that each byte write was ok.
	bne fail
	nop
	add %i1,4,%i1
	cmp %i1, 8
      	bne try_word_writes_a5
	nop
	ldx [%l0], %i0                     ! Now check that all bytes were written
	setx 0xa5a5a5a5a5a5a5a5, %o1, %o0
	cmp %o0, %i0
	bne fail
	nop


pass:
	ta		T_GOOD_TRAP

fail:
	ta		T_BAD_TRAP

SECTION .SSI_DATA_SEG DATA_VA=0xfff0002000
attr_data {
        Name = .SSI_DATA_SEG,
        VA=0xfff0002000,
        RA=0xfff0002000,
        PA=0xfff0002000,
        part_0_d_ctx_nonzero_ps0_tsb,
        TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=0, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=1
        }
.data
.global ssi_data
ssi_data:
.xword 0xffffffffffffffff 
.word 0x00000000
.word 0x00000000
.word 0x00010203
.word 0x04050607
