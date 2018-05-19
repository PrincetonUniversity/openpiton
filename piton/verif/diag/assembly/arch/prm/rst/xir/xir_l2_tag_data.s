// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: xir_l2_tag_data.s
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


        Specifically to the L2 Error Enable Register (addr[39:32] =
8'haa or 8'hba), only bits[2:0] are writable while the rest are always
0: {61'b0, debug_trig_en, UE_en, CE_en}.

        Thanks.

melvyn

err_defines.h    L2_CSR_BASE_DATA0               0xAA00000000
err_defines.h    L2_CSR_BASE_DATA1               0xBA00000000


 **********************************************************************/

#define MY_PASS setx 0x82000, %r1, %r2; jmp %r2;nop
#define MY_FAIL setx 0x82020, %r1, %r2; jmp %r2;nop

#include "err_defines.h"

#define ASI_LSU_CTL_REG 0x45
#define ASI_SPARC_ERROR_EN_REG 0x4b
#define  L2_BANK_ADDR       0x40

#define L2_CSR_BASE_DATA_A_0	   0xA000000000
#define L2_CSR_BASE_DATA_A_1       0xA100000000
#define L2_CSR_BASE_DATA_A_2       0xA200000000
#define L2_CSR_BASE_DATA_A_3       0xA300000000

#define L2_CSR_BASE_DATA_B_0       0xB000000000
#define L2_CSR_BASE_DATA_B_1       0xB100000000
#define L2_CSR_BASE_DATA_B_2       0xB200000000
#define L2_CSR_BASE_DATA_B_3       0xB300000000


#define L2_CSR_BASE_TAG_A_0       0xA400000000
#define L2_CSR_BASE_TAG_A_1       0xA500000000

#define L2_CSR_BASE_TAG_B_0       0xB400000000
#define L2_CSR_BASE_TAG_B_1       0xB500000000


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

l2_data:
        setx    0xffffffffffffffff, %i5, %i1

        setx    L2_CSR_BASE_DATA_A_0, %l0, %i0
        stx     %i1, [%i0]

        setx    L2_CSR_BASE_DATA_A_1, %l0, %i0
        stx     %i1, [%i0]

        setx    L2_CSR_BASE_DATA_A_2, %l0, %i0
        stx     %i1, [%i0]

        setx    L2_CSR_BASE_DATA_A_3, %l0, %i0
        stx     %i1, [%i0]


        setx    L2_CSR_BASE_DATA_B_0, %l0, %i0
        stx     %i1, [%i0]

        setx    L2_CSR_BASE_DATA_B_1, %l0, %i0
        stx     %i1, [%i0]

        setx    L2_CSR_BASE_DATA_B_2, %l0, %i0
        stx     %i1, [%i0]

        setx    L2_CSR_BASE_DATA_B_3, %l0, %i0
        stx     %i1, [%i0]

l2_tag:
        setx    0xffffffffffffffff, %i5, %i1

        setx    L2_CSR_BASE_TAG_A_0, %l0, %i0
        stx     %i1, [%i0]

        setx    L2_CSR_BASE_TAG_A_1, %l0, %i0
        stx     %i1, [%i0]


        setx    L2_CSR_BASE_TAG_B_0, %l0, %i0
        stx     %i1, [%i0]

        setx    L2_CSR_BASE_TAG_B_1, %l0, %i0
        stx     %i1, [%i0]

	setx    L2_CSR_BASE_TAG_A_0, %l0, %i0
	membar	0x40


set_xir:
        setx    0x9800000800, %i0, %i1  ! PA of INT_VEC_DIS
        setx    0x0000010003, %i0, %i2  ! type=reset traptype=XIR

        stx     %i2, [%i1]

xir_loop:
        add %g0, 1, %o1
        cmp %o1, 100
        ble xir_loop
        nop

        MY_FAIL
        nop


#define  My_External_Reset setx    l2,  %o5, %o6; \
                           jmpl    %o6, %g0; nop


.global l2 
l2:
	nop

l2_data_A_0:
        setx    L2_CSR_BASE_DATA_A_0, %l0, %g1
	setx	0x7fffffffff, %i5, %g2
        ldx     [%g1], %g3
        sub     %g2, %g3, %g4
        brnz    %g4, bad_end
        nop

l2_data_A_1:
        setx    L2_CSR_BASE_DATA_A_1, %l0, %g1
        ldx     [%g1], %g3
        sub     %g2, %g3, %g4
        brnz    %g4, bad_end
        nop

l2_data_A_2:
        setx    L2_CSR_BASE_DATA_A_2, %l0, %g1
        ldx     [%g1], %g3
        sub     %g2, %g3, %g4
        brnz    %g4, bad_end
        nop

l2_data_A_3:
        setx    L2_CSR_BASE_DATA_A_3, %l0, %g1
        ldx     [%g1], %g3
        sub     %g2, %g3, %g4
        brnz    %g4, bad_end
        nop


l2_data_B_0:
        setx    L2_CSR_BASE_DATA_B_0, %l0, %g1
        ldx     [%g1], %g3
        sub     %g2, %g3, %g4
        brnz    %g4, bad_end
        nop

l2_data_B_1:
        setx    L2_CSR_BASE_DATA_B_1, %l0, %g1
        ldx     [%g1], %g3
        sub     %g2, %g3, %g4
        brnz    %g4, bad_end
        nop

l2_data_B_2:
        setx    L2_CSR_BASE_DATA_B_2, %l0, %g1
        ldx     [%g1], %g3
        sub     %g2, %g3, %g4
        brnz    %g4, bad_end
        nop

l2_data_B_3:
        setx    L2_CSR_BASE_DATA_B_3, %l0, %g1
        ldx     [%g1], %g3
        sub     %g2, %g3, %g4
        brnz    %g4, bad_end
        nop


l2_tag_A_0:
	set    	0xfffffff, %g2
        setx    L2_CSR_BASE_TAG_A_0, %l0, %g1
        ldx     [%g1], %g3
        sub     %g2, %g3, %g4
        brnz    %g4, bad_end
        nop

l2_tag_A_1:
        setx    L2_CSR_BASE_TAG_A_1, %l0, %g1
        ldx     [%g1], %g3
        sub     %g2, %g3, %g4
        brnz    %g4, bad_end
        nop

l2_tag_B_0:
        setx    L2_CSR_BASE_TAG_B_0, %l0, %g1
        ldx     [%g1], %g3
        sub     %g2, %g3, %g4
        brnz    %g4, bad_end
        nop

l2_tag_B_1:
        setx    L2_CSR_BASE_TAG_B_1, %l0, %g1
        ldx     [%g1], %g3
        sub     %g2, %g3, %g4
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

temp_data:
        .word 0x00000000, 0x00000000


#include "boot.s"

.text
.global main
main:
    MY_FAIL


