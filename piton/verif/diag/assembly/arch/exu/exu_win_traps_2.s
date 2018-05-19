// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: exu_win_traps_2.s
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
/***********************************************************************
 * Name:    exu_win_traps.s
 * Date:    June 7, 2003
 *
 *  Description: Exercise the clean_window, fill_n_normal, fill_n_other,
 *	spill_n_normal, and spill_n_other traps using SAVE, RESTORE, and
 *      FLUSHW. Use SAVED and RESTORED instructions in trap handlers.
 *
 *  Code assumes that MAXWIN >= 7.
 *
 *  This test depends on SAS for result checking.    
 *
 **********************************************************************/

! Hardware defines...these should really be in a shared file somewhere
#define H_VERSION_MAXWIN_MASK 0x1f
    
! communication betweent the test loop and the trap handlers.
#define FINISH_DONE    1
#define FINISH_RETRY   2
#define TRAP_NOT_TAKEN 1
#define TRAP_TAKEN     0x1fff
    


#define H_T0_Clean_Window   trap_clean          

#define H_T0_Window_Spill_0_Normal_Trap	trap_spill
#define H_T0_Window_Spill_1_Normal_Trap	trap_spill
#define H_T0_Window_Spill_2_Normal_Trap	trap_spill
#define H_T0_Window_Spill_3_Normal_Trap	trap_spill
#define H_T0_Window_Spill_4_Normal_Trap	trap_spill
#define H_T0_Window_Spill_5_Normal_Trap	trap_spill
#define H_T0_Window_Spill_6_Normal_Trap	trap_spill
#define H_T0_Window_Spill_7_Normal_Trap	trap_spill

#define H_T0_Window_Spill_0_Other_Trap	trap_spill
#define H_T0_Window_Spill_1_Other_Trap	trap_spill
#define H_T0_Window_Spill_2_Other_Trap	trap_spill
#define H_T0_Window_Spill_3_Other_Trap	trap_spill
#define H_T0_Window_Spill_4_Other_Trap	trap_spill
#define H_T0_Window_Spill_5_Other_Trap	trap_spill
#define H_T0_Window_Spill_6_Other_Trap	trap_spill
#define H_T0_Window_Spill_7_Other_Trap	trap_spill

#define H_T0_Window_Fill_0_Normal_Trap	trap_fill
#define H_T0_Window_Fill_1_Normal_Trap	trap_fill
#define H_T0_Window_Fill_2_Normal_Trap	trap_fill
#define H_T0_Window_Fill_3_Normal_Trap	trap_fill
#define H_T0_Window_Fill_4_Normal_Trap	trap_fill
#define H_T0_Window_Fill_5_Normal_Trap	trap_fill
#define H_T0_Window_Fill_6_Normal_Trap	trap_fill
#define H_T0_Window_Fill_7_Normal_Trap	trap_fill
       
#define H_T0_Window_Fill_0_Other_Trap	trap_fill
#define H_T0_Window_Fill_1_Other_Trap	trap_fill
#define H_T0_Window_Fill_2_Other_Trap	trap_fill
#define H_T0_Window_Fill_3_Other_Trap	trap_fill
#define H_T0_Window_Fill_4_Other_Trap	trap_fill
#define H_T0_Window_Fill_5_Other_Trap	trap_fill
#define H_T0_Window_Fill_6_Other_Trap	trap_fill
#define H_T0_Window_Fill_7_Other_Trap	trap_fill
         
                                            
    
/***********************************************************************/   
#define  MAIN_PAGE_HV_ALSO     
#include "boot.s"

.global main
main:
th_fork(th_main,%l0)		! start up to four threads.
	! No need to run more than one core.
	! All threads do the same thing, except for this one bit of setup... 
th_main_0:
      ! SAS mismatches on version reg...grumble grumble
      mov   7,%g4
!        ta	T_CHANGE_HPRIV
!	rdhpr	%ver,%g4	    ! get VERSION (NWINDOWS-1)
!	ta	T_CHANGE_NONHPRIV
	and	%g4,H_VERSION_MAXWIN_MASK,%g4
	set	max_win,%l1
	stx	%g4,[%l1]	    ! save max_win value for later
	ba	th_main_all
	nop

th_main_1:    
th_main_2:    
th_main_3:
      ! SAS mismatches on version reg...grumble grumble
      mov   7,%g4
!        ta	T_CHANGE_HPRIV
!	rdhpr	%ver,%g4	    ! get VERSION (NWINDOWS-1)
!	ta	T_CHANGE_NONHPRIV
	and	%g4,H_VERSION_MAXWIN_MASK,%g4

th_main_all:
	! place the window number, tid, and register number (r8-r23) in the local
	! and out registers of each register window. 
	! Values in the form 00ttwwrr 00000000, ensure each register
	! has a unique value. Lower half of register will be used as a counter.
	sethi	%hi(0x80000000),%g1
	sllx	%g1,4,%g1	    ! base reg number in bits 39 to 32 
	sllx	%l0,48,%l0
	or	%l0,%g1,%g1	    ! thread id in bits 55 to 48
    	sethi	%hi(0x10000000),%g2
	sllx	%g2,4,%g2	    ! reg increment
	add	%g0,1,%g3
	sllx	%g3,40,%g3	    ! window increment in bit 40

	! read current CWP, CANRESTORE, just fyi.
	! add one to CANSAVE to allow init of last window's regs
	ta	T_CHANGE_PRIV
	rdpr	%cwp,%g5
	rdpr	%cansave,%g6	   
	wrpr	%g4,0,%cansave	     ! set CANSAVE = maxwin
	rdpr	%canrestore,%g7
	ta	T_CHANGE_NONPRIV
    
reg_init:
	add	%g0,%g1,%r8
	add	%r8,%g2,%r9
	add	%r9,%g2,%r10
	add	%r10,%g2,%r11
	add	%r11,%g2,%r12
	add	%r12,%g2,%r13
	add	%r13,%g2,%r14
	add	%r14,%g2,%r15
	add	%r15,%g2,%r16
	add	%r16,%g2,%r17
	add	%r17,%g2,%r18
	add	%r18,%g2,%r19
	add	%r19,%g2,%r20
	add	%r20,%g2,%r21
	add	%r21,%g2,%r22
	add	%r22,%g2,%r23
	brz	%g4,reg_init_done
	sub	%g4,1,%g4
	save	%g3,%g1,%g1	    ! increment window field of g1, next window
	ba	reg_init
	nop

