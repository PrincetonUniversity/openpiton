// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: v9_immudmp.s
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

/* since we need to change to hypervisor mode, the main use code has to be hypervisor 
	mode */
#define MAIN_PAGE_HV_ALSO

#include "boot.s"

.text

.global main

#define	ITLB_NCLX1	0x28	/* L=1 , G=0 , CTX=NUCL */
#define	ITLB_NCLX2	0x30	/* L=0 , G=0 , CTX=NUCL */ 
#define	ITLB_NCLX3	0x40	/* L=1,	 G=1 , CTX=NUCL */
#define	ITLB_NCLX4	0x48
#define	ITLB_NCLX5	0x50
#define ITLB_PCTX1	0xa0
#define ITLB_PCTX2	0xa8

#define ITLB_DMPSCTX1	0x160
#define ITLB_DMPSCTX2	0x168

#define	ITLB_CTXDMP_NCLU1	0x28
#define	ITLB_CTXDMP_NCLU2	0x40
#define	ITLB_CTXDMP_NCLU3	0xa0
#define	ITLB_CTXDMP_PMRY1	0xa0
#define	ITLB_CTXDMP_PMRY2	0xe0
#define	ITLB_CTXDMP_PMRY3	0x120
#define	ITLB_CTXDMP_SEC1	0x120
#define	ITLB_CTXDMP_SEC2	0x160
#define	ITLB_CTXDMP_SEC3	0x200

#define SDN_CTX_FIX	0	

main:
	nop
/*
 ********************************************************************
 * Check the DEMAP operation of IMMU 
 ********************************************************************
 */
        /* changed to privilege mode */
        ta      T_CHANGE_HPRIV
        nop

/*
 *****************************************************************************
 *
 *	all the entries in the I-TLB
 *
 *	Entry 		G		L		CTX	
 *   ----------------------------------------------------------------
 *      0--4	not touched, created by boot/main code MMU miss
 *   ----------------------------------------------------------------
 *	5		0		1		NUCLEUS 
 *   ----------------------------------------------------------------
 *	6-7		0		0		NUCLEUS	
 *   ----------------------------------------------------------------
 *	8-19		1		1		NUCLEUS
 *   ----------------------------------------------------------------
 *	20-27		0		1		PCONTEXT
 *   ----------------------------------------------------------------
 *	28-35		1		1		PCONTEXT
 *   ----------------------------------------------------------------
 *	36-43		1		1		SCONTEXT
 *   ----------------------------------------------------------------
 *	44-63		0		1		SCONTEXT
 *   ----------------------------------------------------------------
 ******************************************************************************
 */
        set     0x0,    %l0
        set     0x180000, %l3   /* Tag Access reg */
        setx    0x8000000100180040, %l0, %l4    /* lock bit set */

        set     0x30,    %l2
        set     0x10000, %l7
        set     0x28,   %l1
        set     0x14,   %l5             /* skip the first 5 entries */
        mov     0x30,   %o0

        stxa    %l3,    [%o0] 0x50      /* IMMU Tag Access Reg */
        stxa    %l4,    [%l1] 0x55      /* IMMU Data In Reg */
        ldxa    [%l1]   0x55,   %g4     /* IMMU data access reg */
        ldxa    [%l1]   0x56,   %g5     /* IMMU tag read reg */
