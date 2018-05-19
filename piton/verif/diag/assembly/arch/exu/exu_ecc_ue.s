// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: exu_ecc_ue.s
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
 * Name:    exu_ecc_ue.s
 * Date:    August 6, 2003
 *
 *  Description: Execute an assortment of instructions with uncorrectable
 *	    on RS1, RS2, and RS3 singly.
 *	    This is not an exhaustive test.
 *
 *  Must not run with SAS (traps are enabled) 
 *  Must run with -sim_run_args=+asm_err_en
 *  May run with -sim_run_args=+err_inj_dbg
 **********************************************************************/
    
!SIMS+ARGS: -sim_run_args=+asm_err_en -sim_run_args=+err_inj_dbg -nosas    
    
#include "exu_ecc.h" 
        
#define  H_HT0_Internal_Processor_Error_0x29 hyp_int_proc_err_trap

! setup for UE trap handler
#define EXPECT_ERR_ASI(reg) \
	add	%g0,reg,%g5	;

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
	subcc	%g5,TRAP_TAKEN,%g0	; \
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

!$EV error(0,expr(@VA(.MAIN.UE_add),16,16),1,IRF, UE,0,1, x,x,x, x,x,x)
	EXPECT_ERR_ASI(IRF_CE_W0_I1)
UE_add:     
    	add	%i1,%i2,%l0
	addcc	%i2,0,%g0	 
	RESULT_CHECK   
	ldx	[%g1+I1_OFT],%i1
	nop
	nop
	nop
	nop

!$EV error(0,expr(@VA(.MAIN.UE_addc),16,16),1,IRF, x,x,x, UE,71,0, x,x,x) 
	EXPECT_ERR_ASI(IRF_CE_W0_L1)
UE_addc:     
	addc	%l2,%l1,%l0
	RESULT_CHECK   
	ldx	[%g1+L1_OFT],%l1
	nop
	nop
	nop
	nop
    
   
!$EV error(0,expr(@VA(.MAIN.UE_sub),16,16),1,IRF, UE,69,1, UE,10,20, x,x,x)
	EXPECT_ERR_ASI(IRF_CE_W0_L1)	! rs1 presented with priority
UE_sub:     
    	sub	%l1,%i2,%l0
	RESULT_CHECK   
	ldx	[%g1+L1_OFT],%l1
	ldx	[%g1+I2_OFT],%i2
	nop			    ! prevent bypass in next case
	nop
	nop
	nop

    
!$EV error(0,expr(@VA(.MAIN.UE_taddcctv),16,16),1,IRF, x,x,x, UE,3,4, x,x,x)
	EXPECT_ERR_ASI(IRF_CE_W0_L1)
UE_taddcctv:     
	taddcctv %l5,%l1,%l0	    ! no tag_overflow
    	subcc	%g6,TRAP_NOT_TAKEN,%g0
	tne	T_BAD_TRAP
    	RESULT_CHECK   
	ldx	[%g1+L1_OFT],%l1
	nop
	nop
	nop
	nop
      	    
    				    
!$EV error(0,expr(@VA(.MAIN.UE_tsubcctv_ov1),16,16),1,IRF, UE,2,68, x,x,x, x,x,x) 
	EXPECT_ERR_ASI(IRF_CE_W0_I1)
UE_tsubcctv_ov1:     
	tsubcctv %i1,%l1,%l0
    	subcc	%g6,TRAP_NOT_TAKEN,%g0
	tne	T_BAD_TRAP
	RESULT_CHECK  
	ldx	[%g1+I1_OFT],%i1
	nop			    ! prevent bypass in next case
	nop
	nop
	nop
    
 	!************************************
	! tag_overflow exceptions and ecc
	!************************************
!$EV error(0,expr(@VA(.MAIN.UE_taddcctv_ov),16,16),1,IRF, UE,5,4, x,x,x, x,x,x)
	EXPECT_ERR_ASI(IRF_CE_W0_L1)
UE_taddcctv_ov:     
	taddcctv %l1,%l4,%l0
	subcc	%g6,TRAP_NOT_TAKEN,%g0	    ! expect only UE trap
	tne	T_BAD_TRAP
	RESULT_CHECK  
	ldx	[%g1+L1_OFT],%l1
	nop			    ! prevent bypass in next case
	nop
	nop
	nop
    
	!*******************
	! Logical ops
	!*******************
!$EV error(0,expr(@VA(.MAIN.UE_and),16,16),1,IRF, UE,12,33, x,x,x, x,x,x)
	EXPECT_ERR_ASI(IRF_CE_W0_L1)
