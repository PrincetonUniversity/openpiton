// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: hboot.s
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


proc_good_trap:
	rd %asr26, %g1
	srl %g1, 0x8, %g1	! Shift & Mask
	and %g1, 0x3, %g1	! Thread ID
	or %g0, 0x1, %g3
	sll %g3, %g1, %g3	! ONe-hot Thread


	setx thread_status_mem, %g1, %g2
	stx %g3, [%g2]		! Zero in upper 32 bits indiates success

	setx 0x8100000000, %g1, %g2 ! PITON good IO trap address
	stx %g3, [%g2]
	membar 0x40
	nop

good_trap_end:
	rd %asr26, %g1
	wr %g1, 0x1, %asr26	!Halt
	nop
	b good_trap_end
	nop


.align 32

proc_bad_trap:   
	rd %asr26, %g1
	PITON_PUTS(hboot_thread_stat_string, %l0)
	PITON_PRINT_REG(%g1)
	PITON_PUTS(hboot_nl, %l0)
	srl %g1, 0x8, %g1	! Shift & Mask
	and %g1, 0x3, %g1	! Thread ID
	or %g0, 0x1, %g3
	sll %g3, %g1, %g3	! ONe-hot Thread

	or %g0, 0xf, %g4	! Fail Status
	sllx %g4, 0x20, %g4
	or %g3, %g4, %g4	! Fail status in top 32 bits, TID mask
	
	rdpr 	%tt, %l0
	PITON_PUTS(hboot_trap_type_string, %l1)
	PITON_PRINT_REG(%l0)
	PITON_PUTS(hboot_nl, %l1)

	rdpr 	%tpc, %l0
	PITON_PUTS(hboot_trap_pc, %l1)
	PITON_PRINT_REG(%l0)
	PITON_PUTS(hboot_nl, %l1)

	setx thread_status_mem, %g1, %g2
	stx %g4, [%g2]

	setx 0x8200000000, %g1, %g2 ! PITON bad trap IO address
	stx %g4, [%g2]
	membar 0x40
	nop	

bad_trap_end:
	rd %asr26, %g1
	wr %g1, 0x1, %asr26	!Halt
	nop
	b bad_trap_end
	nop

.align 32
