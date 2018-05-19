// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: xir_err_en.s
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
 * Name:        xir_err_en.s
 * Date:        Nov, 2003

 * Description:

     After POR, diag writes to the folloowing registers;
     causes WDR; then checks the value:
	SPARC_ERR_EN_REG
	L2_ERR_EN_REG

        Specifically to the L2 Error Enable Register (addr[39:32] =
8'haa or 8'hba), only bits[2:0] are writable while the rest are always
0: {61'b0, debug_trig_en, UE_en, CE_en}.

        Thanks.

melvyn

err_defines.h    L2EE_PA0               0xAA00000000
err_defines.h    L2EE_PA1               0xBA00000000


 **********************************************************************/

#define MY_PASS setx 0x82000, %r1, %r2; jmp %r2;nop
#define MY_FAIL setx 0x82020, %r1, %r2; jmp %r2;nop

#include "err_defines.h"

#define ASI_LSU_CTL_REG 0x45
#define ASI_SPARC_ERROR_EN_REG 0x4b
#define  L2_BANK_ADDR       0x40

#define  My_Power_On_Reset setx check,  %g2, %g1;  jmpl    %g1, %g0; nop 

.global check 

SECTION .RED_SEC0 TEXT_VA=3006000, DATA_VA=3008000

attr_text {
        Name=.RED_SEC0,
        hypervisor
}

attr_data {
        Name=.RED_SEC0,
        hypervisor
}


check:
	nop
	wr  %g0, 0, %ccr
	wr  %g0, 0, %asi
        wrpr    %g0, 0, %cwp
	clr %g6

sparc_ee_reg:
	setx	0xffffffffffffffff, %i5, %i1
        stxa    %i1, [%g0] ASI_SPARC_ERROR_EN_REG
	membar	0x40

l2_ee_reg0_00:
        setx    0xffffffffffffffff, %i5, %i1
        setx    L2EE_PA0, %l0, %i0
        stx     %i1, [%i0]

l2_ee_reg0_40:
        add     %i0, L2_BANK_ADDR, %i0
        stx     %i1, [%i0]

l2_ee_reg0_80:
        add     %i0, L2_BANK_ADDR, %i0
        stx     %i1, [%i0]

l2_ee_reg0_c0:
        add     %i0, L2_BANK_ADDR, %i0
        stx     %i1, [%i0]

l2_ee_reg1_00:
        setx    L2EE_PA1, %l0, %i0
        stx     %i1, [%i0]

l2_ee_reg1_40:
        add     %i0, L2_BANK_ADDR, %i0
        stx     %i1, [%i0]

l2_ee_reg1_80:
        add     %i0, L2_BANK_ADDR, %i0
        stx     %i1, [%i0]

l2_ee_reg1_c0:
        add     %i0, L2_BANK_ADDR, %i0
        stx     %i1, [%i0]

set_xir:
        setx    0x9800000800, %i0, %i1  ! PA of INT_VEC_DIS
        setx    0x0000010003, %i0, %i2  ! type=reset traptype=POR

        stx     %i2, [%i1]

xir_loop:
        add %g0, 1, %o1
        cmp %o1, 100
        ble xir_loop
        nop

        MY_FAIL
        nop


#define  My_External_Reset setx    ee,  %o5, %o6; \
                           jmpl    %o6, %g0; nop


.global ee 
ee:
        nop
sparc_ee_reg_ch:
        ldxa    [%g0]ASI_SPARC_ERROR_EN_REG, %g1
        sub     %g1, 0x3, %g3
        brnz    %g3, bad_end
        nop

l2_ee_reg0_00_ch:
        setx    L2EE_PA0, %l0, %g1
        ldx     [%g1], %g2
        sub     %g2, 0x7, %g3
        brnz    %g3, bad_end
        nop
l2_ee_reg0_40_ch:
        add     %g1, L2_BANK_ADDR, %g1
        ldx     [%g1], %g2
        sub     %g2, 0x7, %g3
        brnz    %g3, bad_end
        nop
l2_ee_reg0_80_ch:
        add     %g1, L2_BANK_ADDR, %g1
        ldx     [%g1], %g2
        sub     %g2, 0x7, %g3
        brnz    %g3, bad_end
        nop
l2_ee_reg0_c0_ch:
        add     %g1, L2_BANK_ADDR, %g1
        ldx     [%g1], %g2
        sub     %g2, 0x7, %g3
        brnz    %g3, bad_end
        nop

l2_ee_reg1_00_ch:
        setx    L2EE_PA1, %l0, %g1
        ldx     [%g1], %g2
        sub     %g2, 0x7, %g3
        brnz    %g3, bad_end
        nop
l2_ee_reg1_40_ch:
        add     %g1, L2_BANK_ADDR, %g1
        ldx     [%g1], %g2
        sub     %g2, 0x7, %g3
        brnz    %g3, bad_end
        nop
l2_ee_reg1_80_ch:
        add     %g1, L2_BANK_ADDR, %g1
        ldx     [%g1], %g2
        sub     %g2, 0x7, %g3
        brnz    %g3, bad_end
        nop
l2_ee_reg1_c0_ch:
        add     %g1, L2_BANK_ADDR, %g1
        ldx     [%g1], %g2
        sub     %g2, 0x7, %g3
        brnz    %g3, bad_end
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

temp_data:
        .word 0x00000000, 0x00000000


#include "boot.s"

.text
.global main
main:
    MY_FAIL


