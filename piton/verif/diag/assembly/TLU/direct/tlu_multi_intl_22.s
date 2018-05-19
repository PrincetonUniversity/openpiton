// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: tlu_multi_intl_22.s
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
!! Diag: tlu_multi_intl_21.s
!! No. Threads: 1
!! Description: 
!!	This diag creates the tick-match event along with 
!! cpu_mondo, dev_mondo, and resum_error queue trap events 
!! in User and Supervisor privilege levels
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
!!----------------
!! CPU_MONDO_QUEUE
	ta	T_CHANGE_HPRIV	! macro
	wrpr	%g0, %pil
	wrpr	%g0, %tick
	wr	%g0, 330, %sys_tick_cmpr
	stxa	%l6, [%l3] 0x25
	ta	T_CHANGE_NONHPRIV	! macro
	nop
	nop
        mov     8, %g7
wait_x1:
        cmp     %g7, %g0
        bne     %xcc, wait_x1
        dec     %g7
	nop
	nop
	ta	T_CHANGE_HPRIV	! macro
	wrpr	%g0, %pil
	wrpr	%g0, %tick
	wr	%g0, 220, %sys_tick_cmpr
	add	%l6, 0x40, %l6
	stxa	%l6, [%l3] 0x25
	rdpr	%pstate, %l0
	wrpr	%l0, 4, %pstate
	ta	T_CHANGE_NONHPRIV	! macro
	nop
	nop
        mov     8, %g7
wait_y1:
        cmp     %g7, %g0
        bne     %xcc, wait_y1
        dec     %g7
	nop
	nop
!!----------------
!! DEV_MONDO_QUEUE
	ta	T_CHANGE_HPRIV	! macro
	wrpr	%g0, %pil
	wrpr	%g0, %tick
	wr	%g0, 60, %sys_tick_cmpr
	stxa	%l6, [%l4] 0x25
	ta	T_CHANGE_NONHPRIV	! macro
	nop
	nop
        mov     8, %g7
wait_x2:
        cmp     %g7, %g0
        bne     %xcc, wait_x2
        dec     %g7
	nop
	nop
	ta	T_CHANGE_HPRIV	! macro
	wrpr	%g0, %pil
	wrpr	%g0, %tick
	wr	%g0, 220, %sys_tick_cmpr
	add	%l6, 0x40, %l6
	stxa	%l6, [%l4] 0x25
	rdpr	%pstate, %l0
	wrpr	%l0, 4, %pstate
	ta	T_CHANGE_NONHPRIV	! macro
	nop
	nop
        mov     8, %g7
wait_y2:
        cmp     %g7, %g0
        bne     %xcc, wait_y2
        dec     %g7
	nop
	nop
!!----------------
!! RESUM_ERR_QUEUE
	ta	T_CHANGE_HPRIV	! macro
	wrpr	%g0, %pil
	wrpr	%g0, %tick
	wr	%g0, 64, %sys_tick_cmpr
	stxa	%l6, [%l5] 0x25
	ta	T_CHANGE_NONHPRIV	! macro
	nop
	nop
        mov     8, %g7
wait_x3:
        cmp     %g7, %g0
        bne     %xcc, wait_x3
        dec     %g7
	nop
	nop
	ta	T_CHANGE_HPRIV	! macro
	wrpr	%g0, %pil
	wrpr	%g0, %tick
	wr	%g0, 72, %sys_tick_cmpr
	add	%l6, 0x40, %l6
	stxa	%l6, [%l5] 0x25
	rdpr	%pstate, %l0
	wrpr	%l0, 4, %pstate
	ta	T_CHANGE_NONHPRIV	! macro
	nop
	nop
        mov     8, %g7
wait_y3:
        cmp     %g7, %g0
        bne     %xcc, wait_y3
        dec     %g7
	nop
	nop
	nop
	nop
        mov     128, %g7
wait_z:
        cmp     %g7, %g0
        bne     %xcc, wait_z
        dec     %g7
	nop
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!! Set pstate.IE=0
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
	rdpr	%pstate, %l0
	wrpr	%l0, 2, %pstate
!!----------------
!! CPU_MONDO_QUEUE
	ta	T_CHANGE_HPRIV	! macro
	wrpr	%g0, %pil
	wrpr	%g0, %tick
	wr	%g0, 330, %sys_tick_cmpr
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
	wrpr	%g0, %pil
	wrpr	%g0, %tick
	wr	%g0, 220, %sys_tick_cmpr
	add	%l6, 0x40, %l6
	stxa	%l6, [%l3] 0x25
	rdpr	%pstate, %l0
	wrpr	%l0, 4, %pstate
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
	wrpr	%g0, %pil
	wrpr	%g0, %tick
	wr	%g0, 60, %sys_tick_cmpr
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
	wrpr	%g0, %pil
	wrpr	%g0, %tick
	wr	%g0, 220, %sys_tick_cmpr
	add	%l6, 0x40, %l6
	stxa	%l6, [%l4] 0x25
	rdpr	%pstate, %l0
	wrpr	%l0, 4, %pstate
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
	wrpr	%g0, %pil
	wrpr	%g0, %tick
	wr	%g0, 64, %sys_tick_cmpr
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
	wrpr	%g0, %pil
	wrpr	%g0, %tick
	wr	%g0, 72, %sys_tick_cmpr
	add	%l6, 0x40, %l6
	stxa	%l6, [%l5] 0x25
	rdpr	%pstate, %l0
	wrpr	%l0, 4, %pstate
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

