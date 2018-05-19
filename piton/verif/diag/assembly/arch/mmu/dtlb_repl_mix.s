// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: dtlb_repl_mix.s
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
!!      This file has the micro-code to test out the MMU registers
!!
!!-------------------------------------------------------------------------------

#define MAIN_PAGE_HV_ALSO

/*
 * Use our own MMU miss handler
 */
#define H_HT0_fast_data_access_MMU_miss          T0_fast_dmmu_miss


#include "boot.s"

.text

.global main
.global T0_fast_dmmu_miss

main:

	/* change to privileged mode to write DMMU reg */
dmmu_page_miss1:
	mov	0x1,	%o0
	mov	0x0,	%l6
	mov	0x3e,	%l7
	setx	data_pg0, %l0,	%l2
dmiss_loop1:
	ldx	[%l2],	%l3
	nop

	add	%o0,	0x1,	%o0	
	add	%l6,	0x1,	%l6

	sub	%l6,	%l7,	%l4
	brnz	%l4,	dmiss_loop1
	nop

	call	dtlb_repl_test
	nop

	ta	T_CHANGE_HPRIV
	nop
test_1:
	mov	0x3d,	%l0
	mov	0x0,	%l1
	mov	0x18,	%l5	/* skip the first 3 entries */
	mov	0x0,	%o0	/* standard DMMU miss handler */
	setx	dtsb_table1,	%l1,	%l2
preload_dtlb1:
	ldx	[%l2],		%g4
	ldx	[%l2+0x8], 	%g5	
	add	%l2,	0x10,	%l2	
	
	mov	0x30,	%l3
        stxa    %g4,    [%l3] 0x58	/* tag access reg */
        stxa    %g5,    [%l5] 0x5d	/* data access reg */
	add	%l5,	0x8,	%l5

	add	%l1,	0x1,	%l1
	sub	%l1,	%l0,	%l6
	brnz	%l6,	preload_dtlb1
	nop

	call	dtlb_repl_test
	nop

	ta	T_CHANGE_HPRIV
	nop
test_2:
	/*
	 *	clear all the entries in the DTLB, except the first 3 entries
	 */
        mov     0x3d,   %l0
        mov     0x0,    %l1
        mov     0x18,   %l5     /* skip the first 3 entries */
        mov     0x0,    %o0     /* standard DMMU miss handler */
reset_dtlb1:  
	mov	0x0,	%g4
	mov	0x0,	%g5

        mov     0x30,   %l3
        stxa    %g4,    [%l3] 0x58      /* tag access reg */
        stxa    %g5,    [%l5] 0x5d      /* data access reg */
        add     %l5,    0x8,    %l5

        add     %l1,    0x1,    %l1
        sub     %l1,    %l0,    %l6
        brnz    %l6,    reset_dtlb1
        nop

	/*
	 *	load second DTLB table to test out the replacement
	 */
        mov     0x3d,   %l0
        mov     0x0,    %l1
        mov     0x18,   %l5     /* skip the first 3 entries */
        mov     0x0,    %o0     /* standard DMMU miss handler */
        setx    dtsb_table2,    %l1,    %l2 
preload_dtlb2:  
        ldx     [%l2],          %g4
        ldx     [%l2+0x8],      %g5
        add     %l2,    0x10,   %l2

        mov     0x30,   %l3
        stxa    %g4,    [%l3] 0x58      /* tag access reg */
        stxa    %g5,    [%l5] 0x5d      /* data access reg */
        add     %l5,    0x8,    %l5

        add     %l1,    0x1,    %l1
        sub     %l1,    %l0,    %l6
        brnz    %l6,    preload_dtlb2
        nop

	ta	T_CHANGE_NONHPRIV
	nop


dmmu_page_miss2:
	set	0xff005500,	%l0
	call	dtlb_repl_test
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

/* 
 *************************************************************
 * function :
 *	dtlb_repl_test
 *
 * 	This function do a bunch of load/stores to 
 * 	generate DMMU misses. Also, it reads out
 *	the DMMU DTLB table to do the cross-checking
 * 	between RTL and SAS. 
 *************************************************************
 */
dtlb_repl_test:
	save

test_case1:
	mov	0x0,	%o0
        /*
         * do a bunch of load's to make page faults
         */
        set     0x0,    %l0
        setx    data_pg0, %l0, %l1
        ldx     [%l1],  %l2

        set     0x0,    %l0
        setx    data_pg1, %l0, %l1
        ldx     [%l1],  %l2

        set     0x0,    %l0
        setx    data_pg2, %l0, %l1
        ldx     [%l1],  %l2

        set     0x0,    %l0
        setx    data_pg3, %l0, %l1
        ldx     [%l1],  %l2

        set     0x0,    %l0
        setx    data_pg4, %l0, %l1
        ldx     [%l1],  %l2

        set     0x0,    %l0
        setx    data_pg5, %l0, %l1
        ldx     [%l1],  %l2

        set     0x0,    %l0
        setx    data_pg6, %l0, %l1
        ldx     [%l1],  %l2

        set     0x0,    %l0
        setx    data_pg7, %l0, %l1
        ldx     [%l1],  %l2

        /*
         * do a bunch of store's to make page faults
         */
	set	0xffaabbcc,	%l2
        set     0x0,    %l0
        setx    data_pg8, %l0, %l1
	stx	%l2,	[%l1]

	set	0xffaabbcc,	%l2
        set     0x0,    %l0
        setx    data_pg9, %l0, %l1
	stx	%l2,	[%l1]

	set	0xffaabbcc,	%l2
        set     0x0,    %l0
        setx    data_pg10, %l0, %l1
	stx	%l2,	[%l1]

	set	0xffaabbcc,	%l2
        set     0x0,    %l0
        setx    data_pg11, %l0, %l1
	stx	%l2,	[%l1]

	set	0xffaabbcc,	%l2
        set     0x0,    %l0
        setx    data_pg12, %l0, %l1
	stx	%l2,	[%l1]

	set	0xffaabbcc,	%l2
        set     0x0,    %l0
        setx    data_pg13, %l0, %l1
	stx	%l2,	[%l1]

	set	0xffaabbcc,	%l2
        set     0x0,    %l0
        setx    data_pg14, %l0, %l1
	stx	%l2,	[%l1]

	set	0xffaabbcc,	%l2
        set     0x0,    %l0
        setx    data_pg15, %l0, %l1
	stx	%l2,	[%l1]

	ta	T_CHANGE_HPRIV
	nop

        /* read out all the entries in D-TLB table to compare */
        set     0x0,    %l0
        set     0x40,   %l6
        set     0x0,    %l7
rd_dtlb_loop1:
        ldxa    [%l7] 0x5d,     %l3
        ldxa    [%l7] 0x5e,     %l4

        add     %l7,    0x8,    %l7
        add     %l0,    0x1,    %l0

        sub     %l0,    %l6,    %l5
        brnz,a  %l5,    rd_dtlb_loop1
        nop

	ta	T_CHANGE_NONHPRIV
	nop

