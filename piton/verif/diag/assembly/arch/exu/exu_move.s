// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: exu_move.s
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
 * Name:    exu_move.s
 * Date:    April 22, 2003
 *
 *  Description: Execute all conditional integer move ops with various ccr
 *  values in multiple threads. (16 icc/xcc, 16 fccn, 6 movr*) 
 *
 *  This test depends on SAS for result checking.    
 *
 **********************************************************************/

! be sure to update when adding cases...
#define NUM_CCR_CASES   11
#define NUM_CCRi_CASES  5
#define NUM_FCN_CASES	4
#define NUM_MOVR_CASES	3    
#define NUM_IMMED_CASES 3

! make fcc condition code value more readable    
#define FSR_FCC3_EQ 0x00    ! upper word
#define FSR_FCC3_LT 0x10
#define FSR_FCC3_GT 0x20
#define FSR_FCC3_UN 0x30
#define FSR_FCC2_EQ 0x0
#define FSR_FCC2_LT 0x4
#define FSR_FCC2_GT 0x8
#define FSR_FCC2_UN 0xc
#define FSR_FCC1_EQ 0x0
#define FSR_FCC1_LT 0x1
#define FSR_FCC1_GT 0x2
#define FSR_FCC1_UN 0x3 
			    ! lower word
#define FSR_FCC0_EQ 0x0
#define FSR_FCC0_LT 0x400
#define FSR_FCC0_GT 0x800
#define FSR_FCC0_UN 0xc00          
    

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
	!*************************************************
	! Operand2 as a register, integer condition codes 
	!*************************************************
	add	%g0,NUM_CCR_CASES,%g3		
	set	ccr_data,%g1

ccr_loop:
	ldub	[%g1],%g2
	wr	%g0,%g2,%ccr	    ! set ccr
	call	set_dest_regs	    ! set all in/local regs to foxes
	nop
	
	mova	%icc,%g0,%i0
	movn	%icc,%g0,%i1
	movne	%icc,%g0,%i2
	move	%icc,%g0,%i3
	movg	%icc,%g0,%i4
	movle	%icc,%g0,%i5
	movge	%icc,%g0,%i6
	movl	%icc,%g0,%i7
	movgu	%icc,%g0,%l0
	movleu	%icc,%g0,%l1
	movcc	%icc,%g0,%l2
	movcs	%icc,%g0,%l3
	movpos	%icc,%g0,%l4
	movneg	%icc,%g0,%l5
	movvc	%icc,%g0,%l6
	movvs	%icc,%g0,%l7

	call	set_dest_regs	    ! set all in/local regs to foxes
	nop
	
	mova	%xcc,%g0,%i0
	movn	%xcc,%g0,%i1
	movne	%xcc,%g0,%i2
	move	%xcc,%g0,%i3
	movg	%xcc,%g0,%i4
	movle	%xcc,%g0,%i5
	movge	%xcc,%g0,%i6
	movl	%xcc,%g0,%i7
	movgu	%xcc,%g0,%l0
	movleu	%xcc,%g0,%l1
	movcc	%xcc,%g0,%l2
	movcs	%xcc,%g0,%l3
	movpos	%xcc,%g0,%l4
	movneg	%xcc,%g0,%l5
	movvc	%xcc,%g0,%l6
	movvs	%xcc,%g0,%l7
    			    
	sub	%g3,1,%g3	    ! CCR value
	brnz,pt %g3,ccr_loop
	add	%g1,1,%g1	    ! move operand pointer

	!*******************************************************
	! Operand2 as a register, floating-point condition codes 
	!*******************************************************
	wr	%g0,4,%fprs	    ! enable floating point	
    	add	%g0,NUM_CCR_CASES,%g3		
	set	fsr_data,%g1

