// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: hp_dmmu_realpgdmp.s
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
!!	This file has the micro-code to test out the DMMU demap
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
	 *	preload DTLB table
	 *********************************** 
	 */
test_1:
        mov     0x20,   %l0	/* 2 writes each time, one for non-real txlation, one for real txlation */
        mov     0x0,    %l1
        mov     0x0,   %l5     /* skip the first 4 entries */
        setx    dtsb_table1,    %l1,    %l2
preload_dtlb1:
        ldx     [%l2],          %g4
        ldx     [%l2+0x8],      %g5
        add     %l2,    0x10,   %l2

        mov     0x30,   %l3
	set	0x208,	%l7
        add   	%l5,    %l7,    %l7
        stxa    %g4,    [%l3] 0x58      /* DMMU tag access reg */
        stxa    %g5,    [%l5] 0x5d      /* DMMU data access reg , real pg */

        stxa    %g4,    [%l3] 0x58      /* DMMU tag access reg */
        stxa    %g5,    [%l7] 0x5d      /* DMMU data access reg , real pg */

	add	%l5,	0x10,	%l5	/* next entry */

        add     %l1,    0x1,    %l1
        sub     %l1,    %l0,    %l6
        brnz    %l6,    preload_dtlb1
	nop

/* 
 *************************************************
 *	Test the demaping of DMMU page 
 *************************************************
 */
	/* 
	 ************************
	 * Demap by Page
	 ************************
	 */

        mov     0x20,   %o0     /* entry 4 : nucl ctx , size=8k */
ddmp_loop:
	call	dmmu_dmp_pg
	nop

	add	%o0,	0x8,	%o0
	mov	0x1e0,	%o1
	sub	%o1,	%o0,	%o2
	brz,a	%o2,	final_read
	nop

	ba	ddmp_loop
	nop

final_read:
	call	rd_dtlb
	nop


	ba	diag_pass
	nop

/*
 **********************************
 * demap operations
 **********************************
 */
.global dmmu_dmp_pg
dmmu_dmp_pg:
        mov	%o7,	%i7	/* save the return address */
ddmpg_1_0:
	mov	0x0,	%l5
	mov	0x1,	%l6	
	call	dmp_dtlb_entry
	nop

ddmpg_1_1:
	mov	0x20,	%l5
	mov	0x1,	%l6	
	call	dmp_dtlb_entry
	nop

ddmpg_1_2:
        mov     0x30,   %l5
	mov	0x0,	%l6
	call	dmp_dtlb_entry
	nop

	mov	%i7,	%o7	
	ret
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

.global dmp_dtlb_entry 	 

dmp_dtlb_entry:
        mov     0x0,    %l0
        mov     0x0,    %g4
        mov     0x0,    %g5
        ldxa    [%o0] 0x5d,     %g4     /* DMMU data access reg */
        ldxa    [%o0] 0x5e,     %g5     /* DMMU Tag read reg */

        setx    0xffffffffffffe000, %l0, %l3
        and     %g5,    %l3,    %l7
dmp_action:
	brz	%l6,	dmpact_1	/* demap this entry */
	nop

	sub	%l6,	0x1,	%l0	/* given the wrong context */
	brz	%l0,	dmpact_1
	nop

	sub	%l6,	0x2,	%l0	/* mess up the page to make demap not happen */
	brz	%l0,	messup_pg
	nop

	ba	diag_fail
	nop

messup_pg:
	set	0x11110000,	%l0
	add	%l0,	%l7,	%l7
	set	0x200,	%l0
	or	%l0,	%l7,	%l7

dmpact_1:	/* entry is demaped */
        or      %l7,    %l5,    %l7     /* %l5 	: context */
	set	0x200,	%l0
	or	%l0,	%l7,	%l7

        stxa    %g0,    [%l7] 0x5f
        nop

        /* read the same DMMU TLB entry again */
        ldxa    [%o0] 0x5d,     %l1     /* DMMU data access reg */

        /* restore the entry */
        mov     0x30,   %o2
        stxa    %g5,    [%o2] 0x58

	set	0x200,	%o3
	or	%o0,	%o3,	%o3	/* real page */
        stxa    %g4,    [%o3] 0x5d

dmp_rtn:
	retl
	nop

.global rd_dtlb
/*
 *********************
 * read out DTLB 
 *********************
 */
rd_dtlb:
        /* read out all the entries in I-TLB table to compare */
        set     0x0,    %l0
        set     0x40,   %l1
        set     0x0,    %l2
rd_dtlb_loop:
        ldxa    [%l2] 0x5d,     %l3
        add     %l2,    0x8,    %l2
        add     %l0,    0x1,    %l0

        sub     %l0,    %l1,    %l5
        brnz,a  %l5,    rd_dtlb_loop
        nop

	retl
	nop

.data

.global dtsb_table1

