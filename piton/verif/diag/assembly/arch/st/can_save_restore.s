// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: can_save_restore.s
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

#include "boot.s"

.text
.global main  

#define INIT_CWP \
	mov %g0, %l0		; \
	mov %g0, %l1		; \
	mov %g0, %l2		; \
	mov %g0, %l3		; \
	mov %g0, %l4		; \
	mov %g0, %l5		; \
	mov %g0, %l6		; \
	mov %g0, %l7		; \
	mov %g0, %o1		; \
	mov %g0, %o2		; \
	mov %g0, %o3		; \
	mov %g0, %o4		; \
	mov %g0, %o5		; \
	mov %g0, %o6		; \
	mov %g0, %o7		

	
main:

        ta T_CHANGE_PRIV

	
	mov 0, %o0
	
	wrpr %g0, 1, %cwp
	rdpr %cwp, %o0
	wrpr %g0, 2, %cwp
	rdpr %cwp, %o0
	wrpr %g0, 3, %cwp
	rdpr %cwp, %o0
	wrpr %g0, 4, %cwp
	rdpr %cwp, %o0
	wrpr %g0, 5, %cwp
	rdpr %cwp, %o0
	wrpr %g0, 6, %cwp
	rdpr %cwp, %o0
	wrpr %g0, 7, %cwp
	rdpr %cwp, %o0
	
	wrpr %g0, 0, %cwp ! -> cwp=0
	
		
save_2:				
	save %o0, 1, %o0 
	save %o0, 1, %i0
	restore %i0, -1, %o0  !-> 1

save_3:		
	save %o0, 1, %o0
	save %o0, 1, %o0
	save %o0, 1, %i0
	restore %i0, -1, %o0 
	restore %i0, -1, %o0 !-> 2

save_4:		
	save %o0, 1, %o0  !->3
	save %o0, 1, %o0  !->4
	save %o0, 1, %o0  !->5
	save %o0, 1, %i0  !->6
	restore %i0, -1, %o0 
	restore %i0, -1, %o0  	
	restore %i0, -1, %o0 !-> 3	

save_5:		
	save %o0, 1, %o0  !->4 (cansave=2)
	save %o0, 1, %o0  !->5 (cansave=1)
	save %o0, 1, %o0  !->6 (cansave=0)
	wrpr %g0,2,%cansave
	wrpr %g0,4,%canrestore
	save %o0, 1, %o0  !->7
	save %o0, 1, %i0  !->0
	restore %i0, -1, %o0 !->7
	restore %i0, -1, %o0  	
	restore %i0, -1, %o0 !-> 5	
	restore %i0, -1, %o0 !-> 4 (cansave=4)

save_6:		
	save %o0, 1, %o0  !->5 (cansave=3)
	save %o0, 1, %o0  !->6 (cansave=2)
	save %o0, 1, %o0  !->7 (cansave=1)
	save %o0, 1, %o0  !->0 (cansave=0)
	wrpr %g0,2,%cansave
	wrpr %g0,4,%canrestore
	save %o0, 1, %o0  !->1
	save %o0, 1, %i0  !->2
	restore %i0, -1, %o0 !->1
	restore %i0, -1, %o0 !->0 	
	restore %i0, -1, %o0 !-> 7	
	restore %i0, -1, %o0 !-> 6	
	restore %i0, -1, %o0 !-> 5 (cansave=5)

save_7:		
	save %o0, 1, %o0  !->6 (cansave=4)
	save %o0, 1, %o0  !->7 (cansave=3)
	save %o0, 1, %o0  !->0 (cansave=2)
	save %o0, 1, %o0  !->1 (cansave=1)
	save %o0, 1, %o0  !->0 (cansave=0)
	wrpr %g0,2,%cansave
	wrpr %g0,4,%canrestore
	save %o0, 1, %o0  !->1
	save %o0, 1, %i0  !->2
	restore %i0, -1, %o0 !->1
	restore %i0, -1, %o0 !->0 	
	restore %i0, -1, %o0 !-> 7	
	restore %i0, -1, %o0 !-> 6	
	restore %i0, -1, %o0 !-> 5
	restore %i0, -1, %o0 !-> 4 (cansave=6)

	rdpr %canrestore, %l0
	rdpr %cansave, %l1
	rdpr %cwp, %l2

	cmp %l0, %g0
	bne fail
	nop
	cmp %l1, 6
	bne fail
	nop
	cmp %l2, 6
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

