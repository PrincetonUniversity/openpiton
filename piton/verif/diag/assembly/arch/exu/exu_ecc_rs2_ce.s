// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: exu_ecc_rs2_ce.s
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
 * Name:    exu_ecc_rs2_ce.s
 * Date:    July 15, 2003
 *
 *  Description: Execute an assortment of instructions with correctable
 *	    errors on RS2. IRF ecc bits=71:64, data=63:0
 *	    Pattern of errors works from both ends towards the middle.
 *
 *  Prashant's error injection is incompatible with SAS. 
 *  Must throw -sim_run_args=+asm_err_en 
 **********************************************************************/
    
!SIMS+ARGS: -sim_run_args=+asm_err_en -sim_run_args=+err_inj_dbg -nosas
        
#include "exu_ecc.h"
        
#define  H_HT0_Corrected_ECC_error_0x63 hyp_ecc_ce_trap

! setup for CE trap handler
#define EXPECT_ERR_ASI(bit,reg) \
	add	%g0,bit,%g5	; \
	sll	%g5,IRF_CE_BIT_SHIFT,%g5; \
	or	%g5,reg,%g5	; 

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

#define PRIV_TRAP_REG %g4
	add	%g0,0,PRIV_TRAP_REG
    
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

        ta	T_CHANGE_HPRIV
	sub	%g0,1,%i7	! write to clear error status before starting
	stxa	%i7,[%g0]ASI_ASYNC_FAULT_STATUS
	ta	T_CHANGE_NONHPRIV


! sanity check for rs2 error injection
!$EV error(0,expr(@VA(.MAIN.RS2_ce_sanity),16,16),1,IRF, x,x,x, CE,0,x, x,x,x)
	EXPECT_ERR_ASI(IRF_CE_BIT_0, IRF_CE_W0_L2)
	add	%l1,%l2,%i0
RS2_ce_sanity:     
    	add	%l1,%l2,%l0
	cmp	%l0,%i0
	tne	T_BAD_TRAP
	subcc	%g5,TRAP_TAKEN,%g0
	tne	T_BAD_TRAP   
    
	!*******************
	! Shift ops
	!*******************
!$EV error(0,expr(@VA(.MAIN.RS2_ce_sll),16,16),1,IRF, x,x,x, CE,0,x, x,x,x)
	EXPECT_ERR_ASI(IRF_CE_BIT_0, IRF_CE_W0_L3)
	sll	%l2,%l3,%i0
RS2_ce_sll:     
    	sll	%l2,%l3,%l0
	cmp	%l0,%i0
	tne	T_BAD_TRAP
	subcc	%g5,TRAP_TAKEN,%g0
	tne	T_BAD_TRAP   

!$EV error(0,expr(@VA(.MAIN.RS2_ce_srl),16,16),1,IRF, x,x,x, CE,1,x, x,x,x) 
	EXPECT_ERR_ASI(IRF_CE_BIT_1, IRF_CE_W0_L1)
	srl	%l2,%l1,%i0
RS2_ce_srl:     
	srl	%l2,%l1,%l0
    	cmp	%l0,%i0
	tne	T_BAD_TRAP	    
	subcc	%g5,TRAP_TAKEN,%g0
	tne	T_BAD_TRAP   
    				    
!$EV error(0,expr(@VA(.MAIN.RS2_ce_sra),16,16),1,IRF, x,x,x, CE,2,x, x,x,x) 
	EXPECT_ERR_ASI(IRF_CE_BIT_2, IRF_CE_W0_L2)
	sra	%l3,%l2,%i0
RS2_ce_sra:     
	sra	%l3,%l2,%l0
	cmp	%l0,%i0
	tne	T_BAD_TRAP
	subcc	%g5,TRAP_TAKEN,%g0
	tne	T_BAD_TRAP   
				    
!$EV error(0,expr(@VA(.MAIN.RS2_ce_sllx),16,16),1,IRF, x,x,x, CE,3,x, x,x,x) 
	EXPECT_ERR_ASI(IRF_CE_BIT_3, IRF_CE_W0_L2)
	sllx	%l4,%l2,%i0
RS2_ce_sllx:     
	sllx	%l4,%l2,%l0
	cmp	%l0,%i0
	tne	T_BAD_TRAP	    
	subcc	%g5,TRAP_TAKEN,%g0
	tne	T_BAD_TRAP   
    				    
!$EV error(0,expr(@VA(.MAIN.RS2_ce_srlx),16,16),1,IRF, x,x,x, CE,4,x, x,x,x) 
	EXPECT_ERR_ASI(IRF_CE_BIT_4, IRF_CE_W0_L2)
	srlx	%l5,%l2,%i0
RS2_ce_srlx:     
	srlx	%l5,%l2,%l0
    	cmp	%l0,%i0
	tne	T_BAD_TRAP
	subcc	%g5,TRAP_TAKEN,%g0
	tne	T_BAD_TRAP   
    				    
!$EV error(0,expr(@VA(.MAIN.RS2_ce_srax),16,16),1,IRF, x,x,x, CE,5,x, x,x,x) 
	EXPECT_ERR_ASI(IRF_CE_BIT_5, IRF_CE_W0_L1)
	srax	%l6,%l1,%i0
RS2_ce_srax:     
	srax	%l6,%l1,%l0
    	cmp	%l0,%i0
	tne	T_BAD_TRAP
	subcc	%g5,TRAP_TAKEN,%g0
	tne	T_BAD_TRAP   
    
    	!**********************
	! Arithmetic Ops
	!**********************
    	wr	%g0,%g0,%ccr	    

!$EV error(0,expr(@VA(.MAIN.RS2_ce_add),16,16),1,IRF, x,x,x, CE,071,x, x,x,x)
	EXPECT_ERR_ASI(IRF_CE_BIT_71, IRF_CE_W0_L2)
	add	%l1,%l2,%i0
RS2_ce_add:     
    	add	%l1,%l2,%l0
	cmp	%l0,%i0
	tne	T_BAD_TRAP
	subcc	%g5,TRAP_TAKEN,%g0
	tne	T_BAD_TRAP   

!$EV error(0,expr(@VA(.MAIN.RS2_ce_addc),16,16),1,IRF, x,x,x, CE,070,x, x,x,x) 
	EXPECT_ERR_ASI(IRF_CE_BIT_70, IRF_CE_W0_L1)
	addc	%l2,%l1,%i0
RS2_ce_addc:     
	addc	%l2,%l1,%l0
    	cmp	%l0,%i0
	tne	T_BAD_TRAP	    
	subcc	%g5,TRAP_TAKEN,%g0
	tne	T_BAD_TRAP   
    				    
!$EV error(0,expr(@VA(.MAIN.RS2_ce_addcc),16,16),1,IRF, x,x,x, CE,069,x, x,x,x) 
	EXPECT_ERR_ASI(IRF_CE_BIT_69, IRF_CE_W0_L2)
	addcc	%l3,%l2,%i0
RS2_ce_addcc:     
	addcc	%l3,%l2,%l0
	cmp	%l0,%i0
	tne	T_BAD_TRAP	    
	subcc	%g5,TRAP_TAKEN,%g0
	tne	T_BAD_TRAP   
				    
!$EV error(0,expr(@VA(.MAIN.RS2_ce_addccc),16,16),1,IRF, x,x,x, CE,068,x, x,x,x)
	EXPECT_ERR_ASI(IRF_CE_BIT_68, IRF_CE_W0_L2)
    	wr	%g0,%g0,%ccr 
	addccc	%l4,%l2,%i0
    	wr	%g0,%g0,%ccr
