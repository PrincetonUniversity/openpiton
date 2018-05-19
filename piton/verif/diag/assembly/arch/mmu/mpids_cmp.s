// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: mpids_cmp.s
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
!!	Test MT thread accessing DMMU/IMMU
!!
!!-------------------------------------------------------------------------------

#define THREAD_COUNT 	4
#define USER_TEXT_MT_MAP
#define USER_DATA_MT_MAP

#define THR0_BASE_TEXT_ADDR 0x52000000
#define THR0_BASE_TEXT_ADDR_RA 0x11022000
#define THR0_BASE_DATA_ADDR 0x125000000
#define THR0_BASE_DATA_ADDR_RA 0x22022000

#define THR_INCREMENT	0x150000

#define THR_0_PARTID 7
#define THR_1_PARTID 6
#define THR_2_PARTID 5
#define THR_3_PARTID 4
#define THR_4_PARTID 3
#define THR_5_PARTID 2
#define THR_6_PARTID 1
#define THR_7_PARTID 0

#include "boot.s"

SECTION  .MAIN0
.text
.global main0
main0:
	setx thr_0_start, %l0, %l1
	jmpl %l1, %l2
	nop

SECTION  .MAIN1
.text
.global main1
main1:
	ta T_GOOD_TRAP

SECTION  .MAIN2
.text
.global main2
main2:
	ta T_GOOD_TRAP

SECTION  .MAIN3
.text
.global main3
main3:
	ta T_GOOD_TRAP

.global main

.text

main:


SECTION .THR0     TEXT_VA=THR0_BASE_TEXT_ADDR, DATA_VA=THR0_BASE_DATA_ADDR
attr_text {
        Name = .THR0,
        VA=THR0_BASE_TEXT_ADDR,
        PA=ra2pa(THR0_BASE_TEXT_ADDR_RA, THR_0_PARTID),
        RA=THR0_BASE_TEXT_ADDR_RA,
        part_7_i_ctx_nonzero_ps0_tsb,
        TTE_G=0, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=0, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=0
        }

attr_data {
        Name = .THR0,
        VA=THR0_BASE_DATA_ADDR,
        PA=ra2pa(THR0_BASE_DATA_ADDR_RA, THR_0_PARTID),
        RA=THR0_BASE_DATA_ADDR_RA,
        part_7_d_ctx_nonzero_ps0_tsb,
        TTE_G=0, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=0, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=0
        }

attr_text {
        Name=.THR0,
        hypervisor
}
attr_data {
        Name=.THR0,
        hypervisor
}

.global thr_0_start
thr_0_start:
	ta	T_CHANGE_HPRIV
	nop
	/*
	 ****************************************************
	 *	th0 writes to DTLB tag/data-access reg
	 ****************************************************
	 */
	mov	0x10,	%l7	/* loop counter */
th0_wrloop:
	mov	0x3f,	%l0
	mov	0x0,	%l1
	mov	0x8,	%l5	/* skip the first  entrie */
	mov	0x0,	%o0	/* standard DMMU miss handler */
	setx	dtsb_table1,	%i1,	%l2
th0_load_dtlb1:
	ldx	[%l2],		%g4
	ldx	[%l2+0x8], 	%g5	
	add	%l2,	0x10,	%l2	
	
	mov	0x30,	%l3
        stxa    %g4,    [%l3] 0x58	/* tag access reg */
        stxa    %g5,    [%l5] 0x5d	/* data access reg */
	add	%l5,	0x8,	%l5

	add	%l1,	0x1,	%l1
	sub	%l1,	%l0,	%l6
	brnz	%l6,	th0_load_dtlb1
	nop

	brgz	%l7,	th0_wrloop
	sub	%l7,	0x1, 	%l7

	ba	diag_pass
	nop

diag_pass:
        ta      T_GOOD_TRAP
        nop

.data
.align 0x1fff+1

