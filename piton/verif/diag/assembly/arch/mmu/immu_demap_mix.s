// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: immu_demap_mix.s
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
        mov     0x3c,   %l0
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
        add     %l5,    0x8,    %l5

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
	 ************************
	 * Demap by Page
	 ************************
	 */

	/* 
	 ***************************************************
	 * ctx=nucl, pg mismatch, not demaped
	 ***************************************************
 	 */
idmpg_0_0:
	mov	0x18,	%o0	/* entry 3 : nucl ctx , size=4m, l=1, g=0 */
        mov     0x20,   %l5
	mov	0x2,	%l6	/* action : page mismatch, not demap */
        call    dmp_itlb_entry
        nop

idmpg_0_1:
	/* 
	 * ctx=prim, ctx mismatch, not demaped 
	 */
	mov	0x0,	%l5
	mov	0x1,	%l6
	call	dmp_itlb_entry
	nop	

idmpg_0_2:
	/* 
	 * ctx=sec, ctx mismatch, not demaped 
	 */
	mov	0x10,	%l5
	mov	0x1,	%l6
	call	dmp_itlb_entry
	nop	

idmpg_0_3:
	/* 
	 * ctx=reserved, ctx mismatch, not demaped 
	 */
	mov	0x30,	%l5
	mov	0x1,	%l6
        call    dmp_itlb_entry
        nop

idmpg_0_4:
	/*
	 * ctx match, page match, demaped 
	 */
        mov     0x20,   %l5
	mov	0x0,	%l6
        call    dmp_itlb_entry
        nop

	/* 
	 ***************************************************
	 * ctx=prim, mismatch, G=1 , demaped
	 ***************************************************
 	 */	
idmpg_1_0:
        mov     0x28,   %o0     /* entry 5 : nucl ctx , size=8k, l=0, g=1 */
	mov	0x0,	%l5
	mov	0x0,	%l6	/* action : demaped */
	call	dmp_itlb_entry
	nop

#if 0  
idmpg_1_1:
	/* ctx=sec, ctx mismatch, but, g=1 demaped */  
        mov     0x10,   %l5
	mov	0x0,	%l6
	call	dmp_itlb_entry
	nop
#endif
	
idmpg_1_2:
        mov     0x30,   %l5
	mov	0x1,	%l6	/* reserved ctx, not demaped */
	call	dmp_itlb_entry
	nop
	
idmpg_1_3:
	mov	0x20,	%l5
	mov	0x0,	%l6	/* action : demap this entry */
	call	dmp_itlb_entry
	nop

	/* 
	 ***************************************************
	 * entry 6 : ctx=nucl, L=1, G=0 , 8k
	 ***************************************************
 	 */
idmpg_6:
        mov     0x30,   %o0     /* entry 6 : nucl ctx , size=8, L=1, G=0 */
        mov     0x20,   %l5     	
	mov	0x0,	%l6	/* action : demap this entry */ 
	call	dmp_itlb_entry
	nop

	mov	0x10,	%l5
	mov	0x1,	%l6
	call	dmp_itlb_entry	/* action : wrong ctx, not demaped */
	nop

	mov	0x30,	%l5
	mov	0x1,	%l6
	call	dmp_itlb_entry	/* action : reserved ctx, not demaped */
	nop

	/* 
	 ***************************************************
	 * entry 7 : nucleus context L=1, size=8k, G=1 
	 ***************************************************
 	 */
idmpg_7:
        mov	0x38,	%o0
        mov     0x20,   %l5     /* ctx match */
	mov	0x0,	%l6	/* action : demap this entry */ 
	call	dmp_itlb_entry
	nop
#if 0
	mov	0x10,	%l5
	mov	0x0,	%l6	/* ctx mismatch, g=1 */
	call	dmp_itlb_entry	/* action : demap this entry */
	nop
