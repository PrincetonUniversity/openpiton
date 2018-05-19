// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: dexec_nf.s
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

#define MAIN_PAGE_HV_ALSO

#include "boot.s"

.text
.global main

main:
	set	0xffff0000,	%l2
	set	0x0,	%l0
	setx	swap_data, %l0, %l1
	swap	[%l1],	%g0

	casa	[%l1] 0x80,	%l2,	%g0

!!-------------------------------
!!	P=0 E=1 ASI=PRIM_NF
!!-------------------------------
test_case1:
        /* enable the trap */
        set     0x30,   %o0     /* Data access exception trap */
        ta      T_HTRAP_EN
        nop
       
        set     0x0,    %l0
        setx    0x2a0000, %l0, %l1
        lduwa   [%l1] 0x82,      %l2
        nop

        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0003,     %l1

!!-------------------------------
!!	P=0 E=1 ASI=SEC_NF
!!-------------------------------
test_case2:
        /* enable the trap */
        set     0x30,   %o0     /* Data access exception trap */
        ta      T_HTRAP_EN
        nop
        
        set     0x0,    %l0
        setx    0x2a8000, %l0, %l1
        lduwa   [%l1] 0x83,      %l2
        nop

        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0003,     %l1


!!-------------------------------
!!	P=1 E=1 ASI=PRIM_NF
!!-------------------------------
test_case3:
        /* enable the trap */
        set     0x30,   %o0     /* Data access exception trap */
        ta      T_HTRAP_EN
        nop
       
        set     0x0,    %l0
        setx    0x2c0000, %l0, %l1
        lduwa   [%l1] 0x82,      %l2
        nop

        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0003,     %l1

!!-------------------------------
!!	P=1 E=1 ASI=SEC_NF
!!-------------------------------
test_case4:
        /* enable the trap */
        set     0x30,   %o0     /* Data access exception trap */
        ta      T_HTRAP_EN
        nop
        
        set     0x0,    %l0
        setx    0x2c8000, %l0, %l1
        lduwa   [%l1] 0x83,      %l2
        nop

        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0003,     %l1

/*
 *************************************************
 *  Data access exception trap
 *      load: PRIV=1
 *************************************************
 */
        ta      T_CHANGE_PRIV
        nop

!!-------------------------------
!!	P=0 E=1 ASI=PRIM_NF
!!-------------------------------
test_case5:
        /* enable the trap */
        set     0x30,   %o0     /* Data access exception trap */
        ta      T_HTRAP_EN
        nop
       
        set     0x0,    %l0
        setx    0x2a0000, %l0, %l1
        lduwa   [%l1] 0x82,      %l2
        nop

        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0003,     %l1

!!-------------------------------
!!	P=0 E=1 ASI=SEC_NF
!!-------------------------------
test_case6:
        /* enable the trap */
        set     0x30,   %o0     /* Data access exception trap */
        ta      T_HTRAP_EN
        nop
        
        set     0x0,    %l0
        setx    0x2a8000, %l0, %l1
        lduwa   [%l1] 0x83,      %l2
        nop

        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0003,     %l1

!!-------------------------------
!!	P=1 E=1 ASI=PRIM_NF
!!-------------------------------
test_case7:
        /* enable the trap */
        set     0x30,   %o0     /* Data access exception trap */
        ta      T_HTRAP_EN
        nop
       
        set     0x0,    %l0
        setx    0x2c0000, %l0, %l1
        lduwa   [%l1] 0x82,      %l2
        nop

        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0003,     %l1

!!-------------------------------
!!	P=1 E=1 ASI=SEC_NF
!!-------------------------------
test_case8:
        /* enable the trap */
        set     0x30,   %o0     /* Data access exception trap */
        ta      T_HTRAP_EN
        nop
        
        set     0x0,    %l0
        setx    0x2c8000, %l0, %l1
        lduwa   [%l1] 0x83,      %l2
        nop

        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0003,     %l1

/*
 * change back to USER mode 
 */
        ta      T_CHANGE_NONPRIV
        nop

	/*
	 * Test the D-TSB direct pointer register 
	 * of 4MByte page fault.
	 */
        /*
         * Let the fast_data_access_exception trap happens,
         * to make the MMU hardware map the 8kb/64kb pointer
         * to Direct Pointer Registers.
         */
!!-------------------------------------------
!!      DMMU TTE size bits = 3 : 4M
!!-------------------------------------------
        /* enable the trap */
        set     0x6c,   %o0     /* Data access protection trap */
        ta      T_HTRAP_EN
        nop

        set     0x0,    %l4
        set     0x55aa,    %l2
        setx    0x6000000,  %l4,    %l5
        st      %l2,    [%l4+%l5]       /* cause the trap */
        nop

        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0003,     %l1

        set     0x0,    %g4
        set     0x0,    %g5

	ta	T_CHANGE_HPRIV
	nop

        ldxa    [%g0] 0x5b,     %g4     /* D-TSB Direct Poiner Registers */

	ta	T_CHANGE_NONHPRIV
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
#define ITTE_4MB_PG_BASE_DATA_ADDR      0x6000000
#define ITTE_4MB_PG_BASE_DATA_ADDR_RA   0x106000000

