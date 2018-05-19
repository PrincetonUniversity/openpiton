// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: tlu_multi_intl_31.s
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
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!! Diag: tlu_multi_intl_31.s
!! No. Threads: 1
!! Description: 
!!	This diag creates the tick-match event along with 
!! cpu_mondo, dev_mondo, and resum_error queue trap events 
!! in User and Supervisor privilege levels with pstate.IE=0
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

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
	mov	0x3c0, %l0
	mov	0x3d0, %l1
	mov	0x3e0, %l2
	mov	0x3c8, %l3
	mov	0x3d8, %l4
	mov	0x3e8, %l5
	mov	0x40, %l6
	th_fork(main_th)

main_th_0:
main_th_1:
main_th_2:
main_th_3:
	nop
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!! Set pstate.IE=0
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
	ta	T_CHANGE_PRIV	! macro
	nop
	rdpr	%pstate, %g8
	wrpr	%g8, 2, %pstate
	nop
	ta	T_CHANGE_NONPRIV	! macro
	nop
!!----------------
!! CPU_MONDO_QUEUE
	ta	T_CHANGE_HPRIV	! macro
	ldxa	[%l3] 0x25, %g2
	stxa	%g2, [%l0] 0x25
	wrpr	%g0, %pil
	wrpr	%g0, %tick
	wr	%g0, 220, %tick_cmpr
	stxa	%l6, [%l3] 0x25
	ta	T_CHANGE_NONHPRIV	! macro
	nop
	nop
        mov     8, %g7
wait_x11:
        cmp     %g7, %g0
        bne     %xcc, wait_x11
        dec     %g7
	nop
	nop
	ta	T_CHANGE_HPRIV	! macro
	ldxa	[%l3] 0x25, %g2
	stxa	%g2, [%l0] 0x25
	wrpr	%g0, %pil
	wrpr	%g0, %tick
	wr	%g0, 220, %tick_cmpr
	add	%l6, 0x40, %l6
	stxa	%l6, [%l3] 0x25
	rdpr	%pstate, %g8
	wrpr	%g8, 4, %pstate
	ta	T_CHANGE_NONHPRIV	! macro
	nop
	nop
        mov     8, %g7
wait_y11:
        cmp     %g7, %g0
        bne     %xcc, wait_y11
        dec     %g7
	nop
	nop
!!----------------
!! DEV_MONDO_QUEUE
	ta	T_CHANGE_HPRIV	! macro
	ldxa	[%l3] 0x25, %g2
	stxa	%g2, [%l0] 0x25
	wrpr	%g0, %pil
	wrpr	%g0, %tick
	wr	%g0, 68, %tick_cmpr
	stxa	%l6, [%l4] 0x25
	ta	T_CHANGE_NONHPRIV	! macro
	nop
	nop
        mov     8, %g7
wait_x21:
        cmp     %g7, %g0
        bne     %xcc, wait_x21
        dec     %g7
	nop
	nop
	ta	T_CHANGE_HPRIV	! macro
	ldxa	[%l4] 0x25, %g2
	stxa	%g2, [%l1] 0x25
	wrpr	%g0, %pil
	wrpr	%g0, %tick
	wr	%g0, 220, %tick_cmpr
	add	%l6, 0x40, %l6
	stxa	%l6, [%l4] 0x25
	rdpr	%pstate, %g8
	wrpr	%g8, 4, %pstate
	ta	T_CHANGE_NONHPRIV	! macro
	nop
	nop
        mov     8, %g7
wait_y21:
        cmp     %g7, %g0
        bne     %xcc, wait_y21
        dec     %g7
	nop
	nop
!!----------------
!! RESUM_ERR_QUEUE
	ta	T_CHANGE_HPRIV	! macro
	ldxa	[%l4] 0x25, %g2
	stxa	%g2, [%l1] 0x25
	wrpr	%g0, %pil
	wrpr	%g0, %tick
	wr	%g0, 200, %tick_cmpr
	stxa	%l6, [%l5] 0x25
	ta	T_CHANGE_NONHPRIV	! macro
	nop
	nop
        mov     8, %g7
wait_x31:
        cmp     %g7, %g0
        bne     %xcc, wait_x31
        dec     %g7
	nop
	nop
	ta	T_CHANGE_HPRIV	! macro
	ldxa	[%l5] 0x25, %g2
	stxa	%g2, [%l2] 0x25
	wrpr	%g0, %pil
	wrpr	%g0, %tick
	wr	%g0, 220, %tick_cmpr
	add	%l6, 0x40, %l6
	stxa	%l6, [%l5] 0x25
	rdpr	%pstate, %g8
	wrpr	%g8, 4, %pstate
	ta	T_CHANGE_NONHPRIV	! macro
	nop
	nop
        mov     8, %g7
wait_y31:
        cmp     %g7, %g0
        bne     %xcc, wait_y31
        dec     %g7
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

