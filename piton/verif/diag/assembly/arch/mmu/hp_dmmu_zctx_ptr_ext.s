// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: hp_dmmu_zctx_ptr_ext.s
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
!!		we need to setup different TSB size for DMMU.
!!		
!!		During the boot code, we still use standard MMU trap handler 
!!		to handle the page fault. After entering the user code, we 
!!		use customized trap handler to check the caculated 8K pointer
!!		and 64k pointer, after settup the size bits in TSB register.
!!
!!		Diag covers :

		DMMU && Context = 0 :
		============================
                        TSB register :
                                a. split = 0
                                        1.      TSB_Size =  4'b1000
                                        2.      TSB_Size =  4'b1001
                                        3.      TSB_Size =  4'b1010
                                                .......
                                        8.     TSB_Size = 4'b1111

                                b. split = 1
                                        1. TSB_Size =  3'b1000
                                        2. TSB_Size =  3'b1001
                                        3. TSB_Size =  3'b1010
                                        4. TSB_Size =  3'b1011
                                                ......
                                        8.     TSB_Size = 4'b1111

					
!!	
!!	ps0[2:0] can be : 
			0 -- 8k; 1 -- 64k; 3 -- 4Mb; 5 -- 256Mb.
!!	
!!
!! asi_dmmu_tsb_ps0_ptr_reg :
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
!! asi_dmmu_tsb_ps1_ptr_reg :
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

#define H_HT0_fast_data_access_MMU_miss		T0_fast_dmmu_miss
#define H_T0_Division_By_Zero			local_dividezero_handler
#define	H_HT0_Data_Access_Exception_0x30 	local_daccess_excp_handler

#define MAIN_PAGE_HV_ALSO

#include "boot.s"

.text

.global main

main:
	mov	0x0,	%l0
	mov	0x1,	%l1

	ta	T_CHANGE_HPRIV
	nop
wr_itte1:
#define TAG_ACCESS1     0x00000000001b0000
#define DATA_IN1        0x80000000001b0003
         setx   TAG_ACCESS1,  %l0, %g4
         setx   DATA_IN1, %l0, %g5
        mov  0x30, %g3
        stxa  %g4, [ %g3 ] 0x50
        stxa  %g5, [ %g0 ] 0x54

	ta	T_CHANGE_NONHPRIV
	nop

tc_0:
	/* use default PS0 config & PS1 config */
	udiv	%l1,	%l0,	%l3	/* this will trap to supervisor mode */
	nop

tc_1:
	/* change PS0 = 1, PS1=1 */
	ta	T_CHANGE_HPRIV
	nop

#define DMMU_CTXZERO_CONFIG_PS1		(1<<8 |1)

	setx	DMMU_CTXZERO_CONFIG_PS1, %l0, %l1
	stxa	%l1,	[%g0] 0x33

	ta	T_CHANGE_NONHPRIV
	nop

	mov	0x0,	%l0
	mov	0x1,	%l1
	udiv	%l1,	%l0,	%l3	/* this will trap to supervisor mode */
	nop

tc_2:
	/* change PS0 = 3, PS1=3 */
	ta	T_CHANGE_HPRIV
	nop

#define DMMU_CTXZERO_CONFIG_PS2		(3<<8 |3)

	setx	DMMU_CTXZERO_CONFIG_PS2, %l0, %l1
	stxa	%l1,	[%g0] 0x33

	ta	T_CHANGE_NONHPRIV
	nop

	mov	0x0,	%l0
	mov	0x1,	%l1
	udiv	%l1,	%l0,	%l3	/* this will trap to supervisor mode */
	nop

tc_3:
	/* change PS0 = 5, PS1=5 */
	ta	T_CHANGE_HPRIV
	nop

#define DMMU_CTXZERO_CONFIG_PS3		(5<<8 |5)

	setx	DMMU_CTXZERO_CONFIG_PS3, %l0, %l1
	stxa	%l1,	[%g0] 0x33

	ta	T_CHANGE_NONHPRIV
	nop

	mov	0x0,	%l0
	mov	0x1,	%l1
	udiv	%l1,	%l0,	%l3	/* this will trap to supervisor mode */
	nop

diag_pass:
	ta	T_GOOD_TRAP
	nop

/*
 ****************************************************	
 * local divide by zero handler 
 *	used to switch to Context 0
 ****************************************************	
 */
#define DIVZERO_PG_ADDR	0x1b0000

SECTION .USER_TRAP_PG	TEXT_VA = DIVZERO_PG_ADDR
attr_text {
 	NAME = .USER_TRAP_PG,
	hypervisor
}