!        sub     %l3,    %g5,    %g6
!        brnz,a  %g6,    diag_fail
!        nop
!        sub     %l4,    %g4,    %g6
!        brnz,a  %g6,    diag_fail
!        nop
        add     %l3,    %l7,    %l3
        add     %l4,    %l7,    %l4
        add     %l1,    0x8,    %l1
        add     %l5,    0x4,    %l5

	sub	%l4,	0x40,	%l4	/* lock bit not set */

        stxa    %l3,    [%o0] 0x50      /* IMMU Tag Access Reg */
        stxa    %l4,    [%l1] 0x55      /* IMMU Data In Reg */
        ldxa    [%l1]   0x55,   %g4     /* IMMU data access reg */
        ldxa    [%l1]   0x56,   %g5     /* IMMU tag read reg */
 !       sub     %l3,    %g5,    %g6
 !       brnz,a  %g6,    diag_fail
 !       nop
 !       sub     %l4,    %g4,    %g6
 !       brnz,a  %g6,    diag_fail
 !       nop
        add     %l3,    %l7,    %l3
        add     %l4,    %l7,    %l4
        add     %l1,    0x8,    %l1
        add     %l5,    0x4,    %l5

        stxa    %l3,    [%o0] 0x50      /* IMMU Tag Access Reg */
        stxa    %l4,    [%l1] 0x55      /* IMMU Data In Reg */
        ldxa    [%l1]   0x55,   %g4     /* IMMU data access reg */
        ldxa    [%l1]   0x56,   %g5     /* IMMU tag read reg */
 !       sub     %l3,    %g5,    %g6
 !       brnz,a  %g6,    diag_fail
 !       nop
 !       sub     %l4,    %g4,    %g6
 !       brnz,a  %g6,    diag_fail
 !       nop
        add     %l3,    %l7,    %l3
        add     %l4,    %l7,    %l4
        add     %l1,    0x8,    %l1
        add     %l5,    0x4,    %l5

	add	%l4,	0x41,	%l4	/* set global bit & LOCK bit */

wr_itte1:
        stxa    %l3,    [%o0] 0x50      /* IMMU Tag Access Reg */
        stxa    %l4,    [%l1] 0x55      /* IMMU Data In Reg */

        ldxa    [%l1]   0x55,   %g4     /* IMMU data access reg */
        ldxa    [%l1]   0x56,   %g5     /* IMMU tag read reg */

!        sub     %l3,    %g5,    %g6
!        brnz,a  %g6,    diag_fail
!        nop

!        sub     %l4,    %g4,    %g6
!        brnz,a  %g6,    diag_fail
!        nop

        add     %l3,    %l7,    %l3
        add     %l4,    %l7,    %l4

        add     %l1,    0x8,    %l1
        add     %l5,    0x4,    %l5

        sub     %l5,    0x50,   %l6
        brnz,a  %l6,    wr_itte1
        nop

wr_immu_pctx:
	set	0x0,	%l0
	sub	%l4,	0x1,	%l4
	set	PCONTEXT,	%o1
	or	%o1,	%l3,	%l3	/* changed to Primary Context */

wr_itte2:
        stxa    %l3,    [%o0] 0x50      /* IMMU Tag Access Reg */
        stxa    %l4,    [%l1] 0x55      /* IMMU Data In Reg */

        ldxa    [%l1]   0x55,   %g4     /* IMMU data access reg */
        ldxa    [%l1]   0x56,   %g5     /* IMMU tag read reg */

!        sub     %l3,    %g5,    %g6
!        brnz,a  %g6,    diag_fail
!        nop

!        sub     %l4,    %g4,    %g6
!        brnz,a  %g6,    diag_fail
!        nop

        add     %l3,    %l7,    %l3
        add     %l4,    %l7,    %l4

        add     %l1,    0x8,    %l1

        add     %l5,    0x4,    %l5

	sub	%l5,	0x70,	%l6

	brnz,a	%l6,	wr_itte2
	nop

	add	%l4,	0x1,	%l4	/* these 8 entries have G = 1 */

wr_other8immu_prim:
        stxa    %l3,    [%o0] 0x50      /* IMMU Tag Access Reg */
        stxa    %l4,    [%l1] 0x55      /* IMMU Data In Reg */

        ldxa    [%l1]   0x55,   %g4     /* IMMU data access reg */
        ldxa    [%l1]   0x56,   %g5     /* IMMU tag read reg */

!        sub     %l3,    %g5,    %g6
!        brnz,a  %g6,    diag_fail
!        nop

!        sub     %l4,    %g4,    %g6
!        brnz,a  %g6,    diag_fail
!        nop

        add     %l3,    %l7,    %l3
        add     %l4,    %l7,    %l4

        add     %l1,    0x8,    %l1

        add     %l5,    0x4,    %l5

        sub     %l5,    0x90,  %l6	/* total 16 TLB entries PCONTEXT */
        brnz,a  %l6,    wr_other8immu_prim
        nop

