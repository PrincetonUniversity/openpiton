// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: itlb_repl_basic.s
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

#define MAIN_PAGE_HV_ALSO

#include "boot.s"

!!-------------------------------------------------------------------------------
!!
!!      This file has the micro-code to test out the MMU registers
!!
!!-------------------------------------------------------------------------------

.global main

main:

#define ITLB_NCLX1      0x28    /* L=1 , G=0 , CTX=NUCL */
#define ITLB_NCLX2      0x30    /* L=0 , G=0 , CTX=NUCL */
#define ITLB_NCLX3      0x40    /* L=1,  G=1 , CTX=NUCL */
#define ITLB_NCLX4      0x48
#define ITLB_NCLX5      0x50
#define ITLB_PCTX1      0xa0
#define ITLB_PCTX2      0xa8

#define ITLB_DMPSCTX1   0x160
#define ITLB_DMPSCTX2   0x168

#define ITLB_CTXDMP_NCLU1       0x28
#define ITLB_CTXDMP_NCLU2       0x40
#define ITLB_CTXDMP_NCLU3       0xa0
#define ITLB_CTXDMP_PMRY1       0xa0
#define ITLB_CTXDMP_PMRY2       0xe0
#define ITLB_CTXDMP_PMRY3       0x120
#define ITLB_CTXDMP_SEC1        0x120
#define ITLB_CTXDMP_SEC2        0x160
#define ITLB_CTXDMP_SEC3        0x200

#define DTLB_CTXDMP_NCLU1       0x0
#define DTLB_CTXDMP_NCLU2       0x40
#define DTLB_CTXDMP_NCLU3       0x80
#define DTLB_CTXDMP_PMRY1       0x80
#define DTLB_CTXDMP_PMRY2       0xc0
#define DTLB_CTXDMP_PMRY3       0x100
#define DTLB_CTXDMP_SEC1        0x100
#define DTLB_CTXDMP_SEC2        0x180
#define DTLB_CTXDMP_SEC3        0x200
#define DTLB_DMAP_ENTRY1        0x10
#define DTLB_DMAP_ENTRY2        0x30
#define DTLB_DMAP_ENTRY3        0x50
#define DTLB_DMAP_ENTRY4        0x70
#define DTLB_DMAP_ENTRY5        0x90
#define DTLB_DMAP_ENTRY6        0xb0
#define DTLB_DMAP_ENTRY7        0xd0
#define DTLB_DMAP_ENTRY8        0xe0

        /* changed to privilege mode */
        ta      T_CHANGE_HPRIV
        nop
/*
 *****************************************************************************
 *
 *      all the entries in the I-TLB
 *
 *      Entry           G               L               CTX
 *   ----------------------------------------------------------------
 *      0--4    not touched, created by boot/main code MMU miss
 *   ----------------------------------------------------------------
 *      5               0               1               NUCLEUS
 *   ----------------------------------------------------------------
 *      6-7             0               0               NUCLEUS
 *   ----------------------------------------------------------------
 *      8-19            1               0               NUCLEUS
 *   ----------------------------------------------------------------
 *      20-27           0               1               PCONTEXT
 *   ----------------------------------------------------------------
 *      28-35           1               0               PCONTEXT
 *   ----------------------------------------------------------------
 *      36-43           1               0               SCONTEXT
 *   ----------------------------------------------------------------
 *      44-63           0               1               SCONTEXT
 *   ----------------------------------------------------------------
 ******************************************************************************
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
        add     %l3,    %l7,    %l3
        add     %l4,    %l7,    %l4
        add     %l1,    0x8,    %l1
        add     %l5,    0x4,    %l5

        sub     %l4,    0x40,   %l4     /* lock bit not set */

        stxa    %l3,    [%o0] 0x50      /* IMMU Tag Access Reg */
        stxa    %l4,    [%l1] 0x55      /* IMMU Data In Reg */
        ldxa    [%l1]   0x55,   %g4     /* IMMU data access reg */
        ldxa    [%l1]   0x56,   %g5     /* IMMU tag read reg */
        add     %l3,    %l7,    %l3
        add     %l4,    %l7,    %l4
        add     %l1,    0x8,    %l1
        add     %l5,    0x4,    %l5

        stxa    %l3,    [%o0] 0x50      /* IMMU Tag Access Reg */
        stxa    %l4,    [%l1] 0x55      /* IMMU Data In Reg */
        ldxa    [%l1]   0x55,   %g4     /* IMMU data access reg */
        ldxa    [%l1]   0x56,   %g5     /* IMMU tag read reg */
        add     %l3,    %l7,    %l3
        add     %l4,    %l7,    %l4
        add     %l1,    0x8,    %l1
        add     %l5,    0x4,    %l5

        add     %l4,    0x1,   %l4     /* set global bit */

