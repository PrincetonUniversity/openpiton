// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: exu_ecc_rs3_ce.s
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
 * Name:    exu_ecc_rs3_ce.s
 * Date:    July 15, 2003
 *
 *  Description: Execute an assortment of instructions with correctable
 *	    errors on RS3. IRF ecc bits=71:64, data=63:0
 *	    ST*, ST*A, CASA, CASXA, SWAP, SWAPA, LDSTUB, LDSTUBA
 *
 *  Prashant's error injection is incompatible with SAS. 
 *  Must throw -sim_run_args=+asm_err_en 
 **********************************************************************/

!SIMS+ARGS: -sim_run_args=+asm_err_en -sim_run_args=+err_inj_dbg -nosas
    
#include "exu_ecc.h"
            
#define  H_HT0_Corrected_ECC_error_0x63 hyp_ecc_ce_trap

#define TRAP_TAKEN     0x7ff
#define TRAP_NOT_TAKEN 0xd0a

! setup for CE trap handler
#define EXPECT_ERR_ASI(bit,reg) \
	add	%g0,bit,%g5	; \
	sll	%g5,IRF_CE_BIT_SHIFT,%g5; \
	or	%g5,reg,%g5	; 
    

#define H_HT0_Mem_Address_Not_Aligned_0x34
#define My_HT0_Mem_Address_Not_Aligned_0x34 \
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

    	ta	T_CHANGE_HPRIV
	sub	%g0,1,%i7	! write to clear error status before starting
	stxa	%i7,[%g0]ASI_ASYNC_FAULT_STATUS
	ta	T_CHANGE_NONHPRIV
    
    	!**********************
	! Store
	!**********************
!$EV error(0,expr(@VA(.MAIN.RS3_ce_st0),16,16),1,IRF, x,x,x, x,x,x, CE,0,x)
	EXPECT_ERR_ASI(IRF_CE_BIT_0, IRF_CE_W0_L2)
RS3_ce_st0:     
    	stx	%l2,[DATAP+0x00]
	ldx	[DATAP+0x00],%l0
	cmp	%l0,%l2
	tne	T_BAD_TRAP
	subcc	%g5,TRAP_TAKEN,%g0
	tne	T_BAD_TRAP
    
!$EV error(0,expr(@VA(.MAIN.RS3_ce_st1),16,16),1,IRF, x,x,x, x,x,x, CE,1,x)
	EXPECT_ERR_ASI(IRF_CE_BIT_1, IRF_CE_W0_L2)
RS3_ce_st1:     
    	stb	%l2,[DATAP+0x8]
	ldub	[DATAP+0x8],%l0
	and	%l2,0xff,%o1
	cmp	%l0,%o1
	tne	T_BAD_TRAP
	subcc	%g5,TRAP_TAKEN,%g0
	tne	T_BAD_TRAP
    
!$EV error(0,expr(@VA(.MAIN.RS3_ce_st2),16,16),1,IRF, x,x,x, x,x,x, CE,2,x)
	EXPECT_ERR_ASI(IRF_CE_BIT_2, IRF_CE_W0_L3)
RS3_ce_st2:     
    	sth	%l3,[DATAP+0x10]
	lduh	[DATAP+0x10],%l0
	sll	%l3,16,%o1
	srl	%o1,16,%o1
	cmp	%l0,%o1
	tne	T_BAD_TRAP   
	subcc	%g5,TRAP_TAKEN,%g0
	tne	T_BAD_TRAP   
        
!$EV error(0,expr(@VA(.MAIN.RS3_ce_st3),16,16),1,IRF, x,x,x, x,x,x, CE,3,x)
	EXPECT_ERR_ASI(IRF_CE_BIT_3, IRF_CE_W0_L4)
RS3_ce_st3:     
    	stw	%l4,[DATAP+0x18]
	lduw	[DATAP+0x18],%l0
	srl	%l4,0,%o1
	cmp	%l0,%o1
	tne	T_BAD_TRAP      
	subcc	%g5,TRAP_TAKEN,%g0
	tne	T_BAD_TRAP
    
	!***********************************************************
	! STD:	try with a variety of error locations. Not sure what
	!   bits above 32 mean...
!$EV error(0,expr(@VA(.MAIN.RS3_ce_st4),16,16),1,IRF, x,x,x, x,x,x, CE,4,x)
	EXPECT_ERR_ASI(IRF_CE_BIT_4, IRF_CE_W0_L6)
RS3_ce_st4:     
    	std	%l6,[DATAP+0x18]
	ldd	[DATAP+0x18],%i0
	srl	%l6,0,%o0
	cmp	%i0,%o0
    	srl	%l7,0,%o1
	cmp	%i1,%o1
	tne	T_BAD_TRAP    
	subcc	%g5,TRAP_TAKEN,%g0
	tne	T_BAD_TRAP   
        
!$EV error(0,expr(@VA(.MAIN.RS3_ce_std15),16,16),1,IRF, x,x,x, x,x,x, CE,015,x)
	EXPECT_ERR_ASI(IRF_CE_BIT_15, IRF_CE_W0_L2)
RS3_ce_std15:     
    	std	%l2,[DATAP+0x20]
	ldd	[DATAP+0x20],%i0
	srl	%l2,0,%o0
	cmp	%i0,%o0
    	srl	%l3,0,%o1
	cmp	%i1,%o1
	tne	T_BAD_TRAP    
	subcc	%g5,TRAP_TAKEN,%g0
	tne	T_BAD_TRAP   
    
!$EV error(0,expr(@VA(.MAIN.RS3_ce_std31),16,16),1,IRF, x,x,x, x,x,x, CE,031,x)
	EXPECT_ERR_ASI(IRF_CE_BIT_31, IRF_CE_W0_L4)
RS3_ce_std31:     
    	std	%l4,[DATAP+0x28]
	ldd	[DATAP+0x28],%i0
	srl	%l4,0,%o0
	cmp	%i0,%o0
    	srl	%l5,0,%o1
	cmp	%i1,%o1
	tne	T_BAD_TRAP         
	subcc	%g5,TRAP_TAKEN,%g0
	tne	T_BAD_TRAP   
     
!$EV error(0,expr(@VA(.MAIN.RS3_ce_std32),16,16),1,IRF, x,x,x, x,x,x, CE,032,x)
	EXPECT_ERR_ASI(IRF_CE_BIT_32, IRF_CE_W0_L6)