wr_immu_sctx:
	set	0x0,	%l0
	set	PCONTEXT,	%o1
	sub	%l3,	%o1,	%l3	

	set	SCONTEXT,	%o1
	or	%l3,	%o1,	%l3	/* changed to Secondary Context */

wr_itte3:
        stxa    %l3,    [%o0] 0x50      /* IMMU Tag Access Reg */
        stxa    %l4,    [%l1] 0x55      /* IMMU Data In Reg */

        ldxa    [%l1]   0x55,   %g4     /* IMMU data access reg */
        ldxa    [%l1]   0x56,   %g5     /* IMMU tag read reg */

!        sub     %l3,    %g5,    %g6
!        brnz,a  %g6,    diag_fail
!        nop

!        sub     %l4,    %g4,    %g6
!        brnz,a  %g6,    diag_fail
!        nop

        add     %l3,    %l7,    %l3
        add     %l4,    %l7,    %l4

        add     %l1,    0x8,    %l1
        add     %l5,    0x4,    %l5

	sub	%l5,	0xb0,	%l6	/* 8 entries of SCONTEXT are global */
	brnz,a	%l6,	wr_itte3
	nop

	! sub	%l4,	0x1,	%l4
wr_other20immu_sec:
        stxa    %l3,    [%o0] 0x50      /* IMMU Tag Access Reg */
        stxa    %l4,    [%l1] 0x55      /* IMMU Data In Reg */

        ldxa    [%l1]   0x55,   %g4     /* IMMU data access reg */
        ldxa    [%l1]   0x56,   %g5     /* IMMU tag read reg */

!        sub     %l3,    %g5,    %g6
!        brnz,a  %g6,    diag_fail
!        nop

!        sub     %l4,    %g4,    %g6
!        brnz,a  %g6,    diag_fail
!        nop

        add     %l3,    %l7,    %l3
        add     %l4,    %l7,    %l4

        add     %l1,    0x8,    %l1
        add     %l5,    0x4,    %l5

        sub     %l5,    0x100,  %l6	/* total 28 TLB entries of SCONTEXT */
        brnz,a  %l6,    wr_other20immu_sec
        nop

        nop;nop;nop;nop;nop;
        nop;nop;nop;nop;nop;

/* 
 *************************************************
 *	Test the demaping of IMMU page 
 *************************************************
 */ 

	/* 
	 **************************************************
	 * demap a page with L=1 G=0 context=NUCLEUS 
	 **************************************************
	 */
tc_0:
	mov	ITLB_NCLX1,	%o0
	mov	0x0,	%l0
	mov	0x0,	%g4
	mov	0x0,	%g5
	ldxa	[%o0] 0x55,	%g4	/* IMMU data access reg */
	ldxa	[%o0] 0x56,	%g5	/* IMMU Tag read reg */

	setx	0xffffffffffffe000, %l0, %l3	
	and	%g5,	%l3,	%l7
	mov	0x20,	%l5
	or	%l7,	%l5,	%l7
	/* demap page, context = nucleus */ 
	stxa	%g0,	[%l7] 0x57
	nop

	/* flush */

	/* read the same IMMU TLB entry again */
	set	0x0,	%l1	
	set	0x0,	%l2	
	set	ITLB_NCLX1,	%o0
	ldxa	[%o0] 0x55,	%l1	/* IMMU data access reg */
#if 0	/* rtl doesn't write 0 to the demaped entry in ITLB */
	ldxa	[%o0] 0x56,	%l2	/* IMMU Tag read reg */

	brnz,a	%l2,	diag_fail
	nop
#endif

#ifdef SELF_CHECKING
	srlx	%l1,	30,	%l3
	srlx	%l3,	30,	%l4
	srlx	%l4,	3,	%l5	
	/* bit 63 (valid bit) should = 0 after entry is demapped */
	brnz,a	%l5,	diag_fail	
	nop	
