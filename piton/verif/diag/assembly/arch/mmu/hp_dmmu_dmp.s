// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: hp_dmmu_dmp.s
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
!!      This file has the micro-code to test out the miscellaneous demap 
!!	operations, such as:
!!
!!		* auto-demap of overlapped pages
!!		* consecutive demaps
!!
!!-------------------------------------------------------------------------------

/*
 * Use our own MMU miss handler
 */
#define H_HT0_fast_data_access_MMU_miss          T0_fast_dmmu_miss

#define MAIN_PAGE_HV_ALSO

#include "boot.s"

.text

.global main

main:
	nop
	
	ta	T_CHANGE_HPRIV
	nop

	/*
	 ***************************************
	 *	auto-demap 
	 ***************************************
	 */
test_1:
	mov	0x1f,	%l0	/* each miss, we'll write 2 entries : 31*2 = 62 entries */
				/* the very first entrie, are not touched. */

	mov	0x0,	%l1
	mov	0x8,	%l5	/* skip the first  entrie */
	mov	0x0,	%o0	/* standard DMMU miss handler */
	setx	dtsb_table1,	%l1,	%l2
load_dtlb1:
	ldx	[%l2],		%g4
	ldx	[%l2+0x8], 	%g5	
	add	%l2,	0x10,	%l2	
	
	mov	0x30,	%l3
        stxa    %g4,    [%l3] 0x58	/* tag access reg */
        stxa    %g5,    [%l5] 0x5d	/* data access reg */

	set	0x208,	%o6	    /* real bit va[9] = 1, 8 is the next entry */
	add	%l5,	%o6,	%o7
        stxa    %g4, [ %l3 ] 0x58
        stxa    %g5, [ %o7 ] 0x5d    /* same entry as last write, but, real bit is set */

	add	%l5,	0x10,	%l5

	add	%l1,	0x1,	%l1
	sub	%l1,	%l0,	%l6
	brnz	%l6,	load_dtlb1
	nop

	set	0x10000000, %l4
	add	%l4, %l3, %l3
	add	%o7, 0x8, %o7	/* write a different VA */
        stxa    %g4, [ %l3 ] 0x58
        stxa    %g5, [ %o7 ] 0x5d    /* write the last entry */

	/*
	 ****************************************
	 *    consecutive demap 
	 *
 	 * 	demap by page
	 *	demap by nucleus ctx
	 *	demap by primary ctx
	 *	demap by all
	 *
	 ****************************************
	 */
	mov	0x108,	%l0
        ldxa    [%l0] 0x5d,     %g4     /* DMMU data access reg */
        ldxa    [%l0] 0x5e,     %g5     /* DMMU Tag read reg */

        setx    0xffffffffffffe000, %l0, %l3
        and     %g5,    %l3,    %l7
	mov	0x20,	%l5
	or	%l5,	%l7,	%l7
	mov	0x60,	%l6	
	mov	0x40,	%l4	

        /* demap page, context = nucleus */
        stxa    %g0,    [%l7] 0x5f
	/*
	 **********************************		
	 *  demap by necleus context
	 **********************************		
	 */
        stxa    %g0,    [%l6] 0x5f
	/*
	 **********************************		
	 *  demap by primary context
	 **********************************		
	 */
        stxa    %g0,    [%l4] 0x5f

	/*
	 * So far, only demap Non-real translation entries 
	 */

        /* read out all the entries in D-TLB table to compare */
        set     0x0,    %l0
        set     0x3c,   %l1
        set     0x20,    %l2
rd_dtlb_loop1:   
        ldxa    [%l2] 0x5d,     %l3
        add     %l2,    0x8,    %l2
        add     %l0,    0x1,    %l0     

        sub     %l0,    %l1,    %l3
        brnz,a  %l3,    rd_dtlb_loop1
        nop

	/*
	 ***************************************************
	 * demap all
	 * 
	 * This will kick out any unlocked entries...
	 ***************************************************
	 */
	mov	0x80,	%l3	
        stxa    %g0,    [%l3] 0x5f

        /* read out all the entries in D-TLB table to compare */
        set     0x0,    %l0
        set     0x40,   %l1
        set     0x0,    %l2
rd_dtlb_loop2:   
        ldxa    [%l2] 0x5d,     %l3
        add     %l2,    0x8,    %l2
        add     %l0,    0x1,    %l0     

        sub     %l0,    %l1,    %l3
        brnz,a  %l3,    rd_dtlb_loop2
        nop

/*
 ********************************
 *      Diag PASSED !           *
 ********************************
 */
diag_pass:
        set     0xaaddcafe,     %l0
good_trap:
        ta      T_GOOD_TRAP
        nop

/*
 ********************************
 *      Diag FAILED !           *
 ********************************
 */
