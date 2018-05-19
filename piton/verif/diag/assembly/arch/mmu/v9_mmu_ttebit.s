// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: v9_mmu_ttebit.s
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
!!	This file has the micro-code to test out the MMU TTE bits of Ultra-SparcII
!!	TTE entry spec.
!!
!!			TTE G=0 CONTEXT=NUCLEUS, not done, simics has some issue
!!
!!-------------------------------------------------------------------------------

/*
 * Use our own MMU miss handler
 */
#define H_HT0_fast_instr_access_MMU_miss         T0_fast_immu_miss
#define H_HT0_fast_data_access_MMU_miss          T0_fast_dmmu_miss

#define PG256MB_SUPPORTED 	1

#include "enable_traps.h"
#include "boot.s"

.text
.global main
.global T0_fast_immu_miss
.global T0_fast_dmmu_miss

main:
/*
 *************************************************
 *	Global bit 
 *************************************************
 */
!!-------------------------------------------
!!	IMMU TTE entry global bit set
!!-------------------------------------------
	mov	0xff, %o0
tc_0:
	/* 	
 	 * global bit set = 1, 
	 * context = PCONTEXT
	 *	context is ignored.
	 */
	mov 	0, %o2
	mov 	0, %o7
	setx	tc_0_back, %o2, %o7
	call	itte_g1_start
	nop
.global tc_0_back
tc_0_back:
	set	0x2,	%l3
	sub	%o2,	%l3,	%l4
	brnz,a	%l4,	diag_fail
	set	0xffff0001,	%l1
	
!!-------------------------------------------
!!	DMMU TTE entry global bit set
!!-------------------------------------------
	mov 	0xff, %o0
tc_1:
        set     0x0,    %l4
	setx	itte_g1_data,	%l4,	%l5
	ld	[%l4+%l5],	%l2
	nop

	set	0x11223344,	%l3
	sub	%l3,	%l2,	%l4
	brnz,a	%l4,	diag_fail
	set	0xffff0001,	%l1
	
!!-------------------------------------------
!!	IMMU TTE entry global bit not set
!!	  context = good context ( PRIVMARY )
!!-------------------------------------------
	mov	0xff, %o0
tc_2:
	/* 	
 	 * global bit set = 0
	 * context = PCONTEXT
	 *	context is good.
	 */
	setx	tc_2_back, %o2, %o7
	
	call	itte_g2_start
	nop

.global tc_2_back
tc_2_back:

	set	0x2,	%l3
	sub	%o2,	%l3,	%l4
	brnz,a	%l4,	diag_fail
	set	0xffff0001,	%l1
	
!!-------------------------------------------
!!	DMMU TTE entry global bit not set
!!	  context = SCONTEXT, good
!!-------------------------------------------
	mov 	0xff, %o0
tc_3:
        set     0x0,    %l4
	setx	itte_g2_data,	%l4,	%l5
	lduwa	[%l5+%l4] 0x81,	%l2
	nop

	set	0x11223344,	%l3
	sub	%l3,	%l2,	%l4
	brnz,a	%l4,	diag_fail
	set	0xffff0001,	%l1
	
!!-------------------------------------------
!!	IMMU TTE entry global bit not set
!!	  context = good context (NUCLEUS)
!!-------------------------------------------
	mov	0xff, %o0
tc_4:
	/* 	
 	 * global bit set = 0
	 * context = NUCLEUS 
	 *	context is good.
	 */
	ta	T_CHANGE_PRIV
	nop
	
	setx	tc_4_back, %o2, %o7
	call	itte_g3_start
	nop

.global tc_4_back
tc_4_back:
	set	0x2,	%l3
	sub	%o2,	%l3,	%l4
	brnz,a	%l4,	diag_fail
	set	0xffff0001,	%l1

	ta	T_CHANGE_NONPRIV
	nop
!!-------------------------------------------
!!	DMMU TTE entry global bit not set
!!	  context = good context (PCONTEXT)
!!-------------------------------------------
	mov 	0xff, %o0
tc_5:
        set     0x0,    %l4
	setx	itte_g3_data,	%l4,	%l5
	ld	[%l4+%l5],	%l2
	nop

	set	0x11223344,	%l3
	sub	%l3,	%l2,	%l4
	brnz,a	%l4,	diag_fail
	set	0xffff0001,	%l1
	
!!-------------------------------------------
!!	IMMU TTE entry global bit not set
!!	  context = bad context 
!!-------------------------------------------
	mov	0xff, %o0
tc_6:
	/* 	
 	 * global bit set = 0
	 * context = 0x22
	 *	context is bad.
	 */
	setx	tc_6_back,	%o2, %o7
	mov	0x1,	%o2	
	mov	0x0,	%o4	/* offset into shared data area */	
	call	itte_g4_start	/* routine is aborted ,
				 * thus, o2 remains to be 1 	
				 */
	nop
.global tc_6_back
tc_6_back:
	set	0x1,	%l3
	sub	%o2,	%l3,	%l4
	brnz,a	%l4,	diag_fail
	set	0xffff0001,	%l1
	
!!-------------------------------------------
!!	DMMU TTE entry global bit not set
!!	  context = bad context
!!-------------------------------------------
	mov 	0xff, %o0
tc_7:
        set     0x0,    %l4
	set	0x0,	%l2
	setx	itte_g4_data,	%l4,	%l5
	ld	[%l4+%l5],	%l2	/* ld will abort */
	nop

	set	0x11223344,	%l3
	sub	%l3,	%l2,	%l4
	brz,a	%l4,	diag_fail	/* l4 should not be zero */
	set	0xffff0001,	%l1

/* 
 **********************************
 * TTE Valid bit testing 
 **********************************
 */	
!!-------------------------------------------
!!	IMMU TTE entry valid bit not set
!!-------------------------------------------
	mov	0xff, %o0
tc_8:
	/* 	
 	 * valid bit set = 0
	 */
	setx	tc_8_back, %o2, %o7
	set	0x1,	%o2	
	mov	0x4,	%o4	/* offset into shared data area */	
	call	itte_nv1_start	/* routine is aborted ,
				 * thus, o2 remains to be 1 	
				 */
	nop
