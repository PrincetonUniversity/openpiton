// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: user_wrprcwp.s
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
 *  	consecutive save/restore
 *
 **********************************************************************/
#define H_T0_Privileged_opcode_0x11
#define My_T0_Privileged_opcode_0x11 done; nop

#include "boot.s"

.text
.global main  
	
main:
	mov 0, %o0
	
	wrpr %o0, 1, %cwp
	rdpr %cwp, %o0

	cmp %o0, %g0
	bne fail
	nop
	
		
pass:
	ta		T_GOOD_TRAP

fail:
	ta		T_BAD_TRAP

