// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: tlu_wd_rst_2.s
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
/********************************************************************************
 This diag creates a watchdog reset trap condition by creating a normal trap
when TL=MAXTL(6) and HPSTATE.red=1.
********************************************************************************/


#define PCONTEXT	0x10
#define SCONTEXT	0x10

#define MAIN_PAGE_NUCLEUS_ALSO
#define MAIN_PAGE_HV_ALSO

#define My_Watchdog_Reset \
	rdpr	%tpc, %r24; \
	rdpr	%tnpc, %r26; \
	wrpr	%g0, 1, %tl; \
	wrpr	%r24, %tpc; \
	wrpr	%r26, %tnpc; \
	done; \
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
	set	data_start, %r16
	ldsb	[%r16+%g0], %g1
	cmp	%g1, 1
	be	%xcc, diag_pass
	nop
	add	%g1, 1, %g1
	stb	%g1, [%r16+%g0]
	nop
	ta	T_CHANGE_HPRIV	! macro
	rdhpr	%hpstate, %g2
	wrhpr	%g2, 0x420, %hpstate !IBE=1, RED=1
	rdhpr	%hpstate, %g2
	wrpr	%g0, 6, %tl
	nop
	nop
	ta	T_CHANGE_NONHPRIV	! macro
	stb	%g1, [%g1+%g0]
	nop
	nop
	nop
	nop
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

