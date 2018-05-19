// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: bug3083.s
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
 * Name:    exu_add.s
 * Date:    April 17, 2003
 *
 *
 *  Description: Execute Add, Addc, Addcc, Addccc, Taddcc, and Taddcctv
 *	with interesting data patterns in multiple threads.
 *
 *  This test depends on SAS for result checking.    
 *
 **********************************************************************/

! be sure to update when adding cases...
#define NUM_REG_CASES  17
#define NUM_IMMED_CASES 5    

! for taddcctv cases
#define H_T0_Tag_Overflow
#define My_T0_Tag_Overflow \
rdpr	%tstate, %i1; \
rdpr	%tt, %i1; \
rdpr	%tpc, %i0; \
rdpr	%tnpc, %i1; \
done; \
nop;    

/*******************************************************/
#define THREAD_COUNT 4
#include "boot.s"

.global main
main:
th_fork(th_main)		! start up to four threads.
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
	set	rs2_data,%g1
	add	%g0,NUM_REG_CASES,%l3		
rs2_loop:
	ldx	[%g1],%l1
	ldx	[%g1+8],%l2

				    ! ccr clear
	wr	%g0,%g0,%ccr	  
	add	%l1,%l2,%l4

    	wr	%g0,%g0,%ccr	    
	addc	%l1,%l2,%l5	    
    				    
    	wr	%g0,%g0,%ccr	    
	addcc	%l1,%l2,%l6	    
				    
    	wr	%g0,%g0,%ccr	    
	addccc	%l1,%l2,%l7	    
    				    
    	wr	%g0,%g0,%ccr	    
	taddcc	%l1,%l2,%l0
    				    
    	wr	%g0,%g0,%ccr	    
	taddcctv %l1,%l2,%l4    	    
				    
				    ! icc.c set		    
	wr	%g0,0x1,%ccr	    
	add	%l1,%l2,%l6	    
				    
       	wr	%g0,0x1,%ccr	    
	addc	%l1,%l2,%l7	    
				    
	wr	%g0,0x1,%ccr	    
	addcc	%l1,%l2,%l0	    
				    
	wr	%g0,0x1,%ccr	    
	addccc	%l1,%l2,%l4	    
				    
	wr	%g0,0x1,%ccr	    
	taddcc	%l1,%l2,%l5
    				    
	wr	%g0,0x1,%ccr	    
	taddcctv %l1,%l2,%l6

				    ! icc.c clear, xcc.c set		    
	wr	%g0,0x10,%ccr	    
	add	%l1,%l2,%l0	    
				    
       	wr	%g0,0x10,%ccr	    
	addc	%l1,%l2,%l7	    
				    
	wr	%g0,0x10,%ccr	    
	addcc	%l1,%l2,%l6	    
				    
	wr	%g0,0x10,%ccr	    
	addccc	%l1,%l2,%l5	    
				    
	wr	%g0,0x10,%ccr	    
	taddcc	%l1,%l2,%l4
    				    
	wr	%g0,0x10,%ccr	    
	taddcctv %l1,%l2,%l0
    
				    ! icc.c set, xcc.c set		    
	wr	%g0,0x11,%ccr	    
	add	%l1,%l2,%l4	    
				    
       	wr	%g0,0x11,%ccr	    
	addc	%l1,%l2,%l6	    
				    
	wr	%g0,0x11,%ccr	    
	addcc	%l1,%l2,%l0	    
				    
	wr	%g0,0x11,%ccr	    
	addccc	%l1,%l2,%l5	    
				    
	wr	%g0,0x11,%ccr	    
	taddcc	%l1,%l2,%l7
				    
	wr	%g0,0x11,%ccr	    
	taddcctv %l1,%l2,%l6                

	sub	%l3,0x1,%l3
	brnz,pt	%l3,rs2_loop
	add	%g1,0x10,%g1	    ! move operand pointer

	!**************************
	! Operand2 as immediate 
	!**************************    
				    ! hit a all cases of taddcc bits 1:0
	set	tadd_data,%g1
	add	%g0,4,%l3
tadd_loop:
	ldx	[%g1],%l1
	
	taddcc	%l1,0x0,%l2
	taddcc	%l1,0x1,%l2
	taddcc	%l1,0x2,%l2
	taddcc	%l1,0x3,%l2
    
	taddcctv %l1,0x0,%l2
	taddcctv %l1,0x1,%l2
	taddcctv %l1,0x2,%l2
	taddcctv %l1,0x3,%l2        
    
	sub	%l3,0x1,%l3
	brnz,pt	%l3,tadd_loop
	add	%g1,8,%g1	    ! move operand pointer   
    
       
	set	immed_data,%g1
	add	%g0,NUM_IMMED_CASES,%l3
