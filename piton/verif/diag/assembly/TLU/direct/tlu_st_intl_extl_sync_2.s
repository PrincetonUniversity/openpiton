// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: tlu_st_intl_extl_sync_2.s
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
!/******************************************************************************
This diag creats the condition of HW setting the SOFTINT[0] on a tick-match
event and SW clearing the same bit at the same time by writing to CLEAR_SOFTINT 
*******************************************************************************/

#define PCONTEXT	0x10
#define SCONTEXT	0x10

#define MAIN_PAGE_NUCLEUS_ALSO
#define MAIN_PAGE_HV_ALSO

#define H_HT0_HTrap_Instruction_0
#define	My_HT0_HTrap_Instruction_0 \
	wrpr	%g0, %tick; \
	and	%l2, 0xfff, %l2; \
	wr	%g0, %l2, %tick_cmpr; \
	add	%l2, 4, %l2; \
	done; \
	nop; \
	nop; \
	nop

#define H_T0_Interrupt_Level_14_0x4e
#define My_T0_Interrupt_Level_14_0x4e \
	rd	%softint, %g1; \
	and	%g1, 1, %g1; \
	wr	%g1, 0, %clear_softint; \
	ta	0x90; \
	retry; \
	nop; \
	nop; \
	nop

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
	wrpr	%g0, %pil
	wrpr	%g0, %tick
	wr	%g0, 0x200, %tick_cmpr
	ta	T_CHANGE_NONHPRIV	! macro
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	mov	32, %l2
	mov	256, %l0
htrap:
!!!!!!!!!!!!!!!!!!!!!!!!!
!! s_TICK_IFU_SYNC_TRAP
!! s_TICK_EXU_SYNC_TRAP
	ta	0x90
	cmp	%l0, %g0
	bne	htrap
	dec	%l0
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

