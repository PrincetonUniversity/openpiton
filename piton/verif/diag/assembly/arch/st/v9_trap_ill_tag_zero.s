// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: v9_trap_ill_tag_zero.s
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
	mov %g0, %g1
	mov %g0, %g2
	mov %g0, %g3
	mov %g0, %g4
	mov %g0, %i7
		
!!-------------------------------------------------
!!  Trap on integer cond : ill_inst trap
!!-------------------------------------------------
	/* cond = 1000 cc1,cc0 = 01 */
	set     0x10,   %o0
        set     0x2b,    %o1
        ta      T_HTRAP_EN_N_TIMES

	nop
	.word	0x91d00800
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0006,	%l1

	/* cond = 1000 cc1,cc0 = 11 */
	.word	0x91d01800
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0006,	%l1

	/* cond = 0000 cc1,cc0 = 11 */
	.word	0x81d01800
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0006,	%l1

	/* cond = 0000 cc1,cc0 = 01 */
	.word	0x81d00800
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0006,	%l1

	/* cond = 1001 cc1,cc0 = 11 */
	.word	0x93d01800
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0006,	%l1

	/* cond = 1001 cc1,cc0 = 01 */
	.word	0x93d00800
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0006,	%l1

	/* cond = 0001 cc1,cc0 = 11 */
	.word	0x83d01800
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0006,	%l1

	/* cond = 0001 cc1,cc0 = 01 */
	.word	0x83d00800
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0006,	%l1

	/* cond = 1010 cc1,cc0 = 11 */
	.word	0x95d01800
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0006,	%l1

	/* cond = 1010 cc1,cc0 = 01 */
	.word	0x95d00800
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0006,	%l1

	/* cond = 0010 cc1,cc0 = 11 */
	.word	0x85d01800
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0006,	%l1

	/* cond = 0010 cc1,cc0 = 01 */
	.word	0x85d00800
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0006,	%l1

	/* cond = 1011 cc1,cc0 = 11 */
	.word	0x97d01800
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0006,	%l1

	/* cond = 1011 cc1,cc0 = 01 */
	.word	0x97d00800
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0006,	%l1

	/* cond = 0011 cc1,cc0 = 11 */
	.word	0x87d01800
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0006,	%l1

	/* cond = 0011 cc1,cc0 = 01 */
	.word	0x87d00800
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0006,	%l1

	/* cond = 1100 cc1,cc0 = 11 */
	.word	0x99d01800
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0006,	%l1

	/* cond = 1100 cc1,cc0 = 01 */
	.word	0x99d00800
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0006,	%l1

	/* cond = 0100 cc1,cc0 = 11 */
	.word	0x89d01800
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0006,	%l1

	/* cond = 0100 cc1,cc0 = 01 */
	.word	0x89d00800
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0006,	%l1

	/* cond = 1101 cc1,cc0 = 11 */
	.word	0x9bd01800
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0006,	%l1

	/* cond = 1101 cc1,cc0 = 01 */
	.word	0x9bd00800
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0006,	%l1

	/* cond = 0101 cc1,cc0 = 11 */
	.word	0x8bd01800
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0006,	%l1

	/* cond = 0101 cc1,cc0 = 01 */
	.word	0x8bd00800
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0006,	%l1

	/* cond = 1110 cc1,cc0 = 11 */
	.word	0x9dd01800
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0006,	%l1

	/* cond = 1110 cc1,cc0 = 01 */
	.word	0x9dd00800
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0006,	%l1

	/* cond = 0110 cc1,cc0 = 11 */
	.word	0x8dd01800
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0006,	%l1

	/* cond = 0110 cc1,cc0 = 01 */
	.word	0x8dd00800
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0006,	%l1

	/* cond = 1111 cc1,cc0 = 11 */
	.word	0x9fd01800
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0006,	%l1

	/* cond = 1111 cc1,cc0 = 01 */
	.word	0x9fd00800
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0006,	%l1

	/* cond = 0111 cc1,cc0 = 11 */
	.word	0x8fd01800
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0006,	%l1

	/* cond = 0111 cc1,cc0 = 01 */
	.word	0x8fd00800
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0006,	%l1

!!-------------------------------------------------
!!  write privileged reg : TL=0, rs1<= 3 
!!	-> ill inst trap
!!-------------------------------------------------
	/* should avoid the priveleged action */
	ta	T_CHANGE_PRIV
	nop

	/* TL=0 rs1 = 0 */
	.word	0x81900000
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0006,	%l1

	/* TL=0 rs1 = 1 */
	.word	0x81904000
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0006,	%l1

	/* TL=0 rs1 = 2 */
	.word	0x81908000
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0006,	%l1

	/* TL=0 rs1 = 3 */
	.word	0x8190c000
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0006,	%l1

	/* changed back to user mode */
	ta	T_CHANGE_NONPRIV	
	nop

