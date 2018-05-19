// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: ASI_LSU_CTRL_MMUs_enable_disable_test.s
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
!       Test DMMU & IMMU enable and disable ASI
!

#define  LSU_CONTROL_REG_ASI  0x45
#define         LSU_CONTROL_REG_DIMMU_MASK    0x0c
#define         LSU_CONTROL_REG_DMMU_MASK     0x08
#define         LSU_CONTROL_REG_IMMU_MASK     0x04
#define         LSU_CONTROL_REG_DCIC_MASK     0x03
#define         LSU_CONTROL_REG_DC_MASK       0x02
#define         LSU_CONTROL_REG_IC_MASK       0x01



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

	setx	Page1_Label1,%l0,%i0		! setup addressability
	setx	Page2_Label1,%l0,%i1
	setx	Data1,%l0,%i2
	setx	Data2,%l0,%i3

debug1:	
	or	%g0,%i0,%g0			! for debug
	or	%g0,%i1,%g0			! for debug
	or	%g0,%i2,%g0			! for debug
	or	%g0,%i3,%g0			! for debug

!
!	VA	IMMU on		IMMU off	DMMU on		DMMU off
!	10	  18 -- 1	  10 (H) -- 2	  xx		  xx
!	18	  10 -- 2	  18 (H) -- 1	  xx		  xx
!	20	  xx		  xx		  28 -- 3s	  20 (H) -- 4s
!	28	  xx		  xx		  20 -- 4s	  28 (H) -- 3s
!
! (H) Hypervisor translated
!
	
Turn_IDMMU_off:		
        add     %g0,LSU_CONTROL_REG_DCIC_MASK,%l2       ! D$ + I$ enable bits
	add	%g0,LSU_CONTROL_REG_DIMMU_MASK,%l3	! I & D MMU enable bits
        ldxa    [%g0]LSU_CONTROL_REG_ASI,%l1
        or      %l2,%l1,%l1				! insure I$ & D$ are enabled
        or      %l3,%l1,%l1				
	xor     %l3,%l1,%l1				! insure IMMU & DMMU are disabled	 
        stxa    %l1,[%g0]LSU_CONTROL_REG_ASI

	ldx	[%i2+0],%i4			! get Data1 value
	ldx	[%i3+0],%i5			! get Data2 value

	xor	%g7,%g7,%g7			! clear error counter	

	ta	T_CHANGE_NONHPRIV
!
!	Both MMU's off so V=R=P
!
test_part1:	
	jmpl	%i0,%l0				! execute 1st page (@ PA 40018000)
	nop
test_part1a:	
	cmp	%g1,2
	bne	test_fail
 	add	%g7,1,%g7			! jumped to wrong page, error code is 1
	cmp	%g2,%i5
	bne	test_fail
	add	%g7,1,%g7			! fetched wrong data1, error code is 2
	cmp	%g3,%i4
	bne	test_fail
	add	%g7,1,%g7			! fetched wrong data2, error code is 3
	jmpl	%i1,%l0				! execute 2nd page (@ PA 40010000)
	cmp	%g1,1
	bne	test_fail
	add	%g7,1,%g7			! jumped to wrong page, error code is 4
	
!
!	Now turn on DMMU and try again
!		
        ta      T_CHANGE_HPRIV			! enter Hyper mode
	
	add	%g0,LSU_CONTROL_REG_DMMU_MASK,%l3	! DMMU enable bit
        ldxa    [%g0]LSU_CONTROL_REG_ASI,%l1				
	xor     %l3,%l1,%l1					 
        stxa    %l1,[%g0]LSU_CONTROL_REG_ASI		! DMMU enabled, I MMU still off
	
	ta	T_CHANGE_NONHPRIV

test_part2:
	jmpl	%i0,%l0				! execute 1st page (@ PA 40018000)
	nop
test_part2a:
	cmp	%g1,2
	bne	test_fail
	add	%g7,1,%g7			! jumped to wrong page, error code is 1
	cmp	%g2,%i4
	bne	test_fail
	add	%g7,1,%g7			! fetched wrong data1, error code is 2
	cmp	%g3,%i5
	bne	test_fail
	add	%g7,1,%g7			! fetched wrong data2, error code is 3
	jmpl	%i1,%l0			
	cmp	%g1,1
	bne	test_fail
	add	%g7,1,%g7			! jumped to wrong page, error code is 4
	


!
!	Now turn on I & D MMUs and try again
!	
        ta      T_CHANGE_HPRIV			! enter Hyper mode
	
	add	%g0,LSU_CONTROL_REG_IMMU_MASK,%l3	! IMMU enable bit
        ldxa    [%g0]LSU_CONTROL_REG_ASI,%l1				
	xor     %l3,%l1,%l1					 
        stxa    %l1,[%g0]LSU_CONTROL_REG_ASI		! Both MMUs enabled
	
	ta	T_CHANGE_NONHPRIV

