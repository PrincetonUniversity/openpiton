// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: Asi_notused.s
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
/*
 *******************************************************************
 * Diag :
 *	Asi_notused.s
 *
 *
 *******************************************************************
 */
#include "enable_traps.h"
#include "boot.s"

#define H_T0_Data_Access_Exception_0x30   custom_data_access_exc_handler
#define H_HT0_Data_Access_Exception_0x30   custom_data_access_exc_handler
#define H_T1_Reserved_0x30   custom_data_access_exc_handler

SECTION .HTRAPS
.text
.align 0x100
.global custom_data_access_exc_handler
custom_data_access_exc_handler:
                        mov     0x18,%g3
                        ldxa    [%g3]0x58,%g1
                        mov     0x20,%g3
                        ldxa    [%g3]0x58,%g2
                        mov     0x30,%g3
                        ldxa    [%g3]0x58,%g5
                        done

SECTION .MAIN
.text
.align 0x1fff+1
.global main
main:
	call	init_regs
	nop

	mov 	0x0,	%l0	/* write to ASI reg */
	mov	0xff,	%l1	/* biggest ASI value */
	setx	init_data, %l0, %l3	/* mem address */
loop_asi:
	mov	0x40,	%l5
	sub 	%l5,	%l0, 	%l6
	brz,a	%l6,	loop_asi
	add	%l0,	0x1,	%l0
	
	call	test_asi
	nop

	sub	%l1,	%l0,	%l2
	add	%l0,	0x1,	%l0
	brgz,a	%l2,	loop_asi
	nop

normal_end:
	ta	T_GOOD_TRAP
	nop

bad_end:
	ta	T_BAD_TRAP
	nop

test_asi:
	wr	%l0, 	0x0, 	%asi
	setx	0x5555555555555555, %o0, %l4
	setx	0x5555aaaa5555aaaa, %o0, %l5
	lduwa	[%l3] %asi, 	%l4	
	sta	%l4,	[%l3] %asi
	ldxa	[%l3] %asi, 	%l4	
	stxa	%l4,	[%l3] %asi
	ldda	[%l3] %asi, 	%l4	
	stda	%l4,	[%l3] %asi
	ldda	[%l3] %asi, 	%f0	
	stda	%f0,	[%l3] %asi
	setx	0x5555ffff5555ffff, %o0, %l4
	setx	0x5555aaaa5555aaaa, %o0, %l5
	sta	%l4,	[%l3] %asi
	stda	%l4,	[%l3] %asi
	stda	%f0,	[%l3] %asi
	retl
	nop

init_regs:
	mov 0, %g0
	mov 0, %g1
	mov 0, %g2
	mov 0, %g3
	mov 0, %g4
	mov 0, %g5
	mov 0, %g6
	mov 0, %g7
	mov 0, %i0
	mov 0, %i1
	mov 0, %i2
	mov 0, %i3
	mov 0, %i4
	mov 0, %i5
	mov 0, %i6
	mov 0, %i7
	mov 0, %l0
	mov 0, %l1
	mov 0, %l2
	mov 0, %l3
	mov 0, %l4
	mov 0, %l5
	mov 0, %l6
	mov 0, %l7

	setx	init_data,	%l0,	%l1
	ldd	[%l1],	%f0
	ldd	[%l1+8],	%f2
	retl
	nop

.data
.align 0x1fff+1
init_data:
	.xword	0x1, 0x2, 0x3, 0x4
	.xword	0x11, 0x22, 0x33, 0x44
	.xword	0x111, 0x222, 0x333, 0x444
	.xword	0x1111, 0x2222, 0x3333, 0x4444
	.xword	0x11111, 0x22222, 0x33333, 0x44444
	.xword	0x111111, 0x222222, 0x333333, 0x444444
	.xword	0x1111111, 0x2222222, 0x3333333, 0x4444444
	.xword	0x11111111, 0x22222222, 0x33333333, 0x44444444

attr_data {
        Name = .MAIN,
        VA= MAIN_BASE_DATA_VA, 
        RA= MAIN_BASE_DATA_RA, 
        PA= ra2pa(MAIN_BASE_DATA_RA, 0),
        part_0_d_ctx_nonzero_ps0_tsb,
        TTE_G=1, TTE_Context=0x55, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=1, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=1, tsbonly
        }

