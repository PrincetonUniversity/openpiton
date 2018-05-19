// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: mmu_red.s
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

#define  MAIN_PAGE_NUCLEUS_ALSO
#define  MAIN_PAGE_HV_ALSO	
#define  My_RED_Mode_Other_Reset	mov 0, %g1;setx RedTrapCheck, %g1, %g2; jmpl %g2, %g3; nop


#include "enable_traps.h"
#include "boot.s"

SECTION .HTRAPS
.text
.align 0x100
.global RedTrapCheck
.global RedTrapEn
.global TrapCheck

RedTrapCheck:
	set	0x124,	%g4
	rdpr	%tt,	%g7
	sub	%g4,	%g7,	%g2
	brz	%g2,	RedTrapEn	/* if the trap is ta HTRAP_EN */
	nop

	mov	0, 	%o0	/* reset the trap check reg */
	done
	nop
	
RedTrapEn:
	set	0x8c000, %g1		/* set the trap_en in htrap_table_data */
	mov     0x800, %g2
	add	%o0, %o0, %o0
	sth	%g2, [%g1+%o0]
	done
	nop

SECTION .MAIN
.text
.align 0x1fff+1
.global main
main:
	ta	T_CHANGE_HPRIV
	nop

        rdhpr   %hpstate, %g3
        wrhpr   %g0, 0x824, %hpstate	/* keep the core in RED mode , hypervisor en */
        nop

        /* 
	 * Try to access user-defined pages. 
	 */
	
        setx RED_MMU_test_handler, %g1, %g2
        jmp %g2
        nop
        nop

/*
 ====================================================	
 	dummy RED mode MMU test handler
 ====================================================	
 */
#define	RED_MMU_TEST_ADDR	   0x150000
#define RED_MMU_TEST_ADDR_PA	   0x150000
#define RED_MMU_TEST_DATA_ADDR     0x180000 
#define RED_MMU_TEST_DATA_ADDR_PA  0x180000 

SECTION .RED_MMU_TEST	TEXT_VA = RED_MMU_TEST_ADDR, DATA_VA=RED_MMU_TEST_DATA_ADDR
attr_text {
        Name = .RED_MMU_TEST,
	hypervisor
        }

attr_data {
        Name = .RED_MMU_TEST,
	hypervisor
        }

attr_data {
        Name = .RED_MMU_TEST
        VA=RED_MMU_TEST_DATA_ADDR, 
	RA=RED_MMU_TEST_DATA_ADDR,
	PA=ra2pa(RED_MMU_TEST_DATA_ADDR, 0),
        part_0_d_ctx_zero_ps0_tsb,
        TTE_G=1, TTE_Context=0, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=0, TTE_CV=0, TTE_E=0, TTE_P=1, TTE_W=1
        }



.text

.global RED_MMU_test_handler

RED_MMU_test_handler:
	mov	0x55,	%g1	

Immu_misses:
	mov	0xff,	%g2
	ba	imiss_label0
	nop
.align	8192

imiss_label0:
	mov	0x55,	%g3
	/* 
	 * Enable I-cache & set IMMU-en bit, but IMMU will not
	 * be active since the CPU is not out of RED mode yet.
	 */
	/* 
	 *	LSU control reg : 0x45
	 *	bit 	   3	   2	1	0 	
	 *		DMMU-en	IMMU-en Dcache  Icache-en
	 */
	mov	0x5,	%g1
	stxa	%g1,	[%g0] 0x45

	ba	imiss_label1
	nop
.align  8192

imiss_label1:
	/* test IMMU disabled, under NUCLUES context */
	wrpr  1, %tl
	mov	0xaa,	%g3
	ba	imiss_label2
	nop
.align	8192	

imiss_label2:
	mov	0x0,	%g1	/* turn I-cache off */
	stxa	%g1,	[%g0] 0x45
	mov	0x0,	%g1
	ba	dmiss_test
	nop
	nop
.align	8192	

dmiss_test:
	wrpr	0,	%tl
	mov	0,	%l7

dcache_config:
	brz	%l7,	dcache_on0
	nop

	mov	1,	%l0
	sub	%l7,	%l0, 	%l1
	brz	%l1,	dcache_off
	nop

	ba	diag_pass
	nop

dcache_on0:
	/* 
	 * Even we turn on D-cache , the data will not 
	 * be stored/loaded into D-Cache.
	 */
	mov	0x2,	%g1
	stxa	%g1,	[%g0] 0x45

	ba	dmmu_ldst
	nop

dcache_off:
	mov	0x0,	%g1
	stxa	%g1,	[%g0] 0x45