RS2_ce_addccc:     
	addccc	%l4,%l2,%l0
	cmp	%l0,%i0
	tne	T_BAD_TRAP	    
	subcc	%g5,TRAP_TAKEN,%g0
	tne	T_BAD_TRAP   

!$EV error(0,expr(@VA(.MAIN.RS2_ce_taddcc),16,16),1,IRF, x,x,x, CE,067,x, x,x,x) 
	EXPECT_ERR_ASI(IRF_CE_BIT_67, IRF_CE_W0_L2)
	taddcc	%l5,%l2,%i0
RS2_ce_taddcc:     
	taddcc	%l5,%l2,%l0
    	cmp	%l0,%i0
	tne	T_BAD_TRAP
	subcc	%g5,TRAP_TAKEN,%g0
	tne	T_BAD_TRAP   

!$EV error(0,expr(@VA(.MAIN.RS2_ce_taddcctv),16,16),1,IRF, x,x,x, CE,066,x, x,x,x)
	EXPECT_ERR_ASI(IRF_CE_BIT_66, IRF_CE_W0_L1)
	taddcctv %l5,%l1,%i0	    ! no tag_overflow
RS2_ce_taddcctv:     
	taddcctv %l5,%l1,%l0
    	cmp	%l0,%i0
	tne	T_BAD_TRAP			    
	subcc	%g5,TRAP_TAKEN,%g0
	tne	T_BAD_TRAP   
        
!$EV error(0,expr(@VA(.MAIN.RS2_ce_sub),16,16),1,IRF, x,x,x, CE,065,x, x,x,x)
	EXPECT_ERR_ASI(IRF_CE_BIT_65, IRF_CE_W0_L2)
	sub	%l1,%l2,%i0
RS2_ce_sub:     
    	sub	%l1,%l2,%l0
	cmp	%l0,%i0
	tne	T_BAD_TRAP
	subcc	%g5,TRAP_TAKEN,%g0
	tne	T_BAD_TRAP   

!$EV error(0,expr(@VA(.MAIN.RS2_ce_subc),16,16),1,IRF, x,x,x, CE,064,x, x,x,x) 
	EXPECT_ERR_ASI(IRF_CE_BIT_64, IRF_CE_W0_L1)
	subc	%l2,%l1,%i0
RS2_ce_subc:     
	subc	%l2,%l1,%l0
    	cmp	%l0,%i0
	tne	T_BAD_TRAP	    
	subcc	%g5,TRAP_TAKEN,%g0
	tne	T_BAD_TRAP   
    				    
!$EV error(0,expr(@VA(.MAIN.RS2_ce_subcc),16,16),1,IRF, x,x,x, CE,063,x, x,x,x) 
	EXPECT_ERR_ASI(IRF_CE_BIT_63, IRF_CE_W0_L2)
	subcc	%l3,%l2,%i0
RS2_ce_subcc:     
	subcc	%l3,%l2,%l0
	cmp	%l0,%i0
	tne	T_BAD_TRAP	    
	subcc	%g5,TRAP_TAKEN,%g0
	tne	T_BAD_TRAP   
				    
!$EV error(0,expr(@VA(.MAIN.RS2_ce_subccc),16,16),1,IRF, x,x,x, CE,062,x, x,x,x)
	EXPECT_ERR_ASI(IRF_CE_BIT_62, IRF_CE_W0_L2)
    	wr	%g0,%g0,%ccr    
	subccc	%l4,%l2,%i0
    	wr	%g0,%g0,%ccr    
RS2_ce_subccc:     
	subccc	%l4,%l2,%l0
	cmp	%l0,%i0
	tne	T_BAD_TRAP	    
	subcc	%g5,TRAP_TAKEN,%g0
	tne	T_BAD_TRAP   
    				    
!$EV error(0,expr(@VA(.MAIN.RS2_ce_tsubcc),16,16),1,IRF, x,x,x, CE,061,x, x,x,x) 
	EXPECT_ERR_ASI(IRF_CE_BIT_61, IRF_CE_W0_L1)
	tsubcc	%i1,%l1,%i0
RS2_ce_tsubcc:     
	tsubcc	%i1,%l1,%l0
    	cmp	%l0,%i0
	tne	T_BAD_TRAP
	subcc	%g5,TRAP_TAKEN,%g0
	tne	T_BAD_TRAP   

!$EV error(0,expr(@VA(.MAIN.RS2_ce_tsubcctv),16,16),1,IRF, x,x,x, CE,060,x, x,x,x) 
	EXPECT_ERR_ASI(IRF_CE_BIT_60, IRF_CE_W0_L1)
	tsubcctv %i1,%l1,%i0	    ! no tag_overflow
RS2_ce_tsubcctv:     
	tsubcctv %i1,%l1,%l0
    	cmp	%l0,%i0
	tne	T_BAD_TRAP
	subcc	%g5,TRAP_TAKEN,%g0
	tne	T_BAD_TRAP   

!$EV error(0,expr(@VA(.MAIN.RS2_ce_tsubcctv_ov1),16,16),1,IRF, x,x,x, CE,1,x, x,x,x) 
	EXPECT_ERR_ASI(IRF_CE_BIT_1, IRF_CE_W0_L1)
	tsubcctv %i1,%l1,%i0	    ! no tag_overflow
RS2_ce_tsubcctv_ov1:     
	tsubcctv %i1,%l1,%l0	    ! ce on bit 1 alters overflow state
    	cmp	%l0,%i0
	tne	T_BAD_TRAP
	subcc	%g5,TRAP_TAKEN,%g0
	tne	T_BAD_TRAP   

    
 	!************************************
	! tag_overflow exceptions and ce
	!************************************
!$EV error(0,expr(@VA(.MAIN.RS2_ce_taddcctv_ov),16,16),1,IRF, x,x,x, CE,059,x, x,x,x)
	EXPECT_ERR_ASI(IRF_CE_BIT_59, IRF_CE_W0_L6)
	add	%g0,0,%g6
	taddcctv %l1,%l6,%i0	    ! tag_overflow exception, op 2
	nop			    ! nops to prevent silent fix of ecc
	nop
RS2_ce_taddcctv_ov:     
	taddcctv %l1,%l6,%l0	    ! ce does not alter tag_overflow state
	subcc	%g6,2,%g0	    ! expect two traps to have happened
	tne	T_BAD_TRAP   
	subcc	%g5,TRAP_TAKEN,%g0
	tne	T_BAD_TRAP   

!$EV error(0,expr(@VA(.MAIN.RS2_ce_tsubcctv_ov2),16,16),1,IRF, x,x,x, CE,0,x, x,x,x) 
	EXPECT_ERR_ASI(IRF_CE_BIT_0, IRF_CE_W0_I2)
	add	%g0,0,%g6
	tsubcctv %l1,%i2,%i0	    ! tag_overflow
        nop			    ! nops to prevent silent fix of ecc
	nop
RS2_ce_tsubcctv_ov2:     
	tsubcctv %l1,%i2,%l0	    ! ce on bit 0 alters overflow state
	subcc	%g6,2,%g0	    ! expect two traps to have happened
	tne	T_BAD_TRAP
	subcc	%g5,TRAP_TAKEN,%g0
	tne	T_BAD_TRAP

 	!********************************************************************
	! Design change: cancelled ops are no longer silently fixed 9/24/03
	!********************************************************************
!$EV error(0,expr(@VA(.MAIN.RS2_ce_taddcctv_ov1),16,16),1,IRF, x,x,x, CE,059,x, x,x,x)
	EXPECT_ERR_ASI(IRF_CE_BIT_59, IRF_CE_W0_L6)
	add	%g0,0,%g6
	ba	%icc,bypass_1
	nop