reg_init_done:	    
	set	max_win,%g1
	ldx	[%g1],%g4
    
	!!*********************************************************************
	!! save 1:  OTHERWIN = 0, WSTATE.NORMAL=0
    	!!*********************************************************************
	sub	%g4,1,%g5	    
	ta	T_CHANGE_PRIV
	wrpr	%g0,0,%cwp	    !        CWP = 0
	wrpr	%g5,0,%cansave	    !    CANSAVE = maxwin-1
	wrpr	%g0,0,%canrestore   ! CANRESTORE = 0
	wrpr	%g4,0,%cleanwin	    !   CLEANWIN = maxwin
	wrpr	%g0,0,%otherwin	    
	wrpr	%g0,0,%wstate
	ta	T_CHANGE_NONPRIV  
	add	%g0,FINISH_DONE,%g7
	add	%g0,TRAP_NOT_TAKEN,%g6
save1:
	save	%o0,1,%i0	    ! effectively x++
	brlz	%g6,save1_done
	nop
	add	%i1,1,%i1
!	add	%l1,1,%l1    ! l1 and o1 are unpredictable for SAVE, so do not
!	add	%o1,1,%o1    ! mess with them. SAS will pick up rtl mismatch
	ba	save1
	nop
save1_done:

	!!*********************************************************************
	!! save 2:  OTHERWIN = 0, WSTATE.NORMAL=1
    	!!*********************************************************************
	sub	%g4,2,%g5	    
	ta	T_CHANGE_PRIV
	wrpr	%g4,0,%cwp	    !        CWP = maxwin
	wrpr	%g0,3,%cansave	    !    CANSAVE = 3
	wrpr	%g0,1,%canrestore   ! CANRESTORE = 1
	wrpr	%g5,0,%cleanwin	    !   CLEANWIN = maxwin-2
	wrpr	%g0,0,%otherwin	    
	wrpr	%g0,1,%wstate
	ta	T_CHANGE_NONPRIV  
	add	%g0,FINISH_DONE,%g7
	add	%g0,TRAP_NOT_TAKEN,%g6
save2:
	save	%o0,1,%i0	    ! effectively x++
	brlz	%g6,save2_done
	nop
	add	%i2,1,%i2
	ba	save2
	nop
save2_done:    

	!!*********************************************************************
	!! save 3:  OTHERWIN = 0, WSTATE.NORMAL=2
    	!!*********************************************************************
	sub	%g4,2,%g5	    
	ta	T_CHANGE_PRIV
	wrpr	%g5,0,%cwp	    !        CWP = maxwin-2
	wrpr	%g0,4,%cansave	    !    CANSAVE = 4
	wrpr	%g0,2,%canrestore   ! CANRESTORE = 2
	wrpr	%g4,0,%cleanwin	    !   CLEANWIN = maxwin
	wrpr	%g0,0,%otherwin	    
	wrpr	%g0,2,%wstate
	ta	T_CHANGE_NONPRIV  
	add	%g0,FINISH_DONE,%g7
	add	%g0,TRAP_NOT_TAKEN,%g6
save3:
	save	%o0,1,%i0	    ! effectively x++
	brlz	%g6,save3_done
	nop
	add	%i3,1,%i3
	ba	save3
	nop
save3_done:     
    
	!!*********************************************************************
	!! save 4:  OTHERWIN = 0, WSTATE.NORMAL=3
    	!!*********************************************************************
	ta	T_CHANGE_PRIV
	wrpr	%g0,1,%cwp	    !        CWP = 1
	wrpr	%g0,1,%cansave	    !    CANSAVE = 1
	wrpr	%g0,0,%canrestore   ! CANRESTORE = 0
	wrpr	%g0,2,%cleanwin	    !   CLEANWIN = 2
	wrpr	%g0,0,%otherwin	    
	wrpr	%g0,3,%wstate
	ta	T_CHANGE_NONPRIV  
	add	%g0,FINISH_DONE,%g7
	add	%g0,TRAP_NOT_TAKEN,%g6
save4:
	save	%o0,1,%i0	    ! effectively x++
	brlz	%g6,save4_done
	nop
	add	%i4,1,%i4
	ba	save4
	nop
save4_done:     
   
	!!*********************************************************************
	!! save 5:  OTHERWIN = 0, WSTATE.NORMAL=4
    	!!*********************************************************************
	ta	T_CHANGE_PRIV
	wrpr	%g0,1,%cwp	    !        CWP = 1
	wrpr	%g0,0,%cansave	    !    CANSAVE = 0
	wrpr	%g0,1,%canrestore   ! CANRESTORE = 1
	wrpr	%g0,2,%cleanwin	    !   CLEANWIN = 2
	wrpr	%g0,0,%otherwin	    
	wrpr	%g0,0x34,%wstate
	ta	T_CHANGE_NONPRIV  
	add	%g0,FINISH_DONE,%g7
	add	%g0,TRAP_NOT_TAKEN,%g6
save5:
	save	%o0,1,%i0	    ! effectively x++
	brlz	%g6,save5_done
	nop
	add	%i5,1,%i5
	ba	save5
	nop
save5_done:         
 
	!!*********************************************************************
	!! save 6:  OTHERWIN = 0, WSTATE.NORMAL=5
    	!!*********************************************************************
	sub	%g4,2,%g5
    	ta	T_CHANGE_PRIV
	wrpr	%g5,0,%cwp	    !        CWP = maxwin-2
	wrpr	%g0,2,%cansave	    !    CANSAVE = 2
	wrpr	%g0,0,%canrestore   ! CANRESTORE = 0
	wrpr	%g0,4,%cleanwin	    !   CLEANWIN = 4
	wrpr	%g0,0,%otherwin	    
	wrpr	%g0,0x3b,%wstate
	ta	T_CHANGE_NONPRIV  
	add	%g0,FINISH_DONE,%g7
	add	%g0,TRAP_NOT_TAKEN,%g6
save6:
	save	%o0,1,%i0	    ! effectively x++
	brlz	%g6,save6_done
	nop
	add	%i6,1,%i6
	ba	save6
	nop
