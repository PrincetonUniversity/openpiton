// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: v9_mul_ldst.s
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
	
#define ENABLE_T0_Fp_disabled_0x20

#include "boot.s"

.text
.global main
.global sum3

main:
	wr %g0, 4, %fprs
/*
 *****************************************************
 *
 *  This diag will test all the V.9 SPARC instructions
 *
 *****************************************************
 */
/*
 ********************************
 *  Multiply and Divide 
 ********************************
 */
!!-----------------------
!!	mulx
!!-----------------------
	set	0x0,	%l0

	set	0x3,	%l3
	set	0x9,	%l4
	set	0x1b,	%l5
mulx_start:
	mulx	%l3,	%l4,	%l6
mulx_end:
	sub	%l6,	%l5,	%l7
	brnz,a	%l7,	diag_fail
	set	0xeeee0001,	%l1

	mulx	%l3,	0x9,	%l6
	sub	%l6,	%l5,	%l7
branch_nt_annul_start:	
	brnz,a	%l7,	diag_fail
	set	0xeeee0001,	%l1
branch_nt_annul_end:

	sub	%l0,	3,	%l3
	sub	%l0,	9,	%l4
	mulx	%l3,	%l4,	%l6
	sub	%l6,	%l5,	%l7
branch_nt_no_annul_start:
	! remove annull bit since it does not affect diag correctness
	! and it gives me an extra performance case to test - JSG
	brnz	%l7,	diag_fail
branch_nt_no_annul_end:
	set	0xeeee0001,	%l1

	mulx	%l3,	-9,	%l6
branch_nt_annul_icache_start:
	sub	%l6,	%l5,	%l7
	brnz,a	%l7,	diag_fail
	set	0xeeee0001,	%l1
branch_nt_annul_icache_end:

	sub	%l0,	3,	%l3
	sub	%l0,	27,	%l6
	set	0x9,	%l4

	mulx	%l3,	%l4,	%l7
	sub	%l6,	%l7,	%l2
	brnz,a	%l2,	diag_fail	
	set	0xeeee0001,	%l1

	mulx	%l3,	0x9,	%l7
	sub	%l6,	%l7,	%l2
	brnz,a	%l2,	diag_fail	
	set	0xeeee0001,	%l1

!!------------------------------------
!!	sdivx	( signed divide )
!!------------------------------------
	set	0x0,	%l0
	set	0x3,	%l3
	set	0x9,	%l4
	set	0x1b,	%l5
	
	sdivx	%l5,	%l3,	%l6
	sub	%l6,	%l4,	%l7
	brnz,a	%l7,	diag_fail
	set	0xeeee0002,	%l1

	sdivx	%l5,	0x3,	%l6
	sub	%l6,	%l4,	%l7
	brnz,a	%l7,	diag_fail
	set	0xeeee0002,	%l1

	sub	%l0,	3,	%l3	/* l3 = -3 */
	sdivx	%l5,	%l3,	%l6
	add	%l6,	%l4,	%l7
	brnz,a	%l7,	diag_fail
	set	0xeeee0002,	%l1

	sub	%l0,	3,	%l3	/* l3 = -3 */
	sub	%l0,	27,	%l5	/* l5 = -27 */

	sdivx	%l5,	%l3,	%l6
	sub	%l6,	%l4,	%l7
	brnz,a	%l7,	diag_fail
	set	0xeeee0002,	%l1
	
	sdivx	%l5,	-3,	%l6
	sub	%l6,	%l4,	%l7
	brnz,a	%l7,	diag_fail
	set	0xeeee0002,	%l1

!!------------------------------------
!!	udivx	( divide )
!!------------------------------------
	set	0x0,	%l0
	set	0x3,	%l3
	set	0x9,	%l4
	set	0x1b,	%l5
	
	udivx	%l5,	%l3,	%l6
	sub	%l6,	%l4,	%l7
	brnz,a	%l7,	diag_fail
	set	0xeeee0002,	%l1

	udivx	%l5,	0x3,	%l6
	sub	%l6,	%l4,	%l7
	brnz,a	%l7,	diag_fail
	set	0xeeee0002,	%l1

	sub	%l0,	3,	%l3	/* l3 = 0xfffffffffffffffd */
	udivx	%l5,	%l3,	%l6	/* l6 = l5/l3 = 0 round */
	brnz,a	%l6,	diag_fail
	set	0xeeee0002,	%l1

	sub	%l0,	3,	%l3	/* l3 = 0xfffffffffffffffd */
	sub	%l0,	27,	%l5	/* l5 = 0xffffffffffffffe5 */

	udivx	%l5,	%l3,	%l6	/* l6 = l5/l3 = 0 rounded */
	brnz,a	%l6,	diag_fail
	set	0xeeee0002,	%l1
	
	udivx	%l5,	-3,	%l6
	brnz,a	%l6,	diag_fail
	set	0xeeee0002,	%l1

!!-----------------------
!!	umul
!!-----------------------
	set	0x0,	%l0

	set	0x3,	%l3
	set	0x9,	%l4
	set	0x1b,	%l5

	umul	%l3,	%l4,	%l6
	sub	%l6,	%l5,	%l7
	brnz,a	%l7,	diag_fail
	set	0xeeee0003,	%l1

	umul	%l3,	0x9,	%l6
	sub	%l6,	%l5,	%l7
	brnz,a	%l7,	diag_fail
	set	0xeeee0003,	%l1

!!-----------------------
!!	smul
!!-----------------------
	set	0x0,	%l0

	set	0x3,	%l3
	set	0x9,	%l4
	set	0x1b,	%l5

	smul	%l3,	%l4,	%l6
	sub	%l6,	%l5,	%l7
	brnz,a	%l7,	diag_fail
	set	0xeeee0004,	%l1

	smul	%l3,	0x9,	%l6
	sub	%l6,	%l5,	%l7
	brnz,a	%l7,	diag_fail
	set	0xeeee0004,	%l1

	sub	%l0,	3,	%l3
	sub	%l0,	9,	%l4
	smul	%l3,	%l4,	%l6
	sub	%l6,	%l5,	%l7
	brnz,a	%l7,	diag_fail
	set	0xeeee0004,	%l1

	smul	%l3,	-9,	%l6
	sub	%l6,	%l5,	%l7
	brnz,a	%l7,	diag_fail
	set	0xeeee0004,	%l1

	sub	%l0,	3,	%l3
	sub	%l0,	27,	%l6
	set	0x9,	%l4

	smul	%l3,	%l4,	%l7
	sub	%l6,	%l7,	%l2
	brnz,a	%l2,	diag_fail	
	set	0xeeee0004,	%l1

	smul	%l3,	0x9,	%l7
	sub	%l6,	%l7,	%l2
	brnz,a	%l2,	diag_fail	
	set	0xeeee0004,	%l1

!!-----------------------
!!	umulcc
!!-----------------------
	set	0x0,	%l0

	set	0x3,	%l3
	set	0x9,	%l4
	set	0x1b,	%l5

	umulcc	%l3,	%l4,	%l6
	sub	%l6,	%l5,	%l7
	brnz,a	%l7,	diag_fail
	set	0xeeee0005,	%l1

	umulcc	%l3,	0x9,	%l6
	sub	%l6,	%l5,	%l7
	brnz,a	%l7,	diag_fail
	set	0xeeee0005,	%l1

	umulcc	%l3,	%l0,	%l2	/* Z set */
	bne,a	%icc,	diag_fail
	set	0xeeee0005,	%l1

	bne,a	%xcc,	diag_fail
	set	0xeeee0005,	%l1

	set	0x40000000,	%l3
	set	0x2,	%l4
	umulcc	%l3,	%l4,	%l2	/* icc.N set */
	bpos,a	%icc,	diag_fail
	set	0xeeee0005,	%l1
	
	set	0x0,	%l0	
	set	0xffffffff, 	%l3
	set	0xffffffff, 	%l4
	umulcc	%l3,	%l4,	%l2	/* XCC.N set */
	bpos,a	%xcc,	diag_fail
	set	0xeeee0005,	%l1
		
!!-----------------------
!!	smulcc
!!-----------------------
	set	0x0,	%l0

	set	0x3,	%l3
	set	0x9,	%l4
	set	0x1b,	%l5

	smulcc	%l3,	%l4,	%l6
	sub	%l6,	%l5,	%l7
	brnz,a	%l7,	diag_fail
	set	0xeeee0006,	%l1

	smulcc	%l3,	0x9,	%l6
	sub	%l6,	%l5,	%l7
	brnz,a	%l7,	diag_fail
	set	0xeeee0006,	%l1

	sub	%l0,	3,	%l3
	sub	%l0,	9,	%l4
	smulcc	%l3,	%l4,	%l6
	sub	%l6,	%l5,	%l7
	brnz,a	%l7,	diag_fail
	set	0xeeee0006,	%l1

	smulcc	%l3,	-9,	%l6
	sub	%l6,	%l5,	%l7
	brnz,a	%l7,	diag_fail
	set	0xeeee0006,	%l1

	sub	%l0,	3,	%l3
	sub	%l0,	27,	%l6
	set	0x9,	%l4

	smulcc	%l3,	%l4,	%l7
	sub	%l6,	%l7,	%l2
	brnz,a	%l2,	diag_fail	
	set	0xeeee0006,	%l1

	smulcc	%l3,	0x9,	%l7
	sub	%l6,	%l7,	%l2
	brnz,a	%l2,	diag_fail	
	set	0xeeee0006,	%l1

	set	0x0,	%l0
	smulcc	%l3,	%l0,	%l2	/* Z set */
	bne,a	%icc,	diag_fail
	set	0xeeee0005,	%l1

	bne,a	%xcc,	diag_fail
	set	0xeeee0005,	%l1

	set	0x40000000,	%l3
	set	0x2,	%l4
	smulcc	%l3,	%l4,	%l2	/* icc.N set */
	bpos,a	%icc,	diag_fail
	set	0xeeee0005,	%l1
		
	set	0x0,	%l0	
	set	0xffffffff,	%l3
	set	0x7fffffff,	%l4
	smulcc	%l3,	%l4,	%l2	/* XCC.N set */
	bpos,a	%xcc,	diag_fail
	set	0xeeee0005,	%l1

	/* smul signed value */
	set	0x0,	%l0
	set	0x4,	%l3
	set	0x2,	%l4

	sub	%l0,	%l3,	%l5
	smulcc	%l3,	%l5,	%l6	/* icc.N set */
	bpos,a	%icc,	diag_fail
	set	0xeeee0005,	%l1
		
	bpos,a	%xcc,	diag_fail
	set	0xeeee0005,	%l1
	
/*
 ********************************
 *  Multiply Step
 ********************************
 */
!!-----------------------
!!      mulscc
!!-----------------------
        set     0x0,    %l0

        set     0x0,    %l3
        set     0x9,    %l4
        set     0x1b,   %l5

	wr	%l0,	0x0,	%ccr
	nop

        /* y[0] = 1 , l3 = 0 */
        wr      %l0,    0x3,    %y
        nop

        mulscc  %l3,    %l4,    %l6
        nop
        rd      %y,     %l0     /* y should be 1 : right shift 1 bit */
        sub     %l0,    0x1,    %l1
        brnz,a  %l1,    diag_fail
        set     0xdddd0001,     %l1

        sub     %l6,    %l4,    %l7     /* l6 = l4 + right_shft1bit of %l3 */
        brnz,a  %l7,    diag_fail
        set     0xdddd0001,     %l1

        /* y[0] = 1 , l3 = 0 , mulscc regs, imm */
        set     0x0,    %l3
        set     0x0,    %l0

        wr      %l0,    0x3,    %y
        nop

        mulscc  %l3,    0x9,    %l6
        nop

        rd      %y,     %l0     /* y should be 1 : right shift 1 bit */
        sub     %l0,    0x1,    %l1
        brnz,a  %l1,    diag_fail
        set     0xdddd0001,     %l1

        sub     %l6,    %l4,    %l7     /* l6 = l4 + right_shft1bit of %l3 */
        brnz,a  %l7,    diag_fail
        set     0xdddd0001,     %l1

        /* y[0] = 0 , l3 = 0x000055af icc.n & icc.v are both 0 */
        set     0x0,    %l0
        set     0x000055af,     %l3
        wr      %l0,    0x2,    %y
        nop

        mulscc  %l3,    %l4,    %l6
        nop

        rd      %y,     %l0     /* y[0]=0 y[31] = REGrs[0] = 1 */
        set     0x80000001,     %l1
        sub     %l0,    %l1,    %l2

        brnz,a  %l2,    diag_fail
        set     0xdddd0001,     %l1

        set     0x2ad7, %l4     /*      55af >> 1 bit = 2ad7 */
        sub     %l6,    %l4,    %l7     /* l6 = 0 + right_shft1bit of %l3 */
        brnz,a  %l7,    diag_fail
        set     0xdddd0001,     %l1

        /* y[0] = 1 , l3 = 0x000055af (icc.n XOR icc.v) = 1 */
        set     0x9,    %l4
        set     0x0,    %l0
        set     0x000055af,     %l3

        wr      %l0,    0x8,    %ccr    /* icc.N set */
        nop

        wr      %l0,    0x3,    %y
        nop

        mulscc  %l3,    %l4,    %l6     /* l4 = 9 */
        nop

        rd      %y,     %l0     /* y[0]=1 y[31] = REGrs[0] = 1 */
        set     0x80000001,     %l1
        sub     %l0,    %l1,    %l2

        brnz,a  %l2,    diag_fail
        set     0xdddd0001,     %l1

        set     0x80002ae0,     %l7     /*      55af >> 1 bit = 2ad7 + 0x9 = 2ae0 */
                                        /*   REGrd [31] = 1 */
        sub     %l6,    %l7,    %l7     /* l6 = 0 + right_shft1bit of %l3 */
        brnz,a  %l7,    diag_fail
        set     0xdddd0001,     %l1

        /* y[0] = 1 , l3 = 0x000055af (icc.n XOR icc.v) = 1 */
        set     0x0,    %l0
        set     0x000055af,     %l3

        wr      %l0,    0x8,    %ccr    /* icc.N set */
        nop

        wr      %l0,    0x3,    %y
        nop

        mulscc  %l3,    0x9,    %l6     /* imm = 9 */
        nop

        rd      %y,     %l0     /* y[0]=1 y[31] = REGrs[0] = 1 */
        set     0x80000001,     %l1
        sub     %l0,    %l1,    %l2

        brnz,a  %l2,    diag_fail
        set     0xdddd0001,     %l1

        set     0x80002ae0,     %l7     /*      55af >> 1 bit = 2ad7 + 0x9 = 2ae0 */
                                        /*   REGrd [31] = 1 */
        sub     %l6,    %l7,    %l7     /* l6 = 0 + right_shft1bit of %l3 */
        brnz,a  %l7,    diag_fail
        set     0xdddd0001,     %l1

	
