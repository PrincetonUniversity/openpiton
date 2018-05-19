// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: fpop1_reserved_dis.s
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
 * Name:   
 * Date:   
 *
 *
 *  Description:
 *  	fpop1 reserved and FP disabled -> fp disabled trap
 *
 **********************************************************************/
#define ENABLE_T0_Fp_disabled_0x20
#define H_T0_Fp_disabled_0x20 my_illegal_instruction
#include "boot.s"

.text
.global main  

	
main:
        setx initfp, %l2, %l1
        ldd [%l1], %f0

        mov %g0, %l0   ! counter
	
reserved:
! opf[8:4]=0	opf[3:0]=0   
	.word 0x81a00000

checking:       
	setx 1, %l2, %l3
        cmp %l0, %l3
        bne fail
        nop


	
pass:
	ta		T_GOOD_TRAP

fail:
	ta		T_BAD_TRAP



	
/*******************************************************
 * Data section 
 *******************************************************/
	
.data

initfp:
	.xword 0x123456789abcdef0
	.xword 0xaabbccddeeff0011


SECTION .USER_TRAP_FOR_SUP TEXT_VA=0x20008000
attr_text {
        Name = .USER_TRAP_FOR_SUP,
        RA=0x20008000,
        PA=ra2pa(0x20008000,0),
        part_0_i_ctx_zero_ps0_tsb,
        TTE_G=0, TTE_Context=0, TTE_V=1, TTE_Size=0x0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=1, TTE_CV=0, TTE_E=0, TTE_P=1, TTE_W=0
        }

.global my_illegal_instruction
my_illegal_instruction:
        inc %l0
        done
        nop
