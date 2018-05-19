// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: tlu_multi_intl_15.s
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

#define ALL_MY_INTR_HANDLERS
#include "my_intr_handlers.s"
#include "my_trap_handlers.s"

#include "enable_traps.h"
#include "boot.s"

.text
.global main

main:
	mov	0x1, %r22
	th_fork(main_th)

main_th_0:
main_th_1:
main_th_2:
main_th_3:
	nop
!!-------------------------------------
!! tick/htick-match in Hypervisor
!!-------------------------------------
	ta	T_CHANGE_HPRIV	! macro
	setx	0x4000000000000000, %g1, %g1
	wrpr	%g0, %pil
	wrpr	%g1, %tick
	wr	%g1, 0x200, %tick_cmpr
	wrhpr	%g1, 0x200, %hsys_tick_cmpr
	nop
	nop
	mov	0x100, %g7
wait_1:
	cmp	%g7, %g0
	bne	%xcc, wait_1
	dec	%g7
	nop
	wr	%g0, 0, %softint
	wrhpr	%g0, 0, %hintp
!!-------------------------------------
!! tick/htick-match in Supervisor
!!-------------------------------------
	!ta	T_CHANGE_HPRIV	! macro
	setx	0x4000000000000000, %g1, %g1
	!wrpr	%g0, %pil
	wrpr	%g1, %tick
	wr	%g1, 0x200, %tick_cmpr
	wrhpr	%g1, 0x200, %hsys_tick_cmpr
	rdhpr	%hpstate, %l0
	wrhpr	%l0, 4, %hpstate
	ta	T_CHANGE_PRIV	! macro
	nop
	nop
	mov	0x100, %g7
wait_2:
	cmp	%g7, %g0
	bne	%xcc, wait_2
	dec	%g7
	nop
	nop
	wr	%g0, 0, %softint
	rdpr	%pstate, %l0
	wrpr	%l0, 4, %pstate
!!-------------------------------------
!! tick/htick-match in User
!!-------------------------------------
	ta	T_CHANGE_HPRIV	! macro
	wrhpr	%g0, 0, %hintp
	setx	0x4000000000000000, %g1, %g1
	wrpr	%g0, %pil
	wrpr	%g1, %tick
	wr	%g1, 0x200, %tick_cmpr
	wrhpr	%g1, 0x200, %hsys_tick_cmpr
	ta	T_CHANGE_NONHPRIV	! macro
	nop
	nop
	mov	0x100, %g7
wait_3:
	cmp	%g7, %g0
	bne	%xcc, wait_3
	dec	%g7
	nop
	nop
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!! Set pstate.IE=0
!!-------------------------------------
!! tick/htick-match in Hypervisor
!!-------------------------------------
	ta	T_CHANGE_HPRIV	! macro
	wr	%g0, 0, %softint
	wrhpr	%g0, 0, %hintp
	rdpr	%pstate, %l0
	wrpr	%l0, 2, %pstate
	setx	0x4000000000000000, %g1, %g1
	wrpr	%g0, %pil
	wrpr	%g1, %tick
	wr	%g1, 0x200, %tick_cmpr
	wrhpr	%g1, 0x200, %hsys_tick_cmpr
	nop
	nop
	mov	0x100, %g7
wait_4:
	cmp	%g7, %g0
	bne	%xcc, wait_4
	dec	%g7
	nop
	wr	%g0, 0, %softint
	wrhpr	%g0, 0, %hintp
!!-------------------------------------
!! tick/htick-match in Supervisor
!!-------------------------------------
	!ta	T_CHANGE_HPRIV	! macro
	setx	0x4000000000000000, %g1, %g1
	!wrpr	%g0, %pil
	wrpr	%g1, %tick
	wr	%g1, 0x200, %tick_cmpr
	wrhpr	%g1, 0x200, %hsys_tick_cmpr
	rdhpr	%hpstate, %l0
	wrhpr	%l0, 4, %hpstate
	ta	T_CHANGE_PRIV	! macro
	nop
	nop
	mov	0x100, %g7
wait_5:
	cmp	%g7, %g0
	bne	%xcc, wait_5
	dec	%g7
	nop
	nop
	wr	%g0, 0, %softint
	rdpr	%pstate, %l0
	wrpr	%l0, 4, %pstate
!!-------------------------------------
!! tick/htick-match in User
!!-------------------------------------
	ta	T_CHANGE_HPRIV	! macro
	wrhpr	%g0, 0, %hintp
	setx	0x4000000000000000, %g1, %g1
	wrpr	%g0, %pil
	wrpr	%g1, %tick
	wr	%g1, 0x200, %tick_cmpr
	wrhpr	%g1, 0x200, %hsys_tick_cmpr
	ta	T_CHANGE_NONHPRIV	! macro
	nop
	nop
	mov	0x100, %g7
wait_6:
	cmp	%g7, %g0
	bne	%xcc, wait_6
	dec	%g7
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