#if 0
/*
 ********************************
 *      Population count (not supported)
 ********************************
 */
!!-----------------------------
!!	popc
!!-----------------------------
	set	0xffaaffaa,	%l0
	popc	%l0,	%l2
	set	0x18,	%l3

	sub	%l3,	%l2,	%l4
	brnz,a	%l4,	diag_fail
	set	0xffffaaaa,	%l1
	
	set	0x0,	%l0
	popc	%l0,	%l2
	set	0x0,	%l3
	sub	%l3,	%l2,	%l4
	brnz,a	%l4,	diag_fail
	set	0xffffaaaa,	%l1
	
	popc	0x0,	%l2
	set	0x0,	%l3
	sub	%l3,	%l2,	%l4
	brnz,a	%l4,	diag_fail
	set	0xffffaaaa,	%l1

	popc	0x1fff,	%l2	/* imm13 extended to 0xffffffffffffffff */
	set	0x40,	%l3
	sub	%l3,	%l2,	%l4
	brnz,a	%l4,	diag_fail
	set	0xffffaaaa,	%l1
#endif
		
/*
 ********************************
 *      Read State registers
 ********************************
 */
!!---------------------
!!	wr and rd %y
!!---------------------
	set	0xffaaffa5,	%l0
	wr	%l0,	0x0,	%y
	nop

	rd	%y,	%l1	
	nop

	sub	%l1,	%l0,	%l2
	brnz,a	%l2,	diag_fail
	set	0xffffdd01,	%l1

!!---------------------
!!	wr and rd %ccr
!!---------------------
	set	0xfa,	%l0
	wr	%l0,	0x0,	%ccr
	nop

	rd	%ccr,	%l1	
	nop

	sub	%l1,	%l0,	%l2
	brnz,a	%l2,	diag_fail
	set	0xffffdd02,	%l1

!!---------------------
!!	wr and rd %asi
!!---------------------
	set	0x80,	%l0
	wr	%l0,	0x0,	%asi
	nop

	rd	%asi,	%l1	
	nop

	sub	%l1,	%l0,	%l2
	brnz,a	%l2,	diag_fail
	set	0xffffdd02,	%l1

!!---------------------
!!	wr and rd %fprs
!!---------------------
	set	0x7,	%l0
	wr	%l0,	0x0,	%fprs
	nop

	rd	%fprs,	%l1	
	nop

	sub	%l1,	%l0,	%l2
	brnz,a	%l2,	diag_fail
	set	0xffffdd02,	%l1

!!-----------------------------------------------------------
!!  Read ASR ( ancillary state register ) TBD
!!-----------------------------------------------------------

/*
 *********************************
 *	SETHI
 *********************************
 */
	sethi	0x3faacc,	%l1
	set	0x3faacc,	%l2
	sll	%l2,	10,	%l4
	sub	%l1,	%l4,	%l3
	brnz,a	%l3,	diag_fail
	set	0xffffdd00,	%l1

	sethi	%hi(0xabcd1234), %l1
	or	%l1,	0x234,	%l1
	set	0xabcd1234,	%l2
	sub	%l1,	%l2,	%l3
	brnz,a	%l3,	diag_fail
	set	0xffffdd00,	%l1

	set	0x1,	%l0
	sethi	0x0,	%l0	/* like a nop */

/*
 *********************************
 *	SHIFT 
 *********************************
 */
!!----------------------
!!	shift left 32b
!!----------------------
	set	0xffffffff,	%l0
	sll	%l0,	31,	%l1
	set	0x0,	%l0
	setx	0x7fffffff80000000, %l0, %l2
	sub	%l2,	%l1,	%l3
	brnz,a	%l3,	diag_fail
	set	0xfffeee01,	%l1	

	set	0x1,	%l0
	set	4,	%l1
	sll	%l0,	%l1,	%l2
	set	0x10,	%l3
	sub	%l3,	%l2,	%l4
	brnz,a	%l4,	diag_fail
	set	0xfffeee01,	%l1

!!----------------------
!!	shift left 64b
!!----------------------
	set	0xffffffff,	%l0
	sllx	%l0,	32,	%l1
	set	0x0,	%l0
	setx	0xffffffff00000000, %l0, %l2	
	sub	%l1,	%l2,	%l3
	brnz,a	%l3,	diag_fail
	set	0xfffeee01,	%l1	

	set	0xffffffff,	%l0
	sllx	%l0,	63,	%l1
	set	0x0,	%l0
	setx	0x8000000000000000, %l0, %l2	
	sub	%l1,	%l2,	%l3
	brnz,a	%l3,	diag_fail
	set	0xfffeee01,	%l1	

	set	0x1,	%l0
	set	4,	%l1
	sllx	%l0,	%l1,	%l2
	set	0x10,	%l3
	sub	%l3,	%l2,	%l4
	brnz,a	%l4,	diag_fail
	set	0xfffeee01,	%l1

!!----------------------
!!	shift right 32b
!!----------------------
	set	0x80000000,	%l0
	srl	%l0,	31,	%l1
	srl	%l1,	1,	%l2
	brnz,a	%l2,	diag_fail
	set	0xfffeee02,	%l1	

	set	0x800,	%l0
	set	4,	%l1
	srl	%l0,	%l1,	%l2
	set	0x80,	%l3
	sub	%l3,	%l2,	%l4
	brnz,a	%l4,	diag_fail
	set	0xfffeee02,	%l1

!!----------------------
!!	shift right 64b
!!----------------------
	set	0x0,	%l0
	setx	0x8000000000000000, %l0, %l1
	srlx	%l1,	63,	%l2
	srlx	%l2,	1,	%l3
	brnz,a	%l3,	diag_fail
	set	0xfffeee03,	%l1	

	set	0x0,	%l0
	setx	0x8000000000000000, %l0, %l1
	set	16,	%l2
	srlx	%l1,	%l2,	%l3
	srlx	%l3,	%l2,	%l4

	set	0x80000000,	%l5
	sub	%l5,	%l4,	%l6
	brnz,a	%l6,	diag_fail
	set	0xfffeee03,	%l1

!!----------------------
!!	shift right 32b
!!	  arithmetic
!!----------------------
	set	0x80000000,	%l0
	sra	%l0,	31,	%l1
	sra	%l1,	1,	%l2

	set	0x0,	%l3
	setx	0xffffffffffffffff, %l3, %l4	
	sub	%l2,	%l4,	%l5
	brnz,a	%l5,	diag_fail
	set	0xfffeee02,	%l1	

	set	0x800,	%l0
	set	4,	%l1
	sra	%l0,	%l1,	%l2
	set	0x80,	%l3
	sub	%l3,	%l2,	%l4
	brnz,a	%l4,	diag_fail
	set	0xfffeee02,	%l1

!!----------------------
!!	shift right 64b
!!----------------------
	set	0x0,	%l0
	setx	0x8000000000000000, %l0, %l1
	srax	%l1,	63,	%l2
	srax	%l2,	1,	%l3
	
	set	0x0,	%l0
	setx	0xffffffffffffffff, %l0, %l4	
	sub	%l4,	%l3,	%l5
	brnz,a	%l5,	diag_fail
	set	0xfffeee03,	%l1	

	set	0x0,	%l0
	setx	0x8000000000000000, %l0, %l1
	set	16,	%l2
	srax	%l1,	%l2,	%l3
	srax	%l3,	%l2,	%l4

	set	0x0,	%l0
	setx	0xffffffff80000000, %l0, %l5
	sub	%l5,	%l4,	%l6
	brnz,a	%l6,	diag_fail
	set	0xfffeee03,	%l1

/*
 *****************************************
 *	floating point add/subtract
 *****************************************
 */
!!-------------------
!!	fadds
!!-------------------
	set	0x0,	%l0
	setx	fps_data, %l0,	%l1	
	ld	[%l1+%l0],	%f0	/* load 1st fp single */

	set	0x0,	%l0
	add	%l0,	0x4,	%l0
	ld	[%l1+%l0],	%f1	/* load 2nd fp single */

	add	%l0,	0x4,	%l0
	ld	[%l1+%l0],	%f2	/* load 3rd fp single */

	fadds	%f0,	%f1,	%f3

	fcmps	%fcc0,	%f3,	%f2	/* f2 should = f3 */
	
	fbe	Test_fsubs
	nop

	ba	diag_fail
	set	0xffff0001,	%l1

!!-------------------
!!	fsubs
!!-------------------
Test_fsubs:
	/* f2 - f1 = f0 */		
	fsubs	%f2,	%f1,	%f3

	fcmps	%fcc0,	%f0,	%f3

	fbne	diag_fail
	set	0xffff0002,	%l1

!!-------------------
!!	faddd
!!-------------------
	set	0x0,	%l0
	setx	fpd_data,	%l0,	%l1

	ldd	[%l1+%l0],	%f0	
	add	%l0,	0x8,	%l0

	ldd	[%l1+%l0],	%f2	
	add	%l0,	0x8,	%l0
	
	ldd	[%l1+%l0],	%f4	
	add	%l0,	0x8,	%l0

	faddd	%f0,	%f2,	%f6	

	fcmpd	%fcc0,	%f6,	%f4

	fbne	diag_fail
	set	0xffff0003,	%l1

!!-------------------
!!	fsubd
!!-------------------
Test_fsubd:
	/* f4 - f2 = f0 */		
	fsubd	%f4,	%f2,	%f6

	fcmpd	%fcc0,	%f6,	%f0

	fbne	diag_fail
	set	0xffff0004,	%l1

/*
 ***************************
 * Load FSR from Memory 
 ***************************
 */
!!------------------------
!! LDFSR 
!!------------------------
	set	0x0,	%l0
	setx	ldfsr_sdata,	%l0,	%l2

	ld	[%l2+%l0],	%fsr	/* %fcc0 = 10 fs1 > fs2 */
	add	%l0,	0x4,	%l0

	fble	%fcc0,	diag_fail
	set	0xffff0005,	%l1

	ld	[%l2+%l0],	%fsr	/* %fcc0 = 01 fs1 < fs2 */
	add	%l0,	0x4,	%l0

	fbge	%fcc0,	diag_fail
	set	0xffff0005,	%l1

	ld	[%l2+%l0],	%fsr	/* %fcc0 = 00 fs1 = fs2 */
	add	%l0,	0x4,	%l0

	fbne	%fcc0,	diag_fail
	set	0xffff0005,	%l1

!!------------------------
!! LDXFSR 
!!------------------------
	set	0x0,	%l0
	setx	ldfsr_ddata,	%l0,	%l2

	ldx	[%l2+%l0],	%fsr	/* %fcc0 = 10 fs1 > fs2 */
	add	%l0,	0x8,	%l0

	fble	%fcc0,	diag_fail
	set	0xffff0006,	%l1

	ldx	[%l2+%l0],	%fsr	/* %fcc0 = 01 fs1 < fs2 */
	add	%l0,	0x8,	%l0

	fbge	%fcc0,	diag_fail
	set	0xffff0006,	%l1

	ldx	[%l2+%l0],	%fsr	/* %fcc0 = 00 fs1 = fs2 */
	add	%l0,	0x8,	%l0

	fbne	%fcc0,	diag_fail
	set	0xffff0006,	%l1

#if 0
/*
 *	NOT supported by SIMICS 
 */

!!-------------------
!!	faddq
!!-------------------
	set	0x0,	%l0
	setx	fpquad_data,	%l0,	%l1

	ldq	[%l1+%l0],	%f0
	add	%l0,	0x10,	%l0

	ldq	[%l1+%l0],	%f4
	add	%l0,	0x10,	%l0

	ldq	[%l1+%l0],	%f8
	add	%l0,	0x10,	%l0

	faddq	%f0,	%f4,	%f12

	fcmpq	%fcc0,	%f12,	%f8

	fbne	diag_fail
	set	0xffff0005,	%l1

