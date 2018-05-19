// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: tlu_asracc_trap_1.s
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

#define PCONTEXT	0x10
#define SCONTEXT	0x10

#define MAIN_PAGE_NUCLEUS_ALSO
#define MAIN_PAGE_HV_ALSO

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
	ta	T_CHANGE_HPRIV	! macro
	setx	0x8000000000000000, %g1, %r16
	wrpr	%r16, %tick
	wr	%g0, 1, %pcr
	ta	T_CHANGE_NONHPRIV	! macro
	nop
	rd	%tick, %g2
	nop
	rd	%sys_tick, %g2
	nop
	!wr	%g0, 1, %pic
	nop
	rd	%pic, %g2
	nop
	.word	0x85450000	!rd	%set_softint, %g2
	nop
	.word	0x85454000	!rd	%clear_softint, %g2
	nop
	.word	0x89800000	!wr	%g0, 4, %tick
	nop
	wr	%g0, 0, %pcr
	nop
	rd	%pcr, %g2
	nop
	wr	%g0, 1, %set_softint
	nop
	wr	%g0, 1, %clear_softint
	nop
	wr	%g0, 1, %softint
	nop
	rd	%softint, %g2
	nop
	wr	%g1, 16, %tick_cmpr
	nop
	rd	%tick_cmpr, %g2
	nop
	wr	%g0, 8, %sys_tick
	nop
	wr	%g1, 0, %sys_tick_cmpr
	nop
	rd	%sys_tick_cmpr, %g2
	nop
	nop
	ta	T_CHANGE_PRIV	! macro
	nop
	.word	0x89800000	!wr	%g0, 8, %tick
	nop
	wr	%g0, 16, %sys_tick
	nop
	.word	0x85450000	!rd	%set_softint, %g2
	nop
	.word	0x85454000	!rd	%clear_softint, %g2
	nop
	nop
	ta	T_CHANGE_HPRIV	! macro
	nop
	.word	0x85450000	!rd	%set_softint, %g2
	nop
	.word	0x85454000	!rd	%clear_softint, %g2
	nop
	rdhpr	%hpstate, %g4
	!wrhpr	%g4, 0x804, %hpstate
	nop
	.word	0x85450000	!rd	%set_softint, %g2
	nop
	.word	0x85454000	!rd	%clear_softint, %g2
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.data
data_start:

	.xword	0x0000000000000000
	.xword	0x1111111111111111
	.xword	0x2222222222222222
	.xword	0x3333333333333333
	.xword	0x4444444444444444
	.xword	0x5555555555555555
	.xword	0x6666666666666666
	.xword	0x7777777777777777
	.xword	0x7777777777777777
	.xword	0x6666666666666666
	.xword	0x5555555555555555
	.xword	0x4444444444444444
	.xword	0x3333333333333333
	.xword	0x2222222222222222
	.xword	0x1111111111111111
	.xword	0x0000000000000000
.text
 /********************************
  *      Diag PASSED !           *
  ********************************/
diag_pass:
	ta	T_GOOD_TRAP

.data
	.xword 0x1234567887654321