dtlb_call_rtn:
        restore
        retl
        nop

.data

.global dtsb_table1

dtsb_table1:
	/*   nucleus context : V=1,0 L=0, size=8k, G=0  */
	.xword	0x0000000005180000,	0x8000000105180002	
	.xword	0x0000000005188000,	0x0000000105188002	

	/*   nucleus context : L=0, size=8k, G=1  */
	.xword	0x0000000005190000,	0x8000000105190003
	.xword	0x0000000005198000,	0x0000000105198003	

	/*   nucleus context : L=0, size=64k, G=0  */
	.xword	0x00000000051a0000,	0xa0000001051a0002	
	.xword	0x00000000051b0000,	0x20000001051b0002	

	/*   nucleus context : L=0, size=64k, G=1  */
	.xword	0x00000000051c0000,	0xa0000001051c0003	
	.xword	0x00000000051d0000,	0x20000001051d0003	

	/*   nucleus context : L=0, size=4M, G=0  */
	.xword	0x0000000000200000,	0xe000000100200002	
	.xword	0x0000000000280000,	0x6000000100280002	

	/*   nucleus context : L=0, size=4M, G=1  */
	.xword	0x0000000000300000,	0xe000000100300003	
	.xword	0x0000000000380000,	0x6000000100380003	

	/*   nucleus context : L=0, size=4M, G=0  */
	.xword	0x0000000000400000,	0xe000000100400002	
	.xword	0x0000000000800000,	0x6000000100800002	

	/*   nucleus context : L=0, size=4M, G=1  */
	.xword	0x0000000000c00000,	0xe00000010c000003	
	.xword	0x0000000001000000,	0x6000000110000003	

	/*   nucleus context : V=1,0 L=1, size=8k, G=0  */
	.xword	0x0000000001a10000,	0x8000000101a10042	
	.xword	0x0000000001a18000,	0x0000000101a18042	

	/*   nucleus context : L=1, size=8k, G=1  */
	.xword	0x0000000001a20000,	0x8000000101a20043
	.xword	0x0000000001a28000,	0x0000000101a28043	

	/*   nucleus context : L=1, size=64k, G=0  */
	.xword	0x0000000001a30000,	0xa000000101a30042	
	.xword	0x0000000001a40000,	0x2000000101a40042	

	/*   nucleus context : L=1, size=64k, G=1  */
	.xword	0x0000000001a50000,	0xa000000101a50043	
	.xword	0x0000000001a60000,	0x2000000101a60043	

	/*   nucleus context : L=1, size=4M, G=0  */
	.xword	0x0000000001a80000,	0xe000000101a80042	
	.xword	0x0000000001b00000,	0x6000000101b00042	

	/*   nucleus context : L=1, size=4M, G=1  */
	.xword	0x0000000001b80000,	0xe000000101b80043	
	.xword	0x0000000001c00000,	0x60000001010c0043	

	/*   nucleus context : L=1, size=4M, G=0  */
	.xword	0x0000000002400000,	0xe000000102400042	
	.xword	0x0000000001800000,	0x6000000101800042	

	/*   nucleus context : L=1, size=4M, G=1  */
	.xword	0x0000000001c00000,	0x6000000101c00043	
	.xword	0x0000000002000000,	0xe000000102000043	

	/*   primary context : V=1,0 L=0, size=8k, G=0  */
	.xword	0x0000000002080044,	0x8000000102080002	
	.xword	0x0000000002100044,	0x0000000102100002	

	/*   primary context : L=0, size=8k, G=1  */
	.xword	0x0000000002110044,	0x8000000102110003
	.xword	0x0000000002120044,	0x0000000102120003	

	/*   primary context : L=0, size=64k, G=0  */
	.xword	0x0000000002130044,	0xa000000102130002	
	.xword	0x0000000002140044,	0x2000000102140002	

	/*   primary context : L=0, size=64k, G=1  */
	.xword	0x0000000002150044,	0xa000000102150003	
	.xword	0x0000000002160044,	0x2000000102160003	

	/*   primary context : L=0, size=4M, G=0  */
	.xword	0x0000000002200044,	0xe000000102200002	
	.xword	0x0000000002280044,	0x6000000102280002	

	/*   primary context : L=0, size=4M, G=1  */
	.xword	0x0000000002300044,	0xe000000102300003	
	.xword	0x0000000002380044,	0x6000000102380003	

	/*   primary context : L=0, size=4M, G=0  */
	.xword	0x0000000002400044,	0xe000000102400002	
	.xword	0x0000000002800044,	0x6000000102800002	

	/*   primary context : L=0, size=4M, G=1  */
	.xword	0x0000000002c00044,	0xe000000102c00003	
	.xword	0x0000000003000044,	0x6000000103000003	

	/*   primary context : V=1,0 L=1, size=8k, G=0  */
	.xword	0x0000000003010044,	0x8000000103010042	
	.xword	0x0000000003018044,	0x0000000103018042	

	/*   primary context : L=1, size=8k, G=1  */
	.xword	0x0000000003020044,	0x8000000103020043
	.xword	0x0000000003028044,	0x0000000103028043	

	/*   primary context : L=1, size=64k, G=0  */
	.xword	0x0000000003030044,	0xa000000103030042	
	.xword	0x0000000003040044,	0x2000000103040042	

	/*   primary context : L=1, size=64k, G=1  */
	.xword	0x0000000003050044,	0xa000000103050043	
	.xword	0x0000000003060044,	0x2000000103060043	

	/*   primary context : L=1, size=4M, G=0  */
	.xword	0x0000000003080044,	0xe000000103080042	
	.xword	0x0000000003100044,	0x6000000103100042	

	/*   primary context : L=1, size=4M, G=1  */
	.xword	0x0000000003180044,	0xe000000103180043	
	.xword	0x0000000003200044,	0x6000000103200043	

	/*   primary context : L=1, size=4M, G=0  */
	.xword	0x0000000003400044,	0xe000000103200042	
	.xword	0x0000000003800044,	0x6000000103200042	

	/*   primary context : L=1, size=4M, G=1  */
	.xword	0x0000000003c00044,	0xe000000103200043	
	.xword	0x0000000004000044,	0x6000000104000043

	/*   secondary context : L=0, size=64k, G=0  */
	.xword	0x00000000151a0055,	0xa0000001051a0002	
	.xword	0x00000000151b0055,	0x20000001051b0002	

	/*   secondary context : L=0, size=64k, G=1  */
	.xword	0x00000000151c0055,	0xa0000001051c0003	
	.xword	0x00000000151d0055,	0x20000001051d0003	

	/*   secondary context : L=0, size=4M, G=0  */
	.xword	0x0000000010200055,	0xe000000100200002	
	.xword	0x0000000010280055,	0x6000000100280002	

	/*   secondary context : L=0, size=4M, G=1  */
	.xword	0x0000000010300055,	0xe000000100300003	
	.xword	0x0000000010380055,	0x6000000100380003	

	/*   secondary context : L=0, size=4M, G=0  */
	.xword	0x0000000010400055,	0xe000000100400002	
	.xword	0x0000000010800055,	0x6000000100800002	

	/*   secondary context : L=0, size=4M, G=1  */
	.xword	0x0000000010c00055,	0xe00000010c000003	
	.xword	0x0000000011000055,	0x6000000110000003	

	/*   secondary context : V=1,0 L=1, size=8k, G=0  */
	.xword	0x0000000011a10055,	0x8000000101a10042	
	.xword	0x0000000011a18055,	0x0000000101a18042	

	/*   secondary context : L=1, size=8k, G=1  */
	.xword	0x0000000011a20055,	0x8000000101a20043
	.xword	0x0000000011a28055,	0x0000000101a28043	