save6_done:         
 
	!!*********************************************************************
	!! save 7:  OTHERWIN = 0, WSTATE.NORMAL=6
    	!!*********************************************************************
	ta	T_CHANGE_PRIV
	wrpr	%g0,1,%cwp	    !        CWP = 1
	wrpr	%g0,2,%cansave	    !    CANSAVE = 2
	wrpr	%g0,4,%canrestore   ! CANRESTORE = 0
	wrpr	%g0,7,%cleanwin	    !   CLEANWIN = 7
	wrpr	%g0,0,%otherwin	    
	wrpr	%g0,6,%wstate
	ta	T_CHANGE_NONPRIV  
	add	%g0,FINISH_DONE,%g7
	add	%g0,TRAP_NOT_TAKEN,%g6
save7:
	save	%o0,1,%i0	    ! effectively x++
	brlz	%g6,save7_done
	nop
	add	%i7,1,%i7
	ba	save7
	nop
save7_done:         
 
	!!*********************************************************************
	!! save 8:  OTHERWIN = 0, WSTATE.NORMAL=7
    	!!*********************************************************************
	sub	%g4,2,%g5	    
	ta	T_CHANGE_PRIV
	wrpr	%g4,0,%cwp	    !        CWP = maxwin
	wrpr	%g0,0,%cansave	    !    CANSAVE = 0
	wrpr	%g0,1,%canrestore   ! CANRESTORE = 1
	wrpr	%g5,0,%cleanwin	    !   CLEANWIN = maxwin-2
	wrpr	%g0,0,%otherwin	    
	wrpr	%g0,7,%wstate
	ta	T_CHANGE_NONPRIV  
	add	%g0,FINISH_DONE,%g7
	add	%g0,TRAP_NOT_TAKEN,%g6
save8:
	save	%o0,1,%i0	    ! effectively x++
	brlz	%g6,save8_done
	nop
	add	%i1,1,%i1
	ba	save8
	nop
save8_done:         
 
	!!*********************************************************************
	!! save 9:  OTHERWIN = 1, WSTATE.OTHER=0
    	!!*********************************************************************
	sub	%g4,2,%g5
    	ta	T_CHANGE_PRIV
	wrpr	%g5,0,%cwp	    !        CWP = maxwin-2
	wrpr	%g5,0,%cansave	    !    CANSAVE = maxwin-2
	wrpr	%g0,0,%canrestore   ! CANRESTORE = 0
	wrpr	%g4,0,%cleanwin	    !   CLEANWIN = maxwin
	wrpr	%g0,1,%otherwin	    
	wrpr	%g0,0,%wstate
	ta	T_CHANGE_NONPRIV  
	add	%g0,FINISH_DONE,%g7
	add	%g0,TRAP_NOT_TAKEN,%g6
save9:
	save	%o0,1,%i0	    ! effectively x++
	brlz	%g6,save9_done
	nop
	add	%i2,1,%i2
	ba	save9
	nop
save9_done:     

	!!*********************************************************************
	!! save 10:  OTHERWIN = 1, WSTATE.OTHER=1
    	!!*********************************************************************
	ta	T_CHANGE_PRIV
	wrpr	%g0,2,%cwp	    !        CWP = 2
	wrpr	%g0,3,%cansave	    !    CANSAVE = 3
	wrpr	%g0,1,%canrestore   ! CANRESTORE = 1
	wrpr	%g0,5,%cleanwin	    !   CLEANWIN = 5
	wrpr	%g0,1,%otherwin	    
	wrpr	%g0,8,%wstate
	ta	T_CHANGE_NONPRIV  
	add	%g0,FINISH_DONE,%g7
	add	%g0,TRAP_NOT_TAKEN,%g6
save10:
	save	%o0,1,%i0	    ! effectively x++
	brlz	%g6,save10_done
	nop
	add	%i3,1,%i3
	ba	save10
	nop
save10_done:     

	!!*********************************************************************
	!! save 11:  OTHERWIN = 1, WSTATE.OTHER=2
    	!!*********************************************************************
	ta	T_CHANGE_PRIV
	wrpr	%g0,3,%cwp	    !        CWP = 3
	wrpr	%g0,1,%cansave	    !    CANSAVE = 1
	wrpr	%g0,2,%canrestore   ! CANRESTORE = 2
	wrpr	%g0,4,%cleanwin	    !   CLEANWIN = 4
	wrpr	%g0,1,%otherwin	    
	wrpr	%g0,0x10,%wstate
	ta	T_CHANGE_NONPRIV  
	add	%g0,FINISH_DONE,%g7
	add	%g0,TRAP_NOT_TAKEN,%g6
save11:
	save	%o0,1,%i0	    ! effectively x++
	brlz	%g6,save11_done
	nop
	add	%i4,1,%i4
	ba	save11
	nop
save11_done:     

	!!*********************************************************************
	!! save 12:  OTHERWIN = 1, WSTATE.OTHER=3
    	!!*********************************************************************
	ta	T_CHANGE_PRIV
	wrpr	%g0,4,%cwp	    !        CWP = 4
	wrpr	%g0,1,%cansave	    !    CANSAVE = 1
	wrpr	%g0,0,%canrestore   ! CANRESTORE = 0
	wrpr	%g0,3,%cleanwin	    !   CLEANWIN = 3
	wrpr	%g0,1,%otherwin	    
	wrpr	%g0,0x18,%wstate
	ta	T_CHANGE_NONPRIV  
	add	%g0,FINISH_DONE,%g7
	add	%g0,TRAP_NOT_TAKEN,%g6
save12:
	save	%o0,1,%i0	    ! effectively x++
	brlz	%g6,save12_done
	nop
	add	%i5,1,%i5
	ba	save12
	nop
save12_done:     

	!!*********************************************************************
	!! save 12:  OTHERWIN = 1, WSTATE.OTHER=4
    	!!*********************************************************************
	ta	T_CHANGE_PRIV
	wrpr	%g0,5,%cwp	    !        CWP = 5
	wrpr	%g0,1,%cansave	    !    CANSAVE = 1
	wrpr	%g0,3,%canrestore   ! CANRESTORE = 3
	wrpr	%g0,7,%cleanwin	    !   CLEANWIN = 7
	wrpr	%g0,1,%otherwin	    
	wrpr	%g0,0x20,%wstate
	ta	T_CHANGE_NONPRIV  
	add	%g0,FINISH_DONE,%g7
	add	%g0,TRAP_NOT_TAKEN,%g6