!!-------------------
!!	fsubq
!!-------------------
Test_fsubq:
	/* f8 - f4 = f0 */		
	fsubd	%f8,	%f4,	%f12

	fcmpd	%fcc0,	%f12,	%f0

	fbne	diag_fail
	set	0xffff0006,	%l1
#endif

/*
 *********************************
 *  Store Floating Point
 *********************************
 */
        /* load the fp data from the memory */
        /* load single fp */
        set     0x0,    %l0
        setx    fps_cvt_nmd1,   %l0,    %l1

        ld      [%l1+%l0],      %f0     /* f0 = 2 * (1+1/2) */
        add     %l0,    0x4,    %l0

        ld      [%l1+%l0],      %f2     /* f2 = 4 * (1+1/2) */
        add     %l0,    0x4,    %l0

        ld      [%l1+%l0],      %f4     /* f4 = 8 * (1+1/8) */

        /* load double fp */
        set     0x0,    %l0
        setx    fpd_cvt_nmd1,   %l0,    %l1

        ldd     [%l1+%l0],      %f6     /* f6 = 2 * (1+1/2) */
        add     %l0,    0x8,    %l0

        ldd     [%l1+%l0],      %f8     /* f8 = 4 * (1+1/2) */
        add     %l0,    0x8,    %l0

        ldd     [%l1+%l0],      %f10     /* f10 = 8 * (1+1/8) */
        add     %l0,    0x8,    %l0

        ldd     [%l1+%l0],      %f12     /* f12 = 32 * (1+1/8) = 36 */
        nop

	/* 
	 * store single
	 */
!!--------------------------
!!  st freg, [addr]	
!!--------------------------
	set	0x0,	%l0
	setx	stfsr_sdata,	%l0,	%l2		

	st	%f0,	[%l2+%l0]
	add	%l0,	0x4,	%l0

	st	%f2,	[%l2+%l0]
	add	%l0,	0x4,	%l0

	set	0x0,	%l0	
	ld	[%l2+%l0],	%f14	/* f14 should = f0 */
	add	%l0,	0x4,	%l0
	fcmps	%fcc0,	%f14,	%f0
	fbne,a	diag_fail
	set	0xffeeff01,	%l1

	ld	[%l2+%l0],	%f16	/* f16 should = f2 */
	nop
	fcmps	%fcc0,	%f16,	%f2
	fbne,a	diag_fail
	set	0xffeeff01,	%l1

	/* 
	 * store double
	 */
!!--------------------------
!!  std freg, [addr]	
!!--------------------------
	set	0x0,	%l0
	setx	stfsr_ddata,	%l0,	%l2		

	std	%f8,	[%l2+%l0]
	add	%l0,	0x8,	%l0

	std	%f10,	[%l2+%l0]
	add	%l0,	0x8,	%l0

	set	0x0,	%l0	
	ldd	[%l2+%l0],	%f14	/* f14 should = f8 */
	add	%l0,	0x8,	%l0

	fcmpd	%fcc0,	%f14,	%f8
	fbne,a	diag_fail
	set	0xffeeff81,	%l1

	ldd	[%l2+%l0],	%f16	/* f16 should = f10 */
	nop
	fcmpd	%fcc0,	%f16,	%f10
	fbne,a	diag_fail
	set	0xffeeff81,	%l1

	/* 
	 * store fsr : single
	 */
!!--------------------------
!!  st %fsr, [addr]	
!!--------------------------
        set     0x0,    %l0
        setx    ldfsr_sdata,    %l0,    %l2
        ld      [%l2+%l0],      %fsr    /* %fcc0 = 10 fs1 > fs2 */
        add     %l0,    0x4,    %l0

	set	0x0,	%l0
	setx	stfsr_sdata,	%l0,	%l2
	st	%fsr,	[%l2+%l0]
	nop

	ld	[%l2+%l0],	%fsr
	nop
        fble    %fcc0,  diag_fail
        set     0xffff5000,     %l1

	/* 
	 * store fsr : double
	 */
!!--------------------------
!!  stx %fsr, [addr]	
!!--------------------------
        set     0x0,    %l0
        setx    ldfsr_ddata,    %l0,    %l2
        ldx     [%l2+%l0],      %fsr    /* %fcc0 = 10 fs1 > fs2 */

	set	0x0,	%l0
	setx	stfsr_ddata,	%l0,	%l2
	stx	%fsr,	[%l2+%l0]
	nop

	ldx	[%l2+%l0],	%fsr
	nop
        fble    %fcc0,  diag_fail
        set     0xffff6000,     %l1

	/* 
	 * store single to alternate space
	 */
!!--------------------------
!!  sta freg, [addr] imm
!!--------------------------
	set	0x0,	%l0
	setx	stfsr_sdata,	%l0,	%l2		

	sta	%f0,	[%l2+%l0] 0x80
	add	%l0,	0x4,	%l0

	sta	%f2,	[%l2+%l0] 0x80

	set	0x0,	%l0	
	lda	[%l2+%l0] 0x80,	%f14	/* f14 should = f0 */
	add	%l0,	0x4,	%l0

	fcmps	%fcc0,	%f14,	%f0
	fbne,a	diag_fail
	set	0xffeeff01,	%l1

	lda	[%l2+%l0] 0x80,	%f16	/* f16 should = f2 */
	nop
	fcmps	%fcc0,	%f16,	%f2
	fbne,a	diag_fail
	set	0xffeeff01,	%l1

!!--------------------------
!!  sta freg, [addr] %asi
!!--------------------------
	set	0x0,	%l0
	setx	stfsr_sdata,	%l0,	%l2		

	wr	%l0,	0x80,	%asi
	nop

	sta	%f0,	[%l2+0x0] %asi
	sta	%f2,	[%l2+0x4] %asi

	set	0x0,	%l0	
	lda	[%l2+0x0] %asi,	%f14	/* f14 should = f0 */
	add	%l0,	0x4,	%l0
	fcmps	%fcc0,	%f14,	%f0
	fbne,a	diag_fail
	set	0xffeeff01,	%l1

	lda	[%l2+0x4] %asi,	%f16	/* f16 should = f2 */
	nop
	fcmps	%fcc0,	%f16,	%f2
	fbne,a	diag_fail
	set	0xffeeff01,	%l1

	/* 
	 * store double
	 */
!!--------------------------
!!  stda freg, [addr] imm	
!!--------------------------
	set	0x0,	%l0
	setx	stfsr_ddata,	%l0,	%l2		

	stda	%f8,	[%l2+%l0] 0x80
	add	%l0,	0x8,	%l0

	stda	%f10,	[%l2+%l0] 0x80
	add	%l0,	0x8,	%l0

	set	0x0,	%l0	
	ldda	[%l2+%l0] 0x80,	%f14	/* f14 should = f8 */
	add	%l0,	0x8,	%l0

	fcmpd	%fcc0,	%f14,	%f8
	fbne,a	diag_fail
	set	0xffeeff81,	%l1

	ldda	[%l2+%l0] 0x80,	%f16	/* f16 should = f10 */
	nop
	fcmpd	%fcc0,	%f16,	%f10
	fbne,a	diag_fail
	set	0xffeeff81,	%l1

!!--------------------------
!!  stda freg, [addr] %asi
!!--------------------------
	set	0x0,	%l0
	setx	stfsr_ddata,	%l0,	%l2		

	wr	%l0,	0x80,	%asi
	nop

	stda	%f8,	[%l2+0x0] %asi
	stda	%f10,	[%l2+0x8] %asi

	set	0x0,	%l0	
	ldda	[%l2+0x0] %asi,	%f14	/* f14 should = f8 */
	fcmpd	%fcc0,	%f14,	%f8
	fbne,a	diag_fail
	set	0xffeeff81,	%l1

	ldda	[%l2+0x8] %asi,	%f16	/* f16 should = f10 */
	nop
	fcmpd	%fcc0,	%f16,	%f10
	fbne,a	diag_fail
	set	0xffeeff81,	%l1

!!--------------------------
!!  stqa freg, [reg+imm] %asi
!!  stqa freg, [reg] imm
!!	are not supported !!
!!--------------------------

/*
 *************************************************
 *	Load Floating point from Alternate Space
 *************************************************
 */
!!----------------------------
!!	LDFA
!!----------------------------
        /* load fp value into fp reg */
        set     0x0,    %l0
        setx    fps_cvt_nmd1,   %l0,    %l1
        set     0x0,    %l0

        lda     [%l1+%l0]0x80,  %f0     /* 1st s fp = 0x3 */
        add     %l0,    0x4,    %l0

        lda     [%l1+%l0]0x80,  %f2     /* 2nd s fp = 0x6 */
        add     %l0,    0x4,    %l0

        lda     [%l1+%l0]0x80,  %f4     /* 3rd s fp = 0x9 */
        add     %l0,    0x4,    %l0

	fadds	%f0,	%f2,	%f6

	fcmps	%fcc0,	%f6,	%f4

	fbne	%fcc0,	diag_fail
	set	0xffff0001,	%l1

!!----------------------------
!!	LDFA, %asi
!!----------------------------
        /* load fp value into fp reg */
        set     0x0,    %l0
        setx    fps_cvt_nmd1,   %l0,    %l1
        set     0x0,    %l0

	wr	%l0,	0x80,	%asi
	nop
	
        lda     [%l1+0x0] %asi,  %f0     /* 1st s fp = 0x3 */
	nop

        lda     [%l1+0x4] %asi,  %f2     /* 2nd s fp = 0x6 */
	nop

        lda     [%l1+0x8] %asi,  %f4     /* 3rd s fp = 0x9 */

	fadds	%f0,	%f2,	%f6

	fcmps	%fcc0,	%f6,	%f4

	fbne	%fcc0,	diag_fail
	set	0xffff0002,	%l1

!!----------------------------
!!	LDDFA
!!----------------------------
        /* load fp value into fp reg */
        set     0x0,    %l0
        setx    fpd_cvt_nmd1,   %l0,    %l1
        set     0x0,    %l0

        ldda    [%l1+%l0]0x80,  %f0     /* 1st s fp = 0x3 */
        add     %l0,    0x8,    %l0

        ldda    [%l1+%l0]0x80,  %f2     /* 2nd s fp = 0x6 */
        add     %l0,    0x8,    %l0

        ldda    [%l1+%l0]0x80,  %f4     /* 3rd s fp = 0x9 */
        add     %l0,    0x8,    %l0

	faddd	%f0,	%f2,	%f6

	fcmpd	%fcc0,	%f6,	%f4

	fbne	%fcc0,	diag_fail
	set	0xffff0003,	%l1

!!----------------------------
!!	LDFA, %asi
!!----------------------------
        /* load fp value into fp reg */
        set     0x0,    %l0
        setx    fpd_cvt_nmd1,   %l0,    %l1
        set     0x0,    %l0

	wr	%l0,	0x80,	%asi
	nop
	
        ldda     [%l1+0x0] %asi,  %f0     /* 1st s fp = 0x3 */
	nop

        ldda     [%l1+0x8] %asi,  %f2     /* 2nd s fp = 0x6 */
	nop

        ldda     [%l1+0x10] %asi,  %f4    /* 3rd s fp = 0x9 */

	faddd	%f0,	%f2,	%f6

	fcmpd	%fcc0,	%f6,	%f4

	fbne	%fcc0,	diag_fail
	set	0xffff0004,	%l1

!!-----------------------------------------
!!  ldqa,	ldqa,%asi not supported !
!!-----------------------------------------

/* 
 ***************************************
 *	Load Integer 
 ***************************************
 */
!!--------------------------------
!!	Load signed byte 
!!--------------------------------
	set	0x0,	%l0
	setx	ldint_1, %l0,	%l2
	
	set	0x0,	%l0
	ldsb	[%l2+%l0],	%l3	/* l3 = 0x55 */
	add	%l0,	0x1,	%l0

	ldsb	[%l2+%l0],	%l4	/* l4 = 0xffffffffffffffaa */
	add	%l0,	0x1,	%l0

	ldsb	[%l2+%l0],	%l5	/* l5 = 0x11 */	
	add	%l0,	0x1,	%l0

	ldsb	[%l2+%l0],	%l6	/* l6 = 0xffffffffffffffbb */	
	nop

	sub	%l3,	0x55,	%l0
	brnz	%l0,	diag_fail
	set	0xffff0005,	%l1
	
	sub	%l5,	0x11,	%l0
	brnz	%l0,	diag_fail
	set	0xffff0005,	%l1

	set	0x0,	%l1
	setx	0xffffffffffffffaa, %l1, %l0
	sub	%l4,	%l0,	%l0
	brnz	%l0,	diag_fail
	set	0xffff0005,	%l1
	
	set	0x0,	%l1
	setx	0xffffffffffffffbb, %l1, %l0
	sub	%l6,	%l0,	%l0
	brnz	%l0,	diag_fail
	set	0xffff0005,	%l1
	