wr_itte1:
        stxa    %l3,    [%o0] 0x50      /* IMMU Tag Access Reg */
        stxa    %l4,    [%l1] 0x55      /* IMMU Data In Reg */

        ldxa    [%l1]   0x55,   %g4     /* IMMU data access reg */
        ldxa    [%l1]   0x56,   %g5     /* IMMU tag read reg */

        add     %l3,    %l7,    %l3
        add     %l4,    %l7,    %l4

        add     %l1,    0x8,    %l1
        add     %l5,    0x4,    %l5

        sub     %l5,    0x50,   %l6
        brnz,a  %l6,    wr_itte1
        nop

wr_immu_pctx:
        set     0x0,    %l0
	sub	 %l4,	 0x1,	 %l4
	add	 %l4,	 0x40,	 %l4
        set     PCONTEXT,       %o1
        or      %o1,    %l3,    %l3     /* changed to Primary Context */
					 /* lock bit set */

wr_itte2:
        stxa    %l3,    [%o0] 0x50      /* IMMU Tag Access Reg */
        stxa    %l4,    [%l1] 0x55      /* IMMU Data In Reg */

        ldxa    [%l1]   0x55,   %g4     /* IMMU data access reg */
        ldxa    [%l1]   0x56,   %g5     /* IMMU tag read reg */

        add     %l3,    %l7,    %l3
        add     %l4,    %l7,    %l4

        add     %l1,    0x8,    %l1

        add     %l5,    0x4,    %l5

        sub     %l5,    0x70,   %l6

        brnz,a  %l6,    wr_itte2
        nop

        add     %l4,    0x1,    %l4     /* these 8 entries have G = 1 */
	 sub	 %l4, 	 0x40,   %l4	 /* lock bit not set */

wr_other8immu_prim:
        stxa    %l3,    [%o0] 0x50      /* IMMU Tag Access Reg */
        stxa    %l4,    [%l1] 0x55      /* IMMU Data In Reg */

        ldxa    [%l1]   0x55,   %g4     /* IMMU data access reg */
        ldxa    [%l1]   0x56,   %g5     /* IMMU tag read reg */

        add     %l3,    %l7,    %l3
        add     %l4,    %l7,    %l4

        add     %l1,    0x8,    %l1

        add     %l5,    0x4,    %l5

        sub     %l5,    0x90,  %l6      /* total 16 TLB entries PCONTEXT */
        brnz,a  %l6,    wr_other8immu_prim
        nop

wr_immu_sctx:
        set     0x0,    %l0
        set     PCONTEXT,       %o1
        sub     %l3,    %o1,    %l3

        set     SCONTEXT,       %o1
        or      %l3,    %o1,    %l3     /* changed to Secondary Context */

wr_itte3:
        stxa    %l3,    [%o0] 0x50      /* IMMU Tag Access Reg */
        stxa    %l4,    [%l1] 0x55      /* IMMU Data In Reg */

        ldxa    [%l1]   0x55,   %g4     /* IMMU data access reg */
        ldxa    [%l1]   0x56,   %g5     /* IMMU tag read reg */

        add     %l3,    %l7,    %l3
        add     %l4,    %l7,    %l4

        add     %l1,    0x8,    %l1
        add     %l5,    0x4,    %l5

        sub     %l5,    0xb0,   %l6     /* 8 entries of SCONTEXT are global */
        brnz,a  %l6,    wr_itte3
        nop

        sub     %l4,    0x1,    %l4
	 add	 %l4,	 0x40,	 %l4	 /* the following entries locked */
