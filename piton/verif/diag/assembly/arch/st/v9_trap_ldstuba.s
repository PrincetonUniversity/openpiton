// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: v9_trap_ldstuba.s
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

!!-------------------------------------------------------------------------------
!!
!!	This file has the micro-code to test out all the traps specified
!!	in the SPARC-V9 trap table. 
!!
!!-------------------------------------------------------------------------------
	
#include "boot.s"

.text
.global main
.global misalign_sum3

main:

!!---------------------------------------------
!! Ldstub from ASI
!!	PSTATE.PRIV = 0 & asi[7] = 1b0
!!---------------------------------------------
        set     0x37,   %o0	/* Priveleged action trap */
	set	0x4,	%o1
        ta      T_HTRAP_EN_N_TIMES
        nop
	
	set	0xaa, %l0
	mov     0x0, %l2
	ldstuba	[%l2] 0x7f,	%l0
        nop
        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0005,     %l1

	cmp     %l0, 0xaa
	bne	diag_fail
	nop
			
	wr	%g0,	0x7f,	%asi
	rd      %asi, %l7
	
	set	0x160000,	%l2
	ldstuba	[%l2] %asi,	%l0
        nop
        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0005,     %l1
	
	cmp     %l0, 0xaa
	bne	diag_fail
	nop
	

second_round:	

	ldstuba	[%l2] 0x7f,	%l0
        nop
        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0005,     %l1

	wr	%g0,	0x7f,	%asi
	rd      %asi, %l7
	
	set	0x160000,	%l2
	ldstuba	[%l2] %asi,	%l0
        nop
        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0005,     %l1

	
/*
 ********************************
 *      Diag PASSED !           *
 ********************************
 */
diag_pass:
        set     0xaaddcafe,     %l0
        ta T_GOOD_TRAP
        nop

/*
 ********************************
 *      Diag FAILED !           *
 ********************************
 */
diag_fail:
        set     0xdeadcafe,     %l0
        ta T_BAD_TRAP
        nop
        nop

misalign_sum3:
        save    %sp,    -96,    %sp
        add     %i0,    %i1,    %l7
        add     %l7,    %i2,    %l7

        set     0x34,   %o0	/* mem addr misaligned */
        ta      T_HTRAP_EN
        nop
	return	%i7+1	/* misaligned addr return */
        nop
        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0004,     %l1

	return 	%i7+8	/* good return */ 
	nop

.data

fpdt_data:
	.xword	0xffff0000eeee1111
	.xword	0xffff0000eeee2222
	.xword	0xffff0000eeee3333
	.xword	0xffff0000eeee4444
.end

/*
 ***************************************************
 * Pages defined to test out the MMU access traps 
 ***************************************************
 */
 
#define	IDAEXECPG_BASE_TEXT_ADDR	0x250000		
#define	IDAEXECPG_BASE_TEXT_ADDR_PA	0x100250000
#define	IDAEXECPG_BASE_DATA_ADDR	0x260000
#define	IDAEXECPG_BASE_DATA_ADDR_PA	0x100260000			

SECTION .IDAEXEC_PAGE TEXT_VA=IDAEXECPG_BASE_TEXT_ADDR, DATA_VA=IDAEXECPG_BASE_DATA_ADDR
attr_text {
        Name = .IDAEXEC_PAGE,
        VA=IDAEXECPG_BASE_TEXT_ADDR, PA=IDAEXECPG_BASE_TEXT_ADDR_PA,
        RA=IDAEXECPG_BASE_TEXT_ADDR_PA,
        part_0_i_ctx_nonzero_ps0_tsb,
        TTE_G=1, TTE_Context=0, TTE_V=0, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0, 
        TTE_L=0, TTE_CP=0, TTE_CV=0, TTE_E=0, TTE_P=1, TTE_W=0
        }
        
attr_data {
        Name = .IDAEXEC_PAGE,
        VA=IDAEXECPG_BASE_DATA_ADDR, PA=IDAEXECPG_BASE_DATA_ADDR_PA,
        RA=IDAEXECPG_BASE_DATA_ADDR_PA,
        part_0_d_ctx_nonzero_ps0_tsb,
        TTE_G=0, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0, 
        TTE_L=0, TTE_CP=0, TTE_CV=0, TTE_E=0, TTE_P=1, TTE_W=0
        }

.text

.global  idaexec_start 
.global  idaexec_d1	

idaexec_start:
	set	0x0,	%l0
	set	0x1,	%l1
	add	%l1,	%l0,	%l2
	return

.data	

idaexec_d1:	.word	0x11223344
		.word	0x11223355
		.word	0x11223366
		.word	0x11223377
.end

/*
 ************************************************************
 *	Section defined to test the Data Protection trap
 ************************************************************
 */
#define	IDAPROTPG_BASE_TEXT_ADDR	0x350000		
#define	IDAPROTPG_BASE_TEXT_ADDR_PA	0x100350000
#define	IDAPROTPG_BASE_DATA_ADDR	0x360000
#define	IDAPROTPG_BASE_DATA_ADDR_PA	0x100360000			

SECTION .IDAPROT_PAGE TEXT_VA=IDAPROTPG_BASE_TEXT_ADDR, DATA_VA=IDAPROTPG_BASE_DATA_ADDR
attr_text {
        Name = .IDAPROT_PAGE,
        VA=IDAPROTPG_BASE_TEXT_ADDR, PA=IDAPROTPG_BASE_TEXT_ADDR_PA,
        RA=IDAPROTPG_BASE_TEXT_ADDR_PA,
        part_0_i_ctx_nonzero_ps0_tsb,
        TTE_G=1, TTE_Context=0, TTE_V=0, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0, 
        TTE_L=0, TTE_CP=0, TTE_CV=0, TTE_E=0, TTE_P=1, TTE_W=0
        }
        
attr_data {
        Name = .IDAPROT_PAGE,
        VA=IDAPROTPG_BASE_DATA_ADDR, PA=IDAPROTPG_BASE_DATA_ADDR_PA,
        RA=IDAPROTPG_BASE_DATA_ADDR_PA,
        part_0_d_ctx_nonzero_ps0_tsb,
        TTE_G=0, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0, 
        TTE_L=0, TTE_CP=0, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=0
        }

.text

.global  idaprot_start 
.global  idaprot_d1	

idaprot_start:
	set	0x0,	%l0
	set	0x1,	%l1
	add	%l1,	%l0,	%l2
	return

.data	

idaprot_d1:	.word	0x11223344
		.word	0x11223355
		.word	0x11223366
		.word	0x11223377
.end
