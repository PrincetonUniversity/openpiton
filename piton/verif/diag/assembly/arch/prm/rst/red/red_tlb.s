// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: red_tlb.s
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

#define         ASI_IMMU_VA                     0x30
#define         ASI_IMMU                        0x50

#define         ASI_ITLB_DATA_ACCESS_REG_VA0    0x0
#define         ASI_ITLB_DATA_ACCESS_REG        0x55

#define         ASI_DTLB_DATA_ACCESS_REG_VA0    0x0
#define         ASI_DTLB_DATA_ACCESS_REG        0x5d

 
#define  My_Power_On_Reset setx   check,  %g2, %g1;  jmpl    %g1, %g0; nop 


.global check 

SECTION .RED_SEC0 TEXT_VA=0x3006000, DATA_VA=0x3008000

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

wr_tlbs:
        set     ASI_ITLB_DATA_ACCESS_REG_VA0, %g1
        set     ASI_DTLB_DATA_ACCESS_REG_VA0, %g2

        set     0x40, %g7

tlb_data_access_loop_wr:
        stxa    %g0, [%g1]ASI_ITLB_DATA_ACCESS_REG
        stxa    %g0, [%g2]ASI_DTLB_DATA_ACCESS_REG

        add     %g1, 0x8, %g1
        add     %g2, 0x8, %g2


        dec     %g7
        brnz,pt %g7, tlb_data_access_loop_wr
        nop

        membar  0x40

set_red:
        wrpr    0x5, %g0, %tl

        nop; nop;
        membar  0x40

        ta      0x0


red_loop:
        add %g1, 1, %g1
        cmp %g1, 100
        ble red_loop
        nop

        MY_FAIL
        nop

#define  My_RED_Mode_Other_Reset setx    red_tlb,  %g5, %g6; \
                           jmpl    %g6, %g0; nop



.global red_tlb 
red_tlb:
	set     ASI_ITLB_DATA_ACCESS_REG_VA0, %g1
	set     ASI_DTLB_DATA_ACCESS_REG_VA0, %g2

       	set     0x40, %g7

tlb_data_access_loop:
	ldxa    [%g1]ASI_ITLB_DATA_ACCESS_REG, %g3

itlb_check:
        setx    0x800000000000, %i5, %o5
        sub     %o5, %g3, %g6
        brnz    %g6, bad_end
        nop

dtlb:
        ldxa    [%g2]ASI_DTLB_DATA_ACCESS_REG, %g4

dtlb_check:
        setx    0x800000000000, %i5, %o5
        sub     %o5, %g4, %g6
        brnz    %g6, bad_end
        nop

        add     %g1, 0x8, %g1
	add     %g2, 0x8, %g2


        dec     %g7
        brnz,pt %g7, tlb_data_access_loop 
        nop

	
	MY_PASS


bad_end:
	MY_FAIL

good_end:
	MY_PASS

#include "boot.s"

.text
.global main
main:
    MY_FAIL