wr_other20immu_sec:
        stxa    %l3,    [%o0] 0x50      /* IMMU Tag Access Reg */
        stxa    %l4,    [%l1] 0x55      /* IMMU Data In Reg */

        ldxa    [%l1]   0x55,   %g4     /* IMMU data access reg */
        ldxa    [%l1]   0x56,   %g5     /* IMMU tag read reg */

        add     %l3,    %l7,    %l3
        add     %l4,    %l7,    %l4

        add     %l1,    0x8,    %l1
        add     %l5,    0x4,    %l5

        sub     %l5,    0x100,  %l6     /* total 28 TLB entries of SCONTEXT */
        brnz,a  %l6,    wr_other20immu_sec
        nop

	ta	T_CHANGE_NONHPRIV
	nop

	!/* so far, 1000 instructions */
	set	0x0,	%l0
	call	rdm_8kpg_0
	nop
	set	0x0,	%l0
	call	rdm_8kpg_1
	nop
	set	0x0,	%l0
	call	rdm_8kpg_2
	nop
	set	0x0,	%l0
	call	rdm_8kpg_3
	nop
	set	0x0,	%l0
	call	rdm_8kpg_4
	nop
	set	0x0,	%l0
	call	rdm_8kpg_5
	nop
	set	0x0,	%l0
	call	rdm_8kpg_6
	nop
	set	0x0,	%l0
	call	rdm_8kpg_7
	nop
	set	0x0,	%l0
	call	rdm_8kpg_8
	nop
	set	0x0,	%l0
	call	rdm_8kpg_9
	nop
	set	0x0,	%l0
	call	rdm_8kpg_10
	nop
	set	0x0,	%l0
	call	rdm_8kpg_11
	nop
	set	0x0,	%l0
	call	rdm_8kpg_12
	nop
	set	0x0,	%l0
	call	rdm_8kpg_13
	nop
	set	0x0,	%l0
	call	rdm_8kpg_14
	nop
	set	0x0,	%l0
	call	rdm_8kpg_15
	nop
	set	0x0,	%l0
	call	rdm_8kpg_16
	nop
	set	0x0,	%l0
	call	rdm_8kpg_17
	nop
	set	0x0,	%l0
	call	rdm_8kpg_18
	nop
	set	0x0,	%l0
	call	rdm_8kpg_19
	nop
	set	0x0,	%l0
	call	rdm_8kpg_20
	nop
	set	0x0,	%l0
	call	rdm_8kpg_21
	nop
	set	0x0,	%l0
	call	rdm_8kpg_22
	nop
	set	0x0,	%l0
	call	rdm_8kpg_23
	nop
	set	0x0,	%l0
	call	rdm_8kpg_24
	nop
	set	0x0,	%l0
	call	rdm_8kpg_25
	nop
	set	0x0,	%l0
	call	rdm_8kpg_26
	nop
	set	0x0,	%l0
	call	rdm_8kpg_27
	nop
	set	0x0,	%l0
	call	rdm_8kpg_28
	nop
	set	0x0,	%l0
	call	rdm_8kpg_29
	nop
	set	0x0,	%l0
	call	rdm_8kpg_30
	nop
	set	0x0,	%l0
	call	rdm_8kpg_31
	nop

	set	0x0,	%l0
	call	rdm_8kpg_32
	nop
	set	0x0,	%l0
	call	rdm_8kpg_33
	nop
	set	0x0,	%l0
	call	rdm_8kpg_34
	nop
	set	0x0,	%l0
	call	rdm_8kpg_35
	nop
	set	0x0,	%l0
	call	rdm_8kpg_36
	nop
	set	0x0,	%l0
	call	rdm_8kpg_37
	nop
	set	0x0,	%l0
	call	rdm_8kpg_38
	nop
	set	0x0,	%l0
	call	rdm_8kpg_39
	nop
	set	0x0,	%l0
	call	rdm_8kpg_40
	nop
	set	0x0,	%l0
	call	rdm_8kpg_41
	nop
	set	0x0,	%l0
	call	rdm_8kpg_42
	nop
	set	0x0,	%l0
	call	rdm_8kpg_43
	nop
	set	0x0,	%l0
	call	rdm_8kpg_44
	nop
	set	0x0,	%l0
	call	rdm_8kpg_45
	nop
	set	0x0,	%l0
	call	rdm_8kpg_46
	nop
	set	0x0,	%l0
	call	rdm_8kpg_47
	nop
	set	0x0,	%l0
	call	rdm_8kpg_48
	nop
	set	0x0,	%l0
	call	rdm_8kpg_49
	nop
	set	0x0,	%l0
	call	rdm_8kpg_50
	nop
	set	0x0,	%l0
	call	rdm_8kpg_51
	nop
	set	0x0,	%l0
	call	rdm_8kpg_52
	nop
	set	0x0,	%l0
	call	rdm_8kpg_53
	nop
	set	0x0,	%l0
	call	rdm_8kpg_54
	nop
	set	0x0,	%l0
	call	rdm_8kpg_55
	nop
	set	0x0,	%l0
	call	rdm_8kpg_56
	nop
	set	0x0,	%l0
	call	rdm_8kpg_57
	nop
	set	0x0,	%l0
	call	rdm_8kpg_58
	nop
	set	0x0,	%l0
	call	rdm_8kpg_59
	nop
	set	0x0,	%l0
	call	rdm_8kpg_60
	nop
	set	0x0,	%l0
	call	rdm_8kpg_61
	nop
	set	0x0,	%l0
	call	rdm_8kpg_62
	nop

        /* read out all the entries in I-TLB table to compare */

	ta	T_CHANGE_HPRIV
	nop

        set     0x0,    %l0
        set     0x40,   %l1
        set     0x0,    %l2