RS3_ce_std32:  
    	std	%l6,[DATAP+0x30]
	ldd	[DATAP+0x30],%i0
	srl	%l6,0,%o0
	cmp	%i0,%o0
    	srl	%l7,0,%o1
	cmp	%i1,%o1
	tne	T_BAD_TRAP                   
	subcc	%g5,TRAP_TAKEN,%g0
	tne	T_BAD_TRAP   
 
	!************************************
	! Be complete on testing the ecc bits
	!************************************
	! Byte stores
!$EV error(0,expr(@VA(.MAIN.RS3_ce_st5),16,16),1,IRF, x,x,x, x,x,x, CE,5,x)
	EXPECT_ERR_ASI(IRF_CE_BIT_5, IRF_CE_W0_L3)
RS3_ce_st5:     
    	stb	%l3,[DATAP+0x9]
	ldub	[DATAP+0x9],%l0
	and	%l3,0xff,%o1
	cmp	%l0,%o1
	tne	T_BAD_TRAP
	subcc	%g5,TRAP_TAKEN,%g0
	tne	T_BAD_TRAP   

!$EV error(0,expr(@VA(.MAIN.RS3_ce_st6),16,16),1,IRF, x,x,x, x,x,x, CE,6,x)
	EXPECT_ERR_ASI(IRF_CE_BIT_6, IRF_CE_W0_L4)
RS3_ce_st6:     
    	stb	%l4,[DATAP+0xa]
	ldub	[DATAP+0xa],%l0
	and	%l4,0xff,%o1
	cmp	%l0,%o1
	tne	T_BAD_TRAP
	subcc	%g5,TRAP_TAKEN,%g0
	tne	T_BAD_TRAP   
    
!$EV error(0,expr(@VA(.MAIN.RS3_ce_st7),16,16),1,IRF, x,x,x, x,x,x, CE,7,x)
	EXPECT_ERR_ASI(IRF_CE_BIT_7, IRF_CE_W0_L5)
RS3_ce_st7:     
    	stba	%l5,[SDATAP]ASI_SECONDARY
	lduba	[SDATAP]ASI_SECONDARY,%l0
	and	%l5,0xff,%o1
	cmp	%l0,%o1
	tne	T_BAD_TRAP       
	subcc	%g5,TRAP_TAKEN,%g0
	tne	T_BAD_TRAP   

	!****************
	! halfword stores 
!$EV error(0,expr(@VA(.MAIN.RS3_ce_st8),16,16),1,IRF, x,x,x, x,x,x, CE,8,x)
	EXPECT_ERR_ASI(IRF_CE_BIT_8, IRF_CE_W0_L6)
RS3_ce_st8:     
    	sth	%l6,[DATAP+0x0]
	lduh	[DATAP+0x0],%l0
	sll	%l6,16,%o1
	srl	%o1,16,%o1
	cmp	%l0,%o1
	tne	T_BAD_TRAP 
	subcc	%g5,TRAP_TAKEN,%g0
	tne	T_BAD_TRAP   
    
!$EV error(0,expr(@VA(.MAIN.RS3_ce_st9),16,16),1,IRF, x,x,x, x,x,x, CE,9,x)
	EXPECT_ERR_ASI(IRF_CE_BIT_9, IRF_CE_W0_L7)
RS3_ce_st9:     
    	stha	%l7,[SDATAP]ASI_SECONDARY
	lduha	[SDATAP]ASI_SECONDARY,%l0
	sll	%l7,16,%o1
	srl	%o1,16,%o1
	cmp	%l0,%o1
	tne	T_BAD_TRAP 
	subcc	%g5,TRAP_TAKEN,%g0
	tne	T_BAD_TRAP   

!$EV error(0,expr(@VA(.MAIN.RS3_ce_st10),16,16),1,IRF, x,x,x, x,x,x, CE,010,x)
	EXPECT_ERR_ASI(IRF_CE_BIT_10, IRF_CE_W0_I1)
RS3_ce_st10:     
    	sth	%i1,[DATAP+0x4]
	lduh	[DATAP+0x4],%l0
	sll	%i1,16,%o1
	srl	%o1,16,%o1
	cmp	%l0,%o1
	tne	T_BAD_TRAP         
	subcc	%g5,TRAP_TAKEN,%g0
	tne	T_BAD_TRAP   
    
!$EV error(0,expr(@VA(.MAIN.RS3_ce_st11),16,16),1,IRF, x,x,x, x,x,x, CE,011,x)
	EXPECT_ERR_ASI(IRF_CE_BIT_11, IRF_CE_W0_I2)
RS3_ce_st11:     
    	sth	%i2,[DATAP+0xc]
	lduh	[DATAP+0xc],%l0
	sll	%i2,16,%o1
	srl	%o1,16,%o1
	cmp	%l0,%o1
	tne	T_BAD_TRAP 
	subcc	%g5,TRAP_TAKEN,%g0
	tne	T_BAD_TRAP   

!$EV error(0,expr(@VA(.MAIN.RS3_ce_st12),16,16),1,IRF, x,x,x, x,x,x, CE,012,x)
	EXPECT_ERR_ASI(IRF_CE_BIT_12, IRF_CE_W0_L1)
RS3_ce_st12:     
    	sth	%l1,[DATAP+0xe]
	lduh	[DATAP+0xe],%l0
	sll	%l1,16,%o1
	srl	%o1,16,%o1
	cmp	%l0,%o1
	tne	T_BAD_TRAP         
	subcc	%g5,TRAP_TAKEN,%g0
	tne	T_BAD_TRAP   
    
!$EV error(0,expr(@VA(.MAIN.RS3_ce_st13),16,16),1,IRF, x,x,x, x,x,x, CE,013,x)
	EXPECT_ERR_ASI(IRF_CE_BIT_13, IRF_CE_W0_L2)
RS3_ce_st13:     
    	sth	%l2,[DATAP+0x14]
	lduh	[DATAP+0x14],%l0
	sll	%l2,16,%o1
	srl	%o1,16,%o1
	cmp	%l0,%o1
	tne	T_BAD_TRAP 
	subcc	%g5,TRAP_TAKEN,%g0
	tne	T_BAD_TRAP   