dmmu_ldst:
	set	0xcaca,	%l3
	mov	0,	%l0
	setx	data_0,	%l0,	%l1
	ldx	[%l1],	%l2
	setx	dmmu_pg0_data,	%l0,	%l1
	ldx	[%l1],	%l2
	stx	%l3,	[%l1]	/* this will not hit in D-cache since it's bypassed */
	setx	dmmu_pg1_data,	%l0,	%l1
	ldx	[%l1],	%l2
	stx	%l3,	[%l1]	/* this will not hit in D-cache since it's bypassed */
	setx	dmmu_pg2_data,	%l0,	%l1
	ldx	[%l1],	%l2
	stx	%l3,	[%l1]	/* this will not hit in D-cache since it's bypassed */
	setx	dmmu_pg3_data,	%l0,	%l1
	ldx	[%l1],	%l2
	stx	%l3,	[%l1]	/* this will not hit in D-cache since it's bypassed */

	/* 
	 *	!!!!  -------	TBD : ---------------	!!!!!
	 * 	    Chin will add the hook in verif env to support the monitoring of
	 *	    how many Data Ld/STs have happened on the CXBAR interface.   
	 *		LD/ST counter check 
	 *
	 *	Sam , 11/29/2001
	 */

	/* access to user defined pages */
	mov	0x13,	%l3	
	mov	0x14,	%l4	
	mov	0x15,	%l5	
	mov	0x16,	%l6	

	mov	0,	%l0
	setx	0x260000, %l0, %l1
	ldx	[%l1], 	%l2	
	ldx	[%l1+0x10], 	%l2	
	stb	%l3,	[%l1+0x07]	
	ldub	[%l1+0x20], 	%l2	
	stb	%l4,	[%l1+0x17]
	lduh	[%l1+0x30], 	%l2	
	stx	%l6,	[%l1+0x10]
	ld	[%l1+0x40], 	%l2	
	stx	%l5,	[%l1+0x20]
	sth	%l3,	[%l1+0x18]	
	ldx	[%l1+0x50], 	%l2	
	st	%l5,	[%l1+0x30]

	/* test some of the traps that should happen */
!!------------------------------------------------
!!	use NO_FAULT ASI when DMMU disabled
!!------------------------------------------------
dmmu_trap1:
	wr  %g0, 0, %ccr
	wr  %g0, 0x80, %asi
	/* enable the trap */
	mov	0x30,	%o0
	ta	T_HTRAP_EN
	nop

	set	0,	%l0
	setx	0x250000, %l0, %l1
	lduwa	[%l1] 0x82,	%l2 

!!------------------------------------------------
!!	use NORMAL ASI (U_PRIM) when DMMU disabled
!!	  since MMU will use PHY_BYPASS_EC, a
!!	  dexec trap will be generated.
!!------------------------------------------------
	/* enable the trap */
	mov	0x30,	%o0
	ta	T_HTRAP_EN
	nop

	set	0,	%l0
	setx	0x260000, %l0, %l1
	lduwa	[%l1] 0x10,	%l2 

        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0003,     %l1

	set	0,	%l0
	setx	0x260000, %l0, %l1
	lduwa	[%l1] 0x14,	%l2 

	set	0,	%l0
	setx	0x260000, %l0, %l1
	lduwa	[%l1] 0x15,	%l2 

!!------------------------------------------------
!!	use NO_FAULT ASI when DMMU disabled
!!------------------------------------------------
dmmu_trap2:
	/* enable the trap */
	mov	0x30,	%o0
	ta	T_HTRAP_EN
	nop

	set	0,	%l0
	setx	0x258000, %l0, %l1
	lduwa	[%l1] 0x83,	%l2 

!!------------------------------------------------
!!	use NORMAL ASI (U_SECN) when DMMU disabled
!!	  since MMU will use PHY_BYPASS_EC, a
!!	  dexec trap will be generated.
!!------------------------------------------------
	/* enable the trap */
	mov	0x30,	%o0
	ta	T_HTRAP_EN
	nop

	set	0,	%l0
	setx	0x268000, %l0, %l1
	lduwa	[%l1] 0x11,	%l2 


!!------------------------------------------------
!!	normal ASIs will be treated as by-passed
!!------------------------------------------------
dmmu_test3:
	set	0,	%l0
	setx    0x260000, %l0, %l1
	lduwa	[%l1] 0x80, 	%l2
	nop

	set	0,	%l0
	setx    0x268000, %l0, %l1
	lduwa	[%l1] 0x81, 	%l2
	nop

	set	0xff55,	%l2
	set	0,	%l0
	setx    0x260000, %l0, %l1
	stuwa	%l2,	[%l1] 0x80
	nop

	set	0,	%l0
	setx    0x268000, %l0, %l1
	swapa	[%l1] 0x81, 	%l2
	nop

diag_pass:
	wrpr	0x6,	%pstate		/* get out of RED mode */
good_trap:	
	ta	T_GOOD_TRAP
	nop

