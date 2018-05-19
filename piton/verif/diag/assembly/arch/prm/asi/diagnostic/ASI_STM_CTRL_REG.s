// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: ASI_STM_CTRL_REG.s
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
#include "boot.s"




.text
.global main

main:                   !  test enters here from boot in user mode

!	Split into seperate threads and Load Thread ID into %g2, then jump to common code

th_fork(th_main)
th_main_0:
        setx active_thread, %l1, %o5     
        jmpl    %o5, %o7
        add     %g0,0,%g2               ! put thread number into bits 1:0

th_main_1:
        setx active_thread, %l1, %o5     
        jmpl    %o5, %o7
        add     %g0,1,%g2               ! put thread number into bits 1:0

th_main_2:
        setx active_thread, %l1, %o5     
        jmpl    %o5, %o7
        add     %g0,2,%g2               ! put thread number into bits 1:0

th_main_3:
        setx active_thread, %l1, %o5     
        jmpl    %o5, %o7
        add     %g0,3,%g2               ! put thread number into bits 1:0


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
!
!
!	
active_thread:
        ta      T_CHANGE_HPRIV          ! enter Hyper mode

	ldxa	[%g0]0x44,%l0		! read the ASI_STM_CTRL_REG
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	stxa	%l0,[%g0]0x44		! write the contents back
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
!	
test_pass:
        ta      T_GOOD_TRAP
        nop
