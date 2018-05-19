// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: exu_muldiv.s
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
 * Name:    exu_muldiv.s
 * Date:    April 23, 2003
 *
 *  Description: Execute Mulx, Mulscc, Smul, Smulcc, Umul, Umulcc,
 *	Sdiv, Sdivcc, Sdivx, Udiv, Udivcc, Udivx with interesting data 
 *	patterns in multiple threads. Also play with delay slots and
 *	intermixed mul and div operations.
 *
 *  This test depends on SAS for result checking.    
 *
 **********************************************************************/

! be sure to update when adding cases...
#define NUM_MUL_CASES 6
#define NUM_DIV_CASES 4
#define NUM_IMMED_CASES 5    

! for divide by zero cases
#define H_T0_Division_By_Zero
#define My_T0_Division_By_Zero \
rdpr	%tstate, %i1; \
rdpr	%tt, %i1; \
rdpr	%tpc, %i0; \
rdpr	%tnpc, %i1; \
done; \
nop;    

/*******************************************************/    
#include "boot.s"

.global main
main:
th_fork(th_main,%l0)		! start up to four threads.
	! All threads do the same thing, but with different data patterns. 
	! No need to run more than one core.
th_main_0:
	setx	mul_data_t0,%g7,%g1
    	ba	all_threads1
	nop
    
th_main_1:
    	setx	mul_data_t1,%g7,%g1
	ba	all_threads1
	nop
        
th_main_2:
	setx	mul_data_t2,%g7,%g1
    	ba	all_threads1
	nop
    
th_main_3:
	setx	mul_data_t3,%g7,%g1
	ba	all_threads1
	nop
    
all_threads1:	    
	!*************************************************************
	! Operand2 as a register:    MULX, UMUL, SMUL, UMULcc, SMULcc
	!*************************************************************
	add	%g0,NUM_MUL_CASES,%g2
	mova	%icc,%g1,%g3	    ! keep the multiply operand address handy
			
mul_loop1:
	ldx	[%g1],%l1
	ldx	[%g1+8],%l2
	wr	%g0,%g0,%ccr	    ! ccr clear
    
	mulx	%l1,%l2,%l4
	umul	%l1,%l2,%l5
	rd	%y,%i1		    ! be sure SAS looks at Y-reg
	smul	%l1,%l2,%l6
	rd	%y,%i1

    	wr	%g0,%g0,%ccr	    ! clear ccr	    
	umulcc	%l1,%l2,%l7	    
	rd	%y,%i1
    	wr	%g0,%g0,%ccr	    
	smulcc	%l1,%l2,%l6	    
	rd	%y,%i1

    	wr	%g0,0xff,%ccr	    ! set ccr. Should not matter.	    
	umulcc	%l1,%l2,%l7	    
	rd	%y,%i1
    	wr	%g0,0xff,%ccr	    
	smulcc	%l1,%l2,%l6	    
	rd	%y,%i1    

	sub	%g2,0x1,%g2
	brnz,pt	%g2,mul_loop1
	add	%g1,0x10,%g1	    ! move operand pointer
    
	!**********************************
	! Operand2 as a register:    MULScc
	!**********************************
#ifndef MULSCC_BUGS    
    	mova	%icc,%g3,%g1	    ! same ops as mul_loop1
	add	%g0,NUM_MUL_CASES,%g2		
mulscc_1:
	wr	%g0,%g0,%ccr	    ! ccr clear    
	ldx	[%g1],%l1
	ldx	[%g1+8],%l2
	wr	%l1,0,%y	    ! lower bits of multiplier into Y-reg
	rd	%y,%l0		    ! for sas debug
	srl	%l1,0,%l1	    ! clear rs1 upper
	srl	%l2,0,%l2	    ! clear rs2 upper
	mulx	%l1,%l2,%l4	    ! save for later compare
	add	%g0,0,%l1	    ! clear rs1 (product upper) completely
    
	add	%g0,32,%l3	    ! bit position counter
mulscc_2:   
	sub	%l3,1,%l3
	mulscc	%l1,%l2,%l1
	brgez,pt %l3,mulscc_2  
	nop 

	sllx	%l1,33,%l1	    ! product upper
	rd	%y,%l3		    ! product lower
	or	%l1,%l3,%l3	    ! full product should be equal to mulx
	subcc	%l3,%l4,%l5
	tnz	T_BAD_TRAP
	nop

	sub	%g2,0x1,%g2
	brnz,pt	%g2,mulscc_1
	add	%g1,0x10,%g1	    ! move operand pointer
#endif    

	!****************************************
	! Operand2 as a register:    SDIVX, UDIVX
	!****************************************
	rdth_id			    ! get thid in %o1
	cmp	%o1,0
	be	th_divx_0
	cmp	%o1,1
	be	th_divx_1
	cmp	%o1,2
	be	th_divx_2
	nop
	ba	th_divx_3	    ! if there are more than 4 threads...
	nop
    
th_divx_0:
	setx	divx_data_t0,%g7,%g1
    	ba	all_threads2
	nop
        
th_divx_1:
	setx	divx_data_t1,%g7,%g1
    	ba	all_threads2
	nop
        
th_divx_2:
	setx	divx_data_t2,%g7,%g1
    	ba	all_threads2
	nop
        
th_divx_3:
	setx	divx_data_t3,%g7,%g1  
	ba	all_threads2
	nop
         
all_threads2:	    
	add	%g0,NUM_DIV_CASES,%g2
			
divx_loop1:
	ldx	[%g1],%l1
	ldx	[%g1+8],%l2
	wr	%g0,%g0,%ccr	    ! ccr clear 

	sdivx	%l1,%l2,%l3
	udivx	%l1,%l2,%l4
	sdivx	%l2,%l1,%l5	    ! use each operand as divisor and dividend
	udivx	%l2,%l1,%l6

	sub	%g2,0x1,%g2
	brnz,pt	%g2,divx_loop1
	add	%g1,0x10,%g1	    ! move operand pointer   
    
    	!*******************************************************
	! Operand2 as a register:    SDIV, SDIVcc, UDIV, UDIVcc
	!*******************************************************
	rdth_id			    ! get thid in %o1
	cmp	%o1,3
	be	th_div_3
	cmp	%o1,2
	be	th_div_2
	cmp	%o1,1
	be	th_div_1
	nop
	! if there are more than 4 threads, run with same data as t0
th_div_0:
	setx	div_data_t0,%g7,%g1
       	ba	all_threads3
	nop

th_div_1:
	setx	div_data_t1,%g7,%g1
    	ba	all_threads3
	nop
        
th_div_2:
	setx	div_data_t2,%g7,%g1
    	ba	all_threads3
	nop
        
th_div_3:
	setx	div_data_t3,%g7,%g1  
	ba	all_threads3
	nop
         