.align 0x20
bypass_1:			    ! guarantee no icache miss
	nop  
    	taddcctv %l1,%l6,%i0	    ! tag_overflow exception, op 2
RS2_ce_taddcctv_ov1:     
	taddcctv %l1,%l6,%l0	    ! ce does not alter tag_overflow state
	subcc	%g6,2,%g0	    ! expect two traps to have happened
	tne	T_BAD_TRAP   
	subcc	%g5,TRAP_TAKEN,%g0
	tne	T_BAD_TRAP   

!$EV error(0,expr(@VA(.MAIN.RS2_ce_tsubcctv_ov3),16,16),1,IRF, x,x,x, CE,0,x, x,x,x) 
	EXPECT_ERR_ASI(IRF_CE_BIT_0, IRF_CE_W0_I2)
	add	%g0,0,%g6
	ba	%icc,bypass_2
	nop
.align 0x20
bypass_2:			    ! guarantee no icache miss
	nop  
    	tsubcctv %l1,%i2,%i0	    ! tag_overflow
RS2_ce_tsubcctv_ov3:     
	tsubcctv %l1,%i2,%l0	    ! ce on bit 0 alters overflow state
	subcc	%g6,2,%g0	    ! expect two traps to have happened
	tne	T_BAD_TRAP
	subcc	%g5,TRAP_TAKEN,%g0
	tne	T_BAD_TRAP   
    

	!*******************
	! Logical ops
	!*******************
!$EV error(0,expr(@VA(.MAIN.RS2_ce_and),16,16),1,IRF, x,x,x, CE,058,x, x,x,x)
	EXPECT_ERR_ASI(IRF_CE_BIT_58, IRF_CE_W0_L2)
	and	%l1,%l2,%i0
RS2_ce_and:     
    	and	%l1,%l2,%l0
	cmp	%l0,%i0
	tne	T_BAD_TRAP
	subcc	%g5,TRAP_TAKEN,%g0
	tne	T_BAD_TRAP   

!$EV error(0,expr(@VA(.MAIN.RS2_ce_andcc),16,16),1,IRF, x,x,x, CE,057,x, x,x,x) 
	EXPECT_ERR_ASI(IRF_CE_BIT_57, IRF_CE_W0_L1)
	andcc	%l2,%l1,%i0
RS2_ce_andcc:     
	andcc	%l2,%l1,%l0
    	cmp	%l0,%i0
	tne	T_BAD_TRAP	    
	subcc	%g5,TRAP_TAKEN,%g0
	tne	T_BAD_TRAP   
    				    
!$EV error(0,expr(@VA(.MAIN.RS2_ce_andn),16,16),1,IRF, x,x,x, CE,056,x, x,x,x) 
	EXPECT_ERR_ASI(IRF_CE_BIT_56, IRF_CE_W0_L2)
	andn	%l3,%l2,%i0
RS2_ce_andn:     
	andn	%l3,%l2,%l0
	cmp	%l0,%i0
	tne	T_BAD_TRAP	    
	subcc	%g5,TRAP_TAKEN,%g0
	tne	T_BAD_TRAP   
				    
!$EV error(0,expr(@VA(.MAIN.RS2_ce_andncc),16,16),1,IRF, x,x,x, CE,055,x, x,x,x) 
	EXPECT_ERR_ASI(IRF_CE_BIT_55, IRF_CE_W0_L2)
	andncc	%l4,%l2,%i0
RS2_ce_andncc:     
	andncc	%l4,%l2,%l0
	cmp	%l0,%i0
	tne	T_BAD_TRAP	    
	subcc	%g5,TRAP_TAKEN,%g0
	tne	T_BAD_TRAP   
    				    
!$EV error(0,expr(@VA(.MAIN.RS2_ce_or),16,16),1,IRF, x,x,x, CE,054,x, x,x,x) 
	EXPECT_ERR_ASI(IRF_CE_BIT_54, IRF_CE_W0_L2)
	or	%l5,%l2,%i0
RS2_ce_or:     
	or	%l5,%l2,%l0
    	cmp	%l0,%i0
	tne	T_BAD_TRAP
	subcc	%g5,TRAP_TAKEN,%g0
	tne	T_BAD_TRAP   
    				    
!$EV error(0,expr(@VA(.MAIN.RS2_ce_orcc),16,16),1,IRF, x,x,x, CE,053,x, x,x,x) 
	EXPECT_ERR_ASI(IRF_CE_BIT_53, IRF_CE_W0_L1)
	orcc %l6,%l1,%i0
RS2_ce_orcc:     
	orcc %l6,%l1,%l0
    	cmp	%l0,%i0
	tne	T_BAD_TRAP
	subcc	%g5,TRAP_TAKEN,%g0
	tne	T_BAD_TRAP   

!$EV error(0,expr(@VA(.MAIN.RS2_ce_orn),16,16),1,IRF, x,x,x, CE,052,x, x,x,x)
	EXPECT_ERR_ASI(IRF_CE_BIT_52, IRF_CE_W0_L2)
	orn	%l1,%l2,%i0
RS2_ce_orn:     
    	orn	%l1,%l2,%l0
	cmp	%l0,%i0
	tne	T_BAD_TRAP
	subcc	%g5,TRAP_TAKEN,%g0
	tne	T_BAD_TRAP   

!$EV error(0,expr(@VA(.MAIN.RS2_ce_orncc),16,16),1,IRF, x,x,x, CE,051,x, x,x,x) 
	EXPECT_ERR_ASI(IRF_CE_BIT_51, IRF_CE_W0_L1)
	orncc	%l2,%l1,%i0
RS2_ce_orncc:     
	orncc	%l2,%l1,%l0
    	cmp	%l0,%i0
	tne	T_BAD_TRAP	    
	subcc	%g5,TRAP_TAKEN,%g0
	tne	T_BAD_TRAP   
    				    
!$EV error(0,expr(@VA(.MAIN.RS2_ce_xor),16,16),1,IRF, x,x,x, CE,050,x, x,x,x) 
	EXPECT_ERR_ASI(IRF_CE_BIT_50, IRF_CE_W0_L2)
	xor	%l3,%l2,%i0
RS2_ce_xor:     
	xor	%l3,%l2,%l0
	cmp	%l0,%i0
	tne	T_BAD_TRAP	    
	subcc	%g5,TRAP_TAKEN,%g0
	tne	T_BAD_TRAP   
				    
!$EV error(0,expr(@VA(.MAIN.RS2_ce_xorcc),16,16),1,IRF, x,x,x, CE,048,x, x,x,x) 
	EXPECT_ERR_ASI(IRF_CE_BIT_48, IRF_CE_W0_L2)
	xorcc	%l4,%l2,%i0
RS2_ce_xorcc:     
	xorcc	%l4,%l2,%l0
	cmp	%l0,%i0
	tne	T_BAD_TRAP	    
	subcc	%g5,TRAP_TAKEN,%g0
	tne	T_BAD_TRAP   
    				    
!$EV error(0,expr(@VA(.MAIN.RS2_ce_xnor),16,16),1,IRF, x,x,x, CE,047,x, x,x,x) 
	EXPECT_ERR_ASI(IRF_CE_BIT_47, IRF_CE_W0_L2)
	xnor	%l5,%l2,%i0
RS2_ce_xnor:     
	xnor	%l5,%l2,%l0
    	cmp	%l0,%i0
	tne	T_BAD_TRAP
	subcc	%g5,TRAP_TAKEN,%g0
	tne	T_BAD_TRAP   
    				    