SECTION .ITTE_4MB_PAGE DATA_VA=ITTE_4MB_PG_BASE_DATA_ADDR

attr_data {
        Name = .ITTE_4MB_PAGE,
        VA=ITTE_4MB_PG_BASE_DATA_ADDR, 
	RA=ITTE_4MB_PG_BASE_DATA_ADDR_RA,
	PA=ra2pa(ITTE_4MB_PG_BASE_DATA_ADDR_RA,0),
        part_0_d_ctx_nonzero_ps1_tsb,
        TTE_G=0, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0x3, tte_size_ptr=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=0, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=0
        }


.data

.global  dtte_4mb_data

dtte_4mb_data:  .word   0x11223344
                .word   0x11223355
                .word   0x11223366
                .word   0x11223377
.end
	
!!-------------------------------
!!	P=0 E=1 ASI=PRIM_NF
!!-------------------------------
#define DEXEC_PG11_BASE_DATA_ADDR        0x2a0000
#define DEXEC_PG11_BASE_DATA_ADDR_PA     0x1002a0000

SECTION .DEXEC_PG11 DATA_VA=DEXEC_PG11_BASE_DATA_ADDR
attr_data {
        Name = .DEXEC_PG11,
        VA=DEXEC_PG11_BASE_DATA_ADDR, 
	RA=DEXEC_PG11_BASE_DATA_ADDR_PA,
	PA=DEXEC_PG11_BASE_DATA_ADDR_PA,
        part_0_d_ctx_nonzero_ps0_tsb,
        TTE_G=0, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=1,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=0, TTE_CV=0, TTE_E=1, TTE_P=0, TTE_W=0
        }


.data

.global  dexec_pg11_data

dexec_pg11_data: 
		.word   0x11223344
                .word   0x11223355
                .word   0x11223366
                .word   0x11223377
.end

!!-------------------------------
!!	P=0 E=1 ASI=SEC_NF
!!-------------------------------
#define DEXEC_PG12_BASE_DATA_ADDR        0x2a8000
#define DEXEC_PG12_BASE_DATA_ADDR_PA     0x1002a8000

SECTION .DEXEC_PG12 DATA_VA=DEXEC_PG12_BASE_DATA_ADDR
attr_data {
        Name = .DEXEC_PG12,
        VA=DEXEC_PG12_BASE_DATA_ADDR, 
	RA=DEXEC_PG12_BASE_DATA_ADDR_PA,
	PA=DEXEC_PG12_BASE_DATA_ADDR_PA,
        part_0_d_ctx_nonzero_ps0_tsb,
        TTE_G=0, TTE_Context=SCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=1,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=0, TTE_CV=0, TTE_E=1, TTE_P=0, TTE_W=0
        }


.data

.global  dexec_pg12_data

dexec_pg12_data: .word   0x11223344
                .word   0x11223355
                .word   0x11223366
                .word   0x11223377
.end

!!-------------------------------
!!	P=1 E=1 ASI=PRIM_NF
!!-------------------------------
#define DEXEC_PG15_BASE_DATA_ADDR        0x2c0000
#define DEXEC_PG15_BASE_DATA_ADDR_PA     0x1002c0000

SECTION .DEXEC_PG15 DATA_VA=DEXEC_PG15_BASE_DATA_ADDR
attr_data {
        Name = .DEXEC_PG15,
        VA=DEXEC_PG15_BASE_DATA_ADDR, 
	RA=DEXEC_PG15_BASE_DATA_ADDR_PA,
	PA=DEXEC_PG15_BASE_DATA_ADDR_PA,
        part_0_d_ctx_nonzero_ps0_tsb,
        TTE_G=0, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=1,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=0, TTE_CV=0, TTE_E=1, TTE_P=1, TTE_W=0
        }


.data

.global  dexec_pg15_data

dexec_pg15_data: 
		.word   0x11223344
                .word   0x11223355
                .word   0x11223366
                .word   0x11223377
.end

!!-------------------------------
!!	P=1 E=1 ASI=SEC_NF
!!-------------------------------
#define DEXEC_PG16_BASE_DATA_ADDR        0x2c8000
#define DEXEC_PG16_BASE_DATA_ADDR_PA     0x1002c8000

SECTION .DEXEC_PG16 DATA_VA=DEXEC_PG16_BASE_DATA_ADDR
attr_data {
        Name = .DEXEC_PG16,
        VA=DEXEC_PG16_BASE_DATA_ADDR, 
	PA=DEXEC_PG16_BASE_DATA_ADDR_PA,
	RA=DEXEC_PG16_BASE_DATA_ADDR_PA,
        part_0_d_ctx_nonzero_ps0_tsb,
        TTE_G=0, TTE_Context=SCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=1,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=0, TTE_CV=0, TTE_E=1, TTE_P=1, TTE_W=0
        }


.data

.global  dexec_pg16_data

dexec_pg16_data: .word   0x11223344
                .word   0x11223355
                .word   0x11223366
                .word   0x11223377
.end

