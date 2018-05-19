// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: v9_mmureg.s
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
/*
!!-------------------------------------------------------------------------------
!!
!!	This file has the micro-code to test out the MMU registers
!!
!!		add the support for customized trap handler. The reason is 
!!		we need to setup different TSB size for both IMMU and DMMU. 
!!		
!!		During the boot code, we still use standard MMU trap handler 
!!		to handle the page fault. After entering the user code, we 
!!		use customized trap handler to check the caculated 8K pointer
!!		and 64k pointer, after settup the size bits in TSB register.
!!
!!		Diag covers :

		IMMU & DMMU
		===========
			TSB register :
				a. split = 0 
					1. TSB_Size =  3'b000
					2. TSB_Size =  3'b001
					3. TSB_Size =  3'b010
					4. TSB_Size =  3'b011
					5. TSB_Size =  3'b100
					6. TSB_Size =  3'b101
					7. TSB_Size =  3'b110
					8. TSB_Size =  3'b111

				b. split = 1 
					1. TSB_Size =  3'b000
					2. TSB_Size =  3'b001
					3. TSB_Size =  3'b010
					4. TSB_Size =  3'b011
					5. TSB_Size =  3'b100
					6. TSB_Size =  3'b101
					7. TSB_Size =  3'b110
					8. TSB_Size =  3'b111
					
	1.2	Add support for watch point register testing and trap handling 
!!-------------------------------------------------------------------------------
*/

#define	H_HT0_fast_instr_access_MMU_miss	T0_fast_immu_miss
#define H_HT0_fast_data_access_MMU_miss		T0_fast_dmmu_miss

#define MAIN_PAGE_HV_ALSO

#include "boot.s"

.text

.global main

#define	ITSB_BASE1	0x000008aaaaaa8000 	/* VA[43] = 1 */
#define	ITSB_BASE2	0x0000045555558000 	/* VA[43] = 0 */
#define	ITSB_BASE3	0x000008ffffffc000 	/* VA[43] = 1 */
#define	ITSB_BASE4	0x0000045a5a5a4000 	/* VA[43] = 0 */
#define	ITSB_BASE5	0x000008fafafa8000 	/* VA[43] = 1 */
#define	ITSB_BASE6	0x000004000000c000 	/* VA[43] = 0 */
#define	ITSB_BASE7	0x0000089a5ffaa000 	/* VA[43] = 1 */

main:
	mov	0x0,	%l0
itsb_1:
	/*
	 ***************************************
	 * split = 0 , itsb_size = 3'b001
	 ***************************************
	 */
	mov	0x1,	%o0	/* test case 1 */
	setx	ITSB_BASE1,	%l0,	%l1
	add	%l1,	0x1,	%l1	/* TSB_size = 3'b001 */

	call	itsb_test
	nop

itsb_2:
        /*
         ***************************************
         * split = 0 , itsb_size = 3'b010
         ***************************************
         */
        mov     0x2,    %o0     /* test case 2 */
        setx    ITSB_BASE2,     %l0,    %l1
        add     %l1,    0x2,    %l1     /* TSB_size = 3'b010 */

        call    itsb_test
        nop

itsb_3:
        /*
         ***************************************
         * split = 0 , itsb_size = 3'b011
         ***************************************
         */
        mov     0x3,    %o0     /* test case 3 */
        setx    ITSB_BASE3,     %l0,    %l1
        add     %l1,    0x3,    %l1     /* TSB_size = 3'b011 */

        call    itsb_test
        nop

itsb_4:
        /*
         ***************************************
         * split = 0 , itsb_size = 3'b100
         ***************************************
         */
        mov     0x4,    %o0     /* test case 4 */
        setx    ITSB_BASE4,     %l0,    %l1
        add     %l1,    0x4,    %l1     /* TSB_size = 3'b100 */

        call    itsb_test
        nop