.global local_dividezero_handler
local_dividezero_handler:

#define DTSB_BASE0      0xffffaaaaaaaa8000      /* VA[48] = 1 */
#define DTSB_BASE1      0xffff8aaaaaaac000      /* VA[48] = 1 */
#define DTSB_BASE2      0x0000455555558000      /* VA[48] = 0 */
#define DTSB_BASE3      0xffffffffffffc000      /* VA[48] = 1 */
#define DTSB_BASE4      0x00007a5a5a5a4000      /* VA[48] = 0 */
#define DTSB_BASE5      0xfffff8fafafa8000      /* VA[48] = 1 */
#define DTSB_BASE6      0x00007fffffffc000      /* VA[48] = 0 */
#define DTSB_BASE7      0xffffa89a5ffa8000      /* VA[48] = 1 */

	mov	0x0,	%l0
	mov	0x0,	%l1
dtsb_0:
	/*
	 ***************************************
	 * split = 0 , dtsb_size = 4'b1000
	 ***************************************
	 */
	mov	0x1,	%o0	/* test case 1 */
	setx	DTSB_BASE0,	%l0,	%l1
	add	%l1,	0x8,	%l1	/* TSB_size = 4'b1000 */

	call	dtsb_test
	nop

dtsb_1:
	/*
	 ***************************************
	 * split = 0 , dtsb_size = 4'b1001
	 ***************************************
	 */
	mov	0x1,	%o0	/* test case 1 */
	setx	DTSB_BASE1,	%l0,	%l1
	add	%l1,	0x9,	%l1	/* TSB_size = 4'b1001 */

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
        add     %l1,    0xa,    %l1     /* TSB_size = 3'b1010 */

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
        add     %l1,    0xb,    %l1     /* TSB_size = 3'b011 */

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
        add     %l1,    0xc,    %l1     /* TSB_size = 3'b100 */

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
        add     %l1,    0xd,    %l1     /* TSB_size = 3'b101 */

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
        add     %l1,    0xe,    %l1     /* TSB_size = 3'b110 */

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
        add     %l1,    0xf,    %l1     /* TSB_size = 3'b111 */

        call    dtsb_test
        nop

	mov	0x0,	%l0
dtsb_8:
	/*
	 ***************************************
	 * split = 1 , dtsb_size = 4'b1000
	 ***************************************
	 */
	mov	0x8,	%o0	/* test case 8 */
	setx	DTSB_BASE1,	%l0,	%l1
	add	%l1,	0x8,	%l1	/* TSB_size = 4'b1000 */
	set	0x1000,	%l3
	or	%l3,	%l1,	%l1	

	call	dtsb_test
	nop

dtsb_9:
	/*
	 ***************************************
	 * split = 1 , dtsb_size = 4'b1001
	 ***************************************
	 */
	mov	0x8,	%o0	/* test case 8 */
	setx	DTSB_BASE1,	%l0,	%l1
	add	%l1,	0x9,	%l1	/* TSB_size = 4'b1001 */
	set	0x1000,	%l3
	or	%l3,	%l1,	%l1	

	call	dtsb_test
	nop

dtsb_10:
        /*
         ***************************************
         * split = 1 , dtsb_size = 4'b1010
         ***************************************
         */
        mov     0x9,    %o0     /* test case 9 */
        setx    DTSB_BASE2,     %l0,    %l1
        add     %l1,    0xa,    %l1     /* TSB_size = 4'b1010 */
        set     0x1000, %l3
        or     %l3,    %l1,    %l1

        call    dtsb_test
        nop

dtsb_11:
        /*
         ***************************************
         * split = 1 , dtsb_size = 4'b1011
         ***************************************
         */
        mov     0xa,    %o0     /* test case 10 */
        setx    DTSB_BASE3,     %l0,    %l1
        add     %l1,    0xb,    %l1     /* TSB_size = 4'b1011 */
        set     0x1000, %l3
        or     %l3,    %l1,    %l1

        call    dtsb_test
        nop

dtsb_12:
        /*
         ***************************************
         * split = 1 , dtsb_size = 3'b100
         ***************************************
         */
        mov     0xb,    %o0     /* test case 11 */
        setx    DTSB_BASE4,     %l0,    %l1
        add     %l1,    0xc,    %l1     /* TSB_size = 4'b1100 */
        set     0x1000, %l3
        or     %l3,    %l1,    %l1

        call    dtsb_test
        nop