!!--------------------------------------
!!	Load signed 16-bit half word
!!		ldsh
!!--------------------------------------
	set	0x0,	%l0
	setx	ldint_1, %l0,	%l2
	
	set	0x4,	%l0
	ldsh	[%l2+%l0],	%l3	/* l3 = 0xffffffffffffaa55 */
	add	%l0,	0x2,	%l0

	ldsh	[%l2+%l0],	%l4	/* l4 = 0x77ff */

	set	0x0,	%l1
	setx	0xffffffffffffaa55, %l1, %l0
	sub	%l3,	%l0,	%l0
	brnz	%l0,	diag_fail
	set	0xffff0006,	%l1
	
	set	0x77ff, 	%l0
	sub	%l4,	%l0,	%l0
	brnz	%l0,	diag_fail
	set	0xffff0006,	%l1
	
!!--------------------------------------
!!	Load signed 32-bit word
!!		ldsw
!!--------------------------------------
	set	0x0,	%l0
	setx	ldint_1, %l0,	%l2

	set	0x8,	%l0
	ldsw	[%l2+%l0],	%l3	/* l3 = 0x77aa55bb */
	add	%l0,	0x4,	%l0

	ldsw	[%l2+%l0],	%l4	/* l4 = 0xffffffffaa55ff44 */
	add	%l0,	0x4,	%l0

	set	0x0,	%l1
	setx	0xffffffffaa55ff44, %l1, %l0
	sub	%l4,	%l0,	%l0
	brnz	%l0,	diag_fail
	set	0xffff0007,	%l1
	
	set	0x77aa55bb, 	%l0
	sub	%l3,	%l0,	%l0
	brnz	%l0,	diag_fail
	set	0xffff0007,	%l1

!!--------------------------------
!!	Load unsigned byte 
!!--------------------------------
	set	0x0,	%l0
	setx	ldint_1, %l0,	%l2
	
	set	0x0,	%l0
	ldub	[%l2+%l0],	%l3	/* l3 = 0x55 */
	add	%l0,	0x1,	%l0

	ldub	[%l2+%l0],	%l4	/* l4 = 0xaa */
	add	%l0,	0x1,	%l0

	ldub	[%l2+%l0],	%l5	/* l5 = 0x11 */	
	add	%l0,	0x1,	%l0

	ldub	[%l2+%l0],	%l6	/* l6 = 0xbb */	
	nop

	sub	%l3,	0x55,	%l0
	brnz	%l0,	diag_fail
	set	0xffff0008,	%l1
	
	sub	%l5,	0x11,	%l0
	brnz	%l0,	diag_fail
	set	0xffff0008,	%l1

	set	0xaa, 	%l0
	sub	%l4,	%l0,	%l0
	brnz	%l0,	diag_fail
	set	0xffff0008,	%l1
	
	set	0xbb,	%l0	
	sub	%l6,	%l0,	%l0
	brnz	%l0,	diag_fail
	set	0xffff0008,	%l1
	
!!--------------------------------------
!!	Load unsigned 16-bit half word
!!		lduh
!!--------------------------------------
	set	0x0,	%l0
	setx	ldint_1, %l0,	%l2
	
	set	0x4,	%l0
	lduh	[%l2+%l0],	%l3	/* l3 = 0xaa55 */
	add	%l0,	0x2,	%l0

	lduh	[%l2+%l0],	%l4	/* l4 = 0x77ff */
	add	%l0,	0x2,	%l0

	set	0xaa55, 	%l0
	sub	%l3,	%l0,	%l0
	brnz	%l0,	diag_fail
	set	0xffff0009,	%l1
	
	set	0x77ff, 	%l0
	sub	%l4,	%l0,	%l0
	brnz	%l0,	diag_fail
	set	0xffff0009,	%l1
	
!!--------------------------------------
!!	Load unsigned 32-bit word
!!		lduw
!!--------------------------------------
	set	0x0,	%l0
	setx	ldint_1, %l0,	%l2

	set	0x8,	%l0
	lduw	[%l2+%l0],	%l3	/* l3 = 0x77aa55bb */
	add	%l0,	0x4,	%l0

	lduw	[%l2+%l0],	%l4	/* l4 = 0xaa55ff44 */
	add	%l0,	0x4,	%l0

	set	0xaa55ff44, 	%l0
	sub	%l4,	%l0,	%l0
	brnz	%l0,	diag_fail
	set	0xffff000a,	%l1
	
	set	0x77aa55bb, 	%l0
	sub	%l3,	%l0,	%l0
	brnz	%l0,	diag_fail
	set	0xffff000a,	%l1

!!----------------------------------
!!	load extended word
!!----------------------------------
	/* 	0x55aa11bbaa5577ff */
	set	0x0,	%l0
	setx	ldint_1, %l0,	%l2

	ldx	[%l2+%l0],	%l3	
	set	0x0,	%l0
	setx	0x55aa11bbaa5577ff, %l0, %l1

	sub	%l3,	%l1,	%l4

	brnz	%l4,	diag_fail
	set	0xffff000b,	%l1

!!----------------------------------------
!!	load double word not supported 
!!----------------------------------------

/* 
 ***************************************
 *	Load Integer from 
 *	Alternate Space
 ***************************************
 */
!!------------------------------------
!!	Load signed byte from AS imm
!!------------------------------------
	set	0x0,	%l0
	setx	ldint_1, %l0,	%l2
	
	set	0x0,	%l0
	ldsba	[%l2+%l0] 0x80,	%l3	/* l3 = 0x55 */
	add	%l0,	0x1,	%l0

	ldsba	[%l2+%l0] 0x80,	%l4	/* l4 = 0xffffffffffffffaa */
	add	%l0,	0x1,	%l0

	ldsba	[%l2+%l0] 0x80,	%l5	/* l5 = 0x11 */	
	add	%l0,	0x1,	%l0

	ldsba	[%l2+%l0] 0x80,	%l6	/* l6 = 0xffffffffffffffbb */	
	nop

	sub	%l3,	0x55,	%l0
	brnz	%l0,	diag_fail
	set	0xffff0005,	%l1
	
	sub	%l5,	0x11,	%l0
	brnz	%l0,	diag_fail
	set	0xffff0005,	%l1

	set	0x0,	%l1
	setx	0xffffffffffffffaa, %l1, %l0
	sub	%l4,	%l0,	%l0
	brnz	%l0,	diag_fail
	set	0xffff0005,	%l1
	
	set	0x0,	%l1
	setx	0xffffffffffffffbb, %l1, %l0
	sub	%l6,	%l0,	%l0
	brnz	%l0,	diag_fail
	set	0xffff0005,	%l1
	
!!--------------------------------------
!!	Load signed 16-bit half word
!!		ldsh from AS imm
!!--------------------------------------
	set	0x0,	%l0
	setx	ldint_1, %l0,	%l2
	
	set	0x4,	%l0
	ldsha	[%l2+%l0] 0x80,	%l3	/* l3 = 0xffffffffffffaa55 */
	add	%l0,	0x2,	%l0

	ldsha	[%l2+%l0] 0x80,	%l4	/* l4 = 0x77ff */

	set	0x0,	%l1
	setx	0xffffffffffffaa55, %l1, %l0
	sub	%l3,	%l0,	%l0
	brnz	%l0,	diag_fail
	set	0xffff0006,	%l1
	
	set	0x77ff, 	%l0
	sub	%l4,	%l0,	%l0
	brnz	%l0,	diag_fail
	set	0xffff0006,	%l1
	
!!--------------------------------------
!!	Load signed 32-bit word
!!		ldsw from AS imm
!!--------------------------------------
	set	0x0,	%l0
	setx	ldint_1, %l0,	%l2

	set	0x8,	%l0
	ldswa	[%l2+%l0] 0x80,	%l3	/* l3 = 0x77aa55bb */
	add	%l0,	0x4,	%l0

	ldswa	[%l2+%l0] 0x80,	%l4	/* l4 = 0xffffffffaa55ff44 */
	add	%l0,	0x4,	%l0

	set	0x0,	%l1
	setx	0xffffffffaa55ff44, %l1, %l0
	sub	%l4,	%l0,	%l0
	brnz	%l0,	diag_fail
	set	0xffff0007,	%l1
	
	set	0x77aa55bb, 	%l0
	sub	%l3,	%l0,	%l0
	brnz	%l0,	diag_fail
	set	0xffff0007,	%l1

!!--------------------------------------
!!	Load unsigned byte from AS imm
!!--------------------------------------
	set	0x0,	%l0
	setx	ldint_1, %l0,	%l2
	
	set	0x0,	%l0
	lduba	[%l2+%l0] 0x80,	%l3	/* l3 = 0x55 */
	add	%l0,	0x1,	%l0

	lduba	[%l2+%l0] 0x80,	%l4	/* l4 = 0xaa */
	add	%l0,	0x1,	%l0

	lduba	[%l2+%l0] 0x80,	%l5	/* l5 = 0x11 */	
	add	%l0,	0x1,	%l0

	lduba	[%l2+%l0] 0x80,	%l6	/* l6 = 0xbb */	
	nop

	sub	%l3,	0x55,	%l0
	brnz	%l0,	diag_fail
	set	0xffff0008,	%l1
	
	sub	%l5,	0x11,	%l0
	brnz	%l0,	diag_fail
	set	0xffff0008,	%l1

	set	0xaa, 	%l0
	sub	%l4,	%l0,	%l0
	brnz	%l0,	diag_fail
	set	0xffff0008,	%l1
	
	set	0xbb,	%l0	
	sub	%l6,	%l0,	%l0
	brnz	%l0,	diag_fail
	set	0xffff0008,	%l1
	
!!--------------------------------------
!!	Load unsigned 16-bit half word
!!		lduh from AS imm
!!--------------------------------------
	set	0x0,	%l0
	setx	ldint_1, %l0,	%l2
	
	set	0x4,	%l0
	lduha	[%l2+%l0] 0x80,	%l3	/* l3 = 0xaa55 */
	add	%l0,	0x2,	%l0

	lduha	[%l2+%l0] 0x80,	%l4	/* l4 = 0x77ff */
	add	%l0,	0x2,	%l0

	set	0xaa55, 	%l0
	sub	%l3,	%l0,	%l0
	brnz	%l0,	diag_fail
	set	0xffff0009,	%l1
	
	set	0x77ff, 	%l0
	sub	%l4,	%l0,	%l0
	brnz	%l0,	diag_fail
	set	0xffff0009,	%l1
	
!!--------------------------------------
!!	Load unsigned 32-bit word
!!		lduw	from AS imm
!!--------------------------------------
	set	0x0,	%l0
	setx	ldint_1, %l0,	%l2

	set	0x8,	%l0
	lduwa	[%l2+%l0] 0x80,	%l3	/* l3 = 0x77aa55bb */
	add	%l0,	0x4,	%l0

	lduwa	[%l2+%l0] 0x80,	%l4	/* l4 = 0xaa55ff44 */
	add	%l0,	0x4,	%l0

	set	0xaa55ff44, 	%l0
	sub	%l4,	%l0,	%l0
	brnz	%l0,	diag_fail
	set	0xffff000a,	%l1
	
	set	0x77aa55bb, 	%l0
	sub	%l3,	%l0,	%l0
	brnz	%l0,	diag_fail
	set	0xffff000a,	%l1

!!--------------------------------------
!!	load extended word from AS imm
!!--------------------------------------
	/* 	0x55aa11bbaa5577ff */
	set	0x0,	%l0
	setx	ldint_1, %l0,	%l2

	ldxa	[%l2+%l0] 0x80,	%l3	
	set	0x0,	%l0
	setx	0x55aa11bbaa5577ff, %l0, %l1

	sub	%l3,	%l1,	%l4

	brnz	%l4,	diag_fail
	set	0xffff000b,	%l1

!!----------------------------------------
!!	load double word not supported 
!!----------------------------------------

/*
 ******************************************
 *  Load integer from Alternate Space
 *	 using %asi
 ******************************************
 */

!!------------------------------------
!!	Load signed byte from AS %asi
!!------------------------------------
	set	0x0,	%l0
        wr      %l0,    0x80,   %asi
        nop
	
	setx	ldint_1, %l0,	%l2

	set	0x0,	%l0
	ldsba	[%l2+0x0] %asi,	%l3	/* l3 = 0x55 */

	ldsba	[%l2+0x1] %asi,	%l4	/* l4 = 0xffffffffffffffaa */

	ldsba	[%l2+0x2] %asi,	%l5	/* l5 = 0x11 */	

	ldsba	[%l2+0x3] %asi,	%l6	/* l6 = 0xffffffffffffffbb */	

	sub	%l3,	0x55,	%l0
	brnz	%l0,	diag_fail
	set	0xffff0005,	%l1
	
	sub	%l5,	0x11,	%l0
	brnz	%l0,	diag_fail
	set	0xffff0005,	%l1

	set	0x0,	%l1
	setx	0xffffffffffffffaa, %l1, %l0
	sub	%l4,	%l0,	%l0
	brnz	%l0,	diag_fail
	set	0xffff0005,	%l1
	
	set	0x0,	%l1
	setx	0xffffffffffffffbb, %l1, %l0
	sub	%l6,	%l0,	%l0
	brnz	%l0,	diag_fail
	set	0xffff0005,	%l1
	