itsb_5:
        /*
         ***************************************
         * split = 0 , itsb_size = 3'b101
         ***************************************
         */
        mov     0x5,    %o0     /* test case 5 */
        setx    ITSB_BASE5,     %l0,    %l1
        add     %l1,    0x5,    %l1     /* TSB_size = 3'b101 */

        call    itsb_test
        nop

itsb_6:
        /*
         ***************************************
         * split = 0 , itsb_size = 3'b110
         ***************************************
         */
        mov     0x6,    %o0     /* test case 6 */
        setx    ITSB_BASE6,     %l0,    %l1
        add     %l1,    0x6,    %l1     /* TSB_size = 3'b110 */

        call    itsb_test
        nop

itsb_7:
        /*
         ***************************************
         * split = 0 , itsb_size = 3'b111
         ***************************************
         */
        mov     0x7,    %o0     /* test case 7 */
        setx    ITSB_BASE7,     %l0,    %l1
        add     %l1,    0x7,    %l1     /* TSB_size = 3'b111 */

        call    itsb_test
        nop

	mov	0x0,	%l0
itsb_8:
	/*
	 ***************************************
	 * split = 1 , itsb_size = 3'b001
	 ***************************************
	 */
	mov	0x8,	%o0	/* test case 8 */
	setx	ITSB_BASE1,	%l0,	%l1
	add	%l1,	0x1,	%l1	/* TSB_size = 3'b001 */
	set	0x1000,	%l3
	or	%l3,	%l1,	%l1	

	call	itsb_test
	nop

itsb_9:
        /*
         ***************************************
         * split = 1 , itsb_size = 3'b010
         ***************************************
         */
        mov     0x9,    %o0     /* test case 9 */
        setx    ITSB_BASE2,     %l0,    %l1
        add     %l1,    0x2,    %l1     /* TSB_size = 3'b010 */
        set     0x1000, %l3
        or      %l3,    %l1,    %l1

        call    itsb_test
        nop

itsb_10:
        /*
         ***************************************
         * split = 1 , itsb_size = 3'b011
         ***************************************
         */
        mov     0xa,    %o0     /* test case 10 */
        setx    ITSB_BASE3,     %l0,    %l1
        add     %l1,    0x3,    %l1     /* TSB_size = 3'b011 */
        set     0x1000, %l3
        or      %l3,    %l1,    %l1

        call    itsb_test
        nop

itsb_11:
        /*
         ***************************************
         * split = 1 , itsb_size = 3'b100
         ***************************************
         */
        mov     0xb,    %o0     /* test case 11 */
        setx    ITSB_BASE4,     %l0,    %l1
        add     %l1,    0x4,    %l1     /* TSB_size = 3'b100 */
        set     0x1000, %l3
        or      %l3,    %l1,    %l1

        call    itsb_test
        nop

itsb_12:
        /*
         ***************************************
         * split = 1 , itsb_size = 3'b101
         ***************************************
         */
        mov     0xc,    %o0     /* test case 12 */
        setx    ITSB_BASE5,     %l0,    %l1
        add     %l1,    0x5,    %l1     /* TSB_size = 3'b101 */
        set     0x1000, %l3
        or      %l3,    %l1,    %l1

        call    itsb_test
        nop

itsb_13:
        /*
         ***************************************
         * split = 1 , itsb_size = 3'b110
         ***************************************
         */
        mov     0xd,    %o0     /* test case 13 */
        setx    ITSB_BASE6,     %l0,    %l1
        add     %l1,    0x6,    %l1     /* TSB_size = 3'b110 */
        set     0x1000, %l3
        or      %l3,    %l1,    %l1

        call    itsb_test
        nop

itsb_14:
        /*
         ***************************************
         * split = 1 , itsb_size = 3'b111
         ***************************************
         */
        mov     0xe,    %o0     /* test case 14 */
        setx    ITSB_BASE7,     %l0,    %l1
        add     %l1,    0x7,    %l1     /* TSB_size = 3'b111 */
        set     0x1000, %l3
        or      %l3,    %l1,    %l1

        call    itsb_test
        nop

