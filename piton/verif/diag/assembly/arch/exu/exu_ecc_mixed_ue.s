// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: exu_ecc_mixed_ue.s
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
 * Name:    exu_ecc_mixed_ue.s
 * Date:    July 29, 2003
 *
 *  Description: Execute an assortment of instructions with correctable
 *	    and uncorrectable errors on RS1, RS2, and RS3 in combinations 
 *          of 2 and 3 errors. When a CE occurs with a UE, only the UE
 *	    causes a trap.
 *	    This is not an exhaustive test.
 *
 *  Must not run with SAS (traps are enabled) 
 *  Must run with -sim_run_args=+asm_err_en
 *  May run with -sim_run_args=+err_inj_dbg
 **********************************************************************/
    
!SIMS+ARGS: -sim_run_args=+asm_err_en -sim_run_args=+err_inj_dbg -nosas

#include "exu_ecc.h" 
    
#define  H_HT0_Internal_Processor_Error_0x29 hyp_int_proc_err_trap
#define  H_HT0_Corrected_ECC_error_0x63 hyp_ecc_ce_trap

! setup for UE trap handler
#define EXPECT_ERR_ASI(status, reg) \
	set	status,%o6	; \
	add	%g0,reg,%o7	;
    

#define TRAP_TAKEN     0x7ff
#define TRAP_NOT_TAKEN 0xd0a
#define	RD_UNCHANGED   0xfab
    
! for taddcctv cases
#define H_T0_Tag_Overflow
#define My_T0_Tag_Overflow \
	wrpr	%g0,0,%gl	; \
	add	%g0,TRAP_TAKEN,%g6; \
	done			; \
	nop; nop; nop; nop; nop;

! for divide by zero cases
#define H_T0_Division_By_Zero
#define My_T0_Division_By_Zero \
	wrpr	%g0,0,%gl	; \
	add	%g0,TRAP_TAKEN,%g6; \
	done			; \
	nop; nop; nop; nop; nop;



#define DUMMY_TRAP     0x131
#define H_T0_Trap_Instruction_1
#define My_T0_Trap_Instruction_1 \
	wrpr	%g0,0,%gl	; \
	add	%g0,TRAP_TAKEN,%g6; \
	done			; \
	nop; nop; nop; nop; nop;

#define RESULT_CHECK \
	subcc	%l0,RD_UNCHANGED,%g0; \
	tne	T_BAD_TRAP	; \
	subcc	%g7,TRAP_TAKEN,%g0	; \
	tne	T_BAD_TRAP	;\
	subcc	%g5,0,%g0	; \
	tne	T_BAD_TRAP	; 

    
#define  MAIN_PAGE_HV_ALSO             
#include "boot.s"

.global main
main:

#define L1_OFT 0
#define L2_OFT 0x08
#define L3_OFT 0x10
#define L4_OFT 0x18
#define L5_OFT 0x20
#define L6_OFT 0x28
#define L7_OFT 0x30
#define I1_OFT 0x38
#define I2_OFT 0x40
    
    
	setx	reg_data,%l0,%g1
	ldx	[%g1+L1_OFT],%l1
	ldx	[%g1+L2_OFT],%l2
	ldx	[%g1+L3_OFT],%l3
	ldx	[%g1+L4_OFT],%l4
	ldx	[%g1+L5_OFT],%l5
	ldx	[%g1+L6_OFT],%l6
	ldx	[%g1+L7_OFT],%l7
	ldx	[%g1+I1_OFT],%i1
	ldx	[%g1+I2_OFT],%i2

#define DATAP %g1
#define SDATAP %g2     
	setx	target_primary,%l0,DATAP
	setx	target_secondary,%l0,SDATAP
	add	%g0,0,%g5
	add	%g0,TRAP_NOT_TAKEN,%g6
	add	%g0,RD_UNCHANGED,%l0


        ta	T_CHANGE_HPRIV
	sub	%g0,1,%i7	! write to clear error status before starting
	stxa	%i7,[%g0]ASI_ASYNC_FAULT_STATUS
	ta	T_CHANGE_NONHPRIV
    
	!**********************
	! Arithmetic Ops
	!**********************
    	wr	%g0,%g0,%ccr	    

!$EV error(0,expr(@VA(.MAIN.RSmx_ue_add),16,16),1,IRF, UE,0,1, CE,0,x, x,x,x)
	EXPECT_ERR_ASI(IRF_ERROR_STATUS_UE_MIX, IRF_CE_W0_I1)
RSmx_ue_add:     
    	add	%i1,%i2,%l0
	addcc	%i2,0,%g0	    ! CE should have been fixed silently
	RESULT_CHECK   
	ldx	[%g1+I1_OFT],%i1

