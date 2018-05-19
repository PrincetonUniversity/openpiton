// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: exu_ecc_mixed_ce.s
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
 * Name:    exu_ecc_mixed_ce.s
 * Date:    July 15, 2003
 *
 *  Description: Execute an assortment of instructions with correctable
 *	    errors on RS1, RS2, and RS3 in combinations of 2 and 3 errors. 
 *	    This is not an exhaustive test.
 *
 *  Must not run with SAS (traps are enabled) 
 *  Must run with -sim_run_args=+asm_err_en
 *  May run with -sim_run_args=+err_inj_dbg
 **********************************************************************/
!SIMS+ARGS: -sim_run_args=+asm_err_en -sim_run_args=+err_inj_dbg -nosas
    
#define  H_HT0_Corrected_ECC_error_0x63 hyp_ecc_ce_trap


! for taddcctv cases
#define H_T0_Tag_Overflow
#define My_T0_Tag_Overflow \
	wrpr	%g0,0,%gl	; \
	add	%g6,1,%g6; \
	done			; \
	nop; nop; nop; nop; nop;

! for divide by zero cases
#define H_T0_Division_By_Zero
#define My_T0_Division_By_Zero \
	wrpr	%g0,0,%gl	; \
	add	%g6,1,%g6; \
	done			; \
	nop; nop; nop; nop; nop;


#define TRAP_TAKEN     0x7ff
#define TRAP_NOT_TAKEN 0xd0a
#define DUMMY_TRAP     0x131
#define H_T0_Trap_Instruction_1
#define My_T0_Trap_Instruction_1 \
	wrpr	%g0,0,%gl	; \
	add	%g0,TRAP_TAKEN,%g6; \
	done			; \
	nop; nop; nop; nop; nop;
       
#define  MAIN_PAGE_HV_ALSO             
#include "boot.s"

.global main
main:

	setx	reg_data,%l0,%g1
	ldx	[%g1],%l1
	ldx	[%g1+0x08],%l2
	ldx	[%g1+0x10],%l3
	ldx	[%g1+0x18],%l4
	ldx	[%g1+0x20],%l5
	ldx	[%g1+0x28],%l6
	ldx	[%g1+0x30],%l7
	ldx	[%g1+0x38],%i1
	ldx	[%g1+0x40],%i2

#define DATAP %g1
#define SDATAP %g2     
	setx	target_primary,%l0,DATAP
	setx	target_secondary,%l0,SDATAP
    
        
	!**********************
	! Arithmetic Ops
	!**********************
    	wr	%g0,%g0,%ccr	    

!$EV error(0,expr(@VA(.MAIN.RSmx_ce_add),16,16),1,IRF, CE,0,x, CE,0,x, x,x,x)
	add	%g0,0,%g5
	add	%i1,%i3,%i0
RSmx_ce_add:     
    	add	%i1,%i3,%l0
	cmp	%l0,%i0
	tne	T_BAD_TRAP
	subcc	%g5,2,%g0
	tne	T_BAD_TRAP   

!$EV error(0,expr(@VA(.MAIN.RSmx_ce_addc),16,16),1,IRF, CE,1,x, CE,71,x, x,x,x) 
	add	%g0,0,%g5
	addc	%l2,%l1,%i0
RSmx_ce_addc:     
	addc	%l2,%l1,%l0
    	cmp	%l0,%i0
	tne	T_BAD_TRAP	    
	subcc	%g5,2,%g0
	tne	T_BAD_TRAP   
    			
!$EV error(0,expr(@VA(.MAIN.RSmx_ce_taddcctv),16,16),1,IRF, CE,5,x, CE,70,x, x,x,x)
	add	%g0,0,%g5
	taddcctv %l5,%l1,%i0	    ! no tag_overflow
RSmx_ce_taddcctv:     
	taddcctv %l5,%l1,%l0
    	cmp	%l0,%i0
	tne	T_BAD_TRAP			    
	subcc	%g5,2,%g0
	tne	T_BAD_TRAP      	    
    				    
!$EV error(0,expr(@VA(.MAIN.RSmx_ce_tsubcctv_ov1),16,16),1,IRF, CE,1,x, CE,0,x, x,x,x) 
	add	%g0,0,%g5
	tsubcctv %i1,%l1,%i0	    ! no tag_overflow
RSmx_ce_tsubcctv_ov1:     
	tsubcctv %i1,%l1,%l0	    ! ce on bit 1 alters overflow state
    	cmp	%l0,%i0
	tne	T_BAD_TRAP
	subcc	%g5,2,%g0
	tne	T_BAD_TRAP   

 	!************************************
	! tag_overflow exceptions and ce
	!************************************