!$EV error(0,expr(@VA(.MAIN.RS3_ce_st14),16,16),1,IRF, x,x,x, x,x,x, CE,014,x)
	EXPECT_ERR_ASI(IRF_CE_BIT_14, IRF_CE_W0_L3)
RS3_ce_st14:     
    	stha	%l3,[SDATAP]ASI_SECONDARY
	lduha	[SDATAP]ASI_SECONDARY,%l0
	sll	%l3,16,%o1
	srl	%o1,16,%o1
	cmp	%l0,%o1
	tne	T_BAD_TRAP         
	subcc	%g5,TRAP_TAKEN,%g0
	tne	T_BAD_TRAP   
    
!$EV error(0,expr(@VA(.MAIN.RS3_ce_st15),16,16),1,IRF, x,x,x, x,x,x, CE,015,x)
	EXPECT_ERR_ASI(IRF_CE_BIT_15, IRF_CE_W0_L4)
RS3_ce_st15:     
    	sth	%l4,[DATAP+0x1c]
	lduh	[DATAP+0x1c],%l0
	sll	%l4,16,%o1
	srl	%o1,16,%o1
	cmp	%l0,%o1
	tne	T_BAD_TRAP 
	subcc	%g5,TRAP_TAKEN,%g0
	tne	T_BAD_TRAP   

	! Do one test on a bit that is unused by the instruction. Should
	! get the trap anyway.
!$EV error(0,expr(@VA(.MAIN.RS3_ce_st16),16,16),1,IRF, x,x,x, x,x,x, CE,016,x)
	EXPECT_ERR_ASI(IRF_CE_BIT_16, IRF_CE_W0_L6)
RS3_ce_st16:     
    	sth	%l6,[DATAP+0x0]	    
	lduh	[DATAP+0x0],%l0
	sll	%l6,16,%o1
	srl	%o1,16,%o1
	cmp	%l0,%o1
	tne	T_BAD_TRAP   
	subcc	%g5,TRAP_TAKEN,%g0
	tne	T_BAD_TRAP   

	!***************************************
	! Continue in the upper half of the word      
!$EV error(0,expr(@VA(.MAIN.RS3_ce_st17),16,16),1,IRF, x,x,x, x,x,x, CE,017,x)
	EXPECT_ERR_ASI(IRF_CE_BIT_17, IRF_CE_W0_L4)
RS3_ce_st17:     
    	stw	%l4,[DATAP+0x0]
	lduw	[DATAP+0x0],%l0
	srl	%l4,0,%o1
	cmp	%l0,%o1
	tne	T_BAD_TRAP      
	subcc	%g5,TRAP_TAKEN,%g0
	tne	T_BAD_TRAP   

!$EV error(0,expr(@VA(.MAIN.RS3_ce_st18),16,16),1,IRF, x,x,x, x,x,x, CE,018,x)
	EXPECT_ERR_ASI(IRF_CE_BIT_18, IRF_CE_W0_L5)
RS3_ce_st18:     
    	stw	%l5,[DATAP+0x04]
	lduw	[DATAP+0x04],%l0
	srl	%l5,0,%o1
	cmp	%l0,%o1
	tne	T_BAD_TRAP      
	subcc	%g5,TRAP_TAKEN,%g0
	tne	T_BAD_TRAP   

!$EV error(0,expr(@VA(.MAIN.RS3_ce_st19),16,16),1,IRF, x,x,x, x,x,x, CE,019,x)
	EXPECT_ERR_ASI(IRF_CE_BIT_19, IRF_CE_W0_L6)
RS3_ce_st19:     
    	stwa	%l6,[SDATAP]ASI_SECONDARY
	lduwa	[SDATAP]ASI_SECONDARY,%l0
	srl	%l6,0,%o1
	cmp	%l0,%o1
	tne	T_BAD_TRAP      
	subcc	%g5,TRAP_TAKEN,%g0
	tne	T_BAD_TRAP   

!$EV error(0,expr(@VA(.MAIN.RS3_ce_st20),16,16),1,IRF, x,x,x, x,x,x, CE,020,x)
	EXPECT_ERR_ASI(IRF_CE_BIT_20, IRF_CE_W0_L7)
RS3_ce_st20:     
    	stw	%l7,[DATAP+0x0c]
	lduw	[DATAP+0x0c],%l0
	srl	%l7,0,%o1
	cmp	%l0,%o1
	tne	T_BAD_TRAP      
	subcc	%g5,TRAP_TAKEN,%g0
	tne	T_BAD_TRAP   

!$EV error(0,expr(@VA(.MAIN.RS3_ce_st21),16,16),1,IRF, x,x,x, x,x,x, CE,021,x)
	EXPECT_ERR_ASI(IRF_CE_BIT_21, IRF_CE_W0_I1)
RS3_ce_st21:     
    	stw	%i1,[DATAP+0x10]
	lduw	[DATAP+0x10],%l0
	srl	%i1,0,%o1
	cmp	%l0,%o1
	tne	T_BAD_TRAP      
	subcc	%g5,TRAP_TAKEN,%g0
	tne	T_BAD_TRAP   

!$EV error(0,expr(@VA(.MAIN.RS3_ce_st22),16,16),1,IRF, x,x,x, x,x,x, CE,022,x)
	EXPECT_ERR_ASI(IRF_CE_BIT_22, IRF_CE_W0_I2)
RS3_ce_st22:     
    	stwa	%i2,[SDATAP]ASI_SECONDARY
	lduwa	[SDATAP]ASI_SECONDARY,%l0
	srl	%i2,0,%o1
	cmp	%l0,%o1
	tne	T_BAD_TRAP      
	subcc	%g5,TRAP_TAKEN,%g0
	tne	T_BAD_TRAP   

!$EV error(0,expr(@VA(.MAIN.RS3_ce_st23),16,16),1,IRF, x,x,x, x,x,x, CE,023,x)
	EXPECT_ERR_ASI(IRF_CE_BIT_23, IRF_CE_W0_L1)
RS3_ce_st23:     
    	stw	%l1,[DATAP+0x18]
	lduw	[DATAP+0x18],%l0
	srl	%l1,0,%o1
	cmp	%l0,%o1
	tne	T_BAD_TRAP      
	subcc	%g5,TRAP_TAKEN,%g0
	tne	T_BAD_TRAP   

