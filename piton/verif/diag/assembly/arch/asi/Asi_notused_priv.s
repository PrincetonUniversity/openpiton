// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: Asi_notused_priv.s
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
 *******************************************************************
 */
#define MAIN_PAGE_HV_ALSO
#define MAIN_PAGE_NUCLEUS_ALSO

#include "enable_traps.h"
#include "boot.s"

.text
.global main
main:
	call	init_regs
	nop

	ta	T_CHANGE_PRIV
	nop

	mov 	0x0,	%l0	/* write to ASI reg */
	mov	0x19,	%l1	/* biggest ASI value */
	setx	init_data, %l7, %l3	/* mem address */
loop_asi0:
	call	test_asi
	nop

	mov 	0x1b,	%l0	/* write to ASI reg */
	mov	0x4f,	%l1	/* biggest ASI value */
	setx	init_data, %l7, %l3	/* mem address */
loop_asi1:
	call	test_asi
	nop

	mov 	0x53,	%l0	/* write to ASI reg */
	mov	0x53,	%l1	/* biggest ASI value */
	setx	init_data, %l7, %l3	/* mem address */
loop_asi2:
	call	test_asi
	nop

	mov 	0x60,	%l0	/* write to ASI reg */
	mov	0xff,	%l1	/* biggest ASI value */
	setx	init_data, %l7, %l3	/* mem address */
loop_asi3:
	call	test_asi
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
	setx	0xaaaaaaaa55555555, %o0, %l5
	stda	%l4,	[%l3] %asi
	sta	%l4,	[%l3+4] %asi
	sta	%l5,	[%l3+8] %asi
	sta	%l5,	[%l3+12] %asi
	sta	%l4,	[%l3+16] %asi
	stxa	%l4,	[%l3] %asi
	lduwa	[%l3] %asi, 	%l4	
	ldxa	[%l3] %asi, 	%l4	
	ldda	[%l3] %asi, 	%l4	
	stda	%f0,	[%l3] %asi
	ldda	[%l3] %asi, 	%f0	
	stda	%f0,	[%l3] %asi
	setx	0x5555ffff5555ffff, %o0, %l4
	setx	0x5555aaaaaaaaffff, %o0, %l5
	sta	%l4,	[%l3] %asi
	stda	%l4,	[%l3] %asi
	stda	%f0,	[%l3] %asi
	ldda	[%l3] %asi, 	%f0	

	sub	%l1,	%l0,	%l2
	brgz,a	%l2,	test_asi
	add	%l0,	0x1,	%l0

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
.skip 1024
init_data_end:
	.xword 0,0,0,0

attr_data {
        Name = .MAIN,
        start_label=init_data, end_label=init_data_end, 
	PA=ra2pa(0x0020110000,0), RA=0020110000,
        part_0_d_ctx_nonzero_ps0_tsb,
        TTE_G=0, TTE_Context=0x55, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=0, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=1
        }