!$EV error(0,expr(@VA(.MAIN.RSmx_ce_taddcctv_ov),16,16),1,IRF, CE,5,x, CE,0,x, x,x,x)
	add	%g0,0,%g5
	add	%g0,0,%g6
	taddcctv %l1,%l4,%i0	    ! tag_overflow exception, op 2
	nop			    ! nops to prevent silent fix of ecc
	nop
RSmx_ce_taddcctv_ov:     
	taddcctv %l1,%l4,%l0	    ! ce alters tag_overflow state
	subcc	%g6,2,%g0	    ! expect two traps to have happened
	tne	T_BAD_TRAP
	subcc	%g5,2,%g0
	tne	T_BAD_TRAP   

!$EV error(0,expr(@VA(.MAIN.RSmx_ce_taddcctv_ov1),16,16),1,IRF, CE,65,x, CE,2,x, x,x,x)
	add	%g0,0,%g5
	add	%g0,0,%g6
	taddcctv %l6,%l1,%i0	    ! tag_overflow exception, op 1
	nop			    ! nops to prevent silent fix of ecc
	nop
RSmx_ce_taddcctv_ov1:     
	taddcctv %l6,%l1,%l0	    ! ce does not alter tag_overflow state
	subcc	%g6,2,%g0	    ! expect two traps to have happened
	tne	T_BAD_TRAP    
	subcc	%g5,2,%g0
	tne	T_BAD_TRAP   

!$EV error(0,expr(@VA(.MAIN.RSmx_ce_tsubcctv_ov2),16,16),1,IRF, CE,0,x, CE,1,x, x,x,x) 
	add	%g0,0,%g5
	add	%g0,0,%g6
	tsubcctv %i2,%l1,%i0	    ! tag_overflow
	nop			    ! nops to prevent silent fix of ecc
	nop
RSmx_ce_tsubcctv_ov2:     
	tsubcctv %i2,%l1,%l0	    ! ce alters overflow state
	subcc	%g6,2,%g0	    ! expect two traps to have happened
	tne	T_BAD_TRAP
	subcc	%g5,2,%g0
	tne	T_BAD_TRAP   

 	!********************************************************************
	! Design change: instructions which are cancelled are no longer
      ! silently fixed 9/24/03
	!********************************************************************    
!$EV error(0,expr(@VA(.MAIN.RSmx_ce_taddcctv_ov3),16,16),1,IRF, CE,5,x, CE,0,x, x,x,x)
	add	%g0,0,%g5
	add	%g0,0,%g6
	ba	%icc,bypass_1
	nop
.align 0x20
bypass_1:			    ! guarantee no icache miss
	nop 
    	taddcctv %l1,%l4,%i0	    ! tag_overflow exception, op 2
RSmx_ce_taddcctv_ov3:     
	taddcctv %l1,%l4,%l0	    ! ce alters tag_overflow state
	subcc	%g6,2,%g0	    ! expect two traps to have happened
	tne	T_BAD_TRAP
	subcc	%g5,2,%g0
	tne	T_BAD_TRAP   

!$EV error(0,expr(@VA(.MAIN.RSmx_ce_taddcctv_ov4),16,16),1,IRF, CE,65,x, CE,2,x, x,x,x)
	add	%g0,0,%g5
	add	%g0,0,%g6
	ba	%icc,bypass_2
	nop
.align 0x20
bypass_2:			    ! guarantee no icache miss
	nop 
    	taddcctv %l6,%l1,%i0	    ! tag_overflow exception, op 1
RSmx_ce_taddcctv_ov4:     
	taddcctv %l6,%l1,%l0	    ! ce does not alter tag_overflow state
	subcc	%g6,2,%g0	    ! expect two traps to have happened
	tne	T_BAD_TRAP    
	subcc	%g5,2,%g0
	tne	T_BAD_TRAP   

!$EV error(0,expr(@VA(.MAIN.RSmx_ce_tsubcctv_ov5),16,16),1,IRF, CE,0,x, CE,1,x, x,x,x) 
	add	%g0,0,%g5
	add	%g0,0,%g6
	ba	%icc,bypass_3
	nop
.align 0x20
bypass_3:			    ! guarantee no icache miss
	nop 
    	tsubcctv %i2,%l1,%i0	    ! tag_overflow
RSmx_ce_tsubcctv_ov5:     
	tsubcctv %i2,%l1,%l0	    ! ce alters overflow state
	subcc	%g6,2,%g0	    ! expect two traps to have happened
	tne	T_BAD_TRAP
	subcc	%g5,2,%g0
	tne	T_BAD_TRAP
    
	!*******************
	! Logical ops
	!*******************
!$EV error(0,expr(@VA(.MAIN.RSmx_ce_and),16,16),1,IRF, CE,12,x, CE,70,x, x,x,x)
	add	%g0,0,%g5
	and	%l1,%l2,%i0