.align	1024

.global dtsb_table2

dtsb_table2:
	/*   secondary context : V=1,0 L=0, size=8k, G=0  */
	.xword	0x0000000015180055,	0x8000000105180002	
	.xword	0x0000000015188055,	0x0000000105188002	

	/*   secondary context : L=0, size=8k, G=1  */
	.xword	0x0000000015190055,	0x8000000105190003
	.xword	0x0000000015198055,	0x0000000105198003	

	/*   secondary context : L=0, size=64k, G=0  */
	.xword	0x00000000151a0055,	0xa0000001051a0002	
	.xword	0x00000000151b0055,	0x20000001051b0002	

	/*   secondary context : L=0, size=64k, G=1  */
	.xword	0x00000000151c0055,	0xa0000001051c0003	
	.xword	0x00000000151d0055,	0x20000001051d0003	

	/*   secondary context : L=0, size=4M, G=0  */
	.xword	0x0000000010200055,	0xe000000100200002	
	.xword	0x0000000010280055,	0x6000000100280002	

	/*   secondary context : L=0, size=4M, G=1  */
	.xword	0x0000000010300055,	0xe000000100300003	
	.xword	0x0000000010380055,	0x6000000100380003	

	/*   secondary context : L=0, size=4M, G=0  */
	.xword	0x0000000010400055,	0xe000000100400002	
	.xword	0x0000000010800055,	0x6000000100800002	

	/*   secondary context : L=0, size=4M, G=1  */
	.xword	0x0000000010c00055,	0xe00000010c000003	
	.xword	0x0000000011000055,	0x6000000110000003	

	/*   secondary context : V=1,0 L=1, size=8k, G=0  */
	.xword	0x0000000011a10055,	0x8000000101a10042	
	.xword	0x0000000011a18055,	0x0000000101a18042	

	/*   secondary context : L=1, size=8k, G=1  */
	.xword	0x0000000011a20055,	0x8000000101a20043
	.xword	0x0000000011a28055,	0x0000000101a28043	

	/*   secondary context : L=1, size=64k, G=0  */
	.xword	0x0000000011a30055,	0xa000000101a30042	
	.xword	0x0000000011a40055,	0x2000000101a40042	

	/*   secondary context : L=1, size=64k, G=1  */
	.xword	0x0000000011a50055,	0xa000000101a50043	
	.xword	0x0000000011a60055,	0x2000000101a60043	

	/*   secondary context : L=1, size=4M, G=0  */
	.xword	0x0000000011a80055,	0xe000000101a80042	
	.xword	0x0000000011b00055,	0x6000000101b00042	

	/*   secondary context : L=1, size=4M, G=1  */
	.xword	0x0000000011b80055,	0xe000000101b80043	
	.xword	0x0000000011c00055,	0x60000001010c0043	

	/*   secondary context : L=1, size=4M, G=0  */
	.xword	0x0000000011400055,	0xe000000111400042	
	.xword	0x0000000011800055,	0x6000000101800042	

	/*   secondary context : L=1, size=4M, G=1  */
	.xword	0x0000000011c00055,	0x6000000101c00043	
	.xword	0x0000000012000055,	0xe000000102000043	

	/*   primary context : V=1,0 L=0, size=8k, G=0  */
	.xword	0x0000000012080044,	0x8000000102080002	
	.xword	0x0000000012100044,	0x0000000102100002	

	/*   primary context : L=0, size=8k, G=1  */
	.xword	0x0000000012110044,	0x8000000102110003
	.xword	0x0000000012120044,	0x0000000102120003	

	/*   primary context : L=0, size=64k, G=0  */
	.xword	0x0000000012130044,	0xa000000102130002	
	.xword	0x0000000012140044,	0x2000000102140002	

	/*   primary context : L=0, size=64k, G=1  */
	.xword	0x0000000012150044,	0xa000000102150003	
	.xword	0x0000000012160044,	0x2000000102160003	

	/*   primary context : L=0, size=4M, G=0  */
	.xword	0x0000000012200044,	0xe000000102200002	
	.xword	0x0000000012280044,	0x6000000102280002	

	/*   primary context : L=0, size=4M, G=1  */
	.xword	0x0000000012300044,	0xe000000102300003	
	.xword	0x0000000012380044,	0x6000000102380003	

	/*   primary context : L=0, size=4M, G=0  */
	.xword	0x0000000012400044,	0xe000000102400002	
	.xword	0x0000000012800044,	0x6000000102800002	

	/*   primary context : L=0, size=4M, G=1  */
	.xword	0x0000000012c00044,	0xe000000102c00003	
	.xword	0x0000000013000044,	0x6000000103000003	

	/*   primary context : V=1,0 L=1, size=8k, G=0  */
	.xword	0x0000000013010044,	0x8000000103010042	
	.xword	0x0000000013018044,	0x0000000103018042	

	/*   primary context : L=1, size=8k, G=1  */
	.xword	0x0000000013020044,	0x8000000103020043
	.xword	0x0000000013028044,	0x0000000103028043	

	/*   primary context : L=1, size=64k, G=0  */
	.xword	0x0000000013030044,	0xa000000103030042	
	.xword	0x0000000013040044,	0x2000000103040042	

	/*   primary context : L=1, size=64k, G=1  */
	.xword	0x0000000013050044,	0xa000000103050043	
	.xword	0x0000000013060044,	0x2000000103060043	

	/*   primary context : L=1, size=4M, G=0  */
	.xword	0x0000000013080044,	0xe000000103080042	
	.xword	0x0000000013100044,	0x6000000103100042	

	/*   primary context : L=1, size=4M, G=1  */
	.xword	0x0000000013180044,	0xe000000103180043	
	.xword	0x0000000013200044,	0x6000000103200043	

	/*   primary context : L=1, size=4M, G=0  */
	.xword	0x0000000013400044,	0xe000000103200042	
	.xword	0x0000000013800044,	0x6000000103200042	

	/*   primary context : L=1, size=4M, G=1  */
	.xword	0x0000000013c00044,	0xe000000103200043	
	.xword	0x0000000014000044,	0x6000000104000043

        /*   nucleus context : V=1,0 L=0, size=8k, G=0  */
        .xword  0x0000000005180000,     0x8000000105180002
        .xword  0x0000000005188000,     0x0000000105188002

	/*   primary context : V=1,0 L=0, size=8k, G=0  */
	.xword	0x0000000005180044,	0x8000000105180002	
	.xword	0x0000000005188044,	0x0000000105188002	

	/*   secondary context : V=1,0 L=0, size=8k, G=0  */
	.xword	0x0000000005180055,	0x8000000105180002	
	.xword	0x0000000005188055,	0x0000000105188002	

	/*   nucl context : V=1,0 L=1, size=8k, G=0  */
	.xword	0x0000000011a10000,	0x8000000101a10042	
	.xword	0x0000000011a18000,	0x0000000101a18042	

	/*   prim context : V=1,0 L=1, size=8k, G=0  */
	.xword	0x0000000011a10044,	0x8000000101a10042	
	.xword	0x0000000011a18044,	0x0000000101a18042	

	/*   secondary context : V=1,0 L=1, size=8k, G=0  */
	.xword	0x0000000011a10055,	0x8000000101a10042	
	.xword	0x0000000011a18055,	0x0000000101a18042	

	/*   nucleus context : L=0, size=64k, G=0  */
	.xword	0x00000000051a0000,	0xa0000001051a0002	
	.xword	0x00000000051b0000,	0x20000001051b0002	

	/*   primary context : L=0, size=64k, G=0  */
	.xword	0x00000000051a0044,	0xa0000001051a0002	
	.xword	0x00000000051b0044,	0x20000001051b0002	