!$EV error(0,expr(@VA(.MAIN.RS2_ce_xnorcc),16,16),1,IRF, x,x,x, CE,046,x, x,x,x) 
	EXPECT_ERR_ASI(IRF_CE_BIT_46, IRF_CE_W0_L1)
	xnorcc %l6,%l1,%i0
RS2_ce_xnorcc:     
	xnorcc	%l6,%l1,%l0
    	cmp	%l0,%i0
	tne	T_BAD_TRAP
	subcc	%g5,TRAP_TAKEN,%g0
	tne	T_BAD_TRAP   

    

	!***********************
	! Multiply, divide  ops
	!***********************
!$EV error(0,expr(@VA(.MAIN.RS2_ce_mulx),16,16),1,IRF, x,x,x, CE,045,x, x,x,x) 
	EXPECT_ERR_ASI(IRF_CE_BIT_45, IRF_CE_W0_L2)
	mulx	%l5,%l2,%i0
RS2_ce_mulx:     
	mulx	%l5,%l2,%l0
    	cmp	%l0,%i0
	tne	T_BAD_TRAP
	subcc	%g5,TRAP_TAKEN,%g0
	tne	T_BAD_TRAP   
    				    
!$EV error(0,expr(@VA(.MAIN.RS2_ce_umul),16,16),1,IRF, x,x,x, CE,6,x, x,x,x) 
	EXPECT_ERR_ASI(IRF_CE_BIT_6, IRF_CE_W0_L7)
	umul	%l6,%l7,%i0
RS2_ce_umul:     
	umul	%l6,%l7,%l0
    	cmp	%l0,%i0
	tne	T_BAD_TRAP
	subcc	%g5,TRAP_TAKEN,%g0
	tne	T_BAD_TRAP   

!$EV error(0,expr(@VA(.MAIN.RS2_ce_smul),16,16),1,IRF, x,x,x, CE,7,x, x,x,x) 
	EXPECT_ERR_ASI(IRF_CE_BIT_7, IRF_CE_W0_L3)
	smul	%l5,%l3,%i0
RS2_ce_smul:     
	smul	%l5,%l3,%l0
    	cmp	%l0,%i0
	tne	T_BAD_TRAP
	subcc	%g5,TRAP_TAKEN,%g0
	tne	T_BAD_TRAP   
    				    
!$EV error(0,expr(@VA(.MAIN.RS2_ce_umulcc),16,16),1,IRF, x,x,x, CE,8,x, x,x,x) 
	EXPECT_ERR_ASI(IRF_CE_BIT_8, IRF_CE_W0_L5)
	umulcc	%l6,%l5,%i0
RS2_ce_umulcc:     
	umulcc	%l6,%l5,%l0
    	cmp	%l0,%i0
	tne	T_BAD_TRAP
	subcc	%g5,TRAP_TAKEN,%g0
	tne	T_BAD_TRAP   

!$EV error(0,expr(@VA(.MAIN.RS2_ce_smulcc),16,16),1,IRF, x,x,x, CE,9,x, x,x,x) 
	EXPECT_ERR_ASI(IRF_CE_BIT_9, IRF_CE_W0_L4)
	smulcc	%l5,%l4,%i0
RS2_ce_smulcc:     
	smulcc	%l5,%l4,%l0
    	cmp	%l0,%i0
	tne	T_BAD_TRAP
	subcc	%g5,TRAP_TAKEN,%g0
	tne	T_BAD_TRAP   
    				    
!$EV error(0,expr(@VA(.MAIN.RS2_ce_mulscc),16,16),1,IRF, x,x,x, CE,010,x, x,x,x) 
	EXPECT_ERR_ASI(IRF_CE_BIT_10, IRF_CE_W0_L4)
    	wr	%l0,%g0,%y 
	mulscc	%l6,%l4,%i0
    	wr	%l0,%g0,%y 
RS2_ce_mulscc:     
	mulscc	%l6,%l4,%l0
    	cmp	%l0,%i0
	tne	T_BAD_TRAP
	subcc	%g5,TRAP_TAKEN,%g0
	tne	T_BAD_TRAP   

!$EV error(0,expr(@VA(.MAIN.RS2_ce_sdivx),16,16),1,IRF, x,x,x, CE,044,x, x,x,x) 
	EXPECT_ERR_ASI(IRF_CE_BIT_44, IRF_CE_W0_L2)
	sdivx	%l5,%l2,%i0
RS2_ce_sdivx:     
	sdivx	%l5,%l2,%l0
    	cmp	%l0,%i0
	tne	T_BAD_TRAP
	subcc	%g5,TRAP_TAKEN,%g0
	tne	T_BAD_TRAP   
    				    
!$EV error(0,expr(@VA(.MAIN.RS2_ce_udivx),16,16),1,IRF, x,x,x, CE,043,x, x,x,x) 
	EXPECT_ERR_ASI(IRF_CE_BIT_43, IRF_CE_W0_L7)
	udivx	%l6,%l7,%i0
RS2_ce_udivx:     
	udivx	%l6,%l7,%l0
    	cmp	%l0,%i0
	tne	T_BAD_TRAP
	subcc	%g5,TRAP_TAKEN,%g0
	tne	T_BAD_TRAP   

	! for 32-bit divides, create CE on both lower and upper half of rs2
	! upper half of rs2 is unused by the operation...

!$EV error(0,expr(@VA(.MAIN.RS2_ce_sdiv_lo),16,16),1,IRF, x,x,x, CE,011,x, x,x,x)
	EXPECT_ERR_ASI(IRF_CE_BIT_11, IRF_CE_W0_L3)
    	wr	%l0,%g0,%y 
	sdiv	%l2,%l3,%i0
RS2_ce_sdiv_lo:     
	sdiv	%l2,%l3,%l0
    	cmp	%l0,%i0
	tne	T_BAD_TRAP
	subcc	%g5,TRAP_TAKEN,%g0
	tne	T_BAD_TRAP   

!$EV error(0,expr(@VA(.MAIN.RS2_ce_sdiv_hi),16,16),1,IRF, x,x,x, CE,042,x, x,x,x)
	EXPECT_ERR_ASI(IRF_CE_BIT_42, IRF_CE_W0_L3)
    	wr	%l0,%g0,%y 
	sdiv	%l2,%l3,%i0
RS2_ce_sdiv_hi:     
	sdiv	%l2,%l3,%l0
    	cmp	%l0,%i0
	tne	T_BAD_TRAP
	subcc	%g5,TRAP_TAKEN,%g0
	tne	T_BAD_TRAP   
    
!$EV error(0,expr(@VA(.MAIN.RS2_ce_udiv_lo),16,16),1,IRF, x,x,x, CE,012,x, x,x,x)
	EXPECT_ERR_ASI(IRF_CE_BIT_12, IRF_CE_W0_L4)
    	wr	%l0,%g0,%y 
	udiv	%l3,%l4,%i0
RS2_ce_udiv_lo:    
	udiv	%l3,%l4,%l0
    	cmp	%l0,%i0
	tne	T_BAD_TRAP
	subcc	%g5,TRAP_TAKEN,%g0
	tne	T_BAD_TRAP   

!$EV error(0,expr(@VA(.MAIN.RS2_ce_udiv_hi),16,16),1,IRF, x,x,x, CE,043,x, x,x,x)
	EXPECT_ERR_ASI(IRF_CE_BIT_43, IRF_CE_W0_L4)
    	wr	%l0,%g0,%y 
	udiv	%l3,%l4,%i0
RS2_ce_udiv_hi:     
	udiv	%l3,%l4,%l0
    	cmp	%l0,%i0
	tne	T_BAD_TRAP
	subcc	%g5,TRAP_TAKEN,%g0
	tne	T_BAD_TRAP   