#endif

	mov	0x30,	%l5
	mov	0x1,	%l6
	call	dmp_itlb_entry	/* action : reserved ctx, not demaped */
	nop

	/* 
	 ***************************************************
	 * entry 8 : prim context L=0, size=8k, G=0
	 ***************************************************
 	 */
idmpg_8:
        mov     0x40,   %o0     
        mov     0x0,    %l5     	
	mov	0x0,	%l6	/* action : demap this entry */ 
	call	dmp_itlb_entry
	nop

	mov	0x10,	%l5
	mov	0x1,	%l6
	call	dmp_itlb_entry	/* action : wrong ctx, not demaped */
	nop

	mov	0x30,	%l5
	mov	0x1,	%l6
	call	dmp_itlb_entry	/* action : reserved ctx, not demaped */
	nop

	/* 
	 ***************************************************
	 * entry 9 :  prim context L=0, size=8k, G=1 
	 ***************************************************
 	 */
idmpg_9:
        mov     0x48,   %o0     
        mov     0x20,   %l5     	
	mov	0x0,	%l6	/* action : demap this entry */ 
	call	dmp_itlb_entry
	nop

	mov	0x30,	%l5
	mov	0x1,	%l6
	call	dmp_itlb_entry	/* action : reserved ctx, not demaped */
	nop

	mov	0x0,	%l5
	mov	0x0,	%l6
	call	dmp_itlb_entry	/* action : demap */
	nop

	mov	0x0,	%l5
	mov	0x2,	%l6
	call	dmp_itlb_entry	/* action : not demap : page mismatch */
	nop

	/* 
	 ***************************************************
	 * entry 10: prim context L=1, size=8k, G=0  
	 ***************************************************
 	 */
idmpg_10:
        mov     0x50,   %o0     
        mov     0x20,   %l5     	
	mov	0x1,	%l6	/* action : ctx wrong */
	call	dmp_itlb_entry
	nop

	mov	0x30,	%l5
	mov	0x1,	%l6
	call	dmp_itlb_entry	/* action : reserved ctx, not demaped */
	nop

	mov	0x0,	%l5
	mov	0x0,	%l6
	call	dmp_itlb_entry	/* action : demaped */
	nop

#if 0
	/* 
	 ***************************************************
	 * entry 12 : sec context L=0, size=8k, G=0
	 ***************************************************
 	 */
idmpg_12:
        mov     0x60,   %o0     
        mov     0x10,   %l5     	
	mov	0x0,	%l6	/* action : demap this entry */ 
	call	dmp_itlb_entry
	nop

	mov	0x20,	%l5
	mov	0x1,	%l6
	call	dmp_itlb_entry	/* action : wrong ctx, not demaped */
	nop

	mov	0x30,	%l5
	mov	0x1,	%l6
	call	dmp_itlb_entry	/* action : reserved ctx, not demaped */
	nop

	mov	0x10,	%l5
	mov	0x2,	%l6
	call	dmp_itlb_entry	/* action : wrong pg not dmp */
	nop

	/* 
	 ***************************************************
	 * entry 15 : sec context L=1, size=8k, G=1 
	 ***************************************************
 	 */
idmpg_15:
        mov     0x78,   %o0     
        mov     0x20,   %l5     	
	mov	0x0,	%l6	/* action : demap this entry */ 
	call	dmp_itlb_entry
	nop

	mov	0x10,	%l5
	mov	0x0,	%l6
	call	dmp_itlb_entry	/* action : demap this entry */
	nop

	mov	0x10,	%l5
	mov	0x2,	%l6
	call	dmp_itlb_entry	/* action : wrong pg not demaped */
	nop
#endif
	/* 
	 ***************************************************
	 * entry 16 : nuc context L=0, size=64k, G=0
	 ***************************************************
 	 */