.align 1024

.global dtsb_table3

dtsb_table3:
        /*   nucleus context : V=1,0 L=0, size=8k, G=0  */
        .xword  0x0000000005180000,     0x8000000105180002	/* 0 */ 
        .xword  0x0000000005188000,     0x0000000105188002	/* 1 */

	/*   primary context : V=1,0 L=0, size=8k, G=0  */
	.xword	0x0000000005180044,	0x8000000105180002		/* 2 */
	.xword	0x0000000005188044,	0x0000000105188002		/* 3 */

	/*   secondary context : V=1,0 L=0, size=8k, G=0  */
	.xword	0x0000000005180055,	0x8000000105180002		/* 4 */
	.xword	0x0000000005188055,	0x0000000105188002		/* 5 */

	/*   nucl context : V=1,0 L=1, size=8k, G=0  */
	.xword	0x0000000011a10000,	0x8000000101a10042		/* 6 */
	.xword	0x0000000011a18000,	0x0000000101a18042		/* 7 */

	/*   prim context : V=1,0 L=1, size=8k, G=0  */
	.xword	0x0000000011a10044,	0x8000000101a10042		/* 8 */
	.xword	0x0000000011a18044,	0x0000000101a18042		/* 9 */

	/*   secondary context : V=1,0 L=1, size=8k, G=0  */
	.xword	0x0000000011a10055,	0x8000000101a10042		/* 10 */
	.xword	0x0000000011a18055,	0x0000000101a18042		/* 11 */

	/*   nucleus context : L=0, size=64k, G=0  */
	.xword	0x00000000051a0000,	0xa0000001051a0002		/* 12 */
	.xword	0x00000000051b0000,	0x20000001051b0002		/* 13 */

	/*   primary context : L=0, size=64k, G=0  */
	.xword	0x00000000051a0044,	0xa0000001051a0002		/* 14 */
	.xword	0x00000000051b0044,	0x20000001051b0002		/* 1 */

	/*   secondary context : L=0, size=64k, G=0  */
	.xword	0x00000000051a0055,	0xa0000001051a0002		/* 16 */
	.xword	0x00000000051b0055,	0x20000001051b0002		/* 1 */

	/*   prim context : L=1, size=4M, G=0  */
	.xword	0x0000000011a80044,	0xe000000101a80042		/* 18 */
	.xword	0x0000000011b00044,	0x6000000101b00042		/* 1 */

	/*   secondary context : L=1, size=4M, G=0  */
	.xword	0x0000000011a80055,	0xe000000101a80042		/* 20 */
	.xword	0x0000000011b00055,	0x6000000101b00042		/* 1 */

	/*   nucl context : L=1, size=4M, G=0  */
	.xword	0x0000000011a80000,	0xe000000101a80042		/* 22 */
	.xword	0x0000000011b00000,	0x6000000101b00042		/* 23 */

	/*   nucl context : L=0, size=4M, G=0  */
	.xword	0x0000000010200000,	0xe000000100200002		/* 24 */
	.xword	0x0000000010280000,	0x6000000100280002		/* 25 */

	/*   prim context : L=0, size=4M, G=0  */
	.xword	0x0000000010200044,	0xe000000100200002		/* 26 */
	.xword	0x0000000010280044,	0x6000000100280002		/* 27 */

	/*   secondary context : L=0, size=4M, G=0  */
	.xword	0x0000000010200055,	0xe000000100200002		/* 28 */
	.xword	0x0000000010280055,	0x6000000100280002		/* 29 */

	/*   nucl context : L=0, size=4M, G=0  */
	.xword	0x0000000010400000,	0xe000000100400002		/* 30 */
	.xword	0x0000000010800000,	0x6000000100800002		/* 31 */

	/*   prim context : L=0, size=4M, G=0  */
	.xword	0x0000000010400044,	0xe000000100400002		/* 32 */
	.xword	0x0000000010800044,	0x6000000100800002		/* 33 */

	/*   secondary context : L=0, size=4M, G=0  */
	.xword	0x0000000010400055,	0xe000000100400002		/* 34 */
	.xword	0x0000000010800055,	0x6000000100800002		/* 35 */

	/*   nucl context : L=1, size=64k, G=0  */
	.xword	0x0000000011a30000,	0xa000000101a30042		/* 36 */
	.xword	0x0000000011a40000,	0x2000000101a40042		/* 37 */

	/*   prim context : L=1, size=64k, G=0  */
	.xword	0x0000000011a30044,	0xa000000101a30042		/* 38 */
	.xword	0x0000000011a40044,	0x2000000101a40042		/* 39 */

	/*   secondary context : L=1, size=64k, G=0  */
	.xword	0x0000000011a30055,	0xa000000101a30042		/* 40 */
	.xword	0x0000000011a40055,	0x2000000101a40042		/* 41 */

	/*   secondary context : L=1, size=64k, G=1  */
	.xword	0x0000000011a50055,	0xa000000101a50043		/* 42 */
	.xword	0x0000000011a60055,	0x2000000101a60043		/* 43 */

	/*   secondary context : L=1, size=4M, G=1  */
	.xword	0x0000000011b80055,	0xe000000101b80043		/* 44 */
	.xword	0x0000000011c00055,	0x60000001010c0043		/* 45 */

	/*   secondary context : L=1, size=4M, G=0  */
	.xword	0x0000000011400055,	0xe000000111400042		/* 46 */
	.xword	0x0000000011800055,	0x6000000101800042		/* 47 */

	/*   secondary context : L=1, size=4M, G=1  */
	.xword	0x0000000011c00055,	0x6000000101c00043		/* 48 */
	.xword	0x0000000012000055,	0xe000000102000043		/* 49 */

	/*   primary context : V=1,0 L=0, size=8k, G=0  */
	.xword	0x0000000012080044,	0x8000000102080002		/* 50 */
	.xword	0x0000000012100044,	0x0000000102100002		/* 51 */

	/*   primary context : L=0, size=8k, G=1  */
	.xword	0x0000000012110044,	0x8000000102110003	/* 52 */
	.xword	0x0000000012120044,	0x0000000102120003		/* 1 */

	/*   primary context : L=0, size=64k, G=0  */
	.xword	0x0000000012130044,	0xa000000102130002		/* 54 */
	.xword	0x0000000012140044,	0x2000000102140002		/* 1 */

	/*   primary context : L=0, size=64k, G=1  */
	.xword	0x0000000012150044,	0xa000000102150003		/* 56 */
	.xword	0x0000000012160044,	0x2000000102160003		/* 1 */

	/*   primary context : L=0, size=4M, G=0  */
	.xword	0x0000000012200044,	0xe000000102200002		/* 58 */
	.xword	0x0000000012280044,	0x6000000102280002		/* 1 */

	/*   primary context : L=0, size=4M, G=1  */
	.xword	0x0000000012300044,	0xe000000102300003		/* 60 */
	.xword	0x0000000012380044,	0x6000000102380003		/* 1 */

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

