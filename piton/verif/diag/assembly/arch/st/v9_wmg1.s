// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: v9_wmg1.s
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
!!	This file has the micro-code to test out the window management of V9 core.
!!
!!-------------------------------------------------------------------------------

#define MAIN_PAGE_NUCLEUS_ALSO
#define	H_T0_Window_Spill_0_Normal_Trap	nop_spill_trap_handler
#define	H_T0_Window_Spill_1_Normal_Trap	nop_spill_trap_handler
#define	H_T0_Window_Spill_2_Normal_Trap	nop_spill_trap_handler
#define	H_T0_Window_Spill_3_Normal_Trap	nop_spill_trap_handler
#define	H_T0_Window_Spill_4_Normal_Trap	nop_spill_trap_handler
#define	H_T0_Window_Spill_5_Normal_Trap	nop_spill_trap_handler
#define	H_T0_Window_Spill_6_Normal_Trap	nop_spill_trap_handler
#define	H_T0_Window_Spill_7_Normal_Trap	flush_spill_trap_handler
#define	H_T0_Window_Spill_0_Other_Trap	nop_spill_trap_handler
#define	H_T0_Window_Spill_1_Other_Trap	nop_spill_trap_handler
#define	H_T0_Window_Spill_2_Other_Trap	nop_spill_trap_handler
#define	H_T0_Window_Spill_3_Other_Trap	nop_spill_trap_handler
#define	H_T0_Window_Spill_4_Other_Trap	nop_spill_trap_handler
#define	H_T0_Window_Spill_5_Other_Trap	nop_spill_trap_handler
#define	H_T0_Window_Spill_6_Other_Trap	nop_spill_trap_handler
#define	H_T0_Window_Spill_7_Other_Trap	nop_spill_trap_handler
#define	H_T0_Window_Fill_0_Normal_Trap	nop_fill_trap_handler
#define	H_T0_Window_Fill_1_Normal_Trap	nop_fill_trap_handler
#define	H_T0_Window_Fill_2_Normal_Trap	nop_fill_trap_handler
#define	H_T0_Window_Fill_3_Normal_Trap	nop_fill_trap_handler
#define	H_T0_Window_Fill_4_Normal_Trap	nop_fill_trap_handler
#define	H_T0_Window_Fill_5_Normal_Trap	nop_fill_trap_handler
#define	H_T0_Window_Fill_6_Normal_Trap	nop_fill_trap_handler
#define	H_T0_Window_Fill_7_Normal_Trap	nop_fill_trap_handler
#define	H_T0_Window_Fill_0_Other_Trap	nop_fill_trap_handler
#define	H_T0_Window_Fill_1_Other_Trap	nop_fill_trap_handler
#define	H_T0_Window_Fill_2_Other_Trap	nop_fill_trap_handler
#define	H_T0_Window_Fill_3_Other_Trap	nop_fill_trap_handler
#define	H_T0_Window_Fill_4_Other_Trap	nop_fill_trap_handler
#define	H_T0_Window_Fill_5_Other_Trap	nop_fill_trap_handler
#define	H_T0_Window_Fill_6_Other_Trap	nop_fill_trap_handler
#define	H_T0_Window_Fill_7_Other_Trap	nop_fill_trap_handler
#define H_T0_Clean_Window save_clean_window_handler	
#include "boot.s"

.text
.global main
.global misalign_sum3
.global nop_spill_trap_handler   
.global flush_spill_trap_handler   
.global nop_fill_trap_handler
.global save_clean_window_handler           
.global sam_test_wmg
.global wmg_test_regs
.global test_cleanwin

main:
	ta	T_CHANGE_PRIV        
	nop
/*
 ********************************************************************
        Test saved and restored for all combinations of cansave, canrestore
        otherwin.
 *********************************************************************        
 */

        set 0x6, %g1 !! cansave
        set 0x6, %g2 !! canrestore
        set 0x6, %g3 !! cleanwin
        set 0x6, %g4 !! otherwin

test_saved:     
        wrpr %g1, 0x0, %cansave
        wrpr %g2, 0x0, %canrestore
        wrpr %g3, 0x0, %cleanwin
        wrpr %g4, 0x0, %otherwin
        saved
        rdpr %cansave, %l1
        rdpr %canrestore, %l2
        rdpr %cleanwin, %l3
        rdpr %otherwin, %l4
test_restored:                  
        wrpr %g1, 0x0, %cansave
        wrpr %g2, 0x0, %canrestore
        wrpr %g3, 0x0, %cleanwin
        wrpr %g4, 0x0, %otherwin
        restored
        rdpr %cansave, %l1
        rdpr %canrestore, %l2
        rdpr %cleanwin, %l3
        rdpr %otherwin, %l4