RSmx_ce_and:     
    	and	%l1,%l2,%l0
	cmp	%l0,%i0
	tne	T_BAD_TRAP
	subcc	%g5,2,%g0
	tne	T_BAD_TRAP   

	!***********************
	! Multiply, divide  ops
	!***********************
!$EV error(0,expr(@VA(.MAIN.RSmx_ce_mulx),16,16),1,IRF, CE,24,x, CE,12,x, x,x,x) 
	add	%g0,0,%g5
	mulx	%l5,%l2,%i0
RSmx_ce_mulx:     
	mulx	%l5,%l2,%l0
    	cmp	%l0,%i0
	tne	T_BAD_TRAP
	subcc	%g5,2,%g0
	tne	T_BAD_TRAP   
    				    
!$EV error(0,expr(@VA(.MAIN.RSmx_ce_umul),16,16),1,IRF, CE,25,x, CE,60,x, x,x,x) 
	add	%g0,0,%g5
	umul	%l6,%l7,%i0
RSmx_ce_umul:     
	umul	%l6,%l7,%l0
    	cmp	%l0,%i0
	tne	T_BAD_TRAP
	subcc	%g5,2,%g0
	tne	T_BAD_TRAP   

!$EV error(0,expr(@VA(.MAIN.RSmx_ce_smul),16,16),1,IRF, CE,69,x, CE,3,x, x,x,x) 
	add	%g0,0,%g5
	smul	%l5,%l3,%i0
RSmx_ce_smul:     
	smul	%l5,%l3,%l0
    	cmp	%l0,%i0
	tne	T_BAD_TRAP
	subcc	%g5,2,%g0
	tne	T_BAD_TRAP   
    				    
!$EV error(0,expr(@VA(.MAIN.RSmx_ce_mulscc),16,16),1,IRF, CE,29,x, CE,33,x, x,x,x) 
	add	%g0,0,%g5
    	wr	%l0,%g0,%y 
	mulscc	%l6,%l4,%i0
    	wr	%l0,%g0,%y 
RSmx_ce_mulscc:     
	mulscc	%l6,%l4,%l0
    	cmp	%l0,%i0
	tne	T_BAD_TRAP
	subcc	%g5,2,%g0
	tne	T_BAD_TRAP   

!$EV error(0,expr(@VA(.MAIN.RSmx_ce_sdivx),16,16),1,IRF, CE,30,x, CE,68,x, x,x,x) 
	add	%g0,0,%g5
	sdivx	%l5,%l2,%i0
RSmx_ce_sdivx:     
	sdivx	%l5,%l2,%l0
    	cmp	%l0,%i0
	tne	T_BAD_TRAP
	subcc	%g5,2,%g0
	tne	T_BAD_TRAP   
    				    
!$EV error(0,expr(@VA(.MAIN.RSmx_ce_udivx),16,16),1,IRF, CE,35,x, CE,10,x, x,x,x) 
	add	%g0,0,%g5
	udivx	%l6,%l7,%i0
RSmx_ce_udivx:     
	udivx	%l6,%l7,%l0
    	cmp	%l0,%i0
	tne	T_BAD_TRAP
	subcc	%g5,2,%g0
	tne	T_BAD_TRAP   

	! for 32-bit divides, create CE on both lower and upper half of rs1
	! upper half of rs1 is unused by the operation...

!$EV error(0,expr(@VA(.MAIN.RSmx_ce_sdiv_lo),16,16),1,IRF, CE,26,x, CE,67,x, x,x,x)
	add	%g0,0,%g5
    	wr	%l0,%g0,%y 
	sdiv	%l2,%l3,%i0
RSmx_ce_sdiv_lo:     
	sdiv	%l2,%l3,%l0
    	cmp	%l0,%i0
	tne	T_BAD_TRAP
	subcc	%g5,2,%g0
	tne	T_BAD_TRAP   

!$EV error(0,expr(@VA(.MAIN.RSmx_ce_sdiv_hi),16,16),1,IRF, CE,66,x, CE,13,x, x,x,x)
	add	%g0,0,%g5
    	wr	%l0,%g0,%y 
	sdiv	%l2,%l3,%i0
RSmx_ce_sdiv_hi:     
	sdiv	%l2,%l3,%l0
    	cmp	%l0,%i0
	tne	T_BAD_TRAP
	subcc	%g5,2,%g0
	tne	T_BAD_TRAP   
    

	!*********************
	! divide by zero cases
	!*********************
!$EV error(0,expr(@VA(.MAIN.RSmx_ce_sdivx_0),16,16),1,IRF, CE,31,x, CE,0,x, x,x,x)
	add	%g0,0,%g5
	add	%g0,0,%g6 
	sdivx	%l5,%l1,%i0
