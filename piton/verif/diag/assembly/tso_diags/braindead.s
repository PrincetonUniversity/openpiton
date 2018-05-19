// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: braindead.s
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
/***********************************************************************
 * Name:   braindead.s
 *
 * Description: Make sure the simulation is out
 * of boot code. Some interrupt handlers were neededwhen I tested
 * interrupts, so they are in.
 **********************************************************************/

#define H_HT0_Interrupt_0x60 intr0x60_custom_trap
#define My_HT0_Interrupt_0x60	\
        ldxa    [%g0] 0x72, %g2;	\
        ldxa    [%g0] 0x74, %g1;       	\
        retry;

#include "boot.s"

.global main

main:

	nop;nop; nop; nop;
	nop;nop; nop; nop;
	nop;nop; nop; nop;
	nop;nop; nop; nop;
	nop;nop; nop; nop;
	nop;nop; nop; nop;
	nop;nop; nop; nop;
	nop;nop; nop; nop;
	nop;nop; nop; nop;
	nop;nop; nop; nop;
	nop;nop; nop; nop;
	nop;nop; nop; nop;
	nop;nop; nop; nop;
	nop;nop; nop; nop;

	ba next			! just wanted to test this weird jump also.
next:
	nop

good_end:
        ta      T_GOOD_TRAP
bad_end:
        ta      T_BAD_TRAP
!--------------------------------------------------------------------------

SECTION .MY_HYP_SEC TEXT_VA = 0x1100150000
attr_text {
        Name=.MY_HYP_SEC,
        hypervisor
        }
.text
.global intr0x60_custom_trap
intr0x60_custom_trap:
        ldxa    [%g0] 0x72, %g2;
        ldxa    [%g0] 0x74, %g1;        
        retry;

!============================================================================