all_threads3:	    
	add	%g0,NUM_DIV_CASES,%g2
	sub	%g0,1,%g3	    ! build masks for part 2 of the test
	srl	%g3,0,%g3	    ! g3 is foxes in lower half
	sllx	%g3,32,%g4	    ! g4 is foxes in upper half
			
div_loop1:
	ldx	[%g1],%l1
	ldx	[%g1+8],%l2
	wr	%g0,%g0,%ccr	    ! ccr clear 

	! pick up Y from top half of %l1. Invert %l1<63:32>.
	mov	%l1,%l0
	srlx	%l0,32,%l0
	wr	%l0,%g0,%y
	xor	%l1,%g4,%l1	    ! invert upper half of %l1

    	sdiv	%l1,%l2,%l3
	wr	%l0,%g0,%y	    ! div ops are allowed to trash Y, so reload
	udiv	%l1,%l2,%l4
	wr	%l0,%g0,%y
	sdivcc	%l1,%l2,%l3
	wr	%g0,%g0,%ccr	    ! ccr clear 
	wr	%l0,%g0,%y
	udivcc	%l1,%l2,%l3

	! pick up Y from top half of %l2. Clear %l2<63:32>.
    	mov	%l2,%l0
	srlx	%l0,32,%l0
	wr	%l0,%g0,%y
	and	%l2,%g3,%l2	    ! clear upper half of %l2

    	sdiv	%l2,%l1,%l5
	wr	%l0,%g0,%y	    ! div ops are allowed to trash Y, so reload
	udiv	%l2,%l1,%l6
    	wr	%l0,%g0,%y
	wr	%g0,0xff,%ccr	    ! ccr set
	sdivcc	%l1,%l2,%l3
	wr	%g0,0xff,%ccr	    ! ccr set
	wr	%l0,%g0,%y
	udivcc	%l1,%l2,%l3

	sub	%g2,0x1,%g2
	brnz,pt	%g2,div_loop1
	add	%g1,0x10,%g1	    ! move operand pointer    

	!**************************
	! Operand2 as immediate 
	!**************************    
       
	setx	immed_data,%g7,%g1	    ! run all threads with same immediate cases
	add	%g0,NUM_IMMED_CASES,%g2
immed_loop:
	ldx	[%g1],%l1		
	wr	%g0,%g0,%ccr	    ! ccr clear
    
				    ! immed13 = 0  
	mulx	%l1,0x0000,%l4
	umul	%l1,0x0000,%l5
	smul	%l1,0x0000,%l6
	umulcc	%l1,0x0000,%l7	    
	smulcc	%l1,0x0000,%l6	    
	wr	%l1,0,%y
#ifndef MULSCC_BUGS    
	mulscc	%l1,0x0000,%l5
#endif    
	sdivx	%l1,0x0000,%l3
	udivx	%l1,0x0000,%l4
    	mov	%l1,%l0
	srlx	%l0,32,%l0	    ! use %l0 to hold %y value
	wr	%l0,%g0,%y
	xor	%l1,%g4,%l1	    ! invert upper half of %l1

    	sdiv	%l1,0x0000,%l3
	wr	%l0,%g0,%y	    ! div ops are allowed to trash Y, so reload
	udiv	%l1,0x0000,%l4
	wr	%l0,%g0,%y
	sdivcc	%l1,0x0000,%l3
	wr	%l0,%g0,%y
	udivcc	%l1,0x0000,%l3

    				    ! immed13 = 1  
	mulx	%l1,0x0001,%l4
	umul	%l1,0x0001,%l5
	smul	%l1,0x0001,%l6
	umulcc	%l1,0x0001,%l7	    
	smulcc	%l1,0x0001,%l6	    
	wr	%l1,0,%y
#ifndef MULSCC_BUGS    
	mulscc	%l1,0x0001,%l5
#endif    
	sdivx	%l1,0x0001,%l3
	udivx	%l1,0x0001,%l4
    	mov	%l1,%l0
	srlx	%l0,32,%l0	    ! use %l0 to hold %y value
	wr	%l0,%g0,%y
	xor	%l1,%g4,%l1	    ! invert upper half of %l1

    	sdiv	%l1,0x0001,%l3
	wr	%l0,%g0,%y	    ! div ops are allowed to trash Y, so reload
	udiv	%l1,0x0001,%l4
	wr	%l0,%g0,%y
	sdivcc	%l1,0x0001,%l3
	wr	%l0,%g0,%y
	udivcc	%l1,0x0001,%l3

    				    ! immed13 = -1 
	mulx	%l1,0x1fff,%l4
	umul	%l1,0x1fff,%l5
	smul	%l1,0x1fff,%l6
	umulcc	%l1,0x1fff,%l7	    
	smulcc	%l1,0x1fff,%l6	    
	wr	%l1,0,%y
#ifndef MULSCC_BUGS    
	mulscc	%l1,0x1fff,%l5
#endif    
	sdivx	%l1,0x1fff,%l3
	udivx	%l1,0x1fff,%l4
    	mov	%l1,%l0
	srlx	%l0,32,%l0	    ! use %l0 to hold %y value
	wr	%l0,%g0,%y
	xor	%l1,%g4,%l1	    ! invert upper half of %l1

    	sdiv	%l1,0x1fff,%l3
	wr	%l0,%g0,%y	    ! div ops are allowed to trash Y, so reload
	udiv	%l1,0x1fff,%l4
	wr	%l0,%g0,%y
	sdivcc	%l1,0x1fff,%l3
	wr	%l0,%g0,%y
	udivcc	%l1,0x1fff,%l3

    				    ! immed13 = 0x0fff  
	mulx	%l1,0x0fff,%l4
	umul	%l1,0x0fff,%l5
	smul	%l1,0x0fff,%l6
	umulcc	%l1,0x0fff,%l7	    
	smulcc	%l1,0x0fff,%l6	    
	wr	%l1,0,%y
#ifndef MULSCC_BUGS    
	mulscc	%l1,0x0fff,%l5
#endif    
	sdivx	%l1,0x0fff,%l3
	udivx	%l1,0x0fff,%l4
    	mov	%l1,%l0
	srlx	%l0,32,%l0	    ! use %l0 to hold %y value
	wr	%l0,%g0,%y
	xor	%l1,%g4,%l1	    ! invert upper half of %l1

    	sdiv	%l1,0x0fff,%l3
	wr	%l0,%g0,%y	    ! div ops are allowed to trash Y, so reload
	udiv	%l1,0x0fff,%l4
	wr	%l0,%g0,%y
	sdivcc	%l1,0x0fff,%l3
	wr	%l0,%g0,%y
	udivcc	%l1,0x0fff,%l3

				    ! immed13 = 0x1000  
	mulx	%l1,0x1000,%l4
	umul	%l1,0x1000,%l5
	smul	%l1,0x1000,%l6
	umulcc	%l1,0x1000,%l7	    
	smulcc	%l1,0x1000,%l6	    
	wr	%l1,0,%y