!!--------------------------------------
!!	Load signed 16-bit half word
!!		ldsh from AS %asi,
!!--------------------------------------
	set	0x0,	%l0
	setx	ldint_1, %l0,	%l2
	
	ldsha	[%l2+0x4] %asi,	%l3	/* l3 = 0xffffffffffffaa55 */

	ldsha	[%l2+0x6] %asi,	%l4	/* l4 = 0x77ff */

	set	0x0,	%l1
	setx	0xffffffffffffaa55, %l1, %l0
	sub	%l3,	%l0,	%l0
	brnz	%l0,	diag_fail
	set	0xffff0006,	%l1
	
	set	0x77ff, 	%l0
	sub	%l4,	%l0,	%l0
	brnz	%l0,	diag_fail
	set	0xffff0006,	%l1
	
!!--------------------------------------
!!	Load signed 32-bit word
!!		ldsw from AS %asi,
!!--------------------------------------
	set	0x0,	%l0
	setx	ldint_1, %l0,	%l2

	ldswa	[%l2+0x8] %asi,	%l3	/* l3 = 0x77aa55bb */

	ldswa	[%l2+0xc] %asi,	%l4	/* l4 = 0xffffffffaa55ff44 */

	set	0x0,	%l1
	setx	0xffffffffaa55ff44, %l1, %l0
	sub	%l4,	%l0,	%l0
	brnz	%l0,	diag_fail
	set	0xffff0007,	%l1
	
	set	0x77aa55bb, 	%l0
	sub	%l3,	%l0,	%l0
	brnz	%l0,	diag_fail
	set	0xffff0007,	%l1

!!--------------------------------------
!!	Load unsigned byte from AS %asi,
!!--------------------------------------
	set	0x0,	%l0
	setx	ldint_1, %l0,	%l2
	
	lduba	[%l2+0x0] %asi,	%l3	/* l3 = 0x55 */

	lduba	[%l2+0x1] %asi,	%l4	/* l4 = 0xaa */

	lduba	[%l2+0x2] %asi,	%l5	/* l5 = 0x11 */	

	lduba	[%l2+0x3] %asi,	%l6	/* l6 = 0xbb */	

	sub	%l3,	0x55,	%l0
	brnz	%l0,	diag_fail
	set	0xffff0008,	%l1
	
	sub	%l5,	0x11,	%l0
	brnz	%l0,	diag_fail
	set	0xffff0008,	%l1

	set	0xaa, 	%l0
	sub	%l4,	%l0,	%l0
	brnz	%l0,	diag_fail
	set	0xffff0008,	%l1
	
	set	0xbb,	%l0	
	sub	%l6,	%l0,	%l0
	brnz	%l0,	diag_fail
	set	0xffff0008,	%l1
	
!!--------------------------------------
!!	Load unsigned 16-bit half word
!!		lduh from AS %asi,
!!--------------------------------------
	set	0x0,	%l0
	setx	ldint_1, %l0,	%l2
	
	lduha	[%l2+0x4] %asi,	%l3	/* l3 = 0xaa55 */

	lduha	[%l2+0x6] %asi,	%l4	/* l4 = 0x77ff */
	add	%l0,	0x2,	%l0

	set	0xaa55, 	%l0
	sub	%l3,	%l0,	%l0
	brnz	%l0,	diag_fail
	set	0xffff0009,	%l1
	
	set	0x77ff, 	%l0
	sub	%l4,	%l0,	%l0
	brnz	%l0,	diag_fail
	set	0xffff0009,	%l1
	
!!--------------------------------------
!!	Load unsigned 32-bit word
!!		lduw	from AS %asi,
!!--------------------------------------
	set	0x0,	%l0
	setx	ldint_1, %l0,	%l2

	lduwa	[%l2+0x8] %asi,	%l3	/* l3 = 0x77aa55bb */
	lduwa	[%l2+0xc] %asi,	%l4	/* l4 = 0xaa55ff44 */

	set	0xaa55ff44, 	%l0
	sub	%l4,	%l0,	%l0
	brnz	%l0,	diag_fail
	set	0xffff000a,	%l1
	
	set	0x77aa55bb, 	%l0
	sub	%l3,	%l0,	%l0
	brnz	%l0,	diag_fail
	set	0xffff000a,	%l1

!!--------------------------------------
!!	load extended word from AS %asi,
!!--------------------------------------
	/* 	0x55aa11bbaa5577ff */
	set	0x0,	%l0
	setx	ldint_1, %l0,	%l2

	ldxa	[%l2+0x0] %asi,	%l3	
	set	0x0,	%l0
	setx	0x55aa11bbaa5577ff, %l0, %l1

	sub	%l3,	%l1,	%l4

	brnz	%l4,	diag_fail
	set	0xffff000b,	%l1

!!----------------------------------------
!!	load double word  : ldda
!!	from Alternate Space not supported 
!!----------------------------------------

/*
 *************************************************
 *      load store unsigned byte
 *************************************************
 */
!!---------------------
!!  ldstub
!!---------------------
        set     0x0,    %l0
        setx    ldint_1, %l0,   %l1

        ldstub  [%l1+%l0],      %l2     /* l2 should = 0x55 */
        nop

        set     0x55,   %l3
        sub     %l3,    %l2,    %l5
        brnz    %l5,    diag_fail
        set     0xffff0001,     %l3

        ldub    [%l1+%l0],      %l4     /* l4 should = 0xff */
        set     0xff,   %l3
        sub     %l3,    %l4,    %l5

        brnz    %l5,    diag_fail
        set     0xffff0001,     %l1

!!---------------------
!!  ldstuba , imm
!!---------------------
        set     0x0,    %l0
        setx    ldint_1, %l0,   %l1

        set     0x2,    %l0
        ldstuba [%l1+%l0] 0x80, %l2     /* l2 should = 0x11 */
        nop

        set     0x11,   %l3
        sub     %l3,    %l2,    %l5
        brnz    %l5,    diag_fail
        set     0xffff0001,     %l3

        ldub    [%l1+%l0],      %l4     /* l4 should = 0xff */
        set     0xff,   %l3
        sub     %l3,    %l4,    %l5

        brnz    %l5,    diag_fail
        set     0xffff0001,     %l1

!!---------------------
!!  ldstuba , %asi
!!---------------------
        set     0x0,    %l0
        wr      %l0,    0x80,   %asi
        nop

        setx    ldint_1, %l0,   %l1

        ldstuba [%l1+0x3] %asi, %l2     /* l2 should = 0xbb */
        nop

        set     0xbb,   %l3
        sub     %l3,    %l2,    %l5
        brnz    %l5,    diag_fail
        set     0xffff0001,     %l3

        set     0x3,    %l0
        ldub    [%l1+%l0],      %l4     /* l4 should = 0xff */
        set     0xff,   %l3

        sub     %l3,    %l4,    %l5

        brnz    %l5,    diag_fail
        set     0xffff0001,     %l1

/*
 ********************************
 *  Store integer
 ********************************
 */
!!----------------------------
!!	store a byte
!!----------------------------
	set	0x7f,	%l2
	set	0xff,	%l3

	set	0x0,	%l0
	setx	stint_1, %l0,	%l1	
	stb	%l2,	[%l1+%l0]
	add	%l0,	4,	%l0
	stb	%l3,	[%l1+%l0]

	/* ld and compare */
	set	0x0,	%l0
	ldsw	[%l1+%l0],	%l5
	add	%l0,	4,	%l0
	set	0x7f000000,	%l7
	sub	%l7,	%l5,	%l4
	brnz,a 	%l4,	diag_fail
	set	0xfffeee01,	%l2

	ldsw	[%l1+%l0],	%l6
	set	0x0,	%l0
	setx	0xffffffffff000000, %l0, %l7
	sub	%l7,	%l6,	%l4
	brnz,a 	%l4,	diag_fail
	set	0xfffeee01,	%l2

	set	0x4,	%l0
	lduw	[%l1+%l0], 	%l6
	set	0x0,	%l0
	setx	0xff000000, %l0, %l7
	sub	%l7,	%l6,	%l4
	brnz,a 	%l4,	diag_fail
	set	0xfffeee01,	%l2

!!----------------------------
!!	store a half-word
!!----------------------------
	set	0x7fff,	%l2
	set	0xffff,	%l3

	set	0x0,	%l0
	setx	stint_1, %l0,	%l1
	sth	%l2,	[%l1+%l0]
	add	%l0,	4,	%l0
	sth	%l3,	[%l1+%l0]

	/* ld and compare */
	set	0x0,	%l0
	ldsw	[%l1+%l0],	%l5
	add	%l0,	4,	%l0
	set	0x7fff0000,	%l7
	sub	%l7,	%l5,	%l4
	brnz,a 	%l4,	diag_fail
	set	0xfffeee01,	%l2

	ldsw	[%l1+%l0],	%l6
	set	0x0,	%l0
	setx	0xffffffffffff0000, %l0, %l7
	sub	%l7,	%l6,	%l4
	brnz,a 	%l4,	diag_fail
	set	0xfffeee01,	%l2

	set	0x4,	%l0
	lduw	[%l1+%l0], 	%l6
	set	0x0,	%l0
	setx	0xffff0000, %l0, %l7
	sub	%l7,	%l6,	%l4
	brnz,a 	%l4,	diag_fail
	set	0xfffeee01,	%l2

!!----------------------------
!!	store a word
!!----------------------------
	set	0x7fffffff,	%l2
	set	0xf0ffffff,	%l3

	set	0x0,	%l0
	setx	stint_1, %l0,	%l1
	stw	%l2,	[%l1+%l0]
	add	%l0,	4,	%l0
	stw	%l3,	[%l1+%l0]

	/* ld and compare */
	set	0x0,	%l0
	ldsw	[%l1+%l0],	%l5
	add	%l0,	4,	%l0
	set	0x7fffffff,	%l7
	sub	%l7,	%l5,	%l4
	brnz,a 	%l4,	diag_fail
	set	0xfffeee01,	%l2

	ldsw	[%l1+%l0],	%l6
	set	0x0,	%l0
	setx	0xfffffffff0ffffff, %l0, %l7
	sub	%l7,	%l6,	%l4
	brnz,a 	%l4,	diag_fail
	set	0xfffeee01,	%l2

	set	0x4,	%l0
	lduw	[%l1+%l0], 	%l6
	set	0x0,	%l0
	setx	0xf0ffffff, %l0, %l7
	sub	%l7,	%l6,	%l4
	brnz,a 	%l4,	diag_fail
	set	0xfffeee01,	%l2

!!----------------------------
!!	store an extended word
!!----------------------------
	set	0x0,	%l0
	setx	0x7fffffff55aaaa55, %l0, %l2
	setx	0xf0ffffff55aaaa55, %l0, %l3

	set	0x0, 	%l0
	setx	stint_1, %l0,	%l1
	stx	%l2,	[%l1+%l0]
	add	%l0,	8,	%l0
	stx	%l3,	[%l1+%l0]

	/* ld and compare */
	set	0x0,	%l0

	ldx	[%l1+%l0],	%l5
	add	%l0,	8,	%l0
	sub	%l2,	%l5,	%l4
	brnz,a 	%l4,	diag_fail
	set	0xfffeee01,	%l2

	ldx	[%l1+%l0],	%l6
	nop
	sub	%l6,	%l3,	%l4
	brnz,a 	%l4,	diag_fail
	set	0xfffeee01,	%l2
/*
 ****************************************
 *  Store integer into Alternate
 *	space
 ****************************************
 */
!!----------------------------
!!  store a byte into ASI imm
!!----------------------------
	set	0x7f,	%l2
	set	0xff,	%l3

	set	0x0,	%l0
	setx	stint_asi1, %l0, %l1	
	stba	%l2,	[%l1+%l0] 0x80
	add	%l0,	4,	%l0
	stba	%l3,	[%l1+%l0] 0x80

	/* ld and compare */
	set	0x0,	%l0
	ldsw	[%l1+%l0],	%l5
	add	%l0,	4,	%l0
	set	0x7f000000,	%l7
	sub	%l7,	%l5,	%l4
	brnz,a 	%l4,	diag_fail
	set	0xfffeee01,	%l2

	ldsw	[%l1+%l0],	%l6
	set	0x0,	%l0
	setx	0xffffffffff000000, %l0, %l7
	sub	%l7,	%l6,	%l4
	brnz,a 	%l4,	diag_fail
	set	0xfffeee01,	%l2

	set	0x4,	%l0
	lduw	[%l1+%l0], 	%l6
	set	0x0,	%l0
	setx	0xff000000, %l0, %l7
	sub	%l7,	%l6,	%l4
	brnz,a 	%l4,	diag_fail
	set	0xfffeee01,	%l2

!!----------------------------
!!  store a byte into ASI %asi
!!----------------------------
	set	0x7f,	%l2
	set	0xff,	%l3

	set	0x0,	%l0
	wr	%l0,	0x80,	%asi

	setx	stint_asi2, %l0, %l1	
	stba	%l2,	[%l1+0x0] %asi
	stba	%l3,	[%l1+0x4] %asi

	/* ld and compare */
	set	0x0,	%l0
	ldsw	[%l1+%l0],	%l5
	add	%l0,	4,	%l0
	set	0x7f000000,	%l7
	sub	%l7,	%l5,	%l4
	brnz,a 	%l4,	diag_fail
	set	0xfffeee01,	%l2

	ldsw	[%l1+%l0],	%l6
	set	0x0,	%l0
	setx	0xffffffffff000000, %l0, %l7
	sub	%l7,	%l6,	%l4
	brnz,a 	%l4,	diag_fail
	set	0xfffeee01,	%l2

	set	0x4,	%l0
	lduw	[%l1+%l0], 	%l6
	set	0x0,	%l0
	setx	0xff000000, %l0, %l7
	sub	%l7,	%l6,	%l4
	brnz,a 	%l4,	diag_fail
	set	0xfffeee01,	%l2

