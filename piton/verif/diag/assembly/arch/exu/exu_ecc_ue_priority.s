// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: exu_ecc_ue_priority.s
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
 *  Description: Execute an assortment of trap conditions with uncorrectable
 *	    errors. The UE has priority in all cases, and is precise.
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
#define RD_UNCHANGED   0xfab
#define DUMMY_TRAP     0x131
    
#define RESULT_CHECK \
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

	add	%g0,RD_UNCHANGED,%l0

        ta	T_CHANGE_HPRIV
	sub	%g0,1,%i7	! write to clear error status before starting
	stxa	%i7,[%g0]ASI_ASYNC_FAULT_STATUS
	ta	T_CHANGE_NONHPRIV
    
 	!************************************
	! tag_overflow exceptions and ecc
	!************************************
!$EV error(0,expr(@VA(.MAIN.UE_taddcctv_ov),16,16),1,IRF, UE,5,4, x,x,x, x,x,x)
	EXPECT_ERR_ASI(IRF_CE_W0_L1)
UE_taddcctv_ov:     
	taddcctv %l1,%l4,%l0
	RESULT_CHECK
	subcc	%l0,RD_UNCHANGED,%g0
	tne	T_BAD_TRAP
	ldx	[%g1+L1_OFT],%l1
	nop			    ! prevent bypass in next case
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
	RESULT_CHECK  
	subcc	%l0,RD_UNCHANGED,%g0
	tne	T_BAD_TRAP
	ldx	[%g1+L1_OFT],%l1
	nop
	nop
	nop
	nop
       				    
	!*****
	! JMPL - address not aligned
	setx	bad_branch,%i0,%o1
	add	%g0,1,%o2
	nop
	nop
	nop
	nop
!$EV error(0,expr(@VA(.MAIN.RS2_ue_jmpl),16,16),1,IRF, UE,17,12, x,x,x,  x,x,x) 
	EXPECT_ERR_ASI(IRF_CE_W0_O1)
RS2_ue_jmpl:    
	jmpl	%o1+%o2,%l0
	nop
   	RESULT_CHECK  
	subcc	%l0,RD_UNCHANGED,%g0
	tne	T_BAD_TRAP
    
	!********************************************
	! Trap instructions
	!********************************************
	add	%g0,DUMMY_TRAP,%l1
	nop
	nop
	nop
	nop
!$EV error(0,expr(@VA(.MAIN.UE_ta),16,16),1,IRF, UE,50,52, x,x,x, x,x,x)
	EXPECT_ERR_ASI(IRF_CE_W0_L1)
	wr	%g0,0x40,%ccr
UE_ta:
	ta	%icc,%l1+0
   	RESULT_CHECK
	ldx	[%g1+L1_OFT],%l1
	nop
	nop
	nop
	nop
    
	!*************************************************
	! Save/Restore
	!*************************************************
    	ta	T_CHANGE_PRIV
	rdpr	%cwp,%g3
	wrpr	%g0,0,%cansave
	ta	T_CHANGE_NONPRIV
    
!$EV error(0,expr(@VA(.MAIN.UE_save),16,16),1,IRF, x,x,x, UE,28,19, x,x,x) 
	EXPECT_ERR_ASI(IRF_CE_GL0_G4)
	mova	%icc,%l2,%g4
	nop
	nop
	nop
	nop
UE_save:     
	save	%g3,%g4,%l0
	RESULT_CHECK
	subcc	%l0,RD_UNCHANGED,%g0
	tne	T_BAD_TRAP
    
	ta	T_CHANGE_PRIV
	rdpr	%cwp,%o1
	subcc	%g3,%o1,%g0	    ! no window change, no spill trap
	tne	T_BAD_TRAP
	wrpr	%g0,7,%cansave

	!**************************************
	! next case, masking the clean_win trap
	wrpr	%g0,1,%cleanwin
	wrpr	%g0,1,%canrestore
	ta	T_CHANGE_NONPRIV
!$EV error(0,expr(@VA(.MAIN.UE_save2),16,16),1,IRF, x,x,x, UE,28,19, x,x,x) 
	EXPECT_ERR_ASI(IRF_CE_GL0_G4)
	mova	%icc,%l2,%g4
	nop
	nop
	nop
	nop
UE_save2:     
	save	%g3,%g4,%g3
	RESULT_CHECK
    	subcc	%l0,RD_UNCHANGED,%g0
	tne	T_BAD_TRAP

	ta	T_CHANGE_PRIV
	rdpr	%cwp,%o1
	subcc	%g3,%o1,%g0	    ! no window change, no cleanwin trap
	tne	T_BAD_TRAP
	wrpr	%g0,7,%cleanwin

	!*******************
	! fill trap masking
	wrpr	%g0,0,%canrestore
	ta	T_CHANGE_NONPRIV
!$EV error(0,expr(@VA(.MAIN.UE_restore),16,16),1,IRF, UE,64,8, x,x,x, x,x,x) 
	EXPECT_ERR_ASI(IRF_CE_GL0_G4)
	mova	%icc,%l4,%g4
	save	%g0,%g0,%g0
	add	%g0,0xbaf,%l0
    	nop
	nop
	nop
	nop
UE_restore:     
	restore	%g4,%g2,%l0
	RESULT_CHECK
    	subcc	%l0,0xbaf,%g0
	tne	T_BAD_TRAP

    	ta	T_CHANGE_PRIV
	rdpr	%cwp,%o1
	subcc	%o1,1,%g0	    ! no window change, no fill trap
	tne	T_BAD_TRAP
	ta	T_CHANGE_NONPRIV
	restore	%g0,%g0,%g0
    	subcc	%l0,RD_UNCHANGED,%g0
	tne	T_BAD_TRAP

	add	%g0,0,%g4

	!******
	! FMOVR
	!******
        wr      %g0,0x4,%fprs                      ! enable FPU
!$EV error(0,expr(@VA(.MAIN.RS1_ce_fmovrgz),16,16),1,IRF, UE,47,2, x,x,x, x,x,x) 
	EXPECT_ERR_ASI(IRF_CE_W0_L1)
RS1_ce_fmovrgz:    
	fmovrdgz %l1,%f0,%f2		! no fp_disabled trap
	subcc	%g5,TRAP_TAKEN,%g0
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
