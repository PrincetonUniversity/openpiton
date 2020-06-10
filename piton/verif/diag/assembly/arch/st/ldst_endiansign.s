// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: ldst_endiansign.s
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
!!	test all the V9 ASIs LD/STs, including some of the traps 
!!
!!	add testing of pages with IE=1 , tested with ASI_PRIM(_LE)
!!	ASI_SECN(_LE), ASI_NUCLEUS(_LE) 
!!-------------------------------------------------------------------------------

#ifdef MT_TEMPLATE
#include "mt_body.h"
#else
#include "boot.s"
.global main
#endif

.text

#define FIXED 	1

#define ASI_NUCLEUS		0x4
#define ASI_NUCLEUS_LE		0xc
#define	ASI_ASIF_UPRIM		0x10
#define	ASI_ASIF_USECN		0x11
#define	ASI_ASIF_UPRIM_LE	0x18
#define	ASI_ASIF_USECN_LE	0x19
#define	ASI_PRIM		0x80
#define	ASI_SECN		0x81
#define	ASI_PRIM_NFLT		0x82
#define	ASI_SECN_NFLT		0x83
#define	ASI_PRIM_LE		0x88
#define	ASI_SECN_LE		0x89
#define	ASI_PRIM_NFLT_LE	0x8A
#define	ASI_SECN_NFLT_LE	0x8B

main:

	/*
	 ****************************************************
	 * Sign extension with differnet alignment of LD/STs
	 ****************************************************
	 */
#define	PG1_ST_DATA1	0xaa556677
#define	PG1_ST_DATA2	0xffeeffee
#define	PG1_ST_DATA3	0x00ffff77

	set	0x0,	%l0
	setx	dexec_pg1_data, %l0, %l1		
	ldsb	[%l1],	 	%l2
	ldsh	[%l1+0x2], 	%l2
	ldsw	[%l1+0x4], 	%l2	
	ldub	[%l1],	%l3
	lduh	[%l1+0x2],	%l3
	lduw	[%l1+0x4],	%l3
	ldx	[%l1+0x8],	%l4
	
	add	%l1,	0x10,	%l1
	set	PG1_ST_DATA1,	%l2
	set	PG1_ST_DATA2,	%l3	
	stb	%l2,	[%l1]
	sth	%l2,	[%l1]
	stw	%l2,	[%l1]		
	stx	%l2,	[%l1+0x8]

	ldsb	[%l1],	 	%l2
	ldsh	[%l1+0x2], 	%l2
	ldsw	[%l1+0x4], 	%l2	
	ldub	[%l1],	%l3
	lduh	[%l1+0x2],	%l3
	lduw	[%l1+0x4],	%l3
	ldx	[%l1+0x8],	%l4

	/*
	 ****************************************************
	 * IE = 1 , test the invert endianess
	 ****************************************************
	 */

	set	0x0,	%l0
	setx	dexec_pg2_data, %l0, %l1		
	ldsb	[%l1],	 	%l2
	ldsh	[%l1+0x2], 	%l2
	ldsw	[%l1+0x4], 	%l2	
	ldub	[%l1],	%l3
	lduh	[%l1+0x2],	%l3
	lduw	[%l1+0x4],	%l3
	ldx	[%l1+0x8],	%l4
	
	add	%l1,	0x10,	%l1
	set	PG1_ST_DATA1,	%l2
	set	PG1_ST_DATA2,	%l3	
	stb	%l2,	[%l1]
	sth	%l2,	[%l1]
	stw	%l2,	[%l1]		
	stx	%l2,	[%l1+0x8]

	ldsb	[%l1],	 	%l2
	ldsh	[%l1+0x2], 	%l2
	ldsw	[%l1+0x4], 	%l2	
	ldub	[%l1],	%l3
	lduh	[%l1+0x2],	%l3
	lduw	[%l1+0x4],	%l3
	ldx	[%l1+0x8],	%l4

/*
 ********************************
 *      Diag PASSED		*
 ********************************
 */
diag_pass:
        set     0xaaddcafe,     %l0
        ta T_GOOD_TRAP
        nop

/*
 ********************************
 *      Diag FAILED !           *
 ********************************
 */
diag_fail:
        set     0xdeadcafe,     %l0
        ta T_BAD_TRAP
        nop

/*
 ***************************************************
 * Pages defined 
 ***************************************************
 */

!!-------------------------------
!!	P=0 E=0 ASI=PRIM  
!!-------------------------------
#define DEXEC_PG1_BASE_DATA_ADDR        0x20018000
#define DEXEC_PG1_BASE_DATA_ADDR_RA     0x20018000

SECTION .DEXEC_PG1 DATA_VA=DEXEC_PG1_BASE_DATA_ADDR
attr_data {
        Name = .DEXEC_PG1,
        VA=DEXEC_PG1_BASE_DATA_ADDR, PA=ra2pa(DEXEC_PG1_BASE_DATA_ADDR_RA,0),
        RA=DEXEC_PG1_BASE_DATA_ADDR_RA,
        part_0_d_ctx_nonzero_ps0_tsb,
#ifdef CSM_ENABLE
        part_0_d_ctx_nonzero_ps0_tsb_csm,
        TTE_HDID=0, TTE_HD_SIZE=mpeval(PITON_NUM_TILES%64), TTE_SDID=0, TTE_LSID=0,
#endif
        TTE_G=0, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=1, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=1
        }

.data

.global  dexec_pg1_data

dexec_pg1_data: 
		.word   0xaabbccdd
                .word   0x778899aa
                .word   0x55667788
                .word   0x99aabbcc
		.word   0xaabbccdd
                .word   0x778899aa
                .word   0x55667788
                .word   0x99aabbcc
		.word   0xaabbccdd
                .word   0x778899aa
                .word   0x55667788
                .word   0x99aabbcc
		.word   0xaabbccdd
                .word   0x778899aa
                .word   0x55667788
                .word   0x99aabbcc
.end

!!-------------------------------
!!	P=0 E=0 ASI=PRIM IE = 1
!!-------------------------------
#define DEXEC_PG2_BASE_DATA_ADDR        0x2001a000
#define DEXEC_PG2_BASE_DATA_ADDR_RA     0x2001a000

SECTION .DEXEC_PG2 DATA_VA=DEXEC_PG2_BASE_DATA_ADDR
attr_data {
        Name = .DEXEC_PG2,
        VA=DEXEC_PG2_BASE_DATA_ADDR, PA=ra2pa(DEXEC_PG2_BASE_DATA_ADDR_RA,0),
        RA=DEXEC_PG2_BASE_DATA_ADDR_RA,
        part_0_d_ctx_nonzero_ps0_tsb,
#ifdef CSM_ENABLE
        part_0_d_ctx_nonzero_ps0_tsb_csm,
        TTE_HDID=0, TTE_HD_SIZE=mpeval(PITON_NUM_TILES%64), TTE_SDID=0, TTE_LSID=0,
#endif
        TTE_G=0, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=1, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=1, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=1
        }

.data

.global  dexec_pg2_data

dexec_pg2_data: 
	 	.word   0x55664433
                .word   0xaabbeedd
                .word   0x778899aa
                .word   0x33445566
	 	.word   0x55664433
                .word   0xaabbeedd
                .word   0x778899aa
                .word   0x33445566
	 	.word   0x55664433
                .word   0xaabbeedd
                .word   0x778899aa
                .word   0x33445566
	 	.word   0x55664433
                .word   0xaabbeedd
                .word   0x778899aa
                .word   0x33445566
.end