diag_fail:
        set     0xdeadcafe,     %l0
bad_trap:
        ta      T_BAD_TRAP
        nop
        nop

.data

.global dtsb_table1

dtsb_table1:
        /*   nucleus context : V=1,0 L=0, size=4mb, G=0  */
        .xword  0x0000000004000000,     0xe000000104000002	/* 4 */ 
        /*   nucleus context : V=1,0 L=1, size=256M, G=0  */
        .xword  0x0000000080000000,     0xa001000180000042	/* 6 */
        /*   nucleus context : V=1,0 L=1, size=64k, G=0  */
        .xword  0x0000000000500000,     0xa000000100500042	/* 8 */
        /*   nucleus context : V=1,0 L=0, size=8k, G=0  */
        .xword  0x0000000000580000,     0x8000000100580092	/* 10 */

        /*   primary context : V=1,0 L=0, size=4mb, G=0  */
        .xword  0x0000000004000044,     0xe000000100400002	/* 12 */ 
        /*   primary context : V=1,0 L=1, size=256M, G=0  */
        .xword  0x0000000080000044,     0xa001000180000042	/* 14 */
        /*   primary context : V=1,0 L=1, size=64k, G=0  */
        .xword  0x0000000000500044,     0xa000000100500042	/* 16 */
        /*   primary context : V=1,0 L=0, size=8k, G=0  */
        .xword  0x0000000000580044,     0x8000000100580092	/* 18 */

        /*   secondary  context : V=1,0 L=0, size=4mb, G=0  */
        .xword  0x0000000004000055,     0xe000000100400002	/* 20 */ 
        /*   secondary  context : V=1,0 L=1, size=256M, G=0  */
        .xword  0x0000000080000055,     0xa001000180000042	/* 22 */
        /*   secondary  context : V=1,0 L=1, size=64k, G=0  */
        .xword  0x0000000000500055,     0xa000000100500042	/* 24 */
        /*   secondary  context : V=1,0 L=0, size=8k, G=0  */
        .xword  0x0000000000580055,     0x8000000100580092	/* 26 */


	/*   nucl context : L=0, size=4M, G=0  */
	.xword	0x0000000010400000,	0xe000000200400002		/* 28 */
	.xword	0x0000000010400000,	0x6000000200400002		/* 30 */
	/*   prim context : L=0, size=4M, G=0  */
	.xword	0x0000000010400044,	0xe000000200400002		/* 32 */
	.xword	0x0000000010400044,	0x6000000200400002		/* 34 */
	/*   secondary context : L=0, size=4M, G=0  */
	.xword	0x0000000010400055,	0xe000000200400002		/* 36 */
	.xword	0x0000000010400055,	0x6000000200400002		/* 38 */

	/*   nucl context : L=0, size=256M, G=0  */
	.xword	0x0000000010000000,	0xa001000110000002		/* 40 */
	.xword	0x0000000010000000,	0x2001000110000002		/* 42 */
	/*   prim context : L=0, size=256M, G=0  */
	.xword	0x0000000010000044,	0xa001000110000002		/* 44 */
	.xword	0x0000000010000044,	0x2001000110000002		/* 46 */
	/*   secondary context : L=0, size=256M, G=0  */
	.xword	0x0000000010000055,	0xa001000110000002		/* 48 */
	.xword	0x0000000010000055,	0x2001000110000002		/* 50 */

	/*   secondary context : L=0, size=64k, G=1  */
	.xword	0x0000000011a50055,	0xa000000101a50003		/* 52 */
	.xword	0x0000000011a50055,	0x2000000101a50003		/* 54 */
	/*   primary context : L=0, size=64k, G=0  */
	.xword	0x0000000011400044,	0xa000000101400002		/* 56 */
	.xword	0x0000000011400044,	0x2000000101400002		/* 58 */
	/*   nucleus context : L=0, size=64k, G=1  */
	.xword	0x0000000011a50000,	0xa000000101a50003		/* 60 */
	.xword	0x0000000011a50000,	0x2000000101a50003		/* 62 */

	/*   secondary context : L=1, size=4M, G=1  */
	.xword	0x0000000011c00055,	0x6000000101c00043		/* 51 */
	.xword	0x0000000012000055,	0xe000000102000043		/* 52 */

	/*   primary context : V=1,0 L=0, size=8k, G=0  */
	.xword	0x0000000012080044,	0x8000000102080002		/* 53 */
	.xword	0x0000000012100044,	0x0000000102100002		/* 54 */

	/*   primary context : L=0, size=8k, G=1  */
	.xword	0x0000000012110044,	0x8000000102110003	/* 55 */
	.xword	0x0000000012120044,	0x0000000102120003		/* 56 */

	/*   primary context : L=0, size=64k, G=0  */
	.xword	0x0000000012130044,	0xa000000102130002		/* 57 */
	.xword	0x0000000012140044,	0x2000000102140002		/* 58 */

	/*   primary context : L=0, size=64k, G=1  */
	.xword	0x0000000012150044,	0xa000000102150003		/* 59 */
	.xword	0x0000000012160044,	0x2000000102160003		/* 60 */

	/*   primary context : L=0, size=4M, G=0  */
	.xword	0x0000000012200044,	0xe000000102200002		/* 61 */
	.xword	0x0000000012280044,	0x6000000102280002		/* 62 */

	/*   primary context : L=0, size=4M, G=1  */
	.xword	0x0000000012300044,	0xe000000102300003		/* 63 */
	.xword	0x0000000012380044,	0x6000000102380003		/* 64 */

	/*   primary context : L=0, size=4M, G=0  */
	.xword	0x0000000012400044,	0xe000000102400002		/* 62 */
	.xword	0x0000000012800044,	0x6000000102800002		/* 1 */

	/*   nucleus context : L=0, size=64k, G=0  */
	.xword	0x00000000051a0000,	0xa0000001051a0002		/* 64 */
	.xword	0x00000000051b0000,	0x20000001051b0002		/* 1 */

	/*   nucleus context : L=0, size=64k, G=1  */
	.xword	0x00000000051c0000,	0xa0000001051c0003		/* 1 */
	.xword	0x00000000051d0000,	0x20000001051d0003		/* 1 */

	/*   nucleus context : L=0, size=4M, G=0  */
	.xword	0x0000000000200000,	0xe000000100200002		/* 1 */
	.xword	0x0000000000280000,	0x6000000100280002		/* 1 */

	/*   nucleus context : L=0, size=4M, G=1  */
	.xword	0x0000000000300000,	0xe000000100300003		/* 1 */
	.xword	0x0000000000380000,	0x6000000100380003		/* 1 */

	/*   nucleus context : L=0, size=4M, G=0  */
	.xword	0x0000000000400000,	0xe000000100400002		/* 1 */
	.xword	0x0000000000800000,	0x6000000100800002		/* 1 */

	/*   nucleus context : L=0, size=4M, G=1  */
	.xword	0x0000000000c00000,	0xe00000010c000003		/* 1 */
	.xword	0x0000000001000000,	0x6000000110000003		/* 1 */

	/*   nucleus context : V=1,0 L=1, size=8k, G=0  */
	.xword	0x0000000001a10000,	0x8000000101a10042		/* 1 */
	.xword	0x0000000001a18000,	0x0000000101a18042		/* 1 */

	/*   nucleus context : L=1, size=8k, G=1  */
	.xword	0x0000000001a20000,	0x8000000101a20043	/* 1 */
	.xword	0x0000000001a28000,	0x0000000101a28043		/* 1 */