.global tc_8_back
tc_8_back:
	set	0x1,	%l3
	sub	%o2,	%l3,	%l4
	brnz,a	%l4,	diag_fail
	set	0xffff0055,	%l1
	
!!-------------------------------------------
!!	DMMU TTE entry valid bit not set
!!-------------------------------------------
	mov 	0xff, %o0
tc_9:
        set     0x0,    %l4
	set	0x0,	%l2
	setx	dtte_nv1_data,	%l4,	%l5
	ld	[%l4+%l5],	%l2	/* ld will abort */
	nop

	set	0x11223344,	%l3
	sub	%l3,	%l2,	%l4
	brz,a	%l4,	diag_fail	/* l4 should not be zero */
	set	0xffff0001,	%l1
	
/* 
 **********************************
 * TTE Size bits testing 
 **********************************
 */
	/*
	 * 64kb page size
	 */	
!!-------------------------------------------
!!	IMMU TTE size bits = 1 : 64kb
!!-------------------------------------------
	mov	0xff, %o0
tc_a:
	/* 	
 	 * valid bit set = 0
	 */
	setx	tc_a_back, %o2, %o7
	set	0x0,	%o2
	mov	0x8,	%o4	/* offset into shared data area */	
	call	itte_64kb_start	
	nop
.global tc_a_back
tc_a_back:
	set	0x2,	%l3
	sub	%o2,	%l3,	%l4
	brnz,a	%l4,	diag_fail
	set	0xffff0055,	%l1
	
!!-------------------------------------------
!!	DMMU TTE size bits = 1 : 64kb
!!-------------------------------------------
	mov 	0xff, %o0
tc_b:
        set     0x0,    %l4
	set	0x0,	%l2
	setx	dtte_64kb_data,	%l4,	%l5
	ld	[%l4+%l5],	%l2	
	nop

	set	0x11223344,	%l3
	sub	%l3,	%l2,	%l4
	brnz,a	%l4,	diag_fail	
	set	0xffff0001,	%l1

/*
 ************************
 * NFO bit set 
 ************************
 */
!!------------------------------------------------
!!	IMMU TTE NFO bit set : should not be set
!!------------------------------------------------
	mov	0xff, %o0
tc_10:
	/* 	
 	 * NFO bit set = 0
	 */
	setx	tc_10_back, %o2, %o7
	set	0x0,	%o2
	mov	0x14,	%o4	/* offset into shared data area */	
	call	itte_nfo1_start		/* this is dropped */
	nop

.global tc_10_back
tc_10_back:
	brnz,a	%o2,	diag_fail	/* o2 should be zero */
	set	0xffff0066,	%l1

	ta	T_CHANGE_PRIV
	nop
	/* reset the TL reg */
	set	0x0,	%l0
	wrpr	%l0,	0x0,	%tl
	nop
	ta	T_CHANGE_NONPRIV
	nop
	
!!-------------------------------------------
!!	DMMU TTE NFO bit set
!!-------------------------------------------
	mov 	0xff, %o0
tc_11:
	/* 
	 * Only ASI_PRIMARY_NO_FAULT(_LITTLE), 
	 * 	ASI_SECONDARY_NO_FAULT(_LITTLE) 
	 * can work with NFO bit set .
	 *
	 */
        set     0x0,    %l4
	set	0x0,	%l2
	setx	dtte_nfo1_data,	%l4,	%l5
	ld	[%l5],	%l2	
	nop

!!-------------------------------------------
!!	DMMU TTE NFO bit set
!!-------------------------------------------
	mov 	0xff, %o0
tc_12:
        set     0x0,    %l4
	set	0x0,	%l2
	setx	dtte_nfo2_data,	%l4,	%l5
	lduwa	[%l5] 0x82,	%l2	/* primary_nofault */
	nop

	set	0x11223344,	%l3
	sub	%l3,	%l2,	%l4
	brnz,a	%l4,	diag_fail	
	set	0xffff0066,	%l1

        set     0x0,    %l4
	set	0x0,	%l2
	setx	dtte_nfo3_data,	%l4,	%l5
	lduwa	[%l5] 0x83,	%l2	/* secondary_nofault */
	nop

	set	0x11223344,	%l3
	sub	%l3,	%l2,	%l4
	brnz,a	%l4,	diag_fail	
	set	0xffff0001,	%l1

        set     0x0,    %l4
	set	0x0,	%l2
	setx	dtte_nfo4_data,	%l4,	%l5
	lduwa	[%l5] 0x8A,	%l2	/* primary_nofault_little */
	nop

	set	0x44332211,	%l3	/* little endiance */
	sub	%l3,	%l2,	%l4
	brnz,a	%l4,	diag_fail	
	set	0xffff0001,	%l1

        set     0x0,    %l4
	set	0x0,	%l2
	setx	dtte_nfo5_data,	%l4,	%l5
	lduwa	[%l5] 0x8B,	%l2	/* secondary_nofault_little */
	nop

	set	0x44332211,	%l3	/* little endiance */
	sub	%l3,	%l2,	%l4
	brnz,a	%l4,	diag_fail	
	set	0xffff0001,	%l1

/*
 ********************************************	
 *	CP, CV bits 
 ********************************************	
 */

!!-------------------------------------------
!!	IMMU CP,CV = 00
!!-------------------------------------------
	mov	0xff, %o0
tc_13:
	setx	tc_13_back, %o2, %o7
	set	0x0,	%o2
	call	itte_cpcv1_start	
	nop
.global tc_13_back
tc_13_back:
	set	0x2,	%l3
	sub	%o2,	%l3,	%l4
	brnz,a	%l4,	diag_fail
	set	0xffff0055,	%l1
	
!!-------------------------------------------
!!	DMMU CP,CV = 00 
!!-------------------------------------------
	mov 	0xff, %o0
tc_14:
        set     0x0,    %l4
	set	0x0,	%l2
	setx	dtte_cpcv1_data, %l4,	%l5
	ld	[%l4+%l5],	%l2	
	nop

	set	0x11223344,	%l3
	sub	%l3,	%l2,	%l4
	brnz,a	%l4,	diag_fail	
	set	0xffff0001,	%l1