.align 1024

.global dtsb_table4

dtsb_table4:
        /*   nucleus context : V=1,0 L=1, size=8k, G=0  */
        .xword  0x0000000005180000,     0x8000000105180042	/* 0 */ 
        .xword  0x0000000005188000,     0x0000000105188042	/* 1 */

	/*   primary context : V=1,0 L=1, size=8k, G=0  */
	.xword	0x0000000005180044,	0x8000000105180042		/* 2 */
	.xword	0x0000000005188044,	0x0000000105188042		/* 3 */

	/*   secondary context : V=1,0 L=1, size=8k, G=0  */
	.xword	0x0000000005180055,	0x8000000105180042		/* 4 */
	.xword	0x0000000005188055,	0x0000000105188042		/* 5 */

	/*   nucl context : V=1,0 L=1, size=8k, G=0  */
	.xword	0x0000000011a10000,	0x8000000101a10042		/* 6 */
	.xword	0x0000000011a18000,	0x0000000101a18042		/* 7 */

	/*   prim context : V=1,0 L=1, size=8k, G=0  */
	.xword	0x0000000011a10044,	0x8000000101a10042		/* 8 */
	.xword	0x0000000011a18044,	0x0000000101a18042		/* 9 */

	/*   secondary context : V=1,0 L=1, size=8k, G=0  */
	.xword	0x0000000011a10055,	0x8000000101a10042		/* 10 */
	.xword	0x0000000011a18055,	0x0000000101a18042		/* 11 */

	/*   nucleus context : L=1, size=64k, G=0  */
	.xword	0x00000000051a0000,	0xa0000001051a0042		/* 12 */
	.xword	0x00000000051b0000,	0x20000001051b0042		/* 13 */

	/*   primary context : L=1, size=64k, G=0  */
	.xword	0x00000000051a0044,	0xa0000001051a0042		/* 14 */
	.xword	0x00000000051b0044,	0x20000001051b0042		/* 1 */

	/*   secondary context : L=1, size=64k, G=0  */
	.xword	0x00000000051a0055,	0xa0000001051a0042		/* 16 */
	.xword	0x00000000051b0055,	0x20000001051b0042		/* 1 */

	/*   prim context : L=1, size=4M, G=0  */
	.xword	0x0000000011a80044,	0xe000000101a80042		/* 18 */
	.xword	0x0000000011b00044,	0x6000000101b00042		/* 1 */

	/*   secondary context : L=1, size=4M, G=0  */
	.xword	0x0000000011a80055,	0xe000000101a80042		/* 20 */
	.xword	0x0000000011b00055,	0x6000000101b00042		/* 1 */

	/*   nucl context : L=1, size=4M, G=0  */
	.xword	0x0000000011a80000,	0xe000000101a80042		/* 22 */
	.xword	0x0000000011b00000,	0x6000000101b00042		/* 23 */

	/*   nucl context : L=1, size=4M, G=0  */
	.xword	0x0000000010200000,	0xe000000100200042		/* 24 */
	.xword	0x0000000010280000,	0x6000000100280042		/* 25 */

	/*   prim context : L=1, size=4M, G=0  */
	.xword	0x0000000010200044,	0xe000000100200042		/* 26 */
	.xword	0x0000000010280044,	0x6000000100280042		/* 27 */

	/*   secondary context : L=1, size=4M, G=0  */
	.xword	0x0000000010200055,	0xe000000100200042		/* 28 */
	.xword	0x0000000010280055,	0x6000000100280042		/* 29 */

	/*   nucl context : L=1, size=4M, G=0  */
	.xword	0x0000000010400000,	0xe000000100400042		/* 30 */
	.xword	0x0000000010800000,	0x6000000100800042		/* 31 */

	/*   prim context : L=1, size=4M, G=0  */
	.xword	0x0000000010400044,	0xe000000100400042		/* 32 */
	.xword	0x0000000010800044,	0x6000000100800042		/* 33 */

	/*   secondary context : L=1, size=4M, G=0  */
	.xword	0x0000000010400055,	0xe000000100400042		/* 34 */
	.xword	0x0000000010800055,	0x6000000100800042		/* 35 */

	/*   nucl context : L=1, size=64k, G=0  */
	.xword	0x0000000011a30000,	0xa000000101a30042		/* 36 */
	.xword	0x0000000011a40000,	0x2000000101a40042		/* 37 */

	/*   prim context : L=1, size=64k, G=0  */
	.xword	0x0000000011a30044,	0xa000000101a30042		/* 38 */
	.xword	0x0000000011a40044,	0x2000000101a40042		/* 39 */

	/*   secondary context : L=1, size=64k, G=0  */
	.xword	0x0000000011a30055,	0xa000000101a30042		/* 40 */
	.xword	0x0000000011a40055,	0x2000000101a40042		/* 41 */

	/*   secondary context : L=1, size=64k, G=1  */
	.xword	0x0000000011a50055,	0xa000000101a50043		/* 42 */
	.xword	0x0000000011a60055,	0x2000000101a60043		/* 43 */

	/*   secondary context : L=1, size=4M, G=1  */
	.xword	0x0000000011b80055,	0xe000000101b80043		/* 44 */
	.xword	0x0000000011c00055,	0x60000001010c0043		/* 45 */

	/*   secondary context : L=1, size=4M, G=0  */
	.xword	0x0000000011400055,	0xe000000101400042		/* 46 */
	.xword	0x0000000011800055,	0x6000000101800042		/* 47 */

	/*   secondary context : L=1, size=4M, G=1  */
	.xword	0x0000000011c00055,	0x6000000101c00043		/* 48 */
	.xword	0x0000000012000055,	0xe000000102000043		/* 49 */

	/*   primary context : V=1,0 L=1, size=8k, G=0  */
	.xword	0x0000000012080044,	0x8000000102080042		/* 50 */
	.xword	0x0000000012100044,	0x0000000102100042		/* 51 */

	/*   primary context : L=1, size=8k, G=1  */
	.xword	0x0000000012110044,	0x8000000102110043	/* 52 */
	.xword	0x0000000012120044,	0x0000000102120043		/* 1 */

	/*   primary context : L=1, size=64k, G=0  */
	.xword	0x0000000012130044,	0xa000000102130042		/* 54 */
	.xword	0x0000000012140044,	0x2000000102140042		/* 1 */

	/*   primary context : L=1, size=64k, G=1  */
	.xword	0x0000000012150044,	0xa000000102150043		/* 56 */
	.xword	0x0000000012160044,	0x2000000102160043		/* 1 */

	/*   primary context : L=1, size=4M, G=0  */
	.xword	0x0000000012200044,	0xe000000102200042		/* 58 */
	.xword	0x0000000012280044,	0x6000000102280042		/* 1 */

	/*   primary context : L=1, size=4M, G=1  */
	.xword	0x0000000012300044,	0xe000000102300043		/* 60 */
	.xword	0x0000000012380044,	0x6000000102380043		/* 1 */

	/*   primary context : L=1, size=4M, G=0  */
	.xword	0x0000000012400044,	0xe000000102400042		/* 62 */
	.xword	0x0000000012800044,	0x6000000102800042		/* 1 */

	/*   nucleus context : L=1, size=64k, G=0  */
	.xword	0x00000000051a0000,	0xa0000001051a0042		/* 64 */
	.xword	0x00000000051b0000,	0x20000001051b0042		/* 1 */

	/*   nucleus context : L=1, size=64k, G=1  */
	.xword	0x00000000051c0000,	0xa0000001051c0043		/* 1 */
	.xword	0x00000000051d0000,	0x20000001051d0043		/* 1 */

	/*   nucleus context : L=1, size=4M, G=0  */
	.xword	0x0000000000200000,	0xe000000100200042		/* 1 */
	.xword	0x0000000000280000,	0x6000000100280042		/* 1 */

	/*   nucleus context : L=1, size=4M, G=1  */
	.xword	0x0000000000300000,	0xe000000100300043		/* 1 */
	.xword	0x0000000000380000,	0x6000000100380043		/* 1 */

	/*   nucleus context : L=1, size=4M, G=0  */
	.xword	0x0000000000400000,	0xe000000100400042		/* 1 */
	.xword	0x0000000000800000,	0x6000000100800042		/* 1 */

	/*   nucleus context : L=1, size=4M, G=1  */
	.xword	0x0000000000c00000,	0xe00000010c000043		/* 1 */
	.xword	0x0000000001000000,	0x6000000110000043		/* 1 */

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