!$EV error(0,expr(@VA(.MAIN.RS2_ce_sdivcc_lo),16,16),1,IRF, x,x,x, CE,013,x, x,x,x)
	EXPECT_ERR_ASI(IRF_CE_BIT_13, IRF_CE_W0_L5)
    	wr	%l0,%g0,%y 
	sdivcc	%l4,%l5,%i0
RS2_ce_sdivcc_lo:     
	sdivcc	%l4,%l5,%l0
    	cmp	%l0,%i0
	tne	T_BAD_TRAP

!$EV error(0,expr(@VA(.MAIN.RS2_ce_sdivcc_hi),16,16),1,IRF, x,x,x, CE,042,x, x,x,x)
	EXPECT_ERR_ASI(IRF_CE_BIT_42, IRF_CE_W0_L5)
    	wr	%l0,%g0,%y 
	sdivcc	%l4,%l5,%i0
RS2_ce_sdivcc_hi:     
	sdivcc	%l4,%l5,%l0
    	cmp	%l0,%i0
	tne	T_BAD_TRAP    
	subcc	%g5,TRAP_TAKEN,%g0
	tne	T_BAD_TRAP   
    
!$EV error(0,expr(@VA(.MAIN.RS2_ce_udivcc_lo),16,16),1,IRF, x,x,x, CE,014,x, x,x,x)
	EXPECT_ERR_ASI(IRF_CE_BIT_14, IRF_CE_W0_L6)
    	wr	%l0,%g0,%y 
	udivcc	%l5,%l6,%i0
RS2_ce_udivcc_lo:     
	udivcc	%l5,%l6,%l0
    	cmp	%l0,%i0
	tne	T_BAD_TRAP
	subcc	%g5,TRAP_TAKEN,%g0
	tne	T_BAD_TRAP   

!$EV error(0,expr(@VA(.MAIN.RS2_ce_udivcc_hi),16,16),1,IRF, x,x,x, CE,041,x, x,x,x)
	EXPECT_ERR_ASI(IRF_CE_BIT_41, IRF_CE_W0_L7)
    	wr	%l0,%g0,%y 
	udivcc	%l6,%l7,%i0
RS2_ce_udivcc_hi:     
	udivcc	%l6,%l7,%l0
    	cmp	%l0,%i0
	tne	T_BAD_TRAP    
	subcc	%g5,TRAP_TAKEN,%g0
	tne	T_BAD_TRAP   

	!*********************
	! divide by zero cases
	!*********************
!$EV error(0,expr(@VA(.MAIN.RS2_ce_sdivx_0),16,16),1,IRF, x,x,x, CE,040,x, x,x,x)
	EXPECT_ERR_ASI(IRF_CE_BIT_40, IRF_CE_W0_L1)
	add	%g0,0,%g6 
	sdivx	%l5,%l1,%i0
RS2_ce_sdivx_0:     
	sdivx	%l5,%l1,%l0
    	subcc	%g6,2,%g0	! expect 2 traps
	tne	T_BAD_TRAP 
	subcc	%g5,TRAP_TAKEN,%g0
	tne	T_BAD_TRAP   

	!************************************************************
	! CASA, CASXA:	rs2 is the comparison register
	!************************************************************
	setx	target_secondary,%l0,%o1
	add	%l2,%g0,%o2
	add	%g0,%g0,%o3
	stxa	%o2,[%o1]ASI_SECONDARY
	nop
	nop
	nop
	nop
!$EV error(0,expr(@VA(.MAIN.RS2_ce_casxa),16,16),1,IRF, x,x,x, CE,039,x, x,x,x) 
	EXPECT_ERR_ASI(IRF_CE_BIT_39, IRF_CE_W0_O2)
RS2_ce_casxa: 
	casxa	[%o1]ASI_SECONDARY,%o2,%o3
	cmp	%l2,%o3
	tne	T_BAD_TRAP
	ldxa	[%o1]ASI_SECONDARY,%o6
	cmp	%o6,%g0
	tne	T_BAD_TRAP
	subcc	%g5,TRAP_TAKEN,%g0
	tne	T_BAD_TRAP   

	add	%i2,%g0,%o2
	add	%g0,%g0,%o3
	stwa	%o2,[%o1]ASI_SECONDARY
	nop
	nop
	nop
	nop
!$EV error(0,expr(@VA(.MAIN.RS2_ce_casa),16,16),1,IRF, x,x,x, CE,015,x, x,x,x) 
	EXPECT_ERR_ASI(IRF_CE_BIT_15, IRF_CE_W0_O2)
RS2_ce_casa: 
	casa	[%o1]ASI_SECONDARY,%o2,%o3  ! swap %i2 value and 0
	cmp	%i2,%o3
	tne	T_BAD_TRAP   
	lduwa	[%o1]ASI_SECONDARY,%o6
	cmp	%o6,%g0
	tne	T_BAD_TRAP
	subcc	%g5,TRAP_TAKEN,%g0
	tne	T_BAD_TRAP   
    

	!**********************************************
	! Several cases with rs2 as part of the address
	!**********************************************

	!******
    	! FLUSH
    	setx	dummy_addr,%l0,%o1
	add	%g0,32,%o2
	nop
	nop
	nop
	nop
!$EV error(0,expr(@VA(.MAIN.RS2_ce_flush),16,16),1,IRF, x,x,x, CE,016,x, x,x,x) 
	EXPECT_ERR_ASI(IRF_CE_BIT_16, IRF_CE_W0_O2)
RS2_ce_flush:	
	flush	%o1+%o2
	subcc	%g5,TRAP_TAKEN,%g0
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
!$EV error(0,expr(@VA(.MAIN.RS2_ce_jmpl),16,16),1,IRF, x,x,x, CE,017,x, x,x,x) 
	EXPECT_ERR_ASI(IRF_CE_BIT_17, IRF_CE_W0_O2)
RS2_ce_jmpl:    
	jmpl	%o1+%o2,%o3
	nop
	nop
	ta	T_BAD_TRAP
jmpl_target:	
	subcc	%g5,TRAP_TAKEN,%g0
	tne	T_BAD_TRAP   

	!*********
	! LDX, LDD
	setx	reg_data,%l0,%o1
	add	%g0,0x10,%l0
	nop
	nop
	nop
	nop
!$EV error(0,expr(@VA(.MAIN.RS2_ce_ldx),16,16),1,IRF, x,x,x, CE,018,x, x,x,x) 
	EXPECT_ERR_ASI(IRF_CE_BIT_18, IRF_CE_W0_L0)
RS2_ce_ldx:    
	ldx	[%o1+%l0],%o2
	cmp	%o2,%l3
	tne	T_BAD_TRAP
	subcc	%g5,TRAP_TAKEN,%g0
	tne	T_BAD_TRAP   
    
!$EV error(0,expr(@VA(.MAIN.RS2_ce_ldd),16,16),1,IRF, x,x,x, CE,019,x, x,x,x)
	EXPECT_ERR_ASI(IRF_CE_BIT_19, IRF_CE_W0_L0)
	add	%g0,0x38,%l0
	sub	%g0,1,%o2
	sub	%g0,1,%o3
	nop
	nop
RS2_ce_ldd:    
	ldd	[%o1+%l0],%o2
	cmp	%g0,%o2
	tne	T_BAD_TRAP
	cmp	%i1,%o3
	tne	T_BAD_TRAP    
	subcc	%g5,TRAP_TAKEN,%g0
	tne	T_BAD_TRAP   

	!****************************************
	! MOVE on register condition, rs2 is data    
	!****************************************