!$EV error(0,expr(@VA(.MAIN.RS3_ce_st24),16,16),1,IRF, x,x,x, x,x,x, CE,024,x)
	EXPECT_ERR_ASI(IRF_CE_BIT_24, IRF_CE_W0_L3)
RS3_ce_st24:     
    	stw	%l3,[DATAP+0x20]
	lduw	[DATAP+0x20],%l0
	srl	%l3,0,%o1
	cmp	%l0,%o1
	tne	T_BAD_TRAP      
	subcc	%g5,TRAP_TAKEN,%g0
	tne	T_BAD_TRAP   

!$EV error(0,expr(@VA(.MAIN.RS3_ce_st25),16,16),1,IRF, x,x,x, x,x,x, CE,025,x)
	EXPECT_ERR_ASI(IRF_CE_BIT_25, IRF_CE_W0_L4)
RS3_ce_st25:     
    	stw	%l4,[DATAP+0x24]
	lduw	[DATAP+0x24],%l0
	srl	%l4,0,%o1
	cmp	%l0,%o1
	tne	T_BAD_TRAP      
	subcc	%g5,TRAP_TAKEN,%g0
	tne	T_BAD_TRAP   

!$EV error(0,expr(@VA(.MAIN.RS3_ce_st26),16,16),1,IRF, x,x,x, x,x,x, CE,026,x)
	EXPECT_ERR_ASI(IRF_CE_BIT_26, IRF_CE_W0_L5)
RS3_ce_st26:     
    	stw	%l5,[DATAP+0x28]
	lduw	[DATAP+0x28],%l0
	srl	%l5,0,%o1
	cmp	%l0,%o1
	tne	T_BAD_TRAP      
	subcc	%g5,TRAP_TAKEN,%g0
	tne	T_BAD_TRAP   

!$EV error(0,expr(@VA(.MAIN.RS3_ce_st27),16,16),1,IRF, x,x,x, x,x,x, CE,027,x)
	EXPECT_ERR_ASI(IRF_CE_BIT_27, IRF_CE_W0_I2)
RS3_ce_st27:     
    	stwa	%i2,[SDATAP]ASI_SECONDARY
	lduwa	[SDATAP]ASI_SECONDARY,%l0
	srl	%i2,0,%o1
	cmp	%l0,%o1
	tne	T_BAD_TRAP      
	subcc	%g5,TRAP_TAKEN,%g0
	tne	T_BAD_TRAP   

!$EV error(0,expr(@VA(.MAIN.RS3_ce_st28),16,16),1,IRF, x,x,x, x,x,x, CE,028,x)
	EXPECT_ERR_ASI(IRF_CE_BIT_28, IRF_CE_W0_L1)
RS3_ce_st28:     
    	stx	%l1,[DATAP+0x30]
	ldx	[DATAP+0x30],%l0
	cmp	%l0,%l1
	tne	T_BAD_TRAP      
	subcc	%g5,TRAP_TAKEN,%g0
	tne	T_BAD_TRAP

    
	!***************************************
	! Do a few in PRIV mode, just for grins
	ta	T_CHANGE_PRIV
        add	%g0,1,PRIV_TRAP_REG ! let handler know priv trap expected     

!$EV error(0,expr(@VA(.MAIN.RS3_ce_st29),16,16),1,IRF, x,x,x, x,x,x, CE,029,x)
	EXPECT_ERR_ASI(IRF_CE_BIT_29, IRF_CE_W0_L2)
RS3_ce_st29:     
    	stw	%l2,[DATAP+0x34]
	lduw	[DATAP+0x34],%l0
	srl	%l2,0,%o1
	cmp	%l0,%o1
	tne	T_BAD_TRAP      
	subcc	%g5,TRAP_TAKEN,%g0
	tne	T_BAD_TRAP   

!$EV error(0,expr(@VA(.MAIN.RS3_ce_st30),16,16),1,IRF, x,x,x, x,x,x, CE,030,x)
	EXPECT_ERR_ASI(IRF_CE_BIT_30, IRF_CE_W0_L3)
RS3_ce_st30:     
    	stw	%l3,[DATAP+0x38]
	lduw	[DATAP+0x38],%l0
	srl	%l3,0,%o1
	cmp	%l0,%o1
	tne	T_BAD_TRAP
	subcc	%g5,TRAP_TAKEN,%g0
	tne	T_BAD_TRAP   

!$EV error(0,expr(@VA(.MAIN.RS3_ce_st31),16,16),1,IRF, x,x,x, x,x,x, CE,031,x)
	EXPECT_ERR_ASI(IRF_CE_BIT_31, IRF_CE_W0_L4)
RS3_ce_st31:     
    	stwa	%l4,[SDATAP]ASI_SECONDARY
	lduwa	[SDATAP]ASI_SECONDARY,%l0
	srl	%l4,0,%o1
	cmp	%l0,%o1
	tne	T_BAD_TRAP
	subcc	%g5,TRAP_TAKEN,%g0
	tne	T_BAD_TRAP   

    	! Do one test on a bit that is unused by the instruction. Should
	! get the trap anyway.
!$EV error(0,expr(@VA(.MAIN.RS3_ce_st32),16,16),1,IRF, x,x,x, x,x,x, CE,032,x)
	EXPECT_ERR_ASI(IRF_CE_BIT_32, IRF_CE_W0_L5)
RS3_ce_st32:     
    	stw	%l5,[DATAP+0x44]
	lduw	[DATAP+0x44],%l0
	srl	%l5,0,%o1
	cmp	%l0,%o1
	tne	T_BAD_TRAP
	subcc	%g5,TRAP_TAKEN,%g0
	tne	T_BAD_TRAP

	add	%g0,0,PRIV_TRAP_REG ! let handler know priv trap no longer expected
    	ta	T_CHANGE_NONPRIV
	

	!*************************
	! finish up with stx, stxa
	
!$EV error(0,expr(@VA(.MAIN.RS3_ce_st33),16,16),1,IRF, x,x,x, x,x,x, CE,033,x)
	EXPECT_ERR_ASI(IRF_CE_BIT_33, IRF_CE_W0_L2)
RS3_ce_st33:     
    	stx	%l2,[DATAP+0x00]
	ldx	[DATAP+0x00],%l0
	cmp	%l0,%l2
	tne	T_BAD_TRAP
	subcc	%g5,TRAP_TAKEN,%g0
	tne	T_BAD_TRAP   
	