#define DTSB_BASE1      0x000008aaaaaa8000      /* VA[43] = 1 */
#define DTSB_BASE2      0x0000045555558000      /* VA[43] = 0 */
#define DTSB_BASE3      0x000008ffffffc000      /* VA[43] = 1 */
#define DTSB_BASE4      0x0000045a5a5a4000      /* VA[43] = 0 */
#define DTSB_BASE5      0x000008fafafa8000      /* VA[43] = 1 */
#define DTSB_BASE6      0x000004000000c000      /* VA[43] = 0 */
#define DTSB_BASE7      0x0000089a5ffaa000      /* VA[43] = 1 */

	mov	0x0,	%l0
dtsb_1:
	/*
	 ***************************************
	 * split = 0 , dtsb_size = 3'b001
	 ***************************************
	 */
	mov	0x1,	%o0	/* test case 1 */
	setx	DTSB_BASE1,	%l0,	%l1
	add	%l1,	0x1,	%l1	/* TSB_size = 3'b001 */

	call	dtsb_test
	nop

dtsb_2:
        /*
         ***************************************
         * split = 0 , dtsb_size = 3'b010
         ***************************************
         */
        mov     0x2,    %o0     /* test case 2 */
        setx    DTSB_BASE2,     %l0,    %l1
        add     %l1,    0x2,    %l1     /* TSB_size = 3'b010 */

        call    dtsb_test
        nop

dtsb_3:
        /*
         ***************************************
         * split = 0 , dtsb_size = 3'b011
         ***************************************
         */
        mov     0x3,    %o0     /* test case 3 */
        setx    DTSB_BASE3,     %l0,    %l1
        add     %l1,    0x3,    %l1     /* TSB_size = 3'b011 */

        call    dtsb_test
        nop

dtsb_4:
        /*
         ***************************************
         * split = 0 , dtsb_size = 3'b100
         ***************************************
         */
        mov     0x4,    %o0     /* test case 4 */
        setx    DTSB_BASE4,     %l0,    %l1
        add     %l1,    0x4,    %l1     /* TSB_size = 3'b100 */

        call    dtsb_test
        nop

dtsb_5:
        /*
         ***************************************
         * split = 0 , dtsb_size = 3'b101
         ***************************************
         */
        mov     0x5,    %o0     /* test case 5 */
        setx    DTSB_BASE5,     %l0,    %l1
        add     %l1,    0x5,    %l1     /* TSB_size = 3'b101 */

        call    dtsb_test
        nop

dtsb_6:
        /*
         ***************************************
         * split = 0 , dtsb_size = 3'b110
         ***************************************
         */
        mov     0x6,    %o0     /* test case 6 */
        setx    DTSB_BASE6,     %l0,    %l1
        add     %l1,    0x6,    %l1     /* TSB_size = 3'b110 */

        call    dtsb_test
        nop

dtsb_7:
        /*
         ***************************************
         * split = 0 , dtsb_size = 3'b111
         ***************************************
         */
        mov     0x7,    %o0     /* test case 7 */
        setx    DTSB_BASE7,     %l0,    %l1
        add     %l1,    0x7,    %l1     /* TSB_size = 3'b111 */

        call    dtsb_test
        nop

	mov	0x0,	%l0
dtsb_8:
	/*
	 ***************************************
	 * split = 1 , dtsb_size = 3'b001
	 ***************************************
	 */
	mov	0x8,	%o0	/* test case 8 */
	setx	DTSB_BASE1,	%l0,	%l1
	add	%l1,	0x1,	%l1	/* TSB_size = 3'b001 */
	set	0x1000,	%l3
	or	%l3,	%l1,	%l1	

	call	dtsb_test
	nop

dtsb_9:
        /*
         ***************************************
         * split = 1 , dtsb_size = 3'b010
         ***************************************
         */
        mov     0x9,    %o0     /* test case 9 */
        setx    DTSB_BASE2,     %l0,    %l1
        add     %l1,    0x2,    %l1     /* TSB_size = 3'b010 */
        set     0x1000, %l3
        or     %l3,    %l1,    %l1

        call    dtsb_test
        nop