save13:
	save	%o0,1,%i0	    ! effectively x++
	brlz	%g6,save13_done
	nop
	add	%i6,1,%i6
	ba	save13
	nop
save13_done:     

	!!*********************************************************************
	!! save 14:  OTHERWIN = 1, WSTATE.OTHER=5
    	!!*********************************************************************
	ta	T_CHANGE_PRIV
	wrpr	%g0,6,%cwp	    !        CWP = 6
	wrpr	%g0,1,%cansave	    !    CANSAVE = 1
	wrpr	%g0,0,%canrestore   ! CANRESTORE = 0
	wrpr	%g0,4,%cleanwin	    !   CLEANWIN = 4
	wrpr	%g0,1,%otherwin	    
	wrpr	%g0,0x29,%wstate
	ta	T_CHANGE_NONPRIV  
	add	%g0,FINISH_DONE,%g7
	add	%g0,TRAP_NOT_TAKEN,%g6
save14:
	save	%o0,1,%i0	    ! effectively x++
	brlz	%g6,save14_done
	nop
	add	%i7,1,%i7
	ba	save14
	nop
save14_done:     

	!!*********************************************************************
	!! save 15:  OTHERWIN = 1, WSTATE.OTHER=6
    	!!*********************************************************************
	ta	T_CHANGE_PRIV
	wrpr	%g0,0,%cwp	    !        CWP = 0 
	wrpr	%g0,0,%cansave	    !    CANSAVE = 0
	wrpr	%g0,0,%canrestore   ! CANRESTORE = 0
	wrpr	%g0,1,%cleanwin	    !   CLEANWIN = 1
	wrpr	%g0,1,%otherwin	    
	wrpr	%g0,0x30,%wstate
	ta	T_CHANGE_NONPRIV  
	add	%g0,FINISH_DONE,%g7
	add	%g0,TRAP_NOT_TAKEN,%g6
save15:
	save	%o0,1,%i0	    ! effectively x++
	brlz	%g6,save15_done
	nop
	add	%i1,1,%i1
	ba	save15
	nop
save15_done:     

	!!*********************************************************************
	!! save 16:  OTHERWIN = 1, WSTATE.OTHER=7
    	!!*********************************************************************
	sub	%g4,1,%g5
    	ta	T_CHANGE_PRIV
	wrpr	%g4,0,%cwp	    !        CWP = maxwin
	wrpr	%g0,0,%cansave	    !    CANSAVE = 0
	wrpr	%g5,0,%canrestore   ! CANRESTORE = maxwin-1
	wrpr	%g4,0,%cleanwin	    !   CLEANWIN = maxwin
	wrpr	%g0,1,%otherwin	    
	wrpr	%g0,0x3e,%wstate
	ta	T_CHANGE_NONPRIV  
	add	%g0,FINISH_DONE,%g7
	add	%g0,TRAP_NOT_TAKEN,%g6
save16:
	save	%o0,1,%i0	    ! effectively x++
	brlz	%g6,save16_done
	nop
	add	%i2,1,%i2
	ba	save16
	nop
save16_done:     

	!!*********************************************************************
	!!*********************************************************************
	!! restore 0:  OTHERWIN = 0, WSTATE.NORMAL=0
    	!!*********************************************************************
	sub	%g4,1,%g5
    	ta	T_CHANGE_PRIV
	wrpr	%g0,0,%cwp	    !        CWP = 0
	wrpr	%g0,0,%cansave	    !    CANSAVE = 0
	wrpr	%g5,0,%canrestore   ! CANRESTORE = maxwin-1
	wrpr	%g4,0,%cleanwin	    !   CLEANWIN = maxwin
	wrpr	%g0,0,%otherwin	    
	wrpr	%g0,0,%wstate
	ta	T_CHANGE_NONPRIV  
	add	%g0,FINISH_DONE,%g7
	add	%g0,TRAP_NOT_TAKEN,%g6
rest0:
	restore	%i0,1,%o0	    ! effectively x++
	brlz	%g6,rest0_done
	nop
	add	%i3,1,%i3	    ! restore, all three regs blocks must match
	add	%l3,1,%l3
	add	%o3,1,%o3
	ba	rest0
	nop
rest0_done:  
    
    	!!*********************************************************************
	!! restore 1:  OTHERWIN = 0, WSTATE.NORMAL=1
    	!!*********************************************************************
    	ta	T_CHANGE_PRIV
	wrpr	%g4,0,%cwp	    !        CWP = maxwin
	wrpr	%g0,1,%cansave	    !    CANSAVE = 1
	wrpr	%g0,1,%canrestore   ! CANRESTORE = 1
	wrpr	%g0,0,%cleanwin	    !   CLEANWIN = 0
	wrpr	%g0,0,%otherwin	    
	wrpr	%g0,0,%wstate
	ta	T_CHANGE_NONPRIV  
	add	%g0,FINISH_DONE,%g7
	add	%g0,TRAP_NOT_TAKEN,%g6
rest1:
	restore	%i0,1,%o0	    ! effectively x++
	brlz	%g6,rest1_done
	nop
	add	%i3,1,%i3	    ! restore, all three regs blocks must match
	add	%l3,1,%l3
	add	%o3,1,%o3
	ba	rest1
	nop
rest1_done:  
    
	!!*********************************************************************
	!! restore 2:  OTHERWIN = 0, WSTATE.NORMAL=2
    	!!*********************************************************************
    	ta	T_CHANGE_PRIV
	wrpr	%g0,0,%cwp	    !        CWP = 0
	wrpr	%g0,0,%cansave	    !    CANSAVE = 0
	wrpr	%g0,0,%canrestore   ! CANRESTORE = 0
	wrpr	%g0,3,%cleanwin	    !   CLEANWIN = 3
	wrpr	%g0,0,%otherwin	    
	wrpr	%g0,1,%wstate
	ta	T_CHANGE_NONPRIV  
	add	%g0,FINISH_DONE,%g7
	add	%g0,TRAP_NOT_TAKEN,%g6
