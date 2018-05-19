// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: itlb_repl_mix.s
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
!!      This file has the micro-code to test IMMU replacement algorithm 
!!
!!-------------------------------------------------------------------------------

/*
 * Use our own MMU miss handler
 */
#define H_HT0_fast_instr_access_MMU_miss          T0_fast_immu_miss

#define MAIN_PAGE_HV_ALSO

#include "boot.s"

.text

.global main
.global T0_fast_immu_miss

main:
	mov	0x0,	%l0
immu_page_miss1:
	mov	0x1,	%o0
	mov	0x0,	%l6
	mov	0x0c,	%l7	/* skip the first 4 entries */
	setx	imiss_loop1, 	%l0,	%o7	
imiss_loop1:
	call	rdm_8kpg_0
	nop

	add	%o0,	0x1,	%o0	
	add	%l6,	0x1,	%l6

	sub	%l6,	%l7,	%l4
	brnz	%l4,	imiss_loop1
	nop

	/* change to privileged mode to write IMMU reg */
	mov	0x0,	%o0

	call	itlb_repl_test
	nop

	ta	T_CHANGE_HPRIV
	nop

tc_1:
        mov     0x0d,   %l0     /*changed for 16 entries*/
        mov     0x0,    %l1
        mov     0x18,   %l5     /* skip the first 3 entries */
        mov     0x0,    %o0     /* standard IMMU miss handler */
        setx    itsb_table1,    %l1,    %l2
preload_itlb1:
        ldx     [%l2],          %g4
        ldx     [%l2+0x8],      %g5
        add     %l2,    0x10,   %l2

        mov     0x30,   %l3
        stxa    %g4,    [%l3] 0x50      /* tag access reg */
        stxa    %g5,    [%l5] 0x55      /* data access reg */
        add     %l5,    0x8,    %l5

        add     %l1,    0x1,    %l1
        sub     %l1,    %l0,    %l6
        brnz    %l6,    preload_itlb1
        nop

	ta	T_CHANGE_NONHPRIV
	nop

	call	itlb_repl_test
	nop

	ta	T_CHANGE_HPRIV
	nop

tc_2:
        mov     0x0d,   %l0    /*changed for 16 entries*/
        mov     0x0,    %l1
        mov     0x18,   %l5     /* skip the first 3 entries */
        mov     0x0,    %o0     /* standard IMMU miss handler */
        setx    itsb_table2,    %l1,    %l2
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

	ta	T_CHANGE_NONHPRIV
	nop

	call	itlb_repl_test
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
 *	itlb_repl_test
 *
 * 	This function do a bunch function calls to 
 * 	generate IMMU misses. Also, it reads out
 *	the IMMU ITLB table to do the cross-checking
 * 	between RTL and SAS. 
 *************************************************************
 */
itlb_repl_test:
	save

