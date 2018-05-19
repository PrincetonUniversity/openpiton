// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: D_cache_ASI_ctrl_test_1.s
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
!       Test D$ & I$ enable and disable also test direct read of ASI written data
!

#define  LSU_CONTROL_REG_ASI  0x45
#define         LSU_CONTROL_REG_DIMMU_MASK    0x0c
#define         LSU_CONTROL_REG_DMMU_MASK     0x08
#define         LSU_CONTROL_REG_IMMU_MASK     0x04
#define         LSU_CONTROL_REG_DCIC_MASK     0x03
#define         LSU_CONTROL_REG_DC_MASK       0x02
#define         LSU_CONTROL_REG_IC_MASK       0x01
#define  DCACHE_DATA_REG_ASI  0x46
#define  DCACHE_TAG_REG_ASI   0x47



/************************************
*
*
*
*     Logical program flow, thread under test and  watcher threads
*     ------------------------------------------------------------
*
*     Setup:	$$$$$  Single threaded test  $$$$$
*                Enter Hiper mode;
*                %g3=0;
*                Enable I$ & D$;
*                Goto Label4;
*
*
*     Label4:    Disable D$;
*                store 1 into data1 and -1 into data3;
*                goto Label5;
*
*     Label5:    LDX from Data1
*                If result != 1
*                          then goto Label 6b;
*                          else goto Label 6a;
*
*     Label6b:   exit with fail
*
*
*     Label6a:   LDX from Data3
*                If result != -1
*                          then goto Label 7b;
*                          else goto Label 7a;
*
*     Label7b:   exit with fail
*
*     Label7a:   Use the ASI backdoor to force the vlues for the D$ Data0 and Data2 entries 
*			to 0x00000333 and 0x00000444 respectivly.
*	 	 Enable D$
*                goto Label8;
*
*
*     Label4:    LDX from Data0
*                If result != 0x0000000000000333
*                          then goto Label 9b;
*                          else goto Label 9a;
*
*     Label9b:   exit with fail
*
*
*     Label9a:   LDX from Data2
*                If result != 0x0000000000000444
*                          then goto Label 10b;
*                          else goto Label 10a;
*
*     Label10b:  exit with fail
*
*     Label10a:  exit with passed
*
*
*
* ------------  "data"
*
*     .align    8096     ! insure we start on a D$ line 0
*
*     Data0:    .xword  0
*
*     Data1:    .xword  0x123456789abcdef0
*
*     Data2:    .xword  0
*
*     Data3:    .xword  0xf0e1d2c3b4a59687
*

*
*===================================================================
*
*
*===================================================================
*
*      Register Useage
*      %g1      
*      %g2      
*      %g3      
*      %g4
*      %g5
*      %g6
*      %g7
*      %l0-%l7  Scratch registers
*      %o0      address_of[Data0]
*      %o1      address_of[Data1]
*      %o2-%o7  address manulipulation scratch
*
************************************************************/


.text
.global main

main:                   !  test enters here from boot in user mode

th_fork(th_main)
th_main_1:
        setx active_thread, %l1, %o5   
        jmpl    %o5, %o7
        nop

th_main_0:
        ta      T_GOOD_TRAP
        nop

th_main_2:
        ta      T_GOOD_TRAP
        nop


th_main_3:
        ta      T_GOOD_TRAP
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
!	    clear D$ tags
!           Enable I$ & D$;
!           Goto Label1;
!
active_thread:
        ta      T_CHANGE_HPRIV          ! enter Hyper mode

        add     %g0,LSU_CONTROL_REG_DCIC_MASK,%l2               ! D$ + I$ enable bits
        ldxa    [%g0]LSU_CONTROL_REG_ASI,%l1
        or      %l2,%l1,%l1
        stxa    %l1,[%g0]LSU_CONTROL_REG_ASI  ! insure I$ & D$ are enabled


!
! D$ tags are not cleared by reset so be sure all of the tags we want to check will be clear
!	

	setx	Data0,%l0,%l5

	setx	0x000007f0,%l0,%l7
	and	%l5,%l7,%l0			! have base address for load
	add	%l0,0x800,%l1			! expected read tag for way 1
	add	%l1,0x800,%l2			! expected read tag for way 2
	add	%l2,0x800,%l3			! expected read tag for way 3
	
