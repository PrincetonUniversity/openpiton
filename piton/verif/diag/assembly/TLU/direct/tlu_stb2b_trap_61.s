// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: tlu_stb2b_trap_61.s
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
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!! Diag: tlu_stb2b_trap_60.s
!! No. Threads: 1
!! Description: 
!! This diag tests the stb2b lsu-asynchronous trap and Nuke-interrupt
!! valid at same time.
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

#define PCONTEXT	0x10
#define SCONTEXT	0x10

#define MAIN_PAGE_NUCLEUS_ALSO
#define MAIN_PAGE_HV_ALSO

#define ALL_MY_INTR_HANDLERS
#include "my_intr_handlers.s"
#include "my_trap_handlers.s"


#define H_HT0_Data_access_error_0x32
#define SUN_H_HT0_Data_access_error_0x32 \
	add     %l6, 0x32, %l6; \
	done; \
	nop; \
	nop; \
	nop; \
	nop; \
	nop; \
	nop

#define My_HT0_Interrupt_0x60 \
	ldxa	[%g0] 0x74, %g2; \
	add     %l6, 0x60, %l6; \
	nop; \
	nop; \
	nop; \
	nop; \
	retry; \
	nop


#include "enable_traps.h"
#include "boot.s"

.text
.global main

main:
	nop
	th_fork(main_th)
	nop
main_th_0:
main_th_1:
main_th_2:
main_th_3:
	mov	0, %l6
        mov     16, %g7
wait_1:
        cmp     %g7, %g0
        bne     %xcc, wait_1
        dec     %g7
	nop
	ta	T_CHANGE_HPRIV
	rdhpr	%hpstate, %l4
	setx	0x88000000, %g1, %g2
	stxa	%g2, [%g0] 0x43
	setx	%hi(data_start), %g1, %l0
	mov	0x7f, %l2
	add	%l2, %l2, %l2
	wrhpr	%l4, 4, %hpstate !ta	T_CHANGE_NONHPRIV
	nop
nukeint_1:
!$EV trig_pc_d(0,expr(@VA(.MAIN.nukeint_1), 16, 16)) -> intp(0, 0, 0)
!$EV trig_pc_d(0,expr(@VA(.HTRAPS.HT0_Interrupt_0x60) + 4, 16, 16)) -> intp(0, 2, 0);
!$EV trig_pc_d(0,expr(@VA(.HTRAPS.HT0_Interrupt_0x60) + 4, 16, 16)) -> intp(0, 3, 0);
	sth	%l2, [%l0]
	nop
	nop
	nop
	nop
	mov     0, %g1
	add     %g1, 0x32, %g1
	add     %g1, 0x60, %g1
	cmp     %l6, %g1
	be	diag_pass
	nop
	ta	T_BAD_TRAP
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