!$EV error(0,expr(@VA(.MAIN.RS2_ce_movrz),16,16),1,IRF, x,x,x, CE,020,x, x,x,x) 
	EXPECT_ERR_ASI(IRF_CE_BIT_20, IRF_CE_W0_L4)
RS2_ce_movrz:    
	movrz	%l1,%l4,%o2
	cmp	%o2,%l4
	tne	T_BAD_TRAP  
	subcc	%g5,TRAP_TAKEN,%g0
	tne	T_BAD_TRAP   
    
!$EV error(0,expr(@VA(.MAIN.RS2_ce_movrlez),16,16),1,IRF, x,x,x, CE,038,x, x,x,x) 
	EXPECT_ERR_ASI(IRF_CE_BIT_38, IRF_CE_W0_L5)
RS2_ce_movrlez:    
	movrlez	%l2,%l5,%o2
	cmp	%o2,%l5
	tne	T_BAD_TRAP  
	subcc	%g5,TRAP_TAKEN,%g0
	tne	T_BAD_TRAP   
    
!$EV error(0,expr(@VA(.MAIN.RS2_ce_movrgez),16,16),1,IRF, x,x,x, CE,021,x, x,x,x) 
	EXPECT_ERR_ASI(IRF_CE_BIT_21, IRF_CE_W0_L2)
RS2_ce_movrgez:    
	movrgez	%l6,%l2,%o2
	cmp	%o2,%l2
	tne	T_BAD_TRAP        
	subcc	%g5,TRAP_TAKEN,%g0
	tne	T_BAD_TRAP   
    
!$EV error(0,expr(@VA(.MAIN.RS2_ce_movrlz),16,16),1,IRF, x,x,x, CE,037,x, x,x,x) 
	EXPECT_ERR_ASI(IRF_CE_BIT_37, IRF_CE_W0_L7)
RS2_ce_movrlz:    
	movrlz	%l2,%l7,%o2
	cmp	%o2,%l7
	tne	T_BAD_TRAP
	subcc	%g5,TRAP_TAKEN,%g0
	tne	T_BAD_TRAP   

!$EV error(0,expr(@VA(.MAIN.RS2_ce_movrnz),16,16),1,IRF, x,x,x, CE,022,x, x,x,x) 
	EXPECT_ERR_ASI(IRF_CE_BIT_22, IRF_CE_W0_L3)
RS2_ce_movrnz:    
	movrnz	%l2,%l3,%o2
	cmp	%o2,%l3
	tne	T_BAD_TRAP  
	subcc	%g5,TRAP_TAKEN,%g0
	tne	T_BAD_TRAP   
    
!$EV error(0,expr(@VA(.MAIN.RS2_ce_movrgz),16,16),1,IRF, x,x,x, CE,036,x, x,x,x) 
	EXPECT_ERR_ASI(IRF_CE_BIT_36, IRF_CE_W0_L5)
RS2_ce_movrgz:    
	movrgz	%l4,%l5,%o2
	cmp	%o2,%l5
	tne	T_BAD_TRAP
	subcc	%g5,TRAP_TAKEN,%g0
	tne	T_BAD_TRAP

	!****************************************
	! MOVE on condition code, rs2 is data    
	!****************************************
!$EV error(0,expr(@VA(.MAIN.RS2_ce_mova),16,16),1,IRF, x,x,x, CE,023,x, x,x,x) 
	EXPECT_ERR_ASI(IRF_CE_BIT_23, IRF_CE_W0_L4)
    	wr	%g0,%g0,%ccr    
RS2_ce_mova:    
	mova	%icc,%l4,%o2
	cmp	%o2,%l4
	tne	T_BAD_TRAP  
	subcc	%g5,TRAP_TAKEN,%g0
	tne	T_BAD_TRAP   

!$EV error(0,expr(@VA(.MAIN.RS2_ce_movne),16,16),1,IRF, x,x,x, CE,024,x, x,x,x) 
	EXPECT_ERR_ASI(IRF_CE_BIT_24, IRF_CE_W0_L5)
    	wr	%g0,0xf0,%ccr    
RS2_ce_movne:    
	movne	%icc,%l5,%o2
	cmp	%o2,%l5
	tne	T_BAD_TRAP  
	subcc	%g5,TRAP_TAKEN,%g0
	tne	T_BAD_TRAP   

!$EV error(0,expr(@VA(.MAIN.RS2_ce_movz),16,16),1,IRF, x,x,x, CE,025,x, x,x,x) 
	EXPECT_ERR_ASI(IRF_CE_BIT_25, IRF_CE_W0_L6)
    	wr	%g0,0x40,%ccr    
RS2_ce_movz:    
	movz	%xcc,%l6,%o2
	cmp	%o2,%l6
	tne	T_BAD_TRAP  
	subcc	%g5,TRAP_TAKEN,%g0
	tne	T_BAD_TRAP 

	!***********************
	! mov using %fccn 
	!***********************
	setx	fsr_data,%l0,%i0
    	ldx	[%i0],%fsr    

!$EV error(0,expr(@VA(.MAIN.RS2_ce_move),16,16),1,IRF, x,x,x, CE,026,x, x,x,x) 
	EXPECT_ERR_ASI(IRF_CE_BIT_26, IRF_CE_W0_L7)
RS2_ce_move:    
	move	%fcc0,%l7,%o2
	cmp	%o2,%l7
	tne	T_BAD_TRAP  
	subcc	%g5,TRAP_TAKEN,%g0
	tne	T_BAD_TRAP   

!$EV error(0,expr(@VA(.MAIN.RS2_ce_movl),16,16),1,IRF, x,x,x, CE,027,x, x,x,x) 
	EXPECT_ERR_ASI(IRF_CE_BIT_27, IRF_CE_W0_L1)
RS2_ce_movl:    
	movl	%fcc1,%l1,%o2
	cmp	%o2,%l1
	tne	T_BAD_TRAP  
	subcc	%g5,TRAP_TAKEN,%g0
	tne	T_BAD_TRAP   
    
!$EV error(0,expr(@VA(.MAIN.RS2_ce_movg),16,16),1,IRF, x,x,x, CE,028,x, x,x,x) 
	EXPECT_ERR_ASI(IRF_CE_BIT_28, IRF_CE_W0_L2)
RS2_ce_movg:    
	movg	%fcc2,%l2,%o2
	cmp	%o2,%l2
	tne	T_BAD_TRAP  
	subcc	%g5,TRAP_TAKEN,%g0
	tne	T_BAD_TRAP   
    
!$EV error(0,expr(@VA(.MAIN.RS2_ce_movu),16,16),1,IRF, x,x,x, CE,029,x, x,x,x) 
	EXPECT_ERR_ASI(IRF_CE_BIT_29, IRF_CE_W0_L3)
RS2_ce_movu:    
	movu	%fcc3,%l3,%o2
	cmp	%o2,%l3
	tne	T_BAD_TRAP  
	subcc	%g5,TRAP_TAKEN,%g0
	tne	T_BAD_TRAP   


	!********************************
	! VIS ops, alignaddr, alignaddrl
	!********************************
	alignaddr %l6,%l3,%i0
!$EV error(0,expr(@VA(.MAIN.RS2_ce_align),16,16),1,IRF, x,x,x, CE,035,x, x,x,x) 
	EXPECT_ERR_ASI(IRF_CE_BIT_35, IRF_CE_W0_L3)
RS2_ce_align:    
	alignaddr %l6,%l3,%l0
	cmp	%l0,%i0
	tne	T_BAD_TRAP
	subcc	%g5,TRAP_TAKEN,%g0
	tne	T_BAD_TRAP   

	alignaddrl %l6,%l3,%i0