!$EV error(0,expr(@VA(.MAIN.RS3_ce_st34),16,16),1,IRF, x,x,x, x,x,x, CE,034,x)
	EXPECT_ERR_ASI(IRF_CE_BIT_34, IRF_CE_W0_L3)
RS3_ce_st34:     
    	stx	%l3,[DATAP+0x08]
	ldx	[DATAP+0x08],%l0
	cmp	%l0,%l3
	tne	T_BAD_TRAP
	subcc	%g5,TRAP_TAKEN,%g0
	tne	T_BAD_TRAP   
	
!$EV error(0,expr(@VA(.MAIN.RS3_ce_st35),16,16),1,IRF, x,x,x, x,x,x, CE,035,x)
	EXPECT_ERR_ASI(IRF_CE_BIT_35, IRF_CE_W0_L4)
RS3_ce_st35:     
    	stx	%l4,[DATAP+0x10]
	ldx	[DATAP+0x10],%l0
	cmp	%l0,%l4
	tne	T_BAD_TRAP
	subcc	%g5,TRAP_TAKEN,%g0
	tne	T_BAD_TRAP   
	
!$EV error(0,expr(@VA(.MAIN.RS3_ce_st36),16,16),1,IRF, x,x,x, x,x,x, CE,036,x)
	EXPECT_ERR_ASI(IRF_CE_BIT_36, IRF_CE_W0_L5)
RS3_ce_st36:     
    	stx	%l5,[DATAP+0x18]
	ldx	[DATAP+0x18],%l0
	cmp	%l0,%l5
	tne	T_BAD_TRAP
	subcc	%g5,TRAP_TAKEN,%g0
	tne	T_BAD_TRAP   
	
!$EV error(0,expr(@VA(.MAIN.RS3_ce_st37),16,16),1,IRF, x,x,x, x,x,x, CE,037,x)
	EXPECT_ERR_ASI(IRF_CE_BIT_37, IRF_CE_W0_L6)
RS3_ce_st37:     
    	stx	%l6,[DATAP+0x20]
	ldx	[DATAP+0x20],%l0
	cmp	%l0,%l6
	tne	T_BAD_TRAP
	subcc	%g5,TRAP_TAKEN,%g0
	tne	T_BAD_TRAP   
	
!$EV error(0,expr(@VA(.MAIN.RS3_ce_st38),16,16),1,IRF, x,x,x, x,x,x, CE,038,x)
	EXPECT_ERR_ASI(IRF_CE_BIT_38, IRF_CE_W0_L7)
RS3_ce_st38:     
    	stx	%l7,[DATAP+0x28]
	ldx	[DATAP+0x28],%l0
	cmp	%l0,%l7
	tne	T_BAD_TRAP
	subcc	%g5,TRAP_TAKEN,%g0
	tne	T_BAD_TRAP   
	
!$EV error(0,expr(@VA(.MAIN.RS3_ce_st39),16,16),1,IRF, x,x,x, x,x,x, CE,039,x)
	EXPECT_ERR_ASI(IRF_CE_BIT_39, IRF_CE_W0_L2)
RS3_ce_st39:     
    	stx	%l2,[DATAP+0x30]
	ldx	[DATAP+0x30],%l0
	cmp	%l0,%l2
	tne	T_BAD_TRAP
	subcc	%g5,TRAP_TAKEN,%g0
	tne	T_BAD_TRAP   
	
!$EV error(0,expr(@VA(.MAIN.RS3_ce_st40),16,16),1,IRF, x,x,x, x,x,x, CE,040,x)
	EXPECT_ERR_ASI(IRF_CE_BIT_40, IRF_CE_W0_L3)
RS3_ce_st40:     
    	stx	%l3,[DATAP+0x38]
	ldx	[DATAP+0x38],%l0
	cmp	%l0,%l3
	tne	T_BAD_TRAP
	subcc	%g5,TRAP_TAKEN,%g0
	tne	T_BAD_TRAP   
	
!$EV error(0,expr(@VA(.MAIN.RS3_ce_st41),16,16),1,IRF, x,x,x, x,x,x, CE,041,x)
	EXPECT_ERR_ASI(IRF_CE_BIT_41, IRF_CE_W0_L4)
RS3_ce_st41:     
    	stx	%l4,[DATAP+0x40]
	ldx	[DATAP+0x40],%l0
	cmp	%l0,%l4
	tne	T_BAD_TRAP
	subcc	%g5,TRAP_TAKEN,%g0
	tne	T_BAD_TRAP   
	
!$EV error(0,expr(@VA(.MAIN.RS3_ce_st42),16,16),1,IRF, x,x,x, x,x,x, CE,042,x)
	EXPECT_ERR_ASI(IRF_CE_BIT_42, IRF_CE_W0_L5)
RS3_ce_st42:     
    	stx	%l5,[DATAP+0x48]
	ldx	[DATAP+0x48],%l0
	cmp	%l0,%l5
	tne	T_BAD_TRAP
	subcc	%g5,TRAP_TAKEN,%g0
	tne	T_BAD_TRAP   
	
!$EV error(0,expr(@VA(.MAIN.RS3_ce_st43),16,16),1,IRF, x,x,x, x,x,x, CE,043,x)
	EXPECT_ERR_ASI(IRF_CE_BIT_43, IRF_CE_W0_L6)
RS3_ce_st43:     
    	stx	%l6,[DATAP+0x50]
	ldx	[DATAP+0x50],%l0
	cmp	%l0,%l6
	tne	T_BAD_TRAP
	
!$EV error(0,expr(@VA(.MAIN.RS3_ce_st44),16,16),1,IRF, x,x,x, x,x,x, CE,044,x)
	EXPECT_ERR_ASI(IRF_CE_BIT_44, IRF_CE_W0_L7)
RS3_ce_st44:     
    	stxa	%l7,[SDATAP]ASI_SECONDARY
	ldxa	[SDATAP]ASI_SECONDARY,%l0
	cmp	%l0,%l7
	tne	T_BAD_TRAP
	subcc	%g5,TRAP_TAKEN,%g0
	tne	T_BAD_TRAP   
	
!$EV error(0,expr(@VA(.MAIN.RS3_ce_st45),16,16),1,IRF, x,x,x, x,x,x, CE,045,x)
	EXPECT_ERR_ASI(IRF_CE_BIT_45, IRF_CE_W0_L2)
