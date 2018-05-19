// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: tlberr_dlyslt.s
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
! This diag tests the following condition:	
! 1 - when a tlberr is on the dlyslt of 
!     an unconditional branch and the delay 
!     slot is annulled and the branch target hits 

	
#define CIOP
#define THREAD_MASK 0x00000001
#define NO_TRAPCHECK
#include "boot.s"
	
.text
.global main

main:
	ba itlb_err_seg
	nop
.skip 0x1fe0
itlb_err_seg:	
	mov 0x0, %r2
	ba err_free_page
	nop
.global br_tlberr_dlyslt
br_itlberr_dlyslt:		
        ba,a end_diag
itlb_err:		
!$EV error(0,expr(@VA(.MAIN.itlb_err), 16, 16),1,ITLB_DATA,30)
	add %r0, 0x1, %r2
	nop

.global err_free_page
err_free_page:
	ba br_itlberr_dlyslt
	nop
.global end_diag
end_diag:
	cmp %r2, 0x0
	bne fail_diag
	nop
	ta T_GOOD_TRAP
fail_diag:
	ta T_BAD_TRAP