dtsb_13:
        /*
         ***************************************
         * split = 1 , dtsb_size = 3'b101
         ***************************************
         */
        mov     0xc,    %o0     /* test case 12 */
        setx    DTSB_BASE5,     %l0,    %l1
        add     %l1,    0xd,    %l1     /* TSB_size = 4'b1101 */
        set     0x1000, %l3
        or     %l3,    %l1,    %l1

        call    dtsb_test
        nop

dtsb_14:
        /*
         ***************************************
         * split = 1 , dtsb_size = 3'b110
         ***************************************
         */
        mov     0xd,    %o0     /* test case 13 */
        setx    DTSB_BASE6,     %l0,    %l1
        add     %l1,    0xe,    %l1     /* TSB_size = 4'b1110 */
        set     0x1000, %l3
        or     %l3,    %l1,    %l1

        call    dtsb_test
        nop

dtsb_15:
        /*
         ***************************************
         * split = 1 , dtsb_size = 3'b111
         ***************************************
         */
        mov     0xe,    %o0     /* test case 14 */
        setx    DTSB_BASE7,     %l0,    %l1
        add     %l1,    0xf,    %l1     /* TSB_size = 4'b1111 */
        set     0x1000, %l3
        or     %l3,    %l1,    %l1

        call    dtsb_test
        nop

	done
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

#define         VA_MISS_ADDR1   0xffff800000000000
#define         VA_MISS_ADDR2   0x00007fffffffffff
#define         VA_MISS_ADDR3   0xffffffffffffffff
#define         VA_MISS_ADDR4   0xffffaaaaaaaaaaaa
#define         VA_MISS_ADDR5   0x0000555555555555
#define         VA_MISS_ADDR6   0x00005555aaaa5555

	add	%o7,	0x0,	%l7

	mov	0x0,	%o0

	ta	T_CHANGE_HPRIV
	nop
	/* 
	 **********************************************
	 * split = 0,1;  dtsb_size 4'b1000 ~ 4'b1111 
	 **********************************************
	 */
	mov	0x0,	%o6
	stxa	%l1,	[%o6] 0x31	/* change DMMU_CTX_ZERO_TSB_BASE_PS0 reg */
	stxa	%l1,	[%o6] 0x32	/* change DMMU_CTX_ZERO_TSB_BASE_PS1 reg */
	ldxa	[%o6] 0x31,	%l4	/* cross-check with RTL */
	ldxa	[%o6] 0x32,	%l3	/* cross-check with RTL */

	ta	T_CHANGE_NONHPRIV
	nop

        /* generate DMISS trap */
        mov     0x1,    %o0             /* o0 non-zero, go to check ptr in Dmmu_miss */
        setx    VA_MISS_ADDR1,  %l0,    %l3
        ldub    [%l3],  %l4

        /* generate DMISS trap */
        mov     0x55,   %l4
        setx    VA_MISS_ADDR2,  %l0,    %l3
        mov     0x1,    %o0             /* o0 non-zero, go to check ptr in Dmmu_miss */
        stub    %l4,    [%l3]

        /* generate DMISS trap */
        setx    VA_MISS_ADDR3, %l0,     %l3
        mov     0x1,    %o0             /* o0 non-zero, go to check ptr in Dmmu_miss */
        ldub    [%l3],  %l4

        /* generate DMISS trap */
        mov     0xff,   %l4
        setx    VA_MISS_ADDR4,  %l0,    %l3
        mov     0x1,    %o0             /* o0 non-zero, go to check ptr in Dmmu_miss */
        stub    %l4,    [%l3]

        /* generate DMISS trap */
        mov     0xff,   %l4
        setx    VA_MISS_ADDR5,  %l0,    %l3
        mov     0x1,    %o0             /* o0 non-zero, go to check ptr in Dmmu_miss */
        stub    %l4,    [%l3]

        /* generate DMISS trap */
        mov     0xff,   %l4
        setx    VA_MISS_ADDR6,  %l0,    %l3
        mov     0x1,    %o0             /* o0 non-zero, go to check ptr in Dmmu_miss */
        stub    %l4,    [%l3]

dtsb_rtn:
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

.global T0_fast_dmmu_miss 
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
        ldxa 	[%g0] 0x5a, 	%g2    /* DMMU_TSB_PS1_PTR reg */
        ldxa 	[%g0] 0x58, 	%g3    ! D-TSB tag target reg
        done
        nop

.global local_daccess_excp_handler

local_daccess_excp_handler:
        ldxa    [%g0] 0x33,     %g1
        ldxa    [%g0] 0x3b,     %g2
	mov	0x18,	%g3
	ldxa	[%g3] 0x58,	%g4
        done
        nop