.align	8192

data_pg0:
	.word	0xffffeee0
	.word	0xffffeeee
	.word	0xffffeeee
	.word	0xffffeeee
	.word	0xffffeeee
	.word	0xffffeeee
	.word	0xffffeeee
	.word	0xffffeeee
.align	8192

data_pg1:
        .word   0xffffeee1
        .word   0xffffeeee
        .word   0xffffeeee
        .word   0xffffeeee
        .word   0xffffeeee
        .word   0xffffeeee
        .word   0xffffeeee
        .word   0xffffeeee
.align	8192

data_pg2:
	.word	0xffffeee2
	.word	0xffffeeee
	.word	0xffffeeee
	.word	0xffffeeee
	.word	0xffffeeee
	.word	0xffffeeee
	.word	0xffffeeee
	.word	0xffffeeee
.align	8192

data_pg3:
        .word   0xffffeee3
        .word   0xffffeeee
        .word   0xffffeeee
        .word   0xffffeeee
        .word   0xffffeeee
        .word   0xffffeeee
        .word   0xffffeeee
        .word   0xffffeeee
.align	8192

data_pg4:
	.word	0xffffeee4
	.word	0xffffeeee
	.word	0xffffeeee
	.word	0xffffeeee
	.word	0xffffeeee
	.word	0xffffeeee
	.word	0xffffeeee
	.word	0xffffeeee
.align	8192

data_pg5:
        .word   0xffffeee5
        .word   0xffffeeee
        .word   0xffffeeee
        .word   0xffffeeee
        .word   0xffffeeee
        .word   0xffffeeee
        .word   0xffffeeee
        .word   0xffffeeee
.align	8192

data_pg6:
	.word	0xffffeee6
	.word	0xffffeeee
	.word	0xffffeeee
	.word	0xffffeeee
	.word	0xffffeeee
	.word	0xffffeeee
	.word	0xffffeeee
	.word	0xffffeeee
.align	8192

data_pg7:
        .word   0xffffeee7
        .word   0xffffeeee
        .word   0xffffeeee
        .word   0xffffeeee
        .word   0xffffeeee
        .word   0xffffeeee
        .word   0xffffeeee
        .word   0xffffeeee
.align	8192

data_pg8:
	.word	0xffffeee8
	.word	0xffffeeee
	.word	0xffffeeee
	.word	0xffffeeee
	.word	0xffffeeee
	.word	0xffffeeee
	.word	0xffffeeee
	.word	0xffffeeee
.align	8192

data_pg9:
        .word   0xffffeee9
        .word   0xffffeeee
        .word   0xffffeeee
        .word   0xffffeeee
        .word   0xffffeeee
        .word   0xffffeeee
        .word   0xffffeeee
        .word   0xffffeeee
.align	8192

data_pg10:
	.word	0xffffeeea
	.word	0xffffeeee
	.word	0xffffeeee
	.word	0xffffeeee
	.word	0xffffeeee
	.word	0xffffeeee
	.word	0xffffeeee
	.word	0xffffeeee
.align	8192

data_pg11:
        .word   0xffffeeeb
        .word   0xffffeeee
        .word   0xffffeeee
        .word   0xffffeeee
        .word   0xffffeeee
        .word   0xffffeeee
        .word   0xffffeeee
        .word   0xffffeeee
.align	8192

data_pg12:
	.word	0xffffeeec
	.word	0xffffeeee
	.word	0xffffeeee
	.word	0xffffeeee
	.word	0xffffeeee
	.word	0xffffeeee
	.word	0xffffeeee
	.word	0xffffeeee
.align	8192

data_pg13:
        .word   0xffffeeed
        .word   0xffffeeee
        .word   0xffffeeee
        .word   0xffffeeee
        .word   0xffffeeee
        .word   0xffffeeee
        .word   0xffffeeee
        .word   0xffffeeee
.align	8192

data_pg14:
	.word	0xffffeeee
	.word	0xffffeeee
	.word	0xffffeeee
	.word	0xffffeeee
	.word	0xffffeeee
	.word	0xffffeeee
	.word	0xffffeeee
	.word	0xffffeeee
.align	8192