UE_and:     
    	and	%l1,%l2,%l0
	RESULT_CHECK  
	ldx	[%g1+L1_OFT],%l1
	nop			    ! prevent bypass in next case
	nop
	nop
	nop

!$EV error(0,expr(@VA(.MAIN.UE_xor),16,16),1,IRF, x,x,x, UE,1,13, x,x,x)
	EXPECT_ERR_ASI(IRF_CE_W0_L2)
UE_xor:     
    	xor	%l1,%l2,%l0
	RESULT_CHECK  
	ldx	[%g1+L2_OFT],%l2
	nop			    ! prevent bypass in next case
	nop
	nop
	nop
         
	!***********************
	! Multiply, divide  ops
	!***********************
!$EV error(0,expr(@VA(.MAIN.UE_mulx),16,16),1,IRF, UE,24,25, UE,1,65, x,x,x) 
	EXPECT_ERR_ASI(IRF_CE_W0_L5)	! rs1 presented with priority
UE_mulx:     
	mulx	%l5,%l2,%l0
	RESULT_CHECK  
	ldx	[%g1+L5_OFT],%l5
	ldx	[%g1+L2_OFT],%l2
	nop
	nop
	nop
	nop
    
!$EV error(0,expr(@VA(.MAIN.UE_umul),16,16),1,IRF, x,x,x, UE,60,3, x,x,x) 
	EXPECT_ERR_ASI(IRF_CE_W0_L7)
UE_umul:     
	umul	%l6,%l7,%l0
	RESULT_CHECK     
	ldx	[%g1+L7_OFT],%l7
	nop
	nop
	nop
	nop

!$EV error(0,expr(@VA(.MAIN.UE_smul),16,16),1,IRF, UE,3,7, x,x,x, x,x,x) 
	EXPECT_ERR_ASI(IRF_CE_W0_L5)
UE_smul:     
	smul	%l5,%l3,%l0
	RESULT_CHECK  
	ldx	[%g1+L5_OFT],%l5
	nop
	nop
	nop
	nop
    				    
!$EV error(0,expr(@VA(.MAIN.UE_mulscc),16,16),1,IRF, x,x,x, UE,29,28, x,x,x) 
	EXPECT_ERR_ASI(IRF_CE_W0_L4)
    	wr	%l0,%g0,%y 
UE_mulscc:     
	mulscc	%l6,%l4,%l0
	RESULT_CHECK     
	ldx	[%g1+L2_OFT],%l4
	nop
	nop
	nop
	nop

!$EV error(0,expr(@VA(.MAIN.UE_sdivx),16,16),1,IRF, UE,68,5, x,x,x, x,x,x) 
	EXPECT_ERR_ASI(IRF_CE_W0_L5)
UE_sdivx:     
	sdivx	%l5,%l2,%l0
	RESULT_CHECK  
	ldx	[%g1+L5_OFT],%l5
	nop
	nop
	nop
	nop
      				    
!$EV error(0,expr(@VA(.MAIN.UE_udivx),16,16),1,IRF, x,x,x, UE,10,9, x,x,x) 
	EXPECT_ERR_ASI(IRF_CE_W0_L7)
UE_udivx:     
	udivx	%l6,%l7,%l0
	RESULT_CHECK  
	ldx	[%g1+L7_OFT],%l7
	nop
	nop
	nop
	nop
   
	! for 32-bit divides, create UE on both lower and upper half of rs1
	! upper half of rs1 is unused by the operation...

!$EV error(0,expr(@VA(.MAIN.UE_sdiv_lo),16,16),1,IRF, x,x,x, UE,26,2, x,x,x)
	EXPECT_ERR_ASI(IRF_CE_W0_L3)
    	wr	%l0,%l1,%y 
UE_sdiv_lo:     
	sdiv	%l2,%l3,%l0
	RESULT_CHECK  
	ldx	[%g1+L3_OFT],%l3
	nop			    ! prevent bypass in next case
	nop
	nop
	nop    

!$EV error(0,expr(@VA(.MAIN.UE_sdiv_hi),16,16),1,IRF, UE,33,34, x,x,x, x,x,x)
	EXPECT_ERR_ASI(IRF_CE_W0_L2)
    	wr	%l0,%g0,%y 
UE_sdiv_hi:     
	sdiv	%l2,%l3,%l0
	RESULT_CHECK  
	ldx	[%g1+L2_OFT],%l2
	nop
	nop
	nop
	nop

	!*********************
	! divide by zero cases
	!*********************