#ifndef MULSCC_BUGS    
	mulscc	%l1,0x1000,%l5
#endif
    	sdivx	%l1,0x1000,%l3
	udivx	%l1,0x1000,%l4
    	mov	%l1,%l0
	srlx	%l0,32,%l0	    ! use %l0 to hold %y value
	wr	%l0,%g0,%y
	xor	%l1,%g4,%l1	    ! invert upper half of %l1

    	sdiv	%l1,0x1000,%l3
	wr	%l0,%g0,%y	    ! div ops are allowed to trash Y, so reload
	udiv	%l1,0x1000,%l4
	wr	%l0,%g0,%y
	sdivcc	%l1,0x1000,%l3
	wr	%l0,%g0,%y
	udivcc	%l1,0x1000,%l3
    
    	sub	%g2,0x1,%g2
	brnz,pt	%g2,immed_loop
	add	%g1,8,%g1	    ! move operand pointer

    	!***************************************************************
	! MULScc cases for icc.n, icc.v and Y<0> to hit all combinations
	!***************************************************************
#ifndef MULSCC_BUGS    
    
	add	%g0,0xfff,%l1
				     ! icc.nv=00, Y<0>=0 
	wr	%g0,0,%y
	wr	%g0,0x00,%ccr
	mulscc	%l1,0x1fff,%l2	 
    				     ! icc.nv=01, Y<0>=0 
	wr	%g0,0,%y
	wr	%g0,0x02,%ccr
	mulscc	%l1,0x1fff,%l2	 
    				     ! icc.nv=10, Y<0>=0 
	wr	%g0,0,%y
	wr	%g0,0x08,%ccr
	mulscc	%l1,0x1fff,%l2	 
    				     ! icc.nv=11, Y<0>=0 
	wr	%g0,0,%y
	wr	%g0,0x0a,%ccr
	mulscc	%l1,0x1fff,%l2	 
   
				     ! icc.nv=00, Y<0>=1 
	wr	%g0,1,%y
	wr	%g0,0x00,%ccr
	mulscc	%l1,0x1fff,%l2	 
    				     ! icc.nv=01, Y<0>=1
	wr	%g0,1,%y
	wr	%g0,0x02,%ccr
	mulscc	%l1,0x1fff,%l2	 
    				     ! icc.nv=10, Y<0>=1 
	wr	%g0,1,%y
	wr	%g0,0x08,%ccr
	mulscc	%l1,0x1fff,%l2	 
    				     ! icc.nv=11, Y<0>=1 
	wr	%g0,1,%y
	wr	%g0,0x0a,%ccr
	mulscc	%l1,0x1fff,%l2	 
#endif
/********************************************************************************
*  The following test cases check implementation dependent cases.
*  1. long ops in the delay slot of a branch, with and without nullification
*  2. uninitialized cache lines and the divide by zero detect logic
*  3. contention for register write ports
**********************************************************************************/
    
    	!*******************************************************************
	! Mul/Div operations in delay slots of a branch. Data is unimportant 
	!*******************************************************************     
	sub	%g0,1,%l1
    	wr	%l1,0,%y
				    ! branch taken, delay instr not annulled
	add	%g0,%g0,%l2
	brz,a,pt %l2,br_pt_1
	mulx	%l1,0x0101,%l4
	nop
	nop
br_pt_1:        
	brz,a,pt %l2,br_pt_2
	umul	%l1,0x0101,%l5
	nop
	nop
br_pt_2: 
    	brz,a,pt %l2,br_pt_3
	smul	%l1,0x0101,%l6
	nop
	nop
br_pt_3: 
    	brz,a,pt %l2,br_pt_4
	umulcc	%l1,0x0101,%l7	    
	nop
	nop
br_pt_4: 
    	brz,a,pt %l2,br_pt_5
	smulcc	%l1,0x0101,%l6
    	nop
	nop
br_pt_5: 	
#ifndef MULSCC_BUGS    
	brz,a,pt %l2,br_pt_6
	mulscc	%l1,0x0101,%l5
	nop
	nop
#endif    
br_pt_6: 
	brz,a,pt %l2,br_pt_7
	sdivx	%l1,0x0101,%l3
	nop
	nop
br_pt_7: 
	brz,a,pt %l2,br_pt_8
	udivx	%l1,0x0101,%l4
	nop
	nop
br_pt_8: 
	brz,a,pt %l2,br_pt_9
    	sdiv	%l1,0x0101,%l5
	nop
	nop
br_pt_9: 
	brz,a,pt %l2,br_pt_10
	udiv	%l1,0x0101,%l7
	nop
	nop
br_pt_10: 
	brz,a,pt %l2,br_pt_11
	sdivcc	%l1,0x0101,%l6
	nop
	nop
br_pt_11: 
	brz,a,pt %l2,br_pt_12
	udivcc	%l1,0x0101,%l3
	nop
	nop
br_pt_12: 
    
     				    ! branch taken, delay instr annulled
	add	%g0,1,%l2
	brz,a,pt %l2,br_pta_1
	mulx	%l1,0x0101,%l4
	nop
	nop
br_pta_1:        
	brz,a,pt %l2,br_pta_2
	umul	%l1,0x0101,%l5
	nop
	nop
br_pta_2: 
    	brz,a,pt %l2,br_pta_3
	smul	%l1,0x0101,%l6
	nop
	nop
br_pta_3: 
    	brz,a,pt %l2,br_pta_4
	umulcc	%l1,0x0101,%l7	    
	nop
	nop
br_pta_4: 
    	brz,a,pt %l2,br_pta_5
	smulcc	%l1,0x0101,%l6
    	nop
	nop
br_pta_5: 	    
#ifndef MULSCC_BUGS    
	brz,a,pt %l2,br_pta_6
	mulscc	%l1,0x0101,%l5
	nop
	nop
#endif
br_pta_6: 
	brz,a,pt %l2,br_pta_7
	sdivx	%l1,0x0101,%l3
	nop
	nop
br_pta_7: 
	brz,a,pt %l2,br_pta_8
	udivx	%l1,0x0101,%l4
	nop
	nop
br_pta_8: 
	brz,a,pt %l2,br_pta_9
    	sdiv	%l1,0x0101,%l5
	nop
	nop
br_pta_9: 
	brz,a,pt %l2,br_pta_10
	udiv	%l1,0x0101,%l7
	nop
	nop
br_pta_10: 
	brz,a,pt %l2,br_pta_11
	sdivcc	%l1,0x0101,%l6
	nop
	nop
br_pta_11: 
	brz,a,pt %l2,br_pta_12
	udivcc	%l1,0x0101,%l3
	nop
	nop
