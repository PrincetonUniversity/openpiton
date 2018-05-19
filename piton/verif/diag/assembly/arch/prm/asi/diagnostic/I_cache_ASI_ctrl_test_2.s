// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: I_cache_ASI_ctrl_test_2.s
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
#define  ICACHE_INST_REG_ASI  0x66
!       Address format
!               63:18   -res 0
!               17:16   way             0x00010000
!               15:13   -res 0
!               12:06   line in set     0x00001fc0,  Note this is 11:5 of PA << 1
!               05:03   word in line    0x00000038,  Note this is  4:2 of PA << 1
!               02:00   -res 0
!
!       Data format
!               63:35   -res 0
!               34      Valid
!               33      -res 0
!               32      parity
!               31:28   -res 0
!               27:0    Cache line tag (PA[39:12])
!
#define  ICACHE_TAG_REG_ASI   0x67
!               17:16   way             0x00010000
!               15:13   -res 0
!               12:06   line in set     0x00001fc0,  Note this is 11:5 of PA << 1
!               05:03   -res 0
!               02:00   -res 0
!


/************************************
*
*
*
*     Logical program flow, thread under test
*     ---------------------------------------
*
*     Setup:
*                Enter Hiper mode;
*                %g3=0;
*                Enable I$ & D$;
*                %o0 = address_of[Label2a];
*                %o1 = address_of[Label3c];
*                %o2 = address_of[Label4];
*                %o3 = address_of[Label2b];
*                %o4 = address_of[Label3b];
*                Goto Label1;
*
*
*
*     Note that %g3==0 is a straight line flow to get all required lines into the cache
*       prior to the start of the fun, it is then used again after the I$ is reenabled
*       to show that the contents of the i$ was not altered (and is not in sync with
*       the L2 values)
*
*
*     Label1:    if %g3 == 1 then Goto Label2b;
*                            else Goto Label2a
*
*     .align    32     ! insure we start on a cache line and Labels 2a & 2b both in the line
*
*     Label2b:   exit with fail
*
*     Label2a:   if %g3 == 1 then Goto Label3b;
*                            else Goto Label3a;
*
*
*     .align    32     ! insure we start on a cache line and Labels 3a & 3b both in the line
*
*     Label3b:   exit with fail
*
*     Label3a:    %g3=1;
*                 Disable I$;
*                 Move LabelM1 to Label2b (8B: BR & Nop), memory move (don't change I$);
*                 Move LabelM2 to Label3b (8B: BR & Nop), memory move (don't change I$);
*		  Set valid bits back on for I$ entries
*                 Use ASI backdoor to verify that I$ unchanged for Label 2b
*                 Goto Label1;
*
*     .align    32     ! insure we start on a new cache line
*
*     Label3c:   %g3=0;
*                Move LabelM3 to Label3a, via I cache write ASI (change I$ not memory or L2$)
*                Enable I$;
*                Goto Label1;
*
*     Label4:    ! I$ disable/enable works
*		 exit with passed
*
*
*
* ------------  "data"
*
*     .align    8096     ! insure we start on a D$ line 0
*
*     LabelM1:   Goto Label2a;  ! 8B: JMPL & Nop
*
*     LabelM2:   Goto Label3c;  ! 8B: JMPL & Nop
*
*     LabelM3:   Goto Label4;   ! 8B: JMPL & Nop
*
*
*===================================================================
*
*       Expected flow for a passing test, Thread under test.
*               Setup                 Setup for test, %g3 is 0
*               Label1                %g3 is 0 so branch to 2a
*               Label2a               %g3 is 0 so branch to 3a
*               Label3a               make %g3 = 1, disable I$ and change
*                                       instructions at Label2b & Label3b
*					need to set valid bits back on in I$
*                                       Use ASI backdoor to verify that I$ unchanged
*               Label1                get instruction from memory not I$
*                                       %g3==1, so goto 2b
*               Label2b               get instruction from memory not I$ 
*					now JMPL Label2a, so no fail
*               Label2a               get instruction from memory not I$
*                                       %g3==1, so goto 2b
*               Label3b               get instruction from memory not I$
*					now JMPL Label3c, so no fail
*               Label3c               reenable I$, reset %g3 to 0,
*                                       modify instruction at Label3a to JMPL Label4
*                                       go back to label1
*               Label1                instruction from I$ sees %g3 ==0 and goto's 2a
*               Label2a               instruction from I$ sees %g3 ==0 and goto's 3a
*               Label3a               modified instruction from I$ goto's Label4
*               Label4                Now Passed I$ check
*					 exit with a pass  :-)
*
*

*===================================================================
*
*      Register Useage
*      %g1      
*      %g2      
*      %g3      Test phase (0 or 1 for thread under test)
*      %g4
*      %g5
*      %g6
*      %g7
*      %l0-%l3  Scratch registers
*      %l4-%l7  used for instruction moves
*      %o0      address_of[Label2a]
*      %o1      address_of[Label3c]
*      %o2      address_of[Label4]
*      %o3      address_of[Label2b]
*      %o4      address_of[Label3b]
*      %o5      Base address of segment
*      %o6-%o7  address manulipulation scratch
*
************************************************************/