test_case1:
	/*
	 *	create 32 IMMU miss 
	 */
        set     0x0,    %o0
        call    rdm_8kpg_0
        nop
        set     0x0,    %o0
        call    rdm_8kpg_1
        nop
        set     0x0,    %o0
        call    rdm_8kpg_2
        nop
        set     0x0,    %o0
        call    rdm_8kpg_3
        nop
        set     0x0,    %o0
        call    rdm_8kpg_4
        nop
        set     0x0,    %o0
        call    rdm_8kpg_5
        nop
        set     0x0,    %o0
        call    rdm_8kpg_6
        nop
        set     0x0,    %o0
        call    rdm_8kpg_7
        nop
        set     0x0,    %o0
        call    rdm_8kpg_8
        nop
        set     0x0,    %o0
        call    rdm_8kpg_9
        nop
        set     0x0,    %o0
        call    rdm_8kpg_10
        nop
        set     0x0,    %o0
        call    rdm_8kpg_11
        nop
        set     0x0,    %o0
        call    rdm_8kpg_12
        nop
        set     0x0,    %o0
        call    rdm_8kpg_13
        nop
        set     0x0,    %o0
        call    rdm_8kpg_14
        nop
        set     0x0,    %o0
        call    rdm_8kpg_15
        nop
        set     0x0,    %o0
        call    rdm_8kpg_16
        nop
        set     0x0,    %o0
        call    rdm_8kpg_17
        nop
        set     0x0,    %o0
        call    rdm_8kpg_18
        nop
        set     0x0,    %o0
        call    rdm_8kpg_19
        nop
        set     0x0,    %o0
        call    rdm_8kpg_20
        nop
        set     0x0,    %o0
        call    rdm_8kpg_21
        nop
        set     0x0,    %o0
        call    rdm_8kpg_22
        nop
        set     0x0,    %o0
        call    rdm_8kpg_23
        nop     
        set     0x0,    %o0
        call    rdm_8kpg_24
        nop     
        set     0x0,    %o0
        call    rdm_8kpg_25
        nop     
        set     0x0,    %o0
        call    rdm_8kpg_26
        nop     
        set     0x0,    %o0
        call    rdm_8kpg_27
        nop     
        set     0x0,    %o0
        call    rdm_8kpg_28
        nop     
        set     0x0,    %o0
        call    rdm_8kpg_29
        nop     
        set     0x0,    %o0
        call    rdm_8kpg_30
        nop     
        set     0x0,    %o0
        call    rdm_8kpg_31
        nop     
	
ta	T_CHANGE_HPRIV
	nop

        /* read out all the entries in I-TLB table to compare */
        set     0x0,    %l0
        set     0x10,   %l6   /*changed for 16 entries*/
        set     0x0,    %l7
rd_itlb_loop1:
        ldxa    [%l7] 0x55,     %l3
        ldxa    [%l7] 0x56,     %l4

        add     %l7,    0x8,    %l7
        add     %l0,    0x1,    %l0

        sub     %l0,    %l6,    %l5
        brnz,a  %l5,    rd_itlb_loop1
        nop

	ta	T_CHANGE_NONHPRIV
	nop

itlb_call_rtn:
        restore
        retl
        nop
/*
 **************************
 * User data area 
 **************************
 */
.data

.global itsb_table1