!$EV error(0,expr(@VA(.MAIN.UE_sdivx_0),16,16),1,IRF, x,x,x, UE,31,7, x,x,x)
	EXPECT_ERR_ASI(IRF_CE_W0_L1)
UE_sdivx_0:     
	sdivx	%l5,%l1,%l0
    	subcc	%g6,TRAP_NOT_TAKEN,%g0	! expect no div by zero trap
	tne	T_BAD_TRAP
	RESULT_CHECK  
	ldx	[%g1+L1_OFT],%l1
	nop
	nop
	nop
	nop
       				    
!$EV error(0,expr(@VA(.MAIN.UE_udivx_0),16,16),1,IRF, UE,66,67, x,x,x, x,x,x) 
	EXPECT_ERR_ASI(IRF_CE_W0_L6)
UE_udivx_0:     
	udivx	%l6,%l1,%l0
    	subcc	%g6,TRAP_NOT_TAKEN,%g0	! expect no div by zero trap
	tne	T_BAD_TRAP
	RESULT_CHECK    
	ldx	[%g1+L6_OFT],%l6
	nop
	nop
	nop
	nop

	!************************************************************
	! CAS ops have rs1, rs2, and rs3
	!************************************************************
	! CASXA
	setx	target_secondary,%i0,%o1
	add	%o1,0,%o3

!$EV error(0,expr(@VA(.MAIN.UE_casxa1),16,16),1,IRF, UE,33,31, x,x,x, x,x,x) 
	EXPECT_ERR_ASI(IRF_CE_W0_O1)
	add	%l2,0,%o2
	stxa	%o2,[%o1]ASI_SECONDARY
	nop
	nop
	nop
	nop
UE_casxa1: 
	casxa	[%o1]ASI_SECONDARY,%o2,%l0 
	ldxa	[%o3]ASI_SECONDARY,%o6
	cmp	%o6,%l2
	tne	T_BAD_TRAP
	RESULT_CHECK  
	add	%o3,0,%o1
        
!$EV error(0,expr(@VA(.MAIN.UE_casxa2),16,16),1,IRF, x,x,x, x,x,x UE,6,5) 
	EXPECT_ERR_ASI(IRF_CE_W0_L1)
	add	%l4,0,%o2
	stxa	%o2,[%o1]ASI_SECONDARY
	nop
	nop
	nop
	nop
UE_casxa2: 
	casxa	[%o1]ASI_SECONDARY,%o2,%l1 
	ldxa	[%o1]ASI_SECONDARY,%o6
	cmp	%o6,%l4
	tne	T_BAD_TRAP
	RESULT_CHECK   
	ldx	[%g1+L1_OFT],%l1
    
!$EV error(0,expr(@VA(.MAIN.UE_casxa3),16,16),1,IRF, x,x,x, UE,35,30, x,x,x) 
	EXPECT_ERR_ASI(IRF_CE_W0_O2)
	add	%l6,0,%o2
	stxa	%o2,[%o1]ASI_SECONDARY
	nop
	nop
	nop
	nop
UE_casxa3: 
	casxa	[%o1]ASI_SECONDARY,%o2,%l0
	ldxa	[%o1]ASI_SECONDARY,%o6
	cmp	%o6,%l6
	tne	T_BAD_TRAP
	RESULT_CHECK

	!**********************
	! CASA
!$EV error(0,expr(@VA(.MAIN.UE_casa1),16,16),1,IRF, x,x,x, UE,15,40, x,x,x) 
	EXPECT_ERR_ASI(IRF_CE_W0_O2)
	add	%i2,%g0,%o2
	stwa	%o2,[%o1]ASI_SECONDARY
	nop
	nop
	nop
	nop
UE_casa1: 
	casa	[%o1]ASI_SECONDARY,%o2,%l4    
	lduwa	[%o1]ASI_SECONDARY,%o6
	cmp	%o6,%i2
	tne	T_BAD_TRAP
	RESULT_CHECK   	   
 
!$EV error(0,expr(@VA(.MAIN.UE_casa2),16,16),1,IRF, x,x,x, x,x,x, UE,45,49) 
	EXPECT_ERR_ASI(IRF_CE_W0_L4)
	add	%i1,%g0,%o2
	stwa	%o2,[%o1]ASI_SECONDARY
	nop
	nop
	nop
	nop