Clear_DC_tags1:	
	stxa	%g0,[%l0]DCACHE_TAG_REG_ASI
	stxa	%g0,[%l1]DCACHE_TAG_REG_ASI
	stxa	%g0,[%l2]DCACHE_TAG_REG_ASI
	stxa	%g0,[%l3]DCACHE_TAG_REG_ASI


	setx	Data2,%l0,%l6
	setx	0x000007f0,%l0,%l7
	and	%l6,%l7,%l0			! have base address for load
	add	%l0,0x800,%l1			! expected read tag for way 1
	add	%l1,0x800,%l2			! expected read tag for way 2
	add	%l2,0x800,%l3			! expected read tag for way 3

Clear_DC_tags2:	
	stxa	%g0,[%l0]DCACHE_TAG_REG_ASI
	stxa	%g0,[%l1]DCACHE_TAG_REG_ASI
	stxa	%g0,[%l2]DCACHE_TAG_REG_ASI
	stxa	%g0,[%l3]DCACHE_TAG_REG_ASI
	
!
!	Back to our regularly scheduled programming
	
Setup_label_addressing:	
        setx    Data0, %l1, %o0
        setx    Data2, %l1, %o1

	ldx	[%o0+0],%l0			! make sure Data0 line is in the D$
	ldx	[%o1+0],%l1			! make sure Data1 line is in the D$
	
        ba      Label4
	nop

        .align  1024                    ! insure line bdry, with space for expansion

!       Disable D$;
!       store 1 into data1 and -1 into data3;
!       goto Label5;
!
Label4:
        add     %g0,LSU_CONTROL_REG_DC_MASK,%l2      ! D$ enable bit
        ldxa    [%g0]LSU_CONTROL_REG_ASI,%l1
        xor     %l2,%l1,%l1
        stxa    %l1,[%g0]LSU_CONTROL_REG_ASI   ! D$ is now disabled, I$ enabled
!
	or	%g0,1,%l0
	stx	%l0,[%o0+8]		! store 1 into data1, will update D$
	or	%g0,-1,%l1
	stx	%l1,[%o1+8]		! store -1 into data2, will update D$	
!	
        ba      Label5	
	nop
		
!
!
!     LDX from Data1
!     If result != 1
!        then goto Label 6b;
!        else goto Label 6a;
!
Label5:
	ldx	[%o0+8],%l2
	xorcc	%l0,%l2,%g0	
	bne	Label6b
	nop
	ba	Label6a
	nop

        .align  32                      ! insure line bdry
!
Label6b:
        ta      T_BAD_TRAP
        nop

!
!     LD from Data2
!     If result != -1
!        then goto Label 7b;
!        else goto Label 7a;
!
Label6a:
	ldx	[%o1+8],%l3
	xorcc	%l1,%l3,%g0	
	bne	Label7b
	nop
	ba	Label7a
	nop

!	
        .align  32                      ! insure line bdry
!
Label7b:
        ta      T_BAD_TRAP
        nop
!
!
!	 Use the ASI backdoor to force the values for the D$ Data0 and Data2 entries 
!		to 0x00000333 and 0x00000444 respectivly.
!        Enable D$
!        goto Label8;	
!
Label7a:
!
!	Do Data0 first
!
	setx	0x000007f0,%l6,%l7		! build set mask
	and	%o0,%l7,%i0			! have base address for load
	add	%i0,0x800,%i1			! expected read tag for way 1
	add	%i1,0x800,%i2			! expected read tag for way 2
	add	%i2,0x800,%i3			! expected read tag for way 3

Label7a_data0_ldxas:	
	ldxa	[%i0]DCACHE_TAG_REG_ASI,%l0
	ldxa	[%i1]DCACHE_TAG_REG_ASI,%l1
	ldxa	[%i2]DCACHE_TAG_REG_ASI,%l2
	ldxa	[%i3]DCACHE_TAG_REG_ASI,%l3


Label7a_data0_make_tag:
	srlx	%o0,10,%l7			! build expected tag
	setx	0x1fffffe,%l5,%l6		! mask to isolate 28:0
	and	%l6,%l7,%i7

	and	%l0,%l6,%l0			! mask off V bit
	and	%l1,%l6,%l1			! mask off V bit
	and	%l2,%l6,%l2			! mask off V bit
	and	%l3,%l6,%l3			! mask off V bit
	
Label7a_data0_findway:
	cmp	%i7,%l0
	be	got_data0_hit
	or	%g0,%i0,%l5
	cmp	%i7,%l1
	be	got_data0_hit
	or	%g0,%i1,%l5
	cmp	%i7,%l2
	be	got_data0_hit
	or	%g0,%i2,%l5
	cmp	%i7,%l3
	be	got_data0_hit
	or	%g0,%i3,%l5

        ta      T_BAD_TRAP
        nop