itsb_table1:
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

	/*   nucleus context : L=0, size=256m, G=0  */
	.xword	0x0000000000200000,	0xe000800100200002	
	.xword	0x0000000000280000,	0x6000800100280002	

	/*   nucleus context : L=0, size=256m, G=1  */
	.xword	0x0000000000300000,	0xe000800100300003	
	.xword	0x0000000000380000,	0x6000800100380003	

	/*   nucleus context : L=0, size=4M, G=0  */
	.xword	0x0000000000400000,	0xe000000100400002	
	.xword	0x0000000000800000,	0x6000000100800002	

	/*   nucleus context : L=0, size=4M, G=1  */
	.xword	0x0000000000e00080,	0xe00000010e000803	
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

	/*   nucleus context : L=1, size=256m, G=0  */
	.xword	0x0000000001a80000,	0xe000800101a80042	
	.xword	0x0000000001b00000,	0x6000800101b00042	

	/*   nucleus context : L=1, size=256m, G=1  */
	.xword	0x0000000001b80000,	0xe000800101b80043	
	.xword	0x0000000001e00080,	0x60008001010c0043	

	/*   nucleus context : L=1, size=4M, G=0  */
	.xword	0x0000000001400000,	0xe000000101400042	
	.xword	0x0000000001800000,	0x6000000101800042	

	/*   nucleus context : L=1, size=4M, G=1  */
	.xword	0x0000000001e00080,	0x6000000101c00043	
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

	/*   primary context : L=0, size=256m, G=0  */
	.xword	0x0000000002200044,	0xe000800102200002	
	.xword	0x0000000002280044,	0x6000800102280002	

	/*   primary context : L=0, size=256m, G=1  */
	.xword	0x0000000002300044,	0xe000800102300003	
	.xword	0x0000000002380044,	0x6000800102380003	

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

	/*   primary context : L=1, size=256m, G=0  */
	.xword	0x0000000003080044,	0xe000800103080042	
	.xword	0x0000000003100044,	0x6000800103100042	

	/*   primary context : L=1, size=256m, G=1  */
	.xword	0x0000000003180044,	0xe000800103180043	
	.xword	0x0000000003200044,	0x6000800103200043	

	/*   primary context : L=1, size=4M, G=0  */
	.xword	0x0000000003400044,	0xe000000103400042	
	.xword	0x0000000003800044,	0x6000000103800042	

	/*   primary context : L=1, size=4M, G=1  */
	.xword	0x0000000003c00044,	0xe000000103c00043	
	.xword	0x0000000004000044,	0x6000000104000043

	/*   secondary context : L=0, size=64k, G=0  */
	.xword	0x00000000151a0055,	0xa0000001051a0002	
	.xword	0x00000000151b0055,	0x20000001051b0002	

	/*   secondary context : L=0, size=64k, G=1  */
	.xword	0x00000000151c0055,	0xa0000001051c0003	
	.xword	0x00000000151d0055,	0x20000001051d0003	

	/*   secondary context : L=0, size=256m, G=0  */
	.xword	0x0000000010200055,	0xe000800100200002	
	.xword	0x0000000010280055,	0x6000800100280002	

	/*   secondary context : L=0, size=256m, G=1  */
	.xword	0x0000000010300055,	0xe000800100300003	
	.xword	0x0000000010380055,	0x6000800100380003	

	/*   secondary context : L=0, size=4M, G=0  */
	.xword	0x0000000010400055,	0xe000000100400002	
	.xword	0x0000000010800055,	0x6000000100800002	

	/*   secondary context : L=0, size=4M, G=1  */
	.xword	0x0000000010c00055,	0xe00000010e000803	
	.xword	0x0000000011000055,	0x6000000110000003	

	/*   secondary context : V=1,0 L=1, size=8k, G=0  */
	.xword	0x0000000011a10055,	0x8000000101a10042	
	.xword	0x0000000011a18055,	0x0000000101a18042	

	/*   secondary context : L=1, size=8k, G=1  */
	.xword	0x0000000011a20055,	0x8000000101a20043
	.xword	0x0000000011a28055,	0x0000000101a28043	

.align	1024

.global itsb_table2

itsb_table2:
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

	/*   secondary context : L=0, size=256m, G=0  */
	.xword	0x0000000010200055,	0xe000800100200002	
	.xword	0x0000000010280055,	0x6000800100280002	

	/*   secondary context : L=0, size=256m, G=1  */
	.xword	0x0000000010300055,	0xe000800100300003	
	.xword	0x0000000010380055,	0x6000800100380003	

	/*   secondary context : L=0, size=4M, G=0  */
	.xword	0x0000000010400055,	0xe000000100400002	
	.xword	0x0000000010800055,	0x6000000100800002	

	/*   secondary context : L=0, size=4M, G=1  */
	.xword	0x0000000010c00055,	0xe00000010e000803	
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

	/*   secondary context : L=1, size=256m, G=0  */
	.xword	0x0000000011a80055,	0xe000800101a80042	
	.xword	0x0000000011b00055,	0x6000800101b00042	

	/*   secondary context : L=1, size=256m, G=1  */
	.xword	0x0000000011b80055,	0xe000800101b80043	
	.xword	0x0000000011c00055,	0x60008001010c0043	

	/*   secondary context : L=1, size=4M, G=0  */
	.xword	0x0000000011400055,	0xe000000101400042	
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

	/*   primary context : L=0, size=256m, G=0  */
	.xword	0x0000000012200044,	0xe000800102200002	
	.xword	0x0000000012280044,	0x6000800102280002	

	/*   primary context : L=0, size=256m, G=1  */
	.xword	0x0000000012300044,	0xe000800102300003	
	.xword	0x0000000012380044,	0x6000800102380003	

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

	/*   primary context : L=1, size=256m, G=0  */
	.xword	0x0000000013080044,	0xe000800103080042	
	.xword	0x0000000013100044,	0x6000800103100042	

	/*   primary context : L=1, size=256m, G=1  */
	.xword	0x0000000013180044,	0xe000800103180043	
	.xword	0x0000000013200044,	0x6000800103200043	

	/*   primary context : L=1, size=4M, G=0  */
	.xword	0x0000000013400044,	0xe000000103400042	
	.xword	0x0000000013800044,	0x6000000103800042	

	/*   primary context : L=1, size=4M, G=1  */
	.xword	0x0000000013c00044,	0xe000000103c00043	
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


