// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: tlu_test_ifu_tt.s
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
/*************************************************************
 Just a Test diag for the new features
**************************************************************/


#define PCONTEXT	0x10
#define SCONTEXT	0x10

#define MAIN_PAGE_NUCLEUS_ALSO
#define MAIN_PAGE_HV_ALSO

#include "my_intr_handlers.s"
#include "my_trap_handlers.s"

#include "enable_traps.h"
#include "boot.s"

.text
.global main

main:
	th_fork(main_th)
main_th_0:
main_th_1:
main_th_2:
main_th_3:
	nop
	ta	T_CHANGE_HPRIV
	rdhpr	%hpstate, %l0
	mov	0x3e0, %g1
	ldxa	[%g1] 0x25, %l2
	add	%g1, 8, %g1
	add	%l2, 0x40, %l2
	stxa	%l2, [%g1] 0x25
	wrhpr	%l0, 4, %hpstate
	rdhpr	%hpstate, %l0
	wrhpr	%l0, %hpstate
	rdpr	%pstate, %l0
	wrpr	%l0, %pstate
	rdpr	%gl, %l0
	wrpr	%l0, %gl
	rdpr	%tl, %l0
	wrpr	%l0, %tl
	rdpr	%pil, %l0
	wrpr	%l0, %pil
	nop
	nop
	nop
	.data
data_start:
	.xword	0x0000000000000000
.text
 /********************************
  *      Diag PASSED !           *
  ********************************/
diag_pass:
	ta	T_GOOD_TRAP

.data
	.xword 0x1234567887654321

