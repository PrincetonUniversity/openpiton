// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: L1_BIST_ASI_test.s
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
!       Test D$ & I$ Bist
!

#define  LSU_CONTROL_REG_ASI  0x45
#define         LSU_CONTROL_REG_DIMMU_MASK    0x0c
#define         LSU_CONTROL_REG_DMMU_MASK     0x08
#define         LSU_CONTROL_REG_IMMU_MASK     0x04
#define         LSU_CONTROL_REG_DCIC_MASK     0x03
#define         LSU_CONTROL_REG_DC_MASK       0x02
#define         LSU_CONTROL_REG_IC_MASK	      0x01
#define  DCACHE_DATA_REG_ASI  0x46
#define  DCACHE_TAG_REG_ASI   0x47

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
        setx active_thread, %l1, %o5   
        jmpl    %o5, %o7
        nop



!
!       Note that to simplify ASI cache accesses this segment should be mapped VA==PA==RA
!
SECTION .ACTIVE_THREAD_SEC TEXT_VA=0x0000000040008000
   attr_text {
        Name = .ACTIVE_THREAD_SEC,
        VA= 0x0000000040008000,
        PA= ra2pa(0x0000000040008000,0),
        RA= 0x0000000040008000,
        part_0_i_ctx_nonzero_ps0_tsb,
        part_0_d_ctx_nonzero_ps0_tsb,
        TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
        }
   attr_text {
        Name = .ACTIVE_THREAD_SEC,
        hypervisor
        }

.text
.global active_thread
!
!     Setup:
!           Enter Hiper mode
!           Disable I$ & D$;
!
!
active_thread:
        ta      T_CHANGE_HPRIV          ! enter Hyper mode

        add     %g0,LSU_CONTROL_REG_DCIC_MASK,%l0       ! D$ + I$ enable bits
        ldxa    [%g0]LSU_CONTROL_REG_ASI,%l1
        andn    %l1,%l0,%l1
        stxa    %l1,[%g0]LSU_CONTROL_REG_ASI		! insure I$ & D$ are disabled

!
!    Test BISI 
!
	or	%g0,BISI_MODE_MASK+MBIST_START_MASK,%l1
	stxa	%l1,[%g0]SPARC_BIST_CONTROL_REG_ASI	! start BISI
!
BISI_loop_top:
	nop
	nop
	nop
	nop
	nop
	ldxa	[%g0]SPARC_BIST_CONTROL_REG_ASI,%l1
	nop
	andcc	%l1,MBIST_DONE_MASK,%l1
	bnz	MBISI_done
	nop
	ldxa	[%g0]SPARC_BIST_CONTROL_REG_ASI,%l1
	nop
	andcc	%l1,MBIST_DONE_MASK,%l1
	bnz	MBISI_done
	nop
	ba	Test_fail
	nop
				
MBISI_done:
	nop
	stxa	%g0,[%g0]SPARC_BIST_CONTROL_REG_ASI	! clear the start bit	
	nop
	nop
	nop
	nop
	nop


Start_1E_BIST:	
	setx	0x13579246,%l0,%i0
	setx	0x00002000,%l0,%i1
	or	%g0,STOP_ON_FAIL_MASK+MBIST_START_MASK,%l1

!
!
!    start BIST and immeditly Force D$ set 0 way 0 tag to 0x13579246
!
start_1E_BIST:	
	stxa	%l1,[%g0]SPARC_BIST_CONTROL_REG_ASI	! start BIST		
	nop
	nop
	nop
	nop
	nop
	nop
	nop

	stxa	%i0,[%i1]DCACHE_TAG_REG_ASI		! corrupt the first D$ entry TAG & Parity
	nop
	nop
	nop
	nop
	nop
	nop
	nop

	stxa	%i0,[%i1]DCACHE_TAG_REG_ASI		! Try again to corrupt 
	
	or	%g0,10,%l0

BIST_1E_loop_top:	
	nop
	nop
	ldxa	[%g0]SPARC_BIST_CONTROL_REG_ASI,%l1
	nop
	andcc	%l1,MBIST_DONE_MASK,%l1
	bnz	MBIST_1E_done
	nop
	nop
	subcc	%l0,1,%l0
	bnz	BIST_1E_loop_top
	nop
	ba	Test_fail
	nop

				
MBIST_1E_done:

	
	ba	Test_pass
	nop




Test_pass:
        ta      T_GOOD_TRAP
        nop
!
Test_fail:	
        ta      T_BAD_TRAP
        nop
!	




	
