// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: tlb_repl_exception.s
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
!!      This file has the micro-code to test :
!!	    when all the tlb entries are locked, if one more page fault happens,
!!	    LSU will create a Data_access_exception_trap.
!!
!!-------------------------------------------------------------------------------
#define MAIN_PAGE_HV_ALSO

#include "enable_traps.h"

#include "boot.s"

.text

.global main

main:
	nop

	/* change to privileged mode to write DMMU reg */
	ta	T_CHANGE_HPRIV
	nop
	/*
	 *************************	
	 * DTLB all locked test 
	 *************************	
	 */
test_1:
	mov	0x40,	%l0
	mov	0x0,	%l1
	mov	0x0,	%l5	
	mov	0x0,	%o0	/* standard DMMU miss handler */
	setx	tsb_table1,	%l1,	%l2
preload_dtlb:
	ldx	[%l2],		%g4
	ldx	[%l2+0x8], 	%g5	
	add	%l2,	0x10,	%l2	
	
	mov	0x30,	%l3
        stxa    %g4,    [%l3] 0x58	/* tag access reg */
        stxa    %g5,    [%l5] 0x5d	/* data access reg */
	add	%l5,	0x8,	%l5

	add	%l1,	0x1,	%l1
	sub	%l1,	%l0,	%l6
	brnz	%l6,	preload_dtlb
	nop

        /* enable the trap */
        set     0x32,   %o0     /* Data access exception trap */
        ta      T_HTRAP_EN
        nop

	mov	0,	%l0
	setx	0x000000000f180000,	%l0,	%l1
	setx	0x800000020f180042,	%l0,	%l2

	/* write one more entry into the DTLB to cause the trap */
	mov	0x30,	%l3
        stxa    %l1,    [%l3] 0x58	/* tag access reg */
        stxa    %l2,    [%g0] 0x5c	/* data in reg */

	/* the last entry in DTLB should be replaced */
	set	0x1f8,	%o0
	ldxa	[%o0] 0x5d,	%l3
	cmp	%l3,	%l2
	bne,a	diag_fail
	nop
	/*
	 *************************	
	 * ITLB all locked test 
	 *************************	
	 */
test_2:
        mov     0x40,   %l0
        mov     0x0,    %l1     
        mov     0x0,   %l5     /* skip the first 3 entries */
        mov     0x0,    %o0     /* standard IMMU miss handler */
        setx    tsb_table2,    %l1,    %l2
preload_itlb:
        ldx     [%l2],          %g4
        ldx     [%l2+0x8],      %g5
        add     %l2,    0x10,   %l2

        mov     0x30,   %l3
        stxa    %g4,    [%l3] 0x50      /* tag access reg */
        stxa    %g5,    [%l5] 0x55      /* data access reg */
        add     %l5,    0x8,    %l5

        add     %l1,    0x1,    %l1
        sub     %l1,    %l0,    %l6
        brnz    %l6,    preload_itlb
        nop

	/* set the lock bit of the first 4 entries */
	mov	0x0,	%l0
	mov	0x4,	%l1
	mov	0x0,	%l7
	mov	0x30,	%o0
setlock_loop:
        ldxa    [%l7] 0x55,     %l3
        ldxa    [%l7] 0x56,     %l4
	or	%l3,	0x40,	%l3

	stxa	%l4,	[%o0] 0x50	
	stxa	%l3,	[%l7] 0x55	

	add	%l7,	0x8,	%l7

	sub	%l0,	%l1,	%l2
	brnz,a	%l2,	setlock_loop
	add	%l0,	0x1,	%l0

        /* enable the trap */
        set     0x32,   %o0     /* Data access exception trap */
        ta      T_HTRAP_EN
        nop

	mov	0,	%l0
	setx	0x000000000f180000,	%l0,	%l1
	setx	0x800000020f180042,	%l0,	%l2

	/* write one more entry into the ITLB to cause the trap */
	mov	0x30,	%l3
        stxa    %l1,    [%l3] 0x50	/* tag access reg */
        stxa    %l2,    [%g0] 0x54	/* data in reg */

	/* the last entry in ITLB should be replaced */
	set	0x1f8,	%o0
	ldxa	[%o0] 0x55,	%l3
	cmp	%l3,	%l2
	bne,a	diag_fail
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

