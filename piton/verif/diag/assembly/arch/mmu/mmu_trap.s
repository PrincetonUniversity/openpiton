// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: mmu_trap.s
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

#define SAS_FIXED 	1	/* wait for SAS to fix the SFSR register */
#define bug1616_fixed	1	/* wait for SAS to fix */

.text
.global main

main:
	ta	T_CHANGE_PRIV
	nop

#if bug1616_fixed
test_mtrap0:
	mov	0x0,	%l0	

mmutrp_0_0:
	wr	%l0,	0x5e,	%asi
	mov	0x30,	%o1	
       	call	chk_ldasi_mtrap
	nop

mmutrp_0_1:
        mov     0x38,   %o1
        setx    0x8000000000100005,     %l0,    %l2
	wr	%l0,	0x5d,	%asi
	
	call	chk_stasi_mtrap
	nop
#endif
	/* 
 	 *****************************************************
	 * write to the tag-read reg and read from 
	 * the Data-in reg will cause data_access_exception
	 * trap 
 	 *****************************************************
	 */
        /* enable the trap */
        set     0x30,   %o0     /* Data access exception trap */
        ta      T_HTRAP_EN
        nop

	mov	0x0,	%l0
        stxa    %l0,	[%g0] 0x5e	/* DTLB Tag read reg : write cause trap */

        cmp     %o0,    0
	call	check_dsfsr
	nop
tc0_0:	
        /* enable the trap */
        set     0x30,   %o0     /* Data access exception trap */
        ta      T_HTRAP_EN
        nop

	mov	0x0,	%l0
        stxa    %l0,	[%g0] 0x56	/* ITLB Tag read reg : write cause trap */

        cmp     %o0,    0
        /* read the DMMU SFSR */
        call    check_dsfsr
        nop

tc0_1:	
        /* enable the trap */
        set     0x30,   %o0     /* Data access exception trap */
        ta      T_HTRAP_EN
        nop

	mov	0x0,	%l0
        stxa    %l0,	[%g0] 0x59	/* DTSB 8k ptr reg */

        cmp     %o0,    0
        call    check_dsfsr
        nop
	
tc0_2:	
        /* enable the trap */
        set     0x30,   %o0     /* Data access exception trap */
        ta      T_HTRAP_EN
        nop

	mov	0x0,	%l0
        stxa    %l0,	[%g0] 0x51	/* ITSB 8k ptr reg */

        cmp     %o0,    0
        call    check_dsfsr
        nop
		
tc0_3:	
        /* enable the trap */
        set     0x30,   %o0     /* Data access exception trap */
        ta      T_HTRAP_EN
        nop

	mov	0x0,	%l0
        stxa    %l0,	[%g0] 0x5a	/* DTSB 64k ptr reg */

        cmp     %o0,    0
        call    check_dsfsr
        nop
		
tc0_4:	
        /* enable the trap */
        set     0x30,   %o0     /* Data access exception trap */
        ta      T_HTRAP_EN
        nop

	mov	0x0,	%l0
        stxa    %l0,	[%g0] 0x52	/* ITSB 64k ptr reg */

        cmp     %o0,    0
        call    check_dsfsr
        nop
		
tc0_5:	
        /* enable the trap */
        set     0x30,   %o0     /* Data access exception trap */
        ta      T_HTRAP_EN
        nop

	mov	0x0,	%l0
        stxa    %l0,	[%g0] 0x5b	/* DTSB direct pointer reg */

        cmp     %o0,    0
	        call    check_dsfsr
        nop
	
tc0_6:	
        /* enable the trap */
        set     0x30,   %o0     /* Data access exception trap */
        ta      T_HTRAP_EN
        nop

	mov	0x0,	%l0
        stxa    %l0,	[%g0] 0x5b	/* DTSB direct pointer reg */

        cmp     %o0,    0
        call    check_dsfsr
        nop
		