SECTION .USER_TRAP TEXT_VA=0x1600000
attr_text {
        Name = .USER_TRAP
	hypervisor
        }
.text
.align 0x100
/*
 **********************************************
 * Customized fast IMMU page fault handler 
 *
 * Input : 
 
 	%o0 : if 0, use standard way to 
 		handle the IMMU miss;
 
 	Otherwise, use propritary trap handler	
 **********************************************
 */
.text
.global T0_fast_immu_miss
T0_fast_immu_miss:
	brnz	%o0,	ld_itsb
	nop

standard_trap:
#include "immu_miss_handler.s"
#include "immu_miss_handler_ext.s"

ld_itsb:
	/* 
	 * %o0 has the test case # , which we used 
	 * as an index to the TSB entry in the memory. 
	 */
	sub	%o0,	0x1,	%o1	/* index starts from 0 */	
					/* %o0 starts from 1 */
	sll	%o1,	4,	%o2
	sll	%o1,	3,	%o5
	add	%o5,	0x20,	%o5	/* skip the first 4 entries */
	mov	0x0,	%o3
	setx	itsb_table3, %o3, %o4	
	add	%o2,	%o4,	%o4
	ldda	[%o4] 0x24,	%g4		/* g4 : TTE tag */
						/* g5 : TTE data */
        mov  	0x30, %o3
        stxa  	%g4, [ %o3 ] 0x50
        stxa  	%g5, [ %o5 ] 0x55

	set	0x0,	%l0
	add	%o7,	0x8,	%g2	/* o7 has the label address */
	wrpr 	%g2, 	%g0, 	%tpc
        wrpr 	%g2, 	%g0, 	%tnpc
        setx 	0x1000, %l0, 	%g2
        wrpr 	%g2, %g0, %tstate
        done
        nop

SECTION .MAIN
.data
.align 8192
.global itsb_table3