fccr_loop:
	ldx	[%g1],%fsr	    ! set fsr (includes all fccn)
	call	set_dest_regs	    ! set all in/local regs to foxes
	nop
	
	mova	%fcc0,%g0,%i0
	movn	%fcc0,%g0,%i1
	movu	%fcc0,%g0,%i2
	movg	%fcc0,%g0,%i3
	movug	%fcc0,%g0,%i4
	movl	%fcc0,%g0,%i5
	movul	%fcc0,%g0,%i6
	movlg	%fcc0,%g0,%i7
	movne	%fcc0,%g0,%l0
	move	%fcc0,%g0,%l1
	movue	%fcc0,%g0,%l2
	movge	%fcc0,%g0,%l3
	movuge	%fcc0,%g0,%l4
	movle	%fcc0,%g0,%l5
	movule	%fcc0,%g0,%l6
	movo	%fcc0,%g0,%l7

    	call	set_dest_regs	    ! set all in/local regs to foxes
	nop
	
	mova	%fcc1,%g0,%i0
	movn	%fcc1,%g0,%i1
	movu	%fcc1,%g0,%i2
	movg	%fcc1,%g0,%i3
	movug	%fcc1,%g0,%i4
	movl	%fcc1,%g0,%i5
	movul	%fcc1,%g0,%i6
	movlg	%fcc1,%g0,%i7
	movne	%fcc1,%g0,%l0
	move	%fcc1,%g0,%l1
	movue	%fcc1,%g0,%l2
	movge	%fcc1,%g0,%l3
	movuge	%fcc1,%g0,%l4
	movle	%fcc1,%g0,%l5
	movule	%fcc1,%g0,%l6
	movo	%fcc1,%g0,%l7

    	call	set_dest_regs	    ! set all in/local regs to foxes
	nop
	
	mova	%fcc2,%g0,%i0
	movn	%fcc2,%g0,%i1
	movu	%fcc2,%g0,%i2
	movg	%fcc2,%g0,%i3
	movug	%fcc2,%g0,%i4
	movl	%fcc2,%g0,%i5
	movul	%fcc2,%g0,%i6
	movlg	%fcc2,%g0,%i7
	movne	%fcc2,%g0,%l0
	move	%fcc2,%g0,%l1
	movue	%fcc2,%g0,%l2
	movge	%fcc2,%g0,%l3
	movuge	%fcc2,%g0,%l4
	movle	%fcc2,%g0,%l5
	movule	%fcc2,%g0,%l6
	movo	%fcc2,%g0,%l7

    	call	set_dest_regs	    ! set all in/local regs to foxes
	nop
	
	mova	%fcc3,%g0,%i0
	movn	%fcc3,%g0,%i1
	movu	%fcc3,%g0,%i2
	movg	%fcc3,%g0,%i3
	movug	%fcc3,%g0,%i4
	movl	%fcc3,%g0,%i5
	movul	%fcc3,%g0,%i6
	movlg	%fcc3,%g0,%i7
	movne	%fcc3,%g0,%l0
	move	%fcc3,%g0,%l1
	movue	%fcc3,%g0,%l2
	movge	%fcc3,%g0,%l3
	movuge	%fcc3,%g0,%l4
	movle	%fcc3,%g0,%l5
	movule	%fcc3,%g0,%l6
	movo	%fcc3,%g0,%l7
    
    	sub	%g3,1,%g3	    ! FCCn values
	brnz,pt %g3,fccr_loop
	add	%g1,8,%g1	    ! move operand pointer

	!*******************************************************
	! Operand2 as a register, register condition 
	!*******************************************************
   	add	%g0,NUM_MOVR_CASES,%g3		
	set	movr_data,%g1
	wr	%g0,0xff,%ccr	    ! set ccr. Should not matter

movr_loop:
	call	set_dest_regs	    ! set all in/local regs to foxes
	ldx	[%g1],%g2

	movrz	%g2,%g0,%i0
	movrlez	%g2,%g0,%l0
	movrlz	%g2,%g0,%i1
	movrnz	%g2,%g0,%l1
	movrgz	%g2,%g0,%i2
	movrgez	%g2,%g0,%l2

	sub	%g3,1,%g3
	brnz,pt	%g3,movr_loop
	add	%g1,8,%g1
    
	!**************************
	! Operand2 as immediate 
	!**************************    
	add	%g0,NUM_CCRi_CASES,%g3		
	set	ccri_data,%g1