diag_fail:
	wrpr	0x6,	%pstate		/* get out of RED mode */
bad_trap:	
	ta	T_BAD_TRAP
	nop


.data

data_0: 	.word 0x29eeca41
                .word 0x430e3679
                .word 0x14b28339
                .word 0xe31234c5
                .word 0xe7e00d1f
                .word 0x9c7a2f9a
                .word 0xd8b95739
                .word 0xb77962d6
                .word 0x29eeca41
                .word 0x430e3679
                .word 0x14b28339
                .word 0xe31234c5
                .word 0xe7e00d1f
                .word 0x9c7a2f9a
                .word 0xd8b95739
                .word 0xb77962d6
.align 8192	

.end

/*
 * DMMU by-pass mode testing page 0
 *
 * Even we set the E=0, when DMMU is disabled, 
 * the translation will force E=1 P=0, thus, we can generate the trap 
 */	
#define	DMMU_TEST_PG0_ADDR	0x250000
#define DMMU_TEST_PG0_ADDR_PA	0x250000

SECTION .DMMU_TEST_PG0	DATA_VA=DMMU_TEST_PG0_ADDR

attr_data {
        Name = .DMMU_TEST_PG0,
	hypervisor
	}

attr_data {
        Name = .DMMU_TEST_PG0,
        VA=DMMU_TEST_PG0_ADDR, 
	RA=DMMU_TEST_PG0_ADDR,
	PA=ra2pa(DMMU_TEST_PG0_ADDR,0),
        part_0_d_ctx_zero_ps0_tsb,
        TTE_G=1, TTE_Context=0, TTE_V=1, TTE_Size=0, TTE_NFO=1,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=0, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=0
        }


.data

.global dmmu_pg0_data

dmmu_pg0_data:
                .word 0xa154f3b4
                .word 0x943eb287
                .word 0x8a3b418d
                .word 0x10d62692
                .word 0x3cf6f942
                .word 0x90ac7694
                .word 0x78daddde
                .word 0xb7db9253
                .word 0xaf0acfbf
                .word 0x3804434e
                .word 0xf3340a19
                .word 0x5826071
                .word 0x4e566496
                .word 0xb295dd62
                .word 0x363bf02c
                .word 0x3d6d61ed
                .word 0x8de6ae58
                .word 0x91346023
                .word 0xbe950cd2
                .word 0x1638806
                .word 0x8ba9b0e4
                .word 0x97d0c8bc
                .word 0x7f4b35c7
                .word 0x87b7e299
                .word 0xaf0acfbf
                .word 0x3804434e
                .word 0xf3340a19
                .word 0x5826071
                .word 0x4e566496
                .word 0xb295dd62
                .word 0x363bf02c
                .word 0x3d6d61ed
                .word 0x8de6ae58
                .word 0x91346023
                .word 0xbe950cd2
                .word 0x1638806
                .word 0x8ba9b0e4
                .word 0x97d0c8bc
                .word 0x7f4b35c7
                .word 0x87b7e299
.end

/* 
 * Page 1 : 
 *	this will test the dexec trap for NFO ASI when DMMU disabled 
 */
#define	DMMU_TEST_PG1_ADDR	0x258000
#define DMMU_TEST_PG1_ADDR_PA	0x258000
SECTION .DMMU_TEST_PG1	DATA_VA=DMMU_TEST_PG1_ADDR	
attr_data {
        Name = .DMMU_TEST_PG1,
	hypervisor
	}
attr_data {
        Name = .DMMU_TEST_PG1,
        VA=DMMU_TEST_PG1_ADDR, 
	RA=DMMU_TEST_PG1_ADDR,
	PA=ra2pa(DMMU_TEST_PG1_ADDR,0),
        part_0_d_ctx_zero_ps0_tsb,
        TTE_G=1, TTE_Context=SCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=1,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=0, TTE_CV=0, TTE_E=0, TTE_P=1, TTE_W=0
        }


.data

.global dmmu_pg1_data

dmmu_pg1_data:
                .word 0xe31234c5
                .word 0xe7e00d1f
                .word 0x9c7a2f9a
                .word 0xd8b95739
                .word 0xb77962d6
                .word 0x29eeca41
                .word 0x430e3679
                .word 0x14b28339
                .word 0xb7db9253
                .word 0xaf0acfbf
                .word 0x3804434e
                .word 0xf3340a19
                .word 0x5826071
                .word 0x4e566496
                .word 0xb295dd62
                .word 0x363bf02c
                .word 0x3d6d61ed
                .word 0x8de6ae58
                .word 0x91346023
                .word 0xbe950cd2
                .word 0x1638806
                .word 0x8ba9b0e4
                .word 0x97d0c8bc
                .word 0x7f4b35c7
                .word 0x87b7e299
                .word 0xaf0acfbf
                .word 0x3804434e
                .word 0xf3340a19
                .word 0x5826071
                .word 0x4e566496
                .word 0xb295dd62
                .word 0x363bf02c
                .word 0x3d6d61ed
                .word 0x8de6ae58
                .word 0x91346023
                .word 0xbe950cd2
                .word 0x1638806
                .word 0x8ba9b0e4
                .word 0x97d0c8bc
                .word 0x7f4b35c7