!$EV error(0,expr(@VA(.MAIN.RSmx_ue_addc),16,16),1,IRF, CE,1,x, UE,071,0, x,x,x) 
        EXPECT_ERR_ASI(IRF_ERROR_STATUS_UE_MIX, IRF_CE_W0_L1)
RSmx_ue_addc:     
	addc	%l2,%l1,%l0
	addcc	%l2,0,%g0	    ! CE should have been fixed silently
	RESULT_CHECK   
	ldx	[%g1+L1_OFT],%l1
   

!$EV error(0,expr(@VA(.MAIN.RSmx_ue_sub),16,16),1,IRF, UE,069,1, UE,10,20, x,x,x)
        EXPECT_ERR_ASI(IRF_ERROR_STATUS_UE, IRF_CE_W0_L1)
RSmx_ue_sub:     
    	sub	%l1,%i2,%l0
	RESULT_CHECK   
	ldx	[%g1+L1_OFT],%l1
	ldx	[%g1+I2_OFT],%i2
	nop			    ! prevent bypass in next case
	nop
	nop
	nop

    
!$EV error(0,expr(@VA(.MAIN.RSmx_ue_taddcctv),16,16),1,IRF, UE,3,4, CE,070,x, x,x,x)
        EXPECT_ERR_ASI(IRF_ERROR_STATUS_UE_MIX, IRF_CE_W0_L5)
RSmx_ue_taddcctv:     
	taddcctv %l5,%l1,%l0	    ! no tag_overflow
    	subcc	%g6,TRAP_NOT_TAKEN,%g0
	tne	T_BAD_TRAP
	addcc	%l1,0,%g0	    ! CE should have been fixed silently
    	RESULT_CHECK   
	ldx	[%g1+L5_OFT],%l5
      	    
    				    
!$EV error(0,expr(@VA(.MAIN.RSmx_ue_tsubcctv_ov1),16,16),1,IRF, CE,1,x, UE,2,068, x,x,x) 
        EXPECT_ERR_ASI(IRF_ERROR_STATUS_UE_MIX, IRF_CE_W0_L1)
RSmx_ue_tsubcctv_ov1:     
	tsubcctv %i1,%l1,%l0	    ! ce on bit 1 alters overflow state
    	subcc	%g6,TRAP_NOT_TAKEN,%g0
	tne	T_BAD_TRAP
	addcc	%i1,0,%g0	    ! CE should have been fixed silently
	RESULT_CHECK  
	ldx	[%g1+L1_OFT],%l1
	nop			    ! prevent bypass in next case
	nop
	nop
	nop
    
 	!************************************
	! tag_overflow exceptions and ce
	!************************************
!$EV error(0,expr(@VA(.MAIN.RSmx_ue_taddcctv_ov),16,16),1,IRF, UE,5,4, CE,0,x, x,x,x)
        EXPECT_ERR_ASI(IRF_ERROR_STATUS_UE_MIX, IRF_CE_W0_L1)
RSmx_ue_taddcctv_ov:     
	taddcctv %l1,%l4,%l0	    ! ce alters tag_overflow state
	subcc	%g6,TRAP_NOT_TAKEN,%g0	    ! expect only UE trap
	tne	T_BAD_TRAP
	addcc	%l4,0,%g0	    ! CE should have been fixed silently
	RESULT_CHECK  
	ldx	[%g1+L1_OFT],%l1
	nop			    ! prevent bypass in next case
	nop
	nop
	nop
    
	!*******************
	! Logical ops
	!*******************
!$EV error(0,expr(@VA(.MAIN.RSmx_ue_and),16,16),1,IRF, UE,12,13, CE,070,x, x,x,x)
        EXPECT_ERR_ASI(IRF_ERROR_STATUS_UE_MIX, IRF_CE_W0_L1)
RSmx_ue_and:     
    	and	%l1,%l2,%l0
	addcc	%l2,0,%g0	    ! CE should have been fixed silently
	RESULT_CHECK  
	ldx	[%g1+L1_OFT],%l1
	nop			    ! prevent bypass in next case
	nop
	nop
	nop

!$EV error(0,expr(@VA(.MAIN.RSmx_ue_xor),16,16),1,IRF, CE,069,x, UE,11,13, x,x,x)
        EXPECT_ERR_ASI(IRF_ERROR_STATUS_UE_MIX, IRF_CE_W0_L2)
RSmx_ue_xor:     
    	xor	%l1,%l2,%l0
	addcc	%l1,0,%g0	    ! CE should have been fixed silently
	RESULT_CHECK  
	ldx	[%g1+L2_OFT],%l2
	nop			    ! prevent bypass in next case
	nop
	nop
	nop
         
	!***********************
	! Multiply, divide  ops
	!***********************