#endif

	/* restore the entry */
	mov	0x30,	%o2
	stxa	%g5,	[%o2] 0x50
	stxa	%g4,	[%o0] 0x55
	
tc_0_0:
	/*
	 ********************************************************
 	 * page mismatch, ctx match, not demaped
	 ********************************************************
	 */
	mov	ITLB_NCLX1,	%o0
	mov	0x0,	%l0
	mov	0x0,	%g4
	mov	0x0,	%g5
	ldxa	[%o0] 0x55,	%g4	/* IMMU data access reg */
	ldxa	[%o0] 0x56,	%g5	/* IMMU Tag read reg */

	setx	0xffffffffffffe000, %l0, %l3	
	and	%g5,	%l3,	%l7
	mov	0x20,	%l5
	or	%l7,	%l5,	%l7
	set	0x55000,	%l6
	or	%l7,	%l6,	%l7	/* make the page mismatch */
	/* page mismatch, context match , not demaped */ 
	stxa	%g0,	[%l7] 0x57
	nop

	/* flush */

	/* read the same IMMU TLB entry again */
	set	0x0,	%l1	
	set	0x0,	%l2	
	set	ITLB_NCLX1,	%o0
	ldxa	[%o0] 0x55,	%l1	/* IMMU data access reg */

#ifdef SELF_CHECKING
	srlx	%l1,	30,	%l3
	srlx	%l3,	30,	%l4
	srlx	%l4,	3,	%l5	
	/* bit 63 (valid bit) should != 0 since the entry is not demaped */
	brz	%l5,	diag_fail	
	nop	
#endif

tc_0_1:
	/*
	 ********************************************************
 	 * page match, ctx=prim mismatch, not demaped
	 ********************************************************
	 */
	mov	ITLB_NCLX1,	%o0
	mov	0x0,	%l0
	mov	0x0,	%g4
	mov	0x0,	%g5
	ldxa	[%o0] 0x55,	%g4	/* IMMU data access reg */
	ldxa	[%o0] 0x56,	%g5	/* IMMU Tag read reg */

	setx	0xffffffffffffe000, %l0, %l3	
	and	%g5,	%l3,	%l7
	/* page match, context mismatch , not demaped */ 
	stxa	%g0,	[%l7] 0x57
	nop

	/* flush */

	/* read the same IMMU TLB entry again */
	set	0x0,	%l1	
	set	0x0,	%l2	
	set	ITLB_NCLX1,	%o0
	ldxa	[%o0] 0x55,	%l1	/* IMMU data access reg */

#ifdef SELF_CHECKING
	srlx	%l1,	30,	%l3
	srlx	%l3,	30,	%l4
	srlx	%l4,	3,	%l5	
	/* bit 63 (valid bit) should != 0 since the entry is not demaped */
	brz	%l5,	diag_fail	
	nop	
#endif

tc_0_2:
	/*
	 ********************************************************
 	 * page match, ctx=sec mismatch, not demaped
	 ********************************************************
	 */
	mov	ITLB_NCLX1,	%o0
	mov	0x0,	%l0
	mov	0x0,	%g4
	mov	0x0,	%g5
	ldxa	[%o0] 0x55,	%g4	/* IMMU data access reg */
	ldxa	[%o0] 0x56,	%g5	/* IMMU Tag read reg */

	setx	0xffffffffffffe000, %l0, %l3	
	and	%g5,	%l3,	%l7
	mov	0x10,	%l5
	or	%l5,	%l7,	%l7
	/* page match, context mismatch , not demaped */ 
	stxa	%g0,	[%l7] 0x57
	nop

	/* flush */

	/* read the same IMMU TLB entry again */
	set	0x0,	%l1	
	set	0x0,	%l2	
	set	ITLB_NCLX1,	%o0
	ldxa	[%o0] 0x55,	%l1	/* IMMU data access reg */

#ifdef SELF_CHECKING
	srlx	%l1,	30,	%l3
	srlx	%l3,	30,	%l4
	srlx	%l4,	3,	%l5	
	/* bit 63 (valid bit) should != 0 since the entry is not demaped */
	brz	%l5,	diag_fail	
	nop	