test_part3:	
	jmpl	%i0,%l0				! execute 2nd page (@ PA 40010000)
	nop
test_part3a:
	cmp	%g1,1
	bne	test_fail
	add	%g7,1,%g7			! jumped to wrong page, error code is 1
	cmp	%g2,%i4
	bne	test_fail
	add	%g7,1,%g7			! fetched wrong data1, error code is 2
	cmp	%g3,%i5
	bne	test_fail
	add	%g7,1,%g7			! fetched wrong data2, error code is 3
	jmpl	%i1,%l0				! execute 2nd page (@ PA 40020000)
	cmp	%g1,2
	bne	test_fail
	add	%g7,1,%g7			! jumped to wrong page, error code is 4
	


!
!	Now turn off DMMU and try again
!	
        ta      T_CHANGE_HPRIV			! enter Hyper mode

	add	%g0,LSU_CONTROL_REG_DMMU_MASK,%l3	! DMMU enable bit
        ldxa    [%g0]LSU_CONTROL_REG_ASI,%l1				
	xor     %l3,%l1,%l1					 
        stxa    %l1,[%g0]LSU_CONTROL_REG_ASI		! IMMU enabled, DMMU disabled
	
	ta	T_CHANGE_NONHPRIV

test_part4:	
	jmpl	%i0,%l0				! execute 1st page (@ PA 40018000)
	nop
test_part4a:
	cmp	%g1,1
	bne	test_fail
	add	%g7,1,%g7			! jumped to wrong page, error code is 1
	cmp	%g2,%i5
	bne	test_fail
	add	%g7,1,%g7			! fetched wrong data1, error code is 2
	cmp	%g3,%i4
	bne	test_fail
	add	%g7,1,%g7			! fetched wrong data2, error code is 3
	jmpl	%i1,%l0				! execute 2nd page (@ PA 40020000)
	cmp	%g1,2
	bne	test_fail
	add	%g7,1,%g7			! jumped to wrong page, error code is 4
	

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



	

SECTION .PAGE1_THREAD_SEC TEXT_VA=0x0000000040018000
   attr_text {
        Name = .PAGE1_THREAD_SEC,
        VA= 0x0000000040018000,
        PA= ra2pa(0x0000000040010000,0),
        RA= 0x0000000040010000,
        part_0_i_ctx_nonzero_ps0_tsb,
        part_0_d_ctx_nonzero_ps0_tsb,
        TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
        }
   attr_text {
        Name = .PAGE1_THREAD_SEC,
        hypervisor
        }

.text
.global Page1_Label1
!
!
!
!
Page1_Label1:
	add	%g0,1,%g1
	ldx	[%i2+0],%g2
	ldx	[%i3+0],%g3
	jmpl	%l0+4,%l1			! return
	nop
	

SECTION .PAGE2_THREAD_SEC TEXT_VA=0x0000000040010000
   attr_text {
        Name = .PAGE2_THREAD_SEC,
        VA= 0x0000000040010000,
        PA= ra2pa(0x0000000040018000,0),
        RA= 0x0000000040018000,
        part_0_i_ctx_nonzero_ps0_tsb,
        part_0_d_ctx_nonzero_ps0_tsb,
        TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
        }
   attr_text {
        Name = .PAGE2_THREAD_SEC,
        hypervisor
        }
.text
.global Page2_Label1
!
!
!
!
Page2_Label1:
	add	%g0,2,%g1
	ldx	[%i2+0],%g2
	ldx	[%i3+0],%g3
	jmpl	%l0+4,%l1			! return
	nop



SECTION .DATA1_AREA_SEC DATA_VA=0x0000000040020000
   attr_data {
	Name = .DATA1_AREA_SEC,
	VA= 0x0000000040020000,
	PA= ra2pa(0x0000000040028000,0),
        RA= 0x0000000040028000,
        part_0_i_ctx_nonzero_ps0_tsb,
        part_0_d_ctx_nonzero_ps0_tsb,
        TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
            }
   attr_data {
            Name = .DATA1_AREA_SEC,
            hypervisor
            }
.data
.global Data1
 
Data1:	.xword	0x3333333333333333
	.xword	0



SECTION .DATA2_AREA_SEC DATA_VA=0x0000000040028000
   attr_data {
	Name = .DATA2_AREA_SEC,
	VA= 0x0000000040028000,
	PA= ra2pa(0x0000000040020000,0),
        RA= 0x0000000040020000,
        part_0_i_ctx_nonzero_ps0_tsb,
        part_0_d_ctx_nonzero_ps0_tsb,
        TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
            }
    attr_data {
            Name = .DATA2_AREA_SEC,
            hypervisor
            }
.data
.global Data2
 
Data2:	.xword	0x4444444444444444
	.xword	0		