!$EV error(0,expr(@VA(.MAIN.RSmx_ue_mulx),16,16),1,IRF, UE,24,25, CE,1,x, x,x,x) 
        EXPECT_ERR_ASI(IRF_ERROR_STATUS_UE_MIX, IRF_CE_W0_L5)
RSmx_ue_mulx:     
	mulx	%l5,%l2,%l0
	addcc	%l2,0,%g0	    ! CE should have been fixed silently
	RESULT_CHECK  
	ldx	[%g1+L5_OFT],%l5
   			    
!$EV error(0,expr(@VA(.MAIN.RSmx_ue_umul),16,16),1,IRF, CE,25,x, UE,060,3, x,x,x) 
        EXPECT_ERR_ASI(IRF_ERROR_STATUS_UE_MIX, IRF_CE_W0_L7)
RSmx_ue_umul:     
	umul	%l6,%l7,%l0
	addcc	%l6,0,%g0	    ! CE should have been fixed silently
	RESULT_CHECK     
	ldx	[%g1+L7_OFT],%l7

!$EV error(0,expr(@VA(.MAIN.RSmx_ue_smul),16,16),1,IRF, UE,069,4, UE,3,7, x,x,x) 
        EXPECT_ERR_ASI(IRF_ERROR_STATUS_UE, IRF_CE_W0_L5)
RSmx_ue_smul:     
	smul	%l5,%l3,%l0
	RESULT_CHECK  
	ldx	[%g1+L5_OFT],%l5
	ldx	[%g1+L3_OFT],%l3
    				    
!$EV error(0,expr(@VA(.MAIN.RSmx_ue_mulscc),16,16),1,IRF, UE,029,028, CE,031,x, x,x,x) 
        EXPECT_ERR_ASI(IRF_ERROR_STATUS_UE_MIX, IRF_CE_W0_L6)
    	wr	%l0,%g0,%y 
RSmx_ue_mulscc:     
	mulscc	%l6,%l4,%l0
	addcc	%l4,0,%g0	    ! CE should have been fixed silently
	RESULT_CHECK     
	ldx	[%g1+L6_OFT],%l6

!$EV error(0,expr(@VA(.MAIN.RSmx_ue_sdivx),16,16),1,IRF, CE,30,x, UE,068,5, x,x,x) 
        EXPECT_ERR_ASI(IRF_ERROR_STATUS_UE_MIX, IRF_CE_W0_L2)
RSmx_ue_sdivx:     
	sdivx	%l5,%l2,%l0
	addcc	%l5,0,%g0	    ! CE should have been fixed silently
	RESULT_CHECK  
	ldx	[%g1+L2_OFT],%l2
      				    
!$EV error(0,expr(@VA(.MAIN.RSmx_ue_udivx),16,16),1,IRF, UE,35,32, UE,10,9, x,x,x) 
        EXPECT_ERR_ASI(IRF_ERROR_STATUS_UE, IRF_CE_W0_L6)
RSmx_ue_udivx:     
	udivx	%l6,%l7,%l0
	RESULT_CHECK  
	ldx	[%g1+L6_OFT],%l6
	ldx	[%g1+L7_OFT],%l7
   
	! for 32-bit divides, create UE on both lower and upper half of rs1
	! upper half of rs1 is unused by the operation...

!$EV error(0,expr(@VA(.MAIN.RSmx_ue_sdiv_lo),16,16),1,IRF, UE,26,2, CE,067,x, x,x,x)
        EXPECT_ERR_ASI(IRF_ERROR_STATUS_UE_MIX, IRF_CE_W0_L2)
    	wr	%l0,%g0,%y 
RSmx_ue_sdiv_lo:     
	sdiv	%l2,%l3,%l0
	addcc	%l3,0,%g0	    ! CE should have been fixed silently
	RESULT_CHECK  
	ldx	[%g1+L2_OFT],%l2
	nop			    ! prevent bypass in next case
	nop
	nop
	nop    

!$EV error(0,expr(@VA(.MAIN.RSmx_ue_sdiv_hi),16,16),1,IRF, CE,066,x, UE,33,34, x,x,x)
        EXPECT_ERR_ASI(IRF_ERROR_STATUS_UE_MIX, IRF_CE_W0_L3)
    	wr	%l0,%g0,%y 
RSmx_ue_sdiv_hi:     
	sdiv	%l2,%l3,%l0
	addcc	%l2,0,%g0	    ! CE should have been fixed silently
	RESULT_CHECK  
	ldx	[%g1+L3_OFT],%l3

	!*********************
	! divide by zero cases
	!*********************
!$EV error(0,expr(@VA(.MAIN.RSmx_ue_sdivx_0),16,16),1,IRF, UE,31,7, CE,0,x, x,x,x)
        EXPECT_ERR_ASI(IRF_ERROR_STATUS_UE_MIX, IRF_CE_W0_L5)