!!-------------------------------------------
!!	IMMU CP,CV = 10
!!-------------------------------------------
	mov	0xff, %o0
tc_15:
	setx	tc_15_back, %o2, %o7
	set	0x0,	%o2
	call	itte_cpcv2_start	
	nop

.global tc_15_back
tc_15_back:
	set	0x2,	%l3
	sub	%o2,	%l3,	%l4
	brnz,a	%l4,	diag_fail
	set	0xffff0055,	%l1
	
!!-------------------------------------------
!!	DMMU CP,CV = 10 
!!-------------------------------------------
	mov 	0xff, %o0
tc_16:
        set     0x0,    %l4
	set	0x0,	%l2
	setx	dtte_cpcv2_data, %l4,	%l5
	ld	[%l4+%l5],	%l2	
	nop

	set	0x11223344,	%l3
	sub	%l3,	%l2,	%l4
	brnz,a	%l4,	diag_fail	
	set	0xffff0001,	%l1

!!-------------------------------------------
!!	IMMU CP,CV = 11
!!-------------------------------------------
	mov	0xff, %o0
tc_17:
	setx	tc_15_back, %o2, %o7
	set	0x0,	%o2
	call	itte_cpcv3_start	
	nop
.global tc_17_back
tc_17_back:
	set	0x2,	%l3
	sub	%o2,	%l3,	%l4
	brnz,a	%l4,	diag_fail
	set	0xffff0055,	%l1
	
!!-------------------------------------------
!!	DMMU CP,CV = 11 
!!-------------------------------------------
	mov 	0xff, %o0
tc_18:
        set     0x0,    %l4
	set	0x0,	%l2
	setx	dtte_cpcv3_data, %l4,	%l5
	ld	[%l4+%l5],	%l2	
	nop

	set	0x11223344,	%l3
	sub	%l3,	%l2,	%l4
	brnz,a	%l4,	diag_fail	
	set	0xffff0001,	%l1

#if PG256MB_SUPPORTED
	/*
	 * 4MB page size
	 */	
!!-------------------------------------------
!!	IMMU TTE size bits = 3 : 4M
!!-------------------------------------------
	mov	0xff, %o0
tc_e:
	setx	tc_e_back, %o2, %o7
	set	0x0,	%o2
	call	itte_4mb_start	
	nop

.global tc_e_back
tc_e_back:
	set	0x2,	%l3
	sub	%o2,	%l3,	%l4
	!!brnz,a	%l4,	diag_fail
	set	0xffff0055,	%l1
	
!!-------------------------------------------
!!	DMMU TTE size bits = 3 : 4M
!!-------------------------------------------
	mov 	0xff, %o0
tc_f:
        set     0x0,    %l4
	set	0x0,	%l2
	setx	dtte_4mb_data,	%l4,	%l5
	ld	[%l4+%l5],	%l2	
	nop

	set	0x11223344,	%l3
	sub	%l3,	%l2,	%l4
	!!brnz,a	%l4,	diag_fail	
	set	0xffff0001,	%l1
	
	/*
	 * 256Mb page size
	 */	
!!-------------------------------------------
!!	IMMU TTE size bits = 2 : 256Mb
!!-------------------------------------------
	mov	0xff, %o0
tc_c:
	/* 	
 	 * valid bit set = 0
	 */
	setx	tc_c_back, %o2, %o7
	set	0x0,	%o2
	mov	0xc,	%o4	/* offset into shared data area */	
	setx	itte_256mb_start, %g1, %g2
	jmpl	%g2, %g1
	nop

.global tc_c_back
tc_c_back:
	set	0x2,	%l3
	sub	%o2,	%l3,	%l4
	!!brnz,a	%l4,	diag_fail
	set	0xffff0055,	%l1
	
!!-------------------------------------------
!!	DMMU TTE size bits = 2 : 256mb
!!-------------------------------------------
	mov 	0xff, %o0
tc_d:
        set     0x0,    %l4
	set	0x0,	%l2
	setx	dtte_256mb_data,	%l4,	%l5
	ld	[%l4+%l5],	%l2	
	nop

	set	0x11223344,	%l3
	sub	%l3,	%l2,	%l4
	!!brnz,a	%l4,	diag_fail	
	set	0xffff0001,	%l1
#endif

/*
 ********************************
 *      Diag PASSED !           *
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

!!-----------------------------------------------------
!!      8kb page size for custom trap handler
!!-----------------------------------------------------

SECTION .HTRAPS
.text
.align 0x100
.global T0_fast_immu_miss
/*
 * my handler for the fast_instr_mmu_miss
 */
T0_fast_immu_miss:
	brz,a	%o0,	 normal_imiss
	nop

        ldxa [%g0] 0x51, %g1    ! read the 8k TSB ptr
        ldda [%g1] 0x24, %g4
        nop

        /* check the valid bit */
        srlx    %g5,    0x3f,   %l0
        brz     %l0,    immu_return     /* invalid 8k ptr, check 64k ptr */
	nop
	
	ba	chk_immunfo
	nop
	
chk_immunfo:
        /* check the NFO bit, if set, ignore this call */
        srlx    %g5,    62,     %l0
        and     %l0,    0x1,    %l1
        brnz    %l1,    immu_return

        /* check the global bit */
        set     0x1,    %l0
        and     %l0,    %g5,    %l1
        brnz,a  %l1,    write_itte
	nop

chk_icontext:
        /*
         * For immu MISS, should be either
         * primary context or nucleus context
         */
        set     0x1fff, %l0
        and     %l0,    %g4,    %l1
        brz     %l1,    write_itte
        nop

        set     PCONTEXT,       %l2
        sub     %l2,    %l1,    %l3
        brz     %l3,    write_itte
        nop

immu_return:
        /*
         * reset the tpc
         */
	add	%o7,	0x4,	%o6
	wrpr	%o7,	0x0,	%tpc
	wrpr	%o6,	0x0,	%tnpc

	done	/*	
                 * This context is not valid
                 * So, we need go back to the next instruction after
                 * the call, not the targeted instr_addr.
                 *
                 * Otherwise, pc = call_target_instr + 4 , which
                 * is invalid.
                 */
        nop