idmpg_16:
        mov     0x80,   %o0     
        mov     0x20,   %l5     	
	mov	0x0,	%l6	/* action : demap this entry */ 
	call	dmp_itlb_entry
	nop

	mov	0x10,	%l5
	mov	0x1,	%l6
	call	dmp_itlb_entry	/* action : wrong ctx, not demaped */
	nop

	mov	0x30,	%l5
	mov	0x1,	%l6
	call	dmp_itlb_entry	/* action : reserved ctx, not demaped */
	nop

	/* 
	 ***************************************************
	 * entry 19 : nuc context L=1, size=64k, G=1 
	 ***************************************************
 	 */
idmpg_19:
        mov     0x98,   %o0     
        mov     0x20,   %l5     	
	mov	0x0,	%l6	/* action : demap this entry */ 
	call	dmp_itlb_entry
	nop

#if 0
	mov	0x10,	%l5	/* sec context is not valid */
	mov	0x0,	%l6
	call	dmp_itlb_entry	/* action : demap this entry */
	nop
#endif

	mov	0x30,	%l5
	mov	0x1,	%l6
	call	dmp_itlb_entry	/* action : reserved ctx, not demaped */
	nop

	mov	0x20,	%l5
	mov	0x2,	%l6
	call    dmp_itlb_entry  /* action : wrong pg, not dmp */
        nop

	/* 
	 ***************************************************
	 * entry 21: prim context L=0, size=64k, G=1
	 ***************************************************
 	 */
idmpg_21:
        mov     0xa8,   %o0     
        mov     0x20,   %l5     	
	mov	0x0,	%l6	/* action : ctx wrong , g=1 dmp */
	call	dmp_itlb_entry
	nop

	mov	0x30,	%l5
	mov	0x1,	%l6
	call	dmp_itlb_entry	/* action : reserved ctx, not demaped */
	nop

	mov	0x0,	%l5
	mov	0x0,	%l6
	call	dmp_itlb_entry	/* action : demaped */
	nop

	mov	0x0,	%l5
	mov	0x2,	%l6
        call    dmp_itlb_entry  /* action : pg wrong , not demaped */
        nop

	/* 
	 ***************************************************
	 * entry 22: prim context L=1, size=64k, G=0
	 ***************************************************
 	 */
idmpg_22:
        mov     0xb0,   %o0     
        mov     0x20,   %l5     	
	mov	0x1,	%l6	/* action : ctx wrong , not dmped */
	call	dmp_itlb_entry
	nop

	mov	0x30,	%l5
	mov	0x1,	%l6
	call	dmp_itlb_entry	/* action : reserved ctx, not demaped */
	nop

	mov	0x0,	%l5
	mov	0x0,	%l6
	call	dmp_itlb_entry	/* action : demaped */
	nop

	mov	0x0,	%l5
	mov	0x2,	%l6
        call    dmp_itlb_entry  /* action : pg wrong , not demaped */
        nop

#if 0
        /*
         ***************************************************
         * entry 24 : sec context L=0, size=64k, G=0
         ***************************************************
         */
idmpg_24:
        mov     0xc0,   %o0
        mov     0x10,   %l5
        mov     0x0,    %l6     /* action : demap this entry */
        call    dmp_itlb_entry  
        nop

        mov     0x20,   %l5
        mov     0x1,    %l6
        call    dmp_itlb_entry  /* action : wrong ctx, not demaped */
        nop

        mov     0x30,   %l5
        mov     0x1,    %l6
        call    dmp_itlb_entry  /* action : reserved ctx, not demaped */
        nop

        mov     0x10,   %l5
        mov     0x2,    %l6
        call    dmp_itlb_entry  /* action : wrong pg not dmp */
        nop

        /*
         ***************************************************
         * entry 27 : sec context L=1, size=64k, G=1
         ***************************************************
         */
idmpg_27:
        mov     0xd8,   %o0
        mov     0x10,   %l5
        mov     0x0,    %l6     /* action : demap this entry */
        call    dmp_itlb_entry
        nop

        mov     0x20,   %l5
        mov     0x2,    %l6
        call    dmp_itlb_entry  /* action : wrong pg , not dmped */
        nop
#endif

        /*      
         *************************************************** 
         * entry 30 : nuc context L=1, size=4m, G=0
         ***************************************************
         */