dtsb_10:
        /*
         ***************************************
         * split = 1 , dtsb_size = 3'b011
         ***************************************
         */
        mov     0xa,    %o0     /* test case 10 */
        setx    DTSB_BASE3,     %l0,    %l1
        add     %l1,    0x3,    %l1     /* TSB_size = 3'b011 */
        set     0x1000, %l3
        or     %l3,    %l1,    %l1

        call    dtsb_test
        nop

dtsb_11:
        /*
         ***************************************
         * split = 1 , dtsb_size = 3'b100
         ***************************************
         */
        mov     0xb,    %o0     /* test case 11 */
        setx    DTSB_BASE4,     %l0,    %l1
        add     %l1,    0x4,    %l1     /* TSB_size = 3'b100 */
        set     0x1000, %l3
        or     %l3,    %l1,    %l1

        call    dtsb_test
        nop

dtsb_12:
        /*
         ***************************************
         * split = 1 , dtsb_size = 3'b101
         ***************************************
         */
        mov     0xc,    %o0     /* test case 12 */
        setx    DTSB_BASE5,     %l0,    %l1
        add     %l1,    0x5,    %l1     /* TSB_size = 3'b101 */
        set     0x1000, %l3
        or     %l3,    %l1,    %l1

        call    dtsb_test
        nop

dtsb_13:
        /*
         ***************************************
         * split = 1 , dtsb_size = 3'b110
         ***************************************
         */
        mov     0xd,    %o0     /* test case 13 */
        setx    DTSB_BASE6,     %l0,    %l1
        add     %l1,    0x6,    %l1     /* TSB_size = 3'b110 */
        set     0x1000, %l3
        or     %l3,    %l1,    %l1

        call    dtsb_test
        nop

dtsb_14:
        /*
         ***************************************
         * split = 1 , dtsb_size = 3'b111
         ***************************************
         */
        mov     0xe,    %o0     /* test case 14 */
        setx    DTSB_BASE7,     %l0,    %l1
        add     %l1,    0x7,    %l1     /* TSB_size = 3'b111 */
        set     0x1000, %l3
        or     %l3,    %l1,    %l1

        call    dtsb_test
        nop

/*
 ********************************************
 * 	Watch_point Register
 *
 *	Based on UltraSparcII user manual, 
 * 	pg305, table A-1, need to cover all
 * 	the cases.
 ********************************************
 */

/*
 ********************************
 *      Diag PASSED !           *
 ********************************
 */
diag_pass:
        set     0xaaddcafe,     %l0
good_trap:
        ta 	T_GOOD_TRAP
        nop

/*
 ********************************
 *      Diag FAILED !           *
 ********************************
 */
diag_fail:
        set     0xdeadcafe,     %l0
bad_trap:
        ta 	T_BAD_TRAP
        nop
        nop

/*
 *****************************************
 * function :
 * 
 * 	Input : 
 *	    %l1 : i-tsb reg value  
 *
 *	test the I-TSB reg config
 *****************************************
 */
itsb_test:
	add	%o7,	0x0,	%l7
	mov	0x0,	%o0
	ta	T_CHANGE_HPRIV
	nop
	/* 
	 **********************************************
	 * split = 0,1;  itsb_size 3'b001 ~ 3'b111 
	 **********************************************
	 */
	mov	0x0,	%o6
	stxa	%l1,	[%o6] 0x3d	/* change IMMU_CTX_NONZERO_TSB_BASE_PS0 reg */
	stxa	%l1,	[%o6] 0x3e	/* change IMMU_CTX_NONZERO_TSB_BASE_PS0 reg */
	ldxa	[%o6] 0x3d,	%l4	/* cross-check with RTL */
	ldxa	[%o6] 0x3e,	%l3	/* cross-check with RTL */

	ta	T_CHANGE_NONHPRIV
	nop

	/* generate IMISS trap on 8k page */
	setx	itsb_rt0,	%l0,	%l2
	mov	0x1,	%o0
	call	fncall_0
	nop