tc0_7:	
        /* enable the trap */
        set     0x30,   %o0     /* Data access exception trap */
        ta      T_HTRAP_EN
        nop

	mov	0x20,	%l0
        stxa    %l0,	[%l0] 0x58	/* D-SFAR reg */

        cmp     %o0,    0
        call    check_dsfsr
        nop
		
tc0_8:	
        /* enable the trap */
        set     0x30,   %o0     /* Data access exception trap */
        ta      T_HTRAP_EN
        nop

	mov	0x0,	%l0
        stxa    %l0,	[%g0] 0x58	/* DTSB tag target reg */

        cmp     %o0,    0
        call    check_dsfsr
        nop
	
tc0_9:	
        /* enable the trap */
        set     0x30,   %o0     /* Data access exception trap */
        ta      T_HTRAP_EN
        nop

	mov	0x0,	%l0
        stxa    %l0,	[%g0] 0x50	/* ITSB tag target reg */

        cmp     %o0,    0
        call    check_dsfsr
        nop

tc0_10:
        /* enable the trap */
        set     0x30,   %o0     /* Data access exception trap */
        ta      T_HTRAP_EN
        nop

	mov	0x0,	%l0
        ldxa	[%g0] 0x54,	%l2	/* I-TLB data in reg */

        cmp     %o0,    0
        call    check_dsfsr
        nop
			
tc0_11:
        /* enable the trap */
        set     0x30,   %o0     /* Data access exception trap */
        ta      T_HTRAP_EN
        nop

	mov	0x0,	%l0
        ldxa	[%g0] 0x5c,	%l2	/* D-TLB data in reg */

        cmp     %o0,    0
        call    check_dsfsr
        nop
			
tc0_12:
        /* enable the trap */
        set     0x30,   %o0     /* Data access exception trap */
        ta      T_HTRAP_EN
        nop

	mov	0x0,	%l0
        ldxa	[%g0] 0x5f,	%l2	/* DMMU demap reg */

        cmp     %o0,    0
        call    check_dsfsr
        nop

			
tc0_13:
        /* enable the trap */
        set     0x30,   %o0     /* Data access exception trap */
        ta      T_HTRAP_EN
        nop

	mov	0x0,	%l0
        ldxa	[%g0] 0x57,	%l2	/* IMMU demap reg */

        cmp     %o0,    0
        call    check_dsfsr
        nop
			
test_case1:
	/* 
	 *----------------------------
	 *	Invalid ASIs 
	 *----------------------------
	 */
        /* enable the trap */
        set     0x30,   %o0     /* Data access exception trap */
        ta      T_HTRAP_EN
        nop
     
	mov	0x0,	%l0
	setx	data_pg0, %l0, %l1	
	ldxa	[%l1] 0xf0, %l2	

	cmp	%o0,	0
        call    check_dsfsr
        nop

        /* enable the trap */
        set     0x30,   %o0     /* Data access exception trap */
        ta      T_HTRAP_EN
        nop
     
	mov	0x0,	%l0
	setx	data_pg0, %l0, %l1	
	lduwa	[%l1] 0x5, %l2	

	cmp	%o0,	0
        call    check_dsfsr
        nop


	/*
	 *-------------------------------------------
	 * store or atomic to ASI_PRIMARY_NO_FAULT
	 *-------------------------------------------
 	 */
newtc_0:
        /* enable the trap */
        set     0x30,   %o0     /* Data access exception trap */
        ta      T_HTRAP_EN
        nop
     
	mov	0x0,	%l0
	setx	0x380000, %l0, %l1	/* store or atomic to ASI_PRIMARY_NO_FAULT */	
	stuwa	%l2,	[%l1] 0x82

        /* read the DMMU SFSR */
        call    check_dsfsr
        nop

newtc_1:
        /* enable the trap */
        set     0x30,   %o0     /* Data access exception trap */
        ta      T_HTRAP_EN
        nop
     
	mov	0x0,	%l0
	setx	0x380000, %l0, %l1	/* store or atomic to ASI_PRIMARY_NO_FAULT */	
	swapa	[%l1] 0x82, %l2	

        /* read the DMMU SFSR */
        call    check_dsfsr
        nop

