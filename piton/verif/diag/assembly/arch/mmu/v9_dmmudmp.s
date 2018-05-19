// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: v9_dmmudmp.s
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
!!	This file has the micro-code to test out the MMU registers
!!
!!-------------------------------------------------------------------------------

#define MAIN_PAGE_HV_ALSO

#include "boot.s"

.text

.global main

#define	DTLB_CTXDMP_NCLU1	0x0
#define	DTLB_CTXDMP_NCLU2	0x40
#define	DTLB_CTXDMP_NCLU3	0x80
#define	DTLB_CTXDMP_PMRY1	0x80
#define	DTLB_CTXDMP_PMRY2	0xc0
#define	DTLB_CTXDMP_PMRY3	0x100
#define	DTLB_CTXDMP_SEC1	0x100
#define	DTLB_CTXDMP_SEC2	0x180
#define	DTLB_CTXDMP_SEC3	0x200

#define	DTLB_DMAP_ENTRY1	0x10	
#define	DTLB_DMAP_ENTRY2	0x30	
#define	DTLB_DMAP_ENTRY3	0x50
#define	DTLB_DMAP_ENTRY4	0x70
#define	DTLB_DMAP_ENTRY5	0x90
#define	DTLB_DMAP_ENTRY6	0xb0
#define	DTLB_DMAP_ENTRY7	0xd0
#define	DTLB_DMAP_ENTRY8	0xe0

main:

	nop

        /* changed to privilege mode */
        ta      T_CHANGE_HPRIV
        nop
/*
 ********************************************************************
 * Check the DEMAP operation of DMMU 
 ********************************************************************
 */

/*
 *****************************************************************************
 *
 *	all the entries in the D-TLB
 *
 *	Entry 		G		L		CTX	
 *   ----------------------------------------------------------------
 *      0--3		0		0		NUCLEUS
 *   ----------------------------------------------------------------
 *	4--7		0		1		NUCLEUS 
 *   ----------------------------------------------------------------
 *	8-11		1		0		NUCLEUS	
 *   ----------------------------------------------------------------
 *	12-15		1		1		NUCLEUS
 *   ----------------------------------------------------------------
 *	16-19		0		0		PCONTEXT
 *   ----------------------------------------------------------------
 *	20-23		0		1		PCONTEXT
 *   ----------------------------------------------------------------
 *	24-27		1		0		PCONTEXT
 *   ----------------------------------------------------------------
 *	28-31		1		1		PCONTEXT
 *   ----------------------------------------------------------------
 *	32-39		0		0		SCONTEXT
 *   ----------------------------------------------------------------
 *	40-47		0		1		SCONTEXT
 *   ----------------------------------------------------------------
 *	48-55		1		0		SCONTEXT
 *   ----------------------------------------------------------------
 *	56-63		1		1		SCONTEXT
 *   ----------------------------------------------------------------
 ******************************************************************************
 */
        set     0x0,    %l0
        set     0x180000, %l3   /* Tag Access reg */
        setx    0x8000000100180000, %l0, %l4    /* G=0 , L=0 CTX=NECL */

        set     0x30,    %l2
        set     0x10000, %l7
        set     0x0,     %l1
        set     0x0,     %l5             
        mov     0x30,    %o0

wr_dtte_ncl1:
        stxa    %l3,    [%o0] 0x58      /* DMMU Tag Access Reg */
        stxa    %l4,    [%l1] 0x5d      /* DMMU Data Access Reg */

        ldxa    [%l1]   0x5d,   %g4     /* DMMU data access reg */
        ldxa    [%l1]   0x5e,   %g5     /* DMMU tag read reg */

        add     %l3,    %l7,    %l3
        add     %l4,    %l7,    %l4

        add     %l1,    0x8,    %l1
        add     %l5,    0x4,    %l5

        sub     %l5,    0x10,   %l6
        brnz,a  %l6,    wr_dtte_ncl1
        nop

	add	%l4,	0x40,	%l4	/* L = 1 , G =0 , ctx=NUCLEUS */	
wr_dtte_ncl2:
        stxa    %l3,    [%o0] 0x58      /* DMMU Tag Access Reg */
        stxa    %l4,    [%l1] 0x5d      /* DMMU Data Access Reg */

        ldxa    [%l1]   0x5d,   %g4     /* DMMU data access reg */
        ldxa    [%l1]   0x5e,   %g5     /* DMMU tag read reg */

        add     %l3,    %l7,    %l3
        add     %l4,    %l7,    %l4

        add     %l1,    0x8,    %l1

        add     %l5,    0x4,    %l5

	sub	%l5,	0x20,	%l6
	brnz,a	%l6,	wr_dtte_ncl2
	nop

	sub	%l4,	0x40,	%l4	
	add	%l4,	0x1,	%l4	/* G=1 L=0, ctx=NCLU */
wr_dtte_ncl3:
        stxa    %l3,    [%o0] 0x58      /* DMMU Tag Access Reg */
        stxa    %l4,    [%l1] 0x5d      /* DMMU Data Access Reg */

        ldxa    [%l1]   0x5d,   %g4     /* DMMU data access reg */
        ldxa    [%l1]   0x5e,   %g5     /* DMMU tag read reg */

        add     %l3,    %l7,    %l3
        add     %l4,    %l7,    %l4
        add     %l1,    0x8,    %l1
        add     %l5,    0x4,    %l5
        sub     %l5,    0x30,  %l6	
        brnz,a  %l6,    wr_dtte_ncl3
        nop

	add	%l4,	0x40,	%l4	/* L=1 G=1 ctx=NCLU */
wr_dtte_ncl4:
        stxa    %l3,    [%o0] 0x58      /* DMMU Tag Access Reg */
        stxa    %l4,    [%l1] 0x5d      /* DMMU Data Access Reg */

        ldxa    [%l1]   0x5d,   %g4     /* DMMU data access reg */
        ldxa    [%l1]   0x5e,   %g5     /* DMMU tag read reg */

        add     %l3,    %l7,    %l3
        add     %l4,    %l7,    %l4
        add     %l1,    0x8,    %l1
        add     %l5,    0x4,    %l5
        sub     %l5,    0x40,  %l6
        brnz,a  %l6,    wr_dtte_ncl4
        nop

	set	PCONTEXT,	%o2
	or	%l3,	%o2,	%l3	/* changed to Primary Context */
	sub	%l4,	0x41,	%l4	/* G=0 L=0 ctx=PRIM */

wr_dtte_prim1:
        stxa    %l3,    [%o0] 0x58      /* DMMU Tag Access Reg */
        stxa    %l4,    [%l1] 0x5d      /* DMMU Data Access Reg */

        ldxa    [%l1]   0x5d,   %g4     /* DMMU data access reg */
        ldxa    [%l1]   0x5e,   %g5     /* DMMU tag read reg */

        add     %l3,    %l7,    %l3
        add     %l4,    %l7,    %l4     
        add     %l1,    0x8,    %l1
        add     %l5,    0x4,    %l5     
        sub     %l5,    0x50,  %l6      
        brnz,a  %l6,    wr_dtte_prim1
        nop

	add	%l4,	0x40,	%l4	/* L=1 G=0 ctx=PRIM */
wr_dtte_prim2:
        stxa    %l3,    [%o0] 0x58      /* DMMU Tag Access Reg */
        stxa    %l4,    [%l1] 0x5d      /* DMMU Data Access Reg */

        ldxa    [%l1]   0x5d,   %g4     /* DMMU data access reg */
        ldxa    [%l1]   0x5e,   %g5     /* DMMU tag read reg */

        add     %l3,    %l7,    %l3
        add     %l4,    %l7,    %l4
        add     %l1,    0x8,    %l1
        add     %l5,    0x4,    %l5
        sub     %l5,    0x60,  %l6
        brnz,a  %l6,    wr_dtte_prim2
        nop

	sub	%l4,	0x40,	%l4	
	add	%l4,	0x1,	%l4	/* L=0 G=1 ctx=PRIM */
wr_dtte_prim3:
        stxa    %l3,    [%o0] 0x58      /* DMMU Tag Access Reg */
        stxa    %l4,    [%l1] 0x5d      /* DMMU Data Access Reg */

        ldxa    [%l1]   0x5d,   %g4     /* DMMU data access reg */
        ldxa    [%l1]   0x5e,   %g5     /* DMMU tag read reg */

        add     %l3,    %l7,    %l3
        add     %l4,    %l7,    %l4
        add     %l1,    0x8,    %l1
        add     %l5,    0x4,    %l5
        sub     %l5,    0x70,  %l6
        brnz,a  %l6,    wr_dtte_prim3
        nop

	add	%l4,	0x40,	%l4	/* L=1 G=1 ctx=PRIM */