RSmx_ce_sdivx_0:     
	sdivx	%l5,%l1,%l0
    	subcc	%g6,2,%g0	! expect 2 traps
	tne	T_BAD_TRAP
	subcc	%g5,2,%g0
	tne	T_BAD_TRAP   
    				    
!$EV error(0,expr(@VA(.MAIN.RSmx_ce_udivx_0),16,16),1,IRF, CE,32,x, CE,66,x, x,x,x) 
	add	%g0,0,%g5
	add	%g0,0,%g6 
	udivx	%l6,%l1,%i0
RSmx_ce_udivx_0:     
	udivx	%l6,%l1,%l0
    	subcc	%g6,2,%g0	! expect 2 traps
	tne	T_BAD_TRAP    
	subcc	%g5,2,%g0
	tne	T_BAD_TRAP   

	!************************************************************
	! CAS ops have rs1, rs2, and rs3
	!************************************************************
	! CASXA
	setx	target_secondary,%l0,%o1

!$EV error(0,expr(@VA(.MAIN.RSmx_ce_casxa1),16,16),1,IRF, CE,33,x, CE,5,x, x,x,x) 
    	add	%g0,0,%g5
	add	%l2,%g0,%o2
	add	%l3,%g0,%o3
	stxa	%o2,[%o1]ASI_SECONDARY
	nop
	nop
	nop
	nop
RSmx_ce_casxa1: 
	casxa	[%o1]ASI_SECONDARY,%o2,%o3 
	cmp	%l2,%o3
	tne	T_BAD_TRAP
	ldxa	[%o1]ASI_SECONDARY,%o6
	cmp	%o6,%l3
	tne	T_BAD_TRAP
	subcc	%g5,2,%g0
	tne	T_BAD_TRAP 
    
!$EV error(0,expr(@VA(.MAIN.RSmx_ce_casxa2),16,16),1,IRF, CE,34,x,, x,x,x CE,6,x) 
    	add	%g0,0,%g5
	add	%l4,%g0,%o2
	add	%l5,%g0,%o3
	stxa	%o2,[%o1]ASI_SECONDARY
	nop
	nop
	nop
	nop
RSmx_ce_casxa2: 
	casxa	[%o1]ASI_SECONDARY,%o2,%o3 
	cmp	%l4,%o3
	tne	T_BAD_TRAP
	ldxa	[%o1]ASI_SECONDARY,%o6
	cmp	%o6,%l5
	tne	T_BAD_TRAP
	subcc	%g5,2,%g0
	tne	T_BAD_TRAP 
    
!$EV error(0,expr(@VA(.MAIN.RSmx_ce_casxa3),16,16),1,IRF, x,x,x, CE,35,x, CE,5,x) 
    	add	%g0,0,%g5
	add	%l6,%g0,%o2
	add	%l7,%g0,%o3
	stxa	%o2,[%o1]ASI_SECONDARY
	nop
	nop
	nop
	nop
RSmx_ce_casxa3: 
	casxa	[%o1]ASI_SECONDARY,%o2,%o3 
	cmp	%l6,%o3
	tne	T_BAD_TRAP
	ldxa	[%o1]ASI_SECONDARY,%o6
	cmp	%o6,%l7
	tne	T_BAD_TRAP
	subcc	%g5,2,%g0
	tne	T_BAD_TRAP     

    	add	%g0,0,%g5
	add	%l1,%g0,%o2
	add	%l2,%g0,%o3
	stxa	%o2,[%o1]ASI_SECONDARY
	nop
	nop
	nop
	nop
!$EV error(0,expr(@VA(.MAIN.RSmx_ce_casxa4),16,16),1,IRF, CE,66,x, CE,35,x, CE,5,x) 
RSmx_ce_casxa4: 
	casxa	[%o1]ASI_SECONDARY,%o2,%o3 
	cmp	%l1,%o3
	tne	T_BAD_TRAP
	ldxa	[%o1]ASI_SECONDARY,%o6
	cmp	%o6,%l2
	tne	T_BAD_TRAP
	subcc	%g5,3,%g0
	tne	T_BAD_TRAP     

	!**********************
	! CASA
!$EV error(0,expr(@VA(.MAIN.RSmx_ce_casa1),16,16),1,IRF, CE,0,x, CE,15,x, x,x,x) 
	add	%g0,0,%g5
	add	%i2,%g0,%o2
	add	%g0,%g0,%o3
	stwa	%o2,[%o1]ASI_SECONDARY
	nop
	nop
	nop
	nop