.text
.global main

main:                   !  test enters here from boot in user mode
 
th_fork(th_main)
th_main_2:
	setx active_thread, %l1, %o5
        jmpl    %o5, %o7
        nop 

th_main_0:
        ta      T_GOOD_TRAP
        nop

th_main_1:
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
!           Enable I$ & D$;
!           %g3=0;
!           %o0 = address_of[Label2a]		Used by data JMPLS
!           %o1 = address_of[Label3c]
!           %o2 = address_of[Label4]
!           %o3 = address_of[Label2b]		Used to modify code seq.
!           %o4 = address_of[Label3b]
!           %o5 - %o7 Address scratch
!           Goto Label1;
!
active_thread:
        ta      T_CHANGE_HPRIV          ! enter Hyper mode

        xor     %g3,%g3,%g3             ! phase 0

        add     %g0,LSU_CONTROL_REG_DCIC_MASK,%l2               ! D$ + I$ enable bits
        ldxa    [%g0]LSU_CONTROL_REG_ASI,%l1
        or      %l2,%l1,%l1
        stxa    %l1,[%g0]LSU_CONTROL_REG_ASI  ! insure I$ & D$ are enabled
	
!
! I$ tags are not cleared by reset so be sure all of the tags we want to check will be clear
!
        setx    Label2b, %l1, %o3
        setx    0x00010000,%l0,%o6      ! Used to incr. way bits
        setx    0x00001fc0,%l0,%o7      ! Mask to isolate set index for Label2b
	sll	%o3,1,%l0		! Adjust for 1 bit offset
        and     %o7,%l0,%l0             ! generate way 0
        add     %l0,%o6,%l1             ! generate way 1
        add     %l1,%o6,%l2             ! generate way 2
        add     %l2,%o6,%l3             ! generate way 3

Clear_IC_tags1:		
	stxa	%g0,[%l0]ICACHE_TAG_REG_ASI	! insure tag for way 0 is clear
	stxa	%g0,[%l1]ICACHE_TAG_REG_ASI	! insure tag for way 1 is clear
	stxa	%g0,[%l2]ICACHE_TAG_REG_ASI	! insure tag for way 2 is clear
	stxa	%g0,[%l3]ICACHE_TAG_REG_ASI	! insure tag for way 3 is clear

        setx    Label3b, %l1, %o4
        setx    0x00010000,%l0,%o6      ! Used to incr. way bits
        setx    0x00001fc0,%l0,%o7      ! Mask to isolate set index for Label3b
	sll	%o4,1,%l0		! Adjust for 1 bit offset
        and     %o7,%l0,%l0             ! generate way 0
        add     %l0,%o6,%l1             ! generate way 1
        add     %l1,%o6,%l2             ! generate way 2
        add     %l2,%o6,%l3             ! generate way 3

Clear_IC_tags2:	
	stxa	%g0,[%l0]ICACHE_TAG_REG_ASI	! insure tag for way 0 is clear
	stxa	%g0,[%l1]ICACHE_TAG_REG_ASI	! insure tag for way 1 is clear
	stxa	%g0,[%l2]ICACHE_TAG_REG_ASI	! insure tag for way 2 is clear
	stxa	%g0,[%l3]ICACHE_TAG_REG_ASI	! insure tag for way 3 is clear

!
!	Back to our regularly scheduled programming
Setup_label_addressing:	
        setx    Label2a, %l1, %o0
        setx    Label3c, %l1, %o1
        setx    Label4,  %l1, %o2
        setx    Label2b, %l1, %o3
        setx    Label3b, %l1, %o4
		
        ba      Label1
	nop

        .align  1024                    ! insure line bdry, with space for expansion
