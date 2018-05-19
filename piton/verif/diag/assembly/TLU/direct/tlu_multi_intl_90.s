// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: tlu_multi_intl_90.s
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
!! Diag: tlu_multi_intl_90.s
!! No. Threads: 1
!! Description: 
!!	This diag creates the pic-overflow trap and TLZ trap
!! conditions at the same time in in User and Supervisor 
!! privilege levels with pstate.IE=1
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

#define PCONTEXT	0x10
#define SCONTEXT	0x10

#define MAIN_PAGE_NUCLEUS_ALSO
#define MAIN_PAGE_HV_ALSO

#include "my_intr_handlers.s"
#include "my_trap_handlers.s"

#define H_T0_Trap_Instruction_0
#define	My_T0_Trap_Instruction_0 \
	done; \
	nop; \
	nop; \
	nop; \
	nop; \
	nop; \
	nop; \
	nop

#define H_HT0_HTrap_Instruction_0
#define	My_HT0_HTrap_Instruction_0 \
	done; \
	nop; \
	nop; \
	nop; \
	nop; \
	nop; \
	nop; \
	nop

!!!!! PIC-Overflow trap handler
#define H_T0_Interrupt_Level_15_0x4f
#define My_T0_Interrupt_Level_15_0x4f \
	rd	%softint, %g1; \
	wr	%g1, %g0, %clear_softint; \
	rd	%pcr, %g1; \
	and	%g1, 0x300, %g2; \
	wr	%g1, %g2, %pcr; \
	add	%l6, 0x4f, %l6; \
	retry; \
	nop

!!!!! TLZ trap handler
#define H_HT0_Reserved_0x5f
#define My_HT0_Reserved_0x5f \
	rdhpr	%hpstate, %g1; \
	wrhpr	%g1, 1, %hpstate; \
	rdhpr	%htstate, %g2; \
	wrhpr	%g2, 1, %htstate; \
	add	%l6, 0x5f, %l6; \
	retry; \
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
	mov	0, %l6
!==========================================
! Enable the PIC to count Supervisor events
	ta	T_CHANGE_HPRIV
	wrpr	%g0, 13, %pil
	rdhpr	%hpstate, %l0
	rdpr	%pstate, %l2
        wr      %g0, 2, %pcr
        setx    %hi(0xfffffffd00000000), %g1, %g2
        wr      %g2, %g0, %pic
	wrpr	%l2, 4, %pstate	 !Set Supervisor priv bit
	wrhpr	%l0, 5, %hpstate !Clear Hypervisor priv bit and Set TLZ bit
	nop
	wrpr	%g0, 1, %tl	!Change TL to 1
	wrpr	%g0, 0, %tl	!Change TL from 1 -> 0
tlz_n_pic_ovfl_traps_at_supervisor:
	ta	0x90	!Take  hypervisor trap and return back
	nop
	nop
	wrpr	%l2, %g0, %pstate !Clear Supervisor priv bit
!====================================
! Change the PIC to count User events
	ta	T_CHANGE_HPRIV
	rdhpr	%hpstate, %l0
        wr      %g0, 4, %pcr
        setx    %hi(0xfffffffe00000000), %g1, %g2
        wr      %g2, %g0, %pic
	wrhpr	%l0, 5, %hpstate !Clear Hypervisor priv bit and Set TLZ bit
	nop
	nop
	ta	0x30	!Take  a trap to Supervisor and return back
tlz_n_pic_ovfl_traps_at_user:
	ta	0x30	!Take  a trap to Supervisor and return back
	nop
	nop
	mov	0, %g1
	add	%g1, 0x4f, %g1
	add	%g1, 0x4f, %g1
	add	%g1, 0x5f, %g1
	add	%g1, 0x5f, %g1
	cmp	%g1, %l6
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

