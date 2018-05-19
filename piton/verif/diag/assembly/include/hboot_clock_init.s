// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: hboot_clock_init.s
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
hboot_clock_init:
	! Determine if we came from cold reset
	setx	0x9800000810, %g1, %g2
	ldx	[%g2], %g1
	and	%g1, 4, %g1
	brz	%g1, skip_freq_change

        setx    0x9600000000, %g1, %g2

	! Update CLK_JSYNC creg
	setx	CREGS_CLK_JSYNC, %g1, %g3
	stx	%g3, [%g2 + 0x28]

	! Update CLK_DSYNC creg
	setx	CREGS_CLK_DSYNC, %g1, %g3
	stx	%g3, [%g2 + 0x30]

	! Update CLK_DIV
	setx	CREGS_CLK_DIV, %g1, %g3
	stx	%g3, [%g2]
	ldx	[%g2], %g1 ! make sure store is completed before yanking reset
	cmp	%g1, %g3
	be	%xcc, trig_warm_reset
	nop
	ta	BAD_TRAP

	! Trigger warm reset
trig_warm_reset:
#ifdef TOMATILLO_RESET
        setx 0x800f410000, %g1, %g2        ! Tom addr, which puts bus in dead-cycle mode
        setx CREGS_TOM_CONFIG1, %g1, %g3  ! data to write
        stx  %g3, [%g2]

        setx 0x800f417010, %g1, %g2        ! Tom addr, this will cause warm-reset
        setx 0x0000000000000001, %g1, %g3  ! data to write
        stx  %g3, [%g2]
        
#else
#ifdef RED_EXT_SEC_INC
	nop             ! $EV trig_pc_d (1,@VA(.RED_EXT_SEC.trig_warm_reset)) -> warmrst()
#else
	nop		! $EV trig_pc_d (1,@VA(.RED_SEC.trig_warm_reset)) -> warmrst()
#endif
#endif

skip_freq_change:

#ifdef ENABLE_BISI
	setx hboot_bisi, %g1, %g2
	jmp %g2
	nop
#else
#ifdef NO_SLAM_INIT_DRAMCTL
	setx dramctl_init, %g1, %g2
	jmp %g2
	nop
#else
	setx hboot_pton_init, %g1, %g2
	jmp %g2
	nop
#endif
#endif
