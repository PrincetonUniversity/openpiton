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
#define  THREAD_COUNT 4


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

	


!		3MB cache @ 12W SA ==>  3MB/12 = 1/4MB per set or 256KB	::  bit 18 set 	 
#define	 L2_STEP_SIZE			0x00040000

	
#define	 L2_DIAG_VA_HI_SAMT			32
	
#define	 L2_DIAG_DATA_ARRAY_BASE_VA_HI		0xA0

#define	 L2_DIAG_TAG_ARRAY_BASE_VA_HI		0xA4
	
#define	 L2_DIAG_VUAD_ARRAY_BASE_VA_HI		0xA6




#include "boot.s"

!
!       Test the L2 Data array access backdoor
!
!	do all 12 ways (0 to 11) :  
!	by sets 0,1,2,4,8,16,32,64,128,256,512 (10 bits as one hots and all bits off) : 
!	by 4 words DW0 odd, DW1 even, DW2 odd, DW4 even
!
!	Each thread tests a seperate bank, i.e. TH0 tests bank 0, while TH3 tests bank 3
!

.text
.global main

main:                   !  test enters here from boot in user mode

th_fork(th_main)
th_main_0:
	or	%g0,0,%g7
        setx	active_thread, %l1, %o5 
        jmpl    %o5, %o7
        nop

th_main_1:
	or	%g0,1,%g7
        setx	active_thread, %l1, %o5 
        jmpl    %o5, %o7
        nop
	
th_main_2:
	or	%g0,2,%g7
        setx	active_thread, %l1, %o5 
        jmpl    %o5, %o7
        nop
!
		
th_main_3:
	or	%g0,3,%g7
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

	ldx	[%g1+192],%l0			! get Bank 3 control reg
	or	%l0,DIS_BIT_MASK,%l0		! disable L2 bank 3
	stx	%l0,[%g1+192]

	
All_caches_disabled:		
	or	%g0,L2_DIAG_DATA_ARRAY_BASE_VA_HI,%g1
	add	%g1,%g7,%g1			! access with thread number
	sllx	%g1,L2_VA_HI_SAMT,%g1		! build address 39:32 of L2 Diag access
Insert_bank_numb:
	sll	%g7,6,%g2			! cvt thread # to a bank number
	add	%g2,%g1,%l4			! Access address & bank

Make_word_addresses:
	setx	0x00400000,%l0,%l1
	or	%l1,%l4,%i0			! 1st word is 0 odd

	setx	0x00000008,%l0,%l1
	or	%l1,%l4,%i1			! 2nd word is 1 even 
	
	setx	0x00400010,%l0,%l1
	or	%l1,%l4,%i2			! 3rd word is 2 odd
	
	setx	0x00000020,%l0,%l1
	or	%l1,%l4,%i3			! 4th word is 4 even


	setx	0x0003ff00,%l0,%l7		! mask for bits 17:8
	or	%g0,0,%l5			! starting way

	
Write_loop_top1:
	sll	%l5,18,%l5			! move into position

Write_set_0:
	or	%l5,%g0,%l6			! insert Way, set is 0
	
	or	%l6,%i0,%l0
	stx	%l0,[%l0+0]			! write our 4 test words for set 0
	or	%l6,%i1,%l1
	stx	%l1,[%l1+0]
	or	%l6,%i2,%l2
	stx	%l2,[%l2+0]
	or	%l6,%i3,%l3
	stx	%l3,[%l3+0]
	
	or	%g0,0x100,%l6			! set bits run from 17:8	
Write_loop_top2:
	or	%l5,%l6,%i6			! insert Way
	or	%i6,%i0,%l0
	stx	%l0,[%l0+0]			! write our 4 test words for 1 hot set
	or	%i6,%i1,%l1			
	stx	%l1,[%l1+0]
	or	%i6,%i2,%l2
	stx	%l2,[%l2+0]
	or	%i6,%i3,%l3
	stx	%l3,[%l3+0]
	andcc	%l6,%l7,%l6			! done test
	bnz	Write_loop_top2
	sll	%l6,1,%l6			! next set bit
Write_loop_end2:	
	srl	%l5,18,%l5			! move way back to lsb
	cmp	%l5,0x0b
	bl	Write_loop_top1
	add	%l5,1,%l5			! next way

	
	
Read_loop_setup:	 
	setx	0xffffff80,%l0,%l1
	sllx	%l1,32,%l1
	sub	%g0,1,%l0			! easy way to get all 1's (64 bits)
	xor	%l0,%l1,%l4			! mask to clear bits 63:39

	or	%g0,%g0,%l5			! starting way

Read_loop_top1:
	sll	%l5,18,%l5			! move into position

Read_set_0:
	or	%l5,%g0,%i6			! insert Way, set is 0
	
	or	%i6,%i0,%l0
	ldx	[%l0+0],%o0			! read and check our 4 test words
	
	or	%i6,%i1,%l1			
	ldx	[%l1+0],%o1
	
	or	%i6,%i2,%l2
	ldx	[%l2+0],%o2
	
	or	%i6,%i3,%l3
	ldx	[%l3+0],%o3

	xor	%o0,%l0,%o0
	andcc	%o0,%l4,%o0			! verify bits 38:0 match
	bnz	Test_fail
	nop
	
	xor	%o1,%l1,%o1
	andcc	%o1,%l4,%o1			! verify bits 38:0 match
	bnz	Test_fail
	nop
	
	xor	%o2,%l2,%o2
	andcc	%o2,%l4,%o2			! verify bits 38:0 match
	bnz	Test_fail
	nop
	
	xor	%o3,%l3,%o3
	andcc	%o3,%l4,%o3			! verify bits 38:0 match
	bnz	Test_fail
	nop
	
	or	%g0,0x100,%l6			! set bits run from 17:8
		
Read_loop_top2:
	or	%l5,%l6,%i6			! insert Way

	or	%i6,%i0,%l0
	ldx	[%l0+0],%o0			! read and check our 4 test words
	
	or	%i6,%i1,%l1			
	ldx	[%l1+0],%o1
	
	or	%i6,%i2,%l2
	ldx	[%l2+0],%o2
	
	or	%i6,%i3,%l3
	ldx	[%l3+0],%o3

	xor	%o0,%l0,%o0
	andcc	%o0,%l4,%o0			! verify bits 38:0 match
	bnz	Test_fail
	nop
	
	xor	%o1,%l1,%o1
	andcc	%o1,%l4,%o1			! verify bits 38:0 match
	bnz	Test_fail
	nop
	
	xor	%o2,%l2,%o2
	andcc	%o2,%l4,%o2			! verify bits 38:0 match
	bnz	Test_fail
	nop
	
	xor	%o3,%l3,%o3
	andcc	%o3,%l4,%o3			! verify bits 38:0 match
	bnz	Test_fail
	nop
	
	andcc	%l6,%l7,%l6			! done test
	bnz	Read_loop_top2
	sll	%l6,1,%l6			! next set bit

Read_loop_end2:
	srl	%l5,18,%l5			! move way back to lsb
	cmp	%l5,0x0b
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
	
