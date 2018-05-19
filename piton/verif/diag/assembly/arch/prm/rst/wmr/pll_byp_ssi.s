// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: pll_byp_ssi.s
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
#include "defines.h"

.SECTION .RED_SEC

SECTION .RED_SEC TEXT_VA=0xfffffffff0000000, DATA_VA=0xfffffffff0010000
attr_text {
        Name=.RED_SEC,
        hypervisor
}
attr_data {
        Name=.RED_SEC,
        hypervisor
}

.text
RESERVED_0: !Should not come here
        nop
        nop
        nop
        nop
        nop
        nop
        nop
        nop

Power_On_Reset:
        wrpr    %g0, 0, %cwp

check_wmr:
        setx    0x9800000810, %i5, %i1
        ldx     [%i1], %i2
        setx    0xfffffffffffffff7, %i5, %o1 ! <1> = FREQ
        or      %i2, %o1, %o2
        setx    0xffffffffffffffff, %i5, %o1
        cmp     %o2, %o1
        be      wmr
        nop

change_regs_values:
        setx    0x9600000000, %g1, %g2
        ! Update CLK_JSYNC creg
        setx    CREGS_CLK_JSYNC, %g1, %g3
        stx     %g3, [%g2 + 0x28]

        ! Update CLK_DSYNC creg
        setx    CREGS_CLK_DSYNC, %g1, %g3
        stx     %g3, [%g2 + 0x30]

        ! Update CLK_DIV
        setx    CREGS_CLK_DIV, %g1, %g3
        stx     %g3, [%g2]
        ldx     [%g2], %g1 ! make sure store is completed before yanking reset
        cmp     %g1, %g3
        bne     bad_trap
	nop

gen_wrm_rst:
        nop !$EV  trig_pc_d(1, @VA(.RED_SEC.gen_wrm_rst)) -> warmrst()
        nop
        nop

wmr_loop:
        add %g0, 1, %o1
        cmp %o1, 100
        ble wmr_loop
        nop

wmr:

	ba good_trap
	nop

bad_trap:
        b bad_trap; nop;nop;nop;nop;nop;nop;nop
	nop


good_trap:
	rd %asr26, %g1; wr %g1, 0x1, %asr26; nop; b good_trap;nop;nop;nop;nop