RS3_ce_st45:     
    	stx	%l2,[DATAP+0x08]
	ldx	[DATAP+0x08],%l0
	cmp	%l0,%l2
	tne	T_BAD_TRAP
	subcc	%g5,TRAP_TAKEN,%g0
	tne	T_BAD_TRAP   
	
!$EV error(0,expr(@VA(.MAIN.RS3_ce_st46),16,16),1,IRF, x,x,x, x,x,x, CE,046,x)
	EXPECT_ERR_ASI(IRF_CE_BIT_46, IRF_CE_W0_L3)
RS3_ce_st46:     
    	stx	%l3,[DATAP+0x10]
	ldx	[DATAP+0x10],%l0
	cmp	%l0,%l3
	tne	T_BAD_TRAP
	subcc	%g5,TRAP_TAKEN,%g0
	tne	T_BAD_TRAP   
	
!$EV error(0,expr(@VA(.MAIN.RS3_ce_st47),16,16),1,IRF, x,x,x, x,x,x, CE,047,x)
	EXPECT_ERR_ASI(IRF_CE_BIT_47, IRF_CE_W0_L4)
RS3_ce_st47:     
    	stxa	%l4,[SDATAP]ASI_SECONDARY
	ldxa	[SDATAP]ASI_SECONDARY,%l0
	cmp	%l0,%l4
	tne	T_BAD_TRAP
	subcc	%g5,TRAP_TAKEN,%g0
	tne	T_BAD_TRAP   
	
!$EV error(0,expr(@VA(.MAIN.RS3_ce_st48),16,16),1,IRF, x,x,x, x,x,x, CE,048,x)
	EXPECT_ERR_ASI(IRF_CE_BIT_48, IRF_CE_W0_L5)
RS3_ce_st48:     
    	stx	%l5,[DATAP+0x18]
	ldx	[DATAP+0x18],%l0
	cmp	%l0,%l5
	tne	T_BAD_TRAP
	subcc	%g5,TRAP_TAKEN,%g0
	tne	T_BAD_TRAP   
	
!$EV error(0,expr(@VA(.MAIN.RS3_ce_st49),16,16),1,IRF, x,x,x, x,x,x, CE,049,x)
	EXPECT_ERR_ASI(IRF_CE_BIT_49, IRF_CE_W0_L6)
RS3_ce_st49:     
    	stx	%l6,[DATAP+0x20]
	ldx	[DATAP+0x20],%l0
	cmp	%l0,%l6
	tne	T_BAD_TRAP
	subcc	%g5,TRAP_TAKEN,%g0
	tne	T_BAD_TRAP

!$EV error(0,expr(@VA(.MAIN.RS3_ce_st50),16,16),1,IRF, x,x,x, x,x,x, CE,050,x)
	EXPECT_ERR_ASI(IRF_CE_BIT_50, IRF_CE_W0_L5)
RS3_ce_st50:     
    	stxa	%l5,[SDATAP]ASI_SECONDARY
	ldxa	[SDATAP]ASI_SECONDARY,%l0
	cmp	%l0,%l5
	tne	T_BAD_TRAP
	subcc	%g5,TRAP_TAKEN,%g0
	tne	T_BAD_TRAP   
	
!$EV error(0,expr(@VA(.MAIN.RS3_ce_st51),16,16),1,IRF, x,x,x, x,x,x, CE,051,x)
	EXPECT_ERR_ASI(IRF_CE_BIT_51, IRF_CE_W0_L7)
RS3_ce_st51:     
    	stx	%l7,[DATAP+0x28]
	ldx	[DATAP+0x28],%l0
	cmp	%l0,%l7
	tne	T_BAD_TRAP
	subcc	%g5,TRAP_TAKEN,%g0
	tne	T_BAD_TRAP   
	
!$EV error(0,expr(@VA(.MAIN.RS3_ce_st52),16,16),1,IRF, x,x,x, x,x,x, CE,052,x)
	EXPECT_ERR_ASI(IRF_CE_BIT_52, IRF_CE_W0_L6)
RS3_ce_st52:     
    	stx	%l6,[DATAP+0x30]
	ldx	[DATAP+0x30],%l0
	cmp	%l0,%l6
	tne	T_BAD_TRAP
	subcc	%g5,TRAP_TAKEN,%g0
	tne	T_BAD_TRAP   

!$EV error(0,expr(@VA(.MAIN.RS3_ce_st53),16,16),1,IRF, x,x,x, x,x,x, CE,053,x)
	EXPECT_ERR_ASI(IRF_CE_BIT_53, IRF_CE_W0_L3)
RS3_ce_st53:     
    	stxa	%l3,[SDATAP]ASI_SECONDARY
	ldxa	[SDATAP]ASI_SECONDARY,%l0
	cmp	%l0,%l3
	tne	T_BAD_TRAP
	subcc	%g5,TRAP_TAKEN,%g0
	tne	T_BAD_TRAP   
	
!$EV error(0,expr(@VA(.MAIN.RS3_ce_st54),16,16),1,IRF, x,x,x, x,x,x, CE,054,x)
	EXPECT_ERR_ASI(IRF_CE_BIT_54, IRF_CE_W0_L1)
RS3_ce_st54:     
    	stx	%l1,[DATAP+0x38]
	ldx	[DATAP+0x38],%l0
	cmp	%l0,%l1
	tne	T_BAD_TRAP
	subcc	%g5,TRAP_TAKEN,%g0
	tne	T_BAD_TRAP   
	
!$EV error(0,expr(@VA(.MAIN.RS3_ce_st55),16,16),1,IRF, x,x,x, x,x,x, CE,055,x)
	EXPECT_ERR_ASI(IRF_CE_BIT_55, IRF_CE_W0_L2)
RS3_ce_st55:     
    	stx	%l2,[DATAP+0x40]
	ldx	[DATAP+0x40],%l0
	cmp	%l0,%l2
	tne	T_BAD_TRAP
	subcc	%g5,TRAP_TAKEN,%g0
	tne	T_BAD_TRAP   
    
	!****************************
	! Store with other exceptions
	!****************************

    	! mem_address_not_aligned
!$EV error(0,expr(@VA(.MAIN.RS3_ce_st56),16,16),1,IRF, x,x,x, x,x,x, CE,056,x)
	EXPECT_ERR_ASI(IRF_CE_BIT_56, IRF_CE_W0_L6)
	add	%g0,TRAP_NOT_TAKEN,%g6