br_pta_12: 

    
				    ! branch taken, delay instr not annulled
	add	%g0,%g0,%l2
	brz,a,pn %l2,br_pn_1
	mulx	%l1,0x0101,%l4
	nop
	nop
br_pn_1:        
	brz,a,pn %l2,br_pn_2
	umul	%l1,0x0101,%l5
	nop
	nop
br_pn_2: 
    	brz,a,pn %l2,br_pn_3
	smul	%l1,0x0101,%l6
	nop
	nop
br_pn_3: 
    	brz,a,pn %l2,br_pn_4
	umulcc	%l1,0x0101,%l7	    
	nop
	nop
br_pn_4: 
    	brz,a,pn %l2,br_pn_5
	smulcc	%l1,0x0101,%l6
    	nop
	nop
br_pn_5: 	    
#ifndef MULSCC_BUGS    
	brz,a,pn %l2,br_pn_6
	mulscc	%l1,0x0101,%l5
	nop
	nop
#endif    
br_pn_6: 
	brz,a,pn %l2,br_pn_7
	sdivx	%l1,0x0101,%l3
	nop
	nop
br_pn_7: 
	brz,a,pn %l2,br_pn_8
	udivx	%l1,0x0101,%l4
	nop
	nop
br_pn_8: 
	brz,a,pn %l2,br_pn_9
    	sdiv	%l1,0x0101,%l5
	nop
	nop
br_pn_9: 
	brz,a,pn %l2,br_pn_10
	udiv	%l1,0x0101,%l7
	nop
	nop
br_pn_10: 
	brz,a,pn %l2,br_pn_11
	sdivcc	%l1,0x0101,%l6
	nop
	nop
br_pn_11: 
	brz,a,pn %l2,br_pn_12
	udivcc	%l1,0x0101,%l3
	nop
	nop
br_pn_12: 

    				    ! branch taken, delay instr annulled
	add	%g0,1,%l2
	brz,a,pn %l2,br_pna_1
	mulx	%l1,0x0101,%l4
	nop
	nop
br_pna_1:        
	brz,a,pn %l2,br_pna_2
	umul	%l1,0x0101,%l5
	nop
	nop
br_pna_2: 
    	brz,a,pn %l2,br_pna_3
	smul	%l1,0x0101,%l6
	nop
	nop
br_pna_3: 
    	brz,a,pn %l2,br_pna_4
	umulcc	%l1,0x0101,%l7	    
	nop
	nop
br_pna_4: 
    	brz,a,pn %l2,br_pna_5
	smulcc	%l1,0x0101,%l6
    	nop
	nop
br_pna_5: 	
#ifndef MULSCC_BUGS            
	brz,a,pn %l2,br_pna_6
	mulscc	%l1,0x0101,%l5
	nop
	nop
#endif
br_pna_6: 
	brz,a,pn %l2,br_pna_7
	sdivx	%l1,0x0101,%l3
	nop
	nop
br_pna_7: 
	brz,a,pn %l2,br_pna_8
	udivx	%l1,0x0101,%l4
	nop
	nop
br_pna_8: 
	brz,a,pn %l2,br_pna_9
    	sdiv	%l1,0x0101,%l5
	nop
	nop
br_pna_9: 
	brz,a,pn %l2,br_pna_10
	udiv	%l1,0x0101,%l7
	nop
	nop
br_pna_10: 
	brz,a,pn %l2,br_pna_11
	sdivcc	%l1,0x0101,%l6
	nop
	nop
br_pna_11: 
	brz,a,pn %l2,br_pna_12
	udivcc	%l1,0x0101,%l3
	nop
	nop
br_pna_12: 


    	!***********************************************************************
	! Div rs2 used during a cache miss on a previously unused cache line. 
	! X's in the divide-by-zero logic have caused problems in the past.
	!***********************************************************************
	add	%g0,42,%l1   
	wr	%l1,0,%y
					! *** UDIVX ***
	setx	udivx_miss1,%g7,%g1
	ldx	[%g1],%l2
	udivx	%l1,%l2,%l3

    	setx	udivx_miss2,%g7,%g1
	ldx	[%g1],%l2
	udivx	%l1,%l2,%l4

    	setx	udivx_miss3,%g7,%g1
	ldx	[%g1],%l2
	nop				! change timing slightly
	udivx	%l1,%l2,%l4
    
	setx	udivx_miss4,%g7,%g1
	ldx	[%g1],%l2
	udivx	%l1,%l2,%l3		! loaded value is zero	  

    
					! *** SDIVX ***
    	setx	sdivx_miss1,%g7,%g1
	ldx	[%g1],%l2
	sdivx	%l1,%l2,%l1		! rs1 same as rd

    	setx	sdivx_miss2,%g7,%g1
	ldx	[%g1],%l2
	sdivx	%l1,%l2,%l2		! rs2 same as rd

    	setx	sdivx_miss3,%g7,%g1
	ldx	[%g1],%l2
	nop				! change timing slightly
	sdivx	%l1,%l2,%l4
    
	setx	udivx_miss4,%g7,%g1
	ldx	[%g1],%l2
	sdivx	%l1,%l2,%l2		! loaded value is zero	    

    
					! *** UDIV ***
	setx	udiv_miss1,%g7,%g1
	ldx	[%g1],%l2
	udiv	%l1,%l2,%l3

    	setx	udiv_miss2,%g7,%g1
	ldx	[%g1],%l2
	udiv	%l1,%l2,%l4

    	setx	udiv_miss3,%g7,%g1
	ldx	[%g1],%l2
	nop				! change timing slightly
	udiv	%l1,%l2,%l2
    
	setx	udiv_miss4,%g7,%g1
	ldx	[%g1],%l2
	udiv	%l1,%l2,%l1		! loaded value is zero	  

    
					! *** SDIVcc ***
    	setx	sdivcc_miss1,%g7,%g1
	ldx	[%g1],%l2
	sdivcc	%l1,%l2,%l4

    	setx	sdivcc_miss2,%g7,%g1
	ldx	[%g1],%l2
	sdivcc	%l1,%l2,%l3

    	setx	sdivcc_miss3,%g7,%g1
	ldx	[%g1],%l2
	nop				! change timing slightly
	sdivcc	%l1,%l2,%l4
    
	setx	sdivcc_miss4,%g7,%g1
	ldx	[%g1],%l2
	sdivcc	%l1,%l2,%g1		! loaded value is zero	    


	!****************************************************************
	! contention for register write ports
	!****************************************************************
reg_port_test:	
	rdth_id			    ! get thid in %o1
	cmp	%o1,3
	be	th_reg_3
	cmp	%o1,2
	be	th_reg_2
	cmp	%o1,1
	be	th_reg_1
	nop
	! if there are more than 4 threads, run with same data as t0
th_reg_0:
	setx	reg_port_contention_0,%g7,%g1
       	ba	all_threads4
	nop

