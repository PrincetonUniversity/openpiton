// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: wrrdcwp_loop.s
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
 *  Description: wrpr/rdpr %cwp
 *  	
 *
 **********************************************************************/

#ifdef MT_TEMPLATE
#include "mt_body.h"
#else
#include "boot.s"
.global main
#endif

.text

main:
        ta T_CHANGE_PRIV

	mov 4, %g1
loop:	
	
	
	wrpr %g0, 0, %cwp    ! -> 0
	mov 0, %i0

	
	add %i0, 1, %o0
	wrpr %o0, %g0, %cwp  ! -> 1
	add %i0, 1, %o0
	wrpr %o0, %g0, %cwp  ! -> 2
	add %i0, 1, %o0
	wrpr %o0, %g0, %cwp  ! -> 3
	add %i0, 1, %o0
	wrpr %o0, %g0, %cwp  ! -> 4
	add %i0, 1, %o0
	wrpr %o0, %g0, %cwp  ! -> 5
	add %i0, 1, %o0
	wrpr %o0, %g0, %cwp  ! -> 6
	add %i0, 1, %o0
	wrpr %o0, %g0, %cwp  ! -> 7
	
	rdpr %cwp, %o1       ! %o1[7]=7
	sub %i0, 1, %i1

	wrpr %i1, %g0, %cwp  ! -> 6
	sub %o1, 1, %i1
	wrpr %i1, %g0, %cwp  ! -> 5
	sub %o1, 1, %i1
	wrpr %i1, %g0, %cwp  ! -> 4
	sub %o1, 1, %i1
	wrpr %i1, %g0, %cwp  ! -> 3
	sub %o1, 1, %i1
	wrpr %i1, %g0, %cwp  ! -> 2
	sub %o1, 1, %i1
	wrpr %i1, %g0, %cwp  ! -> 1
	sub %o1, 1, %i1
	wrpr %i1, %g0, %cwp  ! -> 0

	rdpr %cwp, %l0
	cmp %l0, %o1
	bne fail

	wrpr %o0, %g0, %cwp  ! -> 1
	rdpr %cwp, %l0
	cmp %l0, %o1
	bne fail
	
	wrpr %o0, %g0, %cwp  ! -> 2
	rdpr %cwp, %l0
	cmp %l0, %o1
	bne fail

	wrpr %o0, %g0, %cwp  ! -> 3
	rdpr %cwp, %l0
	cmp %l0, %o1
	bne fail
	
	wrpr %o0, %g0, %cwp  ! -> 4
	rdpr %cwp, %l0
	cmp %l0, %o1
	bne fail

	wrpr %o0, %g0, %cwp  ! -> 5
	rdpr %cwp, %l0
	cmp %l0, %o1
	bne fail
	
	wrpr %o0, %g0, %cwp  ! -> 6
	rdpr %cwp, %l0
	cmp %l0, %o1
	bne fail

	wrpr %o0, %g0, %cwp  ! -> 7
	rdpr %cwp, %l0
	cmp %l0, %o1
	bne fail
	nop

	wrpr %g0, 6, %cwp
	wrpr %g0, 5, %cwp
	rdpr %cwp, %l0
	cmp %l0, 5
	bne fail
	nop
	
	wrpr %g0, 4, %cwp
	wrpr %g0, 3, %cwp
	wrpr %g0, 2, %cwp
	rdpr %cwp, %l0
	cmp %l0, 2
	bne fail
	nop	

	wrpr %g0, 1, %cwp
	wrpr %g0, 0, %cwp
	wrpr %g0, 2, %cwp
	wrpr %g0, 4, %cwp
	wrpr %g0, 3, %cwp
	wrpr %g0, 5, %cwp
	wrpr %g0, 7, %cwp
	wrpr %g0, 6, %cwp
	rdpr %cwp, %l0
	cmp %l0, 6
	bne fail
	nop	

	deccc %g1
	cmp %g1, 0
	bne loop
	nop

		
			
pass:
	ta		T_GOOD_TRAP

fail:
	ta		T_BAD_TRAP


/*******************************************************
 * Data section 
 *******************************************************/
	
.data