dtsb_table1:
        /*   nucleus context : V=1,0 L=0, size=4mb, G=0  */
        .xword  0x0000000000400000,     0x8000000100400002	/* 3 */ 
        .xword  0x0000000000480000,     0x8000000100480042	/* 4 */
        .xword  0x0000000000490000,     0xa000000100490042	/* 5 */
        /*   nucleus context : V=1,0 L=0, size=8k, G=0  */
        .xword  0x0000000000492000,     0x8000000100492092	/* 6 */
        /*   nucleus context : V=1,0 L=1, size=512k, G=0  */
        .xword  0x0000000000480000,     0xe000000100480042	/* 7 */
        /*   nucleus context : V=1,0 L=0, size=8k, G=0  */
        .xword  0x0000000000492000,     0x8000000100492092	/* 8 */
        /*   nucleus context : V=1,0 L=1, size=64k, G=0  */
        .xword  0x0000000000490000,     0xa000000100490042	/* 9 */
        /*   nucleus context : V=1,0 L=1, size=512k, G=0  */
        .xword  0x0000000000480000,     0xe000000100480042	/* 10 */
        /*   nucleus context : V=1,0 L=0, size=4mb, G=0  */
        .xword  0x0000000000400000,     0xe000000100400002	/* 11 */ 
        /*   nucleus context : V=1,0 L=1, size=64k, G=0  */
        .xword  0x0000000000490000,     0xa000000100490042	/* 12 */
        /*   primary context : V=1,0 L=0, size=4mb, G=0  */
        .xword  0x0000000000400044,     0xe000000100400002	/* 13 */ 
        /*   primary context : V=1,0 L=1, size=512k, G=0  */
        .xword  0x0000000000480044,     0xe000000100480042	/* 14 */
        /*   primary context : V=1,0 L=1, size=64k, G=0  */
        .xword  0x0000000000490044,     0xa000000100490042	/* 15 */
        /*   primary context : V=1,0 L=0, size=8k, G=0  */
        .xword  0x0000000001492044,     0x8000000100492092	/* 16 */
        /*   primary context : V=1,0 L=1, size=512k, G=0  */
        .xword  0x0000000001480044,     0xe000000100480042	/* 17 */
        /*   primary context : V=1,0 L=0, size=8k, G=0  */
        .xword  0x0000000001492044,     0x8000000100492092	/* 18 */
        /*   primary context : V=1,0 L=1, size=64k, G=0  */
        .xword  0x0000000002490044,     0xa000000100490042	/* 19 */
        /*   primary context : V=1,0 L=1, size=512k, G=0  */
        .xword  0x0000000002480044,     0xe000000100480042	/* 20 */
        /*   primary context : V=1,0 L=0, size=4mb, G=0  */
        .xword  0x0000000002400044,     0xe000000100400002	/* 21 */ 
        /*   primary context : V=1,0 L=1, size=64k, G=0  */
        .xword  0x0000000002490044,     0xa000000100490042	/* 22 */
        /*   secondary  context : V=1,0 L=0, size=4mb, G=0  */
        .xword  0x0000000000400055,     0xe000000100400002	/* 23 */ 
        /*   secondary  context : V=1,0 L=1, size=512k, G=0  */
        .xword  0x0000000000480055,     0xe000000100480042	/* 24 */
        /*   secondary  context : V=1,0 L=1, size=64k, G=0  */
        .xword  0x0000000000490055,     0xa000000100490042	/* 25 */
        /*   secondary  context : V=1,0 L=0, size=8k, G=0  */
        .xword  0x0000000000492055,     0x8000000100492092	/* 26 */
        /*   secondary  context : V=1,0 L=1, size=512k, G=0  */
        .xword  0x0000000002480055,     0xe000000100480042	/* 27 */
        /*   secondary  context : V=1,0 L=0, size=8k, G=0  */
        .xword  0x0000000002492055,     0x8000000100492092	/* 28 */
        /*   secondary  context : V=1,0 L=1, size=64k, G=0  */
        .xword  0x0000000002490055,     0xa000000100490042	/* 29 */
        /*   secondary  context : V=1,0 L=1, size=512k, G=0  */
        .xword  0x0000000002480055,     0xe000000100480042	/* 30 */
        /*   secondary  context : V=1,0 L=0, size=4mb, G=0  */
        .xword  0x0000000002400055,     0xe000000100400002	/* 31 */ 
        /*   secondary  context : V=1,0 L=1, size=64k, G=0  */
        .xword  0x0000000002490055,     0xa000000100490042	/* 32 */

	/*   nucl context : L=0, size=4M, G=0  */
	.xword	0x0000000010400000,	0xe000000100400002		/* 33 */
	.xword	0x0000000010800000,	0x6000000100800002		/* 34 */

	/*   prim context : L=0, size=4M, G=0  */
	.xword	0x0000000010400044,	0xe000000100400002		/* 35 */
	.xword	0x0000000010800044,	0x6000000100800002		/* 36 */

	/*   secondary context : L=0, size=4M, G=0  */
	.xword	0x0000000010400055,	0xe000000110400002		/* 37 */
	.xword	0x0000000010800055,	0x6000000100800002		/* 38 */

	/*   nucl context : L=1, size=64k, G=0  */
	.xword	0x0000000011a30000,	0xa000000101a30042		/* 39 */
	.xword	0x0000000011a40000,	0x2000000101a40042		/* 40 */

	/*   prim context : L=1, size=64k, G=0  */
	.xword	0x0000000011a30044,	0xa000000101a30042		/* 41 */
	.xword	0x0000000011a40044,	0x2000000101a40042		/* 42 */

	/*   secondary context : L=1, size=64k, G=0  */
	.xword	0x0000000011a30055,	0xa000000101a30042		/* 43 */
	.xword	0x0000000011a40055,	0x2000000101a40042		/* 44 */

	/*   secondary context : L=1, size=64k, G=1  */
	.xword	0x0000000011a50055,	0xa000000101a50043		/* 45 */
	.xword	0x0000000011a60055,	0x2000000101a60043		/* 46 */

	/*   secondary context : L=1, size=512k, G=1  */
	.xword	0x0000000011b80055,	0xe000000101b80043		/* 47 */
	/*   secondary context : L=1, size=4M, G=0  */
	.xword	0x0000000011400055,	0xe000000101400042		/* 49 */
	.xword	0x0000000011800055,	0x6000000101800042		/* 50 */

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

	/*   primary context : L=0, size=512k, G=0  */
	.xword	0x0000000012200044,	0xe000000102200002		/* 61 */
	.xword	0x0000000012280044,	0x6000000102280002		/* 62 */

	/*   primary context : L=0, size=512k, G=1  */
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

	/*   nucleus context : L=0, size=512k, G=0  */
	.xword	0x0000000000200000,	0xe000000100200002		/* 1 */
	.xword	0x0000000000280000,	0x6000000100280002		/* 1 */

	/*   nucleus context : L=0, size=512k, G=1  */
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