.end

/* 
 * Page 2 : 
 *	this will test the by-pass ASI for DMMU disabled 
 */
#define	DMMU_TEST_PG2_ADDR	0x260000
#define DMMU_TEST_PG2_ADDR_PA	0x260000
SECTION .DMMU_TEST_PG2 	DATA_VA=DMMU_TEST_PG2_ADDR
attr_data {
        Name = .DMMU_TEST_PG2,
	hypervisor
	}
attr_data {
        Name = .DMMU_TEST_PG2,
        VA=DMMU_TEST_PG2_ADDR, 
	RA=DMMU_TEST_PG2_ADDR,
	PA=ra2pa(DMMU_TEST_PG2_ADDR,0),
        part_0_d_ctx_zero_ps0_tsb,
        TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=0, TTE_CV=0, TTE_E=0, TTE_P=1, TTE_W=0
        }


.data

.global dmmu_pg2_data

dmmu_pg2_data:
                .word 0xe31234c5
                .word 0xe7e00d1f
                .word 0x9c7a2f9a
                .word 0xd8b95739
                .word 0xb77962d6
                .word 0x29eeca41
                .word 0x430e3679
                .word 0x14b28339
                .word 0xb7db9253
                .word 0xaf0acfbf
                .word 0x3804434e
                .word 0xf3340a19
                .word 0x5826071
                .word 0x4e566496
                .word 0xb295dd62
                .word 0x363bf02c
                .word 0x3d6d61ed
                .word 0x8de6ae58
                .word 0x91346023
                .word 0xbe950cd2
                .word 0x1638806
                .word 0x8ba9b0e4
                .word 0x97d0c8bc
                .word 0x7f4b35c7
                .word 0x87b7e299
                .word 0xaf0acfbf
                .word 0x3804434e
                .word 0xf3340a19
                .word 0x5826071
                .word 0x4e566496
                .word 0xb295dd62
                .word 0x363bf02c
                .word 0x3d6d61ed
                .word 0x8de6ae58
                .word 0x91346023
                .word 0xbe950cd2
                .word 0x1638806
                .word 0x8ba9b0e4
                .word 0x97d0c8bc
                .word 0x7f4b35c7
.end

/* 
 * Page 3 : 
 *	this will test the by-pass ASI for DMMU disabled 
 */
#define	DMMU_TEST_PG3_ADDR	0x268000
#define DMMU_TEST_PG3_ADDR_PA	0x268000
SECTION .DMMU_TEST_PG3	DATA_VA=DMMU_TEST_PG3_ADDR
attr_data {
        Name = .DMMU_TEST_PG3,
	hypervisor
	}
attr_data {
        Name = .DMMU_TEST_PG3,
        VA=DMMU_TEST_PG3_ADDR, 
	RA=DMMU_TEST_PG3_ADDR,
	PA=ra2pa(DMMU_TEST_PG3_ADDR,0),
        part_0_d_ctx_zero_ps0_tsb,
        TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=0, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=0
        }


.data

.global dmmu_pg3_data

dmmu_pg3_data:
                .word 0xe31234c5
                .word 0xe7e00d1f
                .word 0x9c7a2f9a
                .word 0xd8b95739
                .word 0xb77962d6
                .word 0x29eeca41
                .word 0x430e3679
                .word 0x14b28339
                .word 0xb7db9253
                .word 0xaf0acfbf
                .word 0x3804434e
                .word 0xf3340a19
                .word 0x5826071
                .word 0x4e566496
                .word 0xb295dd62
                .word 0x363bf02c
                .word 0x3d6d61ed
                .word 0x8de6ae58
                .word 0x91346023
                .word 0xbe950cd2
                .word 0x1638806
                .word 0x8ba9b0e4
                .word 0x97d0c8bc
                .word 0x7f4b35c7
                .word 0x87b7e299
                .word 0xaf0acfbf
                .word 0x3804434e
                .word 0xf3340a19
                .word 0x5826071
                .word 0x4e566496
                .word 0xb295dd62
                .word 0x363bf02c
                .word 0x3d6d61ed
                .word 0x8de6ae58
                .word 0x91346023
                .word 0xbe950cd2
                .word 0x1638806
                .word 0x8ba9b0e4
                .word 0x97d0c8bc
                .word 0x7f4b35c7
.end

