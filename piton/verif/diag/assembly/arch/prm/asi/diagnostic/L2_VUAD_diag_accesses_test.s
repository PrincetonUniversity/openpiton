// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: L2_VUAD_diag_accesses_test.s
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
#define  THREAD_COUNT 1


#define  LSU_CONTROL_REG_ASI  0x45
#define         LSU_CONTROL_REG_DIMMU_MASK    0x0c
#define         LSU_CONTROL_REG_DMMU_MASK     0x08
#define         LSU_CONTROL_REG_IMMU_MASK     0x04
#define         LSU_CONTROL_REG_DCIC_MASK     0x03
#define         LSU_CONTROL_REG_DC_MASK       0x02
#define         LSU_CONTROL_REG_IC_MASK       0x01


#define	 L2_CTRL_REGS_BASE_VA_HI	0xa9
#define     L2_VA_HI_SAMT		32
#define		DBGEN_BIT_MASK			0x00100000
#define		ERRORSTEER_BIT_MASK		0x000f8000
#define		SCRUBINTERVAL_BIT_MASK		0x7ff8
#define		SCRUBENABLE_BIT_MASK		0x0004
#define		DMMMODE_BIT_MASK		0x0002
#define		DIS_BIT_MASK			0x0001

	
#define	 L2_CTRL_REGS_VA_INCR		64



!		3MB cache @ 12W SA ==>  3MB/12 = 1/4MB per set or 256KB	::  bit 18 set 	 
#define	 L2_STEP_SIZE			0x00040000

	
#define	 L2_DIAG_VA_HI_SAMT			32
	
#define	 L2_DIAG_DATA_ARRAY_BASE_VA_HI		0xA0

#define	 L2_DIAG_TAG_ARRAY_BASE_VA_HI		0xA4
	
#define	 L2_DIAG_VUAD_ARRAY_BASE_VA_HI		0xA6




#include "boot.s"

!
!       Test the L2 Tag array access backdoor
!



.text
.global main

main:                   !  test enters here from boot in user mode
        setx	active_thread, %l1, %o5 
        jmpl    %o5, %o7
        nop


!
!       Note that this 8KB segment should be mapped VA==PA==RA
!
SECTION .FIRST_THREAD_SEC TEXT_VA=0x0000000040008000
   attr_text {
        Name = .FIRST_THREAD_SEC,
        VA= 0x0000000040008000,
        PA= ra2pa(0x0000000040008000,0),
        RA= 0x0000000040008000,
        part_0_i_ctx_nonzero_ps0_tsb,
        part_0_d_ctx_nonzero_ps0_tsb,
        TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1,  TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
        }
   attr_text {
        Name = .FIRST_THREAD_SEC,
        hypervisor
        }

.global active_thread

active_thread:
        ta      T_CHANGE_HPRIV          ! enter Hyper mode

        ! disable fatal errors for vuad parity
        ! JBI_ERR_CONFIG
        setx 0x00000000, %g1, %g2       ! modify from 0x0c to 0x0
        setx 0x8000010000, %g1, %g3
        stx %g2, [%g3]

        add     %g0,LSU_CONTROL_REG_DCIC_MASK,%l0       ! D$ + I$ enable bits
        ldxa    [%g0]LSU_CONTROL_REG_ASI,%l1
        andn    %l1,%l0,%l1
	or	%l1,LSU_CONTROL_REG_IC_MASK,%l1
        stxa    %l1,[%g0]LSU_CONTROL_REG_ASI		! insure I$ enabled and D$ disabled
	
	or	%g0,L2_CTRL_REGS_BASE_VA_HI,%g1
	sllx	%g1,L2_VA_HI_SAMT,%g1		! build address of first L2 Control Reg

	ldx	[%g1+0],%l0			! get Bank 0 control reg
	or	%l0,DIS_BIT_MASK,%l0		! disable L2 bank 0
	stx	%l0,[%g1+0]

	ldx	[%g1+64],%l0			! get Bank 1 control reg
	or	%l0,DIS_BIT_MASK,%l0		! disable L2 bank 1
	stx	%l0,[%g1+64]
	
	ldx	[%g1+128],%l0			! get Bank 2 control reg
	or	%l0,DIS_BIT_MASK,%l0		! disable L2 bank 2	
	stx	%l0,[%g1+128]

	ldx	[%g1+192],%l0			! get Bank 2 control reg
	or	%l0,DIS_BIT_MASK,%l0		! disable L2 bank 3
	stx	%l0,[%g1+192]


	