th_reg_1:
	setx	reg_port_contention_1,%g7,%g1
    	ba	all_threads4
	nop
        
th_reg_2:
	setx	reg_port_contention_2,%g7,%g1
    	ba	all_threads4
	nop
        
th_reg_3:
	setx	reg_port_contention_3,%g7,%g1  
	ba	all_threads4
	nop
         
all_threads4:	        
	ldx	[%g1],%l1		! cache miss, rs1  
	mulx	%l1,0x0002,%l4
	ldx	[%g1],%l2		! cache hit, rs1  
	mulx	%l2,%l1,%l4

	add	%g1,0x20,%g1
	ldx	[%g1],%l1		! cache miss, rs2  
	umul	%l2,%l1,%l5
	ldx	[%g1+8],%l1		! cache hit, rs2  
	umul	%l2,%l1,%l5
    
	add	%g1,0x20,%g1
	ldsb	[%g1],%l1		! cache miss, byte load, rs1
	smul	%l1,0x0008,%l3
	ldub	[%g1+13],%l6		! cache hit, byte load, rs2  
	smul	%l1,%l6,%l5
    
	add	%g1,0x20,%g1
	ldsh	[%g1+2],%l1		! cache miss, halfword load, rs2  
	umulcc	%l1,%l3,%l7	    
	lduh	[%g1],%l4		! cache hit, halfword load, rs1  
	umulcc	%l4,%l1,%l7
    	    
	add	%g1,0x20,%g1
	ldsw	[%g1+8],%l1		! cache miss, word load, rs1  
	smulcc	%l1,0x0020,%l6		! same rd as next load	    
	lduw	[%g1],%l6		! cache hit, word load, rs1  
	smulcc	%l6,0x0020,%l5
    	    
#ifndef MULSCC_BUGS    
	add	%g1,0x20,%g1
	wr	%l1,0,%y
	ldx	[%g1],%l1		! cache miss, rs1  
	mulscc	%l1,0x0040,%l1
	ldx	[%g1+8],%l2		! cache hit, rs2  
	mulscc	%l1,%l2,%l5
#endif
    
	add	%g1,0x20,%g1
    	ldx	[%g1+8],%l1		! cache miss, rs1 = rs2  
	mulx	%l1,%l1,%l4
	ldx	[%g1],%l2		! cache hit, rs1 = rs2  
	mulx	%l2,%l2,%l4
    
	add	%g1,0x20,%g1
	ldx	[%g1],%l1		! cache miss, rs1  
	sdivx	%l1,%l3,%l3
	ldx	[%g1],%l3		! cache hit, rs1  
	sdivx	%l1,%l3,%l3
    
	add	%g1,0x20,%g1
	ldx	[%g1],%l2		! cache miss, rs2  
	udivx	%l1,%l2,%l4
	ldx	[%g1],%l2		! cache hit, rs2  
	udivx	%l1,%l2,%l4

	add	%g1,0x20,%g1
	ldx	[%g1],%l1		! cache miss, rs1 and rs2  
	ldx	[%g1+0x10],%l2	
    	sdiv	%l1,%l2,%l3
	ldx	[%g1+8],%l1		! cache hit, rs1 and rs2
	ldx	[%g1+0x18],%l2
    	sdiv	%l1,%l2,%l3
    
	add	%g1,0x20,%g1
	ldx	[%g1],%l1		! cache miss, rs2 and rs1 
	ldx	[%g1+0x10],%l2	
	udiv	%l2,%l1,%l4
	ldx	[%g1],%l1		! cache hit, rs2 and rs1
	ldx	[%g1+0x10],%l2	
	udiv	%l2,%l1,%l4
    
	add	%g1,0x20,%g1
	ldsw	[%g1],%l1		! cache miss, word load, rs1  
	sdivcc	%l1,%l2,%l3
	ldsw	[%g1+4],%l1		! cache hit, word load, rs2  
	sdivcc	%l2,%l1,%l4
    
	add	%g1,0x20,%g1
	lduh	[%g1],%l1		! cache miss, halfword load, rs2  
	udivcc	%l2,%l1,%l3
	ldsh	[%g1],%l1		! cache hit, halfword load, rs2  
	udivcc	%l3,%l1,%l3
    
good_end:   
	ta	T_GOOD_TRAP
	nop
	nop    


!==========================    
.data
.align 0x1fff+1
	! at an 8k boundary...
    
			 ! be sure each mul_data_t* has same number of cases
mul_data_t0:                   
	.xword 0x0000000000000000
	.xword 0x0000000000000001
    
	.xword 0x0000000000000003
	.xword 0x000000000000000c
    
	.xword 0x000000007fffffff
	.xword 0x0000000080000000
    
	.xword 0x0000000080000001	
	.xword 0x00000000fffffffe
    
	.xword 0x7fffffffffffffff
	.xword 0x8000000000000000
    
	.xword 0x8000000000000001
	.xword 0xfffffffffffffffc

mul_data_t1:	    
	.xword 0xffffffffffffffff
	.xword 0x0000000000000001
    
	.xword 0x000000007ffffffc
	.xword 0x000000007fffffff
    
	.xword 0x0000000080000000
	.xword 0x0000000080000001
    	
	.xword 0x00000000fffffffe
	.xword 0x7fffffffffffffff
    
	.xword 0x8000000000000000
	.xword 0x8000000000000001
    
	.xword 0xffffffffffffffff
	.xword 0xaaaaaaaaaaaaaaaa

mul_data_t2:	      
	.xword 0xaaaaaaaaaaaaaaaa
	.xword 0x5555555555555555
    
    	.xword 0x1111111111111111
	.xword 0xeeeeeeeeeeeeeeee
    
	.xword 0xfffffffffffffffc  
	.xword 0xffffffff00000001
    
	.xword 0x0000000088888888
	.xword 0x0000000080000001
    	
	.xword 0x0000000000000001
	.xword 0x00000000fffffffe
    
	.xword 0xffffffffffffffff
	.xword 0x80000aaa5550000e

mul_data_t3:	
    	.xword 0x2222222222222222
	.xword 0x4444444444444444
    
	.xword 0xcccccccccccccccc
	.xword 0x0000000000000002
    
	.xword 0x0000000000000002
	.xword 0xf0f0f0f0f0f0f0f0
    
	.xword 0xe11d548a139bcb18
	.xword 0x000000005aeb5d3b
    
	.xword 0x056e61a23ad8a1c8
	.xword 0x6adb9bfd446daaac

	.xword 0x000000002e5f37ec
	.xword 0x000000002eb16c25
    
divx_data_t0:	
    	.xword 0x0000000000000000
	.xword 0x0000000000000001
    
	.xword 0x0000000000000064
	.xword 0x0000000000000005
    
	.xword 0x000000007ffffffc   ! positive remainder
	.xword 0x000000007ffffffe
    
	.xword 0x000000007fffffff
	.xword 0x0000000080000000

