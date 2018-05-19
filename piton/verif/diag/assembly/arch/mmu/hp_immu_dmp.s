// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: hp_immu_dmp.s
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

!!-------------------------------------------------------------------------------
!!
!!	This file has the micro-code to test out the IMMU demap
!!
!!-------------------------------------------------------------------------------

#define MAIN_PAGE_HV_ALSO

#include "boot.s"

.text

.global main

main:
	nop

        /* changed to privilege mode */
        ta      T_CHANGE_HPRIV
        nop

	/* 
	 *********************************** 
	 *	preload ITLB table
	 *********************************** 
	 */
test_1:
        mov     0x1e,   %l0
        mov     0x0,    %l1
        mov     0x20,   %l5     /* skip the first 4 entries */
        setx    itsb_table1,    %l1,    %l2
preload_itlb1:
        ldx     [%l2],          %g4
        ldx     [%l2+0x8],      %g5
        add     %l2,    0x10,   %l2

        mov     0x30,   %l3
        stxa    %g4,    [%l3] 0x50      /* IMMU tag access reg */
        stxa    %g5,    [%l5] 0x55      /* IMMU data access reg */

	mov	0x208,	%l7	/* write a Real translation entry */
        add     %l5,    %l7,    %o7
        stxa    %g4,    [%l3] 0x50      /* IMMU tag access reg */
        stxa    %g5,    [%o7] 0x55      /* IMMU data access reg */

        add     %l5,    0x10,    %l5

        add     %l1,    0x1,    %l1
        sub     %l1,    %l0,    %l6
        brnz    %l6,    preload_itlb1
	nop

/* 
 *************************************************
 *	Test the demaping of IMMU page 
 *************************************************
 */ 

/*
 ****************************************
 *	Demap IMMU pages by Context
 ****************************************
 */

	/*
	 *********************************************
	 *	Demap all the Nucleus Context 
	 *	entries in the ITLB table 
	 *
	 * 	For those ITLB entries with Global bit
	 *	set, context=NUCLEUS, the entries will
	 *	not be removed.
	 *********************************************
 	 */
dmp_ctx_0:
	mov	0x0,	%o0
	ldxa	[%o0] 0x55,	%g4	/* IMMU data access reg */
	ldxa	[%o0] 0x56,	%g5	/* IMMU Tag read reg */

	/* 
 	 ******************************************************
	 * We have to save the first NUCLEUS entry 
	 * in the I-TLB table. Otherwise, will enter the RED
	 * state because the first entry is the trap handler. 
 	 ******************************************************
	 */
	set	0x60,	%l7
	stxa	%g0,	[%l7] 0x57
	nop

	/* flush */

	/* restore the first entry in the I-TLB table */
	mov	0x30,	%o0
	stxa	%g5,	[%o0] 0x50
	stxa	%g4,	[%g0] 0x55
	
	/*
	 **********************************************
	 *	Demap all the context=PRIM IMMU TLB
	 *	entries.
	 **********************************************
	 */
dmp_ctx_1:
        set     0x40,   %l7
        stxa    %g0,    [%l7] 0x57
        nop

/*
 ***********************
 *    IMMU demap all   *
 ***********************
 */
        /*
         ******************************************************
         * We have to save the first NUCLEUS entry
         * in the I-TLB table. Otherwise, will enter the RED
         * state because the first entry is the trap handler.
         ******************************************************
         */
        mov     0x0,    %o0
        ldxa    [%o0] 0x55,     %g4     /* IMMU data access reg */
        ldxa    [%o0] 0x56,     %g5     /* IMMU Tag read reg */

        /*
         *********************************************
         *      Demap all the un-locked
         *      entries in the ITLB table
         *********************************************
         */
        set     0x80,   %l7             /* bit[7:6] = 1_0 */
        stxa    %g0,    [%l7] 0x57
        nop

        /* flush */

        /* restore the first entry in the I-TLB table */
        mov     0x30,   %o0
        stxa    %g5,    [%o0] 0x50
        stxa    %g4,    [%g0] 0x55

	call	rd_itlb
	nop

/*
 ********************************
 *      Diag PASSED !           *
 ********************************
 */
diag_pass:
        set     0xaaddcafe,     %l0
good_trap:
        ta 	T_GOOD_TRAP
        nop

/*
 ********************************
 *      Diag FAILED !           *
 ********************************
 */
diag_fail:
        set     0xdeadcafe,     %l0
bad_trap:
        ta 	T_BAD_TRAP
        nop
        nop

.global rd_itlb
/*
 *********************
 * read out ITLB 
 *********************
 */
rd_itlb:
        /* read out all the entries in I-TLB table to compare */
        set     0x0,    %l0
        set     0x40,   %l1
        set     0x0,    %l2
rd_itlb_loop:
        ldxa    [%l2] 0x55,     %l3

        add     %l2,    0x8,    %l2
        add     %l0,    0x1,    %l0

        sub     %l0,    %l1,    %l5
        brnz,a  %l5,    rd_itlb_loop
        nop

	retl
	nop