UE_casa2: 
	casa	[%o1]ASI_SECONDARY,%o2,%l4
	lduwa	[%o1]ASI_SECONDARY,%o6
	cmp	%o6,%i1
	tne	T_BAD_TRAP
	tne	T_BAD_TRAP
	RESULT_CHECK
	ldx	[%g1+L4_OFT],%l4

!$EV error(0,expr(@VA(.MAIN.UE_casa3),16,16),1,IRF, UE,30,60, x,x,x, x,x,x) 
	EXPECT_ERR_ASI(IRF_CE_W0_O1)
	add	%g0,%g0,%o2
	stwa	%o2,[%o1]ASI_SECONDARY
	nop
	nop
	nop
	nop
UE_casa3: 
	casa	[%o1]ASI_SECONDARY,%o2,%l5 
	lduwa	[%o3]ASI_SECONDARY,%o6
	cmp	%o6,%g0
	tne	T_BAD_TRAP
	RESULT_CHECK

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
!$EV error(0,expr(@VA(.MAIN.RS2_ue_flush),16,16),1,IRF, UE,70,71, x,x,x, x,x,x) 
	EXPECT_ERR_ASI(IRF_CE_W0_O1)
RS2_ue_flush:	
	flush	%o1+%o2
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
!$EV error(0,expr(@VA(.MAIN.RS2_ue_jmpl),16,16),1,IRF, x,x,x, UE,17,12, x,x,x) 
	EXPECT_ERR_ASI(IRF_CE_W0_O2)
RS2_ue_jmpl:    
	jmpl	%o1+%o2,%l0	    ! UE should prevent the jump
	nop
	nop	
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
!$EV error(0,expr(@VA(.MAIN.RS2_ue_ldx),16,16),1,IRF, UE,68,13, x,x,x, x,x,x) 
	EXPECT_ERR_ASI(IRF_CE_W0_O1)
RS2_ue_ldx:    
	ldx	[%o1+%o2],%l0
	tne	T_BAD_TRAP
   	RESULT_CHECK  
	add	%o3,0,%o1
   
    
!$EV error(0,expr(@VA(.MAIN.RS2_ue_ldd),16,16),1,IRF, x,x,x, UE,19,10, x,x,x)
	EXPECT_ERR_ASI(IRF_CE_W0_O2)
	add	%g0,0x38,%o2
	nop
	nop
	nop
	nop
RS2_ue_ldd:    
	ldd	[%o1+%o2],%l0
	tne	T_BAD_TRAP   	
	RESULT_CHECK  
    
	!*****************************************************
	! MOVE on register condition, rs1 is rcc, rs2 is data    
	!*****************************************************
!$EV error(0,expr(@VA(.MAIN.UE_movrz),16,16),1,IRF, UE,42,21, x,x,x, x,x,x) 
	EXPECT_ERR_ASI(IRF_CE_W0_L1)
UE_movrz:    
	movrz	%l1,%l4,%l0
   	RESULT_CHECK
	ldx	[%g1+L1_OFT],%l1   
	nop
	nop
	nop
	nop
    
	!*******************
	! Shift ops
	!*******************
!$EV error(0,expr(@VA(.MAIN.UE_sll),16,16),1,IRF, x,x,x, UE,1,5, x,x,x)
	EXPECT_ERR_ASI(IRF_CE_W0_L3)
UE_sll:     
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
!$EV error(0,expr(@VA(.MAIN.UE_tg),16,16),1,IRF, x,x,x, UE,50,52, x,x,x)
	EXPECT_ERR_ASI(IRF_CE_W0_L1)
	wr	%g0,0x40,%ccr
UE_tg:
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
!$EV error(0,expr(@VA(.MAIN.UE_tne),16,16),1,IRF, UE,2,53, x,x,x, x,x,x)
	EXPECT_ERR_ASI(IRF_CE_W0_L1)
UE_tne:
	tne	%xcc,%l1+%l2
	subcc	%g6,TRAP_NOT_TAKEN,%g0
	RESULT_CHECK   
	ldx	[%g1+L1_OFT],%l1   

	!*************************************************
	! Save/Restore
	!*************************************************
    	ta	T_CHANGE_PRIV
	rdpr	%cwp,%g3
	ta	T_CHANGE_NONPRIV
!$EV error(0,expr(@VA(.MAIN.UE_save),16,16),1,IRF, x,x,x, UE,28,19, x,x,x) 
	EXPECT_ERR_ASI(IRF_CE_GL0_G4)
	mova	%icc,%l2,%g4
	nop
	nop
	nop
	nop