rest2:
	restore	%i0,1,%o0	    ! effectively x++
	brlz	%g6,rest2_done
	nop
	add	%i3,1,%i3	    ! restore, all three regs blocks must match
	add	%l3,1,%l3
	add	%o3,1,%o3
	ba	rest2
	nop
rest2_done:  
    
	!!*********************************************************************
	!! restore 3:  OTHERWIN = 0, WSTATE.NORMAL=3
    	!!*********************************************************************
    	ta	T_CHANGE_PRIV
	wrpr	%g0,2,%cwp	    !        CWP = 2
	wrpr	%g0,3,%cansave	    !    CANSAVE = 3
	wrpr	%g0,1,%canrestore   ! CANRESTORE = 1
	wrpr	%g4,0,%cleanwin	    !   CLEANWIN = maxwin
	wrpr	%g0,0,%otherwin	    
	wrpr	%g0,3,%wstate
	ta	T_CHANGE_NONPRIV  
	add	%g0,FINISH_DONE,%g7
	add	%g0,TRAP_NOT_TAKEN,%g6
rest3:
	restore	%i0,1,%o0	    ! effectively x++
	brlz	%g6,rest3_done
	nop
	add	%i3,1,%i3	    ! restore, all three regs blocks must match
	add	%l3,1,%l3
	add	%o3,1,%o3
	ba	rest3
	nop
rest3_done:  
    
	!!*********************************************************************
	!! restore 4:  OTHERWIN = 0, WSTATE.NORMAL=4
    	!!*********************************************************************
	sub	%g4,1,%g5
    	ta	T_CHANGE_PRIV
	wrpr	%g0,1,%cwp	    !        CWP = 1
	wrpr	%g0,0,%cansave	    !    CANSAVE = 0
	wrpr	%g0,3,%canrestore   ! CANRESTORE = 3
	wrpr	%g4,0,%cleanwin	    !   CLEANWIN = maxwin
	wrpr	%g0,0,%otherwin	    
	wrpr	%g0,4,%wstate
	ta	T_CHANGE_NONPRIV  
	add	%g0,FINISH_DONE,%g7
	add	%g0,TRAP_NOT_TAKEN,%g6
rest4:
	restore	%i0,1,%o0	    ! effectively x++
	brlz	%g6,rest4_done
	nop
	add	%i3,1,%i3	    ! restore, all three regs blocks must match
	add	%l3,1,%l3
	add	%o3,1,%o3
	ba	rest4
	nop
rest4_done:  
    
	!!*********************************************************************
	!! restore 5:  OTHERWIN = 0, WSTATE.NORMAL=5
    	!!*********************************************************************
	sub	%g4,1,%g5
    	ta	T_CHANGE_PRIV
	wrpr	%g5,0,%cwp	    !        CWP = maxwin-1
	wrpr	%g0,0,%cansave	    !    CANSAVE = 0
	wrpr	%g0,3,%canrestore   ! CANRESTORE = 3
	wrpr	%g0,0,%cleanwin	    !   CLEANWIN = 0, not checked on restore
	wrpr	%g0,0,%otherwin	    
	wrpr	%g0,5,%wstate
	ta	T_CHANGE_NONPRIV  
	add	%g0,FINISH_DONE,%g7
	add	%g0,TRAP_NOT_TAKEN,%g6
rest5:
	restore	%i0,1,%o0	    ! effectively x++
	brlz	%g6,rest5_done
	nop
	add	%i3,1,%i3	    ! restore, all three regs blocks must match
	add	%l3,1,%l3
	add	%o3,1,%o3
	ba	rest5
	nop
rest5_done:  
   
	!!*********************************************************************
	!! restore 6:  OTHERWIN = 0, WSTATE.NORMAL=6
    	!!*********************************************************************
    	ta	T_CHANGE_PRIV
	wrpr	%g4,0,%cwp	    !        CWP = maxwin
	wrpr	%g0,1,%cansave	    !    CANSAVE = 1
	wrpr	%g0,0,%canrestore   ! CANRESTORE = 0
	wrpr	%g4,0,%cleanwin	    !   CLEANWIN = maxwin
	wrpr	%g0,0,%otherwin	    
	wrpr	%g0,6,%wstate
	ta	T_CHANGE_NONPRIV  
	add	%g0,FINISH_DONE,%g7
	add	%g0,TRAP_NOT_TAKEN,%g6
rest6:
	restore	%i0,1,%o0	    ! effectively x++
	brlz	%g6,rest6_done
	nop
	add	%i3,1,%i3	    ! restore, all three regs blocks must match
	add	%l3,1,%l3
	add	%o3,1,%o3
	ba	rest6
	nop
rest6_done:

	!!*********************************************************************
	!! restore 7:  OTHERWIN = 0, WSTATE.NORMAL=7
    	!!*********************************************************************
    	ta	T_CHANGE_PRIV
	wrpr	%g4,0,%cwp	    !        CWP = maxwin
	wrpr	%g0,0,%cansave	    !    CANSAVE = 0
	wrpr	%g0,1,%canrestore   ! CANRESTORE = 1
	wrpr	%g4,0,%cleanwin	    !   CLEANWIN = maxwin
	wrpr	%g0,0,%otherwin	    
	wrpr	%g0,7,%wstate
	ta	T_CHANGE_NONPRIV  
	add	%g0,FINISH_DONE,%g7
	add	%g0,TRAP_NOT_TAKEN,%g6
rest7:
	restore	%i0,1,%o0	    ! effectively x++
	brlz	%g6,rest7_done
	nop
	add	%i3,1,%i3	    ! restore, all three regs blocks must match
	add	%l3,1,%l3
	add	%o3,1,%o3
	ba	rest7
	nop
rest7_done:

	!!*********************************************************************
	!! restore 8:  OTHERWIN = 1, WSTATE.OTHER=0
    	!!*********************************************************************
	sub	%g4,1,%g5
    	ta	T_CHANGE_PRIV
	wrpr	%g5,0,%cwp	    !        CWP = maxwin-1
	wrpr	%g0,0,%cansave	    !    CANSAVE = 0
	wrpr	%g0,1,%canrestore   ! CANRESTORE = 1
	wrpr	%g4,0,%cleanwin	    !   CLEANWIN = maxwin
	wrpr	%g0,1,%otherwin	    
	wrpr	%g0,0,%wstate
	ta	T_CHANGE_NONPRIV  
	add	%g0,FINISH_DONE,%g7
	add	%g0,TRAP_NOT_TAKEN,%g6