itsb_table3:
        /*   nucleus context : V=1,0 L=0, size=8k, G=0  */
        .xword  0x0000000005180000,     0x8000000105180002
        .xword  0x0000000005188000,     0x0000000105188002

	/*   primary context : V=1,0 L=0, size=8k, G=0  */
	.xword	0x0000000005180044,	0x8000000105180002	
	.xword	0x0000000005188044,	0x0000000105188002	

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

	/*   secondary context : L=0, size=64k, G=0  */
	.xword	0x00000000051a0055,	0xa0000001051a0002	
	.xword	0x00000000051b0055,	0x20000001051b0002	

	/*   prim context : L=1, size=256m, G=0  */
	.xword	0x0000000011a80044,	0xe000800101a80042	
	.xword	0x0000000011b00044,	0x6000800101b00042	

	/*   secondary context : L=1, size=256m, G=0  */
	.xword	0x0000000011a80055,	0xe000800101a80042	
	.xword	0x0000000011b00055,	0x6000800101b00042	

	/*   nucl context : L=1, size=256m, G=0  */
	.xword	0x0000000011a80000,	0xe000800101a80042	
	.xword	0x0000000011b00000,	0x6000800101b00042	

	/*   nucl context : L=0, size=256m, G=0  */
	.xword	0x0000000010200000,	0xe000800100200002	
	.xword	0x0000000010280000,	0x6000800100280002	

	/*   prim context : L=0, size=256m, G=0  */
	.xword	0x0000000010200044,	0xe000800100200002	
	.xword	0x0000000010280044,	0x6000800100280002	

	/*   secondary context : L=0, size=256m, G=0  */
	.xword	0x0000000010200055,	0xe000800100200002	
	.xword	0x0000000010280055,	0x6000800100280002	

	/*   nucl context : L=0, size=4M, G=0  */
	.xword	0x0000000010400000,	0xe000000100400002	
	.xword	0x0000000010800000,	0x6000000100800002	

	/*   prim context : L=0, size=4M, G=0  */
	.xword	0x0000000010400044,	0xe000000100400002	
	.xword	0x0000000010800044,	0x6000000100800002	

	/*   secondary context : L=0, size=4M, G=0  */
	.xword	0x0000000010400055,	0xe000000100400002	
	.xword	0x0000000010800055,	0x6000000100800002	

	/*   nucl context : L=1, size=64k, G=0  */
	.xword	0x0000000011a30000,	0xa000000101a30042	
	.xword	0x0000000011a40000,	0x2000000101a40042	

	/*   prim context : L=1, size=64k, G=0  */
	.xword	0x0000000011a30044,	0xa000000101a30042	
	.xword	0x0000000011a40044,	0x2000000101a40042	

	/*   secondary context : L=1, size=64k, G=0  */
	.xword	0x0000000011a30055,	0xa000000101a30042	
	.xword	0x0000000011a40055,	0x2000000101a40042	

	/*   secondary context : L=1, size=64k, G=1  */
	.xword	0x0000000011a50055,	0xa000000101a50043	
	.xword	0x0000000011a60055,	0x2000000101a60043	

	/*   secondary context : L=1, size=256m, G=1  */
	.xword	0x0000000011b80055,	0xe000800101b80043	
	.xword	0x0000000011c00055,	0x60008001010c0043	

	/*   secondary context : L=1, size=4M, G=0  */
	.xword	0x0000000011400055,	0xe000000101400042	
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

	/*   primary context : L=0, size=256m, G=0  */
	.xword	0x0000000012200044,	0xe000800102200002	
	.xword	0x0000000012280044,	0x6000800102280002	

	/*   primary context : L=0, size=256m, G=1  */
	.xword	0x0000000012300044,	0xe000800102300003	
	.xword	0x0000000012380044,	0x6000800102380003	

	/*   primary context : L=0, size=4M, G=0  */
	.xword	0x0000000012400044,	0xe000000102400002	
	.xword	0x0000000012800044,	0x6000000102800002	

	/*   nucleus context : L=0, size=64k, G=0  */
	.xword	0x00000000051a0000,	0xa0000001051a0002	
	.xword	0x00000000051b0000,	0x20000001051b0002	

	/*   nucleus context : L=0, size=64k, G=1  */
	.xword	0x00000000051c0000,	0xa0000001051c0003	
	.xword	0x00000000051d0000,	0x20000001051d0003	

	/*   nucleus context : L=0, size=256m, G=0  */
	.xword	0x0000000000200000,	0xe000800100200002	
	.xword	0x0000000000280000,	0x6000800100280002	

	/*   nucleus context : L=0, size=256mb, G=1  */
	.xword	0x0000000000300000,	0xe000800100300003	
	.xword	0x0000000000380000,	0x6000800100380003	

	/*   nucleus context : L=0, size=4M, G=0  */
	.xword	0x0000000000400000,	0xe000000100400002	
	.xword	0x0000000000800000,	0x6000000100800002	

	/*   nucleus context : L=0, size=4M, G=1  */
	.xword	0x0000000000e00080,	0xe00000010e000803	
	.xword	0x0000000001000000,	0x6000000110000003	

	/*   nucleus context : V=1,0 L=1, size=8k, G=0  */
	.xword	0x0000000001a10000,	0x8000000101a10042	
	.xword	0x0000000001a18000,	0x0000000101a18042	

	/*   nucleus context : L=1, size=8k, G=1  */
	.xword	0x0000000001a20000,	0x8000000101a20043
	.xword	0x0000000001a28000,	0x0000000101a28043	