UE_save:     
	save	%g3,%g4,%g3
	ta	T_CHANGE_PRIV
	rdpr	%cwp,%o1
	subcc	%g3,%o1,%g0	    ! no window change
	tne	T_BAD_TRAP
	ta	T_CHANGE_NONPRIV
	RESULT_CHECK   
    
!$EV error(0,expr(@VA(.MAIN.UE_restore),16,16),1,IRF, UE,64,8, x,x,x, x,x,x) 
	EXPECT_ERR_ASI(IRF_CE_GL0_G4)
	mova	%icc,%l4,%g4
	save	%g0,%g0,%g0
    	nop
	nop
	nop
	nop
UE_restore:     
	restore	%g4,%g2,%l0
    	ta	T_CHANGE_PRIV
	rdpr	%cwp,%o1
	subcc	%o1,1,%g0	    ! no window change
	tne	T_BAD_TRAP
	ta	T_CHANGE_NONPRIV
	restore	%g0,%g0,%g0
	RESULT_CHECK
	add	%g0,0,%g4
    
	!*************************************************
	! Write status reg
!$EV error(0,expr(@VA(.MAIN.UE_wr),16,16),1,IRF, UE,2,52, x,x,x, x,x,x)
	EXPECT_ERR_ASI(IRF_CE_W0_L2)
	wr	%i1,0,%y
UE_wr:     
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
!$EV error(0,expr(@VA(.MAIN.UE_stx1),16,16),1,IRF, UE,8,53, x,x,x, UE,9,54)
	EXPECT_ERR_ASI(IRF_CE_W0_O1)
UE_stx1:     
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
!$EV error(0,expr(@VA(.MAIN.UE_stx2),16,16),1,IRF, x,x,x, UE,7,55, UE,0,56)
	EXPECT_ERR_ASI(IRF_CE_W0_O2)
UE_stx2:     
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
!$EV error(0,expr(@VA(.MAIN.UE_stx3),16,16),1,IRF, x,x,x, x,x,x, UE,0,57)
	EXPECT_ERR_ASI(IRF_CE_W0_L3)
UE_stx3:     
    	stx	%l3,[%o1+%o2]
	ldx	[DATAP+%o2],%o2
	cmp	%l5,%o2
	tne	T_BAD_TRAP
	RESULT_CHECK 
    	ldx	[%g1+L3_OFT],%l3
    
	add	%g0,0x18,%o2
    	std	%l2,[DATAP+%o2]
	nop
	nop
	nop
	nop
!$EV error(0,expr(@VA(.MAIN.UE_std1),16,16),1,IRF, x,x,x, x,x,x, UE,4,56)
	EXPECT_ERR_ASI(IRF_CE_W0_L6)
UE_std1:     
    	std	%l6,[DATAP+%o2]
	ldd	[DATAP+%o2],%i0
	srl	%l2,0,%o0
	cmp	%i0,%o0
	tne	T_BAD_TRAP
    	srl	%l3,0,%o1
	cmp	%i1,%o1
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
!$EV error(0,expr(@VA(.MAIN.UE_swap1),16,16),1,IRF, x,x,x, x,x,x, UE,23,58) 
	EXPECT_ERR_ASI(IRF_CE_W0_O2)
UE_swap1: 
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
!$EV error(0,expr(@VA(.MAIN.UE_swapa),16,16),1,IRF, x,x,x, UE,62,60, x,x,x) 
	EXPECT_ERR_ASI(IRF_CE_W0_L1)
UE_swapa: 
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
        wr      %g0,0x4,%fprs                      ! enable FPU

!$EV error(0,expr(@VA(.MAIN.UE_align),16,16),1,IRF, UE,35,29, x,x,x, x,x,x) 
	EXPECT_ERR_ASI(IRF_CE_W0_L6)
UE_align:    
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
	set	IRF_ERROR_STATUS_UE,%g6
	cmp	%g7,%g6
	tne	T_BAD_TRAP
    	stxa	%g7,[%g0]ASI_ASYNC_FAULT_STATUS	! status bits are write to clear
    
	wrpr	%g0,0,%gl	! return to gl 0 and pick up g5 parameters
	ldxa	[%g0]ASI_ASYNC_FAULT_ADDR,%g7
	and	%g7,0xfff,%g7	! syndrome (ie bit number) is unpredictable
	cmp	%g5,%g7
	tne	T_BAD_TRAP
	add	%g0,TRAP_TAKEN,%g5
    	done
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