wr_dtte_prim4:
        stxa    %l3,    [%o0] 0x58      /* DMMU Tag Access Reg */
        stxa    %l4,    [%l1] 0x5d      /* DMMU Data Access Reg */

        ldxa    [%l1]   0x5d,   %g4     /* DMMU data access reg */
        ldxa    [%l1]   0x5e,   %g5     /* DMMU tag read reg */

        add     %l3,    %l7,    %l3
        add     %l4,    %l7,    %l4
        add     %l1,    0x8,    %l1
        add     %l5,    0x4,    %l5
        sub     %l5,    0x80,  %l6
        brnz,a  %l6,    wr_dtte_prim4
        nop

	sub	%l4,	0x41,	%l4	
	set	PCONTEXT,	%o2
	sub	%l3,	%o2,	%l3
	set	SCONTEXT,	%o2
	or	%l3,	%o2,	%l3 	/* L=0 G=0 CTX=SEC */ 
wr_dtte_sec1:
        stxa    %l3,    [%o0] 0x58      /* DMMU Tag Access Reg */
        stxa    %l4,    [%l1] 0x5d      /* DMMU Data Access Reg */ 

        ldxa    [%l1]   0x5d,   %g4     /* DMMU data access reg */
        ldxa    [%l1]   0x5e,   %g5     /* DMMU tag read reg */ 

        add     %l3,    %l7,    %l3
        add     %l4,    %l7,    %l4
        add     %l1,    0x8,    %l1
        add     %l5,    0x4,    %l5
        sub     %l5,    0xa0,  %l6
        brnz,a  %l6,    wr_dtte_sec1
        nop

	add	%l4,	0x40,	%l4	/* L=1 G=0 CTX=SEC */
wr_dtte_sec2:
        stxa    %l3,    [%o0] 0x58      /* DMMU Tag Access Reg */
        stxa    %l4,    [%l1] 0x5d      /* DMMU Data Access Reg */ 

        ldxa    [%l1]   0x5d,   %g4     /* DMMU data access reg */
        ldxa    [%l1]   0x5e,   %g5     /* DMMU tag read reg */ 

        add     %l3,    %l7,    %l3
        add     %l4,    %l7,    %l4
        add     %l1,    0x8,    %l1
        add     %l5,    0x4,    %l5
        sub     %l5,    0xc0,   %l6
        brnz,a  %l6,    wr_dtte_sec2
        nop

	sub	%l4,	0x40,	%l4
	add	%l4,	0x1,	%l4	/* L=0 G=1 CTX=SEC */
wr_dtte_sec3:
        stxa    %l3,    [%o0] 0x58      /* DMMU Tag Access Reg */
        stxa    %l4,    [%l1] 0x5d      /* DMMU Data Access Reg */

        ldxa    [%l1]   0x5d,   %g4     /* DMMU data access reg */
        ldxa    [%l1]   0x5e,   %g5     /* DMMU tag read reg */

        add     %l3,    %l7,    %l3
        add     %l4,    %l7,    %l4
        add     %l1,    0x8,    %l1
        add     %l5,    0x4,    %l5
        sub     %l5,    0xe0,   %l6
        brnz,a  %l6,    wr_dtte_sec3
        nop

	add	%l4,	0x40,	%l4	/* L=1 G=1 CTX=SEC */
wr_dtte_sec4:
        stxa    %l3,    [%o0] 0x58      /* DMMU Tag Access Reg */
        stxa    %l4,    [%l1] 0x5d      /* DMMU Data Access Reg */

        ldxa    [%l1]   0x5d,   %g4     /* DMMU data access reg */
        ldxa    [%l1]   0x5e,   %g5     /* DMMU tag read reg */

        add     %l3,    %l7,    %l3
        add     %l4,    %l7,    %l4
        add     %l1,    0x8,    %l1
        add     %l5,    0x4,    %l5
        sub     %l5,    0x100,   %l6
        brnz,a  %l6,    wr_dtte_sec4
        nop

/*
 ***************************************************
 *	Demap DMMU by PAGE
 ***************************************************
 */
	/* 
 	 ******************************************************
	 * demap ctx=prim, tlb ctx=necl, g=0, not demaped 
 	 ******************************************************
	 */
tc_0:
        mov     DTLB_DMAP_ENTRY1,      %o0
        mov     0x0,    %l0
        mov     0x0,    %g4
        mov     0x0,    %g5
        ldxa    [%o0] 0x5d,     %g4     /* DMMU data access reg */
        ldxa    [%o0] 0x5e,     %g5     /* DMMU Tag read reg */

        setx    0xffffffffffffe000, %l0, %l3
        and     %g5,    %l3,    %l7
        /* demap page, context = nucleus */
        stxa    %g0,    [%l7] 0x5f
        nop

        /* flush */

        /* read the same DMMU TLB entry again */
        set     0x0,    %l1
        set     0x0,    %l2
        set     DTLB_DMAP_ENTRY1,      %o0
        ldxa    [%o0] 0x5d,     %l1     /* DMMU data access reg */
        ldxa    [%o0] 0x5e,     %l2     /* DMMU Tag read reg */

#ifdef SELF_CHECKING
        brz,a   %l2,    diag_fail	/* not demapped, l2 != 0 */
        nop

        srlx    %l1,    30,     %l3
        srlx    %l3,    30,     %l4
        /* bit 63 (valid bit) should not = 0 , since entry is not demapped */
        brz,a  %l4,    diag_fail
        nop
#endif

tc_0_1:
	/* 
 	 ***************************************************************
	 * demap ctx=necl, tlb ctx=necl, g=0, page mismatch not demaped 
 	 ***************************************************************
	 */

        mov     DTLB_DMAP_ENTRY1,      %o0
        mov     0x0,    %l0
        mov     0x0,    %g4
        mov     0x0,    %g5
        ldxa    [%o0] 0x5d,     %g4     /* DMMU data access reg */
        ldxa    [%o0] 0x5e,     %g5     /* DMMU Tag read reg */

        setx    0xffffffffffffe000, %l0, %l3
        and     %g5,    %l3,    %l7
	or	%l7,	0x20,	%l7
	set	0x10111000,	%l1
	or	%l7,	%l1,	%l7
        /* demap page, context = nucleus */
        stxa    %g0,    [%l7] 0x5f
        nop

        /* flush */

        /* read the same DMMU TLB entry again */
        set     0x0,    %l1
        set     0x0,    %l2
        set     DTLB_DMAP_ENTRY1,      %o0
        ldxa    [%o0] 0x5d,     %l1     /* DMMU data access reg */
#if 0
        ldxa    [%o0] 0x5e,     %l2     /* DMMU Tag read reg */

        brz,a   %l2,    diag_fail	/* not demapped, l2 != 0 */
        nop
#endif

#ifdef SELF_CHECKING
        srlx    %l1,    30,     %l3
        srlx    %l3,    30,     %l4
        /* bit 63 (valid bit) should not = 0 , since entry is not demapped */
        brz,a  %l4,    diag_fail
        nop
#endif

	/* 
         ******************************************************
	 * demap ctx=sec,  tlb ctx=necl, g=0, not demaped 
         ******************************************************
         */
tc_1:
        mov     DTLB_DMAP_ENTRY1,      %o0
        mov     0x0,    %l0
        mov     0x0,    %g4
        mov     0x0,    %g5
        ldxa    [%o0] 0x5d,     %g4     /* DMMU data access reg */
        ldxa    [%o0] 0x5e,     %g5     /* DMMU Tag read reg */

        setx    0xffffffffffffe000, %l0, %l3
        and     %g5,    %l3,    %l7
	set	0x10,	%l5	
	or	%l5,	%l7,	%l7
        /* demap page, context = nucleus */
        stxa    %g0,    [%l7] 0x5f
        nop

        /* flush */

        /* read the same DMMU TLB entry again */
        set     0x0,    %l1
        set     0x0,    %l2
        set     DTLB_DMAP_ENTRY1,      %o0
        ldxa    [%o0] 0x5d,     %l1     /* DMMU data access reg */
        ldxa    [%o0] 0x5e,     %l2     /* DMMU Tag read reg */

#ifdef SELF_CHECKING
	sub	%l2,	%g5,	%l3
        brnz,a  %l3,    diag_fail       /* not demapped, l2 != 0 */
        nop

	sub	%l1,	%g4,	%l4
        brnz,a  %l4,    diag_fail
        nop
#endif

	/* 
         ******************************************************
	 * demap ctx=reserved,  tlb ctx=necl, g=0, not demaped 
         ******************************************************
         */
tc_2:
        mov     DTLB_DMAP_ENTRY2,      %o0
        mov     0x0,    %l0
        mov     0x0,    %g4
        mov     0x0,    %g5
        ldxa    [%o0] 0x5d,     %g4     /* DMMU data access reg */
        ldxa    [%o0] 0x5e,     %g5     /* DMMU Tag read reg */

        setx    0xffffffffffffe000, %l0, %l3
        and     %g5,    %l3,    %l7
	set	0x30,	%l5
	or	%l5,	%l7,	%l7
        /* demap page, context = nucleus */
        stxa    %g0,    [%l7] 0x5f
        nop

        /* flush */

        /* read the same DMMU TLB entry again */
        set     0x0,    %l1
        set     0x0,    %l2
        set     DTLB_DMAP_ENTRY2,      %o0
        ldxa    [%o0] 0x5d,     %l1     /* DMMU data access reg */
        ldxa    [%o0] 0x5e,     %l2     /* DMMU Tag read reg */