RSmx_ue_sdivx_0:     
	sdivx	%l5,%l1,%l0
    	subcc	%g6,TRAP_NOT_TAKEN,%g0	! expect no div by zero trap
	tne	T_BAD_TRAP
	addcc	%l1,0,%g0	    ! CE should have been fixed silently
	RESULT_CHECK  
	ldx	[%g1+L5_OFT],%l5
       				    
!$EV error(0,expr(@VA(.MAIN.RSmx_ue_udivx_0),16,16),1,IRF, CE,32,x, UE,066,067, x,x,x) 
        EXPECT_ERR_ASI(IRF_ERROR_STATUS_UE_MIX, IRF_CE_W0_L1)
RSmx_ue_udivx_0:     
	udivx	%l6,%l1,%l0
    	subcc	%g6,TRAP_NOT_TAKEN,%g0	! expect no div by zero trap
	tne	T_BAD_TRAP
	addcc	%l6,0,%g0	    ! CE should have been fixed silently
	RESULT_CHECK    
	ldx	[%g1+L1_OFT],%l1

	!************************************************************
	! CAS ops have rs1, rs2, and rs3
	!************************************************************
	! CASXA
	setx	target_secondary,%i0,%o1
	add	%o1,0,%o3

!$EV error(0,expr(@VA(.MAIN.RSmx_ue_casxa1),16,16),1,IRF, UE,33,31, CE,5,x, x,x,x) 
        EXPECT_ERR_ASI(IRF_ERROR_STATUS_UE_MIX, IRF_CE_W0_O1)
	add	%l2,0,%o2
	stxa	%o2,[%o1]ASI_SECONDARY
	nop
	nop
	nop
	nop
RSmx_ue_casxa1: 
	casxa	[%o1]ASI_SECONDARY,%o2,%l0 
	ldxa	[%o3]ASI_SECONDARY,%o6
	cmp	%o6,%l2
	tne	T_BAD_TRAP
	addcc	%o2,0,%g0	    ! CE should have been fixed silently
	RESULT_CHECK  
	add	%o3,0,%o1

!$EV error(0,expr(@VA(.MAIN.RSmx_ue_casxa5),16,16),1,IRF, UE,33,31, x,x,x, CE,5,x)
        EXPECT_ERR_ASI(IRF_ERROR_STATUS_UE_MIX, IRF_CE_W0_O1)
        add     %l2,0,%o2
        stxa    %o2,[%o1]ASI_SECONDARY
        nop
        nop
        nop
        nop
RSmx_ue_casxa5:
        casxa   [%o1]ASI_SECONDARY,%o2,%l0
        ldxa    [%o3]ASI_SECONDARY,%o6
        cmp     %o6,%l2
        tne     T_BAD_TRAP
        addcc   %l0,0,%g0           ! CE should have been fixed silently
        RESULT_CHECK
	add	%o3,0,%o1

        
!$EV error(0,expr(@VA(.MAIN.RSmx_ue_casxa2),16,16),1,IRF, CE,34,x, x,x,x UE,6,5) 
        EXPECT_ERR_ASI(IRF_ERROR_STATUS_UE_MIX, IRF_CE_W0_L1)
	add	%l4,0,%o2
	stxa	%o2,[%o1]ASI_SECONDARY
	nop
	nop
	nop
	nop
RSmx_ue_casxa2: 
	casxa	[%o1]ASI_SECONDARY,%o2,%l1 
	ldxa	[%o1]ASI_SECONDARY,%o6
	cmp	%o6,%l4
	tne	T_BAD_TRAP
	addcc	%o1,0,%g0	    ! CE should have been fixed silently
	RESULT_CHECK   
	ldx	[%g1+L1_OFT],%l1
    
!$EV error(0,expr(@VA(.MAIN.RSmx_ue_casxa3),16,16),1,IRF, x,x,x, UE,35,30, CE,5,x) 
        EXPECT_ERR_ASI(IRF_ERROR_STATUS_UE_MIX, IRF_CE_W0_O2)
	add	%l6,0,%o2
	stxa	%o2,[%o1]ASI_SECONDARY
	nop
	nop
	nop
	nop
RSmx_ue_casxa3: 
	casxa	[%o1]ASI_SECONDARY,%o2,%l0
	ldxa	[%o1]ASI_SECONDARY,%o6
	cmp	%o6,%l6
	tne	T_BAD_TRAP
	RESULT_CHECK
    

	add	%l1,%g0,%o2
	stxa	%o2,[%o1]ASI_SECONDARY
	nop
	nop
	nop
	nop
!$EV error(0,expr(@VA(.MAIN.RSmx_ue_casxa4),16,16),1,IRF, UE,066,8, CE,35,x, CE,5,x) 
        EXPECT_ERR_ASI(IRF_ERROR_STATUS_UE_MIX, IRF_CE_W0_O1)