RSmx_ce_casa1: 
	casa	[%o1]ASI_SECONDARY,%o2,%o3 
	cmp	%i2,%o3
	tne	T_BAD_TRAP   
	lduwa	[%o1]ASI_SECONDARY,%o6
	cmp	%o6,%g0
	tne	T_BAD_TRAP
	subcc	%g5,2,%g0
	tne	T_BAD_TRAP   
 
!$EV error(0,expr(@VA(.MAIN.RSmx_ce_casa2),16,16),1,IRF, CE,1,x, x,x,x, CE,45,x) 
	add	%g0,0,%g5
	add	%i1,%g0,%o2
	add	%i2,%g0,%o3
	stwa	%o2,[%o1]ASI_SECONDARY
	nop
	nop
	nop
	nop
RSmx_ce_casa2: 
	casa	[%o1]ASI_SECONDARY,%o2,%o3 
	cmp	%i1,%o3
	tne	T_BAD_TRAP   
	lduwa	[%o1]ASI_SECONDARY,%o6
	cmp	%o6,%i2
	tne	T_BAD_TRAP
	subcc	%g5,2,%g0
	tne	T_BAD_TRAP   
 
!$EV error(0,expr(@VA(.MAIN.RSmx_ce_casa3),16,16),1,IRF, x,x,x, CE,32,x, CE,0,x) 
	add	%g0,0,%g5
	add	%g0,%g0,%o2
	add	%i1,%g0,%o3
	stwa	%o2,[%o1]ASI_SECONDARY
	nop
	nop
	nop
	nop
RSmx_ce_casa3: 
	casa	[%o1]ASI_SECONDARY,%o2,%o3 
	cmp	%g0,%o3
	tne	T_BAD_TRAP   
	lduwa	[%o1]ASI_SECONDARY,%o6
	cmp	%o6,%i1
	tne	T_BAD_TRAP
	subcc	%g5,2,%g0
	tne	T_BAD_TRAP  
    
!$EV error(0,expr(@VA(.MAIN.RSmx_ce_casa4),16,16),1,IRF, CE,1,x, CE,33,x, CE,24,x) 
	add	%g0,0,%g5
	add	%i2,%g0,%o2
	add	%i1,%g0,%o3
	stwa	%o2,[%o1]ASI_SECONDARY
	nop
	nop
	nop
	nop
RSmx_ce_casa4: 
	casa	[%o1]ASI_SECONDARY,%o2,%o3 
	cmp	%i2,%o3
	tne	T_BAD_TRAP   
	lduwa	[%o1]ASI_SECONDARY,%o6
	cmp	%o6,%i1
	tne	T_BAD_TRAP
	subcc	%g5,3,%g0
	tne	T_BAD_TRAP    



	!**********************************************
	! Several cases with rs1+rs2 as an address
	!**********************************************

	!******
    	! FLUSH
    	setx	dummy_addr,%l0,%o1
	add	%g0,32,%o2
	nop
	nop
	nop
	nop
!$EV error(0,expr(@VA(.MAIN.RS2_ce_flush),16,16),1,IRF, CE,70,x, CE,16,x, x,x,x) 
	add	%g0,0,%g5
RS2_ce_flush:	
	flush	%o1+%o2
	subcc	%g5,2,%g0
	tne	T_BAD_TRAP   

	!*****
	! JMPL
	setx	jmpl_target,%l0,%o1
	sub	%o1,15,%o1
	add	%g0,15,%o2
	nop
	nop
	nop
	nop
!$EV error(0,expr(@VA(.MAIN.RS2_ce_jmpl),16,16),1,IRF, CE,69,x, CE,17,x, x,x,x) 
	add	%g0,0,%g5
RS2_ce_jmpl:    
	jmpl	%o1+%o2,%o3
	nop
	nop
	ta	T_BAD_TRAP
jmpl_target:	
	subcc	%g5,2,%g0
	tne	T_BAD_TRAP   

	!*********
	! LDX, LDD
	setx	reg_data,%l0,%o1
	add	%g0,0x10,%l0
	nop
	nop
	nop
	nop
!$EV error(0,expr(@VA(.MAIN.RS2_ce_ldx),16,16),1,IRF, CE,68,x, CE,18,x, x,x,x) 
	add	%g0,0,%g5
RS2_ce_ldx:    
	ldx	[%o1+%l0],%o2
	cmp	%o2,%l3
	tne	T_BAD_TRAP
	subcc	%g5,2,%g0
	tne	T_BAD_TRAP   
    
!$EV error(0,expr(@VA(.MAIN.RS2_ce_ldd),16,16),1,IRF, CE,67,x, CE,19,x, x,x,x)
	add	%g0,0,%g5
	sub	%g0,1,%o2
	sub	%g0,1,%o3
	add	%g0,0x38,%l0
	nop
	nop
	nop
	nop