ccri_loop:
	ldub	[%g1],%g2
	call	set_dest_regs	    ! set all in/local regs to foxes
	wr	%g0,%g2,%ccr	    ! set ccr
	
	mova	%icc,0x000,%i0
	movn	%icc,0x001,%i1
	movne	%icc,0x700,%i2
	move	%icc,0x401,%i3
	movg	%icc,0x333,%i4
	movle	%icc,0x000,%i5
	movge	%icc,0x002,%i6
	movl	%icc,0x004,%i7
	movgu	%icc,0x008,%l0
	movleu	%icc,0x010,%l1
	movcc	%icc,0x020,%l2
	movcs	%icc,0x040,%l3
	movpos	%icc,0x080,%l4
	movneg	%icc,0x100,%l5
	movvc	%icc,0x200,%l6
	movvs	%icc,0x400,%l7

	call	set_dest_regs	    ! set all in/local regs to foxes
	nop
	
	mova	%xcc,0x400,%i0
	movn	%xcc,0x401,%i1
	movne	%xcc,0x402,%i2
	move	%xcc,0x404,%i3
	movg	%xcc,0x408,%i4
	movle	%xcc,0x410,%i5
	movge	%xcc,0x420,%i6
	movl	%xcc,0x440,%i7
	movgu	%xcc,0x480,%l0
	movleu	%xcc,0x500,%l1
	movcc	%xcc,0x600,%l2
	movcs	%xcc,0x7ee,%l3
	movpos	%xcc,0x3ee,%l4
	movneg	%xcc,0x3ff,%l5
	movvc	%xcc,0x222,%l6
	movvs	%xcc,0x001,%l7
    			    
	sub	%g3,1,%g3	    ! CCR value
	brnz,pt %g3,ccri_loop
	add	%g1,1,%g1	    ! move operand pointer


	! these cases do the move
	set	fsr_immed,%g1
	ldx	[%g1],%fsr
    	call	set_dest_regs	    ! set all in/local regs to foxes
	nop
	mova	%fcc3,0x000,%i0
	movn	%fcc0,0x6ff,%i1	    ! except this one
	movu	%fcc3,0x001,%i2
	movg	%fcc1,0x515,%i3
	movug	%fcc1,0x404,%i4
	movl	%fcc2,0x303,%i5
	movul	%fcc2,0x101,%i6
	movlg	%fcc1,0x111,%i7
	movne	%fcc3,0x222,%l0
	move	%fcc0,0x333,%l1
	movue	%fcc3,0x444,%l2
	movge	%fcc1,0x555,%l3
	movuge	%fcc3,0x666,%l4
	movle	%fcc0,0x777,%l5
	movule	%fcc2,0x0ff,%l6
	movo	%fcc2,0x000,%l7

	! these cases do not move
	call	set_dest_regs	    ! set all in/local regs to foxes
	nop
	mova	%fcc2,0x000,%i0	    ! except this one
	movn	%fcc1,0x6ff,%i1	   
	movu	%fcc2,0x001,%i2
	movg	%fcc0,0x515,%i3
	movug	%fcc2,0x404,%i4
	movl	%fcc3,0x303,%i5
	movul	%fcc1,0x101,%i6
	movlg	%fcc0,0x111,%i7
	movne	%fcc0,0x222,%l0
	move	%fcc3,0x333,%l1
	movue	%fcc1,0x444,%l2
	movge	%fcc3,0x555,%l3
	movuge	%fcc2,0x666,%l4
	movle	%fcc1,0x777,%l5
	movule	%fcc1,0x0ff,%l6
	movo	%fcc3,0x000,%l7
    
   	add	%g0,NUM_MOVR_CASES,%g3		
	set	movr_data,%g1	    ! same data as movr_loop cases
	wr	%g0,0x00,%ccr	    ! clear ccr. Should not matter

movri_loop:
	call	set_dest_regs	    ! set all in/local regs to foxes
	ldx	[%g1],%g2

	movrz	%g2,0x000,%i0
	movrlez	%g2,0x3fe,%l0
	movrlz	%g2,0x1ff,%i1
	movrnz	%g2,0x2aa,%l1
	movrgz	%g2,0x155,%i2
	movrgez	%g2,0x231,%l2

	sub	%g3,1,%g3
	brnz,pt	%g3,movri_loop
	add	%g1,8,%g1
    
good_end:   
	ta	T_GOOD_TRAP
	nop
	nop    

	! set all in and local regs to -1
set_dest_regs:	
	sub	%g0,1,%i0    
	sub	%g0,1,%i1    
	sub	%g0,1,%i2    
	sub	%g0,1,%i3    
	sub	%g0,1,%i4    
	sub	%g0,1,%i5    
	sub	%g0,1,%i6    
	sub	%g0,1,%i7    
	sub	%g0,1,%l0    
	sub	%g0,1,%l1   
	sub	%g0,1,%l2    
	sub	%g0,1,%l3    
	sub	%g0,1,%l4    
	sub	%g0,1,%l5    
	sub	%g0,1,%l6    
	sub	%g0,1,%l7    
	retl			! return uses %o7
	nop
!==========================    
.data
.align 0x1fff+1

ccr_data:                   
        .byte	0x00
	.byte	0x01
	.byte	0x12
	.byte	0x24
	.byte	0x48
	.byte	0x8b
	.byte	0x3f
	.byte	0x5e
	.byte	0x7d
	.byte	0x9c
	.byte	0xa6

ccri_data:                   
        .byte	0x80
	.byte	0x01
	.byte	0x12
	.byte	0x24
	.byte	0x48        

.align 0x10
fsr_data:
	.word 0x00000000, 0x00000000
	.word FSR_FCC3_LT+FSR_FCC2_GT+FSR_FCC1_UN, FSR_FCC0_LT
	.word FSR_FCC3_GT+FSR_FCC2_UN+FSR_FCC1_LT, FSR_FCC0_UN
    	.word FSR_FCC3_UN+FSR_FCC2_LT+FSR_FCC1_GT, FSR_FCC0_GT

fsr_immed:  
	.word FSR_FCC3_UN+FSR_FCC2_LT+FSR_FCC1_GT, FSR_FCC0_EQ  

movr_data:  
	.word 0x00000000, 0x00000000	! =0
	.word 0x00000000, 0x80000000	! >0 
	.word 0x80000000, 0x00000000	! <0       
     

.end