got_data0_hit:
	or	%l7,1,%l7			! set Valid bit
	stxa	%l7,[%l5]DCACHE_TAG_REG_ASI	! for line

!	force Data0 value
	or	%g0,0x333,%l0			! value to force
	stxa	%l0,[%l5]DCACHE_DATA_REG_ASI	! do force

!
!	Now do Data2
!
	setx	0x000007f0,%l6,%l7
	and	%o1,%l7,%i0			! have base address for load
	add	%i0,0x800,%i1			! expected read tag for way 1
	add	%i1,0x800,%i2			! expected read tag for way 2
	add	%i2,0x800,%i3			! expected read tag for way 3

Label7a_data2_ldxas:	
	ldxa	[%i0]DCACHE_TAG_REG_ASI,%l0
	ldxa	[%i1]DCACHE_TAG_REG_ASI,%l1
	ldxa	[%i2]DCACHE_TAG_REG_ASI,%l2
	ldxa	[%i3]DCACHE_TAG_REG_ASI,%l3

Label7a_data2_make_tag:	
	srlx	%o1,10,%l7			! build expected tag
	setx	0x1fffffe,%l5,%l6		! mask to isolate 28:0
	and	%l6,%l7,%i7

	and	%l0,%l6,%l0			! mask off V bit
	and	%l1,%l6,%l1			! mask off V bit
	and	%l2,%l6,%l2			! mask off V bit
	and	%l3,%l6,%l3			! mask off V bit

Label7a_data2_findway:	
	cmp	%i7,%l0
	be	got_data2_hit
	or	%g0,%i0,%l5
	cmp	%i7,%l1
	be	got_data2_hit
	or	%g0,%i1,%l5
	cmp	%i7,%l2
	be	got_data2_hit
	or	%g0,%i2,%l5
	cmp	%i7,%l3
	be	got_data2_hit
	or	%g0,%i3,%l5

        ta      T_BAD_TRAP
        nop

got_data2_hit:
	or	%l7,1,%l7			! set Valid bit
	stxa	%l7,[%l5]DCACHE_TAG_REG_ASI	! for line

!	force Data2 value
	or	%g0,0x444,%l0			! value to force
	stxa	%l0,[%l5]DCACHE_DATA_REG_ASI	! do force


!        Enable D$
!        goto Label8;	
!	
Label7a_DC_on:	
        add     %g0,LSU_CONTROL_REG_DC_MASK,%l2      ! D$ enable bit
        ldxa    [%g0]LSU_CONTROL_REG_ASI,%l1
        or      %l2,%l1,%l1
        stxa    %l1,[%g0]LSU_CONTROL_REG_ASI   ! Both D$ & I$ are enabled
	nop
	nop
	nop
	nop!
	ba	Label8
	nop
!
        .align  32                      ! insure line bdry
!
/************
*     Label8:    LDX from Data1
*                If result != 0x0000000000000333
*                          then goto Label 9b;
*                          else goto Label 9a;
*
*     Label9b:   exit with fail
*
*
*     Label9a:   LDX from Data3
*                If result != 0x0000000000000444
*                          then goto Label 10b;
*                          else goto Label 10a;
*
*     Label10b:  exit with fail
*
*     Label10a:  exit with passed
**************/
!
Label8:
	ldx	[%o0],%l0
	xorcc	%l0,0x333,%g0	
	bne	Label9b
	nop
	ba	Label9a
	nop
!
        .align  32                      ! insure line bdry 
!	
Label9b:
        ta      T_BAD_TRAP
        nop

!
Label9a:
	ldx	[%o1],%l2
	xorcc	%l2,0x444,%g0	
	bne	Label10b
	nop
	ba	Label10a
	nop
!
        .align  32                      ! insure line bdry
!	
Label10b:
        ta      T_BAD_TRAP
        nop
!	
Label10a:
        ta      T_GOOD_TRAP
        nop
!
!===================================================================
!
!
!       Note that to simplify ASI cache accesses this segment should be mapped VA==PA==RA
!
SECTION .DATA_SEC DATA_VA=0x0000000040004000
   attr_data {
        Name = .DATA_SEC,
        hypervisor
        }

.data


.global Data0	
.global Data1	
.global Data2	
.global Data3	
	

Data0:  .xword  0

Data1:  .xword  0x123456789abcdef0

Data2:  .xword  0

Data3:  .xword  0xf0e1d2c3b4a59687



