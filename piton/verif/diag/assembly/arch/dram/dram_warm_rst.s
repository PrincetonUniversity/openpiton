// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: dram_warm_rst.s
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
 * Name:   Random diag
 * Date:   10/12/03
 *
 *  Description:
 *   Simple test for ldxs
 *   Introduce WARM RESET
 *
 **********************************************************************/

#define MAIN_PAGE_HV_ALSO

#ifdef MT_TEMPLATE
#include "mt_body.h"
#else
#include "boot.s"
.global main
#endif

.global sam_fast_immu_miss
.global sam_fast_dmmu_miss

.text


main:

/*
 **********************************************************
 *
 *  This diag will try to create a lot of load/store misses
 **********************************************************
*/

  ta    T_CHANGE_HPRIV
!   For warm reset this register need be set to 1 ( bit 61, CLK_CTL)
  setx  0x9600000000, %l0, %l1
  setx  0x2000000000000000, %l0, %l5
  ldx   [%l1+0x08], %l4
  or    %l5, %l4, %l4
  stx   %l4, [%l1+0x08]
  ta    T_CHANGE_NONHPRIV


        mov 0, %l1
	setx stfps_nmdata, %l1, %i1
        setx ldint_1, %l1, %i2
	setx fst_data, %l1, %i3
	setx stfsr_sdata, %l1, %i4
	setx stfsr_ddata, %l1, %i5
	setx stfpd_nmdata, %l1, %l6
        ldx  [%i1], %o1
        ldx  [%i2], %o0


warm_rst:
        ldx  [%i3], %o3 !$EV  trig_pc_d(1, @VA(.MAIN.warm_rst)) -> warmrst()
        ldx  [%i4], %o4
        ldx  [%i5], %o5
        ldx  [%l6], %l7 

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
 *      Diag PASSED !           *
 ********************************
 */
diag_pass:
        set     0xc001dea1,     %l0
        ta 	T_GOOD_TRAP
        nop

/*
 ********************************
 *      Diag FAILED !           *
 ********************************
 */
diag_fail:
        set     0xdeadcafe,     %l0
        ta 	T_BAD_TRAP
        nop
        nop


.data 

.global  dtte_64kb_data

ldint_1:	.word	0x55aa11bb
		.word	0xaa5577ff
		.word	0x77aa55bb
		.word	0xaa55ff44
		.word	0xaa5577ff
		.word	0xaa5577ff

fst_data:       .xword  0x700f000000000000
                .xword  0x700f000000000000
                .xword  0x700ff00000000000
                .xword  0x700ff00000000000

stfsr_sdata:    .word   0xffeeddcc
                .word   0xbbaa9988
                .word   0x77665544
                .word   0x33221100

stfsr_ddata:    .xword  0x1111222233334444
                .xword  0x5555666677778888
                .xword  0x9999aaaabbbbcccc
                .xword  0xddddeeeeffff0000

stfps_nmdata:   .word   0x12345678
                .word   0x9abcdef0
                .word   0xffffeeee
                .word   0x76547654

