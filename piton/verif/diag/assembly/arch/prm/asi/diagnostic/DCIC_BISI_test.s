// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: DCIC_BISI_test.s
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
#include "boot.s"
!
!       Test D$ BISI
!

#define  LSU_CONTROL_REG_ASI  0x45
#define         LSU_CONTROL_REG_DIMMU_MASK    0x0c
#define         LSU_CONTROL_REG_DMMU_MASK     0x08
#define         LSU_CONTROL_REG_IMMU_MASK     0x04
#define         LSU_CONTROL_REG_DCIC_MASK     0x03
#define         LSU_CONTROL_REG_DC_MASK       0x02
#define         LSU_CONTROL_REG_IC_MASK	      0x01

#define  DCACHE_TAG_REG_ASI   0x47

#define  ICACHE_TAG_REG_ASI   0x66

	
#define	SPARC_BIST_CONTROL_REG_ASI	0x42
#define		MBIST_DONE_MASK			0x400
#define		MBIST_ERR_MASK			0x380
#define		BISI_MODE_MASK			0x040
#define		STOP_ON_NEXT_FAIL_MASK		0x020
#define		STOP_ON_FAIL_MASK		0x010
#define		MBIST_START_MASK		0x001


.text
.global main

main:

	or	%g0,0,%g7
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

Write_DC_loop_setup:
	or	%g0,1,%g1	
	sll	%g1,13,%g1			! build max for D$ access loops

	or	%g0,0x01,%g2			! valid bit

	or	%g0,%g0,%g3			! initialize counter

	or	%g0,0x10,%g4			! counter incr
	

Write_DC_loop_top:	
	or	%g2,%g3,%l1
	stxa	%g2,[%g3]DCACHE_TAG_REG_ASI
	
	add	%g3,%g4,%g3
	cmp	%g3,%g1
	bl	Write_DC_loop_top
	nop

	
Write_IC_loop_setup:	
	or	%g0,1,%g1	
	sll	%g1,13,%g1			! build max for D$ access loops

	or	%g0,1,%l1	
	sllx	%l1,34,%g2			! build Valid bit (bit 34)

	or	%g0,%g0,%g3			! initialize counter

	or	%g0,0x40,%g4			! counter incr

	or	%g0,%g0,%i0			! way 0	
	or	%g0,1,%l0
	sll	%l0,16,%i1			! way 1
	sll	%l0,17,%i2			! way 2
	add	%i1,%i2,%i3			! way 3

	
	
Write_IC_loop_top:	

	or	%i0,%g3,%l2			! way 0, set x
	stxa	%g2,[%l2]ICACHE_TAG_REG_ASI

	or	%i1,%g3,%l2			! way 1, set x
	stxa	%g2,[%l2]ICACHE_TAG_REG_ASI

	or	%i2,%g3,%l2			! way 2, set x
	stxa	%g2,[%l2]ICACHE_TAG_REG_ASI

	or	%i3,%g3,%l2			! way 3, set x
	stxa	%g2,[%l2]ICACHE_TAG_REG_ASI
	
	
	add	%g3,%g4,%g3
	cmp	%g3,%g1
	bl	Write_IC_loop_top
	nop
	
	
!
!   I$ & D$ tags are all written now turn on BISI
!
Do_BISI:
	or	%g0,BISI_MODE_MASK+MBIST_START_MASK,%l1
	stxa	%l1,[%g0]SPARC_BIST_CONTROL_REG_ASI	! start BISI

Check_for_MBISI_done:	
	nop
	nop
	nop
	nop
	nop
	ldxa	[%g0]SPARC_BIST_CONTROL_REG_ASI,%l1
	andcc	%l1,MBIST_DONE_MASK,%l1
	bz	Test_fail
	nop

				
	
!
!   BISI done, verify the I$ & D$ tags are all 0's
!
MBISI_done:	
	or	%g0,1,%g1	
	sll	%g1,13,%g1			! build max for D$ access loops

	or	%g0,0x01,%g2			! valid bit
	
	or	%g0,%g0,%g3			! initialize counter

	or	%g0,0x10,%g4			! counter incr


Check_DC_loop_top:
	
	ldxa	[%g3]DCACHE_TAG_REG_ASI,%l1
	andcc	%l1,%g2,%l2
	bnz	Test_fail
	nop
	
	add	%g3,%g4,%g3
	cmp	%g3,%g1
	bl	Check_DC_loop_top
	nop	
	
Check_IC_loop_setup:
			
	or	%g0,1,%l1	
	sllx	%l1,34,%g2			! build Valid bit (bit 34)
	
	
 	or	%g0,%g0,%g3			! initialize counter

	or	%g0,0x40,%g4			! counter incr

	or	%g0,%g0,%i0			! way 0	
	or	%g0,1,%l0
	sll	%l0,16,%i1			! way 1
	sll	%l0,17,%i2			! way 2
	add	%i1,%i2,%i3			! way 3
	
Check_IC_loop_top:
	
	or	%i0,%g3,%l2			! way 0, set x
	ldxa	[%l2]ICACHE_TAG_REG_ASI,%l1
	andcc	%l1,%g2,%l3
	bnz	Test_fail
	nop

	
	or	%i1,%g3,%l2			! way 1, set x
	ldxa	[%l2]ICACHE_TAG_REG_ASI,%l1
	andcc	%l1,%g2,%l3
	bnz	Test_fail
	nop

	or	%i2,%g3,%l2			! way 2, set x
	ldxa	[%l2]ICACHE_TAG_REG_ASI,%l1
	andcc	%l1,%g2,%l3
	bnz	Test_fail
	nop

		
	or	%i3,%g3,%l2			! way 3, set x
	ldxa	[%l2]ICACHE_TAG_REG_ASI,%l1
	andcc	%l1,%g2,%l3
	bnz	Test_fail
	nop

	
	add	%g3,%g4,%g3
	cmp	%g3,%g1
	bl	Check_IC_loop_top
	nop	
	
	
!	
!	
Test_passed:	
	ta      T_GOOD_TRAP	
	nop

Test_fail:	
        ta      T_BAD_TRAP	
	nop