write_itte:
        mov  0x30, %l0

        ! add partition base to data-in
        setx    partition_base_list, %g1, %g2   ! for partition base
        mov     0x80, %g1               ! offset (VA) for patrition id
        ldxa    [%g1] 0x58, %g3         ! partition id
        sllx    %g3, 3, %g3             ! offset - partition list
        ldx     [%g2 + %g3], %g1
        add     %g5, %g1, %g5

        stxa  %g4, [ %l0 ] 0x50 /* write to Tag access reg */
        stxa  %g5, [ %g0 ] 0x54 /* write to Data-in Reg */
        retry
        nop

normal_imiss:
#include "immu_miss_handler.s"

SECTION .HTRAPS
.text
.align 0x100
.global T0_fast_dmmu_miss
/*
 * my handler for the fast_data_mmu_miss
 */
T0_fast_dmmu_miss:
	brz,a	%o0,	normal_dmiss
	nop

        ldxa [%g0] 0x59, %g1    ! 8k ptr
        !ldxa [%g0] 0x5b, %g4  /* D-TSB Direct Poiner Registers */
        ldda [%g1] 0x24, %g4    
        /* check the valid bit */
        srlx    %g5,    0x3f,   %l0
        brz     %l0,    dmmu_return     /* invalid 8k ptr, check 64k ptr */
	nop

	ba	chk_dmmuglobl
	nop

	
chk_dmmuglobl:
        /* check the global bit */
        set     0x1,    %l0
        and     %g5,    %l0,    %l1
        brnz,a  %l1,    write_dtte

chk_dcontext:
        /*
         * For immu MISS, should be either
         * primary context or nucleus context
         */
        set     0x1fff, %l0
        and     %l0,    %g4,    %l1
        brz     %l1,    write_dtte
        set     PCONTEXT,       %l2
        sub     %l2,    %l1,    %l3
        brz     %l3,    write_dtte
        set     SCONTEXT,       %l2
        sub     %l2,    %l1,    %l3
        brz     %l3,    write_dtte 
        nop

dmmu_return:
        done    /* this context is not valid */
        nop

write_dtte:
        mov  0x30, %l0

        ! add partition base to data-in
        setx    partition_base_list, %g1, %g2   ! for partition base
        mov     0x80, %g1               ! offset (VA) for patrition id
        ldxa    [%g1] 0x58, %g3         ! partition id
        sllx    %g3, 3, %g3             ! offset - partition list
        ldx     [%g2 + %g3], %g1
        add     %g5, %g1, %g5

        stxa  %g4, [ %l0 ] 0x58
        stxa  %g5, [ %g0 ] 0x5c
        retry
        nop

normal_dmiss:
#include "dmmu_miss_handler.s"

SECTION .SHARED_DATA	DATA_VA=0x240000
attr_data {
        Name = .SHARED_DATA,
        VA=0x240000, 
	PA=0x240000,
	RA=0x240000,
        part_0_d_ctx_nonzero_ps0_tsb,
        part_0_d_ctx_zero_ps0_tsb,
        TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0, 
        TTE_L=0, TTE_CP=0, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=1
        }

.data	

.global  shared_return_pc

shared_return_pc:	
		.word	0x20000124	/* tc_6 */
		.word	0x20000188	/* tc_8 */
		.word	0x200001e0	/* tc_a */
		.word	0x20010250	/* for 256Mb page */
		.word	0x20000244	/* tc_10 */
				/* if 256Mb page added, need to fix return PC */
		.word	0x20000250	/* if 256Mb page added, need to fix return PC */

/*
 ***************************************************
 * Pages defined to test out the MMU TTE bitfields
 ***************************************************
 */
!!---------------------------------- 
!!	global bit set for I/D TTE
!!---------------------------------- 
#define	ITTE_G1_PG_BASE_TEXT_ADDR	0x250000		
#define	ITTE_G1_PG_BASE_DATA_ADDR	0x260000

SECTION .ITTE_G1_PAGE TEXT_VA = ITTE_G1_PG_BASE_TEXT_ADDR, DATA_VA = ITTE_G1_PG_BASE_DATA_ADDR
attr_text {
        Name = .ITTE_G1_PAGE,
        VA=ITTE_G1_PG_BASE_TEXT_ADDR, 
	PA=ra2pa(ITTE_G1_PG_BASE_TEXT_ADDR,0),
	RA=ITTE_G1_PG_BASE_TEXT_ADDR,
        part_0_i_ctx_nonzero_ps0_tsb,
        TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0, 
        TTE_L=0, TTE_CP=0, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=0
        }
        
attr_data {
        Name = .ITTE_G1_PAGE,
        VA=ITTE_G1_PG_BASE_DATA_ADDR, 
	PA=ra2pa(ITTE_G1_PG_BASE_DATA_ADDR,0),
	RA=ITTE_G1_PG_BASE_DATA_ADDR,
        part_0_d_ctx_nonzero_ps0_tsb,
        TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0, 
        TTE_L=0, TTE_CP=0, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=0
        }


.text

.global  itte_g1_start

itte_g1_start:
	save	
	set	0x2,	%i2
        return  %i7+8   /* good return */
        nop
	
.data	

.global  itte_g1_data

itte_g1_data:	.word	0x11223344
		.word	0x11223355
		.word	0x11223366
		.word	0x11223377
.end


!!-------------------------------------------- 
!!	global bit not set for I/D TTE
!!-------------------------------------------- 
#define	ITTE_G2_PG_BASE_TEXT_ADDR	0x270000		
#define	ITTE_G2_PG_BASE_DATA_ADDR	0x280000

SECTION .ITTE_G2_PAGE	TEXT_VA=ITTE_G2_PG_BASE_TEXT_ADDR, DATA_VA=ITTE_G2_PG_BASE_DATA_ADDR
attr_text {
        Name = .ITTE_G2_PAGE,
        VA=ITTE_G2_PG_BASE_TEXT_ADDR, 
	PA=ra2pa(ITTE_G2_PG_BASE_TEXT_ADDR,0),
	RA=ITTE_G2_PG_BASE_TEXT_ADDR,
        part_0_i_ctx_nonzero_ps0_tsb,
        TTE_G=0, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0, 
        TTE_L=0, TTE_CP=0, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=0
        }
        
