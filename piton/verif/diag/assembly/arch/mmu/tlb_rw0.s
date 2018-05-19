// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: tlb_rw0.s
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
#include "enable_traps.h"

#ifdef MT_TEMPLATE
#include "mt_body.h"
#else
#include "boot.s"
.global main
#endif

.text

main:

	/* change to privileged mode to write DMMU reg */
	ta	T_CHANGE_PRIV
	nop

write_read_dtlb:
	mov	0x3d,	%l0
	mov	0x0,	%l1
	mov	0x28,	%l5	/* skip the first 5 entries */
	mov	0x0,	%o0	/* standard DMMU miss handler */

	/* adjust the timing between thread0 & thread 1 */
	nop;nop;nop;nop;nop;nop;
	setx	dtsb_table1,	%l1,	%l2
preload_dtlb1:
	ldx	[%l2],		%g4
	ldx	[%l2+0x8], 	%g5	
	add	%l2,	0x10,	%l2	
	
	mov	0x30,	%l3
        stxa    %g4,    [%l3] 0x58	/* tag access reg */
        stxa    %g5,    [%l5] 0x5d	/* data access reg */
	add	%l5,	0x8,	%l5


readout_dtlb1:
        /* read out one entry in D-TLB table to compare */
        set     0x0,    %l0
        set     0x40,   %l6
        set     0x18,    %l7	/* read out entry 3 , counting from 0 , the forth entry */
rdout_dtlb1_loop:
        ldxa    [%l7] 0x5d,     %l3
        ldxa    [%l7] 0x5e,     %l4

/*
 * Write & Read of I-TLB 
 */
        set     0x0,    %l0
        set     0x180000, %l3   /* Tag Access reg */
        setx    0x8000000100180040, %l0, %l4    /* lock bit set */

        set     0x30,    %l2
        set     0x10000, %l7
        set     0x18,   %l1
        set     0xc,   %l5             /* skip the first 3 entries */
        mov     0x30,   %o0

        stxa    %l3,    [%o0] 0x50      /* IMMU Tag Access Reg */
        stxa    %l4,    [%l1] 0x55      /* IMMU Data In Reg */
        ldxa    [%l1]   0x55,   %g4     /* IMMU data access reg */
        ldxa    [%l1]   0x56,   %g5     /* IMMU tag read reg */

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
	/*   nucleus context : L=0, size=64k, G=0  */
	.xword	0x00000000051a0000,	0xa0000001051a0002	
	.xword	0x00000000051b0000,	0x20000001051b0002	

	/*   nucleus context : V=1,0 L=0, size=8k, G=0  */
	.xword	0x0000000005180000,	0x8000000105180002	
	.xword	0x0000000005188000,	0x0000000105188002	

	/*   nucleus context : L=0, size=8k, G=1  */
	.xword	0x0000000005190000,	0x8000000105190003
	.xword	0x0000000005198000,	0x0000000105198003	

	/*   nucleus context : L=0, size=64k, G=1  */
	.xword	0x00000000051c0000,	0xa0000001051c0003	
	.xword	0x00000000051d0000,	0x20000001051d0003	

	/*   nucleus context : L=0, size=512k, G=0  */
	.xword	0x0000000000200000,	0xc000000100200002	
	.xword	0x0000000000280000,	0x4000000100280002	

	/*   nucleus context : L=0, size=512k, G=1  */
	.xword	0x0000000000300000,	0xc000000100300003	
	.xword	0x0000000000380000,	0x4000000100380003	

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

	/*   nucleus context : L=1, size=512k, G=0  */
	.xword	0x0000000001a80000,	0xc000000101a80042	
	.xword	0x0000000001b00000,	0x4000000101b00042	

	/*   nucleus context : L=1, size=512k, G=1  */
	.xword	0x0000000001b80000,	0xc000000101b80043	
	.xword	0x0000000001c00000,	0x40000001010c0043	

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

	/*   primary context : L=0, size=512k, G=0  */
	.xword	0x0000000002200044,	0xc000000102200002	
	.xword	0x0000000002280044,	0x4000000102280002	

	/*   primary context : L=0, size=512k, G=1  */
	.xword	0x0000000002300044,	0xc000000102300003	
	.xword	0x0000000002380044,	0x4000000102380003	

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

	/*   primary context : L=1, size=512k, G=0  */
	.xword	0x0000000003080044,	0xc000000103080042	
	.xword	0x0000000003100044,	0x4000000103100042	

	/*   primary context : L=1, size=512k, G=1  */
	.xword	0x0000000003180044,	0xc000000103180043	
	.xword	0x0000000003200044,	0x4000000103200043	

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

	/*   secondary context : L=0, size=512k, G=0  */
	.xword	0x0000000010200055,	0xc000000100200002	
	.xword	0x0000000010280055,	0x4000000100280002	

	/*   secondary context : L=0, size=512k, G=1  */
	.xword	0x0000000010300055,	0xc000000100300003	
	.xword	0x0000000010380055,	0x4000000100380003	

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
.end