!!--------------------------------------------
!! store a half-word into ASI (imm)
!!--------------------------------------------
	set	0x7fff,	%l2
	set	0xffff,	%l3

	set	0x0,	%l0
	setx	stint_asi1, %l0,	%l1
	stha	%l2,	[%l1+%l0] 0x80
	add	%l0,	4,	%l0
	stha	%l3,	[%l1+%l0] 0x80

	/* ld and compare */
	set	0x0,	%l0
	ldsw	[%l1+%l0],	%l5
	add	%l0,	4,	%l0
	set	0x7fff0000,	%l7
	sub	%l7,	%l5,	%l4
	brnz,a 	%l4,	diag_fail
	set	0xfffeee01,	%l2

	ldsw	[%l1+%l0],	%l6
	set	0x0,	%l0
	setx	0xffffffffffff0000, %l0, %l7
	sub	%l7,	%l6,	%l4
	brnz,a 	%l4,	diag_fail
	set	0xfffeee01,	%l2

	set	0x4,	%l0
	lduw	[%l1+%l0], 	%l6
	set	0x0,	%l0
	setx	0xffff0000, %l0, %l7
	sub	%l7,	%l6,	%l4
	brnz,a 	%l4,	diag_fail
	set	0xfffeee01,	%l2

!!--------------------------------------------
!! store a half-word into ASI (%asi)
!!--------------------------------------------
	set	0x7fff,	%l2
	set	0xffff,	%l3

	set	0x0,	%l0
	wr	%l0,	0x80,	%asi
	setx	stint_asi2, %l0,	%l1

	stha	%l2,	[%l1+0x0] %asi
	stha	%l3,	[%l1+0x4] %asi

	/* ld and compare */
	set	0x0,	%l0
	ldsw	[%l1+%l0],	%l5
	add	%l0,	4,	%l0
	set	0x7fff0000,	%l7
	sub	%l7,	%l5,	%l4
	brnz,a 	%l4,	diag_fail
	set	0xfffeee01,	%l2

	ldsw	[%l1+%l0],	%l6
	set	0x0,	%l0
	setx	0xffffffffffff0000, %l0, %l7
	sub	%l7,	%l6,	%l4
	brnz,a 	%l4,	diag_fail
	set	0xfffeee01,	%l2

	set	0x4,	%l0
	lduw	[%l1+%l0], 	%l6
	set	0x0,	%l0
	setx	0xffff0000, %l0, %l7
	sub	%l7,	%l6,	%l4
	brnz,a 	%l4,	diag_fail
	set	0xfffeee01,	%l2

!!----------------------------
!! store a word to ASI (imm)
!!----------------------------
	set	0x7fffffff,	%l2
	set	0xf0ffffff,	%l3

	set	0x0,	%l0
	setx	stint_asi1, %l0,	%l1
	stwa	%l2,	[%l1+%l0] 0x80
	add	%l0,	4,	%l0
	stwa	%l3,	[%l1+%l0] 0x80

	/* ld and compare */
	set	0x0,	%l0
	ldsw	[%l1+%l0],	%l5
	add	%l0,	4,	%l0
	set	0x7fffffff,	%l7
	sub	%l7,	%l5,	%l4
	brnz,a 	%l4,	diag_fail
	set	0xfffeee01,	%l2

	ldsw	[%l1+%l0],	%l6
	set	0x0,	%l0
	setx	0xfffffffff0ffffff, %l0, %l7
	sub	%l7,	%l6,	%l4
	brnz,a 	%l4,	diag_fail
	set	0xfffeee01,	%l2

	set	0x4,	%l0
	lduw	[%l1+%l0], 	%l6
	set	0x0,	%l0
	setx	0xf0ffffff, %l0, %l7
	sub	%l7,	%l6,	%l4
	brnz,a 	%l4,	diag_fail
	set	0xfffeee01,	%l2

!!----------------------------
!! store a word to ASI (%asi)
!!----------------------------
	set	0x7fffffff,	%l2
	set	0xf0ffffff,	%l3

	set	0x0,	%l0
	wr	%l0,	0x80,	%asi
	
	setx	stint_asi2, %l0,	%l1
	stwa	%l2,	[%l1+0x0] %asi
	stwa	%l3,	[%l1+0x4] %asi

	/* ld and compare */
	set	0x0,	%l0
	ldsw	[%l1+%l0],	%l5
	add	%l0,	4,	%l0
	set	0x7fffffff,	%l7
	sub	%l7,	%l5,	%l4
	brnz,a 	%l4,	diag_fail
	set	0xfffeee01,	%l2

	ldsw	[%l1+%l0],	%l6
	set	0x0,	%l0
	setx	0xfffffffff0ffffff, %l0, %l7
	sub	%l7,	%l6,	%l4
	brnz,a 	%l4,	diag_fail
	set	0xfffeee01,	%l2

	set	0x4,	%l0
	lduw	[%l1+%l0], 	%l6
	set	0x0,	%l0
	setx	0xf0ffffff, %l0, %l7
	sub	%l7,	%l6,	%l4
	brnz,a 	%l4,	diag_fail
	set	0xfffeee01,	%l2

!!----------------------------
!! store an extended word to 
!!	ASI ( imm )
!!----------------------------
	set	0x0,	%l0
	setx	0x7fffffff55aaaa55, %l0, %l2
	setx	0xf0ffffff55aaaa55, %l0, %l3

	set	0x0, 	%l0
	setx	stint_asi1, %l0,	%l1
	stxa	%l2,	[%l1+%l0] 0x80
	add	%l0,	8,	%l0
	stxa	%l3,	[%l1+%l0] 0x80

	/* ld and compare */
	set	0x0,	%l0

	ldx	[%l1+%l0],	%l5
	add	%l0,	8,	%l0
	sub	%l2,	%l5,	%l4
	brnz,a 	%l4,	diag_fail
	set	0xfffeee01,	%l2

	ldx	[%l1+%l0],	%l6
	nop
	sub	%l6,	%l3,	%l4
	brnz,a 	%l4,	diag_fail
	set	0xfffeee01,	%l2

!!----------------------------
!! store an extended word to 
!!	ASI ( %asi )
!!----------------------------
	set	0x0,	%l0
	setx	0x7fffffff55aaaa55, %l0, %l2
	setx	0xf0ffffff55aaaa55, %l0, %l3

	set	0x0, 	%l0
	wr	%l0,	0x80,	%asi
	setx	stint_asi2, %l0,	%l1
	stxa	%l2,	[%l1+0x0] %asi
	stxa	%l3,	[%l1+0x8] %asi

	/* ld and compare */
	set	0x0,	%l0

	ldx	[%l1+%l0],	%l5
	add	%l0,	8,	%l0
	sub	%l2,	%l5,	%l4
	brnz,a 	%l4,	diag_fail
	set	0xfffeee01,	%l2

	ldx	[%l1+%l0],	%l6
	nop
	sub	%l6,	%l3,	%l4
	brnz,a 	%l4,	diag_fail
	set	0xfffeee01,	%l2

/*
 ********************************
 *  Subtract     
 ********************************
 */
!!--------------------------
!!	subc
!!--------------------------
	set	0x1,	%l1
	set	0x2,	%l2
	set	0x3,	%l3
	set	0x0,	%l0

	wr	%l0,	0x1,	%ccr	/* icc.c set */
	nop

	subc	%l3,	%l2,	%l4
	brnz,a	%l4,	diag_fail
	set	0xffeeeee1,	%l1

	wr	%l0,	0x0,	%ccr	/* icc.c set to zero */
	nop

	set	0x1,	%l1
	subc	%l3,	%l2,	%l4
	sub	%l4,	%l1,	%l5
	brnz,a	%l5,	diag_fail
	set	0xffeeeee1,	%l1

	wr	%l0,	0x10,	%ccr	/* xcc.c set */
	nop

	set	0x1,	%l1
	subc	%l3,	%l2,	%l4	/* l4 should = 1 */ 
	sub	%l4,	%l1,	%l5	
	brnz,a	%l5,	diag_fail
	set	0xffeeeee1,	%l1

!!--------------------------
!!	subc
!!--------------------------
	set	0x1,	%l1
	set	0x2,	%l2
	set	0x3,	%l3
	set	0x0,	%l0

	wr	%l0,	0x1,	%ccr	/* icc.c set */
	nop

	subc	%l3,	0x2,	%l4
	brnz,a	%l4,	diag_fail
	set	0xffeeeee1,	%l1

	wr	%l0,	0x0,	%ccr	/* icc.c set to zero */
	nop

	set	0x1,	%l1
	subc	%l3,	0x2,	%l4
	sub	%l4,	%l1,	%l5
	brnz,a	%l5,	diag_fail
	set	0xffeeeee1,	%l1

	wr	%l0,	0x10,	%ccr	/* xcc.c set */
	nop

	set	0x1,	%l1
	subc	%l3,	0x2,	%l4	/* l4 should = 1 */ 
	sub	%l4,	%l1,	%l5	
	brnz,a	%l5,	diag_fail
	set	0xffeeeee1,	%l1

	wr	%l0,	0x0,	%ccr	/* xcc.c set */
	nop

	/* sub of the 13bit imm */
	set	0x0,	%l0
	subc	%l0,	0x1fff,	%l1	/* 0 - (-1) = 1 */	
	sub	%l1,	0x1,	%l2
	brnz,a	%l2,	diag_fail
	set	0xfffeee01,	%l1

!!----------------------------------
!!	subcc
!!----------------------------------
	set	0x2,	%l2
	set	0x3,	%l3

	/* set Z */
	subcc	%l2,	%l2,	%l4	/* x&icc.Z set */ 
	bne,a	%icc,	diag_fail
	set	0xffeeeee2,	%l1
	
	bne,a	%xcc,	diag_fail
	set	0xffeeeee3,	%l1

	/* Z not set */
	subcc	%l3,	%l2,	%l4	/* x&icc.Z not set */ 
	be,a	%icc,	diag_fail
	set	0xffeeeee2,	%l1
	
	be,a	%xcc,	diag_fail
	set	0xffeeeee3,	%l1

	/* set N */
	subcc	%l2,	%l3,	%l4
	bpos,a	%icc,	diag_fail
	set	0xffeeeee2,	%l1
	
	bpos,a	%xcc,	diag_fail
	set	0xffeeeee3,	%l1

	/* N not set */
	subcc	%l3,	%l2,	%l4
	bneg,a	%icc,	diag_fail
	set	0xffeeeee2,	%l1
	
	bneg,a	%xcc,	diag_fail
	set	0xffeeeee3,	%l1

	/* V not set */
        subcc   %l3,    %l2,    %l4
        bvs,a   %icc,   diag_fail
        set     0xffeeff01,    %l1     /* not executed */

        bvs,a   %xcc,   diag_fail
        set     0xffeeff01,    %l1     /* not executed */

	/* icc.V flag set */
        set     0x80000000,     %l2
        set     0x7fffffff,     %l3

        subcc   %l2,    %l3,    %l4     /* icc.V flag is set */
        bvc,a   %icc,   diag_fail      /*  not taken */
        set     0xffeeff02,    %l1     /* not executed */

	/* xcc.V flag set */
        set     0x0,    %l0
        setx    0x8000000000000000,     %l0,   %l2
        setx    0x7fffffffffffffff,     %l0,   %l3

        subcc   %l2,    %l3,    %l4     /* xcc.V flag is set */
        bvc,a   %xcc,   diag_fail      /*  not taken */
        set     0xffeeff02,    %l1     /* not executed */

!!----------------------------------
!!	subcc ( rs1 - imm = rsd )
!!----------------------------------
	set	0x2,	%l2
	set	0x3,	%l3

	/* set Z */
	subcc	%l2,	0x2,	%l4	/* x&icc.Z set */ 
	bne,a	%icc,	diag_fail
	set	0xffeeeee2,	%l1
	
	bne,a	%xcc,	diag_fail
	set	0xffeeeee3,	%l1

	/* Z not set */
	subcc	%l3,	0x2,	%l4	/* x&icc.Z not set */ 
	be,a	%icc,	diag_fail
	set	0xffeeeee2,	%l1
	
	be,a	%xcc,	diag_fail
	set	0xffeeeee3,	%l1

	/* set N */
	subcc	%l2,	0x3,	%l4
	bpos,a	%icc,	diag_fail
	set	0xffeeeee2,	%l1
	
	bpos,a	%xcc,	diag_fail
	set	0xffeeeee3,	%l1

	/* N not set */
	subcc	%l3,	0x2,	%l4
	bneg,a	%icc,	diag_fail
	set	0xffeeeee2,	%l1
	
	bneg,a	%xcc,	diag_fail
	set	0xffeeeee3,	%l1

	/* V not set */
        subcc   %l3,    0x2,    %l4
        bvs,a   %icc,   diag_fail
        set     0xffeeff01,    %l1     /* not executed */

        bvs,a   %xcc,   diag_fail
        set     0xffeeff01,    %l1     /* not executed */

        /* sub of the 13bit imm */
	set	0x0,	%l0
	wr	%l0,	0x0,	%ccr
        set     0x0,    %l0
        subcc    %l0,    0x1fff, %l1     /* 0 - (-1) = 1 */
        sub     %l1,    0x1,    %l2
        brnz,a  %l2,    diag_fail
        set     0xfffeee01,     %l1