attr_data {
        Name = .ITTE_G2_PAGE,
        VA=ITTE_G2_PG_BASE_DATA_ADDR, 
	PA=ra2pa(ITTE_G2_PG_BASE_DATA_ADDR,0),
	RA=ITTE_G2_PG_BASE_DATA_ADDR,
        part_0_d_ctx_nonzero_ps0_tsb,
        TTE_G=0, TTE_Context=SCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0, 
        TTE_L=0, TTE_CP=0, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=0
        }


.text

.global  itte_g2_start

itte_g2_start:
	save	
	set	0x2,	%i2
        return  %i7+8   /* good return */
        nop
	
.data	

.global  itte_g2_data

itte_g2_data:	.word	0x11223344
		.word	0x11223355
		.word	0x11223366
		.word	0x11223377
.end

!!-------------------------------------------- 
!!	global bit not set for I/D TTE
!!-------------------------------------------- 
#define	ITTE_G3_PG_BASE_TEXT_ADDR	0x290000		
#define	ITTE_G3_PG_BASE_DATA_ADDR	0x2a0000

SECTION .ITTE_G3_PAGE TEXT_VA=ITTE_G3_PG_BASE_TEXT_ADDR, DATA_VA=ITTE_G3_PG_BASE_DATA_ADDR
attr_text {
        Name = .ITTE_G3_PAGE,
        VA=ITTE_G3_PG_BASE_TEXT_ADDR, 
	PA=ra2pa(ITTE_G3_PG_BASE_TEXT_ADDR,0),
	RA=ITTE_G3_PG_BASE_TEXT_ADDR,
        part_0_i_ctx_zero_ps0_tsb,
        part_0_i_ctx_nonzero_ps0_tsb,
        TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0, 
        TTE_L=0, TTE_CP=0, TTE_CV=0, TTE_E=0, TTE_P=1, TTE_W=0
        }
        
attr_data {
        Name = .ITTE_G3_PAGE,
        VA=ITTE_G3_PG_BASE_DATA_ADDR, 
	PA=ra2pa(ITTE_G3_PG_BASE_DATA_ADDR,0),
	RA=ITTE_G3_PG_BASE_DATA_ADDR,
        part_0_d_ctx_nonzero_ps0_tsb,
        TTE_G=0, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0, 
        TTE_L=0, TTE_CP=0, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=0
        }


.text

.global  itte_g3_start

itte_g3_start:
	save	
	set	0x2,	%i2
        return  %i7+8   /* good return */
        nop
	
.data	

.global  itte_g3_data

itte_g3_data:	.word	0x11223344
		.word	0x11223355
		.word	0x11223366
		.word	0x11223377
.end

!!-------------------------------------------- 
!!	global bit not set for I/D TTE
!!-------------------------------------------- 
#define	ITTE_G4_PG_BASE_TEXT_ADDR	0x2b0000		
#define	ITTE_G4_PG_BASE_DATA_ADDR	0x2c0000

SECTION .ITTE_G4_PAGE TEXT_VA=ITTE_G4_PG_BASE_TEXT_ADDR, DATA_VA=ITTE_G4_PG_BASE_DATA_ADDR
attr_text {
        Name = .ITTE_G4_PAGE,
        VA=ITTE_G4_PG_BASE_TEXT_ADDR, 
	PA=ra2pa(ITTE_G4_PG_BASE_TEXT_ADDR,0),
	RA=ITTE_G4_PG_BASE_TEXT_ADDR,
        part_0_i_ctx_nonzero_ps0_tsb,
        TTE_G=0, TTE_Context=0x22, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0, 
        TTE_L=0, TTE_CP=0, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=0
        }
        
attr_data {
        Name = .ITTE_G4_PAGE,
        VA=ITTE_G4_PG_BASE_DATA_ADDR, 
	PA=ra2pa(ITTE_G4_PG_BASE_DATA_ADDR,0),
	RA=ITTE_G4_PG_BASE_DATA_ADDR,
        part_0_d_ctx_nonzero_ps0_tsb,
        TTE_G=0, TTE_Context=0x22, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0, 
        TTE_L=0, TTE_CP=0, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=0
        }


.text

.global  itte_g4_start

itte_g4_start:
	save	
	set	0x2,	%i2
        return  %i7+8   /* good return */
        nop
	
.data	

.global  itte_g4_data

itte_g4_data:	.word	0x11223344
		.word	0x11223355
		.word	0x11223366
		.word	0x11223377
.end

!!--------------------------------------------
!!	Valid bit not set for I/D TTE
!!--------------------------------------------
#define	ITTE_NV1_PG_BASE_TEXT_ADDR	0x2d0000		
#define	ITTE_NV1_PG_BASE_DATA_ADDR	0x2e0000

SECTION .ITTE_NV1_PAGE TEXT_VA=ITTE_NV1_PG_BASE_TEXT_ADDR, DATA_VA=ITTE_NV1_PG_BASE_DATA_ADDR
attr_text {
        Name = .ITTE_NV1_PAGE,
        VA=ITTE_NV1_PG_BASE_TEXT_ADDR, 
	PA=ra2pa(ITTE_NV1_PG_BASE_TEXT_ADDR,0),
	RA=ITTE_NV1_PG_BASE_TEXT_ADDR,
        part_0_i_ctx_zero_ps0_tsb,
        part_0_i_ctx_nonzero_ps0_tsb,
        TTE_G=1, TTE_Context=0, TTE_V=0, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0, 
        TTE_L=0, TTE_CP=0, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=0
        }

attr_text {
        Name = .ITTE_NV1_PAGE,
        VA=ITTE_NV1_PG_BASE_TEXT_ADDR, 
	PA=ra2pa(ITTE_NV1_PG_BASE_TEXT_ADDR,0),
	RA=ITTE_NV1_PG_BASE_TEXT_ADDR,
	tsbonly,
        part_0_i_ctx_zero_ps1_tsb,
        part_0_i_ctx_nonzero_ps1_tsb,
        TTE_G=1, TTE_Context=0, TTE_V=0, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0, 
        TTE_L=0, TTE_CP=0, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=0
        }
        