RSmx_ue_casxa4: 
	casxa	[%o1]ASI_SECONDARY,%o2,%l0
	ldxa	[%o3]ASI_SECONDARY,%o6
	cmp	%o6,%l1
	tne	T_BAD_TRAP
	addcc	%o2,0,%g0	    ! only one of the CEs will be fixed silently...
	addcc	%l0,0,%g0	    
	subcc	%g5,1,%g5
	tne	T_BAD_TRAP
	RESULT_CHECK   
	add	%o3,0,%o1

	!**********************
	! CASA
!$EV error(0,expr(@VA(.MAIN.RSmx_ue_casa1),16,16),1,IRF, CE,39,x, UE,15,040, CE,38,x) 
        EXPECT_ERR_ASI(IRF_ERROR_STATUS_UE_MIX, IRF_CE_W0_O2)
	add	%i2,%g0,%o2
	stwa	%o2,[%o1]ASI_SECONDARY
	nop
	nop
	nop
	nop
RSmx_ue_casa1: 
	casa	[%o1]ASI_SECONDARY,%o2,%l4    
	lduwa	[%o1]ASI_SECONDARY,%o6
	cmp	%o6,%i2
	tne	T_BAD_TRAP
	addcc	%o1,0,%g0	    ! only one of the CEs will be fixed silently...
	addcc	%l4,0,%g0	    ! no CE here
	subcc	%g5,1,%g5
	tne	T_BAD_TRAP
	RESULT_CHECK   	   
 
!$EV error(0,expr(@VA(.MAIN.RSmx_ue_casa2),16,16),1,IRF, CE,1,x, CE,2,x, UE,045,049) 
        EXPECT_ERR_ASI(IRF_ERROR_STATUS_UE_MIX, IRF_CE_W0_L4)
	add	%i1,%g0,%o2
	stwa	%o2,[%o1]ASI_SECONDARY
	nop
	nop
	nop
	nop
RSmx_ue_casa2: 
	casa	[%o1]ASI_SECONDARY,%o2,%l4
	lduwa	[%o1]ASI_SECONDARY,%o6
	cmp	%o6,%i1
	tne	T_BAD_TRAP
	subcc	%o2,%i1,%g0	    ! one CE should have been fixed silently
	tne	T_BAD_TRAP
	subcc	%g5,1,%g5
	RESULT_CHECK
	ldx	[%g1+L4_OFT],%l4

!$EV error(0,expr(@VA(.MAIN.RSmx_ue_casa3),16,16),1,IRF, x,x,x, CE,32,x, UE,30,060) 
        EXPECT_ERR_ASI(IRF_ERROR_STATUS_UE_MIX, IRF_CE_W0_L5)
	add	%g0,%g0,%o2
	stwa	%o2,[%o1]ASI_SECONDARY
	nop
	nop
	nop
	nop
RSmx_ue_casa3: 
	casa	[%o1]ASI_SECONDARY,%o2,%l5 
	lduwa	[%o1]ASI_SECONDARY,%o6
	cmp	%o6,%g0
	tne	T_BAD_TRAP
	subcc	%o2,%g0,%g0	    ! CE should have been fixed silently
	tne	T_BAD_TRAP
	RESULT_CHECK
	ldx	[%g1+L5_OFT],%l5
        
!$EV error(0,expr(@VA(.MAIN.RSmx_ue_casa4),16,16),1,IRF, UE,1,15, UE,33,050, UE,24,25) 
        EXPECT_ERR_ASI(IRF_ERROR_STATUS_UE, IRF_CE_W0_O1)
	add	%i2,%g0,%o2
	stwa	%o2,[%o1]ASI_SECONDARY
	nop
	nop
	nop
	nop
RSmx_ue_casa4: 
	casa	[%o1]ASI_SECONDARY,%o2,%l6 
	lduwa	[%o3]ASI_SECONDARY,%o6
	cmp	%o6,%i2
	tne	T_BAD_TRAP
   	RESULT_CHECK
	ldx	[%g1+L6_OFT],%l6

	!**********************************************
	! Several cases with rs1+rs2 as an address
	!**********************************************

	!******
    	! FLUSH
    	setx	dummy_addr,%i0,%o1
	add	%g0,32,%o2
	nop
	nop
	nop
	nop
!$EV error(0,expr(@VA(.MAIN.RS2_ue_flush),16,16),1,IRF, UE,070,071, CE,16,x, x,x,x) 
        EXPECT_ERR_ASI(IRF_ERROR_STATUS_UE_MIX, IRF_CE_W0_O1)