immed_loop:
	ldx	[%g1],%l1		
				    ! ccr clear, immed = 0
	wr	%g0,%g0,%ccr	  
	add	%l1,0,%l4

    	wr	%g0,%g0,%ccr	    
	addc	%l1,0,%l5	    
    				    
    	wr	%g0,%g0,%ccr	    
	addcc	%l1,0,%l6	    
				    
    	wr	%g0,%g0,%ccr	    
	addccc	%l1,0,%l7	    
    				    
    	wr	%g0,%g0,%ccr	    
	taddcc	%l1,0,%l0
    				    
    	wr	%g0,%g0,%ccr	    
	taddcctv %l1,0,%l4

    				    ! ccr clear, immed = fff (max positive)
	wr	%g0,%g0,%ccr	  
	add	%l1,0xfff,%l4

    	wr	%g0,%g0,%ccr	    
	addc	%l1,0xfff,%l5	    
    				    
    	wr	%g0,%g0,%ccr	    
	addcc	%l1,0xfff,%l6	    
				    
    	wr	%g0,%g0,%ccr	    
	addccc	%l1,0xfff,%l7	    
    				    
    	wr	%g0,%g0,%ccr	    
	taddcc	%l1,0xfff,%l0
    				    
    	wr	%g0,%g0,%ccr	    
	taddcctv %l1,0xfff,%l4

    				    ! ccr clear, immed = 1fff (-1)
	wr	%g0,%g0,%ccr	  
	add	%l1,0x1fff,%l4

    	wr	%g0,%g0,%ccr	    
	addc	%l1,0x1fff,%l5	    
    				    
    	wr	%g0,%g0,%ccr	    
	addcc	%l1,0x1fff,%l6	    
				    
    	wr	%g0,%g0,%ccr	    
	addccc	%l1,0x1fff,%l7	    
    				    
    	wr	%g0,%g0,%ccr	    
	taddcc	%l1,0x1fff,%l0
    				    
    	wr	%g0,%g0,%ccr	    
	taddcctv %l1,0x1fff,%l4

        				    ! ccr set, immed = assorted
	wr	%g0,0x11,%ccr	  
	add	%l1,0x1000,%l4

    	wr	%g0,0x11,%ccr	    
	addc	%l1,0x01ff,%l5	    
    				    
    	wr	%g0,0x11,%ccr	    
	addcc	%l1,0x1234,%l6	    
				    
    	wr	%g0,0x11,%ccr	    
	addccc	%l1,0x1fff,%l7	    
    				    
    	wr	%g0,0x11,%ccr	    
	taddcc	%l1,0x11,%l0
    				    
    	wr	%g0,0x11,%ccr	    
	taddcctv %l1,0x1ffc,%l4    
    
    	sub	%l3,0x1,%l3
	brnz,pt	%l3,immed_loop
	add	%g1,8,%g1	    ! move operand pointer   

good_end:   
	ta	T_GOOD_TRAP
	nop
	nop    


!==========================    
.data
.align 0x1fff+1

.global tsdata
rs2_data:                   
        .word 0x00000000, 0x00000000	! xcc.z, icc.z
        .word 0x00000000, 0x00000000
    
        .word 0x80000000, 0x80000000	! xcc.n, icc.n
        .word 0x00000000, 0x00000000
    
        .word 0x00000000, 0x80000000	! xcc.z, icc.c
	.word 0x00000000, 0x80000000
     
	.word 0x80000000, 0x00000000	! icc.z	
	.word 0x80000000, 0x00000000

	.word 0xaaaaaaaa, 0x22222222	! xcc.n, icc.n
	.word 0x22222222, 0xaaaaaaaa	

	.word 0x44444444, 0xbbbbbbbb	! fun when cc is set for addc/addccc
	.word 0xbbbbbbbb, 0x44444444
       
        .word 0x00000000, 0x7fffffff	! icc.nv
        .word 0x00000000, 0x00000001
    
	.word 0x7fffffff, 0xffffffff	! xcc.n, icc.n
	.word 0x00000000, 0x00000001

	.word 0x7fffffff, 0x00000000	! xcc.nv, icc.z
	.word 0x00000001, 0x00000000
        
        .word 0x00000000, 0xffffffff	! icc.nc
        .word 0x00000000, 0xffffffff
    
        .word 0x00000000, 0xffffffff	! icc.c
        .word 0x00000000, 0x00000001
    
	.word 0xffffffff, 0xffffffff	! xcc.c, icc.c
	.word 0xffffffff, 0xffffffff
    
	.word 0xffffffff, 0xffffffff	! xcc.nz, icc.nz
	.word 0x00000000, 0x00000001
    
	.word 0x11111111, 0x77777777	! icc.nv
	.word 0x12345678, 0x7f777776
        
	.word 0x7f777777, 0x11111111	! xcc.nv
	.word 0x77777770, 0x09abcdfe

	.word 0x87654321, 0x56789abd	! xcc.v for adding negative numbers
	.word 0x96312468, 0x9abcdef1	! icc.n

	.word 0x56789abc, 0x87654320	! xcc.n, icc.v for adding neg numbers
	.word 0x9abcdef1, 0x9631246a

.global tadd_data
tadd_data:  
	.word 0x0, 0xc			! <1:0> = 00
	.word 0x0, 0x1
        .word 0x0, 0xe			! <1:0> = 01
	.word 0x0, 0x3

.global immed_data
immed_data: 
	.word 0x00000000, 0x00000000
	.word 0x00000000, 0x7fffffff
	.word 0x00000000, 0x00000001
	.word 0x7fffffff, 0xffffffff
	.word 0xffffffff, 0xffffffff    
            

.end