attr_data {
        Name = .ITTE_NV1_PAGE,
        VA=ITTE_NV1_PG_BASE_DATA_ADDR, 
	PA=ra2pa(ITTE_NV1_PG_BASE_DATA_ADDR,0),
	RA=ITTE_NV1_PG_BASE_DATA_ADDR,
        part_0_d_ctx_nonzero_ps0_tsb,
        TTE_G=0, TTE_Context=PCONTEXT, TTE_V=0, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0, 
        TTE_L=0, TTE_CP=0, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=0
        }

attr_data {
        Name = .ITTE_NV1_PAGE,
        VA=ITTE_NV1_PG_BASE_DATA_ADDR, 
	PA=ra2pa(ITTE_NV1_PG_BASE_DATA_ADDR,0),
	RA=ITTE_NV1_PG_BASE_DATA_ADDR,
        tsbonly,
        part_0_d_ctx_nonzero_ps1_tsb,
        TTE_G=0, TTE_Context=PCONTEXT, TTE_V=0, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0, 
        TTE_L=0, TTE_CP=0, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=0
        }

.text

.global  itte_nv1_start

itte_nv1_start:
	save	
	set	0x2,	%i2
        return  %i7+8   /* good return */
        nop
	
.data	

.global  dtte_nv1_data

dtte_nv1_data:	.word	0x11223344
		.word	0x11223355
		.word	0x11223366
		.word	0x11223377
.end


!!-----------------------------------------------------
!!	64kb page size for I/D TTE
!!-----------------------------------------------------
#define	ITTE_64KB_PG_BASE_TEXT_ADDR	0x300000
#define	ITTE_64KB_PG_BASE_DATA_ADDR	0x310000

SECTION .ITTE_64KB_PAGE TEXT_VA=ITTE_64KB_PG_BASE_TEXT_ADDR, DATA_VA=ITTE_64KB_PG_BASE_DATA_ADDR
attr_text {
        Name = .ITTE_64KB_PAGE,
        VA=ITTE_64KB_PG_BASE_TEXT_ADDR, 
	PA=ra2pa(ITTE_64KB_PG_BASE_TEXT_ADDR,0),
	RA=ITTE_64KB_PG_BASE_TEXT_ADDR,
        part_0_i_ctx_zero_ps0_tsb,
        part_0_i_ctx_nonzero_ps0_tsb,
        TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0x1, TTE_Size_Ptr=0x0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=0, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=0
        }
        
attr_data {
        Name = .ITTE_64KB_PAGE,
        VA=ITTE_64KB_PG_BASE_DATA_ADDR, 
	PA=ra2pa(ITTE_64KB_PG_BASE_DATA_ADDR,0),
	RA=ITTE_64KB_PG_BASE_DATA_ADDR,
        part_0_d_ctx_nonzero_ps0_tsb,
        TTE_G=0, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0x1, TTE_Size_Ptr=0x0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0, 
        TTE_L=0, TTE_CP=0, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=0
        }


.text

.global  itte_64kb_start

itte_64kb_start:
	save	
	set	0x2,	%i2
        return  %i7+8   /* good return */
        nop
	
.data	

.global  dtte_64kb_data

dtte_64kb_data:	.word	0x11223344
		.word	0x11223355
		.word	0x11223366
		.word	0x11223377
.end

#if PG256MB_SUPPORTED
!!-----------------------------------------------------
!!	256mb page size for I/D TTE
!!-----------------------------------------------------
#define	ITTE_256MB_PG_BASE_TEXT_ADDR	0x320000000
#define	ITTE_256MB_PG_BASE_DATA_ADDR	0x420000000

SECTION .ITTE_256MB_PAGE TEXT_VA=ITTE_256MB_PG_BASE_TEXT_ADDR, DATA_VA=ITTE_256MB_PG_BASE_DATA_ADDR
attr_text {
        Name = .ITTE_256MB_PAGE,
        VA=ITTE_256MB_PG_BASE_TEXT_ADDR, 
	PA=ra2pa(ITTE_256MB_PG_BASE_TEXT_ADDR,0),
	RA=ITTE_256MB_PG_BASE_TEXT_ADDR,
        part_0_i_ctx_zero_ps0_tsb,
        part_0_i_ctx_nonzero_ps0_tsb,
        TTE_G=1, TTE_Context=0, TTE_V=1, TTE_Size=5, tte_size_ptr=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=0, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=0
        }
        
attr_data {
        Name = .ITTE_256MB_PAGE,
        VA=ITTE_256MB_PG_BASE_DATA_ADDR, 
	PA=ra2pa(ITTE_256MB_PG_BASE_DATA_ADDR,0),
	RA=ITTE_256MB_PG_BASE_DATA_ADDR,
        part_0_d_ctx_nonzero_ps0_tsb,
        TTE_G=0, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=5, tte_size_ptr=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0, 
        TTE_L=0, TTE_CP=0, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=0
        }


.text

.global  itte_256mb_start

itte_256mb_start:
	save	
	set	0x2,	%i2
        return  %i7+8   /* good return */
        nop
	
.data	

.global  dtte_256mb_data

dtte_256mb_data:	.word	0x11223344
		.word	0x11223355
		.word	0x11223366
		.word	0x11223377
.end

#endif

!!-----------------------------------------------------
!!	4MB page size for I/D TTE
!!-----------------------------------------------------
#define	ITTE_4MB_PG_BASE_TEXT_ADDR	0x7000000
#define	ITTE_4MB_PG_BASE_DATA_ADDR	0x7800000

SECTION .ITTE_4MB_PAGE	TEXT_VA=ITTE_4MB_PG_BASE_TEXT_ADDR, DATA_VA=ITTE_4MB_PG_BASE_DATA_ADDR
attr_text {
        Name = .ITTE_4MB_PAGE,
        VA=ITTE_4MB_PG_BASE_TEXT_ADDR, 
	PA=ra2pa(ITTE_4MB_PG_BASE_TEXT_ADDR,0),
	RA=ITTE_4MB_PG_BASE_TEXT_ADDR,
        part_0_i_ctx_nonzero_ps0_tsb,
        TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=3, tte_size_ptr=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=0, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=0
        }
        