RS2_ce_ldd:    
	ldd	[%o1+%l0],%o2
	cmp	%g0,%o2
	tne	T_BAD_TRAP
	cmp	%i1,%o3
	tne	T_BAD_TRAP    
	subcc	%g5,2,%g0
	tne	T_BAD_TRAP 
    
	!*****************************************************
	! MOVE on register condition, rs1 is rcc, rs2 is data    
	!*****************************************************
!$EV error(0,expr(@VA(.MAIN.RSmx_ce_movrz),16,16),1,IRF, CE,42,x, CE,24,x, x,x,x) 
	add	%g0,0,%g5
RSmx_ce_movrz:    
	movrz	%l1,%l4,%o2
	cmp	%o2,%l4
	tne	T_BAD_TRAP  
	subcc	%g5,2,%g0
	tne	T_BAD_TRAP    
    
	!*******************
	! Shift ops
	!*******************
!$EV error(0,expr(@VA(.MAIN.RSmx_ce_sll),16,16),1,IRF, CE,48,x, CE,1,x, x,x,x)
	add	%g0,0,%g5
	sll	%l2,%l3,%i0
RSmx_ce_sll:     
    	sll	%l2,%l3,%l0
	cmp	%l0,%i0
	tne	T_BAD_TRAP
	subcc	%g5,2,%g0
	tne	T_BAD_TRAP   

	!********************************************
	! Trap instructions
	!********************************************
	add	%g0,DUMMY_TRAP,%l0
	add	%g0,0,%o0
	nop
	nop
	nop
	nop
	add	%g0,TRAP_NOT_TAKEN,%g6
!$EV error(0,expr(@VA(.MAIN.RSmx_ce_tg),16,16),1,IRF, CE,1,x, CE,0,x, x,x,x)
	wr	%g0,0x40,%ccr
	add	%g0,0,%g5
RSmx_ce_tg:
	tg	%icc,%o0+%l0
	subcc	%g6,TRAP_TAKEN,%g0   ! trap instruction
	tne	T_BAD_TRAP 
	subcc	%g5,2,%g0            ! CE trap
	tne	T_BAD_TRAP   

	wr	%g0,0x04,%ccr
	add	%g0,TRAP_NOT_TAKEN,%g6
!$EV error(0,expr(@VA(.MAIN.RSmx_ce_tne),16,16),1,IRF, CE,2,x, CE,1,x, x,x,x)
	add	%g0,0,%g5
RSmx_ce_tne:
	tne	%xcc,%o0+%l0
	subcc	%g6,TRAP_TAKEN,%g0      ! trap instruction
	tne	T_BAD_TRAP 
	subcc	%g5,2,%g0               ! ce trap
	tne	T_BAD_TRAP      

	!*************************************************
	! Save/Restore
	!*************************************************
!$EV error(0,expr(@VA(.MAIN.RSmx_ce_save),16,16),1,IRF, CE,65,x, CE,28,x, x,x,x) 
	add	%g0,0,%g5
	mova	%icc,%l5,%g3
	mova	%icc,%l2,%g4
	add	%l5,%l2,%l0
	nop
	nop
RSmx_ce_save:     
	save	%g3,%g4,%g6
	restore %g0,%g0,%g0
    	cmp	%l0,%g6
	tne	T_BAD_TRAP
	subcc	%g5,2,%g0
	tne	T_BAD_TRAP   

!$EV error(0,expr(@VA(.MAIN.RSmx_ce_restore),16,16),1,IRF, CE,64,x, CE,29,x, x,x,x) 
	add	%g0,0,%g5
	mova	%icc,%l3,%g3
	mova	%icc,%l4,%g4
	add	%l3,%l4,%l0
	save	%g0,%g0,%g0
RSmx_ce_restore:     
	restore	%g3,%g4,%g6
    	cmp	%l0,%g6
	tne	T_BAD_TRAP
	subcc	%g5,2,%g0
	tne	T_BAD_TRAP  

	!*************************************************
	! Write status and privileged regs
	!*************************************************
	ta	T_CHANGE_PRIV
!$EV error(0,expr(@VA(.MAIN.RSmx_ce_wrpr),16,16),1,IRF, CE,1,x, CE,30,x, x,x,x)
	add	%g0,0,%g5
	add	%g0,5,%l0
	nop
	nop
	nop
	nop
RSmx_ce_wrpr:
	wrpr	%l0,%l1,%cansave
	rdpr	%cansave,%i0
	cmp	%l0,%i0
	tne	T_BAD_TRAP
	subcc	%g5,2,%g0
	tne	T_BAD_TRAP
    	ta	T_CHANGE_NONPRIV

!$EV error(0,expr(@VA(.MAIN.RSmx_ce_wr),16,16),1,IRF, CE,2,x, CE,31,x, x,x,x)
	add	%g0,0,%g5
