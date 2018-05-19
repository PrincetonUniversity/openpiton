// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: watchdog_reset_handler.s
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
	! Enable I/D Cache and TLBs
	mov	0xf, %g1
	stxa	%g1, [%g0] 0x45
	stxa	%g0, [%g0] 0x43
#ifndef HPV_NONSPLIT_MODE
	rdhpr	%hpstate, %g1
	or	%g1, 0x800, %g1
	wrhpr	%g1, %hpstate
#endif
	! Read (H)PSTATE/PC/nPC from Trap Stack @maxtl
	rdhpr	%htstate, %g1
	rdpr	%tstate, %g2
	rdpr	%tpc, %g3
	rdpr	%tnpc, %g4
	! Lower the Trap Level
	wrpr	%g0, 1, %tl
	! Write (H)PSTATE/PC/nPC to Trap Stack @new TL
	wrhpr	%g1, %htstate
	wrpr	%g2, %tstate
	wrpr	%g3, %tpc
	wrpr	%g4, %tnpc
	retry
