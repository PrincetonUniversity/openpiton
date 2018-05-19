// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: exu_ecc_stuck_at.s
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
 * Name:    exu_ecc_stuck_at.s
 * Date:    August 5, 2003
 *
 *  Description: Execute an assortment of instructions using error injection
 *	to simulate a stuck-at fault in rs1, rs2, and rs3.
 *	The idea is that if any operand has a CE 4 times, the 4th time is
 *	declared a UE (i.e. stuck). The loophole is that there is a single
 *      counter, so it's possible to declare a UE after only 2 errors on
 *	the same operand. This is fine--if there are that many CEs
 *	on a single execution, there's Something Bad happening anyway.    
 *
 *  Prashant's error injection is incompatible with SAS. 
 *  Must throw -sim_run_args=+asm_err_en 
 **********************************************************************/

!SIMS+ARGS: -sim_run_args=+asm_err_en -sim_run_args=+err_inj_dbg -nosas
    
#define  H_HT0_Corrected_ECC_error_0x63 hyp_ecc_ce_trap
#define  H_HT0_Internal_Processor_Error_0x29 hyp_int_proc_err_trap

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
	add	%g6,1,%g6; \
	done			; \
	nop; nop; nop; nop; nop;
       
#define  MAIN_PAGE_HV_ALSO             
#include "boot.s"

.global main
main:
    	wr      %g0,0x4,%fprs		! enable for mov %fccn ops
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

! If the CE trap is taken, the hardware safety is disabled.
    
!$EV error(0,expr(@VA(.MAIN.ce2ue_sllx),16,16),1,IRF, x,x,x, CE,3,x, x,x,x) 
!$EV error(0,expr(@VA(.MAIN.ce2ue_sllx),16,16),2,IRF, x,x,x, CE,3,x, x,x,x) 
!$EV error(0,expr(@VA(.MAIN.ce2ue_sllx),16,16),3,IRF, x,x,x, CE,3,x, x,x,x) 
!$EV error(0,expr(@VA(.MAIN.ce2ue_sllx),16,16),4,IRF, x,x,x, CE,3,x, x,x,x) 
!$EV error(0,expr(@VA(.MAIN.ce2ue_sllx),16,16),5,IRF, x,x,x, CE,3,x, x,x,x) 
	add	%g0,0,%g5
	add	%g0,0,%g7
	sllx	%l4,%l2,%i0
ce2ue_sllx:     
	sllx	%l4,%l2,%l0
	subcc	%g5,5,%g0
	tne	T_BAD_TRAP 
	subcc	%g7,0,%g0
	tne	T_BAD_TRAP  
    
    
! If the CE traps is disabled, then the hardware will declare a UE after
! the third attempt
	ta	T_CHANGE_HPRIV
	add	%g0,2,%i7	! disable CEs
	stxa	%i7,[%g0]ASI_ESTATE_ERROR_EN_REG
	ta	T_CHANGE_NONHPRIV
    
!$EV error(0,expr(@VA(.MAIN.ce2ue_sll),16,16),1,IRF, x,x,x, CE,3,x, x,x,x) 
!$EV error(0,expr(@VA(.MAIN.ce2ue_sll),16,16),2,IRF, x,x,x, CE,3,x, x,x,x) 
!$EV error(0,expr(@VA(.MAIN.ce2ue_sll),16,16),3,IRF, x,x,x, CE,3,x, x,x,x) 
!$EV error(0,expr(@VA(.MAIN.ce2ue_sll),16,16),4,IRF, x,x,x, CE,3,x, x,x,x) 
	add	%g0,0,%g5
	add	%g0,0,%g7
    	sll	%l4,%l2,%i0
ce2ue_sll:     
	sll	%l4,%l2,%l0
	subcc	%g5,0,%g0
	tne	T_BAD_TRAP 
	subcc	%g7,1,%g0
	tne	T_BAD_TRAP  
       
	ta	T_CHANGE_HPRIV
	add	%g0,0,%i7	! enable CEs
	stxa	%i7,[%g0]ASI_ESTATE_ERROR_EN_REG
	ta	T_CHANGE_NONHPRIV         
	sll	%l4,%l2,%l0		! once more, last CE already fixed
	cmp	%l0,%i0
	tne	T_BAD_TRAP


    	!*****
	! JMPL
	setx	bad_branch,%i0,%o1
	sub	%o1,15,%o1
	add	%o1,0,%o3
	add	%g0,15,%o2
	add	%l2,0,%l0
	ta	T_CHANGE_HPRIV
	add	%g0,2,%i7	! disable CEs
	stxa	%i7,[%g0]ASI_ESTATE_ERROR_EN_REG
	ta	T_CHANGE_NONHPRIV
!$EV error(0,expr(@VA(.MAIN.ce2ue_jmpl),16,16),1,IRF, CE,60,x, x,x,x, x,x,x) 
!$EV error(0,expr(@VA(.MAIN.ce2ue_jmpl),16,16),2,IRF, CE,60,x, x,x,x, x,x,x) 
!$EV error(0,expr(@VA(.MAIN.ce2ue_jmpl),16,16),3,IRF, CE,60,x, x,x,x, x,x,x) 
!$EV error(0,expr(@VA(.MAIN.ce2ue_jmpl),16,16),4,IRF, CE,60,x, x,x,x, x,x,x) 
	add	%g0,0,%g7
