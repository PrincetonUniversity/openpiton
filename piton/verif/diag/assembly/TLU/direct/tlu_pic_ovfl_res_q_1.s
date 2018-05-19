// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: tlu_pic_ovfl_res_q_1.s
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
!! Diag: tlu_pic_ovfl_res_q_1.s
!! No. Threads: 1
!! Description: 
!! This diag tests the pic-overflow  and res_mondo_queue trap
!! conditions at same time
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

#define PCONTEXT	0x10
#define SCONTEXT	0x10

#define MAIN_PAGE_NUCLEUS_ALSO
#define MAIN_PAGE_HV_ALSO


#define H_T0_Resumable_Error_0x7e
#define My_T0_Resumable_Error_0x7e \
	mov	0x3e8, %g2; \
	ldxa	[%g2] 0x25, %g4; \
	mov	0x3e0, %g2; \
	stxa	%g4, [%g2] 0x25; \
        add	%l6, 0x7e, %l6; \
	retry; \
	nop; \
	nop

#define H_T0_Interrupt_Level_15_0x4f
#define My_T0_Interrupt_Level_15_0x4f \
        rd      %softint, %g1; \
        sethi   %hi(0x8000), %g1; \
        wr      %g1, %g0, %clear_softint; \
        rd      %pcr, %g1; \
        and     %g1, 0x300, %g2; \
        wr      %g1, %g2, %pcr; \
	add	%l6, 0x4f, %l6; \
        retry


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
wait_0:
        cmp     %g7, %g0
        bne     %xcc, wait_0
        dec     %g7
!Create a Level_15 SW interrupt to get the iTLB 
	ta	T_CHANGE_PRIV
	wrpr	%g0, 14, %pil
        sethi   %hi(0x8000), %g1
	wr	%g1, 0, %set_softint
	ta	T_CHANGE_NONPRIV
	nop
	nop
!Reset the interrupt counter
	mov	0, %l6
!-----------------------------------------------------
!Create res_mondo_queue & pic-ovfl traps: User=1, IE=1
	ta	T_CHANGE_HPRIV
	rdhpr	%hpstate, %l0
	rdpr	%pstate, %l1
	wrpr	%l1, 6, %pstate
	wr	%g0, 6, %pcr
	setx	%hi(0xffffffff00000000), %g1, %l2
	wr	%l2, %g0, %pic
	mov	0x3e0, %l3
	ldxa	[%l3] 0x25, %l2
	add	%l2, 0x40, %l2
	add	%l3, 8, %l3
	stxa	%l2, [%l3] 0x25
	wrhpr	%l0, 4, %hpstate !ta	T_CHANGE_NONHPRIV
	wrpr	%l1, 0, %pstate
pic_qres_1:
	nop
	nop
        mov     16, %g7
wait_1:
        cmp     %g7, %g0
        bne     %xcc, wait_1
        dec     %g7
	nop
	nop
!-----------------------------------------------------------
!Create res_mondo_queue & pic-ovfl traps: Supervisor=1, IE=1
	ta	T_CHANGE_HPRIV
	rdhpr	%hpstate, %l0
	rdpr	%pstate, %l1
	wrpr	%l1, 6, %pstate
	wr	%g0, 6, %pcr
	setx	%hi(0xffffffff00000000), %g1, %l2
	wr	%l2, %g0, %pic
	mov	0x3e0, %l3
	ldxa	[%l3] 0x25, %l2
	add	%l2, 0x40, %l2
	add	%l3, 8, %l3
	stxa	%l2, [%l3] 0x25
	wrhpr	%l0, 4, %hpstate !ta	T_CHANGE_NONHPRIV
	wrpr	%l1, 4, %pstate
pic_qres_2:
	nop
	nop
        mov     16, %g7
wait_2:
        cmp     %g7, %g0
        bne     %xcc, wait_2
        dec     %g7
	nop
	nop
!------------------------
! Clear the pstate.IE bit
!------------------------
	rdpr	%pstate, %g1
	wrpr	%g1, 6, %pstate
!-----------------------------------------------------
!Create res_mondo_queue & pic-ovfl traps: User=1, IE=0
	ta	T_CHANGE_HPRIV
	rdhpr	%hpstate, %l0
	rdpr	%pstate, %l1
	wrpr	%l1, 4, %pstate
	wr	%g0, 6, %pcr
	setx	%hi(0xffffffff00000000), %g1, %l2
	wr	%l2, %g0, %pic
	mov	0x3e0, %l3
	ldxa	[%l3] 0x25, %l2
	add	%l2, 0x40, %l2
	add	%l3, 8, %l3
	stxa	%l2, [%l3] 0x25
	wrhpr	%l0, 4, %hpstate !ta	T_CHANGE_NONHPRIV
	wrpr	%l1, 0, %pstate
pic_qres_3:
	nop
	nop
        mov     16, %g7
wait_3:
        cmp     %g7, %g0
        bne     %xcc, wait_3
        dec     %g7
	nop
	nop
!-----------------------------------------------------------
!Create res_mondo_queue & pic-ovfl traps: Supervisor=1, IE=0
	ta	T_CHANGE_HPRIV
	rdhpr	%hpstate, %l0
	rdpr	%pstate, %l1
	wrpr	%l1, 4, %pstate
	wr	%g0, 6, %pcr
	setx	%hi(0xffffffff00000000), %g1, %l2
	wr	%l2, %g0, %pic
	mov	0x3e0, %l3
	ldxa	[%l3] 0x25, %l2
	add	%l2, 0x40, %l2
	add	%l3, 8, %l3
	stxa	%l2, [%l3] 0x25
	wrhpr	%l0, 4, %hpstate !ta	T_CHANGE_NONHPRIV
	wrpr	%l1, 4, %pstate
pic_qres_4:
	nop
	nop
        mov     16, %g7
wait_4:
        cmp     %g7, %g0
        bne     %xcc, wait_4
        dec     %g7
	nop
	nop
!============================
! Check the interrupt counter
	mov	0, %g1
	add	%g1, 0x4f, %g1
	add	%g1, 0x4f, %g1
	add	%g1, 0x7e, %g1
	add	%g1, 0x7e, %g1
	cmp	%l6, %g1
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

