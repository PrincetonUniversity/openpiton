// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: tlu_stb2b_trap_50.s
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
!! Diag: tlu_stb2b_trap_50.s
!! No. Threads: 1
!! Description: 
!! This diag tests the stb2b lsu-asynchronous and SW-interrupt
!! traps
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
	add	%l6, 0x32, %l6; \
	done; \
	nop; \
	nop; \
	nop; \
	nop; \
	nop; \
	nop

#define H_T0_Interrupt_Level_14_0x4e
#define My_T0_Interrupt_Level_14_0x4e \
	rd	%softint, %g1; \
	sethi	%hi(0x14000), %g1; \
	or	%g1, 0x1, %g1; \
	wr	%g1, %g0, %clear_softint; \
	add	%l6, 0x4e, %l6; \
	retry; \
	nop; \
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
	nop
        mov     16, %g7
wait_y1:
        cmp     %g7, %g0
        bne     %xcc, wait_y1
        dec     %g7
	nop
	mov	0, %l6
	ta	T_CHANGE_HPRIV
	wrpr	%g0, 0, %pil
	setx	0x88000000, %g1, %g2
	stxa	%g2, [%g0] 0x43
	setx	%hi(data_start), %g1, %l0
	wrpr	%g0, 0, %tick
	wr	%g0, 690, %tick_cmpr
	ta	T_CHANGE_NONHPRIV
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	mov	0x7f, %l2
	add	%l2, %l2, %l2
	sth	%l2, [%l0]
	nop
	nop
	nop
	nop
        mov     32, %g7
wait_z1:
        cmp     %g7, %g0
        bne     %xcc, wait_z1
        dec     %g7
	mov	0, %g1
	add	%g1, 0x4e, %g1
	add	%g1, 0x32, %g1
	cmp	%l6, %g1
	be	diag_pass
	nop
	nop
	ta	T_BAD_TRAP
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