#ifdef SELF_CHECKING
	sub	%l2,	%g5,	%l3
        brnz,a  %l3,    diag_fail       /* not demapped, l2 != 0 */
        nop

	sub	%l1,	%g4,	%l4
        brnz,a  %l4,    diag_fail
        nop
#endif

	/* 
         ******************************************************
	 * demap ctx=necl,  tlb ctx=necl, g=0, demaped 
         ******************************************************
         */
tc_3:
        mov     DTLB_DMAP_ENTRY2,      %o0
        mov     0x0,    %l0
        mov     0x0,    %g4
        mov     0x0,    %g5
        ldxa    [%o0] 0x5d,     %g4     /* DMMU data access reg */
        ldxa    [%o0] 0x5e,     %g5     /* DMMU Tag read reg */

        setx    0xffffffffffffe000, %l0, %l3
        and     %g5,    %l3,    %l7
	set	0x20,	%l5
	or	%l5,	%l7,	%l7
        /* demap page, context = nucleus */
        stxa    %g0,    [%l7] 0x5f
        nop

        /* flush */

        /* read the same DMMU TLB entry again */
        set     0x0,    %l1
        set     0x0,    %l2
        set     DTLB_DMAP_ENTRY2,      %o0
        ldxa    [%o0] 0x5d,     %l1     /* DMMU data access reg */
#if 0
        ldxa    [%o0] 0x5e,     %l2     /* DMMU Tag read reg */

        brnz,a   %l2,    diag_fail       /*  demapped, l2 = 0 */
        nop
#endif

#ifdef SELF_CHECKING
        srlx    %l1,    30,     %l3
        srlx    %l3,    30,     %l4
        /* bit 63 (valid bit) should  = 0 , since entry is  demapped */
        brnz,a   %l4,    diag_fail
        nop
#endif

        /* restore the entry */
        mov     0x30,   %o2
        stxa    %g5,    [%o2] 0x58
        stxa    %g4,    [%o0] 0x5d

	/* 
 	 ******************************************************
	 * demap ctx=prim, tlb ctx=necl, g=1, demaped 
 	 ******************************************************
	 */
tc_4:

        mov     DTLB_DMAP_ENTRY3,      %o0
        mov     0x0,    %l0
        mov     0x0,    %g4
        mov     0x0,    %g5
        ldxa    [%o0] 0x5d,     %g4     /* DMMU data access reg */
        ldxa    [%o0] 0x5e,     %g5     /* DMMU Tag read reg */

        setx    0xffffffffffffe000, %l0, %l3
        and     %g5,    %l3,    %l7
        /* demap page, demap context = prim */
        stxa    %g0,    [%l7] 0x5f
        nop

        /* flush */

        /* read the same DMMU TLB entry again */
        set     0x0,    %l1
        set     0x0,    %l2
        set     DTLB_DMAP_ENTRY3,      %o0
        ldxa    [%o0] 0x5d,     %l1     /* DMMU data access reg */
#if 0
        ldxa    [%o0] 0x5e,     %l2     /* DMMU Tag read reg */

        brnz,a   %l2,    diag_fail       /*  demapped, l2 = 0 */
        nop
#endif

#ifdef SELF_CHECKING
        srlx    %l1,    30,     %l3
        srlx    %l3,    30,     %l4
        /* bit 63 (valid bit) should  = 0 , since entry is  demapped */
        brnz,a   %l4,    diag_fail
        nop
#endif

        /* restore the entry */
        mov     0x30,   %o2
        stxa    %g5,    [%o2] 0x58
        stxa    %g4,    [%o0] 0x5d

tc_4_0:
	/* page mismatch , not demaped */
        mov     DTLB_DMAP_ENTRY3,      %o0
        mov     0x0,    %l0
        mov     0x0,    %g4
        mov     0x0,    %g5
        ldxa    [%o0] 0x5d,     %g4     /* DMMU data access reg */
        ldxa    [%o0] 0x5e,     %g5     /* DMMU Tag read reg */

        setx    0xffffffffffffe000, %l0, %l3
        and     %g5,    %l3,    %l7
	set	0x10110000,	%l1
	add	%l7,	%l1,	%l7
        /* demap page, demap context = prim */
        stxa    %g0,    [%l7] 0x5f
        nop

        /* flush */

        /* read the same DMMU TLB entry again */
        set     0x0,    %l1
        set     0x0,    %l2
        set     DTLB_DMAP_ENTRY3,      %o0
        ldxa    [%o0] 0x5d,     %l1     /* DMMU data access reg */

#ifdef SELF_CHECKING
        srlx    %l1,    30,     %l3
        srlx    %l3,    30,     %l4
        /* bit 63 (valid bit) should  != 0 , since entry is not demapped */
        brz,a   %l4,    diag_fail
        nop
#endif

	/* 
	 ************************************************************
	 * demap ctx=sec,  tlb ctx=necl, g=1, demaped 
	 ************************************************************
	 */
tc_5:
        mov     DTLB_DMAP_ENTRY4,      %o0
        mov     0x0,    %l0
        mov     0x0,    %g4
        mov     0x0,    %g5
        ldxa    [%o0] 0x5d,     %g4     /* DMMU data access reg */
        ldxa    [%o0] 0x5e,     %g5     /* DMMU Tag read reg */

        setx    0xffffffffffffe000, %l0, %l3
        and     %g5,    %l3,    %l7
	set	0x10,	%l5
	or	%l5,	%l7,	%l7
        /* demap page, demap context = prim */
        stxa    %g0,    [%l7] 0x5f
        nop

        /* flush */

        /* read the same DMMU TLB entry again */
        set     0x0,    %l1
        set     0x0,    %l2
        set     DTLB_DMAP_ENTRY4,      %o0
        ldxa    [%o0] 0x5d,     %l1     /* DMMU data access reg */
#if 0
        ldxa    [%o0] 0x5e,     %l2     /* DMMU Tag read reg */

        brnz,a   %l2,    diag_fail       /*  demapped, l2 = 0 */
        nop
#endif

#ifdef SELF_CHECKING
        srlx    %l1,    30,     %l3
        srlx    %l3,    30,     %l4
        /* bit 63 (valid bit) should  = 0 , since entry is  demapped */
        brnz,a   %l4,    diag_fail
        nop
#endif
        /* restore the entry */
        mov     0x30,   %o2
        stxa    %g5,    [%o2] 0x58
        stxa    %g4,    [%o0] 0x5d

tc_5_1:
	/* page mismatch , not demaped */
        mov     DTLB_DMAP_ENTRY4,      %o0
        mov     0x0,    %l0
        mov     0x0,    %g4
        mov     0x0,    %g5
        ldxa    [%o0] 0x5d,     %g4     /* DMMU data access reg */
        ldxa    [%o0] 0x5e,     %g5     /* DMMU Tag read reg */

        setx    0xffffffffffffe000, %l0, %l3
        and     %g5,    %l3,    %l7
	set	0x10,	%l5
	or	%l5,	%l7,	%l7
	set	0x10110000,	%l5
	or	%l5,	%l7,	%l7
        /* demap page, demap context = prim */
        stxa    %g0,    [%l7] 0x5f
        nop

        /* flush */

        /* read the same DMMU TLB entry again */
        set     0x0,    %l1
        set     0x0,    %l2
        set     DTLB_DMAP_ENTRY4,      %o0
        ldxa    [%o0] 0x5d,     %l1     /* DMMU data access reg */

#ifdef SELF_CHECKING
        srlx    %l1,    30,     %l3
        srlx    %l3,    30,     %l4
        /* bit 63 (valid bit) should  != 0 , since entry is not demapped */
        brz   	%l4,    diag_fail
        nop
#endif

	/* 
         ******************************************************
	 * demap ctx=reserved,  tlb ctx=necl, g=1, not demaped 
         ******************************************************
         */
tc_6:
        mov     DTLB_DMAP_ENTRY3,      %o0
        mov     0x0,    %l0
        mov     0x0,    %g4
        mov     0x0,    %g5
        ldxa    [%o0] 0x5d,     %g4     /* DMMU data access reg */
        ldxa    [%o0] 0x5e,     %g5     /* DMMU Tag read reg */

        setx    0xffffffffffffe000, %l0, %l3
        and     %g5,    %l3,    %l7
        set     0x30,   %l5
        or      %l5,    %l7,    %l7
        /* demap page, context = nucleus */
        stxa    %g0,    [%l7] 0x5f
        nop

        /* flush */

        /* read the same DMMU TLB entry again */
        set     0x0,    %l1
        set     0x0,    %l2
        set     DTLB_DMAP_ENTRY3,      %o0
        ldxa    [%o0] 0x5d,     %l1     /* DMMU data access reg */
        ldxa    [%o0] 0x5e,     %l2     /* DMMU Tag read reg */