rd_itlb_loop1:
        ldxa    [%l2] 0x55,     %l3
        ldxa    [%l2] 0x56,     %l4

        add     %l2,    0x8,    %l2
        add     %l0,    0x1,    %l0

        sub     %l0,    %l1,    %l5
        brnz,a  %l5,    rd_itlb_loop1
        nop

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

.global  rdm_8kpg_64
rdm_8kpg_64:
        save
        set     0x2,    %i2
        return  %i7+8   /* good return */
        nop
.align  8192

.global  rdm_8kpg_65
rdm_8kpg_65:
        save
        set     0x2,    %i2
        return  %i7+8   /* good return */
        nop
.align  8192

.global  rdm_8kpg_66
rdm_8kpg_66:
        save
        set     0x2,    %i2
        return  %i7+8   /* good return */
        nop
.align  8192

.global  rdm_8kpg_67
rdm_8kpg_67:
        save
        set     0x2,    %i2
        return  %i7+8   /* good return */
        nop
.align  8192

.global  rdm_8kpg_68
rdm_8kpg_68:
        save
        set     0x2,    %i2
        return  %i7+8   /* good return */
        nop
.align  8192

.global  rdm_8kpg_69
rdm_8kpg_69:
        save
        set     0x2,    %i2
        return  %i7+8   /* good return */
        nop
.align  8192

.global  rdm_8kpg_70
rdm_8kpg_70:
        save
        set     0x2,    %i2
        return  %i7+8   /* good return */
        nop
.align  8192

.global  rdm_8kpg_71
rdm_8kpg_71:
        save
        set     0x2,    %i2
        return  %i7+8   /* good return */
        nop
.align  8192

.global  rdm_8kpg_72
rdm_8kpg_72:
        save
        set     0x2,    %i2
        return  %i7+8   /* good return */
        nop
.align  8192

.global  rdm_8kpg_73
rdm_8kpg_73:
        save
        set     0x2,    %i2
        return  %i7+8   /* good return */
        nop
.align  8192

.global  rdm_8kpg_74
rdm_8kpg_74:
        save
        set     0x2,    %i2
        return  %i7+8   /* good return */
        nop
.align  8192

.global  rdm_8kpg_75
rdm_8kpg_75:
        save
        set     0x2,    %i2
        return  %i7+8   /* good return */
        nop
.align  8192

.global  rdm_8kpg_76
rdm_8kpg_76:
        save
        set     0x2,    %i2
        return  %i7+8   /* good return */
        nop
.align  8192

.global  rdm_8kpg_77
rdm_8kpg_77:
        save
        set     0x2,    %i2
        return  %i7+8   /* good return */
        nop
.align  8192

.global  rdm_8kpg_78
rdm_8kpg_78:
        save
        set     0x2,    %i2
        return  %i7+8   /* good return */
        nop
.align  8192

.global  rdm_8kpg_79
rdm_8kpg_79:
        save
        set     0x2,    %i2
        return  %i7+8   /* good return */
        nop
.align  8192

.global  rdm_8kpg_80
rdm_8kpg_80:
        save
        set     0x2,    %i2
        return  %i7+8   /* good return */
        nop
.align  8192