itsb_rt0:
	setx	itsb_rt1,	%l0,	%l2
	/* generate IMISS trap on 64k page */
	mov	0x1,	%o0
	call	itte_64kb_start
	nop	

itsb_rt1:
	/* generate IMISS trap on 256mb page */
	setx	itsb_rt2,	%l0,	%l2
	mov	0x1,	%o0
	call	itte_256mb_start
	nop	

itsb_rt2:
	/* generate IMISS trap on 4M page */
	setx	itsb_rtn, 	%l0,	%l2
	mov	0x1,	%o0
	call	itte_4mb_start
	nop	

itsb_rtn:
	add	%l7,	0,	%o7
	retl
	nop


/*
 *****************************************
 * function :
 * 
 * 	Input : 
 *	    %l1 : d-tsb reg value  
 *
 *	test the D-TSB reg config
 *****************************************
 */
dtsb_test:
	add	%o7,	0x0,	%l7
	mov	0x0,	%o0

	ta	T_CHANGE_HPRIV
	nop
	/* 
	 **********************************************
	 * split = 0,1;  dtsb_size 3'b001 ~ 3'b111 
	 **********************************************
	 */
	mov	0x0,	%o6
	stxa	%l1,	[%o6] 0x39	/* change DMMU_CTX_NONZERO_TSB_BASE_PS0 reg */
	stxa	%l1,	[%o6] 0x3a	/* change DMMU_CTX_NONZERO_TSB_BASE_PS0 reg */
	ldxa	[%o6] 0x39,	%l4	/* cross-check with RTL */
	ldxa	[%o6] 0x3a,	%l3	/* cross-check with RTL */

	ta	T_CHANGE_NONHPRIV
	nop

	/* generate DMISS trap on 8k page */
	mov	0x1,	%o0		/* o0 non-zero, go to check ptr in Dmmu_miss */
	setx	ldst_data,	%l0,	%l3
	ldx	[%l3],	%l4	

	/* generate DMISS trap on 64k page */
	mov	0x55,	%l4
	setx	dtte_64kb_data,	%l0,	%l3
	mov	0x1,	%o0		/* o0 non-zero, go to check ptr in Dmmu_miss */
	stx	%l4,	[%l3]

	/* generate DMISS trap on 256mb page */
	setx	dtte_256mb_data, %l0,	%l3 
	mov	0x1,	%o0		/* o0 non-zero, go to check ptr in Dmmu_miss */
	ldx	[%l3],	%l4	

	/* generate DMISS trap on 4M page */
	mov	0xff,	%l4
	setx	dtte_64kb_data,	%l0,	%l3
	mov	0x1,	%o0		/* o0 non-zero, go to check ptr in Dmmu_miss */
	stx	%l4,	[%l3]

dtsb_rtn:
	add	%l7,	0,	%o7
	retl
	nop


.align	8192

/*
 *********************************
 *	dummy function call
 *********************************
 */
fncall_0:
	mov	0,	%i0
	mov	1,	%i1
	retl
	nop

.align	8192

.data

ldst_data:
	.word	0xaa55bbff
	.word	0xaa66bbff
	.word	0xaa77bbff
	.word	0xaa88bbff

!!-----------------------------------------------------
!!      64kb page size for I/D TTE
!!-----------------------------------------------------
#define ITTE_64KB_PG_BASE_TEXT_ADDR     0x5b0000
#define ITTE_64KB_PG_BASE_TEXT_ADDR_RA  0x1005b0000
#define ITTE_64KB_PG_BASE_DATA_ADDR     0x780000
#define ITTE_64KB_PG_BASE_DATA_ADDR_RA  0x100780000