#ifdef SELF_CHECKING
        sub     %l2,    %g5,    %l3
        brnz,a  %l3,    diag_fail       /* not demapped, l2 != 0 */
        nop

        sub     %l1,    %g4,    %l4
        brnz,a  %l4,    diag_fail
        nop
#endif

	/* 
         ******************************************************
	 * demap ctx=necl,  tlb ctx=necl, g=1, demaped 
         ******************************************************
         */
tc_7:
        mov     DTLB_DMAP_ENTRY4,      %o0
        mov     0x0,    %l0
        mov     0x0,    %g4
        mov     0x0,    %g5
        ldxa    [%o0] 0x5d,     %g4     /* DMMU data access reg */
        ldxa    [%o0] 0x5e,     %g5     /* DMMU Tag read reg */

        setx    0xffffffffffffe000, %l0, %l3
        and     %g5,    %l3,    %l7
        set     0x20,   %l5
        or      %l5,    %l7,    %l7
        /* demap page, context = nucleus */
        stxa    %g0,    [%l7] 0x5f
        nop

        /* flush */

        /* read the same DMMU TLB entry again */
        set     0x0,    %l1
        set     0x0,    %l2
        set     DTLB_DMAP_ENTRY4,      %o0
        ldxa    [%o0] 0x5d,     %l1     /* DMMU data access reg */
#if 0
        ldxa    [%o0] 0x5e,     %l2     /* DMMU Tag read reg */

        brnz,a   %l2,    diag_fail       /*  demapped, l2 = 0 */
        nop
#endif

#ifdef SELF_CHECKING
        srlx    %l1,    30,     %l3
        srlx    %l3,    30,     %l4
        /* bit 63 (valid bit) should  = 0 , since entry is  demapped */
        brnz,a   %l4,    diag_fail
        nop
#endif

        /* restore the entry */
        mov     0x30,   %o2
        stxa    %g5,    [%o2] 0x58
        stxa    %g4,    [%o0] 0x5d


	/* 
         ******************************************************
	 * demap ctx=prim, tlb ctx=prim, g=0, demaped 
         ******************************************************
         */
tc_8:
        mov     DTLB_DMAP_ENTRY5,      %o0
        mov     0x0,    %l0
        mov     0x0,    %g4
        mov     0x0,    %g5
        ldxa    [%o0] 0x5d,     %g4     /* DMMU data access reg */
        ldxa    [%o0] 0x5e,     %g5     /* DMMU Tag read reg */

        setx    0xffffffffffffe000, %l0, %l3
        and     %g5,    %l3,    %l7
        /* demap page, context = prim */
        stxa    %g0,    [%l7] 0x5f
        nop

        /* flush */

        /* read the same DMMU TLB entry again */
        set     0x0,    %l1
        set     0x0,    %l2
        set     DTLB_DMAP_ENTRY5,      %o0
        ldxa    [%o0] 0x5d,     %l1     /* DMMU data access reg */
#if 0
        ldxa    [%o0] 0x5e,     %l2     /* DMMU Tag read reg */

        brnz,a   %l2,    diag_fail       /*  demapped, l2 = 0 */
        nop
#endif

#ifdef SELF_CHECKING
        srlx    %l1,    30,     %l3
        srlx    %l3,    30,     %l4
        /* bit 63 (valid bit) should  = 0 , since entry is  demapped */
        brnz,a   %l4,    diag_fail
        nop
#endif

        /* restore the entry */
        mov     0x30,   %o2
        stxa    %g5,    [%o2] 0x58
        stxa    %g4,    [%o0] 0x5d

	/* 
         ******************************************************
	 * demap ctx=prim, tlb ctx=prim, g=1, demaped 
         ******************************************************
	 */
tc_9:
        mov     DTLB_DMAP_ENTRY7,      %o0
        mov     0x0,    %l0
        mov     0x0,    %g4
        mov     0x0,    %g5
        ldxa    [%o0] 0x5d,     %g4     /* DMMU data access reg */
        ldxa    [%o0] 0x5e,     %g5     /* DMMU Tag read reg */

        setx    0xffffffffffffe000, %l0, %l3
        and     %g5,    %l3,    %l7
        /* demap page, context = prim */
        stxa    %g0,    [%l7] 0x5f
        nop

        /* flush */

        /* read the same DMMU TLB entry again */
        set     0x0,    %l1
        set     0x0,    %l2
        set     DTLB_DMAP_ENTRY7,      %o0
        ldxa    [%o0] 0x5d,     %l1     /* DMMU data access reg */
#if 0
        ldxa    [%o0] 0x5e,     %l2     /* DMMU Tag read reg */

        brnz,a   %l2,    diag_fail       /*  demapped, l2 = 0 */
        nop
#endif

#ifdef SELF_CHECKING
        srlx    %l1,    30,     %l3
        srlx    %l3,    30,     %l4
        /* bit 63 (valid bit) should  = 0 , since entry is  demapped */
        brnz,a   %l4,    diag_fail
        nop
#endif

        /* restore the entry */
        mov     0x30,   %o2
        stxa    %g5,    [%o2] 0x58
        stxa    %g4,    [%o0] 0x5d

	/* 
         ******************************************************
	 * demap ctx=sec,  tlb ctx=prim, g=0, not demaped 
         ******************************************************
	 */
tc_10:
        mov     DTLB_DMAP_ENTRY6,      %o0
        mov     0x0,    %l0
        mov     0x0,    %g4
        mov     0x0,    %g5
        ldxa    [%o0] 0x5d,     %g4     /* DMMU data access reg */
        ldxa    [%o0] 0x5e,     %g5     /* DMMU Tag read reg */

        setx    0xffffffffffffe000, %l0, %l3
        and     %g5,    %l3,    %l7
        set     0x10,   %l5	
        or      %l5,    %l7,    %l7
        /* demap page, context = nucleus */
        stxa    %g0,    [%l7] 0x5f
        nop

        /* flush */

        /* read the same DMMU TLB entry again */
        set     0x0,    %l1
        set     0x0,    %l2
        set     DTLB_DMAP_ENTRY6,      %o0
        ldxa    [%o0] 0x5d,     %l1     /* DMMU data access reg */
        ldxa    [%o0] 0x5e,     %l2     /* DMMU Tag read reg */

#ifdef SELF_CHECKING
        sub     %l2,    %g5,    %l3
        brnz,a  %l3,    diag_fail       /* not demapped, l2 != 0 */
        nop

        sub     %l1,    %g4,    %l4
        brnz,a  %l4,    diag_fail
        nop
#endif


	/* 
         ******************************************************
	 * demap ctx=sec,  tlb ctx=prim, g=1, demaped 
         ******************************************************
	 */
tc_11:
        mov     DTLB_DMAP_ENTRY7,      %o0
        mov     0x0,    %l0
        mov     0x0,    %g4
        mov     0x0,    %g5
        ldxa    [%o0] 0x5d,     %g4     /* DMMU data access reg */
        ldxa    [%o0] 0x5e,     %g5     /* DMMU Tag read reg */

        setx    0xffffffffffffe000, %l0, %l3
        and     %g5,    %l3,    %l7
        set     0x10,   %l5
        or      %l5,    %l7,    %l7
        /* demap page, context = nucleus */
        stxa    %g0,    [%l7] 0x5f
        nop

        /* flush */

        /* read the same DMMU TLB entry again */
        set     0x0,    %l1
        set     0x0,    %l2
        set     DTLB_DMAP_ENTRY7,      %o0
        ldxa    [%o0] 0x5d,     %l1     /* DMMU data access reg */
#if 0
        ldxa    [%o0] 0x5e,     %l2     /* DMMU Tag read reg */

        brnz,a   %l2,    diag_fail       /*  demapped, l2 = 0 */
        nop
#endif

#ifdef SELF_CHECKING
        srlx    %l1,    30,     %l3
        srlx    %l3,    30,     %l4
        /* bit 63 (valid bit) should  = 0 , since entry is  demapped */
        brnz,a   %l4,    diag_fail
        nop
#endif

        /* restore the entry */
        mov     0x30,   %o2
        stxa    %g5,    [%o2] 0x58
        stxa    %g4,    [%o0] 0x5d


	/* 
         ******************************************************
	 * demap ctx=reserved,  tlb ctx=prim, g=0, not demaped 
         ******************************************************
         */
tc_12:
        mov     DTLB_DMAP_ENTRY6,      %o0
        mov     0x0,    %l0
        mov     0x0,    %g4
        mov     0x0,    %g5
        ldxa    [%o0] 0x5d,     %g4     /* DMMU data access reg */
        ldxa    [%o0] 0x5e,     %g5     /* DMMU Tag read reg */

        setx    0xffffffffffffe000, %l0, %l3
        and     %g5,    %l3,    %l7
        set     0x30,   %l5
        or      %l5,    %l7,    %l7
        /* demap page, context = nucleus */
        stxa    %g0,    [%l7] 0x5f
        nop

        /* flush */

        /* read the same DMMU TLB entry again */
        set     0x0,    %l1
        set     0x0,    %l2
        set     DTLB_DMAP_ENTRY6,      %o0
        ldxa    [%o0] 0x5d,     %l1     /* DMMU data access reg */
        ldxa    [%o0] 0x5e,     %l2     /* DMMU Tag read reg */

