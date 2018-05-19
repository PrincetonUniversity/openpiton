// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: lsu_simul_faults.s
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
	
#include "boot.s"

.text
.global main
.global sum3

main:
/*
 **********************************************************
 *
 *  This diag will try to create a lot of IMMU/DMMU misses
 **********************************************************
*/
        mov 0, %l1
	ba,a   next_page
.align 8192

next_page:
	setx stfps_nmdata, %l1, %i1
        setx ldint_1, %l1, %i2
	setx fst_data, %l1, %i3
	setx stfsr_sdata, %l1, %i4
	setx stfsr_ddata, %l1, %i5
	setx stfpd_nmdata, %l1, %l6
        ldx  [%i1], %o1
	ba,a   np1
.align 8192

np1:
        ldx  [%i2], %o0
        ldx  [%i3], %o3
        ldx  [%i4], %o4
	ba,a   np2
.align 8192

np2:
        ldx  [%i5], %o5
        ldx  [%l6], %l7 

! Try to access a double word one cache line away from before  to create miss 

	add  %l6, 0x80, %l6
        ldx  [%l6], %l5
	add  %l6, 0x80, %l6
        ldx  [%l6], %l5
	ba,a   np3
.align 8192

np3:
	add  %l6, 0x80, %l6
        ldx  [%l6], %l5
	add  %l6, 0x80, %l6
        ldx  [%l6], %l5

/*
 ********************************
 *      Check to see if the loads did Ok
 ********************************
*/

	setx 0x123456789abcdef0, %l1, %l2
	subcc %o1, %l2, %l3
	bne diag_fail

	setx 0x700f000000000000, %l1, %l2
	subcc %o3, %l2, %l3
	bne diag_fail

	setx 0xffeeddccbbaa9988, %l1, %l2
	subcc %o4, %l2, %l3
	bne diag_fail

	setx 0x1111222233334444, %l1, %l2
	subcc %o5, %l2, %l3
	bne diag_fail

	setx 0x000005678e300000, %l1, %l2
	subcc %l7, %l2, %l3
	bne diag_fail

	setx 0x55aa11bbaa5577ff, %l1, %l2
	subcc %o0, %l2, %l3
	bne diag_fail 

/*
 ********************************
 *      Create store misses
 ********************************
*/

	setx 0x7007007007007000, %i1, %l0

	setx stint_1, %l1, %i1
	ba,a   np4
.align 8192

np4:
	setx stint_asi1, %l1, %i2
	setx stint_asi2, %l1, %i3
	setx ldfsr_sdata, %l1, %i4
	setx ldfsr_ddata, %l1, %i5
	setx fps_nmdata, %l1, %l6
	ba,a   np5
.align 8192

np5:

	stx %l0, [%i1]
	stx %l0, [%i2]
	ba,a   np6
.align 8192

np6:
	stx %l0, [%i3]
	stx %l0, [%i4]
	stx %l0, [%i5]
	stx %l0, [%l6] 
/*
 ********************************
 *      Check to see if the stores did Ok
 ********************************
*/

	ldx  [%i1], %l1
	subcc %l0, %l1, %l2
        bne diag_fail

	ldx  [%i2], %o0
	subcc %l0, %o0, %l3
        bne diag_fail

	ldx  [%i3], %l3
	subcc %l0, %o0, %l3
        bne diag_fail

	ldx  [%i4], %l3
	subcc %l0, %o0, %l3
        bne diag_fail

	ldx  [%i5], %l3
	subcc %l0, %o0, %l3
        bne diag_fail

	ldx  [%l6], %l3
	subcc %l0, %o0, %l3
        bne diag_fail 

/*
 ********************************
 *      Diag PASSED !           *
 ********************************
 */

diag_pass:
        set     0xc001dea1,     %l0
        ta T_GOOD_TRAP
        nop

/*
 ********************************
 *      Diag FAILED !           *
 ********************************
 */

diag_fail:
        set     0xdeadcafe,     %l7
        ta T_BAD_TRAP
        nop
        nop

.data	

ldint_1:	.word	0x55aa11bb
		.word	0xaa5577ff
		.word	0x77aa55bb
		.word	0xaa55ff44
		.word	0xaa5577ff
		.word	0xaa5577ff
.align 8192

fst_data:       .xword  0x700f000000000000
                .xword  0x700f000000000000
                .xword  0x700ff00000000000
                .xword  0x700ff00000000000
.align 8192

stfsr_sdata:    .word   0xffeeddcc
                .word   0xbbaa9988
                .word   0x77665544
                .word   0x33221100
.align 8192

stfsr_ddata:    .xword  0x1111222233334444
                .xword  0x5555666677778888
                .xword  0x9999aaaabbbbcccc
                .xword  0xddddeeeeffff0000
.align 8192

stfps_nmdata:   .word   0x12345678
                .word   0x9abcdef0
                .word   0xffffeeee
                .word   0x76547654
.align 8192

stfpd_nmdata:   .xword  0x000005678e300000
                .xword  0x0000000000193645
                .xword  0x43ae671200000000
                .xword  0x0000034493470000
.align 8192


stint_1:        .word   0x52163287
                .word   0x76124356
                .word   0x52435160
                .word   0x05124540
.align 8192

stint_asi1:     .word   0x54124752
                .word   0x73214532
                .word   0x56148727
                .word   0x51246370
.align 8192

stint_asi2:     .word   0x87346312
                .word   0x65124765
                .word   0x51247600
                .word   0x09348680
.align 8192



ldfsr_sdata:    .word   0x00000800
                .word   0x00000400
                .word   0x00000000
                .word   0x00000c00
.align 8192


ldfsr_ddata:    .xword  0x0000000000000800
                .xword  0x0000000000000400
                .xword  0x0000000000000000
                .xword  0x0000000000000c00
.align 8192


fps_data:       .word   0x00200000
                .word   0x00400000
                .word   0x00600000
                .word   0x00a00000
.align 8192


fps_nmdata:     .word   0x70200000
                .word   0x70400000
                .word   0x70b00000
                .word   0x70b00000
.align 8192


fpd_data:       .xword  0x0002000000000000
                .xword  0x0004000000000000
                .xword  0x0006000000000000
                .xword  0x0008000000000000
.align 8192


fpd_nmdata:     .xword  0x7002000000000000
                .xword  0x7004000000000000
                .xword  0x700b000000000000
                .xword  0x700b000000000000
.align 8192


fpquad_data:    .xword  0x0000200000000000
                .xword  0x0000000000000000
                .xword  0x0000400000000000
                .xword  0x0000000000000000
                .xword  0x0000600000000000
                .xword  0x0000000000000000
                .xword  0x0000800000000000
                .xword  0x0000000000000000
.align 8192


fpquad_nmdata:  .xword  0x7000200000000000
                .xword  0x0000000000000000
                .xword  0x7000400000000000
                .xword  0x0000000000000000
                .xword  0x7000b00000000000
                .xword  0x0000000000000000
                .xword  0x7000b00000000000
                .xword  0x0000000000000000
.align 8192


fps_cvt_data1:	.word	0x00200000
		.word	0x00400000
		.word	0x00600000
		.word	0x00a00000
.align 8192


fps_cvt_nmd1:	.word	0x40400000	/* 3 */
		.word	0x40c00000	/* 6 */
		.word	0x41100000	/* 9 */
		.word	0x42100000	/* 36 */ 

.end
