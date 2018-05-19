// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: flushw_loop.s
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

!!-------------------------------------------------------------------------------
!!
#define H_T0_Window_Spill_0_Normal_Trap nop_spill_trap_handler
#define H_T0_Window_Spill_1_Normal_Trap nop_spill_trap_handler
#define H_T0_Window_Spill_2_Normal_Trap nop_spill_trap_handler
#define H_T0_Window_Spill_3_Normal_Trap nop_spill_trap_handler
#define H_T0_Window_Spill_4_Normal_Trap nop_spill_trap_handler
#define H_T0_Window_Spill_5_Normal_Trap nop_spill_trap_handler
#define H_T0_Window_Spill_6_Normal_Trap nop_spill_trap_handler
#define H_T0_Window_Spill_7_Normal_Trap flush_spill_trap_handler
#define H_T0_Window_Spill_0_Other_Trap  nop_spill_trap_handler
#define H_T0_Window_Spill_1_Other_Trap  nop_spill_trap_handler
#define H_T0_Window_Spill_2_Other_Trap  nop_spill_trap_handler
#define H_T0_Window_Spill_3_Other_Trap  nop_spill_trap_handler
#define H_T0_Window_Spill_4_Other_Trap  nop_spill_trap_handler
#define H_T0_Window_Spill_5_Other_Trap  nop_spill_trap_handler
#define H_T0_Window_Spill_6_Other_Trap  nop_spill_trap_handler
#define H_T0_Window_Spill_7_Other_Trap  nop_spill_trap_handler
#define H_T0_Window_Fill_0_Normal_Trap  nop_fill_trap_handler
#define H_T0_Window_Fill_1_Normal_Trap  nop_fill_trap_handler
#define H_T0_Window_Fill_2_Normal_Trap  nop_fill_trap_handler
#define H_T0_Window_Fill_3_Normal_Trap  nop_fill_trap_handler
#define H_T0_Window_Fill_4_Normal_Trap  nop_fill_trap_handler
#define H_T0_Window_Fill_5_Normal_Trap  nop_fill_trap_handler
#define H_T0_Window_Fill_6_Normal_Trap  nop_fill_trap_handler
#define H_T0_Window_Fill_7_Normal_Trap  nop_fill_trap_handler
#define H_T0_Window_Fill_0_Other_Trap   nop_fill_trap_handler
#define H_T0_Window_Fill_1_Other_Trap   nop_fill_trap_handler
#define H_T0_Window_Fill_2_Other_Trap   nop_fill_trap_handler
#define H_T0_Window_Fill_3_Other_Trap   nop_fill_trap_handler
#define H_T0_Window_Fill_4_Other_Trap   nop_fill_trap_handler
#define H_T0_Window_Fill_5_Other_Trap   nop_fill_trap_handler
#define H_T0_Window_Fill_6_Other_Trap   nop_fill_trap_handler
#define H_T0_Window_Fill_7_Other_Trap   nop_fill_trap_handler
#define H_T0_Clean_Window save_clean_window_handler     
#include "boot.s"

.global main

.text

main: 

        ta T_CHANGE_PRIV
        nop

        wrpr %g0, 0x7, %cwp
	mov 40, %g7
        wrpr %g0, 0x7, %wstate
        wrpr %g0, 0x7, %cleanwin
        wrpr %g0, 0x0, %cansave 
        wrpr %g0, 0x0, %otherwin

flushw_loop:	 
        wrpr %g0, 0x0, %cansave 
        wrpr %g0, 0x6, %canrestore
flushw:		
        flushw
	brnz,pt %g7, flushw_loop
	deccc %g7
	
pass:
        ta              T_GOOD_TRAP

fail:
        ta              T_BAD_TRAP


SECTION .USER_TRAP_FOR_SUP TEXT_VA=0x20008000
attr_text {
        Name = .USER_TRAP_FOR_SUP,
        RA=0x20008000,
        PA=ra2pa(0x20008000,0),
        part_0_i_ctx_zero_ps0_tsb,
        TTE_G=1, TTE_Context=0, TTE_V=1, TTE_Size=0x0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=1, TTE_CV=0, TTE_E=0, TTE_P=1, TTE_W=0
        }

.global nop_spill_trap_handler   
.global flush_spill_trap_handler   
.global nop_fill_trap_handler
.global save_clean_window_handler           

        /* This will just check that all the values are correct
         * and set the cwp to the location of the spill */
nop_spill_trap_handler: 
        rdpr %cansave, %l0
        rdpr %canrestore, %l1
        rdpr %otherwin, %l2
        rdpr %cleanwin, %l3
        rdpr %wstate, %l4
        rdpr %cwp, %l5 
        done
        nop     
        /* This will just check that all the values are correct
         * and set the cwp to the location of the fill */
nop_fill_trap_handler: 
        rdpr %cansave, %l0
        rdpr %canrestore, %l1
        rdpr %otherwin, %l2
        rdpr %cleanwin, %l3
        rdpr %wstate, %l4
        rdpr %cwp, %l5 
        done
        nop 


        /*
         * This will handle a spill with a retry.  Used to test flushw
         */
flush_spill_trap_handler:       
!        rdpr %cansave, %l0
!        rdpr %canrestore, %l1
!        rdpr %otherwin, %l2
!        rdpr %cleanwin, %l3
!        rdpr %wstate, %l4
!        rdpr %cwp, %l5
        saved
        retry
        nop  
 
        /* This will set cleanwin to 7 so a retry
         * will cause a save */
save_clean_window_handler:                           
        rdpr %cansave, %l0
        rdpr %canrestore, %l1
        rdpr %otherwin, %l2
        rdpr %cleanwin, %l3
        rdpr %wstate, %l4
        rdpr %cwp, %l5
        wrpr %g0, 0x7, %cleanwin
        retry
        nop