#ifdef SELF_CHECKING
        sub     %l2,    %g5,    %l3
        brnz,a  %l3,    diag_fail       /* not demapped, l2 != 0 */
        nop

        sub     %l1,    %g4,    %l4
        brnz,a  %l4,    diag_fail
        nop
#endif


	/* 
         ******************************************************
	 * demap ctx=reserved,  tlb ctx=prim, g=1, not demaped 
         ******************************************************
         */
tc_13:
        mov     DTLB_DMAP_ENTRY7,      %o0
        mov     0x0,    %l0
        mov     0x0,    %g4
        mov     0x0,    %g5
        ldxa    [%o0] 0x5d,     %g4     /* DMMU data access reg */
        ldxa    [%o0] 0x5e,     %g5     /* DMMU Tag read reg */

        setx    0xffffffffffffe000, %l0, %l3
        and     %g5,    %l3,    %l7
        set     0x30,   %l5
        or      %l5,    %l7,    %l7
        /* demap page, context = nucleus */
        stxa    %g0,    [%l7] 0x5f
        nop

        /* flush */

        /* read the same DMMU TLB entry again */
        set     0x0,    %l1
        set     0x0,    %l2
        set     DTLB_DMAP_ENTRY7,      %o0
        ldxa    [%o0] 0x5d,     %l1     /* DMMU data access reg */
        ldxa    [%o0] 0x5e,     %l2     /* DMMU Tag read reg */

#ifdef SELF_CHECKING
        sub     %l2,    %g5,    %l3
        brnz,a  %l3,    diag_fail       /* not demapped, l2 != 0 */
        nop

        sub     %l1,    %g4,    %l4
        brnz,a  %l4,    diag_fail
        nop
#endif

	/* 
         ******************************************************
	 * demap ctx=necl,  tlb ctx=prim, g=0, not demaped 
         ******************************************************
         */
tc_14:
        mov     DTLB_DMAP_ENTRY5,      %o0
        mov     0x0,    %l0
        mov     0x0,    %g4
        mov     0x0,    %g5
        ldxa    [%o0] 0x5d,     %g4     /* DMMU data access reg */
        ldxa    [%o0] 0x5e,     %g5     /* DMMU Tag read reg */

        setx    0xffffffffffffe000, %l0, %l3
        and     %g5,    %l3,    %l7
        set     0x20,   %l5
        or      %l5,    %l7,    %l7
        stxa    %g0,    [%l7] 0x5f
        nop

        /* flush */

        /* read the same DMMU TLB entry again */
        set     0x0,    %l1
        set     0x0,    %l2
        set     DTLB_DMAP_ENTRY5,      %o0
        ldxa    [%o0] 0x5d,     %l1     /* DMMU data access reg */
        ldxa    [%o0] 0x5e,     %l2     /* DMMU Tag read reg */

#ifdef SELF_CHECKING
        sub     %l2,    %g5,    %l3
        brnz,a  %l3,    diag_fail       /* not demapped, l2 != 0 */
        nop

        sub     %l1,    %g4,    %l4
        brnz,a  %l4,    diag_fail
        nop
#endif

	/* 
         ************************************************************
	 * demap ctx=necl,  tlb ctx=prim, g=1, demaped 
         ************************************************************
         */
tc_15:
        mov     DTLB_DMAP_ENTRY8,      %o0
        mov     0x0,    %l0
        mov     0x0,    %g4
        mov     0x0,    %g5
        ldxa    [%o0] 0x5d,     %g4     /* DMMU data access reg */
        ldxa    [%o0] 0x5e,     %g5     /* DMMU Tag read reg */

        setx    0xffffffffffffe000, %l0, %l3
        and     %g5,    %l3,    %l7
        set     0x10,   %l5
        or      %l5,    %l7,    %l7
        stxa    %g0,    [%l7] 0x5f
        nop

        /* flush */

        /* read the same DMMU TLB entry again */
        set     0x0,    %l1
        set     0x0,    %l2
        set     DTLB_DMAP_ENTRY8,      %o0
        ldxa    [%o0] 0x5d,     %l1     /* DMMU data access reg */
#if 0
        ldxa    [%o0] 0x5e,     %l2     /* DMMU Tag read reg */

        brnz,a   %l2,    diag_fail       /*  demapped, l2 = 0 */
        nop
#endif

#ifdef SELF_CHECKING
        srlx    %l1,    30,     %l3
        srlx    %l3,    30,     %l4
        /* bit 63 (valid bit) should  = 0 , since entry is  demapped */
        brnz,a   %l4,    diag_fail
        nop
#endif

        /* restore the entry */
        mov     0x30,   %o2
        stxa    %g5,    [%o2] 0x58
        stxa    %g4,    [%o0] 0x5d

#define	DTLB_DMAP_ENTRY9	0x120	/* L=0 G=0 ctx=SEC */
#define	DTLB_DMAP_ENTRY10	0x160	/* L=1 G=0 ctx=SEC */
#define	DTLB_DMAP_ENTRY11	0x190	/* L=0 G=1 ctx=SEC */
#define	DTLB_DMAP_ENTRY12	0x1e0	/* L=1 G=1 ctx=SEC */

	/* 
         ******************************************************
	 * demap ctx=prim, tlb ctx=sec, g=0, not demaped 
         ******************************************************
         */
tc_16:
        mov     DTLB_DMAP_ENTRY9,      %o0
        mov     0x0,    %l0
        mov     0x0,    %g4
        mov     0x0,    %g5
        ldxa    [%o0] 0x5d,     %g4     /* DMMU data access reg */
        ldxa    [%o0] 0x5e,     %g5     /* DMMU Tag read reg */

        setx    0xffffffffffffe000, %l0, %l3
        and     %g5,    %l3,    %l7
	set	0x10,	%l5
	or	%l5,	%l7,	%l5
        /* demap page, context = nucleus */
        stxa    %g0,    [%l7] 0x5f
        nop

        /* flush */

        /* read the same DMMU TLB entry again */
        set     0x0,    %l1
        set     0x0,    %l2
        set     DTLB_DMAP_ENTRY9,      %o0
        ldxa    [%o0] 0x5d,     %l1     /* DMMU data access reg */
        ldxa    [%o0] 0x5e,     %l2     /* DMMU Tag read reg */

#ifdef SELF_CHECKING
        brz,a   %l2,    diag_fail       /* not demapped, l2 != 0 */
        nop

        srlx    %l1,    30,     %l3
        srlx    %l3,    30,     %l4
        /* bit 63 (valid bit) should not = 0 , since entry is not demapped */
        brz,a  %l4,    diag_fail
        nop
#endif

        mov     DTLB_DMAP_ENTRY10,      %o0
        mov     0x0,    %l0
        mov     0x0,    %g4
        mov     0x0,    %g5
        ldxa    [%o0] 0x5d,     %g4     /* DMMU data access reg */
        ldxa    [%o0] 0x5e,     %g5     /* DMMU Tag read reg */

        setx    0xffffffffffffe000, %l0, %l3
        and     %g5,    %l3,    %l7
	set	0x10,	%l5
	or	%l5,	%l7,	%l5
        stxa    %g0,    [%l7] 0x5f
        nop

        /* flush */

        /* read the same DMMU TLB entry again */
        set     0x0,    %l1
        set     0x0,    %l2
        set     DTLB_DMAP_ENTRY10,      %o0
        ldxa    [%o0] 0x5d,     %l1     /* DMMU data access reg */
        ldxa    [%o0] 0x5e,     %l2     /* DMMU Tag read reg */

#ifdef SELF_CHECKING
        brz,a   %l2,    diag_fail       /* not demapped, l2 != 0 */
        nop

        srlx    %l1,    30,     %l3
        srlx    %l3,    30,     %l4
        /* bit 63 (valid bit) should not = 0 , since entry is not demapped */
        brz,a  %l4,    diag_fail
        nop
#endif
	/* 
         ******************************************************
	 * demap ctx=prim, tlb ctx=sec, g=1, demaped 
         ******************************************************
         */
tc_17:
        mov     DTLB_DMAP_ENTRY11,      %o0
        mov     0x0,    %l0
        mov     0x0,    %g4
        mov     0x0,    %g5
        ldxa    [%o0] 0x5d,     %g4     /* DMMU data access reg */
        ldxa    [%o0] 0x5e,     %g5     /* DMMU Tag read reg */

        setx    0xffffffffffffe000, %l0, %l3
        and     %g5,    %l3,    %l7
        stxa    %g0,    [%l7] 0x5f
        nop

        /* flush */

        /* read the same DMMU TLB entry again */
        set     0x0,    %l1
        set     0x0,    %l2
        set     DTLB_DMAP_ENTRY11,      %o0
        ldxa    [%o0] 0x5d,     %l1     /* DMMU data access reg */
