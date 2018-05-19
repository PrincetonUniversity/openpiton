// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: my_trap_handlers.s
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
/* File  : my_trap_handlers.s
 */

! Enable Traps
#define ENABLE_T1_Reserved_0x11
#define ENABLE_T1_Reserved_0x20
#define ENABLE_HT0_Reserved_0x02

#define H_HT0_Reserved_0x02
#define My_HT0_Reserved_0x02 \
	rdhpr	%htba, %g3; \
	rdpr	%tt, %g4; \
	sllx	%g4, 5, %g4; \
	or	%g3, %g4, %g3; \
	jmp	%g3; \
	nop; \
	nop; \
	nop

! TLZ trap handler
#define H_HT0_Reserved_0x5f
#define My_HT0_Reserved_0x5f \
	rdhpr	%hpstate, %g3; \
	wrhpr	%g3, 1, %hpstate; \
	rdhpr	%htstate, %g4; \
	wrhpr	%g4, 1, %htstate; \
	retry; \
	nop; \
	nop; \
	nop

#define H_T0_Reserved_0x5f
#define SUN_H_T0_Reserved_0x5f \
	rdhpr	%hpstate, %g3; \
	wrhpr	%g3, 1, %hpstate; \
	rdhpr	%htstate, %g4; \
	wrhpr	%g4, 1, %htstate; \
	retry; \
	nop; \
	nop; \
	nop

#define H_T1_Reserved_0x5f
#define SUN_H_T1_Reserved_0x5f \
	rdhpr	%hpstate, %g3; \
	wrhpr	%g3, 1, %hpstate; \
	rdhpr	%htstate, %g4; \
	wrhpr	%g4, 1, %htstate; \
	retry; \
	nop; \
	nop; \
	nop

! RED_state trap handler

#define My_RED_Mode_Other_Reset \
	mov	0xf, %g3; \
	stxa	%g3, [%g0] 0x45; \
	stxa	%g0, [%g0] 0x43; \
	rdhpr	%hpstate, %g3; \
	or	%g3, 0x800, %g3; \
	wrhpr	%g3, %hpstate; \
	rdhpr	%htstate, %g3; \
	rdpr	%tstate, %g4; \
	rdpr	%tpc, %g5; \
	rdpr	%tnpc, %g6; \
	wrpr	%g0, 1, %tl; \
	wrhpr	%g3, %htstate; \
	wrpr	%g4, %tstate; \
	wrpr	%g5, %tpc; \
	wrpr	%g6, %tnpc; \
	retry

!!!!!!!!!!!!!!!!!!!!!! END of all handlers !!!!!!!!!!!!!!!!!!!
