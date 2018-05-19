// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: bypass_win.s
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

!!------------------------------------------------------------------------------
!!
!!	Test to make sure that computation succeeds when cwp is changed during
!!	a bypass
!!
!!	
!!
!!------------------------------------------------------------------------------

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
main:
        
test_windows:     
!!--------------------------------------------------------------
!!  Check that all windows exist and are accessed correctly by
!!  wrpr %cwp.  Will write value including cwp to outs and locals
!!  Will check outs, ins and locals.  This also puts values
!!  in the registers that can be used for testing correct window
!!  switching later.                        
!!-------------------------------------------------------------- 
        ta T_CHANGE_PRIV
        nop   
                     
        set 0x7, %g1  !! initial CWP value
set_regs:                                              
        wrpr %g1, 0x0, %cwp
        sll %g1, 0x5, %g2

        !! Set outs and locals        
        add %g2, 0x1, %l0
        add %g2, 0x2, %l1
        add %g2, 0x3, %l2
        add %g2, 0x4, %l3
        add %g2, 0x5, %l4
        add %g2, 0x6, %l5
        add %g2, 0x7, %l6
        add %g2, 0x8, %l7
        add %g2, 0x9, %o0
        add %g2, 0xa, %o1
        add %g2, 0xb, %o2
        add %g2, 0xc, %o3
        add %g2, 0xd, %o4
        add %g2, 0xe, %o5
        add %g2, 0xf, %o6
        add %g2, 0x0, %o7
       
        sub %g1, 0x1, %g1
        brgez %g1, set_regs
        nop

	set 0x7, %g1
test_bypass:	
	wrpr %g1, 0x0, %cwp	

	add %g1, 0x1, %g2

	/* mul-> add gives 3-cycle (wb->E) bypass path */
	
	umul %l0, %l1, %o0
	add %o0, %o0, %o0
	umul %l1, %l2, %o1
	add %o1, %o1, %o1
	umul %l2, %l3, %o2
	add %o2, %o2, %o2
	umul %l3, %l0, %o3
	add %o3, %o3, %o3

	/* set o4-07 to be the same things as o0-o3, except add cwp
	nonsense in the middle to complicate things */
	
	umul %l0, %l1, %o4
	wrpr %g2, 0x0, %cwp   /* switch to next, outs become ins */
	add %i4, %i4, %i4
	wrpr %g1, 0x0, %cwp   /* switch back */
	umul %l1, %l2, %o5
	wrpr %g2, 0x0, %cwp
	add %i5, %i5, %i5
	wrpr %g1, 0x0, %cwp
	umul %l2, %l3, %o6
	wrpr %g2, 0x0, %cwp
	add %i6, %i6, %i6
	wrpr %g1, 0x0, %cwp
	umul %l3, %l0, %o7
	wrpr %g2, 0x0, %cwp
	add %i7, %i7, %i7
	wrpr %g1, 0x0, %cwp

	/* check that computed results are the same */
	
	sub %o4, %o0, %g3
	brnz %g3, diag_fail
	nop

	sub %o5, %o1, %g3
	brnz %g3, diag_fail
	nop

	sub %o6, %o2, %g3
	brnz %g3, diag_fail
	nop

	sub %o7, %o3, %g3
	brnz %g3, diag_fail
	nop
	
	sub %g1, 0x1, %g1
	brgez %g1, test_bypass
	nop
	

	
	ba diag_pass
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

SECTION .USER_TRAP_FOR_SUP TEXT_VA=0x3006000, DATA_VA=0x3008000
attr_text {
        Name = .USER_TRAP_FOR_SUP,
        RA=0x3006000,
        PA=0x3006000,
        part_0_i_ctx_zero_ps0_tsb,
        TTE_G=0, TTE_Context=0, TTE_V=1, TTE_Size=0x0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=1, TTE_CV=0, TTE_E=0, TTE_P=1, TTE_W=0
        }
attr_data {
        Name = .USER_TRAP_FOR_SUP,
        RA=0x3008000,
        PA=0x3008000,
        part_0_d_ctx_nonzero_ps0_tsb,
        part_0_d_ctx_zero_ps0_tsb,
        TTE_G=0, TTE_Context=0, TTE_V=1, TTE_Size=0x0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=1, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=1
        }

.global misalign_sum3
.global nop_spill_trap_handler   
.global flush_spill_trap_handler   
.global nop_fill_trap_handler
.global save_clean_window_handler           
.global sam_test_wmg
.global wmg_test_regs
.global test_cleanwin


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