divx_data_t1:	        
	.xword 0x0000000080000001	
	.xword 0x00000000fffffffe
    
	.xword 0x00000000ffffffff
	.xword 0x7ffffffffffffffe
    
	.xword 0x7fffffffffffffff
	.xword 0x8000000000000000
    
	.xword 0x8000000000000001
	.xword 0xfffffffffffffffc

divx_data_t2:	        
	.xword 0xfffffffffffffffe
	.xword 0xffffffffffffffff

    	.xword 0x0000000000000001
	.xword 0x0000000000000010
    
	.xword 0x0000000000000011
	.xword 0x000000007ffffffc
    
	.xword 0x000000007ffffffe
	.xword 0x000000007fffffff

divx_data_t3:	    
	.xword 0x0000000080000000
    	.xword 0x0000000080000001
    	
	.xword 0x00000000fffffffe
	.xword 0x00000000ffffffff
    
	.xword 0x7ffffffffffffffe
	.xword 0x7fffffffffffffff
    
	.xword 0x8000000000000000   ! overflow case 800...000/-1
	.xword 0xffffffffffffffff

div_data_t0:	
    	.xword 0x0000000000000000
	.xword 0x0000000000000001
    
	.xword 0xffffffffffffff9c   ! -100 decimal
	.xword 0x0000000000000014
    
	.xword 0x000000007ffffffc
	.xword 0x000000007ffffffe
    
	.xword 0x000000007fffffff
	.xword 0x0000000080000000

div_data_t1:	        
	.xword 0x0000000080000001	
	.xword 0x00000000fffffffe
    
	.xword 0x00000000ffffffff
	.xword 0x7ffffffffffffffe
    
	.xword 0x7fffffffffffffff
	.xword 0x8000000000000000   ! overflow case 800..../-1
    
	.xword 0x8000000000000001
	.xword 0xfffffffffffffffc

div_data_t2:	        
	.xword 0xfffffffffffffffe
	.xword 0xffffffffffffffff

    	.xword 0x0000000000000001
	.xword 0x0000000000000010
    
	.xword 0x0000000000000011
	.xword 0x000000007ffffffc
    
	.xword 0x000000007ffffffe
	.xword 0x000000007fffffff

div_data_t3:	    
	.xword 0x0000000080000000
    	.xword 0x0000000080000001
    	
	.xword 0x00000000fffffffe
	.xword 0x00000000ffffffff
    
	.xword 0x7ffffffffffffffe
	.xword 0x7fffffffffffffff
    
	.xword 0x8000000000000000   ! overflow case 800...000/-1
	.xword 0xffffffffffffffff    
    
immed_data: 
	.word 0x00000000, 0x00000000
	.word 0x00000000, 0x7fffffff
	.word 0x00000000, 0x00000001
	.word 0x7fffffff, 0xffffffff
	.word 0xffffffff, 0xffffffff    

    
.align 0x100
	!*********************************************************************
	! at a 256byte boundary for cache miss/ uninitialized cache line tests
	!*********************************************************************
udivx_miss1: 
	.word 0x00000000, 0x00001111	! first half of line
.align 0x20
	.word 0, 0
udivx_miss2: 
	.word 0x00000000, 0x00002222	! second half of line
.align 0x20
udivx_miss3: 
	.word 0xffffffff, 0xffff3333	! for use with nop case
.align 0x20
udivx_miss4: 
	.word 0x00000000, 0x00000000	! divide by zero
    
.align 0x20
sdivx_miss1: 
	.word 0x00000000, 0x00001111	! first half of line
.align 0x20
	.word 0, 0
sdivx_miss2: 
	.word 0x00000000, 0x00002222	! second half of line
.align 0x20
sdivx_miss3: 
	.word 0xffffffff, 0xffff3333	! for use with nop case
.align 0x20
sdivx_miss4: 
	.word 0x00000000, 0x00000000	! divide by zero   
    
.align 0x20
udiv_miss1: 
	.word 0x00000000, 0x00001111	! first half of line
.align 0x20
	.word 0, 0
udiv_miss2: 
	.word 0x00000000, 0x00002222	! second half of line
.align 0x20
udiv_miss3: 
	.word 0xffffffff, 0xffff3333	! for use with nop case
.align 0x20
udiv_miss4: 
	.word 0x00000000, 0x00000000	! divide by zero
    
.align 0x20
sdivcc_miss1: 
	.word 0x00000000, 0x00001111	! first half of line
.align 0x20
	.word 0, 0
sdivcc_miss2: 
	.word 0x00000000, 0x00002222	! second half of line
.align 0x20
sdivcc_miss3: 
	.word 0xffffffff, 0xffff3333	! for use with nop case
.align 0x20
sdivcc_miss4: 
	.word 0x00000000, 0x00000000	! divide by zero   

.align 0x100
reg_port_contention_0:			! boring data
	.word 0x10000000, 0x00000001, 0xffffffff, 0xffffffff
	.word 0x20000000, 0x00000002, 0xffffffff, 0xfffffffe
	.word 0x40000000, 0x00000004, 0xffffffff, 0xfffffffd
	.word 0x80000000, 0x00000008, 0xffffffff, 0xfffffffb
	.word 0x01000000, 0x00000010, 0xffffffff, 0xfffffff7
    	.word 0x02000000, 0x00000020, 0xffffffff, 0xffffffef
    	.word 0x04000000, 0x00000040, 0xffffffff, 0xffffffdf
    	.word 0x08000000, 0x00000080, 0xffffffff, 0xffffffbf
    	.word 0x00100000, 0x00000100, 0xffffffff, 0xffffff7f
    	.word 0x00200000, 0x00000200, 0xffffffff, 0xfffffeff
    	.word 0x00400000, 0x00000400, 0xffffffff, 0xfffffdff
    	.word 0x00800000, 0x00000800, 0xffffffff, 0xfffffbff
    	.word 0x00010000, 0x00001000, 0xffffffff, 0xfffff7ff
    	.word 0x00020000, 0x00002000, 0xffffffff, 0xffffefff
    	.word 0x00040000, 0x00004000, 0xffffffff, 0xffffdfff
    	.word 0x00080000, 0x00008000, 0xffffffff, 0xffffbfff
    	.word 0x00001000, 0x00010000, 0xffffffff, 0xffff7fff
    	.word 0x00002000, 0x00020000, 0xffffffff, 0xfffeffff
    	.word 0x00004000, 0x00040000, 0xffffffff, 0xfffdffff
    	.word 0x00008000, 0x00080000, 0xffffffff, 0xfffbffff
    	.word 0x00000100, 0x00100000, 0xffffffff, 0xfff7ffff
	.word 0x10000000, 0x00000001, 0xffffffff, 0xffffffff
	.word 0x20000000, 0x00000002, 0xffffffff, 0xfffffffe
	.word 0x40000000, 0x00000004, 0xffffffff, 0xfffffffd
	.word 0x80000000, 0x00000008, 0xffffffff, 0xfffffffb
	.word 0x01000000, 0x00000010, 0xffffffff, 0xfffffff7
    	.word 0x02000000, 0x00000020, 0xffffffff, 0xffffffef
    	.word 0x04000000, 0x00000040, 0xffffffff, 0xffffffdf
    	.word 0x08000000, 0x00000080, 0xffffffff, 0xffffffbf
    	.word 0x00100000, 0x00000100, 0xffffffff, 0xffffff7f
    	.word 0x00200000, 0x00000200, 0xffffffff, 0xfffffeff
    	.word 0x00400000, 0x00000400, 0xffffffff, 0xfffffdff
    	.word 0x00800000, 0x00000800, 0xffffffff, 0xfffffbff
    	.word 0x00010000, 0x00001000, 0xffffffff, 0xfffff7ff
    	.word 0x00020000, 0x00002000, 0xffffffff, 0xffffefff
    	.word 0x00040000, 0x00004000, 0xffffffff, 0xffffdfff
    	.word 0x00080000, 0x00008000, 0xffffffff, 0xffffbfff
    	.word 0x00001000, 0x00010000, 0xffffffff, 0xffff7fff
    	.word 0x00002000, 0x00020000, 0xffffffff, 0xfffeffff
    	.word 0x00004000, 0x00040000, 0xffffffff, 0xfffdffff
    	.word 0x00008000, 0x00080000, 0xffffffff, 0xfffbffff
    	.word 0x00000100, 0x00100000, 0xffffffff, 0xfff7ffff
    