#endif

tc_0_3:
	/*
	 ********************************************************
 	 * page match, ctx=reserved mismatch, not demaped
	 ********************************************************
	 */
	mov	ITLB_NCLX1,	%o0
	mov	0x0,	%l0
	mov	0x0,	%g4
	mov	0x0,	%g5
	ldxa	[%o0] 0x55,	%g4	/* IMMU data access reg */
	ldxa	[%o0] 0x56,	%g5	/* IMMU Tag read reg */

	setx	0xffffffffffffe000, %l0, %l3	
	and	%g5,	%l3,	%l7
	mov	0x10,	%l5
	or	%l5,	%l7,	%l7
	/* page match, context mismatch , not demaped */ 
	stxa	%g0,	[%l7] 0x57
	nop

	/* flush */

	/* read the same IMMU TLB entry again */
	set	0x0,	%l1	
	set	0x0,	%l2	
	set	ITLB_NCLX1,	%o0
	ldxa	[%o0] 0x55,	%l1	/* IMMU data access reg */

#ifdef SELF_CHECKING
	srlx	%l1,	30,	%l3
	srlx	%l3,	30,	%l4
	srlx	%l4,	3,	%l5	
	/* bit 63 (valid bit) should != 0 since the entry is not demaped */
	brz	%l5,	diag_fail	
	nop	
#endif

	/* 
	 **************************************************
	 * demap a page with L=0 G=0 context=NUCLEUS 
	 **************************************************
	 */
tc_1:
	mov	ITLB_NCLX2,	%o0
	mov	0x0,	%l0
	mov	0x0,	%g4
	mov	0x0,	%g5
	ldxa	[%o0] 0x55,	%g4	/* IMMU data access reg */
	ldxa	[%o0] 0x56,	%g5	/* IMMU Tag read reg */

	setx	0xffffffffffffe000, %l0, %l3	
	and	%g5,	%l3,	%l7
	mov	0x20,	%l5
	or	%l7,	%l5,	%l7
	/* demap page, context = nucleus */ 
	stxa	%g0,	[%l7] 0x57
	nop

	/* flush */

	/* read the same IMMU TLB entry again */
	set	0x0,	%l1	
	set	0x0,	%l2	
	set	ITLB_NCLX2,	%o0
	ldxa	[%o0] 0x55,	%l1	/* IMMU data access reg */

#ifdef SELF_CHECKING
	srlx	%l1,	30,	%l3
	srlx	%l3,	30,	%l4
	srlx	%l4,	3,	%l5	
	/* bit 63 (valid bit) should = 0 after entry is demapped */
	brnz,a	%l5,	diag_fail	
	nop	
#endif

	/* restore the entry */
	mov	0x30,	%o2
	stxa	%g5,	[%o2] 0x50
	stxa	%g4,	[%o0] 0x55
	
	/* 
	 **************************************************
	 * demap a page with L=0 G=1 context=NUCLEUS 
	 **************************************************
	 */
tc_2:
	mov	ITLB_NCLX3,	%o0
	mov	0x0,	%l0
	mov	0x0,	%g4
	mov	0x0,	%g5
	ldxa	[%o0] 0x55,	%g4	/* IMMU data access reg */
	ldxa	[%o0] 0x56,	%g5	/* IMMU Tag read reg */

	setx	0xffffffffffffe000, %l0, %l3	
	and	%g5,	%l3,	%l7
	/* 
	 * demap page, demap context = PRIM, since TBL entry bit G =1  
	 * This page will still be demaped. 
	 */ 
	stxa	%g0,	[%l7] 0x57
	nop

	/* flush */

	/* read the same IMMU TLB entry again */
	set	0x0,	%l1	
	set	0x0,	%l2	
	set	ITLB_NCLX3,	%o0
	ldxa	[%o0] 0x55,	%l1	/* IMMU data access reg */

#ifdef SELF_CHECKING
	srlx	%l1,	30,	%l3
	srlx	%l3,	30,	%l4
	srlx	%l4,	3,	%l5	
	/* bit 63 (valid bit) should = 0 after entry is demapped */
	brnz,a	%l5,	diag_fail	
	nop	