.data

.global itsb_table1

itsb_table1:
        /*   nucleus context : V=1,0 L=0, size=4mb, G=0  */
        .xword  0x0000000004000000,     0xe000000104000002      /* 4 */
        /*   nucleus context : V=1,0 L=1, size=256M, G=0  */
        .xword  0x0000000080000000,     0xa001000180000042      /* 6 */
        /*   nucleus context : V=1,0 L=1, size=64k, G=0  */
        .xword  0x0000000000500000,     0xa000000100500042      /* 8 */
        /*   nucleus context : V=1,0 L=0, size=8k, G=0  */
        .xword  0x0000000000580000,     0x8000000100580092      /* 10 */

        /*   primary context : V=1,0 L=0, size=4mb, G=0  */
        .xword  0x0000000004000044,     0xe000000100400002      /* 12 */
        /*   primary context : V=1,0 L=1, size=256M, G=0  */
        .xword  0x0000000080000044,     0xa001000180000042      /* 14 */
        /*   primary context : V=1,0 L=1, size=64k, G=0  */
        .xword  0x0000000000500044,     0xa000000100500042      /* 16 */
        /*   primary context : V=1,0 L=0, size=8k, G=0  */
        .xword  0x0000000000580044,     0x8000000100580092      /* 18 */

        /*   secondary  context : V=1,0 L=0, size=4mb, G=0  */
        .xword  0x0000000004000055,     0xe000000100400002      /* 20 */
        /*   secondary  context : V=1,0 L=1, size=256M, G=0  */
        .xword  0x0000000080000055,     0xa001000180000042      /* 22 */
        /*   secondary  context : V=1,0 L=1, size=64k, G=0  */
        .xword  0x0000000000500055,     0xa000000100500042      /* 24 */
        /*   secondary  context : V=1,0 L=0, size=8k, G=0  */
        .xword  0x0000000000580055,     0x8000000100580092      /* 26 */


        /*   nucl context : L=0, size=4M, G=0  */
        .xword  0x0000000010400000,     0xe000000200400002              /* 28 */
        .xword  0x0000000010400000,     0x6000000200400002              /* 30 */
        /*   prim context : L=0, size=4M, G=0  */
        .xword  0x0000000010400044,     0xe000000200400002              /* 32 */
        .xword  0x0000000010400044,     0x6000000200400002              /* 34 */
        /*   secondary context : L=0, size=4M, G=0  */
        .xword  0x0000000010400055,     0xe000000200400002              /* 36 */
        .xword  0x0000000010400055,     0x6000000200400002              /* 38 */

        /*   nucl context : L=0, size=256M, G=0  */
        .xword  0x0000000010000000,     0xa001000110000002              /* 40 */
        .xword  0x0000000010000000,     0x2001000110000002              /* 42 */
        /*   prim context : L=0, size=256M, G=0  */
        .xword  0x0000000010000044,     0xa001000110000002              /* 44 */
        .xword  0x0000000010000044,     0x2001000110000002              /* 46 */
        /*   secondary context : L=0, size=256M, G=0  */
        .xword  0x0000000010000055,     0xa001000110000002              /* 48 */
        .xword  0x0000000010000055,     0x2001000110000002              /* 50 */

        /*   secondary context : L=0, size=64k, G=1  */
        .xword  0x0000000011a50055,     0xa000000101a50003              /* 52 */
        .xword  0x0000000011a50055,     0x2000000101a50003              /* 54 */
        /*   primary context : L=0, size=64k, G=0  */
        .xword  0x0000000011400044,     0xa000000101400002              /* 56 */
        .xword  0x0000000011400044,     0x2000000101400002              /* 58 */
        /*   nucleus context : L=0, size=64k, G=1  */
        .xword  0x0000000011a50000,     0xa000000101a50003              /* 60 */
        .xword  0x0000000011a50000,     0x2000000101a50003              /* 62 */

        /*   secondary context : L=1, size=4M, G=1  */
        .xword  0x0000000011c00055,     0x6000000101c00043              /* 64 */
        .xword  0x0000000012000055,     0xe000000102000043              /* 64 */

        /*   primary context : V=1,0 L=0, size=8k, G=0  */
        .xword  0x0000000012080044,     0x8000000102080002              /* 53 */
        .xword  0x0000000012100044,     0x0000000102100002              /* 54 */

        /*   primary context : L=0, size=8k, G=1  */
        .xword  0x0000000012110044,     0x8000000102110003      	/* 55 */
        .xword  0x0000000012120044,     0x0000000102120003              /* 56 */

        /*   primary context : L=0, size=64k, G=0  */
        .xword  0x0000000012130044,     0xa000000102130002              /* 57 */
        .xword  0x0000000012140044,     0x2000000102140002              /* 58 */

        /*   primary context : L=0, size=64k, G=1  */
        .xword  0x0000000012150044,     0xa000000102150003              /* 59 */
        .xword  0x0000000012160044,     0x2000000102160003              /* 60 */