!$EV error(0,expr(@VA(.MAIN.RS2_ce_alignl),16,16),1,IRF, x,x,x, CE,02,x, x,x,x) 
	EXPECT_ERR_ASI(IRF_CE_BIT_2, IRF_CE_W0_L3)
RS2_ce_alignl:    
	alignaddrl %l6,%l3,%l0
	cmp	%l0,%i0
	tne	T_BAD_TRAP        	            
	subcc	%g5,TRAP_TAKEN,%g0
	tne	T_BAD_TRAP   
    
	!********************************************
	! Trap instructions use rs1+rs2 for trap vector
	!********************************************
	add	%g0,DUMMY_TRAP,%l0
	nop
	nop
	nop
	nop
	add	%g0,TRAP_NOT_TAKEN,%g6
!$EV error(0,expr(@VA(.MAIN.RS2_ce_ta),16,16),1,IRF, x,x,x, CE,0,x, x,x,x)
	EXPECT_ERR_ASI(IRF_CE_BIT_0, IRF_CE_W0_L0)
RS2_ce_ta:
	ta	%icc,%g0+%l0
	subcc	%g6,TRAP_TAKEN,%g0
	tne	T_BAD_TRAP 
	subcc	%g5,TRAP_TAKEN,%g0
	tne	T_BAD_TRAP   

	wr	%g0,0x0,%ccr
	add	%g0,TRAP_NOT_TAKEN,%g6
!$EV error(0,expr(@VA(.MAIN.RS2_ce_tne),16,16),1,IRF, x,x,x, CE,1,x, x,x,x)
	EXPECT_ERR_ASI(IRF_CE_BIT_1, IRF_CE_W0_L0)
RS2_ce_tne:
	tne	%icc,%g0+%l0
	subcc	%g6,TRAP_TAKEN,%g0
	tne	T_BAD_TRAP 
	subcc	%g5,TRAP_TAKEN,%g0
	tne	T_BAD_TRAP   

	wr	%g0,0x04,%ccr
	add	%g0,TRAP_NOT_TAKEN,%g6
!$EV error(0,expr(@VA(.MAIN.RS2_ce_te),16,16),1,IRF, x,x,x, CE,5,x, x,x,x)
	EXPECT_ERR_ASI(IRF_CE_BIT_5, IRF_CE_W0_L0)
RS2_ce_te:
	te	%icc,%g0+%l0
	subcc	%g6,TRAP_TAKEN,%g0
	tne	T_BAD_TRAP
	subcc	%g5,TRAP_TAKEN,%g0
	tne	T_BAD_TRAP   

	wr	%g0,0x0,%ccr
	add	%g0,TRAP_NOT_TAKEN,%g6
!$EV error(0,expr(@VA(.MAIN.RS2_ce_tg),16,16),1,IRF, x,x,x, CE,6,x, x,x,x)
	EXPECT_ERR_ASI(IRF_CE_BIT_6, IRF_CE_W0_L0)
RS2_ce_tg:
	tg	%icc,%g0+%l0
	subcc	%g6,TRAP_TAKEN,%g0
	tne	T_BAD_TRAP
	subcc	%g5,TRAP_TAKEN,%g0
	tne	T_BAD_TRAP   
    
! first show trap works w/o ecc 
goodtrap_no_ecc:  
	add	%g0,TRAP_NOT_TAKEN,%g6
    	wr	%g0,0xcc,%ccr
	tle	%xcc,%l0
	subcc	%g6,TRAP_TAKEN,%g0
	tne	T_BAD_TRAP
            
	add	%g0,TRAP_NOT_TAKEN,%g6
    	wr	%g0,0xc0,%ccr
	tle	%xcc,%l0
	subcc	%g6,TRAP_TAKEN,%g0
	tne	T_BAD_TRAP

goodtrap_icc_eq_xcc:	
	add	%g0,TRAP_NOT_TAKEN,%g6
    	wr	%g0,0xcc,%ccr
	tle	%xcc,%l0
!$EV error(0,expr(@VA(.MAIN.RS2_ce_tle2),16,16),1,IRF, x,x,x, CE,4,x, x,x,x)
	EXPECT_ERR_ASI(IRF_CE_BIT_4, IRF_CE_W0_L0)
RS2_ce_tle2:
	tle	%xcc,%g0+%l0
	subcc	%g6,TRAP_TAKEN,%g0
	tne	T_BAD_TRAP
	subcc	%g5,TRAP_TAKEN,%g0
	tne	T_BAD_TRAP   

	! only first 7 bits are used, so these cases may not be that
	! interesting
badtrap_xcc_only:  
    	wr	%g0,0xc0,%ccr
	tle	%xcc,%g0+%l0
	add	%g0,TRAP_NOT_TAKEN,%g6
!$EV error(0,expr(@VA(.MAIN.RS2_ce_tle),16,16),1,IRF, x,x,x, CE,022,x, x,x,x)
	EXPECT_ERR_ASI(IRF_CE_BIT_22, IRF_CE_W0_L0)
RS2_ce_tle:
	tle	%xcc,%g0+%l0
	subcc	%g6,TRAP_TAKEN,%g0
	tne	T_BAD_TRAP
	subcc	%g5,TRAP_TAKEN,%g0
	tne	T_BAD_TRAP   
    
	wr	%g0,0x0a,%ccr
	add	%g0,TRAP_NOT_TAKEN,%g6
!$EV error(0,expr(@VA(.MAIN.RS2_ce_tge),16,16),1,IRF, x,x,x, CE,023,x, x,x,x)
	EXPECT_ERR_ASI(IRF_CE_BIT_23, IRF_CE_W0_L0)
RS2_ce_tge:
	tge	%icc,%g0+%l0
	subcc	%g6,TRAP_TAKEN,%g0
	tne	T_BAD_TRAP 
	subcc	%g5,TRAP_TAKEN,%g0
	tne	T_BAD_TRAP   

	wr	%g0,0x22,%ccr
	add	%g0,TRAP_NOT_TAKEN,%g6
!$EV error(0,expr(@VA(.MAIN.RS2_ce_tl),16,16),1,IRF, x,x,x, CE,024,x, x,x,x)
	EXPECT_ERR_ASI(IRF_CE_BIT_24, IRF_CE_W0_L0)
RS2_ce_tl:
	tl	%xcc,%g0+%l0
	subcc	%g6,TRAP_TAKEN,%g0
	tne	T_BAD_TRAP
	subcc	%g5,TRAP_TAKEN,%g0
	tne	T_BAD_TRAP   

	wr	%g0,0x00,%ccr
	add	%g0,TRAP_NOT_TAKEN,%g6
!$EV error(0,expr(@VA(.MAIN.RS2_ce_tgu),16,16),1,IRF, x,x,x, CE,025,x, x,x,x)
	EXPECT_ERR_ASI(IRF_CE_BIT_25, IRF_CE_W0_L0)
RS2_ce_tgu:
	tgu	%icc,%g0+%l0
	subcc	%g6,TRAP_TAKEN,%g0
	tne	T_BAD_TRAP
	subcc	%g5,TRAP_TAKEN,%g0
	tne	T_BAD_TRAP   

	wr	%g0,0x10,%ccr
	add	%g0,TRAP_NOT_TAKEN,%g6
!$EV error(0,expr(@VA(.MAIN.RS2_ce_tleu),16,16),1,IRF, x,x,x, CE,026,x, x,x,x)
	EXPECT_ERR_ASI(IRF_CE_BIT_26, IRF_CE_W0_L0)
