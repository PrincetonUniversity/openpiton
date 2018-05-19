// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: syscall_handler.s
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
syscall_handler:
	! get tpc/tnpc/tstate and save them
	rdpr	%tpc, %g1
	rdpr	%tnpc, %g2
	rdpr	%tstate, %g3
	stx	%g1, [%g4]	! save tpc
	stx	%g2, [%g4+8]	! save tnpc
	stx	%g3, [%g4+16]	! save tstate
	setx	kernel_syscall, %g1, %g2
	wrpr	%g2, %g0, %tnpc
	sllx	%g3, 59, %g3	! extract cwp from tstate
	srlx	%g3, 59, %g3
	setx	cregs_tstate_r64, %g1, %g2
	srlx	%g2, 5, %g2	! remove cwp from cregs_tstate_r64
	sllx	%g2, 5, %g2
	or	%g3, %g2, %g3
	wrpr	%g3, %g0, %tstate
	
	! get primary/secondary context and save them
	mov	0x8, %g1
	ldxa	[%g1] 0x21, %g2
	stx	%g2, [%g4+24]	! save p context
	stxa	%g0, [%g1] 0x21	! set p context to zero
	
	mov	0x10, %g1
	ldxa	[%g1] 0x21, %g3
	stx	%g3, [%g4+32]	! save s context
	stxa	%g0, [%g1] 0x21 ! set s context to zero

	! go to kernel
	done
	nop	

	
sysret_handler:
	! restore tpc/tnpc/tstate
	ldx	[%g4], %g1	! get tpc
	ldx	[%g4+8], %g2	! get tnpc
	ldx	[%g4+16], %g3	! get tstate
	wrpr	%g1, %g0, %tpc
	wrpr	%g2, %g0, %tnpc
	wrpr	%g3, %g0, %tstate

	! restore primary/secondary context
	mov	0x8, %g1
	ldx	[%g4+24], %g2	! get p context
	stxa	%g2, [%g1] 0x21

	mov	0x10, %g1
	ldx	[%g4+32], %g3	! get s context
	stxa	%g3, [%g1] 0x21

	! return to user
	done
	nop
	
