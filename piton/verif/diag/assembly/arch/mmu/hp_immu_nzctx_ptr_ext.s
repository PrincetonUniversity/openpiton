// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: hp_immu_nzctx_ptr_ext.s
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
!!		we need to setup different TSB size for IMMU.
!!		
!!		During the boot code, we still use standard MMU trap handler 
!!		to handle the page fault. After entering the user code, we 
!!		use customized trap handler to check the caculated 8K pointer
!!		and 64k pointer, after settup the size bits in TSB register.
!!
!!		Diag covers :

		IMMU && Context = 0 :
		============================
                        TSB register :
                                a. split = 0
                                        1.      TSB_Size =  4'b0000
                                        2.      TSB_Size =  4'b0001
                                        3.      TSB_Size =  4'b0010
                                                .......
                                        16.     TSB_Size = 4'b1111

                                b. split = 1
                                        1. TSB_Size =  4'b1000
                                        2. TSB_Size =  4'b1001
                                        3. TSB_Size =  4'b1010
                                        4. TSB_Size =  4'b1011
                                                ......
                                        16.     TSB_Size = 4'b1111

					
!!	
!!	ps0[2:0] can be : 
			0 -- 8k; 1 -- 64k; 3 -- 4Mb; 5 -- 256Mb.
!!	
!!
!! asi_immu_tsb_ps0_ptr_reg :
!!	if(tsb_base.split=0) {
!!	  ps0_ptr = { 	tsb_base[63:13+tsb_size] ,
!!			va[21+tsb_size+3*config.ps0:13+3*config.ps0] , 4'b0000 };	
!!	} else {
!!	  ps0_ptr = { 	tsb_base[63:14+tsb_size] , 1'b0 ,
!!			va[21+tsb_size+3*config.ps0:13+3*config.ps0] | 4'b0000 };	
!!	}
!!
!! similarly, diag will test 
!!
!! asi_immu_tsb_ps1_ptr_reg :
!!	if(tsb_base.split=0) {
!!	  ps1_ptr = { 	tsb_base[63:13+tsb_size] ,
!!			va[21+tsb_size+3*config.ps1:13+3*config.ps1] , 4'b0000 };	
!!	} else {
!!	  ps1_ptr = { 	tsb_base[63:14+tsb_size] , 1'b0 ,
!!			va[21+tsb_size+3*config.ps1:13+3*config.ps1] | 4'b0000 };	
!!	}
!!
!!-------------------------------------------------------------------------------
*/

#define H_HT0_fast_instr_access_MMU_miss	T0_fast_immu_miss
#define H_HT0_Data_Access_Exception_0x30	local_daccess_excp_handler

#define MAIN_PAGE_HV_ALSO

#include "boot.s"

.text

.global main

main:
	mov	0x0,	%l0
	mov	0x1,	%l1

tc_0:
	/* use default PS0 config & PS1 config */
	call immu_ptr_test
	nop

tc_1:
	/* change PS0 = 1, PS1=1 */
	ta	T_CHANGE_HPRIV
	nop

#define IMMU_CTXZERO_CONFIG_PS1		0x101

	setx	IMMU_CTXZERO_CONFIG_PS1, %l0, %l1
	stxa	%l1,	[%g0] 0x3f

	ta	T_CHANGE_NONHPRIV
	nop

	mov	0x0,	%l0
	mov	0x1,	%l1
	call immu_ptr_test
	nop

tc_2:
	/* change PS0 = 3, PS1=3 */
	ta	T_CHANGE_HPRIV
	nop

#define IMMU_CTXZERO_CONFIG_PS2		0x303

	setx	IMMU_CTXZERO_CONFIG_PS2, %l0, %l1
	stxa	%l1,	[%g0] 0x3f

	ta	T_CHANGE_NONHPRIV
	nop

	mov	0x0,	%l0
	mov	0x1,	%l1
	call immu_ptr_test
	nop

tc_3:
	/* change PS0 = 5, PS1=5 */
	ta	T_CHANGE_HPRIV
	nop

#define IMMU_CTXZERO_CONFIG_PS3		0x505

	setx	IMMU_CTXZERO_CONFIG_PS3, %l0, %l1
	stxa	%l1,	[%g0] 0x3f

	ta	T_CHANGE_NONHPRIV
	nop

	mov	0x0,	%l0
	mov	0x1,	%l1
	call immu_ptr_test
	nop

diag_pass:
	ta	T_GOOD_TRAP
	nop

/*
 ********************************
 * test the IMMU ptrs
 ********************************
 */
.global immu_ptr_test

immu_ptr_test:
	save

#define ITSB_BASE0      0xffffaaaaaaaa8000      /* VA[48] = 1 */
#define ITSB_BASE1      0xffff8aaaaaaae000      /* VA[48] = 1 */
#define ITSB_BASE2      0x000045555555a000      /* VA[48] = 0 */
#define ITSB_BASE3      0xffffffffffff2000      /* VA[48] = 1 */
#define ITSB_BASE4      0x00007a5a5a5a4000      /* VA[48] = 0 */
#define ITSB_BASE5      0xfffff8fafafa8000      /* VA[48] = 1 */
#define ITSB_BASE6      0x00007fffffffe000      /* VA[48] = 0 */
#define ITSB_BASE7      0xffffa89a5ffaa000      /* VA[48] = 1 */


	mov	0x0,	%l0
itsb_0:
	/*
	 ***************************************
	 * split = 0 , itsb_size = 4'b1000
	 ***************************************
	 */
	mov	0x1,	%o0	/* test case 1 */
	setx	ITSB_BASE0,	%l0,	%l1
	add	%l1,	0x8,	%l1	/* TSB_size = 4'b1000 */

	call	itsb_test
	nop

itsb_1:
	/*
	 ***************************************
	 * split = 0 , itsb_size = 4'b1001
	 ***************************************
	 */
	mov	0x1,	%o0	/* test case 1 */
	setx	ITSB_BASE1,	%l0,	%l1
	add	%l1,	0x9,	%l1	/* TSB_size = 4'b1001 */

	call	itsb_test
	nop

itsb_2:
        /*
         ***************************************
         * split = 0 , itsb_size = 4'b1010
         ***************************************
         */
        mov     0x2,    %o0     /* test case 2 */
        setx    ITSB_BASE2,     %l0,    %l1
        add     %l1,    0xa,    %l1     /* TSB_size = 4'b1010 */

        call    itsb_test
        nop

itsb_3:
        /*
         ***************************************
         * split = 0 , itsb_size = 4'b1011
         ***************************************
         */
        mov     0x3,    %o0     /* test case 3 */
        setx    ITSB_BASE3,     %l0,    %l1
        add     %l1,    0xb,    %l1     /* TSB_size = 4'b1011 */

        call    itsb_test
        nop

itsb_4:
        /*
         ***************************************
         * split = 0 , itsb_size = 4'b1100
         ***************************************
         */
        mov     0x4,    %o0     /* test case 4 */
        setx    ITSB_BASE4,     %l0,    %l1
        add     %l1,    0xc,    %l1     /* TSB_size = 4'b1100 */

        call    itsb_test
        nop

itsb_5:
        /*
         ***************************************
         * split = 0 , itsb_size = 4'b1101
         ***************************************
         */
        mov     0x5,    %o0     /* test case 5 */
        setx    ITSB_BASE5,     %l0,    %l1
        add     %l1,    0xd,    %l1     /* TSB_size = 4'b1101 */

        call    itsb_test
        nop

itsb_6:
        /*
         ***************************************
         * split = 0 , itsb_size = 4'b1110
         ***************************************
         */
        mov     0x6,    %o0     /* test case 6 */
        setx    ITSB_BASE6,     %l0,    %l1
        add     %l1,    0xe,    %l1     /* TSB_size = 4'b1110 */

        call    itsb_test
        nop

itsb_7:
        /*
         ***************************************
         * split = 0 , itsb_size = 4'b1111
         ***************************************
         */
        mov     0x7,    %o0     /* test case 7 */
        setx    ITSB_BASE7,     %l0,    %l1
        add     %l1,    0xf,    %l1     /* TSB_size = 4'b1111 */

        call    itsb_test
        nop

	mov	0x0,	%l0
itsb_8:
	/*
	 ***************************************
	 * split = 1 , itsb_size = 4'b1001
	 ***************************************
	 */
	mov	0x8,	%o0	/* test case 8 */
	setx	ITSB_BASE1,	%l0,	%l1
	add	%l1,	0x8,	%l1	/* TSB_size = 4'b1000 */
	set	0x1000,	%l3
	or	%l3,	%l1,	%l1	

	call	itsb_test
	nop

itsb_9:
	/*
	 ***************************************
	 * split = 1 , itsb_size = 4'b1001
	 ***************************************
	 */
	mov	0x8,	%o0	/* test case 8 */
	setx	ITSB_BASE1,	%l0,	%l1
	add	%l1,	0x9,	%l1	/* TSB_size = 4'b1001 */
	set	0x1000,	%l3
	or	%l3,	%l1,	%l1	

	call	itsb_test
	nop

itsb_10:
        /*
         ***************************************
         * split = 1 , itsb_size = 4'b1010
         ***************************************
         */
        mov     0x9,    %o0     /* test case 9 */
        setx    ITSB_BASE2,     %l0,    %l1
        add     %l1,    0xa,    %l1     /* TSB_size = 4'b1010 */
        set     0x1000, %l3
        or     %l3,    %l1,    %l1

        call    itsb_test
        nop

itsb_11:
        /*
         ***************************************
         * split = 1 , itsb_size = 4'b1011
         ***************************************
         */
        mov     0xa,    %o0     /* test case 10 */
        setx    ITSB_BASE3,     %l0,    %l1
        add     %l1,    0xb,    %l1     /* TSB_size = 4'b1011 */
        set     0x1000, %l3
        or     %l3,    %l1,    %l1

        call    itsb_test
        nop

itsb_12:
        /*
         ***************************************
         * split = 1 , itsb_size = 4'b1100
         ***************************************
         */
        mov     0xb,    %o0     /* test case 11 */
        setx    ITSB_BASE4,     %l0,    %l1
        add     %l1,    0xc,    %l1     /* TSB_size = 4'b1100 */
        set     0x1000, %l3
        or     %l3,    %l1,    %l1

        call    itsb_test
        nop

itsb_13:
        /*
         ***************************************
         * split = 1 , itsb_size = 4'b1101
         ***************************************
         */
        mov     0xc,    %o0     /* test case 12 */
        setx    ITSB_BASE5,     %l0,    %l1
        add     %l1,    0xd,    %l1     /* TSB_size = 4'b1101 */
        set     0x1000, %l3
        or     %l3,    %l1,    %l1

        call    itsb_test
        nop

itsb_14:
        /*
         ***************************************
         * split = 1 , itsb_size = 4'b1110
         ***************************************
         */
        mov     0xd,    %o0     /* test case 13 */
        setx    ITSB_BASE6,     %l0,    %l1
        add     %l1,    0xe,    %l1     /* TSB_size = 4'b1110 */
        set     0x1000, %l3
        or     %l3,    %l1,    %l1

        call    itsb_test
        nop

itsb_15:
        /*
         ***************************************
         * split = 1 , itsb_size = 4'b1111
         ***************************************
         */
        mov     0xe,    %o0     /* test case 14 */
        setx    ITSB_BASE7,     %l0,    %l1
        add     %l1,    0xf,    %l1     /* TSB_size = 4'b1111 */
        set     0x1000, %l3
        or     %l3,    %l1,    %l1

        call    itsb_test
        nop

	restore

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
itsb_test:

#define         VA_MISS_ADDR1   0xffff800000000000
#define         VA_MISS_ADDR2   0x00007ffffffffff4
#define         VA_MISS_ADDR3   0xfffffffffffffff8
#define         VA_MISS_ADDR4   0xffffaaaaaaaaaaac
#define         VA_MISS_ADDR5   0x0000555555555554
#define         VA_MISS_ADDR6   0x00005555aaaa5558

	add	%o7,	0x0,	%l7

	mov	0x0,	%o0

	ta	T_CHANGE_HPRIV
	nop
	/* 
	 **********************************************
	 * split = 0,1;  itsb_size 4'b1001 ~ 4'b1111 
	 **********************************************
	 */
	mov	0x0,	%o6
	stxa	%l1,	[%o6] 0x3d	/* change IMMU_CTX_ZERO_TSB_BASE_PS0 reg */
	stxa	%l1,	[%o6] 0x3e	/* change IMMU_CTX_ZERO_TSB_BASE_PS1 reg */
	ldxa	[%o6] 0x3d,	%l4	/* cross-check with RTL */
	ldxa	[%o6] 0x3e,	%l3	/* cross-check with RTL */

	ta	T_CHANGE_NONHPRIV
	nop

        /* generate DMISS trap */
        mov     0x1,    %o0             /* o0 non-zero, go to check ptr in Dmmu_miss */
        setx    VA_MISS_ADDR1,  %l0,    %l3
	setx	jback_0,	%l0,	%l6
        jmpl	%l3,	%l0
	nop

jback_0:
        /* generate DMISS trap */
        mov     0x55,   %l4
        setx    VA_MISS_ADDR2,  %l0,    %l3
	setx	jback_1,	%l0,	%l6	/* RETURN PC ADDRESS */
        mov     0x1,    %o0             /* o0 non-zero, go to check ptr in Dmmu_miss */
        jmpl	%l3,	%l0
	nop

jback_1:
        /* generate DMISS trap */
        setx    VA_MISS_ADDR3, %l0,     %l3
        mov     0x1,    %o0             /* o0 non-zero, go to check ptr in Dmmu_miss */
	setx	jback_2,	%l0,	%l6	/* RETURN PC ADDRESS */
        jmpl	%l3,	%l0
	nop

jback_2:
        /* generate DMISS trap */
        mov     0xff,   %l4
        setx    VA_MISS_ADDR4,  %l0,    %l3
        mov     0x1,    %o0             /* o0 non-zero, go to check ptr in Dmmu_miss */
	setx	jback_3,	%l0,	%l6	/* RETURN PC ADDRESS */
        jmpl	%l3,	%l0
	nop

jback_3:
        /* generate DMISS trap */
        mov     0xff,   %l4
        setx    VA_MISS_ADDR5,  %l0,    %l3
        mov     0x1,    %o0             /* o0 non-zero, go to check ptr in Dmmu_miss */
	setx	jback_4,	%l0,	%l6	/* RETURN PC ADDRESS */
        jmpl	%l3,	%l0
	nop

jback_4:
        /* generate DMISS trap */
        mov     0xff,   %l4
        setx    VA_MISS_ADDR6,  %l0,    %l3
        mov     0x1,    %o0             /* o0 non-zero, go to check ptr in Dmmu_miss */
	setx	jback_5,	%l0,	%l6	/* RETURN PC ADDRESS */
        jmpl	%l3,	%l0
	nop

jback_5:
	nop

itsb_rtn:
	add	%l7,	0,	%o7
	retl
	nop

	
SECTION .USER_TRAP TEXT_VA=0x1600000
attr_text {
        Name = .USER_TRAP
	hypervisor
        }

.seg "text"
.align 0x100

.global T0_fast_immu_miss 

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
T0_fast_immu_miss:
        brnz    %o0,    imiss_traphdl
        nop     

immu_standard_trap:  
#include "immu_miss_handler.s"
#include "immu_miss_handler_ext.s"

imiss_traphdl:
        ldxa 	[%g0] 0x51, 	%g1    /* IMMU_TSB_PS0_PTR reg */
        ldxa 	[%g0] 0x52, 	%g2    /* IMMU_TSB_PS1_PTR reg */
        ldxa 	[%g0] 0x50, 	%g3    ! I-TSB tag target reg

	wrpr	%l6,	%tpc
	wrpr	%l6,	%tnpc
        done
        nop

.global local_daccess_excp_handler

local_daccess_excp_handler:
        ldxa    [%g0] 0x37,     %g1	/* IMMU ctx zero config reg */
        ldxa    [%g0] 0x3f,     %g2	/* IMMU ctx non-zero config reg */
	mov	0x18,	%g3
	ldxa	[%g3] 0x50,	%g4
        done
        nop

