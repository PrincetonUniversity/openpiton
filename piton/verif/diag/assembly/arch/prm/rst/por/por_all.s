// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: por_all.s
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
/***********************************************************************
 * Name:   
 * Date:   
 *
 * Description:
 *
 **********************************************************************/

#define MY_PASS setx 0x82000, %r1, %r2; jmp %r2;nop
#define MY_FAIL setx 0x82020, %r1, %r2; jmp %r2;nop

#include "err_defines.h"

#define 	ASI_LSU_CTL_REG 		0x45
#define 	ASI_SPARC_ERROR_EN_REG 		0x4b
#define  	L2_BANK_ADDR       		0x40
#define 	ASI_IMMU_VA			0x30
#define         ASI_IMMU     			0x50 
#define		ASI_ITLB_DATA_ACCESS_REG_VA0	0x0 
#define         ASI_ITLB_DATA_ACCESS_REG    	0x55


#define  My_Power_On_Reset rd      %pc, %g1; \
                           rd      %pc, %g2; \
                           setx    rstv,  %g5, %g6; \
                           jmpl    %g6, %g0; nop 


.global  rstv 

SECTION .RED_SEC0 TEXT_VA=0x3006000, DATA_VA=0x3008000

attr_text {
        Name=.RED_SEC0,
        hypervisor
}

attr_data {
        Name=.RED_SEC0,
        hypervisor
}


rstv:
#ifdef FAST_BOOT
	setx	0x40020, %g5, %g3
#else
	setx	0xfffffffff0000020, %g5, %g3
#endif
        sub     %g1, %g3, %g4
        brnz    %g4, bad_end
        nop	

	add	%g3, 4, %g3
        sub     %g2, %g3, %g4
        brnz    %g4, bad_end
        nop

pstate:
        rdpr    %pstate, %g1
        setx    0x14, %g3, %g2
        sub     %g1, %g2, %g3
        brnz    %g3, bad_end
        nop

hpstate:
        rdhpr    %hpstate, %g1
        setx    0x24, %g3, %g2
        sub     %g1, %g2, %g3
        brnz    %g3, bad_end
        nop


        ! Trap Type Reg.
tt:
        rdpr    %tt, %g1
        set     0x1, %g2
        sub     %g1, %g2, %g3
        brnz    %g3, bad_end
        nop

	!tl = MAXTL = 6
tl:
        rdpr    %tl, %g1
        set     0x6, %g2
        sub     %g1, %g2, %g3
        brnz    %g3, bad_end
        nop

        !gl = MAXGL = 3
gl:
        rdpr    %gl, %g1
        set     0x3, %g2
        sub     %g1, %g2, %g3
        brnz    %g3, bad_end
        nop

ver:
        rdhpr   %ver, %g1
        setx    0x003e002321030607, %g7, %g5
        sub     %g5, %g1, %g3
        brnz    %g3, bad_end
        nop

        ! Tick Reg.
        ! Only the NPT bit can be checked since
        ! after reset the reg. is constantly being incremented
/*
tick_comp:
        rd  	%tick_cmpr, %g2 
        set     1, %g3
        sllx    %g3, 63, %g3
        and     %g2, %g3, %g2
        brz     %g2, bad_end
        nop
*/

lsu_cntl_reg:
	ldxa	[%g0]ASI_LSU_CTL_REG, %g1
	sub     %g1, %g0, %g3
        brnz    %g3, bad_end
        nop

sparc_ee_reg:
        ldxa    [%g0]ASI_SPARC_ERROR_EN_REG, %g1
        sub     %g1, %g0, %g3
        brnz    %g3, bad_end
        nop

l2_ee_reg0_00:
        setx    L2EE_PA0, %l0, %g1
        ldx     [%g1], %g2
        sub     %g2, %g0, %g3
        brnz    %g3, bad_end
        nop
l2_ee_reg0_40:
  	add   	%g1, L2_BANK_ADDR, %g1
	ldx   	[%g1], %g2
        sub    	%g2, %g0, %g3
        brnz    %g3, bad_end
        nop
l2_ee_reg0_80:
        add     %g1, L2_BANK_ADDR, %g1
        ldx     [%g1], %g2
        sub     %g2, %g0, %g3
        brnz    %g3, bad_end
        nop
l2_ee_reg0_c0:
        add     %g1, L2_BANK_ADDR, %g1
        ldx     [%g1], %g2
        sub     %g2, %g0, %g3
        brnz    %g3, bad_end
        nop
	
l2_ee_reg1_00:
        setx    L2EE_PA1, %l0, %g1
        ldx     [%g1], %g2
        sub     %g2, %g0, %g3
        brnz    %g3, bad_end
        nop
l2_ee_reg1_40:
        add     %g1, L2_BANK_ADDR, %g1
        ldx     [%g1], %g2
        sub     %g2, %g0, %g3
        brnz    %g3, bad_end
        nop
l2_ee_reg1_80:
        add     %g1, L2_BANK_ADDR, %g1
        ldx     [%g1], %g2
        sub     %g2, %g0, %g3
        brnz    %g3, bad_end
        nop
l2_ee_reg1_c0:
        add     %g1, L2_BANK_ADDR, %g1
        ldx     [%g1], %g2
        sub     %g2, %g0, %g3
        brnz    %g3, bad_end
        nop

fsr:
        wr      %g0, 0x4, %fprs			! cler fprs as it causes x
        set     red_data, %g7
        stx     %fsr, [%g7]
        ldx     [%g7], %g1
        sub     %g1, %g0, %g4
        brnz    %g4, bad_end
        nop


	
	MY_PASS


bad_end:
	MY_FAIL

good_end:
	MY_PASS

.data
red_data:
        .word 0x5aaaaaaa, 0x5aaaaaaa
        .word 0x00000000, 0x00000000

#include "boot.s"

.text
.global main
main:
    MY_FAIL