#if 0
        ldxa    [%o0] 0x5e,     %l2     /* DMMU Tag read reg */

        brnz,a   %l2,    diag_fail       /*  demapped, l2 = 0 */
        nop
#endif

#ifdef SELF_CHECKING
        srlx    %l1,    30,     %l3
        srlx    %l3,    30,     %l4
        /* bit 63 (valid bit) should  = 0 , since entry is  demapped */
        brnz,a   %l4,    diag_fail
        nop
#endif

        /* restore the entry */
        mov     0x30,   %o2
        stxa    %g5,    [%o2] 0x58
        stxa    %g4,    [%o0] 0x5d

	/*
	 * demap another page with L =1 G=1
	 */
        mov     DTLB_DMAP_ENTRY12,      %o0
        mov     0x0,    %l0
        mov     0x0,    %g4
        mov     0x0,    %g5
        ldxa    [%o0] 0x5d,     %g4     /* DMMU data access reg */
        ldxa    [%o0] 0x5e,     %g5     /* DMMU Tag read reg */

        setx    0xffffffffffffe000, %l0, %l3
        and     %g5,    %l3,    %l7
        stxa    %g0,    [%l7] 0x5f
        nop

        /* flush */

        /* read the same DMMU TLB entry again */
        set     0x0,    %l1
        set     0x0,    %l2
        set     DTLB_DMAP_ENTRY12,      %o0
        ldxa    [%o0] 0x5d,     %l1     /* DMMU data access reg */
#if 0
        ldxa    [%o0] 0x5e,     %l2     /* DMMU Tag read reg */

        brnz,a   %l2,    diag_fail       /*  demapped, l2 = 0 */
        nop
#endif

#ifdef SELF_CHECKING
        srlx    %l1,    30,     %l3
        srlx    %l3,    30,     %l4
        /* bit 63 (valid bit) should  = 0 , since entry is  demapped */
        brnz,a   %l4,    diag_fail
        nop
#endif

        /* restore the entry */
        mov     0x30,   %o2
        stxa    %g5,    [%o2] 0x58
        stxa    %g4,    [%o0] 0x5d

	/* 
         ******************************************************	
	 * demap ctx=sec,  tlb ctx=sec, g=0, demaped 
         ******************************************************	
	 */
tc_18:
        mov     DTLB_DMAP_ENTRY9,      %o0
        mov     0x0,    %l0
        mov     0x0,    %g4
        mov     0x0,    %g5
        ldxa    [%o0] 0x5d,     %g4     /* DMMU data access reg */
        ldxa    [%o0] 0x5e,     %g5     /* DMMU Tag read reg */

        setx    0xffffffffffffe000, %l0, %l3
        and     %g5,    %l3,    %l7
	set	0x10,	%l5
	or	%l5,	%l7,	%l7
        stxa    %g0,    [%l7] 0x5f
        nop

        /* flush */

        /* read the same DMMU TLB entry again */
        set     0x0,    %l1
        set     0x0,    %l2
        set     DTLB_DMAP_ENTRY9,      %o0
        ldxa    [%o0] 0x5d,     %l1     /* DMMU data access reg */
#if 0
        ldxa    [%o0] 0x5e,     %l2     /* DMMU Tag read reg */

        brnz,a   %l2,    diag_fail       /*  demapped, l2 = 0 */
        nop
#endif

#ifdef SELF_CHECKING
        srlx    %l1,    30,     %l3
        srlx    %l3,    30,     %l4
        /* bit 63 (valid bit) should  = 0 , since entry is  demapped */
        brnz,a   %l4,    diag_fail
        nop
#endif

        /* restore the entry */
        mov     0x30,   %o2
        stxa    %g5,    [%o2] 0x58
        stxa    %g4,    [%o0] 0x5d

	/*
	 * demap another page with g=0  L=1
	 */
        mov     DTLB_DMAP_ENTRY10,      %o0
        mov     0x0,    %l0
        mov     0x0,    %g4
        mov     0x0,    %g5
        ldxa    [%o0] 0x5d,     %g4     /* DMMU data access reg */
        ldxa    [%o0] 0x5e,     %g5     /* DMMU Tag read reg */

        setx    0xffffffffffffe000, %l0, %l3
        and     %g5,    %l3,    %l7
	set	0x10,	%l5
	or	%l5,	%l7,	%l7
        stxa    %g0,    [%l7] 0x5f
        nop

        /* flush */

        /* read the same DMMU TLB entry again */
        set     0x0,    %l1
        set     0x0,    %l2
        set     DTLB_DMAP_ENTRY10,      %o0
        ldxa    [%o0] 0x5d,     %l1     /* DMMU data access reg */
#if 0
        ldxa    [%o0] 0x5e,     %l2     /* DMMU Tag read reg */

        brnz,a   %l2,    diag_fail       /*  demapped, l2 = 0 */
        nop
#endif

#ifdef SELF_CHECKING
        srlx    %l1,    30,     %l3
        srlx    %l3,    30,     %l4
        /* bit 63 (valid bit) should  = 0 , since entry is  demapped */
        brnz,a   %l4,    diag_fail
        nop
#endif

        /* restore the entry */
        mov     0x30,   %o2
        stxa    %g5,    [%o2] 0x58
        stxa    %g4,    [%o0] 0x5d

	/* 
         ******************************************************	
	 * demap ctx=sec,  tlb ctx=sec, g=1, demaped 
         ******************************************************	
	 */
tc_19:
        mov     DTLB_DMAP_ENTRY11,      %o0
        mov     0x0,    %l0
        mov     0x0,    %g4
        mov     0x0,    %g5
        ldxa    [%o0] 0x5d,     %g4     /* DMMU data access reg */
        ldxa    [%o0] 0x5e,     %g5     /* DMMU Tag read reg */

        setx    0xffffffffffffe000, %l0, %l3
        and     %g5,    %l3,    %l7
	set	0x10,	%l5
	or	%l5,	%l7,	%l7
        stxa    %g0,    [%l7] 0x5f
        nop

        /* flush */

        /* read the same DMMU TLB entry again */
        set     0x0,    %l1
        set     0x0,    %l2
        set     DTLB_DMAP_ENTRY11,      %o0
        ldxa    [%o0] 0x5d,     %l1     /* DMMU data access reg */
#if 0
        ldxa    [%o0] 0x5e,     %l2     /* DMMU Tag read reg */

        brnz,a   %l2,    diag_fail       /*  demapped, l2 = 0 */
        nop
#endif

#ifdef SELF_CHECKING
        srlx    %l1,    30,     %l3
        srlx    %l3,    30,     %l4
        /* bit 63 (valid bit) should  = 0 , since entry is  demapped */
        brnz,a   %l4,    diag_fail
        nop
#endif

        /* restore the entry */
        mov     0x30,   %o2
        stxa    %g5,    [%o2] 0x58
        stxa    %g4,    [%o0] 0x5d

	/*
	 * demap another page with g=0  L=1
	 */
        mov     DTLB_DMAP_ENTRY12,      %o0
        mov     0x0,    %l0
        mov     0x0,    %g4
        mov     0x0,    %g5
        ldxa    [%o0] 0x5d,     %g4     /* DMMU data access reg */
        ldxa    [%o0] 0x5e,     %g5     /* DMMU Tag read reg */

        setx    0xffffffffffffe000, %l0, %l3
        and     %g5,    %l3,    %l7
	set	0x10,	%l5
	or	%l5,	%l7,	%l7
        stxa    %g0,    [%l7] 0x5f
        nop

        /* flush */

        /* read the same DMMU TLB entry again */
        set     0x0,    %l1
        set     0x0,    %l2
        set     DTLB_DMAP_ENTRY12,      %o0
        ldxa    [%o0] 0x5d,     %l1     /* DMMU data access reg */
#if 0
        ldxa    [%o0] 0x5e,     %l2     /* DMMU Tag read reg */

        brnz,a   %l2,    diag_fail       /*  demapped, l2 = 0 */
        nop
#endif

#ifdef SELF_CHECKING
        srlx    %l1,    30,     %l3
        srlx    %l3,    30,     %l4
        /* bit 63 (valid bit) should  = 0 , since entry is  demapped */
        brnz,a   %l4,    diag_fail
        nop
#endif

        /* restore the entry */
        mov     0x30,   %o2
        stxa    %g5,    [%o2] 0x58
        stxa    %g4,    [%o0] 0x5d

	/* 
         ******************************************************
	 * demap ctx=reserved,  tlb ctx=sec, g=0, not demaped 
         ******************************************************
         */