attr_data {
        Name = .ITTE_4MB_PAGE,
        VA=ITTE_4MB_PG_BASE_DATA_ADDR, 
	PA=ra2pa(ITTE_4MB_PG_BASE_DATA_ADDR,0),
	RA=ITTE_4MB_PG_BASE_DATA_ADDR,
        part_0_d_ctx_nonzero_ps0_tsb,
        TTE_G=0, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=3, tte_size_ptr=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0, 
        TTE_L=0, TTE_CP=0, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=0
        }


.text

.global  itte_4mb_start

itte_4mb_start:
	save	
	set	0x2,	%i2
        return  %i7+8   /* good return */
        nop
	
.data	

.global  dtte_4mb_data

dtte_4mb_data:	.word	0x11223344
		.word	0x11223355
		.word	0x11223366
		.word	0x11223377
.end

!!-------------------------------------------- 
!!	NFO bit set for I/D TTE
!!-------------------------------------------- 
#define	ITTE_NFO1_PG_BASE_TEXT_ADDR	0x570000		
#define	ITTE_NFO1_PG_BASE_DATA_ADDR	0x560000

SECTION .ITTE_NFO1_PAGE	TEXT_VA=ITTE_NFO1_PG_BASE_TEXT_ADDR, DATA_VA=ITTE_NFO1_PG_BASE_DATA_ADDR
attr_text {
        Name = .ITTE_NFO1_PAGE,
        VA=ITTE_NFO1_PG_BASE_TEXT_ADDR, 
	PA=ra2pa(ITTE_NFO1_PG_BASE_TEXT_ADDR,0),
	RA=ITTE_NFO1_PG_BASE_TEXT_ADDR,
        part_0_i_ctx_nonzero_ps0_tsb,
        TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=1,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0, 
        TTE_L=0, TTE_CP=0, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=0
        }
        
attr_data {
        Name = .ITTE_NFO1_PAGE,
        VA=ITTE_NFO1_PG_BASE_DATA_ADDR, 
	PA=ra2pa(ITTE_NFO1_PG_BASE_DATA_ADDR,0),
	RA=ITTE_NFO1_PG_BASE_DATA_ADDR,
        part_0_d_ctx_nonzero_ps0_tsb,
        TTE_G=0, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=1,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0, 
        TTE_L=0, TTE_CP=0, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=0
        }


.text

.global  itte_nfo1_start

itte_nfo1_start:
	save	
	set	0x2,	%i2
        return  %i7+8   /* good return */
        nop
	
.data	

.global  dtte_nfo1_data

dtte_nfo1_data:	.word	0x11223344
		.word	0x11223355
		.word	0x11223366
		.word	0x11223377
.end

!!---------------------------------------------------- 
!!	NFO bit set for I/D TTE : 
!!		primary address space: big endiance
!!---------------------------------------------------- 
#define	ITTE_NFO2_PG_BASE_DATA_ADDR	0x470000

SECTION .ITTE_NFO2_PAGE	DATA_VA=ITTE_NFO2_PG_BASE_DATA_ADDR

attr_data {
        Name = .ITTE_NFO2_PAGE,
        VA=ITTE_NFO2_PG_BASE_DATA_ADDR, 
	PA=ra2pa(ITTE_NFO2_PG_BASE_DATA_ADDR,0),
	RA=ITTE_NFO2_PG_BASE_DATA_ADDR,
        part_0_d_ctx_nonzero_ps0_tsb,
        TTE_G=0, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=1,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0, 
        TTE_L=0, TTE_CP=0, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=0
        }


.data	

.global  dtte_nfo2_data

dtte_nfo2_data:	.word	0x11223344
		.word	0x11223355
		.word	0x11223366
		.word	0x11223377
.end

!!----------------------------------------------------- 
!!	NFO bit set for I/D TTE : 
!!		secondary address space, big endiance
!!----------------------------------------------------- 
#define	DTTE_NFO3_PG_BASE_DATA_ADDR	0x480000

SECTION .DTTE_NFO3_PAGE	DATA_VA=DTTE_NFO3_PG_BASE_DATA_ADDR

attr_data {
        Name = .DTTE_NFO3_PAGE,
        VA=DTTE_NFO3_PG_BASE_DATA_ADDR, 
	PA=ra2pa(DTTE_NFO3_PG_BASE_DATA_ADDR,0),
	RA=DTTE_NFO3_PG_BASE_DATA_ADDR,
        part_0_d_ctx_nonzero_ps0_tsb,
        TTE_G=0, TTE_Context=SCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=1,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0, 
        TTE_L=0, TTE_CP=0, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=0
        }


.data	

.global  dtte_nfo3_data

dtte_nfo3_data:	.word	0x11223344
		.word	0x11223355
		.word	0x11223366
		.word	0x11223377
.end

!!----------------------------------------------------- 
!!	NFO bit set for I/D TTE : 
!!		primary address space, little endiance
!!----------------------------------------------------- 
#define	DTTE_NFO4_PG_BASE_DATA_ADDR	0x484000

SECTION .DTTE_NFO4_PAGE	DATA_VA=DTTE_NFO4_PG_BASE_DATA_ADDR

attr_data {
        Name = .DTTE_NFO4_PAGE,
        VA=DTTE_NFO4_PG_BASE_DATA_ADDR, 
	PA=ra2pa(DTTE_NFO4_PG_BASE_DATA_ADDR,0),
	RA=DTTE_NFO4_PG_BASE_DATA_ADDR,
        part_0_d_ctx_nonzero_ps0_tsb,
        TTE_G=0, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=1,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0, 
        TTE_L=0, TTE_CP=0, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=0
        }


.data	

.global  dtte_nfo4_data

dtte_nfo4_data:	.word	0x11223344
		.word	0x11223355
		.word	0x11223366
		.word	0x11223377
.end

!!----------------------------------------------------- 
!!	NFO bit set for I/D TTE : 
!!		primary address space, little endiance
!!----------------------------------------------------- 
#define	ITTE_NFO5_PG_BASE_DATA_ADDR	0x474000

SECTION .ITTE_NFO5_PAGE	DATA_VA=ITTE_NFO5_PG_BASE_DATA_ADDR