RSmx_ce_wr:     
	wr	%i1,%l1,%y
	rd	%y,%l0
	subcc	%i1,%l0,%g0
	tne	T_BAD_TRAP
	subcc	%g5,2,%g0
	tne	T_BAD_TRAP       
   
    	!**********************
	! Store
	!**********************
!$EV error(0,expr(@VA(.MAIN.RSmx_ce_stx1),16,16),1,IRF, CE,8,x, x,x,x, CE,0,x)
	add	%g0,0,%g5
RSmx_ce_stx1:     
    	stx	%l2,[DATAP+0x00]
	ldx	[DATAP+0x00],%l0
	cmp	%l0,%l2
	tne	T_BAD_TRAP
	subcc	%g5,2,%g0
	tne	T_BAD_TRAP

!$EV error(0,expr(@VA(.MAIN.RSmx_ce_stx2),16,16),1,IRF, x,x,x, CE,7,x, CE,0,x)
	add	%g0,0,%g5
RSmx_ce_stx2:     
    	stx	%l4,[DATAP+%l1]
	ldx	[DATAP+%l1],%l0
	cmp	%l0,%l4
	tne	T_BAD_TRAP
	subcc	%g5,2,%g0
	tne	T_BAD_TRAP    

!$EV error(0,expr(@VA(.MAIN.RSmx_ce_stx3),16,16),1,IRF, CE,0,x, CE,7,x, CE,0,x)
	add	%g0,0,%g5
RSmx_ce_stx3:     
    	stx	%l3,[DATAP+%l1]
	ldx	[DATAP+%l1],%l0
	cmp	%l0,%l3
	tne	T_BAD_TRAP
	subcc	%g5,3,%g0
	tne	T_BAD_TRAP
    
!$EV error(0,expr(@VA(.MAIN.RSmx_ce_std1),16,16),1,IRF, CE,1,x, x,x,x, CE,4,x)
	add	%g0,0,%g5
RSmx_ce_std1:     
    	std	%l6,[DATAP+%l1]
	ldd	[DATAP+%l1],%i0
	srl	%l6,0,%o0
	cmp	%i0,%o0
	tne	T_BAD_TRAP    
    	srl	%l7,0,%o1
	cmp	%i1,%o1
	tne	T_BAD_TRAP    
	subcc	%g5,2,%g0
	tne	T_BAD_TRAP 
    
!$EV error(0,expr(@VA(.MAIN.RSmx_ce_std2),16,16),1,IRF, x,x,x, CE,1,x, CE,4,x)
	add	%g0,0,%g5
RSmx_ce_std2:     
    	std	%l2,[DATAP+%l1]
	ldd	[DATAP+%l1],%i0
	srl	%l2,0,%o0
	cmp	%i0,%o0
	tne	T_BAD_TRAP    
    	srl	%l3,0,%o1
	cmp	%i1,%o1
	tne	T_BAD_TRAP    
	subcc	%g5,2,%g0
	tne	T_BAD_TRAP 
    
!$EV error(0,expr(@VA(.MAIN.RSmx_ce_std3),16,16),1,IRF, CE,2,x, CE,15,x, CE,4,x)
	add	%g0,0,%g5
RSmx_ce_std3:     
    	std	%l4,[DATAP+%l1]
	ldd	[DATAP+%l1],%i0
	srl	%l4,0,%o0
	cmp	%i0,%o0
	tne	T_BAD_TRAP    
    	srl	%l5,0,%o1
	cmp	%i1,%o1
	tne	T_BAD_TRAP    
	subcc	%g5,3,%g0
	tne	T_BAD_TRAP           
        
	!*******************
	! SWAP/SWAPA
	!*******************
	add	%g0,0,%g5
	add	%i2,%g0,%o2
	stw	%i1,[DATAP+%l1]
	nop
	nop
	nop
	nop
!$EV error(0,expr(@VA(.MAIN.RSmx_ce_swap1),16,16),1,IRF, CE,8,x, x,x,x, CE,23,x) 
RSmx_ce_swap1: 
	swap	[DATAP+%l1],%o2
	cmp	%o2,%i1
	tne	T_BAD_TRAP
	lduw	[DATAP+%l1],%o3
	cmp	%o3,%i2
	tne	T_BAD_TRAP
	subcc	%g5,2,%g0
	tne	T_BAD_TRAP

	add	%g0,0,%g5
	add	%i2,%g0,%o2
	stw	%i1,[DATAP+%l1]
	nop
	nop
	nop
	nop