idmpg_30:
        mov     0xf0,   %o0
        mov     0x20,   %l5
        mov     0x0,    %l6     /* action : demap this entry */
        call    dmp_itlb_entry
        nop

        mov     0x10,   %l5
        mov     0x1,    %l6
        call    dmp_itlb_entry  /* action : wrong ctx, not dmp */
        nop

        mov     0x30,   %l5
        mov     0x1,    %l6
        call    dmp_itlb_entry  /* action : reserved ctx, not demaped */
        nop

        mov     0x20,   %l5
        mov     0x2,    %l6
        call    dmp_itlb_entry  /* action : wrong pg, not dmp */
        nop

        /*
         ***************************************************
         * entry 35 :  prim context L=1, size=4m, G=1
         ***************************************************
         */
idmpg_35:
        mov     0x118,   %o0
        mov     0x20,   %l5
        mov     0x0,    %l6     /* action : ctx wrong , dmped , g=1 */
        call    dmp_itlb_entry
        nop

        mov     0x30,   %l5
        mov     0x1,    %l6
        call    dmp_itlb_entry  /* action : reserved ctx, not demaped */
        nop

        mov     0x0,    %l5
        mov     0x0,    %l6
        call    dmp_itlb_entry  /* action : demaped */
        nop

        mov     0x0,    %l5
        mov     0x2,    %l6
        call    dmp_itlb_entry  /* action : pg wrong , not demaped */
        nop

#if 0
        /*
         ***************************************************
         * entry 36 :  sec context L=0, size=4m, G=0
         ***************************************************
         */
idmpg_36:
        mov     0x120,   %o0
        mov     0x10,   %l5
        mov     0x0,    %l6     /* action : demaped */
        call    dmp_itlb_entry
        nop
#endif

        /*
         ***************************************************
         * entry 42 : nuc context L=1, size=4M, G=0
         ***************************************************
         */
idmpg_41:
        mov     0x150,  %o0
        mov     0x20,   %l5
        mov     0x0,    %l6     /* action : demaped */
        call    dmp_itlb_entry
        nop

        mov     0x10,   %l5
        mov     0x1,    %l6     /* action : wrong ctx, not demaped */
        call    dmp_itlb_entry
        nop

        mov     0x20,   %l5
        mov     0x2,    %l6     /* action : wrong pg, not demaped */
        call    dmp_itlb_entry
        nop

        /*
         ***************************************************
         * entry 46 : prim context L=1, size=4M, G=0 
         ***************************************************
         */
idmpg_46:
        mov     0x170,  %o0
        mov     0x20,   %l5
        mov     0x1,    %l6     /* action : wrong ctx, not demaped */
        call    dmp_itlb_entry
        nop

        mov     0x0,   %l5
        mov     0x0,    %l6     /* action : demaped */
        call    dmp_itlb_entry
        nop

        mov     0x0,   %l5
        mov     0x2,    %l6     /* action : wrong pg, not demaped */
        call    dmp_itlb_entry
        nop

#if 0
        /*
         ***************************************************
         * entry 51 : sec context L=1, size=4M, G=1
         ***************************************************
         */
idmpg_51:
        mov     0x198,  %o0
        mov     0x20,   %l5
        mov     0x0,    %l6     /* action : wrong ctx, g=1 demaped */
        call    dmp_itlb_entry
        nop

        mov     0x10,   %l5
        mov     0x0,    %l6     /* action : demaped */
        call    dmp_itlb_entry
        nop

        mov     0x0,   %l5
        mov     0x2,    %l6     /* action : wrong pg, not demaped */
        call    dmp_itlb_entry
        nop
#endif
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

        /* flush */

#if 0
	/*
	 **********************************************
	 *	Demap all the context=SCONTEXT IMMU TLB
	 *	entries.
	 **********************************************
	 */
dmp_ctx_2:
        set     0x50,   %l7
        stxa    %g0,    [%l7] 0x57
        nop

        /* flush */

	/*
	 **************************************
	 * read out the ITLB to compare 
	 **************************************
	 */ 
	call	rd_itlb
	nop