SECTION .ITTE_64KB_PAGE	TEXT_VA=ITTE_64KB_PG_BASE_TEXT_ADDR, DATA_VA=ITTE_64KB_PG_BASE_DATA_ADDR
attr_text {
        Name = .ITTE_64KB_PAGE,
        VA=ITTE_64KB_PG_BASE_TEXT_ADDR, 
 	PA=ra2pa(ITTE_64KB_PG_BASE_TEXT_ADDR_RA,0), 
 	RA=ITTE_64KB_PG_BASE_TEXT_ADDR_RA, 
        part_0_i_ctx_nonzero_ps0_tsb,
        TTE_G=0, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=1, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=1, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=0
        }

attr_data {
        Name = .ITTE_64KB_PAGE,
        VA=ITTE_64KB_PG_BASE_DATA_ADDR, 
	PA=ra2pa(ITTE_64KB_PG_BASE_DATA_ADDR_RA,0),
	RA=ITTE_64KB_PG_BASE_DATA_ADDR_RA,
        part_0_d_ctx_nonzero_ps0_tsb,
	part_0_d_ctx_zero_ps0_tsb,
        TTE_G=0, TTE_Context=SCONTEXT, TTE_V=1, TTE_Size=1, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=1, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=1
        }


.text

.global  itte_64kb_start

itte_64kb_start:
        save
        set     0x2,    %i2
        return  %i7+8   /* good return */
        nop
.data

.global  dtte_64kb_data

dtte_64kb_data: .word   0x11223344
                .word   0x11223355
                .word   0x11223366
                .word   0x11223377
.end

!!-----------------------------------------------------
!!      256mb page size for I/D TTE
!!-----------------------------------------------------
#define ITTE_256MB_PG_BASE_TEXT_ADDR    0x10000000
#define ITTE_256MB_PG_BASE_TEXT_ADDR_RA 0x110000000
#define ITTE_256MB_PG_BASE_DATA_ADDR    0x20000000
#define ITTE_256MB_PG_BASE_DATA_ADDR_RA 0x120000000

SECTION .ITTE_256MB_PAGE TEXT_VA=ITTE_256MB_PG_BASE_TEXT_ADDR, DATA_VA=ITTE_256MB_PG_BASE_DATA_ADDR
attr_text {
        Name = .ITTE_256MB_PAGE,
        VA=ITTE_256MB_PG_BASE_TEXT_ADDR,
 	PA=ra2pa(ITTE_256MB_PG_BASE_TEXT_ADDR_RA,0),
 	RA=ITTE_256MB_PG_BASE_TEXT_ADDR_RA,
        part_0_i_ctx_nonzero_ps0_tsb,
        TTE_G=0, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=3, TTE_NFO=0,
    /*    TTE_G=0, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=5, TTE_NFO=0, */
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=1, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=0
        }

attr_data {
        Name = .ITTE_256MB_PAGE,
        VA=ITTE_256MB_PG_BASE_DATA_ADDR, 
	PA=ra2pa(ITTE_256MB_PG_BASE_DATA_ADDR_RA,0),
	RA=ITTE_256MB_PG_BASE_DATA_ADDR_RA,
        part_0_d_ctx_nonzero_ps0_tsb,
	part_0_d_ctx_zero_ps0_tsb,
        TTE_G=0, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=3, TTE_NFO=0,
      /*  TTE_G=0, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=5, TTE_NFO=0, */
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=1, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=1
        }


.text

.global  itte_256mb_start

itte_256mb_start:
        save
        set     0x2,    %i2
        return  %i7+8   /* good return */
        nop

.data

.global  dtte_256mb_data

dtte_256mb_data:        .word   0x11223344
                .word   0x11223355
                .word   0x11223366
                .word   0x11223377
.end

!!-----------------------------------------------------
!!      4MB page size for I/D TTE
!!-----------------------------------------------------
#define ITTE_4MB_PG_BASE_TEXT_ADDR      0x3000000
#define ITTE_4MB_PG_BASE_TEXT_ADDR_RA   0x103000000
#define ITTE_4MB_PG_BASE_DATA_ADDR      0x4000000
#define ITTE_4MB_PG_BASE_DATA_ADDR_RA   0x104000000