/*
 ******************************************
 *	dummy function calls in different
 *	pages to cause IMMU page miss
 ******************************************
 */
!!-----------------------------------------------------
!!      8KB page size for I/D TTE
!!-----------------------------------------------------
#define ITTE_8KB_PG_BASE_TEXT_ADDR     0x160000
#define ITTE_8KB_PG_BASE_TEXT_ADDR_PA  0x10160000

SECTION .ITTE_8KB_PAGE	TEXT_VA=ITTE_8KB_PG_BASE_TEXT_ADDR
attr_text {
        Name = .ITTE_8KB_PAGE,
        VA=ITTE_8KB_PG_BASE_TEXT_ADDR, 
	PA=ra2pa(ITTE_8KB_PG_BASE_TEXT_ADDR_PA,0),
	RA=ITTE_8KB_PG_BASE_TEXT_ADDR_PA,
        part_0_i_ctx_nonzero_ps0_tsb,
        TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=1, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=0
        }


.text 

.global  rdm_8kpg_0
rdm_8kpg_0:
        save
        set     0x0,    %i2
        return  %i7+8   /* good return */
        nop
.align	8192

.global  rdm_8kpg_1
rdm_8kpg_1:
        save
        set     0x1,    %i2
        return  %i7+8   /* good return */
        nop
.align	8192

.global  rdm_8kpg_2
rdm_8kpg_2:
        save
        set     0x2,    %i2
        return  %i7+8   /* good return */
        nop
.align	8192

.global  rdm_8kpg_3
rdm_8kpg_3:
        save
        set     0x3,    %i2
        return  %i7+8   /* good return */
        nop
.align	8192

.global  rdm_8kpg_4
rdm_8kpg_4:
        save
        set     0x4,    %i2
        return  %i7+8   /* good return */
        nop
.align	8192

.global  rdm_8kpg_5
rdm_8kpg_5:
        save
        set     0x5,    %i2
        return  %i7+8   /* good return */
        nop
.align	8192

.global  rdm_8kpg_6
rdm_8kpg_6:
        save
        set     0x6,    %i2
        return  %i7+8   /* good return */
        nop
.align	8192

.global  rdm_8kpg_7
rdm_8kpg_7:
        save
        set     0x7,    %i2
        return  %i7+8   /* good return */
        nop
.align	8192

.global  rdm_8kpg_8
rdm_8kpg_8:
        save
        set     0x8,    %i2
        return  %i7+8   /* good return */
        nop
.align	8192

.global  rdm_8kpg_9
rdm_8kpg_9:
        save
        set     0x9,    %i2
        return  %i7+8   /* good return */
        nop
.align	8192

.global  rdm_8kpg_10
rdm_8kpg_10:
        save
        set     0x10,    %i2
        return  %i7+8   /* good return */
        nop
.align	8192

.global  rdm_8kpg_11
rdm_8kpg_11:
        save
        set     0x11,    %i2
        return  %i7+8   /* good return */
        nop
.align	8192

.global  rdm_8kpg_12
rdm_8kpg_12:
        save
        set     0x12,    %i2
        return  %i7+8   /* good return */
        nop
.align	8192

.global  rdm_8kpg_13
rdm_8kpg_13:
        save
        set     0x13,    %i2
        return  %i7+8   /* good return */
        nop
.align	8192

.global  rdm_8kpg_14
rdm_8kpg_14:
        save
        set     0x14,    %i2
        return  %i7+8   /* good return */
        nop
.align	8192

.global  rdm_8kpg_15
rdm_8kpg_15:
        save
        set     0x15,    %i2
        return  %i7+8   /* good return */
        nop
.align	8192

.global  rdm_8kpg_16
rdm_8kpg_16:
        save
        set     0x16,    %i2
        return  %i7+8   /* good return */
        nop