stfpd_nmdata:   .xword  0x000005678e300000
		.xword  0x000005678e300000
		.xword  0x000005678e300000
		.xword  0x000005678e300000
		.xword  0x000005678e300000
		.xword  0x000005678e300000
		.xword  0x000005678e300000
		.xword  0x000005678e300000
		.xword  0x000005678e300000
		.xword  0x000005678e300000
		.xword  0x000005678e300000
		.xword  0x000005678e300000
		.xword  0x000005678e300000
		.xword  0x000005678e300000
		.xword  0x000005678e300000
		.xword  0x000005678e300000
		.xword  0x000005678e300000
		.xword  0x000005678e300000
		.xword  0x000005678e300000
		.xword  0x000005678e300000
		.xword  0x000005678e300000
		.xword  0x000005678e300000
		.xword  0x000005678e300000
		.xword  0x000005678e300000
		.xword  0x000005678e300000
		.xword  0x000005678e300000
		.xword  0x000005678e300000
		.xword  0x000005678e300000
		.xword  0x000005678e300000
		.xword  0x000005678e300000
		.xword  0x000005678e300000
		.xword  0x000005678e300000
		.xword  0x000005678e300000
                .xword  0x0000000000193645
                .xword  0x43ae671200000000
                .xword  0x0000034493470000
                .xword  0x0000000000193645
                .xword  0x43ae671200000000
                .xword  0x0000034493470000
                .xword  0x0000000000193645
                .xword  0x43ae671200000000
                .xword  0x0000034493470000
                .xword  0x0000000000193645
                .xword  0x43ae671200000000
                .xword  0x0000034493470000
                .xword  0x0000000000193645
                .xword  0x43ae671200000000
                .xword  0x0000034493470000
                .xword  0x0000000000193645
                .xword  0x43ae671200000000
                .xword  0x0000034493470000
                .xword  0x0000000000193645
                .xword  0x43ae671200000000
                .xword  0x0000034493470000
                .xword  0x0000000000193645
                .xword  0x43ae671200000000
                .xword  0x0000034493470000
                .xword  0x0000000000193645
                .xword  0x43ae671200000000
                .xword  0x0000034493470000
                .xword  0x0000000000193645
                .xword  0x43ae671200000000
                .xword  0x0000034493470000
                .xword  0x0000000000193645
                .xword  0x43ae671200000000
                .xword  0x0000034493470000
                .xword  0x0000000000193645
                .xword  0x43ae671200000000
                .xword  0x0000034493470000
                .xword  0x0000000000193645
                .xword  0x43ae671200000000
                .xword  0x0000034493470000
                .xword  0x0000000000193645
                .xword  0x43ae671200000000
                .xword  0x0000034493470000
                .xword  0x0000000000193645
                .xword  0x43ae671200000000
                .xword  0x0000034493470000
                .xword  0x0000000000193645
                .xword  0x43ae671200000000
                .xword  0x0000034493470000
                .xword  0x0000000000193645
                .xword  0x43ae671200000000
                .xword  0x0000034493470000
                .xword  0x0000000000193645
                .xword  0x43ae671200000000
                .xword  0x0000034493470000
                .xword  0x0000000000193645
                .xword  0x43ae671200000000
                .xword  0x0000034493470000
                .xword  0x0000000000193645
                .xword  0x43ae671200000000
                .xword  0x0000034493470000
                .xword  0x0000000000193645
                .xword  0x43ae671200000000
                .xword  0x0000034493470000
                .xword  0x0000000000193645
                .xword  0x43ae671200000000
                .xword  0x0000034493470000
                .xword  0x0000000000193645
                .xword  0x43ae671200000000
                .xword  0x0000034493470000
                .xword  0x0000000000193645
                .xword  0x43ae671200000000
                .xword  0x0000034493470000
                .xword  0x0000000000193645
                .xword  0x43ae671200000000
                .xword  0x0000034493470000
                .xword  0x0000000000193645
                .xword  0x43ae671200000000
                .xword  0x0000034493470000
                .xword  0x0000000000193645
                .xword  0x43ae671200000000
                .xword  0x0000034493470000
                .xword  0x0000000000193645
                .xword  0x43ae671200000000
                .xword  0x0000034493470000
                .xword  0x0000000000193645
                .xword  0x43ae671200000000
                .xword  0x0000034493470000
                .xword  0x0000000000193645
                .xword  0x43ae671200000000
                .xword  0x0000034493470000
                .xword  0x0000000000193645
                .xword  0x43ae671200000000
                .xword  0x0000034493470000
                .xword  0x0000000000193645
                .xword  0x43ae671200000000
                .xword  0x0000034493470000
                .xword  0x0000000000193645
                .xword  0x43ae671200000000
                .xword  0x0000034493470000


stint_1:        .word   0x52163287
                .word   0x76124356
                .word   0x52435160
                .word   0x05124540

stint_asi1:     .word   0x54124752
                .word   0x73214532
                .word   0x56148727
                .word   0x51246370

stint_asi2:     .word   0x87346312
                .word   0x65124765
                .word   0x51247600
                .word   0x09348680



ldfsr_sdata:    .word   0x00000800
                .word   0x00000400
                .word   0x00000000
                .word   0x00000c00


ldfsr_ddata:    .xword  0x0000000000000800
                .xword  0x0000000000000400
                .xword  0x0000000000000000
                .xword  0x0000000000000c00


fps_data:       .word   0x00200000
                .word   0x00400000
                .word   0x00600000
                .word   0x00a00000


fps_nmdata:     .word   0x70200000
                .word   0x70400000
                .word   0x70b00000
                .word   0x70b00000


fpd_data:       .xword  0x0002000000000000
                .xword  0x0004000000000000
                .xword  0x0006000000000000
                .xword  0x0008000000000000


fpd_nmdata:     .xword  0x7002000000000000
                .xword  0x7004000000000000
                .xword  0x700b000000000000
                .xword  0x700b000000000000


fpquad_data:    .xword  0x0000200000000000
                .xword  0x0000000000000000
                .xword  0x0000400000000000
                .xword  0x0000000000000000
                .xword  0x0000600000000000
                .xword  0x0000000000000000
                .xword  0x0000800000000000
                .xword  0x0000000000000000


fpquad_nmdata:  .xword  0x7000200000000000
                .xword  0x0000000000000000
                .xword  0x7000400000000000
                .xword  0x0000000000000000
                .xword  0x7000b00000000000
                .xword  0x0000000000000000
                .xword  0x7000b00000000000
                .xword  0x0000000000000000


fps_cvt_data1:	.word	0x00200000
		.word	0x00400000
		.word	0x00600000
		.word	0x00a00000


fps_cvt_nmd1:	.word	0x40400000	/* 3 */
		.word	0x40c00000	/* 6 */
		.word	0x41100000	/* 9 */
		.word	0x42100000	/* 36 */ 

dtte_64kb_data:  .word   0x11223344
                .word   0x11223355
                .word   0x11223366
                .word   0x11223377
.end