!!----------------------------------
!!	subccc
!!----------------------------------
	set	0x0,	%l0
	set	0x2,	%l2
	set	0x3,	%l3

	wr	%l0,	0x1,	%ccr	/* icc.C set */
	nop

	subccc	%l2,	%l2,	%l4	/* l4 = -1 */
	bpos,a	%icc,	diag_fail
	set	0xffeeeee4,	%l1
	
	/* set Z */
	wr	%l0,	0x0,	%ccr	/* clear %ccr */
	nop

	subccc	%l2,	%l2,	%l4	/* x&icc.Z set */ 
	bne,a	%icc,	diag_fail
	set	0xffeeeee2,	%l1
	
	bne,a	%xcc,	diag_fail
	set	0xffeeeee3,	%l1

	/* Z not set */
	subccc	%l3,	%l2,	%l4	/* x&icc.Z not set */ 
	be,a	%icc,	diag_fail
	set	0xffeeeee2,	%l1
	
	be,a	%xcc,	diag_fail
	set	0xffeeeee3,	%l1

	/* set N */
	subccc	%l2,	%l3,	%l4
	bpos,a	%icc,	diag_fail
	set	0xffeeeee2,	%l1
	
	bpos,a	%xcc,	diag_fail
	set	0xffeeeee3,	%l1

	/* N not set */
	subccc	%l3,	%l2,	%l4
	bneg,a	%icc,	diag_fail
	set	0xffeeeee2,	%l1
	
	bneg,a	%xcc,	diag_fail
	set	0xffeeeee3,	%l1

	/* V not set */
        subccc   %l3,    %l2,    %l4
        bvs,a   %icc,   diag_fail
        set     0xffeeff01,    %l1     /* not executed */

        bvs,a   %xcc,   diag_fail
        set     0xffeeff01,    %l1     /* not executed */

	/* icc.V flag set */
        set     0x80000000,     %l2
        set     0x7fffffff,     %l3

        subccc   %l2,    %l3,    %l4     /* icc.V flag is set */
        set     0x0,    %l0
        bvc,a   %icc,   diag_fail      /*  not taken */
        set     0xffeeff02,    %l1     /* not executed */

	/* xcc.V flag set */
        set     0x0,    %l0
        setx    0x8000000000000000,     %l0,   %l2
        setx    0x7fffffffffffffff,     %l0,   %l3

        subccc   %l2,    %l3,    %l4     /* xcc.V flag is set */
        set     0x0,    %l0
        bvc,a   %xcc,   diag_fail      /*  not taken */
        set     0xffeeff02,    %l1     /* not executed */

!!----------------------------------
!!	subccc ( regs1-imm = rsd )
!!----------------------------------
	set	0x0,	%l0
	set	0x2,	%l2
	set	0x3,	%l3

	wr	%l0,	0x1,	%ccr	/* icc.C set */
	nop

	subccc	%l2,	0x2,	%l4	/* l4 = -1 */
	bpos,a	%icc,	diag_fail
	set	0xffeeeee4,	%l1
	
	/* set Z */
	wr	%l0,	0x0,	%ccr	/* clear %ccr */
	nop

	subccc	%l2,	0x2,	%l4	/* x&icc.Z set */ 
	bne,a	%icc,	diag_fail
	set	0xffeeeee2,	%l1
	
	bne,a	%xcc,	diag_fail
	set	0xffeeeee3,	%l1

	/* Z not set */
	subccc	%l3,	0x2,	%l4	/* x&icc.Z not set */ 
	be,a	%icc,	diag_fail
	set	0xffeeeee2,	%l1
	
	be,a	%xcc,	diag_fail
	set	0xffeeeee3,	%l1

	/* set N */
	subccc	%l2,	0x3,	%l4
	bpos,a	%icc,	diag_fail
	set	0xffeeeee2,	%l1
	
	bpos,a	%xcc,	diag_fail
	set	0xffeeeee3,	%l1

	/* N not set */
	subccc	%l3,	0x2,	%l4
	bneg,a	%icc,	diag_fail
	set	0xffeeeee2,	%l1
	
	bneg,a	%xcc,	diag_fail
	set	0xffeeeee3,	%l1

	/* V not set */
        subccc   %l3,    0x2,    %l4
        bvs,a   %icc,   diag_fail
        set     0xffeeff01,    %l1     /* not executed */

        bvs,a   %xcc,   diag_fail
        set     0xffeeff01,    %l1     /* not executed */

        /* sub of the 13bit imm */
	set	0x0,	%l0
	wr	%l0,	0x0,	%ccr
        set     0x0,    %l0
        subcc    %l0,    0x1fff, %l1     /* 0 - (-1) = 1 */
        sub     %l1,    0x1,    %l2
        brnz,a  %l2,    diag_fail
        set     0xfffeee01,     %l1

/*
 ********************************
 *  Swap Register with Memory 
 ********************************
 */
	set	0x0,	%l0
	setx	stint_1,	%l0,	%l2			

	set	0x5555ffff,	%l3
	stw	%l3,	[%l2+%l0]

	set	0x7abbccdd,	%l4	
	set	0x7abbccdd,	%l5	

	swap	[%l2+%l0],	%l4	/* l4 swap with mem(l3) */
	nop	

	lduw	[%l2+%l0],	%l6	
	nop

	sub	%l4,	%l3,	%l7
	brnz,a	%l7,	diag_fail
	set	0xffffee07,	%l1

	sub	%l6,	%l5,	%l7
	brnz,a	%l7,	diag_fail
	set	0xffffee07,	%l1

/*
 ********************************
 *  Swap Register with ASI Memory 
 ********************************
 */
!!-------------------------------------------
!!	swapa [regaddr] imm_asi, REGrd
!!-------------------------------------------
	set	0x0,	%l0
	setx	stint_asi1,	%l0,	%l2			

	set	0xff55aaff,	%l3
	stw	%l3,	[%l2+%l0]

	set	0x7fffaa55,	%l4	
	set	0x7fffaa55,	%l5	

	set	0x0,	%l0
	swapa	[%l2+%l0] 0x80,	%l4	/* l4 swap with mem(l3) */
	nop	

	lduw	[%l2+%l0],	%l6	
	nop

	sub	%l4,	%l3,	%l7
	brnz,a	%l7,	diag_fail
	set	0xffffee07,	%l1

	sub	%l6,	%l5,	%l7
	brnz,a	%l7,	diag_fail
	set	0xffffee07,	%l1

!!-------------------------------------------
!!	swapa [reg+imm] %asi, REGrd
!!-------------------------------------------
	set	0x0,	%l0
	setx	stint_asi2,	%l0,	%l2			

	set	0xff55aaff,	%l3
	stw	%l3,	[%l2+%l0]

	set	0x7fffaa55,	%l4	

	set	0x0,	%l0
	wr	%l0,	0x80,	%asi
	set	0x7fffaa55,	%l5	

	swapa	[%l2+0x0] %asi,	%l4	/* l4 swap with mem(l3) */
	nop	

	lduw	[%l2+%l0],	%l6	
	nop

	sub	%l4,	%l3,	%l7
	brnz,a	%l7,	diag_fail
	set	0xffffee07,	%l1

	sub	%l6,	%l5,	%l7
	brnz,a	%l7,	diag_fail
	set	0xffffee07,	%l1

!!-------------------------------------------
!!	swapa [reg+imm] %asi, REGrd
!!-------------------------------------------
	set	0x0,	%l0
	setx	stint_asi2,	%l0,	%l2			

	set	0xff55aaff,	%l3
	stw	%l3,	[%l2+%l0]

	set	0x7fffaa55,	%l4	

	set	0x0,	%l0
	wr	%l0,	0x80,	%asi
	set	0x7fffaa55,	%l5	

	swapa	[%l2+0x0] %asi,	%l4	/* l4 swap with mem(l3) */
	nop	

	lduw	[%l2+%l0],	%l6	
	nop

	sub	%l4,	%l3,	%l7
	brnz,a	%l7,	diag_fail
	set	0xffffee07,	%l1

	sub	%l6,	%l5,	%l7
	brnz,a	%l7,	diag_fail
	set	0xffffee07,	%l1

/*
 ********************************
 *  tagged add 
 ********************************
 */
!!-----------------
!!  taddcc
!!-----------------
	set	0x8,	%l0
	set	0x4,	%l1

	taddcc	%l1,	%l0,	%l2
	nop

	sub	%l2,	0xc,	%l3
	brnz,a	%l3,	diag_fail
	set	0xffffeee0,	%l1

	/* add imm */
	set	0x4,	%l1
	taddcc	%l1,	0x8,	%l3
	sub	%l3,	0xc,	%l3
	brnz,a	%l3,	diag_fail
	set	0xffffeee0,	%l1

	set	0x4,	%l0
	taddcc	%l0,	0x1ffc,	%l2
	brnz,a	%l2,	diag_fail
	set	0xffffeee1,	%l1

	/* icc.V set since %l0[0] = 1 */
	set	0x1,	%l0
	set	0x4,	%l1

	taddcc	%l1,	%l0,	%l2
	nop

	rd	%ccr,	%l3
	nop
	sub	%l3,	0x2,	%l4
	brnz,a	%l4,	diag_fail
	set	0xffffeeea,	%l1

	/* clr %ccr */
	set	0x0,	%l0
	wr	%l0,	0x0,	%ccr
	nop

	/* icc.V set since %l0[1] = 1 */
	set	0x2,	%l0
	set	0x4,	%l1

	taddcc	%l1,	%l0,	%l2
	nop

	rd	%ccr,	%l3
	nop
	sub	%l3,	0x2,	%l4
	brnz,a	%l4,	diag_fail
	set	0xffffeeea,	%l1
			
	/* clr %ccr */
	set	0x0,	%l0
	wr	%l0,	0x0,	%ccr
	nop

	/* icc.V set since result overflow */
	set	0x40000000,	%l0
	set	0x40000000,	%l1

	taddcc	%l1,	%l0,	%l2
	nop

	rd	%ccr,	%l3	/* icc.N icc.V are set */
	nop

	sub	%l3,	0xa,	%l4
	brnz,a	%l4,	diag_fail
	set	0xffffeeea,	%l1

!!-----------------
!!  taddcctv
!!-----------------
	set	0x8,	%l0
	set	0x4,	%l1

	taddcctv %l1,	%l0,	%l2
	nop

	sub	%l2,	0xc,	%l3
	brnz,a	%l3,	diag_fail
	set	0xffffeee0,	%l1

	/* add imm */
	set	0x4,	%l1
	taddcctv	%l1,	0x8,	%l3
	sub	%l3,	0xc,	%l3
	brnz,a	%l3,	diag_fail
	set	0xffffeee0,	%l1

	set	0x4,	%l0
	taddcctv	%l0,	0x1ffc,	%l2
	brnz,a	%l2,	diag_fail
	set	0xffffeee1,	%l1

/*
 ********************************
 *  tagged subtract 
 ********************************
 */
!!-----------------
!!  tsubcc
!!-----------------
	set	0x4,	%l0
	set	0x8,	%l1

	tsubcc	%l1,	%l0,	%l2
	nop

	sub	%l2,	0x4,	%l3
	brnz,a	%l3,	diag_fail
	set	0xffffeee0,	%l1

	/* sub imm */
	set	0x4,	%l1
	tsubcc	%l1,	0x2,	%l3
	sub	%l3,	0x2,	%l3
	brnz,a	%l3,	diag_fail
	set	0xffffeee0,	%l1

	set	0x0,	%l0
	sub	%l0,	4,	%l0
	tsubcc	%l0,	0x1ffc,	%l2
	brnz,a	%l2,	diag_fail
	set	0xffffeee1,	%l1

	/* icc.V set since %l0[0] = 1 */
	set	0x1,	%l0
	set	0x4,	%l1

	tsubcc	%l1,	%l0,	%l2
	nop

	rd	%ccr,	%l3
	nop
	sub	%l3,	0x2,	%l4
	brnz,a	%l4,	diag_fail
	set	0xffffeeea,	%l1

	/* clr %ccr */
	set	0x0,	%l0
	wr	%l0,	0x0,	%ccr
	nop

	/* icc.V set since %l0[1] = 1 */
	set	0x2,	%l0
	set	0x4,	%l1

	tsubcc	%l1,	%l0,	%l2
	nop

	rd	%ccr,	%l3
	nop
	sub	%l3,	0x2,	%l4
	brnz,a	%l4,	diag_fail
	set	0xffffeeea,	%l1
			
	/* clr %ccr */
	set	0x0,	%l0
	wr	%l0,	0x0,	%ccr
	nop

	/* icc.V set since result overflow */
	set	0xfffffffe,	%l0
	set	0xfffffffc,	%l1

	tsubcc	%l0,	%l1,	%l2
	nop

	rd	%ccr,	%l3	/* icc.N icc.V are set */
	nop

	sub	%l3,	0x2,	%l4
	brnz,a	%l4,	diag_fail
	set	0xffffeeea,	%l1