data_pg15:
        .word   0xffffeeef
        .word   0xffffeeee
        .word   0xffffeeee
        .word   0xffffeeee
        .word   0xffffeeee
        .word   0xffffeeee
        .word   0xffffeeee
        .word   0xffffeeee
.align	8192

data_pg16:
	.word	0xffffee10
	.word	0xffffeeee
	.word	0xffffeeee
	.word	0xffffeeee
	.word	0xffffeeee
	.word	0xffffeeee
	.word	0xffffeeee
	.word	0xffffeeee
.align	8192

data_pg17:
        .word   0xffffee11
        .word   0xffffeeee
        .word   0xffffeeee
        .word   0xffffeeee
        .word   0xffffeeee
        .word   0xffffeeee
        .word   0xffffeeee
        .word   0xffffeeee
.align	8192

data_pg18:
	.word	0xffffee12
	.word	0xffffeeee
	.word	0xffffeeee
	.word	0xffffeeee
	.word	0xffffeeee
	.word	0xffffeeee
	.word	0xffffeeee
	.word	0xffffeeee
.align	8192

data_pg19:
        .word   0xffffee13
        .word   0xffffeeee
        .word   0xffffeeee
        .word   0xffffeeee
        .word   0xffffeeee
        .word   0xffffeeee
        .word   0xffffeeee
        .word   0xffffeeee
.align	8192

data_pg20:
	.word	0xffffee14
	.word	0xffffeeee
	.word	0xffffeeee
	.word	0xffffeeee
	.word	0xffffeeee
	.word	0xffffeeee
	.word	0xffffeeee
	.word	0xffffeeee
.align	8192

data_pg21:
        .word   0xffffee15
        .word   0xffffeeee
        .word   0xffffeeee
        .word   0xffffeeee
        .word   0xffffeeee
        .word   0xffffeeee
        .word   0xffffeeee
        .word   0xffffeeee
.align	8192

data_pg22:
	.word	0xffffee16
	.word	0xffffeeee
	.word	0xffffeeee
	.word	0xffffeeee
	.word	0xffffeeee
	.word	0xffffeeee
	.word	0xffffeeee
	.word	0xffffeeee
.align	8192

data_pg23:
        .word   0xffffee17
        .word   0xffffeeee
        .word   0xffffeeee
        .word   0xffffeeee
        .word   0xffffeeee
        .word   0xffffeeee
        .word   0xffffeeee
        .word   0xffffeeee
.align	8192

data_pg24:
	.word	0xffffee18
	.word	0xffffeeee
	.word	0xffffeeee
	.word	0xffffeeee
	.word	0xffffeeee
	.word	0xffffeeee
	.word	0xffffeeee
	.word	0xffffeeee
.align	8192

data_pg25:
        .word   0xffffee19
        .word   0xffffeeee
        .word   0xffffeeee
        .word   0xffffeeee
        .word   0xffffeeee
        .word   0xffffeeee
        .word   0xffffeeee
        .word   0xffffeeee
.align	8192

data_pg26:
	.word	0xffffee1a
	.word	0xffffeeee
	.word	0xffffeeee
	.word	0xffffeeee
	.word	0xffffeeee
	.word	0xffffeeee
	.word	0xffffeeee
	.word	0xffffeeee
.align	8192

data_pg27:
        .word   0xffffee1b
        .word   0xffffeeee
        .word   0xffffeeee
        .word   0xffffeeee
        .word   0xffffeeee
        .word   0xffffeeee
        .word   0xffffeeee
        .word   0xffffeeee
.align	8192

data_pg28:
	.word	0xffffee1c
	.word	0xffffeeee
	.word	0xffffeeee
	.word	0xffffeeee
	.word	0xffffeeee
	.word	0xffffeeee
	.word	0xffffeeee
	.word	0xffffeeee
.align	8192

data_pg29:
        .word   0xffffee1d
        .word   0xffffeeee
        .word   0xffffeeee
        .word   0xffffeeee
        .word   0xffffeeee
        .word   0xffffeeee
        .word   0xffffeeee
        .word   0xffffeeee
.align	8192

data_pg30:
	.word	0xffffee1e
	.word	0xffffeeee
	.word	0xffffeeee
	.word	0xffffeeee
	.word	0xffffeeee
	.word	0xffffeeee
	.word	0xffffeeee
	.word	0xffffeeee
.align	8192

data_pg31:
        .word   0xffffee1f
        .word   0xffffeeee
        .word   0xffffeeee
        .word   0xffffeeee
        .word   0xffffeeee
        .word   0xffffeeee
        .word   0xffffeeee
        .word   0xffffeeee
.align	8192

data_pg32:
	.word	0xffffee20
	.word	0xffffeeee
	.word	0xffffeeee
	.word	0xffffeeee
	.word	0xffffeeee
	.word	0xffffeeee
	.word	0xffffeeee
	.word	0xffffeeee
.align	8192

data_pg33:
        .word   0xffffee21
        .word   0xffffeeee
        .word   0xffffeeee
        .word   0xffffeeee
        .word   0xffffeeee
        .word   0xffffeeee
        .word   0xffffeeee
        .word   0xffffeeee
.align	8192

data_pg34:
	.word	0xffffee22
	.word	0xffffeeee
	.word	0xffffeeee
	.word	0xffffeeee
	.word	0xffffeeee
	.word	0xffffeeee
	.word	0xffffeeee
	.word	0xffffeeee
.align	8192

data_pg35:
        .word   0xffffee23
        .word   0xffffeeee
        .word   0xffffeeee
        .word   0xffffeeee
        .word   0xffffeeee
        .word   0xffffeeee
        .word   0xffffeeee
        .word   0xffffeeee
.align	8192

data_pg36:
	.word	0xffffee24
	.word	0xffffeeee
	.word	0xffffeeee
	.word	0xffffeeee
	.word	0xffffeeee
	.word	0xffffeeee
	.word	0xffffeeee
	.word	0xffffeeee
.align	8192

data_pg37:
        .word   0xffffee25
        .word   0xffffeeee
        .word   0xffffeeee
        .word   0xffffeeee
        .word   0xffffeeee
        .word   0xffffeeee
        .word   0xffffeeee
        .word   0xffffeeee
.align	8192

data_pg38:
	.word	0xffffee26
	.word	0xffffeeee
	.word	0xffffeeee
	.word	0xffffeeee
	.word	0xffffeeee
	.word	0xffffeeee
	.word	0xffffeeee
	.word	0xffffeeee
.align	8192

data_pg39:
        .word   0xffffee27
        .word   0xffffeeee
        .word   0xffffeeee
        .word   0xffffeeee
        .word   0xffffeeee
        .word   0xffffeeee
        .word   0xffffeeee
        .word   0xffffeeee
.align	8192

data_pg40:
	.word	0xffffee28
	.word	0xffffeeee
	.word	0xffffeeee
	.word	0xffffeeee
	.word	0xffffeeee
	.word	0xffffeeee
	.word	0xffffeeee
	.word	0xffffeeee