attr_data {
        Name = .ITTE_NFO5_PAGE,
        VA=ITTE_NFO5_PG_BASE_DATA_ADDR, 
	PA=ra2pa(ITTE_NFO5_PG_BASE_DATA_ADDR,0),
	RA=ITTE_NFO5_PG_BASE_DATA_ADDR,
        part_0_d_ctx_nonzero_ps0_tsb,
        TTE_G=0, TTE_Context=SCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=1,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0, 
        TTE_L=0, TTE_CP=0, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=0
        }


.data	

.global  dtte_nfo5_data

dtte_nfo5_data:	.word	0x11223344
		.word	0x11223355
		.word	0x11223366
		.word	0x11223377
.end

!!----------------------------------------------------- 
!!	CP,CV = 01 for I/D TTE 
!!----------------------------------------------------- 
#define	ITTE_CPCV1_PG_BASE_TEXT_ADDR	0x476000
#define	ITTE_CPCV1_PG_BASE_DATA_ADDR	0x478000

SECTION .ITTE_CPCV1_PAGE TEXT_VA=ITTE_CPCV1_PG_BASE_TEXT_ADDR, DATA_VA=ITTE_CPCV1_PG_BASE_DATA_ADDR
attr_text {
        Name = .ITTE_CPCV1_PAGE,
        VA=ITTE_CPCV1_PG_BASE_TEXT_ADDR, 
	PA=ra2pa(ITTE_CPCV1_PG_BASE_TEXT_ADDR,0),
	RA=ITTE_CPCV1_PG_BASE_TEXT_ADDR,
        part_0_i_ctx_nonzero_ps0_tsb,
        TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0, 
        TTE_L=0, TTE_CP=0, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=0
        }
        
attr_data {
        Name = .ITTE_CPCV1_PAGE,
        VA=ITTE_CPCV1_PG_BASE_DATA_ADDR, 
	PA=ra2pa(ITTE_CPCV1_PG_BASE_DATA_ADDR,0),
	RA=ITTE_CPCV1_PG_BASE_DATA_ADDR,
        part_0_d_ctx_nonzero_ps0_tsb,
        TTE_G=0, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0, 
        TTE_L=0, TTE_CP=0, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=0
        }


.text

.global  itte_cpcv1_start

itte_cpcv1_start:
	save	
	set	0x2,	%i2
        return  %i7+8   /* good return */
        nop
	
.data	

.global  dtte_cpcv1_data

dtte_cpcv1_data:	.word	0x11223344
		.word	0x11223355
		.word	0x11223366
		.word	0x11223377
.end

!!----------------------------------------------------- 
!!	CP,CV = 10 for I/D TTE 
!!----------------------------------------------------- 
#define	ITTE_CPCV2_PG_BASE_TEXT_ADDR	0x47c000
#define	ITTE_CPCV2_PG_BASE_DATA_ADDR	0x47e000

SECTION .ITTE_CPCV2_PAGE TEXT_VA=ITTE_CPCV2_PG_BASE_TEXT_ADDR, DATA_VA=ITTE_CPCV2_PG_BASE_DATA_ADDR
attr_text {
        Name = .ITTE_CPCV2_PAGE,
        VA=ITTE_CPCV2_PG_BASE_TEXT_ADDR, 
	PA=ra2pa(ITTE_CPCV2_PG_BASE_TEXT_ADDR,0),
	RA=ITTE_CPCV2_PG_BASE_TEXT_ADDR,
        part_0_i_ctx_nonzero_ps0_tsb,
        TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0, 
        TTE_L=0, TTE_CP=1, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=0
        }
        
attr_data {
        Name = .ITTE_CPCV2_PAGE,
        VA=ITTE_CPCV2_PG_BASE_DATA_ADDR, 
	PA=ra2pa(ITTE_CPCV2_PG_BASE_DATA_ADDR,0),
	RA=ITTE_CPCV2_PG_BASE_DATA_ADDR,
        part_0_d_ctx_nonzero_ps0_tsb,
        TTE_G=0, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0, 
        TTE_L=0, TTE_CP=1, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=0
        }


.text

.global  itte_cpcv2_start

itte_cpcv2_start:
	save	
	set	0x2,	%i2
        return  %i7+8   /* good return */
        nop
	
.data	

.global  dtte_cpcv2_data

dtte_cpcv2_data:	.word	0x11223344
		.word	0x11223355
		.word	0x11223366
		.word	0x11223377
.end

!!----------------------------------------------------- 
!!	CP,CV = 11 for I/D TTE 
!!----------------------------------------------------- 
#define	ITTE_CPCV3_PG_BASE_TEXT_ADDR	0x680000
#define	ITTE_CPCV3_PG_BASE_DATA_ADDR	0x682000

SECTION .ITTE_CPCV3_PAGE TEXT_VA=ITTE_CPCV3_PG_BASE_TEXT_ADDR, DATA_VA=ITTE_CPCV3_PG_BASE_DATA_ADDR  
attr_text {
        Name = .ITTE_CPCV3_PAGE,
        VA=ITTE_CPCV3_PG_BASE_TEXT_ADDR, 
	PA=ra2pa(ITTE_CPCV3_PG_BASE_TEXT_ADDR,0),
	RA=ITTE_CPCV3_PG_BASE_TEXT_ADDR,
        part_0_i_ctx_nonzero_ps0_tsb,
        TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0, 
        TTE_L=0, TTE_CP=1, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=0
        }
        
attr_data {
        Name = .ITTE_CPCV3_PAGE,
        VA=ITTE_CPCV3_PG_BASE_DATA_ADDR, 
	PA=ra2pa(ITTE_CPCV3_PG_BASE_DATA_ADDR,0),
	RA=ITTE_CPCV3_PG_BASE_DATA_ADDR,
        part_0_d_ctx_nonzero_ps0_tsb,
        TTE_G=0, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0, 
        TTE_L=0, TTE_CP=1, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=0
        }


.text

.global  itte_cpcv3_start

itte_cpcv3_start:
	save	
	set	0x2,	%i2
        return  %i7+8   /* good return */
        nop
	
.data	

.global  dtte_cpcv3_data

dtte_cpcv3_data:	.word	0x11223344
		.word	0x11223355
		.word	0x11223366
		.word	0x11223377
.end