#endif

/*
 ***********************
 *    IMMU demap all   *
 ***********************
 */
        /*
         ***********************************
         *      preload ITLB table
         ***********************************
         */
test_2:
        mov     0x3d,   %l0
        mov     0x0,    %l1
        mov     0x18,   %l5     /* skip the first 3 entries */
        setx    itsb_table1,    %l1,    %l2
preload_itlb2:  
        ldx     [%l2],          %g4
        ldx     [%l2+0x8],      %g5
        add     %l2,    0x10,   %l2

        mov     0x30,   %l3
        stxa    %g4,    [%l3] 0x50      /* tag access reg */
        stxa    %g5,    [%l5] 0x55      /* data access reg */
        add     %l5,    0x8,    %l5

        add     %l1,    0x1,    %l1
        sub     %l1,    %l0,    %l6
        brnz    %l6,    preload_itlb2
        nop

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

.global dmp_itlb_entry 	 

dmp_itlb_entry:
        mov     0x0,    %l0
        mov     0x0,    %g4
        mov     0x0,    %g5
        ldxa    [%o0] 0x55,     %g4     /* IMMU data access reg */
        ldxa    [%o0] 0x56,     %g5     /* IMMU Tag read reg */

        setx    0xffffffffffffe000, %l0, %l3
        and     %g5,    %l3,    %l7
dmp_action:
	brz	%l6,	dmpact_1	/* demap this entry */
	nop

	sub	%l6,	0x1,	%l0	/* given the wrong context */
	brz	%l0,	dmpact_2
	nop

	sub	%l6,	0x2,	%l0	/* mess up the page to make demap not happen */
	brz	%l0,	messup_pg
	nop

	ba	diag_fail
	nop

messup_pg:
	set	0x10000000,	%l0
	add	%l0,	%l7,	%l7

	ba	dmpact_2
	nop

dmpact_1:	/* entry is demaped */
        or      %l7,    %l5,    %l7     /* %l5 	: context */

        stxa    %g0,    [%l7] 0x57
        nop

        /* flush */

        /* read the same IMMU TLB entry again */
        ldxa    [%o0] 0x55,     %l1     /* IMMU data access reg */

#ifdef SELF_CHECKING
        srlx    %l1,    30,     %l3
        srlx    %l3,    30,     %l4
        srlx    %l4,    3,      %l6
        /* bit 63 (valid bit) should = 0 since entry is demapped */
        brnz    %l6,    diag_fail
        nop
#endif

        /* restore the entry */
        mov     0x30,   %o2
        stxa    %g5,    [%o2] 0x50
        stxa    %g4,    [%o0] 0x55

	ba	dmp_rtn
	nop

dmpact_2:	/* entry is not demaped */
        or      %l7,    %l5,    %l7     /* %l5 	: context */

        stxa    %g0,    [%l7] 0x57
        nop

        /* flush */

        /* read the same IMMU TLB entry again */
        ldxa    [%o0] 0x55,     %l1     /* IMMU data access reg */
        ldxa    [%o0] 0x56,     %l2     /* IMMU Tag read reg */


dmp_rtn:
	retl
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
#if 0
        ldxa    [%l2] 0x56,     %l4
