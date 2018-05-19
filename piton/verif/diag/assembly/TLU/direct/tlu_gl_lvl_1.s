// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: tlu_gl_lvl_1.s
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
/********************************************************************************
STATUS: waiting for bug (3163) fix
********************************************************************************/


#define PCONTEXT	0x10
#define SCONTEXT	0x10

#define MAIN_PAGE_NUCLEUS_ALSO
#define MAIN_PAGE_HV_ALSO

#define ALL_MY_INTR_HANDLERS
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
	ta	T_CHANGE_PRIV	! macro
	rdpr	%gl, %g1
	add	%g0, 0, %g1
	wrpr	%g1, %g0, %gl
	add	%g0, 1, %g1
	wrpr	%g1, %g0, %gl
	add	%g0, 2, %g1
	wrpr	%g1, %g0, %gl
	add	%g0, 3, %g1
	wrpr	%g1, %g0, %gl
	add	%g0, 4, %g1
	wrpr	%g1, %g0, %gl
	add	%g0, 5, %g1
	wrpr	%g1, %g0, %gl
	add	%g0, 6, %g1
	wrpr	%g1, %g0, %gl
	add	%g0, 7, %g1
	wrpr	%g1, %g0, %gl
	add	%g0, 8, %g1
	wrpr	%g1, %g0, %gl
	add	%g0, 9, %g1
	wrpr	%g1, %g0, %gl
	add	%g0, 10, %g1
	wrpr	%g1, %g0, %gl
	add	%g0, 11, %g1
	wrpr	%g1, %g0, %gl
	add	%g0, 12, %g1
	wrpr	%g1, %g0, %gl
	add	%g0, 13, %g1
	wrpr	%g1, %g0, %gl
	add	%g0, 14, %g1
	wrpr	%g1, %g0, %gl
	add	%g0, 15, %g1
	wrpr	%g1, %g0, %gl
	add	%g0, 16, %g1
	wrpr	%g1, %g0, %gl
	wrpr	%g0, 0, %gl
	ta	T_CHANGE_HPRIV	! macro
	rdpr	%gl, %g1
	add	%g0, 0, %g1
	wrpr	%g1, %g0, %gl
	add	%g0, 1, %g1
	wrpr	%g1, %g0, %gl
	add	%g0, 2, %g1
	wrpr	%g1, %g0, %gl
	add	%g0, 3, %g1
	wrpr	%g1, %g0, %gl
	add	%g0, 4, %g1
	wrpr	%g1, %g0, %gl
	add	%g0, 5, %g1
	wrpr	%g1, %g0, %gl
	add	%g0, 6, %g1
	wrpr	%g1, %g0, %gl
	add	%g0, 7, %g1
	wrpr	%g1, %g0, %gl
	add	%g0, 8, %g1
	wrpr	%g1, %g0, %gl
	add	%g0, 9, %g1
	wrpr	%g1, %g0, %gl
	add	%g0, 10, %g1
	wrpr	%g1, %g0, %gl
	add	%g0, 11, %g1
	wrpr	%g1, %g0, %gl
	add	%g0, 12, %g1
	wrpr	%g1, %g0, %gl
	add	%g0, 13, %g1
	wrpr	%g1, %g0, %gl
	add	%g0, 14, %g1
	wrpr	%g1, %g0, %gl
	add	%g0, 15, %g1
	wrpr	%g1, %g0, %gl
	add	%g0, 16, %g1
	wrpr	%g1, %g0, %gl
	wrpr	%g0, 0, %gl
	rdpr	%tl, %g1
	rdpr	%tba, %l0
	wrhpr	%l0, %htba
	rdhpr	%hpstate, %g2
	wrhpr	%g2, 0x800, %hpstate
	rdpr	%gl, %g1
	add	%g0, 0, %g1
	wrpr	%g1, %g0, %gl
	add	%g0, 1, %g1
	wrpr	%g1, %g0, %gl
	add	%g0, 2, %g1
	wrpr	%g1, %g0, %gl
	add	%g0, 3, %g1
	wrpr	%g1, %g0, %gl
	add	%g0, 4, %g1
	wrpr	%g1, %g0, %gl
	add	%g0, 5, %g1
	wrpr	%g1, %g0, %gl
	add	%g0, 6, %g1
	wrpr	%g1, %g0, %gl
	add	%g0, 7, %g1
	wrpr	%g1, %g0, %gl
	add	%g0, 8, %g1
	wrpr	%g1, %g0, %gl
	add	%g0, 9, %g1
	wrpr	%g0, 0, %gl
	nop
	ta	T_GOOD_TRAP

.data
	.xword 0x1234567887654321

