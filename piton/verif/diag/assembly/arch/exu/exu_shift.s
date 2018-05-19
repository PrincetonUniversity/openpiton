// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: exu_shift.s
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
 * Name:    exu_shift.s
 * Date:    April 21, 2003
 *
 *  Description: Execute all six shift ops with interesting data patterns in 
 *	multiple threads.
 *
 *  This test depends on SAS for result checking.    
 *
 **********************************************************************/

! be sure to update when adding cases...
#define NUM_REG_CASES   2
#define NUM_IMMED_CASES 3    
   

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
	!**************************
	! Operand2 as a register 
	!**************************
	set	rs1_data,%g1
	add	%g0,NUM_REG_CASES,%l0		
	wr	%g0,0xff,%ccr	    ! ccr set to ff. Should remain unchanged.

rs1_loop:
	ldx	[%g1],%l1
	add	%g0,65,%l2	    ! rs2 starts as 65
rs2_loop:   				    
	sll	%l1,%l2,%l3	    
	srl	%l1,%l2,%l3	    
	sra	%l1,%l2,%l3	    
	sllx	%l1,%l2,%l3	    
	srlx	%l1,%l2,%l3	    
	srax	%l1,%l2,%l3	    

	sub	%l2,0x1,%l2
	brgez,pt %l2,rs2_loop	    ! loop rs2 down to 0, inclusive
	nop
    
	! use rs1 value as the shift value just to put interesting things in
	! the upper bits of rs2.
	ldx	[%g1],%l2
	sll	%l1,%l2,%l3	    
	srl	%l1,%l2,%l3	    
	sra	%l1,%l2,%l3	    
	sllx	%l1,%l2,%l3	    
	srlx	%l1,%l2,%l3	    
	srax	%l1,%l2,%l3
    			    
	sub	%l0,1,%l0	    ! next rs1 value
	brnz,pt %l0,rs1_loop
	add	%g1,8,%g1	    ! move operand pointer

	!**************************
	! Operand2 as immediate 
	!**************************    
       
	set	immed_data,%g1
	add	%g0,NUM_IMMED_CASES,%l0
immed_loop:
	ldx	[%g1],%l1		
				   
	sll	%l1,0,%l3	    
	srl	%l1,0,%l3	    
	sra	%l1,0,%l3	    
	sllx	%l1,0,%l3	    
	srlx	%l1,0,%l3	    
	srax	%l1,0,%l3

    	sll	%l1,1,%l3	    
	srl	%l1,1,%l3	    
	sra	%l1,1,%l3	    
	sllx	%l1,1,%l3	    
	srlx	%l1,1,%l3	    
	srax	%l1,1,%l3

    	sll	%l1,2,%l3	    
	srl	%l1,2,%l3	    
	sra	%l1,2,%l3	    
	sllx	%l1,2,%l3	    
	srlx	%l1,2,%l3	    
	srax	%l1,2,%l3

    	sll	%l1,31,%l3	    
	srl	%l1,31,%l3	    
	sra	%l1,31,%l3	    
	sllx	%l1,31,%l3	    
	srlx	%l1,31,%l3	    
	srax	%l1,31,%l3     
    
	sllx	%l1,32,%l3	    
	srlx	%l1,32,%l3	    
	srax	%l1,32,%l3
    
	sllx	%l1,63,%l3	    
	srlx	%l1,63,%l3	    
	srax	%l1,63,%l3
    
    	sub	%l0,0x1,%l0
	brnz,pt	%l0,immed_loop
	add	%g1,8,%g1	    ! move operand pointer   

good_end:   
	ta	T_GOOD_TRAP
	nop
	nop    


!==========================    
.data
.align 0x1fff+1

.global tsdata
rs1_data:                   
        .word 0x80000001, 0x80000001
	.word 0x55555555, 0x55555555
 

.global immed_data
immed_data: 
        .word 0x00000000, 0x00000001
	.word 0x33333333, 0x70000000
	.word 0xaaaaaaaa, 0xaaaaaaaa    

.end