.align	8192

.global  rdm_8kpg_17
rdm_8kpg_17:
        save
        set     0x17,    %i2
        return  %i7+8   /* good return */
        nop
.align	8192

.global  rdm_8kpg_18
rdm_8kpg_18:
        save
        set     0x18,    %i2
        return  %i7+8   /* good return */
        nop
.align	8192

.global  rdm_8kpg_19
rdm_8kpg_19:
        save
        set     0x19,    %i2
        return  %i7+8   /* good return */
        nop
.align	8192

.global  rdm_8kpg_20
rdm_8kpg_20:
        save
        set     0x20,    %i2
        return  %i7+8   /* good return */
        nop
.align	8192

.global  rdm_8kpg_21
rdm_8kpg_21:
        save
        set     0x21,    %i2
        return  %i7+8   /* good return */
        nop
.align	8192

.global  rdm_8kpg_22
rdm_8kpg_22:
        save
        set     0x22,    %i2
        return  %i7+8   /* good return */
        nop
.align	8192

.global  rdm_8kpg_23
rdm_8kpg_23:
        save
        set     0x23,    %i2
        return  %i7+8   /* good return */
        nop
.align	8192

.global  rdm_8kpg_24
rdm_8kpg_24:
        save
        set     0x24,    %i2
        return  %i7+8   /* good return */
        nop
.align	8192

.global  rdm_8kpg_25
rdm_8kpg_25:
        save
        set     0x25,    %i2
        return  %i7+8   /* good return */
        nop
.align	8192

.global  rdm_8kpg_26
rdm_8kpg_26:
        save
        set     0x26,    %i2
        return  %i7+8   /* good return */
        nop
.align	8192

.global  rdm_8kpg_27
rdm_8kpg_27:
        save
        set     0x27,    %i2
        return  %i7+8   /* good return */
        nop
.align	8192

.global  rdm_8kpg_28
rdm_8kpg_28:
        save
        set     0x28,    %i2
        return  %i7+8   /* good return */
        nop
.align	8192

.global  rdm_8kpg_29
rdm_8kpg_29:
        save
        set     0x29,    %i2
        return  %i7+8   /* good return */
        nop
.align	8192

.global  rdm_8kpg_30
rdm_8kpg_30:
        save
        set     0x30,    %i2
        return  %i7+8   /* good return */
        nop
.align	8192

.global  rdm_8kpg_31
rdm_8kpg_31:
        save
        set     0x31,    %i2
        return  %i7+8   /* good return */
        nop
.align	8192

.global  rdm_8kpg_32
rdm_8kpg_32:
        save
        set     0x32,    %i2
        return  %i7+8   /* good return */
        nop
.align	8192

.global  rdm_8kpg_33
rdm_8kpg_33:
        save
        set     0x33,    %i2
        return  %i7+8   /* good return */
        nop
.align	8192

.global  rdm_8kpg_34
rdm_8kpg_34:
        save
        set     0x34,    %i2
        return  %i7+8   /* good return */
        nop
.align	8192

.global  rdm_8kpg_35
rdm_8kpg_35:
        save
        set     0x35,    %i2
        return  %i7+8   /* good return */
        nop
.align	8192

.global  rdm_8kpg_36
rdm_8kpg_36:
        save
        set     0x36,    %i2
        return  %i7+8   /* good return */
        nop
.align	8192

.global  rdm_8kpg_37
rdm_8kpg_37:
        save
        set     0x37,    %i2
        return  %i7+8   /* good return */
        nop
.align	8192

.global  rdm_8kpg_38
rdm_8kpg_38:
        save
        set     0x38,    %i2
        return  %i7+8   /* good return */
        nop
.align	8192

.global  rdm_8kpg_39
rdm_8kpg_39:
        save
        set     0x39,    %i2
        return  %i7+8   /* good return */
        nop
.align	8192