dtsb_table1:
	/*
	 *******************************
	 * 	entry :  4,5,6,7
	 *******************************
	 */

        /*   nucleus context L=0, size=8k */
        .xword  0x0000000000180000,     0x8000000100180000
        /*   nucleus context L=1, size=8k */
        .xword  0x0000000000184000,     0x8000000100184040
        /*   prim context L=0, size=8k */
        .xword  0x0000000000180044,     0x8000000100180000
        /*   prim context L=1, size=8k */
        .xword  0x0000000000184044,     0x8000000100184040

	/*
	 *******************************
	 * 	entry :  8--11
	 *******************************
	 */
        /*   nuc context L=0, size=64k, G=0  */
        .xword  0x00000000001b0000,     0xa0000001001b0000
        /*   nuc context L=1, size=64k, G=0  */
        .xword  0x00000000001c0000,     0xa0000001001c0040
        /*   prim context L=0, size=64k, G=0  */
        .xword  0x00000000001b0044,     0xa0000001001b0000
        /*   prim context L=1, size=64k, G=0  */
        .xword  0x00000000001c0044,     0xa0000001001c0040

        /*   nuc context L=0, size=64k, G=0  */
        .xword  0x00000001001b0000,     0xa0000001001b0000
        /*   nuc context L=1, size=64k, G=0  */
        .xword  0x00000001001c0000,     0xa0000001001c0040
        /*   prim context L=0, size=64k, G=0  */
        .xword  0x00000001001b0044,     0xa0000001001b0000
        /*   prim context L=1, size=64k, G=0  */
        .xword  0x00000001001c0044,     0xa0000001001c0040


	/*
	 *******************************
	 * 	entry :  12--15
	 *******************************
	 */

        /*   nuc context L=0, size=4m, G=0  */
        .xword  0x0000000000280000,     0xe000000100280000
        /*   nuc context L=1, size=4m, G=0  */
        .xword  0x0000000000380000,     0xe000000100380040
        /*   prim context L=0, size=4m, G=0  */
        .xword  0x0000000000280044,     0xe000000100280000
        /*   prim context L=1, size=4m, G=0  */
        .xword  0x0000000000380044,     0xe000000100380040


	/*
	 *******************************
	 * 	entry :  16--19
	 *******************************
	 */

        /*   nuc context L=0, size=256M, G=0  */
        .xword  0x0000000010000000,     0xa000800100000000
        /*   nuc context L=1, size=256M, G=0  */
        .xword  0x0000000020000000,     0xa000800200000040
        /*   prim context L=0, size=256M, G=0  */
        .xword  0x0000000010000044,     0xa000800100000000
        /*   prim context L=1, size=256M, G=0  */
        .xword  0x0000000020000044,     0xa000800200000040

.global dtsb_table2

dtsb_table2:
	/*
	 *******************************
	 * 	entry :  4,5,6,7
	 *******************************
	 */

        /*   nucleus context L=0, size=8k */
        .xword  0x0000000000180000,     0x8000000100180000
        /*   nucleus context L=1, size=8k */
        .xword  0x0000000000184000,     0x8000000100184040
        /*   prim context L=0, size=8k, G=0  */
        .xword  0x0000000000188044,     0x8000000100188000
        /*   prim context L=1, size=8k, G=0  */
        .xword  0x000000000018e044,     0x800000010018e041

        /*   nucleus context L=0, size=8k */
        .xword  0x0000000020180000,     0x8000000100180000
        /*   nucleus context L=1, size=8k */
        .xword  0x0000000020184000,     0x8000000100184040
        /*   prim context L=0, size=8k, G=0  */
        .xword  0x0000000020188044,     0x8000000100188000
        /*   prim context L=1, size=8k, G=0  */
        .xword  0x000000002018e044,     0x800000010018e041

	/*
	 *******************************
	 * 	entry :  8--11
	 *******************************
	 */
        /*   nuc context L=0, size=64k, G=0  */
        .xword  0x00000000001b0000,     0xa0000001001b0000
        /*   nuc context L=1, size=64k, G=0  */
        .xword  0x00000000001c0000,     0xa0000001001c0040
        /*   prim context L=0, size=64k, G=0  */
        .xword  0x00000000001b0044,     0xa0000001001b0000
        /*   prim context L=1, size=64k, G=0  */
        .xword  0x00000000001c0044,     0xa0000001001c0040


	/*
	 *******************************
	 * 	entry :  12--15
	 *******************************
	 */

        /*   nuc context L=0, size=4m, G=0  */
        .xword  0x0000000000280000,     0xe000000100280000
        /*   nuc context L=1, size=4m, G=0  */
        .xword  0x0000000000380000,     0xe000000100380040
        /*   prim context L=0, size=4m, G=0  */
        .xword  0x0000000000280044,     0xe000000100280000
        /*   prim context L=1, size=4m, G=0  */
        .xword  0x0000000000380044,     0xe000000100380040


	/*
	 *******************************
	 * 	entry :  16--19
	 *******************************
	 */

        /*   nuc context L=0, size=256M, G=0  */
        .xword  0x0000000010000000,     0xa000800100000000
        /*   nuc context L=1, size=256M, G=0  */
        .xword  0x0000000020000000,     0xa000800200000040
        /*   prim context L=0, size=256M, G=0  */
        .xword  0x0000000010000044,     0xa000800100000000
        /*   prim context L=1, size=256M, G=0  */
        .xword  0x0000000020000044,     0xa000800200000040