#endif

	/* restore the entry */
	mov	0x30,	%o2
	stxa	%g5,	[%o2] 0x50
	stxa	%g4,	[%o0] 0x55

	/* 
	 *************************************************************
	 * demap a page with G=1 context=RESERVED , demap be ignored 
	 *************************************************************
	 */
tc_3:
	mov	ITLB_NCLX4,	%o0
	mov	0x0,	%l0
	mov	0x0,	%g4
	mov	0x0,	%g5
	ldxa	[%o0] 0x55,	%g4	/* IMMU data access reg */
	ldxa	[%o0] 0x56,	%g5	/* IMMU Tag read reg */

	setx	0xffffffffffffe000, %l0, %l3	
	and	%g5,	%l3,	%l7
	mov	0x30,	%l5
	or	%l5,	%l7,	%l7
	/* demap page, context = RESERVED */ 
	stxa	%g0,	[%l7] 0x57
	nop

	/* flush */

	/* read the same IMMU TLB entry again */
	set	ITLB_NCLX4,	%o0
	ldxa	[%o0] 0x55,	%l3	/* IMMU data access reg */
	ldxa	[%o0] 0x56,	%l4	/* IMMU Tag read reg */

!	sub	%l3,	%g4,	%l5	/* entry is not demaped */
!	brnz,a	%l5,	diag_fail
!	nop

!	sub	%l4,	%g5,	%l6	/* entry is not demaped */
!	brnz,a	%l6,	diag_fail
!	nop

	/* 
	 *************************************************************
	 * demap a page with G=1 context=SEC, context is ignored 
	 *************************************************************
	 */
tc_4:
	mov	ITLB_NCLX5,	%o0
	mov	0x0,	%l0
	mov	0x0,	%g4
	mov	0x0,	%g5
	ldxa	[%o0] 0x55,	%g4	/* IMMU data access reg */
	ldxa	[%o0] 0x56,	%g5	/* IMMU Tag read reg */

	setx	0xffffffffffffe000, %l0, %l3	
	and	%g5,	%l3,	%l4
	mov	0x10,	%l5
	or	%l5,	%l4,	%l5
	/* demap page, context = PRIM */ 
	stxa	%g0,	[%l4] 0x57
	nop

	/* flush */

	/* read the same IMMU TLB entry again */
	set	ITLB_NCLX5,	%o0
	ldxa	[%o0] 0x55,	%l3	/* IMMU data access reg */
	ldxa	[%o0] 0x56,	%l4	/* IMMU Tag read reg */

!	sub	%g4,	%l3,	%l5	/* entry is  demaped */
!	brz,a	%l5,	diag_fail
!	nop

	/* restore the entry */
	mov	0x30,	%o2
	stxa	%g5,	[%o2] 0x50
	stxa	%g4,	[%o0] 0x55

tc_5:
	/* demap a page with G=0 context=PRIM */
	mov	ITLB_PCTX1,	%o0
	mov	0x0,	%l0
	mov	0x0,	%g4
	mov	0x0,	%g5
	ldxa	[%o0] 0x55,	%g4	/* IMMU data access reg */
	ldxa	[%o0] 0x56,	%g5	/* IMMU Tag read reg */

	setx	0xffffffffffffe000, %l0, %l3	
	and	%g5,	%l3,	%l7
	/* demap page, context = PRIM */ 
	stxa	%g0,	[%l7] 0x57
	nop

	/* flush */

	/* read the same IMMU TLB entry again */
	mov	ITLB_PCTX1,	%o0
	ldxa	[%o0] 0x55,	%l3	/* IMMU data access reg */
	ldxa	[%o0] 0x56,	%l4	/* IMMU Tag read reg */

!	sub	%g4,	%l3,	%l5	/* entry is  demaped */
!	brz,a	%l5,	diag_fail
!	nop

	/* restore the entry */
	mov	0x30,	%o2
	stxa	%g5,	[%o2] 0x50
	stxa	%g4,	[%o0] 0x55

