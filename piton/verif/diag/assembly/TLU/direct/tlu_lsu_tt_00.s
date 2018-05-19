// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: tlu_lsu_tt_00.s
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
!! Diag: tlu_lsu_tt_00.s
!! No. Threads: 1
!! Description: 
!! This diag tests the lsu-synchronous "data_access_error" trap
!! on load with dTLB parity error injection
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
	inc	%l5; \
	done; \
	nop; \
	nop; \
	nop; \
	nop; \
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
	mov	0, %l5
        mov     16, %g7
wait_y3:
        cmp     %g7, %g0
        bne     %xcc, wait_y3
        dec     %g7
	nop
	ta	T_CHANGE_HPRIV
	rdhpr	%hpstate, %l4
!!============================
!! Enable dTLB error injection
	setx	0x88000000, %g1, %g2
	stxa	%g2, [%g0] 0x43
	wrhpr	%l4, 4, %hpstate !ta	T_CHANGE_NONHPRIV
!!=========================================
!! load to create precise data_access_error
	setx	%hi(data_start), %g1, %l0
	ldsh	[%l0], %l2
	nop
	ta	T_CHANGE_HPRIV
	rdhpr	%hpstate, %l4
!!======================================
!! store to create data_access_prot trap
	setx	%hi(0x4000), %g1, %l0
	mov	0x55, %l2
	sth	%l2, [%l0]
	wrhpr	%l4, 4, %hpstate !ta	T_CHANGE_NONHPRIV
	nop
	nop
	mov	1, %g1
	cmp	%l5, %g1
	be	diag_pass
	nop
	ta	T_BAD_TRAP
	nop
	nop
	nop
	nop
	.data
data_start:

        .xword  0x6a395f381bdc7771
        .xword  0xa38c2a69de721629
        .xword  0x11898bf2543d699b
        .xword  0xca7ea633b9b31413
        .xword  0xc71a872e4f1bfecd
        .xword  0x70cda1422b6906f7
        .xword  0xbd76275fe6edc7cb
        .xword  0x9c057a654331e8bd
        .xword  0xcf9d1005ef1f0ac5
        .xword  0xfdc99c5010b7e589
        .xword  0x034ee75947b016df
        .xword  0xae2b246291a5c761
        .xword  0xda73f4fd82c4adcd
        .xword  0xa07a38e05321eb4b
        .xword  0x1c4171f92ab8c13a
        .xword  0x393e961458dbae63

.text
 /********************************
  *      Diag PASSED !           *
  ********************************/
diag_pass:
	ta	T_GOOD_TRAP

.data
	.xword 0x1234567887654321