reg_port_contention_1:			! boring data
	.word 0x1dead000, 0xdead0001, 0xffffffff, 0xffffffff
	.word 0x2dead000, 0xdead0002, 0xffffffff, 0xfffffffe
	.word 0x4dead000, 0xdead0004, 0xffffffff, 0xfffffffd
	.word 0x8dead000, 0xdead0008, 0xffffffff, 0xfffffffb
	.word 0x01dead00, 0xdead0010, 0xffffffff, 0xfffffff7
    	.word 0x02dead00, 0xdead0020, 0xffffffff, 0xffffffef
    	.word 0x04dead00, 0xdead0040, 0xffffffff, 0xffffffdf
    	.word 0x08dead00, 0xdead0080, 0xffffffff, 0xffffffbf
    	.word 0x001dead0, 0xdead0100, 0xffffffff, 0xffffff7f
    	.word 0x002dead0, 0xdead0200, 0xffffffff, 0xfffffeff
    	.word 0x004dead0, 0xdead0400, 0xffffffff, 0xfffffdff
    	.word 0x008dead0, 0xdead0800, 0xffffffff, 0xfffffbff
    	.word 0x0001dead, 0xdead1000, 0xffffffff, 0xfffff7ff
    	.word 0x0002dead, 0xdead2000, 0xffffffff, 0xffffefff
    	.word 0x0004dead, 0xdead4000, 0xffffffff, 0xffffdfff
    	.word 0x0008dead, 0xdead8000, 0xffffffff, 0xffffbfff
    	.word 0xdead1000, 0x0001dead, 0xffffffff, 0xffff7fff
    	.word 0xdead2000, 0x0002dead, 0xffffffff, 0xfffeffff
    	.word 0xdead4000, 0x0004dead, 0xffffffff, 0xfffdffff
    	.word 0xdead8000, 0x0008dead, 0xffffffff, 0xfffbffff
    	.word 0xdead0100, 0x001dead0, 0xffffffff, 0xfff7ffff
	.word 0x1dead000, 0xdead0001, 0xffffffff, 0xffffffff
	.word 0x2dead000, 0xdead0002, 0xffffffff, 0xfffffffe
	.word 0x4dead000, 0xdead0004, 0xffffffff, 0xfffffffd
	.word 0x8dead000, 0xdead0008, 0xffffffff, 0xfffffffb
	.word 0x01dead00, 0xdead0010, 0xffffffff, 0xfffffff7
    	.word 0x02dead00, 0xdead0020, 0xffffffff, 0xffffffef
    	.word 0x04dead00, 0xdead0040, 0xffffffff, 0xffffffdf
    	.word 0x08dead00, 0xdead0080, 0xffffffff, 0xffffffbf
    	.word 0x001dead0, 0xdead0100, 0xffffffff, 0xffffff7f
    	.word 0x002dead0, 0xdead0200, 0xffffffff, 0xfffffeff
    	.word 0x004dead0, 0xdead0400, 0xffffffff, 0xfffffdff
    	.word 0x008dead0, 0xdead0800, 0xffffffff, 0xfffffbff
    	.word 0x0001dead, 0xdead1000, 0xffffffff, 0xfffff7ff
    	.word 0x0002dead, 0xdead2000, 0xffffffff, 0xffffefff
    	.word 0x0004dead, 0xdead4000, 0xffffffff, 0xffffdfff
    	.word 0x0008dead, 0xdead8000, 0xffffffff, 0xffffbfff
    	.word 0xdead1000, 0x0001dead, 0xffffffff, 0xffff7fff
    	.word 0xdead2000, 0x0002dead, 0xffffffff, 0xfffeffff
    	.word 0xdead4000, 0x0004dead, 0xffffffff, 0xfffdffff
    	.word 0xdead8000, 0x0008dead, 0xffffffff, 0xfffbffff
    	.word 0xdead0100, 0x001dead0, 0xffffffff, 0xfff7ffff