RS3_ce_st56:     
    	stx	%l6,[DATAP+0x31]
	subcc	%g5,TRAP_TAKEN,%g0	! ce trap taken
	tne	T_BAD_TRAP
    	subcc	%g6,TRAP_TAKEN,%g0	! not_aligned trap taken
	tne	T_BAD_TRAP

!$EV error(0,expr(@VA(.MAIN.RS3_ce_st57),16,16),1,IRF, x,x,x, x,x,x, CE,057,x)
	EXPECT_ERR_ASI(IRF_CE_BIT_57, IRF_CE_W0_L6)
	add	%g0,TRAP_NOT_TAKEN,%g6
RS3_ce_st57:     
    	stw	%l6,[DATAP+0x31]
	subcc	%g5,TRAP_TAKEN,%g0
	tne	T_BAD_TRAP
    	subcc	%g6,TRAP_TAKEN,%g0
	tne	T_BAD_TRAP
    
!$EV error(0,expr(@VA(.MAIN.RS3_ce_st58),16,16),1,IRF, x,x,x, x,x,x, CE,058,x)
	EXPECT_ERR_ASI(IRF_CE_BIT_58, IRF_CE_W0_L6)
	add	%g0,TRAP_NOT_TAKEN,%g6
RS3_ce_st58:     
    	sth	%l6,[DATAP+0x31]
	subcc	%g5,TRAP_TAKEN,%g0
	tne	T_BAD_TRAP
    	subcc	%g6,TRAP_TAKEN,%g0
	tne	T_BAD_TRAP        

	!********************
	add	SDATAP,1,%i0		! unaligned pointer for alternate space

!$EV error(0,expr(@VA(.MAIN.RS3_ce_st59),16,16),1,IRF, x,x,x, x,x,x, CE,059,x)
	EXPECT_ERR_ASI(IRF_CE_BIT_59, IRF_CE_W0_L3)
	add	%g0,TRAP_NOT_TAKEN,%g6
RS3_ce_st59:     
    	stxa	%l3,[%i0]ASI_SECONDARY
	subcc	%g5,TRAP_TAKEN,%g0
	tne	T_BAD_TRAP      
    	subcc	%g6,TRAP_TAKEN,%g0
	tne	T_BAD_TRAP

!$EV error(0,expr(@VA(.MAIN.RS3_ce_st60),16,16),1,IRF, x,x,x, x,x,x, CE,060,x)
	EXPECT_ERR_ASI(IRF_CE_BIT_60, IRF_CE_W0_L3)
	add	%g0,TRAP_NOT_TAKEN,%g6
RS3_ce_st60:     
    	stwa	%l3,[%i0]ASI_SECONDARY
	subcc	%g5,TRAP_TAKEN,%g0
	tne	T_BAD_TRAP      
    	subcc	%g6,TRAP_TAKEN,%g0
	tne	T_BAD_TRAP

!$EV error(0,expr(@VA(.MAIN.RS3_ce_st61),16,16),1,IRF, x,x,x, x,x,x, CE,061,x)
	EXPECT_ERR_ASI(IRF_CE_BIT_61, IRF_CE_W0_L3)
	add	%g0,TRAP_NOT_TAKEN,%g6
RS3_ce_st61:     
    	stha	%l3,[%i0]ASI_SECONDARY
	subcc	%g5,TRAP_TAKEN,%g0
	tne	T_BAD_TRAP      
    	subcc	%g6,TRAP_TAKEN,%g0
	tne	T_BAD_TRAP

	!************************************************************
	! Other instructions which use rd as a source
	!************************************************************
	! CASA, CASXA
	add	%l2,%g0,%o2
	ldxa	[SDATAP]ASI_SECONDARY,%o3
	add	%o3,0,%o4
	casxa	[SDATAP]ASI_SECONDARY,%o3,%o2
	nop	! prevent operand bypass from ruining the test case
	nop
	ldxa	[SDATAP]ASI_SECONDARY,%o5
!$EV error(0,expr(@VA(.MAIN.RS3_ce_casxa),16,16),1,IRF, x,x,x, x,x,x, CE,062,x) 
	EXPECT_ERR_ASI(IRF_CE_BIT_62, IRF_CE_W0_O3)
RS3_ce_casxa: 
	casxa	[SDATAP]ASI_SECONDARY,%o5,%o3
	cmp	%o5,%o3
	tne	T_BAD_TRAP
	ldxa	[SDATAP]ASI_SECONDARY,%o6
	cmp	%o6,%o4
	tne	T_BAD_TRAP
	subcc	%g5,TRAP_TAKEN,%g0
	tne	T_BAD_TRAP   

	add	%i2,%g0,%o2
	lda	[SDATAP]ASI_SECONDARY,%o3
	add	%o3,0,%o4
	casa	[SDATAP]ASI_SECONDARY,%o3,%o2
	nop	! prevent operand bypass from ruining the test case
	nop
	lda	[SDATAP]ASI_SECONDARY,%o5
!$EV error(0,expr(@VA(.MAIN.RS3_ce_casa),16,16),1,IRF, x,x,x, x,x,x, CE,063,x) 
	EXPECT_ERR_ASI(IRF_CE_BIT_63, IRF_CE_W0_O3)
RS3_ce_casa: 
	casa	[SDATAP]ASI_SECONDARY,%o5,%o3
	cmp	%o5,%o3
	tne	T_BAD_TRAP
	lda	[SDATAP]ASI_SECONDARY,%o6
	cmp	%o6,%o4
	tne	T_BAD_TRAP
	subcc	%g5,TRAP_TAKEN,%g0
	tne	T_BAD_TRAP   

    	! SWAP
	add	%i2,%g0,%o2
	stw	%i1,[DATAP]
!$EV error(0,expr(@VA(.MAIN.RS3_ce_swap1),16,16),1,IRF, x,x,x, x,x,x, CE,023,x) 
	EXPECT_ERR_ASI(IRF_CE_BIT_23, IRF_CE_W0_O2)
RS3_ce_swap1: 
	swap	[DATAP],%o2
	cmp	%o2,%i1
	tne	T_BAD_TRAP
	lduw	[DATAP],%o3
	cmp	%o3,%i2
	tne	T_BAD_TRAP
	subcc	%g5,TRAP_TAKEN,%g0
	tne	T_BAD_TRAP

	add	%i2,%g0,%o2
	stw	%i1,[DATAP]
	nop	! prevent operand bypass from ruining the test case
	nop
