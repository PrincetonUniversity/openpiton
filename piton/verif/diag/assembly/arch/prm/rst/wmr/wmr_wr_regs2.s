// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: wmr_wr_regs2.s
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
 * name:        red_wr_regs2.s
 * Date:        Nov, 2003
 *
 * Description:

     After POR, diag writes to the folloowing registers;
     causes RED_Reset; then checks the value:

        priviliged
        -----------
	tpc
	tnpc	
	tt
	tl
	gl

        hyperpriviliged
        ---------------
        htstate

   Issue: 1. Confusion about tpc, tnpc
	  2. %tl ?
	  3. %tpc is now the VA of the "ta" instr . OK?

 **********************************************************************/

#define MY_PASS setx 0x82000, %r1, %r2; jmp %r2;nop
#define MY_FAIL setx 0x82020, %r1, %r2; jmp %r2;nop

#include "err_defines.h"

#define ASI_LSU_CTL_REG 0x45
#define ASI_SPARC_ERROR_EN_REG 0x4b
#define  L2_BANK_ADDR       0x40

#define ASI_DMMU_VA_WATCHPOINT  0x58
#define ASI_DMMU_VA_WATCHPOINT_VA  0x38

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

check_wmr:
        setx    0x9800000810, %i5, %i1
        ldx     [%i1], %i2
        setx    0xfffffffffffffffd, %i5, %o1 ! <1> = WMR
        or      %i2, %o1, %o2
        setx    0xffffffffffffffff, %i5, %o1
        cmp     %o2, %o1
        be      wmr
        nop

change_regs_values:
        setx red_data, %i5, %g7
       	ldx [%g7], %g1 !! set an integer register

	wrpr	0xff, %g0, %tt
        wrpr    0xff, %g0, %tl
        wrpr    0xff, %g0, %gl

        setx    0xffffffffffffffff, %i5, %i1
        wrhpr   %i1, %g0, %htstate

        setx    0xffffffffffffffff, %i5, %g1
        wr      %g1, %g0, %tick_cmpr

        setx    0xffffffffffffffff, %i5, %g1
        set     ASI_DMMU_VA_WATCHPOINT_VA, %g2
        stxa    %g1, [%g2]ASI_DMMU_VA_WATCHPOINT
        membar  0x40


gen_wrm_rst:
        nop !$EV  trig_pc_d(1, @VA(.RED_SEC0.gen_wrm_rst)) -> warmrst()
rst_nxt:
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
	nop

tpc_ch:
        setx    rst_nxt, %g5, %g3
!	setx	trig_reset, %g5, %g3   ! OK ?
        sub     %g1, %g3, %g4
!        brnz    %g4, bad_end
        nop

tnpc_ch:
        add     %g3, 4, %g3
        sub     %g2, %g3, %g4
!        brnz    %g4, bad_end
        nop

tt_ch:
        rdpr    %tt, %g1
        set     0x1, %g2	! WMR
        sub     %g1, %g2, %g3
        brnz    %g3, bad_end
        nop

tl_ch:
        rdpr    %tl, %g1
        set     0x6, %g2
        sub     %g1, %g2, %g3
        brnz    %g3, bad_end
        nop

gl_ch:
        rdpr    %gl, %g1
        set     0x3, %g2
        sub     %g1, %g2, %g3
        brnz    %g3, bad_end
        nop

htstate_ch:
        rdhpr   %htstate, %l1
        setx    0x24, %g3, %g2          
                !HTSTATE.RED<5>=HPSTAE.RED=1, HTSTATE.RED<2>=HPSTATE.HPRIV=1
        sub     %l1, %g2, %g3
        brnz    %g3, bad_end
        nop

tick_cmpr_ch:
        rd      %tick_cmpr, %g2
        setx    0xffffffffffffffff, %i5, %g1
        or      %g1, %g2, %g3
        sub     %g3, %g1, %g4
        brnz    %g4, bad_end
        nop

va_watchpoint_ch:
        setx    0x0000fffffffffff8, %i5, %g1
        set     ASI_DMMU_VA_WATCHPOINT_VA, %g2
        ldxa    [%g2]ASI_DMMU_VA_WATCHPOINT, %g3
        sub     %g1, %g3, %g4
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