SECTION .ITTE_4MB_PAGE TEXT_VA=ITTE_4MB_PG_BASE_TEXT_ADDR, DATA_VA=ITTE_4MB_PG_BASE_DATA_ADDR
attr_text {
        Name = .ITTE_4MB_PAGE,
        VA= ITTE_4MB_PG_BASE_TEXT_ADDR,
 	PA= ra2pa(ITTE_4MB_PG_BASE_TEXT_ADDR_RA,0),
 	RA= ITTE_4MB_PG_BASE_TEXT_ADDR_RA,
        part_0_i_ctx_nonzero_ps0_tsb,
        TTE_G=1, TTE_Context=0, TTE_V=1, TTE_Size=3, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=1, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=0
        }

attr_data {
        Name = .ITTE_4MB_PAGE,
        VA=ITTE_4MB_PG_BASE_DATA_ADDR, 
	PA=ra2pa(ITTE_4MB_PG_BASE_DATA_ADDR_RA,0),
	RA=ITTE_4MB_PG_BASE_DATA_ADDR_RA,
        part_0_d_ctx_nonzero_ps0_tsb,
	part_0_d_ctx_zero_ps0_tsb,
        TTE_G=0, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=3, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=1, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=1
        }


.text

.global  itte_4mb_start

itte_4mb_start:
        save
        set     0x2,    %i2
        return  %i7+8   /* good return */
        nop

.data

.global  dtte_4mb_data

dtte_4mb_data:  .word   0x11223344
                .word   0x11223355
                .word   0x11223366
                .word   0x11223377
.end


	
SECTION .USER_TRAP TEXT_VA=0x1600000
attr_text {
        Name = .USER_TRAP
	hypervisor
        }

.global T0_fast_immu_miss
.global T0_fast_dmmu_miss 

	/* 
 ****************************************
 * Customized trap handler 
 ****************************************
 */

T0_fast_immu_miss:
/*
 **********************************************
 * Customized fast IMMU page fault handler
 *
 * Input :

        %o0 : if 0, use standard way to
                handle the IMMU miss;

        Otherwise, use propritary trap handler
 **********************************************
 */
        brnz    %o0,    imiss_traphdl
        nop

immu_standard_trap:
#include "immu_miss_handler.s"
#include "immu_miss_handler_ext.s"

imiss_traphdl:
	/* 
	 ***********************************
	 * read out IMMU regs to compare
	 ***********************************
 	 */
	ldxa    [%g0] 0x51, %g1     /* IMMU_TSB_PS0_PTR */
	ldxa    [%g0] 0x52, %g2     /* IMMU_TSB_PS1_PTR */
	ldxa    [%g0] 0x50, %g3     /* I-TSB TAG target reg */
	ldxa    [%g0] 0x56, %g4     /*  I-TSB TAG read reg */

	wrpr	%l2,	%tpc
	wrpr	%l2,	%tnpc

        done
        nop

/*
 **********************************************
 * Customized fast DMMU page fault handler
 *
 * Input :      

        %o0 : if 0, use standard way to
                handle the DMMU miss;

        Otherwise, use propritary trap handler
 **********************************************
 */
T0_fast_dmmu_miss:
        brnz    %o0,    dmiss_traphdl
        nop     

dmmu_standard_trap:  
#include "dmmu_miss_handler.s"
#include "dmmu_miss_handler_ext.s"

dmiss_traphdl:
        ldxa 	[%g0] 0x59, 	%g1    /* DMMU_TSB_PS0_PTR reg */
        ldxa 	[%g0] 0x5a, 	%g1    /* DMMU_TSB_PS1_PTR reg */
        ldxa 	[%g0] 0x58, 	%g1    ! D-TSB tag target reg
        ldxa 	[%g0] 0x5e, 	%g1    ! D-TSB tag read reg

        done
        nop