!$EV error(0,expr(@VA(.MAIN.RSmx_ce_swap2),16,16),1,IRF, CE,9,x, CE,5,x, CE,63,x) 
RSmx_ce_swap2: 
	swap	[DATAP+%l1],%o2
	cmp	%o2,%i1
	tne	T_BAD_TRAP
	lduw	[DATAP+%l1],%o3
	cmp	%o3,%i2
	tne	T_BAD_TRAP
	subcc	%g5,3,%g0
	tne	T_BAD_TRAP         

    	! SWAPA
	add	%g0,0,%g5
	add	%i2,%g0,%o2
	stwa	%i1,[SDATAP+%l1]ASI_SECONDARY
	nop
	nop
	nop
	nop
!$EV error(0,expr(@VA(.MAIN.RSmx_ce_swapa),16,16),1,IRF, CE,4,x, CE,62,x, CE,64,x) 
RSmx_ce_swapa: 
	swapa	[SDATAP+%l1]ASI_SECONDARY,%o2
	cmp	%o2,%i1
	tne	T_BAD_TRAP
	lduwa	[SDATAP+%l1]ASI_SECONDARY,%o3
	cmp	%o3,%i2
	tne	T_BAD_TRAP
	subcc	%g5,3,%g0
	tne	T_BAD_TRAP     

	!********************************
	! VIS ops, alignaddr, alignaddrl
	!********************************
       	wr      %g0,0x4,%fprs
	alignaddr %l6,%l3,%i0
!$EV error(0,expr(@VA(.MAIN.RSmx_ce_align),16,16),1,IRF, CE,35,x, CE,1,x, x,x,x) 
	add	%g0,0,%g5
RSmx_ce_align:    
	alignaddr %l6,%l3,%l0
	cmp	%l0,%i0
	tne	T_BAD_TRAP
	subcc	%g5,2,%g0
	tne	T_BAD_TRAP   

	alignaddrl %l6,%l3,%i0
!$EV error(0,expr(@VA(.MAIN.RSmx_ce_alignl),16,16),1,IRF, CE,2,x, CE,2,x, x,x,x) 
	add	%g0,0,%g5
RSmx_ce_alignl:    
	alignaddrl %l6,%l3,%l0
	cmp	%l0,%i0
	tne	T_BAD_TRAP            
	subcc	%g5,2,%g0
	tne	T_BAD_TRAP   
           
good_end:   
	ta	T_GOOD_TRAP
	nop
	nop

bad_branch: 
	ta	T_BAD_TRAP    

!==========================    
.data
.align 0x1fff+1

reg_data:   
	.word 0x00000000, 0x00000000	! l1	
	.word 0xffffffff, 0xffffffff	! l2
	.word 0xaaaaaaaa, 0xaaaaaaaa	! l3
	.word 0x55555555, 0x55555555	! l4
	.word 0xf0f0f0f0, 0xf0f0f0f0	! l5
	.word 0x01234567, 0x89abcdef	! l6
	.word 0x99999999, 0x66666666    ! l7
	.word 0x00000000, 0x00123450	! i1
	.word 0x00000000, 0x00111111	! i2

dummy_addr: 
	.word 0,0
  
.align 1024
target_primary: 
	.word 0,0,0,0
	.word 0,0,0,0	
	.word 0,0,0,0
	.word 0,0,0,0
	.word 0,0,0,0
	.word 0,0,0,0
	.word 0,0,0,0
	.word 0,0,0,0      

/***********************************************************************/   
SECTION .CUST_HYP_TRAPS         TEXT_VA=0x13002000

attr_text {
	Name = .CUST_HYP_TRAPS,
	hypervisor
	}

.text

.global hyp_ecc_ce_trap
hyp_ecc_ce_trap:
    	wrpr	%g0,0,%gl
	add	%g5,1,%g5
    	retry
	nop      

!*************************************************    
#define TARGET_VA_S 0x29200000
SECTION .USER_SECONDARY         DATA_VA=TARGET_VA_S

attr_data {
	Name = .USER_SECONDARY,	
	RA = TARGET_VA_S,
	PA = ra2pa(TARGET_VA_S,0),
	part_0_d_ctx_nonzero_ps0_tsb,
	TTE_G=0,  TTE_Context=SCONTEXT, TTE_V=1,  TTE_Size=0, TTE_NFO=0, TTE_IE=0, 
	TTE_Soft2=0,   TTE_Diag=0,    TTE_Soft=0, TTE_L=0,    TTE_CP=1,  TTE_CV=0, 
	TTE_E=0,        TTE_P=0,      TTE_W=1
	}

.data
.align 1024
.global target_secondary
target_secondary:  
	.word 0,0,0,0
	.word 0,0,0,0
	.word 0,0,0,0
	.word 0,0,0,0
	.word 0,0,0,0
	.word 0,0,0,0
	.word 0,0,0,0
	.word 0,0,0,0    
.align 1024  
    
    
.end        