!
!       if %g3 == 1
!          then Goto Label2b
!          else Goto Label2a
!
Label1:
        cmp     %g3,1                   ! test for phase == 1
        be      Label2b
        nop
        ba      Label2a
        nop
!
        .align  32                      ! insure line bdry for Label2b ASI access
!
Label2b:
        ta      T_BAD_TRAP
        nop

!
!       if %g3 == 1 then Goto Label3b;
!                   else Goto Label3a;
!
Label2a:
        cmp     %g3,1                   ! test for phase == 1
        be      Label3b
        nop
        ba      Label3a
        nop
!
!
        .align  32                      ! insure line bdry
!
Label3b:
        ta      T_BAD_TRAP
        nop
!
!            %g3=1;
!            Disable I$;
!            Move LabelM1 to Label2b (8B: JMPL %o0 & Nop), memory move (don't change I$);
!            Move LabelM2 to Label3b (8B: JMPL %o1 & Nop), memory move (don't change I$);
!            Use ASI backdoor to verify that I$ unchanged for Label 2b
!            Goto Label1;
!
Label3a:
        or      %g0,1,%g3           ! Load %g3 with 1 if it is the thread under test
!
        add     %g0,LSU_CONTROL_REG_IC_MASK,%l2      ! I$ enable bit
        ldxa    [%g0]LSU_CONTROL_REG_ASI,%l1
        xor     %l2,%l1,%l1
        stxa    %l1,[%g0]LSU_CONTROL_REG_ASI   ! I$ is now disabled & D$ enabled
!
Do_code_mod1_setup:
	xor	%i6,%i6,%i6
        lduw    [%o3+0],%i6                 ! Copy of current Label2b
	setx	LabelM1,%o7,%o6	            ! at  X 0040008008
	
        ldx     [%o6+0],%l4			
        stx     %l4,[%o3+0]                 ! Move LabelM1 to Label2b

Do_code_mod2_setup:
	xor	%i7,%i7,%i7
        lduw    [%o4+0],%i7		    ! Copy of current Label3b
	setx	LabelM2,%o7,%o6

        ldx     [%o6+0],%l5
        stx     %l5,[%o4+0]	            ! Move LabelM2 to Label3b

code_mod_invalidate_waiting_area:
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
	nop
	nop				! 12 cycles of nop's
	

!       Use ASI backdoor to verify that I$ unchanged for Label 2b
!           Note at this point:
!           %o3 = address_of[Label2b]
!
Label3a_ASI_use:
        setx    0x00010000,%l0,%o6      ! Used to incr. way bits
        setx    0x00001fc0,%l0,%o7      ! Mask to isolate set index
	sll	%o3,1,%l0		! Adjust for 1 bit offset
        and     %o7,%l0,%l0             ! generate way 0
        add     %l0,%o6,%l1             ! generate way 1
        add     %l1,%o6,%l2             ! generate way 2
        add     %l2,%o6,%l3             ! generate way 3

lbl2b_ASI_do_ldxas:	
        ldxa    [%l0]ICACHE_TAG_REG_ASI,%i0           ! read tag from i$ way 0
        ldxa    [%l1]ICACHE_TAG_REG_ASI,%i1           ! read tag from i$ way 1
        ldxa    [%l2]ICACHE_TAG_REG_ASI,%i2           ! read tag from i$ way 2
        ldxa    [%l3]ICACHE_TAG_REG_ASI,%i3           ! read tag from i$ way 3


	setx    0xffffffff,%l0,%o6	! clear V & P bits mask
        and     %i0,%o6,%i0         
        and     %i1,%o6,%i1
        and     %i2,%o6,%i2
        and     %i3,%o6,%i3
!
!       Data format returned by
!               63:35   -res 0
!               34      Valid	(should be 0, due to store in stream invalidate, from L2$)
!               33      -res 0
!               32      parity  (forced to 1 prior to compare)
!               31:28   -res 0
!               27:0    Cache line tag (PA[39:12])
!
        srlx    %o3,12,%o7              ! isolate PA[39:12] into bits 27:00
	and	%o7,%o6,%o7		! force V & P bits on 


        ! load %i5 with set & way info,  %o7 has expected tag value
lbl2b_findway:	
        add     %g0,%g0,%i5
        cmp     %i0,%o7
        move    %xcc,%l0,%i5
        cmp     %i1,%o7  
        move    %xcc,%l1,%i5
        cmp     %i2,%o7
        move    %xcc,%l2,%i5
        cmp     %i3,%o7
        move    %xcc,%l3,%i5	
        orcc    %i5,%i5,%i5             ! test for cache miss
        bnz     lbl2b_hit               ! branch if ok
        nop

        ta      T_BAD_TRAP              ! die, an I cache miss means test is worthless
        nop

	 ! Ok got a hit in the tags, %i5 has set & way info  
	 !	and %l2 has Copy of expected Label2b instr.
lbl2b_hit:
	sll	%o3,1,%o6		! Adjust for 1 bit offset
	and	%o6,0x38,%o7

	or	%o7,%i5,%i4			       ! set the word offset
        ldxa    [%i4]ICACHE_INST_REG_ASI,%i0           ! read Instr from i$
        setx    0xffffffff,%o6,%o7                     ! mask to clear 63:32 of return data
        and     %i0,%o7,%o7                            ! isolate the instr.
        cmp     %o7,%i6
        be      lbl2_set_V_bit                         ! Cache has old Label2b instr.
        nop

        ta      T_BAD_TRAP              ! die, I cache has wrong data
        nop
!
!
lbl2_set_V_bit:
!
!	Need to set V bit for Label2b line
!
	ldxa    [%i5]ICACHE_TAG_REG_ASI,%i1             ! read tag from i$
	add	%g0,1,%l0
	sllx	%l0,34,%l0		! mask to set V bit
	xor	%l0,%i1,%l0
	stxa	%l0,[%i5]ICACHE_TAG_REG_ASI		! set V bit for line
!
!	Also need to set V bit for Label3b line
!
lbl3b_set_V_bit:
        setx    0x00010000,%l0,%o6      ! Used to incr. way bits
        setx    0x00001fc0,%l0,%o7      ! Mask to isolate set index
	sll	%o4,1,%l0		! Adjust for 1 bit offset
        and     %o7,%l0,%l0             ! generate way 0
        add     %l0,%o6,%l1             ! generate way 1
        add     %l1,%o6,%l2             ! generate way 2
        add     %l2,%o6,%l3             ! generate way 3

lbl3b_ASI_do_ldxas:
        ldxa    [%l0]ICACHE_TAG_REG_ASI,%i0           ! read tag from i$ way 0
        ldxa    [%l1]ICACHE_TAG_REG_ASI,%i1           ! read tag from i$ way 1
        ldxa    [%l2]ICACHE_TAG_REG_ASI,%i2           ! read tag from i$ way 2
        ldxa    [%l3]ICACHE_TAG_REG_ASI,%i3           ! read tag from i$ way 3

	setx    0xffffffff,%l0,%o6	! clear V & P bits mask
        and     %i0,%o6,%i0         
        and     %i1,%o6,%i1
        and     %i2,%o6,%i2
        and     %i3,%o6,%i3


        srlx    %o4,12,%o7              ! isolate PA[39:12] into bits 27:00
	and	%o7,%o6,%o7		! force V & P bits on 


lbl3b_findway:
        add     %g0,%g0,%i5
        cmp     %i0,%o7
        move    %xcc,%l0,%i5
        cmp     %i1,%o7  
        move    %xcc,%l1,%i5
        cmp     %i2,%o7
        move    %xcc,%l2,%i5
        cmp     %i3,%o7
        move    %xcc,%l3,%i5	
        orcc    %i5,%i5,%i5             ! test for cache miss
        bnz     lbl3b_hit               ! branch if ok
        nop

        ta      T_BAD_TRAP              ! die, an I cache miss means test is worthless
        nop

lbl3b_hit:	
	ldxa    [%i5]ICACHE_TAG_REG_ASI,%i1             ! read tag from i$
	add	%g0,1,%l0
	sllx	%l0,34,%l0				! mask to set V bit
	xor	%l0,%i1,%l0
	stxa	%l0,[%i5]ICACHE_TAG_REG_ASI		! set V bit for line
	
!
	ba	Label1
	nop
!
!
       .align    32     ! insure we start on a new cache line
!
!      %g3=0;
!      Move LabelM3 to Label3a, via I cache write ASI (change I$ not memory or L2$)
!      Enable I$;
!      Goto Label1;
!
Label3c:
        xor     %g3,%g3,%g3             ! set %g3 to 0
!
!               Move LabelM3 to Label3a, via I cache write ASI (change I$ not memory or L2$)
!                       Note:  Label3a is at Label3b+8 and %o4 = address_of[Label3b]
!
        setx    0x00010000,%l0,%o6      ! Used to incr. way bits
        setx    0x00001fc0,%l0,%o7      ! Mask to isolate set index
	sll	%o4,1,%l0		! Adjust for 1 bit offset
        and     %o7,%l0,%l0             ! generate way 0
        add     %l0,%o6,%l1             ! generate way 1
        add     %l1,%o6,%l2             ! generate way 2
        add     %l2,%o6,%l3             ! generate way 3

Label3c_ldxas:	
        ldxa    [%l0]ICACHE_TAG_REG_ASI,%i0           ! read tag from i$ way 0
        ldxa    [%l1]ICACHE_TAG_REG_ASI,%i1           ! read tag from i$ way 1
        ldxa    [%l2]ICACHE_TAG_REG_ASI,%i2           ! read tag from i$ way 2
        ldxa    [%l3]ICACHE_TAG_REG_ASI,%i3           ! read tag from i$ way 3


        add     %g0,1,%o6
        sllx    %o6,32,%o6              ! Parity bit mask (bit 32)
        or      %i0,%o6,%i0             ! force P bit on for all 4 returned tags
        or      %i1,%o6,%i1
        or      %i2,%o6,%i2
        or      %i3,%o6,%i3


        srlx    %o4,12,%o7              ! isolate PA[39:12] into bits
	or	%o7,%o6,%o7		! force P bit on
	sllx	%o6,2,%o6
	or	%o7,%o6,%o7		! force V bit on
	

        ! load %i5 with set & way info,  %o7 has expected tag value
lbl3a_hitcheck:
        add     %g0,%g0,%i5
        cmp     %i0,%o7
        move    %xcc,%l0,%i5
        cmp     %i1,%o7
        move    %xcc,%l1,%i5
        cmp     %i2,%o7
        move    %xcc,%l2,%i5
        cmp     %i3,%o7
        move    %xcc,%l3,%i5
        orcc    %i5,%i5,%i5             ! test for cache miss
        bnz     lbl3a_hit               ! branch if ok
        nop

        ta      T_BAD_TRAP              ! die, an I cache miss means test is worthless
        nop

lbl3a_hit:
!
!	 Ok got a hit in the tags, %i5 has set & way info, need to put word offset into bits 5:3
!
do_IC_bdmod:	
        add     %i5,0x10,%i5            ! set bit 4, offset of 3rd word in line
	setx	LabelM3,%o7,%o5	
        lduw    [%o5+0],%l0             ! get 1st word to store
        stxa    %l0,[%i5]ICACHE_INST_REG_ASI           ! Update i$ entry
        add     %i5,0x08,%l1            ! set bit 3, now have offset of 4th word in line
        lduw    [%o5+4],%l2             ! get 2nd word to store
        stxa    %l2,[%l1]ICACHE_INST_REG_ASI           ! Update i$ entry
!
!               Enable I$ & D$
!
lbl3a_caches_on:	
        add     %g0,LSU_CONTROL_REG_DCIC_MASK,%l2    ! D$ + I$ enable bits
        ldxa    [%g0]LSU_CONTROL_REG_ASI,%l1
        or      %l2,%l1,%l1
        stxa    %l1,[%g0]LSU_CONTROL_REG_ASI         ! insure I$ & D$ are enabled

!
!	Goto Label1
        ba      Label1
        nop

!
!
       .align    32     ! insure we start on a new cache line
!
!
Label4:

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

.global	Tut_ID
	
.global	LabelM1
.global	LabelM2
.global	LabelM3
.global	LabelM4

.global Data0	
.global Data1	
.global Data2	
.global Data3	
	
	
Tut_ID: .word  2         !  Start testing with thread 0
        .word  0

LabelM1:        ! Goto Label2a
        jmpl %o0, %o7
        nop

LabelM2:        ! Goto Label3c
        jmpl %o1, %o7
        nop

LabelM3:        ! Goto Label4
        jmpl %o2, %o7
        nop

LabelM4:        ! Goto Label ??
        jmpl %o3, %o7
        nop
 

        .align    64     ! insure we start on a cache line

Data0:  .xword  0

Data1:  .xword  0x123456789abcdef0

Data2:  .xword  0

Data3:  .xword  0xf0e1d2c3b4a59687