#if SDN_CTX_FIX	
tc_6:
	/* 
	 * Demap a page with G=0 context=SEC , since the page has ctx=PRIM, 
	 * this page will not be demaped.
	 */
	mov	ITLB_PCTX2,	%o0
	mov	0x0,	%l0
	mov	0x0,	%g4
	mov	0x0,	%g5
	ldxa	[%o0] 0x55,	%g4	/* IMMU data access reg */
	ldxa	[%o0] 0x56,	%g5	/* IMMU Tag read reg */

	setx	0xffffffffffffe000, %l0, %l3	
	and	%g5,	%l3,	%l7
	mov	0x10,	%l5
	or	%l5,	%l7,	%l7
	/* demap page, context = PRIM */ 
	stxa	%g0,	[%l7] 0x57
	nop

	/* flush */

	/* read the same IMMU TLB entry again */
	mov	ITLB_PCTX2,	%o0
	ldxa	[%o0] 0x55,	%l3	/* IMMU data access reg */
	ldxa	[%o0] 0x56,	%l4	/* IMMU Tag read reg */

!	sub	%g4,	%l3,	%l5	/* entry is  not demaped */
!	brnz,a	%l5,	diag_fail
!	nop

!	sub	%l4,	%g5,	%l5
!	brnz,a	%l5,	diag_fail	/* entry is not demaped */
!	nop

#endif

	/* 
	 *********************************************************************
	 * Demap a page with G=0 context=PRIM , since the page has ctx=SEC, 
	 * this page will not be demaped.
	 *********************************************************************
	 */
tc_8:
	mov	ITLB_DMPSCTX2,	%o0
	mov	0x0,	%l0
	mov	0x0,	%g4
	mov	0x0,	%g5
	ldxa	[%o0] 0x55,	%l1	/* IMMU data access reg */
	ldxa	[%o0] 0x56,	%l2	/* IMMU Tag read reg */

	setx	0xffffffffffffe000, %l0, %l3	
	and	%g5,	%l3,	%l7
	/* demap page, context = PRIM */ 
	stxa	%g0,	[%l7] 0x57
	nop

	/* flush */

	/* read the same IMMU TLB entry again */
	mov	ITLB_DMPSCTX2,	%o0
	ldxa	[%o0] 0x55,	%l3	/* IMMU data access reg */
	ldxa	[%o0] 0x56,	%l4	/* IMMU Tag read reg */

!	sub	%l1,	%l3,	%l5	/* entry is  not demaped */
!	brnz,a	%l5,	diag_fail
!	nop

!	sub	%l4,	%l2,	%l5
!	brnz,a	%l5,	diag_fail	/* entry is not demaped */
!	nop

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
tc_9:
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
	 * the 4th, 5th, 6th and 7th entries in the I-TLB 
	 * tables are demaped. Entry 8 to 19 are not because
	 * the entry's global bit is set. 
	 */
tc_10:
	set	ITLB_CTXDMP_NCLU1,	%o0
idmpctx_nclu1:

	mov	0x0,	%l1
	mov	0x0,	%l2
	ldxa	[%o0] 0x55,	%l1	/* IMMU data access reg */

#ifdef SELF_CHECKING	
	srlx	%l1,	30,	%l3	
	srlx	%l3,	30,	%l3
	brnz,a	%l3,	diag_fail
	nop
#endif

	add	%o0,	0x8,	%o0

	sub	%o0,	ITLB_CTXDMP_NCLU2,	%l4

	brnz,a	%l4,	idmpctx_nclu1
	nop

idmpctx_nclu2:
	/* all the entries here should not be demapped */
	mov	0x0,	%l1
	mov	0x0,	%l2
	ldxa	[%o0] 0x55,	%l1	/* IMMU data access reg */
	ldxa	[%o0] 0x56,	%l2	/* IMMU Tag read reg */
#ifdef SELF_CHECKING
	srlx	%l1,	30,	%l3
	srlx	%l3,	30,	%l4	
	brz,a	%l4,	diag_fail
	set	0xffffeee2,	%l1