.global tsb_table1

tsb_table1:
	/*   nucleus context : V=1,0 L=1, size=8k, G=0  */
	.xword	0x0000000001200000,	0xa00000000120004e	
	.xword	0x0000000001400000,	0xa00000000140004e	
	.xword	0x0000000001600000,	0xa00000000160004e	
	.xword	0x000000000012c000,	0x800000000012c047	/* entry for TrapCheck */
	.xword	0x0000000002400044,	0x8000000102400047	/* entry for TrapCheck */
	.xword	0x0000000005188000,	0x8000000105188042	

	/*   nucleus context : L=1, size=8k, G=1  */
	!.xword	0x0000000005190000,	0x8000000105190043
	!.xword	0x0000000001600000,	0x8000000101600043	/* entry for the tsb table */

	/*   nucleus context : L=1, size=64k, G=0  */
	.xword	0x00000000051a0000,	0xa0000001051a0042	
	.xword	0x00000000051b0000,	0xa0000001051b0042	

	/*   nucleus context : L=1, size=64k, G=1  */
	.xword	0x00000000051c0000,	0xa0000001051c0043	
	.xword	0x00000000051d0000,	0xa0000001051d0043	

	/*   nucleus context : L=1, size=512k, G=0  */
	.xword	0x0000000000200000,	0x8000000100200042	
	.xword	0x0000000000280000,	0x8000000100280042	

	/*   nucleus context : L=1, size=512k, G=1  */
	.xword	0x0000000000300000,	0x8000000100300043	
	.xword	0x0000000000380000,	0x8000000100380043	

	/*   nucleus context : L=1, size=4M, G=0  */
	.xword	0x0000000000400000,	0xe000000100400042	
	.xword	0x0000000000800000,	0xe000000100800042	

	/*   nucleus context : L=1, size=4M, G=1  */
	.xword	0x0000000000c00000,	0xe00000010c000043	
	.xword	0x0000000001000000,	0x8000000110000043	

	/*   nucleus context : V=1,0 L=1, size=8k, G=0  */
	.xword	0x0000000001a10000,	0x8000000101a10042	
	.xword	0x0000000001a18000,	0x8000000101a18042	

	/*   nucleus context : L=1, size=8k, G=1  */
	.xword	0x0000000001a20000,	0x8000000101a20043
	.xword	0x0000000001a28000,	0x8000000101a28043	

	/*   nucleus context : L=1, size=64k, G=0  */
	.xword	0x0000000001a30000,	0xa000000101a30042	
	.xword	0x0000000001a40000,	0xa000000101a40042	

	/*   nucleus context : L=1, size=64k, G=1  */
	.xword	0x0000000001a50000,	0xa000000101a50043	
	.xword	0x0000000001a60000,	0xa000000101a60043	

	/*   nucleus context : L=1, size=512k, G=0  */
	.xword	0x0000000001a80000,	0x8000000101a80042	
	.xword	0x0000000001b00000,	0x8000000101b00042	

	/*   nucleus context : L=1, size=512k, G=1  */
	.xword	0x0000000001b80000,	0x8000000101b80043	
	.xword	0x0000000001b10000,	0x80000001010c0043	

	/*   nucleus context : L=1, size=4M, G=0  */
	.xword	0x0000000001500000,	0x8000000101400042	
	.xword	0x0000000001800000,	0x8000000101800042	

	/*   nucleus context : L=1, size=4M, G=1  */
	.xword	0x0000000001c00000,	0x8000000101c00043	
	.xword	0x0000000002002000,	0x8000000102002043	

	/*   primary context : V=1,0 L=1, size=8k, G=0  */
	.xword	0x0000000002080044,	0x8000000102080042	
	.xword	0x0000000002100044,	0x8000000102100042	

	/*   primary context : L=1, size=8k, G=1  */
	.xword	0x0000000002110044,	0x8000000102110043
	.xword	0x0000000002120044,	0x8000000102120043	

	/*   primary context : L=1, size=64k, G=0  */
	.xword	0x0000000002130044,	0xa000000102130042	
	.xword	0x0000000002140044,	0xa000000102140042	

	/*   primary context : L=1, size=64k, G=1  */
	.xword	0x0000000002150044,	0xa000000102150043	
	.xword	0x0000000002160044,	0xa000000102160043	

	/*   primary context : L=1, size=512k, G=0  */
	.xword	0x0000000002200044,	0x8000000102200042	
	.xword	0x0000000002280044,	0x8000000102280042	

	/*   primary context : L=1, size=512k, G=1  */
	.xword	0x0000000002300044,	0x8000000102300043	
	.xword	0x0000000002380044,	0x8000000102380043	

	/*   primary context : L=1, size=4M, G=0  */
	.xword	0x0000000007400044,	0xe000000107400042	
	.xword	0x0000000002800044,	0xe000000102800042	

	/*   primary context : L=1, size=4M, G=1  */
	.xword	0x0000000002c00044,	0xe000000102c00043	
	.xword	0x0000000003000044,	0x8000000103000043	

	/*   primary context : V=1,0 L=1, size=8k, G=0  */
	.xword	0x0000000003010044,	0x8000000103010042	
	.xword	0x0000000003018044,	0x8000000103018042	

	/*   primary context : L=1, size=8k, G=1  */
	.xword	0x0000000003020044,	0x8000000103020043
	.xword	0x0000000003028044,	0x8000000103028043	

	/*   primary context : L=1, size=64k, G=0  */
	.xword	0x0000000003030044,	0xa000000103030042	
	.xword	0x0000000003040044,	0xa000000103040042	

	/*   primary context : L=1, size=64k, G=1  */
	.xword	0x0000000003050044,	0xa000000103050043	
	.xword	0x0000000003060044,	0xa000000103060043	

	/*   primary context : L=1, size=512k, G=0  */
	.xword	0x0000000003080044,	0x8000000103080042	
	.xword	0x0000000003100044,	0x8000000103100042	

	/*   primary context : L=1, size=512k, G=1  */
	.xword	0x0000000003180044,	0x8000000103180043	
	.xword	0x0000000003200044,	0x8000000103200043	

	/*   primary context : L=1, size=4M, G=0  */
	.xword	0x0000000003400044,	0xe000000103200042	
	.xword	0x0000000003800044,	0xe000000103200042	

	/*   primary context : L=1, size=4M, G=1  */
	.xword	0x0000000003c00044,	0xe000000103200043	
	.xword	0x0000000004000044,	0xe000000104000043

	/*   secondary context : L=1, size=64k, G=0  */
	.xword	0x00000000151a0055,	0xa0000001051a0042	
	.xword	0x00000000151b0055,	0xa0000001051b0042	

	/*   secondary context : L=1, size=64k, G=1  */
	.xword	0x00000000151c0055,	0xa0000001051c0043	
	.xword	0x00000000151d0055,	0xa0000001051d0043	

	/*   secondary context : L=1, size=512k, G=0  */
	.xword	0x0000000010200055,	0x8000000100200042	
	.xword	0x0000000010280055,	0x8000000100280042	

	/*   secondary context : L=1, size=512k, G=1  */
	.xword	0x0000000010300055,	0x8000000100300043	
	.xword	0x0000000010380055,	0x8000000100380043	

	/*   secondary context : L=1, size=4M, G=0  */
	.xword	0x0000000010400055,	0xe000000100400042	
	.xword	0x0000000010800055,	0xe000000100800042	

	/*   secondary context : L=1, size=4M, G=1  */
	.xword	0x0000000010c00055,	0xe00000010c000043	
	.xword	0x0000000011000055,	0xe000000110000043	

	/*   secondary context : V=1,0 L=1, size=8k, G=0  */
	.xword	0x0000000011a10055,	0x8000000101a10042	
	.xword	0x0000000011a18055,	0x8000000101a18042	

	/*   secondary context : L=1, size=8k, G=1  */
	.xword	0x0000000011a20055,	0x8000000101a20043
	.xword	0x0000000011a28055,	0x8000000101a28043	