RS2_ue_flush:	
	flush	%o1+%o2
	subcc	%o2,32,%g0	    ! CE should have been fixed silently
	tne	T_BAD_TRAP
   	RESULT_CHECK

	!*****
	! JMPL
	setx	bad_branch,%i0,%o1
	sub	%o1,15,%o1
	add	%o1,0,%o3
	add	%g0,15,%o2
	nop
	nop
	nop
	nop
!$EV error(0,expr(@VA(.MAIN.RS2_ue_jmpl),16,16),1,IRF, CE,069,x, UE,17,12, x,x,x) 
        EXPECT_ERR_ASI(IRF_ERROR_STATUS_UE_MIX, IRF_CE_W0_O2)
RS2_ue_jmpl:    
	jmpl	%o1+%o2,%l0	    ! UE should prevent the jump
	nop
	nop	
	subcc	%o1,%o3,%g0	    ! CE should have been fixed silently
	tne	T_BAD_TRAP
   	RESULT_CHECK  

	!*********
	! LDX, LDD
	setx	reg_data,%i0,%o1
	add	%o1,0,%o3
    	add	%g0,0x10,%o2
	nop
	nop
	nop
	nop
!$EV error(0,expr(@VA(.MAIN.RS2_ue_ldx),16,16),1,IRF, UE,068,13, UE,18,11, x,x,x) 
        EXPECT_ERR_ASI(IRF_ERROR_STATUS_UE, IRF_CE_W0_O1)
RS2_ue_ldx:    
	ldx	[%o1+%o2],%l0
	tne	T_BAD_TRAP
   	RESULT_CHECK  
	add	%o3,0,%o1
   
    
!$EV error(0,expr(@VA(.MAIN.RS2_ue_ldd),16,16),1,IRF, CE,067,x, UE,19,10, x,x,x)
        EXPECT_ERR_ASI(IRF_ERROR_STATUS_UE_MIX, IRF_CE_W0_O2)
	add	%g0,0x38,%o2
	nop
	nop
	nop
	nop
RS2_ue_ldd:    
	ldd	[%o1+%o2],%l0
	cmp	%o1,%o3		    ! CE should have been fixed silently
	tne	T_BAD_TRAP   	
	RESULT_CHECK  
    
	!*****************************************************
	! MOVE on register condition, rs1 is rcc, rs2 is data    
	!*****************************************************
!$EV error(0,expr(@VA(.MAIN.RSmx_ue_movrz),16,16),1,IRF, UE,042,21, CE,24,x, x,x,x) 
        EXPECT_ERR_ASI(IRF_ERROR_STATUS_UE_MIX, IRF_CE_W0_L1)
RSmx_ue_movrz:    
	movrz	%l1,%l4,%l0
   	RESULT_CHECK
	ldx	[%g1+L1_OFT],%l1   
    
	!*******************
	! Shift ops
	!*******************
!$EV error(0,expr(@VA(.MAIN.RSmx_ue_sll),16,16),1,IRF, CE,048,x, UE,1,5, x,x,x)
        EXPECT_ERR_ASI(IRF_ERROR_STATUS_UE_MIX, IRF_CE_W0_L3)
RSmx_ue_sll:     
    	sll	%l2,%l3,%l0
   	RESULT_CHECK
	ldx	[%g1+L3_OFT],%l3
    
	!********************************************
	! Trap instructions
	!********************************************
	add	%g0,DUMMY_TRAP,%l1
	nop
	nop
	nop
	nop
	add	%g0,TRAP_NOT_TAKEN,%g6
!$EV error(0,expr(@VA(.MAIN.RSmx_ue_tg),16,16),1,IRF, CE,1,x, UE,050,052, x,x,x)
        EXPECT_ERR_ASI(IRF_ERROR_STATUS_UE_MIX, IRF_CE_W0_L1)
	wr	%g0,0x40,%ccr
RSmx_ue_tg:
	tg	%icc,%l0+%l1
	subcc	%g6,TRAP_NOT_TAKEN,%g0
	tne	T_BAD_TRAP 
   	RESULT_CHECK

	wr	%g0,0x04,%ccr
	add	%g0,DUMMY_TRAP,%l1
	nop
	nop
	nop
	nop
!$EV error(0,expr(@VA(.MAIN.RSmx_ue_tne),16,16),1,IRF, UE,2,053, CE,1,x, x,x,x)
        EXPECT_ERR_ASI(IRF_ERROR_STATUS_UE_MIX, IRF_CE_W0_L1)
RSmx_ue_tne:
	tne	%xcc,%l1+%l0
	subcc	%g6,TRAP_NOT_TAKEN,%g0
	RESULT_CHECK   
	ldx	[%g1+L1_OFT],%l1   

	!*************************************************
	! Save/Restore
	!*************************************************
    	ta	T_CHANGE_PRIV
	rdpr	%cwp,%g3
	ta	T_CHANGE_NONPRIV
    