!!-----------------
!!  tsubcctv 
!!-----------------
	set	0x4,	%l0
	set	0x8,	%l1

	tsubcctv	%l1,	%l0,	%l2
	nop

	sub	%l2,	0x4,	%l3
	brnz,a	%l3,	diag_fail
	set	0xffffeee0,	%l1

	/* sub imm */
	set	0x8,	%l1
	tsubcctv %l1,	0x4,	%l3
	sub	%l3,	0x4,	%l3
	brnz,a	%l3,	diag_fail
	set	0xffffeee0,	%l1

	set	0x0,	%l0
	sub	%l0,	4,	%l0
	tsubcctv	%l0,	0x1ffc,	%l2
	brnz,a	%l2,	diag_fail
	set	0xffffeee1,	%l1
/*
 ***********************************
 *      Call & Jmpl
 ***********************************
 */
#if 0
        set     0x1,    %o0
        set     0x2,    %o1
        call    sum3
        set     0x3,    %o2

        sub     %o0,    0x6,    %l0
        brnz    %l0,    diag_fail
        set     0xffff0001,     %l1

	nop
#endif

!!----------------------------------
!!      Compare and Swap word
!!----------------------------------
        set     0x0,    %l0
        setx    ldint_1, %l0,   %l2

        lduw    [%l2+%l0],      %l3     /* l3 = 55aa11bb */
        nop

        set     0x55aa11cc,     %l4
        set     0x55ffff00,     %l5
        casa    [%l2] 0x80,     %l4,    %l5     /* %l5 = [%l2+%l0] = %l3 */
        nop     /* do we need a nop here ? */
        sub     %l5,    %l3,    %l6
        brnz,a  %l6,    diag_fail

        set     0xffffaaa0,     %l1
        set     0x0,    %l0
        setx    0x00cc55ffff00, %l0, %l5
        add     %l5,    0x0,    %l6     /* keep old %l5 */
        add     %l3,    0,      %l4     /* %l4 = [%l2+%l0] */
        casa    [%l2] 0x80,     %l4, %l5        /* new %l5 = [%l2+%l0] */
                                                /* [%l2+%l0] = old %l5 */
        nop
        sub     %l5,    %l3,    %l7
        brnz,a  %l7,    diag_fail
        set     0xffffaaa1,     %l1

        set     0x0,    %l0
        setx    ldint_1, %l0,   %l2
        ldsw    [%l2+%l0],      %l1
        nop
        set     0x55ffff00,     %l6
        sub     %l6,    %l1,    %l4
        brnz,a  %l4,    diag_fail
        set     0xffffaaa2,     %l1

!!---------------------------------------------
!!      Compare and Swap word in %asi
!!---------------------------------------------
        set     0x0,    %l0
        setx    ldint_1, %l0,   %l2

        lduw    [%l2+%l0],      %l3     /* l3 = 55aa11bb */
        nop

        set     0x55aa11cc,     %l4
        set     0x55ffff00,     %l5

        set     0x0,    %l0
        wr      %l0,    0x80,   %asi
        nop

        casa    [%l2] %asi,     %l4,    %l5     /* %l5 = [%l2+%l0] = %l3 */
        nop     /* do we need a nop here ? */
        sub     %l5,    %l3,    %l6
        brnz,a  %l6,    diag_fail

        set     0xffffaaa0,     %l1
        set     0x0,    %l0
        setx    0x00cc55ffff00, %l0, %l5
        add     %l5,    0x0,    %l6     /* keep old %l5 */
        add     %l3,    0,      %l4     /* %l4 = [%l2+%l0] */
        casa    [%l2] %asi,     %l4, %l5        /* new %l5 = [%l2+%l0] */
                                                /* [%l2+%l0] = old %l5 */
        nop
        sub     %l5,    %l3,    %l7
        brnz,a  %l7,    diag_fail
        set     0xffffaaa1,     %l1

        set     0x0,    %l0
        setx    ldint_1, %l0,   %l2
        ldsw    [%l2+%l0],      %l1
        nop
        set     0x55ffff00,     %l6
        sub     %l6,    %l1,    %l4
        brnz,a  %l4,    diag_fail
        set     0xffffaaa2,     %l1

!!------------------------------------------------
!!      Compare and Swap extended word ( imm )
!!------------------------------------------------
        set     0x0,    %l0
        setx    0x33aa44bb55cc66dd, %l0, %l3
        setx    ldint_1, %l0,   %l2

        stx     %l3,    [%l2+%l0]
        nop

        set     0x0,    %l0
        setx    0x4322110055aa11cc, %l0, %l4
        setx    0x4322110055ffff00, %l0, %l5
        casxa   [%l2] 0x80,     %l4,    %l5     /* %l5 = [%l2+%l0] = %l3 */
        nop     /* do we need a nop here ? */
        sub     %l5,    %l3,    %l6
        brnz,a  %l6,    diag_fail
        set     0xffffaaa0,     %l1

        set     0x0,    %l0
        setx    0x442200cc55ffff00,     %l0, %l5
        add     %l5,    0x0,    %l6     /* keep old %l5 */
        add     %l3,    0,      %l4     /* %l4 = [%l2+%l0] */
        casxa   [%l2] 0x80,     %l4, %l5        /* new %l5 = [%l2+%l0] */
                                                /* [%l2+%l0] = old %l5 */
        nop
        sub     %l5,    %l3,    %l7
        brnz,a  %l7,    diag_fail
        set     0xffffaaa1,     %l1

        set     0x0,    %l0
        setx    ldint_1, %l0,   %l2
        ldx     [%l2+%l0],      %l1
        nop
        sub     %l6,    %l1,    %l4
        brnz,a  %l4,    diag_fail
        set     0xffffaaa2,     %l1

!!------------------------------------------------
!!      Compare and Swap extended word ( %asi )
!!------------------------------------------------
        set     0x0,    %l0
        setx    0x33aa44bb55cc66dd, %l0, %l3
        setx    ldint_1, %l0,   %l2

        stx     %l3,    [%l2+%l0]
        nop

        set     0x0,    %l0
        wr      %l0,    0x80,   %asi
        setx    0x4322110055aa11cc, %l0, %l4
        setx    0x4322110055ffff00, %l0, %l5
        casxa   [%l2] %asi,     %l4,    %l5     /* %l5 = [%l2+%l0] = %l3 */
        nop     /* do we need a nop here ? */
        sub     %l5,    %l3,    %l6
        brnz,a  %l6,    diag_fail
        set     0xffffaaa0,     %l1

        set     0x0,    %l0
        setx    0x442200cc55ffff00,     %l0, %l5
        add     %l5,    0x0,    %l6     /* keep old %l5 */
        add     %l3,    0,      %l4     /* %l4 = [%l2+%l0] */
        casxa   [%l2] %asi,     %l4, %l5        /* new %l5 = [%l2+%l0] */
                                                /* [%l2+%l0] = old %l5 */
        nop
        sub     %l5,    %l3,    %l7
        brnz,a  %l7,    diag_fail
        set     0xffffaaa1,     %l1

        set     0x0,    %l0
        setx    ldint_1, %l0,   %l2
        ldx     [%l2+%l0],      %l1
        nop
        sub     %l6,    %l1,    %l4
        brnz,a  %l4,    diag_fail
        set     0xffffaaa2,     %l1

        /*
         * Restore the values in ldint_1
         *   cause, later on, some codes are
         *   hard-coded to the original values.
         */
        set     0x0,    %l0
        setx    ldint_1,        %l0,    %l2
        set     0x55aa11bb,   	%l3
	set	0xaa5577ff,     %l4

        stw     %l3,    [%l2+%l0]
	add	%l0,	0x4,	%l0

        stw     %l4,    [%l2+%l0]
	nop

/*
 ********************************
 *      Diag PASSED !           *
 ********************************
 */
diag_pass:
        set     0xaaddcafe,     %l0
        ta T_GOOD_TRAP
        nop

/*
 ********************************
 *      Diag FAILED !           *
 ********************************
 */
diag_fail:
        set     0xdeadcafe,     %l0
        ta T_BAD_TRAP
        nop
        nop

sum3:
	mov 0x1000, %sp
        save    %sp,    -96,    %sp
        add     %i0,    %i1,    %l7
        add     %l7,    %i2,    %l7
        ret     /* this is equal to : jmpl [%i7 + 8], %g0 */
        restore %l7,    0,      %o0     /* move result to the out reg */

.data	

ldint_1:	.word	0x55aa11bb
		.word	0xaa5577ff
		.word	0x77aa55bb
		.word	0xaa55ff44

fst_data:       .xword  0x700f000000000000
                .xword  0x700f000000000000
                .xword  0x700ff00000000000
                .xword  0x700ff00000000000

stfsr_sdata:    .word   0x00000000
                .word   0x00000000
                .word   0x00000000
                .word   0x00000000

stfsr_ddata:    .xword  0x0000000000000000
                .xword  0x0000000000000000
                .xword  0x0000000000000000
                .xword  0x0000000000000000

stfps_nmdata:   .word   0x00000000
                .word   0x00000000
                .word   0x00000000
                .word   0x00000000

stfpd_nmdata:   .xword  0x0000000000000000
                .xword  0x0000000000000000
                .xword  0x0000000000000000
                .xword  0x0000000000000000

stint_1:        .word   0x00000000
                .word   0x00000000
                .word   0x00000000
                .word   0x00000000

stint_asi1:     .word   0x00000000
                .word   0x00000000
                .word   0x00000000
                .word   0x00000000

stint_asi2:     .word   0x00000000
                .word   0x00000000
                .word   0x00000000
                .word   0x00000000


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

fpd_cvt_data1:	.xword 	0x0002000000000000
		.xword 	0x0004000000000000
		.xword 	0x0006000000000000
		.xword 	0x0008000000000000

fpd_cvt_nmd1:	.xword 	0x4008000000000000	/* 3 */
		.xword 	0x4018000000000000	/* 6 */
		.xword 	0x4022000000000000	/* 9 */
		.xword 	0x4042000000000000	/* 36 */

int2fps_nmd1: 	.word	0x00000003
		.word	0x00000006
		.word	0x00000009
		.word	0x00000000

int2fpd_nmd1: 	.xword	0x0000000000000003
		.xword	0x0000000000000006
		.xword	0x0000000000000009
		.xword	0x0000000000000000

fps_muldv_nmd1:	.word	0x40400000	/* 3 */
		.word	0x40c00000	/* 6 */
		.word	0x41900000	/* 18 = 16*(1+1/8) */
		.word	0x42100000	/* 36 */

fpd_muldv_nmd1:	.xword 	0x4008000000000000	/* 3 */
		.xword 	0x4018000000000000	/* 6 */
		.xword 	0x4032000000000000	/* 18 */
		.xword 	0x4042000000000000	/* 36 */	 

fps_sqr_nmd1:	.word	0x40400000	/* 3 */
		.word	0x40c00000	/* 6 */
		.word	0x41100000	/* 9 = 8*(1+1/8) */
		.word	0x42100000	/* 36 = 32*(1+1/8) */

fpd_sqr_nmd1:	.xword 	0x4008000000000000	/* 3 */
		.xword 	0x4018000000000000	/* 6 */
		.xword 	0x4022000000000000	/* 9 */
		.xword 	0x4042000000000000	/* 36 */	 

.end


__PERL__

use strict;
use TRELoad 'AnalyzeDiag';

verbose(0);

my $dir = '.';

my $analyzer = AnalyzeDiag::Analyzer->new(dir => $dir);

tie my %values, 'Tie::IxHash';
%values =
  (
   mulx =>
   {
    pretty_name => 'mulx',
    expect      => 11,
    tolerance   => 0,
   },
   branch_nt_annul =>
   {
    pretty_name => 'not-taken branch w/ annul',
    expect      => 4,
    adjustment  => -1, # substract one extra inst in label
    tolerance   => 0,
   },
   branch_nt_no_annul =>
   {
    pretty_name => 'not-taken branch w/o annul',
    expect      => 3,
    tolerance   => 0,
   },
   branch_nt_annul_icache =>
   {
    pretty_name => 'not-taken branch w/ annul I$miss',
    expect      => 4 + 21,
    adjustment  => -1,  # subtract one extra inst in label
    tolerance   => 0,
   },

  );

my @measures;
foreach my $value (keys %values) {
  push @measures, AnalyzeDiag::Measurement->new(name => $value,
						start => "${value}_start",
						end => "${value}_end",
					       );
}

$analyzer->add_measurements(@measures);

my %results = $analyzer->analyze();

foreach my $value (keys %values) {
  diag_ok(exists $results{$value}, "Found results for '$value'\n");


  if(exists $results{$value}) {

    # Compute average
    my $total = 0;
    foreach my $elem (@{$results{$value}}) {
      $total += $elem;
    }
    $total /= @{$results{$value}};
    $total = sprintf "%0.2f", $total;

    if(exists $values{$value}{adjustment}) {
      $total += $values{$value}{adjustment};
    }

    # Test vs expected
    if(exists $values{$value}{expect}) {
      my $tol =
	exists $values{$value}{tolerance} ? $values{$value}{tolerance} : 0;

      my $pretty_name = exists $values{$value}{pretty_name} ?
	$values{$value}{pretty_name} : $value;

      diag_is_numeric($total, $values{$value}{expect},
		      "$pretty_name", $tol);
    }

  }

}

script_exit;
	