#endif

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
        /*   nucleus context L=1, size=4m, G=0  */
        .xword  0x0000000004100000,     0xe000000104100040

	/*
	 *******************************
	 * 	entry :  4,5,6,7
	 *******************************
	 */

        /*   nucleus context L=0, size=8k, G=0  */
        .xword  0x0000000000180000,     0x8000000100180000
        /*   nucleus context L=0, size=8k, G=1  */
        .xword  0x0000000000182000,     0x8000000100182001
        /*   nucleus context L=1, size=8k, G=0  */
        .xword  0x0000000000184000,     0x8000000100184040
        /*   nucleus context L=1, size=8k, G=1  */
        .xword  0x0000000000186000,     0x8000000100186041

	/*
	 *******************************
	 * 	entry :  8--11
	 *******************************
	 */

        /*   prim context L=0, size=8k, G=0  */
        .xword  0x0000000000188044,     0x8000000100188000
        /*   prim context L=0, size=8k, G=1  */
        .xword  0x000000000018a044,     0x800000010018a001
        /*   prim context L=1, size=8k, G=0  */
        .xword  0x000000000018c044,     0x800000010018c040
        /*   prim context L=1, size=8k, G=1  */
        .xword  0x000000000018e044,     0x800000010018e041

	/*
	 *******************************
	 * 	entry :  12--15
	 *******************************
	 */

        /*   prim context L=0, size=8k, G=0  */
        .xword  0x0000000000192044,     0x8000000100192000
        /*   prim context L=0, size=8k, G=1  */
        .xword  0x0000000000194044,     0x8000000100194001
        /*   prim context L=1, size=8k, G=0  */
        .xword  0x0000000000196044,     0x8000000100196040
        /*   prim context L=1, size=8k, G=1  */
        .xword  0x0000000000198044,     0x8000000100198041

	/*
	 *******************************
	 * 	entry :  16--19
	 *******************************
	 */

        /*   nuc context L=0, size=64k, G=0  */
        .xword  0x00000000001a0000,     0xa0000001001a0000
        /*   nuc context L=0, size=64k, G=1  */
        .xword  0x00000000001b0000,     0xa0000001001b0001
        /*   nuc context L=1, size=64k, G=0  */
        .xword  0x00000000001c0000,     0xa0000001001c0040
        /*   nuc context L=1, size=64k, G=1  */
        .xword  0x00000000002c0000,     0xa0000001001c0041

	/*
	 *******************************
	 * 	entry :  20--23
	 *******************************
	 */

        /*   prim context L=0, size=64k, G=0  */
        .xword  0x00000000001d0044,     0xa0000001001d0000
        /*   prim context L=0, size=64k, G=1  */
        .xword  0x00000000001e0044,     0xa0000001001e0001
        /*   prim context L=1, size=64k, G=0  */
        .xword  0x00000000001f0044,     0xa0000001001f0040
        /*   prim context L=1, size=64k, G=1  */
        .xword  0x0000000000200044,     0xa000000100200041

	/*
	 *******************************
	 * 	entry :  24--27
	 *******************************
	 */

        /*   prim context L=0, size=64k, G=0  */
        .xword  0x0000000000210044,     0xa000000100210000
        /*   prim context L=0, size=64k, G=1  */
        .xword  0x0000000000220044,     0xa000000100220001
        /*   prim context L=1, size=64k, G=0  */
        .xword  0x0000000000230044,     0xa000000100230040
        /*   prim context L=1, size=64k, G=1  */
        .xword  0x0000000000240044,     0xa000000100240041

	/*
	 *******************************
	 * 	entry :  28--31
	 *******************************
	 */

        /*   nuc context L=0, size=4m, G=0  */
        .xword  0x0000000000280000,     0xe000000100280000
        /*   nuc context L=0, size=4m, G=1  */
        .xword  0x0000000000300000,     0xe000000100300001
        /*   nuc context L=1, size=4m, G=0  */
        .xword  0x0000000000380000,     0xe000000100380040
        /*   nuc context L=1, size=4m, G=1  */
        .xword  0x0000000000400000,     0xe000000100400041

	/*
	 *******************************
	 * 	entry :  32--35
	 *******************************
	 */

        /*   prim context L=0, size=4m, G=0  */
        .xword  0x0000000000480044,     0xe000000100480000
        /*   prim context L=0, size=4m, G=1  */
        .xword  0x0000000000500044,     0xe000000100500001
        /*   prim context L=1, size=4m, G=0  */
        .xword  0x0000000000580044,     0xe000000100580040
        /*   prim context L=1, size=4m, G=1  */
        .xword  0x0000000000600044,     0xe000000100600041

	/*
	 *******************************
	 * 	entry :  36--39
	 *******************************
	 */

        /*   prim context L=0, size=4m, G=0  */
        .xword  0x0000000000680044,     0xe000000100680000
        /*   prim context L=0, size=4m, G=1  */
        .xword  0x0000000000700044,     0xe000000100700001
        /*   prim context L=1, size=4m, G=0  */
        .xword  0x0000000000780044,     0xe000000100780040
        /*   prim context L=1, size=4m, G=1  */
        .xword  0x0000000000900044,     0xe000000100800041

	/*
	 *******************************
	 * 	entry :  40--43
	 *******************************
	 */

        /*   nuc context L=0, size=4M, G=0  */
        .xword  0x0000000000800000,     0xe000000100800000
        /*   nuc context L=0, size=4M, G=1  */
        .xword  0x0000000000c00000,     0xe000000100c00001
        /*   nuc context L=1, size=4M, G=0  */
        .xword  0x0000000001000000,     0xe000000101000040
        /*   nuc context L=1, size=4M, G=1  */
        .xword  0x0000000001400000,     0xe000000101400041

	/*
	 *******************************
	 * 	entry :  44--47
	 *******************************
	 */

        /*   prim context L=0, size=4M, G=0  */
        .xword  0x0000000001800044,     0xe000000101800000
        /*   prim context L=0, size=4M, G=1  */
        .xword  0x0000000001c00044,     0xe000000101c00001
        /*   prim context L=1, size=4M, G=0  */
        .xword  0x0000000002000044,     0xe000000102000040
        /*   prim context L=1, size=4M, G=1  */
        .xword  0x0000000002400044,     0xe000000102400041

	/*
	 *******************************
	 * 	entry :  48--51
	 *******************************
	 */

        /*   prim context L=0, size=4M, G=0  */
        .xword  0x0000000002800044,     0xe000000102800000
        /*   prim context L=0, size=4M, G=1  */
        .xword  0x0000000002c00044,     0xe000000102c00001
        /*   prim context L=1, size=4M, G=0  */
        .xword  0x0000000003000044,     0xe000000103000040
        /*   prim context L=1, size=4M, G=1  */
        .xword  0x0000000003400044,     0xe000000103400041

	/*
	 *******************************
	 * 	entry :  52--55
	 *******************************
	 */

        /*   nucl context L=0, size=8k, G=0  */
        .xword  0x0000000000282000,     0x8000000100282000
        /*   prim context L=0, size=8k, G=1  */
        .xword  0x0000000000284044,     0x8000000100284001
        /*   nucl context L=1, size=8k, G=0  */
        .xword  0x0000000000286000,     0x8000000100286040
        /*   prim context L=1, size=8k, G=1  */
        .xword  0x0000000000288044,     0x8000000100288041

	/*
	 *******************************
	 * 	entry :  56--59
	 *******************************
	 */

        /*   prim context L=0, size=8k, G=0  */
        .xword  0x0000000000482044,     0x8000000100482000
        /*   sec context L=0, size=64k, G=1  */
        .xword  0x0000000000490055,     0xa000000100490001
        /*   sec context L=1, size=64k, G=0  */
        .xword  0x00000000004a0055,     0xa0000001004a0040
        /*   nuc context L=1, size=64k, G=1  */
        .xword  0x00000000004b0000,     0x80000001004b0041

	/*
	 *******************************
	 * 	entry :  60--63
	 *******************************
	 */

        /*   sec context L=0, size=64k, G=0  */
        .xword  0x0000000000510055,     0xa000000100510000
        /*   sec context L=0, size=4m, G=1  */
        .xword  0x0000000001980055,     0x8000000101940001
        /*   prim context L=1, size=4m, G=0  */
        .xword  0x0000000001d80055,     0x8000000101d80040
        /*   nuc context L=1, size=4m, G=1  */
        .xword  0x0000000000980000,     0x8000000100980041

.end