All_caches_disabled:
	or	%g0,L2_DIAG_VUAD_ARRAY_BASE_VA_HI,%g1
	sllx	%g1,L2_VA_HI_SAMT,%g1		! build address 39:32 of L2 TAG Diag access

	or	%g0,%g0,%g2			! initialize loop counter
	or	%g0,  0x100,%g3			! loop incr value
	setx	0x000040000,%l0,%g4		! stop value & bit 18 mask
	or	%g0,1,%g5
	sll	%g5,22,%g5			! bit 22 mask

			
Write_loop_top:						 
	add	%g1,%g2,%l0
	add	%l0,0x00,%l0			
	stx	%l0,[%l0+0]

	add	%g1,%g2,%l1
	add	%l1,0x40,%l1			! bank 1, bits 5:3 = 001
	stx	%l1,[%l1+0]

	add	%g1,%g2,%l2
	add	%l2,0x80,%l2			! bank 2, bits 5:3 = 010
	stx	%l2,[%l2+0]
	
	add	%g1,%g2,%l3
	add	%l3,0xc0,%l3			! bank 3, bits 5:3 = 100
	stx	%l3,[%l3+0]

	add	%l0,%g5,%l4	
	stx	%l4,[%l4+0]

	add	%l1,%g5,%l5	
	stx	%l5,[%l5+0]
	
	add	%l2,%g5,%l6
	stx	%l6,[%l6+0]

	add	%l3,%g5,%l7	
	stx	%l7,[%l7+0]

	
	add	%g2,%g3,%g2			! next entry 	
	cmp	%g2,%g4			
	bl	Write_loop_top			! exit when = 0x000040000
	nop

	
Read_loop_setup:
	or	%g0,%g0,%g2			! initialize loop counter
	setx	0x003fffff,%l0,%g6		! mask for care about bits
	
Read_loop_top:

	add	%g1,%g2,%l0
	add	%l0,0x00,%l0
	ldx	[%l0+0],%i0

	add	%g1,%g2,%l1
	add	%l1,0x40,%l1
	ldx	[%l1+0],%i1

	add	%g1,%g2,%l2
	add	%l2,0x80,%l2
	ldx	[%l2+0],%i2
	
	add	%g1,%g2,%l3
	add	%l3,0xc0,%l3
	ldx	[%l3+0],%i3

	add	%l0,%g5,%l4	
	ldx	[%l4+0],%i4

	add	%l1,%g5,%l5	
	ldx	[%l5+0],%i5
	
	add	%l2,%g5,%l6	
	ldx	[%l6+0],%i6

	add	%l3,%g5,%l7	
	ldx	[%l7+0],%i7


	xor	%l0,%i0,%i0
	andcc	%i0,%g6,%i0			! check if care about bits mismatch
	bnz	Test_fail
	nop
	
	xor	%l1,%i1,%i1
	andcc	%i1,%g6,%i1			! check if care about bits mismatch
	bnz	Test_fail
	nop
	
	xor	%l2,%i2,%i2
	andcc	%i2,%g6,%i2			! check if care about bits mismatch
	bnz	Test_fail
	nop
	
	xor	%l3,%i3,%i3
	andcc	%i3,%g6,%i3			! check if care about bits mismatch
	bnz	Test_fail
	nop
	
	xor	%l4,%i4,%i4
	andcc	%i4,%g6,%i4			! check if care about bits mismatch
	bnz	Test_fail
	nop
	
	xor	%l5,%i5,%i5
	andcc	%i5,%g6,%i5			! check if care about bits mismatch
	bnz	Test_fail
	nop
	
	xor	%l6,%i6,%i6
	andcc	%i6,%g6,%i6			! check if care about bits mismatch
	bnz	Test_fail
	nop
	
	xor	%l7,%i7,%i7
	andcc	%i7,%g6,%i7			! check if care about bits mismatch
	bnz	Test_fail
	nop	
	
	add	%g2,%g3,%g2			! next entry
		
	cmp	%g2,%g4	
	bl	Read_loop_top			! exit when = 0x000040000			
	nop
	



Test_pass:
        ta      T_GOOD_TRAP
        nop
!
!
Test_fail:	
        ta      T_BAD_TRAP
        nop
	
