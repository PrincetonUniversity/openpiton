// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: change_globals.s
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

#include "boot.s"

.text
.global main  

main:
	ta T_CHANGE_PRIV

	rdpr %pstate, %l0
	and %l0, 0x3fe, %l0
	
	wrpr %l0, %g0, %pstate  ! mg=ig=ag=0
	mov 0, %g7

	wrpr %l0, 0x001, %pstate ! ag
	mov 0x100, %g7
	wrpr %l0, 0x400, %pstate ! mg
	mov 0x200, %g7
	wrpr %l0, 0x800, %pstate ! ig
	mov 0x300, %g7
	wrpr %l0, 0x000, %pstate ! ng

	mov 50, %g6

loop:		
	inc %g7
	wrpr %l0, 0x001, %pstate ! ag
	inc %g7
	wrpr %l0, 0x400, %pstate ! mg
	inc %g7
	wrpr %l0, 0x800, %pstate ! ig
	inc %g7
	wrpr %l0, 0x000, %pstate ! ng
		
	deccc %g6
	bnz loop
	nop		
			
	
pass:
	ta		T_GOOD_TRAP

fail:
	ta		T_BAD_TRAP


/*******************************************************
 * Data section 
 *******************************************************/
	
.data