RS2_ce_tleu:
	tleu	%xcc,%g0+%l0
	subcc	%g6,TRAP_TAKEN,%g0
	tne	T_BAD_TRAP
	subcc	%g5,TRAP_TAKEN,%g0
	tne	T_BAD_TRAP   

	wr	%g0,0x0e,%ccr
	add	%g0,TRAP_NOT_TAKEN,%g6
!$EV error(0,expr(@VA(.MAIN.RS2_ce_tcc),16,16),1,IRF, x,x,x, CE,027,x, x,x,x)
	EXPECT_ERR_ASI(IRF_CE_BIT_27, IRF_CE_W0_L0)
RS2_ce_tcc:
	tcc	%icc,%g0+%l0
	subcc	%g6,TRAP_TAKEN,%g0
	tne	T_BAD_TRAP
	subcc	%g5,TRAP_TAKEN,%g0
	tne	T_BAD_TRAP   

	!*************************************************
	! Misc ops 
	!*************************************************
!$EV error(0,expr(@VA(.MAIN.RS2_ce_save),16,16),1,IRF, x,x,x, CE,028,x, x,x,x) 
	EXPECT_ERR_ASI(IRF_CE_BIT_28, IRF_CE_GL0_G2)
	mova	%icc,%l5,%g1
	mova	%icc,%l2,%g2
	add	%l5,%l2,%l0
	nop
	nop
RS2_ce_save:     
	save	%g1,%g2,%g3
	restore %g0,%g0,%g0
    	cmp	%l0,%g3
	tne	T_BAD_TRAP
	subcc	%g5,TRAP_TAKEN,%g0
	tne	T_BAD_TRAP   

!$EV error(0,expr(@VA(.MAIN.RS2_ce_restore),16,16),1,IRF, x,x,x, CE,029,x, x,x,x) 
	EXPECT_ERR_ASI(IRF_CE_BIT_29, IRF_CE_GL0_G2)
	mova	%icc,%l3,%g1
	mova	%icc,%l4,%g2
	add	%l3,%l4,%l0
	save	%g0,%g0,%g0
RS2_ce_restore:     
	restore	%g1,%g2,%g3
    	cmp	%l0,%g3
	tne	T_BAD_TRAP
	subcc	%g5,TRAP_TAKEN,%g0
	tne	T_BAD_TRAP  

	ta	T_CHANGE_PRIV
!$EV error(0,expr(@VA(.MAIN.RS2_ce_wrpr),16,16),1,IRF, x,x,x, CE,030,x, x,x,x)
	EXPECT_ERR_ASI(IRF_CE_BIT_30, IRF_CE_W0_L1)
	add	%g0,5,%l0
	add	%g0,1,PRIV_TRAP_REG ! let handler know priv trap expected
	nop
	nop
	nop
	nop
RS2_ce_wrpr:
	wrpr	%l0,%l1,%cansave
	rdpr	%cansave,%i0
	cmp	%l0,%i0
	tne	T_BAD_TRAP
	subcc	%g5,TRAP_TAKEN,%g0
	tne	T_BAD_TRAP
	add	%g0,0,PRIV_TRAP_REG ! let handler know priv trap no longer expected
    	ta	T_CHANGE_NONPRIV

!$EV error(0,expr(@VA(.MAIN.RS2_ce_wr),16,16),1,IRF, x,x,x, CE,031,x, x,x,x)
	EXPECT_ERR_ASI(IRF_CE_BIT_31, IRF_CE_W0_L1)
RS2_ce_wr:     
	wr	%i1,%l1,%y
	rd	%y,%l0
	subcc	%i1,%l0,%g0
	tne	T_BAD_TRAP
	subcc	%g5,TRAP_TAKEN,%g0
	tne	T_BAD_TRAP       
   

!$EV error(0,expr(@VA(.MAIN.RS2_ce_movrz32),16,16),1,IRF, x,x,x, CE,032,x, x,x,x) 
	EXPECT_ERR_ASI(IRF_CE_BIT_32, IRF_CE_W0_L4)
RS2_ce_movrz32:    
	movrz	%l1,%l4,%o2
	cmp	%o2,%l4
	tne	T_BAD_TRAP  
	subcc	%g5,TRAP_TAKEN,%g0
	tne	T_BAD_TRAP   

!$EV error(0,expr(@VA(.MAIN.RS2_ce_sll33),16,16),1,IRF, x,x,x, CE,033,x, x,x,x)
	EXPECT_ERR_ASI(IRF_CE_BIT_33, IRF_CE_W0_L3)
	sll	%l2,%l3,%i0
RS2_ce_sll33:     
    	sll	%l2,%l3,%l0
	cmp	%l0,%i0
	tne	T_BAD_TRAP
	subcc	%g5,TRAP_TAKEN,%g0
	tne	T_BAD_TRAP   

    	setx	reg_data,%l0,%o1
	add	%g0,0x10,%o2
	nop
!$EV error(0,expr(@VA(.MAIN.RS2_ce_ldx34),16,16),1,IRF, x,x,x, CE,034,x, x,x,x) 
	EXPECT_ERR_ASI(IRF_CE_BIT_34, IRF_CE_W0_O2)
RS2_ce_ldx34:    
	ldx	[%o1+%o2],%o2
	cmp	%o2,%l3
	tne	T_BAD_TRAP
	subcc	%g5,TRAP_TAKEN,%g0
	tne	T_BAD_TRAP   

!$EV error(0,expr(@VA(.MAIN.RS2_ce_udivx_35),16,16),1,IRF, x,x,x, CE,035,x, x,x,x)
	EXPECT_ERR_ASI(IRF_CE_BIT_35, IRF_CE_W0_L1)
    	add	%g0,0,%g6
	udivx	%l6,%l1,%i0
RS2_ce_udivx_35:     
	udivx	%l6,%l1,%l0
    	subcc	%g6,2,%g0	    ! expect two traps to have happened
	tne	T_BAD_TRAP  
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

fsr_data:
	.word 0x00000039, 0x00000000	! fcc3:	unordered, fcc2 >, fcc1 <, fcc0 =

dummy_addr: 
	.word 0,0
         

/***********************************************************************/   
SECTION .CUST_HYP_TRAPS         TEXT_VA=0x13002000

attr_text {
	Name = .CUST_HYP_TRAPS,
	hypervisor
	}

.text

.global hyp_ecc_ce_trap
hyp_ecc_ce_trap:
    	ldxa	[%g0]ASI_ASYNC_FAULT_STATUS,%g7
	wrpr	%g0,0,%gl	! return to gl 0 and pick up parameters
	subcc	PRIV_TRAP_REG,1,%g0
	be	ce_priv
	wrpr	%g0,1,%gl	! regardless, return to gl 1
    
	set	IRF_ERROR_STATUS_CE,%g6
	cmp	%g7,%g6
	be	ce_trap1
	nop
	ta	T_BAD_TRAP

ce_priv:    
	set	IRF_ERROR_STATUS_CE_PRIV,%g6
	cmp	%g7,%g6
	tne	T_BAD_TRAP
ce_trap1:       
	stxa	%g7,[%g0]ASI_ASYNC_FAULT_STATUS	! status bits are write to clear
    
	wrpr	%g0,0,%gl	! return to gl 0 and pick up g5 parameters
	ldxa	[%g0]ASI_ASYNC_FAULT_ADDR,%g7
	cmp	%g5,%g7
	tne	T_BAD_TRAP
	add	%g0,TRAP_TAKEN,%g5
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
	.word	0,0,0,0
.align 1024  
    
    
.end        