rest8:
	restore	%i0,1,%o0	    ! effectively x++
	brlz	%g6,rest8_done
	nop
	add	%i3,1,%i3	    ! restore, all three regs blocks must match
	add	%l3,1,%l3
	add	%o3,1,%o3
	ba	rest8
	nop
rest8_done:  

	!!*********************************************************************
	!! restore 9:  OTHERWIN = 1, WSTATE.OTHER=1
    	!!*********************************************************************
    	ta	T_CHANGE_PRIV
	wrpr	%g0,3,%cwp	    !        CWP = 3
	wrpr	%g0,1,%cansave	    !    CANSAVE = 1
	wrpr	%g0,1,%canrestore   ! CANRESTORE = 1
	wrpr	%g4,0,%cleanwin	    !   CLEANWIN = maxwin
	wrpr	%g0,1,%otherwin	    
	wrpr	%g0,8,%wstate
	ta	T_CHANGE_NONPRIV  
	add	%g0,FINISH_DONE,%g7
	add	%g0,TRAP_NOT_TAKEN,%g6
rest9:
	restore	%i0,1,%o0	    ! effectively x++
	brlz	%g6,rest9_done
	nop
	add	%i3,1,%i3	    ! restore, all three regs blocks must match
	add	%l3,1,%l3
	add	%o3,1,%o3
	ba	rest9
	nop
rest9_done:  

	!!*********************************************************************
	!! restore 10:  OTHERWIN = 1, WSTATE.OTHER=2
    	!!*********************************************************************
	sub	%g4,1,%g5
    	ta	T_CHANGE_PRIV
	wrpr	%g5,0,%cwp	    !        CWP = maxwin-1
	wrpr	%g0,0,%cansave	    !    CANSAVE = 0
	wrpr	%g0,2,%canrestore   ! CANRESTORE = 2
	wrpr	%g4,0,%cleanwin	    !   CLEANWIN = maxwin
	wrpr	%g0,1,%otherwin	    
	wrpr	%g0,0x10,%wstate
	ta	T_CHANGE_NONPRIV  
	add	%g0,FINISH_DONE,%g7
	add	%g0,TRAP_NOT_TAKEN,%g6
rest10:
	restore	%i0,1,%o0	    ! effectively x++
	brlz	%g6,rest10_done
	nop
	add	%i3,1,%i3	    ! restore, all three regs blocks must match
	add	%l3,1,%l3
	add	%o3,1,%o3
	ba	rest10
	nop
rest10_done:  

	!!*********************************************************************
	!! restore 11:  OTHERWIN = 1, WSTATE.OTHER=3
    	!!*********************************************************************
    	ta	T_CHANGE_PRIV
	wrpr	%g0,0,%cwp	    !        CWP = 0
	wrpr	%g0,0,%cansave	    !    CANSAVE = 0
	wrpr	%g0,2,%canrestore   ! CANRESTORE = 2
	wrpr	%g4,0,%cleanwin	    !   CLEANWIN = maxwin
	wrpr	%g0,1,%otherwin	    
	wrpr	%g0,18,%wstate
	ta	T_CHANGE_NONPRIV  
	add	%g0,FINISH_DONE,%g7
	add	%g0,TRAP_NOT_TAKEN,%g6
rest11:
	restore	%i0,1,%o0	    ! effectively x++
	brlz	%g6,rest11_done
	nop
	add	%i3,1,%i3	    ! restore, all three regs blocks must match
	add	%l3,1,%l3
	add	%o3,1,%o3
	ba	rest11
	nop
rest11_done:  

	!!*********************************************************************
	!! restore 12:  OTHERWIN = 1, WSTATE.OTHER=4
    	!!*********************************************************************
    	ta	T_CHANGE_PRIV
	wrpr	%g0,2,%cwp	    !        CWP = 2
	wrpr	%g0,0,%cansave	    !    CANSAVE = 0
	wrpr	%g0,2,%canrestore   ! CANRESTORE = 2
	wrpr	%g0,3,%cleanwin	    !   CLEANWIN = 3
	wrpr	%g0,1,%otherwin	    
	wrpr	%g0,0x25,%wstate
	ta	T_CHANGE_NONPRIV  
	add	%g0,FINISH_DONE,%g7
	add	%g0,TRAP_NOT_TAKEN,%g6
rest12:
	restore	%i0,1,%o0	    ! effectively x++
	brlz	%g6,rest12_done
	nop
	add	%i3,1,%i3	    ! restore, all three regs blocks must match
	add	%l3,1,%l3
	add	%o3,1,%o3
	ba	rest12
	nop
rest12_done:  

	!!*********************************************************************
	!! restore 13:  OTHERWIN = 1, WSTATE.OTHER=5
    	!!*********************************************************************
    	ta	T_CHANGE_PRIV
	wrpr	%g0,4,%cwp	    !        CWP = 4
	wrpr	%g0,3,%cansave	    !    CANSAVE = 3
	wrpr	%g0,3,%canrestore   ! CANRESTORE = 3
	wrpr	%g4,0,%cleanwin	    !   CLEANWIN = maxwin
	wrpr	%g0,1,%otherwin	    
	wrpr	%g0,0x28,%wstate
	ta	T_CHANGE_NONPRIV  
	add	%g0,FINISH_DONE,%g7
	add	%g0,TRAP_NOT_TAKEN,%g6
rest13:
	restore	%i0,1,%o0	    ! effectively x++
	brlz	%g6,rest13_done
	nop
	add	%i3,1,%i3	    ! restore, all three regs blocks must match
	add	%l3,1,%l3
	add	%o3,1,%o3
	ba	rest13
	nop
rest13_done:  

	!!*********************************************************************
	!! restore 14:  OTHERWIN = 1, WSTATE.OTHER=6
    	!!*********************************************************************
    	ta	T_CHANGE_PRIV
	wrpr	%g0,0,%cwp	    !        CWP = 0
	wrpr	%g0,1,%cansave	    !    CANSAVE = 1
	wrpr	%g0,1,%canrestore   ! CANRESTORE = 1
	wrpr	%g4,0,%cleanwin	    !   CLEANWIN = maxwin
	wrpr	%g0,1,%otherwin	    
	wrpr	%g0,0x30,%wstate
	ta	T_CHANGE_NONPRIV  
	add	%g0,FINISH_DONE,%g7
	add	%g0,TRAP_NOT_TAKEN,%g6