ce2ue_jmpl:    
	jmpl	%o1+%o2,%l0	    ! UE should prevent the jump
	nop
	nop	
    	subcc	%g5,0,%g0
	tne	T_BAD_TRAP 
	subcc	%g7,1,%g0
	tne	T_BAD_TRAP
	subcc	%l0,%l2,%g0
	tne	T_BAD_TRAP	    ! link reg unchanged

    
    	!**********************
	! Store
	!**********************
	setx	target_primary,%l0,%g1
	add	%g1,0,%o1
	add	%g0,0,%o2
    	stx	%l5,[%o1+%o2]
	nop
	nop
	nop
	nop
!$EV error(0,expr(@VA(.MAIN.ce2ue_stx1),16,16),1,IRF, x,x,x, x,x,x, CE,9,x)
!$EV error(0,expr(@VA(.MAIN.ce2ue_stx1),16,16),2,IRF, x,x,x, x,x,x, CE,9,x)
!$EV error(0,expr(@VA(.MAIN.ce2ue_stx1),16,16),3,IRF, x,x,x, x,x,x, CE,9,x)
!$EV error(0,expr(@VA(.MAIN.ce2ue_stx1),16,16),4,IRF, x,x,x, x,x,x, CE,9,x)
	add	%g0,0,%g7
ce2ue_stx1:     
    	stx	%l2,[%o1+%o2]
	ldx	[%g1+0x00],%o1
	cmp	%l5,%o1
	tne	T_BAD_TRAP
       	subcc	%g5,0,%g0
	tne	T_BAD_TRAP 
	subcc	%g7,1,%g0
	tne	T_BAD_TRAP

	! Although the logic is designed to catch stuck-at faults, it will
	! also catch a variety of problems related to multiple errors in
	! a small time window.
!$EV error(0,expr(@VA(.MAIN.ce2ue_stx2),16,16),1,IRF, x,x,x, x,x,x, CE,19,x)
!$EV error(0,expr(@VA(.MAIN.ce2ue_stx2),16,16),2,IRF, x,x,x, x,x,x, CE,20,x)
!$EV error(0,expr(@VA(.MAIN.ce2ue_stx2),16,16),3,IRF, x,x,x, x,x,x, CE,21,x)
!$EV error(0,expr(@VA(.MAIN.ce2ue_stx2),16,16),4,IRF, CE,12,x, x,x,x, CE,22,x)
	add	%g0,0,%g7
ce2ue_stx2:     
    	stx	%l3,[%o1+%o2]
	ldx	[%g1+0x00],%o1
	cmp	%l5,%o1
	tne	T_BAD_TRAP
       	subcc	%g5,0,%g0
	tne	T_BAD_TRAP 
	subcc	%g7,1,%g0
	tne	T_BAD_TRAP

    	! This example happens to be monitored.
!$EV error(0,expr(@VA(.MAIN.ce2ue_stx3),16,16),1,IRF, CE,12,x, x,x,x, x,x,x)
!$EV error(0,expr(@VA(.MAIN.ce2ue_stx3),16,16),2,IRF, CE,12,x, x,x,x, x,x,x)
!$EV error(0,expr(@VA(.MAIN.ce2ue_stx3),16,16),3,IRF, CE,12,x, x,x,x, x,x,x)
!$EV error(0,expr(@VA(.MAIN.ce2ue_stx3),16,16),4,IRF, CE,12,x, CE,1,x, CE,22,x)
	add	%g0,0,%g7
ce2ue_stx3:     
    	stx	%l4,[%o1+%o2]
	ldx	[%g1+0x00],%o1
	cmp	%l5,%o1
	tne	T_BAD_TRAP
       	subcc	%g5,0,%g0
	tne	T_BAD_TRAP 
	subcc	%g7,1,%g0
	tne	T_BAD_TRAP   
    
    	! This is one of the more twisted cases.
!$EV error(0,expr(@VA(.MAIN.ce2ue_stx4),16,16),1,IRF, CE,12,x, x,x,x, x,x,x)
!$EV error(0,expr(@VA(.MAIN.ce2ue_stx4),16,16),2,IRF, x,x,x, CE,13,x, x,x,x)
!$EV error(0,expr(@VA(.MAIN.ce2ue_stx4),16,16),3,IRF, x,x,x, x,x,x, CE,14,x)
!$EV error(0,expr(@VA(.MAIN.ce2ue_stx4),16,16),4,IRF, CE,15,x, x,x,x, x,x,x)
	add	%g0,0,%g7
ce2ue_stx4:     
    	stx	%l6,[%o1+%o2]
	ldx	[%g1+0x00],%o1
	cmp	%l5,%o1
	tne	T_BAD_TRAP
       	subcc	%g5,0,%g0
	tne	T_BAD_TRAP 
	subcc	%g7,1,%g0
	tne	T_BAD_TRAP        

    
!==================================================
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
	add	%g5,1,%g5	! increment CE counter
    	retry
	nop
    
          
.global hyp_int_proc_err_trap
hyp_int_proc_err_trap:	
    	wrpr	%g0,0,%gl
	add	%g7,1,%g7	! really should only ever see one per instruction
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
    