newtc_2:
        /* enable the trap */
        set     0x30,   %o0     /* Data access exception trap */
        ta      T_HTRAP_EN
        nop
     
	mov	0x0,	%l0
	/* store or atomic to ASI_SECONDARY_NO_FAULT */	

	!!	setx	dexec_pg1_data, %l0, %l1	
	setx	0x188000, %l0, %l1	
	swapa	[%l1] 0x83, %l2	

        /* read the DMMU SFSR */
        call    check_dsfsr
        nop

test_case2:
	/*
	 *---------------------------------------
	 *	restricted ASI in non-priv mode
	 *---------------------------------------
	 */
	ta	T_CHANGE_NONPRIV
	nop

        /* enable the trap */
        set     0x37,   %o0     /* Privileged action exception */
        ta      T_HTRAP_EN
        nop

	set	0x0,	%l0
	setx	data_pg0, %l0, %l1
	lduwa	[%l1] 0x10, 	%l2 	/* ASI_AS_IF_USER_PRIMARY */

	cmp	%o0,	0
        /* read the DMMU SFSR */
        call    check_dsfsr
        nop

newtc2_0:
        /* enable the trap */
        set     0x37,   %o0     /* Privileged action exception */
        ta      T_HTRAP_EN
        nop

	set	0x0,	%l0
	setx	data_pg0, %l0, %l1
	stuwa	%l2,	[%l1] 0x11 	/* ASI_AS_IF_USER_SECONDARY */

	cmp	%o0,	0
        /* read the DMMU SFSR */
        call    check_dsfsr
        nop

newtc2_1:
        /* enable the trap */
        set     0x37,   %o0     /* Privileged action exception */

        ta      T_HTRAP_EN
        nop

	set	0x0,	%l0
	setx	data_pg0, %l0, %l1
	swapa	[%l1] 0x19, 	%l2 	/* ASI_AS_IF_USER_SECONDARY_LITTLE */

	cmp	%o0,	0
        /* read the DMMU SFSR */
        call    check_dsfsr
        nop

newtc2_2:
        /* enable the trap */
        set     0x37,   %o0     /* Privileged action exception */

        ta      T_HTRAP_EN
        nop

	set	0x0,	%l0
	setx	data_pg0, %l0, %l1
	casa	[%l1] 0x18, %l2, %l0 	/* ASI_AS_IF_USER_PRIMARY_LITTLE */

	cmp	%o0,	0
        /* read the DMMU SFSR */
        call    check_dsfsr
        nop

test_case3:
	/*
	 * Due to the changes to Hypervisor mode,
	 * we need to add the tte entries into the DTLB here.
 	 */	
	ta	T_CHANGE_HPRIV
	nop

#define TAG_ACCESS1     0x0000000000380044
#define DATA_IN1        0x9000000100380002	/* NF=1,sz=8k,w=1 */
         setx   TAG_ACCESS1,  %l0, %g4
         setx   DATA_IN1, %l0, %g5
        mov  0x30, %g3
        stxa  %g4, [ %g3 ] 0x58
        stxa  %g5, [ %g0 ] 0x5c

#define TAG_ACCESS2     0x0000000000188055	/* Sndary ctx */
#define DATA_IN2        0x9000000100188002	/* NF=1,sz=8k,w=1 */
         setx   TAG_ACCESS2,  %l0, %g4
         setx   DATA_IN2, %l0, %g5
        mov  0x30, %g3
        stxa  %g4, [ %g3 ] 0x58
        stxa  %g5, [ %g0 ] 0x5c