!!-------------------------------------------------
!! Write State reg : ill_instr trap
!!-------------------------------------------------
	/* WRASR rd=15 rs1 != 0 */
	.word	0x9f804000
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0006,	%l1

	.word	0x9f808000
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0006,	%l1

	.word	0x9f810000
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0006,	%l1

	.word	0x9f820000
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0006,	%l1

	.word	0x9f840000
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0006,	%l1

	.word	0x9f87c000
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0006,	%l1

	/* WRASR rd=15 i!=1 i=0 */
	.word	0x9f800000
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0006,	%l1

/*
 ******************************************************
 *  	Tag Overflow
 ******************************************************
 */
!!----------------------------------
!!  Tag add : tag overflow trap
!!----------------------------------
	/* rs1[0] = 1 */
	set	0x1,	%l0
	set	0x4,	%l1
        set     0x23,   %o0	/* tag over flow trap */
	set	0x10,	%o1
        ta      T_TRAP_EN_N_TIMES
        nop
        taddcctv %l0,	%l1,	%l2
        nop
        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0003,     %l1
	
	/* rs1[1] = 1 */
	set	0x2,	%l0
	set	0x4,	%l1
        taddcctv %l0,	%l1,	%l2
        nop
        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0003,     %l1
	
	/* rs1[1,0] = 11 */
	set	0x3,	%l0
	set	0x4,	%l1
        taddcctv %l0,	%l1,	%l2
        nop
        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0003,     %l1
	
	/* rs2[0] = 1 */
	set	0x1,	%l0
	set	0x4,	%l1
        taddcctv %l1,	%l0,	%l2
        nop
        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0003,     %l1
	
	/* rs2[1] = 1 */
	set	0x2,	%l0
	set	0x4,	%l1
        taddcctv %l1,	%l0,	%l2
        nop
        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0003,     %l1
	
	/* rs2[1,0] = 11 */
	set	0x3,	%l0
	set	0x4,	%l1
        taddcctv %l1,	%l0,	%l2
        nop
        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0003,     %l1
	
	/* rs1,rs2[1,0] = 01 */
	set	0x1,	%l0
	set	0x1,	%l1
        taddcctv %l1,	%l0,	%l2
        nop
        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0003,     %l1
	
	/* rs1,rs2[1,0] = 11 */
	set	0x3,	%l0
	set	0x3,	%l1
        taddcctv %l1,	%l0,	%l2
        nop
        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0003,     %l1

!!----------------------------------
!!  Tag sub : tag overflow trap
!!----------------------------------
	/* rs1[0] = 1 */
	set	0x1,	%l0
	set	0x4,	%l1
        tsubcctv %l0,	%l1,	%l2
        nop
        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0003,     %l1
	
	/* rs1[1] = 1 */
	set	0x2,	%l0
	set	0x4,	%l1
        tsubcctv %l0,	%l1,	%l2
        nop
        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0003,     %l1
	
	/* rs1[1,0] = 11 */
	set	0x3,	%l0
	set	0x4,	%l1
        tsubcctv %l0,	%l1,	%l2
        nop
        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0003,     %l1
	
	/* rs2[0] = 1 */
	set	0x1,	%l0
	set	0x4,	%l1
        tsubcctv %l1,	%l0,	%l2
        nop
        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0003,     %l1
	
	/* rs2[1] = 1 */
	set	0x2,	%l0
	set	0x4,	%l1
        tsubcctv %l1,	%l0,	%l2
        nop
        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0003,     %l1
	
	/* rs2[1,0] = 11 */
	set	0x3,	%l0
	set	0x4,	%l1
        tsubcctv %l1,	%l0,	%l2
        nop
        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0003,     %l1
	
	/* rs1,rs2[1,0] = 01 */
	set	0x1,	%l0
	set	0x1,	%l1
        tsubcctv %l1,	%l0,	%l2
        nop
        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0003,     %l1
	
	/* rs1,rs2[1,0] = 11 */
	set	0x3,	%l0
	set	0x3,	%l1
        tsubcctv %l1,	%l0,	%l2
        nop
        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0003,     %l1

/*
 ********************************
 *      Divide by zero Trap
 ********************************
 */
!!---------------------------------------------
!!  Divide (64/32bit) by zero : trap
!!---------------------------------------------
	set	0x0,	%l0
	set	0x20,	%l1

        set     0x28,   %o0	/* divide by zero */
	set	0x6,	%o1
        ta      T_TRAP_EN_N_TIMES
        nop
       	udiv	%l1,	%l0,	%l2
        nop
        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0003,     %l1

       	sdiv	%l1,	%l0,	%l2
        nop
        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0003,     %l1

       	udivcc	%l1,	%l0,	%l2
        nop
        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0003,     %l1

       	sdivcc	%l1,	%l0,	%l2
        nop
        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0003,     %l1

!!---------------------------------------------
!!  Divide (64/32bit) by zero : trap
!!---------------------------------------------
	set	0x0,	%l0
	set	0x20,	%l1

       	udivx	%l1,	%l0,	%l2
        nop
        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0003,     %l1

       	sdivx	%l1,	%l0,	%l2
        nop
        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0003,     %l1

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
