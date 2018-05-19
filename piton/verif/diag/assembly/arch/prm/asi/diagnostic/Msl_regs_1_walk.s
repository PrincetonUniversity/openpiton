// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: Msl_regs_1_walk.s
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

!
!       Walking 1s test for the following registers:	
!	     1 context, 2 context, %ASI, CC, and PID
!


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

	or	%g0,0x80,%g1		! bit test mask

	or	%g0,8,%l1		! VA for 1 context
	add	%l1,%l1,%l2		! VA for 2 context
	or	%g0,0x80,%g2		! VA for PID

	ldxa	[%g2]0x58,%i0		! get current PID value
	ldxa	[%l1]0x21,%i1		! get current 1 context value
	ldxa	[%l2]0x21,%i2		! get current 2 context value
	rd	%ccr,%i3		! get current CC reg value
	rd	%asi,%i4		! get current ASI reg value

! test the 3 bit PID
	or	%g0,4,%g1
	stxa	%g1,[%g2]0x58		! write PID
	ldxa	[%g2]0x58,%g3
	xorcc	%g1,%g3,%g0
	bnz	test_fail
	nop
	or	%g0,2,%g1
	stxa	%g1,[%g2]0x58		! write PID
	ldxa	[%g2]0x58,%g3
	xorcc	%g1,%g3,%g0
	bnz	test_fail
	nop
	or	%g0,1,%g1
	stxa	%g1,[%g2]0x58		! write PID
	ldxa	[%g2]0x58,%g3
	xorcc	%g1,%g3,%g0
	bnz	test_fail
	nop
	stxa	%g0,[%g2]0x58		! write PID
	ldxa	[%g2]0x58,%g3
	xorcc	%g0,%g3,%g0
	bnz	test_fail
	nop

!  test first 8 bits of ctx regs and the CC & ASI regs
	
Loop1_top:	
	stxa	%g1,[%l1]0x21		! write 1 ctx
	stxa	%g1,[%l2]0x21		! write 2 ctx
	wr	%g1,%g0,%ccr		! write CC reg
	wr	%g1,%g0,%asi		! write ASI reg
	ldxa	[%l1]0x21,%o1		! get current 1 context value
	ldxa	[%l2]0x21,%o2		! get current 2 context value
	rd	%ccr,%o3		! get current CC reg value
	rd	%asi,%o4		! get current ASI reg value
	xorcc	%g1,%o1,%g0		! check if 1 ctx correct
	bnz	test_fail
	nop
	xorcc	%g1,%o2,%g0		! check if 2 ctx correct
	bnz	test_fail
	nop
	xorcc	%g1,%o3,%g0		! check if CC correct
	bnz	test_fail
	nop
	xorcc	%g1,%o4,%g0		! check if ASI correct
	bnz	test_fail
	nop
	bnz	Loop1_top		! stop looping on 2nd zero
	srl	%g1,1,%g1		! test next bit position
!
!
!  Now test bits 12:8 of CTX regs
	setx	0x1000,%l0,%g1

Loop2_top:	
	stxa	%g1,[%l1]0x21		! write 1 ctx
	stxa	%g1,[%l2]0x21		! write 2 ctx
	nop
	ldxa	[%l1]0x21,%o1		! get current 1 context value
	ldxa	[%l2]0x21,%o2		! get current 2 context value
	xorcc	%g1,%o1,%g0		! check if 1 ctx correct
	bnz	test_fail
	nop
	xorcc	%g1,%o2,%g0		! check if 2 ctx correct
	bnz	test_fail
	nop

	srl	%g1,1,%g1		! test next bit position	
	andcc	%g1,0x80,%g0		! loop ends when %g1 contains 0x80
	bz	Loop2_top
	nop

!
!

	stxa	%i0,[%g2]0x58		! restore current PID value
	stxa	%i1,[%l1]0x21		! restore current 1 context value
	stxa	%i2,[%l2]0x21		! restore current 2 context value
	wr	%i3,%g0,%ccr		! restore current CC reg value
	wr	%i4,%g0,%asi		! restore current ASI reg value
	
!	
test_pass:
        ta      T_GOOD_TRAP
        nop
!
!
test_fail:
        ta      T_BAD_TRAP
        nop
!



	


