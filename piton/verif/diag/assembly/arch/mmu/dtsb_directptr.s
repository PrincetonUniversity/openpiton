// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: dtsb_directptr.s
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
!!			test all the MMU traps
!!
!!-------------------------------------------------------------------------------
#define H_HT0_data_access_protection_0x6c	T0_dprot_trap

#include "enable_traps.h"
#include "boot.s"

.text
.global main

main:
	/*
	 * Test the D-TSB direct pointer register 
	 * of 4MByte page fault.
	 */
        /*
         * Let the fast_data_access_protection trap happens,
         * to make the MMU hardware map the 8kb/64kb pointer
         * to Direct Pointer Registers.
         */
!!-------------------------------------------
!!      DMMU TTE size bits = 0 : 8k
!!-------------------------------------------

        set     0x0,    %l4
        set     0x55aa,    %l2
        setx    dtte_prot_8kpg,  %l4,    %l5

        stuwa   %l2,    [%l5]  0x80     /* cause the trap */
        nop

!!-------------------------------------------
!!      DMMU TTE size bits = 3 : 4M
!!-------------------------------------------

        set     0x0,    %l4
        set     0x55aa,    %l2
        setx    dtte_prot_4mpg,  %l4,    %l5

        stuwa   %l2,    [%l5]  0x80     /* cause the trap */
        nop

!!-------------------------------------------
!!      DMMU TTE size bits = 1 : 64k
!!-------------------------------------------

        set     0x0,    %l4
        set     0x55aa,    %l2
        setx    dtte_prot_64kpg,  %l4,    %l5

        stuwa   %l2,    [%l5]  0x80     /* cause the trap */
        nop

/*
 ********************************
 *      Diag PASSED		*
 ********************************
 */
diag_pass:
        set     0xaaddcafe,     %l0
good_trap:
        ta T_GOOD_TRAP
        nop

/*
 ********************************
 *      Diag FAILED !           *
 ********************************
 */
diag_fail:
        set     0xdeadcafe,     %l0
bad_trap:
        ta T_BAD_TRAP
        nop
        nop

/*
 ***************************************************
 * Pages defined to test out the MMU access traps
 ***************************************************
 */

.data

swap_data:
	.xword	0xffff0000aaaabbbb
	.xword	0xffff0000aaaacccc
	.xword	0xffff0000aaaadddd
	.xword	0xffff0000aaaaeeee
.end


!!-----------------------------------------------------
!!      4MB page size for I/D TTE
!!-----------------------------------------------------
#define ITTE_4MB_PG_BASE_DATA_ADDR      0x8800000
#define ITTE_4MB_PG_BASE_DATA_ADDR_PA   0x18800000

SECTION .ITTE_4MB_PAGE DATA_VA=ITTE_4MB_PG_BASE_DATA_ADDR

attr_data {
        Name = .ITTE_4MB_PAGE,
        VA=ITTE_4MB_PG_BASE_DATA_ADDR, 
	RA=ITTE_4MB_PG_BASE_DATA_ADDR,
	PA=ra2pa(ITTE_4MB_PG_BASE_DATA_ADDR, 0),
        part_0_d_ctx_nonzero_ps0_tsb,
        TTE_G=0, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=3, tte_size_ptr=0,
	TTE_NFO=0, TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=0, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=0
        }


.data

.global  dtte_prot_4mpg

dtte_prot_4mpg:  .word   0x11223344
                .word   0x11223355
                .word   0x11223366
                .word   0x11223377
.end
	
!!-----------------------------------------------------
!!      8kB page size for I/D TTE
!!-----------------------------------------------------
#define ITTE_8kB_PG_BASE_DATA_ADDR      0x170000
#define ITTE_8kB_PG_BASE_DATA_ADDR_PA   0x10170000

SECTION .ITTE_8kB_PAGE DATA_VA=ITTE_8kB_PG_BASE_DATA_ADDR

attr_data {
        Name = .ITTE_8kB_PAGE,
        VA=ITTE_8kB_PG_BASE_DATA_ADDR, 
	RA=ITTE_8kB_PG_BASE_DATA_ADDR,
	PA=ra2pa(ITTE_8kB_PG_BASE_DATA_ADDR, 0),
        part_0_d_ctx_nonzero_ps0_tsb,
        TTE_G=0, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=0, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=0
        }


.data

.global  dtte_prot_8kpg

dtte_prot_8kpg:  .word   0x11223344
                .word   0x11223355
                .word   0x11223366
                .word   0x11223377
.end
	
!!-----------------------------------------------------
!!      64kB page size for I/D TTE
!!-----------------------------------------------------
#define ITTE_64kB_PG_BASE_DATA_ADDR      0x190000
#define ITTE_64kB_PG_BASE_DATA_ADDR_PA   0x10190000

SECTION .ITTE_64kB_PAGE DATA_VA=ITTE_64kB_PG_BASE_DATA_ADDR

attr_data {
        Name = .ITTE_64kB_PAGE,
        VA=ITTE_64kB_PG_BASE_DATA_ADDR, 
	RA=ITTE_64kB_PG_BASE_DATA_ADDR,
	PA=ra2pa(ITTE_64kB_PG_BASE_DATA_ADDR,0),
        part_0_d_ctx_nonzero_ps0_tsb,
        TTE_G=0, TTE_Context=PCONTEXT, TTE_V=1, tte_size_ptr=0, TTE_Size=1, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=0, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=0
        }


.data

.global  dtte_prot_64kpg

dtte_prot_64kpg:  .word   0x11223344
                .word   0x11223355
                .word   0x11223366
                .word   0x11223377
	
!!-----------------------------------------------------
!!      8kb page size for custom trap handler
!!-----------------------------------------------------

SECTION .HTRAPS
.text

.align 0x100
.global  T0_dprot_trap
T0_dprot_trap:
	mov	0x0,	%o0
	ldxa [%g0] 0x5b, %g6    /* D-TSB Direct Poiner Registers */
	nop
        /* read the DMMU SFSR */
        set     0x0,    %l0
        set     0x18,   %l1
        ldxa    [%l1] 0x58,     %l4
        nop
	done
	nop

