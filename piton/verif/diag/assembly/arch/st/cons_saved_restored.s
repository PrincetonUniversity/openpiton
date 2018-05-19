// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: cons_saved_restored.s
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
 *  	consecutive saved/restored
 *
 **********************************************************************/

#define MAIN_PAGE_HV_ALSO

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
	nop

	
	wrpr %g0, 0, %cwp

	wrpr %g0,0,%otherwin
	wrpr %g0,0,%cansave
        wrpr %g0,6,%canrestore

otherwin_0:			
	/*
	 * Before we switched to nucleus context, we have to 
	 * provide the correct TTE entries in the ITLB for this page. 
	 */
	ta	T_CHANGE_HPRIV
	nop

#define TAG_ACCESS1	0x0000000020010000	
#define DATA_IN1	0x8000000120010003	
	mov	0x0,	%l0

	setx	TAG_ACCESS1,	 %l0,	%g4	
	setx	DATA_IN1, 	%l0,	%g5
	mov	0x30,	%g7
        stxa    %g4, [ %g7 ] 0x50
        stxa    %g5, [ %g0 ] 0x54

	ta	T_CHANGE_HPRIV
	nop

	wrpr %g0, 1, %tl

	wrpr %g0,5,%cansave
        wrpr %g0,1,%canrestore	
	saved
	restored	

	wrpr %g0,4,%cansave
        wrpr %g0,2,%canrestore	
	saved
	saved
	restored	
	restored

	wrpr %g0,3,%cansave
        wrpr %g0,3,%canrestore	
	saved
	saved
	saved
	restored	
	restored
	restored

	wrpr %g0,2,%cansave
        wrpr %g0,4,%canrestore	
	saved
	saved
	saved
	saved
	restored	
	restored
	restored
	restored
	
	wrpr %g0,1,%cansave
        wrpr %g0,5,%canrestore	
	saved
	saved
	saved
	saved
	saved
	restored	
	restored
	restored
	restored
	restored

	wrpr %g0,0,%cansave
        wrpr %g0,6,%canrestore	
	saved
	saved
	saved
	saved
	saved
	saved
	restored	
	restored
	restored
	restored
	restored
	restored
	
	wrpr %g0, 0, %tl

		
otherwin_1:			
	wrpr %g0, 1, %tl
	wrpr %g0, 0, %canrestore
	
	wrpr %g0,4,%cansave
        wrpr %g0,2,%otherwin	
	saved
	restored	

	wrpr %g0, 0, %canrestore
	wrpr %g0,3,%cansave
        wrpr %g0,3,%otherwin	
	saved
	saved
	restored	
	restored

	wrpr %g0, 0, %canrestore
	wrpr %g0,2,%cansave
        wrpr %g0,4,%otherwin	
	saved
	saved
	saved
	restored	
	restored
	restored

	wrpr %g0, 0, %canrestore
	wrpr %g0,1,%cansave
        wrpr %g0,5,%otherwin	
	saved
	saved
	saved
	saved
	restored	
	restored
	restored
	restored
	
	wrpr %g0, 0, %canrestore
	wrpr %g0,0,%cansave
        wrpr %g0,6,%otherwin
	saved
	saved
	saved
	saved
	saved
	restored	
	restored
	restored
	restored
	restored

	wrpr %g0, 0, %tl

	rdpr %cansave, %l0
	rdpr %otherwin, %l1
	rdpr %canrestore, %l2

	cmp %l0, 1
	bne fail
	nop
	cmp %l1, 0
	bne fail
	nop
	cmp %l2, 5
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

