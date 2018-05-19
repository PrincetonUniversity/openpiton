// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: tlu_stb2b_trap_01.s
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
!! Diag: tlu_stb2b_trap_01.s
!! No. Threads: 1
!! Description: 
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
	th_fork(main_th)

main_th_0:
main_th_1:
main_th_2:
main_th_3:
	nop
        mov     16, %g7
wait_y3:
        cmp     %g7, %g0
        bne     %xcc, wait_y3
        dec     %g7
	nop
	mov	0x3c8, %g7
	mov	0x3d8, %g2
	mov	0x3e8, %g3
	mov	0x3f8, %g4
	mov	0x20, %g5
	mov	0x28, %g6
	nop
	ta	T_CHANGE_PRIV
	nop
	setx	%hi(data_start + 1), %g1, %l0
	mov	0x7f, %l2
	add	%l2, %l2, %l2
	sth	%l2, [%l0]
	stxa	%l4, [%g7] 0x25
	nop
	setx	%hi(data_start + 1), %g1, %l0
	mov	0x7f, %l2
	add	%l2, %l2, %l2
	sth	%l2, [%l0]
	stxa	%l4, [%g2] 0x25
	nop
	setx	%hi(data_start + 1), %g1, %l0
	mov	0x7f, %l2
	add	%l2, %l2, %l2
	sth	%l2, [%l0]
	stxa	%l4, [%g3] 0x25
	nop
	setx	%hi(data_start + 1), %g1, %l0
	mov	0x7f, %l2
	add	%l2, %l2, %l2
	sth	%l2, [%l0]
	stxa	%l4, [%g4] 0x25
	nop
	setx	%hi(data_start + 1), %g1, %l0
	mov	0x7f, %l2
	add	%l2, %l2, %l2
	sth	%l2, [%l0]
	stxa	%l4, [%g5] 0x20
	nop
	setx	%hi(data_start + 1), %g1, %l0
	mov	0x7f, %l2
	add	%l2, %l2, %l2
	sth	%l2, [%l0]
	stxa	%l4, [%g6] 0x20
	nop
	nop
	nop
	nop
	ta	T_CHANGE_NONPRIV
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