!! loop until all 4 reach zero         
        brgz %g1, test_saved
        sub %g1, 0x1, %g1

        set 0x6, %g1
        brgz %g2, test_saved
        sub %g2, 0x1, %g2       

        set 0x6, %g2
        brgz %g3, test_saved
        sub %g3, 0x1, %g3       

        set 0x6, %g3
        brgz %g4, test_saved
        sub %g4, 0x1, %g4 
              
        ta T_CHANGE_NONPRIV
        nop   
               
test_end:
	ba	diag_pass
	nop

/*
 *********************************************	
 *	Test the Register Window registers
 *********************************************	
 */
wmg_test_regs:
	brnz	%g7,	check_inregs
	nop

	add	%g6,	%g0,	%g3	/* g3 keep the orig cwp */
	add	%g7,	0x1,	%g7	/* g7 : flag , 1 : not the starting window */
	/*
	 * if is the starting window 
	 */
	ba	set_outregs
	nop

check_inregs:
	/* 
	 * Shift the prev CWP 4 bits left so that 
	 * for each window, in-reg value is differnt.
	 */
	sub	%g6,	0x1,	%l0
	sll	%l0,	0x4,	%l0

	add	%l0,	0x0,	%l1
	sub	%i0,	%l1,	%l2
	brnz,a	%l2,	diag_fail	
	set	0xffff00a0,	%l1

	add	%l0,	0x1,	%l1
	sub	%i1,	%l1,	%l2
	brnz,a	%l2,	diag_fail	
	set	0xffff00a0,	%l1

	add	%l0,	0x2,	%l1
	sub	%i2,	%l1,	%l2
	brnz,a	%l2,	diag_fail	
	set	0xffff00a0,	%l1

	add	%l0,	0x3,	%l1
	sub	%i3,	%l1,	%l2
	brnz,a	%l2,	diag_fail	
	set	0xffff00a0,	%l1

	add	%l0,	0x4,	%l1
	sub	%i4,	%l1,	%l2
	brnz,a	%l2,	diag_fail	
	set	0xffff00a0,	%l1

	add	%l0,	0x5,	%l1
	sub	%i5,	%l1,	%l2
	brnz,a	%l2,	diag_fail	
	set	0xffff00a0,	%l1

set_outregs:
        sll %g6, 0x5, %l0
        add %l0, 0x1, %l0
        add %l0, 0x2, %l1
        add %l0, 0x3, %l2
        add %l0, 0x4, %l3
        add %l0, 0x5, %l4
        add %l0, 0x6, %l5
        add %l0, 0x7, %l6
        add %l0, 0x8, %l7
	sll	%g6,	0x4,	%l0
	add	%l0,	0x0,	%o0
	add	%l0,	0x1,	%o1
	add	%l0,	0x2,	%o2
	add	%l0,	0x3,	%o3
	add	%l0,	0x4,	%o4
	add	%l0,	0x5,	%o5
	/* o6 = sp , o7 = return addr */

	brz	%g4,	regchk_restore
	nop

        save %o0, %o1, %l0   /* cwp = cwp + 1 */
        nop

        sub     %g4,    0x1,    %g4
        add     %g5,    0x1,    %g5
        add     %g6,    0x1,    %g6

	ba	wmg_test_regs
	nop

regchk_restore: 
        restore %o5, %o5, %l3
        nop
        add %g4, 0x1, %g4
        sub %g5, 0x1, %g5 
        sub %g6, 0x1, %g6
        
!! Check outs             
	/* 
	 * Shift the CWP 4 bits left so that 
	 * for each window, in-reg value is differnt.
	 */
	sub	%g6,	0x1,	%l0
	sll	%g6,	0x4,	%l0

	add	%l0,	0x0,	%l1
	sub	%o0,	%l1,	%l2
	brnz,a	%l2,	diag_fail	
	set	0xffff00a0,	%l1

	add	%l0,	0x1,	%l1
	sub	%o1,	%l1,	%l2
	brnz,a	%l2,	diag_fail	
	set	0xffff00a0,	%l1

	add	%l0,	0x2,	%l1
	sub	%o2,	%l1,	%l2
	brnz,a	%l2,	diag_fail	
	set	0xffff00a0,	%l1

	add	%l0,	0x3,	%l1
	sub	%o3,	%l1,	%l2
	brnz,a	%l2,	diag_fail	
	set	0xffff00a0,	%l1

	add	%l0,	0x4,	%l1
	sub	%o4,	%l1,	%l2
	brnz,a	%l2,	diag_fail	
	set	0xffff00a0,	%l1

	add	%l0,	0x5,	%l1
	sub	%o5,	%l1,	%l2
	brnz,a	%l2,	diag_fail	
	set	0xffff00a0,	%l1

!! Check locals        
        add %l0, 0x1, %l0
        add %l1, 0x1, %l1
        add %l2, 0x1, %l2
        add %l3, 0x1, %l3
        add %l4, 0x1, %l4
        add %l5, 0x1, %l5
        add %l6, 0x1, %l6
        add %l7, 0x1, %l7

