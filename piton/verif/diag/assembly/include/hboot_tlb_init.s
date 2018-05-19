// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: hboot_tlb_init.s
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
        ! init all itlb entries
        mov	0x30, %g1
	mov	%g0, %g2
itlb_init_loop:
        stxa	%g0, [ %g1 ] 0x50
        stxa	%g0, [ %g2 ] 0x55

	add	%g2, 8, %g2
	cmp	%g2, 0x200
	bne	itlb_init_loop
	nop

        ! init all dtlb entries
        mov	0x30, %g1
	mov	%g0, %g2
dtlb_init_loop:
        stxa	%g0, [ %g1 ] 0x58
        stxa	%g0, [ %g2 ] 0x5d

	add	%g2, 8, %g2
	cmp	%g2, 0x200
	bne	dtlb_init_loop
	nop