#define TAG_ACCESS3     0x0000000000190044
#define DATA_IN3        0x8000000000190002	/* NF=0,sz=8k,w=1 */
         setx   TAG_ACCESS3,  %l0, %g4
         setx   DATA_IN3, %l0, %g5
        mov  0x30, %g3
        stxa  %g4, [ %g3 ] 0x58
        stxa  %g5, [ %g0 ] 0x5c

	ta	T_CHANGE_NONHPRIV
	nop

	T_CHANGE_PRIV
	nop

	/*
	 *------------------------------------------------
	 * 	atomic access issued to a memory 
	 * 	uncacheable in a physical cache ( CP=0 )
	 *
	 * 	Since our design can still send atomic req
	 *	to the external SDRAM when L2 is disabled,
	 *	we will not generate any daccess_excp trap
 	 *	for the atomic access.
	 *------------------------------------------------
 	 */
        /* enable the trap */
        set     0x30,   %o0     /* Data access exception trap */
        ta      T_HTRAP_EN
        nop

	set	0x0,	%l0
	setx	0x190000, %l0, %l1
	swap	[%l1],  %l2 	
	cmp	%o0,	0

	/* 128-bit atomic load to a CP=0 physical memory address */
        /* enable the trap */
        set     0x30,   %o0     /* Data access exception trap */
        ta      T_HTRAP_EN
        nop

	set	0x0,	%l0
	setx	0x190000, %l0, %l1
	ldda	[%l1] 0x14,  %l2 	
	cmp	%o0,	0

test_case4:
	ta	T_CHANGE_NONPRIV
	nop
	/*
	 *----------------------------------------------------
	 *	data access with ASI other than 
	 *	ASI_PRIM/SECN_NFLT to a page marked with NF=1
	 *	bit.
	 *----------------------------------------------------
 	 */
	/* LOAD */
        /* enable the trap */
        set     0x30,   %o0     /* Data access exception trap */
        ta      T_HTRAP_EN
        nop

	set	0x0,	%l0
	setx	0x380000, %l0, %l1
	lduwa	[%l1] 0x80, 	%l2

	cmp	%o0,	0
	ta	T_CHANGE_PRIV
	nop
        /* read the DMMU SFSR */
        call    check_dsfsr
        nop

	/* STORE */
        /* enable the trap */
        set     0x30,   %o0     /* Data access exception trap */
        ta      T_HTRAP_EN
        nop

	set	0x0,	%l0
	setx	0x380000, %l0, %l1
	lduwa	[%l1] 0x80, 	%l2

	cmp	%o0,	0
        /* read the DMMU SFSR */
        call    check_dsfsr
        nop

test_case5:
        /*
         ************************************************
         * VA out of range FAULT :
         *
         *      Based on Ultra-SPARC-II spec :
         *              ( user manual : pg 238 )
         *
	 *	bit 48 ~ 63 should be all 0's or all 1's
	 *	since we are using 48 bit VA
         ************************************************
         */
