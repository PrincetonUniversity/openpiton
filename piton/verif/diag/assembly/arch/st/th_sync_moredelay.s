// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: th_sync_moredelay.s
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
 *  	
 *
 **********************************************************************/

#define SYNC_THREADS
#include "boot.s"

.text
.global main  

attr_text {
        Name = .MAIN,
        VA=MAIN_BASE_TEXT_VA,
        RA=MAIN_BASE_TEXT_RA,
        tsbonly,
        part_0_i_ctx_zero_ps0_tsb,
        TTE_G=0, TTE_Context=0, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=1, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=0
        }

main:
	ta T_RD_THID
        mov %o1, %l3

        cmp %l3, 0
	bne we_sync_threads
	nop

	mov 200, %l0
delay_th0:		
	deccc %l0
	bnz delay_th0
	nop
	

we_sync_threads:
	th_sync(1,1,1000)


in_sync:	
	mov 0, %g7
	inc %g7
	inc %g7
	inc %g7
	inc %g7
	inc %g7
        cmp %g7,5
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


