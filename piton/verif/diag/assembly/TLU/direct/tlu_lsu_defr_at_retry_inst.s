// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: tlu_lsu_defr_at_retry_inst.s
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
!! Diag: tlu_lsu_defr_at_done_inst.s
!! No. Threads: 1
!! Description: 
!! This diag tests the dtlb-data parity error (lsu-deferred) trap 
!! on a DONE instruction
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

#define PCONTEXT	0x10
#define SCONTEXT	0x10

#define MAIN_PAGE_NUCLEUS_ALSO
#define MAIN_PAGE_HV_ALSO

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

#define H_T0_Trap_Instruction_0
#define	My_T0_Trap_Instruction_0 \
	add	%l6, 0x30, %l6; \
	setx    %hi(0x60000000), %g1, %g2; \
	mov	0x55, %g3; \
	cmp	%l6, 0x92; \
	be	dn_inst; \
	sth     %g3, [%g2]; \
	retry; \
dn_inst: \
	done

#define H_T1_Trap_Instruction_0
#define	My_T1_Trap_Instruction_0 \
	add	%l6, 0x30, %l6; \
	setx    %hi(0x60000000), %g1, %g2; \
	mov	0x55, %g3; \
	sth     %g3, [%g2]; \
	done; \
	done; \
	done; \
	nop

#define H_T0_Privileged_opcode_0x11
#define My_T0_Privileged_opcode_0x11 \
	rdhpr	%htba, %g3; \
	rdpr	%tl, %g3; \
	rdpr	%gl, %g3; \
	rdpr	%tstate, %g3; \
	rdpr	%tpc, %g3; \
	rdpr	%tnpc, %g3; \
	rdhpr	%htstate, %g3; \
	done

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
!========================
! Initialize trap counter
	mov	0, %l6
!========================
! Enable Error Injection
	ta      T_CHANGE_HPRIV
 	rdhpr   %hpstate, %l1
	setx    0x88000000, %g1, %g2
	stxa    %g2, [%g0] 0x43
	wrhpr   %l1, 4, %hpstate
!========================
! Take trap to Supervisor
	ta	0x30
	add	%l6, 0x11, %l6
	rdpr	%pstate, %l6
!=======================
! Check the trap counter
	mov	0, %g1
	add	%g1, 0x11, %g1
	add	%g1, 0x30, %g1
	add	%g1, 0x32, %g1
	add	%g1, 0x30, %g1
	add	%g1, 0x32, %g1
	cmp	%l6, %g1
	be	diag_pass
	nop
	ta	T_BAD_TRAP
	nop
	nop
	nop
	nop
	.data
	.global data_start
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