!! Check ins
	add	%l0,	0x0,	%l1
	sub	%i0,	%l1,	%l2
	sub	%i1,	%l1,	%l2
	sub	%i2,	%l1,	%l2
	sub	%i3,	%l1,	%l2
	sub	%i4,	%l1,	%l2
	sub	%i5,	%l1,	%l2

        !! Done when canrestore hits zero
        brnz %g5, regchk_restore
        nop
                
regchk_done:
        ta      T_CHANGE_PRIV
        nop
	
	wrpr	%g3,	0x0,	%cwp
	nop

        /* go back to User mode */
        ta      T_CHANGE_NONPRIV
        nop

	retl
	nop

/*
 *********************************************	
 *	Test the Register Window Parameters 
 *********************************************	
 */
sam_test_wmg:
	set	0x55aa,	%l0
wmg_save:
	save		/* cwp = 0 + 1 = 1 */
	nop
	sub	%g4,	0x1,	%g4
	add	%g5,	0x1,	%g5
	add	%g6,	0x1,	%g6

	set	0x8,	%l0
	subcc	%g6,	%l0,	%l1

	bge	over_rst_g6
	nop

	ba	chk_store_cwp
	nop

over_rst_g6:
	sub	%g6,	0x8,	%g6

chk_store_cwp:
        ta      T_CHANGE_PRIV
        nop

	rdpr	%cwp,	%l0	
	nop
	sub	%g6,	%l0,	%l2
	brnz,a	%l2,	diag_fail
	set	0xffffaaa1,	%l1

	rdpr	%cansave, %l0
	nop
	sub	%g4,	%l0,	%l2
	brnz,a	%l2,	diag_fail
	set	0xffffaaa2,	%l1

	rdpr	%canrestore, %l0
	nop
	sub	%g5,	%l0,	%l2
	brnz,a	%l2,	diag_fail
	set	0xffffaaa3,	%l1

        /* go back to User mode */
        ta      T_CHANGE_NONPRIV
        nop

	brnz	%g4,	wmg_save
	nop
  !! Cansave == 0 so next save will trap
        save %g4, %g5, %g6  
        mov %g6, %g6 !! shouldn't have changed

wmg_restore:
!!--------------------------
!!	RESTORE now 	
!!--------------------------
	restore		/* cwp = cwp - 1 */
	nop
	add	%g4,	0x1,	%g4
	sub	%g5,	0x1,	%g5

	subcc	%g6,	0x1,	%g6
	bl	below_rst_g6	
	nop

	ba	chk_rsto_cwp
	nop

below_rst_g6:
	add	%g6,	0x8,	%g6

chk_rsto_cwp:
        ta      T_CHANGE_PRIV
        nop

	rdpr	%cwp,	%l0	
	nop
	sub	%g6,	%l0,	%l2
	brnz,a	%l2,	diag_fail
	set	0xffffbbb1,	%l1

	rdpr	%cansave, %l0
	nop
	sub	%g4,	%l0,	%l2
	brnz,a	%l2,	diag_fail
	set	0xffffbbb2,	%l1

	rdpr	%canrestore, %l0
	nop
	sub	%g5,	%l0,	%l2
	brnz,a	%l2,	diag_fail
	set	0xffffbbb3,	%l1

        /* go back to User mode */
        ta      T_CHANGE_NONPRIV
        nop

	brnz	%g5,	wmg_restore
	nop
        !! %canrestore == 0 so should trap
        restore %g4, %g5, %g6
        mov %g6, %g6

wmg_done:
	retl	/* equal to : jmpl [%o7 + 8], %g0 */
	nop

/*
 ********************************
 *      Diag PASSED !           *
 ********************************
 */
diag_pass:
        set     0xaaddcafe,     %l0
good_trap:              
        ta T_GOOD_TRAP
        nop

/*
 ********************************
 *      Diag FAILED !           *
 ********************************
 */
diag_fail:
        set     0xdeadcafe,     %l0
bad_trap:               
        ta T_BAD_TRAP
        nop
        nop

misalign_sum3:
        save    %sp,    -96,    %sp
        add     %i0,    %i1,    %l7
        add     %l7,    %i2,    %l7

        set     0x34,   %o0	/* mem addr misaligned */
        ta      T_TRAP_EN
        nop
	return	%i7+1	/* misaligned addr return */
        nop
        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0004,     %l1

	return 	%i7+8	/* good return */ 
	nop


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
        rdpr %cansave, %l0
        rdpr %canrestore, %l1
        rdpr %otherwin, %l2
        rdpr %cleanwin, %l3
        rdpr %wstate, %l4
        rdpr %cwp, %l5
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
                            
.data

wmg_parameter:	
	.word	0x00000000	/* cwp */
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000

.end