tc_20:
        mov     DTLB_DMAP_ENTRY9,      %o0
        mov     0x0,    %l0
        mov     0x0,    %g4
        mov     0x0,    %g5
        ldxa    [%o0] 0x5d,     %g4     /* DMMU data access reg */
        ldxa    [%o0] 0x5e,     %g5     /* DMMU Tag read reg */

        setx    0xffffffffffffe000, %l0, %l3
        and     %g5,    %l3,    %l7
        set     0x30,   %l5
        or      %l5,    %l7,    %l7
        stxa    %g0,    [%l7] 0x5f
        nop

        /* flush */

        /* read the same DMMU TLB entry again */
        set     0x0,    %l1
        set     0x0,    %l2
        set     DTLB_DMAP_ENTRY9,      %o0
        ldxa    [%o0] 0x5d,     %l1     /* DMMU data access reg */
        ldxa    [%o0] 0x5e,     %l2     /* DMMU Tag read reg */

#ifdef SELF_CHECKING
        sub     %l2,    %g5,    %l3
        brnz,a  %l3,    diag_fail       /* not demapped, l2 != 0 */
        nop

        sub     %l1,    %g4,    %l4
        brnz,a  %l4,    diag_fail
        nop
#endif

	/*
	 * demap G=0 L=1
         */
        mov     DTLB_DMAP_ENTRY10,      %o0
        mov     0x0,    %l0
        mov     0x0,    %g4
        mov     0x0,    %g5
        ldxa    [%o0] 0x5d,     %g4     /* DMMU data access reg */
        ldxa    [%o0] 0x5e,     %g5     /* DMMU Tag read reg */

        setx    0xffffffffffffe000, %l0, %l3
        and     %g5,    %l3,    %l7
        set     0x30,   %l5
        or      %l5,    %l7,    %l7
        /* demap page, context = nucleus */
        stxa    %g0,    [%l7] 0x5f
        nop

        /* flush */

        /* read the same DMMU TLB entry again */
        set     0x0,    %l1
        set     0x0,    %l2
        set     DTLB_DMAP_ENTRY10,      %o0
        ldxa    [%o0] 0x5d,     %l1     /* DMMU data access reg */
        ldxa    [%o0] 0x5e,     %l2     /* DMMU Tag read reg */

#ifdef SELF_CHECKING
        sub     %l2,    %g5,    %l3
        brnz,a  %l3,    diag_fail       /* not demapped, l2 != 0 */
        nop

        sub     %l1,    %g4,    %l4
        brnz,a  %l4,    diag_fail
        nop
#endif

	/* 
         ******************************************************
	 * demap ctx=reserved,  tlb ctx=sec, g=1, not demaped 
         ******************************************************
         */
tc_21:
        mov     DTLB_DMAP_ENTRY11,      %o0
        mov     0x0,    %l0
        mov     0x0,    %g4
        mov     0x0,    %g5
        ldxa    [%o0] 0x5d,     %g4     /* DMMU data access reg */
        ldxa    [%o0] 0x5e,     %g5     /* DMMU Tag read reg */

        setx    0xffffffffffffe000, %l0, %l3
        and     %g5,    %l3,    %l7
        set     0x30,   %l5
        or      %l5,    %l7,    %l7
        stxa    %g0,    [%l7] 0x5f
        nop

        /* flush */

        /* read the same DMMU TLB entry again */
        set     0x0,    %l1
        set     0x0,    %l2
        set     DTLB_DMAP_ENTRY11,      %o0
        ldxa    [%o0] 0x5d,     %l1     /* DMMU data access reg */
        ldxa    [%o0] 0x5e,     %l2     /* DMMU Tag read reg */

#ifdef SELF_CHECKING
        sub     %l2,    %g5,    %l3
        brnz,a  %l3,    diag_fail       /* not demapped, l2 != 0 */
        nop

        sub     %l1,    %g4,    %l4
        brnz,a  %l4,    diag_fail
        nop
#endif
	/*
	 * demap G=0 L=1
         */
        mov     DTLB_DMAP_ENTRY12,      %o0
        mov     0x0,    %l0
        mov     0x0,    %g4
        mov     0x0,    %g5
        ldxa    [%o0] 0x5d,     %g4     /* DMMU data access reg */
        ldxa    [%o0] 0x5e,     %g5     /* DMMU Tag read reg */

        setx    0xffffffffffffe000, %l0, %l3
        and     %g5,    %l3,    %l7
        set     0x30,   %l5
        or      %l5,    %l7,    %l7
        /* demap page, context = nucleus */
        stxa    %g0,    [%l7] 0x5f
        nop

        /* flush */

        /* read the same DMMU TLB entry again */
        set     0x0,    %l1
        set     0x0,    %l2
        set     DTLB_DMAP_ENTRY12,      %o0
        ldxa    [%o0] 0x5d,     %l1     /* DMMU data access reg */
        ldxa    [%o0] 0x5e,     %l2     /* DMMU Tag read reg */

#ifdef SELF_CHECKING
        sub     %l2,    %g5,    %l3
        brnz,a  %l3,    diag_fail       /* not demapped, l2 != 0 */
        nop

        sub     %l1,    %g4,    %l4
        brnz,a  %l4,    diag_fail
        nop
#endif

	/* 
         ******************************************************
	 * demap ctx=necl,  tlb ctx=sec, g=0, not demaped
         ******************************************************
         */
tc_22:
        mov     DTLB_DMAP_ENTRY9,      %o0
        mov     0x0,    %l0
        mov     0x0,    %g4
        mov     0x0,    %g5
        ldxa    [%o0] 0x5d,     %g4     /* DMMU data access reg */
        ldxa    [%o0] 0x5e,     %g5     /* DMMU Tag read reg */

        setx    0xffffffffffffe000, %l0, %l3
        and     %g5,    %l3,    %l7
        set     0x20,   %l5
        or      %l5,    %l7,    %l7
        stxa    %g0,    [%l7] 0x5f
        nop

        /* flush */

        /* read the same DMMU TLB entry again */
        set     0x0,    %l1
        set     0x0,    %l2
        set     DTLB_DMAP_ENTRY9,      %o0
        ldxa    [%o0] 0x5d,     %l1     /* DMMU data access reg */
        ldxa    [%o0] 0x5e,     %l2     /* DMMU Tag read reg */

#ifdef SELF_CHECKING
        sub     %l2,    %g5,    %l3
        brnz,a  %l3,    diag_fail       /* not demapped, l2 != 0 */
        nop

        sub     %l1,    %g4,    %l4
        brnz,a  %l4,    diag_fail
        nop
#endif
	/*
	 * demap G=0 L=1
         */
        mov     DTLB_DMAP_ENTRY10,      %o0
        mov     0x0,    %l0
        mov     0x0,    %g4
        mov     0x0,    %g5
        ldxa    [%o0] 0x5d,     %g4     /* DMMU data access reg */
        ldxa    [%o0] 0x5e,     %g5     /* DMMU Tag read reg */

        setx    0xffffffffffffe000, %l0, %l3
        and     %g5,    %l3,    %l7
        set     0x20,   %l5
        or      %l5,    %l7,    %l7
        /* demap page, context = nucleus */
        stxa    %g0,    [%l7] 0x5f
        nop

        /* flush */

        /* read the same DMMU TLB entry again */
        set     0x0,    %l1
        set     0x0,    %l2
        set     DTLB_DMAP_ENTRY10,      %o0
        ldxa    [%o0] 0x5d,     %l1     /* DMMU data access reg */
        ldxa    [%o0] 0x5e,     %l2     /* DMMU Tag read reg */

#ifdef SELF_CHECKING
        sub     %l2,    %g5,    %l3
        brnz,a  %l3,    diag_fail       /* not demapped, l2 != 0 */
        nop

        sub     %l1,    %g4,    %l4
        brnz,a  %l4,    diag_fail
        nop
#endif

	/* 
         ******************************************************	
	 * demap ctx=necl,  tlb ctx=sec, g=1, demaped 
         ******************************************************	
	 */
tc_23:
        mov     DTLB_DMAP_ENTRY11,      %o0
        mov     0x0,    %l0
        mov     0x0,    %g4
        mov     0x0,    %g5
        ldxa    [%o0] 0x5d,     %g4     /* DMMU data access reg */
        ldxa    [%o0] 0x5e,     %g5     /* DMMU Tag read reg */

        setx    0xffffffffffffe000, %l0, %l3
        and     %g5,    %l3,    %l7
	set	0x20,	%l5
	or	%l5,	%l7,	%l7
        stxa    %g0,    [%l7] 0x5f
        nop

        /* flush */

        /* read the same DMMU TLB entry again */
        set     0x0,    %l1
        set     0x0,    %l2
        set     DTLB_DMAP_ENTRY11,      %o0
        ldxa    [%o0] 0x5d,     %l1     /* DMMU data access reg */
#if 0
        ldxa    [%o0] 0x5e,     %l2     /* DMMU Tag read reg */

        brnz,a   %l2,    diag_fail       /*  demapped, l2 = 0 */
        nop
#endif

#ifdef SELF_CHECKING
        srlx    %l1,    30,     %l3
        srlx    %l3,    30,     %l4
        /* bit 63 (valid bit) should  = 0 , since entry is  demapped */
        brnz,a   %l4,    diag_fail
        nop