#define VA_OUTOF_RANGE_START 	0x0000800000000000
#define VA_OUTOF_RANGE_MIDDLE1	0x0000900000000000
#define VA_OUTOF_RANGE_MIDDLE2	0xffff700000000000
#define VA_OUTOF_RANGE_END  	0xffff7fffffffffff
	/* STORE */
        /* enable the trap */
        set     0x30,   %o0     /* Data access exception trap */
        ta      T_HTRAP_EN
        nop

	/*
	 * Virtual Address out of range & PSTATE.AM is not set(64bit Virtual address) . 
	 */
	set	0x0,	%l0
	setx	VA_OUTOF_RANGE_START, %l0, %l1
	st	%l0,	[%l1]

	cmp	%o0,	0
        /* read the DMMU SFSR */
        call    check_dsfsr
        nop

        /* enable the trap */
        set     0x30,   %o0     /* Data access exception trap */
        ta      T_HTRAP_EN
        nop

	set	0x0,	%l0
	setx	VA_OUTOF_RANGE_MIDDLE1, %l0, %l1
	st	%l0,	[%l1]

	cmp	%o0,	0
        /* read the DMMU SFSR */
        call    check_dsfsr
        nop

        /* enable the trap */
        set     0x30,   %o0     /* Data access exception trap */
        ta      T_HTRAP_EN
        nop

	set	0x0,	%l0
	setx	VA_OUTOF_RANGE_MIDDLE2, %l0, %l1
	st	%l0,	[%l1]

	cmp	%o0,	0
        /* read the DMMU SFSR */
        call    check_dsfsr
        nop

        /* enable the trap */
        set     0x30,   %o0     /* Data access exception trap */
        ta      T_HTRAP_EN
        nop

	set	0x0,	%l0
	setx	VA_OUTOF_RANGE_END, %l0, %l1
	stb	%l0,	[%l1]

	cmp	%o0,	0
        /* read the DMMU SFSR */
        call    check_dsfsr
        nop

	/* LOAD */
        /* enable the trap */
        set     0x30,   %o0     /* Data access exception trap */
        ta      T_HTRAP_EN
        nop

	/*
	 * Virtual Address out of range & PSTATE.AM is not set(64bit Virtual address) . 
	 */
	set	0x0,	%l0
	setx	VA_OUTOF_RANGE_START, %l0, %l1
	ld	[%l1],	%l0

	cmp	%o0,	0
        /* read the DMMU SFSR */
        call    check_dsfsr
        nop

        /* enable the trap */
        set     0x30,   %o0     /* Data access exception trap */
        ta      T_HTRAP_EN
        nop

	set	0x0,	%l0
	setx	VA_OUTOF_RANGE_MIDDLE1, %l0, %l1
	ld	[%l1],	%l0

	cmp	%o0,	0
        /* read the DMMU SFSR */
        call    check_dsfsr
        nop

        /* enable the trap */
        set     0x30,   %o0     /* Data access exception trap */
        ta      T_HTRAP_EN
        nop

	set	0x0,	%l0
	setx	VA_OUTOF_RANGE_MIDDLE2, %l0, %l1
	ld	[%l1],	%l0

	cmp	%o0,	0
        /* read the DMMU SFSR */
        call    check_dsfsr
        nop

        /* enable the trap */
        set     0x30,   %o0     /* Data access exception trap */
        ta      T_HTRAP_EN
        nop

	set	0x0,	%l0
	setx	VA_OUTOF_RANGE_END, %l0, %l1
	ldub	[%l1],	%l0

	cmp	%o0,	0
        /* read the DMMU SFSR */
        call    check_dsfsr
        nop

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
        nop

/*
 ************************************
 * check the write to MMU internal 
 * registers : not using stxa
 ************************************
 */	
chk_stasi_mtrap:
	mov	%o7,	%i7
        /* enable the trap */
        set     0x30,   %o0     /* Data access exception trap */
        ta      T_HTRAP_EN
        nop

        stba    %l2,    [%o1] %asi

        cmp     %o0,    0
	call	check_dsfsr
	nop

        set     0x30,   %o0     /* Data access exception trap */
        ta      T_HTRAP_EN
        nop

        stha    %l2,    [%o1] %asi

        cmp     %o0,    0
	call	check_dsfsr
	nop

        set     0x30,   %o0     /* Data access exception trap */
        ta      T_HTRAP_EN
        nop

        stwa    %l2,    [%o1] %asi

        cmp     %o0,    0

	call	check_dsfsr
	nop

	ret
	nop

/*
 ************************************
 * check the read to MMU internal 
 * registers : not using ldxa
 ************************************
 */
chk_ldasi_mtrap:
	mov	%o7,	%i7	/* keep the return address */

        /* enable the trap */
        set     0x30,   %o0     /* Data access exception trap */
        ta      T_HTRAP_EN
        nop

        lduwa   [%o1] %asi,     %l1

        cmp     %o0,    0
	call	check_dsfsr
	nop

        /* enable the trap */
        set     0x30,   %o0     /* Data access exception trap */
        ta      T_HTRAP_EN
        nop

        lduha   [%o0] %asi,     %l1

        cmp     %o0,    0
	call	check_dsfsr
	nop

        set     0x30,   %o0     /* Data access exception trap */
        ta      T_HTRAP_EN
        nop

        lduba   [%o0] %asi,     %l1

        cmp     %o0,    0
	call	check_dsfsr
	nop

	ret
	nop