.align 	8192

new_page0:
	.word	0xffffeee1
	.word	0xffffeee2
	.word	0xffffeee3
	.word	0xffffeee4


SECTION .USER_TRAP TEXT_VA=0x1600000
attr_text {
        Name = .USER_TRAP
        hypervisor
        }

.seg "text"
.align 0x100

.text
.align 0x100
/*
 **********************************************
 * Customized fast DMMU page fault handler 
 *
 * Input : 
 
 	%o0 : if 0, use standard way to 
 		handle the DMMU miss;
 
 	Otherwise, use propritary trap handler	
 **********************************************
 */
.global T0_fast_dmmu_miss
T0_fast_dmmu_miss:
	brnz	%o0,	ld_dtsb
	nop

standard_trap:
#include "dmmu_miss_handler.s"
#include "dmmu_miss_handler_ext.s"

ld_dtsb:
	/* 
	 * %o0 has the test case # , which we used 
	 * as an index to the TSB entry in the memory. 
	 */
	sub	%o0,	0x1,	%o1	/* index starts from 0 */	
					/* %o0 starts from 1 */
	sll	%o1,	4,	%o2
	sll	%o1,	3,	%o5
	add	%o5,	0x20,	%o5
	mov	0x0,	%o3
	setx	dtsb_table1, %o3, %o4	
	add	%o2,	%o4,	%o4
	ldda	[%o4] 0x24,	%g4		/* g4 : TTE tag */
						/* g5 : TTE data */
        mov  0x30, %o3
        stxa  %g4, [ %o3 ] 0x58
        stxa  %g5, [ %o5 ] 0x5d

	set	0x208,	%o6	    /* real bit va[9] = 1, 8 is the next entry */
	add	%o5,	%o6,	%o7
        stxa  %g4, [ %o3 ] 0x58
        stxa  %g5, [ %o7 ] 0x5d	    /* same entry as last write, but, real bit is set */

        done
        nop