reg_port_contention_2:			! boring data
	.word 0x10000000, 0x00000001, 0xf0f0f0f0, 0xffffffff
	.word 0x20000000, 0x00000002, 0xf0f0f0f0, 0xfffffffe
	.word 0x40000000, 0x00000004, 0xf0f0f0f0, 0xfffffffd
	.word 0x80000000, 0x00000008, 0xf0f0f0f0, 0xfffffffb
	.word 0x01000000, 0x00000010, 0xf0f0f0f0, 0xfffffff7
    	.word 0x02000000, 0x00000020, 0xf0f0f0f0, 0xffffffef
    	.word 0x04000000, 0x00000040, 0xf0f0f0f0, 0xffffffdf
    	.word 0x08000000, 0x00000080, 0xf0f0f0f0, 0xffffffbf
    	.word 0x00100000, 0x00000100, 0xf0f0f0f0, 0xffffff7f
    	.word 0x00200000, 0x00000200, 0xf0f0f0f0, 0xfffffeff
    	.word 0x00400000, 0x00000400, 0xf0f0f0f0, 0xfffffdff
    	.word 0x00800000, 0x00000800, 0xf0f0f0f0, 0xfffffbff
    	.word 0x00010000, 0x00001000, 0xf0f0f0f0, 0xfffff7ff
    	.word 0x00020000, 0x00002000, 0xf0f0f0f0, 0xffffefff
    	.word 0x00040000, 0x00004000, 0xf0f0f0f0, 0xffffdfff
    	.word 0x00080000, 0x00008000, 0xf0f0f0f0, 0xffffbfff
    	.word 0x00001000, 0x00010000, 0xf0f0f0f0, 0xffff7fff
    	.word 0x00002000, 0x00020000, 0xf0f0f0f0, 0xfffeffff
    	.word 0x00004000, 0x00040000, 0xf0f0f0f0, 0xfffdffff
    	.word 0x00008000, 0x00080000, 0xf0f0f0f0, 0xfffbffff
    	.word 0x00000100, 0x00100000, 0xf0f0f0f0, 0xfff7ffff
	.word 0x10000000, 0x00000001, 0xf0f0f0f0, 0xf0f0f0f0
	.word 0x20000000, 0x00000002, 0xf0f0f0f0, 0xfffffffe
	.word 0x40000000, 0x00000004, 0xf0f0f0f0, 0xfffffffd
	.word 0x80000000, 0x00000008, 0xf0f0f0f0, 0xfffffffb
	.word 0x01000000, 0x00000010, 0xf0f0f0f0, 0xfffffff7
    	.word 0x02000000, 0x00000020, 0xf0f0f0f0, 0xffffffef
    	.word 0x04000000, 0x00000040, 0xf0f0f0f0, 0xffffffdf
    	.word 0x08000000, 0x00000080, 0xf0f0f0f0, 0xffffffbf
    	.word 0x00100000, 0x00000100, 0xf0f0f0f0, 0xffffff7f
    	.word 0x00200000, 0x00000200, 0xf0f0f0f0, 0xfffffeff
    	.word 0x00400000, 0x00000400, 0xf0f0f0f0, 0xfffffdff
    	.word 0x00800000, 0x00000800, 0xf0f0f0f0, 0xfffffbff
    	.word 0x00010000, 0x00001000, 0xf0f0f0f0, 0xfffff7ff
    	.word 0x00020000, 0x00002000, 0xf0f0f0f0, 0xffffefff
    	.word 0x00040000, 0x00004000, 0xf0f0f0f0, 0xffffdfff
    	.word 0x00080000, 0x00008000, 0xf0f0f0f0, 0xffffbfff
    	.word 0x00001000, 0x00010000, 0xf0f0f0f0, 0xffff7fff
    	.word 0x00002000, 0x00020000, 0xf0f0f0f0, 0xfffeffff
    	.word 0x00004000, 0x00040000, 0xf0f0f0f0, 0xfffdffff
    	.word 0x00008000, 0x00080000, 0xf0f0f0f0, 0xfffbffff
    	.word 0x00000100, 0x00100000, 0xf0f0f0f0, 0xfff7ffff
    
reg_port_contention_3:			! boring data
	.word 0x10000000, 0x00000001, 0xffffffff, 0xffffffff
	.word 0x20000000, 0x00000002, 0xefffffff, 0xfffffffe
	.word 0x40000000, 0x00000004, 0xdfffffff, 0xfffffffd
	.word 0x80000000, 0x00000008, 0xbfffffff, 0xfffffffb
	.word 0x01000000, 0x00000010, 0x7fffffff, 0xfffffff7
    	.word 0x02000000, 0x00000020, 0xfeffffff, 0xffffffef
    	.word 0x04000000, 0x00000040, 0xfdffffff, 0xffffffdf
    	.word 0x08000000, 0x00000080, 0xfbffffff, 0xffffffbf
    	.word 0x00100000, 0x00000100, 0xf7ffffff, 0xffffff7f
    	.word 0x00200000, 0x00000200, 0xffefffff, 0xfffffeff
    	.word 0x00400000, 0x00000400, 0xffdfffff, 0xfffffdff
    	.word 0x00800000, 0x00000800, 0xffbfffff, 0xfffffbff
    	.word 0x00010000, 0x00001000, 0xff7fffff, 0xfffff7ff
    	.word 0x00020000, 0x00002000, 0xfffeffff, 0xffffefff
    	.word 0x00040000, 0x00004000, 0xfffdffff, 0xffffdfff
    	.word 0x00080000, 0x00008000, 0xfffbffff, 0xffffbfff
    	.word 0x00001000, 0x00010000, 0xfff7ffff, 0xffff7fff
    	.word 0x00002000, 0x00020000, 0xffffefff, 0xfffeffff
    	.word 0x00004000, 0x00040000, 0xffffdfff, 0xfffdffff
    	.word 0x00008000, 0x00080000, 0xffffbfff, 0xfffbffff
    	.word 0x00000100, 0x00100000, 0xffff7fff, 0xfff7ffff
	.word 0x10000000, 0x00000001, 0xfffffeff, 0xffffffff
	.word 0x20000000, 0x00000002, 0xfffffdff, 0xfffffffe
	.word 0x40000000, 0x00000004, 0xfffffbff, 0xfffffffd
	.word 0x80000000, 0x00000008, 0xfffff7ff, 0xfffffffb
	.word 0x01000000, 0x00000010, 0xffffffef, 0xfffffff7
    	.word 0x02000000, 0x00000020, 0xffffffdf, 0xffffffef
    	.word 0x04000000, 0x00000040, 0xffffffbf, 0xffffffdf
    	.word 0x08000000, 0x00000080, 0xffffff7f, 0xffffffbf
    	.word 0x00100000, 0x00000100, 0xfffffffe, 0xffffff7f
    	.word 0x00200000, 0x00000200, 0xfffffffd, 0xfffffeff
    	.word 0x00400000, 0x00000400, 0xfffffffb, 0xfffffdff
    	.word 0x00800000, 0x00000800, 0xfffffff7, 0xfffffbff
    	.word 0x00010000, 0x00001000, 0x7fffffff, 0xfffff7ff
    	.word 0x00020000, 0x00002000, 0x3fffffff, 0xffffefff
    	.word 0x00040000, 0x00004000, 0x1fffffff, 0xffffdfff
    	.word 0x00080000, 0x00008000, 0x0fffffff, 0xffffbfff
    	.word 0x00001000, 0x00010000, 0x07ffffff, 0xffff7fff
    	.word 0x00002000, 0x00020000, 0x03ffffff, 0xfffeffff
    	.word 0x00004000, 0x00040000, 0x01ffffff, 0xfffdffff
    	.word 0x00008000, 0x00080000, 0x007fffff, 0xfffbffff
    	.word 0x00000100, 0x00100000, 0x003fffff, 0xfff7ffff        
                         	    
.end
