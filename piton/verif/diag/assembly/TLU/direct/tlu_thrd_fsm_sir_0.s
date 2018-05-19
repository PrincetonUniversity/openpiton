// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: tlu_thrd_fsm_sir_0.s
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
This diag covers the following cases:
 s_SIR_RST_AT_SUP_ST_TLLT6
 s_SIR_RST_AT_SUP_ST_MAXTL
 s_SIR_RST_AT_HPV_ST_TLLT6
 s_SIR_RST_AT_HPV_ST_MAXTL
 s_SIR_RST_AT_RED_ST_TLLT6
 s_SIR_RST_AT_RED_ST_MAXTL
********************************************************************************/


#define PCONTEXT	0x10
#define SCONTEXT	0x10

#define MAIN_PAGE_NUCLEUS_ALSO
#define MAIN_PAGE_HV_ALSO

#define H_HT0_Illegal_instruction_0x10
#define My_HT0_Illegal_instruction_0x10 \
	sethi  %hi(0x20000000), %g1; \
	wrpr	%g0, 1, %tl; \
	wrpr	%g1, 0, %tpc; \
	wrpr	%g1, 0, %tnpc; \
	done; \
	nop; \
	nop; \
	nop


#define My_Software_Initiated_Reset \
	sethi  %hi(0), %g1; \
	sethi  %hi(0x40000), %g2; \
	mov  %g1, %g1; \
	mov  %g2, %g2; \
	sllx  %g1, 0x20, %g1; \
	or  %g2, %g1, %g2; \
	jmp  %g2; \
	wr  %g0, 5, %asr26

#define My_Watchdog_Reset \
	sethi  %hi(0), %g1; \
	sethi  %hi(0x40000), %g2; \
	mov  %g1, %g1; \
	mov  %g2, %g2; \
	sllx  %g1, 0x20, %g1; \
	or  %g2, %g1, %g2; \
	jmp  %g2; \
	wr  %g0, 5, %asr26

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
	setx	data_start, %g1, %l0
	mov	6, %l1
	ldub	[%l0], %l2
	cmp	%l1, %l2
	be	%xcc, diag_pass
	nop
	dec	%l1
	cmp	%l1, %l2
	be	%xcc, SIR_RED_MAXTL
	nop
	dec	%l1
	cmp	%l1, %l2
	be	%xcc, SIR_RED_TLLT6
	nop
	dec	%l1
	cmp	%l1, %l2
	be	%xcc, SIR_HPV_MAXTL
	nop
	dec	%l1
	cmp	%l1, %l2
	be	%xcc, SIR_HPV_TLLT6
	nop
	dec	%l1
	cmp	%l1, %l2
	be	%xcc, SIR_SUP_MAXTL
	nop
	dec	%l1
	nop
	nop
SIR_SUP_TLLT6:	
	inc	%l1
	stb	%l1, [%l0]
	ta	T_CHANGE_PRIV
	sir
	nop
SIR_SUP_MAXTL:	
	inc	%l1
	stb	%l1, [%l0]
	ta	T_CHANGE_PRIV
	wrpr	%g0, 6, %tl
	sir
	nop
SIR_HPV_TLLT6:	
	inc	%l1
	stb	%l1, [%l0]
	ta	T_CHANGE_HPRIV
	sir
	nop
SIR_HPV_MAXTL:	
	inc	%l1
	stb	%l1, [%l0]
	ta	T_CHANGE_HPRIV
	wrpr	%g0, 6, %tl
	sir
	nop
SIR_RED_TLLT6:	
	inc	%l1
	stb	%l1, [%l0]
	ta	T_CHANGE_HPRIV
	rdhpr	%hpstate, %g1
	wrhpr	%g1, 0x20, %hpstate
	sir
	nop
SIR_RED_MAXTL:	
	inc	%l1
	stb	%l1, [%l0]
	ta	T_CHANGE_HPRIV
	rdhpr	%hpstate, %g1
	wrhpr	%g1, 0x20, %hpstate
	wrpr	%g0, 6, %tl
	sir
	nop
	nop
	ta	T_BAD_TRAP
	nop
.data
/****************
 * Data section *
 ****************/
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
 /*****************
  * Diag PASSED ! *
  *****************/
diag_pass:
	ta	T_GOOD_TRAP
	nop