!$EV error(0,expr(@VA(.MAIN.RSmx_ue_save),16,16),1,IRF, CE,065,x, UE,28,19, x,x,x) 
        EXPECT_ERR_ASI(IRF_ERROR_STATUS_UE_MIX, IRF_CE_GL0_G4)
	mova	%icc,%l2,%g4
	nop
	nop
	nop
	nop
RSmx_ue_save:     
	save	%g3,%g4,%g3
	ta	T_CHANGE_PRIV
	rdpr	%cwp,%o1
	subcc	%g3,%o1,%g0	    ! no window change
	tne	T_BAD_TRAP
	ta	T_CHANGE_NONPRIV
	RESULT_CHECK   
    
!$EV error(0,expr(@VA(.MAIN.RSmx_ue_restore),16,16),1,IRF, UE,064,8, CE,29,x, x,x,x) 
	save
        EXPECT_ERR_ASI(IRF_ERROR_STATUS_UE_MIX, IRF_CE_GL0_G4)
	mova	%icc,%l4,%g4
	add	%g0,RD_UNCHANGED,%l0
    	nop
	nop
	nop
	nop
RSmx_ue_restore:     
	restore	%g4,%g3,%l0
    	ta	T_CHANGE_PRIV
	rdpr	%cwp,%o1
	subcc	%o1,1,%g0	    ! no window change
	tne	T_BAD_TRAP
	ta	T_CHANGE_NONPRIV
	RESULT_CHECK
	restore
    
	!*************************************************
	! Write status and privileged regs
	!*************************************************
	ta	T_CHANGE_PRIV
!$EV error(0,expr(@VA(.MAIN.RSmx_ue_wrpr),16,16),1,IRF, CE,1,x, UE,30,051, x,x,x)
        EXPECT_ERR_ASI(IRF_ERROR_STATUS_UE_MIX_PRIV, IRF_CE_W0_L1)
	add	%g0,5,%o1
    	wrpr	%g0,1,%cansave
	nop
	nop
	nop
	nop
RSmx_ue_wrpr:
	wrpr	%o1,%l1,%cansave
	rdpr	%cansave,%i0
	subcc	%i0,1,%g0
	tne	T_BAD_TRAP   
	RESULT_CHECK   
	ldx	[%g1+L1_OFT],%l1
	ta	T_CHANGE_NONPRIV
    
!$EV error(0,expr(@VA(.MAIN.RSmx_ue_wr),16,16),1,IRF, UE,2,052, CE,31,x, x,x,x)
        EXPECT_ERR_ASI(IRF_ERROR_STATUS_UE_MIX, IRF_CE_W0_L2)
	wr	%i1,0,%y
RSmx_ue_wr:     
	wr	%l2,%i1,%y
	rd	%y,%o1
	subcc	%i1,%o1,%g0	    ! no write
	tne	T_BAD_TRAP
	RESULT_CHECK   
	ldx	[%g1+L2_OFT],%l2
   
    	!**********************
	! Store
	!**********************
	add	DATAP,0,%o1
	add	%g0,0,%o2
    	stx	%l1,[%o1+%o2]
	nop
	nop
	nop
	nop
!$EV error(0,expr(@VA(.MAIN.RSmx_ue_stx1),16,16),1,IRF, UE,8,053, x,x,x, UE,9,054)
        EXPECT_ERR_ASI(IRF_ERROR_STATUS_UE, IRF_CE_W0_O1)
RSmx_ue_stx1:     
    	stx	%l2,[%o1+%o2]
	ldx	[DATAP+0x00],%o1
	cmp	%l1,%o1
	tne	T_BAD_TRAP
	RESULT_CHECK   
	ldx	[%g1+L2_OFT],%l2    

    
	add	%g0,8,%o2
    	stx	%l3,[DATAP+%o2]
	nop
	nop
	nop
	nop
!$EV error(0,expr(@VA(.MAIN.RSmx_ue_stx2),16,16),1,IRF, x,x,x, UE,7,055, UE,0,056)
        EXPECT_ERR_ASI(IRF_ERROR_STATUS_UE, IRF_CE_W0_O2)
RSmx_ue_stx2:     
    	stx	%l4,[DATAP+%o2]
	ldx	[DATAP+8],%o2
	cmp	%l3,%o2
	RESULT_CHECK   
	ldx	[%g1+L4_OFT],%l4    
   

	add	DATAP,0,%o1
	add	%g0,0x10,%o2
    	stx	%l5,[%o1+%o2]
	nop
	nop
	nop
	nop
!$EV error(0,expr(@VA(.MAIN.RSmx_ue_stx3),16,16),1,IRF, UE,0,057, CE,7,x, CE,0,x)
        EXPECT_ERR_ASI(IRF_ERROR_STATUS_UE_MIX, IRF_CE_W0_O1)
