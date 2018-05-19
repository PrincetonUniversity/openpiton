// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: tr_tcc.s
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
 * Name:    tr_tcc.s
 * Date:    August 15, 2003
 *
 *
 *  Description: Execute trap instruction with all condition code values, 
 *	use xcc and icc, check Niagara-only bit 7 of trap number in user
 *	and privileged modes.
 *
 *  This test depends on SAS for result checking.    
 *
 **********************************************************************/

! be sure to update when adding cases...
#define NUM_CCR		8
#define NUM_TRAP_CODES  3    

#define H_HT0_Illegal_instruction_0x10
#define My_HT0_Illegal_instruction_0x10 \
	done			; \
	nop; nop; nop; nop; nop; nop; nop;

#define H_T0_Trap_Instruction_0
#define My_T0_Trap_Instruction_0 \
	done			; \
	nop; nop; nop; nop; nop; nop; nop;

#define H_T0_Trap_Instruction_1
#define My_T0_Trap_Instruction_1 \
	done			; \
	nop; nop; nop; nop; nop; nop; nop;

#define H_T0_Trap_Instruction_0x190
#define My_T0_Trap_Instruction_0x190 \
	done			; \
	nop; nop; nop; nop; nop; nop; nop;

        
#define H_HT0_Trap_Instruction_0
#define My_HT0_Trap_Instruction_0 \
	done			; \
	nop; nop; nop; nop; nop; nop; nop;

    
#define H_HT0_Trap_Instruction_1
#define My_HT0_Trap_Instruction_1 \
	done			; \
	nop; nop; nop; nop; nop; nop; nop;

#define H_HT0_HTrap_Instruction_0
#define My_HT0_HTrap_Instruction_0 \
	done			; \
	nop; nop; nop; nop; nop; nop; nop;
    
#define  MAIN_PAGE_HV_ALSO 
    
        
/*******************************************************/    
#include "boot.s"

.global main
main:
th_fork(th_main,%l0)		! start up to four threads.
	! All threads do the same thing. No need to run more than one core,
	! and no need to differentiate the threads because nobody stores
	! anything.
th_main_0:    
th_main_1:    
th_main_2:    
th_main_3:    
	set	ccr_data,%g1
	add	%g0,NUM_CCR,%l1
    
ccr_loop:
	set	tcode_data,%g2
	add	%g0,NUM_TRAP_CODES,%l2		
	ldub	[%g1],%l3
	wr	%g0,%l3,%ccr

tcode_loop:
	lduh	[%g2],%l4

#ifdef BUG6262
        sub     %l4, 0x90, %l5
	brz     %l5, super_code
#endif

	ta	%icc, %g0+%l4
	tn	%icc, %g0+%l4
	tne	%icc, %g0+%l4
	te	%icc, %g0+%l4
	tg	%icc, %g0+%l4
	tle	%icc, %g0+%l4
	tge	%icc, %g0+%l4
	tl	%icc, %g0+%l4
	tgu	%icc, %g0+%l4
	tleu	%icc, %g0+%l4
	tcc	%icc, %g0+%l4
	tcs	%icc, %g0+%l4
	tpos	%icc, %g0+%l4
	tneg	%icc, %g0+%l4
	tvc	%icc, %g0+%l4
	tvs	%icc, %g0+%l4

    	ta	%xcc, %g0+%l4
	tn	%xcc, %g0+%l4
	tne	%xcc, %g0+%l4
	te	%xcc, %g0+%l4
	tg	%xcc, %g0+%l4
	tle	%xcc, %g0+%l4
	tge	%xcc, %g0+%l4
	tl	%xcc, %g0+%l4
	tgu	%xcc, %g0+%l4
	tleu	%xcc, %g0+%l4
	tcc	%xcc, %g0+%l4
	tcs	%xcc, %g0+%l4
	tpos	%xcc, %g0+%l4
	tneg	%xcc, %g0+%l4
	tvc	%xcc, %g0+%l4
	tvs	%xcc, %g0+%l4
	
super_code:
	ta	T_CHANGE_PRIV
    	ta	%icc, %g0+%l4
	tn	%icc, %g0+%l4
	tne	%icc, %g0+%l4
	te	%icc, %g0+%l4
	tg	%icc, %g0+%l4
	tle	%icc, %g0+%l4
	tge	%icc, %g0+%l4
	tl	%icc, %g0+%l4
	tgu	%icc, %g0+%l4
	tleu	%icc, %g0+%l4
	tcc	%icc, %g0+%l4
	tcs	%icc, %g0+%l4
	tpos	%icc, %g0+%l4
	tneg	%icc, %g0+%l4
	tvc	%icc, %g0+%l4
	tvs	%icc, %g0+%l4

    	ta	%xcc, %g0+%l4
	tn	%xcc, %g0+%l4
	tne	%xcc, %g0+%l4
	te	%xcc, %g0+%l4
	tg	%xcc, %g0+%l4
	tle	%xcc, %g0+%l4
	tge	%xcc, %g0+%l4
	tl	%xcc, %g0+%l4
	tgu	%xcc, %g0+%l4
	tleu	%xcc, %g0+%l4
	tcc	%xcc, %g0+%l4
	tcs	%xcc, %g0+%l4
	tpos	%xcc, %g0+%l4
	tneg	%xcc, %g0+%l4
	tvc	%xcc, %g0+%l4
	tvs	%xcc, %g0+%l4
	ta	T_CHANGE_NONPRIV

	sub	%l2,0x1,%l2
	brnz	%l2,tcode_loop
	add	%g2,2,%g2	    ! next tcode

	sub	%l1,0x1,%l1
	brnz	%l1,ccr_loop
	add	%g1,1,%g1	    ! next ccr
	
good_end:   
	ta	T_GOOD_TRAP
	nop
	nop    


!==========================    
.data
.align 0x1fff+1

.global tsdata
ccr_data:                   
	.word 0x01234567, 0xf8e9dacb
    
.global tadd_data
tcode_data:  
	.word 0x00300031, 0x00900000


.end