#endif

	add	%o0,	0x8,	%o0
	sub	%o0,	ITLB_CTXDMP_NCLU3,	%l4
	brnz,a	%l4,	idmpctx_nclu2
	nop
	
	/*
	 **********************************************
	 *	Demap all the context=PRIM IMMU TLB
	 *	entries.
	 **********************************************
	 */
tc_11:
        set     0x40,   %l7
        stxa    %g0,    [%l7] 0x57
        nop

        /* flush */


	set	ITLB_CTXDMP_PMRY1,	%o0
chk_idmppctx1:
	mov	0x0,	%l1
	mov	0x0,	%l2
	ldxa	[%o0] 0x55,	%l1	/* IMMU data access reg */
#ifdef SELF_CHECKING	
	srlx	%l1,	30,	%l3	
	srlx	%l3,	30,	%l3
	brnz,a	%l3,	diag_fail
	nop
#endif

	add	%o0,	0x8,	%o0
	sub	%o0,	ITLB_CTXDMP_PMRY2,	%l4
	brnz,a	%l4,	chk_idmppctx1
	nop

chk_idmppctx2:
	/* all these entries should not be demapped */
	mov	0x0,	%l1
	mov	0x0,	%l2
	ldxa	[%o0] 0x55,	%l1	/* IMMU data access reg */
	ldxa	[%o0] 0x56,	%l2	/* IMMU Tag read reg */
#ifdef SELF_CHECKING
	srlx	%l1,	30,	%l3	
	srlx	%l3,	30,	%l3
	brz,a	%l3,	diag_fail
	nop
#endif
	add	%o0,	0x8,	%o0
	sub	%o0,	ITLB_CTXDMP_PMRY3,	%l4
	brnz,a	%l4,	chk_idmppctx2
	nop

	/*
	 **********************************************
	 *	Demap all the context=SCONTEXT IMMU TLB
	 *	entries.
	 **********************************************
	 */
#if SDN_CTX_FIX
tc_12:
        set     0x50,   %l7
        stxa    %g0,    [%l7] 0x57
        nop

        /* flush */


	set	ITLB_CTXDMP_SEC1,	%o0
chk_idmpsectx1:
	/* 
 	 ***********************************************************
	 * first 8 SEC TLB entries has G=1, should not be demapped 
 	 ***********************************************************
	 */
	mov	0x0,	%l1
	mov	0x0,	%l2
	ldxa	[%o0] 0x55,	%l1	/* IMMU data access reg */
	ldxa	[%o0] 0x56,	%l2	/* IMMU Tag read reg */
#ifdef SELF_CHECKING
	srlx	%l1,	30,	%l3	
	srlx	%l3,	30,	%l3
	brz,a	%l3,	diag_fail
	nop
#endif

	add	%o0,	0x8,	%o0
	sub	%o0,	ITLB_CTXDMP_SEC2,	%l4
	brnz,a	%l4,	chk_idmpsectx1
	nop

chk_idmpsectx2:
	/* 
 	 ***********************************************************
	 * the rest 20 SEC TLB entries has G=0, should  be demapped 
 	 ***********************************************************
	 */
	mov	0x0,	%l1
	mov	0x0,	%l2
	ldxa	[%o0] 0x55,	%l1	/* IMMU data access reg */

	srlx	%l1,	30,	%l3	
	srlx	%l3,	30,	%l3
	brnz,a	%l3,	diag_fail
	nop

	add	%o0,	0x8,	%o0
	sub	%o0,	ITLB_CTXDMP_SEC3,	%l4
	brnz,a	%l4,	chk_idmpsectx2
	nop
#endif

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

        /* read out all the entries in I-TLB table to compare */

        set     0x5,    %l0
        set     0x40,   %l1
        set     0x28,    %l2
rd_itlb_loop:
        ldxa    [%l2] 0x55,     %l3
#if 0
        ldxa    [%l2] 0x56,     %l4
#endif

        add     %l2,    0x8,    %l2
        add     %l0,    0x1,    %l0

        sub     %l0,    %l1,    %l3
        brnz,a  %l3,    rd_itlb_loop
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