#endif

        /* restore the entry */
        mov     0x30,   %o2
        stxa    %g5,    [%o2] 0x58
        stxa    %g4,    [%o0] 0x5d

	/*
	 * demap another page with g=1  L=1
	 */
        mov     DTLB_DMAP_ENTRY12,      %o0
        mov     0x0,    %l0
        mov     0x0,    %g4
        mov     0x0,    %g5
        ldxa    [%o0] 0x5d,     %g4     /* DMMU data access reg */
        ldxa    [%o0] 0x5e,     %g5     /* DMMU Tag read reg */

        setx    0xffffffffffffe000, %l0, %l3
        and     %g5,    %l3,    %l7
	set	0x20,	%l5
	or	%l5,	%l7,	%l7
        stxa    %g0,    [%l7] 0x5f
        nop

        /* flush */

        /* read the same DMMU TLB entry again */
        set     0x0,    %l1
        set     0x0,    %l2
        set     DTLB_DMAP_ENTRY12,      %o0
        ldxa    [%o0] 0x5d,     %l1     /* DMMU data access reg */
#if 0
        ldxa    [%o0] 0x5e,     %l2     /* DMMU Tag read reg */

        brnz,a   %l2,    diag_fail       /*  demapped, l2 = 0 */
        nop
#endif

#ifdef SELF_CHECKING
        srlx    %l1,    30,     %l3
        srlx    %l3,    30,     %l4
        /* bit 63 (valid bit) should  = 0 , since entry is  demapped */
        brnz,a   %l4,    diag_fail
        nop
#endif

        /* restore the entry */
        mov     0x30,   %o2
        stxa    %g5,    [%o2] 0x58
        stxa    %g4,    [%o0] 0x5d

/*
 ************************************************************
 *	Demap DMMU TLB by Context
 ************************************************************
 */
        /*
         *******************************************************************
         *      Demap all the Nucleus Context
         *      entries in the DTLB table
         *
         *      For those DTLB entries with Global bit
         *      set, context=NUCLEUS, the entries will
         *      not be removed.
	 *
	 * 	entries : 0 ~ 7 will be demapped cause G=0
	 * 	entries : 8 ~ 15 will not be demapped since G=1
         *******************************************************************
         */

        set     0x60,   %l7
        stxa    %g0,    [%l7] 0x5f
        nop

	/* flush */

        set     DTLB_CTXDMP_NCLU1,      %o0
chk_dmmu_ncluctx1:
        mov     0x0,    %l1
        mov     0x0,    %l2
        ldxa    [%o0] 0x5d,     %l1     /* IMMU data access reg */
#if 0
        ldxa    [%o0] 0x5e,     %l2     /* IMMU Tag read reg */

        brnz,a  %l2,    diag_fail       /* tag after demapped = 0 */
        nop
#endif
#ifdef SELF_CHECKING
        srlx    %l1,    30,     %l3
        srlx    %l3,    30,     %l3
        brnz,a  %l3,    diag_fail
        nop
#endif

        add     %o0,    0x8,    %o0
        sub     %o0,    DTLB_CTXDMP_NCLU2,      %l4
        brnz,a  %l4,    chk_dmmu_ncluctx1
        nop

chk_dmmu_ncluctx2:
        mov     0x0,    %l1
        mov     0x0,    %l2     
        ldxa    [%o0] 0x5d,     %l1     /* IMMU data access reg */
        ldxa    [%o0] 0x5e,     %l2     /* IMMU Tag read reg */

#ifdef SELF_CHECKING
        brz,a   %l2,    diag_fail       /* not demapped tag!= 0 */
        nop

        srlx    %l1,    30,     %l3
        srlx    %l3,    30,     %l3
        brz,a   %l3,    diag_fail
        nop
#endif

        add     %o0,    0x8,    %o0
        sub     %o0,    DTLB_CTXDMP_NCLU3,      %l4
        brnz,a  %l4,    chk_dmmu_ncluctx2
        nop

        /*
         *******************************************************************
         *      Demap all the Primary Context
         *      entries in the DTLB table
         *
         *      For those DTLB entries with Global bit
         *      set, context=PRIM, the entries will
         *      not be removed.
	 *
	 * 	entries : 16 ~ 23 will be demapped cause G=0
	 * 	entries : 24 ~ 31 will not be demapped since G=1
         *******************************************************************
         */

        set     0x40,   %l7
        stxa    %g0,    [%l7] 0x5f
        nop

	/* flush */

        set     DTLB_CTXDMP_PMRY1,      %o0
chk_dmmu_primctx1:
        mov     0x0,    %l1
        mov     0x0,    %l2
        ldxa    [%o0] 0x5d,     %l1     /* IMMU data access reg */
#if 0
        ldxa    [%o0] 0x5e,     %l2     /* IMMU Tag read reg */

        brnz,a  %l2,    diag_fail       /* tag after demapped = 0 */
        nop
#endif 
#ifdef SELF_CHECKING
        srlx    %l1,    30,     %l3
        srlx    %l3,    30,     %l3
        brnz,a  %l3,    diag_fail
        nop
#endif

        add     %o0,    0x8,    %o0
        sub     %o0,    DTLB_CTXDMP_PMRY2,      %l4
        brnz,a  %l4,    chk_dmmu_primctx1
        nop

chk_dmmu_primctx2:
        mov     0x0,    %l1
        mov     0x0,    %l2     
        ldxa    [%o0] 0x5d,     %l1     /* IMMU data access reg */
        ldxa    [%o0] 0x5e,     %l2     /* IMMU Tag read reg */

#ifdef SELF_CHECKING
        brz,a   %l2,    diag_fail       /* tag after demap != 0 */
        nop

        srlx    %l1,    30,     %l3
        srlx    %l3,    30,     %l3
        brz,a   %l3,    diag_fail
        nop
#endif
        add     %o0,    0x8,    %o0
        sub     %o0,    DTLB_CTXDMP_PMRY3,      %l4
        brnz,a  %l4,    chk_dmmu_primctx2
        nop

        /*
         *******************************************************************
         *      Demap all the Secondary Context
         *      entries in the DTLB table
         *
         *      For those DTLB entries with Global bit
         *      set, context=SEC, the entries will
         *      not be removed.
	 *
	 * 	entries : 32 ~ 47 will be demapped cause G=0
	 * 	entries : 48 ~ 63 will not be demapped since G=1
         *******************************************************************
         */

        set     0x50,   %l7
        stxa    %g0,    [%l7] 0x5f
        nop

	/* flush */

        set     DTLB_CTXDMP_SEC1,      %o0
chk_dmmu_secctx1:
        mov     0x0,    %l1
        mov     0x0,    %l2
        ldxa    [%o0] 0x5d,     %l1     /* IMMU data access reg */
#if 0
        ldxa    [%o0] 0x5e,     %l2     /* IMMU Tag read reg */

        brnz,a  %l2,    diag_fail       /* tag after demapped = 0 */
        nop
#endif

#ifdef SELF_CHECKING
        srlx    %l1,    30,     %l3
        srlx    %l3,    30,     %l3
        brnz,a  %l3,    diag_fail
        nop
#endif
        add     %o0,    0x8,    %o0
        sub     %o0,    DTLB_CTXDMP_SEC2,      %l4
        brnz,a  %l4,    chk_dmmu_secctx1
        nop

chk_dmmu_secctx2:
        mov     0x0,    %l1
        mov     0x0,    %l2     
        ldxa    [%o0] 0x5d,     %l1     /* IMMU data access reg */
        ldxa    [%o0] 0x5e,     %l2     /* IMMU Tag read reg */

#ifdef SELF_CHECKING
        brz,a   %l2,    diag_fail       /* tag not demapped. shouldn't = 0 */
        nop

        srlx    %l1,    30,     %l3
        srlx    %l3,    30,     %l3
        brz,a   %l3,    diag_fail
        nop
#endif

        add     %o0,    0x8,    %o0
        sub     %o0,    DTLB_CTXDMP_SEC3,      %l4
        brnz,a  %l4,    chk_dmmu_secctx2
        nop

/*
 *********************** 
 *    DMMU demap all   *
 *********************** 
 */
        /*
         *********************************************
         *      Demap all the un-locked 
         *      entries in the DTLB table
         *********************************************
         */
        set     0x80,   %l7		/* bit[7:6] = 1_0 */ 
        stxa    %g0,    [%l7] 0x5f
        nop

        /* flush */

	/* read out all the entries in D-TLB table to compare */
	set	0x0,	%l0
	set	0x40,	%l1
	set	0x0,	%l2
rd_dtlb_loop:
	ldxa    [%l2] 0x5d,     %l3
#if 0
        ldxa    [%l2] 0x5e,     %l4
#endif
	
	add	%l2,	0x8,	%l2
	add	%l0,	0x1,	%l0

	sub	%l0,	%l1,	%l3
	brnz,a	%l3,	rd_dtlb_loop
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