check_dsfsr:
	ta	T_CHANGE_HPRIV	
	nop
        /* read the DMMU SFSR */
        set     0x0,    %l0
        set     0x18,   %l1
        ldxa    [%l1] 0x58,     %l4
        nop
	ta	T_CHANGE_NONHPRIV	
	nop

	retl
	nop

.data

data_pg0:
	.word 0xffffaaaa
	.word 0xbcedffee
	.word 0xcafe5577
	.word 0xffffaaaa
        .word 0x318fc3bf
        .word 0x2d5197be
        .word 0xc72139ad
        .word 0xc6235f5b
        .word 0x43a87af3
        .word 0xa674c9b7
        .word 0xe885e8b5
        .word 0x29af0e0c
        .word 0x22442d0d
        .word 0xed850d30
        .word 0xb91eaee2
        .word 0x48e3979e
        .word 0x4cc0780c
        .word 0xf923f319
        .word 0x726318c7
        .word 0xafc1bb41
        .word 0xd968cee1
        .word 0x8ad600da
        .word 0xee0a30d8
        .word 0xe04bb65c

.end

/*
 ***************************************************
 * Pages defined to test out the MMU access traps
 ***************************************************
 */
!!----------------------------------------
!!      CONTEXT=PRIM P=0 E=0 W=0 NFO=1 
!!----------------------------------------
#define DEXEC_PG0_BASE_DATA_ADDR        0x380000
#define DEXEC_PG0_BASE_DATA_ADDR_PA     0x100380000

SECTION .DEXEC_PG0	DATA_VA = DEXEC_PG0_BASE_DATA_ADDR
attr_data {
        Name = .DEXEC_PG0,
        VA=DEXEC_PG0_BASE_DATA_ADDR, 
	PA=DEXEC_PG0_BASE_DATA_ADDR_PA,
	RA=DEXEC_PG0_BASE_DATA_ADDR_PA,
        part_0_d_ctx_nonzero_ps0_tsb,
        TTE_G=0, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=1,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=0, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=1
        }


.data

.global  dexec_pg0_data

dexec_pg0_data: .word   0x11223344
                .word   0x11223355
                .word   0x11223366
                .word   0x11223377
.end

!!----------------------------------------
!!      CONTEXT=SCND P=0 E=0 W=0 NFO=1 
!!----------------------------------------
#define DEXEC_PG1_BASE_DATA_ADDR        0x188000
#define DEXEC_PG1_BASE_DATA_ADDR_PA     0x100188000

SECTION .DEXEC_PG1	DATA_VA = DEXEC_PG1_BASE_DATA_ADDR
attr_data {
        Name = .DEXEC_PG1,
        VA=DEXEC_PG1_BASE_DATA_ADDR, 
	PA=DEXEC_PG1_BASE_DATA_ADDR_PA,
	RA=DEXEC_PG1_BASE_DATA_ADDR_PA,
        part_0_d_ctx_nonzero_ps0_tsb,
        TTE_G=0, TTE_Context=SCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=1,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=0, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=1
        }


.data

.global  dexec_pg1_data

dexec_pg1_data: .word   0x11223344
                .word   0x11223355
                .word   0x11223366
                .word   0x11223377
.end

!!----------------------------------------
!!      CONTEXT=PCONT CP=0 
!!----------------------------------------
#define DEXEC_PG2_BASE_DATA_ADDR        0x190000
#define DEXEC_PG2_BASE_DATA_ADDR_PA     0x190000

SECTION .DEXEC_PG2	DATA_VA = DEXEC_PG2_BASE_DATA_ADDR
attr_data {
        Name = .DEXEC_PG2,
        VA=DEXEC_PG2_BASE_DATA_ADDR, 
	PA=DEXEC_PG2_BASE_DATA_ADDR_PA,
	RA=DEXEC_PG2_BASE_DATA_ADDR_PA,
        part_0_d_ctx_nonzero_ps0_tsb,
        TTE_G=0, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=0, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=1
        }


.data

.global  dexec_pg2_data

dexec_pg2_data: .word   0x11223344
                .word   0x11223355
                .word   0x11223366
                .word   0x11223377
.end

