// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: intr_basic2.s
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
#define H_HT0_Interrupt_0x60 intr_handler
#include "boot.s"

.text
.global main
.global intr

main:
        mov 0, %l1
	setx test_data, %l1, %i0
	add  8, %i0, %i1
	add  16, %i0, %i2
	add  24, %i0, %i3
	add  32, %i0, %i4
	add  40, %i0, %i5
	add  48, %i0, %i6
	add  56, %i0, %i7

intr:	
	nop	! $EV trig_pc_d (1,@VA(.MAIN.intr)) -> intp(0, 0, 8)

	add  8, %i0, %i1
	add  16, %i0, %i2
	add  24, %i0, %i3
	add  32, %i0, %i4
	add  40, %i0, %i5
	add  48, %i0, %i6
	add  56, %i0, %i7

	add  8, %i0, %i1
	add  16, %i0, %i2
	add  24, %i0, %i3
	add  32, %i0, %i4
	add  40, %i0, %i5
	add  48, %i0, %i6
	add  56, %i0, %i7

	add  8, %i0, %i1
	add  16, %i0, %i2
	add  24, %i0, %i3
	add  32, %i0, %i4
	add  40, %i0, %i5
	add  48, %i0, %i6
	add  56, %i0, %i7

	add  8, %i0, %i1
	add  16, %i0, %i2
	add  24, %i0, %i3
	add  32, %i0, %i4
	add  40, %i0, %i5
	add  48, %i0, %i6
	add  56, %i0, %i7

	add  8, %i0, %i1
	add  16, %i0, %i2
	add  24, %i0, %i3
	add  32, %i0, %i4
	add  40, %i0, %i5
	add  48, %i0, %i6
	add  56, %i0, %i7

	add  8, %i0, %i1
	add  16, %i0, %i2
	add  24, %i0, %i3
	add  32, %i0, %i4
	add  40, %i0, %i5
	add  48, %i0, %i6
	add  56, %i0, %i7


/*
 ********************************
 *      Diag PASSED !           *
 ********************************
 */

diag_pass:
        set     0xc001dea1,     %l0
good_trap:
        ta T_GOOD_TRAP
        nop

/*
 ********************************
 *      Diag FAILED !           *
 ********************************
 */

diag_fail:
        set     0xdeadcafe,     %l7
bad_trap:
        ta T_BAD_TRAP
        nop
        nop


.data	

.align 8192

test_data:      .word   0x00000000
		.word   0x11111111
                .word   0x22222222
                .word   0x33333333
                .word   0x44444444
                .word   0x55555555
                .word   0x66666666
                .word   0x77777777
                .word   0x88888888
                .word   0x99999999
                .word   0xaaaaaaaa
                .word   0xbbbbbbbb
                .word   0xcccccccc
                .word   0xdddddddd
                .word   0xeeeeeeee
                .word   0xffffffff

.end



SECTION .USER_TRAP_FOR_HYP TEXT_VA=0x3006000
attr_text {
        Name = .USER_TRAP_FOR_HYP,
        hypervisor
        }
.global intr_handler
intr_handler:
        stxa    %g0, [%g0] 0x72
        nop
        retry
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