!$EV error(0,expr(@VA(.MAIN.RS3_ce_swap2),16,16),1,IRF, x,x,x, x,x,x, CE,063,x) 
	EXPECT_ERR_ASI(IRF_CE_BIT_63, IRF_CE_W0_O2)
RS3_ce_swap2: 
	swap	[DATAP],%o2
	cmp	%o2,%i1
	tne	T_BAD_TRAP
	lduw	[DATAP],%o3
	cmp	%o3,%i2
	tne	T_BAD_TRAP
	subcc	%g5,TRAP_TAKEN,%g0
	tne	T_BAD_TRAP         

    	! SWAPA
	add	%i2,%g0,%o2
	stwa	%i1,[SDATAP]ASI_SECONDARY
	nop	! prevent operand bypass from ruining the test case
	nop
!$EV error(0,expr(@VA(.MAIN.RS3_ce_swapa),16,16),1,IRF, x,x,x, x,x,x, CE,064,x) 
	EXPECT_ERR_ASI(IRF_CE_BIT_64, IRF_CE_W0_O2)
RS3_ce_swapa: 
	swapa	[SDATAP]ASI_SECONDARY,%o2
	cmp	%o2,%i1
	tne	T_BAD_TRAP
	lduwa	[SDATAP]ASI_SECONDARY,%o3
	cmp	%o3,%i2
	tne	T_BAD_TRAP
	subcc	%g5,TRAP_TAKEN,%g0
	tne	T_BAD_TRAP       

	!LDSTUB
!$EV error(0,expr(@VA(.MAIN.RS3_ce_ldstub),16,16),1,IRF, x,x,x, x,x,x, CE,065,x)
	EXPECT_ERR_ASI(IRF_CE_BIT_65, IRF_CE_W0_L0)
    	stb	%l3,[DATAP+0x8]
	nop	! prevent operand bypass from ruining the test case
	nop
RS3_ce_ldstub:     
    	ldstub	[DATAP+0x8],%l0
	ldub	[DATAP+0x8],%i0
	and	%l3,0xff,%o1
	cmp	%l0,%o1
	tne	T_BAD_TRAP
	subcc	%i0,0xff,%g0	    ! memory byte set to xFF
	tne	T_BAD_TRAP
	subcc	%g5,TRAP_TAKEN,%g0
	tne	T_BAD_TRAP

	!LDSTUBA
!$EV error(0,expr(@VA(.MAIN.RS3_ce_ldstuba),16,16),1,IRF, x,x,x, x,x,x, CE,066,x)
	EXPECT_ERR_ASI(IRF_CE_BIT_66, IRF_CE_W0_L0)
    	stba	%l4,[SDATAP]ASI_SECONDARY
	nop	! prevent operand bypass from ruining the test case
	nop
RS3_ce_ldstuba:     
    	ldstuba	[SDATAP]ASI_SECONDARY,%l0
	lduba	[SDATAP]ASI_SECONDARY,%o0
	and	%l4,0xff,%o1
	cmp	%l0,%o1
	tne	T_BAD_TRAP
	subcc	%o0,0xff,%g0	    ! memory byte set to xFF
	tne	T_BAD_TRAP
	subcc	%g5,TRAP_TAKEN,%g0
	tne	T_BAD_TRAP
    
	!*************************************
	! Finish off the bit position checking
!$EV error(0,expr(@VA(.MAIN.RS3_ce_st67),16,16),1,IRF, x,x,x, x,x,x, CE,067,x)
	EXPECT_ERR_ASI(IRF_CE_BIT_67, IRF_CE_W0_L3)
RS3_ce_st67:     
    	sth	%l3,[DATAP+0x10]
	lduh	[DATAP+0x10],%l0
	sll	%l3,16,%o1
	srl	%o1,16,%o1
	cmp	%l0,%o1
	tne	T_BAD_TRAP   
	subcc	%g5,TRAP_TAKEN,%g0
	tne	T_BAD_TRAP   
        
!$EV error(0,expr(@VA(.MAIN.RS3_ce_st68),16,16),1,IRF, x,x,x, x,x,x, CE,068,x)
	EXPECT_ERR_ASI(IRF_CE_BIT_68, IRF_CE_W0_L4)
RS3_ce_st68:     
    	stw	%l4,[DATAP+0x18]
	lduw	[DATAP+0x18],%l0
	srl	%l4,0,%o1
	cmp	%l0,%o1
	tne	T_BAD_TRAP      
	subcc	%g5,TRAP_TAKEN,%g0
	tne	T_BAD_TRAP
    
!$EV error(0,expr(@VA(.MAIN.RS3_ce_st69),16,16),1,IRF, x,x,x, x,x,x, CE,069,x)
	EXPECT_ERR_ASI(IRF_CE_BIT_69, IRF_CE_W0_L2)
RS3_ce_st69:     
    	stx	%l2,[DATAP+0x00]
	ldx	[DATAP+0x00],%l0
	cmp	%l0,%l2
	tne	T_BAD_TRAP
	subcc	%g5,TRAP_TAKEN,%g0
	tne	T_BAD_TRAP
    
!$EV error(0,expr(@VA(.MAIN.RS3_ce_st70),16,16),1,IRF, x,x,x, x,x,x, CE,070,x)
	EXPECT_ERR_ASI(IRF_CE_BIT_70, IRF_CE_W0_L2)
RS3_ce_st70:     
    	stb	%l2,[DATAP+0x8]
	ldub	[DATAP+0x8],%l0
	and	%l2,0xff,%o1
	cmp	%l0,%o1
	tne	T_BAD_TRAP
	subcc	%g5,TRAP_TAKEN,%g0
	tne	T_BAD_TRAP
    
!$EV error(0,expr(@VA(.MAIN.RS3_ce_st71),16,16),1,IRF, x,x,x, x,x,x, CE,071,x)
	EXPECT_ERR_ASI(IRF_CE_BIT_71, IRF_CE_W0_L2)
RS3_ce_st71:     
    	stb	%l2,[DATAP+0x1]
	ldub	[DATAP+0x1],%l0
	and	%l2,0xff,%o1
	cmp	%l0,%o1
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