tsb_table2:
	/*   nucleus context : V=1,0 L=1, size=8k, G=0  */
	.xword	0x0000000000120000,	0xa000000000120046	/* entry for TrapHandler */
	.xword	0x0000000000110000,	0x8000000100110045	/* entry for the tsb table */
	.xword	0x0000000002000000,	0x8000000102000043	/* entry for the tsb table */
	.xword	0x0000000005180000,	0x8000000105180042	
	.xword	0x0000000005188000,	0x8000000105188042	

	/*   nucleus context : L=1, size=8k, G=1  */
	!.xword	0x0000000005190000,	0x8000000105190043

	/*   nucleus context : L=1, size=64k, G=0  */
	.xword	0x00000000051a0000,	0xa0000001051a0042	
	.xword	0x00000000051b0000,	0xa0000001051b0042	

	/*   nucleus context : L=1, size=64k, G=1  */
	.xword	0x00000000051c0000,	0xa0000001051c0043	
	.xword	0x00000000051d0000,	0xa0000001051d0043	

	/*   nucleus context : L=1, size=512k, G=0  */
	.xword	0x0000000000200000,	0x8000000100200042	
	.xword	0x0000000000280000,	0x8000000100280042	

	/*   nucleus context : L=1, size=512k, G=1  */
	.xword	0x0000000000300000,	0x8000000100300043	
	.xword	0x0000000000380000,	0x8000000100380043	

	/*   nucleus context : L=1, size=4M, G=0  */
	.xword	0x0000000000400000,	0xe000000100400042	
	.xword	0x0000000000800000,	0xe000000100800042	

	/*   nucleus context : L=1, size=4M, G=1  */
	.xword	0x0000000000c00000,	0xe00000010c000043	
	.xword	0x0000000001000000,	0xe000000110000043	

	/*   nucleus context : V=1,0 L=1, size=8k, G=0  */
	.xword	0x0000000001a10000,	0x8000000101a10042	
	.xword	0x0000000001a18000,	0x8000000101a18042	

	/*   nucleus context : L=1, size=8k, G=1  */
	.xword	0x0000000001a20000,	0x8000000101a20043
	.xword	0x0000000001a28000,	0x8000000101a28043	

	/*   nucleus context : L=1, size=64k, G=0  */
	.xword	0x0000000001a30000,	0xa000000101a30042	
	.xword	0x0000000001a40000,	0xa000000101a40042	

	/*   nucleus context : L=1, size=64k, G=1  */
	.xword	0x0000000001a50000,	0xa000000101a50043	
	.xword	0x0000000001a60000,	0xa000000101a60043	

	/*   nucleus context : L=1, size=512k, G=0  */
	.xword	0x0000000001a80000,	0x8000000101a80042	
	.xword	0x0000000001b00000,	0x8000000101b00042	

	/*   nucleus context : L=1, size=512k, G=1  */
	.xword	0x0000000001b80000,	0x8000000101b80043	
	.xword	0x0000000001b10000,	0x80000001010c0043	

	/*   nucleus context : L=1, size=4M, G=0  */
	.xword	0x0000000001400000,	0xe000000101400042	
	.xword	0x0000000001800000,	0x8000000101800042	

	/*   nucleus context : L=1, size=4M, G=1  */
	.xword	0x0000000001c00000,	0xe000000101c00043	
	.xword	0x0000000002040000,	0x8000000102040043	

	/*   primary context : V=1,0 L=1, size=8k, G=0  */
	.xword	0x0000000002080044,	0x8000000102080042	
	.xword	0x0000000002100044,	0x8000000102100042	

	/*   primary context : L=1, size=8k, G=1  */
	.xword	0x0000000002110044,	0x8000000102110043
	.xword	0x0000000002120044,	0x8000000102120043	

	/*   primary context : L=1, size=64k, G=0  */
	.xword	0x0000000002130044,	0xa000000102130042	
	.xword	0x0000000002140044,	0xa000000102140042	

	/*   primary context : L=1, size=64k, G=1  */
	.xword	0x0000000002150044,	0xa000000102150043	
	.xword	0x0000000002160044,	0xa000000102160043	

	/*   primary context : L=1, size=512k, G=0  */
	.xword	0x0000000002200044,	0x8000000102200042	
	.xword	0x0000000002280044,	0x8000000102280042	

	/*   primary context : L=1, size=512k, G=1  */
	.xword	0x0000000002300044,	0x8000000102300043	
	.xword	0x0000000002380044,	0x8000000102380043	

	/*   primary context : L=1, size=4M, G=0  */
	.xword	0x0000000002400044,	0xe000000102400042	
	.xword	0x0000000002800044,	0xe000000102800042	

	/*   primary context : L=1, size=4M, G=1  */
	.xword	0x0000000002c00044,	0xe000000102c00043	
	.xword	0x0000000003000044,	0x8000000103000043	

	/*   primary context : V=1,0 L=1, size=8k, G=0  */
	.xword	0x0000000003010044,	0x8000000103010042	
	.xword	0x0000000003018044,	0x8000000103018042	

	/*   primary context : L=1, size=8k, G=1  */
	.xword	0x0000000003020044,	0x8000000103020043
	.xword	0x0000000003028044,	0x8000000103028043	

	/*   primary context : L=1, size=64k, G=0  */
	.xword	0x0000000003030044,	0xa000000103030042	
	.xword	0x0000000003040044,	0xa000000103040042	

	/*   primary context : L=1, size=64k, G=1  */
	.xword	0x0000000003050044,	0xa000000103050043	
	.xword	0x0000000003060044,	0xa000000103060043	

	/*   primary context : L=1, size=512k, G=0  */
	.xword	0x0000000003080044,	0x8000000103080042	
	.xword	0x0000000003100044,	0x8000000103100042	

	/*   primary context : L=1, size=512k, G=1  */
	.xword	0x0000000003180044,	0x8000000103180043	
	.xword	0x0000000003200044,	0x8000000103200043	

	/*   primary context : L=1, size=4M, G=0  */
	.xword	0x0000000003400044,	0xe000000103200042	
	.xword	0x0000000003800044,	0xe000000103200042	

	/*   primary context : L=1, size=4M, G=1  */
	.xword	0x0000000003c00044,	0xe000000103200043	
	.xword	0x0000000004000044,	0xe000000104000043

	/*   secondary context : L=1, size=64k, G=0  */
	.xword	0x00000000151a0055,	0xa0000001051a0042	
	.xword	0x00000000151b0055,	0xa0000001051b0042	

	/*   secondary context : L=1, size=64k, G=1  */
	.xword	0x00000000151c0055,	0xa0000001051c0043	
	.xword	0x00000000151d0055,	0xa0000001051d0043	

	/*   secondary context : L=1, size=512k, G=0  */
	.xword	0x0000000010200055,	0x8000000100200042	
	.xword	0x0000000010280055,	0x8000000100280042	

	/*   secondary context : L=1, size=512k, G=1  */
	.xword	0x0000000010300055,	0x8000000100300043	
	.xword	0x0000000010380055,	0x8000000100380043	

	/*   secondary context : L=1, size=4M, G=0  */
	.xword	0x0000000010400055,	0xe000000100400042	
	.xword	0x0000000010800055,	0xe000000100800042	

	/*   secondary context : L=1, size=4M, G=1  */
	.xword	0x0000000010c00055,	0xe00000010c000043	
	.xword	0x0000000011000055,	0xe000000110000043	

	/*   secondary context : V=1,0 L=1, size=8k, G=0  */
	.xword	0x0000000011a10055,	0x8000000101a10042	
	.xword	0x0000000011a18055,	0x8000000101a18042	

	/*   secondary context : L=1, size=8k, G=1  */
	.xword	0x0000000011a20055,	0x8000000101a20043
	.xword	0x0000000011a28055,	0x8000000101a28043	

.align 	8192

new_page0:
	.word	0xffffeee1
	.word	0xffffeee2
	.word	0xffffeee3
	.word	0xffffeee4
	.word	0xffffeee5
	.word	0xffffeee6
	.word	0xffffeee7
	.word	0xffffeee8

.align	8192

.end