.align 	0x1000
tsb_table2:
        /*   primary context : V=1,0 L=0, size=8k, G=0  */
        .xword  0x0000000005180044,     0x8000000105180042              /* 2 */
        .xword  0x0000000005188044,     0x0000000105188042              /* 3 */
        /*   nucleus context : V=1,0 L=0, size=8k, G=0  */
        .xword  0x0000000005180000,     0x8000000105180042      /* 0 */
        .xword  0x0000000005188000,     0x0000000105188042      /* 1 */
        /*   secondary context : V=1,0 L=0, size=8k, G=0  */
        .xword  0x0000000005180055,     0x8000000105180042              /* 4 */
        .xword  0x0000000005188055,     0x0000000105188042              /* 5 */
        /*   nucl context : V=1,0 L=1, size=8k, G=0  */
        .xword  0x0000000011a10000,     0x8000000101a10042              /* 6 */
        .xword  0x0000000011a18000,     0x0000000101a18042              /* 7 */
        /*   prim context : V=1,0 L=1, size=8k, G=0  */
        .xword  0x0000000011a10044,     0x8000000101a10042              /* 8 */
        .xword  0x0000000011a18044,     0x0000000101a18042              /* 9 */
        /*   secondary context : V=1,0 L=1, size=8k, G=0  */
        .xword  0x0000000011a10055,     0x8000000101a10042              /* 10 */
        .xword  0x0000000011a18055,     0x0000000101a18042              /* 11 */
        /*   nucleus context : L=0, size=64k, G=0  */
        .xword  0x00000000051a0000,     0xa0000001051a0042              /* 12 */
        .xword  0x00000000051b0000,     0x20000001051b0042              /* 13 */
        /*   primary context : L=0, size=64k, G=0  */
        .xword  0x00000000051a0044,     0xa0000001051a0042              /* 14 */
        .xword  0x00000000051b0044,     0x20000001051b0042              /* 1 */
        /*   secondary context : L=0, size=64k, G=0  */
        .xword  0x00000000051a0055,     0xa0000001051a0042              /* 16 */
        .xword  0x00000000051b0055,     0x20000001051b0042              /* 1 */
        /*   prim context : L=1, size=512k, G=0  */
        .xword  0x0000000011a80044,     0xe000000101a80042              /* 18 */
        .xword  0x0000000011b00044,     0x6000000101b00042              /* 1 */
        /*   secondary context : L=1, size=512k, G=0  */
        .xword  0x0000000011a80055,     0xe000000101a80042              /* 20 */
        .xword  0x0000000011b00055,     0x6000000101b00042              /* 1 */
        /*   nucl context : L=1, size=512k, G=0  */
        .xword  0x0000000011a80000,     0xe000000101a80042              /* 22 */
        .xword  0x0000000011b00000,     0x6000000101b00042              /* 23 */
        /*   nucl context : L=0, size=512k, G=0  */
        .xword  0x0000000010200000,     0xe000000100200042              /* 24 */
        .xword  0x0000000010280000,     0x6000000100280042              /* 25 */
        /*   prim context : L=0, size=512k, G=0  */
        .xword  0x0000000010200044,     0xe000000100200042              /* 26 */
        .xword  0x0000000010280044,     0x6000000100280042              /* 27 */
        /*   secondary context : L=0, size=512k, G=0  */
        .xword  0x0000000010200055,     0xe000000100200042              /* 28 */
        .xword  0x0000000010280055,     0x6000000100280042              /* 29 */
        /*   nucl context : L=0, size=4M, G=0  */
        .xword  0x0000000010400000,     0xe000000100400042              /* 30 */
        .xword  0x0000000010800000,     0x6000000100800042              /* 31 */
        /*   prim context : L=0, size=4M, G=0  */
        .xword  0x0000000010400044,     0xe000000100400042              /* 32 */
        .xword  0x0000000010800044,     0x6000000100800042              /* 33 */
        /*   secondary context : L=0, size=4M, G=0  */
        .xword  0x0000000010400055,     0xe000000100400042              /* 34 */
        .xword  0x0000000010800055,     0x6000000100800042              /* 35 */
        /*   nucl context : L=1, size=64k, G=0  */
        .xword  0x0000000011a30000,     0xa000000101a30042              /* 36 */
        .xword  0x0000000011a40000,     0x2000000101a40042              /* 37 */

        /*   prim context : L=1, size=64k, G=0  */
        .xword  0x0000000011a30044,     0xa000000101a30042              /* 38 */
        .xword  0x0000000011a40044,     0x2000000101a40042              /* 39 */

        /*   secondary context : L=1, size=64k, G=0  */
        .xword  0x0000000011a30055,     0xa000000101a30042              /* 40 */
        .xword  0x0000000011a40055,     0x2000000101a40042              /* 41 */

        /*   secondary context : L=1, size=64k, G=1  */
        .xword  0x0000000011a50055,     0xa000000101a50043              /* 42 */
        .xword  0x0000000011a60055,     0x2000000101a60043              /* 43 */

        /*   secondary context : L=1, size=512k, G=1  */
        .xword  0x0000000011b80055,     0xe000000101b80043              /* 44 */
        .xword  0x0000000011c00055,     0x60000001010c0043              /* 45 */

        /*   secondary context : L=1, size=4M, G=0  */
        .xword  0x0000000011400055,     0xe000000101400042              /* 46 */
        .xword  0x0000000011800055,     0x6000000101800042              /* 47 */

        /*   secondary context : L=1, size=4M, G=1  */
        .xword  0x0000000011c00055,     0x6000000101c00043              /* 48 */
        .xword  0x0000000012000055,     0xe000000102000043              /* 49 */

        /*   primary context : V=1,0 L=0, size=8k, G=0  */
        .xword  0x0000000012080044,     0x8000000102080002              /* 50 */
        .xword  0x0000000012100044,     0x0000000102100002              /* 51 */

        /*   primary context : L=0, size=8k, G=1  */
        .xword  0x0000000012110044,     0x8000000102110003      /* 52 */
        .xword  0x0000000012120044,     0x0000000102120003              /* 1 */

        /*   primary context : L=0, size=64k, G=0  */
        .xword  0x0000000012130044,     0xa000000102130002              /* 54 */
        .xword  0x0000000012140044,     0x2000000102140002              /* 1 */

        /*   primary context : L=0, size=64k, G=1  */
        .xword  0x0000000012150044,     0xa000000102150003              /* 56 */
        .xword  0x0000000012160044,     0x2000000102160003              /* 1 */

        /*   primary context : L=0, size=512k, G=0  */
        .xword  0x0000000012200044,     0xe000000102200002              /* 58 */
        .xword  0x0000000012280044,     0x6000000102280002              /* 1 */

        /*   primary context : L=0, size=512k, G=1  */
        .xword  0x0000000012300044,     0xe000000102300003              /* 60 */
        .xword  0x0000000012380044,     0x6000000102380003              /* 1 */

        /*   primary context : L=0, size=4M, G=0  */
        .xword  0x0000000012400044,     0xe000000102400002              /* 62 */
        .xword  0x0000000012800044,     0x6000000102800002              /* 1 */

        /*   nucleus context : L=0, size=64k, G=0  */
        .xword  0x00000000051a0000,     0xa0000001051a0002              /* 64 */
        .xword  0x00000000051b0000,     0x20000001051b0002              /* 1 */

        /*   nucleus context : L=0, size=64k, G=1  */
        .xword  0x00000000051c0000,     0xa0000001051c0003              /* 1 */
        .xword  0x00000000051d0000,     0x20000001051d0003              /* 1 */
        /*   nucleus context : L=0, size=512k, G=0  */
        .xword  0x0000000000200000,     0xe000000100200002              /* 1 */
        .xword  0x0000000000280000,     0x6000000100280002              /* 1 */