rest14:
	restore	%i0,1,%o0	    ! effectively x++
	brlz	%g6,rest14_done
	nop
	add	%i3,1,%i3	    ! restore, all three regs blocks must match
	add	%l3,1,%l3
	add	%o3,1,%o3
	ba	rest14
	nop
rest14_done:  

	!!*********************************************************************
	!! restore 15:  OTHERWIN = 1, WSTATE.OTHER=7
    	!!*********************************************************************
    	ta	T_CHANGE_PRIV
	wrpr	%g0,3,%cwp	    !        CWP = 3
	wrpr	%g0,0,%cansave	    !    CANSAVE = 0
	wrpr	%g0,0,%canrestore   ! CANRESTORE = 0
	wrpr	%g4,0,%cleanwin	    !   CLEANWIN = maxwin
	wrpr	%g0,1,%otherwin	    
	wrpr	%g0,0x38,%wstate
	ta	T_CHANGE_NONPRIV  
	add	%g0,FINISH_DONE,%g7
	add	%g0,TRAP_NOT_TAKEN,%g6
rest15:
	restore	%i0,1,%o0	    ! effectively x++
	brlz	%g6,rest15_done
	nop
	add	%i3,1,%i3	    ! restore, all three regs blocks must match
	add	%l3,1,%l3
	add	%o3,1,%o3
	ba	rest15
	nop
rest15_done:  

	!!*********************************************************************
	!!*********************************************************************
	!! clean1:   cleanwin exception when cleanwin = canrestore = 0
    	!!*********************************************************************
    	ta	T_CHANGE_PRIV
	wrpr	%g0,0,%cwp	    !        CWP = 0
	wrpr	%g0,3,%cansave	    !    CANSAVE = 3
	wrpr	%g0,0,%canrestore   ! CANRESTORE = 0
	wrpr	%g0,0,%cleanwin	    !   CLEANWIN = 0
	wrpr	%g0,0,%otherwin	    
	wrpr	%g0,0,%wstate
	ta	T_CHANGE_NONPRIV  
	add	%g0,FINISH_RETRY,%g7
clean1:
	save	%o0,1,%i0	    ! effectively x++
	add	%i2,1,%i2
    

	!!*********************************************************************
	!! clean2:   cleanwin exception when cleanwin = canrestore = 1
    	!!*********************************************************************
    	ta	T_CHANGE_PRIV
	wrpr	%g0,0,%cwp	    !        CWP = 0
	wrpr	%g0,3,%cansave	    !    CANSAVE = 3
	wrpr	%g0,1,%canrestore   ! CANRESTORE = 1
	wrpr	%g0,1,%cleanwin	    !   CLEANWIN = 1
	wrpr	%g0,1,%otherwin	    
	wrpr	%g0,0,%wstate
	ta	T_CHANGE_NONPRIV  
	add	%g0,FINISH_RETRY,%g7
clean2:
	save	%o0,1,%i0	    ! effectively x++    
	add	%i2,1,%i2

	!!*********************************************************************
	!! clean3:   save when cleanwin < canrestore. This is not architecturally
	!!	     specified. Niagara will not trap.
    	!!*********************************************************************
    	ta	T_CHANGE_PRIV
	wrpr	%g0,0,%cwp	    !        CWP = 0
	wrpr	%g0,3,%cansave	    !    CANSAVE = 3
	wrpr	%g0,2,%canrestore   ! CANRESTORE = 2
	wrpr	%g0,1,%cleanwin	    !   CLEANWIN = 1
	wrpr	%g0,0,%otherwin	    
	wrpr	%g0,0,%wstate
	ta	T_CHANGE_NONPRIV  
	add	%g0,FINISH_RETRY,%g7
clean3:
	save	%o0,1,%i0	    ! effectively x++
	add	%i2,1,%i2

	!!*********************************************************************
	!! clean4:   save when cleanwin = canrestore, and cansave = 0.
	!!	     the spill trap has priority over the cleanwin trap
    	!!*********************************************************************
    	ta	T_CHANGE_PRIV
	wrpr	%g0,0,%cwp	    !        CWP = 0
	wrpr	%g0,0,%cansave	    !    CANSAVE = 0
	wrpr	%g0,3,%canrestore   ! CANRESTORE = 3
	wrpr	%g0,3,%cleanwin	    !   CLEANWIN = 3
	wrpr	%g0,0,%otherwin	    
	wrpr	%g0,0,%wstate
	ta	T_CHANGE_NONPRIV  
	add	%g0,TRAP_NOT_TAKEN,%g6
	add	%g0,FINISH_DONE,%g7
clean4:
	save	%o0,1,%i0	    ! effectively x++
	add	%i2,1,%i2
	!! trap clean does not use g6, so if g6 has changed, the correct trap
	!! was taken. (Yeah, I know, this is not advertised as a self-checking
	!! test...)
    	cmp	%g6,TRAP_NOT_TAKEN
	bne	clean4_ok
	nop
	ta	T_BAD_TRAP
	nop
	nop
clean4_ok:
    

	!!*********************************************************************
	!!*********************************************************************
	!! flush1:   flush with NWINDOWS-2 = CANSAVE, should be a NOP
    	!!*********************************************************************
	sub	%g4,1,%g5
    	ta	T_CHANGE_PRIV
	wrpr	%g0,0,%cwp	    !        CWP = 0
	wrpr	%g5,0,%cansave	    !    CANSAVE = maxwin-1 (NWINDOWS-2)
	wrpr	%g0,3,%canrestore   ! CANRESTORE = 3
	wrpr	%g0,3,%cleanwin	    !   CLEANWIN = 3
	wrpr	%g0,0,%otherwin	    
	wrpr	%g0,0,%wstate
	ta	T_CHANGE_NONPRIV  
	add	%g0,TRAP_NOT_TAKEN,%g6
	add	%g0,FINISH_DONE,%g7