.global  rdm_8kpg_40
rdm_8kpg_40:
        save
        set     0x2,    %i2
        return  %i7+8   /* good return */
        nop
.align	8192

.global  rdm_8kpg_41
rdm_8kpg_41:
        save
        set     0x2,    %i2
        return  %i7+8   /* good return */
        nop
.align	8192

.global  rdm_8kpg_42
rdm_8kpg_42:
        save
        set     0x2,    %i2
        return  %i7+8   /* good return */
        nop
.align	8192

.global  rdm_8kpg_43
rdm_8kpg_43:
        save
        set     0x2,    %i2
        return  %i7+8   /* good return */
        nop
.align	8192

.global  rdm_8kpg_44
rdm_8kpg_44:
        save
        set     0x2,    %i2
        return  %i7+8   /* good return */
        nop
.align	8192

.global  rdm_8kpg_45
rdm_8kpg_45:
        save
        set     0x2,    %i2
        return  %i7+8   /* good return */
        nop
.align	8192

.global  rdm_8kpg_46
rdm_8kpg_46:
        save
        set     0x2,    %i2
        return  %i7+8   /* good return */
        nop
.align	8192

.global  rdm_8kpg_47
rdm_8kpg_47:
        save
        set     0x2,    %i2
        return  %i7+8   /* good return */
        nop
.align	8192

.global  rdm_8kpg_48
rdm_8kpg_48:
        save
        set     0x2,    %i2
        return  %i7+8   /* good return */
        nop
.align	8192

.global  rdm_8kpg_49
rdm_8kpg_49:
        save
        set     0x2,    %i2
        return  %i7+8   /* good return */
        nop
.align	8192

.global  rdm_8kpg_50
rdm_8kpg_50:
        save
        set     0x2,    %i2
        return  %i7+8   /* good return */
        nop
.align	8192

.global  rdm_8kpg_51
rdm_8kpg_51:
        save
        set     0x2,    %i2
        return  %i7+8   /* good return */
        nop
.align	8192

.global  rdm_8kpg_52
rdm_8kpg_52:
        save
        set     0x2,    %i2
        return  %i7+8   /* good return */
        nop
.align	8192

.global  rdm_8kpg_53
rdm_8kpg_53:
        save
        set     0x2,    %i2
        return  %i7+8   /* good return */
        nop
.align	8192

.global  rdm_8kpg_54
rdm_8kpg_54:
        save
        set     0x2,    %i2
        return  %i7+8   /* good return */
        nop
.align	8192

.global  rdm_8kpg_55
rdm_8kpg_55:
        save
        set     0x2,    %i2
        return  %i7+8   /* good return */
        nop
.align	8192

.global  rdm_8kpg_56
rdm_8kpg_56:
        save
        set     0x2,    %i2
        return  %i7+8   /* good return */
        nop
.align	8192

.global  rdm_8kpg_57
rdm_8kpg_57:
        save
        set     0x2,    %i2
        return  %i7+8   /* good return */
        nop
.align	8192

.global  rdm_8kpg_58
rdm_8kpg_58:
        save
        set     0x2,    %i2
        return  %i7+8   /* good return */
        nop
.align	8192

.global  rdm_8kpg_59
rdm_8kpg_59:
        save
        set     0x2,    %i2
        return  %i7+8   /* good return */
        nop
.align	8192

.global  rdm_8kpg_60
rdm_8kpg_60:
        save
        set     0x2,    %i2
        return  %i7+8   /* good return */
        nop
.align	8192

.global  rdm_8kpg_61
rdm_8kpg_61:
        save
        set     0x2,    %i2
        return  %i7+8   /* good return */
        nop
.align	8192

.global  rdm_8kpg_62
rdm_8kpg_62:
        save
        set     0x2,    %i2
        return  %i7+8   /* good return */
        nop
.align	8192

.global  rdm_8kpg_63
rdm_8kpg_63:
        save
        set     0x2,    %i2
        return  %i7+8   /* good return */
        nop
.align	8192

