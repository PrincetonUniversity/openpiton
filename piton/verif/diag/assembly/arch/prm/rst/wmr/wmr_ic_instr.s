// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: wmr_ic_instr.s
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
 * Name:  	red_ic_instr.s 
 * Date:  	Nov, 2003 
 *
 * Description:
	Checks ASI_ICACHE_INSTR after reset
	Writes all ONES to the register
	after POR; causes RED_Reset; then reads and checks
	the values. Should be all ONEs ; except the RSVD
	fields and also need to check Parity bit properly 


 **********************************************************************/

#define MY_PASS setx 0x82000, %r1, %r2; jmp %r2;nop
#define MY_FAIL setx 0x82020, %r1, %r2; jmp %r2;nop

#include "err_defines.h"
#include "defines.h"

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

check_wmr:
        setx    0x9800000810, %i5, %i1
        ldx     [%i1], %i2
        setx    0xfffffffffffffffd, %i5, %o1 ! <1> = WMR
        or      %i2, %o1, %o2
        setx    0xffffffffffffffff, %i5, %o1
        cmp     %o2, %o1
        be      wmr
        nop

ic_tag:
	setx    0xffffffffffffffff, %i5, %i1
	set	0x0, %g1
 	stxa	%i1, [%g1]ASI_ICACHE_INSTR

	add	%g1, 0x40, %g1
	stxa    %i1, [%g1]ASI_ICACHE_INSTR

	set	0x3FF8,	%g1
	stxa    %i1, [%g1]ASI_ICACHE_INSTR
	membar	0x40

parity_0:
        setx    0xfffffffeffffffff, %i5, %i1	!PARITY=0
        set     0x1000, %g1    
        stxa    %i1, [%g1]ASI_ICACHE_INSTR

        set     0x1100, %g1    
        stxa    %i1, [%g1]ASI_ICACHE_INSTR

        set     0x1500, %g1
        stxa    %i1, [%g1]ASI_ICACHE_INSTR
        membar  0x40

switch_0:
        setx    0xfffffffdffffffff, %i5, %i1    !PARITY=0
        set     0x1600, %g1
        stxa    %i1, [%g1]ASI_ICACHE_INSTR

        set     0x1700, %g1
        stxa    %i1, [%g1]ASI_ICACHE_INSTR

        set     0x1800, %g1
        stxa    %i1, [%g1]ASI_ICACHE_INSTR
        membar  0x40

gen_wrm_rst:
        nop !$EV  trig_pc_d(1, @VA(.RED_SEC0.gen_wrm_rst)) -> warmrst()
        nop
        nop

wmr_loop:
        add %g0, 1, %o1
        cmp %o1, 100
        ble wmr_loop
        nop

        MY_FAIL
        nop


wmr:
        setx    0x2ffffffff, %i5, %g3

	set	0x0, %g1
	ldxa	[%g1]ASI_ICACHE_INSTR, %g2
        sub     %g2, %g3, %g4
        brnz    %g4, bad_end
        nop

	add	%g1, 0x40, %g1
        ldxa    [%g1]ASI_ICACHE_INSTR, %g2
        sub     %g2, %g3, %g4
        brnz    %g4, bad_end
        nop

        set     0x3FF8, %g1
        ldxa    [%g1]ASI_ICACHE_INSTR, %g2
        sub     %g2, %g3, %g4
        brnz    %g4, bad_end
        nop

parity_0_ch:
        setx    0x3ffffffff, %i5, %g3

        set     0x1000, %g1
        ldxa    [%g1]ASI_ICACHE_INSTR, %g2
        sub     %g2, %g3, %g4
        brnz    %g4, bad_end
        nop

        set     0x1100, %g1
        ldxa    [%g1]ASI_ICACHE_INSTR, %g2
        sub     %g2, %g3, %g4
        brnz    %g4, bad_end
        nop

        set     0x1500, %g1
        ldxa    [%g1]ASI_ICACHE_INSTR, %g2
        sub     %g2, %g3, %g4
        brnz    %g4, bad_end
        nop

switch_0_ch:
        setx    0x2ffffffff, %i5, %g3

        set     0x1600, %g1
        ldxa    [%g1]ASI_ICACHE_INSTR, %g2
        sub     %g2, %g3, %g4
        brnz    %g4, bad_end
        nop

        set     0x1700, %g1
        ldxa    [%g1]ASI_ICACHE_INSTR, %g2
        sub     %g2, %g3, %g4
        brnz    %g4, bad_end
        nop

        set     0x1800, %g1
        ldxa    [%g1]ASI_ICACHE_INSTR, %g2
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