flush1:
	flushw
	add	%i3,1,%i3
    	cmp	%g6,TRAP_NOT_TAKEN
	be	flush1_ok
	nop
	ta	T_BAD_TRAP
	nop
	nop
flush1_ok:

    	!!*********************************************************************
	!! flush2:   flush with NWINDOWS-2-CANSAVE>0, should take a spill trap
    	!!*********************************************************************
	sub	%g4,3,%g5
    	ta	T_CHANGE_PRIV
	wrpr	%g0,0,%cwp	    !        CWP = 0
	wrpr	%g5,0,%cansave	    !    CANSAVE = maxwin-3
	wrpr	%g0,1,%canrestore   ! CANRESTORE = 1
	wrpr	%g4,0,%cleanwin	    !   CLEANWIN = maxwin
	wrpr	%g0,0,%otherwin	    !   OTHERWIN = 0
	wrpr	%g0,0,%wstate
	ta	T_CHANGE_NONPRIV  
	add	%g0,TRAP_NOT_TAKEN,%g6
	add	%g0,FINISH_RETRY,%g7
flush2:
	flushw
	add	%i3,1,%i3
    	cmp	%g6,TRAP_TAKEN
	be	flush2_ok
	nop
	ta	T_BAD_TRAP
	nop
	nop
flush2_ok:

    	!!*********************************************************************
	!! flush3:   flush with NWINDOWS-2<>CANSAVE, should take a spill trap
    	!!*********************************************************************
	sub	%g4,3,%g5
    	ta	T_CHANGE_PRIV
	wrpr	%g0,0,%cwp	    !        CWP = 0
	wrpr	%g5,0,%cansave	    !    CANSAVE = maxwin-3
	wrpr	%g0,1,%canrestore   ! CANRESTORE = 1
	wrpr	%g4,0,%cleanwin	    !   CLEANWIN = maxwin
	wrpr	%g0,1,%otherwin	    !   OTHERWIN = 1
	wrpr	%g0,0,%wstate
	ta	T_CHANGE_NONPRIV  
	add	%g0,TRAP_NOT_TAKEN,%g6
	add	%g0,FINISH_RETRY,%g7
flush3:
	flushw
	add	%i3,1,%i3
    	cmp	%g6,TRAP_TAKEN
	be	flush3_ok
	nop
	ta	T_BAD_TRAP
	nop
	nop
flush3_ok:

    	!!*********************************************************************
	!! flush4:   flush with NWINDOWS-2<>CANSAVE, should take a spill trap
    	!!*********************************************************************
    	ta	T_CHANGE_PRIV
	wrpr	%g4,0,%cwp	    !        CWP = maxwin
	wrpr	%g0,4,%cansave	    !    CANSAVE = 4
	wrpr	%g0,1,%canrestore   ! CANRESTORE = 1
	wrpr	%g4,0,%cleanwin	    !   CLEANWIN = maxwin
	wrpr	%g0,0,%otherwin	    !   OTHERWIN = 0
	wrpr	%g0,0,%wstate
	ta	T_CHANGE_NONPRIV  
	add	%g0,TRAP_NOT_TAKEN,%g6
	add	%g0,FINISH_RETRY,%g7
flush4:
	flushw
	add	%i3,1,%i3
    	cmp	%g6,TRAP_TAKEN
	be	flush4_ok
	nop
	ta	T_BAD_TRAP
	nop
	nop
flush4_ok:


good_end:   
	ta	T_GOOD_TRAP
	nop
	nop

    
!==========================    
.data
.align 0x1fff+1

max_win: .word	0, 0
    
    
      
    
    
/***********************************************************************/   

SECTION .CUST_TRAPS         TEXT_VA=0x40000000, DATA_VA=0x41000000

attr_text {
	Name = .CUST_TRAPS,
	RA = 0x40000000,
	PA = ra2pa(0x40000000,0),
	part_0_i_ctx_zero_ps0_tsb,
	TTE_G=1,       TTE_Context=0, TTE_V=1,    TTE_Size=0, TTE_NFO=0, TTE_IE=0, 
	TTE_Soft2=0,   TTE_Diag=0,    TTE_Soft=0, TTE_L=0,    TTE_CP=1,  TTE_CV=0, 
	TTE_E=0,      TTE_P=1,        TTE_W=1
	}
attr_data {
	Name = .CUST_TRAPS,	
	RA = 0x4100000,
	PA = ra2pa(0x41000000,0),
	part_0_d_ctx_zero_ps0_tsb,
	TTE_G=1,       TTE_Context=0, TTE_V=1,    TTE_Size=0, TTE_NFO=0, TTE_IE=0, 
	TTE_Soft2=0,   TTE_Diag=0,    TTE_Soft=0, TTE_L=0,    TTE_CP=1,  TTE_CV=0, 
	TTE_E=0,      TTE_P=1,        TTE_W=1
	}

.text
    
! User %g7 is a parameter. if %g7=FINISH_DONE, use done, else use retry
! trap_clean DOES NOT modify the user %g6
.global trap_clean
trap_clean:
	saved
	wrpr	%g0,0,%gl	    ! go back to GL=0, user global regs
	cmp	%g7,FINISH_DONE
	be	clean_done
	nop
	wrpr	%g0,1,%gl	    ! restore trap global regs
	add	%g6,1,%g6	    ! cleanwin++
	wrpr	%g6,0,%cleanwin
	retry
	nop
clean_done: 
	done
	nop

    
! User %g7 is a parameter. if %g7=FINISH_DONE, use done, else use retry
! User %g6 lets test loop know that the trap was hit.        
.global trap_spill
trap_spill:
	saved
	wrpr	%g0,0,%gl	    ! go back to GL=0
	add	%g0,TRAP_TAKEN,%g6
    	cmp	%g7,FINISH_DONE
	be	spill_done
	nop
	saved			    ! used by flushw test cases
	retry
	nop
spill_done: 
	done
	nop        

! User %g7 is a parameter. if %g7=FINISH_DONE, use done, else use retry
! User %g6 lets test loop know that the trap was hit.    
.global trap_fill
trap_fill: 
	restored
	wrpr	%g0,0,%gl	    ! go back to GL=0
	add	%g0,TRAP_TAKEN,%g6
    	cmp	%g7,FINISH_DONE
	be	fill_done
	nop
	retry
	nop
fill_done: 
	done
	nop         



.end    