RSmx_ue_stx3:     
    	stx	%l3,[%o1+%o2]
	ldx	[DATAP+%o2],%o2
	cmp	%l5,%o2
	tne	T_BAD_TRAP
    	addcc	%l3,0,%g0	    ! only one of the CEs will be fixed silently...
	subcc	%g5,1,%g5
	tne	T_BAD_TRAP
	RESULT_CHECK   

    
	add	%g0,0x18,%o2
    	std	%l2,[DATAP+%o2]
	nop
	nop
	nop
	nop
!$EV error(0,expr(@VA(.MAIN.RSmx_ue_std1),16,16),1,IRF, CE,1,x, CE,4,x, UE,4,056)
        EXPECT_ERR_ASI(IRF_ERROR_STATUS_UE_MIX, IRF_CE_W0_L6)
RSmx_ue_std1:     
    	std	%l6,[DATAP+%o2]
	ldd	[DATAP+%o2],%i0
	srl	%l2,0,%o0
	cmp	%i0,%o0
	tne	T_BAD_TRAP
    	srl	%l3,0,%o1
	cmp	%i1,%o1
	tne	T_BAD_TRAP 
	subcc	%g5,1,%g5	    ! only one of the CEs will be fixed silently...
	tne	T_BAD_TRAP   
	RESULT_CHECK  
	ldx	[%g1+L6_OFT],%l6
    
        
	!*******************
	! SWAP/SWAPA
	!*******************
	add	%i2,%g0,%o2
	stw	%i1,[DATAP]
	nop
	nop
	nop
	nop
!$EV error(0,expr(@VA(.MAIN.RSmx_ue_swap1),16,16),1,IRF, CE,8,x, x,x,x, UE,23,058) 
        EXPECT_ERR_ASI(IRF_ERROR_STATUS_UE_MIX, IRF_CE_W0_O2)
RSmx_ue_swap1: 
	swap	[DATAP],%o2
	lduw	[DATAP],%o2
	cmp	%o2,%i1
	tne	T_BAD_TRAP
	RESULT_CHECK   

    	! SWAPA
	add	%i2,%g0,%o2
	stwa	%i1,[SDATAP+%l1]ASI_SECONDARY
	nop
	nop
	nop
	nop
!$EV error(0,expr(@VA(.MAIN.RSmx_ue_swapa),16,16),1,IRF, x,x,x, UE,062,060, CE,064,x) 
        EXPECT_ERR_ASI(IRF_ERROR_STATUS_UE_MIX, IRF_CE_W0_L1)
RSmx_ue_swapa: 
	swapa	[SDATAP+%l1]ASI_SECONDARY,%o2
	cmp	%o2,%i2
	tne	T_BAD_TRAP
    	ldx	[%g1+L1_OFT],%l1   
	lduwa	[SDATAP+%l1]ASI_SECONDARY,%o3
	cmp	%o3,%i1
	tne	T_BAD_TRAP
	RESULT_CHECK   
   

	!********************************
	! VIS ops, alignaddr, alignaddrl
	!********************************
    	wr      %g0,0x4,%fprs		! enable for mov %fccn ops
	alignaddr %l6,%l3,%i0
!$EV error(0,expr(@VA(.MAIN.RSmx_ue_align),16,16),1,IRF, UE,35,29, CE,1,x, x,x,x) 
        EXPECT_ERR_ASI(IRF_ERROR_STATUS_UE_MIX, IRF_CE_W0_L6)
RSmx_ue_align:    
	alignaddr %l6,%l3,%l0
	RESULT_CHECK
	ldx	[%g1+L6_OFT],%l6  
   
           
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

          
.global hyp_int_proc_err_trap
hyp_int_proc_err_trap:	
    	ldxa	[%g0]ASI_ASYNC_FAULT_STATUS,%g7
	cmp	%g7,%o6
	tne	T_BAD_TRAP
    	stxa	%g7,[%g0]ASI_ASYNC_FAULT_STATUS	! status bits are write to clear
    
	ldxa	[%g0]ASI_ASYNC_FAULT_ADDR,%g7
	and	%g7,0xfff,%g7	! syndrome (ie bit number) is unpredictable
	cmp	%o7,%g7
	tne	T_BAD_TRAP
	wrpr	%g0,0,%gl
	add	%g0,TRAP_TAKEN,%g7
    	done
	nop

.global hyp_ecc_ce_trap
hyp_ecc_ce_trap:
        ldxa	[%g0]ASI_ASYNC_FAULT_STATUS,%g7
	set	IRF_ERROR_STATUS_CE,%g6
	subcc	%g7,%g6,%g0
	tne	T_BAD_TRAP
    	stxa	%g7,[%g0]ASI_ASYNC_FAULT_STATUS	! status bits are write to clear
    
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