.align	8192

data_pg41:
        .word   0xffffee29
        .word   0xffffeeee
        .word   0xffffeeee
        .word   0xffffeeee
        .word   0xffffeeee
        .word   0xffffeeee
        .word   0xffffeeee
        .word   0xffffeeee
.align	8192

data_pg42:
	.word	0xffffee2a
	.word	0xffffeeee
	.word	0xffffeeee
	.word	0xffffeeee
	.word	0xffffeeee
	.word	0xffffeeee
	.word	0xffffeeee
	.word	0xffffeeee
.align	8192

data_pg43:
        .word   0xffffee2b
        .word   0xffffeeee
        .word   0xffffeeee
        .word   0xffffeeee
        .word   0xffffeeee
        .word   0xffffeeee
        .word   0xffffeeee
        .word   0xffffeeee
.align	8192

data_pg44:
	.word	0xffffee2c
	.word	0xffffeeee
	.word	0xffffeeee
	.word	0xffffeeee
	.word	0xffffeeee
	.word	0xffffeeee
	.word	0xffffeeee
	.word	0xffffeeee
.align	8192

data_pg45:
        .word   0xffffee2d
        .word   0xffffeeee
        .word   0xffffeeee
        .word   0xffffeeee
        .word   0xffffeeee
        .word   0xffffeeee
        .word   0xffffeeee
        .word   0xffffeeee
.align	8192

data_pg46:
	.word	0xffffee2e
	.word	0xffffeeee
	.word	0xffffeeee
	.word	0xffffeeee
	.word	0xffffeeee
	.word	0xffffeeee
	.word	0xffffeeee
	.word	0xffffeeee
.align	8192

data_pg47:
        .word   0xffffee2f
        .word   0xffffeeee
        .word   0xffffeeee
        .word   0xffffeeee
        .word   0xffffeeee
        .word   0xffffeeee
        .word   0xffffeeee
        .word   0xffffeeee
.align	8192

data_pg48:
	.word	0xffffee30
	.word	0xffffeeee
	.word	0xffffeeee
	.word	0xffffeeee
	.word	0xffffeeee
	.word	0xffffeeee
	.word	0xffffeeee
	.word	0xffffeeee
.align	8192

data_pg49:
        .word   0xffffee31
        .word   0xffffeeee
        .word   0xffffeeee
        .word   0xffffeeee
        .word   0xffffeeee
        .word   0xffffeeee
        .word   0xffffeeee
        .word   0xffffeeee
.align	8192

data_pg50:
	.word	0xffffee32
	.word	0xffffeeee
	.word	0xffffeeee
	.word	0xffffeeee
	.word	0xffffeeee
	.word	0xffffeeee
	.word	0xffffeeee
	.word	0xffffeeee
.align	8192

data_pg51:
        .word   0xffffee33
        .word   0xffffeeee
        .word   0xffffeeee
        .word   0xffffeeee
        .word   0xffffeeee
        .word   0xffffeeee
        .word   0xffffeeee
        .word   0xffffeeee
.align	8192

data_pg52:
	.word	0xffffee34
	.word	0xffffeeee
	.word	0xffffeeee
	.word	0xffffeeee
	.word	0xffffeeee
	.word	0xffffeeee
	.word	0xffffeeee
	.word	0xffffeeee
.align	8192

data_pg53:
        .word   0xffffee35
        .word   0xffffeeee
        .word   0xffffeeee
        .word   0xffffeeee
        .word   0xffffeeee
        .word   0xffffeeee
        .word   0xffffeeee
        .word   0xffffeeee
.align	8192

data_pg54:
	.word	0xffffee36
	.word	0xffffeeee
	.word	0xffffeeee
	.word	0xffffeeee
	.word	0xffffeeee
	.word	0xffffeeee
	.word	0xffffeeee
	.word	0xffffeeee
.align	8192

data_pg55:
        .word   0xffffee37
        .word   0xffffeeee
        .word   0xffffeeee
        .word   0xffffeeee
        .word   0xffffeeee
        .word   0xffffeeee
        .word   0xffffeeee
        .word   0xffffeeee
.align	8192

data_pg56:
	.word	0xffffee38
	.word	0xffffeeee
	.word	0xffffeeee
	.word	0xffffeeee
	.word	0xffffeeee
	.word	0xffffeeee
	.word	0xffffeeee
	.word	0xffffeeee
.align	8192

data_pg57:
        .word   0xffffee39
        .word   0xffffeeee
        .word   0xffffeeee
        .word   0xffffeeee
        .word   0xffffeeee
        .word   0xffffeeee
        .word   0xffffeeee
        .word   0xffffeeee
.align	8192

data_pg58:
	.word	0xffffee3a
	.word	0xffffeeee
	.word	0xffffeeee
	.word	0xffffeeee
	.word	0xffffeeee
	.word	0xffffeeee
	.word	0xffffeeee
	.word	0xffffeeee
.align	8192

data_pg59:
        .word   0xffffee3b
        .word   0xffffeeee
        .word   0xffffeeee
        .word   0xffffeeee
        .word   0xffffeeee
        .word   0xffffeeee
        .word   0xffffeeee
        .word   0xffffeeee
.align	8192

data_pg60:
	.word	0xffffee3c
	.word	0xffffeeee
	.word	0xffffeeee
	.word	0xffffeeee
	.word	0xffffeeee
	.word	0xffffeeee
	.word	0xffffeeee
	.word	0xffffeeee
.align	8192

data_pg61:
        .word   0xffffee3d
        .word   0xffffeeee
        .word   0xffffeeee
        .word   0xffffeeee
        .word   0xffffeeee
        .word   0xffffeeee
        .word   0xffffeeee
        .word   0xffffeeee
.align	8192

data_pg62:
	.word	0xffffee3e
	.word	0xffffeeee
	.word	0xffffeeee
	.word	0xffffeeee
	.word	0xffffeeee
	.word	0xffffeeee
	.word	0xffffeeee
	.word	0xffffeeee
.align	8192

data_pg63:
        .word   0xffffee3f
        .word   0xffffeeee
        .word   0xffffeeee
        .word   0xffffeeee
        .word   0xffffeeee
        .word   0xffffeeee
        .word   0xffffeeee
        .word   0xffffeeee
.align	8192

.end


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
#define DMMU_MISS_TRAPPG_VA     0x600000

SECTION .USER_TRAP TEXT_VA=0x1600000
attr_text {
        Name = .USER_TRAP
	hypervisor
        }
.text
.align 0x100

.global  T0_fast_dmmu_miss

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
	add	%o5,	0x10,	%o5
	mov	0x0,	%o3
	setx	dtsb_table3, %o3, %o4	
	add	%o2,	%o4,	%o4
	ldda	[%o4] 0x24,	%g4		/* g4 : TTE tag */
						/* g5 : TTE data */
        mov  0x30, %o3
        stxa  %g4, [ %o3 ] 0x58
        stxa  %g5, [ %o5 ] 0x5d
        done
        nop

