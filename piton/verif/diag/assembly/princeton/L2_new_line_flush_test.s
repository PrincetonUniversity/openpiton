// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: L2_Data_Array_diag_access_test_4T.s
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

	


#define	 L2_STEP_SIZE			0x00040000

	
#define	 L2_DIAG_VA_HI_SAMT			32
	
#define	 L2_DIAG_DATA_ARRAY_BASE_VA_HI		0xA0

#define	 L2_DIAG_TAG_ARRAY_BASE_VA_HI		0xA4
	
#define	 L2_DIAG_STATE_ARRAY_BASE_VA_HI		0xA6

#define	 L2_LINE_FLUSH_BASE_VA_HI		    0xA3




#include "boot.s"

!
!       Test the L2 State array access backdoor
!
!	do all 4 ways (0 to 3) :  
!	by sets (because it's not used by non-diag instructions): 
!
!

.text
.global main

main:                   !  test enters here from boot in user mode
        setx	active_thread, %l1, %o5 
        jmpl    %o5, %o7
        nop

!

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


        add     %g0,LSU_CONTROL_REG_DCIC_MASK,%l0       ! D$ + I$ enable bits
        ldxa    [%g0]LSU_CONTROL_REG_ASI,%l1
        andn    %l1,%l0,%l1
        stxa    %l1,[%g0]LSU_CONTROL_REG_ASI		! insure I$ & D$ are disabled


All_caches_disabled:		
	or	%g0,L2_DIAG_STATE_ARRAY_BASE_VA_HI,%g1
	sllx	%g1,L2_VA_HI_SAMT,%g1		! build address 39:32 of L2 Diag access
	or	%g1,%g0,%l4			! Access address & bank

Make_word_addresses:
	setx	0x00000000,%l0,%l1
	or	%l1,%l4,%i0			


	setx	0x00000000,%l0,%l7		! mask for bits 7:6
	or	%g0,0,%l5			! starting way

	
Write_loop_top1:
	sll	%l5,14,%l5			! move into position

Write_set_0:
    or	%g0,0x3c0,%l1		! choose set 0x0f
	or	%l5,%l1,%l6			! insert Way, set is 0
	
	setx	0x0c001000,%l0,%l1
	or	%l6,%i0,%l0
	stx	%l1,[%l0+0]			! write our 4 test words for set 0
Write_loop_end2:	
	srl	%l5,14,%l5			! move way back to lsb
	cmp	%l5,0x00
	bl	Write_loop_top1
	add	%l5,1,%l5			! next way

flush_line:
    or	%g0,L2_LINE_FLUSH_BASE_VA_HI,%g1
	sllx	%g1,L2_VA_HI_SAMT,%g1		! build address 39:32 of L2 Diag access
	or	%g1,%g0,%l4			! Access address & bank
	setx	0x000043c0,%l0,%l1
	or	%l1,%l4,%i1			
    ldub [%i1+0],%i1

	
	
Read_loop_setup:	 

	setx	0xf0000000,%l0,%l1
	sllx	%l1,32,%l1
	sub	%g0,1,%l0			! easy way to get all 1's (64 bits)
	xor	%l0,%l1,%l4			! mask to clear bits
	or	%g0,%g0,%l5			! starting way

Read_loop_top1:
	sll	%l5,14,%l5			! move into position

Read_set_0:
    or	%g0,0x3c0,%l1       ! choose set 0x0f	
	or	%l5,%l1,%i6			! insert Way, set is 0
	
	or	%i6,%i0,%l0
	ldx	[%l0+0],%o0			! read and check our 4 test words

	setx	0x00001000,%l0,%l1
	xor	%o0,%l1,%o0
	andcc	%o0,%l4,%o0			
	bnz	Test_fail
	nop
	
    or	%g0,0x3c0,%l6				
		

Read_loop_end2:
	srl	%l5,14,%l5			! move way back to lsb
	cmp	%l5,0x00
	bl	Read_loop_top1
	add	%l5,1,%l5			! next way


Test_pass:
        ta      T_GOOD_TRAP
        nop
!
!
Test_fail:	
        ta      T_BAD_TRAP
        nop
	
